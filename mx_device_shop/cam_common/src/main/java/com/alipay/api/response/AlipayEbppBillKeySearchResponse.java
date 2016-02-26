package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.ebpp.bill.key.search response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:56
 */
public class AlipayEbppBillKeySearchResponse extends AlipayResponse {

	private static final long serialVersionUID = 2671867958529922263L;

	/** 
	 * 请求受理ID。
	 */
	@ApiField("task_id")
	private String taskId;

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getTaskId( ) {
		return this.taskId;
	}

}
