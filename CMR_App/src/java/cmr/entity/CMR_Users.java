/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

/**
 *
 * @author Nguyen
 */
public class CMR_Users {

    private int userID;
    private String userName;
    private String uPassword;
    private String sessionID;
    private String gender;//check gender F or M
    private String dob;
    private int roleID;
    private String address;
    private String phone;
    private String mail;

    public CMR_Users() {
    }

    public CMR_Users(String userName, String uPassword) {
        this.userName = userName;
        this.uPassword = uPassword;
    }

    public CMR_Users(int userID, String userName, String uPassword, String sessionID, String gender, String dob, int roleID, String address, String phone, String mail) {
        this.userID = userID;
        this.userName = userName;
        this.uPassword = uPassword;
        this.sessionID = sessionID;
        this.gender = gender;
        this.dob = dob;
        this.roleID = roleID;
        this.address = address;
        this.phone = phone;
        this.mail = mail;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getSessionID() {
        return sessionID;
    }

    public void setSessionID(String sessionID) {
        this.sessionID = sessionID;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

}
