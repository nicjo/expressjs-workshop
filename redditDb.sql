-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: redditDb
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,'http://www.google.dk','The Post Title','2016-02-15 20:43:41','2016-02-15 20:43:41',NULL),(2,'http://www.google.dk','The Post Title','2016-02-15 20:45:46','2016-02-15 20:45:46',NULL),(3,'http://www.google.ca','Another Post Title','2016-02-15 20:47:24','2016-02-15 20:47:24',NULL),(4,'http://www.google.com','Yet Another Post Title','2016-02-15 20:52:04','2016-02-15 20:52:04',8),(5,'http://www.google.com','Yet Another Post Title','2016-02-15 21:35:37','2016-02-15 21:35:37',1),(6,'http://imgur.com/XFvIMVe','I found a creepy face in my spade','2016-02-15 21:39:18','2016-02-15 21:39:18',1),(7,'http://imgur.com/LizHZOK','Someone threw a dumpster in a dumpster.','2016-02-15 21:40:31','2016-02-15 21:40:31',1),(8,'http://imgur.com/0ks634o','I ordered something from Lowe\'s and found that the box turns into a race car.','2016-02-15 21:41:02','2016-02-15 21:41:02',1),(9,'http://imgur.com/vEgebOP','This icicle is being supported by a spider\'s web','2016-02-15 21:41:40','2016-02-15 21:41:40',1),(10,'http://imgur.com/e9NyCTA','My box of Valentine\'s chocolates came with a tiny pink penis','2016-02-15 21:42:14','2016-02-15 21:42:14',1),(11,'http://i.imgur.com/woOJvTc.jpg','My local coffee house marks your initials for a drink with coffee so that the smell from a sharpie doesn\'t mess with the taste','2016-02-15 21:42:49','2016-02-15 21:42:49',1),(12,'http://i.imgur.com/w3sIoqC.jpg','This urinal is in a stall','2016-02-15 21:43:22','2016-02-15 21:43:22',1),(13,'http://imgur.com/PmGAbSI','These nearly identical cookie tins are from different brands','2016-02-15 21:44:03','2016-02-15 21:44:03',1),(14,'http://imgur.com/PMaCuEy','I found a Swedish Fish in my Sour Patch Kids.','2016-02-15 21:44:33','2016-02-15 21:44:33',1),(15,'http://imgur.com/PKlRVEl','There\'s a rope sticking out of this brick wall.','2016-02-15 21:45:13','2016-02-15 21:45:13',1),(16,'http://i.imgur.com/QO4UFYO.jpg','The computers at my vet are suspended with eyebolts and leashes so they don\'t get pee\'d on.','2016-02-15 21:46:03','2016-02-15 21:46:03',1);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'the@dude.net','Anonymous','dudeFarts','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,NULL,NULL,NULL,'2016-02-12 22:08:48','2016-02-12 22:08:48'),(3,NULL,NULL,NULL,'2016-02-12 22:09:30','2016-02-12 22:09:30'),(4,NULL,'usedude','supersecure','2016-02-12 22:10:41','2016-02-12 22:10:41'),(5,NULL,'usedude','supersecure','2016-02-12 22:11:12','2016-02-12 22:11:12'),(6,NULL,'usedude','supersecure','2016-02-12 22:11:33','2016-02-12 22:11:33'),(7,NULL,'theDude','theDudePassword','2016-02-15 20:36:30','2016-02-15 20:36:30'),(8,'dude@thedude.net','theDude','theDudePassword','2016-02-15 20:39:33','2016-02-15 20:39:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `upVote` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `contentId` int(11) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`contentId`) REFERENCES `contents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-15 22:00:08
