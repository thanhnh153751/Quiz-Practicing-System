/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author THANH
 */
public class UserPermissionDAO extends DBContext{
    public void updateRoleCourseContent(int accId,boolean status) {
        String sql = "UPDATE User_Permission SET licensed=?  WHERE account_id="+accId;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,(status) ? 1 : 0 );  
            System.out.println(sql);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
//    public int getStatusRole1Acc(int aid) {
//        String query = "select licensed from User_Permission where account_id=? and permission_id=1";
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setInt(1, aid);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                return rs.getInt("licensed");
//            }
//
//        } catch (SQLException e) {
//            System.out.println("\tPostDAO: " + e);
//        }
//        return 0;
//    }
    
//    public static void main(String[] args) {
//        UserPermissionDAO d = new UserPermissionDAO();
//        System.out.println(d.getStatusRole1Acc(2));
//    }
    
    
}
