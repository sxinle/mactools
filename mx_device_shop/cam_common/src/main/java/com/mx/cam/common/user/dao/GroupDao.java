package com.mx.cam.common.user.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.cam.common.user.model.Group;

/**
 * 用户组管理Dao
 * 
 * @author sunc
 * 
 */
@Repository("GroupDao")
public interface GroupDao {

	// 查询用户组列表
    List<Group> getGroupManage(Group Group);

	// 删除用户组
    void deleteGroupManage(String[] ids);

	// 验证用户组名称是否重复
    int checkGroupName(Group bean);

	// 添加用户组
    void saveGroup(Group bean);

	// 更新用户组
    void updateGroup(Group bean);

}
