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

    private int MeanCW1;
    private int MeanCW2;
    private int MeanExam;
    private int MeanOverall;

    private int MedianCW1;
    private int MedianCW2;
    private int MedianExam;
    private int MedianOverall;

    private int SDCW1;
    private int SDCW2;
    private int SDExam;
    private int SDOverall;

    private int c0_39CW1;
    private int c0_39CW2;
    private int c0_39Exam;
    private int c0_39Overall;

    private int c40_69CW1;
    private int c40_69CW2;
    private int c40_69Exam;
    private int c40_69Overall;

    private int c70_89CW1;
    private int c70_89CW2;
    private int c70_89Exam;
    private int c70_89Overall;

    private int c90_CW1;
    private int c90_CW2;
    private int c90_Exam;
    private int c90_Overall;

    public CMR(String academicSession, String Course_id, String CL_id, String Studentcount, int MeanCW1, int MeanCW2, int MeanExam, int MeanOverall, int MedianCW1, int MedianCW2, int MedianExam, int MedianOverall, int SDCW1, int SDCW2, int SDExam, int SDOverall, int c0_39CW1, int c0_39CW2, int c0_39Exam, int c0_39Overall, int c40_69CW1, int c40_69CW2, int c40_69Exam, int c40_69Overall, int c70_89CW1, int c70_89CW2, int c70_89Exam, int c70_89Overall, int c90_CW1, int c90_CW2, int c90_Exam, int c90_Overall) {
        this.academicSession = academicSession;
        this.Course_id = Course_id;
        this.CL_id = CL_id;
        this.Studentcount = Studentcount;
        this.MeanCW1 = MeanCW1;
        this.MeanCW2 = MeanCW2;
        this.MeanExam = MeanExam;
        this.MeanOverall = MeanOverall;
        this.MedianCW1 = MedianCW1;
        this.MedianCW2 = MedianCW2;
        this.MedianExam = MedianExam;
        this.MedianOverall = MedianOverall;
        this.SDCW1 = SDCW1;
        this.SDCW2 = SDCW2;
        this.SDExam = SDExam;
        this.SDOverall = SDOverall;
        this.c0_39CW1 = c0_39CW1;
        this.c0_39CW2 = c0_39CW2;
        this.c0_39Exam = c0_39Exam;
        this.c0_39Overall = c0_39Overall;
        this.c40_69CW1 = c40_69CW1;
        this.c40_69CW2 = c40_69CW2;
        this.c40_69Exam = c40_69Exam;
        this.c40_69Overall = c40_69Overall;
        this.c70_89CW1 = c70_89CW1;
        this.c70_89CW2 = c70_89CW2;
        this.c70_89Exam = c70_89Exam;
        this.c70_89Overall = c70_89Overall;
        this.c90_CW1 = c90_CW1;
        this.c90_CW2 = c90_CW2;
        this.c90_Exam = c90_Exam;
        this.c90_Overall = c90_Overall;
    }

    public CMR(int cmr_Id, String academicSession, String Course_id, String CL_id, String statics, String Studentcount, String comments, String Action, int MeanCW1, int MeanCW2, int MeanExam, int MeanOverall, int MedianCW1, int MedianCW2, int MedianExam, int MedianOverall, int SDCW1, int SDCW2, int SDExam, int SDOverall, int c0_39CW1, int c0_39CW2, int c0_39Exam, int c0_39Overall, int c40_69CW1, int c40_69CW2, int c40_69Exam, int c40_69Overall, int c70_89CW1, int c70_89CW2, int c70_89Exam, int c70_89Overall, int c90_CW1, int c90_CW2, int c90_Exam, int c90_Overall) {
        this.cmr_Id = cmr_Id;
        this.academicSession = academicSession;
        this.Course_id = Course_id;
        this.CL_id = CL_id;
        this.statics = statics;
        this.Studentcount = Studentcount;
        this.comments = comments;
        this.Action = Action;
        this.MeanCW1 = MeanCW1;
        this.MeanCW2 = MeanCW2;
        this.MeanExam = MeanExam;
        this.MeanOverall = MeanOverall;
        this.MedianCW1 = MedianCW1;
        this.MedianCW2 = MedianCW2;
        this.MedianExam = MedianExam;
        this.MedianOverall = MedianOverall;
        this.SDCW1 = SDCW1;
        this.SDCW2 = SDCW2;
        this.SDExam = SDExam;
        this.SDOverall = SDOverall;
        this.c0_39CW1 = c0_39CW1;
        this.c0_39CW2 = c0_39CW2;
        this.c0_39Exam = c0_39Exam;
        this.c0_39Overall = c0_39Overall;
        this.c40_69CW1 = c40_69CW1;
        this.c40_69CW2 = c40_69CW2;
        this.c40_69Exam = c40_69Exam;
        this.c40_69Overall = c40_69Overall;
        this.c70_89CW1 = c70_89CW1;
        this.c70_89CW2 = c70_89CW2;
        this.c70_89Exam = c70_89Exam;
        this.c70_89Overall = c70_89Overall;
        this.c90_CW1 = c90_CW1;
        this.c90_CW2 = c90_CW2;
        this.c90_Exam = c90_Exam;
        this.c90_Overall = c90_Overall;
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

    public int getMeanCW1() {
        return MeanCW1;
    }

    public void setMeanCW1(int MeanCW1) {
        this.MeanCW1 = MeanCW1;
    }

    public int getMeanCW2() {
        return MeanCW2;
    }

    public void setMeanCW2(int MeanCW2) {
        this.MeanCW2 = MeanCW2;
    }

    public int getMeanExam() {
        return MeanExam;
    }

    public void setMeanExam(int MeanExam) {
        this.MeanExam = MeanExam;
    }

    public int getMeanOverall() {
        return MeanOverall;
    }

    public void setMeanOverall(int MeanOverall) {
        this.MeanOverall = MeanOverall;
    }

    public int getMedianCW1() {
        return MedianCW1;
    }

    public void setMedianCW1(int MedianCW1) {
        this.MedianCW1 = MedianCW1;
    }

    public int getMedianCW2() {
        return MedianCW2;
    }

    public void setMedianCW2(int MedianCW2) {
        this.MedianCW2 = MedianCW2;
    }

    public int getMedianExam() {
        return MedianExam;
    }

    public void setMedianExam(int MedianExam) {
        this.MedianExam = MedianExam;
    }

    public int getMedianOverall() {
        return MedianOverall;
    }

    public void setMedianOverall(int MedianOverall) {
        this.MedianOverall = MedianOverall;
    }

    public int getSDCW1() {
        return SDCW1;
    }

    public void setSDCW1(int SDCW1) {
        this.SDCW1 = SDCW1;
    }

    public int getSDCW2() {
        return SDCW2;
    }

    public void setSDCW2(int SDCW2) {
        this.SDCW2 = SDCW2;
    }

    public int getSDExam() {
        return SDExam;
    }

    public void setSDExam(int SDExam) {
        this.SDExam = SDExam;
    }

    public int getSDOverall() {
        return SDOverall;
    }

    public void setSDOverall(int SDOverall) {
        this.SDOverall = SDOverall;
    }

    public int getC0_39CW1() {
        return c0_39CW1;
    }

    public void setC0_39CW1(int c0_39CW1) {
        this.c0_39CW1 = c0_39CW1;
    }

    public int getC0_39CW2() {
        return c0_39CW2;
    }

    public void setC0_39CW2(int c0_39CW2) {
        this.c0_39CW2 = c0_39CW2;
    }

    public int getC0_39Exam() {
        return c0_39Exam;
    }

    public void setC0_39Exam(int c0_39Exam) {
        this.c0_39Exam = c0_39Exam;
    }

    public int getC0_39Overall() {
        return c0_39Overall;
    }

    public void setC0_39Overall(int c0_39Overall) {
        this.c0_39Overall = c0_39Overall;
    }

    public int getC40_69CW1() {
        return c40_69CW1;
    }

    public void setC40_69CW1(int c40_69CW1) {
        this.c40_69CW1 = c40_69CW1;
    }

    public int getC40_69CW2() {
        return c40_69CW2;
    }

    public void setC40_69CW2(int c40_69CW2) {
        this.c40_69CW2 = c40_69CW2;
    }

    public int getC40_69Exam() {
        return c40_69Exam;
    }

    public void setC40_69Exam(int c40_69Exam) {
        this.c40_69Exam = c40_69Exam;
    }

    public int getC40_69Overall() {
        return c40_69Overall;
    }

    public void setC40_69Overall(int c40_69Overall) {
        this.c40_69Overall = c40_69Overall;
    }

    public int getC70_89CW1() {
        return c70_89CW1;
    }

    public void setC70_89CW1(int c70_89CW1) {
        this.c70_89CW1 = c70_89CW1;
    }

    public int getC70_89CW2() {
        return c70_89CW2;
    }

    public void setC70_89CW2(int c70_89CW2) {
        this.c70_89CW2 = c70_89CW2;
    }

    public int getC70_89Exam() {
        return c70_89Exam;
    }

    public void setC70_89Exam(int c70_89Exam) {
        this.c70_89Exam = c70_89Exam;
    }

    public int getC70_89Overall() {
        return c70_89Overall;
    }

    public void setC70_89Overall(int c70_89Overall) {
        this.c70_89Overall = c70_89Overall;
    }

    public int getC90_CW1() {
        return c90_CW1;
    }

    public void setC90_CW1(int c90_CW1) {
        this.c90_CW1 = c90_CW1;
    }

    public int getC90_CW2() {
        return c90_CW2;
    }

    public void setC90_CW2(int c90_CW2) {
        this.c90_CW2 = c90_CW2;
    }

    public int getC90_Exam() {
        return c90_Exam;
    }

    public void setC90_Exam(int c90_Exam) {
        this.c90_Exam = c90_Exam;
    }

    public int getC90_Overall() {
        return c90_Overall;
    }

    public void setC90_Overall(int c90_Overall) {
        this.c90_Overall = c90_Overall;
    }
    
    

}
