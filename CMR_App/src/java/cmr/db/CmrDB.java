/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class CmrDB {

    public boolean addNewCMR
    (
            String academicSession,
            String course_id,
            String cl_id,
            String studentCount,
            
            int MeanCW1,
            int MeanCW2,
            int MeanExam,
            int MeanOverall,

            int MedianCW1,
            int MedianCW2,
            int MedianExam,
            int MedianOverall,

            int SDCW1,
            int SDCW2,
            int SDExam,
            int SDOverall,

            int c0_39CW1,
            int c0_39CW2,
            int c0_39Exam,
            int c0_39Overall,

            int c40_69CW1,
            int c40_69CW2,
            int c40_69Exam,
            int c40_69Overall,

            int c70_89CW1,
            int c70_89CW2,
            int c70_89Exam,
            int c70_89Overall,

            int c90_CW1,
            int c90_CW2,
            int c90_Exam,
            int c90_Overall
    ) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_addNewCMR(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

            cstmt.setString("academicSession", academicSession);
            cstmt.setString("course_id", course_id);
            cstmt.setString("cl_id", cl_id);
            cstmt.setString("studentCount", studentCount);
            
            cstmt.setInt("MeanCW1", MeanCW1);
            cstmt.setInt("MeanCW2", MeanCW2);
            cstmt.setInt("MeanExam", MeanExam);
            cstmt.setInt("MeanOverall", MeanOverall);
            
            cstmt.setInt("MedianCW1", MedianCW1);
            cstmt.setInt("MedianCW2", MedianCW2);
            cstmt.setInt("MedianExam", MedianExam);
            cstmt.setInt("MedianOverall", MedianOverall);
            
            cstmt.setInt("SDCW1", SDCW1);
            cstmt.setInt("SDCW2", SDCW2);
            cstmt.setInt("SDExam", SDExam);
            cstmt.setInt("SDOverall", SDOverall);
            
            cstmt.setInt("0_39CW1", c0_39CW1);
            cstmt.setInt("0_39CW2", c0_39CW2);
            cstmt.setInt("0_39Exam", c0_39Exam);
            cstmt.setInt("0_39Overall", c0_39Overall);
            
            cstmt.setInt("40_69CW1", c40_69CW1);
            cstmt.setInt("40_69CW2", c40_69CW2);
            cstmt.setInt("40_69Exam", c40_69Exam);
            cstmt.setInt("40_69Overall", c40_69Overall);

            cstmt.setInt("70_89CW1", c70_89CW1);
            cstmt.setInt("70_89CW2", c70_89CW2);
            cstmt.setInt("70_89Exam", c70_89Exam);
            cstmt.setInt("70_89Overall", c70_89Overall);
            
            cstmt.setInt("90_CW1", c90_CW1);
            cstmt.setInt("90_CW2", c90_CW2);
            cstmt.setInt("90_Exam", c90_Exam);
            cstmt.setInt("90_Overall", c90_Overall);
            
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

    public String getEmail(String course_id) {
        Connection conn = null;
        String mail = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_getMail(?)}");
            cstmt.setString("Course_id", course_id);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                mail = rs.getString(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CmrDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return mail;
    }
}
