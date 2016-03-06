/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.Course;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseDB {
    public boolean addNewCourse(String id, String name, String startTime, String endTime) {
        Connection conn = null;
        
        SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
	startTime = sdf.format(new Date());
        endTime = sdf.format(new Date());
        try {
            conn = ConnectionUtil.getConnection();
            System.out.println("finish");
//            CallableStatement cstmt = conn.prepareCall("{insert into Course values ('?','?', to_date('?','mm-dd-yyyy'), to_date('?','mm-dd-yyyy'));}");
            CallableStatement cstmt = conn.prepareCall("{addNewCourse(?,?,?,?)}");
            
            cstmt.setString("id", id);
            cstmt.setString("name", name);
            cstmt.setString("start_time", startTime);
            cstmt.setString("end_time", endTime);
            System.out.println("start excute update");
            int result = cstmt.executeUpdate();
            System.out.println("finish excute");
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }
    
    public List<Course> getListCourseAsign(String id){
         Connection conn=null;
        List<Course> listcourse=new ArrayList<>();
        try {
            conn=ConnectionUtil.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select DISTINCT Course.Course_id,Course.COURSE_NAME,Course.START_TIME,Course.END_TIME from Course,CL where CL.CL_ID='cl001'");
             while(rs.next()){
                String Id=rs.getString("Course_id");
                String name=rs.getString("COURSE_NAME");
                Date startdate=rs.getDate("START_TIME");
                Date enddate=rs.getDate("END_TIME");
                listcourse.add(new Course(Id, name, String.valueOf(startdate),String.valueOf(enddate)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
                
        return listcourse;
        
    }
}
