/*
Navicat MySQL Data Transfer

Source Server         : 192.168.220.128
Source Server Version : 50562
Source Host           : 192.168.220.128:3306
Source Database       : spring_boot_stady_demo_consumer

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-05-12 11:34:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'yang', '1', '0', '2020-05-12 11:27:00', '1', 'dd');
INSERT INTO `sys_role` VALUES ('2', 'cheng', '2', '0', '2020-05-06 11:27:49', '2', 'dd');
