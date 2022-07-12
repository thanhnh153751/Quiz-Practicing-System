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
import Model.Subject;

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

    public List<Package> ListOfPackage(int id) {
        List<Package> listofpackage = new ArrayList<>();
        String query = "  select p.id, p.[sid], p.[name], p.duration, p.list_price, p.sale_price, p.[status], p.[description] from Subject s join Package p on s.id = p.sid where s.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listofpackage.add(new Model.Package(
                        rs.getInt("id"),
                        rs.getInt("sid"),
                        rs.getNString("name"),
                        rs.getInt("duration"),
                        rs.getInt("list_price"),
                        rs.getInt("sale_price"),
                        rs.getInt("status"),
                        rs.getNString("description")));
            }
            return listofpackage;
        } catch (SQLException e) {
            System.out.println("\tPostDAO1: " + e);
        }
        return null;
    }

    public List<Subject> ListOfSubjectP() {

        List<Subject> listofsubjectp = new ArrayList<>();
        String query = " select id, title from Subject";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listofsubjectp.add(new Subject(
                        rs.getInt("id"),
                        rs.getString("title")
                ));
            }
            return listofsubjectp;
        } catch (Exception e) {
        }
        return null;
    }

    public void inputPackage(int sid, String name, int duration, int list_price, int sale_price, int status, String description) {
        String query = "insert into Package values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sid);
            ps.setString(2, name);
            ps.setInt(3, duration);
            ps.setInt(4, list_price);
            ps.setInt(5, sale_price);
            ps.setInt(6, status);
            ps.setString(7, description);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void editPackage(int id, int sid, String name, int duration, int list_price, int sale_price, int status, String description) {
        String query = "update Package set sid = ?,[name]=?,[duration]=?,[list_price]=?,[sale_price]=?,[status]=?,[description]=? where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sid);
            ps.setString(2, name);
            ps.setInt(3, duration);
            ps.setInt(4, list_price);
            ps.setInt(5, sale_price);
            ps.setInt(6, status);
            ps.setString(7, description);
            ps.setInt(8, id);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    public List<Package> getListbyPage(List<Package> list, int start, int end) {

        List<Package> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        PackageDAO dao = new PackageDAO();

        System.out.println(dao.ListOfSubjectP());
    }
}
