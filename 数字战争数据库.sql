/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.23 : Database - figure_war
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`figure_war` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `figure_war`;

/*Table structure for table `db_chat` */

DROP TABLE IF EXISTS `db_chat`;

CREATE TABLE `db_chat` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `sendUserId` int DEFAULT NULL COMMENT '发送人',
  `friendId` tinyint DEFAULT NULL COMMENT '朋友Id',
  `sendText` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送文本',
  `sendPicture` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送图片',
  `sendDate` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_chat` */

insert  into `db_chat`(`Id`,`sendUserId`,`friendId`,`sendText`,`sendPicture`,`sendDate`) values 
(15,2,1,'你好',NULL,'2021-06-02 17:15:02'),
(16,2,1,'你在哪里',NULL,'2021-06-02 20:16:21'),
(17,2,1,'萨达',NULL,'2021-06-02 20:17:50'),
(18,2,1,'你在哪里啊',NULL,'2021-06-02 20:18:06'),
(19,1,1,'教室',NULL,'2021-06-02 20:19:29'),
(20,1,1,'吃夜宵',NULL,'2021-06-02 20:21:02'),
(21,2,1,'不了',NULL,'2021-06-02 20:21:32'),
(22,2,1,'没钱',NULL,'2021-06-02 20:22:36'),
(23,1,1,'我有啊',NULL,'2021-06-02 20:23:02'),
(24,1,1,'走不走',NULL,'2021-06-02 20:23:45'),
(25,2,1,'不了',NULL,'2021-06-02 20:24:12'),
(26,1,3,'?',NULL,'2021-06-16 11:02:34'),
(27,1,3,'买买买',NULL,'2021-06-16 11:07:43'),
(28,1,3,'???????',NULL,'2021-07-05 19:33:26'),
(29,2,3,'????',NULL,'2021-07-05 19:34:06'),
(30,1,3,'你好',NULL,'2021-08-02 10:55:48'),
(31,1,3,'???',NULL,'2021-08-02 10:56:51'),
(32,3,4,'点击聊天',NULL,'2021-08-06 20:13:05'),
(33,3,4,'点击系统',NULL,'2021-08-06 20:13:16'),
(34,1,4,'然后呢',NULL,'2021-08-06 20:13:24'),
(35,3,4,'有个人工智障',NULL,'2021-08-06 20:13:43'),
(36,1,4,'没看到',NULL,'2021-08-06 20:14:01'),
(37,1,4,'看到了',NULL,'2021-08-06 20:14:08'),
(38,3,4,'这个还需要录入很多数据,不算完美',NULL,'2021-08-06 20:14:42'),
(39,1,4,'拒绝访问',NULL,'2021-08-06 20:17:59'),
(40,1,4,'为何',NULL,'2021-08-06 20:18:08'),
(41,3,4,'点击高级,继续访问',NULL,'2021-08-06 20:18:29'),
(42,1,4,'是直接显示无法访问了',NULL,'2021-08-06 20:18:55'),
(43,1,4,'不是刚才我刚才那种情况框',NULL,'2021-08-06 20:19:23'),
(44,3,4,'一般这种情况都是wifi信号不好',NULL,'2021-08-06 20:19:42'),
(45,1,4,'好吧',NULL,'2021-08-06 20:19:50'),
(46,3,4,'叫他访问192.168.191.1:2020',NULL,'2021-08-06 20:20:16'),
(47,1,4,'显示WiFi信号爆格',NULL,'2021-08-06 20:20:22'),
(48,1,4,'不行',NULL,'2021-08-06 20:20:44'),
(49,1,4,'连接中断',NULL,'2021-08-06 20:20:56'),
(50,1,4,'无法访问页面',NULL,'2021-08-06 20:21:14'),
(51,3,4,'我也不敢去瞧瞧',NULL,'2021-08-06 20:21:27'),
(52,1,4,'害算了算了',NULL,'2021-08-06 20:21:37'),
(53,3,4,'你访问一下192.168.191.1:2020',NULL,'2021-08-06 20:22:00'),
(54,3,4,'账号:super007',NULL,'2021-08-06 20:23:54'),
(55,3,4,'密码:123456',NULL,'2021-08-06 20:24:05'),
(56,3,4,'验证码不要填',NULL,'2021-08-06 20:24:12'),
(57,1,4,'访问过了',NULL,'2021-08-06 20:24:34'),
(58,1,4,'被访问拒绝',NULL,'2021-08-06 20:24:40'),
(59,3,4,'你呢',NULL,'2021-08-06 20:24:48'),
(60,1,4,'我可以 她就不行',NULL,'2021-08-06 20:25:00'),
(61,3,4,'你也可以玩玩那个',NULL,'2021-08-06 20:25:15'),
(62,1,4,'欧克欧克',NULL,'2021-08-06 20:25:23'),
(63,3,4,'提示被我干炸了',NULL,'2021-08-06 20:25:38'),
(64,1,4,'这个啊  我试了也不行',NULL,'2021-08-06 20:26:58'),
(65,1,4,'被拒绝访问了',NULL,'2021-08-06 20:27:06'),
(66,3,4,'刷新一下',NULL,'2021-08-06 20:27:18'),
(67,1,4,'192.168.191.1:2020    拒绝访问',NULL,'2021-08-06 20:27:21'),
(68,3,4,'192.168.191.1:2022',NULL,'2021-08-06 20:27:50'),
(69,3,4,'是22',NULL,'2021-08-06 20:27:55'),
(70,3,4,'我搞错了',NULL,'2021-08-06 20:28:07'),
(71,1,3,'///',NULL,'2021-09-23 11:20:38'),
(72,1,3,'??',NULL,'2021-11-25 16:12:48'),
(73,1,3,'1111',NULL,'2021-12-07 09:26:47'),
(74,1,3,'ssss',NULL,'2021-12-07 15:51:39'),
(75,2,3,'sss',NULL,'2021-12-07 15:51:52');

/*Table structure for table `db_friend` */

DROP TABLE IF EXISTS `db_friend`;

CREATE TABLE `db_friend` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `myuserId` int DEFAULT NULL COMMENT '我的Id',
  `myfriendId` int DEFAULT NULL COMMENT '我的朋友Id',
  `friendState` tinyint DEFAULT NULL COMMENT '我们的状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_friend` */

insert  into `db_friend`(`Id`,`myuserId`,`myfriendId`,`friendState`) values 
(3,1,2,1),
(4,1,3,1);

/*Table structure for table `db_room` */

DROP TABLE IF EXISTS `db_room`;

CREATE TABLE `db_room` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `roomNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '房间编号',
  `roomState` tinyint DEFAULT NULL COMMENT '房间状态',
  `isOk` tinyint DEFAULT NULL COMMENT '可否加入',
  `peopleQuantity` int DEFAULT NULL COMMENT '房间总人数',
  `roomMasterId` int DEFAULT NULL COMMENT '房主Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_room` */

insert  into `db_room`(`Id`,`roomNumber`,`roomState`,`isOk`,`peopleQuantity`,`roomMasterId`) values 
(374,'4108297',1,1,6,2),
(375,'4350922',1,1,6,1),
(378,'2839308',1,1,6,1);

/*Table structure for table `db_roomchat` */

DROP TABLE IF EXISTS `db_roomchat`;

CREATE TABLE `db_roomchat` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roomId` int DEFAULT NULL COMMENT '房间Id',
  `roomText` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '房间信息',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_roomchat` */

/*Table structure for table `db_roommember` */

DROP TABLE IF EXISTS `db_roommember`;

CREATE TABLE `db_roommember` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roomId` int DEFAULT NULL COMMENT '房间Id',
  `memberNickName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '成员昵称',
  `memberPortrait` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '成员头像',
  `userId` int DEFAULT NULL COMMENT '用户Id',
  `leftFigure` int DEFAULT '1' COMMENT '左数',
  `rightFigure` int DEFAULT '1' COMMENT '右数',
  `memberLocation` int DEFAULT NULL COMMENT '用户位置',
  `whetherPrepare` tinyint DEFAULT '1' COMMENT '准备状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1360 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_roommember` */

insert  into `db_roommember`(`Id`,`roomId`,`memberNickName`,`memberPortrait`,`userId`,`leftFigure`,`rightFigure`,`memberLocation`,`whetherPrepare`) values 
(1352,374,'极速','20210531_143619649_3475344203792400.jpg',2,1,1,2,2),
(1355,375,'谷歌','20210531_112755941_3464037322949000.jpg',1,1,1,1,2),
(1358,378,'谷歌','20210531_112755941_3464037322949000.jpg',1,1,1,1,2),
(1359,378,'IE','20210601_154328913_3565780001286500.jpg',3,1,1,2,2);

/*Table structure for table `db_user` */

DROP TABLE IF EXISTS `db_user`;

CREATE TABLE `db_user` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `userPassword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `userPortrait` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `nickName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `userPhone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户手机',
  `userIdNo` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户身份证',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_user` */

insert  into `db_user`(`Id`,`userName`,`userPassword`,`userPortrait`,`nickName`,`userPhone`,`userIdNo`) values 
(1,'super007','dc483e80a7a0bd9ef71d8cf973673924','20210531_112755941_3464037322949000.jpg','谷歌','13126033786',NULL),
(2,'yxm123','dc483e80a7a0bd9ef71d8cf973673924','20210531_143619649_3475344203792400.jpg','极速','13671456516',NULL),
(3,'a123456','dc483e80a7a0bd9ef71d8cf973673924','20210601_154328913_3565780001286500.jpg','IE','13138714713',NULL),
(4,'b123456','dc483e80a7a0bd9ef71d8cf973673924','20210606_092615067_3975194294284200.jpg','火狐','13246535382',NULL),
(5,'c123456','dc483e80a7a0bd9ef71d8cf973673924','20210606_092843148_3975342374851100.jpg','QQ','13138714715',NULL),
(6,'d123456','dc483e80a7a0bd9ef71d8cf973673924','20210606_092956578_3975415804530300.jpg','欧鹏','13138714718',NULL),
(7,'superman','dc483e80a7a0bd9ef71d8cf973673924','20210706_143629245_412623210561200.jpg','游客','13126033787',NULL),
(8,'lbk13692511747','0ca7d1babc5b1b3b03d49111d8ccb379','20210818_160948095_1065990193886300.jpg','团子','13692511747',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
