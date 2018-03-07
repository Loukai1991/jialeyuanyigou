-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-06-30 20:09:11
-- 服务器版本： 5.6.27
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minipetmrschool`
--

-- --------------------------------------------------------

--
-- 表的结构 `lr_address`
--

CREATE TABLE `lr_address` (
  `id` int(11) NOT NULL COMMENT '地址id',
  `name` varchar(10) NOT NULL COMMENT '收货人',
  `tel` char(15) NOT NULL COMMENT '联系方式',
  `sheng` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '市id',
  `quyu` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `address` varchar(255) NOT NULL COMMENT '收货地址（不加省市区）',
  `address_xq` varchar(255) NOT NULL COMMENT '省市区+详细地址',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '邮政编号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `is_default` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否默认地址 1默认'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收货地址表' ROW_FORMAT=DYNAMIC;


--
-- 表的结构 `lr_adminuser`
--

CREATE TABLE `lr_adminuser` (
  `id` int(11) NOT NULL COMMENT '用户表：包括后台管理员、商家会员和普通会员',
  `name` varchar(20) NOT NULL COMMENT '登陆账号',
  `uname` varchar(10) DEFAULT NULL COMMENT '昵称',
  `pwd` varchar(50) NOT NULL COMMENT 'MD5密码',
  `qx` tinyint(4) NOT NULL DEFAULT '5' COMMENT '权限 4超级管理员 5普通管理员',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------

--
-- 表的结构 `lr_admin_app`
--

CREATE TABLE `lr_admin_app` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL COMMENT '系统名称',
  `uname` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `bname` varchar(20) DEFAULT NULL COMMENT '备案人',
  `nyear` int(11) DEFAULT '0',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '项目开通时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '项目到期时间',
  `photo` varchar(100) DEFAULT NULL COMMENT '中心认证照',
  `content` text,
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `iphone_key` varchar(255) DEFAULT NULL,
  `android_key` varchar(255) DEFAULT NULL,
  `iphone_version` int(5) NOT NULL DEFAULT '1',
  `logo` varchar(100) DEFAULT NULL,
  `android_version` int(5) NOT NULL DEFAULT '0',
  `android_version2` varchar(50) NOT NULL DEFAULT '',
  `logo2` varchar(100) DEFAULT NULL,
  `view_img` varchar(100) DEFAULT NULL,
  `iphone_app_url` varchar(255) DEFAULT NULL,
  `android_app_url` varchar(255) DEFAULT NULL,
  `android_appkey` varchar(255) DEFAULT NULL,
  `android_master_secret` varchar(255) DEFAULT NULL,
  `iphone_pem` varchar(255) DEFAULT NULL,
  `weixinid` varchar(255) DEFAULT NULL COMMENT '微信号',
  `baiduid` varchar(255) DEFAULT NULL COMMENT '百度市场id',
  `baidukey` varchar(255) DEFAULT NULL COMMENT '百度市场key',
  `key` varchar(255) DEFAULT NULL COMMENT 'key=（appkey-1）*2',
  `ispcshop` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否开通pc',
  `current_version` char(50) NOT NULL DEFAULT '5.0.00' COMMENT '当前版本',
  `tuiguang` tinyint(2) NOT NULL DEFAULT '0' COMMENT '开通推广',
  `pcnav_color` varchar(50) NOT NULL DEFAULT 'c81622' COMMENT 'pc版导航条颜色',
  `ahover_color` varchar(50) NOT NULL DEFAULT 'f97293' COMMENT 'pc版导航条鼠标hover值',
  `theme_color` varchar(20) DEFAULT '#21b7a1' COMMENT 'app主题颜色',
  `version` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `lr_attribute`
--

CREATE TABLE `lr_attribute` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '属性名称',
  `attr_name` varchar(20) NOT NULL,
  `sort` int(3) NOT NULL COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- 表的结构 `lr_brand`
--

CREATE TABLE `lr_brand` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '产品品牌表',
  `name` varchar(100) NOT NULL COMMENT '品牌名称',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `type` tinyint(2) DEFAULT '0' COMMENT '是否推荐',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `shop_id` int(11) UNSIGNED DEFAULT '0' COMMENT '店铺id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `lr_category`
--

CREATE TABLE `lr_category` (
  `id` int(11) NOT NULL COMMENT '分类id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类id',
  `name` varchar(50) NOT NULL COMMENT '栏目名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `concent` varchar(255) DEFAULT NULL COMMENT '栏目简介',
  `bz_1` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `bz_2` varchar(255) DEFAULT NULL COMMENT '备注字段',
  `bz_3` varchar(100) DEFAULT NULL COMMENT '图标',
  `bz_4` tinyint(2) NOT NULL DEFAULT '0' COMMENT '备用字段',
  `bz_5` varchar(100) DEFAULT NULL COMMENT '推荐略缩图'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 表的结构 `lr_china_city`
--

CREATE TABLE `lr_china_city` (
  `id` int(11) NOT NULL COMMENT '主键id',
  `tid` int(11) DEFAULT '0' COMMENT '父级id',
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `head` varchar(1) DEFAULT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='中国省市区地址联动表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `lr_course`
--

CREATE TABLE `lr_course` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '培训课程表',
  `title` varchar(200) NOT NULL COMMENT '课程名称',
  `price` decimal(9,2) DEFAULT '0.00' COMMENT '价格',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `intro` varchar(255) DEFAULT NULL COMMENT '简介摘要',
  `opentime` int(11) NOT NULL DEFAULT '0' COMMENT '开课时间',
  `class_hour` varchar(20) NOT NULL COMMENT '课时',
  `people` varchar(200) DEFAULT NULL COMMENT '针对人群',
  `teach_goals` varchar(200) DEFAULT NULL COMMENT '教学目的',
  `content` text COMMENT '课程介绍',
  `num` int(11) DEFAULT '0' COMMENT '报名人数',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  `del` tinyint(2) DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `lr_fankui`
--

CREATE TABLE `lr_fankui` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `message` varchar(255) NOT NULL COMMENT '反馈内容',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '反馈时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

 --------------------------------------------------------

--
-- 表的结构 `lr_group_joins`
--

CREATE TABLE `lr_group_joins` (
  `id` int(11) NOT NULL COMMENT '团购用户信息表',
  `hid` int(11) NOT NULL DEFAULT '0' COMMENT 'hot id 团购id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `jointime` int(10) NOT NULL DEFAULT '0' COMMENT '参团时间',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0:报名中 1:待付款 2:已经生成订单 3:取消 4:过期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `lr_guanggao`
--

CREATE TABLE `lr_guanggao` (
  `id` int(11) NOT NULL COMMENT '子页广告管理表',
  `name` varchar(20) DEFAULT NULL COMMENT '广告名称',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `sort` int(11) NOT NULL DEFAULT '0',
  `type` enum('product','news','partner','index') DEFAULT 'index' COMMENT '广告类型',
  `action` varchar(255) NOT NULL COMMENT '链接值',
  `position` tinyint(2) UNSIGNED DEFAULT '1' COMMENT '广告位置 1首页轮播'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_guanggao`
--

INSERT INTO `lr_guanggao` (`id`, `name`, `photo`, `addtime`, `sort`, `type`, `action`, `position`) VALUES
(2, '滚动广告图2', 'UploadFiles/adv/20170524/1495589027693993.jpg', 0, 2, '', '', 1),
(5, '首页轮播', 'UploadFiles/adv/20170525/1495684434521009.jpg', 0, 3, '', '', 1),
(9, '首页轮播', 'UploadFiles/adv/20170524/1495589261959572.jpg', 0, 1, '', '', 1),
(10, '首页轮播', 'UploadFiles/adv/20170524/1495588800716222.jpg', 1493349922, 4, '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `lr_guige`
--

CREATE TABLE `lr_guige` (
  `id` int(11) NOT NULL COMMENT '规格id',
  `pid` int(11) NOT NULL COMMENT '产品id',
  `attr_id` int(11) DEFAULT '0' COMMENT '产品属性id',
  `name` varchar(50) NOT NULL COMMENT '规格名称',
  `price` decimal(9,2) DEFAULT '0.00' COMMENT '规格价格',
  `stock` int(11) UNSIGNED NOT NULL COMMENT '库存',
  `img` varchar(100) DEFAULT NULL COMMENT '属性图片',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_guige`
--

INSERT INTO `lr_guige` (`id`, `pid`, `attr_id`, `name`, `price`, `stock`, `img`, `addtime`) VALUES
(1, 270, 3, '类型1', '1.00', 4, 'UploadFiles/attribute/20170426/1493200933326487.jpg', 1493200341),
(2, 270, 3, '类型2', '2.00', 4, NULL, 1493200341),
(3, 270, 4, '口味1', '3.00', 4, NULL, 1493200341),
(4, 270, 4, '口味2', '4.00', 4, NULL, 1493200341),
(5, 270, 6, '规格1', '0.20', 4, 'UploadFiles/attribute/20170426/1493200949147573.jpg', 1493200341),
(6, 270, 6, '规格2', '0.20', 4, NULL, 1493200341),
(7, 270, 6, '规格3', '0.20', 4, NULL, 1493200341),
(8, 271, 1, '大一号', '0.20', 2, NULL, 1493201823),
(9, 271, 1, '小一号', '0.20', 2, NULL, 1493201823),
(10, 271, 1, '中号', '0.20', 2, NULL, 1493201823),
(11, 271, 1, '小号', '0.20', 2, NULL, 1493201823),
(12, 271, 1, '超大号', '0.20', 2, NULL, 1493201823),
(13, 271, 2, '红色', '0.20', 2, NULL, 1493201823),
(14, 271, 2, '灰色', '0.20', 2, NULL, 1493201823),
(15, 271, 2, '蓝色', '0.20', 2, NULL, 1493201823),
(16, 271, 3, '迷你型', '0.20', 2, NULL, 1493201823),
(17, 271, 3, '儿童型', '0.20', 2, NULL, 1493201823);

-- --------------------------------------------------------

--
-- 表的结构 `lr_hot`
--

CREATE TABLE `lr_hot` (
  `id` int(8) NOT NULL COMMENT '团购商品表',
  `pid` int(8) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `price` decimal(8,2) DEFAULT '0.00' COMMENT '价格',
  `start` int(10) DEFAULT '0' COMMENT '开团时间',
  `end` int(10) DEFAULT '0' COMMENT '结束时间',
  `addtime` int(10) DEFAULT '0' COMMENT '添加时间',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `type` int(2) DEFAULT '0',
  `amount` int(5) DEFAULT '0' COMMENT '团购 开团的数量',
  `count` int(6) DEFAULT '0' COMMENT '团购 参团人数',
  `hstatus` int(2) DEFAULT '0' COMMENT '是否被删除 1已被删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `lr_indeximg`
--

CREATE TABLE `lr_indeximg` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类产品',
  `photo` varchar(100) NOT NULL COMMENT '图片',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_indeximg`
--

INSERT INTO `lr_indeximg` (`id`, `cid`, `name`, `photo`, `sort`) VALUES
(1, 0, '新闻资讯', 'UploadFiles/category/indeximg/20170626/1498465212860355.png', 1),
(2, 0, '教学优势', 'UploadFiles/category/indeximg/20170626/1498465226783855.png', 2),
(3, 0, '学员风采', 'UploadFiles/category/indeximg/20170626/1498465239176044.png', 3),
(4, 0, '关于我们', 'UploadFiles/category/indeximg/20170626/1498465246720048.png', 4);

-- --------------------------------------------------------

--
-- 表的结构 `lr_news`
--

CREATE TABLE `lr_news` (
  `id` int(11) NOT NULL,
  `cid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '新闻分类ID',
  `name` varchar(50) NOT NULL COMMENT '新闻标题',
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '新闻内容',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '发表时间',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `pinglun` int(11) NOT NULL DEFAULT '0' COMMENT '评论数量',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `photo` varchar(100) DEFAULT NULL COMMENT '简介图片',
  `source` varchar(20) DEFAULT NULL COMMENT '来源'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_news`
--

INSERT INTO `lr_news` (`id`, `cid`, `name`, `digest`, `content`, `addtime`, `click`, `pinglun`, `sort`, `photo`, `source`) VALUES
(1, 4, '宝宝和狗狗怎么和谐相处', ' 对于一只被饲养很长时间的宠物狗来说，宝宝的到来总会让它产生各种不同的情绪', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;br /&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 对于一只被饲养很长时间的宠物狗来说，宝宝的到来总会让它产生各种不同的情绪。对于狗狗而言，宝宝是家里新来的客人，面对宝宝有些狗狗爱护有加相处下来也非常的和谐。而也有些狗狗会变得更加的淘气。那么，作为家长应该如何让宝宝和狗狗和谐相处呢？&lt;/p&gt;&amp;nbsp;&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 其实，从狗狗的眼中来看这个世界，它们是看不出宝宝是人类的，它们会单纯的判断宝宝就是一个新的动物。有时候当狗狗看到主人如此疼爱、关心这个新生命的时候，狗狗也不免会吃醋，慢慢地它会对宝宝产生敌意。然而，很多动物行为专家认为，只要通过一些有计划的安排和调整，宝宝和狗狗也是可以和谐相处的。&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 首先，当宠物狗待在宝宝身边的时候，请家长不要紧张着急，不要盲目的担心狗狗可能会伤害它。此时，家长应该保持冷静，你可以保持一定的距离静静地坐着，看护着它们。同时，当狗狗在宝宝身边表现非常友善的时候，你一定要奖励表扬它。&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 其次，在带宝宝回家之前，最好能现将有关宝宝气味的东西，如衣服等等让狗狗闻闻。让它能提前适应，不至于突然带宝宝回家而刺激到宠物狗。同时，在宝宝熟睡的时候，你可以花些时间陪伴狗狗，做游戏玩耍都可以。当宠物狗知道你同样重视它，爱护它。&lt;br /&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 此外，宝宝与狗狗相处毕竟没有什么方法，在日常生活中，也不要让狗狗和宝宝单独相处。因为你不知道宝宝的哪种状态和行为会刺激到狗狗，所以，以防万一还是不要让狗狗和宝宝单独相处了。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', 1494834322, 4, 0, 10, 'UploadFiles/news/20170525/1495705799154839.jpg', '雷米高'),
(2, 4, '狗狗耳朵一高一低怎么回事', '狗狗的耳朵一高一低的情况并不少见，对于一只健康的宠物狗来说，应该是有一个标准的身型，健壮的身躯', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;br /&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 狗狗的耳朵一高一低的情况并不少见，对于一只健康的宠物狗来说，应该是有一个标准的身型，健壮的身躯，当然眼睛，鼻子，嘴巴，耳朵也应该标准健康。那么，狗狗的耳朵一高一低可能是怎么回事呢？&lt;/p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 有主人认为，狗狗耳朵一高一低是不是抽筋了。抽筋是扯动身体肌肉，就会导致本应该对称的两只耳朵出现不一样的情况。一高一低是比较常见的，当然能及时的处理狗狗耳朵抽筋的情况，狗狗这种耳朵一高一低的现象也能很快的消失。但是做为家长，还是应该找到狗狗耳朵抽筋的原因，然后在想办法解决。&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 有时候狗狗耳朵一高一低的情况也可能是受螨虫的影响，为了缓解耳朵的不适，狗狗会不停的摇头晃脑，对抽搐自己的耳朵。正常情况下，能及时的为宠物狗清洁耳朵内的螨虫，确保狗狗耳朵健康，那么狗狗这种耳朵一高一低的现象也可以得到解决。&lt;br /&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 其实，宠物狗出现耳朵一高一低的现象，其原因是比较多。除了以上两种之外，遗传因素（天生就两只耳朵位置不一样），后天成长营养不良（缺钙等也可能导致耳朵生长不良，出现一高一低的情况），这些原因都有可能导致狗狗耳朵出现一高一低的情况。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', 1494837978, 0, 0, 2, 'UploadFiles/news/20170525/1495705336855474.jpg', '雷米高'),
(3, 1, '宠物美容包括什么内容', '所谓的宠物美容，不只是替狗儿洗澡而已，而是借着顶级的美发用品，和精湛的修剪技法为为它们遮掩体形缺失，增添美感', '&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;所谓的宠物美容，不只是替狗儿洗澡而已，而是借着顶级的美发用品，和精湛的修剪技法为为它们遮掩体形缺失，增添美感。所以美容师需要辛苦的拜师学艺、考证照、更要不断吸收新知以拥有一流的专业技艺和独到的造形设计。&lt;br /&gt;　　美容的发展缘由&lt;br /&gt;　　美容技术的起源来自于贵宾犬，最早期贵宾犬原作为担任鸟猎犬的工作，必须在树林里，矮木树丛中穿梭，而它一身浓密的卷毛很容易被树枝勾住，相当的不方便，主人为了改善这些困扰，特地将它的一身卷毛剪短，渐渐的就发展出各式各样有趣的造型来。&lt;br /&gt;　　比赛狗的造型&lt;br /&gt;　　既然将到美容，当然要说到比赛犬的造型喽！我们常常在狗种比赛时看到许多体格矫健，体态优美的参赛狗，可知道，每一只参展的犬只在国际公认上，都有针对其外观造型所制定的美容标准。&lt;br /&gt;　　例如：　　&lt;br /&gt;&amp;nbsp; 垂耳猎犬的头顶与背部的被毛要剃除，双耳与四肢、胸腹部分的披毛则要留长。&lt;br /&gt;&amp;nbsp; 雪纳瑞的背毛不可用剃的，只能用专业刮刀剥除，眉毛和胡须不仅要留长，而且要按规定适&lt;br /&gt;　　度修剪。&lt;br /&gt;　贵宾犬，幼犬有幼犬的披毛造型，成犬有成犬的造型，形态上也有多种的款式。&lt;br /&gt;　　这些都是特有的犬种所必须维持的标准造型，那短毛狗是否就不需要美容？那可错了，胡子需要修剪、肛门四周、尾巴内侧的披毛需要修饰，耳朵要清理，披毛要维持光亮，甚至有些因掉毛或皮肤问题所造成的外观上的瑕疵，还得依赖专门色料去修补哩。也就是说，每只只狗儿都有属于自己犬种造型上的要求，名犬的养成和维持可是要花费许多的心血，耐心整理和保养，才能有那光鲜亮丽的外表，可不是件简单的事呢！！&lt;br /&gt;　　居家宠物的美容&lt;br /&gt;　再来就是说到家里的那只宝贝爱狗了，一只披毛长逸及地的西施犬或马尔济斯是相当吸引人、而且是赏心悦目的。不过想将一身亮力的披毛整理的一丝不茍，可就不是一般人可做的到了。&lt;br /&gt;　像可卡及大多数的梗类，必须一直维持着那副独特的造型，因为经过刻意修剪出的漂亮外型，才是它们的迷人所在。要不然，一段长时间不修剪毛发时，外型会截然不同，可能丑的让你无法接受，就像只流浪狗一般，你可能完全分不出它的品种为何。&lt;br /&gt;　一般的宠物，可以依家人的需求或喜爱，来为它修剪出各种造型，或是嫌造型麻烦时索性剃光，但是剃光的爱犬虽然好整理，可是它所呈现的模样可能就是剪短后的那副笨拙的外观，除了属于狗儿的自身灵性外，毫无美感而言。&lt;br /&gt;　其实美容只要是整理干净，清爽，保留原有的造型即可。尽管麻烦，但是能够让你的爱犬始终光显亮丽，花点心血、花一点钱，请专门的美容师代劳，装扮的漂亮出色，作为主人的你，岂不是也能感受到那种骄傲。&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', 1494838076, 0, 0, 3, 'UploadFiles/news/20170525/1495705107438290.jpg', '雷米高'),
(4, 1, '宠物美容培训就业前景如何', ' 如果问道什么职业是目前最受欢迎的话那么想当然的要算上宠物美容培训师了，这个职业是教会那些想要学习宠物美容方面的，同时这份职业的门槛也比较低', '&lt;p style=&quot;display:float;&quot;&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 如果问道什么职业是目前最受欢迎的话那么想当然的要算上宠物美容培训师了，这个职业是教会那些想要学习宠物美容方面的，同时这份职业的门槛也比较低。&lt;br /&gt;&amp;nbsp;&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 只要你对照顾宠物有一定的经验和想法那么你都可以经过系统的学习再从事。很多人都在好奇这份职业的就业前景怎么样，对此网络上也出现了不同的两种看法。一种看法就是认为宠物美容培训这份职业基本上以后就业会困难，网友给出的原因就是虽然我国的经济水平在这几年已经有了很大的发展。&lt;br /&gt;&amp;nbsp;&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 但是这只是整体水平，各地的经济水平完全不同，人们如果连基本的生活都得不到保障的话那么谁还有心情饲养宠物呢？还有一种看法就是人们的享受生活的意识也在不断提高，因此人们也开始养一只宠物陪伴自己。如果出于这样的情况那么在将来这一类的宠物美容师也一定有更好的发展。&lt;br /&gt;&amp;nbsp;&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 其实任何职业都可以说有着很好的就业前景的，宠物美容培训也是一样。哪怕从事的人再多只要你有着更为勤奋、认真的态度那么老板迟早都是会赏识你的，要知道金子在哪里都是会发光的。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', 1494842317, 1, 0, 4, 'UploadFiles/news/20170525/1495704945258293.jpg', '雷米高'),
(5, 3, '职教联盟，送教到校', '职教联盟，送教到校', '&lt;div align=&quot;center&quot;&gt;&lt;br /&gt;&lt;br /&gt;匠人匠心，技能筑梦&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;br /&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251143032190.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;center&quot;&gt;茂名市交通高级技工学校第八届技能节今天已经完满结束。&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251143434366.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;center&quot;&gt;雷米高宠物美容师学校携着匠人匠心的精神送教到校&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251144109576.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;&lt;div align=&quot;center&quot;&gt;为宠物美容行业培养更多优秀人才&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251144363160.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;秉承&amp;quot;雷米高之心、待宠如亲&amp;quot;的服务理念，积极宏扬科学养宠的宠物文化&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251145019718.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;p style=&quot;text-align:center;&quot;&gt;帮助更多宠物行业受好者找到自己的职业发展方向&lt;/p&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;', 1494842586, 5, 0, 5, 'UploadFiles/news/20170525/1495706012512654.jpg', '雷米高'),
(6, 3, ' 广州6月不平凡，雷米高宠物美容师学校助你冲刺CKU', '广州6月不平凡，雷米高宠物美容师学校助你冲刺CKU，CKU考前培训招生中', '&lt;p align=&quot;center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;广州6月不平凡，雷米高宠物美容师学校助你冲刺CKU，CKU考前培训招生中&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;color:#6B6C6E;font-family:微软雅黑;font-size:24px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;color:#3E3E3E;line-height:20.8px;background-color:#FFFFFF;&quot;&gt;CKU宠物美容师鉴定考将于6月23日在广州举行，届时数百名宠物美容师将会同场竞技，&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;color:#6B6C6E;font-family:微软雅黑;font-size:24px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;color:#3E3E3E;line-height:20.8px;background-color:#FFFFFF;&quot;&gt;接受审核，争取专业美容师的荣誉。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color:#6B6C6E;font-family:微软雅黑;font-size:24px;text-align:center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#000000;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#3E3E3E;font-size:16px;line-height:20.8px;background-color:#FFFFFF;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;line-height:20.8px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;line-height:20.8px;&quot;&gt;CKU宠物美容师鉴定考考前培训&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;选择雷米高宠物美容师学校&amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color:#6B6C6E;font-family:微软雅黑;font-size:24px;text-align:center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;color:#000000;&quot;&gt;&lt;strong&gt;&amp;nbsp;&lt;strong&gt;&lt;span style=&quot;font-size:18px;color:#000000;&quot;&gt;高通过率 是你信心的保证&lt;/span&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251117132616.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251118016641.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', 1494842820, 14, 0, 6, 'UploadFiles/news/20170525/1495682319721593.png', '雷米高'),
(7, 6, '如何开一家成功的宠物店', '你想做信用的，你想做高质量的，你想做好售后口碑的，你想永续经营的，我们来一起完成这个梦想，请你加入我们的团队，一起成功', '&lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;br /&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;一&amp;nbsp;、开设一家宠物店，它的营收来自4大板块：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;1、宠物销售，&lt;/strong&gt;最会赚钱的项目，也是最赔钱的项目，更是不好做信用的项目；&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;2、美容收入，&lt;/strong&gt;是最容易保本的项目，也是最辛苦的项目，做好的关键在专业技术水平；&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;3、用品销售，&lt;/strong&gt;前两项做好了，用品销售自然好，最大问题在库存；&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;4、寄养收入，&lt;/strong&gt;最容易赚钱的项目，也是会出现最不好处理问题的项目。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;二、一个完整宠物店的10大系统：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;1、&lt;/strong&gt;定位及选址：定位不清楚，店就不知选在哪里？如何装修？花费多少？&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;2、&lt;/strong&gt;每日的清洁卫生和防疫：整洁卫生是每日随时要做的，规划不好，耗时耗力效果差。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;3、&lt;/strong&gt;宠物狗的进货：狗的进货，有两个灶门，这是大部分业主无法突破的，一年365天，天天要有高质量的狗（质量越高，数量越小，质量越高，越难买到。二是所有卖给客户的狗，都不会有狗瘟和细小，能突破这两个灶门，才能做出你的品牌，才能不用与同行比价格。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;4、&lt;/strong&gt;喂养：30日龄的狗如何喂养，生病的狗如何喂养，大病初愈的狗如何喂养，如何喂养出健康的狗？&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;5、&lt;/strong&gt;宠物护理：宠物店要解决90%的皮肤病、呼吸道及消化道的疾病问题，做不好，会损失很多盈利。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;6、&lt;/strong&gt;美容：美容师的不稳定，技术的落差，造成生意的落差，这是美容室生意比较难解决的问题，美容室有一个很好赚钱的地方就是治疗皮肤病。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;7、&lt;/strong&gt;用品进货：宠物用品的货，不下千项，如何进货，不造成你的压货。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;8、&lt;/strong&gt;寄养：你知道什么狗不能收寄养？你知道因为收了寄养，让宠物店蒙受了惨重损失。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;9、&lt;/strong&gt;销售及管理：你知道你一个月赚多少吗？如何做好进货表，销货表，日报表、月报表（那一切很简单，因为我们是个体户）&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;10、&lt;/strong&gt;销售技巧（业务能力）：你具备了专业知识吗？你懂销售心理学吗？如何天天卖狗，如何一天售出七八条狗，销售技巧你准备好了吗？&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;三、欢迎加入我们&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;你想做信用的，你想做高质量的，你想做好售后口碑的，你想永续经营的，我们来一起完成这个梦想，请你加入我们的团队，一起成功！&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:黑体;&quot;&gt;加入我们团队的好处：&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;1、&lt;/strong&gt;有完整的规划性（生意定位、选址、开业、运营策划、促销、品牌等等）&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;2、&lt;/strong&gt;有完整的教育性（业主的教育进入特训，帮忙完成业主的培训和美容师的培训或者美容师的调度资源。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;3、&lt;/strong&gt;有完整的支持性（自己品牌及旗下单位的支持，让加盟商享受低收费，高档的宠物健康保障服务）。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;4、&lt;/strong&gt;有完整的进货性（尤其是高质量的狗，一个月内对狗瘟和细小的保证，让业主也可给客户一个月的保证）。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;5、&lt;/strong&gt;有完整的库存回收性（卖不动的狗和用品，可换货）&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;6、&lt;/strong&gt;有完整的销售企划性（不定时的企划案，可以全面的推动，众志成城，胜过业主的单打独斗，呵呵，不成功也难！&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;因为加入我们的团队，有品牌性，有团队性，不用经验学好了，店的名声可能做臭了，不用花费不当的钱，造成资金周转不善，不会因为小店经营，而人手困难，不用组织进货的困难而造成成本增加，开店当老板，想必人人喜欢，但要当一个成功的老板，未必人人能够达到，而我们用一个团队的力量，来一起实现。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;四、国内宠物业者的经营困境概况&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;1、&lt;/strong&gt;狗的品质和来源不稳定，健康没保证，客户抱怨，疲于奔命。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;2、&lt;/strong&gt;没有经验就开宠物店，拿客人来当实验，经验学到了，名声也做臭了。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;3、&lt;/strong&gt;店主事事须亲力亲为，造成长期的劳累，但结果呢，店越做，人越少，获利少，业主越做心越小，客人越来越少，后来业主无心经营；&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;4、&lt;/strong&gt;不当进货，造成资金周转困难，旧狗卖不动，新狗进不来。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;5、&lt;/strong&gt;招不到人才，留不住人才，待遇和工作环境、发展和前途，都留不到人的，久而久之，放弃了这个生意。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;70%的单打独斗的宠物店，营业不会坚持两年，为什么，就是因为上述原因。通过加入我们，我们就会有另一片天，不断发展，越做越省心。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;br /&gt;&lt;/span&gt;&lt;/p&gt;', 1495705587, 0, 0, 3, 'UploadFiles/news/20170525/1495705587677525.jpg', '雷米高');

-- --------------------------------------------------------

--
-- 表的结构 `lr_news_cat`
--

CREATE TABLE `lr_news_cat` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '新闻分类表',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lr_news_cat`
--

INSERT INTO `lr_news_cat` (`id`, `name`, `addtime`) VALUES
(1, '行业资讯', 1494582033),
(4, '宠物百科', 1494839440),
(3, '最新动态', 1494839412),
(5, '开班信息', 1494839454),
(6, '开店秘籍', 1495531391);

-- --------------------------------------------------------

--
-- 表的结构 `lr_order`
--

CREATE TABLE `lr_order` (
  `id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `pay_sn` varchar(20) DEFAULT NULL COMMENT '支付单号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `amount` decimal(9,2) DEFAULT '0.00' COMMENT '优惠后价格',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '购买时间',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `type` enum('weixin','alipay','cash') DEFAULT 'weixin' COMMENT '支付方式',
  `price_h` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '真实支付金额',
  `status` tinyint(2) NOT NULL DEFAULT '10' COMMENT '订单状态{0,已取消10未付款20代发货30待收货40待评价50交易完成51交易关闭',
  `vid` int(11) DEFAULT '0' COMMENT '优惠券ID',
  `receiver` varchar(15) NOT NULL COMMENT '收货人',
  `tel` char(15) NOT NULL COMMENT '联系方式',
  `address_xq` varchar(50) NOT NULL COMMENT '地址详情',
  `code` int(11) NOT NULL COMMENT '邮编',
  `post` int(11) DEFAULT NULL COMMENT '快递ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '买家留言',
  `post_remark` varchar(255) NOT NULL COMMENT '邮费信息',
  `product_num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '微信交易单号',
  `kuaidi_name` varchar(10) DEFAULT NULL COMMENT '快递名称',
  `kuaidi_num` varchar(20) DEFAULT NULL COMMENT '运单号',
  `back` enum('1','2','0') DEFAULT '0' COMMENT '标识客户是否有发起退款1申请退款 2已退款',
  `back_remark` varchar(255) DEFAULT NULL COMMENT '退款原因',
  `back_addtime` int(11) DEFAULT '0' COMMENT '申请退款时间',
  `order_type` tinyint(2) DEFAULT '1' COMMENT '订单类型 1普通订单 2抢购订单'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_order`
--

INSERT INTO `lr_order` (`id`, `order_sn`, `pay_sn`, `shop_id`, `uid`, `price`, `amount`, `addtime`, `del`, `type`, `price_h`, `status`, `vid`, `receiver`, `tel`, `address_xq`, `code`, `post`, `remark`, `post_remark`, `product_num`, `trade_no`, `kuaidi_name`, `kuaidi_num`, `back`, `back_remark`, `back_addtime`, `order_type`) VALUES
(1, '2527542452', '242542563653', 1, 1, '20.00', '20.00', 1493342432, 1, 'weixin', '0.00', 20, 0, 'eer', '13454565656', '问问投入法国恢复大飞哥', 0, NULL, NULL, '', 1, NULL, NULL, NULL, '2', '朔方南街', 1493344432, 1),
(2, '2017050810256495', NULL, 0, 1, '0.10', '0.10', 1494212943, 0, 'weixin', '0.00', 20, 0, '小程序', '13422334455', '吉林省 白山市 江源区 胜多负少的想法地方小高层上大学非常棒', 220605, 0, 'aaaa', '', 1, NULL, '顺丰快递', '43214321423', '0', NULL, 0, 1),
(3, '2017051010257975', NULL, 39, 1, '114.50', '0.00', 1494408303, 0, 'weixin', '0.00', 10, 2, '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', 220503, 0, '测试', '', 14, NULL, NULL, NULL, '0', NULL, 0, 1),
(4, '2017052556525397', NULL, 48, 1, '9.00', '9.00', 1495710472, 0, 'weixin', '0.00', 10, 0, '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', 220503, 0, '哈哈', '', 1, NULL, NULL, NULL, '0', NULL, 0, 1),
(5, '2017052652101575', NULL, 0, 1, '470.00', '470.00', 1495782164, 0, 'weixin', '0.00', 10, 0, '小小', '13455882266', '浙江省 丽水市 莲都区 什么街道什么路什么号什么附近', 331102, 0, '235', '', 2, NULL, NULL, NULL, '0', NULL, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `lr_order_product`
--

CREATE TABLE `lr_order_product` (
  `id` int(11) NOT NULL COMMENT '订单商品信息表',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `pay_sn` varchar(20) DEFAULT NULL COMMENT '支付单号',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `photo_x` varchar(100) DEFAULT NULL COMMENT '商品图',
  `pro_buff` varchar(255) DEFAULT NULL COMMENT '产品属性',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '购买数量',
  `pro_guige` varchar(50) DEFAULT NULL COMMENT '规格id和规格名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_order_product`
--

INSERT INTO `lr_order_product` (`id`, `pid`, `pay_sn`, `order_id`, `name`, `price`, `photo_x`, `pro_buff`, `addtime`, `num`, `pro_guige`) VALUES
(1, 2, '242542563653', 1, '发表差别v', '20.00', 'UploadFiles/product/20170428/1493342431423135.jpg', NULL, 1493342432, 1, NULL),
(2, 277, NULL, 2, '抢购产品设置测试这里是标题', '0.10', 'UploadFiles/product/20170506/1494037725840566.jpg', NULL, 1494212943, 1, NULL),
(3, 272, NULL, 3, '不是开心果 胜似开心果', '2.00', 'UploadFiles/product/20170508/1494231242827074.jpg', '', 1494408303, 6, ''),
(4, 274, NULL, 3, '给自己一个惊喜，给世界一个惊喜', '15.00', 'UploadFiles/product/20170428/1493342431423135.jpg', '', 1494408303, 1, ''),
(5, 269, NULL, 3, '国外进口 还是熟悉的饼干味', '12.50', 'UploadFiles/product/20170508/1494231776498205.jpg', '', 1494408303, 7, ''),
(6, 264, NULL, 4, '过去，平淡无奇；而未来，却多姿多彩', '9.00', 'UploadFiles/product/20170508/1494234169630484.jpg', '', 1495710472, 1, ''),
(7, 269, NULL, 5, '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇20kg 金毛狗粮', '235.00', 'UploadFiles/product/20170526/1495777671397934.jpg', '', 1495782164, 2, '');

-- --------------------------------------------------------

--
-- 表的结构 `lr_post`
--

CREATE TABLE `lr_post` (
  `id` int(11) NOT NULL COMMENT '物流快递表',
  `name` varchar(20) NOT NULL COMMENT '快递名称',
  `price` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '价格',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `price_max` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '满多少包邮',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_post`
--

INSERT INTO `lr_post` (`id`, `name`, `price`, `sort`, `price_max`, `pid`) VALUES
(1, '顺丰快递（满388包邮）', '12', 0, '388', 0),
(2, 'EMS', '22', 0, '0', 0),
(3, '顺丰生鲜', '0', 0, '0', 44);

-- --------------------------------------------------------

--
-- 表的结构 `lr_product`
--

CREATE TABLE `lr_product` (
  `id` int(11) NOT NULL COMMENT '产品表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商铺id',
  `brand_id` int(11) UNSIGNED DEFAULT NULL COMMENT '品牌ID',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `intro` varchar(100) DEFAULT NULL COMMENT '广告语',
  `pro_number` varchar(100) DEFAULT NULL COMMENT '产品编号',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `price_yh` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠价格',
  `price_jf` int(11) NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `photo_x` varchar(100) DEFAULT NULL COMMENT '小图',
  `photo_d` varchar(100) DEFAULT NULL COMMENT '大图',
  `photo_string` text COMMENT '图片组',
  `content` text COMMENT '商品详情',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NOT NULL COMMENT '修改时间',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `renqi` int(11) NOT NULL DEFAULT '0' COMMENT '人气',
  `shiyong` int(11) NOT NULL DEFAULT '0' COMMENT '购买数',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐 1推荐  0不推荐',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `del_time` int(10) DEFAULT '0' COMMENT '删除时间',
  `pro_buff` varchar(255) DEFAULT NULL COMMENT '产品属性',
  `cid` int(11) NOT NULL COMMENT '分类id',
  `company` char(10) DEFAULT NULL COMMENT '单位',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否新品',
  `is_down` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下架状态',
  `is_hot` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否热卖',
  `is_sale` tinyint(1) DEFAULT '0' COMMENT '是否折扣',
  `start_time` int(11) DEFAULT '0' COMMENT '抢购开始时间',
  `end_time` int(11) UNSIGNED DEFAULT '0' COMMENT '抢购结束时间',
  `pro_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '产品类型 1普通 2抢购产品'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_product`
--

INSERT INTO `lr_product` (`id`, `shop_id`, `brand_id`, `name`, `intro`, `pro_number`, `price`, `price_yh`, `price_jf`, `photo_x`, `photo_d`, `photo_string`, `content`, `addtime`, `updatetime`, `sort`, `renqi`, `shiyong`, `num`, `type`, `del`, `del_time`, `pro_buff`, `cid`, `company`, `is_show`, `is_down`, `is_hot`, `is_sale`, `start_time`, `end_time`, `pro_type`) VALUES
(264, 0, 6, '雷米高新澳丽得猫粮海洋鱼味英国短毛折耳猫猫粮去毛球幼猫粮500g', '雷米高新澳丽得猫粮海洋鱼味英国短毛折耳猫猫粮去毛球幼猫粮500g', '90066013', '19.00', '13.00', 6, 'UploadFiles/product/20170526/1495762229304939.jpg', 'UploadFiles/product/20170526/1495762231681695.jpg', ',UploadFiles/product/20170526/1495762739695509.jpg,UploadFiles/product/20170526/1495762740619202.jpg,UploadFiles/product/20170526/1495762740388968.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260937453721.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260937564020.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260938113668.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260938319655.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260938402220.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260938487013.jpg\" alt=\"\" width=\"100%\" />', 1478742144, 1495762739, 0, 889, 1, 90000, 1, 1, 1498824033, NULL, 15, '500g', 1, 0, 1, 0, 0, 0, 1),
(265, 0, 4, '狗狗沐浴露宠物专业护理香波八合一泰迪金毛比熊犬猫抑菌除臭止痒', '天然滋养 全效护理 美毛护毛留香 狗狗沐浴露宠物专业护理香波八合一', 'ft011004025', '59.00', '37.90', 18, 'UploadFiles/product/20170526/1495771391625836.jpg', 'UploadFiles/product/20170526/1495771392693529.jpg', ',UploadFiles/product/20170526/1495771392559257.jpg,UploadFiles/product/20170526/1495771392113053.jpg,UploadFiles/product/20170526/1495771392237398.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261201254306.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261201359239.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261201427312.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261201534401.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202054250.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202238139.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202429482.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202519517.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202583892.jpg\" alt=\"\" width=\"100%\" />', 1478742214, 1495771390, 0, 123, 0, 10000, 1, 1, 1498824042, NULL, 9, '件', 1, 0, 0, 0, 0, 0, 1),
(268, 0, 1, '雷米高 狗狗牛奶粉 宠物奶粉泰迪 贵宾幼犬奶粉 营养小狗牛奶粉', '强化奶粉 增强抵抗力 营养易吸收 雷米高 狗狗牛奶粉', 'ft01105010', '113.00', '45.00', 22, 'UploadFiles/product/20170526/1495767947517514.jpg', 'UploadFiles/product/20170526/1495767950396434.jpg', ',UploadFiles/product/20170526/1495767950543783.jpg,UploadFiles/product/20170526/1495767950281402.jpg,UploadFiles/product/20170526/1495767950778504.jpg,UploadFiles/product/20170526/1495767950531297.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261104046491.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261104198889.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261104477209.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261105027640.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261105132624.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261105255578.jpg\" alt=\"\" width=\"100%\" />', 1479720083, 1495767947, 0, 600, 3, 10000, 0, 1, 1498824052, NULL, 5, '件', 0, 0, 1, 0, 0, 0, 1),
(269, 0, 2, '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇20kg 金毛狗粮', '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇 警犬用粮澳洲原料20省包邮', '无', '586.00', '235.00', 117, 'UploadFiles/product/20170526/1495777671397934.jpg', 'UploadFiles/product/20170526/1495777677874266.jpg', ',UploadFiles/product/20170526/1495777678397043.jpg,UploadFiles/product/20170526/1495777678489070.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261346118808.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261346435207.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261346536153.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261347048671.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261347256898.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261347327676.jpg\" alt=\"\" width=\"100%\" />', 1479891357, 1495777671, 0, 800, 14, 99998, 1, 1, 1498824024, NULL, 8, '20000g', 1, 0, 1, 0, 0, 0, 1),
(270, 0, 3, '本地测试产品（勿拍，不发货）', '本地测试产品（勿拍，不发货）', 'SCC1212', '0.30', '0.01', 0, 'UploadFiles/product/20170526/1495778290121085.jpg', 'UploadFiles/product/20170526/1495778296990190.jpg', ',UploadFiles/product/20170526/1495778296780911.jpg', '本地测试产品（勿拍，不发货）', 1482053270, 1495778290, 0, 0, 6, 1000, 0, 1, 1498824062, '3,4,6', 14, '件', 0, 0, 0, 0, 0, 0, 1),
(271, 0, 4, '雷米高宠物沐浴露狗狗沐浴露 除蚤用品 猫洗澡香波400ml包邮26省', '雷米高宠物沐浴露狗狗沐浴露 除蚤用品 猫洗澡香波400ml包邮26省', 'ft011004001', '45.00', '21.00', 10, 'UploadFiles/product/20170526/1495763622406793.jpg', 'UploadFiles/product/20170526/1495763625265531.jpg', ',UploadFiles/product/20170526/1495763626202044.jpg,UploadFiles/product/20170526/1495763626400295.jpg,UploadFiles/product/20170526/1495763626684997.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260952099310.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260952354111.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260952529620.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260953098394.jpg\" alt=\"\" width=\"100%\" />', 1482053708, 1495763621, 0, 0, 1, 7000, 0, 1, 1498824072, '1,2,3', 17, '件', 0, 0, 1, 0, 0, 0, 1),
(272, 0, 1, '雷米高狗狗钙片 补钙营养品维力克200片 幼犬猫宠物钙片 26省包邮', '补钙快 易吸收 全效乳钙 促生长 雷米高狗狗钙片 补钙 保健', 'ft011050004', '91.00', '37.00', 18, 'UploadFiles/product/20170526/1495766526146777.jpg', 'UploadFiles/product/20170526/1495766532856705.jpg', ',UploadFiles/product/20170526/1495766532718395.jpg,UploadFiles/product/20170526/1495766532649462.jpg,UploadFiles/product/20170526/1495766532515891.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261039494648.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261040081674.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261040265180.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261040578912.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261041089338.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261041168305.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261041238984.jpg\" alt=\"\" width=\"100%\" />', 1482216408, 1495766526, 0, 142, 9, 20000, 1, 1, 1498824082, '', 16, '件', 0, 0, 1, 0, 0, 0, 1),
(273, 0, 1, '雷米高狗零食高钙磨牙除口臭饼干500g狗狗饼干泰迪宠物零食', '雷米高狗零食高钙磨牙除口臭饼干500g狗狗饼干泰迪宠物零食', '2017010602', '30.00', '15.00', 7, 'UploadFiles/product/20170526/1495770206696360.jpg', 'UploadFiles/product/20170526/1495770218907047.jpg', ',UploadFiles/product/20170526/1495770218888408.jpg,UploadFiles/product/20170526/1495770218135820.jpg,UploadFiles/product/20170526/1495770218928706.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261141577345.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142167605.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142257662.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142347287.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142442978.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142554691.png\" alt=\"\" width=\"100%\" />', 1482309559, 1495770206, 0, 450, 13, 30, 0, 1, 1498824092, '', 13, '件', 0, 0, 1, 0, 0, 0, 1),
(274, 0, 2, '雷米高澳宝狗粮幼犬天然牛肉味通用型狗粮泰迪金毛博美比熊小型犬', '雷米高澳宝狗粮幼犬天然牛肉味通用型狗粮泰迪金毛博美比熊小型犬', '无', '31.00', '14.00', 7, 'UploadFiles/product/20170526/1495765398905975.jpg', 'UploadFiles/product/20170526/1495765405182645.jpg', ',UploadFiles/product/20170526/1495765405320796.jpg,UploadFiles/product/20170526/1495765405245042.jpg,UploadFiles/product/20170526/1495765405106585.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261020427148.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261020546632.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261021072904.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261021202061.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261021333901.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261021509876.jpg\" alt=\"\" width=\"100%\" />', 1493342432, 1495765397, 0, 55, 1, 90000, 1, 1, 1498824102, NULL, 8, '500g', 0, 0, 1, 0, 0, 0, 1),
(278, 0, 5, '雷米高 赛极号功能粮天然幼猫怀孕母猫粮挑嘴猫咪主粮包邮1.5kg', '天然配方粮适口性极佳营养精调理肠胃 赛极号功能粮天然幼猫怀孕母猫粮', '2014101604', '237.00', '95.00', 47, 'UploadFiles/product/20170526/1495764457604174.jpg', 'UploadFiles/product/20170526/1495764459217869.jpg', ',UploadFiles/product/20170526/1495764459711428.jpg,UploadFiles/product/20170526/1495764459287197.jpg,UploadFiles/product/20170526/1495764459704689.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261006399451.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261006547530.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261007112668.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261007232470.jpg\" alt=\"\" width=\"100%\" />', 1494295901, 1495764457, 0, 100, 0, 90000, 0, 0, 0, NULL, 15, '1500g', 0, 0, 1, 0, 0, 0, 1),
(279, 0, 6, '贵宾狗粮E冠雷米高狗粮成犬泰迪狗粮小型犬天然粮2.5kg包邮', '贵宾狗粮E冠雷米高狗粮成犬泰迪狗粮小型犬天然粮2.5kg包邮', '1021132', '174.00', '72.00', 36, 'UploadFiles/product/20170526/1495760445110489.jpg', 'UploadFiles/product/20170526/1495760448234038.jpg', ',UploadFiles/product/20170526/1495760448897946.jpg,UploadFiles/product/20170526/1495760448281318.jpg,UploadFiles/product/20170526/1495760448437075.jpg', '<p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260858018112.jpg\" alt=\"\" width=\"100%\" /></p><p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260858299679.jpg\" alt=\"\" width=\"100%\" /></p><p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260858381787.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260858548953.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260859056212.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260859168125.jpg\" alt=\"\" width=\"100%\" /></p><p><br /></p><p><br /></p>', 1494296286, 1495760445, 441, 119, 0, 9000, 1, 0, 0, NULL, 8, '2500g', 1, 0, 1, 0, 0, 0, 1),
(280, 0, 3, '测试产品', '哈哈哈瞄瞄上', '110903', '1000.00', '0.01', 200, 'UploadFiles/product/20170629/1498732885604290.jpg', 'UploadFiles/product/20170629/1498732885249312.jpg', ',UploadFiles/product/20170629/1498732885225811.jpg,UploadFiles/product/20170629/1498732885753626.jpg,UploadFiles/product/20170629/1498732886562046.jpg', '互联网', 1498732886, 1498732885, 0, 100, 0, 999999, 0, 1, 1498824015, NULL, 8, '只', 1, 0, 1, 0, 0, 0, 1),
(281, 0, 7, 'Xiaomi/小米 红米手机4A ', '超长待机超薄迷你学生机智能机老人机', '110903', '699.00', '599.00', 599, 'UploadFiles/product/20170630/1498820794749927.jpg', 'UploadFiles/product/20170630/1498820794117920.jpg', ',UploadFiles/product/20170630/1498820794813219.jpg', '<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2UOBZeTAKh1JjSZFDXXbKlFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB29Ih5vbtlpuFjSspoXXbcDpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2wm0tztFopuFjSZFHXXbSlXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2z.suzhtmpuFjSZFqXXbHFpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2_w2evmJjpuFjy0FdXXXmoFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2c1UqfSvHfKJjSZFPXXbttpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB28dXIvbXlpuFjSszfXXcSGXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2PR0AzEdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2seaLXbdvt1JjSZFuXXXG0FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2TqpQztRopuFjSZFtXXcanpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2m84AzEdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2AapczstnpuFjSZFKXXalFFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2e73YzkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2fVxPvgxlpuFjSszgXXcJdpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2RkWHcjm2.eBjSZFtXXX56VXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2kFfMbNmI.eBjy0FlXXbgkVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2viKLcheK.eBjSZFuXXcT4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2nsGHcgCN.eBjSZFoXXXj0FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2dDCJcfSM.eBjSZFNXXbgYpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2t2ODcX5N.eBjSZFKXXX_QVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2_CSFcmiK.eBjSZFsXXbxZpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2WryAcduO.eBjSZFCXXXULFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2N14_auNOdeFjSZFBXXctzXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2WlWLccCO.eBjSZFzXXaRiVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2F_WDciGO.eBjSZFEXXcy9VXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2kK8_auNOdeFjSZFBXXctzXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2ZUCsclyN.eBjSZFIXXXbUVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB27ECsclyN.eBjSZFIXXXbUVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\"><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px;\">商品系统中“规格参数”由系统自动生成，实际参数请以详情页面中描述为准<img alt=\"\" width=\"100%\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2fsWHc3hJc1FjSZFDXXbvnFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 10px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" /></span></span></span></p>', 1498820794, 1498820794, 0, 0, 0, 999999, 1, 0, 0, NULL, 15, '台', 1, 0, 1, 0, 0, 0, 1),
(282, 0, 4, 'Xiaomi/小米 小米笔记本AIR ', '12.5英寸 M3 4G 256G 超薄电脑游戏本', '78045380', '3899.00', '3899.00', 3899, 'UploadFiles/product/20170630/1498820925308628.jpg', 'UploadFiles/product/20170630/1498820926851847.jpg', ',UploadFiles/product/20170630/1498820926923500.jpg', '<img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2pghejHRkpuFjSspmXXc.9XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2zCkJjrBkpuFjy1zkXXbSpFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2lLs_jC0jpuFjy0FlXXc0bpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2PPX8lstnpuFjSZFvXXbcTpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2zjQMfhRDOuFjSZFzXXcIipXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2ZohvlxtmpuFjSZFqXXbHFpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2IIhTlxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2sq8UlstnpuFjSZFKXXalFFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2MW8UlstnpuFjSZFKXXalFFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2v.Oolr4npuFjSZFmXXXl4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB20_j6pdhvOuFjSZFBXXcZgFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2x7lyvstnpuFjSZFvXXbcTpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2Ru4jjMJlpuFjSspjXXcT.pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Rll7lEhnpuFjSZFEXXX0PFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hstTlxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB21GM7jrtlpuFjSspoXXbcDpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2UqM7jwxlpuFjSszbXXcSVpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB28WQ7jrtlpuFjSspoXXbcDpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB29OkYjwxlpuFjSszgXXcJdpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2ynUTjxXkpuFjy0FiXXbUfFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB22vdjjMJlpuFjSspjXXcT.pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br />', 1498820926, 1498820925, 0, 900, 0, 999999, 0, 0, 0, NULL, 9, '台', 1, 0, 1, 0, 0, 0, 1);
INSERT INTO `lr_product` (`id`, `shop_id`, `brand_id`, `name`, `intro`, `pro_number`, `price`, `price_yh`, `price_jf`, `photo_x`, `photo_d`, `photo_string`, `content`, `addtime`, `updatetime`, `sort`, `renqi`, `shiyong`, `num`, `type`, `del`, `del_time`, `pro_buff`, `cid`, `company`, `is_show`, `is_down`, `is_hot`, `is_sale`, `start_time`, `end_time`, `pro_type`) VALUES
(283, 0, 3, '小米路由器 ', 'Pro智能无线千兆网口家用稳定穿墙四天线高速wifi路由', '4343143f', '499.00', '499.00', 499, 'UploadFiles/product/20170630/1498823086228577.jpg', 'UploadFiles/product/20170630/1498823086133085.jpg', ',UploadFiles/product/20170630/1498823086145540.jpg', '<br /><br /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB28gdCgbplpuFjSspiXXcdfFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB25kVHgbRkpuFjSspmXXc.9XXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hBxngl0lpuFjSszdXXcdxFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2kJF0gmJjpuFjy0FdXXXmoFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2B7RrgbFlpuFjy0FgXXbRBVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2is4mghXkpuFjy0FiXXbUfFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2IRFngl0lpuFjSszdXXcdxFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2fL4jgmBjpuFjSsplXXa5MVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2T.XuhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2VMluhxBmpuFjSZFDXXXD8pXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2DzJghxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2jU8Fhr4npuFjSZFmXXXl4FXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2qEluhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2URtthxxmpuFjSZFNXXXrRXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2cMFthstnpuFjSZFvXXbcTpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2Fmw2hhtmpuFjSZFqXXbHFpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2yztBhrxmpuFjSZJiXXXauVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2hntzhC8mpuFjSZFMXXaxpVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2MupthrlmpuFjSZFlXXbdQXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB27z4ghxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Kv4JhxlmpuFjSZPfXXc9iXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2bD3QhkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2PldthtRopuFjSZFtXXcanpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2yg01b5C9MuFjSZFoXXbUzFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2uD7QhkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2eTxuhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2Ubxfgg0kpuFjSspdXXX4YXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hHdNgbFkpuFjy1XcXXclapXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2lgBGgl0kpuFjSsppXXcGTXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2EMBGgl0kpuFjSsppXXcGTXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2eYhNgbFkpuFjy1XcXXclapXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Mh4Ggl8lpuFjSspaXXXJKpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2SKo8f3JkpuFjSszcXXXfsFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br /><div style=\"top: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB28gdCgbplpuFjSspiXXcdfFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB25kVHgbRkpuFjSspmXXc.9XXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hBxngl0lpuFjSszdXXcdxFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2kJF0gmJjpuFjy0FdXXXmoFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2B7RrgbFlpuFjy0FgXXbRBVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2is4mghXkpuFjy0FiXXbUfFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2IRFngl0lpuFjSszdXXcdxFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2fL4jgmBjpuFjSsplXXa5MVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2T.XuhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2VMluhxBmpuFjSZFDXXXD8pXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2DzJghxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2jU8Fhr4npuFjSZFmXXXl4FXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2qEluhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2URtthxxmpuFjSZFNXXXrRXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2cMFthstnpuFjSZFvXXbcTpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2Fmw2hhtmpuFjSZFqXXbHFpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2yztBhrxmpuFjSZJiXXXauVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2hntzhC8mpuFjSZFMXXaxpVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2MupthrlmpuFjSZFlXXbdQXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB27z4ghxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Kv4JhxlmpuFjSZPfXXc9iXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2bD3QhkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2PldthtRopuFjSZFtXXcanpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2yg01b5C9MuFjSZFoXXbUzFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2uD7QhkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2eTxuhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2Ubxfgg0kpuFjSspdXXX4YXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hHdNgbFkpuFjy1XcXXclapXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2lgBGgl0kpuFjSsppXXcGTXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2EMBGgl0kpuFjSsppXXcGTXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2eYhNgbFkpuFjy1XcXXclapXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Mh4Ggl8lpuFjSspaXXXJKpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2SKo8f3JkpuFjSszcXXXfsFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br /></div>', 1498823086, 1498823086, 0, 0, 0, 999999, 0, 0, 0, NULL, 5, '台', 1, 0, 1, 0, 0, 0, 1),
(284, 0, 7, 'Xiaomi/小米 小米手机5c ', '4g松果芯片超薄迷你智能拍照学生手机', '1299', '1299.00', '1299.00', 1299, 'UploadFiles/product/20170630/1498823358368715.jpg', 'UploadFiles/product/20170630/1498823358298522.jpg', ',UploadFiles/product/20170630/1498823358651873.jpg', '<img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2sGPTg00opuFjSZFxXXaDNVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2LXA1fHRkpuFjSspmXXc.9XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2VXUtbyC9MuFjSZFoXXbUzFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2T4MMfSxjpuFjSszeXXaeMVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2gaP6g9FmpuFjSZFrXXayOXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB285.DfSBjpuFjSsplXXa5MVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2BPnkg7qvpuFjSZFhXXaOgXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2o1.FfR0kpuFjSsziXXa.oVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2oOALfMxlpuFjSszgXXcJdpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB28mEVfHVkpuFjSspcXXbSMVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2jUAYfR0kpuFjy1XaXXaFkVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2ODoPfMRkpuFjy1zeXXc.6FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2pdZCfMNlpuFjy0FfXXX3CpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2fgISfHtlpuFjSspoXXbcDpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2X3AkgY4npuFjSZFmXXXl4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2lgAkgY4npuFjSZFmXXXl4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2vi68g.hnpuFjSZFEXXX0PFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2oZv5g0FopuFjSZFHXXbSlXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB24vLCg0BopuFjSZPcXXc9EpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2qIb8g5RnpuFjSZFCXXX2DXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2nN4of9JjpuFjy0FdXXXmoFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2NTP.g4BmpuFjSZFDXXXD8pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2NY7RfStkpuFjy0FhXXXQzFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2ExU8fR0kpuFjy1XaXXaFkVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2ZplXmYlmpuFjSZFlXXbdQXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2PXJbm4BmpuFjSZFDXXXD8pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2G5sjkHplpuFjSspiXXcdfFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2dZUwkR8lpuFjy0FnXXcZyXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2JOBKhyC9MuFjSZFoXXbUzFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br />', 1498823358, 1498823358, 0, 299, 0, 999999, 0, 0, 0, NULL, 8, '台', 1, 0, 1, 0, 0, 0, 1),
(285, 0, 7, 'Xiaomi/小米 小米手机6 ', '全网通 四曲面机身变焦双摄拍照智能手机', '100fdsa', '3199.00', '3199.00', 100, 'UploadFiles/product/20170630/1498823546796301.jpg', 'UploadFiles/product/20170630/1498823547542774.jpg', ',UploadFiles/product/20170630/1498823547229972.jpg', '<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2vS9moNBmpuFjSZFDXXXD8pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB25DQbmmxjpuFjSszeXXaeMVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2oF0AoNtmpuFjSZFqXXbHFpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2FTamoNBmpuFjSZFDXXXD8pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2CyOeoUdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2WISjoOlnpuFjSZFgXXbi7FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2ksGhoNxmpuFjSZFNXXXrRXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2t_v0jetTMeFjSZFOXXaTiVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2p0pUoSVmpuFjSZFFXXcZApXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2M8GhoUhnpuFjSZFEXXX0PFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB23lmeoOpnpuFjSZFIXXXh2VXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2HMUFmb8kpuFjy0FcXXaUhpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2RbHJmmXlpuFjy0FeXXcJbFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2iY.pmgFkpuFjSspnXXb4qFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2NpcimbJkpuFjy1zcXXa5FFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB24Ucwml8lpuFjSspaXXXJKpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2QpvTmhdkpuFjy0FbXXaNnpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2kYXyeH_0UKFjy1XaXXbKfXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB29GxdmwxlpuFjy0FoXXa.lXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2TJGzoS8mpuFjSZFMXXaxpVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><br style=\"margin: 0px; padding: 0px;\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2rUCKoUlnpuFjSZFjXXXTaVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2WPZRortlpuFjSspfXXXLUpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2AVK3rrBmpuFjSZFAXXaQ0pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2VfxboMxlpuFjSszbXXcSVpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p>', 1498823547, 1498823546, 0, 33, 0, 999999, 0, 0, 0, NULL, 15, '台', 1, 0, 1, 0, 0, 0, 1);
INSERT INTO `lr_product` (`id`, `shop_id`, `brand_id`, `name`, `intro`, `pro_number`, `price`, `price_yh`, `price_jf`, `photo_x`, `photo_d`, `photo_string`, `content`, `addtime`, `updatetime`, `sort`, `renqi`, `shiyong`, `num`, `type`, `del`, `del_time`, `pro_buff`, `cid`, `company`, `is_show`, `is_down`, `is_hot`, `is_sale`, `start_time`, `end_time`, `pro_type`) VALUES
(286, 0, 7, 'Xiaomi/小米 小米手机5S ', '64G 超薄迷你智能指纹解锁拍照学生手机', '432143214', '1999.00', '1999.00', 1999, 'UploadFiles/product/20170630/1498823755863174.jpg', 'UploadFiles/product/20170630/1498823755285774.jpg', ',UploadFiles/product/20170630/1498823755795695.jpg', '<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB24ibfzCVmpuFjSZFFXXcZApXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2RYMHbY1J.eBjy1zeXXX9kVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2GasEcEOO.eBjSZFLXXcxmXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2L2ICb4aJ.eBjSsziXXaJ_XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB27csIcCiK.eBjSZFyXXaS4pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2uWkAcA1M.eBjSZFFXXc3vVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2uPICcA5M.eBjSZFrXXXPgVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB265zUcOKO.eBjSZPhXXXqcpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2UH4va4Rzc1FjSZFPXXcGAFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2AKTMcxaK.eBjSZFAXXczFXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><img alt=\"\" width=\"100%\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2GdXddmiJ.eBjSspoXXcpMFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2PnE_c91I.eBjy0FjXXabfXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB278bZcBaM.eBjSZFMXXcypVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2LF_ScwCN.eBjSZFoXXXj0FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Qb6NcxaK.eBjSZFwXXXjsFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB26TLKcEWO.eBjSZPcXXbopVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2tmTNcpOP.eBjSZFHXXXQnpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2OLYUcvSM.eBjSZFNXXbgYpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2m8_NcByN.eBjSZFgXXXmGXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2l9ZYcp5N.eBjSZFmXXboSXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2DQDTbYWJ.eBjSspdXXXiXFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB29L6Zb4eJ.eBjy1zdXXXfmFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB27bbZb31I.eBjSszeXXc2hpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2iF_0l3NlpuFjy0FfXXX3CpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2kGY9lY0kpuFjy0FjXXcBbVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p>', 1498823755, 1498823754, 0, 199, 0, 999999, 0, 0, 0, NULL, 15, '台', 1, 0, 1, 0, 0, 0, 1),
(287, 0, 4, 'Xiaomi/小米 小米笔记本AIR ', '12.5英寸 i5 8G 256G便携电脑轻薄本', '431543654', '4799.00', '4799.00', 100, 'UploadFiles/product/20170630/1498823891591969.jpg', 'UploadFiles/product/20170630/1498823891539731.jpg', ',UploadFiles/product/20170630/1498823891947929.jpg', '<br /><br /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2o1zxpMxlpuFjy0FoXXa.lXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2P1zxpMxlpuFjy0FoXXa.lXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2kwGApHRkpuFjSspmXXc.9XXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2KONMpNdkpuFjy0FbXXaNnpXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2OExRXcPRfKJjSZFOXXbKEVXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB28ZxApRNkpuFjy0FaXXbRCVXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2HVGRsItnpuFjSZFKXXalFFXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2nFKRsItnpuFjSZFKXXalFFXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2slW2sJFopuFjSZFHXXbSlXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2aiS7sORnpuFjSZFCXXX2DXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br /><div style=\"top: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2o1zxpMxlpuFjy0FoXXa.lXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2P1zxpMxlpuFjy0FoXXa.lXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2kwGApHRkpuFjSspmXXc.9XXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2KONMpNdkpuFjy0FbXXaNnpXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2OExRXcPRfKJjSZFOXXbKEVXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB28ZxApRNkpuFjy0FaXXbRCVXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2HVGRsItnpuFjSZFKXXalFFXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2nFKRsItnpuFjSZFKXXalFFXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2slW2sJFopuFjSZFHXXbSlXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2aiS7sORnpuFjSZFCXXX2DXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br /></div>', 1498823892, 1498823891, 0, 199, 0, 999999, 0, 0, 0, NULL, 9, '台', 1, 0, 1, 0, 0, 0, 1),
(288, 0, 6, '小米无线鼠标', '女生办公家用笔记本电脑游戏便携迷你鼠标', '100342', '64.00', '64.00', 100, 'UploadFiles/product/20170630/1498823998129871.jpg', 'UploadFiles/product/20170630/1498823998992272.jpg', ',UploadFiles/product/20170630/1498823999249234.jpg', '<img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2.Q9klrBnpuFjSZFGXXX51pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2XZ9QlyRnpuFjSZFCXXX2DXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2Fha2lrBmpuFjSZFuXXaG_XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2o79MlEdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2t0FwfxRDOuFjSZFzXXcIipXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2GRaMlEdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2fhm2lrBmpuFjSZFuXXaG_XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2mLa0lCFmpuFjSZFrXXayOXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2J.KRlylnpuFjSZFgXXbi7FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB28n5ClxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2RG8XjMJkpuFjSszcXXXfsFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br />', 1498823999, 1498823998, 0, 100, 0, 999999, 0, 0, 0, NULL, 17, '只', 1, 0, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `lr_product_dp`
--

CREATE TABLE `lr_product_dp` (
  `id` int(11) NOT NULL COMMENT '产品评论表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` int(11) DEFAULT '0' COMMENT '评论订单id',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '评分数',
  `concent` varchar(255) DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `reply_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '回复状态',
  `reply_content` text COMMENT '回复内容',
  `reply_time` int(11) NOT NULL DEFAULT '0' COMMENT '回复时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_product_dp`
--

INSERT INTO `lr_product_dp` (`id`, `uid`, `pid`, `order_id`, `num`, `concent`, `addtime`, `audit`, `reply_status`, `reply_content`, `reply_time`) VALUES
(1, 16, 157, 0, 10, '非常好', 1470212647, 0, 0, NULL, 0),
(2, 16, 159, 0, 10, '口感非常好，野生即食很方便', 1470223379, 0, 0, NULL, 0),
(3, 41, 259, 0, 10, '功能强大，好评！', 1477715118, 0, 0, NULL, 0),
(4, 41, 168, 0, 10, '居家养老好帮手，高科技产品，很好用！', 1477715176, 0, 0, NULL, 0),
(5, 42, 155, 0, 10, '好评', 1479596161, 0, 0, NULL, 0),
(6, 42, 168, 0, 10, '好评', 1479596179, 0, 0, NULL, 0),
(7, 42, 162, 0, 10, '不错', 1479596208, 0, 0, NULL, 0),
(10, 5, 273, 109, 8, '东西非常不错，给力！', 1482907790, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `lr_product_sc`
--

CREATE TABLE `lr_product_sc` (
  `id` int(11) NOT NULL COMMENT '商品收藏表',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1正常 0删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `lr_program`
--

CREATE TABLE `lr_program` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '小程序配置表',
  `title` varchar(20) NOT NULL COMMENT '小程序名称',
  `name` varchar(20) NOT NULL COMMENT '负责人',
  `describe` varchar(200) DEFAULT NULL COMMENT '简单描述',
  `logo` varchar(100) DEFAULT NULL COMMENT 'logo',
  `copyright` varchar(100) DEFAULT NULL COMMENT '版权信息',
  `service_wx` varchar(50) DEFAULT NULL COMMENT '平台客服微信号',
  `tel` varchar(20) DEFAULT NULL COMMENT '平台客服电话',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `uptime` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lr_program`
--

INSERT INTO `lr_program` (`id`, `title`, `name`, `describe`, `logo`, `copyright`, `service_wx`, `tel`, `email`, `uptime`) VALUES
(1, '宠物美容学校22', '宠物美容学校11', '宠物美容学校', 'UploadFiles/logo/1495530723265238.png', 'Copyright © 2016 ramicalschool', '', '4006551365', '2872815158@qq.com', 1498809573);

-- --------------------------------------------------------

--
-- 表的结构 `lr_sccat`
--

CREATE TABLE `lr_sccat` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '产品品牌表',
  `name` varchar(100) NOT NULL COMMENT '品牌名称',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `shop_id` int(11) UNSIGNED DEFAULT '0' COMMENT '店铺id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lr_sccat`
--

INSERT INTO `lr_sccat` (`id`, `name`, `addtime`, `shop_id`) VALUES
(1, '美容院', 1494241343, 0),
(2, '养生馆', 1494241358, 0);

-- --------------------------------------------------------

--
-- 表的结构 `lr_search_record`
--

CREATE TABLE `lr_search_record` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '搜索记录表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `keyword` varchar(255) NOT NULL COMMENT '搜索内容',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '搜索次数',
  `addtime` int(11) DEFAULT '0' COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lr_search_record`
--

INSERT INTO `lr_search_record` (`id`, `uid`, `keyword`, `num`, `addtime`) VALUES
(1, 1, '产品', 26, 1494054770),
(2, 2, '产品', 1, 1494057770),
(3, 5, '模拟', 6, 1494054970),
(4, 3, 'spa产品', 3, 1494059970),
(5, 4, '模拟', 1, 1494057970),
(6, 5, 'spa产品', 1, 1494064970),
(7, 6, 'coco', 1, 1494054970),
(8, 7, '小孩子', 2, 1494054970),
(9, 8, '婴儿用品', 1, 1494054970),
(10, 9, '婴儿用品', 1, 1494054970),
(11, 10, '汽车', 1, 1494054970),
(12, 9, '汽车', 1, 1494054970),
(13, 1, '饼干', 1, 1494054970),
(14, 12, '为什么', 1, 1494054970),
(15, 13, '好的', 1, 1494054970),
(16, 14, '玩具', 1, 1494054970),
(17, 15, '好玩的', 1, 1494054970),
(18, 1, 'spa产品', 2, 1494555638),
(19, 1, '狗粮', 2, 1495781789);

-- --------------------------------------------------------

--
-- 表的结构 `lr_shangchang`
--

CREATE TABLE `lr_shangchang` (
  `id` int(11) NOT NULL,
  `cid` int(11) DEFAULT '0' COMMENT '店铺类别id',
  `name` varchar(20) NOT NULL COMMENT '店铺名称',
  `uname` varchar(10) NOT NULL COMMENT '负责人名称',
  `logo` varchar(100) DEFAULT NULL COMMENT '店铺LOGO',
  `vip_char` varchar(100) DEFAULT NULL COMMENT '店铺公告、广告图',
  `sheng` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `city` int(11) DEFAULT '0' COMMENT '市id',
  `quyu` int(11) DEFAULT '0' COMMENT '区域id',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `address_xq` varchar(255) DEFAULT NULL COMMENT '省市区+地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `location_x` varchar(20) NOT NULL DEFAULT '0' COMMENT '纬度',
  `location_y` varchar(20) NOT NULL DEFAULT '0' COMMENT '经度',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新日期',
  `content` text COMMENT '店铺介绍',
  `intro` varchar(200) DEFAULT NULL COMMENT '店铺广告语',
  `grade` int(2) NOT NULL DEFAULT '10' COMMENT '评分等级1~10',
  `tel` char(15) DEFAULT NULL COMMENT '联系电话',
  `utel` char(15) DEFAULT NULL COMMENT '负责人手机',
  `status` tinyint(2) DEFAULT '1' COMMENT '显示/隐藏',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `wx_appid` varchar(32) DEFAULT NULL COMMENT 'APPID',
  `wx_mch_id` varchar(32) DEFAULT NULL COMMENT '微信支付商户号',
  `wx_key` varchar(100) DEFAULT NULL COMMENT 'API密钥',
  `wx_secret` varchar(64) DEFAULT NULL COMMENT 'AppSecret是APPID对应的接口密码'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_shangchang`
--

INSERT INTO `lr_shangchang` (`id`, `cid`, `name`, `uname`, `logo`, `vip_char`, `sheng`, `city`, `quyu`, `address`, `address_xq`, `sort`, `location_x`, `location_y`, `addtime`, `updatetime`, `content`, `intro`, `grade`, `tel`, `utel`, `status`, `type`, `qq`, `wx_appid`, `wx_mch_id`, `wx_key`, `wx_secret`) VALUES
(9, 1, '北京大帝都高级旗舰店', '串串香', 'UploadFiles/shop/logo/20170508/1494227348768908.jpg', 'UploadFiles/shop/20170508/1494227348490053.jpg', 1, 2, 3, '天安门广场附近王府井知道吗', '北京 北京 东城区 天安门广场附近王府井知道吗', 496, '116.417491', '39.924232', 1466825048, 1494227348, '<p><span style=\"font-size:18px;\">北京大帝都高级旗舰店</span></p><p><span style=\"font-size:12px;\">大帝都 就是飞讯呢</span><br /></p>', '大帝都 就是飞讯呢', 10, '13926154675', '13926154675', 1, 0, '', NULL, NULL, NULL, NULL),
(35, 2, 'CBD阿里斯门迪品牌店', '牛德福', 'UploadFiles/shop/logo/20170508/1494229934647258.jpg', 'UploadFiles/shop/20170508/1494230002408295.jpg', 2151, 2152, 2161, '什么路什么街什么商业中心附近', '广东省 广州市 花都区 什么路什么街什么商业中心附近', 400, '113.168356', '23.382594', 1467969795, 1494230002, '<span style=\"font-size:18px;\">CBD阿里斯门迪品牌店</span>', '什么品牌好 什么好品牌', 10, '13311112334', '13311112334', 1, 1, '', NULL, NULL, NULL, NULL),
(36, 1, '广州国际贸易进出口', 'nick张', 'UploadFiles/shop/logo/20170508/1494229710369534.jpg', 'UploadFiles/shop/20170508/1494230066358172.jpg', 2151, 2152, 2157, 'CBD国际金融中心大楼', '广东省 广州市 天河区 CBD国际金融中心大楼', 100, '113.327464', '23.137898', 1468026641, 1494230066, '<span style=\"font-size:18px;\">广州国际贸易进出口</span>', '国际品牌 你要的这里有', 10, '02044556678', '13928712222', 1, 0, '', NULL, NULL, NULL, NULL),
(39, 2, 'GGN乖乖女自营产品专营店', '曹先生', 'UploadFiles/shop/logo/20170508/1494229020632699.jpg', 'UploadFiles/shop/20170508/1494229020424246.png', 2151, 2152, 2159, '黄埔公园附近', '广东省 广州市 黄埔区 黄埔公园附近', 500, '113.456676', '23.104064', 1468217700, 1494229020, '<p><span style=\"font-size:18px;\">GGN乖乖女自营产品专营店</span></p><p><span style=\"font-size:18px;\"><br /></span></p>', '阿斯顿撒通过 健康不好', 10, '02022221145', '13654547676', 1, 1, '', NULL, NULL, NULL, NULL),
(45, 1, 'CBG藏宝阁搜索专营店', '白先生', 'UploadFiles/shop/logo/20170508/1494227020306856.jpg', 'UploadFiles/shop/20170508/1494227020836280.jpg', 2151, 2152, 2158, '你看着办白云山附近', '广东省 广州市 白云区 你看着办白云山附近', 48, '113.304324', '23.186209', 1472105436, 1494227020, '<p><span style=\"font-size:18px;\">CBG藏宝阁搜索专营店</span></p><p><span style=\"font-size:18px;\"><br /></span></p>', '呵呵呵呵呵 哈哈哈哈哈', 10, '02084796015', '13455568787', 1, 1, '', NULL, NULL, NULL, NULL),
(46, 2, 'KKBS维护卡斯马专营店', 'mini先生', 'UploadFiles/shop/logo/20170508/1494225499674202.jpg', 'UploadFiles/shop/20170508/1494225499169062.jpg', 2151, 2207, 2209, '东方广场还发广播站A区喽', '广东省 江门市 蓬江区 东方广场还发广播站A区喽', 150, '113.080682', '22.592643', 1473057266, 1494225499, '<p><span style=\"font-size:18px;\">东方广场还发广播站A区喽</span></p><p>曾经的曾经 现在的现在曾经的曾经 现在的现在曾经的曾经 现在的现在曾经的曾经 现在的现在<br /></p><p style=\"margin: 0px; padding: 0px;\"></p>', '曾经的曾经 现在的现在', 10, '13532323545', '13532323545', 1, 1, '', NULL, NULL, NULL, NULL),
(47, 1, 'KO打卡机阿斯顿旗舰店', '爱尚先生', 'UploadFiles/shop/logo/20170508/1494225236944805.jpg', 'UploadFiles/shop/20170508/1494225236615782.jpg', 2151, 2166, 2168, '步步高高对面街道cc', '广东省 韶关市 武江区 步步高高对面街道cc', 650, '113.601555', '24.826763', 1473842739, 1494225236, '&nbsp;易岛通（海南）旅游科技有限公司是一家旅游度假、养生休闲综合服务平台，总部位于海南的省会城市海口。<br />易岛通度假项目依托海南独特的地理区位、自然环境、天然资源等优势，建设丰富而又舒适的多元化度假场所，同时将海南岛纯天然的优质产品配套推出，开创全新的吃住玩一体化服务的“自助餐式”度假新体验。易岛通度假综合服务平台将通过大数据、云技术、物联网及各种领先的移动网络信息技术，全方位打造和提供线上线下预定、购买、交流、互动、互助服务模式，并将服务推向广大社区的千家万户。<br />&nbsp;<br />老人收住类型：生活自理<br />老人入住指南：三亚，乐东，琼海，琼中，文昌，五指山，万宁，儋州<br />房型：单人间、双人间、公寓<br />床位数：20000<br />收费标准： 999（七天） 9999（63天） 59800（2460天）<br />特色服务：接送服务，活动服务，棋牌室、麻将室、舞蹈室、排练厅、音像制作室<br />医疗护理（如果您机构可以提供）：基地有医疗人员<br /><p>保险：购买人身安全保险</p><p><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141646386637.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141646512845.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141646573553.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141647068364.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648064119.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648123339.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648189118.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648265046.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648311531.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648384419.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648546246.jpg\" alt=\"\" /><br /></p>', '高高兴兴玩 开开心心买', 10, '13232454675', '13232454675', 1, 0, '', NULL, NULL, NULL, NULL),
(48, 2, 'MNMX模拟梦想直营店', '小先生', 'UploadFiles/shop/logo/20170508/1494215970977911.jpg', 'UploadFiles/shop/20170508/1494215970509487.jpg', 2151, 2152, 2157, '一片汪洋大海附近地址', '广东省 广州市 天河区 一片汪洋大海附近地址', 650, '113.344855', '23.125336', 1476168943, 1494231948, '<p><span style=\"font-family:Microsoft YaHei;font-size:18px;\">MNMX模拟梦想直营店&nbsp;</span></p><p><span style=\"font-size:12px;\">玩玩玩玩玩 买买买买买</span><br /></p>', '玩玩玩玩玩 买买买买买', 10, '13866544322', '13866544322', 1, 1, '', NULL, NULL, NULL, NULL),
(49, 1, 'SCC部分对方官方旗舰店', 'Mr . xiao', 'UploadFiles/shop/logo/20170508/1494215671720469.jpg', 'UploadFiles/shop/20170508/1494215671616059.jpg', 2151, 2152, 2160, '南村', '广东省 广州市 番禺区 南村', 200, '113.385674', '23.007963', 1477293664, 1494215671, 'SCC部分对方官方旗舰店', '吃吃吃吃吃 呜呜呜呜网', 10, '13755446677', '13755446677', 1, 0, '', NULL, NULL, NULL, NULL),
(50, 2, 'ZHXZ最好选择我的店', '测试先生', 'UploadFiles/shop/logo/20170428/1493347023276929.jpg', 'UploadFiles/shop/20170428/1493347024426958.png', 2151, 2152, 2157, '好的味道好的街道好的号', '广东省 广州市 天河区 好的味道好的街道好的号', 88, '113.380159', '22.998499', 1493346749, 1494230955, '<span style=\"font-size:18px;\"><strong>ZHXZ最好选择我的店</strong></span>', '给自己一个惊喜，给世界一个惊喜', 10, '13812423423', '13412423423', 1, 0, '34536465', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `lr_shangchang_dp`
--

CREATE TABLE `lr_shangchang_dp` (
  `id` int(11) NOT NULL COMMENT '店铺收藏表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商铺id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '评分数',
  `concent` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `addtime` int(11) DEFAULT NULL,
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `lr_shangchang_sc`
--

CREATE TABLE `lr_shangchang_sc` (
  `id` int(11) NOT NULL COMMENT '会员店铺收藏记录表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '收藏状态 1收藏 0删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_shangchang_sc`
--

INSERT INTO `lr_shangchang_sc` (`id`, `shop_id`, `uid`, `status`) VALUES
(1, 47, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `lr_shopping_char`
--

CREATE TABLE `lr_shopping_char` (
  `id` int(11) NOT NULL COMMENT '购物车表',
  `pid` int(11) NOT NULL COMMENT '商品ID',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `buff` varchar(255) NOT NULL COMMENT '属性（序列化格式）',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `gid` int(11) DEFAULT '0' COMMENT '规格id',
  `type` tinyint(2) DEFAULT '2' COMMENT '0是热卖，1是团购，2是普通商品'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_shopping_char`
--

INSERT INTO `lr_shopping_char` (`id`, `pid`, `price`, `num`, `buff`, `addtime`, `uid`, `shop_id`, `gid`, `type`) VALUES
(1, 269, '235.00', 1, '', 1495779452, 3, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `lr_student_style`
--

CREATE TABLE `lr_student_style` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '学员风采表',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `author` varchar(20) DEFAULT NULL,
  `source` varchar(30) DEFAULT NULL COMMENT '来源',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `content` text COMMENT '内容',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  `del` tinyint(1) DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lr_student_style`
--

INSERT INTO `lr_student_style` (`id`, `title`, `photo`, `author`, `source`, `view`, `content`, `addtime`, `del`) VALUES
(1, '第1期学员风采', 'UploadFiles/stustyle/20170523/1495533692924817.jpg', 'Andy', '雷米高', 72, '&lt;h2 align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/h2&gt;&lt;h2 align=&quot;center&quot;&gt;第1期学员风采&lt;/h2&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170523/201705231801236065.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;', 1495533693, 0),
(2, '第2期学员风采', 'UploadFiles/stustyle/20170524/1495619154855026.jpg', 'Andy', '雷米高', 67, '&lt;h2 align=&quot;center&quot;&gt;第2期学员风采&lt;/h2&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170524/201705241745091534.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;', 1495619154, 0),
(3, '第3期学员风采', 'UploadFiles/stustyle/20170524/1495619351424870.jpg', 'Andy', '雷米高', 75, '&lt;h2 align=&quot;center&quot;&gt;第3期学员风采&lt;/h2&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170524/201705241749008780.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/p&gt;', 1495619351, 0),
(4, '第6期学员风采', 'UploadFiles/stustyle/20170525/1495691588447374.jpg', 'Andy', '雷米高', 49, '&lt;p&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;第3期学员风采&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251352457412.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;br /&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;', 1495691588, 0),
(5, '第9期学员风采', 'UploadFiles/stustyle/20170525/1495700324168784.jpg', 'Andy', '雷米高', 76, '&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251614146792.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251614255325.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251615297312.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251615407510.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616078084.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616183453.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616273434.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616367894.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616475560.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616583862.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251617349097.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251617449800.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251617599171.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251618083181.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', 1495700324, 0);

-- --------------------------------------------------------

--
-- 表的结构 `lr_user`
--

CREATE TABLE `lr_user` (
  `id` int(11) NOT NULL COMMENT '用户表：包括后台管理员、商家会员和普通会员',
  `name` varchar(20) NOT NULL COMMENT '登陆账号',
  `uname` varchar(10) DEFAULT NULL COMMENT '昵称',
  `pwd` varchar(50) NOT NULL COMMENT 'MD5密码',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `jifen` float(11,0) DEFAULT '0' COMMENT '积分',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `tel` char(15) DEFAULT NULL COMMENT '手机',
  `qq_id` varchar(20) NOT NULL DEFAULT '0' COMMENT 'qq',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `openid` varchar(50) NOT NULL COMMENT '授权ID',
  `source` varchar(10) NOT NULL COMMENT '第三方平台(微信，QQ)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_user`
--

INSERT INTO `lr_user` (`id`, `name`, `uname`, `pwd`, `addtime`, `jifen`, `photo`, `tel`, `qq_id`, `email`, `sex`, `del`, `openid`, `source`) VALUES
(1, 'aa', 'aa', 'aa', 0, 0, NULL, NULL, '0', NULL, 0, 1, '', ''),
(2, '小伙伴', '小伙伴', '', 1494210088, 0, 'http://wx.qlogo.cn/mmopen/vi_32/6Dq9DIIcGyQiaEA4JicN48rEQ1bwm33s2cGkzHlSLkUOPwktluYXmf84fiaILKMUCb5SSvOHmxxenE4MlelQhibBqg/0', NULL, '0', NULL, 1, 0, 'oQukL0fa013osRbWSdIPaUt88JZE', 'wx'),
(3, '小伙伴', '小伙伴', '', 1495264753, 0, 'http://wx.qlogo.cn/mmhead/icXtjp9jsR5RylwDhXjxFtIL70hvKaibowUZYFsD9shibBiaQyqvD1zRng/132', NULL, '0', NULL, 1, 0, 'undefined', 'wx');

-- --------------------------------------------------------

--
-- 表的结构 `lr_user_course`
--

CREATE TABLE `lr_user_course` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '课程报名表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程ID',
  `truename` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(2) DEFAULT '1' COMMENT '性别',
  `age` int(4) DEFAULT '0' COMMENT '年龄',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `weixin` varchar(30) DEFAULT NULL COMMENT '微信号',
  `tel` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) DEFAULT '1' COMMENT '状态：1报名中 2报名成功 3待定 4待定',
  `addtime` int(11) DEFAULT '0' COMMENT '报名时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lr_user_course`
--

INSERT INTO `lr_user_course` (`id`, `uid`, `course_id`, `truename`, `sex`, `age`, `qq`, `email`, `weixin`, `tel`, `address`, `remark`, `state`, `addtime`) VALUES
(1, 1, 3, '小花', 2, 18, '354353', 'dfgdsg@126.com', 'weixinhao', '2147483647', '水电费给对方返回SDR官方认识人多', '没有备注', 2, 1495613076);

-- --------------------------------------------------------

--
-- 表的结构 `lr_user_voucher`
--

CREATE TABLE `lr_user_voucher` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '会员优惠券领取记录',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `vid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商铺ID',
  `full_money` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '满多少钱',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '减多少钱',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `status` tinyint(2) UNSIGNED DEFAULT '1' COMMENT '使用状态 1未使用 2已使用 3已失效'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lr_user_voucher`
--

INSERT INTO `lr_user_voucher` (`id`, `uid`, `vid`, `shop_id`, `full_money`, `amount`, `start_time`, `end_time`, `addtime`, `status`) VALUES
(3, 1, 3, 1, '200.00', '15.00', 1492444800, 1495123199, 1492498299, 1),
(4, 1, 2, 1, '100.00', '5.00', 1492444800, 1495123199, 1492498311, 1),
(5, 3, 5, 0, '100.00', '15.00', 1495641600, 1497110399, 1495672289, 1),
(6, 3, 4, 0, '200.00', '20.00', 1495641600, 1496851199, 1495672291, 1);

-- --------------------------------------------------------

--
-- 表的结构 `lr_voucher`
--

CREATE TABLE `lr_voucher` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '店铺优惠券表',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `title` varchar(100) DEFAULT NULL COMMENT '优惠券名称',
  `full_money` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '满多少钱',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '减多少钱',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `point` int(11) DEFAULT '0' COMMENT '所需积分',
  `count` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '发行数量',
  `receive_num` int(11) UNSIGNED DEFAULT '0' COMMENT '领取数量',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '优惠券类型',
  `del` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '删除状态',
  `proid` text COMMENT '产品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lr_voucher`
--

INSERT INTO `lr_voucher` (`id`, `shop_id`, `title`, `full_money`, `amount`, `start_time`, `end_time`, `point`, `count`, `receive_num`, `addtime`, `type`, `del`, `proid`) VALUES
(1, 1, '南沙自贸区', '100.00', '8.00', 1491062400, 1491580799, 100, 15, 0, 1491126577, 1, 0, '2,1'),
(2, 1, '端午到，优惠券也到了', '100.00', '5.00', 1492444800, 1495123199, 0, 10, 2, 1492482339, 1, 0, 'all'),
(3, 1, '端午到，优惠券也到了', '200.00', '15.00', 1492444800, 1495123199, 0, 10, 2, 1492482366, 1, 0, 'all'),
(4, 0, '端午到，优惠券也到了', '200.00', '20.00', 1495641600, 1496851199, 0, 20, 1, 1495672098, 1, 0, 'all'),
(5, 0, '端午优惠多, 先到就先得', '100.00', '15.00', 1495641600, 1497110399, 0, 20, 1, 1495672249, 1, 0, 'all'),
(6, 0, '测试', '100.00', '0.01', 1498579200, 1498751999, 0, 1, 0, 1498642295, 1, 0, 'all');

-- --------------------------------------------------------

--
-- 表的结构 `lr_web`
--

CREATE TABLE `lr_web` (
  `id` int(11) NOT NULL COMMENT '单网页信息表：关于我们、客服中心等',
  `pid` int(11) DEFAULT '0',
  `uname` varchar(255) DEFAULT NULL COMMENT '名称1',
  `ename` varchar(255) DEFAULT NULL COMMENT '名称2',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `concent` mediumtext COMMENT '内容介绍',
  `addtime` int(11) DEFAULT '0' COMMENT '发表时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lr_web`
--

INSERT INTO `lr_web` (`id`, `pid`, `uname`, `ename`, `sort`, `concent`, `addtime`) VALUES
(1, 0, '关于我们', '', 0, '<p><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; text-indent: 30px;\"></span></p><span style=\"font-family:宋体;\"><span style=\"font-size:16px;\"></span></span><p><span style=\"font-family:宋体;line-height: 24px;\"><span style=\"font-size:16px;\"><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251102322478.jpg\" alt=\"\" /><br /></span></span></p><p><span style=\"font-family:宋体;line-height: 24px;\"><span style=\"font-size:16px;\"><span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp; 雷米高宠物美容师学校成立于2012年初，由雷米高动物营养保健科技有限公司联合广州市技师学院（国家级公办示范职业技术学院），以校企合作的形式开设的宠物美容师培训学校，校企联办，企业化独立运营。<br />学校由台湾教师级领衔国内外A级师资团队教学，是一所具有海陆两岸专业宠物美容教学理念与技术于一体的学校，成立5年多来，累计培养C级美容师超2000人，B级、A级美容师超两百人。<br />学校定位为专业的宠物美容师技能培训和创业培训，参考国际标准，重点发展C级精修特色班（2个月及以上），让学员学习加实习，毕业就能完全胜任宠物美容师岗位及具备创业能力。<br />&nbsp; &nbsp; 学校拥有超过1000只模特犬的专业犬舍，保证学员天天有真狗实训，学美容就是学手艺，真狗实训，成就一流手艺。<br />&nbsp; &nbsp; 学校是华南地区最具影响力的学校，也是全国为数不多的千人大校。学员100%推荐就业，永久技术支持，提供专业的创业指导平台，并让学生有机会免费加盟哈宠联邦宠物连锁机构。<br />&nbsp; &nbsp; 多年来，雷米高一直致力打造宠物行业全产业链事业，旨在服务更多可爱宠物，并帮助更多宠物行业从业者成功创业。雷米高公司，是全国首家进行宠物全产业链打造的公司，五大系列产品的研发、生产与销售（犬猫粮、宠物药品、保健品、护理品、零食）；纯种犬繁育；宠物美容师培训教育；宠物医疗服务；宠物店连锁经营。<br />&nbsp; &nbsp; 雷米高学校的愿景是成为宠物美容师学校中的清华北大，以“提升职业技能、创业实现梦想”为基本理念，来雷米高学习美容，就是与宠物行业结缘，与雷米高结缘，共同长期在整个宠物行业中成为合作伙伴，资源整合，共享宠物行业高速发展的红利，共同服务于我们的家庭新成员--猫猫狗狗，让每一个宠物享有最尊荣的关爱，待宠如亲！</span></span><br /></span></span></p><p style=\"text-indent: 30px;\"><span style=\"font-family:宋体;\"><span style=\"font-size: 14px;\">&nbsp;</span></span></p>', 1495681384),
(2, 0, '教学优势', '', 0, '<p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251100326234.jpg\" alt=\"\" /></p><p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251100497245.jpg\" alt=\"\" /></p><p><span style=\"font-size:18px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 雷米高宠物美容师学校成立于2012年，由雷米高公司出资，联合广州市技师学院（国家级示范职业技术学院），以校企合作的形式开设的宠物美容师培训学校，校企联办，实现企业化运营，由台湾教师团队领衔教学，是一所具有海陆两岸专业宠物美容教学于一体的学校。成立近5年来，培养C级美容师近2000人，并有上百个B级、A级美容师毕业，是华南最具影响力的学校，也是全国为数不多的千人大校。</span></p><p><br /></p>', 1495681305);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lr_address`
--
ALTER TABLE `lr_address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `lr_adminuser`
--
ALTER TABLE `lr_adminuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_admin_app`
--
ALTER TABLE `lr_admin_app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_attribute`
--
ALTER TABLE `lr_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_brand`
--
ALTER TABLE `lr_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_category`
--
ALTER TABLE `lr_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_china_city`
--
ALTER TABLE `lr_china_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_course`
--
ALTER TABLE `lr_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_fankui`
--
ALTER TABLE `lr_fankui`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_group_joins`
--
ALTER TABLE `lr_group_joins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_guanggao`
--
ALTER TABLE `lr_guanggao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_guige`
--
ALTER TABLE `lr_guige`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_hot`
--
ALTER TABLE `lr_hot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_indeximg`
--
ALTER TABLE `lr_indeximg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_news`
--
ALTER TABLE `lr_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_news_cat`
--
ALTER TABLE `lr_news_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_order`
--
ALTER TABLE `lr_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_order_product`
--
ALTER TABLE `lr_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_post`
--
ALTER TABLE `lr_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_product`
--
ALTER TABLE `lr_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_product_dp`
--
ALTER TABLE `lr_product_dp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_product_sc`
--
ALTER TABLE `lr_product_sc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_program`
--
ALTER TABLE `lr_program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_sccat`
--
ALTER TABLE `lr_sccat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_search_record`
--
ALTER TABLE `lr_search_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_shangchang`
--
ALTER TABLE `lr_shangchang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_shangchang_dp`
--
ALTER TABLE `lr_shangchang_dp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_shangchang_sc`
--
ALTER TABLE `lr_shangchang_sc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_shopping_char`
--
ALTER TABLE `lr_shopping_char`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_student_style`
--
ALTER TABLE `lr_student_style`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_user`
--
ALTER TABLE `lr_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_user_course`
--
ALTER TABLE `lr_user_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_user_voucher`
--
ALTER TABLE `lr_user_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_voucher`
--
ALTER TABLE `lr_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lr_web`
--
ALTER TABLE `lr_web`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `lr_address`
--
ALTER TABLE `lr_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id', AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `lr_adminuser`
--
ALTER TABLE `lr_adminuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表：包括后台管理员、商家会员和普通会员', AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `lr_admin_app`
--
ALTER TABLE `lr_admin_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3058;
--
-- 使用表AUTO_INCREMENT `lr_attribute`
--
ALTER TABLE `lr_attribute`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '属性名称', AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `lr_brand`
--
ALTER TABLE `lr_brand`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品品牌表', AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `lr_category`
--
ALTER TABLE `lr_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `lr_china_city`
--
ALTER TABLE `lr_china_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=3526;
--
-- 使用表AUTO_INCREMENT `lr_course`
--
ALTER TABLE `lr_course`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '培训课程表', AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `lr_fankui`
--
ALTER TABLE `lr_fankui`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `lr_group_joins`
--
ALTER TABLE `lr_group_joins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团购用户信息表';
--
-- 使用表AUTO_INCREMENT `lr_guanggao`
--
ALTER TABLE `lr_guanggao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子页广告管理表', AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `lr_guige`
--
ALTER TABLE `lr_guige`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格id', AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `lr_hot`
--
ALTER TABLE `lr_hot`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '团购商品表';
--
-- 使用表AUTO_INCREMENT `lr_indeximg`
--
ALTER TABLE `lr_indeximg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `lr_news`
--
ALTER TABLE `lr_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `lr_news_cat`
--
ALTER TABLE `lr_news_cat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '新闻分类表', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `lr_order`
--
ALTER TABLE `lr_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id', AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `lr_order_product`
--
ALTER TABLE `lr_order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品信息表', AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `lr_post`
--
ALTER TABLE `lr_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流快递表', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `lr_product`
--
ALTER TABLE `lr_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品表', AUTO_INCREMENT=289;
--
-- 使用表AUTO_INCREMENT `lr_product_dp`
--
ALTER TABLE `lr_product_dp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品评论表', AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `lr_product_sc`
--
ALTER TABLE `lr_product_sc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品收藏表', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `lr_sccat`
--
ALTER TABLE `lr_sccat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品品牌表', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `lr_search_record`
--
ALTER TABLE `lr_search_record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '搜索记录表', AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `lr_shangchang`
--
ALTER TABLE `lr_shangchang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- 使用表AUTO_INCREMENT `lr_shangchang_dp`
--
ALTER TABLE `lr_shangchang_dp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺收藏表';
--
-- 使用表AUTO_INCREMENT `lr_shangchang_sc`
--
ALTER TABLE `lr_shangchang_sc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员店铺收藏记录表', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `lr_shopping_char`
--
ALTER TABLE `lr_shopping_char`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车表', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `lr_student_style`
--
ALTER TABLE `lr_student_style`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学员风采表', AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `lr_user`
--
ALTER TABLE `lr_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表：包括后台管理员、商家会员和普通会员', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `lr_user_course`
--
ALTER TABLE `lr_user_course`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程报名表', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `lr_user_voucher`
--
ALTER TABLE `lr_user_voucher`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '会员优惠券领取记录', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `lr_voucher`
--
ALTER TABLE `lr_voucher`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺优惠券表', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `lr_web`
--
ALTER TABLE `lr_web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单网页信息表：关于我们、客服中心等', AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
