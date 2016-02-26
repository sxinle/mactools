package com.mx.cam.common.auth.model;

import com.mx.cam.common.common.SearchPageUtil;

public class Product extends SearchPageUtil {
	private static final long serialVersionUID = 1L;
	private String product_id;// 产品系列ID
	private String product_name;// 产品系列名称
	private String secret_key;// customerKey对应秘钥
	private String permission;// 权限(0:免费 1:收费)
	private String act_way;// 激活方式 0：原始序列号激活，1：硬件序列号激活

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getSecret_key() {
		return secret_key;
	}

	public void setSecret_key(String secret_key) {
		this.secret_key = secret_key;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getAct_way() {
		return act_way;
	}

	public void setAct_way(String act_way) {
		this.act_way = act_way;
	}

}
