package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayGotoneAckcodeSendResponse;

/**
 * ALIPAY API: alipay.gotone.ackcode.send request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:38
 */
public class AlipayGotoneAckcodeSendRequest implements AlipayRequest<AlipayGotoneAckcodeSendResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 格式：key=value 多个以&rdquo;|&rdquo;分割
	 */
	private String arguments;

	/** 
	* 区分相同的手机号、业务类型，但不同业务场景的手机校验码等情况校验。比如使用order_no
	 */
	private String bizNo;

	/** 
	* 发送手机校验码业务类型，为空默认DEFAULT_TYPE
	 */
	private String bizType;

	/** 
	* 接收校验码短信手机号
	 */
	private String mobile;

	/** 
	* 短信模板对应的serviceCode
	 */
	private String serviceCode;

	public void setArguments(String arguments) {
		this.arguments = arguments;
	}
	public String getArguments() {
		return this.arguments;
	}

	public void setBizNo(String bizNo) {
		this.bizNo = bizNo;
	}
	public String getBizNo() {
		return this.bizNo;
	}

	public void setBizType(String bizType) {
		this.bizType = bizType;
	}
	public String getBizType() {
		return this.bizType;
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
		return "alipay.gotone.ackcode.send";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("arguments", this.arguments);
		txtParams.put("biz_no", this.bizNo);
		txtParams.put("biz_type", this.bizType);
		txtParams.put("mobile", this.mobile);
		txtParams.put("service_code", this.serviceCode);
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

	public Class<AlipayGotoneAckcodeSendResponse> getResponseClass() {
		return AlipayGotoneAckcodeSendResponse.class;
	}
}
