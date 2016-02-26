package com.mx.cam.common.init.model;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import com.mx.cam.common.common.pay.Signature;

/**
 * 微信关闭订单参数实体类
 * 
 * @author zhengy
 * 
 */
public class CloseOrderParm {

	private String appid = "";
	private String mch_id = "";
	private String nonce_str = "";
	private String out_trade_no = "";
	private String sign = "";

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getMch_id() {
		return mch_id;
	}

	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}

	public String getNonce_str() {
		return nonce_str;
	}

	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}

	public String getSign() {
		return sign;
	}

	public void setSign() {
		this.sign = Signature.getSign(toMap());
	}

	public String getOut_trade_no() {
		return out_trade_no;
	}

	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}

	public Map<String, Object> toMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		Field[] fields = this.getClass().getDeclaredFields();
		for (Field field : fields) {
			Object obj;
			try {
				obj = field.get(this);
				if (obj != null) {
					map.put(field.getName(), obj);
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
}
