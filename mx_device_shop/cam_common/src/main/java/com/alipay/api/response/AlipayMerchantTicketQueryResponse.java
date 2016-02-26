package com.alipay.api.response;

import java.util.List;
import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.internal.mapping.ApiListField;
import com.alipay.api.domain.MerchantTicketModel;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.merchant.ticket.query response.
 * 
 * @author auto create
 * @since 1.0, 2015-03-24 15:58:11
 */
public class AlipayMerchantTicketQueryResponse extends AlipayResponse {

	private static final long serialVersionUID = 6516236939357514429L;

	/** 
	 * 商户会员券对象列表
	 */
	@ApiListField("merchant_ticket_models")
	@ApiField("merchant_ticket_model")
	private List<MerchantTicketModel> merchantTicketModels;

	public void setMerchantTicketModels(List<MerchantTicketModel> merchantTicketModels) {
		this.merchantTicketModels = merchantTicketModels;
	}
	public List<MerchantTicketModel> getMerchantTicketModels( ) {
		return this.merchantTicketModels;
	}

}
