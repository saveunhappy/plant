/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : plantadoption

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 04/03/2022 21:34:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `plant_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绿植名称',
  `user_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `user_telephone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态|枚举[ApplyStatus]: AGREE(\"1\", \"同意领养\"),\r\n    DISAGREE(\"0\", \"拒绝领养\")',
  `user_id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户id',
  `plant_id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '绿植id',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '领养' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('00000001', 'test', '111', '河南安阳', '13027595769', '1', '00000001', '00000001', '2022-03-01 18:45:58.000', '2022-03-01 18:45:58.000');
INSERT INTO `apply` VALUES ('00000002', 'test', '222', '河南安阳', '13027595769', '0', '00000002', '00000002', '2022-03-01 18:45:58.000', '2022-03-01 18:45:58.000');

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `course_id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '大章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chapter
-- ----------------------------
INSERT INTO `chapter` VALUES ('00000001', '0', '测试大章01');
INSERT INTO `chapter` VALUES ('00000002', '0', '测试大章02');
INSERT INTO `chapter` VALUES ('00000003', '0', '测试大章03');
INSERT INTO `chapter` VALUES ('00000004', '0', '测试大章04');
INSERT INTO `chapter` VALUES ('00000005', '0', '测试大章05');
INSERT INTO `chapter` VALUES ('00000006', '0', '测试大章06');
INSERT INTO `chapter` VALUES ('00000007', '0', '测试大章07');
INSERT INTO `chapter` VALUES ('00000008', '0', '测试大章08');
INSERT INTO `chapter` VALUES ('00000009', '0', '测试大章09');
INSERT INTO `chapter` VALUES ('00000010', '0', '测试大章10');
INSERT INTO `chapter` VALUES ('00000011', '0', '测试大章11');
INSERT INTO `chapter` VALUES ('00000012', '0', '测试大章12');
INSERT INTO `chapter` VALUES ('00000013', '0', '测试大章13');
INSERT INTO `chapter` VALUES ('00000014', '0', '测试大章14');
INSERT INTO `chapter` VALUES ('00000015', '0', '测试大章15');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `summary` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '概述',
  `time` int(0) NULL DEFAULT 0 COMMENT '时长|单位秒',
  `price` decimal(8, 2) NULL COMMENT '价格(元)',
  `image` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `level` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '级别|枚举[CourseLevelEnum]:ONE(\"1\",\"初级\"),TWO(\"2\",\"中级\"),THREE(\"3\",\"高级\")',
  `charge` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收费|枚举[CourseChargeEnum]:CHARGE(\"C\",\"收费\"),FREE(\"F\",\"免费\")',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态|枚举[CourseStatusEnum]:PUBLISH(\"P\",\"发布\"),DRAFT(\"D\",\"草稿\")',
  `enroll` int(0) NULL DEFAULT 0 COMMENT '报名数',
  `sort` int(0) NULL DEFAULT NULL COMMENT '顺序',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('00000001', '测试课程01', '这是一门测试课程', 7200, 19.90, '', '0', 'C', 'D', 100, 0, '2022-03-01 13:38:50.000', '2022-03-01 13:38:50.000');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `mobile` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name_unique`(`login_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('10000000', 'test', '测试', 'test', '河南安阳', '12345678910');
INSERT INTO `member` VALUES ('dZHJFSBE', 'a123456', 'a123456', 'a123456', NULL, NULL);
INSERT INTO `member` VALUES ('swIjRRBi', 'admin', 'admin', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for member_plant
-- ----------------------------
DROP TABLE IF EXISTS `member_plant`;
CREATE TABLE `member_plant`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'id',
  `member_id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `plant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绿植id',
  `at` datetime(3) NOT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `member_plant_unique`(`member_id`, `plant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员领取植物' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_plant
-- ----------------------------
INSERT INTO `member_plant` VALUES ('UtDsy2mV', 'swIjRRBi', 'uQNeHz6W', '2022-03-04 18:31:13.810');

-- ----------------------------
-- Table structure for plant
-- ----------------------------
DROP TABLE IF EXISTS `plant`;
CREATE TABLE `plant`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绿植名称',
  `summary` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '概述',
  `image` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绿植封面',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态|枚举[PlantStatusEnum]:YES(\"1\", \"已被领养\"),NO(\"0\", \"未被领养\")',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant
-- ----------------------------
INSERT INTO `plant` VALUES ('00000001', '花', '这朵花很好看', 'https://mycv.oss-cn-beijing.aliyuncs.com/img/img/9.jpg?versionId=CAEQGhiBgIDKzp26.hciIDlhZjc0MjViODVlYzQyNGY5YTcwOGE1OGJiMDUyOTgx', '1', '2022-03-01 15:40:55.000', '2022-03-04 17:01:26.345');
INSERT INTO `plant` VALUES ('0TgSuoXP', '66', '66', 'https://mycv.oss-cn-beijing.aliyuncs.com/img/img/6.jpg?versionId=CAEQGhiCgMCazp26.hciIGUzNTYwYWUzNWQzNTQ4NzY4ZmE2NjUyYWVjNWUxZDU1', '0', '2022-03-03 15:10:16.772', '2022-03-04 16:14:11.306');
INSERT INTO `plant` VALUES ('gGAIPGJg', '555', '555', 'https://mycv.oss-cn-beijing.aliyuncs.com/img/img/8.jpg?versionId=CAEQGhiBgIDAzp26.hciIGQxY2UwNjk1M2I5YjQyZmU5ZjYwMWUyMGZmZjQyYzM4', '0', '2022-03-03 15:09:52.608', '2022-03-03 15:09:52.608');
INSERT INTO `plant` VALUES ('gwTwPNDx', '444', '444', 'https://mycv.oss-cn-beijing.aliyuncs.com/img/img/2.jpg?versionId=CAEQGhiBgIC_zp26.hciIDc0ZWJkYzZjOTk4MDQ3YjRiODYzNzNiYWIwZDNjNzE1', '0', '2022-03-03 14:56:48.996', '2022-03-03 14:56:48.996');
INSERT INTO `plant` VALUES ('HHb1SW9i', '11', '22', ' https://mycv.oss-cn-beijing.aliyuncs.com/img/img/8.jpg?versionId=CAEQGhiBgIDAzp26.hciIGQxY2UwNjk1M2I5YjQyZmU5ZjYwMWUyMGZmZjQyYzM4', '0', '2022-03-04 18:24:31.428', '2022-03-04 18:24:31.428');
INSERT INTO `plant` VALUES ('qzBoZwRC', '333', '333', 'https://mycv.oss-cn-beijing.aliyuncs.com/img/img/11.jpg?versionId=CAEQGhiBgMDCzp26.hciIDJhODFkMzcwMGE3ZTQwNjU5ZTAxM2ZhOTNlZTdiMThk', '0', '2022-03-03 14:56:19.599', '2022-03-04 16:13:54.781');
INSERT INTO `plant` VALUES ('uQNeHz6W', '777', '777', 'https://mycv.oss-cn-beijing.aliyuncs.com/img/img/5.jpg?versionId=CAEQGhiBgICozp26.hciIGZjOWNkZmI0ZmY3OTQyZDdiMzUyMTcyYjdhMjc4Njcw', '0', '2022-03-03 15:10:35.000', '2022-03-04 18:23:21.219');
INSERT INTO `plant` VALUES ('Zv2Y2CCS', '222', '222', 'https://mycv.oss-cn-beijing.aliyuncs.com/img/img/1.jpg?versionId=CAEQGhiBgMCY0J26.hciIDZiZTYxZGZiYTg5ZTQ0ZTE4MTk2OTllOTI5OTc1MWE5', '0', '2022-03-03 14:54:47.000', '2022-03-03 14:55:25.054');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `course_id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程|course.id',
  `chapter_id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '大章|chapter.id',
  `video` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频',
  `time` int(0) NULL DEFAULT NULL COMMENT '时长|单位秒',
  `charge` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收费|C 收费; F 免费',
  `sort` int(0) NULL DEFAULT NULL COMMENT '顺序',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '小节' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('00000001', '测试小节01', '00000001', '00000000', '', 500, 'F', 1, '2022-03-01 13:38:50.000', '2022-03-01 13:38:50.000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name_unique`(`login_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10000000', 'test', '测试', 'test');
INSERT INTO `user` VALUES ('eAGJ3rpp', 'admin', 'admin', 'admin');
INSERT INTO `user` VALUES ('RkGsVcX2', 'test1', '111', '222');

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log`  (
  `id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `plant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绿植id',
  `plant_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绿植名称',
  `user_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `user_telephone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态|枚举[AdoptStatus]: APPLY(\"1\", \"申请领养\"),FINISHED(\"0\",\"领养完成\")',
  `user_id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户id',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '申请领养' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_log
-- ----------------------------
INSERT INTO `user_log` VALUES ('00000001', 'admin', '00000001', '111', '河南安阳', '13027595769', '1', '00000001', '2022-03-02 13:01:02.000', '2022-03-02 13:01:02.000');
INSERT INTO `user_log` VALUES ('00000002', 'admin1', '00000002', '1111', '河南安阳', '13027595769', '0', '00000002', '2022-03-02 13:03:19.000', '2022-03-02 13:03:27.507');

SET FOREIGN_KEY_CHECKS = 1;
