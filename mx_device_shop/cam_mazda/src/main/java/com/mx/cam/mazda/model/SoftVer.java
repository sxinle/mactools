package com.mx.cam.mazda.model;


import com.mx.cam.common.common.SearchPageUtil;

public class SoftVer extends SearchPageUtil {

    private static final long serialVersionUID = 1L;
    private String id;
    private String soft_ver;
    private String soft_name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSoft_ver() {
        return soft_ver;
    }

    public void setSoft_ver(String soft_ver) {
        this.soft_ver = soft_ver;
    }

    public String getSoft_name() {
        return soft_name;
    }

    public void setSoft_name(String soft_name) {
        this.soft_name = soft_name;
    }
    
}
