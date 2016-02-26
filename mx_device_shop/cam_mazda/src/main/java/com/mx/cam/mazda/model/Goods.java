package com.mx.cam.mazda.model;


import com.mx.cam.common.common.SearchPageUtil;

public class Goods extends SearchPageUtil {

    private static final long serialVersionUID = 1L;
    private String goods_id;      //商品ID（区域码）
    private String catagory_id;   //商品类别ID
    private String catagory_name; //商品类别名称，取自商品类别表
    private String goods_name;    //商品名称
    private String region_name;   //区域名称
    private String valid;         //有效期
    private String nums;          //次数
    private String price;         //商品价格
    private String description;   //商品描述
    private String id;            //对应js的隐藏对象而特别设置
    private String card_type;     //刮刮支付类型

    // 商品增加图片链接和所属服务列表
    private String img_url;       //商品图片URL
    private String service_ids;  //服务列表

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getCatagory_id() {
        return catagory_id;
    }

    public void setCatagory_id(String catagory_id) {
        this.catagory_id = catagory_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getRegion_name() {
        return region_name;
    }

    public void setRegion_name(String region_name) {
        this.region_name = region_name;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public String getNums() {
        return nums;
    }

    public void setNums(String nums) {
        this.nums = nums;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCatagory_name() {
        return catagory_name;
    }

    public void setCatagory_name(String catagory_name) {
        this.catagory_name = catagory_name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCard_type() {
        return card_type;
    }

    public void setCard_type(String card_type) {
        this.card_type = card_type;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getService_ids() {
        return service_ids;
    }

    public void setService_ids(String service_ids) {
        this.service_ids = service_ids;
    }
}
