/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author hongd
 */
public class Post {

    private int id;
    private int cid;
    private String post_title;
    private String biref;
    private String details;
    private String author;
    private Date update_date;
    private String contact;
    private String thumbnail;
    private int status;
    private int view_count;

    public Post() {
    }

    public Post(int id, int cid, String post_title, String biref, String details, String author, Date update_date, String contact, String thumbnail, int status, int view_count) {
        this.id = id;
        this.cid = cid;
        this.post_title = post_title;
        this.biref = biref;
        this.details = details;
        this.author = author;
        this.update_date = update_date;
        this.contact = contact;
        this.thumbnail = thumbnail;
        this.status = status;
        this.view_count = view_count;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public String getBiref() {
        return biref;
    }

    public void setBiref(String biref) {
        this.biref = biref;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public String getDateFormat() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String strDate = formatter.format(this.update_date);
        return strDate;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
 
    
    
}
