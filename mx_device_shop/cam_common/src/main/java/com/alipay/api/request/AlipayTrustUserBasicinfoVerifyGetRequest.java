package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayTrustUserBasicinfoVerifyGetResponse;

/**
 * ALIPAY API: alipay.trust.user.basicinfo.verify.get request
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:09:15
 */
public class AlipayTrustUserBasicinfoVerifyGetRequest implements AlipayRequest<AlipayTrustUserBasicinfoVerifyGetResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 入参json串,  其中*号为encryp_code。
确保每个字段的值的总长度必须与没加密之前的字段长度要一致
	 */
	private String aliTrustUserInfo;

	/** 
	* 只能为单个字符，不传默认为*
	 */
	private String encrypCode;

	public void setAliTrustUserInfo(String aliTrustUserInfo) {
		this.aliTrustUserInfo = aliTrustUserInfo;
	}
	public String getAliTrustUserInfo() {
		return this.aliTrustUserInfo;
	}

	public void setEncrypCode(String encrypCode) {
		this.encrypCode = encrypCode;
	}
	public String getEncrypCode() {
		return this.encrypCode;
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
		return "alipay.trust.user.basicinfo.verify.get";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("ali_trust_user_info", this.aliTrustUserInfo);
		txtParams.put("encryp_code", this.encrypCode);
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

	public Class<AlipayTrustUserBasicinfoVerifyGetResponse> getResponseClass() {
		return AlipayTrustUserBasicinfoVerifyGetResponse.class;
	}
}
