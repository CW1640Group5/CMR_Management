/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package msn.db;

import msn.model.Friend;
import msn.model.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham
 */
public class FriendDB {
    public boolean addfriend(int id1, int id2) {
        Connection conn = null;

        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_addfriend(?, ?)}");
            cstmt.setInt("id1", id1);
            cstmt.setInt("id2", id2);

            int rows = cstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }

    public boolean acceptfriend(int id1, int requestid) {
        Connection conn = null;

        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_acceptfriend(?, ?)}");
            int rows = cstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }

    public boolean unfriend(int id1, int id2) {
        Connection conn = null;

        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_unfriend(?, ?)}");
            cstmt.setInt("id1", id1);
            cstmt.setInt("id2", id2);

            int rows = cstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }

    public List<User> getUser(int ownerid, String name) {
        List<User> listOfUsers = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_searchUser(?, ?)}");
            cstmt.setInt("ownerid", ownerid);
            cstmt.setString("name", name);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("AccountId");
                String username = rs.getString("Name");
                String avatar = rs.getString("Avatar");
                String status = rs.getString("Status");
                User u = new User(id, username, status, avatar);
                listOfUsers.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listOfUsers;
    }

    public List<Friend> getAllFriends(int id) {
        List<Friend> listOfFriends = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_listfriend1(?)}");
            cstmt.setInt("id", id);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                int relationid = rs.getInt("RelationshipId");
                int userid = rs.getInt("UserId1");
                String name = rs.getString("Name");
                boolean online = rs.getBoolean("Online");
                Friend friends = new Friend(relationid, userid, name, online);
                listOfFriends.add(friends);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FriendDB.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listOfFriends;
    }
}
