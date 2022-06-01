/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author hongd
 */
public class AccountDAO extends DBContext {

    public Account login(String email, String password) {
        String query = "select * from Account\n"
                + "where email = ?\n"
                + "and password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
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

    public Account checkAccountExist(String email) {
        String query = "select * from Account\n"
                + "where [email] = ?\n";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
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

    public void Register(String fullname, String email, String phone, String password, boolean gender) {
        String query = "insert into Account(fullname,email, phone,password,gender)\n"
                + "values(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, password);
            ps.setBoolean(5, gender);
            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    public void ChangeStatus(String email) {
        String query = "update Account set status = 1 where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void EditProfile(String fullname, String email, String phone, boolean gender, int id) {
        String query = "update Account set fullname = ?, email = ?, phone = ?, gender = ? where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setBoolean(4, gender);
            ps.setInt(5, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
}
