package com.mx.cam.common.user.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.model.User;
import com.mx.cam.common.user.service.LoginService;
import com.mx.cam.common.user.service.MenuService;

/**
 * 菜单管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/menu")
@MustLogin
public class MenuController extends BaseController {
	private static Log log = LogFactory.getLog(MenuController.class);

	@Autowired
	private MenuService menuService;

	@Autowired
	private LoginService loginService;

	/**
	 * 取得菜单管理树形数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getMenuManage")
	public @ResponseBody Object getMenuManage(HttpServletRequest req) throws Exception {
		log.info("getMenuManage");

		List<Map<String, Object>> items = new ArrayList<Map<String, Object>>();
		User user = (User) req.getSession().getAttribute("user");
		if(user == null){
			return respBody(Constants.RESPCODE_FAILURE, null);
		}
		// 以超级管理员身份取得所有菜单树形数据
		List<Menu> menus = loginService.findMenus(user);
		for (Menu menu : menus) {
			items.add(menu.toMapWithOnClick());
		}
		return respBody(Constants.RESPCODE_SUCCESS, items);
	}

	/**
	 * 取得树形父级菜单ID以及名称
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getFatherName")
	public @ResponseBody Object getFatherName(String id) throws Exception {
		log.info("getFatherName");
		// 取得树形父级菜单ID以及名称
		return respBody(Constants.RESPCODE_SUCCESS, menuService.getFatherName(id));
	}

	/**
	 * 删除菜单
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteMenuManage")
	public @ResponseBody Object deleteMenuManage(HttpServletRequest req, String id) throws Exception {
		log.info("deleteMenuManage");
		List<Map<String, Object>> items = new ArrayList<Map<String, Object>>();
		// 删除菜单
		menuService.deleteMenuManage(id);
		User user = (User) req.getSession().getAttribute("user");
		if(user == null){
			return respBody(Constants.RESPCODE_FAILURE, null);
		}
		// 以超级管理员身份取得所有菜单树形数据
		List<Menu> menus = loginService.findMenus(user);
		for (Menu menu : menus) {
			items.add(menu.toMapWithOnClick());
		}
		return respBody(Constants.RESPCODE_SUCCESS, items);
	}

	/**
	 * 保存菜单
	 * 
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveMenuManage")
	public @ResponseBody Object saveMenuManage(HttpServletRequest req, Menu menu) throws Exception {
		log.info("saveMenuManage");

		if (Constants.SUNCCESS.equals(menuService.checkMenuName(menu)) == false) {// 名称重复
			return respBody(Constants.RESPCODE_ERR_USED, null);
		}
		List<Map<String, Object>> items = new ArrayList<Map<String, Object>>();
		// 保存菜单
		menuService.saveMenuManage(menu);
		User user = (User) req.getSession().getAttribute("user");
		if(user == null){
			return respBody(Constants.RESPCODE_FAILURE, null);
		}
		// 以超级管理员身份取得所有菜单树形数据
		List<Menu> menus = loginService.findMenus(user);

		for (Menu bean : menus) {
			items.add(bean.toMapWithOnClick());
		}
		return respBody(Constants.RESPCODE_SUCCESS, items);
	}
}