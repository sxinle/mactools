package com.mx.auth.common.common;

/**
 * 读取配置文件内容实体类
 * 
 * @author xiaojian
 */
public class PdpServerConfig {
    private String clearAuthCacheUrl;
    private String clearCustomerAuthCacheUrl;

    public String getClearAuthCacheUrl() {
        return clearAuthCacheUrl;
    }

    public void setClearAuthCacheUrl(String clearAuthCacheUrl) {
        this.clearAuthCacheUrl = clearAuthCacheUrl;
    }

    public String getClearCustomerAuthCacheUrl() {
        return clearCustomerAuthCacheUrl;
    }

    public void setClearCustomerAuthCacheUrl(String clearCustomerAuthCacheUrl) {
        this.clearCustomerAuthCacheUrl = clearCustomerAuthCacheUrl;
    }
}
