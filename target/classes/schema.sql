drop database if exists dangkytinchii;
create database dangkytinchii;
use dangkytinchii;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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

/*!40000 ALTER TABLE `diachi` DISABLE KEYS */;
INSERT INTO `diachi` (`id`, `sonha`, `toanha`, `xompho`, `phuongxa`, `quanhuyen`, `tinhthanh`) VALUES (1,'27','Nguyễn Đức Cảnh','Hoàng Văn Thụ','Trương Định','Hoàng Mai','Hà Nội');
/*!40000 ALTER TABLE `diachi` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:34

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
-- Table structure for table `thanhvien`
--

DROP TABLE IF EXISTS `thanhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanhvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
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
  KEY `diachiid` (`diachiid`),
  CONSTRAINT `thanhvien_ibfk_1` FOREIGN KEY (`diachiid`) REFERENCES `diachi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhvien`
--

/*!40000 ALTER TABLE `thanhvien` DISABLE KEYS */;
-- INSERT INTO `thanhvien` (`id`, `username`, `password`, `ngaysinh`, `email`, `dt`, `ghichu`, `vitri`, `ho`, `dem`, `ten`, `diachiid`) VALUES (1,'thang','123456','1999-01-05','tatthang0501@gmail.com','0337971060','khong co','giangvien','Nguyen','Tat','Thang',1);
-- INSERT INTO `thanhvien` (`username`, `password`, `ngaysinh`, `email`, `dt`, `ghichu`, `vitri`, `ho`, `dem`, `ten`, `diachiid`) VALUES ('thangnguyen','123456','1999-01-05','tatthang0501@gmail.com','0337971060','khong co','giangvien','Nguyen','Tat','Thang',1);
/*!40000 ALTER TABLE `thanhvien` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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

/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` (`id`, `ten`, `mota`) VALUES (1,'CNTT','');
INSERT INTO `khoa` (`id`, `ten`, `mota`) VALUES (2,'ATTT','');
INSERT INTO `khoa` (`id`, `ten`, `mota`) VALUES (3,'CNĐPT','');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
-- Table structure for table `ngayhoc`
--

DROP TABLE IF EXISTS `ngayhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ngayhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `lichhocid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngayhoc`
--

/*!40000 ALTER TABLE `ngayhoc` DISABLE KEYS */;

/*!40000 ALTER TABLE `ngayhoc` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:36

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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

/*!40000 ALTER TABLE `namhoc` DISABLE KEYS */;
INSERT INTO `namhoc` (`id`, `ten`, `mota`) VALUES (1,'2015-2016','');
INSERT INTO `namhoc` (`id`, `ten`, `mota`) VALUES (2,'2016-2017','');
INSERT INTO `namhoc` (`id`, `ten`, `mota`) VALUES (3,'2017-2018','');
INSERT INTO `namhoc` (`id`, `ten`, `mota`) VALUES (4,'2020-2021','');
/*!40000 ALTER TABLE `namhoc` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
-- Table structure for table `tuanhoc`
--

DROP TABLE IF EXISTS `tuanhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuanhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `mota` varchar(30) DEFAULT NULL,
  `lichhocid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuanhoc`
--

/*!40000 ALTER TABLE `tuanhoc` DISABLE KEYS */;

/*!40000 ALTER TABLE `tuanhoc` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:34

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
-- Table structure for table `kiphoc`
--

DROP TABLE IF EXISTS `kiphoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kiphoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `lichhocid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `kiphoc`
--

/*!40000 ALTER TABLE `kiphoc` DISABLE KEYS */;

/*!40000 ALTER TABLE `kiphoc` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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

/*!40000 ALTER TABLE `hocky` DISABLE KEYS */;
INSERT INTO `hocky` (`id`, `ten`, `mota`) VALUES (1,'Học kỳ 1','');
INSERT INTO `hocky` (`id`, `ten`, `mota`) VALUES (2,'Học kỳ 2','');
/*!40000 ALTER TABLE `hocky` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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

/*!40000 ALTER TABLE `kyhoc` DISABLE KEYS */;
INSERT INTO `kyhoc` (`id`, `namhocid`, `hockyid`) VALUES (1,4,1);
INSERT INTO `kyhoc` (`id`, `namhocid`, `hockyid`) VALUES (2,4,2);
/*!40000 ALTER TABLE `kyhoc` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bomon`
--

/*!40000 ALTER TABLE `bomon` DISABLE KEYS */;
INSERT INTO `bomon` (`id`, `ten`, `mota`, `khoa_id`) VALUES (1,'Công nghệ phần mềm','Chuyên ngành CNTT',1);
INSERT INTO `bomon` (`id`, `ten`, `mota`, `khoa_id`) VALUES (2,'Trí tuệ nhân tạo','Chuyên ngành HTTT',1);
INSERT INTO `bomon` (`ten`, `mota`, `khoa_id`) VALUES ('Bảo mật hệ thống','Chuyên ngành ATTT', 2);
INSERT INTO `bomon` (`ten`, `mota`, `khoa_id`) VALUES ('Ngăn chặn tấn công DDOS','Chuyên ngành ATTT', 2);
INSERT INTO `bomon` (`ten`, `mota`, `khoa_id`) VALUES ('Khai phá dữ liệu đa phương tiện','Chuyên ngành CNĐPT', 3);
INSERT INTO `bomon` (`ten`, `mota`, `khoa_id`) VALUES ('Lập trình game','Chuyên ngành CNĐPT', 3);
/*!40000 ALTER TABLE `bomon` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:34

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) DEFAULT NULL,
  `sotc` int DEFAULT NULL,
  `mota` varchar(50) DEFAULT NULL,
  `bomonid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bomonid` (`bomonid`),
  CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`bomonid`) REFERENCES `bomon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` (`id`,`ten`, `sotc`, `mota`, `bomonid`) VALUES (1,'Nhập môn công nghệ phần mềm',3,'Môn chuyên ngành',1);
INSERT INTO `monhoc` (`id`,`ten`, `sotc`, `mota`, `bomonid`) VALUES (2,'Các hệ thống phân tán',3,'Môn chuyên ngành',1);
INSERT INTO `monhoc` (`id`,`ten`, `sotc`, `mota`, `bomonid`) VALUES (3,'Cơ sở dữ liệu phân tán',2,'Môn chuyên ngành',1);
INSERT INTO `monhoc` (`id`,`ten`, `sotc`, `mota`, `bomonid`) VALUES (4,'Chuyên đề công nghệ phần mềm',1,'Môn chuyên ngành',1);
INSERT INTO `monhoc` (`id`,`ten`, `sotc`, `mota`, `bomonid`) VALUES (5,'Lập trình hệ thống nhúng',3,'Môn chuyên ngành',1);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Nhập môn trí tuệ nhân tạo',3,'Môn chuyên ngành',2);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Nhập môn tương tác người - máy',3,'Môn chuyên ngành',2);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Cơ sở dữ liệu phân tán',3,'Môn chuyên ngành',2);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('An toàn và bảo mật hệ thống cơ bản',3,'Môn chuyên ngành',3);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Bảo mật cơ sở dữ liệu',2,'Môn chuyên ngành',3);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Ngăn chặn tấn công SQL Injection',2,'Môn chuyên ngành',3);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('DDOS và các vấn đề liên quan',2,'Môn chuyên ngành',4);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Tìm hiểu và xử lý lỗ hổng hệ thống',3,'Môn chuyên ngành',4);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Nhập môn dữ liệu đa phương tiện',3,'Môn chuyên ngành',5);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Thao tác với dữ liệu đa phương tiện',2,'Môn chuyên ngành',5);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Chuyên đề công nghệ đa phương tiện',1,'Môn chuyên ngành',5);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Nhập môn lập trình game',3,'Môn chuyên ngành',6);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Công nghệ phát triển game',3,'Môn chuyên ngành',6);
INSERT INTO `monhoc` (`ten`, `sotc`, `mota`, `bomonid`) VALUES ('Công nghệ thực tế ảo',3,'Môn chuyên ngành',6);




/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhockyhoc`
--

/*!40000 ALTER TABLE `monhockyhoc` DISABLE KEYS */;
INSERT INTO `monhockyhoc` (`id`, `monhocid`, `kyhocid`) VALUES (1,1,2);
INSERT INTO `monhockyhoc` (`id`, `monhocid`, `kyhocid`) VALUES (2,2,2);
INSERT INTO `monhockyhoc` (`id`, `monhocid`, `kyhocid`) VALUES (3,3,2);
INSERT INTO `monhockyhoc` (`id`, `monhocid`, `kyhocid`) VALUES (4,4,2);
INSERT INTO `monhockyhoc` (`monhocid`, `kyhocid`) VALUES (5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lophocphan`
--
/*!40000 ALTER TABLE `lophocphan` DISABLE KEYS */;
INSERT INTO `lophocphan` (`id`, `ten`, `sisotoida`, `mota`, `monhockyhocid`) VALUES (1,'NMCNPM',50,'',1);
INSERT INTO `lophocphan` (`id`, `ten`, `sisotoida`, `mota`, `monhockyhocid`) VALUES (2,'NMCNPM',45,'',1);
INSERT INTO `lophocphan` (`id`, `ten`, `sisotoida`, `mota`, `monhockyhocid`) VALUES (3,'NMCNPM',50,'',1);
INSERT INTO `lophocphan` (`id`, `ten`, `sisotoida`, `mota`, `monhockyhocid`) VALUES (4,'NMCNPM',50,'',1);
INSERT INTO `lophocphan` (`id`, `ten`, `sisotoida`, `mota`, `monhockyhocid`) VALUES (5,'NMCNPM',50,'',1);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',2);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',2);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',2);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',2);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',2);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',3);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',3);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',3);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',3);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',3);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',4);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',4);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',4);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',4);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',4);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',5);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',5);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',5);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',5);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',5);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',6);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',6);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',6);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',6);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',6);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',7);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',7);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',7);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',7);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',7);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',8);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',8);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',8);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',8);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',8);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',9);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',9);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',9);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',9);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',9);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',10);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',10);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',10);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',10);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',10);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',11);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',11);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',11);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',11);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',11);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',12);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',12);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',12);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',12);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',12);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',13);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',13);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',13);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',13);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',13);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',14);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',14);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',14);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',14);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',14);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',15);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',15);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',15);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',15);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',15);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',16);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',16);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',16);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',16);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',16);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',17);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',17);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',17);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',17);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',17);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',18);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',18);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',18);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',18);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',18);

INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',19);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',19);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',19);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',19);
INSERT INTO `lophocphan` (`sisotoida`, `mota`, `monhockyhocid`) VALUES (50,'ok',19);
/*!40000 ALTER TABLE `lophocphan` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:36

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichhoc`
--

/*!40000 ALTER TABLE `lichhoc` DISABLE KEYS */;
INSERT INTO `lichhoc` (`id`,`ten`, `lhpid`, `mota`, `giangvienid`) VALUES (1, 'Nhập môn công nghệ phần mềm', 1, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`id`,`ten`, `lhpid`, `mota`, `giangvienid`) VALUES (2, 'Nhập môn công nghệ phần mềm', 2, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`id`,`ten`, `lhpid`, `mota`, `giangvienid`) VALUES (3, 'Nhập môn công nghệ phần mềm', 3, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`id`,`ten`, `lhpid`, `mota`, `giangvienid`) VALUES (4, 'Nhập môn công nghệ phần mềm', 4, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`id`,`ten`, `lhpid`, `mota`, `giangvienid`) VALUES (5, 'Nhập môn công nghệ phần mềm', 5, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Các hệ thống phân tán', 6, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Các hệ thống phân tán', 7, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Các hệ thống phân tán', 8, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Các hệ thống phân tán', 9, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Các hệ thống phân tán', 10, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 11, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 12, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 13, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 14, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 15, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ phần mềm', 16, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ phần mềm', 17, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ phần mềm', 18, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ phần mềm', 19, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ phần mềm', 20, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Lập trình hệ thống nhúng', 21, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Lập trình hệ thống nhúng', 22, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Lập trình hệ thống nhúng', 23, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Lập trình hệ thống nhúng', 24, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Lập trình hệ thống nhúng', 25, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn trí tuệ nhân tạo', 26, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn trí tuệ nhân tạo', 27, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn trí tuệ nhân tạo', 28, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn trí tuệ nhân tạo', 29, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn trí tuệ nhân tạo', 30, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn tương tác người - máy', 31, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn tương tác người - máy', 32, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn tương tác người - máy', 33, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn tương tác người - máy', 34, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn tương tác người - máy', 35, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 36, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 37, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 38, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 39, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Cơ sở dữ liệu phân tán', 40, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('An toàn và bảo mật hệ thống cơ bản', 41, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('An toàn và bảo mật hệ thống cơ bản', 42, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('An toàn và bảo mật hệ thống cơ bản', 43, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('An toàn và bảo mật hệ thống cơ bản', 44, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('An toàn và bảo mật hệ thống cơ bản', 45, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Bảo mật cơ sở dữ liệu', 46, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Bảo mật cơ sở dữ liệu', 47, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Bảo mật cơ sở dữ liệu', 48, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Bảo mật cơ sở dữ liệu', 49, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Bảo mật cơ sở dữ liệu', 50, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Ngăn chặn tấn công SQL Injection', 51, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Ngăn chặn tấn công SQL Injection', 52, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Ngăn chặn tấn công SQL Injection', 53, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Ngăn chặn tấn công SQL Injection', 54, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Ngăn chặn tấn công SQL Injection', 55, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('DDOS và các vấn đề liên quan', 56, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('DDOS và các vấn đề liên quan', 57, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('DDOS và các vấn đề liên quan', 58, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('DDOS và các vấn đề liên quan', 59, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('DDOS và các vấn đề liên quan', 60, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Tìm hiểu và xử lý lỗ hổng hệ thống', 61, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Tìm hiểu và xử lý lỗ hổng hệ thống', 62, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Tìm hiểu và xử lý lỗ hổng hệ thống', 63, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Tìm hiểu và xử lý lỗ hổng hệ thống', 64, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Tìm hiểu và xử lý lỗ hổng hệ thống', 65, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn dữ liệu đa phương tiện', 66, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn dữ liệu đa phương tiện', 67, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn dữ liệu đa phương tiện', 68, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn dữ liệu đa phương tiện', 69, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn dữ liệu đa phương tiện', 70, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Thao tác với dữ liệu đa phương tiện', 71, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Thao tác với dữ liệu đa phương tiện', 72, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Thao tác với dữ liệu đa phương tiện', 73, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Thao tác với dữ liệu đa phương tiện', 74, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Thao tác với dữ liệu đa phương tiện', 75, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ đa phương tiện', 76, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ đa phương tiện', 77, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ đa phương tiện', 78, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ đa phương tiện', 79, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Chuyên đề công nghệ đa phương tiện', 80, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn lập trình game', 81, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn lập trình game', 82, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn lập trình game', 83, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn lập trình game', 84, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Nhập môn lập trình game', 85, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ phát triển game', 86, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ phát triển game', 87, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ phát triển game', 88, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ phát triển game', 89, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ phát triển game', 90, 'Hoc som', NULL);

INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ thực tế ảo', 91, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ thực tế ảo', 92, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ thực tế ảo', 93, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ thực tế ảo', 94, 'Hoc som', NULL);
INSERT INTO `lichhoc` (`ten`, `lhpid`, `mota`, `giangvienid`) VALUES ('Công nghệ thực tế ảo', 95, 'Hoc som', NULL);
/*!40000 ALTER TABLE `lichhoc` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dangkytinchi
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giangvienkhoa`
--

/*!40000 ALTER TABLE `giangvienkhoa` DISABLE KEYS */;

/*!40000 ALTER TABLE `giangvienkhoa` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 13:08:35
-- select * from bomon;
-- select * from monhoc;
-- select * from giangvienkhoa;
-- select * from bomon;
-- insert into giangvienkhoa values(2,1,4);
-- delete from thanhvien where id = 2;
-- INSERT INTO `lichhoc` (`ten`, `lhpid`, `tuanid`, `ngayid`, `kipid`, `mota`, `giangvienid`) VALUES ('Nhap Mon CNPM',5,2,1,2,'Hoc som',1);
alter table thanhvien MODIFY password VARCHAR(255);
alter table kiphoc
add foreign key (lichhocid) references lichhoc (id);

alter table ngayhoc
add foreign key (lichhocid) references lichhoc (id);
alter table tuanhoc
add foreign key (lichhocid) references lichhoc (id);


INSERT INTO `giangvienkhoa` (`id`, `k_id`, `giangvienid`) VALUES (1,1,1); 
select * from monhoc;