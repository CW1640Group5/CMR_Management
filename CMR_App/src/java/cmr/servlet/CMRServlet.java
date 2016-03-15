/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.CmrDB;
import java.io.IOException;
import java.io.PrintWriter;
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
        request.getRequestDispatcher("AddNewCMR.jsp").forward(request, response);
        String action = request.getParameter("act");
        if (action.equals("createCMR")) {
            createNewCMR(request, response);
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

    private void createNewCMR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CmrDB db = new CmrDB();
        String type = request.getParameter("txtType");
        String doccumentCode = request.getParameter("txtDocCode");
        String name = request.getParameter("txtName");
        String link = request.getParameter("txtLink");
        String cl_id = request.getParameter("txtClId");
        String course_id = request.getParameter("txtCourseID");
        String statics = request.getParameter("txtStatic");

        boolean result = db.addNewCMR(type, doccumentCode, name, link, cl_id, course_id, statics);
        if (result) {
            request.setAttribute("msgBlue", "CMR Added");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/cmr");
            dispatcher.forward(request, response);
            return;
        } else {
            request.setAttribute("msgR", "Add CMR Fail");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/cmr");
            dispatcher.forward(request, response);
            return;
        }
    }

}
