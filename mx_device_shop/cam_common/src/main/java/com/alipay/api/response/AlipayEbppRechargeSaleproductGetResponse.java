package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.RechargeModel;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.ebpp.recharge.saleproduct.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:48
 */
public class AlipayEbppRechargeSaleproductGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 3768631325763142585L;

	/** 
	 * 错误码
	 */
	@ApiField("error_code")
	private String errorCode;

	/** 
	 * 错误描述
	 */
	@ApiField("error_msg")
	private String errorMsg;

	/** 
	 * 是否成功
	 */
	@ApiField("is_success")
	private String isSuccess;

	/** 
	 * 充值模型
	 */
	@ApiField("recharge_model")
	private RechargeModel rechargeModel;

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getErrorCode( ) {
		return this.errorCode;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getErrorMsg( ) {
		return this.errorMsg;
	}

	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}
	public String getIsSuccess( ) {
		return this.isSuccess;
	}

	public void setRechargeModel(RechargeModel rechargeModel) {
		this.rechargeModel = rechargeModel;
	}
	public RechargeModel getRechargeModel( ) {
		return this.rechargeModel;
	}

}
