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
public class Quiz {
    private int id;
    private int lid;
    private String quiz_name;
    private int total_score;
    private int level;
    private float passrate;
    private int type;
    private long duration;

    public Quiz() {
    }

    public Quiz(int id, int lid, String quiz_name, int total_score, int level, float passrate, int type, long duration) {
        this.id = id;
        this.lid = lid;
        this.quiz_name = quiz_name;
        this.total_score = total_score;
        this.level = level;
        this.passrate = passrate;
        this.type = type;
        this.duration = duration;
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

    public int getTotal_score() {
        return total_score;
    }

    public void setTotal_score(int total_score) {
        this.total_score = total_score;
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
