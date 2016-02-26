package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.user.mobilesso.token.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-11-18 19:14:59
 */
public class AlipayUserMobilessoTokenGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 7369128257564537132L;

	/** 
	 * 授权用户获得的token
	 */
	@ApiField("token")
	private String token;

	/** 
	 * 授权用户的id。
支付宝账号对应的支付宝唯一用户号。
以2088开头的16位纯数字组成。
	 */
	@ApiField("user_id")
	private String userId;

	public void setToken(String token) {
		this.token = token;
	}
	public String getToken( ) {
		return this.token;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId( ) {
		return this.userId;
	}

}
