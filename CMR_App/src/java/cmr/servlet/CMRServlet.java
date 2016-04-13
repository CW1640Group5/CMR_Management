/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

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
        }
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

        if (academicSession.equals("") || course_id.equals("") || cl_id.equals("")) {
            request.setAttribute("msgR", "Emty Valid Data. Add New CMR Fail");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddNewCMR.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            boolean result = db.addNewCMR(academicSession, course_id, cl_id, studentcount);
            if (result) {
                String to=db.getEmail(course_id);
                String subject="Request to feedback CMR";
                String text="you have a new CMR to feedback, the cmr for course:"+course_id+" from CL:"+cl_id+" please feedback before 14 days";
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

}
