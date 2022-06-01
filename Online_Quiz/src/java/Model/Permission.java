/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author hongd
 */
public class Permission {
    private int id;
    private String per_name;
    private List<Action> alist;
    
    public Permission() {
    }

    public Permission(int id, String per_name, List<Action> alist) {
        this.id = id;
        this.per_name = per_name;
        this.alist = alist;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPer_name() {
        return per_name;
    }

    public void setPer_name(String per_name) {
        this.per_name = per_name;
    }

    public List<Action> getAlist() {
        return alist;
    }

    public void setAlist(List<Action> alist) {
        this.alist = alist;
    }

    

   
    
    
}
