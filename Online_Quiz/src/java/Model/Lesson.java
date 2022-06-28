/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author THANH
 */
public class Lesson {
    int id;
    int sid;
    int type_id;
    String name;
    int status;

    public Lesson() {
    }
    public Lesson(int id,String name) {
        this.id = id;
        this.name = name;
    }
    public Lesson(String name) {
        this.name = name;
    }

    public Lesson(int id, int sid, int type_id, String name, int status) {
        this.id = id;
        this.sid = sid;
        this.type_id = type_id;
        this.name = name;
        this.status = status;
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

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
