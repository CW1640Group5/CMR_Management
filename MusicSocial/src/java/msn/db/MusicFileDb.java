package msn.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;
import msn.model.MusicFile;

public class MusicFileDb {
    public int getMaxFileId(){
        Connection conn = null;
        int maxFileId = -1;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_getMaxFileId(?)}");
            cstmt.registerOutParameter("MaxFileId", Types.INTEGER);
            cstmt.execute();
            maxFileId = cstmt.getInt("MaxFileId");
        } catch (SQLException ex) {
            Logger.getLogger(MusicFileDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return maxFileId;
    }
    
    public void insertFileAudio(MusicFile musicFile){
        try {
            Connection conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_insertFile(?, ?)}");
            cstmt.registerOutParameter("FileId", Types.INTEGER);
            cstmt.setString("FileName", musicFile.getFileName());
            cstmt.executeUpdate();
            musicFile.setFileId(cstmt.getInt("FileId"));
        } catch (SQLException ex) {
            Logger.getLogger(MusicFileDb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
