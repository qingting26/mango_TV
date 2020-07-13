-- MySQL dump 10.13  Distrib 5.7.14, for Win32 (AMD64)
--
-- Host: 192.168.0.105    Database: mango
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_7d71c5eae88eda9a_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_7d71c5eae88eda9a_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_5a8875e40dd66b7e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_1e2fc7af96cfad85_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 影视类型',6,'add_movietype'),(17,'Can change 影视类型',6,'change_movietype'),(18,'Can delete 影视类型',6,'delete_movietype'),(19,'Can add 影视SPU',7,'add_movies'),(20,'Can change 影视SPU',7,'change_movies'),(21,'Can delete 影视SPU',7,'delete_movies'),(22,'Can add 影视',8,'add_moviesku'),(23,'Can change 影视',8,'change_moviesku'),(24,'Can delete 影视',8,'delete_moviesku'),(25,'Can add 影视图片',9,'add_movieimage'),(26,'Can change 影视图片',9,'change_movieimage'),(27,'Can delete 影视图片',9,'delete_movieimage'),(28,'Can add 首页轮播图影视',10,'add_indexmoviesbanner'),(29,'Can change 首页轮播图影视',10,'change_indexmoviesbanner'),(30,'Can delete 首页轮播图影视',10,'delete_indexmoviesbanner'),(31,'Can add 主页分类展示影视',11,'add_indextypemoviesbanner'),(32,'Can change 主页分类展示影视',11,'change_indextypemoviesbanner'),(33,'Can delete 主页分类展示影视',11,'delete_indextypemoviesbanner'),(34,'Can add 主页活动',12,'add_indexpromotionbanner'),(35,'Can change 主页活动',12,'change_indexpromotionbanner'),(36,'Can delete 主页活动',12,'delete_indexpromotionbanner'),(37,'Can add 用户',13,'add_user'),(38,'Can change 用户',13,'change_user'),(39,'Can delete 用户',13,'delete_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_movies_sku`
--

DROP TABLE IF EXISTS `db_movies_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_movies_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL,
  `movies_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_movies_sku_movies_id_72f112515206928b_fk_df_movie_id` (`movies_id`),
  KEY `db_movies_sku_94757cae` (`type_id`),
  CONSTRAINT `db_movies_sku_movies_id_72f112515206928b_fk_df_movie_id` FOREIGN KEY (`movies_id`) REFERENCES `df_movie` (`id`),
  CONSTRAINT `db_movies_sku_type_id_3f2ed55aacd9119a_fk_df_movie_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_movie_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_movies_sku`
--

LOCK TABLES `db_movies_sku` WRITE;
/*!40000 ALTER TABLE `db_movies_sku` DISABLE KEYS */;
INSERT INTO `db_movies_sku` VALUES (1,'2020-07-02 15:35:20.567437','2020-07-04 03:34:43.663054',0,'汪汪队立大功 第六季','最新一季惊喜上线','group1/M00/00/00/wKgAaV79_riAAaQsAAFZxF_d3zo7993843',1,1,1),(2,'2020-07-03 05:05:00.400508','2020-07-03 05:05:00.400508',0,'超级飞侠 第八季','超级装备 酷炫升级','group1/M00/00/00/wKgAaV7-vHyAdo9qAAFlBHe2DI42147129',1,1,1),(3,'2020-07-03 05:05:33.103239','2020-07-03 05:05:33.103239',0,'小发明家尼克','解锁更多脑洞大发明','group1/M00/00/00/wKgAaV7-vJ2Ac2eEAAGG_YWEPd43432216',1,1,1),(4,'2020-07-03 05:06:11.822171','2020-07-03 05:06:11.822171',0,'疯狂的麦咭第七季','赵文卓于洋演绎别样师徒情','group1/M00/00/00/wKgAaV7-vMSADQ0uAAEquOYdsGM9001868',1,1,1),(5,'2020-07-03 05:07:01.395183','2020-07-03 05:07:01.395183',0,'喜羊羊与灰太狼之奇趣外形客','喜羊羊兄妹智斗外形菌','group1/M00/00/00/wKgAaV7-vPWAQLpnAAFDZAQG02g5580202',1,1,1),(6,'2020-07-03 05:07:39.310542','2020-07-03 05:07:39.310542',0,'小猪佩奇 第七季','小猪佩奇愉快的日常生活','group1/M00/00/00/wKgAaV7-vRuAdhc4AAFgFds4H7w8571793',1,1,1),(7,'2020-07-03 05:08:16.177060','2020-07-03 05:08:16.177060',0,'泰娜丛林奇遇记','一起守护丛林的朋友们','group1/M00/00/00/wKgAaV7-vUCAV42NAAESXb4amEs1811998',1,1,1),(8,'2020-07-03 05:08:53.404765','2020-07-03 05:08:53.404765',0,'阳光小兔 第四季','小“胖”友爆笑上线','group1/M00/00/00/wKgAaV7-vWWAbnrbAAC08x9XYkw4963993',1,1,1),(9,'2020-07-03 05:09:32.096535','2020-07-03 05:09:32.096535',0,'悠猴救援大行动','环游世界 结识新朋友','group1/M00/00/00/wKgAaV7-vYyAZeFvAAEtChdH_sg4091271',1,1,1),(10,'2020-07-04 04:27:32.004920','2020-07-04 04:27:32.004920',0,'声优大赛','第十六届国际动漫节×芒果TV','group1/M00/00/00/wKgAaV8ABTWAHMopAADcEaL7KX84570883',1,1,2),(11,'2020-07-04 04:28:51.712634','2020-07-11 09:21:35.776552',0,'目下街21号','为你量身打造治愈系轻喜剧','group1/M00/00/00/wKgAaV8ABYSAOhxPAAEDMwFRk_g7698781',1,1,2),(12,'2020-07-04 04:30:10.742570','2020-07-04 04:30:10.742570',0,'少年白马醉春风','少年侠影，肆意江湖','group1/M00/00/00/wKgAaV8ABdOAGsomAAF_SiUuAKY4417153',1,1,2),(13,'2020-07-04 04:31:12.432047','2020-07-04 04:31:12.432047',0,'妖神记之黑狱篇','聂离重回光明城','group1/M00/00/00/wKgAaV8ABhGAC8-IAAEtmCBbzBs5232210',1,1,2),(14,'2020-07-04 04:31:56.931923','2020-07-04 04:31:56.931923',0,'某天成为王的女儿','公主的真心话与大冒险','group1/M00/00/00/wKgAaV8ABj2AGqTyAAFiaQgH-qQ4863632',1,1,2),(15,'2020-07-04 04:35:19.142082','2020-07-04 04:35:19.142082',0,'乘风破浪的姐姐','霸气！首场公演高燃来袭！','group1/M00/00/00/wKgAaV8ABwiARK4IAA8Q9tJqdVI2383199',1,1,5),(16,'2020-07-04 04:36:24.120518','2020-07-04 04:36:24.120518',0,'名侦探学院','辩论赛蒲星周俊伟神仙打架','group1/M00/00/00/wKgAaV8AB0iAOhPvAADI2VciAJY2595817',1,1,5),(17,'2020-07-04 04:36:57.941339','2020-07-04 04:36:57.941339',0,'杨幂邓论凭空消失','密室大逃脱第二季','group1/M00/00/00/wKgAaV8AB2qAUpCRAAbzDhRUFuo9165539',1,1,5),(18,'2020-07-04 04:37:56.614186','2020-07-04 04:37:56.614186',0,'宣璐霸总狂撩赵志伟','心动预警！良辰美景cp来了','group1/M00/00/00/wKgAaV8AB6WAOUILAAkeW5vpcNE1320730',1,1,5),(19,'2020-07-04 04:39:42.850400','2020-07-04 04:39:42.850400',0,'婆婆和妈妈','伊能静秦昊激烈争吵','group1/M00/00/00/wKgAaV8ACA-AKKRKAAMKYN0-N3Q3962443',1,7,5),(20,'2020-07-04 04:40:47.395008','2020-07-04 04:40:47.395008',0,'欢乐满人间2','魔法保姆的奇妙能力','group1/M00/00/00/wKgAaV8ACFCAZLiHAAF2V7ic2pE0326989',1,5,3),(21,'2020-07-04 04:41:52.706110','2020-07-04 04:41:52.706110',0,'星球大战：天行者崛起','全新三部曲迎来史诗终章！','group1/M00/00/00/wKgAaV8ACJGAd9H7AAB-EiImcos7849813',1,5,3),(22,'2020-07-04 04:42:50.812568','2020-07-04 04:42:50.812568',0,'玩具总动员4','胡迪与伙伴们踏上全新冒险','group1/M00/00/00/wKgAaV8ACMuAAfRRAAKmeYRLjg09105449',1,4,3),(23,'2020-07-04 04:43:47.713737','2020-07-04 04:43:47.713737',0,'绿皮书','第91届奥斯卡金像奖最佳影片','group1/M00/00/00/wKgAaV8ACQSAUVKMAALx-xNU0uM9772360',1,6,3),(24,'2020-07-04 04:46:18.253774','2020-07-04 04:46:18.253774',0,'蜗牛与黄鹂鸟','李臻言见岳父遭暴打','group1/M00/00/00/wKgAaV8ACZuANgFgAAgZ3BbI5oI4349331',1,2,4),(25,'2020-07-04 04:47:27.056513','2020-07-04 04:47:27.056513',0,'奈何BOSS又如何','星辰热吻治愈严BOSS','group1/M00/00/01/wKgAaV8ACeCAVZjiAAmUZcthJ4U7017552',1,7,4),(26,'2020-07-04 04:48:28.340854','2020-07-04 04:48:28.340854',0,'哪吒降妖记','阔气！吒儿要为小龙女买条街','group1/M00/00/01/wKgAaV8ACh2AXbcOAAC5j98aW608266402',1,6,4),(27,'2020-07-04 04:49:25.615578','2020-07-04 04:49:25.615578',0,'夏夜知君暖','要亲亲！夜神霸气壁咚','group1/M00/00/01/wKgAaV8AClaAezbyAAJbx-E_Qe81926859',1,7,4),(28,'2020-07-05 05:39:08.442795','2020-07-05 05:39:08.442795',0,'林凡特调饮料铺开张了','可爱凡凡拒绝做憨憨','group1/M00/00/01/wKgAaV8BZ36AJQN8AAG1UF1Wae41347945',1,4,5),(29,'2020-07-05 05:41:08.628758','2020-07-05 05:41:08.628758',0,'摊牌吧！芒果酱','秦昊喊话观众！我还有机会吗','group1/M00/00/01/wKgAaV8BZ_aADWGeAAF0pOTM39Q6835914',1,4,4),(30,'2020-07-05 05:42:00.430008','2020-07-05 05:42:00.430008',0,'王嘉尔','一起来开心一下','group1/M00/00/01/wKgAaV8BaCqANPWyAAHRsDayXxg0188385',1,1,3),(31,'2020-07-05 05:44:14.905338','2020-07-05 05:44:14.905338',0,'迪迦奥特曼','迪迦来了','group1/M00/00/01/wKgAaV8BaLGAP8UnAABHqltxfwE1676360',1,4,2),(32,'2020-07-05 05:45:13.807825','2020-07-05 05:45:13.807825',0,'小鸡快跑','小鸡快跑','group1/M00/00/01/wKgAaV8BaOuAfhZPAACwHxGntJ45109690',1,4,1),(33,'2020-07-12 13:18:04.927252','2020-07-12 13:39:28.702387',0,'运动吧少年','何老师后台为少年们开动员大会','group1/M00/00/01/wKgAaV8LDY2AQlaxAADIL3kInCQ4365296',1,8,5);
/*!40000 ALTER TABLE `db_movies_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_banner`
--

DROP TABLE IF EXISTS `df_index_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_index_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_banner_22ad5bca` (`sku_id`),
  CONSTRAINT `df_index_banner_sku_id_2acf5e3dd5ce99e6_fk_db_movies_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `db_movies_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_banner`
--

LOCK TABLES `df_index_banner` WRITE;
/*!40000 ALTER TABLE `df_index_banner` DISABLE KEYS */;
INSERT INTO `df_index_banner` VALUES (1,'2020-07-04 04:50:40.388520','2020-07-04 04:50:40.388520',0,'group1/M00/00/01/wKgAaV8ACqGAC9LmACKWUDNOWZw0922788',3,27),(2,'2020-07-04 04:52:22.327764','2020-07-04 04:52:47.681028',0,'group1/M00/00/01/wKgAaV8ACweAWEssAApgwuCOgro8245895',1,16),(3,'2020-07-04 04:52:38.470893','2020-07-04 04:52:38.470893',0,'group1/M00/00/01/wKgAaV8ACxeAaT6CACG3mLUKB6c9682377',2,15);
/*!40000 ALTER TABLE `df_index_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_promotion`
--

DROP TABLE IF EXISTS `df_index_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_index_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(256) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_promotion`
--

LOCK TABLES `df_index_promotion` WRITE;
/*!40000 ALTER TABLE `df_index_promotion` DISABLE KEYS */;
INSERT INTO `df_index_promotion` VALUES (1,'2020-07-12 10:40:25.465612','2020-07-12 10:40:25.465612',0,'乘风破浪的姐姐','http://127.0.0.1:8000/movie/15','group1/M00/00/01/wKgAaV8K6JqAYHYrAAB21vEJk5c0519218',1),(2,'2020-07-12 10:41:26.033667','2020-07-12 10:41:26.033667',0,'妻子的浪漫旅行','http://127.0.0.1:8000/movie/12','group1/M00/00/01/wKgAaV8K6NaAayCzAABQ7AGkznM3419987',2),(3,'2020-07-12 10:41:46.495258','2020-07-12 10:41:46.495258',0,'奇妙小森林','http://127.0.0.1:8000/movie/3','group1/M00/00/01/wKgAaV8K6OuAAYs-AABIvmSyrBQ7310786',3);
/*!40000 ALTER TABLE `df_index_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_type_movies`
--

DROP TABLE IF EXISTS `df_index_type_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_index_type_movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_type_movies_22ad5bca` (`sku_id`),
  KEY `df_index_type_movies_94757cae` (`type_id`),
  CONSTRAINT `df_index_type_movie_type_id_56e62e71feb80018_fk_df_movie_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_movie_type` (`id`),
  CONSTRAINT `df_index_type_movies_sku_id_7473855cf7001bf_fk_db_movies_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `db_movies_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_type_movies`
--

LOCK TABLES `df_index_type_movies` WRITE;
/*!40000 ALTER TABLE `df_index_type_movies` DISABLE KEYS */;
INSERT INTO `df_index_type_movies` VALUES (1,'2020-07-05 05:45:41.854215','2020-07-05 05:45:41.854215',0,1,1,32,1),(2,'2020-07-05 05:46:03.830288','2020-07-05 05:46:03.830288',0,1,2,31,2),(3,'2020-07-05 05:46:13.116035','2020-07-05 05:46:13.116035',0,1,3,30,3),(4,'2020-07-05 05:46:24.464626','2020-07-05 05:46:24.464626',0,1,4,29,4),(5,'2020-07-05 05:46:33.555769','2020-07-05 05:46:33.555769',0,1,5,28,5);
/*!40000 ALTER TABLE `df_index_type_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_movie`
--

DROP TABLE IF EXISTS `df_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_movie`
--

LOCK TABLES `df_movie` WRITE;
/*!40000 ALTER TABLE `df_movie` DISABLE KEYS */;
INSERT INTO `df_movie` VALUES (1,'2020-07-02 15:30:24.696968','2020-07-02 15:31:15.579483',0,'益智','<p>适合小孩子观看</p>'),(2,'2020-07-02 15:31:37.316143','2020-07-02 15:31:37.316143',0,'惊悚','<p>惊悚刺激</p>'),(3,'2020-07-02 15:31:57.413450','2020-07-02 15:31:57.413450',0,'宫廷','<p>宫心计</p>'),(4,'2020-07-02 15:32:14.924774','2020-07-02 15:32:14.924774',0,'喜剧','<p>让人开怀大笑</p>'),(5,'2020-07-02 15:32:38.923535','2020-07-02 15:32:38.923535',0,'科幻','<p>特效足，带给你不一样的视觉盛宴</p>'),(6,'2020-07-02 15:33:13.313125','2020-07-02 15:33:13.313125',0,'动作','<p>不一样的感觉，</p>'),(7,'2020-07-02 15:33:47.638646','2020-07-02 15:33:47.638646',0,'爱情','<p>有时候，错过了就是错过了。</p>'),(8,'2020-07-03 05:02:00.106936','2020-07-03 05:02:00.106936',0,'vip','<p>只有vip用户才可以观看</p>\r\n<p>&nbsp;</p>');
/*!40000 ALTER TABLE `df_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_movie_type`
--

DROP TABLE IF EXISTS `df_movie_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_movie_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `cover_image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_movie_type`
--

LOCK TABLES `df_movie_type` WRITE;
/*!40000 ALTER TABLE `df_movie_type` DISABLE KEYS */;
INSERT INTO `df_movie_type` VALUES (1,'2020-07-02 09:34:36.591404','2020-07-02 15:16:44.313794',0,'少儿','children','group1/M00/00/00/wKgAaV79-luARpqRAAAE4wg0Xpc0515259','group1/M00/00/00/wKgAaV79-lyAWD13AAFZxF_d3zo3715477'),(2,'2020-07-02 15:19:18.892372','2020-07-02 15:19:18.892372',0,'动漫','cartoon','group1/M00/00/00/wKgAaV79-vaAOFhpAAAEWWww7KY6037266','group1/M00/00/00/wKgAaV79-vaAarPIAAE_9G3gimM7999424'),(3,'2020-07-02 15:20:49.446884','2020-07-02 15:20:49.446884',0,'电影','movie','group1/M00/00/00/wKgAaV79-1CACkNSAAAFuA4a2E45436084','group1/M00/00/00/wKgAaV79-1CAWWiuAALx-xNU0uM4487204'),(4,'2020-07-02 15:22:20.673326','2020-07-02 15:22:20.673326',0,'电视剧','teleplay','group1/M00/00/00/wKgAaV79-6yAC7xtAAAC0E1pGLo2512464','group1/M00/00/00/wKgAaV79-6yADrCbAAC5j98aW605499107'),(5,'2020-07-02 15:23:35.153796','2020-07-02 15:23:35.153796',0,'综艺','shows','group1/M00/00/00/wKgAaV79-_aAXpsSAAADPmCOvIY3292013','group1/M00/00/00/wKgAaV79-_aACdOdAAMRLRw2MW87259495');
/*!40000 ALTER TABLE `df_movie_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_movies_image`
--

DROP TABLE IF EXISTS `df_movies_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_movies_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_movies_image_22ad5bca` (`sku_id`),
  CONSTRAINT `df_movies_image_sku_id_73c0166912c19a2e_fk_db_movies_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `db_movies_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_movies_image`
--

LOCK TABLES `df_movies_image` WRITE;
/*!40000 ALTER TABLE `df_movies_image` DISABLE KEYS */;
INSERT INTO `df_movies_image` VALUES (1,'2020-07-02 15:35:56.154494','2020-07-11 09:14:28.156043',0,'group1/M00/00/00/wKgAaV79_tuALAWqAAFZxF_d3zo9869291',1),(2,'2020-07-11 09:14:48.314186','2020-07-11 09:14:48.314186',0,'group1/M00/00/01/wKgAaV8JgwiAGXpCAA8Q9tJqdVI1482595',15),(3,'2020-07-11 09:15:08.632863','2020-07-11 09:15:08.632863',0,'group1/M00/00/01/wKgAaV8JgxyARyNpAADI2VciAJY0332757',16),(4,'2020-07-11 09:15:49.091669','2020-07-11 09:15:49.091669',0,'group1/M00/00/01/wKgAaV8Jg0SAe81_AACwHxGntJ46266350',32),(5,'2020-07-11 09:16:04.969222','2020-07-11 09:16:04.969222',0,'group1/M00/00/01/wKgAaV8Jg1SAE36fAAHRsDayXxg3141401',30),(6,'2020-07-11 09:16:27.200817','2020-07-11 09:16:27.201819',0,'group1/M00/00/01/wKgAaV8Jg2qAPMv3AALx-xNU0uM3927102',23),(7,'2020-07-11 09:16:57.796034','2020-07-11 09:16:57.796034',0,'group1/M00/00/01/wKgAaV8Jg4mAMN9EAAKmeYRLjg01708334',22);
/*!40000 ALTER TABLE `df_movies_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user`
--

DROP TABLE IF EXISTS `df_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user`
--

LOCK TABLES `df_user` WRITE;
/*!40000 ALTER TABLE `df_user` DISABLE KEYS */;
INSERT INTO `df_user` VALUES (1,'pbkdf2_sha256$20000$9Y6UGRBDiuZx$eZ8K/k7GioljmebvjC07MxO3mq7CLX2Zk7IXQ1eLwm4=',NULL,0,'admin001','','','qingting26@163.com',0,1,'2020-07-01 15:07:38.677030','2020-07-01 15:07:38.791854','2020-07-01 15:07:38.791854',0),(2,'pbkdf2_sha256$20000$EmnkPzSqwmP5$0qOyt6Qe5/7TZ69QLlkeHUC1rBSJ8ZCzn20a+zUrV+k=',NULL,0,'admin002','','','qingting26@163.com',0,0,'2020-07-01 15:24:53.430890','2020-07-01 15:24:53.449876','2020-07-01 15:24:53.505668',0),(3,'pbkdf2_sha256$20000$xClEWpQdTR0o$M+uyPIfwu1K9bkZ+czwP3x2Hv9Ie/4NrThy3AglRvII=',NULL,0,'admin003','','','qingting26@163.com',0,0,'2020-07-01 15:29:50.437707','2020-07-01 15:29:50.454691','2020-07-01 15:29:50.458651',0),(4,'pbkdf2_sha256$20000$z0q4HoCgx1PI$u/MReZMjRwLgK5Q/5SFy5UuY6O2P30CbZg7eKcmChu8=',NULL,0,'admin004','','','qingting26@163.com',0,0,'2020-07-02 00:34:30.340256','2020-07-02 00:34:30.376983','2020-07-02 00:34:30.514535',0),(5,'pbkdf2_sha256$20000$070CeYlJGKDc$OBrq+LDYVsr2upUlfghkqgNzZ6Yx/5Qlw6W5qUtnRVQ=',NULL,0,'admin005','','','qingting26@163.com',0,0,'2020-07-02 00:35:42.142672','2020-07-02 00:35:42.160627','2020-07-02 00:35:42.209493',0),(6,'pbkdf2_sha256$20000$0vJrdCoPu0WB$UqWtyZz4OBd+QiLeUmk1qMijDtTHDG/ItpSE1kKPNsc=',NULL,0,'admin006','','','qingting26@163.com',0,0,'2020-07-02 00:38:27.759413','2020-07-02 00:38:27.810495','2020-07-02 00:38:27.814485',0),(7,'pbkdf2_sha256$20000$vb2mPMLbMXIt$538LlUFLtg2Bj4KLEWh41t8GEgRsWtZuOODMpk+oGuM=',NULL,0,'admin007','','','qingting26@163.com',0,0,'2020-07-02 00:41:06.976466','2020-07-02 00:41:06.994416','2020-07-02 00:41:06.997450',0),(8,'pbkdf2_sha256$20000$tnlHZwtql37v$4pP2FbWuXuBNYTv1xwvcAWszgREUaJwI4qxhbSv+VJU=',NULL,0,'admin008','','','qingting26@163.com',0,0,'2020-07-02 00:42:07.519350','2020-07-02 00:42:07.538296','2020-07-02 00:42:07.541285',0),(9,'pbkdf2_sha256$20000$bGqoyw6iAuhH$hIj6GhyIJ6N7X173B6+gAtvLfusih66SK64wM2SGO+c=',NULL,0,'admin009','','','qingting26@163.com',0,1,'2020-07-02 00:50:25.939027','2020-07-02 00:50:25.956973','2020-07-02 00:50:37.406605',0),(10,'pbkdf2_sha256$20000$rA7gx3DyCIoz$eBAK2QuZ6Ye4hG4dtk9U9ck1O7cpiG8P+fX2b1CeFio=',NULL,0,'admin010','','','qingting26@163.com',0,0,'2020-07-02 04:25:22.502964','2020-07-02 04:25:22.519917','2020-07-02 04:25:22.709086',0),(11,'pbkdf2_sha256$20000$M7pB9XyXQzb7$iIpmIJEJc/f3QfV1mpAGUMXiePkvKtnDsUTfA/GIR5Y=',NULL,0,'admin011','','','qingting26@163.com',0,0,'2020-07-02 04:30:06.089690','2020-07-02 04:30:06.107643','2020-07-02 04:30:06.135569',0),(12,'pbkdf2_sha256$20000$FhhgG4Ps2Ylf$iQYPiRJZZ5pCVK+D1vOdRDbXFdVB2QjODFlgg6siWg4=',NULL,0,'admin012','','','qingting26@163.com',0,0,'2020-07-02 04:33:16.570320','2020-07-02 04:33:16.588238','2020-07-02 04:33:16.774740',0),(13,'pbkdf2_sha256$20000$9N9s8t0bk3cw$7CtUH86oAV0+aqsXi9lZhv33OcwwlH+vMJTVzwaOI14=',NULL,0,'admin013','','','qingting26@163.com',0,0,'2020-07-02 04:36:19.090837','2020-07-02 04:36:19.107802','2020-07-02 04:36:19.110761',0),(14,'pbkdf2_sha256$20000$dASo7CCA09ap$NauaSK5sWbN5kC+xNNw92jwbWpzLCgZmXf26EDzQk3o=','2020-07-12 14:03:00.138464',0,'admin014','','','qingting26@163.com',0,1,'2020-07-02 04:42:23.894036','2020-07-02 04:42:23.911988','2020-07-02 04:42:35.518266',0),(15,'pbkdf2_sha256$20000$jMXKxGebpBXi$CDeD/t5yPttFNqB8wxZfDXixZxYqHyYVtQIKdj4/ptk=','2020-07-12 12:03:13.173133',1,'admin','','','1126@163.com',1,1,'2020-07-02 09:27:19.758304','2020-07-02 09:27:19.824127','2020-07-02 09:27:19.824127',0),(16,'pbkdf2_sha256$20000$c6gtQiS16wN2$LUtQc94WxEzGUAph9WH13i4RzqeVdS/riepJWM8J/Hw=',NULL,0,'admin015','','','qingting26@163.com',0,0,'2020-07-12 14:09:40.599043','2020-07-12 14:09:40.615997','2020-07-12 14:09:40.650903',0);
/*!40000 ALTER TABLE `df_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_groups`
--

DROP TABLE IF EXISTS `df_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `df_user_groups_group_id_65eefb1d67b66d04_fk_auth_group_id` (`group_id`),
  CONSTRAINT `df_user_groups_group_id_65eefb1d67b66d04_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `df_user_groups_user_id_653b9fc69bb07d6d_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_groups`
--

LOCK TABLES `df_user_groups` WRITE;
/*!40000 ALTER TABLE `df_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_user_permissions`
--

DROP TABLE IF EXISTS `df_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `df_user_user_permission_id_844e58111745902_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `df_user_user_permission_id_844e58111745902_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `df_user_user_permissions_user_id_6295e6825b12edf1_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_user_permissions`
--

LOCK TABLES `df_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `df_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_6372265f973837e7_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_570c9ad562789566_fk_df_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_6372265f973837e7_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_570c9ad562789566_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-07-02 09:34:36.820792','1','少儿',1,'',6,15),(2,'2020-07-02 15:16:43.753321','1','少儿',2,'已修改 image 和 cover_image 。',6,15),(3,'2020-07-02 15:16:44.823431','1','少儿',2,'已修改 image 和 cover_image 。',6,15),(4,'2020-07-02 15:19:19.002042','2','动漫',1,'',6,15),(5,'2020-07-02 15:20:49.609206','3','电影',1,'',6,15),(6,'2020-07-02 15:22:20.744142','4','电视剧',1,'',6,15),(7,'2020-07-02 15:23:35.247560','5','综艺',1,'',6,15),(8,'2020-07-02 15:27:34.502731','6','小康',1,'',6,15),(9,'2020-07-02 15:28:05.834718','6','小康',3,'',6,15),(10,'2020-07-02 15:30:24.732896','1','少儿',1,'',7,15),(11,'2020-07-02 15:31:15.582414','1','益智',2,'已修改 name 。',7,15),(12,'2020-07-02 15:31:37.326117','2','惊悚',1,'',7,15),(13,'2020-07-02 15:31:57.424402','3','宫廷',1,'',7,15),(14,'2020-07-02 15:32:14.947712','4','喜剧',1,'',7,15),(15,'2020-07-02 15:32:38.925532','5','科幻',1,'',7,15),(16,'2020-07-02 15:33:13.326101','6','动作',1,'',7,15),(17,'2020-07-02 15:33:47.644627','7','爱情',1,'',7,15),(18,'2020-07-02 15:35:20.625602','1','汪汪队立大功 第六季',1,'',8,15),(19,'2020-07-02 15:35:56.245251','1','MovieImage object',1,'',9,15),(20,'2020-07-03 05:02:00.304407','8','vip',1,'',7,15),(21,'2020-07-03 05:05:00.617435','2','超级飞侠 第八季',1,'',8,15),(22,'2020-07-03 05:05:33.169032','3','小发明家尼克',1,'',8,15),(23,'2020-07-03 05:06:11.887509','4','疯狂的麦咭第七季',1,'',8,15),(24,'2020-07-03 05:07:01.471977','5','喜羊羊与灰太狼之奇趣外形客',1,'',8,15),(25,'2020-07-03 05:07:39.404593','6','小猪佩奇 第七季',1,'',8,15),(26,'2020-07-03 05:08:16.256279','7','泰娜丛林奇遇记',1,'',8,15),(27,'2020-07-03 05:08:53.467591','8','阳光小兔 第四季',1,'',8,15),(28,'2020-07-03 05:09:32.202213','9','悠猴救援大行动',1,'',8,15),(29,'2020-07-04 03:34:43.711680','1','汪汪队立大功 第六季',2,'没有字段被修改。',8,15),(30,'2020-07-04 04:27:32.079724','10','声优大赛',1,'',8,15),(31,'2020-07-04 04:28:51.730587','11','目下街21号',1,'',8,15),(32,'2020-07-04 04:30:10.772649','12','少年白马醉春风',1,'',8,15),(33,'2020-07-04 04:31:12.449002','13','妖神记之黑狱篇',1,'',8,15),(34,'2020-07-04 04:31:56.962815','14','某天成为王的女儿',1,'',8,15),(35,'2020-07-04 04:35:19.184961','15','乘风破浪的姐姐',1,'',8,15),(36,'2020-07-04 04:36:24.137423','16','名侦探学院',1,'',8,15),(37,'2020-07-04 04:36:57.981222','17','杨幂邓论凭空消失',1,'',8,15),(38,'2020-07-04 04:37:56.662062','18','宣璐霸总狂撩赵志伟',1,'',8,15),(39,'2020-07-04 04:39:42.883312','19','婆婆和妈妈',1,'',8,15),(40,'2020-07-04 04:40:47.414954','20','欢乐满人间2',1,'',8,15),(41,'2020-07-04 04:41:52.731047','21','星球大战：天行者崛起',1,'',8,15),(42,'2020-07-04 04:42:50.846507','22','玩具总动员4',1,'',8,15),(43,'2020-07-04 04:43:47.734678','23','绿皮书',1,'',8,15),(44,'2020-07-04 04:46:18.292637','24','蜗牛与黄鹂鸟',1,'',8,15),(45,'2020-07-04 04:47:27.089426','25','奈何BOSS又如何',1,'',8,15),(46,'2020-07-04 04:48:28.359804','26','哪吒降妖记',1,'',8,15),(47,'2020-07-04 04:49:25.647492','27','夏夜知君暖',1,'',8,15),(48,'2020-07-04 04:50:40.469030','1','夏夜知君暖',1,'',10,15),(49,'2020-07-04 04:52:22.363637','2','名侦探学院',1,'',10,15),(50,'2020-07-04 04:52:38.540706','3','乘风破浪的姐姐',1,'',10,15),(51,'2020-07-04 04:52:47.686015','2','名侦探学院',2,'已修改 index 。',10,15),(52,'2020-07-05 05:39:08.775911','28','林凡特调饮料铺开张了',1,'',8,15),(53,'2020-07-05 05:41:08.671653','29','摊牌吧！芒果酱',1,'',8,15),(54,'2020-07-05 05:42:00.556669','30','王嘉尔',1,'',8,15),(55,'2020-07-05 05:44:14.917335','31','迪迦奥特曼',1,'',8,15),(56,'2020-07-05 05:45:13.857693','32','小鸡快跑',1,'',8,15),(57,'2020-07-05 05:45:41.864179','1','少儿---小鸡快跑',1,'',11,15),(58,'2020-07-05 05:46:03.841253','2','动漫---迪迦奥特曼',1,'',11,15),(59,'2020-07-05 05:46:13.117031','3','电影---王嘉尔',1,'',11,15),(60,'2020-07-05 05:46:24.473605','4','电视剧---摊牌吧！芒果酱',1,'',11,15),(61,'2020-07-05 05:46:33.556777','5','综艺---林凡特调饮料铺开张了',1,'',11,15),(62,'2020-07-11 08:53:34.709371','6','热点',1,'',6,15),(63,'2020-07-11 08:55:01.556817','33','乘风破浪的姐姐',1,'',8,15),(64,'2020-07-11 08:56:20.371362','33','乘风破浪的姐姐',3,'',8,15),(65,'2020-07-11 08:56:33.281847','6','热点',3,'',6,15),(66,'2020-07-11 09:12:29.881697','1','乘风破浪的姐姐',1,'',12,15),(67,'2020-07-11 09:13:46.382208','1','乘风破浪的姐姐',3,'',12,15),(68,'2020-07-11 09:14:28.200922','1','汪汪队立大功 第六季',2,'没有字段被修改。',9,15),(69,'2020-07-11 09:14:48.416877','2','乘风破浪的姐姐',1,'',9,15),(70,'2020-07-11 09:15:08.695663','3','名侦探学院',1,'',9,15),(71,'2020-07-11 09:15:49.125579','4','小鸡快跑',1,'',9,15),(72,'2020-07-11 09:16:05.000147','5','王嘉尔',1,'',9,15),(73,'2020-07-11 09:16:27.253664','6','绿皮书',1,'',9,15),(74,'2020-07-11 09:16:57.867813','7','玩具总动员4',1,'',9,15),(75,'2020-07-11 09:21:36.824723','11','目下街21号',2,'已修改 type 。',8,15),(76,'2020-07-12 10:40:25.875516','1','乘风破浪的姐姐',1,'',12,15),(77,'2020-07-12 10:41:26.112457','2','妻子的浪漫旅行',1,'',12,15),(78,'2020-07-12 10:41:46.576073','3','奇妙小森林',1,'',12,15),(79,'2020-07-12 13:18:06.123055','33','运动吧少年',1,'',8,15),(80,'2020-07-12 13:39:00.227482','33','运动吧少年',2,'已修改 status 。',8,15),(81,'2020-07-12 13:39:29.275825','33','运动吧少年',2,'已修改 status 。',8,15);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_1653af98820da9be_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(10,'movie','indexmoviesbanner'),(12,'movie','indexpromotionbanner'),(11,'movie','indextypemoviesbanner'),(9,'movie','movieimage'),(7,'movie','movies'),(8,'movie','moviesku'),(6,'movie','movietype'),(5,'sessions','session'),(13,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-07-01 14:18:44.516798'),(2,'contenttypes','0002_remove_content_type_name','2020-07-01 14:18:44.689353'),(3,'auth','0001_initial','2020-07-01 14:18:44.957820'),(4,'auth','0002_alter_permission_name_max_length','2020-07-01 14:18:44.976770'),(5,'auth','0003_alter_user_email_max_length','2020-07-01 14:18:44.984748'),(6,'auth','0004_alter_user_username_opts','2020-07-01 14:18:45.005695'),(7,'auth','0005_alter_user_last_login_null','2020-07-01 14:18:45.014668'),(8,'auth','0006_require_contenttypes_0002','2020-07-01 14:18:45.019655'),(9,'user','0001_initial','2020-07-01 14:18:45.207427'),(10,'admin','0001_initial','2020-07-01 14:18:45.274249'),(11,'movie','0001_initial','2020-07-01 14:18:45.737049'),(12,'sessions','0001_initial','2020-07-01 14:18:45.766959');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-13 18:33:51
