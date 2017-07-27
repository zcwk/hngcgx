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
  `project_title` varchar(255) NOT NULL COMMENT '项目title',
  `project_detail` varchar(1255) default NULL COMMENT '项目详细',
  `project_type` bigint(11) NOT NULL COMMENT '项目类型',
  `images` varchar(1255) default NULL COMMENT '项目图片',
  `download_num` bigint(11) default NULL COMMENT '下载次数',
  `star` bigint(11) default NULL COMMENT '点赞数目',
  `message_num` bigint(11) default NULL COMMENT '评论数目',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_ad` int NOT NULL DEFAULT 0 COMMENT '是否是推荐广告',
  PRIMARY KEY  (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='项目表';

-- 修改表结构
-- alter table tb_project add download_url char(200) not null default '';

-- 去掉某列
-- alter table tb_project drop column project_name ;
-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `tb_project` (user_id, project_name,project_title,project_type,download_num,images)
 VALUES
 (4, '大楼建设423', '中国第一大楼423',  1,30,'http://pic25.nipic.com/20121121/668573_132500576118_2.jpg'),
 (5, '大楼建设4232', '中国第一大楼4232', 2,50,'http://pic25.nipic.com/20121121/668573_132500576118_2.jpg'),
 (6, '大楼建设4323', '中国第一大楼4233', 3,2,'http://pic25.nipic.com/20121121/668573_132500576118_2.jpg'),
 (7, '大楼建设4234', '中国第一大楼4234',  4,10,'http://pic25.nipic.com/20121121/668573_132500576118_2.jpg');

