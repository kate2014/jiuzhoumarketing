#################################################
#Creae Database
#################################################

drop database if exists `EbizMarketManager`;

create database `EbizMarketManager`
character set 'utf8' 
collate 'utf8_general_ci';

use `EbizMarketManager`;

#################################################
#Creae Table
#################################################

###----------[Part1]Contract_Template----------

###1)Contract_Template_Item_Label_List

drop table if exists `Contract_Template_Item_Label_List`;
create table `Contract_Template_Item_Label_List`
(
	`ctillId` int(11) not null auto_increment,
	`ctillCode` varchar(20) default null,
	`ctillName` nvarchar(20) default null,
	`remarks` text default null,	
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,	
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,
	`delflag` bit not null,
	primary key (`ctillId`),
	key `idx_ctill_ctillCode` (`ctillCode`)
);

###2)Contract_Template_Item_Label

drop table if exists `Contract_Template_Item_Label`;
create table `Contract_Template_Item_Label`
(
	`ctilId` int(11) not null auto_increment,
	`ctilName` nvarchar(20) default null,
	`ctilListCode` varchar(20) not null,
	`delFlag` bit not null,
	primary key (`ctilId`)
);

###3)Contract_Template

drop table if exists `Contract_Template`;
create table `Contract_Template`
(
	`ctId` int(11) not null auto_increment,
	`ctCode` varchar(20) default null,
	`ctName` nvarchar(20) default null,
	`ctItemLabelListCode` varchar(20) default null,
	`storagePath` varchar(500) default null,
	`remarks` text default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,	
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,
	`delFlag` bit not null,
	primary key (`ctId`),
	key `idx_ct_ctCode` (`ctCode`)	
);

###-----------[Part2]Brand-----------

####1)Brand
drop table if exists `Brand`;
create table `Brand`
(
	`brandId` int(11) not null auto_increment,
	`brandCode` varchar(20) default null,
	`goodsCategoryCode` varchar(20) not null,
	`brandName` nvarchar(20) default null,
	`brandSymbol` varchar(20) default null,
	`businessLicense` varchar(100) default null,
	`registeredCapital` double default null,
	`taxRegistrationNo` varchar(100) default null,
	`legalPersonNo` varchar(100) default null,
	`remarks` text default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,	
	`delFlag` bit not null,
	primary key (`brandId`),
	key `idx_brand_brandCode` (`brandCode`)	
);

####2)Brand_Cert

drop table if exists `Brand_Cert`;
create table `Brand_Cert`
(
	`bcId` int(11) not null auto_increment,
	`bcCode` varchar(20) default null,
	`bcTypeCode` varchar(20) not null,
	`brandCode` varchar(20) not null,
	`bcPeriod` int(11) default null,
	`bcBeginDate` date default null,
	`bcEndDate` date default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,	
	`delFlag` bit not null,
	primary key (`bcId`),
	key `idx_bc_bcCode` (`bcCode`)	
);

####3)Brand_Cert_Type

drop table if exists `Brand_Cert_Type`;
create table `Brand_Cert_Type`
(
	`bcTypeId` int(11) not null auto_increment,
	`bcTypeCode` varchar(20) default null,
	`bcTypeName` nvarchar(20) default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,		
	`delFlag` bit not null,
	primary key (`bcTypeId`),
	key `idx_bct_bcTypeCode` (`bcTypeCode`)		
);

###-----------[Part3]Log-----------

####1)Daily_Log
drop table if exists `Daily_Log`;
create table `Daily_Log`
(
	`logId` varchar(20) not null,
	`userCode` varchar(20) not null,
	`serviceCode` varchar(20) not null,
	`serviceMethodName` varchar(100) not null,
	`operateResultTypeCode` varchar(20) not null,
	`exceptionTypeName` varchar(100) default null,
	`registerTime` datetime not null,
	`delFlag` bit not null,
	primary key (`logId`)
);

#######2)Service_Info
drop table if exists `Service_Info`;
create table `Service_Info`
(
	`serviceCode` varchar(20) not null,
	`serviceName` nvarchar(20) not null,
	primary key (`serviceCode`)
);

#######3)Operate_Result_Type
drop table if exists `Operate_Result_Type`;
create table `Operate_Result_Type`
(
	`resultTypeCode` varchar(20) not null,
	`resultTypeName` nvarchar(20) not null,
	primary key (`resultTypeCode`)
);





###-----------[Part5]Goods_Category-----------

####1)Goods_Category
drop table if exists `Goods_Category`;
create table `Goods_Category`
(
	`gcId` int(11) not null auto_increment,
	`gcCode` varchar(20),
	`gcName` nvarchar(20) not null,
	`gcGradeNo` int(11) not null,
	`upGradeGcCode` varchar(20) not null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,	
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,
	`delFlag` bit not null,				
	primary key (`gcId`),
	key `idx_gc_gcCode` (`gcCode`)		
);




###-----------[Part7]Message-----------

####1)Message
drop table if exists `Message`;
create table `Message`
(
	`messageId` varchar(20) not null, 
	`messageSendUserCode` varchar(20) not null,
	`messageReceiveUserCode` varchar(20) default null,
	`messageText` text default null,
	`messageStatusCode` varchar(20) not null,
	`addTime` datetime not null,		
	`lastOperateTime` datetime not null,	
	primary key(`messageId`)
);


####2)MessageStatus
drop table if exists `Message_Status`;
create table `Message_Status`
(
	`statusCode` varchar(20) not null, 
	`statusName` nvarchar(20) not null,
	primary key(`statusCode`)
);




###-----------[Part8]Assistant-----------

####1)Assistant
drop table if exists `Assistant`;
create table `Assistant`
(
	`assistantId` int(11) not null auto_increment,
	`workCard` varchar(20) default null,
	`idCard` varchar(50) not null,
	`name` nvarchar(20) default null,	
	`sex` bit not null default 1,
	`age` int(11) default null,
	`tel` varchar(50) default null,
	`address` nvarchar(100) default null,
	`merchantCode` varchar(20) default null,
	`employDate` date default null,
	`contractPeriod` int(11) default null,
	`remarks` text default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,
	`delFlag` bit not null,
	primary key(`assistantId`),
	key `idx_assistant_workCard` (`workCard`),	
	key `idx_assistant_idCard` (`idCard`)
);

####2)Assistant_Daily_Patrol_Record
drop table if exists `Assistant_Daily_Patrol_Record`;
create table `Assistant_Daily_Patrol_Record`
(
	`adprId` int(11) not null auto_increment,
	`workCard` varchar(20) default null,
	`idCard` varchar(20) not null,
	`remarks` text default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,
	delFlag bit not null,
	primary key(`adprId`)		
);

####3)Assistant_Daily_Patrol_Mark_Detail_Info
drop table if exists `Assistant_Daily_Patrol_Mark_Detail_Info`;
create table `Assistant_Daily_Patrol_Mark_Detail_Info`
(
	`adprId` varchar(20) not null,
	`ruleCode` varchar(20) not null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,
	`delFlag` bit not null,
	primary key(`adprId`,`ruleCode`)	
);









###-----------[Part9]User-----------

###1)Department

drop table if exists `Department`;
create table `Department`
(
	`deptId` int(11) not null auto_increment,
	`deptCode` varchar(20) default null,
	`deptName` nvarchar(20) default null,
	`upGradeDeptCode` varchar(20) default null,
	`remarks` text default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,
	`delFlag` bit not null,
	primary key(`deptId`),
	key `idx_department_deptCode` (`deptCode`)	
);

####2)User

drop table if exists `User`;
create table `User`
(
	`userId` int(11) not null auto_increment,
	`userCode` varchar(20) default null,
	`password` double default '000000',
	`name` varchar(20) default null,
	`sex` bit not null default 1,
	`age` int(11) default null,
	`tel` varchar(50) default null,
	`deptCode` varchar(20) default null,
	`userStatusCode` varchar(20) not null,
	`remarks` text default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,	
	primary key(`userId`),
	key `idx_user_userCode` (`userCode`)			
);

####3)Role

drop table if exists `Role`;
create table `Role`
(
	`roleId` int(11) not null auto_increment,
	`roleCode` varchar(20) default null,
	`roleName` varchar(20) default null,
	`remarks` text default null,
	`addUserCode` varchar(20) not null,
	`addTime` datetime not null,
	`lastModifyUserCode` varchar(20) not null,
	`lastModifyTime` datetime not null,		
	`delFlag` bit not null,
	primary key(`roleId`),
	key `idx_role_roleCode` (`roleCode`)			
);

####4)Right

drop table if exists `Right`;
create table `Right`
(
	`rightCode` varchar(20) not null,
	`rightName` varchar(20) not null,
	primary key(`rightCode`)	
);

####5)User_Status
drop table if exists `User_Status`;
create table `User_Status`
(
	`statusCode` varchar(20) not null,
	`statusName` nvarchar(20) not null,
	primary key(`statusCode`)	
);

####6)User_Role_Relation
drop table if exists `User_Role_Relation`;
create table `User_Role_Relation`
(
	`userCode` varchar(20) not null,
	`roleCode` varchar(20) not null,
	primary key(`userCode`,`roleCode`)	
);

####7)Role_Right_Relation
drop table if exists `Role_Right_Relation`;
create table `Role_Right_Relation`
(
	`roleCode` varchar(20) not null,
	`rightCode` varchar(20) not null,
	primary key(`roleCode`,`rightCode`)	
);



#################################################
#Add Constraint
#################################################

###----------[Part1]Contract_Template----------

alter table `Contract_Template`
add constraint `fk_ct_ctItemLabelListCode_ctill_ctillCode` foreign key (`ctItemLabelListCode`) references `Contract_Template_Item_Label_List` (`ctillCode`);

###-----------[Part2]Brand-----------

####2)Brand_Cert

alter table `Brand_Cert`
add constraint `fk_bc_bcTypeCode_bct_bcTypeCode` foreign key (`bcTypeCode`) references `Brand_Cert_Type` (`bcTypeCode`);

alter table `Brand_Cert`
add constraint `fk_bc_brandCode_brand_brandCode` foreign key (`brandCode`) references `Brand` (`brandCode`);

###-----------[Part3]Log-----------

alter table `Daily_Log`
add constraint `fk_dl_serviceCode_si_serviceCode` foreign key (`serviceCode`) references `Service_Info` (`serviceCode`);

alter table `Daily_Log`
add constraint `fk_dl_operateResultTypeCode_ost_resultTypeCode` foreign key (`operateResultTypeCode`) references `Operate_Result_Type` (`resultTypeCode`);



###-----------[Part5]Goods_Category-----------

alter table `Goods_Category`
add constraint `fk_gc_upGradeGcCode_gc_gcCode` foreign key (`upGradeGcCode`) references `Goods_Category` (`gcCode`);



###-----------[Part7]Message-----------


alter table `Message`
add constraint `fk_messag_messageStatusCode_ms_statusCode` foreign key (`messageStatusCode`) references `Message_Status` (`statusCode`);



###-----------[Part8]Assistant-----------
alter table `Assistant`
add constraint `fk_assistant_addUserCode_user_userCode` foreign key (`addUserCode`) references `User` (`userCode`);

alter table `Assistant`
add constraint `fk_assistant_lastModifyUserCode_user_userCode` foreign key (`lastModifyUserCode`) references `User` (`userCode`);

alter table `Assistant_Daily_Patrol_Record`
add constraint `fk_adpr_workCard_assistant_workCard` foreign key (`workCard`) references `Assistant` (`workCard`);

alter table `Assistant_Daily_Patrol_Record`
add constraint `fk_adpr_idCard_assistant_idCard` foreign key (`idCard`) references `Assistant` (`idCard`);

alter table `Assistant_Daily_Patrol_Record`
add constraint `fk_adpr_addUserCode_user_userCode` foreign key (`addUserCode`) references `User` (`userCode`);

alter table `Assistant_Daily_Patrol_Record`
add constraint `fk_adpr_lastModifyUserCode_user_userCode` foreign key (`lastModifyUserCode`) references `User` (`userCode`);

alter table `Assistant_Daily_Patrol_Mark_Detail_Info`
add constraint `fk_adpmdi_addUserCode_user_userCode` foreign key (`addUserCode`) references `User` (`userCode`);

alter table `Assistant_Daily_Patrol_Mark_Detail_Info`
add constraint `fk_adpmdi_lastModifyUserCode_user_userCode` foreign key (`lastModifyUserCode`) references `User` (`userCode`);

###-----------[Part9]User-----------
alter table `Department`
add constraint `fk_department_upGradeDeptCode_department_deptCode` foreign key (`upGradeDeptCode`) references `Department` (`deptCode`);

alter table `User`
add constraint `fk_user_deptCode_dept_deptCode` foreign key (`deptCode`) references `Department` (`deptCode`);

alter table `User`
add constraint `fk_user_userStatusCode_us_statusCode` foreign key (`userStatusCode`) references `User_Status` (`statusCode`);

alter table `User`
add constraint `fk_user_addUserCode_user_userCode` foreign key (`addUserCode`) references `User` (`userCode`);

alter table `User`
add constraint `fk_user_lastModifyUserCode_user_userCode` foreign key (`lastModifyUserCode`) references `User` (`userCode`);

alter table `Role`
add constraint `fk_role_addUserCode_user_userCode` foreign key (`addUserCode`) references `User` (`userCode`);

alter table `Role`
add constraint `fk_role_lastModifyUserCode_user_userCode` foreign key (`lastModifyUserCode`) references `User` (`userCode`);