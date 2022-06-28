/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    
        public List<Account> loadAccountBySearch(String key) {
        List<Account> listAcc = new ArrayList<>();
        String query = "select * from Account where fullname like ? or email like ? or phone like ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setNString(1, "%" + key + "%");
            st.setNString(2, "%" + key + "%");
            st.setNString(3, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listAcc.add(new Account(rs.getInt("id"),
                        rs.getNString("fullname"),
                        rs.getNString("email"),
                        rs.getNString("phone"),
                        (rs.getInt("gender") == 1) ? true : false ,
                        rs.getInt("status")));

            }
            return listAcc;
        } catch (SQLException e) {
            System.out.println("\tPostDAO1: " + e);
        }
        return null;
    }

    public void Register(String fullname, String email, String phone, String password, boolean gender, String avatar) {
        String query = "insert into Account(fullname,email, phone,password,gender,avatar)\n"
                + "values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, password);
            ps.setBoolean(5, gender);
            ps.setString(6, avatar);
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
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
//        dao.Register("Abc", "abc", "12345", "1245", true, "a");
        List<Account> listAcc = dao.loadAccountBySearch("nguyen");
        for (Account account : listAcc) {
//            System.out.println(account.getFullname());
        }
    }
}

