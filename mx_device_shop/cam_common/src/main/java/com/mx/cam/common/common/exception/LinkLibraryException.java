package com.mx.cam.common.common.exception;

/**
 * 激活码类库异常
 * 
 * @author daig
 */
public class LinkLibraryException extends Exception {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 6766976175414948026L;

    /**
     * 构建一个激活码类库异常
     * 
     * @param msg
     *            消息
     * @param cause
     *            异常原因
     */
    public LinkLibraryException(String msg, Throwable cause) {
        super(msg, cause);
    }

    /**
     * 构建一个激活码类库异常
     * 
     * @param msg
     *            消息
     */
    public LinkLibraryException(String msg) {
        super(msg);
    }
}
