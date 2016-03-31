/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.StatisticDataDb;
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
public class StatisticDataServlet extends HttpServlet {

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
        if (action != null && action.equals("btnAddStatisticData")) {
            addNewStaticData(request, response);
            return;
        }
        request.getRequestDispatcher("addStatisticalData.jsp").forward(request, response);
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

    private void addNewStaticData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StatisticDataDb db = new StatisticDataDb();
        int cwDataID = Integer.parseInt(request.getParameter("cbAcademicSession"));
        String mean = request.getParameter("txtMean");
        String median = request.getParameter("txtMedian");
        String standardDeviation = request.getParameter("txtStanDeviation");

        if (mean.equals("") || median.equals("") || standardDeviation.equals("")) {
            request.setAttribute("msgR", "Emty Valid Data. Add New Statistical Fail");
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/addStatisticalData.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            boolean result = db.addNewStatisticData(cwDataID, mean, median, standardDeviation);
            if (result) {
                request.setAttribute("msgBlue", "Statistical Added");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/addStatisticalData.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                request.setAttribute("msgR", "Add Statistical Fail");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/addStatisticalData.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }
    }

}
