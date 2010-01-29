/*
MySQL Data Transfer
Source Host: localhost
Source Database: ebizmarketmanager
Target Host: localhost
Target Database: ebizmarketmanager
Date: 2010/1/29 15:19:14
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for after_sale_problem_type
-- ----------------------------
DROP TABLE IF EXISTS `after_sale_problem_type`;
CREATE TABLE `after_sale_problem_type` (
  `asProblemTypeCode` varchar(20) NOT NULL,
  `asProblemTypeName` varchar(20) NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`asProblemTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for after_sale_record
-- ----------------------------
DROP TABLE IF EXISTS `after_sale_record`;
CREATE TABLE `after_sale_record` (
  `asrId` varchar(20) NOT NULL,
  `asrTypeCode` varchar(20) NOT NULL,
  `oldAsrId` varchar(20) default NULL,
  `customerName` varchar(20) NOT NULL,
  `customerSex` bit(1) default '',
  `customerTel` varchar(20) default NULL,
  `asrProblemTypeCode` varchar(20) default NULL,
  `saleVoucherCode` varchar(50) default NULL,
  `merchantCode` varchar(20) default NULL,
  `brandCode` varchar(20) default NULL,
  `goodsCategoryCode` varchar(20) default NULL,
  `assistantWorkCard` varchar(20) default NULL,
  `registerUserCode` varchar(20) NOT NULL,
  `registerTime` datetime NOT NULL,
  `disposeIdea` text,
  `disposeUserCode` varchar(20) default NULL,
  `endTime` datetime default NULL,
  `resultDescription` text,
  `asrStatusCode` varchar(20) NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`asrId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for after_sale_record_mark_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `after_sale_record_mark_detail_info`;
CREATE TABLE `after_sale_record_mark_detail_info` (
  `asrId` varchar(20) NOT NULL,
  `ruleCode` varchar(20) NOT NULL,
  `score` double NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`asrId`,`ruleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for after_sale_record_status
-- ----------------------------
DROP TABLE IF EXISTS `after_sale_record_status`;
CREATE TABLE `after_sale_record_status` (
  `asrStatusCode` varchar(20) NOT NULL,
  `asrStatusName` varchar(20) NOT NULL,
  PRIMARY KEY  (`asrStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for after_sale_record_type
-- ----------------------------
DROP TABLE IF EXISTS `after_sale_record_type`;
CREATE TABLE `after_sale_record_type` (
  `asrTypeCode` varchar(20) NOT NULL,
  `asrTypeName` varchar(20) NOT NULL,
  PRIMARY KEY  (`asrTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assistant
-- ----------------------------
DROP TABLE IF EXISTS `assistant`;
CREATE TABLE `assistant` (
  `assistantId` int(11) NOT NULL auto_increment,
  `workCard` varchar(20) NOT NULL,
  `idCard` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` bit(1) NOT NULL default '',
  `age` int(11) default NULL,
  `tel` varchar(50) default NULL,
  `address` varchar(100) default NULL,
  `education` varchar(10) default NULL,
  `merchantCode` varchar(20) NOT NULL,
  `dutyCode` varchar(20) NOT NULL,
  `employDate` date NOT NULL,
  `contractPeriod` int(11) default NULL,
  `remarks` text,
  `statusCode` varchar(20) NOT NULL,
  PRIMARY KEY  (`assistantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assistant_daily_patrol_mark_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `assistant_daily_patrol_mark_detail_info`;
CREATE TABLE `assistant_daily_patrol_mark_detail_info` (
  `dailyPatrolRecordNo` varchar(20) NOT NULL,
  `ruleCode` varchar(20) NOT NULL,
  `score` double NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`dailyPatrolRecordNo`,`ruleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assistant_daily_patrol_record_info
-- ----------------------------
DROP TABLE IF EXISTS `assistant_daily_patrol_record_info`;
CREATE TABLE `assistant_daily_patrol_record_info` (
  `dailyPatrolRecordNo` varchar(20) NOT NULL,
  `workCard` varchar(20) NOT NULL,
  `merchantCode` varchar(20) NOT NULL,
  `eventDescription` text,
  `registerUserCode` varchar(20) NOT NULL,
  `registerTime` datetime NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`dailyPatrolRecordNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assistant_duty
-- ----------------------------
DROP TABLE IF EXISTS `assistant_duty`;
CREATE TABLE `assistant_duty` (
  `assistantDutyCode` varchar(20) NOT NULL,
  `assistantDutyName` varchar(20) NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`assistantDutyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assistant_status
-- ----------------------------
DROP TABLE IF EXISTS `assistant_status`;
CREATE TABLE `assistant_status` (
  `assistantStatusCode` varchar(20) NOT NULL,
  `assistantStatusName` varchar(20) NOT NULL,
  PRIMARY KEY  (`assistantStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for booth_real_fee_info
-- ----------------------------
DROP TABLE IF EXISTS `booth_real_fee_info`;
CREATE TABLE `booth_real_fee_info` (
  `boothCode` varchar(20) NOT NULL,
  `bsfItemCode` varchar(20) NOT NULL,
  `brf` double default NULL,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`boothCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for booth_resource_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `booth_resource_basic_info`;
CREATE TABLE `booth_resource_basic_info` (
  `boothId` int(11) NOT NULL auto_increment,
  `boothCode` varchar(20) NOT NULL,
  `boothName` varchar(20) default NULL,
  `boothArea` double default NULL,
  `merchantCode` varchar(20) NOT NULL,
  `boothStatusCode` varchar(20) NOT NULL,
  `remarks` text,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`boothId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for booth_standard_fee_item
-- ----------------------------
DROP TABLE IF EXISTS `booth_standard_fee_item`;
CREATE TABLE `booth_standard_fee_item` (
  `bsfItemId` int(11) NOT NULL auto_increment,
  `bsfItemCode` varchar(20) default NULL,
  `bsfItemName` varchar(20) NOT NULL,
  `bsf` double default NULL,
  `rgfpTypeCode` varchar(20) NOT NULL,
  `layoutCode` varchar(20) NOT NULL,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`bsfItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brandId` int(11) NOT NULL auto_increment,
  `brandCode` varchar(20) NOT NULL,
  `brandName` varchar(20) NOT NULL,
  `goodsCategoryCode` varchar(20) NOT NULL,
  `businessLicense` varchar(100) NOT NULL,
  `registeredCapital` double NOT NULL,
  `taxRegistrationCode` varchar(100) NOT NULL,
  `legalPersonCode` varchar(100) NOT NULL,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `remarks` text,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`brandId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for brand_cert
-- ----------------------------
DROP TABLE IF EXISTS `brand_cert`;
CREATE TABLE `brand_cert` (
  `bcId` int(11) NOT NULL auto_increment,
  `bcCode` varchar(20) NOT NULL,
  `bcTypeCode` varchar(20) NOT NULL,
  `bcPeriod` int(11) default NULL,
  `bcBeginDate` date default NULL,
  `bcEndDate` date default NULL,
  `brandCode` varchar(20) NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`bcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for brand_cert_type
-- ----------------------------
DROP TABLE IF EXISTS `brand_cert_type`;
CREATE TABLE `brand_cert_type` (
  `bcTypeId` int(11) NOT NULL auto_increment,
  `bcTypeCode` varchar(20) NOT NULL,
  `bcTypeName` varchar(20) NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`bcTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for contract_template_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `contract_template_basic_info`;
CREATE TABLE `contract_template_basic_info` (
  `ctId` int(11) NOT NULL auto_increment,
  `ctCode` varchar(20) NOT NULL,
  `ctName` varchar(20) NOT NULL,
  `ctItemLabelListCode` varchar(20) default NULL,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `storagePath` varchar(500) default NULL,
  `remarks` text,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`ctId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for contract_template_item_label
-- ----------------------------
DROP TABLE IF EXISTS `contract_template_item_label`;
CREATE TABLE `contract_template_item_label` (
  `ctilId` int(11) NOT NULL auto_increment,
  `ctilName` varchar(20) NOT NULL,
  `ctilListCode` varchar(20) NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`ctilId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for contract_template_item_label_list
-- ----------------------------
DROP TABLE IF EXISTS `contract_template_item_label_list`;
CREATE TABLE `contract_template_item_label_list` (
  `ctillId` int(11) NOT NULL auto_increment,
  `ctillCode` varchar(20) NOT NULL,
  `ctillName` varchar(20) NOT NULL,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `remarks` text,
  `delflag` bit(1) NOT NULL,
  PRIMARY KEY  (`ctillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for daily_log
-- ----------------------------
DROP TABLE IF EXISTS `daily_log`;
CREATE TABLE `daily_log` (
  `logId` varchar(20) NOT NULL,
  `regeisterTime` datetime NOT NULL,
  `userCode` varchar(20) NOT NULL,
  `operateServiceCode` varchar(20) NOT NULL,
  `operateResultTypeCode` varchar(20) NOT NULL,
  `exceptionTypeName` varchar(50) default NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `deptId` int(11) NOT NULL auto_increment,
  `deptCode` varchar(20) NOT NULL,
  `deptName` varchar(20) NOT NULL,
  `upGradeDeptCode` varchar(20) NOT NULL,
  `remarks` text,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `gcId` int(11) NOT NULL auto_increment,
  `gcCode` varchar(20) default NULL,
  `gcName` varchar(20) NOT NULL,
  `gcGradeNo` int(11) NOT NULL,
  `upGradeGcCode` varchar(20) NOT NULL,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`gcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for layout
-- ----------------------------
DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout` (
  `layoutId` int(11) NOT NULL auto_increment,
  `layoutCode` varchar(20) NOT NULL,
  `layoutArea` double default NULL,
  `standardBoothArea` double default NULL,
  `lfTypeCode` varchar(20) default NULL,
  `remarks` text,
  `lastModifyUserCode` datetime NOT NULL,
  `lastModifyTime` bit(1) NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`layoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for layout_function
-- ----------------------------
DROP TABLE IF EXISTS `layout_function`;
CREATE TABLE `layout_function` (
  `lfTypeId` int(11) NOT NULL auto_increment,
  `lfTypeCode` varchar(20) NOT NULL,
  `lfTypeName` varchar(20) NOT NULL,
  `remarks` text,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`lfTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for merchant_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `merchant_basic_info`;
CREATE TABLE `merchant_basic_info` (
  `merchantId` int(11) NOT NULL auto_increment,
  `merchantCode` varchar(20) NOT NULL,
  `merchantName` varchar(20) NOT NULL,
  `merchantStatusCode` varchar(20) NOT NULL,
  PRIMARY KEY  (`merchantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for merchant_status
-- ----------------------------
DROP TABLE IF EXISTS `merchant_status`;
CREATE TABLE `merchant_status` (
  `merchantStatusCode` varchar(20) NOT NULL,
  `merchantStatusName` varchar(20) NOT NULL,
  PRIMARY KEY  (`merchantStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` varchar(20) NOT NULL,
  `messageSendUserCode` varchar(20) NOT NULL,
  `messageReceiveUserCode` varchar(20) NOT NULL,
  `lastOperateTime` datetime NOT NULL,
  `messageText` text,
  `messageStatusCode` varchar(20) NOT NULL,
  PRIMARY KEY  (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for messagestatus
-- ----------------------------
DROP TABLE IF EXISTS `messagestatus`;
CREATE TABLE `messagestatus` (
  `messageStatusCode` varchar(20) NOT NULL,
  `messageStatusName` varchar(20) NOT NULL,
  PRIMARY KEY  (`messageStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for operate_result_type
-- ----------------------------
DROP TABLE IF EXISTS `operate_result_type`;
CREATE TABLE `operate_result_type` (
  `operateResultTypeCode` varchar(20) NOT NULL,
  `operateResultTypeName` varchar(20) NOT NULL,
  PRIMARY KEY  (`operateResultTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for operate_service
-- ----------------------------
DROP TABLE IF EXISTS `operate_service`;
CREATE TABLE `operate_service` (
  `operateServiceCode` varchar(20) NOT NULL,
  `operateServiceName` varchar(20) NOT NULL,
  PRIMARY KEY  (`operateServiceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resourceId` int(11) NOT NULL auto_increment,
  `resourceCode` varchar(20) default NULL,
  `resourceName` varchar(20) NOT NULL,
  `resourceTypeCode` varchar(20) NOT NULL,
  `resourceAddress` varchar(100) NOT NULL,
  `resourceStandardFee` double default NULL,
  `resourceRealFee` double default NULL,
  `merchantCode` varchar(20) default NULL,
  `resourceStatusCode` varchar(20) NOT NULL,
  `remarks` text,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resource_get_fee_period_type
-- ----------------------------
DROP TABLE IF EXISTS `resource_get_fee_period_type`;
CREATE TABLE `resource_get_fee_period_type` (
  `rgfpTypeCode` varchar(20) NOT NULL,
  `rgfpTypeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resource_status
-- ----------------------------
DROP TABLE IF EXISTS `resource_status`;
CREATE TABLE `resource_status` (
  `resourceStatusCode` varchar(20) NOT NULL,
  `resourceStatusName` varchar(20) NOT NULL,
  PRIMARY KEY  (`resourceStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resource_type
-- ----------------------------
DROP TABLE IF EXISTS `resource_type`;
CREATE TABLE `resource_type` (
  `resourceTypeId` int(11) NOT NULL auto_increment,
  `resourceTypeCode` varchar(20) default NULL,
  `resourceTypeName` varchar(20) NOT NULL,
  `lastModifyUserCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime NOT NULL,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`resourceTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for right
-- ----------------------------
DROP TABLE IF EXISTS `right`;
CREATE TABLE `right` (
  `rightId` int(11) NOT NULL auto_increment,
  `rightCode` varchar(20) NOT NULL,
  `rightName` varchar(20) NOT NULL,
  `remarks` text,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`rightId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL auto_increment,
  `roleCode` varchar(20) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  `remarks` text,
  `delFlag` bit(1) NOT NULL,
  PRIMARY KEY  (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_right_relation
-- ----------------------------
DROP TABLE IF EXISTS `role_right_relation`;
CREATE TABLE `role_right_relation` (
  `roleCode` varchar(20) NOT NULL,
  `rightCode` varchar(20) NOT NULL,
  PRIMARY KEY  (`roleCode`,`rightCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL auto_increment,
  `userCode` varchar(20) NOT NULL,
  `password` double NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` bit(1) NOT NULL,
  `age` int(11) default NULL,
  `tel` varchar(50) default NULL,
  `deptCode` varchar(20) NOT NULL,
  `userStatusCode` varchar(20) NOT NULL,
  `remarks` text,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_role_relation`;
CREATE TABLE `user_role_relation` (
  `userCode` varchar(20) NOT NULL,
  `roleCode` varchar(20) NOT NULL,
  PRIMARY KEY  (`userCode`,`roleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_status
-- ----------------------------
DROP TABLE IF EXISTS `user_status`;
CREATE TABLE `user_status` (
  `userStatusCode` varchar(20) NOT NULL,
  `userStatusName` varchar(20) NOT NULL,
  PRIMARY KEY  (`userStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
