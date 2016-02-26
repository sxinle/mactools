package com.mx.cam.common.user.model;

import com.mx.cam.common.common.SearchPageUtil;

public class Group extends SearchPageUtil {
	private static final long serialVersionUID = 1L;

	private String group_id;
	private String group_name;
	private String buildin;
	private String description;

	private String roleIDs;
	private String roleNames;

	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBuildin() {
		return buildin;
	}
	public void setBuildin(String buildin) {
		this.buildin = buildin;
	}
	public String getRoleIDs() {
		return roleIDs;
	}
	public void setRoleIDs(String roleIDs) {
		this.roleIDs = roleIDs;
	}
	public String getRoleNames() {
		return roleNames;
	}
	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}
}
