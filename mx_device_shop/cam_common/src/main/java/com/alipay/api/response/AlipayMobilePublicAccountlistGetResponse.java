package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.mobile.public.accountlist.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-10-31 17:54:42
 */
public class AlipayMobilePublicAccountlistGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 6883544386443985866L;

	/** 
	 * 服务窗列表
	 */
	@ApiField("account_list")
	private String accountList;

	/** 
	 * 响应码
	 */
	@ApiField("code")
	private String code;

	/** 
	 * 结果描述
	 */
	@ApiField("msg")
	private String msg;

	public void setAccountList(String accountList) {
		this.accountList = accountList;
	}
	public String getAccountList( ) {
		return this.accountList;
	}

	public void setCode(String code) {
		this.code = code;
	}
	public String getCode( ) {
		return this.code;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMsg( ) {
		return this.msg;
	}

}
