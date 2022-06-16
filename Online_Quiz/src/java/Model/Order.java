/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author PREDATOR
 */
public class Order {
    private int id;
    private int aid;
    private String email;
    private Date registration_time;
    private String subject;
    private String packagee;
    private int total_cost;
    private int status;
    private Date valid_from;
    private Date valid_to;
    private String last_update_by;
    private String thumbnail;

    public Order() {
    }

    public Order(int id, int aid, String email, Date registration_time, String subject, String Package, int total_cost, int status, Date valid_from, Date valid_to, String last_update_by, String thumbnail) {
        this.id = id;
        this.aid = aid;
        this.email = email;
        this.registration_time = registration_time;
        this.subject = subject;
        this.packagee = packagee;
        this.total_cost = total_cost;
        this.status = status;
        this.valid_from = valid_from;
        this.valid_to = valid_to;
        this.last_update_by = last_update_by;
        this.thumbnail = thumbnail;
    }
    
    public Order(int id, Date registration_time, String subject, String packagee, int total_cost, int status, Date valid_from, Date valid_to) {
        this.id = id;
        this.registration_time = registration_time;
        this.subject = subject;
        this.packagee = packagee;
        this.total_cost = total_cost;
        this.status = status;
        this.valid_from = valid_from;
        this.valid_to = valid_to;
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

    public String getPackagee() {
        return packagee;
    }

    public void setPackagee(String packagee) {
        this.packagee = packagee;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegistration_time() {
        return registration_time;
    }

    public void setRegistration_time(Date registration_time) {
        this.registration_time = registration_time;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }



    public int getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(int total_cost) {
        this.total_cost = total_cost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getValid_from() {
        return valid_from;
    }

    public void setValid_from(Date valid_from) {
        this.valid_from = valid_from;
    }

    public Date getValid_to() {
        return valid_to;
    }

    public void setValid_to(Date valid_to) {
        this.valid_to = valid_to;
    }

    public String getLast_update_by() {
        return last_update_by;
    }

    public void setLast_update_by(String last_update_by) {
        this.last_update_by = last_update_by;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    
    

}