/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;
import cmr.entity.assign;
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
    public List<assign> getAllAssigned(){
    List<assign> listAs=new ArrayList<>();
    Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            Statement cstm=conn.createStatement();
            ResultSet rs=cstm.executeQuery("select * from assignCourse");
            while (rs.next()){
            String courseId=rs.getString("Course_id");
             String CL_id=rs.getString("CL_id");
              String CM_id=rs.getString("CM_id");
               String start_time=rs.getString("start_time");
                String end_time=rs.getString("end_time");
              listAs.add(new assign(courseId, CL_id, CM_id, start_time, end_time));
            }
            return listAs;
        } catch (SQLException ex) {
            Logger.getLogger(assign.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(assign.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listAs;
    }
    public boolean insertAssign(String courseId,String cl_id,String cm_id,String start_time,String end_time){
        Connection conn=null;
        try {
             conn=ConnectionUtil.getConnection();
            CallableStatement cs=conn.prepareCall("{call usp_assignCourse(?,?,?,?,?)}");
    
            cs.setString("Course_id", courseId);
            cs.setString("CL_id", cl_id);
            cs.setString("CM_id", cm_id);
            cs.setString("start_time", start_time);
            cs.setString("end_time", end_time);
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
