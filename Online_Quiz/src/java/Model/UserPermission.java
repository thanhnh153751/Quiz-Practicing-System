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
public class UserPermission {
    private int id;
    private int account_id;
    private int permission_id;
    private boolean licensed;

    public UserPermission() {
    }

    public UserPermission(int id, int account_id, int permission_id, boolean licensed) {
        this.id = id;
        this.account_id = account_id;
        this.permission_id = permission_id;
        this.licensed = licensed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getPermission_id() {
        return permission_id;
    }

    public void setPermission_id(int permission_id) {
        this.permission_id = permission_id;
    }

    public boolean isLicensed() {
        return licensed;
    }

    public void setLicensed(boolean licensed) {
        this.licensed = licensed;
    }
    
    
}
