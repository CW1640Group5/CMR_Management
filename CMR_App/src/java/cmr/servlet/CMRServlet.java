/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.ApproveDB;
import cmr.db.CmrDB;
import cmr.entity.Mailer;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.emptyType;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nguyen
 */
public class CMRServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("act");

        if (action != null && action.equals("btnAddCMR")) {
            addNewCMR(request, response);
            return;
        } else if (action.equals("btnApproveStatic")) {
            approveCMRStatic(request, response);
            return;
        }
        ApproveDB db = new ApproveDB();
        String s = db.getCMR_Static();
        request.setAttribute("CMR_id", s);
        request.getRequestDispatcher("AddNewCMR.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void addNewCMR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CmrDB db = new CmrDB();
        String academicSession = request.getParameter("txtAcademicSession");
        String course_id = request.getParameter("txtCourse_id");
        String cl_id = request.getParameter("txtCl_id");
        String studentcount = request.getParameter("txtStudentCount");

        int MeanCW1 = Integer.parseInt(request.getParameter("txtMeanCW1"));
        int MeanCW2 = Integer.parseInt(request.getParameter("txtMeanCW2"));
        int MeanExam = Integer.parseInt(request.getParameter("txtMeanExam"));
        int MeanOverall = Integer.parseInt(request.getParameter("txtMeanOverall"));

        int MedianCW1 = Integer.parseInt(request.getParameter("txtMedianCW1"));
        int MedianCW2 = Integer.parseInt(request.getParameter("txtMedianCW2"));
        int MedianExam = Integer.parseInt(request.getParameter("txtMedianExam"));
        int MedianOverall = Integer.parseInt(request.getParameter("txtMedianOverall"));

        int SDCW1 = Integer.parseInt(request.getParameter("txtSDCW1"));
        int SDCW2 = Integer.parseInt(request.getParameter("txtSDCW2"));
        int SDExam = Integer.parseInt(request.getParameter("txtSDExam"));
        int SDOverall = Integer.parseInt(request.getParameter("txtSDOverall"));

        int c0_39CW1 = Integer.parseInt(request.getParameter("txt0_39CW1"));
        int c0_39CW2 = Integer.parseInt(request.getParameter("txt0_39CW2"));
        int c0_39Exam = Integer.parseInt(request.getParameter("txt0_39Exam"));
        int c0_39Overall = Integer.parseInt(request.getParameter("txt0_39Overall"));

        int c40_69CW1 = Integer.parseInt(request.getParameter("txt40_69CW1"));
        int c40_69CW2 = Integer.parseInt(request.getParameter("txt40_69CW2"));
        int c40_69Exam = Integer.parseInt(request.getParameter("txt40_69Exam"));
        int c40_69Overall = Integer.parseInt(request.getParameter("txt40_69Overall"));

        int c70_89CW1 = Integer.parseInt(request.getParameter("txt70_89CW1"));
        int c70_89CW2 = Integer.parseInt(request.getParameter("txt70_89CW2"));
        int c70_89Exam = Integer.parseInt(request.getParameter("txt70_89Exam"));
        int c70_89Overall = Integer.parseInt(request.getParameter("txt70_89Overall"));

        int c90_CW1 = Integer.parseInt(request.getParameter("txt90_CW1"));
        int c90_CW2 = Integer.parseInt(request.getParameter("txt90_CW2"));
        int c90_Exam = Integer.parseInt(request.getParameter("txt90_Exam"));
        int c90_Overall = Integer.parseInt(request.getParameter("txt90_Overall"));

        if (academicSession.equals("") || course_id.equals("") || cl_id.equals("")) {
            request.setAttribute("msgR", "Emty Valid Data. Add New CMR Fail");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddNewCMR.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            boolean result = db.addNewCMR(
                    academicSession, 
                    course_id, 
                    cl_id, 
                    studentcount, 
                    
                    MeanCW1, 
                    MeanCW2, 
                    MeanExam, 
                    MeanOverall, 
                    
                    MedianCW1, 
                    MedianCW2, 
                    MedianExam, 
                    MedianOverall, 
                    
                    SDCW1, 
                    SDCW2, 
                    SDExam, 
                    SDOverall, 
                    
                    c0_39CW1, 
                    c0_39CW2, 
                    c0_39Exam, 
                    c0_39Overall, 
                    
                    c40_69CW1, 
                    c40_69CW2, 
                    c40_69Exam, 
                    c40_69Overall, 
                    
                    c70_89CW1, 
                    c70_89CW2, 
                    c70_89Exam, 
                    c70_89Overall, 
                    
                    c90_CW1, 
                    c90_CW2, 
                    c90_Exam, 
                    c90_Overall
            );
            if (result) {
                String to = db.getEmail(course_id);
                String subject = "Request to feedback CMR";
                String text = "you have a new CMR to feedback, the cmr for course:" + course_id + " from CL:" + cl_id + " please feedback before 14 days";
                Mailer.send(to, subject, text);

                request.setAttribute("msgBlue", "CMR Added");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddNewCMR.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                request.setAttribute("msgR", "Add CMR Fail");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddNewCMR.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }
    }

    private void approveCMRStatic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ApproveDB db = new ApproveDB();
        String cmr_id = request.getParameter("CMR_id");
        if (cmr_id.equals("")) {
            request.setAttribute("msgR", "CMR_ID can not be null or default.");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddNewCMR.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            boolean result = db.approveCMRStatic();
            if (result) {
                request.setAttribute("msgBlue1", "Approved");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddNewCMR.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                request.setAttribute("msgR1", "Approve failed");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddNewCMR.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }
    }
}
