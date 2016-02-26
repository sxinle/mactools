package com.mx.cam.std.model;

public class GoodsItem {
	private String goods_id;// 商品ID

	private String goods_name;// 商品名称

	private String region_name;// 区域名称

	private String combo_id;// 套餐ID

	private String combo_name;// 套餐名称

	private String years;// 有效期

	private String nums;// 次数

	private String price;// 价格

	private String group_flag;// 组合商品标识

	private String region_code;// 区域ID

	private String combo_type;// 套餐类型
	
	private String card_type;//刮刮卡支付类型

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

	public String getRegion_name() {
		return region_name;
	}

	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}

	public String getCombo_id() {
		return combo_id;
	}

	public void setCombo_id(String combo_id) {
		this.combo_id = combo_id;
	}

	public String getCombo_name() {
		return combo_name;
	}

	public void setCombo_name(String combo_name) {
		this.combo_name = combo_name;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getNums() {
		return nums;
	}

	public void setNums(String nums) {
		this.nums = nums;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getGroup_flag() {
		return group_flag;
	}

	public void setGroup_flag(String group_flag) {
		this.group_flag = group_flag;
	}

	public String getRegion_code() {
		return region_code;
	}

	public void setRegion_code(String region_code) {
		this.region_code = region_code;
	}

	public String getCombo_type() {
		return combo_type;
	}

	public void setCombo_type(String combo_type) {
		this.combo_type = combo_type;
	}

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
}
