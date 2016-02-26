package com.mx.auth.mazda.service;

import com.mx.auth.mazda.beans.TestBean;

/**
 * 重置Service
 * 
 * @author zhengy
 * 
 */
public interface TestService {

    /**
     * 重置车机
     * 
     * @param device_no
     * @return
     * @throws Exception
     */
    void getReset(TestBean bean) throws Exception;

    /**
     * 修改超期
     * 
     * @param device_no
     *            车机号
     * @param service_code
     *            服务code
     * @param is_out_time
     *            是否超期 超期为 0 不超期为 1
     * @return
     * @throws Exception 
     */
    void modifyTspPermission(TestBean bean) throws Exception;

    /**
     * 直接取消免费期
     * 
     * @param deviceNo
     * @param productId
     * @throws Exception 
     */
    void abrogateFree(String deviceNo, String productId) throws Exception;

}
