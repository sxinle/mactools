package com.mx.cam.std.model;

import com.mx.cam.common.common.SearchPageUtil;

public class Activate extends SearchPageUtil {
	private static final long serialVersionUID = 1L;
	private String product_id;
	private String device_no;
	private String soft_ver;
	private String data_version;

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

	public String getSoft_ver() {
		return soft_ver;
	}

	public void setSoft_ver(String soft_ver) {
		this.soft_ver = soft_ver;
	}

	public String getData_version() {
		return data_version;
	}

	public void setData_version(String data_version) {
		this.data_version = data_version;
	}

}
