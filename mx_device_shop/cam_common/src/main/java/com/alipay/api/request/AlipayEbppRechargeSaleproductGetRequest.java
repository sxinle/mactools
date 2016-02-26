package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEbppRechargeSaleproductGetResponse;

/**
 * ALIPAY API: alipay.ebpp.recharge.saleproduct.get request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:48
 */
public class AlipayEbppRechargeSaleproductGetRequest implements AlipayRequest<AlipayEbppRechargeSaleproductGetResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 来源,例如：主站,淘宝,客户端
	 */
	private String agent;

	/** 
	* 必须以key value形式定义，转为json为格式：{"key1":"value1","key2":"value2","key3":"value3","key4":"value4"}
 后端会直接转换为MAP对象，转换异常会报参数格式错误
	 */
	private String extendField;

	/** 
	* 手机号码
	 */
	private String mobileNo;

	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getAgent() {
		return this.agent;
	}

	public void setExtendField(String extendField) {
		this.extendField = extendField;
	}
	public String getExtendField() {
		return this.extendField;
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
		return "alipay.ebpp.recharge.saleproduct.get";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("agent", this.agent);
		txtParams.put("extend_field", this.extendField);
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

	public Class<AlipayEbppRechargeSaleproductGetResponse> getResponseClass() {
		return AlipayEbppRechargeSaleproductGetResponse.class;
	}
}
