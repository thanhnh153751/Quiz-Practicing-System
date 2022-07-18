/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Action;
import Model.Permission;
import Model.UserPermission;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hongd
 */
public class AuthorizationDAO extends DBContext {

    public List<Permission> getListPermission() {
        List<Permission> permissions = new ArrayList<>();
        String query = "select * from Permission";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                permissions.add(new Permission(rs.getInt("id"), rs.getString("per_name"), null));
            }
            return permissions;
        } catch (SQLException e) {
            System.out.println("[AuthorizationDAO]: " + e);
        }
        return null;
    }

    public List<Action> getListAction() {
        List<Action> actions = new ArrayList<>();
        String query = "select * from [Action]";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                actions.add(new Action(rs.getInt("id"), rs.getString("action_name"), rs.getString("action_code")));
            }
            return actions;
        } catch (SQLException e) {
            System.out.println("[AuthorizationDAO]: " + e);
        }
        return null;
    }

    public List<Action> getActionByAccount(int id) {
        List<Action> actions = new ArrayList<>();
        String query = "select ac.id, ac.action_name, ac.action_code from Account as a1 \n"
                + "join User_Permission as up on a1.id = up.account_id\n"
                + "join Permission as p on up.permission_id = p.id\n"
                + "join Permission_Action as pa on p.id = pa.permission_id\n"
                + "join [Action] as ac on pa.action_id = ac.id\n"
                + "where a1.id = ? and up.licensed = 1 and pa.licensed = 1 ";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                actions.add(new Action(rs.getInt("id"), rs.getString("action_name"), rs.getString("action_code")));
            }
            return actions;
        } catch (SQLException e) {
            System.out.println("[AuthorizationDAO]: " + e);
        }
        return null;
    }
    
    public List<UserPermission> getListPermissionByAid(int aid) {
        List<UserPermission> permissions = new ArrayList<>();
        String query = "select  * from User_Permission where account_id ="+aid;
        try {
            PreparedStatement ps = connection.prepareStatement(query);         
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                permissions.add(new UserPermission(rs.getInt("id"),rs.getInt("account_id"),rs.getInt("permission_id"), rs.getBoolean("licensed")));
            }
            return permissions;
        } catch (SQLException e) {
            System.out.println("[AuthorizationDAO]: " + e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        AuthorizationDAO dao = new AuthorizationDAO();
        List<UserPermission> actions = dao.getListPermissionByAid(3);
        for (UserPermission action : actions) {
            System.out.println(action.getPermission_id()+"abc "+action.isLicensed());
        }
    }
}
