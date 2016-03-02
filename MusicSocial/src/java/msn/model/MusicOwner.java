package msn.model;

public class MusicOwner {
    private int accountId;
    private int fileId;
    private String fileName;
    private int categoryId;
    private String category;
    private int artistId;
    private String artistName;
    private int songId;
    private String title;

    public MusicOwner(int accountId, int fileId, String fileName, int categoryId, String category, int artistId, String artistName, int songId, String title) {
        this.accountId = accountId;
        this.fileId = fileId;
        this.fileName = fileName;
        this.categoryId = categoryId;
        this.category = category;
        this.artistId = artistId;
        this.artistName = artistName;
        this.songId = songId;
        this.title = title;
    }

    public MusicOwner(int fileId, String fileName, String artistName, String title) {
        this.fileId = fileId;
        this.fileName = fileName;
        this.artistName = artistName;
        this.title = title;
    }
    

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getArtistId() {
        return artistId;
    }

    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }

    public String getArtistName() {
        return artistName;
    }

    public void setArtistName(String artistName) {
        this.artistName = artistName;
    }

    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
}
