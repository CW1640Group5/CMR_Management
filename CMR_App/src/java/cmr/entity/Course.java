/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

import java.util.Date;

/**
 *
 * @author Nguyen
 */
public class Course {

    private String id;
    private String course_name;
    private Date start_time;
    private Date end_time;

    public Course(String id, String course_name, Date start_time, Date end_time) {
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

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

}
