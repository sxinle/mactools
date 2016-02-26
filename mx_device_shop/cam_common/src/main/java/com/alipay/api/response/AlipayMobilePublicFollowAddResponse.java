package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.mobile.public.follow.add response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:19
 */
public class AlipayMobilePublicFollowAddResponse extends AlipayResponse {

	private static final long serialVersionUID = 2623772757768655746L;

	/** 
	 * 成功与否的标志
	 */
	@ApiField("code")
	private String code;

	public void setCode(String code) {
		this.code = code;
	}
	public String getCode( ) {
		return this.code;
	}

}
