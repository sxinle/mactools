package com.mx.cam.common.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.CommonUtils;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.RandomGUID;
import com.mx.cam.common.user.dao.UserDao;
import com.mx.cam.common.user.dao.UserGroupDao;
import com.mx.cam.common.user.dao.UserRoleDao;
import com.mx.cam.common.user.model.User;
import com.mx.cam.common.user.service.UserService;

/**
 * 用户管理Service
 * 
 * @author zhengy
 * 
 */
@Service("userService")
@Transactional("shop")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private UserRoleDao userRoleDao;

	@Autowired
	private UserGroupDao userGroupDao;

	/**
	 * 查询用户列表
	 */
	@Override
	public List<User> getUserManage(User bean) throws Exception {
		// 查询用户列表
		return userDao.getUserManage(bean);
	}

	/**
	 * 验证用户名称是否重复
	 */
	@Override
	public String checkUserName(User bean) throws Exception {
		String str = "";
		// 验证角色名称是否重复
		int count = userDao.checkUserName(bean);
		if (count == 0) {
			// 不重复
			str = Constants.SUNCCESS;
		} else {
			// 重复
			str = Constants.FAILURE;
		}
		return str;
	}

	/**
	 * 保存用户
	 */
	@Override
	public int saveUser(User bean) throws Exception {
		String id;
		
		// 添加用户
		if (bean.getUser_id() == null || "".equals(bean.getUser_id())) {

			RandomGUID rg = new RandomGUID(true);
			id = rg.toString();
			// 取得随机角色ID
			bean.setUser_id(id);
			// MD5加密密码
			bean.setUser_pwd(CommonUtils.md5(bean.getUser_pwd()));
			// 保存用户
			userDao.saveUser(bean);
		} else {
			id = bean.getUser_id();
			if (bean.getUser_pwd_old() == null || "".equals(bean.getUser_pwd_old()) || bean.getUser_pwd().equals(bean.getUser_pwd_old())) {
				bean.setUser_pwd(null);
			}else{
				// MD5加密密码
				bean.setUser_pwd(CommonUtils.md5(bean.getUser_pwd()));
			}
			
			// 修改用户
			userDao.updateUser(bean);
			userRoleDao.deleteUserRole(bean);
			userGroupDao.deleteUserGroup(bean);
		}

		// 保存角色和用户关系
		userRoleDao.saveUserRole(id, bean.getRoleIDs().split(","));
		// 保存用户和用户组关系
		userGroupDao.saveUserGroup(id, bean.getGroupIDs().split(","));
		return Constants.RESPCODE_SUCCESS;

	}

	/**
	 * 删除用户
	 */
	@Override
	public int deleteUser(String ids) throws Exception {
		String[] idArray = ids.split(",");
		// 删除用户
		userDao.deleteUser(idArray);
		return Constants.RESPCODE_SUCCESS;

	}

	/**
	 * 重置密码
	 */
	@Override
	public int resetUserPwd(String id, String username, String password) throws Exception {
		User bean = new User();
		bean.setUser_id(id);
		// MD5加密密码
		bean.setUser_pwd(CommonUtils.md5(password));
		userDao.resetUserPwd(bean);
		return Constants.RESPCODE_SUCCESS;
	}

	/**
	 * 获取当前登录用户的信息
	 */
	@Override
	public User getLoginUserInfo(String user_name) throws Exception {
		return userDao.getLoginUserInfo(user_name);
	}

	/**
	 * 修改登录用户基本信息
	 */
	@Override
	public String updateUser(User bean) throws Exception {
		// 修改登录用户基本信息
		userDao.updateUserInfo(bean);
		return "SUCCESS";

	}

	/**
	 * 查找用户
	 */
	@Override
	public User findByExample(User user) {
		user.setUser_pwd(CommonUtils.md5(user.getUser_pwd()));
		return userDao.findByExample(user);
	}

	@Override
	public User find4SUser(User user) {
		user.setUser_pwd(CommonUtils.md5(user.getUser_pwd()));
		return userDao.find4SUser(user);
	}

}
