package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.user.binding.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:38
 */
public class AlipayUserBindingGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 8795355389728996455L;

	/** 
	 * 合作伙伴用户id
	 */
	@ApiField("partner_user_id")
	private String partnerUserId;

	/** 
	 * 淘宝用户id
	 */
	@ApiField("taobao_id")
	private String taobaoId;

	public void setPartnerUserId(String partnerUserId) {
		this.partnerUserId = partnerUserId;
	}
	public String getPartnerUserId( ) {
		return this.partnerUserId;
	}

	public void setTaobaoId(String taobaoId) {
		this.taobaoId = taobaoId;
	}
	public String getTaobaoId( ) {
		return this.taobaoId;
	}

}
