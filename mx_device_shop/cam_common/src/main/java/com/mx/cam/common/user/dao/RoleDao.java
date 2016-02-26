package com.mx.cam.common.user.dao;


import com.mx.cam.common.user.model.Role;

import java.util.List;

/**
 * 角色管理Dao
 * 
 * @author zhengy
 * 
 */
public interface RoleDao {

	// 查询角色列表
    List<Role> getRoleManage(Role bean);

	// 删除角色
    void deleteRoleManage(String[] ids);

	// 验证角色名称是否重复
    int checkRoleName(Role bean);

	// 添加角色
    void saveRole(Role bean);

	// 更新角色
    void updateRole(Role bean);

}
