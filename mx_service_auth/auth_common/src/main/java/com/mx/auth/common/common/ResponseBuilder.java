package com.mx.auth.common.common;

public class ResponseBuilder {
    /**
     * 取得错误应答信息
     * 
     * @return 
     */
    public static String getRespCode(int errCode) {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"respCode\":");
        sb.append(errCode);
        sb.append("}");
        return sb.toString();
    }
    
    /**
     * 取得错误应答信息
     * 
     * @return 
     */
    public static String getRespCode(String errVal) {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"respCode\":");
        sb.append("\""+errVal+"\"");
        sb.append("}");
        return sb.toString();
    }
}
