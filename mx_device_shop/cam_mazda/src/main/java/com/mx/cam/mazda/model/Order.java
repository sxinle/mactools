package com.mx.cam.mazda.model;


import com.mx.cam.common.common.SearchPageUtil;

public class Order extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

	private String order_id;// 订单ID
	private String total_fee;// 订单金额
	private String cash_fee;// 实收金额
	private String creat_time;// 创建时间
	private String payment_time;// 支付时间
	private String device_no;// 车机原始系列号
	private String del_flag;// 是否逻辑删除(0:删除 1：使用)
	private String payment_mode_id;// 支付方式id
	private String order_state_id;// 订单状态id
	private String payment_mode;// 支付方式
	private String order_state;// 订单状态
	private String trade_state;// 订单状态// SUCCESS—支付成功，REFUND—转入退款，NOTPAY—未支付，CLOSED—已关闭，REVOKED—已撤销，USERPAYING--用户支付中，PAYERROR--支付失败(其他原因，如银行返回失败)
	private String card_type;//刮刮支付类型
	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getTotal_fee() {
		return total_fee;
	}

	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}

	public String getCash_fee() {
		return cash_fee;
	}

	public void setCash_fee(String cash_fee) {
		this.cash_fee = cash_fee;
	}

	public String getCreat_time() {
		return creat_time;
	}

	public void setCreat_time(String creat_time) {
		this.creat_time = creat_time;
	}

	public String getPayment_time() {
		return payment_time;
	}

	public void setPayment_time(String payment_time) {
		this.payment_time = payment_time;
	}

	public String getDevice_no() {
		return device_no;
	}

	public void setDevice_no(String device_no) {
		this.device_no = device_no;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public String getPayment_mode_id() {
		return payment_mode_id;
	}

	public void setPayment_mode_id(String payment_mode_id) {
		this.payment_mode_id = payment_mode_id;
	}

	public String getOrder_state_id() {
		return order_state_id;
	}

	public void setOrder_state_id(String order_state_id) {
		this.order_state_id = order_state_id;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public String getTrade_state() {
		return trade_state;
	}

	public void setTrade_state(String trade_state) {
		this.trade_state = trade_state;
	}

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	
	
}
