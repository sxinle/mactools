package com.mx.auth.common.dao;

import java.util.List;

import com.mx.auth.common.model.Encryption;

/**
 * 加密库Dao
 *
 * @author zhengy
 */
public interface EncryptionDao {

    // 查询加密库管理信息
    List<Encryption> getEncryptionManage(Encryption bean);

    // 更新加密库
    void updateEncryptionManage(Encryption bean);

}
