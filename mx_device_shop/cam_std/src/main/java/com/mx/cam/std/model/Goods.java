package com.mx.cam.std.model;

import java.util.List;

import com.mx.cam.common.common.SearchPageUtil;

public class Goods extends SearchPageUtil {
	private static final long serialVersionUID = 1L;
	private String goods_id;
	private String goods_name;
	private String product_id;// 产品系列ID
	private String region_code;
	private String region_name;
	private String price_info;
	private String group_flag;
	private String group_flag_name;
	private String up_down_flag;

	private List<GoodsCombo> goodsComboList;
	private List<GoodsGroup> goodsGroupList;

	private String[] groupIds;

	private String sub_goods_id;// 子商品

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

	public String getGroup_flag() {
		return group_flag;
	}

	public void setGroup_flag(String group_flag) {
		this.group_flag = group_flag;
	}

	public String getGroup_flag_name() {
		return group_flag_name;
	}

	public void setGroup_flag_name(String group_flag_name) {
		this.group_flag_name = group_flag_name;
	}

	public String getUp_down_flag() {
		return up_down_flag;
	}

	public void setUp_down_flag(String up_down_flag) {
		this.up_down_flag = up_down_flag;
	}

	public List<GoodsCombo> getGoodsComboList() {
		return goodsComboList;
	}

	public void setGoodsComboList(List<GoodsCombo> goodsComboList) {
		this.goodsComboList = goodsComboList;
	}

	public List<GoodsGroup> getGoodsGroupList() {
		return goodsGroupList;
	}

	public void setGoodsGroupList(List<GoodsGroup> goodsGroupList) {
		this.goodsGroupList = goodsGroupList;
	}

	public String[] getGroupIds() {
		return groupIds;
	}

	public void setGroupIds(String[] groupIds) {
		this.groupIds = groupIds;
	}

	public String getSub_goods_id() {
		return sub_goods_id;
	}

	public void setSub_goods_id(String sub_goods_id) {
		this.sub_goods_id = sub_goods_id;
	}

}
