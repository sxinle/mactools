package com.mx.cam.std.model;

public class PaymentModeWeb {
	private String payType;// 支付方式ID
	private String payName;// 支付方式名称
	private String payDescription;// 支付提示语

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayName() {
		return payName;
	}

	public void setPayName(String payName) {
		this.payName = payName;
	}

	public String getPayDescription() {
		return payDescription;
	}

	public void setPayDescription(String payDescription) {
		this.payDescription = payDescription;
	}

}
