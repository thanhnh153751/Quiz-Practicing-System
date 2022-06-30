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
public class Account {
    private int id;
    private String fullname;
    private String email;
    private String phone;
    private String password;
    private boolean gender;
    private int status;
    private String avatar;
    
    private int licensed;

    
    
    public Account() {
    }

    public Account(int id, String fullname, String email, String phone, boolean gender, int status,int licensed) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.status = status;
        this.licensed = licensed;
    }

    
     
    public Account(int id, String fullname, String email, String phone, String password, boolean gender, int status, String avatar) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.gender = gender;
        this.status = status;
        this.avatar = avatar;
    }
    
    public int getLicensed() {
        return licensed;
    }

    public void setLicensed(int licensed) {
        this.licensed = licensed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    
    
    
}
