/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.CMR_Users;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class CMR_UsersDb {

    private String md5(String passwordToHash) {
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(passwordToHash.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 255) + 256, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }

    public void login(CMR_Users cmrUser) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cst = conn.prepareCall(" { call usp_Login (?, ?) } ");
            cst.setString("user_name", cmrUser.getUserName());
            cst.setString("uPassword", md5(cmrUser.getuPassword()));
            ResultSet rs = cst.executeQuery();
            while (rs.next()) {
//                cmrUser.setUserID(rs.getInt("User_id"));
//                cmrUser.setUserName(rs.getString("User_name"));
//                cmrUser.setMail(rs.getString("mail"));
//                cmrUser.setRoleID(rs.getInt("Role_id"));
                int userID = rs.getInt("User_id");
                String userName = rs.getString("User_name");
                String mail = rs.getString("mail");
                int roleId = rs.getInt("Role_id");
                
                cmrUser.setUserID(userID);
                cmrUser.setUserName(userName);
                cmrUser.setMail(mail);
                cmrUser.setRoleID(roleId);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CMR_Users.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
    }

}
