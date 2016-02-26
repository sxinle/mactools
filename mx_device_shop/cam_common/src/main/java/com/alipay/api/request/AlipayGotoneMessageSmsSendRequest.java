package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayGotoneMessageSmsSendResponse;

/**
 * ALIPAY API: alipay.gotone.message.sms.send request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:36
 */
public class AlipayGotoneMessageSmsSendRequest implements AlipayRequest<AlipayGotoneMessageSmsSendResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 模板参数
	 */
	private String arguments;

	/** 
	* 接收短信手机号
	 */
	private String mobile;

	/** 
	* 短信模板对应的serviceCode
	 */
	private String serviceCode;

	/** 
	* 用户的支付宝ID
	 */
	private String userId;

	public void setArguments(String arguments) {
		this.arguments = arguments;
	}
	public String getArguments() {
		return this.arguments;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getMobile() {
		return this.mobile;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	public String getServiceCode() {
		return this.serviceCode;
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
		return "alipay.gotone.message.sms.send";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("arguments", this.arguments);
		txtParams.put("mobile", this.mobile);
		txtParams.put("service_code", this.serviceCode);
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

	public Class<AlipayGotoneMessageSmsSendResponse> getResponseClass() {
		return AlipayGotoneMessageSmsSendResponse.class;
	}
}
