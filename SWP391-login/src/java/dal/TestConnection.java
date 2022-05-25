package dal;


import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hongd
 */
public class TestConnection extends DBContext{
    public void testConnection(){
        String query = "Select * from Account";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                System.out.println("Success");
            }
        } catch (SQLException e) {
        }
//        System.out.println("Fail!");
    }
    
    public static void main(String[] args) {
        TestConnection ts = new TestConnection();
        ts.testConnection();
    }
}
