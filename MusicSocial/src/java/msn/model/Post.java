package msn.model;

import java.util.List;
import org.joda.time.DateTime;

public class Post {
    private int postId;
    private String content;
    private DateTime time;
    private int accountId;
    private String name;
    private String avatar;
    private int countingLike;
    private boolean isLiked;
    private List<Comment> comments;

    public Post(int postId, String content, DateTime time, int accountId, String name, String avatar, int countingLike, boolean isLiked, List<Comment> comments) {
        this.postId = postId;
        this.content = content;
        this.time = time;
        this.accountId = accountId;
        this.name = name;
        this.avatar = avatar;
        this.countingLike = countingLike;
        this.isLiked = isLiked;
        this.comments = comments;
    }
    
    public Post(int postId, int accountId){
        this.postId = postId;
        this.accountId = accountId;
    }

    public Post(String content, int accountId) {
        this.content = content;
        this.accountId = accountId;
    }
    
    public Post(int postId,String content, int accountId){ //post
        this.postId = postId;
        this.content = content;
        this.accountId = accountId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
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

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
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

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
