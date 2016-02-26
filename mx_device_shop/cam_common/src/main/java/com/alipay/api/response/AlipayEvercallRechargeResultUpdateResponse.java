package com.alipay.api.response;

import java.util.List;
import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.internal.mapping.ApiListField;
import com.alipay.api.domain.EvercallRechargeResult;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.evercall.recharge.result.update response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:38
 */
public class AlipayEvercallRechargeResultUpdateResponse extends AlipayResponse {

	private static final long serialVersionUID = 6238778645641968656L;

	/** 
	 * 充值同步结果
	 */
	@ApiListField("recharge_results")
	@ApiField("evercall_recharge_result")
	private List<EvercallRechargeResult> rechargeResults;

	public void setRechargeResults(List<EvercallRechargeResult> rechargeResults) {
		this.rechargeResults = rechargeResults;
	}
	public List<EvercallRechargeResult> getRechargeResults( ) {
		return this.rechargeResults;
	}

}
