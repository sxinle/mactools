package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.ebpp.subscribe.checkcode.import response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:47
 */
public class AlipayEbppSubscribeCheckcodeImportResponse extends AlipayResponse {

	private static final long serialVersionUID = 7899649674122892444L;

	/** 
	 * 返回结果
	 */
	@ApiField("success")
	private Boolean success;

	public void setSuccess(Boolean success) {
		this.success = success;
	}
	public Boolean getSuccess( ) {
		return this.success;
	}

}
