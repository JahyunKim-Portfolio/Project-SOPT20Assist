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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendee`
--

LOCK TABLES `attendee` WRITE;
/*!40000 ALTER TABLE `attendee` DISABLE KEYS */;
INSERT INTO `attendee` VALUES (16,4,19,'attend','ATK'),(17,4,20,'attend','ATK'),(18,4,21,'attend','MF'),(19,4,22,'attend','ATK'),(20,4,23,'attend','MF'),(21,4,24,'attend','MF'),(22,4,25,'attend','DF'),(23,4,26,'attend','DF'),(24,4,27,'attend','DF'),(25,4,28,'attend','DF'),(26,4,29,'attend','SUB'),(27,4,30,'attend','GK'),(28,5,19,'attend',NULL),(29,5,20,'attend',NULL),(30,5,21,'attend',NULL),(31,5,22,'attend',NULL),(32,5,23,'attend',NULL),(33,5,24,'attend',NULL),(34,5,25,'attend',NULL),(35,5,26,'attend',NULL),(36,5,27,'attend',NULL),(37,5,28,'attend',NULL),(38,5,29,'attend',NULL),(39,5,30,'noattend',NULL),(40,7,31,'attend',NULL),(41,7,32,'attend',NULL),(42,7,33,'attend',NULL),(43,7,34,'attend',NULL),(44,7,35,'attend',NULL),(45,7,36,'attend',NULL),(46,7,37,'attend',NULL),(47,7,38,'attend',NULL),(48,7,39,'attend',NULL),(49,7,40,'attend',NULL),(50,7,41,'attend',NULL),(51,7,42,'attend',NULL),(52,8,31,'attend',NULL),(53,8,32,'attend',NULL),(54,8,33,'attend',NULL),(55,8,34,'attend',NULL),(56,8,35,'attend',NULL),(57,8,36,'attend',NULL),(58,8,37,'attend',NULL),(59,8,38,'attend',NULL),(60,8,39,'attend',NULL),(61,8,40,'attend',NULL),(62,8,41,'attend',NULL),(63,8,42,'noattend',NULL),(64,10,43,'attend',NULL),(65,10,44,'attend',NULL),(66,10,45,'attend',NULL),(67,10,46,'attend',NULL),(68,10,47,'attend',NULL),(69,10,48,'attend',NULL),(70,10,49,'attend',NULL),(71,10,50,'attend',NULL),(72,10,51,'attend',NULL),(73,10,52,'attend',NULL),(74,10,53,'attend',NULL),(75,10,54,'attend',NULL),(76,11,43,'attend',NULL),(77,11,44,'attend',NULL),(78,11,45,'attend',NULL),(79,11,46,'attend',NULL),(80,11,47,'attend',NULL),(81,11,48,'attend',NULL),(82,11,49,'attend',NULL),(83,11,50,'attend',NULL),(84,11,51,'attend',NULL),(85,11,52,'attend',NULL),(86,11,53,'attend',NULL),(87,11,54,'noattend',NULL),(88,13,55,'attend',NULL),(89,13,56,'attend',NULL),(90,13,57,'attend',NULL),(91,13,58,'attend',NULL),(92,13,59,'attend',NULL),(93,13,60,'attend',NULL),(94,13,61,'attend',NULL),(95,13,62,'attend',NULL),(96,13,63,'attend',NULL),(97,13,64,'attend',NULL),(98,13,65,'attend',NULL),(99,13,66,'attend',NULL),(100,14,55,'attend',NULL),(101,14,56,'attend',NULL),(102,14,57,'attend',NULL),(103,14,58,'attend',NULL),(104,14,59,'attend',NULL),(105,14,60,'attend',NULL),(106,14,61,'attend',NULL),(107,14,62,'attend',NULL),(108,14,63,'attend',NULL),(109,14,64,'attend',NULL),(110,14,65,'attend',NULL),(111,14,66,'noattend',NULL),(112,16,67,'attend',NULL),(113,16,68,'attend',NULL),(114,16,69,'attend',NULL),(115,16,70,'attend',NULL),(116,16,71,'attend',NULL),(117,16,72,'attend',NULL),(118,16,73,'attend',NULL),(119,16,74,'attend',NULL),(120,16,75,'attend',NULL),(121,16,76,'attend',NULL),(122,16,77,'attend',NULL),(123,16,78,'attend',NULL),(124,17,67,'attend',NULL),(125,17,68,'attend',NULL),(126,17,69,'attend',NULL),(127,17,70,'attend',NULL),(128,17,71,'attend',NULL),(129,17,72,'attend',NULL),(130,17,73,'attend',NULL),(131,17,74,'attend',NULL),(132,17,75,'attend',NULL),(133,17,76,'attend',NULL),(134,17,77,'attend',NULL),(135,17,78,'noattend',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (40,4,'score',19,NULL),(41,4,'score',20,NULL),(42,4,'score',23,NULL),(43,4,'assist',21,NULL),(44,4,'assist',24,NULL),(46,4,'score',19,NULL),(47,4,'assist',20,NULL),(48,4,'score_agai',NULL,NULL);
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
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
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
  `token` varchar(100) DEFAULT NULL,
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
INSERT INTO `player` VALUES (19,'default.png','김자현_1','dshyun0226_1@gmail.com','1234',23,180,73,'right','ATK','LW',1,8,1,2,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(20,'default.png','김자현_2','dshyun0226_2@gmail.com','1234',23,180,73,'right','ATK','CF',2,8,1,1,1,1,0,0,0,0,0,0,0,0,0,1,NULL),(21,'default.png','김자현_3','dshyun0226_3@gmail.com','1234',23,180,73,'right','ATK','RW',3,8,1,0,1,1,0,0,0,0,0,0,0,0,0,1,NULL),(22,'default.png','김자현_4','dshyun0226_4@gmail.com','1234',23,180,73,'right','MF','LM',4,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(23,'default.png','김자현_5','dshyun0226_5@gmail.com','1234',23,180,73,'right','MF','CM',5,8,1,1,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(24,'default.png','김자현_6','dshyun0226_6@gmail.com','1234',23,180,73,'right','MF','RM',6,8,1,0,1,1,0,0,0,0,0,0,0,0,0,1,NULL),(25,'default.png','김자현_7','dshyun0226_7@gmail.com','1234',23,180,73,'right','DF','LB',7,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(26,'default.png','김자현_8','dshyun0226_8@gmail.com','1234',23,180,73,'right','DF','CB',8,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(27,'default.png','김자현_9','dshyun0226_9@gmail.com','1234',23,180,73,'right','DF','CB',9,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(28,'default.png','김자현_10','dshyun0226_10@gmail.com','1234',23,180,73,'right','DF','RB',10,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(29,'default.png','김자현_11','dshyun0226_11@gmail.com','1234',23,180,73,'right','GK','GK',11,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(30,'default.png','김자현_12','dshyun0226_12@gmail.com','1234',23,180,73,'right','GK','GK',12,8,1,0,0,1,0,0,0,0,0,0,0,0,0,1,NULL),(31,'default.png','영규_1','a@a.a_1','a',24,180,65,'right','ATK','LW',1,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(32,'default.png','영규_2','a@a.a_2','a',24,180,65,'right','ATK','CF',2,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(33,'default.png','영규_3','a@a.a_3','a',24,180,65,'right','ATK','RW',3,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(34,'default.png','영규_4','a@a.a_4','a',24,180,65,'right','MF','LM',4,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(35,'default.png','영규_5','a@a.a_5','a',24,180,65,'right','MF','CM',5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(36,'default.png','영규_6','a@a.a_6','a',24,180,65,'right','MF','RM',6,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(37,'default.png','영규_7','a@a.a_7','a',24,180,65,'right','DF','LB',7,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(38,'default.png','영규_8','a@a.a_8','a',24,180,65,'right','DF','CB',8,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(39,'default.png','영규_9','a@a.a_9','a',24,180,65,'right','DF','CB',9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(40,'default.png','영규_10','a@a.a_10','a',24,180,65,'right','DF','RB',10,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(41,'default.png','영규_11','a@a.a_11','a',24,180,65,'right','GK','GK',11,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(42,'default.png','영규_12','a@a.a_12','a',24,180,65,'right','GK','GK',12,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(43,'default.png','민주_1','b@b.b_1','b',23,170,50,'right','ATK','LW',1,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(44,'default.png','민주_2','b@b.b_2','b',23,170,50,'right','ATK','CF',2,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(45,'default.png','민주_3','b@b.b_3','b',23,170,50,'right','ATK','RW',3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(46,'default.png','민주_4','b@b.b_4','b',23,170,50,'right','MF','LM',4,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(47,'default.png','민주_5','b@b.b_5','b',23,170,50,'right','MF','CM',5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(48,'default.png','민주_6','b@b.b_6','b',23,170,50,'right','MF','RM',6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(49,'default.png','민주_7','b@b.b_7','b',23,170,50,'right','DF','LB',7,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(50,'default.png','민주_8','b@b.b_8','b',23,170,50,'right','DF','CB',8,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(51,'default.png','민주_9','b@b.b_9','b',23,170,50,'right','DF','CB',9,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(52,'default.png','민주_10','b@b.b_10','b',23,170,50,'right','DF','RB',10,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(53,'default.png','민주_11','b@b.b_11','b',23,170,50,'right','GK','GK',11,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(54,'default.png','민주_12','b@b.b_12','b',23,170,50,'right','GK','GK',12,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(55,'default.png','민하_1','c@c.c_1','c',23,160,45,'right','ATK','LW',1,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(56,'default.png','민하_2','c@c.c_2','c',23,160,45,'right','ATK','CF',2,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(57,'default.png','민하_3','c@c.c_3','c',23,160,45,'right','ATK','RW',3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(58,'default.png','민하_4','c@c.c_4','c',23,160,45,'right','MF','LM',4,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(59,'default.png','민하_5','c@c.c_5','c',23,160,45,'right','MF','CM',5,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(60,'default.png','민하_6','c@c.c_6','c',23,160,45,'right','MF','RM',6,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(61,'default.png','민하_7','c@c.c_7','c',23,160,45,'right','DF','LB',7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(62,'default.png','민하_8','c@c.c_8','c',23,160,45,'right','DF','CB',8,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(63,'default.png','민하_9','c@c.c_9','c',23,160,45,'right','DF','CB',9,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(64,'default.png','민하_10','c@c.c_10','c',23,160,45,'right','DF','RB',10,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(65,'default.png','민하_11','c@c.c_11','c',23,160,45,'right','GK','GK',11,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(66,'default.png','민하_12','c@c.c_12','c',23,160,45,'right','GK','GK',12,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(67,'default.png','미선_1','d@d.d_1','d',22,160,45,'right','ATK','LW',1,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(68,'default.png','미선_2','d@d.d_2','d',22,160,45,'right','ATK','CF',2,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(69,'default.png','미선_3','d@d.d_3','d',22,160,45,'right','ATK','RW',3,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(70,'default.png','미선_4','d@d.d_4','d',22,160,45,'right','MF','LM',4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(71,'default.png','미선_5','d@d.d_5','d',22,160,45,'right','MF','CM',5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(72,'default.png','미선_6','d@d.d_6','d',22,160,45,'right','MF','RM',6,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(73,'default.png','미선_7','d@d.d_7','d',22,160,45,'right','DF','LB',7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(74,'default.png','미선_8','d@d.d_8','d',22,160,45,'right','DF','CB',8,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(75,'default.png','미선_9','d@d.d_9','d',22,160,45,'right','DF','CB',9,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(76,'default.png','미선_10','d@d.d_10','d',22,160,45,'right','DF','RB',10,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(77,'default.png','미선_11','d@d.d_11','d',22,160,45,'right','GK','GK',11,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(78,'default.png','미선_12','d@d.d_12','d',22,160,45,'right','GK','GK',12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (4,'2017-07-01 10:00:00','서울시 성북구 고려대학교 체육관','FC 공순이','이기면 치킨 지면 없음',8,4,1,'4-3-3',12),(5,'2017-07-02 10:00:00','서울시 성북구 고려대학교 화정체육관','FC 공돌이','이기면 치킨 지면 김밥',8,-1,-1,'',11),(6,'2017-07-03 10:00:00','서울시 성북구 고려대학교','FC 공공이','이기면 치킨 지면 피자',8,-1,-1,NULL,0),(7,'2017-07-01 10:00:00','영규의 홈1','FC 영규1','영규 화이팅1',9,-1,-1,NULL,12),(8,'2017-07-02 10:00:00','영규의 홈2','FC 영규2','영규 화이팅2',9,-1,-1,NULL,11),(9,'2017-07-03 10:00:00','영규의 홈3','FC 영규3','영규 화이팅3',9,-1,-1,NULL,0),(10,'2017-07-01 10:00:00','민주의 홈1','FC 민주1','민주 화이팅1',10,-1,-1,NULL,12),(11,'2017-07-02 10:00:00','민주의 홈2','FC 민주2','민주 화이팅2',10,-1,-1,NULL,11),(12,'2017-07-03 10:00:00','민주의 홈3','FC 민주3','민주 화이팅3',10,-1,-1,NULL,0),(13,'2017-07-01 10:00:00','민하의 홈1','FC 민하1','민하 화이팅1',11,-1,-1,NULL,12),(14,'2017-07-02 10:00:00','민하의 홈2','FC 민하2','민하 화이팅2',11,-1,-1,NULL,11),(15,'2017-07-03 10:00:00','민하의 홈3','FC 민하3','민하 화이팅3',11,-1,-1,NULL,0),(16,'2017-07-01 10:00:00','미선의 홈1','FC 미선1','미선 화이팅1',12,-1,-1,NULL,12),(17,'2017-07-02 10:00:00','미선의 홈2','FC 미선2','미선 화이팅2',12,-1,-1,NULL,11),(18,'2017-07-03 10:00:00','미선의 홈3','FC 미선3','미선 화이팅3	',12,-1,-1,NULL,0);
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

-- Dump completed on 2017-07-07 15:26:26
