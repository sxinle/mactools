package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayTrustUserTokenUpdateResponse;

/**
 * ALIPAY API: alipay.trust.user.token.update request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:45
 */
public class AlipayTrustUserTokenUpdateRequest implements AlipayRequest<AlipayTrustUserTokenUpdateResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 从账户通中获取的access_token
	 */
	private String accessToken;

	/** 
	* 合作商户id，也叫partner id
	 */
	private String pid;

	/** 
	* 支付宝用户id
	 */
	private String userId;

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getAccessToken() {
		return this.accessToken;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPid() {
		return this.pid;
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
		return "alipay.trust.user.token.update";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("access_token", this.accessToken);
		txtParams.put("pid", this.pid);
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

	public Class<AlipayTrustUserTokenUpdateResponse> getResponseClass() {
		return AlipayTrustUserTokenUpdateResponse.class;
	}
}
