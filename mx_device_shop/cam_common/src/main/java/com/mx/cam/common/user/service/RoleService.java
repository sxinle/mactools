package com.mx.cam.common.user.service;

import java.util.List;

import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.model.Role;

/**
 * 角色管理Service
 * 
 * @author zhengy
 * 
 */
public interface RoleService {

	/**
	 * 查询角色列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	List<Role> getRoleManage(Role bean) throws Exception;

	/**
	 * 删除角色
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	int deleteRoleManage(String ids) throws Exception;

	/**
	 * 验证角色是否被用户使用
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	List<String> checkUserRoleId(String ids) throws Exception;

	/**
	 * 验证角色名称是否重复
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	String checkRoleName(Role bean) throws Exception;

	/**
	 * 保存角色
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	int saveRoleManage(Role bean) throws Exception;

	/**
	 * 取得角色权限
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	List<Menu> getMenuByRole(String id) throws Exception;

	/**
	 * 保存角色菜单
	 * 
	 * @param roleId
	 * @param menuIds
	 * @return
	 * @throws Exception
	 */
	int saveRoleMenu(String roleId, String menuIds) throws Exception;
	
//	/**
//	 * 保存用户和角色关系
//	 * 
//	 * @param userID
//	 * @param roleIDs
//	 * @return
//	 * @throws Exception
//	 */
//	String saveUserRole(String userID, String roleIDs) throws Exception;
}
