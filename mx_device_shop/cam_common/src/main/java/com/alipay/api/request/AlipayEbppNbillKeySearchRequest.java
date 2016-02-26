package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEbppNbillKeySearchResponse;

/**
 * ALIPAY API: alipay.ebpp.nbill.key.search request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:52
 */
public class AlipayEbppNbillKeySearchRequest implements AlipayRequest<AlipayEbppNbillKeySearchResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 取消纸质账单枚举code
	 */
	private String cancelpaperCode;

	/** 
	* 支付宝给每个出账机构指定了一个对应的英文短名称来唯一表示该收费单位
	 */
	private String chargeInst;

	/** 
	* 结束时间：格式为yyyy-MM-dd HH:mm:ss
	 */
	private String endTime;

	/** 
	* 返回户号集合
	 */
	private String fields;

	/** 
	* 该属性已废弃使用，删除不了属性，也修改不了。
	 */
	private Boolean isCancelpaper;

	/** 
	* 该属性已废弃使用，删除不了属性，也修改不了。
	 */
	private Boolean isSubscribed;

	/** 
	* 支付宝订单类型。公共事业缴纳JF,信用卡还款HK

	1
	 */
	private String orderType;

	/** 
	* 查询纸质账单结束时间
	 */
	private String pendTime;

	/** 
	* 纸质账单取消开始时间：格式为yyyy-MM-dd HH:mm:ss
	 */
	private String pstartTime;

	/** 
	* 开始时间，时间必须是今天范围之内。格式为yyyy-MM-dd HH:mm:ss
	 */
	private String startTime;

	/** 
	* 子业务类型是业务类型的下一级概念，例如：WATER表示JF下面的水费
	 */
	private String subOrderType;

	/** 
	* 订阅状态枚举code
	 */
	private String subscribedCode;

	public void setCancelpaperCode(String cancelpaperCode) {
		this.cancelpaperCode = cancelpaperCode;
	}
	public String getCancelpaperCode() {
		return this.cancelpaperCode;
	}

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

	public void setIsCancelpaper(Boolean isCancelpaper) {
		this.isCancelpaper = isCancelpaper;
	}
	public Boolean getIsCancelpaper() {
		return this.isCancelpaper;
	}

	public void setIsSubscribed(Boolean isSubscribed) {
		this.isSubscribed = isSubscribed;
	}
	public Boolean getIsSubscribed() {
		return this.isSubscribed;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderType() {
		return this.orderType;
	}

	public void setPendTime(String pendTime) {
		this.pendTime = pendTime;
	}
	public String getPendTime() {
		return this.pendTime;
	}

	public void setPstartTime(String pstartTime) {
		this.pstartTime = pstartTime;
	}
	public String getPstartTime() {
		return this.pstartTime;
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

	public void setSubscribedCode(String subscribedCode) {
		this.subscribedCode = subscribedCode;
	}
	public String getSubscribedCode() {
		return this.subscribedCode;
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
		return "alipay.ebpp.nbill.key.search";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("cancelpaper_code", this.cancelpaperCode);
		txtParams.put("charge_inst", this.chargeInst);
		txtParams.put("end_time", this.endTime);
		txtParams.put("fields", this.fields);
		txtParams.put("is_cancelpaper", this.isCancelpaper);
		txtParams.put("is_subscribed", this.isSubscribed);
		txtParams.put("order_type", this.orderType);
		txtParams.put("pend_time", this.pendTime);
		txtParams.put("pstart_time", this.pstartTime);
		txtParams.put("start_time", this.startTime);
		txtParams.put("sub_order_type", this.subOrderType);
		txtParams.put("subscribed_code", this.subscribedCode);
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

	public Class<AlipayEbppNbillKeySearchResponse> getResponseClass() {
		return AlipayEbppNbillKeySearchResponse.class;
	}
}
