package com.mx.auth.common.model;

import java.util.Date;
import java.util.UUID;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.SearchPageUtil;
import com.mx.auth.common.common.enums.ServiceInfo;

public class TspAuth extends SearchPageUtil {
    private static final long serialVersionUID = 1L;
    
    private String id;
    private int service_type;
    private Date start_date;
    private Date end_date;
    private Date create_time;
    private String auth_order_id;
    private String product_id;
    private String device_no;
    private String auth_type;
    private String free_upg_duration;

    public TspAuth() {

    }

    public boolean isNotNeedAuth() {
        return (ServiceInfo.MX_AUTH.getServiceCode() == service_type || ServiceInfo.MX_NDS_UPGRADE.getServiceCode() == service_type);
    }

    public TspAuth(int service_type, Date start_date, Date end_date, Date create_time, String auth_order_id,
            String product_id, String device_no, String auth_type) {
        this.id = UUID.randomUUID().toString().replaceAll("-", "");
        this.service_type = service_type;
        this.start_date = start_date;
        this.end_date = isNotNeedAuth() ? new Date(Constants.AUTHTIME) : end_date;
        this.create_time = create_time;
        this.auth_order_id = auth_order_id;
        this.product_id = product_id;
        this.device_no = device_no;
        this.auth_type = auth_type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getService_type() {
        return service_type;
    }

    public void setService_type(int service_type) {
        this.service_type = service_type;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getAuth_order_id() {
        return auth_order_id;
    }

    public void setAuth_order_id(String auth_order_id) {
        this.auth_order_id = auth_order_id;
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

    public String getAuth_type() {
        return auth_type;
    }

    public void setAuth_type(String auth_type) {
        this.auth_type = auth_type;
    }

    public String getFree_upg_duration() {
        return free_upg_duration;
    }

    public void setFree_upg_duration(String free_upg_duration) {
        this.free_upg_duration = free_upg_duration;
    }

}
