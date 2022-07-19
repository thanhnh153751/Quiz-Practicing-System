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
public class Sliders {
    private int id;
    private String title;
    private String image;
    private String backlink;
    private boolean status;
    private String note;

    public Sliders() {
    }
    public Sliders(int id, String title, String image, String backlink, boolean status) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.backlink = backlink;
        this.status = status;
    }

    public Sliders(int id, String title, String image, String backlink, boolean status, String note) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.backlink = backlink;
        this.status = status;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBacklink() {
        return backlink;
    }

    public void setBacklink(String backlink) {
        this.backlink = backlink;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
}
