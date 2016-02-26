package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.domain.BankPayApplyResult;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.transfer.bank.pay.apply response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:57
 */
public class AlipayTransferBankPayApplyResponse extends AlipayResponse {

	private static final long serialVersionUID = 3499848932788653339L;

	/** 
	 * 转账申请结果描述
	 */
	@ApiField("bank_pay_apply_response")
	private BankPayApplyResult bankPayApplyResponse;

	public void setBankPayApplyResponse(BankPayApplyResult bankPayApplyResponse) {
		this.bankPayApplyResponse = bankPayApplyResponse;
	}
	public BankPayApplyResult getBankPayApplyResponse( ) {
		return this.bankPayApplyResponse;
	}

}
