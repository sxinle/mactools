package com.mx.auth.common.model;

import com.mx.auth.common.common.SearchPageUtil;

public class Activate extends SearchPageUtil {

	@Override
	public String[] getNotRequiredProps() {
		return new String[] { "card_no", "fixed_phone", "gender", "address",
				"mail", "creat_time" };
	}

	private static final long serialVersionUID = 1L;
	private String product_id;
	private String device_no;
	private String vin;
	private String soft_ver;
	private String data_version;

	private String card_no;
	private String soft_ver_id;
	private String data_version_id;
	private String user_name;
	private String mobile_phone;
	private String fixed_phone;
	private String gender;
	private String address;
	private String mail;
	private String creat_time;
	private String scheme_id;
	private String oem_id;

	@Override
	public String toString() {
		return "Activate{" + "product_id='" + product_id + '\''
				+ ", device_no='" + device_no + '\'' + ", vin='" + vin + '\''
				+ ", soft_ver='" + soft_ver + '\'' + ", data_version='"
				+ data_version + '\'' + ", card_no='" + card_no + '\''
				+ ", soft_ver_id='" + soft_ver_id + '\''
				+ ", data_version_id='" + data_version_id + '\''
				+ ", user_name='" + user_name + '\'' + ", mobile_phone='"
				+ mobile_phone + '\'' + ", fixed_phone='" + fixed_phone + '\''
				+ ", gender='" + gender + '\'' + ", address='" + address + '\''
				+ ", mail='" + mail + '\'' + ", creat_time='" + creat_time
				+ '\'' + '}';
	}

	public String getDevice_no() {
		return device_no;
	}

	public void setDevice_no(String device_no) {
		this.device_no = device_no;
	}

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getSoft_ver_id() {
		return soft_ver_id;
	}

	public void setSoft_ver_id(String soft_ver_id) {
		this.soft_ver_id = soft_ver_id;
	}

	public String getData_version() {
		return data_version;
	}

	public void setData_version(String data_version) {
		this.data_version = data_version;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public String getSoft_ver() {
		return soft_ver;
	}

	public void setSoft_ver(String soft_ver) {
		this.soft_ver = soft_ver;
	}

	public String getData_version_id() {
		return data_version_id;
	}

	public void setData_version_id(String data_version_id) {
		this.data_version_id = data_version_id;
	}

	public String getCreat_time() {
		return creat_time;
	}

	public void setCreat_time(String creat_time) {
		this.creat_time = creat_time;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
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
