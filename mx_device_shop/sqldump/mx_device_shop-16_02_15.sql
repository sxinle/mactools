/*
Navicat MySQL Data Transfer

Source Server         : Mysql--192.168.2.92
Source Server Version : 50527
Source Host           : 192.168.2.92:3306
Source Database       : mx_device_shop

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2016-02-15 16:38:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c3p0TestTable
-- ----------------------------
DROP TABLE IF EXISTS `c3p0TestTable`;
CREATE TABLE `c3p0TestTable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0TestTable
-- ----------------------------

-- ----------------------------
-- Table structure for mazda_catagory
-- ----------------------------
DROP TABLE IF EXISTS `mazda_catagory`;
CREATE TABLE `mazda_catagory` (
  `catagory_id` varchar(32) NOT NULL COMMENT '商品类别ID',
  `catagory_name` varchar(64) DEFAULT NULL COMMENT '商品类别名称',
  PRIMARY KEY (`catagory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mazda_catagory
-- ----------------------------
INSERT INTO `mazda_catagory` VALUES ('10100', '增量升级');
INSERT INTO `mazda_catagory` VALUES ('6013013', 'wuty1');

-- ----------------------------
-- Table structure for mazda_data_ver
-- ----------------------------
DROP TABLE IF EXISTS `mazda_data_ver`;
CREATE TABLE `mazda_data_ver` (
  `ver_id` varchar(64) NOT NULL COMMENT '数据版本id',
  `ver_name` varchar(100) NOT NULL COMMENT '数据版本号',
  PRIMARY KEY (`ver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mazda_data_ver
-- ----------------------------
INSERT INTO `mazda_data_ver` VALUES ('T04.8003.02.09.01.00-15.01.01-01-N', '15年第一版');
INSERT INTO `mazda_data_ver` VALUES ('T04.8003.02.09.01.00-15.01.01-03-N', '15年第三版');
INSERT INTO `mazda_data_ver` VALUES ('T04.8003.02.09.01.00-15.03.01-06-N', '15年第六版');

-- ----------------------------
-- Table structure for mazda_goods
-- ----------------------------
DROP TABLE IF EXISTS `mazda_goods`;
CREATE TABLE `mazda_goods` (
  `goods_id` varchar(32) NOT NULL COMMENT '商品ID（区域码）',
  `catagory_id` varchar(32) DEFAULT NULL COMMENT '商品类别ID',
  `goods_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `region_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `valid` int(11) DEFAULT NULL COMMENT '有效期(年)',
  `nums` int(11) DEFAULT NULL COMMENT '次数',
  `price` int(11) DEFAULT NULL COMMENT '商品价格',
  `card_type` varchar(32) DEFAULT NULL COMMENT '刮刮卡类型',
  `description` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mazda_goods
-- ----------------------------
INSERT INTO `mazda_goods` VALUES ('1001', '10100', 'wuty', 'wuty', '1', '1', '10', null, '产品吴天宇', 'https://www.baidu.com/img/bd_logo1.png');
INSERT INTO `mazda_goods` VALUES ('1002', '10001', 'wuty2', 'wuty2', '1', '1', '10', null, '', null);
INSERT INTO `mazda_goods` VALUES ('1007', '10001', 'wty4', '北京', '4', '4', '5', null, '1', null);
INSERT INTO `mazda_goods` VALUES ('1100', '10100', '北京地图', '北京', '1', '1', '1', null, '', null);
INSERT INTO `mazda_goods` VALUES ('1200', '10100', '天津地图', '天津', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('1300', '10100', '河北地图', '河北', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('1400', '10100', '山西地图', '山西', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('1500', '10100', '内蒙古自治区地图', '内蒙古自治区', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('2100', '10100', '辽宁地图', '辽宁', '1', '1', '1', null, '', null);
INSERT INTO `mazda_goods` VALUES ('2200', '10100', '吉林地图', '吉林', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('2300', '10100', '黑龙江地图', '黑龙江', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('3100', '10100', '上海地图', '上海', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('3200', '10100', '江苏地图', '江苏', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('3300', '10100', '浙江地图', '浙江', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('3400', '10100', '安徽地图', '安徽', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('3500', '10100', '福建地图', '福建', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('3600', '10100', '江西地图', '江西', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('3700', '10100', '山东地图', '山东', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('4100', '10100', '河南地图', '河南', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('4200', '10100', '湖北地图', '湖北', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('4300', '10100', '湖南地图', '湖南', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('4400', '10100', '广东地图', '广东', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('4500', '10100', '广西壮族自治区地图', '广西壮族自治区', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('4600', '10100', '海南地图', '海南', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('5000', '10100', '重庆地图', '重庆', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('5100', '10100', '四川地图', '四川', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('5200', '10100', '贵州地图', '贵州', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('5300', '10100', '云南地图', '云南', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('5400', '10100', '西藏自治区地图', '西藏自治区 ', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('5600', '10100', '全国地图', '全国', '1', '1', '1', null, '全国增量升级数据覆盖31个省市数据', null);
INSERT INTO `mazda_goods` VALUES ('6100', '10100', '陕西地图', '陕西', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('6200', '10100', '甘肃地图', '甘肃', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('6300', '10100', '青海地图', '青海', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('6400', '10100', '宁夏回族自治区地图', '宁夏回族自治区', '1', '1', '1', null, null, null);
INSERT INTO `mazda_goods` VALUES ('6500', '10100', '新疆维吾尔自治区地图', '新疆维吾尔自治区', '1', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for mazda_goods_service
-- ----------------------------
DROP TABLE IF EXISTS `mazda_goods_service`;
CREATE TABLE `mazda_goods_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of mazda_goods_service
-- ----------------------------
INSERT INTO `mazda_goods_service` VALUES ('1', '1001', '1');
INSERT INTO `mazda_goods_service` VALUES ('2', '1002', '1');

-- ----------------------------
-- Table structure for mazda_order
-- ----------------------------
DROP TABLE IF EXISTS `mazda_order`;
CREATE TABLE `mazda_order` (
  `order_id` varchar(32) NOT NULL COMMENT '订单ID',
  `total_fee` int(11) DEFAULT NULL COMMENT '订单金额',
  `cash_fee` int(11) DEFAULT NULL COMMENT '实收金额',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `device_no` varchar(32) DEFAULT NULL COMMENT '车机原始系列号',
  `del_flag` varchar(5) DEFAULT NULL COMMENT '是否逻辑删除(0:删除 1：使用)',
  `payment_mode_id` int(11) DEFAULT NULL COMMENT '支付方式id',
  `order_state_id` int(11) DEFAULT NULL COMMENT '订单状态id',
  `trade_state` varchar(50) DEFAULT NULL COMMENT '订单状态 SUCCESS—支付成功，REFUND—转入退款，NOTPAY—未支付，CLOSED—已关闭，REVOKED—已撤销，USERPAYING--用户支付中，PAYERROR--支付失败(其他原因，如银行返回失败)',
  `card_type` varchar(32) DEFAULT NULL COMMENT '刮刮卡类型',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mazda_order
-- ----------------------------
INSERT INTO `mazda_order` VALUES ('004d4aa25fbb515c7b005767ac2617db', '1', '1', '2015-09-11 15:56:02', '2015-09-11 15:56:18', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('0068770e593d0dfb08466ac49d1416d5', '1', '1', '2015-10-27 16:32:27', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('00968141f141b7d074bca037b31e51d9', '1', '1', '2015-08-12 17:59:46', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('0156039204a5cf9a7f216fd58910b392', '1', '1', '2015-08-11 16:36:51', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('01f39e2b5f7d44dac8378e7745bae7ce', '1', '1', '2015-08-21 12:03:59', '2015-08-21 12:05:10', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('0234bba087f985b2d1964439a32c3e1e', '1', '1', '2015-08-21 10:11:12', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('02a564d519b89c62ea37e1e504e57651', '1', '1', '2015-10-27 16:27:47', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('03b90f9885c761efae313a8d083f2c6f', '1', '1', '2015-08-26 14:55:39', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('04a420dcccd0b8c9af3c94b11ccd7499', '1', '1', '2015-08-27 10:30:44', '2015-08-27 10:31:08', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('05ae729b669a1312bfa628e12edd7801', '1', '1', '2015-09-01 09:46:05', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('05b131ccaa574f064ed6d3715899a6fc', '1', '1', '2015-08-28 12:29:49', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('061c7000af3255e610d547be3a08e427', '2', '2', '2015-08-04 17:35:41', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('065531b21ed2826906d7b6e3c9b71c04', '1', '1', '2015-08-19 13:46:59', null, '1090', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('07492b2db0e5303d5628801b63604f93', '1', '1', '2015-08-12 18:06:46', '2015-08-12 18:07:24', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('082ebe2e08cff8e159225d33feeda81f', '1', '1', '2015-08-11 17:14:49', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('08fb3da47a4da51df11af0eda6c347c6', '1', '1', '2015-09-26 14:59:33', '2015-09-26 15:00:01', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('0980a399fe8bef87aab05672a9e1de6c', '1', '1', '2015-08-19 16:03:08', '2015-08-19 16:03:34', '1090', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('0981e41ebe9bd742b237e026475aa435', '1', '1', '2015-09-26 15:02:17', '2015-09-26 15:02:33', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('0ac55d471b60f2c7ed11cc5213655c85', '1', '1', '2015-08-28 11:50:20', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('0beb960374235703085f3f03c2ea48c4', '1', '1', '2015-10-27 16:27:44', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('0c0c74f33d0a7f0f8beab135dbd6b6d0', '2', '2', '2015-08-21 18:17:24', '2015-08-21 18:17:59', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('0c722f68f27a4bffbc53c932f1f4bc71', '2', '2', '2015-08-27 10:46:41', '2015-08-27 10:48:46', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('0c9bea508ff44d2110d64952044d9b31', '3', '3', '2015-08-18 12:06:07', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('0cd4f5a321bcb3c24f5d699584512d3f', '2', '2', '2015-08-11 16:18:10', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('0e6984372dbfe4cf39d3700e5da1768d', '1', '1', '2015-08-26 20:52:47', '2015-08-26 20:53:00', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('100e077a72ab788e934a815b2e1548ae', '1', '1', '2015-11-04 20:45:37', null, '1059', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('10761e0d63bd8d6d7e46e11c02828e1d', '1', '1', '2015-08-23 11:59:22', '2015-08-23 12:01:20', '1083', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('10c80dfe9616a6a55210dc46bf5438cd', '1', '1', '2015-10-23 15:33:52', '2015-10-23 15:34:13', '1059', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('10cc517d8fcd1a538ac608211af31511', '2', '2', '2015-08-10 16:23:54', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('1135720beca33ddc9a6ff39b52a1eb8f', '1', '1', '2015-08-21 10:11:17', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('124a08fc59a852203dfadbd872df826d', '1', '1', '2015-09-01 11:39:55', '2015-09-01 11:40:13', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('143f2d42eb53e44b446eb7d866305638', '1', '1', '2015-08-12 10:27:22', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('146283703ca4c8bc299be8c0658a6fee', '1', '1', '2015-09-26 15:07:50', '2015-09-26 15:08:12', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('149021635be646814e443ef74fd52451', '3200', '3200', '2015-07-30 09:49:12', null, '10300', '1', '1', '2', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('1503b5c9a6c5dc098626c2bf5dedbaac', '2', '2', '2015-08-11 15:04:26', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('15f1e603d9fa656d195efad6ae5e7687', '1', '1', '2015-11-02 14:31:51', '2015-11-02 14:32:08', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('161c9d850d203cec1d6bd812c32a9891', '1', '1', '2015-08-12 16:37:41', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('16443653775c95d3ff3b5bb4d2956d35', '3200', '3200', '2015-07-30 09:25:24', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('16705b0bcd62c64948788d270c4a9d21', '2', '2', '2015-08-04 18:20:16', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('1691849e1cb01adc88d5a20fcffd63bf', '1', '1', '2015-08-12 20:36:11', '2015-08-12 20:36:36', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('17ba16ef7d268f7c7abe6596f067f31e', '3200', '3200', '2015-07-30 09:22:39', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('17bf94c7c5f0d512187ed0ef4e2e4d10', '3200', '3200', '2015-07-30 11:03:43', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('194421687ceff32a20bcb1a5d292bb9b', '1', '1', '2015-08-12 20:11:31', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('1a20a845011112923084c14212416b6e', '1', '1', '2015-09-26 15:00:16', '2015-09-26 15:00:34', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('1bd6d50973b134d282644b94caf7f943', '1', '1', '2015-08-28 15:33:24', '2015-08-28 15:33:33', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('1c610e361b630e1459bb901314f4ef9c', '1', '1', '2015-08-28 12:27:36', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('1d35f3dc509740731a787c95eac3adda', '2', '2', '2015-08-04 18:21:53', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('1e222899e0698c2230e26503e9646d5d', '1', '1', '2015-08-26 14:04:59', '2015-08-26 14:05:36', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('1e856536bcd6f2a7b6ffa61ea36db837', '1', '1', '2015-08-11 18:20:01', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('1e88a62ca29853e6511e3b3d0f715d60', '1', '1', '2015-09-01 09:47:17', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('1f070a305ea121c1a4676051f8e98da8', '2', '2', '2015-08-27 12:15:19', '2015-08-27 12:16:12', '1083', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('201507240001', '200', '180', '2015-07-24 08:43:17', '2015-07-24 08:43:22', '10300', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('201507240002', '200', '180', '2015-07-24 09:37:53', null, '10300', '1', '1', '1', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('21530f4928d8948d92560794e8c7d614', '1', '1', '2015-08-26 10:35:24', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('21b216431a39f2a1fa729fdffe08bd69', '2', '2', '2015-08-10 14:09:42', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('2223d7e84a9ba546c9351df893507192', '1', '1', '2015-08-21 09:49:14', '2015-08-21 09:51:39', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('223263a259116fae82f167e400246a4b', '1', '1', '2015-08-11 16:46:47', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('2422ba7257a84dfdd007e538bbf58ae8', '1', '1', '2015-08-23 16:10:28', '2015-08-23 16:10:58', '1091', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('245fabf12d2af8e25ead4058b3f81c75', '1', '1', '2015-09-01 10:59:56', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('24f033da716252bed0a2d80fd8508df2', '1', '1', '2015-08-21 10:11:18', '2015-08-21 10:11:48', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('2570964fa76bd28b68a282a1a53a5c5f', '2', '2', '2015-08-04 18:26:06', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('25af20e09c5d4032c56170bfb0380a1b', '1', '1', '2015-10-23 15:31:50', null, '1059', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('25edac87aeb11a68a737ce04e01dc82a', '1', '1', '2015-08-22 18:20:01', '2015-08-22 18:20:45', '1091', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('25faee68c6d0288f408774af69372663', '1', '1', '2015-10-27 14:54:01', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('266ec9c5f20311ab77785cf79fe4944b', '3200', '3200', '2015-07-30 10:49:17', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('28c600e68098cb38ffe064c1548041e2', '1', '1', '2015-08-08 17:39:34', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('29b04f8cb8fa08d2e7271dcf8ada5676', '2', '2', '2015-08-10 15:24:57', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('2a2b267ba16829e0b3c038c12128cdd9', '1', '1', '2015-08-23 10:28:17', null, '1091', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('2a59adddd553499c54bb91060d7ffd7c', '2', '2', '2015-08-17 17:09:41', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('2aff17f0300115f0570d4164df83f80a', '1', '1', '2015-10-29 21:05:44', null, '1085', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('2bc852114412e47313c28592e8479bd2', '1', '1', '2015-08-19 11:26:57', null, '1090', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('2f49db2e6384c5ac39d30b8a148e4ad7', '1', '1', '2015-09-01 10:42:23', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('2f527747b4a72721e23ef4fa00b91d0f', '1', '1', '2015-08-23 14:59:46', null, '1091', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('2f99cba837cd70662b46eccecaf56ce5', '1', '1', '2015-08-08 18:06:58', '2015-08-11 11:45:37', '123456', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('2fb67fc10ff2cb5e432965af5f30a0e6', '1', '1', '2015-10-29 22:11:50', null, '1085', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('2fe0eb7b89d4a5d97c563c278e3faf34', '1', '1', '2015-09-01 13:07:00', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('30ec4e24c17f1d0e592654b9b9ad3073', '1', '1', '2015-08-19 14:43:34', null, '1090', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('312d75dcbf82444d56cace7f5b4872f9', '1', '1', '2015-10-27 15:34:29', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('3152842db4302dfcf1d0e6ea2b470ba2', '1', '1', '2015-09-11 15:57:24', null, '1083', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('31839459b2b96b1d49a8a2eb3072671b', '1', '1', '2015-08-28 15:29:51', '2015-08-28 15:30:07', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('31e2ffbaf2d16b333c565c9d2eb198eb', '1', '1', '2015-08-11 17:32:41', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('31e444aea17745d785de372c67be41e0', '2', '2', '2015-08-10 12:03:04', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('320edfae49135425ad967981e3fd6b8e', '1', '1', '2015-08-11 14:58:19', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('33069ffe745142fe88124ef0d54546e3', '3200', '3200', '2015-07-30 10:41:46', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('3399782d5f4c5726691b8f173b60d6e4', '1', '1', '2015-08-27 17:11:41', '2015-08-27 17:12:01', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('3528ed9022f8a98fd22c3cddfedbda20', '1', '1', '2015-08-25 19:41:13', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('35302eb89d82a7ecc4f7e714aa3cfd09', '1', '1', '2015-10-27 17:14:18', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('359eaec98690c1df0e76e446d944c4fd', '1', '1', '2015-10-29 22:11:41', null, '1085', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('35b7f21e906178d11417761279e37654', '1', '1', '2015-09-26 14:58:30', '2015-09-26 14:58:53', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('3638cfe1d804623fc72351d5f7cd1e98', '1', '1', '2015-08-28 12:33:07', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('3692896e56adcb9ab002a716f400926b', '1', '1', '2015-08-28 12:06:37', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('37051cdcc2e6e6bd08454cf9aca35909', '6', '6', '2015-11-05 15:45:09', '2015-11-05 15:45:34', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('37dc2480444e6c39f853331d8e4a6e2d', '1', '1', '2015-10-28 12:33:49', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('387a1da38992508e0a1d66c9142734d1', '1', '1', '2015-08-28 12:12:28', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('38bd64efd5037c461b317b95cd297d82', '1', '1', '2015-08-26 10:36:48', '2015-08-26 10:37:22', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('3a604dc749432294b740a99d25a9b715', '2', '2', '2015-08-10 16:26:37', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('3a8711791109e6a95a86bbf4cfc5054f', '1', '1', '2015-11-04 10:35:21', null, '1059', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('3c0b332f8b2bf60a5aeececdf74448a3', '1', '1', '2015-08-11 16:50:56', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('3ca3c02ce36ff1386340276dbae5d7aa', '3', '3', '2015-08-23 10:42:07', '2015-08-23 10:42:32', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('3caa07630880b65fca635f9ae73a5039', '1', '1', '2015-08-27 22:13:49', '2015-08-27 22:14:45', '1083', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('3e774811e4eaa7fb304a077e68697dbc', '2', '2', '2015-08-10 15:56:50', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('3f55dd11b1bf044c9d38337e116bc937', '1', '1', '2015-09-26 15:03:24', '2015-09-26 15:03:52', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('3ff6240ab2a612f39194f7cea57ef13b', '1', '1', '2015-09-01 09:47:05', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('4085e59cbd1732e78b63910c42906ca4', '1', '1', '2015-08-12 17:19:44', '2015-08-13 17:08:35', '123456', '1', null, '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('40b53c55e6656d052310156a1208058c', '1', '1', '2015-10-28 11:11:17', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('40cfc57cb02ef8e188b3676b951ee4e7', '1', '1', '2015-08-25 20:07:20', '2015-08-25 20:07:50', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('419ebf51d6d4ea16a1b86b57a907c400', '3200', '3200', '2015-07-30 11:05:36', null, '10300', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('41c1a35503183a278206f5c3910cfcbd', '1', '1', '2015-09-26 14:54:08', '2015-09-26 14:54:26', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('42b25fc13b8c478e9b31afdabf4967e2', '3200', '3200', '2015-07-30 09:36:04', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('42c149dfa3ec6e1f39812b5c3e96b4d2', '1', '1', '2015-09-26 14:52:49', '2015-09-26 14:53:23', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('443615bc7c9dc2d7a40543467bd58dcb', '2', '2', '2015-08-04 17:04:47', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('44e1a2f5b9efce73e92e2d102759c12f', '1', '1', '2015-08-14 11:49:08', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('453b68b6473a4208af3cd5a969539b63', '1', '1', '2015-08-23 15:00:01', null, '1091', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('45ed2acc327df821951c16942ae32714', '3200', '3200', '2015-07-30 11:09:32', null, '10300', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('4621484f3f76b380f5fc0df1db336deb', '1', '1', '2015-11-12 18:00:51', '2015-11-12 18:01:47', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('464a104fd141cf818b23f1538168362f', '1', '1', '2015-08-19 13:46:48', null, '1090', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('468840556dfb0cba8e7f32ded83b49dc', '1', '1', '2015-10-27 16:27:41', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('485875cb6031363352da2031485aacb1', '1', '1', '2015-09-11 16:31:55', null, '1083', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('48962f4cb18f9107ee1070f5fabb2869', '1', '1', '2015-10-27 16:47:30', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('49af1facf41b6fcf318fd296b5c6ca10', '1', '1', '2015-08-26 19:56:08', '2015-08-26 19:56:53', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('49c2063aad668781835934110625c429', '1', '1', '2015-08-18 20:57:59', null, '1080', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('4acd2f73a9992dc87d1037745e1919d6', '1', '1', '2015-08-18 20:42:54', null, '1080', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('4bf740c5698b05ac40c0d5ab497ade94', '1', '1', '2015-08-23 15:00:07', null, '1091', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('4c856c2d01c8fe5b58a07e5f7747d701', '1', '1', '2015-08-26 20:45:05', '2015-08-26 20:45:16', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('4ca20149a1ed2c430fb28525281a1ef9', '1', '1', '2015-09-01 10:42:18', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('4cd8a37f88384764c7607fa5274405a1', '1', '1', '2015-09-26 15:07:24', '2015-09-26 15:07:39', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('4d2ab6a98c37850f786d18b69b7b5c21', '1', '1', '2015-08-28 13:56:47', '2015-08-28 13:57:01', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('4de9df9a03e73a246dd791f6355e21a5', '1', '1', '2015-08-18 09:51:55', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('4e4f56e28f987cf05b31d2640fc4fe08', '1', '1', '2015-08-10 18:03:23', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('4e5a50050613375c4a579ffb214e09c5', '1', '1', '2015-10-28 11:26:55', null, '1085', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('4eb42f288bf9f02552f7633a4e31737e', '1', '1', '2015-09-11 16:31:57', '2015-09-11 16:34:56', '1083', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('4f0cb0227d8aca044f76878cb4affd4e', '1', '1', '2015-08-28 15:33:40', '2015-08-28 15:33:53', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('4f9eb02ff28692bd73649ace6756ff0a', '1', '1', '2015-08-08 17:40:45', null, '123456', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('51590c536ac3ea2d0385796853793c05', '2', '2', '2015-08-05 17:03:06', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('52b582bbdcceb4b1414e451603f999e2', '2', '2', '2015-08-10 12:05:46', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('537fb95d4d141067297658059b7b49e7', '1', '1', '2015-08-22 18:23:17', '2015-08-22 18:23:40', '1091', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5399c6d4abfe7e455fd15aa3d12e983f', '2', '2', '2015-08-04 17:39:38', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('53ae3026b11aeead0c99a5de0a6af9e9', '1', '1', '2015-08-19 14:40:26', '2015-08-19 14:40:47', '1090', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5409e103925227160e809b88523ed4a5', '1', '1', '2015-10-28 09:47:11', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('545b053d7880e7e7e3fc041352bc89df', '2', '2', '2015-08-17 17:29:41', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('5493532843dc0ef9cbb683a3bcb9c331', '1', '1', '2015-08-21 11:17:46', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('55ba6672a76f2e1c12920d40a2a933aa', '1', '1', '2015-10-28 11:29:15', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('55bbc050110de7e47512fe8dab45cf0e', '1', '1', '2015-09-01 09:46:12', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('563131584f0e2f6742c55714dff8023a', '1', '1', '2015-10-30 12:33:18', '2015-10-30 12:33:43', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('56e6ac13f8abbb35816d6c66cf36ee55', '1', '1', '2015-08-11 15:41:47', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('577654334c23bcc761c625b14f450599', '1', '1', '2015-10-27 16:47:36', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('579f14c28a609f55b3a77cf0e93e1674', '1', '1', '2015-10-27 14:51:36', '2015-10-27 14:52:01', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5829e5517fcf3c6e3012b3c308fd9658', '1', '1', '2015-11-04 20:39:16', '2015-11-04 20:40:53', '1059', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('59a47c7bea7aa3d040e0d56239355db0', '1', '1', '2015-09-26 12:24:23', '2015-09-26 12:24:51', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5a2b56cc52ac7b3f703efd9e0288c4f3', '1', '1', '2015-11-05 14:48:45', '2015-11-05 14:49:17', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5b74dc30f77bc3cf51f98beb4502e1c2', '1', '1', '2015-08-14 14:29:39', '2015-08-14 14:30:16', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5c791aa7d8fc541ecc0575c2dd51db48', '2', '2', '2015-08-04 18:22:45', null, '123456', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5c92ef5af0e8138de7a23f66019d7a0f', '2', '2', '2015-08-04 20:07:35', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('5d1758166a8a7e770bb69804681e84e0', '1', '1', '2015-10-27 16:46:12', '2015-10-27 16:46:32', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5d823aefa06b51cdfa4f14d7a46f9358', '1', '1', '2015-08-11 16:51:05', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('5da2bc2d274ccc61e94a6c6f58d5b9b2', '2', '2', '2015-08-12 10:26:59', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('5dd7025a630f8cfe7f258ca6aa21b1ac', '2', '2', '2015-08-27 11:50:14', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('5e8bbdbbd0764d809f4c06f3477d9526', '1', '1', '2015-10-27 16:31:09', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('5ec3aeb19b8a650b0bae00538dc5766f', '1', '1', '2015-09-01 11:01:05', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('5ef38ea0c8fc725ffe6c8e631452c6b2', '1', '1', '2015-08-23 15:00:36', null, '1091', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('5f8f14351d062ef912504ff35f21e85b', '1', '1', '2015-10-29 21:47:47', '2015-10-29 21:48:05', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('5fb5c95df33361ca31e711686b9eadb3', '1', '1', '2015-08-26 16:17:37', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('5fc5a686ddccdc2a66651f8f4fbb50f1', '1', '1', '2015-10-28 12:33:19', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('6056628f5acafa4aea25338b4a4a4cbd', '1', '1', '2015-08-23 14:53:02', '2015-08-23 14:53:22', '1091', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('60ffe806f3c5ff27f0309522344a7dc0', '1', '1', '2015-08-19 13:47:04', null, '1090', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('61a145b10f63a176c2a211b150a84633', '1', '1', '2015-08-22 13:41:06', '2015-08-22 13:42:11', '1080', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('623a5d9966174fe71c69a373ccb38f1e', '1', '1', '2015-10-27 18:19:12', '2015-10-27 18:19:57', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('62f77af3ba7b5ee9caf246feb2517255', '2', '2', '2015-08-04 20:40:55', null, '123456', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('630bafd9d40c606a921cda650a4eb6c6', '1', '1', '2015-08-23 16:17:35', '2015-08-23 16:18:12', '1091', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('63c88db6116165e22f53e41e60cbed6b', '1', '1', '2015-08-28 14:51:45', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('63ef25ec3b831c3246c927e60dc09742', '2', '2', '2015-08-06 11:40:49', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('64209aed9fa3dacd86786dfda4baa82c', '1', '1', '2015-08-10 14:59:13', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('64668ff7830ee21ae29f80861da74bfe', '1', '1', '2015-08-27 14:47:12', '2015-08-27 14:47:28', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('65758d2da9ea3bcc9a080333bc709189', '1', '1', '2015-08-08 17:38:29', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('662503d23af648a97651237003869475', '2', '2', '2015-08-04 20:23:23', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('669eec323b80ef8660e9e88f0289ab6b', '1', '1', '2015-08-11 16:46:59', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('676d05fc4716331cec5a1929fbb40f27', '1', '1', '2015-08-21 11:20:35', '2015-08-21 11:31:21', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('68ead47e587d96217a7850edfd53db64', '1', '1', '2015-10-29 21:54:57', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('6a0437fcc564ec469e2b7dad139c9ea3', '1', '1', '2015-08-21 11:22:55', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('6a45cd7b71bcd08611d46efdf44bdfb3', '2', '2', '2015-08-10 15:24:42', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('6aab754eda47bd080cb5429c0668cf67', '1', '1', '2015-08-28 12:22:43', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('6ab42a083d28238cc9dcac35710e0dac', '1', '1', '2015-08-12 17:58:35', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('6b60548c286cc408d7de9e92bad46433', '1', '1', '2015-08-25 21:12:24', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('6cc3d6040d282b0c89a4c800870caa72', '1', '1', '2015-10-27 14:52:50', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('6d908d9e445f15cc3649499972c2f6f3', '1', '1', '2015-08-12 17:00:00', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('6dc361ab916a131eaf2f748cac23d272', '1', '1', '2015-08-19 15:15:15', null, '1090', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('6e6574b131caedf02764f271e8cc81dd', '1', '1', '2015-10-23 15:32:56', '2015-10-23 15:33:44', '1059', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('6e7c3df6bb4b24be32b634118c31014a', '1', '1', '2015-08-28 15:44:45', '2015-08-28 15:44:56', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('6e9039c139cb08906d56b67a7c09e8f7', '1', '1', '2015-08-11 17:08:19', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('6ef39cabeefe70c0193a5a7bb8577686', '1', '1', '2015-08-21 15:55:13', '2015-08-21 15:56:11', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('6f2f6bb64b25dc077b23b74ccc8ff31e', '1', '1', '2015-08-08 18:11:47', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('70268785926cc3ea286dec0e4846459f', '2', '2', '2015-08-14 18:12:20', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7096c7ca2837ca94b539dfafe141b20b', '1', '1', '2015-08-28 12:10:33', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('709dbd6336f0a13da658e7e2c2e25539', '3200', '3200', '2015-07-30 10:40:44', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7181d0788d3b258e8b34fe838bf1c5bc', '1', '1', '2015-10-27 16:45:01', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('718eb930f67a7be52096b7e60cf9fdf4', '1', '1', '2015-08-26 21:02:12', '2015-08-26 21:02:35', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('72c88d5d0ead0ba9f493bc378ae18b99', '2', '2', '2015-08-10 15:59:33', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('744d90d2b4c75c66eceffccbbeb51171', '2', '2', '2015-10-30 17:04:29', '2015-10-30 17:05:03', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('7588ada9895953671b2c207347ec6585', '1', '1', '2015-10-27 16:30:10', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('75c0589a03ee545d1a4cba3c92cdc94e', '1', '1', '2015-08-19 14:39:22', null, '1090', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('75ddb43d974e7f5ddb03f6528a1faeca', '1', '1', '2015-09-26 14:55:48', '2015-09-26 14:56:10', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('7619a2af6085acd1d918ffac841c859d', '2', '2', '2015-10-30 12:11:00', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('768d22c7010a598196b561f9ea156c23', '1', '1', '2015-10-28 11:07:59', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('76c6ffa831a93c9c6c4cde093a9bd22e', '1', '1', '2015-09-26 15:02:45', '2015-09-26 15:03:07', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('771080fb5b3a4eed81bad8955e353911', '2', '2', '2015-08-21 14:42:24', '2015-08-21 14:45:44', '1083', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('7710a31682656828931609decaafc120', '1', '1', '2015-09-01 13:51:42', '2015-09-01 13:51:54', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('7821d664f961887184abd79bd94cd58c', '1', '1', '2015-08-28 12:06:44', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('782cf6e50de775988677c3bf34959716', '1', '1', '2015-10-27 15:34:22', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('7851b2b8e2d586dbb8a58a1783db445d', '1', '1', '2015-10-28 11:19:59', null, '1085', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('78600eb77adc287276def21cda199d23', '1', '1', '2015-08-26 17:48:01', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('78636f2ba34ff8920de86dcbd5bfa3bb', '1', '1', '2015-09-26 15:06:24', '2015-09-26 15:06:40', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('792e32ba59209df01c29077f97d8b961', '1', '1', '2015-09-26 14:51:35', '2015-09-26 14:52:07', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('794c2086490c8726642d71d4d5ba13e1', '1', '1', '2015-08-14 14:27:41', '2015-08-14 14:28:03', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('797c1f11553b528b61149cfa2f1af074', '1', '1', '2015-09-26 14:54:36', '2015-09-26 14:54:56', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('799089062478e3caa1252157b21e3c17', '1', '1', '2015-08-12 17:59:58', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('79c845bddd128ddaf83fa1f679477b39', '1', '1', '2015-10-23 15:34:24', '2015-10-23 15:34:42', '1059', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('79e76737f739ae0f0dcf116c50085247', '1', '1', '2015-09-26 14:53:35', '2015-09-26 14:53:54', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('7a2f700667e03627d1c6c4116c247277', '1', '1', '2015-08-10 14:57:58', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7a3f88f135af0649e02846759eed9ea2', '2', '2', '2015-08-04 17:37:02', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7add4efe0a40ecdc5f373e938095bbb3', '2', '2', '2015-08-04 20:24:12', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7af8d2192bd3c4385226b34dfabebc2a', '1', '1', '2015-08-26 20:52:10', '2015-08-26 20:52:28', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('7bf6060265d394bb737af512fd7fb6d0', '1', '1', '2015-10-27 17:12:37', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7c54007d856e4028f09407d318f80e5f', '1', '1', '2015-10-27 16:27:32', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7ceb31f61de212ab4d7b9470660b7ac5', '1', '1', '2015-08-26 17:48:14', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7e37a65c24751502b7f4d75bae74880a', '2', '2', '2015-08-10 11:56:05', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7eeafe675ab9952c28eaafda11fccfd6', '2', '2', '2015-08-06 10:48:46', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7fb250a944ca9ab2d863a30598ddc3ce', '1', '1', '2015-10-29 11:23:23', '2015-10-29 11:23:38', '1059', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('7fca51e994dfc2544c485d7601805c0c', '3100', '3100', '2015-07-31 11:18:59', null, '2', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('7fe4775bc79cb66863674a60e96d8c11', '1', '1', '2015-08-21 11:20:29', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('803fa60a60b5090c764ddb747d9c0897', '1', '1', '2015-11-03 20:36:19', null, '1059', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('805419dccc2c95b39bf08e4db13b98d1', '1', '1', '2015-08-08 17:27:37', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('805d928fe1cf7373e6f2327ea5080184', '1', '1', '2015-08-23 14:59:58', null, '1091', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('811e51e8f41090c47314a07c6fb022e3', '1', '1', '2015-10-27 16:30:30', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('8185963e3539eb3b8f611376540495a3', '1', '1', '2015-10-27 16:47:28', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('828a4031c2fd9ea6ab0529624c91603f', '3200', '3200', '2015-07-30 09:20:54', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('836c1b00405429e61b458f13950be9fc', '2', '2', '2015-08-04 21:11:26', null, '123456', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('84410d1be51515b734cfa75241424e1d', '1', '1', '2015-10-27 17:02:39', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('854a70874bf6837f868c4fb2560780fd', '1', '1', '2015-10-28 10:17:06', '2015-10-28 10:17:23', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('87459430a99f583c102dc9db86a10070', '1', '1', '2015-08-08 17:46:15', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('876dc9705c3ff81c6c857e83bbb636d4', '1', '1', '2015-08-11 14:59:43', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('88bbd2efdd3f2a2226b9e12a427a8ff2', '1', '1', '2015-08-17 17:35:14', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('89689b203eb36e1866f5318adeadb013', '1', '1', '2015-10-27 16:46:56', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('89fd98b9a32ebaeeb31fcf586cdda443', '4100', '4100', '2015-07-30 17:47:19', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('8a76f1cc6afa6d54abe4e1877342b9ea', '1', '1', '2015-09-26 15:06:53', '2015-09-26 15:07:11', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('8b6f272d80c949d248a5ee994076855b', '3200', '3200', '2015-07-30 10:59:16', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('8c65c1cbf5140fdde3d0669b4a24e696', '1', '1', '2015-08-11 16:40:14', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('8d38a878d5973113162668b7d8a728ae', '2', '2', '2015-11-04 10:46:33', null, '1059', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('8e066496da896cdc37fc2ae3dc4d7f08', '1', '1', '2015-08-17 19:15:19', '2015-08-17 19:16:51', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('8e6e6120a2beabde0ed761f17d44c207', '1', '1', '2015-08-31 15:00:17', null, '1083', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('90144d393efe538ce4b42a7173aab7ce', '1', '1', '2015-08-21 12:03:08', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('90e5800ddc31e2b355d16c5694229c64', '1', '1', '2015-08-28 12:35:58', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('90fd2db8566c85b97917953d1d49c56e', '3200', '3200', '2015-07-30 10:25:57', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('912290499e6fe251ce70f127a179fdac', '1', '1', '2015-08-08 18:17:09', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('91a75918d08060d9ccaffd8e3fda5e2a', '1', '1', '2015-08-11 16:51:09', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('91b1b186439f498c8ce78983c3781702', '2', '2', '2015-08-04 20:39:31', null, '123456', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('93a9a3d82cbc1872a4169cf4aa16df21', '2', '2', '2015-08-04 21:09:32', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('9435113564852b94709a3c9b6b6be655', '3200', '3200', '2015-07-30 10:36:54', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('947a710d0677cff0f03cdceeb71494dc', '1', '1', '2015-08-21 10:08:53', '2015-08-21 10:45:42', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('94ff5c022f4d2e3e021d703d2ca41ceb', '1', '1', '2015-08-18 20:41:40', null, '1080', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('963631529ee592fa54150fea1ddf673e', '1', '1', '2015-08-08 17:51:44', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('970a365b51ed9dab54cd58fce2eb54bc', '1', '1', '2015-08-08 17:33:52', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('975637b1ab350f251e2469dbe2fb4d09', '1', '1', '2015-10-27 16:30:22', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('9792382e4def66a451d7974c73be5208', '1', '1', '2015-09-11 15:55:50', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('97e466419c5978e4a2ac00e5fe066d99', '1', '1', '2015-08-28 13:42:49', '2015-08-28 13:43:02', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('982b988762eb0866f26c6e95d685b5f7', '2', '2', '2015-08-14 17:00:11', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('985316128ad5c84eb01316127007e505', '1', '1', '2015-08-26 14:58:28', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('9af3ac6ac029b85b56036c84fa70dbdc', '1', '1', '2015-08-10 18:03:30', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('9b6a895470f0ca98a2fb2c0953883ebf', '1', '1', '2015-09-26 15:05:39', '2015-09-26 15:06:05', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('9de81088ca83078a0726239c7e3f618b', '1', '1', '2015-08-19 14:45:59', '2015-08-19 14:46:32', '1090', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('9eb0bfc215a7cdddcfac55ae960c8f5b', '1', '1', '2015-08-08 17:48:14', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('9f912a7855623434883d5d97aac32c9b', '3', '3', '2015-11-12 17:50:37', '2015-11-12 17:51:00', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('9f9bc1190e2669c3cea9d37fa10883a2', '1', '1', '2015-10-27 16:28:18', '2015-10-27 16:28:53', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('a03e2867c7e37411db8df1c078e2a8e8', '1', '1', '2015-08-28 12:26:23', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a1b3e7897df992e9a4a9909305540209', '1', '1', '2015-10-27 16:47:30', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a226820c031aa9fdc22218535357bb8b', '1', '1', '2015-09-01 10:42:25', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('a4760a58b82d8e71841f1444dfcbd464', '1', '1', '2015-08-27 11:50:46', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a4767ec826942dc5fafa5e436eb22720', '1', '1', '2015-08-28 12:08:22', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a5a481d74b451553e150bf6efd8cbdd6', '1', '1', '2015-11-04 10:51:42', null, '1059', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a67fb512e30f38c64f3fb832532a875c', '1', '1', '2015-09-28 20:09:04', null, '1080', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a7248e007c3a598a0c6e13b0b0107fd6', '1', '1', '2015-08-26 18:01:27', '2015-08-26 18:01:53', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('a73df0afdd32526c7b22cbdb3788c712', '3200', '3200', '2015-07-30 14:16:22', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a789001c5ae37d6c94306cac35fab03d', '1', '1', '2015-08-12 16:28:21', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a7efb8e6ddf3fb538018d0d4fca1e68d', '2', '2', '2015-08-10 15:53:06', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a837094867153a7550a4252c441de574', '1', '1', '2015-08-12 14:04:25', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('a84f581c441415c0ab38abf215e4a457', '1', '1', '2015-10-27 15:36:20', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('a88d6430d1dd6edd05a4103392691da6', '1', '1', '2015-09-01 11:40:35', '2015-09-01 11:40:50', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('a9729e110ad2940564e224afc6534a65', '1', '1', '2015-11-04 20:46:04', '2015-11-04 20:47:32', '1059', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('a9c253dd04df0af5d18c8d42ae4d9110', '1', '1', '2015-08-28 13:45:11', '2015-08-28 13:45:26', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('a9ca0bb7913c703a5ce4d7472bade184', '1', '1', '2015-11-02 14:50:49', '2015-11-02 14:51:01', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('aa05f2e08ff0f000af4d317be8e818f8', '2', '2', '2015-08-11 16:59:04', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('ab10a0c260eb3f50aa0a5a70435069a8', '2', '2', '2015-10-29 20:57:59', null, '1085', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('ab54d8eeed988b7f30d4e9cd33419301', '1', '1', '2015-10-27 16:31:00', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('abae6f83a87f274aae6abf9494d2282b', '2', '2', '2015-08-06 09:45:12', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('abbf756589e75d57d6897667bfdaf60f', '3', '3', '2015-09-11 15:17:22', '2015-09-11 15:18:11', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('ac9a1ff8d9dafbc039881da79356a01d', '2', '2', '2015-08-11 17:38:39', null, '10300', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('ad3238cafd932be8677479fc48053c36', '1', '1', '2015-10-27 16:30:55', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('adc98cda9dca1af1c18b6b6fa79b23fc', '2', '2', '2015-08-04 18:00:26', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('ae2a6301cc1fb71a13c5edc5ebb4b150', '2', '2', '2015-08-10 16:29:07', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('af0900c55e8bc0b3e70cb736b404bf4d', '1', '1', '2015-08-26 17:48:06', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('af937b30661698ace94ec101222cf7f2', '1', '1', '2015-08-28 15:43:51', '2015-08-28 15:44:05', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b03c2efb532666b02aa99281a67f0065', '2', '2', '2015-08-10 15:46:11', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b1a9427b413e5a71d5d361f8cbd4314e', '1', '1', '2015-08-12 18:08:40', '2015-08-12 18:09:04', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b1e05aaa9b8c290c814beadef5554110', '2', '2', '2015-08-07 17:53:32', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b22245651ab2144f3a95db3a5766f894', '1', '1', '2015-09-26 14:56:26', '2015-09-26 14:56:50', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b25c86624e8ede9ddce9545bece6582d', '1', '1', '2015-08-08 17:49:40', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b318d56a3d2d38486f0bd675b70076d3', '1', '1', '2015-08-21 10:35:26', '2015-08-21 10:36:25', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b3c0383de3b7747ca192cf9f307a61c2', '1', '1', '2015-10-23 15:34:52', '2015-10-23 15:35:03', '1059', '1', '2', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b444a40e3c138b6431d8ee4f4082caae', '1', '1', '2015-10-23 12:03:35', '2015-10-23 12:04:12', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b56f0c3767188ac468b3214177a2fc44', '1', '1', '2015-10-29 20:48:01', null, '1085', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('b64c04038a211ab88c377aebb84d70a0', '1', '1', '2015-08-11 14:59:33', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b6a07b3ad391cca8e8df4a6394f682ef', '2', '2', '2015-08-04 18:01:24', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b6b8cdef90ea787b8dc54265dd70c05f', '2', '2', '2015-08-04 17:34:55', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b6dd15722fef43e6f5cd98b7a7ba5274', '1', '1', '2015-09-26 14:57:50', '2015-09-26 14:58:16', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b75888d22a1a034322b9e56dc3a351cf', '1', '1', '2015-08-19 14:03:04', '2015-08-19 14:03:27', '1090', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b7995018abe35e36f7bc816e98a1adb3', '1', '1', '2015-08-23 15:42:20', '2015-08-23 15:42:42', '1091', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b7fce6d7f9a6391e8357438e9368ad3f', '1', '1', '2015-08-18 20:43:59', null, '1080', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b862f4ebfabfdf89706b1a99d983c59e', '1', '1', '2015-08-28 12:36:43', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b8d53e1e32ccbbac88e6271c9839d055', '2', '2', '2015-11-12 18:04:13', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('b95d9dcd706df30f7d6b8f27642bc50a', '3', '3', '2015-08-23 10:03:36', '2015-08-23 10:04:32', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('b99d2acd16922ae8676632666bc6c12e', '1', '1', '2015-08-26 16:12:19', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('b9ef0661de17a77edc511cf04c52dd42', '2', '2', '2015-11-04 10:44:36', null, '1059', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('ba9765580bcbb107d655cb46fdc8169b', '1', '1', '2015-08-28 15:44:12', '2015-08-28 15:44:22', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('bc3ba2135045d9f791b30c6b37dee1df', '2', '2', '2015-08-04 17:41:08', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('bc3bbea0215ee093d957fb603cc16620', '1', '1', '2015-08-18 20:46:18', '2015-08-18 20:46:54', '1080', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('bce33422e68004f7fde8bb2d8204c0cd', '1', '1', '2015-08-17 17:37:17', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('bd35166494f77c1c88d9687232d02a65', '1', '1', '2015-08-18 10:00:10', '2015-08-18 10:00:28', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('bd3a4913ad194ce629e7017bf29a44ef', '1', '1', '2015-08-11 17:59:30', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('bd55220582d3d954695f578281df3fa3', '1', '1', '2015-08-23 14:51:32', '2015-08-23 14:52:38', '1091', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('bdf0ffd271dfa34db380d1de3ea4e055', '1', '1', '2015-09-29 17:28:03', null, '1080', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('bdfe783dcd5b912bcf85f28752ce99f6', '1', '1', '2015-11-02 13:54:01', '2015-11-02 13:54:23', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('befc5bfbed9f0e1ec422072c8e2ed3d9', '1', '1', '2015-09-26 15:01:44', '2015-09-26 15:02:06', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('bf3cac1e3f9847f9a0b6e0a275b9cfe6', '1', '1', '2015-08-12 17:04:30', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('bf6ef1f0c952fa65026ae90930e54f5b', '2', '2', '2015-08-10 15:25:39', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('bfdbee308f70d2db52296e173bb1e7f8', '2', '2', '2015-08-04 17:43:28', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('c0362d2934b99de64de86dd75b3a6d7b', '1', '1', '2015-10-29 21:03:36', null, '1085', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('c14f63a9f53ab427630fc8b6337799f6', '1', '1', '2015-10-30 17:06:25', '2015-10-30 17:06:52', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('c2a853c8aaa8108e2f313d122a47c733', '1', '1', '2015-08-26 20:56:08', '2015-08-26 20:56:45', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('c2f083b70fb008aea830eca57cc64721', '1', '1', '2015-08-27 10:38:11', '2015-08-27 10:38:50', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('c322fd8d4f8d053793f0746216571501', '1', '1', '2015-10-28 11:22:35', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('c49c399dcc0d15f55bf44fe43829e3a5', '1', '1', '2015-08-28 13:49:05', '2015-08-28 13:49:19', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('c5ae8263798932eafc237f7fac46f42d', '1', '1', '2015-10-28 11:11:06', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('c5f7c31a8f3b3086172cb27bd46a14f7', '1', '1', '2015-09-26 15:09:21', '2015-09-26 15:09:42', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('c6dff7129cae9daeea2ba02e94f26aa5', '2', '2', '2015-08-10 15:20:33', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('c6eef06714ffcc6f51a1d848b7cd1880', '1', '1', '2015-10-27 14:54:11', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('c6fb84d27934007f9d3aadb47ade81b6', '2', '2', '2015-08-21 16:34:08', '2015-08-21 16:34:52', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('c7188629657b4b7f51afff11c27026b1', '2', '2', '2015-08-10 16:21:40', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('c78f73a4bf1c3fba9e8f68bb5813019e', '1', '1', '2015-08-26 10:34:13', '2015-08-26 10:34:37', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('c9963dfe3bee3077bda9aaea55416397', '1', '1', '2015-09-29 13:58:57', null, '1080', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('c9d434ad99aee6ff04ba4808afd02795', '1', '1', '2015-10-27 15:36:27', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('ca2696ab504c88d9d298227d7eb8de7b', '1', '1', '2015-08-26 20:24:55', '2015-08-26 20:25:23', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('ca5197b429d7454cb861fd667c7584a1', '1', '1', '2015-10-28 11:23:29', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('cc8efc78ac338d99a371cb0ada056993', '1', '1', '2015-11-12 18:02:23', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('ccd09fb91eac2b850e17368901976ff2', '1', '1', '2015-09-01 10:42:39', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('cd574ec2093e5f15cc79f5e81b2da71b', '1', '1', '2015-08-11 15:40:34', null, '10300', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('cf43b321d6522374c4c963b4531bcee6', '2', '2', '2015-08-10 16:17:36', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('cfd3a9c9d2ba05ea7061812fe341edeb', '1', '1', '2015-10-27 14:53:40', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('d037957a713f4bba0f9f70a30837c6ca', '1', '1', '2015-09-01 09:46:14', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('d10fd6a9a297c048e9232872f83602eb', '1', '1', '2015-08-11 16:47:09', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d1dde773e9d59d25df8fad07630a8c97', '1', '1', '2015-09-26 14:52:18', '2015-09-26 14:52:37', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('d27f379b999ef4d3b37cd13af86e2817', '2', '2', '2015-08-10 16:20:56', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d2d606b31c6f58f2ee1b9b781adf2555', '1', '1', '2015-08-26 10:30:03', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d414ea1a1c361e2ed0dd217d58552bcb', '2', '2', '2015-08-04 20:38:32', null, '123456', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('d4cbc926594713d8c48bf44cd0d4b51d', '2', '2', '2015-08-04 20:25:15', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d504f5f257093ee698ceb5854d79566f', '2', '2', '2015-08-04 17:31:05', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d5236df4facb98a1f536fd7f0737202a', '1', '1', '2015-08-26 20:39:49', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d6039317127348e52d41eafcfeed1db2', '1', '1', '2015-10-28 11:21:13', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d6a7fe34bebd4f1dfbfff60121e2f06f', '2', '2', '2015-08-21 14:41:58', null, '1083', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d74f27a8a3f58876ecc7138af36d0187', '1', '1', '2015-08-21 11:25:31', '2015-08-21 11:27:10', '1085', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('d7cacac604d72353f34811760bebae1c', '2', '2', '2015-08-04 20:10:40', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d8444a2550574eb4b5fdae41c9c79043', '1', '1', '2015-09-26 15:00:55', '2015-09-26 15:01:25', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('d87025dc5ce09a0c3dc87aa8d3305c3a', '2', '2', '2015-08-04 18:25:23', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d8a58774136b2e649c261d44236e8e2c', '1', '1', '2015-08-22 18:19:20', null, '1091', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('d8a6e19f874d51313e47c9d6ada6273f', '2', '2', '2015-08-04 17:58:00', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('db0f8aef33bd3602eca38184d1028c58', '3200', '3200', '2015-07-30 10:15:32', null, '10300', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('db204147a67fcad56a4d471f19dde870', '2', '2', '2015-08-21 17:03:23', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('dbbc6953dca85b7889021a7df8b62332', '3200', '3200', '2015-07-30 11:06:45', null, '10300', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('dbc7441c712c82c6b58c91e7b858cf36', '1', '1', '2015-09-03 11:34:10', '2015-09-03 11:35:40', '1080', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('dbe6ff2fdc4078bd98dadbf747e19373', '1', '1', '2015-10-28 12:33:39', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('dc5917846fcc5d876ad7ffb94dd46aa9', '1', '1', '2015-08-12 16:57:08', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('dc78e418fb42bfcf656af60f823cf26d', '1', '1', '2015-08-21 11:53:47', '2015-08-21 11:55:27', '1083', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('dd24ff6da6e83e5b8e74b7abfd11a4a4', '1', '1', '2015-08-21 09:29:36', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('dd4fb41d36b5d81c439e7fd8b4b6207d', '1', '1', '2015-08-23 15:00:30', null, '1091', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('de3d4984d810d75cd2fadc3c563e142f', '1', '1', '2015-08-28 13:44:31', '2015-08-28 13:44:48', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('dfbdf8ff78dd65937a1bfa788df06aa4', '1', '1', '2015-08-28 12:24:02', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('e10ad538f0d532948ce347a531f1b63a', '1', '1', '2015-08-21 12:03:00', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('e1cf0a0bc4aa947b8a50e5711e4f22ad', '1', '1', '2015-09-26 15:04:07', '2015-09-26 15:04:26', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('e2022fa1c3055f913d82e91e687bb557', '1', '1', '2015-08-14 11:50:36', '2015-08-14 11:51:32', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('e414e5447e79c694f47737e09847ed7b', '1', '1', '2015-08-13 17:49:02', '2015-08-13 17:49:34', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('e47e437c4ed9b19d7a9e82ee8b69f121', '1', '1', '2015-10-27 22:31:02', null, '1085', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('e4a97636142988062d688c8c019cb015', '2', '2', '2015-08-10 15:51:36', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('e6134e778b68852b0b71cc558e81c140', '1', '1', '2015-09-29 16:45:45', null, '1080', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('e61f55956c232ed3a32aca3031a11816', '1', '1', '2015-08-11 17:57:59', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('e69b699f948f42e8ee52cc31ca71c99d', '1', '1', '2015-08-26 18:02:15', '2015-08-26 18:02:30', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('e6dac7bfbac4200f91bd4f85c4238d87', '2', '2', '2015-11-04 10:50:17', null, '1059', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('ea6561fc78bc62f157e435999b5372dd', '1', '1', '2015-09-26 15:05:08', '2015-09-26 15:05:26', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('eacc3a84e3a139d829cef801a968f6a2', '2', '2', '2015-08-04 17:50:31', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('eb110068a59c76d425c6d426a3b5660c', '1', '1', '2015-08-25 21:12:28', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('eb34136ce1c9d216d148725d65a895f5', '1', '1', '2015-10-27 16:45:33', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('ebaeabb8b3559e56540ba36a71f7ef30', '1', '1', '2015-09-01 09:47:11', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('ec7799f71f9e7b5236a80e3bb54e3f9d', '1', '1', '2015-08-08 17:43:55', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('ed012d86072dac06f791cd4c9cd12ec0', '1', '1', '2015-09-26 15:04:39', '2015-09-26 15:04:54', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('ef1e92d943d9d56ffd61d31b7e1389c8', '1', '1', '2015-08-14 11:55:00', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('ef78acf1b82a000662ae7ac616f75a31', '1', '1', '2015-09-01 11:53:17', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('f1e248366c4117954b6f676e0dd49bf6', '1', '1', '2015-08-12 16:28:31', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('f29e120e4ab44f802dd295275fed2711', '1', '1', '2015-08-11 17:33:04', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('f4ccd16aab396ce2cf6b10695bf2adee', '1', '1', '2015-08-26 20:46:11', '2015-08-26 20:46:26', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('f60b109f24ef1b64acc9d8b97b0c1e38', '1', '1', '2015-08-13 17:22:28', '2015-08-13 17:23:03', '123456', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('f72a707d2c01c0c786cf7d3e9ef0934e', '1', '1', '2015-10-28 11:12:07', null, '1081', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('f78239cfeb87167b2f67d5243afe3ba3', '1', '1', '2015-08-12 10:27:36', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('f7ec14796fdaf6e84d473d49e0513a8e', '1', '1', '2015-08-22 13:46:17', '2015-08-22 13:46:47', '1080', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('f852ea6978b434f637c0f7061c5e1930', '1', '1', '2015-08-19 14:36:51', '2015-08-19 14:38:14', '1090', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('f85f65bea840457270d09254a52837b8', '1', '1', '2015-09-26 14:55:18', '2015-09-26 14:55:35', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('f881e33bcf8001f609aa6ef8d31e9e57', '2', '2', '2015-08-10 15:48:52', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('faa665b5715ea9a7d596eb33b3873775', '1', '1', '2015-08-26 10:30:19', null, '1081', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('fb15d2594a6ef0b7c0e1e2f6fc92cba9', '1', '1', '2015-10-28 11:08:06', '2015-10-28 11:08:43', '1081', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('fb6cbb1b206211d713d35b04e50f75c4', '1', '1', '2015-08-12 17:01:25', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('fbeb1715b78a62abd056528dee05b48e', '1', '1', '2015-08-23 11:03:41', '2015-08-23 11:07:22', '1083', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('fca2369de688ec89a2d2603407d40161', '1', '1', '2015-11-03 20:38:03', null, '1059', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('fdf71200b3541f9e90fc7b07a08059a5', '1', '1', '2015-09-26 14:57:10', '2015-09-26 14:57:35', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('fecec26605c98afe018dec49c1fb9306', '1', '1', '2015-08-11 16:34:04', null, '123456', '1', null, '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('fef517d6fe05dabebab183720cfb6c58', '1', '1', '2015-09-26 15:08:53', '2015-09-26 15:09:12', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('ff3d18a44c814ce64ca86bd1ea304bf5', '1', '1', '2015-09-26 14:59:02', '2015-09-26 14:59:18', '1084', '1', '1', '2', 'SUCCESS', null);
INSERT INTO `mazda_order` VALUES ('ff826afc5bf736362a82931a16d5bcab', '2', '2', '2015-08-04 18:18:23', null, '123456', '1', '1', '1', 'NOTPAY', null);
INSERT INTO `mazda_order` VALUES ('ffbfa8296b2f0e36091c91f4e72d916d', '2', '2', '2015-08-04 21:10:13', null, '123456', '1', '1', '1', 'CLOSED', null);
INSERT INTO `mazda_order` VALUES ('ffe27718daf72834e4464624c64e68b6', '3200', '3200', '2015-07-30 11:21:16', null, '10300', '1', '1', '2', 'SUCCESS', null);

-- ----------------------------
-- Table structure for mazda_order_item
-- ----------------------------
DROP TABLE IF EXISTS `mazda_order_item`;
CREATE TABLE `mazda_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详细ID',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单ID',
  `product_id` varchar(32) DEFAULT NULL COMMENT '产品系列',
  `device_no` varchar(32) DEFAULT NULL COMMENT '车机UUID',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `valid` int(11) DEFAULT NULL COMMENT '有效期',
  `nums` int(11) DEFAULT NULL COMMENT '次数',
  `region_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `goods_price` int(11) DEFAULT NULL COMMENT '商品单价',
  `goods_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `cash_fee` int(11) DEFAULT NULL COMMENT '支付金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mazda_order_item
-- ----------------------------
INSERT INTO `mazda_order_item` VALUES ('1', '201507240001', '100200', '10300', '5600', '全国激活数据', '365', '1', '全国', '500', '1', '480');
INSERT INTO `mazda_order_item` VALUES ('2', '201507240001', '100200', '10300', '2100', '辽宁激活数据', '365', '1', '辽宁', '50', '1', '48');
INSERT INTO `mazda_order_item` VALUES ('3', '201507240002', '100200', '10300', '5600', '全国激活数据', '365', '1', '全国', '500', '1', '480');
INSERT INTO `mazda_order_item` VALUES ('10', '828a4031c2fd9ea6ab0529624c91603f', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('11', '828a4031c2fd9ea6ab0529624c91603f', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('12', '17ba16ef7d268f7c7abe6596f067f31e', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('13', '17ba16ef7d268f7c7abe6596f067f31e', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('14', '16443653775c95d3ff3b5bb4d2956d35', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('15', '16443653775c95d3ff3b5bb4d2956d35', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('16', '42b25fc13b8c478e9b31afdabf4967e2', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('17', '42b25fc13b8c478e9b31afdabf4967e2', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('18', '149021635be646814e443ef74fd52451', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('19', '149021635be646814e443ef74fd52451', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('20', 'db0f8aef33bd3602eca38184d1028c58', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('21', 'db0f8aef33bd3602eca38184d1028c58', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('22', '90fd2db8566c85b97917953d1d49c56e', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('23', '90fd2db8566c85b97917953d1d49c56e', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('24', '9435113564852b94709a3c9b6b6be655', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('25', '9435113564852b94709a3c9b6b6be655', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('26', '709dbd6336f0a13da658e7e2c2e25539', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('27', '709dbd6336f0a13da658e7e2c2e25539', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('28', '33069ffe745142fe88124ef0d54546e3', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('29', '33069ffe745142fe88124ef0d54546e3', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('30', '266ec9c5f20311ab77785cf79fe4944b', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('31', '266ec9c5f20311ab77785cf79fe4944b', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('32', '8b6f272d80c949d248a5ee994076855b', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('33', '8b6f272d80c949d248a5ee994076855b', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('34', '17bf94c7c5f0d512187ed0ef4e2e4d10', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('35', '17bf94c7c5f0d512187ed0ef4e2e4d10', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('36', '419ebf51d6d4ea16a1b86b57a907c400', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('37', '419ebf51d6d4ea16a1b86b57a907c400', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('38', 'dbbc6953dca85b7889021a7df8b62332', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('39', 'dbbc6953dca85b7889021a7df8b62332', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('40', '45ed2acc327df821951c16942ae32714', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('41', '45ed2acc327df821951c16942ae32714', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('42', 'ffe27718daf72834e4464624c64e68b6', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('43', 'ffe27718daf72834e4464624c64e68b6', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('44', 'a73df0afdd32526c7b22cbdb3788c712', '100200', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '100', '1', '100');
INSERT INTO `mazda_order_item` VALUES ('45', 'a73df0afdd32526c7b22cbdb3788c712', '100200', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('46', '89fd98b9a32ebaeeb31fcf586cdda443', '1', '10300', '2100', '辽宁数据', '365', '1', '辽宁', '1000', '1', '1000');
INSERT INTO `mazda_order_item` VALUES ('47', '89fd98b9a32ebaeeb31fcf586cdda443', '1', '10300', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('48', '7fca51e994dfc2544c485d7601805c0c', '100100', '2', '5600', '全国数据', '365', '1', '全国', '3100', '1', '3100');
INSERT INTO `mazda_order_item` VALUES ('55', '443615bc7c9dc2d7a40543467bd58dcb', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('56', '443615bc7c9dc2d7a40543467bd58dcb', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('57', 'd504f5f257093ee698ceb5854d79566f', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('58', 'd504f5f257093ee698ceb5854d79566f', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('59', 'b6b8cdef90ea787b8dc54265dd70c05f', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('60', 'b6b8cdef90ea787b8dc54265dd70c05f', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('61', '061c7000af3255e610d547be3a08e427', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('62', '061c7000af3255e610d547be3a08e427', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('63', '7a3f88f135af0649e02846759eed9ea2', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('64', '7a3f88f135af0649e02846759eed9ea2', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('65', '5399c6d4abfe7e455fd15aa3d12e983f', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('66', '5399c6d4abfe7e455fd15aa3d12e983f', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('67', 'bc3ba2135045d9f791b30c6b37dee1df', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('68', 'bc3ba2135045d9f791b30c6b37dee1df', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('69', 'bfdbee308f70d2db52296e173bb1e7f8', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('70', 'bfdbee308f70d2db52296e173bb1e7f8', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('71', 'eacc3a84e3a139d829cef801a968f6a2', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('72', 'eacc3a84e3a139d829cef801a968f6a2', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('73', 'd8a6e19f874d51313e47c9d6ada6273f', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('74', 'd8a6e19f874d51313e47c9d6ada6273f', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('75', 'adc98cda9dca1af1c18b6b6fa79b23fc', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('76', 'adc98cda9dca1af1c18b6b6fa79b23fc', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('77', 'b6a07b3ad391cca8e8df4a6394f682ef', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('78', 'b6a07b3ad391cca8e8df4a6394f682ef', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('79', 'ff826afc5bf736362a82931a16d5bcab', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('80', 'ff826afc5bf736362a82931a16d5bcab', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('81', '16705b0bcd62c64948788d270c4a9d21', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('82', '16705b0bcd62c64948788d270c4a9d21', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('83', '1d35f3dc509740731a787c95eac3adda', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('84', '1d35f3dc509740731a787c95eac3adda', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('85', '5c791aa7d8fc541ecc0575c2dd51db48', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('86', '5c791aa7d8fc541ecc0575c2dd51db48', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('87', 'd87025dc5ce09a0c3dc87aa8d3305c3a', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('88', 'd87025dc5ce09a0c3dc87aa8d3305c3a', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('89', '2570964fa76bd28b68a282a1a53a5c5f', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('90', '2570964fa76bd28b68a282a1a53a5c5f', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('91', '5c92ef5af0e8138de7a23f66019d7a0f', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('92', '5c92ef5af0e8138de7a23f66019d7a0f', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('93', 'd7cacac604d72353f34811760bebae1c', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('94', 'd7cacac604d72353f34811760bebae1c', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('95', '662503d23af648a97651237003869475', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('96', '662503d23af648a97651237003869475', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('97', '7add4efe0a40ecdc5f373e938095bbb3', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('98', '7add4efe0a40ecdc5f373e938095bbb3', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('99', 'd4cbc926594713d8c48bf44cd0d4b51d', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('100', 'd4cbc926594713d8c48bf44cd0d4b51d', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('101', 'd414ea1a1c361e2ed0dd217d58552bcb', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('102', 'd414ea1a1c361e2ed0dd217d58552bcb', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('103', '91b1b186439f498c8ce78983c3781702', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('104', '91b1b186439f498c8ce78983c3781702', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('105', '62f77af3ba7b5ee9caf246feb2517255', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('106', '62f77af3ba7b5ee9caf246feb2517255', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('107', '93a9a3d82cbc1872a4169cf4aa16df21', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('108', '93a9a3d82cbc1872a4169cf4aa16df21', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('109', 'ffbfa8296b2f0e36091c91f4e72d916d', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('110', 'ffbfa8296b2f0e36091c91f4e72d916d', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('111', '836c1b00405429e61b458f13950be9fc', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('112', '836c1b00405429e61b458f13950be9fc', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('113', '51590c536ac3ea2d0385796853793c05', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('114', '51590c536ac3ea2d0385796853793c05', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('115', 'abae6f83a87f274aae6abf9494d2282b', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('116', 'abae6f83a87f274aae6abf9494d2282b', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('117', '7eeafe675ab9952c28eaafda11fccfd6', '10300', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('118', '7eeafe675ab9952c28eaafda11fccfd6', '10300', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('119', '63ef25ec3b831c3246c927e60dc09742', '1', '10300', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('120', '63ef25ec3b831c3246c927e60dc09742', '1', '10300', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('121', 'b1e05aaa9b8c290c814beadef5554110', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('122', 'b1e05aaa9b8c290c814beadef5554110', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('123', '805419dccc2c95b39bf08e4db13b98d1', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('124', '970a365b51ed9dab54cd58fce2eb54bc', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('125', '65758d2da9ea3bcc9a080333bc709189', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('126', '28c600e68098cb38ffe064c1548041e2', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('127', '4f9eb02ff28692bd73649ace6756ff0a', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('128', 'ec7799f71f9e7b5236a80e3bb54e3f9d', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('129', '87459430a99f583c102dc9db86a10070', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('130', '9eb0bfc215a7cdddcfac55ae960c8f5b', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('131', 'b25c86624e8ede9ddce9545bece6582d', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('132', '963631529ee592fa54150fea1ddf673e', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('133', '2f99cba837cd70662b46eccecaf56ce5', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('134', '6f2f6bb64b25dc077b23b74ccc8ff31e', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('135', '912290499e6fe251ce70f127a179fdac', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('136', '7e37a65c24751502b7f4d75bae74880a', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('137', '7e37a65c24751502b7f4d75bae74880a', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('138', '31e444aea17745d785de372c67be41e0', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('139', '31e444aea17745d785de372c67be41e0', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('140', '52b582bbdcceb4b1414e451603f999e2', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('141', '52b582bbdcceb4b1414e451603f999e2', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('142', '21b216431a39f2a1fa729fdffe08bd69', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('143', '21b216431a39f2a1fa729fdffe08bd69', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('144', '7a2f700667e03627d1c6c4116c247277', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('145', '64209aed9fa3dacd86786dfda4baa82c', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('146', 'c6dff7129cae9daeea2ba02e94f26aa5', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('147', 'c6dff7129cae9daeea2ba02e94f26aa5', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('148', '6a45cd7b71bcd08611d46efdf44bdfb3', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('149', '6a45cd7b71bcd08611d46efdf44bdfb3', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('150', '29b04f8cb8fa08d2e7271dcf8ada5676', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('151', '29b04f8cb8fa08d2e7271dcf8ada5676', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('152', 'bf6ef1f0c952fa65026ae90930e54f5b', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('153', 'bf6ef1f0c952fa65026ae90930e54f5b', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('160', 'b03c2efb532666b02aa99281a67f0065', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('161', 'b03c2efb532666b02aa99281a67f0065', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('162', 'f881e33bcf8001f609aa6ef8d31e9e57', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('163', 'f881e33bcf8001f609aa6ef8d31e9e57', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('164', 'e4a97636142988062d688c8c019cb015', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('165', 'e4a97636142988062d688c8c019cb015', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('166', 'a7efb8e6ddf3fb538018d0d4fca1e68d', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('167', 'a7efb8e6ddf3fb538018d0d4fca1e68d', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('168', '3e774811e4eaa7fb304a077e68697dbc', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('169', '3e774811e4eaa7fb304a077e68697dbc', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('170', '72c88d5d0ead0ba9f493bc378ae18b99', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('171', '72c88d5d0ead0ba9f493bc378ae18b99', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('172', 'cf43b321d6522374c4c963b4531bcee6', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('173', 'cf43b321d6522374c4c963b4531bcee6', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('174', 'd27f379b999ef4d3b37cd13af86e2817', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('175', 'd27f379b999ef4d3b37cd13af86e2817', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('176', 'c7188629657b4b7f51afff11c27026b1', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('177', 'c7188629657b4b7f51afff11c27026b1', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('178', '10cc517d8fcd1a538ac608211af31511', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('179', '10cc517d8fcd1a538ac608211af31511', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('180', '3a604dc749432294b740a99d25a9b715', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('181', '3a604dc749432294b740a99d25a9b715', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('182', 'ae2a6301cc1fb71a13c5edc5ebb4b150', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('183', 'ae2a6301cc1fb71a13c5edc5ebb4b150', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('184', '4e4f56e28f987cf05b31d2640fc4fe08', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('185', '9af3ac6ac029b85b56036c84fa70dbdc', '110100', '123456', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('186', '320edfae49135425ad967981e3fd6b8e', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('187', 'b64c04038a211ab88c377aebb84d70a0', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('188', '876dc9705c3ff81c6c857e83bbb636d4', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('189', '1503b5c9a6c5dc098626c2bf5dedbaac', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('190', '1503b5c9a6c5dc098626c2bf5dedbaac', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('191', 'cd574ec2093e5f15cc79f5e81b2da71b', '1', '10300', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('192', '56e6ac13f8abbb35816d6c66cf36ee55', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('193', '0cd4f5a321bcb3c24f5d699584512d3f', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('194', '0cd4f5a321bcb3c24f5d699584512d3f', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('221', 'fecec26605c98afe018dec49c1fb9306', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('228', '0156039204a5cf9a7f216fd58910b392', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('231', '8c65c1cbf5140fdde3d0669b4a24e696', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('233', '223263a259116fae82f167e400246a4b', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('234', '669eec323b80ef8660e9e88f0289ab6b', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('235', 'd10fd6a9a297c048e9232872f83602eb', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('236', '3c0b332f8b2bf60a5aeececdf74448a3', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('237', '5d823aefa06b51cdfa4f14d7a46f9358', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('238', '91a75918d08060d9ccaffd8e3fda5e2a', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('239', 'aa05f2e08ff0f000af4d317be8e818f8', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('240', 'aa05f2e08ff0f000af4d317be8e818f8', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('241', '6e9039c139cb08906d56b67a7c09e8f7', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('242', '082ebe2e08cff8e159225d33feeda81f', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('243', '31e2ffbaf2d16b333c565c9d2eb198eb', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('244', 'f29e120e4ab44f802dd295275fed2711', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('247', 'ac9a1ff8d9dafbc039881da79356a01d', '1', '10300', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('248', 'ac9a1ff8d9dafbc039881da79356a01d', '1', '10300', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('249', 'e61f55956c232ed3a32aca3031a11816', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('250', 'bd3a4913ad194ce629e7017bf29a44ef', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('251', '1e856536bcd6f2a7b6ffa61ea36db837', '110100', '123456', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('254', '5da2bc2d274ccc61e94a6c6f58d5b9b2', '110100', '123456', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('255', '5da2bc2d274ccc61e94a6c6f58d5b9b2', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('256', '143f2d42eb53e44b446eb7d866305638', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('257', 'f78239cfeb87167b2f67d5243afe3ba3', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('258', 'a837094867153a7550a4252c441de574', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('259', 'a789001c5ae37d6c94306cac35fab03d', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('260', 'f1e248366c4117954b6f676e0dd49bf6', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('261', '161c9d850d203cec1d6bd812c32a9891', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('262', 'dc5917846fcc5d876ad7ffb94dd46aa9', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('263', '6d908d9e445f15cc3649499972c2f6f3', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('264', 'fb6cbb1b206211d713d35b04e50f75c4', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('265', 'bf3cac1e3f9847f9a0b6e0a275b9cfe6', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('266', '4085e59cbd1732e78b63910c42906ca4', '110100', '123456', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('267', '6ab42a083d28238cc9dcac35710e0dac', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('268', '00968141f141b7d074bca037b31e51d9', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('269', '799089062478e3caa1252157b21e3c17', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('270', '07492b2db0e5303d5628801b63604f93', '110100', '123456', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('271', 'b1a9427b413e5a71d5d361f8cbd4314e', '110100', '123456', '3200', '江苏地图', '365', '1', '江苏', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('272', '194421687ceff32a20bcb1a5d292bb9b', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('273', '1691849e1cb01adc88d5a20fcffd63bf', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('274', 'f60b109f24ef1b64acc9d8b97b0c1e38', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('275', 'e414e5447e79c694f47737e09847ed7b', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('276', '44e1a2f5b9efce73e92e2d102759c12f', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('277', 'e2022fa1c3055f913d82e91e687bb557', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('278', 'ef1e92d943d9d56ffd61d31b7e1389c8', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('279', '794c2086490c8726642d71d4d5ba13e1', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('280', '5b74dc30f77bc3cf51f98beb4502e1c2', '110100', '123456', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('281', '982b988762eb0866f26c6e95d685b5f7', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('282', '982b988762eb0866f26c6e95d685b5f7', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('283', '70268785926cc3ea286dec0e4846459f', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('284', '70268785926cc3ea286dec0e4846459f', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('285', '2a59adddd553499c54bb91060d7ffd7c', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('286', '2a59adddd553499c54bb91060d7ffd7c', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('287', '545b053d7880e7e7e3fc041352bc89df', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('288', '545b053d7880e7e7e3fc041352bc89df', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('289', '88bbd2efdd3f2a2226b9e12a427a8ff2', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('290', 'bce33422e68004f7fde8bb2d8204c0cd', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('291', '8e066496da896cdc37fc2ae3dc4d7f08', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('292', '4de9df9a03e73a246dd791f6355e21a5', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('293', 'bd35166494f77c1c88d9687232d02a65', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('294', '0c9bea508ff44d2110d64952044d9b31', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('295', '0c9bea508ff44d2110d64952044d9b31', '110100', '123456', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('296', '0c9bea508ff44d2110d64952044d9b31', '110100', '123456', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('297', '94ff5c022f4d2e3e021d703d2ca41ceb', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('298', '4acd2f73a9992dc87d1037745e1919d6', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('299', 'b7fce6d7f9a6391e8357438e9368ad3f', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('300', 'bc3bbea0215ee093d957fb603cc16620', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('301', '49c2063aad668781835934110625c429', '110100', '1080', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('302', '2bc852114412e47313c28592e8479bd2', '110100', '1090', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('303', '464a104fd141cf818b23f1538168362f', '110100', '1090', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('304', '065531b21ed2826906d7b6e3c9b71c04', '110100', '1090', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('305', '60ffe806f3c5ff27f0309522344a7dc0', '110100', '1090', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('306', 'b75888d22a1a034322b9e56dc3a351cf', '110100', '1090', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('307', 'f852ea6978b434f637c0f7061c5e1930', '110100', '1090', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('308', '75c0589a03ee545d1a4cba3c92cdc94e', '110100', '1090', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('309', '53ae3026b11aeead0c99a5de0a6af9e9', '110100', '1090', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('310', '30ec4e24c17f1d0e592654b9b9ad3073', '110100', '1090', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('311', '9de81088ca83078a0726239c7e3f618b', '110100', '1090', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('312', '6dc361ab916a131eaf2f748cac23d272', '110100', '1090', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('313', '0980a399fe8bef87aab05672a9e1de6c', '110100', '1090', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('314', 'dd24ff6da6e83e5b8e74b7abfd11a4a4', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('315', '2223d7e84a9ba546c9351df893507192', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('316', '947a710d0677cff0f03cdceeb71494dc', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('317', '0234bba087f985b2d1964439a32c3e1e', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('318', '1135720beca33ddc9a6ff39b52a1eb8f', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('319', '24f033da716252bed0a2d80fd8508df2', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('320', 'b318d56a3d2d38486f0bd675b70076d3', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('321', '5493532843dc0ef9cbb683a3bcb9c331', '110100', '1085', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('322', '7fe4775bc79cb66863674a60e96d8c11', '110100', '1085', '3700', '山东地图', '365', '1', '山东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('323', '676d05fc4716331cec5a1929fbb40f27', '110100', '1085', '3700', '山东地图', '365', '1', '山东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('324', '6a0437fcc564ec469e2b7dad139c9ea3', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('325', 'd74f27a8a3f58876ecc7138af36d0187', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('326', 'dc78e418fb42bfcf656af60f823cf26d', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('327', 'e10ad538f0d532948ce347a531f1b63a', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('328', '90144d393efe538ce4b42a7173aab7ce', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('329', '01f39e2b5f7d44dac8378e7745bae7ce', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('330', 'd6a7fe34bebd4f1dfbfff60121e2f06f', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('331', 'd6a7fe34bebd4f1dfbfff60121e2f06f', '110100', '1083', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('332', '771080fb5b3a4eed81bad8955e353911', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('333', '771080fb5b3a4eed81bad8955e353911', '110100', '1083', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('334', '6ef39cabeefe70c0193a5a7bb8577686', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('335', 'c6fb84d27934007f9d3aadb47ade81b6', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('336', 'c6fb84d27934007f9d3aadb47ade81b6', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('337', 'db204147a67fcad56a4d471f19dde870', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('338', 'db204147a67fcad56a4d471f19dde870', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('339', '0c0c74f33d0a7f0f8beab135dbd6b6d0', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('340', '0c0c74f33d0a7f0f8beab135dbd6b6d0', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('341', '61a145b10f63a176c2a211b150a84633', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('342', 'f7ec14796fdaf6e84d473d49e0513a8e', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('343', 'd8a58774136b2e649c261d44236e8e2c', '110100', '1091', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('344', '25edac87aeb11a68a737ce04e01dc82a', '110100', '1091', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('345', '537fb95d4d141067297658059b7b49e7', '110100', '1091', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('346', 'b95d9dcd706df30f7d6b8f27642bc50a', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('347', 'b95d9dcd706df30f7d6b8f27642bc50a', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('348', 'b95d9dcd706df30f7d6b8f27642bc50a', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('349', '2a2b267ba16829e0b3c038c12128cdd9', '110100', '1091', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('350', '3ca3c02ce36ff1386340276dbae5d7aa', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('351', '3ca3c02ce36ff1386340276dbae5d7aa', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('352', '3ca3c02ce36ff1386340276dbae5d7aa', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('353', 'fbeb1715b78a62abd056528dee05b48e', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('354', '10761e0d63bd8d6d7e46e11c02828e1d', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('355', 'bd55220582d3d954695f578281df3fa3', '110100', '1091', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('356', '6056628f5acafa4aea25338b4a4a4cbd', '110100', '1091', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('357', '2f527747b4a72721e23ef4fa00b91d0f', '110100', '1091', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('358', '805d928fe1cf7373e6f2327ea5080184', '110100', '1091', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('359', '453b68b6473a4208af3cd5a969539b63', '110100', '1091', '2200', '吉林地图', '365', '1', '吉林', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('360', '4bf740c5698b05ac40c0d5ab497ade94', '110100', '1091', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('361', 'dd4fb41d36b5d81c439e7fd8b4b6207d', '110100', '1091', '3300', '浙江地图', '365', '1', '浙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('362', '5ef38ea0c8fc725ffe6c8e631452c6b2', '110100', '1091', '4200', '湖北地图', '365', '1', '湖北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('363', 'b7995018abe35e36f7bc816e98a1adb3', '110100', '1091', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('364', '2422ba7257a84dfdd007e538bbf58ae8', '110100', '1091', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('365', '630bafd9d40c606a921cda650a4eb6c6', '110100', '1091', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('366', '3528ed9022f8a98fd22c3cddfedbda20', '110100', '1081', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('367', '40cfc57cb02ef8e188b3676b951ee4e7', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('368', '6b60548c286cc408d7de9e92bad46433', '110100', '1081', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('369', 'eb110068a59c76d425c6d426a3b5660c', '110100', '1081', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('370', 'd2d606b31c6f58f2ee1b9b781adf2555', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('371', 'faa665b5715ea9a7d596eb33b3873775', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('372', 'c78f73a4bf1c3fba9e8f68bb5813019e', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('373', '21530f4928d8948d92560794e8c7d614', '110100', '1081', '5100', '四川地图', '365', '1', '四川', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('374', '38bd64efd5037c461b317b95cd297d82', '110100', '1081', '4400', '广东地图', '365', '1', '广东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('375', '1e222899e0698c2230e26503e9646d5d', '110100', '1081', '4400', '广东地图', '365', '1', '广东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('376', '03b90f9885c761efae313a8d083f2c6f', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('377', '985316128ad5c84eb01316127007e505', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('378', 'b99d2acd16922ae8676632666bc6c12e', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('379', '5fb5c95df33361ca31e711686b9eadb3', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('380', '78600eb77adc287276def21cda199d23', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('381', 'af0900c55e8bc0b3e70cb736b404bf4d', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('382', '7ceb31f61de212ab4d7b9470660b7ac5', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('383', 'a7248e007c3a598a0c6e13b0b0107fd6', '110100', '1081', '3200', '江苏地图', '365', '1', '江苏', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('384', 'e69b699f948f42e8ee52cc31ca71c99d', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('385', '49af1facf41b6fcf318fd296b5c6ca10', '110100', '1085', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('386', 'ca2696ab504c88d9d298227d7eb8de7b', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('387', 'd5236df4facb98a1f536fd7f0737202a', '110100', '1081', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('388', '4c856c2d01c8fe5b58a07e5f7747d701', '110100', '1081', '3200', '江苏地图', '365', '1', '江苏', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('389', 'f4ccd16aab396ce2cf6b10695bf2adee', '110100', '1081', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('390', '7af8d2192bd3c4385226b34dfabebc2a', '110100', '1081', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('391', '0e6984372dbfe4cf39d3700e5da1768d', '110100', '1081', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('392', 'c2a853c8aaa8108e2f313d122a47c733', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('393', '718eb930f67a7be52096b7e60cf9fdf4', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('394', '04a420dcccd0b8c9af3c94b11ccd7499', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('395', 'c2f083b70fb008aea830eca57cc64721', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('396', '0c722f68f27a4bffbc53c932f1f4bc71', '110100', '1085', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('397', '0c722f68f27a4bffbc53c932f1f4bc71', '110100', '1085', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('398', '5dd7025a630f8cfe7f258ca6aa21b1ac', '110100', '123456', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('399', '5dd7025a630f8cfe7f258ca6aa21b1ac', '110100', '123456', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('400', 'a4760a58b82d8e71841f1444dfcbd464', '110100', '1085', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('401', '1f070a305ea121c1a4676051f8e98da8', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('402', '1f070a305ea121c1a4676051f8e98da8', '110100', '1083', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('403', '64668ff7830ee21ae29f80861da74bfe', '110100', '1081', '4400', '广东地图', '365', '1', '广东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('404', '3399782d5f4c5726691b8f173b60d6e4', '110100', '1081', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('405', '3caa07630880b65fca635f9ae73a5039', '110100', '1083', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('406', '0ac55d471b60f2c7ed11cc5213655c85', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('407', '3692896e56adcb9ab002a716f400926b', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('408', '7821d664f961887184abd79bd94cd58c', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('409', 'a4767ec826942dc5fafa5e436eb22720', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('410', '7096c7ca2837ca94b539dfafe141b20b', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('411', '387a1da38992508e0a1d66c9142734d1', '110100', '1081', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('412', '6aab754eda47bd080cb5429c0668cf67', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('413', 'dfbdf8ff78dd65937a1bfa788df06aa4', '110100', '1081', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('414', 'a03e2867c7e37411db8df1c078e2a8e8', '110100', '1081', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('415', '1c610e361b630e1459bb901314f4ef9c', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('416', '05b131ccaa574f064ed6d3715899a6fc', '110100', '1081', '4500', '广西壮族自治区地图', '365', '1', '广西壮族自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('417', '3638cfe1d804623fc72351d5f7cd1e98', '110100', '1081', '4100', '河南地图', '365', '1', '河南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('418', '90e5800ddc31e2b355d16c5694229c64', '110100', '1081', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('419', 'b862f4ebfabfdf89706b1a99d983c59e', '110100', '1081', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('420', '97e466419c5978e4a2ac00e5fe066d99', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('421', 'de3d4984d810d75cd2fadc3c563e142f', '110100', '1081', '4500', '广西壮族自治区地图', '365', '1', '广西壮族自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('422', 'a9c253dd04df0af5d18c8d42ae4d9110', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('423', 'c49c399dcc0d15f55bf44fe43829e3a5', '110100', '1081', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('424', '4d2ab6a98c37850f786d18b69b7b5c21', '110100', '1081', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('425', '63c88db6116165e22f53e41e60cbed6b', '110100', '1081', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('426', '31839459b2b96b1d49a8a2eb3072671b', '110100', '1081', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('427', '1bd6d50973b134d282644b94caf7f943', '110100', '1081', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('428', '4f0cb0227d8aca044f76878cb4affd4e', '110100', '1081', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('429', 'af937b30661698ace94ec101222cf7f2', '110100', '1081', '2200', '吉林地图', '365', '1', '吉林', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('430', 'ba9765580bcbb107d655cb46fdc8169b', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('431', '6e7c3df6bb4b24be32b634118c31014a', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('432', '8e6e6120a2beabde0ed761f17d44c207', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('433', '05ae729b669a1312bfa628e12edd7801', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('434', '55bbc050110de7e47512fe8dab45cf0e', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('435', 'd037957a713f4bba0f9f70a30837c6ca', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('436', '3ff6240ab2a612f39194f7cea57ef13b', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('437', 'ebaeabb8b3559e56540ba36a71f7ef30', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('438', '1e88a62ca29853e6511e3b3d0f715d60', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('439', '4ca20149a1ed2c430fb28525281a1ef9', '110100', '1081', '3300', '浙江地图', '365', '1', '浙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('440', '2f49db2e6384c5ac39d30b8a148e4ad7', '110100', '1081', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('441', 'a226820c031aa9fdc22218535357bb8b', '110100', '1081', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('442', 'ccd09fb91eac2b850e17368901976ff2', '110100', '1081', '5600', '全国地图', '365', '1', '全国', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('443', '245fabf12d2af8e25ead4058b3f81c75', '110100', '1081', '3400', '安徽地图', '365', '1', '安徽', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('444', '5ec3aeb19b8a650b0bae00538dc5766f', '110100', '1081', '5100', '四川地图', '365', '1', '四川', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('446', '124a08fc59a852203dfadbd872df826d', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('447', 'a88d6430d1dd6edd05a4103392691da6', '110100', '1081', '3100', '上海地图', '365', '1', '上海', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('448', 'ef78acf1b82a000662ae7ac616f75a31', '110100', '1081', '6500', '新疆维吾尔自治区地图', '365', '1', '新疆维吾尔自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('449', '2fe0eb7b89d4a5d97c563c278e3faf34', '110100', '1081', '3400', '安徽地图', '365', '1', '安徽', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('450', '7710a31682656828931609decaafc120', '110100', '1081', '3200', '江苏地图', '365', '1', '江苏', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('451', 'dbc7441c712c82c6b58c91e7b858cf36', '110100', '1080', '4400', '广东地图', '365', '1', '广东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('452', 'abbf756589e75d57d6897667bfdaf60f', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('453', 'abbf756589e75d57d6897667bfdaf60f', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('454', 'abbf756589e75d57d6897667bfdaf60f', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('455', '9792382e4def66a451d7974c73be5208', '110100', '1085', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('456', '004d4aa25fbb515c7b005767ac2617db', '110100', '1085', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('457', '3152842db4302dfcf1d0e6ea2b470ba2', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('458', '485875cb6031363352da2031485aacb1', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('459', '4eb42f288bf9f02552f7633a4e31737e', '110100', '1083', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('460', '59a47c7bea7aa3d040e0d56239355db0', '110100', '1084', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('461', '792e32ba59209df01c29077f97d8b961', '110100', '1084', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('462', 'd1dde773e9d59d25df8fad07630a8c97', '110100', '1084', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('463', '42c149dfa3ec6e1f39812b5c3e96b4d2', '110100', '1084', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('464', '79e76737f739ae0f0dcf116c50085247', '110100', '1084', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('465', '41c1a35503183a278206f5c3910cfcbd', '110100', '1084', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('466', '797c1f11553b528b61149cfa2f1af074', '110100', '1084', '2200', '吉林地图', '365', '1', '吉林', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('467', 'f85f65bea840457270d09254a52837b8', '110100', '1084', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('468', '75ddb43d974e7f5ddb03f6528a1faeca', '110100', '1084', '3100', '上海地图', '365', '1', '上海', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('469', 'b22245651ab2144f3a95db3a5766f894', '110100', '1084', '3200', '江苏地图', '365', '1', '江苏', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('470', 'fdf71200b3541f9e90fc7b07a08059a5', '110100', '1084', '3300', '浙江地图', '365', '1', '浙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('471', 'b6dd15722fef43e6f5cd98b7a7ba5274', '110100', '1084', '3400', '安徽地图', '365', '1', '安徽', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('472', '35b7f21e906178d11417761279e37654', '110100', '1084', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('473', 'ff3d18a44c814ce64ca86bd1ea304bf5', '110100', '1084', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('474', '08fb3da47a4da51df11af0eda6c347c6', '110100', '1084', '3700', '山东地图', '365', '1', '山东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('475', '1a20a845011112923084c14212416b6e', '110100', '1084', '4100', '河南地图', '365', '1', '河南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('476', 'd8444a2550574eb4b5fdae41c9c79043', '110100', '1084', '4200', '湖北地图', '365', '1', '湖北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('477', 'befc5bfbed9f0e1ec422072c8e2ed3d9', '110100', '1084', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('478', '0981e41ebe9bd742b237e026475aa435', '110100', '1084', '4400', '广东地图', '365', '1', '广东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('479', '76c6ffa831a93c9c6c4cde093a9bd22e', '110100', '1084', '4500', '广西壮族自治区地图', '365', '1', '广西壮族自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('480', '3f55dd11b1bf044c9d38337e116bc937', '110100', '1084', '4600', '海南地图', '365', '1', '海南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('481', 'e1cf0a0bc4aa947b8a50e5711e4f22ad', '110100', '1084', '5000', '重庆地图', '365', '1', '重庆', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('482', 'ed012d86072dac06f791cd4c9cd12ec0', '110100', '1084', '5100', '四川地图', '365', '1', '四川', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('483', 'ea6561fc78bc62f157e435999b5372dd', '110100', '1084', '5200', '贵州地图', '365', '1', '贵州', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('484', '9b6a895470f0ca98a2fb2c0953883ebf', '110100', '1084', '5300', '云南地图', '365', '1', '云南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('485', '78636f2ba34ff8920de86dcbd5bfa3bb', '110100', '1084', '5400', '西藏自治区地图', '365', '1', '西藏自治区 ', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('486', '8a76f1cc6afa6d54abe4e1877342b9ea', '110100', '1084', '6100', '陕西地图', '365', '1', '陕西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('487', '4cd8a37f88384764c7607fa5274405a1', '110100', '1084', '6200', '甘肃地图', '365', '1', '甘肃', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('488', '146283703ca4c8bc299be8c0658a6fee', '110100', '1084', '6300', '青海地图', '365', '1', '青海', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('489', 'fef517d6fe05dabebab183720cfb6c58', '110100', '1084', '6400', '宁夏回族自治区地图', '365', '1', '宁夏回族自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('490', 'c5f7c31a8f3b3086172cb27bd46a14f7', '110100', '1084', '6500', '新疆维吾尔自治区地图', '365', '1', '新疆维吾尔自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('491', 'a67fb512e30f38c64f3fb832532a875c', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('492', 'c9963dfe3bee3077bda9aaea55416397', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('493', 'e6134e778b68852b0b71cc558e81c140', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('494', 'bdf0ffd271dfa34db380d1de3ea4e055', '110100', '1080', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('495', 'b444a40e3c138b6431d8ee4f4082caae', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('496', '25af20e09c5d4032c56170bfb0380a1b', '110100', '1059', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('497', '6e6574b131caedf02764f271e8cc81dd', '110100', '1059', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('498', '10c80dfe9616a6a55210dc46bf5438cd', '110100', '1059', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('499', '79c845bddd128ddaf83fa1f679477b39', '110100', '1059', '2200', '吉林地图', '365', '1', '吉林', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('500', 'b3c0383de3b7747ca192cf9f307a61c2', '110100', '1059', '3100', '上海地图', '365', '1', '上海', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('501', '579f14c28a609f55b3a77cf0e93e1674', '110100', '1081', '3100', '上海地图', '365', '1', '上海', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('502', '6cc3d6040d282b0c89a4c800870caa72', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('503', 'cfd3a9c9d2ba05ea7061812fe341edeb', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('504', '25faee68c6d0288f408774af69372663', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('505', 'c6eef06714ffcc6f51a1d848b7cd1880', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('506', '782cf6e50de775988677c3bf34959716', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('507', '312d75dcbf82444d56cace7f5b4872f9', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('508', 'a84f581c441415c0ab38abf215e4a457', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('509', 'c9d434ad99aee6ff04ba4808afd02795', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('510', '7c54007d856e4028f09407d318f80e5f', '110100', '1081', '3700', '山东地图', '365', '1', '山东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('511', '468840556dfb0cba8e7f32ded83b49dc', '110100', '1081', '3700', '山东地图', '365', '1', '山东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('512', '0beb960374235703085f3f03c2ea48c4', '110100', '1081', '3700', '山东地图', '365', '1', '山东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('513', '02a564d519b89c62ea37e1e504e57651', '110100', '1081', '3700', '山东地图', '365', '1', '山东', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('514', '9f9bc1190e2669c3cea9d37fa10883a2', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('515', '7588ada9895953671b2c207347ec6585', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('516', '975637b1ab350f251e2469dbe2fb4d09', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('517', '811e51e8f41090c47314a07c6fb022e3', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('518', 'ad3238cafd932be8677479fc48053c36', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('519', 'ab54d8eeed988b7f30d4e9cd33419301', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('520', '5e8bbdbbd0764d809f4c06f3477d9526', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('521', '0068770e593d0dfb08466ac49d1416d5', '110100', '1081', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('522', '7181d0788d3b258e8b34fe838bf1c5bc', '110100', '1081', '6200', '甘肃地图', '365', '1', '甘肃', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('523', 'eb34136ce1c9d216d148725d65a895f5', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('524', '5d1758166a8a7e770bb69804681e84e0', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('525', '89689b203eb36e1866f5318adeadb013', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('526', '8185963e3539eb3b8f611376540495a3', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('527', 'a1b3e7897df992e9a4a9909305540209', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('528', '48962f4cb18f9107ee1070f5fabb2869', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('529', '577654334c23bcc761c625b14f450599', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('530', '84410d1be51515b734cfa75241424e1d', '110100', '1081', '3300', '浙江地图', '365', '1', '浙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('531', '7bf6060265d394bb737af512fd7fb6d0', '110100', '1081', '3300', '浙江地图', '365', '1', '浙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('532', '35302eb89d82a7ecc4f7e714aa3cfd09', '110100', '1081', '3300', '浙江地图', '365', '1', '浙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('533', '623a5d9966174fe71c69a373ccb38f1e', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('534', 'e47e437c4ed9b19d7a9e82ee8b69f121', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('535', '5409e103925227160e809b88523ed4a5', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('536', '854a70874bf6837f868c4fb2560780fd', '110100', '1081', '6300', '青海地图', '365', '1', '青海', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('537', '768d22c7010a598196b561f9ea156c23', '110100', '1081', '2200', '吉林地图', '365', '1', '吉林', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('538', 'fb15d2594a6ef0b7c0e1e2f6fc92cba9', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('539', 'c5ae8263798932eafc237f7fac46f42d', '110100', '1081', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('540', '40b53c55e6656d052310156a1208058c', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('541', 'f72a707d2c01c0c786cf7d3e9ef0934e', '110100', '1081', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('542', '7851b2b8e2d586dbb8a58a1783db445d', '110100', '1085', '1400', '山西地图', '365', '1', '山西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('543', 'd6039317127348e52d41eafcfeed1db2', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('544', 'c322fd8d4f8d053793f0746216571501', '110100', '1085', '1300', '河北地图', '365', '1', '河北', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('545', 'ca5197b429d7454cb861fd667c7584a1', '110100', '1085', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('546', '4e5a50050613375c4a579ffb214e09c5', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('547', '55ba6672a76f2e1c12920d40a2a933aa', '110100', '1081', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('548', '5fc5a686ddccdc2a66651f8f4fbb50f1', '110100', '1081', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('549', 'dbe6ff2fdc4078bd98dadbf747e19373', '110100', '1081', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('550', '37dc2480444e6c39f853331d8e4a6e2d', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('551', '7fb250a944ca9ab2d863a30598ddc3ce', '110100', '1059', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('552', 'b56f0c3767188ac468b3214177a2fc44', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('553', 'ab10a0c260eb3f50aa0a5a70435069a8', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('554', 'ab10a0c260eb3f50aa0a5a70435069a8', '110100', '1085', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('555', 'c0362d2934b99de64de86dd75b3a6d7b', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('556', '2aff17f0300115f0570d4164df83f80a', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('557', '5f8f14351d062ef912504ff35f21e85b', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('558', '68ead47e587d96217a7850edfd53db64', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('559', '359eaec98690c1df0e76e446d944c4fd', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('560', '2fb67fc10ff2cb5e432965af5f30a0e6', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('561', '7619a2af6085acd1d918ffac841c859d', '110100', '1085', '1500', '内蒙古自治区地图', '365', '1', '内蒙古自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('562', '7619a2af6085acd1d918ffac841c859d', '110100', '1085', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('563', '563131584f0e2f6742c55714dff8023a', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('564', '744d90d2b4c75c66eceffccbbeb51171', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('565', '744d90d2b4c75c66eceffccbbeb51171', '110100', '1085', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('566', 'c14f63a9f53ab427630fc8b6337799f6', '110100', '1085', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('567', 'bdfe783dcd5b912bcf85f28752ce99f6', '110100', '1081', '1200', '天津地图', '365', '1', '天津', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('568', '15f1e603d9fa656d195efad6ae5e7687', '110100', '1081', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('569', 'a9ca0bb7913c703a5ce4d7472bade184', '110100', '1081', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('570', '803fa60a60b5090c764ddb747d9c0897', '110100', '1059', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('571', 'fca2369de688ec89a2d2603407d40161', '110100', '1059', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('572', '3a8711791109e6a95a86bbf4cfc5054f', '110100', '1059', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('573', 'b9ef0661de17a77edc511cf04c52dd42', '110100', '1059', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('574', 'b9ef0661de17a77edc511cf04c52dd42', '110100', '1059', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('575', '8d38a878d5973113162668b7d8a728ae', '110100', '1059', '2100', '辽宁地图', '365', '1', '辽宁', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('576', '8d38a878d5973113162668b7d8a728ae', '110100', '1059', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('577', 'e6dac7bfbac4200f91bd4f85c4238d87', '110100', '1059', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('578', 'e6dac7bfbac4200f91bd4f85c4238d87', '110100', '1059', '3200', '江苏地图', '365', '1', '江苏', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('579', 'a5a481d74b451553e150bf6efd8cbdd6', '110100', '1059', '2300', '黑龙江地图', '365', '1', '黑龙江', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('580', '5829e5517fcf3c6e3012b3c308fd9658', '110100', '1059', '3500', '福建地图', '365', '1', '福建', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('581', '100e077a72ab788e934a815b2e1548ae', '110100', '1059', '3400', '安徽地图', '365', '1', '安徽', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('582', 'a9729e110ad2940564e224afc6534a65', '110100', '1059', '3400', '安徽地图', '365', '1', '安徽', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('583', '5a2b56cc52ac7b3f703efd9e0288c4f3', '110100', '1084', '1100', '北京地图', '365', '1', '北京', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('584', '37051cdcc2e6e6bd08454cf9aca35909', '110100', '1081', '3600', '江西地图', '365', '1', '江西', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('585', '37051cdcc2e6e6bd08454cf9aca35909', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('586', '37051cdcc2e6e6bd08454cf9aca35909', '110100', '1081', '5000', '重庆地图', '365', '1', '重庆', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('587', '37051cdcc2e6e6bd08454cf9aca35909', '110100', '1081', '6200', '甘肃地图', '365', '1', '甘肃', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('588', '37051cdcc2e6e6bd08454cf9aca35909', '110100', '1081', '6400', '宁夏回族自治区地图', '365', '1', '宁夏回族自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('589', '37051cdcc2e6e6bd08454cf9aca35909', '110100', '1081', '6500', '新疆维吾尔自治区地图', '365', '1', '新疆维吾尔自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('590', '9f912a7855623434883d5d97aac32c9b', '110100', '1081', '6200', '甘肃地图', '365', '1', '甘肃', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('591', '9f912a7855623434883d5d97aac32c9b', '110100', '1081', '6400', '宁夏回族自治区地图', '365', '1', '宁夏回族自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('592', '9f912a7855623434883d5d97aac32c9b', '110100', '1081', '6500', '新疆维吾尔自治区地图', '365', '1', '新疆维吾尔自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('593', '4621484f3f76b380f5fc0df1db336deb', '110100', '1081', '4500', '广西壮族自治区地图', '365', '1', '广西壮族自治区', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('594', 'cc8efc78ac338d99a371cb0ada056993', '110100', '1081', '5000', '重庆地图', '365', '1', '重庆', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('595', 'b8d53e1e32ccbbac88e6271c9839d055', '110100', '1081', '4300', '湖南地图', '365', '1', '湖南', '1', '1', '1');
INSERT INTO `mazda_order_item` VALUES ('596', 'b8d53e1e32ccbbac88e6271c9839d055', '110100', '1081', '5000', '重庆地图', '365', '1', '重庆', '1', '1', '1');

-- ----------------------------
-- Table structure for mazda_order_state
-- ----------------------------
DROP TABLE IF EXISTS `mazda_order_state`;
CREATE TABLE `mazda_order_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(32) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mazda_order_state
-- ----------------------------
INSERT INTO `mazda_order_state` VALUES ('1', '未支付');
INSERT INTO `mazda_order_state` VALUES ('2', '已支付');

-- ----------------------------
-- Table structure for mazda_payment_mode
-- ----------------------------
DROP TABLE IF EXISTS `mazda_payment_mode`;
CREATE TABLE `mazda_payment_mode` (
  `mode_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付方式id',
  `mode_name` varchar(64) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`mode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mazda_payment_mode
-- ----------------------------
INSERT INTO `mazda_payment_mode` VALUES ('1', '微信支付');
INSERT INTO `mazda_payment_mode` VALUES ('2', '支付宝支付');
INSERT INTO `mazda_payment_mode` VALUES ('3', '刮刮卡支付');

-- ----------------------------
-- Table structure for mazda_service
-- ----------------------------
DROP TABLE IF EXISTS `mazda_service`;
CREATE TABLE `mazda_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  `service_code` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of mazda_service
-- ----------------------------
INSERT INTO `mazda_service` VALUES ('1', '算路服务', '0');
INSERT INTO `mazda_service` VALUES ('2', '检索服务', '1');
INSERT INTO `mazda_service` VALUES ('3', 'TMC服务', '2');
INSERT INTO `mazda_service` VALUES ('4', '位置服务', '3');
INSERT INTO `mazda_service` VALUES ('5', 'NDS升级', '4');
INSERT INTO `mazda_service` VALUES ('6', '鉴权服务', '5');
INSERT INTO `mazda_service` VALUES ('7', 'E-CALL', '33');
INSERT INTO `mazda_service` VALUES ('8', 'I-CALL', '34');
INSERT INTO `mazda_service` VALUES ('9', 'B-CALL', '35');
INSERT INTO `mazda_service` VALUES ('10', '车辆远程控制', '36');
INSERT INTO `mazda_service` VALUES ('11', '新闻服务', '65');
INSERT INTO `mazda_service` VALUES ('12', '天气服务', '66');
INSERT INTO `mazda_service` VALUES ('13', '违章查询服务', '67');
INSERT INTO `mazda_service` VALUES ('14', '动态加油站服务', '68');
INSERT INTO `mazda_service` VALUES ('15', '动态停车场服务', '69');
INSERT INTO `mazda_service` VALUES ('16', '在线FM服务', '70');
INSERT INTO `mazda_service` VALUES ('17', '发送到车', '71');

-- ----------------------------
-- Table structure for mazda_soft_ver
-- ----------------------------
DROP TABLE IF EXISTS `mazda_soft_ver`;
CREATE TABLE `mazda_soft_ver` (
  `soft_ver` varchar(64) NOT NULL,
  `soft_name` varchar(100) NOT NULL,
  PRIMARY KEY (`soft_ver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mazda_soft_ver
-- ----------------------------
INSERT INTO `mazda_soft_ver` VALUES ('T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', '610301.020801.07.35');

-- ----------------------------
-- Table structure for std_data_ver
-- ----------------------------
DROP TABLE IF EXISTS `std_data_ver`;
CREATE TABLE `std_data_ver` (
  `ver_id` varchar(64) NOT NULL COMMENT '数据版本id',
  `ver_name` varchar(100) NOT NULL COMMENT '数据版本号',
  PRIMARY KEY (`ver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of std_data_ver
-- ----------------------------

-- ----------------------------
-- Table structure for std_goods
-- ----------------------------
DROP TABLE IF EXISTS `std_goods`;
CREATE TABLE `std_goods` (
  `goods_id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品系列id(加密模型号)',
  `goods_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `region_code` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `region_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `price_info` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '价格描述',
  `group_flag` tinyint(1) DEFAULT NULL COMMENT '组合商品标识(1:是组合商品 0：不是)',
  `up_down_flag` tinyint(1) DEFAULT '1' COMMENT '1:上架 0：下架',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of std_goods
-- ----------------------------
INSERT INTO `std_goods` VALUES ('2f1a87e21647cb34b7c5ddcff0315cf3', '200401', '吉林地图', '2200', '吉林', '1元起', '0', '1');
INSERT INTO `std_goods` VALUES ('4fd61be5bd65b2dbf0a31a17db4aac71', '200401', '黑龙江地图', '2300', '黑龙江', '1元起', '0', '1');
INSERT INTO `std_goods` VALUES ('7722c7920136f759da317c45831582c9', '200401', '辽宁地图', '2100', '辽宁', '1元起', '0', '1');
INSERT INTO `std_goods` VALUES ('f35d04af81dda755c319d70114caa9e3', '200401', '东北大区地图', '2000', '东北大区', '3元起', '1', '1');

-- ----------------------------
-- Table structure for std_goods_combo
-- ----------------------------
DROP TABLE IF EXISTS `std_goods_combo`;
CREATE TABLE `std_goods_combo` (
  `combo_id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `goods_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `combo_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `years` int(11) DEFAULT NULL COMMENT '年限',
  `nums` int(11) DEFAULT NULL COMMENT '次数',
  `recommend_flag` tinyint(1) DEFAULT '0' COMMENT '推荐标识(1:推荐)',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `combo_type` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '套餐类型(1:期限 2：次数 3：版本 )',
  `card_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '刮刮卡支付类型',
  PRIMARY KEY (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of std_goods_combo
-- ----------------------------
INSERT INTO `std_goods_combo` VALUES ('0f060e4d619a670d05761aa67f077be2', '7722c7920136f759da317c45831582c9', '辽宁地图1次', '-1', '1', '1', '100', '3', '刮刮卡支付类型');
INSERT INTO `std_goods_combo` VALUES ('1a57bd8a2e46701e392c4b41158b5008', '2f1a87e21647cb34b7c5ddcff0315cf3', '吉林地图1年', '1', '-1', '1', '100', '1', '刮刮卡支付类型');
INSERT INTO `std_goods_combo` VALUES ('2b0d2399864c5ac568aca7b9c2608fba', '2f1a87e21647cb34b7c5ddcff0315cf3', '吉林地图1次', '-1', '1', '1', '100', '3', '刮刮卡支付类型');
INSERT INTO `std_goods_combo` VALUES ('34079154c162f3f37027869b53f3f59a', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图1次', '-1', '1', '1', '300', '3', '刮刮卡支付类型');
INSERT INTO `std_goods_combo` VALUES ('527d06f5d36e415da9bd864488446573', '4fd61be5bd65b2dbf0a31a17db4aac71', '黑龙江地图1次', '-1', '1', '1', '100', '3', '刮刮卡支付类型');
INSERT INTO `std_goods_combo` VALUES ('98593369d3391884a9f62ed05800bbdd', '4fd61be5bd65b2dbf0a31a17db4aac71', '黑龙江地图1年', '1', '-1', '1', '100', '1', '刮刮卡支付类型');
INSERT INTO `std_goods_combo` VALUES ('c448d8575ac995d1012ed560b4aa6bd8', '7722c7920136f759da317c45831582c9', '辽宁地图1年', '1', '-1', '1', '100', '1', '刮刮卡支付类型');
INSERT INTO `std_goods_combo` VALUES ('c9130e73fbd5fb40ce0b8719ed5ebd1a', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图1年', '1', '-1', '1', '300', '1', '刮刮卡支付类型');

-- ----------------------------
-- Table structure for std_goods_group
-- ----------------------------
DROP TABLE IF EXISTS `std_goods_group`;
CREATE TABLE `std_goods_group` (
  `goods_pid` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '主商品id',
  `goods_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '子商品id',
  PRIMARY KEY (`goods_pid`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of std_goods_group
-- ----------------------------
INSERT INTO `std_goods_group` VALUES ('f35d04af81dda755c319d70114caa9e3', '2f1a87e21647cb34b7c5ddcff0315cf3');
INSERT INTO `std_goods_group` VALUES ('f35d04af81dda755c319d70114caa9e3', '4fd61be5bd65b2dbf0a31a17db4aac71');
INSERT INTO `std_goods_group` VALUES ('f35d04af81dda755c319d70114caa9e3', '7722c7920136f759da317c45831582c9');

-- ----------------------------
-- Table structure for std_order
-- ----------------------------
DROP TABLE IF EXISTS `std_order`;
CREATE TABLE `std_order` (
  `order_id` varchar(32) NOT NULL COMMENT '订单ID',
  `total_fee` int(11) DEFAULT NULL COMMENT '订单金额',
  `cash_fee` int(11) DEFAULT NULL COMMENT '实收金额',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `device_no` varchar(32) DEFAULT NULL COMMENT '车机原始系列号',
  `del_flag` varchar(5) DEFAULT NULL COMMENT '是否逻辑删除(0:删除 1：使用)',
  `payment_mode_id` varchar(32) DEFAULT NULL COMMENT '支付方式id',
  `order_state_id` int(11) DEFAULT NULL COMMENT '订单状态id',
  `trade_state` varchar(50) DEFAULT NULL COMMENT '订单状态 SUCCESS—支付成功，REFUND—转入退款，NOTPAY—未支付，CLOSED—已关闭，REVOKED—已撤销，USERPAYING--用户支付中，PAYERROR--支付失败(其他原因，如银行返回失败)',
  `card_type` varchar(32) DEFAULT NULL COMMENT '刮刮卡支付类型',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of std_order
-- ----------------------------
INSERT INTO `std_order` VALUES ('08b60c6006e85cbe29bf902d1ab6866a', '300', '300', '2015-12-29 15:47:50', '2016-01-18 17:16:36', '123', '1', 'alipay', '2', '100', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('1366d6bc89713b4c609c85203efef125', '300', '300', '2015-12-29 14:48:55', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('1e8ab3baab6f00956765117710d6fd00', '300', '300', '2015-12-29 15:05:25', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('358f4a8a95f6239d5eab02738b6d06af', '300', '300', '2015-12-29 15:17:08', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('35ad037c7d932df2495b36958b3fb2a8', '300', '300', '2015-12-29 14:46:58', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('3d47d4100bdf58037c63ffa5361da88f', '300', '300', '2015-12-29 14:45:14', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('532e377bf699995c2b8c81deddd0201d', '300', '300', '2015-12-29 14:25:39', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('57a74f4c0d45b4496ac260c49abd703f', '300', '300', '2015-12-29 15:18:20', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('5aef09f4f9dc845268d9e734a48b9c23', '300', '300', '2015-12-29 14:29:00', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('5b05eac3a083bd12c0c46c52b3d2e1f3', '300', '300', '2015-12-29 14:47:16', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('71f64c4ba9d9d69ad07239380265be33', '300', '300', '2015-12-29 14:18:05', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('76daa1b3fa66f9c2d60ec5145c27eb60', '300', '300', '2015-12-29 15:20:56', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('90737724a732d7982c867a991482b250', '100', '100', '2016-01-18 10:08:14', null, '1001', '1', 'card', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('9084e5457016b52ce6b37df5f01fbd60', '300', '300', '2015-12-29 15:48:16', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('9dbfca83e94ae1be05a4e26e8b0da832', '300', '300', '2015-12-29 15:48:55', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('a4a00aed32878c13e2151175715d1782', '300', '300', '2015-12-29 14:48:57', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('a7a54cb3fe6fabe79cffc34b62f49890', '300', '300', '2015-12-29 15:29:24', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('ae4473688ecbf27191c018e86ff58569', '300', '300', '2015-12-29 15:08:24', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('b1b8348c3d6fbbdc629af6d3131956f3', '300', '300', '2015-12-29 15:24:44', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('b85396e3eae0e4593adb286629eeee28', '100', '100', '2016-01-18 10:05:52', null, '1001', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('bc4ba97eec21b6a866142f3a963d256c', '300', '300', '2015-12-29 14:14:12', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('cb360e40d008ba160d8c22a536e46009', '100', '100', '2016-01-18 10:07:31', null, '1001', '1', 'card', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('ce46f814ae56feb39ea95463e6883dd6', '300', '300', '2015-12-29 14:46:37', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('d37b2d68efe24d09ffdf0b3b924f6d2f', '300', '300', '2015-12-29 14:46:02', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('e78e5334c9cd0e5128690052050403bd', '300', '300', '2015-12-29 15:23:42', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('e89183d7f71c4849ff5235a888dc086e', '300', '300', '2015-12-29 15:48:39', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('f564735dabca6be6114bcfcf89486412', '300', '300', '2015-12-29 14:22:58', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('fcfb7148e01efaaace4c331d90ec1dfc', '300', '300', '2015-12-29 15:49:10', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');
INSERT INTO `std_order` VALUES ('fd97041c71c31ee72812bdbbe23ae307', '300', '300', '2015-12-29 14:44:04', null, '123', '1', 'alipay', '1', 'NOTPAY', '刮刮卡支付类型');

-- ----------------------------
-- Table structure for std_order_item
-- ----------------------------
DROP TABLE IF EXISTS `std_order_item`;
CREATE TABLE `std_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详细ID',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单ID',
  `product_id` varchar(32) DEFAULT NULL COMMENT '产品系列',
  `device_no` varchar(32) DEFAULT NULL COMMENT '车机UUID',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `valid` int(11) DEFAULT NULL COMMENT '有效期',
  `nums` int(11) DEFAULT NULL COMMENT '次数',
  `data_ver` varchar(64) DEFAULT NULL COMMENT '数据版本号',
  `region_ids` varchar(200) DEFAULT NULL COMMENT '区域ID',
  `region_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `goods_price` int(11) DEFAULT NULL COMMENT '商品单价',
  `goods_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `cash_fee` int(11) DEFAULT NULL COMMENT '支付金额',
  `combo_id` varchar(32) DEFAULT NULL COMMENT '套餐ID',
  `combo_name` varchar(100) DEFAULT NULL COMMENT '套餐名称',
  `combo_type` varchar(10) DEFAULT NULL COMMENT '套餐类型(1:期限 2：版本 3：次数 )',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=699 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of std_order_item
-- ----------------------------
INSERT INTO `std_order_item` VALUES ('670', 'bc4ba97eec21b6a866142f3a963d256c', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '-1', '1', '123', '2200,2300,2100', '东北大区', '300', '1', '300', '34079154c162f3f37027869b53f3f59a', '东北大区地图1次', '3');
INSERT INTO `std_order_item` VALUES ('671', '71f64c4ba9d9d69ad07239380265be33', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '-1', '1', '123', '2200,2300,2100', '东北大区', '300', '1', '300', '34079154c162f3f37027869b53f3f59a', '东北大区地图1次', '3');
INSERT INTO `std_order_item` VALUES ('672', 'f564735dabca6be6114bcfcf89486412', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '-1', '1', '123', '2200,2300,2100', '东北大区', '300', '1', '300', '34079154c162f3f37027869b53f3f59a', '东北大区地图1次', '3');
INSERT INTO `std_order_item` VALUES ('673', '532e377bf699995c2b8c81deddd0201d', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '-1', '1', '123', '2200,2300,2100', '东北大区', '300', '1', '300', '34079154c162f3f37027869b53f3f59a', '东北大区地图1次', '3');
INSERT INTO `std_order_item` VALUES ('674', '5aef09f4f9dc845268d9e734a48b9c23', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '-1', '1', '123', '2200,2300,2100', '东北大区', '300', '1', '300', '34079154c162f3f37027869b53f3f59a', '东北大区地图1次', '3');
INSERT INTO `std_order_item` VALUES ('675', 'fd97041c71c31ee72812bdbbe23ae307', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '-1', '1', '123', '2200,2300,2100', '东北大区', '300', '1', '300', '34079154c162f3f37027869b53f3f59a', '东北大区地图1次', '3');
INSERT INTO `std_order_item` VALUES ('676', '3d47d4100bdf58037c63ffa5361da88f', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '-1', '1', '123', '2200,2300,2100', '东北大区', '300', '1', '300', '34079154c162f3f37027869b53f3f59a', '东北大区地图1次', '3');
INSERT INTO `std_order_item` VALUES ('677', 'd37b2d68efe24d09ffdf0b3b924f6d2f', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '-1', '1', '456', '2200,2300,2100', '东北大区', '300', '1', '300', '34079154c162f3f37027869b53f3f59a', '东北大区地图1次', '3');
INSERT INTO `std_order_item` VALUES ('678', 'ce46f814ae56feb39ea95463e6883dd6', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('679', '35ad037c7d932df2495b36958b3fb2a8', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('680', '5b05eac3a083bd12c0c46c52b3d2e1f3', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('681', '1366d6bc89713b4c609c85203efef125', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('682', 'a4a00aed32878c13e2151175715d1782', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('683', '1e8ab3baab6f00956765117710d6fd00', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('684', 'ae4473688ecbf27191c018e86ff58569', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('685', '358f4a8a95f6239d5eab02738b6d06af', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('686', '57a74f4c0d45b4496ac260c49abd703f', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('687', '76daa1b3fa66f9c2d60ec5145c27eb60', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('688', 'e78e5334c9cd0e5128690052050403bd', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('689', 'b1b8348c3d6fbbdc629af6d3131956f3', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('690', 'a7a54cb3fe6fabe79cffc34b62f49890', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('691', '08b60c6006e85cbe29bf902d1ab6866a', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('692', '9084e5457016b52ce6b37df5f01fbd60', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('693', 'e89183d7f71c4849ff5235a888dc086e', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('694', '9dbfca83e94ae1be05a4e26e8b0da832', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('695', 'fcfb7148e01efaaace4c331d90ec1dfc', '200401', '123', 'f35d04af81dda755c319d70114caa9e3', '东北大区地图', '1', '-1', '', '2200,2300,2100', '东北大区', '300', '1', '300', 'c9130e73fbd5fb40ce0b8719ed5ebd1a', '东北大区地图1年', '1');
INSERT INTO `std_order_item` VALUES ('696', 'b85396e3eae0e4593adb286629eeee28', '200401', '1001', '2f1a87e21647cb34b7c5ddcff0315cf3', '吉林地图', '1', '-1', 'T04.8003.02.09.01.00-15.02.01-01-N', '2200', '吉林', '100', '1', '100', '1a57bd8a2e46701e392c4b41158b5008', '吉林地图1年', '1');
INSERT INTO `std_order_item` VALUES ('697', 'cb360e40d008ba160d8c22a536e46009', '200401', '1001', '2f1a87e21647cb34b7c5ddcff0315cf3', '吉林地图', '1', '-1', 'T04.8003.02.09.01.00-15.02.01-01-N', '2200', '吉林', '100', '1', '100', '1a57bd8a2e46701e392c4b41158b5008', '吉林地图1年', '1');
INSERT INTO `std_order_item` VALUES ('698', '90737724a732d7982c867a991482b250', '200401', '1001', '2f1a87e21647cb34b7c5ddcff0315cf3', '吉林地图', '1', '-1', 'T04.8003.02.09.01.00-15.02.01-01-N', '2200', '吉林', '100', '1', '100', '1a57bd8a2e46701e392c4b41158b5008', '吉林地图1年', '1');

-- ----------------------------
-- Table structure for std_order_state
-- ----------------------------
DROP TABLE IF EXISTS `std_order_state`;
CREATE TABLE `std_order_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(32) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of std_order_state
-- ----------------------------
INSERT INTO `std_order_state` VALUES ('1', '未支付');
INSERT INTO `std_order_state` VALUES ('2', '已支付');
INSERT INTO `std_order_state` VALUES ('3', '已关闭');
INSERT INTO `std_order_state` VALUES ('4', '已过期');

-- ----------------------------
-- Table structure for std_payment_mode
-- ----------------------------
DROP TABLE IF EXISTS `std_payment_mode`;
CREATE TABLE `std_payment_mode` (
  `mode_id` varchar(32) NOT NULL COMMENT '支付方式id',
  `mode_name` varchar(64) DEFAULT NULL COMMENT '名称',
  `mode_description` varchar(100) DEFAULT NULL COMMENT '提示语',
  PRIMARY KEY (`mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of std_payment_mode
-- ----------------------------
INSERT INTO `std_payment_mode` VALUES ('alipay', '支付宝支付', '支付宝支付');
INSERT INTO `std_payment_mode` VALUES ('cardpay', '刮刮卡支付', '刮刮卡支付');
INSERT INTO `std_payment_mode` VALUES ('other', '其他方式支付', '其他方式支付');
INSERT INTO `std_payment_mode` VALUES ('upcash', '银行卡支付', '银行卡支付');
INSERT INTO `std_payment_mode` VALUES ('visa', '信用卡支付', '信用卡支付');
INSERT INTO `std_payment_mode` VALUES ('wechat', '微信支付', '微信支付');

-- ----------------------------
-- Table structure for std_product_payment
-- ----------------------------
DROP TABLE IF EXISTS `std_product_payment`;
CREATE TABLE `std_product_payment` (
  `product_id` varchar(32) NOT NULL,
  `mode_id` varchar(32) NOT NULL,
  PRIMARY KEY (`product_id`,`mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of std_product_payment
-- ----------------------------
INSERT INTO `std_product_payment` VALUES ('200401', 'alipay');
INSERT INTO `std_product_payment` VALUES ('200401', 'cardpay');
INSERT INTO `std_product_payment` VALUES ('200401', 'wechat');

-- ----------------------------
-- Table structure for std_soft_ver
-- ----------------------------
DROP TABLE IF EXISTS `std_soft_ver`;
CREATE TABLE `std_soft_ver` (
  `soft_ver` varchar(64) NOT NULL,
  `soft_name` varchar(100) NOT NULL,
  PRIMARY KEY (`soft_ver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of std_soft_ver
-- ----------------------------
INSERT INTO `std_soft_ver` VALUES ('123', '123');
INSERT INTO `std_soft_ver` VALUES ('3242', '2352');
INSERT INTO `std_soft_ver` VALUES ('T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', '123123');

-- ----------------------------
-- Table structure for te_alipay_payment_account
-- ----------------------------
DROP TABLE IF EXISTS `te_alipay_payment_account`;
CREATE TABLE `te_alipay_payment_account` (
  `product_id` varchar(32) NOT NULL COMMENT '产品系列',
  `app_id` varchar(64) DEFAULT NULL COMMENT '服务窗appId',
  `alipay_public_key` varchar(250) DEFAULT NULL COMMENT '支付宝公钥-从支付宝服务窗获取',
  `sign_charset` varchar(32) DEFAULT NULL COMMENT '签名编码-视支付宝服务窗要求',
  `charset` varchar(32) DEFAULT NULL COMMENT '字符编码-传递给支付宝的数据编码',
  `sign_type` varchar(32) DEFAULT NULL COMMENT '签名类型-视支付宝服务窗要求',
  `partner` varchar(64) DEFAULT NULL,
  `private_key` varchar(1000) DEFAULT NULL COMMENT '私钥',
  `public_key` varchar(250) DEFAULT NULL COMMENT '公钥',
  `alipay_gateway` varchar(250) DEFAULT NULL COMMENT '支付宝网关',
  `grant_type` varchar(64) DEFAULT NULL COMMENT '授权访问令牌的授权类型',
  `notify_url` varchar(200) DEFAULT NULL COMMENT '支付回调函数路径',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_alipay_payment_account
-- ----------------------------
INSERT INTO `te_alipay_payment_account` VALUES ('100010', '2015080600202210', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB', 'UTF-8', 'UTF-8', 'RSA', '2088311756540859', 'MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMhy136kXJahDh8mmmm9ivQrI0Hsl7L19JN7VWusumvQoz8G6tKn95miCQdELzzRDjGUP3K3fbSh5beYjlhjGWThH4JQwN5H2XldMjJ8494Ng+7W8jKqHN38DYQ22Vn8ZBlVWLUHsLs6jpjENAOVbr1beyqKc0E8yLDPTGBfmumnAgMBAAECgYBsDkSO14m2BbI4JrY85FnA0HRcOG96oM4spuLgfaetMTafZlo2HygBoPDfAum4DjZpkbI2ZCYWtuO/+jRZ/2oTGtwdljYkpweGUBXF80w89u1v/ueRGFNwavDY77xg1FpwMyW4U+nofLaxG1J6fW+W17/Tb3p3KmzGRuJ+lZBoUQJBAP3T4Cd6MX7GLFDA09kiHKtpVaE26SEQ6x7HQLs0DHcMNQ4GbjP1slTRFPUoHeKMSyZoUvCc0aSMOYbBkymGq38CQQDKKgPlLbLItjiutKv/0W8o4p132U0HXYVMqv5X0YAYBpBdGp2JlC2JbDqHNCTT+izheDyNaUKrUNgnFL5bLfXZAkBEd7iJLY7YUYB2r+z1LxxoqFsux28POk8R2FF/rcSHAEX3aIilf2sBMfzjPFUDXTCQRafJu6NZLXH/BYw6sVblAkEAjEc5KrZZ/0HJ9Rgy3TDTBDiy8W2cMIcpLrjcAc3CJ2mulJwaQlPKgTfTKOv6vggzSkRnJ+ypMTzIr92J9LTgiQJBAIv8O/4EBojUoSR8q2d6sOEcEm+sLmKR0g1dWgyM3B6R3+oAlztJoAPki80/kbWwELLrA+JmuIUXMy2cTrj2XlE=', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB', 'https://openapi.alipay.com/gateway.do', 'authorization_code', 'http://61.161.201.201:8160/mx_mazda_auth/pay/getAlipayNotify');
INSERT INTO `te_alipay_payment_account` VALUES ('200401', '2015080600202210', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB', 'UTF-8', 'UTF-8', 'RSA', '2088311756540859', 'MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMhy136kXJahDh8mmmm9ivQrI0Hsl7L19JN7VWusumvQoz8G6tKn95miCQdELzzRDjGUP3K3fbSh5beYjlhjGWThH4JQwN5H2XldMjJ8494Ng+7W8jKqHN38DYQ22Vn8ZBlVWLUHsLs6jpjENAOVbr1beyqKc0E8yLDPTGBfmumnAgMBAAECgYBsDkSO14m2BbI4JrY85FnA0HRcOG96oM4spuLgfaetMTafZlo2HygBoPDfAum4DjZpkbI2ZCYWtuO/+jRZ/2oTGtwdljYkpweGUBXF80w89u1v/ueRGFNwavDY77xg1FpwMyW4U+nofLaxG1J6fW+W17/Tb3p3KmzGRuJ+lZBoUQJBAP3T4Cd6MX7GLFDA09kiHKtpVaE26SEQ6x7HQLs0DHcMNQ4GbjP1slTRFPUoHeKMSyZoUvCc0aSMOYbBkymGq38CQQDKKgPlLbLItjiutKv/0W8o4p132U0HXYVMqv5X0YAYBpBdGp2JlC2JbDqHNCTT+izheDyNaUKrUNgnFL5bLfXZAkBEd7iJLY7YUYB2r+z1LxxoqFsux28POk8R2FF/rcSHAEX3aIilf2sBMfzjPFUDXTCQRafJu6NZLXH/BYw6sVblAkEAjEc5KrZZ/0HJ9Rgy3TDTBDiy8W2cMIcpLrjcAc3CJ2mulJwaQlPKgTfTKOv6vggzSkRnJ+ypMTzIr92J9LTgiQJBAIv8O/4EBojUoSR8q2d6sOEcEm+sLmKR0g1dWgyM3B6R3+oAlztJoAPki80/kbWwELLrA+JmuIUXMy2cTrj2XlE=', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB', 'https://openapi.alipay.com/gateway.do', 'authorization_code', 'http://61.161.201.201:8174/mx_device_shop/std/pay/getAlipayNotify');

-- ----------------------------
-- Table structure for te_group
-- ----------------------------
DROP TABLE IF EXISTS `te_group`;
CREATE TABLE `te_group` (
  `group_id` varchar(32) NOT NULL,
  `group_name` varchar(32) DEFAULT NULL,
  `buildin` tinyint(1) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_group
-- ----------------------------
INSERT INTO `te_group` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '1', '0', '1', '2016-01-30 11:24:09');
INSERT INTO `te_group` VALUES ('53837bccaf7eeb658efa23accd27016a', '马自达', '0', '马自达', '2016-02-02 19:41:37');

-- ----------------------------
-- Table structure for te_group_user
-- ----------------------------
DROP TABLE IF EXISTS `te_group_user`;
CREATE TABLE `te_group_user` (
  `group_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_group_user
-- ----------------------------
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '5a61a8840c556f504a9c2d687bd07771');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '93dc5d1d794afe010e50414c97f9088a');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '18703098aaa9d75ebb0c18839307a5b0');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '834d0be008364528085be366b9ef447a');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', 'fcc8ebe3beb52cee08c1ca79172694ef');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '093d477b2955704596a255c14aade539');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', 'b627c87cf9717c35ee7aeb96536caf8d');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', 'f6cc42561f22b1417c72ce830a2282c9');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '67a02b15c0cbb9f78635aeb3b0552a57');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '23b3141414c3b7fc494d005d38481f78');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '3d4ad2a16f86bbb0530135711012da95');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', 'adfa460d261fc539eb6cbe50b4706a0b');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', 'b2386ab74ed55ba419c3f9c13d417765');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '88522516e9571752ec783f587a076a7e');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '5a0f55c5bc0eba22066b2cae7647d6c0');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', 'e6729c26203f36bb4d2cd77cb6ccebdb');
INSERT INTO `te_group_user` VALUES ('53837bccaf7eeb658efa23accd27016a', 'beb602e549fb18e671bcee339d9028fa');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', 'beb602e549fb18e671bcee339d9028fa');
INSERT INTO `te_group_user` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '8352c0fea7480281e80cd5ac30e3c23f');
INSERT INTO `te_group_user` VALUES ('53837bccaf7eeb658efa23accd27016a', '3ab25faef2a666bad1b7e4d69ced3cf4');
INSERT INTO `te_group_user` VALUES ('', 'a0785e6545825b34803ec20b508027a4');
INSERT INTO `te_group_user` VALUES ('', '30bd53967f0fdeffbef7cf334ecb1320');
INSERT INTO `te_group_user` VALUES ('', 'fd1d7ff58773b673dd69868d76df822b');

-- ----------------------------
-- Table structure for te_menus
-- ----------------------------
DROP TABLE IF EXISTS `te_menus`;
CREATE TABLE `te_menus` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(600) DEFAULT NULL,
  `parentid` varchar(32) DEFAULT NULL,
  `menu_type` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL COMMENT 'OPEN CLOSE',
  `sort` int(10) DEFAULT NULL COMMENT '菜单排序',
  `treedeep` text COMMENT '树形结构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_menus
-- ----------------------------
INSERT INTO `te_menus` VALUES ('062970b3823e1458a6392344a6cd8765', 'TSP服务订单查询', 'html/tsp.html', '17f114eaa5f3c2a37dc11be997ab9003', 'CONTEXT', null, '5', '0:17f114eaa5f3c2a37dc11be997ab9003');
INSERT INTO `te_menus` VALUES ('06a83d2890e251f86e4fa7be3010de0c', '生产激活管理', '', '0', 'CONTEXT', null, '4', '0');
INSERT INTO `te_menus` VALUES ('08777e577e22c038a4b7740e9f26faaa', 'T10订单管理', '', 'd703a4c4df7c35163b6e4a4cdeee7d3b', 'CONTEXT', null, '4', '0:d703a4c4df7c35163b6e4a4cdeee7d3b');
INSERT INTO `te_menus` VALUES ('1', '系统管理', null, '0', 'CONTEXT', 'open', '1', '0');
INSERT INTO `te_menus` VALUES ('17f114eaa5f3c2a37dc11be997ab9003', '鉴权数据管理', '', '0', 'CONTEXT', null, '5', '0');
INSERT INTO `te_menus` VALUES ('1a19f67be4afbc2c3549a3d0f68a9bd5', '交易支付管理', '', '0', 'CONTEXT', null, '6', '0');
INSERT INTO `te_menus` VALUES ('1a3b35b3393341a59534a3a967751fdf', '车机信息管理', 'html/deviceInfo.html', '06a83d2890e251f86e4fa7be3010de0c', 'CONTEXT', null, '3', '0:06a83d2890e251f86e4fa7be3010de0c');
INSERT INTO `te_menus` VALUES ('1a59312cc129384afa4700055faa12b5', '马自达', 'mazda', 'ab401698364bde74cb2e78dca0ed9073', 'CONTEXT', null, '1', '0:ab401698364bde74cb2e78dca0ed9073');
INSERT INTO `te_menus` VALUES ('1c65489b541cb9d3fe0b03ad5957969f', 'T10商品管理', 'html/t10/goods.html', 'd703a4c4df7c35163b6e4a4cdeee7d3b', 'CONTEXT', null, '1', '0:d703a4c4df7c35163b6e4a4cdeee7d3b');
INSERT INTO `te_menus` VALUES ('2306126245174f75e453cb1a1545bc70', '用户管理', 'html/camUser.html', '1', 'CONTEXT', null, '3', '0:1');
INSERT INTO `te_menus` VALUES ('2a510615f784c178fc56dde3f41f5961', 'T10数据版本管理', '', 'd703a4c4df7c35163b6e4a4cdeee7d3b', 'CONTEXT', null, '3', '0:d703a4c4df7c35163b6e4a4cdeee7d3b');
INSERT INTO `te_menus` VALUES ('4168ae48faecd36cddff724c39fdf1f1', '鉴权订单', 'html/authOrder.html', '17f114eaa5f3c2a37dc11be997ab9003', 'CONTEXT', null, '3', '0:17f114eaa5f3c2a37dc11be997ab9003');
INSERT INTO `te_menus` VALUES ('4e71d2a9b5bd136f7cedaf525b32aef1', '订单管理', 'html/order.html', '1a19f67be4afbc2c3549a3d0f68a9bd5', 'CONTEXT', null, '2', '0:1a19f67be4afbc2c3549a3d0f68a9bd5');
INSERT INTO `te_menus` VALUES ('5', '菜单管理', 'html/menu.html', '1', 'CONTEXT', null, '1', '0:1');
INSERT INTO `te_menus` VALUES ('59bc607d731d1246a42e2ce37818b8c8', '产品系列管理', 'html/moduleInfo.html', '06a83d2890e251f86e4fa7be3010de0c', 'CONTEXT', null, '2', '0:06a83d2890e251f86e4fa7be3010de0c');
INSERT INTO `te_menus` VALUES ('5f569ae872a0f672f23a1d0d25d04e6a', '激活记录', 'html/activeLogInfo.html', '06a83d2890e251f86e4fa7be3010de0c', 'CONTEXT', null, '4', '0:06a83d2890e251f86e4fa7be3010de0c');
INSERT INTO `te_menus` VALUES ('70802cb722ad5b1e38d2f922c3fe96e1', '角色管理', 'html/role.html', '1', 'CONTEXT', null, '2', '0:1');
INSERT INTO `te_menus` VALUES ('781a7e881be6199ac48d3a4735130adb', '支付方式管理', 'paymentMode/getPaymentMode', '5d763555ba2996884db9f38f598a894a', 'CONTEXT', null, '6', '0:5d763555ba2996884db9f38f598a894a');
INSERT INTO `te_menus` VALUES ('790d3af48640c12b280869baef4cb030', '升级权限查询', 'html/ndsAuth.html', '17f114eaa5f3c2a37dc11be997ab9003', 'CONTEXT', null, '1', '0:17f114eaa5f3c2a37dc11be997ab9003');
INSERT INTO `te_menus` VALUES ('7edeac8ca4a1fc4b86fd007cd9779fbb', 'TSP服务权限查询', 'html/tspAuth.html', '17f114eaa5f3c2a37dc11be997ab9003', 'CONTEXT', null, '6', '0:17f114eaa5f3c2a37dc11be997ab9003');
INSERT INTO `te_menus` VALUES ('86000599dcafedd61f70f8360752d3e8', '商品类别', 'html/catagory.html', '1a19f67be4afbc2c3549a3d0f68a9bd5', 'CONTEXT', null, '3', '0:1a19f67be4afbc2c3549a3d0f68a9bd5');
INSERT INTO `te_menus` VALUES ('8e9c8b6ae0d0e1738a61159cdc191537', '用户组管理', 'html/userGroup.html', '1', 'CONTEXT', null, '4', '0:1');
INSERT INTO `te_menus` VALUES ('9338eee6c00bca668221898fd6d11a21', 'T10软件版本管理', '', 'd703a4c4df7c35163b6e4a4cdeee7d3b', 'CONTEXT', null, '2', '0:d703a4c4df7c35163b6e4a4cdeee7d3b');
INSERT INTO `te_menus` VALUES ('97f186cb13d4f3d2478dbbc6ca30818b', '商品管理', 'html/goods.html', '1a19f67be4afbc2c3549a3d0f68a9bd5', 'CONTEXT', null, '1', '0:1a19f67be4afbc2c3549a3d0f68a9bd5');
INSERT INTO `te_menus` VALUES ('ab401698364bde74cb2e78dca0ed9073', '厂商', '', '0', 'CONTEXT', null, '8', '0');
INSERT INTO `te_menus` VALUES ('bee57438841942c2bc79e0a11f750a01', '加密库管理', 'html/encryption.html', '06a83d2890e251f86e4fa7be3010de0c', 'CONTEXT', null, '1', '0:06a83d2890e251f86e4fa7be3010de0c');
INSERT INTO `te_menus` VALUES ('ca08367f1f49da80a1fdbbfff45dbb4c', '数据版本管理', 'html/dataVerInfo.html', '06a83d2890e251f86e4fa7be3010de0c', 'CONTEXT', null, '6', '0:06a83d2890e251f86e4fa7be3010de0c');
INSERT INTO `te_menus` VALUES ('d11927b284c8edf237f96b798aa9abed', '最高升级版本查询', 'html/ndsDataVer.html', '17f114eaa5f3c2a37dc11be997ab9003', 'CONTEXT', null, '2', '0:17f114eaa5f3c2a37dc11be997ab9003');
INSERT INTO `te_menus` VALUES ('d703a4c4df7c35163b6e4a4cdeee7d3b', 'T10后台管理', '', '0', 'CONTEXT', null, '7', '0');
INSERT INTO `te_menus` VALUES ('e77438842cb07fa04b02254ba64ed3a4', '软件版本管理', 'html/softVerInfo.html', '06a83d2890e251f86e4fa7be3010de0c', 'CONTEXT', null, '5', '0:06a83d2890e251f86e4fa7be3010de0c');
INSERT INTO `te_menus` VALUES ('f767fa8f6b05a9b8e7caa31d59229d23', '销售激活订单', 'html/ndsDataSellActiveAuth.html', '17f114eaa5f3c2a37dc11be997ab9003', 'CONTEXT', null, '4', '0:17f114eaa5f3c2a37dc11be997ab9003');

-- ----------------------------
-- Table structure for te_roles
-- ----------------------------
DROP TABLE IF EXISTS `te_roles`;
CREATE TABLE `te_roles` (
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `buildin` tinyint(1) DEFAULT NULL COMMENT '是否内建',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_roles
-- ----------------------------
INSERT INTO `te_roles` VALUES ('0', 'admin', '1', '管理员');
INSERT INTO `te_roles` VALUES ('3732d7aee4865acc1f22959767398990', '开发人员', '0', '');
INSERT INTO `te_roles` VALUES ('446f91c5e5a8af1ff18cdc642435d1c5', '马自达4S店', '0', '马自达4S店');
INSERT INTO `te_roles` VALUES ('9cae917e135b5a8072ed2efd85d4f062', 'mazda', '0', 'mazda');

-- ----------------------------
-- Table structure for te_user
-- ----------------------------
DROP TABLE IF EXISTS `te_user`;
CREATE TABLE `te_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户登录名',
  `user_fullname` varchar(50) DEFAULT NULL COMMENT '用户名',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `gender` varchar(50) DEFAULT NULL COMMENT '性别',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `user_pwd` varchar(64) DEFAULT NULL COMMENT '密码',
  `start_time` date DEFAULT NULL COMMENT '开户时间',
  `update_time` date DEFAULT NULL COMMENT '变更时间',
  `enable` tinyint(1) DEFAULT NULL COMMENT '1有效，0无效',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_user
-- ----------------------------
INSERT INTO `te_user` VALUES ('093d477b2955704596a255c14aade539', '23', '1', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('1', 'admin', '超级管理员', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2015-06-17', '2015-07-01', '1');
INSERT INTO `te_user` VALUES ('18703098aaa9d75ebb0c18839307a5b0', 'wyf', '王羽菲', 'wangyf@meixing.com', '18640068590', '女', '', 'e10adc3949ba59abbe56e057f20f883e', '2015-12-04', '2016-02-01', '1');
INSERT INTO `te_user` VALUES ('23b3141414c3b7fc494d005d38481f78', '123', '1', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-03', '0');
INSERT INTO `te_user` VALUES ('30bd53967f0fdeffbef7cf334ecb1320', '温尔', '温尔', '', '', '', '', '22c276a05aa7c90566ae2175bcc2a9b0', '2016-02-03', null, '1');
INSERT INTO `te_user` VALUES ('3ab25faef2a666bad1b7e4d69ced3cf4', '1', '12', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-03', '2016-02-03', '0');
INSERT INTO `te_user` VALUES ('3d4ad2a16f86bbb0530135711012da95', '1', '1', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-03', '0');
INSERT INTO `te_user` VALUES ('406071b5b1f028ad58c21c347927e35b', 'erer', 'erer', '', '', '', '', '2bbf803161deb1186defbefb8b4b0903', '2016-01-18', '2016-01-18', '0');
INSERT INTO `te_user` VALUES ('5a0f55c5bc0eba22066b2cae7647d6c0', '2', '2', '', '', '', '', 'c81e728d9d4c2f636f067f89cc14862c', '2016-02-01', '2016-02-03', '0');
INSERT INTO `te_user` VALUES ('5a61a8840c556f504a9c2d687bd07771', 's', '1', '', '', '', '', '03c7c0ace395d80182db07ae2c30f034', '2016-01-30', '2016-02-03', '0');
INSERT INTO `te_user` VALUES ('5e6162b6b5c3990ae9ebd4e19288fffb', 'zhangsan', '张三', '', '18640012451', '男', '沈阳市', 'e10adc3949ba59abbe56e057f20f883e', '2016-01-19', '2016-01-30', '1');
INSERT INTO `te_user` VALUES ('67a02b15c0cbb9f78635aeb3b0552a57', 'wer', 'wer', '', '', '', '', '22c276a05aa7c90566ae2175bcc2a9b0', '2016-02-01', '2016-02-03', '0');
INSERT INTO `te_user` VALUES ('834d0be008364528085be366b9ef447a', '23', '23', '', '', '', '', 'be83ab3ecd0db773eb2dc1b0a17836a1', '2016-02-01', '2016-02-03', '0');
INSERT INTO `te_user` VALUES ('8352c0fea7480281e80cd5ac30e3c23f', 'mazda', '沈阳新中联', '', '', '', '辽宁省沈阳市和平区胜利南街72号', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-03', '1');
INSERT INTO `te_user` VALUES ('84830747d3a848a4d4a45443b9081fc4', 'sunc', 'sunc', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '2016-01-26', '2016-01-30', '1');
INSERT INTO `te_user` VALUES ('88522516e9571752ec783f587a076a7e', '1', '1', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('8eac450d9cab2079f565fc02d846407d', 'sdfsdfsdfsdf', 'sdfsdfsdfsdf', '', '', '男', '', '73a90acaae2b1ccc0e969709665bc62f', '2016-01-18', '2016-01-18', '0');
INSERT INTO `te_user` VALUES ('93dc5d1d794afe010e50414c97f9088a', '1', '1', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('a0785e6545825b34803ec20b508027a4', '1', '1', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-03', null, '1');
INSERT INTO `te_user` VALUES ('adfa460d261fc539eb6cbe50b4706a0b', 'we', 'er', '', '', '', '', '818f9c45cfa30eeff277ef38bcbe9910', '2016-02-01', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('b2386ab74ed55ba419c3f9c13d417765', '12', '2', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('b627c87cf9717c35ee7aeb96536caf8d', '1', 'mazda', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('beb602e549fb18e671bcee339d9028fa', '陈志勇', '陈志勇', 'chenzy@meixing.com', '18640442562', '男', '啊算法发', 'e10adc3949ba59abbe56e057f20f883e', '2016-02-02', '2016-02-02', '1');
INSERT INTO `te_user` VALUES ('e6729c26203f36bb4d2cd77cb6ccebdb', 'wangyf', '王羽菲', '', '', '女', '', 'e7ab76fe87ebb40e527b72344f98344f', '2016-02-01', '2016-02-01', '1');
INSERT INTO `te_user` VALUES ('e787931168377851d0c0b2e4462cebb1', 'e', 'edf', '', '', '', '', 'e1671797c52e15f763380b45e841ec32', '2016-01-18', '2016-01-18', '0');
INSERT INTO `te_user` VALUES ('ea59e28065728af4fa39d04aadb6d559', '123', '123', '', '', '女', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-01-26', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('f6cc42561f22b1417c72ce830a2282c9', '2323', '2323', '', '', '', '', '149815eb972b3c370dee3b89d645ae14', '2016-02-01', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('fcc8ebe3beb52cee08c1ca79172694ef', '1', '1', '', '', '', '', 'c4ca4238a0b923820dcc509a6f75849b', '2016-02-01', '2016-02-01', '0');
INSERT INTO `te_user` VALUES ('fd1d7ff58773b673dd69868d76df822b', '23', '23', '', '', '', '', '37693cfc748049e45d87b8c7d8b9aacd', '2016-02-03', null, '1');

-- ----------------------------
-- Table structure for te_wechat_payment_account
-- ----------------------------
DROP TABLE IF EXISTS `te_wechat_payment_account`;
CREATE TABLE `te_wechat_payment_account` (
  `product_id` varchar(32) NOT NULL DEFAULT '' COMMENT '产品系列',
  `appid` varchar(64) DEFAULT NULL COMMENT '公众账号ID',
  `mch_id` varchar(64) DEFAULT NULL COMMENT '商户号',
  `device_info` varchar(64) DEFAULT NULL COMMENT '设备号',
  `attach` varchar(64) DEFAULT NULL COMMENT '附加数据',
  `spbill_create_ip` varchar(64) DEFAULT NULL COMMENT '终端IP',
  `goods_tag` varchar(32) DEFAULT NULL COMMENT '商品标记',
  `notify_url` varchar(256) DEFAULT NULL COMMENT '通知地址',
  `trade_type` varchar(32) DEFAULT NULL COMMENT '交易类型',
  `sign_key` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_wechat_payment_account
-- ----------------------------
INSERT INTO `te_wechat_payment_account` VALUES ('100010', 'wx39402ac04629d73a', '1237778202', '', '', '126.23.6.56', '', 'http://61.161.201.201:8160/mx_mazda_auth/pay/getNotify', 'NATIVE', '5D07F434B6271FAF32D542033CACDBDF');
INSERT INTO `te_wechat_payment_account` VALUES ('200401', 'wx39402ac04629d73a', '1237778202', '', '', '126.23.6.56', '', 'http://61.161.201.201:8174/mx_device_shop/std/pay/getWechatNotify', 'NATIVE', '5D07F434B6271FAF32D542033CACDBDF');

-- ----------------------------
-- Table structure for tr_authorities
-- ----------------------------
DROP TABLE IF EXISTS `tr_authorities`;
CREATE TABLE `tr_authorities` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tr_authorities
-- ----------------------------
INSERT INTO `tr_authorities` VALUES ('093d477b2955704596a255c14aade539', '9cae917e135b5a8072ed2efd85d4f062');
INSERT INTO `tr_authorities` VALUES ('1', '0');
INSERT INTO `tr_authorities` VALUES ('18703098aaa9d75ebb0c18839307a5b0', '0');
INSERT INTO `tr_authorities` VALUES ('18703098aaa9d75ebb0c18839307a5b0', '3732d7aee4865acc1f22959767398990');
INSERT INTO `tr_authorities` VALUES ('18703098aaa9d75ebb0c18839307a5b0', '9cae917e135b5a8072ed2efd85d4f062');
INSERT INTO `tr_authorities` VALUES ('23b3141414c3b7fc494d005d38481f78', '0');
INSERT INTO `tr_authorities` VALUES ('30bd53967f0fdeffbef7cf334ecb1320', '');
INSERT INTO `tr_authorities` VALUES ('33033a1d8195b732c680935a9e19828c', '3');
INSERT INTO `tr_authorities` VALUES ('33033a1d8195b732c680935a9e19828c', '6');
INSERT INTO `tr_authorities` VALUES ('3ab25faef2a666bad1b7e4d69ced3cf4', '9cae917e135b5a8072ed2efd85d4f062');
INSERT INTO `tr_authorities` VALUES ('3d4ad2a16f86bbb0530135711012da95', '');
INSERT INTO `tr_authorities` VALUES ('5a0f55c5bc0eba22066b2cae7647d6c0', '9cae917e135b5a8072ed2efd85d4f062');
INSERT INTO `tr_authorities` VALUES ('5a61a8840c556f504a9c2d687bd07771', '');
INSERT INTO `tr_authorities` VALUES ('5e6162b6b5c3990ae9ebd4e19288fffb', '');
INSERT INTO `tr_authorities` VALUES ('67a02b15c0cbb9f78635aeb3b0552a57', '');
INSERT INTO `tr_authorities` VALUES ('834d0be008364528085be366b9ef447a', '');
INSERT INTO `tr_authorities` VALUES ('8352c0fea7480281e80cd5ac30e3c23f', '446f91c5e5a8af1ff18cdc642435d1c5');
INSERT INTO `tr_authorities` VALUES ('84830747d3a848a4d4a45443b9081fc4', '');
INSERT INTO `tr_authorities` VALUES ('88522516e9571752ec783f587a076a7e', '0');
INSERT INTO `tr_authorities` VALUES ('93dc5d1d794afe010e50414c97f9088a', '');
INSERT INTO `tr_authorities` VALUES ('a0785e6545825b34803ec20b508027a4', '');
INSERT INTO `tr_authorities` VALUES ('adfa460d261fc539eb6cbe50b4706a0b', '');
INSERT INTO `tr_authorities` VALUES ('b2386ab74ed55ba419c3f9c13d417765', '0');
INSERT INTO `tr_authorities` VALUES ('b627c87cf9717c35ee7aeb96536caf8d', '');
INSERT INTO `tr_authorities` VALUES ('beb602e549fb18e671bcee339d9028fa', '446f91c5e5a8af1ff18cdc642435d1c5');
INSERT INTO `tr_authorities` VALUES ('e6729c26203f36bb4d2cd77cb6ccebdb', '9cae917e135b5a8072ed2efd85d4f062');
INSERT INTO `tr_authorities` VALUES ('ea59e28065728af4fa39d04aadb6d559', '0');
INSERT INTO `tr_authorities` VALUES ('f6cc42561f22b1417c72ce830a2282c9', '');
INSERT INTO `tr_authorities` VALUES ('fcc8ebe3beb52cee08c1ca79172694ef', '');
INSERT INTO `tr_authorities` VALUES ('fd1d7ff58773b673dd69868d76df822b', '');

-- ----------------------------
-- Table structure for tr_group_role
-- ----------------------------
DROP TABLE IF EXISTS `tr_group_role`;
CREATE TABLE `tr_group_role` (
  `group_id` varchar(32) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tr_group_role
-- ----------------------------
INSERT INTO `tr_group_role` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '9cae917e135b5a8072ed2efd85d4f062');
INSERT INTO `tr_group_role` VALUES ('e99244f9c99b3083ea6c04a5157af8ae', '3732d7aee4865acc1f22959767398990');

-- ----------------------------
-- Table structure for tr_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tr_role_menu`;
CREATE TABLE `tr_role_menu` (
  `role_id` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tr_role_menu
-- ----------------------------
INSERT INTO `tr_role_menu` VALUES ('0', '06a83d2890e251f86e4fa7be3010de0c');
INSERT INTO `tr_role_menu` VALUES ('0', '08777e577e22c038a4b7740e9f26faaa');
INSERT INTO `tr_role_menu` VALUES ('0', '1');
INSERT INTO `tr_role_menu` VALUES ('0', '17f114eaa5f3c2a37dc11be997ab9003');
INSERT INTO `tr_role_menu` VALUES ('0', '1a19f67be4afbc2c3549a3d0f68a9bd5');
INSERT INTO `tr_role_menu` VALUES ('0', '1a3b35b3393341a59534a3a967751fdf');
INSERT INTO `tr_role_menu` VALUES ('0', '1c65489b541cb9d3fe0b03ad5957969f');
INSERT INTO `tr_role_menu` VALUES ('0', '2306126245174f75e453cb1a1545bc70');
INSERT INTO `tr_role_menu` VALUES ('0', '2a510615f784c178fc56dde3f41f5961');
INSERT INTO `tr_role_menu` VALUES ('0', '4168ae48faecd36cddff724c39fdf1f1');
INSERT INTO `tr_role_menu` VALUES ('0', '4e71d2a9b5bd136f7cedaf525b32aef1');
INSERT INTO `tr_role_menu` VALUES ('0', '5');
INSERT INTO `tr_role_menu` VALUES ('0', '59bc607d731d1246a42e2ce37818b8c8');
INSERT INTO `tr_role_menu` VALUES ('0', '5f569ae872a0f672f23a1d0d25d04e6a');
INSERT INTO `tr_role_menu` VALUES ('0', '70802cb722ad5b1e38d2f922c3fe96e1');
INSERT INTO `tr_role_menu` VALUES ('0', '790d3af48640c12b280869baef4cb030');
INSERT INTO `tr_role_menu` VALUES ('0', '86000599dcafedd61f70f8360752d3e8');
INSERT INTO `tr_role_menu` VALUES ('0', '8e9c8b6ae0d0e1738a61159cdc191537');
INSERT INTO `tr_role_menu` VALUES ('0', '9338eee6c00bca668221898fd6d11a21');
INSERT INTO `tr_role_menu` VALUES ('0', '97f186cb13d4f3d2478dbbc6ca30818b');
INSERT INTO `tr_role_menu` VALUES ('0', 'bee57438841942c2bc79e0a11f750a01');
INSERT INTO `tr_role_menu` VALUES ('0', 'ca08367f1f49da80a1fdbbfff45dbb4c');
INSERT INTO `tr_role_menu` VALUES ('0', 'd11927b284c8edf237f96b798aa9abed');
INSERT INTO `tr_role_menu` VALUES ('0', 'd703a4c4df7c35163b6e4a4cdeee7d3b');
INSERT INTO `tr_role_menu` VALUES ('0', 'e77438842cb07fa04b02254ba64ed3a4');
INSERT INTO `tr_role_menu` VALUES ('0', 'f767fa8f6b05a9b8e7caa31d59229d23');
INSERT INTO `tr_role_menu` VALUES ('3732d7aee4865acc1f22959767398990', '1');
INSERT INTO `tr_role_menu` VALUES ('3732d7aee4865acc1f22959767398990', '2306126245174f75e453cb1a1545bc70');
INSERT INTO `tr_role_menu` VALUES ('3732d7aee4865acc1f22959767398990', '5');
INSERT INTO `tr_role_menu` VALUES ('3732d7aee4865acc1f22959767398990', '5d763555ba2996884db9f38f598a894a');
INSERT INTO `tr_role_menu` VALUES ('3732d7aee4865acc1f22959767398990', '70802cb722ad5b1e38d2f922c3fe96e1');
INSERT INTO `tr_role_menu` VALUES ('3732d7aee4865acc1f22959767398990', 'dbcda9912c0b940aa7fa0868f9e811b5');
INSERT INTO `tr_role_menu` VALUES ('446f91c5e5a8af1ff18cdc642435d1c5', '1a59312cc129384afa4700055faa12b5');
INSERT INTO `tr_role_menu` VALUES ('446f91c5e5a8af1ff18cdc642435d1c5', 'ab401698364bde74cb2e78dca0ed9073');
INSERT INTO `tr_role_menu` VALUES ('9cae917e135b5a8072ed2efd85d4f062', '1a59312cc129384afa4700055faa12b5');
INSERT INTO `tr_role_menu` VALUES ('9cae917e135b5a8072ed2efd85d4f062', 'ab401698364bde74cb2e78dca0ed9073');
