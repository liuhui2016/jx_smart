/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : forkliftn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2015-12-29 17:34:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acc_authority
-- ----------------------------
DROP TABLE IF EXISTS `acc_authority`;
CREATE TABLE `acc_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `is_menu` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` double NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `menu_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKECFE8D05D5C21891` (`resource_id`) USING BTREE,
  KEY `FKECFE8D0542F3215C` (`parent_id`) USING BTREE,
  KEY `FKECFE8D05B1658BB7` (`resource_id`) USING BTREE,
  KEY `FKECFE8D05DBBE12F6` (`parent_id`) USING BTREE,
  CONSTRAINT `acc_authority_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `acc_resource` (`id`),
  CONSTRAINT `acc_authority_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `acc_authority` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_authority
-- ----------------------------
INSERT INTO `acc_authority` VALUES ('946', null, '系统管理', '', 'sys_menu', '7', null, '767', 'sys.png');
INSERT INTO `acc_authority` VALUES ('947', null, '用户及角色', '', 'sys_menu_user_role', '1', '946', null, null);
INSERT INTO `acc_authority` VALUES ('948', null, '用户管理', '', 'sys_menu_user', '0', '947', '726', null);
INSERT INTO `acc_authority` VALUES ('949', null, '用户查看', '\0', 'sys_user_view', '0', '948', null, null);
INSERT INTO `acc_authority` VALUES ('950', null, '用户增加', '\0', 'sys_user_add', '0', '948', null, null);
INSERT INTO `acc_authority` VALUES ('951', null, '用户删除', '\0', 'sys_user_delete', '0', '948', null, null);
INSERT INTO `acc_authority` VALUES ('952', null, '用户修改', '\0', 'sys_user_edit', '0', '948', null, null);
INSERT INTO `acc_authority` VALUES ('953', null, '角色管理', '', 'sys_menu_role', '1', '947', '729', null);
INSERT INTO `acc_authority` VALUES ('954', null, '角色查看', '\0', 'sys_role_view', '0', '953', null, null);
INSERT INTO `acc_authority` VALUES ('955', null, '角色增加', '\0', 'sys_role_add', '0', '953', null, null);
INSERT INTO `acc_authority` VALUES ('956', null, '角色删除', '\0', 'sys_role_delete', '0', '953', null, null);
INSERT INTO `acc_authority` VALUES ('957', null, '操作域管理', '', 'sys_menu_domain', '2', '946', '732', null);
INSERT INTO `acc_authority` VALUES ('958', null, '操作域查看', '\0', 'sys_domain_view', '0', '957', null, null);
INSERT INTO `acc_authority` VALUES ('959', null, '操作域增加', '\0', 'sys_domain_add', '0', '957', null, null);
INSERT INTO `acc_authority` VALUES ('960', null, '操作域删除', '\0', 'sys_domain_delete', '0', '957', null, null);
INSERT INTO `acc_authority` VALUES ('961', null, '日志管理', '', 'sys_menu_journal', '3', '946', '735', null);
INSERT INTO `acc_authority` VALUES ('962', null, '公告管理', '', 'sys_menu_announcement', '4', '946', '736', null);
INSERT INTO `acc_authority` VALUES ('963', null, '公告查看', '\0', 'sys_announcement_view', '0', '962', null, null);
INSERT INTO `acc_authority` VALUES ('964', null, '公告删除', '\0', 'sys_announcement_delete', '0', '962', null, null);
INSERT INTO `acc_authority` VALUES ('965', null, '公告增加', '\0', 'sys_announcement_add', '0', '962', null, null);
INSERT INTO `acc_authority` VALUES ('966', null, '公告修改', '\0', 'sys_announcement_edit', '0', '962', null, null);
INSERT INTO `acc_authority` VALUES ('967', null, '用户配置', '', 'sys_menu_user_profile', '5', '946', null, null);
INSERT INTO `acc_authority` VALUES ('968', null, '常用菜单管理', '', 'sys_menu_custom_menu', '1', '967', '739', null);
INSERT INTO `acc_authority` VALUES ('969', null, '个人信息修改', '', 'sys_menu_personal', '2', '967', '742', null);
INSERT INTO `acc_authority` VALUES ('970', null, '系统设置', '', 'sys_dev_menu', '6', '946', null, null);
INSERT INTO `acc_authority` VALUES ('971', null, '资源管理', '', 'sys_menu_resource', '1', '970', '743', null);
INSERT INTO `acc_authority` VALUES ('972', null, '资源查看', '\0', 'sys_resource_view', '0', '971', null, null);
INSERT INTO `acc_authority` VALUES ('973', null, '资源增加', '\0', 'sys_resource_add', '0', '971', null, null);
INSERT INTO `acc_authority` VALUES ('974', null, '资源删除', '\0', 'sys_resource_delete', '0', '971', null, null);
INSERT INTO `acc_authority` VALUES ('975', null, '资源修改', '\0', 'sys_resource_edit', '0', '971', null, null);
INSERT INTO `acc_authority` VALUES ('976', null, '权限&菜单管理', '', 'sys_menu_authority', '2', '970', '746', null);
INSERT INTO `acc_authority` VALUES ('977', null, '权限查看', '\0', 'sys_authority_view', '0', '976', null, null);
INSERT INTO `acc_authority` VALUES ('978', null, '权限增加', '\0', 'sys_authority_add', '0', '976', null, null);
INSERT INTO `acc_authority` VALUES ('979', null, '权限删除', '\0', 'sys_authority_delete', '0', '976', null, null);
INSERT INTO `acc_authority` VALUES ('980', null, '调度程序管理', '', 'sys_schedule', '3', '970', '753', null);
INSERT INTO `acc_authority` VALUES ('981', null, '计划任务增加', '\0', 'sys_schedule_add', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('982', null, '计划任务修改', '\0', 'sys_schedule_edit', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('983', null, '计划任务删除', '\0', 'sys_schedule_delete', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('984', null, '计划任务触发', '\0', 'sys_schedule_tigger', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('985', null, '计划任务开始', '\0', 'sys_schedule_start', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('986', null, '计划任务终止', '\0', 'sys_schedule_stop', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('987', null, '计划任务恢复', '\0', 'sys_schedule_resume', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('988', null, '计划任务暂停', '\0', 'sys_schedule_pause', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('989', null, '计划任务强制终止', '\0', 'sys_schedule_interrupt', '0', '980', null, null);
INSERT INTO `acc_authority` VALUES ('990', null, 'ORM日志', '', 'sys_menu_history', '4', '970', '754', null);
INSERT INTO `acc_authority` VALUES ('991', null, '日志及分析', '', 'sys_menu_logging', '5', '970', '755', null);
INSERT INTO `acc_authority` VALUES ('992', null, '发送E-mail', '', 'sys_menu_sendmail', '6', '970', '756', null);
INSERT INTO `acc_authority` VALUES ('993', null, 'Mail服务器设置', '', 'sys_menu_mailconf', '7', '970', '760', null);
INSERT INTO `acc_authority` VALUES ('994', null, 'mail修改', '\0', 'sys_mailconf_edit', '0', '993', null, null);
INSERT INTO `acc_authority` VALUES ('995', null, 'mail发送', '\0', 'sys_mailconf_send', '0', '993', null, null);
INSERT INTO `acc_authority` VALUES ('996', null, '系统信息', '', 'sys_menu_system', '8', '970', '761', null);
INSERT INTO `acc_authority` VALUES ('997', null, '运行监控', '', 'sys_menu_ehcache', '9', '970', '762', null);
INSERT INTO `acc_authority` VALUES ('998', null, '在线用户', '', 'sys_menu_userlist', '10', '970', '763', null);
INSERT INTO `acc_authority` VALUES ('999', null, '消息队列', '', 'sys_menu_queue', '11', '970', '764', null);
INSERT INTO `acc_authority` VALUES ('1000', null, 'Email队列', '', 'sys_menu_emailqueue', '13', '970', '765', null);
INSERT INTO `acc_authority` VALUES ('1001', null, 'Struts2配置', '', 'sys_menu_struts2', '14', '970', '766', null);
INSERT INTO `acc_authority` VALUES ('1002', null, '数据维护', '', 'common_imple', '6.4', null, '782', 'data.png');
INSERT INTO `acc_authority` VALUES ('1003', null, '资料维护', '', 'base_files', '0', '1002', '768', null);
INSERT INTO `acc_authority` VALUES ('1004', null, '资料查看', '\0', 'base_files_view', '0', '1003', null, null);
INSERT INTO `acc_authority` VALUES ('1005', null, '资料增加', '\0', 'base_files_add', '0', '1003', null, null);
INSERT INTO `acc_authority` VALUES ('1006', null, '资料删除', '\0', 'base_files_delete', '0', '1003', null, null);
INSERT INTO `acc_authority` VALUES ('1007', null, '数据字典', '', 'base_DICT', '0', '1002', '771', null);
INSERT INTO `acc_authority` VALUES ('1008', null, '编码对照', '', 'base_CODE', '0', '1002', '772', null);
INSERT INTO `acc_authority` VALUES ('1009', null, '方式类别', '', 'base_DIC', '0', '1002', '773', null);
INSERT INTO `acc_authority` VALUES ('1010', null, '方式类别查看', '\0', 'base_DIC_view', '0', '1009', null, null);
INSERT INTO `acc_authority` VALUES ('1011', null, '方式类别增加', '\0', 'base_DIC_add', '0', '1009', null, null);
INSERT INTO `acc_authority` VALUES ('1012', null, '方式类别删除', '\0', 'base_DIC_delete', '0', '1009', null, null);
INSERT INTO `acc_authority` VALUES ('1013', null, '通用数据导入', '', 'common_import', '1', '1002', null, null);
INSERT INTO `acc_authority` VALUES ('1014', null, '业务数据导入', '', 'common_business_imple', '1', '1013', '776', null);
INSERT INTO `acc_authority` VALUES ('1015', null, '基础数据导入', '', 'common_basedata_imple', '2', '1013', '777', null);
INSERT INTO `acc_authority` VALUES ('1016', null, '系统配置数据维护', '', 'common_sysinit_data', '4', '1002', null, null);
INSERT INTO `acc_authority` VALUES ('1017', null, '方式类别', '', 'common_sysinit_data_dic', '1', '1016', '778', null);
INSERT INTO `acc_authority` VALUES ('1018', null, '管理域', '', 'common_sysinit_data_domain', '2', '1016', '779', null);
INSERT INTO `acc_authority` VALUES ('1019', null, '计划任务', '', 'common_sysinit_data_quartz', '4', '1016', '780', null);
INSERT INTO `acc_authority` VALUES ('1020', null, '权限信息', '', 'common_sysinit_data_auth', '5', '1016', '781', null);
INSERT INTO `acc_authority` VALUES ('1021', '', '业务管理', '', 'busi_', '6', null, '784', 'data.png');
INSERT INTO `acc_authority` VALUES ('1022', '', '流行推荐管理', '', 'busi_recommend', '2', '1021', '783', '');
INSERT INTO `acc_authority` VALUES ('1023', '', '图片管理', '', 'busi_picr', '0.2', '1021', '785', '');
INSERT INTO `acc_authority` VALUES ('1024', '', '热词管理', '', 'busi_hotwords', '3', '1021', '786', '');

-- ----------------------------
-- Table structure for acc_authority_resource
-- ----------------------------
DROP TABLE IF EXISTS `acc_authority_resource`;
CREATE TABLE `acc_authority_resource` (
  `authority_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  PRIMARY KEY (`authority_id`,`resource_id`),
  KEY `FKFA903E08FE66F023` (`authority_id`) USING BTREE,
  KEY `FKFA903E08D5C21891` (`resource_id`) USING BTREE,
  KEY `FKFA903E089731E1BD` (`authority_id`) USING BTREE,
  KEY `FKFA903E08B1658BB7` (`resource_id`) USING BTREE,
  CONSTRAINT `acc_authority_resource_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `acc_authority` (`id`),
  CONSTRAINT `acc_authority_resource_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `acc_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_authority_resource
-- ----------------------------
INSERT INTO `acc_authority_resource` VALUES ('949', '726');
INSERT INTO `acc_authority_resource` VALUES ('950', '727');
INSERT INTO `acc_authority_resource` VALUES ('951', '726');
INSERT INTO `acc_authority_resource` VALUES ('951', '728');
INSERT INTO `acc_authority_resource` VALUES ('954', '729');
INSERT INTO `acc_authority_resource` VALUES ('955', '730');
INSERT INTO `acc_authority_resource` VALUES ('956', '729');
INSERT INTO `acc_authority_resource` VALUES ('956', '731');
INSERT INTO `acc_authority_resource` VALUES ('957', '732');
INSERT INTO `acc_authority_resource` VALUES ('958', '732');
INSERT INTO `acc_authority_resource` VALUES ('959', '733');
INSERT INTO `acc_authority_resource` VALUES ('960', '732');
INSERT INTO `acc_authority_resource` VALUES ('960', '734');
INSERT INTO `acc_authority_resource` VALUES ('961', '735');
INSERT INTO `acc_authority_resource` VALUES ('962', '736');
INSERT INTO `acc_authority_resource` VALUES ('963', '736');
INSERT INTO `acc_authority_resource` VALUES ('964', '737');
INSERT INTO `acc_authority_resource` VALUES ('965', '738');
INSERT INTO `acc_authority_resource` VALUES ('968', '739');
INSERT INTO `acc_authority_resource` VALUES ('968', '740');
INSERT INTO `acc_authority_resource` VALUES ('968', '741');
INSERT INTO `acc_authority_resource` VALUES ('969', '742');
INSERT INTO `acc_authority_resource` VALUES ('972', '743');
INSERT INTO `acc_authority_resource` VALUES ('973', '744');
INSERT INTO `acc_authority_resource` VALUES ('974', '743');
INSERT INTO `acc_authority_resource` VALUES ('974', '745');
INSERT INTO `acc_authority_resource` VALUES ('977', '746');
INSERT INTO `acc_authority_resource` VALUES ('978', '747');
INSERT INTO `acc_authority_resource` VALUES ('979', '746');
INSERT INTO `acc_authority_resource` VALUES ('979', '748');
INSERT INTO `acc_authority_resource` VALUES ('981', '749');
INSERT INTO `acc_authority_resource` VALUES ('981', '750');
INSERT INTO `acc_authority_resource` VALUES ('982', '749');
INSERT INTO `acc_authority_resource` VALUES ('982', '751');
INSERT INTO `acc_authority_resource` VALUES ('983', '752');
INSERT INTO `acc_authority_resource` VALUES ('994', '757');
INSERT INTO `acc_authority_resource` VALUES ('994', '758');
INSERT INTO `acc_authority_resource` VALUES ('995', '759');
INSERT INTO `acc_authority_resource` VALUES ('1004', '768');
INSERT INTO `acc_authority_resource` VALUES ('1005', '769');
INSERT INTO `acc_authority_resource` VALUES ('1006', '770');
INSERT INTO `acc_authority_resource` VALUES ('1007', '771');
INSERT INTO `acc_authority_resource` VALUES ('1008', '772');
INSERT INTO `acc_authority_resource` VALUES ('1010', '773');
INSERT INTO `acc_authority_resource` VALUES ('1011', '774');
INSERT INTO `acc_authority_resource` VALUES ('1012', '775');

-- ----------------------------
-- Table structure for acc_custom_menu
-- ----------------------------
DROP TABLE IF EXISTS `acc_custom_menu`;
CREATE TABLE `acc_custom_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority_id` bigint(20) DEFAULT NULL,
  `position` double NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1289DEAF220AC6B2` (`user_id`) USING BTREE,
  KEY `FK1289DEAF6B7FE102` (`authority_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_custom_menu
-- ----------------------------

-- ----------------------------
-- Table structure for acc_domain
-- ----------------------------
DROP TABLE IF EXISTS `acc_domain`;
CREATE TABLE `acc_domain` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `auto_code` bigint(20) DEFAULT NULL,
  `base` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `position` double NOT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  `sharing` bit(1) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `state` bit(1) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `FK64C2F642DCDEC8EB` (`parent_id`) USING BTREE,
  KEY `FK64C2F64274F0CD91` (`parent_id`) USING BTREE,
  CONSTRAINT `acc_domain_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `acc_domain` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_domain
-- ----------------------------
INSERT INTO `acc_domain` VALUES ('domain', '1', null, '2011-07-12 14:54:44', 'admin', '2011-07-12 17:44:33', null, '', '1000000000000000000', '', 'qc', '此节点不要删除', 'QC', 'CN.BJ', null, null, '0', null, '\0', 'root', '', null);

-- ----------------------------
-- Table structure for acc_group
-- ----------------------------
DROP TABLE IF EXISTS `acc_group`;
CREATE TABLE `acc_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_group
-- ----------------------------

-- ----------------------------
-- Table structure for acc_group_role
-- ----------------------------
DROP TABLE IF EXISTS `acc_group_role`;
CREATE TABLE `acc_group_role` (
  `group_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK58B6ACB43CE24311` (`role_id`) USING BTREE,
  KEY `FK58B6ACB48CD9E323` (`group_id`) USING BTREE,
  KEY `FK58B6ACB476D93937` (`role_id`) USING BTREE,
  KEY `FK58B6ACB491C1B1BD` (`group_id`) USING BTREE,
  CONSTRAINT `acc_group_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acc_role` (`id`),
  CONSTRAINT `acc_group_role_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `acc_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_group_role
-- ----------------------------

-- ----------------------------
-- Table structure for acc_group_user
-- ----------------------------
DROP TABLE IF EXISTS `acc_group_user`;
CREATE TABLE `acc_group_user` (
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  KEY `FK58B81809E20D06F1` (`user_id`) USING BTREE,
  KEY `FK58B818098CD9E323` (`group_id`) USING BTREE,
  KEY `FK58B818091C03FD17` (`user_id`) USING BTREE,
  KEY `FK58B8180991C1B1BD` (`group_id`) USING BTREE,
  CONSTRAINT `acc_group_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acc_user` (`id`),
  CONSTRAINT `acc_group_user_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `acc_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_group_user
-- ----------------------------

-- ----------------------------
-- Table structure for acc_resource
-- ----------------------------
DROP TABLE IF EXISTS `acc_resource`;
CREATE TABLE `acc_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `res_string` varchar(255) DEFAULT NULL,
  `res_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `res_string` (`res_string`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_resource
-- ----------------------------
INSERT INTO `acc_resource` VALUES ('726', null, null, null, null, '', '浏览用户', '/account/user.action*', 'url');
INSERT INTO `acc_resource` VALUES ('727', null, null, null, null, '修改保存用户信息，包括新增修改操作', '修改用户', '/account/user!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('728', null, null, null, null, '', '删除用户', '/account/user!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('729', null, null, null, null, '', '浏览角色', '/account/role.action*', 'url');
INSERT INTO `acc_resource` VALUES ('730', null, null, null, null, '', '修改角色', '/account/role!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('731', null, null, null, null, '', '删除角色', '/account/role!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('732', null, null, null, null, '', '浏览操作域', '/account/domain.action*', 'url');
INSERT INTO `acc_resource` VALUES ('733', null, null, null, null, '', '修改操作域', '/account/domain!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('734', null, null, null, null, '', '删除操作域', '/account/domain!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('735', null, null, null, null, '', '浏览日志', '/system/journal.action*', 'url');
INSERT INTO `acc_resource` VALUES ('736', null, null, null, null, '', '浏览公告', '/system/announcement.action*', 'url');
INSERT INTO `acc_resource` VALUES ('737', null, null, null, null, '', '删除公告', '/system/announcement!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('738', null, null, null, null, '', '修改公告', '/system/announcement!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('739', null, null, null, null, '', '浏览常用操作', '/account/custom-menu.action*', 'url');
INSERT INTO `acc_resource` VALUES ('740', null, null, null, null, '', '修改常用操作', '/account/custom-menu!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('741', null, null, null, null, '', '删除常用操作', '/account/custom-menu!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('742', null, null, null, null, '信息、密码修改', '个人信息修改', '/account/user!modify.action*', 'url');
INSERT INTO `acc_resource` VALUES ('743', null, null, null, null, '', '浏览资源', '/account/resource.action*', 'url');
INSERT INTO `acc_resource` VALUES ('744', null, null, null, null, '', '修改资源', '/account/resource!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('745', null, null, null, null, '', '删除资源', '/account/resource!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('746', null, null, null, null, '', '浏览权限', '/account/authority.action*', 'url');
INSERT INTO `acc_resource` VALUES ('747', null, null, null, null, '', '修改权限', '/account/authority!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('748', null, null, null, null, '', '删除权限', '/account/authority!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('749', null, null, null, null, null, '计划任务保存', '/system/quartz!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('750', null, null, null, null, null, '计划任务新增', '/system/quartz!input.action*', 'url');
INSERT INTO `acc_resource` VALUES ('751', null, null, null, null, null, '计划任务编辑', '/system/quartz!input.action?id=*', 'url');
INSERT INTO `acc_resource` VALUES ('752', null, null, null, null, '', '计划任务删除', '/system/quartz!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('753', null, null, null, null, '计划任务浏览', '计划任务浏览', '/system/quartz.action*', 'url');
INSERT INTO `acc_resource` VALUES ('754', null, null, null, null, '', 'ORM日志查看', '/system/journal!historyList.action*', 'url');
INSERT INTO `acc_resource` VALUES ('755', null, null, null, null, '', '日志及分析', '/system/logging.action*', 'url');
INSERT INTO `acc_resource` VALUES ('756', null, null, null, null, '', '发送E-mail', '/system/sendmail.action*', 'url');
INSERT INTO `acc_resource` VALUES ('757', null, null, null, null, null, 'mail保存', '/system/mailconf!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('758', null, null, null, null, null, 'mail编辑', '/system/mailconf!input.action?id=*', 'url');
INSERT INTO `acc_resource` VALUES ('759', null, null, null, null, '', 'mail发送', '/system/mailconf!testMail.action*', 'url');
INSERT INTO `acc_resource` VALUES ('760', null, null, null, null, '', 'Mail服务器设置', '/system/mailconf.action*', 'url');
INSERT INTO `acc_resource` VALUES ('761', null, null, null, null, '', '系统信息', '/system/system.action*', 'url');
INSERT INTO `acc_resource` VALUES ('762', null, null, null, null, '', '运行监控', '/main/ehcache.action*', 'url');
INSERT INTO `acc_resource` VALUES ('763', null, null, null, null, '', '在线用户', '/system/userlist.action*', 'url');
INSERT INTO `acc_resource` VALUES ('764', null, null, null, null, '', '消息队列', '/system/queue.action*', 'url');
INSERT INTO `acc_resource` VALUES ('765', null, null, null, null, '', 'Email队列', '/system/sendmail!emailqueue.action*', 'url');
INSERT INTO `acc_resource` VALUES ('766', null, null, null, null, '', 'Struts2Config', '/config-browser/index.action*', 'url');
INSERT INTO `acc_resource` VALUES ('767', null, null, null, null, '', '系统管理默认页', '/main/system.action*', 'url');
INSERT INTO `acc_resource` VALUES ('768', null, null, null, null, '', '资料管理', '/common/files.action*', 'url');
INSERT INTO `acc_resource` VALUES ('769', null, null, null, null, '', '资料修改', '/common/files!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('770', null, null, null, null, '', '资料删除', '/common/files!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('771', null, null, null, null, '', '数据字典', '/system/dic!dict.action*', 'url');
INSERT INTO `acc_resource` VALUES ('772', null, null, null, null, '', '编码对照', '/system/dic!code.action*', 'url');
INSERT INTO `acc_resource` VALUES ('773', null, null, null, null, '', '方式类别管理', '/system/dic.action*', 'url');
INSERT INTO `acc_resource` VALUES ('774', null, null, null, null, '', '方式类别修改', '/system/dic!save.action*', 'url');
INSERT INTO `acc_resource` VALUES ('775', null, null, null, null, '', '方式类别删除', '/system/dic!delete.action*', 'url');
INSERT INTO `acc_resource` VALUES ('776', null, null, null, null, '', '业务数据导入', '/common/data-import-excel!execute.action?type=business', 'url');
INSERT INTO `acc_resource` VALUES ('777', null, null, null, null, '', '基础数据导入', '/common/data-import-excel!execute.action?type=basedata', 'url');
INSERT INTO `acc_resource` VALUES ('778', 'admin', null, null, null, null, '方式类别', '/common/sysinit.action?type=dic*', 'url');
INSERT INTO `acc_resource` VALUES ('779', null, null, null, null, '', '管理域', '/common/sysinit.action?type=domain*', 'url');
INSERT INTO `acc_resource` VALUES ('780', null, null, null, null, '', '计划任务', '/common/sysinit.action?type=quartz*', 'url');
INSERT INTO `acc_resource` VALUES ('781', null, null, null, null, '', '权限信息', '/common/sysinit.action?type=auth*', 'url');
INSERT INTO `acc_resource` VALUES ('782', null, null, null, null, '', '数据维护', '/main/data-import.action*', 'url');
INSERT INTO `acc_resource` VALUES ('783', 'admin', '2015-12-16 11:07:28', null, null, '', '流行推荐管理', '/bmanager/recommend/recommend.action*', 'url');
INSERT INTO `acc_resource` VALUES ('784', 'admin', '2015-12-16 11:10:43', null, null, '', '业务管理默认页', '/main/busi.action*', 'url');
INSERT INTO `acc_resource` VALUES ('785', 'admin', '2015-12-17 17:41:09', null, null, '', '图片管理', '/comm/picr/picr!list.action*', 'url');
INSERT INTO `acc_resource` VALUES ('786', 'admin', '2015-12-17 17:41:54', null, null, '', '热词管理', '/bmanager/hotWords/hot-words.action*', 'url');

-- ----------------------------
-- Table structure for acc_role
-- ----------------------------
DROP TABLE IF EXISTS `acc_role`;
CREATE TABLE `acc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_role
-- ----------------------------
INSERT INTO `acc_role` VALUES ('1', 'admin', null, 'admin', '2015-12-29 17:33:53', '超级的 开发人员专用', '超级系统管理员', 'supermen');
INSERT INTO `acc_role` VALUES ('3', 'admin', '2014-12-18 14:51:45', 'admin', '2014-12-30 13:38:56', '', '测试人员', 'role_test');

-- ----------------------------
-- Table structure for acc_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `acc_role_authority`;
CREATE TABLE `acc_role_authority` (
  `role_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  KEY `FK3CC1AA383CE24311` (`role_id`) USING BTREE,
  KEY `FK3CC1AA38FE66F023` (`authority_id`) USING BTREE,
  KEY `FK3CC1AA3876D93937` (`role_id`) USING BTREE,
  KEY `FK3CC1AA389731E1BD` (`authority_id`) USING BTREE,
  CONSTRAINT `acc_role_authority_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acc_role` (`id`),
  CONSTRAINT `acc_role_authority_ibfk_2` FOREIGN KEY (`authority_id`) REFERENCES `acc_authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_role_authority
-- ----------------------------
INSERT INTO `acc_role_authority` VALUES ('3', '946');
INSERT INTO `acc_role_authority` VALUES ('3', '967');
INSERT INTO `acc_role_authority` VALUES ('3', '968');
INSERT INTO `acc_role_authority` VALUES ('3', '969');
INSERT INTO `acc_role_authority` VALUES ('1', '946');
INSERT INTO `acc_role_authority` VALUES ('1', '947');
INSERT INTO `acc_role_authority` VALUES ('1', '948');
INSERT INTO `acc_role_authority` VALUES ('1', '949');
INSERT INTO `acc_role_authority` VALUES ('1', '950');
INSERT INTO `acc_role_authority` VALUES ('1', '951');
INSERT INTO `acc_role_authority` VALUES ('1', '952');
INSERT INTO `acc_role_authority` VALUES ('1', '953');
INSERT INTO `acc_role_authority` VALUES ('1', '954');
INSERT INTO `acc_role_authority` VALUES ('1', '955');
INSERT INTO `acc_role_authority` VALUES ('1', '956');
INSERT INTO `acc_role_authority` VALUES ('1', '957');
INSERT INTO `acc_role_authority` VALUES ('1', '958');
INSERT INTO `acc_role_authority` VALUES ('1', '959');
INSERT INTO `acc_role_authority` VALUES ('1', '960');
INSERT INTO `acc_role_authority` VALUES ('1', '962');
INSERT INTO `acc_role_authority` VALUES ('1', '963');
INSERT INTO `acc_role_authority` VALUES ('1', '964');
INSERT INTO `acc_role_authority` VALUES ('1', '965');
INSERT INTO `acc_role_authority` VALUES ('1', '966');
INSERT INTO `acc_role_authority` VALUES ('1', '967');
INSERT INTO `acc_role_authority` VALUES ('1', '968');
INSERT INTO `acc_role_authority` VALUES ('1', '969');
INSERT INTO `acc_role_authority` VALUES ('1', '970');
INSERT INTO `acc_role_authority` VALUES ('1', '971');
INSERT INTO `acc_role_authority` VALUES ('1', '972');
INSERT INTO `acc_role_authority` VALUES ('1', '973');
INSERT INTO `acc_role_authority` VALUES ('1', '974');
INSERT INTO `acc_role_authority` VALUES ('1', '975');
INSERT INTO `acc_role_authority` VALUES ('1', '976');
INSERT INTO `acc_role_authority` VALUES ('1', '977');
INSERT INTO `acc_role_authority` VALUES ('1', '978');
INSERT INTO `acc_role_authority` VALUES ('1', '979');
INSERT INTO `acc_role_authority` VALUES ('1', '980');
INSERT INTO `acc_role_authority` VALUES ('1', '981');
INSERT INTO `acc_role_authority` VALUES ('1', '982');
INSERT INTO `acc_role_authority` VALUES ('1', '983');
INSERT INTO `acc_role_authority` VALUES ('1', '984');
INSERT INTO `acc_role_authority` VALUES ('1', '985');
INSERT INTO `acc_role_authority` VALUES ('1', '986');
INSERT INTO `acc_role_authority` VALUES ('1', '987');
INSERT INTO `acc_role_authority` VALUES ('1', '988');
INSERT INTO `acc_role_authority` VALUES ('1', '989');
INSERT INTO `acc_role_authority` VALUES ('1', '990');
INSERT INTO `acc_role_authority` VALUES ('1', '991');
INSERT INTO `acc_role_authority` VALUES ('1', '996');
INSERT INTO `acc_role_authority` VALUES ('1', '997');
INSERT INTO `acc_role_authority` VALUES ('1', '998');
INSERT INTO `acc_role_authority` VALUES ('1', '999');
INSERT INTO `acc_role_authority` VALUES ('1', '1001');
INSERT INTO `acc_role_authority` VALUES ('1', '1002');
INSERT INTO `acc_role_authority` VALUES ('1', '1009');
INSERT INTO `acc_role_authority` VALUES ('1', '1010');
INSERT INTO `acc_role_authority` VALUES ('1', '1011');
INSERT INTO `acc_role_authority` VALUES ('1', '1012');
INSERT INTO `acc_role_authority` VALUES ('1', '1021');
INSERT INTO `acc_role_authority` VALUES ('1', '1022');

-- ----------------------------
-- Table structure for acc_user
-- ----------------------------
DROP TABLE IF EXISTS `acc_user`;
CREATE TABLE `acc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `account_enabled` bit(1) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `real_name` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `certificate_no` varchar(255) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) DEFAULT NULL,
  `married` bit(1) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `start_work_date` datetime DEFAULT NULL,
  `cuscode` varchar(255) DEFAULT NULL,
  `custom_id` varchar(255) DEFAULT NULL,
  `user_group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `FK7FBC54C9885E4E91` (`domain_id`) USING BTREE,
  KEY `FK7FBC54C920705337` (`domain_id`) USING BTREE,
  CONSTRAINT `acc_user_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `acc_domain` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_user
-- ----------------------------
INSERT INTO `acc_user` VALUES ('1', 'admin', null, 'admin', '2011-08-08 14:49:32', '\0', '\0', '\0', '', 'topstcn@126.com', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', '13910784818', '管理员', 'admin', '18', '1', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for acc_user_role_grant
-- ----------------------------
DROP TABLE IF EXISTS `acc_user_role_grant`;
CREATE TABLE `acc_user_role_grant` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK94924D493CE24311` (`role_id`) USING BTREE,
  KEY `FK94924D49E20D06F1` (`user_id`) USING BTREE,
  KEY `FK94924D4976D93937` (`role_id`) USING BTREE,
  KEY `FK94924D491C03FD17` (`user_id`) USING BTREE,
  CONSTRAINT `acc_user_role_grant_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acc_user` (`id`),
  CONSTRAINT `acc_user_role_grant_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `acc_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_user_role_grant
-- ----------------------------

-- ----------------------------
-- Table structure for acc_user_role_use
-- ----------------------------
DROP TABLE IF EXISTS `acc_user_role_use`;
CREATE TABLE `acc_user_role_use` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK501278F43CE24311` (`role_id`) USING BTREE,
  KEY `FK501278F4E20D06F1` (`user_id`) USING BTREE,
  KEY `FK501278F476D93937` (`role_id`) USING BTREE,
  KEY `FK501278F41C03FD17` (`user_id`) USING BTREE,
  CONSTRAINT `acc_user_role_use_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acc_user` (`id`),
  CONSTRAINT `acc_user_role_use_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `acc_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acc_user_role_use
-- ----------------------------
INSERT INTO `acc_user_role_use` VALUES ('1', '1');

-- ----------------------------
-- Table structure for browser_customer
-- ----------------------------
DROP TABLE IF EXISTS `browser_customer`;
CREATE TABLE `browser_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `begintime` varchar(255) DEFAULT NULL,
  `cdesc` varchar(255) DEFAULT NULL,
  `citys` text,
  `customerid` varchar(255) DEFAULT NULL,
  `customername` varchar(255) DEFAULT NULL,
  `devicecount` int(11) DEFAULT NULL,
  `deviceday` int(11) DEFAULT NULL,
  `endtime` varchar(255) DEFAULT NULL,
  `openrate` int(11) DEFAULT NULL,
  `passdevice` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `unitprice` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of browser_customer
-- ----------------------------
INSERT INTO `browser_customer` VALUES ('1', 'admin', '2015-12-15 15:15:30', 'admin', '2015-12-15 15:15:37', '00:00:00', '', '|1000|1001|1|1002|5|1003|6|1004|7|1005|104|105|106|107|108|109|110|111|112|113|114|115|116|118|119|120|121|1006|122|123|124|125|126|127|128|129|130|1007|219|221|223|225|226|228|230|233|235|236|238|240|242|246|1008|255|257|261|263|265|267|268|269|271|273|276|278|281|282|283|285|288|290|292|295|297|1009|300|302|304|306|308|309|310|312|315|316|317|319|320|321|1010|293|294|296|298|299|301|303|305|307|363|364|367|1011|318|322|366|368|1012|10|11|12|13|14|15|16|17|18|19|20|1013|160|161|164|166|167|168|169|170|171|173|175|177|181|184|186|188|190|192|1014|67|68|69|70|71|72|73|74|75|76|77|78|79|1015|194|196|202|204|206|207|209|211|214|216|217|218|220|222|224|227|229|1016|231|232|234|237|239|241|243|244|245|247|248|250|252|253|365|1017|58|59|60|61|62|63|64|65|66|362|1018|80|81|82|83|84|85|86|87|88|89|90|91|92|1019|131|132|133|134|135|136|137|138|139|140|141|1020|44|45|46|47|48|49|50|51|52|53|54|55|56|57|1021|32|33|34|35|36|37|38|39|40|41|42|43|1022|208|210|212|213|215|1023|197|198|199|200|201|203|205|360|378|1024|142|143|144|145|146|147|148|149|150|151|152|153|154|155|156|157|158|1025|21|22|23|24|25|26|27|28|29|30|31|1026|249|251|254|256|258|259|260|262|264|266|1027|311|313|314|323|324|325|326|327|328|329|330|331|332|333|334|335|336|337|338|339|340|370|1028|270|272|274|275|277|279|280|1029|159|162|163|165|172|174|176|178|179|180|182|183|185|187|189|191|193|195|359|361|369|372|373|374|375|376|1030|284|286|287|289|291|342|343|344|346|347|349|350|351|352|353|354|355|371|1031|93|94|95|96|97|98|99|100|101|102|103|1035|1036|10000|356|357|358|10001|10002|10003|10004|10005|10006|10007|10008|10009|10010|10011|10012|10013|10014|10015|10016|10017|10018|10019|10020|10021|10022|10023|10024|10025|10026|10027|10028|10029|10030|10031|10032|10033|10034|10035|10036|10037|10038|10039|10040|10041|10042|10043|10044|10045|10046|10047|10048|10049|10050|10051|10052|10053|10054|10055|10056|10057|10058|10059|10060|10061|10062|10063|10064|10065|10066|10067|10068|10069|10070|10071|10072|10073|10074|10075|10076|10077|10078|10079|10080|10081|10082|10083|10084|10085|10086|10087|10088|10089|10090|10091|10092|10093|10094|10095|10096|10097|10098|10099|10100|10101|10102|10103|10104|10105|10106|10107|10108|10109|10110|10111|10112|10113|10114|10115|10116|10117|10118|10119|10120|10121|10122|10123|10124|10125|10126|10127|10128|10129|10130|10131|10132|10133|10134|10135|10136|10137|10138|10139|10140|10141|10142|10143|10144|10145|10146|10147|10148|10149|10150|10151|10152|10153|10154|10155|10156|10157|10158|10159|10160|10161|10162|10163|10164|10165|10166|10167|10168|10169|10170|10171|10172|10173|10174|10175|10176|10177|10178|10179|10180|10181|10182|10183|10184|10185|10186|10187|10188|10189|10190|10191|10192|10193|10194|10195|10196|10197|10198|10199|10200|10201|10202|10203|10204|10205|10206|10207|10208|10209|10210|10211|10212|10213|10214|10215|10216|10217|10218|10219|10220|10221|10222|10223|10224|10225|10226|10227|10228|10229|10230|10231|10232|10233|10234|10235|10236|10237|10238|10239|10240|10241|10242|10243|10244|10245|10246|10247|10248|10249|10250|10251|19999|', 'S0006001', 'A0001001', '20', '7', '23:59:59', '100', '0', '1', '10');

-- ----------------------------
-- Table structure for browser_log_index
-- ----------------------------
DROP TABLE IF EXISTS `browser_log_index`;
CREATE TABLE `browser_log_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `accesstime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(20) DEFAULT NULL,
  `country_id` bigint(11) DEFAULT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `docking_sessionid` varchar(100) DEFAULT NULL,
  `cookie_sessionid` varchar(100) DEFAULT NULL,
  `sessionid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of browser_log_index
-- ----------------------------

-- ----------------------------
-- Table structure for common_city
-- ----------------------------
DROP TABLE IF EXISTS `common_city`;
CREATE TABLE `common_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `pinyin` varchar(50) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `continent` smallint(6) DEFAULT NULL COMMENT '所属洲',
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_city
-- ----------------------------
INSERT INTO `common_city` VALUES ('1', '北京', '1001', 'bj', '北京', null, null);
INSERT INTO `common_city` VALUES ('5', '上海', '1002', 'shanghai', '上海', null, null);
INSERT INTO `common_city` VALUES ('6', '天津', '1003', 'tianjin', '天津', null, null);
INSERT INTO `common_city` VALUES ('7', '重庆', '1004', 'chongqing', '重庆', null, null);
INSERT INTO `common_city` VALUES ('10', '石家庄', '1012', 'shijiazhuang', '河北', null, null);
INSERT INTO `common_city` VALUES ('11', '邯郸', '1012', 'handan', '河北', null, null);
INSERT INTO `common_city` VALUES ('12', '邢台', '1012', 'xingtai', '河北', null, null);
INSERT INTO `common_city` VALUES ('13', '保定', '1012', 'baoding', '河北', null, null);
INSERT INTO `common_city` VALUES ('14', '张家口', '1012', 'zhangjiakou', '河北', null, null);
INSERT INTO `common_city` VALUES ('15', '承德', '1012', 'chengde', '河北', null, null);
INSERT INTO `common_city` VALUES ('16', '廊坊', '1012', 'langfang', '河北', null, null);
INSERT INTO `common_city` VALUES ('17', '唐山', '1012', 'tangshan', '河北', null, null);
INSERT INTO `common_city` VALUES ('18', '秦皇岛', '1012', 'qinhuangdao', '河北', null, null);
INSERT INTO `common_city` VALUES ('19', '沧州', '1012', 'cangzhou', '河北', null, null);
INSERT INTO `common_city` VALUES ('20', '衡水', '1012', 'hengshui', '河北', null, null);
INSERT INTO `common_city` VALUES ('21', '太原', '1025', 'taiyuan', '山西', null, null);
INSERT INTO `common_city` VALUES ('22', '大同', '1025', 'datong', '山西', null, null);
INSERT INTO `common_city` VALUES ('23', '阳泉', '1025', 'yangquan', '山西', null, null);
INSERT INTO `common_city` VALUES ('24', '长治', '1025', 'changzhi', '山西', null, null);
INSERT INTO `common_city` VALUES ('25', '晋城', '1025', 'jincheng', '山西', null, null);
INSERT INTO `common_city` VALUES ('26', '朔州', '1025', 'shuozhou', '山西', null, null);
INSERT INTO `common_city` VALUES ('27', '吕梁', '1025', 'lvliang', '山西', null, null);
INSERT INTO `common_city` VALUES ('28', '忻州', '1025', 'xinzhou', '山西', null, null);
INSERT INTO `common_city` VALUES ('29', '晋中', '1025', 'jinzhong', '山西', null, null);
INSERT INTO `common_city` VALUES ('30', '临汾', '1025', 'linfen', '山西', null, null);
INSERT INTO `common_city` VALUES ('31', '运城', '1025', 'yuncheng', '山西', null, null);
INSERT INTO `common_city` VALUES ('32', '呼和浩特', '1021', 'huhehaote', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('33', '包头', '1021', 'baotou', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('34', '乌海', '1021', 'wuhai', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('35', '赤峰', '1021', 'chifeng', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('36', '呼伦贝尔', '1021', 'hulunbeier', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('37', '阿拉善盟', '1021', 'alashanmeng', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('38', '鄂尔多斯', '1021', 'eerduosi', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('39', '兴安盟', '1021', 'xinganmeng', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('40', '乌兰察布', '1021', 'wulanchabu', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('41', '锡林郭勒盟', '1021', 'xilinguolemeng', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('42', '巴彦淖尔', '1021', 'bayannaoer', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('43', '通辽', '1021', 'tongliao', '内蒙古', null, null);
INSERT INTO `common_city` VALUES ('44', '沈阳', '1020', 'shenyang', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('45', '大连', '1020', 'dalian', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('46', '鞍山', '1020', 'anshan', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('47', '抚顺', '1020', 'fushun', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('48', '本溪', '1020', 'benxi', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('49', '丹东', '1020', 'dandong', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('50', '锦州', '1020', 'jinzhou', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('51', '营口', '1020', 'yingkou', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('52', '阜新', '1020', 'fuxin', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('53', '辽阳', '1020', 'liaoyang', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('54', '盘锦', '1020', 'panjin', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('55', '铁岭', '1020', 'tieling', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('56', '朝阳', '1020', 'chaoyang', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('57', '葫芦岛', '1020', 'huludao', '辽宁', null, null);
INSERT INTO `common_city` VALUES ('58', '长春', '1017', 'changchun', '吉林', null, null);
INSERT INTO `common_city` VALUES ('59', '吉林', '1017', 'jilin', '吉林', null, null);
INSERT INTO `common_city` VALUES ('60', '四平', '1017', 'siping', '吉林', null, null);
INSERT INTO `common_city` VALUES ('61', '辽源', '1017', 'liaoyuan', '吉林', null, null);
INSERT INTO `common_city` VALUES ('62', '通化', '1017', 'tonghua', '吉林', null, null);
INSERT INTO `common_city` VALUES ('63', '白山', '1017', 'baishan', '吉林', null, null);
INSERT INTO `common_city` VALUES ('64', '松原', '1017', 'songyuan', '吉林', null, null);
INSERT INTO `common_city` VALUES ('65', '白城', '1017', 'baicheng', '吉林', null, null);
INSERT INTO `common_city` VALUES ('66', '延边', '1017', 'yanbian', '吉林', null, null);
INSERT INTO `common_city` VALUES ('67', '哈尔滨', '1014', 'haerbin', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('68', '齐齐哈尔', '1014', 'qiqihaer', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('69', '牡丹江', '1014', 'mudanjiang', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('70', '佳木斯', '1014', 'jiamusi', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('71', '大庆', '1014', 'daqing', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('72', '绥化', '1014', 'suihua', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('73', '鹤岗', '1014', 'hegang', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('74', '鸡西', '1014', 'jixi', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('75', '黑河', '1014', 'heihe', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('76', '双鸭山', '1014', 'shuangyashan', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('77', '伊春', '1014', 'yichun', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('78', '七台河', '1014', 'qitaihe', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('79', '大兴安岭', '1014', 'daxinganling', '黑龙江', null, null);
INSERT INTO `common_city` VALUES ('80', '南京', '1018', 'nanjing', '江苏', null, null);
INSERT INTO `common_city` VALUES ('81', '镇江', '1018', 'zhenjiang', '江苏', null, null);
INSERT INTO `common_city` VALUES ('82', '苏州', '1018', 'suzhou', '江苏', null, null);
INSERT INTO `common_city` VALUES ('83', '南通', '1018', 'nantong', '江苏', null, null);
INSERT INTO `common_city` VALUES ('84', '扬州', '1018', 'yangzhou', '江苏', null, null);
INSERT INTO `common_city` VALUES ('85', '盐城', '1018', 'yancheng', '江苏', null, null);
INSERT INTO `common_city` VALUES ('86', '徐州', '1018', 'xuzhou', '江苏', null, null);
INSERT INTO `common_city` VALUES ('87', '连云港', '1018', 'lianyungang', '江苏', null, null);
INSERT INTO `common_city` VALUES ('88', '常州', '1018', 'changzhou', '江苏', null, null);
INSERT INTO `common_city` VALUES ('89', '无锡', '1018', 'wuxi', '江苏', null, null);
INSERT INTO `common_city` VALUES ('90', '宿迁', '1018', 'suqian', '江苏', null, null);
INSERT INTO `common_city` VALUES ('91', '泰州', '1018', 'taizhou', '江苏', null, null);
INSERT INTO `common_city` VALUES ('92', '淮安', '1018', 'huaian', '江苏', null, null);
INSERT INTO `common_city` VALUES ('93', '杭州', '1031', 'hangzhou', '浙江', null, null);
INSERT INTO `common_city` VALUES ('94', '宁波', '1031', 'ningbo', '浙江', null, null);
INSERT INTO `common_city` VALUES ('95', '温州', '1031', 'wenzhou', '浙江', null, null);
INSERT INTO `common_city` VALUES ('96', '嘉兴', '1031', 'jiaxing', '浙江', null, null);
INSERT INTO `common_city` VALUES ('97', '湖州', '1031', 'huzhou', '浙江', null, null);
INSERT INTO `common_city` VALUES ('98', '绍兴', '1031', 'shaoxing', '浙江', null, null);
INSERT INTO `common_city` VALUES ('99', '金华', '1031', 'jinhua', '浙江', null, null);
INSERT INTO `common_city` VALUES ('100', '衢州', '1031', 'zhou', '浙江', null, null);
INSERT INTO `common_city` VALUES ('101', '舟山', '1031', 'zhoushan', '浙江', null, null);
INSERT INTO `common_city` VALUES ('102', '台州', '1031', 'taizh', '浙江', null, null);
INSERT INTO `common_city` VALUES ('103', '丽水', '1031', 'lishui', '浙江', null, null);
INSERT INTO `common_city` VALUES ('104', '合肥', '1005', 'hefei', '安徽', null, null);
INSERT INTO `common_city` VALUES ('105', '芜湖', '1005', 'wuhu', '安徽', null, null);
INSERT INTO `common_city` VALUES ('106', '蚌埠', '1005', 'bangbu', '安徽', null, null);
INSERT INTO `common_city` VALUES ('107', '马鞍山', '1005', 'maanshan', '安徽', null, null);
INSERT INTO `common_city` VALUES ('108', '淮北', '1005', 'huaibei', '安徽', null, null);
INSERT INTO `common_city` VALUES ('109', '铜陵', '1005', 'tongling', '安徽', null, null);
INSERT INTO `common_city` VALUES ('110', '安庆', '1005', 'anqing', '安徽', null, null);
INSERT INTO `common_city` VALUES ('111', '黄山', '1005', 'huangshan', '安徽', null, null);
INSERT INTO `common_city` VALUES ('112', '滁州', '1005', 'chuzhou', '安徽', null, null);
INSERT INTO `common_city` VALUES ('113', '宿州', '1005', 'ahsz', '安徽', null, null);
INSERT INTO `common_city` VALUES ('114', '池州', '1005', 'chizhou', '安徽', null, null);
INSERT INTO `common_city` VALUES ('115', '淮南', '1005', 'huainan', '安徽', null, null);
INSERT INTO `common_city` VALUES ('116', '巢湖', '1005', 'chaohu', '安徽', null, null);
INSERT INTO `common_city` VALUES ('118', '阜阳', '1005', 'fuyang', '安徽', null, null);
INSERT INTO `common_city` VALUES ('119', '六安', '1005', 'liuan', '安徽', null, null);
INSERT INTO `common_city` VALUES ('120', '宣城', '1005', 'xuancheng', '安徽', null, null);
INSERT INTO `common_city` VALUES ('121', '亳州', '1005', 'haozhou', '安徽', null, null);
INSERT INTO `common_city` VALUES ('122', '福州', '1006', 'fjfuzhou', '福建', null, null);
INSERT INTO `common_city` VALUES ('123', '厦门', '1006', 'xiamen', '福建', null, null);
INSERT INTO `common_city` VALUES ('124', '莆田', '1006', 'putian', '福建', null, null);
INSERT INTO `common_city` VALUES ('125', '三明', '1006', 'sanming', '福建', null, null);
INSERT INTO `common_city` VALUES ('126', '泉州', '1006', 'quanzhou', '福建', null, null);
INSERT INTO `common_city` VALUES ('127', '漳州', '1006', 'zhangzhou', '福建', null, null);
INSERT INTO `common_city` VALUES ('128', '南平', '1006', 'nanping', '福建', null, null);
INSERT INTO `common_city` VALUES ('129', '龙岩', '1006', 'longyan', '福建', null, null);
INSERT INTO `common_city` VALUES ('130', '宁德', '1006', 'ningde', '福建', null, null);
INSERT INTO `common_city` VALUES ('131', '南昌', '1019', 'nanchang', '江西', null, null);
INSERT INTO `common_city` VALUES ('132', '景德镇', '1019', 'jingdezhen', '江西', null, null);
INSERT INTO `common_city` VALUES ('133', '九江', '1019', 'jiujiang', '江西', null, null);
INSERT INTO `common_city` VALUES ('134', '鹰潭', '1019', 'yingtan', '江西', null, null);
INSERT INTO `common_city` VALUES ('135', '萍乡', '1019', 'pingxiang', '江西', null, null);
INSERT INTO `common_city` VALUES ('136', '新余', '1019', 'xinyu', '江西', null, null);
INSERT INTO `common_city` VALUES ('137', '赣州', '1019', 'ganzhou', '江西', null, null);
INSERT INTO `common_city` VALUES ('138', '吉安', '1019', 'jian', '江西', null, null);
INSERT INTO `common_city` VALUES ('139', '宜春', '1019', 'jxyichun', '江西', null, null);
INSERT INTO `common_city` VALUES ('140', '抚州', '1019', 'fuzhou', '江西', null, null);
INSERT INTO `common_city` VALUES ('141', '上饶', '1019', 'shangrao', '江西', null, null);
INSERT INTO `common_city` VALUES ('142', '济南', '1024', 'jinan', '山东', null, null);
INSERT INTO `common_city` VALUES ('143', '青岛', '1024', 'qingdao', '山东', null, null);
INSERT INTO `common_city` VALUES ('144', '淄博', '1024', 'zibo', '山东', null, null);
INSERT INTO `common_city` VALUES ('145', '枣庄', '1024', 'zaozhuang', '山东', null, null);
INSERT INTO `common_city` VALUES ('146', '东营', '1024', 'dongying', '山东', null, null);
INSERT INTO `common_city` VALUES ('147', '烟台', '1024', 'yantai', '山东', null, null);
INSERT INTO `common_city` VALUES ('148', '潍坊', '1024', 'weifang', '山东', null, null);
INSERT INTO `common_city` VALUES ('149', '济宁', '1024', 'jining', '山东', null, null);
INSERT INTO `common_city` VALUES ('150', '泰安', '1024', 'taian', '山东', null, null);
INSERT INTO `common_city` VALUES ('151', '威海', '1024', 'weihai', '山东', null, null);
INSERT INTO `common_city` VALUES ('152', '日照', '1024', 'rizhao', '山东', null, null);
INSERT INTO `common_city` VALUES ('153', '莱芜', '1024', 'laiwu', '山东', null, null);
INSERT INTO `common_city` VALUES ('154', '临沂', '1024', 'linyi', '山东', null, null);
INSERT INTO `common_city` VALUES ('155', '德州', '1024', 'dezhou', '山东', null, null);
INSERT INTO `common_city` VALUES ('156', '聊城', '1024', 'liaocheng', '山东', null, null);
INSERT INTO `common_city` VALUES ('157', '滨州', '1024', 'binzhou', '山东', null, null);
INSERT INTO `common_city` VALUES ('158', '菏泽', '1024', 'heze', '山东', null, null);
INSERT INTO `common_city` VALUES ('159', '乌鲁木齐', '1029', 'wulumuqi', '新疆', null, null);
INSERT INTO `common_city` VALUES ('160', '郑州', '1013', 'zhengzhou', '河南', null, null);
INSERT INTO `common_city` VALUES ('161', '开封', '1013', 'kaifeng', '河南', null, null);
INSERT INTO `common_city` VALUES ('162', '石河子', '1029', 'shihezi', '新疆', null, null);
INSERT INTO `common_city` VALUES ('163', '阿拉尔', '1029', 'alaer', '新疆', null, null);
INSERT INTO `common_city` VALUES ('164', '洛阳', '1013', 'luoyang', '河南', null, null);
INSERT INTO `common_city` VALUES ('165', '图木舒克', '1029', 'tumushuke', '新疆', null, null);
INSERT INTO `common_city` VALUES ('166', '平顶山', '1013', 'pingdingshan', '河南', null, null);
INSERT INTO `common_city` VALUES ('167', '安阳', '1013', 'anyang', '河南', null, null);
INSERT INTO `common_city` VALUES ('168', '鹤壁', '1013', 'hebi', '河南', null, null);
INSERT INTO `common_city` VALUES ('169', '新乡', '1013', 'xinxiang', '河南', null, null);
INSERT INTO `common_city` VALUES ('170', '焦作', '1013', 'jiaozuo', '河南', null, null);
INSERT INTO `common_city` VALUES ('171', '濮阳', '1013', 'puyang', '河南', null, null);
INSERT INTO `common_city` VALUES ('172', '五家渠', '1029', 'wujiaqu', '新疆', null, null);
INSERT INTO `common_city` VALUES ('173', '许昌', '1013', 'xuchang', '河南', null, null);
INSERT INTO `common_city` VALUES ('174', '塔城', '1029', 'tacheng', '新疆', null, null);
INSERT INTO `common_city` VALUES ('175', '漯河', '1013', 'luohe', '河南', null, null);
INSERT INTO `common_city` VALUES ('176', '阿勒泰', '1029', 'aletai', '新疆', null, null);
INSERT INTO `common_city` VALUES ('177', '三门峡', '1013', 'sanmenxia', '河南', null, null);
INSERT INTO `common_city` VALUES ('178', '克拉玛依', '1029', 'kelamayi', '新疆', null, null);
INSERT INTO `common_city` VALUES ('179', '伊犁', '1029', 'yili', '新疆', null, null);
INSERT INTO `common_city` VALUES ('180', '巴音郭楞', '1029', 'bayinguole', '新疆', null, null);
INSERT INTO `common_city` VALUES ('181', '南阳', '1013', 'nanyang', '河南', null, null);
INSERT INTO `common_city` VALUES ('182', '昌吉', '1029', 'changji', '新疆', null, null);
INSERT INTO `common_city` VALUES ('183', '克孜勒苏柯尔克孜', '1029', 'kezilesukeerkezi', '新疆', null, null);
INSERT INTO `common_city` VALUES ('184', '商丘', '1013', 'shangqiu', '河南', null, null);
INSERT INTO `common_city` VALUES ('185', '博尔塔拉', '1029', 'boertala', '新疆', null, null);
INSERT INTO `common_city` VALUES ('186', '信阳', '1013', 'xinyang', '河南', null, null);
INSERT INTO `common_city` VALUES ('187', '吐鲁番', '1029', 'tulufan', '新疆', null, null);
INSERT INTO `common_city` VALUES ('188', '周口', '1013', 'zhoukou', '河南', null, null);
INSERT INTO `common_city` VALUES ('189', '哈密', '1029', 'hami', '新疆', null, null);
INSERT INTO `common_city` VALUES ('190', '驻马店', '1013', 'zhumadian', '河南', null, null);
INSERT INTO `common_city` VALUES ('191', '喀什', '1029', 'kashi', '新疆', null, null);
INSERT INTO `common_city` VALUES ('192', '济源', '1013', 'jiyuan', '河南', null, null);
INSERT INTO `common_city` VALUES ('193', '和田', '1029', 'hetian', '新疆', null, null);
INSERT INTO `common_city` VALUES ('194', '武汉', '1015', 'wuhan', '湖北', null, null);
INSERT INTO `common_city` VALUES ('195', '阿克苏', '1029', 'akesu', '新疆', null, null);
INSERT INTO `common_city` VALUES ('196', '宜昌', '1015', 'yichang', '湖北', null, null);
INSERT INTO `common_city` VALUES ('197', '西宁', '1023', 'xining', '青海', null, null);
INSERT INTO `common_city` VALUES ('198', '海东', '1023', 'haidong', '青海', null, null);
INSERT INTO `common_city` VALUES ('199', '海南', '1023', 'hainan', '青海', null, null);
INSERT INTO `common_city` VALUES ('200', '海北', '1023', 'haibei', '青海', null, null);
INSERT INTO `common_city` VALUES ('201', '玉树', '1023', 'yushu', '青海', null, null);
INSERT INTO `common_city` VALUES ('202', '荆州', '1015', 'jingzhou', '湖北', null, null);
INSERT INTO `common_city` VALUES ('203', '果洛', '1023', 'guoluo', '青海', null, null);
INSERT INTO `common_city` VALUES ('204', '襄阳', '1015', 'xiangyang', '湖北', null, null);
INSERT INTO `common_city` VALUES ('205', '海西', '1023', 'haixi', '青海', null, null);
INSERT INTO `common_city` VALUES ('206', '黄石', '1015', 'huangshi', '湖北', null, null);
INSERT INTO `common_city` VALUES ('207', '荆门', '1015', 'jingmen', '湖北', null, null);
INSERT INTO `common_city` VALUES ('208', '银川', '1022', 'yinchuan', '宁夏', null, null);
INSERT INTO `common_city` VALUES ('209', '黄冈', '1015', 'huanggang', '湖北', null, null);
INSERT INTO `common_city` VALUES ('210', '石嘴山', '1022', 'shizuishan', '宁夏', null, null);
INSERT INTO `common_city` VALUES ('211', '十堰', '1015', 'shiyan', '湖北', null, null);
INSERT INTO `common_city` VALUES ('212', '吴忠', '1022', 'wuzhong', '宁夏', null, null);
INSERT INTO `common_city` VALUES ('213', '固原', '1022', 'guyuan', '宁夏', null, null);
INSERT INTO `common_city` VALUES ('214', '恩施', '1015', 'enshi', '湖北', null, null);
INSERT INTO `common_city` VALUES ('215', '中卫', '1022', 'zhongwei', '宁夏', null, null);
INSERT INTO `common_city` VALUES ('216', '潜江', '1015', 'qianjiang', '湖北', null, null);
INSERT INTO `common_city` VALUES ('217', '天门', '1015', 'tianmen', '湖北', null, null);
INSERT INTO `common_city` VALUES ('218', '神龙架林区', '1015', 'shenlongjialinqu', '湖北', null, null);
INSERT INTO `common_city` VALUES ('219', '兰州', '1007', 'lanzhou', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('220', '仙桃', '1015', 'xiantao', '湖北', null, null);
INSERT INTO `common_city` VALUES ('221', '嘉峪关', '1007', 'jiayuguan', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('222', '随州', '1015', 'suizhou', '湖北', null, null);
INSERT INTO `common_city` VALUES ('223', '金昌', '1007', 'jinchang', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('224', '咸宁', '1015', 'xianning', '湖北', null, null);
INSERT INTO `common_city` VALUES ('225', '白银', '1007', 'baiyin', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('226', '天水', '1007', 'tianshui', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('227', '孝感', '1015', 'xiaogan', '湖北', null, null);
INSERT INTO `common_city` VALUES ('228', '酒泉', '1007', 'jiuquan', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('229', '鄂州', '1015', 'ezhou', '湖北', null, null);
INSERT INTO `common_city` VALUES ('230', '张掖', '1007', 'zhangye', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('231', '长沙', '1016', 'changsha', '湖南', null, null);
INSERT INTO `common_city` VALUES ('232', '常德', '1016', 'changde', '湖南', null, null);
INSERT INTO `common_city` VALUES ('233', '武威', '1007', 'wuwei', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('234', '株洲', '1016', 'zhuzhou', '湖南', null, null);
INSERT INTO `common_city` VALUES ('235', '定西', '1007', 'dingxi', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('236', '陇南', '1007', 'longnan', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('237', '湘潭', '1016', 'xiangtan', '湖南', null, null);
INSERT INTO `common_city` VALUES ('238', '平凉', '1007', 'pingliang', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('239', '衡阳', '1016', 'hengyang', '湖南', null, null);
INSERT INTO `common_city` VALUES ('240', '庆阳', '1007', 'qingyang', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('241', '岳阳', '1016', 'yueyang', '湖南', null, null);
INSERT INTO `common_city` VALUES ('242', '临夏', '1007', 'linxia', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('243', '邵阳', '1016', 'shaoyang', '湖南', null, null);
INSERT INTO `common_city` VALUES ('244', '益阳', '1016', 'yiyang', '湖南', null, null);
INSERT INTO `common_city` VALUES ('245', '娄底', '1016', 'loudi', '湖南', null, null);
INSERT INTO `common_city` VALUES ('246', '甘南', '1007', 'gannan', '甘肃', null, null);
INSERT INTO `common_city` VALUES ('247', '怀化', '1016', 'huaihua', '湖南', null, null);
INSERT INTO `common_city` VALUES ('248', '郴州', '1016', 'chenzhou', '湖南', null, null);
INSERT INTO `common_city` VALUES ('249', '西安', '1026', 'xian', '陕西', null, null);
INSERT INTO `common_city` VALUES ('250', '永州', '1016', 'yongzhou', '湖南', null, null);
INSERT INTO `common_city` VALUES ('251', '宝鸡', '1026', 'baoji', '陕西', null, null);
INSERT INTO `common_city` VALUES ('252', '湘西', '1016', 'xiangxi', '湖南', null, null);
INSERT INTO `common_city` VALUES ('253', '张家界', '1016', 'zhangjiajie', '湖南', null, null);
INSERT INTO `common_city` VALUES ('254', '咸阳', '1026', 'xianyang', '陕西', null, null);
INSERT INTO `common_city` VALUES ('255', '广州', '1008', 'guangzhou', '广东', null, null);
INSERT INTO `common_city` VALUES ('256', '铜川', '1026', 'tongchuan', '陕西', null, null);
INSERT INTO `common_city` VALUES ('257', '深圳', '1008', 'shenzhen', '广东', null, null);
INSERT INTO `common_city` VALUES ('258', '渭南', '1026', 'weinan', '陕西', null, null);
INSERT INTO `common_city` VALUES ('259', '延安', '1026', 'yanan', '陕西', null, null);
INSERT INTO `common_city` VALUES ('260', '榆林', '1026', 'yulin', '陕西', null, null);
INSERT INTO `common_city` VALUES ('261', '珠海', '1008', 'zhuhai', '广东', null, null);
INSERT INTO `common_city` VALUES ('262', '汉中', '1026', 'hanzhong', '陕西', null, null);
INSERT INTO `common_city` VALUES ('263', '汕头', '1008', 'shantou', '广东', null, null);
INSERT INTO `common_city` VALUES ('264', '安康', '1026', 'ankang', '陕西', null, null);
INSERT INTO `common_city` VALUES ('265', '东莞', '1008', 'dongguan', '广东', null, null);
INSERT INTO `common_city` VALUES ('266', '商洛', '1026', 'shangluo', '陕西', null, null);
INSERT INTO `common_city` VALUES ('267', '中山', '1008', 'zhongshan', '广东', null, null);
INSERT INTO `common_city` VALUES ('268', '佛山', '1008', 'foshan', '广东', null, null);
INSERT INTO `common_city` VALUES ('269', '韶关', '1008', 'shaoguan', '广东', null, null);
INSERT INTO `common_city` VALUES ('270', '拉萨', '1028', 'lasa', '西藏', null, null);
INSERT INTO `common_city` VALUES ('271', '江门', '1008', 'jiangmen', '广东', null, null);
INSERT INTO `common_city` VALUES ('272', '日喀则', '1028', 'rikaze', '西藏', null, null);
INSERT INTO `common_city` VALUES ('273', '湛江', '1008', 'zhanjiang', '广东', null, null);
INSERT INTO `common_city` VALUES ('274', '山南', '1028', 'shannan', '西藏', null, null);
INSERT INTO `common_city` VALUES ('275', '林芝', '1028', 'linzhi', '西藏', null, null);
INSERT INTO `common_city` VALUES ('276', '茂名', '1008', 'maoming', '广东', null, null);
INSERT INTO `common_city` VALUES ('277', '昌都', '1028', 'changdu', '西藏', null, null);
INSERT INTO `common_city` VALUES ('278', '肇庆', '1008', 'zhaoqing', '广东', null, null);
INSERT INTO `common_city` VALUES ('279', '阿里', '1028', 'ali', '西藏', null, null);
INSERT INTO `common_city` VALUES ('280', '那曲', '1028', 'naqu', '西藏', null, null);
INSERT INTO `common_city` VALUES ('281', '惠州', '1008', 'huizhou', '广东', null, null);
INSERT INTO `common_city` VALUES ('282', '梅州', '1008', 'meizhou', '广东', null, null);
INSERT INTO `common_city` VALUES ('283', '汕尾', '1008', 'shanwei', '广东', null, null);
INSERT INTO `common_city` VALUES ('284', '昆明', '1030', 'kunming', '云南', null, null);
INSERT INTO `common_city` VALUES ('285', '河源', '1008', 'heyuan', '广东', null, null);
INSERT INTO `common_city` VALUES ('286', '大理', '1030', 'dali', '云南', null, null);
INSERT INTO `common_city` VALUES ('287', '曲靖', '1030', 'qujing', '云南', null, null);
INSERT INTO `common_city` VALUES ('288', '阳江', '1008', 'yangjiang', '广东', null, null);
INSERT INTO `common_city` VALUES ('289', '玉溪', '1030', 'yuxi', '云南', null, null);
INSERT INTO `common_city` VALUES ('290', '清远', '1008', 'qingyuan', '广东', null, null);
INSERT INTO `common_city` VALUES ('291', '楚雄', '1030', 'chuxiong', '云南', null, null);
INSERT INTO `common_city` VALUES ('292', '潮州', '1008', 'chaozhou', '广东', null, null);
INSERT INTO `common_city` VALUES ('293', '贵阳', '1010', 'guiyang', '贵州', null, null);
INSERT INTO `common_city` VALUES ('294', '六盘水', '1010', 'liupanshui', '贵州', null, null);
INSERT INTO `common_city` VALUES ('295', '揭阳', '1008', 'jieyang', '广东', null, null);
INSERT INTO `common_city` VALUES ('296', '遵义', '1010', 'zunyi', '贵州', null, null);
INSERT INTO `common_city` VALUES ('297', '云浮', '1008', 'yunfu', '广东', null, null);
INSERT INTO `common_city` VALUES ('298', '安顺', '1010', 'anshun', '贵州', null, null);
INSERT INTO `common_city` VALUES ('299', '铜仁', '1010', 'tongren', '贵州', null, null);
INSERT INTO `common_city` VALUES ('300', '南宁', '1009', 'nanning', '广西', null, null);
INSERT INTO `common_city` VALUES ('301', '黔西南', '1010', 'qianxinan', '贵州', null, null);
INSERT INTO `common_city` VALUES ('302', '柳州', '1009', 'liuzhou', '广西', null, null);
INSERT INTO `common_city` VALUES ('303', '毕节', '1010', 'bijie', '贵州', null, null);
INSERT INTO `common_city` VALUES ('304', '桂林', '1009', 'guilin', '广西', null, null);
INSERT INTO `common_city` VALUES ('305', '黔东南', '1010', 'qiandongnan', '贵州', null, null);
INSERT INTO `common_city` VALUES ('306', '梧州', '1009', 'wuzhou', '广西', null, null);
INSERT INTO `common_city` VALUES ('307', '黔南', '1010', 'qiannan', '贵州', null, null);
INSERT INTO `common_city` VALUES ('308', '北海', '1009', 'beihai', '广西', null, null);
INSERT INTO `common_city` VALUES ('309', '防城港', '1009', 'fangchenggang', '广西', null, null);
INSERT INTO `common_city` VALUES ('310', '钦州', '1009', 'qinzhou', '广西', null, null);
INSERT INTO `common_city` VALUES ('311', '成都', '1027', 'chengdu', '四川', null, null);
INSERT INTO `common_city` VALUES ('312', '贵港', '1009', 'guigang', '广西', null, null);
INSERT INTO `common_city` VALUES ('313', '绵阳', '1027', 'mianyang', '四川', null, null);
INSERT INTO `common_city` VALUES ('314', '德阳', '1027', 'deyang', '四川', null, null);
INSERT INTO `common_city` VALUES ('315', '玉林', '1009', 'gxyulin', '广西', null, null);
INSERT INTO `common_city` VALUES ('316', '贺州', '1009', 'hezhou', '广西', null, null);
INSERT INTO `common_city` VALUES ('317', '百色', '1009', 'baise', '广西', null, null);
INSERT INTO `common_city` VALUES ('318', '海口', '1011', 'haikou', '海南', null, null);
INSERT INTO `common_city` VALUES ('319', '河池', '1009', 'hechi', '广西', null, null);
INSERT INTO `common_city` VALUES ('320', '祟左', '1009', 'suizuo', '广西', null, null);
INSERT INTO `common_city` VALUES ('321', '来宾', '1009', 'laibin', '广西', null, null);
INSERT INTO `common_city` VALUES ('322', '三亚', '1011', 'sanya', '海南', null, null);
INSERT INTO `common_city` VALUES ('323', '自贡', '1027', 'zigong', '四川', null, null);
INSERT INTO `common_city` VALUES ('324', '攀枝花', '1027', 'panzhihua', '四川', null, null);
INSERT INTO `common_city` VALUES ('325', '广元', '1027', 'guangyuan', '四川', null, null);
INSERT INTO `common_city` VALUES ('326', '内江', '1027', 'neijiang', '四川', null, null);
INSERT INTO `common_city` VALUES ('327', '遂宁', '1027', 'suining', '四川', null, null);
INSERT INTO `common_city` VALUES ('328', '乐山', '1027', 'leshan', '四川', null, null);
INSERT INTO `common_city` VALUES ('329', '巴中', '1027', 'bazhong', '四川', null, null);
INSERT INTO `common_city` VALUES ('330', '资阳', '1027', 'ziyang', '四川', null, null);
INSERT INTO `common_city` VALUES ('331', '南充', '1027', 'nanchong', '四川', null, null);
INSERT INTO `common_city` VALUES ('332', '宜宾', '1027', 'yibin', '四川', null, null);
INSERT INTO `common_city` VALUES ('333', '泸州', '1027', 'luzhou', '四川', null, null);
INSERT INTO `common_city` VALUES ('334', '广安', '1027', 'guangan', '四川', null, null);
INSERT INTO `common_city` VALUES ('335', '达州', '1027', 'dazhou', '四川', null, null);
INSERT INTO `common_city` VALUES ('336', '雅安', '1027', 'yaan', '四川', null, null);
INSERT INTO `common_city` VALUES ('337', '眉山', '1027', 'meishan', '四川', null, null);
INSERT INTO `common_city` VALUES ('338', '甘孜', '1027', 'ganzi', '四川', null, null);
INSERT INTO `common_city` VALUES ('339', '凉山', '1027', 'liangshan', '四川', null, null);
INSERT INTO `common_city` VALUES ('340', '阿坝', '1027', 'aba', '四川', null, null);
INSERT INTO `common_city` VALUES ('342', '红河', '1030', 'honghe', '云南', null, null);
INSERT INTO `common_city` VALUES ('343', '文山', '1030', 'wenshan', '云南', null, null);
INSERT INTO `common_city` VALUES ('344', '思芧', '1030', 'simao', '云南', null, null);
INSERT INTO `common_city` VALUES ('346', '西双版纳', '1030', 'xishuangbanna', '云南', null, null);
INSERT INTO `common_city` VALUES ('347', '保山', '1030', 'baoshan', '云南', null, null);
INSERT INTO `common_city` VALUES ('349', '德宏', '1030', 'dehong', '云南', null, null);
INSERT INTO `common_city` VALUES ('350', '丽江', '1030', 'lijiang', '云南', null, null);
INSERT INTO `common_city` VALUES ('351', '怒江', '1030', 'nujiang', '云南', null, null);
INSERT INTO `common_city` VALUES ('352', '迪庆', '1030', 'diqing', '云南', null, null);
INSERT INTO `common_city` VALUES ('353', '临沧', '1030', 'lincang', '云南', null, null);
INSERT INTO `common_city` VALUES ('354', '普洱', '1030', 'puer', '云南', null, null);
INSERT INTO `common_city` VALUES ('355', '昭通', '1030', 'shaotong', '云南', null, null);
INSERT INTO `common_city` VALUES ('356', '台湾', '10000', 'taiwan', '台湾', '1', 'TW');
INSERT INTO `common_city` VALUES ('357', '香港', '10000', 'xianggang', '香港', '1', 'HK');
INSERT INTO `common_city` VALUES ('358', '澳门', '10000', 'aomen', '澳门', '1', 'MO');
INSERT INTO `common_city` VALUES ('359', '乌苏', '1029', 'wusu', '新疆', null, null);
INSERT INTO `common_city` VALUES ('360', '黄南', '1023', 'huangnan', '青海', null, null);
INSERT INTO `common_city` VALUES ('361', '阿克苏地区', '1029', 'akesudiqu', '新疆', null, null);
INSERT INTO `common_city` VALUES ('362', '延边州延吉', '1017', 'yuanbianzhouyuanji', '吉林', null, null);
INSERT INTO `common_city` VALUES ('363', '黔东南州凯里', '1010', 'kaili', '贵州', null, null);
INSERT INTO `common_city` VALUES ('364', '黔西南州兴义', '1010', 'xingyi', '贵州', null, null);
INSERT INTO `common_city` VALUES ('365', '湘西州吉首', '1016', 'jisheng', '湖南', null, null);
INSERT INTO `common_city` VALUES ('366', '琼海', '1011', 'qionghai', '海南', null, null);
INSERT INTO `common_city` VALUES ('367', '黔南州都匀', '1010', 'duyun', '贵州', null, null);
INSERT INTO `common_city` VALUES ('368', '儋州', '1011', 'zhangzhou', '海南', null, null);
INSERT INTO `common_city` VALUES ('369', '巴音郭楞州', '1029', 'bayinguomenzhou', '新疆', null, null);
INSERT INTO `common_city` VALUES ('370', '凉山州西昌', '1027', 'liangshangzhouxichang', '四川', null, null);
INSERT INTO `common_city` VALUES ('371', '西双版纳州景洪', '1030', 'hongjing', '云南', null, null);
INSERT INTO `common_city` VALUES ('372', '喀什地区', '1029', 'keshediqu', '新疆', null, null);
INSERT INTO `common_city` VALUES ('373', '塔城地区', '1029', 'tachengdiqu', '新疆', null, null);
INSERT INTO `common_city` VALUES ('374', '博尔塔拉州', '1029', 'boertalazhou', '新疆', null, null);
INSERT INTO `common_city` VALUES ('375', '昌吉州', '1029', 'changjizhou', '新疆', null, null);
INSERT INTO `common_city` VALUES ('376', '伊犁州', '1029', 'yilizhou', '新疆', null, null);
INSERT INTO `common_city` VALUES ('377', '台北', '1032', 'taibei', '台湾', null, null);
INSERT INTO `common_city` VALUES ('378', '海西州格尔木', '1023', 'geermu', '青海', null, null);
INSERT INTO `common_city` VALUES ('1000', '中国', '-1', 'CN', '中国', null, 'CN');
INSERT INTO `common_city` VALUES ('1001', '北京', '1000', 'beijing', '国内', null, null);
INSERT INTO `common_city` VALUES ('1002', '上海', '1000', 'shanghai', '国内', null, null);
INSERT INTO `common_city` VALUES ('1003', '天津', '1000', 'tianjing', '国内', null, null);
INSERT INTO `common_city` VALUES ('1004', '重庆', '1000', 'chongqing', '国内', null, null);
INSERT INTO `common_city` VALUES ('1005', '安徽', '1000', 'anhui', '国内', null, null);
INSERT INTO `common_city` VALUES ('1006', '福建', '1000', 'fujian', '国内', null, null);
INSERT INTO `common_city` VALUES ('1007', '甘肃', '1000', 'gansu', '国内', null, null);
INSERT INTO `common_city` VALUES ('1008', '广东', '1000', 'guangdong', '国内', null, null);
INSERT INTO `common_city` VALUES ('1009', '广西', '1000', 'guangxi', '国内', null, null);
INSERT INTO `common_city` VALUES ('1010', '贵州', '1000', 'guizhou', '国内', null, null);
INSERT INTO `common_city` VALUES ('1011', '海南', '1000', 'hainan', '国内', null, null);
INSERT INTO `common_city` VALUES ('1012', '河北', '1000', 'hebei', '国内', null, null);
INSERT INTO `common_city` VALUES ('1013', '河南', '1000', 'henan', '国内', null, null);
INSERT INTO `common_city` VALUES ('1014', '黑龙江', '1000', 'heilongjiang', '国内', null, null);
INSERT INTO `common_city` VALUES ('1015', '湖北', '1000', 'hubei', '国内', null, null);
INSERT INTO `common_city` VALUES ('1016', '湖南', '1000', 'hunan', '国内', null, null);
INSERT INTO `common_city` VALUES ('1017', '吉林', '1000', 'jilin', '国内', null, null);
INSERT INTO `common_city` VALUES ('1018', '江苏', '1000', 'jiangsu', '国内', null, null);
INSERT INTO `common_city` VALUES ('1019', '江西', '1000', 'jiangxi', '国内', null, null);
INSERT INTO `common_city` VALUES ('1020', '辽宁', '1000', 'liaoning', '国内', null, null);
INSERT INTO `common_city` VALUES ('1021', '内蒙古', '1000', 'neimenggu', '国内', null, null);
INSERT INTO `common_city` VALUES ('1022', '宁夏', '1000', 'ningxia', '国内', null, null);
INSERT INTO `common_city` VALUES ('1023', '青海', '1000', 'qinghai', '国内', null, null);
INSERT INTO `common_city` VALUES ('1024', '山东', '1000', 'shandong', '国内', null, null);
INSERT INTO `common_city` VALUES ('1025', '山西', '1000', 'shanxi1', '国内', null, null);
INSERT INTO `common_city` VALUES ('1026', '陕西', '1000', 'shanxi', '国内', null, null);
INSERT INTO `common_city` VALUES ('1027', '四川', '1000', 'sichuan', '国内', null, null);
INSERT INTO `common_city` VALUES ('1028', '西藏', '1000', 'xizang', '国内', null, null);
INSERT INTO `common_city` VALUES ('1029', '新疆', '1000', 'xinjiang', '国内', null, null);
INSERT INTO `common_city` VALUES ('1030', '云南', '1000', 'yunnan', '国内', null, null);
INSERT INTO `common_city` VALUES ('1031', '浙江', '1000', 'zhejiang', '国内', null, null);
INSERT INTO `common_city` VALUES ('1032', '台湾', '1000', 'taiwan', '国内', null, null);
INSERT INTO `common_city` VALUES ('1033', '香港', '1000', 'xianggang', '国内', null, 'HK');
INSERT INTO `common_city` VALUES ('1034', '澳门', '1000', 'aomen', '国内', null, 'MO');
INSERT INTO `common_city` VALUES ('1035', '局域网', '1000', 'juyuwang', '国内', null, null);
INSERT INTO `common_city` VALUES ('1036', '本机地址', '1000', 'benjidizhi', '国内', null, null);
INSERT INTO `common_city` VALUES ('10000', '国外', '-1', 'guowai', '', null, null);
INSERT INTO `common_city` VALUES ('10001', '安道尔', '10000', 'andaoer', '安道尔', '2', 'AD');
INSERT INTO `common_city` VALUES ('10002', '阿联酋', '10000', 'alianqiu', '阿联酋', '1', 'AE');
INSERT INTO `common_city` VALUES ('10003', '阿富汗', '10000', 'afuhan', '阿富汗', '1', 'AF');
INSERT INTO `common_city` VALUES ('10004', '安提瓜和巴布达', '10000', 'antiguahebabuda', '安提瓜和巴布达', '5', 'AG');
INSERT INTO `common_city` VALUES ('10005', '安格拉', '10000', 'angela', '安格拉', '3', null);
INSERT INTO `common_city` VALUES ('10006', '阿尔巴尼亚', '10000', 'aerbaniya', '阿尔巴尼亚', '2', 'AL');
INSERT INTO `common_city` VALUES ('10007', '亚美尼亚', '10000', 'yameiniya', '亚美尼亚', '1', 'AM');
INSERT INTO `common_city` VALUES ('10008', '荷兰属地', '10000', 'helanshudi', '荷兰属地', '2', null);
INSERT INTO `common_city` VALUES ('10009', '安哥拉', '10000', 'angela', '安哥拉', '3', 'AO');
INSERT INTO `common_city` VALUES ('10010', '阿根廷', '10000', 'agenting', '阿根廷', '6', 'AR');
INSERT INTO `common_city` VALUES ('10011', '东萨摩亚', '10000', 'dongshamoya', '东萨摩亚', '4', null);
INSERT INTO `common_city` VALUES ('10012', '奥地利', '10000', 'aodili', '奥地利', '2', 'AT');
INSERT INTO `common_city` VALUES ('10013', '澳大利亚', '10000', 'audaliya', '澳大利亚', '4', 'AU');
INSERT INTO `common_city` VALUES ('10014', '阿鲁巴', '10000', 'aluba', '阿鲁巴', '5', null);
INSERT INTO `common_city` VALUES ('10015', '阿塞拜疆', '10000', 'asaibangjiang', '阿塞拜疆', '1', 'AZ');
INSERT INTO `common_city` VALUES ('10016', '波黑', '10000', 'bohei', '波黑', '2', null);
INSERT INTO `common_city` VALUES ('10017', '巴巴多斯', '10000', 'babaduosi', '巴巴多斯', '5', 'BB');
INSERT INTO `common_city` VALUES ('10018', '孟加拉国', '10000', 'mengjialaguo', '孟加拉国', '1', 'BD');
INSERT INTO `common_city` VALUES ('10019', '比利时', '10000', 'bilishi', '比利时', '2', 'BE');
INSERT INTO `common_city` VALUES ('10020', '布基纳法索', '10000', 'bujinafasuo', '布基纳法索', '3', 'BF');
INSERT INTO `common_city` VALUES ('10021', '保加利亚', '10000', 'baojialiya', '保加利亚', '2', 'BG');
INSERT INTO `common_city` VALUES ('10022', '巴林', '10000', 'balin', '巴林', '1', 'BH');
INSERT INTO `common_city` VALUES ('10023', '布隆迪', '10000', 'bulongdi', '布隆迪', '3', 'BI');
INSERT INTO `common_city` VALUES ('10024', '贝宁', '10000', 'beining', '贝宁', '3', 'BJ');
INSERT INTO `common_city` VALUES ('10025', '文莱达鲁萨兰国', '10000', 'wenlaidalushalanguo', '文莱达鲁萨兰国', '1', null);
INSERT INTO `common_city` VALUES ('10026', '玻利维亚', '10000', 'boliweiya', '玻利维亚', '6', 'BO');
INSERT INTO `common_city` VALUES ('10027', '巴西', '10000', 'baxi', '巴西', '6', 'BR');
INSERT INTO `common_city` VALUES ('10028', '巴哈马', '10000', 'bahama', '巴哈马', '5', 'BS');
INSERT INTO `common_city` VALUES ('10029', '不丹', '10000', 'budan', '不丹', '1', null);
INSERT INTO `common_city` VALUES ('10030', '伯兹瓦纳', '10000', 'boziwana', '伯兹瓦纳', '3', null);
INSERT INTO `common_city` VALUES ('10031', '白俄罗斯', '10000', 'baierluosi', '白俄罗斯', '2', 'BY');
INSERT INTO `common_city` VALUES ('10032', '伯利兹', '10000', 'bolizi', '伯利兹', '5', 'BZ');
INSERT INTO `common_city` VALUES ('10033', '加拿大', '10000', 'jianada', '加拿大', '5', 'CA');
INSERT INTO `common_city` VALUES ('10034', '科科斯群岛', '10000', 'kekesiqundao', '科科斯群岛', '4', null);
INSERT INTO `common_city` VALUES ('10035', '中非共和国', '10000', 'zhongfeigongheguo', '中非共和国', '3', 'CF');
INSERT INTO `common_city` VALUES ('10036', '刚果(金)', '10000', 'gangguojin', '刚果(金)', '3', 'CG');
INSERT INTO `common_city` VALUES ('10037', '瑞士', '10000', 'ruishi', '瑞士', '2', 'CH');
INSERT INTO `common_city` VALUES ('10038', '象牙海岸', '10000', 'xiangyahaian', '象牙海岸', '3', null);
INSERT INTO `common_city` VALUES ('10039', '库克群岛', '10000', 'kukequndao', '库克群岛', '4', 'CK');
INSERT INTO `common_city` VALUES ('10040', '智利', '10000', 'zhili', '智利', '6', 'CL');
INSERT INTO `common_city` VALUES ('10041', '喀麦隆', '10000', 'gemailong', '喀麦隆', '3', 'CM');
INSERT INTO `common_city` VALUES ('10042', '哥伦比亚', '10000', 'gelunbiya', '哥伦比亚', '6', 'CO');
INSERT INTO `common_city` VALUES ('10043', '赤道几内亚', '10000', 'chidaojineiya', '赤道几内亚', '3', null);
INSERT INTO `common_city` VALUES ('10044', '哥斯达黎加', '10000', 'gesidalijia', '哥斯达黎加', '5', 'CR');
INSERT INTO `common_city` VALUES ('10045', '古巴', '10000', 'guba', '古巴', '5', 'CU');
INSERT INTO `common_city` VALUES ('10046', '圣诞岛', '10000', 'shengdandao', '圣诞岛', '4', null);
INSERT INTO `common_city` VALUES ('10047', '塞浦路斯', '10000', 'saipulusi', '塞浦路斯', '1', 'CY');
INSERT INTO `common_city` VALUES ('10048', '捷克共和国', '10000', 'jiekegongheguo', '捷克共和国', '2', null);
INSERT INTO `common_city` VALUES ('10049', '德国', '10000', 'deguo', '德国', '2', 'DE');
INSERT INTO `common_city` VALUES ('10050', '吉布提', '10000', 'jibuti', '吉布提', '3', 'DJ');
INSERT INTO `common_city` VALUES ('10051', '丹麦', '10000', 'danmai', '丹麦', '2', 'DK');
INSERT INTO `common_city` VALUES ('10052', '多米尼加联邦', '10000', 'duominijialianbang', '多米尼加联邦', '5', null);
INSERT INTO `common_city` VALUES ('10053', '多米尼加共和国', '10000', 'duominijiagongheguo', '多米尼加共和国', '5', 'DO');
INSERT INTO `common_city` VALUES ('10054', '阿尔及利亚', '10000', 'aerjiliya', '阿尔及利亚', '3', 'DZ');
INSERT INTO `common_city` VALUES ('10055', '厄瓜多尔', '10000', 'eguoduoer', '厄瓜多尔', '6', 'EC');
INSERT INTO `common_city` VALUES ('10056', '爱沙尼亚', '10000', 'aishaniya', '爱沙尼亚', '2', 'EE');
INSERT INTO `common_city` VALUES ('10057', '埃及', '10000', 'aiji', '埃及', '3', 'EG');
INSERT INTO `common_city` VALUES ('10058', '西萨摩亚', '10000', 'xishamoya', '西萨摩亚', '4', null);
INSERT INTO `common_city` VALUES ('10059', '西班牙', '10000', 'xibanya', '西班牙', '2', 'ES');
INSERT INTO `common_city` VALUES ('10060', '埃塞俄比亚', '10000', 'aisaierbiya', '埃塞俄比亚', '3', 'ET');
INSERT INTO `common_city` VALUES ('10061', '萨尔瓦多', '10000', 'shaerwaduo', '萨尔瓦多', '5', 'SV');
INSERT INTO `common_city` VALUES ('10062', '芬兰', '10000', 'fenlan', '芬兰', '2', 'FI');
INSERT INTO `common_city` VALUES ('10063', '斐济', '10000', 'feiji', '斐济', '4', 'FJ');
INSERT INTO `common_city` VALUES ('10064', '福克兰群岛', '10000', 'fukelanqundao', '福克兰群岛', '6', null);
INSERT INTO `common_city` VALUES ('10065', '密克罗尼西亚', '10000', 'mikeluonixiya', '密克罗尼西亚', '4', null);
INSERT INTO `common_city` VALUES ('10066', '法罗群岛', '10000', 'faluoqundao', '法罗群岛', '2', null);
INSERT INTO `common_city` VALUES ('10067', '法国', '10000', 'faguo', '法国', '2', 'FR');
INSERT INTO `common_city` VALUES ('10068', '加蓬', '10000', 'jiapeng', '加蓬', '3', 'GA');
INSERT INTO `common_city` VALUES ('10069', '大不列颠联合王国', '10000', 'dabuliedianlianheguo', '大不列颠联合王国', '2', null);
INSERT INTO `common_city` VALUES ('10070', '格林纳达', '10000', 'gelinnada', '格林纳达', '5', 'GD');
INSERT INTO `common_city` VALUES ('10071', '格鲁吉亚', '10000', 'gelujiya', '格鲁吉亚', '1', 'GE');
INSERT INTO `common_city` VALUES ('10072', '法属圭亚那', '10000', 'fashuguiyana', '法属圭亚那', '6', 'GF');
INSERT INTO `common_city` VALUES ('10073', '加纳', '10000', 'jiana', '加纳', '3', 'GH');
INSERT INTO `common_city` VALUES ('10074', '直布罗陀', '10000', 'zhibuluotuo', '直布罗陀', '2', 'GI');
INSERT INTO `common_city` VALUES ('10075', '格陵兰群岛', '10000', 'gelinglanqundao', '格陵兰群岛', '5', null);
INSERT INTO `common_city` VALUES ('10076', '冈比亚', '10000', 'gangbiya', '几内亚', '3', 'GM');
INSERT INTO `common_city` VALUES ('10077', '瓜德罗普岛', '10000', 'guadeluopudao', '瓜德罗普岛', '2', null);
INSERT INTO `common_city` VALUES ('10078', '希腊', '10000', 'xila', '希腊', '2', 'GR');
INSERT INTO `common_city` VALUES ('10079', '危地马拉', '10000', 'weidimala', '危地马拉', '5', 'GT');
INSERT INTO `common_city` VALUES ('10080', '关岛', '10000', 'guandao', '关岛', '4', 'GU');
INSERT INTO `common_city` VALUES ('10081', '几内亚比绍', '10000', 'jineiyabishao', '几内亚比绍', '3', null);
INSERT INTO `common_city` VALUES ('10082', '圭亚那', '10000', 'guiyana', '圭亚那', '6', 'GY');
INSERT INTO `common_city` VALUES ('10083', '洪都拉斯', '10000', 'hongdulasi', '洪都拉斯', '5', 'HN');
INSERT INTO `common_city` VALUES ('10084', '克罗蒂亚', '10000', 'keluodiya', '克罗蒂亚', '2', null);
INSERT INTO `common_city` VALUES ('10085', '海地', '10000', 'haidi', '海地', '5', 'HT');
INSERT INTO `common_city` VALUES ('10086', '匈牙利', '10000', 'xiongyali', '匈牙利', '2', 'HU');
INSERT INTO `common_city` VALUES ('10087', '印度尼西亚', '10000', 'yindunixiya', '印度尼西亚', '1', 'ID');
INSERT INTO `common_city` VALUES ('10088', '爱尔兰共和国', '10000', 'aierlangongheguo', '爱尔兰共和国', '2', null);
INSERT INTO `common_city` VALUES ('10089', '以色列', '10000', 'yiselie', '以色列', '1', 'IL');
INSERT INTO `common_city` VALUES ('10090', '印度', '10000', 'yindu', '印度', '1', 'IN');
INSERT INTO `common_city` VALUES ('10091', '英属印度洋领地', '10000', 'yingshuyinduyanglingdi', '英属印度洋领地', '2', null);
INSERT INTO `common_city` VALUES ('10092', '伊拉克', '10000', 'yilake', '伊拉克', '1', 'IQ');
INSERT INTO `common_city` VALUES ('10093', '伊朗', '10000', 'yilang', '伊朗', '1', 'IR');
INSERT INTO `common_city` VALUES ('10094', '冰岛', '10000', 'bingdao', '冰岛', '2', 'IS');
INSERT INTO `common_city` VALUES ('10095', '意大利', '10000', 'yidali', '意大利', '2', 'IT');
INSERT INTO `common_city` VALUES ('10096', '牙买加', '10000', 'yamaijia', '牙买加', '5', 'JM');
INSERT INTO `common_city` VALUES ('10097', '约旦', '10000', 'yuedan', '约旦', '1', 'JO');
INSERT INTO `common_city` VALUES ('10098', '日本', '10000', 'riben', '日本', '1', 'JP');
INSERT INTO `common_city` VALUES ('10099', '肯尼亚', '10000', 'keniya', '肯尼亚', '3', 'KE');
INSERT INTO `common_city` VALUES ('10100', '吉尔吉斯斯坦', '10000', 'jierjisisitan', '吉尔吉斯斯坦', '1', null);
INSERT INTO `common_city` VALUES ('10101', '柬埔寨', '10000', 'jianpuzai', '柬埔寨', '1', 'KH');
INSERT INTO `common_city` VALUES ('10102', '基里巴斯', '10000', 'jilibasi', '基里巴斯', '4', null);
INSERT INTO `common_city` VALUES ('10103', '科摩罗', '10000', 'kemoluo', '科摩罗', '3', null);
INSERT INTO `common_city` VALUES ('10104', '朝鲜', '10000', 'chaoxian', '朝鲜', '1', 'KP');
INSERT INTO `common_city` VALUES ('10105', '韩国', '10000', 'hanguo', '韩国', '1', 'KR');
INSERT INTO `common_city` VALUES ('10106', '科威特', '10000', 'keweite', '科威特', '1', 'KW');
INSERT INTO `common_city` VALUES ('10107', '开曼群岛', '10000', 'kaimanqundao', '开曼群岛', '5', null);
INSERT INTO `common_city` VALUES ('10108', '哈萨克斯坦', '10000', 'hashakesitan', '哈萨克斯坦', '1', 'KZ');
INSERT INTO `common_city` VALUES ('10109', '老挝', '10000', 'laoguo', '老挝人民共和国', '1', 'LA');
INSERT INTO `common_city` VALUES ('10110', '黎巴嫩', '10000', 'libanen', '黎巴嫩', '1', 'LB');
INSERT INTO `common_city` VALUES ('10111', '圣露西亚岛', '10000', 'shengluxiyadao', '圣露西亚岛', '5', null);
INSERT INTO `common_city` VALUES ('10112', '列支敦士登', '10000', 'liezhidunshideng', '列支敦士登', '2', 'LI');
INSERT INTO `common_city` VALUES ('10113', '斯里兰卡', '10000', 'sililanka', '斯里兰卡', '1', 'LK');
INSERT INTO `common_city` VALUES ('10114', '利比里亚', '10000', 'libiliya', '利比里亚', '3', 'LR');
INSERT INTO `common_city` VALUES ('10115', '莱索托', '10000', 'laisuotuo', '莱索托', '3', 'LS');
INSERT INTO `common_city` VALUES ('10116', '立陶宛', '10000', 'litaowan', '立陶宛', '2', 'LT');
INSERT INTO `common_city` VALUES ('10117', '卢森堡', '10000', 'lushenbao', '卢森堡', '2', 'LU');
INSERT INTO `common_city` VALUES ('10118', '拉脱维亚', '10000', 'latuoweiya', '拉脱维亚', '2', 'LV');
INSERT INTO `common_city` VALUES ('10119', '利比亚', '10000', 'libiya', '利比亚', '3', 'LY');
INSERT INTO `common_city` VALUES ('10120', '摩洛哥', '10000', 'moluoge', '摩洛哥', '3', 'MA');
INSERT INTO `common_city` VALUES ('10121', '摩纳哥', '10000', 'monage', '摩纳哥', '2', 'MC');
INSERT INTO `common_city` VALUES ('10122', '摩尔多瓦', '10000', 'moerduowa', '摩尔多瓦', '2', 'MD');
INSERT INTO `common_city` VALUES ('10123', '马达加斯加', '10000', 'madajiasijia', '马达加斯加', '3', 'MG');
INSERT INTO `common_city` VALUES ('10124', '马绍尔群岛', '10000', 'mashaoerqundao', '马绍尔群岛', '4', null);
INSERT INTO `common_city` VALUES ('10125', '马里', '10000', 'mali', '马里', '3', 'ML');
INSERT INTO `common_city` VALUES ('10126', '缅甸', '10000', 'miandian', '缅甸', '1', 'MM');
INSERT INTO `common_city` VALUES ('10127', '蒙古', '10000', 'menggu', '蒙古', '1', 'MN');
INSERT INTO `common_city` VALUES ('10128', '北马里亚纳群岛', '10000', 'beimaliyanaqundao', '北马里亚纳群岛', '5', null);
INSERT INTO `common_city` VALUES ('10129', '马提尼克岛', '10000', 'matinikedao', '马提尼克岛', '2', null);
INSERT INTO `common_city` VALUES ('10130', '毛里塔尼亚', '10000', 'maolitaniya', '毛里塔尼亚', '3', null);
INSERT INTO `common_city` VALUES ('10131', '蒙塞拉特岛', '10000', 'mengsailatedao', '蒙塞拉特岛', '2', null);
INSERT INTO `common_city` VALUES ('10132', '马尔他', '10000', 'maerta', '马尔他', '2', null);
INSERT INTO `common_city` VALUES ('10133', '马尔代夫', '10000', 'maerdaifu', '马尔代夫', '1', 'MV');
INSERT INTO `common_city` VALUES ('10134', '马拉维', '10000', 'malawei', '马拉维', '3', 'MW');
INSERT INTO `common_city` VALUES ('10135', '墨西哥', '10000', 'moxige', '墨西哥', '5', 'MX');
INSERT INTO `common_city` VALUES ('10136', '马来西亚', '10000', 'malaixiya', '马来西亚', '1', 'MY');
INSERT INTO `common_city` VALUES ('10137', '莫桑比克', '10000', 'mosangbike', '莫桑比克', '3', 'MZ');
INSERT INTO `common_city` VALUES ('10138', '纳米比亚', '10000', 'namibiya', '纳米比亚', '3', 'NA');
INSERT INTO `common_city` VALUES ('10139', '新喀里多尼亚', '10000', 'xingaliduoniya', '新喀里多尼亚', '4', null);
INSERT INTO `common_city` VALUES ('10140', '尼日尔', '10000', 'nirier', '尼日尔', '3', 'NE');
INSERT INTO `common_city` VALUES ('10141', '诺福克岛', '10000', 'nuofukedao', '诺福克岛', '4', null);
INSERT INTO `common_city` VALUES ('10142', '尼日利亚', '10000', 'niriliya', '尼日利亚', '3', 'NG');
INSERT INTO `common_city` VALUES ('10143', '尼加拉瓜', '10000', 'nijialagua', '尼加拉瓜', '5', 'NI');
INSERT INTO `common_city` VALUES ('10144', '荷兰', '10000', 'helan', '荷兰', '2', 'NL');
INSERT INTO `common_city` VALUES ('10145', '挪威', '10000', 'nowei', '挪威', '2', 'NO');
INSERT INTO `common_city` VALUES ('10146', '尼泊尔', '10000', 'niboer', '尼泊尔', '1', 'NP');
INSERT INTO `common_city` VALUES ('10147', '瑙鲁', '10000', 'naolu', '瑙鲁', '4', 'NR');
INSERT INTO `common_city` VALUES ('10148', '纽埃', '10000', 'niuai', '纽埃', '4', null);
INSERT INTO `common_city` VALUES ('10149', '新西兰', '10000', 'xinxilan', '新西兰', '4', 'NZ');
INSERT INTO `common_city` VALUES ('10150', '阿曼', '10000', 'aman', '阿曼', '1', 'OM');
INSERT INTO `common_city` VALUES ('10151', '巴拿马', '10000', 'banama', '巴拿马', '5', 'PA');
INSERT INTO `common_city` VALUES ('10152', '秘鲁', '10000', 'milu', '秘鲁', '6', 'PE');
INSERT INTO `common_city` VALUES ('10153', '法属波利尼西亚', '10000', 'fashubolinixiya', '法属波利尼西亚', '4', null);
INSERT INTO `common_city` VALUES ('10154', '巴布亚新几内亚', '10000', 'babuyaxinjineiya', '巴布亚新几内亚', '4', 'PG');
INSERT INTO `common_city` VALUES ('10155', '菲律宾', '10000', 'feilvbin', '菲律宾', '1', 'PH');
INSERT INTO `common_city` VALUES ('10156', '巴基斯坦', '10000', 'bajisitan', '巴基斯坦', '1', 'PK');
INSERT INTO `common_city` VALUES ('10157', '波兰', '10000', 'bolan', '波兰', '2', 'PL');
INSERT INTO `common_city` VALUES ('10158', '皮特克恩岛', '10000', 'pitekeendao', '皮特克恩岛', '4', null);
INSERT INTO `common_city` VALUES ('10159', '波多黎各', '10000', 'boduolige', '波多黎各', '5', 'PR');
INSERT INTO `common_city` VALUES ('10160', '葡萄牙', '10000', 'putaoya', '葡萄牙', '2', 'PT');
INSERT INTO `common_city` VALUES ('10161', '帕劳', '10000', 'palao', '帕劳', '4', null);
INSERT INTO `common_city` VALUES ('10162', '巴拉圭', '10000', 'balagui', '巴拉圭', '6', 'PY');
INSERT INTO `common_city` VALUES ('10163', '卡塔尔', '10000', 'kataer', '卡塔尔', '1', 'QA');
INSERT INTO `common_city` VALUES ('10164', '留尼汪岛', '10000', 'liuniwangdao', '留尼汪岛', '3', null);
INSERT INTO `common_city` VALUES ('10165', '罗马尼亚', '10000', 'luomaniya', '罗马尼亚', '2', 'RO');
INSERT INTO `common_city` VALUES ('10166', '俄罗斯联邦', '10000', 'erluosilianbang', '俄罗斯联邦', '2', null);
INSERT INTO `common_city` VALUES ('10167', '卢旺达', '10000', 'luwangda', '卢旺达', '3', null);
INSERT INTO `common_city` VALUES ('10168', '沙特阿拉伯', '10000', 'shatealabo', '沙特阿拉伯', '1', 'SA');
INSERT INTO `common_city` VALUES ('10169', '所罗门群岛', '10000', 'suoluomenqundao', '所罗门群岛', '4', 'SB');
INSERT INTO `common_city` VALUES ('10170', '塞舌尔', '10000', 'saisheer', '塞舌尔', '3', 'SC');
INSERT INTO `common_city` VALUES ('10171', '苏旦', '10000', 'yuedan', '苏旦', '3', null);
INSERT INTO `common_city` VALUES ('10172', '瑞典', '10000', 'ruidian', '瑞典', '2', 'SE');
INSERT INTO `common_city` VALUES ('10173', '新加坡', '10000', 'xinjiapo', '新加坡', '1', 'SG');
INSERT INTO `common_city` VALUES ('10174', '海伦娜', '10000', 'hailunna', '海伦娜', '4', null);
INSERT INTO `common_city` VALUES ('10175', '斯洛伐克', '10000', 'siluofake', '斯洛伐克', '2', 'SK');
INSERT INTO `common_city` VALUES ('10176', '塞拉利昂', '10000', 'sailaliang', '塞拉利昂', '3', 'SL');
INSERT INTO `common_city` VALUES ('10177', '圣马力诺', '10000', 'shengmalinuo', '圣马力诺', '2', 'SM');
INSERT INTO `common_city` VALUES ('10178', '塞内加尔', '10000', 'saineijiaer', '塞内加尔', '3', 'SN');
INSERT INTO `common_city` VALUES ('10179', '索马里', '10000', 'suomali', '索马里', '3', 'SO');
INSERT INTO `common_city` VALUES ('10180', '苏里南', '10000', 'sulinan', '苏里南', '6', 'SR');
INSERT INTO `common_city` VALUES ('10181', '叙利亚', '10000', 'xuliya', '叙利亚', '1', 'SY');
INSERT INTO `common_city` VALUES ('10182', '斯威士兰', '10000', 'siweishilan', '斯威士兰', '3', 'SZ');
INSERT INTO `common_city` VALUES ('10183', '乍得', '10000', 'zade', '乍得', '3', 'TD');
INSERT INTO `common_city` VALUES ('10184', '法属南半球领地', '10000', 'fashunanbanqiulingdi', '法属南半球领地', '2', null);
INSERT INTO `common_city` VALUES ('10185', '多哥', '10000', 'duoge', '多哥', '3', 'TG');
INSERT INTO `common_city` VALUES ('10186', '泰国', '10000', 'taiduo', '泰国', '1', 'TH');
INSERT INTO `common_city` VALUES ('10187', '塔吉克斯坦', '10000', 'tajikesitan', '塔吉克斯坦', '1', 'TJ');
INSERT INTO `common_city` VALUES ('10188', '托克劳群岛', '10000', 'tuokelaoqundao', '托克劳群岛', '4', null);
INSERT INTO `common_city` VALUES ('10189', '土库曼斯坦', '10000', 'tukumansitan', '土库曼斯坦', '1', 'TM');
INSERT INTO `common_city` VALUES ('10190', '突尼斯', '10000', 'tunisi', '突尼斯', '3', 'TN');
INSERT INTO `common_city` VALUES ('10191', '汤加', '10000', 'tangjia', '汤加', '4', 'TO');
INSERT INTO `common_city` VALUES ('10192', '东帝汶', '10000', 'dongdiwen', '东帝汶', '1', null);
INSERT INTO `common_city` VALUES ('10193', '土耳其', '10000', 'tuerqi', '土耳其', '1', 'TR');
INSERT INTO `common_city` VALUES ('10194', '图瓦鲁', '10000', 'tuwalu', '图瓦鲁', '4', null);
INSERT INTO `common_city` VALUES ('10195', '坦桑尼亚', '10000', 'tansangniya', '坦桑尼亚', '3', 'TZ');
INSERT INTO `common_city` VALUES ('10196', '乌克兰', '10000', 'wukelan', '乌克兰', '2', 'UA');
INSERT INTO `common_city` VALUES ('10197', '乌干达', '10000', 'wulagan', '乌干达', '3', 'UG');
INSERT INTO `common_city` VALUES ('10198', '英国', '10000', 'yingguo', '英国', '2', 'GB');
INSERT INTO `common_city` VALUES ('10199', '美国', '10000', 'meiguo', '美国', '5', 'US');
INSERT INTO `common_city` VALUES ('10200', '乌拉圭', '10000', 'wulagui', '乌拉圭', '6', 'UY');
INSERT INTO `common_city` VALUES ('10201', '梵地冈', '10000', 'fandigang', '梵地冈', '2', null);
INSERT INTO `common_city` VALUES ('10202', '委内瑞拉', '10000', 'weineiruila', '委内瑞拉', '6', 'VE');
INSERT INTO `common_city` VALUES ('10203', '维京群岛', '10000', 'weijingqundao', '维京群岛', '2', null);
INSERT INTO `common_city` VALUES ('10204', '越南', '10000', 'yuenan', '越南', '1', 'VN');
INSERT INTO `common_city` VALUES ('10205', '瓦努阿图', '10000', 'wanuatu', '瓦努阿图', '4', null);
INSERT INTO `common_city` VALUES ('10206', '东萨摩亚', '10000', 'dongsamoya', '东萨摩亚', '4', null);
INSERT INTO `common_city` VALUES ('10207', '也门', '10000', 'yemen', '也门', '1', 'YE');
INSERT INTO `common_city` VALUES ('10208', '南斯拉夫', '10000', 'nansilafu', '南斯拉夫', '2', 'YU');
INSERT INTO `common_city` VALUES ('10209', '南非', '10000', 'nanfei', '南非', '3', 'ZA');
INSERT INTO `common_city` VALUES ('10210', '赞比亚', '10000', 'zanbiya', '赞比亚', '3', 'ZM');
INSERT INTO `common_city` VALUES ('10211', '扎伊尔', '10000', 'zayier', '扎伊尔', '3', 'ZR');
INSERT INTO `common_city` VALUES ('10212', '津巴布韦', '10000', 'jinbabuwei', '津巴布韦', '3', 'ZW');
INSERT INTO `common_city` VALUES ('10213', '俄罗斯', '10000', 'eluosi', '俄罗斯', '2', 'RU');
INSERT INTO `common_city` VALUES ('10214', '塞尔维亚', '10000', 'saierweiya', '塞尔维亚', '2', null);
INSERT INTO `common_city` VALUES ('10215', '孟加拉', '10000', 'mengjiala', '孟加拉', '1', null);
INSERT INTO `common_city` VALUES ('10216', '文莱', '10000', 'wenlai', '文莱', '1', 'BN');
INSERT INTO `common_city` VALUES ('10217', '捷克', '10000', 'jieke', '捷克', '2', 'CZ');
INSERT INTO `common_city` VALUES ('10218', '柬埔寨', '10000', 'jianpuzai', '柬埔寨', '1', 'KH');
INSERT INTO `common_city` VALUES ('10219', '爱尔兰', '10000', 'aierlan', '爱尔兰', '2', 'IE');
INSERT INTO `common_city` VALUES ('10220', '苏丹', '10000', 'sudan', '苏丹', '3', 'SD');
INSERT INTO `common_city` VALUES ('10221', '马其顿', '10000', 'naqidun', '马其顿', '2', null);
INSERT INTO `common_city` VALUES ('10222', '乌兹别克斯坦', '10000', 'wuzibiekesitan', '乌兹别克斯坦', '1', 'UZ');
INSERT INTO `common_city` VALUES ('10223', '毛里求斯', '10000', 'maoliqiusi', '毛里求斯', '3', 'MU');
INSERT INTO `common_city` VALUES ('10224', '科特迪瓦', '10000', 'ketediwa', '科特迪瓦', '3', null);
INSERT INTO `common_city` VALUES ('10225', '巴勒斯坦', '10000', 'bajisitan', '巴勒斯坦', '1', null);
INSERT INTO `common_city` VALUES ('10226', '斯洛文尼亚', '10000', 'siluowenniya', '斯洛文尼亚', '2', 'SI');
INSERT INTO `common_city` VALUES ('10227', '克罗地亚', '10000', 'keluodiya', '克罗地亚', '2', null);
INSERT INTO `common_city` VALUES ('10228', '黑山', '10000', 'heisan', '黑山', '2', null);
INSERT INTO `common_city` VALUES ('10229', '多米尼加', '10000', 'duominijia', '多米尼加', '5', null);
INSERT INTO `common_city` VALUES ('10230', '博茨瓦纳', '10000', 'bociwana', '博茨瓦纳', '3', 'BW');
INSERT INTO `common_city` VALUES ('10231', '马耳他', '10000', 'maerta', '马耳他', '2', 'MT');
INSERT INTO `common_city` VALUES ('10232', '佛得角', '10000', 'fudejiao', '佛得角', '3', null);
INSERT INTO `common_city` VALUES ('10233', '特立尼达和多巴哥', '10000', 'telinidaheduobage', '特立尼达和多巴哥', '5', 'TT');
INSERT INTO `common_city` VALUES ('10234', '几内亚', '10000', 'jineiya', '几内亚', '3', 'GN');
INSERT INTO `common_city` VALUES ('10235', '南苏丹', '10000', 'nansudan', '南苏丹', '3', null);
INSERT INTO `common_city` VALUES ('10236', '波斯尼亚和黑塞哥维那', '10000', 'bosiniyaheheisaigeweina', '波斯尼亚和黑塞哥维那', '2', null);
INSERT INTO `common_city` VALUES ('10237', '库拉索', '10000', 'kulasuo', '库拉索', '2', null);
INSERT INTO `common_city` VALUES ('10238', '刚果(布)', '10000', 'gangguobu', '刚果(布)', '3', null);
INSERT INTO `common_city` VALUES ('10239', '荷兰加勒比', '10000', 'helanjialebi', '荷兰加勒比', '2', null);
INSERT INTO `common_city` VALUES ('10240', '特克斯和凯科斯群岛', '10000', 'tekesihekaikesi', '特克斯和凯科斯群岛', '5', null);
INSERT INTO `common_city` VALUES ('10241', '圣基茨和尼维斯', '10000', 'shengjiciheniweisi', '圣基茨和尼维斯', '5', null);
INSERT INTO `common_city` VALUES ('10242', '荷属圣马丁', '10000', 'heshushengmading', '荷属圣马丁', '2', null);
INSERT INTO `common_city` VALUES ('10243', '安圭拉', '10000', 'anguila', '安圭拉', '5', 'AI');
INSERT INTO `common_city` VALUES ('10244', '圣文森特和格林纳丁斯', '10000', 'shengwenshentehegelin', '圣文森特和格林纳丁斯', '5', null);
INSERT INTO `common_city` VALUES ('10245', '圣卢西亚', '10000', 'shengluxiya', '圣卢西亚', '5', 'LC');
INSERT INTO `common_city` VALUES ('10246', '密克罗尼西亚联邦', '10000', 'mikeluonixiya', '密克罗尼西亚联邦', '4', null);
INSERT INTO `common_city` VALUES ('10247', '美属维尔京群岛', '10000', 'meishuweierjing', '美属维尔京群岛', '5', null);
INSERT INTO `common_city` VALUES ('10248', '多米尼克', '10000', 'duominike', '多米尼克', '5', null);
INSERT INTO `common_city` VALUES ('10249', '圣多美和普林西比', '10000', 'shengduomeihepulinxibi', '圣多美和普林西比', '3', 'ST');
INSERT INTO `common_city` VALUES ('10250', '瓜德罗普', '10000', 'guadeluopu', '瓜德罗普', '5', null);
INSERT INTO `common_city` VALUES ('10251', '英属维尔京群岛', '10000', 'yingshuweierjing', '英属维尔京群岛', '5', null);
INSERT INTO `common_city` VALUES ('19999', '其他', '10000', 'taqi', '其他', '1', null);

-- ----------------------------
-- Table structure for common_city_continent
-- ----------------------------
DROP TABLE IF EXISTS `common_city_continent`;
CREATE TABLE `common_city_continent` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_city_continent
-- ----------------------------
INSERT INTO `common_city_continent` VALUES ('1', '亚洲');
INSERT INTO `common_city_continent` VALUES ('2', '欧洲');
INSERT INTO `common_city_continent` VALUES ('3', '非洲');
INSERT INTO `common_city_continent` VALUES ('4', '大洋洲');
INSERT INTO `common_city_continent` VALUES ('5', '北美洲');
INSERT INTO `common_city_continent` VALUES ('6', '南美洲');

-- ----------------------------
-- Table structure for common_log_city_undefine
-- ----------------------------
DROP TABLE IF EXISTS `common_log_city_undefine`;
CREATE TABLE `common_log_city_undefine` (
  `id` bigint(20) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_log_city_undefine
-- ----------------------------

-- ----------------------------
-- Table structure for common_picr
-- ----------------------------
DROP TABLE IF EXISTS `common_picr`;
CREATE TABLE `common_picr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `pic_md5` varchar(255) DEFAULT NULL,
  `pic_path` varchar(255) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_picr
-- ----------------------------
INSERT INTO `common_picr` VALUES ('1', 'admin', '2015-12-17 17:46:20', 'admin', '2015-12-17 17:46:20', 'ef2ffdb515af0ff09bdf38b8be042975', '/var/www/tomcats/tomcat2/webapps/pic/1pef2ffdb515af0ff09bdf38b8be042975.png', 'http://183.63.53.103:12080/pic/1pef2ffdb515af0ff09bdf38b8be042975.png', '', '1', 'Music');
INSERT INTO `common_picr` VALUES ('2', 'admin', '2015-12-17 17:46:34', 'admin', '2015-12-17 17:46:34', '4e79fba4f0f130470ef31a888586640d', '/var/www/tomcats/tomcat2/webapps/pic/2p4e79fba4f0f130470ef31a888586640d.png', 'http://183.63.53.103:12080/pic/2p4e79fba4f0f130470ef31a888586640d.png', '', '1', 'Game');
INSERT INTO `common_picr` VALUES ('3', 'admin', '2015-12-17 17:46:47', 'admin', '2015-12-17 17:46:47', 'f0a4305bd30ce11c0f644c7bb15648d1', '/var/www/tomcats/tomcat2/webapps/pic/3pf0a4305bd30ce11c0f644c7bb15648d1.png', 'http://183.63.53.103:12080/pic/3pf0a4305bd30ce11c0f644c7bb15648d1.png', '', '1', 'News');
INSERT INTO `common_picr` VALUES ('4', 'admin', '2015-12-17 17:47:02', 'admin', '2015-12-17 17:47:02', '08ee72528377cf75eff5c8e87731fdf5', '/var/www/tomcats/tomcat2/webapps/pic/4p08ee72528377cf75eff5c8e87731fdf5.png', 'http://183.63.53.103:12080/pic/4p08ee72528377cf75eff5c8e87731fdf5.png', '', '1', 'Shopping');
INSERT INTO `common_picr` VALUES ('5', 'admin', '2015-12-17 17:47:13', 'admin', '2015-12-17 17:47:13', '4e52fb4c3a419fea457727d342c51fab', '/var/www/tomcats/tomcat2/webapps/pic/5p4e52fb4c3a419fea457727d342c51fab.png', 'http://183.63.53.103:12080/pic/5p4e52fb4c3a419fea457727d342c51fab.png', '', '1', 'Social');
INSERT INTO `common_picr` VALUES ('6', 'admin', '2015-12-17 17:47:29', 'admin', '2015-12-17 17:47:29', 'ab49e0f3114ee6eb933c68cc55b84fe2', '/var/www/tomcats/tomcat2/webapps/pic/6pab49e0f3114ee6eb933c68cc55b84fe2.png', 'http://183.63.53.103:12080/pic/6pab49e0f3114ee6eb933c68cc55b84fe2.png', '', '1', 'Sports');
INSERT INTO `common_picr` VALUES ('7', 'admin', '2015-12-17 17:47:41', 'admin', '2015-12-17 17:47:41', 'c841a92a1b496e6e1039c8da92d664ac', '/var/www/tomcats/tomcat2/webapps/pic/7pc841a92a1b496e6e1039c8da92d664ac.png', 'http://183.63.53.103:12080/pic/7pc841a92a1b496e6e1039c8da92d664ac.png', '', '1', 'Video');
INSERT INTO `common_picr` VALUES ('8', 'admin', '2015-12-17 17:49:05', 'admin', '2015-12-17 17:49:05', '933c25fafc84da1cb0c5fc9e2a11c28c', '/var/www/tomcats/tomcat2/webapps/pic/8p933c25fafc84da1cb0c5fc9e2a11c28c.png', 'http://183.63.53.103:12080/pic/8p933c25fafc84da1cb0c5fc9e2a11c28c.png', '', '1', 'Toolbox');
INSERT INTO `common_picr` VALUES ('9', 'admin', '2015-12-17 17:49:42', 'admin', '2015-12-17 17:49:42', '5529995f36915ecc8f161ae73c530552', '/var/www/tomcats/tomcat2/webapps/pic/9p5529995f36915ecc8f161ae73c530552.png', 'http://183.63.53.103:12080/pic/9p5529995f36915ecc8f161ae73c530552.png', '', '1', 'Wifi Key');
INSERT INTO `common_picr` VALUES ('10', 'admin', '2015-12-17 17:50:37', 'admin', '2015-12-17 17:50:37', '08bc2a18febd341fcc9e6e90bf5e5ea8', '/var/www/tomcats/tomcat2/webapps/pic/10p08bc2a18febd341fcc9e6e90bf5e5ea8.jpg', 'http://183.63.53.103:12080/pic/10p08bc2a18febd341fcc9e6e90bf5e5ea8.jpg', '', '1', 'Video Browser');
INSERT INTO `common_picr` VALUES ('11', 'admin', '2015-12-17 17:50:54', 'admin', '2015-12-17 17:50:54', 'acbed7add202d5ac1f5acdd746213042', '/var/www/tomcats/tomcat2/webapps/pic/11pacbed7add202d5ac1f5acdd746213042.png', 'http://183.63.53.103:12080/pic/11pacbed7add202d5ac1f5acdd746213042.png', '', '1', 'sina');

-- ----------------------------
-- Table structure for common_province
-- ----------------------------
DROP TABLE IF EXISTS `common_province`;
CREATE TABLE `common_province` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pinyin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_province
-- ----------------------------
INSERT INTO `common_province` VALUES ('1001', '北京', 'beijing');
INSERT INTO `common_province` VALUES ('1002', '上海', 'shanghai');
INSERT INTO `common_province` VALUES ('1003', '天津', 'tianjing');
INSERT INTO `common_province` VALUES ('1004', '重庆', 'chongqing');
INSERT INTO `common_province` VALUES ('1005', '安徽', 'anhui');
INSERT INTO `common_province` VALUES ('1006', '福建', 'fujian');
INSERT INTO `common_province` VALUES ('1007', '甘肃', 'gansu');
INSERT INTO `common_province` VALUES ('1008', '广东', 'guangdong');
INSERT INTO `common_province` VALUES ('1009', '广西', 'guangxi');
INSERT INTO `common_province` VALUES ('1010', '贵州', 'guizhou');
INSERT INTO `common_province` VALUES ('1011', '海南', 'hainan');
INSERT INTO `common_province` VALUES ('1012', '河北', 'hebei');
INSERT INTO `common_province` VALUES ('1013', '河南', 'henan');
INSERT INTO `common_province` VALUES ('1014', '黑龙江', 'heilongjiang');
INSERT INTO `common_province` VALUES ('1015', '湖北', 'hubei');
INSERT INTO `common_province` VALUES ('1016', '湖南', 'hunan');
INSERT INTO `common_province` VALUES ('1017', '吉林', 'jilin');
INSERT INTO `common_province` VALUES ('1018', '江苏', 'jiangsu');
INSERT INTO `common_province` VALUES ('1019', '江西', 'jiangxi');
INSERT INTO `common_province` VALUES ('1020', '辽宁', 'liaoning');
INSERT INTO `common_province` VALUES ('1021', '内蒙古', 'neimenggu');
INSERT INTO `common_province` VALUES ('1022', '宁夏', 'ningxia');
INSERT INTO `common_province` VALUES ('1023', '青海', 'qinghai');
INSERT INTO `common_province` VALUES ('1024', '山东', 'shandong');
INSERT INTO `common_province` VALUES ('1025', '山西', 'shanxi1');
INSERT INTO `common_province` VALUES ('1026', '陕西', 'shanxi');
INSERT INTO `common_province` VALUES ('1027', '四川', 'sichuan');
INSERT INTO `common_province` VALUES ('1028', '西藏', 'xizang');
INSERT INTO `common_province` VALUES ('1029', '新疆', 'xinjiang');
INSERT INTO `common_province` VALUES ('1030', '云南', 'yunnan');
INSERT INTO `common_province` VALUES ('1031', '浙江', 'zhejiang');
INSERT INTO `common_province` VALUES ('1035', '局域网', 'juyuwang');
INSERT INTO `common_province` VALUES ('1036', '本机地址', 'localhost');
INSERT INTO `common_province` VALUES ('10000', '海外', 'haiwai');

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `t_end` datetime DEFAULT NULL,
  `t_start` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `val1` varchar(255) DEFAULT NULL,
  `val2` varchar(255) DEFAULT NULL,
  `val3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dic
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dicitem
-- ----------------------------
DROP TABLE IF EXISTS `sys_dicitem`;
CREATE TABLE `sys_dicitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `val1` varchar(255) DEFAULT NULL,
  `val2` varchar(255) DEFAULT NULL,
  `val3` varchar(255) DEFAULT NULL,
  `val4` varchar(255) DEFAULT NULL,
  `d_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE380D91FA311F05D` (`d_code`) USING BTREE,
  KEY `FKE380D91FACE41163` (`d_code`) USING BTREE,
  CONSTRAINT `sys_dicitem_ibfk_1` FOREIGN KEY (`d_code`) REFERENCES `sys_dic` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 15360 kB; (`d_code`) REFER `qc_push/sys_dic`(`c';

-- ----------------------------
-- Records of sys_dicitem
-- ----------------------------

-- ----------------------------
-- Table structure for sys_email
-- ----------------------------
DROP TABLE IF EXISTS `sys_email`;
CREATE TABLE `sys_email` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `defaultfrom` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_email
-- ----------------------------

-- ----------------------------
-- Table structure for sys_history
-- ----------------------------
DROP TABLE IF EXISTS `sys_history`;
CREATE TABLE `sys_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text,
  `entity` varchar(255) DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `operation_code` varchar(255) DEFAULT NULL,
  `operation_type` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `session_code` bigint(20) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_history
-- ----------------------------
INSERT INTO `sys_history` VALUES ('1', '/journal/logvisit/log-visit!oplist.action*', 'com.game.entity.account.Resource', '791', null, 'create', 'admin', '97074611', '2014-12-18 15:21:17');
INSERT INTO `sys_history` VALUES ('3', 'com.game.entity.account.Role@1391651[3,测试人员]', 'com.game.entity.account.Role', '3', null, 'update', 'admin', '103402830', '2014-12-18 15:21:55');
INSERT INTO `sys_history` VALUES ('5', 'com.game.entity.account.Role@1752b65[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '111639924', '2014-12-18 15:22:01');
INSERT INTO `sys_history` VALUES ('7', 'com.game.entity.account.User@29b985d9[username=game,realName=game,email=game@9zhitx.com,enabled=true,domain=QC,authority[size]=9]', 'com.game.entity.account.User', '5', null, 'create', 'admin', '1661628853', '2014-12-18 15:34:00');
INSERT INTO `sys_history` VALUES ('9', '/journal/analysis/log-analysis!adddevice.action*', 'com.game.entity.account.Resource', '793', null, 'create', 'admin', '112715978', '2014-12-26 15:19:37');
INSERT INTO `sys_history` VALUES ('10', '/journal/analysis/log-analysis!activedevice.action*', 'com.game.entity.account.Resource', '794', null, 'create', 'admin', '125891479', '2014-12-26 15:19:56');
INSERT INTO `sys_history` VALUES ('11', '/journal/analysis/log-analysis!paydevice.action*', 'com.game.entity.account.Resource', '795', null, 'create', 'admin', '107390409', '2014-12-26 15:20:15');
INSERT INTO `sys_history` VALUES ('12', 'com.game.entity.account.Role@145c224[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '118027716', '2014-12-26 15:24:44');
INSERT INTO `sys_history` VALUES ('13', 'com.game.entity.account.Role@61f3c119[3,测试人员]', 'com.game.entity.account.Role', '3', null, 'update', 'admin', '1555268757', '2014-12-26 15:30:17');
INSERT INTO `sys_history` VALUES ('14', '/journal/analysis/log-analysis!overview.action*', 'com.game.entity.account.Resource', '796', null, 'create', 'admin', '92900301', '2014-12-27 10:45:11');
INSERT INTO `sys_history` VALUES ('15', 'com.game.entity.account.Role@4e65b2[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '95698941', '2014-12-27 10:45:54');
INSERT INTO `sys_history` VALUES ('16', 'com.game.entity.account.Role@af25d95[3,测试人员]', 'com.game.entity.account.Role', '3', null, 'update', 'admin', '568092113', '2014-12-29 14:43:59');
INSERT INTO `sys_history` VALUES ('17', '/journal/analysis/log-analysis!channelview.action*', 'com.game.entity.account.Resource', '797', null, 'create', 'admin', '105090111', '2014-12-30 11:11:55');
INSERT INTO `sys_history` VALUES ('18', 'com.game.entity.account.Role@1f3812f[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '105473925', '2014-12-30 11:13:54');
INSERT INTO `sys_history` VALUES ('19', 'com.game.entity.account.Role@57d4a1e1[3,测试人员]', 'com.game.entity.account.Role', '3', null, 'update', 'admin', '1599810023', '2014-12-30 13:38:56');
INSERT INTO `sys_history` VALUES ('20', 'com.game.entity.account.Role@392b774a[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '1187482973', '2015-04-29 18:39:52');
INSERT INTO `sys_history` VALUES ('21', '/copartner/providerDaily/provider-daily!statTotalUser.action*', 'com.game.entity.account.Resource', '798', null, 'create', 'admin', '-2108941910', '2015-04-29 21:49:53');
INSERT INTO `sys_history` VALUES ('22', '/copartner/providerDaily/provider-daily!statRetention.action*', 'com.game.entity.account.Resource', '799', null, 'create', 'admin', '313088668', '2015-04-29 21:50:15');
INSERT INTO `sys_history` VALUES ('23', '/copartner/providerDaily/provider-daily!customerDailyView.action*', 'com.game.entity.account.Resource', '800', null, 'create', 'admin', '848948412', '2015-04-29 21:50:34');
INSERT INTO `sys_history` VALUES ('24', '/copartner/providerDaily/provider-daily!list.action*', 'com.game.entity.account.Resource', '801', null, 'create', 'admin', '923893045', '2015-04-29 21:50:57');
INSERT INTO `sys_history` VALUES ('25', 'com.game.entity.account.Role@2f3c6ef8[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '1976048591', '2015-04-29 21:57:37');
INSERT INTO `sys_history` VALUES ('26', 'com.game.alertadver.entity.AdApk@3e912148[1,test1]', 'com.game.alertadver.entity.AdApk', '1', null, 'create', 'admin', '1876102878', '2015-04-29 22:44:31');
INSERT INTO `sys_history` VALUES ('27', 'com.game.alertadver.entity.AdApk@3e912148[1,test1]', 'com.game.alertadver.entity.AdApk', '1', null, 'update', 'admin', '1876102878', '2015-04-29 22:44:33');
INSERT INTO `sys_history` VALUES ('28', '/pluginplat/pgapk/pg-apk!list.action*', 'com.game.entity.account.Resource', '802', null, 'create', 'admin', '1636955328', '2015-05-02 00:03:39');
INSERT INTO `sys_history` VALUES ('29', '/pluginplat/customer/pg-customer!list.action*', 'com.game.entity.account.Resource', '803', null, 'create', 'admin', '150708400', '2015-05-02 00:04:22');
INSERT INTO `sys_history` VALUES ('30', '/pluginplat/pushapk/pg-push-apk!list.action*', 'com.game.entity.account.Resource', '804', null, 'create', 'admin', '195916923', '2015-05-02 00:05:07');
INSERT INTO `sys_history` VALUES ('31', '/main/busi.action*', 'com.game.entity.account.Resource', '805', null, 'create', 'admin', '943704673', '2015-05-02 00:15:43');
INSERT INTO `sys_history` VALUES ('32', 'com.game.entity.account.Role@5bde6109[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '153685392', '2015-05-02 00:17:39');
INSERT INTO `sys_history` VALUES ('33', 'com.game.pluginplat.entity.PgApk@5d48f792[1,ewwd]', 'com.game.pluginplat.entity.PgApk', '1', null, 'create', 'admin', '2127615037', '2015-05-02 00:19:39');
INSERT INTO `sys_history` VALUES ('34', 'com.game.pluginplat.entity.PgApk@5d48f792[1,ewwd]', 'com.game.pluginplat.entity.PgApk', '1', null, 'update', 'admin', '2127615037', '2015-05-02 00:19:39');
INSERT INTO `sys_history` VALUES ('35', 'com.game.pluginplat.entity.PgCustomer@66d2c34f[1,S00010001]', 'com.game.pluginplat.entity.PgCustomer', '1', null, 'create', 'admin', '2126530887', '2015-05-02 00:20:14');
INSERT INTO `sys_history` VALUES ('36', 'com.game.pluginplat.entity.PgPushApk@543a9587[1]', 'com.game.pluginplat.entity.PgPushApk', '1', null, 'create', 'admin', '1371063261', '2015-05-02 00:20:45');
INSERT INTO `sys_history` VALUES ('37', 'com.game.pluginplat.entity.PgApk@db1d39f[1,ewwd]', 'com.game.pluginplat.entity.PgApk', '1', null, 'update', 'admin', '1179722251', '2015-05-02 00:37:12');
INSERT INTO `sys_history` VALUES ('38', 'com.game.entity.account.User@11ccbd64[username=guoyang,realName=郭阳,email=gy@9ztx.com,enabled=true,domain=QC,authority[size]=16,domain.children.size=0]', 'com.game.entity.account.User', '3', null, 'delete', 'admin', '1778407923', '2015-05-02 10:15:59');
INSERT INTO `sys_history` VALUES ('39', 'com.game.entity.account.User@2dc52075[username=game,realName=game,email=game@9zhitx.com,enabled=true,domain=QC,authority[size]=16,domain.children.size=0]', 'com.game.entity.account.User', '5', null, 'delete', 'admin', '274537752', '2015-05-02 10:16:11');
INSERT INTO `sys_history` VALUES ('40', 'com.game.entity.account.Role@74bcf082[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '545705398', '2015-05-02 10:36:13');
INSERT INTO `sys_history` VALUES ('41', '/pluginplat/pgLog/pg-log-access!list.action*', 'com.game.entity.account.Resource', '806', null, 'create', 'admin', '1564501250', '2015-05-02 11:22:56');
INSERT INTO `sys_history` VALUES ('42', '/pluginplat/pgLog/pg-log-access!statlist.action*', 'com.game.entity.account.Resource', '807', null, 'create', 'admin', '1850005174', '2015-05-02 11:23:28');
INSERT INTO `sys_history` VALUES ('43', 'com.game.entity.account.Role@390e925[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '1267882849', '2015-05-02 11:24:46');
INSERT INTO `sys_history` VALUES ('44', 'com.game.pluginplat.entity.PgApk@d7d17ca[1,测试1]', 'com.game.pluginplat.entity.PgApk', '1', null, 'create', 'admin', '141489823', '2015-05-02 12:00:19');
INSERT INTO `sys_history` VALUES ('45', 'com.game.pluginplat.entity.PgApk@d7d17ca[1,测试1]', 'com.game.pluginplat.entity.PgApk', '1', null, 'update', 'admin', '141489823', '2015-05-02 12:00:19');
INSERT INTO `sys_history` VALUES ('46', 'com.game.pluginplat.entity.PgCustomer@7446115c[1,S00010001]', 'com.game.pluginplat.entity.PgCustomer', '1', null, 'create', 'admin', '741249629', '2015-05-02 12:01:11');
INSERT INTO `sys_history` VALUES ('47', 'com.game.pluginplat.entity.PgCustomer@48fb91c8[1,S00010001]', 'com.game.pluginplat.entity.PgCustomer', '1', null, 'update', 'admin', '-2119824843', '2015-05-02 12:01:20');
INSERT INTO `sys_history` VALUES ('48', 'com.game.pluginplat.entity.PgPushApk@73685b58[1]', 'com.game.pluginplat.entity.PgPushApk', '1', null, 'create', 'admin', '-2130929540', '2015-05-02 12:01:46');
INSERT INTO `sys_history` VALUES ('49', 'com.game.pluginplat.entity.PgCustomer@60107714[2,1001]', 'com.game.pluginplat.entity.PgCustomer', '2', null, 'create', 'admin', '1627641536', '2015-05-02 17:39:45');
INSERT INTO `sys_history` VALUES ('50', 'com.game.pluginplat.entity.PgCustomer@79dc09fd[2,1001]', 'com.game.pluginplat.entity.PgCustomer', '2', null, 'update', 'admin', '1654260442', '2015-05-02 17:40:09');
INSERT INTO `sys_history` VALUES ('51', 'com.game.pluginplat.entity.PgPushApk@2b48a0a5[2]', 'com.game.pluginplat.entity.PgPushApk', '2', null, 'create', 'admin', '933987380', '2015-05-02 17:40:58');
INSERT INTO `sys_history` VALUES ('52', 'com.game.pluginplat.entity.PgCustomer@56a390d6[1,S00010001]', 'com.game.pluginplat.entity.PgCustomer', '1', null, 'update', 'admin', '923730127', '2015-05-04 17:58:13');
INSERT INTO `sys_history` VALUES ('53', 'com.game.pluginplat.entity.PgCustomer@10d3bd3c[1,S00010001]', 'com.game.pluginplat.entity.PgCustomer', '1', null, 'update', 'admin', '537971031', '2015-05-04 18:04:16');
INSERT INTO `sys_history` VALUES ('54', 'com.game.entity.account.Role@37fb89fc[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '1072729763', '2015-07-24 17:32:30');
INSERT INTO `sys_history` VALUES ('55', 'com.game.entity.account.Role@2a7c7a71[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '241922245', '2015-12-15 11:05:11');
INSERT INTO `sys_history` VALUES ('56', '/bmanager/recommend/recommend.action*', 'com.game.entity.account.Resource', '783', null, 'create', 'admin', '1420292100', '2015-12-16 11:07:28');
INSERT INTO `sys_history` VALUES ('57', '/main/busi.action*', 'com.game.entity.account.Resource', '784', null, 'create', 'admin', '1257136965', '2015-12-16 11:10:43');
INSERT INTO `sys_history` VALUES ('58', 'com.game.entity.account.Role@e187f0c[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '830774300', '2015-12-16 11:12:29');
INSERT INTO `sys_history` VALUES ('59', 'Recommend[title=test1,cdesc=,realDownUrl=http://183.63.53.103:21080/lmuch/images/565ff9d0ecd3e.png,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:21080/lmuch/images/565ff9d0ecd3e.png,status=1,begintime=00:00:00,endtime=23:59:59,citys=|1000|1001|1|1002|5|1003|6|1004|7|1005|104|105|106|107|108|109|110|111|112|113|114|115|116|118|119|120|121|1006|122|123|124|125|126|127|128|129|130|1007|219|221|223|225|226|228|230|233|235|236|238|240|242|246|1008|255|257|261|263|265|267|268|269|271|273|276|278|281|282|283|285|288|290|292|295|297|1009|300|302|304|306|308|309|310|312|315|316|317|319|320|321|1010|293|294|296|298|299|301|303|305|307|363|364|367|1011|318|322|366|368|1012|10|11|12|13|14|15|16|17|18|19|20|1013|160|161|164|166|167|168|169|170|171|173|175|177|181|184|186|188|190|192|1014|67|68|69|70|71|72|73|74|75|76|77|78|79|1015|194|196|202|204|206|207|209|211|214|216|217|218|220|222|224|227|229|1016|231|232|234|237|239|241|243|244|245|247|248|250|252|253|365|1017|58|59|60|61|62|63|64|65|66|362|1018|80|81|82|83|84|85|86|87|88|89|90|91|92|1019|131|132|133|134|135|136|137|138|139|140|141|1020|44|45|46|47|48|49|50|51|52|53|54|55|56|57|1021|32|33|34|35|36|37|38|39|40|41|42|43|1022|208|210|212|213|215|1023|197|198|199|200|201|203|205|360|378|1024|142|143|144|145|146|147|148|149|150|151|152|153|154|155|156|157|158|1025|21|22|23|24|25|26|27|28|29|30|31|1026|249|251|254|256|258|259|260|262|264|266|1027|311|313|314|323|324|325|326|327|328|329|330|331|332|333|334|335|336|337|338|339|340|370|1028|270|272|274|275|277|279|280|1029|159|162|163|165|172|174|176|178|179|180|182|183|185|187|189|191|193|195|359|361|369|372|373|374|375|376|1030|284|286|287|289|291|342|343|344|346|347|349|350|351|352|353|354|355|371|1031|93|94|95|96|97|98|99|100|101|102|103|1035|1036|10000|356|357|358|10001|10002|10003|10004|10005|10006|10007|10008|10009|10010|10011|10012|10013|10014|10015|10016|10017|10018|10019|10020|10021|10022|10023|10024|10025|10026|10027|10028|10029|10030|10031|10032|10033|10034|10035|10036|10037|10038|10039|10040|10041|10042|10043|10044|10045|10046|10047|10048|10049|10050|10051|10052|10053|10054|10055|10056|10057|10058|10059|10060|10061|10062|10063|10064|10065|10066|10067|10068|10069|10070|10071|10072|10073|10074|10075|10076|10077|10078|10079|10080|10081|10082|10083|10084|10085|10086|10087|10088|10089|10090|10091|10092|10093|10094|10095|10096|10097|10098|10099|10100|10101|10102|10103|10104|10105|10106|10107|10108|10109|10110|10111|10112|10113|10114|10115|10116|10117|10118|10119|10120|10121|10122|10123|10124|10125|10126|10127|10128|10129|10130|10131|10132|10133|10134|10135|10136|10137|10138|10139|10140|10141|10142|10143|10144|10145|10146|10147|10148|10149|10150|10151|10152|10153|10154|10155|10156|10157|10158|10159|10160|10161|10162|10163|10164|10165|10166|10167|10168|10169|10170|10171|10172|10173|10174|10175|10176|10177|10178|10179|10180|10181|10182|10183|10184|10185|10186|10187|10188|10189|10190|10191|10192|10193|10194|10195|10196|10197|10198|10199|10200|10201|10202|10203|10204|10205|10206|10207|10208|10209|10210|10211|10212|10213|10214|10215|10216|10217|10218|10219|10220|10221|10222|10223|10224|10225|10226|10227|10228|10229|10230|10231|10232|10233|10234|10235|10236|10237|10238|10239|10240|10241|10242|10243|10244|10245|10246|10247|10248|10249|10250|10251|19999|,createTime=2015-12-15 16:20:37.0,createBy=admin,lastModifyTime=Wed Dec 16 11:34:19 CST 2015,lastModifyBy=admin,id=1,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '1', null, 'update', 'admin', '1570875678', '2015-12-16 11:34:19');
INSERT INTO `sys_history` VALUES ('60', '/comm/picr/picr!list.action*', 'com.game.entity.account.Resource', '785', null, 'create', 'admin', '270633586', '2015-12-17 17:41:09');
INSERT INTO `sys_history` VALUES ('61', '/bmanager/hotWords/hot-words.action*', 'com.game.entity.account.Resource', '786', null, 'create', 'admin', '1307312515', '2015-12-17 17:41:54');
INSERT INTO `sys_history` VALUES ('62', 'com.game.entity.account.Role@5a0178f6[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '407037478', '2015-12-17 17:43:16');
INSERT INTO `sys_history` VALUES ('63', 'com.game.comm.entity.Picr@6f169205[\n  title=Music\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:46:20 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=1\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '1', null, 'create', 'admin', '617568105', '2015-12-17 17:46:20');
INSERT INTO `sys_history` VALUES ('64', 'com.game.comm.entity.Picr@6f169205[\n  title=Music\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/1pef2ffdb515af0ff09bdf38b8be042975.png\n  picUrl=http://183.63.53.103:12080/pic/1pef2ffdb515af0ff09bdf38b8be042975.png\n  picMd5=ef2ffdb515af0ff09bdf38b8be042975\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:46:20 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:46:20 CST 2015\n  lastModifyBy=admin\n  id=1\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '1', null, 'update', 'admin', '617568105', '2015-12-17 17:46:20');
INSERT INTO `sys_history` VALUES ('65', 'com.game.comm.entity.Picr@1561b7f1[\n  title=Game\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:46:34 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=2\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '2', null, 'create', 'admin', '1551186986', '2015-12-17 17:46:34');
INSERT INTO `sys_history` VALUES ('66', 'com.game.comm.entity.Picr@1561b7f1[\n  title=Game\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/2p4e79fba4f0f130470ef31a888586640d.png\n  picUrl=http://183.63.53.103:12080/pic/2p4e79fba4f0f130470ef31a888586640d.png\n  picMd5=4e79fba4f0f130470ef31a888586640d\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:46:34 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:46:34 CST 2015\n  lastModifyBy=admin\n  id=2\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '2', null, 'update', 'admin', '1551186986', '2015-12-17 17:46:34');
INSERT INTO `sys_history` VALUES ('67', 'com.game.comm.entity.Picr@1f5fb185[\n  title=News\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:46:47 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=3\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '3', null, 'create', 'admin', '318456113', '2015-12-17 17:46:47');
INSERT INTO `sys_history` VALUES ('68', 'com.game.comm.entity.Picr@1f5fb185[\n  title=News\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/3pf0a4305bd30ce11c0f644c7bb15648d1.png\n  picUrl=http://183.63.53.103:12080/pic/3pf0a4305bd30ce11c0f644c7bb15648d1.png\n  picMd5=f0a4305bd30ce11c0f644c7bb15648d1\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:46:47 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:46:47 CST 2015\n  lastModifyBy=admin\n  id=3\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '3', null, 'update', 'admin', '318456113', '2015-12-17 17:46:47');
INSERT INTO `sys_history` VALUES ('69', 'com.game.comm.entity.Picr@4dba0ec8[\n  title=Shopping\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:47:02 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=4\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '4', null, 'create', 'admin', '1280429213', '2015-12-17 17:47:02');
INSERT INTO `sys_history` VALUES ('70', 'com.game.comm.entity.Picr@4dba0ec8[\n  title=Shopping\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/4p08ee72528377cf75eff5c8e87731fdf5.png\n  picUrl=http://183.63.53.103:12080/pic/4p08ee72528377cf75eff5c8e87731fdf5.png\n  picMd5=08ee72528377cf75eff5c8e87731fdf5\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:47:02 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:47:02 CST 2015\n  lastModifyBy=admin\n  id=4\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '4', null, 'update', 'admin', '1280429213', '2015-12-17 17:47:02');
INSERT INTO `sys_history` VALUES ('71', 'com.game.comm.entity.Picr@d1cef33[\n  title=Social\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:47:13 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=5\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '5', null, 'create', 'admin', '808061545', '2015-12-17 17:47:13');
INSERT INTO `sys_history` VALUES ('72', 'com.game.comm.entity.Picr@d1cef33[\n  title=Social\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/5p4e52fb4c3a419fea457727d342c51fab.png\n  picUrl=http://183.63.53.103:12080/pic/5p4e52fb4c3a419fea457727d342c51fab.png\n  picMd5=4e52fb4c3a419fea457727d342c51fab\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:47:13 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:47:13 CST 2015\n  lastModifyBy=admin\n  id=5\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '5', null, 'update', 'admin', '808061545', '2015-12-17 17:47:13');
INSERT INTO `sys_history` VALUES ('73', 'com.game.comm.entity.Picr@7c2d3caf[\n  title=Sports\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:47:29 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=6\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '6', null, 'create', 'admin', '945944407', '2015-12-17 17:47:29');
INSERT INTO `sys_history` VALUES ('74', 'com.game.comm.entity.Picr@7c2d3caf[\n  title=Sports\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/6pab49e0f3114ee6eb933c68cc55b84fe2.png\n  picUrl=http://183.63.53.103:12080/pic/6pab49e0f3114ee6eb933c68cc55b84fe2.png\n  picMd5=ab49e0f3114ee6eb933c68cc55b84fe2\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:47:29 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:47:29 CST 2015\n  lastModifyBy=admin\n  id=6\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '6', null, 'update', 'admin', '945944407', '2015-12-17 17:47:29');
INSERT INTO `sys_history` VALUES ('75', 'com.game.comm.entity.Picr@29bfe70b[\n  title=Video\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:47:41 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=7\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '7', null, 'create', 'admin', '742082314', '2015-12-17 17:47:41');
INSERT INTO `sys_history` VALUES ('76', 'com.game.comm.entity.Picr@29bfe70b[\n  title=Video\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/7pc841a92a1b496e6e1039c8da92d664ac.png\n  picUrl=http://183.63.53.103:12080/pic/7pc841a92a1b496e6e1039c8da92d664ac.png\n  picMd5=c841a92a1b496e6e1039c8da92d664ac\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:47:41 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:47:41 CST 2015\n  lastModifyBy=admin\n  id=7\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '7', null, 'update', 'admin', '742082314', '2015-12-17 17:47:41');
INSERT INTO `sys_history` VALUES ('77', 'com.game.comm.entity.Picr@1541cb1[\n  title=Toolbox\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:49:05 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=8\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '8', null, 'create', 'admin', '1832425417', '2015-12-17 17:49:05');
INSERT INTO `sys_history` VALUES ('78', 'com.game.comm.entity.Picr@1541cb1[\n  title=Toolbox\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/8p933c25fafc84da1cb0c5fc9e2a11c28c.png\n  picUrl=http://183.63.53.103:12080/pic/8p933c25fafc84da1cb0c5fc9e2a11c28c.png\n  picMd5=933c25fafc84da1cb0c5fc9e2a11c28c\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:49:05 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:49:05 CST 2015\n  lastModifyBy=admin\n  id=8\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '8', null, 'update', 'admin', '1832425417', '2015-12-17 17:49:05');
INSERT INTO `sys_history` VALUES ('79', 'com.game.comm.entity.Picr@c85e92e[\n  title=Wifi Key\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:49:42 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=9\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '9', null, 'create', 'admin', '977034795', '2015-12-17 17:49:42');
INSERT INTO `sys_history` VALUES ('80', 'com.game.comm.entity.Picr@c85e92e[\n  title=Wifi Key\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/9p5529995f36915ecc8f161ae73c530552.png\n  picUrl=http://183.63.53.103:12080/pic/9p5529995f36915ecc8f161ae73c530552.png\n  picMd5=5529995f36915ecc8f161ae73c530552\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:49:42 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:49:42 CST 2015\n  lastModifyBy=admin\n  id=9\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '9', null, 'update', 'admin', '977034795', '2015-12-17 17:49:42');
INSERT INTO `sys_history` VALUES ('81', 'com.game.comm.entity.Picr@4aedb92f[\n  title=Video Browser\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:50:37 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=10\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '10', null, 'create', 'admin', '1557082755', '2015-12-17 17:50:37');
INSERT INTO `sys_history` VALUES ('82', 'com.game.comm.entity.Picr@4aedb92f[\n  title=Video Browser\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/10p08bc2a18febd341fcc9e6e90bf5e5ea8.jpg\n  picUrl=http://183.63.53.103:12080/pic/10p08bc2a18febd341fcc9e6e90bf5e5ea8.jpg\n  picMd5=08bc2a18febd341fcc9e6e90bf5e5ea8\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:50:37 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:50:37 CST 2015\n  lastModifyBy=admin\n  id=10\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '10', null, 'update', 'admin', '1557082755', '2015-12-17 17:50:37');
INSERT INTO `sys_history` VALUES ('83', 'com.game.comm.entity.Picr@187d0b73[\n  title=sina\n  picPath=<null>\n  picUrl=\n  picMd5=<null>\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:50:54 CST 2015\n  createBy=admin\n  lastModifyTime=<null>\n  lastModifyBy=<null>\n  id=11\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '11', null, 'create', 'admin', '662519738', '2015-12-17 17:50:54');
INSERT INTO `sys_history` VALUES ('84', 'com.game.comm.entity.Picr@187d0b73[\n  title=sina\n  picPath=/var/www/tomcats/tomcat2/webapps/pic/11pacbed7add202d5ac1f5acdd746213042.png\n  picUrl=http://183.63.53.103:12080/pic/11pacbed7add202d5ac1f5acdd746213042.png\n  picMd5=acbed7add202d5ac1f5acdd746213042\n  remark=\n  status=1\n  createTime=Thu Dec 17 17:50:54 CST 2015\n  createBy=admin\n  lastModifyTime=Thu Dec 17 17:50:54 CST 2015\n  lastModifyBy=admin\n  id=11\n  sessCode=<null>\n]', 'com.game.comm.entity.Picr', '11', null, 'update', 'admin', '662519738', '2015-12-17 17:50:54');
INSERT INTO `sys_history` VALUES ('85', 'HotWords[title=Music,cdesc=,realDownUrl=http://mp3.com/,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/1pef2ffdb515af0ff09bdf38b8be042975.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:52:30 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=1,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '1', null, 'create', 'admin', '1206917849', '2015-12-17 17:52:30');
INSERT INTO `sys_history` VALUES ('86', 'HotWords[title=Music,cdesc=,realDownUrl=http://mp3.com/,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=1&t=2,iconUrl=http://183.63.53.103:12080/pic/1pef2ffdb515af0ff09bdf38b8be042975.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:52:30 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:52:30 CST 2015,lastModifyBy=admin,id=1,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '1', null, 'update', 'admin', '1206917849', '2015-12-17 17:52:30');
INSERT INTO `sys_history` VALUES ('87', 'HotWords[title=Games,cdesc=,realDownUrl=http://www.higames.cc/,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/2p4e79fba4f0f130470ef31a888586640d.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:53:10 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=2,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '2', null, 'create', 'admin', '1652761361', '2015-12-17 17:53:10');
INSERT INTO `sys_history` VALUES ('88', 'HotWords[title=Games,cdesc=,realDownUrl=http://www.higames.cc/,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=2&t=2,iconUrl=http://183.63.53.103:12080/pic/2p4e79fba4f0f130470ef31a888586640d.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:53:10 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:53:10 CST 2015,lastModifyBy=admin,id=2,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '2', null, 'update', 'admin', '1652761361', '2015-12-17 17:53:10');
INSERT INTO `sys_history` VALUES ('89', 'HotWords[title=Social,cdesc=,realDownUrl=https://www.facebook.com/,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/5p4e52fb4c3a419fea457727d342c51fab.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:54:11 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=3,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '3', null, 'create', 'admin', '2121227371', '2015-12-17 17:54:11');
INSERT INTO `sys_history` VALUES ('90', 'HotWords[title=Social,cdesc=,realDownUrl=https://www.facebook.com/,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=3&t=2,iconUrl=http://183.63.53.103:12080/pic/5p4e52fb4c3a419fea457727d342c51fab.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:54:11 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:54:11 CST 2015,lastModifyBy=admin,id=3,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '3', null, 'update', 'admin', '2121227371', '2015-12-17 17:54:11');
INSERT INTO `sys_history` VALUES ('91', 'HotWords[title=Hot news,cdesc=,realDownUrl=http://g.qoocc.com/news/?ac=lists&cate_id=1,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/3pf0a4305bd30ce11c0f644c7bb15648d1.png,customers=<null>,status=0,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:55:02 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=4,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '4', null, 'create', 'admin', '1894047808', '2015-12-17 17:55:02');
INSERT INTO `sys_history` VALUES ('92', 'HotWords[title=Hot news,cdesc=,realDownUrl=http://g.qoocc.com/news/?ac=lists&cate_id=1,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=4&t=2,iconUrl=http://183.63.53.103:12080/pic/3pf0a4305bd30ce11c0f644c7bb15648d1.png,customers=<null>,status=0,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:55:02 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:55:02 CST 2015,lastModifyBy=admin,id=4,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '4', null, 'update', 'admin', '1894047808', '2015-12-17 17:55:02');
INSERT INTO `sys_history` VALUES ('93', 'HotWords[title=Hot news,cdesc=,realDownUrl=http://g.qoocc.com/news/?ac=lists&cate_id=1,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=4&t=2,iconUrl=http://183.63.53.103:12080/pic/3pf0a4305bd30ce11c0f644c7bb15648d1.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=2015-12-17 17:55:02.0,createBy=admin,lastModifyTime=Thu Dec 17 17:55:09 CST 2015,lastModifyBy=admin,id=4,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '4', null, 'update', 'admin', '138456806', '2015-12-17 17:55:09');
INSERT INTO `sys_history` VALUES ('94', 'HotWords[title=Video,cdesc=,realDownUrl=http://m.allnicevideos.com/,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/7pc841a92a1b496e6e1039c8da92d664ac.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:56:02 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=5,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '5', null, 'create', 'admin', '1860306101', '2015-12-17 17:56:02');
INSERT INTO `sys_history` VALUES ('95', 'HotWords[title=Video,cdesc=,realDownUrl=http://m.allnicevideos.com/,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=5&t=2,iconUrl=http://183.63.53.103:12080/pic/7pc841a92a1b496e6e1039c8da92d664ac.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:56:02 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:56:02 CST 2015,lastModifyBy=admin,id=5,sessCode=<null>]', 'com.game.bmanager.entity.HotWords', '5', null, 'update', 'admin', '1860306101', '2015-12-17 17:56:02');
INSERT INTO `sys_history` VALUES ('96', 'Recommend[title=mm music,cdesc=,realDownUrl=http://121.201.35.5:8818/boss/quietinstall/85/_85_478.apk,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/11pacbed7add202d5ac1f5acdd746213042.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:57:23 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=3,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '3', null, 'create', 'admin', '344397148', '2015-12-17 17:57:23');
INSERT INTO `sys_history` VALUES ('97', 'Recommend[title=mm music,cdesc=,realDownUrl=http://121.201.35.5:8818/boss/quietinstall/85/_85_478.apk,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=3&t=1,iconUrl=http://183.63.53.103:12080/pic/11pacbed7add202d5ac1f5acdd746213042.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:57:23 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:57:23 CST 2015,lastModifyBy=admin,id=3,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '3', null, 'update', 'admin', '344397148', '2015-12-17 17:57:23');
INSERT INTO `sys_history` VALUES ('98', 'Recommend[title=Video Browser,cdesc=,realDownUrl=http://121.201.35.5:8818/boss/quietinstall/85/_85_478.apk,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/10p08bc2a18febd341fcc9e6e90bf5e5ea8.jpg,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:57:46 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=4,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '4', null, 'create', 'admin', '230729818', '2015-12-17 17:57:46');
INSERT INTO `sys_history` VALUES ('99', 'Recommend[title=Video Browser,cdesc=,realDownUrl=http://121.201.35.5:8818/boss/quietinstall/85/_85_478.apk,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=4&t=1,iconUrl=http://183.63.53.103:12080/pic/10p08bc2a18febd341fcc9e6e90bf5e5ea8.jpg,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:57:46 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:57:46 CST 2015,lastModifyBy=admin,id=4,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '4', null, 'update', 'admin', '230729818', '2015-12-17 17:57:46');
INSERT INTO `sys_history` VALUES ('100', 'Recommend[title=sina,cdesc=,realDownUrl=http://121.201.35.5:8818/boss/quietinstall/85/_85_478.apk,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/11pacbed7add202d5ac1f5acdd746213042.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:58:13 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=5,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '5', null, 'create', 'admin', '220692947', '2015-12-17 17:58:13');
INSERT INTO `sys_history` VALUES ('101', 'Recommend[title=sina,cdesc=,realDownUrl=http://121.201.35.5:8818/boss/quietinstall/85/_85_478.apk,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=5&t=1,iconUrl=http://183.63.53.103:12080/pic/11pacbed7add202d5ac1f5acdd746213042.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:58:13 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:58:13 CST 2015,lastModifyBy=admin,id=5,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '5', null, 'update', 'admin', '220692947', '2015-12-17 17:58:13');
INSERT INTO `sys_history` VALUES ('102', 'Recommend[title=Wifi Key,cdesc=,realDownUrl=http://bcdn.yiipol.com/Allexy_a80006_1.0.apk,dumpDownUrl=<null>,iconUrl=http://183.63.53.103:12080/pic/9p5529995f36915ecc8f161ae73c530552.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:58:52 CST 2015,createBy=admin,lastModifyTime=<null>,lastModifyBy=<null>,id=6,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '6', null, 'create', 'admin', '377104262', '2015-12-17 17:58:52');
INSERT INTO `sys_history` VALUES ('103', 'Recommend[title=Wifi Key,cdesc=,realDownUrl=http://bcdn.yiipol.com/Allexy_a80006_1.0.apk,dumpDownUrl=http://183.63.53.103:21080/jump.action?id=6&t=1,iconUrl=http://183.63.53.103:12080/pic/9p5529995f36915ecc8f161ae73c530552.png,customers=<null>,status=1,begintime=00:00:00,endtime=23:59:59,citys=<null>,createTime=Thu Dec 17 17:58:52 CST 2015,createBy=admin,lastModifyTime=Thu Dec 17 17:58:52 CST 2015,lastModifyBy=admin,id=6,sessCode=<null>]', 'com.game.bmanager.entity.Recommend', '6', null, 'update', 'admin', '377104262', '2015-12-17 17:58:52');
INSERT INTO `sys_history` VALUES ('104', 'com.game.entity.account.Role@421889a7[1,超级系统管理员]', 'com.game.entity.account.Role', '1', null, 'update', 'admin', '1312884510', '2015-12-29 17:33:53');

-- ----------------------------
-- Table structure for sys_history_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_history_item`;
CREATE TABLE `sys_history_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `new_value` varchar(2000) DEFAULT NULL,
  `previous_value` varchar(2000) DEFAULT NULL,
  `property` varchar(255) DEFAULT NULL,
  `history_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5184EC10F8824CB1` (`history_id`) USING BTREE,
  KEY `FK5184EC109AB07AB7` (`history_id`) USING BTREE,
  CONSTRAINT `sys_history_item_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `sys_history` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 15360 kB; (`history_id`) REFER `qc_push/sys_his';

-- ----------------------------
-- Records of sys_history_item
-- ----------------------------
INSERT INTO `sys_history_item` VALUES ('1', 'http://183.63.53.103:21080/lmuch/images/565ff9d0ecd3e.png', 'http://192.168.5.75:10010/browser/lmuch/images/565ff9d0ecd3e.png', 'iconUrl', '59');
INSERT INTO `sys_history_item` VALUES ('2', 'http://183.63.53.103:21080/lmuch/images/565ff9d0ecd3e.png', 'http://localhost:10010/browser/lmuch/images/565ff9d0ecd3e.png', 'realDownUrl', '59');
INSERT INTO `sys_history_item` VALUES ('3', 'http://183.63.53.103:12080/pic/1pef2ffdb515af0ff09bdf38b8be042975.png', '', 'picUrl', '64');
INSERT INTO `sys_history_item` VALUES ('4', 'http://183.63.53.103:12080/pic/2p4e79fba4f0f130470ef31a888586640d.png', '', 'picUrl', '66');
INSERT INTO `sys_history_item` VALUES ('5', 'http://183.63.53.103:12080/pic/3pf0a4305bd30ce11c0f644c7bb15648d1.png', '', 'picUrl', '68');
INSERT INTO `sys_history_item` VALUES ('6', 'http://183.63.53.103:12080/pic/4p08ee72528377cf75eff5c8e87731fdf5.png', '', 'picUrl', '70');
INSERT INTO `sys_history_item` VALUES ('7', 'http://183.63.53.103:12080/pic/5p4e52fb4c3a419fea457727d342c51fab.png', '', 'picUrl', '72');
INSERT INTO `sys_history_item` VALUES ('8', 'http://183.63.53.103:12080/pic/6pab49e0f3114ee6eb933c68cc55b84fe2.png', '', 'picUrl', '74');
INSERT INTO `sys_history_item` VALUES ('9', 'http://183.63.53.103:12080/pic/7pc841a92a1b496e6e1039c8da92d664ac.png', '', 'picUrl', '76');
INSERT INTO `sys_history_item` VALUES ('10', 'http://183.63.53.103:12080/pic/8p933c25fafc84da1cb0c5fc9e2a11c28c.png', '', 'picUrl', '78');
INSERT INTO `sys_history_item` VALUES ('11', 'http://183.63.53.103:12080/pic/9p5529995f36915ecc8f161ae73c530552.png', '', 'picUrl', '80');
INSERT INTO `sys_history_item` VALUES ('12', 'http://183.63.53.103:12080/pic/10p08bc2a18febd341fcc9e6e90bf5e5ea8.jpg', '', 'picUrl', '82');
INSERT INTO `sys_history_item` VALUES ('13', 'http://183.63.53.103:12080/pic/11pacbed7add202d5ac1f5acdd746213042.png', '', 'picUrl', '84');
INSERT INTO `sys_history_item` VALUES ('14', '1', '0', 'status', '93');

-- ----------------------------
-- Table structure for sys_journal
-- ----------------------------
DROP TABLE IF EXISTS `sys_journal`;
CREATE TABLE `sys_journal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creat_time` datetime DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `domain_label` varchar(255) DEFAULT NULL,
  `operation_code` int(11) DEFAULT NULL,
  `operator_ip_addr` varchar(255) DEFAULT NULL,
  `operator_name` varchar(255) DEFAULT NULL,
  `session_code` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_journal
-- ----------------------------
INSERT INTO `sys_journal` VALUES ('1', '2015-07-24 18:17:43', '用户登录', '1', 'QC', '107', '127.0.0.1', 'admin', '432970063');
INSERT INTO `sys_journal` VALUES ('2', '2015-07-24 18:22:13', '用户登录', '1', 'QC', '107', '127.0.0.1', 'admin', '1943058105');
INSERT INTO `sys_journal` VALUES ('3', '2015-12-15 11:03:40', '用户登录', '1', 'QC', '107', '0:0:0:0:0:0:0:1', 'admin', '493450422');
INSERT INTO `sys_journal` VALUES ('4', '2015-12-15 11:05:11', '修改角色ID:1', '1', 'QC', '102', '0:0:0:0:0:0:0:1', 'admin', '241922245');
INSERT INTO `sys_journal` VALUES ('5', '2015-12-15 15:14:29', '用户登录', '1', 'QC', '107', '0:0:0:0:0:0:0:1', 'admin', '379548698');
INSERT INTO `sys_journal` VALUES ('6', '2015-12-15 16:02:22', '用户登录', '1', 'QC', '107', '0:0:0:0:0:0:0:1', 'admin', '453189638');
INSERT INTO `sys_journal` VALUES ('7', '2015-12-16 11:05:41', '用户登录', '1', 'QC', '107', '183.16.196.73', 'admin', '188112751');
INSERT INTO `sys_journal` VALUES ('8', '2015-12-16 11:07:28', '新增资源ID：783', '1', 'QC', '106', '183.16.196.73', 'admin', '1420292100');
INSERT INTO `sys_journal` VALUES ('9', '2015-12-16 11:09:16', '新增权限编码：busi_', '1', 'QC', '103', '183.16.196.73', 'admin', '2074792487');
INSERT INTO `sys_journal` VALUES ('10', '2015-12-16 11:10:43', '新增资源ID：784', '1', 'QC', '106', '183.16.196.73', 'admin', '1257136965');
INSERT INTO `sys_journal` VALUES ('11', '2015-12-16 11:11:34', '修改权限编码：busi_', '1', 'QC', '103', '183.16.196.73', 'admin', '857951772');
INSERT INTO `sys_journal` VALUES ('12', '2015-12-16 11:12:12', '新增权限编码：busi_recommend', '1', 'QC', '103', '183.16.196.73', 'admin', '1854303296');
INSERT INTO `sys_journal` VALUES ('13', '2015-12-16 11:12:29', '修改角色ID:1', '1', 'QC', '102', '183.16.196.73', 'admin', '830774300');
INSERT INTO `sys_journal` VALUES ('14', '2015-12-16 11:12:35', '用户登录', '1', 'QC', '107', '183.16.196.73', 'admin', '1061592332');
INSERT INTO `sys_journal` VALUES ('15', '2015-12-16 11:19:47', '用户登录', '1', 'QC', '107', '183.16.196.73', 'admin', '664613728');
INSERT INTO `sys_journal` VALUES ('16', '2015-12-16 11:33:21', '用户登录', '1', 'QC', '107', '183.16.196.73', 'admin', '1238231998');
INSERT INTO `sys_journal` VALUES ('17', '2015-12-16 11:34:19', '修改Recommend-ID：1', '1', 'QC', '106', '183.16.196.73', 'admin', '1570875678');
INSERT INTO `sys_journal` VALUES ('18', '2015-12-16 16:45:33', '用户登录', '1', 'QC', '107', '183.16.196.73', 'admin', '917950849');
INSERT INTO `sys_journal` VALUES ('19', '2015-12-17 15:46:33', '用户登录', '1', 'QC', '107', '119.123.165.130', 'admin', '249660628');
INSERT INTO `sys_journal` VALUES ('20', '2015-12-17 17:39:23', '用户登录', '1', 'QC', '107', '119.123.165.130', 'admin', '1234458742');
INSERT INTO `sys_journal` VALUES ('21', '2015-12-17 17:41:09', '新增资源ID：785', '1', 'QC', '106', '119.123.165.130', 'admin', '270633586');
INSERT INTO `sys_journal` VALUES ('22', '2015-12-17 17:41:54', '新增资源ID：786', '1', 'QC', '106', '119.123.165.130', 'admin', '1307312515');
INSERT INTO `sys_journal` VALUES ('23', '2015-12-17 17:42:31', '新增权限编码：busi_picr', '1', 'QC', '103', '119.123.165.130', 'admin', '883660280');
INSERT INTO `sys_journal` VALUES ('24', '2015-12-17 17:43:00', '新增权限编码：busi_hotwords', '1', 'QC', '103', '119.123.165.130', 'admin', '445128025');
INSERT INTO `sys_journal` VALUES ('25', '2015-12-17 17:43:16', '修改角色ID:1', '1', 'QC', '102', '119.123.165.130', 'admin', '407037478');
INSERT INTO `sys_journal` VALUES ('26', '2015-12-17 17:43:20', '用户登录', '1', 'QC', '107', '119.123.165.130', 'admin', '1598317989');
INSERT INTO `sys_journal` VALUES ('27', '2015-12-17 17:46:20', '新增图片ID：1', '1', 'QC', '106', '119.123.165.130', 'admin', '617568105');
INSERT INTO `sys_journal` VALUES ('28', '2015-12-17 17:46:34', '新增图片ID：2', '1', 'QC', '106', '119.123.165.130', 'admin', '1551186986');
INSERT INTO `sys_journal` VALUES ('29', '2015-12-17 17:46:47', '新增图片ID：3', '1', 'QC', '106', '119.123.165.130', 'admin', '318456113');
INSERT INTO `sys_journal` VALUES ('30', '2015-12-17 17:47:02', '新增图片ID：4', '1', 'QC', '106', '119.123.165.130', 'admin', '1280429213');
INSERT INTO `sys_journal` VALUES ('31', '2015-12-17 17:47:13', '新增图片ID：5', '1', 'QC', '106', '119.123.165.130', 'admin', '808061545');
INSERT INTO `sys_journal` VALUES ('32', '2015-12-17 17:47:29', '新增图片ID：6', '1', 'QC', '106', '119.123.165.130', 'admin', '945944407');
INSERT INTO `sys_journal` VALUES ('33', '2015-12-17 17:47:41', '新增图片ID：7', '1', 'QC', '106', '119.123.165.130', 'admin', '742082314');
INSERT INTO `sys_journal` VALUES ('34', '2015-12-17 17:49:05', '新增图片ID：8', '1', 'QC', '106', '119.123.165.130', 'admin', '1832425417');
INSERT INTO `sys_journal` VALUES ('35', '2015-12-17 17:49:42', '新增图片ID：9', '1', 'QC', '106', '119.123.165.130', 'admin', '977034795');
INSERT INTO `sys_journal` VALUES ('36', '2015-12-17 17:50:37', '新增图片ID：10', '1', 'QC', '106', '119.123.165.130', 'admin', '1557082755');
INSERT INTO `sys_journal` VALUES ('37', '2015-12-17 17:50:54', '新增图片ID：11', '1', 'QC', '106', '119.123.165.130', 'admin', '662519738');
INSERT INTO `sys_journal` VALUES ('38', '2015-12-17 17:52:30', '新增HotWords-ID：1', '1', 'QC', '106', '119.123.165.130', 'admin', '1206917849');
INSERT INTO `sys_journal` VALUES ('39', '2015-12-17 17:53:10', '新增HotWords-ID：2', '1', 'QC', '106', '119.123.165.130', 'admin', '1652761361');
INSERT INTO `sys_journal` VALUES ('40', '2015-12-17 17:54:11', '新增HotWords-ID：3', '1', 'QC', '106', '119.123.165.130', 'admin', '2121227371');
INSERT INTO `sys_journal` VALUES ('41', '2015-12-17 17:55:02', '新增HotWords-ID：4', '1', 'QC', '106', '119.123.165.130', 'admin', '1894047808');
INSERT INTO `sys_journal` VALUES ('42', '2015-12-17 17:55:09', '修改HotWords-ID：4', '1', 'QC', '106', '119.123.165.130', 'admin', '138456806');
INSERT INTO `sys_journal` VALUES ('43', '2015-12-17 17:56:02', '新增HotWords-ID：5', '1', 'QC', '106', '119.123.165.130', 'admin', '1860306101');
INSERT INTO `sys_journal` VALUES ('44', '2015-12-17 17:57:23', '新增Recommend-ID：3', '1', 'QC', '106', '119.123.165.130', 'admin', '344397148');
INSERT INTO `sys_journal` VALUES ('45', '2015-12-17 17:57:46', '新增Recommend-ID：4', '1', 'QC', '106', '119.123.165.130', 'admin', '230729818');
INSERT INTO `sys_journal` VALUES ('46', '2015-12-17 17:58:13', '新增Recommend-ID：5', '1', 'QC', '106', '119.123.165.130', 'admin', '220692947');
INSERT INTO `sys_journal` VALUES ('47', '2015-12-17 17:58:52', '新增Recommend-ID：6', '1', 'QC', '106', '119.123.165.130', 'admin', '377104262');
INSERT INTO `sys_journal` VALUES ('48', '2015-12-17 18:00:12', '用户登录', '1', 'QC', '107', '119.123.165.130', 'admin', '450615179');
INSERT INTO `sys_journal` VALUES ('49', '2015-12-21 09:08:22', '用户登录', '1', 'QC', '107', '183.16.194.79', 'admin', '859687430');
INSERT INTO `sys_journal` VALUES ('50', '2015-12-22 09:53:36', '用户登录', '1', 'QC', '107', '113.88.197.102', 'admin', '608325189');
INSERT INTO `sys_journal` VALUES ('51', '2015-12-23 16:58:12', '用户登录', '1', 'QC', '107', '218.18.249.19', 'admin', '700383687');
INSERT INTO `sys_journal` VALUES ('52', '2015-12-23 19:10:43', '用户登录', '1', 'QC', '107', '218.18.249.19', 'admin', '2138564585');
INSERT INTO `sys_journal` VALUES ('53', '2015-12-29 17:33:38', '用户登录', '1', 'QC', '107', '0:0:0:0:0:0:0:1', 'admin', '173747298');
INSERT INTO `sys_journal` VALUES ('54', '2015-12-29 17:33:53', '修改角色ID:1', '1', 'QC', '102', '0:0:0:0:0:0:0:1', 'admin', '1312884510');

-- ----------------------------
-- Table structure for sys_log_integr
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_integr`;
CREATE TABLE `sys_log_integr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_code` varchar(255) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `operation_code` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `session_code` bigint(20) DEFAULT NULL,
  `trade_seq` varchar(255) DEFAULT NULL,
  `trade_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log_integr
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log_integr_soap
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_integr_soap`;
CREATE TABLE `sys_log_integr_soap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `business_code` varchar(255) DEFAULT NULL,
  `cxfid` varchar(255) DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `log_in` varchar(255) DEFAULT NULL,
  `log_out` varchar(255) DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `trade_seq` varchar(255) DEFAULT NULL,
  `trade_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log_integr_soap
-- ----------------------------

-- ----------------------------
-- Table structure for sys_quartz
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz`;
CREATE TABLE `sys_quartz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_by` varchar(255) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `cron` bit(1) NOT NULL,
  `q_cron` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `jobdata` varchar(255) DEFAULT NULL,
  `millis` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pause` bit(1) NOT NULL,
  `q_repeat` int(11) DEFAULT NULL,
  `q_qrepeat_int` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `system` bit(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_quartz
-- ----------------------------

-- ----------------------------
-- View structure for view_30days
-- ----------------------------
DROP VIEW IF EXISTS `view_30days`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `view_30days` AS select curdate() AS `dd` union all select (curdate() - interval 1 day) AS `dd` union all select (curdate() - interval 2 day) AS `dd` union all select (curdate() - interval 3 day) AS `dd` union all select (curdate() - interval 4 day) AS `dd` union all select (curdate() - interval 5 day) AS `dd` union all select (curdate() - interval 6 day) AS `dd` union all select (curdate() - interval 7 day) AS `dd` union all select (curdate() - interval 8 day) AS `dd` union all select (curdate() - interval 9 day) AS `dd` union all select (curdate() - interval 10 day) AS `dd` union all select (curdate() - interval 11 day) AS `dd` union all select (curdate() - interval 12 day) AS `dd` union all select (curdate() - interval 13 day) AS `dd` union all select (curdate() - interval 14 day) AS `dd` union all select (curdate() - interval 15 day) AS `dd` union all select (curdate() - interval 16 day) AS `dd` union all select (curdate() - interval 17 day) AS `dd` union all select (curdate() - interval 18 day) AS `dd` union all select (curdate() - interval 19 day) AS `dd` union all select (curdate() - interval 20 day) AS `dd` union all select (curdate() - interval 21 day) AS `dd` union all select (curdate() - interval 22 day) AS `dd` union all select (curdate() - interval 23 day) AS `dd` union all select (curdate() - interval 24 day) AS `dd` union all select (curdate() - interval 25 day) AS `dd` union all select (curdate() - interval 26 day) AS `dd` union all select (curdate() - interval 27 day) AS `dd` union all select (curdate() - interval 28 day) AS `dd` union all select (curdate() - interval 29 day) AS `dd` ;
