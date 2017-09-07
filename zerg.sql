-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 �?08 �?07 �?09:17
-- 服务器版本: 5.5.53
-- PHP 版本: 5.5.38

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zerg`
--

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='banner管理表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`id`, `name`, `description`, `delete_time`, `update_time`) VALUES
(1, '首页置顶', '首页轮播图', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `banner_item`
--

CREATE TABLE IF NOT EXISTS `banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='banner子项表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `banner_item`
--

INSERT INTO `banner_item` (`id`, `img_id`, `key_word`, `type`, `delete_time`, `banner_id`, `update_time`) VALUES
(1, 65, '6', 1, NULL, 1, NULL),
(2, 2, '25', 1, NULL, 1, NULL),
(3, 3, '11', 1, NULL, 1, NULL),
(5, 1, '10', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品类目' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `topic_img_id`, `delete_time`, `description`, `update_time`) VALUES
(2, '果味', 6, NULL, NULL, NULL),
(3, '蔬菜', 5, NULL, NULL, NULL),
(4, '炒货', 7, NULL, NULL, NULL),
(5, '点心', 4, NULL, NULL, NULL),
(6, '粗茶', 8, NULL, NULL, NULL),
(7, '淡饭', 9, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='图片总表' AUTO_INCREMENT=70 ;

--
-- 转存表中的数据 `image`
--

INSERT INTO `image` (`id`, `url`, `from`, `delete_time`, `update_time`) VALUES
(1, '/banner-1a.png', 1, NULL, NULL),
(2, '/banner-2a.png', 1, NULL, NULL),
(3, '/banner-3a.png', 1, NULL, NULL),
(4, '/category-cake.png', 1, NULL, NULL),
(5, '/category-vg.png', 1, NULL, NULL),
(6, '/category-dryfruit.png', 1, NULL, NULL),
(7, '/category-fry-a.png', 1, NULL, NULL),
(8, '/category-tea.png', 1, NULL, NULL),
(9, '/category-rice.png', 1, NULL, NULL),
(10, '/product-dryfruit@1.png', 1, NULL, NULL),
(13, '/product-vg@1.png', 1, NULL, NULL),
(14, '/product-rice@6.png', 1, NULL, NULL),
(16, '/1@theme.png', 1, NULL, NULL),
(17, '/2@theme.png', 1, NULL, NULL),
(18, '/3@theme.png', 1, NULL, NULL),
(19, '/detail-1@1-dryfruit.png', 1, NULL, NULL),
(20, '/detail-2@1-dryfruit.png', 1, NULL, NULL),
(21, '/detail-3@1-dryfruit.png', 1, NULL, NULL),
(22, '/detail-4@1-dryfruit.png', 1, NULL, NULL),
(23, '/detail-5@1-dryfruit.png', 1, NULL, NULL),
(24, '/detail-6@1-dryfruit.png', 1, NULL, NULL),
(25, '/detail-7@1-dryfruit.png', 1, NULL, NULL),
(26, '/detail-8@1-dryfruit.png', 1, NULL, NULL),
(27, '/detail-9@1-dryfruit.png', 1, NULL, NULL),
(28, '/detail-11@1-dryfruit.png', 1, NULL, NULL),
(29, '/detail-10@1-dryfruit.png', 1, NULL, NULL),
(31, '/product-rice@1.png', 1, NULL, NULL),
(32, '/product-tea@1.png', 1, NULL, NULL),
(33, '/product-dryfruit@2.png', 1, NULL, NULL),
(36, '/product-dryfruit@3.png', 1, NULL, NULL),
(37, '/product-dryfruit@4.png', 1, NULL, NULL),
(38, '/product-dryfruit@5.png', 1, NULL, NULL),
(39, '/product-dryfruit-a@6.png', 1, NULL, NULL),
(40, '/product-dryfruit@7.png', 1, NULL, NULL),
(41, '/product-rice@2.png', 1, NULL, NULL),
(42, '/product-rice@3.png', 1, NULL, NULL),
(43, '/product-rice@4.png', 1, NULL, NULL),
(44, '/product-fry@1.png', 1, NULL, NULL),
(45, '/product-fry@2.png', 1, NULL, NULL),
(46, '/product-fry@3.png', 1, NULL, NULL),
(47, '/product-tea@2.png', 1, NULL, NULL),
(48, '/product-tea@3.png', 1, NULL, NULL),
(49, '/1@theme-head.png', 1, NULL, NULL),
(50, '/2@theme-head.png', 1, NULL, NULL),
(51, '/3@theme-head.png', 1, NULL, NULL),
(52, '/product-cake@1.png', 1, NULL, NULL),
(53, '/product-cake@2.png', 1, NULL, NULL),
(54, '/product-cake-a@3.png', 1, NULL, NULL),
(55, '/product-cake-a@4.png', 1, NULL, NULL),
(56, '/product-dryfruit@8.png', 1, NULL, NULL),
(57, '/product-fry@4.png', 1, NULL, NULL),
(58, '/product-fry@5.png', 1, NULL, NULL),
(59, '/product-rice@5.png', 1, NULL, NULL),
(60, '/product-rice@7.png', 1, NULL, NULL),
(62, '/detail-12@1-dryfruit.png', 1, NULL, NULL),
(63, '/detail-13@1-dryfruit.png', 1, NULL, NULL),
(65, '/banner-4a.png', 1, NULL, NULL),
(66, '/product-vg@4.png', 1, NULL, NULL),
(67, '/product-vg@5.png', 1, NULL, NULL),
(68, '/product-vg@2.png', 1, NULL, NULL),
(69, '/product-vg@3.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77 ;

--
-- 转存表中的数据 `order`
--

INSERT INTO `order` (`id`, `order_no`, `user_id`, `delete_time`, `create_time`, `total_price`, `status`, `snap_img`, `snap_name`, `total_count`, `update_time`, `snap_items`, `snap_address`, `prepay_id`) VALUES
(1, 'A804159765739871', 1, NULL, 1501815976, '0.02', 2, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 2, 1501815976, '[{"id":5,"haveStock":true,"count":2,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.02}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(2, 'A804159790049874', 1, NULL, 1501815979, '0.02', 1, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 2, 1501815979, '[{"id":5,"haveStock":true,"count":2,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.02}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(3, 'A804159794609835', 1, NULL, 1501815979, '0.02', 1, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 2, 1501815979, '[{"id":5,"haveStock":true,"count":2,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.02}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(4, 'A804185776301194', 1, NULL, 1501818577, '0.02', 2, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 2, 1501818577, '[{"id":5,"haveStock":true,"count":2,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.02}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(5, 'A804186607678130', 1, NULL, 1501818660, '0.02', 1, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 2, 1501818660, '[{"id":3,"haveStock":true,"count":2,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.02}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(6, 'A804221430864012', 1, NULL, 1501822143, '0.05', 1, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 5, 1501822143, '[{"id":3,"haveStock":true,"count":5,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.05}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(7, 'A804224539056025', 1, NULL, 1501822453, '0.05', 2, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 5, 1501822453, '[{"id":3,"haveStock":true,"count":5,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.05}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(8, 'A804248709784947', 1, NULL, 1501824870, '0.05', 1, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 5, 1501824870, '[{"id":3,"haveStock":true,"count":5,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.05}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(9, 'A804250518542684', 1, NULL, 1501825051, '0.05', 2, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 5, 1501825051, '[{"id":3,"haveStock":true,"count":5,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.05}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(10, 'A804253343402621', 1, NULL, 1501825334, '0.05', 1, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 5, 1501825334, '[{"id":3,"haveStock":true,"count":5,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.05}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(11, 'A804253516352670', 1, NULL, 1501825351, '0.05', 2, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 5, 1501825351, '[{"id":3,"haveStock":true,"count":5,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.05}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(12, 'A804253855572628', 1, NULL, 1501825385, '0.05', 1, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 5, 1501825385, '[{"id":3,"haveStock":true,"count":5,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.05}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(13, 'A804253883782663', 1, NULL, 1501825388, '0.05', 1, 'http://www.problem.com/images/product-rice@1.png', '素米 327克', 5, 1501825388, '[{"id":3,"haveStock":true,"count":5,"name":"\\u7d20\\u7c73 327\\u514b","totalPrice":0.05}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(14, 'A804273455782600', 1, NULL, 1501827345, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501827345, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(15, 'A804275573772644', 1, NULL, 1501827557, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501827557, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(16, 'A804279991042650', 1, NULL, 1501827999, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501827999, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(17, 'A804281309232602', 1, NULL, 1501828130, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501828130, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(18, 'A804282242932664', 1, NULL, 1501828224, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501828224, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(19, 'A804282711972667', 1, NULL, 1501828271, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501828271, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(20, 'A804283737382641', 1, NULL, 1501828373, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501828373, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(21, 'A804284297962637', 1, NULL, 1501828429, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501828429, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(22, 'A804286376672648', 1, NULL, 1501828637, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501828637, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(23, 'A804287126722640', 1, NULL, 1501828712, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501828712, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(24, 'A804290646292672', 1, NULL, 1501829064, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501829064, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(25, 'A804291974572656', 1, NULL, 1501829197, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501829197, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(26, 'A804292883362616', 1, NULL, 1501829288, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501829288, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(27, 'A804293364082654', 1, NULL, 1501829336, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501829336, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(28, 'A804293701252616', 1, NULL, 1501829370, '0.05', 1, 'http://www.problem.com/images/product-vg@1.png', '芹菜 半斤等', 5, 1501829370, '[{"id":1,"haveStock":true,"count":2,"name":"\\u82b9\\u83dc \\u534a\\u65a4","totalPrice":0.02},{"id":2,"haveStock":true,"count":2,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.02},{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(29, 'A804294975382600', 1, NULL, 1501829497, '0.02', 1, 'http://www.problem.com/images/product-dryfruit@8.png', '红衣青瓜 混搭160克', 2, 1501829497, '[{"id":26,"haveStock":true,"count":2,"name":"\\u7ea2\\u8863\\u9752\\u74dc \\u6df7\\u642d160\\u514b","totalPrice":0.02}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(30, 'A804311598222679', 1, NULL, 1501831159, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@8.png', '红衣青瓜 混搭160克', 1, 1501831159, '[{"id":26,"haveStock":true,"count":1,"name":"\\u7ea2\\u8863\\u9752\\u74dc \\u6df7\\u642d160\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(31, 'A804311755122635', 1, NULL, 1501831175, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@7.png', '珍奇异果 3个', 1, 1501831175, '[{"id":12,"haveStock":true,"count":1,"name":"\\u73cd\\u5947\\u5f02\\u679c 3\\u4e2a","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(32, 'A804313471948168', 1, NULL, 1501831347, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1501831347, '[{"id":10,"haveStock":true,"count":1,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(33, 'A804313857969514', 1, NULL, 1501831385, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@1.png', '梨花带雨 3个', 1, 1501831385, '[{"id":2,"haveStock":true,"count":1,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(34, 'A804315859192601', 1, NULL, 1501831585, '0.01', 1, 'http://www.problem.com/images/product-dryfruit-a@6.png', '贵妃笑 100克', 1, 1501831585, '[{"id":11,"haveStock":true,"count":1,"name":"\\u8d35\\u5983\\u7b11 100\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(35, 'A804321892222653', 1, NULL, 1501832189, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1501832189, '[{"id":10,"haveStock":true,"count":1,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(36, 'A804322286482691', 1, NULL, 1501832228, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@7.png', '珍奇异果 3个', 1, 1501832228, '[{"id":12,"haveStock":true,"count":1,"name":"\\u73cd\\u5947\\u5f02\\u679c 3\\u4e2a","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(37, 'A804323203012662', 1, NULL, 1501832320, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501832320, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(38, 'A804323970282682', 1, NULL, 1501832397, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 1, 1501832397, '[{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(39, 'A804324507132686', 1, NULL, 1501832450, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 1, 1501832450, '[{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(40, 'A804325195812684', 1, NULL, 1501832519, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@1.png', '梨花带雨 3个', 1, 1501832519, '[{"id":2,"haveStock":true,"count":1,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(41, 'A804328027772616', 1, NULL, 1501832802, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501832802, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(42, 'A804328453842661', 1, NULL, 1501832845, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501832845, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(43, 'A804329325332688', 1, NULL, 1501832932, '0.01', 2, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501832932, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(44, 'A804330852762651', 1, NULL, 1501833085, '0.01', 1, 'http://www.problem.com/images/product-dryfruit-a@6.png', '贵妃笑 100克', 1, 1501833085, '[{"id":11,"haveStock":true,"count":1,"name":"\\u8d35\\u5983\\u7b11 100\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(45, 'A804332110112612', 1, NULL, 1501833211, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1501833211, '[{"id":10,"haveStock":true,"count":1,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(46, 'A804334781102619', 1, NULL, 1501833478, '0.02', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 2, 1501833478, '[{"id":10,"haveStock":true,"count":2,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","totalPrice":0.02}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(47, 'A804335206552639', 1, NULL, 1501833520, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1501833520, '[{"id":10,"haveStock":true,"count":1,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(48, 'A804337711492605', 1, NULL, 1501833771, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1501833771, '[{"id":10,"haveStock":true,"count":1,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(49, 'A804338619102678', 1, NULL, 1501833861, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501833861, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(50, 'A804341823792623', 1, NULL, 1501834182, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501834182, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(51, 'A804342527782626', 1, NULL, 1501834252, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1501834252, '[{"id":10,"haveStock":true,"count":1,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(52, 'A804343341492664', 1, NULL, 1501834334, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501834334, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(53, 'A804343945862665', 1, NULL, 1501834394, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501834394, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(54, 'A804345127002606', 1, NULL, 1501834512, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501834512, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(55, 'A804347536292612', 1, NULL, 1501834753, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501834753, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(56, 'A804348901062686', 1, NULL, 1501834890, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501834890, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(57, 'A804350694562697', 1, NULL, 1501835069, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501835069, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(58, 'A804351139792646', 1, NULL, 1501835113, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501835113, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(59, 'A804352139502693', 1, NULL, 1501835213, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501835213, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(60, 'A804353628732685', 1, NULL, 1501835362, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501835362, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(61, 'A804354574002693', 1, NULL, 1501835457, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 1, 1501835457, '[{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(62, 'A804354886782689', 1, NULL, 1501835488, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501835488, '[{"id":6,"haveStock":true,"count":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(63, 'A804373742222693', 1, NULL, 1501837374, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 1, 1501837374, '[{"id":5,"haveStock":true,"count":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","totalPrice":0.01}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(64, 'A804375975922619', 1, NULL, 1501837597, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501837597, '[{"id":6,"haveStock":true,"counts":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-cake@2.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(65, 'A804385207092674', 1, NULL, 1501838520, '0.01', 2, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501838520, '[{"id":6,"haveStock":true,"counts":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-cake@2.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(66, 'A805244726421434', 1, NULL, 1501924472, '0.01', 2, 'http://www.problem.com/images/product-dryfruit@3.png', '夏日芒果 3个', 1, 1501924472, '[{"id":8,"haveStock":true,"counts":1,"name":"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@3.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(67, 'A805283014839268', 1, NULL, 1501928301, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@3.png', '夏日芒果 3个', 1, 1501928301, '[{"id":8,"haveStock":true,"counts":1,"name":"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@3.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(68, 'A805303522221939', 1, NULL, 1501930352, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1501930352, '[{"id":10,"haveStock":true,"counts":1,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@5.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(69, 'A805305924042128', 1, NULL, 1501930592, '0.01', 2, 'http://www.problem.com/images/product-dryfruit@4.png', '冬木红枣 500克', 1, 1501930592, '[{"id":9,"haveStock":true,"counts":1,"name":"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@4.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(70, 'A805306015971383', 1, NULL, 1501930601, '0.01', 2, 'http://www.problem.com/images/product-dryfruit@4.png', '冬木红枣 500克', 1, 1501930601, '[{"id":9,"haveStock":true,"counts":1,"name":"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@4.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(71, 'A805307348874500', 1, NULL, 1501930734, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 1, 1501930734, '[{"id":5,"haveStock":true,"counts":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@2.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(72, 'A805384782570632', 1, NULL, 1501938478, '0.01', 1, 'http://www.problem.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1501938478, '[{"id":6,"haveStock":true,"counts":1,"name":"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-cake@2.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(73, 'A805385139040648', 1, NULL, 1501938513, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@1.png', '梨花带雨 3个', 1, 1501938513, '[{"id":2,"haveStock":true,"counts":1,"name":"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@1.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(74, 'A805385746460690', 1, NULL, 1501938574, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@4.png', '冬木红枣 500克', 1, 1501938574, '[{"id":9,"haveStock":true,"counts":1,"name":"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@4.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(75, 'A806098149194008', 1, NULL, 1502009814, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1502009814, '[{"id":10,"haveStock":true,"counts":1,"name":"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@5.png"}]', '{"id":4,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":1,"update_time":"1970-01-01 08:00:00"}', NULL),
(76, 'A807923781363589', 2, NULL, 1502092378, '0.01', 1, 'http://www.problem.com/images/product-dryfruit@2.png', '春生龙眼 500克', 1, 1502092378, '[{"id":5,"haveStock":true,"counts":1,"name":"\\u6625\\u751f\\u9f99\\u773c 500\\u514b","price":"0.01","0":"main_img_url","totalPrice":0.01,"main_img_url":"http:\\/\\/www.problem.com\\/images\\/product-dryfruit@2.png"}]', '{"id":1,"name":"\\u5f20\\u4e09","mobile":"18888888888","province":"\\u5e7f\\u4e1c\\u7701","city":"\\u5e7f\\u5dde\\u5e02","country":"\\u5929\\u6cb3\\u533a","detail":"\\u67d0\\u5df7\\u67d0\\u53f7","delete_time":null,"user_id":2,"update_time":"1970-01-01 08:00:00"}', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order_product`
--

INSERT INTO `order_product` (`order_id`, `product_id`, `count`, `delete_time`, `update_time`) VALUES
(14, 1, 2, NULL, NULL),
(15, 1, 2, NULL, NULL),
(16, 1, 2, NULL, NULL),
(17, 1, 2, NULL, NULL),
(18, 1, 2, NULL, NULL),
(19, 1, 2, NULL, NULL),
(20, 1, 2, NULL, NULL),
(21, 1, 2, NULL, NULL),
(22, 1, 2, NULL, NULL),
(23, 1, 2, NULL, NULL),
(24, 1, 2, NULL, NULL),
(25, 1, 2, NULL, NULL),
(26, 1, 2, NULL, NULL),
(27, 1, 2, NULL, NULL),
(28, 1, 2, NULL, NULL),
(14, 2, 2, NULL, NULL),
(15, 2, 2, NULL, NULL),
(16, 2, 2, NULL, NULL),
(17, 2, 2, NULL, NULL),
(18, 2, 2, NULL, NULL),
(19, 2, 2, NULL, NULL),
(20, 2, 2, NULL, NULL),
(21, 2, 2, NULL, NULL),
(22, 2, 2, NULL, NULL),
(23, 2, 2, NULL, NULL),
(24, 2, 2, NULL, NULL),
(25, 2, 2, NULL, NULL),
(26, 2, 2, NULL, NULL),
(27, 2, 2, NULL, NULL),
(28, 2, 2, NULL, NULL),
(33, 2, 1, NULL, NULL),
(40, 2, 1, NULL, NULL),
(73, 2, 1, NULL, NULL),
(5, 3, 2, NULL, NULL),
(6, 3, 5, NULL, NULL),
(7, 3, 5, NULL, NULL),
(8, 3, 5, NULL, NULL),
(9, 3, 5, NULL, NULL),
(10, 3, 5, NULL, NULL),
(11, 3, 5, NULL, NULL),
(12, 3, 5, NULL, NULL),
(13, 3, 5, NULL, NULL),
(1, 5, 2, NULL, NULL),
(2, 5, 2, NULL, NULL),
(3, 5, 2, NULL, NULL),
(4, 5, 2, NULL, NULL),
(14, 5, 1, NULL, NULL),
(15, 5, 1, NULL, NULL),
(16, 5, 1, NULL, NULL),
(17, 5, 1, NULL, NULL),
(18, 5, 1, NULL, NULL),
(19, 5, 1, NULL, NULL),
(20, 5, 1, NULL, NULL),
(21, 5, 1, NULL, NULL),
(22, 5, 1, NULL, NULL),
(23, 5, 1, NULL, NULL),
(24, 5, 1, NULL, NULL),
(25, 5, 1, NULL, NULL),
(26, 5, 1, NULL, NULL),
(27, 5, 1, NULL, NULL),
(28, 5, 1, NULL, NULL),
(38, 5, 1, NULL, NULL),
(39, 5, 1, NULL, NULL),
(61, 5, 1, NULL, NULL),
(63, 5, 1, NULL, NULL),
(71, 5, 1, NULL, NULL),
(76, 5, 1, NULL, NULL),
(37, 6, 1, NULL, NULL),
(41, 6, 1, NULL, NULL),
(42, 6, 1, NULL, NULL),
(43, 6, 1, NULL, NULL),
(49, 6, 1, NULL, NULL),
(50, 6, 1, NULL, NULL),
(52, 6, 1, NULL, NULL),
(53, 6, 1, NULL, NULL),
(54, 6, 1, NULL, NULL),
(55, 6, 1, NULL, NULL),
(56, 6, 1, NULL, NULL),
(57, 6, 1, NULL, NULL),
(58, 6, 1, NULL, NULL),
(59, 6, 1, NULL, NULL),
(60, 6, 1, NULL, NULL),
(62, 6, 1, NULL, NULL),
(64, 6, 1, NULL, NULL),
(65, 6, 1, NULL, NULL),
(72, 6, 1, NULL, NULL),
(66, 8, 1, NULL, NULL),
(67, 8, 1, NULL, NULL),
(69, 9, 1, NULL, NULL),
(70, 9, 1, NULL, NULL),
(74, 9, 1, NULL, NULL),
(32, 10, 1, NULL, NULL),
(35, 10, 1, NULL, NULL),
(45, 10, 1, NULL, NULL),
(46, 10, 2, NULL, NULL),
(47, 10, 1, NULL, NULL),
(48, 10, 1, NULL, NULL),
(51, 10, 1, NULL, NULL),
(68, 10, 1, NULL, NULL),
(75, 10, 1, NULL, NULL),
(34, 11, 1, NULL, NULL),
(44, 11, 1, NULL, NULL),
(31, 12, 1, NULL, NULL),
(36, 12, 1, NULL, NULL),
(29, 26, 2, NULL, NULL),
(30, 26, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `delete_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `main_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `stock`, `delete_time`, `category_id`, `main_img_url`, `from`, `create_time`, `update_time`, `summary`, `img_id`) VALUES
(1, '芹菜 半斤', '0.01', 232, NULL, 3, '/product-vg@1.png', 1, NULL, NULL, NULL, 13),
(2, '梨花带雨 3个', '0.01', 232, NULL, 2, '/product-dryfruit@1.png', 1, NULL, NULL, NULL, 10),
(3, '素米 327克', '0.01', 996, NULL, 7, '/product-rice@1.png', 1, NULL, NULL, NULL, 31),
(4, '红袖枸杞 6克*3袋', '0.01', 998, NULL, 6, '/product-tea@1.png', 1, NULL, NULL, NULL, 32),
(5, '春生龙眼 500克', '0.01', 995, NULL, 2, '/product-dryfruit@2.png', 1, NULL, NULL, NULL, 33),
(6, '小红的猪耳朵 120克', '0.01', 997, NULL, 5, '/product-cake@2.png', 1, NULL, NULL, NULL, 53),
(7, '泥蒿 半斤', '0.01', 998, NULL, 3, '/product-vg@2.png', 1, NULL, NULL, NULL, 68),
(8, '夏日芒果 3个', '0.01', 995, NULL, 2, '/product-dryfruit@3.png', 1, NULL, NULL, NULL, 36),
(9, '冬木红枣 500克', '0.01', 996, NULL, 2, '/product-dryfruit@4.png', 1, NULL, NULL, NULL, 37),
(10, '万紫千凤梨 300克', '0.01', 996, NULL, 2, '/product-dryfruit@5.png', 1, NULL, NULL, NULL, 38),
(11, '贵妃笑 100克', '0.01', 994, NULL, 2, '/product-dryfruit-a@6.png', 1, NULL, NULL, NULL, 39),
(12, '珍奇异果 3个', '0.01', 999, NULL, 2, '/product-dryfruit@7.png', 1, NULL, NULL, NULL, 40),
(13, '绿豆 125克', '0.01', 999, NULL, 7, '/product-rice@2.png', 1, NULL, NULL, NULL, 41),
(14, '芝麻 50克', '0.01', 999, NULL, 7, '/product-rice@3.png', 1, NULL, NULL, NULL, 42),
(15, '猴头菇 370克', '0.01', 999, NULL, 7, '/product-rice@4.png', 1, NULL, NULL, NULL, 43),
(16, '西红柿 1斤', '0.01', 999, NULL, 3, '/product-vg@3.png', 1, NULL, NULL, NULL, 69),
(17, '油炸花生 300克', '0.01', 999, NULL, 4, '/product-fry@1.png', 1, NULL, NULL, NULL, 44),
(18, '春泥西瓜子 128克', '0.01', 997, NULL, 4, '/product-fry@2.png', 1, NULL, NULL, NULL, 45),
(19, '碧水葵花籽 128克', '0.01', 999, NULL, 4, '/product-fry@3.png', 1, NULL, NULL, NULL, 46),
(20, '碧螺春 12克*3袋', '0.01', 999, NULL, 6, '/product-tea@2.png', 1, NULL, NULL, NULL, 47),
(21, '西湖龙井 8克*3袋', '0.01', 998, NULL, 6, '/product-tea@3.png', 1, NULL, NULL, NULL, 48),
(22, '梅兰清花糕 1个', '0.01', 997, NULL, 5, '/product-cake-a@3.png', 1, NULL, NULL, NULL, 54),
(23, '清凉薄荷糕 1个', '0.01', 998, NULL, 5, '/product-cake-a@4.png', 1, NULL, NULL, NULL, 55),
(25, '小明的妙脆角 120克', '0.01', 999, NULL, 5, '/product-cake@1.png', 1, NULL, NULL, NULL, 52),
(26, '红衣青瓜 混搭160克', '0.01', 999, NULL, 2, '/product-dryfruit@8.png', 1, NULL, NULL, NULL, 56),
(27, '锈色瓜子 100克', '0.01', 998, NULL, 4, '/product-fry@4.png', 1, NULL, NULL, NULL, 57),
(28, '春泥花生 200克', '0.01', 999, NULL, 4, '/product-fry@5.png', 1, NULL, NULL, NULL, 58),
(29, '冰心鸡蛋 2个', '0.01', 999, NULL, 7, '/product-rice@5.png', 1, NULL, NULL, NULL, 59),
(30, '八宝莲子 200克', '0.01', 999, NULL, 7, '/product-rice@6.png', 1, NULL, NULL, NULL, 14),
(31, '深涧木耳 78克', '0.01', 999, NULL, 7, '/product-rice@7.png', 1, NULL, NULL, NULL, 60),
(32, '土豆 半斤', '0.01', 999, NULL, 3, '/product-vg@4.png', 1, NULL, NULL, NULL, 66),
(33, '青椒 半斤', '0.01', 999, NULL, 3, '/product-vg@5.png', 1, NULL, NULL, NULL, 67);

-- --------------------------------------------------------

--
-- 表的结构 `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `product_image`
--

INSERT INTO `product_image` (`id`, `img_id`, `delete_time`, `order`, `product_id`) VALUES
(4, 19, NULL, 1, 11),
(5, 20, NULL, 2, 11),
(6, 21, NULL, 3, 11),
(7, 22, NULL, 4, 11),
(8, 23, NULL, 5, 11),
(9, 24, NULL, 6, 11),
(10, 25, NULL, 7, 11),
(11, 26, NULL, 8, 11),
(12, 27, NULL, 9, 11),
(13, 28, NULL, 11, 11),
(14, 29, NULL, 10, 11),
(18, 62, NULL, 12, 11),
(19, 63, NULL, 13, 11);

-- --------------------------------------------------------

--
-- 表的结构 `product_property`
--

CREATE TABLE IF NOT EXISTS `product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `product_property`
--

INSERT INTO `product_property` (`id`, `name`, `detail`, `product_id`, `delete_time`, `update_time`) VALUES
(1, '品名', '杨梅', 11, NULL, NULL),
(2, '口味', '青梅味 雪梨味 黄桃味 菠萝味', 11, NULL, NULL),
(3, '产地', '火星', 11, NULL, NULL),
(4, '保质期', '180天', 11, NULL, NULL),
(5, '品名', '梨子', 2, NULL, NULL),
(6, '产地', '金星', 2, NULL, NULL),
(7, '净含量', '100g', 2, NULL, NULL),
(8, '保质期', '10天', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `theme`
--

CREATE TABLE IF NOT EXISTS `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='主题信息表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `theme`
--

INSERT INTO `theme` (`id`, `name`, `description`, `topic_img_id`, `delete_time`, `head_img_id`, `update_time`) VALUES
(1, '专题栏位一', '美味水果世界', 16, NULL, 49, NULL),
(2, '专题栏位二', '新品推荐', 17, NULL, 50, NULL),
(3, '专题栏位三', '做个干物女', 18, NULL, 18, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `theme_product`
--

CREATE TABLE IF NOT EXISTS `theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题所包含的商品';

--
-- 转存表中的数据 `theme_product`
--

INSERT INTO `theme_product` (`theme_id`, `product_id`) VALUES
(1, 2),
(1, 5),
(1, 8),
(1, 10),
(1, 12),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 6),
(2, 16),
(2, 33),
(3, 15),
(3, 18),
(3, 19),
(3, 27),
(3, 30),
(3, 31);

-- --------------------------------------------------------

--
-- 表的结构 `third_app`
--

CREATE TABLE IF NOT EXISTS `third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='访问API的各应用账号密码表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `third_app`
--

INSERT INTO `third_app` (`id`, `app_id`, `app_secret`, `app_description`, `scope`, `scope_description`, `delete_time`, `update_time`) VALUES
(1, 'yfy', '8912878', 'CMS', '32', 'Super', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `openid`, `nickname`, `extend`, `delete_time`, `create_time`, `update_time`) VALUES
(2, 'oYX4A0a02dnM6Gpubimi2ggteZdA', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_address`
--

CREATE TABLE IF NOT EXISTS `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user_address`
--

INSERT INTO `user_address` (`id`, `name`, `mobile`, `province`, `city`, `country`, `detail`, `delete_time`, `user_id`, `update_time`) VALUES
(1, '张三', '18888888888', '广东省', '广州市', '天河区', '某巷某号', NULL, 2, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
