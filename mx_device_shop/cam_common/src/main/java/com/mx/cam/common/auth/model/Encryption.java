package com.mx.cam.common.auth.model;

import com.mx.cam.common.common.SearchPageUtil;

/**
 * 加密库实体类
 * 
 * @author zhengy
 */
public class Encryption extends SearchPageUtil {
	private static final long serialVersionUID = 1L;

	private String soft_ver; // 软件版本号
	private String product_id; // 产品系列ID（加密库模型号）
	private String encryption_name; // 加密库名称
	private String encryption_path; // 文件路径
	private String encryption_ver; // 加密库版本
	private String product_name;
	private String act_way;// 激活方式0：原始序列号激活，1：硬件序列号激活

	public String getSoft_ver() {
		return soft_ver;
	}

	public void setSoft_ver(String soft_ver) {
		this.soft_ver = soft_ver;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getEncryption_name() {
		return encryption_name;
	}

	public void setEncryption_name(String encryption_name) {
		this.encryption_name = encryption_name;
	}

	public String getEncryption_path() {
		return encryption_path;
	}

	public void setEncryption_path(String encryption_path) {
		this.encryption_path = encryption_path;
	}

	public String getEncryption_ver() {
		return encryption_ver;
	}

	public void setEncryption_ver(String encryption_ver) {
		this.encryption_ver = encryption_ver;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getAct_way() {
		return act_way;
	}

	public void setAct_way(String act_way) {
		this.act_way = act_way;
	}

}
