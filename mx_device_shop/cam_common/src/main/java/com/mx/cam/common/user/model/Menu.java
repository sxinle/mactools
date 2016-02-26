package com.mx.cam.common.user.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Menu {

    private String id;
    private String name;
    private String parentid;
    private String status;
    private String iconcls;
    private String sort;
    private String strId;
    private String strParentId;
    private String treedeep;
    private String respCode;
    
    
    public String getRespCode() {
		return respCode;
	}

	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}

	private List<Map<String, Object>> menuTree;


    public List<Map<String, Object>> getMenuTree() {
        return menuTree;
    }

    public void setMenuTree(List<Map<String, Object>> menuTree) {
        this.menuTree = menuTree;
    }

    public String getTreedeep() {
        return treedeep;
    }

    public void setTreedeep(String treedeep) {
        this.treedeep = treedeep;
    }

    public String getStrId() {
        return strId;
    }

    public void setStrId(String strId) {
        this.strId = strId;
    }

    public String getStrParentId() {
        return strParentId;
    }

    public void setStrParentId(String strParentId) {
        this.strParentId = strParentId;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    private List<Menu> subMenus = new ArrayList<Menu>();

    public String getIconcls() {
        return iconcls;
    }

    public void setIconcls(String iconcls) {
        this.iconcls = iconcls;
    }

    private String url;

    private String menuType;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType;
    }

    public List<Menu> getSubMenus() {
        return subMenus;
    }

    public void setSubMenus(List<Menu> subMenus) {
        this.subMenus = subMenus;
    }

    public Map<String, Object> toMap() {
        Map<String, Object> menuItem = new HashMap<String, Object>();
        menuItem.put("id", getId());
        menuItem.put("text", getName());
        menuItem.put("state", "open");
        List<Map<String, Object>> childrenItem = new ArrayList<Map<String, Object>>();
        for (Menu menu : subMenus) {
            childrenItem.add(menu.toMap());
        }
        menuItem.put("children", childrenItem);
        return menuItem;
    }

    public Map<String, Object> toMapWithOnClick() {
        Map<String, Object> menuItem = new HashMap<String, Object>();
        menuItem.put("id", getId());
        menuItem.put("name", getName());
        menuItem.put("state", "open");

        Map<String, Object> attributesItem = new HashMap<String, Object>();
        attributesItem.put("url", getUrl());
        menuItem.put("attributes", attributesItem);


        List<Map<String, Object>> childrenItem = new ArrayList<Map<String, Object>>();
        for (Menu menu : subMenus) {
            childrenItem.add(menu.toMapWithOnClick());
        }
        menuItem.put("children", childrenItem);
        return menuItem;
    }

    //调用该方法如果传入的参数是true则认为要显示的树有checkbox，默认让其全部选中。
    public Map<String, Object> toStrMap(boolean isCheck) {
        Map<String, Object> menuItem = new HashMap<String, Object>();
        menuItem.put("id", getStrId());
        menuItem.put("name", getName());
        menuItem.put("state", "open");
        if (isCheck) {
            menuItem.put("checked", true);
        }
        List<Map<String, Object>> childrenItem = new ArrayList<Map<String, Object>>();
        for (Menu menu : subMenus) {
            childrenItem.add(menu.toStrMap(isCheck));
        }
        menuItem.put("children", childrenItem);
        return menuItem;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid;
    }
}
