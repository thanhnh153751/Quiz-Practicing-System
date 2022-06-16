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
public class QuizTakeDetails {
    private int id;
    private int take_id;
    private int ques_id;
    private int answer_id;
    private Timestamp create_time;
    private Timestamp update_time;

    public QuizTakeDetails() {
    }

    public QuizTakeDetails(int id, int take_id, int ques_id, int answer_id, Timestamp create_time, Timestamp update_time) {
        this.id = id;
        this.take_id = take_id;
        this.ques_id = ques_id;
        this.answer_id = answer_id;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTake_id() {
        return take_id;
    }

    public void setTake_id(int take_id) {
        this.take_id = take_id;
    }

    public int getQues_id() {
        return ques_id;
    }

    public void setQues_id(int ques_id) {
        this.ques_id = ques_id;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
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

    
}
