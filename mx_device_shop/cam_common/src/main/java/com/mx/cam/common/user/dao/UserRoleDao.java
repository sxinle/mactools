package com.mx.cam.common.user.dao;


import com.mx.cam.common.user.model.Role;
import com.mx.cam.common.user.model.User;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * 用户角色管理Dao
 * 
 * @author zhengy
 * 
 */
public interface UserRoleDao {
	
	//删除角色时删除对用的角色菜单
    List<Role> checkUserRoleId(String[] ids);
	
	//添加用户角色
	void saveUserRole(@Param("userID")String userID, @Param("array") String[] ids);
	
	//删除用户角色
    void deleteUserRole(User bean);

    //查询用户所有角色和用户组
    List<Role> selectUserRoles(@Param("userID")String userID);
}
