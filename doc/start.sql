/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : start

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-06-28 17:54:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('StartScheduler', 'TASK_1', 'DEFAULT', '1-2 1-2 0-2 1-2 1-2 ? ', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('StartScheduler', 'TASK_2', 'DEFAULT', '1-2 1-2 0-2 1-2 1-2 ? ', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('StartScheduler', 'TASK_1', 'DEFAULT', null, 'com.xinchen.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720024636F6D2E78696E6368656E2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000D302030203020312D32202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('StartScheduler', 'TASK_2', 'DEFAULT', null, 'com.xinchen.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720024636F6D2E78696E6368656E2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000D302030203020312D32202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('StartScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('StartScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('StartScheduler', 'xinchen-PC1498627793512', '1498628034524', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('StartScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1514736061000', '-1', '5', 'PAUSED', 'CRON', '1493867727000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720024636F6D2E78696E6368656E2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF5933078740016312D3220312D3220302D3220312D3220312D32203F207372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000778696E6368656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_triggers` VALUES ('StartScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1514736061000', '-1', '5', 'PAUSED', 'CRON', '1493867727000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720024636F6D2E78696E6368656E2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C46078740016312D3220312D3220302D3220312D3220312D32203F207372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'xinchen', '1-2 1-2 0-2 1-2 1-2 ? ', '1', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '1-2 1-2 0-2 1-2 1-2 ? ', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'xinchen', '0', null, '1008', '2017-06-28 11:19:40');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'xinchen', '0', null, '1009', '2017-06-28 11:19:45');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:19:50');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'xinchen', '0', null, '1006', '2017-06-28 11:19:55');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'xinchen', '0', null, '1011', '2017-06-28 11:20:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'xinchen', '0', null, '1005', '2017-06-28 11:20:05');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'xinchen', '0', null, '1011', '2017-06-28 11:20:10');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:20:15');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'xinchen', '0', null, '1041', '2017-06-28 11:20:20');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'xinchen', '0', null, '1006', '2017-06-28 11:20:25');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'xinchen', '0', null, '1007', '2017-06-28 11:20:30');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:20:35');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'xinchen', '0', null, '1000', '2017-06-28 11:20:40');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:20:45');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'xinchen', '0', null, '1017', '2017-06-28 11:20:50');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:20:55');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:21:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:21:05');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'xinchen', '0', null, '1026', '2017-06-28 11:21:10');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:21:15');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:21:20');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:21:25');
INSERT INTO `schedule_job_log` VALUES ('23', '2', 'testTask', 'test2', null, '0', null, '21', '2017-06-28 11:23:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:23:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:23:05');
INSERT INTO `schedule_job_log` VALUES ('26', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:23:07');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:23:10');
INSERT INTO `schedule_job_log` VALUES ('28', '2', 'testTask', 'test2', null, '0', null, '12', '2017-06-28 11:23:14');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'test', 'xinchen', '0', null, '1015', '2017-06-28 11:23:15');
INSERT INTO `schedule_job_log` VALUES ('30', '2', 'testTask', 'test2', null, '0', null, '5', '2017-06-28 11:23:21');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'test', 'xinchen', '0', null, '1012', '2017-06-28 11:23:20');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'test', 'xinchen', '0', null, '1005', '2017-06-28 11:23:25');
INSERT INTO `schedule_job_log` VALUES ('33', '2', 'testTask', 'test2', null, '0', null, '11', '2017-06-28 11:23:28');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:23:30');
INSERT INTO `schedule_job_log` VALUES ('35', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:23:35');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:23:35');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:23:40');
INSERT INTO `schedule_job_log` VALUES ('38', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:23:42');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:23:45');
INSERT INTO `schedule_job_log` VALUES ('40', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:23:49');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'test', 'xinchen', '0', null, '1032', '2017-06-28 11:23:50');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:23:55');
INSERT INTO `schedule_job_log` VALUES ('43', '2', 'testTask', 'test2', null, '0', null, '19', '2017-06-28 11:23:56');
INSERT INTO `schedule_job_log` VALUES ('44', '2', 'testTask', 'test2', null, '0', null, '7', '2017-06-28 11:24:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'test', 'xinchen', '0', null, '1019', '2017-06-28 11:24:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:24:05');
INSERT INTO `schedule_job_log` VALUES ('47', '2', 'testTask', 'test2', null, '0', null, '10', '2017-06-28 11:24:07');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'test', 'xinchen', '0', null, '1006', '2017-06-28 11:24:10');
INSERT INTO `schedule_job_log` VALUES ('49', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:24:14');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'test', 'xinchen', '0', null, '1006', '2017-06-28 11:24:15');
INSERT INTO `schedule_job_log` VALUES ('51', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:24:21');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:24:20');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'test', 'xinchen', '0', null, '1007', '2017-06-28 11:24:25');
INSERT INTO `schedule_job_log` VALUES ('54', '2', 'testTask', 'test2', null, '0', null, '34', '2017-06-28 11:24:28');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'test', 'xinchen', '0', null, '1005', '2017-06-28 11:24:30');
INSERT INTO `schedule_job_log` VALUES ('56', '2', 'testTask', 'test2', null, '0', null, '9', '2017-06-28 11:24:35');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:24:35');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'test', 'xinchen', '0', null, '1005', '2017-06-28 11:24:40');
INSERT INTO `schedule_job_log` VALUES ('59', '2', 'testTask', 'test2', null, '0', null, '4', '2017-06-28 11:24:42');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:24:45');
INSERT INTO `schedule_job_log` VALUES ('61', '2', 'testTask', 'test2', null, '0', null, '6', '2017-06-28 11:24:49');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'test', 'xinchen', '0', null, '1009', '2017-06-28 11:24:50');
INSERT INTO `schedule_job_log` VALUES ('63', '2', 'testTask', 'test2', null, '0', null, '16', '2017-06-28 11:24:56');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'test', 'xinchen', '0', null, '1093', '2017-06-28 11:24:55');
INSERT INTO `schedule_job_log` VALUES ('65', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:25:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:25:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'test', 'xinchen', '0', null, '1011', '2017-06-28 11:25:05');
INSERT INTO `schedule_job_log` VALUES ('68', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:25:07');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'test', 'xinchen', '0', null, '1016', '2017-06-28 11:25:10');
INSERT INTO `schedule_job_log` VALUES ('70', '2', 'testTask', 'test2', null, '0', null, '5', '2017-06-28 11:25:14');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:25:15');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'test', 'xinchen', '0', null, '1016', '2017-06-28 11:25:20');
INSERT INTO `schedule_job_log` VALUES ('73', '2', 'testTask', 'test2', null, '0', null, '7', '2017-06-28 11:25:21');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:25:25');
INSERT INTO `schedule_job_log` VALUES ('75', '2', 'testTask', 'test2', null, '0', null, '5', '2017-06-28 11:25:28');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:25:30');
INSERT INTO `schedule_job_log` VALUES ('77', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:25:35');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'test', 'xinchen', '0', null, '1016', '2017-06-28 11:25:35');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:25:40');
INSERT INTO `schedule_job_log` VALUES ('80', '2', 'testTask', 'test2', null, '0', null, '8', '2017-06-28 11:25:42');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:25:45');
INSERT INTO `schedule_job_log` VALUES ('82', '2', 'testTask', 'test2', null, '0', null, '8', '2017-06-28 11:25:49');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:25:50');
INSERT INTO `schedule_job_log` VALUES ('84', '2', 'testTask', 'test2', null, '0', null, '16', '2017-06-28 11:25:56');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'test', 'xinchen', '0', null, '1007', '2017-06-28 11:25:55');
INSERT INTO `schedule_job_log` VALUES ('86', '2', 'testTask', 'test2', null, '0', null, '13', '2017-06-28 11:26:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:26:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'test', 'xinchen', '0', null, '1024', '2017-06-28 11:26:05');
INSERT INTO `schedule_job_log` VALUES ('89', '2', 'testTask', 'test2', null, '0', null, '5', '2017-06-28 11:26:07');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:26:10');
INSERT INTO `schedule_job_log` VALUES ('91', '2', 'testTask', 'test2', null, '0', null, '5', '2017-06-28 11:26:14');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:26:15');
INSERT INTO `schedule_job_log` VALUES ('93', '2', 'testTask', 'test2', null, '0', null, '29', '2017-06-28 11:26:21');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'test', 'xinchen', '0', null, '1036', '2017-06-28 11:26:20');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:26:25');
INSERT INTO `schedule_job_log` VALUES ('96', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:26:28');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'test', 'xinchen', '0', null, '1006', '2017-06-28 11:26:30');
INSERT INTO `schedule_job_log` VALUES ('98', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:26:35');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:26:35');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:26:40');
INSERT INTO `schedule_job_log` VALUES ('101', '2', 'testTask', 'test2', null, '0', null, '15', '2017-06-28 11:26:42');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'test', 'xinchen', '0', null, '1007', '2017-06-28 11:26:45');
INSERT INTO `schedule_job_log` VALUES ('103', '2', 'testTask', 'test2', null, '0', null, '9', '2017-06-28 11:26:49');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:26:50');
INSERT INTO `schedule_job_log` VALUES ('105', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:26:56');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:26:55');
INSERT INTO `schedule_job_log` VALUES ('107', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:27:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'test', 'xinchen', '0', null, '1013', '2017-06-28 11:27:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'test', 'xinchen', '0', null, '1005', '2017-06-28 11:27:05');
INSERT INTO `schedule_job_log` VALUES ('110', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:27:07');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:27:10');
INSERT INTO `schedule_job_log` VALUES ('112', '2', 'testTask', 'test2', null, '0', null, '10', '2017-06-28 11:27:14');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'test', 'xinchen', '0', null, '1010', '2017-06-28 11:27:15');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'test', 'xinchen', '0', null, '1009', '2017-06-28 11:27:20');
INSERT INTO `schedule_job_log` VALUES ('115', '2', 'testTask', 'test2', null, '0', null, '10', '2017-06-28 11:27:21');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:27:25');
INSERT INTO `schedule_job_log` VALUES ('117', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:27:28');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:27:30');
INSERT INTO `schedule_job_log` VALUES ('119', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:27:35');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:27:35');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:27:40');
INSERT INTO `schedule_job_log` VALUES ('122', '2', 'testTask', 'test2', null, '0', null, '6', '2017-06-28 11:27:42');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'test', 'xinchen', '0', null, '1014', '2017-06-28 11:27:45');
INSERT INTO `schedule_job_log` VALUES ('124', '2', 'testTask', 'test2', null, '0', null, '11', '2017-06-28 11:27:49');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:27:50');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'test', 'xinchen', '0', null, '1007', '2017-06-28 11:27:55');
INSERT INTO `schedule_job_log` VALUES ('127', '2', 'testTask', 'test2', null, '0', null, '13', '2017-06-28 11:27:56');
INSERT INTO `schedule_job_log` VALUES ('128', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:28:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'test', 'xinchen', '0', null, '1006', '2017-06-28 11:28:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:28:05');
INSERT INTO `schedule_job_log` VALUES ('131', '2', 'testTask', 'test2', null, '0', null, '6', '2017-06-28 11:28:07');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'test', 'xinchen', '0', null, '1007', '2017-06-28 11:28:10');
INSERT INTO `schedule_job_log` VALUES ('133', '2', 'testTask', 'test2', null, '0', null, '31', '2017-06-28 11:28:14');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'test', 'xinchen', '0', null, '1014', '2017-06-28 11:28:15');
INSERT INTO `schedule_job_log` VALUES ('135', '2', 'testTask', 'test2', null, '0', null, '11', '2017-06-28 11:28:21');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'test', 'xinchen', '0', null, '1018', '2017-06-28 11:28:20');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:28:25');
INSERT INTO `schedule_job_log` VALUES ('138', '2', 'testTask', 'test2', null, '0', null, '8', '2017-06-28 11:28:28');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:28:30');
INSERT INTO `schedule_job_log` VALUES ('140', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:28:35');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:28:35');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'test', 'xinchen', '0', null, '1006', '2017-06-28 11:28:40');
INSERT INTO `schedule_job_log` VALUES ('143', '2', 'testTask', 'test2', null, '0', null, '8', '2017-06-28 11:28:42');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'test', 'xinchen', '0', null, '1008', '2017-06-28 11:28:45');
INSERT INTO `schedule_job_log` VALUES ('145', '2', 'testTask', 'test2', null, '0', null, '8', '2017-06-28 11:28:49');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:28:50');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'test', 'xinchen', '0', null, '1012', '2017-06-28 11:28:55');
INSERT INTO `schedule_job_log` VALUES ('148', '2', 'testTask', 'test2', null, '0', null, '20', '2017-06-28 11:28:56');
INSERT INTO `schedule_job_log` VALUES ('149', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:29:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:29:00');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:29:05');
INSERT INTO `schedule_job_log` VALUES ('152', '2', 'testTask', 'test2', null, '0', null, '8', '2017-06-28 11:29:07');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:29:10');
INSERT INTO `schedule_job_log` VALUES ('154', '2', 'testTask', 'test2', null, '0', null, '15', '2017-06-28 11:29:14');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'test', 'xinchen', '0', null, '1012', '2017-06-28 11:29:15');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:29:20');
INSERT INTO `schedule_job_log` VALUES ('157', '2', 'testTask', 'test2', null, '0', null, '39', '2017-06-28 11:29:21');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:29:25');
INSERT INTO `schedule_job_log` VALUES ('159', '2', 'testTask', 'test2', null, '0', null, '4', '2017-06-28 11:29:28');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'test', 'xinchen', '0', null, '1009', '2017-06-28 11:29:30');
INSERT INTO `schedule_job_log` VALUES ('161', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:29:35');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:29:35');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'test', 'xinchen', '0', null, '1021', '2017-06-28 11:29:40');
INSERT INTO `schedule_job_log` VALUES ('164', '2', 'testTask', 'test2', null, '0', null, '2', '2017-06-28 11:29:42');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'test', 'xinchen', '0', null, '1016', '2017-06-28 11:29:45');
INSERT INTO `schedule_job_log` VALUES ('166', '2', 'testTask', 'test2', null, '0', null, '4', '2017-06-28 11:29:49');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:29:50');
INSERT INTO `schedule_job_log` VALUES ('168', '2', 'testTask', 'test2', null, '0', null, '4', '2017-06-28 11:29:56');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'test', 'xinchen', '0', null, '1010', '2017-06-28 11:29:55');
INSERT INTO `schedule_job_log` VALUES ('170', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'test', 'xinchen', '0', null, '1008', '2017-06-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'test', 'xinchen', '0', null, '1024', '2017-06-28 11:30:05');
INSERT INTO `schedule_job_log` VALUES ('173', '2', 'testTask', 'test2', null, '0', null, '13', '2017-06-28 11:30:07');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'test', 'xinchen', '0', null, '1013', '2017-06-28 11:30:10');
INSERT INTO `schedule_job_log` VALUES ('175', '2', 'testTask', 'test2', null, '0', null, '5', '2017-06-28 11:30:14');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'test', 'xinchen', '0', null, '1005', '2017-06-28 11:30:15');
INSERT INTO `schedule_job_log` VALUES ('177', '2', 'testTask', 'test2', null, '0', null, '7', '2017-06-28 11:30:21');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'test', 'xinchen', '0', null, '1024', '2017-06-28 11:30:20');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:30:25');
INSERT INTO `schedule_job_log` VALUES ('180', '2', 'testTask', 'test2', null, '0', null, '12', '2017-06-28 11:30:28');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:30:30');
INSERT INTO `schedule_job_log` VALUES ('182', '2', 'testTask', 'test2', null, '0', null, '4', '2017-06-28 11:30:35');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:30:35');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:30:40');
INSERT INTO `schedule_job_log` VALUES ('185', '2', 'testTask', 'test2', null, '0', null, '12', '2017-06-28 11:30:42');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'test', 'xinchen', '0', null, '1013', '2017-06-28 11:30:45');
INSERT INTO `schedule_job_log` VALUES ('187', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:30:49');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:30:50');
INSERT INTO `schedule_job_log` VALUES ('189', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:30:56');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'test', 'xinchen', '0', null, '1015', '2017-06-28 11:30:55');
INSERT INTO `schedule_job_log` VALUES ('191', '2', 'testTask', 'test2', null, '0', null, '8', '2017-06-28 11:31:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:31:00');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'test', 'xinchen', '0', null, '1021', '2017-06-28 11:31:05');
INSERT INTO `schedule_job_log` VALUES ('194', '2', 'testTask', 'test2', null, '0', null, '7', '2017-06-28 11:31:07');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:31:10');
INSERT INTO `schedule_job_log` VALUES ('196', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:31:14');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'test', 'xinchen', '0', null, '1002', '2017-06-28 11:31:15');
INSERT INTO `schedule_job_log` VALUES ('198', '2', 'testTask', 'test2', null, '0', null, '5', '2017-06-28 11:31:21');
INSERT INTO `schedule_job_log` VALUES ('199', '1', 'testTask', 'test', 'xinchen', '0', null, '1012', '2017-06-28 11:31:20');
INSERT INTO `schedule_job_log` VALUES ('200', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:31:25');
INSERT INTO `schedule_job_log` VALUES ('201', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:31:28');
INSERT INTO `schedule_job_log` VALUES ('202', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:31:30');
INSERT INTO `schedule_job_log` VALUES ('203', '2', 'testTask', 'test2', null, '0', null, '11', '2017-06-28 11:31:35');
INSERT INTO `schedule_job_log` VALUES ('204', '1', 'testTask', 'test', 'xinchen', '0', null, '1009', '2017-06-28 11:31:35');
INSERT INTO `schedule_job_log` VALUES ('205', '1', 'testTask', 'test', 'xinchen', '0', null, '1007', '2017-06-28 11:31:40');
INSERT INTO `schedule_job_log` VALUES ('206', '2', 'testTask', 'test2', null, '0', null, '10', '2017-06-28 11:31:42');
INSERT INTO `schedule_job_log` VALUES ('207', '1', 'testTask', 'test', 'xinchen', '0', null, '1005', '2017-06-28 11:31:45');
INSERT INTO `schedule_job_log` VALUES ('208', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:31:49');
INSERT INTO `schedule_job_log` VALUES ('209', '1', 'testTask', 'test', 'xinchen', '0', null, '1004', '2017-06-28 11:31:50');
INSERT INTO `schedule_job_log` VALUES ('210', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:31:56');
INSERT INTO `schedule_job_log` VALUES ('211', '1', 'testTask', 'test', 'xinchen', '0', null, '1010', '2017-06-28 11:31:55');
INSERT INTO `schedule_job_log` VALUES ('212', '2', 'testTask', 'test2', null, '0', null, '0', '2017-06-28 11:32:00');
INSERT INTO `schedule_job_log` VALUES ('213', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:32:00');
INSERT INTO `schedule_job_log` VALUES ('214', '1', 'testTask', 'test', 'xinchen', '0', null, '1003', '2017-06-28 11:32:05');
INSERT INTO `schedule_job_log` VALUES ('215', '2', 'testTask', 'test2', null, '0', null, '5', '2017-06-28 11:32:07');
INSERT INTO `schedule_job_log` VALUES ('216', '1', 'testTask', 'test', 'xinchen', '0', null, '1016', '2017-06-28 11:32:10');
INSERT INTO `schedule_job_log` VALUES ('217', '2', 'testTask', 'test2', null, '0', null, '9', '2017-06-28 11:32:14');
INSERT INTO `schedule_job_log` VALUES ('218', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:32:15');
INSERT INTO `schedule_job_log` VALUES ('219', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:32:21');
INSERT INTO `schedule_job_log` VALUES ('220', '1', 'testTask', 'test', 'xinchen', '0', null, '1029', '2017-06-28 11:32:20');
INSERT INTO `schedule_job_log` VALUES ('221', '1', 'testTask', 'test', 'xinchen', '0', null, '1005', '2017-06-28 11:32:25');
INSERT INTO `schedule_job_log` VALUES ('222', '2', 'testTask', 'test2', null, '0', null, '3', '2017-06-28 11:32:28');
INSERT INTO `schedule_job_log` VALUES ('223', '1', 'testTask', 'test', 'xinchen', '0', null, '1007', '2017-06-28 11:32:30');
INSERT INTO `schedule_job_log` VALUES ('224', '2', 'testTask', 'test2', null, '0', null, '1', '2017-06-28 11:32:35');
INSERT INTO `schedule_job_log` VALUES ('225', '1', 'testTask', 'test', 'xinchen', '0', null, '1001', '2017-06-28 11:32:35');

-- ----------------------------
-- Table structure for start_user
-- ----------------------------
DROP TABLE IF EXISTS `start_user`;
CREATE TABLE `start_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of start_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'sys/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
