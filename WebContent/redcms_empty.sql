-- MySQL Administrator dump 1.4

CREATE DATABASE IF NOT EXISTS redcms;
USE redcms;

DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `email` varchar(45) NOT NULL COMMENT 'email',
  `passwd` varchar(45) NOT NULL COMMENT '密码',
  `lastip` varchar(45) DEFAULT NULL COMMENT '最后ip',
  `lasttime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `activation` int(1) unsigned DEFAULT '0' COMMENT '激活状态',
  `purview` varchar(45) DEFAULT '10000000000000000000000000000' COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=gbk COMMENT='管理员表';


INSERT INTO `manager` (`id`,`email`,`passwd`,`lastip`,`lasttime`,`activation`,`purview`) VALUES 
 (1,'info@redwww.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,0,'10000000000000000000000000000'),
 (3,'classku@163.com','202cb962ac59075b964b07152d234b70',NULL,NULL,0,'01000000000000000000000000000');


 

DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(25) NOT NULL COMMENT '名字',
  `description` varchar(45) DEFAULT NULL COMMENT '描述',
  `index_temp` varchar(45) DEFAULT NULL COMMENT '首页模版',
  `list_temp` varchar(45) DEFAULT NULL COMMENT '列表模版',
  `content_temp` varchar(45) DEFAULT NULL COMMENT '内容模版',
  `is_def` int(1) unsigned DEFAULT '0' COMMENT '是否默认',
  `title_width` int(10) unsigned DEFAULT NULL COMMENT '标题图宽度',
  `title_height` int(10) unsigned DEFAULT NULL COMMENT '标题图高度',
  `content_width` int(10) unsigned DEFAULT NULL COMMENT '内容图宽',
  `content_height` int(10) unsigned DEFAULT NULL COMMENT '内容图高',
  `table_name` varchar(45) NOT NULL COMMENT '表名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=gbk COMMENT='模型表';


DROP TABLE IF EXISTS `model_item`;
CREATE TABLE `model_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned DEFAULT NULL COMMENT '模型id',
  `name` varchar(25) NOT NULL COMMENT '字段名',
  `label` varchar(25) NOT NULL COMMENT '字段显示名称',
  `orderlist` int(2) unsigned DEFAULT '10' COMMENT '排序',
  `def_value` varchar(45) DEFAULT NULL COMMENT '默认值',
  `valid` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `FK_model_item_1` (`model_id`),
  CONSTRAINT `FK_model_item_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=gbk COMMENT='模型字段表';

DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned DEFAULT NULL COMMENT '模型id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '父栏目id',
  `name` varchar(25) DEFAULT NULL COMMENT '栏目名',
  `path` varchar(25) DEFAULT NULL COMMENT '访问目录',
  `orderlist` int(2) unsigned DEFAULT '10' COMMENT '排序',
  `link` varchar(65) DEFAULT NULL COMMENT '外部链接',
  `pic` varchar(120) DEFAULT NULL COMMENT '栏目图片',
  `pic_height` int(11) DEFAULT NULL COMMENT '栏目图宽',
  `pic_width` int(11) DEFAULT NULL COMMENT '栏目图高',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `meta_title` varchar(100) DEFAULT NULL COMMENT 'meta_tiel',
  `meta_key` varchar(100) DEFAULT NULL COMMENT 'meta_key',
  `meta_des` varchar(200) DEFAULT NULL COMMENT 'meta_des',
  `index_temp` varchar(45) DEFAULT NULL COMMENT '首页模版',
  `list_temp` varchar(45) DEFAULT NULL COMMENT '列表模版',
  `content_temp` varchar(45) DEFAULT NULL COMMENT '内容模版',
  `content` text COMMENT '内容',
  `content_pic` varchar(200) DEFAULT NULL COMMENT '内容中的图片',
  PRIMARY KEY (`id`),
  KEY `FK_channel_1` (`model_id`),
  KEY `FK_channel_2` (`parent_id`),
  CONSTRAINT `FK_channel_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=gbk COMMENT='栏目表';

DROP TABLE IF EXISTS `content_type`;
CREATE TABLE `content_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '类型名字',
  `pic_width` int(10) unsigned DEFAULT NULL COMMENT '类型图宽',
  `pic_height` int(10) unsigned DEFAULT NULL COMMENT '类型图高',
  `has_pic` int(1) unsigned DEFAULT '1' COMMENT '0没有1有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容类型';


DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目id',
  `type_id` int(10) unsigned DEFAULT NULL COMMENT '类型id',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `title` varchar(85) DEFAULT NULL COMMENT '标题',
  `tags` varchar(45) DEFAULT NULL COMMENT '标签',
  `author` varchar(25) DEFAULT NULL COMMENT '作者',
  `origin` varchar(25) DEFAULT '转载' COMMENT '来原',
  `origin_url` varchar(45) DEFAULT NULL COMMENT '来源url',
  `description` varchar(100) DEFAULT NULL COMMENT '简述',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `title_color` varchar(15) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` int(1) unsigned DEFAULT '0' COMMENT '是否加粗',
  `title_pic` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_pic` varchar(100) DEFAULT NULL COMMENT '内容图',
  `type_pic` varchar(100) DEFAULT NULL COMMENT '类型图',
  `link` varchar(45) DEFAULT NULL COMMENT '外链',
  `temp` varchar(45) DEFAULT NULL COMMENT '模版',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站)',
  `orderlist` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`),
  KEY `FK_content_1` (`channel_id`),
  KEY `FK_content_2` (`type_id`),
  KEY `FK_content_3` (`manager_id`),
  CONSTRAINT `FK_content_1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`),
  CONSTRAINT `FK_content_2` FOREIGN KEY (`type_id`) REFERENCES `content_type` (`id`),
  CONSTRAINT `FK_content_3` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容表';


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(45) NOT NULL COMMENT 'tag名',
  `counter` int(10) unsigned DEFAULT NULL COMMENT '计数',
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_content_tag_1` FOREIGN KEY (`id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='CMS的tag';



DROP TABLE IF EXISTS `content_attachment`;
CREATE TABLE `content_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `model_id` int(11) DEFAULT NULL,
  `path` varchar(45) DEFAULT NULL COMMENT '路径新文件名',
  `name` varchar(45) DEFAULT NULL COMMENT '附件名',
  `mime` varchar(45) DEFAULT NULL COMMENT 'mime类型',
  `filename` varchar(45) DEFAULT NULL COMMENT '旧文件名',
  `orderlist` int(2) unsigned DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `FK_content_attachment_1` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='CMS内容附件表';


DROP TABLE IF EXISTS `content_picture`;
CREATE TABLE `content_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `model_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '旧文件名',
  `path` varchar(45) DEFAULT NULL COMMENT '新文件名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `order_list` int(2) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `FK_content_picture_1` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='CMS内容图片表';


DROP TABLE IF EXISTS `content_tags`;
CREATE TABLE `content_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `tag_id` int(10) unsigned DEFAULT NULL COMMENT 'tag id',
  `model_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_content_tags_1` (`content_id`),
  KEY `FK_content_tags_2` (`tag_id`),
  KEY `FK_content_tags_3` (`model_id`),
  CONSTRAINT `FK_content_tags_1` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`),
  CONSTRAINT `FK_content_tags_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `FK_content_tags_3` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容标标签关系';


DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目 id',
  `name` varchar(100) DEFAULT NULL COMMENT '专题名',
  `short_name` varchar(100) DEFAULT NULL COMMENT '简述',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_pic` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_pic` varchar(100) DEFAULT NULL COMMENT '内容图',
  `temp` varchar(100) DEFAULT NULL COMMENT '模版',
  `orderlist` int(2) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='专题';

DROP TABLE IF EXISTS `content_topic`;
CREATE TABLE `content_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `topic_id` int(10) unsigned DEFAULT NULL COMMENT '专题id',
  `model_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_content_topic_1` (`content_id`),
  KEY `FK_content_topic_2` (`topic_id`),
  KEY `FK_content_topic_3` (`model_id`),
  CONSTRAINT `FK_content_topic_1` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`),
  CONSTRAINT `FK_content_topic_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_content_topic_3` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容和专题关系表';


DROP TABLE IF EXISTS `content_txt`;
CREATE TABLE `content_txt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `txt` mediumtext,
  `txt_pics` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`content_id`),
  CONSTRAINT `contnet_txt_fk` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容的内容';



DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `name` varchar(45) DEFAULT NULL COMMENT '文件名',
  `path` varchar(45) DEFAULT NULL COMMENT '文个路径',
  `isvalid` int(10) unsigned DEFAULT '1' COMMENT '是否可用',
  `model_id` int(10) unsigned DEFAULT NULL COMMENT 'model_id',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=gbk COMMENT='内容中文件';



DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sitename` varchar(45) DEFAULT NULL COMMENT '网站名',
  `linkurl` varchar(45) DEFAULT NULL COMMENT '链接url',
  `logo` varchar(45) DEFAULT NULL COMMENT '图片路径',
  `orderlist` int(2) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='友情链接';





