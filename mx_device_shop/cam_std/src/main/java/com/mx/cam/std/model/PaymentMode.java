package com.mx.cam.std.model;

import com.mx.cam.common.common.SearchPageUtil;

public class PaymentMode extends SearchPageUtil {
	private static final long serialVersionUID = 1L;
	private String mode_id;// 支付方式ID
	private String mode_name;// 支付方式名称
	private String mode_description;// 支付提示语

	public String getMode_id() {
		return mode_id;
	}

	public void setMode_id(String mode_id) {
		this.mode_id = mode_id;
	}

	public String getMode_name() {
		return mode_name;
	}

	public void setMode_name(String mode_name) {
		this.mode_name = mode_name;
	}

	public String getMode_description() {
		return mode_description;
	}

	public void setMode_description(String mode_description) {
		this.mode_description = mode_description;
	}

}
