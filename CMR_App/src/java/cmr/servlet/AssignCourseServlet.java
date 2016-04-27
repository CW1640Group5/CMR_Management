/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.AssignDB;
import cmr.entity.AssignCourse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nguyen
 */
public class AssignCourseServlet extends HttpServlet {

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

        if (action != null && action.equals("btnAssign")) {
            assignCourse(request, response);
            return;
        }
        AssignDB db = new AssignDB();
        String s = db.getCourseID();
        request.setAttribute("Course_id", s);
        request.getRequestDispatcher("AdminAssign.jsp").forward(request, response);
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

    private void assignCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AssignDB db = new AssignDB();

        String course_id = request.getParameter("txtCourseID");
        String cl_id = request.getParameter("cbCL_id");
        String cm_id = request.getParameter("cbCM_id");
        String fac_id = request.getParameter("cbfac_id");

        if (course_id.equals("") || course_id.equals("comp_") || cl_id.equals("0") || cm_id.equals("0")) {
            request.setAttribute("msgR", "Course_id or cl_id, cm_id can not be null or default.");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AdminAssign.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            boolean result = db.assignCourseToCL(course_id, cl_id, cm_id, fac_id);
            if (result) {
                request.setAttribute("msgBlue", "Asigned");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AdminAssign.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                request.setAttribute("msgR", "Assign Fail");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AdminAssign.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }
    }

}
