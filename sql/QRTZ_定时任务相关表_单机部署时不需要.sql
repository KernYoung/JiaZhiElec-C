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

 Date: 24/08/2022 10:30:02
*/


-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_BLOB_TRIGGERS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_BLOB_TRIGGERS]
GO

CREATE TABLE [dbo].[QRTZ_BLOB_TRIGGERS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [blob_data] varbinary(max)  NULL
)
GO

ALTER TABLE [dbo].[QRTZ_BLOB_TRIGGERS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_BLOB_TRIGGERS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_name的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_BLOB_TRIGGERS',
'COLUMN', N'trigger_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_group的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_BLOB_TRIGGERS',
'COLUMN', N'trigger_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'存放持久化Trigger对象',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_BLOB_TRIGGERS',
'COLUMN', N'blob_data'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Blob类型的触发器表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_BLOB_TRIGGERS'
GO


-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_CALENDARS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_CALENDARS]
GO

CREATE TABLE [dbo].[QRTZ_CALENDARS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [calendar_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [calendar] varbinary(max)  NOT NULL
)
GO

ALTER TABLE [dbo].[QRTZ_CALENDARS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CALENDARS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日历名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CALENDARS',
'COLUMN', N'calendar_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'存放持久化calendar对象',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CALENDARS',
'COLUMN', N'calendar'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日历信息表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CALENDARS'
GO


-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_CRON_TRIGGERS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_CRON_TRIGGERS]
GO

CREATE TABLE [dbo].[QRTZ_CRON_TRIGGERS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [cron_expression] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [time_zone_id] nvarchar(80) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CRON_TRIGGERS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_name的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CRON_TRIGGERS',
'COLUMN', N'trigger_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_group的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CRON_TRIGGERS',
'COLUMN', N'trigger_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'cron表达式',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CRON_TRIGGERS',
'COLUMN', N'cron_expression'
GO

EXEC sp_addextendedproperty
'MS_Description', N'时区',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CRON_TRIGGERS',
'COLUMN', N'time_zone_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Cron类型的触发器表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_CRON_TRIGGERS'
GO


-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_FIRED_TRIGGERS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_FIRED_TRIGGERS]
GO

CREATE TABLE [dbo].[QRTZ_FIRED_TRIGGERS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [entry_id] nvarchar(95) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [instance_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [fired_time] bigint  NOT NULL,
  [sched_time] bigint  NOT NULL,
  [priority] int  NOT NULL,
  [state] nvarchar(16) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [job_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_nonconcurrent] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [requests_recovery] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[QRTZ_FIRED_TRIGGERS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度器实例id',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'entry_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_name的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'trigger_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_group的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'trigger_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度器实例名',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'instance_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发的时间',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'fired_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'定时器制定的时间',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'sched_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'优先级',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'priority'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'state'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'job_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务组名',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'job_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否并发',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'is_nonconcurrent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否接受恢复执行',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS',
'COLUMN', N'requests_recovery'
GO

EXEC sp_addextendedproperty
'MS_Description', N'已触发的触发器表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_FIRED_TRIGGERS'
GO


-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_JOB_DETAILS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_JOB_DETAILS]
GO

CREATE TABLE [dbo].[QRTZ_JOB_DETAILS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [description] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NULL,
  [job_class_name] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [is_durable] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [is_nonconcurrent] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [is_update_data] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [requests_recovery] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_data] varbinary(max)  NULL
)
GO

ALTER TABLE [dbo].[QRTZ_JOB_DETAILS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'job_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务组名',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'job_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'相关介绍',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'description'
GO

EXEC sp_addextendedproperty
'MS_Description', N'执行任务类名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'job_class_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否持久化',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'is_durable'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否并发',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'is_nonconcurrent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否更新数据',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'is_update_data'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否接受恢复执行',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'requests_recovery'
GO

EXEC sp_addextendedproperty
'MS_Description', N'存放持久化job对象',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS',
'COLUMN', N'job_data'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务详细信息表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_JOB_DETAILS'
GO


-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_LOCKS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_LOCKS]
GO

CREATE TABLE [dbo].[QRTZ_LOCKS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [lock_name] nvarchar(40) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[QRTZ_LOCKS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_LOCKS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'悲观锁名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_LOCKS',
'COLUMN', N'lock_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'存储的悲观锁信息表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_LOCKS'
GO


-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_PAUSED_TRIGGER_GRPS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS]
GO

CREATE TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_PAUSED_TRIGGER_GRPS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_group的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_PAUSED_TRIGGER_GRPS',
'COLUMN', N'trigger_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'暂停的触发器表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_PAUSED_TRIGGER_GRPS'
GO


-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_SCHEDULER_STATE]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_SCHEDULER_STATE]
GO

CREATE TABLE [dbo].[QRTZ_SCHEDULER_STATE] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [instance_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [last_checkin_time] bigint  NOT NULL,
  [checkin_interval] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[QRTZ_SCHEDULER_STATE] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SCHEDULER_STATE',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'实例名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SCHEDULER_STATE',
'COLUMN', N'instance_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'上次检查时间',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SCHEDULER_STATE',
'COLUMN', N'last_checkin_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'检查间隔时间',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SCHEDULER_STATE',
'COLUMN', N'checkin_interval'
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度器状态表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SCHEDULER_STATE'
GO


-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_SIMPLE_TRIGGERS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS]
GO

CREATE TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [repeat_count] bigint  NOT NULL,
  [repeat_interval] bigint  NOT NULL,
  [times_triggered] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPLE_TRIGGERS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_name的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPLE_TRIGGERS',
'COLUMN', N'trigger_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_group的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPLE_TRIGGERS',
'COLUMN', N'trigger_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'重复的次数统计',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPLE_TRIGGERS',
'COLUMN', N'repeat_count'
GO

EXEC sp_addextendedproperty
'MS_Description', N'重复的间隔时间',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPLE_TRIGGERS',
'COLUMN', N'repeat_interval'
GO

EXEC sp_addextendedproperty
'MS_Description', N'已经触发的次数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPLE_TRIGGERS',
'COLUMN', N'times_triggered'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简单触发器的信息表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPLE_TRIGGERS'
GO


-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_SIMPROP_TRIGGERS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS]
GO

CREATE TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [str_prop_1] nvarchar(512) COLLATE Chinese_PRC_CI_AS  NULL,
  [str_prop_2] nvarchar(512) COLLATE Chinese_PRC_CI_AS  NULL,
  [str_prop_3] nvarchar(512) COLLATE Chinese_PRC_CI_AS  NULL,
  [int_prop_1] int  NULL,
  [int_prop_2] int  NULL,
  [long_prop_1] bigint  NULL,
  [long_prop_2] bigint  NULL,
  [dec_prop_1] decimal(13,4)  NULL,
  [dec_prop_2] decimal(13,4)  NULL,
  [bool_prop_1] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [bool_prop_2] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_name的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'trigger_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_triggers表trigger_group的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'trigger_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'String类型的trigger的第一个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'str_prop_1'
GO

EXEC sp_addextendedproperty
'MS_Description', N'String类型的trigger的第二个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'str_prop_2'
GO

EXEC sp_addextendedproperty
'MS_Description', N'String类型的trigger的第三个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'str_prop_3'
GO

EXEC sp_addextendedproperty
'MS_Description', N'int类型的trigger的第一个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'int_prop_1'
GO

EXEC sp_addextendedproperty
'MS_Description', N'int类型的trigger的第二个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'int_prop_2'
GO

EXEC sp_addextendedproperty
'MS_Description', N'long类型的trigger的第一个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'long_prop_1'
GO

EXEC sp_addextendedproperty
'MS_Description', N'long类型的trigger的第二个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'long_prop_2'
GO

EXEC sp_addextendedproperty
'MS_Description', N'decimal类型的trigger的第一个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'dec_prop_1'
GO

EXEC sp_addextendedproperty
'MS_Description', N'decimal类型的trigger的第二个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'dec_prop_2'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Boolean类型的trigger的第一个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'bool_prop_1'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Boolean类型的trigger的第二个参数',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS',
'COLUMN', N'bool_prop_2'
GO

EXEC sp_addextendedproperty
'MS_Description', N'同步机制的行锁表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_SIMPROP_TRIGGERS'
GO


-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[QRTZ_TRIGGERS]') AND type IN ('U'))
	DROP TABLE [dbo].[QRTZ_TRIGGERS]
GO

CREATE TABLE [dbo].[QRTZ_TRIGGERS] (
  [sched_name] nvarchar(120) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_group] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [description] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NULL,
  [next_fire_time] bigint  NULL,
  [prev_fire_time] bigint  NULL,
  [priority] int  NULL,
  [trigger_state] nvarchar(16) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [trigger_type] nvarchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [start_time] bigint  NOT NULL,
  [end_time] bigint  NULL,
  [calendar_name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [misfire_instr] smallint  NULL,
  [job_data] varbinary(max)  NULL
)
GO

ALTER TABLE [dbo].[QRTZ_TRIGGERS] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'调度名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'sched_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发器的名字',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'trigger_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发器所属组的名字',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'trigger_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_job_details表job_name的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'job_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qrtz_job_details表job_group的外键',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'job_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'相关介绍',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'description'
GO

EXEC sp_addextendedproperty
'MS_Description', N'上一次触发时间（毫秒）',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'next_fire_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'下一次触发时间（默认为-1表示不触发）',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'prev_fire_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'优先级',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'priority'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发器状态',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'trigger_state'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发器的类型',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'trigger_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'开始时间',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'start_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'结束时间',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'end_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日程表名称',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'calendar_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'补偿执行的策略',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'misfire_instr'
GO

EXEC sp_addextendedproperty
'MS_Description', N'存放持久化job对象',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS',
'COLUMN', N'job_data'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发器详细信息表',
'SCHEMA', N'dbo',
'TABLE', N'QRTZ_TRIGGERS'
GO


-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table QRTZ_BLOB_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_BLOB_TRIGGERS] ADD CONSTRAINT [PK__QRTZ_BLO__009FEA1C9E8489A0] PRIMARY KEY CLUSTERED ([sched_name], [trigger_name], [trigger_group])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_CALENDARS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_CALENDARS] ADD CONSTRAINT [PK__QRTZ_CAL__E21C9869386B413A] PRIMARY KEY CLUSTERED ([sched_name], [calendar_name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_CRON_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] ADD CONSTRAINT [PK__QRTZ_CRO__009FEA1C61293DAE] PRIMARY KEY CLUSTERED ([sched_name], [trigger_name], [trigger_group])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_FIRED_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_FIRED_TRIGGERS] ADD CONSTRAINT [PK__QRTZ_FIR__5E6EA63BC8829E37] PRIMARY KEY CLUSTERED ([sched_name], [entry_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_JOB_DETAILS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_JOB_DETAILS] ADD CONSTRAINT [PK__QRTZ_JOB__1642BB8C57B80307] PRIMARY KEY CLUSTERED ([sched_name], [job_name], [job_group])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_LOCKS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_LOCKS] ADD CONSTRAINT [PK__QRTZ_LOC__F1C0211FC3B91E10] PRIMARY KEY CLUSTERED ([sched_name], [lock_name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS] ADD CONSTRAINT [PK__QRTZ_PAU__3D845B2B65FA8DE4] PRIMARY KEY CLUSTERED ([sched_name], [trigger_group])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_SCHEDULER_STATE
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_SCHEDULER_STATE] ADD CONSTRAINT [PK__QRTZ_SCH__FDC0ABB12404DBB6] PRIMARY KEY CLUSTERED ([sched_name], [instance_name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] ADD CONSTRAINT [PK__QRTZ_SIM__009FEA1CA4B972F4] PRIMARY KEY CLUSTERED ([sched_name], [trigger_name], [trigger_group])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] ADD CONSTRAINT [PK__QRTZ_SIM__009FEA1C6AAC7A3E] PRIMARY KEY CLUSTERED ([sched_name], [trigger_name], [trigger_group])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table QRTZ_TRIGGERS
-- ----------------------------
CREATE NONCLUSTERED INDEX [sched_name]
ON [dbo].[QRTZ_TRIGGERS] (
  [sched_name] ASC,
  [job_name] ASC,
  [job_group] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table QRTZ_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_TRIGGERS] ADD CONSTRAINT [PK__QRTZ_TRI__009FEA1CD20899C6] PRIMARY KEY CLUSTERED ([sched_name], [trigger_name], [trigger_group])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table QRTZ_BLOB_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_BLOB_TRIGGERS] ADD CONSTRAINT [qrtz_blob_triggers_ibfk_1] FOREIGN KEY ([sched_name], [trigger_name], [trigger_group]) REFERENCES [dbo].[QRTZ_TRIGGERS] ([sched_name], [trigger_name], [trigger_group]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table QRTZ_CRON_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] ADD CONSTRAINT [qrtz_cron_triggers_ibfk_1] FOREIGN KEY ([sched_name], [trigger_name], [trigger_group]) REFERENCES [dbo].[QRTZ_TRIGGERS] ([sched_name], [trigger_name], [trigger_group]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] ADD CONSTRAINT [qrtz_simple_triggers_ibfk_1] FOREIGN KEY ([sched_name], [trigger_name], [trigger_group]) REFERENCES [dbo].[QRTZ_TRIGGERS] ([sched_name], [trigger_name], [trigger_group]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] ADD CONSTRAINT [qrtz_simprop_triggers_ibfk_1] FOREIGN KEY ([sched_name], [trigger_name], [trigger_group]) REFERENCES [dbo].[QRTZ_TRIGGERS] ([sched_name], [trigger_name], [trigger_group]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table QRTZ_TRIGGERS
-- ----------------------------
ALTER TABLE [dbo].[QRTZ_TRIGGERS] ADD CONSTRAINT [qrtz_triggers_ibfk_1] FOREIGN KEY ([sched_name], [job_name], [job_group]) REFERENCES [dbo].[QRTZ_JOB_DETAILS] ([sched_name], [job_name], [job_group]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

