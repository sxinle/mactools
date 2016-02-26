/*
Navicat MySQL Data Transfer

Source Server         : Mysql--192.168.2.92
Source Server Version : 50527
Source Host           : 192.168.2.92:3306
Source Database       : mx_service_auth

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2016-02-15 16:39:07
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
-- Table structure for te_area
-- ----------------------------
DROP TABLE IF EXISTS `te_area`;
CREATE TABLE `te_area` (
  `areaCode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `areaName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of te_area
-- ----------------------------
INSERT INTO `te_area` VALUES ('1100', '北京市');
INSERT INTO `te_area` VALUES ('1200', '天津市');
INSERT INTO `te_area` VALUES ('1300', '河北省');
INSERT INTO `te_area` VALUES ('1400', '山西省');
INSERT INTO `te_area` VALUES ('1500', '内蒙古自治区');
INSERT INTO `te_area` VALUES ('2100', '辽宁省');
INSERT INTO `te_area` VALUES ('2200', '吉林省');
INSERT INTO `te_area` VALUES ('2300', '黑龙江省');
INSERT INTO `te_area` VALUES ('3100', '上海市');
INSERT INTO `te_area` VALUES ('3200', '江苏省');
INSERT INTO `te_area` VALUES ('3300', '浙江省');
INSERT INTO `te_area` VALUES ('3400', '安徽省');
INSERT INTO `te_area` VALUES ('3500', '福建省');
INSERT INTO `te_area` VALUES ('3600', '江西省');
INSERT INTO `te_area` VALUES ('3700', '山东省');
INSERT INTO `te_area` VALUES ('4100', '河南省');
INSERT INTO `te_area` VALUES ('4200', '湖北省');
INSERT INTO `te_area` VALUES ('4300', '湖南省');
INSERT INTO `te_area` VALUES ('4400', '广东省');
INSERT INTO `te_area` VALUES ('4500', '广西壮族自治区');
INSERT INTO `te_area` VALUES ('4600', '海南省');
INSERT INTO `te_area` VALUES ('5000', '重庆市');
INSERT INTO `te_area` VALUES ('5100', '四川省');
INSERT INTO `te_area` VALUES ('5200', '贵州省');
INSERT INTO `te_area` VALUES ('5300', '云南省');
INSERT INTO `te_area` VALUES ('5400', '西藏自治区');
INSERT INTO `te_area` VALUES ('6100', '陕西省');
INSERT INTO `te_area` VALUES ('6200', '甘肃省');
INSERT INTO `te_area` VALUES ('6300', '青海省');
INSERT INTO `te_area` VALUES ('6400', '宁夏回族自治区');
INSERT INTO `te_area` VALUES ('6500', '新疆维吾尔自治区');

-- ----------------------------
-- Table structure for te_auth_order
-- ----------------------------
DROP TABLE IF EXISTS `te_auth_order`;
CREATE TABLE `te_auth_order` (
  `auth_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `order_creat_time` datetime DEFAULT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_source` tinyint(1) DEFAULT NULL COMMENT '订单来源(0：生产系统，1：美行TSP车机商城，2：美行商城，3：马自达商城，4：其他)',
  `order_nums` int(10) DEFAULT NULL COMMENT '订单数量',
  `order_status` int(11) DEFAULT '0' COMMENT '0:正常订单 1:订单锁定',
  PRIMARY KEY (`auth_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_auth_order
-- ----------------------------
INSERT INTO `te_auth_order` VALUES ('aec81a441b214097bcb0ce10cc3e6d83', '2016-01-27 21:42:23', 'QDYX20160127002', '1', '10', '0');

-- ----------------------------
-- Table structure for te_change_device_info
-- ----------------------------
DROP TABLE IF EXISTS `te_change_device_info`;
CREATE TABLE `te_change_device_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` varchar(32) DEFAULT NULL,
  `old_device_no` varchar(64) DEFAULT NULL COMMENT '原车机号',
  `new_device_no` varchar(64) DEFAULT NULL COMMENT '新车机号',
  `creat_time` date DEFAULT NULL COMMENT '更换时间',
  `handlers` varchar(32) DEFAULT NULL COMMENT '操作者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_change_device_info
-- ----------------------------
INSERT INTO `te_change_device_info` VALUES ('1', '200401', '1041', '1000', '2015-12-15', 'sss');
INSERT INTO `te_change_device_info` VALUES ('2', '200401', '9999', '8888', '2016-01-23', 'ooo');
INSERT INTO `te_change_device_info` VALUES ('3', '200401', '8888', '9999', '2016-01-23', 'ooo');
INSERT INTO `te_change_device_info` VALUES ('4', '200401', '9999', '1009', '2016-01-23', 'ooo');

-- ----------------------------
-- Table structure for te_device_info
-- ----------------------------
DROP TABLE IF EXISTS `te_device_info`;
CREATE TABLE `te_device_info` (
  `device_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `device_type` tinyint(1) DEFAULT NULL COMMENT '设备类型(1：车载，2：手持，3：DR芯片)',
  `vin` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mobile_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fixed_phone` varchar(32) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mail` varchar(32) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `card_no` varchar(32) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`device_no`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_device_info
-- ----------------------------
INSERT INTO `te_device_info` VALUES ('1', '610301', null, '1', '15841255412', '', '女', '', '', '2016-02-01', '', '1');
INSERT INTO `te_device_info` VALUES ('11', '610301', null, '11', '11111111111', '', '男', '', '', '2016-02-01', '', '11');
INSERT INTO `te_device_info` VALUES ('112', '610301', null, '111', '15841255412', '', '男', '', '', '2016-02-03', '', '123');
INSERT INTO `te_device_info` VALUES ('11211', '610301', null, '12221', '15841255412', '', '男', '', '', '2016-02-03', '', '1');
INSERT INTO `te_device_info` VALUES ('1122211', '610301', null, '122221', '15841255412', '', '女', '', '', '2016-02-15', '', '1');
INSERT INTO `te_device_info` VALUES ('1211', '610301', null, '12212', '15841255412', '', '男', '', '', '2016-02-03', '', '123');
INSERT INTO `te_device_info` VALUES ('123', '610301', null, '123123321', '15841255412', '', '男', '', '', '2016-02-15', '', '123');
INSERT INTO `te_device_info` VALUES ('1231', '610301', null, '1231', '15841255412', '', '女', '', '', '2016-02-01', '', '1');
INSERT INTO `te_device_info` VALUES ('123321', '610301', null, '123321', '15841255412', '', '', '', '', '2016-02-01', '', '12333');
INSERT INTO `te_device_info` VALUES ('123321123', '610301', null, '321', '15434344433', '', '男', '', '', '2016-02-02', '', '123');
INSERT INTO `te_device_info` VALUES ('1234', '610301', null, '1234', '15841255412', '', '男', '', '', '2016-02-01', '', '1234');
INSERT INTO `te_device_info` VALUES ('1331', '610301', null, '1232', '15841255412', '', '男', '', '', '2016-02-03', '', '123');
INSERT INTO `te_device_info` VALUES ('21', '610301', null, '21', '15841255412', '', '男', '', '', '2016-02-01', '', '21');
INSERT INTO `te_device_info` VALUES ('21221', '610301', null, '22111', '15841255412', '', '男', '', '', '2016-02-15', '', '1');
INSERT INTO `te_device_info` VALUES ('2211', '610301', null, '1122', '15841255412', '', '男', '', '', '2016-02-03', '', '11');
INSERT INTO `te_device_info` VALUES ('22111', '610301', null, '1221', '15841255412', '', '男', '', '', '2016-02-03', '', '123');
INSERT INTO `te_device_info` VALUES ('31221', '610301', null, '1233211', '11111111111', '', '男', '', '', '2016-02-02', '', '12311');
INSERT INTO `te_device_info` VALUES ('321', '610301', null, '123', '15841255412', '', '', '', '', '2016-01-28', '', '123');
INSERT INTO `te_device_info` VALUES ('3211', '610301', null, '12', '15841255412', '', '男', '', '', '2016-02-03', '', '12');
INSERT INTO `te_device_info` VALUES ('32111', '610301', null, '12322', '15841255412', '', '男', '', '', '2016-02-15', '', '13');
INSERT INTO `te_device_info` VALUES ('32121', '610301', null, '12312', '15841255412', '', '男', '', '', '2016-02-15', '', '11');
INSERT INTO `te_device_info` VALUES ('321321', '610301', null, '123123', '15841255412', '', '男', '', '', '2016-02-01', '', '123');
INSERT INTO `te_device_info` VALUES ('4321', '610301', null, '4321', '15841255412', '', '男', '', '', '2016-02-01', '', '123');
INSERT INTO `te_device_info` VALUES ('CG001543267646000195', '610301', '1', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for te_encryption_info
-- ----------------------------
DROP TABLE IF EXISTS `te_encryption_info`;
CREATE TABLE `te_encryption_info` (
  `soft_ver` varchar(64) NOT NULL COMMENT '软件版本号ID',
  `product_id` varchar(32) NOT NULL COMMENT '产品系列（加密库模型号）',
  `encryption_name` varchar(100) DEFAULT NULL COMMENT '加密库名称',
  `encryption_path` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `encryption_ver` varchar(100) DEFAULT NULL COMMENT '加密库版本',
  PRIMARY KEY (`soft_ver`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_encryption_info
-- ----------------------------
INSERT INTO `te_encryption_info` VALUES ('T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', '610301', '马自达加密库', '/home/hsong/plog/libKeygen.so', '1.02');

-- ----------------------------
-- Table structure for te_nds_data_active_log
-- ----------------------------
DROP TABLE IF EXISTS `te_nds_data_active_log`;
CREATE TABLE `te_nds_data_active_log` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `device_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `soft_ver` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data_ver` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `region_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `active_time` date DEFAULT NULL,
  `active_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `active_type` tinyint(1) DEFAULT NULL COMMENT '权限类型（1：新装； 2续费）',
  `active_source` tinyint(1) DEFAULT NULL COMMENT '激活途径(0：生产系统，1：美行TSP车机商城，2：美行商城，3：马自达商城，4：其他)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_nds_data_active_log
-- ----------------------------
INSERT INTO `te_nds_data_active_log` VALUES ('0592092bbb234fb6be7c8ff0354b06a4', '610301', '32111', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-03-N', '5600', '2016-02-15', '54217092AB86BDFE93465867', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('17392d2abecf449fbfea84a810cf02ba', '610301', '123321', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.03.01-06-N', '5600', '2016-02-01', 'DEA88F08EAEEC54F5B4C7BFA', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('1afb887df22c4fd6abde247296a0e755', '610301', '21', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-01-N', '5600', '2016-02-01', '7F0F49F28FDA463F03B1E05A', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('2ebc03274ee749ee9e5eced26bff1945', '610301', '22111', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-03-N', '5600', '2016-02-03', '8EE74A81325388987619EC0F', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('370bbc22812e48399810ceee3fcc5238', '610301', '1231', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.08.01.00-15.01.01-03-N', '5600', '2016-02-01', 'E5203021F00519E7F849CE4F', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('3e49458bfa6b45a796c9d3f4ab2f19e5', '610301', '21221', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-01-N', '5600', '2016-02-15', 'F00DC93C336BA3974028B3A2', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('515bbdf4b5e94bd5ad1ad724d2936969', '610301', '32121', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-03-N', '5600', '2016-02-15', 'FE4C0A52F27EF8BDFBFEFB20', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('539fff8c4c7241efb165b91d8b29c502', '610301', '2211', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-03-N', '5600', '2016-02-03', 'B01E3FDB1A98696323460834', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('596b5a2e37994347b0bd6ba9e4622d6c', '610301', '321', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.03.01-06-N', '5600', '2016-01-28', '95F270CBC344D078A40EF9B9', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('6dd2e699378047db84309f00fab72f6e', '610301', '1122211', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-01-N', '5600', '2016-02-15', '904DC9369CDB92703BEFA8CD', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('8bc8409cd62d47b19e0189695e367077', '610301', '1234', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.03.01-06-N', '5600', '2016-02-01', 'A3F2849549073B95D7E5840B', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('8dde3f466de74745bd7619b4e446cd2a', '610301', '321321', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.03.01-06-N', '5600', '2016-02-01', 'C4658BAC02F7064D214C71C3', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('96fbb28d09a74e30871f22427c048ba1', '610301', '1211', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-01-N', '5600', '2016-02-03', '2ADCBC2660084D8590962E19', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('97a67374f6f342fa8bb342750eacb73e', '610301', '4321', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.03.01-06-N', '5600', '2016-02-01', '60DD7CE27E4837A68F164ED0', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('99fbf3dbdbd04694a17a672185473c19', '610301', '1331', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-01-N', '5600', '2016-02-03', '8DAAD04DAF4A1CD6C12E5712', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('adad46c02d43430f96068c48a7b4205e', '610301', '3211', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-03-N', '5600', '2016-02-03', '1AB5CEE4C170AFEA9A6F4ADA', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('bd6e2e7ef61e4ab4a035f7f8e89d25df', '610301', '112', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-03-N', '5600', '2016-02-03', '3069AC6BA165FFF64A25B005', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('bf505be9826042c08ed26d468b131a74', '610301', '31221', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.03.01-06-N', '5600', '2016-02-02', '51BEFC74EE125ADF6630E474', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('c4930ce3800d4b0daaa5411511eb5782', '610301', '11211', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-01-N', '5600', '2016-02-03', 'E35C92F6094838E8C0A137A3', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('d0a95a0689e64e938568e593004054e0', '610301', '11', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-01-N', '5600', '2016-02-01', 'D44F371C238AE7B48B9CAF01', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('daa6d49899e4426cb85c7501279ac9a8', '610301', '1', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.03.01-06-N', '5600', '2016-02-01', '20D61E890304424F821024BA', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('dcd48525ffa3404abc827fb58254ec9b', '610301', '123321123', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-03-N', '5600', '2016-02-02', 'C9EC12F8170D4E0E0546ABB3', '1', '1');
INSERT INTO `te_nds_data_active_log` VALUES ('ddb8156fae184ee39b86d03fc46a09a6', '610301', '123', 'T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB', 'T04.8003.02.09.01.00-15.01.01-01-N', '5600', '2016-02-15', 'F00A449F22F35E5A668ACCB2', '1', '1');

-- ----------------------------
-- Table structure for te_nds_data_sell_active_auth
-- ----------------------------
DROP TABLE IF EXISTS `te_nds_data_sell_active_auth`;
CREATE TABLE `te_nds_data_sell_active_auth` (
  `sell_auth_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `auth_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `business_mode` tinyint(1) DEFAULT NULL COMMENT '业务模型1：销售激活（有号段），2：销售激活（无号段）',
  `nums` int(11) DEFAULT NULL COMMENT '订单剩余数量',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `free_upg_duration` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '免费年限（X|Y，X表示时间传整数，Y表示单位。如果不限年X传-1）',
  `free_upg_times` int(11) DEFAULT NULL COMMENT '免费升级次数（-1：无限制）',
  `region_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_rule` tinyint(1) DEFAULT NULL COMMENT '鉴权规则(1：按时间段，2：按次数，3：按版本，4：按时间+次数)',
  PRIMARY KEY (`sell_auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_nds_data_sell_active_auth
-- ----------------------------
INSERT INTO `te_nds_data_sell_active_auth` VALUES ('f522d222c27740679d3d3563cb0602ec', 'aec81a441b214097bcb0ce10cc3e6d83', '1', '9986', '610301', '1|2', '-1', '1100,1200,1300,1400,1500,2100,2200,2300,3100,3200,3300,3400,3500,3600,3700,4100,4200,4300,4400,4500,4600,5000,5100,5200,5300,5400,6100,6200,6300,6400,6500', '1');

-- ----------------------------
-- Table structure for te_nds_data_service_auth
-- ----------------------------
DROP TABLE IF EXISTS `te_nds_data_service_auth`;
CREATE TABLE `te_nds_data_service_auth` (
  `auth_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `device_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `region_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL COMMENT '结束时间（无结束日期表示永久）',
  `init_nums` int(11) DEFAULT NULL COMMENT '初始次数（-1：无限制）',
  `nums` int(11) DEFAULT NULL COMMENT '剩余次数',
  `years` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '免费年限（X|Y，X表示时间传整数，Y表示单位。如果不限年X传-1）',
  `data_ver` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_type` tinyint(1) DEFAULT NULL COMMENT '权限类型（1:免费权限  2:收费权限）',
  `auth_rule` tinyint(1) DEFAULT NULL COMMENT '鉴权规则(1：按时间段，2：按次数，3：按版本，4：按时间+次数)',
  `business_mode` tinyint(1) DEFAULT NULL COMMENT '业务模型(0：产线激活，1：销售激活（有号段），2：销售激活（无号段）3.购买)',
  `device_type` tinyint(1) DEFAULT NULL COMMENT '设备类型(1：车载，2：手持，3：DR芯片)',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_nds_data_service_auth
-- ----------------------------
INSERT INTO `te_nds_data_service_auth` VALUES ('008bb5b127ef4d81894a515cffb2a434', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('00a52580f4a5469eb0d763a02035072f', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('00c536ba03f445fd90afba62dadd1ad9', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('00fd5263f61544dab498827bc35a73c2', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('01da6df8b5b646629c188368aa74c2b1', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('01f3cc70c29e465a9c3caf7ef0e34a21', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('02b0050c5f8b405295b5b0fa630cf228', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('02fffb5eb0de437ebb79c63521f320aa', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0318c58cd4284877a7266ee6e9cfd1eb', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('03beb53bd261447e802c3d1a22d6e2c1', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('041ccc95f1ff46b3af33bc581f57437f', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('047ac9fb767b44099ca14996248bb1e3', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('04fbc0fc643842789bf3c80c4e3efb9b', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('05cc5ba90e44487ea510b9dc20c7ddac', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('069d5b9d3da14c77b5bd5cb1455e88bc', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('06abab2399e84fcd96fd15ad6a93c3c5', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('06d75b0ab5d24de187a55025b61945ed', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('078d8a2998624d8084095ef10cf4f249', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('082a08a429394949ba9176906b7dfcc7', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('08368c4328e44f28bd30e0c6f9ffbc66', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('08d078036a604254b9ceafb5ac43381e', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('097f20295a0c42aa8a99224b5a3b7826', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0a4320edcee34ea6b8e07d41edb2b809', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0a6ce380b0d84deaa91b791b46d24d9e', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0adf3bc84788418a96b7539e4e7c58d0', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0b1b272fde0142b68fe15f7f35983af4', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0b924ccf36024d5fba4c0ea5a60a6fc1', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0bc5afcdb20e430d9c80e5cd56cbb563', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0c37e548756946969e334ed97c5438ac', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0c3956540c0847df8a6e490fc59919af', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0c5d262e5fc34947af7fa135d6cd4713', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0c81f0bfd4d64959986424a10439bf13', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0cb60c870cf04db7a1bd5dc87e04aae9', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0d13cad5e89b4f4c87a5eef7235454d2', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('0d14b76ffa404a48bee41e2ad949bb26', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0da8d1ddf1bc43aab0b1be114ff68fd6', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0dae035a285a4eccb6e44137e4911b8b', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0dd6732054ee4f5fbfe305fcc0ae4647', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0e485b0a3f8f4eee93e540140b07a943', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0ecdcb5e33fc4783a08184b76dc02056', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0eefbec777a44e7e8eb221e26817e1d2', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0f1edd1dae1845e58d517886fb947d39', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0f43b4d76ae640cd8579174549e9c6ac', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0f49b089092645be9b808678572eb7e6', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0fd38413ac564efda82ab8d00752c8bf', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('0fd4afbae6a64662820f54a208c3194d', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('102644abb4f54e0f9b110da4e352eb31', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('10cd4ec57aca44cb93d395b344e11edd', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('10d21bbcae7d47eeb325e3473a72fa4b', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('10fbcd42c1a74da3ba31502cbea8e6f5', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('115deb889ca644a998126aff09a18972', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1165c34ed6c4419ab83d948be5344ea2', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1193ed54c7d0477fb6dc853bb38bdcf2', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('11c0078ca94a4bc295c6c37e7ae38a41', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('11cff44e061b4308b0ca4b99f3edd818', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('125bb7d492b0485fad4350b62079dca3', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('12b43a97e3f647319183194f37a96b18', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1357f9e977e0469bab0bc59549bcf9e4', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('13581fb4ce304ee3b679d5f8bfa1ea15', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('13a885de415047c787f7d020b906aa53', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('13e1591e0cd941adbf6196f57a7463e1', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('141d2622ca464eb1a0e8992b2730f77a', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('14364218e5b844b3915e8b5d20c6e7c6', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('143dbb09e18e46158fc7856d782ff8f5', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1443b6edee3441c69ad55ba2b9b888b3', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('14b769a5f898421fa84dca3167659d47', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('14cfd90899814deebae57645a27ce66a', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('14d39daa46c34286a485893b8142bde8', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('14f9159138624ee9a258b058a0797b8f', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('151f5219d5c5424cb5e5865ff3fbe0c3', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1577071a471040b18367414e301bc4ed', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('15d7c67366f54f3e8b9bc4907725ae5f', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('16aa0432000d4e42bca2dcbc6c3f9d6d', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('16f4bee5fc3b4b9ab5629d5d2e400edf', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('17e4d1fb86fa43c7842cd3a3fea921f1', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('17f4274e7439473883d606a4673b8637', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('182abded01b44eccb1c877be9b4e8447', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('184f507bc21f43bba597fc5a81a4f940', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('186b0d99ddf8440dbca79ab1c6b99a12', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('186f6a1ff39341d4b1cb4b7de4ab3243', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('190caa3e61ee4c50b74101eaea7b4cbc', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('197bd553fbbc4a86bb57765e13da9fe1', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('19d0091a40a84dc08e556e1af98b70f0', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1a84d4df93ea42dabc008461ec4e6f92', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1a9787aeedcf41dd892db19da3d37565', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1aa72019213f4c5a9eb33876f74b556b', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1b52f32065754ea0ad13d24aa703ae9b', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1b892d4813bf4e66aafc92a3c83a99be', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1b9261d723694cb6aa9ca438d13a22d3', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1bf9fe739a4949689ba9dc37c16c93d4', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1d029437042947d4a4c3033acdd5f5c2', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1d75ad54f6624cb4ac924268e1e12de9', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1d977d81394c42c2bb09cdbfd8395eda', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1ded6c62a9044b84982a35e114b1af79', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1e5c5d24279c41baa08b992a03ae15ae', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1e61cb4d95fa47b498d044604120b020', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1eef39ed270f4612a3efe3641d91a6f8', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('1ff8dc8a51dc464ebafd5e56040a258b', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('200c7c3cb95849e9841f5fc409500742', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2021592a82e24286b223bbc85d17f2b5', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('202ce44eb6534030800568e1dd352d15', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('208f126775a940d78cea1aa21bdb6ed6', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2110654f0e894e55be775e6982961e25', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2161ab4ab4254d8291627fdeaf3bc55e', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('22b0b525e36d457d917f39bdabc06f46', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('23a18adfea3449d18548045aee8409dc', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('23ab8527f2654c37889d3f04069a75e7', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('23c21c17a4ce4ffb97b50ee8373cdb67', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('23ce410fa65b479492bb51fb8982aff0', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('256863752f1a496ea4d4e85be835c6b6', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('25a992a4b9cd4473a2e628eff7c92597', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('25e42c8b2e1442b6927ceff631f8452d', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('260f09bfca194f73819e96708d75896c', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('266140de320c4c098c9ef59d5a37afac', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('26ff641beb5a4282bc4448b6b6de275c', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2792322690134a9da183bc2a97a9e525', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('28f2ae5a333d4eb4a22edc11d4205328', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('291a8df2589340309751c220e32dea76', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('29896361326d464d84fe7713b3ef050f', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('29e223ec88fb4a0e80a7bd528d580343', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2a56f48344cd4e7f889693e70be1ff45', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2aaa1e50d0dd49e79edaae8f06ad9c6b', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2af3df351d684f1ea433bd5aea76170a', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2b368b12b0ad4603881694c8329e458d', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2b5637b9e0e5449e9521910558c3d7a5', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2b7c25457ff94e76b864f108bf08c8dd', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2b9a22c2841d4157a4b01c14320c2ade', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2bd9cafe6ef34aea82acae2e39f53fdf', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2d3e71fff68e4a49a93ed69311429146', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2d7ff0802d3f433d948e5aa0a007a2bb', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2daf7682772b4dbc89c0a348d51289cc', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2dc22f461ef94aa8a589117577befc23', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2e76d29635e34510ab446296490f6e2f', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2f23aa9a3ff1476e866485b23b91dc08', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2f61ec78fb5842fd8d73311ea8d1e6c3', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2faea6509d0847c09f498a16f092e21d', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('2ff614018961477dbb4593190408ed02', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3097ada2256d4214b1daab350b6a3386', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('30a13ba2fc914925b925b697bf535db4', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('30fddc8373f2458b9502156997c7c597', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3102bafe1b7344bd9da70412812bb88b', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('314d53617a234af3822adb5b52d3bc81', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3168696ddbf846fca1665e131bf1cc21', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('31c87b1535ac43a1a03b0f6b4044cd8b', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('320dba6db5da42319d97df5a8f4134d9', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('320eb5e3d8914bf295889e32a45cee6f', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3215b9fd124844da99bf7ebdd310be9e', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('32368e25efd845958972bcfae7b201b9', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('328fdc0512024c3fa6985ec1a7384405', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('32b0fd4cfcbc4debb2913cbe278776b4', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('32fe80cecdaa4262916a33293d436ef1', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3306acb60fcd426ea6abf04c99ef2a2f', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('330b535178364fe4875791e644112363', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('33152ac657f543c7be7f35f2059379ad', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('332ebbeebd63483b967b9d9cf30a4d99', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('333dc13f8fd84a06b52a2824fb1a4127', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('336c209433a54007aa4b930f4d1b500f', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3376e9f6f961408dbfc9f598bb884b63', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('33a3b812355d4111a1de8953cad7a89c', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('33efd8f032b94f06b2e3fba50cf8a612', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('33f3ab4ed5eb41b0a519507b24bbae13', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('341d5d2c5ca64a71957739816aeac812', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('342757befc1746539396d4623fe7bae2', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('344b1b4d5f6f4a4d9cf04fb865c56ccb', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('353cbf8721f14202a9c7d9679886cd9d', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('353d9ec4f2e54c8bb5bb021b780cc9ce', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3556fe5ed0044682a726bbdd89d8e1db', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3595a7c9187046a39f612254963e36a9', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('35d85e0483ca44e0a83e547484ad8664', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('35f72b559b894994a563bf2af4e5e48a', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('362c9c8d8395418c81320c7d6ddf90fc', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3667671f41704fcebbc7f8d8894b9d7b', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3680c197dce7495b842cafdc12d6479c', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('36c3a8c0b8544d318444d3d5163f19ef', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('37abf59341664605bc3cef014ca202c1', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('37f2650d53094568882abd96fb7f3e1b', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('38c1c7898a5b424bb5caeb1f08dd3d94', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('399896d4e4bc4e0a8b87888d3265bd7e', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('39b8f19de48c424ba70fb8d3e763e737', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3a25dbd4edee43d98f3d91a01a03054f', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3a6cf0b757e74453a7d09451a9515834', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3a969e825a654c229e6dc6dca3332e34', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3aa89ac2dbb647d68e27cb80b7a806b3', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3aed2ffee98044e9a9ce1d6765b3b5d7', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3af0fa1a6e084434914227166b5be8cd', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3b0d0f59b51a4bf4a04493930006a665', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3ba576202b884cb58641f90f8ea4b18f', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3bd83fe595df48898ef2e8cb4b0feff6', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3d106b59500940569fddde416a74166e', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3d5a88771b4445028133c148b5d0042d', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3ea2f91b1f924c83a40150fda402a1ac', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3ef7a24cbb274b8aaf4ec53c6ba8142d', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3f3cdcfe37644e75b1d6cb48ed7fbe72', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3f82a4082cc74deea1c13678f1c5bbf1', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3fa1115cec744e9799bc8aef99454ee3', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('3fbf6f4f24f74380b8fafa630ed08570', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4061e3cac6ab4c738f702bb7b6b80fac', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('41a87c8120074eb2a25d9e3498a17a06', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('41abfe75a8464789ae006889f10d3443', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('41d22d3d56ea4e7c8932c113a2061403', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('42bf83fad85d4d5dbb0ff0c686aafb17', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('42e033d8d8d548c2bc70c7dbc296b3f0', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('42f5b58bc1194eb2bb7bb77151799b3d', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4369b776060f4bca885cb886e253e6dc', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('436d9e13e9044aec85faad93a39331a9', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4373798a4e7c4803b0a3cb229e03d559', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('437ced712c6448d99766ed088c4040a8', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('43834d969b8b4160911f3a1c22528804', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('43eb45cd10f74ff99d73e1ec47ebd518', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('440a49b13909451b802236f44490e2b4', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4499124fb5a340459d359a4a0b5f02df', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('44c5d13e16284b6f94bab8afec94ead7', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('44e03485695b482d81f68e2e3c9e6c23', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('453342fe0adf407297537019ab20955f', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('45fbc57620ab4995b6cde380688650f0', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4688532a23fb4509885f30f765576a6b', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('47c0807bc39d44d9bedfbf7b8eb1fe62', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('47ff59233bda419dba982d1d5fcfa980', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('48146b9bdbaf476baf009b507dfdc8da', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4845e1a71b24463ab1782fe594c29799', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('485e1f41cabd4e868e6f9caf36b02368', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('487fcf3948674d74a3505ef1741ed5d8', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4935f3e667ec413885709bd417a922b4', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('49b333571e89469a885e8f7140f41371', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('49d5b48971624772a459fd3ef333775c', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4a6325a6e88f4144a8da08a94202b5cc', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4acaba2a8818404796c42bd9f675dcd0', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4b6c61f30cd846849206667b9255580e', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4b882dd83be34912a4e942e246d840db', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4b9cce4add6743299668abe5546c5dbc', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4c0c75ed216e4fb39fa74136e2c32c22', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4c64fc57eb9b43c78df22a06f8d93b1c', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4cb4302c7c434d92be02e8f9de88b6c4', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4cebf69b08344d768f7c91e4bb3deef2', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4d41a7af7ad54d49ac573c3ad66d1fa2', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4d689a22bfc94a78a14acefcdde51762', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4d8c48c4c797485a91d672a9e8527eb5', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4dc893603178484ab14492cbfcfb54ce', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4dfa0146227841edbd93d593cd50045a', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4e227f1547234270a2933c816c27e70a', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4efb50b06c794e6492b8929cff38e341', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('4f7d7320da984dc1b8e72d754b7ddc1b', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('500cd7e21f944dd1aad90a4978bf1293', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('501b80e06bd941e9bf3308dd5ec2133b', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('50b68a3df3da420faf512f86cce8e51f', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('511953b291a44bc0943aa4a3d7ce6238', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5157dd3af93d4d6e85bb0f4ee26d7463', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5171dd6b5fba49dc93cdfae6532efed8', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('531cb207c03544ebafd2036fc7a71a38', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('53894a6b6cb14a68b5dc7fb1a8cc4220', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('54689fef912a41a6bce52aa59e7ff753', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('54b61e4be3214315a2860867c33e318f', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('557f65e41b29476db0f70c91203568b1', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('55c60ff4bc9c4c2ca45441518ec56e52', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('55e2fe25520d428e9e1b76028e53f08f', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5611b47dca6c4e6ab71067ea495a1a5a', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('56fe0d3c8f174133958e2b31bc5d75a7', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('574b9315593146159a8599333d2d744e', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('57b721a5222a460ba0bd8e0f44a4ddeb', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('57c162017f3d48948eb30ac2c004d176', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5841511bad0a404caafa93ad79c4aa5c', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5873500637c443e8bebdf2ad756a9e05', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5878315814ef413abb4cd5f1d34422ae', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('58a3120bc8ee43b5944139a625b24b7e', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5901afcad890474b9b7d80a2fdadd2f5', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('59162f653ee84ed28f4058123fa063a3', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5a98499a11764c97b1ce91d66ffb1af0', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('5b15192bc6294c9f9b3ca8126658ae97', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5b39407fcac243a2aa740aec4d2169fe', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5b800783de8044e7b96d465cda600220', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5c4dc5a0af1346b5a233bf21db896c49', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5c5289a099ee4dcba0a08a82bc11c4f0', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5c52e6085877497a907bbb3b4342c879', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5c754e0bfb474ccc9fa0f98e8588e4b3', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5ca68bf711dd4506b01f0884115b829f', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5cd6ec44704d4e9695906ffe2bea1bd1', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5d127bf7202542659885ccf6bf4f90f2', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5d420689aebf462e9068fccbbd1f96ba', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5d756c8901374fcaa6f723f28d07cf22', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5fa892d1fb4646e09ed795316e5bd11b', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('5fb281baa4034c0bb15d73d0947f0ff9', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6039298496074f8c9882d7e578c66694', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('607baac465864c838ec7888e1bab1f9e', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('60c74467071840fdb8ebc209d1395529', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('60eff6ccbaf04ec8ae08c41e58f422bf', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6134f6af2d73459da84de4cce093a2ca', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6164d0c1bd994a2d836cecdb4dc1f944', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('61b3283233b2473692a028ae177b6e6d', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('61c5eaee66274bfe9a2d280223060acc', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('61c89d333e9842fe80e54fbc6554eb67', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('61d656ac22b946568a0b06d549ae841a', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('61ed7fee2da149c9b750ab2691fb3b6a', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6272abc2c5614b18b6f509d4e84bad0d', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('62f43c5c78584804b4aa531e84518ad5', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6352b22973e345a5a96f44e5119fa0d6', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('63edfa8c8a9e4d42b80540d4495a5ae3', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6403b0cc851e4e11b17b851e0f76869b', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('640e1b8efe3a415f8dbf99ce0a5aab11', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('641f3a5cc75b4e1cbeb767d2b01be7b7', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('648741b2cef74bf1ba14488bcbb4cc0a', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('649dafb418234bd6986781afcbeef6c6', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6511ebce93da4fc890a3830d25e3aaf8', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('65711b7413694827b3cfa5b113e79c13', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6584866a07844af0abf0c16bd26ce679', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('65ae8f6cf8a64cd7a5d13845ae24b13e', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('65b82d05344946f68c1202c08b986c41', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('65d9b03179c94bc0a790a6917141738d', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('662163596f83490c9e0f886b088dae1f', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('664f508c8b714361aaeb750234bb2cfd', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6707787327fa4ec4a8ee110202ef968e', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6783abee0b674cc693a4b77fa03ed77f', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('678a608a32104f45b16041a8870bfb2c', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('67c6a767d86d4f85bc88dad8265ccf09', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('685d7889faa941ffbe7158d1910243e1', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('689c67da34a74092a955c88201117d2b', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('68a87e9fc1484c67ad58b90471e8c303', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('68b5c9b4e08e4613a9c61ead4dcd589b', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6971ada2d6cf43cdb8d76472de6f31cc', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('698f4dcb166541f7845f640e435a90ed', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('69a57d3118bb424d8fdd8f1881119cab', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('69efb6a6dab84014becc09c80e504dd9', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6a28263e9a6d4f39a82bbe4ca4ec1e19', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6a7f60bc103340b2b990f47ca6f76c57', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6afc8b5936114306ad5d6d085650f4cf', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6b369638a0da4e3aa11d72d5acb50a41', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6c256404c6f243fbbb1291df3b4937de', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6c83b46557eb4c1bbc5b8eac5f785224', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6cc67f5b261d4e76a03b47e27833126f', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6d1f654b5f9442e6845a10f63f6798e7', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6dd7cafb5a764478b7617f610eff8060', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6e0910e329ab4fd782bd84d18371233c', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6ea813212eef4f5c8de96a72c97fad38', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('6f67f40a82f64bdcadc75d058c077e75', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('701544013aec48ab95ed78b59f11b120', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('707c7d1a7e994c8cbb5d3f4a57fb6e72', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('70aa6a7b1be4417e9a4f01246785da6d', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('71563c2dc13d40d89f5f91925afa663e', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('71633f8cf1ce4934bfe7ab43e21b66d9', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7180a31f98874bc1ad898fa080bef38c', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('71826f350cfd46128f55f1fd222a3c3e', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('71da0aaedecf4970bcd3855c2193c5fe', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('728c8da7bc904c55bad9fdb3d281ae2b', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('7298c49a91f5483786b4774467e175bb', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('72d4da82a2ce4a38a9ae7d0e38bf8f05', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('742ebe3899bb424fa821c6da92eec8d9', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('74eb98c828774660bccd544e9a32ce36', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('76011a9d0e124dca81b02a1ba1c7e1d2', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('760f4f882303438ea133a0a99ee19199', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('761e9c6ab473443cbf39aed23078f6f6', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7631be0fd9e94548aad88fdc0ac967d8', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7691b16e47474d2ebe5ef596a47284a0', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('76973fcd1efc4bc3acc3c9c35fd94745', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('76e7d30b2d794aba8765563cd1541fc4', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7712f337b1a7445fac76dd6b52caf3b3', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7743b855aa214b08bf3f960046765f7a', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7763c1729ce74f19a2d17abe03fff60b', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('776cc0caf0274f87867dc0dd2a10b838', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7816e936e2c9411492899d071ec7fa44', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('782fd320df9e49e587772764b3eef40d', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('78d825cb04134a0eb83e8e0848c698ab', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7903fdab17604aa6acad6040286a497d', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7a3859d20ad141d9ae514bb79226cd6a', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7b4b706f42bd4e088e03ba4b2808d93a', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7be1190cbb1f4c37bbec40df6d5d0be0', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7be1ac779a4943a4a9f45d0abb1126ff', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7c15370046fe488eb6b6f3c4c428b864', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7c40eefd0b684186ac56e1d866e19feb', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7ca3eee52129497daa1e644ad39c2f40', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7cee51817a8941b69f18943f84a5a9b6', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7d24a4d2daea489c9cd1b90db616815a', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7e1c134ac91f4245a7dd0eb3de2a4852', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7f02d405bc6245d3a71736c1fd693bca', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7f41c7d041c943458f058a9ff7b27726', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7f52720b19504cd6903ae0c923be148e', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7fbbd6557b6f42d18123cebc41c87499', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('7ff641cb3202440eb3b712e9c9c6e504', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('800fb364d6b14fb0b0affe25f59dd714', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('804c90fd62cf4f09a5907bdff2c767bf', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('804fbd1037734705b1eb61a9e52b9f59', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8053f7b8f42744fcb967f5522a96652b', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('80d5eb4e37c24a1188fc5ce1f4a5d454', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('80e23ff8dca94ef6a7f729b8cb0d5a75', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('80f951de20634f8596b475a49f674158', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('80faddd50772444180b30c4c1900b4fa', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('818de6a752664c7fa509ade52acb7573', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('81e10befde7841868383d42148131ba1', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('82c7d652462d4fe180a2f8c4d1af72f1', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8346be79a0334bce8a10d6238e9263db', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('838e4f13d7ba48fe82c2e7524fda2b97', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('83984a7570144702878dca8234c6165c', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('83a97049cc5e49f5ab986b9af2a79a0a', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('83e1b6768a4840bdb1b27c90091be9e9', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('83ff35d0165d4fa9870f698dee499e82', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('853781d7ab50469894fe4f0ce273be35', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('853dcb628c2b41e7a0df906d85403813', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8585d7f8ce3747efbf10de050f021d88', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('85a7f2a41ef9416797b0b5711f2d3843', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('861e231a795147db9bbcba1f1a493d76', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8676cbd89ce44f108a407e182c75737f', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8678099e2afc45fdaab53b928d1fa33c', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('868e46e4f9b843659d83041074847b64', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('8716e6a958c4486b8edf02e15d33baec', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('871b62bc791e4e3884ba0724d7c487aa', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('87a833f738374aa58e73b2faad2b76d7', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('87ceb18455a24172adc3bf8263016cb9', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8821340f94c44176b9bafe3823e1c6ee', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8831fec5fed6403fafc7c15b23cb7b32', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('886d7bb0059b47619bbd3ba8ac72603d', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('88accedadc9247eda095702b9571d0fc', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('890c01306e9a48d6a6f025050f2fd04a', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('89a49b827a5345c49335add33781636a', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('89eebb0c21df4031b4cca2d3cd8d889e', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('89f18e168ba841eb9f75ee300bd5cde7', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8a169126dcee4e6fb9b2321cffb0c902', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8b44c833ffc94cc9a59d637af3442f26', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8b7c336daccc4e88bae1bf5cbb065b75', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8b812b9d551d49c190ec4710b5e05a34', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8c26207721fa41ae8bb1082d1a00f685', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8c29902b0c9248eab658bf628b62aae6', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8c8539b7d71f480b8eccc78833f31865', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8d0e4445b49d480a82af9039e6e1264c', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8d19d06055364abc84f4f73f2c36a3a1', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8d52c7c4c00a44ed8c65373f85bc2715', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8d92f724cacf4b64ac467215f66da5f5', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8d93f916502843ea83020f737dd63848', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8e11f19d02a4449795a3a69c1d4ec3f7', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8e45e027ecfe40b3a34b81a1d5bd8e0b', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8e9954b14d21493785f7916addbd2549', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8eb819491d014b5cbf8d242cf18ff331', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8eb9a649ccaf4b5cb6a52eae53162ad1', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8f0dc16c940f40839ef512d4bfcfb9c8', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8f1487d954664432885e9d0f45c18491', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8fe556ab8ad242cb968b31ac9a056972', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('8fe87d0f384147c1b93e5b6c767fe283', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('900337b7107e43ab9b63885b7d91fbe4', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9014e093a31649a788a0b6a503d752e5', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('908d11563c5d46b7b1392e1cbb66948b', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('90d7b9a7d2084635abcee9f31604f64a', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('910bc4d46aee4ee18cbb3130f71b9501', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('911040c691494a3eb28cda69e8deb429', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9110e9a4df1a43a589c47d51f99ea721', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('914af5f1ecb14cb69d74a8b19ec6f552', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('921bc08140074867b55a4be72d030df5', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('924d457b31a440879574f62cf05c0372', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('92585f1abd394c86b3fb1234f7ac0664', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('934969c4695c44a38dd8fbee108647b2', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9380a2d1e71f459486b3bae6ac4e8ef0', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('938984b513b04699ba2a074c864be52b', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('93a6803bc37c465fbfdff58be766e7e0', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('93b148a9109242bab6d2f43cda5540ac', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('93ccc353ca5640159044b60af2748804', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('942188a146ac4e8b8b3763dfaea303f8', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9428f1d7b8ea4097b3388765aa3aa488', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('942c4b6b2295493b83c245491bc1523e', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('94786d2f9797450496d8bb611f96d731', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9528de14df7b4af4a7270d8b04785f66', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('95b21a6a59814c3f8123a5328149aaeb', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('962d882e47ef4c86b4ec283fb1785f87', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('967e4eec2da142248ba3e63720cd16fa', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9699c7e2a05048c1823a00956e588d42', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('96d61974d1ed43468ee39d32f217fcad', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('96dc4a99185b436e8730f5255911a83b', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9719f8434e9544a1bfd5b77a8421fd4e', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('97a776f6c0cd4ec292dcfa7ff5327a7f', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('9819396509574c70b595d409b9f723d1', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9903233ee90f4a39aa5644a0c28610b0', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('99a786e61acc4c688e1404175fd2bd10', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('99a80720693348c1b6b6ffbaacd76326', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9a648447074a4d92bd0bd2095b8cfca4', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9a686252c4344d5ba0f9eb878013106f', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9a9968a6c9584375b41d64f44bce8c89', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9ab7966631b14381954683df5bd5641e', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9acd6a0afa8b4c3d841aabec964ef2f0', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('9b0940a59b5d49adaccaeec19f44bb8e', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9b5ecc0148664869b27eff2d83ae51a1', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9c29f496a0c3415c8d2d860245328fd4', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9c497e746b524fd8969eb43ebb625379', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9c60891fedab4d66978b5a3498d14dd1', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9d0baa7f63584f1db8e7f6193243b653', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9d435d47e30f4a3f8a4f3eb2921fc856', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9d7654e9cbd34fd8bd924492904b03f4', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9e70c19c58a44b41bd905c149d417e0d', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9eae8407642245778175e0f4fd421ecf', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9efb89d86e6b4070a694181aca03692d', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9f0f25530044419194537bf49a001015', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9f51cd2540f5415da5628f3d6b8cc04e', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9f51e3b97e624f10b781214bd264fa79', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9f7d07c018d24f2eb632893060b64fae', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9f9547e0c5dd4077bc7c7c10d9ad080a', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('9fafc397f6a74894ad22651fb5666161', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('a0269c12bfb4407eb6aaf85d2b810858', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a070f92c28a34ec38488bd390f0b1ecf', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a0b3e4f24e0b43eea4a3f289a4861813', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a1348e588ad34267a1aec38a56341605', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a158aebd4b604b35a69e56d357bde52c', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a19bdcda7093476b958781ce78f7a316', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a2742e8c5d2b40599a7d993507d34aaa', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a38a8a3b783e4c86ada9ff7985c130ea', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('a3cde9ffadfe4a4c968f96a75f33a6ff', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a3ef842f65914b4b9dcb8eb5ae850ff8', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a42239b569d0496ea05d65237961ea14', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a45baeab6a814f8eb741fb97b81cb019', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a480cd385abc4dacb18f604775c3c215', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a49c07641a0f40ccb979126f2af84f9f', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a49dffd8367c472f905edc52d7c9a47f', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('a4ab9ba80b1243269a6df26b2d56221d', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a4bea3e3fa40418f8c7308bf47964189', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a51f3af8c679432e901a76f71dfc68bc', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a5880d10507240d48428831cf9b40f91', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a5c64186569d4c67b887b1a67d7138c1', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a6ab2ca275894c39a55e175f6ee9e272', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a6c1ae05a5ef415d9c1a06d1e0d45013', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a6ff635d84b1433f921970fcae76fa7e', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a700f7fb199540cbb8052ab1057dd703', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a73c2a9b1080465aa5aacc64fc1660b9', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a7f3e6860b534e6083ef5ef7ab6e0dd0', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a8335c641da444caa51e2e62c757757a', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a843b984ce2342cc9efab848562cf383', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a8be497f47ae4b74a1ee717f5f91b4ee', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a8f3e0b0c20f4b8fb8b917007624466c', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a9372f190a594a289ef0f001e1750641', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('a96c14cba23e4ea29963a854e7b11c6e', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('aad7005b88da472abec5cac2e52acf77', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ab4754df9dd7435daf55280a2a684bd7', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ab86970abdfd48adab75dfd3fca49a7e', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ac8673971de1493e95429a2ca1aa8b01', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ad14fe85e3e34a97ad29bc6ffecab534', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ad6be8e02cf04934948079e81fc2f9c9', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ae7f410a37174d43b6b3fc18d39924d9', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('aed53ef07191421a91592d31e95e834b', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('aed6a69057074a57891d6af366078e07', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('af09fc44544841c68fb76fab232bad03', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('af3aca54b3c7406a916ec60c39f24b42', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('afd781d3ed4043e6bd1e2cc2bab4f40e', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b00bcb7253da45cbbfba80aff39f3d3f', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b075013aca8b4f27a90c83efdaf178fa', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b086109ff28f42a483bc7a5032fc7fe5', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b0ce368fbd104d6cab83245f1aa97cf4', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b231c4e6aca049f88b13c8bc96b94cbe', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b2cb91535c824b108a252b64ef6d6844', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b3539d2418254030849998efb8402e61', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('b370c75119064334aebf5f47e0286bc2', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b3e76f51506342efb4ae829c565f9e76', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b4301f9503c0484d8f88f1c9dc5bad3b', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b49a4beabc954e61be4d205b3a1f6c93', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b49e8a934a574b858af2957c750003df', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b4ad5d4d435f46d395f791011f44e0ed', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b4dfb5919d474c3d886f32f1d0d30954', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b5c7cc02e3834b86be8135e9770d4887', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b65795a81a7f4ec8b604a774ab7a7517', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b69cca84e87e4adba1c1b028e8fc9040', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b6f064e704c44e06ade35ead97a281cb', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b713b928e1f34fddb90ad331bd28b63c', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b72358503d454d038a259bfb762af2ac', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b72b3b3bbd54457ba6a708a104a8fc5b', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b74fa3a3aa95436483d408838ee13814', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b78e4500f4464585affe6cee9ae7c705', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b7a99cffa9ef48c9a255f3ccbefba10f', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b7e1e7a61c7846cfbb58b5dc5987acc0', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b809ba09957747f58ea5583a5479951f', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b80bcc8c28ba433ea939a6164ec699ae', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b81ca2df3b6c4fd2ae57896525db6473', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b83da0a8ec3246c58ac608c05976e724', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b86fff5485804457851b4829da7c957e', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b931522cf57d41ed845d0a56b2917135', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b9822c5516d24e63939ce7c9c9233e38', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b9bf67ea05ca4304a5041295a32b7b83', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('b9ff3129945848ba94f2b8604c4f875f', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ba7af9625a86427dbb17fdbd4008a842', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ba7edcd759b149ce860122ef65b72a0f', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ba8f53417bee42a4a7a4d833d6c99926', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('baa8767f3e7f4ae3878760bfcc6044f8', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('baa9f001d9354fefba99ad56ba1c383e', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bb871582cab447119e0a869e1464e4de', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bb878effa4d7486cb9ee45fba0cf2f08', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bba5c6e62f05490994f94072282dd920', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bbacb55d600c439b82b95bff1960bd11', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bbdec7bb686e43328b7eef984370cb7e', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bc0ca30aba414ef1b644de2300e86e4b', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bc6b1c8dd3834c8f985f69d65d81ab60', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bcf827028b9c415f9615164b9c3c13b7', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bd0f860c837a43bf83efcaadf5051b42', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bdb06d9d9c0b490884dea0ab96b914dd', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bdb5ae228be740489432535171bf64ea', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bece534499784929a00ed8d76b9af4da', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bf49e282a5c1440f92d1f58c74a10811', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bfc071e82a2e46848e6604a12e416013', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bfc596a218974b47bb49c77e4c5b2689', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('bfc8241b377b4045a840ca5164284208', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c0612abc4f2d4734a2392d575956135b', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c0ab3f8e31d84d1ea8a12508ee193a4a', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c0f511331d344d57b2725c0ad3e54fd6', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c10e5f04866a4d38926192f870b9f434', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c1144281cb534316bbe39e6b5a3314f8', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c1165a24d5764ebc9350d5614131d4aa', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c13001f2a2534dcd94dd94a7fef3d280', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c15788fc58724b09a7c1d2b759e4c5a1', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c293f645cb7c43c5a23ac0516c4c0771', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c2a875f0d03248ee81b68f19f0405d9c', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c2e6d37d9c6b49bcb510dbf89baf7cfc', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c34a1094f8ac41dd9da91e66746cf635', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c363272071c24907a4e0e077558c97d1', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c549611a86bf43ce821d85fd645d14ba', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c5820c247d8d494489de569144345325', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c5ef7d1f33a44027bdc80be0a4a4bfa9', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c6839853457f42f2b28e423d1ede5c74', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c6bcacd180554c1996b30953830c1131', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c6ef416fcbc34a71a94bce7272e8913f', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c74acd2d5a394783bcded239869d40c8', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c75393c84cc24e808e10c29d4aeacf59', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c81305566e244a6e9522355f33d75beb', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c89caeab812749bab4a9928b3e895f87', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c8c7e173b1974c98b98f60f75565e430', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c94391b1f67b4584aeb54c66b26e0bab', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c993a80a39b34cd1a9c2f92b84ad3ae0', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c9b60e8ba39d483092054cc554f44daa', '610301', '32111', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('c9c2758e8cc9453990de28ec04a2233b', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ca2072a5fab44441b6a0b92e165d589b', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ca45f6818cea456b8230ddc4158164e7', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('cacbe4e252df4761a8dc0c4d2a1c32f2', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('caf61f2293564fb39def476d91661349', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('cb4ba77d94544e8d812508b39ae57c7a', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('cb551b6a718d436da1afcd238593c8a2', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('cb57da491f6746fd86b5ad2a8feaa2c3', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('cd0baa3b5a5d41d0912ea7faba15b97e', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '1200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('cda0fb02f6ca44b79ec5906669105814', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ce66f7063cd04b989a9cf99d56c6da1c', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ce844891b89346539646a2b8cf74be1a', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('cf0a1cbb1adc4d32bc6f1dbcd1036f6c', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('cf233fb4b7cc404d805ab7857c9fd737', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d01416fb7a9d4a2b9e814d3cd04372b9', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d03713012ee24abcab5e9ad5664dd592', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d05bb17ff4d64e44bb4eb7fba57685ea', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d10b7418112541879dd8387fe876f1de', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('d137ba74f4d64e2eae23e1f7a186126b', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d1b7cedc3b3f413084fa30d201703871', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d229e483e9de476188be5e05ff8e6853', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('d2639230f4344ce3948d48913887bda3', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d2b758f485344d878d8f563babcc8536', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d32785781c344836ab6f5b8d04c8f85b', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d35a40f3c0c145cdb12e3cd2456f7317', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d3aeef3efc1642549853fa2dbae4781a', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d426b12c1e3749baa52bb3e08fde2f99', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d44d4aefebfc409caaec3dfcfd9cceba', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d463f8d26c114fc8b061e7d37475fb5a', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d47f22a55ff14e48b95a41fe4cedded2', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d490ce3eb0fc47418609e6b4bcc5cec2', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d4a078b3780a4a7f9d7918d4f4bc87df', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d4aafb433f364f6da298c61a80569254', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d4ba32144d0446499e044b237d91dc80', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d4ccf517d6ec49f397e4b4a878681a9a', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d53468b2c38046beaf92681248de2e7a', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d6177bd5fad14a11aece74d03ffff766', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d64eef1a14f0441f9a3e489ce4862e21', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d667733295394216ab9e59f1c09c771b', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d71519ea325346e5ab0350866cbcd1b5', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d79c8e5f448a4688983f157b72a36b81', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d7b7629f5e5a49e0bc037a79f323ffa6', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d8b74f655c384ca7adcde98fba32a853', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d919f0e6b50144a6a9798e6c09108059', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '3200', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('d91bef12c1a4497282eb62aec9026878', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('daf2c8d772be4a9eba0c6c8e93189c03', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('db0f3c78744b4cc99911562c8b7cab79', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('db38515136d64030b48914020f305fde', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('dbb7d3c385cd4d509e1ed908e1a9b1ff', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('dbd28612c50546f29e28a435f31c3714', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('dc1ae558c0da42579c15f8a85e04ca79', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('dc3fa0582091448e975351396fd5c02e', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('dcbce2c4babe4c5e947a1b63df131d82', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ddbcd0636fb24c11ac8c84045ae18a71', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ddf09c4053364352af8aaf0a2fb85d8e', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ddfc9ca9ac714b3f80158b7eb7d328eb', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('de8adc60ab6a451cb7441b244783a228', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('dea04ebdf14749659d1142e6c3aa9d74', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('df7126e5d024498890db4b81485d371b', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e0acbdaff6fd4b4cae34a379a24912c0', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e0b1b68391fa4e2fa7212bdc7ae5be43', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e0bb0e17e857478ab90dfb05124987f6', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e1ac873b55644225a8a4d64e495c71b9', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e1c4a87de03a4e9ba036cb04e76b51f2', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e2361e7129bc4e3582939fd5a0811750', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e2c0ac74ca644b23bee1738fe96def55', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e3874743b98c4b37872e22387a32e5d8', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '3600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e4077daf31c84e948c770e557e642bb7', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e48d068843fa47e3bd28603c1231704a', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e4f1f443346c4b6589f3122b1cebc3f8', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e515f13905a3409ca0e25b69cfdab141', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e5788f7b5fe04dedac6f76337f52722b', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e591351833e04c6291a119741d601d0a', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('e60a7960451a4b56872f05c3ab5f2b79', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e60b86fb50da4058b35151efcfd6462e', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e64da811fb9a40b3bc18c86d2d564cf8', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e744bb14e77d45beaf49348dbd9a676c', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e7ceccb7b07e416bba931a46e0294931', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '2200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e7e50a9bbcd54dc5b8e1bbbf347b9885', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e7e8cbd8dc6d44fabf049b423ee655c1', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e80dab9805c14312a5711000b4f8b0b6', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e82438074f744d0dad16da86771f062b', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e893dbe3b8ea4b29a97d6bd2b35a8c31', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e8a1ca6775174b76adc34e40eb5c0a4d', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e8a8f94a60a74a6ca41262bcb1e36847', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '6500', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e8d918d95ec54252a8807e0b2a939e05', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e9335b7bd58540459d5a322c9702c050', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e94ab4f2653e4c68a344e26debb53755', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e956dd52294440449f6acbc5200f99f4', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('e99e2e10fb1a43b68f08396da5eef31e', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('e9f374bfd2e34d209a292b73732cc7f8', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('eab2ff40fc304cd7a746058f08cbcc7a', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ead588e00901464e8419e017dcf2fb42', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('eb665a359823439b9f5a42295678d2c6', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('eb7040f6e86040e1b3c2d1b8d07bcad3', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('eb87ee016e8f47e8896f771e973a97f4', '610301', 'CG001543267646000195', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-01-27', '2017-01-27', '-1', '-1', '1|2', '1002102500', '1', '1', '1', '1');
INSERT INTO `te_nds_data_service_auth` VALUES ('ec12cbaf8d1d405b95fceae9dc498ba8', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ecba8b35368a4246aee0b2bfcad94133', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ecc9912a6a3344289007dce05b8dd777', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ece33233cf5f4a45838b87ac46ca74df', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ed012426310d4f23bd3225db4620ad65', '610301', '1234', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ed4085960d554f2797bc2aeb9a623b99', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ed428dacae8f45819a915e0a8d72fc7d', '610301', '123321', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ed5c6277d3344894920ac883ad14dbec', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('eda8cf02a66c4102acbf1e1f5ffe750c', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('edfc0f54547a459993d8bf9709e0452c', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ee11502ea956485fa3383504ac783bd0', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ee18528ebd09426aa83d53f2d750d0e5', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('eed0a0413bde4c4dbe2902e6a2fa33d9', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ef1632bea35f473ea6a22f5158ad182d', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f03cdf29ae8f457aa4b286e20e0561f7', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f045be04b3c5479e8a76baf979204899', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '1400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f082002fcf0d46dfb86dab1bd9e37ee0', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f0b2478efba840ea8fccf6bd0e64f072', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '5300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f0bee1da29da4907bcc63be6cc6daafc', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f11915addf4644c692c561d68e146144', '610301', '123', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f1a3a65ed78b4f689ab3ef375be1bf43', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '4200', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f1c094c6354c418ea9092c6fc25a8db2', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f1eacd9f2fe34f68a31426065965edf5', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f28372bb6c9c4c14a1aa774ad9f08f30', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f2ea9be0c67246c7b12fb8e017695eba', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f2fc2c34f8a64847bdaa01772f12a617', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '5200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f33a7234f2f446e39b2f6ee62cad7a5e', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '2300', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f3811e1d0ef34b9fb5b27776ed7dc84a', '610301', '321', 'aec81a441b214097bcb0ce10cc3e6d83', '5400', '2016-01-28', '2017-01-28', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f45371161798450fa5cd481779d633e1', '610301', '123321123', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f457d7f4d97940d79e0296b2c5f89b15', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f5787fff3912464981eade6044cfeff3', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '6100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f68008adb70f4de48c30d87c619c498e', '610301', '112', 'aec81a441b214097bcb0ce10cc3e6d83', '1100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f757ddcc1c854a8aabe63c0a34697470', '610301', '22111', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f76e2ca6858546b2a847a5a64e51c4d2', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '4100', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f8c676ed983048eb9388d4c2470417d6', '610301', '4321', 'aec81a441b214097bcb0ce10cc3e6d83', '3400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f8fed048d0084b258fd34f1538fbc870', '610301', '1231', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.08.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f91c50f883cc48208d98a8b9b8f1c93b', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '6300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f95640e76002403dba71a395ba3fccb2', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '1300', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('f9f68ff2eccf475fbc9bf69919c1e5d9', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fb30cc5440a542d3b6722253284521c3', '610301', '1211', 'aec81a441b214097bcb0ce10cc3e6d83', '5100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fc0517836cb14b3296071522df3214b1', '610301', '31221', 'aec81a441b214097bcb0ce10cc3e6d83', '3500', '2016-02-02', '2017-02-02', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fc2b19222f474954b38e7292222dd30e', '610301', '1331', 'aec81a441b214097bcb0ce10cc3e6d83', '5600', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fc38ee55b0d8477c944e4ee4cfff4a23', '610301', '3211', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fd985d6e6ddc422d910cd2c9bfef4fdb', '610301', '1122211', 'aec81a441b214097bcb0ce10cc3e6d83', '4600', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fda02810ae7747dabe62de19c009abd9', '610301', '32121', 'aec81a441b214097bcb0ce10cc3e6d83', '3300', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fdc1f8e016ec4233b84308ca9b00f514', '610301', '11211', 'aec81a441b214097bcb0ce10cc3e6d83', '6200', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fdc8a2992025458598c96a886020ebb3', '610301', '321321', 'aec81a441b214097bcb0ce10cc3e6d83', '4400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fe00ad4e5357409c8e589453dc96387f', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '3700', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fe06e555eb8446f79869affb25f973cb', '610301', '2211', 'aec81a441b214097bcb0ce10cc3e6d83', '3100', '2016-02-03', '2017-02-03', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-03-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fe69dcdeec004d05945ef15321a652f8', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '5000', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fe773bc1e3fc451da8fdca8c95b1f66b', '610301', '1', 'aec81a441b214097bcb0ce10cc3e6d83', '4300', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.03.01-06-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('fe7bbf1f82814c0ba8507adf1f8083d5', '610301', '11', 'aec81a441b214097bcb0ce10cc3e6d83', '2100', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('feebbc5572b9472b827a12f6132f45bd', '610301', '21221', 'aec81a441b214097bcb0ce10cc3e6d83', '4500', '2016-02-15', '2017-02-15', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ff4b38afdbcf47d88811dc2afcfc75d8', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '6400', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);
INSERT INTO `te_nds_data_service_auth` VALUES ('ff6b361c5b164205909456c498019679', '610301', '21', 'aec81a441b214097bcb0ce10cc3e6d83', '1500', '2016-02-01', '2017-02-01', '-1', '-1', '1|2', 'T04.8003.02.09.01.00-15.01.01-01-N', '1', '1', '2', null);

-- ----------------------------
-- Table structure for te_nds_top_data_ver
-- ----------------------------
DROP TABLE IF EXISTS `te_nds_top_data_ver`;
CREATE TABLE `te_nds_top_data_ver` (
  `device_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `region_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `data_ver` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`device_no`,`product_id`,`region_code`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_nds_top_data_ver
-- ----------------------------
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('112', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('11211', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1122211', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1211', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '1100', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '1200', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '1300', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '1400', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '1500', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '2100', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '2200', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '2300', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '3100', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '3200', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '3300', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '3400', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '3500', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '3600', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '3700', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '4100', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '4200', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '4300', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '4400', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '4500', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '4600', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '5000', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '5100', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '5200', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '5300', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '5400', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '5600', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '6100', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '6200', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '6300', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '6400', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1231', '610301', '6500', 'T04.8003.02.08.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('123321123', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1234', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('1331', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('21221', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-01-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('2211', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('22111', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('31221', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('3211', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32111', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '1100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '1200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '1300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '1400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '1500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '2100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '2200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '2300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '3100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '3200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '3300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '3400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '3500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '3600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '3700', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '4100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '4200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '4300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '4400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '4500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '4600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '5000', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '5100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '5200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '5300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '5400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '5600', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '6100', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '6200', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '6300', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '6400', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('32121', '610301', '6500', 'T04.8003.02.09.01.00-15.01.01-03-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('321321', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '1100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '1200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '1300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '1400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '1500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '2100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '2200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '2300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '3100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '3200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '3300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '3400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '3500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '3600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '3700', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '4100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '4200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '4300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '4400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '4500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '4600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '5000', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '5100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '5200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '5300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '5400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '5600', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '6100', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '6200', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '6300', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '6400', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('4321', '610301', '6500', 'T04.8003.02.09.01.00-15.03.01-06-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '1100', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '1200', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '1300', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '1400', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '1500', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '2100', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '2200', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '2300', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '3100', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '3200', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '3300', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '3400', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '3500', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '3600', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '3700', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '4100', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '4200', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '4300', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '4400', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '4500', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '4600', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '5000', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '5100', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '5200', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '5300', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '5400', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '6100', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '6200', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '6300', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '6400', 'T04.8003.02.06.01.00-15.01.01-04-N');
INSERT INTO `te_nds_top_data_ver` VALUES ('CG001543267646000195', '610301', '6500', 'T04.8003.02.06.01.00-15.01.01-04-N');

-- ----------------------------
-- Table structure for te_prefix_info
-- ----------------------------
DROP TABLE IF EXISTS `te_prefix_info`;
CREATE TABLE `te_prefix_info` (
  `prefixData` varchar(64) NOT NULL,
  `prefixName` varchar(64) DEFAULT NULL,
  `productSeries` varchar(32) NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`prefixData`,`productSeries`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of te_prefix_info
-- ----------------------------
INSERT INTO `te_prefix_info` VALUES ('10100', 'mazda刮刮卡类型', '10100', '2016-01-20 20:18:01');
INSERT INTO `te_prefix_info` VALUES ('AS4fD9', '43', '267410', '2016-01-22 09:08:18');
INSERT INTO `te_prefix_info` VALUES ('MZD111', 'MZD111', '610301', '2016-01-28 15:20:34');
INSERT INTO `te_prefix_info` VALUES ('WWW720', 'WER', '267410', '2016-01-21 20:16:45');
INSERT INTO `te_prefix_info` VALUES ('WWW720', 'WER', '267486', '2016-01-21 20:16:45');
INSERT INTO `te_prefix_info` VALUES ('WWW720', 'WER', '267488', '2016-01-21 20:16:45');
INSERT INTO `te_prefix_info` VALUES ('WWW761', 'WER1', '267486', '2016-01-21 20:21:06');
INSERT INTO `te_prefix_info` VALUES ('WWW770', 'WER', '267411', '2016-01-21 20:17:27');
INSERT INTO `te_prefix_info` VALUES ('WWW770', 'WER', '267486', '2016-01-21 20:17:27');
INSERT INTO `te_prefix_info` VALUES ('WWW779', 'WER', '267480', '2016-01-21 20:15:32');
INSERT INTO `te_prefix_info` VALUES ('WWW779', 'WER', '267486', '2016-01-21 20:15:32');
INSERT INTO `te_prefix_info` VALUES ('xxx3', 'xxx1', 'xxx1', '2016-01-21 20:00:19');
INSERT INTO `te_prefix_info` VALUES ('xxx3', 'xxx1', 'xxx2', '2016-01-21 20:00:19');

-- ----------------------------
-- Table structure for te_product
-- ----------------------------
DROP TABLE IF EXISTS `te_product`;
CREATE TABLE `te_product` (
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品系列ID',
  `product_name` varchar(150) DEFAULT NULL COMMENT '产品系列名称',
  `secret_key` varchar(64) DEFAULT NULL COMMENT 'customerKey对应秘钥',
  `permission` int(32) DEFAULT NULL COMMENT '权限(0:免费 1:收费)',
  `act_way` tinyint(1) DEFAULT NULL COMMENT '激活方式0：原始序列号激活，1：硬件序列号激活',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_product
-- ----------------------------
INSERT INTO `te_product` VALUES ('123456', '产品系列AAA', null, null, '0');
INSERT INTO `te_product` VALUES ('200401', 'T10增量升级', '9d2798d4a9574f16505dfe6f29bd4bd1', '0', '0');
INSERT INTO `te_product` VALUES ('267422', 'T10增量升级2', '', '0', '0');
INSERT INTO `te_product` VALUES ('267423', 'T10增量升级3', '9d2798d4a9574f16505dfe6f29bd4bd1', '0', '0');
INSERT INTO `te_product` VALUES ('610301', '马自达G5', '995d0af44aab357f2880cb937905d5c0', '0', '0');

-- ----------------------------
-- Table structure for te_tsp
-- ----------------------------
DROP TABLE IF EXISTS `te_tsp`;
CREATE TABLE `te_tsp` (
  `id` varchar(32) NOT NULL,
  `auth_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `free_upg_duration` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '免费年限（X|Y，X表示时间传整数，Y表示单位。如果不限年X传-1）',
  `service_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auth_order_id` (`auth_order_id`) USING BTREE,
  KEY `index_orderid_servicetype` (`auth_order_id`,`service_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_tsp
-- ----------------------------
INSERT INTO `te_tsp` VALUES ('6de9f3643e6d41b7a27a9fe532c407e6', 'aec81a441b214097bcb0ce10cc3e6d83', '1|2', '6');
INSERT INTO `te_tsp` VALUES ('aa92419099654bf1ab60a42412fe36c5', 'aec81a441b214097bcb0ce10cc3e6d83', '1|2', '4');
INSERT INTO `te_tsp` VALUES ('ac16c42b9f994fdd8e46201e94b26191', 'aec81a441b214097bcb0ce10cc3e6d83', '123|2', '0');
INSERT INTO `te_tsp` VALUES ('f40de2a7e5c64b7f8fd21fdc1910bacd', 'aec81a441b214097bcb0ce10cc3e6d83', '1|2', '5');

-- ----------------------------
-- Table structure for te_tsp_auth
-- ----------------------------
DROP TABLE IF EXISTS `te_tsp_auth`;
CREATE TABLE `te_tsp_auth` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `auth_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `device_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `service_type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `create_time` datetime NOT NULL,
  `auth_type` int(11) NOT NULL COMMENT '1:初装 2:续费',
  PRIMARY KEY (`id`),
  KEY `index_product_device` (`product_id`,`device_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_tsp_auth
-- ----------------------------
INSERT INTO `te_tsp_auth` VALUES ('08fc3201114140e3a8b8043033d7d48d', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '4321', '5', '2016-02-01', '2169-11-13', '2016-02-01 10:44:12', '1');
INSERT INTO `te_tsp_auth` VALUES ('0ca807adda8846fc8a6d2b420b6660c0', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '32111', '5', '2016-02-15', '2169-11-13', '2016-02-15 13:43:09', '1');
INSERT INTO `te_tsp_auth` VALUES ('0e34f25f6b2e44309f3efd114af395a3', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1231', '6', '2016-02-01', '2017-02-01', '2016-02-01 13:37:30', '1');
INSERT INTO `te_tsp_auth` VALUES ('0ef2ac9a4e444212ade09b50cf2c2c54', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '32121', '5', '2016-02-15', '2169-11-13', '2016-02-15 14:08:22', '1');
INSERT INTO `te_tsp_auth` VALUES ('0fac376b072d40af96531290e76ff207', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '321', '2', '2016-01-28', '2017-01-28', '2016-01-28 14:24:02', '1');
INSERT INTO `te_tsp_auth` VALUES ('11eb5b343ba24b4480aaba0297aa715e', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '321', '4', '2016-01-28', '2169-11-13', '2016-01-28 14:24:02', '1');
INSERT INTO `te_tsp_auth` VALUES ('14923f51e3f94cbca355f67845f893c3', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123321', '0', '2016-02-01', '2139-02-01', '2016-02-01 10:23:56', '1');
INSERT INTO `te_tsp_auth` VALUES ('157f98e4fc1040e8b8a844c62931d154', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1234', '6', '2016-02-01', '2017-02-01', '2016-02-01 10:42:06', '1');
INSERT INTO `te_tsp_auth` VALUES ('173b6b526a8940f3ae9967955580ec92', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1231', '5', '2016-02-01', '2169-11-13', '2016-02-01 13:37:30', '1');
INSERT INTO `te_tsp_auth` VALUES ('1868987552414fbf8812408cd4d7940a', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1211', '5', '2016-02-03', '2169-11-13', '2016-02-03 09:33:49', '1');
INSERT INTO `te_tsp_auth` VALUES ('18f209728bc74843a0119b606b6ebab7', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '22111', '5', '2016-02-03', '2169-11-13', '2016-02-03 09:32:20', '1');
INSERT INTO `te_tsp_auth` VALUES ('19e1b2729c874ce1b9fd883cd84a8d14', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1', '5', '2016-02-01', '2169-11-13', '2016-02-01 10:46:36', '1');
INSERT INTO `te_tsp_auth` VALUES ('1a2edf94c2ae4bf689ecd2f970d87a26', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '3211', '5', '2016-02-03', '2169-11-13', '2016-02-03 15:14:12', '1');
INSERT INTO `te_tsp_auth` VALUES ('1aeb4db4f5a348be866608bcbf23ab8b', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '21221', '4', '2016-02-15', '2169-11-13', '2016-02-15 13:43:47', '1');
INSERT INTO `te_tsp_auth` VALUES ('1cc82e016f1a46bbae45f5691bb2e2b9', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1331', '6', '2016-02-03', '2017-02-03', '2016-02-03 09:39:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('1d920e20900b4632a11ca9a592cd68ea', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1231', '4', '2016-02-01', '2169-11-13', '2016-02-01 13:37:30', '1');
INSERT INTO `te_tsp_auth` VALUES ('1e1a7d33a16a492e96a449009f88cd28', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '32121', '6', '2016-02-15', '2017-02-15', '2016-02-15 14:08:22', '1');
INSERT INTO `te_tsp_auth` VALUES ('1f03619859dc4df9890e3a5f00b7b8e2', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '22111', '4', '2016-02-03', '2169-11-13', '2016-02-03 09:32:20', '1');
INSERT INTO `te_tsp_auth` VALUES ('2172cf51ec344e799693574c97e6c907', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1', '0', '2016-02-01', '2139-02-01', '2016-02-01 10:46:36', '1');
INSERT INTO `te_tsp_auth` VALUES ('23457df82e7e41b2a983699eea360200', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '31221', '5', '2016-02-02', '2169-11-13', '2016-02-02 11:28:46', '1');
INSERT INTO `te_tsp_auth` VALUES ('251eedae691e4428beed053c300ba7b1', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '2211', '6', '2016-02-03', '2017-02-03', '2016-02-03 09:30:20', '1');
INSERT INTO `te_tsp_auth` VALUES ('25992370c198421483af6c064480a599', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1234', '0', '2016-02-01', '2139-02-01', '2016-02-01 10:42:06', '1');
INSERT INTO `te_tsp_auth` VALUES ('26d6a1dbf96c44e184052696e068d3b9', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '21221', '6', '2016-02-15', '2017-02-15', '2016-02-15 13:43:47', '1');
INSERT INTO `te_tsp_auth` VALUES ('2746a96eaf0c43a29629453de506bd12', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '31221', '0', '2016-02-02', '2139-02-02', '2016-02-02 11:28:46', '1');
INSERT INTO `te_tsp_auth` VALUES ('2bf5b2358f41409f9023c74e21aa9144', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', 'CG001543267646000195', '0', '2016-01-27', '2139-01-27', '2016-01-27 21:42:26', '1');
INSERT INTO `te_tsp_auth` VALUES ('2f2441e81fe640e4bd8cfce052ea3ae1', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1331', '0', '2016-02-03', '2139-02-03', '2016-02-03 09:39:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('34bbec7444074181a09f862f50f61d98', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '32111', '6', '2016-02-15', '2017-02-15', '2016-02-15 13:43:09', '1');
INSERT INTO `te_tsp_auth` VALUES ('35e606be2eef42f693fdd7a054f0ec28', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '2211', '4', '2016-02-03', '2169-11-13', '2016-02-03 09:30:20', '1');
INSERT INTO `te_tsp_auth` VALUES ('389080ef4d62478d93d9981b0ce021e8', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123321123', '5', '2016-02-02', '2169-11-13', '2016-02-02 11:26:59', '1');
INSERT INTO `te_tsp_auth` VALUES ('4510964d19d74282a98247f151ca5aa1', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '22111', '6', '2016-02-03', '2017-02-03', '2016-02-03 09:32:20', '1');
INSERT INTO `te_tsp_auth` VALUES ('452125193df04679aa8d8cbc891d7485', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1331', '5', '2016-02-03', '2169-11-13', '2016-02-03 09:39:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('45e55fef8c864574b8fe1bcddf6c7fdf', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '321321', '0', '2016-02-01', '2139-02-01', '2016-02-01 10:25:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('4741a2e9a2564c38989c9e86c88a89e0', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '32121', '4', '2016-02-15', '2169-11-13', '2016-02-15 14:08:22', '1');
INSERT INTO `te_tsp_auth` VALUES ('48bc98732ef6468a989f7aa489b40a4f', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1122211', '0', '2016-02-15', '2139-02-15', '2016-02-15 14:11:19', '1');
INSERT INTO `te_tsp_auth` VALUES ('4a3a987a85494ecb89625f7bf7feff8c', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '21', '0', '2016-02-01', '2139-02-01', '2016-02-01 14:22:11', '1');
INSERT INTO `te_tsp_auth` VALUES ('52e19d92af664c6eaa685e83981306ff', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '21', '5', '2016-02-01', '2169-11-13', '2016-02-01 14:22:11', '1');
INSERT INTO `te_tsp_auth` VALUES ('538922d463504166b8623794ad48c751', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '3211', '6', '2016-02-03', '2017-02-03', '2016-02-03 15:14:12', '1');
INSERT INTO `te_tsp_auth` VALUES ('560c81c082264e059eca1c9742fa8445', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '11211', '4', '2016-02-03', '2169-11-13', '2016-02-03 09:45:46', '1');
INSERT INTO `te_tsp_auth` VALUES ('5630d66fadeb4037be15a708bfffb401', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1231', '0', '2016-02-01', '2139-02-01', '2016-02-01 13:37:30', '1');
INSERT INTO `te_tsp_auth` VALUES ('5c8f7194c2884eecb53aa1bf9192003a', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '2211', '0', '2016-02-03', '2139-02-03', '2016-02-03 09:30:20', '1');
INSERT INTO `te_tsp_auth` VALUES ('5d216a58e30240daaf992c63d06c842a', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '11', '5', '2016-02-01', '2169-11-13', '2016-02-01 14:56:10', '1');
INSERT INTO `te_tsp_auth` VALUES ('607860913628446bbc299ca4d74dd1f9', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1234', '4', '2016-02-01', '2169-11-13', '2016-02-01 10:42:06', '1');
INSERT INTO `te_tsp_auth` VALUES ('67c5f293e7b14be58e603c136f9ac698', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1211', '6', '2016-02-03', '2017-02-03', '2016-02-03 09:33:49', '1');
INSERT INTO `te_tsp_auth` VALUES ('68b4c5b7673b449490489945199616d6', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '11211', '5', '2016-02-03', '2169-11-13', '2016-02-03 09:45:46', '1');
INSERT INTO `te_tsp_auth` VALUES ('6dfbb950fd7e49b78457b617edac0039', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '321', '0', '2016-01-28', '2139-01-28', '2016-01-28 14:24:02', '1');
INSERT INTO `te_tsp_auth` VALUES ('71b9757b7cad4646b7257dbf9de44459', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123', '0', '2016-02-15', '2139-02-15', '2016-02-15 14:07:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('7263fc8a1e3f43b696072b068ce4a34a', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123321', '4', '2016-02-01', '2169-11-13', '2016-02-01 10:23:55', '1');
INSERT INTO `te_tsp_auth` VALUES ('7467d65390574c2e80663961c7b6ecd0', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '11211', '0', '2016-02-03', '2139-02-03', '2016-02-03 09:45:46', '1');
INSERT INTO `te_tsp_auth` VALUES ('763698ea31994d1486e05d439efc2f9a', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123321123', '0', '2016-02-02', '2139-02-02', '2016-02-02 11:26:59', '1');
INSERT INTO `te_tsp_auth` VALUES ('769da80478594e9a99e02eb6fde87691', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '31221', '4', '2016-02-02', '2169-11-13', '2016-02-02 11:28:46', '1');
INSERT INTO `te_tsp_auth` VALUES ('7a126a6a0b4b48d986af8ce50d97a2aa', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1211', '4', '2016-02-03', '2169-11-13', '2016-02-03 09:33:49', '1');
INSERT INTO `te_tsp_auth` VALUES ('7e736c5714684b77ae8e33b1b4309d54', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', 'CG001543267646000195', '4', '2016-01-27', '2017-01-27', '2016-01-27 21:42:26', '1');
INSERT INTO `te_tsp_auth` VALUES ('7fcb132f8bb34332b3283bf5282bd7fe', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '112', '5', '2016-02-03', '2169-11-13', '2016-02-03 09:28:25', '1');
INSERT INTO `te_tsp_auth` VALUES ('820a7b533f2c4923b65f86438aff6505', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123321', '6', '2016-02-01', '2017-02-01', '2016-02-01 10:23:55', '1');
INSERT INTO `te_tsp_auth` VALUES ('82492eeb5347401c8b7738336d62f2a4', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '321321', '6', '2016-02-01', '2017-02-01', '2016-02-01 10:25:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('846eddff52014abb8a4e82e354968f3e', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123321123', '6', '2016-02-02', '2017-02-02', '2016-02-02 11:26:59', '1');
INSERT INTO `te_tsp_auth` VALUES ('8d204a981c1147cf928c48e87b89dc4a', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1234', '5', '2016-02-01', '2169-11-13', '2016-02-01 10:42:06', '1');
INSERT INTO `te_tsp_auth` VALUES ('8d248b147b0b4e83829145b082f23303', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1', '6', '2016-02-01', '2017-02-01', '2016-02-01 10:46:36', '1');
INSERT INTO `te_tsp_auth` VALUES ('8e9f7dadc96041ababa3d21a441aa99f', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '4321', '0', '2016-02-01', '2139-02-01', '2016-02-01 10:44:12', '1');
INSERT INTO `te_tsp_auth` VALUES ('928f63444c7246e2bcea6cb23123afd0', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1211', '0', '2016-02-03', '2139-02-03', '2016-02-03 09:33:49', '1');
INSERT INTO `te_tsp_auth` VALUES ('997c5ba328d448b1acd9d5cb6a24be75', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '22111', '0', '2016-02-03', '2139-02-03', '2016-02-03 09:32:20', '1');
INSERT INTO `te_tsp_auth` VALUES ('a31a79cab69441ec9dbd7b0c3911f68e', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123', '6', '2016-02-15', '2017-02-15', '2016-02-15 14:07:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('a5af3014c0084b72af5b3e054dfe2284', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '321321', '4', '2016-02-01', '2169-11-13', '2016-02-01 10:25:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('a67be081ad0f4b41b04693858b09d44d', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '11', '6', '2016-02-01', '2017-02-01', '2016-02-01 14:56:10', '1');
INSERT INTO `te_tsp_auth` VALUES ('acfa228519af4a088eac18b58a7562b7', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '21', '4', '2016-02-01', '2169-11-13', '2016-02-01 14:22:11', '1');
INSERT INTO `te_tsp_auth` VALUES ('ae733c000fa24876931af7f857fe94c9', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', 'CG001543267646000195', '6', '2016-01-27', '2017-01-27', '2016-01-27 21:42:26', '1');
INSERT INTO `te_tsp_auth` VALUES ('b053aba6d8444357bc487357a826f7ee', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '32111', '4', '2016-02-15', '2169-11-13', '2016-02-15 13:43:09', '1');
INSERT INTO `te_tsp_auth` VALUES ('b254cb6ab6854a4aa97e83dc30d65845', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123321', '5', '2016-02-01', '2169-11-13', '2016-02-01 10:23:56', '1');
INSERT INTO `te_tsp_auth` VALUES ('b270ebc609a54418bea96c4ea0bdaa8b', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '321321', '5', '2016-02-01', '2169-11-13', '2016-02-01 10:25:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('b53e9549aaf9459b8c55b69c497d0a5a', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1122211', '5', '2016-02-15', '2169-11-13', '2016-02-15 14:11:19', '1');
INSERT INTO `te_tsp_auth` VALUES ('b84b780b920d4c128a5e8a7ff964c99e', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1', '4', '2016-02-01', '2169-11-13', '2016-02-01 10:46:36', '1');
INSERT INTO `te_tsp_auth` VALUES ('b92df9ff506840bbbc0651ac7a59867f', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1122211', '4', '2016-02-15', '2169-11-13', '2016-02-15 14:11:19', '1');
INSERT INTO `te_tsp_auth` VALUES ('ba06e1482656457e8d0fb54902cadb73', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '11', '4', '2016-02-01', '2169-11-13', '2016-02-01 14:56:10', '1');
INSERT INTO `te_tsp_auth` VALUES ('bd0506b96d1f48c8be39d4c5d659f7cc', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '4321', '6', '2016-02-01', '2017-02-01', '2016-02-01 10:44:12', '1');
INSERT INTO `te_tsp_auth` VALUES ('be0efa2186704a069a51e651ec7c09b6', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1331', '4', '2016-02-03', '2169-11-13', '2016-02-03 09:39:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('c29fa72b9c2644b8a745a5bd19e2b309', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '321', '5', '2016-01-28', '2169-11-13', '2016-01-28 14:24:02', '1');
INSERT INTO `te_tsp_auth` VALUES ('c63d948e0e0c45aa853ea357b07d4187', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '112', '4', '2016-02-03', '2169-11-13', '2016-02-03 09:28:25', '1');
INSERT INTO `te_tsp_auth` VALUES ('c69533c14ca34899a82d81a69b0e68fc', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '21221', '0', '2016-02-15', '2139-02-15', '2016-02-15 13:43:47', '1');
INSERT INTO `te_tsp_auth` VALUES ('d3e6974e15fe4b7daaca578665d8340c', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '3211', '0', '2016-02-03', '2139-02-03', '2016-02-03 15:14:12', '1');
INSERT INTO `te_tsp_auth` VALUES ('d62187cb00934e8b9e35c335b1c01e8b', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123', '5', '2016-02-15', '2169-11-13', '2016-02-15 14:07:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('d74160ebafb84a598e6270dd994d5b3e', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '112', '0', '2016-02-03', '2139-02-03', '2016-02-03 09:28:25', '1');
INSERT INTO `te_tsp_auth` VALUES ('d86273257a574465aed728d30326a9e3', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '32121', '0', '2016-02-15', '2139-02-15', '2016-02-15 14:08:22', '1');
INSERT INTO `te_tsp_auth` VALUES ('d95a55732d1a4112b513fc0373749424', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123', '4', '2016-02-15', '2169-11-13', '2016-02-15 14:07:29', '1');
INSERT INTO `te_tsp_auth` VALUES ('dc3929012d5749c29ed9883746fcce72', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '112', '6', '2016-02-03', '2017-02-03', '2016-02-03 09:28:25', '1');
INSERT INTO `te_tsp_auth` VALUES ('deeeab8d75114299b4c853ec21eb2d27', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '21', '6', '2016-02-01', '2017-02-01', '2016-02-01 14:22:11', '1');
INSERT INTO `te_tsp_auth` VALUES ('df4eced66af5479582977ff7e77620f3', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', 'CG001543267646000195', '5', '2016-01-27', '2017-01-27', '2016-01-27 21:42:26', '1');
INSERT INTO `te_tsp_auth` VALUES ('e495f4109cda47d4b4e6b70b437818dc', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '2211', '5', '2016-02-03', '2169-11-13', '2016-02-03 09:30:20', '1');
INSERT INTO `te_tsp_auth` VALUES ('e5156afaf67c48348e52cd2a2d7983b5', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '3211', '4', '2016-02-03', '2169-11-13', '2016-02-03 15:14:12', '1');
INSERT INTO `te_tsp_auth` VALUES ('e6f39d11326941558112fc100aaad50d', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '11211', '6', '2016-02-03', '2017-02-03', '2016-02-03 09:45:46', '1');
INSERT INTO `te_tsp_auth` VALUES ('e8675307a2a0413dafdc1490ee73c45f', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '31221', '6', '2016-02-02', '2017-02-02', '2016-02-02 11:28:46', '1');
INSERT INTO `te_tsp_auth` VALUES ('ee7123d846614a4cb02eb7f9f6cf8982', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '32111', '0', '2016-02-15', '2139-02-15', '2016-02-15 13:43:09', '1');
INSERT INTO `te_tsp_auth` VALUES ('f5958cd23dc74f92a58683808ff3c49a', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '1122211', '6', '2016-02-15', '2017-02-15', '2016-02-15 14:11:19', '1');
INSERT INTO `te_tsp_auth` VALUES ('f724eec533894a0d8c1dd41915bd7dcd', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '21221', '5', '2016-02-15', '2169-11-13', '2016-02-15 13:43:47', '1');
INSERT INTO `te_tsp_auth` VALUES ('f9965b31a8db4443ad6082b586254477', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '123321123', '4', '2016-02-02', '2169-11-13', '2016-02-02 11:26:59', '1');
INSERT INTO `te_tsp_auth` VALUES ('faa999a471d94ddd90c3fdbfc5df4858', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '4321', '4', '2016-02-01', '2169-11-13', '2016-02-01 10:44:12', '1');
INSERT INTO `te_tsp_auth` VALUES ('fd32bf46c5544078aa88ab097a3f7ae0', 'aec81a441b214097bcb0ce10cc3e6d83', '610301', '11', '0', '2016-02-01', '2139-02-01', '2016-02-01 14:56:10', '1');

-- ----------------------------
-- Table structure for tr_device_user
-- ----------------------------
DROP TABLE IF EXISTS `tr_device_user`;
CREATE TABLE `tr_device_user` (
  `device_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`device_no`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tr_device_user
-- ----------------------------
