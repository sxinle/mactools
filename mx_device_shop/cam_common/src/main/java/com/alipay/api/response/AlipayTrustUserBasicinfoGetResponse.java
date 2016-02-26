package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.AliTrustBasicInfo;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.basicinfo.get response.
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:11:25
 */
public class AlipayTrustUserBasicinfoGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 7442351258369161447L;

	/** 
	 * 用户基本信息(已废弃)
	 */
	@ApiField("ali_trust_basicinfo")
	private AliTrustBasicInfo aliTrustBasicinfo;

	/** 
	 * 用户基本信息
	 */
	@ApiField("ali_trust_user_basic_info")
	private AliTrustBasicInfo aliTrustUserBasicInfo;

	public void setAliTrustBasicinfo(AliTrustBasicInfo aliTrustBasicinfo) {
		this.aliTrustBasicinfo = aliTrustBasicinfo;
	}
	public AliTrustBasicInfo getAliTrustBasicinfo( ) {
		return this.aliTrustBasicinfo;
	}

	public void setAliTrustUserBasicInfo(AliTrustBasicInfo aliTrustUserBasicInfo) {
		this.aliTrustUserBasicInfo = aliTrustUserBasicInfo;
	}
	public AliTrustBasicInfo getAliTrustUserBasicInfo( ) {
		return this.aliTrustUserBasicInfo;
	}

}
