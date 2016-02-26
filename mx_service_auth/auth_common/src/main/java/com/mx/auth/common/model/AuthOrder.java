package com.mx.auth.common.model;

import com.mx.auth.common.common.SearchPageUtil;

public class AuthOrder extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

	private String auth_order_id;
	private String order_creat_time;
	private String order_id;
	private String order_source;
	private String order_nums;
	private String oem_id;

	public String getAuth_order_id() {
		return auth_order_id;
	}

	public void setAuth_order_id(String auth_order_id) {
		this.auth_order_id = auth_order_id;
	}

	public String getOrder_creat_time() {
		return order_creat_time;
	}

	public void setOrder_creat_time(String order_creat_time) {
		this.order_creat_time = order_creat_time;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getOrder_source() {
		return order_source;
	}

	public void setOrder_source(String order_source) {
		this.order_source = order_source;
	}

	public String getOrder_nums() {
		return order_nums;
	}

	public void setOrder_nums(String order_nums) {
		this.order_nums = order_nums;
	}

	public String getOem_id() {
		return oem_id;
	}

	public void setOem_id(String oem_id) {
		this.oem_id = oem_id;
	}

}
