package com.mx.cam.common.user.controller;

import com.mx.cam.common.common.*;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.user.model.User;
import com.mx.cam.common.user.service.UserService;
import com.mx.server.common.config.ConfigLoader;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 * Created by hsong on 16-1-7.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	private static Logger logger = LoggerFactory.getLogger(UserController.class);

	private final String imgPath = ConfigLoader.getProperty("mx_device_shop.verify_img_path");

	@Autowired
	private UserService userService;

	/**
	 * 检查session过期
	 */
	@RequestMapping("/isAlive")
	@ResponseBody
	public Object isAlive(HttpServletRequest req) throws Exception {
		User user = (User) req.getSession().getAttribute("user");
		return null == user ? ResponseBuilder.getRespCode(Constants.RESPCODE_SESSION_TIMEOUT)
				: ResponseBuilder.getRespCode(Constants.RESPCODE_SUCCESS);
	}

	/**
	 * 验证码获取
	 */
	@RequestMapping("/getVerifyImg")
	@ResponseBody
	public ResponseEntity<byte[]> getVerifyImg(HttpServletRequest req) throws Exception {
        String code = VerifyImgGenerator.generateVerifyCode(4);
		req.getSession(true).setAttribute("code", code);
		File dir = new File(imgPath);
		int w = 200, h = 80;

		File file = new File(dir, code + ".jpg");
		VerifyImgGenerator.outputImage(w, h, file, code);

		InputStream in = new FileInputStream(file);
		byte[] stream = new byte[in.available()];
		in.read(stream);

		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<>(stream, headers, HttpStatus.CREATED);
	}

	/**
	 * ajax验证输入验证码是否正确
	 */
	@RequestMapping("/verifyCode")
	@ResponseBody
	public Object verifyCode(HttpServletRequest req, String code) throws Exception {
		String sessionCode = req.getSession().getAttribute("code").toString();
		if (StringUtils.isNotEmpty(code) && code.equalsIgnoreCase(sessionCode)) {
			return ResponseBuilder.getRespCode(Constants.RESPCODE_SUCCESS);
		}

		return ResponseBuilder.getRespCode(Constants.RESPCODE_FAILURE);
	}

	/**
	 * 取得用户管理数据
	 */
	@RequestMapping("/getUserManage")
	@MustLogin	
	public @ResponseBody Object getUserManage(User bean) throws Exception {
		logger.info("getUserManage");
		return respPageBody(Constants.RESPCODE_SUCCESS, userService.getUserManage(bean), bean.getTotal());
	}

	/**
	 * 保存用户
	 */
	@RequestMapping("/saveUser")
	@MustLogin	
	public @ResponseBody Object saveUser(User bean) throws Exception {
		logger.info("saveUser");
		if (Constants.SUNCCESS.equals(userService.checkUserName(bean)) == false) {// 名称重复
			return respBody(Constants.RESPCODE_ERR_USED, null);
		}
		// 得到用户设定的角色
		return respBody(userService.saveUser(bean), null);
	}

	/**
	 * 删除用户
	 */
	@RequestMapping("/deleteUser")
	@MustLogin	
	public @ResponseBody Object deleteUser(String ids) throws Exception {
		logger.info("deleteUser");
		return respBody(userService.deleteUser(ids), null);
	}

	/**
	 * 重置密码
	 */
	@RequestMapping(value = "/resetUserPwd")
	@MustLogin	
	public @ResponseBody Object resetUserPwd(String user_id, String user_name) throws Exception {
		logger.info("resetUserPwd");
		return respBody(userService.resetUserPwd(user_id, user_name, ConfigListener.getProduceSysConfig().getPassword()), null);
	}

	/**
	 * 获取当前登录用户的信息
	 */
	@RequestMapping(value = "/userInfo")
	@MustLogin	
	public @ResponseBody Object getLoginUserInfo(HttpServletRequest req) throws Exception {
		logger.info("getLoginUserInfo");
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
			return respBody(Constants.RESPCODE_FAILURE, null);
		}
		return respBody(Constants.RESPCODE_SUCCESS, userService.getLoginUserInfo(user.getUser_name()));
	}
}
