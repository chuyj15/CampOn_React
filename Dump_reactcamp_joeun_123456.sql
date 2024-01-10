-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: reactcamp
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad` (
  `ad_no` int NOT NULL AUTO_INCREMENT,
  `camp_no` int NOT NULL,
  `ad_img` varchar(500) NOT NULL,
  `ad_start` date NOT NULL,
  `ad_end` date NOT NULL,
  `ad_check` tinyint(1) NOT NULL DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ad_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (1,1,'/img/camp/camp1-3.jpg','2023-01-01','2023-11-11',1,'2023-11-13 03:57:52','2023-11-13 03:57:52'),(2,15,'/img/camp/camp1-1-1.jpg','2023-11-15','2023-11-22',1,'2023-11-14 07:51:43','2023-11-14 07:51:43'),(3,15,'/img/camp/camp1-1-2.jpg','2023-11-01','2023-11-15',0,'2023-11-14 07:52:12','2023-11-14 07:52:12'),(4,13,'/img/camp/camp1-1-3.jpg','2023-12-13','2023-12-27',0,'2023-12-27 04:07:54','2023-12-27 04:07:54'),(5,18,'/img/camp/camp1-4.jpg','2023-12-12','2024-01-05',0,'2023-12-27 04:11:07','2023-12-27 04:11:07'),(6,18,'/img/camp/camp1-5.jpg','2023-12-06','2023-12-28',0,'2023-12-27 04:14:13','2023-12-27 04:14:13');
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `auth_no` int NOT NULL AUTO_INCREMENT,
  `user_no` int NOT NULL,
  `auth` int DEFAULT NULL,
  `auth_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auth_no`),
  KEY `FK_USER_TO_AUTH_1` (`user_no`),
  CONSTRAINT `FK_USER_TO_AUTH_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_no` int NOT NULL AUTO_INCREMENT,
  `board_title` varchar(500) DEFAULT NULL,
  `board_con` text,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_no` int NOT NULL,
  PRIMARY KEY (`board_no`),
  KEY `FK_USER_TO_BOARD_1` (`user_no`),
  CONSTRAINT `FK_USER_TO_BOARD_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'제목1','내용1','2023-11-01 06:23:22','2023-11-01 06:23:22',2);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campdetail`
--

DROP TABLE IF EXISTS `campdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campdetail` (
  `cp_dt_no` int NOT NULL AUTO_INCREMENT,
  `camp_no` int NOT NULL,
  `camptype_no` int NOT NULL,
  `user_no` int NOT NULL,
  `cp_dt_name` varchar(500) DEFAULT NULL,
  `cp_dt_introduction` text,
  `cp_dt_nop` int DEFAULT NULL,
  `cp_dt_size` varchar(200) DEFAULT NULL,
  `cp_dt_price` int DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cp_dt_no`),
  KEY `FK_CAMPPRODUCT_TO_CAMPDETAIL_1` (`camp_no`),
  KEY `FK_CAMPTYPE_TO_CAMPDETAIL_1` (`camptype_no`),
  KEY `FK_USER_TO_CAMPDETAIL_1` (`user_no`),
  CONSTRAINT `FK_CAMPPRODUCT_TO_CAMPDETAIL_1` FOREIGN KEY (`camp_no`) REFERENCES `campproduct` (`camp_no`),
  CONSTRAINT `FK_CAMPTYPE_TO_CAMPDETAIL_1` FOREIGN KEY (`camptype_no`) REFERENCES `camptype` (`camptype_no`),
  CONSTRAINT `FK_USER_TO_CAMPDETAIL_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campdetail`
--

LOCK TABLES `campdetail` WRITE;
/*!40000 ALTER TABLE `campdetail` DISABLE KEYS */;
INSERT INTO `campdetail` VALUES (1,1,3,3,'조은글램핑1','모든 캠핑 장비가 구비되어있는 글램핑',62,'4m x 4m',300000002,'2023-11-01 06:16:52','2023-11-01 06:16:52'),(2,2,3,3,'안조은펜션','안조은 팬션에 안조은 팬션',1,'1m x 1m',0,'2023-11-01 06:16:53','2023-11-01 06:16:53'),(3,2,3,3,'안조은카라반','안조은 카라반 망가졌다!',2,'7m x 3m',0,'2023-11-01 06:16:54','2023-11-01 06:16:54'),(4,2,2,3,'조은글램핑1','123123123',2,'33',0,'2023-11-10 04:06:28','2023-11-10 04:06:28'),(10,11,1,3,'산새소리존(Main)','설악산세 뷰. ⛰️산새소리캠핑장의 센터!\r\n릴선필요 (최소15m)\r\n\r\n예약전 캠장이용정책(수칙) 필독후 에 예약주세요\r\n예약완료시 모든내용에 동의한것으로 간주되십니다♧',4,'9m x 5m',45000,'2023-11-15 01:08:24','2023-11-15 01:08:24'),(11,12,2,3,'글램핑 오페라','침대/냉장고/에어컨/전자레인지/온풍기/전기매트/써큘레이터/화장실/옷장/화장대/침구류일체/세면도구/\r\n\r\n그릇4개/접시4개/후라이팬1개/냄비2개/일회 수저/일회용젓가락',2,'46.2m²',130000,'2023-11-15 02:33:34','2023-11-15 02:33:34'),(12,13,3,3,'1번카라반(2022신축)','예쁜정원과 작은 계곡을 품고있는 조용한 카라반입니다.\r\n6,7,8번 카라반은 2022년 10월에 오픈했습니다\r\n5번,7번,8번 카라반은 계곡뷰입니다',2,'33m²',79000,'2023-11-15 02:39:04','2023-11-15 02:39:04'),(13,18,4,3,'펜션 독채','20명까지의 대규모 모임도 가능합니다. (꼭,사전협의 요망)  그리고, 동호회모임 추천- 가까이에 길상산,  낚시터,  루지장,  미술관, 퍼블릭골프장 등이 위치',12,'198 m²',450000,'2023-11-15 02:44:18','2023-11-15 02:44:18'),(14,15,5,3,'당일캠프닉(4~6인)','평상및 그늘막, 파라솔로 구성된 캠프닉 사이트입니다.\r\n입실은 14시 이면 퇴실은 22시입니다.\r\n토요일 일요일  이른입실을 원하실때는 전화 주세요\r\n(추가요금X)',6,'3m X 4m',40000,'2023-11-15 02:48:28','2023-11-15 02:48:28'),(15,18,1,3,'밤별생각 낮달이야기 캠핑장','※해여림빌리지는 가족 캠핑장 입니다. ※\r\n- 가족은 부모 자녀 포함하여 예약 할 수 있습니다.\r\n- 커플 또는 성인 2인만 예약가능합니다.\r\n- 커플 2쌍 두가족 사이트 예약 가능합니다.\r\n-방문객 입실 거절하며, 모르게 입실 시 발각 되면, 예약자 함께 가차 없이 퇴장조치 합니다.\r\n\r\n※ 예약 불가 인원은 친구나 지인끼리 3인또는 4인은 예약이 불가 합니다.\r\n- 캠핑장 사이트 2개를 예약해서 3인이상(남자3인이나,4인 )모임은 절대 불가 합니다. 이를 어길 경우 환불 없이 입실이 불가하며 가차없이 퇴실 조치합니다..\r\n\r\n바이러스조차도 찾지 못하는 깊은 산속 캠핑장과 독채펜션\r\n일부 사이트에서 차박이 가능합니다\r\n곤지암, 양평, 이천 15KM 거리에 위치\r\n\r\n1. 펜션, 캠핑장에서 만드는 연인, 가족과의 잊지못할 데이트\r\n2. 자체 식물원에서 느끼는 사계절 힐링 산책\r\n3. 각종 지역 연회 및 워크샵 장소\r\n4. 서울 근교 데이트 장소로 좋은 여주 청정지역\r\n5. 수목원 부지에 지어진 특별한 캠핑장\r\n6. 전기 사용 600W 미만 사용(높은 왓트 전열기 사용시 캠핑장 전체 차단기 떨어집니다)\r\n7. 저녁 7시 이후 입실 불가\r\n8. 일부 사이트들은 차박이 가능하며 프라이빗한 공간을 제공합니다',13,'14',15000,'2023-12-27 04:10:19','2023-12-27 04:10:19'),(16,18,2,3,'부재산방 캠핑장','자연속 조용한 캠핑장,\r\n아이들이 안전한 캠핑장,\r\n편히 쉬어가는 캠핑장!\r\n아이들이 뛰어놀기에 좋습니다.\r\n사이트 수는 적지만 독립적으로 조용한 힐링이 가능합니다.',13,'14',45000,'2023-12-27 05:53:58','2023-12-27 05:53:58');
/*!40000 ALTER TABLE `campdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campdetailimg`
--

DROP TABLE IF EXISTS `campdetailimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campdetailimg` (
  `cpdi_no` int NOT NULL AUTO_INCREMENT,
  `cp_dt_no` int NOT NULL,
  `camp_no` int NOT NULL,
  `cpdi_url` varchar(500) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cpdi_no`),
  KEY `FK_CAMPDETAIL_TO_CAMPDETAILIMG_1` (`cp_dt_no`),
  KEY `FK_CAMPDETAIL_TO_CAMPDETAILIMG_2` (`camp_no`),
  CONSTRAINT `FK_CAMPDETAIL_TO_CAMPDETAILIMG_1` FOREIGN KEY (`cp_dt_no`) REFERENCES `campdetail` (`cp_dt_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campdetailimg`
--

LOCK TABLES `campdetailimg` WRITE;
/*!40000 ALTER TABLE `campdetailimg` DISABLE KEYS */;
INSERT INTO `campdetailimg` VALUES (20,10,11,'/img/camp/camp1-1-1.jpg','2023-11-15 01:08:24'),(21,10,11,'/img/camp/camp1-1-2.jpg','2023-11-15 01:08:24'),(22,10,11,'/img/camp/camp1-1-3.jpg','2023-11-15 01:08:24'),(23,11,12,'/img/camp/camp2-1-1.jpg','2023-11-15 02:33:34'),(24,11,12,'/img/camp/camp2-1-2.jpg','2023-11-15 02:33:34'),(25,11,12,'/img/camp/camp2-1-3.jpg','2023-11-15 02:33:34'),(26,12,13,'/img/camp/camp3-1-1.jpg','2023-11-15 02:39:04'),(27,12,13,'/img/camp/camp3-1-2.jpg','2023-11-15 02:39:04'),(28,12,13,'/img/camp/camp3-1-3.jpg','2023-11-15 02:39:04'),(29,13,18,'/img/camp/camp4-1-1.jpg','2023-11-15 02:44:18'),(30,13,18,'/img/camp/camp4-1-2.jpg','2023-11-15 02:44:18'),(31,13,18,'/img/camp/camp4-1-3.jpg','2023-11-15 02:44:18'),(32,14,15,'/img/camp/camp5-1-1.jpg','2023-11-15 02:48:28'),(33,14,15,'/img/camp/camp5-1-2.jpg','2023-11-15 02:48:28'),(34,14,15,'/img/camp/camp5-1-3.jpg','2023-11-15 02:48:28'),(35,15,18,'C:/upload/e0930419-4b74-4311-98d9-ee670c537f0a_dsfdfdssdef.png','2023-12-27 04:10:19'),(36,16,18,'C:/upload/7d656744-5e59-4100-8bf0-88736aaaeb56_dsfdsfdsf.png','2023-12-27 05:53:58');
/*!40000 ALTER TABLE `campdetailimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campimg`
--

DROP TABLE IF EXISTS `campimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campimg` (
  `cpi_no` int NOT NULL AUTO_INCREMENT,
  `camp_no` int NOT NULL,
  `cpi_url` varchar(500) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cpi_no`),
  KEY `FK_CAMPPRODUCT_TO_CAMPIMG_1` (`camp_no`),
  CONSTRAINT `FK_CAMPPRODUCT_TO_CAMPIMG_1` FOREIGN KEY (`camp_no`) REFERENCES `campproduct` (`camp_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campimg`
--

LOCK TABLES `campimg` WRITE;
/*!40000 ALTER TABLE `campimg` DISABLE KEYS */;
INSERT INTO `campimg` VALUES (6,2,'/img/camp1.jpg','2023-11-01 06:55:43'),(7,2,'/img/camp2.jpg','2023-11-01 06:55:43'),(8,2,'/img/camp3.jpg','2023-11-01 06:55:43'),(9,2,'/img/camp4.jpg','2023-11-01 06:55:43'),(10,2,'/img/camp5.jpg','2023-11-01 06:55:43'),(11,2,'C:/upload/45626e08-1d4a-4a5e-a53b-4a90ce352e30_camping-tent.png','2023-11-06 06:43:38'),(12,2,'C:/upload/9b97bd64-e612-4385-a0d1-62f1aa14479e_camping-tent.png','2023-11-06 06:48:52'),(13,2,'C:/upload/b6886a33-ccf9-40c2-8272-0f24f3e0b776_camping-tent.png','2023-11-06 06:52:13'),(14,2,'C:/upload/433f654e-2084-424b-b09b-3546974ac37f_camping-tent.png','2023-11-06 06:54:23'),(15,2,'C:/upload/2ea39af0-3898-4825-85f3-f722bf143371_camping-tent.png','2023-11-06 07:16:29'),(16,2,'C:/upload/b5b17f4f-ca6f-4d9f-ac53-cc9d834728b2_camping-tent.png','2023-11-06 07:24:33'),(82,11,'/img/camp/camp1-1.jpg','2023-11-15 01:06:28'),(83,11,'/img/camp/camp1-2.jpg','2023-11-15 01:06:28'),(84,11,'/img/camp/camp1-3.jpg','2023-11-15 01:06:28'),(85,11,'/img/camp/camp1-4.jpg','2023-11-15 01:06:28'),(86,11,'/img/camp/camp1-5.jpg','2023-11-15 01:06:28'),(87,12,'/img/camp/camp2-1.jpg','2023-11-15 02:31:29'),(88,12,'/img/camp/camp2-2.jpg','2023-11-15 02:31:29'),(89,12,'/img/camp/camp2-3.jpg','2023-11-15 02:31:29'),(90,12,'/img/camp/camp2-4.jpg','2023-11-15 02:31:29'),(91,12,'/img/camp/camp2-5.jpg','2023-11-15 02:31:29'),(92,13,'/img/camp/camp3-1.jpg','2023-11-15 02:36:20'),(93,13,'/img/camp/camp3-2.jpg','2023-11-15 02:36:20'),(94,13,'/img/camp/camp3-3.jpg','2023-11-15 02:36:20'),(95,13,'/img/camp/camp3-4.jpg','2023-11-15 02:36:20'),(96,13,'/img/camp/camp3-5.jpg','2023-11-15 02:36:20'),(97,18,'/img/camp/camp4-1.jpg','2023-11-15 02:42:59'),(98,18,'/img/camp/camp4-2.jpg','2023-11-15 02:42:59'),(99,18,'/img/camp/camp4-3.jpg','2023-11-15 02:42:59'),(100,18,'/img/camp/camp4-4.jpg','2023-11-15 02:42:59'),(106,15,'/img/camp/camp5-1.jpg','2023-11-15 02:47:01'),(107,15,'/img/camp/camp5-2.jpg','2023-11-15 02:47:01'),(108,15,'/img/camp/camp5-3.jfif','2023-11-15 02:47:01'),(109,15,'/img/camp/camp5-4.jpg','2023-11-15 02:47:01'),(110,15,'/img/camp/camp5-5.jpg','2023-11-15 02:47:01'),(111,1,'C:/upload/1e8dede3-e910-43b5-a840-2cfed74dc137_cc.png','2023-12-27 04:06:19');
/*!40000 ALTER TABLE `campimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campproduct`
--

DROP TABLE IF EXISTS `campproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campproduct` (
  `camp_no` int NOT NULL AUTO_INCREMENT,
  `region_no` int NOT NULL,
  `user_no` int NOT NULL,
  `camp_name` varchar(500) DEFAULT NULL,
  `camp_address` varchar(500) DEFAULT NULL,
  `camp_tel` varchar(100) DEFAULT NULL,
  `camp_location` varchar(500) DEFAULT NULL,
  `camp_layout` varchar(500) DEFAULT NULL,
  `camp_open` date DEFAULT NULL,
  `camp_close` date DEFAULT NULL,
  `camp_period` varchar(100) DEFAULT NULL,
  `camp_introduction` text,
  `camp_caution` text,
  `camp_latitude` varchar(500) DEFAULT NULL,
  `camp_longitude` varchar(500) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`camp_no`),
  KEY `FK_REGION_TO_CAMPPRODUCT_1` (`region_no`),
  KEY `FK_USER_TO_CAMPPRODUCT_1` (`user_no`),
  CONSTRAINT `FK_REGION_TO_CAMPPRODUCT_1` FOREIGN KEY (`region_no`) REFERENCES `region` (`region_no`),
  CONSTRAINT `FK_USER_TO_CAMPPRODUCT_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campproduct`
--

LOCK TABLES `campproduct` WRITE;
/*!40000 ALTER TABLE `campproduct` DISABLE KEYS */;
INSERT INTO `campproduct` VALUES (1,2,3,'조은캠핑장','조은시 조은동 조은캠핑장','121212121212',NULL,'C:/upload/56ba5e5c-27fa-495e-bcf0-5905ce216cc7_qocleh.png','2023-11-20','2024-01-30','200','조은캠핑장에 오신것을 환영합니다','21:00 ~ 06:00',NULL,NULL,'2023-11-01 06:05:54','2023-11-01 06:05:54'),(2,1,3,'안조은캠핑장','안조은시 안조은동 안조은캠핑장','03200000000','api주소등록','배치도','2023-12-20','2024-01-30','100','안조은캠핑장에 오신것을 환영합니다','없음','','','2023-11-01 06:05:55','2023-11-01 06:05:55'),(8,1,3,'test','test','test','test','C:/upload/60e6815f-1b1e-4843-95c0-c704718c3513_logo2.png','2023-11-13','2023-11-30',NULL,'\r\n            dsadasdasdasdas    ','test',NULL,NULL,'2023-11-06 07:45:16','2023-11-06 07:45:16'),(11,4,3,'양양 오색산새소리캠핑장','강원 양양군 서면 설악로 1044','010-7542-1960','강원 양양군 서면 설악로 1044','/img/camp/03aa56e2-5d47-469e-91ab-15483c67abb8_camp1layout.jpg','2023-11-15','2024-01-31',NULL,'안녕하세요 \r\n\r\n서울기준 ,  강일IC  > 오색산새소리캠핑장\r\n티맵으로 딱 두시간이면 도착해요.\r\n양양 , 서울에서 그리 멀지 않은 찐 옆동네랍니다  \r\n\r\n획일화된 도시부근 캠핑장을 탈피해 강원도 어떠세요 ? \r\n안와보신 캠퍼님은 있어도 한번만 오시는 캠퍼님은 없다고 하죠 ? ~ 강원도 자연에 무릎을 탁~\r\n\r\n양양의 오색 산새소리 캠핑장은 해발 1004m 천혜의 자연을 그대로 보존하고있는 백두대간 대청봉에서 부터 내려오는 계곡을 끼고서 굽이굽이 설악산 한계령의 경치를 감탄하면서 내려오면 있는 첫번째마을 , 작은 오색 동네 한 귀퉁이에 조그맣게 자리잡고 있어요\r\n\r\n진정으로 자연과 산자락을 보며 즐기면서 오신다면 \r\n한계령 고갯길을 넘어 오셔보는걸 추천드립니다^^\r\n\r\n요즘의 여느 캠핑장들처럼 화려한 부대시설은 아니지만\r\n어릴적 시골 외가집 뒷마당에 텐트치고 놀던 야영감성으로 답답했던 일상에서 벗어나 온전한 자연속에서 힐링하며 건강한 쉼과 에너지를 충전해 가시고자 하는게 산새소리 캠핑장의 모토입니다.\r\n\r\n설악산 중턱의 수려한 산새에서 뿜어져 나오는 자연의 기운과 공기는 도심에서 맛보지 못하는 휴식을 선물합니다\r\n\r\n캠핑장 인근에는 예로부터 유명한 오색약수, 오색 탄산온천도 있어서 건강한 면역력을 키우고 맑은 기운도 받아 가실 수 있어요\r\n\r\n진정한 산속 겨울캠핑 과 따뜻한 온천의 조합\r\n어떠세요? ~ \r\n\r\n매점여부 X\r\n장작은 판매합니다 10kg = 만천원\r\n▪️장작만 판매,  다른 준비물(화롯대,숯) 은 미리 준비해 오세요 )\r\n\r\n\r\n해오름의 고장 양양,  그안에서도 오색 \r\n대한민국에서 가장 공기가 좋고 조용한 곳에서 한번쯤 마음과몸을 다 내려놓고 쉬다 가세요\r\n혼자.  또는 가족과 연인과 \r\n                ','오후 10:30 ~ 오전 7:00','38.0765112066902','128.465818479203','2023-11-06 08:49:13','2023-11-06 08:49:13'),(12,5,3,'별밤 글램핑&캠핑장','전남 나주시 다시면 고막원길 20','010-2853-6249','전남 나주시 다시면 고막원길 20','/img/camp/416ed9db-3872-40b0-bc6b-b6d1e3326c84_camp2layout.jpg','2023-11-27','2023-12-31',NULL,'가족, 연인 등 힐링 할 수 있는 별밤.\r\n☆ 개인 화장실 12동 구비. \r\n☆ 도시를 떠나 가족, 연인 등 힐링 할 수있는 별밤. \r\n☆ 아이들이 마음껏 뛰어 놀 수 있는 별밤.\r\n☆ 도시에서 접근성이 좋은 별밤. \r\n☆ 깨끗하고 청결한 별밤.\r\n☆ 밤에는 별이 많이 보이는 별밤.\r\n☆ 매너를 중요시 하는 별밤.\r\n                ','오후 10:00 ~ 오전 7:00','35.0274956317409','126.609258668447','2023-11-07 04:02:32','2023-11-07 04:02:32'),(13,3,3,'포천 산마루글램핑카라반','경기 포천시 이동면 연곡리 602-1','010-4691-6813','경기 포천시 이동면 연곡리 602-1','/img/camp/c79973cc-632c-4449-925f-86d0e67aa390_camp3layout.jpg','2023-12-01','2024-01-17',NULL,'2022년 최신형 카라반입니다~\r\n\r\n경기 포천시 이동면 연곡리 603.\r\n산마루글램핑카라반입니다.\r\n예쁜 숲속 작은계곡을 품고있고\r\n예쁜정원과 조용한 쉼이되는 공간입니다.\r\n2022년 반입된 최신식카라반입니다.\r\n가족,연인들의 편안한 휴식공간입니다.\r\n조금더 자세한 사항은 홈페이지에서 확인이 가능합니다.\r\nhttps://sanmarucaravan.modoo.at/\r\n\r\n\r\n푸른산마루펜션도 함께 운영하고 있으니\r\n예약이 필요할시 참고해주세요\r\nhttp://marups.com/\r\n푸른산마루펜션 주소입니다.\r\n\r\n포천시 이동면 연곡리603','오후 11:00 ~ 오전 8:00','37.9947159655601','127.374466370177','2023-11-09 02:13:33','2023-11-09 02:13:33'),(15,7,3,'레끄레오 캠프','경북 청도군 금천면 선암로 387-116','010-2118-4424','경북 청도군 금천면 선암로 387-116','/img/camp/6cb444fa-d5b4-476e-8ddf-b42a2fd74fb5_camp5layout.png','2023-11-18','2024-01-24',NULL,'청도의 뷰 맛집 레끄레오 캠프 :-)\r\n레끄레오 캠프를 찾아주시는 모든 캠퍼분들이\r\n진정한 쉼과 힐링의 기운을 받으셨으면 좋겠습니다.\r\n\r\n뜨거운 햇빛 아래 너무 지칠때는 실내에서 에어컨 바람에서 잠시 쉬세요..\r\n아이들은 실내 트램폴린을 즐겨요..\r\n\r\n찌든 일상에서 벗어나 자연 경관과 함께,\r\n싱글한 바람과 함께, 그리고 레끄레오 캠프와 함께\r\n\r\n여러분의 휴식을 만들어가보는건 어떨까요?\r\n\r\n모두가 만족할수 있는 레끄레오캠프 만들도록\r\n최선의 노력을 다하겠습니다 감사합니다 :-)','오후 10:00 ~ 오전 7:00','35.6748139896056','128.887573888072','2023-11-09 02:47:00','2023-11-09 02:47:00'),(18,2,3,'아르보리아(사르데냐) 캠핑장','인천 강화군 길상면 장흥리 211-75','010-2334-2002','인천 강화군 길상면 장흥리 211-75','/img/camp/2e5cbf31-699a-4205-bef1-e4693679f3fa_camp4layout.png','2023-11-20','2023-12-17',NULL,'강화도 숲속에 자연과 함께하는 캠핑장입니다\r\n+++\r\n저희 캠핑장은 조용한 쉼터로 couple과 family 위주로 운영하고 있어서,\r\n사이트당 4인 이상은 사전협의가 필요하오니  양해부탁드립니다.  \r\n\r\n<<<산불 예방을 위하여, 사이트별 소화기를 꼭 확인해 주시고, 건조한 시기에는 BBQ를 제외한 과도한 장작불 사용은 자제를 부탁드립니다.>>> \r\n\r\n<<<또, 전기자동차 충전은 안전장치 미비 (캠핑장 전체전원 down , 화재위험 )등으로 불가합니다.>>>\r\n\r\n사랑하는 사람들과 함께 오셔서 천혜의 자연과 맑은 공기를 맘껏 즐겨보세요.\r\n캠핑장 뿐만 아니라 근처 5Km내에는 관광과 체험할 만한 좋은 곳들이 즐비합니다.\r\n\r\n근처에는 전등사 등 유서깊은 관광지 뿐아니고,  루지장, 낚시터,  미술관도 있으니, 몸과 마음을 힐링하세요 : )','오후 10:00 ~ 오전 7:00','37.6104495570215','126.507411689071','2023-11-15 02:42:59','2023-11-15 02:42:59');
/*!40000 ALTER TABLE `campproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camptype`
--

DROP TABLE IF EXISTS `camptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camptype` (
  `camptype_no` int NOT NULL AUTO_INCREMENT,
  `camptype_name` varchar(500) NOT NULL,
  `camptype_img` varchar(100) NOT NULL,
  PRIMARY KEY (`camptype_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camptype`
--

LOCK TABLES `camptype` WRITE;
/*!40000 ALTER TABLE `camptype` DISABLE KEYS */;
INSERT INTO `camptype` VALUES (1,'오토캠핑','/img/camp/campicon1.png'),(2,'글램핑','/img/camp/campicon2.png'),(3,'카라반','/img/camp/campicon3.png'),(4,'펜션','/img/camp/campicon4.png'),(5,'캠프닉','/img/camp/campicon5.png');
/*!40000 ALTER TABLE `camptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_no` int NOT NULL AUTO_INCREMENT,
  `cart_cnt` int DEFAULT NULL,
  `product_no` int NOT NULL,
  `user_no` int NOT NULL,
  `cart_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_no`),
  KEY `FK_PRODUCT_TO_CART_1` (`product_no`),
  KEY `FK_USER_TO_CART_1` (`user_no`),
  CONSTRAINT `FK_USER_TO_CART_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (11,1,1,2,'2023-11-13 03:47:37'),(12,1,2,2,'2023-11-13 03:47:37'),(13,1,3,2,'2023-11-13 03:47:37'),(14,1,4,2,'2023-11-13 03:47:37'),(15,1,5,2,'2023-11-13 03:47:37'),(18,1,2,2,'2023-11-13 03:52:02'),(19,1,8,3,'2023-11-13 04:08:08');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delively_no` int NOT NULL AUTO_INCREMENT,
  `order_no` int NOT NULL,
  PRIMARY KEY (`delively_no`),
  KEY `FK_ORDER_TO_DELIVERY_1` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (2,1),(3,2),(4,3),(5,4),(6,5),(7,13),(8,14),(9,15),(10,16),(11,17),(12,18),(13,19),(14,20),(15,21),(16,22),(17,23),(18,24),(19,25),(20,26),(21,27),(22,28),(23,29),(24,30),(25,31),(26,32),(27,33),(28,34),(29,35),(30,36),(31,37),(32,38),(33,39),(34,40),(35,41),(36,42),(37,43),(38,44),(39,45),(40,46),(41,47),(42,48),(43,49),(44,50),(45,51),(46,52),(47,53),(48,54),(49,55),(50,56);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environment`
--

DROP TABLE IF EXISTS `environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `environment` (
  `environment_no` int NOT NULL AUTO_INCREMENT,
  `camp_no` int NOT NULL,
  `environmenttype_no` int NOT NULL,
  `environment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`environment_no`),
  KEY `FK_CAMPPRODUCT_TO_ENVIRONMENT_1` (`camp_no`),
  KEY `FK_ENVIRONMENTTYPE_TO_ENVIRONMENT_1` (`environmenttype_no`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment`
--

LOCK TABLES `environment` WRITE;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
INSERT INTO `environment` VALUES (2,2,3,'2023-11-01 06:08:54'),(6,10,2,'2023-11-06 08:43:44'),(12,16,2,'2023-11-10 03:45:53'),(16,11,1,'2023-11-15 01:06:28'),(17,12,1,'2023-11-15 02:31:29'),(18,13,3,'2023-11-15 02:36:21'),(19,18,2,'2023-11-15 02:42:59'),(21,15,1,'2023-11-15 02:47:01'),(22,1,5,'2023-12-27 04:06:19');
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environmenttype`
--

DROP TABLE IF EXISTS `environmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `environmenttype` (
  `environmenttype_no` int NOT NULL AUTO_INCREMENT,
  `environmenttype_name` varchar(100) NOT NULL,
  PRIMARY KEY (`environmenttype_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environmenttype`
--

LOCK TABLES `environmenttype` WRITE;
/*!40000 ALTER TABLE `environmenttype` DISABLE KEYS */;
INSERT INTO `environmenttype` VALUES (1,'산'),(2,'바다'),(3,'계곡/강/호수'),(4,'평야'),(5,'도심');
/*!40000 ALTER TABLE `environmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `facility_no` int NOT NULL AUTO_INCREMENT,
  `facilitytype_no` int NOT NULL,
  `camp_no` int NOT NULL,
  `facility_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`facility_no`),
  KEY `FK_FACILITYTYPE_TO_FACILITY_1` (`facilitytype_no`),
  KEY `FK_CAMPPRODUCT_TO_FACILITY_1` (`camp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (6,5,2,'2023-11-01 07:09:33'),(19,0,10,'2023-11-06 08:43:44'),(44,1,16,'2023-11-10 03:45:53'),(51,1,11,'2023-11-15 01:06:28'),(52,2,11,'2023-11-15 01:06:28'),(53,3,11,'2023-11-15 01:06:28'),(54,4,11,'2023-11-15 01:06:28'),(55,5,11,'2023-11-15 01:06:28'),(56,7,11,'2023-11-15 01:06:28'),(57,1,12,'2023-11-15 02:31:29'),(58,2,12,'2023-11-15 02:31:29'),(59,3,12,'2023-11-15 02:31:29'),(60,5,12,'2023-11-15 02:31:29'),(61,7,12,'2023-11-15 02:31:29'),(62,1,13,'2023-11-15 02:36:20'),(63,2,13,'2023-11-15 02:36:20'),(64,3,13,'2023-11-15 02:36:20'),(65,4,13,'2023-11-15 02:36:20'),(66,5,13,'2023-11-15 02:36:20'),(67,6,13,'2023-11-15 02:36:20'),(68,7,13,'2023-11-15 02:36:21'),(69,1,18,'2023-11-15 02:42:59'),(70,2,18,'2023-11-15 02:42:59'),(71,3,18,'2023-11-15 02:42:59'),(72,5,18,'2023-11-15 02:42:59'),(73,7,18,'2023-11-15 02:42:59'),(75,1,15,'2023-11-15 02:47:01'),(76,1,1,'2023-12-27 04:06:19'),(77,2,1,'2023-12-27 04:06:19'),(78,7,1,'2023-12-27 04:06:19');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilitytype`
--

DROP TABLE IF EXISTS `facilitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilitytype` (
  `facilitytype_no` int NOT NULL AUTO_INCREMENT,
  `facilitytype_name` varchar(200) NOT NULL,
  `facilitytype_img` varchar(100) NOT NULL,
  PRIMARY KEY (`facilitytype_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilitytype`
--

LOCK TABLES `facilitytype` WRITE;
/*!40000 ALTER TABLE `facilitytype` DISABLE KEYS */;
INSERT INTO `facilitytype` VALUES (1,'화장실','/img/camp/Toilet_Paper.png'),(2,'샤워실','/img/camp/Safety_Shower.png'),(3,'개수대','/img/camp/Water_Pipe.png'),(4,'매점','/img/camp/Shopping_cart.png'),(5,'바베큐장','/img/camp/Rack_of_Lamb.png'),(6,'전기차충전소','/img/camp/Electric_car.png'),(7,'주차장','/img/camp/Local_parking.png');
/*!40000 ALTER TABLE `facilitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `favorites_no` int NOT NULL AUTO_INCREMENT,
  `camp_no` int NOT NULL,
  `user_no` int NOT NULL,
  `favorites_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`favorites_no`),
  KEY `FK_CAMPPRODUCT_TO_FAVORITES_1` (`camp_no`),
  KEY `FK_USER_TO_FAVORITES_1` (`user_no`),
  CONSTRAINT `FK_CAMPPRODUCT_TO_FAVORITES_1` FOREIGN KEY (`camp_no`) REFERENCES `campproduct` (`camp_no`),
  CONSTRAINT `FK_USER_TO_FAVORITES_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (2,2,2,'2023-11-01 07:10:52');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_no` int NOT NULL AUTO_INCREMENT,
  `product_no` int NOT NULL,
  `user_no` int NOT NULL,
  `order_cnt` int DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `order_number` varchar(500) DEFAULT NULL,
  `reservation_no` int NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cp_dt_no` int DEFAULT NULL,
  `camp_no` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`order_no`),
  KEY `FK_PRODUCT_TO_ORDER_1` (`product_no`),
  KEY `FK_USER_TO_ORDER_1` (`user_no`),
  KEY `FK_RESERVATION_TO_ORDER_1` (`reservation_no`),
  KEY `FK_CAMPPRODUCT_TO_ORDER_1_idx` (`camp_no`),
  KEY `FK_CAMPDETAIL_TO_ORDER_1_idx` (`cp_dt_no`),
  CONSTRAINT `FK_CAMPDETAIL_TO_ORDER_1` FOREIGN KEY (`cp_dt_no`) REFERENCES `campdetail` (`cp_dt_no`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_CAMPPRODUCT_TO_ORDER_1` FOREIGN KEY (`camp_no`) REFERENCES `campproduct` (`camp_no`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_USER_TO_ORDER_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3,1,2,10,'2023-11-20','2023-12-13','adsdasdwe',1,'2023-11-01 07:18:36',NULL,NULL,NULL),(4,1,2,10,'2023-11-20','2023-12-13','adsdasdwe',2,'2023-11-01 07:18:51',NULL,NULL,NULL),(5,2,2,10,'2023-11-20','2023-12-13','asdddsada',3,'2023-11-10 06:07:38',NULL,NULL,NULL),(6,3,2,11,'2023-11-20','2023-12-13','asdddsada',4,'2023-11-10 06:08:09',NULL,NULL,NULL),(7,1,2,3,'2023-11-20','2023-11-30','808333',2,'2023-11-10 08:19:56',1,2,NULL),(8,2,2,1,'2023-11-20','2023-11-30','808333',2,'2023-11-10 08:19:56',1,2,NULL),(10,1,2,3,'2023-11-10','2023-11-12','538858',7,'2023-11-10 09:38:36',1,1,NULL),(11,2,2,1,'2023-11-10','2023-11-12','538858',7,'2023-11-10 09:38:36',1,1,NULL),(12,9,2,1,'2023-11-10','2023-11-12','538858',7,'2023-11-10 09:38:36',1,1,NULL),(13,1,2,3,'2023-11-10','2023-11-12','354346',7,'2023-11-10 09:38:39',1,1,NULL),(14,2,2,1,'2023-11-10','2023-11-12','354346',7,'2023-11-10 09:38:39',1,1,NULL),(15,9,2,1,'2023-11-10','2023-11-12','354346',7,'2023-11-10 09:38:39',1,1,NULL),(16,1,2,3,'2023-11-10','2023-11-12','527007',7,'2023-11-10 09:38:47',1,1,NULL),(17,2,2,1,'2023-11-10','2023-11-12','527007',7,'2023-11-10 09:38:47',1,1,NULL),(18,9,2,1,'2023-11-10','2023-11-12','527007',7,'2023-11-10 09:38:47',1,1,NULL),(19,1,2,3,'2023-11-09','2023-11-12','831032',10,'2023-11-10 09:39:10',1,1,NULL),(20,2,2,1,'2023-11-09','2023-11-12','831032',10,'2023-11-10 09:39:10',1,1,NULL),(21,9,2,1,'2023-11-09','2023-11-12','831032',10,'2023-11-10 09:39:10',1,1,NULL),(22,1,2,5,'2023-11-20','2023-11-30','355704',2,'2023-11-11 05:56:11',1,2,NULL),(23,2,2,4,'2023-11-20','2023-11-30','355704',2,'2023-11-11 05:56:11',1,2,NULL),(24,9,2,1,'2023-11-20','2023-11-30','355704',2,'2023-11-11 05:56:11',1,2,NULL),(25,1,2,5,'2023-11-11','2023-11-26','631162',12,'2023-11-11 06:02:04',NULL,2,NULL),(26,2,2,4,'2023-11-11','2023-11-26','631162',12,'2023-11-11 06:02:04',NULL,2,NULL),(27,9,2,1,'2023-11-11','2023-11-26','631162',12,'2023-11-11 06:02:04',NULL,2,NULL),(28,1,2,5,'2023-11-09','2023-11-12','005868',10,'2023-11-11 06:26:02',1,1,NULL),(29,2,2,4,'2023-11-09','2023-11-12','005868',10,'2023-11-11 06:26:02',1,1,NULL),(30,9,2,1,'2023-11-09','2023-11-12','005868',10,'2023-11-11 06:26:02',1,1,NULL),(31,1,2,7,'2023-11-20','2023-11-30','654235',2,'2023-11-11 06:26:23',1,2,NULL),(32,2,2,6,'2023-11-20','2023-11-30','654235',2,'2023-11-11 06:26:23',1,2,NULL),(33,9,2,3,'2023-11-20','2023-11-30','654235',2,'2023-11-11 06:26:23',1,2,NULL),(34,1,2,7,'2023-11-20','2023-11-30','524800',2,'2023-11-11 06:26:49',1,2,NULL),(35,2,2,6,'2023-11-20','2023-11-30','524800',2,'2023-11-11 06:26:49',1,2,NULL),(36,9,2,3,'2023-11-20','2023-11-30','524800',2,'2023-11-11 06:26:49',1,2,NULL),(37,1,2,7,'2023-11-11','2023-11-18','241468',15,'2023-11-11 06:30:51',NULL,2,NULL),(38,2,2,6,'2023-11-11','2023-11-18','241468',15,'2023-11-11 06:30:51',NULL,2,NULL),(39,9,2,3,'2023-11-11','2023-11-18','241468',15,'2023-11-11 06:30:51',NULL,2,NULL),(40,1,2,7,'2023-11-10','2023-11-24','287022',8,'2023-11-11 06:41:06',1,1,NULL),(41,2,2,6,'2023-11-10','2023-11-24','287022',8,'2023-11-11 06:41:06',1,1,NULL),(42,9,2,3,'2023-11-10','2023-11-24','287022',8,'2023-11-11 06:41:06',1,1,NULL),(43,1,2,7,'2023-11-20','2023-11-30','202384',2,'2023-11-11 06:41:28',1,2,NULL),(44,2,2,6,'2023-11-20','2023-11-30','202384',2,'2023-11-11 06:41:28',1,2,NULL),(45,9,2,3,'2023-11-20','2023-11-30','202384',2,'2023-11-11 06:41:28',1,2,NULL),(46,1,2,7,'2023-11-09','2023-11-12','155817',10,'2023-11-11 06:42:34',1,1,NULL),(47,2,2,6,'2023-11-09','2023-11-12','155817',10,'2023-11-11 06:42:34',1,1,NULL),(48,9,2,3,'2023-11-09','2023-11-12','155817',10,'2023-11-11 06:42:34',1,1,NULL),(49,1,2,7,'2023-11-09','2023-11-12','874303',10,'2023-11-11 06:43:11',1,1,NULL),(50,2,2,6,'2023-11-09','2023-11-12','874303',10,'2023-11-11 06:43:11',1,1,NULL),(51,9,2,3,'2023-11-09','2023-11-12','874303',10,'2023-11-11 06:43:11',1,1,NULL),(52,1,2,1,'2023-11-11','2023-11-18','677113',15,'2023-11-13 03:50:19',NULL,2,NULL),(53,2,2,1,'2023-11-11','2023-11-18','677113',15,'2023-11-13 03:50:19',NULL,2,NULL),(54,3,2,1,'2023-11-11','2023-11-18','677113',15,'2023-11-13 03:50:19',NULL,2,NULL),(55,4,2,1,'2023-11-11','2023-11-18','677113',15,'2023-11-13 03:50:19',NULL,2,NULL),(56,5,2,1,'2023-11-11','2023-11-18','677113',15,'2023-11-13 03:50:19',NULL,2,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `pm_no` int NOT NULL AUTO_INCREMENT,
  `order_number` int NOT NULL,
  `pm_type` varchar(100) NOT NULL,
  `pm_price` varchar(200) NOT NULL,
  `pm_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pm_no`),
  KEY `FK_ORDER_TO_PAYMENTS_1` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (2,1,'카드','20000000','2023-11-01 07:21:49'),(3,2,'무통장입금','20000000','2023-11-01 07:21:56'),(4,354346,'무통장입금','280000000','2023-11-10 09:38:39'),(5,527007,'무통장입금','280000000','2023-11-10 09:38:47'),(6,831032,'무통장입금','420000000','2023-11-10 09:39:10'),(7,355704,'무통장입금','2200000000','2023-11-11 05:56:11'),(8,631162,'무통장입금','3300000000','2023-11-11 06:02:04'),(9,5868,'무통장입금','660000000','2023-11-11 06:26:02'),(10,654235,'무통장입금','4600000000','2023-11-11 06:26:23'),(11,524800,'카드','4600000000','2023-11-11 06:26:49'),(12,241468,'무통장입금','3220000000','2023-11-11 06:30:51'),(13,287022,'무통장입금','6440000000','2023-11-11 06:41:06'),(14,202384,'무통장입금','4600000000','2023-11-11 06:41:28'),(15,155817,'무통장입금','1380000000','2023-11-11 06:42:34'),(16,874303,'무통장입금','1380000000','2023-11-11 06:43:11'),(17,677113,'무통장입금','1050000000','2023-11-13 03:50:19');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persistent_logins` (
  `series` varchar(64) NOT NULL,
  `username` varchar(100) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_no` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(500) DEFAULT NULL,
  `product_thumnail` varchar(500) DEFAULT NULL,
  `product_con` text,
  `product_intro` text,
  `product_category` varchar(100) DEFAULT NULL,
  `product_price` int DEFAULT NULL COMMENT '1일 대여 상품 금액',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'1','/img/product/3d5486f7-470c-496f-a5ef-707ff8d29c1a_20231115_103134.png','상품1','상품설명1','텐트',10000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(2,'2','/img/product/ec0dea80-eac1-4c24-8e49-952691747854_20231115_130430.png','상품2','상품설명2','테이블',20000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(3,'3','/img/product/ea077570-4059-489b-9f31-938f49553004_20231115_114638.png','상품3','상품설명3','체어',30000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(4,'4','/img/product/e852750a-48aa-4d40-9511-f32144367472_20231115_121727.png','상품4','상품설명4','매트',40000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(5,'5','/img/product/e24571e6-d496-434b-9eba-cd92f40aa695_20231115_121523.png','상품5','상품설명5','조명',50000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(6,'6','/img/product/e368dbf1-e492-4fc1-8e63-51172fcb3819_20231115_110337.png','상품6','상품설명6','화로대',60000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(7,'7','/img/product/e54ecdea-526f-4ff6-8257-062f0bbbfe14_20231115_114352.png','상품7','상품설명7','타프',70000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(8,'8','/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','상품8','상품설명8','수납',80000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(9,'9','/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','상품9','상품설명9','캠핑가전',90000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(10,'10','/img/product/db76c0ab-8301-4a19-a4cb-ecafeaade585_20231115_113320.png','상품10','상품설명10','주방용품',100000000,'2023-11-01 07:28:23','2023-11-01 07:28:23'),(12,'의자','/img/product/daeb5552-223b-4059-9ceb-81ac02f4a849_20231115_114448.png','C:/upload/f463b7a9-fe3c-4221-a72e-4adab7eea70f_camp1-5.jpg','123123','체어',123123,'2023-11-15 03:20:43','2023-11-15 03:20:43');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimg`
--

DROP TABLE IF EXISTS `productimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimg` (
  `productimg_no` int NOT NULL AUTO_INCREMENT,
  `product_no` int NOT NULL,
  `productimg_url` varchar(500) NOT NULL,
  `productimg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`productimg_no`),
  KEY `FK_PRODUCT_TO_PRODUCTIMG_1` (`product_no`),
  CONSTRAINT `FK_PRODUCT_TO_PRODUCTIMG_1` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimg`
--

LOCK TABLES `productimg` WRITE;
/*!40000 ALTER TABLE `productimg` DISABLE KEYS */;
INSERT INTO `productimg` VALUES (1,1,'/img/productdetail.jpg','2023-11-01 07:30:07'),(2,1,'/img/productdetai2.jpg','2023-11-01 07:30:10'),(3,1,'/img/productdetai3.jpg','2023-11-01 07:30:11'),(4,1,'/img/productdetai4.jpg','2023-11-01 07:30:13'),(5,1,'/img/productdetai5.jpg','2023-11-01 07:30:15'),(6,2,'/img/productdetai1.jpg','2023-11-01 07:30:27'),(7,2,'/img/productdetai2.jpg','2023-11-01 07:30:33'),(8,2,'/img/productdetai3.jpg','2023-11-01 07:30:34'),(9,2,'/img/productdetai4.jpg','2023-11-01 07:30:36'),(10,2,'/img/productdetai5.jpg','2023-11-01 07:30:37'),(11,3,'/img/productdetai1.jpg','2023-11-01 07:30:45'),(12,3,'/img/productdetai2.jpg','2023-11-01 07:30:46'),(13,3,'/img/productdetai3.jpg','2023-11-01 07:30:47'),(14,3,'/img/productdetai4.jpg','2023-11-01 07:30:48'),(15,3,'/img/productdetai5.jpg','2023-11-01 07:30:49'),(16,4,'/img/productdetai1.jpg','2023-11-01 07:30:54'),(17,4,'/img/productdetai2.jpg','2023-11-01 07:30:55'),(18,4,'/img/productdetai3.jpg','2023-11-01 07:30:56'),(19,4,'/img/productdetai4.jpg','2023-11-01 07:30:57'),(20,4,'/img/productdetai5.jpg','2023-11-01 07:30:59'),(21,5,'/img/productdetai1.jpg','2023-11-01 07:31:04'),(22,5,'/img/productdetai2.jpg','2023-11-01 07:31:05'),(23,5,'/img/productdetai3.jpg','2023-11-01 07:31:06'),(24,5,'/img/productdetai4.jpg','2023-11-01 07:31:08'),(25,5,'/img/productdetai5.jpg','2023-11-01 07:31:09'),(26,6,'/img/productdetai1.jpg','2023-11-01 07:31:14'),(27,6,'/img/productdetai2.jpg','2023-11-01 07:31:15'),(28,6,'/img/productdetai3.jpg','2023-11-01 07:31:16'),(29,6,'/img/productdetai4.jpg','2023-11-01 07:31:17'),(30,6,'/img/productdetai5.jpg','2023-11-01 07:31:18'),(31,7,'/img/productdetai1.jpg','2023-11-01 07:31:24'),(32,7,'/img/productdetai2.jpg','2023-11-01 07:31:25'),(33,7,'/img/productdetai3.jpg','2023-11-01 07:31:25'),(34,7,'/img/productdetai4.jpg','2023-11-01 07:31:26'),(35,7,'/img/productdetai5.jpg','2023-11-01 07:31:28'),(36,8,'/img/productdetai1.jpg','2023-11-01 07:31:33'),(37,8,'/img/productdetai2.jpg','2023-11-01 07:31:34'),(38,8,'/img/productdetai3.jpg','2023-11-01 07:31:35'),(39,8,'/img/productdetai4.jpg','2023-11-01 07:31:36'),(40,8,'/img/productdetai5.jpg','2023-11-01 07:31:37'),(41,9,'/img/productdetai1.jpg','2023-11-01 07:31:42'),(42,9,'/img/productdetai2.jpg','2023-11-01 07:31:43'),(43,9,'/img/productdetai3.jpg','2023-11-01 07:31:44'),(44,9,'/img/productdetai4.jpg','2023-11-01 07:31:45'),(45,9,'/img/productdetai5.jpg','2023-11-01 07:31:46'),(46,10,'/img/productdetai1.jpg','2023-11-01 07:31:51'),(47,10,'/img/productdetai2.jpg','2023-11-01 07:31:52'),(48,10,'/img/productdetai3.jpg','2023-11-01 07:31:53'),(49,10,'/img/productdetai4.jpg','2023-11-01 07:31:54'),(50,10,'/img/productdetai5.jpg','2023-11-01 07:31:56'),(57,12,'C:/upload/dc43ca36-5d0c-470c-9f65-5284297b130c_camp1-1-1.jpg','2023-11-15 03:20:43'),(58,12,'C:/upload/b62f92d4-22d8-407e-85f7-99b362d9eda8_camp1-1-2.jpg','2023-11-15 03:20:43'),(59,12,'C:/upload/c87afff2-e555-4a3c-8c81-cbd517f098ea_camp1-1-3.jpg','2023-11-15 03:20:43'),(60,12,'C:/upload/77df62b5-e956-4a66-a8f9-735852619cab_camp1-2.jpg','2023-11-15 03:20:43'),(61,12,'C:/upload/6cad58b0-37e7-490b-877a-ecfec2313041_camp1-3.jpg','2023-11-15 03:20:43'),(62,12,'C:/upload/a1bfc6f6-fbb6-468f-aed7-3ad91aba6b81_camp1-4.jpg','2023-11-15 03:20:43'),(63,12,'C:/upload/a1ab82ea-422b-46ea-b030-585fd0231918_camp1-5.jpg','2023-11-15 03:20:43');
/*!40000 ALTER TABLE `productimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productreview`
--

DROP TABLE IF EXISTS `productreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productreview` (
  `pr_no` int NOT NULL AUTO_INCREMENT,
  `order_no` int NOT NULL,
  `user_no` int NOT NULL,
  `product_no` int NOT NULL,
  `pr_img` varchar(500) DEFAULT NULL,
  `pr_title` varchar(500) DEFAULT NULL,
  `pr_con` text,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pr_no`),
  KEY `FK_ORDER_TO_PRODUCTREVIEW_1` (`order_no`),
  KEY `FK_USER_TO_PRODUCTREVIEW_1` (`user_no`),
  KEY `FK_PRODUCT_TO_PRODUCTREVIEW_1` (`product_no`),
  CONSTRAINT `FK_PRODUCT_TO_PRODUCTREVIEW_1` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`),
  CONSTRAINT `FK_USER_TO_PRODUCTREVIEW_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productreview`
--

LOCK TABLES `productreview` WRITE;
/*!40000 ALTER TABLE `productreview` DISABLE KEYS */;
INSERT INTO `productreview` VALUES (2,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','짱조은 것였음','덕분에~','2023-11-01 07:34:28','2023-11-01 07:34:28'),(3,2,2,2,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','진짜 최고의 캠핑','덕분에~','2023-11-01 07:34:37','2023-11-01 07:34:37'),(4,2,2,10,'/img/product/d140b1bb-01ab-4248-acc0-23963a26f87d_20231115_100356.png','이용한 사람들끼리','이용한 사람들끼리이용한 사람들끼리','2023-11-10 09:12:41','2023-11-10 09:12:41'),(5,14,2,2,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','진짜 최고의 캠핑','진짜 최고의 캠핑진짜 최고의 캠핑진짜 최고의 캠핑진짜 최고의 캠핑','2023-11-13 02:06:28','2023-11-13 02:06:28'),(6,3,2,1,'/img/product/d140b1bb-01ab-4248-acc0-23963a26f87d_20231115_100356.png','가족들이랑 이용했어요','개좋은 물건','2023-11-13 04:03:12','2023-11-13 04:03:12'),(7,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','개좋은 물건','가족들이랑 이용했어요','2023-11-13 04:03:21','2023-11-13 04:03:21'),(8,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','이용한 사람들끼리','개좋은 물건','2023-11-13 04:03:21','2023-11-13 04:03:21'),(9,3,2,1,'/img/product/d140b1bb-01ab-4248-acc0-23963a26f87d_20231115_100356.png','가족들이랑 이용했어요','이용한 사람들끼리','2023-11-13 04:03:21','2023-11-13 04:03:21'),(10,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','개좋은 물건','진짜 최고의 캠핑','2023-11-13 04:03:22','2023-11-13 04:03:22'),(11,3,2,1,'/img/product/d140b1bb-01ab-4248-acc0-23963a26f87d_20231115_100356.png','이용한 사람들끼리','가족들이랑 이용했어요','2023-11-13 04:03:22','2023-11-13 04:03:22'),(12,3,2,1,'/img/product/d140b1bb-01ab-4248-acc0-23963a26f87d_20231115_100356.png','개좋은 물건','개좋은 물건','2023-11-13 04:03:22','2023-11-13 04:03:22'),(13,3,2,1,'/img/product/d140b1bb-01ab-4248-acc0-23963a26f87d_20231115_100356.png','가족들이랑 이용했어요','진짜 최고의 캠핑','2023-11-13 04:03:22','2023-11-13 04:03:22'),(14,3,2,1,'/img/product/d140b1bb-01ab-4248-acc0-23963a26f87d_20231115_100356.png','의자 잘 이용했어요!','개좋은 물건','2023-11-13 04:03:22','2023-11-13 04:03:22'),(15,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','개좋은 물건','진짜 최고의 캠핑','2023-11-13 04:03:23','2023-11-13 04:03:23'),(16,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','의자 잘 이용했어요!','너무 잘 이용하다가 즐기다 갑니다.','2023-11-13 04:03:23','2023-11-13 04:03:23'),(17,3,2,1,'/img/product/d140b1bb-01ab-4248-acc0-23963a26f87d_20231115_100356.png','너무 재미있던~~~~','꼭 이거 대여하세요','2023-11-13 04:03:23','2023-11-13 04:03:23'),(18,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','꼭 이거 대여해주심 좋겠어요','진짜 최고당','2023-11-13 04:03:23','2023-11-13 04:03:23'),(19,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','너무 좋은 물건','개좋은 물건','2023-11-13 04:03:23','2023-11-13 04:03:23'),(20,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','개좋은 물건','짱조은 것였음','2023-11-13 04:03:23','2023-11-13 04:03:23'),(21,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','짱조은 것였음','가족들이랑 이용했어요','2023-11-13 04:03:24','2023-11-13 04:03:24'),(22,3,2,1,'/img/product/d4d309cf-0a75-4084-975c-e93ca94cce84_20231115_105922.png','가족들이랑 이용했어요','이용한 사람들끼리','2023-11-13 04:03:24','2023-11-13 04:03:24'),(23,3,2,1,'/img/product/cc28f483-c8b2-4764-91a6-14acad1d0b12_20231115_120856.png','이용한 사람들끼리','찰칵찰칵 잘했어요','2023-11-13 04:03:24','2023-11-13 04:03:24'),(24,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','찰칵찰칵 잘했어요','진짜 최고의 캠핑','2023-11-13 04:03:24','2023-11-13 04:03:24'),(25,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','진짜 최고의 캠핑','덕분에~','2023-11-13 04:03:24','2023-11-13 04:03:24'),(26,3,2,1,'/img/product/e2d875ad-a365-4d9e-af4e-8df0a9141a7b_20231115_113435.png','덕분에~','너무 좋은 물건','2023-11-13 04:03:24','2023-11-13 04:03:24');
/*!40000 ALTER TABLE `productreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsave`
--

DROP TABLE IF EXISTS `productsave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsave` (
  `productsave_no` int NOT NULL AUTO_INCREMENT,
  `product_no` int NOT NULL,
  `user_no` int NOT NULL,
  PRIMARY KEY (`productsave_no`),
  KEY `FK_PRODUCT_TO_PRODUCTSAVE_1` (`product_no`),
  KEY `FK_USER_TO_PRODUCTSAVE_1` (`user_no`),
  CONSTRAINT `FK_PRODUCT_TO_PRODUCTSAVE_1` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`),
  CONSTRAINT `FK_USER_TO_PRODUCTSAVE_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsave`
--

LOCK TABLES `productsave` WRITE;
/*!40000 ALTER TABLE `productsave` DISABLE KEYS */;
INSERT INTO `productsave` VALUES (6,2,2),(7,1,2);
/*!40000 ALTER TABLE `productsave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `region_no` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) NOT NULL,
  PRIMARY KEY (`region_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'서울'),(2,'인천'),(3,'경기도'),(4,'강원도'),(5,'전라도'),(6,'충청도'),(7,'경상도'),(8,'제주도');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_no` int NOT NULL AUTO_INCREMENT,
  `cp_dt_no` int NOT NULL,
  `camp_no` int NOT NULL,
  `user_no` int NOT NULL,
  `reservation_nop` int DEFAULT NULL,
  `reservation_start` date NOT NULL,
  `reservation_end` date NOT NULL,
  `reservation_date` int DEFAULT NULL,
  `camp_paymenttype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reservation_no`),
  KEY `FK_CAMPDETAIL_TO_RESERVATION_1` (`camp_no`),
  KEY `FK_USER_TO_RESERVATION_1` (`user_no`),
  CONSTRAINT `FK_USER_TO_RESERVATION_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,2,10,'2023-11-20','2023-11-30',10,NULL),(2,1,2,2,10,'2023-11-20','2023-11-30',10,NULL),(3,1,1,2,12,'2023-11-07','2023-11-10',0,NULL),(4,1,1,2,11,'2023-11-08','2023-11-11',0,'card'),(5,1,1,2,112,'2023-11-08','2023-11-11',0,'bankbook'),(6,1,1,3,3,'2023-11-01','2023-11-10',0,'card'),(7,1,1,2,5,'2023-11-10','2023-11-12',2,'bankbook'),(8,1,1,2,8,'2023-11-10','2023-11-24',14,'card'),(9,1,1,2,9,'2023-11-10','2023-11-18',8,NULL),(10,1,1,2,6,'2023-11-09','2023-11-12',3,'card'),(11,1,1,3,7,'2023-11-10','2023-11-19',9,'bankbook'),(12,7,2,2,7,'2023-11-11','2023-11-26',15,'card');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_no` int NOT NULL AUTO_INCREMENT,
  `user_no` int NOT NULL,
  `camp_no` int NOT NULL,
  `reservation_no` int NOT NULL,
  `review_img` varchar(500) DEFAULT NULL,
  `review_con` text,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cp_dt_no` int NOT NULL,
  `review_title` varchar(500) NOT NULL,
  PRIMARY KEY (`review_no`),
  KEY `FK_USER_TO_REVIEW_1` (`user_no`),
  KEY `FK_CAMPPRODUCT_TO_REVIEW_1` (`camp_no`),
  KEY `FK_RESERVATION_TO_REVIEW_1` (`reservation_no`),
  KEY `FK_RESERVATION_TO_REVIEW_2` (`cp_dt_no`),
  CONSTRAINT `FK_CAMPPRODUCT_TO_REVIEW_1` FOREIGN KEY (`camp_no`) REFERENCES `campproduct` (`camp_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_TO_REVIEW_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (3,2,1,1,'/img/test.png','최고의 캠핑장을 선사해주신 캠프온 분들 감사합니다 ㅎㅎㅎㅎ','2023-11-01 06:48:15','2023-11-01 06:48:15',1,'잘놀다 갑니다!'),(4,2,1,1,'C:/upload/6f718dfb-a7cc-4027-88d4-5a68a0a441d6_dsfdsfdsf.png','감사합니다^^ 덕분에 즐거운 캠핑여행 했어요. ','2023-11-01 06:48:16','2023-11-01 06:48:16',2,'진짜 재미있었어요!');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_no` int NOT NULL AUTO_INCREMENT,
  `camp_no` int NOT NULL,
  PRIMARY KEY (`schedule_no`),
  KEY `FK_CAMPPRODUCT_TO_SCHEDULE_1` (`camp_no`),
  CONSTRAINT `FK_CAMPPRODUCT_TO_SCHEDULE_1` FOREIGN KEY (`camp_no`) REFERENCES `campproduct` (`camp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_no` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(500) DEFAULT NULL,
  `company_number` int DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_pw` varchar(100) NOT NULL,
  `user_tel` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_address` varchar(500) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `auth` varchar(45) NOT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,'관리자','admin','$2a$12$W4aRZd7V3eg6zjs85mibYuwBr2Z8mYtmG2p9chOMlxa0Iw0mtnp9i','01000000000','admin@admin.com','관리자시 관리자동 관리아파트 관리호','2023-11-01 05:47:00','2023-11-01 05:47:00','ROLE_ADMIN'),(2,'',0,'추윤주','user','$2a$10$/o8zLQSNFf112lDxVPPLmOup2dkYMYUZxEZZO6oTrGrlfG2TcAjn2','01000000000','user@user.com','유저시 유저동 유저아파트 유저호','2023-11-01 05:47:44','2023-12-27 07:21:03','ROLE_USER'),(3,'2121212',121212,'판매자','seller','$2a$12$W4aRZd7V3eg6zjs85mibYuwBr2Z8mYtmG2p9chOMlxa0Iw0mtnp9i','01000000000','seller@seller.com','판매시 판매동 판매하파트 판매호','2023-11-01 05:48:16','2023-11-01 05:48:16','ROLE_SELL'),(4,'',0,'test','test','$2a$10$FM/7e/ZMcM78TD0nuZbj1.xDjamONov7bnJhW9QcrHGUy93WvJH9i','1234','1234','1234','2023-11-02 12:43:57','2023-11-02 12:43:57','ROLE_USER'),(5,'',0,'테스트','dd','$2a$10$i29W13PPQBhnMdo6bkG0a.e0z5TVMg6lpLulT/utBZMU2WWwuTTVC','01011111111','dd@dd.dd','dd','2023-11-13 04:06:06','2023-11-13 04:06:06','ROLE_USER'),(6,'aa',123,'테스트','aa','$2a$10$GYpC5fradnovhlW/JG0zgOPX7YIPSNWkyue2MGsf4ZrHel4rnyKIS','01012341234','aa@ㅁㅁ.ㅁㅁ','aa','2023-11-13 04:07:11','2023-11-13 04:07:11','ROLE_SELL');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-10 11:06:40
