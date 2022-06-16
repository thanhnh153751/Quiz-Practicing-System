/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Package;

/**
 *
 * @author THANH
 */
public class PackageDAO extends DBContext {

    public List<Package> loadPackagesByCid(int sid) {
        List<Package> packages = new ArrayList<>();
        String query = "select * from Package where sid=" + sid;
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                packages.add(new Model.Package(
                        rs.getInt("id"),
                        rs.getInt("sid"),
                        rs.getNString("name"),
                        rs.getInt("duration"),
                        rs.getInt("list_price"),
                        rs.getInt("sale_price"),
                        rs.getInt("status"),
                        rs.getNString("description")));
            }
            return packages;
        } catch (SQLException e) {
            System.out.println("\tPostDAO1: " + e);
        }
        return null;
    }

    public Package loadPackagesByPid(int pid) {
        Package packages = new Package();
        String query = "select * from Package where id=" + pid;
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                packages = new Model.Package(
                        rs.getInt("id"),
                        rs.getInt("sid"),
                        rs.getNString("name"),
                        rs.getInt("duration"),
                        rs.getInt("list_price"),
                        rs.getInt("sale_price"),
                        rs.getInt("status"),
                        rs.getNString("description"));
            }
            
            return packages;
        } catch (SQLException e) {
            System.out.println("\tPostDAO1: " + e);
        }
        return null;
    }

    public static void main(String[] args) {
//        PackageDAO d = new PackageDAO();
//        List<Package> packages = d.loadPackagesByCid(1);
//        for (Package aPackage : packages) {
//            System.out.println(aPackage.getName());
//        }
    }
}
