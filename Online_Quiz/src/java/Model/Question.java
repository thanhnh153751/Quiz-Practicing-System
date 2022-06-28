/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author hongd
 */
public class Question {
    private int id;
    private int quiz_id;
    private String question_content;
    private String img_link;
    private int score;
    private String explantion;
    
    private String sname;
    private String dimenname;
    private String lessionname;
    private String level;
    private boolean status;

    public Question() {
    }
    public Question(int id, String question_content,String sname,String dimenname,String lessionname,String level,boolean status) {
        this.id = id;
        this.question_content = question_content;
        this.sname = sname;
        this.dimenname = dimenname;
        this.lessionname = lessionname;
        this.level = level;
        this.status = status;
    }

    public Question(int id, int quiz_id, String question_content, String img_link, int score, String explantion) {
        this.id = id;
        this.quiz_id = quiz_id;
        this.question_content = question_content;
        this.img_link = img_link;
        this.score = score;
        this.explantion = explantion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public String getSname() {
        return sname;
    }

    public String getLessionname() {
        return lessionname;
    }

    public void setLessionname(String lessionname) {
        this.lessionname = lessionname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getDimenname() {
        return dimenname;
    }

    public void setDimenname(String dimenname) {
        this.dimenname = dimenname;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getQuestion_content() {
        return question_content;
    }

    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    public String getImg_link() {
        return img_link;
    }

    public void setImg_link(String img_link) {
        this.img_link = img_link;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getExplantion() {
        return explantion;
    }

    public void setExplantion(String explantion) {
        this.explantion = explantion;
    }
    
    
    
}
