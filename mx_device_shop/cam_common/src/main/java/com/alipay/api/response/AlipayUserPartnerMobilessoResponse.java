package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.user.partner.mobilesso response.
 * 
 * @author auto create
 * @since 1.0, 2014-11-05 10:38:47
 */
public class AlipayUserPartnerMobilessoResponse extends AlipayResponse {

	private static final long serialVersionUID = 8552712355193825358L;

	/** 
	 * 2088102114230015
	 */
	@ApiField("user_id")
	private String userId;

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId( ) {
		return this.userId;
	}

}
