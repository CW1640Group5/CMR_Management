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
public class AssignCourse {

    private int asId;
    private String course_id;
    private String cl_id;
    private String cm_id;

    public AssignCourse(int asId, String course_id, String cl_id, String cm_id) {
        this.asId = asId;
        this.course_id = course_id;
        this.cl_id = cl_id;
        this.cm_id = cm_id;
    }

    public AssignCourse(String course_id) {
        this.course_id = course_id;
    }

    public AssignCourse(String cl_id, String cm_id) {
        this.cl_id = cl_id;
        this.cm_id = cm_id;
    }

    public int getAsId() {
        return asId;
    }

    public void setAsId(int asId) {
        this.asId = asId;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
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

}
