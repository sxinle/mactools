package com.mx.cam.common.auth.model;


import com.mx.cam.common.common.SearchPageUtil;

public class NdsDataActiveLog extends SearchPageUtil {

    private static final long serialVersionUID = 1L;

    private String id;
    private String product_id;
    private String device_no;
    private String soft_ver;
    private String data_ver;
    private String region_code;
    private String active_time;
    private String active_code;
    private String active_type;
    private String active_source;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getSoft_ver() {
		return soft_ver;
	}
	public void setSoft_ver(String soft_ver) {
		this.soft_ver = soft_ver;
	}
	public String getData_ver() {
		return data_ver;
	}
	public void setData_ver(String data_ver) {
		this.data_ver = data_ver;
	}
	public String getRegion_code() {
		return region_code;
	}
	public void setRegion_code(String region_code) {
		this.region_code = region_code;
	}
	public String getActive_time() {
		return active_time;
	}
	public void setActive_time(String active_time) {
		this.active_time = active_time;
	}
	public String getActive_code() {
		return active_code;
	}
	public void setActive_code(String active_code) {
		this.active_code = active_code;
	}
	public String getActive_type() {
		return active_type;
	}
	public void setActive_type(String active_type) {
		this.active_type = active_type;
	}
	public String getActive_source() {
		return active_source;
	}
	public void setActive_source(String active_source) {
		this.active_source = active_source;
	}
}
