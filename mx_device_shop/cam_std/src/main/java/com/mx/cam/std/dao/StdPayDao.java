package com.mx.cam.std.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mx.cam.std.model.GoodsComboWeb;
import com.mx.cam.std.model.GoodsGroupWeb;
import com.mx.cam.std.model.GoodsItem;
import com.mx.cam.std.model.GoodsWeb;
import com.mx.cam.std.model.Order;
import com.mx.cam.std.model.OrderItem;
import com.mx.cam.std.model.PaymentMode;
import com.mx.cam.std.model.PaymentModeWeb;

/**
 * 交易支付接口Dao
 * 
 * @author zhengy
 */

public interface StdPayDao {

	// 查询商品管理信息列表(WEB接口使用)
	public List<GoodsWeb> getGoodsWebList(String product_id);

	// 查询组合商品信息列表(WEB接口使用)
	public List<GoodsGroupWeb> getGoodsGroupWebList(String goods_pid);

	// 查询商品套餐信息列表(WEB接口使用)
	public List<GoodsComboWeb> getGoodsComboWebList(@Param("product_id") String product_id,@Param("goods_id") String goods_id);

	// 获取支付方式列表(WEB接口使用)
	public List<PaymentModeWeb> getPayWayList(String product_id);
	
	// 查询订单状态(WEB接口使用)
	public Order orderQuery(String order_id);
	
	// 查询商品信息
	public List<GoodsItem> getGoodsById(@Param("product_id") String product_id,@Param("goodsIds") String[] goodsIds,@Param("comboIds") String[] comboIds);

	//保存订单
	public void insertOrder(Order bean);
	
	//保存订单详细
	public void insertOrderItem(OrderItem bean);
	
	//查询支付方式信息
	public PaymentMode getPaymentMode(String mode_id);
	
}
