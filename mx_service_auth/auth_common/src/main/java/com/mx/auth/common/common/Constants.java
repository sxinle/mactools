package com.mx.auth.common.common;

/**
 * @author xiaojian
 * @date 2015年6月16日 下午5:20:34
 * @description constant class.
 */
public abstract class Constants {

    public static final String USERNAME_IS_NULL_MESSAGE         = "请输入登陆用户名";
    public static final String USERNAME_IS_NOT_FIND_MESSAGE     = "登陆用户不存在";
    public static final String ROLE_ADMIN_ID                    = "0";
    public static final String ROLE_ADMIN                       = "ROLE_ADMIN";
    public static final String ROLE_USER                        = "ROLE_USER";
    public static final String MOUDLE_TYPE                      = "610301";

    public static final int    FREE_AUTH                        =    1;           // 1:免费权限  2:收费权限
    public static final int    PAY_AUTH                         =    2;
    public static final long   AUTHTIME                         = 6307200000000L; // 鉴权200年
    public static final String PRODUCT_ID                       = "110100";

    public static final int    RESPCODE_SUCCESS                 =  100;           // 成功
    public static final int    RESPCODE_FAILURE                 = -100;           // 异常错误
    public static final int    RESPCODE_NOBINDDEVICE            = -101;           // 验证失败
    public static final int    RESPCODE_ERR_PARAM               = -102;           // 参数错误
    public static final int    RESPCODE_NOTFOUND_DEVICENO       = -103;           // 没有找到对应的车机号
    public static final int    RESPCODE_ERR_ENDTIME             = -103;
    public static final int    RESPCODE_NO_ACTIVATE             = -104;           // 
    public static final int    RESPCODE_ERR_NO_RIGHT            = -105;           // 无权限使用该数据
    public static final int    RESPCODE_ERR_ENCRYPTION          = -106;           // 加密库错误
    public static final int    RESPCODE_ERR_DUP_ACTIVE          = -107;           // 设备已经激活过
    public static final int    RESPCODE_MISMATCHING             = -108;           // 产品系列和车机号不匹配
    public static final int    RESPCODE_ACTIVED                 = -109;           // 已经激活过
    public static final int    RESPCODE_ERR_SIGN                = -111;           // 签名错误
    public static final int    RESPCODE_ERR_HAS_DEVICE_NO       = -112;           // device已经激活
    public static final int    RESPCODE_ERR_HAS_VIN             = -113;           // vin已经激活
    public static final int    RESPCODE_ERR_DEVICE_NOT_FOUND    = -114;           // deviceNo激活记录找不到
    public static final int    RESPCODE_ERR_DEV_NO_PERMISSION   = -115;           // deviceNo没有激活权限
    public static final int    RESPCODE_ERR_DEVICE_NO_USER      = -116;           // 车机未绑定vin，车机用户信息不可修改

    public static final String ACT_TYPE_NEW                     = "1";            // 首次激活
    public static final String ACT_TYPE_UPDATE                  = "3";            // 数据升级
    public static final String AUTH_RULE_PERIOD                 = "1";            // 按时间段
    public static final String AUTH_RULE_TIMES                  = "2";            // 按次数
    public static final String AUTH_RULE_VERSION                = "3";            // 按版本
    public static final String AUTH_RULE_TIMES_WITH_PERIOD      = "4";            // 按次数加时间
    public static final String AUTH_BUSINESS_MODE_PRODUCE       = "0";            // 产线激活
    public static final String AUTH_BUSINESS_MODE_SELL_WITH_NUM = "1";            // 销售激活有号段
    public static final String AUTH_BUSINESS_MODE_SELL_NO_NUM   = "2";            // 销售激活无号段
    public static final String AUTH_BUSINESS_MODE_BUY           = "3";            // 购买

    public static final int    DATE_TYPE1                       =    1;           // 日
    public static final int    DATE_TYPE0                       =    0;           // 月
    public static final int    DATE_TYPE2                       =    2;           // 年

    public static final String ACT_SOURCE_WEB                   = "1";            // 激活来源网站
    public static final String ACT_SOURCE_PC                    = "2";            // PC工具
    public static final String ACT_SOURCE_OTHER                 = "3";            // 其他
    public static final String ACT_WAY_ORIGIN_NO                = "0";            // 原始序列号激活
    public static final String ACT_WAY_DEVICE_SER               = "1";            // 硬件序列号激活

    public static final String PREFIX_MAZDA                     = "/mazda";       // cam马自达接口前缀
    public static final String RESPCODE_KEY                     = "respCode";

    public static final int    VIN_NOT_EXIST                    = -1;
    public static final int    SERVICE_CAN                      = 1;
    public static final int    SERVICE_OUT_DATE                 = 2;
    public static final int    SERVICE_NOT_EXIST                = 3;
    
    public static final String WHOLE_COUNTRY_CODE               = "5600";
}
