/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Subject;
import Model.Package;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author THANH
 */
public class OrderDAO extends DBContext {

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
    public static void main(String[] args) {
//        OrderDAO o = new OrderDAO();
//        Account c = new Account(1, "nguyen huu", "thsdf@dfd.com", "04545", "123456", true, 0, "");
//        Subject s = new Subject(1, 1, "", "lap trin", "tag", "thasd", "sadasd", 123, 0321, 1);
//        Package p = new Package(1, 1, "unlimit",5 , 0, 3434, 1, "casdasd");
//        
//        o.addOrder(c, s, p);
    }
}
