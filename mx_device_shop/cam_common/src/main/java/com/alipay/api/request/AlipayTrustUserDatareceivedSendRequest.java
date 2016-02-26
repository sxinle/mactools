package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayTrustUserDatareceivedSendResponse;

/**
 * ALIPAY API: alipay.trust.user.datareceived.send request
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:11:50
 */
public class AlipayTrustUserDatareceivedSendRequest implements AlipayRequest<AlipayTrustUserDatareceivedSendResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* Json格式，具体内容根据不同的type_id而不同。详见芝麻信用的数据类型文档（线下提供）。
	 */
	private String data;

	/** 
	* 用以标识用户身份的字段，JSON格式，共包括5个属性。其中至少用包含name在内的两个字段来刻画该用户，并尽可能填写完整。
	 */
	private String identity;

	/** 
	* 数据类型ID，由芝麻信用针对不同商户而分配
	 */
	private String typeId;

	public void setData(String data) {
		this.data = data;
	}
	public String getData() {
		return this.data;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getIdentity() {
		return this.identity;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getTypeId() {
		return this.typeId;
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
		return "alipay.trust.user.datareceived.send";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("data", this.data);
		txtParams.put("identity", this.identity);
		txtParams.put("type_id", this.typeId);
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

	public Class<AlipayTrustUserDatareceivedSendResponse> getResponseClass() {
		return AlipayTrustUserDatareceivedSendResponse.class;
	}
}
