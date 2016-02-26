package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.ebpp.nbill.key.search response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:52
 */
public class AlipayEbppNbillKeySearchResponse extends AlipayResponse {

	private static final long serialVersionUID = 1467194612669517812L;

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
