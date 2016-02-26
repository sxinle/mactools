package com.mx.auth.common.common.enums;

public enum ServiceInfo {

    // 在线算路服务
    MX_ROUTE_CALC    ( 0, "算路服务"),         // 在线算路服务
    MX_SEARCH        ( 1, "检索服务"),         // 检索服务
    MX_TMC           ( 2, "TMC服务"),         // TMC服务
    MX_PLACE         ( 3, "位置服务"),         // 位置服务(地址Code获取与转换等)
    MX_NDS_UPGRADE   ( 4, "NDS升级"),         // NDS升级(增量更新)服务
    MX_AUTH          ( 5, "鉴权服务"),         // 鉴权服务

    // 安防(33~64)
    EMERGENCY_CALL   ( 33, "E-CALL"),        // E-CALL
    INFORMATION_CALL ( 34, "I-CALL"),        // I-CALL
    BREAKDOWN_CALL   ( 35, "B-CALL"),        // B-CALL
    REMOTE_CONTROL   ( 36, "车辆远程控制"),    // 车辆远程控制

    // 娱乐资讯(65~127)
    NEWS             ( 65, "新闻服务"),       // 新闻服务
    WEATHER          ( 66, "天气服务"),       // 天气服务
    VIOLATION        ( 67, "违章查询服务"),    // 违章查询服务
    GASSTATION       ( 68, "动态加油站服务"),  // 动态加油站服务
    PARKINGLOTS      ( 69, "动态停车场服务"),  // 动态停车场服务
    ONLINE_FM        ( 70, "在线FM服务"),     // 在线FM服务
    SEND_TO_CAR      ( 71, "发送到车");       // 发送到车

    private String serviceName;
    private int serviceCode;

    ServiceInfo(int serviceCode, String serviceName) {
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
    }

    public String getServiceName() {
        return this.serviceName;
    }

    public int getServiceCode() {
        return this.serviceCode;
    }

    //1:免费权限  2:收费权限
    public static int FREEAUTH = 1;
    public static int PAYAUTH = 2;

    public boolean notTspService() {
       return this.getServiceCode() == MX_AUTH.getServiceCode() || this.getServiceCode() == MX_TMC.getServiceCode();
    }
}
