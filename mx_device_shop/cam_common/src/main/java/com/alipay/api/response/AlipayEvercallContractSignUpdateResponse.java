package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.evercall.contract.sign.update response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:39
 */
public class AlipayEvercallContractSignUpdateResponse extends AlipayResponse {

	private static final long serialVersionUID = 3115171723215786785L;

	/** 
	 * 扩展属性
	 */
	@ApiField("extend_field")
	private String extendField;

	/** 
	 * 签约手机号
	 */
	@ApiField("mobile_no")
	private String mobileNo;

	/** 
	 * 返回结果
	 */
	@ApiField("return_code")
	private String returnCode;

	public void setExtendField(String extendField) {
		this.extendField = extendField;
	}
	public String getExtendField( ) {
		return this.extendField;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getMobileNo( ) {
		return this.mobileNo;
	}

	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}
	public String getReturnCode( ) {
		return this.returnCode;
	}

}
