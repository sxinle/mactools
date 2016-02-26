package com.mx.cam.common.user.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.cam.common.user.model.Menu;

/**
 * 菜单管理Dao
 * @author zhengy
 *
 */
@Repository("MenuDao")
public interface MenuDao {
	
	//取得父菜单ID及名称
    Menu getFatherName(String id);
	
	//刪除菜单
    void deleteMenuManage(String id);
	
	//验证菜单名称是否重复
    int checkMenuName(Menu menu);
	
	//更新菜单
    void updateMenu(Menu menu);
	
	//取得父菜单下所有子菜单中排序字段的最大数
    String searchMaxSortByParentId(String parentid);
	
	//取得父菜单中树形结构字段
    String searchTreedeep(String id);
	
	//添加菜单
    void saveMenu(Menu menu);

    //取得用户登录菜单
    List<Menu> searchUserMenu(String userID);
}
