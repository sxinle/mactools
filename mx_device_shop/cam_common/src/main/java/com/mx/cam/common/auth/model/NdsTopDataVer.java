package com.mx.cam.common.auth.model;

import com.mx.cam.common.common.SearchPageUtil;

public class NdsTopDataVer extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

	private String device_no;
	private String product_id;
	private String region_code;
	private String data_ver;

    private String soft_ver;// 激活码需要softVer参数,字段当VO用了

    @Override
    public String[] getNotRequiredProps() {
        return new String[]{"region_code"};
    }

	public String getDevice_no() {
		return device_no;
	}

	public void setDevice_no(String device_no) {
		this.device_no = device_no;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getRegion_code() {
		return region_code;
	}

	public void setRegion_code(String region_code) {
		this.region_code = region_code;
	}

	public String getData_ver() {
		return data_ver;
	}

	public void setData_ver(String data_ver) {
		this.data_ver = data_ver;
	}

    public String getSoft_ver() {
        return soft_ver;
    }

    public void setSoft_ver(String soft_ver) {
        this.soft_ver = soft_ver;
    }
}
