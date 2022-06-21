/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.SubSubjectCategory;
import Model.Subject;
import Model.SubjectCategory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author THANH
 */
public class SubjectDAO extends DBContext {

    public List<Subject> loadAllSubject() {//tải lên tất cả các subject có trong db
        List<Subject> loadSubject = new ArrayList<>();
        String query = "select s.*,p.list_price,p.sale_price from [Subject] s inner join Package p on s.id = p.sid";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubject.add(new Subject(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("thumbnail"),
                        rs.getNString("title"),
                        rs.getNString("tagline"),                     
                        rs.getNString("contact"),
                        rs.getNString("description"),
                        rs.getDouble("list_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("status")));
            }
            return loadSubject;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return null;
    }

    public int getTotalSubject() {
        String query = "select count(*) from Subject";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return 0;
    }

    public List<Subject> pagingSubject(int index) {
        List<Subject> loadSubject = new ArrayList<>();
        String query = "select s.*,p.list_price,p.sale_price from [Subject] s inner join Package p on s.id = p.sid where p.name like 'unlimited' order by id asc offset ? rows fetch next 8 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (index-1)*8);//8 items/page
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubject.add(new Subject(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("thumbnail"),
                        rs.getNString("title"),
                        rs.getNString("tagline"),                     
                        rs.getNString("contact"),
                        rs.getNString("description"),
                        rs.getDouble("list_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("status")));
            }

        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return loadSubject;
    }

    public List<Subject> loadLastSubject() {//tải lên 3 subject mới nhất có trong db
        List<Subject> loadSubject = new ArrayList<>();
        String query = "select top 3 s.*,p.list_price,p.sale_price from [Subject] s inner join Package p on s.id = p.sid Order by id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubject.add(new Subject(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("thumbnail"),
                        rs.getNString("title"),
                        rs.getNString("tagline"),                     
                        rs.getNString("contact"),
                        rs.getNString("description"),
                        rs.getDouble("list_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("status")));
            }
            return loadSubject;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return null;
    }
    public List<Subject> loadFeaturedSubject() {//tải lên 6 subject mới nhất có trong db
        List<Subject> loadSubject = new ArrayList<>();
        String query = "select top 6 s.*,p.list_price,p.sale_price from [Subject] s inner join Package p on s.id = p.sid Order by id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubject.add(new Subject(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("thumbnail"),
                        rs.getNString("title"),
                        rs.getNString("tagline"),                     
                        rs.getNString("contact"),
                        rs.getNString("description"),
                        rs.getDouble("list_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("status")));
            }
            return loadSubject;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return null;
    }

    public Subject loadSubjectDetail(int id) {//tải lên subjecte detail có trong db
        Subject loadSubject = new Subject();
        String query = "select s.*,p.list_price,p.sale_price from [Subject] s inner join Package p on s.id = p.sid where p.name like 'unlimited' and s.id=" + id;
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubject = (new Subject(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("thumbnail"),
                        rs.getNString("title"),
                        rs.getNString("tagline"),                     
                        rs.getNString("contact"),
                        rs.getNString("description"),
                        rs.getDouble("list_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("status")));
            }
            return loadSubject;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return null;
    }

    public List<SubjectCategory> loadAllSubjectCategory() {//tải lên tất cả các subject có trong db
        List<SubjectCategory> loadSubjectCategory = new ArrayList<>();
        String query = "Select * from Subject_Category";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubjectCategory.add(new SubjectCategory(
                        rs.getInt(1),
                        rs.getNString(2)));
            }
            return loadSubjectCategory;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return null;
    }
    
    public List<SubSubjectCategory> loadAllSubSubjectCategory() {//tải lên tất cả các Subsubject có trong db
        List<SubSubjectCategory> loadSubSubjectCategory = new ArrayList<>();
        String query = "select sub.* from [Subject_Sub_Category] sub inner join [Subject_Category] s on s.id=sub.cid";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubSubjectCategory.add(new SubSubjectCategory(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("name")));
            }
            return loadSubSubjectCategory;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return null;
    }

    public List<Subject> loadSubjectOnHome() {//tải lên tất cả 8 subject có trong db vào trang home
        List<Subject> loadSubject = new ArrayList<>();
        String query = "select top 8 s.*,p.list_price,p.sale_price from [Subject] s inner join Package p on s.id = p.sid";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubject.add(new Subject(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("thumbnail"),
                        rs.getNString("title"),
                        rs.getNString("tagline"),                     
                        rs.getNString("contact"),
                        rs.getNString("description"),
                        rs.getDouble("list_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("status")));
            }
            return loadSubject;
        } catch (SQLException e) {
            System.out.println("\tSubjectDAO: " + e);
        }
        return null;
    }

    public List<Subject> getListByPage(List<Subject> list, int start, int end) {
        ArrayList<Subject> items = new ArrayList<>();
        for (int i = start; i < end; i++) {
            items.add(list.get(i));
        }
        return items;
    }

    public List<Subject> getListSubjectBySearch(String key, int[] subjectId, String[] featured) {
        List<Subject> list = new ArrayList<>();
        String sql = "select s.*,sc.name ,p.list_price,p.sale_price from Subject s inner join Subject_Sub_Category sc on s.cid = sc.id inner join Package p on s.id = p.sid ";
        if (key != null || (subjectId != null) || featured != null) {
            sql += " where (p.name like 'unlimited') and";
            if (subjectId != null) {
                for (int i = 0; i < subjectId.length; i++) {
                    if (i == 0) {
                        sql += "(";
                    }
                    sql += "s.cid=" + subjectId[i];
                    if (i != subjectId.length - 1) {
                        sql += " or ";
                    } else {

                        sql += ") and ";
                    }
                }
            }
            if (featured != null) {
                for (int i = 0; i < featured.length; i++) {
                    if (i == 0) {
                        sql += "(";
                    }
                    sql += "s.description like N'%" + featured[i] + "%'";
                    if (i != featured.length - 1) {
                        sql += " or ";
                    } else {
                        sql += ") and ";
                    }
                }
            }

            if (key !=  "" || key != null) {
                sql += "(s.title like ? or s.tagline like ? or s.contact like ? or s.[description] like ? or sc.[name] like ?)";
            }

        }

        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, "%" + key + "%");
            st.setNString(2, "%" + key + "%");
            st.setNString(3, "%" + key + "%");
            st.setNString(4, "%" + key + "%");
            st.setNString(5, "%" + key + "%");
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                Subject p = new Subject(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("thumbnail"),
                        rs.getNString("title"),
                        rs.getNString("tagline"),                     
                        rs.getNString("contact"),
                        rs.getNString("description"),
                        rs.getDouble("list_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("status"));
                
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    

    public static void main(String[] args) {
        SubjectDAO d = new SubjectDAO();
//        int[] subjectId = new int[]{5,6};
//        String[] featured = new String[]{"demo"};
//        int[] subjectId = {1};
//        String[] featured = {};
       List<Subject> list = d.loadSubjectOnHome();
  //     System.out.println("??????????????????????");
        //System.out.println(list.size());
//        for (Subject s : list) {
//            
//            System.out.println(s.getTitle());
//        }
        

        
    }

}
