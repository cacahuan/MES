/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : openauthdb

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-03-17 16:53:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL COMMENT '分类表ID',
  `CascadeId` varchar(255) NOT NULL COMMENT '节点语义ID',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `ParentId` int(11) NOT NULL COMMENT '父节点流水号',
  `Status` int(11) NOT NULL COMMENT '当前状态',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `RootKey` varchar(100) NOT NULL COMMENT '分类所属科目',
  `RootName` varchar(200) NOT NULL COMMENT '分类所属科目名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('7', '0.1', '报表资源', '0', '0', '0', '', '');

-- ----------------------------
-- Table structure for dicdetail
-- ----------------------------
DROP TABLE IF EXISTS `dicdetail`;
CREATE TABLE `dicdetail` (
  `Id` int(11) NOT NULL COMMENT 'ID',
  `Value` varchar(100) NOT NULL COMMENT '值',
  `Text` varchar(100) NOT NULL COMMENT '文本描述',
  `DicId` int(11) NOT NULL COMMENT '所属字典ID',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `Status` int(11) NOT NULL COMMENT '状态',
  `Description` varchar(100) NOT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据字典详情';

-- ----------------------------
-- Records of dicdetail
-- ----------------------------

-- ----------------------------
-- Table structure for dicindex
-- ----------------------------
DROP TABLE IF EXISTS `dicindex`;
CREATE TABLE `dicindex` (
  `Id` int(11) NOT NULL COMMENT '数据字典ID',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `Key` varchar(100) NOT NULL,
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `CategoryId` int(11) NOT NULL COMMENT '所属分类',
  `Description` varchar(200) NOT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据字典';

-- ----------------------------
-- Records of dicindex
-- ----------------------------

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `Id` int(11) NOT NULL COMMENT '功能模块流水号',
  `CascadeId` varchar(255) NOT NULL COMMENT '节点语义ID',
  `Name` varchar(255) NOT NULL COMMENT '功能模块名称',
  `Url` varchar(255) NOT NULL COMMENT '主页面URL',
  `HotKey` varchar(255) NOT NULL COMMENT '热键',
  `ParentId` int(11) NOT NULL COMMENT '父节点流水号',
  `IsLeaf` tinyint(4) NOT NULL COMMENT '是否叶子节点',
  `IsAutoExpand` tinyint(4) NOT NULL COMMENT '是否自动展开',
  `IconName` varchar(255) NOT NULL COMMENT '节点图标文件名称',
  `Status` int(11) NOT NULL COMMENT '当前状态',
  `ParentName` varchar(255) NOT NULL COMMENT '父节点名称',
  `Vector` varchar(255) NOT NULL COMMENT '矢量图标',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='功能模块表';

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '0.1.1', '模块管理', 'ModuleManager/Index', ' ', '2', '1', '0', ' ', '1', ' ', ' ', '0');
INSERT INTO `module` VALUES ('2', '0.1', '基础配置', ' ', ' ', '0', '1', '0', ' ', '1', ' ', ' ', '0');
INSERT INTO `module` VALUES ('4', '0.1.3', '部门管理', 'OrgManager/Index', '', '2', '0', '0', '', '0', '基础配置', '', '0');
INSERT INTO `module` VALUES ('5', '0.1.4', '角色管理', 'RoleManager/Index', '', '2', '0', '0', '', '0', '基础配置', '', '0');
INSERT INTO `module` VALUES ('6', '0.2', '应用功能', '/', '', '0', '0', '0', '', '0', '根节点', '', '0');
INSERT INTO `module` VALUES ('7', '0.2.1', '进出库管理', 'StockManager/Index', '', '6', '0', '0', '', '0', '应用功能', '', '0');
INSERT INTO `module` VALUES ('8', '0.1.5', '分类管理', 'CategoryManager/Index', '', '2', '0', '0', '', '0', '基础配置', '', '0');
INSERT INTO `module` VALUES ('9', '0.1.2', '用户管理', 'UserManager/Index', '', '2', '0', '0', '', '0', '基础配置', '', '0');
INSERT INTO `module` VALUES ('10', '0.1.6', '资源管理', 'ResourceManager/Index', '', '2', '0', '0', '', '0', '基础配置', '', '0');

-- ----------------------------
-- Table structure for moduleelement
-- ----------------------------
DROP TABLE IF EXISTS `moduleelement`;
CREATE TABLE `moduleelement` (
  `Id` int(11) NOT NULL COMMENT '流水号',
  `DomId` varchar(255) NOT NULL COMMENT 'DOM ID',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `Type` varchar(50) NOT NULL COMMENT '类型',
  `ModuleId` int(11) NOT NULL COMMENT '功能模块Id',
  `Attr` text NOT NULL COMMENT '元素附加属性',
  `Script` text NOT NULL COMMENT '元素调用脚本',
  `Icon` varchar(255) NOT NULL COMMENT '元素图标',
  `Class` varchar(255) NOT NULL COMMENT '元素样式',
  `Remark` varchar(200) NOT NULL COMMENT '备注',
  `Sort` int(11) NOT NULL COMMENT '排序字段',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模块元素表(需要权限控制的按钮)';

-- ----------------------------
-- Records of moduleelement
-- ----------------------------
INSERT INTO `moduleelement` VALUES ('2', 'btnAdd', '添加', 'a', '3', 'href=\'/UserManager/Add/\' data-toggle=\'dialog\' data-id=\'dialog-mask\' data-mask=\'true\' data-on-close=\'refreshGrid\'', 'javascript:;', 'plus', 'btn btn-green ', '', '0');
INSERT INTO `moduleelement` VALUES ('3', 'btnEdit', '编辑', 'button', '3', '', 'editUser()', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('4', 'btnAccessModule', '为用户分配模块', 'button', '3', '', 'openUserModuleAccess(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('5', 'btnAccessRole', '为用户分配角色', 'button', '3', '', 'openUserRoleAccess(this)', 'pencil', 'btn-green ', '', '0');
INSERT INTO `moduleelement` VALUES ('6', 'btnRefresh', '刷新', 'button', '3', '', 'refreshUserGrid()', 'refresh', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('7', 'btnDel', '删除', 'button', '3', '', 'delUser()', 'pencil', 'btn-red ', '', '0');
INSERT INTO `moduleelement` VALUES ('10', 'btnRefresh', '刷新', 'button', '4', '', 'refreshOrgGrid()', 'refresh', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('11', 'btnAdd', '添加', 'a', '4', 'href=\'/OrgManager/AddOrg/\' data-toggle=\'dialog\' data-id=\'dialog-mask\' data-mask=\'true\' data-on-close=\'refreshGrid\'', 'javascript:;', 'plus', 'btn btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('12', 'btnDel', '删除', 'button', '4', '', 'delOrg()', 'del', 'btn-red', '', '0');
INSERT INTO `moduleelement` VALUES ('19', 'btnAdd', '添加', 'a', '5', 'href=\'/RoleManager/Add/\' data-toggle=\'dialog\' data-id=\'dialog-mask\' data-mask=\'true\' data-on-close=\'refreshGrid\'', 'javascript:;', 'plus', 'btn btn-green ', '', '0');
INSERT INTO `moduleelement` VALUES ('20', 'btnEdit', '编辑', 'button', '5', '', 'editRole()', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('21', 'btnAccessModule', '为角色分配模块', 'button', '5', '', 'assignRoleModule(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('23', 'btnRefresh', '刷新', 'button', '5', '', 'refreshRoleGrid()', 'refresh', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('24', 'btnDel', '删除', 'button', '5', '', 'delRole()', 'pencil', 'btn-red ', '', '0');
INSERT INTO `moduleelement` VALUES ('25', 'btnAdd', '添加', 'a', '1', 'href=\'/ModuleManager/Add/\' data-toggle=\'dialog\' data-id=\'dialog-mask\' data-mask=\'true\' data-on-close=\'refreshGrid\'', 'javascript:;', 'plus', 'btn btn-green ', '', '0');
INSERT INTO `moduleelement` VALUES ('26', 'btnEdit', '编辑', 'button', '1', '', 'editModule()', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('27', 'btnAssign', '为模块分配按钮', 'button', '1', '', 'assignButton()', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('28', 'btnRefresh', '刷新', 'button', '1', '', 'refreshModuleGrid()', 'refresh', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('29', 'btnDel', '删除', 'button', '1', '', 'delModule()', 'pencil', 'btn-red ', '', '0');
INSERT INTO `moduleelement` VALUES ('30', 'btnAssignElement', '为用户分配菜单', 'button', '3', '', 'openAssignUserElement(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('31', 'btnAssignElement', '为角色分配菜单', 'button', '5', '', 'assignRoleElement(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('32', 'btnAdd', '添加', 'a', '8', 'href=\'/CategoryManager/Add/\' data-toggle=\'dialog\' data-id=\'dialog-mask\' data-mask=\'true\' data-on-close=\'refreshGrid\'', '', 'plus', 'btn btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('33', 'btnDel', '删除', 'button', '8', ' ', 'delCategory()', 'pencil', 'btn-red', '', '0');
INSERT INTO `moduleelement` VALUES ('34', 'btnEdit', '编辑', 'button', '8', ' ', 'editCategory()', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('35', 'btnAdd', '添加', 'a', '9', 'href=\'/UserManager/Add/\' data-toggle=\'dialog\' data-id=\'dialog-mask\' data-mask=\'true\' data-on-close=\'refreshGrid\'', 'javascript:;', 'plus', 'btn btn-green ', '', '0');
INSERT INTO `moduleelement` VALUES ('36', 'btnEdit', '编辑', 'button', '9', ' ', 'editUser()', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('37', 'btnAccessModule', '为用户分配模块', 'button', '9', ' ', 'openUserModuleAccess(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('38', 'btnAccessRole', '为用户分配角色', 'button', '9', ' ', 'openUserRoleAccess(this)', 'pencil', 'btn-green ', '', '0');
INSERT INTO `moduleelement` VALUES ('39', 'btnRefresh', '刷新', 'button', '9', ' ', 'refreshUserGrid()', 'refresh', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('40', 'btnDel', '删除', 'button', '9', ' ', 'delUser()', 'pencil', 'btn-red ', '', '0');
INSERT INTO `moduleelement` VALUES ('41', 'btnAssignElement', '为用户分配菜单', 'button', '9', ' ', 'openAssignUserElement(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('43', 'btnAdd', '添加', 'a', '10', 'href=\'/ResourceManager/Add/\' data-toggle=\'dialog\' data-id=\'dialog-mask\' data-mask=\'true\' data-on-close=\'refreshGrid\'', 'javascript:;', 'pencil', 'btn btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('44', 'btnEdit', '编辑', 'button', '10', ' ', 'editResource()', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('45', 'btnDel', '删除', 'button', '10', ' ', 'delResource()', 'plus', 'btn-red', '', '0');
INSERT INTO `moduleelement` VALUES ('46', 'btnAssignReource', '为用户分配资源', 'button', '9', ' ', 'openUserReourceAccess(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('47', 'btnAssignRes', '为角色分配资源', 'button', '5', ' ', 'openRoleReourceAccess(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('48', 'btnAddStock', '添加', 'a', '7', 'href=\'/StockManager/Add/\' data-toggle=\'dialog\' data-id=\'dialog-mask\' data-mask=\'true\' data-on-close=\'refreshGrid\'', 'javascript:;', 'pencil', 'btn btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('50', 'btnDelStock', '删除', 'button', '7', ' ', 'delStock()', 'plus', 'btn-red', '', '0');
INSERT INTO `moduleelement` VALUES ('51', 'btnEditStock', '编辑', 'button', '7', ' ', 'editStock()', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('52', 'btnAccessOrg', '为角色分配部门', 'button', '5', ' ', 'assignRoleOrg(this)', 'pencil', 'btn-green', '', '0');
INSERT INTO `moduleelement` VALUES ('53', 'btnOpenUserOrgAccess', '为用户分配部门权限', 'button', '9', ' ', 'openUserOrgAccess(this)', 'pencil', 'btn-green', '', '0');

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `Id` int(11) NOT NULL COMMENT '流水号',
  `CascadeId` varchar(255) NOT NULL COMMENT '节点语义ID',
  `Name` varchar(255) NOT NULL COMMENT '组织名称',
  `HotKey` varchar(255) NOT NULL COMMENT '热键',
  `ParentId` int(11) NOT NULL COMMENT '父节点流水号',
  `ParentName` varchar(255) NOT NULL COMMENT '父节点名称',
  `IsLeaf` tinyint(4) NOT NULL COMMENT '是否叶子节点',
  `IsAutoExpand` tinyint(4) NOT NULL COMMENT '是否自动展开',
  `IconName` varchar(255) NOT NULL COMMENT '节点图标文件名称',
  `Status` int(11) NOT NULL COMMENT '当前状态',
  `Type` int(11) NOT NULL COMMENT '组织类型',
  `BizCode` varchar(255) NOT NULL COMMENT '业务对照码',
  `CustomCode` text NOT NULL COMMENT '自定义扩展码',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `CreateId` int(11) NOT NULL COMMENT '创建人ID',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织表';

-- ----------------------------
-- Records of org
-- ----------------------------
INSERT INTO `org` VALUES ('1', '0.1', '集团总部', '', '0', '根节点', '0', '0', '', '0', '0', '', '', '2015-12-05 21:51:36', '0', '0');
INSERT INTO `org` VALUES ('2', '0.1.1', '研发部', '', '1', '集团总部', '0', '0', '', '0', '0', '', '', '2015-12-29 17:03:45', '0', '0');
INSERT INTO `org` VALUES ('3', '0.1.2', '生产部', '', '1', '集团总部', '0', '0', '', '0', '0', '', '', '2015-12-29 17:03:57', '0', '0');
INSERT INTO `org` VALUES ('4', '0.1.2.1', '生产1组', '', '3', '生产部', '0', '0', '', '0', '0', '', '', '2015-12-29 17:04:44', '0', '0');

-- ----------------------------
-- Table structure for param
-- ----------------------------
DROP TABLE IF EXISTS `param`;
CREATE TABLE `param` (
  `Id` int(11) NOT NULL COMMENT 'ID',
  `Value` varchar(100) NOT NULL COMMENT '值',
  `Key` varchar(100) NOT NULL,
  `CategoryId` int(11) NOT NULL COMMENT '所属分类',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `Status` int(11) NOT NULL COMMENT '状态',
  `Description` varchar(100) NOT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='键值参数';

-- ----------------------------
-- Records of param
-- ----------------------------

-- ----------------------------
-- Table structure for relevance
-- ----------------------------
DROP TABLE IF EXISTS `relevance`;
CREATE TABLE `relevance` (
  `Id` int(11) NOT NULL COMMENT '流水号',
  `FirstId` int(11) NOT NULL COMMENT '第一个表主键ID',
  `SecondId` int(11) NOT NULL COMMENT '第二个表主键ID',
  `Description` varchar(100) NOT NULL COMMENT '描述',
  `Key` varchar(100) NOT NULL,
  `Status` int(11) NOT NULL COMMENT '状态',
  `OperateTime` datetime NOT NULL COMMENT '授权时间',
  `OperatorId` int(11) NOT NULL COMMENT '授权人',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='多对多关系集中映射';

-- ----------------------------
-- Records of relevance
-- ----------------------------
INSERT INTO `relevance` VALUES ('50', '21', '10', '', 'UserElement', '0', '2015-12-08 00:20:55', '0');
INSERT INTO `relevance` VALUES ('51', '21', '11', '', 'UserElement', '0', '2015-12-08 00:20:55', '0');
INSERT INTO `relevance` VALUES ('52', '1', '1', '', 'UserOrg', '0', '2015-12-19 16:46:25', '0');
INSERT INTO `relevance` VALUES ('64', '1', '1', '', 'UserRole', '0', '2015-12-22 11:34:12', '0');
INSERT INTO `relevance` VALUES ('65', '1', '2', '', 'UserRole', '0', '2015-12-22 11:34:12', '0');
INSERT INTO `relevance` VALUES ('66', '1', '2', '', 'UserResource', '0', '2015-12-22 14:59:46', '0');
INSERT INTO `relevance` VALUES ('67', '1', '3', '', 'UserResource', '0', '2015-12-22 14:59:49', '0');
INSERT INTO `relevance` VALUES ('68', '1', '4', '', 'RoleResource', '0', '2015-12-22 15:00:17', '0');
INSERT INTO `relevance` VALUES ('69', '2', '6', '', 'RoleModule', '0', '2015-12-29 17:06:32', '0');
INSERT INTO `relevance` VALUES ('70', '2', '7', '', 'RoleModule', '0', '2015-12-29 17:06:32', '0');
INSERT INTO `relevance` VALUES ('84', '1', '10', '', 'RoleElement', '0', '2015-12-29 17:11:30', '0');
INSERT INTO `relevance` VALUES ('85', '1', '11', '', 'RoleElement', '0', '2015-12-29 17:11:30', '0');
INSERT INTO `relevance` VALUES ('86', '1', '12', '', 'RoleElement', '0', '2015-12-29 17:11:30', '0');
INSERT INTO `relevance` VALUES ('92', '2', '1', '', 'UserAccessedOrg', '0', '2016-01-07 11:19:46', '0');
INSERT INTO `relevance` VALUES ('93', '2', '3', '', 'UserAccessedOrg', '0', '2016-01-07 11:19:46', '0');
INSERT INTO `relevance` VALUES ('94', '2', '4', '', 'UserAccessedOrg', '0', '2016-01-07 11:19:46', '0');
INSERT INTO `relevance` VALUES ('95', '1', '25', '', 'RoleElement', '0', '2016-01-07 16:14:00', '0');
INSERT INTO `relevance` VALUES ('96', '1', '26', '', 'RoleElement', '0', '2016-01-07 16:14:00', '0');
INSERT INTO `relevance` VALUES ('97', '1', '27', '', 'RoleElement', '0', '2016-01-07 16:14:00', '0');
INSERT INTO `relevance` VALUES ('98', '1', '28', '', 'RoleElement', '0', '2016-01-07 16:14:00', '0');
INSERT INTO `relevance` VALUES ('99', '1', '21', '', 'RoleElement', '0', '2016-01-07 16:14:09', '0');
INSERT INTO `relevance` VALUES ('100', '1', '23', '', 'RoleElement', '0', '2016-01-07 16:14:09', '0');
INSERT INTO `relevance` VALUES ('101', '1', '24', '', 'RoleElement', '0', '2016-01-07 16:14:09', '0');
INSERT INTO `relevance` VALUES ('102', '2', '48', '', 'RoleElement', '0', '2016-01-08 10:27:59', '0');
INSERT INTO `relevance` VALUES ('103', '2', '50', '', 'RoleElement', '0', '2016-01-08 10:27:59', '0');
INSERT INTO `relevance` VALUES ('104', '2', '51', '', 'RoleElement', '0', '2016-01-08 10:27:59', '0');
INSERT INTO `relevance` VALUES ('105', '2', '1', '', 'RoleAccessedOrg', '0', '2016-01-08 10:28:10', '0');
INSERT INTO `relevance` VALUES ('106', '2', '3', '', 'RoleAccessedOrg', '0', '2016-01-08 10:28:10', '0');
INSERT INTO `relevance` VALUES ('107', '2', '4', '', 'RoleAccessedOrg', '0', '2016-01-08 10:28:10', '0');
INSERT INTO `relevance` VALUES ('109', '5', '3', '', 'UserOrg', '0', '2016-01-08 10:30:50', '0');
INSERT INTO `relevance` VALUES ('110', '5', '2', '', 'UserRole', '0', '2016-01-08 10:31:06', '0');
INSERT INTO `relevance` VALUES ('111', '1', '6', '', 'UserModule', '0', '2016-03-17 15:27:08', '0');
INSERT INTO `relevance` VALUES ('112', '1', '7', '', 'UserModule', '0', '2016-03-17 15:27:09', '0');
INSERT INTO `relevance` VALUES ('114', '5', '48', '', 'UserElement', '0', '2016-03-17 15:28:03', '0');
INSERT INTO `relevance` VALUES ('121', '5', '2', '', 'UserModule', '0', '2016-03-17 15:29:22', '0');
INSERT INTO `relevance` VALUES ('122', '5', '10', '', 'UserModule', '0', '2016-03-17 15:29:22', '0');
INSERT INTO `relevance` VALUES ('125', '1', '2', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');
INSERT INTO `relevance` VALUES ('126', '1', '1', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');
INSERT INTO `relevance` VALUES ('127', '1', '4', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');
INSERT INTO `relevance` VALUES ('128', '1', '5', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');
INSERT INTO `relevance` VALUES ('129', '1', '8', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');
INSERT INTO `relevance` VALUES ('130', '1', '9', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');
INSERT INTO `relevance` VALUES ('131', '1', '10', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');
INSERT INTO `relevance` VALUES ('132', '1', '6', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');
INSERT INTO `relevance` VALUES ('133', '1', '7', '', 'RoleModule', '0', '2016-03-17 16:17:09', '0');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `Id` int(11) NOT NULL COMMENT '资源表ID',
  `CascadeId` varchar(255) NOT NULL COMMENT '节点语义ID',
  `Key` varchar(200) NOT NULL,
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `ParentId` int(11) NOT NULL COMMENT '父节点流水号',
  `Status` int(11) NOT NULL COMMENT '当前状态',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `CategoryId` int(11) NOT NULL COMMENT '资源分类',
  `Description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('2', '', 'REPORT_NAME', '报表名称', '0', '0', '0', '7', '报表名称');
INSERT INTO `resource` VALUES ('3', '', 'REPORT_1', '报表1月数据', '0', '0', '0', '7', '报表1月数据');
INSERT INTO `resource` VALUES ('4', '', 'REPORT_2', '报表2月数据', '0', '0', '0', '7', '报表1月数据');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` int(11) NOT NULL COMMENT '流水号',
  `Name` varchar(255) NOT NULL COMMENT '角色名称',
  `Status` int(11) NOT NULL COMMENT '当前状态',
  `Type` int(11) NOT NULL COMMENT '角色类型',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `CreateId` varchar(64) NOT NULL COMMENT '创建人ID',
  `OrgId` int(11) NOT NULL COMMENT '所属部门流水号',
  `OrgCascadeId` varchar(255) NOT NULL COMMENT '所属部门节点语义ID',
  `OrgName` varchar(255) NOT NULL COMMENT '所属部门名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '0', '0', '2015-12-05 22:26:57', '', '1', '0.1', '集团总部');
INSERT INTO `role` VALUES ('2', '测试主管', '0', '1', '2015-12-19 23:00:26', '', '4', '0.1.2.1', '生产1组');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `Id` int(11) NOT NULL COMMENT '数据ID',
  `Name` text NOT NULL COMMENT '产品名称',
  `Number` int(11) NOT NULL COMMENT '产品数量',
  `Price` decimal(10,1) NOT NULL COMMENT '产品单价',
  `Status` int(11) NOT NULL COMMENT '出库/入库',
  `User` varchar(50) NOT NULL,
  `Time` datetime NOT NULL COMMENT '操作时间',
  `OrgId` int(11) NOT NULL COMMENT '组织ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出入库信息表';

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('2', '权限管理软件一套', '1', '10000.0', '0', 'System', '2016-01-08 09:15:24', '2');
INSERT INTO `stock` VALUES ('3', '高级权限管理', '1', '100000.0', '0', 'System', '2016-01-08 09:15:49', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Account` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Sex` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `BizCode` varchar(255) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `CreateId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '管理员', '0', '0', '0', '', '2015-12-19 16:46:25', '0');
INSERT INTO `user` VALUES ('5', 'test', 'test', 'test', '0', '0', '0', '', '2016-01-08 10:30:50', '0');

-- ----------------------------
-- Table structure for usercfg
-- ----------------------------
DROP TABLE IF EXISTS `usercfg`;
CREATE TABLE `usercfg` (
  `Id` int(11) NOT NULL COMMENT '用户ID',
  `Theme` varchar(255) NOT NULL COMMENT '用户界面主题',
  `Skin` varchar(255) NOT NULL COMMENT '用户界面皮肤',
  `NavBarStyle` varchar(255) NOT NULL COMMENT '导航条按钮风格',
  `TabFocusColor` varchar(255) NOT NULL COMMENT 'Tab高亮颜色',
  `NavTabIndex` int(11) NOT NULL COMMENT '导航缺省活动页',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户配置表';

-- ----------------------------
-- Records of usercfg
-- ----------------------------

-- ----------------------------
-- Table structure for userext
-- ----------------------------
DROP TABLE IF EXISTS `userext`;
CREATE TABLE `userext` (
  `Id` int(11) NOT NULL COMMENT '用户ID',
  `Email` varchar(255) NOT NULL COMMENT '电子邮件',
  `Phone_` varchar(255) NOT NULL COMMENT '固定电话',
  `Mobile` varchar(255) NOT NULL COMMENT '移动电话',
  `Address` varchar(255) NOT NULL COMMENT '联系地址',
  `Zip` varchar(255) NOT NULL COMMENT '邮编',
  `Birthday` varchar(255) NOT NULL COMMENT '生日',
  `IdCard` varchar(255) NOT NULL COMMENT '身份证号',
  `QQ` varchar(255) NOT NULL COMMENT 'QQ',
  `DynamicField` text NOT NULL COMMENT '动态扩展字段',
  `ByteArrayId` int(11) NOT NULL COMMENT '用户头像流文件ID',
  `Remark` text NOT NULL COMMENT '备注',
  `Field1` varchar(255) NOT NULL COMMENT '静态扩展字段1',
  `Field2` varchar(255) NOT NULL COMMENT '静态扩展字段2',
  `Field3` varchar(255) NOT NULL COMMENT '静态扩展字段3',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of userext
-- ----------------------------
