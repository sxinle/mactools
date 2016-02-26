package com.mx.cam.std.model;

import com.mx.cam.common.common.SearchPageUtil;

public class OrderState extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

	private String id;// 订单状态ID
	private String state;// 订单状态
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
