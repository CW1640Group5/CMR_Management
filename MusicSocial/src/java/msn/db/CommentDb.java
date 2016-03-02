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
import org.joda.time.DateTime;

public class CommentDb {

    public List addComment(Comment comment) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_addComment(?, ?, ?, ?, ?)}");
            cstmt.registerOutParameter("CommentId", Types.INTEGER);
            cstmt.registerOutParameter("Time", Types.DATE);
            cstmt.setInt("OwnerId", comment.getAccountId());
            cstmt.setString("Content", comment.getContent());
            cstmt.setInt("PostId", comment.getPostId());
            cstmt.executeUpdate();
            comment.setCommentId(cstmt.getInt("CommentId"));
            comment.setTime(new DateTime(cstmt.getDate("Time").getTime()));
            List<Comment> listOfComments = new ArrayList<>();
            listOfComments.add(comment);
            return listOfComments;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return null;
    }

    protected List getComment(int postId, int ownerId) {
        List<Comment> listOfComment = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_getCommentOfAPost(?, ?)}");
            cstmt.setInt("PostId", postId);
            cstmt.setInt("AccountId", ownerId);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                int commentId = rs.getInt("CommentId");
                int accountId = rs.getInt("CommentAccountId");
                String content = rs.getNString("CommentContent");
                DateTime time = new DateTime(rs.getDate("CommentTime").getTime());
                String name = rs.getNString("CommentName");
                String avatar = rs.getString("CommentAvatar");
                int countingLike = rs.getInt("CountingLikeComment");
                boolean isLiked = rs.getBoolean("IsLikedComment");
                Comment comment = new Comment(commentId, accountId, content, time, name, avatar, countingLike, isLiked);
                listOfComment.add(comment);
            }
        } catch (SQLException ex) {
            listOfComment = null;
            Logger.getLogger(CommentDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return listOfComment;
    }
}
