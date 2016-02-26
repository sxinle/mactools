package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayMobileUrlAutologinGetResponse;

/**
 * ALIPAY API: alipay.mobile.url.autologin.get request
 * 
 * @author auto create
 * @since 1.0, 2014-03-20 17:20:06
 */
public class AlipayMobileUrlAutologinGetRequest implements AlipayRequest<AlipayMobileUrlAutologinGetResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 淘宝跳转目的地址
	 */
	private String redirectUrl;

	/** 
	* 支付宝token
	 */
	private String token;

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	public String getRedirectUrl() {
		return this.redirectUrl;
	}

	public void setToken(String token) {
		this.token = token;
	}
	public String getToken() {
		return this.token;
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
		return "alipay.mobile.url.autologin.get";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("redirect_url", this.redirectUrl);
		txtParams.put("token", this.token);
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

	public Class<AlipayMobileUrlAutologinGetResponse> getResponseClass() {
		return AlipayMobileUrlAutologinGetResponse.class;
	}
}
