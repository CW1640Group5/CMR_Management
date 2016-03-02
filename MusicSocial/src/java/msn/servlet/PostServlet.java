package msn.servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import msn.db.PostDb;
import msn.model.Account;
import msn.model.Post;

public class PostServlet extends HttpServlet {
    
    private final static Logger LOGGER = Logger.getLogger(PostServlet.class.getCanonicalName());
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        Account acc = (Account) session.getAttribute("account");
        String action = request.getParameter("act");
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else if (acc != null && ( "login".equals(action) || null == action )) {
            getPosts(request, response);
        } else if ("post".equals(action)) {
            postPlaintext(request, response);
        } else if ("getAPost".equals(action)) {
            getAPost(request, response);
        }
    }

    private void postPlaintext(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(true);
        Account acc = (Account) session.getAttribute("account");
        String text = request.getParameter("text");
        PostDb db = new PostDb();
        Post post = new Post("<text>" + text.trim() + "</text>", acc.getAccountId());
        db.addPost(post);
        if (post.getPostId() > 0) {
            response.getWriter().write("{\"result\": true, \"postId\": " + post.getPostId() + "}");
        } else {
            response.getWriter().write("{'result': false, 'reason': 'your post are not inserted to database'}");
        }
    }

//    int rowsPage = 5, pageNumber = 1;
//            List<Post> listOfPost;
//            if ("json".equals(request.getParameter("type"))) {
//                pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
//                listOfPost = db.getFullfledgePost(ownerId, pageNumber, rowsPage);
//                request.setAttribute("listOfPost", listOfPost);
//                GsonBuilder builder = new GsonBuilder();
//                Gson gson = builder.create();
//                response.getWriter().write(gson.toJson(listOfPost));
//                return;
//            }
//            listOfPost = db.getFullfledgePost(ownerId, pageNumber, rowsPage);
//            request.setAttribute("listOfPost", listOfPost);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
//            dispatcher.forward(request, response);
    private void getPosts(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        HttpSession session = request.getSession(true);
        Account acc = (Account) session.getAttribute("account");
        int rowsPage = 5, pageNumber = 1;
        PostDb db = new PostDb();
        List<Post> listOfPost;
        if ("json".equals(request.getParameter("type"))) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            listOfPost = db.getFullfledgePost(acc.getAccountId(), pageNumber, rowsPage);
            request.setAttribute("listOfPost", listOfPost);
            GsonBuilder builder = new GsonBuilder();
            Gson gson = builder.create();
            response.getWriter().write(gson.toJson(listOfPost));
            LOGGER.log(Level.INFO, "AccountId = {}, Page = ", new Object[]{acc.getAccountId(), pageNumber});
            return;
        }
        listOfPost = db.getFullfledgePost(acc.getAccountId(), pageNumber, rowsPage);
        request.setAttribute("listOfPost", listOfPost);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }

    private void getAPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        HttpSession session = request.getSession(true);
        Account acc = (Account) session.getAttribute("account");
        int postId = Integer.parseInt(request.getParameter("postId"));
        Post post = new Post(postId, acc.getAccountId());
        PostDb postDb = new PostDb();
        postDb.getAPost(post);
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.create();
        response.getWriter().write(gson.toJson(post));
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
