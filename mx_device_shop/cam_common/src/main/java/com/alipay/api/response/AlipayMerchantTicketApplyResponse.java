package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.merchant.ticket.apply response.
 * 
 * @author auto create
 * @since 1.0, 2015-03-24 16:02:29
 */
public class AlipayMerchantTicketApplyResponse extends AlipayResponse {

	private static final long serialVersionUID = 2833251546612511854L;

	/** 
	 * 券Id
	 */
	@ApiField("ticket_id")
	private String ticketId;

	/** 
	 * 券编号
	 */
	@ApiField("ticket_no")
	private String ticketNo;

	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}
	public String getTicketId( ) {
		return this.ticketId;
	}

	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}
	public String getTicketNo( ) {
		return this.ticketNo;
	}

}
