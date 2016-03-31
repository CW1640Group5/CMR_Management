/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class StatisticDataDb {
    
    public boolean addNewStatisticData(int cwDataID, String mean, String median, String standardDeviation) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_addStatisticalData(?,?,?,?)}");

            cstmt.setInt("cwDataID", cwDataID);
            cstmt.setString("mean", mean);
            cstmt.setString("median", median);
            cstmt.setString("standardDeviation", standardDeviation);
            int result = cstmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatisticDataDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }
}
