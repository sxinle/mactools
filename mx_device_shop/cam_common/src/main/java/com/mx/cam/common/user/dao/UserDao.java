package com.mx.cam.common.user.dao;


import com.mx.cam.common.user.model.User;

import java.util.List;


/**
 * 用戶管理Dao
 * 
 * @author zhengy
 * 
 */
public interface UserDao {

    // 查找用户
    User findByExample(User user);
    
    // 查找4S店用户
    User find4SUser(User user);

	// 查询用户列表
    List<User> getUserManage(User bean);

	// 验证用户名称是否重复
    int checkUserName(User bean);

	// 添加用户
    void saveUser(User bean);

	// 更新用户
    void updateUser(User bean);

	// 删除用户（将enable字段设置为0）
    void deleteUser(String[] idArray);

	// 重置密码,修改密码
    void resetUserPwd(User bean);

	// 获取当前登录用户的信息
    User getLoginUserInfo(String user_name);

	// 验证旧密码
    int checkPwd(User bean);
	
	//修改登录用户的基本信息
    void updateUserInfo(User bean);

}
