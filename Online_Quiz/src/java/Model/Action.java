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
public class Action {
    private int id;
    private String action_name;
    private String action_code;

    public Action() {
    }

    public Action(int id, String action_name, String action_code) {
        this.id = id;
        this.action_name = action_name;
        this.action_code = action_code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAction_name() {
        return action_name;
    }

    public void setAction_name(String action_name) {
        this.action_name = action_name;
    }

    public String getAction_code() {
        return action_code;
    }

    public void setAction_code(String action_code) {
        this.action_code = action_code;
    }
    
    
}
