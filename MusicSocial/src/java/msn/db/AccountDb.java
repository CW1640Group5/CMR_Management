package msn.db;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import msn.model.Account;

public class AccountDb {

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

    //Register
    public boolean Register(String name, String password, String email) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_Register(?, ?, ?)}");
            cstmt.setString("name", name);
            cstmt.setString("email", email);
            cstmt.setString("password", md5(password));
            int result = cstmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SongDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }

    public void login(Account account) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cst = conn.prepareCall(" { call usp_Login (?, ?) } ");
            cst.setString("email", account.getEmail());
            cst.setString("password", md5(account.getPassword()));
            ResultSet rs = cst.executeQuery();
            while (rs.next()) {
                account.setAccountId(rs.getInt("AccountId"));
                account.setName(rs.getString("Name"));
                account.setOnline(rs.getBoolean("Online"));
                account.setAvatar(rs.getString("Avatar"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
    }
    public boolean SessionId(String sessionId, String email) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_SessionId(?, ?)}");
            cstmt.setString("sessionId", sessionId);
            cstmt.setString("email", email);
            int result = cstmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }
}
