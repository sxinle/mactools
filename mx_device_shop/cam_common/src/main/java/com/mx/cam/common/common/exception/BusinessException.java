package com.mx.cam.common.common.exception;

/**
 * @author xiaojian
 * @date 2015年6月16日 下午5:21:12 
 * @description 
 * 
 */
public class BusinessException extends Exception {

    private static final long serialVersionUID = 1L;

    private int errCode;

    public BusinessException(int errCode) {
        this.errCode = errCode;
    }

    public int getErrCode() {
        return errCode;
    }

    public void setErrCode(int errCode) {
        this.errCode = errCode;
    }
}