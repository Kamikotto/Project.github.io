-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: pastryshop
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `candytypes`
--

DROP TABLE IF EXISTS `candytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candytypes` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `shelf_life` varchar(45) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candytypes`
--

LOCK TABLES `candytypes` WRITE;
/*!40000 ALTER TABLE `candytypes` DISABLE KEYS */;
INSERT INTO `candytypes` VALUES (1,'Гонгконские вафельки','Вафельки','1 коробка','4 мес.'),(2,'Птичье Молоко','Конфеты','2 коробки','6 мес.'),(3,'Тульский пряник','Пряники','6 коробок','6 мес.'),(4,'Сибирский сувенир','Конфеты','3 коробки','1,5 мес.');
/*!40000 ALTER TABLE `candytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal` (
  `id_Journal` int DEFAULT NULL,
  `date_of_shipment` date NOT NULL,
  `date_of_release` date NOT NULL,
  `id_type` int NOT NULL,
  `id_supplier` int NOT NULL,
  `id_point` int NOT NULL,
  `id_user` int NOT NULL,
  KEY `type1FK_idx` (`id_type`),
  KEY `sup1FK_idx` (`id_supplier`),
  KEY `point1FK_idx` (`id_point`),
  KEY `user1FK_idx` (`id_user`),
  CONSTRAINT `point1FK` FOREIGN KEY (`id_point`) REFERENCES `sales_points` (`id_point`),
  CONSTRAINT `sup1FK` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`),
  CONSTRAINT `type1FK` FOREIGN KEY (`id_type`) REFERENCES `candytypes` (`id_type`),
  CONSTRAINT `user1FK` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (1,'2022-05-05','2022-06-02',1,1,1,1),(2,'2022-12-10','2022-12-16',2,2,2,2),(3,'2022-06-07','2022-06-11',3,3,3,3),(4,'2022-11-25','2022-11-30',4,4,4,4);
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_points`
--

DROP TABLE IF EXISTS `sales_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_points` (
  `id_point` int NOT NULL AUTO_INCREMENT,
  `name_point` varchar(100) NOT NULL,
  `point_city` varchar(45) NOT NULL,
  `point_adress` varchar(45) NOT NULL,
  PRIMARY KEY (`id_point`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_points`
--

LOCK TABLES `sales_points` WRITE;
/*!40000 ALTER TABLE `sales_points` DISABLE KEYS */;
INSERT INTO `sales_points` VALUES (1,'SNACK & PACK FOOD','Москва','проспект 40 лет Октября35'),(2,'OrganicBar','Москва','9-й проезд Марьиной Рощи4'),(3,'SMART FMCG','Москва','улица Вавилова271'),(4,'Gurman-Product','Москва','Абельмановская улица16');
/*!40000 ALTER TABLE `sales_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `supplier_city` varchar(45) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Уфа','ООО ФудВэй'),(2,'Донецк','ООО \"Кэнди Фрут\"'),(3,'Воронеж','Кондитерская фабрика \"ДонКо\"'),(4,'Москва','ООО НПФ \"Пчела и человек\"');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `FIO` varchar(100) NOT NULL,
  `nomber` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Аврмов Д.Г','89191561781','qwer','123','Работает'),(2,'Власов Ю.А','89191561781','wert','234','Уволен'),(3,'Рамзин В.Е','89191561781','erty','345','Работает'),(4,'Пархомов А.Л','89191561781','rtyu','456','Работает');
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

-- Dump completed on 2023-01-20 19:36:51
