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
    private int lid;
    private String thumbnail;
    private String title;
    private String tagline;
    private String contact;
    private String description;
    private double list_price;
    private double sale_price;   
    private int status;
    private SubjectCategory sub;
    private String cname;
    private String csname;
    private int numoflesson;
    
    private String simulation;
    private String level;
    private int numoffquess;
    private int ducation;
    private int passrate;
    
    private int did;
    private String dtype;
    private String dname;
    private String ddescription;

 

   
    
    

    public Subject() {
    }
    public Subject(int id, String title) {
        this.id = id;
        this.title = title;
        
    }
    public Subject(int did, int id, String dtype, String dname, String ddescription) {
        this.did = did;
        this.id = id;
        this.dtype = dtype;
        this.dname = dname;
        this.ddescription = ddescription;
        
    }
    public Subject(int id, String title, String dname, int status, String cname,String scname,int numoflesson) {
        this.id = id;
        this.title = title;
        this.contact = contact;
        this.status = status;
        this.cname = cname;
        this.csname = scname;
        this.numoflesson = numoflesson;
    }
    public Subject(int id,int lid, String title, String simulation,String level,int numoffquess,int ducation,int passrate ) {
        this.id = id;
        this.lid = lid;
        this.title = title;
        this.simulation = simulation;
        this.level = level;
        this.numoffquess = numoffquess;
        this.ducation = ducation;
        this.passrate = passrate;
    }

    public Subject(String thumbnail, String title, String tagline, String contact, String description, double list_price, double sale_price) {
        this.thumbnail = thumbnail;
        this.title = title;
        this.tagline = tagline;
        this.contact = contact;
        this.description = description;
        this.list_price = list_price;
        this.sale_price = sale_price;
    }

    

    public Subject(int id, int cid, String thumbnail, String title, String tagline, String contact, String description, double list_price, double sale_price, int status) {
        this.id = id;
        this.cid = cid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.tagline = tagline;
        this.contact = contact;
        this.description = description;
        this.list_price = list_price;
        this.sale_price = sale_price;
        this.status = status;
    }
    
    //dành cho add new subject

    public Subject(int cid, String thumbnail, String title, String contact, String description, int status) {
        this.cid = cid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.contact = contact;
        this.description = description;
        this.status = status;
    }

    //dành cho update
    public Subject(int id, int cid, String thumbnail, String title, String contact, String description, int status) {
        this.id = id;
        this.cid = cid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.contact = contact;
        this.description = description;
        this.status = status;
    }

    public Subject(int id, int cid, String title, String contact, String description, int status) {
        this.id = id;
        this.cid = cid;
        this.title = title;
        this.contact = contact;
        this.description = description;
        this.status = status;
    }
    
    
    
    
    

    public double getList_price() {
        return list_price;
    }

    public void setList_price(double list_price) {
        this.list_price = list_price;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getDtype() {
        return dtype;
    }

    public void setDtype(String dtype) {
        this.dtype = dtype;
    }

    public String getDname() {
        return dname;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDdescription() {
        return ddescription;
    }

    public void setDdescription(String ddescription) {
        this.ddescription = ddescription;
    }

    
    

    public int getId() {
        return id;
    }

    public SubjectCategory getSub() {
        return sub;
    }

    public void setSub(SubjectCategory sub) {
        this.sub = sub;
    }

    public String getCsname() {
        return csname;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public void setCsname(String csname) {
        this.csname = csname;
    }

    public String getSimulation() {
        return simulation;
    }

    public void setSimulation(String simulation) {
        this.simulation = simulation;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public int getNumoffquess() {
        return numoffquess;
    }

    public void setNumoffquess(int numoffquess) {
        this.numoffquess = numoffquess;
    }

    public int getDucation() {
        return ducation;
    }

    public void setDucation(int ducation) {
        this.ducation = ducation;
    }

    public int getPassrate() {
        return passrate;
    }

    public void setPassrate(int passrate) {
        this.passrate = passrate;
    }

    public int getNumoflesson() {
        return numoflesson;
    }

    public void setNumoflesson(int numoflesson) {
        this.numoflesson = numoflesson;
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

    @Override
    public String toString() {
        return "Subject{" + "id=" + id + ", cid=" + cid + ", lid=" + lid + ", thumbnail=" + thumbnail + ", title=" + title + ", tagline=" + tagline + ", contact=" + contact + ", description=" + description + ", list_price=" + list_price + ", sale_price=" + sale_price + ", status=" + status + ", sub=" + sub + ", cname=" + cname + ", csname=" + csname + ", numoflesson=" + numoflesson + ", simulation=" + simulation + ", level=" + level + ", numoffquess=" + numoffquess + ", ducation=" + ducation + ", passrate=" + passrate + ", did=" + did + ", dtype=" + dtype + ", dname=" + dname + ", ddescription=" + ddescription + '}';
    }

    



    
    
    

}
