/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Viet Dung
 */
public class SubjectDimension {
    private int id;
    private int sid;
    private String type;
    private String name;
    private String description;

    public SubjectDimension() {
    }
    public SubjectDimension(int sid,String name) {
        this.sid = sid;
        this.name = name;
    }

    public SubjectDimension(int id, int sid, String type, String name, String description) {
        this.id = id;
        this.sid = sid;
        this.type = type;
        this.name = name;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
    
}
