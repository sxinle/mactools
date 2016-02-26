package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayMerchantTicketQueryResponse;

/**
 * ALIPAY API: alipay.merchant.ticket.query request
 * 
 * @author auto create
 * @since 1.0, 2015-03-24 15:58:11
 */
public class AlipayMerchantTicketQueryRequest implements AlipayRequest<AlipayMerchantTicketQueryResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 券有效期起始日期 ，yyyy-MM-dd HH:mm:ss格式
	 */
	private String gmtActive;

	/** 
	* 券有效期截止日期，yyyy-MM-dd HH:mm:ss格式
	 */
	private String gmtExpired;

	/** 
	* 发券商户partnerId
	 */
	private String partnerId;

	/** 
	* 券排序方式，目前支持两种方式 ：按创建日期倒序、按过期时间倒序
     * 目前支持的排序方式为：
CREATETIME_DESC_SORT：按创建时间倒序
EXPIREDTIME_DESC_SORT：按失效时间倒序,
	 */
	private String sort;

	/** 
	* 券状态列表，支持列表，逗号分割，取值：
VALID:可使用
WRITED_OFF:已核销
EXPIRED:已过期
CLOSED:已关闭
WAIT_APPLY：待领取
	 */
	private String statusList;

	/** 
	* 查询优惠劵类型，取值：
0：商户优惠券
1：商户红包
2：商户兑换券
	 */
	private String ticketBizType;

	/** 
	* 券码列表，可选，支持列表，逗号分割
	 */
	private String ticketNoList;

	/** 
	* 个人用户Id
	 */
	private String userId;

	public void setGmtActive(String gmtActive) {
		this.gmtActive = gmtActive;
	}
	public String getGmtActive() {
		return this.gmtActive;
	}

	public void setGmtExpired(String gmtExpired) {
		this.gmtExpired = gmtExpired;
	}
	public String getGmtExpired() {
		return this.gmtExpired;
	}

	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}
	public String getPartnerId() {
		return this.partnerId;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getSort() {
		return this.sort;
	}

	public void setStatusList(String statusList) {
		this.statusList = statusList;
	}
	public String getStatusList() {
		return this.statusList;
	}

	public void setTicketBizType(String ticketBizType) {
		this.ticketBizType = ticketBizType;
	}
	public String getTicketBizType() {
		return this.ticketBizType;
	}

	public void setTicketNoList(String ticketNoList) {
		this.ticketNoList = ticketNoList;
	}
	public String getTicketNoList() {
		return this.ticketNoList;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId() {
		return this.userId;
	}
	private String terminalType;
	private String terminalInfo;	
	private String prodCode;
	private String notifyUrl;

	public String getNotifyUrl() {
		return this.notifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}

	public String getApiVersion() {
		return this.apiVersion;
	}

	public void setApiVersion(String apiVersion) {
		this.apiVersion = apiVersion;
	}

	public void setTerminalType(String terminalType){
		this.terminalType=terminalType;
	}

    public String getTerminalType(){
    	return this.terminalType;
    }

    public void setTerminalInfo(String terminalInfo){
    	this.terminalInfo=terminalInfo;
    }

    public String getTerminalInfo(){
    	return this.terminalInfo;
    }	

	public void setProdCode(String prodCode) {
		this.prodCode=prodCode;
	}

	public String getProdCode() {
		return this.prodCode; 
	}

	public String getApiMethodName() {
		return "alipay.merchant.ticket.query";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("gmt_active", this.gmtActive);
		txtParams.put("gmt_expired", this.gmtExpired);
		txtParams.put("partner_id", this.partnerId);
		txtParams.put("sort", this.sort);
		txtParams.put("status_list", this.statusList);
		txtParams.put("ticket_biz_type", this.ticketBizType);
		txtParams.put("ticket_no_list", this.ticketNoList);
		txtParams.put("user_id", this.userId);
		if(udfParams != null) {
			txtParams.putAll(this.udfParams);
		}
		return txtParams;
	}

	public void putOtherTextParam(String key, String value) {
		if(this.udfParams == null) {
			this.udfParams = new AlipayHashMap();
		}
		this.udfParams.put(key, value);
	}

	public Class<AlipayMerchantTicketQueryResponse> getResponseClass() {
		return AlipayMerchantTicketQueryResponse.class;
	}
}
