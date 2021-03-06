CREATE TABLE `app_user` (
`user_id` bigint(20) NOT NULL,
`username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
`mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
`password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间',
PRIMARY KEY (`user_id`) ,
UNIQUE INDEX `username` (`username`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='第三方应用用户';

CREATE TABLE `qrtz_blob_triggers` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`BLOB_DATA` blob NULL,
PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ,
INDEX `SCHED_NAME` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_calendars` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`CALENDAR` blob NOT NULL,
PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_cron_triggers` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_fired_triggers` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`FIRED_TIME` bigint(13) NOT NULL,
`SCHED_TIME` bigint(13) NOT NULL,
`PRIORITY` int(11) NOT NULL,
`STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) ,
INDEX `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`, `INSTANCE_NAME`),
INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`),
INDEX `IDX_QRTZ_FT_J_G` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`),
INDEX `IDX_QRTZ_FT_JG` (`SCHED_NAME`, `JOB_GROUP`),
INDEX `IDX_QRTZ_FT_T_G` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
INDEX `IDX_QRTZ_FT_TG` (`SCHED_NAME`, `TRIGGER_GROUP`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_job_details` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`JOB_DATA` blob NULL,
PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ,
INDEX `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`, `REQUESTS_RECOVERY`),
INDEX `IDX_QRTZ_J_GRP` (`SCHED_NAME`, `JOB_GROUP`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_locks` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_paused_trigger_grps` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_scheduler_state` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`LAST_CHECKIN_TIME` bigint(13) NOT NULL,
`CHECKIN_INTERVAL` bigint(13) NOT NULL,
PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_simple_triggers` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`REPEAT_COUNT` bigint(7) NOT NULL,
`REPEAT_INTERVAL` bigint(12) NOT NULL,
`TIMES_TRIGGERED` bigint(10) NOT NULL,
PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_simprop_triggers` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`INT_PROP_1` int(11) NULL DEFAULT NULL,
`INT_PROP_2` int(11) NULL DEFAULT NULL,
`LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
`LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
`DEC_PROP_1` decimal(13,4) NULL DEFAULT NULL,
`DEC_PROP_2` decimal(13,4) NULL DEFAULT NULL,
`BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `qrtz_triggers` (
`SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
`PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
`PRIORITY` int(11) NULL DEFAULT NULL,
`TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`START_TIME` bigint(13) NOT NULL,
`END_TIME` bigint(13) NULL DEFAULT NULL,
`CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
`JOB_DATA` blob NULL,
PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ,
INDEX `IDX_QRTZ_T_J` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`),
INDEX `IDX_QRTZ_T_JG` (`SCHED_NAME`, `JOB_GROUP`),
INDEX `IDX_QRTZ_T_C` (`SCHED_NAME`, `CALENDAR_NAME`),
INDEX `IDX_QRTZ_T_G` (`SCHED_NAME`, `TRIGGER_GROUP`),
INDEX `IDX_QRTZ_T_STATE` (`SCHED_NAME`, `TRIGGER_STATE`),
INDEX `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`),
INDEX `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`),
INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`, `NEXT_FIRE_TIME`),
INDEX `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`),
INDEX `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`),
INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`),
INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `schedule_job` (
`job_id` bigint(20) NOT NULL COMMENT '任务id',
`bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
`method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
`params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
`cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
`status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
`remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间',
PRIMARY KEY (`job_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='定时任务';

CREATE TABLE `schedule_job_log` (
`log_id` bigint(20) NOT NULL COMMENT '任务日志id',
`job_id` bigint(20) NOT NULL COMMENT '任务id',
`bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
`method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
`params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
`status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
`error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败信息',
`times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
`create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
PRIMARY KEY (`log_id`) ,
UNIQUE INDEX `log_id` (`log_id`),
INDEX `log_job` (`job_id`, `log_id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='定时任务日志';

CREATE TABLE `sys_config` (
`id` bigint(20) NOT NULL,
`key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
`value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
`status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP',
PRIMARY KEY (`id`) ,
UNIQUE INDEX `key` (`key`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统配置信息表';

CREATE TABLE `sys_dept` (
`dept_id` bigint(20) NOT NULL,
`parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
`name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
`manager` bigint(20) NULL DEFAULT NULL COMMENT '部门负责人',
`order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
`del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP',
PRIMARY KEY (`dept_id`) ,
UNIQUE INDEX `dept_id` (`dept_id`),
INDEX `parent_id` (`parent_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='部门管理';

CREATE TABLE `sys_dic` (
`id` bigint(20) NOT NULL,
`name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
`code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码',
`value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项-值',
`text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项',
`type` tinyint(11) NULL DEFAULT 0 COMMENT '类型 0：目录，1：字典，2：字典项',
`parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级目录Id',
`sort_no` int(2) NULL DEFAULT NULL COMMENT '排序',
`editable` tinyint(1) NULL DEFAULT 1 COMMENT '是否可编辑。1：是。0：否',
`enable` tinyint(1) NULL DEFAULT 1 COMMENT '状态。1启用。0禁用',
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
`update_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '更新时间',
PRIMARY KEY (`id`) ,
UNIQUE INDEX `field_id` (`id`),
UNIQUE INDEX `field_code` (`code`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='数据字典明细';

CREATE TABLE `sys_log` (
`id` bigint(20) NOT NULL,
`username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
`operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
`method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
`params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
`result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
`time` bigint(20) NULL DEFAULT NULL COMMENT '执行时长(毫秒)',
`ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
`create_date` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间',
PRIMARY KEY (`id`) ,
UNIQUE INDEX `index_id` (`id`),
INDEX `id_status` (`id`, `status`),
INDEX `createTime` (`id`, `create_date`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统日志';

CREATE TABLE `sys_menu` (
`menu_id` bigint(20) NOT NULL,
`parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
`name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
`url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
`perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
`params` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展参数,如:动态列',
`type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
`icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
`order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP',
PRIMARY KEY (`menu_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='菜单管理';

CREATE TABLE `sys_oss` (
`id` bigint(20) NOT NULL,
`name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
`url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
`creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
`create_date` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间',
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='文件上传';

CREATE TABLE `sys_role` (
`role_id` bigint(20) NOT NULL,
`role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
`remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
`dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间',
PRIMARY KEY (`role_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色';

CREATE TABLE `sys_role_dept` (
`id` bigint(20) NOT NULL,
`role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
`dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP',
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色与部门对应关系';

CREATE TABLE `sys_role_menu` (
`id` bigint(20) NOT NULL,
`role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
`menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP',
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色与菜单对应关系';

CREATE TABLE `sys_user` (
`user_id` bigint(20) NOT NULL,
`username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
`password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
`salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
`email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
`mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
`status` bit(1) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
`dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
`position` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT '创建时间',
PRIMARY KEY (`user_id`) ,
UNIQUE INDEX `username` (`username`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统用户';

CREATE TABLE `sys_user_role` (
`id` bigint(20) NOT NULL,
`user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
`role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
`create_time` timestamp NULL DEFAULT 'CURRENT_TIMESTAMP',
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户与角色对应关系';


ALTER TABLE `qrtz_blob_triggers` ADD CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
ALTER TABLE `qrtz_cron_triggers` ADD CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
ALTER TABLE `qrtz_simple_triggers` ADD CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
ALTER TABLE `qrtz_simprop_triggers` ADD CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
ALTER TABLE `qrtz_triggers` ADD CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`);

