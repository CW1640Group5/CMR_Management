/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

<<<<<<< HEAD
import java.util.Date;

/**
 *
 * @author Nguyen
 */
public class Course {

    private String id;
    private String course_name;
    private String start_time;
    private String end_time;

    public Course(String id, String course_name, String start_time, String end_time) {
        this.id = id;
        this.course_name = course_name;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
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

=======
import oracle.sql.DATE;

/**
 *
 * @author BUIVUHUECHI
 */
public class Course {
    public String Course_id;
    public String Course_name;
    public String starttime;
    public String endtime;

    public Course() {
    }

    public Course(String Course_id, String Course_name, String starttime, String endtime) {
        this.Course_id = Course_id;
        this.Course_name = Course_name;
        this.starttime = starttime;
        this.endtime = endtime;
    }

    public String getCourse_id() {
        return Course_id;
    }

    public void setCourse_id(String Course_id) {
        this.Course_id = Course_id;
    }

    public String getCourse_name() {
        return Course_name;
    }

    public void setCourse_name(String Course_name) {
        this.Course_name = Course_name;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }
    
    
>>>>>>> origin/master
}
