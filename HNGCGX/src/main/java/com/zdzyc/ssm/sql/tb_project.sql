/*
Navicat MySQL Data Transfer

Source Server         : zhangxq
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : db_ssm

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2016-07-17 13:23:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_project`
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project` (
  `project_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `user_id` bigint(11) NOT NULL COMMENT '上传项目的人id',
  `project_name` varchar(255) NOT NULL COMMENT '项目名称',
  `project_title` varchar(255) NOT NULL COMMENT '项目title',
  `project_detail` varchar(1255) default NULL COMMENT '项目详细',
  `project_type` bigint(11) NOT NULL COMMENT '项目类型',
  `images` varchar(1255) default NULL COMMENT '项目图片',
  `download_num` bigint(11) default NULL COMMENT '下载次数',
  `star` bigint(11) default NULL COMMENT '点赞数目',
  `message_num` bigint(11) default NULL COMMENT '评论数目',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `tb_project` (user_id, project_name,project_title,project_type)
 VALUES
 (111, '大楼建设', '中国第一大楼',  1),
 (222, '大楼建设2', '中国第一大楼2', 2),
 (333, '大楼建设3', '中国第一大楼3', 3),
 (444, '大楼建设4', '中国第一大楼4',  4);

