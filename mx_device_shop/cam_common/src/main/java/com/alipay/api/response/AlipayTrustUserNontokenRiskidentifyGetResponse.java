package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.AliTrustRiskIdentify;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.nontoken.riskidentify.get response.
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:12:09
 */
public class AlipayTrustUserNontokenRiskidentifyGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 2878172453376597785L;

	/** 
	 * 风险识别结果
	 */
	@ApiField("ali_trust_risk_identify")
	private AliTrustRiskIdentify aliTrustRiskIdentify;

	/** 
	 * 服务窗返回码
	 */
	@ApiField("code")
	private String code;

	/** 
	 * 服务窗返回码含义
	 */
	@ApiField("msg")
	private String msg;

	public void setAliTrustRiskIdentify(AliTrustRiskIdentify aliTrustRiskIdentify) {
		this.aliTrustRiskIdentify = aliTrustRiskIdentify;
	}
	public AliTrustRiskIdentify getAliTrustRiskIdentify( ) {
		return this.aliTrustRiskIdentify;
	}

	public void setCode(String code) {
		this.code = code;
	}
	public String getCode( ) {
		return this.code;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMsg( ) {
		return this.msg;
	}

}
