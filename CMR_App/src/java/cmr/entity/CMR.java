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
public class CMR {

    private int cmr_Id;
    private String academicSession;
    private String Course_id;
    private String CL_id;
    private String statics;
    private String Studentcount;
    private String comments;
    private String Action;

    public CMR(String academicSession, String Course_id ,String CL_id, String Studentcount) {
        this.academicSession = academicSession;
        this.Course_id = Course_id;
        this.CL_id = CL_id;
        this.Studentcount = Studentcount;
    }

    public CMR(int cmr_Id, String academicSession, String Course_id, String CL_id, String statics, String Studentcount, String comments, String Action) {
        this.cmr_Id = cmr_Id;
        this.academicSession = academicSession;
        this.Course_id = Course_id;
        this.CL_id = CL_id;
        this.statics = statics;
        this.Studentcount = Studentcount;
        this.comments = comments;
        this.Action = Action;
    }

    public int getCmr_Id() {
        return cmr_Id;
    }

    public void setCmr_Id(int cmr_Id) {
        this.cmr_Id = cmr_Id;
    }

    public String getAcademicSession() {
        return academicSession;
    }

    public void setAcademicSession(String academicSession) {
        this.academicSession = academicSession;
    }

    public String getCourse_id() {
        return Course_id;
    }

    public void setCourse_id(String Course_id) {
        this.Course_id = Course_id;
    }

    public String getCL_id() {
        return CL_id;
    }

    public void setCL_id(String CL_id) {
        this.CL_id = CL_id;
    }

    public String getStatics() {
        return statics;
    }

    public void setStatics(String statics) {
        this.statics = statics;
    }

    public String getStudentcount() {
        return Studentcount;
    }

    public void setStudentcount(String Studentcount) {
        this.Studentcount = Studentcount;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getAction() {
        return Action;
    }

    public void setAction(String Action) {
        this.Action = Action;
    }

}
