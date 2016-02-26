package com.mx.cam.mazda.model;


import com.mx.cam.common.common.SearchPageUtil;

public class DataVer extends SearchPageUtil {
    private static final long serialVersionUID = 1L;
    private String id;
    private String ver_id;
    private String ver_name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getVer_id() {
        return ver_id;
    }

    public void setVer_id(String ver_id) {
        this.ver_id = ver_id;
    }

    public String getVer_name() {
        return ver_name;
    }

    public void setVer_name(String ver_name) {
        this.ver_name = ver_name;
    }

}
