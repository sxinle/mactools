package com.mx.auth.mazda.beans;


import com.mx.auth.common.common.base.ReqBaseParam;

/**
 * Created by hsong on 16-1-11.
 */
public class TspRenew extends ReqBaseParam {

    private String product_id;
    private String device_no;
    private String service_type;
    private int    years_cnt;

    @Override
    public String toString() {
        return "TspRenew{" +
                "product_id='" + product_id + '\'' +
                ", device_no='" + device_no + '\'' +
                ", service_type='" + service_type + '\'' +
                ", years_cnt=" + years_cnt +
                '}';
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getDevice_no() {
        return device_no;
    }

    public void setDevice_no(String device_no) {
        this.device_no = device_no;
    }

    public String getService_type() {
        return service_type;
    }

    public void setService_type(String service_type) {
        this.service_type = service_type;
    }

    public int getYears_cnt() {
        return years_cnt;
    }

    public void setYears_cnt(int years_cnt) {
        this.years_cnt = years_cnt;
    }
}
