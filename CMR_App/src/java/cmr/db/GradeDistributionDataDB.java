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
public class GradeDistributionDataDB {

    public boolean addAddGrDisData(int cwDataID, float z39, float f69, float s89, float plus90) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call usp_addGrDistriData(?,?,?,?,?)}");

            cstmt.setInt("cwDataID", cwDataID);
            cstmt.setFloat("0_39", z39);
            cstmt.setFloat("40_69", f69);
            cstmt.setFloat("70_89", s89);
            cstmt.setFloat("90plus", plus90);
            int result = cstmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDistributionDataDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionUtil.closeConnection(conn);
        }
        return false;
    }
}
