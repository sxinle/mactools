package com.mx.cam.common.user.service;

import java.util.List;

import com.mx.cam.common.user.model.Group;
import com.mx.cam.common.user.model.Menu;

/**
 * 用户组管理Service
 * 
 * @author sunc
 * 
 */
public interface GroupService {

	/**
	 * 查询用户组列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	List<Group> getGroupManage(Group bean) throws Exception;

	/**
	 * 删除用户组
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	int deleteGroupManage(String ids) throws Exception;

	/**
	 * 验证用户组是否被用户使用
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	List<String> checkUserGroupId(String ids) throws Exception;

	/**
	 * 验证用户组名称是否重复
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	String checkGroupName(Group bean) throws Exception;

	/**
	 * 保存用户组
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	int saveGroupManage(Group bean) throws Exception;

	/**
	 * 取得用户组权限
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	List<Menu> getRoleByGroup(String id) throws Exception;

	/**
	 * 保存用户组菜单
	 * 
	 * @param roleId
	 * @param menuIds
	 * @return
	 * @throws Exception
	 */
	int saveGroupRole(String groupId, String menuIds) throws Exception;
}
