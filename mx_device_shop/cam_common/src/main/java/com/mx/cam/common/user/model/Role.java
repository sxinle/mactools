package com.mx.cam.common.user.model;


import com.mx.cam.common.common.SearchPageUtil;

public class Role extends SearchPageUtil {

    private static final long serialVersionUID = 1L;

    private String role_id;
    private String role_name;
    private String buildin;
    private String description;

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getBuildin() {
        return buildin;
    }

    public void setBuildin(String buildin) {
        this.buildin = buildin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
