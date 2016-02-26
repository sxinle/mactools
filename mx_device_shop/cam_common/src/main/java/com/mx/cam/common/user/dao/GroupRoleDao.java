package com.mx.cam.common.user.dao;


import java.util.List;

import com.mx.cam.common.user.model.GroupRole;
import com.mx.cam.common.user.model.Menu;

/**
 * 用户组菜单管理Dao
 * 
 * @author sunc
 * 
 */
public interface GroupRoleDao {

//	// 删除菜单时删除对用的用户组菜单
    void deleteGroupRoleByRole(String id);

	// 删除用户组时删除对用的用户组菜单
    void deleteGroupRoleByGroup(String[] ids);

	// 取得用户组权限
    List<Menu> getRoleByGroup(String id);
	
	//保存用户组菜单
    void saveGroupRole(GroupRole bean);

}
