-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: assist.cabqkh4ysqqo.ap-northeast-2.rds.amazonaws.com    Database: assist
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `attendee`
--

DROP TABLE IF EXISTS `attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `attendance` varchar(10) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendee`
--

LOCK TABLES `attendee` WRITE;
/*!40000 ALTER TABLE `attendee` DISABLE KEYS */;
INSERT INTO `attendee` VALUES (16,4,19,'attend','ATK'),(17,4,20,'attend','ATK'),(18,4,21,'attend','MF'),(19,4,22,'attend','ATK'),(20,4,23,'attend','MF'),(21,4,24,'attend','MF'),(22,4,25,'attend','DF'),(23,4,26,'attend','DF'),(24,4,27,'attend','DF'),(25,4,28,'attend','DF'),(26,4,29,'attend','SUB'),(27,4,30,'attend','GK'),(28,5,19,'attend',NULL),(29,5,20,'attend',NULL),(30,5,21,'attend',NULL),(31,5,22,'attend',NULL),(32,5,23,'attend',NULL),(33,5,24,'attend',NULL),(34,5,25,'attend',NULL),(35,5,26,'attend',NULL),(36,5,27,'attend',NULL),(37,5,28,'attend',NULL),(38,5,29,'attend',NULL),(39,5,30,'noattend',NULL),(40,7,31,'attend','ATK'),(41,7,32,'attend','DF'),(42,7,33,'attend','ATK'),(43,7,34,'attend','MF'),(44,7,35,'attend','MF'),(45,7,36,'attend','DF'),(46,7,37,'attend','GK'),(47,7,38,'attend','DF'),(48,7,39,'attend','ATK'),(49,7,40,'attend','MF'),(50,7,41,'attend','DF'),(51,7,42,'attend','SUB'),(52,8,31,'attend',NULL),(53,8,32,'attend',NULL),(54,8,33,'attend',NULL),(55,8,34,'attend',NULL),(56,8,35,'attend',NULL),(57,8,36,'attend',NULL),(58,8,37,'attend',NULL),(59,8,38,'attend',NULL),(60,8,39,'attend',NULL),(61,8,40,'attend',NULL),(62,8,41,'attend',NULL),(63,8,42,'noattend',NULL),(64,10,43,'attend',NULL),(65,10,44,'attend',NULL),(66,10,45,'attend',NULL),(67,10,46,'attend',NULL),(68,10,47,'attend',NULL),(69,10,48,'attend',NULL),(70,10,49,'attend',NULL),(71,10,50,'attend',NULL),(72,10,51,'attend',NULL),(73,10,52,'attend',NULL),(74,10,53,'attend',NULL),(75,10,54,'attend',NULL),(76,11,43,'attend',NULL),(77,11,44,'attend',NULL),(78,11,45,'attend',NULL),(79,11,46,'attend',NULL),(80,11,47,'attend',NULL),(81,11,48,'attend',NULL),(82,11,49,'attend',NULL),(83,11,50,'attend',NULL),(84,11,51,'attend',NULL),(85,11,52,'attend',NULL),(86,11,53,'attend',NULL),(87,11,54,'noattend',NULL),(88,13,55,'attend',NULL),(89,13,56,'attend',NULL),(90,13,57,'attend',NULL),(91,13,58,'attend',NULL),(92,13,59,'attend',NULL),(93,13,60,'attend',NULL),(94,13,61,'attend',NULL),(95,13,62,'attend',NULL),(96,13,63,'attend',NULL),(97,13,64,'attend',NULL),(98,13,65,'attend',NULL),(99,13,66,'attend',NULL),(100,14,55,'attend',NULL),(101,14,56,'attend',NULL),(102,14,57,'attend',NULL),(103,14,58,'attend',NULL),(104,14,59,'attend',NULL),(105,14,60,'attend',NULL),(106,14,61,'attend',NULL),(107,14,62,'attend',NULL),(108,14,63,'attend',NULL),(109,14,64,'attend',NULL),(110,14,65,'attend',NULL),(111,14,66,'noattend',NULL),(112,16,67,'attend',NULL),(113,16,68,'attend',NULL),(114,16,69,'attend',NULL),(115,16,70,'attend',NULL),(116,16,71,'attend',NULL),(117,16,72,'attend',NULL),(118,16,73,'attend',NULL),(119,16,74,'attend',NULL),(120,16,75,'attend',NULL),(121,16,76,'attend',NULL),(122,16,77,'attend',NULL),(123,16,78,'attend',NULL),(124,17,67,'attend',NULL),(125,17,68,'attend',NULL),(126,17,69,'attend',NULL),(127,17,70,'attend',NULL),(128,17,71,'attend',NULL),(129,17,72,'attend',NULL),(130,17,73,'attend',NULL),(131,17,74,'attend',NULL),(132,17,75,'attend',NULL),(133,17,76,'attend',NULL),(134,17,77,'attend',NULL),(135,17,78,'noattend',NULL),(136,19,31,'attend',NULL),(137,19,32,'attend',NULL),(138,19,33,'attend',NULL),(139,19,34,'attend',NULL),(140,19,35,'attend',NULL),(141,19,36,'attend',NULL),(142,19,37,'attend',NULL),(143,19,38,'attend',NULL),(144,19,39,'attend',NULL),(145,19,40,'attend',NULL),(146,19,41,'attend',NULL),(147,19,42,'attend',NULL),(148,20,31,'attend',NULL),(149,20,32,'attend',NULL),(150,20,33,'attend',NULL),(151,20,34,'attend',NULL),(152,20,35,'attend',NULL),(153,20,36,'attend',NULL),(154,20,37,'attend',NULL),(155,20,38,'attend',NULL),(156,20,39,'attend',NULL),(157,20,40,'attend',NULL),(158,20,41,'attend',NULL),(159,20,42,'attend',NULL),(160,21,31,'attend',NULL),(161,21,32,'attend',NULL),(162,21,33,'attend',NULL),(163,21,34,'attend',NULL),(164,21,35,'attend',NULL),(165,21,36,'attend',NULL),(166,21,37,'attend',NULL),(167,21,38,'attend',NULL),(168,21,39,'attend',NULL),(169,21,40,'attend',NULL),(170,21,41,'attend',NULL),(171,21,42,'attend',NULL),(172,22,31,'attend',NULL),(173,22,32,'attend',NULL),(174,22,33,'attend',NULL),(175,22,34,'attend',NULL),(176,22,35,'attend',NULL),(177,22,36,'attend',NULL),(178,22,37,'attend',NULL),(179,22,38,'attend',NULL),(180,22,39,'attend',NULL),(181,22,40,'attend',NULL),(182,22,41,'attend',NULL),(183,22,42,'attend',NULL),(184,23,43,'attend',NULL),(185,23,44,'attend',NULL),(186,23,45,'attend',NULL),(187,23,46,'attend',NULL),(188,23,47,'attend',NULL),(189,23,48,'attend',NULL),(190,23,49,'attend',NULL),(191,23,50,'attend',NULL),(192,23,51,'attend',NULL),(193,23,52,'attend',NULL),(194,23,53,'attend',NULL),(195,23,54,'attend',NULL),(196,24,43,'attend',NULL),(197,24,44,'attend',NULL),(198,24,45,'attend',NULL),(199,24,46,'attend',NULL),(200,24,47,'attend',NULL),(201,24,48,'attend',NULL),(202,24,49,'attend',NULL),(203,24,50,'attend',NULL),(204,24,51,'attend',NULL),(205,24,52,'attend',NULL),(206,24,53,'attend',NULL),(207,24,54,'attend',NULL),(208,25,43,'attend',NULL),(209,25,44,'attend',NULL),(210,25,45,'attend',NULL),(211,25,46,'attend',NULL),(212,25,47,'attend',NULL),(213,25,48,'attend',NULL),(214,25,49,'attend',NULL),(215,25,50,'attend',NULL),(216,25,51,'attend',NULL),(217,25,52,'attend',NULL),(218,25,53,'attend',NULL),(219,25,54,'attend',NULL),(220,26,43,'attend',NULL),(221,26,44,'attend',NULL),(222,26,45,'attend',NULL),(223,26,46,'attend',NULL),(224,26,47,'attend',NULL),(225,26,48,'attend',NULL),(226,26,49,'attend',NULL),(227,26,50,'attend',NULL),(228,26,51,'attend',NULL),(229,26,52,'attend',NULL),(230,26,53,'attend',NULL),(231,26,54,'attend',NULL),(232,27,55,'attend',NULL),(233,27,56,'attend',NULL),(234,27,57,'attend',NULL),(235,27,58,'attend',NULL),(236,27,59,'attend',NULL),(237,27,60,'attend',NULL),(238,27,61,'attend',NULL),(239,27,62,'attend',NULL),(240,27,63,'attend',NULL),(241,27,64,'attend',NULL),(242,27,65,'attend',NULL),(243,27,66,'attend',NULL),(244,28,55,'attend',NULL),(245,28,56,'attend',NULL),(246,28,57,'attend',NULL),(247,28,58,'attend',NULL),(248,28,59,'attend',NULL),(249,28,60,'attend',NULL),(250,28,61,'attend',NULL),(251,28,62,'attend',NULL),(252,28,63,'attend',NULL),(253,28,64,'attend',NULL),(254,28,65,'attend',NULL),(255,28,66,'attend',NULL),(256,29,55,'attend',NULL),(257,29,56,'attend',NULL),(258,29,57,'attend',NULL),(259,29,58,'attend',NULL),(260,29,59,'attend',NULL),(261,29,60,'attend',NULL),(262,29,61,'attend',NULL),(263,29,62,'attend',NULL),(264,29,63,'attend',NULL),(265,29,64,'attend',NULL),(266,29,65,'attend',NULL),(267,29,66,'attend',NULL),(268,30,55,'attend',NULL),(269,30,56,'attend',NULL),(270,30,57,'attend',NULL),(271,30,58,'attend',NULL),(272,30,59,'attend',NULL),(273,30,60,'attend',NULL),(274,30,61,'attend',NULL),(275,30,62,'attend',NULL),(276,30,63,'attend',NULL),(277,30,64,'attend',NULL),(278,30,65,'attend',NULL),(279,30,66,'attend',NULL),(280,31,67,'attend',NULL),(281,31,68,'attend',NULL),(282,31,69,'attend',NULL),(283,31,70,'attend',NULL),(284,31,71,'attend',NULL),(285,31,72,'attend',NULL),(286,31,73,'attend',NULL),(287,31,74,'attend',NULL),(288,31,75,'attend',NULL),(289,31,76,'attend',NULL),(290,31,77,'attend',NULL),(291,31,78,'attend',NULL),(292,32,67,'attend',NULL),(293,32,68,'attend',NULL),(294,32,69,'attend',NULL),(295,32,70,'attend',NULL),(296,32,71,'attend',NULL),(297,32,72,'attend',NULL),(298,32,73,'attend',NULL),(299,32,74,'attend',NULL),(300,32,75,'attend',NULL),(301,32,76,'attend',NULL),(302,32,77,'attend',NULL),(303,32,78,'attend',NULL),(304,33,67,'attend',NULL),(305,33,68,'attend',NULL),(306,33,69,'attend',NULL),(307,33,70,'attend',NULL),(308,33,71,'attend',NULL),(309,33,72,'attend',NULL),(310,33,73,'attend',NULL),(311,33,74,'attend',NULL),(312,33,75,'attend',NULL),(313,33,76,'attend',NULL),(314,33,77,'attend',NULL),(315,33,78,'attend',NULL),(316,34,67,'attend',NULL),(317,34,68,'attend',NULL),(318,34,69,'attend',NULL),(319,34,70,'attend',NULL),(320,34,71,'attend',NULL),(321,34,72,'attend',NULL),(322,34,73,'attend',NULL),(323,34,74,'attend',NULL),(324,34,75,'attend',NULL),(325,34,76,'attend',NULL),(326,34,77,'attend',NULL),(327,34,78,'attend',NULL),(328,35,19,'attend',NULL),(329,35,20,'attend',NULL),(330,35,21,'attend',NULL),(331,35,22,'attend',NULL),(332,35,23,'attend',NULL),(333,35,24,'attend',NULL),(334,35,25,'attend',NULL),(335,35,26,'attend',NULL),(336,35,27,'attend',NULL),(337,35,28,'attend',NULL),(338,35,29,'attend',NULL),(339,35,30,'attend',NULL),(340,36,19,'attend',NULL),(341,36,20,'attend',NULL),(342,36,21,'attend',NULL),(343,36,22,'attend',NULL),(344,36,23,'attend',NULL),(345,36,24,'attend',NULL),(346,36,25,'attend',NULL),(347,36,26,'attend',NULL),(348,36,27,'attend',NULL),(349,36,28,'attend',NULL),(350,36,29,'attend',NULL),(351,36,30,'attend',NULL),(352,37,19,'attend',NULL),(353,37,20,'attend',NULL),(354,37,21,'attend',NULL),(355,37,22,'attend',NULL),(356,37,23,'attend',NULL),(357,37,24,'attend',NULL),(358,37,25,'attend',NULL),(359,37,26,'attend',NULL),(360,37,27,'attend',NULL),(361,37,28,'attend',NULL),(362,37,29,'attend',NULL),(363,37,30,'attend',NULL),(364,38,19,'attend',NULL),(365,38,20,'attend',NULL),(366,38,21,'attend',NULL),(367,38,22,'attend',NULL),(368,38,23,'attend',NULL),(369,38,24,'attend',NULL),(370,38,25,'attend',NULL),(371,38,26,'attend',NULL),(372,38,27,'attend',NULL),(373,38,28,'attend',NULL),(374,38,29,'attend',NULL),(375,38,30,'attend',NULL);
/*!40000 ALTER TABLE `attendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `player_id2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (40,4,'score',19,NULL),(41,4,'score',20,NULL),(42,4,'score',23,NULL),(43,4,'assist',21,NULL),(44,4,'assist',24,NULL),(46,4,'score',19,NULL),(47,4,'assist',20,NULL),(48,4,'score_agai',NULL,NULL),(49,7,'score',31,NULL),(50,7,'assist',35,NULL),(51,7,'score_agai',-1,NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_pic_url` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL DEFAULT '',
  `age` int(11) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `foot` varchar(10) NOT NULL,
  `position` varchar(10) NOT NULL,
  `position_detail` varchar(10) NOT NULL,
  `backnumber` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `total_game` int(11) NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL DEFAULT '0',
  `assist` int(11) NOT NULL DEFAULT '0',
  `win_game` int(11) NOT NULL DEFAULT '0',
  `lose_game` int(11) NOT NULL DEFAULT '0',
  `draw_game` int(11) NOT NULL DEFAULT '0',
  `card_total` int(11) NOT NULL DEFAULT '0',
  `card_ATK` int(11) NOT NULL DEFAULT '0',
  `card_PAC` int(11) NOT NULL DEFAULT '0',
  `card_TEC` int(11) NOT NULL DEFAULT '0',
  `card_DEF` int(11) NOT NULL DEFAULT '0',
  `card_STA` int(11) NOT NULL DEFAULT '0',
  `card_PHY` int(11) NOT NULL DEFAULT '0',
  `score_against` int(11) NOT NULL DEFAULT '0',
  `token` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `(backnumber, team_id)` (`backnumber`,`team_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (19,'default.png','김자현_1','dshyun0226_1@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','ATK','LW',1,8,1,2,0,1,0,0,0,0,0,0,0,0,0,1,''),(20,'default.png','김자현_2','dshyun0226_2@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','ATK','CF',2,8,1,1,1,1,0,0,0,0,0,0,0,0,0,1,''),(21,'default.png','김자현_3','dshyun0226_3@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','ATK','RW',3,8,1,0,1,1,0,0,0,0,0,0,0,0,0,1,''),(22,'default.png','김자현_4','dshyun0226_4@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','MF','LM',4,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(23,'default.png','김자현_5','dshyun0226_5@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','MF','CM',5,8,1,1,0,1,0,0,0,0,0,0,0,0,0,1,''),(24,'default.png','김자현_6','dshyun0226_6@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','MF','RM',6,8,1,0,1,1,0,0,0,0,0,0,0,0,0,1,''),(25,'default.png','김자현_7','dshyun0226_7@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','DF','LB',7,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(26,'default.png','김자현_8','dshyun0226_8@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','DF','CB',8,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(27,'default.png','김자현_9','dshyun0226_9@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','DF','CB',9,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(28,'default.png','김자현_10','dshyun0226_10@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','DF','RB',10,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(29,'default.png','김자현_11','dshyun0226_11@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','GK','GK',11,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(30,'default.png','김자현_12','dshyun0226_12@gmail.com','dCKlaAfNxEAmtCqTfTNFGw==',23,180,73,'right','GK','GK',12,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(31,'default.png','영규_1','a@a.a_1','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','ATK','LW',1,9,1,1,0,1,0,0,0,0,0,0,0,0,0,1,''),(32,'default.png','영규_2','a@a.a_2','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','ATK','CF',2,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(33,'default.png','영규_3','a@a.a_3','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','ATK','RW',3,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(34,'default.png','영규_4','a@a.a_4','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','MF','LM',4,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(35,'default.png','영규_5','a@a.a_5','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','MF','CM',5,9,1,0,1,1,0,0,0,0,0,0,0,0,0,1,''),(36,'default.png','영규_6','a@a.a_6','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','MF','RM',6,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(37,'default.png','영규_7','a@a.a_7','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','DF','LB',7,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(38,'default.png','영규_8','a@a.a_8','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','DF','CB',8,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(39,'default.png','영규_9','a@a.a_9','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','DF','CB',9,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(40,'default.png','영규_10','a@a.a_10','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','DF','RB',10,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(41,'default.png','영규_11','a@a.a_11','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','GK','GK',11,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(42,'default.png','영규_12','a@a.a_12','dCKlaAfNxEAmtCqTfTNFGw==',24,180,65,'right','GK','GK',12,9,1,0,0,1,0,0,0,0,0,0,0,0,0,1,''),(43,'default.png','민주_1','b@b.b_1','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','ATK','LW',1,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(44,'default.png','민주_2','b@b.b_2','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','ATK','CF',2,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(45,'default.png','민주_3','b@b.b_3','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','ATK','RW',3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(46,'default.png','민주_4','b@b.b_4','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','MF','LM',4,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(47,'default.png','민주_5','b@b.b_5','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','MF','CM',5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(48,'default.png','민주_6','b@b.b_6','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','MF','RM',6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(49,'default.png','민주_7','b@b.b_7','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','DF','LB',7,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(50,'default.png','민주_8','b@b.b_8','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','DF','CB',8,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(51,'default.png','민주_9','b@b.b_9','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','DF','CB',9,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(52,'default.png','민주_10','b@b.b_10','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','DF','RB',10,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(53,'default.png','민주_11','b@b.b_11','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','GK','GK',11,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(54,'default.png','민주_12','b@b.b_12','dCKlaAfNxEAmtCqTfTNFGw==',23,170,50,'right','GK','GK',12,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(55,'default.png','민하_1','c@c.c_1','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','ATK','LW',1,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(56,'default.png','민하_2','c@c.c_2','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','ATK','CF',2,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(57,'default.png','민하_3','c@c.c_3','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','ATK','RW',3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(58,'default.png','민하_4','c@c.c_4','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','MF','LM',4,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(59,'default.png','민하_5','c@c.c_5','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','MF','CM',5,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(60,'default.png','민하_6','c@c.c_6','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','MF','RM',6,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(61,'default.png','민하_7','c@c.c_7','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','DF','LB',7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(62,'default.png','민하_8','c@c.c_8','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','DF','CB',8,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(63,'default.png','민하_9','c@c.c_9','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','DF','CB',9,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(64,'default.png','민하_10','c@c.c_10','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','DF','RB',10,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(65,'default.png','민하_11','c@c.c_11','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','GK','GK',11,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(66,'default.png','민하_12','c@c.c_12','dCKlaAfNxEAmtCqTfTNFGw==',23,160,45,'right','GK','GK',12,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(67,'default.png','미선_1','d@d.d_1','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','ATK','LW',1,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(68,'default.png','미선_2','d@d.d_2','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','ATK','CF',2,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(69,'default.png','미선_3','d@d.d_3','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','ATK','RW',3,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(70,'default.png','미선_4','d@d.d_4','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','MF','LM',4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(71,'default.png','미선_5','d@d.d_5','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','MF','CM',5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(72,'default.png','미선_6','d@d.d_6','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','MF','RM',6,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(73,'default.png','미선_7','d@d.d_7','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','DF','LB',7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(74,'default.png','미선_8','d@d.d_8','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','DF','CB',8,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(75,'default.png','미선_9','d@d.d_9','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','DF','CB',9,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(76,'default.png','미선_10','d@d.d_10','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','DF','RB',10,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(77,'default.png','미선_11','d@d.d_11','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','GK','GK',11,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(78,'default.png','미선_12','d@d.d_12','dCKlaAfNxEAmtCqTfTNFGw==',22,160,45,'right','GK','GK',12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_dt` datetime NOT NULL,
  `place` varchar(100) NOT NULL,
  `against_team` varchar(45) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `score_team` int(11) NOT NULL DEFAULT '-1',
  `score_against_team` int(11) NOT NULL DEFAULT '-1',
  `tactic` varchar(10) DEFAULT NULL,
  `attendee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (4,'2017-07-01 10:00:00','서울시 성북구 고려대학교 체육관','FC 공순이','이기면 치킨 지면 없음',8,4,1,'4-3-3',12),(5,'2017-07-02 10:00:00','서울시 성북구 고려대학교 화정체육관','FC 공돌이','이기면 치킨 지면 김밥',8,-1,-1,'',11),(6,'2017-07-03 10:00:00','서울시 성북구 고려대학교','FC 공공이','이기면 치킨 지면 피자',8,-1,-1,NULL,0),(7,'2017-07-01 10:00:00','영규의 홈1','FC 영규1','영규 화이팅1',9,2,1,'4-3-3',12),(8,'2017-07-02 10:00:00','영규의 홈2','FC 영규2','영규 화이팅2',9,-1,-1,NULL,11),(9,'2017-07-03 10:00:00','영규의 홈3','FC 영규3','영규 화이팅3',9,-1,-1,NULL,0),(10,'2017-07-01 10:00:00','민주의 홈1','FC 민주1','민주 화이팅1',10,-1,-1,NULL,12),(11,'2017-07-02 10:00:00','민주의 홈2','FC 민주2','민주 화이팅2',10,-1,-1,NULL,11),(12,'2017-07-03 10:00:00','민주의 홈3','FC 민주3','민주 화이팅3',10,-1,-1,NULL,0),(13,'2017-07-01 10:00:00','민하의 홈1','FC 민하1','민하 화이팅1',11,-1,-1,NULL,12),(14,'2017-07-02 10:00:00','민하의 홈2','FC 민하2','민하 화이팅2',11,-1,-1,NULL,11),(15,'2017-07-03 10:00:00','민하의 홈3','FC 민하3','민하 화이팅3',11,-1,-1,NULL,0),(16,'2017-07-01 10:00:00','미선의 홈1','FC 미선1','미선 화이팅1',12,-1,-1,NULL,12),(17,'2017-07-02 10:00:00','미선의 홈2','FC 미선2','미선 화이팅2',12,-1,-1,NULL,11),(18,'2017-07-03 10:00:00','미선의 홈3','FC 미선3','미선 화이팅3	',12,-1,-1,NULL,0),(19,'2017-06-03 10:00:00','영규의홈그라운드1','FC 영규4','영규 화이팅4	',9,-1,-1,NULL,12),(20,'2017-05-03 10:00:00','영규의홈그라운드2','FC 영규5','영규 화이팅5	',9,-1,-1,NULL,12),(21,'2017-04-03 10:00:00','영규의홈그라운드3','FC 영규6','영규 화이팅6	',9,-1,-1,NULL,12),(22,'2017-03-03 10:00:00','영규의홈그라운드4','FC 영규7','영규 화이팅7	',9,-1,-1,NULL,12),(23,'2017-06-03 10:00:00','민주의홈그라운드1','FC 민주4','민주 화이팅4',10,-1,-1,NULL,12),(24,'2017-05-03 10:00:00','민주의홈그라운드2','FC 민주5','민주 화이팅5',10,-1,-1,NULL,12),(25,'2017-04-03 10:00:00','민주의홈그라운드3','FC 민주6','민주 화이팅6',10,-1,-1,NULL,12),(26,'2017-03-03 10:00:00','민주의홈그라운드4','FC 민주7','민주 화이팅7',10,-1,-1,NULL,12),(27,'2017-06-03 10:00:00','민하의홈그라운드1','FC 민하4','민하 화이팅4',11,-1,-1,NULL,12),(28,'2017-05-03 10:00:00','민하의홈그라운드2','FC 민하5','민하 화이팅5',11,-1,-1,NULL,12),(29,'2017-04-03 10:00:00','민하의홈그라운드3','FC 민하6','민하 화이팅6',11,-1,-1,NULL,12),(30,'2017-03-03 10:00:00','민하의홈그라운드4','FC 민하7','민하 화이팅7',11,-1,-1,NULL,12),(31,'2017-06-03 10:00:00','미선의홈그라운드1','FC 미선4','미선 화이팅4',12,-1,-1,NULL,12),(32,'2017-05-03 10:00:00','미선의홈그라운드2','FC 미선5','미선 화이팅5',12,-1,-1,NULL,12),(33,'2017-04-03 10:00:00','미선의홈그라운드3','FC 미선6','미선 화이팅6',12,-1,-1,NULL,12),(34,'2017-03-03 10:00:00','미선의홈그라운드4','FC 미선7','미선 화이팅7',12,-1,-1,NULL,12),(35,'2017-06-03 10:00:00','기본의홈그라운드1','FC 기본4','기본추가4',8,-1,-1,NULL,12),(36,'2017-05-03 10:00:00','기본의홈그라운드2','FC 기본5','기본추가5',8,-1,-1,NULL,12),(37,'2017-04-03 10:00:00','기본의홈그라운드3','FC 기본6','기본추가6',8,-1,-1,NULL,12),(38,'2017-03-03 10:00:00','기본의홈그라운드4','FC 기본7','기본추가7',8,-1,-1,NULL,12);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_pic_url` varchar(100) NOT NULL,
  `teamname` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `manager` varchar(45) NOT NULL,
  `found_dt` datetime NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT '-1',
  `total_game` int(11) NOT NULL DEFAULT '0',
  `win_game` int(11) NOT NULL DEFAULT '0',
  `draw_game` int(11) NOT NULL DEFAULT '0',
  `lose_game` int(11) NOT NULL DEFAULT '0',
  `total_score` int(11) NOT NULL DEFAULT '0',
  `total_score_against` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `teamname` (`teamname`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (8,'FC CIC_profile.jpg','FC CIC','성남시','김자현','2017-07-01 00:00:00','고려대학교 정보대학 축구동아리',-1,1,1,0,0,4,1),(9,'영규팀_profile.jpg','영규팀','성남시','이영규','2017-07-06 00:00:00','영규의 테스트 팀',-1,0,0,0,0,0,0),(10,'민주팀_profile.jpg','민주팀','성남시','고민주','2017-07-06 00:00:00','민주의 테스트 팀',-1,0,0,0,0,0,0),(11,'민하팀_profile.jpg','민하팀','성남시','권민하','2017-07-06 00:00:00','민하의 테스트 팀',-1,0,0,0,0,0,0),(12,'미선팀_profile.jpg','미선팀','성남시','주미선','2017-07-06 00:00:00','미선의 테스트 팀',-1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-07 22:41:12
