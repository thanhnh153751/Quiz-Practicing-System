/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author hongd
 */
public class Quiz {

    private int id;
    private int lid;
    private String quiz_name;
    private double total_score;
    private int level;
    private float passrate;
    private int type;
    private long duration;
    private Timestamp finishtime;
    private String subject;
    private String qlevel;
    private String qtype;
    private int numofquess;
    
    private int quiztake_id;
    private int quiz_id;

    public Quiz() {
    }

    public Quiz(int id, String qtype) {
        this.id = id;
        this.qtype = qtype;
    }

    public Quiz(int id, String quiz_name, String subject, String qlevel, int numofquess, long duration, float passrate, String qtype) {
        this.id = id;
        this.quiz_name = quiz_name;
        this.subject = subject;
        this.qlevel = qlevel;
        this.numofquess = numofquess;
        this.duration = duration;
        this.passrate = passrate;
        this.qtype = qtype;

    }

    public Quiz(int id, int lid, String quiz_name, double total_score, int level, float passrate, int type, long duration) {
        this.id = id;
        this.lid = lid;
        this.quiz_name = quiz_name;
        this.total_score = total_score;
        this.level = level;
        this.passrate = passrate;
        this.type = type;
        this.duration = duration;
    }
    

    public Quiz(int lid, String subject, String quiz_name, String qtype, long duration, float passrate) {
        this.lid = lid;
        this.subject = subject;
        this.quiz_name = quiz_name;
        this.qtype = qtype;
        this.duration = duration;
        this.passrate = passrate;

    }
    
    public Quiz(int lid, String subject, String quiz_name, String qtype, long duration, float passrate,double total_score,Timestamp finishtime,int quiztake_id,int quiz_id) {
        this.lid = lid;
        this.subject = subject;
        this.quiz_name = quiz_name;
        this.qtype = qtype;
        this.duration = duration;
        this.passrate = passrate;
        this.total_score = total_score;
        this.finishtime = finishtime;
        this.quiztake_id = quiztake_id;
        this.quiz_id = quiz_id;
    }


    
    

    public int getQuiztake_id() {
        return quiztake_id;
    }

    public void setQuiztake_id(int quiztake_id) {
        this.quiztake_id = quiztake_id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }


    

    public Timestamp getFinishtime() {
        return finishtime;
    }

    public void setFinishtime(Timestamp finishtime) {
        this.finishtime = finishtime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public String getQuiz_name() {
        return quiz_name;
    }

    public void setQuiz_name(String quiz_name) {
        this.quiz_name = quiz_name;
    }

    public double getTotal_score() {
        return total_score;
    }

    public void setTotal_score(double total_score) {
        this.total_score = total_score;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getQlevel() {
        return qlevel;
    }

    public void setQlevel(String qlevel) {
        this.qlevel = qlevel;
    }

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }

    public int getNumofquess() {
        return numofquess;
    }

    public void setNumofquess(int numofquess) {
        this.numofquess = numofquess;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public float getPassrate() {
        return passrate;
    }

    public void setPassrate(float passrate) {
        this.passrate = passrate;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public long getDuration() {
        return duration;
    }

    public void setDuration(long duration) {
        this.duration = duration;
    }

}
