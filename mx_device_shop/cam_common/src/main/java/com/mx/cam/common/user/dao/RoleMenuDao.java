package com.mx.cam.common.user.dao;


import java.util.List;

import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.model.RoleMenu;

/**
 * 角色菜单管理Dao
 * 
 * @author zhengy
 * 
 */
public interface RoleMenuDao {

	// 删除菜单时删除对用的角色菜单
	void deleteRoleMenuByMenu(String id);

	// 删除角色时删除对用的角色菜单
    void deleteRoleMenuByRole(String[] ids);

	// 取得角色权限
    List<Menu> getMenuByRole(String id);
	
	//保存角色菜单
    void saveRoleMenu(RoleMenu bean);

}
