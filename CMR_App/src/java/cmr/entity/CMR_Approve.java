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
public class CMR_Approve {
    String comment;
    String status;
    int cmr_id;

    public CMR_Approve(int cmr_id) {
         this.cmr_id = cmr_id;
    }

    public CMR_Approve(String comment, String status, int cmr_id) {
        this.comment = comment;
        this.status = status;
        this.cmr_id = cmr_id;
    }

    public CMR_Approve(String comment) {
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCmr_id() {
        return cmr_id;
    }

    public void setCmr_id(int cmr_id) {
        this.cmr_id = cmr_id;
    }
   
    
}
