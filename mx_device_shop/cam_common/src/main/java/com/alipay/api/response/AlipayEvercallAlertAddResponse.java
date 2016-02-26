package com.alipay.api.response;

import java.util.List;
import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.internal.mapping.ApiListField;
import com.alipay.api.domain.EvercallAlertResult;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.evercall.alert.add response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:41
 */
public class AlipayEvercallAlertAddResponse extends AlipayResponse {

	private static final long serialVersionUID = 2589113618338582979L;

	/** 
	 * 预警处理结果
	 */
	@ApiListField("alert_results")
	@ApiField("evercall_alert_result")
	private List<EvercallAlertResult> alertResults;

	public void setAlertResults(List<EvercallAlertResult> alertResults) {
		this.alertResults = alertResults;
	}
	public List<EvercallAlertResult> getAlertResults( ) {
		return this.alertResults;
	}

}
