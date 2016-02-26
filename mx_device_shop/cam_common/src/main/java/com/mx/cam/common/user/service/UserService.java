package com.mx.cam.common.user.service;


import com.mx.cam.common.user.model.User;

import java.util.List;

/**
 * 用户管理Service
 * 
 * @author zhengy
 * 
 */
public interface UserService {

	/**
	 * 查询用户管理列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	List<User> getUserManage(User bean) throws Exception;

	/**
	 * 验证用户名称是否重复
	 *
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	String checkUserName(User bean) throws Exception;

	/**
	 * 保存用户
	 *
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	int saveUser(User bean) throws Exception;

	/**
	 * 删除用户
	 *
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	int deleteUser(String ids) throws Exception;

	/**
	 * 重置密码
	 *
	 * @param id
	 * @param username
	 * @param password
	 * @throws Exception
	 */
	int resetUserPwd(String id, String username, String password)throws Exception;

	/**
	 * 获取当前登录用户的信息
	 *
	 * @param user_name
	 * @return
	 * @throws Exception
	 */
	User getLoginUserInfo(String user_name) throws Exception;

	/**
	 * 修改登录用户基本信息
	 *
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	String updateUser(User bean) throws Exception;
//	/**
//	 * 修改密码
//	 *
//	 * @param bean
//	 * @return
//	 * @throws Exception
//	 */
//	String updatePwd(User bean) throws Exception;

    /**
     * 根据用户名密码查询用户
     * @param user
     * @return
     */
    User findByExample(User user);

    
    /**4S店用户登录用
     * @return
     */
    User find4SUser(User user);
}
