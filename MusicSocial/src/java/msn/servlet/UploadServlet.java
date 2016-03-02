package msn.servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import msn.db.MusicFileDb;
import msn.db.PostDb;
import msn.model.Account;
import msn.model.MusicFile;
import msn.model.Post;

@WebServlet(name = "UploadServlet", urlPatterns = {"/theupload"})
@MultipartConfig
public class UploadServlet extends HttpServlet {

    private final Account acc = new Account(1, "B1", "shin.jpg");
    private final static Logger LOGGER = Logger.getLogger(UploadServlet.class.getCanonicalName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("act");
        if ("post-upload".equals(action)) {
            // Get Max File Id
            MusicFileDb mfd = new MusicFileDb();
            int maxFileId = mfd.getMaxFileId();
            if (maxFileId < 0) {
                response.getWriter().write("{\"result\": false, \"reason\": \"can not get max FileId\"}");
                return;
            }
            String newFileName = maxFileId + "";

            // Upload file
            // Create path components to save file
            String text = request.getParameter("text");
            final String path = getServletContext().getRealPath("/");
            final Part filePart = request.getPart("file");
            final String fileName = getFileName(filePart);

            OutputStream out = null;
            InputStream filecontent = null;
            final PrintWriter writer = response.getWriter();

            try {
                out = new FileOutputStream(new File(path + "/music" + File.separator
                        + newFileName + ".wav"));
                filecontent = filePart.getInputStream();

                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
                LOGGER.log(Level.INFO, "File {0} being uploaded to {1}", new Object[]{fileName, path});
            } catch (FileNotFoundException fne) {
                LOGGER.log(Level.SEVERE, "Problems during upload file. Error at: {0}", fne.getMessage());
                response.getWriter().write("{\"result\":false, \"reason\": \"can not save to disk\"}");
                return;
            } finally {
                if (out != null) {
                    out.close();
                }
                if (filecontent != null) {
                    filecontent.close();
                }
//                if (writer != null) {
//                    writer.close();
//                }
            }

            // insert MusicFile
            MusicFileDb musicFileDb = new MusicFileDb();
            MusicFile mf = new MusicFile(newFileName + ".wav");
            musicFileDb.insertFileAudio(mf);
            if (mf.getFileId() == -1) {
                response.getWriter().write("{'result': false, 'reason': 'can not insert to MusicFile'}");
                return;
            }

            // add post
            Post post = new Post("<text>" + text.trim() + "</text>" + "<music>" + newFileName + ".wav" + "</music>", acc.getAccountId());
            PostDb postDb = new PostDb();
            postDb.addPost(post);
            if (post.getPostId() == -1) {
                writer.write("{\"result\": false,\"reason\": \"your post are not inserted to database\"}");
                LOGGER.log(Level.SEVERE, "Post can not be inseted to database");
                return;
            }
            LOGGER.log(Level.INFO, "PostId:{0} is created", new Object[]{post.getPostId()});
            postDb.getAPost(post);
            GsonBuilder builder = new GsonBuilder();
            Gson gson = builder.create();
            writer.write(gson.toJson(post));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
