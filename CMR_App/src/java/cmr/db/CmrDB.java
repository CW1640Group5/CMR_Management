/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class CmrDB {

    public boolean addNewCMR(String academicSession, String course_id, String cl_id, String studentCount) {
        Connection conn = null;
        try {
//            String query = "insert into CMR(AcademicSession, Course_id, CL_id, Studentcount) \n"
//                    + "values ('" + academicSession + "', '" + course_id + "', '" + cl_id + "', '" + studentCount + "');";
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_addNewCMR(?,?,?,?)}");

            cstmt.setString("academicSession", academicSession);
            cstmt.setString("course_id", course_id);
            cstmt.setString("cl_id", cl_id);
            cstmt.setString("studentCount", studentCount);

//            Statement stm = conn.createStatement();
//            int result = stm.executeUpdate(query);
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
