package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.wap.user.alipayinside.authapi response.
 * 
 * @author auto create
 * @since 1.0, 2015-01-15 17:38:15
 */
public class AlipayWapUserAlipayinsideAuthapiResponse extends AlipayResponse {

	private static final long serialVersionUID = 3147956757725981582L;

	/** 
	 * 页面接口无同步返回，authCode已notify方式返回，notify地址为商户在开放平台填写的回调地址
	 */
	@ApiField("auth_code")
	private String authCode;

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getAuthCode( ) {
		return this.authCode;
	}

}
