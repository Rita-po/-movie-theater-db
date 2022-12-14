-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `full_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'46-9066298','Eran Carnall','ecarnall0@w3.org','$2y$10$CV8yDaZJRDgd7sgOyTv9L'),(2,'33-7335905','Mersey Wisson','mwisson1@wix.com','$2y$10$RY3iy2qMyGTa/9lAypjP'),(3,'84-1821488','Michele Melendez','mmelendez2@a8.net','$2y$10$AGTdidcsk6tLK0CB/');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `full_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'62-2396331','Ariadne Brennand','abrennand0@paypal.com','AYIr9wO2DwC'),(2,'93-0512642','Ignacius Brecher','ibrecher1@ihg.com','0dmV4L'),(3,'17-4229666','Gannie Andrzejowski','gandrzejowski2@google.ru','BEQDTwIp84Iy'),(4,'29-9573618','Korella Dovey','kdovey3@nhs.uk','3SkHoYw'),(5,'13-9579187','Orran Butterfield','obutterfield4@nytimes.com','GokeeuKeKGz'),(6,'73-8508281','Luce Sivill','lsivill5@dropbox.com','qfvTP6dTD1'),(7,'25-6210650','Beauregard Rockwell','brockwell6@ning.com','u4nQM7C'),(8,'54-9303632','Dewey Stobbart','dstobbart7@tmall.com','e9MYgm3tL6'),(9,'99-0281406','Florry Westrope','fwestrope8@wp.com','4jpnrDW2rtJ'),(10,'65-3644963','Tyrone Hardaker','thardaker9@tripod.com','iaKDLmcVPlZ');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_rooms`
--

DROP TABLE IF EXISTS `movie_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_number` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `theater_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theater_id` (`theater_id`),
  CONSTRAINT `movie_rooms_ibfk_1` FOREIGN KEY (`theater_id`) REFERENCES `movie_theater` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_rooms`
--

LOCK TABLES `movie_rooms` WRITE;
/*!40000 ALTER TABLE `movie_rooms` DISABLE KEYS */;
INSERT INTO `movie_rooms` VALUES (1,5,300,3),(2,4,200,3),(3,3,250,3),(4,2,150,3),(5,1,200,3),(6,5,200,1),(7,4,250,1),(8,3,300,1),(9,2,150,1),(10,1,200,1),(11,5,200,2),(12,4,250,2),(13,3,250,2),(14,2,300,2),(15,1,150,2);
/*!40000 ALTER TABLE `movie_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_theater`
--

DROP TABLE IF EXISTS `movie_theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_theater` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `adress` varchar(50) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `movie_theater_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_theater`
--

LOCK TABLES `movie_theater` WRITE;
/*!40000 ALTER TABLE `movie_theater` DISABLE KEYS */;
INSERT INTO `movie_theater` VALUES (1,'Cin├®ma Les Halles','7 place de la Rotonde',75001,'Paris',826880700,3),(2,'Cin├®ma Cit├® Bordeaux','13-15 Rue Georges Bonnac',33000,'Bordeaux',826880800,2),(3,'Cin├®ma Cit├® Lille','40 Rue de B├®thune',59800,'Lille',826880900,1);
/*!40000 ALTER TABLE `movie_theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `time_unit` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Dragon Ball Z: Super Android 13!',82,'min'),(2,'E.T',105,'min'),(3,'Come to the Stable',94,'min'),(4,'Round Midnight',133,'min'),(5,'Magnitude 10.5',165,'min');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projection`
--

DROP TABLE IF EXISTS `projection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projection_time` datetime DEFAULT NULL,
  `movie_room_id` int NOT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_room_id` (`movie_room_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `projection_ibfk_1` FOREIGN KEY (`movie_room_id`) REFERENCES `movie_rooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projection_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projection`
--

LOCK TABLES `projection` WRITE;
/*!40000 ALTER TABLE `projection` DISABLE KEYS */;
INSERT INTO `projection` VALUES (1,'2022-07-27 10:30:00',1,5),(2,'2022-07-27 10:30:00',2,5),(3,'2022-07-27 09:40:00',3,1),(4,'2022-07-27 11:30:00',4,2),(5,'2022-07-27 12:30:00',5,3),(6,'2022-07-27 10:30:00',1,1),(7,'2022-07-27 14:00:00',2,4),(8,'2022-07-27 20:30:00',3,1),(9,'2022-07-27 20:30:00',4,1),(10,'2022-07-27 16:00:00',5,4),(11,'2022-07-27 10:30:00',1,1),(12,'2022-07-27 10:30:00',2,2),(13,'2022-07-27 17:00:00',3,3),(14,'2022-07-27 10:30:00',4,4),(15,'2022-07-27 17:00:00',5,5);
/*!40000 ALTER TABLE `projection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reservation_date` datetime DEFAULT NULL,
  `online_checkout` varchar(50) NOT NULL,
  `client_id` int DEFAULT NULL,
  `projection_id` int DEFAULT NULL,
  `tarif_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `projection_id` (`projection_id`),
  KEY `tarif_id` (`tarif_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`projection_id`) REFERENCES `projection` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`tarif_id`) REFERENCES `tarifs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'2022-07-25 12:00:00','Paiement en ligne',1,1,1),(2,'2022-07-24 11:00:00','Paiement sur place',2,2,2),(3,'2022-07-26 18:00:00','Paiement sur place',3,3,2),(4,'2022-07-25 13:00:00','Paiement en ligne',4,4,1),(5,'2022-07-25 21:00:00','Paiement sur place',5,5,1),(6,'2022-07-26 17:00:00','Paiement en ligne',6,1,1),(7,'2022-07-25 16:00:00','Paiement en ligne',7,7,3),(8,'2022-07-25 17:00:00','Paiement sur place',8,6,3),(9,'2022-07-24 15:00:00','Paiement sur place',9,14,2),(10,'2022-07-25 14:00:00','Paiement sur place',10,12,1);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `currency` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifs`
--

LOCK TABLES `tarifs` WRITE;
/*!40000 ALTER TABLE `tarifs` DISABLE KEYS */;
INSERT INTO `tarifs` VALUES (1,'Plein tarif',9,'Ôé¼'),(2,'Etudiant',8,'Ôé¼'),(3,'Moins de 14 ans',6,'Ôé¼');
/*!40000 ALTER TABLE `tarifs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-08 12:35:44
