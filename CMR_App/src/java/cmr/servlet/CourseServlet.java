/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.CourseDb;
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

        if (action != null && action.equals("btnAddNewCourse")) {
            addNewCourse(request, response);
            return;
        }
        request.getRequestDispatcher("admin.jsp").forward(request, response);

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

    private void addNewCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseDb db = new CourseDb();
        String cId = request.getParameter("txtcID");
        String cName = request.getParameter("txtcName");
        String description = request.getParameter("txtDescription");
        String startDate = request.getParameter("txtcStartDate");
        String endDate = request.getParameter("txtcEndDate");

        if (cId.equals("") && cName.equals("") && startDate.equals("") && endDate.equals("")) {
            request.setAttribute("msgR", "Something wrong! Add New Course Fail");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/admin.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            boolean result = db.addNewCourse(cId, cName, description, startDate, endDate);
            if (result) {
                request.setAttribute("msgBlue", "New Course Added");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/admin.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                request.setAttribute("msgR", "Add New course Fail");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/admin.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }
    }

}
