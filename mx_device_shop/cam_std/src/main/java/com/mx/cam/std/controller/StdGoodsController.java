package com.mx.cam.std.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.CommonUtils;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.std.model.Goods;
import com.mx.cam.std.model.GoodsCombo;
import com.mx.cam.std.model.GoodsGroup;
import com.mx.cam.std.service.StdGoodsService;

/**
 * 商品管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/std/goods")
@MustLogin
public class StdGoodsController extends BaseController {
	private static Log log = LogFactory.getLog(StdGoodsController.class);

	@Autowired
	private StdGoodsService stdGoodsService;

	/**
	 * 查看商品管理数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getGoodsManage")
	public @ResponseBody
	Object getGoodsManage(Goods bean) throws Exception {
		log.info("getGoodsManage");

		return stdGoodsService.getGoodsManage(bean);
	}

	/**
	 * 删除商品信息数据
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteGoodsManage")
	public @ResponseBody
	Object deleteGoodsManage(String ids) throws Exception {
		log.info("deleteGoodsManage");

		return stdGoodsService.deleteGoodsManage(ids);
	}

	/**
	 * 查看商品套餐详细数据
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getGoodsComboManage")
	public @ResponseBody
	Object getGoodsComboManage(GoodsCombo bean) throws Exception {
		log.info("getGoodsComboManage");

		return stdGoodsService.getGoodsComboManage(bean);
	}

	/**
	 * 查看商品组合详细数据
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getGoodsGroupManage")
	public @ResponseBody
	Object getGoodsGroupManage(GoodsGroup bean) throws Exception {
		log.info("getGoodsGroupManage");

		return stdGoodsService.getGoodsGroupManage(bean);
	}

	/**
	 * 更新商品上下架状态
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateGoodsUpDownFlag")
	public @ResponseBody
	Object updateGoodsUpDownFlag(Goods bean) throws Exception {
		log.info("updateGoodsUpDownFlag");

		return stdGoodsService.updateGoodsUpDownFlag(bean);
	}

//	/**
//	 * 取得商品管理下拉列表(group_flag:0非组合商品 ，编辑时查询商品列表时需要去掉本身是子商品的情况)
//	 * 
//	 * @param bean
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/getGoodsByProductCombobox")
//	public @ResponseBody
//	Object getGoodsByProductCombobox(Goods bean) throws Exception {
//		log.info("getGoodsByProductCombobox");
//
//		JSONArray array = new JSONArray();
//		JSONObject re = new JSONObject();
//		try {
//			List<Goods> list = stdGoodsService.getGoodsManage(bean);
//			for (int i = 0; i < list.size(); i++) {
//				re.put("id", list.get(i).getGoods_id());
//				re.put("text", list.get(i).getGoods_name());
//				array.add(re);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return array;
//	}

	/**
	 * 添加商品
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insertGoodsManage")
	public @ResponseBody
	Object insertGoodsManage(String jsonStr) throws Exception {
		log.info("insertGoodsManage");

		Goods bean = (Goods) CommonUtils.convertJsonToBean(jsonStr, Goods.class);
		return stdGoodsService.insertGoodsManage(bean);
	}

	/**
	 * 查询商品明细
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getGoodsItem")
	public @ResponseBody
	Object getGoodsItem(Goods bean) throws Exception {
		log.info("getGoodsItem");

		return stdGoodsService.getGoodsItem(bean);
	}

	/**
	 * 编辑商品
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateGoodsManage")
	public @ResponseBody
	Object updateGoodsManage(String jsonStr) throws Exception {
		log.info("updateGoodsManage");

		Goods bean = (Goods) CommonUtils.convertJsonToBean(jsonStr, Goods.class);
		return stdGoodsService.updateGoodsManage(bean);
	}
}