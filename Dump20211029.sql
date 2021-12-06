CREATE DATABASE  IF NOT EXISTS `pet_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pet_project`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pet_project
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` varchar(45) DEFAULT NULL,
  `login_attempts` tinyint(4) NOT NULL DEFAULT '0',
  `acc_status` varchar(45) NOT NULL,
  `gu_id` char(36) NOT NULL,
  `stripe_customer_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`acc_id`),
  UNIQUE KEY `acc_id_UNIQUE` (`acc_id`),
  KEY `acc_user_fk_idx` (`user_id`),
  CONSTRAINT `acc_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'$2a$10$PGuNqpgr93ii98qWznPsjurJEuZVVB/1HbqDHhuR2ZJXnkvlhdVCy',NULL,4,'active','83dad929-28be-11ec-9e02-7cd30a835f90','','2021-05-15 05:50:50'),(3,9,'$2a$10$v3Fdbne2yXX9twIDoMlRm.Tdmv6K06OTUWbZ1cYm1VnD87JEV3nQa',NULL,4,'active','83daeb4b-28be-11ec-9e02-7cd30a835f90','cus_KRYyd1Cwb01q8C','2021-05-16 15:50:52'),(4,10,'$2a$10$Uqcw2RFMpx0aeO.NuDswKeZkgkN0cJqv4PJK9VXT1suaVaQK1Rbe2',NULL,4,'active','83daec3f-28be-11ec-9e02-7cd30a835f90','','2021-05-16 16:28:47'),(5,11,'$2a$10$Cy1JVSZxcSDRcu4PX4Ppfu2R2LpvlBbnJVXqMO9g0l74dCjyPOl6y',NULL,4,'active','83daed40-28be-11ec-9e02-7cd30a835f90','','2021-05-17 04:05:05'),(6,12,'$2a$10$F3nG2SOAsT5PXu1.wFYrJektoxJfPjMWfuRYKxJYe.CsPGqZdJ5ki',NULL,4,'active','83daede7-28be-11ec-9e02-7cd30a835f90','','2021-05-17 04:06:37'),(7,14,'$2a$10$gxFcECi4y.0BoryuDysr1uIliAm8lqsD1E23tFqJb0a5buw9Qfj7u',NULL,4,'active','83daeeb5-28be-11ec-9e02-7cd30a835f90','','2021-05-17 07:14:16'),(8,15,'$2a$10$Liq5ehFVNGBNOlUMr8AehO1hJCGm25LJcDWDZ7VJLe5CnurkpfL7C',NULL,4,'active','83daef55-28be-11ec-9e02-7cd30a835f90','','2021-05-17 07:18:54'),(9,16,'$2a$10$7B/h01m98E/Q0gHcjV2cEu/acXSp2SBxJmWmxDOFx8XzhZni7hjb.',NULL,4,'active','83daf01e-28be-11ec-9e02-7cd30a835f90','','2021-05-17 10:10:14'),(10,17,'$2a$10$otLOhs8rvJmR1LX0UAW89.IhNzgS5bGbUTbyTCrwVgy0PZ93iyFSy',NULL,4,'active','83daf0bd-28be-11ec-9e02-7cd30a835f90','','2021-05-18 10:05:45'),(11,18,'$2a$10$m.UewQxbeXoTVA1WuMjD.uzEEPut5WZLy6PC/Hxn70EzOTG0UnXF6',NULL,4,'active','83daf162-28be-11ec-9e02-7cd30a835f90','','2021-05-29 11:32:12'),(12,19,'$2a$10$NtshT6oqw6v/hGzzWHNAvOFgzR1KZAcqHycW0QNt5bSluAgP7dC0i',NULL,4,'active','83daf223-28be-11ec-9e02-7cd30a835f90','','2021-06-02 10:06:32'),(13,20,'$2a$10$Rl6nSdHKEi0bNIYLT1VyvePIvIfa9WcbgitUTN13WCDq5sM7ln7iK',NULL,4,'active','83daf2bf-28be-11ec-9e02-7cd30a835f90','','2021-06-11 14:32:57'),(14,21,'$2a$10$pTdboJki9GLHRc/8BmxOc.HqdsJx./qFIfMJQ5DMPNijXwdkyENKG',NULL,0,'active','83daf350-28be-11ec-9e02-7cd30a835f90','','2021-06-18 03:14:47'),(15,22,'$2a$10$9TJx3gygMMadewSZY7JecuinjGptRM/MzE/xd6HE1Q0f/zqy.BUYm',NULL,0,'active','83daf418-28be-11ec-9e02-7cd30a835f90','','2021-07-14 03:03:41'),(16,23,'$2a$10$Q4g2pp0ukfu25.kh8QMrDOMCawD9o258K990c0af0mzW8/god9duq',NULL,0,'active','83daf4af-28be-11ec-9e02-7cd30a835f90','','2021-07-16 04:17:50'),(17,24,'$2a$10$.Qmt112zeeXCemxYaMHnZOkPdofHgoHVm4LBgTvs.4YCrOpX5EsOG',NULL,0,'active','83daf53d-28be-11ec-9e02-7cd30a835f90','','2021-07-16 14:11:08'),(18,26,'$2a$10$Er6vNT4ogV4Ui/uihzqbDeAFTPXXWXD7KFuGteymJH37fW.LLHBji',NULL,0,'active','83daf5ee-28be-11ec-9e02-7cd30a835f90','','2021-07-16 14:16:01'),(19,27,'$2a$10$sW4N7dKuClJYUN6KwhiXAOT5YEmGTzJ4tQXHtM2SqmeyUlYkQ.cL.',NULL,0,'active','83daf689-28be-11ec-9e02-7cd30a835f90','','2021-07-16 14:33:31'),(20,28,'$2a$10$JUOJjnI0QToXR4ye4Ze07uUvEnR4TAVDuItNg8E629P4V38xSjHIu',NULL,0,'active','83daf754-28be-11ec-9e02-7cd30a835f90','','2021-07-16 15:19:09'),(21,29,'$2a$10$aD9Mq9jNbBNh8Qo3JCSXle2EGY6tIGH5WxyLDigGTNIpshgtGdCwa',NULL,0,'active','83db0569-28be-11ec-9e02-7cd30a835f90','','2021-07-16 15:20:47'),(22,30,'$2a$10$14IbDh4TMZLpay1HsSIh3uSAZI9jlONkgD2qX7iUDthL6DgUUjILe',NULL,0,'active','83db062c-28be-11ec-9e02-7cd30a835f90','','2021-07-19 02:21:27'),(23,31,'$2a$10$ZkxUbXwXvb6sQf5uyv1Rn.dsqPbPkkD/pDHW95nyr221JP1Pq/8.i',NULL,0,'active','83db0687-28be-11ec-9e02-7cd30a835f90','','2021-07-21 00:15:20'),(24,32,'$2a$10$FmFsLQYfrz6AcNnJt/o.9eFcgyYLZ5r0VTRtFVRbGgyPSVecjxwvq',NULL,0,'active','83db06cf-28be-11ec-9e02-7cd30a835f90','','2021-08-24 06:24:22'),(25,33,'$2a$10$XzbbmLCNajoVzkZFUEZa7ewQDxJHqoHxZMwSzNamab/O06CCCYoTG',NULL,0,'active','43c9c590-28c6-11ec-9e02-7cd30a835f90','','2021-10-09 06:00:54'),(26,35,'$2a$10$sfLqRvxVY/DwWXNsKAlMWesCu85glh/aGqvIR3YoZTel3YblFcQWe',NULL,0,'active','8b8aac9a-30da-11ec-9e02-7cd30a835f90','cus_KRA14RZbVLhOaG','2021-10-19 12:46:14'),(27,36,'$2a$10$iNRYGpqc0FpqwS9SigtXKedkzwpF2vvhM8HsioUIeaaEQ9z5g5qca',NULL,0,'active','e24eb4c7-31b1-11ec-bc63-7cd30a835f90','cus_KRYt2V0tlpKawd','2021-10-20 14:27:41');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `u_address_id_UNIQUE` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Singapore','singapore','asfas','132512','2021-05-15 05:48:50'),(5,'Singapore','singapore','#13-462','350107','2021-05-16 15:18:20'),(10,'Singapore','singapore','#13-462','350107','2021-05-16 15:50:52'),(11,'Singapore','singapore','#13-462','350107','2021-05-16 16:28:47'),(12,'Singapore','singapore','#13-462','350107','2021-05-17 04:05:05'),(13,'Singapore','singapore','#13-462','350107','2021-05-17 04:06:37'),(15,'Singapore','singapore','#13-462','350107','2021-05-17 07:14:16'),(16,'Singapore','singapore','#13-462','350107','2021-05-17 07:18:54'),(17,'Singapore','singapore','#13-462','350107','2021-05-17 10:10:14'),(18,'Singapore','singapore','#13-462','350107','2021-05-18 08:48:26'),(19,'Sint Maarten (Dutch part)','singapore','#13-462','350107','2021-05-18 10:05:45'),(20,'Singapore','singapore','#13-462','350107','2021-05-29 11:32:11'),(21,'Singapore','singapore','#13-462, Block 107','350107','2021-06-02 10:06:31'),(22,'Singapore','singapore','#13-462, Block 107','350107','2021-06-11 14:32:56'),(23,'Singapore','singapore','#13-462, Block 107','350107','2021-06-18 03:14:47'),(24,'Singapore','singapore','#13-462, Block 107','350107','2021-07-14 03:03:40'),(25,'Singapore','Singapore','Midview City','534153','2021-07-16 04:14:14'),(26,'Singapore','singapore','#13-462, Block 107','350107','2021-07-16 04:17:49'),(27,'Singapore','singapore','#13-462','350107','2021-07-16 14:03:56'),(28,'Singapore','singapore','#13-462','350107','2021-07-16 14:07:53'),(29,'Singapore','singapore','#13-462, Block 107','350107','2021-07-16 14:11:08'),(30,'Singapore','singapore','#13-462, Block 107','350107','2021-07-16 14:11:08'),(31,'Singapore','singapore','#13-462, Block 107','350107','2021-07-16 14:16:01'),(32,'Singapore','singapore','#13-462','350107','2021-07-16 14:32:44'),(33,'Singapore','singapore','#13-462, Block 107','350107','2021-07-16 14:33:31'),(34,'Singapore','singapore','#13-462','350107','2021-07-16 14:54:07'),(35,'Singapore','singapore','#13-462','350107','2021-07-16 14:55:21'),(36,'Singapore','singapore','#13-462','350107','2021-07-16 14:58:16'),(37,'Singapore','singapore','#13-462','350107','2021-07-16 15:08:10'),(38,'Singapore','singapore','#13-462','350107','2021-07-16 15:16:03'),(39,'Singapore','singapore','#13-462','350107','2021-07-16 15:18:24'),(40,'Singapore','singapore','#13-462, Block 107','350107','2021-07-16 15:19:09'),(41,'Singapore','singapore','#13-462, Block 107','350107','2021-07-16 15:20:46'),(42,'Singapore','singapore','gasf','443123','2021-07-19 02:20:01'),(43,'Singapore','singapore','dasdas','3124523','2021-07-19 02:21:27'),(44,'Singapore','singapore','midview city','412362','2021-07-21 00:12:53'),(45,'Singapore','Singapore','somewhere in singapore','312353','2021-07-21 00:15:19'),(46,'Singapore','asttsaff','dsgagga','312442','2021-08-21 08:09:40'),(47,'Singapore','asttsaff','dsgagga','312442','2021-08-21 08:10:39'),(48,'Singapore','gggggg','dsfgasg','421453','2021-08-21 08:43:07'),(49,'Singapore','dsaf','ggsgds','321453','2021-08-24 06:24:22'),(50,'Singapore','sadzxc','vzxvad','123512','2021-08-26 03:01:26'),(51,'Singapore','sazxzbaga','sgqrqe','123512','2021-08-26 03:22:21'),(52,'Singapore','singapore','safsaf','421405','2021-10-09 06:00:54'),(54,'Singapore','singapore','sadga','123215','2021-10-19 12:46:13'),(55,'Singapore','singapore','safahasga','342521','2021-10-20 14:27:41');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  `reason` varchar(255) DEFAULT '',
  `description` text NOT NULL,
  `address_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `trialed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_id_UNIQUE` (`company_id`),
  UNIQUE KEY `company_name_UNIQUE` (`name`),
  KEY `address_fk_idx` (`address_id`),
  CONSTRAINT `company_address_fk` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Sheng Siong','0','test','Sheng Siong Group Ltd. is the parent company of Sheng Siong Supermarket Pte Ltd, commonly known as Sheng Siong, the third largest chain of supermarkets in Singapore. The supermarket chain also airs its own television variety programmes named \"The Sheng Siong Show\".',18,'shengs@gmail.com',6596214111,'2021-05-15 05:47:49',0),(2,'Globex','1','','CME Globex is the premier electronic trading system providing global connectivity to the broadest array of futures and options across all asset classes.',18,'globexnoreply@gmail.com',96252922,'2021-05-15 13:58:34',0),(3,'Acme Corporation','0','Acme has decided not to continue business with our company.','Prime source for the concrete and construction equipment. Providing the best concrete, shotcrete, grouting, screeding and more since 1981.',18,'acmework@gmail.com',6596252922,'2021-05-15 14:45:41',0),(4,'Govtech','1','','Digital transformation within the public sector is at the heart of what GovTech, or Government Technology Agency of Singapore, does. We harness the best info-communications technologies to make a difference to the everyday lives of people in Singapore.',18,'govtech@gmail.com',6551355312,'2021-05-17 04:01:37',0),(5,'Singapore Polytechnic','1','','Singapore Polytechnic is an instituition based in Singapore that houses up to 8000 students at any one time.',18,'spsingaporepolytechnic@gmail.com',6596252922,'2021-05-18 08:48:26',0),(6,'Umbrella Corporation','1','','Umbrella Corp is the premier leading brand behind umbrella innovation.',25,'umbrellacorp@gmail.com',6584564654,'2021-07-16 04:14:14',0),(8,'ЖШС Цемент','1','','Танабай Адырбай',28,'lkpan.kadyrkan@uli.kz',6532134124,'2021-07-16 14:07:53',0),(9,'Martell','1','','Martell is a Cognac house founded in 1715 by Jean Martell (1694–1753).',32,'martellcognac@gmail.com',6552134214,'2021-07-16 14:32:44',0),(15,'JohnsonGaming','1','','JohnsonGaming is a company that houses the best e-sports services in the world.',39,'jgaming321@gmail.com',6542145213,'2021-07-16 15:18:24',0),(16,'Gauthier','1','','Theaterhaus Stuttgart is a young, dynamic company of 16 highly individual, versatile dancers, directed by the dancer, ...',42,'gauthier@gmail.com',6531232134,'2021-07-19 02:20:01',0),(17,'Cyr Fillion SA','1','','Cyr Fillion SA is a company dedicated to the best fresh sashimi found off the malayan peninsula.',44,'cyrfill@gmail.com',6512134213,'2021-07-21 00:12:53',0);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_list`
--

DROP TABLE IF EXISTS `invite_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invite_list` (
  `invite_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `priv_id` tinyint(4) NOT NULL,
  `company_id` int(11) NOT NULL,
  `invite_key` varchar(45) NOT NULL,
  PRIMARY KEY (`invite_id`),
  UNIQUE KEY `invite_id_UNIQUE` (`invite_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `inv_company_fk_idx` (`company_id`),
  KEY `inv_priv_fk_idx` (`priv_id`),
  CONSTRAINT `inv_company_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inv_priv_fk` FOREIGN KEY (`priv_id`) REFERENCES `privileges` (`priv_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_list`
--

LOCK TABLES `invite_list` WRITE;
/*!40000 ALTER TABLE `invite_list` DISABLE KEYS */;
INSERT INTO `invite_list` VALUES (31,'elliottwongyr@gmail.com',2,4,'OLjuVJ');
/*!40000 ALTER TABLE `invite_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `stripe_invoice_id` int(11) NOT NULL,
  `payment_method_id` varchar(255) DEFAULT NULL,
  `stripe_reference_number` varchar(255) DEFAULT NULL,
  `stripe_payment_intent_id` varchar(255) DEFAULT NULL,
  `stripe_client_secret` varchar(255) DEFAULT NULL,
  `stripe_payment_intent_status` enum('succeeded','requires_payment_method','requires_action','canceled','incomplete') DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `stripe_subscription_id` varchar(255) NOT NULL,
  `stripe_period_start` timestamp NULL DEFAULT NULL,
  `stripe_period_end` timestamp NULL DEFAULT NULL,
  `paid_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stripe_invoice_id`),
  KEY `invoices_pm_idx` (`payment_method_id`),
  KEY `invoices_subscription_fk_idx` (`stripe_subscription_id`),
  CONSTRAINT `invoices_pm_fk` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`stripe_payment_method_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoices_subscription_fk` FOREIGN KEY (`stripe_subscription_id`) REFERENCES `subscriptions` (`stripe_subscription_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `stripe_payment_intent_id` varchar(255) NOT NULL,
  `stripe_payment_intent_secret` varchar(255) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_acc_fk_idx` (`account_id`),
  CONSTRAINT `payment_acc_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`acc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `stripe_payment_method_id` varchar(255) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `stripe_payment_method_fingerprint` varchar(255) NOT NULL,
  `stripe_card_exp_date` varchar(255) NOT NULL,
  `stripe_card_last_four_digit` varchar(255) NOT NULL,
  `stripe_card_type` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`stripe_payment_method_id`),
  KEY `pm_acc_fk_idx` (`acc_id`),
  CONSTRAINT `pm_acc_fk` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES ('pm_1JmivgFbDe9AzCE72F5b16iB',3,'4AHmEcKVF21biV5v','1/26','9216','mastercard','2021-10-20 17:50:20','2021-10-20 17:50:20',NULL);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `stripe_product_id` varchar(255) NOT NULL,
  `stripe_price_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privileges` (
  `priv_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priv_name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`priv_id`),
  UNIQUE KEY `priv_id_UNIQUE` (`priv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (1,'Eiso Admin','Spawns companies'),(2,'Super Admin','Update User Privilege and can manage roles and users'),(3,'Admin','Can manage roles and users'),(4,'User','No authorities');
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `swot_rights` tinyint(4) DEFAULT '0',
  `ror_rights` tinyint(4) DEFAULT '0',
  `ip_rights` tinyint(4) DEFAULT '0',
  `qms_rights` tinyint(4) DEFAULT '0',
  `policy_rights` tinyint(4) DEFAULT '0',
  `raa_rights` tinyint(4) DEFAULT '0',
  `oap_rights` tinyint(4) DEFAULT '0',
  `scope_rights` tinyint(4) DEFAULT '0',
  `nr_rights` tinyint(4) DEFAULT '0',
  `td_rights` tinyint(4) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id_UNIQUE` (`role_id`),
  KEY `role_company_fk_idx` (`company_id`),
  CONSTRAINT `role_company_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,'Executive','Can do everything',3,3,3,3,3,1,3,1,1,1,'2021-05-15 05:55:55'),(3,2,'aaaa','aaaa',3,3,3,3,3,1,3,0,0,0,'2021-05-18 08:26:32'),(4,1,'Manager','Able to manage those at a micro level',3,3,3,3,3,1,3,0,0,0,'2021-06-07 16:07:41'),(6,1,'Employee','Basic Rights Only',1,1,1,1,1,1,1,0,0,0,'2021-06-12 08:15:26'),(13,6,'Executive','Does important things',3,3,3,3,3,1,3,0,0,0,'2021-07-16 04:24:17'),(14,9,'test','test',3,3,3,3,0,0,3,0,0,0,'2021-07-16 14:35:48'),(15,15,'test','test',3,3,3,3,3,1,3,0,0,0,'2021-07-16 15:24:23'),(16,16,'test','test',3,3,3,3,3,1,3,0,0,0,'2021-07-19 02:23:18'),(17,17,'Executive','Can do everything',3,3,3,3,3,1,3,0,0,0,'2021-07-21 00:17:49');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_id_UNIQUE` (`status_id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Active'),(4,'Archived'),(5,'Deleted'),(2,'Pending'),(3,'Rejected');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `stripe_subscription_id` varchar(255) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `payment_method_id` varchar(255) DEFAULT NULL,
  `stripe_status` enum('active','canceled','canceling','incomplete','trialing','past_due') DEFAULT NULL,
  `trial_end` timestamp NULL DEFAULT NULL,
  `current_period_start` timestamp NULL DEFAULT NULL,
  `current_period_end` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stripe_subscription_id`),
  KEY `subscriptions_acc_idx` (`acc_id`),
  KEY `subscriptions_company_idx` (`company_id`),
  KEY `subscriptions_plan_idx` (`plan_id`),
  KEY `subscriptions_pm_idx` (`payment_method_id`),
  CONSTRAINT `subscriptions_acc` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriptions_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriptions_plan` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriptions_pm` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`stripe_payment_method_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_roles_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_roles_id`),
  UNIQUE KEY `many_roles_id_UNIQUE` (`user_roles_id`),
  KEY `many_user_fk_idx` (`user_id`),
  KEY `many_roles_fk_idx` (`role_id`),
  CONSTRAINT `many_roles_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `many_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (23,10,1,'2021-06-23 14:50:32'),(24,1,1,'2021-07-06 02:41:05'),(27,1,6,'2021-07-06 02:41:05'),(28,23,13,'2021-07-16 04:26:33'),(29,27,14,'2021-07-16 14:36:09'),(30,28,15,'2021-07-16 15:26:45'),(31,30,16,'2021-07-19 02:24:29'),(32,31,17,'2021-07-21 00:18:27'),(51,9,1,'2021-08-20 09:24:03'),(52,9,4,'2021-08-20 09:24:03'),(53,9,6,'2021-08-20 09:24:03'),(57,14,1,'2021-08-24 07:07:14'),(58,14,4,'2021-08-24 07:07:14'),(59,14,6,'2021-08-24 07:07:14');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `user_status` tinyint(4) NOT NULL,
  `reason` varchar(255) DEFAULT '',
  `address_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `priv_id` tinyint(4) NOT NULL,
  `contact_number` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `user_company_fk_idx` (`company_id`),
  KEY `priv_fk_idx` (`priv_id`),
  KEY `user_address_fk_idx` (`address_id`),
  CONSTRAINT `priv_fk` FOREIGN KEY (`priv_id`) REFERENCES `privileges` (`priv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_address_fk` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_company_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,1,'',1,'Eiso','System',1,32144231,'bobsong@gmail.com','2021-05-15 05:49:28'),(9,1,1,'',10,'Soh','Wei Kang',2,18884521505,'sohwk@gmail.com','2021-05-16 15:50:52'),(10,1,0,'Fired for sexual misconduct.',11,'John','Tan',3,6512345678,'jtan@gmail.com','2021-05-16 16:28:47'),(11,4,1,'',12,'James','Ang',3,6512345678,'james@gmail.com','2021-05-17 04:05:05'),(12,4,1,'',13,'Super','James',3,6596252922,'superjames@gmail.com','2021-05-17 04:06:37'),(14,1,1,'',15,'Dong','Lee',4,6596252922,'donglee@gmail.com','2021-05-17 07:14:16'),(15,4,1,'',16,'dong','lee',2,6596252922,'lolol@gmail.com','2021-05-17 07:18:54'),(16,1,1,'',17,'John','Lee',3,6596252922,'johnlee@gmail.com','2021-05-17 10:10:14'),(17,4,1,'',19,'soh','wei kang',2,6596252922,'abcdef@gmail.com','2021-05-18 10:05:45'),(18,5,1,'',20,'soh','wei kang',2,6596252922,'venti@gmail.com','2021-05-29 11:32:11'),(19,1,1,'',21,'Johnny','Tay',3,6596252922,'johnny123@gmail.com','2021-06-02 10:06:31'),(20,1,1,'',22,'Kevin','Lim',3,6596252922,'kevinlimlim1@gmail.com','2021-06-11 14:32:57'),(21,1,1,'',23,'Cassandra','Niu',3,6596252922,'cassandraniu@gmail.com','2021-06-18 03:14:47'),(22,4,1,'',24,'soh','wei kang',2,6596252922,'gksafjlkjklj@gmail.com','2021-07-14 03:03:40'),(23,6,1,'',26,'soh','wei kang',2,6596252922,'test231123@gmail.com','2021-07-16 04:17:49'),(24,8,1,'',29,'soh','wei kang',2,6596252922,'testcompany1234@gmail.com','2021-07-16 14:11:08'),(26,8,1,'',31,'soh','wei kang',2,6596252922,'testcompany321@gmail.com','2021-07-16 14:16:01'),(27,9,1,'',33,'soh','wei kang',2,6596252922,'test420@gmail.com','2021-07-16 14:33:31'),(28,15,1,'',40,'soh','wei kang',2,6596252922,'superadmin@gmail.com','2021-07-16 15:19:09'),(29,15,1,'',41,'soh','wei kang',2,6596252922,'super123@gmail.com','2021-07-16 15:20:46'),(30,16,1,'',43,'safas','fskjjfsk',2,6544180923,'tehepero@gmail.com','2021-07-19 02:21:27'),(31,17,1,'',45,'soh','wei kang',2,6542145125,'testtest2@gmail.com','2021-07-21 00:15:19'),(32,4,1,'',49,'dsafgg','gagsf',2,6596252922,'fsafsaf@gmail.com','2021-08-24 06:24:22'),(33,1,1,'',52,'sadad','zxczxv',2,6596252922,'williamdafoe@gmail.com','2021-10-09 06:00:54'),(35,1,1,'',54,'soh','wei',4,6596436231,'teststripe@gmail.com','2021-10-19 12:46:13'),(36,1,1,'',55,'not','knock',4,6596252922,'testing321123@gmail.com','2021-10-20 14:27:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pet_project'
--

--
-- Dumping routines for database 'pet_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 19:18:05
