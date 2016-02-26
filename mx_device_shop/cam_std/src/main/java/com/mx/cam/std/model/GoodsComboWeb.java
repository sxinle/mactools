package com.mx.cam.std.model;

public class GoodsComboWeb {
	private String comboId;
	private String goodsId;
	private String comboName;
	private int years;
	private int nums;
	private int recommendFlag;
	private int price;
	private String comboType;//套餐类型 (1:期限 2：次数 3：版本 );
	private String cardType;//刮刮卡支付类型

	public String getComboId() {
		return comboId;
	}

	public void setComboId(String comboId) {
		this.comboId = comboId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getComboName() {
		return comboName;
	}

	public void setComboName(String comboName) {
		this.comboName = comboName;
	}

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}

	public int getNums() {
		return nums;
	}

	public void setNums(int nums) {
		this.nums = nums;
	}

	public int getRecommendFlag() {
		return recommendFlag;
	}

	public void setRecommendFlag(int recommendFlag) {
		this.recommendFlag = recommendFlag;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getComboType() {
		return comboType;
	}

	public void setComboType(String comboType) {
		this.comboType = comboType;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
}
