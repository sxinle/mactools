package com.mx.auth.mazda.beans;

public class TestBean {

    private String deviceNo;
    private String productID;
    private String isExpired;
    private String serviceType;

    @Override
    public String toString() {
        return "TestBean{" +
                "deviceNo='" + deviceNo + '\'' +
                ", productID='" + productID + '\'' +
                ", isExpired='" + isExpired + '\'' +
                ", serviceType='" + serviceType + '\'' +
                '}';
    }

    public String getDeviceNo() {
        return deviceNo;
    }

    public void setDeviceNo(String deviceNo) {
        this.deviceNo = deviceNo;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getIsExpired() {
        return isExpired;
    }

    public void setIsExpired(String isExpired) {
        this.isExpired = isExpired;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

}
