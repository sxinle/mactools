package com.alipay.api.response;

import java.util.List;
import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.internal.mapping.ApiListField;
import com.alipay.api.domain.DishonestyQueryResultInfo;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.lldata.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-10-30 23:12:18
 */
public class AlipayTrustLldataGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 8661919984424764971L;

	/** 
	 * 失信记录详情
	 */
	@ApiListField("results")
	@ApiField("dishonesty_query_result_info")
	private List<DishonestyQueryResultInfo> results;

	public void setResults(List<DishonestyQueryResultInfo> results) {
		this.results = results;
	}
	public List<DishonestyQueryResultInfo> getResults( ) {
		return this.results;
	}

}
