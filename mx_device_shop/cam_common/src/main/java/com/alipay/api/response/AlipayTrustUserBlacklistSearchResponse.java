package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.AliTrust;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.blacklist.search response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:51
 */
public class AlipayTrustUserBlacklistSearchResponse extends AlipayResponse {

	private static final long serialVersionUID = 7582746967911881583L;

	/** 
	 * 黑名单查询结果
	 */
	@ApiField("ali_trust")
	private AliTrust aliTrust;

	public void setAliTrust(AliTrust aliTrust) {
		this.aliTrust = aliTrust;
	}
	public AliTrust getAliTrust( ) {
		return this.aliTrust;
	}

}
