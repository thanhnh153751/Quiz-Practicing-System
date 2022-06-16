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
public class PostDAO extends DBContext {

    public List<PostCategory> loadPostCategory() {
        List<PostCategory> postcategory = new ArrayList<>();
        String query = "Select * from Post_Category";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                postcategory.add(new PostCategory(
                        rs.getInt(1),
                        rs.getNString(2)));

            }
            return postcategory;
        } catch (SQLException e) {
            System.out.println("\tPostDAO1: " + e);
        }
        return null;
    }

    public List<Post> loadPost() {
        List<Post> loadPost = new ArrayList<>();
        String query = "Select * from Post";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loadPost.add(new Post(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("post_title"),
                        rs.getNString("biref"),
                        rs.getNString("details"),
                        rs.getNString("author"),
                        rs.getDate("update_date"),
                        rs.getNString("contact"),
                        rs.getString("thumbnail"),
                        rs.getInt("status")));
            }
            return loadPost;
        } catch (SQLException e) {
            System.out.println("\tPostDAO2: " + e);
        }
        return null;
    }

    public Post loadPostDetails(int id) {
        Post post = new Post();
        String query = "Select * from Post where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Post(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("post_title"),
                        rs.getNString("biref"),
                        rs.getNString("details"),
                        rs.getNString("author"),
                        rs.getDate("update_date"),
                        rs.getNString("contact"),
                        rs.getString("thumbnail"),
                        rs.getInt("status"));
            }
        } catch (SQLException e) {
            System.out.println("\tPostDAO3: " + e);
        }
        return null;
    }

    public List<Post> searchPost(String search, String category_raw) {
        List<Post> searchResult = new ArrayList<>();

        String query = "Select * from post where";
        if (search != null) {
            query += " post_title like ? \n";
//            if (category_raw != null) {
//                query += "";
//            }
        }
        if (category_raw != null) {
            query += "and cid = ? ";
        }
//        query += "order by id desc offset ? \n"
//                + "rows fetch next 3 rows only";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            if (search != null) {
                ps.setNString(1, "%" + search + "%");

            }
            if (category_raw != null) {
                int category = Integer.parseInt(category_raw);
                ps.setInt(2, category);
            }
//            ps.setInt(3, next);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                searchResult.add(new Post(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("post_title"),
                        rs.getNString("biref"),
                        rs.getNString("details"),
                        rs.getNString("author"),
                        rs.getDate("update_date"),
                        rs.getNString("contact"),
                        rs.getString("thumbnail"),
                        rs.getInt("status")));
            }
            return searchResult;
        } catch (SQLException e) {
            System.out.println("\tPostDAO4: " + e);
        }
        return null;
    }

    public List<Post> loadAllPost() {//tải lên tất cả các Post có trong db
        List<Post> loadAllPost = new ArrayList<>();
        String query = "Select top 8 * from Post";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                loadAllPost.add(new Post(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("post_title"),
                        rs.getNString("biref"),
                        rs.getNString("details"),
                        rs.getNString("author"),
                        rs.getDate("update_date"),
                        rs.getNString("contact"),
                        rs.getString("thumbnail"),
                        rs.getInt("status")
                ));
            }
            return loadAllPost;
        } catch (SQLException e) {
            System.out.println("\tPostDAO5: " + e);
        }
        return null;
    }

    public List<Post> loadLatestPost() {//tải lên top 3 các Post mới nhất dựa theo date trong db
        List<Post> loadLatestPost = new ArrayList<>();
        String query = "select top 3 * from Post order by update_date desc";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                loadLatestPost.add(new Post(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("post_title"),
                        rs.getNString("biref"),
                        rs.getNString("details"),
                        rs.getNString("author"),
                        rs.getDate("update_date"),
                        rs.getNString("contact"),
                        rs.getString("thumbnail"),
                        rs.getInt("status")
                ));
            }
            return loadLatestPost;
        } catch (SQLException e) {
            System.out.println("\tPostDAO6: " + e);
        }
        return null;
    }

    public List<Post> paging(int check) {
        List<Post> paging = new ArrayList<>();
        String query = "Select * from Post order by id desc offset ? rows fetch next 5 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (check - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                paging.add(new Post(
                        rs.getInt("id"),
                        rs.getInt("cid"),
                        rs.getNString("post_title"),
                        rs.getNString("biref"),
                        rs.getNString("details"),
                        rs.getNString("author"),
                        rs.getDate("update_date"),
                        rs.getNString("contact"),
                        rs.getString("thumbnail"),
                        rs.getInt("status")));
            }
            return paging;
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return null;
    }

    public int countPost() {
        String query = "Select COUNT(*) from Post";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("\tPostDAO: " + e);
        }
        return 0;
    }

    public void inputPost(String post_title, String bief, String details, String author, String date, String contact, String category, int status) {
        String query = "insert into Post(cid,post_title, biref, details,author,update_date,contact,  status)\n"
                + "values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, category);

            ps.setString(2, post_title);
            ps.setString(3, bief);
            ps.setString(4, details);
            ps.setString(5, author);

            ps.setString(6, date);

            ps.setString(7, contact);

            ps.setInt(8, status);

            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    public void EditPost(String post_title, String bief, String details, String category, int status, int id) {
        String query = "update Post set cid=?, post_title = ?, biref = ?, details = ?, status = ? where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, category);
            ps.setString(2, post_title);
            ps.setString(3, bief);
            ps.setString(4, details);
//            ps.setString(4, thumbnail);
            ps.setInt(5, status);
            ps.setInt(6, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void changestatus(int id, int status) {
        String query = "update Post set status = ? where id =?";
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

    public static void main(String[] args) {
        PostDAO dao = new PostDAO();
        System.out.println(dao.loadPostCategory());
    }
}
