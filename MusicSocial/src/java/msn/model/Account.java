package msn.model;

public class Account {
    private int accountId;
    private String password;
    private String email;
    private String name;
    private String avatar;
    private boolean online;

    public Account() {
    }

    public Account(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public Account(int accountId, String name, String avatar) {
        this.accountId = accountId;
        this.name = name;
        this.avatar = avatar;
    }

    public Account(int accountId, String password, String email, String name, String avatar, boolean online) {
        this.accountId = accountId;
        this.password = password;
        this.email = email;
        this.name = name;
        this.avatar = avatar;
        this.online = online;
    }

    public Account(String email, String password) {
        this.password = password;
        this.email = email;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public boolean isOnline() {
        return online;
    }

    public void setOnline(boolean online) {
        this.online = online;
    }
}
