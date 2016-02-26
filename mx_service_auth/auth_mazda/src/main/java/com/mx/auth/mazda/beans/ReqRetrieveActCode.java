package com.mx.auth.mazda.beans;

import com.mx.auth.common.common.base.ReqBaseParam;

/**
 * Created by hsong on 16-2-2.
 */
public class ReqRetrieveActCode extends ReqBaseParam {

    private String startDate;
    private String endDate;

    private String product_id = "610301";
    private String device_no;
    private String vin;
    private String user_name;
    private String phone;

    private String active_type;// 1:初始激活  2：数据升级
    private String order_id;

    @Override
    public String toString() {
        return "ReqRetrieveActCode{" +
                "startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", product_id='" + product_id + '\'' +
                ", device_no='" + device_no + '\'' +
                ", vin='" + vin + '\'' +
                ", user_name='" + user_name + '\'' +
                ", phone='" + phone + '\'' +
                ", active_type='" + active_type + '\'' +
                '}';
    }

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

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
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
