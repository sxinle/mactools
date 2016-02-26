package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.evercall.contract.cancel response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:40
 */
public class AlipayEvercallContractCancelResponse extends AlipayResponse {

	private static final long serialVersionUID = 1825762997961113796L;

	/** 
	 * 签约手机号
	 */
	@ApiField("mobile_no")
	private String mobileNo;

	/** 
	 * 支付宝账户号
	 */
	@ApiField("user_id")
	private String userId;

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getMobileNo( ) {
		return this.mobileNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId( ) {
		return this.userId;
	}

}
