/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

/**
 *
 * @author Bunn
 */
public class assign {
    String courseID;
    String cl_id;
    String cm_id;
    String start_time;
    String end_time;

    public assign(String cl_id, String cm_id, String start_time, String end_time) {
        this.cl_id = cl_id;
        this.cm_id = cm_id;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    
    public assign(String courseID, String cl_id, String cm_id, String start_time, String end_time) {
        this.courseID = courseID;
        this.cl_id = cl_id;
        this.cm_id = cm_id;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getCl_id() {
        return cl_id;
    }

    public void setCl_id(String cl_id) {
        this.cl_id = cl_id;
    }

    public String getCm_id() {
        return cm_id;
    }

    public void setCm_id(String cm_id) {
        this.cm_id = cm_id;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }
    
}
