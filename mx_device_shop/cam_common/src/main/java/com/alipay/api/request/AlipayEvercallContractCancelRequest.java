package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEvercallContractCancelResponse;

/**
 * ALIPAY API: alipay.evercall.contract.cancel request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:40
 */
public class AlipayEvercallContractCancelRequest implements AlipayRequest<AlipayEvercallContractCancelResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 签约手机号
	 */
	private String mobileNo;

	/** 
	* 解约渠道(SMS：短信方式 CLIENT：客户端 WAP：wap SITE：主站 OPENPLAT:开放平台 OTHER：其他)
	 */
	private String unsignChannel;

	/** 
	* 运营统计：taobao,alipay,telecom
	 */
	private String unsignFrom;

	/** 
	* 支付宝账户号
	 */
	private String userId;

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getMobileNo() {
		return this.mobileNo;
	}

	public void setUnsignChannel(String unsignChannel) {
		this.unsignChannel = unsignChannel;
	}
	public String getUnsignChannel() {
		return this.unsignChannel;
	}

	public void setUnsignFrom(String unsignFrom) {
		this.unsignFrom = unsignFrom;
	}
	public String getUnsignFrom() {
		return this.unsignFrom;
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
		return "alipay.evercall.contract.cancel";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("mobile_no", this.mobileNo);
		txtParams.put("unsign_channel", this.unsignChannel);
		txtParams.put("unsign_from", this.unsignFrom);
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

	public Class<AlipayEvercallContractCancelResponse> getResponseClass() {
		return AlipayEvercallContractCancelResponse.class;
	}
}
