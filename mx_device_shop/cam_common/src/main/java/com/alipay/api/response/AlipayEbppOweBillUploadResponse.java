package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.ebpp.owe.bill.upload response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:51
 */
public class AlipayEbppOweBillUploadResponse extends AlipayResponse {

	private static final long serialVersionUID = 6877684788352661321L;

	/** 
	 * 出账机构
	 */
	@ApiField("charge_inst")
	private String chargeInst;

	/** 
	 * 销账机构
	 */
	@ApiField("chargeoff_inst")
	private String chargeoffInst;

	/** 
	 * 业务类型
	 */
	@ApiField("order_type")
	private String orderType;

	/** 
	 * 子业务类型
	 */
	@ApiField("sub_order_type")
	private String subOrderType;

	public void setChargeInst(String chargeInst) {
		this.chargeInst = chargeInst;
	}
	public String getChargeInst( ) {
		return this.chargeInst;
	}

	public void setChargeoffInst(String chargeoffInst) {
		this.chargeoffInst = chargeoffInst;
	}
	public String getChargeoffInst( ) {
		return this.chargeoffInst;
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
