/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : baixiu-dev3

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 01/12/2019 16:23:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'uncategorized', '未分类');
INSERT INTO `categories` VALUES (2, 'funny', '奇趣事');
INSERT INTO `categories` VALUES (3, 'living', '会生活');
INSERT INTO `categories` VALUES (4, 'travel', '爱旅行');
INSERT INTO `categories` VALUES (5, '444', '444');
INSERT INTO `categories` VALUES (6, '55555', '5555');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `created` datetime(0) NOT NULL COMMENT '创建时间',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（held/approved/rejected/trashed）',
  `post_id` int(11) NOT NULL COMMENT '文章 ID',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级 ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, '汪磊', 'w@zce.me', '2017-07-04 12:00:00', '这是一条测试评论，欢迎光临', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (2, '嘿嘿', 'ee@gmail.com', '2017-07-05 09:10:00', '想知道香港回归的惊人内幕吗？快快与我取得联系', 'rejected', 1, NULL);
INSERT INTO `comments` VALUES (3, '小右', 'www@gmail.com', '2017-07-06 14:10:00', '你好啊，交个朋友好吗？', 'held', 1, 3);
INSERT INTO `comments` VALUES (21, '21', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (22, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (23, '大大', 'aa@27.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (24, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (25, '25', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (26, '大大', 'aa@28.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (28, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (29, '大大', 'aa@29.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (30, '30', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (31, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (32, '大大', 'aa@30.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (33, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (34, '34', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (35, '大大', 'aa@31.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (36, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (38, '大大', 'aa@32.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (41, '大大', 'aa@33.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (42, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (43, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (46, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (48, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (49, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (50, '50', 'aa@36.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (51, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (52, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);
INSERT INTO `comments` VALUES (53, '大大', 'aa@37.com', '2017-07-22 09:10:00', '去吧', 'held', 1, NULL);
INSERT INTO `comments` VALUES (55, '55', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);

-- ----------------------------
-- Table structure for comments_copy1
-- ----------------------------
DROP TABLE IF EXISTS `comments_copy1`;
CREATE TABLE `comments_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `created` datetime(0) NOT NULL COMMENT '创建时间',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（held/approved/rejected/trashed）',
  `post_id` int(11) NOT NULL COMMENT '文章 ID',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级 ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments_copy1
-- ----------------------------
INSERT INTO `comments_copy1` VALUES (1, '汪磊', 'w@zce.me', '2017-07-04 12:00:00', '这是一条测试评论，欢迎光临', 'approved', 1, NULL);
INSERT INTO `comments_copy1` VALUES (2, '嘿嘿', 'ee@gmail.com', '2017-07-05 09:10:00', '想知道香港回归的惊人内幕吗？快快与我取得联系', 'rejected', 1, NULL);
INSERT INTO `comments_copy1` VALUES (3, '小右', 'www@gmail.com', '2017-07-06 14:10:00', '你好啊，交个朋友好吗？', 'held', 1, NULL);
INSERT INTO `comments_copy1` VALUES (4, '汪磊', 'www@gmail.com', '2017-07-09 22:22:00', '不好', 'held', 1, 3);
INSERT INTO `comments_copy1` VALUES (5, '汪磊', 'w@zce.me', '2017-07-09 18:22:00', 'How are you?', 'held', 1, 3);
INSERT INTO `comments_copy1` VALUES (6, '小右', 'www@gmail.com', '2017-07-11 22:22:00', 'I am fine thank you and you?', 'held', 1, 5);
INSERT INTO `comments_copy1` VALUES (7, '哈哈', 'hh@gmail.com', '2017-07-22 09:10:00', '一针见血', 'approved', 1, NULL);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性键',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (1, 'site_url', 'http://localhost');
INSERT INTO `options` VALUES (2, 'site_logo', '/static/assets/img/logo.png');
INSERT INTO `options` VALUES (3, 'site_name', '阿里百秀 - 发现生活，发现美！');
INSERT INTO `options` VALUES (4, 'site_description', '阿里百秀同阿里巴巴有咩关系，答案当然系一啲都冇');
INSERT INTO `options` VALUES (5, 'site_keywords', '生活, 旅行, 自由, 诗歌, 科技');
INSERT INTO `options` VALUES (6, 'site_footer', '<p>© 2016 XIU主题演示 本站主题由 themebetter 提供</p>');
INSERT INTO `options` VALUES (7, 'comment_status', '1');
INSERT INTO `options` VALUES (8, 'comment_reviewed', '1');
INSERT INTO `options` VALUES (9, 'nav_menus', '[{\"icon\":\"fa fa-glass\",\"text\":\"奇趣事\",\"title\":\"奇趣事\",\"link\":\"/category/funny\"},{\"icon\":\"fa fa-phone\",\"text\":\"潮科技\",\"title\":\"潮科技\",\"link\":\"/category/tech\"},{\"icon\":\"fa fa-fire\",\"text\":\"会生活\",\"title\":\"会生活\",\"link\":\"/category/living\"},{\"icon\":\"fa fa-gift\",\"text\":\"美奇迹\",\"title\":\"美奇迹\",\"link\":\"/category/travel\"}]');
INSERT INTO `options` VALUES (10, 'home_slides', '[{\"image\":\"/static/uploads/slide_1.jpg\",\"text\":\"轮播项一\",\"link\":\"https://zce.me\"},{\"image\":\"/static/uploads/slide_2.jpg\",\"text\":\"轮播项二\",\"link\":\"https://zce.me\"}]');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `feature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特色图像',
  `created` datetime(0) NOT NULL COMMENT '创建时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览数',
  `likes` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（drafted/published/trashed）',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `category_id` int(11) NOT NULL COMMENT '分类 ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 273 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 'hello-world7', '世界，你好3', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 3, 1);
INSERT INTO `posts` VALUES (2, 'hello-world10', '世界，你好6', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 2, 2);
INSERT INTO `posts` VALUES (3, 'simple-post-3', '第二篇示例文章', NULL, '2017-07-01 12:00:00', '欢迎使用阿里百秀。这是一篇示例文章', 20, 120, 'drafted', 1, 2);
INSERT INTO `posts` VALUES (4, 'simple-post-4', '第三篇示例文章', NULL, '2017-07-01 14:00:00', '欢迎使用阿里百秀。这是一篇示例文章', 40, 100, 'drafted', 2, 3);
INSERT INTO `posts` VALUES (7, 'hello-world2', '世界，你好', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 2);
INSERT INTO `posts` VALUES (8, 'hello-world3', '世界，你好', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 3, 2);
INSERT INTO `posts` VALUES (9, 'hello-world4', '世界，你好', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 4);
INSERT INTO `posts` VALUES (11, 'hello-world6', '世界，你好2', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 4);
INSERT INTO `posts` VALUES (16, 'hello-world11', '世界，你好7', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 4);
INSERT INTO `posts` VALUES (17, 'hello-world12', '世界，你好8', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 2, 1);
INSERT INTO `posts` VALUES (18, 'hello-world13', '世界，你好9', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'drafted', 1, 2);
INSERT INTO `posts` VALUES (20, 'hello-world15', '世界，你好11', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'drafted', 1, 2);
INSERT INTO `posts` VALUES (23, 'hello-world18', '世界，你好14', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'drafted', 1, 2);
INSERT INTO `posts` VALUES (24, 'hello-world19', '世界，你好15', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'drafted', 1, 2);
INSERT INTO `posts` VALUES (26, 'hello-world21', '世界，你好17', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (27, 'hello-world22', '世界，你好18', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (28, 'hello-world23', '世界，你好19', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (29, 'hello-world24', '世界，你好20', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (30, 'hello-world25', '世界，你好21', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (31, 'hello-world26', '世界，你好22', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (32, 'hello-world27', '世界，你好23', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (33, 'hello-world28', '世界，你好24', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (34, 'hello-world29', '世界，你好25', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (35, 'hello-world30', '世界，你好26', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (36, 'hello-world31', '世界，你好27', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (37, 'hello-world32', '世界，你好28', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (38, 'hello-world33', '世界，你好29', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (39, 'hello-world34', '世界，你好30', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (40, 'hello-world35', '世界，你好31', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (41, 'hello-world36', '世界，你好32', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (42, 'hello-world37', '世界，你好33', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (43, 'hello-world38', '世界，你好34', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (44, 'hello-world39', '世界，你好35', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (45, 'hello-world40', '世界，你好36', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (46, 'hello-world41', '世界，你好37', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (47, 'hello-world42', '世界，你好38', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (48, 'hello-world43', '世界，你好39', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (49, 'hello-world44', '世界，你好40', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (50, 'hello-world45', '世界，你好41', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (51, 'hello-world46', '世界，你好42', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (52, 'hello-world47', '世界，你好43', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (53, 'hello-world48', '世界，你好44', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (54, 'hello-world49', '世界，你好45', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (55, 'hello-world50', '世界，你好46', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (56, 'hello-world51', '世界，你好47', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (57, 'hello-world52', '世界，你好48', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (58, 'hello-world53', '世界，你好49', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (59, 'hello-world54', '世界，你好50', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (60, 'hello-world55', '世界，你好51', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (61, 'hello-world56', '世界，你好52', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (62, 'hello-world57', '世界，你好53', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (63, 'hello-world58', '世界，你好54', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (64, 'hello-world59', '世界，你好55', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (65, 'hello-world60', '世界，你好56', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (66, 'hello-world61', '世界，你好57', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (67, 'hello-world62', '世界，你好58', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (68, 'hello-world63', '世界，你好59', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (69, 'hello-world64', '世界，你好60', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (70, 'hello-world65', '世界，你好61', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (71, 'hello-world66', '世界，你好62', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (72, 'hello-world67', '世界，你好63', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (73, 'hello-world68', '世界，你好64', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (74, 'hello-world69', '世界，你好65', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (75, 'hello-world70', '世界，你好66', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (76, 'hello-world71', '世界，你好67', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (77, 'hello-world72', '世界，你好68', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (78, 'hello-world73', '世界，你好69', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (79, 'hello-world74', '世界，你好70', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (80, 'hello-world75', '世界，你好71', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (81, 'hello-world76', '世界，你好72', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (82, 'hello-world77', '世界，你好73', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (83, 'hello-world78', '世界，你好74', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (84, 'hello-world79', '世界，你好75', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (85, 'hello-world80', '世界，你好76', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (86, 'hello-world81', '世界，你好77', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (87, 'hello-world82', '世界，你好78', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (88, 'hello-world83', '世界，你好79', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (89, 'hello-world84', '世界，你好80', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (90, 'hello-world85', '世界，你好81', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (92, 'hello-world87', '世界，你好83', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (93, 'hello-world88', '世界，你好84', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (95, 'hello-world90', '世界，你好86', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 2);
INSERT INTO `posts` VALUES (96, 'hello-world91', '世界，你好87', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (97, 'hello-world92', '世界，你好88', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (98, 'hello-world93', '世界，你好89', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (99, 'hello-world94', '世界，你好90', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (100, 'hello-world95', '世界，你好91', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (101, 'hello-world96', '世界，你好92', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (102, 'hello-world97', '世界，你好93', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (103, 'hello-world98', '世界，你好94', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (104, 'hello-world99', '世界，你好95', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (105, 'hello-world100', '世界，你好96', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (106, 'hello-world101', '世界，你好97', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (107, 'hello-world102', '世界，你好98', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (108, 'hello-world103', '世界，你好99', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (109, 'hello-world104', '世界，你好100', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (110, 'hello-world105', '世界，你好101', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (111, 'hello-world106', '世界，你好102', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (112, 'hello-world107', '世界，你好103', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (113, 'hello-world108', '世界，你好104', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (114, 'hello-world109', '世界，你好105', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (115, 'hello-world110', '世界，你好106', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (116, 'hello-world111', '世界，你好107', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (117, 'hello-world112', '世界，你好108', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (118, 'hello-world113', '世界，你好109', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (119, 'hello-world114', '世界，你好110', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (120, 'hello-world115', '世界，你好111', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (121, 'hello-world116', '世界，你好112', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (122, 'hello-world117', '世界，你好113', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (123, 'hello-world118', '世界，你好114', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (124, 'hello-world119', '世界，你好115', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (125, 'hello-world120', '世界，你好116', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (126, 'hello-world121', '世界，你好117', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (127, 'hello-world122', '世界，你好118', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (128, 'hello-world123', '世界，你好119', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (129, 'hello-world124', '世界，你好120', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (130, 'hello-world125', '世界，你好121', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (131, 'hello-world126', '世界，你好122', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (132, 'hello-world127', '世界，你好123', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (133, 'hello-world128', '世界，你好124', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (134, 'hello-world129', '世界，你好125', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (135, 'hello-world130', '世界，你好126', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (136, 'hello-world131', '世界，你好127', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (137, 'hello-world132', '世界，你好128', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (138, 'hello-world133', '世界，你好129', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (139, 'hello-world134', '世界，你好130', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (140, 'hello-world135', '世界，你好131', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (141, 'hello-world136', '世界，你好132', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (142, 'hello-world137', '世界，你好133', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (143, 'hello-world138', '世界，你好134', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (144, 'hello-world139', '世界，你好135', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (145, 'hello-world140', '世界，你好136', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (146, 'hello-world141', '世界，你好137', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (147, 'hello-world142', '世界，你好138', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (148, 'hello-world143', '世界，你好139', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (149, 'hello-world144', '世界，你好140', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (150, 'hello-world145', '世界，你好141', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (151, 'hello-world146', '世界，你好142', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (152, 'hello-world147', '世界，你好143', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (153, 'hello-world148', '世界，你好144', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (154, 'hello-world149', '世界，你好145', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 2);
INSERT INTO `posts` VALUES (155, 'hello-world150', '世界，你好146', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (156, 'hello-world151', '世界，你好147', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 2);
INSERT INTO `posts` VALUES (157, 'hello-world152', '世界，你好148', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 2);
INSERT INTO `posts` VALUES (158, 'hello-world153', '世界，你好149', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (159, 'hello-world154', '世界，你好150', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (160, 'hello-world155', '世界，你好151', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (161, 'hello-world156', '世界，你好152', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (162, 'hello-world157', '世界，你好153', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (163, 'hello-world158', '世界，你好154', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (164, 'hello-world159', '世界，你好155', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (165, 'hello-world160', '世界，你好156', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (166, 'hello-world161', '世界，你好157', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (167, 'hello-world162', '世界，你好158', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (168, 'hello-world163', '世界，你好159', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (169, 'hello-world164', '世界，你好160', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (170, 'hello-world165', '世界，你好161', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (171, 'hello-world166', '世界，你好162', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (172, 'hello-world167', '世界，你好163', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (173, 'hello-world168', '世界，你好164', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (174, 'hello-world169', '世界，你好165', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (175, 'hello-world170', '世界，你好166', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (176, 'hello-world171', '世界，你好167', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (177, 'hello-world172', '世界，你好168', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (178, 'hello-world173', '世界，你好169', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (179, 'hello-world174', '世界，你好170', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (180, 'hello-world175', '世界，你好171', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (181, 'hello-world176', '世界，你好172', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (182, 'hello-world177', '世界，你好173', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (183, 'hello-world178', '世界，你好174', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (184, 'hello-world179', '世界，你好175', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (185, 'hello-world180', '世界，你好176', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (186, 'hello-world181', '世界，你好177', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (187, 'hello-world182', '世界，你好178', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (188, 'hello-world183', '世界，你好179', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (189, 'hello-world184', '世界，你好180', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (190, 'hello-world185', '世界，你好181', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (191, 'hello-world186', '世界，你好182', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (192, 'hello-world187', '世界，你好183', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (193, 'hello-world188', '世界，你好184', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (194, 'hello-world189', '世界，你好185', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (195, 'hello-world190', '世界，你好186', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (196, 'hello-world191', '世界，你好187', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (197, 'hello-world192', '世界，你好188', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (198, 'hello-world193', '世界，你好189', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (199, 'hello-world194', '世界，你好190', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (200, 'hello-world195', '世界，你好191', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (201, 'hello-world196', '世界，你好192', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (202, 'hello-world197', '世界，你好193', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (203, 'hello-world198', '世界，你好194', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (204, 'hello-world199', '世界，你好195', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (205, 'hello-world200', '世界，你好196', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (206, 'hello-world201', '世界，你好197', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (207, 'hello-world202', '世界，你好198', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (208, 'hello-world203', '世界，你好199', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (209, 'hello-world204', '世界，你好200', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (210, 'hello-world205', '世界，你好201', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (211, 'hello-world206', '世界，你好202', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (212, 'hello-world207', '世界，你好203', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (213, 'hello-world208', '世界，你好204', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (214, 'hello-world209', '世界，你好205', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (215, 'hello-world210', '世界，你好206', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (216, 'hello-world211', '世界，你好207', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (217, 'hello-world212', '世界，你好208', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (218, 'hello-world213', '世界，你好209', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (219, 'hello-world214', '世界，你好210', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (220, 'hello-world215', '世界，你好211', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (221, 'hello-world216', '世界，你好212', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (222, 'hello-world217', '世界，你好213', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (223, 'hello-world218', '世界，你好214', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (224, 'hello-world219', '世界，你好215', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (225, 'hello-world220', '世界，你好216', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (226, 'hello-world221', '世界，你好217', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (227, 'hello-world222', '世界，你好218', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (228, 'hello-world223', '世界，你好219', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (229, 'hello-world224', '世界，你好220', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (230, 'hello-world225', '世界，你好221', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (231, 'hello-world226', '世界，你好222', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (232, 'hello-world227', '世界，你好223', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (233, 'hello-world228', '世界，你好224', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (234, 'hello-world229', '世界，你好225', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (235, 'hello-world230', '世界，你好226', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (236, 'hello-world231', '世界，你好227', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (237, 'hello-world232', '世界，你好228', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (238, 'hello-world233', '世界，你好229', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (239, 'hello-world234', '世界，你好230', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 2);
INSERT INTO `posts` VALUES (240, 'hello-world235', '世界，你好231', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (241, 'hello-world236', '世界，你好232', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 2);
INSERT INTO `posts` VALUES (243, 'hello-world238', '世界，你好234', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (244, 'hello-world239', '世界，你好235', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (245, 'hello-world240', '世界，你好236', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (246, 'hello-world241', '世界，你好237', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (247, 'hello-world242', '世界，你好238', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (248, 'hello-world243', '世界，你好239', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (249, 'hello-world244', '世界，你好240', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (250, 'hello-world245', '世界，你好241', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (251, 'hello-world246', '世界，你好242', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (252, 'hello-world247', '世界，你好243', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (253, 'hello-world248', '世界，你好244', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (254, 'hello-world249', '世界，你好245', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (255, 'hello-world250', '世界，你好246', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (256, 'hello-world251', '世界，你好247', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (257, 'hello-world252', '世界，你好248', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (258, 'hello-world253', '世界，你好249', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (259, 'hello-world254', '世界，你好250', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (260, 'hello-world255', '世界，你好251', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (261, 'hello-world256', '世界，你好252', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (263, 'hello-world258', '世界，你好254', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (264, 'hello-world259', '世界，你好255', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (266, 'hello-world261', '世界，你好257', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (267, 'hello-world262', '世界，你好258', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (268, 'hello-world263', '世界，你好259', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (269, 'hello-world264', '世界，你好260', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (270, 'hello-world265', '世界，你好261', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts` VALUES (272, 'hello-world267', '世界，你好263', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);

-- ----------------------------
-- Table structure for posts_copy1
-- ----------------------------
DROP TABLE IF EXISTS `posts_copy1`;
CREATE TABLE `posts_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `feature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特色图像',
  `created` datetime(0) NOT NULL COMMENT '创建时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览数',
  `likes` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（drafted/published/trashed）',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `category_id` int(11) NOT NULL COMMENT '分类 ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts_copy1
-- ----------------------------
INSERT INTO `posts_copy1` VALUES (1, 'hello-world', '世界，你好', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);
INSERT INTO `posts_copy1` VALUES (2, 'simple-post-2', '第一篇示例文章', NULL, '2017-07-01 09:00:00', '欢迎使用阿里百秀。这是一篇示例文章', 123, 10, 'drafted', 1, 1);
INSERT INTO `posts_copy1` VALUES (3, 'simple-post-3', '第二篇示例文章', NULL, '2017-07-01 12:00:00', '欢迎使用阿里百秀。这是一篇示例文章', 20, 120, 'drafted', 1, 2);
INSERT INTO `posts_copy1` VALUES (4, 'simple-post-4', '第三篇示例文章', NULL, '2017-07-01 14:00:00', '欢迎使用阿里百秀。这是一篇示例文章', 40, 100, 'drafted', 1, 3);
INSERT INTO `posts_copy1` VALUES (5, 'hello-worl4', '世界，你好', '/uploads/2017/hello-world.jpg', '2017-07-01 08:08:00', '欢迎使用阿里百秀。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', 222, 111, 'published', 1, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `bio` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（unactivated/activated/forbidden/trashed）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@zce.me', 'wanglei', '管理员', '/static/uploads/avatar.jpg', NULL, 'activated');
INSERT INTO `users` VALUES (2, 'zce', 'w@zce.me', 'wanglei', '汪大大', '/static/uploads/avatar.jpg', NULL, 'activated');
INSERT INTO `users` VALUES (3, 'ice', 'ice@wedn.net', 'wanglei', '汪磊', '/static/uploads/avatar.jpg', NULL, 'activated');
INSERT INTO `users` VALUES (4, 'gs', '1@1.a', '1', '谷双', '/static/uploads/avatar.jpg', NULL, 'activated');

SET FOREIGN_KEY_CHECKS = 1;
