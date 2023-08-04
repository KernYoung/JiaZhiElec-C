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

 Date: 23/08/2022 15:13:12
*/


-- ----------------------------
-- Table structure for magic_api_backup
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[magic_api_backup]') AND type IN ('U'))
	DROP TABLE [dbo].[magic_api_backup]
GO

CREATE TABLE [dbo].[magic_api_backup] (
  [id] varchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [create_date] bigint  NOT NULL,
  [tag] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [type] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [name] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[magic_api_backup] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键id',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_backup',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备份时间',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_backup',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标签',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_backup',
'COLUMN', N'tag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_backup',
'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'原名称',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_backup',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备份内容',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_backup',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作人',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_backup',
'COLUMN', N'create_by'
GO


-- ----------------------------
-- Records of magic_api_backup
-- ----------------------------

-- ----------------------------
-- Table structure for magic_api_file
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[magic_api_file]') AND type IN ('U'))
	DROP TABLE [dbo].[magic_api_file]
GO

CREATE TABLE [dbo].[magic_api_file] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [file_path] varchar(512) COLLATE Chinese_PRC_CI_AS  NULL,
  [file_content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] char(2) COLLATE Chinese_PRC_CI_AS DEFAULT '0' NOT NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime  NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_time] datetime  NULL
)
GO

ALTER TABLE [dbo].[magic_api_file] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键id',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文件路径',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file',
'COLUMN', N'file_path'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文件内容',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file',
'COLUMN', N'file_content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标志(0存在 1删除)',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file',
'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'magic文件表',
'SCHEMA', N'dbo',
'TABLE', N'magic_api_file'
GO


-- ----------------------------
-- Records of magic_api_file
-- ----------------------------
SET IDENTITY_INSERT [dbo].[magic_api_file] ON
GO

INSERT INTO [dbo].[magic_api_file] ([id], [file_path], [file_content], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'1', N'/magic-api/datasource/', N'this is directory', N'0 ', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[magic_api_file] ([id], [file_path], [file_content], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'2', N'/magic-api/function/', N'this is directory', N'0 ', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[magic_api_file] ([id], [file_path], [file_content], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'3', N'/magic-api/api/', N'this is directory', N'0 ', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[magic_api_file] ([id], [file_path], [file_content], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'10002', N'/magic-api/api/测试magic/', N'this is directory', N'0 ', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[magic_api_file] ([id], [file_path], [file_content], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'10003', N'/magic-api/api/测试magic/group.json', N'{
  "properties" : { },
  "id" : "44809e21c3b9478d9af7c083a6533b7a",
  "name" : "测试magic",
  "type" : "api",
  "parentId" : "0",
  "path" : "test",
  "createTime" : 1661133796288,
  "updateTime" : null,
  "createBy" : "admin",
  "updateBy" : null,
  "paths" : [ ],
  "options" : [ ]
}', N'0 ', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[magic_api_file] ([id], [file_path], [file_content], [del_flag], [create_by], [create_time], [update_by], [update_time]) VALUES (N'10004', N'/magic-api/api/测试magic/测试magic获取登录用户信息.ms', N'{
  "properties" : { },
  "id" : "3d746e326ab84c33a149d2a10e358b86",
  "script" : null,
  "groupId" : "44809e21c3b9478d9af7c083a6533b7a",
  "name" : "测试magic获取登录用户信息",
  "createTime" : null,
  "updateTime" : 1661140328510,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "magic/user-info",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : null,
  "headers" : [ {
    "name" : "Authorization",
    "value" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjIzODdmN2E5LTFmYzUtNGRhNC05ZGU5LTczMDI0ZmE3ZTRhOSJ9.u8n0VkWet6w7UYgKLPzEHNZGYpbmtVWGgKDwiZ13i17Yj9zlu0gcagCscD8W_oi64onFqy5dCISwn1c1DbGcsw",
    "description" : "token认证",
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  } ],
  "paths" : [ ],
  "responseBody" : "{\n    \"msg\": \"请求访问：/test/magic/user-info，认证失败，无法访问系统资源\",\n    \"code\": 401\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ {
      "name" : "msg",
      "value" : "请求访问：/test/magic/user-info，认证失败，无法访问系统资源",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "code",
      "value" : "401",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
import "tokenService" as tokenService

var token = header.Authorization;
var user = tokenService.getLoginUser(token);

return user', N'0 ', NULL, NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[magic_api_file] OFF
GO


-- ----------------------------
-- Primary Key structure for table magic_api_backup
-- ----------------------------
ALTER TABLE [dbo].[magic_api_backup] ADD CONSTRAINT [PK__magic_ap__5BD2221A2D81BC43] PRIMARY KEY CLUSTERED ([id], [create_date])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for magic_api_file
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[magic_api_file]', RESEED, 10004)
GO


-- ----------------------------
-- Primary Key structure for table magic_api_file
-- ----------------------------
ALTER TABLE [dbo].[magic_api_file] ADD CONSTRAINT [PK__Untitled__3213E83FABC1D424] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

