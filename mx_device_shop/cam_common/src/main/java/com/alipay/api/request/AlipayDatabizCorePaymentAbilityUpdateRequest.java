package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayDatabizCorePaymentAbilityUpdateResponse;

/**
 * ALIPAY API: alipay.databiz.core.payment.ability.update request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:17:00
 */
public class AlipayDatabizCorePaymentAbilityUpdateRequest implements AlipayRequest<AlipayDatabizCorePaymentAbilityUpdateResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 支付信息
	 */
	private String payInfo;

	public void setPayInfo(String payInfo) {
		this.payInfo = payInfo;
	}
	public String getPayInfo() {
		return this.payInfo;
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
		return "alipay.databiz.core.payment.ability.update";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("pay_info", this.payInfo);
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

	public Class<AlipayDatabizCorePaymentAbilityUpdateResponse> getResponseClass() {
		return AlipayDatabizCorePaymentAbilityUpdateResponse.class;
	}
}
