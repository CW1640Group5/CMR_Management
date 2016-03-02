package msn.model;

import org.joda.time.DateTime;

public class Comment {
    private int postId;
    private int commentId;
    private int accountId;
    private String content;
    private DateTime time;
    private String name;
    private String avatar;
    private int countingLike;
    private boolean isLiked;

    public Comment(int commentId, int accountId, String content, DateTime time, String name, String avatar, int countingLike, boolean isLiked) {
        this.commentId = commentId;
        this.accountId = accountId;
        this.content = content;
        this.time = time;
        this.name = name;
        this.avatar = avatar;
        this.countingLike = countingLike;
        this.isLiked = isLiked;
    }

    public Comment(int postId, int commentId, int accountId, String content, DateTime time, String name, String avatar, int countingLike, boolean isLiked) {
        this.postId = postId;
        this.commentId = commentId;
        this.accountId = accountId;
        this.content = content;
        this.time = time;
        this.name = name;
        this.avatar = avatar;
        this.countingLike = countingLike;
        this.isLiked = isLiked;
    }
    
    public Comment(int postId, String content, int accountId, String name, String avatar) {
        this.postId = postId;
        this.content = content;
        this.accountId = accountId;
        this.name = name;
        this.avatar = avatar;
    }
    
    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }
    
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public DateTime getTime() {
        return time;
    }

    public void setTime(DateTime time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getCountingLike() {
        return countingLike;
    }

    public void setCountingLike(int countingLike) {
        this.countingLike = countingLike;
    }

    public boolean isIsLiked() {
        return isLiked;
    }

    public void setIsLiked(boolean isLiked) {
        this.isLiked = isLiked;
    }
}
