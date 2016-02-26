package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.nontoken.admission.get response.
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:12:23
 */
public class AlipayTrustUserNontokenAdmissionGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 8764287739244181131L;

	/** 
	 * admissionStatus：1//0代表非准入，1代表准入
	 */
	@ApiField("admission_info")
	private String admissionInfo;

	public void setAdmissionInfo(String admissionInfo) {
		this.admissionInfo = admissionInfo;
	}
	public String getAdmissionInfo( ) {
		return this.admissionInfo;
	}

}
