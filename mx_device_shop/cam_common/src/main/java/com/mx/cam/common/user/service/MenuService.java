package com.mx.cam.common.user.service;

import java.util.List;

import com.mx.cam.common.user.model.Menu;

public interface MenuService {

	/**取得所有菜单
	 * @param userID
	 * @return
	 */
	List<Menu> searchUserMenu(String userID);

	/**
	 * 取得树形父级菜单ID以及名称
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	Menu getFatherName(String id) throws Exception;

	/**
	 * 删除菜单
	 * 
	 * @param id
	 * @throws Exception
	 */
	void deleteMenuManage(String id) throws Exception;

	/**
	 * 验证菜单名称是否重复
	 * 
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	String checkMenuName(Menu menu) throws Exception;

	/**
	 * 保存菜单
	 * 
	 * @param menu
	 * @throws Exception
	 */
	void saveMenuManage(Menu menu) throws Exception;
}
