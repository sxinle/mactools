package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEbppSubscribeCheckcodeImportResponse;

/**
 * ALIPAY API: alipay.ebpp.subscribe.checkcode.import request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:47
 */
public class AlipayEbppSubscribeCheckcodeImportRequest implements AlipayRequest<AlipayEbppSubscribeCheckcodeImportResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 缴费户号
	 */
	private String billKey;

	/** 
	* 业务类型
	 */
	private String bizType;

	/** 
	* 出账机构短名称
	 */
	private String chargeInst;

	/** 
	* 订阅校验码
	 */
	private String checkCode;

	/** 
	* 扩展字段内容
	 */
	private String extendField;

	/** 
	* 子业务类型
	 */
	private String subBizType;

	public void setBillKey(String billKey) {
		this.billKey = billKey;
	}
	public String getBillKey() {
		return this.billKey;
	}

	public void setBizType(String bizType) {
		this.bizType = bizType;
	}
	public String getBizType() {
		return this.bizType;
	}

	public void setChargeInst(String chargeInst) {
		this.chargeInst = chargeInst;
	}
	public String getChargeInst() {
		return this.chargeInst;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public String getCheckCode() {
		return this.checkCode;
	}

	public void setExtendField(String extendField) {
		this.extendField = extendField;
	}
	public String getExtendField() {
		return this.extendField;
	}

	public void setSubBizType(String subBizType) {
		this.subBizType = subBizType;
	}
	public String getSubBizType() {
		return this.subBizType;
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
		return "alipay.ebpp.subscribe.checkcode.import";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("bill_key", this.billKey);
		txtParams.put("biz_type", this.bizType);
		txtParams.put("charge_inst", this.chargeInst);
		txtParams.put("check_code", this.checkCode);
		txtParams.put("extend_field", this.extendField);
		txtParams.put("sub_biz_type", this.subBizType);
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

	public Class<AlipayEbppSubscribeCheckcodeImportResponse> getResponseClass() {
		return AlipayEbppSubscribeCheckcodeImportResponse.class;
	}
}
