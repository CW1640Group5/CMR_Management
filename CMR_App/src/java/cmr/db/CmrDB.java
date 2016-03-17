/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class CmrDB {
    
    public boolean addNewCMR(String academicSession, String course_id, String cl_id, int studentcount) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_addNewCMR(?,?,?,?)}");
            cstmt.setString("academicSession", academicSession);
            cstmt.setString("course_id", course_id);
            cstmt.setString("cl_id", cl_id);
            cstmt.setInt("studentcount", studentcount);
            int result = cstmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CmrDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }
}
