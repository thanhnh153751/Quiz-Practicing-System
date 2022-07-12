/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Lesson;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author THANH
 */
public class LessonDAO extends DBContext{
    public List<Lesson> loadLessonBySubject(int id) {//tải lên tất cả các lesson có trong 1 subject
        List<Lesson> loadLesson = new ArrayList<>();
        String query = "select l.* from Lesson l inner join [Subject] s on l.sid=s.id where s.id="+id;
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadLesson.add(new Lesson(rs.getInt("id"), rs.getInt("sid"), rs.getInt("type_id"), rs.getNString("name"), rs.getInt("status")));
            }
            return loadLesson;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return null;
    }
    
    public List<Lesson> ListOfLesson(int id) {//tải lên tất cả các Lesson có trong db
        List<Lesson> ListOfLesson = new ArrayList<>();
        String query = "  select l.*, ld.type from Subject s join Lesson l on s.id = l.sid join [Lesson_Type] ld on l.[type_id] = ld.id where s.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ListOfLesson.add(new Lesson(
                        rs.getInt("id"),
                        rs.getInt("sid"),
                        rs.getInt("type_id"),
                        rs.getString("name"),
                        rs.getInt("status"),
                        rs.getString("type")
                ));
            }
            return ListOfLesson;
        } catch (SQLException e) {
            System.out.println("\tOrderDAO5: " + e);
        }
        return null;
    }
        public void changestatus(int id, int status) {
        String query = "update Lesson set status = ? where id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            if (status == 0) {
                ps.setInt(1,1);

            }
            if (status == 1) {
                ps.setInt(1,0);

            }
            ps.setInt(2, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
        public List<Lesson> getListbyPage(List<Lesson> list, int start, int end) {

        List<Lesson> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    public static void main(String[] args) {
        LessonDAO dao = new LessonDAO();

    }
}
