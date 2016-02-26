package com.mx.auth.common.common;

import com.mx.ngtp.util.HttpSender;

/**
 * HTTP请求发送包装类
 * 
 * @author Chenzy
 * 
 */
public class HttpSenderManager {
    private HttpSenderManager() {
    }

    private static class HttpSenderHolder {
        private static HttpSender instance = new HttpSender(60000, 15000);
    }

    public static HttpSender instance() {
        return HttpSenderHolder.instance;
    }
}
