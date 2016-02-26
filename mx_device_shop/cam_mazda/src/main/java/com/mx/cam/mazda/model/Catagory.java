package com.mx.cam.mazda.model;


import com.mx.cam.common.common.SearchPageUtil;

public class Catagory extends SearchPageUtil {
    private static final long serialVersionUID = 1L;
    private String catagory_id;// 商品类别ID
    private String catagory_name;// 商品类别名称
    private String id;// 临时使用，便于前端使用

    public String getCatagory_id() {
        return catagory_id;
    }

    public void setCatagory_id(String catagory_id) {
        this.catagory_id = catagory_id;
    }

    public String getCatagory_name() {
        return catagory_name;
    }

    public void setCatagory_name(String catagory_name) {
        this.catagory_name = catagory_name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
