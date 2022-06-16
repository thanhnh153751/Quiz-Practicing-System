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
}
