/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.CMR_Approve;
import java.util.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Bunn
 */
public class ApproveDB {

    Connection conn = null;
    
    public String getCMR_Static(){
       String cmrName=null;
       try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cst = conn.prepareCall("{call getCMR_Static()}");
            ResultSet rs = cst.executeQuery();
            if (rs.next()) {
                cmrName = rs.getString("AcademicSession");
            }
            return cmrName;
        } catch (SQLException ex) {
            Logger.getLogger(ApproveDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return null;
    }
    public boolean approveCMRStatic() {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            PreparedStatement stmt=conn.prepareStatement
	("update CMR set static='done' where static is null");
       
            int result = stmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }
    
    
    public String getCmrID() {
        String cmrId = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cst = conn.prepareCall("{call getCMR_unApproved()}");
            ResultSet rs = cst.executeQuery();
            if (rs.next()) {
                cmrId = rs.getString("AcademicSession");
            }
            return cmrId;
        } catch (SQLException ex) {
            Logger.getLogger(ApproveDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return null;
    }

    public boolean approveCMR() {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            PreparedStatement stmt=conn.prepareStatement
	("update CMR set comments='approved',Action='done' where comments is null");
       
            int result = stmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }
}
