/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;
import cmr.entity.AssignCourse;
import java.util.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Bunn
 */
public class AssignDB {
//    private String DB_URL;
//    private String DB_USER;
//    private String DB_PASS;
//
//    public AssignDB(String DB_URL, String DB_USER, String DB_PASS) {
//        this.DB_URL = DB_URL;
//        this.DB_USER = DB_USER;
//        this.DB_PASS = DB_PASS;
//    }
    public List<AssignCourse> getAllAssigned(){
    List<AssignCourse> listAs=new ArrayList<>();
    Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
           CallableStatement cstm=conn.prepareCall("{call usp_assignCourseId()}");
           ResultSet rs=cstm.executeQuery();
            while (rs.next()){
              String Course_id=rs.getString("Course_id");
//             String CL_id=rs.getString("CL_id");
//              String CM_id=rs.getString("CM_id");
              
              listAs.add(new AssignCourse(Course_id));
            }
            return listAs;
        } catch (SQLException ex) {
            Logger.getLogger(AssignCourse.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AssignCourse.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listAs;
    }
    
    
    public String getCourseName() {
        Connection conn = null;
        String course_id = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cst = conn.prepareCall("{call usp_assignCourseId()}");
            ResultSet rs = cst.executeQuery();
            if(rs.next()) {
                course_id = rs.getString("Course_id");
            }
            System.out.println(course_id);
            return course_id;
        } catch (SQLException ex) {
            Logger.getLogger(CourseDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return null;
    }
            
    public boolean insertAssign(AssignCourse a){
        Connection conn=null;
        try {
             conn=ConnectionUtil.getConnection();
            CallableStatement cs=conn.prepareCall("{call usp_assignCourse(?,?,?)}");
    
         
            cs.setString(2, a.getCl_id());
            cs.setString(3, a.getCm_id());
        
            int result=cs.executeUpdate();
            if(result>0){
                return true;
            }
        }catch (SQLException ex) {
            Logger.getLogger(AssignDB.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AssignDB.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }
}