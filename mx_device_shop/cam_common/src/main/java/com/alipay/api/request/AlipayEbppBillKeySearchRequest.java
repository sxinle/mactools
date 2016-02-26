package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEbppBillKeySearchResponse;

/**
 * ALIPAY API: alipay.ebpp.bill.key.search request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:56
 */
public class AlipayEbppBillKeySearchRequest implements AlipayRequest<AlipayEbppBillKeySearchResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 支付宝给每个出账机构指定了一个对应的英文短名称来唯一表示该收费单位。
	 */
	private String chargeInst;

	/** 
	* 结束时间。与开始时间间隔在七天之内
	 */
	private String endTime;

	/** 
	* 需要返回的字段列表。bill_key:户号
	 */
	private String fields;

	/** 
	* 是否仅包含订阅数据
	 */
	private Boolean onlySubscribed;

	/** 
	* 支付宝订单类型。公共事业缴纳JF,信用卡还款HK
	 */
	private String orderType;

	/** 
	* 开始时间，时间必须是今天范围之内。格式为yyyy-MM-dd HH:mm:ss，精确到天
	 */
	private String startTime;

	/** 
	* 子业务类型是业务类型的下一级概念，例如：WATER表示JF下面的水费，ELECTRIC表示JF下面的电费，GAS表示JF下面的燃气费。
	 */
	private String subOrderType;

	public void setChargeInst(String chargeInst) {
		this.chargeInst = chargeInst;
	}
	public String getChargeInst() {
		return this.chargeInst;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getEndTime() {
		return this.endTime;
	}

	public void setFields(String fields) {
		this.fields = fields;
	}
	public String getFields() {
		return this.fields;
	}

	public void setOnlySubscribed(Boolean onlySubscribed) {
		this.onlySubscribed = onlySubscribed;
	}
	public Boolean getOnlySubscribed() {
		return this.onlySubscribed;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderType() {
		return this.orderType;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getStartTime() {
		return this.startTime;
	}

	public void setSubOrderType(String subOrderType) {
		this.subOrderType = subOrderType;
	}
	public String getSubOrderType() {
		return this.subOrderType;
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
		return "alipay.ebpp.bill.key.search";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("charge_inst", this.chargeInst);
		txtParams.put("end_time", this.endTime);
		txtParams.put("fields", this.fields);
		txtParams.put("only_subscribed", this.onlySubscribed);
		txtParams.put("order_type", this.orderType);
		txtParams.put("start_time", this.startTime);
		txtParams.put("sub_order_type", this.subOrderType);
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

	public Class<AlipayEbppBillKeySearchResponse> getResponseClass() {
		return AlipayEbppBillKeySearchResponse.class;
	}
}
