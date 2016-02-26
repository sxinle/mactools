package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.gsdata.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-10-28 23:28:42
 */
public class AlipayTrustGsdataGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 3317879762718781989L;

	/** 
	 * 企业工商数据（JSON串，具体格式见线下文档）
	 */
	@ApiField("gs_data")
	private String gsData;

	public void setGsData(String gsData) {
		this.gsData = gsData;
	}
	public String getGsData( ) {
		return this.gsData;
	}

}
