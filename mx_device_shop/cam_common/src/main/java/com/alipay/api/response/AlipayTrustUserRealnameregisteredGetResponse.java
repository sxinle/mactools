package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.AliTrustRealNameRegistration;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.realnameregistered.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:49
 */
public class AlipayTrustUserRealnameregisteredGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 6458268594237492886L;

	/** 
	 * 实名制返回结果
	 */
	@ApiField("ali_trust_real_name_registration")
	private AliTrustRealNameRegistration aliTrustRealNameRegistration;

	public void setAliTrustRealNameRegistration(AliTrustRealNameRegistration aliTrustRealNameRegistration) {
		this.aliTrustRealNameRegistration = aliTrustRealNameRegistration;
	}
	public AliTrustRealNameRegistration getAliTrustRealNameRegistration( ) {
		return this.aliTrustRealNameRegistration;
	}

}
