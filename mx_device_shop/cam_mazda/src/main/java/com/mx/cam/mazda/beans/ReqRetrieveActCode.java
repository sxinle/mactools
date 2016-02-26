package com.mx.cam.mazda.beans;

import com.mx.cam.common.common.base.ReqBase;

/**
 * Created by hsong on 16-2-2.
 */
public class ReqRetrieveActCode extends ReqBase {
    // 常规查询
    private String user_name;
    private String phone;
    private String startDate;
    private String endDate;

    // 高级查询
    private String device_no;
    private String vin;
    private String active_type;
    private String order_id;

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getDevice_no() {
        return device_no;
    }

    public void setDevice_no(String device_no) {
        this.device_no = device_no;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getActive_type() {
        return active_type;
    }

    public void setActive_type(String active_type) {
        this.active_type = active_type;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }
}
