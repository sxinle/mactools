package com.mx.cam.common.auth.model;

import com.mx.cam.common.common.SearchPageUtil;

public class TspAuth extends SearchPageUtil {

    private static final long serialVersionUID = 1L;

    private String auth_order_id;
    private String product_id;
    private String device_no;
	public String getAuth_order_id() {
		return auth_order_id;
	}
	public void setAuth_order_id(String auth_order_id) {
		this.auth_order_id = auth_order_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getDevice_no() {
		return device_no;
	}
	public void setDevice_no(String device_no) {
		this.device_no = device_no;
	}

	

}
