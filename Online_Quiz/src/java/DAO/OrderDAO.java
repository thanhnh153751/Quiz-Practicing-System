/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Order;
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

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.print(dao.searchBySubject("%#%"));
    }



/**
 *
 * @author THANH
 */


    public void addOrder(Account c, Subject s, Package p) {
//        LocalDate curDate = LocalDate.now();
//        String date = curDate.toString();
        try {
            //add order
            String sql = "INSERT INTO [Order] (aid, email, [subject], [package],total_cost)\n"
                    + "VALUES (?, ?, ?, ?,?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
//            st.setString(2, date);
            st.setNString(2, c.getEmail());
            st.setNString(3, s.getTitle());
            st.setNString(4, p.getName());
            st.setInt(5, (p.getSale_price() != 0) ? p.getSale_price() : p.getList_price());
            st.executeUpdate();
            //lay id cua order vua add
            String sql1 = "select top 1 id from [Order] order by id  desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add bang OrderDetail
            if (rs.next()) {
                int oid = rs.getInt("id");

                String sql2 = "INSERT INTO [Order_Details] (oid, [subject], package_id, account_id)\n"
                        + "VALUES (?, ?, ?, ?);";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, oid);
                st2.setNString(2, s.getTitle());
                st2.setInt(3, p.getId());
                st2.setInt(4, c.getId());
                st2.executeUpdate();
            }

        } catch (SQLException e) {

        }
    }

}
