/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Order;
import Model.Subject;
import Model.Package;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static jdk.nashorn.internal.runtime.Debug.id;

import Model.Account;
import Model.Subject;
import Model.Package;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PREDATOR
 */
public class OrderDAO extends DBContext {

    public List<Order> loadAllOrder() {//tải lên tất cả các Order có trong db
        List<Order> loadAllOrder = new ArrayList<>();
        String query = "Select top 3 * from [Order]";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                loadAllOrder.add(new Order(
                        rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getString("email"),
                        rs.getDate("registration_time"),
                        rs.getString("subject"),
                        rs.getString("Package"),
                        rs.getInt("total_cost"),
                        rs.getInt("status"),
                        rs.getDate("valid_from"),
                        rs.getDate("valid_to"),
                        rs.getString("last_update_by"),
                        rs.getString("thumbnail")
                ));
            }
            return loadAllOrder;
        } catch (SQLException e) {
            System.out.println("\tOrderDAO5: " + e);
        }
        return null;
    }

    public Order getOrderByID(int id) {
        String query = "select * from [Order]\n"
                + "where aid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(
                        rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getString("email"),
                        rs.getDate("registration_time"),
                        rs.getString("subject"),
                        rs.getString("Package"),
                        rs.getInt("total_cost"),
                        rs.getInt("status"),
                        rs.getDate("valid_from"),
                        rs.getDate("valid_to"),
                        rs.getString("last_update_by"),
                        rs.getString("thumbnail"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Order> Order(int aid) {//tải lên tất cả các Order có trong db
        List<Order> Order = new ArrayList<>();
        String query = "select id, registration_time, [subject], [package], total_cost, [status], valid_from, valid_to from [Order] where aid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order.add(new Order(
                        rs.getInt("id"),
                        rs.getDate("registration_time"),
                        rs.getString("subject"),
                        rs.getString("package"),
                        rs.getInt("total_cost"),
                        rs.getInt("status"),
                        rs.getDate("valid_from"),
                        rs.getDate("valid_to")
                ));
            }
            return Order;
        } catch (SQLException e) {
            System.out.println("\tOrderDAO5: " + e);
        }
        return null;
    }
    
        public void RemoveOrder(int id) {
        
        String query = "Delete from Order_Details where oid ="+id;
        String query2 = "Delete from [Order] where id ="+id;
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.executeUpdate();
            PreparedStatement ps1 = connection.prepareStatement(query2);
            ps1.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("\tOrderDAO5: " + e);
        }
     
    }

    public List<Order> searchBySubject(String txtSearch) {
        List<Order> Order = new ArrayList<>();
        String query = "select * from [Order]\n"
                + "where [subject] like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order.add(new Order(
                        rs.getInt("id"),
                        rs.getDate("registration_time"),
                        rs.getString("subject"),
                        rs.getString("package"),
                        rs.getInt("total_cost"),
                        rs.getInt("status"),
                        rs.getDate("valid_from"),
                        rs.getDate("valid_to")
                ));
            }

        } catch (SQLException e) {
            System.out.println("\tOrderDAO5: " + e);
        }
        return Order;
    }
    
    
    


   


}

