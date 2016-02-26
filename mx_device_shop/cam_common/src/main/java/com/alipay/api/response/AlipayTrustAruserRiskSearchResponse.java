package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.AliTrustRiskARUser;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.aruser.risk.search response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:56
 */
public class AlipayTrustAruserRiskSearchResponse extends AlipayResponse {

	private static final long serialVersionUID = 6355979617562944995L;

	/** 
	 * 安融征信风险名单查询结果
	 */
	@ApiField("ali_trust_risk_ar_user")
	private AliTrustRiskARUser aliTrustRiskArUser;

	public void setAliTrustRiskArUser(AliTrustRiskARUser aliTrustRiskArUser) {
		this.aliTrustRiskArUser = aliTrustRiskArUser;
	}
	public AliTrustRiskARUser getAliTrustRiskArUser( ) {
		return this.aliTrustRiskArUser;
	}

}
