package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEvercallContractSignUpdateResponse;

/**
 * ALIPAY API: alipay.evercall.contract.sign.update request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:39
 */
public class AlipayEvercallContractSignUpdateRequest implements AlipayRequest<AlipayEvercallContractSignUpdateResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 签约状态
	 */
	private String code;

	/** 
	* 扩展属性
	 */
	private String extendField;

	/** 
	* 签约状态信息描述
	 */
	private String message;

	/** 
	* 签约手机号
	 */
	private String mobileNo;

	public void setCode(String code) {
		this.code = code;
	}
	public String getCode() {
		return this.code;
	}

	public void setExtendField(String extendField) {
		this.extendField = extendField;
	}
	public String getExtendField() {
		return this.extendField;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	public String getMessage() {
		return this.message;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getMobileNo() {
		return this.mobileNo;
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
		return "alipay.evercall.contract.sign.update";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("code", this.code);
		txtParams.put("extend_field", this.extendField);
		txtParams.put("message", this.message);
		txtParams.put("mobile_no", this.mobileNo);
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

	public Class<AlipayEvercallContractSignUpdateResponse> getResponseClass() {
		return AlipayEvercallContractSignUpdateResponse.class;
	}
}
