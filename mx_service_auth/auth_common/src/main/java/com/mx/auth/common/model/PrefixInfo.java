package com.mx.auth.common.model;

import com.mx.auth.common.common.SearchPageUtil;

public class PrefixInfo extends SearchPageUtil {
    private static final long serialVersionUID = 1L;
    
    private String prefixData;// 刮刮卡类型
    private String productSeries;// 产品系列
    private String prefixName;// 类型名称
    private String createTime;// 创建时间

    @Override
    public String toString() {
        return "PrefixInfo{" +
                "prefixData='" + prefixData + '\'' +
                ", productSeries='" + productSeries + '\'' +
                ", prefixName='" + prefixName + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }

    public String getPrefixData() {
        return prefixData;
    }

    public void setPrefixData(String prefixData) {
        this.prefixData = prefixData;
    }

    public String getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(String productSeries) {
        this.productSeries = productSeries;
    }

    public String getPrefixName() {
        return prefixName;
    }

    public void setPrefixName(String prefixName) {
        this.prefixName = prefixName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
