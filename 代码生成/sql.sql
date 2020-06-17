/*
MySQL Backup
Source Server Version: 5.7.29
Source Database: moss_eaccount
Date: 2020/6/17 10:08:16
*/

SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
--  Table structure for `manage_config`
-- ----------------------------
DROP TABLE IF EXISTS `manage_config`;
CREATE TABLE `manage_config` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `group_name` varchar(255) NOT NULL COMMENT '参数组',
  `name` varchar(255) NOT NULL COMMENT '参数名称',
  `value` varchar(255) NOT NULL COMMENT '参数值',
  `des` varchar(255) NOT NULL COMMENT '描述',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manage_gen_attr`
-- ----------------------------
DROP TABLE IF EXISTS `manage_gen_attr`;
CREATE TABLE `manage_gen_attr` (
  `id` varchar(32) NOT NULL,
  `jdbc_name` varchar(255) NOT NULL,
  `java_name` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `java_type` varchar(255) NOT NULL,
  `is_insert` char(1) NOT NULL,
  `is_update` char(1) NOT NULL,
  `is_list` char(1) NOT NULL,
  `is_query` char(1) NOT NULL,
  `weight` int(11) NOT NULL,
  `code_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manage_gen_code`
-- ----------------------------
DROP TABLE IF EXISTS `manage_gen_code`;
CREATE TABLE `manage_gen_code` (
  `id` varchar(32) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `entity_name` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `data_table` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manage_ip_schedule_task`
-- ----------------------------
DROP TABLE IF EXISTS `manage_ip_schedule_task`;
CREATE TABLE `manage_ip_schedule_task` (
  `id` char(36) NOT NULL COMMENT 'id',
  `task_code` varchar(100) NOT NULL COMMENT '任务名称编码',
  `task_name` varchar(100) NOT NULL COMMENT '任务名',
  `task_conf` varchar(100) NOT NULL COMMENT '任务执行表达式',
  `task_class` varchar(100) NOT NULL COMMENT '任务执行类',
  `task_server_ip` varchar(100) NOT NULL COMMENT '任务执行的服务器',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '任务状态0:启用;1：禁用',
  `remark` varchar(250) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统运行调度表';

-- ----------------------------
--  Table structure for `manage_log_info`
-- ----------------------------
DROP TABLE IF EXISTS `manage_log_info`;
CREATE TABLE `manage_log_info` (
  `id` varchar(36) NOT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ip_address` varchar(16) DEFAULT NULL COMMENT 'ip地址',
  `log_level` varchar(16) DEFAULT NULL COMMENT '日志级别',
  `message` varchar(256) DEFAULT NULL COMMENT '日志信息',
  `user_name` varchar(36) DEFAULT NULL COMMENT '操作员名称',
  `user_id` varchar(36) DEFAULT NULL COMMENT '操作员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='日志记录表';

-- ----------------------------
--  Table structure for `manage_menu`
-- ----------------------------
DROP TABLE IF EXISTS `manage_menu`;
CREATE TABLE `manage_menu` (
  `id` varchar(32) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `sn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `manage_menu_resources`
-- ----------------------------
DROP TABLE IF EXISTS `manage_menu_resources`;
CREATE TABLE `manage_menu_resources` (
  `menu_id` varchar(32) DEFAULT NULL,
  `resources_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `manage_organization`
-- ----------------------------
DROP TABLE IF EXISTS `manage_organization`;
CREATE TABLE `manage_organization` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '机构唯一标识',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `weight` int(11) DEFAULT NULL COMMENT '优先级',
  `pid` varchar(36) DEFAULT NULL COMMENT '父机构id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='机构表';

-- ----------------------------
--  Table structure for `manage_resources`
-- ----------------------------
DROP TABLE IF EXISTS `manage_resources`;
CREATE TABLE `manage_resources` (
  `id` varchar(32) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `manage_role`
-- ----------------------------
DROP TABLE IF EXISTS `manage_role`;
CREATE TABLE `manage_role` (
  `id` varchar(36) NOT NULL COMMENT '角色唯一标识',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `name` varchar(36) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
--  Table structure for `manage_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `manage_role_menu`;
CREATE TABLE `manage_role_menu` (
  `role_id` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `manage_user_account`
-- ----------------------------
DROP TABLE IF EXISTS `manage_user_account`;
CREATE TABLE `manage_user_account` (
  `id` varchar(36) NOT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(32) NOT NULL COMMENT '加密盐值',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:正常;  1：停用',
  `account` varchar(32) NOT NULL COMMENT '账号',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `mobilephone` varchar(20) DEFAULT NULL COMMENT '手机',
  `role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `mobilephone` (`mobilephone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `manage_user_profile`
-- ----------------------------
DROP TABLE IF EXISTS `manage_user_profile`;
CREATE TABLE `manage_user_profile` (
  `id` varchar(36) NOT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '用户姓名',
  `introduce` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `telephone` varchar(32) DEFAULT NULL COMMENT '工作电话',
  `mobilephone` varchar(20) DEFAULT NULL COMMENT '移动电话',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `gender` varchar(4) DEFAULT '' COMMENT '性别',
  `starff_id` varchar(36) DEFAULT NULL COMMENT '员工号',
  `position` varchar(36) DEFAULT NULL COMMENT '职位',
  `type` varchar(255) DEFAULT 'import' COMMENT '用户类型，import,ldap，register',
  `org_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户资料表';

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `manage_config` VALUES ('417b11eb44be47bd9814e12f428ebfd2','sex','保密','0','性别保密','0'), ('8b1cd597be9d44df8bb3bad427a6a4e6','sex','男','1','性别男','0'), ('dd3fae3d4f664336902216e599770412','sex','女','2','性别女','0');
INSERT INTO `manage_gen_attr` VALUES ('00afb9eecb054e9eb43b8eea0f76c8d6','area_id','areaId','','Long','1','1','1','0','0','1b34fd468d684b9194d205e4f1353c0d'), ('02d7f03b53e048f4a3df14f25170e790','group_name','groupName','参数组','String','1','1','1','1','0','24b0b996847942528f5a78c806ad2db9'), ('06a07a6730bc4a63b7c8589d38c698e0','question_source','questionSource','问题来源','String','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('0c2309471eba46a8908144d894b33bd5','file_suffix','fileSuffix','后缀名','String','1','1','1','0','0','f783b6d9dd88470cb867e71e37e67449'), ('0efec278d4c34b00bd609ed6709e6405','status','status','状态','String','0','1','1','0','0','24b0b996847942528f5a78c806ad2db9'), ('12d484ad84df4a7c96f34a5d02defc97','des','des','描述','String','1','1','1','0','0','24b0b996847942528f5a78c806ad2db9'), ('1a53ab042f6a452a8af0aa872d25d64a','area_code','areaCode','所属区域','String','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('1ef196a2cea64d308d97a812c29eabd6','case_no','caseNo','案卷编号','String','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('25bfd972ccc5472ba57a66799dfa96cc','assign_user_id','assignUserId','指派人id','String','1','1','1','0','0','c6eb3cd3c8c84b26ac7cc46e6b164d0d'), ('2c98b1bce6ab49c293d4afc84abc134a','case_no','caseNo','案卷编号','String','1','1','1','0','0','f783b6d9dd88470cb867e71e37e67449'), ('31d18616140046269274bbe13966ed05','case_no','caseNo','案卷编号','String','1','1','1','0','0','c6eb3cd3c8c84b26ac7cc46e6b164d0d'), ('3547483c8fe545358a7ba36a05e41953','update_time','updateTime','','java.util.Date','1','1','1','0','0','c6eb3cd3c8c84b26ac7cc46e6b164d0d'), ('369b5366770944ce8d6bbf0c2fe72c79','id','id','文档id','Integer','1','0','0','0','0','f783b6d9dd88470cb867e71e37e67449'), ('3c70a56568ed42628db901b084c85024','deleted','deleted','删除：0-未删除 1-删除','Integer','1','1','1','0','0','1b34fd468d684b9194d205e4f1353c0d'), ('3cd9ec056628441d94257b8aac2bceef','deleted','deleted','删除：0-未删除 1-删除','Integer','1','1','1','0','0','f783b6d9dd88470cb867e71e37e67449'), ('3d911f6e1607403184fccdbdca17a5ef','assign_user_name','assignUserName','指派人姓名','String','1','1','1','0','0','c6eb3cd3c8c84b26ac7cc46e6b164d0d'), ('3ed1031d454e41b380396fd12e55cf46','status','status','案件状态：0-待派发 1-待处理','Integer','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('446d28cf5b294612a312d355731ad73e','user_id','userId','','String','1','1','1','0','0','1b34fd468d684b9194d205e4f1353c0d'), ('45ee7e7876a04a548d6041a2fac209ff','create_time','createTime','','java.util.Date','1','1','1','0','0','86bc7c4cec624bfd87273498d1665eb9'), ('4c1b66bc175c4b288db5ae2faf67c540','update_time','updateTime','','java.util.Date','1','1','1','0','0','2fd3a8cd58f540db8f160abb4cb3ade6'), ('53b49271b22849a6b2871eebc6b84a84','position_code','positionCode','案件坐标：当前巡查员所在位置','String','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('54dca34b92284d44b7ee12b6922c5c49','id','id','标识id','Integer','1','0','0','0','0','86bc7c4cec624bfd87273498d1665eb9'), ('63a53ba570c84d789c5ae7a841ab0fb0','name','name','参数名称','String','1','1','1','1','0','24b0b996847942528f5a78c806ad2db9'), ('678cc92d25bf4ae98695fa0422dc7b8d','parent_area_id','parentAreaId','','Integer','1','1','1','0','0','2fd3a8cd58f540db8f160abb4cb3ade6'), ('6daa8127371e4844b5486190cf876538','type','type','案件类别: CASE_TYPE ,案件等级：CASE_LEVEL','String','1','1','1','0','0','86bc7c4cec624bfd87273498d1665eb9'), ('6e1d0f18f14d4fe0b6e95a20809a04fb','Inspector','Inspector','巡查员：当前登陆用户','String','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('707d1d501a4b4461aa1876db3ecaa708','file_name','fileName','文件名','String','1','1','1','0','0','f783b6d9dd88470cb867e71e37e67449'), ('7477a13ca8ae4ea1a42bf1ef9503fcc0','assign_time','assignTime','指派时间','java.util.Date','1','1','1','0','0','c6eb3cd3c8c84b26ac7cc46e6b164d0d'), ('7a1040a15d8a4ae4a789ae3bdf7aa536','id','id','','Long','1','0','0','0','0','1b34fd468d684b9194d205e4f1353c0d'), ('7a3350e1b6004f51b7cc691fab5da25d','value','value','参数值','String','1','1','1','0','0','24b0b996847942528f5a78c806ad2db9'), ('7aef4a9dde724203aa39bb5e7c15bd8a','accept_time','acceptTime','受理时间','java.util.Date','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('7b0351fa26cb49d79e9f30837dfc28de','id','id','案卷id','Long','1','0','0','0','0','d2c94b64316a4be2b3a69f0753873683'), ('7e1bc8abb62942c8ade7df6db3845d1a','file_url','fileUrl','附件地址','String','1','1','1','0','0','f783b6d9dd88470cb867e71e37e67449'), ('84d0e7ecd0a54195b5937f0deaa0068c','create_time','createTime','','java.util.Date','1','1','1','0','0','2fd3a8cd58f540db8f160abb4cb3ade6'), ('8ad55b7f7d9a472a87af8c34e2fa9e34','content','content','内容','String','1','1','1','0','0','86bc7c4cec624bfd87273498d1665eb9'), ('8f9d6fa6022b467085bb72f651aaeefc','id','id','ID','String','1','0','0','0','0','24b0b996847942528f5a78c806ad2db9'), ('93ac3acf06f74ba2ab713798186cc706','case_no','caseNo','案卷编号','String','1','1','1','0','0','2fd3a8cd58f540db8f160abb4cb3ade6'), ('99acf4cec5c148af81073f768e9b9176','code','code','区域编码','String','1','1','1','0','0','2fd3a8cd58f540db8f160abb4cb3ade6'), ('a37d2ca736d0408ba0b1542d53cccc53','type','type','案件类别：0-市容环境','Integer','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('a5dfc24727bd4f84bfcb43f1c02f7f73','sort','sort','排序','Integer','1','1','1','0','0','86bc7c4cec624bfd87273498d1665eb9'), ('aa104f83d71f47efbdf89565485cde88','create_time','createTime','','java.util.Date','1','1','1','0','0','f783b6d9dd88470cb867e71e37e67449'), ('aa2d030847f94611b55fa3624028f282','question_desc','questionDesc','问题描述','String','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('ac6b1b3c36a841208e2302e704643012','update_time','updateTime','','java.util.Date','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('acafe7418005424b9dce28d38fa7a5f2','id','id','','Integer','1','0','0','0','0','c6eb3cd3c8c84b26ac7cc46e6b164d0d'), ('babbca36ee944bc3942c2bc24b884702','deleted','deleted','删除：0-未删除 1-删除','Integer','1','1','1','0','0','86bc7c4cec624bfd87273498d1665eb9'), ('bc1839e420e04de9be2e8e4779d6eecf','name','name','区域名称','String','1','1','1','0','0','2fd3a8cd58f540db8f160abb4cb3ade6'), ('bed064397ce24d23926f3dbea1ceb218','create_time','createTime','','java.util.Date','1','1','1','0','0','c6eb3cd3c8c84b26ac7cc46e6b164d0d'), ('c5000e78e3f74ab7a5dc3faa2add5f24','create_time','createTime','','java.util.Date','1','1','1','0','0','1b34fd468d684b9194d205e4f1353c0d'), ('cb36188d910c424793b0c8c4d425d801','create_time','createTime','','java.util.Date','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('d628ad2b7a694a97a7c1376a59223283','remark','remark','备注','String','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('db0eeecad30740a29696df0066c9c11c','update_time','updateTime','','java.util.Date','1','1','1','0','0','1b34fd468d684b9194d205e4f1353c0d'), ('dd08ad72bcb14c9daedbae90307de0d7','update_time','updateTime','','java.util.Date','1','1','1','0','0','86bc7c4cec624bfd87273498d1665eb9'), ('dfc86f45fb534fc7a7195f9626614a81','update_time','updateTime','','java.util.Date','1','1','1','0','0','f783b6d9dd88470cb867e71e37e67449'), ('e4aeeaeb54e94ef1bc23ee577581c70b','deleted','deleted','删除：0-未删除 1-删除','Integer','1','1','1','0','0','c6eb3cd3c8c84b26ac7cc46e6b164d0d'), ('e699c4fa97e4474ebfd13c54940ee128','id','id','区域id','Integer','1','0','0','0','0','2fd3a8cd58f540db8f160abb4cb3ade6'), ('e79795e08f2a4dfca90b68de9e989c73','position','position','案件位置','String','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('eda96aa57d1d49368093208aaa045f92','deleted','deleted','删除：0-未删除 1-删除','Integer','1','1','1','0','0','2fd3a8cd58f540db8f160abb4cb3ade6'), ('f53b2f8cbfd24a5d80e3d67f6c93b4dc','deleted','deleted','删除：0-未删除 1-删除','Integer','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683'), ('f7ab1a1e2a7143c58f41f128c847df57','level','level','案件等级','Integer','1','1','1','0','0','d2c94b64316a4be2b3a69f0753873683');
INSERT INTO `manage_gen_code` VALUES ('1b34fd468d684b9194d205e4f1353c0d','com.ucsmy.eaccount.digitalCity','UserArea','case/userArea','user_area'), ('24b0b996847942528f5a78c806ad2db9','com.ucsmy.ucas.manage','ManageConfig','sys/config','manage_config'), ('2fd3a8cd58f540db8f160abb4cb3ade6','com.ucsmy.eaccount.digitalCity','CaseArea','case/area','case_area'), ('86bc7c4cec624bfd87273498d1665eb9','com.ucsmy.eaccount.digitalCity','Identification','case/identification','case_identification'), ('c6eb3cd3c8c84b26ac7cc46e6b164d0d','com.ucsmy.eaccount.digitalCity','CaseAssign','case/assign','case_assign'), ('d2c94b64316a4be2b3a69f0753873683','com.ucsmy.eaccount.digitalCity','CaseInfo','case/info','case_info'), ('f783b6d9dd88470cb867e71e37e67449','com.ucsmy.eaccount.digitalCity','CaseFile','case/file','case_file');
INSERT INTO `manage_ip_schedule_task` VALUES ('bfa9a82dac6546a1ab053bdb9134766c','333','22','111','11','11','0','222'), ('DEFAULT','DEFAULT','DEFAULT','0/5 * * * * ?','com.ucsmy.ucas.config.quartz.scan.DefaultScanJob','127.0.0.1','0','DEFAULT');
INSERT INTO `manage_menu` VALUES ('00ca804b344e422a8b13ed29b6aa38d6','密码修改','unlock','/personal/updatePasswordPage','c6bf4fb3577c4a8b8603bf0840b98d95','10',NULL), ('062e011b73764d84b680072e8ceef059','修改',NULL,NULL,'32c4a686c1984b7a99875e38a30d15c6','3','sys_schedule_update'), ('169ec0dbb25a4226be60c1d9f2607c03','删除',NULL,NULL,'32c4a686c1984b7a99875e38a30d15c6','4','sys_schedule_delete'), ('1b16caa00b564127be74100b414e4b66','菜单管理','appstore-o','/sys/menu','3cebad1606944d29b137fdb97b032bd5','9',NULL), ('1ed3e6e440b943aeb2abb60a3918ac38','角色管理','team','/sys/role','3cebad1606944d29b137fdb97b032bd5','8',NULL), ('2490d124b960432eab79ebaef6b388b8','用户下线',NULL,NULL,'39f61e75b9844f108b1b88bc8342c60c','6','sys_user_shotOff'), ('24a7eadfcaf44529888068cb8c2c9b10','主页','home','/index','c6bf4fb3577c4a8b8603bf0840b98d95','1',NULL), ('2a3ad53f3f1a4957820847db38470431','案件派遣','file-ppt','/case/info','736afe1adca94eacb01e054722214854','12',NULL), ('2b9da713c9744fa2a3bdc892ce49291e','新增',NULL,NULL,'4a1869a6b6e74303a28cbafe075a742a','2','sys_res_save'), ('2fb6bf25c7e943e49dee3698ce5543e4','修改',NULL,NULL,'39f61e75b9844f108b1b88bc8342c60c','3','sys_user_update'), ('32c4a686c1984b7a99875e38a30d15c6','定时任务','tool','/sys/schedule','3cebad1606944d29b137fdb97b032bd5','25',NULL), ('39f61e75b9844f108b1b88bc8342c60c','用户管理','user','/sys/user','3cebad1606944d29b137fdb97b032bd5','7',NULL), ('3acea48774ce44c3b8cc17f95fb7bb0c','列表',NULL,'sys_config_list','7371afdec02a4e29947de9a8f9375431','1',NULL), ('3cebad1606944d29b137fdb97b032bd5','系统管理','setting','/sys',NULL,'100',NULL), ('418c0c56bfb6407a963ffcdb7bfb1301','代码生成','printer','/sys/gen','3cebad1606944d29b137fdb97b032bd5','999','sys_gen'), ('4794b2418fe84f4b892e131352315352','列表',NULL,NULL,'39f61e75b9844f108b1b88bc8342c60c','1','sys_user_list'), ('47c592d4e5cb4819b9a5947f923b183b','列表',NULL,NULL,'4a1869a6b6e74303a28cbafe075a742a','1','sys_res_list'), ('4a1869a6b6e74303a28cbafe075a742a','资源管理','file','/sys/resources','3cebad1606944d29b137fdb97b032bd5','10',NULL), ('5a617ea94d274340878551487c8181b9','查看资源',NULL,NULL,'1b16caa00b564127be74100b414e4b66','6','sys_menu_queryRes'), ('5b590cb7206b4929acef947495431623','新增',NULL,NULL,'1ed3e6e440b943aeb2abb60a3918ac38','2','sys_role_save'), ('5e0e1e92ae2c4197ae18df6dd3853fde','删除',NULL,NULL,'8044eaa825d24476815967de374269a6','4','sys_config_delete'), ('5e96b0977aab426899f71abce4646d1b','修改资源',NULL,NULL,'1b16caa00b564127be74100b414e4b66','5','sys_menu_updateRes'), ('62f73b469b124d048235951c226c586d','修改权限',NULL,NULL,'1ed3e6e440b943aeb2abb60a3918ac38','5','sys_role_updateMenu'), ('64017011fcd64bf0930344ce43bb036c','列表',NULL,NULL,'1ed3e6e440b943aeb2abb60a3918ac38','1','sys_role_list'), ('648947b7ff41476d986e0fe9fb16f44b','删除',NULL,NULL,'1ed3e6e440b943aeb2abb60a3918ac38','4','sys_role_delete'), ('68c560db66f8490e98a99411af9a66eb','修改',NULL,NULL,'1b16caa00b564127be74100b414e4b66','3','sys_menu_update'), ('71bcf9713a9e4c67b4b136816db5be48','新增',NULL,NULL,'39f61e75b9844f108b1b88bc8342c60c','2','sys_user_save'), ('736afe1adca94eacb01e054722214854','案件管理','tool','/case',NULL,'41',NULL), ('73798cee46784a8a82b54c196f5eb671','删除',NULL,NULL,'4a1869a6b6e74303a28cbafe075a742a','4','sys_res_delete'), ('743fe1b276e84dbda943ec8f6bf1f246','修改密码',NULL,NULL,'39f61e75b9844f108b1b88bc8342c60c','5','sys_user_updatePwd'), ('7d3e170d207c4039a4f6e750d6769685','新增',NULL,NULL,'1b16caa00b564127be74100b414e4b66','2','sys_menu_save'), ('8044eaa825d24476815967de374269a6','参数管理','file-ppt','/sys/config','3cebad1606944d29b137fdb97b032bd5','15',NULL), ('840005766a744ff4baf90bb3cbb1acb5','修改',NULL,NULL,'8044eaa825d24476815967de374269a6','3','sys_config_update'), ('86f30bac074145b2acb56e4c3d25f072','列表',NULL,NULL,'1b16caa00b564127be74100b414e4b66','1','sys_menu_list'), ('8c8a96f7c8c243cca8ddc06e7eb4708f','案件处理','file','/case/endSuccess','736afe1adca94eacb01e054722214854','21',NULL), ('96fb9f435f5645f28a316e58e07de13b','删除',NULL,NULL,'d84b71f21b724d639b39852962f02b14','4','sys_org_delete'), ('980f633e7d9c47dda327f04859cbf7eb','修改',NULL,NULL,'1ed3e6e440b943aeb2abb60a3918ac38','3','sys_role_update'), ('9a5738d19a73476fb6d398ede9d2615b','新增',NULL,NULL,'32c4a686c1984b7a99875e38a30d15c6','2','sys_schedule_save'), ('9b0fbeb5382e4b6eb5b90d57e2d4dec3','删除',NULL,NULL,'39f61e75b9844f108b1b88bc8342c60c','4','sys_user_delete'), ('9ba4f09559a2481fac041bfd2d741092','查看权限',NULL,NULL,'1ed3e6e440b943aeb2abb60a3918ac38','6','sys_role_queryMenu'), ('a45a0e18b8ac425485e80517d47dd125','测试',NULL,NULL,'c6bf4fb3577c4a8b8603bf0840b98d95','20',NULL), ('a734d9fc485649b588ae24a34fe269ff','个人信息','user','/personal/userInfo','c6bf4fb3577c4a8b8603bf0840b98d95','5',NULL), ('af845523f100469cae8fc9c8383b19fe','新增',NULL,NULL,'8044eaa825d24476815967de374269a6','2','sys_config_save'), ('afb1154d42964745a08e37bac16b5571','新增',NULL,NULL,'d84b71f21b724d639b39852962f02b14','2','sys_org_save'), ('b3e8a2d7f364446d95e1b6ce2989b24b','我的待办','tool','/sys/backlog','3cebad1606944d29b137fdb97b032bd5','66',''), ('b69a9ad0c839433d8a36bb42a5f3fdd5','列表',NULL,NULL,'d84b71f21b724d639b39852962f02b14','1','sys_org_list'), ('b87bab3c425444279a1520974afef2dc','列表',NULL,NULL,'b3e8a2d7f364446d95e1b6ce2989b24b','1','sys_config_list'), ('c6bf4fb3577c4a8b8603bf0840b98d95','个人中心','home','/personal',NULL,'1',NULL), ('c7f08cfe9bed459997b5aed159dddda7','列表',NULL,NULL,'32c4a686c1984b7a99875e38a30d15c6','1','sys_schedule_list'), ('cded1dc7cbac4af4bf5a97626ffdb00e','测试',NULL,NULL,'c6bf4fb3577c4a8b8603bf0840b98d95','30',NULL), ('ce376afc8d914a62bee476c5a2430c29','列表',NULL,'','2a3ad53f3f1a4957820847db38470431','1','case_info_list'), ('d84b71f21b724d639b39852962f02b14','组织管理','flag','/sys/organization','3cebad1606944d29b137fdb97b032bd5','20',NULL), ('de45d34fb96c498da20376f02880b7df','修改',NULL,NULL,'d84b71f21b724d639b39852962f02b14','3','sys_org_update'), ('e1582ee102bb4ae99dae430ae1e47ec5','删除',NULL,NULL,'1b16caa00b564127be74100b414e4b66','4','sys_menu_delete'), ('e8623d3d4d39474cb6f77aa114aa54b9','网格管理','file','/case/area','736afe1adca94eacb01e054722214854','11',NULL), ('fb12b6d9454b42e293d726ef5c1aa5c9','列表',NULL,NULL,'8044eaa825d24476815967de374269a6','1','sys_config_list'), ('fd237a7d03aa46b09ff8728638b2215a','修改',NULL,NULL,'4a1869a6b6e74303a28cbafe075a742a','3','sys_res_update');
INSERT INTO `manage_menu_resources` VALUES ('a734d9fc485649b588ae24a34fe269ff','d1996765d70d40aab5721b70aa817fb3'), ('a734d9fc485649b588ae24a34fe269ff','a1d2206781aa469e9bba12e2b1e5edb2'), ('00ca804b344e422a8b13ed29b6aa38d6','4b47f11dddc7411a9c700bf0353f9ea6'), ('4794b2418fe84f4b892e131352315352','ced191f189464b86b1e877591dfcc884'), ('71bcf9713a9e4c67b4b136816db5be48','aa7d6ee5e3634a9f97864b53d2f653d5'), ('71bcf9713a9e4c67b4b136816db5be48','7215b5ef172f41ccb4616a38e8b6f555'), ('71bcf9713a9e4c67b4b136816db5be48','1fe3b9a250a249988b491fa396c21ca2'), ('2fb6bf25c7e943e49dee3698ce5543e4','421abd7bc9764546893d59e329e8307d'), ('2fb6bf25c7e943e49dee3698ce5543e4','04045a7f3bda445d96cee628bfd1acbb'), ('2fb6bf25c7e943e49dee3698ce5543e4','1fe3b9a250a249988b491fa396c21ca2'), ('2fb6bf25c7e943e49dee3698ce5543e4','aa7d6ee5e3634a9f97864b53d2f653d5'), ('9b0fbeb5382e4b6eb5b90d57e2d4dec3','da5d2f19d5f44d3c8a393ec632e15e9a'), ('743fe1b276e84dbda943ec8f6bf1f246','b956b8699fae4489a6d896be7be876e3'), ('2490d124b960432eab79ebaef6b388b8','187bbc928e2945b9a4d3e5315c4efc66'), ('64017011fcd64bf0930344ce43bb036c','707c5d0eed604e3a9b1ce595a30b41d6'), ('5b590cb7206b4929acef947495431623','0cf035f3d5ba4307b4652a5c8d3b9b03'), ('980f633e7d9c47dda327f04859cbf7eb','e330a4cace8d4385886ee37a21be20de'), ('648947b7ff41476d986e0fe9fb16f44b','84c8fc4b849c447ab05b3e07ce8b9cf3'), ('62f73b469b124d048235951c226c586d','68ad0b1c0215452895f5649349161c37'), ('62f73b469b124d048235951c226c586d','3da6ce52af6445c1b74a7192fbbf518a'), ('7d3e170d207c4039a4f6e750d6769685','7006f50540884c959b12cad18353f5fd'), ('86f30bac074145b2acb56e4c3d25f072','deb7cdede8a648cf9a865623af94a1bb'), ('68c560db66f8490e98a99411af9a66eb','8b79ec538bd64b8fb11e33c83e0bc65e'), ('e1582ee102bb4ae99dae430ae1e47ec5','45b71973ae8e4cea855ef8f0ca2e3fe8'), ('5e96b0977aab426899f71abce4646d1b','cdd1a6ddb3094fa4901f534bd15f87b7'), ('5e96b0977aab426899f71abce4646d1b','ba295376f7af45c2a0a4d75cbb813652'), ('47c592d4e5cb4819b9a5947f923b183b','46c17a8ee5b941e78218b4136b192e5d'), ('2b9da713c9744fa2a3bdc892ce49291e','46c17a8ee5b941e78218b4136b192e5b'), ('fd237a7d03aa46b09ff8728638b2215a','8d8f5b6e18894c4c90159094e8570cc4'), ('73798cee46784a8a82b54c196f5eb671','3605f26e41ea47168c3c063760e4a260'), ('fb12b6d9454b42e293d726ef5c1aa5c9','ccb711d3a3464542bacc87ee56114d7c'), ('af845523f100469cae8fc9c8383b19fe','35e32578e657482dbe42de8a9d949e3d'), ('840005766a744ff4baf90bb3cbb1acb5','0cde9972a1c34247b56937862554207b'), ('840005766a744ff4baf90bb3cbb1acb5','8a42f16212414738b68d2e0bfc5f3110'), ('5e0e1e92ae2c4197ae18df6dd3853fde','df65550795284fd3a5337d33dd12e613'), ('b69a9ad0c839433d8a36bb42a5f3fdd5','51bae97db8ff4290b6fec898364d2602'), ('afb1154d42964745a08e37bac16b5571','e5e4a8496be34d2eb21c522f85e69572'), ('de45d34fb96c498da20376f02880b7df','de6d2aa000c34c18a64caad082c8318f'), ('96fb9f435f5645f28a316e58e07de13b','937b5ef92cde4fc4a8a958bda62a7f05'), ('062e011b73764d84b680072e8ceef059','664e2a649448485ea6467ab6178e5ea5'), ('062e011b73764d84b680072e8ceef059','86418436c6e845a98c1e304b4d309a66'), ('c7f08cfe9bed459997b5aed159dddda7','89300ad86be146aeb4993d0e8299f2ce'), ('9a5738d19a73476fb6d398ede9d2615b','32b5320a52fc40cb943ea748dd4cd447'), ('169ec0dbb25a4226be60c1d9f2607c03','ff3d53b8273a40f188dd59b918cfbe8a'), ('9ba4f09559a2481fac041bfd2d741092','3da6ce52af6445c1b74a7192fbbf518a'), ('5a617ea94d274340878551487c8181b9','ba295376f7af45c2a0a4d75cbb813652'), ('418c0c56bfb6407a963ffcdb7bfb1301','ee006228f02b4b968123e2afc1a61b0a'), ('418c0c56bfb6407a963ffcdb7bfb1301','c23965bdbbe44ccba80fe9afd2580fd8'), ('418c0c56bfb6407a963ffcdb7bfb1301','d17e4eda02ae4081983639fe9a816423'), ('418c0c56bfb6407a963ffcdb7bfb1301','3b99ab6679344c9fb92c2e7e3799278d'), ('418c0c56bfb6407a963ffcdb7bfb1301','44784a81d33b4dd3aa126113d815d1d5'), ('8c8a96f7c8c243cca8ddc06e7eb4708f','ced191f189464b86b1e877591dfcc884');
INSERT INTO `manage_organization` VALUES ('237d9fe165f7438eb9e7f70c7e55a864','临洺关镇','1','1',NULL), ('abdb6fe7ee9e11e6bfa2005056adf4cb','邯郸永年区','邯郸永年区','0',''), ('e6dc26b4ea3848cfa15a82f44ff73eb5','日日日','日日日','2',NULL), ('eb41d392849b4e03951de14710781630','张西堡镇',NULL,'2',NULL);
INSERT INTO `manage_resources` VALUES ('04045a7f3bda445d96cee628bfd1acbb','系统用户','修改状态','/sys/user/updateStatus/*'), ('0cde9972a1c34247b56937862554207b','系统参数','修改','/sys/config/update*'), ('0cf035f3d5ba4307b4652a5c8d3b9b03','系统角色','新增','/sys/role/save*'), ('187bbc928e2945b9a4d3e5315c4efc66','系统用户','用户下线','/sys/user/shotOff*'), ('1fe3b9a250a249988b491fa396c21ca2','系统组织','查询所有','/sys/organization/listAll*'), ('32b5320a52fc40cb943ea748dd4cd447','系统定时任务','新增','/sys/schedule/save*'), ('35e32578e657482dbe42de8a9d949e3d','系统参数','新增','/sys/config/save*'), ('3605f26e41ea47168c3c063760e4a260','系统资源','删除','/sys/resources/delete*'), ('37f0c7d4430040faa58a4e85d383c97e','案件参数','列表','/case/info/list*'), ('3b99ab6679344c9fb92c2e7e3799278d','系统代码生成','新增','/sys/gen/save*'), ('3da6ce52af6445c1b74a7192fbbf518a','系统菜单','根据角色ID获取菜单','/sys/menu/getRoleMenu/*'), ('421abd7bc9764546893d59e329e8307d','系统用户','修改','/sys/user/update*'), ('44784a81d33b4dd3aa126113d815d1d5','系统代码生成','获取所有数据库表','/sys/gen/getAllTables*'), ('45b71973ae8e4cea855ef8f0ca2e3fe8','系统菜单','删除','/sys/menu/delete*'), ('46c17a8ee5b941e78218b4136b192e5b','系统资源','新增','/sys/resources/save*'), ('46c17a8ee5b941e78218b4136b192e5d','系统资源','列表','/sys/resources/list*'), ('4b47f11dddc7411a9c700bf0353f9ea6','个人中心','修改密码','/personal/updatePassword*'), ('51bae97db8ff4290b6fec898364d2602','系统组织','列表','/sys/organization/list*'), ('664e2a649448485ea6467ab6178e5ea5','系统定时任务','修改','/sys/schedule/update*'), ('68ad0b1c0215452895f5649349161c37','系统角色','修改角色权限','/sys/role/updateMenu*'), ('7006f50540884c959b12cad18353f5fd','系统菜单','新增','/sys/menu/save*'), ('707c5d0eed604e3a9b1ce595a30b41d6','系统角色','列表','/sys/role/list*'), ('7215b5ef172f41ccb4616a38e8b6f555','系统用户','新增','/sys/user/save*'), ('84c8fc4b849c447ab05b3e07ce8b9cf3','系统角色','删除','/sys/role/delete*'), ('86418436c6e845a98c1e304b4d309a66','系统定时任务','修改状态','/sys/schedule/updateStatus/*'), ('89300ad86be146aeb4993d0e8299f2ce','系统定时任务','列表','/sys/schedule/list*'), ('8a42f16212414738b68d2e0bfc5f3110','系统参数','修改状态','/sys/config/updateStatus/*'), ('8b79ec538bd64b8fb11e33c83e0bc65e','系统菜单','修改','/sys/menu/update*'), ('8d8f5b6e18894c4c90159094e8570cc4','系统资源','修改','/sys/resources/update*'), ('937b5ef92cde4fc4a8a958bda62a7f05','系统组织','删除','/sys/organization/delete*'), ('a1d2206781aa469e9bba12e2b1e5edb2','个人中心','修改个人信息','/personal/updateUserInfo*'), ('aa7d6ee5e3634a9f97864b53d2f653d5','系统角色','查询所有角色','/sys/role/listAll*'), ('b956b8699fae4489a6d896be7be876e3','系统用户','修改密码','/sys/user/updatePassword*'), ('ba295376f7af45c2a0a4d75cbb813652','系统资源','根据菜单ID获取资源','/sys/resources/list/getByMenuId/*'), ('c23965bdbbe44ccba80fe9afd2580fd8','系统代码生成','列表','/sys/gen/list*'), ('ccb711d3a3464542bacc87ee56114d7c','系统参数','列表','/sys/config/list*'), ('cdd1a6ddb3094fa4901f534bd15f87b7','系统菜单','修改菜单资源','/sys/menu/updateResources*'), ('ced191f189464b86b1e877591dfcc884','系统用户','列表','/sys/user/list*'), ('d17e4eda02ae4081983639fe9a816423','系统代码生成','删除','/sys/gen/delete*'), ('d1996765d70d40aab5721b70aa817fb3','个人中心','个人信息查询','/personal/getUserInfo*'), ('da5d2f19d5f44d3c8a393ec632e15e9a','系统用户','删除','/sys/user/delete*'), ('de6d2aa000c34c18a64caad082c8318f','系统组织','修改','/sys/organization/update*'), ('deb7cdede8a648cf9a865623af94a1bb','系统菜单','列表','/sys/menu/list*'), ('df65550795284fd3a5337d33dd12e613','系统参数','删除','/sys/config/delete*'), ('e330a4cace8d4385886ee37a21be20de','系统角色','修改','/sys/role/update*'), ('e5e4a8496be34d2eb21c522f85e69572','系统组织','新增','/sys/organization/save*'), ('ee006228f02b4b968123e2afc1a61b0a','系统代码生成','修改','/sys/gen/update*'), ('ff3d53b8273a40f188dd59b918cfbe8a','系统定时任务','删除','/sys/schedule/delete*');
INSERT INTO `manage_role` VALUES ('225d0392b62349ed9ae6bb62bc095b56','个人中心，案件处理','巡查员'), ('2c9182d45a1c3f70015a1c3f70890000','超级管理','超级管理员'), ('ee5d94ef8b1448eb9702b67d64cbd7b4','个人、案件处理，网格','派遣管理员');
INSERT INTO `manage_role_menu` VALUES ('2c9182fd5aa690f1015aa6c251840001','4a1869a6b6e74303a28cbafe075a742a'), ('2c9182fd5aa690f1015aa6c251840001','3cebad1606944d29b137fdb97b032bd5'), ('0fc6b4724e544b25a7d2febea33b073c','736afe1adca94eacb01e054722214854'), ('0fc6b4724e544b25a7d2febea33b073c','8c8a96f7c8c243cca8ddc06e7eb4708f'), ('225d0392b62349ed9ae6bb62bc095b56','c6bf4fb3577c4a8b8603bf0840b98d95'), ('225d0392b62349ed9ae6bb62bc095b56','24a7eadfcaf44529888068cb8c2c9b10'), ('225d0392b62349ed9ae6bb62bc095b56','a734d9fc485649b588ae24a34fe269ff'), ('225d0392b62349ed9ae6bb62bc095b56','00ca804b344e422a8b13ed29b6aa38d6'), ('225d0392b62349ed9ae6bb62bc095b56','736afe1adca94eacb01e054722214854'), ('225d0392b62349ed9ae6bb62bc095b56','8c8a96f7c8c243cca8ddc06e7eb4708f'), ('2c9182d45a1c3f70015a1c3f70890000','c6bf4fb3577c4a8b8603bf0840b98d95'), ('2c9182d45a1c3f70015a1c3f70890000','24a7eadfcaf44529888068cb8c2c9b10'), ('2c9182d45a1c3f70015a1c3f70890000','a734d9fc485649b588ae24a34fe269ff'), ('2c9182d45a1c3f70015a1c3f70890000','00ca804b344e422a8b13ed29b6aa38d6'), ('2c9182d45a1c3f70015a1c3f70890000','736afe1adca94eacb01e054722214854'), ('2c9182d45a1c3f70015a1c3f70890000','e8623d3d4d39474cb6f77aa114aa54b9'), ('2c9182d45a1c3f70015a1c3f70890000','2a3ad53f3f1a4957820847db38470431'), ('2c9182d45a1c3f70015a1c3f70890000','ce376afc8d914a62bee476c5a2430c29'), ('2c9182d45a1c3f70015a1c3f70890000','8c8a96f7c8c243cca8ddc06e7eb4708f'), ('2c9182d45a1c3f70015a1c3f70890000','3cebad1606944d29b137fdb97b032bd5'), ('2c9182d45a1c3f70015a1c3f70890000','39f61e75b9844f108b1b88bc8342c60c'), ('2c9182d45a1c3f70015a1c3f70890000','4794b2418fe84f4b892e131352315352'), ('2c9182d45a1c3f70015a1c3f70890000','71bcf9713a9e4c67b4b136816db5be48'), ('2c9182d45a1c3f70015a1c3f70890000','2fb6bf25c7e943e49dee3698ce5543e4'), ('2c9182d45a1c3f70015a1c3f70890000','9b0fbeb5382e4b6eb5b90d57e2d4dec3'), ('2c9182d45a1c3f70015a1c3f70890000','743fe1b276e84dbda943ec8f6bf1f246'), ('2c9182d45a1c3f70015a1c3f70890000','2490d124b960432eab79ebaef6b388b8'), ('2c9182d45a1c3f70015a1c3f70890000','1ed3e6e440b943aeb2abb60a3918ac38'), ('2c9182d45a1c3f70015a1c3f70890000','64017011fcd64bf0930344ce43bb036c'), ('2c9182d45a1c3f70015a1c3f70890000','5b590cb7206b4929acef947495431623'), ('2c9182d45a1c3f70015a1c3f70890000','980f633e7d9c47dda327f04859cbf7eb'), ('2c9182d45a1c3f70015a1c3f70890000','648947b7ff41476d986e0fe9fb16f44b'), ('2c9182d45a1c3f70015a1c3f70890000','62f73b469b124d048235951c226c586d'), ('2c9182d45a1c3f70015a1c3f70890000','9ba4f09559a2481fac041bfd2d741092'), ('2c9182d45a1c3f70015a1c3f70890000','1b16caa00b564127be74100b414e4b66'), ('2c9182d45a1c3f70015a1c3f70890000','86f30bac074145b2acb56e4c3d25f072'), ('2c9182d45a1c3f70015a1c3f70890000','7d3e170d207c4039a4f6e750d6769685'), ('2c9182d45a1c3f70015a1c3f70890000','68c560db66f8490e98a99411af9a66eb'), ('2c9182d45a1c3f70015a1c3f70890000','e1582ee102bb4ae99dae430ae1e47ec5'), ('2c9182d45a1c3f70015a1c3f70890000','5e96b0977aab426899f71abce4646d1b'), ('2c9182d45a1c3f70015a1c3f70890000','5a617ea94d274340878551487c8181b9'), ('2c9182d45a1c3f70015a1c3f70890000','4a1869a6b6e74303a28cbafe075a742a'), ('2c9182d45a1c3f70015a1c3f70890000','47c592d4e5cb4819b9a5947f923b183b'), ('2c9182d45a1c3f70015a1c3f70890000','2b9da713c9744fa2a3bdc892ce49291e'), ('2c9182d45a1c3f70015a1c3f70890000','fd237a7d03aa46b09ff8728638b2215a'), ('2c9182d45a1c3f70015a1c3f70890000','73798cee46784a8a82b54c196f5eb671'), ('2c9182d45a1c3f70015a1c3f70890000','8044eaa825d24476815967de374269a6'), ('2c9182d45a1c3f70015a1c3f70890000','fb12b6d9454b42e293d726ef5c1aa5c9'), ('2c9182d45a1c3f70015a1c3f70890000','af845523f100469cae8fc9c8383b19fe'), ('2c9182d45a1c3f70015a1c3f70890000','840005766a744ff4baf90bb3cbb1acb5'), ('2c9182d45a1c3f70015a1c3f70890000','5e0e1e92ae2c4197ae18df6dd3853fde'), ('2c9182d45a1c3f70015a1c3f70890000','d84b71f21b724d639b39852962f02b14'), ('2c9182d45a1c3f70015a1c3f70890000','b69a9ad0c839433d8a36bb42a5f3fdd5'), ('2c9182d45a1c3f70015a1c3f70890000','afb1154d42964745a08e37bac16b5571'), ('2c9182d45a1c3f70015a1c3f70890000','de45d34fb96c498da20376f02880b7df'), ('2c9182d45a1c3f70015a1c3f70890000','96fb9f435f5645f28a316e58e07de13b'), ('2c9182d45a1c3f70015a1c3f70890000','32c4a686c1984b7a99875e38a30d15c6'), ('2c9182d45a1c3f70015a1c3f70890000','c7f08cfe9bed459997b5aed159dddda7'), ('2c9182d45a1c3f70015a1c3f70890000','9a5738d19a73476fb6d398ede9d2615b'), ('2c9182d45a1c3f70015a1c3f70890000','062e011b73764d84b680072e8ceef059'), ('2c9182d45a1c3f70015a1c3f70890000','169ec0dbb25a4226be60c1d9f2607c03'), ('2c9182d45a1c3f70015a1c3f70890000','b3e8a2d7f364446d95e1b6ce2989b24b'), ('2c9182d45a1c3f70015a1c3f70890000','418c0c56bfb6407a963ffcdb7bfb1301'), ('ee5d94ef8b1448eb9702b67d64cbd7b4','c6bf4fb3577c4a8b8603bf0840b98d95'), ('ee5d94ef8b1448eb9702b67d64cbd7b4','24a7eadfcaf44529888068cb8c2c9b10'), ('ee5d94ef8b1448eb9702b67d64cbd7b4','a734d9fc485649b588ae24a34fe269ff'), ('ee5d94ef8b1448eb9702b67d64cbd7b4','00ca804b344e422a8b13ed29b6aa38d6'), ('ee5d94ef8b1448eb9702b67d64cbd7b4','736afe1adca94eacb01e054722214854'), ('ee5d94ef8b1448eb9702b67d64cbd7b4','e8623d3d4d39474cb6f77aa114aa54b9'), ('ee5d94ef8b1448eb9702b67d64cbd7b4','2a3ad53f3f1a4957820847db38470431');
INSERT INTO `manage_user_account` VALUES ('0956bde3d47c43dab4a009cb28b423af','2020-06-10 11:13:04','e10adc3949ba59abbe56e057f20f883e','xPJL5S','0','test02',NULL,NULL,'2c9182d45a1c3f70015a1c3f70890000'), ('14020f19d9ac4bf596fdd2f31a9144d3','2020-06-05 14:53:04','e10adc3949ba59abbe56e057f20f883e','gMrfnR','0','xiao','1443023517@126.com','15423652365','225d0392b62349ed9ae6bb62bc095b56'), ('4d874669577f40c5aafc5b552de95f06','2020-06-02 11:37:48','e10adc3949ba59abbe56e057f20f883e','N8hMTu','0','dev',NULL,NULL,'2c9182d45a1c3f70015a1c3f70890000'), ('65f8e442cdb34ae38e4a328d96af87c5','2020-06-14 14:35:58','e10adc3949ba59abbe56e057f20f883e','58v36f','0','pqy','3333@qq.com','15423652368','ee5d94ef8b1448eb9702b67d64cbd7b4'), ('674953c38a424a19a59baed063e5c748','2020-06-16 11:41:57','e10adc3949ba59abbe56e057f20f883e','h6f96T','0','zxxc','65411@qq.com','15425896588','225d0392b62349ed9ae6bb62bc095b56'), ('7ebbb432-fbf8-44d2-8fad-e9faddae970c','2017-03-09 11:28:06','e10adc3949ba59abbe56e057f20f883e','hj2Dcf','0','admin','279603896@qq.com','15423652364','2c9182d45a1c3f70015a1c3f70890000'), ('82429b88055b486eb9b49f0784b10c70','2020-06-10 10:30:32','e10adc3949ba59abbe56e057f20f883e','LC0Pxw','0','test01',NULL,NULL,'2c9182d45a1c3f70015a1c3f70890000'), ('bf424ff69deb4f03af864502764b6b60','2020-06-10 11:21:29','670b14728ad9902aecba32e22fa4f6bd','gxtSNy','0','chang',NULL,NULL,'2c9182d45a1c3f70015a1c3f70890000'), ('c232aaf823094168b3be4abf87ef3eda','2020-06-10 10:34:48','e10adc3949ba59abbe56e057f20f883e','3lzxlU','0','czj','1007330961@qq.com','13659747897','2c9182d45a1c3f70015a1c3f70890000'), ('dfddcd22cadf40b2a7d31cc1ccfe01b2','2020-06-16 10:32:28','e10adc3949ba59abbe56e057f20f883e','y83Cs0','0','gfzpqy','156413@qq.com','15425874785','225d0392b62349ed9ae6bb62bc095b56'), ('e2f5fa9c8e30473f986b337e27b7a002','2020-06-11 14:38:55','e10adc3949ba59abbe56e057f20f883e','SghnfA','0','mmm','a1830293517@126.com','15425896589','ee5d94ef8b1448eb9702b67d64cbd7b4');
INSERT INTO `manage_user_profile` VALUES ('03ce74d4ec0a42709d138656087a8526','测试加密',NULL,NULL,NULL,'2020-06-05 15:58:26',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('0712f4397c8947a8b7630b98ce7aa5fd','Gaokx',NULL,NULL,'19918925328',NULL,'2017-09-11 09:58:39','279603896@qq.com',NULL,'1',NULL,NULL,NULL,'2c9182ec5ac64b7e015ac64e0d09000c'), ('0956bde3d47c43dab4a009cb28b423af','测试二',NULL,NULL,NULL,'2020-06-10 11:13:04',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('14020f19d9ac4bf596fdd2f31a9144d3','白白',NULL,'07756535421','15423652365','2020-06-05 14:53:04','2020-06-15 10:01:40','1443023517@126.com',NULL,'0',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('424ca8585f144dd789dadd54fc7444d6','测试',NULL,NULL,NULL,'2020-06-05 15:44:12',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('4d874669577f40c5aafc5b552de95f06','测试用户',NULL,NULL,NULL,'2020-06-02 11:37:48',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('65f8e442cdb34ae38e4a328d96af87c5','派遣员',NULL,'15423652365','15423652368','2020-06-14 14:35:58',NULL,'3333@qq.com',NULL,'0',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('674953c38a424a19a59baed063e5c748','张西巡查',NULL,'15425896589','15425896588','2020-06-16 11:41:57',NULL,'65411@qq.com',NULL,'1',NULL,NULL,NULL,'eb41d392849b4e03951de14710781630'), ('7ebbb432-fbf8-44d2-8fad-e9faddae970c','管理员',NULL,'','15423652364','2017-03-09 11:28:06','2020-06-14 10:02:22','279603896@qq.com',NULL,'1',NULL,NULL,'register','abdb6fe7ee9e11e6bfa2005056adf4cb'), ('82429b88055b486eb9b49f0784b10c70','测试',NULL,NULL,NULL,'2020-06-10 10:30:32',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('95268e7b1db54c559004d364ace7ef33','测试',NULL,NULL,NULL,'2020-06-05 16:00:45',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('b68d8424b3a140bb9fec73abe1a5602f','的方',NULL,NULL,NULL,'2020-06-08 13:14:40',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('bf424ff69deb4f03af864502764b6b60','测试四',NULL,NULL,NULL,'2020-06-10 11:21:29',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('c232aaf823094168b3be4abf87ef3eda','陈子杰',NULL,'13659747897','13659747897','2020-06-10 10:34:48',NULL,'1007330961@qq.com',NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('dee72c2a35294a3c98a12efad8fe5ffa','测试',NULL,NULL,NULL,'2020-06-05 15:33:41',NULL,NULL,NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('dfddcd22cadf40b2a7d31cc1ccfe01b2','广府巡查',NULL,'15425874785','15425874785','2020-06-16 10:32:28','2020-06-16 10:37:53','156413@qq.com',NULL,'1',NULL,NULL,NULL,'abdb6fe7ee9e11e6bfa2005056adf4cb'), ('e2f5fa9c8e30473f986b337e27b7a002','明明',NULL,'15425896589','15425896589','2020-06-11 14:38:55','2020-06-12 15:06:26','a1830293517@126.com',NULL,'0',NULL,NULL,NULL,'237d9fe165f7438eb9e7f70c7e55a864');
