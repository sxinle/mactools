package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.donateitems.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-08-05 17:20:42
 */
public class AlipayDonateitemsGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 5491494234571346252L;

	/** 
	 * 捐款金额
	 */
	@ApiField("amount")
	private String amount;

	/** 
	 * 捐款笔数
	 */
	@ApiField("count")
	private String count;

	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getAmount( ) {
		return this.amount;
	}

	public void setCount(String count) {
		this.count = count;
	}
	public String getCount( ) {
		return this.count;
	}

}
