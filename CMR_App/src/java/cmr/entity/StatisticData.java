/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

/**
 *
 * @author Nguyen
 */
public class StatisticData {

    private int id;
    private int cmr_id;
    private int cwDataID;
    private String mean;
    private String median;
    private String standardDeviation;

    public StatisticData(int id, int cmr_id, int cwDataID, String mean, String median, String standardDeviation) {
        this.id = id;
        this.cmr_id = cmr_id;
        this.cwDataID = cwDataID;
        this.mean = mean;
        this.median = median;
        this.standardDeviation = standardDeviation;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCmr_id() {
        return cmr_id;
    }

    public void setCmr_id(int cmr_id) {
        this.cmr_id = cmr_id;
    }

    public int getCwDataID() {
        return cwDataID;
    }

    public void setCwDataID(int cwDataID) {
        this.cwDataID = cwDataID;
    }

    public String getMean() {
        return mean;
    }

    public void setMean(String mean) {
        this.mean = mean;
    }

    public String getMedian() {
        return median;
    }

    public void setMedian(String median) {
        this.median = median;
    }

    public String getStandardDeviation() {
        return standardDeviation;
    }

    public void setStandardDeviation(String standardDeviation) {
        this.standardDeviation = standardDeviation;
    }

}
