/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Model.Account;
import Model.TokenEmail;

/**
 *
 * @author Viet Dung
 */
public class DAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String email, String pass) {
        String query = "select * from Account where email = ? and [password] = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void changepass(String pass, String email) {
        String sql = "update Account set [password] = ? where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account checkAccount(String user) {
        String query = "select * from Account where email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addTokenEmail(String token, String email) {
        String query = "insert into Token_Management values (?,?,0,?)";
        Date date = new Date();
        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, token);
            ps.setLong(3, date.getTime() / 60000);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public TokenEmail getEmailToken(String token) {
        String query = "select * from Token_Management where token = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, token);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new TokenEmail(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getLong(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateTokenStatus(String token) {
        String query = "update Token_Management set status = 1 where token = ?";
        Date date = new Date();
        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, token);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        System.out.println(java.time.LocalDateTime.now());
    }
}
