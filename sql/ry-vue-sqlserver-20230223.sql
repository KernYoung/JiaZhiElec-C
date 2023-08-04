/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : SQL Server
 Source Server Version : 15002000
 Source Host           : localhost:1433
 Source Catalog        : ry-vue
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002000
 File Encoding         : 65001

 Date: 30/08/2022 10:12:09
*/


-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[gen_table]') AND type IN ('U'))
	DROP TABLE [dbo].[gen_table]
GO

CREATE TABLE [dbo].[gen_table] (
  [table_id] bigint  IDENTITY(1,1) NOT NULL,
  [table_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [table_comment] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [sub_table_name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [sub_table_fk_name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [class_name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [tpl_category] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [package_name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [module_name] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [business_name] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [function_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [function_author] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [gen_type] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [gen_path] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [options] nvarchar(1000) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[gen_table] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'编号',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'table_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'表名称',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'table_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'表描述',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'table_comment'
GO

EXEC sp_addextendedproperty
'MS_Description', N'关联子表的表名',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'sub_table_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'子表关联的外键名',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'sub_table_fk_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'实体类名称',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'class_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'使用的模板（crud单表操作 tree树表操作）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'tpl_category'
GO

EXEC sp_addextendedproperty
'MS_Description', N'生成包路径',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'package_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'生成模块名',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'module_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'生成业务名',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'business_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'生成功能名',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'function_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'生成功能作者',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'function_author'
GO

EXEC sp_addextendedproperty
'MS_Description', N'生成代码方式（0zip压缩包 1自定义路径）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'gen_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'生成路径（不填默认项目路径）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'gen_path'
GO

EXEC sp_addextendedproperty
'MS_Description', N'其它生成选项',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'options'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'gen_table',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'代码生成业务表',
'SCHEMA', N'dbo',
'TABLE', N'gen_table'
GO


-- ----------------------------
-- Records of gen_table
-- ----------------------------
SET IDENTITY_INSERT [dbo].[gen_table] ON
GO

SET IDENTITY_INSERT [dbo].[gen_table] OFF
GO


-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[gen_table_column]') AND type IN ('U'))
	DROP TABLE [dbo].[gen_table_column]
GO

CREATE TABLE [dbo].[gen_table_column] (
  [column_id] bigint  IDENTITY(1,1) NOT NULL,
  [table_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [column_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [column_comment] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [column_type] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [java_type] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [java_field] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_pk] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_increment] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_required] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_insert] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_edit] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_list] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_query] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [query_type] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [html_type] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [dict_type] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [sort] int  NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL
)
GO

ALTER TABLE [dbo].[gen_table_column] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'编号',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'column_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'归属表编号',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'table_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'列名称',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'column_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'列描述',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'column_comment'
GO

EXEC sp_addextendedproperty
'MS_Description', N'列类型',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'column_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'JAVA类型',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'java_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'JAVA字段名',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'java_field'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否主键（1是）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'is_pk'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否自增（1是）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'is_increment'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否必填（1是）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'is_required'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否为插入字段（1是）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'is_insert'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否编辑字段（1是）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'is_edit'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否列表字段（1是）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'is_list'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否查询字段（1是）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'is_query'
GO

EXEC sp_addextendedproperty
'MS_Description', N'查询方式（等于、不等于、大于、小于、范围）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'query_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'html_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典类型',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'dict_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'代码生成业务表字段',
'SCHEMA', N'dbo',
'TABLE', N'gen_table_column'
GO


-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
SET IDENTITY_INSERT [dbo].[gen_table_column] ON
GO

SET IDENTITY_INSERT [dbo].[gen_table_column] OFF
GO


-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_config]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_config]
GO

CREATE TABLE [dbo].[sys_config] (
  [config_id] int  IDENTITY(1,1) NOT NULL,
  [config_name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [config_key] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [config_value] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [config_type] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 'N' NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_config] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'参数主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'config_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'参数名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'config_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'参数键名',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'config_key'
GO

EXEC sp_addextendedproperty
'MS_Description', N'参数键值',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'config_value'
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统内置（Y是 N否）',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'config_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'参数配置表',
'SCHEMA', N'dbo',
'TABLE', N'sys_config'
GO


-- ----------------------------
-- Records of sys_config
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_config] ON
GO

INSERT INTO [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'主框架页-默认皮肤样式名称', N'sys.index.skinName', N'skin-blue', N'Y', N'admin', getdate(), N'', NULL, N'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow')
GO

INSERT INTO [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'用户管理-账号初始密码', N'sys.user.initPassword', N'Aa123.', N'Y', N'admin', getdate(), N'', NULL, N'初始化密码 123456')
GO

INSERT INTO [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'3', N'主框架页-侧边栏主题', N'sys.index.sideTheme', N'theme-dark', N'Y', N'admin', getdate(), N'', NULL, N'深色主题theme-dark，浅色主题theme-light')
GO

INSERT INTO [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'4', N'账号自助-验证码开关', N'sys.account.captchaEnabled', N'true', N'Y', N'admin', getdate(), N'', NULL, N'是否开启验证码功能（true开启，false关闭）')
GO

INSERT INTO [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'5', N'账号自助-是否开启用户注册功能', N'sys.account.registerUser', N'false', N'Y', N'admin', getdate(), N'', NULL, N'是否开启注册用户功能（true开启，false关闭）')
GO

INSERT INTO [dbo].[sys_config] ([config_id], [config_name], [config_key], [config_value], [config_type], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'6', N'用户登录-黑名单列表', N'sys.login.blackIPList', N'', N'Y', N'admin', getdate(), N'', NULL, N'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）')
GO

SET IDENTITY_INSERT [dbo].[sys_config] OFF
GO


-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_dept]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_dept]
GO

CREATE TABLE [dbo].[sys_dept] (
  [dept_id] bigint  IDENTITY(1,1) NOT NULL,
  [parent_id] bigint  NULL,
  [ancestors] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [dept_name] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [order_num] int  NULL,
  [leader] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [phone] nvarchar(11) COLLATE Chinese_PRC_CI_AS  NULL,
  [email] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL
)
GO

ALTER TABLE [dbo].[sys_dept] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门id',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'dept_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父部门id',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'parent_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'祖级列表',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'ancestors'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'dept_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'显示顺序',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'order_num'
GO

EXEC sp_addextendedproperty
'MS_Description', N'负责人',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'leader'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系电话',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'邮箱',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'email'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门状态（0正常 1停用）',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标志（0代表存在 2代表删除）',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门表',
'SCHEMA', N'dbo',
'TABLE', N'sys_dept'
GO


-- ----------------------------
-- Records of sys_dept
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_dept] ON
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'100', N'0', N'0', N'若依科技', N'0', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'101', N'100', N'0,100', N'深圳总公司', N'1', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'102', N'100', N'0,100', N'长沙分公司', N'2', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'103', N'101', N'0,100,101', N'研发部门', N'1', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'104', N'101', N'0,100,101', N'市场部门', N'2', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'105', N'101', N'0,100,101', N'测试部门', N'3', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'106', N'101', N'0,100,101', N'财务部门', N'4', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'107', N'101', N'0,100,101', N'运维部门', N'5', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'108', N'102', N'0,100,102', N'市场部门', N'1', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

INSERT INTO [dbo].[sys_dept] ([dept_id], [parent_id], [ancestors], [dept_name], [order_num], [leader], [phone], [email], [status], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'109', N'102', N'0,100,102', N'财务部门', N'2', N'若依', N'15888888888', N'ry@qq.com', N'0', N'0', N'admin', getdate(), N'', NULL)
GO

SET IDENTITY_INSERT [dbo].[sys_dept] OFF
GO


-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_dict_data]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_dict_data]
GO

CREATE TABLE [dbo].[sys_dict_data] (
  [dict_code] bigint  IDENTITY(1,1) NOT NULL,
  [dict_sort] int  NULL,
  [dict_label] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [dict_value] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [dict_type] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [css_class] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [list_class] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_default] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 'N' NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_dict_data] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典编码',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'dict_code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典排序',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'dict_sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典标签',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'dict_label'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典键值',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'dict_value'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典类型',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'dict_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'样式属性（其他样式扩展）',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'css_class'
GO

EXEC sp_addextendedproperty
'MS_Description', N'表格回显样式',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'list_class'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否默认（Y是 N否）',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'is_default'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态（0正常 1停用）',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典数据表',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_data'
GO


-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_dict_data] ON
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'1', N'男', N'0', N'sys_user_sex', N'', N'', N'Y', N'0', N'admin', getdate(), N'', NULL, N'性别男')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'2', N'女', N'1', N'sys_user_sex', N'', N'', N'N', N'0', N'admin', getdate(), N'', NULL, N'性别女')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'3', N'3', N'未知', N'2', N'sys_user_sex', N'', N'', N'N', N'0', N'admin', getdate(), N'', NULL, N'性别未知')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'4', N'1', N'显示', N'0', N'sys_show_hide', N'', N'primary', N'Y', N'0', N'admin', getdate(), N'', NULL, N'显示菜单')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'5', N'2', N'隐藏', N'1', N'sys_show_hide', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'隐藏菜单')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'6', N'1', N'正常', N'0', N'sys_normal_disable', N'', N'primary', N'Y', N'0', N'admin', getdate(), N'', NULL, N'正常状态')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'7', N'2', N'停用', N'1', N'sys_normal_disable', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'停用状态')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'8', N'1', N'正常', N'0', N'sys_job_status', N'', N'primary', N'Y', N'0', N'admin', getdate(), N'', NULL, N'正常状态')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'9', N'2', N'暂停', N'1', N'sys_job_status', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'停用状态')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'10', N'1', N'默认', N'DEFAULT', N'sys_job_group', N'', N'', N'Y', N'0', N'admin', getdate(), N'', NULL, N'默认分组')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'11', N'2', N'系统', N'SYSTEM', N'sys_job_group', N'', N'', N'N', N'0', N'admin', getdate(), N'', NULL, N'系统分组')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'12', N'1', N'是', N'Y', N'sys_yes_no', N'', N'primary', N'Y', N'0', N'admin', getdate(), N'', NULL, N'系统默认是')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'13', N'2', N'否', N'N', N'sys_yes_no', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'系统默认否')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'14', N'1', N'通知', N'1', N'sys_notice_type', N'', N'warning', N'Y', N'0', N'admin', getdate(), N'', NULL, N'通知')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'15', N'2', N'公告', N'2', N'sys_notice_type', N'', N'success', N'N', N'0', N'admin', getdate(), N'', NULL, N'公告')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'16', N'1', N'正常', N'0', N'sys_notice_status', N'', N'primary', N'Y', N'0', N'admin', getdate(), N'', NULL, N'正常状态')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'17', N'2', N'关闭', N'1', N'sys_notice_status', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'关闭状态')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'18', N'99', N'其他', N'0', N'sys_oper_type', N'', N'info', N'N', N'0', N'admin', getdate(), N'', NULL, N'其他操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'19', N'1', N'新增', N'1', N'sys_oper_type', N'', N'info', N'N', N'0', N'admin', getdate(), N'', NULL, N'新增操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'20', N'2', N'修改', N'2', N'sys_oper_type', N'', N'info', N'N', N'0', N'admin', getdate(), N'', NULL, N'修改操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'21', N'3', N'删除', N'3', N'sys_oper_type', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'删除操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'22', N'4', N'授权', N'4', N'sys_oper_type', N'', N'primary', N'N', N'0', N'admin', getdate(), N'', NULL, N'授权操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'23', N'5', N'导出', N'5', N'sys_oper_type', N'', N'warning', N'N', N'0', N'admin', getdate(), N'', NULL, N'导出操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'24', N'6', N'导入', N'6', N'sys_oper_type', N'', N'warning', N'N', N'0', N'admin', getdate(), N'', NULL, N'导入操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'25', N'7', N'强退', N'7', N'sys_oper_type', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'强退操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'26', N'8', N'生成代码', N'8', N'sys_oper_type', N'', N'warning', N'N', N'0', N'admin', getdate(), N'', NULL, N'生成操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'27', N'9', N'清空数据', N'9', N'sys_oper_type', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'清空操作')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'28', N'1', N'成功', N'0', N'sys_common_status', N'', N'primary', N'N', N'0', N'admin', getdate(), N'', NULL, N'正常状态')
GO

INSERT INTO [dbo].[sys_dict_data] ([dict_code], [dict_sort], [dict_label], [dict_value], [dict_type], [css_class], [list_class], [is_default], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'29', N'2', N'失败', N'1', N'sys_common_status', N'', N'danger', N'N', N'0', N'admin', getdate(), N'', NULL, N'停用状态')
GO

SET IDENTITY_INSERT [dbo].[sys_dict_data] OFF
GO


-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_dict_type]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_dict_type]
GO

CREATE TABLE [dbo].[sys_dict_type] (
  [dict_id] bigint  IDENTITY(1,1) NOT NULL,
  [dict_name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [dict_type] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_dict_type] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'dict_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'dict_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典类型',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'dict_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态（0正常 1停用）',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典类型表',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_type'
GO


-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_dict_type] ON
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'用户性别', N'sys_user_sex', N'0', N'admin', getdate(), N'', NULL, N'用户性别列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'菜单状态', N'sys_show_hide', N'0', N'admin', getdate(), N'', NULL, N'菜单状态列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'3', N'系统开关', N'sys_normal_disable', N'0', N'admin', getdate(), N'', NULL, N'系统开关列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'4', N'任务状态', N'sys_job_status', N'0', N'admin', getdate(), N'', NULL, N'任务状态列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'5', N'任务分组', N'sys_job_group', N'0', N'admin', getdate(), N'', NULL, N'任务分组列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'6', N'系统是否', N'sys_yes_no', N'0', N'admin', getdate(), N'', NULL, N'系统是否列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'7', N'通知类型', N'sys_notice_type', N'0', N'admin', getdate(), N'', NULL, N'通知类型列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'8', N'通知状态', N'sys_notice_status', N'0', N'admin', getdate(), N'', NULL, N'通知状态列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'9', N'操作类型', N'sys_oper_type', N'0', N'admin', getdate(), N'', NULL, N'操作类型列表')
GO

INSERT INTO [dbo].[sys_dict_type] ([dict_id], [dict_name], [dict_type], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'10', N'系统状态', N'sys_common_status', N'0', N'admin', getdate(), N'', NULL, N'登录状态列表')
GO

SET IDENTITY_INSERT [dbo].[sys_dict_type] OFF
GO


-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_job]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_job]
GO

CREATE TABLE [dbo].[sys_job] (
  [job_id] bigint  IDENTITY(1,1) NOT NULL,
  [job_name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_group] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [invoke_target] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [cron_expression] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [misfire_policy] nvarchar(20) COLLATE Chinese_PRC_CI_AS DEFAULT 3 NULL,
  [concurrent] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 1 NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [create_time] datetime2(7) DEFAULT NULL NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [update_time] datetime2(7) DEFAULT NULL NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[sys_job] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'job_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'job_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务组名',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'job_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'调用目标字符串',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'invoke_target'
GO

EXEC sp_addextendedproperty
'MS_Description', N'cron执行表达式',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'cron_expression'
GO

EXEC sp_addextendedproperty
'MS_Description', N'计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'misfire_policy'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否并发执行（0允许 1禁止）',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'concurrent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态（0正常 1暂停）',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注信息',
'SCHEMA', N'dbo',
'TABLE', N'sys_job',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'定时任务调度表',
'SCHEMA', N'dbo',
'TABLE', N'sys_job'
GO


-- ----------------------------
-- Records of sys_job
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_job] ON
GO

INSERT INTO [dbo].[sys_job] ([job_id], [job_name], [job_group], [invoke_target], [cron_expression], [misfire_policy], [concurrent], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'系统默认（无参）', N'DEFAULT', N'ryTask.ryNoParams', N'0/10 * * * * ?', N'3', N'1', N'1', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_job] ([job_id], [job_name], [job_group], [invoke_target], [cron_expression], [misfire_policy], [concurrent], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'系统默认（有参）', N'DEFAULT', N'ryTask.ryParams(''ry'')', N'0/15 * * * * ?', N'3', N'1', N'1', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_job] ([job_id], [job_name], [job_group], [invoke_target], [cron_expression], [misfire_policy], [concurrent], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'3', N'系统默认（多参）', N'DEFAULT', N'ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)', N'0/20 * * * * ?', N'3', N'1', N'1', N'admin', getdate(), N'', NULL, N'')
GO

SET IDENTITY_INSERT [dbo].[sys_job] OFF
GO


-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_job_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_job_log]
GO

CREATE TABLE [dbo].[sys_job_log] (
  [job_log_id] bigint  IDENTITY(1,1) NOT NULL,
  [job_name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_group] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [invoke_target] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_message] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [exception_info] nvarchar(2000) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [create_time] datetime2(7) DEFAULT NULL NULL
)
GO

ALTER TABLE [dbo].[sys_job_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务日志ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log',
'COLUMN', N'job_log_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log',
'COLUMN', N'job_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务组名',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log',
'COLUMN', N'job_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'调用目标字符串',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log',
'COLUMN', N'invoke_target'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日志信息',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log',
'COLUMN', N'job_message'
GO

EXEC sp_addextendedproperty
'MS_Description', N'执行状态（0正常 1失败）',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'异常信息',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log',
'COLUMN', N'exception_info'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'定时任务调度日志表',
'SCHEMA', N'dbo',
'TABLE', N'sys_job_log'
GO


-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_job_log] ON
GO

INSERT INTO [dbo].[sys_job_log] ([job_log_id], [job_name], [job_group], [invoke_target], [job_message], [status], [exception_info], [create_time]) VALUES (N'1', N'系统默认（无参）', N'DEFAULT', N'ryTask.ryNoParams', N'系统默认（无参） 总共耗时：2毫秒', N'0', N'', N'2022-08-24 09:44:14.0870000')
GO

SET IDENTITY_INSERT [dbo].[sys_job_log] OFF
GO


-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_logininfor]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_logininfor]
GO

CREATE TABLE [dbo].[sys_logininfor] (
  [info_id] bigint  IDENTITY(1,1) NOT NULL,
  [user_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [ipaddr] nvarchar(128) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [login_location] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [browser] nvarchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [os] nvarchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [msg] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [login_time] datetime2(7) DEFAULT NULL NULL
)
GO

ALTER TABLE [dbo].[sys_logininfor] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'访问ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'info_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'user_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录IP地址',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'ipaddr'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录地点',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'login_location'
GO

EXEC sp_addextendedproperty
'MS_Description', N'浏览器类型',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'browser'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作系统',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'os'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录状态（0成功 1失败）',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提示消息',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'msg'
GO

EXEC sp_addextendedproperty
'MS_Description', N'访问时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor',
'COLUMN', N'login_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统访问记录',
'SCHEMA', N'dbo',
'TABLE', N'sys_logininfor'
GO

EXEC sp_addextendedproperty
     'MS_Description', N'系统访问记录表登录状态索引',
     'SCHEMA', N'dbo',
     'TABLE', N'sys_logininfor',
     'INDEX', N'idx_sys_logininfor_s'
GO

EXEC sp_addextendedproperty
     'MS_Description', N'系统访问记录表登录时间索引',
     'SCHEMA', N'dbo',
     'TABLE', N'sys_logininfor',
     'INDEX', N'idx_sys_logininfor_lt'

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_logininfor] ON
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'1', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'退出成功', N'2022-08-15 14:15:15.2700000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'2', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-15 14:15:21.2800000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10002', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'用户不存在/密码错误', N'2022-08-22 09:55:56.8670000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10003', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'密码输入错误1次', N'2022-08-22 09:55:56.8670000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10004', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-22 09:56:18.6170000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10005', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'退出成功', N'2022-08-22 10:19:36.8670000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10006', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-22 10:19:49.5570000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10007', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'退出成功', N'2022-08-22 11:15:07.6770000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10008', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-22 11:15:17.7470000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10009', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'退出成功', N'2022-08-22 11:18:22.6130000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10010', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-22 11:18:31.5470000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10011', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'退出成功', N'2022-08-22 11:25:50.7700000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10012', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-22 11:25:55.9400000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10013', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'退出成功', N'2022-08-22 11:29:57.5130000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10014', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'密码输入错误1次', N'2022-08-22 11:30:05.9430000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10015', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'用户不存在/密码错误', N'2022-08-22 11:30:05.9430000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10016', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'密码输入错误2次', N'2022-08-22 11:30:21.5170000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10017', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'用户不存在/密码错误', N'2022-08-22 11:30:21.5170000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10018', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-22 11:33:03.1770000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10019', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'密码输入错误1次', N'2022-08-23 10:50:25.5230000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10020', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'用户不存在/密码错误', N'2022-08-23 10:50:25.5230000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10021', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'1', N'验证码错误', N'2022-08-23 10:50:34.3270000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10022', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-23 10:50:39.1000000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10023', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-23 13:13:54.8170000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10024', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'退出成功', N'2022-08-23 13:30:15.9200000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10025', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-23 13:30:21.3570000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10026', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-23 14:09:08.3200000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10027', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'退出成功', N'2022-08-23 15:55:40.0830000')
GO

INSERT INTO [dbo].[sys_logininfor] ([info_id], [user_name], [ipaddr], [login_location], [browser], [os], [status], [msg], [login_time]) VALUES (N'10028', N'admin', N'127.0.0.1', N'内网IP', N'Chrome 10', N'Windows 10', N'0', N'登录成功', N'2022-08-24 09:43:45.7830000')
GO

SET IDENTITY_INSERT [dbo].[sys_logininfor] OFF
GO


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_menu]
GO

CREATE TABLE [dbo].[sys_menu] (
  [menu_id] bigint  IDENTITY(1,1) NOT NULL,
  [menu_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [parent_id] bigint DEFAULT 0 NULL,
  [order_num] int DEFAULT 0 NULL,
  [path] nvarchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [component] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [query] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [is_frame] int DEFAULT 1 NULL,
  [is_cache] int DEFAULT 0 NULL,
  [menu_type] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [visible] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [perms] nvarchar(100) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [icon] nvarchar(100) COLLATE Chinese_PRC_CI_AS DEFAULT '#' NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [create_time] datetime2(7) DEFAULT NULL NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [update_time] datetime2(7) DEFAULT NULL NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[sys_menu] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'menu_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'menu_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父菜单ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'parent_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'显示顺序',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'order_num'
GO

EXEC sp_addextendedproperty
'MS_Description', N'路由地址',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'path'
GO

EXEC sp_addextendedproperty
'MS_Description', N'组件路径',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'component'
GO

EXEC sp_addextendedproperty
'MS_Description', N'路由参数',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'query'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否为外链（0是 1否）',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'is_frame'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否缓存（0缓存 1不缓存）',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'is_cache'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单类型（M目录 C菜单 F按钮）',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'menu_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单状态（0显示 1隐藏）',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'visible'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单状态（0正常 1停用）',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'权限标识',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'perms'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单图标',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'icon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单权限表',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu'
GO


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_menu] ON
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'系统管理', N'0', N'1', N'system', NULL, N'', N'1', N'0', N'M', N'0', N'0', N'', N'system', N'admin', getdate(), N'', NULL, N'系统管理目录')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'系统监控', N'0', N'2', N'monitor', NULL, N'', N'1', N'0', N'M', N'0', N'0', N'', N'monitor', N'admin', getdate(), N'', NULL, N'系统监控目录')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'3', N'系统工具', N'0', N'3', N'tool', NULL, N'', N'1', N'0', N'M', N'0', N'0', N'', N'tool', N'admin', getdate(), N'', NULL, N'系统工具目录')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'4', N'若依官网', N'0', N'4', N'http://ruoyi.vip/', NULL, N'', N'0', N'0', N'M', N'0', N'0', N'', N'guide', N'admin', getdate(), N'admin', N'2022-08-23 13:30:04.7030000', N'若依官网地址')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'100', N'用户管理', N'1', N'1', N'user', N'system/user/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:user:list', N'user', N'admin', getdate(), N'', NULL, N'用户管理菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'101', N'角色管理', N'1', N'2', N'role', N'system/role/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:role:list', N'peoples', N'admin', getdate(), N'', NULL, N'角色管理菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'102', N'菜单管理', N'1', N'3', N'menu', N'system/menu/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:menu:list', N'tree-table', N'admin', getdate(), N'', NULL, N'菜单管理菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'103', N'部门管理', N'1', N'4', N'dept', N'system/dept/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:dept:list', N'tree', N'admin', getdate(), N'', NULL, N'部门管理菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'104', N'岗位管理', N'1', N'5', N'post', N'system/post/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:post:list', N'post', N'admin', getdate(), N'', NULL, N'岗位管理菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'105', N'字典管理', N'1', N'6', N'dict', N'system/dict/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:dict:list', N'dict', N'admin', getdate(), N'', NULL, N'字典管理菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'106', N'参数设置', N'1', N'7', N'config', N'system/config/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:config:list', N'edit', N'admin', getdate(), N'', NULL, N'参数设置菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'107', N'通知公告', N'1', N'8', N'notice', N'system/notice/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:notice:list', N'message', N'admin', getdate(), N'', NULL, N'通知公告菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'108', N'日志管理', N'1', N'9', N'log', N'', N'', N'1', N'0', N'M', N'0', N'0', N'', N'log', N'admin', getdate(), N'', NULL, N'日志管理菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'109', N'在线用户', N'2', N'1', N'online', N'monitor/online/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:online:list', N'online', N'admin', getdate(), N'', NULL, N'在线用户菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'110', N'定时任务', N'2', N'2', N'job', N'monitor/job/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:job:list', N'job', N'admin', getdate(), N'', NULL, N'定时任务菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'111', N'数据监控', N'2', N'3', N'druid', N'monitor/druid/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:druid:list', N'druid', N'admin', getdate(), N'', NULL, N'数据监控菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'112', N'服务监控', N'2', N'4', N'server', N'monitor/server/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:server:list', N'server', N'admin', getdate(), N'', NULL, N'服务监控菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'113', N'缓存监控', N'2', N'5', N'cache', N'monitor/cache/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:cache:list', N'redis', N'admin', getdate(), N'', NULL, N'缓存监控菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'114', N'缓存列表', N'2', N'6', N'cacheList', N'monitor/cache/list', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:cache:list', N'redis-list', N'admin', getdate(), N'', NULL, N'缓存列表菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'115', N'表单构建', N'3', N'1', N'build', N'tool/build/index', N'', N'1', N'0', N'C', N'0', N'0', N'tool:build:list', N'build', N'admin', getdate(), N'', NULL, N'表单构建菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'116', N'代码生成', N'3', N'2', N'gen', N'tool/gen/index', N'', N'1', N'0', N'C', N'0', N'0', N'tool:gen:list', N'code', N'admin', getdate(), N'', NULL, N'代码生成菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'117', N'系统接口', N'3', N'3', N'swagger', N'tool/swagger/index', N'', N'1', N'0', N'C', N'0', N'0', N'tool:swagger:list', N'swagger', N'admin', getdate(), N'', NULL, N'系统接口菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'500', N'操作日志', N'108', N'1', N'operlog', N'monitor/operlog/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:operlog:list', N'form', N'admin', getdate(), N'', NULL, N'操作日志菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'501', N'登录日志', N'108', N'2', N'logininfor', N'monitor/logininfor/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:logininfor:list', N'logininfor', N'admin', getdate(), N'', NULL, N'登录日志菜单')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1000', N'用户查询', N'100', N'1', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:user:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1001', N'用户新增', N'100', N'2', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:user:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1002', N'用户修改', N'100', N'3', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:user:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1003', N'用户删除', N'100', N'4', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:user:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1004', N'用户导出', N'100', N'5', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:user:export', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1005', N'用户导入', N'100', N'6', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:user:import', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1006', N'重置密码', N'100', N'7', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:user:resetPwd', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1007', N'角色查询', N'101', N'1', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:role:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1008', N'角色新增', N'101', N'2', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:role:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1009', N'角色修改', N'101', N'3', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:role:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1010', N'角色删除', N'101', N'4', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:role:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1011', N'角色导出', N'101', N'5', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:role:export', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1012', N'菜单查询', N'102', N'1', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:menu:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1013', N'菜单新增', N'102', N'2', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:menu:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1014', N'菜单修改', N'102', N'3', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:menu:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1015', N'菜单删除', N'102', N'4', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:menu:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1016', N'部门查询', N'103', N'1', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dept:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1017', N'部门新增', N'103', N'2', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dept:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1018', N'部门修改', N'103', N'3', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dept:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1019', N'部门删除', N'103', N'4', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dept:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1020', N'岗位查询', N'104', N'1', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:post:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1021', N'岗位新增', N'104', N'2', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:post:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1022', N'岗位修改', N'104', N'3', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:post:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1023', N'岗位删除', N'104', N'4', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:post:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1024', N'岗位导出', N'104', N'5', N'', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:post:export', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1025', N'字典查询', N'105', N'1', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dict:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1026', N'字典新增', N'105', N'2', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dict:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1027', N'字典修改', N'105', N'3', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dict:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1028', N'字典删除', N'105', N'4', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dict:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1029', N'字典导出', N'105', N'5', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:dict:export', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1030', N'参数查询', N'106', N'1', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:config:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1031', N'参数新增', N'106', N'2', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:config:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1032', N'参数修改', N'106', N'3', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:config:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1033', N'参数删除', N'106', N'4', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:config:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1034', N'参数导出', N'106', N'5', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:config:export', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1035', N'公告查询', N'107', N'1', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:notice:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1036', N'公告新增', N'107', N'2', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:notice:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1037', N'公告修改', N'107', N'3', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:notice:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1038', N'公告删除', N'107', N'4', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'system:notice:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1039', N'操作查询', N'500', N'1', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:operlog:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1040', N'操作删除', N'500', N'2', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:operlog:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1041', N'日志导出', N'500', N'3', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:operlog:export', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1042', N'登录查询', N'501', N'1', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:logininfor:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1043', N'登录删除', N'501', N'2', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:logininfor:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1044', N'日志导出', N'501', N'3', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:logininfor:export', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1045', N'账户解锁', N'501', N'4', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:logininfor:unlock', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1046', N'在线查询', N'109', N'1', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:online:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1047', N'批量强退', N'109', N'2', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:online:batchLogout', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1048', N'单条强退', N'109', N'3', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:online:forceLogout', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1049', N'任务查询', N'110', N'1', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:job:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1050', N'任务新增', N'110', N'2', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:job:add', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1051', N'任务修改', N'110', N'3', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:job:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1052', N'任务删除', N'110', N'4', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:job:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1053', N'状态修改', N'110', N'5', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:job:changeStatus', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1054', N'任务导出', N'110', N'6', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'monitor:job:export', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1055', N'生成查询', N'116', N'1', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'tool:gen:query', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1056', N'生成修改', N'116', N'2', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'tool:gen:edit', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1057', N'生成删除', N'116', N'3', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'tool:gen:remove', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1058', N'导入代码', N'116', N'4', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'tool:gen:import', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1059', N'预览代码', N'116', N'5', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'tool:gen:preview', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1060', N'生成代码', N'116', N'6', N'#', N'', N'', N'1', N'0', N'F', N'0', N'0', N'tool:gen:code', N'#', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1061', N'magic', N'3', N'4', N'magic', N'magic/dev/index', NULL, N'1', N'0', N'C', N'0', N'0', NULL, N'code', N'admin', N'2022-08-23 10:55:09.9470000', N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1062', N'示例', N'0', N'0', N'searcher', NULL, NULL, N'1', N'0', N'M', N'0', N'0', N'', N'example', N'admin', N'2022-08-29 10:02:59.9070000', N'admin', N'2022-08-30 09:52:12.8500000', N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1063', N'BeanSearcher', N'1062', N'0', N'user-detail', N'searcher/user-detail/index', NULL, N'1', N'0', N'C', N'0', N'0', N'searcher:user:detail', N'search', N'admin', N'2022-08-29 10:05:14.9200000', N'admin', N'2022-08-30 09:54:43.7830000', N'')
GO

INSERT INTO [dbo].[sys_menu] ([menu_id], [menu_name], [parent_id], [order_num], [path], [component], [query], [is_frame], [is_cache], [menu_type], [visible], [status], [perms], [icon], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1064', N'websocket', N'1062', N'1', N'example', N'websocket/example/index', NULL, N'1', N'0', N'C', N'0', N'0', NULL, N'online', N'admin', N'2022-08-30 09:54:21.4100000', N'', NULL, N'')
GO

SET IDENTITY_INSERT [dbo].[sys_menu] OFF
GO


-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_notice]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_notice]
GO

CREATE TABLE [dbo].[sys_notice] (
  [notice_id] int  IDENTITY(1,1) NOT NULL,
  [notice_title] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [notice_type] nchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [notice_content] varbinary(max) DEFAULT NULL NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL,
  [remark] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_notice] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'公告ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'notice_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公告标题',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'notice_title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公告类型（1通知 2公告）',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'notice_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公告内容',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'notice_content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公告状态（0正常 1关闭）',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'通知公告表',
'SCHEMA', N'dbo',
'TABLE', N'sys_notice'
GO


-- ----------------------------
-- Records of sys_notice
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_notice] ON
GO

INSERT INTO [dbo].[sys_notice] ([notice_id], [notice_title], [notice_type], [notice_content], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'温馨提醒：2018-07-01 若依新版本发布啦', N'2', 0xE696B0E78988E69CACE58685E5AEB9, N'0', N'admin', getdate(), N'', NULL, N'管理员')
GO

INSERT INTO [dbo].[sys_notice] ([notice_id], [notice_title], [notice_type], [notice_content], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'维护通知：2018-07-01 若依系统凌晨维护', N'1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, N'0', N'admin', getdate(), N'admin', N'2022-08-15 14:23:37.8830000', N'管理员')
GO

SET IDENTITY_INSERT [dbo].[sys_notice] OFF
GO


-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_oper_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_oper_log]
GO

CREATE TABLE [dbo].[sys_oper_log] (
  [oper_id] bigint  IDENTITY(1,1) NOT NULL,
  [title] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [business_type] int DEFAULT 0 NULL,
  [method] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [request_method] nvarchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [operator_type] int DEFAULT 0 NULL,
  [oper_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [dept_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [oper_url] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [oper_ip] nvarchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [oper_location] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [oper_param] nvarchar(2000) COLLATE Chinese_PRC_CI_AS  NULL,
  [json_result] nvarchar(2000) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] int DEFAULT 0 NULL,
  [error_msg] nvarchar(2000) COLLATE Chinese_PRC_CI_AS  NULL,
  [oper_time] datetime2(7)  NULL,
  [cost_time] bigint DEFAULT 0 NULL,
)
GO

ALTER TABLE [dbo].[sys_oper_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'日志主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'oper_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模块标题',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'业务类型（0其它 1新增 2修改 3删除）',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'business_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'方法名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'method'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求方式',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'request_method'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作类别（0其它 1后台用户 2手机端用户）',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'operator_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作人员',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'oper_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'dept_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求URL',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'oper_url'
GO

EXEC sp_addextendedproperty
'MS_Description', N'主机地址',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'oper_ip'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作地点',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'oper_location'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求参数',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'oper_param'
GO

EXEC sp_addextendedproperty
'MS_Description', N'返回参数',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'json_result'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作状态（0正常 1异常）',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'错误消息',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'error_msg'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log',
'COLUMN', N'oper_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作日志记录',
'SCHEMA', N'dbo',
'TABLE', N'sys_oper_log'
GO

EXEC sp_addextendedproperty
     'MS_Description', N'业务类型索引',
     'SCHEMA', N'dbo',
     'TABLE', N'sys_oper_log',
     'INDEX', N'idx_sys_oper_log_bt'
GO

EXEC sp_addextendedproperty
     'MS_Description', N'操作状态索引',
     'SCHEMA', N'dbo',
     'TABLE', N'sys_oper_log',
     'INDEX', N'idx_sys_oper_log_s'
GO

EXEC sp_addextendedproperty
     'MS_Description', N'操作时间索引',
     'SCHEMA', N'dbo',
     'TABLE', N'sys_oper_log',
     'INDEX', N'idx_sys_oper_log_ot'


-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_oper_log] ON
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'1', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"缁存姢鍐呭                  ","noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin"}', NULL, N'1', N'
### Error updating database.  Cause: com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。
### The error may exist in file [D:\workspace\git_ee\RuoYi-Vue-Cluster\RuoYi-Vue-SQLServer-C\ruoyi-system\target\classes\mapper\system\SysNoticeMapper.xml]
### The error may involve com.ruoyi.system.mapper.SysNoticeMapper.updateNotice-Inline
### The error occurred while setting parameters
### SQL: update sys_notice           SET notice_title = ?,              notice_type = ?,              notice_content = ?,              status = ?,              update_by = ?,     update_time = getdate()          where notice_id = ?
### Cause: com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。
; uncategorized SQLException; SQL state [S0003]; error code [257]; 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。; nested exception is com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。', N'2022-08-15 11:27:02.2900000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'2', N'通知公告', N'1', N'com.ruoyi.web.controller.system.SysNoticeController.add()', N'POST', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","noticeContent":"<p>测试</p><p><img src=\"/dev-api/profile/upload/2022/08/15/地图沟通1_20220815122042A001.png\"></p>","noticeTitle":"测试","noticeType":"1","params":{},"status":"0"}', NULL, N'1', N'
### Error updating database.  Cause: com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。
### The error may exist in file [D:\workspace\git_ee\RuoYi-Vue-Cluster\RuoYi-Vue-SQLServer-C\ruoyi-system\target\classes\mapper\system\SysNoticeMapper.xml]
### The error may involve com.ruoyi.system.mapper.SysNoticeMapper.insertNotice-Inline
### The error occurred while setting parameters
### SQL: insert into sys_notice (     notice_title,       notice_type,       notice_content,       status,             create_by,      create_time    )values(     ?,       ?,       ?,       ?,             ?,      getdate()   )
### Cause: com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。
; uncategorized SQLException; SQL state [S0003]; error code [257]; 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。; nested exception is com.microsoft.sqlserver.jdbc.SQLServerException: 不允许从数据类型 nvarchar 到 varbinary(max) 的隐式转换。请使用 CONVERT 函数来运行此查询。', N'2022-08-15 12:21:03.4770000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'3', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"<p>维护内容</p><p><img src=\"/dev-api/profile/upload/2022/08/15/收款码_20220815132352A001.jpg\"></p>","noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 13:23:57.8300000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'4', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"<\u0000p\u0000","noticeContentBit":[60,0,112,0],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 13:23:57"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 13:52:42.5400000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'5', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"维护内容","noticeContentBit":[-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:02:51.8600000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'6', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"维护内容","noticeContentBit":[-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:11:15.4100000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'7', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"维护内容","noticeContentBit":[-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 14:11:15"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:11:36.4770000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'8', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"维护内容","noticeContentBit":[-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 14:11:36"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:13:21.5200000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'9', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"维护内容","noticeContentBit":[-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 14:13:21"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:15:57.3230000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'10', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"维护内容","noticeContentBit":[-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 14:13:21"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:16:45.8170000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'11', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"<p>维护内容测试</p>","noticeContentBit":[60,112,62,-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71,-26,-75,-117,-24,-81,-107,60,47,112,62],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 14:16:45"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:22:59.7030000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'12', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"<p>维护内容</p>","noticeContentBit":[60,112,62,-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71,60,47,112,62],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 14:22:59"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:23:09.9530000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'13', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"<p>维护内容</p><p><img src=\"/dev-api/profile/upload/2022/08/15/地图沟通1_20220815142322A001.png\"></p>","noticeContentBit":[60,112,62,-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71,60,47,112,62,60,112,62,60,105,109,103,32,115,114,99,61,34,47,100,101,118,45,97,112,105,47,112,114,111,102,105,108,101,47,117,112,108,111,97,100,47,50,48,50,50,47,48,56,47,49,53,47,-27,-100,-80,-27,-101,-66,-26,-78,-97,-23,-128,-102,49,95,50,48,50,50,48,56,49,53,49,52,50,51,50,50,65,48,48,49,46,112,110,103,34,62,60,47,112,62],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 14:23:09"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:23:24.6770000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'14', N'通知公告', N'2', N'com.ruoyi.web.controller.system.SysNoticeController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/notice', N'127.0.0.1', N'内网IP', N'{"createBy":"admin","createTime":"2022-08-15 09:19:21","noticeContent":"<p>维护内容</p>","noticeContentBit":[60,112,62,-25,-69,-76,-26,-118,-92,-27,-122,-123,-27,-82,-71,60,47,112,62],"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","noticeType":"1","params":{},"remark":"管理员","status":"0","updateBy":"admin","updateTime":"2022-08-15 14:23:24"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-15 14:23:37.9030000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'10002', N'菜单管理', N'2', N'com.ruoyi.web.controller.system.SysMenuController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/menu', N'127.0.0.1', N'内网IP', N'{"children":[],"component":"magic/dev/index","createTime":"2022-08-15 09:19:21","icon":"code","isCache":"0","isFrame":"1","menuId":3,"menuName":"magic","menuType":"C","orderNum":4,"params":{},"parentId":3,"path":"tool","perms":"","query":"","status":"0","visible":"0"}', N'{"msg":"修改菜单''magic''失败，上级菜单不能选择自己","code":500}', N'0', NULL, N'2022-08-23 10:54:00.2400000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'10003', N'菜单管理', N'1', N'com.ruoyi.web.controller.system.SysMenuController.add()', N'POST', N'1', N'admin', NULL, N'/system/menu', N'127.0.0.1', N'内网IP', N'{"children":[],"component":"magic/dev/index","createBy":"admin","icon":"code","isCache":"0","isFrame":"1","menuName":"magic","menuType":"C","orderNum":4,"params":{},"parentId":3,"path":"magic","status":"0","visible":"0"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-23 10:55:09.9770000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'10004', N'菜单管理', N'2', N'com.ruoyi.web.controller.system.SysMenuController.edit()', N'PUT', N'1', N'admin', NULL, N'/system/menu', N'127.0.0.1', N'内网IP', N'{"children":[],"createTime":"2022-08-15 09:19:21","icon":"guide","isCache":"0","isFrame":"0","menuId":4,"menuName":"若依官网","menuType":"M","orderNum":4,"params":{},"parentId":0,"path":"http://ruoyi.vip/","perms":"","query":"","status":"0","updateBy":"admin","visible":"0"}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-23 13:30:04.7430000')
GO

INSERT INTO [dbo].[sys_oper_log] ([oper_id], [title], [business_type], [method], [request_method], [operator_type], [oper_name], [dept_name], [oper_url], [oper_ip], [oper_location], [oper_param], [json_result], [status], [error_msg], [oper_time]) VALUES (N'10005', N'定时任务', N'2', N'com.ruoyi.quartz.controller.SysJobController.run()', N'PUT', N'1', N'admin', NULL, N'/monitor/job/run', N'127.0.0.1', N'内网IP', N'{"jobGroup":"DEFAULT","jobId":1,"misfirePolicy":"0","params":{}}', N'{"msg":"操作成功","code":200}', N'0', NULL, N'2022-08-24 09:44:14.0930000')
GO

SET IDENTITY_INSERT [dbo].[sys_oper_log] OFF
GO


-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_post]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_post]
GO

CREATE TABLE [dbo].[sys_post] (
  [post_id] bigint  IDENTITY(1,1) NOT NULL,
  [post_code] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [post_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [post_sort] int  NOT NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NOT NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_post] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'post_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位编码',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'post_code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'post_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'显示顺序',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'post_sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态（0正常 1停用）',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_post',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位信息表',
'SCHEMA', N'dbo',
'TABLE', N'sys_post'
GO


-- ----------------------------
-- Records of sys_post
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_post] ON
GO

INSERT INTO [dbo].[sys_post] ([post_id], [post_code], [post_name], [post_sort], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'ceo', N'董事长', N'1', N'0', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_post] ([post_id], [post_code], [post_name], [post_sort], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'se', N'项目经理', N'2', N'0', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_post] ([post_id], [post_code], [post_name], [post_sort], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'3', N'hr', N'人力资源', N'3', N'0', N'admin', getdate(), N'', NULL, N'')
GO

INSERT INTO [dbo].[sys_post] ([post_id], [post_code], [post_name], [post_sort], [status], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'4', N'user', N'普通员工', N'4', N'0', N'admin', getdate(), N'', NULL, N'')
GO

SET IDENTITY_INSERT [dbo].[sys_post] OFF
GO


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role]
GO

CREATE TABLE [dbo].[sys_role] (
  [role_id] bigint  IDENTITY(1,1) NOT NULL,
  [role_name] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [role_key] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [role_sort] int  NOT NULL,
  [data_scope] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT '1' NULL,
  [menu_check_strictly] tinyint DEFAULT 1 NULL,
  [dept_check_strictly] tinyint DEFAULT 1 NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NOT NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT '0' NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_role] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'role_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色权限字符串',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'role_key'
GO

EXEC sp_addextendedproperty
'MS_Description', N'显示顺序',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'role_sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'data_scope'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单树选择项是否关联显示',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'menu_check_strictly'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门树选择项是否关联显示',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'dept_check_strictly'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色状态（0正常 1停用）',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标志（0代表存在 2代表删除）',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色信息表',
'SCHEMA', N'dbo',
'TABLE', N'sys_role'
GO


-- ----------------------------
-- Records of sys_role
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_role] ON
GO

INSERT INTO [dbo].[sys_role] ([role_id], [role_name], [role_key], [role_sort], [data_scope], [menu_check_strictly], [dept_check_strictly], [status], [del_flag], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'超级管理员', N'admin', N'1', N'1', N'1', N'1', N'0', N'0', N'admin', getdate(), N'', NULL, N'超级管理员')
GO

INSERT INTO [dbo].[sys_role] ([role_id], [role_name], [role_key], [role_sort], [data_scope], [menu_check_strictly], [dept_check_strictly], [status], [del_flag], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'普通角色', N'common', N'2', N'2', N'1', N'1', N'0', N'0', N'admin', getdate(), N'', NULL, N'普通角色')
GO

SET IDENTITY_INSERT [dbo].[sys_role] OFF
GO


-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_dept]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_dept]
GO

CREATE TABLE [dbo].[sys_role_dept] (
  [role_id] bigint  NOT NULL,
  [dept_id] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_role_dept] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_dept',
'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_dept',
'COLUMN', N'dept_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色和部门关联表',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_dept'
GO


-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO [dbo].[sys_role_dept] ([role_id], [dept_id]) VALUES (N'2', N'100')
GO

INSERT INTO [dbo].[sys_role_dept] ([role_id], [dept_id]) VALUES (N'2', N'101')
GO

INSERT INTO [dbo].[sys_role_dept] ([role_id], [dept_id]) VALUES (N'2', N'105')
GO


-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_menu]
GO

CREATE TABLE [dbo].[sys_role_menu] (
  [role_id] bigint  NOT NULL,
  [menu_id] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_role_menu] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_menu',
'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_menu',
'COLUMN', N'menu_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色和菜单关联表',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_menu'
GO


-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'2')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'3')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'4')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'100')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'101')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'102')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'103')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'104')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'105')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'106')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'107')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'108')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'109')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'110')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'111')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'112')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'113')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'114')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'115')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'116')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'117')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'500')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'501')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1000')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1001')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1002')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1003')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1004')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1005')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1006')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1007')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1008')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1009')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1010')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1011')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1012')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1013')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1014')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1015')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1016')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1017')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1018')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1019')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1020')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1021')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1022')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1023')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1024')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1025')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1026')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1027')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1028')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1029')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1030')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1031')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1033')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1034')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1035')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1036')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1037')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1038')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1039')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1040')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1041')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1042')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1043')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1044')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1045')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1046')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1047')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1048')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1049')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1050')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1051')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1052')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1053')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1054')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1055')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1056')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1057')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1058')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1059')
GO

INSERT INTO [dbo].[sys_role_menu] ([role_id], [menu_id]) VALUES (N'2', N'1060')
GO


-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user]
GO

CREATE TABLE [dbo].[sys_user] (
  [user_id] bigint  IDENTITY(1,1) NOT NULL,
  [dept_id] bigint  NULL,
  [user_name] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [nick_name] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [user_type] nvarchar(2) COLLATE Chinese_PRC_CI_AS DEFAULT '00' NULL,
  [email] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [phonenumber] nvarchar(11) COLLATE Chinese_PRC_CI_AS  NULL,
  [sex] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT '2' NULL,
  [avatar] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [password] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT '0' NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT '0' NULL,
  [login_ip] nvarchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [login_date] datetime2(7)  NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(7)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime2(7)  NULL,
  [remark] nvarchar(500) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL
)
GO

ALTER TABLE [dbo].[sys_user] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'dept_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'user_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户昵称',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'nick_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户类型（00系统用户）',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户邮箱',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'email'
GO

EXEC sp_addextendedproperty
'MS_Description', N'手机号码',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'phonenumber'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户性别（0男 1女 2未知）',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'sex'
GO

EXEC sp_addextendedproperty
'MS_Description', N'头像地址',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'avatar'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'password'
GO

EXEC sp_addextendedproperty
'MS_Description', N'帐号状态（0正常 1停用）',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标志（0代表存在 2代表删除）',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'最后登录IP',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'login_ip'
GO

EXEC sp_addextendedproperty
'MS_Description', N'最后登录时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'login_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户信息表',
'SCHEMA', N'dbo',
'TABLE', N'sys_user'
GO


-- ----------------------------
-- Records of sys_user
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_user] ON
GO

INSERT INTO [dbo].[sys_user] ([user_id], [dept_id], [user_name], [nick_name], [user_type], [email], [phonenumber], [sex], [avatar], [password], [status], [del_flag], [login_ip], [login_date], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'1', N'103', N'admin', N'若依', N'00', N'ry@163.com', N'15888888888', N'1', N'', N'$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', N'0', N'0', N'127.0.0.1', N'2022-08-25 14:28:12.2910000', N'admin', getdate(), N'', N'2022-08-25 14:28:12.2930000', N'管理员')
GO

INSERT INTO [dbo].[sys_user] ([user_id], [dept_id], [user_name], [nick_name], [user_type], [email], [phonenumber], [sex], [avatar], [password], [status], [del_flag], [login_ip], [login_date], [create_by], [create_time], [update_by], [update_time], [remark]) VALUES (N'2', N'105', N'ry', N'若依', N'00', N'ry@qq.com', N'15666666666', N'1', N'', N'$2a$10$uMoEs0dIwsZQSyfVoAARwOqYH7Jx.x3CIRSs6MKa8dMUIUZpQkzrW', N'0', N'0', N'127.0.0.1', N'2022-08-29 10:18:22.0430000', N'admin', getdate(), N'ry', N'2022-08-29 10:18:22.0530000', N'测试员')
GO

SET IDENTITY_INSERT [dbo].[sys_user] OFF
GO


-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_post]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_post]
GO

CREATE TABLE [dbo].[sys_user_post] (
  [user_id] bigint  NOT NULL,
  [post_id] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_post] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_post',
'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_post',
'COLUMN', N'post_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户与岗位关联表',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_post'
GO


-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO [dbo].[sys_user_post] ([user_id], [post_id]) VALUES (N'1', N'1')
GO

INSERT INTO [dbo].[sys_user_post] ([user_id], [post_id]) VALUES (N'2', N'2')
GO


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_role]
GO

CREATE TABLE [dbo].[sys_user_role] (
  [user_id] bigint  NOT NULL,
  [role_id] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_role] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_role',
'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_role',
'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户和角色关联表',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_role'
GO


-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO [dbo].[sys_user_role] ([user_id], [role_id]) VALUES (N'1', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([user_id], [role_id]) VALUES (N'2', N'2')
GO


-- ----------------------------
-- Auto increment value for gen_table
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[gen_table]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table gen_table
-- ----------------------------
ALTER TABLE [dbo].[gen_table] ADD CONSTRAINT [PK__gen_tabl__B21E8F2436FAE02E] PRIMARY KEY CLUSTERED ([table_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for gen_table_column
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[gen_table_column]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table gen_table_column
-- ----------------------------
ALTER TABLE [dbo].[gen_table_column] ADD CONSTRAINT [PK__gen_tabl__E301851F5EFA4012] PRIMARY KEY CLUSTERED ([column_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_config
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_config]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE [dbo].[sys_config] ADD CONSTRAINT [PK__sys_conf__4AD1BFF121F1EC8C] PRIMARY KEY CLUSTERED ([config_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_dept
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_dept]', RESEED, 109)
GO


-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE [dbo].[sys_dept] ADD CONSTRAINT [PK__sys_dept__DCA659749588965B] PRIMARY KEY CLUSTERED ([dept_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_dict_data
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_dict_data]', RESEED, 29)
GO


-- ----------------------------
-- Primary Key structure for table sys_dict_data
-- ----------------------------
ALTER TABLE [dbo].[sys_dict_data] ADD CONSTRAINT [PK__sys_dict__19CBC34B6FDCF220] PRIMARY KEY CLUSTERED ([dict_code])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_dict_type
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_dict_type]', RESEED, 10)
GO


-- ----------------------------
-- Indexes structure for table sys_dict_type
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [dict_type]
ON [dbo].[sys_dict_type] (
  [dict_type] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE [dbo].[sys_dict_type] ADD CONSTRAINT [PK__sys_dict__3BD4186CFA81B278] PRIMARY KEY CLUSTERED ([dict_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_job
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_job]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table sys_job
-- ----------------------------
ALTER TABLE [dbo].[sys_job] ADD CONSTRAINT [PK__sys_job__2E0E56DC6625C9A3] PRIMARY KEY CLUSTERED ([job_id], [job_name], [job_group])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_job_log
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_job_log]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table sys_job_log
-- ----------------------------
ALTER TABLE [dbo].[sys_job_log] ADD CONSTRAINT [PK__sys_job___0CA0EBC9760F12D9] PRIMARY KEY CLUSTERED ([job_log_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_logininfor
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_logininfor]', RESEED, 10039)
GO


-- ----------------------------
-- Primary Key structure for table sys_logininfor
-- ----------------------------
ALTER TABLE [dbo].[sys_logininfor] ADD CONSTRAINT [PK__sys_logi__3D8A9C1A45C437A1] PRIMARY KEY CLUSTERED ([info_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_menu
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_menu]', RESEED, 1061)
GO


-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE [dbo].[sys_menu] ADD CONSTRAINT [PK__sys_menu__4CA0FADC0A771BA0] PRIMARY KEY CLUSTERED ([menu_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_notice
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_notice]', RESEED, 1001)
GO


-- ----------------------------
-- Primary Key structure for table sys_notice
-- ----------------------------
ALTER TABLE [dbo].[sys_notice] ADD CONSTRAINT [PK__sys_noti__3E82A5DB84FB2856] PRIMARY KEY CLUSTERED ([notice_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_oper_log
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_oper_log]', RESEED, 10007)
GO


-- ----------------------------
-- Primary Key structure for table sys_oper_log
-- ----------------------------
ALTER TABLE [dbo].[sys_oper_log] ADD CONSTRAINT [PK__sys_oper__34723BF9122DB5D7] PRIMARY KEY CLUSTERED ([oper_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_post
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_post]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table sys_post
-- ----------------------------
ALTER TABLE [dbo].[sys_post] ADD CONSTRAINT [PK__sys_post__3ED787663975A7AF] PRIMARY KEY CLUSTERED ([post_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_role
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_role]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE [dbo].[sys_role] ADD CONSTRAINT [PK__sys_role__760965CCB61B07A0] PRIMARY KEY CLUSTERED ([role_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_role_dept
-- ----------------------------
ALTER TABLE [dbo].[sys_role_dept] ADD CONSTRAINT [PK__sys_role__2BC3005B8A3F75CD] PRIMARY KEY CLUSTERED ([role_id], [dept_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE [dbo].[sys_role_menu] ADD CONSTRAINT [PK__sys_role__A2C36A6188B73BFD] PRIMARY KEY CLUSTERED ([role_id], [menu_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_user
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_user]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE [dbo].[sys_user] ADD CONSTRAINT [PK__sys_user__B9BE370FF2CCCB2F] PRIMARY KEY CLUSTERED ([user_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user_post
-- ----------------------------
ALTER TABLE [dbo].[sys_user_post] ADD CONSTRAINT [PK__sys_user__CA534F79D34B84A1] PRIMARY KEY CLUSTERED ([user_id], [post_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE [dbo].[sys_user_role] ADD CONSTRAINT [PK__sys_user__6EDEA15316F42985] PRIMARY KEY CLUSTERED ([user_id], [role_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

