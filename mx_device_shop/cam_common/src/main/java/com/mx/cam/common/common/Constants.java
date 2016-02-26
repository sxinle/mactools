package com.mx.cam.common.common;

/**
 * @author xiaojian
 * @date 2015年6月16日 下午5:20:34
 * @description constant class.
 *
 */
public class Constants {
    public static final String USERNAME_IS_NULL_MESSAGE     = "请输入登陆用户名";
    public static final String USERNAME_IS_NOT_FIND_MESSAGE = "登陆用户不存在";
    public static final String ROLE_ADMIN_ID                = "0";
    public static final String ROLE_ADMIN                   = "ROLE_ADMIN";
    public static final String ROLE_USER                    = "ROLE_USER";
    public static final String MOUDLE_TYPE                  = "610301";

    public static final int    FREE_AUTH                    =    1;           //1:免费权限  2:收费权限
    public static final int    PAY_AUTH                     =    2;
    public static final long   AUTHTIME                     = 6307200000000L; //鉴权200年
    public static final String PRODUCT_ID                   = "110100";

    public static final int    RESPCODE_SESSION_TIMEOUT     =  2000;          // session 过期
    public static final int    RESPCODE_SUCCESS             =  100;           // 成功
    public static final int    RESPCODE_FAILURE             = -100;           // 异常错误
    public static final int    RESPCODE_NOBINDDEVICE        = -101;           // 验证失败
    public static final int    RESPCODE_ERR_PARAM           = -102;           // 参数错误
    public static final int    RESPCODE_ERR_ENDTIME         = -103;
    public static final int    RESPCODE_ERR_NOTFOUND        = -104;
    public static final int    RESPCODE_ERR_RIGHT           = -105;           // -105 无权限使用该数据
    public static final int    RESPCODE_ERR_ENCRYPTION      = -106;           // 加密库错误
    public static final int    RESPCODE_ERR_DUP_ACTIVE      = -107;           // 设备已经激活过
    public static final int    RESPCODE_MISMATCHING         = -108;           // 产品系列和车机号不匹配
    public static final int    RESPCODE_ACTIVED             = -109;           // 已经激活过
    public static final int    RESPCODE_ERR_USED            = -110;           // 已被使用
    public static final int    RESPCODE_ERR_SAME            = -210;           // 名称或ID重复
    public static final int    RESPCODE_ERR_SYNC            = -220;           // 支付方式不支持同步
    public static final int    RESPCODE_PAY_MODE_ERROR      = -111;           // -111支付模式错误
    public static final int    RESPCODE_ERR_VERCODE         = -200;
    public static final int    RESPCODE_ERR_NOT_LOGIN       = -112;           // 未登陆

    public static final String PREFIX_MAZDA                 = "/mazda";       // cam马自达接口前缀
    public static final String KEY_RESP_CODE                = "respCode";
    
    public static final String SUNCCESS = "Success";
    public static final String FAILURE = "Failure";

}
