package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.platform.app.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:02
 */
public class AlipayPlatformAppGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 3637287223414352149L;

	/** 
	 * AOP应用app_id
	 */
	@ApiField("aop_app_id")
	private String aopAppId;

	/** 
	 * AOP应用状态
	 */
	@ApiField("aop_app_status")
	private String aopAppStatus;

	/** 
	 * AOP应用审核意见
	 */
	@ApiField("aop_audit_opinion")
	private String aopAuditOpinion;

	/** 
	 * 外部平台的app_id
	 */
	@ApiField("out_app_id")
	private String outAppId;

	public void setAopAppId(String aopAppId) {
		this.aopAppId = aopAppId;
	}
	public String getAopAppId( ) {
		return this.aopAppId;
	}

	public void setAopAppStatus(String aopAppStatus) {
		this.aopAppStatus = aopAppStatus;
	}
	public String getAopAppStatus( ) {
		return this.aopAppStatus;
	}

	public void setAopAuditOpinion(String aopAuditOpinion) {
		this.aopAuditOpinion = aopAuditOpinion;
	}
	public String getAopAuditOpinion( ) {
		return this.aopAuditOpinion;
	}

	public void setOutAppId(String outAppId) {
		this.outAppId = outAppId;
	}
	public String getOutAppId( ) {
		return this.outAppId;
	}

}
