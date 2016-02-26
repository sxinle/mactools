package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.datareceived.send response.
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:11:50
 */
public class AlipayTrustUserDatareceivedSendResponse extends AlipayResponse {

	private static final long serialVersionUID = 6236371741543634245L;

	/** 
	 * 当值为T时，表示回流成功
	 */
	@ApiField("is_successful")
	private String isSuccessful;

	public void setIsSuccessful(String isSuccessful) {
		this.isSuccessful = isSuccessful;
	}
	public String getIsSuccessful( ) {
		return this.isSuccessful;
	}

}
