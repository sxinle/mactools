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
import com.mx.cam.common.common.ResponseBuilder;
import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.model.User;
import com.mx.cam.common.user.service.LoginService;
import com.mx.cam.common.user.service.UserService;

/**
 * @author xiaojian
 * @date 2015年6月19日 下午1:13:40
 * @description
 * 
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

	private static Log logger = LogFactory.getLog(LoginController.class);

	@Autowired
	private LoginService loginService;

	@Autowired
	private UserService userService;

	/**
	 * 用户登录取得用户组和角色菜单集合
	 * 
	 * @param req
	 * @return
	 */
	@MustLogin
	@RequestMapping("/queryUserMenu")
	public @ResponseBody Object queryUserMenu(HttpServletRequest req) {
		logger.info("queryUserMenu");
		User userDB = (User) req.getSession().getAttribute("user");
		if (userDB == null) {
			return respBody(Constants.RESPCODE_FAILURE, null);
		}
		List<Menu> menus = loginService.findMenus(userDB);
		List<Map<String, Object>> items = new ArrayList<Map<String, Object>>();
		for (Menu menu : menus) {
			items.add(menu.toMapWithOnClick());
		}
		return respBody(Constants.RESPCODE_SUCCESS, items);
	}

	/**
	 * 登录
	 *
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Object login(HttpServletRequest req, User user) throws Exception {
		logger.info("login");
		User userDB = userService.findByExample(user);
		if (null != userDB) {
			req.getSession().setAttribute("user", userDB);
			return ResponseBuilder.getRespCode(Constants.RESPCODE_SUCCESS);
		} else {
			return ResponseBuilder.getRespCode(Constants.RESPCODE_FAILURE);
		}
	}

	/**
	 * 登录
	 *
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login4S")
	@ResponseBody
	public Object login4S(HttpServletRequest req, User user) throws Exception {
		logger.info("login");
		if (user == null || user.getUser_name() == null || user.getUser_pwd() == null || "".equals(user.getOem())) {
			return ResponseBuilder.getRespCode(Constants.RESPCODE_NOBINDDEVICE);
		}
		User userDB = userService.find4SUser(user);
		if(userDB == null){
			return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
		}
		String urls = userDB.getUrls();
		if (urls != null) {
			String[] strs = urls.split(",");
			for (int i = 0; i < strs.length; i++) {
				if (user.getOem().equals(strs[i])) {
					req.getSession().setAttribute("user", userDB);
					return ResponseBuilder.getRespCode(Constants.RESPCODE_SUCCESS);
				}
			}
		}
		return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
	}

	/**
	 * 登出
	 *
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/loginOut")
	@ResponseBody
	public Object loginOut(HttpServletRequest req) throws Exception {
		logger.info("loginOut");
		req.getSession().removeAttribute("user");
		return ResponseBuilder.getRespCode(Constants.RESPCODE_SUCCESS);
	}

}