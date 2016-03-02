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
public class Friend {
    private int relationid;
    private int userid;
    private String name;
    boolean online;

    public Friend() {
    }

    public Friend(int relationid, int userid, String name, boolean online) {
        this.relationid = relationid;
        this.userid = userid;
        this.name = name;
        this.online = online;
    }

    public int getRelationid() {
        return relationid;
    }

    public void setRelationid(int relationid) {
        this.relationid = relationid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isOnline() {
        return online;
    }

    public void setOnline(boolean online) {
        this.online = online;
    }
}
