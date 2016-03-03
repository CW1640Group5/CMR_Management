/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.Course;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author BUIVUHUECHI
 */
public class CourseDB {
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
