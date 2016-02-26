package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.AliTrustAlipayCert;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.alipaycert.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:54
 */
public class AlipayTrustUserAlipaycertGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 3553625597835934644L;

	/** 
	 * 支付宝实名认证结果
	 */
	@ApiField("ali_trust_alipay_cert")
	private AliTrustAlipayCert aliTrustAlipayCert;

	public void setAliTrustAlipayCert(AliTrustAlipayCert aliTrustAlipayCert) {
		this.aliTrustAlipayCert = aliTrustAlipayCert;
	}
	public AliTrustAlipayCert getAliTrustAlipayCert( ) {
		return this.aliTrustAlipayCert;
	}

}
