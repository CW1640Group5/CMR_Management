/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

/**
 *
 * @author Nguyen
 */
public class Course {

    private String id;
    private String course_name;
    private String description;
    private String start_time;
    private String end_time;

    public Course(String id) {
        this.id = id;
    }

    public Course(String id, String course_name, String description, String start_time, String end_time) {
        this.id = id;
        this.course_name = course_name;
        this.description = description;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

}
