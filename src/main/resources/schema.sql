-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchii
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `bomon`
--

DROP TABLE IF EXISTS `bomon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bomon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `khoa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khoaid` (`khoa_id`),
  CONSTRAINT `bomon_ibfk_1` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bomon`
--

LOCK TABLES `bomon` WRITE;
/*!40000 ALTER TABLE `bomon` DISABLE KEYS */;
INSERT INTO `bomon` VALUES (1,'Công nghệ phần mềm','Chuyên ngành CNTT',1),(2,'Trí tuệ nhân tạo','Chuyên ngành HTTT',1),(3,'Bảo mật hệ thống','Chuyên ngành ATTT',2),(4,'Ngăn chặn tấn công DDOS','Chuyên ngành ATTT',2),(5,'Khai phá dữ liệu đa phương tiệ','Chuyên ngành CNĐPT',3),(6,'Lập trình game','Chuyên ngành CNĐPT',3);
/*!40000 ALTER TABLE `bomon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bomon_ds_giang_vien`
--

DROP TABLE IF EXISTS `bomon_ds_giang_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bomon_ds_giang_vien` (
  `bo_mon_id` int NOT NULL,
  `ds_giang_vien_id` int NOT NULL,
  `ds_giang_vien_order` int NOT NULL,
  PRIMARY KEY (`bo_mon_id`,`ds_giang_vien_order`),
  UNIQUE KEY `UK_ibmj3wva9yjdne3yuubblyqno` (`ds_giang_vien_id`),
  CONSTRAINT `FKbfj0sn0wlmoqtcw584rhf9v2a` FOREIGN KEY (`ds_giang_vien_id`) REFERENCES `thanhvien` (`id`),
  CONSTRAINT `FKq978bh729bisqlmhjhdgvwtb7` FOREIGN KEY (`bo_mon_id`) REFERENCES `bomon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bomon_ds_giang_vien`
--

LOCK TABLES `bomon_ds_giang_vien` WRITE;
/*!40000 ALTER TABLE `bomon_ds_giang_vien` DISABLE KEYS */;
/*!40000 ALTER TABLE `bomon_ds_giang_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diachi`
--

DROP TABLE IF EXISTS `diachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diachi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sonha` varchar(50) DEFAULT NULL,
  `toanha` varchar(50) DEFAULT NULL,
  `xompho` varchar(50) DEFAULT NULL,
  `phuongxa` varchar(50) DEFAULT NULL,
  `quanhuyen` varchar(50) DEFAULT NULL,
  `tinhthanh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diachi`
--

LOCK TABLES `diachi` WRITE;
/*!40000 ALTER TABLE `diachi` DISABLE KEYS */;
INSERT INTO `diachi` VALUES (1,'27','Nguyễn Đức Cảnh','Hoàng Văn Thụ','Trương Định','Hoàng Mai','Hà Nội');
/*!40000 ALTER TABLE `diachi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giangvienkhoa`
--

DROP TABLE IF EXISTS `giangvienkhoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giangvienkhoa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `k_id` int DEFAULT NULL,
  `giangvienid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khoaid` (`k_id`),
  KEY `giangvienid` (`giangvienid`),
  CONSTRAINT `giangvienkhoa_ibfk_1` FOREIGN KEY (`k_id`) REFERENCES `khoa` (`id`),
  CONSTRAINT `giangvienkhoa_ibfk_2` FOREIGN KEY (`giangvienid`) REFERENCES `thanhvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giangvienkhoa`
--

LOCK TABLES `giangvienkhoa` WRITE;
/*!40000 ALTER TABLE `giangvienkhoa` DISABLE KEYS */;
INSERT INTO `giangvienkhoa` VALUES (1,1,1),(2,2,2),(3,3,3),(4,1,4),(5,2,5),(6,3,6);
/*!40000 ALTER TABLE `giangvienkhoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (4);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocky`
--

DROP TABLE IF EXISTS `hocky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hocky` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocky`
--

LOCK TABLES `hocky` WRITE;
/*!40000 ALTER TABLE `hocky` DISABLE KEYS */;
INSERT INTO `hocky` VALUES (1,'Học kỳ 1',''),(2,'Học kỳ 2','');
/*!40000 ALTER TABLE `hocky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'CNTT',''),(2,'ATTT',''),(3,'CNĐPT','');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiphoc`
--

DROP TABLE IF EXISTS `kiphoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kiphoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` int DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `lichhocid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lichhocid` (`lichhocid`),
  CONSTRAINT `kiphoc_ibfk_1` FOREIGN KEY (`lichhocid`) REFERENCES `lichhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiphoc`
--

LOCK TABLES `kiphoc` WRITE;
/*!40000 ALTER TABLE `kiphoc` DISABLE KEYS */;
INSERT INTO `kiphoc` VALUES (1,1,NULL,1),(2,2,NULL,1),(3,3,NULL,2),(4,4,NULL,2),(5,5,NULL,3),(6,6,NULL,3),(7,7,NULL,4),(8,8,NULL,4),(9,1,NULL,5),(10,2,NULL,5),(11,3,NULL,6),(12,4,NULL,6),(13,5,NULL,7),(14,6,NULL,7),(15,7,NULL,8),(16,8,NULL,8),(17,1,NULL,9),(18,2,NULL,9),(19,3,NULL,10),(20,4,NULL,10),(21,5,NULL,11),(22,6,NULL,11),(23,7,NULL,12),(24,8,NULL,12),(25,1,NULL,13),(26,2,NULL,13),(27,3,NULL,14),(28,4,NULL,14),(29,5,NULL,15),(30,6,NULL,15),(31,7,NULL,16),(32,8,NULL,16),(33,1,NULL,17),(34,2,NULL,17),(35,3,NULL,18),(36,4,NULL,18),(37,5,NULL,19),(38,6,NULL,19),(39,7,NULL,20),(40,8,NULL,20),(41,1,NULL,21),(42,2,NULL,21),(43,3,NULL,22),(44,4,NULL,22),(45,5,NULL,23),(46,6,NULL,23),(47,7,NULL,24),(48,8,NULL,24),(49,1,NULL,25),(50,2,NULL,25),(51,1,NULL,26),(52,2,NULL,26),(53,3,NULL,27),(54,4,NULL,27),(55,5,NULL,28),(56,6,NULL,28),(57,7,NULL,29),(58,8,NULL,29),(59,1,NULL,30),(60,2,NULL,30),(61,3,NULL,31),(62,4,NULL,31),(63,5,NULL,32),(64,6,NULL,32),(65,7,NULL,33),(66,8,NULL,33),(67,1,NULL,34),(68,2,NULL,34),(69,3,NULL,35),(70,4,NULL,35),(71,5,NULL,36),(72,6,NULL,36),(73,7,NULL,37),(74,8,NULL,37),(75,1,NULL,38),(76,2,NULL,38),(77,3,NULL,39),(78,4,NULL,39),(79,5,NULL,40),(80,6,NULL,40),(81,7,NULL,41),(82,8,NULL,41),(83,1,NULL,42),(84,2,NULL,42),(85,3,NULL,43),(86,4,NULL,43),(87,5,NULL,44),(88,6,NULL,44),(89,7,NULL,45),(90,8,NULL,45),(91,1,NULL,46),(92,2,NULL,46),(93,3,NULL,47),(94,4,NULL,47),(95,5,NULL,48),(96,6,NULL,48),(97,7,NULL,49),(98,8,NULL,49),(99,1,NULL,50),(100,2,NULL,50),(101,3,NULL,51),(102,4,NULL,51),(103,5,NULL,52),(104,6,NULL,52),(105,7,NULL,53),(106,8,NULL,53),(107,1,NULL,54),(108,2,NULL,54),(109,3,NULL,55),(110,4,NULL,55),(111,5,NULL,56),(112,6,NULL,56),(113,7,NULL,57),(114,8,NULL,57),(115,1,NULL,58),(116,2,NULL,58),(117,3,NULL,59),(118,4,NULL,59),(119,5,NULL,60),(120,6,NULL,60),(121,7,NULL,61),(122,8,NULL,61),(123,1,NULL,62),(124,2,NULL,62),(125,3,NULL,63),(126,4,NULL,63),(127,5,NULL,64),(128,6,NULL,64),(129,7,NULL,65),(130,8,NULL,65),(131,1,NULL,66),(132,2,NULL,66),(133,3,NULL,67),(134,4,NULL,67),(135,5,NULL,68),(136,6,NULL,68),(137,7,NULL,69),(138,8,NULL,69),(139,1,NULL,70),(140,2,NULL,70),(141,3,NULL,71),(142,4,NULL,71),(143,5,NULL,72),(144,6,NULL,72),(145,7,NULL,73),(146,8,NULL,73),(147,1,NULL,74),(148,2,NULL,74),(149,3,NULL,75),(150,4,NULL,75),(151,5,NULL,76),(152,6,NULL,76),(153,7,NULL,77),(154,8,NULL,77),(155,1,NULL,78),(156,2,NULL,78),(157,3,NULL,79),(158,4,NULL,79),(159,5,NULL,80),(160,6,NULL,80),(161,7,NULL,81),(162,8,NULL,81),(163,1,NULL,82),(164,2,NULL,82),(165,3,NULL,83),(166,4,NULL,83),(167,5,NULL,84),(168,6,NULL,84),(169,7,NULL,85),(170,8,NULL,85),(171,1,NULL,86),(172,2,NULL,86),(173,3,NULL,87),(174,4,NULL,87),(175,5,NULL,88),(176,6,NULL,88),(177,7,NULL,89),(178,8,NULL,89),(179,1,NULL,90),(180,2,NULL,90),(181,3,NULL,91),(182,4,NULL,91),(183,5,NULL,92),(184,6,NULL,92),(185,7,NULL,93),(186,8,NULL,93),(187,1,NULL,94),(188,2,NULL,94),(189,3,NULL,95),(190,4,NULL,95);
/*!40000 ALTER TABLE `kiphoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kyhoc`
--

DROP TABLE IF EXISTS `kyhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kyhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `namhocid` int DEFAULT NULL,
  `hockyid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `namhocid` (`namhocid`),
  KEY `hockyid` (`hockyid`),
  CONSTRAINT `kyhoc_ibfk_1` FOREIGN KEY (`namhocid`) REFERENCES `namhoc` (`id`),
  CONSTRAINT `kyhoc_ibfk_2` FOREIGN KEY (`hockyid`) REFERENCES `hocky` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kyhoc`
--

LOCK TABLES `kyhoc` WRITE;
/*!40000 ALTER TABLE `kyhoc` DISABLE KEYS */;
INSERT INTO `kyhoc` VALUES (1,4,1),(2,4,2);
/*!40000 ALTER TABLE `kyhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lichhoc`
--

DROP TABLE IF EXISTS `lichhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lichhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `lhpid` int DEFAULT NULL,
  `phong` varchar(10) DEFAULT NULL,
  `nhomth` int DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `giangvienid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lhpid` (`lhpid`),
  KEY `giangvienid` (`giangvienid`),
  CONSTRAINT `lichhoc_ibfk_1` FOREIGN KEY (`lhpid`) REFERENCES `lophocphan` (`id`),
  CONSTRAINT `lichhoc_ibfk_5` FOREIGN KEY (`giangvienid`) REFERENCES `thanhvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichhoc`
--

LOCK TABLES `lichhoc` WRITE;
/*!40000 ALTER TABLE `lichhoc` DISABLE KEYS */;
INSERT INTO `lichhoc` VALUES (1,'Nhập môn công nghệ phần mềm',1,'203-A3',1,'Hoc som',4),(2,'Nhập môn công nghệ phần mềm',2,'203-A3',1,'Hoc som',NULL),(3,'Nhập môn công nghệ phần mềm',3,'203-A3',1,'Hoc som',NULL),(4,'Nhập môn công nghệ phần mềm',4,'203-A3',1,'Hoc som',NULL),(5,'Nhập môn công nghệ phần mềm',5,'203-A3',1,'Hoc som',NULL),(6,'Các hệ thống phân tán',6,'502-A2',1,'Hoc som',NULL),(7,'Các hệ thống phân tán',7,'502-A2',1,'Hoc som',NULL),(8,'Các hệ thống phân tán',8,'502-A2',1,'Hoc som',1),(9,'Các hệ thống phân tán',9,'502-A2',1,'Hoc som',NULL),(10,'Các hệ thống phân tán',10,'502-A2',1,'Hoc som',NULL),(11,'Cơ sở dữ liệu phân tán',11,'103-A2',1,'Hoc som',1),(12,'Cơ sở dữ liệu phân tán',12,'103-A2',1,'Hoc som',4),(13,'Cơ sở dữ liệu phân tán',13,'103-A2',1,'Hoc som',4),(14,'Cơ sở dữ liệu phân tán',14,'103-A2',1,'Hoc som',NULL),(15,'Cơ sở dữ liệu phân tán',15,'103-A2',1,'Hoc som',NULL),(16,'Chuyên đề công nghệ phần mềm',16,'102-A2',1,'Hoc som',NULL),(17,'Chuyên đề công nghệ phần mềm',17,'102-A2',1,'Hoc som',1),(18,'Chuyên đề công nghệ phần mềm',18,'102-A2',1,'Hoc som',NULL),(19,'Chuyên đề công nghệ phần mềm',19,'102-A2',1,'Hoc som',NULL),(20,'Chuyên đề công nghệ phần mềm',20,'102-A2',1,'Hoc som',NULL),(21,'Lập trình hệ thống nhúng',21,'505-A2',1,'Hoc som',NULL),(22,'Lập trình hệ thống nhúng',22,'505-A2',1,'Hoc som',NULL),(23,'Lập trình hệ thống nhúng',23,'505-A2',1,'Hoc som',NULL),(24,'Lập trình hệ thống nhúng',24,'505-A2',1,'Hoc som',NULL),(25,'Lập trình hệ thống nhúng',25,'505-A2',1,'Hoc som',NULL),(26,'Nhập môn trí tuệ nhân tạo',26,'503-A2',1,'Hoc som',NULL),(27,'Nhập môn trí tuệ nhân tạo',27,'503-A2',1,'Hoc som',NULL),(28,'Nhập môn trí tuệ nhân tạo',28,'503-A2',1,'Hoc som',NULL),(29,'Nhập môn trí tuệ nhân tạo',29,'503-A2',1,'Hoc som',NULL),(30,'Nhập môn trí tuệ nhân tạo',30,'503-A2',1,'Hoc som',NULL),(31,'Nhập môn tương tác người - máy',31,'205-A3',1,'Hoc som',NULL),(32,'Nhập môn tương tác người - máy',32,'205-A3',1,'Hoc som',NULL),(33,'Nhập môn tương tác người - máy',33,'205-A3',1,'Hoc som',NULL),(34,'Nhập môn tương tác người - máy',34,'205-A3',1,'Hoc som',NULL),(35,'Nhập môn tương tác người - máy',35,'205-A3',1,'Hoc som',NULL),(36,'Cơ sở dữ liệu phân tán',36,'401-A2',1,'Hoc som',NULL),(37,'Cơ sở dữ liệu phân tán',37,'401-A2',1,'Hoc som',NULL),(38,'Cơ sở dữ liệu phân tán',38,'401-A2',1,'Hoc som',NULL),(39,'Cơ sở dữ liệu phân tán',39,'401-A2',1,'Hoc som',NULL),(40,'Cơ sở dữ liệu phân tán',40,'401-A2',1,'Hoc som',NULL),(41,'An toàn và bảo mật hệ thống cơ',41,'301-A2',1,'Hoc som',NULL),(42,'An toàn và bảo mật hệ thống cơ',42,'301-A2',1,'Hoc som',2),(43,'An toàn và bảo mật hệ thống cơ',43,'301-A2',1,'Hoc som',NULL),(44,'An toàn và bảo mật hệ thống cơ',44,'301-A2',1,'Hoc som',NULL),(45,'An toàn và bảo mật hệ thống cơ',45,'301-A2',1,'Hoc som',NULL),(46,'Bảo mật cơ sở dữ liệu',46,'303-A3',1,'Hoc som',NULL),(47,'Bảo mật cơ sở dữ liệu',47,'303-A3',1,'Hoc som',NULL),(48,'Bảo mật cơ sở dữ liệu',48,'303-A3',1,'Hoc som',NULL),(49,'Bảo mật cơ sở dữ liệu',49,'303-A3',1,'Hoc som',NULL),(50,'Bảo mật cơ sở dữ liệu',50,'303-A3',1,'Hoc som',NULL),(51,'Ngăn chặn tấn công SQL Injecti',51,'502-A2',1,'Hoc som',2),(52,'Ngăn chặn tấn công SQL Injecti',52,'502-A2',1,'Hoc som',2),(53,'Ngăn chặn tấn công SQL Injecti',53,'502-A2',1,'Hoc som',NULL),(54,'Ngăn chặn tấn công SQL Injecti',54,'502-A2',1,'Hoc som',NULL),(55,'Ngăn chặn tấn công SQL Injecti',55,'502-A2',1,'Hoc som',NULL),(56,'DDOS và các vấn đề liên quan',56,'402-A2',1,'Hoc som',NULL),(57,'DDOS và các vấn đề liên quan',57,'402-A2',1,'Hoc som',NULL),(58,'DDOS và các vấn đề liên quan',58,'402-A2',1,'Hoc som',NULL),(59,'DDOS và các vấn đề liên quan',59,'402-A2',1,'Hoc som',NULL),(60,'DDOS và các vấn đề liên quan',60,'402-A2',1,'Hoc som',NULL),(61,'Tìm hiểu và xử lý lỗ hổng hệ t',61,'205-A3',1,'Hoc som',NULL),(62,'Tìm hiểu và xử lý lỗ hổng hệ t',62,'205-A3',1,'Hoc som',NULL),(63,'Tìm hiểu và xử lý lỗ hổng hệ t',63,'205-A3',1,'Hoc som',NULL),(64,'Tìm hiểu và xử lý lỗ hổng hệ t',64,'205-A3',1,'Hoc som',NULL),(65,'Tìm hiểu và xử lý lỗ hổng hệ t',65,'205-A3',1,'Hoc som',NULL),(66,'Nhập môn dữ liệu đa phương tiệ',66,'A2',1,'Hoc som',NULL),(67,'Nhập môn dữ liệu đa phương tiệ',67,'A2',1,'Hoc som',NULL),(68,'Nhập môn dữ liệu đa phương tiệ',68,'A2',1,'Hoc som',NULL),(69,'Nhập môn dữ liệu đa phương tiệ',69,'A2',1,'Hoc som',NULL),(70,'Nhập môn dữ liệu đa phương tiệ',70,'A2',1,'Hoc som',NULL),(71,'Thao tác với dữ liệu đa phương',71,'A2',1,'Hoc som',NULL),(72,'Thao tác với dữ liệu đa phương',72,'A2',1,'Hoc som',NULL),(73,'Thao tác với dữ liệu đa phương',73,'A2',1,'Hoc som',NULL),(74,'Thao tác với dữ liệu đa phương',74,'A2',1,'Hoc som',NULL),(75,'Thao tác với dữ liệu đa phương',75,'A2',1,'Hoc som',NULL),(76,'Chuyên đề công nghệ đa phương ',76,'A2',1,'Hoc som',NULL),(77,'Chuyên đề công nghệ đa phương ',77,'A2',1,'Hoc som',NULL),(78,'Chuyên đề công nghệ đa phương ',78,'A2',1,'Hoc som',NULL),(79,'Chuyên đề công nghệ đa phương ',79,'A2',1,'Hoc som',NULL),(80,'Chuyên đề công nghệ đa phương ',80,'A2',1,'Hoc som',NULL),(81,'Nhập môn lập trình game',81,'A2',1,'Hoc som',NULL),(82,'Nhập môn lập trình game',82,'A2',1,'Hoc som',NULL),(83,'Nhập môn lập trình game',83,'A2',1,'Hoc som',NULL),(84,'Nhập môn lập trình game',84,'A2',1,'Hoc som',NULL),(85,'Nhập môn lập trình game',85,'A2',1,'Hoc som',NULL),(86,'Công nghệ phát triển game',86,'A2',1,'Hoc som',NULL),(87,'Công nghệ phát triển game',87,'A2',1,'Hoc som',NULL),(88,'Công nghệ phát triển game',88,'A2',1,'Hoc som',NULL),(89,'Công nghệ phát triển game',89,'A2',1,'Hoc som',NULL),(90,'Công nghệ phát triển game',90,'A2',1,'Hoc som',NULL),(91,'Công nghệ thực tế ảo',91,'A2',1,'Hoc som',NULL),(92,'Công nghệ thực tế ảo',92,'A2',1,'Hoc som',NULL),(93,'Công nghệ thực tế ảo',93,'A2',1,'Hoc som',NULL),(94,'Công nghệ thực tế ảo',94,'A2',1,'Hoc som',NULL),(95,'Công nghệ thực tế ảo',95,'A2',1,'Hoc som',NULL);
/*!40000 ALTER TABLE `lichhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lophocphan`
--

DROP TABLE IF EXISTS `lophocphan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lophocphan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `sisotoida` int DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `monhockyhocid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monhockyhocid` (`monhockyhocid`),
  CONSTRAINT `lophocphan_ibfk_1` FOREIGN KEY (`monhockyhocid`) REFERENCES `monhockyhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lophocphan`
--

LOCK TABLES `lophocphan` WRITE;
/*!40000 ALTER TABLE `lophocphan` DISABLE KEYS */;
INSERT INTO `lophocphan` VALUES (1,'NMCNPM',50,'',1),(2,'NMCNPM',45,'',1),(3,'NMCNPM',50,'',1),(4,'NMCNPM',50,'',1),(5,'NMCNPM',50,'',1),(6,NULL,50,'ok',2),(7,NULL,50,'ok',2),(8,NULL,50,'ok',2),(9,NULL,50,'ok',2),(10,NULL,50,'ok',2),(11,NULL,50,'ok',3),(12,NULL,50,'ok',3),(13,NULL,50,'ok',3),(14,NULL,50,'ok',3),(15,NULL,50,'ok',3),(16,NULL,50,'ok',4),(17,NULL,50,'ok',4),(18,NULL,50,'ok',4),(19,NULL,50,'ok',4),(20,NULL,50,'ok',4),(21,NULL,50,'ok',5),(22,NULL,50,'ok',5),(23,NULL,50,'ok',5),(24,NULL,50,'ok',5),(25,NULL,50,'ok',5),(26,NULL,50,'ok',6),(27,NULL,50,'ok',6),(28,NULL,50,'ok',6),(29,NULL,50,'ok',6),(30,NULL,50,'ok',6),(31,NULL,50,'ok',7),(32,NULL,50,'ok',7),(33,NULL,50,'ok',7),(34,NULL,50,'ok',7),(35,NULL,50,'ok',7),(36,NULL,50,'ok',8),(37,NULL,50,'ok',8),(38,NULL,50,'ok',8),(39,NULL,50,'ok',8),(40,NULL,50,'ok',8),(41,NULL,50,'ok',9),(42,NULL,50,'ok',9),(43,NULL,50,'ok',9),(44,NULL,50,'ok',9),(45,NULL,50,'ok',9),(46,NULL,50,'ok',10),(47,NULL,50,'ok',10),(48,NULL,50,'ok',10),(49,NULL,50,'ok',10),(50,NULL,50,'ok',10),(51,NULL,50,'ok',11),(52,NULL,50,'ok',11),(53,NULL,50,'ok',11),(54,NULL,50,'ok',11),(55,NULL,50,'ok',11),(56,NULL,50,'ok',12),(57,NULL,50,'ok',12),(58,NULL,50,'ok',12),(59,NULL,50,'ok',12),(60,NULL,50,'ok',12),(61,NULL,50,'ok',13),(62,NULL,50,'ok',13),(63,NULL,50,'ok',13),(64,NULL,50,'ok',13),(65,NULL,50,'ok',13),(66,NULL,50,'ok',14),(67,NULL,50,'ok',14),(68,NULL,50,'ok',14),(69,NULL,50,'ok',14),(70,NULL,50,'ok',14),(71,NULL,50,'ok',15),(72,NULL,50,'ok',15),(73,NULL,50,'ok',15),(74,NULL,50,'ok',15),(75,NULL,50,'ok',15),(76,NULL,50,'ok',16),(77,NULL,50,'ok',16),(78,NULL,50,'ok',16),(79,NULL,50,'ok',16),(80,NULL,50,'ok',16),(81,NULL,50,'ok',17),(82,NULL,50,'ok',17),(83,NULL,50,'ok',17),(84,NULL,50,'ok',17),(85,NULL,50,'ok',17),(86,NULL,50,'ok',18),(87,NULL,50,'ok',18),(88,NULL,50,'ok',18),(89,NULL,50,'ok',18),(90,NULL,50,'ok',18),(91,NULL,50,'ok',19),(92,NULL,50,'ok',19),(93,NULL,50,'ok',19),(94,NULL,50,'ok',19),(95,NULL,50,'ok',19);
/*!40000 ALTER TABLE `lophocphan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) DEFAULT NULL,
  `sotc` int DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `bomonid` int DEFAULT NULL,
  `ds_mon_hoc_order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bomonid` (`bomonid`),
  CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`bomonid`) REFERENCES `bomon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES (1,'Nhập môn công nghệ phần mềm',3,'Môn chuyên ngành',1,NULL),(2,'Các hệ thống phân tán',3,'Môn chuyên ngành',1,NULL),(3,'Cơ sở dữ liệu phân tán',3,'Môn chuyên ngành',1,NULL),(4,'Chuyên đề công nghệ phần mềm',3,'Môn chuyên ngành',1,NULL),(5,'Lập trình hệ thống nhúng',3,'Môn chuyên ngành',1,NULL),(6,'Nhập môn trí tuệ nhân tạo',3,'Môn chuyên ngành',2,NULL),(7,'Nhập môn tương tác người - máy',3,'Môn chuyên ngành',2,NULL),(8,'Cơ sở dữ liệu phân tán',3,'Môn chuyên ngành',2,NULL),(9,'An toàn và bảo mật hệ thống cơ bản',3,'Môn chuyên ngành',3,NULL),(10,'Bảo mật cơ sở dữ liệu',3,'Môn chuyên ngành',3,NULL),(11,'Ngăn chặn tấn công SQL Injection',3,'Môn chuyên ngành',3,NULL),(12,'DDOS và các vấn đề liên quan',3,'Môn chuyên ngành',4,NULL),(13,'Tìm hiểu và xử lý lỗ hổng hệ thống',3,'Môn chuyên ngành',4,NULL),(14,'Nhập môn dữ liệu đa phương tiện',3,'Môn chuyên ngành',5,NULL),(15,'Thao tác với dữ liệu đa phương tiện',3,'Môn chuyên ngành',5,NULL),(16,'Chuyên đề công nghệ đa phương tiện',3,'Môn chuyên ngành',5,NULL),(17,'Nhập môn lập trình game',3,'Môn chuyên ngành',6,NULL),(18,'Công nghệ phát triển game',3,'Môn chuyên ngành',6,NULL),(19,'Công nghệ thực tế ảo',3,'Môn chuyên ngành',6,NULL);
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhockyhoc`
--

DROP TABLE IF EXISTS `monhockyhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhockyhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monhocid` int DEFAULT NULL,
  `kyhocid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monhocid` (`monhocid`),
  KEY `kyhocid` (`kyhocid`),
  CONSTRAINT `monhockyhoc_ibfk_1` FOREIGN KEY (`monhocid`) REFERENCES `monhoc` (`id`),
  CONSTRAINT `monhockyhoc_ibfk_2` FOREIGN KEY (`kyhocid`) REFERENCES `kyhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhockyhoc`
--

LOCK TABLES `monhockyhoc` WRITE;
/*!40000 ALTER TABLE `monhockyhoc` DISABLE KEYS */;
INSERT INTO `monhockyhoc` VALUES (1,1,2),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,2),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,2),(18,18,2),(19,19,2);
/*!40000 ALTER TABLE `monhockyhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `namhoc`
--

DROP TABLE IF EXISTS `namhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `namhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `namhoc`
--

LOCK TABLES `namhoc` WRITE;
/*!40000 ALTER TABLE `namhoc` DISABLE KEYS */;
INSERT INTO `namhoc` VALUES (1,'2015-2016',''),(2,'2016-2017',''),(3,'2017-2018',''),(4,'2020-2021','');
/*!40000 ALTER TABLE `namhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngayhoc`
--

DROP TABLE IF EXISTS `ngayhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ngayhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` int DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `lichhocid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lichhocid` (`lichhocid`),
  CONSTRAINT `ngayhoc_ibfk_1` FOREIGN KEY (`lichhocid`) REFERENCES `lichhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngayhoc`
--

LOCK TABLES `ngayhoc` WRITE;
/*!40000 ALTER TABLE `ngayhoc` DISABLE KEYS */;
INSERT INTO `ngayhoc` VALUES (1,2,NULL,1),(2,2,NULL,2),(3,2,NULL,3),(4,2,NULL,4),(5,3,NULL,5),(6,3,NULL,6),(7,3,NULL,7),(8,3,NULL,8),(9,4,NULL,9),(10,4,NULL,10),(11,4,NULL,11),(12,4,NULL,12),(13,5,NULL,13),(14,5,NULL,14),(15,5,NULL,15),(16,5,NULL,16),(17,6,NULL,17),(18,6,NULL,18),(19,6,NULL,19),(20,6,NULL,20),(21,7,NULL,21),(22,7,NULL,22),(23,7,NULL,23),(24,7,NULL,24),(25,7,NULL,25),(26,2,NULL,26),(27,3,NULL,27),(28,4,NULL,28),(29,5,NULL,29),(30,6,NULL,30),(31,7,NULL,31),(32,2,NULL,32),(33,3,NULL,33),(34,4,NULL,34),(35,5,NULL,35),(36,6,NULL,36),(37,7,NULL,37),(38,2,NULL,38),(39,3,NULL,39),(40,4,NULL,40),(41,5,NULL,41),(42,6,NULL,42),(43,7,NULL,43),(44,2,NULL,44),(45,3,NULL,45),(46,4,NULL,46),(47,5,NULL,47),(48,6,NULL,48),(49,7,NULL,49),(50,2,NULL,50),(51,3,NULL,51),(52,4,NULL,52),(53,5,NULL,53),(54,6,NULL,54),(55,7,NULL,55),(56,2,NULL,56),(57,3,NULL,57),(58,4,NULL,58),(59,5,NULL,59),(60,6,NULL,60),(61,7,NULL,61),(62,2,NULL,62),(63,3,NULL,63),(64,4,NULL,64),(65,5,NULL,65),(66,6,NULL,66),(67,7,NULL,67),(68,2,NULL,68),(69,3,NULL,69),(70,4,NULL,70),(71,5,NULL,71),(72,6,NULL,72),(73,7,NULL,73),(74,2,NULL,74),(75,3,NULL,75),(76,4,NULL,76),(77,5,NULL,77),(78,6,NULL,78),(79,7,NULL,79),(80,2,NULL,80),(81,3,NULL,81),(82,4,NULL,82),(83,5,NULL,83),(84,6,NULL,84),(85,7,NULL,85),(86,2,NULL,86),(87,3,NULL,87),(88,4,NULL,88),(89,5,NULL,89),(90,6,NULL,90),(91,7,NULL,91),(92,2,NULL,92),(93,3,NULL,93),(94,4,NULL,94),(95,5,NULL,95);
/*!40000 ALTER TABLE `ngayhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanhvien`
--

DROP TABLE IF EXISTS `thanhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanhvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dt` varchar(15) DEFAULT NULL,
  `ghichu` varchar(100) DEFAULT NULL,
  `vitri` varchar(15) DEFAULT NULL,
  `ho` varchar(10) DEFAULT NULL,
  `dem` varchar(10) DEFAULT NULL,
  `ten` varchar(10) DEFAULT NULL,
  `diachiid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKaqvl11qr32f5irlamc30ejhpc` (`username`),
  UNIQUE KEY `UK2a17y6sc1lnme5t0wn6bthpci` (`email`),
  KEY `diachiid` (`diachiid`),
  CONSTRAINT `thanhvien_ibfk_1` FOREIGN KEY (`diachiid`) REFERENCES `diachi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhvien`
--

LOCK TABLES `thanhvien` WRITE;
/*!40000 ALTER TABLE `thanhvien` DISABLE KEYS */;
INSERT INTO `thanhvien` VALUES (1,'thangCNTT','$2a$10$smbNcf.fuTOOfkdeV5VbEOstMpw45ee6Fpg7HDFIIE6o3wX9KExDa','1999-05-01','thang@123.com','0337971060','ghichu','giangvien','thang','thang','thang',NULL),(2,'thangATTT','$2a$10$3QOc.89PGPg/hsJqjMa0JO5SNHEVU2hlXxbqD/S.IdN9yitMpkGkm','1999-05-01','thangATTT@123.com','0337971060','ghichu','giangvien','thang','thang','thang',NULL),(3,'thangCNDPT','$2a$10$8/KVe4gK/n975iFDAlP6UeeCnRj0tBAFHTKPSk4BWtrDTf.8R25z.','1999-05-01','thangCNDPT@123.com','0337971060','ghichu','giangvien','thang','thang','thang',NULL),(4,'thangCNTT2','$2a$10$XECMK.HPrVb8xyqHBfeoJ.X7dy6ytd267TPanXOv3vA9B8KmLblGC','1999-05-01','thangnguyen@gmail.com','0337971060','ghichu','giangvien','thang','thang','thang',NULL),(5,'thangCNDPT2','$2a$10$/Qo6x1o42QVBtvdgGNF9VuKmP9AH1VUjebSPywJnuTNu0qV3cHtai','1999-05-01','thangnguyencndpt2@gmail.com','0337971060','ghichu','giangvien','thang','thang','thang',NULL),(6,'thangATTT2','$2a$10$qnBQk.xlVkK5tYEOLyyt9u602fyr/GJmyHBgk3KtHHSwVbA2/4XAK','1999-05-01','thangnguyenattt2@gmail.com','0337971060','ghichu','giangvien','thang','thang','thang',NULL);
/*!40000 ALTER TABLE `thanhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuanhoc`
--

DROP TABLE IF EXISTS `tuanhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuanhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` int DEFAULT NULL,
  `mota` varchar(30) DEFAULT NULL,
  `lichhocid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lichhocid` (`lichhocid`),
  CONSTRAINT `tuanhoc_ibfk_1` FOREIGN KEY (`lichhocid`) REFERENCES `lichhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1603 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuanhoc`
--

LOCK TABLES `tuanhoc` WRITE;
/*!40000 ALTER TABLE `tuanhoc` DISABLE KEYS */;
INSERT INTO `tuanhoc` VALUES (1,1,NULL,1),(2,2,NULL,1),(3,3,NULL,1),(4,4,NULL,1),(5,5,NULL,1),(6,6,NULL,1),(7,7,NULL,1),(8,8,NULL,1),(9,9,NULL,1),(10,10,NULL,1),(11,11,NULL,1),(12,12,NULL,1),(13,13,NULL,1),(14,14,NULL,1),(15,15,NULL,1),(16,16,NULL,1),(17,1,NULL,2),(18,2,NULL,2),(19,3,NULL,2),(20,4,NULL,2),(21,5,NULL,2),(22,6,NULL,2),(23,7,NULL,2),(24,8,NULL,2),(25,9,NULL,2),(26,10,NULL,2),(27,11,NULL,2),(28,12,NULL,2),(29,13,NULL,2),(30,14,NULL,2),(31,15,NULL,2),(32,16,NULL,2),(33,1,NULL,3),(34,2,NULL,3),(35,3,NULL,3),(36,4,NULL,3),(37,5,NULL,3),(38,6,NULL,3),(39,7,NULL,3),(40,8,NULL,3),(41,9,NULL,3),(42,10,NULL,3),(43,11,NULL,3),(44,12,NULL,3),(45,13,NULL,3),(47,15,NULL,3),(48,16,NULL,3),(49,1,NULL,4),(50,2,NULL,4),(51,3,NULL,4),(52,4,NULL,4),(53,5,NULL,4),(54,6,NULL,4),(55,7,NULL,4),(56,8,NULL,4),(57,9,NULL,4),(58,10,NULL,4),(59,11,NULL,4),(60,12,NULL,4),(61,13,NULL,4),(62,14,NULL,4),(63,15,NULL,4),(64,16,NULL,4),(147,1,NULL,5),(148,2,NULL,5),(149,3,NULL,5),(150,4,NULL,5),(151,5,NULL,5),(152,6,NULL,5),(153,7,NULL,5),(154,8,NULL,5),(155,9,NULL,5),(156,10,NULL,5),(157,11,NULL,5),(158,12,NULL,5),(159,13,NULL,5),(160,14,NULL,5),(161,15,NULL,5),(162,16,NULL,5),(163,1,NULL,6),(164,2,NULL,6),(165,3,NULL,6),(166,4,NULL,6),(167,5,NULL,6),(168,6,NULL,6),(169,7,NULL,6),(170,8,NULL,6),(171,9,NULL,6),(172,10,NULL,6),(173,11,NULL,6),(174,12,NULL,6),(175,13,NULL,6),(176,14,NULL,6),(177,15,NULL,6),(178,16,NULL,6),(179,1,NULL,7),(180,2,NULL,7),(181,3,NULL,7),(182,4,NULL,7),(183,5,NULL,7),(184,6,NULL,7),(185,7,NULL,7),(186,8,NULL,7),(187,9,NULL,7),(188,10,NULL,7),(189,11,NULL,7),(190,12,NULL,7),(191,13,NULL,7),(192,14,NULL,7),(193,15,NULL,7),(194,16,NULL,7),(195,1,NULL,8),(196,2,NULL,8),(197,3,NULL,8),(198,4,NULL,8),(199,5,NULL,8),(200,6,NULL,8),(201,7,NULL,8),(202,8,NULL,8),(203,9,NULL,8),(204,10,NULL,8),(205,11,NULL,8),(206,12,NULL,8),(207,13,NULL,8),(208,14,NULL,8),(209,15,NULL,8),(210,16,NULL,8),(211,1,NULL,9),(212,2,NULL,9),(213,3,NULL,9),(214,4,NULL,9),(215,5,NULL,9),(216,6,NULL,9),(217,7,NULL,9),(218,8,NULL,9),(219,9,NULL,9),(220,10,NULL,9),(221,11,NULL,9),(222,12,NULL,9),(223,13,NULL,9),(224,14,NULL,9),(225,15,NULL,9),(226,16,NULL,9),(227,1,NULL,10),(228,2,NULL,10),(229,3,NULL,10),(230,4,NULL,10),(231,5,NULL,10),(232,6,NULL,10),(233,7,NULL,10),(234,8,NULL,10),(235,9,NULL,10),(236,10,NULL,10),(237,11,NULL,10),(238,12,NULL,10),(239,13,NULL,10),(240,14,NULL,10),(241,15,NULL,10),(242,16,NULL,10),(243,1,NULL,11),(244,2,NULL,11),(245,3,NULL,11),(246,4,NULL,11),(247,5,NULL,11),(248,6,NULL,11),(249,7,NULL,11),(250,8,NULL,11),(251,9,NULL,11),(252,10,NULL,11),(253,11,NULL,11),(254,12,NULL,11),(255,13,NULL,11),(256,14,NULL,11),(257,15,NULL,11),(258,16,NULL,11),(259,1,NULL,12),(260,2,NULL,12),(261,3,NULL,12),(262,4,NULL,12),(263,5,NULL,12),(264,6,NULL,12),(265,7,NULL,12),(266,8,NULL,12),(267,9,NULL,12),(268,10,NULL,12),(269,11,NULL,12),(270,12,NULL,12),(271,13,NULL,12),(272,14,NULL,12),(273,15,NULL,12),(274,16,NULL,12),(275,1,NULL,13),(276,2,NULL,13),(277,3,NULL,13),(278,4,NULL,13),(279,5,NULL,13),(280,6,NULL,13),(281,7,NULL,13),(282,8,NULL,13),(283,9,NULL,13),(284,10,NULL,13),(285,11,NULL,13),(286,12,NULL,13),(287,13,NULL,13),(288,14,NULL,13),(289,15,NULL,13),(290,16,NULL,13),(291,1,NULL,14),(292,2,NULL,14),(293,3,NULL,14),(294,4,NULL,14),(295,5,NULL,14),(296,6,NULL,14),(297,7,NULL,14),(298,8,NULL,14),(299,9,NULL,14),(300,10,NULL,14),(301,11,NULL,14),(302,12,NULL,14),(303,13,NULL,14),(304,14,NULL,14),(305,15,NULL,14),(306,16,NULL,14),(307,1,NULL,15),(308,2,NULL,15),(309,3,NULL,15),(310,4,NULL,15),(311,5,NULL,15),(312,6,NULL,15),(313,7,NULL,15),(314,8,NULL,15),(315,9,NULL,15),(316,10,NULL,15),(317,11,NULL,15),(318,12,NULL,15),(319,13,NULL,15),(320,14,NULL,15),(321,15,NULL,15),(322,16,NULL,15),(323,1,NULL,16),(324,2,NULL,16),(325,3,NULL,16),(326,4,NULL,16),(327,5,NULL,16),(328,6,NULL,16),(329,7,NULL,16),(330,8,NULL,16),(331,9,NULL,16),(332,10,NULL,16),(333,11,NULL,16),(334,12,NULL,16),(335,13,NULL,16),(336,14,NULL,16),(337,15,NULL,16),(338,16,NULL,16),(339,1,NULL,17),(340,2,NULL,17),(341,3,NULL,17),(342,4,NULL,17),(343,5,NULL,17),(344,6,NULL,17),(345,7,NULL,17),(346,8,NULL,17),(347,9,NULL,17),(348,10,NULL,17),(349,11,NULL,17),(350,12,NULL,17),(351,13,NULL,17),(352,14,NULL,17),(353,15,NULL,17),(354,16,NULL,17),(355,1,NULL,18),(356,2,NULL,18),(357,3,NULL,18),(358,4,NULL,18),(359,5,NULL,18),(360,6,NULL,18),(361,7,NULL,18),(362,8,NULL,18),(363,9,NULL,18),(364,10,NULL,18),(365,11,NULL,18),(366,12,NULL,18),(367,13,NULL,18),(368,14,NULL,18),(369,15,NULL,18),(370,16,NULL,18),(371,1,NULL,19),(372,2,NULL,19),(373,3,NULL,19),(374,4,NULL,19),(375,5,NULL,19),(376,6,NULL,19),(377,7,NULL,19),(378,8,NULL,19),(379,9,NULL,19),(380,10,NULL,19),(381,11,NULL,19),(382,12,NULL,19),(383,13,NULL,19),(384,14,NULL,19),(385,15,NULL,19),(386,16,NULL,19),(387,1,NULL,20),(388,2,NULL,20),(389,3,NULL,20),(390,4,NULL,20),(391,5,NULL,20),(392,6,NULL,20),(393,7,NULL,20),(394,8,NULL,20),(395,9,NULL,20),(396,10,NULL,20),(397,11,NULL,20),(398,12,NULL,20),(399,13,NULL,20),(400,14,NULL,20),(401,15,NULL,20),(402,16,NULL,20),(403,1,NULL,21),(404,2,NULL,21),(405,3,NULL,21),(406,4,NULL,21),(407,5,NULL,21),(408,6,NULL,21),(409,7,NULL,21),(410,8,NULL,21),(411,9,NULL,21),(412,10,NULL,21),(413,11,NULL,21),(414,12,NULL,21),(415,13,NULL,21),(416,14,NULL,21),(417,15,NULL,21),(418,16,NULL,21),(419,1,NULL,22),(420,2,NULL,22),(421,3,NULL,22),(422,4,NULL,22),(423,5,NULL,22),(424,6,NULL,22),(425,7,NULL,22),(426,8,NULL,22),(427,9,NULL,22),(428,10,NULL,22),(429,11,NULL,22),(430,12,NULL,22),(431,13,NULL,22),(432,14,NULL,22),(433,15,NULL,22),(434,16,NULL,22),(435,1,NULL,23),(436,2,NULL,23),(437,3,NULL,23),(438,4,NULL,23),(439,5,NULL,23),(440,6,NULL,23),(441,7,NULL,23),(442,8,NULL,23),(443,9,NULL,23),(444,10,NULL,23),(445,11,NULL,23),(446,12,NULL,23),(447,13,NULL,23),(448,14,NULL,23),(449,15,NULL,23),(450,16,NULL,23),(451,1,NULL,24),(452,2,NULL,24),(453,3,NULL,24),(454,4,NULL,24),(455,5,NULL,24),(456,6,NULL,24),(457,7,NULL,24),(458,8,NULL,24),(459,9,NULL,24),(460,10,NULL,24),(461,11,NULL,24),(462,12,NULL,24),(463,13,NULL,24),(464,14,NULL,24),(465,15,NULL,24),(466,16,NULL,24),(467,1,NULL,25),(468,2,NULL,25),(469,3,NULL,25),(470,4,NULL,25),(471,5,NULL,25),(472,6,NULL,25),(473,7,NULL,25),(474,8,NULL,25),(475,9,NULL,25),(476,10,NULL,25),(477,11,NULL,25),(478,12,NULL,25),(479,13,NULL,25),(480,14,NULL,25),(481,15,NULL,25),(482,16,NULL,25),(483,1,NULL,26),(484,2,NULL,26),(485,3,NULL,26),(486,4,NULL,26),(487,5,NULL,26),(488,6,NULL,26),(489,7,NULL,26),(490,8,NULL,26),(491,9,NULL,26),(492,10,NULL,26),(493,11,NULL,26),(494,12,NULL,26),(495,13,NULL,26),(496,14,NULL,26),(497,15,NULL,26),(498,16,NULL,26),(499,1,NULL,27),(500,2,NULL,27),(501,3,NULL,27),(502,4,NULL,27),(503,5,NULL,27),(504,6,NULL,27),(505,7,NULL,27),(506,8,NULL,27),(507,9,NULL,27),(508,10,NULL,27),(509,11,NULL,27),(510,12,NULL,27),(511,13,NULL,27),(512,14,NULL,27),(513,15,NULL,27),(514,16,NULL,27),(515,1,NULL,28),(516,2,NULL,28),(517,3,NULL,28),(518,4,NULL,28),(519,5,NULL,28),(520,6,NULL,28),(521,7,NULL,28),(522,8,NULL,28),(523,9,NULL,28),(524,10,NULL,28),(525,11,NULL,28),(526,12,NULL,28),(527,13,NULL,28),(528,14,NULL,28),(529,15,NULL,28),(530,16,NULL,28),(531,1,NULL,29),(532,2,NULL,29),(533,3,NULL,29),(534,4,NULL,29),(535,5,NULL,29),(536,6,NULL,29),(537,7,NULL,29),(538,8,NULL,29),(539,9,NULL,29),(540,10,NULL,29),(541,11,NULL,29),(542,12,NULL,29),(543,13,NULL,29),(544,14,NULL,29),(545,15,NULL,29),(546,16,NULL,29),(547,1,NULL,30),(548,2,NULL,30),(549,3,NULL,30),(550,4,NULL,30),(551,5,NULL,30),(552,6,NULL,30),(553,7,NULL,30),(554,8,NULL,30),(555,9,NULL,30),(556,10,NULL,30),(557,11,NULL,30),(558,12,NULL,30),(559,13,NULL,30),(560,14,NULL,30),(561,15,NULL,30),(562,16,NULL,30),(563,1,NULL,31),(564,2,NULL,31),(565,3,NULL,31),(566,4,NULL,31),(567,5,NULL,31),(568,6,NULL,31),(569,7,NULL,31),(570,8,NULL,31),(571,9,NULL,31),(572,10,NULL,31),(573,11,NULL,31),(574,12,NULL,31),(575,13,NULL,31),(576,14,NULL,31),(577,15,NULL,31),(578,16,NULL,31),(579,1,NULL,32),(580,2,NULL,32),(581,3,NULL,32),(582,4,NULL,32),(583,5,NULL,32),(584,6,NULL,32),(585,7,NULL,32),(586,8,NULL,32),(587,9,NULL,32),(588,10,NULL,32),(589,11,NULL,32),(590,12,NULL,32),(591,13,NULL,32),(592,14,NULL,32),(593,15,NULL,32),(594,16,NULL,32),(595,1,NULL,33),(596,2,NULL,33),(597,3,NULL,33),(598,4,NULL,33),(599,5,NULL,33),(600,6,NULL,33),(601,7,NULL,33),(602,8,NULL,33),(603,9,NULL,33),(604,10,NULL,33),(605,11,NULL,33),(606,12,NULL,33),(607,13,NULL,33),(608,14,NULL,33),(609,15,NULL,33),(610,16,NULL,33),(611,1,NULL,34),(612,2,NULL,34),(613,3,NULL,34),(614,4,NULL,34),(615,5,NULL,34),(616,6,NULL,34),(617,7,NULL,34),(618,8,NULL,34),(619,9,NULL,34),(620,10,NULL,34),(621,11,NULL,34),(622,12,NULL,34),(623,13,NULL,34),(624,14,NULL,34),(625,15,NULL,34),(626,16,NULL,34),(627,1,NULL,35),(628,2,NULL,35),(629,3,NULL,35),(630,4,NULL,35),(631,5,NULL,35),(632,6,NULL,35),(633,7,NULL,35),(634,8,NULL,35),(635,9,NULL,35),(636,10,NULL,35),(637,11,NULL,35),(638,12,NULL,35),(639,13,NULL,35),(640,14,NULL,35),(641,15,NULL,35),(642,16,NULL,35),(643,1,NULL,36),(644,2,NULL,36),(645,3,NULL,36),(646,4,NULL,36),(647,5,NULL,36),(648,6,NULL,36),(649,7,NULL,36),(650,8,NULL,36),(651,9,NULL,36),(652,10,NULL,36),(653,11,NULL,36),(654,12,NULL,36),(655,13,NULL,36),(656,14,NULL,36),(657,15,NULL,36),(658,16,NULL,36),(659,1,NULL,37),(660,2,NULL,37),(661,3,NULL,37),(662,4,NULL,37),(663,5,NULL,37),(664,6,NULL,37),(665,7,NULL,37),(666,8,NULL,37),(667,9,NULL,37),(668,10,NULL,37),(669,11,NULL,37),(670,12,NULL,37),(671,13,NULL,37),(672,14,NULL,37),(673,15,NULL,37),(674,16,NULL,37),(675,1,NULL,38),(676,2,NULL,38),(677,3,NULL,38),(678,4,NULL,38),(679,5,NULL,38),(680,6,NULL,38),(681,7,NULL,38),(682,8,NULL,38),(683,9,NULL,38),(684,10,NULL,38),(685,11,NULL,38),(686,12,NULL,38),(687,13,NULL,38),(688,14,NULL,38),(689,15,NULL,38),(690,16,NULL,38),(691,1,NULL,39),(692,2,NULL,39),(693,3,NULL,39),(694,4,NULL,39),(695,5,NULL,39),(696,6,NULL,39),(697,7,NULL,39),(698,8,NULL,39),(699,9,NULL,39),(700,10,NULL,39),(701,11,NULL,39),(702,12,NULL,39),(703,13,NULL,39),(704,14,NULL,39),(705,15,NULL,39),(706,16,NULL,39),(707,1,NULL,40),(708,2,NULL,40),(709,3,NULL,40),(710,4,NULL,40),(711,5,NULL,40),(712,6,NULL,40),(713,7,NULL,40),(714,8,NULL,40),(715,9,NULL,40),(716,10,NULL,40),(717,11,NULL,40),(718,12,NULL,40),(719,13,NULL,40),(720,14,NULL,40),(721,15,NULL,40),(722,16,NULL,40),(723,1,NULL,41),(724,2,NULL,41),(725,3,NULL,41),(726,4,NULL,41),(727,5,NULL,41),(728,6,NULL,41),(729,7,NULL,41),(730,8,NULL,41),(731,9,NULL,41),(732,10,NULL,41),(733,11,NULL,41),(734,12,NULL,41),(735,13,NULL,41),(736,14,NULL,41),(737,15,NULL,41),(738,16,NULL,41),(739,1,NULL,42),(740,2,NULL,42),(741,3,NULL,42),(742,4,NULL,42),(743,5,NULL,42),(744,6,NULL,42),(745,7,NULL,42),(746,8,NULL,42),(747,9,NULL,42),(748,10,NULL,42),(749,11,NULL,42),(750,12,NULL,42),(751,13,NULL,42),(752,14,NULL,42),(753,15,NULL,42),(754,16,NULL,42),(755,1,NULL,43),(756,2,NULL,43),(757,3,NULL,43),(758,4,NULL,43),(759,5,NULL,43),(760,6,NULL,43),(761,7,NULL,43),(762,8,NULL,43),(763,9,NULL,43),(764,10,NULL,43),(765,11,NULL,43),(766,12,NULL,43),(767,13,NULL,43),(768,14,NULL,43),(769,15,NULL,43),(770,16,NULL,43),(771,1,NULL,44),(772,2,NULL,44),(773,3,NULL,44),(774,4,NULL,44),(775,5,NULL,44),(776,6,NULL,44),(777,7,NULL,44),(778,8,NULL,44),(779,9,NULL,44),(780,10,NULL,44),(781,11,NULL,44),(782,12,NULL,44),(783,13,NULL,44),(784,14,NULL,44),(785,15,NULL,44),(786,16,NULL,44),(787,1,NULL,45),(788,2,NULL,45),(789,3,NULL,45),(790,4,NULL,45),(791,5,NULL,45),(792,6,NULL,45),(793,7,NULL,45),(794,8,NULL,45),(795,9,NULL,45),(796,10,NULL,45),(797,11,NULL,45),(798,12,NULL,45),(799,13,NULL,45),(800,14,NULL,45),(801,15,NULL,45),(802,16,NULL,45),(803,1,NULL,46),(804,2,NULL,46),(805,3,NULL,46),(806,4,NULL,46),(807,5,NULL,46),(808,6,NULL,46),(809,7,NULL,46),(810,8,NULL,46),(811,9,NULL,46),(812,10,NULL,46),(813,11,NULL,46),(814,12,NULL,46),(815,13,NULL,46),(816,14,NULL,46),(817,15,NULL,46),(818,16,NULL,46),(819,1,NULL,47),(820,2,NULL,47),(821,3,NULL,47),(822,4,NULL,47),(823,5,NULL,47),(824,6,NULL,47),(825,7,NULL,47),(826,8,NULL,47),(827,9,NULL,47),(828,10,NULL,47),(829,11,NULL,47),(830,12,NULL,47),(831,13,NULL,47),(832,14,NULL,47),(833,15,NULL,47),(834,16,NULL,47),(835,1,NULL,48),(836,2,NULL,48),(837,3,NULL,48),(838,4,NULL,48),(839,5,NULL,48),(840,6,NULL,48),(841,7,NULL,48),(842,8,NULL,48),(843,9,NULL,48),(844,10,NULL,48),(845,11,NULL,48),(846,12,NULL,48),(847,13,NULL,48),(848,14,NULL,48),(849,15,NULL,48),(850,16,NULL,48),(851,1,NULL,49),(852,2,NULL,49),(853,3,NULL,49),(854,4,NULL,49),(855,5,NULL,49),(856,6,NULL,49),(857,7,NULL,49),(858,8,NULL,49),(859,9,NULL,49),(860,10,NULL,49),(861,11,NULL,49),(862,12,NULL,49),(863,13,NULL,49),(864,14,NULL,49),(865,15,NULL,49),(866,16,NULL,49),(867,1,NULL,50),(868,2,NULL,50),(869,3,NULL,50),(870,4,NULL,50),(871,5,NULL,50),(872,6,NULL,50),(873,7,NULL,50),(874,8,NULL,50),(875,9,NULL,50),(876,10,NULL,50),(877,11,NULL,50),(878,12,NULL,50),(879,13,NULL,50),(880,14,NULL,50),(881,15,NULL,50),(882,16,NULL,50),(883,1,NULL,51),(884,2,NULL,51),(885,3,NULL,51),(886,4,NULL,51),(887,5,NULL,51),(888,6,NULL,51),(889,7,NULL,51),(890,8,NULL,51),(891,9,NULL,51),(892,10,NULL,51),(893,11,NULL,51),(894,12,NULL,51),(895,13,NULL,51),(896,14,NULL,51),(897,15,NULL,51),(898,16,NULL,51),(899,1,NULL,52),(900,2,NULL,52),(901,3,NULL,52),(902,4,NULL,52),(903,5,NULL,52),(904,6,NULL,52),(905,7,NULL,52),(906,8,NULL,52),(907,9,NULL,52),(908,10,NULL,52),(909,11,NULL,52),(910,12,NULL,52),(911,13,NULL,52),(912,14,NULL,52),(913,15,NULL,52),(914,16,NULL,52),(915,1,NULL,53),(916,2,NULL,53),(917,3,NULL,53),(918,4,NULL,53),(919,5,NULL,53),(920,6,NULL,53),(921,7,NULL,53),(922,8,NULL,53),(923,9,NULL,53),(924,10,NULL,53),(925,11,NULL,53),(926,12,NULL,53),(927,13,NULL,53),(928,14,NULL,53),(929,15,NULL,53),(930,16,NULL,53),(931,1,NULL,54),(932,2,NULL,54),(933,3,NULL,54),(934,4,NULL,54),(935,5,NULL,54),(936,6,NULL,54),(937,7,NULL,54),(938,8,NULL,54),(939,9,NULL,54),(940,10,NULL,54),(941,11,NULL,54),(942,12,NULL,54),(943,13,NULL,54),(944,14,NULL,54),(945,15,NULL,54),(946,16,NULL,54),(947,1,NULL,55),(948,2,NULL,55),(949,3,NULL,55),(950,4,NULL,55),(951,5,NULL,55),(952,6,NULL,55),(953,7,NULL,55),(954,8,NULL,55),(955,9,NULL,55),(956,10,NULL,55),(957,11,NULL,55),(958,12,NULL,55),(959,13,NULL,55),(960,14,NULL,55),(961,15,NULL,55),(962,16,NULL,55),(963,1,NULL,56),(964,2,NULL,56),(965,3,NULL,56),(966,4,NULL,56),(967,5,NULL,56),(968,6,NULL,56),(969,7,NULL,56),(970,8,NULL,56),(971,9,NULL,56),(972,10,NULL,56),(973,11,NULL,56),(974,12,NULL,56),(975,13,NULL,56),(976,14,NULL,56),(977,15,NULL,56),(978,16,NULL,56),(979,1,NULL,57),(980,2,NULL,57),(981,3,NULL,57),(982,4,NULL,57),(983,5,NULL,57),(984,6,NULL,57),(985,7,NULL,57),(986,8,NULL,57),(987,9,NULL,57),(988,10,NULL,57),(989,11,NULL,57),(990,12,NULL,57),(991,13,NULL,57),(992,14,NULL,57),(993,15,NULL,57),(994,16,NULL,57),(995,1,NULL,58),(996,2,NULL,58),(997,3,NULL,58),(998,4,NULL,58),(999,5,NULL,58),(1000,6,NULL,58),(1001,7,NULL,58),(1002,8,NULL,58),(1003,9,NULL,58),(1004,10,NULL,58),(1005,11,NULL,58),(1006,12,NULL,58),(1007,13,NULL,58),(1008,14,NULL,58),(1009,15,NULL,58),(1010,16,NULL,58),(1011,1,NULL,59),(1012,2,NULL,59),(1013,3,NULL,59),(1014,4,NULL,59),(1015,5,NULL,59),(1016,6,NULL,59),(1017,7,NULL,59),(1018,8,NULL,59),(1019,9,NULL,59),(1020,10,NULL,59),(1021,11,NULL,59),(1022,12,NULL,59),(1023,13,NULL,59),(1024,14,NULL,59),(1025,15,NULL,59),(1026,16,NULL,59),(1027,1,NULL,60),(1028,2,NULL,60),(1029,3,NULL,60),(1030,4,NULL,60),(1031,5,NULL,60),(1032,6,NULL,60),(1033,7,NULL,60),(1034,8,NULL,60),(1035,9,NULL,60),(1036,10,NULL,60),(1037,11,NULL,60),(1038,12,NULL,60),(1039,13,NULL,60),(1040,14,NULL,60),(1041,15,NULL,60),(1042,16,NULL,60),(1043,1,NULL,61),(1044,2,NULL,61),(1045,3,NULL,61),(1046,4,NULL,61),(1047,5,NULL,61),(1048,6,NULL,61),(1049,7,NULL,61),(1050,8,NULL,61),(1051,9,NULL,61),(1052,10,NULL,61),(1053,11,NULL,61),(1054,12,NULL,61),(1055,13,NULL,61),(1056,14,NULL,61),(1057,15,NULL,61),(1058,16,NULL,61),(1059,1,NULL,62),(1060,2,NULL,62),(1061,3,NULL,62),(1062,4,NULL,62),(1063,5,NULL,62),(1064,6,NULL,62),(1065,7,NULL,62),(1066,8,NULL,62),(1067,9,NULL,62),(1068,10,NULL,62),(1069,11,NULL,62),(1070,12,NULL,62),(1071,13,NULL,62),(1072,14,NULL,62),(1073,15,NULL,62),(1074,16,NULL,62),(1075,1,NULL,63),(1076,2,NULL,63),(1077,3,NULL,63),(1078,4,NULL,63),(1079,5,NULL,63),(1080,6,NULL,63),(1081,7,NULL,63),(1082,8,NULL,63),(1083,9,NULL,63),(1084,10,NULL,63),(1085,11,NULL,63),(1086,12,NULL,63),(1087,13,NULL,63),(1088,14,NULL,63),(1089,15,NULL,63),(1090,16,NULL,63),(1091,1,NULL,64),(1092,2,NULL,64),(1093,3,NULL,64),(1094,4,NULL,64),(1095,5,NULL,64),(1096,6,NULL,64),(1097,7,NULL,64),(1098,8,NULL,64),(1099,9,NULL,64),(1100,10,NULL,64),(1101,11,NULL,64),(1102,12,NULL,64),(1103,13,NULL,64),(1104,14,NULL,64),(1105,15,NULL,64),(1106,16,NULL,64),(1107,1,NULL,65),(1108,2,NULL,65),(1109,3,NULL,65),(1110,4,NULL,65),(1111,5,NULL,65),(1112,6,NULL,65),(1113,7,NULL,65),(1114,8,NULL,65),(1115,9,NULL,65),(1116,10,NULL,65),(1117,11,NULL,65),(1118,12,NULL,65),(1119,13,NULL,65),(1120,14,NULL,65),(1121,15,NULL,65),(1122,16,NULL,65),(1123,1,NULL,66),(1124,2,NULL,66),(1125,3,NULL,66),(1126,4,NULL,66),(1127,5,NULL,66),(1128,6,NULL,66),(1129,7,NULL,66),(1130,8,NULL,66),(1131,9,NULL,66),(1132,10,NULL,66),(1133,11,NULL,66),(1134,12,NULL,66),(1135,13,NULL,66),(1136,14,NULL,66),(1137,15,NULL,66),(1138,16,NULL,66),(1139,1,NULL,67),(1140,2,NULL,67),(1141,3,NULL,67),(1142,4,NULL,67),(1143,5,NULL,67),(1144,6,NULL,67),(1145,7,NULL,67),(1146,8,NULL,67),(1147,9,NULL,67),(1148,10,NULL,67),(1149,11,NULL,67),(1150,12,NULL,67),(1151,13,NULL,67),(1152,14,NULL,67),(1153,15,NULL,67),(1154,16,NULL,67),(1155,1,NULL,68),(1156,2,NULL,68),(1157,3,NULL,68),(1158,4,NULL,68),(1159,5,NULL,68),(1160,6,NULL,68),(1161,7,NULL,68),(1162,8,NULL,68),(1163,9,NULL,68),(1164,10,NULL,68),(1165,11,NULL,68),(1166,12,NULL,68),(1167,13,NULL,68),(1168,14,NULL,68),(1169,15,NULL,68),(1170,16,NULL,68),(1171,1,NULL,69),(1172,2,NULL,69),(1173,3,NULL,69),(1174,4,NULL,69),(1175,5,NULL,69),(1176,6,NULL,69),(1177,7,NULL,69),(1178,8,NULL,69),(1179,9,NULL,69),(1180,10,NULL,69),(1181,11,NULL,69),(1182,12,NULL,69),(1183,13,NULL,69),(1184,14,NULL,69),(1185,15,NULL,69),(1186,16,NULL,69),(1187,1,NULL,70),(1188,2,NULL,70),(1189,3,NULL,70),(1190,4,NULL,70),(1191,5,NULL,70),(1192,6,NULL,70),(1193,7,NULL,70),(1194,8,NULL,70),(1195,9,NULL,70),(1196,10,NULL,70),(1197,11,NULL,70),(1198,12,NULL,70),(1199,13,NULL,70),(1200,14,NULL,70),(1201,15,NULL,70),(1202,16,NULL,70),(1203,1,NULL,71),(1204,2,NULL,71),(1205,3,NULL,71),(1206,4,NULL,71),(1207,5,NULL,71),(1208,6,NULL,71),(1209,7,NULL,71),(1210,8,NULL,71),(1211,9,NULL,71),(1212,10,NULL,71),(1213,11,NULL,71),(1214,12,NULL,71),(1215,13,NULL,71),(1216,14,NULL,71),(1217,15,NULL,71),(1218,16,NULL,71),(1219,1,NULL,72),(1220,2,NULL,72),(1221,3,NULL,72),(1222,4,NULL,72),(1223,5,NULL,72),(1224,6,NULL,72),(1225,7,NULL,72),(1226,8,NULL,72),(1227,9,NULL,72),(1228,10,NULL,72),(1229,11,NULL,72),(1230,12,NULL,72),(1231,13,NULL,72),(1232,14,NULL,72),(1233,15,NULL,72),(1234,16,NULL,72),(1235,1,NULL,73),(1236,2,NULL,73),(1237,3,NULL,73),(1238,4,NULL,73),(1239,5,NULL,73),(1240,6,NULL,73),(1241,7,NULL,73),(1242,8,NULL,73),(1243,9,NULL,73),(1244,10,NULL,73),(1245,11,NULL,73),(1246,12,NULL,73),(1247,13,NULL,73),(1248,14,NULL,73),(1249,15,NULL,73),(1250,16,NULL,73),(1251,1,NULL,74),(1252,2,NULL,74),(1253,3,NULL,74),(1254,4,NULL,74),(1255,5,NULL,74),(1256,6,NULL,74),(1257,7,NULL,74),(1258,8,NULL,74),(1259,9,NULL,74),(1260,10,NULL,74),(1261,11,NULL,74),(1262,12,NULL,74),(1263,13,NULL,74),(1264,14,NULL,74),(1265,15,NULL,74),(1266,16,NULL,74),(1267,1,NULL,75),(1268,2,NULL,75),(1269,3,NULL,75),(1270,4,NULL,75),(1271,5,NULL,75),(1272,6,NULL,75),(1273,7,NULL,75),(1274,8,NULL,75),(1275,9,NULL,75),(1276,10,NULL,75),(1277,11,NULL,75),(1278,12,NULL,75),(1279,13,NULL,75),(1280,14,NULL,75),(1281,15,NULL,75),(1282,16,NULL,75),(1283,1,NULL,76),(1284,2,NULL,76),(1285,3,NULL,76),(1286,4,NULL,76),(1287,5,NULL,76),(1288,6,NULL,76),(1289,7,NULL,76),(1290,8,NULL,76),(1291,9,NULL,76),(1292,10,NULL,76),(1293,11,NULL,76),(1294,12,NULL,76),(1295,13,NULL,76),(1296,14,NULL,76),(1297,15,NULL,76),(1298,16,NULL,76),(1299,1,NULL,77),(1300,2,NULL,77),(1301,3,NULL,77),(1302,4,NULL,77),(1303,5,NULL,77),(1304,6,NULL,77),(1305,7,NULL,77),(1306,8,NULL,77),(1307,9,NULL,77),(1308,10,NULL,77),(1309,11,NULL,77),(1310,12,NULL,77),(1311,13,NULL,77),(1312,14,NULL,77),(1313,15,NULL,77),(1314,16,NULL,77),(1315,1,NULL,78),(1316,2,NULL,78),(1317,3,NULL,78),(1318,4,NULL,78),(1319,5,NULL,78),(1320,6,NULL,78),(1321,7,NULL,78),(1322,8,NULL,78),(1323,9,NULL,78),(1324,10,NULL,78),(1325,11,NULL,78),(1326,12,NULL,78),(1327,13,NULL,78),(1328,14,NULL,78),(1329,15,NULL,78),(1330,16,NULL,78),(1331,1,NULL,79),(1332,2,NULL,79),(1333,3,NULL,79),(1334,4,NULL,79),(1335,5,NULL,79),(1336,6,NULL,79),(1337,7,NULL,79),(1338,8,NULL,79),(1339,9,NULL,79),(1340,10,NULL,79),(1341,11,NULL,79),(1342,12,NULL,79),(1343,13,NULL,79),(1344,14,NULL,79),(1345,15,NULL,79),(1346,16,NULL,79),(1347,1,NULL,80),(1348,2,NULL,80),(1349,3,NULL,80),(1350,4,NULL,80),(1351,5,NULL,80),(1352,6,NULL,80),(1353,7,NULL,80),(1354,8,NULL,80),(1355,9,NULL,80),(1356,10,NULL,80),(1357,11,NULL,80),(1358,12,NULL,80),(1359,13,NULL,80),(1360,14,NULL,80),(1361,15,NULL,80),(1362,16,NULL,80),(1363,1,NULL,81),(1364,2,NULL,81),(1365,3,NULL,81),(1366,4,NULL,81),(1367,5,NULL,81),(1368,6,NULL,81),(1369,7,NULL,81),(1370,8,NULL,81),(1371,9,NULL,81),(1372,10,NULL,81),(1373,11,NULL,81),(1374,12,NULL,81),(1375,13,NULL,81),(1376,14,NULL,81),(1377,15,NULL,81),(1378,16,NULL,81),(1379,1,NULL,82),(1380,2,NULL,82),(1381,3,NULL,82),(1382,4,NULL,82),(1383,5,NULL,82),(1384,6,NULL,82),(1385,7,NULL,82),(1386,8,NULL,82),(1387,9,NULL,82),(1388,10,NULL,82),(1389,11,NULL,82),(1390,12,NULL,82),(1391,13,NULL,82),(1392,14,NULL,82),(1393,15,NULL,82),(1394,16,NULL,82),(1395,1,NULL,83),(1396,2,NULL,83),(1397,3,NULL,83),(1398,4,NULL,83),(1399,5,NULL,83),(1400,6,NULL,83),(1401,7,NULL,83),(1402,8,NULL,83),(1403,9,NULL,83),(1404,10,NULL,83),(1405,11,NULL,83),(1406,12,NULL,83),(1407,13,NULL,83),(1408,14,NULL,83),(1409,15,NULL,83),(1410,16,NULL,83),(1411,1,NULL,84),(1412,2,NULL,84),(1413,3,NULL,84),(1414,4,NULL,84),(1415,5,NULL,84),(1416,6,NULL,84),(1417,7,NULL,84),(1418,8,NULL,84),(1419,9,NULL,84),(1420,10,NULL,84),(1421,11,NULL,84),(1422,12,NULL,84),(1423,13,NULL,84),(1424,14,NULL,84),(1425,15,NULL,84),(1426,16,NULL,84),(1427,1,NULL,85),(1428,2,NULL,85),(1429,3,NULL,85),(1430,4,NULL,85),(1431,5,NULL,85),(1432,6,NULL,85),(1433,7,NULL,85),(1434,8,NULL,85),(1435,9,NULL,85),(1436,10,NULL,85),(1437,11,NULL,85),(1438,12,NULL,85),(1439,13,NULL,85),(1440,14,NULL,85),(1441,15,NULL,85),(1442,16,NULL,85),(1443,1,NULL,86),(1444,2,NULL,86),(1445,3,NULL,86),(1446,4,NULL,86),(1447,5,NULL,86),(1448,6,NULL,86),(1449,7,NULL,86),(1450,8,NULL,86),(1451,9,NULL,86),(1452,10,NULL,86),(1453,11,NULL,86),(1454,12,NULL,86),(1455,13,NULL,86),(1456,14,NULL,86),(1457,15,NULL,86),(1458,16,NULL,86),(1459,1,NULL,87),(1460,2,NULL,87),(1461,3,NULL,87),(1462,4,NULL,87),(1463,5,NULL,87),(1464,6,NULL,87),(1465,7,NULL,87),(1466,8,NULL,87),(1467,9,NULL,87),(1468,10,NULL,87),(1469,11,NULL,87),(1470,12,NULL,87),(1471,13,NULL,87),(1472,14,NULL,87),(1473,15,NULL,87),(1474,16,NULL,87),(1475,1,NULL,88),(1476,2,NULL,88),(1477,3,NULL,88),(1478,4,NULL,88),(1479,5,NULL,88),(1480,6,NULL,88),(1481,7,NULL,88),(1482,8,NULL,88),(1483,9,NULL,88),(1484,10,NULL,88),(1485,11,NULL,88),(1486,12,NULL,88),(1487,13,NULL,88),(1488,14,NULL,88),(1489,15,NULL,88),(1490,16,NULL,88),(1491,1,NULL,89),(1492,2,NULL,89),(1493,3,NULL,89),(1494,4,NULL,89),(1495,5,NULL,89),(1496,6,NULL,89),(1497,7,NULL,89),(1498,8,NULL,89),(1499,9,NULL,89),(1500,10,NULL,89),(1501,11,NULL,89),(1502,12,NULL,89),(1503,13,NULL,89),(1504,14,NULL,89),(1505,15,NULL,89),(1506,16,NULL,89),(1507,1,NULL,90),(1508,2,NULL,90),(1509,3,NULL,90),(1510,4,NULL,90),(1511,5,NULL,90),(1512,6,NULL,90),(1513,7,NULL,90),(1514,8,NULL,90),(1515,9,NULL,90),(1516,10,NULL,90),(1517,11,NULL,90),(1518,12,NULL,90),(1519,13,NULL,90),(1520,14,NULL,90),(1521,15,NULL,90),(1522,16,NULL,90),(1523,1,NULL,91),(1524,2,NULL,91),(1525,3,NULL,91),(1526,4,NULL,91),(1527,5,NULL,91),(1528,6,NULL,91),(1529,7,NULL,91),(1530,8,NULL,91),(1531,9,NULL,91),(1532,10,NULL,91),(1533,11,NULL,91),(1534,12,NULL,91),(1535,13,NULL,91),(1536,14,NULL,91),(1537,15,NULL,91),(1538,16,NULL,91),(1539,1,NULL,92),(1540,2,NULL,92),(1541,3,NULL,92),(1542,4,NULL,92),(1543,5,NULL,92),(1544,6,NULL,92),(1545,7,NULL,92),(1546,8,NULL,92),(1547,9,NULL,92),(1548,10,NULL,92),(1549,11,NULL,92),(1550,12,NULL,92),(1551,13,NULL,92),(1552,14,NULL,92),(1553,15,NULL,92),(1554,16,NULL,92),(1555,1,NULL,93),(1556,2,NULL,93),(1557,3,NULL,93),(1558,4,NULL,93),(1559,5,NULL,93),(1560,6,NULL,93),(1561,7,NULL,93),(1562,8,NULL,93),(1563,9,NULL,93),(1564,10,NULL,93),(1565,11,NULL,93),(1566,12,NULL,93),(1567,13,NULL,93),(1568,14,NULL,93),(1569,15,NULL,93),(1570,16,NULL,93),(1571,1,NULL,94),(1572,2,NULL,94),(1573,3,NULL,94),(1574,4,NULL,94),(1575,5,NULL,94),(1576,6,NULL,94),(1577,7,NULL,94),(1578,8,NULL,94),(1579,9,NULL,94),(1580,10,NULL,94),(1581,11,NULL,94),(1582,12,NULL,94),(1583,13,NULL,94),(1584,14,NULL,94),(1585,15,NULL,94),(1586,16,NULL,94),(1587,1,NULL,95),(1588,2,NULL,95),(1589,3,NULL,95),(1590,4,NULL,95),(1591,5,NULL,95),(1592,6,NULL,95),(1593,7,NULL,95),(1594,8,NULL,95),(1595,9,NULL,95),(1596,10,NULL,95),(1597,11,NULL,95),(1598,12,NULL,95),(1599,13,NULL,95),(1600,14,NULL,95),(1601,15,NULL,95),(1602,16,NULL,95);
/*!40000 ALTER TABLE `tuanhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dangkytinchii'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-11 13:00:41
