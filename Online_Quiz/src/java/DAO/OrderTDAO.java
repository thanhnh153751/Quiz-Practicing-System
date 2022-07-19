/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 *
 * @author THANH
 */
public class OrderTDAO extends DBContext {

    public void addOrder(Account c, Subject s, Model.Package p) {
        LocalDate curDate = LocalDate.now();
        String curdate = curDate.toString();
        String afdate = "";
        if(p.getName().equalsIgnoreCase("3 months")){
            LocalDate afDate = curDate.plusMonths(3);
            afdate = afDate.toString();
        }
        if(p.getName().equalsIgnoreCase("6 months")){
            LocalDate afDate = curDate.plusMonths(6);
            afdate = afDate.toString();
        }
        if(p.getName().equalsIgnoreCase("unlimited")){
            
        }
        
        try {
            //add order
            String sql = "INSERT INTO [Order] (aid, email, [subject], [package],total_cost,valid_from,valid_to,registration_time)\n"
                    + "VALUES (?, ?, ?, ?,?,?,?,?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
//            st.setString(2, date);
            st.setNString(2, c.getEmail());
            st.setNString(3, s.getTitle());
            st.setNString(4, p.getName());
            st.setInt(5, (p.getSale_price() != 0) ? p.getSale_price() : p.getList_price());
            st.setNString(6, curdate);
            st.setNString(7, afdate);
            st.setNString(8, curdate);
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
      LocalDate curDate = LocalDate.now();
      LocalDate Date = curDate.plusMonths(3);
      String date = Date.toString();
      
        System.out.println(date);
        
    }

}
