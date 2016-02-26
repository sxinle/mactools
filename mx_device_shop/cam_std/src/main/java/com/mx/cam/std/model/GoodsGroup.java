package com.mx.cam.std.model;

import com.mx.cam.common.common.SearchPageUtil;

public class GoodsGroup extends SearchPageUtil {
	private static final long serialVersionUID = 1L;
	private String goods_id;
	private String goods_name;
	private String product_id;// 产品系列ID
	private String region_code;
	private String region_name;
	private String price_info;
	private String goods_pid;// 组合商品ID

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
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

	public String getRegion_name() {
		return region_name;
	}

	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}

	public String getPrice_info() {
		return price_info;
	}

	public void setPrice_info(String price_info) {
		this.price_info = price_info;
	}

	public String getGoods_pid() {
		return goods_pid;
	}

	public void setGoods_pid(String goods_pid) {
		this.goods_pid = goods_pid;
	}

}
