package com.mx.cam.common.user.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mx.cam.common.user.model.Group;
import com.mx.cam.common.user.model.User;

/**
 * 用户 用户组管理Dao
 * 
 * @author zhengy
 * 
 */
public interface UserGroupDao {
	
	//删除用户组时删除对用的用户组菜单
    List<Group> checkUserGroupId(String[] ids);
	
	//添加用户角色
    void saveUserGroup(@Param("userID")String userID, @Param("array") String[] ids);
	
	//删除用户角色
    void deleteUserGroup(User bean);

}
