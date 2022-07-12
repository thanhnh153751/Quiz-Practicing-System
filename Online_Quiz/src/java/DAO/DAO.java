/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Model.Account;
import Model.Lesson;
import Model.Level;
import Model.Question;
import Model.Quiz;
import Model.Subject;
import Model.SubjectCategory;
import Model.SubjectDimension;
import Model.SubjectSubCategory;
import Model.TokenEmail;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Viet Dung
 */
public class DAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String email, String pass) {
        String query = "select * from Account where email = ? and [password] = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void changepass(String pass, String email) {
        String sql = "update Account set [password] = ? where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account checkAccount(String user) {
        String query = "select * from Account where email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addTokenEmail(String token, String email) {
        String query = "insert into Token_Management values (?,?,0,?)";
        Date date = new Date();
        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, token);
            ps.setLong(3, date.getTime() / 60000);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public TokenEmail getEmailToken(String token) {
        String query = "select * from Token_Management where token = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, token);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new TokenEmail(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getLong(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateTokenStatus(String token) {
        String query = "update Token_Management set status = 1 where token = ?";
        Date date = new Date();
        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, token);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Subject> getAllNew(int status, int cid, int scid, String search, int index) {
        List<Subject> list = new ArrayList<>();
        DAO dao = new DAO();
        String query = "select s.id,s.title,s.contact,s.status,sc.name,ssc.name, count(l.sid)'numoflesson' from Subject s \n"
                + "                                                 inner join Subject_Sub_Category ssc on s.cid = ssc.id \n"
                + "                               				 join Lesson l on s.id = l.sid\n"
                + "											 join Subject_Category sc on ssc.cid = sc.id\n"
                + "										     where s.status between ? and ?\n"
                + "                							 and sc.id between ? and ? \n"
                + "                							 and title like ?\n"
                + "											 and ssc.id between ? and ?\n"
                + "                							 group by s.id,s.title,s.contact,s.status,sc.name,ssc.name order by s.id offset ? rows fetch first 3 rows only";
        try {
            ps = connection.prepareStatement(query);
            if (status == -1) {
                ps.setInt(1, 0);
                ps.setInt(2, 1);
            } else {
                ps.setInt(1, status);
                ps.setInt(2, status);
            }

            if (cid == -1) {
                ps.setInt(3, 1);
                ps.setInt(4, dao.maxSubject());
            } else {
                ps.setInt(3, cid);
                ps.setInt(4, cid);
            }

            if (search == null) {
                ps.setString(5, "%" + "%");
            } else {
                ps.setString(5, "%" + search + "%");
            }
            if (scid == -1) {
                ps.setInt(6, 1);
                ps.setInt(7, 5);
            } else {
                ps.setInt(6, scid);
                ps.setInt(7, scid);
            }
            ps.setInt(8, (index - 1) * 3);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

//    public List<Subject> getaAllNew(int status, int cid, String search, int index) {
//        List<Subject> list = new ArrayList<>();
//        DAO dao = new DAO();
//        String query = "select s.id,s.title,s.contact,s.status,sc.name, count(l.sid)'numoflesson' from Subject s \n"
//                + "                                     inner join Subject_Category sc on s.cid = sc.id \n"
//                + "                				 join Lesson l on s.id = l.sid where s.status between ? and ?\n"
//                + "								 and sc.id between ? and ? \n"
//                + "								 and title like ?\n"
//                + "								 group by s.id,s.title,s.contact,s.status,sc.name order by s.id offset ? rows fetch first 3 rows only";
//        try {
//            ps = connection.prepareStatement(query);
//            if (status == -1) {
//                ps.setInt(1, 0);
//                ps.setInt(2, 1);
//            } else {
//                ps.setInt(1, status);
//                ps.setInt(2, status);
//            }
//
//            if (cid == -1) {
//                ps.setInt(3, 1);
//                ps.setInt(4, dao.maxSubject());
//            } else {
//                ps.setInt(3, cid);
//                ps.setInt(4, cid);
//            }
//            if (search == null) {
//                ps.setString(5, "%" + "%");
//            } else {
//                ps.setString(5, "%" + search + "%");
//            }
//            ps.setInt(6, (index - 1) * 3);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Subject(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getString(5),
//                        rs.getInt(6)
//                ));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
    public List<SubjectCategory> getAllCategory() {
        List<SubjectCategory> list = new ArrayList<>();
        String query = " select * from Subject_Category";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SubjectCategory(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<SubjectSubCategory> getAllSubCategory() {
        List<SubjectSubCategory> list = new ArrayList<>();
        String query = "select *  from Subject_Sub_Category";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SubjectSubCategory(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int totalPage(int status, int cid, String search) {

        String query = " select COUNT(*) from Subject  where status between ? and ?\n"
                + "                							 and cid between ? and ? \n"
                + "                							 and title like ?";
        int total = 0;
        DAO dao = new DAO();
        try {
            ps = connection.prepareStatement(query);
            if (status == -1) {
                ps.setInt(1, 0);
                ps.setInt(2, 1);
            } else {
                ps.setInt(1, status);
                ps.setInt(2, status);
            }

            if (cid == -1) {
                ps.setInt(3, 1);
                ps.setInt(4, dao.maxSubject());
            } else {
                ps.setInt(3, cid);
                ps.setInt(4, cid);
            }
            if (search == null) {
                ps.setString(5, "%" + "%");
            } else {
                ps.setString(5, "%" + search + "%");
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                int totalA = rs.getInt(1);
                total = totalA / 3;
                if (totalA % 3 != 0) {
                    total++;
                }
            }
        } catch (Exception e) {
        }
        return total;
    }

    public int totalPageNew(int status, int cid, int scid, String search) {

        String query = "select count(*) from Subject_Category sc \n"
                + "join Subject_Sub_Category ssc on sc.id = ssc.cid \n"
                + "join Subject s on ssc.id = s.cid \n"
                + "where s.status between ? and ?\n"
                + "and sc.id between ? and ?                                							  \n"
                + "and title like ?                              							 \n"
                + "and ssc.id between ? and ?";
        int total = 0;
        DAO dao = new DAO();
        try {
            ps = connection.prepareStatement(query);
            if (status == -1) {
                ps.setInt(1, 0);
                ps.setInt(2, 1);
            } else {
                ps.setInt(1, status);
                ps.setInt(2, status);
            }

            if (cid == -1) {
                ps.setInt(3, 1);
                ps.setInt(4, dao.maxSubject());
            } else {
                ps.setInt(3, cid);
                ps.setInt(4, cid);
            }

            if (search == null) {
                ps.setString(5, "%" + "%");
            } else {
                ps.setString(5, "%" + search + "%");
            }
            if (scid == -1) {
                ps.setInt(6, 1);
                ps.setInt(7, 5);
            } else {
                ps.setInt(6, scid);
                ps.setInt(7, scid);
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                int totalA = rs.getInt(1);
                total = totalA / 3;
                if (totalA % 3 != 0) {
                    total++;
                }
            }
        } catch (Exception e) {
        }
        return total;
    }

    public int maxSubject() {
        String query = "select COUNT(*) from Subject";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                int max = rs.getInt(1);
                return max;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

//    public List<Subject> getListByPage(List<Subject> list, int start, int end) {
//        ArrayList<Subject> arr = new ArrayList<>();
//        for (int i = start; i < end; i++) {
//            arr.add(list.get(i));
//        }
//        return arr;
//    }
    public List<Subject> getAllSimulation(int id, int lid, String quiz_name, int index) {
        List<Subject> list = new ArrayList<>();
        DAO dao = new DAO();
        String query = "select s.id,l.id, s.title,q.quiz_name, qul.[level],count(*)'numoffquess',q.duration,q.passrate from Subject s\n"
                + "                                join Lesson l on s.id = l.sid\n"
                + "                                join Lesson_Details ld on l.id = ld.lid\n"
                + "                               join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "                                join Quiz q on ql.quiz_id = q.id\n"
                + "                                join Quiz_Level qul on q.level = qul.id\n"
                + "                                join Question qus on q.id = qus.quiz_id where s.id between ? and ? and qul.id between ? and ? and q.quiz_name like ?\n"
                + "                               group by s.id, l.id, s.title,q.quiz_name, qul.[level],q.duration,q.passrate order by s.id offset ? rows fetch first 3 rows only";
        try {
            ps = connection.prepareStatement(query);

            if (id == -1) {
                ps.setInt(1, 1);
                ps.setInt(2, 7);
            } else {
                ps.setInt(1, id);
                ps.setInt(2, id);
            }
            if (lid == -1) {
                ps.setInt(3, 1);
                ps.setInt(4, 3);
            } else {
                ps.setInt(3, lid);
                ps.setInt(4, lid);
            }

            if (quiz_name == null) {
                ps.setString(5, "%" + "%");
            } else {
                ps.setString(5, "%" + quiz_name + "%");
            }
            ps.setInt(6, (index - 1) * 3);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Subject> getAllnewSimulation(int id) {
        List<Subject> list = new ArrayList<>();
        DAO dao = new DAO();
        String query = "           select s.id,l.id, s.title,q.quiz_name, qul.[level],count(*)'numoffquess',q.duration,q.passrate from Subject s\n"
                + "                join Lesson l on s.id = l.sid\n"
                + "                join Lesson_Details ld on l.id = ld.lid\n"
                + "                join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "                join Quiz q on ql.quiz_id = q.id\n"
                + "                join Quiz_Level qul on q.level = qul.id\n"
                + "                join Question qus on q.id = qus.quiz_id where l.id = ?\n"
                + "                group by s.id,l.id, s.title,q.quiz_name, qul.[level],q.duration,q.passrate";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Subject> getAllSimulationByname() {
        List<Subject> list = new ArrayList<>();
        String query = "select s.id, s.title from Subject s \n"
                + "join Lesson l on s.id = l.sid\n"
                + "join Lesson_Details ld on l.id = ld.lid\n"
                + "join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "join Quiz q on ql.quiz_id = q.id\n"
                + "join Quiz_Level qul on q.level = qul.id\n"
                + "join Question qus on q.id = qus.quiz_id\n"
                + "group by s.id, s.title";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Level> getAllSimulationBylevel() {
        List<Level> list = new ArrayList<>();
        String query = "select q.level,qul.level from Subject s \n"
                + "                join Lesson l on s.id = l.sid\n"
                + "                join Lesson_Details ld on l.id = ld.lid\n"
                + "                join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "                join Quiz q on ql.quiz_id = q.id\n"
                + "                join Quiz_Level qul on q.level = qul.id\n"
                + "                join Question qus on q.id = qus.quiz_id\n"
                + "                group by q.level,qul.level";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Level(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int totalPagesimulation(int id, int lid, String quiz_name) {

        String query = "				select count(*) from Subject s\n"
                + "                join Lesson l on s.id = l.sid\n"
                + "                join Lesson_Details ld on l.id = ld.lid\n"
                + "                join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "                join Quiz q on ql.quiz_id = q.id\n"
                + "                join Quiz_Level qul on q.level = qul.id\n"
                + "				where s.id between ? and ? and qul.id between ? and ? and q.quiz_name like ?";
        int total = 0;
        DAO dao = new DAO();
        try {
            ps = connection.prepareStatement(query);

            if (id == -1) {
                ps.setInt(1, 1);
                ps.setInt(2, 7);
            } else {
                ps.setInt(1, id);
                ps.setInt(2, id);
            }
            if (lid == -1) {
                ps.setInt(3, 1);
                ps.setInt(4, 3);
            } else {
                ps.setInt(3, lid);
                ps.setInt(4, lid);
            }
            if (quiz_name == null) {
                ps.setString(5, "%" + "%");
            } else {
                ps.setString(5, "%" + quiz_name + "%");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                int totalA = rs.getInt(1);
                total = totalA / 3;
                if (totalA % 3 != 0) {
                    total++;
                }
            }
        } catch (Exception e) {
        }
        return total;
    }

    public List<Subject> getAllSubjectDimension(int id, int index) {
        List<Subject> list = new ArrayList<>();
        String query = "select sd.id,sd.sid,sd.type,sd.name,sd.description from Subject s join Subject_Dimension sd on s.id = sd.sid where s.id= ?\n"
                + "order by s.id offset ? rows fetch first 3 rows only";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, (index - 1) * 3);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int totalSubjectDimension(int id) {

        String query = "select count(*) from Subject s join Subject_Dimension sd on s.id = sd.sid where s.id= ?";
        int total = 0;
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int totalA = rs.getInt(1);
                total = totalA / 3;
                if (totalA % 3 != 0) {
                    total++;
                }
            }
        } catch (Exception e) {
        }
        return total;
    }

    public List<Subject> getAllSubjectDimensionbyid(int id) {
        List<Subject> list = new ArrayList<>();
        String query = "select sd.id,sd.sid,sd.type,sd.name,sd.description from Subject s join Subject_Dimension sd on s.id = sd.sid \n"
                + "where sd.id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Subject getAllSubjectDimensionbypid(int id) {
        String query = "select sd.id,sd.sid,sd.type,sd.name,sd.description from Subject s join Subject_Dimension sd on s.id = sd.sid \n"
                + "where sd.id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Subject(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertDimension(int sid, String type, String name, String description) {
        String sql = "INSERT INTO [dbo].[Subject_Dimension]\n"
                + "           ([sid]\n"
                + "           ,[type]\n"
                + "           ,[name]\n"
                + "           ,[description])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, sid);
            ps.setString(2, type);
            ps.setString(3, name);
            ps.setString(4, description);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void editDimension(int id, int sid, String type, String name, String description) {
        String sql = "UPDATE [dbo].[Subject_Dimension]\n"
                + "   SET [sid] = ?\n"
                + "      ,[type] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE [id] = ?";
        try {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, sid);
            ps.setString(2, type);
            ps.setString(3, name);
            ps.setString(4, description);
            ps.setInt(5, id);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<Quiz> getAllQuizzest(int id, int qtid, String quiz_name, int index) {
        List<Quiz> list = new ArrayList<>();
        String query = "select q.id, q.quiz_name, s.title, qul.[level], count(*)'numoffquess',q.duration,q.passrate,qt.[type] from Subject s\n"
                + "                               join Lesson l on s.id = l.sid\n"
                + "                               join Lesson_Details ld on l.id = ld.lid\n"
                + "                               join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "                               join Quiz q on ql.quiz_id = q.id\n"
                + "                               join Quiz_Level qul on q.level = qul.id\n"
                + "				join Quiz_Type qt on q.type = qt.id\n"
                + "                               join Question qus on q.id = qus.quiz_id where s.id between ? and ? and qt.id between ? and ?  and q.quiz_name like ?\n"
                + "                               group by q.id,q.quiz_name, s.title, qul.[level],q.duration,q.passrate,qt.[type] order by q.id offset ? rows fetch first 3 rows only";
        try {
            ps = connection.prepareStatement(query);

            if (id == -1) {
                ps.setInt(1, 1);
                ps.setInt(2, 5);
            } else {
                ps.setInt(1, id);
                ps.setInt(2, id);
            }
            if (qtid == -1) {
                ps.setInt(3, 1);
                ps.setInt(4, 3);
            } else {
                ps.setInt(3, qtid);
                ps.setInt(4, qtid);
            }
            if (quiz_name == null) {
                ps.setString(5, "%" + "%");
            } else {
                ps.setString(5, "%" + quiz_name + "%");
            }
            ps.setInt(6, (index - 1) * 3);

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getLong(6),
                        rs.getFloat(7),
                        rs.getString(8)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int totalPageQuizzest(int id, int qtid, String quiz_name) {

        String query = "                               select * from Subject s\n"
                + "                               join Lesson l on s.id = l.sid\n"
                + "                               join Lesson_Details ld on l.id = ld.lid\n"
                + "                               join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "                               join Quiz q on ql.quiz_id = q.id\n"
                + "                               join Quiz_Level qul on q.level = qul.id\n"
                + "							   join Quiz_Type qt on q.type = qt.id\n"
                + "                               where s.id between ? and ? and qt.id between ? and ?  and q.quiz_name like ?";
        int total = 0;
        DAO dao = new DAO();
        try {
            ps = connection.prepareStatement(query);

            if (id == -1) {
                ps.setInt(1, 1);
                ps.setInt(2, 7);
            } else {
                ps.setInt(1, id);
                ps.setInt(2, id);
            }
            if (qtid == -1) {
                ps.setInt(3, 1);
                ps.setInt(4, 3);
            } else {
                ps.setInt(3, qtid);
                ps.setInt(4, qtid);
            }
            if (quiz_name == null) {
                ps.setString(5, "%" + "%");
            } else {
                ps.setString(5, "%" + quiz_name + "%");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                int totalA = rs.getInt(1);
                total = totalA / 3;
                if (totalA % 3 != 0) {
                    total++;
                }
            }
        } catch (Exception e) {
        }
        return total;
    }

    public List<Subject> getAllQuizByname() {
        List<Subject> list = new ArrayList<>();
        String query = "select s.id, s.title from Subject s\n"
                + "                               join Lesson l on s.id = l.sid\n"
                + "                               join Lesson_Details ld on l.id = ld.lid\n"
                + "                               join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "                               join Quiz q on ql.quiz_id = q.id\n"
                + "                               join Quiz_Level qul on q.level = qul.id\n"
                + "							   join Quiz_Type qt on q.type = qt.id\n"
                + "                               join Question qus on q.id = qus.quiz_id\n"
                + "                               group by s.id, s.title";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Quiz> getAllQuizBytype() {
        List<Quiz> list = new ArrayList<>();
        String query = "select qt.id, qt.[type] from Subject s\n"
                + "                               join Lesson l on s.id = l.sid\n"
                + "                               join Lesson_Details ld on l.id = ld.lid\n"
                + "                               join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "                               join Quiz q on ql.quiz_id = q.id\n"
                + "                               join Quiz_Level qul on q.level = qul.id\n"
                + "							   join Quiz_Type qt on q.type = qt.id\n"
                + "                               join Question qus on q.id = qus.quiz_id\n"
                + "                               group by qt.id, qt.[type]";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quiz(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<SubjectDimension> getAllQuestionByDimension() {
        List<SubjectDimension> list = new ArrayList<>();
        String query = "select sd.sid,sd.name from Subject s\n"
                + "join Subject_Dimension sd on s.id = sd.sid\n"
                + "join Lesson l on s.id = l.sid\n"
                + "join Lesson_Details ld on l.id = ld.lid\n"
                + "join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "join Quiz q on ql.quiz_id = q.id\n"
                + "join Quiz_Level qul on q.level = qul.id\n"
                + "join Question qus on q.id = qus.quiz_id \n"
                + "group by sd.sid,sd.name";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SubjectDimension(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Lesson> getAllQuestionBylession() {
        List<Lesson> list = new ArrayList<>();
        String query = "select distinct(l.name) from Subject s\n"
                + "join Lesson l on s.id = l.sid ";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(
                        rs.getString(1)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Question> getAllQuestion(int sid, String lid, int sdid, int qlid, int status, String search) {
        List<Question> list = new ArrayList<>();
        String query = "select qus.id,qus.question_content,s.title,sd.name,l.name,qul.level,qus.status  from Subject s\n"
                + "join Subject_Dimension sd on s.id = sd.sid\n"
                + "join Lesson l on s.id = l.sid\n"
                + "join Lesson_Details ld on l.id = ld.lid\n"
                + "join Quiz_Lesson ql on ld.id = ql.lesson_id\n"
                + "join Quiz q on ql.quiz_id = q.id\n"
                + "join Quiz_Level qul on q.level = qul.id\n"
                + "join Quiz_Type qt on q.type = qt.id\n"
                + "join Question qus on q.id = qus.quiz_id where \n"
                + "s.id between ? and ? \n"
                + "and l.name like ? \n"
                + "and sd.id between ? and ? \n"
                + "and qul.id between ? and ? \n"
                + "and qus.status between ? and ?\n"
                + "and qus.question_content like ?\n"
                + "group by qus.id,qus.question_content,s.title,sd.name,l.name,qul.level,qus.status";
        try {
            ps = connection.prepareStatement(query);
            if (sid == -1) {
                ps.setInt(1, 0);
                ps.setInt(2, 7);
            } else {
                ps.setInt(1, sid);
                ps.setInt(2, sid);
            }
            
            if (lid.equalsIgnoreCase("all")) {
                ps.setString(3, "%%");
            } else {
                ps.setString(3, "%" + lid + "%");
            }

//            if (lid == -1) {
//                ps.setInt(3, 1);
//                ps.setInt(4, 20);
//            } else {
//                ps.setInt(3, lid);
//                ps.setInt(4, lid);
//            }

            if (sdid == -1) {
                ps.setInt(4, 0);
                ps.setInt(5, 9);
            } else {
                ps.setInt(4, sdid);
                ps.setInt(5, sdid);
            }
            if (qlid == -1) {
                ps.setInt(6, 0);
                ps.setInt(7, 9);
            } else {
                ps.setInt(6, qlid);
                ps.setInt(7, qlid);
            }
            if (status == -1) {
                ps.setInt(8, 0);
                ps.setInt(9, 1);
            } else {
                ps.setInt(8, status);
                ps.setInt(9, status);
            }
            if (search == null) {
                ps.setString(10, "%" + "%");
            } else {
                ps.setString(10, "%" + search + "%");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Question(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void changestatusQuestion(int id, String status) {
        String query = "update Question set status = ? where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            if (status.equalsIgnoreCase("false")) {
                ps.setString(1,"true");

            }
            if (status.equalsIgnoreCase("true")) {
                ps.setString(1,"false");

            }
            ps.setInt(2, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    public List<Question> getListByPage(List<Question> list, int start, int end) {
        ArrayList<Question> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }    

    public static void main(String[] args) {
        DAO dao = new DAO();
        System.out.println(dao.getAllNew(-1, -1, -1, "", 1));
    }
}
