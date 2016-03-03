/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class CourseDb {
    //insert into Course values ('C12345','Web Design', to_date('01-01-2016','mm-dd-yyyy'), to_date('01-01-2017','mm-dd-yyyy'));
    public boolean addNewCourse(String id, String name, String startTime, String endTime) {
        Connection conn = null;
        
        SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
	startTime = sdf.format(new Date());
        endTime = sdf.format(new Date());
        try {
            conn = ConnectionUtil.getConnection();
//            CallableStatement cstmt = conn.prepareCall("{insert into Course values ('?','?', to_date('?','mm-dd-yyyy'), to_date('?','mm-dd-yyyy'));}");
            CallableStatement cstmt = conn.prepareCall("{addNewCourse(?,?,?,?)}");
            
            cstmt.setString("id", id);
            cstmt.setString("name", name);
            cstmt.setString("start_time", startTime);
            cstmt.setString("end_time", endTime);

            int result = cstmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }
}
