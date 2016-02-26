package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.gotone.ackcode.send response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:38
 */
public class AlipayGotoneAckcodeSendResponse extends AlipayResponse {

	private static final long serialVersionUID = 1551757323784796379L;

	/** 
	 * 返回结果
	 */
	@ApiField("result_code")
	private String resultCode;

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultCode( ) {
		return this.resultCode;
	}

}
