-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: withtrip
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `c_num` int(11) NOT NULL,
  `p_num` int(11) NOT NULL,
  `member_id` varchar(45) DEFAULT NULL,
  `c_acount` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_num`),
  KEY `fk_basket_product1_idx` (`p_num`),
  CONSTRAINT `fk_basket_product1` FOREIGN KEY (`p_num`) REFERENCES `product` (`p_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `e_round` int(11) NOT NULL,
  `e_sdate` datetime NOT NULL,
  `e_edate` datetime NOT NULL,
  PRIMARY KEY (`e_round`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_box`
--

DROP TABLE IF EXISTS `event_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_box` (
  `eb_num` int(11) NOT NULL,
  `eb_rank` int(11) NOT NULL,
  `eb_pull` int(11) NOT NULL,
  PRIMARY KEY (`eb_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_box`
--

LOCK TABLES `event_box` WRITE;
/*!40000 ALTER TABLE `event_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_win`
--

DROP TABLE IF EXISTS `event_win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_win` (
  `ew_num` int(11) NOT NULL,
  `member_member_id` varchar(45) NOT NULL,
  `event_event_round` int(11) NOT NULL,
  `ew_date` datetime NOT NULL,
  `ew_30000` int(11) NOT NULL,
  `ew_50000` int(11) NOT NULL,
  `ew_100000` int(11) NOT NULL,
  PRIMARY KEY (`ew_num`),
  KEY `fk_event_list_member1_idx` (`member_member_id`),
  KEY `fk_event_win_list_event1_idx` (`event_event_round`),
  CONSTRAINT `fk_event_list_member1` FOREIGN KEY (`member_member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_win_list_event1` FOREIGN KEY (`event_event_round`) REFERENCES `event` (`e_round`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_win`
--

LOCK TABLES `event_win` WRITE;
/*!40000 ALTER TABLE `event_win` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_win` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `point` int(11) NOT NULL,
  `type` varchar(400) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','1234','관리자',1,'남','123@123.111','123','2020-05-21 00:00:00',100000000,'0'),('test','1234','테스트',1,'남','121@121.121','121','2020-05-21 00:00:00',100000000,'0');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_num` int(11) NOT NULL,
  `order_name` varchar(45) NOT NULL,
  `order_phone` varchar(45) NOT NULL,
  `order_type` varchar(45) NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `order_date` varchar(45) NOT NULL,
  `member_member_id` varchar(45) NOT NULL,
  PRIMARY KEY (`order_num`),
  KEY `fk_order_member1_idx` (`member_member_id`),
  CONSTRAINT `fk_order_member1` FOREIGN KEY (`member_member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `od_num` int(11) NOT NULL,
  `od_goods_name` varchar(45) NOT NULL,
  `od_content` varchar(45) NOT NULL,
  `od_price` varchar(45) NOT NULL,
  `od_amount` varchar(45) NOT NULL,
  `order_order_num` int(11) NOT NULL,
  `product_product_num` int(11) NOT NULL,
  PRIMARY KEY (`od_num`),
  KEY `fk_orderdetail_order1_idx` (`order_order_num`),
  KEY `fk_orderdetail_product1_idx` (`product_product_num`),
  CONSTRAINT `fk_orderdetail_order1` FOREIGN KEY (`order_order_num`) REFERENCES `order` (`order_num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderdetail_product1` FOREIGN KEY (`product_product_num`) REFERENCES `product` (`p_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `pl_num` int(11) NOT NULL,
  `region_region_code` int(11) NOT NULL,
  `pl_name` varchar(45) NOT NULL,
  `pl_content` varchar(45) NOT NULL,
  `pl_address` varchar(45) NOT NULL,
  `pl_image` varchar(45) NOT NULL,
  `pl_readcount` int(11) NOT NULL,
  `pl_likecount` int(11) NOT NULL,
  `pl_date` datetime NOT NULL,
  `pl_email` varchar(45) NOT NULL,
  `pl_theme` varchar(45) NOT NULL,
  PRIMARY KEY (`pl_num`,`region_region_code`),
  KEY `fk_board_region1_idx` (`region_region_code`),
  CONSTRAINT `fk_board_region1` FOREIGN KEY (`region_region_code`) REFERENCES `region` (`region_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_comment`
--

DROP TABLE IF EXISTS `place_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_comment` (
  `pc_num` int(11) NOT NULL,
  `pc_content` varchar(45) NOT NULL,
  `pc_date` datetime NOT NULL,
  `member_member_id` varchar(45) NOT NULL,
  `pct_rank` int(11) NOT NULL,
  `place_place_num` int(11) NOT NULL,
  PRIMARY KEY (`pc_num`),
  KEY `fk_place_comment_member1_idx` (`member_member_id`),
  KEY `fk_place_comment_place1_idx` (`place_place_num`),
  CONSTRAINT `fk_place_comment_member1` FOREIGN KEY (`member_member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_place_comment_place1` FOREIGN KEY (`place_place_num`) REFERENCES `place` (`pl_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_comment`
--

LOCK TABLES `place_comment` WRITE;
/*!40000 ALTER TABLE `place_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `p_num` int(11) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `p_content` varchar(1000) NOT NULL,
  `p_image` varchar(500) NOT NULL,
  `p_price` varchar(45) NOT NULL,
  `p_amount` int(11) NOT NULL,
  `p_category` varchar(300) DEFAULT NULL,
  `region_region_code` int(11) NOT NULL,
  PRIMARY KEY (`p_num`),
  KEY `fk_product_region1_idx` (`region_region_code`),
  CONSTRAINT `fk_product_region1` FOREIGN KEY (`region_region_code`) REFERENCES `region` (`region_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `region_code` int(11) NOT NULL,
  `region_name` varchar(45) NOT NULL,
  PRIMARY KEY (`region_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `r_num` int(11) NOT NULL,
  `member_member_id` varchar(20) NOT NULL,
  `r_subject` varchar(200) NOT NULL,
  `r_content` varchar(2000) NOT NULL,
  `r_readcount` int(11) NOT NULL,
  `r_likecount` int(11) NOT NULL,
  `r_date` datetime NOT NULL,
  `r_image` varchar(500) NOT NULL,
  `region_region_code` int(11) NOT NULL,
  PRIMARY KEY (`r_num`,`member_member_id`),
  KEY `fk_review_member1_idx` (`member_member_id`),
  KEY `fk_review_region1_idx` (`region_region_code`),
  CONSTRAINT `fk_review_member1` FOREIGN KEY (`member_member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_region1` FOREIGN KEY (`region_region_code`) REFERENCES `region` (`region_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_comment`
--

DROP TABLE IF EXISTS `review_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_comment` (
  `rc_num` int(11) NOT NULL,
  `review_review_num` int(11) NOT NULL,
  `review_member_member_id` varchar(20) NOT NULL,
  `rc_content` varchar(2000) NOT NULL,
  `rc_date` date NOT NULL,
  `rc_ref` int(11) NOT NULL,
  `rc_seq` int(11) NOT NULL,
  `rct_lev` int(11) NOT NULL,
  PRIMARY KEY (`rc_num`),
  KEY `fk_review_comment_review1_idx` (`review_review_num`,`review_member_member_id`),
  CONSTRAINT `fk_review_comment_review1` FOREIGN KEY (`review_review_num`, `review_member_member_id`) REFERENCES `review` (`r_num`, `member_member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_comment`
--

LOCK TABLES `review_comment` WRITE;
/*!40000 ALTER TABLE `review_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servey_answer`
--

DROP TABLE IF EXISTS `servey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servey_answer` (
  `servey_answer_num` int(11) NOT NULL,
  `servey_servey_num` int(11) NOT NULL,
  `servey_result` int(11) NOT NULL,
  PRIMARY KEY (`servey_answer_num`),
  KEY `fk_servey_answer_servey1_idx` (`servey_servey_num`),
  CONSTRAINT `fk_servey_answer_servey1` FOREIGN KEY (`servey_servey_num`) REFERENCES `survey` (`s_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servey_answer`
--

LOCK TABLES `servey_answer` WRITE;
/*!40000 ALTER TABLE `servey_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `servey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servey_question`
--

DROP TABLE IF EXISTS `servey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servey_question` (
  `servey_question_num` int(11) NOT NULL,
  `servey_servey_num` int(11) NOT NULL,
  `servey_question_question` varchar(45) NOT NULL,
  PRIMARY KEY (`servey_question_num`),
  KEY `fk_servey_question_servey1_idx` (`servey_servey_num`),
  CONSTRAINT `fk_servey_question_servey1` FOREIGN KEY (`servey_servey_num`) REFERENCES `survey` (`s_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servey_question`
--

LOCK TABLES `servey_question` WRITE;
/*!40000 ALTER TABLE `servey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `servey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestion`
--

DROP TABLE IF EXISTS `suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestion` (
  `sg_num` int(11) NOT NULL,
  `member_member_id` varchar(45) NOT NULL,
  `sg_content` varchar(2000) NOT NULL,
  `sg_email` varchar(45) NOT NULL,
  `sg_date` datetime NOT NULL,
  `sg_check` varchar(45) NOT NULL,
  `sg_subject` varchar(45) NOT NULL,
  PRIMARY KEY (`sg_num`),
  KEY `fk_suggestion_member1_idx` (`member_member_id`),
  CONSTRAINT `fk_suggestion_member1` FOREIGN KEY (`member_member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestion`
--

LOCK TABLES `suggestion` WRITE;
/*!40000 ALTER TABLE `suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `s_num` int(11) NOT NULL,
  `s_question` varchar(300) NOT NULL,
  `s_sdate` datetime NOT NULL,
  `s_edate` datetime NOT NULL,
  `s_wdate` datetime NOT NULL,
  PRIMARY KEY (`s_num`),
  UNIQUE KEY `servey_title_UNIQUE` (`s_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyresult`
--

DROP TABLE IF EXISTS `surveyresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyresult` (
  `sr_listnum` int(11) NOT NULL,
  `sr_itemnum` varchar(45) DEFAULT NULL,
  `sr_item` varchar(45) DEFAULT NULL,
  `sr_count` int(11) DEFAULT NULL,
  `survey_s_num` int(11) NOT NULL,
  PRIMARY KEY (`sr_listnum`),
  KEY `fk_survey_result_survey1_idx` (`survey_s_num`),
  CONSTRAINT `fk_survey_result_survey1` FOREIGN KEY (`survey_s_num`) REFERENCES `survey` (`s_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyresult`
--

LOCK TABLES `surveyresult` WRITE;
/*!40000 ALTER TABLE `surveyresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyresult` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-21 17:44:20
