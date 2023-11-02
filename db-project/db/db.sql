CREATE DATABASE  IF NOT EXISTS `testdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testdb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Temporary view structure for view `assistant_hours`
--

DROP TABLE IF EXISTS `assistant_hours`;
/*!50001 DROP VIEW IF EXISTS `assistant_hours`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `assistant_hours` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `num_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `assistant_roster`
--

DROP TABLE IF EXISTS `assistant_roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assistant_roster` (
  `user_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `num_visits` int DEFAULT NULL,
  `num_hours` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`start_date`),
  CONSTRAINT `assistnt_assistant_roster` FOREIGN KEY (`user_id`) REFERENCES `driver_assistant` (`profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistant_roster`
--

LOCK TABLES `assistant_roster` WRITE;
/*!40000 ALTER TABLE `assistant_roster` DISABLE KEYS */;
INSERT INTO `assistant_roster` VALUES (21,'2023-10-16','2023-10-22',0,40.00),(21,'2023-10-23','2023-10-30',1,20.00),(22,'2023-10-23','2023-10-30',0,25.00),(23,'2023-10-16','2023-10-30',1,35.00),(25,'2023-10-16','2023-10-27',0,39.00),(25,'2023-10-23','2023-10-30',0,30.00);
/*!40000 ALTER TABLE `assistant_roster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_warehouse`
--

DROP TABLE IF EXISTS `city_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_warehouse` (
  `city_name` varchar(50) NOT NULL,
  `manager` int DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_warehouse`
--

LOCK TABLES `city_warehouse` WRITE;
/*!40000 ALTER TABLE `city_warehouse` DISABLE KEYS */;
INSERT INTO `city_warehouse` VALUES (' Negombo',68,'no 5, Negambo'),('Anuradhapura',7,'No 345,Anuradhapura'),('Badulla',12,'No 43,Badulla'),('Colombo',67,'No 2, Colombo 7'),('Galle',65,'no 90,Galle'),('Gampaha',2,'No 132,Gampaha'),('Jaffna',69,'No 10, Jaffna'),('Kandy',15,'No 432/4, Colombo street, Kandy'),('Kurunagala',5,'No 41,Kandy road,Kurunagala'),('Matara',66,'No3,Matara Main Road,Matara'),('Ragama',6,'No 17/B,Hospital road, Ragama'),('Veyangoda',4,'No 23,Airport road,Veyangoda');
/*!40000 ALTER TABLE `city_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `user_ID` int NOT NULL,
  `customer_type` varchar(45) DEFAULT NULL,
  `workplace_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  CONSTRAINT `user_ID` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'wholseller','nandana, kahawandala, udamulla, mawanella'),(27,'end customer',NULL),(28,'wholesaler',NULL),(29,'retailer',NULL),(30,'wholesaler',NULL),(31,'end customer',NULL),(32,'end customer',NULL),(33,'wholesaler',NULL),(34,'retailer',NULL),(35,'end customer',NULL),(36,'end customer',NULL),(37,'end customer',NULL),(38,'wholesaler',NULL),(39,'end customer',NULL),(40,'end customer',NULL),(41,'end customer',NULL),(42,'end customer',NULL),(43,'end customer',NULL),(44,'end customer',NULL),(45,'wholesaler',NULL),(46,'end customer',NULL),(47,'end customer',NULL),(48,'end customer',NULL),(49,'end customer',NULL),(50,'end customer',NULL),(51,'end customer',NULL),(52,'end customer',NULL),(53,'end customer',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `user_id` int NOT NULL,
  `warehouse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `warehouse_idx` (`warehouse`),
  CONSTRAINT `user_driver` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`),
  CONSTRAINT `warehouse` FOREIGN KEY (`warehouse`) REFERENCES `city_warehouse` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (54,'Colombo'),(55,'Colombo'),(56,'Colombo'),(57,'Galle'),(58,'Galle'),(59,'Jaffna'),(60,'Jaffna');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_assistant`
--

DROP TABLE IF EXISTS `driver_assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_assistant` (
  `profile` int NOT NULL,
  `warehouse` varchar(50) NOT NULL,
  PRIMARY KEY (`profile`,`warehouse`),
  KEY `driver_assistant_warehouse_idx` (`warehouse`),
  CONSTRAINT `driver_assistant_profile` FOREIGN KEY (`profile`) REFERENCES `user` (`ID`),
  CONSTRAINT `driver_assistant_warehouse` FOREIGN KEY (`warehouse`) REFERENCES `city_warehouse` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_assistant`
--

LOCK TABLES `driver_assistant` WRITE;
/*!40000 ALTER TABLE `driver_assistant` DISABLE KEYS */;
INSERT INTO `driver_assistant` VALUES (24,'Anuradhapura'),(21,'Colombo'),(22,'Colombo'),(23,'Galle'),(25,'Galle');
/*!40000 ALTER TABLE `driver_assistant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `driver_hours`
--

DROP TABLE IF EXISTS `driver_hours`;
/*!50001 DROP VIEW IF EXISTS `driver_hours`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `driver_hours` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `num_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `driver_roster`
--

DROP TABLE IF EXISTS `driver_roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_roster` (
  `user_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `previous_visit` tinyint DEFAULT NULL,
  `num_hours` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`start_date`),
  CONSTRAINT `driver_roster_driver` FOREIGN KEY (`user_id`) REFERENCES `driver` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_roster`
--

LOCK TABLES `driver_roster` WRITE;
/*!40000 ALTER TABLE `driver_roster` DISABLE KEYS */;
INSERT INTO `driver_roster` VALUES (54,'2023-10-23','2023-11-20',1,2.00),(55,'2023-10-23','2023-11-20',0,12.00),(56,'2023-10-23','2023-11-20',0,10.00),(60,'2023-10-16','2023-10-22',0,30.00),(60,'2023-10-23','2023-10-30',1,25.00);
/*!40000 ALTER TABLE `driver_roster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `profile` int NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`profile`),
  CONSTRAINT `employee` FOREIGN KEY (`profile`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `profile` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`profile`),
  CONSTRAINT `manager-profile` FOREIGN KEY (`profile`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (14,'train manager'),(63,'admin_manager'),(64,'train_manager'),(65,'warehouse_manager'),(66,'warehouse_manager'),(67,'warehouse_manager'),(68,'warehouse_manager'),(69,'warehouse_manager');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_table` (
  `path_id` int NOT NULL,
  `warehouse` varchar(50) DEFAULT NULL,
  `destinations` varchar(400) DEFAULT NULL,
  `time` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`path_id`),
  KEY `path_to_city_warehouse_idx` (`warehouse`),
  CONSTRAINT `path_to_city_warehouse` FOREIGN KEY (`warehouse`) REFERENCES `city_warehouse` (`city_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_destinations`
--

DROP TABLE IF EXISTS `order_destinations`;
/*!50001 DROP VIEW IF EXISTS `order_destinations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_destinations` AS SELECT 
 1 AS `warehouse`,
 1 AS `path`,
 1 AS `destinations`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `customer` int NOT NULL,
  `product_id` int NOT NULL,
  `date_ordered` date DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `state` varchar(60) DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `delivery_address` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `customer_idx` (`customer`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `customer` FOREIGN KEY (`customer`) REFERENCES `customer` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2023-09-24','1',300,'train',2500.60,'No 3,Elliot road,Colombo'),(6,1,1,'2023-10-10','1',350,'ordered',2400.00,'No 3,Elliot road,Colombo'),(7,1,1,'2023-10-11','1',560,'ordered',2500.00,'No 3,Elliot road,Colombo'),(8,27,10,'2020-12-16','31',30,'finished',6000.00,'No 3,Elliot road,Colombo'),(9,27,11,'2020-12-17','43',150,'finished',8000.00,'No 10,Main Street,Galle'),(10,52,10,'2020-12-17','41',20,'finished',56000.00,'No 20,Light Hoouse road,Matara'),(11,34,12,'2020-12-17','42',300,'finished',45000.00,'No 1,Main road, Hambanthota'),(12,33,10,'2020-12-17','35',30,'finished',60000.00,'No 10,Elliot road,Galle'),(13,33,11,'2020-12-18','31',75,'finished',30000.00,'No 4,Colombo 7'),(14,29,11,'2020-12-18','43',50,'finished',90000.00,'No 10,Main Road, Gampaha'),(15,30,14,'2020-12-18','34',30,'finished',78000.00,'No 11, 3rd step, Anuradapura'),(16,29,8,'2020-12-18','34',10,'finished',35000.00,'No 10,Temple road, Polonnaruwa'),(17,30,7,'2020-12-18','33',10,'finished',20000.00,'No 10,Elliot road, Jaffna'),(18,31,12,'2020-12-18','37',10,'finished',12000.00,'No 1,Sea road, Negambo'),(19,35,9,'2020-12-18','38',150,'finished',55000.00,'No 1,Elliot road,Galle'),(20,36,9,'2021-02-20','39',25,'finished',65000.00,'No 3,Elliot road,Galle'),(21,34,8,'2021-02-20','38',150,'finished',44000.00,'No 10,Main road,Galle'),(22,50,6,'2021-02-20','31',900,'finished',90000.00,'No 10,Main Road, Gampaha'),(23,50,6,'2021-02-20','43',200,'finished',15000.00,'No 4,Colombo 7'),(24,48,1,'2021-02-20','42',28,'finished',88000.00,'No 20,Light Hoouse road,Matara'),(25,47,2,'2021-02-20','34',105,'finished',64000.00,'No 11, 3rd step, Anuradapura'),(26,49,1,'2021-02-20','42',200,'finished',23000.00,'No 1,Main road, Hambanthota'),(27,50,10,'2021-02-20','37',150,'finished',55000.00,'No 10,Elliot road,Galle'),(28,42,3,'2021-02-20','34',5,'truck',24500.00,'No 10,Temple road, Polonnaruwa'),(29,42,3,'2021-02-20','33',35,'truck',63000.00,'No 10,Elliot road, Jaffna'),(30,41,11,'2021-02-20','31',75,'truck',62000.00,'No 1,Sea road, Negambo'),(31,39,10,'2021-02-20','39',100,'truck',54000.00,'No10,Elliot road,Galle'),(32,38,4,'2021-02-20','38',15,'train',23000.00,'No 1,Fort road, Negambo'),(33,38,2,'2021-02-20','31',80,'train',56000.50,'No 15,Main road, Gampaha'),(34,37,3,'2021-02-20','33',11,'train',49000.00,'No 12,Kovil road, Jaffna'),(35,35,1,'2021-02-20','34',36,'train',24000.00,'No 6,Main road, Trinco'),(36,34,13,'2021-02-20','34',30,'unsent',44000.00,'No 1, 2ndd step, Anuradapura'),(37,50,13,'2021-02-20','33',26,'unsent',24500.00,'No 3,Main road, Trinco'),(38,51,15,'2021-02-20','41',450,'unsent',35000.00,'No 9,Main road, Hambanthota'),(39,52,9,'2021-02-20','43',10,'unsent',42500.00,'No 12,Garden Road, Gampaha'),(40,52,8,'2021-02-20','31',5,'warehouse',20000.00,'No 7,Colombo 7'),(41,33,11,'2021-02-20','43',100,'warehouse',21300.00,'No 4, Main Road, Kaluthara'),(42,36,15,'2021-02-20','42',500,'warehouse',44000.00,'No 2,Light House road, Matara'),(43,37,11,'2021-02-20','31',20,'warehouse',20000.00,'No 7, Main Road, Kaluthara'),(44,37,8,'2021-02-20','43',50,'unsent',22000.00,'No 2,Garden Road, Gampaha'),(45,38,15,'2021-02-20','36',40,'unsent',34300.00,'No 23,Light House road, Matara'),(46,38,7,'2021-02-20','38',35,'unsent',43000.00,'No 17, Fort road, Galle'),(47,40,7,'2021-02-20','39',45,'unsent',22000.00,'No 21,Fort road, Negambo'),(48,1,1,'2023-10-31','31',10,'unsent',1150.00,NULL),(49,1,1,'2023-11-02','31',40,'unsent',4600.00,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orders_AFTER_INSERT` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    INSERT INTO `train_order` VALUES (NEW.ID, NEW.qty, NEW.qty ,0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `path`
--

DROP TABLE IF EXISTS `path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `path` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `warehouse` varchar(50) DEFAULT NULL,
  `destinations` varchar(300) DEFAULT NULL,
  `time_taken` decimal(10,0) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `path_warehouse_idx` (`warehouse`),
  CONSTRAINT `path_warehouse` FOREIGN KEY (`warehouse`) REFERENCES `city_warehouse` (`city_name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path`
--

LOCK TABLES `path` WRITE;
/*!40000 ALTER TABLE `path` DISABLE KEYS */;
INSERT INTO `path` VALUES (1,'Colombo','Colombo-Hanwella',6,NULL),(2,'Colombo','Colombo-Nugegoda',6,NULL),(16,'Colombo','Colombo-Kaluthara',2,'Covers all the destinations for kaluthara'),(31,'Colombo','Colombo-Panadura',3,NULL),(33,'Jaffna','Jaffna-Polonnaruwa',5,NULL),(34,'Anuradhapura','Trinco-Anuradapura',5,NULL),(35,'Galle','galle-baddegama',5,NULL),(36,'Galle','galle-imaduwa',4,NULL),(37,'Galle','galle-akuressa',3,NULL),(38,'Galle','galle-ahangama',3,NULL),(39,'Galle','galle-balapitiya',10,NULL),(40,'Galle','galle-yakkalamulla',10,NULL),(41,'Matara','Matara-Weligama',3,NULL),(42,'Matara','Matara-Hambanthota',5,NULL),(43,'Colombo','Colombo-Gampaha',3,NULL);
/*!40000 ALTER TABLE `path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `unit_capacity` decimal(5,2) NOT NULL,
  `unit_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'promate single rule CR 80pages','stationary','available book types are single rule, double rule, square rule: no of pages 40,80,120,160:CR and exercise:promate and atlas',15.00,115.00),(2,'ballpoint pen','stationary','smooth writing avilble in blue color',1.00,10.00),(3,'single rule CR 80pages','stationary','available book types are single rule, double rule, square rule: no of pages 40,80,120,160:CR and exercise:promate and atlas',15.00,115.00),(4,'double rule CR 80pages','stationary','available book types are single rule, double rule, square rule: no of pages 40,80,120,160:CR and exercise:promate and atlas',15.00,115.00),(5,'square rule CR 80pages','stationary','available book types are single rule, double rule, square rule: no of pages 40,80,120,160:CR and exercise:promate and atlas',15.00,115.00),(6,'I phone 14 pro Cell Phone Cover','Electronics','Only black color covers are available. ',5.00,500.00),(7,'Galaxy s13  Phone Cover','Electronics','Only black color covers are available. ',5.00,550.00),(8,'iPhone 12 Pro Max Phone Cover','Electronics','Only Black color covers are available.',6.00,1000.00),(9,'rechargeable torch','Electronics','Charger is available',30.00,3000.00),(10,'Hair dryer ','Electroinc','Can be used for any type of hair.',10.00,1000.00),(11,'Badminton Racket','Sports','Made in Japan',15.00,2000.00),(12,'Badminton Racket Vft P5','Sports','A fine badminton racket product.',15.00,1500.00),(13,'Tennis Racket','Sports','Made in China',13.00,2000.00),(14,'TONE Clip Plier','stationary','for Removing Resin Clip of Automobiles.',15.00,700.00),(15,'Stapler Tacker','stationary','Brand is Heavy Duty',18.00,500.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `id` int NOT NULL,
  `initial_capacity` decimal(7,2) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `destinations` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,6000.87,'abc','Galle, Colombo'),(2,300.00,'Colombo Commuter','Colombo,Galle,Mathara, Negambo'),(3,500.00,'Connected Train - Matara','Colombo,Galle,Mathara'),(4,250.00,'Intercity - Colombo','Colombo, Kandy, Badulla'),(5,400.00,'Podi Menike - Badulla','Colombo, Kandy, Badulla'),(6,420.00,'Udarata Manike - Badulla','Colombo, Kandy, Badulla'),(7,250.00,'Udarata Manike - Colombo','Colombo, Kandy, Badulla');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_bulk`
--

DROP TABLE IF EXISTS `train_bulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_bulk` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `train` int DEFAULT NULL,
  `schedule_id` varchar(45) DEFAULT NULL,
  `sending_quantity` decimal(7,2) DEFAULT NULL,
  `confirmed` tinyint DEFAULT NULL,
  `sent` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `order_idx` (`order`),
  KEY `train_idx` (`train`),
  KEY `train_bulk_warehouse_idx` (`destination`),
  CONSTRAINT `order` FOREIGN KEY (`order`) REFERENCES `orders` (`ID`),
  CONSTRAINT `train` FOREIGN KEY (`train`) REFERENCES `train` (`id`),
  CONSTRAINT `train_bulk_warehouse` FOREIGN KEY (`destination`) REFERENCES `city_warehouse` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_bulk`
--

LOCK TABLES `train_bulk` WRITE;
/*!40000 ALTER TABLE `train_bulk` DISABLE KEYS */;
INSERT INTO `train_bulk` VALUES (11,1,'Colombo',1,'1',3.00,NULL,NULL),(12,1,'Colombo',1,'1',3.00,NULL,NULL),(13,1,'Colombo',1,'1',3.00,NULL,NULL),(14,1,'Colombo',1,'2',3.00,NULL,NULL),(16,7,'Colombo',1,'4',7.00,NULL,NULL),(17,7,'Jaffna',3,'6',13.00,NULL,NULL),(18,7,'Jaffna',3,'6',13.00,NULL,NULL),(19,7,'Colombo',1,'4',14.00,NULL,NULL),(20,9,'Jaffna',1,'3',7.00,NULL,NULL),(21,9,'Galle',1,'4',10.00,NULL,NULL),(22,7,'Gampaha',1,'3',17.00,NULL,NULL);
/*!40000 ALTER TABLE `train_bulk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_order`
--

DROP TABLE IF EXISTS `train_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_order` (
  `order` int NOT NULL,
  `remained_qty` decimal(7,2) DEFAULT NULL,
  `remained_count` int DEFAULT NULL,
  `finished` tinyint DEFAULT NULL,
  PRIMARY KEY (`order`),
  CONSTRAINT `train_order_to` FOREIGN KEY (`order`) REFERENCES `orders` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_order`
--

LOCK TABLES `train_order` WRITE;
/*!40000 ALTER TABLE `train_order` DISABLE KEYS */;
INSERT INTO `train_order` VALUES (1,250.00,0,1),(7,560.00,496,0),(8,30.00,30,0),(9,150.00,133,0),(10,20.00,20,0),(11,300.00,300,0),(12,30.00,30,0),(13,75.00,75,0),(14,50.00,50,0),(15,30.00,30,0),(16,10.00,10,0),(17,10.00,10,0),(18,10.00,10,0),(19,150.00,150,0),(20,25.00,25,0),(21,150.00,150,0),(22,900.00,900,0),(23,200.00,200,0),(24,28.00,28,0),(25,105.00,105,0),(26,200.00,200,0),(27,150.00,150,0),(28,5.00,5,0),(29,35.00,35,0),(30,75.00,75,0),(31,100.00,100,0),(32,15.00,15,0),(33,80.00,80,0),(34,11.00,11,0),(35,36.00,36,0),(36,30.00,30,0),(37,26.00,26,0),(38,450.00,450,0),(39,10.00,10,0),(40,5.00,5,0),(41,100.00,100,0),(42,500.00,500,0),(43,20.00,20,0),(44,50.00,50,0),(45,40.00,40,0),(46,35.00,35,0),(47,45.00,45,0),(48,10.00,10,0),(49,40.00,40,0);
/*!40000 ALTER TABLE `train_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_schedule`
--

DROP TABLE IF EXISTS `train_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `available_capacity` decimal(7,2) DEFAULT NULL,
  `train_id` int DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_schedule`
--

LOCK TABLES `train_schedule` WRITE;
/*!40000 ALTER TABLE `train_schedule` DISABLE KEYS */;
INSERT INTO `train_schedule` VALUES (1,'2023-10-13',6000.34,1,'00:00:12'),(2,'2023-10-12',6000.87,1,'12:00:00'),(3,'2023-10-12',6000.87,1,'12:00:00'),(4,'2023-10-26',6001.00,1,'12:00:00'),(5,'2023-11-02',420.00,6,'02:40:00'),(6,'2023-11-04',500.00,3,'17:44:00');
/*!40000 ALTER TABLE `train_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `registration_id` varchar(100) NOT NULL,
  `warehouse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `truck_warehouse_idx` (`warehouse`),
  CONSTRAINT `truck_warehouse` FOREIGN KEY (`warehouse`) REFERENCES `city_warehouse` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES ('30002','Anuradhapura'),('10001','Colombo'),('10002','Colombo'),('10003','Colombo'),('30001','Colombo'),('40001','Colombo'),('50001','Galle'),('60001','Galle'),('20001','Jaffna'),('20002','Jaffna');
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `truck_order_path`
--

DROP TABLE IF EXISTS `truck_order_path`;
/*!50001 DROP VIEW IF EXISTS `truck_order_path`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `truck_order_path` AS SELECT 
 1 AS `truck_id`,
 1 AS `order_id`,
 1 AS `path`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `truck_schedule`
--

DROP TABLE IF EXISTS `truck_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck_schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `truck_id` varchar(100) DEFAULT NULL,
  `assistant` int DEFAULT NULL,
  `driver` int DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `bulk_id` int DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `truck_schedule_truck_idx` (`truck_id`),
  KEY `truck_schedule_a_driver_idx` (`assistant`),
  KEY `truck_schedule_driver_idx` (`driver`),
  KEY `truck_schedule_order_idx` (`order_id`),
  CONSTRAINT `truck_schedule_a_driver` FOREIGN KEY (`assistant`) REFERENCES `driver_assistant` (`profile`),
  CONSTRAINT `truck_schedule_driver` FOREIGN KEY (`driver`) REFERENCES `driver` (`user_id`),
  CONSTRAINT `truck_schedule_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`ID`),
  CONSTRAINT `truck_schedule_truck` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`registration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_schedule`
--

LOCK TABLES `truck_schedule` WRITE;
/*!40000 ALTER TABLE `truck_schedule` DISABLE KEYS */;
INSERT INTO `truck_schedule` VALUES (2,'10001',21,55,'12:30:00','2023-10-30',1,13),(4,'10001',21,55,'12:30:00','2023-10-31',1,13),(5,'10002',22,54,'16:24:00','2023-10-29',1,11),(7,'10003',21,54,'14:28:00','2023-11-10',1,13);
/*!40000 ALTER TABLE `truck_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ravinduhiran26@gmail.com','rav2001','0783949022','customer','Ravindu Weerakoon'),(2,'abshdbasd','uyasd','u019238y812','abc','absuidb'),(3,'rav2--10','Rav2001','92398273','reteller','Ravindu'),(4,'rsjgaysgdyugasydg','Rav2001','92398273','reteller','Ravindu'),(5,'rav2--9','Rav2001','92398273','customer','Ravindu'),(6,'rav2--8','Rav2001','92398273','customer','Ravindu'),(7,'rav2--6','Rav2001','92398273','customer','Ravindu'),(8,'rav2--7','Rav2001','92398273','customer','Ravindu'),(14,'abc@gmail.com','rav2001','0783949022','manager','Raindu Weerakoon'),(15,'manager2@example.com','manager456','5555555555','manager','Second Manager Name'),(16,'driver2@example.com','driver789','9999999999','driver','Nimal Shantha'),(17,'driver3@abc.com','driver@2001','0775491749','driver','Kamal'),(18,'assistant2@example.com','assistant1011','0783949022','driver_assistant','Mahinda Rajapaksha'),(19,'a@gmail.com','assistant','0123456789','assistant',NULL),(20,'assistant10@gmail.com','assistant','0123456780','assistant',NULL),(21,'assistant2@gmail.com','assistant','0123456781','assistant',NULL),(22,'assistant30@gmail.com','assistant','0123456782','assistant',NULL),(23,'assistant39@gmail.com','assistant','0123456783','assistant',NULL),(24,'assistant6@gmail.com','assistant','0123456784','assistant',NULL),(25,'assistant7@gmail.com','assistant','0123456785','assistant',NULL),(26,'customer10@gmail.com','customer','0123456786','customer',NULL),(27,'customer11@gmail.com','customer','0123456787','customer',NULL),(28,'customer12@hotmail.com','customer','0123456788','customer',NULL),(29,'customer13@gmail.com','customer','0123456789','customer',NULL),(30,'customer14@gmail.com','customer','0123456780','customer',NULL),(31,'customer15@gmail.com','customer','0123456781','customer',NULL),(32,'customer16@gmail.com','customer','0123456782','customer',NULL),(33,'customer17@gmail.com','customer','0123456783','customer',NULL),(34,'customer18@gmail.com','customer','0123456784','customer',NULL),(35,'customer19@gmail.com','customer','0123456785','customer',NULL),(36,'customer1@gmail.com','customer','0123456786','customer',NULL),(37,'customer20@gmail.com','customer','0123456787','customer',NULL),(38,'customer21@gmail.com','customer','0123456788','customer',NULL),(39,'customer22@gmail.com','customer','0123456789','customer',NULL),(40,'customer23@gmail.com','customer','0123456780','customer',NULL),(41,'customer24@gmail.com','customer','0123456781','customer',NULL),(42,'customer25@gmail.com','customer','0123456782','customer',NULL),(43,'customer26@gmail.com','customer','0123456783','customer',NULL),(44,'customer27@gmail.com','customer','0123456784','customer',NULL),(45,'customer28@gmail.com','customer','0123456785','customer',NULL),(46,'customer2@gmail.com','customer','0123456786','customer',NULL),(47,'customer3@gmail.com','customer','0123456787','customer',NULL),(48,'customer4@gmail.com','customer','0123456788','customer',NULL),(49,'customer5@gmail.com','customer','0123456789','customer',NULL),(50,'customer6@gmail.com','customer','0123456780','customer',NULL),(51,'customer7@gmail.com','customer','0123456781','customer',NULL),(52,'customer8@gmail.com','customer','0123456782','customer',NULL),(53,'customer9@gmail.com','customer','0123456783','customer',NULL),(54,'d@gmail.com','driver','0123456784','driver',NULL),(55,'driver2@gmail.com','driver','0123456785','driver',NULL),(56,'driver3@gmail.com','driver','0123456786','driver',NULL),(57,'driver4@gmail.com','driver','0123456787','driver',NULL),(58,'driver5@gmail.com','driver','0123456788','driver',NULL),(59,'driver6@gmail.com','driver','0123456789','driver',NULL),(60,'driver7@gmail.com','driver','0123456780','driver',NULL),(61,'driver8@gmail.com','driver','0123456781','driver',NULL),(62,'driver9@gmail.com','driver','0123456782','driver',NULL),(63,'m@gmail.com','manager','0123456783','manager',NULL),(64,'s20@gmail.com','t_manager','0123456784','s_manager',NULL),(65,'s2@gmail.com','s_manager','0123456785','s_manager',NULL),(66,'s3@gmail.com','s_manager','0123456786','s_manager',NULL),(67,'s40@hotmail.com','s_manager','0123456787','s_manager',NULL),(68,'s4@gmail.com','s_manager','0123456788','s_manager',NULL),(69,'s@gmail.com','s_manager','0123456789','s_manager',NULL),(70,'t@gmail.com','t_manager','0783949022','t_manager','Gotabaya Rajapaksha');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testdb'
--

--
-- Dumping routines for database 'testdb'
--
/*!50003 DROP FUNCTION IF EXISTS `create_cus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_cus`(
    email varchar(100),
    contact_number varchar(50),
    password varchar(300),
    customer_name varchar(50),
    customer_type varchar(30)
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE last_inserted_id INT;
    SET GLOBAL log_bin_trust_function_creators = 1;
    
    INSERT INTO `user`(`email`, `password`, `type`, `phone`, `name`)
    VALUES (email, password, 'customer', contact_number, customer_name);
    
    SET last_inserted_id = LAST_INSERT_ID();
    
    INSERT INTO `customer`(`user_ID`, `customer_type`)
    VALUES (last_inserted_id, customer_type);
    
    RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_manager`(
  email VARCHAR(255),
  password VARCHAR(255),
  phone VARCHAR(20),
  name VARCHAR(255),
  account_type varchar(50)
) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE user_id INT;
  
  INSERT INTO `user`(`email`, `type`, `password`, `phone`, `name`) VALUES (email, 'manager', password, phone, name);
  
  SET user_id = LAST_INSERT_ID();
  
  INSERT INTO `manager`(`profile`, `type`) VALUES (user_id, account_type);
  
  RETURN user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_schedule`(
  train_id INT,
  date_leaving DATE,
  time_leaving TIME
) RETURNS int
    DETERMINISTIC
BEGIN
  declare inital_capacity DECIMAL(7,2);

  SELECT `initial_capacity` INTO inital_capacity FROM `train` WHERE `train_id` = train_id;

  INSERT INTO `train_schedule`(`date`, `available_capacity`, `train_id`, `time`) VALUES (date_leaving, inital_capacity, train_id, time_leaving) ;


RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `send_train_bulk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `send_train_bulk`(
  order_id INT ,
  qty INT,
  detination varchar(50),
  train INT,
  train_schedule_id INT
) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN

  declare remained_qty DECIMAL(7,2);
  declare unit_capacity DECIMAL(6,2);

  insert into `train_bulk` (`order`, `destination`, `train`, `schedule_id`, `sending_quantity`) VALUES (order_id, detination, train, train_schedule_id,qty);
  
   SELECT o.remained_count INTO remained_qty 
   FROM train_order o WHERE 
   o.order = order_id;
   
   
   if remained_qty = qty then
	UPDATE train_order t SET t.remained_count = 0 , t.finished=1  
    WHERE t.order = order_id;
    
    UPDATE orders o set o.state = "train" where o.ID = order_id;
    return 1;
    
		
	end if;
    
    IF remained_qty > qty THEN
    
    UPDATE train_order t SET t.remained_count = remained_qty-qty  
    WHERE t.order = order_id;
    return 1;
    end if;
   
   
   
   return 0;
   
   
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cityOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cityOrders`()
BEGIN

	select warehouse,sum(price) as price
	from order_destinations
	group by warehouse
	order by price;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createSchedule`(
	trainID int,
    scDate date,
    scTime time
)
BEGIN

    DECLARE trainCapacity DECIMAL;
    
    -- Retrieve the train capacity from the train table via the train ID
    SELECT initial_capacity INTO trainCapacity FROM train WHERE id = trainID;
    
    -- Insert a new record into the train_schedule table with the provided values
    INSERT INTO train_schedule (date, available_capacity, train_id, time)
    VALUES (scDate, trainCapacity, trainID, scTime);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createTruckSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createTruckSchedule`(
  truck_id varchar(50),
  assistant INT,
  driver INT,
  start_time TIME,
  date DATE,
  order_id INT,
  bulk_id INT,
  city varchar(50)
  )
BEGIN
 
  
  
  
  call updateDriver(driver, city);
  call updateAssistant(assistant, city);
  
  call updateTime(driver, assistant, order_id);
    
  INSERT INTO truck_schedule (truck_id, assistant, driver, start_time, date, order_id, bulk_id)
  VALUES (truck_id, assistant, driver, start_time, date, order_id, bulk_id);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customerOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customerOrder`()
BEGIN

select u.name,o.price,o.ID as 'order' from
(orders o join customer c
on (o.ID=c.user_ID)) join user u
on (u.ID=o.ID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAssistant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAssistant`(IN city VARCHAR(50))
BEGIN
    -- Select the assistant with the least amount of num_hours and num_visits less than 1 in the given city
    
    SELECT asst.user_id FROM 
    assistant_roster asst join driver_assistant a 
    on (a.profile = asst.user_id)
    WHERE a.warehouse = city  AND asst.num_visits <2 AND asst.end_date > current_date() 
    ORDER BY num_hours ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAssistants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAssistants`(IN city VARCHAR(50))
BEGIN
    -- Select the assistant with the least amount of num_hours and num_visits less than 1 in the given city
    
    SELECT asst.user_id FROM 
    assistant_roster asst join driver_assistant a 
    on (a.profile = asst.user_id)
    WHERE a.warehouse = city  AND asst.num_visits <2 AND asst.end_date > current_date() 
    ORDER BY num_hours ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBulks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBulks`(
	city varchar(50)
)
BEGIN
	
select tb.ID,tb.order,tb.sending_quantity,o.delivery_address, tb.confirmed,tb.sent from
train_bulk tb join orders o
on(tb.order = o.ID)
where tb.destination=city;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDriver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDriver`(city VARCHAR(50))
BEGIN
    -- Select the driver with the least amount of num_hours and num_visits less than 1 in the given city
    
    SELECT dr.user_id FROM 
    driver_roster dr join driver d 
    on (d.user_id = dr.user_id)
    WHERE d.warehouse = city  AND dr.previous_visit = false AND dr.end_date > current_date() 
    ORDER BY num_hours ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDrivers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDrivers`(city VARCHAR(50))
BEGIN
    -- Select the driver with the least amount of num_hours and num_visits less than 1 in the given city
    
    SELECT dr.user_id FROM 
    driver_roster dr join driver d 
    on (d.user_id = dr.user_id)
    WHERE d.warehouse = city  AND dr.previous_visit = false AND dr.end_date > current_date() 
    ORDER BY num_hours ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDriverWorkingHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDriverWorkingHours`(
 driver_id int)
BEGIN

	select * from driver_roster d
    where d.user_id = driver_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProductSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductSales`()
BEGIN

select  p.ID,p.name,count(p.ID) as 'count'
from orders o join product p 
on(o.product_id=p.ID)  
group by p.ID
order by count(p.ID)
DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuarterlySales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuarterlySales`(
	sale_year varchar(10))
BEGIN


SELECT
    YEAR(date_ordered) AS income_year,
    QUARTER(date_ordered) AS income_quarter,
    SUM(price) AS quarterly_income
FROM
    orders
WHERE
    YEAR(date_ordered) = sale_year
GROUP BY
    income_year,
    income_quarter
ORDER BY
    income_year, income_quarter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVehicles`(city varchar(50))
BEGIN

	select registration_id
    from truck
    where warehouse = city;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWareHouse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWareHouse`(
	ID Int
    )
BEGIN

	select w.city_name
	from city_warehouse w join user u
	on (w.manager = u.ID)
	where w.manager = ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `orderDestinations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `orderDestinations`()
BEGIN

select warehouse, destinations,path,sum(price) as 'price'
from order_destinations
group by path;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trainOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trainOrders`()
BEGIN
select o.ID,remained_count,qty,date_ordered,p.unit_capacity
from 
(train_order t join orders o on( t.order = o.ID and t.finished=0) 
join product p on (p.ID=o.product_id));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `truckTimes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `truckTimes`()
BEGIN

select top.truck_id,sum(p.time_taken) as time
from truck_order_path top join path p
on(top.path = p.ID)
group by top.truck_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateAssistant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAssistant`(
  assistant int,
  city varchar(50))
BEGIN

  declare u_id int;

  select asst.user_id
  into u_id
  FROM assistant_roster asst join driver_assistant a  on (asst.user_id = a.profile)
  WHERE asst.num_visits > 0 AND asst.end_date > CURRENT_DATE() and a.warehouse = city and asst.user_id != assistant;
  
  update assistant_roster 
  set num_visits = 0
  where user_id = u_id and end_date > current_date();
	
  UPDATE assistant_roster
  set num_visits = num_visits + 1
  WHERE user_id = assistant AND end_date > current_date();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateDriver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDriver`(
	driver int,
    city varchar(50))
BEGIN

	

	declare u_id int;
    
	SELECT dr.user_id
	INTO u_id
	FROM driver_roster dr join driver d  on (dr.user_id = d.user_id)
	WHERE dr.previous_visit = true AND dr.end_date > CURRENT_DATE() and d.warehouse = city
	LIMIT 1;
    
    update driver_roster
	SET previous_visit = false
	WHERE user_id = u_id;
    
    update driver_roster
	SET previous_visit = true
	WHERE user_id = driver AND end_date > current_date();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTime`(
	driver int,
    driver_assistant int,
    order_id int)
BEGIN
    
    declare time_t decimal(4,2);
    
    select p.time_taken into 
    time_t from 
    path p join orders o
    on (p.ID = o.path)
    where o.ID = order_id;
    
	update driver_roster dr
    set dr.num_hours = dr.num_hours + time_t 
    where dr.user_id = driver and dr.end_date > current_date();
        
	update assistant_roster a_r
    set a_r.num_hours = a_r.num_hours + time_t 
    where a_r.user_id = driver_assistant and a_r.end_data > current_date();
    
    


    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userOrders`()
BEGIN

select u.ID,u.name,o.ID,o.price 
from orders o join user u 
on(o.customer = u.ID)
order by o.customer;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `assistant_hours`
--

/*!50001 DROP VIEW IF EXISTS `assistant_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `assistant_hours` AS select `u`.`ID` AS `ID`,`u`.`name` AS `name`,`a`.`start_date` AS `start_date`,`a`.`end_date` AS `end_date`,`a`.`num_hours` AS `num_hours` from (`user` `u` join `assistant_roster` `a` on((`u`.`ID` = `a`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `driver_hours`
--

/*!50001 DROP VIEW IF EXISTS `driver_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `driver_hours` AS select `u`.`ID` AS `ID`,`u`.`name` AS `name`,`dr`.`start_date` AS `start_date`,`dr`.`end_date` AS `end_date`,`dr`.`num_hours` AS `num_hours` from (`driver_roster` `dr` join `user` `u` on((`dr`.`user_id` = `u`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_destinations`
--

/*!50001 DROP VIEW IF EXISTS `order_destinations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_destinations` AS select `p`.`warehouse` AS `warehouse`,`o`.`path` AS `path`,`p`.`destinations` AS `destinations`,`o`.`price` AS `price` from (`orders` `o` join `path` `p` on((`o`.`path` = `p`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `truck_order_path`
--

/*!50001 DROP VIEW IF EXISTS `truck_order_path`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `truck_order_path` AS select `ts`.`truck_id` AS `truck_id`,`ts`.`order_id` AS `order_id`,`o`.`path` AS `path` from ((`truck_schedule` `ts` join `truck` `t` on((`ts`.`truck_id` = `t`.`registration_id`))) join `orders` `o` on((`o`.`ID` = `ts`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-02 14:03:28
