/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
        String query = "Select * from Subject";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubject.add(new Subject(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getNString(3),
                        rs.getNString(4),
                        rs.getNString(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getNString(8),
                        rs.getNString(9),
                        rs.getInt(10)));
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

    public List<Subject> loadSubjectOnHome() {//tải lên tất cả 8 subject có trong db vào trang home
        List<Subject> loadSubject = new ArrayList<>();
        String query = "Select top 8 * from Subject";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadSubject.add(new Subject(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getNString(3),
                        rs.getNString(4),
                        rs.getNString(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getNString(8),
                        rs.getNString(9),
                        rs.getInt(10)));
            }
            return loadSubject;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
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

    public List<Subject> getListSubjectBySearch(String key,int[] subjectId,String[] featured) {
        List<Subject> list = new ArrayList<>();
        String sql = "select s.* from Subject s inner join Subject_Category sc on s.cid = sc.id";
        if(key != null || (subjectId != null) || featured != null){
            sql+=" where ";
        if(subjectId != null)    
        for (int i = 0; i < subjectId.length; i++) {
                if(i==0) sql+="(";
                sql+="s.cid="+subjectId[i];
                if(i!=subjectId.length-1 ){
                    sql+=" or ";
                }else{
                    
                    sql+=") and ";
                }
            }
        if(featured != null)
        for (int i = 0; i < featured.length; i++) {
                if(i==0) sql+="(";
                sql+="s.tagline like N'%"+featured[i]+"%'";                
                if(i!=featured.length-1 ){
                    sql+=" or ";
                }else{
                    sql+=") and ";
                }
            }
        
        if (key != "" || key != null) {         
            sql += "(title like ? or tagline like ? or contact like ? or [description] like ? or [name] like ?)";
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
                
                Subject p = new Subject(rs.getNString("thumbnail"), rs.getNString("title"), rs.getNString("tagline"), rs.getDouble("origin_price"), rs.getDouble("sale_price"), rs.getNString("contact"), rs.getNString("description"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
        public static void main(String[] args) {
        SubjectDAO d = new SubjectDAO();
        int[] subjectId = new int[]{5,6};
        String[] featured = new String[]{"demo"};
        List<Subject> list = d.getListSubjectBySearch("điện", null, null);
        for (Subject s : list) {
            System.out.println(s.getTitle());
        }

//        System.out.println(d.getMaxId());
    }

    
    

}
