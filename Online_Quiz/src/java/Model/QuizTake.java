/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author hongd
 */
public class QuizTake {
    private int id;
    private int aid;
    private int quiz_id;
    private int status;
    private int score;
    private Timestamp create_time;
    private Timestamp update_time;
    private Timestamp start_time;
    private Timestamp finish_time;

    public QuizTake() {
    }

    public QuizTake(int id, int aid, int quiz_id, int status, int score, Timestamp create_time, Timestamp update_time, Timestamp start_time, Timestamp finish_time) {
        this.id = id;
        this.aid = aid;
        this.quiz_id = quiz_id;
        this.status = status;
        this.score = score;
        this.create_time = create_time;
        this.update_time = update_time;
        this.start_time = start_time;
        this.finish_time = finish_time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Timestamp getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    public Timestamp getStart_time() {
        return start_time;
    }

    public void setStart_time(Timestamp start_time) {
        this.start_time = start_time;
    }

    public Timestamp getFinish_time() {
        return finish_time;
    }

    public void setFinish_time(Timestamp finish_time) {
        this.finish_time = finish_time;
    }

    
    
    
}
