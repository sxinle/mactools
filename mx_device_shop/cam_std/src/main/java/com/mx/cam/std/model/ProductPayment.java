package com.mx.cam.std.model;

import com.mx.cam.common.common.SearchPageUtil;

public class ProductPayment extends SearchPageUtil {
	private static final long serialVersionUID = 1L;
	private String product_id;
	private String mode_id;// 支付方式ID
	private String[] mode_ids;// 支付方式ID

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getMode_id() {
		return mode_id;
	}

	public void setMode_id(String mode_id) {
		this.mode_id = mode_id;
	}

	public String[] getMode_ids() {
		return mode_ids;
	}

	public void setMode_ids(String[] mode_ids) {
		this.mode_ids = mode_ids;
	}

}
