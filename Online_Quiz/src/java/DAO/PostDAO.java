/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Post;
import Model.PostCategory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hongd
 */
public class PostDAO extends DBContext{
    public List<PostCategory> loadPostCategory(){
        List<PostCategory> postcategory = new ArrayList<>();
        String query = "Select * from Post_Category";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {     
                postcategory.add(new PostCategory(
                        rs.getInt(1), 
                        rs.getNString(2)));
                return postcategory;
            }
        } catch (SQLException e) {
            System.out.println("\tPostDAO: "+e);
        }
        return null;
    }
    
    public List<Post> loadPost(){
        List<Post> loadPost = new ArrayList<>();
        String query = "Select * from Post";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                loadPost.add(new Post(
                        rs.getInt(1), 
                        rs.getInt(2), 
                        rs.getNString(3), 
                        rs.getNString(4), 
                        rs.getNString(5), 
                        rs.getNString(6), 
                        rs.getDate(7), 
                        rs.getNString(8),
                        rs.getString(9)));
            }
            return loadPost;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: "+e);
        }
        return null;
    }
    
    public Post loadPostDetails(int id){
        Post post = new Post();
        String query = "Select * from Post where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {                
                return new Post(
                        rs.getInt(1), 
                        rs.getInt(2), 
                        rs.getNString(3), 
                        rs.getNString(4), 
                        rs.getNString(5), 
                        rs.getNString(6), 
                        rs.getDate(7), 
                        rs.getNString(8),
                        rs.getString(9));
            }
        } catch (SQLException e) {
            System.out.println("\tPostDAO: "+e);
        }
        return null;
    }
    
    public List<Post> searchPost(String search){
        List<Post> searchResult = new ArrayList<>();
        String query = "Select * from post where post_title = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, search);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                searchResult.add(new Post(
                        rs.getInt(1), 
                        rs.getInt(2), 
                        rs.getNString(3), 
                        rs.getNString(4), 
                        rs.getNString(5), 
                        rs.getNString(6), 
                        rs.getDate(7), 
                        rs.getNString(8),
                        rs.getString(9)));
            }
            return  searchResult;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: "+e);
        }
        return searchResult;
    }
}
