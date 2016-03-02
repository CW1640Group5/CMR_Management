package msn.model;

public class MusicFile {
    private int FileId = -1;
    private String FileName;
    private int ListenTimes;

    public MusicFile(int FileId, String FileName, int ListenTimes) {
        this.FileId = FileId;
        this.FileName = FileName;
        this.ListenTimes = ListenTimes;
    }
    
    public MusicFile(String FileName) {
        this.FileName = FileName;
    }

    public int getFileId() {
        return FileId;
    }

    public void setFileId(int FileId) {
        this.FileId = FileId;
    }

    public String getFileName() {
        return FileName;
    }

    public void setFileName(String FileName) {
        this.FileName = FileName;
    }

    public int getListenTimes() {
        return ListenTimes;
    }

    public void setListenTimes(int ListenTimes) {
        this.ListenTimes = ListenTimes;
    }
}
