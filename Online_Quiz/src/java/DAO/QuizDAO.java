/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Answer;
import Model.Question;
import Model.Quiz;
import Model.QuizTake;
import Model.QuizTakeDetails;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hongd
 */
public class QuizDAO extends DBContext {

    public List<Quiz> getAll() {
        String query = "Select * from Quiz";
        List<Quiz> lists = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lists.add(new Quiz(rs.getInt("id"),
                        rs.getInt("lid"),
                        rs.getNString("quiz_name"),
                        rs.getInt("total_score"),
                        rs.getInt("level"),
                        rs.getFloat("passrate"),
                        rs.getInt("type"),
                        rs.getLong("duration")));
            }
            return lists;
        } catch (SQLException e) {
            System.out.println("\t[QuizDAO]-getAll: " + e);
        }
        return null;
    }

    public Quiz getQuiz(int qid) {
        String query = "Select * from Quiz where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, qid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Quiz(rs.getInt("id"),
                        rs.getInt("lid"),
                        rs.getNString("quiz_name"),
                        rs.getInt("total_score"),
                        rs.getInt("level"),
                        rs.getFloat("passrate"),
                        rs.getInt("type"),
                        rs.getLong("duration"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Question> getQuestionList(int quiz_id) {
        String query = "Select * from Question where quiz_id = ?";
        List<Question> lists = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, quiz_id);
//            ps.setInt(2, ques_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lists.add(new Question(rs.getInt("id"),
                        rs.getInt("quiz_id"),
                        rs.getNString("question_content"),
                        rs.getString("img_link"),
                        rs.getInt("score"),
                        rs.getString("explantion")));
            }
            return lists;
        } catch (SQLException e) {
            System.out.println("\t[QuizDAO]-getQuestionList: " + e);
        }
        return null;
    }

    public List<Answer> getAnswerList(int quiz_id, int ques_id) {
        String query = "Select * from Answer where quiz_id = ? and ques_id =?";
        List<Answer> lists = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, quiz_id);
            ps.setInt(2, ques_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lists.add(new Answer(rs.getInt("id"),
                        rs.getInt("quiz_id"),
                        rs.getInt("ques_id"),
                        rs.getNString("answer"),
                        rs.getBoolean("correct")));
            }
            return lists;
        } catch (SQLException e) {
            System.out.println("\t[QuizDAO]-getAnswerList: " + e);
        }
        return null;
    }

    public List<Answer> getCorrectAnswers(int quiz_id, int ques_id) {
        String query = "Select * from Answer where quiz_id = ? and ques_id =? and correct = 1";
        List<Answer> lists = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, quiz_id);
            ps.setInt(2, ques_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lists.add(new Answer(rs.getInt("id"),
                        rs.getInt("quiz_id"),
                        rs.getInt("ques_id"),
                        rs.getNString("answer"),
                        rs.getBoolean("correct")));
            }
            return lists;
        } catch (SQLException e) {
            System.out.println("\t[QuizDAO]-getCorrectAnswers: " + e);
        }
        return null;
    }

    public int getTotalQuestion(int quiz_id) {
        String query = "Select count(*) from Question where quiz_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, quiz_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("\t[QuizDAO]-ggetTotalQuestion: " + e);
        }
        return 0;
    }

    public QuizTake getQuizTakeById(int id) {
        String query = "Select * from quiz_take where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new QuizTake(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getInt("quiz_id"),
                        rs.getInt("status"),
                        rs.getInt("score"),
                        rs.getTimestamp("create_time"),
                        rs.getTimestamp("update_time"),
                        rs.getTimestamp("start_time"),
                        rs.getTimestamp("finish_time"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public QuizTake getQuizTake(int aid) {
        String query = "select top 1 *  from quiz_take where aid = ? order by create_time desc";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new QuizTake(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getInt("quiz_id"),
                        rs.getInt("status"),
                        rs.getInt("score"),
                        rs.getTimestamp("create_time"),
                        rs.getTimestamp("update_time"),
                        rs.getTimestamp("start_time"),
                        rs.getTimestamp("finish_time"));
            }
        } catch (SQLException e) {
            System.out.println("\t[QuizDAO]-getTotalQuestion: " + e);
        }
        return null;
    }

    public void createQuizTake(Account acc, int quiz_id) {
        final int status = 0;
        final int score = 0;
        String query = "Insert into quiz_take(aid,quiz_id,[status],score,create_time,update_time,start_time,finish_time)\n"
                + "Values(?,?,?,?,CURRENT_TIMESTAMP,?,CURRENT_TIMESTAMP,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, acc.getId());
            ps.setInt(2, quiz_id);
            ps.setInt(3, status);
            ps.setInt(4, score);
            ps.setDate(5, null);
            ps.setDate(6, null);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("\t[QuizDAO]-createQuizTake: " + e);
        }
    }

    public void createQuizTakeDetails(int take_id, int ques_id, int answer_id) {
        String query = "Insert into quiz_take_details(take_id,ques_id,answer_id,create_time, update_time)"
                + "Values (?,?,?,CURRENT_TIMESTAMP,null)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, take_id);
            ps.setInt(2, ques_id);
            ps.setInt(3, answer_id);
            ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("\t" + e);
        }
    }

    public void updateQuizTakeTime(Account acc, int quiz_id) {
        String query = "Update quiz_take "
                + "Set update_time = CURRENT_TIMESTAMP"
                + "Where aid = ? and quiz_id =? and [status] = 0";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, acc.getId());
            ps.setInt(2, quiz_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("\t[QuizDAO]-updateQuizTakeTime: " + e);
        }
    }

    public QuizTakeDetails getQtDetails(int take_id, int ques_id) {
        String query = "select * from quiz_take_details where take_id = ? and ques_id =?";
//        List<QuizTakeDetails> lists = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, take_id);
            ps.setInt(2, ques_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new QuizTakeDetails(rs.getInt("id"),
                        rs.getInt("take_id"),
                        rs.getInt("ques_id"),
                        rs.getInt("answer_id"),
                        rs.getTimestamp("create_time"),
                        rs.getTimestamp("update_time"));
            }
//            return lists;
        } catch (SQLException e) {
            System.out.println("getQtDetails" + e);
        }
        return null;
    }

    public boolean checkQtDetails(int take_id, int ques_id) {
        String query = "select * from quiz_take_details where take_id = ? and ques_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, take_id);
            ps.setInt(2, ques_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkQtDetails" + e);

        }
        return false;
    }

    public void updateQtDetails(int take_id, int ques_id, int choice_id) {
        String query = "Update quiz_take_details\n"
                + "Set answer_id =?, update_time = CURRENT_TIMESTAMP\n"
                + "Where take_id =? and ques_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, choice_id);
            ps.setInt(2, take_id);
            ps.setInt(3, ques_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateQtDetails" + e);

        }
    }

    public void submitQuiz(int take_id) {
        String query = "Update quiz_take\n"
                + "Set status = 1, finish_time = CURRENT_TIMESTAMP\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, take_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        QuizDAO qdao = new QuizDAO();
        Account a = new Account(2, "", "", "", "", true, 0, "");
        qdao.createQuizTake(a, 4);

//        List<Question> lists = qdao.getQuestionList(4);
//        for (Question list : lists) {
//            System.out.println(list.getImg_link());
//        }
//        List<Answer> lists = qdao.getAnswerList(4, 1);
//        for (Answer list : lists) {
//            System.out.println(list.getAnswer());
//        }
//        List<Answer> lists = qdao.getCorrectAnswers(4, 1);
//        for (Answer list : lists) {
//            System.out.println(list.getAnswer());
//        }
//        System.out.println(qdao.getTotalQuestion(4));
    }
}
