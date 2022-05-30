/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;



/**
 *
 * @author THANH
 */
public class Subject {
    private int id;
    private int cid;
    private String thumbnail;
    private String title;
    private String tagline;
    private double origin_price;
    private double sale_price;
    private String contact;
    private String description;
    private int status;

    public Subject() {
    }

    public Subject(String thumbnail, String title, String tagline, double origin_price, double sale_price, String contact, String description) {
       
        this.thumbnail = thumbnail;
        this.title = title;
        this.tagline = tagline;
        this.origin_price = origin_price;
        this.sale_price = sale_price;
        this.contact = contact;
        this.description = description;
        
    }
    public Subject(int id, int cid, String thumbnail, String title, String tagline, double origin_price, double sale_price, String contact, String description, int status) {
        this.id = id;
        this.cid = cid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.tagline = tagline;
        this.origin_price = origin_price;
        this.sale_price = sale_price;
        this.contact = contact;
        this.description = description;
        this.status = status;
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTagline() {
        return tagline;
    }

    public void setTagline(String tagline) {
        this.tagline = tagline;
    }

    public double getOrigin_price() {
        return origin_price;
    }

    public void setOrigin_price(double origin_price) {
        this.origin_price = origin_price;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    

}
