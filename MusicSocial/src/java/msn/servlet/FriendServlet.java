/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package msn.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import msn.db.FriendDB;
import msn.model.Friend;
import msn.model.User;

/**
 *
 * @author Pham
 */
@WebServlet(name = "FriendServlet", urlPatterns = {"/FriendServlet"})
public class FriendServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("act");
        FriendDB db = new FriendDB();

        if (action == null) {
            List<Friend> listOfFriends = db.getAllFriends(4);
            request.setAttribute("listOfFriends", listOfFriends);
            RequestDispatcher dispatcher = request.getRequestDispatcher("friend.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("addfriend")) {
            int id1 = 1;
            int id2 = Integer.parseInt(request.getParameter("userId"));

            boolean result = db.addfriend(id1, id2);

            if (result) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("friend.jsp");
                dispatcher.forward(request, response);
            }
        } else if (action.equals("confirmrequest")) {
            int id1 = 1;
            int requestid = Integer.parseInt(request.getParameter("userId"));

            boolean result = db.acceptfriend(id1, requestid);

            if (result) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("friend.jsp");
                dispatcher.forward(request, response);
            }
        } else if (action.equals("unfriend")) {
            int id1 = 1;
            int id2 = Integer.parseInt(request.getParameter("userId"));
            

            boolean result = db.unfriend(id1, id2);
            RequestDispatcher dispatcher = request.getRequestDispatcher("friend.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("searchuser")) {
            int id = 1;
            String name = request.getParameter("name");
            List<User> listOfUsers = db.getUser(1, name);
            request.setAttribute("listOfUsers", listOfUsers);
            RequestDispatcher dispatcher = request.getRequestDispatcher("friend.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("cancelrequest")) {
            int id1 = 1;
            int id2 = Integer.parseInt(request.getParameter("userId"));
            

            boolean result = db.unfriend(id1, id2);
            RequestDispatcher dispatcher = request.getRequestDispatcher("friend.jsp");
            dispatcher.forward(request, response);
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

}
