/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.CourseDB;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nguyen
 */
public class CourseServlet extends HttpServlet {

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
        if (action == null) {
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } else if (action.equals("addNewCourse")) {
            addNewCourse(request, response);
        }

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

    private void addNewCourse(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        CourseDB db = new CourseDB();
        String cId = request.getParameter("txtcID");
        String cName = request.getParameter("txtcName");
        String cStartDate = request.getParameter("txtcStartDate");
        String cEndDate = request.getParameter("txtcEndDate");

        if (!cId.equals("") && !cName.equals("") && !cStartDate.equals("") && !cEndDate.equals("")) {
            boolean result = db.addNewCourse(cId, cName, cStartDate, cEndDate);
            if (result) {
                request.setAttribute("msgBlue", "New Course Added");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else {
                request.setAttribute("msgR", "Add New course Fail");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msgR", "Something wrong! Add New Course Fail");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    }

}
