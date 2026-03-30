-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inventory_it_db
-- ------------------------------------------------------
-- Server version	8.4.8

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
-- Table structure for table `bot_user_states`
--

DROP TABLE IF EXISTS `bot_user_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bot_user_states` (
  `telegram_id` varchar(50) NOT NULL,
  `current_state` varchar(100) DEFAULT NULL,
  `state_data` json DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`telegram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_user_states`
--

LOCK TABLES `bot_user_states` WRITE;
/*!40000 ALTER TABLE `bot_user_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_user_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_transaksi`
--

DROP TABLE IF EXISTS `log_transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_transaksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `quantity` int NOT NULL,
  `tipe` enum('RESTOCK','AMBIL','KEMBALIKAN') NOT NULL,
  `status_transaksi` enum('success','failed','rejected') NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `item_code` (`item_code`),
  CONSTRAINT `log_transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `log_transaksi_ibfk_2` FOREIGN KEY (`item_code`) REFERENCES `stock_gudang` (`item_code`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_transaksi`
--

LOCK TABLES `log_transaksi` WRITE;
/*!40000 ALTER TABLE `log_transaksi` DISABLE KEYS */;
INSERT INTO `log_transaksi` VALUES (1,1,'MOUSE_LOGITECH',1,'AMBIL','success','2026-03-05 18:12:27'),(2,1,'MOUSE_LOGITECH',1,'AMBIL','success','2026-03-05 18:15:40'),(3,1,'MOUSE_LOGITECH',1,'AMBIL','success','2026-03-05 18:15:54'),(4,1,'SSD',1,'AMBIL','success','2026-03-05 18:21:39'),(5,1,'MOUSE_LOGITECH',1,'RESTOCK','success','2026-03-05 18:23:23'),(6,1,'MOUSE_LOGITECH',1,'RESTOCK','success','2026-03-05 18:25:47'),(7,1,'MOUSE_LOGITECH',1,'AMBIL','success','2026-03-05 18:28:26'),(8,1,'SSD',20,'RESTOCK','success','2026-03-06 23:20:37'),(9,1,'SSD',2,'AMBIL','success','2026-03-06 23:23:54'),(10,1,'SSD',2,'AMBIL','success','2026-03-07 00:23:22'),(11,1,'SSD',10,'RESTOCK','success','2026-03-07 01:14:19'),(12,1,'SSD',8,'AMBIL','success','2026-03-07 01:14:58'),(13,1,'KEYBOARD_MECH',1,'AMBIL','success','2026-03-07 01:28:11'),(14,1,'MOUSE_LOGITECH',8,'RESTOCK','success','2026-03-07 02:19:30'),(15,1,'MOUSE_LOGITECH',1,'AMBIL','success','2026-03-07 02:20:33'),(16,1,'MOUSE_LOGITECH',1,'AMBIL','success','2026-03-07 02:21:06'),(17,1,'MOUSE_LOGITECH',1,'AMBIL','success','2026-03-07 02:21:45'),(18,1,'MOUSE_LOGITECH',10,'AMBIL','success','2026-03-07 02:22:55'),(19,1,'SSD',10,'AMBIL','success','2026-03-07 02:23:40'),(20,1,'KEYBOARD_MECH',2,'AMBIL','success','2026-03-07 04:02:09'),(21,1,'SSD',10,'RESTOCK','success','2026-03-07 04:05:25'),(22,1,'SSD',10,'AMBIL','success','2026-03-07 04:05:58'),(23,1,'SSD',10,'AMBIL','success','2026-03-07 04:13:47'),(24,1,'SSD',10,'AMBIL','success','2026-03-07 04:37:29'),(25,1,'SSD',10,'AMBIL','success','2026-03-07 04:38:27'),(26,1,'SSD',10,'RESTOCK','success','2026-03-07 04:39:31'),(27,1,'SSD',7,'AMBIL','success','2026-03-07 04:43:30'),(28,1,'SSD',7,'RESTOCK','success','2026-03-07 04:44:27'),(29,1,'KEYBOARD_MECH',7,'RESTOCK','success','2026-03-09 04:01:48'),(30,1,'KEYBOARD_MECH',3,'RESTOCK','success','2026-03-09 04:13:36'),(31,1,'SSD',10,'AMBIL','success','2026-03-09 04:14:02'),(32,2,'SSD',1,'AMBIL','success','2026-03-09 05:36:08'),(33,2,'SSD',1,'RESTOCK','success','2026-03-09 05:36:30'),(34,2,'SSD',1,'AMBIL','success','2026-03-09 05:37:25'),(35,2,'SSD',1,'AMBIL','success','2026-03-09 05:56:22'),(36,2,'SSD',1,'RESTOCK','success','2026-03-09 06:01:36'),(37,2,'SSD',1,'RESTOCK','success','2026-03-09 06:16:03'),(38,1,'SSD',1,'RESTOCK','success','2026-03-09 06:21:52'),(39,1,'null',1,'RESTOCK','success','2026-03-09 06:28:51'),(40,1,'PSU',1,'RESTOCK','success','2026-03-09 06:29:55'),(41,1,'BAN',1,'RESTOCK','success','2026-03-09 22:49:44'),(42,1,'SSD',1,'RESTOCK','success','2026-03-09 22:52:06'),(43,1,'null',1,'AMBIL','success','2026-03-11 00:50:32');
/*!40000 ALTER TABLE `log_transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_gudang`
--

DROP TABLE IF EXISTS `stock_gudang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_gudang` (
  `item_code` varchar(50) NOT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `name_item` varchar(100) DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `min_threshold` int NOT NULL DEFAULT '5',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_code`),
  UNIQUE KEY `item_code` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_gudang`
--

LOCK TABLES `stock_gudang` WRITE;
/*!40000 ALTER TABLE `stock_gudang` DISABLE KEYS */;
INSERT INTO `stock_gudang` VALUES ('BAN',NULL,NULL,1,5,'2026-03-09 22:49:44'),('KEYBOARD_MECH',NULL,'Keyboard Mechanical',30,5,'2026-03-09 04:13:36'),('MOUSE_LOGITECH',NULL,'Mouse Logitech Wireless',60,10,'2026-03-07 02:19:30'),('null',NULL,NULL,0,5,'2026-03-11 00:50:32'),('PSU',NULL,'PSU 450W Battlegrounds',1,5,'2026-03-13 16:49:22'),('SSD',NULL,'SSD SATA',64,10,'2026-03-09 22:52:06');
/*!40000 ALTER TABLE `stock_gudang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_users`
--

DROP TABLE IF EXISTS `stock_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_users` (
  `user_id` int NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`item_code`),
  KEY `item_code` (`item_code`),
  CONSTRAINT `stock_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_users_ibfk_2` FOREIGN KEY (`item_code`) REFERENCES `stock_gudang` (`item_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_users`
--

LOCK TABLES `stock_users` WRITE;
/*!40000 ALTER TABLE `stock_users` DISABLE KEYS */;
INSERT INTO `stock_users` VALUES (1,'KEYBOARD_MECH',3,'2026-03-07 04:02:09'),(1,'MOUSE_LOGITECH',17,'2026-03-07 02:22:55'),(1,'null',1,'2026-03-11 00:50:32'),(1,'SSD',80,'2026-03-09 04:14:02'),(2,'SSD',3,'2026-03-09 05:56:21');
/*!40000 ALTER TABLE `stock_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `telegram_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` enum('admin','staff','viewer') NOT NULL DEFAULT 'staff',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telegram_id` (`telegram_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1271063834','Alfiyan','admin',1,'2026-03-04 21:56:04'),(2,'5697674525','Nazar','staff',1,'2026-03-09 12:34:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 14:48:24
