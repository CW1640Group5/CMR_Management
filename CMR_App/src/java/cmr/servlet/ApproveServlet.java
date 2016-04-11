/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import cmr.entity.CMR_Approve;
import cmr.db.ApproveDB;
import cmr.db.AssignDB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bunn
 */
@WebServlet(name = "ApproveCMR", urlPatterns = {"/ApproveCMR"})
public class ApproveServlet extends HttpServlet {

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
        if (action != null && action.equals("btnApprove")) {
            approveCMR(request, response);
            return;
        }
        ApproveDB db = new ApproveDB();
        String s = db.getCmrID();
        request.setAttribute("CMR_id", s);
        request.getRequestDispatcher("approveDLT.jsp").forward(request, response);
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

    private void approveCMR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ApproveDB db = new ApproveDB();
        String cmr_id = request.getParameter("CMR_id");
        if (cmr_id.equals("")) {
            request.setAttribute("msgR", "CMR_ID can not be null or default.");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/approveDLT.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            boolean result = db.approveCMR();
            if (result) {
                request.setAttribute("msgBlue", "Approved");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/approveDLT.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                request.setAttribute("msgR", "Approve failed");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/approveDLT.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }
    }
}
