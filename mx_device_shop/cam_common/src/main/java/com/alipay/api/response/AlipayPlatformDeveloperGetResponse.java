package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.platform.developer.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:01
 */
public class AlipayPlatformDeveloperGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 1841321539435769353L;

	/** 
	 * 支付宝用户id
	 */
	@ApiField("alipay_user_id")
	private String alipayUserId;

	/** 
	 * 开发者姓名
	 */
	@ApiField("name")
	private String name;

	/** 
	 * 开发者状态 INIT:信息录入中,AUDIT:审核中,REJECT:已拒绝,VALID:已生效
	 */
	@ApiField("status")
	private String status;

	/** 
	 * 开发者类型 ENTERPRISE-企业开发者，PERSONAL-个人开发者
	 */
	@ApiField("type")
	private String type;

	public void setAlipayUserId(String alipayUserId) {
		this.alipayUserId = alipayUserId;
	}
	public String getAlipayUserId( ) {
		return this.alipayUserId;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getName( ) {
		return this.name;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus( ) {
		return this.status;
	}

	public void setType(String type) {
		this.type = type;
	}
	public String getType( ) {
		return this.type;
	}

}
