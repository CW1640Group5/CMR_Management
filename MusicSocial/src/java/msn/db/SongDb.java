package msn.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import msn.model.MusicOwner;

public class SongDb {
    public List<MusicOwner> searchMusic(String music, int type, int pageNumber, int rowsPage){
        Connection conn = null;
        List<MusicOwner> listOfSong = new ArrayList<>();
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_searchMusic(?,?,?,?)}");
            cstmt.setNString("Music", music);
            cstmt.setInt("Type", type);
            cstmt.setInt("PageNumber", pageNumber);
            cstmt.setInt("RowsPage", rowsPage);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                String artistName = rs.getNString("ArtistName");
                String title = rs.getNString("Title");
                String fileName = rs.getString("FileName");
                int fileId = rs.getInt("FileId");
                MusicOwner mo = new MusicOwner(fileId, fileName, artistName, title);
                listOfSong.add(mo);
            }
            return listOfSong;
        } catch (SQLException ex) {
            Logger.getLogger(SongDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return null;
    }
    
    //    test1:
//    public static void main(String[] args) {
//        MsnDb db = new MsnDb();
//        List<MusicOwner> list = db.searchMusic("I Saw Her Standing There", 0, 1, 50);
//        System.out.println(list);
//    }
}
