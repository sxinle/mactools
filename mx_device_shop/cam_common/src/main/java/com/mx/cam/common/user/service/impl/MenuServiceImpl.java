package com.mx.cam.common.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.RandomGUID;
import com.mx.cam.common.user.dao.MenuDao;
import com.mx.cam.common.user.dao.RoleMenuDao;
import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.service.MenuService;

@Service
@Transactional("shop")
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;
    @Autowired
	private RoleMenuDao roleMenuDao;
//    @Autowired
//	private GroupMenuDao groupMenuDao;
	/**
	 * 取得树形父级菜单ID以及名称
	 */
	@Override
	public Menu getFatherName(String id) throws Exception {

		// 取得树形父级菜单ID以及名称
		Menu bean = menuDao.getFatherName(id);
		return bean;
	}

	/**
	 * 删除菜单
	 */
	@Override
	public void deleteMenuManage(String id) throws Exception {
		// 删除对应的角色菜单管理
		roleMenuDao.deleteRoleMenuByMenu(id);
//		// 删除对应的用户组菜单管理
//		groupMenuDao.deleteGroupMenuByMenu(id);
		// 删除菜单
		menuDao.deleteMenuManage(id);
	}

	/**
	 * 验证菜单名称是否重复
	 */
	@Override
	public String checkMenuName(Menu menu) throws Exception {

		// 验证菜单名称是否重复
		int count = menuDao.checkMenuName(menu);

		if (count == 0) {
			// 成功，菜单名称不重复
			return Constants.SUNCCESS;
		} else {
			// 失败，菜单名称重复
			return Constants.FAILURE;
		}
	}

	/**
	 * 保存菜单
	 */
	@Override
	public void saveMenuManage(Menu menu) throws Exception {

		// 添加新菜单
		if ("0".equals(String.valueOf(menu.getId()))) {
			Long tem = (long) 1;
			// 取得父菜单下所有子菜单中排序字段的最大数
			String result = menuDao.searchMaxSortByParentId(menu.getParentid());

			if (result != null && !"".equals(result)) {
				// 父菜单下最大排序字段数加1
				menu.setSort(String.valueOf(Long.valueOf(result) + tem));
			} else {
				// 父菜单下无子菜单
				menu.setSort("1");
			}

			if (!"0".equals(menu.getParentid())) {
				// 取得父菜单中树形结构字段
				String treedeep = menuDao.searchTreedeep(menu.getParentid());
				// 添加菜单的树形结构字段：父菜单树形结构+“：”+父ID
				menu.setTreedeep(treedeep + ":" + menu.getParentid());
			} else {
				// 根节点的树形结构字段为0
				menu.setTreedeep("0");
			}

			menu.setMenuType("CONTEXT");

			// 取得随机ID
			RandomGUID rg = new RandomGUID(true);
			String id = rg.toString();
			menu.setId(id);

			// 保存添加新菜单
			menuDao.saveMenu(menu);
		} else {
			// 更新菜单
			menuDao.updateMenu(menu);
		}

	}

    @Override
    public List<Menu> searchUserMenu(String userID) {
        return menuDao.searchUserMenu(userID);
    }

}
