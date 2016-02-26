package com.mx.auth.mazda.beans;

/**
 * Created by hsong on 16-1-29.
 */
public class ResultTspAuthInfo {

    private String act_time;

    private String vin;

    private String device_no;

    private String tsp_date;

    private String tmc_date;


    public String getAct_time() {
        return act_time;
    }

    public void setAct_time(String act_time) {
        this.act_time = act_time;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getDevice_no() {
        return device_no;
    }

    public void setDevice_no(String device_no) {
        this.device_no = device_no;
    }

    public String getTsp_date() {
        return tsp_date;
    }

    public void setTsp_date(String tsp_date) {
        this.tsp_date = tsp_date;
    }

    public String getTmc_date() {
        return tmc_date;
    }

    public void setTmc_date(String tmc_date) {
        this.tmc_date = tmc_date;
    }


}
