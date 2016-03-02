package msn.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import msn.db.AccountDb;
import msn.model.Account;

public class AccountServlet extends HttpServlet {

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
            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("txtEmail")) {
                    request.setAttribute("email", c.getValue());
                    break;
                }
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (action.equals("register")) {
            register(request, response);
        } else if (action.equals("login")) {
            login(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AccountDb db = new AccountDb();
        HttpSession session = request.getSession(true);
//        System.out.println("Session ID: " + session.getId());
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        if (!email.equals("") && !password.equals("")) {
            Account account = new Account(email, password);
            db.login(account);
            if (account.getName() != null) {
//                db.SessionId(session.getId(), email); problem?
                session.setAttribute("account", account);
                Cookie cookie = new Cookie("txtEmail", email);
                response.addCookie(cookie);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("msg", "Login fail");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Enter your email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDb db = new AccountDb();
        String rName = request.getParameter("txtName");
        String rEmail = request.getParameter("txtEmail");
        String rPassword = request.getParameter("txtPassword");
        if (!rName.equals("") && !rEmail.equals("") && !rPassword.equals("")) {
            boolean result = db.Register(rName, rPassword, rEmail);
            if (result) {
                request.setAttribute("msgBlue", "Your account created");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("msgR", "Register fail");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msgR", "Something wrong, Input your Information");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
