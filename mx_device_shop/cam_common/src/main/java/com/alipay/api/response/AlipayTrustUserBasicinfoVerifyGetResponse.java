package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.basicinfo.verify.get response.
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:09:15
 */
public class AlipayTrustUserBasicinfoVerifyGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 5596842913689542558L;

	/** 
	 * {
     姓名：1/0 （1：匹配上 0：没匹配上 2:支付宝没有收录该信息）
     身份证信息:  1/0
（用户没传的字段，不匹配，也不在结果中显示该字段）
}
	 */
	@ApiField("verify_info")
	private String verifyInfo;

	public void setVerifyInfo(String verifyInfo) {
		this.verifyInfo = verifyInfo;
	}
	public String getVerifyInfo( ) {
		return this.verifyInfo;
	}

}
