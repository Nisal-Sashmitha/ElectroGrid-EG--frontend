-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: electronicgriddb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `interruption`
--

DROP TABLE IF EXISTS `interruption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interruption` (
  `interruptionID` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `startTIme` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `areaID` char(5) DEFAULT NULL,
  PRIMARY KEY (`interruptionID`),
  KEY `interruptoin_areaID_fk` (`areaID`),
  CONSTRAINT `interruptoin_areaID_fk` FOREIGN KEY (`areaID`) REFERENCES `area` (`areaID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interruption`
--

LOCK TABLES `interruption` WRITE;
/*!40000 ALTER TABLE `interruption` DISABLE KEYS */;
INSERT INTO `interruption` VALUES (2,'2022-04-15','18:00:00','19:00:00','10001'),(3,'2022-04-16','18:00:00','19:00:00','10001'),(4,'2022-04-16','08:00:00','09:00:00','10001'),(5,'2022-04-17','18:00:00','19:00:00','10001'),(6,'2022-04-17','08:30:00','10:30:00','10002'),(10,'2022-04-22','08:50:00','10:30:43','10001'),(11,'2022-04-23','08:50:00','10:30:00','10002'),(13,'2022-04-24','10:50:00','13:30:00','10001'),(14,'2022-04-24','10:50:00','13:30:00','10002'),(15,'2022-04-25','10:50:00','13:30:00','10002'),(16,'2022-04-25','18:50:00','20:30:00','10002'),(18,'2022-04-26','18:50:00','20:30:00','10002'),(19,'2022-04-26','11:50:00','13:30:00','10002'),(20,'2022-04-27','11:50:00','13:30:00','10001'),(21,'2022-05-05','11:50:00','13:30:00','10001'),(22,'2022-05-05','08:50:00','10:30:00','10002'),(23,'2022-05-05','14:50:00','16:30:00','10002'),(31,'2022-05-13','04:23:00','04:23:00','10002'),(34,'2022-05-14','04:23:00','08:25:00','10002'),(36,'2022-05-13','08:20:00','09:30:00','10001'),(37,'2022-05-13','21:24:00','23:25:00','10002');
/*!40000 ALTER TABLE `interruption` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 21:06:43
