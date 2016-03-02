package msn.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import msn.model.Comment;
import msn.model.Post;
import org.joda.time.DateTime;

public class PostDb {
    public List getPost(int AccountId, int pageNumber, int rowsPage) {
        List<Post> listOfPost = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_getFriendPost(?,?,?)}");
            cstmt.setInt("AccountId", AccountId);
            cstmt.setInt("PageNumber", pageNumber);
            cstmt.setInt("RowsPage", rowsPage);
            cstmt.execute();
            cstmt.getMoreResults();
            ResultSet rs = cstmt.getResultSet();
            while (rs.next()) {
                int postId = rs.getInt("PostId");
                String content = rs.getNString("PostContent");
                DateTime time = new DateTime(rs.getDate("PostTime").getTime());
                int accountId = rs.getInt("PostAccountId");
                String name = rs.getNString("PostName");
                String avatar = rs.getString("PostAvatar");
                int countingLike = rs.getInt("CountingLikePost");
                boolean isLiked = rs.getBoolean("IsLikedPost");
                Post post = new Post(postId, content, time, accountId, name, avatar, countingLike, isLiked, null);
                listOfPost.add(post);
            }
        } catch (SQLException ex) {
            listOfPost = null;
            Logger.getLogger(PostDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return listOfPost;
    }

    public void getAPost(Post post) {
        List<Post> listOfPost = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{ call usp_getAPost(?,?) }");
            cstmt.setInt("OwnerId", post.getAccountId());
            cstmt.setInt("PostId", post.getPostId());
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                post.setContent(rs.getNString("Content"));
                post.setTime(new DateTime(rs.getDate("Time").getTime()));
                post.setName(rs.getNString("PostName"));
                post.setAvatar(rs.getString("Avatar"));
                post.setCountingLike(rs.getInt("CountingLikePost"));
                post.setIsLiked(rs.getBoolean("isLikedPost"));
                post.setComments(new ArrayList<>());
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
    }

    public void addPost(Post post) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_post(?, ?, ?)}");
            cstmt.registerOutParameter("postId", Types.INTEGER);
            cstmt.setInt("OwnerId", post.getAccountId());
            cstmt.setString("content", post.getContent());
            cstmt.executeUpdate();
            Integer newId = cstmt.getInt("postId");
            post.setPostId(newId);
        } catch (SQLException ex) {
            Logger.getLogger(PostDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
    }

    public List<Post> getFullfledgePost(int ownerId, int pageNumber, int rowsPage) {
        List<Post> listOfPost = getPost(ownerId, pageNumber, rowsPage);
        CommentDb db = new CommentDb();
        for (Post post : listOfPost) {
            List<Comment> listOfComment = db.getComment(post.getPostId(), ownerId);
            post.setComments(listOfComment);
        }
        return listOfPost;
    }
}
