package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.ebpp.subscribe.upload response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:47
 */
public class AlipayEbppSubscribeUploadResponse extends AlipayResponse {

	private static final long serialVersionUID = 8136913716474811279L;

	/** 
	 * 出账机构简称如杭州水务HZWATEr
	 */
	@ApiField("charge_inst")
	private String chargeInst;

	/** 
	 * 业务类型，如缴费JF
	 */
	@ApiField("order_type")
	private String orderType;

	/** 
	 * 子业务类型如水费WATER
	 */
	@ApiField("sub_order_type")
	private String subOrderType;

	public void setChargeInst(String chargeInst) {
		this.chargeInst = chargeInst;
	}
	public String getChargeInst( ) {
		return this.chargeInst;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderType( ) {
		return this.orderType;
	}

	public void setSubOrderType(String subOrderType) {
		this.subOrderType = subOrderType;
	}
	public String getSubOrderType( ) {
		return this.subOrderType;
	}

}
