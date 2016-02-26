package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.TaobaoAutoLoginUrl;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.mobile.url.autologin.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-03-20 17:20:06
 */
public class AlipayMobileUrlAutologinGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 1774198792632623815L;

	/** 
	 * 淘宝免登url返回
	 */
	@ApiField("response")
	private TaobaoAutoLoginUrl response;

	/** 
	 * 获取免登url 是否成功
	 */
	@ApiField("success")
	private Boolean success;

	public void setResponse(TaobaoAutoLoginUrl response) {
		this.response = response;
	}
	public TaobaoAutoLoginUrl getResponse( ) {
		return this.response;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}
	public Boolean getSuccess( ) {
		return this.success;
	}

}
