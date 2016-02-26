package com.mx.cam.std.model;

import com.mx.cam.common.common.SearchPageUtil;

public class GoodsCombo extends SearchPageUtil {
	private static final long serialVersionUID = 1L;
	private String combo_id;
	private String goods_id;
	private String combo_name;
	private String years;
	private String nums;
	private String recommend_flag;
	private String price;
	private String recommend_flag_name;
	private String combo_type;//套餐类型 (1:期限 2：次数 3：版本 )
	private String combo_type_name;
	private String card_type;//刮刮卡支付类型

	public String getCombo_id() {
		return combo_id;
	}

	public void setCombo_id(String combo_id) {
		this.combo_id = combo_id;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
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

	public String getRecommend_flag() {
		return recommend_flag;
	}

	public void setRecommend_flag(String recommend_flag) {
		this.recommend_flag = recommend_flag;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRecommend_flag_name() {
		return recommend_flag_name;
	}

	public void setRecommend_flag_name(String recommend_flag_name) {
		this.recommend_flag_name = recommend_flag_name;
	}

	public String getCombo_type() {
		return combo_type;
	}

	public void setCombo_type(String combo_type) {
		this.combo_type = combo_type;
	}

	public String getCombo_type_name() {
		return combo_type_name;
	}

	public void setCombo_type_name(String combo_type_name) {
		this.combo_type_name = combo_type_name;
	}

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	
}
