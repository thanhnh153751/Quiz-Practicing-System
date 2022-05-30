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
public class AuthorizationDAO extends DBContext{
    public Account loginAuth(String email, String pass){
        String query = "Select * from Account where email = ? and password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
        } catch (Exception e) {
        }
        return null;
    }
}
