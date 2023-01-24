-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: music_tinder
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum` (
  `forum_id` int NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(60) DEFAULT NULL,
  `forum_date` datetime DEFAULT NULL,
  `forum_img_ref` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`forum_id`),
  UNIQUE KEY `forum_name` (`forum_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,'m+General','2022-09-16 16:37:30',NULL),(2,'m+NewJeans','2022-09-16 16:42:14',NULL);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass_word` char(98) DEFAULT NULL,
  `profile_img_ref` varchar(60) DEFAULT NULL,
  `date_joined` datetime DEFAULT NULL,
  `friend_count` int DEFAULT NULL,
  `post_count` int DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'somebody','somebody@example.com','$argon2id$v=19$m=65536,t=10,p=1$ZqfXXv1yuOEvXaAjedNRNA$+q5JFafhAirn0MJPhIz0Pj5sH9Ozjw+qKv6Mqa0UoKY',NULL,'2022-09-17 22:51:24',0,0),(2,'andy','andy@gmail.com','$argon2id$v=19$m=65536,t=10,p=1$Pne+nnI1iw/t+iF/Lm5Ziw$Aaby/8moQPgvusC08r0BMztNalK7u1wKcF7VS5+5l1w',NULL,'2022-09-17 23:00:42',0,0),(3,'atr','atr@email.com','$argon2id$v=19$m=65536,t=10,p=1$0dCbzHjYJcwMQHnDlLJRxg$BVBnNCqA8CVBmtbUalUZ3KwnUrdt/GOTCZGcFZofqbI',NULL,'2023-01-24 09:16:46',0,0);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `post_title` varchar(200) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_last_edited` datetime DEFAULT NULL,
  `like_count` int DEFAULT NULL,
  `post_text` longtext,
  `person_id` int DEFAULT NULL,
  `forum_id` int DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `person_id` (`person_id`),
  KEY `forum_id` (`forum_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`forum_id`) REFERENCES `forum` (`forum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'test','2022-09-17 22:55:26','2022-09-17 22:55:26',NULL,'test',1,2),(2,'New Post','2022-09-17 22:59:49','2022-09-17 22:59:49',NULL,'Let\'s go',1,2),(3,'new user','2022-09-17 23:01:18','2022-09-17 23:01:18',NULL,'Hi guys!',2,2);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_media`
--

DROP TABLE IF EXISTS `post_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_media` (
  `post_media_id` int NOT NULL AUTO_INCREMENT,
  `media_type` varchar(10) DEFAULT NULL,
  `post_media_ref` varchar(60) DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  PRIMARY KEY (`post_media_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_media_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_media`
--

LOCK TABLES `post_media` WRITE;
/*!40000 ALTER TABLE `post_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_media` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-24  9:19:48
