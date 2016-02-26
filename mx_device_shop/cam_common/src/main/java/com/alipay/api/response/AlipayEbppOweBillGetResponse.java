package com.alipay.api.response;

import java.util.Date;
import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.ebpp.owe.bill.get response.
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:51
 */
public class AlipayEbppOweBillGetResponse extends AlipayResponse {

	private static final long serialVersionUID = 3851992119794729792L;

	/** 
	 * 地址
	 */
	@ApiField("address")
	private String address;

	/** 
	 * 渠道，记录该笔流水的来源，例如无线WAP，主站
	 */
	@ApiField("agent_channel")
	private String agentChannel;

	/** 
	 * 用户卡号
	 */
	@ApiField("alipay_user_id")
	private String alipayUserId;

	/** 
	 * 欠费金额，以分为单位
	 */
	@ApiField("bill_amount")
	private String billAmount;

	/** 
	 * 账期
	 */
	@ApiField("bill_date")
	private String billDate;

	/** 
	 * 户号
	 */
	@ApiField("bill_key")
	private String billKey;

	/** 
	 * 出账机构
	 */
	@ApiField("charge_inst")
	private String chargeInst;

	/** 
	 * 城市
	 */
	@ApiField("city")
	private String city;

	/** 
	 * 2
	 */
	@ApiField("create_type")
	private String createType;

	/** 
	 * 到期日
	 */
	@ApiField("due_date")
	private String dueDate;

	/** 
	 * 关联的账单流水id
	 */
	@ApiField("ebppcore_id")
	private String ebppcoreId;

	/** 
	 * 该条欠费单的有效日期
	 */
	@ApiField("expiry_date")
	private String expiryDate;

	/** 
	 * 扩展属性
	 */
	@ApiField("extend_field")
	private String extendField;

	/** 
	 * 以分为单位
	 */
	@ApiField("fine_amount")
	private String fineAmount;

	/** 
	 * 创建时间
	 */
	@ApiField("gmt_create")
	private Date gmtCreate;

	/** 
	 * 修改时间
	 */
	@ApiField("gmt_modified")
	private Date gmtModified;

	/** 
	 * 业务类型
	 */
	@ApiField("order_type")
	private String orderType;

	/** 
	 * 欠费单id
	 */
	@ApiField("owe_bill_id")
	private String oweBillId;

	/** 
	 * 户名
	 */
	@ApiField("owner_name")
	private String ownerName;

	/** 
	 * 省份
	 */
	@ApiField("province")
	private String province;

	/** 
	 * 欠费单所在区
	 */
	@ApiField("region")
	private String region;

	/** 
	 * 单据状态，I初始，P处理中。S 成功 F 失败 C 已删除 B 被别人缴纳过了
	 */
	@ApiField("status")
	private String status;

	/** 
	 * 子业务类型
	 */
	@ApiField("sub_order_type")
	private String subOrderType;

	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress( ) {
		return this.address;
	}

	public void setAgentChannel(String agentChannel) {
		this.agentChannel = agentChannel;
	}
	public String getAgentChannel( ) {
		return this.agentChannel;
	}

	public void setAlipayUserId(String alipayUserId) {
		this.alipayUserId = alipayUserId;
	}
	public String getAlipayUserId( ) {
		return this.alipayUserId;
	}

	public void setBillAmount(String billAmount) {
		this.billAmount = billAmount;
	}
	public String getBillAmount( ) {
		return this.billAmount;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public String getBillDate( ) {
		return this.billDate;
	}

	public void setBillKey(String billKey) {
		this.billKey = billKey;
	}
	public String getBillKey( ) {
		return this.billKey;
	}

	public void setChargeInst(String chargeInst) {
		this.chargeInst = chargeInst;
	}
	public String getChargeInst( ) {
		return this.chargeInst;
	}

	public void setCity(String city) {
		this.city = city;
	}
	public String getCity( ) {
		return this.city;
	}

	public void setCreateType(String createType) {
		this.createType = createType;
	}
	public String getCreateType( ) {
		return this.createType;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getDueDate( ) {
		return this.dueDate;
	}

	public void setEbppcoreId(String ebppcoreId) {
		this.ebppcoreId = ebppcoreId;
	}
	public String getEbppcoreId( ) {
		return this.ebppcoreId;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getExpiryDate( ) {
		return this.expiryDate;
	}

	public void setExtendField(String extendField) {
		this.extendField = extendField;
	}
	public String getExtendField( ) {
		return this.extendField;
	}

	public void setFineAmount(String fineAmount) {
		this.fineAmount = fineAmount;
	}
	public String getFineAmount( ) {
		return this.fineAmount;
	}

	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	public Date getGmtCreate( ) {
		return this.gmtCreate;
	}

	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	public Date getGmtModified( ) {
		return this.gmtModified;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderType( ) {
		return this.orderType;
	}

	public void setOweBillId(String oweBillId) {
		this.oweBillId = oweBillId;
	}
	public String getOweBillId( ) {
		return this.oweBillId;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getOwnerName( ) {
		return this.ownerName;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	public String getProvince( ) {
		return this.province;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	public String getRegion( ) {
		return this.region;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus( ) {
		return this.status;
	}

	public void setSubOrderType(String subOrderType) {
		this.subOrderType = subOrderType;
	}
	public String getSubOrderType( ) {
		return this.subOrderType;
	}

}
