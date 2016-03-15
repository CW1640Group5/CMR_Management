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
    private String type;
    private String doccumentCode;
    private String name;
    private String link;
    private String cl_id;
    private String course_id;
    private String statics;

    public CMR(String type, String doccumentCode, String name, String link, String cl_id, String course_id, String statics) {
        this.type = type;
        this.doccumentCode = doccumentCode;
        this.name = name;
        this.link = link;
        this.cl_id = cl_id;
        this.course_id = course_id;
        this.statics = statics;
    }

    public CMR(int cmr_Id, String type, String doccumentCode, String name, String link, String cl_id, String course_id, String statics) {
        this.cmr_Id = cmr_Id;
        this.type = type;
        this.doccumentCode = doccumentCode;
        this.name = name;
        this.link = link;
        this.cl_id = cl_id;
        this.course_id = course_id;
        this.statics = statics;
    }

    public int getCmr_Id() {
        return cmr_Id;
    }

    public void setCmr_Id(int cmr_Id) {
        this.cmr_Id = cmr_Id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDoccumentCode() {
        return doccumentCode;
    }

    public void setDoccumentCode(String doccumentCode) {
        this.doccumentCode = doccumentCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getCl_id() {
        return cl_id;
    }

    public void setCl_id(String cl_id) {
        this.cl_id = cl_id;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getStatics() {
        return statics;
    }

    public void setStatics(String statics) {
        this.statics = statics;
    }

}
