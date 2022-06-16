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

    public Question() {
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
