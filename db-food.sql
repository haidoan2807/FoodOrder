-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_food
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Coke','https://medicare.vn/wp-content/uploads/2021/01/0063149.jpg',5,'coca cola',1),(2,'Heniken','https://minhcaumart.vn/media/com_eshop/products/8934822212339.jpg',10,'đây là bia',1),(3,'Burger','https://burgerking.vn/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/c/r/crunchy_whp-min_1.jpg',7,'hum bơ gơ',2),(4,'Hủ tiếu','https://daubepgiadinh.vn/wp-content/uploads/2018/05/hinh-hu-tiu-nam-vang.jpg',30,'hủ tiếu gõ',3),(5,'Bún bò','https://i.ytimg.com/vi/A_o2qfaTgKs/maxresdefault.jpg',50,'bún bòa',3),(6,'Khoai tây chiên','http://icdn.dantri.com.vn/zoom/1200_630/2017/khoai-tay-chien-1497363342895.jpg',100,'potato',2),(7,'Sandwich','https://monngonmoingay.com/wp-content/uploads/2020/12/sandwich-kep-cha-tom-500.jpg',2,'san quýt',2),(8,'Đồ chay','https://cdn.tgdd.vn/Files/2022/03/21/1421421/tong-hop-16-cach-lam-mon-chay-thanh-dam-dinh-duong-tai-nha-202203211050443101.jpg',1,'đây là đồ ăn chay',5),(9,'Bánh tráng','https://res.klook.com/image/upload/q_85/c_fill,w_750/v1596008298/blog/eibedalo0wncojkerkpg.jpg',33,'bánh cháng',4),(10,'xúc xích','https://www.tvpfood.com/image/cache/catalog/product/san-pham-xien-que-tiec/xuc-xich-berlin-03-1024x1024.png',22,'sút sít',4);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_type`
--

DROP TABLE IF EXISTS `food_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_type`
--

LOCK TABLES `food_type` WRITE;
/*!40000 ALTER TABLE `food_type` DISABLE KEYS */;
INSERT INTO `food_type` VALUES (1,'Thức uống'),(2,'Thức ăn nhanh'),(3,'Món nước'),(4,'Ăn vặt'),(5,'Chay');
/*!40000 ALTER TABLE `food_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_res`
--

DROP TABLE IF EXISTS `like_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_res`
--

LOCK TABLES `like_res` WRITE;
/*!40000 ALTER TABLE `like_res` DISABLE KEYS */;
INSERT INTO `like_res` VALUES (1,1,'2022-01-01 09:00:00'),(2,2,'2022-01-01 09:00:00'),(2,3,'2022-01-01 09:00:00'),(3,1,'2022-01-01 09:00:00'),(3,3,'2022-01-01 02:00:00');
/*!40000 ALTER TABLE `like_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,300,'009','[1,2]'),(3,1,1,'',''),(3,2,9,'007','[1,2,3]'),(3,4,1,'',''),(3,5,5,'',''),(3,8,10,'',''),(3,9,10,'','[1,2,3]'),(3,10,10,'','');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_res`
--

DROP TABLE IF EXISTS `rate_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_res`
--

LOCK TABLES `rate_res` WRITE;
/*!40000 ALTER TABLE `rate_res` DISABLE KEYS */;
INSERT INTO `rate_res` VALUES (1,2,4,'2022-01-01 09:00:00'),(2,1,3,'2022-01-01 09:00:00'),(2,3,3,'2022-01-01 09:00:00');
/*!40000 ALTER TABLE `rate_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Phúc Long','https://static.mservice.io/placebrand/s/momo-upload-api-200218150929-637176353692616410.jpg','pl'),(2,'KFC','/public/img/1659847246771_test.mp4','kfc'),(3,'Kichi kichi','https://aeonmall-haiphong-lechan.com.vn/wp-content/uploads/2020/09/25.-kichi-kichi.jpg','kckc');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_food`
--

DROP TABLE IF EXISTS `sub_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_food`
--

LOCK TABLES `sub_food` WRITE;
/*!40000 ALTER TABLE `sub_food` DISABLE KEYS */;
INSERT INTO `sub_food` VALUES (1,'Hành phi',1,4),(2,'Hành phi',1,5),(3,'Hành phi',1,8),(4,'Trân châu',2,1),(5,'Trân châu',2,2),(6,'tương ớt',2,3),(7,'tương ớt',2,10);
/*!40000 ALTER TABLE `sub_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `facebook_app_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tony','tony@gmail.com','1234',NULL),(2,'John wick','john@gmail.com','1234',NULL),(3,'Peter','pi@gmail.com','1234',NULL),(4,'Kang','kang@gmail.com','1234',NULL),(5,'movie 3','phim số 3','123456',NULL),(7,'abc','abc@gmail.com','$2b$10$tkFIqg.QZbwr33SBNaf4re0HXC6bIrRf/49PwDWa.ulh/8bkXVKXy',NULL),(12,'graphql','grap@gmail.com','1234',NULL),(15,'test','test@gmail.com','$2b$10$aCErmGtmN3XbRCKJGB8JLe6YgvgAhe3crF1qZ5OhDHsrvzEDKGTGW',NULL),(18,'Nguyễn Đình Sang',NULL,'6001302966584633',NULL),(19,'Y Nhi','ynhi@gmail.com','$2b$10$zqcrEJhyfuqwN8mQzCa/RON/UyJBsXduRP6jlNOKWRDW3LaU9uJ4e',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_food'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 22:47:29
