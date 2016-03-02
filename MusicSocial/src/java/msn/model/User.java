/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package msn.model;

/**
 *
 * @author Pham
 */
public class User {
    private int id;
    private String pass;
    private String mail;
    private String name;
    private String status;
    private String avatar;
    
    public User() {
    }

    public User(int id, String pass, String mail, String name, String status, String avatar) {
        this.id = id;
        this.pass = pass;
        this.mail = mail;
        this.name = name;
        this.status = status;
        this.avatar = avatar;
    }

    public User(int id, String name, String status, String avatar) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.avatar = avatar;
    }

    
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
