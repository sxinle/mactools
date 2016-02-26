package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.token.update response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:45
 */
public class AlipayTrustUserTokenUpdateResponse extends AlipayResponse {

	private static final long serialVersionUID = 4147184792625245346L;

	/** 
	 * 新获取的access token
	 */
	@ApiField("access_token")
	private String accessToken;

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getAccessToken( ) {
		return this.accessToken;
	}

}
