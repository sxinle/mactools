package com.mx.cam.std.model;

import java.util.List;

public class GoodsWeb {
	private String goodsId;
	private String goodsName;
	private String regionCode;
	private String regionName;
	private String priceInfo;
	private int groupFlag;
	private List<GoodsGroupWeb> subGoodsList = null;
	private List<GoodsComboWeb> comboList = null;

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getPriceInfo() {
		return priceInfo;
	}

	public void setPriceInfo(String priceInfo) {
		this.priceInfo = priceInfo;
	}

	public int getGroupFlag() {
		return groupFlag;
	}

	public void setGroupFlag(int groupFlag) {
		this.groupFlag = groupFlag;
	}

	public List<GoodsGroupWeb> getSubGoodsList() {
		return subGoodsList;
	}

	public void setSubGoodsList(List<GoodsGroupWeb> subGoodsList) {
		this.subGoodsList = subGoodsList;
	}

	public List<GoodsComboWeb> getComboList() {
		return comboList;
	}

	public void setComboList(List<GoodsComboWeb> comboList) {
		this.comboList = comboList;
	}

}
