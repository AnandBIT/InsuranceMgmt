-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: insurancedb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `fnol`
--

DROP TABLE IF EXISTS `fnol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fnol` (
  `fnolId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `policyNumber` varchar(45) NOT NULL,
  `description` varchar(450) NOT NULL,
  `vehicleNumber` varchar(45) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`fnolId`),
  UNIQUE KEY `fnlId_UNIQUE` (`fnolId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnol`
--

LOCK TABLES `fnol` WRITE;
/*!40000 ALTER TABLE `fnol` DISABLE KEYS */;
INSERT INTO `fnol` VALUES (4,'user@gmail.com','123456','Car Accident','1234567890',3),(5,'user@gmail.com','9999','Car mirror broken','JH10BC6789',3),(6,'user@gmail.com','9999','Car mirror broken','JH10BC6789',2),(7,'user@gmail.com','123456','Window crashed','JH10FG3356',3),(8,'user@gmail.com','12345678','Car puncture','WB98HJ5567',1),(9,'user@gmail.com','889976','Window Crashed','JK12HJ3367',1),(10,'user@gmail.com','778895','Bump Crash','DL78GH2267',1);
/*!40000 ALTER TABLE `fnol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 13:30:51
