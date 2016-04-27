/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.CMR;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class ShowCmrDB {

    public List getCMR() {
        List<CMR> listOfCMR = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cst = conn.prepareCall("{call usp_getCMR()}");
            ResultSet rs = cst.executeQuery();
            if (rs.next()) {
//                int cmrID;
//                String academicSession;
//                String course_id;
//                String cl_id;
//                String studentcount;
//
//                int MeanCW1;
//                int MeanCW2;
//                int MeanExam;
//                int MeanOverall;
//
//                int MedianCW1;
//                int MedianCW2;
//                int MedianExam;
//                int MedianOverall;
//
//                int SDCW1;
//                int SDCW2;
//                int SDExam;
//                int SDOverall;
//
//                int c0_39CW1;
//                int c0_39CW2;
//                int c0_39Exam;
//                int c0_39Overall;
//
//                int c40_69CW1;
//                int c40_69CW2;
//                int c40_69Exam;
//                int c40_69Overall;
//
//                int c70_89CW1;
//                int c70_89CW2;
//                int c70_89Exam;
//                int c70_89Overall;
//
//                int c90_CW1;
//                int c90_CW2;
//                int c90_Exam;
//                int c90_Overall;

                String academicSession = rs.getString("AcademicSession");
                String course_id = rs.getString("Course_id");
                String cl_id = rs.getString("CL_id");
                String studentcount = rs.getString("Studentcount");

                int MeanCW1 = rs.getInt("MeanCW1");
                int MeanCW2 = rs.getInt("MeanCW2");
                int MeanExam = rs.getInt("MeanExam");
                int MeanOverall = rs.getInt("MeanOverall");

                int MedianCW1 = rs.getInt("MedianCW1");
                int MedianCW2 = rs.getInt("MedianCW2");
                int MedianExam = rs.getInt("MedianExam");
                int MedianOverall = rs.getInt("MedianOverall");

                int SDCW1 = rs.getInt("SDCW1");
                int SDCW2 = rs.getInt("SDCW2");
                int SDExam = rs.getInt("SDExam");
                int SDOverall = rs.getInt("SDOverall");

                int c0_39CW1 = rs.getInt("0-39CW1");
                int c0_39CW2 = rs.getInt("0-39CW2");
                int c0_39Exam = rs.getInt("0-39Exam");
                int c0_39Overall = rs.getInt("0-39Overall");

                int c40_69CW1 = rs.getInt("40-69CW1");
                int c40_69CW2 = rs.getInt("40-69CW2");
                int c40_69Exam = rs.getInt("40-69Exam");
                int c40_69Overall = rs.getInt("40-69Overall");

                int c70_89CW1 = rs.getInt("70-89CW1");
                int c70_89CW2 = rs.getInt("70-89CW2");
                int c70_89Exam = rs.getInt("70-89Exam");
                int c70_89Overall = rs.getInt("70-89Overall");

                int c90_CW1 = rs.getInt("90+CW1");
                int c90_CW2 = rs.getInt("90+CW2");
                int c90_Exam = rs.getInt("90+Exam");
                int c90_Overall = rs.getInt("90+Overall");
                CMR cmr = new CMR(academicSession, course_id, cl_id, studentcount, MeanCW1, MeanCW2, MeanExam, MeanOverall, MedianCW1, MedianCW2, MedianExam, MedianOverall, SDCW1, SDCW2, SDExam, SDOverall, c0_39CW1, c0_39CW2, c0_39Exam, c0_39Overall, c40_69CW1, c40_69CW2, c40_69Exam, c40_69Overall, c70_89CW1, c70_89CW2, c70_89Exam, c70_89Overall, c90_CW1, c90_CW2, c90_Exam, c90_Overall);

                listOfCMR.add(cmr);
            }
        } catch (SQLException ex) {
            listOfCMR = null;
            Logger.getLogger(ShowCmrDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return listOfCMR;
    }
}
