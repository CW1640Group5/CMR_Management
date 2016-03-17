/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class test {

    public static void main(String[] args) {
//        try {
//            String input = "12/25/2016";
//            SimpleDateFormat format1 = new SimpleDateFormat("mm/dd/yyyy");
//            SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yy");
//            Date date;
//            date = format1.parse(input);
//            String temp = format2.format(date);
//            System.out.println(temp);
//        } catch (ParseException ex) {
//            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
//        }
        CourseDb db = new CourseDb();

        try {
            String input1 = "12/25/2016";
            String input2 = "12/25/2017";
            SimpleDateFormat format1 = new SimpleDateFormat("mm/dd/yyyy");
            SimpleDateFormat format2 = new SimpleDateFormat("yyyy-mm-dd");
            Date date1;
            Date date2;

            date1 = format1.parse(input1);
            date2 = format1.parse(input2);

            String temp1 = format2.format(date1);
            String temp2 = format2.format(date2);

            try {
                Connection conn = null;
                conn = ConnectionUtil.getConnection();
                CallableStatement cstmt = conn.prepareCall("{call usp_addNewCourse(?,?,?,?)}");

                cstmt.setString("c_id", "dsfsg3");
                cstmt.setString("c_name", "ddde");
                cstmt.setString("start_time", temp1);
                cstmt.setString("end_time", temp2);
                int result = cstmt.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ParseException ex) {
            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean addNewCourse(String id, String name, Date startTime, Date endTime) {

        return false;
    }
}
