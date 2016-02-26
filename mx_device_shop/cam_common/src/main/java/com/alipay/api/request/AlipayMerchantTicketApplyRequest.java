package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayMerchantTicketApplyResponse;

/**
 * ALIPAY API: alipay.merchant.ticket.apply request
 * 
 * @author auto create
 * @since 1.0, 2015-03-24 16:02:29
 */
public class AlipayMerchantTicketApplyRequest implements AlipayRequest<AlipayMerchantTicketApplyResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 业务上下文
	 */
	private String bizContext;

	/** 
	* 业务发生时间，外围传入，可以作为T+1核对，如果不填写，则该时间为业务生成时间
	 */
	private String bizDate;

	/** 
	* 业务号，用于控制幂等。
	 */
	private String bizNo;

	/** 
	* 扩展字段，json格式
	 */
	private String extInfo;

	/** 
	* 操作人id
	 */
	private String optId;

	/** 
	* 发券商户parnterId
	 */
	private String partnerId;

	/** 
	* 券模板编号
	 */
	private String templateNo;

	/** 
	* 个人用户Id
	 */
	private String userId;

	public void setBizContext(String bizContext) {
		this.bizContext = bizContext;
	}
	public String getBizContext() {
		return this.bizContext;
	}

	public void setBizDate(String bizDate) {
		this.bizDate = bizDate;
	}
	public String getBizDate() {
		return this.bizDate;
	}

	public void setBizNo(String bizNo) {
		this.bizNo = bizNo;
	}
	public String getBizNo() {
		return this.bizNo;
	}

	public void setExtInfo(String extInfo) {
		this.extInfo = extInfo;
	}
	public String getExtInfo() {
		return this.extInfo;
	}

	public void setOptId(String optId) {
		this.optId = optId;
	}
	public String getOptId() {
		return this.optId;
	}

	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}
	public String getPartnerId() {
		return this.partnerId;
	}

	public void setTemplateNo(String templateNo) {
		this.templateNo = templateNo;
	}
	public String getTemplateNo() {
		return this.templateNo;
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
		return "alipay.merchant.ticket.apply";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("biz_context", this.bizContext);
		txtParams.put("biz_date", this.bizDate);
		txtParams.put("biz_no", this.bizNo);
		txtParams.put("ext_info", this.extInfo);
		txtParams.put("opt_id", this.optId);
		txtParams.put("partner_id", this.partnerId);
		txtParams.put("template_no", this.templateNo);
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

	public Class<AlipayMerchantTicketApplyResponse> getResponseClass() {
		return AlipayMerchantTicketApplyResponse.class;
	}
}
