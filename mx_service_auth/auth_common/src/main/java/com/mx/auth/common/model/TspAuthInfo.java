package com.mx.auth.common.model;

import com.mx.auth.common.common.SearchPageUtil;

public class TspAuthInfo extends SearchPageUtil {
	private static final long serialVersionUID = 1L;

	private String id;
	private String service_type;
	private String start_date;
	private String end_date;
	private String create_time;
	private String auth_order_id;
	private String product_id;
	private String device_no;
	private String auth_type;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getService_type() {
		return service_type;
	}

	public void setService_type(String service_type) {
		this.service_type = service_type;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

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

	public String getAuth_type() {
		return auth_type;
	}

	public void setAuth_type(String auth_type) {
		this.auth_type = auth_type;
	}

}
