package com.mx.auth.common.model;

import com.mx.auth.common.common.SearchPageUtil;

public class TspInfo extends SearchPageUtil {

    private static final long serialVersionUID = 1L;

    private String id;
    private String auth_order_id;
    private String free_upg_duration;
    private int    service_type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAuth_order_id() {
        return auth_order_id;
    }

    public void setAuth_order_id(String auth_order_id) {
        this.auth_order_id = auth_order_id;
    }

    public String getFree_upg_duration() {
        return free_upg_duration;
    }

    public void setFree_upg_duration(String free_upg_duration) {
        this.free_upg_duration = free_upg_duration;
    }

    public int getService_type() {
        return service_type;
    }

    public void setService_type(int service_type) {
        this.service_type = service_type;
    }

}
