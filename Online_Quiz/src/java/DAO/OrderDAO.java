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

    public List<Order> Order() {//tải lên tất cả các Order có trong db
        List<Order> Order = new ArrayList<>();
        String query = "select id, registration_time, [subject], [package], total_cost, [status], valid_from, valid_to from [Order] ";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
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
    


   



/**
 *
 * @author THANH
 */



    public static void main(String[] args) {
//        OrderDAO o = new OrderDAO();
//        Account c = new Account(1, "nguyen huu", "thsdf@dfd.com", "04545", "123456", true, 0, "");
//        Subject s = new Subject(1, 1, "", "lap trin", "tag", "thasd", "sadasd", 123, 0321, 1);
//        Package p = new Package(1, 1, "unlimit",5 , 0, 3434, 1, "casdasd");
//        
//        o.addOrder(c, s, p);
    }
}

