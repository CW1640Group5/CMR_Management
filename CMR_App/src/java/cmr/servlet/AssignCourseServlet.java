/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.AssignDB;
import cmr.db.CourseDb;
import cmr.entity.Course;
import cmr.entity.assign;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
        String url = this.getServletContext().getInitParameter("DB_URL");
        String user = this.getServletContext().getInitParameter("DB_USER");
        String pass = this.getServletContext().getInitParameter("DB_PASS");

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("act");

        if (action != null) {
            AssignDB asDB = new AssignDB();
            String CourseId = request.getParameter("CourseId");
            String CL_id = request.getParameter("CL_id");
            String CM_id = request.getParameter("CM_id");
            String start_time = request.getParameter("start_time");
            String end_time = request.getParameter("end_time");
            assign as = new assign(CourseId, CL_id, CM_id, start_time, end_time);
            boolean result = asDB.insertAssign(CourseId, CM_id, CM_id, start_time, end_time);
            if (result) {
                request.setAttribute("msg", "done creating news");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminAssign.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("msg", "Error creating news");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminAssign.jsp");
                dispatcher.forward(request, response);
            }
        }
        AssignDB ad = new AssignDB();
        List<assign> listAss = ad.getAllAssigned();
        request.setAttribute("listAss", listAss);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminAssign.jsp");
        dispatcher.forward(request, response);
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

}
