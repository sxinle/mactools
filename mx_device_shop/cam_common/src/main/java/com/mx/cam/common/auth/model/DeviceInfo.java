package com.mx.cam.common.auth.model;

import com.mx.cam.common.common.SearchPageUtil;

public class DeviceInfo extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

	private String product_id;
	private String vin;
	private String device_no;
	private String user_name;
	private String card_no;
	private String mobile_phone;
	private String fixed_phone;
	private String gender;
	private String address;
	private String mail;
	private String create_time;
	private String device_type;
	private String scheme_id;
	private String oem_id;

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getDevice_no() {
		return device_no;
	}

	public void setDevice_no(String device_no) {
		this.device_no = device_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	public String getMobile_phone() {
		return mobile_phone;
	}

	public void setMobile_phone(String mobile_phone) {
		this.mobile_phone = mobile_phone;
	}

	public String getFixed_phone() {
		return fixed_phone;
	}

	public void setFixed_phone(String fixed_phone) {
		this.fixed_phone = fixed_phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getDevice_type() {
		return device_type;
	}

	public void setDevice_type(String device_type) {
		this.device_type = device_type;
	}

	public String getScheme_id() {
		return scheme_id;
	}

	public void setScheme_id(String scheme_id) {
		this.scheme_id = scheme_id;
	}

	public String getOem_id() {
		return oem_id;
	}

	public void setOem_id(String oem_id) {
		this.oem_id = oem_id;
	}

}
