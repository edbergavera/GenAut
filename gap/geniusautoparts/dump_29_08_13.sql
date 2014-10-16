-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: prizmatic
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.2

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
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` longtext,
  `account_type_id` int(11) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `primary_user_id` int(11) DEFAULT NULL,
  `status` varchar(32) NOT NULL,
  `credit_limit` decimal(12,2) DEFAULT NULL,
  `balance` decimal(12,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `product_range_id` int(11) DEFAULT NULL,
  `can_be_used_for_non_products` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`),
  KEY `accounts_account_1cb8f5b0` (`account_type_id`),
  KEY `accounts_account_8d3b64d8` (`primary_user_id`),
  KEY `accounts_account_d4b14d36` (`product_range_id`),
  CONSTRAINT `account_type_id_refs_id_28bf1a446d19ccbf` FOREIGN KEY (`account_type_id`) REFERENCES `accounts_accounttype` (`id`),
  CONSTRAINT `primary_user_id_refs_id_654b320f0712b888` FOREIGN KEY (`primary_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `product_range_id_refs_id_6b2f054f813892e2` FOREIGN KEY (`product_range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account`
--

LOCK TABLES `accounts_account` WRITE;
/*!40000 ALTER TABLE `accounts_account` DISABLE KEYS */;
INSERT INTO `accounts_account` VALUES (1,'Sales Account',NULL,2,NULL,NULL,'Open',0.00,0.00,NULL,NULL,NULL,1,'2013-05-08 14:24:32'),(2,'Expired Account',NULL,2,NULL,NULL,'Open',0.00,0.00,NULL,NULL,NULL,1,'2013-05-08 14:24:32'),(3,'Bank',NULL,3,NULL,NULL,'Open',NULL,0.00,NULL,NULL,NULL,1,'2013-05-08 14:24:32'),(4,'Unpaid source',NULL,4,NULL,NULL,'Open',NULL,-1030.00,NULL,NULL,NULL,1,'2013-05-08 14:24:32'),(5,'The Main Account','',7,'ADHMXFKDKRHT',NULL,'Open',0.00,1000.00,NULL,NULL,NULL,1,'2013-05-10 11:21:19'),(6,'Trade Account','New trade account opened or dave',7,'MMES8Z2DDEDT',NULL,'Open',0.00,30.00,NULL,NULL,NULL,1,'2013-05-10 13:20:01');
/*!40000 ALTER TABLE `accounts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_account_secondary_users`
--

DROP TABLE IF EXISTS `accounts_account_secondary_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_account_secondary_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_secondary_use_account_id_46b7ed0aad009f6b_uniq` (`account_id`,`user_id`),
  KEY `accounts_account_secondary_users_6f2fe10e` (`account_id`),
  KEY `accounts_account_secondary_users_fbfc09f1` (`user_id`),
  CONSTRAINT `account_id_refs_id_998ed0eb43e158d` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `user_id_refs_id_4c7d44013e031f42` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_secondary_users`
--

LOCK TABLES `accounts_account_secondary_users` WRITE;
/*!40000 ALTER TABLE `accounts_account_secondary_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_secondary_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accounttype`
--

DROP TABLE IF EXISTS `accounts_accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_accounttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `code` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounttype`
--

LOCK TABLES `accounts_accounttype` WRITE;
/*!40000 ALTER TABLE `accounts_accounttype` DISABLE KEYS */;
INSERT INTO `accounts_accounttype` VALUES (1,'0001',1,3,NULL,'Assets'),(2,'00010001',2,0,NULL,'Sales'),(3,'00010002',2,0,NULL,'Cash'),(4,'00010003',2,0,NULL,'Unpaid accounts'),(5,'0002',1,1,NULL,'Liabilities'),(6,'00020001',2,1,NULL,'Deferred income'),(7,'000200010001',3,0,NULL,'Dashboard created accounts');
/*!40000 ALTER TABLE `accounts_accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_ipaddressrecord`
--

DROP TABLE IF EXISTS `accounts_ipaddressrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_ipaddressrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `total_failures` int(10) unsigned NOT NULL,
  `consecutive_failures` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_last_failure` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_ipaddressrecord`
--

LOCK TABLES `accounts_ipaddressrecord` WRITE;
/*!40000 ALTER TABLE `accounts_ipaddressrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_ipaddressrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_transaction`
--

DROP TABLE IF EXISTS `accounts_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_transaction_transfer_id_740ade80e73f985a_uniq` (`transfer_id`,`account_id`),
  KEY `accounts_transaction_b7d24dfb` (`transfer_id`),
  KEY `accounts_transaction_6f2fe10e` (`account_id`),
  CONSTRAINT `account_id_refs_id_28273839846ba6c6` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `transfer_id_refs_id_5dfce76ee9de8009` FOREIGN KEY (`transfer_id`) REFERENCES `accounts_transfer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_transaction`
--

LOCK TABLES `accounts_transaction` WRITE;
/*!40000 ALTER TABLE `accounts_transaction` DISABLE KEYS */;
INSERT INTO `accounts_transaction` VALUES (1,1,4,-1000.00,'2013-05-10 11:21:19'),(2,1,5,1000.00,'2013-05-10 11:21:19'),(3,2,4,-30.00,'2013-05-10 13:20:01'),(4,2,6,30.00,'2013-05-10 13:20:01');
/*!40000 ALTER TABLE `accounts_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_transfer`
--

DROP TABLE IF EXISTS `accounts_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(64) DEFAULT NULL,
  `source_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `merchant_reference` varchar(128) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `accounts_transfer_89f89e85` (`source_id`),
  KEY `accounts_transfer_90a09905` (`destination_id`),
  KEY `accounts_transfer_63f17a16` (`parent_id`),
  KEY `accounts_transfer_fbfc09f1` (`user_id`),
  CONSTRAINT `destination_id_refs_id_2105b00603269e1c` FOREIGN KEY (`destination_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `parent_id_refs_id_5f110861f698aaed` FOREIGN KEY (`parent_id`) REFERENCES `accounts_transfer` (`id`),
  CONSTRAINT `source_id_refs_id_2105b00603269e1c` FOREIGN KEY (`source_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `user_id_refs_id_6a60e505841e825f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_transfer`
--

LOCK TABLES `accounts_transfer` WRITE;
/*!40000 ALTER TABLE `accounts_transfer` DISABLE KEYS */;
INSERT INTO `accounts_transfer` VALUES (1,'92F71D0E08CEC936DD0DC0B0B722AD41',4,5,1000.00,NULL,NULL,'Creation of account',1,'admin@theimip.com','2013-05-10 11:21:19'),(2,'F2F58300283467696A40DD507B4BA22D',4,6,30.00,NULL,NULL,'Creation of account',1,'admin@theimip.com','2013-05-10 13:20:01');
/*!40000 ALTER TABLE `accounts_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_country`
--

DROP TABLE IF EXISTS `address_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_country` (
  `iso_3166_1_a2` varchar(2) NOT NULL,
  `iso_3166_1_a3` varchar(3) DEFAULT NULL,
  `iso_3166_1_numeric` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `printable_name` varchar(128) NOT NULL,
  `is_highlighted` tinyint(1) NOT NULL,
  `is_shipping_country` tinyint(1) NOT NULL,
  PRIMARY KEY (`iso_3166_1_a2`),
  KEY `address_country_5c8e0e7d` (`iso_3166_1_a3`),
  KEY `address_country_73b0508d` (`iso_3166_1_numeric`),
  KEY `address_country_ce990a17` (`is_highlighted`),
  KEY `address_country_b029f1ea` (`is_shipping_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
INSERT INTO `address_country` VALUES ('uk','uk',22,'uk','uk',0,1),('us','usa',21,'usa','usa',0,0);
/*!40000 ALTER TABLE `address_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_useraddress`
--

DROP TABLE IF EXISTS `address_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `line3` varchar(255) DEFAULT NULL,
  `line4` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postcode` varchar(64) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `search_text` varchar(1000) NOT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `notes` longtext,
  `user_id` int(11) NOT NULL,
  `is_default_for_shipping` tinyint(1) NOT NULL,
  `is_default_for_billing` tinyint(1) NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `hash` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_useraddress_534dd89` (`country_id`),
  KEY `address_useraddress_fbfc09f1` (`user_id`),
  KEY `address_useraddress_36af87d1` (`hash`),
  CONSTRAINT `country_id_refs_iso_3166_1_a2_ae61609ccc92d76` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `user_id_refs_id_47d5b6333bcad141` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_useraddress`
--

LOCK TABLES `address_useraddress` WRITE;
/*!40000 ALTER TABLE `address_useraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_tools_dashboard_preferences`
--

DROP TABLE IF EXISTS `admin_tools_dashboard_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tools_dashboard_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `dashboard_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_tools_dashboard_prefer_dashboard_id_374bce90a8a4eefc_uniq` (`dashboard_id`,`user_id`),
  KEY `admin_tools_dashboard_preferences_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_2faedda1f8487376` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tools_dashboard_preferences`
--

LOCK TABLES `admin_tools_dashboard_preferences` WRITE;
/*!40000 ALTER TABLE `admin_tools_dashboard_preferences` DISABLE KEYS */;
INSERT INTO `admin_tools_dashboard_preferences` VALUES (1,1,'{}','dashboard'),(2,1,'{}','sites-dashboard'),(3,1,'{}','csvimport-dashboard'),(4,1,'{}','partner-dashboard'),(5,1,'{}','catalogue-dashboard'),(6,1,'{}','auth-dashboard'),(7,1,'{}','accounts-dashboard'),(8,4,'{}','catalogue-dashboard'),(9,4,'{}','gap-dashboard'),(10,4,'{}','dashboard'),(11,4,'{}','accounts-dashboard'),(12,8,'{}','dashboard'),(13,4,'{}','flatpages-dashboard'),(14,4,'{}','customer-dashboard'),(15,10,'{}','dashboard');
/*!40000 ALTER TABLE `admin_tools_dashboard_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_tools_menu_bookmark`
--

DROP TABLE IF EXISTS `admin_tools_menu_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tools_menu_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_tools_menu_bookmark_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_6af2836063b2844f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tools_menu_bookmark`
--

LOCK TABLES `admin_tools_menu_bookmark` WRITE;
/*!40000 ALTER TABLE `admin_tools_menu_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_tools_menu_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_productrecord`
--

DROP TABLE IF EXISTS `analytics_productrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_productrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `num_views` int(10) unsigned NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_purchases` int(10) unsigned NOT NULL,
  `score` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `analytics_productrecord_f3d3e28f` (`num_purchases`),
  CONSTRAINT `product_id_refs_id_54539efdb53e5469` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_productrecord`
--

LOCK TABLES `analytics_productrecord` WRITE;
/*!40000 ALTER TABLE `analytics_productrecord` DISABLE KEYS */;
INSERT INTO `analytics_productrecord` VALUES (10,15,90,0,0,0),(11,17,279,34,900,0),(12,16,56,1,0,0),(13,19,19,3,0,0),(15,50,9,0,0,0),(18,51,5,0,0,0),(22,49,9,0,0,0),(23,48,5,0,0,0),(24,46,6,0,0,0),(25,42,2,0,0,0),(27,45,3,0,0,0),(28,54,4,0,0,0),(30,56,5,0,0,0),(34,52,2,0,0,0),(35,55,4,0,0,0),(36,47,2,0,0,0),(37,33,3,0,0,0),(38,53,3,0,0,0),(39,28,2,0,0,0),(40,41,3,0,0,0),(41,35,3,0,0,0),(42,39,3,0,0,0),(43,29,3,0,0,0),(44,38,3,0,0,0),(45,27,2,0,0,0),(46,26,2,0,0,0),(47,36,2,0,0,0),(48,32,2,0,0,0),(49,34,3,0,0,0),(50,37,3,0,0,0),(51,40,2,0,0,0),(52,31,3,0,0,0),(53,73,2,0,0,0),(54,78,2,0,0,0),(55,72,7,0,0,0),(56,71,6,0,0,0),(57,70,4,0,0,0),(58,69,3,0,0,0),(59,115,2,0,0,0),(60,103,2,0,0,0),(61,93,2,0,0,0),(62,108,8,0,0,0),(63,107,2,0,0,0),(64,109,7,0,0,0),(65,83,2,0,0,0),(66,80,4,0,0,0),(67,79,14,3,0,0),(68,106,6,0,0,0),(69,104,1,0,0,0),(70,102,1,0,0,0),(71,111,1,0,0,0),(72,110,1,0,0,0),(73,117,1,0,0,0),(74,105,4,0,0,0),(75,116,1,0,0,0),(76,118,1,0,0,0),(77,119,1,0,0,0),(78,121,1,0,0,0),(79,120,1,0,0,0),(80,113,1,0,0,0),(81,114,1,0,0,0),(82,112,1,0,0,0),(83,99,4,0,0,0),(84,100,3,0,0,0),(85,74,1,0,0,0),(86,75,1,0,0,0),(87,76,1,0,0,0),(88,82,3,0,0,0),(89,81,4,0,0,0),(90,95,1,0,0,0),(91,84,1,0,0,0),(92,91,1,0,0,0),(93,90,1,0,0,0),(94,88,1,0,0,0),(95,89,1,0,0,0),(96,92,1,0,0,0),(97,87,1,0,0,0),(98,96,1,0,0,0),(99,86,1,0,0,0),(100,98,1,0,0,0),(101,97,1,0,0,0);
/*!40000 ALTER TABLE `analytics_productrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_userproductview`
--

DROP TABLE IF EXISTS `analytics_userproductview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_userproductview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_userproductview_fbfc09f1` (`user_id`),
  KEY `analytics_userproductview_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_79865e235e6ecec` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `user_id_refs_id_2d1d77bf2d5d69a9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=774 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_userproductview`
--

LOCK TABLES `analytics_userproductview` WRITE;
/*!40000 ALTER TABLE `analytics_userproductview` DISABLE KEYS */;
INSERT INTO `analytics_userproductview` VALUES (343,10,15,'2013-06-26 11:00:01'),(344,10,15,'2013-06-26 11:10:34'),(345,10,15,'2013-06-26 11:11:14'),(346,4,15,'2013-06-26 12:31:59'),(347,4,15,'2013-06-26 12:33:12'),(348,4,15,'2013-06-26 15:06:04'),(349,10,17,'2013-06-26 17:32:11'),(350,4,17,'2013-06-26 18:17:05'),(351,4,17,'2013-06-26 18:31:44'),(352,10,17,'2013-06-26 18:44:03'),(353,4,17,'2013-06-27 08:15:33'),(354,11,17,'2013-06-27 09:54:17'),(355,4,17,'2013-06-27 12:51:18'),(356,4,17,'2013-06-27 12:52:05'),(357,4,17,'2013-06-27 13:13:57'),(358,4,17,'2013-06-28 21:04:23'),(359,10,17,'2013-06-29 16:01:37'),(360,4,17,'2013-07-02 09:10:22'),(361,10,17,'2013-07-02 18:59:12'),(362,10,17,'2013-07-02 18:59:13'),(363,4,17,'2013-07-02 20:08:53'),(364,4,15,'2013-07-03 08:06:00'),(365,4,17,'2013-07-03 23:18:25'),(366,4,17,'2013-07-04 07:58:00'),(367,4,16,'2013-07-04 07:58:11'),(368,4,15,'2013-07-04 07:58:23'),(369,4,17,'2013-07-05 08:16:46'),(370,4,16,'2013-07-05 08:16:55'),(371,10,17,'2013-07-06 11:46:07'),(372,10,16,'2013-07-06 11:48:53'),(373,10,16,'2013-07-06 11:49:03'),(374,10,17,'2013-07-06 11:52:36'),(375,10,17,'2013-07-06 11:52:41'),(376,10,17,'2013-07-06 12:14:46'),(377,10,16,'2013-07-06 12:14:57'),(378,10,17,'2013-07-06 12:23:40'),(379,10,16,'2013-07-06 12:23:55'),(380,10,15,'2013-07-06 12:24:07'),(381,10,17,'2013-07-06 12:25:16'),(382,10,16,'2013-07-06 12:28:26'),(383,10,17,'2013-07-06 12:34:50'),(384,10,17,'2013-07-06 15:40:04'),(385,10,17,'2013-07-06 16:02:35'),(386,4,17,'2013-07-06 18:07:07'),(387,4,16,'2013-07-06 18:07:53'),(388,4,15,'2013-07-06 18:08:09'),(389,10,17,'2013-07-06 19:18:05'),(390,10,17,'2013-07-06 19:18:21'),(391,10,15,'2013-07-06 19:18:25'),(392,10,15,'2013-07-06 19:18:30'),(393,10,16,'2013-07-06 19:18:41'),(394,10,16,'2013-07-06 19:18:45'),(395,10,17,'2013-07-06 19:18:49'),(396,10,17,'2013-07-06 19:32:07'),(397,4,17,'2013-07-06 19:52:50'),(398,10,17,'2013-07-06 19:55:20'),(399,4,17,'2013-07-07 20:36:40'),(400,10,17,'2013-07-08 10:57:33'),(401,10,17,'2013-07-08 19:19:18'),(402,10,17,'2013-07-08 19:24:13'),(403,4,17,'2013-07-08 19:24:27'),(404,10,17,'2013-07-08 19:27:40'),(405,4,17,'2013-07-08 19:29:17'),(406,10,15,'2013-07-08 19:31:06'),(407,4,16,'2013-07-08 19:31:42'),(408,4,15,'2013-07-08 19:31:48'),(409,10,17,'2013-07-08 19:38:36'),(410,10,15,'2013-07-08 19:41:22'),(411,10,15,'2013-07-08 20:06:13'),(412,10,17,'2013-07-08 20:20:53'),(413,4,17,'2013-07-09 10:43:07'),(414,10,17,'2013-07-09 12:49:09'),(415,4,17,'2013-07-09 18:44:33'),(416,4,15,'2013-07-09 19:00:24'),(417,4,15,'2013-07-11 21:10:53'),(418,4,16,'2013-07-11 21:11:30'),(419,4,17,'2013-07-11 21:11:43'),(420,10,17,'2013-07-12 02:35:03'),(421,10,16,'2013-07-12 02:45:21'),(422,10,15,'2013-07-12 02:45:38'),(423,4,17,'2013-07-13 20:16:20'),(424,4,15,'2013-07-13 20:16:58'),(425,4,16,'2013-07-13 20:19:29'),(426,4,17,'2013-07-14 08:05:13'),(427,4,17,'2013-07-14 19:51:55'),(428,4,17,'2013-07-15 09:54:24'),(429,4,16,'2013-07-15 10:49:25'),(430,4,15,'2013-07-15 11:45:48'),(431,11,15,'2013-07-15 11:46:16'),(432,4,17,'2013-07-15 20:34:05'),(433,4,16,'2013-07-15 20:35:15'),(434,11,15,'2013-07-16 01:16:33'),(435,11,15,'2013-07-16 01:18:39'),(436,10,17,'2013-07-16 01:47:38'),(437,10,17,'2013-07-16 01:50:13'),(438,10,17,'2013-07-16 01:50:17'),(439,10,15,'2013-07-16 01:50:22'),(440,10,16,'2013-07-16 01:52:09'),(441,10,15,'2013-07-16 02:07:15'),(442,10,15,'2013-07-16 02:22:39'),(443,10,16,'2013-07-16 02:23:13'),(444,10,15,'2013-07-16 02:23:24'),(445,10,15,'2013-07-16 02:24:34'),(446,10,17,'2013-07-16 02:29:26'),(447,10,17,'2013-07-16 02:33:24'),(448,4,17,'2013-07-16 08:01:03'),(449,4,16,'2013-07-16 10:06:52'),(450,4,15,'2013-07-16 13:30:27'),(451,10,17,'2013-07-16 14:29:26'),(452,10,17,'2013-07-16 14:32:17'),(453,4,16,'2013-07-16 21:38:01'),(454,4,16,'2013-07-16 21:41:07'),(455,10,17,'2013-07-16 22:07:57'),(456,10,17,'2013-07-17 00:30:43'),(457,10,15,'2013-07-17 07:50:25'),(458,10,15,'2013-07-17 07:55:21'),(459,4,17,'2013-07-17 07:58:27'),(460,4,16,'2013-07-17 07:58:41'),(461,4,15,'2013-07-17 08:01:05'),(462,4,17,'2013-07-17 08:02:23'),(463,10,17,'2013-07-17 19:32:36'),(464,10,17,'2013-07-17 20:48:25'),(465,10,15,'2013-07-17 20:50:30'),(466,10,15,'2013-07-17 20:58:00'),(467,10,17,'2013-07-17 20:59:22'),(468,10,15,'2013-07-17 21:00:10'),(469,10,15,'2013-07-17 21:09:07'),(470,4,17,'2013-07-17 21:09:09'),(471,10,17,'2013-07-17 21:10:59'),(472,10,15,'2013-07-17 21:11:06'),(473,10,15,'2013-07-17 21:26:40'),(474,10,17,'2013-07-17 21:40:49'),(475,4,17,'2013-07-17 21:53:18'),(476,10,15,'2013-07-17 21:56:51'),(477,4,17,'2013-07-17 22:02:19'),(478,10,15,'2013-07-18 00:24:13'),(479,4,15,'2013-07-18 15:45:05'),(480,4,17,'2013-07-18 22:10:07'),(481,4,15,'2013-07-19 16:42:45'),(482,4,15,'2013-07-19 16:42:45'),(483,1,16,'2013-07-19 17:45:40'),(484,1,16,'2013-07-19 17:45:47'),(485,10,17,'2013-07-19 19:07:29'),(486,1,15,'2013-07-19 19:08:27'),(487,4,15,'2013-07-19 21:35:08'),(488,10,17,'2013-07-21 23:37:24'),(489,10,16,'2013-07-22 00:03:27'),(490,4,16,'2013-07-22 08:36:49'),(491,4,15,'2013-07-22 16:01:33'),(492,10,17,'2013-07-24 19:25:02'),(493,10,19,'2013-07-24 19:27:17'),(494,4,19,'2013-07-24 19:27:51'),(495,10,17,'2013-07-24 19:28:28'),(496,4,19,'2013-07-24 19:28:41'),(497,10,17,'2013-07-24 19:29:11'),(498,4,17,'2013-07-24 19:29:44'),(499,4,15,'2013-07-24 20:18:38'),(500,4,16,'2013-07-24 20:21:06'),(501,10,17,'2013-07-24 20:22:22'),(502,10,17,'2013-07-24 20:27:21'),(503,4,17,'2013-07-24 20:27:32'),(504,4,17,'2013-07-25 13:59:36'),(505,4,17,'2013-07-25 14:06:58'),(506,10,15,'2013-07-26 10:29:07'),(507,10,15,'2013-07-26 10:31:19'),(508,10,19,'2013-07-28 02:07:34'),(509,10,17,'2013-07-28 02:07:42'),(510,10,17,'2013-07-28 02:08:18'),(511,10,17,'2013-07-28 02:11:25'),(512,10,15,'2013-07-28 02:17:13'),(513,10,16,'2013-07-28 02:39:19'),(514,10,16,'2013-07-28 02:39:58'),(515,10,17,'2013-07-28 02:41:09'),(516,10,17,'2013-07-28 07:48:59'),(517,10,16,'2013-07-28 07:58:14'),(518,10,17,'2013-07-28 07:58:38'),(519,10,17,'2013-07-28 08:00:20'),(520,10,15,'2013-07-28 08:00:55'),(521,10,16,'2013-07-28 08:01:16'),(522,10,16,'2013-07-28 08:01:40'),(523,10,17,'2013-07-28 08:05:36'),(524,10,19,'2013-07-28 08:09:54'),(525,10,17,'2013-07-28 08:10:05'),(526,4,17,'2013-07-28 16:45:02'),(527,4,17,'2013-07-28 16:45:14'),(528,4,17,'2013-07-28 16:45:18'),(529,4,17,'2013-07-28 16:45:31'),(530,4,15,'2013-07-28 16:46:33'),(531,11,17,'2013-07-29 11:19:21'),(532,4,15,'2013-07-29 11:36:47'),(533,10,17,'2013-07-29 13:52:10'),(534,10,15,'2013-07-29 14:43:59'),(535,10,17,'2013-07-29 14:44:07'),(536,10,15,'2013-07-29 17:17:27'),(537,10,15,'2013-07-29 17:24:54'),(538,10,15,'2013-07-29 17:25:02'),(539,10,15,'2013-07-29 18:06:08'),(540,10,16,'2013-07-29 18:46:36'),(541,10,16,'2013-07-29 18:47:10'),(542,10,17,'2013-07-29 20:14:18'),(543,10,17,'2013-07-29 20:14:20'),(544,10,17,'2013-07-30 00:09:29'),(545,10,16,'2013-07-30 00:09:36'),(546,10,15,'2013-07-30 00:09:43'),(547,10,17,'2013-07-30 09:39:28'),(548,10,17,'2013-07-30 22:55:49'),(550,10,16,'2013-08-01 14:09:18'),(551,1,15,'2013-08-01 15:14:48'),(552,1,16,'2013-08-01 15:20:51'),(553,10,17,'2013-08-02 08:38:01'),(554,10,19,'2013-08-02 11:24:57'),(555,10,17,'2013-08-02 11:25:04'),(556,10,16,'2013-08-02 11:29:25'),(557,4,17,'2013-08-02 12:05:05'),(558,1,17,'2013-08-02 12:29:50'),(559,10,17,'2013-08-02 12:48:15'),(560,4,17,'2013-08-02 13:05:28'),(561,1,17,'2013-08-02 13:11:18'),(562,1,17,'2013-08-02 13:12:16'),(563,4,15,'2013-08-02 13:18:10'),(564,4,17,'2013-08-02 13:18:28'),(565,1,17,'2013-08-02 13:31:28'),(566,4,17,'2013-08-02 14:33:46'),(567,10,17,'2013-08-02 14:42:02'),(568,10,17,'2013-08-02 14:47:03'),(569,4,17,'2013-08-02 16:05:40'),(570,4,17,'2013-08-02 21:46:50'),(571,4,17,'2013-08-02 21:48:17'),(572,4,17,'2013-08-02 21:56:35'),(573,4,17,'2013-08-02 22:06:58'),(574,4,17,'2013-08-03 07:47:47'),(575,4,17,'2013-08-03 10:03:51'),(576,1,17,'2013-08-03 11:07:16'),(577,1,17,'2013-08-03 11:08:26'),(578,1,15,'2013-08-03 11:09:17'),(579,1,15,'2013-08-03 11:09:23'),(580,1,16,'2013-08-03 11:09:32'),(581,1,16,'2013-08-03 11:09:41'),(582,1,19,'2013-08-03 11:10:13'),(583,1,17,'2013-08-03 11:10:26'),(584,4,17,'2013-08-03 11:11:12'),(585,1,17,'2013-08-03 11:20:46'),(586,11,17,'2013-08-03 11:41:03'),(588,4,17,'2013-08-03 15:26:04'),(589,4,17,'2013-08-03 15:26:07'),(591,4,17,'2013-08-04 07:40:25'),(592,4,17,'2013-08-04 07:46:12'),(593,10,15,'2013-08-05 06:46:10'),(594,10,17,'2013-08-05 06:46:18'),(595,10,17,'2013-08-05 07:45:41'),(596,1,17,'2013-08-05 07:58:17'),(597,1,15,'2013-08-05 07:59:25'),(598,1,15,'2013-08-05 07:59:29'),(599,1,17,'2013-08-05 08:09:36'),(600,1,17,'2013-08-05 10:05:14'),(601,1,17,'2013-08-05 10:10:28'),(602,1,17,'2013-08-05 14:12:11'),(603,1,17,'2013-08-05 14:15:58'),(604,4,17,'2013-08-05 14:25:12'),(605,4,17,'2013-08-05 14:33:38'),(606,4,17,'2013-08-05 14:40:56'),(608,1,17,'2013-08-06 07:51:22'),(609,1,16,'2013-08-06 09:58:30'),(610,10,17,'2013-08-07 08:59:47'),(611,10,17,'2013-08-07 12:21:36'),(612,4,17,'2013-08-07 16:25:42'),(613,10,17,'2013-08-07 20:29:11'),(614,4,17,'2013-08-09 13:06:28'),(615,1,17,'2013-08-12 19:55:27'),(616,1,19,'2013-08-12 19:56:50'),(617,1,19,'2013-08-12 19:56:56'),(618,10,50,'2013-08-13 12:01:07'),(621,10,51,'2013-08-13 12:01:34'),(625,1,49,'2013-08-13 17:20:02'),(626,1,50,'2013-08-13 19:40:53'),(627,1,49,'2013-08-13 19:41:41'),(628,1,48,'2013-08-13 19:45:20'),(629,14,46,'2013-08-13 19:45:40'),(630,14,46,'2013-08-13 19:51:36'),(631,14,42,'2013-08-13 19:52:04'),(633,14,16,'2013-08-13 19:54:28'),(635,1,45,'2013-08-13 20:10:03'),(636,1,17,'2013-08-13 20:26:46'),(637,1,19,'2013-08-13 21:45:56'),(638,10,54,'2013-08-13 22:33:34'),(639,10,48,'2013-08-13 22:33:43'),(641,10,15,'2013-08-14 08:29:10'),(642,14,56,'2013-08-14 08:45:29'),(643,14,49,'2013-08-14 08:45:43'),(644,14,49,'2013-08-14 08:46:05'),(645,14,50,'2013-08-14 08:46:09'),(646,14,50,'2013-08-14 08:46:18'),(647,14,45,'2013-08-14 08:46:21'),(648,14,49,'2013-08-14 09:27:24'),(649,14,50,'2013-08-14 09:27:39'),(653,10,50,'2013-08-14 14:29:11'),(654,10,51,'2013-08-14 14:29:19'),(656,4,17,'2013-08-14 14:53:10'),(657,4,17,'2013-08-14 14:53:18'),(658,4,16,'2013-08-14 14:53:25'),(659,4,16,'2013-08-14 14:53:29'),(660,4,19,'2013-08-14 14:53:41'),(661,4,19,'2013-08-14 14:53:43'),(664,4,17,'2013-08-15 07:41:50'),(665,4,17,'2013-08-15 07:43:24'),(666,4,17,'2013-08-15 07:53:43'),(667,1,17,'2013-08-15 12:58:10'),(668,1,17,'2013-08-15 13:00:28'),(670,1,17,'2013-08-15 13:21:15'),(671,1,17,'2013-08-15 13:24:45'),(673,1,17,'2013-08-15 15:27:55'),(675,4,17,'2013-08-16 13:44:58'),(676,4,17,'2013-08-16 13:45:01'),(677,4,17,'2013-08-16 13:46:06'),(678,4,17,'2013-08-16 14:02:38'),(679,4,19,'2013-08-16 14:38:30'),(680,10,17,'2013-08-16 22:58:29'),(682,10,17,'2013-08-16 23:15:17'),(683,1,17,'2013-08-17 06:52:53'),(684,1,17,'2013-08-17 06:59:15'),(685,1,17,'2013-08-17 07:17:44'),(686,14,33,'2013-08-17 09:53:30'),(687,1,17,'2013-08-17 10:30:20'),(688,1,17,'2013-08-17 15:00:35'),(689,4,17,'2013-08-18 18:52:48'),(690,14,17,'2013-08-19 07:57:16'),(692,14,49,'2013-08-19 14:11:08'),(693,1,17,'2013-08-19 14:13:53'),(694,1,17,'2013-08-19 17:34:50'),(695,4,17,'2013-08-20 11:27:00'),(696,1,17,'2013-08-20 13:16:14'),(697,4,73,'2013-08-20 15:55:27'),(698,1,78,'2013-08-20 18:05:34'),(699,1,17,'2013-08-20 18:06:01'),(700,1,72,'2013-08-20 19:28:06'),(701,1,72,'2013-08-20 19:33:32'),(702,1,71,'2013-08-21 07:23:02'),(703,1,17,'2013-08-21 07:26:51'),(704,1,17,'2013-08-21 07:39:28'),(705,1,17,'2013-08-21 07:47:43'),(706,10,17,'2013-08-21 07:49:48'),(707,14,93,'2013-08-22 09:11:35'),(708,1,17,'2013-08-22 10:08:30'),(709,1,17,'2013-08-23 12:44:26'),(710,1,17,'2013-08-23 12:45:35'),(711,11,17,'2013-08-23 12:46:01'),(712,1,17,'2013-08-23 12:52:47'),(713,1,17,'2013-08-23 12:57:28'),(714,1,17,'2013-08-23 12:59:10'),(715,1,17,'2013-08-23 13:30:27'),(716,10,17,'2013-08-23 14:05:57'),(717,1,17,'2013-08-23 14:22:28'),(718,17,108,'2013-08-23 15:17:18'),(719,17,108,'2013-08-23 15:17:21'),(720,17,107,'2013-08-23 15:17:42'),(721,17,109,'2013-08-23 15:17:49'),(722,1,17,'2013-08-23 16:47:24'),(723,14,71,'2013-08-24 08:11:38'),(724,14,71,'2013-08-24 08:11:42'),(725,10,83,'2013-08-25 14:59:48'),(726,10,80,'2013-08-25 15:00:51'),(727,10,79,'2013-08-25 15:14:06'),(728,10,17,'2013-08-25 17:42:43'),(729,10,79,'2013-08-25 17:43:30'),(730,1,17,'2013-08-25 21:42:05'),(731,10,80,'2013-08-26 17:49:37'),(732,10,80,'2013-08-26 17:50:20'),(733,10,79,'2013-08-26 17:51:39'),(734,10,79,'2013-08-26 17:51:54'),(735,1,79,'2013-08-26 17:52:02'),(736,1,79,'2013-08-26 17:52:42'),(737,10,17,'2013-08-26 18:15:15'),(738,10,79,'2013-08-26 18:32:46'),(739,1,82,'2013-08-28 09:47:11'),(740,1,82,'2013-08-28 09:47:11'),(741,1,79,'2013-08-28 09:53:55'),(742,1,79,'2013-08-28 10:06:33'),(743,17,79,'2013-08-28 10:07:14'),(744,17,106,'2013-08-28 10:32:55'),(745,17,106,'2013-08-28 10:32:57'),(746,17,106,'2013-08-28 10:33:00'),(747,17,106,'2013-08-28 10:33:02'),(748,17,106,'2013-08-28 10:33:07'),(749,17,108,'2013-08-28 10:33:18'),(750,17,108,'2013-08-28 10:33:20'),(751,17,109,'2013-08-28 10:33:37'),(752,17,109,'2013-08-28 10:33:39'),(753,17,109,'2013-08-28 10:33:43'),(754,17,108,'2013-08-28 10:33:47'),(755,17,108,'2013-08-28 10:33:49'),(756,17,108,'2013-08-28 10:33:52'),(757,17,105,'2013-08-28 10:34:00'),(758,17,105,'2013-08-28 10:34:02'),(759,17,105,'2013-08-28 10:34:05'),(760,17,99,'2013-08-28 10:34:17'),(761,17,99,'2013-08-28 10:34:21'),(762,17,99,'2013-08-28 10:34:23'),(763,17,100,'2013-08-28 10:38:06'),(764,17,100,'2013-08-28 10:38:29'),(765,17,72,'2013-08-28 10:38:45'),(766,17,81,'2013-08-28 13:44:19'),(767,17,81,'2013-08-28 13:44:21'),(768,17,81,'2013-08-28 13:44:23'),(769,17,72,'2013-08-28 13:44:38'),(770,17,72,'2013-08-28 13:47:34'),(771,17,72,'2013-08-28 15:27:35'),(772,1,79,'2013-08-28 18:27:04'),(773,1,79,'2013-08-29 14:46:12');
/*!40000 ALTER TABLE `analytics_userproductview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_userrecord`
--

DROP TABLE IF EXISTS `analytics_userrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_userrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `num_product_views` int(10) unsigned NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `num_order_lines` int(10) unsigned NOT NULL,
  `num_order_items` int(10) unsigned NOT NULL,
  `total_spent` decimal(12,2) NOT NULL,
  `date_last_order` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `analytics_userrecord_d67315` (`num_orders`),
  KEY `analytics_userrecord_7698f02b` (`num_order_lines`),
  KEY `analytics_userrecord_1cbbd474` (`num_order_items`),
  CONSTRAINT `user_id_refs_id_4240573fc321bd93` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_userrecord`
--

LOCK TABLES `analytics_userrecord` WRITE;
/*!40000 ALTER TABLE `analytics_userrecord` DISABLE KEYS */;
INSERT INTO `analytics_userrecord` VALUES (1,1,226,13,1,1,700,70.00,'2013-08-05 14:20:55'),(2,4,302,13,1,1,100,32.00,'2013-08-05 14:29:24'),(4,10,179,7,0,0,0,0.00,NULL),(5,11,7,6,1,2,100,27.00,'2013-08-03 13:57:25'),(6,14,21,1,0,0,0,0.00,NULL),(9,17,33,0,0,0,0,0.00,NULL);
/*!40000 ALTER TABLE `analytics_userrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_usersearch`
--

DROP TABLE IF EXISTS `analytics_usersearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_usersearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_usersearch_fbfc09f1` (`user_id`),
  KEY `analytics_usersearch_b8873da2` (`query`),
  CONSTRAINT `user_id_refs_id_500456b14f2d4d4e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_usersearch`
--

LOCK TABLES `analytics_usersearch` WRITE;
/*!40000 ALTER TABLE `analytics_usersearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_usersearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'exhibition'),(3,'large'),(2,'small'),(1,'Trade');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(105,1,105),(106,1,106),(107,1,107),(108,1,108),(109,1,109),(110,1,110),(111,1,111),(112,1,112),(113,1,113),(114,1,114),(115,1,115),(116,1,116),(117,1,117),(118,1,118),(119,1,119),(120,1,120),(121,1,121),(122,1,122),(123,1,123),(124,1,124),(125,1,125),(126,1,126),(127,1,127),(128,1,128),(129,1,129),(130,1,130),(131,1,131),(132,1,132),(133,1,133),(134,1,134),(135,1,135),(136,1,136),(137,1,137),(138,1,138),(139,1,139),(140,1,140),(141,1,141),(142,1,142),(143,1,143),(144,1,144),(145,1,145),(146,1,146),(147,1,147),(148,1,148),(149,1,149),(150,1,150),(151,1,151),(152,1,152),(153,1,153),(154,1,154),(155,1,155),(156,1,156),(157,1,157),(158,1,158),(159,1,159),(160,1,160),(161,1,161),(162,1,162),(163,1,163),(164,1,164),(165,1,165),(166,1,166),(167,1,167),(168,1,168),(169,1,169),(170,1,170),(171,1,171),(172,1,172),(173,1,173),(174,1,174),(175,1,175),(176,1,176),(177,1,177),(178,1,178),(179,1,179),(180,1,180),(181,1,181),(182,1,182),(183,1,183),(184,1,184),(185,1,185),(186,1,186),(187,1,187),(188,1,188),(189,1,189),(190,1,190),(191,1,191),(192,1,192),(193,1,193),(194,1,194),(195,1,195),(196,1,196),(197,1,197),(198,1,198),(199,1,199),(200,1,200),(201,1,201),(202,1,202),(203,1,203),(204,1,204),(205,1,205),(206,1,206),(207,1,207),(208,1,208),(209,1,209),(210,1,210),(211,1,211),(212,1,212),(213,1,213),(214,1,214),(215,1,215),(216,1,216),(217,1,217),(218,1,218),(219,1,219),(220,1,220),(221,1,221),(222,1,222),(223,1,223),(224,1,224),(225,1,225),(226,1,226),(227,1,227),(228,1,228),(229,1,229),(230,1,230),(231,1,231),(232,1,232),(233,1,233),(234,1,234),(235,1,235),(236,1,236),(237,1,237),(238,1,238),(239,1,239),(240,1,240),(241,1,241),(242,1,242),(243,1,243),(244,1,244),(245,1,245),(246,1,246),(247,1,247),(248,1,248),(249,1,249),(250,1,250),(251,1,251),(252,1,252),(253,1,253),(254,1,254),(255,1,255),(256,1,256),(257,1,257),(258,1,258),(259,1,259),(260,1,260),(261,1,261),(262,1,262),(263,1,263),(264,1,264),(265,1,265),(266,1,266),(267,1,267),(268,1,268),(269,1,269),(270,1,270),(271,1,271),(272,1,272),(273,1,273),(274,1,274),(275,1,275),(276,1,276),(277,1,277),(278,1,278),(279,1,279),(280,1,280),(281,1,281),(282,1,282),(283,1,283),(284,1,284),(285,1,285),(286,1,286),(287,1,287),(288,1,288),(289,1,289),(290,1,290),(291,1,291),(292,1,292),(293,1,293),(294,1,294),(295,1,295),(296,1,296),(297,1,297),(298,1,298),(299,1,299),(300,1,300),(301,1,301),(302,1,302),(303,1,303),(304,1,304),(305,1,305),(306,1,306),(307,1,307),(308,1,308),(309,1,309),(310,1,310),(311,1,311),(312,1,312),(313,1,313),(314,1,314),(315,1,315),(316,1,316),(317,1,317),(318,1,318),(319,1,319),(320,1,320),(321,1,321),(322,1,322),(323,1,323),(324,1,324),(325,1,325),(326,1,326),(327,1,327),(328,1,328),(329,1,332),(330,1,333),(331,1,334),(332,1,335),(333,1,336),(334,1,337),(335,1,338),(336,1,339),(337,1,340),(338,1,341),(339,1,342),(340,1,343),(341,1,344),(342,1,345),(343,1,346),(344,1,347),(345,1,348),(346,1,349),(347,1,350),(348,1,351),(349,1,352),(350,1,353),(351,1,354),(352,1,355),(353,1,356),(354,1,357),(355,1,358),(356,1,359),(357,1,360),(358,1,361),(359,1,362),(360,1,363),(361,1,364),(362,1,365),(363,1,366),(364,1,367);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add flat page',7,'add_flatpage'),(20,'Can change flat page',7,'change_flatpage'),(21,'Can delete flat page',7,'delete_flatpage'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add migration history',9,'add_migrationhistory'),(26,'Can change migration history',9,'change_migrationhistory'),(27,'Can delete migration history',9,'delete_migrationhistory'),(28,'Can add Product Review',10,'add_productreview'),(29,'Can change Product Review',10,'change_productreview'),(30,'Can delete Product Review',10,'delete_productreview'),(31,'Can add Vote',11,'add_vote'),(32,'Can change Vote',11,'change_vote'),(33,'Can delete Vote',11,'delete_vote'),(34,'Can add kv store',12,'add_kvstore'),(35,'Can change kv store',12,'change_kvstore'),(36,'Can delete kv store',12,'delete_kvstore'),(37,'Can add csv import',13,'add_csvimport'),(38,'Can change csv import',13,'change_csvimport'),(39,'Can delete csv import',13,'delete_csvimport'),(40,'Can add import model',14,'add_importmodel'),(41,'Can change import model',14,'change_importmodel'),(42,'Can delete import model',14,'delete_importmodel'),(43,'Can add bookmark',15,'add_bookmark'),(44,'Can change bookmark',15,'change_bookmark'),(45,'Can delete bookmark',15,'delete_bookmark'),(46,'Can add dashboard preferences',16,'add_dashboardpreferences'),(47,'Can change dashboard preferences',16,'change_dashboardpreferences'),(48,'Can delete dashboard preferences',16,'delete_dashboardpreferences'),(49,'Can add account type',17,'add_accounttype'),(50,'Can change account type',17,'change_accounttype'),(51,'Can delete account type',17,'delete_accounttype'),(52,'Can add account',18,'add_account'),(53,'Can change account',18,'change_account'),(54,'Can delete account',18,'delete_account'),(55,'Can add transfer',19,'add_transfer'),(56,'Can change transfer',19,'change_transfer'),(57,'Can delete transfer',19,'delete_transfer'),(58,'Can add transaction',20,'add_transaction'),(59,'Can change transaction',20,'change_transaction'),(60,'Can delete transaction',20,'delete_transaction'),(61,'Can add IP address record',21,'add_ipaddressrecord'),(62,'Can change IP address record',21,'change_ipaddressrecord'),(63,'Can delete IP address record',21,'delete_ipaddressrecord'),(64,'Can add Email',22,'add_email'),(65,'Can change Email',22,'change_email'),(66,'Can delete Email',22,'delete_email'),(67,'Can add Communication event type',23,'add_communicationeventtype'),(68,'Can change Communication event type',23,'change_communicationeventtype'),(69,'Can delete Communication event type',23,'delete_communicationeventtype'),(70,'Can add notification',24,'add_notification'),(71,'Can change notification',24,'change_notification'),(72,'Can delete notification',24,'delete_notification'),(73,'Can add product alert',25,'add_productalert'),(74,'Can change product alert',25,'change_productalert'),(75,'Can delete product alert',25,'delete_productalert'),(76,'Can add Product Recommendation',26,'add_productrecommendation'),(77,'Can change Product Recommendation',26,'change_productrecommendation'),(78,'Can delete Product Recommendation',26,'delete_productrecommendation'),(79,'Can add Product Class',27,'add_productclass'),(80,'Can change Product Class',27,'change_productclass'),(81,'Can delete Product Class',27,'delete_productclass'),(82,'Can add Category',28,'add_category'),(83,'Can change Category',28,'change_category'),(84,'Can delete Category',28,'delete_category'),(85,'Can add Product Category',29,'add_productcategory'),(86,'Can change Product Category',29,'change_productcategory'),(87,'Can delete Product Category',29,'delete_productcategory'),(88,'Can add Product',30,'add_product'),(89,'Can change Product',30,'change_product'),(90,'Can delete Product',30,'delete_product'),(91,'Can add Contributor Role',31,'add_contributorrole'),(92,'Can change Contributor Role',31,'change_contributorrole'),(93,'Can delete Contributor Role',31,'delete_contributorrole'),(94,'Can add Contributor',32,'add_contributor'),(95,'Can change Contributor',32,'change_contributor'),(96,'Can delete Contributor',32,'delete_contributor'),(97,'Can add Product Contributor',33,'add_productcontributor'),(98,'Can change Product Contributor',33,'change_productcontributor'),(99,'Can delete Product Contributor',33,'delete_productcontributor'),(100,'Can add Product Attribute',34,'add_productattribute'),(101,'Can change Product Attribute',34,'change_productattribute'),(102,'Can delete Product Attribute',34,'delete_productattribute'),(103,'Can add Product Attribute Value',35,'add_productattributevalue'),(104,'Can change Product Attribute Value',35,'change_productattributevalue'),(105,'Can delete Product Attribute Value',35,'delete_productattributevalue'),(106,'Can add Attribute Option Group',36,'add_attributeoptiongroup'),(107,'Can change Attribute Option Group',36,'change_attributeoptiongroup'),(108,'Can delete Attribute Option Group',36,'delete_attributeoptiongroup'),(109,'Can add Attribute Option',37,'add_attributeoption'),(110,'Can change Attribute Option',37,'change_attributeoption'),(111,'Can delete Attribute Option',37,'delete_attributeoption'),(112,'Can add Attribute Entity',38,'add_attributeentity'),(113,'Can change Attribute Entity',38,'change_attributeentity'),(114,'Can delete Attribute Entity',38,'delete_attributeentity'),(115,'Can add Attribute Entity Type',39,'add_attributeentitytype'),(116,'Can change Attribute Entity Type',39,'change_attributeentitytype'),(117,'Can delete Attribute Entity Type',39,'delete_attributeentitytype'),(118,'Can add Option',40,'add_option'),(119,'Can change Option',40,'change_option'),(120,'Can delete Option',40,'delete_option'),(121,'Can add Product Image',41,'add_productimage'),(122,'Can change Product Image',41,'change_productimage'),(123,'Can delete Product Image',41,'delete_productimage'),(124,'Can add Product record',42,'add_productrecord'),(125,'Can change Product record',42,'change_productrecord'),(126,'Can delete Product record',42,'delete_productrecord'),(127,'Can add User Record',43,'add_userrecord'),(128,'Can change User Record',43,'change_userrecord'),(129,'Can delete User Record',43,'delete_userrecord'),(130,'Can add Basket',44,'add_userproductview'),(131,'Can change Basket',44,'change_userproductview'),(132,'Can delete Basket',44,'delete_userproductview'),(133,'Can add user search',45,'add_usersearch'),(134,'Can change user search',45,'change_usersearch'),(135,'Can delete user search',45,'delete_usersearch'),(136,'Can add Fulfillment partner',46,'add_partner'),(137,'Can change Fulfillment partner',46,'change_partner'),(138,'Can delete Fulfillment partner',46,'delete_partner'),(139,'Can edit stock records',46,'can_edit_stock_records'),(140,'Can view stock records',46,'can_view_stock_records'),(141,'Can edit product range',46,'can_edit_product_range'),(142,'Can view product range',46,'can_view_product_range'),(143,'Can edit order lines',46,'can_edit_order_lines'),(144,'Can view order lines',46,'can_view_order_lines'),(145,'Can add Stock Record',47,'add_stockrecord'),(146,'Can change Stock Record',47,'change_stockrecord'),(147,'Can delete Stock Record',47,'delete_stockrecord'),(148,'Can add Stock Alert',48,'add_stockalert'),(149,'Can change Stock Alert',48,'change_stockalert'),(150,'Can delete Stock Alert',48,'delete_stockalert'),(151,'Can add User address',49,'add_useraddress'),(152,'Can change User address',49,'change_useraddress'),(153,'Can delete User address',49,'delete_useraddress'),(154,'Can add Country',50,'add_country'),(155,'Can change Country',50,'change_country'),(156,'Can delete Country',50,'delete_country'),(157,'Can add Payment Event Quantity',51,'add_paymenteventquantity'),(158,'Can change Payment Event Quantity',51,'change_paymenteventquantity'),(159,'Can delete Payment Event Quantity',51,'delete_paymenteventquantity'),(160,'Can add Shipping Event Quantity',52,'add_shippingeventquantity'),(161,'Can change Shipping Event Quantity',52,'change_shippingeventquantity'),(162,'Can delete Shipping Event Quantity',52,'delete_shippingeventquantity'),(163,'Can add Order',53,'add_order'),(164,'Can change Order',53,'change_order'),(165,'Can delete Order',53,'delete_order'),(166,'Can view orders (eg for reporting)',53,'can_view'),(167,'Can add Order Note',54,'add_ordernote'),(168,'Can change Order Note',54,'change_ordernote'),(169,'Can delete Order Note',54,'delete_ordernote'),(170,'Can add Communication Event',55,'add_communicationevent'),(171,'Can change Communication Event',55,'change_communicationevent'),(172,'Can delete Communication Event',55,'delete_communicationevent'),(173,'Can add Shipping address',56,'add_shippingaddress'),(174,'Can change Shipping address',56,'change_shippingaddress'),(175,'Can delete Shipping address',56,'delete_shippingaddress'),(176,'Can add billing address',57,'add_billingaddress'),(177,'Can change billing address',57,'change_billingaddress'),(178,'Can delete billing address',57,'delete_billingaddress'),(179,'Can add Order Line',58,'add_line'),(180,'Can change Order Line',58,'change_line'),(181,'Can delete Order Line',58,'delete_line'),(182,'Can add Line Price',59,'add_lineprice'),(183,'Can change Line Price',59,'change_lineprice'),(184,'Can delete Line Price',59,'delete_lineprice'),(185,'Can add Line Attribute',60,'add_lineattribute'),(186,'Can change Line Attribute',60,'change_lineattribute'),(187,'Can delete Line Attribute',60,'delete_lineattribute'),(188,'Can add Shipping Event',61,'add_shippingevent'),(189,'Can change Shipping Event',61,'change_shippingevent'),(190,'Can delete Shipping Event',61,'delete_shippingevent'),(191,'Can add Shipping Event Type',62,'add_shippingeventtype'),(192,'Can change Shipping Event Type',62,'change_shippingeventtype'),(193,'Can delete Shipping Event Type',62,'delete_shippingeventtype'),(194,'Can add Payment Event',63,'add_paymentevent'),(195,'Can change Payment Event',63,'change_paymentevent'),(196,'Can delete Payment Event',63,'delete_paymentevent'),(197,'Can add Payment Event Type',64,'add_paymenteventtype'),(198,'Can change Payment Event Type',64,'change_paymenteventtype'),(199,'Can delete Payment Event Type',64,'delete_paymenteventtype'),(200,'Can add Order Discount',65,'add_orderdiscount'),(201,'Can change Order Discount',65,'change_orderdiscount'),(202,'Can delete Order Discount',65,'delete_orderdiscount'),(203,'Can add Order and Item Charge',66,'add_orderanditemcharges'),(204,'Can change Order and Item Charge',66,'change_orderanditemcharges'),(205,'Can delete Order and Item Charge',66,'delete_orderanditemcharges'),(206,'Can add Weight-based Shipping Method',67,'add_weightbased'),(207,'Can change Weight-based Shipping Method',67,'change_weightbased'),(208,'Can delete Weight-based Shipping Method',67,'delete_weightbased'),(209,'Can add Weight Band',68,'add_weightband'),(210,'Can change Weight Band',68,'change_weightband'),(211,'Can delete Weight Band',68,'delete_weightband'),(212,'Can add Conditional offer',69,'add_conditionaloffer'),(213,'Can change Conditional offer',69,'change_conditionaloffer'),(214,'Can delete Conditional offer',69,'delete_conditionaloffer'),(215,'Can add Condition',70,'add_condition'),(216,'Can change Condition',70,'change_condition'),(217,'Can delete Condition',70,'delete_condition'),(218,'Can add Benefit',71,'add_benefit'),(219,'Can change Benefit',71,'change_benefit'),(220,'Can delete Benefit',71,'delete_benefit'),(221,'Can add Range',72,'add_range'),(222,'Can change Range',72,'change_range'),(223,'Can delete Range',72,'delete_range'),(224,'Can add Count Condition',70,'add_countcondition'),(225,'Can change Count Condition',70,'change_countcondition'),(226,'Can delete Count Condition',70,'delete_countcondition'),(227,'Can add Coverage Condition',70,'add_coveragecondition'),(228,'Can change Coverage Condition',70,'change_coveragecondition'),(229,'Can delete Coverage Condition',70,'delete_coveragecondition'),(230,'Can add Value Condition',70,'add_valuecondition'),(231,'Can change Value Condition',70,'change_valuecondition'),(232,'Can delete Value Condition',70,'delete_valuecondition'),(233,'Can add Percentage discount benefit',71,'add_percentagediscountbenefit'),(234,'Can change Percentage discount benefit',71,'change_percentagediscountbenefit'),(235,'Can delete Percentage discount benefit',71,'delete_percentagediscountbenefit'),(236,'Can add Absolute discount benefit',71,'add_absolutediscountbenefit'),(237,'Can change Absolute discount benefit',71,'change_absolutediscountbenefit'),(238,'Can delete Absolute discount benefit',71,'delete_absolutediscountbenefit'),(239,'Can add Fixed price benefit',71,'add_fixedpricebenefit'),(240,'Can change Fixed price benefit',71,'change_fixedpricebenefit'),(241,'Can delete Fixed price benefit',71,'delete_fixedpricebenefit'),(242,'Can add Multibuy discount benefit',71,'add_multibuydiscountbenefit'),(243,'Can change Multibuy discount benefit',71,'change_multibuydiscountbenefit'),(244,'Can delete Multibuy discount benefit',71,'delete_multibuydiscountbenefit'),(245,'Can add shipping benefit',71,'add_shippingbenefit'),(246,'Can change shipping benefit',71,'change_shippingbenefit'),(247,'Can delete shipping benefit',71,'delete_shippingbenefit'),(248,'Can add Shipping absolute discount benefit',71,'add_shippingabsolutediscountbenefit'),(249,'Can change Shipping absolute discount benefit',71,'change_shippingabsolutediscountbenefit'),(250,'Can delete Shipping absolute discount benefit',71,'delete_shippingabsolutediscountbenefit'),(251,'Can add Fixed price shipping benefit',71,'add_shippingfixedpricebenefit'),(252,'Can change Fixed price shipping benefit',71,'change_shippingfixedpricebenefit'),(253,'Can delete Fixed price shipping benefit',71,'delete_shippingfixedpricebenefit'),(254,'Can add Shipping percentage discount benefit',71,'add_shippingpercentagediscountbenefit'),(255,'Can change Shipping percentage discount benefit',71,'change_shippingpercentagediscountbenefit'),(256,'Can delete Shipping percentage discount benefit',71,'delete_shippingpercentagediscountbenefit'),(257,'Can add Voucher',84,'add_voucher'),(258,'Can change Voucher',84,'change_voucher'),(259,'Can delete Voucher',84,'delete_voucher'),(260,'Can add Voucher Application',85,'add_voucherapplication'),(261,'Can change Voucher Application',85,'change_voucherapplication'),(262,'Can delete Voucher Application',85,'delete_voucherapplication'),(263,'Can add Basket',86,'add_basket'),(264,'Can change Basket',86,'change_basket'),(265,'Can delete Basket',86,'delete_basket'),(266,'Can add Basket line',87,'add_line'),(267,'Can change Basket line',87,'change_line'),(268,'Can delete Basket line',87,'delete_line'),(269,'Can add Line attribute',88,'add_lineattribute'),(270,'Can change Line attribute',88,'change_lineattribute'),(271,'Can delete Line attribute',88,'delete_lineattribute'),(272,'Can add Transaction',89,'add_transaction'),(273,'Can change Transaction',89,'change_transaction'),(274,'Can delete Transaction',89,'delete_transaction'),(275,'Can add Source',90,'add_source'),(276,'Can change Source',90,'change_source'),(277,'Can delete Source',90,'delete_source'),(278,'Can add Source Type',91,'add_sourcetype'),(279,'Can change Source Type',91,'change_sourcetype'),(280,'Can delete Source Type',91,'delete_sourcetype'),(281,'Can add Bankcard',92,'add_bankcard'),(282,'Can change Bankcard',92,'change_bankcard'),(283,'Can delete Bankcard',92,'delete_bankcard'),(284,'Can add Range Product Uploaded File',93,'add_rangeproductfileupload'),(285,'Can change Range Product Uploaded File',93,'change_rangeproductfileupload'),(286,'Can delete Range Product Uploaded File',93,'delete_rangeproductfileupload'),(287,'Can add Page Promotion',94,'add_pagepromotion'),(288,'Can change Page Promotion',94,'change_pagepromotion'),(289,'Can delete Page Promotion',94,'delete_pagepromotion'),(290,'Can add Keyword Promotion',95,'add_keywordpromotion'),(291,'Can change Keyword Promotion',95,'change_keywordpromotion'),(292,'Can delete Keyword Promotion',95,'delete_keywordpromotion'),(293,'Can add Raw HTML',96,'add_rawhtml'),(294,'Can change Raw HTML',96,'change_rawhtml'),(295,'Can delete Raw HTML',96,'delete_rawhtml'),(296,'Can add Image',97,'add_image'),(297,'Can change Image',97,'change_image'),(298,'Can delete Image',97,'delete_image'),(299,'Can add Multi Image',98,'add_multiimage'),(300,'Can change Multi Image',98,'change_multiimage'),(301,'Can delete Multi Image',98,'delete_multiimage'),(302,'Can add Single Product',99,'add_singleproduct'),(303,'Can change Single Product',99,'change_singleproduct'),(304,'Can delete Single Product',99,'delete_singleproduct'),(305,'Can add Hand Picked Product List',100,'add_handpickedproductlist'),(306,'Can change Hand Picked Product List',100,'change_handpickedproductlist'),(307,'Can delete Hand Picked Product List',100,'delete_handpickedproductlist'),(308,'Can add Ordered Product',101,'add_orderedproduct'),(309,'Can change Ordered Product',101,'change_orderedproduct'),(310,'Can delete Ordered Product',101,'delete_orderedproduct'),(311,'Can add Automatic Product List',102,'add_automaticproductlist'),(312,'Can change Automatic Product List',102,'change_automaticproductlist'),(313,'Can delete Automatic Product List',102,'delete_automaticproductlist'),(314,'Can add Ordered Product List',103,'add_orderedproductlist'),(315,'Can change Ordered Product List',103,'change_orderedproductlist'),(316,'Can delete Ordered Product List',103,'delete_orderedproductlist'),(317,'Can add Tabbed Block',104,'add_tabbedblock'),(318,'Can change Tabbed Block',104,'change_tabbedblock'),(319,'Can delete Tabbed Block',104,'delete_tabbedblock'),(320,'Can add attribute option thumbnail',105,'add_attributeoptionthumbnail'),(321,'Can change attribute option thumbnail',105,'change_attributeoptionthumbnail'),(322,'Can delete attribute option thumbnail',105,'delete_attributeoptionthumbnail'),(323,'Can add express transaction',107,'add_expresstransaction'),(324,'Can change express transaction',107,'change_expresstransaction'),(325,'Can delete express transaction',107,'delete_expresstransaction'),(326,'Can add payflow transaction',108,'add_payflowtransaction'),(327,'Can change payflow transaction',108,'change_payflowtransaction'),(328,'Can delete payflow transaction',108,'delete_payflowtransaction'),(332,'Can add price',110,'add_price'),(333,'Can change price',110,'change_price'),(334,'Can delete price',110,'delete_price'),(335,'Can add job',111,'add_job'),(336,'Can change job',111,'change_job'),(337,'Can delete job',111,'delete_job'),(338,'Can add task',112,'add_task'),(339,'Can change task',112,'change_task'),(340,'Can delete task',112,'delete_task'),(341,'Can add stage',113,'add_stage'),(342,'Can change stage',113,'change_stage'),(343,'Can delete stage',113,'delete_stage'),(344,'Can add option choice',114,'add_optionchoice'),(345,'Can change option choice',114,'change_optionchoice'),(346,'Can delete option choice',114,'delete_optionchoice'),(347,'Can add option picker group',115,'add_optionpickergroup'),(348,'Can change option picker group',115,'change_optionpickergroup'),(349,'Can delete option picker group',115,'delete_optionpickergroup'),(350,'Can add option picker',116,'add_optionpicker'),(351,'Can change option picker',116,'change_optionpicker'),(352,'Can delete option picker',116,'delete_optionpicker'),(353,'Can add artwork item',117,'add_artworkitem'),(354,'Can change artwork item',117,'change_artworkitem'),(355,'Can delete artwork item',117,'delete_artworkitem'),(356,'Can add common task description',118,'add_commontaskdescription'),(357,'Can change common task description',118,'change_commontaskdescription'),(358,'Can delete common task description',118,'delete_commontaskdescription'),(359,'Can add line attachment',119,'add_lineattachment'),(360,'Can change line attachment',119,'change_lineattachment'),(361,'Can delete line attachment',119,'delete_lineattachment'),(362,'Can add quote',120,'add_quote'),(363,'Can change quote',120,'change_quote'),(364,'Can delete quote',120,'delete_quote'),(365,'Can add Globals',121,'add_globals'),(366,'Can change Globals',121,'change_globals'),(367,'Can delete Globals',121,'delete_globals');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'Dave','Dave','E','admin@theimip.com','pbkdf2_sha256$10000$kSYQ605oRsqZ$BELQl3Zg+gF3/UvpSYg4/vdWUf0NJIQrmIzPZggVv44=',1,1,1,'2013-08-28 15:30:28','2013-05-08 14:28:24'),(4,'Neil','','','info@theimip.com','pbkdf2_sha256$10000$qPbKakAHcDvs$9sPuwFlgCQIziQkqyoahpem4QeD4zsSbq1bGJMlzZoc=',1,1,1,'2013-08-13 20:05:15','2013-05-17 06:45:45'),(8,'Dev','','','info1@theimip.com','pbkdf2_sha256$10000$KpUxs3uQRS6n$40uLIBlCFfO+JL7/3RGlH63YM4mEk+r6M8gEb1MhDn8=',1,1,0,'2013-06-06 10:57:58','2013-05-25 07:17:13'),(10,'Developer2','','','info@westendlondonshop.cpm','pbkdf2_sha256$10000$0DS7WBpujrP4$Va7pJ7Voz6Gg2tz82L7tQ6EQM5OOrQgWOU3PFo2vo3E=',1,1,1,'2013-08-25 17:33:05','2013-06-04 19:37:35'),(11,'Zaki','','','orders@theimip.com','pbkdf2_sha256$10000$216KBULGs1fS$Fh0HCJYRrfIq9KY6p32gY8gq6PAGgCUoa7ef/WZHXb8=',1,1,0,'2013-08-23 12:21:08','2013-06-25 20:30:17'),(14,'Data','Alex','O','dave@westendlondonshop.com','pbkdf2_sha256$10000$3fDGrvhUyq0w$e2Wbs6AQhBCAk6ZymQrW9qy9EdiEg3p9gN1ZNawuTo4=',1,1,1,'2013-08-17 09:43:17','2013-08-12 19:10:04'),(17,'Fabrizio','Fabrizio','','admin@westendlondonshop.com','pbkdf2_sha256$10000$hxsC8vJssEbe$wECW66SrU1ULC5MEzAGS1IzHUuh7Jnr0Zv27LlVAEDk=',1,1,1,'2013-08-23 15:11:35','2013-08-23 15:08:42');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (3,1,1),(2,4,1),(1,10,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8914 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (4870,1,1),(4871,1,2),(4872,1,3),(4873,1,4),(4874,1,5),(4875,1,6),(4876,1,7),(4877,1,8),(4878,1,9),(4879,1,10),(4880,1,11),(4881,1,12),(4882,1,13),(4883,1,14),(4884,1,15),(4885,1,16),(4886,1,17),(4887,1,18),(4888,1,19),(4889,1,20),(4890,1,21),(4891,1,22),(4892,1,23),(4893,1,24),(4894,1,25),(4895,1,26),(4896,1,27),(4897,1,28),(4898,1,29),(4899,1,30),(4900,1,31),(4901,1,32),(4902,1,33),(4903,1,34),(4904,1,35),(4905,1,36),(4906,1,37),(4907,1,38),(4908,1,39),(4909,1,40),(4910,1,41),(4911,1,42),(4912,1,43),(4913,1,44),(4914,1,45),(4915,1,46),(4916,1,47),(4917,1,48),(4918,1,49),(4919,1,50),(4920,1,51),(4921,1,52),(4922,1,53),(4923,1,54),(4924,1,55),(4925,1,56),(4926,1,57),(4927,1,58),(4928,1,59),(4929,1,60),(4930,1,61),(4931,1,62),(4932,1,63),(4933,1,64),(4934,1,65),(4935,1,66),(4936,1,67),(4937,1,68),(4938,1,69),(4939,1,70),(4940,1,71),(4941,1,72),(4942,1,73),(4943,1,74),(4944,1,75),(4945,1,76),(4946,1,77),(4947,1,78),(4948,1,79),(4949,1,80),(4950,1,81),(4951,1,82),(4952,1,83),(4953,1,84),(4954,1,85),(4955,1,86),(4956,1,87),(4957,1,88),(4958,1,89),(4959,1,90),(4960,1,91),(4961,1,92),(4962,1,93),(4963,1,94),(4964,1,95),(4965,1,96),(4966,1,97),(4967,1,98),(4968,1,99),(4969,1,100),(4970,1,101),(4971,1,102),(4972,1,103),(4973,1,104),(4974,1,105),(4975,1,106),(4976,1,107),(4977,1,108),(4978,1,109),(4979,1,110),(4980,1,111),(4981,1,112),(4982,1,113),(4983,1,114),(4984,1,115),(4985,1,116),(4986,1,117),(4987,1,118),(4988,1,119),(4989,1,120),(4990,1,121),(4991,1,122),(4992,1,123),(4993,1,124),(4994,1,125),(4995,1,126),(4996,1,127),(4997,1,128),(4998,1,129),(4999,1,130),(5000,1,131),(5001,1,132),(5002,1,133),(5003,1,134),(5004,1,135),(5005,1,136),(5006,1,137),(5007,1,138),(5008,1,139),(5009,1,140),(5010,1,141),(5011,1,142),(5012,1,143),(5013,1,144),(5014,1,145),(5015,1,146),(5016,1,147),(5017,1,148),(5018,1,149),(5019,1,150),(5020,1,151),(5021,1,152),(5022,1,153),(5023,1,154),(5024,1,155),(5025,1,156),(5026,1,157),(5027,1,158),(5028,1,159),(5029,1,160),(5030,1,161),(5031,1,162),(5032,1,163),(5033,1,164),(5034,1,165),(5035,1,166),(5036,1,167),(5037,1,168),(5038,1,169),(5039,1,170),(5040,1,171),(5041,1,172),(5042,1,173),(5043,1,174),(5044,1,175),(5045,1,176),(5046,1,177),(5047,1,178),(5048,1,179),(5049,1,180),(5050,1,181),(5051,1,182),(5052,1,183),(5053,1,184),(5054,1,185),(5055,1,186),(5056,1,187),(5057,1,188),(5058,1,189),(5059,1,190),(5060,1,191),(5061,1,192),(5062,1,193),(5063,1,194),(5064,1,195),(5065,1,196),(5066,1,197),(5067,1,198),(5068,1,199),(5069,1,200),(5070,1,201),(5071,1,202),(5072,1,203),(5073,1,204),(5074,1,205),(5075,1,206),(5076,1,207),(5077,1,208),(5078,1,209),(5079,1,210),(5080,1,211),(5081,1,212),(5082,1,213),(5083,1,214),(5084,1,215),(5085,1,216),(5086,1,217),(5087,1,218),(5088,1,219),(5089,1,220),(5090,1,221),(5091,1,222),(5092,1,223),(5093,1,224),(5094,1,225),(5095,1,226),(5096,1,227),(5097,1,228),(5098,1,229),(5099,1,230),(5100,1,231),(5101,1,232),(5102,1,233),(5103,1,234),(5104,1,235),(5105,1,236),(5106,1,237),(5107,1,238),(5108,1,239),(5109,1,240),(5110,1,241),(5111,1,242),(5112,1,243),(5113,1,244),(5114,1,245),(5115,1,246),(5116,1,247),(5117,1,248),(5118,1,249),(5119,1,250),(5120,1,251),(5121,1,252),(5122,1,253),(5123,1,254),(5124,1,255),(5125,1,256),(5126,1,257),(5127,1,258),(5128,1,259),(5129,1,260),(5130,1,261),(5131,1,262),(5132,1,263),(5133,1,264),(5134,1,265),(5135,1,266),(5136,1,267),(5137,1,268),(5138,1,269),(5139,1,270),(5140,1,271),(5141,1,272),(5142,1,273),(5143,1,274),(5144,1,275),(5145,1,276),(5146,1,277),(5147,1,278),(5148,1,279),(5149,1,280),(5150,1,281),(5151,1,282),(5152,1,283),(5153,1,284),(5154,1,285),(5155,1,286),(5156,1,287),(5157,1,288),(5158,1,289),(5159,1,290),(5160,1,291),(5161,1,292),(5162,1,293),(5163,1,294),(5164,1,295),(5165,1,296),(5166,1,297),(5167,1,298),(5168,1,299),(5169,1,300),(5170,1,301),(5171,1,302),(5172,1,303),(5173,1,304),(5174,1,305),(5175,1,306),(5176,1,307),(5177,1,308),(5178,1,309),(5179,1,310),(5180,1,311),(5181,1,312),(5182,1,313),(5183,1,314),(5184,1,315),(5185,1,316),(5186,1,317),(5187,1,318),(5188,1,319),(5189,1,320),(5190,1,321),(5191,1,322),(5192,1,323),(5193,1,324),(5194,1,325),(5195,1,326),(5196,1,327),(5197,1,328),(5198,1,332),(5199,1,333),(5200,1,334),(5201,1,335),(5202,1,336),(5203,1,337),(5204,1,338),(5205,1,339),(5206,1,340),(5207,1,341),(5208,1,342),(5209,1,343),(5210,1,344),(5211,1,345),(5212,1,346),(5213,1,347),(5214,1,348),(5215,1,349),(5216,1,350),(5217,1,351),(5218,1,352),(5219,1,353),(5220,1,354),(5221,1,355),(3831,4,1),(3832,4,2),(3833,4,3),(3834,4,4),(3835,4,5),(3836,4,6),(3837,4,7),(3838,4,8),(3839,4,9),(3840,4,10),(3841,4,11),(3842,4,12),(3843,4,13),(3844,4,14),(3845,4,15),(3846,4,16),(3847,4,17),(3848,4,18),(3849,4,19),(3850,4,20),(3851,4,21),(3852,4,22),(3853,4,23),(3854,4,24),(3855,4,25),(3856,4,26),(3857,4,27),(3858,4,28),(3859,4,29),(3860,4,30),(3861,4,31),(3862,4,32),(3863,4,33),(3864,4,34),(3865,4,35),(3866,4,36),(3867,4,37),(3868,4,38),(3869,4,39),(3870,4,40),(3871,4,41),(3872,4,42),(3873,4,43),(3874,4,44),(3875,4,45),(3876,4,46),(3877,4,47),(3878,4,48),(3879,4,49),(3880,4,50),(3881,4,51),(3882,4,52),(3883,4,55),(3884,4,56),(3885,4,57),(3886,4,58),(3887,4,59),(3888,4,60),(3889,4,61),(3890,4,62),(3891,4,63),(3892,4,64),(3893,4,65),(3894,4,66),(3895,4,67),(3896,4,68),(3897,4,69),(3898,4,70),(3899,4,71),(3900,4,72),(3901,4,73),(3902,4,74),(3903,4,75),(3904,4,76),(3905,4,77),(3906,4,78),(3907,4,79),(3908,4,80),(3909,4,81),(3910,4,82),(3911,4,83),(3912,4,84),(3913,4,85),(3914,4,86),(3915,4,87),(3916,4,88),(3917,4,89),(3918,4,90),(3919,4,91),(3920,4,92),(3921,4,93),(3922,4,94),(3923,4,95),(3924,4,96),(3925,4,97),(3926,4,98),(3927,4,99),(3928,4,100),(3929,4,101),(3930,4,102),(3931,4,103),(3932,4,104),(3933,4,105),(3934,4,106),(3935,4,107),(3936,4,108),(3937,4,109),(3938,4,110),(3939,4,111),(3940,4,112),(3941,4,113),(3942,4,114),(3943,4,115),(3944,4,116),(3945,4,117),(3946,4,118),(3947,4,119),(3948,4,120),(3949,4,121),(3950,4,122),(3951,4,123),(3952,4,124),(3953,4,125),(3954,4,126),(3955,4,127),(3956,4,128),(3957,4,129),(3958,4,130),(3959,4,131),(3960,4,132),(3961,4,133),(3962,4,134),(3963,4,135),(3964,4,136),(3965,4,137),(3966,4,138),(3967,4,139),(3968,4,140),(3969,4,141),(3970,4,142),(3971,4,143),(3972,4,144),(3973,4,145),(3974,4,146),(3975,4,147),(3976,4,148),(3977,4,149),(3978,4,150),(3979,4,151),(3980,4,152),(3981,4,153),(3982,4,154),(3983,4,155),(3984,4,156),(3985,4,157),(3986,4,158),(3987,4,159),(3988,4,160),(3989,4,161),(3990,4,162),(3991,4,163),(3992,4,164),(3993,4,165),(3994,4,166),(3995,4,167),(3996,4,168),(3997,4,169),(3998,4,170),(3999,4,171),(4000,4,172),(4001,4,173),(4002,4,174),(4003,4,175),(4004,4,176),(4005,4,177),(4006,4,178),(4007,4,179),(4008,4,180),(4009,4,181),(4010,4,182),(4011,4,183),(4012,4,184),(4013,4,185),(4014,4,186),(4015,4,187),(4016,4,188),(4017,4,189),(4018,4,190),(4019,4,191),(4020,4,192),(4021,4,193),(4022,4,194),(4023,4,195),(4024,4,196),(4025,4,197),(4026,4,198),(4027,4,199),(4028,4,200),(4029,4,201),(4030,4,202),(4031,4,203),(4032,4,204),(4033,4,205),(4034,4,206),(4035,4,207),(4036,4,208),(4037,4,209),(4038,4,210),(4039,4,211),(4040,4,212),(4041,4,213),(4042,4,214),(4043,4,215),(4044,4,216),(4045,4,217),(4046,4,218),(4047,4,219),(4048,4,220),(4049,4,221),(4050,4,222),(4051,4,223),(4052,4,224),(4053,4,225),(4054,4,226),(4055,4,227),(4056,4,228),(4057,4,229),(4058,4,230),(4059,4,231),(4060,4,232),(4061,4,233),(4062,4,234),(4063,4,235),(4064,4,236),(4065,4,237),(4066,4,238),(4067,4,239),(4068,4,240),(4069,4,241),(4070,4,242),(4071,4,243),(4072,4,244),(4073,4,245),(4074,4,246),(4075,4,247),(4076,4,248),(4077,4,249),(4078,4,250),(4079,4,251),(4080,4,252),(4081,4,253),(4082,4,254),(4083,4,255),(4084,4,256),(4085,4,257),(4086,4,258),(4087,4,259),(4088,4,260),(4089,4,261),(4090,4,262),(4091,4,263),(4092,4,264),(4093,4,265),(4094,4,266),(4095,4,267),(4096,4,268),(4097,4,269),(4098,4,270),(4099,4,271),(4100,4,272),(4101,4,273),(4102,4,274),(4103,4,275),(4104,4,276),(4105,4,277),(4106,4,278),(4107,4,279),(4108,4,280),(4109,4,281),(4110,4,282),(4111,4,283),(4112,4,284),(4113,4,285),(4114,4,286),(4115,4,287),(4116,4,288),(4117,4,289),(4118,4,290),(4119,4,291),(4120,4,292),(4121,4,293),(4122,4,294),(4123,4,295),(4124,4,296),(4125,4,297),(4126,4,298),(4127,4,299),(4128,4,300),(4129,4,301),(4130,4,302),(4131,4,303),(4132,4,304),(4133,4,305),(4134,4,306),(4135,4,307),(4136,4,308),(4137,4,309),(4138,4,310),(4139,4,311),(4140,4,312),(4141,4,313),(4142,4,314),(4143,4,315),(4144,4,316),(4145,4,317),(4146,4,318),(4147,4,319),(4148,4,320),(4149,4,321),(4150,4,332),(4151,4,333),(4152,4,335),(4153,4,336),(4154,4,338),(4155,4,339),(4156,4,341),(4157,4,342),(4158,4,344),(4159,4,345),(4160,4,347),(4161,4,348),(4162,4,350),(4163,4,351),(4164,4,353),(4165,4,354),(5222,8,1),(5223,8,2),(5224,8,3),(5225,8,4),(5226,8,5),(5227,8,6),(5228,8,7),(5229,8,8),(5230,8,9),(5231,8,10),(5232,8,11),(5233,8,12),(5234,8,13),(5235,8,14),(5236,8,15),(5237,8,16),(5238,8,17),(5239,8,18),(5240,8,19),(5241,8,20),(5242,8,21),(5243,8,22),(5244,8,23),(5245,8,24),(5246,8,25),(5247,8,26),(5248,8,27),(5249,8,28),(5250,8,29),(5251,8,30),(5252,8,31),(5253,8,32),(5254,8,33),(5255,8,34),(5256,8,35),(5257,8,36),(5258,8,37),(5259,8,38),(5260,8,39),(5261,8,40),(5262,8,41),(5263,8,42),(5264,8,43),(5265,8,44),(5266,8,45),(5267,8,46),(5268,8,47),(5269,8,48),(5270,8,49),(5271,8,50),(5272,8,55),(5273,8,56),(5274,8,57),(5275,8,58),(5276,8,59),(5277,8,60),(5278,8,64),(5279,8,65),(5280,8,66),(5281,8,67),(5282,8,68),(5283,8,69),(5284,8,70),(5285,8,71),(5286,8,72),(5287,8,73),(5288,8,74),(5289,8,75),(5290,8,76),(5291,8,77),(5292,8,78),(5293,8,79),(5294,8,80),(5295,8,81),(5296,8,82),(5297,8,83),(5298,8,84),(5299,8,85),(5300,8,86),(5301,8,87),(5302,8,88),(5303,8,89),(5304,8,90),(5305,8,91),(5306,8,92),(5307,8,93),(5308,8,94),(5309,8,95),(5310,8,96),(5311,8,97),(5312,8,98),(5313,8,99),(5314,8,100),(5315,8,101),(5316,8,102),(5317,8,103),(5318,8,104),(5319,8,105),(5320,8,106),(5321,8,107),(5322,8,108),(5323,8,109),(5324,8,110),(5325,8,111),(5326,8,112),(5327,8,113),(5328,8,114),(5329,8,115),(5330,8,116),(5331,8,117),(5332,8,118),(5333,8,119),(5334,8,120),(5335,8,121),(5336,8,122),(5337,8,123),(5338,8,124),(5339,8,125),(5340,8,126),(5341,8,127),(5342,8,128),(5343,8,129),(5344,8,130),(5345,8,131),(5346,8,132),(5347,8,133),(5348,8,134),(5349,8,135),(5350,8,136),(5351,8,137),(5352,8,138),(5353,8,139),(5354,8,140),(5355,8,141),(5356,8,142),(5357,8,143),(5358,8,144),(5359,8,145),(5360,8,146),(5361,8,147),(5362,8,148),(5363,8,149),(5364,8,150),(5365,8,151),(5366,8,152),(5367,8,153),(5368,8,154),(5369,8,155),(5370,8,156),(5371,8,157),(5372,8,158),(5373,8,159),(5374,8,160),(5375,8,161),(5376,8,162),(5377,8,163),(5378,8,164),(5379,8,165),(5380,8,166),(5381,8,167),(5382,8,168),(5383,8,169),(5384,8,170),(5385,8,171),(5386,8,172),(5387,8,173),(5388,8,174),(5389,8,175),(5390,8,176),(5391,8,177),(5392,8,178),(5393,8,179),(5394,8,180),(5395,8,181),(5396,8,182),(5397,8,183),(5398,8,184),(5399,8,185),(5400,8,186),(5401,8,187),(5402,8,188),(5403,8,189),(5404,8,190),(5405,8,191),(5406,8,192),(5407,8,193),(5408,8,194),(5409,8,195),(5410,8,196),(5411,8,197),(5412,8,198),(5413,8,199),(5414,8,200),(5415,8,201),(5416,8,202),(5417,8,203),(5418,8,204),(5419,8,205),(5420,8,206),(5421,8,207),(5422,8,208),(5423,8,209),(5424,8,210),(5425,8,211),(5426,8,212),(5427,8,213),(5428,8,214),(5429,8,215),(5430,8,216),(5431,8,217),(5432,8,218),(5433,8,219),(5434,8,220),(5435,8,221),(5436,8,222),(5437,8,223),(5438,8,224),(5439,8,225),(5440,8,226),(5441,8,227),(5442,8,228),(5443,8,229),(5444,8,230),(5445,8,231),(5446,8,232),(5447,8,233),(5448,8,234),(5449,8,235),(5450,8,236),(5451,8,237),(5452,8,238),(5453,8,239),(5454,8,240),(5455,8,241),(5456,8,242),(5457,8,243),(5458,8,244),(5459,8,245),(5460,8,246),(5461,8,247),(5462,8,248),(5463,8,249),(5464,8,250),(5465,8,251),(5466,8,252),(5467,8,253),(5468,8,254),(5469,8,255),(5470,8,256),(5471,8,257),(5472,8,258),(5473,8,259),(5474,8,260),(5475,8,261),(5476,8,262),(5477,8,263),(5478,8,264),(5479,8,265),(5480,8,266),(5481,8,267),(5482,8,268),(5483,8,269),(5484,8,270),(5485,8,271),(5486,8,272),(5487,8,273),(5488,8,274),(5489,8,275),(5490,8,276),(5491,8,277),(5492,8,278),(5493,8,279),(5494,8,280),(5495,8,281),(5496,8,282),(5497,8,283),(5498,8,284),(5499,8,285),(5500,8,286),(5501,8,287),(5502,8,288),(5503,8,289),(5504,8,290),(5505,8,291),(5506,8,292),(5507,8,293),(5508,8,294),(5509,8,295),(5510,8,296),(5511,8,297),(5512,8,298),(5513,8,299),(5514,8,300),(5515,8,301),(5516,8,302),(5517,8,303),(5518,8,304),(5519,8,305),(5520,8,306),(5521,8,307),(5522,8,308),(5523,8,309),(5524,8,310),(5525,8,311),(5526,8,312),(5527,8,313),(5528,8,314),(5529,8,315),(5530,8,316),(5531,8,317),(5532,8,318),(5533,8,319),(5534,8,320),(5535,8,321),(5536,8,322),(5537,8,323),(5538,8,324),(5539,8,325),(5540,8,326),(5541,8,327),(5542,8,328),(3506,10,1),(3507,10,2),(3508,10,3),(3509,10,4),(3510,10,5),(3511,10,6),(3512,10,7),(3513,10,8),(3514,10,9),(3515,10,10),(3516,10,11),(3517,10,12),(3518,10,13),(3519,10,14),(3520,10,15),(3521,10,16),(3522,10,17),(3523,10,18),(3524,10,19),(3525,10,20),(3526,10,21),(3527,10,22),(3528,10,23),(3529,10,24),(3530,10,25),(3531,10,26),(3532,10,27),(3533,10,28),(3534,10,29),(3535,10,30),(3536,10,31),(3537,10,32),(3538,10,33),(3539,10,34),(3540,10,35),(3541,10,36),(3542,10,37),(3543,10,38),(3544,10,39),(3545,10,40),(3546,10,41),(3547,10,42),(3548,10,43),(3549,10,44),(3550,10,45),(3551,10,46),(3552,10,47),(3553,10,48),(3554,10,49),(3555,10,50),(3556,10,51),(3557,10,55),(3558,10,56),(3559,10,57),(3560,10,58),(3561,10,59),(3562,10,60),(3563,10,61),(3564,10,62),(3565,10,63),(3566,10,64),(3567,10,65),(3568,10,66),(3569,10,67),(3570,10,68),(3571,10,69),(3572,10,70),(3573,10,71),(3574,10,72),(3575,10,73),(3576,10,74),(3577,10,75),(3578,10,76),(3579,10,77),(3580,10,78),(3581,10,79),(3582,10,80),(3583,10,81),(3584,10,82),(3585,10,83),(3586,10,84),(3587,10,85),(3588,10,86),(3589,10,87),(3590,10,88),(3591,10,89),(3592,10,90),(3593,10,91),(3594,10,92),(3595,10,93),(3596,10,94),(3597,10,95),(3598,10,96),(3599,10,97),(3600,10,98),(3601,10,99),(3602,10,100),(3603,10,101),(3604,10,102),(3605,10,103),(3606,10,104),(3607,10,105),(3608,10,106),(3609,10,107),(3610,10,108),(3611,10,109),(3612,10,110),(3613,10,111),(3614,10,112),(3615,10,113),(3616,10,114),(3617,10,115),(3618,10,116),(3619,10,117),(3620,10,118),(3621,10,119),(3622,10,120),(3623,10,121),(3624,10,122),(3625,10,123),(3626,10,124),(3627,10,125),(3628,10,126),(3629,10,127),(3630,10,128),(3631,10,129),(3632,10,130),(3633,10,131),(3634,10,132),(3635,10,133),(3636,10,134),(3637,10,135),(3638,10,136),(3639,10,137),(3640,10,138),(3641,10,139),(3642,10,140),(3643,10,141),(3644,10,142),(3645,10,143),(3646,10,144),(3647,10,145),(3648,10,146),(3649,10,147),(3650,10,148),(3651,10,149),(3652,10,150),(3653,10,151),(3654,10,152),(3655,10,153),(3656,10,154),(3657,10,155),(3658,10,156),(3659,10,157),(3660,10,158),(3661,10,159),(3662,10,160),(3663,10,161),(3664,10,162),(3665,10,163),(3666,10,164),(3667,10,165),(3668,10,166),(3669,10,167),(3670,10,168),(3671,10,169),(3672,10,170),(3673,10,171),(3674,10,172),(3675,10,173),(3676,10,174),(3677,10,175),(3678,10,176),(3679,10,177),(3680,10,178),(3681,10,179),(3682,10,180),(3683,10,181),(3684,10,182),(3685,10,183),(3686,10,184),(3687,10,185),(3688,10,186),(3689,10,187),(3690,10,188),(3691,10,189),(3692,10,190),(3693,10,191),(3694,10,192),(3695,10,193),(3696,10,194),(3697,10,195),(3698,10,196),(3699,10,197),(3700,10,198),(3701,10,199),(3702,10,200),(3703,10,201),(3704,10,202),(3705,10,203),(3706,10,204),(3707,10,205),(3708,10,206),(3709,10,207),(3710,10,208),(3711,10,209),(3712,10,210),(3713,10,211),(3714,10,212),(3715,10,213),(3716,10,214),(3717,10,215),(3718,10,216),(3719,10,217),(3720,10,218),(3721,10,219),(3722,10,220),(3723,10,221),(3724,10,222),(3725,10,223),(3726,10,224),(3727,10,225),(3728,10,226),(3729,10,227),(3730,10,228),(3731,10,229),(3732,10,230),(3733,10,231),(3734,10,232),(3735,10,233),(3736,10,234),(3737,10,235),(3738,10,236),(3739,10,237),(3740,10,238),(3741,10,239),(3742,10,240),(3743,10,241),(3744,10,242),(3745,10,243),(3746,10,244),(3747,10,245),(3748,10,246),(3749,10,247),(3750,10,248),(3751,10,249),(3752,10,250),(3753,10,251),(3754,10,252),(3755,10,253),(3756,10,254),(3757,10,255),(3758,10,256),(3759,10,257),(3760,10,258),(3761,10,259),(3762,10,260),(3763,10,261),(3764,10,262),(3765,10,263),(3766,10,264),(3767,10,265),(3768,10,266),(3769,10,267),(3770,10,268),(3771,10,269),(3772,10,270),(3773,10,271),(3774,10,272),(3775,10,273),(3776,10,274),(3777,10,275),(3778,10,276),(3779,10,277),(3780,10,278),(3781,10,279),(3782,10,280),(3783,10,281),(3784,10,282),(3785,10,283),(3786,10,284),(3787,10,285),(3788,10,286),(3789,10,287),(3790,10,288),(3791,10,289),(3792,10,290),(3793,10,291),(3794,10,292),(3795,10,293),(3796,10,294),(3797,10,295),(3798,10,296),(3799,10,297),(3800,10,298),(3801,10,299),(3802,10,300),(3803,10,301),(3804,10,302),(3805,10,303),(3806,10,304),(3807,10,305),(3808,10,306),(3809,10,307),(3810,10,308),(3811,10,309),(3812,10,310),(3813,10,311),(3814,10,312),(3815,10,313),(3816,10,314),(3817,10,315),(3818,10,316),(3819,10,317),(3820,10,318),(3821,10,319),(3822,10,320),(3823,10,321),(3824,10,322),(3825,10,323),(3826,10,324),(3827,10,325),(3828,10,326),(3829,10,327),(3830,10,328),(7874,11,1),(7875,11,4),(7876,11,5),(7877,11,6),(7878,11,10),(7879,11,11),(7880,11,12),(7881,11,13),(7882,11,14),(7883,11,15),(7884,11,16),(7885,11,17),(7886,11,18),(7887,11,19),(7888,11,20),(7889,11,21),(7890,11,23),(7891,11,25),(7892,11,26),(7893,11,27),(7894,11,28),(7895,11,29),(7896,11,30),(7897,11,31),(7898,11,32),(7899,11,33),(7900,11,34),(7901,11,35),(7902,11,36),(7903,11,37),(7904,11,38),(7905,11,39),(7906,11,40),(7907,11,41),(7908,11,42),(7909,11,43),(7910,11,44),(7911,11,45),(7912,11,46),(7913,11,47),(7914,11,48),(7915,11,49),(7916,11,50),(7917,11,52),(7918,11,53),(7919,11,55),(7920,11,56),(7921,11,57),(7922,11,58),(7923,11,59),(7924,11,61),(7925,11,63),(7926,11,64),(7927,11,65),(7928,11,66),(7929,11,67),(7930,11,68),(7931,11,69),(7932,11,70),(7933,11,71),(7934,11,72),(7935,11,73),(7936,11,74),(7937,11,75),(7938,11,76),(7939,11,77),(7940,11,78),(7941,11,79),(7942,11,80),(7943,11,81),(7944,11,82),(7945,11,83),(7946,11,84),(7947,11,85),(7948,11,86),(7949,11,87),(7950,11,88),(7951,11,89),(7952,11,90),(7953,11,91),(7954,11,92),(7955,11,93),(7956,11,94),(7957,11,95),(7958,11,96),(7959,11,97),(7960,11,98),(7961,11,99),(7962,11,100),(7963,11,101),(7964,11,102),(7965,11,103),(7966,11,104),(7967,11,105),(7968,11,106),(7969,11,107),(7970,11,108),(7971,11,109),(7972,11,110),(7973,11,111),(7974,11,112),(7975,11,113),(7976,11,114),(7977,11,115),(7978,11,116),(7979,11,117),(7980,11,118),(7981,11,119),(7982,11,120),(7983,11,121),(7984,11,122),(7985,11,123),(7986,11,124),(7987,11,125),(7988,11,126),(7989,11,130),(7990,11,131),(7991,11,132),(7992,11,133),(7993,11,134),(7994,11,136),(7995,11,137),(7996,11,138),(7997,11,139),(7998,11,140),(7999,11,141),(8000,11,142),(8001,11,143),(8002,11,144),(8003,11,145),(8004,11,146),(8005,11,147),(8006,11,148),(8007,11,149),(8008,11,150),(8009,11,151),(8010,11,152),(8011,11,154),(8012,11,155),(8013,11,156),(8014,11,157),(8015,11,158),(8016,11,159),(8017,11,160),(8018,11,161),(8019,11,162),(8020,11,163),(8021,11,164),(8022,11,165),(8023,11,166),(8024,11,167),(8025,11,168),(8026,11,169),(8027,11,170),(8028,11,171),(8029,11,172),(8030,11,173),(8031,11,174),(8032,11,175),(8033,11,176),(8034,11,177),(8035,11,178),(8036,11,179),(8037,11,180),(8038,11,181),(8039,11,182),(8040,11,183),(8041,11,184),(8042,11,185),(8043,11,186),(8044,11,187),(8045,11,188),(8046,11,189),(8047,11,190),(8048,11,191),(8049,11,192),(8050,11,193),(8051,11,194),(8052,11,195),(8053,11,196),(8054,11,197),(8055,11,198),(8056,11,199),(8057,11,200),(8058,11,201),(8059,11,202),(8060,11,203),(8061,11,204),(8062,11,205),(8063,11,206),(8064,11,207),(8065,11,208),(8066,11,209),(8067,11,210),(8068,11,211),(8069,11,212),(8070,11,213),(8071,11,214),(8072,11,215),(8073,11,216),(8074,11,217),(8075,11,218),(8076,11,219),(8077,11,220),(8078,11,221),(8079,11,222),(8080,11,223),(8081,11,224),(8082,11,225),(8083,11,226),(8084,11,227),(8085,11,228),(8086,11,229),(8087,11,230),(8088,11,231),(8089,11,232),(8090,11,233),(8091,11,234),(8092,11,235),(8093,11,236),(8094,11,237),(8095,11,238),(8096,11,239),(8097,11,240),(8098,11,241),(8099,11,242),(8100,11,243),(8101,11,244),(8102,11,245),(8103,11,246),(8104,11,247),(8105,11,248),(8106,11,249),(8107,11,250),(8108,11,251),(8109,11,252),(8110,11,253),(8111,11,254),(8112,11,255),(8113,11,256),(8114,11,257),(8115,11,258),(8116,11,259),(8117,11,260),(8118,11,261),(8119,11,262),(8120,11,263),(8121,11,264),(8122,11,265),(8123,11,266),(8124,11,267),(8125,11,268),(8126,11,269),(8127,11,270),(8128,11,271),(8129,11,272),(8130,11,273),(8131,11,274),(8132,11,275),(8133,11,276),(8134,11,277),(8135,11,278),(8136,11,279),(8137,11,280),(8138,11,281),(8139,11,282),(8140,11,283),(8141,11,284),(8142,11,285),(8143,11,286),(8144,11,287),(8145,11,288),(8146,11,289),(8147,11,290),(8148,11,291),(8149,11,292),(8150,11,293),(8151,11,294),(8152,11,295),(8153,11,296),(8154,11,297),(8155,11,298),(8156,11,299),(8157,11,300),(8158,11,301),(8159,11,302),(8160,11,303),(8161,11,304),(8162,11,305),(8163,11,306),(8164,11,307),(8165,11,308),(8166,11,309),(8167,11,310),(8168,11,311),(8169,11,312),(8170,11,313),(8171,11,314),(8172,11,315),(8173,11,316),(8174,11,317),(8175,11,318),(8176,11,319),(8177,11,320),(8178,11,321),(8179,11,322),(8180,11,323),(8181,11,324),(8182,11,325),(8183,11,326),(8184,11,327),(8185,11,328),(7201,14,1),(7202,14,2),(7203,14,3),(7204,14,4),(7205,14,5),(7206,14,6),(7207,14,7),(7208,14,8),(7209,14,9),(7210,14,10),(7211,14,11),(7212,14,12),(7213,14,13),(7214,14,14),(7215,14,15),(7216,14,16),(7217,14,17),(7218,14,18),(7219,14,19),(7220,14,20),(7221,14,21),(7222,14,22),(7223,14,23),(7224,14,24),(7225,14,25),(7226,14,26),(7227,14,27),(7228,14,28),(7229,14,29),(7230,14,30),(7231,14,31),(7232,14,32),(7233,14,33),(7234,14,34),(7235,14,35),(7236,14,36),(7237,14,37),(7238,14,38),(7239,14,39),(7240,14,40),(7241,14,41),(7242,14,42),(7243,14,43),(7244,14,44),(7245,14,45),(7246,14,46),(7247,14,47),(7248,14,48),(7249,14,49),(7250,14,50),(7251,14,51),(7252,14,52),(7253,14,53),(7254,14,54),(7255,14,55),(7256,14,56),(7257,14,57),(7258,14,58),(7259,14,59),(7260,14,60),(7261,14,61),(7262,14,62),(7263,14,63),(7264,14,64),(7265,14,65),(7266,14,66),(7267,14,67),(7268,14,68),(7269,14,69),(7270,14,70),(7271,14,71),(7272,14,72),(7273,14,73),(7274,14,74),(7275,14,75),(7276,14,76),(7277,14,77),(7278,14,78),(7279,14,79),(7280,14,80),(7281,14,81),(7282,14,82),(7283,14,83),(7284,14,84),(7285,14,85),(7286,14,86),(7287,14,87),(7288,14,88),(7289,14,89),(7290,14,90),(7291,14,91),(7292,14,92),(7293,14,93),(7294,14,94),(7295,14,95),(7296,14,96),(7297,14,97),(7298,14,98),(7299,14,99),(7300,14,100),(7301,14,101),(7302,14,102),(7303,14,103),(7304,14,104),(7305,14,105),(7306,14,106),(7307,14,107),(7308,14,108),(7309,14,109),(7310,14,110),(7311,14,111),(7312,14,112),(7313,14,113),(7314,14,114),(7315,14,115),(7316,14,116),(7317,14,117),(7318,14,118),(7319,14,119),(7320,14,120),(7321,14,121),(7322,14,122),(7323,14,123),(7324,14,124),(7325,14,125),(7326,14,126),(7327,14,127),(7328,14,128),(7329,14,129),(7330,14,130),(7331,14,131),(7332,14,132),(7333,14,133),(7334,14,134),(7335,14,135),(7336,14,136),(7337,14,137),(7338,14,138),(7339,14,139),(7340,14,140),(7341,14,141),(7342,14,142),(7343,14,143),(7344,14,144),(7345,14,145),(7346,14,146),(7347,14,147),(7348,14,148),(7349,14,149),(7350,14,150),(7351,14,151),(7352,14,152),(7353,14,153),(7354,14,154),(7355,14,155),(7356,14,156),(7357,14,157),(7358,14,158),(7359,14,159),(7360,14,160),(7361,14,161),(7362,14,162),(7363,14,163),(7364,14,164),(7365,14,165),(7366,14,166),(7367,14,167),(7368,14,168),(7369,14,169),(7370,14,170),(7371,14,171),(7372,14,172),(7373,14,173),(7374,14,174),(7375,14,175),(7376,14,176),(7377,14,177),(7378,14,178),(7379,14,179),(7380,14,180),(7381,14,181),(7382,14,182),(7383,14,183),(7384,14,184),(7385,14,185),(7386,14,186),(7387,14,187),(7388,14,188),(7389,14,189),(7390,14,190),(7391,14,191),(7392,14,192),(7393,14,193),(7394,14,194),(7395,14,195),(7396,14,196),(7397,14,197),(7398,14,198),(7399,14,199),(7400,14,200),(7401,14,201),(7402,14,202),(7403,14,203),(7404,14,204),(7405,14,205),(7406,14,206),(7407,14,207),(7408,14,208),(7409,14,209),(7410,14,210),(7411,14,211),(7412,14,212),(7413,14,213),(7414,14,214),(7415,14,215),(7416,14,216),(7417,14,217),(7418,14,218),(7419,14,219),(7420,14,220),(7421,14,221),(7422,14,222),(7423,14,223),(7424,14,224),(7425,14,225),(7426,14,226),(7427,14,227),(7428,14,228),(7429,14,229),(7430,14,230),(7431,14,231),(7432,14,232),(7433,14,233),(7434,14,234),(7435,14,235),(7436,14,236),(7437,14,237),(7438,14,238),(7439,14,239),(7440,14,240),(7441,14,241),(7442,14,242),(7443,14,243),(7444,14,244),(7445,14,245),(7446,14,246),(7447,14,247),(7448,14,248),(7449,14,249),(7450,14,250),(7451,14,251),(7452,14,252),(7453,14,253),(7454,14,254),(7455,14,255),(7456,14,256),(7457,14,257),(7458,14,258),(7459,14,259),(7460,14,260),(7461,14,261),(7462,14,262),(7463,14,263),(7464,14,264),(7465,14,265),(7466,14,266),(7467,14,267),(7468,14,268),(7469,14,269),(7470,14,270),(7471,14,271),(7472,14,272),(7473,14,273),(7474,14,274),(7475,14,275),(7476,14,276),(7477,14,277),(7478,14,278),(7479,14,279),(7480,14,280),(7481,14,281),(7482,14,282),(7483,14,283),(7484,14,284),(7485,14,285),(7486,14,286),(7487,14,287),(7488,14,288),(7489,14,289),(7490,14,290),(7491,14,291),(7492,14,292),(7493,14,293),(7494,14,294),(7495,14,295),(7496,14,296),(7497,14,297),(7498,14,298),(7499,14,299),(7500,14,300),(7501,14,301),(7502,14,302),(7503,14,303),(7504,14,304),(7505,14,305),(7506,14,306),(7507,14,307),(7508,14,308),(7509,14,309),(7510,14,310),(7511,14,311),(7512,14,312),(7513,14,313),(7514,14,314),(7515,14,315),(7516,14,316),(7517,14,317),(7518,14,318),(7519,14,319),(7520,14,320),(7521,14,321),(7522,14,322),(7523,14,323),(7524,14,324),(7525,14,325),(7526,14,326),(7527,14,327),(7528,14,328),(7529,14,332),(7530,14,333),(7531,14,334),(7532,14,335),(7533,14,336),(7534,14,337),(7535,14,338),(7536,14,339),(7537,14,340),(7538,14,341),(7539,14,342),(7540,14,343),(7541,14,344),(7542,14,345),(7543,14,346),(7544,14,347),(7545,14,348),(7546,14,349),(7547,14,350),(7548,14,351),(7549,14,352),(7550,14,353),(7551,14,354),(7552,14,355),(7553,14,356),(7554,14,357),(7555,14,358),(7556,14,359),(7557,14,360),(7558,14,361),(7559,14,362),(7560,14,363),(7561,14,364),(8550,17,1),(8551,17,2),(8552,17,3),(8553,17,4),(8554,17,5),(8555,17,6),(8556,17,7),(8557,17,8),(8558,17,9),(8559,17,10),(8560,17,11),(8561,17,12),(8562,17,13),(8563,17,14),(8564,17,15),(8565,17,16),(8566,17,17),(8567,17,18),(8568,17,19),(8569,17,20),(8570,17,21),(8571,17,22),(8572,17,23),(8573,17,24),(8574,17,25),(8575,17,26),(8576,17,27),(8577,17,28),(8578,17,29),(8579,17,30),(8580,17,31),(8581,17,32),(8582,17,33),(8583,17,34),(8584,17,35),(8585,17,36),(8586,17,37),(8587,17,38),(8588,17,39),(8589,17,40),(8590,17,41),(8591,17,42),(8592,17,43),(8593,17,44),(8594,17,45),(8595,17,46),(8596,17,47),(8597,17,48),(8598,17,49),(8599,17,50),(8600,17,51),(8601,17,52),(8602,17,53),(8603,17,54),(8604,17,55),(8605,17,56),(8606,17,57),(8607,17,58),(8608,17,59),(8609,17,60),(8610,17,61),(8611,17,62),(8612,17,63),(8613,17,64),(8614,17,65),(8615,17,66),(8616,17,67),(8617,17,68),(8618,17,69),(8619,17,70),(8620,17,71),(8621,17,72),(8622,17,73),(8623,17,74),(8624,17,75),(8625,17,76),(8626,17,77),(8627,17,78),(8628,17,79),(8629,17,80),(8630,17,81),(8631,17,82),(8632,17,83),(8633,17,84),(8634,17,85),(8635,17,86),(8636,17,87),(8637,17,88),(8638,17,89),(8639,17,90),(8640,17,91),(8641,17,92),(8642,17,93),(8643,17,94),(8644,17,95),(8645,17,96),(8646,17,97),(8647,17,98),(8648,17,99),(8649,17,100),(8650,17,101),(8651,17,102),(8652,17,103),(8653,17,104),(8654,17,105),(8655,17,106),(8656,17,107),(8657,17,108),(8658,17,109),(8659,17,110),(8660,17,111),(8661,17,112),(8662,17,113),(8663,17,114),(8664,17,115),(8665,17,116),(8666,17,117),(8667,17,118),(8668,17,119),(8669,17,120),(8670,17,121),(8671,17,122),(8672,17,123),(8673,17,124),(8674,17,125),(8675,17,126),(8676,17,127),(8677,17,128),(8678,17,129),(8679,17,130),(8680,17,131),(8681,17,132),(8682,17,133),(8683,17,134),(8684,17,135),(8685,17,136),(8686,17,137),(8687,17,138),(8688,17,139),(8689,17,140),(8690,17,141),(8691,17,142),(8692,17,143),(8693,17,144),(8694,17,145),(8695,17,146),(8696,17,147),(8697,17,148),(8698,17,149),(8699,17,150),(8700,17,151),(8701,17,152),(8702,17,153),(8703,17,154),(8704,17,155),(8705,17,156),(8706,17,157),(8707,17,158),(8708,17,159),(8709,17,160),(8710,17,161),(8711,17,162),(8712,17,163),(8713,17,164),(8714,17,165),(8715,17,166),(8716,17,167),(8717,17,168),(8718,17,169),(8719,17,170),(8720,17,171),(8721,17,172),(8722,17,173),(8723,17,174),(8724,17,175),(8725,17,176),(8726,17,177),(8727,17,178),(8728,17,179),(8729,17,180),(8730,17,181),(8731,17,182),(8732,17,183),(8733,17,184),(8734,17,185),(8735,17,186),(8736,17,187),(8737,17,188),(8738,17,189),(8739,17,190),(8740,17,191),(8741,17,192),(8742,17,193),(8743,17,194),(8744,17,195),(8745,17,196),(8746,17,197),(8747,17,198),(8748,17,199),(8749,17,200),(8750,17,201),(8751,17,202),(8752,17,203),(8753,17,204),(8754,17,205),(8755,17,206),(8756,17,207),(8757,17,208),(8758,17,209),(8759,17,210),(8760,17,211),(8761,17,212),(8762,17,213),(8763,17,214),(8764,17,215),(8765,17,216),(8766,17,217),(8767,17,218),(8768,17,219),(8769,17,220),(8770,17,221),(8771,17,222),(8772,17,223),(8773,17,224),(8774,17,225),(8775,17,226),(8776,17,227),(8777,17,228),(8778,17,229),(8779,17,230),(8780,17,231),(8781,17,232),(8782,17,233),(8783,17,234),(8784,17,235),(8785,17,236),(8786,17,237),(8787,17,238),(8788,17,239),(8789,17,240),(8790,17,241),(8791,17,242),(8792,17,243),(8793,17,244),(8794,17,245),(8795,17,246),(8796,17,247),(8797,17,248),(8798,17,249),(8799,17,250),(8800,17,251),(8801,17,252),(8802,17,253),(8803,17,254),(8804,17,255),(8805,17,256),(8806,17,257),(8807,17,258),(8808,17,259),(8809,17,260),(8810,17,261),(8811,17,262),(8812,17,263),(8813,17,264),(8814,17,265),(8815,17,266),(8816,17,267),(8817,17,268),(8818,17,269),(8819,17,270),(8820,17,271),(8821,17,272),(8822,17,273),(8823,17,274),(8824,17,275),(8825,17,276),(8826,17,277),(8827,17,278),(8828,17,279),(8829,17,280),(8830,17,281),(8831,17,282),(8832,17,283),(8833,17,284),(8834,17,285),(8835,17,286),(8836,17,287),(8837,17,288),(8838,17,289),(8839,17,290),(8840,17,291),(8841,17,292),(8842,17,293),(8843,17,294),(8844,17,295),(8845,17,296),(8846,17,297),(8847,17,298),(8848,17,299),(8849,17,300),(8850,17,301),(8851,17,302),(8852,17,303),(8853,17,304),(8854,17,305),(8855,17,306),(8856,17,307),(8857,17,308),(8858,17,309),(8859,17,310),(8860,17,311),(8861,17,312),(8862,17,313),(8863,17,314),(8864,17,315),(8865,17,316),(8866,17,317),(8867,17,318),(8868,17,319),(8869,17,320),(8870,17,321),(8871,17,322),(8872,17,323),(8873,17,324),(8874,17,325),(8875,17,326),(8876,17,327),(8877,17,328),(8878,17,332),(8879,17,333),(8880,17,334),(8881,17,335),(8882,17,336),(8883,17,337),(8884,17,338),(8885,17,339),(8886,17,340),(8887,17,341),(8888,17,342),(8889,17,343),(8890,17,344),(8891,17,345),(8892,17,346),(8893,17,347),(8894,17,348),(8895,17,349),(8896,17,350),(8897,17,351),(8898,17,352),(8899,17,353),(8900,17,354),(8901,17,355),(8902,17,356),(8903,17,357),(8904,17,358),(8905,17,359),(8906,17,360),(8907,17,361),(8908,17,362),(8909,17,363),(8910,17,364),(8911,17,365),(8912,17,366),(8913,17,367);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basket`
--

DROP TABLE IF EXISTS `basket_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `status` varchar(128) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_merged` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_basket_5d52dd10` (`owner_id`),
  CONSTRAINT `owner_id_refs_id_606b1d81d48428a` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basket`
--

LOCK TABLES `basket_basket` WRITE;
/*!40000 ALTER TABLE `basket_basket` DISABLE KEYS */;
INSERT INTO `basket_basket` VALUES (1,1,'Submitted','2013-05-08 14:28:37',NULL,'2013-08-05 14:20:57'),(3,4,'Submitted','2013-05-20 17:34:34',NULL,'2013-08-05 14:29:29'),(6,NULL,'Merged','2013-05-25 07:07:07','2013-05-25 07:08:09',NULL),(8,8,'Open','2013-05-25 07:20:27',NULL,NULL),(10,10,'Open','2013-06-04 19:51:20',NULL,NULL),(11,11,'Submitted','2013-06-25 20:41:34',NULL,'2013-08-03 13:57:28'),(13,11,'Open','2013-08-03 13:57:28',NULL,NULL),(14,1,'Open','2013-08-05 14:20:57',NULL,NULL),(15,4,'Open','2013-08-05 14:29:30',NULL,NULL),(16,NULL,'Open','2013-08-11 19:44:46',NULL,NULL),(17,14,'Open','2013-08-12 19:22:53',NULL,NULL),(20,17,'Open','2013-08-23 15:11:35',NULL,NULL);
/*!40000 ALTER TABLE `basket_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basket_vouchers`
--

DROP TABLE IF EXISTS `basket_basket_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basket_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_basket_vouchers_basket_id_42d9f11e1a94f93a_uniq` (`basket_id`,`voucher_id`),
  KEY `basket_basket_vouchers_7e9d6c10` (`basket_id`),
  KEY `basket_basket_vouchers_7a302bdb` (`voucher_id`),
  CONSTRAINT `basket_id_refs_id_68df49e622deaf04` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `voucher_id_refs_id_265f4531c5be385c` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basket_vouchers`
--

LOCK TABLES `basket_basket_vouchers` WRITE;
/*!40000 ALTER TABLE `basket_basket_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_basket_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_line`
--

DROP TABLE IF EXISTS `basket_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) NOT NULL,
  `line_reference` varchar(128) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `price_incl_tax` decimal(12,2) DEFAULT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `stockrecord_source` varchar(30) NOT NULL,
  `items_required` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_line_basket_id_7d0d707a7fd92c45_uniq` (`basket_id`,`line_reference`),
  KEY `basket_line_7e9d6c10` (`basket_id`),
  KEY `basket_line_1a33377f` (`line_reference`),
  KEY `basket_line_bb420c12` (`product_id`),
  CONSTRAINT `basket_id_refs_id_6c25b1c2b38e16cd` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `product_id_refs_id_258face575c99eb7` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_line`
--

LOCK TABLES `basket_line` WRITE;
/*!40000 ALTER TABLE `basket_line` DISABLE KEYS */;
INSERT INTO `basket_line` VALUES (51,14,'d5835c0e0e7b11e38362123142ff3471',17,1,'2013-08-26 18:17:57',22.00,NULL,'optionscalc',300),(52,10,'118b03aa0e7c11e38362123142ff3471',17,1,'2013-08-26 18:19:38',12.00,NULL,'optionscalc',30),(53,14,'316e7b680fc911e3978e123142ff3471',79,34,'2013-08-28 10:04:14',2.00,NULL,'optionscalc',1000);
/*!40000 ALTER TABLE `basket_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_lineattachment`
--

DROP TABLE IF EXISTS `basket_lineattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_lineattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  `artwork_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_lineattachment_line_id_63442ea9867230b3_uniq` (`line_id`,`artwork_item_id`),
  KEY `basket_lineattachment_92b3444a` (`line_id`),
  KEY `basket_lineattachment_7963df22` (`artwork_item_id`),
  CONSTRAINT `artwork_item_id_refs_id_59811f7905f1d2d9` FOREIGN KEY (`artwork_item_id`) REFERENCES `options_artworkitem` (`id`),
  CONSTRAINT `line_id_refs_id_ead78b04769686e` FOREIGN KEY (`line_id`) REFERENCES `basket_line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_lineattachment`
--

LOCK TABLES `basket_lineattachment` WRITE;
/*!40000 ALTER TABLE `basket_lineattachment` DISABLE KEYS */;
INSERT INTO `basket_lineattachment` VALUES (23,51,14),(24,52,9),(25,52,10),(26,52,11);
/*!40000 ALTER TABLE `basket_lineattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_lineattribute`
--

DROP TABLE IF EXISTS `basket_lineattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_lineattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `value_code` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_lineattribute_92b3444a` (`line_id`),
  KEY `basket_lineattribute_2f3b0dc9` (`option_id`),
  CONSTRAINT `line_id_refs_id_72fc976903a5d486` FOREIGN KEY (`line_id`) REFERENCES `basket_line` (`id`),
  CONSTRAINT `option_id_refs_id_6bccdc7b87752759` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_lineattribute`
--

LOCK TABLES `basket_lineattribute` WRITE;
/*!40000 ALTER TABLE `basket_lineattribute` DISABLE KEYS */;
INSERT INTO `basket_lineattribute` VALUES (234,51,94,'300','','300'),(235,51,80,'corners','{}','corners'),(236,51,77,'none','{}','none'),(237,51,78,'90x55','{\"width\": 0, \"height\": 0}','90x55'),(238,51,79,'recycled','{}','recycled'),(239,51,76,'300','{}','300'),(240,52,94,'30','','30'),(241,52,80,'foil','{}','foil'),(242,52,77,'none','{}','none'),(243,52,78,'90x55','{\"width\": 0, \"height\": 0}','90x55'),(244,52,79,'matt','{}','matt'),(245,52,76,'300','{}','300'),(246,53,94,'30','','30'),(247,53,93,'15','{}','15');
/*!40000 ALTER TABLE `basket_lineattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeentity`
--

DROP TABLE IF EXISTS `catalogue_attributeentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_attributeentity_a951d5d6` (`slug`),
  KEY `catalogue_attributeentity_777d41c8` (`type_id`),
  CONSTRAINT `type_id_refs_id_2c339b53c6b2bf55` FOREIGN KEY (`type_id`) REFERENCES `catalogue_attributeentitytype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeentity`
--

LOCK TABLES `catalogue_attributeentity` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_attributeentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeentitytype`
--

DROP TABLE IF EXISTS `catalogue_attributeentitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeentitytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_attributeentitytype_a951d5d6` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeentitytype`
--

LOCK TABLES `catalogue_attributeentitytype` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeentitytype` DISABLE KEYS */;
INSERT INTO `catalogue_attributeentitytype` VALUES (1,'Product Options','product-options'),(2,'Paper Options','paper-options');
/*!40000 ALTER TABLE `catalogue_attributeentitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeoption`
--

DROP TABLE IF EXISTS `catalogue_attributeoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `option` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_attributeoption_bda51c3c` (`group_id`),
  CONSTRAINT `group_id_refs_id_5c565a7c9541f55` FOREIGN KEY (`group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeoption`
--

LOCK TABLES `catalogue_attributeoption` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeoption` DISABLE KEYS */;
INSERT INTO `catalogue_attributeoption` VALUES (1,2,'Portrait'),(2,2,'Landscape'),(3,1,'Custom'),(4,1,'A4'),(5,1,'A3'),(6,3,'190gsm'),(7,4,'Satin'),(8,5,'None'),(9,5,'Gloss'),(10,5,'Matt'),(11,5,'Gloss Encapsulation'),(12,6,'Display Boards'),(13,6,'Posters'),(14,6,'Pavement Signage'),(15,6,'PVC Banners'),(16,6,'Digitally Printed Vinyl'),(17,6,'Window Vinyl'),(18,6,'Exhibition Stands'),(19,6,'Indoor Roller Systems'),(20,6,'Flags Indoor/Outdoor'),(21,6,'Business Stationery');
/*!40000 ALTER TABLE `catalogue_attributeoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeoptiongroup`
--

DROP TABLE IF EXISTS `catalogue_attributeoptiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeoptiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeoptiongroup`
--

LOCK TABLES `catalogue_attributeoptiongroup` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeoptiongroup` DISABLE KEYS */;
INSERT INTO `catalogue_attributeoptiongroup` VALUES (1,'Paper Size'),(2,'Orientation'),(3,'Paper Weight'),(4,'Paper Type'),(5,'Lamination '),(6,'Product Class');
/*!40000 ALTER TABLE `catalogue_attributeoptiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_category`
--

DROP TABLE IF EXISTS `catalogue_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `catalogue_category_52094d6e` (`name`),
  KEY `catalogue_category_a951d5d6` (`slug`),
  KEY `catalogue_category_8b99b45` (`full_name`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_category`
--

LOCK TABLES `catalogue_category` WRITE;
/*!40000 ALTER TABLE `catalogue_category` DISABLE KEYS */;
INSERT INTO `catalogue_category` VALUES (15,'000G',1,9,'Small Format Digital','small-format-digital','Small Format Digital','',''),(16,'000G000K',2,0,'Leaflets','small-format-digital/leaflets','Small Format Digital > Leaflets','',''),(17,'000J',1,5,'Large Format Digital','large-format-digital','Large Format Digital','',''),(18,'000K',1,2,'Exhibition','exhibition','Exhibition','',''),(36,'000J000L',2,0,'Boards','large-format-digital/boards','Large Format Digital > Boards','',''),(41,'000J000G',2,0,'Banners','large-format-digital/banners','Large Format Digital > Banners','',''),(45,'000J000C',2,0,'Promotional','large-format-digital/promotional','Large Format Digital > Promotional','',''),(54,'000J0003',2,0,'Self Adhesive Vinyl','large-format-digital/self-adhesive-vinyl','Large Format Digital > Self Adhesive Vinyl','',''),(56,'000K0005',2,0,'Indoor Roll-up Systems','exhibition/indoor-roll-up-systems','Exhibition > Indoor Roll-up Systems','',''),(57,'000K0004',2,0,'Indoor Pop-Up systems','exhibition/indoor-pop-up-systems','Exhibition > Indoor Pop-Up systems','',''),(62,'000G000L',2,0,'Business Stationery','small-format-digital/business-stationery','Small Format Digital > Business Stationery','',''),(63,'000G000M',2,0,'Stickers / Labels ','small-format-digital/stickers-labels','Small Format Digital > Stickers / Labels ','',''),(64,'000G000N',2,0,'Promotional','small-format-digital/promotional','Small Format Digital > Promotional','',''),(65,'000G000P',2,0,'Brochures','small-format-digital/brochures','Small Format Digital > Brochures','',''),(66,'000G000Q',2,0,'Posters','small-format-digital/posters','Small Format Digital > Posters','',''),(67,'000G000R',2,0,'Wedding Stationery','small-format-digital/wedding-stationery','Small Format Digital > Wedding Stationery','',''),(68,'000G000S',2,0,'Funeral Stationery','small-format-digital/funeral-stationery','Small Format Digital > Funeral Stationery','',''),(69,'000G000T',2,0,'Flat Sheets','small-format-digital/flat-sheets','Small Format Digital > Flat Sheets','',''),(74,'000J0001',2,0,'Posters','large-format-digital/posters','Large Format Digital > Posters','','');
/*!40000 ALTER TABLE `catalogue_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_contributor`
--

DROP TABLE IF EXISTS `catalogue_contributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_contributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_contributor_a951d5d6` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_contributor`
--

LOCK TABLES `catalogue_contributor` WRITE;
/*!40000 ALTER TABLE `catalogue_contributor` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_contributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_contributorrole`
--

DROP TABLE IF EXISTS `catalogue_contributorrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_contributorrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `name_plural` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_contributorrole_a951d5d6` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_contributorrole`
--

LOCK TABLES `catalogue_contributorrole` WRITE;
/*!40000 ALTER TABLE `catalogue_contributorrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_contributorrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_option`
--

DROP TABLE IF EXISTS `catalogue_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_option_code_1687c916225230f1_uniq` (`code`),
  KEY `catalogue_option_65da3d2c` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_option`
--

LOCK TABLES `catalogue_option` WRITE;
/*!40000 ALTER TABLE `catalogue_option` DISABLE KEYS */;
INSERT INTO `catalogue_option` VALUES (76,'weight','weight','Optional'),(77,'fold','fold','Optional'),(78,'size','size','Optional'),(79,'stock','stock','Optional'),(80,'finish','finish','Optional'),(81,'package','package','Optional'),(82,'orientation','orientation','Optional'),(83,'printed','printed','Optional'),(84,'lamination','lamination','Optional'),(85,'options','options','Optional'),(86,'print-stock','print-stock','Optional'),(87,'binding','binding','Optional'),(88,'pages','pages','Optional'),(89,'front-cover','front-cover','Optional'),(90,'back-cover','back-cover','Optional'),(91,'location','location','Optional'),(92,'min_linear_meter','min_linear_meter','Optional'),(93,'diameter','diameter','Optional'),(94,'items_per_pack','items_per_pack','Optional');
/*!40000 ALTER TABLE `catalogue_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product`
--

DROP TABLE IF EXISTS `catalogue_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upc` varchar(64) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext,
  `product_class_id` int(11) DEFAULT NULL,
  `score` double NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` varchar(128) DEFAULT NULL,
  `is_discountable` tinyint(1) NOT NULL,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_product_upc_47091a7974ee95de_uniq` (`upc`),
  KEY `catalogue_product_a7ad2e7a` (`upc`),
  KEY `catalogue_product_63f17a16` (`parent_id`),
  KEY `catalogue_product_a951d5d6` (`slug`),
  KEY `catalogue_product_ee50fea3` (`product_class_id`),
  KEY `catalogue_product_3fa9fe1c` (`score`),
  KEY `catalogue_product_bdd0404b` (`date_updated`),
  KEY `catalogue_product_c9ad71dd` (`status`),
  CONSTRAINT `parent_id_refs_id_6b68f9b554004f89` FOREIGN KEY (`parent_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `product_class_id_refs_id_7f530a175e5d81d0` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product`
--

LOCK TABLES `catalogue_product` WRITE;
/*!40000 ALTER TABLE `catalogue_product` DISABLE KEYS */;
INSERT INTO `catalogue_product` VALUES (15,'000000001',NULL,'ACM','acm','ACM Panel description text',16,0,'2013-06-26 10:59:37','2013-06-26 10:59:37',NULL,1,NULL),(16,'11111111',NULL,'Wiro Bound Booklet','wiro-bound-booklet','Wiro bound booklet description text',16,0,'2013-06-26 17:29:01','2013-06-27 09:48:58','',1,NULL),(17,'121212121212',NULL,'Business Card','business-card','A fabulous business card printed to a range of stocks. \r\nThere is a matt or silk board for the non shiney look, a gloss board for that little bit of reflection and then an eco 100% recycled board, for that slightly rougher to touch feel.',12,0,'2013-06-26 17:32:04','2013-08-20 13:15:38','',1,NULL),(19,'43243546464',NULL,'Simple Product','simple-product','dsafsafdsafasdfdsafsafsa',16,0,'2013-07-24 19:27:04','2013-07-24 20:20:36',NULL,1,NULL),(23,NULL,NULL,'Board','board','',7,0,'2013-08-13 11:25:31','2013-08-13 11:25:44',NULL,1,NULL),(24,NULL,NULL,'Site Board','site-board','',7,0,'2013-08-13 11:26:27','2013-08-13 11:26:27',NULL,1,NULL),(25,NULL,NULL,'Saddle Stitched Booklet','saddle-stitched-booklet','',2,0,'2013-08-13 11:27:53','2013-08-13 11:27:53',NULL,1,NULL),(26,NULL,NULL,'Mars 1','mars-1','',9,0,'2013-08-13 11:30:30','2013-08-13 11:30:30',NULL,1,NULL),(27,NULL,NULL,'Mars 1 Replacement','mars-1-replacement','',9,0,'2013-08-13 11:31:23','2013-08-13 11:31:23',NULL,1,NULL),(28,NULL,NULL,'Replacement Graphic','replacement-graphic','',9,0,'2013-08-13 11:31:53','2013-08-13 11:31:53',NULL,1,NULL),(29,NULL,NULL,'Mars 2','mars-2','',9,0,'2013-08-13 11:32:13','2013-08-13 11:32:13',NULL,1,NULL),(31,NULL,NULL,'Venus','venus','',9,0,'2013-08-13 11:33:02','2013-08-13 11:33:02',NULL,1,NULL),(32,NULL,NULL,'Saturn','saturn','',9,0,'2013-08-13 11:33:38','2013-08-13 11:33:38',NULL,1,NULL),(33,NULL,NULL,'Pluto','pluto','',9,0,'2013-08-13 11:33:55','2013-08-13 11:33:55',NULL,1,NULL),(34,NULL,NULL,'Sprinter','sprinter','',9,0,'2013-08-13 11:34:20','2013-08-13 11:34:20',NULL,1,NULL),(35,NULL,NULL,'Display System','display-system','',9,0,'2013-08-13 11:35:34','2013-08-13 11:35:34',NULL,1,NULL),(36,NULL,NULL,'Replacement Graphics','replacement-graphics','',9,0,'2013-08-13 11:35:57','2013-08-13 11:35:57',NULL,1,NULL),(37,NULL,NULL,'Stand Body Wrap','stand-body-wrap','',9,0,'2013-08-13 11:36:20','2013-08-13 11:36:20',NULL,1,NULL),(38,NULL,NULL,'Hangers & Kickers','hangers-kickers','',9,0,'2013-08-13 11:36:42','2013-08-13 11:36:42',NULL,1,NULL),(39,NULL,NULL,'Hurricane','huricane','',9,0,'2013-08-13 11:37:14','2013-08-13 19:20:05',NULL,1,NULL),(40,NULL,NULL,'Typhoon','typhoon','',9,0,'2013-08-13 11:37:31','2013-08-13 11:37:31',NULL,1,NULL),(41,NULL,NULL,'Cyclone','cyclone','',9,0,'2013-08-13 11:37:42','2013-08-13 11:37:42',NULL,1,NULL),(42,NULL,NULL,'Classic Swing','classic-swing','',16,0,'2013-08-13 11:39:41','2013-08-13 11:39:41',NULL,1,NULL),(43,NULL,NULL,'Switch','switch','',16,0,'2013-08-13 11:39:57','2013-08-13 11:39:57',NULL,1,NULL),(44,NULL,NULL,'Mini','mini','',16,0,'2013-08-13 11:40:14','2013-08-13 11:40:14',NULL,1,NULL),(45,NULL,NULL,'Sign Wedge','sign-wedge','',16,0,'2013-08-13 11:40:26','2013-08-13 11:40:26',NULL,1,NULL),(46,NULL,NULL,'Wooden A-Chalkboard','wooden-a-chalkboard','',16,0,'2013-08-13 11:40:38','2013-08-13 11:40:38',NULL,1,NULL),(47,NULL,NULL,'Contemporary A','contemporary-a','',16,0,'2013-08-13 11:40:52','2013-08-13 11:40:52',NULL,1,NULL),(48,NULL,NULL,'Icon','icon','',16,0,'2013-08-13 11:41:10','2013-08-13 11:41:10',NULL,1,NULL),(49,NULL,NULL,'Swingmaster','swingmaster','',16,0,'2013-08-13 11:41:22','2013-08-13 11:41:22',NULL,1,NULL),(50,NULL,NULL,'Pens for Woodend A','pens-for-woodend-as','',16,0,'2013-08-13 11:41:37','2013-08-13 20:29:37',NULL,1,NULL),(51,NULL,NULL,'Leaflet','leaflet','',4,0,'2013-08-13 11:42:20','2013-08-13 11:42:20',NULL,1,NULL),(52,NULL,NULL,'Poster','poster','',11,0,'2013-08-13 11:44:49','2013-08-13 11:44:49',NULL,1,NULL),(53,NULL,NULL,'Photo Realistic Print','photo-realistic-print','',10,0,'2013-08-13 11:46:19','2013-08-13 11:46:19',NULL,1,NULL),(54,NULL,NULL,'Blue-Back Poster','blue-back-poster','',11,0,'2013-08-13 11:46:57','2013-08-13 11:46:57',NULL,1,NULL),(55,NULL,NULL,'Fine Linen','fine-linen','',11,0,'2013-08-13 11:47:23','2013-08-13 11:47:23',NULL,1,NULL),(56,NULL,NULL,'Tyvek','tyvek','',11,0,'2013-08-13 11:47:40','2013-08-13 11:47:40',NULL,1,NULL),(69,'201317780009',NULL,'Leaflets & flyers','leaflets-flyers','',4,0,'2013-08-20 15:22:11','2013-08-20 15:22:11',NULL,1,NULL),(70,'201317780016',NULL,'Laminated Leaflets & Flyers','laminated-leaflets-flyers','',4,0,'2013-08-20 15:22:35','2013-08-20 15:22:35',NULL,1,NULL),(71,'201317780023',NULL,'Folded leaflets','folded-leaflets','',4,0,'2013-08-20 15:22:56','2013-08-20 15:22:56',NULL,1,NULL),(72,'201317780030',NULL,'Business Cards','business-cards','',8,0,'2013-08-20 15:23:42','2013-08-20 19:32:19',NULL,1,NULL),(73,'201317780047',NULL,'Plastic Cards','premium-business-cards','',8,0,'2013-08-20 15:24:05','2013-08-20 15:55:11',NULL,1,NULL),(74,'201317780054',NULL,'Letterheads','letterheads','',12,0,'2013-08-20 15:24:37','2013-08-20 15:24:37',NULL,1,NULL),(75,'201317780061',NULL,'Compliment Slips','compliment-slips','',8,0,'2013-08-20 15:25:24','2013-08-20 15:25:24',NULL,1,NULL),(76,'201317780078',NULL,'Stationery Saver Packs','stationery-saver-packs','',8,0,'2013-08-20 15:26:02','2013-08-20 15:26:02',NULL,1,NULL),(78,'201317780085',NULL,'Office Print ','office-print','',8,0,'2013-08-20 15:26:22','2013-08-20 15:26:22',NULL,1,NULL),(79,'201317780092',NULL,'Circular on A4 Sheets','circular-on-a4-sheets','',13,0,'2013-08-20 15:26:45','2013-08-20 15:26:45',NULL,1,NULL),(80,'201317780108',NULL,'Square on A4 Sheets','square-on-a4-sheets','',13,0,'2013-08-20 15:27:02','2013-08-20 15:27:02',NULL,1,NULL),(81,'201317780115',NULL,'Rectangular on A4 Sheets','rectangular-on-a4-sheets','',13,0,'2013-08-20 15:27:27','2013-08-20 15:27:27',NULL,1,NULL),(82,'201317780122',NULL,'‘A’ Size Stickers','a-size-stickers','',13,0,'2013-08-20 15:27:50','2013-08-20 15:27:50',NULL,1,NULL),(83,'201317780139',NULL,'Custom Size Stickers','custom-size-stickers','',13,0,'2013-08-20 15:28:08','2013-08-20 15:28:08',NULL,1,NULL),(84,'201317780146',NULL,'Postcards','postcards','',8,0,'2013-08-20 15:28:29','2013-08-20 15:28:29',NULL,1,NULL),(86,'201317780153',NULL,'Luxury Postcards','luxury-postcards','',8,0,'2013-08-20 15:28:47','2013-08-20 15:28:47',NULL,1,NULL),(87,'201317780160',NULL,'Greeting Cards','greeting-cards','',8,0,'2013-08-20 15:29:03','2013-08-20 15:29:03',NULL,1,NULL),(88,'201317780177',NULL,'Envelopes','envelopes','',8,0,'2013-08-20 15:29:23','2013-08-20 15:29:23',NULL,1,NULL),(89,'201317780184',NULL,'Show Cards','show-cards','',8,0,'2013-08-20 15:29:38','2013-08-20 15:29:38',NULL,1,NULL),(90,'201317780191',NULL,'Calendars','calendars','',8,0,'2013-08-20 15:30:00','2013-08-20 15:30:00',NULL,1,NULL),(91,'201317780207',NULL,'Deskpads','deskpads','',8,0,'2013-08-20 15:30:17','2013-08-20 15:30:17',NULL,1,NULL),(92,'201317780214',NULL,'Newsletters','newsletters','',8,0,'2013-08-20 15:30:37','2013-08-20 15:30:37',NULL,1,NULL),(93,'201317780221',NULL,'Invitations','invitations','',8,0,'2013-08-20 15:31:05','2013-08-20 15:31:05',NULL,1,NULL),(95,'201317780238',NULL,'Tickets','tickets','',8,0,'2013-08-20 15:31:37','2013-08-20 15:31:37',NULL,1,NULL),(96,'201317780245',NULL,'Folded Leaflets','folded-leaflets','',8,0,'2013-08-20 15:31:57','2013-08-20 15:31:57',NULL,1,NULL),(97,'201317780252',NULL,'Saddle stitched booklets','saddle-stitched-booklets','',8,0,'2013-08-20 15:32:15','2013-08-20 15:32:15',NULL,1,NULL),(98,'201317780269',NULL,'Wiro bound Documents','wiro-bound-documents','',8,0,'2013-08-20 15:32:33','2013-08-20 15:32:33',NULL,1,NULL),(99,'201317780276',NULL,'A4 Posters','a4-posters','',11,0,'2013-08-20 15:33:03','2013-08-20 15:33:03',NULL,1,NULL),(100,'201317780283',NULL,'A3 Posters ','a3-posters','',11,0,'2013-08-20 15:33:23','2013-08-28 10:38:22',NULL,1,NULL),(101,'201317780290',NULL,'Foamex','foamex','',7,0,'2013-08-20 15:34:05','2013-08-20 15:34:05',NULL,1,NULL),(102,'201317780306',NULL,'Foamcore','foamcore','',7,0,'2013-08-20 15:34:28','2013-08-20 15:34:28',NULL,1,NULL),(103,'201317780313',NULL,'ACM','acm','',7,0,'2013-08-20 15:34:50','2013-08-20 15:34:50',NULL,1,NULL),(104,'201317780320',NULL,'Correx','correx','',7,0,'2013-08-20 15:35:08','2013-08-20 15:35:08',NULL,1,NULL),(105,'201317780337',NULL,'Standard PVC','standard-pvc','',16,0,'2013-08-20 15:36:07','2013-08-20 15:36:07',NULL,1,NULL),(106,'201317780344',NULL,'Mesh PVC','mesh-pvc','',16,0,'2013-08-20 15:36:23','2013-08-20 15:36:23',NULL,1,NULL),(107,'201317780351',NULL,'Fabric Display Polyester','fabric-display-polyester','',16,0,'2013-08-20 15:36:39','2013-08-20 15:36:39',NULL,1,NULL),(108,'201317780368',NULL,'Gallery Framed Canvases','gallery-framed-canvases','',16,0,'2013-08-20 15:37:04','2013-08-20 15:37:04',NULL,1,NULL),(109,'201317780375',NULL,'Digitally Printed Wallpaper','digitally-printed-wallpaper','',16,0,'2013-08-20 15:37:27','2013-08-20 15:37:27',NULL,1,NULL),(110,'201317780382',NULL,'160gsm Matt','160gsm-matt','',11,0,'2013-08-20 15:37:53','2013-08-20 15:37:53',NULL,1,NULL),(111,'201317780399',NULL,'170gsm Matt','170gsm-matt','',11,0,'2013-08-20 15:38:21','2013-08-20 15:38:21',NULL,1,NULL),(112,'201317780405',NULL,'200gsm Satin Photo Paper','200gsm-satin-photo-paper','',11,0,'2013-08-20 15:38:44','2013-08-20 15:38:44',NULL,1,NULL),(113,'201317780412',NULL,'200gsm Gloss Photo Paper','200gsm-gloss-photo-paper','',11,0,'2013-08-20 15:39:04','2013-08-20 15:39:04',NULL,1,NULL),(114,'201317780429',NULL,'260gsm Satin Photo Paper','260gsm-satin-photo-paper','',11,0,'2013-08-20 15:39:27','2013-08-20 15:39:27',NULL,1,NULL),(115,'201317780436',NULL,'260gsm Gloss Photo Paper','260gsm-gloss-photo-paper','',11,0,'2013-08-20 15:39:47','2013-08-20 15:39:47',NULL,1,NULL),(116,'201317780443',NULL,'115gsm Bluebacked','115gsm-bluebacked','',11,0,'2013-08-20 15:40:09','2013-08-20 15:40:09',NULL,1,NULL),(117,'201317780450',NULL,'75gsm Tyvek','75gsm-tyvek','',11,0,'2013-08-20 15:40:24','2013-08-20 15:40:24',NULL,1,NULL),(118,'201317780467',NULL,'110gsm Fine Linen','110gsm-fine-linen','',11,0,'2013-08-20 15:40:40','2013-08-20 15:40:40',NULL,1,NULL),(119,'201317780474',NULL,'200mic Backlit Film','200mic-backlit-film','',11,0,'2013-08-20 15:40:57','2013-08-20 15:40:57',NULL,1,NULL),(120,'201317780481',NULL,'Indoor Roll-up Systems','indoor-roll-up-systems','',9,0,'2013-08-20 15:41:39','2013-08-20 15:41:39',NULL,1,NULL),(121,'201317780498',NULL,'Indoor Pop-Up systems','indoor-pop-up-systems','',9,0,'2013-08-20 15:42:06','2013-08-20 15:42:06',NULL,1,NULL);
/*!40000 ALTER TABLE `catalogue_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product_product_options`
--

DROP TABLE IF EXISTS `catalogue_product_product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product_product_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_product_product_opti_product_id_72c840707f278a98_uniq` (`product_id`,`option_id`),
  KEY `catalogue_product_product_options_bb420c12` (`product_id`),
  KEY `catalogue_product_product_options_2f3b0dc9` (`option_id`),
  CONSTRAINT `option_id_refs_id_6519b7c68094e2a3` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`),
  CONSTRAINT `product_id_refs_id_742a32557edeb694` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product_product_options`
--

LOCK TABLES `catalogue_product_product_options` WRITE;
/*!40000 ALTER TABLE `catalogue_product_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_product_product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product_related_products`
--

DROP TABLE IF EXISTS `catalogue_product_related_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product_related_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_product_id` int(11) NOT NULL,
  `to_product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_product_related_from_product_id_6dc96f22461ac2e7_uniq` (`from_product_id`,`to_product_id`),
  KEY `catalogue_product_related_products_c884f964` (`from_product_id`),
  KEY `catalogue_product_related_products_5bd7a0dd` (`to_product_id`),
  CONSTRAINT `from_product_id_refs_id_7e61993b6e267779` FOREIGN KEY (`from_product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `to_product_id_refs_id_7e61993b6e267779` FOREIGN KEY (`to_product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product_related_products`
--

LOCK TABLES `catalogue_product_related_products` WRITE;
/*!40000 ALTER TABLE `catalogue_product_related_products` DISABLE KEYS */;
INSERT INTO `catalogue_product_related_products` VALUES (9,17,15),(6,24,23),(7,25,16),(8,27,26);
/*!40000 ALTER TABLE `catalogue_product_related_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattribute`
--

DROP TABLE IF EXISTS `catalogue_productattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_class_id` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(20) NOT NULL,
  `option_group_id` int(11) DEFAULT NULL,
  `entity_type_id` int(11) DEFAULT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productattribute_ee50fea3` (`product_class_id`),
  KEY `catalogue_productattribute_65da3d2c` (`code`),
  KEY `catalogue_productattribute_2619a0bd` (`option_group_id`),
  KEY `catalogue_productattribute_299a9dd7` (`entity_type_id`),
  CONSTRAINT `entity_type_id_refs_id_3ebafaae1823dca6` FOREIGN KEY (`entity_type_id`) REFERENCES `catalogue_attributeentitytype` (`id`),
  CONSTRAINT `option_group_id_refs_id_7dd94478231034b8` FOREIGN KEY (`option_group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`),
  CONSTRAINT `product_class_id_refs_id_f86ceb69a0e83f` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattribute`
--

LOCK TABLES `catalogue_productattribute` WRITE;
/*!40000 ALTER TABLE `catalogue_productattribute` DISABLE KEYS */;
INSERT INTO `catalogue_productattribute` VALUES (1,1,'Paper Size','papersize','text',1,1,1),(2,1,'Orientation','orientation','multi_option',2,1,0),(3,1,'Paper Weight','paperweight','multi_option',3,2,0),(4,1,'Paper Type','papertype','multi_option',4,2,0),(5,1,'Lamination ','lamination','text',5,2,0);
/*!40000 ALTER TABLE `catalogue_productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattributevalue`
--

DROP TABLE IF EXISTS `catalogue_productattributevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattributevalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value_text` varchar(255) DEFAULT NULL,
  `value_integer` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_float` double DEFAULT NULL,
  `value_richtext` longtext,
  `value_date` date DEFAULT NULL,
  `value_option_id` int(11) DEFAULT NULL,
  `value_entity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productattributevalue_f2eca69f` (`attribute_id`),
  KEY `catalogue_productattributevalue_bb420c12` (`product_id`),
  KEY `catalogue_productattributevalue_b30b9e13` (`value_option_id`),
  KEY `catalogue_productattributevalue_b1beb8af` (`value_entity_id`),
  CONSTRAINT `attribute_id_refs_id_18ff9b3149e1af6f` FOREIGN KEY (`attribute_id`) REFERENCES `catalogue_productattribute` (`id`),
  CONSTRAINT `product_id_refs_id_20af8418d17731ca` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `value_entity_id_refs_id_516a5aef23964e26` FOREIGN KEY (`value_entity_id`) REFERENCES `catalogue_attributeentity` (`id`),
  CONSTRAINT `value_option_id_refs_id_4014176cac0f16d4` FOREIGN KEY (`value_option_id`) REFERENCES `catalogue_attributeoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattributevalue`
--

LOCK TABLES `catalogue_productattributevalue` WRITE;
/*!40000 ALTER TABLE `catalogue_productattributevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productattributevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productcategory`
--

DROP TABLE IF EXISTS `catalogue_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_canonical` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productcategory_bb420c12` (`product_id`),
  KEY `catalogue_productcategory_42dc49bc` (`category_id`),
  KEY `catalogue_productcategory_5497fa04` (`is_canonical`),
  CONSTRAINT `category_id_refs_id_3a9b0c18213322e9` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `product_id_refs_id_1f6cc3825453006b` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productcategory`
--

LOCK TABLES `catalogue_productcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_productcategory` DISABLE KEYS */;
INSERT INTO `catalogue_productcategory` VALUES (18,19,15,0),(20,23,36,0),(21,24,36,0),(23,26,56,0),(24,27,56,0),(25,28,56,0),(26,29,56,0),(28,31,56,0),(29,32,56,0),(30,33,56,0),(32,35,57,0),(33,36,57,0),(34,37,57,0),(35,38,57,0),(48,51,16,0),(50,53,15,0),(64,17,62,0),(65,69,16,0),(66,70,16,0),(67,71,16,0),(68,72,62,0),(69,73,62,0),(70,74,62,0),(71,75,62,0),(72,76,62,0),(73,78,62,0),(74,79,63,0),(75,80,63,0),(76,81,63,0),(77,82,63,0),(78,83,63,0),(79,84,64,0),(80,86,64,0),(81,87,64,0),(82,88,64,0),(83,89,64,0),(84,90,64,0),(85,91,64,0),(86,92,64,0),(87,93,64,0),(88,95,64,0),(89,96,65,0),(90,97,65,0),(91,98,65,0),(92,99,66,0),(93,100,66,0),(94,101,36,0),(95,102,36,0),(96,103,36,0),(97,104,36,0),(98,105,41,0),(99,106,41,0),(100,107,41,0),(101,108,45,0),(102,109,45,0),(103,110,74,0),(104,111,74,0),(105,112,74,0),(106,113,74,0),(107,114,74,0),(108,115,74,0),(109,116,74,0),(110,117,74,0),(111,118,74,0),(112,119,74,0),(113,120,56,0),(114,121,57,0);
/*!40000 ALTER TABLE `catalogue_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productclass`
--

DROP TABLE IF EXISTS `catalogue_productclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `requires_shipping` tinyint(1) NOT NULL,
  `track_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productclass`
--

LOCK TABLES `catalogue_productclass` WRITE;
/*!40000 ALTER TABLE `catalogue_productclass` DISABLE KEYS */;
INSERT INTO `catalogue_productclass` VALUES (1,'Banners','banners',1,1),(2,'Booklets','booklets',1,1),(3,'Bords & Panels','bords-panels',1,1),(4,'Leaflets','leaflets',1,1),(5,'Canvas','canvas',1,1),(6,'Foamex 3mm & 5mm ','foamex-3mm-5mm',1,1),(7,'Board & Panels','board-and-panels',1,1),(8,'Small format digital','Small-format-digital',1,1),(9,'Exhibition Materials','exhibition-materials',1,1),(10,'Prints','prints',1,1),(11,'Posters','posters',1,1),(12,'Stationery','stationery',1,1),(13,'Stickers','stickers',1,0),(14,'Vinyl','vinyl',1,1),(15,'Wallpaper','wallpaper',1,1),(16,'Generic Class','generic-class',1,0);
/*!40000 ALTER TABLE `catalogue_productclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productclass_options`
--

DROP TABLE IF EXISTS `catalogue_productclass_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productclass_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productclass_op_productclass_id_415b3580371dcd90_uniq` (`productclass_id`,`option_id`),
  KEY `catalogue_productclass_options_4c96c09` (`productclass_id`),
  KEY `catalogue_productclass_options_2f3b0dc9` (`option_id`),
  CONSTRAINT `option_id_refs_id_1faa8090a32cc06c` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`),
  CONSTRAINT `productclass_id_refs_id_2f40050356fe557e` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productclass_options`
--

LOCK TABLES `catalogue_productclass_options` WRITE;
/*!40000 ALTER TABLE `catalogue_productclass_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productclass_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productcontributor`
--

DROP TABLE IF EXISTS `catalogue_productcontributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productcontributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `contributor_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productcontributor_bb420c12` (`product_id`),
  KEY `catalogue_productcontributor_6a73a0c4` (`contributor_id`),
  KEY `catalogue_productcontributor_bf07f040` (`role_id`),
  CONSTRAINT `contributor_id_refs_id_2bd923ffbb40a89f` FOREIGN KEY (`contributor_id`) REFERENCES `catalogue_contributor` (`id`),
  CONSTRAINT `product_id_refs_id_8265302f06c19bb` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `role_id_refs_id_295709b2fa6b73ef` FOREIGN KEY (`role_id`) REFERENCES `catalogue_contributorrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productcontributor`
--

LOCK TABLES `catalogue_productcontributor` WRITE;
/*!40000 ALTER TABLE `catalogue_productcontributor` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productcontributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productimage`
--

DROP TABLE IF EXISTS `catalogue_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `original` varchar(100) NOT NULL,
  `caption` varchar(200) DEFAULT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productimage_product_id_13868d064d886d95_uniq` (`product_id`,`display_order`),
  KEY `catalogue_productimage_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_61170617011aab1` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productimage`
--

LOCK TABLES `catalogue_productimage` WRITE;
/*!40000 ALTER TABLE `catalogue_productimage` DISABLE KEYS */;
INSERT INTO `catalogue_productimage` VALUES (12,15,'images/products/2013/06/PE-Coated-Aluminium-Composite-Panel-for-Interior.jpg','',0,'2013-06-26 10:59:37'),(13,16,'images/products/2013/06/wire-bound-closeup-large.jpg','',0,'2013-06-26 17:29:01'),(14,17,'images/products/2013/06/Standart_Business_Card_2x3.5_front1.jpg','',0,'2013-06-26 17:32:04');
/*!40000 ALTER TABLE `catalogue_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productrecommendation`
--

DROP TABLE IF EXISTS `catalogue_productrecommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productrecommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primary_id` int(11) NOT NULL,
  `recommendation_id` int(11) NOT NULL,
  `ranking` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productrecommendation_f8d5ed73` (`primary_id`),
  KEY `catalogue_productrecommendation_7bfcf8af` (`recommendation_id`),
  CONSTRAINT `primary_id_refs_id_135e24f25d6d0838` FOREIGN KEY (`primary_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `recommendation_id_refs_id_135e24f25d6d0838` FOREIGN KEY (`recommendation_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productrecommendation`
--

LOCK TABLES `catalogue_productrecommendation` WRITE;
/*!40000 ALTER TABLE `catalogue_productrecommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productrecommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvimport_csvimport`
--

DROP TABLE IF EXISTS `csvimport_csvimport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvimport_csvimport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) NOT NULL,
  `field_list` varchar(255) NOT NULL,
  `upload_file` varchar(100) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `encoding` varchar(32) NOT NULL,
  `upload_method` varchar(50) NOT NULL,
  `error_log` longtext NOT NULL,
  `import_date` date NOT NULL,
  `import_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_csvimport`
--

LOCK TABLES `csvimport_csvimport` WRITE;
/*!40000 ALTER TABLE `csvimport_csvimport` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvimport_csvimport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvimport_importmodel`
--

DROP TABLE IF EXISTS `csvimport_importmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvimport_importmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `csvimport_id` int(11) NOT NULL,
  `numeric_id` int(10) unsigned NOT NULL,
  `natural_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `csvimport_importmodel_fe08e486` (`csvimport_id`),
  CONSTRAINT `csvimport_id_refs_id_8d3261cc` FOREIGN KEY (`csvimport_id`) REFERENCES `csvimport_csvimport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_importmodel`
--

LOCK TABLES `csvimport_importmodel` WRITE;
/*!40000 ALTER TABLE `csvimport_importmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvimport_importmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_communicationeventtype`
--

DROP TABLE IF EXISTS `customer_communicationeventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_communicationeventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `email_subject_template` varchar(255) DEFAULT NULL,
  `email_body_template` longtext,
  `email_body_html_template` longtext,
  `sms_template` varchar(170) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_communicationeventtype_65da3d2c` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_communicationeventtype`
--

LOCK TABLES `customer_communicationeventtype` WRITE;
/*!40000 ALTER TABLE `customer_communicationeventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_communicationeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_email`
--

DROP TABLE IF EXISTS `customer_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subject` longtext NOT NULL,
  `body_text` longtext NOT NULL,
  `body_html` longtext,
  `date_sent` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_email_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_616ffdfa01dae763` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_email`
--

LOCK TABLES `customer_email` WRITE;
/*!40000 ALTER TABLE `customer_email` DISABLE KEYS */;
INSERT INTO `customer_email` VALUES (2,1,'Resetting your password at example.com.','\nYou\'re receiving this e-mail because you requested a password reset for your user account at example.com.\n\nPlease go to the following page and choose a new password:\nhttp://example.com/password-reset/confirm/1-3hg-5c289e4f863a85017985/\n\nThanks for using our site!\nThe example.com team\n\n\n','\n<p>\n	You\'re receiving this e-mail because you requested a password reset for your user account at example.com.\n</p>\n\n<p>Please go to the following page and choose a new password:</p>\nhttp://example.com/password-reset/confirm/1-3hg-5c289e4f863a85017985/\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n\n\n','2013-05-14 20:31:02'),(3,1,'Resetting your password at example.com.','\nYou\'re receiving this e-mail because you requested a password reset for your user account at example.com.\n\nPlease go to the following page and choose a new password:\nhttp://example.com/password-reset/confirm/1-3hg-5c289e4f863a85017985/\n\nThanks for using our site!\nThe example.com team\n\n\n','\n<p>\n	You\'re receiving this e-mail because you requested a password reset for your user account at example.com.\n</p>\n\n<p>Please go to the following page and choose a new password:</p>\nhttp://example.com/password-reset/confirm/1-3hg-5c289e4f863a85017985/\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n\n\n','2013-05-14 21:08:55'),(4,1,'Your password changed at example.com.','\n\n\nYou\'re receiving this email because your password has been changed at example.com.\n\n\nIf it wasn\'t you who changed it, please reset your password immediately:\nhttp://example.com/password-reset/confirm/1-3hi-e3e419730252af0847ad/\n\nOtherwise, you can ignore this email.\n\nThanks for using our site!\nThe example.com team\n\n\n','\n\n<p>\n    \n    You\'re receiving this e-mail because your password has been changed at example.com.\n    \n</p>\n\n<p>\nIf it wasn\'t you who changed it, please reset your password immediately:\nhttp://example.com/password-reset/confirm/1-3hi-e3e419730252af0847ad/\n</p>\n\n<p>Otherwise, you can ignore this email.</p>\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n\n','2013-05-16 17:04:37'),(5,1,'Your password changed at example.com.','\n\n\nYou\'re receiving this email because your password has been changed at example.com.\n\n\nIf it wasn\'t you who changed it, please reset your password immediately:\nhttp://example.com/password-reset/confirm/1-3hm-d0fbf8e6f50f92dbc1e0/\n\nOtherwise, you can ignore this email.\n\nThanks for using our site!\nThe example.com team\n\n\n','\n\n<p>\n    \n    You\'re receiving this e-mail because your password has been changed at example.com.\n    \n</p>\n\n<p>\nIf it wasn\'t you who changed it, please reset your password immediately:\nhttp://example.com/password-reset/confirm/1-3hm-d0fbf8e6f50f92dbc1e0/\n</p>\n\n<p>Otherwise, you can ignore this email.</p>\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n\n','2013-05-20 15:52:42'),(11,4,'Resetting your password at example.com.','\nYou\'re receiving this e-mail because you requested a password reset for your user account at example.com.\n\nPlease go to the following page and choose a new password:\nhttp://example.com/password-reset/confirm/4-3jn-4a1e03219aa012ba8a7f/\n\nThanks for using our site!\nThe example.com team\n\n\n','\n<p>\n	You\'re receiving this e-mail because you requested a password reset for your user account at example.com.\n</p>\n\n<p>Please go to the following page and choose a new password:</p>\nhttp://example.com/password-reset/confirm/4-3jn-4a1e03219aa012ba8a7f/\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n\n\n','2013-08-01 13:45:51'),(12,8,'Resetting your password at example.com.','\nYou\'re receiving this e-mail because you requested a password reset for your user account at example.com.\n\nPlease go to the following page and choose a new password:\nhttp://example.com/password-reset/confirm/8-3jn-0cbe9f5288cb29ee168b/\n\nThanks for using our site!\nThe example.com team\n\n\n','\n<p>\n	You\'re receiving this e-mail because you requested a password reset for your user account at example.com.\n</p>\n\n<p>Please go to the following page and choose a new password:</p>\nhttp://example.com/password-reset/confirm/8-3jn-0cbe9f5288cb29ee168b/\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n\n\n','2013-08-01 13:45:51'),(13,11,'Confirmation of order 100011','Hello,\n\nWe are pleased to confirm your order 100011 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Business Card - quantity: 50 - price: £ 0.00\n * Business Card - quantity: 50 - price: £ 27.00\n\nBasket total: £ 27.00\nShipping: £ 0.00\nOrder Total: £ 27.00\n\nShipping address:\n\n  facilitator account&#39;s Test Store\n  1 Main St\n  San Jose\n  CA\n  95131\n  usa\n\n\n\n\nThe team\n','<p xmlns=\"http://www.w3.org/1999/html\">Hello,</p>\n\n<p>We are pleased to confirm your order 100011 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Business Card - quantity: 50 - price: £ 0.00</li>\n    \n    <li>Business Card - quantity: 50 - price: £ 27.00</li>\n    \n</ul>\n<p>\nBasket total: £ 27.00</br>\nShipping: £ 0.00</br>\nOrder Total: £ 27.00\n</p>\n\n<p>Shipping address:</p>\n<p>  facilitator account&#39;s Test Store<br/>\n  1 Main St<br/>\n  San Jose<br/>\n  CA<br/>\n  95131<br/>\n  usa<br/>\n</p>\n\n\n\n<p>The team</p>\n','2013-08-03 13:57:28'),(14,1,'Confirmation of order 100001','Hello,\n\nWe are pleased to confirm your order 100001 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Business Card - quantity: 700 - price: £ 70.00\n\nBasket total: £ 70.00\nShipping: £ 0.00\nOrder Total: £ 70.00\n\nShipping address:\n\n  facilitator account&#39;s Test Store\n  1 Main St\n  San Jose\n  CA\n  95131\n  usa\n\n\n\n\nThe team\n','<p xmlns=\"http://www.w3.org/1999/html\">Hello,</p>\n\n<p>We are pleased to confirm your order 100001 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Business Card - quantity: 700 - price: £ 70.00</li>\n    \n</ul>\n<p>\nBasket total: £ 70.00</br>\nShipping: £ 0.00</br>\nOrder Total: £ 70.00\n</p>\n\n<p>Shipping address:</p>\n<p>  facilitator account&#39;s Test Store<br/>\n  1 Main St<br/>\n  San Jose<br/>\n  CA<br/>\n  95131<br/>\n  usa<br/>\n</p>\n\n\n\n<p>The team</p>\n','2013-08-05 14:20:57'),(15,4,'Confirmation of order 100003','Hello,\n\nWe are pleased to confirm your order 100003 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Business Card - quantity: 100 - price: £ 32.00\n\nBasket total: £ 32.00\nShipping: £ 0.00\nOrder Total: £ 32.00\n\nShipping address:\n\n  facilitator account&#39;s Test Store\n  1 Main St\n  San Jose\n  CA\n  95131\n  usa\n\n\n\n\nThe team\n','<p xmlns=\"http://www.w3.org/1999/html\">Hello,</p>\n\n<p>We are pleased to confirm your order 100003 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Business Card - quantity: 100 - price: £ 32.00</li>\n    \n</ul>\n<p>\nBasket total: £ 32.00</br>\nShipping: £ 0.00</br>\nOrder Total: £ 32.00\n</p>\n\n<p>Shipping address:</p>\n<p>  facilitator account&#39;s Test Store<br/>\n  1 Main St<br/>\n  San Jose<br/>\n  CA<br/>\n  95131<br/>\n  usa<br/>\n</p>\n\n\n\n<p>The team</p>\n','2013-08-05 14:29:30');
/*!40000 ALTER TABLE `customer_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notification`
--

DROP TABLE IF EXISTS `customer_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `location` varchar(32) NOT NULL,
  `date_sent` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notification_fcd09624` (`recipient_id`),
  KEY `customer_notification_901f59e9` (`sender_id`),
  CONSTRAINT `recipient_id_refs_id_1153954ea079c19f` FOREIGN KEY (`recipient_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `sender_id_refs_id_1153954ea079c19f` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notification`
--

LOCK TABLES `customer_notification` WRITE;
/*!40000 ALTER TABLE `customer_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_productalert`
--

DROP TABLE IF EXISTS `customer_productalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_productalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `key` varchar(128) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_cancelled` datetime DEFAULT NULL,
  `date_closed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_productalert_bb420c12` (`product_id`),
  KEY `customer_productalert_fbfc09f1` (`user_id`),
  KEY `customer_productalert_3904588a` (`email`),
  KEY `customer_productalert_45544485` (`key`),
  CONSTRAINT `product_id_refs_id_415e4f4bc471f1aa` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `user_id_refs_id_6d57e4aa3c62edcb` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_productalert`
--

LOCK TABLES `customer_productalert` WRITE;
/*!40000 ALTER TABLE `customer_productalert` DISABLE KEYS */;
INSERT INTO `customer_productalert` VALUES (2,99,17,'',NULL,'Active','2013-08-28 10:34:21',NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_productalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1063 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-05-10 13:14:52',1,27,'1','Banners',1,''),(2,'2013-05-10 13:15:00',1,27,'2','Booklets',1,''),(3,'2013-05-10 13:15:08',1,27,'3','Bords & Panels',1,''),(4,'2013-05-10 13:15:13',1,27,'4','Leaflets',1,''),(5,'2013-05-10 13:15:24',1,27,'4','Leaflets',2,'Changed slug.'),(6,'2013-05-10 13:15:37',1,27,'4','Leaflets',2,'Changed slug.'),(7,'2013-05-10 13:15:49',1,27,'5','Canvas',1,''),(8,'2013-05-11 08:31:56',1,46,'1','The Main Partner',1,''),(9,'2013-05-12 15:31:05',1,39,'1','Product Options',1,''),(10,'2013-05-12 15:31:16',1,39,'2','Paper Options',1,''),(11,'2013-05-12 15:33:07',1,36,'1','Paper Size',1,''),(12,'2013-05-12 15:33:28',1,36,'2','Orientation',1,''),(13,'2013-05-12 15:33:44',1,36,'1','Paper Size',2,'Added Attribute Option \"Custom\". Added Attribute Option \"A4\". Added Attribute Option \"A3\".'),(14,'2013-05-12 15:34:30',1,36,'3','Paper Weight',1,''),(15,'2013-05-12 15:34:41',1,36,'4','Paper Type',1,''),(16,'2013-05-12 15:35:03',1,36,'5','Lamination or Encapsulation',1,''),(17,'2013-05-12 15:36:31',1,34,'1','Paper Size',1,''),(18,'2013-05-12 15:36:58',1,34,'2','Orientation',1,''),(19,'2013-05-12 15:37:27',1,34,'3','Paper Weight',1,''),(20,'2013-05-12 15:37:53',1,34,'4','Paper Type',1,''),(21,'2013-05-12 15:38:13',1,34,'5','Lamination or Encapsulation',1,''),(22,'2013-05-12 15:41:55',1,34,'1','Paper Size',2,'Changed entity_type.'),(23,'2013-05-12 15:42:03',1,34,'2','Orientation',2,'No fields changed.'),(24,'2013-05-12 15:42:17',1,34,'3','Paper Weight',2,'Changed entity_type.'),(25,'2013-05-12 15:42:25',1,34,'5','Lamination or Encapsulation',2,'No fields changed.'),(26,'2013-05-12 15:42:33',1,34,'4','Paper Type',2,'Changed entity_type.'),(27,'2013-05-12 15:53:33',1,34,'1','Paper Size',2,'Changed type.'),(28,'2013-05-12 15:53:45',1,34,'5','Lamination or Encapsulation',2,'Changed type.'),(29,'2013-05-12 15:53:50',1,34,'2','Orientation',2,'No fields changed.'),(30,'2013-05-12 15:53:56',1,34,'1','Paper Size',2,'No fields changed.'),(31,'2013-05-12 15:54:01',1,34,'4','Paper Type',2,'Changed type.'),(32,'2013-05-12 15:54:07',1,34,'3','Paper Weight',2,'Changed type.'),(33,'2013-05-12 21:10:04',1,34,'5','Lamination or Encapsulation',2,'Changed entity_type.'),(34,'2013-05-12 21:10:19',1,34,'3','Paper Weight',2,'Changed entity_type.'),(35,'2013-05-12 21:10:27',1,34,'4','Paper Type',2,'Changed entity_type.'),(36,'2013-05-12 21:10:38',1,34,'3','Paper Weight',2,'No fields changed.'),(37,'2013-05-17 06:45:00',1,3,'3','Roberto',1,''),(38,'2013-05-17 06:45:46',1,3,'4','Rob',1,''),(39,'2013-05-17 06:49:14',1,3,'4','Rob',2,'Changed password, email, is_superuser and user_permissions.'),(40,'2013-05-17 06:50:25',1,3,'4','Rob',2,'Changed password and is_staff.'),(41,'2013-05-20 12:17:08',1,105,'1','AttributeOptionThumbnail object',1,''),(42,'2013-05-20 15:58:28',1,3,'4','Developer',2,'Changed username and password.'),(43,'2013-05-21 11:47:33',4,105,'1','AttributeOptionThumbnail object',2,'Changed img.'),(44,'2013-05-21 11:47:43',4,105,'2','AttributeOptionThumbnail object',1,''),(45,'2013-05-21 11:47:53',4,105,'3','AttributeOptionThumbnail object',1,''),(46,'2013-05-21 11:48:02',4,105,'4','AttributeOptionThumbnail object',1,''),(47,'2013-05-22 09:07:38',4,40,'1','Your job in Progress',1,''),(48,'2013-05-22 09:07:48',4,27,'1','Banners',2,'Changed options.'),(49,'2013-05-22 10:29:47',4,27,'6','Foamex 3mm & 5mm ',1,''),(50,'2013-05-22 10:30:16',4,27,'6','Foamex 3mm & 5mm ',2,'No fields changed.'),(51,'2013-05-22 10:30:25',4,27,'7','Board and Panels',1,''),(52,'2013-05-22 10:31:13',4,27,'8','Artist Canvas',1,''),(53,'2013-05-22 10:31:29',4,27,'9','Exhibition Materials',1,''),(54,'2013-05-22 10:31:40',4,27,'10','Prints',1,''),(55,'2013-05-22 10:31:52',4,27,'11','Posters',1,''),(56,'2013-05-22 10:32:03',4,27,'12','Stationery',1,''),(57,'2013-05-22 10:32:14',4,27,'13','Stickers',1,''),(58,'2013-05-22 10:32:28',4,27,'14','Vinyl',1,''),(59,'2013-05-22 10:32:41',4,27,'15','Wallpaper',1,''),(60,'2013-05-22 11:20:06',4,29,'1','<productcategory for product \'Banner 100x100\'>',2,'No fields changed.'),(61,'2013-05-22 16:32:29',4,34,'6','ACM Panels',1,''),(62,'2013-05-23 21:05:34',4,50,'us','usa',1,''),(63,'2013-05-23 21:07:07',4,50,'uk','uk',1,''),(64,'2013-05-25 07:17:13',4,3,'8','Dev',1,''),(65,'2013-05-25 07:17:55',4,3,'8','Dev',2,'Changed password, email and is_staff.'),(66,'2013-05-25 07:23:12',4,3,'8','Dev',2,'Changed password and user_permissions.'),(67,'2013-05-27 11:22:56',4,3,'5','1z62yokz7E4ISFFWd3vTYWYM4dzjuK',3,''),(68,'2013-05-27 11:22:56',4,3,'7','5NXRxyVQ8w0onUcD5OmQBl5SoKdR8o',3,''),(69,'2013-05-27 11:22:56',4,3,'2','NHKSMq4B3eAkx57aq94mHrgHgdZHf1',3,''),(70,'2013-05-27 11:22:56',4,3,'3','Roberto',3,''),(71,'2013-05-27 11:22:56',4,3,'6','wTtnWELS_w0f8mtMrzWsEwQ4_95CIv',3,''),(72,'2013-05-27 19:25:06',4,36,'5','Lamination ',2,'Changed name.'),(73,'2013-05-28 09:25:27',4,27,'7','Board & Panels',2,'Changed name.'),(74,'2013-05-28 09:31:07',4,34,'5','Lamination ',2,'Changed name, code and type.'),(75,'2013-05-28 09:31:26',4,34,'6','ACM Panels',3,''),(76,'2013-06-02 19:27:18',4,27,'8','Small format digital',2,'Changed name and slug.'),(77,'2013-06-04 19:37:36',4,3,'10','Developer2',1,''),(78,'2013-06-04 19:39:00',4,3,'10','Developer2',2,'Changed password, email and user_permissions.'),(79,'2013-06-04 19:49:33',4,3,'10','Developer2',2,'Changed password and is_superuser.'),(80,'2013-06-04 19:49:58',4,3,'10','Developer2',2,'Changed password and is_staff.'),(81,'2013-06-06 08:49:07',4,3,'4','Developer',2,'Changed password.'),(82,'2013-06-06 09:26:40',4,3,'4','Neil',2,'Changed username and password.'),(83,'2013-06-06 13:11:16',4,28,'33','Small Format Digital > Brochures',2,'Changed _position.'),(84,'2013-06-06 13:11:31',4,28,'33','Small Format Digital > Brochures',2,'Changed _ref_node_id.'),(85,'2013-06-06 13:47:39',8,30,'5','Display Boards',1,''),(86,'2013-06-06 13:48:49',8,41,'4','Image of \'Display Boards\'',1,''),(87,'2013-06-06 13:50:46',8,30,'6','Posters',1,''),(88,'2013-06-06 13:53:51',8,30,'7','Pavement Signage',1,''),(89,'2013-06-06 13:54:06',8,41,'5','Image of \'Posters\'',1,''),(90,'2013-06-06 13:56:39',8,41,'6','Image of \'Pavement Signage\'',1,''),(91,'2013-06-06 14:09:15',8,30,'8','Digitally Printed Vinyl',1,''),(92,'2013-06-06 14:10:28',8,30,'9','Window Vinyl',1,''),(93,'2013-06-06 14:11:43',8,30,'10','Exhibition Stands',1,''),(94,'2013-06-06 14:14:05',8,30,'11','Flags Indoor/Outdoor',1,''),(95,'2013-06-06 14:15:02',8,30,'12','Business Stationery',1,''),(96,'2013-06-06 14:15:19',8,41,'7','Image of \'Window Vinyl\'',1,''),(97,'2013-06-06 14:15:34',8,41,'8','Image of \'Business Stationery\'',1,''),(98,'2013-06-06 14:16:14',8,30,'13','Indoor Roller Systems',1,''),(99,'2013-06-06 14:16:15',8,41,'9','Image of \'Flags Indoor/Outdoor\'',1,''),(100,'2013-06-06 14:16:38',8,41,'10','Image of \'Indoor Roller Systems\'',1,''),(101,'2013-06-06 14:16:49',8,41,'11','Image of \'Exhibition Stands\'',1,''),(102,'2013-06-06 17:49:37',8,36,'6','Product Class',1,''),(103,'2013-06-06 17:50:56',8,105,'5','AttributeOptionThumbnail object',1,''),(104,'2013-06-06 17:51:18',8,105,'6','AttributeOptionThumbnail object',1,''),(105,'2013-06-06 17:51:41',8,105,'7','AttributeOptionThumbnail object',1,''),(106,'2013-06-06 17:51:49',8,105,'8','AttributeOptionThumbnail object',1,''),(107,'2013-06-06 17:52:02',8,105,'9','AttributeOptionThumbnail object',1,''),(108,'2013-06-06 17:52:11',8,105,'10','AttributeOptionThumbnail object',1,''),(109,'2013-06-06 17:52:20',8,105,'11','AttributeOptionThumbnail object',1,''),(110,'2013-06-06 17:52:28',8,105,'12','AttributeOptionThumbnail object',1,''),(111,'2013-06-06 17:53:17',8,105,'13','AttributeOptionThumbnail object',1,''),(112,'2013-06-06 17:54:06',8,105,'14','AttributeOptionThumbnail object',1,''),(113,'2013-06-25 20:30:18',4,3,'11','Zaki',1,''),(114,'2013-06-25 20:36:51',4,3,'11','Zaki',2,'Changed password, is_staff and user_permissions.'),(115,'2013-06-25 20:37:28',4,3,'11','Zaki',2,'Changed password and email.'),(116,'2013-06-26 10:43:45',10,40,'1','Your job in Progress',3,''),(117,'2013-06-26 10:57:53',10,27,'16','Generic Class',1,''),(118,'2013-06-26 11:08:18',10,105,'15','AttributeOptionThumbnail object',1,''),(119,'2013-06-26 17:49:49',10,110,'11','25.500(22.000) for 300.000 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(120,'2013-06-26 17:49:49',10,110,'10','19.000(17.350) for 200.000 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(121,'2013-06-26 17:49:49',10,110,'9','16.000(15.000) for 150.000 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(122,'2013-06-26 17:49:49',10,110,'8','14.000(12.000) for 50.000 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(123,'2013-06-26 17:49:49',10,110,'7','11.000(10.000) for 50.000 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 80x55)',3,''),(124,'2013-06-26 17:49:49',10,110,'6','88.000(99.000) for 1.000 units of ACM (stock: 3mm,orientation: portrait,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,lamination: gloss,lami',3,''),(125,'2013-06-26 17:49:49',10,110,'5','35.000(30.000) for 1.000 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,',3,''),(126,'2013-06-26 17:49:49',10,110,'4','30.000(25.000) for 1.000 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,',3,''),(127,'2013-06-26 17:49:49',10,110,'3','17.000(15.000) for 1.000 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,',3,''),(128,'2013-06-26 17:49:49',10,110,'2','130.250(120.000) for 1.000 units of ACM (orientation: portrait,orientation: landscape,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,size: a0',3,''),(129,'2013-06-26 17:49:49',10,110,'1','110.250(100.000) for 1.000 units of ACM (stock: 3mm,orientation: portrait,orientation: landscape,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ',3,''),(173,'2013-06-26 17:50:22',10,40,'15','fold',3,''),(174,'2013-06-26 17:50:23',10,40,'14','finish',3,''),(175,'2013-06-26 17:50:23',10,40,'13','front-cover',3,''),(176,'2013-06-26 17:50:23',10,40,'12','pages',3,''),(177,'2013-06-26 17:50:23',10,40,'11','back-cover',3,''),(178,'2013-06-26 17:50:23',10,40,'10','binding',3,''),(179,'2013-06-26 17:50:23',10,40,'9','weight',3,''),(180,'2013-06-26 17:50:23',10,40,'8','lamination',3,''),(181,'2013-06-26 17:50:23',10,40,'7','size',3,''),(182,'2013-06-26 17:50:23',10,40,'6','printed',3,''),(183,'2013-06-26 17:50:23',10,40,'5','print-stock',3,''),(184,'2013-06-26 17:50:25',10,40,'4','location',3,''),(185,'2013-06-26 17:50:25',10,40,'3','orientation',3,''),(186,'2013-06-26 17:50:25',10,40,'2','stock',3,''),(187,'2013-06-27 09:47:43',11,30,'17','Business Card',2,'No fields changed.'),(188,'2013-06-27 09:48:58',11,30,'16','Wiro Bound Booklet',2,'No fields changed.'),(189,'2013-06-27 10:13:34',11,34,'1','Paper Size',2,'Changed type and required.'),(190,'2013-06-27 10:17:54',11,34,'1','Paper Size',2,'Changed required.'),(191,'2013-06-27 12:13:57',4,110,'11','25.50(22.00) for 300.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(192,'2013-06-27 12:13:57',4,110,'10','19.00(17.35) for 200.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(193,'2013-06-27 12:13:57',4,110,'9','16.00(15.00) for 150.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(194,'2013-06-27 12:13:57',4,110,'8','14.00(12.00) for 50.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(195,'2013-06-27 12:13:57',4,110,'7','11.00(10.00) for 50.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 80x55)',3,''),(196,'2013-06-27 12:13:57',4,110,'6','88.00(99.00) for 1.00 units of ACM (stock: 3mm,orientation: portrait,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,lamination: gloss,laminat',3,''),(197,'2013-06-27 12:13:57',4,110,'5','35.00(30.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(198,'2013-06-27 12:13:57',4,110,'4','30.00(25.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(199,'2013-06-27 12:13:58',4,110,'3','17.00(15.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(200,'2013-06-27 12:13:58',4,110,'2','130.25(120.00) for 1.00 units of ACM (orientation: portrait,orientation: landscape,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,size: a0,la',3,''),(201,'2013-06-27 12:13:58',4,110,'1','110.25(100.00) for 1.00 units of ACM (stock: 3mm,orientation: portrait,orientation: landscape,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,',3,''),(245,'2013-06-27 12:14:37',4,40,'29','fold',3,''),(246,'2013-06-27 12:14:37',4,40,'28','finish',3,''),(247,'2013-06-27 12:14:37',4,40,'27','front-cover',3,''),(248,'2013-06-27 12:14:37',4,40,'26','pages',3,''),(249,'2013-06-27 12:14:37',4,40,'25','back-cover',3,''),(250,'2013-06-27 12:14:37',4,40,'24','binding',3,''),(251,'2013-06-27 12:14:37',4,40,'23','weight',3,''),(252,'2013-06-27 12:14:37',4,40,'22','lamination',3,''),(253,'2013-06-27 12:14:37',4,40,'21','size',3,''),(254,'2013-06-27 12:14:37',4,40,'20','printed',3,''),(255,'2013-06-27 12:14:37',4,40,'19','print-stock',3,''),(256,'2013-06-27 12:14:37',4,40,'18','location',3,''),(257,'2013-06-27 12:14:37',4,40,'17','orientation',3,''),(258,'2013-06-27 12:14:37',4,40,'16','stock',3,''),(259,'2013-06-27 13:10:01',4,110,'22','25.50(22.00) for 300.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(260,'2013-06-27 13:10:01',4,110,'21','19.00(17.35) for 200.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(261,'2013-06-27 13:10:01',4,110,'20','16.00(15.00) for 150.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(262,'2013-06-27 13:10:01',4,110,'19','14.00(12.00) for 50.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(263,'2013-06-27 13:10:01',4,110,'18','11.00(10.00) for 50.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 80x55)',3,''),(264,'2013-06-27 13:10:01',4,110,'17','88.00(99.00) for 1.00 units of ACM (stock: 3mm,orientation: portrait,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,lamination: gloss,laminat',3,''),(265,'2013-06-27 13:10:01',4,110,'16','35.00(30.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(266,'2013-06-27 13:10:01',4,110,'15','30.00(25.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(267,'2013-06-27 13:10:01',4,110,'14','17.00(15.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(268,'2013-06-27 13:10:01',4,110,'13','130.25(120.00) for 1.00 units of ACM (orientation: portrait,orientation: landscape,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,size: a0,la',3,''),(269,'2013-06-27 13:10:02',4,110,'12','110.25(100.00) for 1.00 units of ACM (stock: 3mm,orientation: portrait,orientation: landscape,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,',3,''),(313,'2013-06-27 13:10:38',4,40,'43','fold',3,''),(314,'2013-06-27 13:10:38',4,40,'42','finish',3,''),(315,'2013-06-27 13:10:38',4,40,'41','front-cover',3,''),(316,'2013-06-27 13:10:38',4,40,'40','pages',3,''),(317,'2013-06-27 13:10:38',4,40,'39','back-cover',3,''),(318,'2013-06-27 13:10:38',4,40,'38','binding',3,''),(319,'2013-06-27 13:10:38',4,40,'37','weight',3,''),(320,'2013-06-27 13:10:38',4,40,'36','lamination',3,''),(321,'2013-06-27 13:10:38',4,40,'35','size',3,''),(322,'2013-06-27 13:10:38',4,40,'34','printed',3,''),(323,'2013-06-27 13:10:38',4,40,'33','print-stock',3,''),(324,'2013-06-27 13:10:38',4,40,'32','location',3,''),(325,'2013-06-27 13:10:38',4,40,'31','orientation',3,''),(326,'2013-06-27 13:10:38',4,40,'30','stock',3,''),(327,'2013-06-27 18:25:00',10,110,'33','25.50(22.00) for 300.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(328,'2013-06-27 18:25:00',10,110,'32','19.00(17.35) for 200.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(329,'2013-06-27 18:25:00',10,110,'31','16.00(15.00) for 150.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(330,'2013-06-27 18:25:00',10,110,'30','14.00(12.00) for 50.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 90x55)',3,''),(331,'2013-06-27 18:25:00',10,110,'29','11.00(10.00) for 50.00 units of Business Card (stock: matt,stock: silk,stock: gloss,stock: recycled,finish: corners,finish: foil,weight: 300,fold: none,fold: single,size: 80x55)',3,''),(332,'2013-06-27 18:25:01',10,110,'28','88.00(99.00) for 1.00 units of ACM (stock: 3mm,orientation: portrait,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,lamination: gloss,laminat',3,''),(333,'2013-06-27 18:25:01',10,110,'27','35.00(30.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(334,'2013-06-27 18:25:01',10,110,'26','30.00(25.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(335,'2013-06-27 18:25:01',10,110,'25','17.00(15.00) for 1.00 units of Wiro Bound Booklet (orientation: portrait,orientation: landscape,printed: ss,printed: ds,stock: matt,stock: silk,stock: gloss,stock: uncoated,weight: 120,weight: 150,wei',3,''),(336,'2013-06-27 18:25:01',10,110,'24','130.25(120.00) for 1.00 units of ACM (orientation: portrait,orientation: landscape,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,size: a0,la',3,''),(337,'2013-06-27 18:25:01',10,110,'23','110.25(100.00) for 1.00 units of ACM (stock: 3mm,orientation: portrait,orientation: landscape,location: indoor,location: outdoor,print-stock: sa-polyprop,print-stock: sa-vinyl,printed: ss,printed: ds,',3,''),(381,'2013-06-27 18:25:23',10,40,'57','fold',3,''),(382,'2013-06-27 18:25:23',10,40,'56','finish',3,''),(383,'2013-06-27 18:25:23',10,40,'55','front-cover',3,''),(384,'2013-06-27 18:25:23',10,40,'54','pages',3,''),(385,'2013-06-27 18:25:23',10,40,'53','back-cover',3,''),(386,'2013-06-27 18:25:23',10,40,'52','binding',3,''),(387,'2013-06-27 18:25:23',10,40,'51','weight',3,''),(388,'2013-06-27 18:25:23',10,40,'50','lamination',3,''),(389,'2013-06-27 18:25:23',10,40,'49','size',3,''),(390,'2013-06-27 18:25:23',10,40,'48','printed',3,''),(391,'2013-06-27 18:25:23',10,40,'47','print-stock',3,''),(392,'2013-06-27 18:25:23',10,40,'46','location',3,''),(393,'2013-06-27 18:25:23',10,40,'45','orientation',3,''),(394,'2013-06-27 18:25:23',10,40,'44','stock',3,''),(395,'2013-07-06 11:55:11',10,115,'1','Product Options',1,''),(396,'2013-07-06 11:55:26',10,115,'2','Finishing',1,''),(397,'2013-07-06 11:58:20',10,115,'3','Paper',1,''),(398,'2013-07-06 12:05:08',10,115,'3','Stock Options',2,'Changed name.'),(399,'2013-07-06 12:05:43',10,116,'1','Present location as thumbnail at 0 in Product Options',1,''),(400,'2013-07-06 12:06:14',10,116,'2','Present size as thumbnail at 0 in Product Options',1,''),(401,'2013-07-06 12:06:32',10,116,'3','Present binding as thumbnail at 0 in Product Options',1,''),(402,'2013-07-06 12:06:54',10,116,'4','Present pages as thumbnail at 0 in Product Options',1,''),(403,'2013-07-06 12:07:08',10,116,'5','Present fold as thumbnail at 0 in Product Options',1,''),(404,'2013-07-06 12:07:21',10,116,'6','Present finish as thumbnail at 0 in Finishing',1,''),(405,'2013-07-06 12:07:30',10,116,'7','Present lamination as thumbnail at 0 in Finishing',1,''),(406,'2013-07-06 12:07:39',10,116,'8','Present orientation as thumbnail at 0 in Product Options',1,''),(407,'2013-07-06 12:07:59',10,116,'9','Present printed as thumbnail at 0 in Product Options',1,''),(408,'2013-07-06 12:08:08',10,115,'4','Cover',1,''),(409,'2013-07-06 12:08:13',10,116,'10','Present back-cover as thumbnail at 0 in Cover',1,''),(410,'2013-07-06 12:08:19',10,116,'11','Present front-cover as thumbnail at 0 in Cover',1,''),(411,'2013-07-06 12:09:48',10,116,'12','Present stock as thumbnail at 0 in Stock Options',1,''),(412,'2013-07-06 12:09:59',10,116,'13','Present print-stock as thumbnail at 0 in Stock Options',1,''),(413,'2013-07-06 12:10:43',10,116,'14','Present weight as thumbnail at 0 in Stock Options',1,''),(414,'2013-07-06 12:15:35',10,115,'5','Booklet Options',1,''),(415,'2013-07-06 12:15:51',10,116,'4','Present pages as thumbnail at 0 in Booklet Options',2,'Changed group.'),(416,'2013-07-06 12:16:48',10,116,'3','Present binding as thumbnail at 0 in Booklet Options',2,'Changed group.'),(417,'2013-07-06 14:16:04',10,116,'9','Present printed as thumbnail at 5 in Product Options',2,'Changed position.'),(418,'2013-07-06 14:23:59',10,115,'5','Booklet Options',2,'Changed position.'),(419,'2013-07-06 15:08:19',10,116,'11','0. front-cover as thumbnail in Cover',3,''),(420,'2013-07-06 15:08:37',10,116,'15','0. front-cover as thumbnail in Cover',1,''),(421,'2013-07-06 15:38:37',10,116,'1','4. location as thumbnail in Product Options',2,'Changed position.'),(422,'2013-07-06 15:38:45',10,116,'2','3. size as thumbnail in Product Options',2,'Changed position.'),(423,'2013-07-06 15:38:53',10,116,'5','2. fold as thumbnail in Product Options',2,'Changed position.'),(424,'2013-07-06 15:39:00',10,116,'8','1. orientation as thumbnail in Product Options',2,'Changed position.'),(425,'2013-07-06 15:39:20',10,115,'1','1. Product Options',2,'Changed position.'),(426,'2013-07-06 15:39:29',10,115,'3','2. Stock Options',2,'Changed position.'),(427,'2013-07-06 15:39:37',10,115,'2','3. Finishing',2,'Changed position.'),(428,'2013-07-06 15:39:42',10,115,'4','4. Cover',2,'Changed position.'),(429,'2013-07-06 15:48:15',10,116,'8','1. orientation as thumbnail in Product Options',3,''),(430,'2013-07-06 15:48:15',10,116,'5','2. fold as thumbnail in Product Options',3,''),(431,'2013-07-06 15:48:15',10,116,'2','3. size as thumbnail in Product Options',3,''),(432,'2013-07-06 15:48:15',10,116,'1','4. location as thumbnail in Product Options',3,''),(433,'2013-07-06 15:48:15',10,116,'9','5. printed as thumbnail in Product Options',3,''),(434,'2013-07-06 15:48:15',10,116,'14','0. weight as thumbnail in Stock Options',3,''),(435,'2013-07-06 15:48:15',10,116,'13','0. print-stock as thumbnail in Stock Options',3,''),(436,'2013-07-06 15:48:15',10,116,'12','0. stock as thumbnail in Stock Options',3,''),(437,'2013-07-06 15:48:15',10,116,'7','0. lamination as thumbnail in Finishing',3,''),(438,'2013-07-06 15:48:15',10,116,'6','0. finish as thumbnail in Finishing',3,''),(439,'2013-07-06 15:48:15',10,116,'15','0. front-cover as thumbnail in Cover',3,''),(440,'2013-07-06 15:48:15',10,116,'10','0. back-cover as thumbnail in Cover',3,''),(441,'2013-07-06 15:48:15',10,116,'4','0. pages as thumbnail in Booklet Options',3,''),(442,'2013-07-06 15:48:15',10,116,'3','0. binding as thumbnail in Booklet Options',3,''),(443,'2013-07-06 16:02:18',10,116,'16','0. size as thumbnail in Stock Options',1,''),(444,'2013-07-06 16:10:07',10,116,'16','0. size as thumbnail in Stock Options',3,''),(445,'2013-07-08 15:22:37',10,110,'17','88.00(99.00) for 1.00 units of ACM (stock: 3mm,orientation: portrait,location: outdoor,location: indoor,print-stock: sa-vinyl,print-stock: sa-polyprop,printed: ds,printed: ss,size: a4,lamination: none',3,''),(446,'2013-07-08 19:09:58',4,115,'6','2. Binding',1,''),(447,'2013-07-08 19:13:51',4,116,'17','0. fold as dropdown in Binding',1,''),(448,'2013-07-08 19:17:48',4,115,'7','6. rough cut',1,''),(449,'2013-07-08 19:19:13',4,116,'18','0. finish as dropdown in rough cut',1,''),(450,'2013-07-08 19:19:32',4,116,'18','0. finish as thumbnail in rough cut',2,'Changed widget.'),(451,'2013-07-08 19:20:51',10,116,'19','0. location as thumbnail in Product Options',1,''),(452,'2013-07-08 19:21:09',10,116,'20','0. stock as thumbnail in Stock Options',1,''),(453,'2013-07-08 19:21:17',10,116,'21','0. weight as thumbnail in Stock Options',1,''),(454,'2013-07-08 19:21:30',10,116,'22','0. print-stock as thumbnail in Stock Options',1,''),(455,'2013-07-08 19:21:37',10,116,'23','0. orientation as thumbnail in Product Options',1,''),(456,'2013-07-08 19:21:46',10,116,'24','0. size as thumbnail in Product Options',1,''),(457,'2013-07-08 19:21:59',10,116,'25','0. lamination as thumbnail in Finishing',1,''),(458,'2013-07-08 19:22:10',10,116,'26','0. pages as thumbnail in Booklet Options',1,''),(459,'2013-07-08 19:22:18',10,116,'27','0. front-cover as thumbnail in Booklet Options',1,''),(460,'2013-07-08 19:22:29',10,116,'28','0. back-cover as thumbnail in Booklet Options',1,''),(461,'2013-07-08 19:22:38',10,116,'29','0. binding as thumbnail in Booklet Options',1,''),(462,'2013-07-08 19:22:45',10,116,'30','0. printed as thumbnail in Product Options',1,''),(463,'2013-07-08 19:45:05',4,114,'3','orientation: landscape',2,'Changed conflicts_with.'),(464,'2013-07-11 21:12:30',4,115,'7','6. rough cut',3,''),(465,'2013-07-11 21:14:29',4,115,'8','1. 100x100',1,''),(466,'2013-07-11 21:17:15',4,115,'8','1. 100x100',3,''),(467,'2013-07-12 08:23:04',4,40,'72','Cover',1,''),(468,'2013-07-12 08:23:22',4,116,'31','0. Cover as dropdown in Product Options',1,''),(469,'2013-07-17 07:54:54',10,2,'1','Trade',1,''),(470,'2013-07-17 07:55:10',10,3,'10','Developer2',2,'Changed password and groups.'),(471,'2013-07-17 21:25:18',10,116,'17','0. fold as dropdown in Product Options',2,'Changed group.'),(472,'2013-07-17 21:25:27',10,116,'22','0. print-stock as thumbnail in Product Options',2,'Changed group.'),(473,'2013-07-17 21:25:33',10,116,'21','0. weight as thumbnail in Product Options',2,'Changed group.'),(474,'2013-07-17 21:25:39',10,116,'20','0. stock as thumbnail in Product Options',2,'Changed group.'),(475,'2013-07-17 21:25:45',10,116,'25','0. lamination as thumbnail in Product Options',2,'Changed group.'),(476,'2013-07-17 21:25:51',10,116,'29','0. binding as thumbnail in Product Options',2,'Changed group.'),(477,'2013-07-17 21:25:57',10,116,'28','0. back-cover as thumbnail in Product Options',2,'Changed group.'),(478,'2013-07-17 21:26:06',10,116,'27','0. front-cover as thumbnail in Product Options',2,'Changed group.'),(479,'2013-07-17 21:26:13',10,116,'26','0. pages as thumbnail in Product Options',2,'Changed group.'),(480,'2013-07-19 17:36:23',4,3,'4','Neil',2,'Changed password, groups and user_permissions.'),(481,'2013-07-19 17:38:52',4,3,'1','admin@theimip.com',2,'Changed password and user_permissions.'),(482,'2013-07-19 17:42:12',4,3,'1','Dave',2,'Changed username and password.'),(483,'2013-07-24 20:27:26',4,3,'1','Dave',2,'Changed password and groups.'),(484,'2013-07-28 02:11:12',10,87,'12','Basket #10, Product #17, quantity 50',3,''),(485,'2013-07-28 02:11:12',10,87,'11','Basket #10, Product #15, quantity 57',3,''),(486,'2013-07-28 02:11:12',10,87,'10','Basket #10, Product #17, quantity 200',3,''),(487,'2013-07-28 02:11:12',10,87,'9','Basket #3, Product #17, quantity 300',3,''),(488,'2013-07-28 02:11:12',10,87,'8','Basket #12, Product #16, quantity 10',3,''),(489,'2013-07-28 02:11:12',10,87,'7','Basket #10, Product #16, quantity 15',3,''),(490,'2013-07-28 02:11:12',10,87,'6','Basket #10, Product #17, quantity 150',3,''),(491,'2013-07-29 22:47:50',10,116,'32','0. finish as thumbnail in Product Options',1,''),(492,'2013-08-01 14:17:30',10,3,'8','Dev',2,'Changed password and email.'),(493,'2013-08-01 14:17:45',10,3,'11','Zaki',2,'Changed password and email.'),(494,'2013-08-01 14:26:18',1,3,'9','nUvzd3bTbBw2TI2XigtwrfdfFT5wbE',3,''),(495,'2013-08-01 14:26:18',1,3,'12','yKu8xL69JjwVbgKRyhqBkKHOYaTW1_',3,''),(496,'2013-08-02 13:10:22',4,116,'24','1. size as thumbnail in Product Options',2,'Changed position.'),(497,'2013-08-02 13:10:32',4,116,'20','2. stock as thumbnail in Product Options',2,'Changed position.'),(498,'2013-08-02 13:10:42',4,116,'21','3. weight as thumbnail in Product Options',2,'Changed position.'),(499,'2013-08-02 13:10:52',4,116,'17','4. fold as dropdown in Product Options',2,'Changed position.'),(500,'2013-08-02 13:11:30',4,116,'32','5. finish as thumbnail in Product Options',2,'Changed position.'),(501,'2013-08-02 13:12:07',4,116,'17','0. fold as dropdown in Finishing',2,'Changed group and position.'),(502,'2013-08-02 14:36:39',4,116,'24','3. size as thumbnail in Product Options',2,'Changed position.'),(503,'2013-08-02 14:37:02',4,116,'24','1. size as thumbnail in Product Options',2,'Changed position.'),(504,'2013-08-02 21:51:20',4,114,'8','printed: ss',2,'Changed caption.'),(505,'2013-08-02 21:56:59',4,114,'9','printed: ds',2,'Changed caption.'),(506,'2013-08-02 22:00:59',4,116,'25','6. lamination as thumbnail in Product Options',2,'Changed position.'),(507,'2013-08-02 22:01:28',4,116,'23','1. orientation as thumbnail in Product Options',2,'Changed position.'),(508,'2013-08-03 10:24:28',4,114,'46','orientation: portraint',2,'Changed caption and thumbnail.'),(509,'2013-08-03 10:28:27',4,114,'3','orientation: landscape',2,'Changed caption and thumbnail.'),(510,'2013-08-03 10:28:56',4,114,'46','orientation: portraint',2,'Changed thumbnail.'),(511,'2013-08-03 10:29:01',4,114,'3','orientation: landscape',2,'Changed thumbnail.'),(512,'2013-08-03 10:30:35',4,114,'2','orientation: portrait',2,'Changed thumbnail.'),(513,'2013-08-03 10:31:16',4,114,'46','orientation: portraint',2,'Changed thumbnail.'),(514,'2013-08-03 11:10:59',4,30,'17','Business Card',2,'Changed description, product_class and related_products.'),(515,'2013-08-03 11:13:57',4,116,'30','1. printed as thumbnail in Product Options',2,'Changed position.'),(516,'2013-08-03 11:14:07',4,116,'24','2. size as thumbnail in Product Options',2,'Changed position.'),(517,'2013-08-03 11:14:15',4,116,'23','2. orientation as thumbnail in Product Options',2,'Changed position.'),(518,'2013-08-03 11:14:19',4,116,'23','2. orientation as thumbnail in Product Options',2,'No fields changed.'),(519,'2013-08-03 11:14:29',4,116,'23','3. orientation as thumbnail in Product Options',2,'Changed position.'),(520,'2013-08-03 11:14:36',4,116,'20','3. stock as thumbnail in Product Options',2,'Changed position.'),(521,'2013-08-03 11:14:43',4,116,'21','4. weight as thumbnail in Product Options',2,'Changed position.'),(522,'2013-08-03 11:14:48',4,116,'21','5. weight as thumbnail in Product Options',2,'Changed position.'),(523,'2013-08-03 11:15:04',4,116,'20','4. stock as thumbnail in Product Options',2,'Changed position.'),(524,'2013-08-03 11:15:15',4,116,'32','7. finish as thumbnail in Product Options',2,'Changed position.'),(525,'2013-08-03 11:15:26',4,116,'17','8. fold as dropdown in Finishing',2,'Changed position.'),(526,'2013-08-03 11:15:52',4,116,'32','7. finish as dropdown in Product Options',2,'Changed widget.'),(527,'2013-08-03 11:16:10',4,116,'32','7. finish as thumbnail in Product Options',2,'Changed widget.'),(528,'2013-08-03 13:54:47',11,47,'4','The Main Partner (23532532532): Simple Product',2,'Changed num_in_stock.'),(529,'2013-08-03 13:56:29',11,47,'5','The Main Partner (iuny098): Business Card',2,'Changed num_in_stock and low_stock_threshold.'),(530,'2013-08-03 15:10:19',4,114,'46','orientation: portraint',2,'Changed thumbnail.'),(531,'2013-08-03 15:14:36',4,114,'3','orientation: landscape',2,'Changed thumbnail.'),(532,'2013-08-03 15:14:47',4,114,'46','orientation: portraint',2,'Changed thumbnail.'),(533,'2013-08-03 15:17:17',4,114,'46','orientation: portraint',2,'Changed thumbnail.'),(534,'2013-08-04 07:30:18',4,114,'46','orientation: portraint',3,''),(535,'2013-08-04 07:40:13',4,114,'2','orientation: portrait',2,'Changed thumbnail.'),(536,'2013-08-04 07:45:48',4,114,'55','orientation: portraint',3,''),(537,'2013-08-04 07:45:54',4,114,'2','orientation: portrait',2,'Changed thumbnail.'),(538,'2013-08-04 07:46:03',4,114,'2','orientation: portrait',2,'Changed thumbnail.'),(539,'2013-08-05 13:19:01',10,87,'24','Basket #1, Product #17, quantity 600',3,''),(540,'2013-08-05 13:19:01',10,87,'23','Basket #1, Product #17, quantity 600',3,''),(541,'2013-08-05 13:19:01',10,87,'22','Basket #1, Product #17, quantity 600',3,''),(542,'2013-08-05 13:19:01',10,87,'21','Basket #3, Product #17, quantity 1',3,''),(543,'2013-08-05 13:19:01',10,87,'20','Basket #11, Product #17, quantity 50',3,''),(544,'2013-08-05 13:19:01',10,87,'19','Basket #1, Product #17, quantity 400',3,''),(545,'2013-08-05 13:19:01',10,87,'18','Basket #10, Product #17, quantity 50',3,''),(546,'2013-08-05 13:19:01',10,87,'16','Basket #11, Product #17, quantity 50',3,''),(547,'2013-08-05 13:19:01',10,87,'15','Basket #10, Product #17, quantity 200',3,''),(548,'2013-08-05 13:19:01',10,87,'14','Basket #10, Product #16, quantity 1',3,''),(549,'2013-08-05 13:19:01',10,87,'13','Basket #10, Product #17, quantity 50',3,''),(550,'2013-08-05 14:40:09',4,114,'36','stock: recycled',2,'Changed conflicts_with.'),(551,'2013-08-06 11:11:48',1,3,'11','Zaki',2,'Changed password and email.'),(552,'2013-08-06 11:12:17',1,3,'11','Zaki',2,'Changed password.'),(553,'2013-08-06 11:13:05',11,2,'2','small',1,''),(554,'2013-08-06 11:13:11',11,2,'2','small',2,'No fields changed.'),(555,'2013-08-06 11:13:16',11,2,'3','large',1,''),(556,'2013-08-06 11:13:26',11,2,'4','exhibition',1,''),(557,'2013-08-06 11:14:03',11,2,'2','small',2,'No fields changed.'),(558,'2013-08-06 11:27:11',1,111,'3','Default Name',3,''),(559,'2013-08-06 11:27:11',1,111,'2','20 Pages Booklet',3,''),(560,'2013-08-06 11:27:11',1,111,'1','Jobs 1',3,''),(561,'2013-08-06 13:22:07',4,3,'13','Artwork',1,''),(562,'2013-08-12 19:10:05',1,3,'14','Data',1,''),(563,'2013-08-12 19:17:20',1,3,'14','Data',2,'Changed password, first_name, last_name, email, is_superuser and user_permissions.'),(564,'2013-08-12 19:18:15',1,3,'14','Data',2,'Changed password and is_staff.'),(565,'2013-08-14 15:20:30',4,110,'23197','48.31(39.25) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: glo',3,''),(566,'2013-08-14 15:20:30',4,110,'23184','45.31(36.25) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: glo',3,''),(567,'2013-08-14 15:20:31',4,110,'23171','31.25(25.00) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,wei',3,''),(568,'2013-08-14 15:20:31',4,110,'23158','33.81(27.65) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lami',3,''),(569,'2013-08-14 15:20:31',4,110,'23145','24.25(20.00) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,weig',3,''),(570,'2013-08-14 15:20:31',4,110,'23132','30.81(24.65) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lami',3,''),(571,'2013-08-14 15:20:31',4,110,'23119','21.25(17.00) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,weig',3,''),(572,'2013-08-14 15:20:31',4,110,'23106','27.06(22.25) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lami',3,''),(573,'2013-08-14 15:20:31',4,110,'23093','16.75(14.00) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,weig',3,''),(574,'2013-08-14 15:20:31',4,110,'23080','24.06(19.25) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lami',3,''),(575,'2013-08-14 15:20:31',4,110,'23067','13.75(11.00) for 50 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,weig',3,''),(576,'2013-08-14 15:20:31',4,110,'23198','82.75(66.80) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: gl',3,''),(577,'2013-08-14 15:20:31',4,110,'23185','79.75(63.80) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: gl',3,''),(578,'2013-08-14 15:20:31',4,110,'23172','55.00(44.00) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,we',3,''),(579,'2013-08-14 15:20:31',4,110,'23159','42.88(34.90) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(580,'2013-08-14 15:20:31',4,110,'23146','30.50(25.00) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(581,'2013-08-14 15:20:31',4,110,'23133','39.88(31.90) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(582,'2013-08-14 15:20:31',4,110,'23120','27.50(22.00) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(583,'2013-08-14 15:20:32',4,110,'23107','28.38(23.30) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(584,'2013-08-14 15:20:32',4,110,'23094','20.50(17.00) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(585,'2013-08-14 15:20:32',4,110,'23081','25.38(20.30) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(586,'2013-08-14 15:20:32',4,110,'23068','17.50(14.00) for 100 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(587,'2013-08-14 15:20:32',4,110,'23199','98.16(79.13) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: gl',3,''),(588,'2013-08-14 15:20:32',4,110,'23186','95.16(76.13) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: gl',3,''),(589,'2013-08-14 15:20:32',4,110,'23173','65.63(52.50) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,we',3,''),(590,'2013-08-14 15:20:32',4,110,'23160','51.03(41.43) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(591,'2013-08-14 15:20:32',4,110,'23147','36.13(29.50) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(592,'2013-08-14 15:20:32',4,110,'23134','48.03(38.43) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(593,'2013-08-14 15:20:32',4,110,'23121','33.13(26.50) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(594,'2013-08-14 15:20:32',4,110,'23108','38.89(31.71) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(595,'2013-08-14 15:20:32',4,110,'23095','27.75(22.80) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(596,'2013-08-14 15:20:32',4,110,'23082','35.89(28.71) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(597,'2013-08-14 15:20:32',4,110,'23069','24.75(19.80) for 150 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(598,'2013-08-14 15:20:32',4,110,'23200','115.38(92.90) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: g',3,''),(599,'2013-08-14 15:20:33',4,110,'23187','112.38(89.90) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: g',3,''),(600,'2013-08-14 15:20:33',4,110,'23174','77.50(62.00) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,we',3,''),(601,'2013-08-14 15:20:33',4,110,'23161','60.09(48.68) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(602,'2013-08-14 15:20:33',4,110,'23148','42.38(34.50) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(603,'2013-08-14 15:20:33',4,110,'23135','57.09(45.68) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(604,'2013-08-14 15:20:33',4,110,'23122','39.38(31.50) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(605,'2013-08-14 15:20:33',4,110,'23109','49.58(40.27) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(606,'2013-08-14 15:20:33',4,110,'23096','35.13(28.70) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(607,'2013-08-14 15:20:33',4,110,'23083','46.58(37.27) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(608,'2013-08-14 15:20:33',4,110,'23070','32.13(25.70) for 200 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(609,'2013-08-14 15:20:33',4,110,'23201','129.88(104.50) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(610,'2013-08-14 15:20:33',4,110,'23188','126.88(101.50) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(611,'2013-08-14 15:20:33',4,110,'23175','87.50(70.00) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,we',3,''),(612,'2013-08-14 15:20:33',4,110,'23162','66.44(53.75) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(613,'2013-08-14 15:20:33',4,110,'23149','46.75(38.00) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(614,'2013-08-14 15:20:33',4,110,'23136','63.44(50.75) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(615,'2013-08-14 15:20:33',4,110,'23123','43.75(35.00) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(616,'2013-08-14 15:20:33',4,110,'23110','60.09(48.68) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(617,'2013-08-14 15:20:34',4,110,'23097','42.38(34.50) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(618,'2013-08-14 15:20:34',4,110,'23084','57.09(45.68) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(619,'2013-08-14 15:20:34',4,110,'23071','39.38(31.50) for 250 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(620,'2013-08-14 15:20:34',4,110,'23202','154.34(124.08) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(621,'2013-08-14 15:20:34',4,110,'23189','151.34(121.08) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(622,'2013-08-14 15:20:34',4,110,'23176','104.38(83.50) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,w',3,''),(623,'2013-08-14 15:20:34',4,110,'23163','78.22(63.18) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(624,'2013-08-14 15:20:34',4,110,'23150','54.88(44.50) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(625,'2013-08-14 15:20:34',4,110,'23137','75.22(60.18) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(626,'2013-08-14 15:20:34',4,110,'23124','51.88(41.50) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(627,'2013-08-14 15:20:34',4,110,'23111','66.44(53.75) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(628,'2013-08-14 15:20:34',4,110,'23098','46.75(38.00) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(629,'2013-08-14 15:20:34',4,110,'23085','63.44(50.75) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(630,'2013-08-14 15:20:34',4,110,'23072','43.75(35.00) for 300 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(631,'2013-08-14 15:20:34',4,110,'23203','178.81(143.65) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(632,'2013-08-14 15:20:34',4,110,'23190','175.81(140.65) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(633,'2013-08-14 15:20:34',4,110,'23177','121.25(97.00) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,w',3,''),(634,'2013-08-14 15:20:34',4,110,'23164','90.00(72.60) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(635,'2013-08-14 15:20:35',4,110,'23151','63.00(51.00) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(636,'2013-08-14 15:20:35',4,110,'23138','87.00(69.60) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(637,'2013-08-14 15:20:35',4,110,'23125','60.00(48.00) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(638,'2013-08-14 15:20:35',4,110,'23112','72.78(58.83) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(639,'2013-08-14 15:20:35',4,110,'23099','51.13(41.50) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(640,'2013-08-14 15:20:35',4,110,'23086','69.78(55.83) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(641,'2013-08-14 15:20:35',4,110,'23073','48.13(38.50) for 400 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(642,'2013-08-14 15:20:35',4,110,'23204','202.38(162.50) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(643,'2013-08-14 15:20:35',4,110,'23191','199.38(159.50) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(644,'2013-08-14 15:20:35',4,110,'23178','137.50(110.00) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,',3,''),(645,'2013-08-14 15:20:35',4,110,'23165','102.69(82.75) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,la',3,''),(646,'2013-08-14 15:20:35',4,110,'23152','71.75(58.00) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(647,'2013-08-14 15:20:35',4,110,'23139','99.69(79.75) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(648,'2013-08-14 15:20:35',4,110,'23126','68.75(55.00) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(649,'2013-08-14 15:20:35',4,110,'23113','79.13(63.90) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(650,'2013-08-14 15:20:35',4,110,'23100','55.50(45.00) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(651,'2013-08-14 15:20:35',4,110,'23087','76.13(60.90) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(652,'2013-08-14 15:20:35',4,110,'23074','52.50(42.00) for 500 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(653,'2013-08-14 15:20:36',4,110,'23205','218.88(176.10) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(654,'2013-08-14 15:20:36',4,110,'23192','213.88(171.10) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(655,'2013-08-14 15:20:36',4,110,'23179','147.50(118.00) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,',3,''),(656,'2013-08-14 15:20:36',4,110,'23166','111.94(90.55) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,la',3,''),(657,'2013-08-14 15:20:36',4,110,'23153','78.75(64.00) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(658,'2013-08-14 15:20:36',4,110,'23140','106.94(85.55) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,la',3,''),(659,'2013-08-14 15:20:36',4,110,'23127','73.75(59.00) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(660,'2013-08-14 15:20:36',4,110,'23114','87.65(71.12) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(661,'2013-08-14 15:20:36',4,110,'23101','62.00(50.60) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(662,'2013-08-14 15:20:36',4,110,'23088','82.65(66.12) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(663,'2013-08-14 15:20:36',4,110,'23075','57.00(45.60) for 600 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(664,'2013-08-14 15:20:36',4,110,'23206','233.38(187.70) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(665,'2013-08-14 15:20:36',4,110,'23193','228.38(182.70) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(666,'2013-08-14 15:20:36',4,110,'23180','157.50(126.00) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,',3,''),(667,'2013-08-14 15:20:36',4,110,'23167','119.19(96.35) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,la',3,''),(668,'2013-08-14 15:20:36',4,110,'23154','83.75(68.00) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(669,'2013-08-14 15:20:36',4,110,'23141','114.19(91.35) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,la',3,''),(670,'2013-08-14 15:20:36',4,110,'23128','78.75(63.00) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(671,'2013-08-14 15:20:37',4,110,'23115','94.18(76.34) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(672,'2013-08-14 15:20:37',4,110,'23102','66.50(54.20) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(673,'2013-08-14 15:20:37',4,110,'23089','89.18(71.34) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(674,'2013-08-14 15:20:37',4,110,'23076','61.50(49.20) for 700 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(675,'2013-08-14 15:20:37',4,110,'23207','247.88(199.30) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(676,'2013-08-14 15:20:37',4,110,'23194','242.88(194.30) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(677,'2013-08-14 15:20:37',4,110,'23181','167.50(134.00) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,',3,''),(678,'2013-08-14 15:20:37',4,110,'23168','126.44(102.15) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,l',3,''),(679,'2013-08-14 15:20:37',4,110,'23155','88.75(72.00) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(680,'2013-08-14 15:20:37',4,110,'23142','121.44(97.15) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,la',3,''),(681,'2013-08-14 15:20:37',4,110,'23129','83.75(67.00) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(682,'2013-08-14 15:20:37',4,110,'23116','100.70(81.56) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,la',3,''),(683,'2013-08-14 15:20:37',4,110,'23103','71.00(57.80) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(684,'2013-08-14 15:20:37',4,110,'23090','95.70(76.56) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,lam',3,''),(685,'2013-08-14 15:20:37',4,110,'23077','66.00(52.80) for 800 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(686,'2013-08-14 15:20:37',4,110,'23208','262.38(210.90) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(687,'2013-08-14 15:20:37',4,110,'23195','257.38(205.90) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination: ',3,''),(688,'2013-08-14 15:20:37',4,110,'23182','177.50(142.00) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350,',3,''),(689,'2013-08-14 15:20:37',4,110,'23169','133.69(107.95) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,l',3,''),(690,'2013-08-14 15:20:38',4,110,'23156','93.75(76.00) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(691,'2013-08-14 15:20:38',4,110,'23143','128.69(102.95) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,l',3,''),(692,'2013-08-14 15:20:38',4,110,'23130','88.75(71.00) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,wei',3,''),(693,'2013-08-14 15:20:38',4,110,'23117','107.23(86.78) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,la',3,''),(694,'2013-08-14 15:20:38',4,110,'23104','75.50(61.40) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(695,'2013-08-14 15:20:38',4,110,'23091','102.23(81.78) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,la',3,''),(696,'2013-08-14 15:20:38',4,110,'23078','70.50(56.40) for 900 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,wei',3,''),(697,'2013-08-14 15:20:38',4,110,'23209','276.88(222.50) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination:',3,''),(698,'2013-08-14 15:20:38',4,110,'23196','271.88(217.50) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: matt,lamination:',3,''),(699,'2013-08-14 15:20:38',4,110,'23183','187.50(150.00) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 170x55,lamination: none,weight: 350',3,''),(700,'2013-08-14 15:20:38',4,110,'23170','140.94(113.75) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,',3,''),(701,'2013-08-14 15:20:38',4,110,'23157','98.75(80.00) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,we',3,''),(702,'2013-08-14 15:20:38',4,110,'23144','135.94(108.75) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: matt,',3,''),(703,'2013-08-14 15:20:38',4,110,'23131','93.75(75.00) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ds,size: 90x55,size: 85x55,lamination: none,we',3,''),(704,'2013-08-14 15:20:38',4,110,'23118','113.75(92.00) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,l',3,''),(705,'2013-08-14 15:20:38',4,110,'23105','80.00(65.00) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,we',3,''),(706,'2013-08-14 15:20:38',4,110,'23092','108.75(87.00) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: matt,l',3,''),(707,'2013-08-14 15:20:38',4,110,'23079','75.00(60.00) for 1000 units of Business Card (stock: recycled,stock: gloss,stock: silk,stock: matt,orientation: landscape,orientation: portraint,printed: ss,size: 90x55,size: 85x55,lamination: none,we',3,''),(708,'2013-08-14 15:39:27',4,30,'67','Digital Printed Vinyl',1,''),(709,'2013-08-14 15:39:48',4,30,'67','Digital Printed Vinyl',2,'Changed product_options.'),(710,'2013-08-15 07:34:54',4,40,'59','Orientation',2,'Changed name.'),(711,'2013-08-16 22:44:11',10,87,'42','Basket #15, Product #17, quantity 500',3,''),(712,'2013-08-16 22:44:11',10,87,'40','Basket #14, Product #17, quantity 1000',3,''),(713,'2013-08-16 22:44:11',10,87,'39','Basket #19, Product #17, quantity 100',3,''),(714,'2013-08-16 22:44:11',10,87,'38','Basket #18, Product #17, quantity 250',3,''),(715,'2013-08-16 22:44:11',10,87,'28','Basket #16, Product #19, quantity 1',3,''),(716,'2013-08-16 22:44:11',10,87,'27','Basket #3, Product #17, quantity 100',3,''),(717,'2013-08-16 22:44:11',10,87,'26','Basket #1, Product #17, quantity 700',3,''),(718,'2013-08-16 22:44:59',10,116,'31','0. Cover as dropdown in Product Options',3,''),(719,'2013-08-16 22:44:59',10,116,'29','0. binding as thumbnail in Product Options',3,''),(720,'2013-08-16 22:44:59',10,116,'28','0. back-cover as thumbnail in Product Options',3,''),(721,'2013-08-16 22:44:59',10,116,'27','0. front-cover as thumbnail in Product Options',3,''),(722,'2013-08-16 22:44:59',10,116,'26','0. pages as thumbnail in Product Options',3,''),(723,'2013-08-16 22:44:59',10,116,'22','0. print-stock as thumbnail in Product Options',3,''),(724,'2013-08-16 22:44:59',10,116,'19','0. location as thumbnail in Product Options',3,''),(725,'2013-08-16 22:44:59',10,116,'30','1. printed as thumbnail in Product Options',3,''),(726,'2013-08-16 22:44:59',10,116,'24','2. size as thumbnail in Product Options',3,''),(727,'2013-08-16 22:44:59',10,116,'23','3. Orientation as thumbnail in Product Options',3,''),(728,'2013-08-16 22:44:59',10,116,'20','4. stock as thumbnail in Product Options',3,''),(729,'2013-08-16 22:44:59',10,116,'21','5. weight as thumbnail in Product Options',3,''),(730,'2013-08-16 22:45:00',10,116,'25','6. lamination as thumbnail in Product Options',3,''),(731,'2013-08-16 22:45:00',10,116,'32','7. finish as thumbnail in Product Options',3,''),(732,'2013-08-16 22:45:00',10,116,'17','8. fold as dropdown in Finishing',3,''),(733,'2013-08-16 22:45:38',10,114,'210','stock: clear-gloss-vinyl',3,''),(734,'2013-08-16 22:45:38',10,114,'209','stock: white-matt-vinyl',3,''),(735,'2013-08-16 22:45:38',10,114,'208','stock: white-gloss-vinyl',3,''),(736,'2013-08-16 22:45:38',10,114,'201','stock: backlit-film',3,''),(737,'2013-08-16 22:45:38',10,114,'196','stock: 08mm-vehicle-grade-vinyl',3,''),(738,'2013-08-16 22:45:38',10,114,'189','stock: grey',3,''),(739,'2013-08-16 22:45:38',10,114,'188','stock: silver',3,''),(740,'2013-08-16 22:45:38',10,114,'182','stock: fine-linen',3,''),(741,'2013-08-16 22:45:38',10,114,'181','stock: tyvek',3,''),(742,'2013-08-16 22:45:38',10,114,'179','stock: blue-back',3,''),(743,'2013-08-16 22:45:38',10,114,'178','stock: satin',3,''),(744,'2013-08-16 22:45:38',10,114,'176','stock: photo-gloss',3,''),(745,'2013-08-16 22:45:38',10,114,'175','stock: photo-satin',3,''),(746,'2013-08-16 22:45:38',10,114,'36','stock: recycled',3,''),(747,'2013-08-16 22:45:38',10,114,'19','stock: uncoated',3,''),(748,'2013-08-16 22:45:38',10,114,'18','stock: gloss',3,''),(749,'2013-08-16 22:45:38',10,114,'17','stock: silk',3,''),(750,'2013-08-16 22:45:38',10,114,'16','stock: matt',3,''),(751,'2013-08-16 22:45:38',10,114,'15','stock: 4mm',3,''),(752,'2013-08-16 22:45:38',10,114,'1','stock: 3mm',3,''),(753,'2013-08-16 22:45:38',10,114,'202','Orientation: portraint',3,''),(754,'2013-08-16 22:45:38',10,114,'169','Orientation: square',3,''),(755,'2013-08-16 22:45:38',10,114,'3','Orientation: landscape',3,''),(756,'2013-08-16 22:45:38',10,114,'2','Orientation: portrait',3,''),(757,'2013-08-16 22:45:38',10,114,'5','location: outdoor',3,''),(758,'2013-08-16 22:45:38',10,114,'4','location: indoor',3,''),(759,'2013-08-16 22:45:38',10,114,'198','print-stock: lightstop',3,''),(760,'2013-08-16 22:45:38',10,114,'151','print-stock: pvc',3,''),(761,'2013-08-16 22:45:38',10,114,'75','print-stock: fabric-banner',3,''),(762,'2013-08-16 22:45:38',10,114,'74','print-stock: mesh-banner',3,''),(763,'2013-08-16 22:45:38',10,114,'69','print-stock: pvc-banner',3,''),(764,'2013-08-16 22:45:38',10,114,'7','print-stock: sa-vinyl',3,''),(765,'2013-08-16 22:45:38',10,114,'6','print-stock: sa-polyprop',3,''),(766,'2013-08-16 22:45:38',10,114,'9','printed: ds',3,''),(767,'2013-08-16 22:45:38',10,114,'8','printed: ss',3,''),(768,'2013-08-16 22:45:38',10,114,'197','size: 630',3,''),(769,'2013-08-16 22:45:38',10,114,'187','size: 210x99',3,''),(770,'2013-08-16 22:45:38',10,114,'186','size: 6ftx4ft',3,''),(771,'2013-08-16 22:45:38',10,114,'185','size: 60x40',3,''),(772,'2013-08-16 22:45:38',10,114,'184','size: 40x30',3,''),(773,'2013-08-16 22:45:38',10,114,'183','size: 30x20',3,''),(774,'2013-08-16 22:45:38',10,114,'171','size: 148x148',3,''),(775,'2013-08-16 22:45:38',10,114,'170','size: 210x210',3,''),(776,'2013-08-16 22:45:38',10,114,'168','size: a6',3,''),(777,'2013-08-16 22:45:38',10,114,'167','size: dl',3,''),(778,'2013-08-16 22:45:38',10,114,'165','size: large',3,''),(779,'2013-08-16 22:45:38',10,114,'164','size: small',3,''),(780,'2013-08-16 22:45:38',10,114,'163','size: 3000x1000',3,''),(781,'2013-08-16 22:45:38',10,114,'162','size: 2000x1000',3,''),(782,'2013-08-16 22:45:38',10,114,'161','size: 650-800x1200-2000',3,''),(783,'2013-08-16 22:45:38',10,114,'160','size: 4x3',3,''),(784,'2013-08-16 22:45:38',10,114,'153','size: 3x3',3,''),(785,'2013-08-16 22:45:38',10,114,'150','size: 800x2000',3,''),(786,'2013-08-16 22:45:38',10,114,'149','size: 1000',3,''),(787,'2013-08-16 22:45:38',10,114,'148','size: 800',3,''),(788,'2013-08-16 22:45:38',10,114,'133','size: 800x600',3,''),(789,'2013-08-16 22:45:38',10,114,'131','size: 1000x1200',3,''),(790,'2013-08-16 22:45:38',10,114,'128','size: 1220x2440',3,''),(791,'2013-08-16 22:45:38',10,114,'127','size: 1000x2440',3,''),(792,'2013-08-16 22:45:38',10,114,'126','size: 1220x2000',3,''),(793,'2013-08-16 22:45:38',10,114,'125','size: 1000x2000',3,''),(794,'2013-08-16 22:45:38',10,114,'124','size: 1220x1600',3,''),(795,'2013-08-16 22:45:38',10,114,'123','size: 1000x1600',3,''),(796,'2013-08-16 22:45:38',10,114,'122','size: 1220x1220',3,''),(797,'2013-08-16 22:45:38',10,114,'121','size: 1000x1220',3,''),(798,'2013-08-16 22:45:38',10,114,'120','size: 600x1220',3,''),(799,'2013-08-16 22:45:38',10,114,'119','size: 300x1220',3,''),(800,'2013-08-16 22:45:38',10,114,'118','size: 1220x841',3,''),(801,'2013-08-16 22:45:38',10,114,'117','size: 1000x841',3,''),(802,'2013-08-16 22:45:38',10,114,'116','size: 1220x600',3,''),(803,'2013-08-16 22:45:38',10,114,'115','size: 1000x600',3,''),(804,'2013-08-16 22:45:38',10,114,'114','size: 420x1220',3,''),(805,'2013-08-16 22:45:38',10,114,'113','size: 1000x420',3,''),(806,'2013-08-16 22:45:38',10,114,'109','size: 1200x2440',3,''),(807,'2013-08-16 22:45:38',10,114,'108','size: 900x2440',3,''),(808,'2013-08-16 22:45:38',10,114,'107','size: 600x2440',3,''),(809,'2013-08-16 22:45:38',10,114,'106','size: 300x2440',3,''),(810,'2013-08-16 22:45:38',10,114,'105','size: 1200x2000',3,''),(811,'2013-08-16 22:45:38',10,114,'104','size: 900x2000',3,''),(812,'2013-08-16 22:45:38',10,114,'103','size: 600x2000',3,''),(813,'2013-08-16 22:45:38',10,114,'102','size: 300x2000',3,''),(814,'2013-08-16 22:45:38',10,114,'101','size: 1200x1600',3,''),(815,'2013-08-16 22:45:38',10,114,'100','size: 900x1600',3,''),(816,'2013-08-16 22:45:38',10,114,'99','size: 600x1600',3,''),(817,'2013-08-16 22:45:38',10,114,'98','size: 300x1600',3,''),(818,'2013-08-16 22:45:38',10,114,'97','size: 1200x1200',3,''),(819,'2013-08-16 22:45:38',10,114,'96','size: 900x1200',3,''),(820,'2013-08-16 22:45:39',10,114,'95','size: 600x1200',3,''),(821,'2013-08-16 22:45:39',10,114,'94','size: 300x1200',3,''),(822,'2013-08-16 22:45:39',10,114,'93','size: 1200x841',3,''),(823,'2013-08-16 22:45:39',10,114,'92','size: 900x841',3,''),(824,'2013-08-16 22:45:39',10,114,'91','size: 600x841',3,''),(825,'2013-08-16 22:45:39',10,114,'90','size: 300x841',3,''),(826,'2013-08-16 22:45:39',10,114,'89','size: 1200x600',3,''),(827,'2013-08-16 22:45:39',10,114,'88','size: 900x600',3,''),(828,'2013-08-16 22:45:39',10,114,'87','size: 600x600',3,''),(829,'2013-08-16 22:45:39',10,114,'86','size: 300x600',3,''),(830,'2013-08-16 22:45:39',10,114,'85','size: 420x1200',3,''),(831,'2013-08-16 22:45:39',10,114,'84','size: 900x420',3,''),(832,'2013-08-16 22:45:39',10,114,'83','size: 600x420',3,''),(833,'2013-08-16 22:45:39',10,114,'82','size: 300x420',3,''),(834,'2013-08-16 22:45:39',10,114,'81','size: 8ftx4ft',3,''),(835,'2013-08-16 22:45:39',10,114,'80','size: a1',3,''),(836,'2013-08-16 22:45:39',10,114,'79','size: a2',3,''),(837,'2013-08-16 22:45:39',10,114,'78','size: a3',3,''),(838,'2013-08-16 22:45:39',10,114,'52','size: 170x55',3,''),(839,'2013-08-16 22:45:39',10,114,'48','size: 85x55',3,''),(840,'2013-08-16 22:45:39',10,114,'45','size: a5',3,''),(841,'2013-08-16 22:45:39',10,114,'44','size: custom',3,''),(842,'2013-08-16 22:45:39',10,114,'43','size: 90x55',3,''),(843,'2013-08-16 22:45:39',10,114,'42','size: 80x55',3,''),(844,'2013-08-16 22:45:39',10,114,'33','size: a4',3,''),(845,'2013-08-16 22:45:39',10,114,'10','size: a0',3,''),(846,'2013-08-16 22:45:39',10,114,'14','lamination: none',3,''),(847,'2013-08-16 22:45:39',10,114,'13','lamination: anti-scratch',3,''),(848,'2013-08-16 22:45:39',10,114,'12','lamination: matt',3,''),(849,'2013-08-16 22:45:39',10,114,'11','lamination: gloss',3,''),(850,'2013-08-16 22:45:39',10,114,'199','weight: 440gsm',3,''),(851,'2013-08-16 22:45:39',10,114,'180','weight: 75',3,''),(852,'2013-08-16 22:45:39',10,114,'177','weight: 260',3,''),(853,'2013-08-16 22:45:39',10,114,'172','weight: 90',3,''),(854,'2013-08-16 22:45:39',10,114,'147','weight: 195mic',3,''),(855,'2013-08-16 22:45:39',10,114,'73','weight: 360',3,''),(856,'2013-08-16 22:45:39',10,114,'66','weight: 440',3,''),(857,'2013-08-16 22:45:39',10,114,'56','weight: 135',3,''),(858,'2013-08-16 22:45:39',10,114,'55','weight: 100',3,''),(859,'2013-08-16 22:45:39',10,114,'54','weight: 115',3,''),(860,'2013-08-16 22:45:39',10,114,'47','weight: 350',3,''),(861,'2013-08-16 22:45:39',10,114,'39','weight: 300',3,''),(862,'2013-08-16 22:45:39',10,114,'25','weight: 250',3,''),(863,'2013-08-16 22:45:39',10,114,'24','weight: 200',3,''),(864,'2013-08-16 22:45:39',10,114,'23','weight: 170',3,''),(865,'2013-08-16 22:45:39',10,114,'22','weight: 160',3,''),(866,'2013-08-16 22:45:39',10,114,'21','weight: 150',3,''),(867,'2013-08-16 22:45:39',10,114,'20','weight: 120',3,''),(868,'2013-08-16 22:45:39',10,114,'136','binding: saddle-stitched',3,''),(869,'2013-08-16 22:45:39',10,114,'27','binding: top',3,''),(870,'2013-08-16 22:45:39',10,114,'26','binding: left',3,''),(871,'2013-08-16 22:45:39',10,114,'57','back-cover: black-board',3,''),(872,'2013-08-16 22:45:39',10,114,'29','back-cover: white',3,''),(873,'2013-08-16 22:45:39',10,114,'28','back-cover: black',3,''),(874,'2013-08-16 22:45:39',10,114,'200','pages: 10-20',3,''),(875,'2013-08-16 22:45:39',10,114,'193','pages: 20-nov',3,''),(876,'2013-08-16 22:45:39',10,114,'192','pages: 10-jan',3,''),(877,'2013-08-16 22:45:39',10,114,'141','pages: 32',3,''),(878,'2013-08-16 22:45:39',10,114,'140','pages: 28',3,''),(879,'2013-08-16 22:45:39',10,114,'139','pages: 24',3,''),(880,'2013-08-16 22:45:39',10,114,'138','pages: 20',3,''),(881,'2013-08-16 22:45:39',10,114,'65','pages: 61-70',3,''),(882,'2013-08-16 22:45:39',10,114,'64','pages: 51-60',3,''),(883,'2013-08-16 22:45:39',10,114,'63','pages: 41-50',3,''),(884,'2013-08-16 22:45:39',10,114,'62','pages: 31-40',3,''),(885,'2013-08-16 22:45:39',10,114,'61','pages: 21-30',3,''),(886,'2013-08-16 22:45:39',10,114,'60','pages: 11-20',3,''),(887,'2013-08-16 22:45:39',10,114,'59','pages: 1-10',3,''),(888,'2013-08-16 22:45:39',10,114,'35','pages: 16',3,''),(889,'2013-08-16 22:45:39',10,114,'34','pages: 12',3,''),(890,'2013-08-16 22:45:39',10,114,'30','pages: 8',3,''),(891,'2013-08-16 22:45:39',10,114,'144','front-cover: uncoated',3,''),(892,'2013-08-16 22:45:39',10,114,'143','front-cover: gloss',3,''),(893,'2013-08-16 22:45:39',10,114,'142','front-cover: silk',3,''),(894,'2013-08-16 22:45:39',10,114,'58','front-cover: clear',3,''),(895,'2013-08-16 22:45:39',10,114,'32','front-cover: none',3,''),(896,'2013-08-16 22:45:39',10,114,'31','front-cover: 250gsm',3,''),(897,'2013-08-16 22:45:39',10,114,'174','finish: encapsulation',3,''),(898,'2013-08-16 22:45:39',10,114,'173','finish: lamination',3,''),(899,'2013-08-16 22:45:39',10,114,'68','finish: eyelet',3,''),(900,'2013-08-16 22:45:39',10,114,'67','finish: hem',3,''),(901,'2013-08-16 22:45:39',10,114,'53','finish: half',3,''),(902,'2013-08-16 22:45:39',10,114,'50','finish: round-corners',3,''),(903,'2013-08-16 22:45:39',10,114,'49','finish: none',3,''),(904,'2013-08-16 22:45:39',10,114,'38','finish: foil',3,''),(905,'2013-08-16 22:45:39',10,114,'37','finish: corners',3,''),(906,'2013-08-16 22:45:39',10,114,'51','fold: half',3,''),(907,'2013-08-16 22:45:39',10,114,'41','fold: single',3,''),(908,'2013-08-16 22:45:39',10,114,'40','fold: none',3,''),(909,'2013-08-16 22:45:39',10,114,'195','options: future-implementation',3,''),(910,'2013-08-16 22:45:39',10,114,'190','options: contour-cut',3,''),(911,'2013-08-16 22:45:39',10,114,'166','options: rounded-top',3,''),(912,'2013-08-16 22:45:39',10,114,'159','options: included-graphics',3,''),(913,'2013-08-16 22:45:39',10,114,'158','options: pop-up',3,''),(914,'2013-08-16 22:45:39',10,114,'157','options: withcase',3,''),(915,'2013-08-16 22:45:39',10,114,'156','options: curved',3,''),(916,'2013-08-16 22:45:39',10,114,'155','options: no-graphics',3,''),(917,'2013-08-16 22:45:39',10,114,'154','options: pop-ip',3,''),(918,'2013-08-16 22:45:39',10,114,'152','options: static',3,''),(919,'2013-08-16 22:45:39',10,114,'146','options: self',3,''),(920,'2013-08-16 22:45:39',10,114,'145','options: 250gsm-cover',3,''),(921,'2013-08-16 22:45:39',10,114,'137','options: self-cover',3,''),(922,'2013-08-16 22:45:39',10,114,'135','options: 10mm-sponge',3,''),(923,'2013-08-16 22:45:39',10,114,'134','options: 5mm-sponge',3,''),(924,'2013-08-16 22:45:39',10,114,'132','options: 10mm-correx',3,''),(925,'2013-08-16 22:45:39',10,114,'130','options: 4mm-correx',3,''),(926,'2013-08-16 22:45:39',10,114,'129','options: 4mm-acm',3,''),(927,'2013-08-16 22:45:39',10,114,'112','options: 3mm-acm',3,''),(928,'2013-08-16 22:45:39',10,114,'111','options: 5mm-foamex',3,''),(929,'2013-08-16 22:45:39',10,114,'110','options: 10mm-foamex',3,''),(930,'2013-08-16 22:45:39',10,114,'77','options: 3mm-foamex',3,''),(931,'2013-08-16 22:45:39',10,114,'76','options: 2mm-foamex',3,''),(932,'2013-08-16 22:45:39',10,114,'72','options: futureimplementation',3,''),(933,'2013-08-16 22:45:39',10,114,'71','options: vektor',3,''),(934,'2013-08-16 22:45:39',10,114,'70','options: phg',3,''),(935,'2013-08-16 22:45:39',10,114,'207','glue: clear-glue-permanent',3,''),(936,'2013-08-16 22:45:39',10,114,'206','glue: grey-glue-removable',3,''),(937,'2013-08-16 22:45:39',10,114,'205','glue: white-glue-removable',3,''),(938,'2013-08-16 22:45:39',10,114,'204','glue: grey-glue-permanent',3,''),(939,'2013-08-16 22:45:39',10,114,'203','glue: white-glue-permanent',3,''),(940,'2013-08-16 22:47:57',10,40,'75','package',3,''),(941,'2013-08-16 22:47:57',10,40,'74','glue',3,''),(942,'2013-08-16 22:47:57',10,40,'73','options',3,''),(943,'2013-08-16 22:47:57',10,40,'72','Cover',3,''),(944,'2013-08-16 22:47:57',10,40,'71','fold',3,''),(945,'2013-08-16 22:47:57',10,40,'70','finish',3,''),(946,'2013-08-16 22:47:57',10,40,'69','front-cover',3,''),(947,'2013-08-16 22:47:57',10,40,'68','pages',3,''),(948,'2013-08-16 22:47:57',10,40,'67','back-cover',3,''),(949,'2013-08-16 22:47:57',10,40,'66','binding',3,''),(950,'2013-08-16 22:47:57',10,40,'65','weight',3,''),(951,'2013-08-16 22:47:57',10,40,'64','lamination',3,''),(952,'2013-08-16 22:47:57',10,40,'63','size',3,''),(953,'2013-08-16 22:47:57',10,40,'62','printed',3,''),(954,'2013-08-16 22:47:57',10,40,'61','print-stock',3,''),(955,'2013-08-16 22:47:57',10,40,'60','location',3,''),(956,'2013-08-16 22:47:57',10,40,'59','Orientation',3,''),(957,'2013-08-16 22:47:57',10,40,'58','stock',3,''),(958,'2013-08-16 22:52:07',10,114,'218','stock: recycled',3,''),(959,'2013-08-16 22:52:07',10,114,'217','stock: gloss',3,''),(960,'2013-08-16 22:52:07',10,114,'216','stock: silk',3,''),(961,'2013-08-16 22:52:07',10,114,'215','stock: matt',3,''),(962,'2013-08-16 22:52:07',10,114,'214','size: 90x55',3,''),(963,'2013-08-16 22:52:07',10,114,'211','weight: 300',3,''),(964,'2013-08-16 22:52:07',10,114,'220','finish: foil',3,''),(965,'2013-08-16 22:52:07',10,114,'219','finish: corners',3,''),(966,'2013-08-16 22:52:07',10,114,'213','fold: single',3,''),(967,'2013-08-16 22:52:07',10,114,'212','fold: none',3,''),(968,'2013-08-16 22:52:07',10,114,'225','package: 300',3,''),(969,'2013-08-16 22:52:07',10,114,'224','package: 100',3,''),(970,'2013-08-16 22:52:07',10,114,'223','package: 50',3,''),(971,'2013-08-16 22:52:07',10,114,'222','package: 30',3,''),(972,'2013-08-16 22:52:07',10,114,'221','package: 10',3,''),(973,'2013-08-16 22:52:27',10,40,'75','package',3,''),(974,'2013-08-16 22:52:27',10,40,'74','glue',3,''),(975,'2013-08-16 22:52:27',10,40,'73','options',3,''),(976,'2013-08-16 22:52:27',10,40,'72','Cover',3,''),(977,'2013-08-16 22:52:27',10,40,'71','fold',3,''),(978,'2013-08-16 22:52:27',10,40,'70','finish',3,''),(979,'2013-08-16 22:52:27',10,40,'69','front-cover',3,''),(980,'2013-08-16 22:52:27',10,40,'68','pages',3,''),(981,'2013-08-16 22:52:27',10,40,'67','back-cover',3,''),(982,'2013-08-16 22:52:27',10,40,'66','binding',3,''),(983,'2013-08-16 22:52:27',10,40,'65','weight',3,''),(984,'2013-08-16 22:52:27',10,40,'64','lamination',3,''),(985,'2013-08-16 22:52:27',10,40,'63','size',3,''),(986,'2013-08-16 22:52:27',10,40,'62','printed',3,''),(987,'2013-08-16 22:52:27',10,40,'61','print-stock',3,''),(988,'2013-08-16 22:52:27',10,40,'60','location',3,''),(989,'2013-08-16 22:52:27',10,40,'59','Orientation',3,''),(990,'2013-08-16 22:52:27',10,40,'58','stock',3,''),(991,'2013-08-16 22:56:39',10,40,'75','package',3,''),(992,'2013-08-16 22:56:39',10,40,'74','glue',3,''),(993,'2013-08-16 22:56:39',10,40,'73','options',3,''),(994,'2013-08-16 22:56:39',10,40,'72','Cover',3,''),(995,'2013-08-16 22:56:39',10,40,'71','fold',3,''),(996,'2013-08-16 22:56:39',10,40,'70','finish',3,''),(997,'2013-08-16 22:56:39',10,40,'69','front-cover',3,''),(998,'2013-08-16 22:56:39',10,40,'68','pages',3,''),(999,'2013-08-16 22:56:39',10,40,'67','back-cover',3,''),(1000,'2013-08-16 22:56:39',10,40,'66','binding',3,''),(1001,'2013-08-16 22:56:39',10,40,'65','weight',3,''),(1002,'2013-08-16 22:56:39',10,40,'64','lamination',3,''),(1003,'2013-08-16 22:56:39',10,40,'63','size',3,''),(1004,'2013-08-16 22:56:39',10,40,'62','printed',3,''),(1005,'2013-08-16 22:56:39',10,40,'61','print-stock',3,''),(1006,'2013-08-16 22:56:39',10,40,'60','location',3,''),(1007,'2013-08-16 22:56:39',10,40,'59','Orientation',3,''),(1008,'2013-08-16 22:56:39',10,40,'58','stock',3,''),(1009,'2013-08-16 22:58:51',10,116,'33','0. weight as thumbnail in Product Options',1,''),(1010,'2013-08-16 22:58:56',10,116,'34','0. fold as thumbnail in Product Options',1,''),(1011,'2013-08-16 22:59:00',10,116,'35','0. size as thumbnail in Product Options',1,''),(1012,'2013-08-16 22:59:04',10,116,'36','0. stock as thumbnail in Product Options',1,''),(1013,'2013-08-16 22:59:09',10,116,'37','0. finish as thumbnail in Product Options',1,''),(1014,'2013-08-16 22:59:17',10,116,'38','0. package as thumbnail in Product Options',1,''),(1015,'2013-08-16 22:59:32',10,116,'37','1. finish as thumbnail in Product Options',2,'Changed position.'),(1016,'2013-08-16 22:59:38',10,116,'36','2. stock as thumbnail in Product Options',2,'Changed position.'),(1017,'2013-08-16 22:59:43',10,116,'35','3. size as thumbnail in Product Options',2,'Changed position.'),(1018,'2013-08-16 22:59:50',10,116,'34','4. fold as thumbnail in Product Options',2,'Changed position.'),(1019,'2013-08-16 22:59:57',10,116,'33','5. weight as thumbnail in Product Options',2,'Changed position.'),(1020,'2013-08-16 23:05:31',10,114,'240','package: 300',2,'Changed caption.'),(1021,'2013-08-16 23:05:43',10,114,'239','package: 100',2,'Changed caption.'),(1022,'2013-08-16 23:06:03',10,114,'238','package: 50',2,'Changed caption.'),(1023,'2013-08-16 23:06:10',10,114,'237','package: 30',2,'Changed caption.'),(1024,'2013-08-16 23:06:17',10,114,'236','package: 10',2,'Changed caption.'),(1025,'2013-08-16 23:25:51',10,120,'3','200 korteliu by Developer2',3,''),(1026,'2013-08-16 23:25:51',10,120,'2','booklet-1 by Developer2',3,''),(1027,'2013-08-16 23:25:51',10,120,'1','test by Developer2',3,''),(1028,'2013-08-17 09:38:52',1,3,'14','Data',2,'Changed password and first_name.'),(1029,'2013-08-19 14:10:53',14,121,'1','Globals object',1,''),(1030,'2013-08-21 07:39:03',1,116,'38','0. package as thumbnail in Product Options',3,''),(1031,'2013-08-23 12:12:48',1,3,'13','Artwork',3,''),(1032,'2013-08-23 12:12:48',1,3,'16','TWXVXlGmKTsNd3PJmeDysC04jTE8uH',3,''),(1033,'2013-08-23 12:12:48',1,3,'15','wp8yjUYLWo4DFxf4KvkHIyMMtEMIi5',3,''),(1034,'2013-08-23 12:14:06',1,3,'11','Zaki',2,'Changed password.'),(1035,'2013-08-23 12:57:02',1,2,'1','Trade',2,'Changed permissions.'),(1036,'2013-08-23 15:07:24',1,3,'11','Zaki',2,'Changed password.'),(1037,'2013-08-23 15:08:42',1,3,'17','Fabrizio',1,''),(1038,'2013-08-23 15:09:42',1,3,'17','Fabrizio',2,'Changed password, first_name, email, is_superuser and user_permissions.'),(1039,'2013-08-23 15:09:53',1,3,'17','Fabrizio',2,'Changed password and is_staff.'),(1040,'2013-08-23 15:12:42',17,115,'7','0. Option',1,''),(1041,'2013-08-25 17:44:27',10,87,'47','Basket #13, Product #17, quantity 100',3,''),(1042,'2013-08-25 17:44:27',10,87,'46','Basket #13, Product #17, quantity 100',3,''),(1043,'2013-08-25 17:44:27',10,87,'45','Basket #13, Product #17, quantity 100',3,''),(1044,'2013-08-25 17:44:27',10,87,'43','Basket #17, Product #17, quantity 2',3,''),(1045,'2013-08-25 21:35:49',1,3,'18','Junior',1,''),(1046,'2013-08-25 21:36:14',1,3,'18','Junior',3,''),(1047,'2013-08-26 17:49:16',10,116,'39','0. diameter as thumbnail in Product Options',1,''),(1048,'2013-08-26 17:50:15',10,27,'13','Stickers',2,'Changed track_stock.'),(1049,'2013-08-26 18:13:34',10,116,'40','0. package as thumbnail in Product Options',1,''),(1050,'2013-08-26 18:13:43',10,116,'41','0. orientation as thumbnail in Product Options',1,''),(1051,'2013-08-26 18:13:48',10,116,'42','0. printed as thumbnail in Product Options',1,''),(1052,'2013-08-26 18:13:52',10,116,'43','0. lamination as thumbnail in Product Options',1,''),(1053,'2013-08-26 18:13:57',10,116,'44','0. options as thumbnail in Product Options',1,''),(1054,'2013-08-26 18:14:02',10,116,'45','0. print-stock as thumbnail in Product Options',1,''),(1055,'2013-08-26 18:14:06',10,116,'46','0. binding as thumbnail in Product Options',1,''),(1056,'2013-08-26 18:14:10',10,116,'47','0. pages as thumbnail in Product Options',1,''),(1057,'2013-08-26 18:14:14',10,116,'48','0. front-cover as thumbnail in Product Options',1,''),(1058,'2013-08-26 18:14:19',10,116,'49','0. back-cover as thumbnail in Product Options',1,''),(1059,'2013-08-26 18:14:24',10,116,'50','0. location as thumbnail in Product Options',1,''),(1060,'2013-08-26 18:14:30',10,116,'51','0. min_linear_meter as thumbnail in Product Options',1,''),(1061,'2013-08-26 18:14:34',10,116,'52','0. items_per_pack as thumbnail in Product Options',1,''),(1062,'2013-08-26 18:15:05',10,87,'49','Basket #10, Product #79, quantity 134',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'flat page','flatpages','flatpage'),(8,'log entry','admin','logentry'),(9,'migration history','south','migrationhistory'),(10,'Product Review','reviews','productreview'),(11,'Vote','reviews','vote'),(12,'kv store','thumbnail','kvstore'),(13,'csv import','csvimport','csvimport'),(14,'import model','csvimport','importmodel'),(15,'bookmark','menu','bookmark'),(16,'dashboard preferences','dashboard','dashboardpreferences'),(17,'account type','accounts','accounttype'),(18,'account','accounts','account'),(19,'transfer','accounts','transfer'),(20,'transaction','accounts','transaction'),(21,'IP address record','accounts','ipaddressrecord'),(22,'Email','customer','email'),(23,'Communication event type','customer','communicationeventtype'),(24,'notification','customer','notification'),(25,'product alert','customer','productalert'),(26,'Product Recommendation','catalogue','productrecommendation'),(27,'Product Class','catalogue','productclass'),(28,'Category','catalogue','category'),(29,'Product Category','catalogue','productcategory'),(30,'Product','catalogue','product'),(31,'Contributor Role','catalogue','contributorrole'),(32,'Contributor','catalogue','contributor'),(33,'Product Contributor','catalogue','productcontributor'),(34,'Product Attribute','catalogue','productattribute'),(35,'Product Attribute Value','catalogue','productattributevalue'),(36,'Attribute Option Group','catalogue','attributeoptiongroup'),(37,'Attribute Option','catalogue','attributeoption'),(38,'Attribute Entity','catalogue','attributeentity'),(39,'Attribute Entity Type','catalogue','attributeentitytype'),(40,'Option','catalogue','option'),(41,'Product Image','catalogue','productimage'),(42,'Product record','analytics','productrecord'),(43,'User Record','analytics','userrecord'),(44,'Basket','analytics','userproductview'),(45,'user search','analytics','usersearch'),(46,'Fulfillment partner','partner','partner'),(47,'Stock Record','partner','stockrecord'),(48,'Stock Alert','partner','stockalert'),(49,'User address','address','useraddress'),(50,'Country','address','country'),(51,'Payment Event Quantity','order','paymenteventquantity'),(52,'Shipping Event Quantity','order','shippingeventquantity'),(53,'Order','order','order'),(54,'Order Note','order','ordernote'),(55,'Communication Event','order','communicationevent'),(56,'Shipping address','order','shippingaddress'),(57,'billing address','order','billingaddress'),(58,'Order Line','order','line'),(59,'Line Price','order','lineprice'),(60,'Line Attribute','order','lineattribute'),(61,'Shipping Event','order','shippingevent'),(62,'Shipping Event Type','order','shippingeventtype'),(63,'Payment Event','order','paymentevent'),(64,'Payment Event Type','order','paymenteventtype'),(65,'Order Discount','order','orderdiscount'),(66,'Order and Item Charge','shipping','orderanditemcharges'),(67,'Weight-based Shipping Method','shipping','weightbased'),(68,'Weight Band','shipping','weightband'),(69,'Conditional offer','offer','conditionaloffer'),(70,'Condition','offer','condition'),(71,'Benefit','offer','benefit'),(72,'Range','offer','range'),(73,'Fixed price shipping benefit','offer','shippingfixedpricebenefit'),(74,'Coverage Condition','offer','coveragecondition'),(75,'Count Condition','offer','countcondition'),(76,'Value Condition','offer','valuecondition'),(77,'Multibuy discount benefit','offer','multibuydiscountbenefit'),(78,'Shipping percentage discount benefit','offer','shippingpercentagediscountbenefit'),(79,'shipping benefit','offer','shippingbenefit'),(80,'Shipping absolute discount benefit','offer','shippingabsolutediscountbenefit'),(81,'Percentage discount benefit','offer','percentagediscountbenefit'),(82,'Absolute discount benefit','offer','absolutediscountbenefit'),(83,'Fixed price benefit','offer','fixedpricebenefit'),(84,'Voucher','voucher','voucher'),(85,'Voucher Application','voucher','voucherapplication'),(86,'Basket','basket','basket'),(87,'Basket line','basket','line'),(88,'Line attribute','basket','lineattribute'),(89,'Transaction','payment','transaction'),(90,'Source','payment','source'),(91,'Source Type','payment','sourcetype'),(92,'Bankcard','payment','bankcard'),(93,'Range Product Uploaded File','ranges','rangeproductfileupload'),(94,'Page Promotion','promotions','pagepromotion'),(95,'Keyword Promotion','promotions','keywordpromotion'),(96,'Raw HTML','promotions','rawhtml'),(97,'Image','promotions','image'),(98,'Multi Image','promotions','multiimage'),(99,'Single Product','promotions','singleproduct'),(100,'Hand Picked Product List','promotions','handpickedproductlist'),(101,'Ordered Product','promotions','orderedproduct'),(102,'Automatic Product List','promotions','automaticproductlist'),(103,'Ordered Product List','promotions','orderedproductlist'),(104,'Tabbed Block','promotions','tabbedblock'),(105,'attribute option thumbnail','gap','attributeoptionthumbnail'),(106,'attribute option thumbnail','catalogue','attributeoptionthumbnail'),(107,'express transaction','paypal','expresstransaction'),(108,'payflow transaction','paypal','payflowtransaction'),(110,'price','pricelist','price'),(111,'job','jobs','job'),(112,'task','jobs','task'),(113,'stage','jobs','stage'),(114,'option choice','options','optionchoice'),(115,'option picker group','options','optionpickergroup'),(116,'option picker','options','optionpicker'),(117,'artwork item','options','artworkitem'),(118,'common task description','jobs','commontaskdescription'),(119,'line attachment','basket','lineattachment'),(120,'quote','quotes','quote'),(121,'Globals','globals','globals');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

DROP TABLE IF EXISTS `django_flatpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_a4b49ab` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
INSERT INTO `django_flatpage` VALUES (1,'/contact/','Contact Us','Contact Page',0,'',0),(2,'/corporate-policies/','Corporate Policies','',0,'',0),(3,'/services/','Services','',0,'',0),(4,'/about/','About Us','',0,'',0),(5,'/delivery/','Delivery','',0,'',0),(6,'/privacy-policy/','Privacy Policy','',0,'',0),(7,'/terms-and-conditions/','Terms and Conditions','',0,'',0),(8,'/returns/','Returns Policy','',0,'',0),(9,'/help/','Help','',0,'',0),(10,'/social-media-links/','Social Media Links','',0,'',0),(11,'/support/','Support','',0,'',0),(12,'/account-support/','My Account support','',0,'',0),(13,'/how-it-works/','How it works','',0,'',0);
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

DROP TABLE IF EXISTS `django_flatpage_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flatpage_id` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_dedefef8` (`flatpage_id`),
  KEY `django_flatpage_sites_6223029` (`site_id`),
  CONSTRAINT `flatpage_id_refs_id_c0e84f5a` FOREIGN KEY (`flatpage_id`) REFERENCES `django_flatpage` (`id`),
  CONSTRAINT `site_id_refs_id_4e3eeb57` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
INSERT INTO `django_flatpage_sites` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1);
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01224152b46621f040a5178c0c2221ac','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 04:32:10'),('01fdd39ae133e160ff3d79a6874eaadf','MmQzM2YwZDUyM2E1OWFjYzRjMTZmYjJkYTgyZmU2MzI5Mzk2OTFlZjqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQdjaG9pY2VzfXEDWAgAAABkaWFtZXRlcooCmAFzVQdwcm9kdWN0igFP\nVQhxdWFudGl0eUt4VQtjaG9pY2VfZGF0YX1xBFUEc2l6ZX1xBShVBXdpZHRocQZLAFUGaGVpZ2h0\ncQdLAHVzdVUNX2F1dGhfdXNlcl9pZIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVS5vc2Nhci5hcHBz\nLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNrZW5kdS4=\n','2013-09-12 14:46:43'),('02005c2e20e8810004e19cdb0b0d209f','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 14:23:48'),('0251ff426b9560607e984eef84fb149c','M2VkNDgyZGIyMjQ0NDY4MTk5ODY1ZDNiYjU0NGNkNDQ2MmZhNTRkNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQt1Lg==\n','2013-07-12 09:48:45'),('04d4e0fe1cb302dd2215ced49e814a9e','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 09:39:09'),('0574d91720e6386cf18f7a50c980ea4d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 05:20:30'),('05ccd0d5832323f03045d12aa69c3ee9','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 06:35:41'),('07a756921d4dd6bf00d2281c920711d9','YmFkMTAzZmQyZWRkNTZlMmJjMTQxMzU2ZDBhYzgzZDA4MzBmODNiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNr\nZW5kcQNVB29wdGlvbnNdVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-06-03 12:16:27'),('085c535e8f2e545f2e2e6e111229d066','OTNiODY3NGU4NDY5OTczMGM1MzI4ZTJkMDRjMWMxZmMyYzUyY2M2ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNr\nZW5kcQNVB29wdGlvbnNdVQ1fYXV0aF91c2VyX2lkcQSKAQR1Lg==\n','2013-06-07 13:57:11'),('08c8922b640dfc3b058de65939427446','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-05-29 06:26:39'),('0a3bcf8829a55bbca18b1bbc8339e3a5','OTZiZGQyNGRiNzFlN2JmMGQyN2IxZGQzYzQyZTk3ZDdkOTJiMjA0ZDqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc111Lg==\n','2013-05-29 13:20:02'),('0a527c8a14e91e8bce2a58efe11487c6','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-11 16:13:37'),('0ac8057cb5e23132b611c4478dbb4a0c','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 20:50:17'),('0c3722947df527f2269bacea5520c5c1','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-11 23:37:06'),('0c549ca33626e2bbad74ff7e2376615e','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-29 00:29:39'),('0dc6f4425be3368119f24e1123f4439a','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 22:42:13'),('0dc9e931837552fe3e9218983fc5bca7','MzMwOTZhMmEwNmZkZTE1ZGViNjYwMzBhZjdiNGNjMTAzMzM2OWRjNTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFUHcHJvZHVjdHEEigEPVQhxdWFudGl0eXEFSwBVC2N1c3RvbV9zaXpl\ncQZ9cQcoVQV3aWR0aHEISwBVBmhlaWdodHEJSwB1VQdjaG9pY2VzcQp9dXMu\n','2013-07-31 20:54:59'),('0dd6cab6883a6fe471f03aefd2ac6ce2','OWE2NTc2M2M3ZDEwNTkzZjkwY2U2Njg1ODI0N2QzNTVlM2UwNGRkNTqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZX1xBChVBXdpZHRocQVLAFUGaGVp\nZ2h0cQZLAHVzVQdwcm9kdWN0igERVQhxdWFudGl0eUsyVQdjaG9pY2VzfXEHKFgEAAAAZm9sZIoB\nKVgEAAAAc2l6ZYoBK1gGAAAAd2VpZ2h0igEnWAUAAABzdG9ja4oBEXV1VQ1fYXV0aF91c2VyX2lk\nigELVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9k\nZWxCYWNrZW5kdS4=\n','2013-08-12 11:19:58'),('0e2cef9021776faad988f6d85db5a393','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-09-06 07:04:59'),('0eae1e81ed37efaa149ba176766a6a23','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 14:57:23'),('117192ead78cfce5375b8ce998cf4a5d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-07 08:12:36'),('122f04fb1ac4b5e628ed8d63d35c633c','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-30 23:13:01'),('146a1abad2cbd0c77e9644300cbe6ede','NWMyMTAyZmIwYzgwZDVlNTNlNGIzMTQ1YjJhNDk1OWEyY2Q0NzY2ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==\n','2013-06-15 17:44:32'),('17229682087a67c90658d57b39d1323c','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 17:55:46'),('176698f4776ef8f5f2fb5629efcd1f59','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 04:01:45'),('18ab70225240ea0b5b9830fab0294d3d','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-24 14:50:57'),('18d41016a40292e7a2cba83aa5c1c232','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-24 08:41:51'),('18f22c471fc673217d82213b328d00a8','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-30 17:49:32'),('1991996c29595336953bcff8fd4f1a61','ZThmM2NjMzE2OWY3OGQ3MmYxYzM3MjVlYTM4OTY5NjU2OGRhZDljZjqAAn1xAShVDWNoZWNrb3V0\nX2RhdGF9cQJVCHNoaXBwaW5nfXEDKFULbWV0aG9kX2NvZGVVDWZyZWUtc2hpcHBpbmdVEm5ld19h\nZGRyZXNzX2ZpZWxkc31xBChVDHBob25lX251bWJlclgAAAAAVQpmaXJzdF9uYW1lWAMAAAB6YWVV\nCWxhc3RfbmFtZVgDAAAAYmVlVQV0aXRsZU5VB2NvdW50cnljZGphbmdvLmRiLm1vZGVscy5iYXNl\nCm1vZGVsX3VucGlja2xlCnEFY29zY2FyLmFwcHMuYWRkcmVzcy5tb2RlbHMKQ291bnRyeQpxBl1j\nZGphbmdvLmRiLm1vZGVscy5iYXNlCnNpbXBsZV9jbGFzc19mYWN0b3J5CnEHh1JxCH1xCShVDWlz\nb18zMTY2XzFfYTNxClgCAAAAdWtVDWlzb18zMTY2XzFfYTJxC1gCAAAAdWtVBG5hbWVxDFgCAAAA\ndWtVDmlzX2hpZ2hsaWdodGVkcQ2JVQ5wcmludGFibGVfbmFtZXEOWAIAAAB1a1UGX3N0YXRlcQ9j\nZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVsU3RhdGUKcRApgXERfXESKFUGYWRkaW5ncROJVQJk\nYnEUVQdkZWZhdWx0dWJVEmlzb18zMTY2XzFfbnVtZXJpY3EVSxZVE2lzX3NoaXBwaW5nX2NvdW50\ncnlxFoh1YlUFbm90ZXNYAAAAAFUFbGluZTRYEgAAANCn0LXRgNC10L/QvtCy0LXRhlUFbGluZTNY\nAAAAAFUFbGluZTJYAAAAAFUFbGluZTFYEAAAANCaLiDQkdC10LvQvtCy0LBVBXN0YXRlWBYAAADQ\nktC+0LvQvtCz0L7QtNGB0LrQsNGPVQhwb3N0Y29kZVgGAAAAMTYyNjI0dXVzVRJfYXV0aF91c2Vy\nX2JhY2tlbmRVLm9zY2FyLmFwcHMuY3VzdG9tZXIuYXV0aF9iYWNrZW5kcy5FbWFpbGJhY2tlbmRV\nDV9hdXRoX3VzZXJfaWSKAQRVB29wdGlvbnNddS4=\n','2013-06-06 21:11:32'),('1aa6c2c5ebcdc0010579170fc1aa1a1f','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-25 10:56:33'),('1b524a871a874b72a1001030557af74f','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-13 21:02:35'),('1bb5238c0aa16b190b0e622c303a412a','MjlkYjE4YjY4YmQ3NzJjYjJmNzNmZTZlNGI1ZjQwYzM3M2YyN2Y1ZjqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc3ECXXUu\n','2013-06-14 11:18:53'),('1be59b57869fc405bfbcab26ac554f6d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-08-13 10:55:22'),('1bf62348f13380ae9a3019f693c47a58','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 06:42:54'),('1c5e1391251a371c4050e537f7d1d195','MWE3ZmYxNzYyNWFlMTFlZjU2MzY2YWY5MjRlMWVmZjc0ZmYyNmI5NDqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUub3NjYXIuYXBwcy5jdXN0b21lci5hdXRoX2Jh\nY2tlbmRzLkVtYWlsYmFja2VuZFUHb3B0aW9uc111Lg==\n','2013-05-26 21:48:43'),('1c7d49418f066d178db47dd9fd5e942a','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 11:25:33'),('1cb61eacbe55f8f9f990a79da6473497','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 18:40:38'),('1df0389d9cffa7b897a7f77d444485a1','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-07-29 20:53:36'),('1e057dbde7b6125f5772386b4b7bcc71','NDk0NDZlMTZlMDM1YzY3OTE0ZTA5Y2QwNWZlYzFjOTcyYTU1MTE5OTqAAn1xAShVCnRlc3Rjb29r\naWVxAlUGd29ya2VkcQNVB29wdGlvbnNddS4=\n','2013-05-29 11:41:12'),('1e09f42743fd2d8184f8313b567398d7','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 18:26:11'),('1ea36395afa652de8fefb537c3b9803e','NDk0NDZlMTZlMDM1YzY3OTE0ZTA5Y2QwNWZlYzFjOTcyYTU1MTE5OTqAAn1xAShVCnRlc3Rjb29r\naWVxAlUGd29ya2VkcQNVB29wdGlvbnNddS4=\n','2013-06-10 19:15:33'),('205afc8567d826c5e2e381b2fcedfdff','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-06-15 18:17:02'),('21a60f3db158ef76d64c52cab2bad118','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-09 01:06:51'),('21acb5627acb497d58802c52ec6177da','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-08 08:12:42'),('22f849c1d6cb0bc2c5e33b81f4b94d31','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-26 07:39:51'),('245706d537d0642980688c1006904470','Njg3OWUyMTQ5NjA4MjYzNDc2ZTA2M2MzZTVhMjU5NWNhZjIzNTljZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNr\nZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBAXUu\n','2013-09-11 15:30:28'),('246054152747ffba10f2a66f6c896699','N2ViZGZkMzQ4Yzg5Y2Y3NjdkMDllOGI1YjVmOGQxODhmM2UzZDhjMjqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBJVUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-09-11 20:42:02'),('25726fc409ab02a3a8cb1925e01366aa','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-14 14:27:21'),('258d9639785120b893906961b8b633d8','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-10 19:35:35'),('261657518e347d300a5b6e3aaeb86dd2','MWMzODc5NTNjZmEyMGY5ZmU3MjEwZGM5NjRmNjlhN2I3MmNjYmY2OTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUMb3B0aW9uc19waWNrfXECKFUHcHJvZHVjdHEDigERVQdjaG9pY2VzcQR9cQUo\nWAQAAABmb2xkcQaKAShYBgAAAGZpbmlzaHEHigEmWAUAAABzdG9ja3EIigEQWAYAAAB3ZWlnaHRx\nCYoBJ1gEAAAAc2l6ZXEKigEsdXV1Lg==\n','2013-07-24 20:15:05'),('268ea44664aa2bf93b62caa520bf42a4','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-08-30 13:49:08'),('28fd4141afe70289aa19bc3108233165','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-29 07:04:21'),('29647e2a7915260336610945828d7cf5','YmQxYzJjODQyMWZiMjBlOGI5MDcwZWQ0NjViMDQ4ZDZhNDEyYzQyNjqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBEFUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-18 22:29:46'),('2aede20b516c53f2fbcdac16925d2b80','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-06 00:46:38'),('2b2fd83532f13c4e6106dbccad4b1ab8','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 00:52:24'),('2d81e9766763909c0b665453c716c529','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-02 21:23:53'),('2dc7f2d5c1f69234916400f734e498d0','NTA0ZWQ1ZTcyZDc2MTY1MzZhZjA2ZjU0YTRjZTdkNWE0ZGZlNzkxNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUub3NjYXIuYXBwcy5jdXN0b21lci5hdXRoX2JhY2tlbmRzLkVtYWlsYmFja2Vu\nZFURY2hlY2tvdXRfb3JkZXJfaWSKAQJVE29wdGlvbnNfc2Vzc2lvbmRhdGF9cQIoVQdjaG9pY2Vz\nfXEDKFgGAAAAZmluaXNocQSKAusAWAYAAAB3ZWlnaHRxBYoC4gBYBwAAAHBhY2thZ2VxBooC8ABY\nBAAAAGZvbGRxB4oC5ABYBQAAAHN0b2NrcQiKAugAWAQAAABzaXplcQmKAuUAdVUHcHJvZHVjdIoB\nEVUIcXVhbnRpdHlLAVULY2hvaWNlX2RhdGF9cQpVBHNpemVxC31xDChVBXdpZHRocQ1LAFUGaGVp\nZ2h0cQ5LAHVzdVUNX2F1dGhfdXNlcl9pZIoBAVUNY2hlY2tvdXRfZGF0YX11Lg==\n','2013-08-31 07:18:45'),('2ea315ccb35f465e00c287d3ddb6fff9','ZjUzZTVmMjAxYjQ3Zjk5ZGI1YWM4ZDZhYmQyZmE5Y2JiODJkMDdkZTqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGFxAn1xAyhVB3Byb2R1Y3RxBIoBD1UIcXVhbnRpdHlxBUsAVQtjdXN0b21fc2l6\nZXEGfXEHKFUFd2lkdGhxCEsAVQZoZWlnaHRxCUsAdVUHY2hvaWNlc3EKfXVVDG9wdGlvbnNfcGlj\na31xCyhVB3Byb2R1Y3SKARFVB2Nob2ljZXN9dXUu\n','2013-08-03 20:47:38'),('2ee27d54236ffe7c075c72cb5f3e5c52','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-09-06 06:42:48'),('300791a72ea8567722b86cc9d0cc2118','ODdkODJkNmFkZjJhNmYyOWIwYzA2MTg4MzE1MWJjNWVmMTkzMzA3MTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVQdvcHRpb25zXXUu\n','2013-06-10 21:20:17'),('3081ecb2658e4d5941caff183b07df80','YWVhZDdkODJlYzBmOTA0YThjNWVkNzM5ODc0MjVhYTNiMjliNzVmYTqAAn1xAVUMb3B0aW9uc19w\naWNrfXECKFUHcHJvZHVjdHEDigERVQdjaG9pY2VzcQR9cQUoWAQAAABmb2xkcQaKASlYBgAAAGZp\nbmlzaHEHigElWAUAAABzdG9ja3EIigERWAYAAAB3ZWlnaHRxCYoBJ1gEAAAAc2l6ZXEKigErdXVz\nLg==\n','2013-07-24 12:07:23'),('3191d9d3d9e7baffc2231b4e20d73f54','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-29 00:17:49'),('31de416579fccabb5d0f81e6345724ad','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 21:22:53'),('325701a599ca8a8fe7f3ca1c73b4e8bc','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-18 23:05:24'),('3281059f57dedbf4bf6ca8f73e086008','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-02 21:24:26'),('32f6dd69b7674147cc13640238c61119','OGY2MjRjYTNiM2VmZjZmMTc2ZDFhYzA2YzdhNTU0ODc3MGQ1N2NlNzqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBJlUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-09-10 20:49:08'),('331b49cfc3480e9d98aba2ee1df2d268','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 23:12:15'),('33599b9e4ec127d29154c3592c2652f0','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 14:57:22'),('33b22b6881b8c57867d97c9c89cd45ef','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-07 08:07:13'),('33b6df14cc88ea286fd020e5a11966ca','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 16:50:07'),('3404b13143ebaf7f1dd9907ec690bce4','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-05-29 16:05:14'),('3520d592687fd487134abe01f1f9b359','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-25 22:54:19'),('352a25b3a8547c48b5de24553170adcb','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 13:54:50'),('36008828cf64f63e7a7c3fcd93fe5067','OTJkMTRhZDRhYmRkYWNjMjVhNTA5ZDFkOWFkYzNlZjQxZmVhOTY0NDqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBD1UIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-15 15:17:47'),('3693cc27cbf0c3c75d0f56120f051c30','ZTMwNGE3YjdkNGM0MGFhODE5YzYyOTFmMTU2ZTEyZDVmN2JlYWU1NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNr\nZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBBHUu\n','2013-08-27 12:36:36'),('3737b49a6672fa1def0d2270d73d2ed5','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 12:33:51'),('3948b0d1fffd4e85b93ac57b1116085a','NDQ4MThhODlhNjVkNGM4ZTg0YmY2YmMxZDVjN2Y1NDM3ZmM4MmJiMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQR1Lg==\n','2013-06-20 09:59:34'),('3a3a1888db08fd77f475d6ae754c7c0f','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-30 11:48:05'),('3b45130504653ebbfe9b5d65adccfef4','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-08-18 11:31:55'),('3bc71948120893824fa4e695a30ecf16','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-07-07 20:55:17'),('3d285318a932c0381fd515b63ff39418','YjRkNTllNDQ0OGJiNThmOTJiNmRlNzliM2Y0ZDFhNjUyOTdkNTM2NTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDcy4=\n','2013-09-08 11:58:47'),('3de27aa51dcc604a641e3f6d775145e6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 10:54:52'),('3fc910e9f4388326eb07a87d24c461f0','Zjk1ZWYyY2YxNWI2NTE2N2EwMGRmYjg1NDY4Y2UzOGQ5MDNjMTA5MjqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YX1xAihVC2Nob2ljZV9kYXRhcQN9cQRVBHNpemVxBX1xBihVBXdpZHRocQdLAFUG\naGVpZ2h0cQhLAHVzVQdwcm9kdWN0cQmKARFVCHF1YW50aXR5cQpLAFUHY2hvaWNlc3ELfXVzLg==\n','2013-09-06 13:37:04'),('3fe211cc9356a665a6c2dd0e1f5a8b82','OTYzNzc0ODI1OWUwODIxODgyODRiMTVmMWViOGVkZjE2MmI0OWE3MzqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQRVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRVB29wdGlvbnNddS4=\n','2013-06-14 01:22:40'),('401c80dd0addb35ea0ba1f9e51b667ed','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-08-17 01:03:35'),('404d59a857248ecf0bb6cad0189e61a4','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 05:49:54'),('405020488c59f52f635fd3ca577ecebe','MWVkMWEwYmQyZDcyY2JlMjkxMTQ4ODIzODAzMGU1NDQ3Yjg1NDU2YzqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQRVB29wdGlvbnNdVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1\ndGguYmFja2VuZHMuTW9kZWxCYWNrZW5kdS4=\n','2013-06-19 18:29:39'),('419153d700a7cb49b253baa4fbc3ba21','MjlkYjE4YjY4YmQ3NzJjYjJmNzNmZTZlNGI1ZjQwYzM3M2YyN2Y1ZjqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc3ECXXUu\n','2013-06-08 07:47:54'),('425f1f43676f646c9f9ae2a4ecc1c79a','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 16:14:19'),('429f782c2c31ced03029a6f256264013','Njg3OWUyMTQ5NjA4MjYzNDc2ZTA2M2MzZTVhMjU5NWNhZjIzNTljZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNr\nZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBAXUu\n','2013-09-11 15:22:07'),('436e602e571efbd9e75ff6c2fd42ceeb','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-25 18:13:01'),('4453317fba9c27d0873ddb84d485ee61','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 04:33:01'),('45266231177332d9d1d34919884e1ac1','MzFjOWI5ZDFhMmVlNjQ1ZGY0MWExMjc3MjU2NDEyODM5YWU3ZjMwNTqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQdjaG9pY2VzfXEDKFgGAAAAZmluaXNoigExWAsAAABvcmllbnRhdGlv\nbooBA1gGAAAAd2VpZ2h0igEvWAcAAABwcmludGVkigEJWAQAAABzaXpligEwWAoAAABsYW1pbmF0\naW9uigEOWAUAAABzdG9ja4oBEXVVB3Byb2R1Y3SKARFVCHF1YW50aXR5SwFVC2Nob2ljZV9kYXRh\nfXEEVQRzaXplfXEFKFUFd2lkdGhLAFUGaGVpZ2h0SwB1c3VVCnRlc3Rjb29raWVVBndvcmtlZHEG\ndS4=\n','2013-09-04 10:57:37'),('45b2afd6be222ecd2a44e4e3837feb39','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-13 06:45:58'),('45b8a17277b7338432b5c0c08d6218ff','NzI1OTE1NDliNTJiMDE5OGNmOWQxYzRiNjM5NDE4YTU5M2E2OGMyNTqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQFVE29wdGlvbnNfc2Vzc2lvbmRhdGF9cQIoVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZXEE\nfXEFKFUFd2lkdGhxBksAVQZoZWlnaHRxB0sAdXNVB3Byb2R1Y3SKARFVCHF1YW50aXR5SwFVB2No\nb2ljZXN9cQgoWAYAAABmaW5pc2hxCYoC6gBYBgAAAHdlaWdodHEKigLiAFgHAAAAcGFja2FnZXEL\nigLvAFgEAAAAZm9sZHEMigLjAFgFAAAAc3RvY2txDYoC5gBYBAAAAHNpemVxDooC5QB1dVUSX2F1\ndGhfdXNlcl9iYWNrZW5kVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxi\nYWNrZW5kVQ1jaGVja291dF9kYXRhfXEPVQhzaGlwcGluZ31xEChVC21ldGhvZF9jb2RlVQ1mcmVl\nLXNoaXBwaW5nVRJuZXdfYWRkcmVzc19maWVsZHN9cREoVQxwaG9uZV9udW1iZXJYBwAAADEyMzQ1\nNjdVCmZpcnN0X25hbWVYAwAAAHh4eFUJbGFzdF9uYW1lWAQAAAB4eHh4VQV0aXRsZVgCAAAATXJV\nB2NvdW50cnljZGphbmdvLmRiLm1vZGVscy5iYXNlCm1vZGVsX3VucGlja2xlCnESY29zY2FyLmFw\ncHMuYWRkcmVzcy5tb2RlbHMKQ291bnRyeQpxE11jZGphbmdvLmRiLm1vZGVscy5iYXNlCnNpbXBs\nZV9jbGFzc19mYWN0b3J5CnEUh1JxFX1xFihVDWlzb18zMTY2XzFfYTNxF1gCAAAAdWtVDWlzb18z\nMTY2XzFfYTJxGFgCAAAAdWtVBG5hbWVxGVgCAAAAdWtVDmlzX2hpZ2hsaWdodGVkcRqJVQ5wcmlu\ndGFibGVfbmFtZXEbWAIAAAB1a1UGX3N0YXRlcRxjZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVs\nU3RhdGUKcR0pgXEefXEfKFUGYWRkaW5ncSCJVQJkYnEhVQdkZWZhdWx0dWJVEmlzb18zMTY2XzFf\nbnVtZXJpY3EiSxZVE2lzX3NoaXBwaW5nX2NvdW50cnlxI4h1YlUFbm90ZXNYAAAAAFUFbGluZTRY\nAwAAAHh4eFUFbGluZTNYAwAAAHh4eFUFbGluZTJYBAAAAHh4eHhVBWxpbmUxWAQAAAB4eHh4VQVz\ndGF0ZVgDAAAAeHh4VQhwb3N0Y29kZVgHAAAAQk42IDhBUnV1c3Uu\n','2013-08-31 06:53:16'),('463ab312a781cd54439a0fb2af09d644','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 03:05:55'),('463e69ee68b3abdda3696f79f782ef88','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-08-31 07:25:59'),('4788d5c8d1c929fe96d23c6bf0db6c4f','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 16:18:06'),('48971374c4a2ab665d0e8cc90e3e08fd','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-07 08:03:07'),('491b6afb9a4b6b00ae73dc32244a2bff','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-07 02:25:06'),('4a0d4f1d1714454744b2bfce090ecb35','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-15 08:28:45'),('4b94d13787cd77b9dcfe58911b4efca8','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 06:15:32'),('4ba3124fddaf686f71f6c3d5409131d7','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-17 00:16:13'),('4c3b8c5b73262fe5f92c57deb677352f','NDk0NDZlMTZlMDM1YzY3OTE0ZTA5Y2QwNWZlYzFjOTcyYTU1MTE5OTqAAn1xAShVCnRlc3Rjb29r\naWVxAlUGd29ya2VkcQNVB29wdGlvbnNddS4=\n','2013-06-15 19:02:30'),('4cd9bdee2a9f03489462a30fb66f00b2','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 10:01:30'),('4e1cd474ae21e72bf67e6ffaebb896d2','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 02:45:48'),('4e333e16150e85a13f5c234a2e0b77e5','YzJhMzFlMzQ1MWE3MTg3MzMxNmFjMTRkNzM4NTU1ZjVlYjAzZTRhNTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YX1xAihVB3Byb2R1Y3SKARFVB2Nob2ljZXN9cQMoWAQAAABmb2xkcQSKASlYBQAA\nAHN0b2NrcQWKARFYBAAAAHNpemVxBooBKnV1cy4=\n','2013-07-27 16:47:09'),('4e35dddcbef0e66b11b169aa528e4de3','MmJiZTRhY2RlZDQxNzg2YjZkM2Y4NTRmNjA4Yzk1NzllZjBmMjZmYTqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZXEEfXEFKFUFd2lkdGhxBksAVQZo\nZWlnaHRxB0sAdXNVB3Byb2R1Y3SKARFVCHF1YW50aXR5SwBVB2Nob2ljZXN9cQgoWAsAAABvcmll\nbnRhdGlvbnEJigEDWAYAAAB3ZWlnaHRxCooBJ3V1VQp0ZXN0Y29va2llVQZ3b3JrZWR1Lg==\n','2013-08-25 19:53:33'),('4eee713db66deea813bc44944644f24b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 03:25:14'),('50138cbf27781801418a2907669586b0','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-24 08:27:50'),('50e7cfce3382311118ed536e5e9dbcbc','YjRkNTllNDQ0OGJiNThmOTJiNmRlNzliM2Y0ZDFhNjUyOTdkNTM2NTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDcy4=\n','2013-09-04 12:10:35'),('5327b7307f099007fabbbda280ad8a00','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-10 15:30:11'),('53b82d1f0864e224703cf1fcbadf1f2b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 07:28:46'),('54fb31ab1cc2d3f1915eadda556fb4ad','MGEyYTE1NmYzZWM3NjlkNDZkYjMxZjU1NjEyZjg3OWI3MzM1YTFmYjqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YX1xAihVB2Nob2ljZXN9cQMoWAYAAABmaW5pc2hxBIoBNVgLAAAAb3JpZW50YXRp\nb25xBYoBA1gGAAAAd2VpZ2h0cQaKASdYBwAAAHByaW50ZWRxB4oBCVgEAAAAc2l6ZXEIigErWAoA\nAABsYW1pbmF0aW9ucQmKAQtYBQAAAHN0b2NrcQqKARJ1VQdwcm9kdWN0igERVQhxdWFudGl0eU5V\nC2Nob2ljZV9kYXRhfXELVQRzaXplcQx9cQ0oVQV3aWR0aHEOSwBVBmhlaWdodHEPSwB1c3VzLg==\n','2013-08-30 10:29:00'),('55223994241e7517f25d23988b89c7d5','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-14 08:53:13'),('554213001a0c7d3bbf151ab0f36d281e','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-01 08:25:00'),('5565d370342d0123f7fbaafa3ddfc2e0','NGQ2ODE0YzY0Mzg5NmYwNDZjZDc3MTNkZmExNjA2ZGNhYWZiYmNlOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNr\nZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBAnUu\n','2013-05-28 18:08:22'),('565abd6ffd93e1d488a927ea7531c783','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-09-11 22:43:43'),('5780c12301bdf58f3c8389ec0eb109cf','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 08:25:34'),('57ac7c9158240705002c04de9ba008d0','N2ViZGZkMzQ4Yzg5Y2Y3NjdkMDllOGI1YjVmOGQxODhmM2UzZDhjMjqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBJVUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-09-10 17:10:21'),('58296bc71a83289a28b2dc362f8d2d2b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-08 12:47:28'),('58de27fd7a71e7c2fe9c13a8fd7ba70d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 15:31:45'),('593a2a14458ad0795d3f099bc4aff74a','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 10:22:46'),('596c2d06563bb82b2000587294fb9481','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-24 19:29:20'),('5a598b74efa7b3db614869da856e5f60','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 16:56:23'),('5a83f0ddec473983e278203a0e723ecf','NDU5OWMzY2JiOTEwM2E1OGMwM2FhZWJhOWNhZjQ5MTczOTIyNzE4YTqAAn1xAShVDWNoZWNrb3V0\nX2RhdGFxAn1VE29wdGlvbnNfc2Vzc2lvbmRhdGF9cQMoVQdjaG9pY2VzfXEEKFgEAAAAZm9sZIoB\nKFgGAAAAZmluaXNoigEmWAUAAABzdG9ja4oBJFgGAAAAd2VpZ2h0igEnWAQAAABzaXpligErdVUH\ncHJvZHVjdIoBEVUIcXVhbnRpdHlLMlULY2hvaWNlX2RhdGF9cQVVBHNpemV9cQYoVQV3aWR0aEsA\nVQZoZWlnaHRLAHVzdVUNX2F1dGhfdXNlcl9pZIoBClUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFu\nZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu\n','2013-08-16 11:26:21'),('5a8d60a5aad1ab258c24025bc1631241','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 15:32:10'),('5b7d8af00a713067bc08aa9f76b618c7','NjRmNmJhYjEyZGJiODEyMGVlODFhOGYxYjcyMGMxODgzMDg2MmZjMTqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQpVB29wdGlvbnNdVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1\ndGguYmFja2VuZHMuTW9kZWxCYWNrZW5kdS4=\n','2013-06-20 18:27:16'),('5bef3c7c50c8ae4c6cc18f02e23c62dd','NjBiMmJjZGM3NzFjZmNiOTJkZmZkNTBkMjk1MWNiMWVkMTQwZGRlMDqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBEVUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-31 05:26:45'),('5d0244487e40d54c84383edd36dde38f','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 14:28:49'),('5d141e0c979366a362d32068f4bb099d','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-09-06 05:48:59'),('5dc965bf6bd5221560133cebf4d7f003','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-16 17:41:14'),('5dec2acc140f4eb5309c4e5978e4b02d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 09:39:25'),('5deff7573663007a6b0b26b73ed63c42','MjE0OWFjMTMyMzc3OTg3M2VjNWQ5NGIxMDhmOTQ1MTliYzQ5OTk4NzqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQpVE29wdGlvbnNfc2Vzc2lvbmRhdGF9cQIoVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZX1x\nBChVBXdpZHRocQVLAFUGaGVpZ2h0cQZLAHVzVQdwcm9kdWN0igFPVQhxdWFudGl0eUsBVQtjdXN0\nb21fc2l6ZX1xByhVBXdpZHRoSwBVBmhlaWdodEsAdVUHY2hvaWNlc31xCFgIAAAAZGlhbWV0ZXKK\nApcBc3VVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5N\nb2RlbEJhY2tlbmRVDG9wdGlvbnNfcGlja31xCShVB3Byb2R1Y3SKARFVB2Nob2ljZXN9cQooWAQA\nAABmb2xkigEpWAYAAABmaW5pc2iKASZYBQAAAHN0b2NrigESWAYAAAB3ZWlnaHSKASdYBAAAAHNp\nemWKASx1dVUHb3B0aW9uc11VDWNoZWNrb3V0X2RhdGF9cQtVCHNoaXBwaW5nfXEMVQttZXRob2Rf\nY29kZVUUbm8tc2hpcHBpbmctcmVxdWlyZWRzc3Uu\n','2013-09-09 18:32:57'),('5e7e79fd611a1b1d1158398f5910596e','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-20 22:37:03'),('5f2a14937ad59fa6efc9891aa412b57c','OTJkMTRhZDRhYmRkYWNjMjVhNTA5ZDFkOWFkYzNlZjQxZmVhOTY0NDqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBD1UIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-16 13:45:17'),('62122efb698047452044b522d72455ef','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 23:21:10'),('62b9bf1351ad9e9cbdfaa20a3edcfd44','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 15:42:31'),('62dd1a0eaa76a4ea029ea2be276806dc','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 16:49:53'),('63137f0edde82e63968f246518e96408','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-23 09:41:32'),('635ad0c91610aa6fe794ffc114136ae8','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-22 11:55:35'),('63d6e28daebdf7f32474ca6b4042b27f','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-07 12:02:50'),('646380e07375cc766d3ccf3acc70ef54','NjBiMmJjZGM3NzFjZmNiOTJkZmZkNTBkMjk1MWNiMWVkMTQwZGRlMDqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBEVUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-17 17:58:39'),('6481994749dcdd8639f4c9c8c02d0df6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 09:06:31'),('64c34252eb99fcf0b0a2a377984df0c6','ZDQ3YmMzZWY5MmViOWMzOTI2NmRkNmFlZmQ0ZTRlMzczY2Q3M2FhOTqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUub3NjYXIuYXBwcy5jdXN0b21lci5hdXRoX2Jh\nY2tlbmRzLkVtYWlsYmFja2VuZFUHb3B0aW9uc11xAihYAQAAADJYAQAAADRldS4=\n','2013-06-03 23:05:59'),('65bc60983283d628638df5267d03b44f','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-11 16:21:37'),('66f2587e07b4d5a6bcdaf66dc2ba4bc7','ZTc0ZDViOTU1MjA1N2Q3NzcwZWFlMDUzYTQxNWUxYzBlMTBhZDk5ODqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGFxAn1xAyhVC2Nob2ljZV9kYXRhcQR9cQVVBHNpemVxBn1xByhVBXdpZHRocQhL\nAFUGaGVpZ2h0cQlLAHVzVQdwcm9kdWN0cQqKARFVCHF1YW50aXR5cQtLAFUHY2hvaWNlc3EMfXVV\nCnRlc3Rjb29raWVVBndvcmtlZHUu\n','2013-08-16 21:52:53'),('67779fbd22c9ac8202057d999a965ff6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-08-29 19:10:28'),('67811487d0d7ee6fef36ce6762533f0d','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-24 19:29:19'),('68e0cce7af345dcf6431b770ccf8e832','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-07 19:47:06'),('6a6a8b48488d343fc0b4fd7174785343','NGM1ZmQ2OGYwMDAyY2RhM2RjYjFjMzk5OGExYjIwOWI5MDAxNGIyMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQp1Lg==\n','2013-08-08 15:42:06'),('6c2db243eda1a0fd407c69e2b0b8afd3','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 13:40:20'),('6c2e7de058084d0e240c6c8baa001ede','ODgzMjE2NTg1ZGFjMDQ3ZWYxMTZlY2Q1ZTlmYTUwZjA0YjMwZTAzYzqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBT1UIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-09-12 12:57:16'),('6cfa4929050928ecdcd1106a91d04973','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 21:02:30'),('6daa6dd1fd1540e995e2b227bee813ec','NjBiMmJjZGM3NzFjZmNiOTJkZmZkNTBkMjk1MWNiMWVkMTQwZGRlMDqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBEVUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-14 20:16:49'),('6dae28d5df00f10644a845f4906abc79','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 09:05:56'),('6fef8c49fdb25bee90196b0c8bfc6e47','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-19 07:33:30'),('705b067b40a9df60e4382ebac4c3c72c','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-14 22:33:04'),('71f0fd9d6635112aa3b22eb6c22eebd3','OTZiZGQyNGRiNzFlN2JmMGQyN2IxZGQzYzQyZTk3ZDdkOTJiMjA0ZDqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc111Lg==\n','2013-06-15 01:25:15'),('722e3e55c4f0fe69b6af95daef663204','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-16 11:06:55'),('72cd2bcfb4bdfed1e391ae6daf0218f6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 22:25:16'),('7471baf1f033b4f33cd6b220bc3cc02e','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 01:00:11'),('74ebde99efd111a87795f305def3d912','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-09 06:55:39'),('758d61fb50b087fef72be72ebe567578','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 17:57:10'),('75f46d9731cabc6a82dcead9f31997c8','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-10 14:52:12'),('76ec0cf6583990d83c1e11e3fe577606','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 00:02:02'),('7884d77cca046d23ecab3e6a855092b7','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-21 08:07:16'),('791a462d68f684f81f3b8f71e664b70b','MGFiMjY2MDA4NzVmNWVlMjlhYWZjYmMzMWFjYWJiN2FmMDlkNThkOTqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZX1xBChVBXdpZHRocQVLAFUGaGVp\nZ2h0cQZLAHVzVQdwcm9kdWN0igERVQhxdWFudGl0eUtkVQdjaG9pY2VzfXEHKFgGAAAAZmluaXNo\nigExWAsAAABvcmllbnRhdGlvbooBA1gGAAAAd2VpZ2h0igEnWAcAAABwcmludGVkigEIWAUAAABz\ndG9ja4oBJFgKAAAAbGFtaW5hdGlvbooBDlgEAAAAc2l6ZYoBMHV1VQ1fYXV0aF91c2VyX2lkigEQ\nVRJfYXV0aF91c2VyX2JhY2tlbmRVLm9zY2FyLmFwcHMuY3VzdG9tZXIuYXV0aF9iYWNrZW5kcy5F\nbWFpbGJhY2tlbmR1Lg==\n','2013-08-29 15:21:17'),('79d775f7b9efa717ed134d509c53b73d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-08-17 00:03:46'),('79e17e50dc1a2f0989553996f5375faa','YmVkNTYzYjhlZjM4NTAwOWQ2ZmU4MjY0MTQxOTgyMTU5Yzk1NzE0MTqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQdwcm9kdWN0igEQVQhxdWFudGl0eUsBVQtjdXN0b21fc2l6ZX1xAyhV\nBXdpZHRoSwBVBmhlaWdodEsAdVUHY2hvaWNlc31xBChYCgAAAGJhY2stY292ZXKKARxYCwAAAG9y\naWVudGF0aW9uigEDWAYAAAB3ZWlnaHSKARRYBwAAAGJpbmRpbmeKARpYCwAAAGZyb250LWNvdmVy\nigEfWAcAAABwcmludGVkigEJWAQAAABzaXpligEhWAUAAABwYWdlc4oBHlgFAAAAc3RvY2uKARB1\ndVUKdGVzdGNvb2tpZVUGd29ya2VkcQV1Lg==\n','2013-08-02 21:33:23'),('7a1fc5529ac1b230c05b5ed86164ab1b','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-07 19:32:30'),('7b193bdfd784449a410755ae5ce311ac','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-08 01:38:25'),('7c73e14f057476ecab24c726157126dd','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 22:04:58'),('7d8f009c9c29e43fb0d130571bac0e42','NjBiMmJjZGM3NzFjZmNiOTJkZmZkNTBkMjk1MWNiMWVkMTQwZGRlMDqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBEVUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-09-05 07:27:57'),('801a0ad4aa33665b12d09911111ce4ca','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-08-29 23:41:32'),('80c90ecbfc639620d6a90eb88ff5285f','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-29 00:17:45'),('81229aa5ec905b35d10faf6a09d000aa','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-08 13:33:58'),('817cdf531682162f368bda5f866bb17b','NDk0NDZlMTZlMDM1YzY3OTE0ZTA5Y2QwNWZlYzFjOTcyYTU1MTE5OTqAAn1xAShVCnRlc3Rjb29r\naWVxAlUGd29ya2VkcQNVB29wdGlvbnNddS4=\n','2013-06-10 09:48:56'),('827887efaa00dd887fa8b98d3c8d3eee','ZDlmZjJhOGI2ZTIwMzNkOWU2YTI3NDlhNmI2YjJmZWE4NDQ4MDJlMjqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFUHcHJvZHVjdHEEigERVQdjaG9pY2VzcQV9dXMu\n','2013-07-26 12:55:35'),('82a415475098316cbbd9aab38dd8c625','MjlkYjE4YjY4YmQ3NzJjYjJmNzNmZTZlNGI1ZjQwYzM3M2YyN2Y1ZjqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc3ECXXUu\n','2013-05-31 10:54:18'),('8364793623491a948c38bea66ca82f8f','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 03:58:00'),('83a1c44aa2cea8fe40e39cf6a42f941b','NjBiMmJjZGM3NzFjZmNiOTJkZmZkNTBkMjk1MWNiMWVkMTQwZGRlMDqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBEVUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-22 11:14:35'),('83b601a21ff04d21661a15d73c372b16','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 21:35:10'),('858b31b43379718fb5c871109a8d6e03','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 02:45:30'),('858c251ca6d720efaf793033cee5a1ae','ZDA2Y2JiMDVjZGU5NjJjYWJkNzI1NjljY2NhZTU0MGVhY2ZkYzQ5MDqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQdjaG9pY2VzfXEDKFgGAAAAZmluaXNoigExWAsAAABvcmllbnRhdGlv\nbooBA1gGAAAAd2VpZ2h0igEvWAcAAABwcmludGVkigEJWAUAAABzdG9ja4oBEFgKAAAAbGFtaW5h\ndGlvbooBC1gEAAAAc2l6ZYoBMHVVB3Byb2R1Y3SKARFVCHF1YW50aXR5S2RVC2Nob2ljZV9kYXRh\nfXEEVQRzaXplfXEFKFUFd2lkdGhxBksAVQZoZWlnaHRxB0sAdXN1VQ1fYXV0aF91c2VyX2lkigEE\nVRJfYXV0aF91c2VyX2JhY2tlbmRVLm9zY2FyLmFwcHMuY3VzdG9tZXIuYXV0aF9iYWNrZW5kcy5F\nbWFpbGJhY2tlbmR1Lg==\n','2013-08-19 11:09:08'),('862d3d3f372bfe460f734693b3ff0cd6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 21:23:18'),('86898fbe4932da003132f048f99d6f8b','ZTNlNDMwYWJiMGIxYTI2NmNmMGY1MWNmYTE3MzhjMTM0MjM1N2I1NTqAAn1xAShVDWNoZWNrb3V0\nX2RhdGF9VQ1fYXV0aF91c2VyX2lkigEFVRJfYXV0aF91c2VyX2JhY2tlbmRVLm9zY2FyLmFwcHMu\nY3VzdG9tZXIuYXV0aF9iYWNrZW5kcy5FbWFpbGJhY2tlbmRVB29wdGlvbnNddS4=\n','2013-06-11 08:13:18'),('87b81b1143a4253361552b9e073e40d0','MjlkYjE4YjY4YmQ3NzJjYjJmNzNmZTZlNGI1ZjQwYzM3M2YyN2Y1ZjqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc3ECXXUu\n','2013-06-10 20:46:50'),('89a9e54cb9e50ebae4a57f8d99451056','ZDlkNDkzZjQ2NWNkNTg1NTUwYzQ5ZDFjMDFiOWM4ZjMzMTM5NmIyYTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YX1xAihVB2Nob2ljZXN9VQdwcm9kdWN0igEtVQhxdWFudGl0eUsAVQtjaG9pY2Vf\nZGF0YX1xA1UEc2l6ZXEEfXEFKFUFd2lkdGhxBksAVQZoZWlnaHRxB0sAdXN1cy4=\n','2013-08-31 08:37:09'),('89f9496978d615702d677b900f209b45','OWE4NTU0YTA1ODIzZjUwZjI2MWZmZTY1MjgzMmI0NTg2NzhkNGJlZjqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQdwcm9kdWN0igEPVQhxdWFudGl0eUsAVQtjdXN0b21fc2l6ZX1xAyhV\nBXdpZHRocQRLAFUGaGVpZ2h0cQVLAHVVB2Nob2ljZXN9dVUNX2F1dGhfdXNlcl9pZIoBClUSX2F1\ndGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2Vu\nZHUu\n','2013-07-31 21:00:12'),('8a786c97f4667cc1d6a8ebe515115973','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-11 16:13:01'),('8adde958107195f63b66f6c3d63b00e7','MTkwYWU0NjE1MDBlNDVjNzgyOTIxOTU0NTk2M2Y0Y2FmNGEzOWIzZTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVQ1jaGVja291dF9kYXRhfXUu\n','2013-06-12 19:42:04'),('8b7960a2e7688af536cf1db05fb5695a','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-10 18:31:34'),('8c4873a890edf1eda8d89105e4f7361d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 13:51:01'),('8d2da21849c29f3b42cb344855463d7b','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-07 10:40:12'),('8d2e38a27144e2b7138256343eeab3d6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 03:13:51'),('8d62d6c4e6612caaad4b7e99a633642b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 03:26:14'),('8e07cdac111bf070bf0f2d1b05e21f09','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-05-29 13:44:26'),('8f217e9cd446bd55a7e6c90481e43673','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-05 01:56:16'),('90b632f88585c888973b7d66cf11f20b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-08-29 18:18:28'),('90da6016cf3efc53ad88ad2fb8cc2938','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-22 10:03:32'),('914a48b5b98ff34df24976fda9a21de6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 04:12:11'),('916d149e28a343adab1aabd9159e576f','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-09-06 10:51:38'),('952c4c744f67c61f114eec288e8a7713','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-10 18:03:54'),('95d7dae20eb51f1d13fc2d5174e0795c','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-08 21:35:52'),('9666f83825e26a5653d047ca89832bcf','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-30 17:37:56'),('96fc6262728298ea3105ec17b12fe399','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-05-24 11:21:25'),('976af87a706c4f3d96c9b5b164d33749','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 08:43:35'),('9843ab35953f3561d8d832d9113b7a71','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-08 22:47:16'),('98896fa76686370f9822ca95467bf3a1','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-04 04:03:11'),('98d026fab134795f899afcb5a0a3aa96','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-12 19:48:56'),('9a34a189a477174f926021a14995cd1f','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-10 14:07:04'),('9a55ad6e5c340d0613bf7d4e85471b0b','ZWUyNDFjZDllYjczYjY0MjEzZGIyNGQ0NDIxNGM4YTViYWYxOWQzNTqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQ9VE29wdGlvbnNfc2Vzc2lvbmRhdGF9cQIoVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZX1x\nBChVBXdpZHRoSwBVBmhlaWdodEsAdXNVB3Byb2R1Y3SKARFVCHF1YW50aXR5S/pVB2Nob2ljZXN9\ncQUoWAYAAABmaW5pc2iKATJYCwAAAG9yaWVudGF0aW9uigEDWAYAAAB3ZWlnaHSKASdYBwAAAHBy\naW50ZWSKAQhYBQAAAHN0b2NrigEkWAoAAABsYW1pbmF0aW9uigEMWAQAAABzaXpligEwdXVVEl9h\ndXRoX3VzZXJfYmFja2VuZFUub3NjYXIuYXBwcy5jdXN0b21lci5hdXRoX2JhY2tlbmRzLkVtYWls\nYmFja2VuZFUNY2hlY2tvdXRfZGF0YX1xBlUIc2hpcHBpbmd9cQcoVQttZXRob2RfY29kZVUNZnJl\nZS1zaGlwcGluZ3EIVRJuZXdfYWRkcmVzc19maWVsZHN9cQkoVQxwaG9uZV9udW1iZXJYAAAAAFUK\nZmlyc3RfbmFtZVgGAAAARGVlcGFrVQlsYXN0X25hbWVYBQAAAE1hbGlrVQV0aXRsZVgCAAAATXJV\nB2NvdW50cnljZGphbmdvLmRiLm1vZGVscy5iYXNlCm1vZGVsX3VucGlja2xlCnEKY29zY2FyLmFw\ncHMuYWRkcmVzcy5tb2RlbHMKQ291bnRyeQpxC11jZGphbmdvLmRiLm1vZGVscy5iYXNlCnNpbXBs\nZV9jbGFzc19mYWN0b3J5CnEMh1JxDX1xDihVDWlzb18zMTY2XzFfYTNxD1gCAAAAdWtVDWlzb18z\nMTY2XzFfYTJxEFgCAAAAdWtVBG5hbWVxEVgCAAAAdWtVDmlzX2hpZ2hsaWdodGVkcRKJVQ5wcmlu\ndGFibGVfbmFtZXETWAIAAAB1a1UGX3N0YXRlcRRjZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVs\nU3RhdGUKcRUpgXEWfXEXKFUGYWRkaW5ncRiJVQJkYnEZVQdkZWZhdWx0dWJVEmlzb18zMTY2XzFf\nbnVtZXJpY3EaSxZVE2lzX3NoaXBwaW5nX2NvdW50cnlxG4h1YlUFbm90ZXNYAAAAAFUFbGluZTRY\nAAAAAFUFbGluZTNYAAAAAFUFbGluZTJYAAAAAFUFbGluZTFYAwAAAERrcFUFc3RhdGVYAAAAAFUI\ncG9zdGNvZGVYBgAAADI0ODEyNXV1c3Uu\n','2013-08-29 14:20:22'),('9aa704a7ec81955472b2f7247d67ea30','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-08 12:34:22'),('9ab008ebe7378a1a8cb14f2e88cdfce1','OTU1ZjUyOWQ2ZDZlYTAyMDUxNDE3MWE5ZjljYTliMGViMjk1YTI0MDqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUTb3B0aW9uc19zZXNzaW9uZGF0YX1xAihVB2Nob2ljZXN9VQdwcm9kdWN0igEQ\nVQhxdWFudGl0eUsAVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZXEEfXEFKFUFd2lkdGhxBksAVQZoZWln\naHRxB0sAdXN1dS4=\n','2013-08-30 19:35:11'),('9bbd70252ce11fdb7d9a8a30bdc154f8','NDgyMzhmYzhhZGEyMzkzOGM0ZWRkOGQ0Yzc4MjBhNDRjZjQwZDU2NTqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZXEEfXEFKFUFd2lkdGhxBksAVQZo\nZWlnaHRxB0sAdXNVB3Byb2R1Y3SKAS1VCHF1YW50aXR5SwFVB2Nob2ljZXN9cQhYBAAAAHNpemVx\nCYoCpQBzdVUSX2F1dGhfdXNlcl9iYWNrZW5kVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFj\na2VuZHMuRW1haWxiYWNrZW5kVQ1fYXV0aF91c2VyX2lkigEOdS4=\n','2013-08-28 08:46:28'),('9bc882c159c9a5e0a79224926b78a576','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-22 07:05:38'),('9c0c36f29ce8e2903b92312ec2b46cba','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-10 14:18:57'),('9d05adf87ee201b6f4fed3b5a9a91492','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-13 06:33:11'),('9d146287077f574d6b07311abd396a5b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 22:04:47'),('9f36a0d1fab0a4140832aa55687b2679','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-08 07:29:14'),('a0e4255abedfdfb785be674ec51e2308','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-09 08:32:26'),('a140d9b145392654d01b5d4c1ecf8e9d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-01 09:02:50'),('a4106a73b89b5551af53ea8e8cefce2f','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-25 21:35:12'),('a456a3f34a93b1828450e079112e5406','YmQxYzJjODQyMWZiMjBlOGI5MDcwZWQ0NjViMDQ4ZDZhNDEyYzQyNjqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBEFUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-20 22:41:14'),('a58ad4c5607930ac65229985cef4eb69','NWMyMTAyZmIwYzgwZDVlNTNlNGIzMTQ1YjJhNDk1OWEyY2Q0NzY2ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==\n','2013-06-15 17:39:22'),('a5c3fb8657fdc5109f4e26657f738d5d','MWE0ZTIwYTNiYzMwZDIzZjk1NjllY2ViMTFmZGQ3NWEwNGQxMjE1NTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YX1xAihVB3Byb2R1Y3SKAQ9VB2Nob2ljZXN9cQMoWAsAAABvcmllbnRhdGlvbnEE\nigEDWAgAAABsb2NhdGlvbnEFigEEWAsAAABwcmludC1zdG9ja3EGigEGWAcAAABwcmludGVkcQeK\nAQlYBAAAAHNpemVxCIoBIVgKAAAAbGFtaW5hdGlvbnEJigEMWAUAAABzdG9ja3EKigEPdVULY3Vz\ndG9tX3NpemV9cQsoVQV3aWR0aHEMSwBVBmhlaWdodHENSwB1VQhxdWFudGl0eUsAdXMu\n','2013-08-02 20:05:50'),('a5fd97864f0dae105b5f97ba35f34af0','MWVkMWEwYmQyZDcyY2JlMjkxMTQ4ODIzODAzMGU1NDQ3Yjg1NDU2YzqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQRVB29wdGlvbnNdVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1\ndGguYmFja2VuZHMuTW9kZWxCYWNrZW5kdS4=\n','2013-06-24 19:15:59'),('a6b8498f88fb92327d7cd70ae9115823','OTllNmVhZjM0N2QzZDlhZDdlODBiNDA3NTUwYzZjNmRkNzhlY2UwMjqAAn1xAS4=\n','2013-05-24 16:10:32'),('a765ea3bbfed9f3f7d27bddcf0024100','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-29 06:50:29'),('a8d90cdc71ef7e6b17860bb10dd511a3','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-29 00:22:52'),('a928d10fbc284c4e0bfa6c23402e9874','YjRkNTllNDQ0OGJiNThmOTJiNmRlNzliM2Y0ZDFhNjUyOTdkNTM2NTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDcy4=\n','2013-09-07 02:41:10'),('a974028c83b1911272f84dbc7cc24497','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-23 14:27:45'),('ac4e09326fcda985565e25ac19c82b6f','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-26 10:00:42'),('ac650193b52b8c6b4c15b29e2fde038d','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-05-27 23:11:51'),('ac9e55299c918cb1ea4d27831ef4a692','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-30 11:28:22'),('acc61c9c1bab791f89737c4e5fab0191','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-24 19:11:10'),('ad091e9468c28ed5c50ac2a68e06fc15','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-13 06:58:49'),('ad6687bd2a68c0eafc64627cbaf14e03','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 08:35:40'),('ad9484ff6e17689f0f6d1b2aa7e91b13','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-24 00:40:10'),('ad9ba4520b9ae35c625fcc9ee10e5e05','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-20 09:41:52'),('b07590f58ced800ec8cd3743d84a1303','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 20:20:14'),('b27c44cbf103ce8c9a2556fc62332081','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 20:19:59'),('b2c0e2344d2ca9232433d5ee64796919','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-08 03:59:18'),('b3caee5920fff57e9735a7965ab76752','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-07-11 11:06:33'),('b3cf61cbcd702d16d1ddd04d114e1fbc','ZjFlNThiNDcwNWU2NTIwY2ViMmVlYjJmOTgzOWNkYWVjYzIwYmQwNTqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZXEEfXEFKFUFd2lkdGhxBksAVQZo\nZWlnaHRxB0sAdXNVB3Byb2R1Y3SKARFVCHF1YW50aXR5SwBVB2Nob2ljZXN9cQgoWAQAAABzaXpl\ncQmKAuUAWAQAAABmb2xkcQqKAuMAWAUAAABzdG9ja3ELigLmAFgGAAAAd2VpZ2h0cQyKAuIAWAcA\nAABwYWNrYWdlcQ2KAvAAdXVVDV9hdXRoX3VzZXJfaWSKAQRVEl9hdXRoX3VzZXJfYmFja2VuZFUu\nb3NjYXIuYXBwcy5jdXN0b21lci5hdXRoX2JhY2tlbmRzLkVtYWlsYmFja2VuZHUu\n','2013-09-01 18:53:56'),('b541a70b80d8eea1821f268edf2d86e0','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-29 01:20:46'),('b55910ca2c9601756a6df5e260b7ec89','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-07 13:54:44'),('b5b4f3e60914a41a3ca470187933cdac','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 05:03:46'),('b74f48a2d17b26dea8eacfc52b613721','MjlkYjE4YjY4YmQ3NzJjYjJmNzNmZTZlNGI1ZjQwYzM3M2YyN2Y1ZjqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc3ECXXUu\n','2013-05-28 08:57:39'),('b79cf2acf266de587d612873d2016e9d','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-24 23:23:10'),('b882e9629413c974e3e17a18cc50e2cf','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 20:34:29'),('b8c2bea830f865b3454fbca85efbb1f3','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-16 06:53:27'),('b92b081752bc9ba19dead57d4c4e5fa5','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-04 18:36:15'),('b97178c9f61685cb0daa8dcab641a6e0','MjlkYjE4YjY4YmQ3NzJjYjJmNzNmZTZlNGI1ZjQwYzM3M2YyN2Y1ZjqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc3ECXXUu\n','2013-06-03 21:33:07'),('ba548774b5577d49dd6d68ecd35c344b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 12:19:55'),('ba8391b2c32359b4aeaa4b819d58f70f','NDRlZTkyZmMwODJmMGUxZDE5NmNjY2E5OTE2N2U2YzdjMmIxZjcxNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUub3NjYXIuYXBwcy5jdXN0b21lci5hdXRoX2JhY2tlbmRzLkVtYWlsYmFja2Vu\nZFUNX2F1dGhfdXNlcl9pZIoBDFUTb3B0aW9uc19zZXNzaW9uZGF0YX1xAihVB3Byb2R1Y3SKARBV\nB2Nob2ljZXN9cQMoWAoAAABiYWNrLWNvdmVyigEdWAsAAABvcmllbnRhdGlvbooBAlgGAAAAd2Vp\nZ2h0igEWWAcAAABiaW5kaW5nigEbWAsAAABmcm9udC1jb3ZlcooBIFgHAAAAcHJpbnRlZIoBCFgE\nAAAAc2l6ZYoBIVgFAAAAcGFnZXOKASNYBQAAAHN0b2NrigESdVULY3VzdG9tX3NpemV9cQQoVQV3\naWR0aEsAVQZoZWlnaHRLAHVVCHF1YW50aXR5Swp1VQxvcHRpb25zX3BpY2t9cQUoVQdwcm9kdWN0\nigERVQdjaG9pY2VzfXVVDWNoZWNrb3V0X2RhdGF9cQZVCHNoaXBwaW5ncQd9cQhVC21ldGhvZF9j\nb2RlcQlVFG5vLXNoaXBwaW5nLXJlcXVpcmVkcQpzc3Uu\n','2013-08-05 08:41:00'),('babb954e36630c39ac8ee16155e875f4','MzNkMTIwYmY2OTRkYTk2ZjhjY2E2NjQ0NTVmNGIwODBiNmQxMGUxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQdvcHRpb25zXVUNX2F1dGhfdXNlcl9pZHEEigEEdS4=\n','2013-06-19 19:42:34'),('bad4772a8e5e6eeb2930332ae59851bd','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-05-28 10:09:00'),('bad6a26a239ce422a998ba9da4746a79','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-08 13:17:14'),('bb1ac31155dada4f2feae95c5a4d99c3','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-16 00:53:24'),('bb81ea03611b0c2b1043fe686ae774f7','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-05-30 19:14:35'),('bbed9da64a7247f37d5ef6a42456097a','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 17:18:05'),('bcb918562dd25b5dcb8392f32d17d946','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-29 06:09:40'),('be73db6ed4369caf415ac47a4ea4c800','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-11 22:44:05'),('be8c3d35473afe5d5283fa9c6b135eb2','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 03:25:01'),('bed154654747f99a96f824b20da2741e','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-05 23:42:11'),('bf238cc0171aaec00d901d3215d27934','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-15 08:25:29'),('bf6018296a0b65e5e013a561a113f112','ZWJiZjlmNGI4YmQzN2E1YzRkYWVlNTRhMGI4ZWZhNmQyZmMxZTNhZDqAAn1xAShVCnRlc3Rjb29r\naWVxAlUGd29ya2VkcQNVEl9hdXRoX3VzZXJfYmFja2VuZFUub3NjYXIuYXBwcy5jdXN0b21lci5h\ndXRoX2JhY2tlbmRzLkVtYWlsYmFja2VuZFUTb3B0aW9uc19zZXNzaW9uZGF0YX1xBChVB2Nob2lj\nZXN9cQUoWAQAAABzaXpligEqWAQAAABmb2xkigEoWAYAAABmaW5pc2iKASVYBgAAAHdlaWdodIoB\nJ1gFAAAAc3RvY2uKARB1VQdwcm9kdWN0igERVQhxdWFudGl0eUsyVQtjaG9pY2VfZGF0YX1xBlUE\nc2l6ZX1xByhVBXdpZHRoSwBVBmhlaWdodEsAdXN1VQ1fYXV0aF91c2VyX2lkigEMVQ1jaGVja291\ndF9kYXRhfXEIVQhzaGlwcGluZ31xCShVC21ldGhvZF9jb2RlVQ1mcmVlLXNoaXBwaW5nVRJuZXdf\nYWRkcmVzc19maWVsZHN9cQooVQxwaG9uZV9udW1iZXJYBQAAAHh4eHh4VQpmaXJzdF9uYW1lWAEA\nAAB4VQlsYXN0X25hbWVYAQAAAHhVBXRpdGxlWAIAAABNclUHY291bnRyeWNkamFuZ28uZGIubW9k\nZWxzLmJhc2UKbW9kZWxfdW5waWNrbGUKcQtjb3NjYXIuYXBwcy5hZGRyZXNzLm1vZGVscwpDb3Vu\ndHJ5CnEMXWNkamFuZ28uZGIubW9kZWxzLmJhc2UKc2ltcGxlX2NsYXNzX2ZhY3RvcnkKcQ2HUnEO\nfXEPKFUNaXNvXzMxNjZfMV9hM3EQWAIAAAB1a1UNaXNvXzMxNjZfMV9hMnERWAIAAAB1a1UEbmFt\nZXESWAIAAAB1a1UOaXNfaGlnaGxpZ2h0ZWRxE4lVDnByaW50YWJsZV9uYW1lcRRYAgAAAHVrVQZf\nc3RhdGVxFWNkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxFimBcRd9cRgoVQZhZGRp\nbmdxGYlVAmRicRpVB2RlZmF1bHR1YlUSaXNvXzMxNjZfMV9udW1lcmljcRtLFlUTaXNfc2hpcHBp\nbmdfY291bnRyeXEciHViVQVub3Rlc1gAAAAAVQVsaW5lNFgAAAAAVQVsaW5lM1gAAAAAVQVsaW5l\nMlgAAAAAVQVsaW5lMVgBAAAAeFUFc3RhdGVYAAAAAFUIcG9zdGNvZGVYAQAAAHh1dXN1Lg==\n','2013-08-15 10:51:09'),('bfbf3661d404f23be364f533c6446e06','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-07-25 20:45:16'),('c0427ce0a961fab2af50acda1a1944d3','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 15:12:35'),('c25f1d57c01e086f14e6d50a6ab7b56b','NGFkZjJjNDZlY2E2MTUwZDVmN2JlZTk3MzI3NGRhYzkwNzY5NzljNTqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQRVB29wdGlvbnNdVRJfYXV0aF91c2VyX2JhY2tlbmRVLm9zY2FyLmFwcHMuY3VzdG9t\nZXIuYXV0aF9iYWNrZW5kcy5FbWFpbGJhY2tlbmR1Lg==\n','2013-06-05 19:47:14'),('c3b5102f06020d08ae1d924a8e976b38','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-30 11:28:40'),('c415bf91511cc20b92cf83d47cc05dab','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-15 17:43:12'),('c470acd6b7341fef8d9762123e8fb1ac','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 03:59:18'),('c5c37aa103ad631da526020485328527','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-10 22:02:06'),('c63ed6fc3ed773be95432acfa88814c1','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-25 10:43:53'),('c82b487a88a53fe4319cd36fe7a2d4c2','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-02 21:11:26'),('cbd563896d336f2cc084d67bbe1d61cb','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 05:20:44'),('cc236bf01dc219a8fc8455d9eed77136','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-08-30 12:02:13'),('ce3c05e69df34d488a8babedd401b070','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-30 17:21:00'),('ce799c6388b32a4d5a136d6c65ddfc6f','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-29 10:05:04'),('cee1ef14588cd873b7408a49853d9139','NGI5ZTc4ODg5Yzg5N2QzZjQ3YzI1YmQ2OWY0NzAxMDZjOTQ3OTUyMzqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQdwcm9kdWN0igEPVQdjaG9pY2VzfVULY3VzdG9tX3NpemV9cQMoVQV3\naWR0aHEESwBVBmhlaWdodHEFSwB1VQhxdWFudGl0eUsAdVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlk\namFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZFUNX2F1dGhfdXNlcl9pZIoB\nAXUu\n','2013-08-02 19:08:57'),('d044d6ffc874149ad764cfed60d07dce','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-08 06:20:49'),('d07e86313327873e92392fe8da61878e','NDA3OWQ2ODM2NmQyZWZkZDI4YjA2NGZlN2E0NWU1MGQyNTk2ZmIyZjqAAn1xAVUNY2hlY2tvdXRf\nZGF0YXECfXMu\n','2013-06-21 03:52:44'),('d1c3cdb05b25fd4f65029189975bbccc','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-10 13:08:02'),('d205935d22dc735d7d1dc7ca7ff20ae3','M2M0ZjRjZTUzOWE0YmY3ZGJlYjAxMjA5OGJiMWIzYmU0YTA5ZGQ5ZTqAAn1xAShVDWNoZWNrb3V0\nX2RhdGF9cQJVCHNoaXBwaW5nfXEDVQttZXRob2RfY29kZVUUbm8tc2hpcHBpbmctcmVxdWlyZWRx\nBHNzVQ1fYXV0aF91c2VyX2lkigEEVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmli\nLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kVQdvcHRpb25zXXUu\n','2013-06-15 07:29:03'),('d251135d83a9463f68dc2e98f29c0515','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 06:47:50'),('d26bd6a13ba46445435a0d0d4ecf6fdb','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-02 19:38:45'),('d2f10a3c5953debc230e727d5de37533','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-09 21:22:55'),('d32fb766be1b55996c01c175e33b9f62','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-09-05 22:02:22'),('d3ef1f1f5968b852582abbbe0229ef7d','NWMyMTAyZmIwYzgwZDVlNTNlNGIzMTQ1YjJhNDk1OWEyY2Q0NzY2ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==\n','2013-06-20 10:57:58'),('d6a7de21c53fbf2edb45ddd2e965edf6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-07 19:45:25'),('d7019e3ddee46ff1f0db252748aec4e6','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-30 11:28:21'),('d722e75b6e23824ce621b411930b2b2c','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-04 10:57:11'),('d73f5bba4d8e441c59926d95689a7163','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-25 19:50:59'),('d9014839477a953060150a40d395a9d3','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-08-02 20:45:58'),('d93d292f333b5466fc212fb21a3f89f2','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-07 13:54:28'),('d9c0cc19444875d208b14ff0765f52d0','YmQxYzJjODQyMWZiMjBlOGI5MDcwZWQ0NjViMDQ4ZDZhNDEyYzQyNjqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBEFUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-09-02 10:07:44'),('da02ce185d2e2c46713961118d73724b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 01:08:05'),('da8f2325265ab3d2a8d140adc1120aaa','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-17 18:04:23'),('dacd3fb889905be69c14e8285c89e55f','MWUyMDU1MWI4NGViMGNkYzc4MDUzZDkzODY4YzVhZGI0NDVjNGE5MjqAAn1xAVUMb3B0aW9uc19w\naWNrcQJ9cQMoVQdwcm9kdWN0cQSKARFVB2Nob2ljZXNxBX11cy4=\n','2013-07-24 19:29:19'),('db629c5e34d83b25df8e74294a05b4ed','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 02:32:52'),('db71b1e4368000ed19463131d8f0ebcb','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-05-27 23:49:47'),('dd5b44453831408f6df3bcdcfd1e675d','Njg3OWUyMTQ5NjA4MjYzNDc2ZTA2M2MzZTVhMjU5NWNhZjIzNTljZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNr\nZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBAXUu\n','2013-05-29 19:50:14'),('dd99acfd2c2aef35e29796d0ec5caf96','OTZiZGQyNGRiNzFlN2JmMGQyN2IxZGQzYzQyZTk3ZDdkOTJiMjA0ZDqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUHb3B0aW9uc111Lg==\n','2013-06-07 12:25:28'),('decc812bf1d61dda0c2c6789f4ba6d5b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 06:58:19'),('def5e69f8d90ace264bcb0314c4f3134','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-22 16:20:25'),('df601d4ac6c17a51825c59906014f700','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-05-31 05:27:38'),('e033d4091fa5cec9456b059aaa98b794','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-05-27 23:11:51'),('e064bd465b5d5a10dfc83650e30116c2','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-24 07:26:56'),('e12013e0ed93b083ad98857a5dc4592d','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-19 19:27:49'),('e142550e560e9b91650883c1fd2ce383','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-08 13:22:18'),('e219273370a27bd87612886dda462377','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 09:49:49'),('e26d617b0c07b4e4867b044e3d3d526e','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-13 21:52:14'),('e27df7610340a45a91c06f991a620d64','MGVhNDc4MDNiOTI2YzBlNTAzZDQ4Yjc0ZDFjNDJlZDhiY2E3ZDg3NzqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUTb3B0aW9uc19zZXNzaW9uZGF0YX1xAihVC2Nob2ljZV9kYXRhcQN9cQRVBHNp\nemVxBX1xBihVBXdpZHRocQdLAFUGaGVpZ2h0cQhLAHVzVQdwcm9kdWN0cQmKATFVCHF1YW50aXR5\ncQpLAFUHY2hvaWNlc3ELfXV1Lg==\n','2013-08-30 14:27:27'),('e28cb2ccee14424a042f5e64df6057a4','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-05 20:50:38'),('e48ace198e60d040ccff8b3f4d1f658e','OTYzNzc0ODI1OWUwODIxODgyODRiMTVmMWViOGVkZjE2MmI0OWE3MzqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQRVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRVB29wdGlvbnNddS4=\n','2013-07-11 13:14:30'),('e67289a7a232a741a87e753bdc925ce0','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-07 11:40:27'),('e71bdcd458bad9f8b5bd780b6499bc52','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-07 02:11:04'),('e71c9f55e7de0300a8831d5fa7033311','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 14:28:05'),('e8682b1755f01348d7b203d1b3bfd774','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 22:42:00'),('ea2588622a5de37b11d4f213a43868f5','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-13 09:46:49'),('eb069642ed51e175c4959d9c59a240b1','OTg4NTU1ZjUyMDI1ODFjYzkxNjhjZjlkZDNjN2ZiZGNlNjc4ZTE2NDqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVRNvcHRpb25zX3Nlc3Npb25kYXRhfXEDKFUHY2hvaWNlc31xBChYBAAAAHNp\nemWKAuUAWAQAAABmb2xkigLjAFgGAAAAZmluaXNoigLqAFgGAAAAd2VpZ2h0igLiAFgFAAAAc3Rv\nY2uKAugAdVUHcHJvZHVjdIoBEVUIcXVhbnRpdHlLMlULY2hvaWNlX2RhdGF9cQVVBHNpemV9cQYo\nVQV3aWR0aEsAVQZoZWlnaHRLAHVzdXUu\n','2013-09-09 21:26:49'),('eb25dc16d154fdf7039bbdbf1a15025c','NzNiNDU5NDdkZGJmZDEzMDgyYjVmY2Q5MjE3OGQyYzAwMDRmY2E1NzqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGF9cQIoVQdwcm9kdWN0igEPVQdjaG9pY2VzfVULY3VzdG9tX3NpemV9cQMoVQV3\naWR0aHEESwBVBmhlaWdodHEFSwB1VQhxdWFudGl0eUsAdVUMb3B0aW9uc19waWNrfXEGKFUHcHJv\nZHVjdIoBEVUHY2hvaWNlc311dS4=\n','2013-08-02 17:50:49'),('eb4eefb07cf096d022d3d06591e63ec2','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-01 03:58:01'),('ec26009f429aca64311abecd95cfedc3','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 10:55:24'),('ec2d991294e833dd83614f3816231351','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-21 08:42:42'),('edfad93985db9fae2308cd8093e0d198','Njg3OWUyMTQ5NjA4MjYzNDc2ZTA2M2MzZTVhMjU5NWNhZjIzNTljZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS5vc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxiYWNr\nZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBAXUu\n','2013-05-24 14:44:00'),('ef0bbca8430172f11e85b604ec92240d','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-07-10 12:46:07'),('ef10a10fff6573e31f6c9e546ac58a87','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-06-28 12:33:31'),('ef79d63eb4ffcd32d30852cf2822c41a','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-08 19:17:35'),('effb66103a2039f5d5cb5db51ce6b675','MGE2NTE2NmViOTZlOWVmMzFhOWFmZmM3YWY1MWYzOWQ2OTIxMzY1YzqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-08-29 18:02:37'),('f03feaca4d90f3a8dcef9ac3a7955f6b','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 06:18:47'),('f0dc2f09bf1da48d2892472433a468f5','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-01 16:51:17'),('f1608d1dba4625aa9b001efa60cf6d47','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-07-06 00:51:16'),('f186a604fe9b79a8f5f221a8fa1f5302','OGJiNDQxNzRkYTFiMWZjNTZkODBiYjJjZTRmN2QxNTc1YTk3OTFlYTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBFlUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-08-18 11:15:28'),('f1b17b055764af0531adcdcd6a1cf4a3','MWIxNDIwOTAzNGQ4MTBjY2E4NTQ4YTZkOWVkYjQwZDZjYjI5Yjc1ZjqAAn1xAVUHb3B0aW9uc3EC\nXXMu\n','2013-06-25 07:42:37'),('f2d0c1f4cd3bc91088b097cabdeffabe','OGY2MjRjYTNiM2VmZjZmMTc2ZDFhYzA2YzdhNTU0ODc3MGQ1N2NlNzqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFULY2hvaWNlX2RhdGFxBH1xBVUEc2l6ZXEGfXEHKFUFd2lkdGhxCEsA\nVQZoZWlnaHRxCUsAdXNVB3Byb2R1Y3RxCooBJlUIcXVhbnRpdHlxC0sAVQdjaG9pY2VzcQx9dXMu\n','2013-09-12 00:34:16'),('f2f50ddfd5553e6c4db92d9d2d2f7c84','MzE0ODE1MjRmZjMzNGU5MjllNjFkODJiYmFhMjJlYjA5Yjg1OWQ0NzqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUTb3B0aW9uc19zZXNzaW9uZGF0YX1xAihVB2Nob2ljZXN9VQdwcm9kdWN0igEu\nVQhxdWFudGl0eUsAVQtjaG9pY2VfZGF0YX1xA1UEc2l6ZXEEfXEFKFUFd2lkdGhxBksAVQZoZWln\naHRxB0sAdXN1dS4=\n','2013-08-30 14:46:31'),('f3cf3bbb2a530923af472022693a3101','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-21 10:47:08'),('f4443796c413817287f4e74f23072e06','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-05-27 23:35:53'),('f61282d0f1b3514027893f430a0bd8db','NGM1ZmQ2OGYwMDAyY2RhM2RjYjFjMzk5OGExYjIwOWI5MDAxNGIyMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQp1Lg==\n','2013-09-08 17:33:05'),('f996de69c95e8920bc1881aee42bf1eb','YzQ2MzdmODNkYWYwNDVmYWE1NTBlYWRkOGU5ZWJkYTUwZDg1ZjM3NDqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQRVDG9mZmVyX3dpemFyZH1xAihVB2JlbmVmaXR9cQNVBGRhdGF9cQQoVQVyYW5nZWNk\namFuZ28uZGIubW9kZWxzLmJhc2UKbW9kZWxfdW5waWNrbGUKcQVjb3NjYXIuYXBwcy5vZmZlci5t\nb2RlbHMKUmFuZ2UKcQZdY2RqYW5nby5kYi5tb2RlbHMuYmFzZQpzaW1wbGVfY2xhc3NfZmFjdG9y\neQpxB4dScQh9cQkoVQRuYW1lcQpYDAAAAEFsbCBQcm9kdWN0c1ULcHJveHlfY2xhc3NxC05VBl9z\ndGF0ZXEMY2RqYW5nby5kYi5tb2RlbHMuYmFzZQpNb2RlbFN0YXRlCnENKYFxDn1xDyhVBmFkZGlu\nZ3EQiVUCZGJxEVUHZGVmYXVsdHESdWJVDGRhdGVfY3JlYXRlZHETY2RhdGV0aW1lCmRhdGV0aW1l\nCnEUVQoH3QULCDcjAAAAY3B5dHoKX1VUQwpxFSlScRaGUnEXVRVpbmNsdWRlc19hbGxfcHJvZHVj\ndHNxGIhVAmlkcRmKAQF1YlUEdHlwZVgKAAAAUGVyY2VudGFnZXEaVRJtYXhfYWZmZWN0ZWRfaXRl\nbXNLBlUFdmFsdWVjZGVjaW1hbApEZWNpbWFsCnEbVQE1hVJxHFUOY3VzdG9tX2JlbmVmaXRYAAAA\nAHVzVQtiZW5lZml0X29iamgFY29zY2FyLmFwcHMub2ZmZXIubW9kZWxzCkJlbmVmaXQKcR1daAeH\nUnEefXEfKGgLTmgMaA0pgXEgfXEhKGgQiGgRaBJ1YlUFdmFsdWVxImgbVQE1hVJxI1UMX3Jhbmdl\nX2NhY2hlcSRoCFUIcmFuZ2VfaWRxJYoBAVUSbWF4X2FmZmVjdGVkX2l0ZW1zcSZLBlUEdHlwZXEn\naBpoGU51YlUMbWV0YWRhdGFfb2JqaAVjb3NjYXIuYXBwcy5vZmZlci5tb2RlbHMKQ29uZGl0aW9u\nYWxPZmZlcgpxKF1oB4dScSl9cSooVQZzdGF0dXNxK1gEAAAAT3BlblUXbWF4X2dsb2JhbF9hcHBs\naWNhdGlvbnNxLE5VDnN0YXJ0X2RhdGV0aW1lcS1OVRVtYXhfdXNlcl9hcHBsaWNhdGlvbnNxLk5V\nC2Rlc2NyaXB0aW9ucS9YFwAAAEZvYW1leCBEaXNjb3VudCAzLTY8YnI+cTBVCm51bV9vcmRlcnNx\nMUsAVQ50b3RhbF9kaXNjb3VudHEyaBtVBDAuMDCFUnEzaAxoDSmBcTR9cTUoaBCIaBFOdWJVDGNv\nbmRpdGlvbl9pZHE2TmgZTlUIcHJpb3JpdHlxN0sAVQxtYXhfZGlzY291bnRxOE5VCmJlbmVmaXRf\naWRxOU5VDHJlZGlyZWN0X3VybHE6VQBVDGVuZF9kYXRldGltZXE7TlUXbWF4X2Jhc2tldF9hcHBs\naWNhdGlvbnNxPE5oE05VCm9mZmVyX3R5cGVxPVgEAAAAU2l0ZVUEc2x1Z3E+TlUQbnVtX2FwcGxp\nY2F0aW9uc3E/SwBoClgXAAAAVHJhZGUgUHJpY2UgRm9hbWV4IFRFU1RxQHViVQhtZXRhZGF0YX1x\nQVUEZGF0YX1xQihVBG5hbWVoQFULZGVzY3JpcHRpb25oMHVzdVUTb3B0aW9uc19zZXNzaW9uZGF0\nYX1xQyhVB2Nob2ljZXN9cUQoWAYAAABmaW5pc2iKATFYCwAAAG9yaWVudGF0aW9uigEDWAYAAAB3\nZWlnaHSKASdYBwAAAHByaW50ZWSKAQhYBQAAAHN0b2NrigERWAoAAABsYW1pbmF0aW9uigEOWAQA\nAABzaXpligEwdVUHcHJvZHVjdIoBEVUIcXVhbnRpdHlN9AFVC2Nob2ljZV9kYXRhfXFFVQRzaXpl\nfXFGKFUFd2lkdGhLAFUGaGVpZ2h0SwB1c3VVEl9hdXRoX3VzZXJfYmFja2VuZFUub3NjYXIuYXBw\ncy5jdXN0b21lci5hdXRoX2JhY2tlbmRzLkVtYWlsYmFja2VuZFURY2hlY2tvdXRfb3JkZXJfaWSK\nAQNVDWNoZWNrb3V0X2RhdGF9cUdVCHNoaXBwaW5nfXFIKFULbWV0aG9kX2NvZGVxSVUNZnJlZS1z\naGlwcGluZ3FKVRJuZXdfYWRkcmVzc19maWVsZHN9cUsoVQxwaG9uZV9udW1iZXJYAQAAADFVCmZp\ncnN0X25hbWVYAQAAADFVCWxhc3RfbmFtZVgBAAAAMVUFdGl0bGVYAgAAAE1yVQdjb3VudHJ5aAVj\nb3NjYXIuYXBwcy5hZGRyZXNzLm1vZGVscwpDb3VudHJ5CnFMXWgHh1JxTX1xTihVDWlzb18zMTY2\nXzFfYTNxT1gCAAAAdWtVDWlzb18zMTY2XzFfYTJxUFgCAAAAdWtoClgCAAAAdWtVDmlzX2hpZ2hs\naWdodGVkcVGJVQ5wcmludGFibGVfbmFtZXFSWAIAAAB1a2gMaA0pgXFTfXFUKGgQiWgRVQdkZWZh\ndWx0dWJVEmlzb18zMTY2XzFfbnVtZXJpY3FVSxZVE2lzX3NoaXBwaW5nX2NvdW50cnlxVoh1YlUF\nbm90ZXNYAQAAADFVBWxpbmU0WAAAAABVBWxpbmUzWAAAAABVBWxpbmUyWAAAAABVBWxpbmUxWAEA\nAAAxVQVzdGF0ZVgAAAAAVQhwb3N0Y29kZVgBAAAAMXV1c3Uu\n','2013-08-30 14:03:17'),('f997b41661691967daa591c0d37afa94','YWUzMGE0NWU4OTY3NzRiNzhiMTc2NGFmZjRjNTJkY2Q4NmU1MTIyMzqAAn1xAShVE29wdGlvbnNf\nc2Vzc2lvbmRhdGFxAn1xAyhVC2Nob2ljZV9kYXRhcQR9cQVVBHNpemVxBn1xByhVBXdpZHRocQhL\nAFUGaGVpZ2h0cQlLAHVzVQdwcm9kdWN0cQqKAQ9VCHF1YW50aXR5cQtLAFUHY2hvaWNlc3EMfXVV\nDV9hdXRoX3VzZXJfaWSKAQtVEl9hdXRoX3VzZXJfYmFja2VuZFUub3NjYXIuYXBwcy5jdXN0b21l\nci5hdXRoX2JhY2tlbmRzLkVtYWlsYmFja2VuZHUu\n','2013-08-22 04:43:44'),('f9ee69930f5babc5413354764cf525de','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-06 20:50:33'),('fad918fc75dfad795726bf6f21015bae','NGM1ZmQ2OGYwMDAyY2RhM2RjYjFjMzk5OGExYjIwOWI5MDAxNGIyMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQp1Lg==\n','2013-06-21 22:29:04'),('fb83645c19aac2da58b474532f7bb21e','MzMwOTZhMmEwNmZkZTE1ZGViNjYwMzBhZjdiNGNjMTAzMzM2OWRjNTqAAn1xAVUTb3B0aW9uc19z\nZXNzaW9uZGF0YXECfXEDKFUHcHJvZHVjdHEEigEPVQhxdWFudGl0eXEFSwBVC2N1c3RvbV9zaXpl\ncQZ9cQcoVQV3aWR0aHEISwBVBmhlaWdodHEJSwB1VQdjaG9pY2VzcQp9dXMu\n','2013-07-31 20:54:02'),('fc7245716d4157c4eb3b900fa25acf71','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-08 07:29:36'),('fcaa49154e9d4c714ec7c742fd5156a1','NTIyZmE1ZmY1NzVmYWNkOGVjMDU4ZWQzZDUyMmNkNmM1OWZiZTc1ZjqAAn1xAShVB29wdGlvbnNd\nVQxvcHRpb25zX3BpY2t9cQIoVQdwcm9kdWN0cQOKARFVB2Nob2ljZXNxBH1xBShYBAAAAGZvbGRx\nBooBKVgGAAAAZmluaXNocQeKASVYBQAAAHN0b2NrcQiKARJYBgAAAHdlaWdodHEJigEnWAQAAABz\naXplcQqKASp1dXUu\n','2013-07-20 15:32:52'),('ff48fe0b828b1b891c49764b6061885e','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-02 16:14:00'),('ffb3919e7c70fdc3db27decdda44dfc2','NDFiNGIwMjVjZDEzNzM0ZGViY2FlOGY4ZTAwYTZjZThhOTUxOGY0NjqAAn1xAVUHb3B0aW9uc11z\nLg==\n','2013-06-13 12:30:24'),('ffdff2d15556a4db9fd99b5a2dde4f87','Zjc3ZTY4ODgwOWI0YTMwMDY5ZTE1NjY5MzE2OTRiNzUwNDNkM2FlZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-07-03 11:04:09');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gap_attributeoptionthumbnail`
--

DROP TABLE IF EXISTS `gap_attributeoptionthumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gap_attributeoptionthumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_id` (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gap_attributeoptionthumbnail`
--

LOCK TABLES `gap_attributeoptionthumbnail` WRITE;
/*!40000 ALTER TABLE `gap_attributeoptionthumbnail` DISABLE KEYS */;
INSERT INTO `gap_attributeoptionthumbnail` VALUES (1,'gallery/portrait.gif',1),(2,'gallery/landscape.gif',2),(3,'gallery/item_2.gif',4),(4,'gallery/item_1.gif',5),(5,'gallery/disp-boards.png',12),(6,'gallery/ex-stand.png',18),(7,'gallery/flags.png',20),(8,'gallery/pave-sign.png',14),(9,'gallery/posters.png',13),(10,'gallery/printed-vinyl.png',16),(11,'gallery/pvc-banner.png',15),(12,'gallery/roller.PNG',19),(13,'gallery/stat.png',21),(14,'gallery/window-vinyl.png',17),(15,'gallery/images.jpg',10);
/*!40000 ALTER TABLE `gap_attributeoptionthumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globals_globals`
--

DROP TABLE IF EXISTS `globals_globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globals_globals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globals_globals`
--

LOCK TABLES `globals_globals` WRITE;
/*!40000 ALTER TABLE `globals_globals` DISABLE KEYS */;
INSERT INTO `globals_globals` VALUES (1,0.200);
/*!40000 ALTER TABLE `globals_globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_commontaskdescription`
--

DROP TABLE IF EXISTS `jobs_commontaskdescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_commontaskdescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_commontaskdescription_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_15861d014dfdd1c1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_commontaskdescription`
--

LOCK TABLES `jobs_commontaskdescription` WRITE;
/*!40000 ALTER TABLE `jobs_commontaskdescription` DISABLE KEYS */;
INSERT INTO `jobs_commontaskdescription` VALUES (1,'Check over job to make sure that the artwork is OK to use',4),(2,'This is where all the files get printed & finished',4);
/*!40000 ALTER TABLE `jobs_commontaskdescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_job`
--

DROP TABLE IF EXISTS `jobs_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11),
  `name` varchar(250) NOT NULL,
  `creator_id` int(11),
  PRIMARY KEY (`id`),
  KEY `jobs_job_8337030b` (`order_id`),
  KEY `jobs_job_f97a5119` (`creator_id`),
  CONSTRAINT `creator_id_refs_id_3b7eacdb873e523c` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `order_id_refs_id_5486a1f4926bf43b` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_job`
--

LOCK TABLES `jobs_job` WRITE;
/*!40000 ALTER TABLE `jobs_job` DISABLE KEYS */;
INSERT INTO `jobs_job` VALUES (4,2,'100001',1),(5,3,'100003',4);
/*!40000 ALTER TABLE `jobs_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_stage`
--

DROP TABLE IF EXISTS `jobs_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `related_status` varchar(250) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_stage`
--

LOCK TABLES `jobs_stage` WRITE;
/*!40000 ALTER TABLE `jobs_stage` DISABLE KEYS */;
INSERT INTO `jobs_stage` VALUES (1,'Order details checks','New Order',0,NULL),(2,'Pre- Set','Setting',0,'Preset the paper and colour pantone'),(3,'Job Checks','Job received',0,'Checking job details'),(4,'Stage 1','start',1,''),(5,'Conducting Checks','Checks',0,'Before the job begins, checks to see that the order has all the requirements in order to manufacture.'),(6,'Print','Don\'t know what this means',0,'The print of the job'),(7,'Dispatch','Still don\'t know',0,'Send out goods');
/*!40000 ALTER TABLE `jobs_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_stage_jobs`
--

DROP TABLE IF EXISTS `jobs_stage_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_stage_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stage_id` (`stage_id`,`job_id`),
  KEY `jobs_stage_jobs_a8114449` (`stage_id`),
  KEY `jobs_stage_jobs_751f44ae` (`job_id`),
  CONSTRAINT `job_id_refs_id_1cc25f1a` FOREIGN KEY (`job_id`) REFERENCES `jobs_job` (`id`),
  CONSTRAINT `stage_id_refs_id_a2b05285` FOREIGN KEY (`stage_id`) REFERENCES `jobs_stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_stage_jobs`
--

LOCK TABLES `jobs_stage_jobs` WRITE;
/*!40000 ALTER TABLE `jobs_stage_jobs` DISABLE KEYS */;
INSERT INTO `jobs_stage_jobs` VALUES (4,4,4),(5,4,5),(6,6,5),(7,7,5);
/*!40000 ALTER TABLE `jobs_stage_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_task`
--

DROP TABLE IF EXISTS `jobs_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `description` longtext,
  `name` varchar(250) DEFAULT NULL,
  `priority` varchar(250) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_task_751f44ae` (`job_id`),
  KEY `jobs_task_f97a5119` (`creator_id`),
  KEY `jobs_task_a8114449` (`stage_id`),
  KEY `jobs_task_54f3bd39` (`assigned_to_id`),
  CONSTRAINT `assigned_to_id_refs_id_42ac0441` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `creator_id_refs_id_42ac0441` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `job_id_refs_id_776026c2` FOREIGN KEY (`job_id`) REFERENCES `jobs_job` (`id`),
  CONSTRAINT `stage_id_refs_id_635c62dd` FOREIGN KEY (`stage_id`) REFERENCES `jobs_stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_task`
--

LOCK TABLES `jobs_task` WRITE;
/*!40000 ALTER TABLE `jobs_task` DISABLE KEYS */;
INSERT INTO `jobs_task` VALUES (2,5,4,4,4,'Check over job to make sure that the artwork is OK to use','Look at Job','High Priority',NULL,NULL),(3,5,4,6,4,'This is where all the files get printed & finished','To print artwork files','High Priority',NULL,NULL);
/*!40000 ALTER TABLE `jobs_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_task_followers`
--

DROP TABLE IF EXISTS `jobs_task_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_task_followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobs_task_followers_task_id_3c5f8415b71be305_uniq` (`task_id`,`user_id`),
  KEY `jobs_task_followers_c00fe455` (`task_id`),
  KEY `jobs_task_followers_fbfc09f1` (`user_id`),
  CONSTRAINT `task_id_refs_id_5a5a6fc06b33b327` FOREIGN KEY (`task_id`) REFERENCES `jobs_task` (`id`),
  CONSTRAINT `user_id_refs_id_147949703545a8d5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_task_followers`
--

LOCK TABLES `jobs_task_followers` WRITE;
/*!40000 ALTER TABLE `jobs_task_followers` DISABLE KEYS */;
INSERT INTO `jobs_task_followers` VALUES (2,2,1),(6,2,4);
/*!40000 ALTER TABLE `jobs_task_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_benefit`
--

DROP TABLE IF EXISTS `offer_benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_benefit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `max_affected_items` int(10) unsigned DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proxy_class` (`proxy_class`),
  KEY `offer_benefit_647ae97e` (`range_id`),
  CONSTRAINT `range_id_refs_id_37c969ae3fabdc23` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_benefit`
--

LOCK TABLES `offer_benefit` WRITE;
/*!40000 ALTER TABLE `offer_benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_condition`
--

DROP TABLE IF EXISTS `offer_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proxy_class` (`proxy_class`),
  KEY `offer_condition_647ae97e` (`range_id`),
  CONSTRAINT `range_id_refs_id_1e7eaa0975a43a55` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_condition`
--

LOCK TABLES `offer_condition` WRITE;
/*!40000 ALTER TABLE `offer_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_conditionaloffer`
--

DROP TABLE IF EXISTS `offer_conditionaloffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_conditionaloffer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` longtext,
  `offer_type` varchar(128) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `benefit_id` int(11) NOT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `date_created` datetime NOT NULL,
  `redirect_url` varchar(200) NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `max_basket_applications` int(10) unsigned DEFAULT NULL,
  `max_global_applications` int(10) unsigned DEFAULT NULL,
  `num_applications` int(10) unsigned NOT NULL,
  `max_user_applications` int(10) unsigned DEFAULT NULL,
  `max_discount` decimal(12,2) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_conditionaloffer_name_3c29ac426cd12ce3_uniq` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `offer_conditionaloffer_115412aa` (`condition_id`),
  KEY `offer_conditionaloffer_c439f5be` (`benefit_id`),
  CONSTRAINT `benefit_id_refs_id_2a480383896eaff9` FOREIGN KEY (`benefit_id`) REFERENCES `offer_benefit` (`id`),
  CONSTRAINT `condition_id_refs_id_482b04c74cbf159f` FOREIGN KEY (`condition_id`) REFERENCES `offer_condition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_conditionaloffer`
--

LOCK TABLES `offer_conditionaloffer` WRITE;
/*!40000 ALTER TABLE `offer_conditionaloffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_conditionaloffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range`
--

DROP TABLE IF EXISTS `offer_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `includes_all_products` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `offer_range_proxy_class_7b62e7b2541da6a2_uniq` (`proxy_class`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range`
--

LOCK TABLES `offer_range` WRITE;
/*!40000 ALTER TABLE `offer_range` DISABLE KEYS */;
INSERT INTO `offer_range` VALUES (1,'All Products',1,'2013-05-11 08:55:35',NULL);
/*!40000 ALTER TABLE `offer_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_classes`
--

DROP TABLE IF EXISTS `offer_range_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `productclass_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_classes_range_id_bdcb6b196150337_uniq` (`range_id`,`productclass_id`),
  KEY `offer_range_classes_647ae97e` (`range_id`),
  KEY `offer_range_classes_4c96c09` (`productclass_id`),
  CONSTRAINT `productclass_id_refs_id_7a86d1e2ad9a6e34` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`),
  CONSTRAINT `range_id_refs_id_29566c470e41d468` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_classes`
--

LOCK TABLES `offer_range_classes` WRITE;
/*!40000 ALTER TABLE `offer_range_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_excluded_products`
--

DROP TABLE IF EXISTS `offer_range_excluded_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_excluded_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_excluded_products_range_id_517164c1e1e8929f_uniq` (`range_id`,`product_id`),
  KEY `offer_range_excluded_products_647ae97e` (`range_id`),
  KEY `offer_range_excluded_products_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_1765b916c933abc0` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `range_id_refs_id_11146fb51a830b0b` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_excluded_products`
--

LOCK TABLES `offer_range_excluded_products` WRITE;
/*!40000 ALTER TABLE `offer_range_excluded_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_excluded_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_included_categories`
--

DROP TABLE IF EXISTS `offer_range_included_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_included_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_included_categories_range_id_1e886d89e69b6665_uniq` (`range_id`,`category_id`),
  KEY `offer_range_included_categories_647ae97e` (`range_id`),
  KEY `offer_range_included_categories_42dc49bc` (`category_id`),
  CONSTRAINT `category_id_refs_id_76a54aaa88b70c86` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `range_id_refs_id_188df0a5c2639403` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_included_categories`
--

LOCK TABLES `offer_range_included_categories` WRITE;
/*!40000 ALTER TABLE `offer_range_included_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_included_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_included_products`
--

DROP TABLE IF EXISTS `offer_range_included_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_included_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_included_products_range_id_5653de41c69b5815_uniq` (`range_id`,`product_id`),
  KEY `offer_range_included_products_647ae97e` (`range_id`),
  KEY `offer_range_included_products_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_1a75e0f42e44edc2` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `range_id_refs_id_40fb1ebce577c797` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_included_products`
--

LOCK TABLES `offer_range_included_products` WRITE;
/*!40000 ALTER TABLE `offer_range_included_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_included_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options_artworkitem`
--

DROP TABLE IF EXISTS `options_artworkitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options_artworkitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `uploaded_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `options_artworkitem_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_7b69495` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options_artworkitem`
--

LOCK TABLES `options_artworkitem` WRITE;
/*!40000 ALTER TABLE `options_artworkitem` DISABLE KEYS */;
INSERT INTO `options_artworkitem` VALUES (4,4,'artwork/2013/07/16/genius-automotive2.png','2013-07-16 08:03:28'),(9,10,'artwork/2013/07/17/Safari.dll','2013-07-17 19:33:04'),(10,10,'artwork/2013/07/24/git-cheat-sheet.pdf','2013-07-24 19:31:00'),(11,10,'artwork/2013/07/26/Skolar_specimen.pdf','2013-07-26 10:30:43'),(12,11,'artwork/2013/07/29/21080_1600x1200-wallpaper-cb1276291832.jpg','2013-07-29 11:29:14'),(13,11,'artwork/2013/08/03/aldo.jpg','2013-08-03 11:52:03'),(14,1,'artwork/2013/08/05/genius-automotive2.png','2013-08-05 10:11:25'),(15,4,'artwork/2013/08/15/Business_Card_-_Blank_PRINT.pdf','2013-08-15 07:59:29');
/*!40000 ALTER TABLE `options_artworkitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options_optionchoice`
--

DROP TABLE IF EXISTS `options_optionchoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options_optionchoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `option_id` int(11) NOT NULL,
  `caption` varchar(30) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_id` (`option_id`,`code`),
  KEY `options_optionchoice_65da3d2c` (`code`),
  KEY `options_optionchoice_2f3b0dc9` (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options_optionchoice`
--

LOCK TABLES `options_optionchoice` WRITE;
/*!40000 ALTER TABLE `options_optionchoice` DISABLE KEYS */;
INSERT INTO `options_optionchoice` VALUES (226,'300',76,'300',''),(227,'none',77,'none',''),(228,'single',77,'single',''),(229,'90x55',78,'90x55',''),(230,'matt',79,'matt',''),(231,'silk',79,'silk',''),(232,'gloss',79,'gloss',''),(233,'recycled',79,'recycled',''),(234,'corners',80,'corners',''),(235,'foil',80,'foil',''),(236,'10',81,'10 Cards',''),(237,'30',81,'30 Cards',''),(238,'50',81,'50 Cards',''),(239,'100',81,'100 Cards',''),(240,'300',81,'300 Cards',''),(241,'portrait',82,'portrait',''),(242,'landscape',82,'landscape',''),(243,'a5',78,'a5',''),(244,'ss',83,'ss',''),(245,'none',84,'none',''),(246,'gloss',84,'gloss',''),(247,'matt',84,'matt',''),(248,'anti-scratch',84,'anti-scratch',''),(249,'2mm-foamex',85,'2mm-foamex',''),(250,'3mm-foamex',85,'3mm-foamex',''),(251,'a4',78,'a4',''),(252,'a3',78,'a3',''),(253,'a2',78,'a2',''),(254,'a1',78,'a1',''),(255,'a0',78,'a0',''),(256,'8ftx4ft',78,'8ftx4ft',''),(257,'300x420',78,'300x420',''),(258,'600x420',78,'600x420',''),(259,'900x420',78,'900x420',''),(260,'420x1200',78,'420x1200',''),(261,'300x600',78,'300x600',''),(262,'600x600',78,'600x600',''),(263,'900x600',78,'900x600',''),(264,'1200x600',78,'1200x600',''),(265,'300x841',78,'300x841',''),(266,'600x841',78,'600x841',''),(267,'900x841',78,'900x841',''),(268,'1200x841',78,'1200x841',''),(269,'300x1200',78,'300x1200',''),(270,'600x1200',78,'600x1200',''),(271,'900x1200',78,'900x1200',''),(272,'1200x1200',78,'1200x1200',''),(273,'300x1600',78,'300x1600',''),(274,'600x1600',78,'600x1600',''),(275,'900x1600',78,'900x1600',''),(276,'1200x1600',78,'1200x1600',''),(277,'300x2000',78,'300x2000',''),(278,'600x2000',78,'600x2000',''),(279,'900x2000',78,'900x2000',''),(280,'1200x2000',78,'1200x2000',''),(281,'300x2440',78,'300x2440',''),(282,'600x2440',78,'600x2440',''),(283,'900x2440',78,'900x2440',''),(284,'1200x2440',78,'1200x2440',''),(285,'ds',83,'ds',''),(286,'sa-vinyl',86,'sa-vinyl',''),(287,'10mm-foamex',85,'10mm-foamex',''),(288,'5mm-foamex',85,'5mm-foamex',''),(289,'3mm-acm',85,'3mm-acm',''),(290,'1000x420',78,'1000x420',''),(291,'420x1220',78,'420x1220',''),(292,'1000x600',78,'1000x600',''),(293,'1220x600',78,'1220x600',''),(294,'1000x841',78,'1000x841',''),(295,'1220x841',78,'1220x841',''),(296,'300x1220',78,'300x1220',''),(297,'600x1220',78,'600x1220',''),(298,'1000x1220',78,'1000x1220',''),(299,'1220x1220',78,'1220x1220',''),(300,'1000x1600',78,'1000x1600',''),(301,'1220x1600',78,'1220x1600',''),(302,'1000x2000',78,'1000x2000',''),(303,'1220x2000',78,'1220x2000',''),(304,'1000x2440',78,'1000x2440',''),(305,'1220x2440',78,'1220x2440',''),(306,'4mm-acm',85,'4mm-acm',''),(307,'4mm-correx',85,'4mm-correx',''),(308,'1000x1200',78,'1000x1200',''),(309,'10mm-correx',85,'10mm-correx',''),(310,'800x600',78,'800x600',''),(311,'5mm-sponge',85,'5mm-sponge',''),(312,'10mm-sponge',85,'10mm-sponge',''),(313,'120',76,'120',''),(314,'135',76,'135',''),(315,'150',76,'150',''),(316,'160',76,'160',''),(317,'saddle-stitched',87,'saddle-stitched',''),(318,'uncoated',79,'uncoated',''),(319,'8',88,'8',''),(320,'self-cover',85,'self-cover',''),(321,'12',88,'12',''),(322,'16',88,'16',''),(323,'20',88,'20',''),(324,'24',88,'24',''),(325,'28',88,'28',''),(326,'32',88,'32',''),(327,'silk',89,'silk',''),(328,'gloss',89,'gloss',''),(329,'uncoated',89,'uncoated',''),(330,'250gsm-cover',85,'250gsm-cover',''),(331,'self',85,'self',''),(332,'100',76,'100',''),(333,'115',76,'115',''),(334,'170',76,'170',''),(335,'200',76,'200',''),(336,'250',76,'250',''),(337,'350',76,'350',''),(338,'left',87,'left',''),(339,'top',87,'top',''),(340,'white',90,'white',''),(341,'black-board',90,'black-board',''),(342,'clear',89,'clear',''),(343,'01-oct',88,'01-oct',''),(344,'nov-20',88,'nov-20',''),(345,'21-30',88,'21-30',''),(346,'31-40',88,'31-40',''),(347,'41-50',88,'41-50',''),(348,'51-60',88,'51-60',''),(349,'61-70',88,'61-70',''),(350,'195mic',76,'195mic',''),(351,'800',78,'800',''),(352,'indoor',91,'indoor',''),(353,'1000',78,'1000',''),(354,'800x2000',78,'800x2000',''),(355,'pvc',86,'pvc',''),(356,'static',85,'static',''),(357,'3x3',78,'3x3',''),(358,'pop-ip',85,'pop-ip',''),(359,'no-graphics',85,'no-graphics',''),(360,'curved',85,'curved',''),(361,'withcase',85,'withcase',''),(362,'pop-up',85,'pop-up',''),(363,'included-graphics',85,'included-graphics',''),(364,'4x3',78,'4x3',''),(365,'outdoor',91,'outdoor',''),(366,'650-800x1200-2000',78,'650-800x1200-2000',''),(367,'2000x1000',78,'2000x1000',''),(368,'3000x1000',78,'3000x1000',''),(369,'small',78,'small',''),(370,'large',78,'large',''),(371,'rounded-top',85,'rounded-top',''),(372,'dl',78,'dl',''),(373,'a6',78,'a6',''),(374,'square',82,'square',''),(375,'210x210',78,'210x210',''),(376,'148x148',78,'148x148',''),(377,'lamination',80,'lamination',''),(378,'encapsulation',80,'encapsulation',''),(379,'photo-satin',79,'photo-satin',''),(380,'photo-gloss',79,'photo-gloss',''),(381,'260',76,'260',''),(382,'satin',79,'satin',''),(383,'blue-back',79,'blue-back',''),(384,'75',76,'75',''),(385,'tyvek',79,'tyvek',''),(386,'fine-linen',79,'fine-linen',''),(387,'9',92,'9',''),(388,'14',92,'14',''),(389,'15',92,'15',''),(390,'11',92,'11',''),(391,'16',92,'16',''),(392,'17',92,'17',''),(393,'13',92,'13',''),(394,'18',92,'18',''),(395,'19',92,'19',''),(396,'10',92,'10',''),(397,'30x20',78,'30x20',''),(398,'40x30',78,'40x30',''),(399,'60x40',78,'60x40',''),(400,'6ftx4ft',78,'6ftx4ft',''),(401,'85x55',78,'85x55',''),(402,'none',80,'none',''),(403,'round-corners',80,'round-corners',''),(404,'170x55',78,'170x55',''),(405,'half',80,'half',''),(406,'210x99',78,'210x99',''),(407,'29',93,'29',''),(408,'15',93,'15','');
/*!40000 ALTER TABLE `options_optionchoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options_optionchoice_conflicts_with`
--

DROP TABLE IF EXISTS `options_optionchoice_conflicts_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options_optionchoice_conflicts_with` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_optionchoice_id` int(11) NOT NULL,
  `to_optionchoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_optionchoice_id` (`from_optionchoice_id`,`to_optionchoice_id`),
  KEY `options_optionchoice_conflicts_with_9cff69ac` (`from_optionchoice_id`),
  KEY `options_optionchoice_conflicts_with_8b7ffec3` (`to_optionchoice_id`),
  CONSTRAINT `from_optionchoice_id_refs_id_7474c8d9` FOREIGN KEY (`from_optionchoice_id`) REFERENCES `options_optionchoice` (`id`),
  CONSTRAINT `to_optionchoice_id_refs_id_7474c8d9` FOREIGN KEY (`to_optionchoice_id`) REFERENCES `options_optionchoice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options_optionchoice_conflicts_with`
--

LOCK TABLES `options_optionchoice_conflicts_with` WRITE;
/*!40000 ALTER TABLE `options_optionchoice_conflicts_with` DISABLE KEYS */;
/*!40000 ALTER TABLE `options_optionchoice_conflicts_with` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options_optionpicker`
--

DROP TABLE IF EXISTS `options_optionpicker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options_optionpicker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `widget` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_id` (`option_id`),
  KEY `options_optionpicker_bda51c3c` (`group_id`),
  KEY `options_optionpicker_b2fabe42` (`position`),
  CONSTRAINT `group_id_refs_id_734ba391` FOREIGN KEY (`group_id`) REFERENCES `options_optionpickergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options_optionpicker`
--

LOCK TABLES `options_optionpicker` WRITE;
/*!40000 ALTER TABLE `options_optionpicker` DISABLE KEYS */;
INSERT INTO `options_optionpicker` VALUES (33,1,76,5,'thumbnail'),(34,1,77,4,'thumbnail'),(35,1,78,3,'thumbnail'),(36,1,79,2,'thumbnail'),(37,1,80,1,'thumbnail'),(39,1,93,0,'thumbnail'),(40,1,81,0,'thumbnail'),(41,1,82,0,'thumbnail'),(42,1,83,0,'thumbnail'),(43,1,84,0,'thumbnail'),(44,1,85,0,'thumbnail'),(45,1,86,0,'thumbnail'),(46,1,87,0,'thumbnail'),(47,1,88,0,'thumbnail'),(48,1,89,0,'thumbnail'),(49,1,90,0,'thumbnail'),(50,1,91,0,'thumbnail'),(51,1,92,0,'thumbnail'),(52,1,94,0,'thumbnail');
/*!40000 ALTER TABLE `options_optionpicker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options_optionpickergroup`
--

DROP TABLE IF EXISTS `options_optionpickergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options_optionpickergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `options_optionpickergroup_b2fabe42` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options_optionpickergroup`
--

LOCK TABLES `options_optionpickergroup` WRITE;
/*!40000 ALTER TABLE `options_optionpickergroup` DISABLE KEYS */;
INSERT INTO `options_optionpickergroup` VALUES (1,'Product Options',1),(2,'Finishing',3),(3,'Stock Options',2),(4,'Cover',4),(5,'Booklet Options',5),(6,'Binding',2),(7,'Option',0);
/*!40000 ALTER TABLE `options_optionpickergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_billingaddress`
--

DROP TABLE IF EXISTS `order_billingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_billingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `line3` varchar(255) DEFAULT NULL,
  `line4` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postcode` varchar(64) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `search_text` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_billingaddress_534dd89` (`country_id`),
  CONSTRAINT `country_id_refs_iso_3166_1_a2_46dc039dbc502af1` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_billingaddress`
--

LOCK TABLES `order_billingaddress` WRITE;
/*!40000 ALTER TABLE `order_billingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_billingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_communicationevent`
--

DROP TABLE IF EXISTS `order_communicationevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_communicationevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_communicationevent_8337030b` (`order_id`),
  KEY `order_communicationevent_cb60d07f` (`event_type_id`),
  CONSTRAINT `event_type_id_refs_id_ba3124ff879d694` FOREIGN KEY (`event_type_id`) REFERENCES `customer_communicationeventtype` (`id`),
  CONSTRAINT `order_id_refs_id_7fa8c830b8eb0eba` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_communicationevent`
--

LOCK TABLES `order_communicationevent` WRITE;
/*!40000 ALTER TABLE `order_communicationevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_communicationevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `partner_name` varchar(128) NOT NULL,
  `partner_sku` varchar(128) NOT NULL,
  `title` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `line_price_incl_tax` decimal(12,2) NOT NULL,
  `line_price_excl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_incl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_excl_tax` decimal(12,2) NOT NULL,
  `unit_cost_price` decimal(12,2) DEFAULT NULL,
  `unit_price_incl_tax` decimal(12,2) DEFAULT NULL,
  `unit_price_excl_tax` decimal(12,2) DEFAULT NULL,
  `unit_retail_price` decimal(12,2) DEFAULT NULL,
  `partner_line_reference` varchar(128) DEFAULT NULL,
  `partner_line_notes` longtext,
  `status` varchar(255) DEFAULT NULL,
  `est_dispatch_date` date DEFAULT NULL,
  `upc` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_line_8337030b` (`order_id`),
  KEY `order_line_76043359` (`partner_id`),
  KEY `order_line_bb420c12` (`product_id`),
  CONSTRAINT `order_id_refs_id_41b6b2c9d42195c6` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `partner_id_refs_id_45e863e667e3d83e` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `product_id_refs_id_2650c43364803c72` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,1,1,'The Main Partner','iuny098','Business Card',17,50,0.00,0.00,0.00,0.00,987.00,0.00,0.00,987.00,NULL,NULL,'Pending',NULL,'121212121212'),(2,1,1,'The Main Partner','iuny098','Business Card',17,50,27.00,27.00,27.00,27.00,987.00,0.54,0.54,987.00,NULL,NULL,'Pending',NULL,'121212121212'),(3,2,1,'The Main Partner','iuny098','Business Card',17,700,70.00,70.00,70.00,70.00,987.00,0.10,0.10,987.00,NULL,NULL,'Pending',NULL,'121212121212'),(4,3,1,'The Main Partner','iuny098','Business Card',17,100,32.00,32.00,32.00,32.00,987.00,0.32,0.32,987.00,NULL,NULL,'Pending',NULL,'121212121212');
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lineattribute`
--

DROP TABLE IF EXISTS `order_lineattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lineattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `type` varchar(128) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lineattribute_92b3444a` (`line_id`),
  KEY `order_lineattribute_2f3b0dc9` (`option_id`),
  CONSTRAINT `line_id_refs_id_38dee8035c8609ba` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `option_id_refs_id_6f5636bb5d7ef970` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lineattribute`
--

LOCK TABLES `order_lineattribute` WRITE;
/*!40000 ALTER TABLE `order_lineattribute` DISABLE KEYS */;
INSERT INTO `order_lineattribute` VALUES (1,1,NULL,'fold','single'),(2,1,NULL,'size','90x55'),(3,1,NULL,'stock','silk'),(4,1,NULL,'weight','300'),(5,2,NULL,'finish','round-corners'),(6,2,NULL,'lamination','matt'),(7,2,NULL,'orientation','Landscape'),(8,2,NULL,'printed','Single Sided'),(9,2,NULL,'size','85x55'),(10,2,NULL,'stock','matt'),(11,2,NULL,'weight','350'),(12,3,NULL,'finish','none'),(13,3,NULL,'lamination','matt'),(14,3,NULL,'orientation','Landscape'),(15,3,NULL,'printed','Single Sided'),(16,3,NULL,'size','85x55'),(17,3,NULL,'stock','silk'),(18,3,NULL,'weight','350'),(19,4,NULL,'finish','none'),(20,4,NULL,'lamination','gloss'),(21,4,NULL,'orientation','Landscape'),(22,4,NULL,'printed','Double Sided'),(23,4,NULL,'size','85x55'),(24,4,NULL,'stock','silk'),(25,4,NULL,'weight','350');
/*!40000 ALTER TABLE `order_lineattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lineprice`
--

DROP TABLE IF EXISTS `order_lineprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lineprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price_incl_tax` decimal(12,2) NOT NULL,
  `price_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lineprice_8337030b` (`order_id`),
  KEY `order_lineprice_92b3444a` (`line_id`),
  CONSTRAINT `line_id_refs_id_200dbb454e9f1385` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `order_id_refs_id_69b3fb8dd6da2c8e` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lineprice`
--

LOCK TABLES `order_lineprice` WRITE;
/*!40000 ALTER TABLE `order_lineprice` DISABLE KEYS */;
INSERT INTO `order_lineprice` VALUES (1,1,1,50,0.00,0.00,0.00,0.00),(2,1,2,50,0.54,0.54,0.00,0.00),(3,2,3,700,0.10,0.10,0.00,0.00),(4,3,4,100,0.32,0.32,0.00,0.00);
/*!40000 ALTER TABLE `order_lineprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(128) NOT NULL,
  `site_id` int(11) NOT NULL,
  `basket_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `total_incl_tax` decimal(12,2) NOT NULL,
  `total_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `shipping_method` varchar(128) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date_placed` datetime NOT NULL,
  `guest_email` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_7c2dab66` (`number`),
  KEY `order_order_6223029` (`site_id`),
  KEY `order_order_fbfc09f1` (`user_id`),
  KEY `order_order_c624c233` (`billing_address_id`),
  KEY `order_order_20484567` (`shipping_address_id`),
  KEY `order_order_aec39660` (`date_placed`),
  CONSTRAINT `billing_address_id_refs_id_6dfa75419ae0c54d` FOREIGN KEY (`billing_address_id`) REFERENCES `order_billingaddress` (`id`),
  CONSTRAINT `shipping_address_id_refs_id_6806ac37922eb951` FOREIGN KEY (`shipping_address_id`) REFERENCES `order_shippingaddress` (`id`),
  CONSTRAINT `site_id_refs_id_431ca369672c7579` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `user_id_refs_id_5c3d57cd7cecdbde` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (1,'100011',1,11,11,NULL,27.00,27.00,0.00,0.00,1,'Free shipping Free shipping','Pending','2013-08-03 13:57:25','bazaretas-facilitator@gmail.com'),(2,'100001',1,1,1,NULL,70.00,70.00,0.00,0.00,2,'Free shipping','Pending','2013-08-05 14:20:55','bazaretas-facilitator@gmail.com'),(3,'100003',1,3,4,NULL,32.00,32.00,0.00,0.00,3,'Free shipping','Pending','2013-08-05 14:29:24','bazaretas-facilitator@gmail.com');
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdiscount`
--

DROP TABLE IF EXISTS `order_orderdiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderdiscount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `offer_id` int(10) unsigned DEFAULT NULL,
  `voucher_id` int(10) unsigned DEFAULT NULL,
  `voucher_code` varchar(128) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `offer_name` varchar(128) DEFAULT NULL,
  `frequency` int(10) unsigned DEFAULT NULL,
  `category` varchar(64) NOT NULL,
  `message` longtext,
  PRIMARY KEY (`id`),
  KEY `order_orderdiscount_8337030b` (`order_id`),
  KEY `order_orderdiscount_740e861f` (`voucher_code`),
  KEY `order_orderdiscount_e25d1f01` (`offer_name`),
  CONSTRAINT `order_id_refs_id_2859e864edf6808a` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdiscount`
--

LOCK TABLES `order_orderdiscount` WRITE;
/*!40000 ALTER TABLE `order_orderdiscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ordernote`
--

DROP TABLE IF EXISTS `order_ordernote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_ordernote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note_type` varchar(128) DEFAULT NULL,
  `message` longtext NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_ordernote_8337030b` (`order_id`),
  KEY `order_ordernote_fbfc09f1` (`user_id`),
  CONSTRAINT `order_id_refs_id_339c790b43539aed` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `user_id_refs_id_6265a0c220ba9fb6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ordernote`
--

LOCK TABLES `order_ordernote` WRITE;
/*!40000 ALTER TABLE `order_ordernote` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_ordernote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymentevent`
--

DROP TABLE IF EXISTS `order_paymentevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymentevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_paymentevent_8337030b` (`order_id`),
  KEY `order_paymentevent_cb60d07f` (`event_type_id`),
  CONSTRAINT `event_type_id_refs_id_4a8935f09811ffa1` FOREIGN KEY (`event_type_id`) REFERENCES `order_paymenteventtype` (`id`),
  CONSTRAINT `order_id_refs_id_7a07cc6e91bf25f2` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymentevent`
--

LOCK TABLES `order_paymentevent` WRITE;
/*!40000 ALTER TABLE `order_paymentevent` DISABLE KEYS */;
INSERT INTO `order_paymentevent` VALUES (1,1,27.00,1,'2013-08-03 13:57:28'),(2,2,70.00,1,'2013-08-05 14:20:57'),(3,3,32.00,1,'2013-08-05 14:29:29');
/*!40000 ALTER TABLE `order_paymentevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymenteventquantity`
--

DROP TABLE IF EXISTS `order_paymenteventquantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymenteventquantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_paymenteventquantity_e9b82f95` (`event_id`),
  KEY `order_paymenteventquantity_92b3444a` (`line_id`),
  CONSTRAINT `event_id_refs_id_245047245ab5ee` FOREIGN KEY (`event_id`) REFERENCES `order_paymentevent` (`id`),
  CONSTRAINT `line_id_refs_id_7a93bc6292614f2e` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymenteventquantity`
--

LOCK TABLES `order_paymenteventquantity` WRITE;
/*!40000 ALTER TABLE `order_paymenteventquantity` DISABLE KEYS */;
INSERT INTO `order_paymenteventquantity` VALUES (1,1,1,50),(2,1,2,50),(3,2,3,700),(4,3,4,100);
/*!40000 ALTER TABLE `order_paymenteventquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymenteventtype`
--

DROP TABLE IF EXISTS `order_paymenteventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymenteventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `sequence_number` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymenteventtype`
--

LOCK TABLES `order_paymenteventtype` WRITE;
/*!40000 ALTER TABLE `order_paymenteventtype` DISABLE KEYS */;
INSERT INTO `order_paymenteventtype` VALUES (1,'Settled','settled',0);
/*!40000 ALTER TABLE `order_paymenteventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingaddress`
--

DROP TABLE IF EXISTS `order_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `line3` varchar(255) DEFAULT NULL,
  `line4` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postcode` varchar(64) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `search_text` varchar(1000) NOT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`),
  KEY `order_shippingaddress_534dd89` (`country_id`),
  CONSTRAINT `country_id_refs_iso_3166_1_a2_791be16a6ed25861` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingaddress`
--

LOCK TABLES `order_shippingaddress` WRITE;
/*!40000 ALTER TABLE `order_shippingaddress` DISABLE KEYS */;
INSERT INTO `order_shippingaddress` VALUES (1,NULL,'facilitator','account\'s Test Store','1 Main St',NULL,NULL,'San Jose','CA','95131','us','facilitator account\'s Test Store 1 Main St San Jose CA 95131 usa',NULL,NULL),(2,NULL,'facilitator','account\'s Test Store','1 Main St',NULL,NULL,'San Jose','CA','95131','us','facilitator account\'s Test Store 1 Main St San Jose CA 95131 usa',NULL,NULL),(3,NULL,'facilitator','account\'s Test Store','1 Main St',NULL,NULL,'San Jose','CA','95131','us','facilitator account\'s Test Store 1 Main St San Jose CA 95131 usa',NULL,NULL);
/*!40000 ALTER TABLE `order_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingevent`
--

DROP TABLE IF EXISTS `order_shippingevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `notes` longtext,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shippingevent_8337030b` (`order_id`),
  KEY `order_shippingevent_cb60d07f` (`event_type_id`),
  CONSTRAINT `event_type_id_refs_id_57226223bd6239df` FOREIGN KEY (`event_type_id`) REFERENCES `order_shippingeventtype` (`id`),
  CONSTRAINT `order_id_refs_id_65a0187ef9e4abd9` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingevent`
--

LOCK TABLES `order_shippingevent` WRITE;
/*!40000 ALTER TABLE `order_shippingevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingeventquantity`
--

DROP TABLE IF EXISTS `order_shippingeventquantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingeventquantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shippingeventquantity_e9b82f95` (`event_id`),
  KEY `order_shippingeventquantity_92b3444a` (`line_id`),
  CONSTRAINT `event_id_refs_id_29aa204d1d104ab4` FOREIGN KEY (`event_id`) REFERENCES `order_shippingevent` (`id`),
  CONSTRAINT `line_id_refs_id_5c3a0f25bda203b3` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingeventquantity`
--

LOCK TABLES `order_shippingeventquantity` WRITE;
/*!40000 ALTER TABLE `order_shippingeventquantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingeventquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingeventtype`
--

DROP TABLE IF EXISTS `order_shippingeventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingeventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(128) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `sequence_number` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingeventtype`
--

LOCK TABLES `order_shippingeventtype` WRITE;
/*!40000 ALTER TABLE `order_shippingeventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner`
--

DROP TABLE IF EXISTS `partner_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_partner_code_6d336eee39c91508_uniq` (`code`),
  KEY `partner_partner_65da3d2c` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner`
--

LOCK TABLES `partner_partner` WRITE;
/*!40000 ALTER TABLE `partner_partner` DISABLE KEYS */;
INSERT INTO `partner_partner` VALUES (1,'The Main Partner','TMP');
/*!40000 ALTER TABLE `partner_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner_users`
--

DROP TABLE IF EXISTS `partner_partner_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_partner_users_partner_id_bd29f702075850b_uniq` (`partner_id`,`user_id`),
  KEY `partner_partner_users_76043359` (`partner_id`),
  KEY `partner_partner_users_fbfc09f1` (`user_id`),
  CONSTRAINT `partner_id_refs_id_364a17a781fd89d4` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `user_id_refs_id_348f5484bed11745` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner_users`
--

LOCK TABLES `partner_partner_users` WRITE;
/*!40000 ALTER TABLE `partner_partner_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_partner_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_stockalert`
--

DROP TABLE IF EXISTS `partner_stockalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_stockalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockrecord_id` int(11) NOT NULL,
  `threshold` int(10) unsigned NOT NULL,
  `status` varchar(128) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_closed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_abstractstockalert_c847f7ce` (`stockrecord_id`),
  CONSTRAINT `stockrecord_id_refs_id_b4acdf8626b5387` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockalert`
--

LOCK TABLES `partner_stockalert` WRITE;
/*!40000 ALTER TABLE `partner_stockalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_stockalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_stockrecord`
--

DROP TABLE IF EXISTS `partner_stockrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_stockrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `partner_sku` varchar(128) NOT NULL,
  `price_currency` varchar(12) NOT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `price_retail` decimal(12,2) DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT NULL,
  `num_in_stock` int(10) unsigned DEFAULT NULL,
  `num_allocated` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `low_stock_threshold` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  UNIQUE KEY `partner_stockrecord_partner_id_4faf51cd0ce15682_uniq` (`partner_id`,`partner_sku`),
  KEY `partner_stockrecord_76043359` (`partner_id`),
  KEY `partner_stockrecord_bdd0404b` (`date_updated`),
  CONSTRAINT `partner_id_refs_id_6271d43827fe0420` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `product_id_refs_id_3eac4eb59b3babbc` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockrecord`
--

LOCK TABLES `partner_stockrecord` WRITE;
/*!40000 ALTER TABLE `partner_stockrecord` DISABLE KEYS */;
INSERT INTO `partner_stockrecord` VALUES (4,19,1,'23532532532','GBP',44.00,55.00,66.00,13213132,0,'2013-07-24 20:20:36','2013-08-03 13:54:47',NULL),(5,17,1,'iuny098','GBP',987.00,987.00,987.00,987456467,850,'2013-08-03 13:56:04','2013-08-20 13:15:38',NULL),(6,72,1,'none','GBP',0.00,0.00,0.00,100000000,0,'2013-08-20 19:32:19','2013-08-20 19:32:19',1);
/*!40000 ALTER TABLE `partner_stockrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_bankcard`
--

DROP TABLE IF EXISTS `payment_bankcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_bankcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `card_type` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(32) NOT NULL,
  `expiry_date` date NOT NULL,
  `partner_reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_bankcard_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_6848b6499d4140ed` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_bankcard`
--

LOCK TABLES `payment_bankcard` WRITE;
/*!40000 ALTER TABLE `payment_bankcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_bankcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_source`
--

DROP TABLE IF EXISTS `payment_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `source_type_id` int(11) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `amount_allocated` decimal(12,2) NOT NULL,
  `amount_debited` decimal(12,2) NOT NULL,
  `amount_refunded` decimal(12,2) NOT NULL,
  `reference` varchar(128) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_source_8337030b` (`order_id`),
  KEY `payment_source_d4583c31` (`source_type_id`),
  CONSTRAINT `order_id_refs_id_211b9616ee4b5de3` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `source_type_id_refs_id_66931ec6b872619` FOREIGN KEY (`source_type_id`) REFERENCES `payment_sourcetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_source`
--

LOCK TABLES `payment_source` WRITE;
/*!40000 ALTER TABLE `payment_source` DISABLE KEYS */;
INSERT INTO `payment_source` VALUES (1,1,1,'GBP',27.00,27.00,0.00,NULL,NULL),(2,2,1,'GBP',70.00,70.00,0.00,NULL,NULL),(3,3,1,'GBP',32.00,32.00,0.00,NULL,NULL);
/*!40000 ALTER TABLE `payment_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sourcetype`
--

DROP TABLE IF EXISTS `payment_sourcetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sourcetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_sourcetype_65da3d2c` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sourcetype`
--

LOCK TABLES `payment_sourcetype` WRITE;
/*!40000 ALTER TABLE `payment_sourcetype` DISABLE KEYS */;
INSERT INTO `payment_sourcetype` VALUES (1,'PayPal','paypal');
/*!40000 ALTER TABLE `payment_sourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  `txn_type` varchar(128) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `reference` varchar(128) DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_transaction_89f89e85` (`source_id`),
  CONSTRAINT `source_id_refs_id_4222dbbcc4118383` FOREIGN KEY (`source_id`) REFERENCES `payment_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_expresstransaction`
--

DROP TABLE IF EXISTS `paypal_expresstransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_expresstransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_request` longtext NOT NULL,
  `raw_response` longtext NOT NULL,
  `response_time` double NOT NULL,
  `date_created` datetime NOT NULL,
  `method` varchar(32) NOT NULL,
  `version` varchar(8) NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `ack` varchar(32) NOT NULL,
  `correlation_id` varchar(32) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `error_code` varchar(32) DEFAULT NULL,
  `error_message` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_expresstransaction`
--

LOCK TABLES `paypal_expresstransaction` WRITE;
/*!40000 ALTER TABLE `paypal_expresstransaction` DISABLE KEYS */;
INSERT INTO `paypal_expresstransaction` VALUES (1,'PAYMENTREQUEST_0_ITEMAMT=100.00&L_PAYMENTREQUEST_0_QTY0=1&MAXAMT=100.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Banner+100x100&L_PAYMENTREQUEST_0_DESC0=Stop+your+co-workers+in+their+tracks+with+the+stunning+new+30-inch+diagonal+...&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=100.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=100.00&EMAIL=info%40theimip.com&L_PAYMENTREQUEST_0_NUMBER0=eragrgrgdsfg&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F3%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=100.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d91611521XR601093R&TIMESTAMP=2013%2d05%2d23T21%3a06%3a11Z&CORRELATIONID=a510d916cbf48&ACK=Success&VERSION=88%2e0&BUILD=6020375',1441.7610168457,'2013-05-23 21:08:30','SetExpressCheckout','88.0',100.00,'GBP','Success','a510d916cbf48','EC-91611521XR601093R',NULL,NULL),(2,'L_PAYMENTREQUEST_0_QTY1=1&L_PAYMENTREQUEST_0_QTY0=1&MAXAMT=210.00&L_PAYMENTREQUEST_0_QTY2=1&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_DESC2=3mmm+A4%26nbsp%3B&L_PAYMENTREQUEST_0_DESC1=Stop+your+co-workers+in+their+tracks+with+the+stunning+new+30-inch+diagonal+...&L_PAYMENTREQUEST_0_DESC0=Stop+your+co-workers+in+their+tracks+with+the+stunning+new+30-inch+diagonal+...&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&L_SHIPPINGOPTIONISDEFAULT0=true&EMAIL=info%40theimip.com&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=210.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PAYMENTREQUEST_0_HANDLINGAMT=0.00&PAYMENTREQUEST_0_TAXAMT=0.00&METHOD=SetExpressCheckout&PAYMENTREQUEST_0_ITEMAMT=210.00&L_PAYMENTREQUEST_0_NAME1=Banner+&L_PAYMENTREQUEST_0_NAME0=Banner+&L_PAYMENTREQUEST_0_NAME2=ACM+Panels&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&PAYMENTREQUEST_0_MAXAMT=210.00&L_PAYMENTREQUEST_0_AMT2=10.00&L_PAYMENTREQUEST_0_AMT1=100.00&L_PAYMENTREQUEST_0_AMT0=100.00&L_PAYMENTREQUEST_0_NUMBER1=eragrgrgdsfg&L_PAYMENTREQUEST_0_NUMBER0=eragrgrgdsfg&L_PAYMENTREQUEST_0_NUMBER2=69wd02-&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F3%2F&PWD=XXXXXX&PAYMENTREQUEST_0_PAYMENTACTION=Sale&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F','TOKEN=EC%2d69U33038FU440190L&TIMESTAMP=2013%2d06%2d01T07%3a25%3a48Z&CORRELATIONID=621b3fbc2573b&ACK=Success&VERSION=88%2e0&BUILD=6118442',1375.03004074097,'2013-06-01 07:28:21','SetExpressCheckout','88.0',210.00,'GBP','Success','621b3fbc2573b','EC-69U33038FU440190L',NULL,NULL),(3,'PAYMENTREQUEST_0_ITEMAMT=350.00&L_PAYMENTREQUEST_0_QTY0=10&MAXAMT=350.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Wiro+Bound+Booklet&L_PAYMENTREQUEST_0_DESC0=Wiro+bound+booklet+description+text&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=350.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=35.00&EMAIL=inventors%40mac.com&L_PAYMENTREQUEST_0_NUMBER0=11111111&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F12%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=350.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d66190809R3121750M&TIMESTAMP=2013%2d07%2d22T08%3a37%3a24Z&CORRELATIONID=f2284d32576bc&ACK=Success&VERSION=88%2e0&BUILD=6868861',2342.17381477356,'2013-07-22 08:41:17','SetExpressCheckout','88.0',350.00,'GBP','Success','f2284d32576bc','EC-66190809R3121750M',NULL,NULL),(4,'PAYMENTREQUEST_0_ITEMAMT=21.00&L_PAYMENTREQUEST_0_QTY0=300&MAXAMT=21.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=Business+card+description+text%3Cbr%3E%3Cbr%3ELorem+ipsum+....&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=21.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.07&EMAIL=info%40theimip.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F3%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=21.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d04B88795RE5789230&TIMESTAMP=2013%2d07%2d24T19%3a53%3a20Z&CORRELATIONID=b3061303176ce&ACK=Success&VERSION=88%2e0&BUILD=6941909',1127.76708602905,'2013-07-24 19:57:17','SetExpressCheckout','88.0',21.00,'GBP','Success','b3061303176ce','EC-04B88795RE5789230',NULL,NULL),(5,'PAYMENTREQUEST_0_ITEMAMT=21.00&L_PAYMENTREQUEST_0_QTY0=300&MAXAMT=21.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=Business+card+description+text%3Cbr%3E%3Cbr%3ELorem+ipsum+....&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=21.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.07&EMAIL=info%40theimip.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F3%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=21.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d7LL50603PY942850C&TIMESTAMP=2013%2d07%2d24T21%3a17%3a46Z&CORRELATIONID=b19473fbd245f&ACK=Success&VERSION=88%2e0&BUILD=6941909',2009.22393798828,'2013-07-24 21:21:43','SetExpressCheckout','88.0',21.00,'GBP','Success','b19473fbd245f','EC-7LL50603PY942850C',NULL,NULL),(6,'L_PAYMENTREQUEST_0_QTY1=150&L_PAYMENTREQUEST_0_QTY0=15&MAXAMT=474.50&L_PAYMENTREQUEST_0_QTY2=200&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_DESC2=Business+card+description+text%3Cbr%3E%3Cbr%3ELorem+ipsum+....&L_PAYMENTREQUEST_0_DESC1=Business+card+description+text%3Cbr%3E%3Cbr%3ELorem+ipsum+....&L_PAYMENTREQUEST_0_DESC0=Wiro+bound+booklet+description+text&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&L_SHIPPINGOPTIONISDEFAULT0=true&EMAIL=info%40westendlondonshop.cpm&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=474.50&L_SHIPPINGOPTIONAMOUNT0=0.00&PAYMENTREQUEST_0_HANDLINGAMT=0.00&PAYMENTREQUEST_0_TAXAMT=0.00&METHOD=SetExpressCheckout&PAYMENTREQUEST_0_ITEMAMT=474.50&L_PAYMENTREQUEST_0_NAME1=Business+Card&L_PAYMENTREQUEST_0_NAME0=Wiro+Bound+Booklet&L_PAYMENTREQUEST_0_NAME2=Business+Card&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&PAYMENTREQUEST_0_MAXAMT=474.50&L_PAYMENTREQUEST_0_AMT2=0.07&L_PAYMENTREQUEST_0_AMT1=0.07&L_PAYMENTREQUEST_0_AMT0=30.00&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_NUMBER0=11111111&L_PAYMENTREQUEST_0_NUMBER2=121212121212&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F10%2F&PWD=XXXXXX&PAYMENTREQUEST_0_PAYMENTACTION=Sale&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F','TOKEN=EC%2d48V2381286373153A&TIMESTAMP=2013%2d07%2d24T21%3a17%3a49Z&CORRELATIONID=ae5286b424706&ACK=Success&VERSION=88%2e0&BUILD=6941909',1350.29602050781,'2013-07-24 21:21:46','SetExpressCheckout','88.0',474.50,'GBP','Success','ae5286b424706','EC-48V2381286373153A',NULL,NULL),(7,'PAYMENTREQUEST_0_ITEMAMT=11.00&L_PAYMENTREQUEST_0_QTY0=50&MAXAMT=11.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=Business+card+description+text%3Cbr%3E%3Cbr%3ELorem+ipsum+....&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=11.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.22&EMAIL=inventors%40mac.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F12%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=11.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d7K9440776R308525W&TIMESTAMP=2013%2d08%2d01T08%3a12%3a05Z&CORRELATIONID=57624bac6f30b&ACK=Success&VERSION=88%2e0&BUILD=7131708',1716.52102470398,'2013-08-01 08:16:13','SetExpressCheckout','88.0',11.00,'GBP','Success','57624bac6f30b','EC-7K9440776R308525W',NULL,NULL),(8,'PAYMENTREQUEST_0_ITEMAMT=56.00&L_PAYMENTREQUEST_0_QTY0=400&MAXAMT=56.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=56.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.14&EMAIL=admin%40theimip.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F1%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=56.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d40E36099AC5928156&TIMESTAMP=2013%2d08%2d03T11%3a22%3a10Z&CORRELATIONID=c0dc7928d212e&ACK=Success&VERSION=88%2e0&BUILD=7161310',1587.18109130859,'2013-08-03 11:26:21','SetExpressCheckout','88.0',56.00,'GBP','Success','c0dc7928d212e','EC-40E36099AC5928156',NULL,NULL),(9,'L_PAYMENTREQUEST_0_QTY1=50&L_PAYMENTREQUEST_0_QTY0=50&MAXAMT=27.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_DESC1=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&L_SHIPPINGOPTIONISDEFAULT0=true&EMAIL=admin1%40theimip.com&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=27.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PAYMENTREQUEST_0_HANDLINGAMT=0.00&PAYMENTREQUEST_0_TAXAMT=0.00&METHOD=SetExpressCheckout&PAYMENTREQUEST_0_ITEMAMT=27.00&L_PAYMENTREQUEST_0_NAME1=Business+Card&L_PAYMENTREQUEST_0_NAME0=Business+Card&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&PAYMENTREQUEST_0_MAXAMT=27.00&L_PAYMENTREQUEST_0_AMT1=0.54&L_PAYMENTREQUEST_0_AMT0=0.00&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_NUMBER0=121212121212&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F11%2F&PWD=XXXXXX&PAYMENTREQUEST_0_PAYMENTACTION=Sale&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F','TOKEN=EC%2d4YP80719CY578214U&TIMESTAMP=2013%2d08%2d03T13%3a49%3a10Z&CORRELATIONID=cd24604a96f56&ACK=Success&VERSION=88%2e0&BUILD=7161310',1185.00518798828,'2013-08-03 13:53:22','SetExpressCheckout','88.0',27.00,'GBP','Success','cd24604a96f56','EC-4YP80719CY578214U',NULL,NULL),(10,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-4YP80719CY578214U&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d4YP80719CY578214U&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d03T13%3a49%3a37Z&CORRELATIONID=f30ec69eca5dd&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=27%2e00&ITEMAMT=27%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NAME1=Business%20Card&L_NUMBER0=121212121212&L_NUMBER1=121212121212&L_QTY0=50&L_QTY1=50&L_TAXAMT0=0%2e00&L_TAXAMT1=0%2e00&L_AMT0=0%2e00&L_AMT1=0%2e54&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE1=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=Callback&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping%20Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=27%2e00&PAYMENTREQUEST_0_ITEMAMT=27%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NAME1=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_QTY0=50&L_PAYMENTREQUEST_0_QTY1=50&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_TAXAMT1=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e00&L_PAYMENTREQUEST_0_AMT1=0%2e54&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE1=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',1147.21584320068,'2013-08-03 13:53:48','GetExpressCheckoutDetails','88.0',27.00,'GBP','Success','f30ec69eca5dd','EC-4YP80719CY578214U',NULL,NULL),(11,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-4YP80719CY578214U&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d4YP80719CY578214U&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d03T13%3a49%3a48Z&CORRELATIONID=b921e582230e&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=27%2e00&ITEMAMT=27%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NAME1=Business%20Card&L_NUMBER0=121212121212&L_NUMBER1=121212121212&L_QTY0=50&L_QTY1=50&L_TAXAMT0=0%2e00&L_TAXAMT1=0%2e00&L_AMT0=0%2e00&L_AMT1=0%2e54&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE1=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=Callback&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping%20Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=27%2e00&PAYMENTREQUEST_0_ITEMAMT=27%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NAME1=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_QTY0=50&L_PAYMENTREQUEST_0_QTY1=50&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_TAXAMT1=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e00&L_PAYMENTREQUEST_0_AMT1=0%2e54&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE1=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',977.957010269165,'2013-08-03 13:53:59','GetExpressCheckoutDetails','88.0',27.00,'GBP','Success','b921e582230e','EC-4YP80719CY578214U',NULL,NULL),(12,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-4YP80719CY578214U&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d4YP80719CY578214U&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d03T13%3a50%3a39Z&CORRELATIONID=2044c7aa88c5e&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=27%2e00&ITEMAMT=27%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NAME1=Business%20Card&L_NUMBER0=121212121212&L_NUMBER1=121212121212&L_QTY0=50&L_QTY1=50&L_TAXAMT0=0%2e00&L_TAXAMT1=0%2e00&L_AMT0=0%2e00&L_AMT1=0%2e54&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE1=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=Callback&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping%20Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=27%2e00&PAYMENTREQUEST_0_ITEMAMT=27%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NAME1=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_QTY0=50&L_PAYMENTREQUEST_0_QTY1=50&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_TAXAMT1=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e00&L_PAYMENTREQUEST_0_AMT1=0%2e54&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE1=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',976.742029190063,'2013-08-03 13:54:51','GetExpressCheckoutDetails','88.0',27.00,'GBP','Success','2044c7aa88c5e','EC-4YP80719CY578214U',NULL,NULL),(13,'L_PAYMENTREQUEST_0_QTY1=50&L_PAYMENTREQUEST_0_QTY0=50&MAXAMT=27.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_DESC1=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&L_SHIPPINGOPTIONISDEFAULT0=true&EMAIL=admin1%40theimip.com&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=27.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PAYMENTREQUEST_0_HANDLINGAMT=0.00&PAYMENTREQUEST_0_TAXAMT=0.00&METHOD=SetExpressCheckout&PAYMENTREQUEST_0_ITEMAMT=27.00&L_PAYMENTREQUEST_0_NAME1=Business+Card&L_PAYMENTREQUEST_0_NAME0=Business+Card&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&PAYMENTREQUEST_0_MAXAMT=27.00&L_PAYMENTREQUEST_0_AMT1=0.54&L_PAYMENTREQUEST_0_AMT0=0.00&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_NUMBER0=121212121212&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F11%2F&PWD=XXXXXX&PAYMENTREQUEST_0_PAYMENTACTION=Sale&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F','TOKEN=EC%2d99762353FU9144615&TIMESTAMP=2013%2d08%2d03T13%3a52%3a35Z&CORRELATIONID=b549b3c973a03&ACK=Success&VERSION=88%2e0&BUILD=7161310',1004.89401817322,'2013-08-03 13:56:47','SetExpressCheckout','88.0',27.00,'GBP','Success','b549b3c973a03','EC-99762353FU9144615',NULL,NULL),(14,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-99762353FU9144615&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d99762353FU9144615&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d03T13%3a53%3a00Z&CORRELATIONID=fc16a524b8d9d&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=27%2e00&ITEMAMT=27%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NAME1=Business%20Card&L_NUMBER0=121212121212&L_NUMBER1=121212121212&L_QTY0=50&L_QTY1=50&L_TAXAMT0=0%2e00&L_TAXAMT1=0%2e00&L_AMT0=0%2e00&L_AMT1=0%2e54&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE1=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=Callback&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping%20Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=27%2e00&PAYMENTREQUEST_0_ITEMAMT=27%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NAME1=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_QTY0=50&L_PAYMENTREQUEST_0_QTY1=50&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_TAXAMT1=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e00&L_PAYMENTREQUEST_0_AMT1=0%2e54&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE1=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',975.029945373535,'2013-08-03 13:57:12','GetExpressCheckoutDetails','88.0',27.00,'GBP','Success','fc16a524b8d9d','EC-99762353FU9144615',NULL,NULL),(15,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-99762353FU9144615&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d99762353FU9144615&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d03T13%3a53%3a09Z&CORRELATIONID=342424b9b8164&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=27%2e00&ITEMAMT=27%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NAME1=Business%20Card&L_NUMBER0=121212121212&L_NUMBER1=121212121212&L_QTY0=50&L_QTY1=50&L_TAXAMT0=0%2e00&L_TAXAMT1=0%2e00&L_AMT0=0%2e00&L_AMT1=0%2e54&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE1=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=Callback&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping%20Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=27%2e00&PAYMENTREQUEST_0_ITEMAMT=27%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NAME1=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_QTY0=50&L_PAYMENTREQUEST_0_QTY1=50&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_TAXAMT1=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e00&L_PAYMENTREQUEST_0_AMT1=0%2e54&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_DESC1=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE1=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE1=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',1030.0920009613,'2013-08-03 13:57:20','GetExpressCheckoutDetails','88.0',27.00,'GBP','Success','342424b9b8164','EC-99762353FU9144615',NULL,NULL),(16,'PAYMENTREQUEST_0_PAYMENTACTION=Sale&PAYERID=MZTF2MPL9G5BN&PAYMENTREQUEST_0_CURRENCYCODE=GBP&TOKEN=EC-99762353FU9144615&PAYMENTREQUEST_0_AMT=27.00&PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&METHOD=DoExpressCheckoutPayment','TOKEN=EC%2d99762353FU9144615&SUCCESSPAGEREDIRECTREQUESTED=false&TIMESTAMP=2013%2d08%2d03T13%3a53%3a13Z&CORRELATIONID=545e65ca296cc&ACK=Success&VERSION=88%2e0&BUILD=7161310&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=false&PAYMENTINFO_0_TRANSACTIONID=47K028084D767103V&PAYMENTINFO_0_TRANSACTIONTYPE=expresscheckout&PAYMENTINFO_0_PAYMENTTYPE=instant&PAYMENTINFO_0_ORDERTIME=2013%2d08%2d03T13%3a53%3a13Z&PAYMENTINFO_0_AMT=27%2e00&PAYMENTINFO_0_TAXAMT=0%2e00&PAYMENTINFO_0_CURRENCYCODE=GBP&PAYMENTINFO_0_PAYMENTSTATUS=Pending&PAYMENTINFO_0_PENDINGREASON=multicurrency&PAYMENTINFO_0_REASONCODE=None&PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible&PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None&PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=K2PAU8PLTW894&PAYMENTINFO_0_ERRORCODE=0&PAYMENTINFO_0_ACK=Success',3090.89708328247,'2013-08-03 13:57:25','DoExpressCheckoutPayment','88.0',27.00,'GBP','Success','545e65ca296cc','EC-99762353FU9144615',NULL,NULL),(17,'PAYMENTREQUEST_0_ITEMAMT=70.00&L_PAYMENTREQUEST_0_QTY0=700&MAXAMT=70.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=70.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.10&EMAIL=admin%40theimip.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F1%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=70.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d12E38282FJ844102P&TIMESTAMP=2013%2d08%2d05T14%3a13%3a50Z&CORRELATIONID=abc883d3bc7f2&ACK=Success&VERSION=88%2e0&BUILD=7161310',1373.77285957336,'2013-08-05 14:18:05','SetExpressCheckout','88.0',70.00,'GBP','Success','abc883d3bc7f2','EC-12E38282FJ844102P',NULL,NULL),(18,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-12E38282FJ844102P&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d12E38282FJ844102P&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d05T14%3a16%3a14Z&CORRELATIONID=b3d749ed8d0f9&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=70%2e00&ITEMAMT=70%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NUMBER0=121212121212&L_QTY0=700&L_TAXAMT0=0%2e00&L_AMT0=0%2e10&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=FlatRate&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=70%2e00&PAYMENTREQUEST_0_ITEMAMT=70%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_QTY0=700&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e10&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',1173.62809181213,'2013-08-05 14:20:29','GetExpressCheckoutDetails','88.0',70.00,'GBP','Success','b3d749ed8d0f9','EC-12E38282FJ844102P',NULL,NULL),(19,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-12E38282FJ844102P&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d12E38282FJ844102P&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d05T14%3a16%3a36Z&CORRELATIONID=43a4d77281b1a&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=70%2e00&ITEMAMT=70%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NUMBER0=121212121212&L_QTY0=700&L_TAXAMT0=0%2e00&L_AMT0=0%2e10&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=FlatRate&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=70%2e00&PAYMENTREQUEST_0_ITEMAMT=70%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_QTY0=700&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e10&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',963.37890625,'2013-08-05 14:20:51','GetExpressCheckoutDetails','88.0',70.00,'GBP','Success','43a4d77281b1a','EC-12E38282FJ844102P',NULL,NULL),(20,'PAYMENTREQUEST_0_PAYMENTACTION=Sale&PAYERID=MZTF2MPL9G5BN&PAYMENTREQUEST_0_CURRENCYCODE=GBP&TOKEN=EC-12E38282FJ844102P&PAYMENTREQUEST_0_AMT=70.00&PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&METHOD=DoExpressCheckoutPayment','TOKEN=EC%2d12E38282FJ844102P&SUCCESSPAGEREDIRECTREQUESTED=false&TIMESTAMP=2013%2d08%2d05T14%3a16%3a40Z&CORRELATIONID=b37898e688bec&ACK=Success&VERSION=88%2e0&BUILD=7161310&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=false&PAYMENTINFO_0_TRANSACTIONID=5LG32281TJ767331L&PAYMENTINFO_0_TRANSACTIONTYPE=expresscheckout&PAYMENTINFO_0_PAYMENTTYPE=instant&PAYMENTINFO_0_ORDERTIME=2013%2d08%2d05T14%3a16%3a39Z&PAYMENTINFO_0_AMT=70%2e00&PAYMENTINFO_0_TAXAMT=0%2e00&PAYMENTINFO_0_CURRENCYCODE=GBP&PAYMENTINFO_0_PAYMENTSTATUS=Pending&PAYMENTINFO_0_PENDINGREASON=multicurrency&PAYMENTINFO_0_REASONCODE=None&PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible&PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None&PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=K2PAU8PLTW894&PAYMENTINFO_0_ERRORCODE=0&PAYMENTINFO_0_ACK=Success',2405.37190437317,'2013-08-05 14:20:55','DoExpressCheckoutPayment','88.0',70.00,'GBP','Success','b37898e688bec','EC-12E38282FJ844102P',NULL,NULL),(21,'PAYMENTREQUEST_0_ITEMAMT=32.00&L_PAYMENTREQUEST_0_QTY0=100&MAXAMT=32.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=32.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.32&EMAIL=info%40theimip.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F3%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=32.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d6GD80178NH735893U&TIMESTAMP=2013%2d08%2d05T14%3a23%3a16Z&CORRELATIONID=9388de7d3959c&ACK=Success&VERSION=88%2e0&BUILD=7161310',926.023006439209,'2013-08-05 14:27:31','SetExpressCheckout','88.0',32.00,'GBP','Success','9388de7d3959c','EC-6GD80178NH735893U',NULL,NULL),(22,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-6GD80178NH735893U&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d6GD80178NH735893U&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d05T14%3a24%3a49Z&CORRELATIONID=c1940827956c1&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=32%2e00&ITEMAMT=32%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NUMBER0=121212121212&L_QTY0=100&L_TAXAMT0=0%2e00&L_AMT0=0%2e32&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=FlatRate&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=32%2e00&PAYMENTREQUEST_0_ITEMAMT=32%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_QTY0=100&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e32&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',986.80591583252,'2013-08-05 14:29:04','GetExpressCheckoutDetails','88.0',32.00,'GBP','Success','c1940827956c1','EC-6GD80178NH735893U',NULL,NULL),(23,'PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&TOKEN=EC-6GD80178NH735893U&METHOD=GetExpressCheckoutDetails','TOKEN=EC%2d6GD80178NH735893U&CHECKOUTSTATUS=PaymentActionNotInitiated&TIMESTAMP=2013%2d08%2d05T14%3a25%3a03Z&CORRELATIONID=5450c2b95677d&ACK=Success&VERSION=88%2e0&BUILD=7161310&EMAIL=bazaretas%2dfacilitator%40gmail%2ecom&PAYERID=MZTF2MPL9G5BN&PAYERSTATUS=verified&BUSINESS=facilitator%20account%27s%20Test%20Store&FIRSTNAME=facilitator&LASTNAME=account&COUNTRYCODE=US&SHIPTONAME=facilitator%20account%27s%20Test%20Store&SHIPTOSTREET=1%20Main%20St&SHIPTOCITY=San%20Jose&SHIPTOSTATE=CA&SHIPTOZIP=95131&SHIPTOCOUNTRYCODE=US&SHIPTOCOUNTRYNAME=United%20States&ADDRESSSTATUS=Confirmed&CURRENCYCODE=GBP&AMT=32%2e00&ITEMAMT=32%2e00&SHIPPINGAMT=0%2e00&HANDLINGAMT=0%2e00&TAXAMT=0%2e00&INSURANCEAMT=0%2e00&SHIPDISCAMT=0%2e00&INSURANCEOPTIONOFFERED=false&L_NAME0=Business%20Card&L_NUMBER0=121212121212&L_QTY0=100&L_TAXAMT0=0%2e00&L_AMT0=0%2e32&L_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_ITEMHEIGHTVALUE0=%20%20%200%2e00000&SHIPPINGCALCULATIONMODE=FlatRate&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=true&SHIPPINGOPTIONAMOUNT=0%2e00&SHIPPINGOPTIONNAME=Free%20shipping&PAYMENTREQUEST_0_CURRENCYCODE=GBP&PAYMENTREQUEST_0_AMT=32%2e00&PAYMENTREQUEST_0_ITEMAMT=32%2e00&PAYMENTREQUEST_0_SHIPPINGAMT=0%2e00&PAYMENTREQUEST_0_HANDLINGAMT=0%2e00&PAYMENTREQUEST_0_TAXAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEAMT=0%2e00&PAYMENTREQUEST_0_SHIPDISCAMT=0%2e00&PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED=false&PAYMENTREQUEST_0_SHIPTONAME=facilitator%20account%27s%20Test%20Store&PAYMENTREQUEST_0_SHIPTOSTREET=1%20Main%20St&PAYMENTREQUEST_0_SHIPTOCITY=San%20Jose&PAYMENTREQUEST_0_SHIPTOSTATE=CA&PAYMENTREQUEST_0_SHIPTOZIP=95131&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=US&PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME=United%20States&PAYMENTREQUEST_0_ADDRESSSTATUS=Confirmed&L_PAYMENTREQUEST_0_NAME0=Business%20Card&L_PAYMENTREQUEST_0_NUMBER0=121212121212&L_PAYMENTREQUEST_0_QTY0=100&L_PAYMENTREQUEST_0_TAXAMT0=0%2e00&L_PAYMENTREQUEST_0_AMT0=0%2e32&L_PAYMENTREQUEST_0_DESC0=A%20fabulous%20business%20card%20printed%20to%20a%20range%20of%20stocks%2e%20There%20is%20%2e%2e%2e&L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMLENGTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMWIDTHVALUE0=%20%20%200%2e00000&L_PAYMENTREQUEST_0_ITEMHEIGHTVALUE0=%20%20%200%2e00000&PAYMENTREQUESTINFO_0_ERRORCODE=0',1285.54010391235,'2013-08-05 14:29:18','GetExpressCheckoutDetails','88.0',32.00,'GBP','Success','5450c2b95677d','EC-6GD80178NH735893U',NULL,NULL),(24,'PAYMENTREQUEST_0_PAYMENTACTION=Sale&PAYERID=MZTF2MPL9G5BN&PAYMENTREQUEST_0_CURRENCYCODE=GBP&TOKEN=EC-6GD80178NH735893U&PAYMENTREQUEST_0_AMT=32.00&PWD=XXXXXX&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&METHOD=DoExpressCheckoutPayment','TOKEN=EC%2d6GD80178NH735893U&SUCCESSPAGEREDIRECTREQUESTED=false&TIMESTAMP=2013%2d08%2d05T14%3a25%3a09Z&CORRELATIONID=80ffb9adca3f5&ACK=Success&VERSION=88%2e0&BUILD=7161310&INSURANCEOPTIONSELECTED=false&SHIPPINGOPTIONISDEFAULT=false&PAYMENTINFO_0_TRANSACTIONID=0S44871367344764D&PAYMENTINFO_0_TRANSACTIONTYPE=expresscheckout&PAYMENTINFO_0_PAYMENTTYPE=instant&PAYMENTINFO_0_ORDERTIME=2013%2d08%2d05T14%3a25%3a08Z&PAYMENTINFO_0_AMT=32%2e00&PAYMENTINFO_0_TAXAMT=0%2e00&PAYMENTINFO_0_CURRENCYCODE=GBP&PAYMENTINFO_0_PAYMENTSTATUS=Pending&PAYMENTINFO_0_PENDINGREASON=multicurrency&PAYMENTINFO_0_REASONCODE=None&PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible&PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None&PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=K2PAU8PLTW894&PAYMENTINFO_0_ERRORCODE=0&PAYMENTINFO_0_ACK=Success',2425.39501190186,'2013-08-05 14:29:24','DoExpressCheckoutPayment','88.0',32.00,'GBP','Success','80ffb9adca3f5','EC-6GD80178NH735893U',NULL,NULL),(25,'PAYMENTREQUEST_0_ITEMAMT=27.00&L_PAYMENTREQUEST_0_QTY0=50&MAXAMT=27.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=27.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.54&EMAIL=dmalikcs%40gmail.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F18%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=27.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d40B35088GX116241H&TIMESTAMP=2013%2d08%2d15T13%3a07%3a07Z&CORRELATIONID=37490d1ad6d0f&ACK=Success&VERSION=88%2e0&BUILD=7319395',2851.06801986694,'2013-08-15 13:11:37','SetExpressCheckout','88.0',27.00,'GBP','Success','37490d1ad6d0f','EC-40B35088GX116241H',NULL,NULL),(26,'PAYMENTREQUEST_0_ITEMAMT=60.00&L_PAYMENTREQUEST_0_QTY0=250&MAXAMT=60.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=60.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.24&EMAIL=dmalikcs%40gmail.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F18%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=60.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d53U52973X1752344X&TIMESTAMP=2013%2d08%2d15T14%3a16%3a01Z&CORRELATIONID=1cc5024f6980d&ACK=Success&VERSION=88%2e0&BUILD=7319395',1158.76603126526,'2013-08-15 14:20:31','SetExpressCheckout','88.0',60.00,'GBP','Success','1cc5024f6980d','EC-53U52973X1752344X',NULL,NULL),(27,'PAYMENTREQUEST_0_ITEMAMT=40.00&L_PAYMENTREQUEST_0_QTY0=500&MAXAMT=40.00&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_NAME0=Business+Card&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&PAYMENTREQUEST_0_MAXAMT=40.00&L_SHIPPINGOPTIONISDEFAULT0=true&L_PAYMENTREQUEST_0_AMT0=0.08&EMAIL=info%40theimip.com&L_PAYMENTREQUEST_0_NUMBER0=121212121212&PAYMENTREQUEST_0_PAYMENTACTION=Sale&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F15%2F&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=40.00&L_SHIPPINGOPTIONAMOUNT0=0.00&PWD=XXXXXX&PAYMENTREQUEST_0_TAXAMT=0.00&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F&PAYMENTREQUEST_0_HANDLINGAMT=0.00&METHOD=SetExpressCheckout','TOKEN=EC%2d1HU69465H7118851J&TIMESTAMP=2013%2d08%2d16T13%3a58%3a50Z&CORRELATIONID=ad760f789bf8&ACK=Success&VERSION=88%2e0&BUILD=7319395',1712.85796165466,'2013-08-16 14:03:22','SetExpressCheckout','88.0',40.00,'GBP','Success','ad760f789bf8','EC-1HU69465H7118851J',NULL,NULL),(28,'L_PAYMENTREQUEST_0_QTY1=100&L_PAYMENTREQUEST_0_QTY0=100&MAXAMT=199.20&L_SHIPPINGOPTIONNAME0=Free+shipping&L_PAYMENTREQUEST_0_DESC1=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&L_PAYMENTREQUEST_0_DESC0=A+fabulous+business+card+printed+to+a+range+of+stocks.+There+is+...&USER=sinezub-facilitator_api1.yandex.ru&SIGNATURE=AX8GCu0CvjNpRud8qe-xAmm7JGjlA-jk1t4X3azsbXycax.HvbLdO-mu&L_SHIPPINGOPTIONISDEFAULT0=true&EMAIL=orders%40theimip.com&ALLOWNOTE=1&CALLBACKTIMEOUT=30&PAYMENTREQUEST_0_AMT=199.20&L_SHIPPINGOPTIONAMOUNT0=0.00&PAYMENTREQUEST_0_HANDLINGAMT=0.00&PAYMENTREQUEST_0_TAXAMT=0.00&METHOD=SetExpressCheckout&PAYMENTREQUEST_0_ITEMAMT=199.20&L_PAYMENTREQUEST_0_NAME1=Business+Card&L_PAYMENTREQUEST_0_NAME0=Business+Card&PAYMENTREQUEST_0_CURRENCYCODE=GBP&VERSION=88.0&PAYMENTREQUEST_0_MAXAMT=199.20&L_PAYMENTREQUEST_0_AMT1=1.00&L_PAYMENTREQUEST_0_AMT0=1.00&L_PAYMENTREQUEST_0_NUMBER1=121212121212&L_PAYMENTREQUEST_0_NUMBER0=121212121212&CALLBACK=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fshipping-options%2F13%2F&PWD=XXXXXX&PAYMENTREQUEST_0_PAYMENTACTION=Sale&RETURNURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fpreview%2F&PAYMENTREQUEST_0_SHIPPINGAMT=0.00&CANCELURL=http%3A%2F%2Fgeniusautoparts.com%2Fcheckout%2Fpaypal%2Fcancel%2F','TIMESTAMP=2013%2d08%2d23T12%3a43%3a09Z&CORRELATIONID=5b47782a70659&ACK=Failure&VERSION=88%2e0&BUILD=7333778&L_ERRORCODE0=10413&L_SHORTMESSAGE0=Transaction%20refused%20because%20of%20an%20invalid%20argument%2e%20See%20additional%20error%20messages%20for%20details%2e&L_LONGMESSAGE0=The%20totals%20of%20the%20cart%20item%20amounts%20do%20not%20match%20order%20amounts%2e&L_SEVERITYCODE0=Error',2091.68887138367,'2013-08-23 12:47:52','SetExpressCheckout','88.0',NULL,NULL,'Failure',NULL,NULL,'10413','The totals of the cart item amounts do not match order amounts.');
/*!40000 ALTER TABLE `paypal_expresstransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payflowtransaction`
--

DROP TABLE IF EXISTS `paypal_payflowtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payflowtransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_request` longtext NOT NULL,
  `raw_response` longtext NOT NULL,
  `response_time` double NOT NULL,
  `date_created` datetime NOT NULL,
  `comment1` varchar(128) NOT NULL,
  `trxtype` varchar(12) NOT NULL,
  `tender` varchar(12) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `pnref` varchar(32) DEFAULT NULL,
  `ppref` varchar(32) DEFAULT NULL,
  `result` varchar(32) DEFAULT NULL,
  `respmsg` varchar(512) NOT NULL,
  `authcode` varchar(32) DEFAULT NULL,
  `cvv2match` varchar(12) DEFAULT NULL,
  `avsaddr` varchar(1) DEFAULT NULL,
  `avszip` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ppref` (`ppref`),
  KEY `paypal_payflowtransaction_9b796449` (`comment1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payflowtransaction`
--

LOCK TABLES `paypal_payflowtransaction` WRITE;
/*!40000 ALTER TABLE `paypal_payflowtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_payflowtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricelist_price`
--

DROP TABLE IF EXISTS `pricelist_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricelist_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `state` varchar(10) NOT NULL,
  `tpl_price` decimal(10,2) NOT NULL,
  `rpl_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `min_order` int(11) NOT NULL,
  `min_area` decimal(10,2) NOT NULL,
  `items_per_pack` int(11) NOT NULL,
  `min_tpl_price` decimal(10,2) NOT NULL,
  `min_rpl_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pricelist_price_bb420c12` (`product_id`),
  KEY `pricelist_price_355bfc27` (`state`),
  KEY `pricelist_price_ddf9422d` (`min_order`),
  KEY `pricelist_price_2eba1ab0` (`quantity`),
  CONSTRAINT `product_id_refs_id_d2503fdb` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48472 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelist_price`
--

LOCK TABLES `pricelist_price` WRITE;
/*!40000 ALTER TABLE `pricelist_price` DISABLE KEYS */;
INSERT INTO `pricelist_price` VALUES (48465,17,'current',10.00,11.00,10,1,0.00,10,0.00,0.00),(48466,17,'current',12.00,14.00,30,1,0.00,30,0.00,0.00),(48467,17,'current',15.00,16.00,50,1,0.00,50,0.00,0.00),(48468,17,'current',17.35,19.00,100,1,0.00,100,0.00,0.00),(48469,17,'current',22.00,25.50,300,1,0.00,300,0.00,0.00),(48470,79,'current',2.00,2.00,1,1,0.00,15,12.00,12.00),(48471,79,'current',2.00,2.00,1,1,0.00,30,12.00,12.00);
/*!40000 ALTER TABLE `pricelist_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricelist_price_option_choices`
--

DROP TABLE IF EXISTS `pricelist_price_option_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricelist_price_option_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_id` int(11) NOT NULL,
  `optionchoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_id` (`price_id`,`optionchoice_id`),
  KEY `optionchoice_id_refs_id_a591a446` (`optionchoice_id`),
  CONSTRAINT `optionchoice_id_refs_id_a591a446` FOREIGN KEY (`optionchoice_id`) REFERENCES `options_optionchoice` (`id`),
  CONSTRAINT `price_id_refs_id_eeb8989f` FOREIGN KEY (`price_id`) REFERENCES `pricelist_price` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=816856 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelist_price_option_choices`
--

LOCK TABLES `pricelist_price_option_choices` WRITE;
/*!40000 ALTER TABLE `pricelist_price_option_choices` DISABLE KEYS */;
INSERT INTO `pricelist_price_option_choices` VALUES (816804,48465,226),(816805,48465,227),(816806,48465,228),(816807,48465,229),(816808,48465,230),(816809,48465,231),(816810,48465,232),(816811,48465,233),(816812,48465,234),(816813,48465,235),(816814,48466,226),(816815,48466,227),(816816,48466,228),(816817,48466,229),(816818,48466,230),(816819,48466,231),(816820,48466,232),(816821,48466,233),(816822,48466,234),(816823,48466,235),(816824,48467,226),(816825,48467,227),(816826,48467,228),(816827,48467,229),(816828,48467,230),(816829,48467,231),(816830,48467,232),(816831,48467,233),(816832,48467,234),(816833,48467,235),(816834,48468,226),(816835,48468,227),(816836,48468,228),(816837,48468,229),(816838,48468,230),(816839,48468,231),(816840,48468,232),(816841,48468,233),(816842,48468,234),(816843,48468,235),(816844,48469,226),(816845,48469,227),(816846,48469,228),(816847,48469,229),(816848,48469,230),(816849,48469,231),(816850,48469,232),(816851,48469,233),(816852,48469,234),(816853,48469,235),(816854,48470,407),(816855,48471,408);
/*!40000 ALTER TABLE `pricelist_price_option_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_automaticproductlist`
--

DROP TABLE IF EXISTS `promotions_automaticproductlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_automaticproductlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `link_url` varchar(200) DEFAULT NULL,
  `link_text` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `method` varchar(128) NOT NULL,
  `num_products` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_automaticproductlist`
--

LOCK TABLES `promotions_automaticproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_automaticproductlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_automaticproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_handpickedproductlist`
--

DROP TABLE IF EXISTS `promotions_handpickedproductlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_handpickedproductlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `link_url` varchar(200) DEFAULT NULL,
  `link_text` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_handpickedproductlist`
--

LOCK TABLES `promotions_handpickedproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_handpickedproductlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_handpickedproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_image`
--

DROP TABLE IF EXISTS `promotions_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `link_url` varchar(200) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_image`
--

LOCK TABLES `promotions_image` WRITE;
/*!40000 ALTER TABLE `promotions_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_keywordpromotion`
--

DROP TABLE IF EXISTS `promotions_keywordpromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_keywordpromotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `position` varchar(100) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `filter` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_keywordpromotion_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_7342f7064b29ce5e` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_keywordpromotion`
--

LOCK TABLES `promotions_keywordpromotion` WRITE;
/*!40000 ALTER TABLE `promotions_keywordpromotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_keywordpromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_multiimage`
--

DROP TABLE IF EXISTS `promotions_multiimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_multiimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_multiimage`
--

LOCK TABLES `promotions_multiimage` WRITE;
/*!40000 ALTER TABLE `promotions_multiimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_multiimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_multiimage_images`
--

DROP TABLE IF EXISTS `promotions_multiimage_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_multiimage_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `multiimage_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promotions_multiimage_image_multiimage_id_69609fd2c3956508_uniq` (`multiimage_id`,`image_id`),
  KEY `promotions_multiimage_images_52d9522c` (`multiimage_id`),
  KEY `promotions_multiimage_images_6682136` (`image_id`),
  CONSTRAINT `image_id_refs_id_4ee9d77f8c30676b` FOREIGN KEY (`image_id`) REFERENCES `promotions_image` (`id`),
  CONSTRAINT `multiimage_id_refs_id_294efa303dd41277` FOREIGN KEY (`multiimage_id`) REFERENCES `promotions_multiimage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_multiimage_images`
--

LOCK TABLES `promotions_multiimage_images` WRITE;
/*!40000 ALTER TABLE `promotions_multiimage_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_multiimage_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_orderedproduct`
--

DROP TABLE IF EXISTS `promotions_orderedproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_orderedproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_orderedproduct_863177d8` (`list_id`),
  KEY `promotions_orderedproduct_bb420c12` (`product_id`),
  CONSTRAINT `list_id_refs_id_3101fc951ed901a` FOREIGN KEY (`list_id`) REFERENCES `promotions_handpickedproductlist` (`id`),
  CONSTRAINT `product_id_refs_id_3efa567c90787ee5` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_orderedproduct`
--

LOCK TABLES `promotions_orderedproduct` WRITE;
/*!40000 ALTER TABLE `promotions_orderedproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_orderedproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_orderedproductlist`
--

DROP TABLE IF EXISTS `promotions_orderedproductlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_orderedproductlist` (
  `handpickedproductlist_ptr_id` int(11) NOT NULL,
  `tabbed_block_id` int(11) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`handpickedproductlist_ptr_id`),
  KEY `promotions_orderedproductlist_29b8ba0c` (`tabbed_block_id`),
  CONSTRAINT `handpickedproductlist_ptr_id_refs_id_7c1f09cc80a5da72` FOREIGN KEY (`handpickedproductlist_ptr_id`) REFERENCES `promotions_handpickedproductlist` (`id`),
  CONSTRAINT `tabbed_block_id_refs_id_5ab6761ee90f72b3` FOREIGN KEY (`tabbed_block_id`) REFERENCES `promotions_tabbedblock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_orderedproductlist`
--

LOCK TABLES `promotions_orderedproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_orderedproductlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_orderedproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_pagepromotion`
--

DROP TABLE IF EXISTS `promotions_pagepromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_pagepromotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `position` varchar(100) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `page_url` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_pagepromotion_e4470c6e` (`content_type_id`),
  KEY `promotions_pagepromotion_53331fd0` (`page_url`),
  CONSTRAINT `content_type_id_refs_id_14e55bbdcee72fb1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_pagepromotion`
--

LOCK TABLES `promotions_pagepromotion` WRITE;
/*!40000 ALTER TABLE `promotions_pagepromotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_pagepromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_rawhtml`
--

DROP TABLE IF EXISTS `promotions_rawhtml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_rawhtml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `display_type` varchar(128) DEFAULT NULL,
  `body` longtext NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_rawhtml`
--

LOCK TABLES `promotions_rawhtml` WRITE;
/*!40000 ALTER TABLE `promotions_rawhtml` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_rawhtml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_singleproduct`
--

DROP TABLE IF EXISTS `promotions_singleproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_singleproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `product_id` int(11) NOT NULL,
  `description` longtext,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_singleproduct_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_6c05b310a771ddb` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_singleproduct`
--

LOCK TABLES `promotions_singleproduct` WRITE;
/*!40000 ALTER TABLE `promotions_singleproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_singleproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_tabbedblock`
--

DROP TABLE IF EXISTS `promotions_tabbedblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_tabbedblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_tabbedblock`
--

LOCK TABLES `promotions_tabbedblock` WRITE;
/*!40000 ALTER TABLE `promotions_tabbedblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_tabbedblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes_quote`
--

DROP TABLE IF EXISTS `quotes_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `choice_data` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quotes_quote_fbfc09f1` (`user_id`),
  KEY `quotes_quote_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_3078136a41c4ec61` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `user_id_refs_id_4b28749be13b0b3e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes_quote`
--

LOCK TABLES `quotes_quote` WRITE;
/*!40000 ALTER TABLE `quotes_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotes_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes_quote_choices`
--

DROP TABLE IF EXISTS `quotes_quote_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes_quote_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `optionchoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quotes_quote_choices_quote_id_4f2b56d153da3f3a_uniq` (`quote_id`,`optionchoice_id`),
  KEY `quotes_quote_choices_423740f` (`quote_id`),
  KEY `quotes_quote_choices_f706eb9e` (`optionchoice_id`),
  CONSTRAINT `optionchoice_id_refs_id_3acc7deefa580323` FOREIGN KEY (`optionchoice_id`) REFERENCES `options_optionchoice` (`id`),
  CONSTRAINT `quote_id_refs_id_13b02ae79c3a5eca` FOREIGN KEY (`quote_id`) REFERENCES `quotes_quote` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes_quote_choices`
--

LOCK TABLES `quotes_quote_choices` WRITE;
/*!40000 ALTER TABLE `quotes_quote_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotes_quote_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranges_rangeproductfileupload`
--

DROP TABLE IF EXISTS `ranges_rangeproductfileupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranges_rangeproductfileupload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `uploaded_by_id` int(11) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `status` varchar(32) NOT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `date_processed` datetime DEFAULT NULL,
  `num_new_skus` int(10) unsigned DEFAULT NULL,
  `num_unknown_skus` int(10) unsigned DEFAULT NULL,
  `num_duplicate_skus` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ranges_rangeproductfileupload_647ae97e` (`range_id`),
  KEY `ranges_rangeproductfileupload_e43a31e7` (`uploaded_by_id`),
  CONSTRAINT `range_id_refs_id_2cefb4c8ec6b74d5` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`),
  CONSTRAINT `uploaded_by_id_refs_id_353b6f5df0eabd0b` FOREIGN KEY (`uploaded_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranges_rangeproductfileupload`
--

LOCK TABLES `ranges_rangeproductfileupload` WRITE;
/*!40000 ALTER TABLE `ranges_rangeproductfileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranges_rangeproductfileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_productreview`
--

DROP TABLE IF EXISTS `reviews_productreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_productreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `score` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `homepage` varchar(200) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `total_votes` int(11) NOT NULL,
  `delta_votes` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`user_id`),
  KEY `reviews_productreview_bb420c12` (`product_id`),
  KEY `reviews_productreview_fbfc09f1` (`user_id`),
  KEY `reviews_productreview_5005a464` (`delta_votes`),
  CONSTRAINT `user_id_refs_id_813fe4aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_productreview`
--

LOCK TABLES `reviews_productreview` WRITE;
/*!40000 ALTER TABLE `reviews_productreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_productreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_vote`
--

DROP TABLE IF EXISTS `reviews_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delta` smallint(6) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`review_id`),
  KEY `reviews_vote_9038cf0e` (`review_id`),
  KEY `reviews_vote_fbfc09f1` (`user_id`),
  CONSTRAINT `review_id_refs_id_e549118d` FOREIGN KEY (`review_id`) REFERENCES `reviews_productreview` (`id`),
  CONSTRAINT `user_id_refs_id_96cd14ee` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_vote`
--

LOCK TABLES `reviews_vote` WRITE;
/*!40000 ALTER TABLE `reviews_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_orderanditemcharges`
--

DROP TABLE IF EXISTS `shipping_orderanditemcharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_orderanditemcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `price_per_order` decimal(12,2) NOT NULL,
  `price_per_item` decimal(12,2) NOT NULL,
  `free_shipping_threshold` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `shipping_orderanditemcharges_name_13c2642f48875fce_uniq` (`name`),
  KEY `shipping_orderanditemcharges_65da3d2c` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_orderanditemcharges`
--

LOCK TABLES `shipping_orderanditemcharges` WRITE;
/*!40000 ALTER TABLE `shipping_orderanditemcharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_orderanditemcharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_orderanditemcharges_countries`
--

DROP TABLE IF EXISTS `shipping_orderanditemcharges_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_orderanditemcharges_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderanditemcharges_id` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_orderandi_orderanditemcharges_id_3f857cb2380dca46_uniq` (`orderanditemcharges_id`,`country_id`),
  KEY `shipping_orderanditemcharges_countries_334cfb26` (`orderanditemcharges_id`),
  KEY `shipping_orderanditemcharges_countries_534dd89` (`country_id`),
  CONSTRAINT `country_id_refs_iso_3166_1_a2_d2648ff2909114c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `orderanditemcharges_id_refs_id_8c2f7a349dbc55a` FOREIGN KEY (`orderanditemcharges_id`) REFERENCES `shipping_orderanditemcharges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_orderanditemcharges_countries`
--

LOCK TABLES `shipping_orderanditemcharges_countries` WRITE;
/*!40000 ALTER TABLE `shipping_orderanditemcharges_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_orderanditemcharges_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightband`
--

DROP TABLE IF EXISTS `shipping_weightband`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightband` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upper_limit` double NOT NULL,
  `charge` decimal(12,2) NOT NULL,
  `method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_weightband_3dacb16f` (`method_id`),
  CONSTRAINT `method_id_refs_id_2806784f5ba83eea` FOREIGN KEY (`method_id`) REFERENCES `shipping_weightbased` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightband`
--

LOCK TABLES `shipping_weightband` WRITE;
/*!40000 ALTER TABLE `shipping_weightband` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightband` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightbased`
--

DROP TABLE IF EXISTS `shipping_weightbased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightbased` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `upper_charge` decimal(12,2) DEFAULT NULL,
  `default_weight` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightbased`
--

LOCK TABLES `shipping_weightbased` WRITE;
/*!40000 ALTER TABLE `shipping_weightbased` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightbased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightbased_countries`
--

DROP TABLE IF EXISTS `shipping_weightbased_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightbased_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weightbased_id` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_weightbased_count_weightbased_id_2d48b23bd516c826_uniq` (`weightbased_id`,`country_id`),
  KEY `shipping_weightbased_countries_2b8a5aca` (`weightbased_id`),
  KEY `shipping_weightbased_countries_534dd89` (`country_id`),
  CONSTRAINT `country_id_refs_iso_3166_1_a2_3df0718a331f1b98` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `weightbased_id_refs_id_3ed50866582640e2` FOREIGN KEY (`weightbased_id`) REFERENCES `shipping_weightbased` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightbased_countries`
--

LOCK TABLES `shipping_weightbased_countries` WRITE;
/*!40000 ALTER TABLE `shipping_weightbased_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightbased_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'menu','0001_initial','2013-05-08 14:24:29'),(5,'accounts','0001_initial','2013-05-08 14:24:32'),(6,'customer','0001_initial','2013-05-08 14:24:32'),(7,'catalogue','0001_initial','2013-05-08 14:24:37'),(8,'analytics','0001_initial','2013-05-08 14:24:38'),(9,'partner','0001_initial','2013-05-08 14:24:40'),(10,'address','0001_initial','2013-05-08 14:24:41'),(11,'order','0001_initial','2013-05-08 14:24:45'),(12,'order','0002_auto__add_field_order_guest_email','2013-05-08 14:24:45'),(13,'order','0003_auto__del_field_ordernote_date__add_field_ordernote_date_created__add_','2013-05-08 14:24:45'),(14,'order','0004_auto__add_field_line_upc','2013-05-08 14:24:46'),(15,'order','0005_auto__add_field_orderdiscount_offer_name','2013-05-08 14:24:46'),(16,'order','0006_update_offer_name_field','2013-05-08 14:24:46'),(17,'order','0007_auto__add_field_orderdiscount_frequency','2013-05-08 14:24:46'),(18,'order','0008_auto__add_field_orderdiscount_category','2013-05-08 14:24:47'),(19,'order','0009_auto__add_field_orderdiscount_message','2013-05-08 14:24:47'),(21,'shipping','0001_initial','2013-05-08 14:24:48'),(22,'shipping','0002_auto__del_orderanditemlevelchargemethod__add_orderanditemcharges__add_','2013-05-08 14:24:48'),(23,'shipping','0003_auto__add_weightbased__chg_field_orderanditemcharges_code__add_unique_','2013-05-08 14:24:48'),(24,'shipping','0004_auto__add_field_weightbased_default_weight','2013-05-08 14:24:48'),(25,'shipping','0005_auto','2013-05-08 14:24:49'),(26,'offer','0001_initial','2013-05-08 14:24:51'),(27,'voucher','0001_initial','2013-05-08 14:24:52'),(28,'basket','0001_initial','2013-05-08 14:24:53'),(29,'basket','0002_auto__add_field_line_price_incl_tax','2013-05-08 14:24:53'),(30,'basket','0003_auto__add_field_line_price_excl_tax','2013-05-08 14:24:53'),(31,'payment','0001_initial','2013-05-08 14:24:54'),(32,'offer','0002_auto__add_unique_conditionaloffer_name','2013-05-08 14:24:55'),(33,'offer','0003_auto__add_field_conditionaloffer_num_orders','2013-05-08 14:24:56'),(34,'offer','0004_auto__add_field_conditionaloffer_slug','2013-05-08 14:24:56'),(35,'offer','0005_auto__add_field_range_date_created','2013-05-08 14:24:56'),(36,'offer','0006_auto__add_field_conditionaloffer_max_applications','2013-05-08 14:24:56'),(37,'offer','0007_auto__add_field_conditionaloffer_max_global_applications','2013-05-08 14:24:56'),(38,'offer','0008_auto__add_field_conditionaloffer_num_applications','2013-05-08 14:24:56'),(39,'offer','0009_auto__del_field_conditionaloffer_max_applications__add_field_condition','2013-05-08 14:24:57'),(40,'offer','0010_auto__add_field_conditionaloffer_max_user_applications','2013-05-08 14:24:57'),(41,'offer','0011_auto__add_field_range_proxy_class','2013-05-08 14:24:57'),(42,'offer','0012_auto__add_field_condition_proxy_class__chg_field_condition_range__chg_','2013-05-08 14:24:57'),(43,'offer','0013_auto__add_unique_range_proxy_class','2013-05-08 14:24:57'),(44,'offer','0014_consolidate_offer_changes','2013-05-08 14:24:58'),(45,'offer','0015_auto__add_field_conditionaloffer_max_discount','2013-05-08 14:24:58'),(46,'offer','0016_auto__add_field_conditionaloffer_status','2013-05-08 14:24:58'),(47,'offer','0017_auto__chg_field_conditionaloffer_end_date__chg_field_conditionaloffer_','2013-05-08 14:24:58'),(48,'offer','0018_auto__del_field_conditionaloffer_end_date__del_field_conditionaloffer_','2013-05-08 14:24:59'),(49,'offer','0019_auto__del_shippingbenefit__add_field_benefit_proxy_class__chg_field_be','2013-05-08 14:24:59'),(50,'address','0002_auto__chg_field_useraddress_postcode','2013-05-08 14:25:00'),(51,'partner','0002_auto__add_stockalert__add_abstractstockalert__add_field_stockrecord_lo','2013-05-08 14:25:00'),(52,'partner','0003_auto__add_unique_stockrecord_partner_partner_sku','2013-05-08 14:25:00'),(53,'partner','0004_auto__add_field_partner_code','2013-05-08 14:25:01'),(54,'partner','0005_populate_slugs','2013-05-08 14:25:01'),(55,'partner','0006_auto__add_unique_partner_code','2013-05-08 14:25:01'),(56,'partner','0007_auto__chg_field_partner_name__del_unique_partner_name','2013-05-08 14:25:01'),(57,'partner','0008_auto__del_abstractstockalert__del_field_stockalert_abstractstockalert_','2013-05-08 14:25:01'),(58,'catalogue','0002_auto__add_field_product_status__add_field_category_description__add_fi','2013-05-08 14:25:04'),(59,'catalogue','0003_auto__add_unique_product_upc__chg_field_productcontributor_role','2013-05-08 14:25:05'),(60,'catalogue','0004_auto__chg_field_productattributevalue_value_boolean','2013-05-08 14:25:06'),(61,'catalogue','0005_auto__chg_field_productattributevalue_value_boolean__add_field_product','2013-05-08 14:25:06'),(62,'catalogue','0006_auto__add_field_product_is_discountable','2013-05-08 14:25:07'),(63,'catalogue','0007_auto__add_field_productclass_requires_shipping__add_field_productclass','2013-05-08 14:25:07'),(64,'catalogue','0008_auto__add_unique_option_code','2013-05-08 14:25:08'),(65,'catalogue','0009_auto__add_field_product_rating','2013-05-08 14:25:08'),(66,'catalogue','0010_call_update_product_ratings','2013-05-08 14:25:09'),(67,'ranges','0001_initial','2013-05-08 14:25:11'),(68,'promotions','0001_initial','2013-05-08 14:25:15'),(69,'customer','0002_auto__add_notification','2013-05-08 14:25:16'),(70,'customer','0003_auto__add_productalert','2013-05-08 14:25:18'),(71,'customer','0004_auto__chg_field_communicationeventtype_email_subject_template','2013-05-08 14:25:19'),(72,'catalogue','0011_auto','2013-05-21 10:08:00'),(73,'jobs','0001_initial','2013-07-05 18:54:54'),(74,'jobs','0002_add_description_to_stage','2013-07-06 11:45:00'),(75,'jobs','0003_job_creator_could_be_null','2013-07-06 11:45:00'),(76,'jobs','0004_add_followers','2013-07-16 02:14:24'),(77,'jobs','0005_order_not_required','2013-07-16 02:14:24'),(78,'options','0001_initial','2013-07-17 00:29:34'),(79,'pricelist','0001_initial','2013-07-17 00:29:44'),(80,'jobs','0006_add_commondescription_table','2013-07-20 19:54:08'),(81,'basket','0004_auto__add_lineattachment__add_unique_lineattachment_line_artwork_item_','2013-07-21 23:36:51'),(82,'catalogue','0012_auto','2013-07-28 02:07:03'),(83,'pricelist','0002_auto','2013-07-28 02:07:05'),(84,'quotes','0001_initial','2013-07-28 02:07:06'),(85,'basket','0005_auto__del_field_line_pricing_group','2013-07-28 02:07:07'),(86,'pricelist','0003_auto__add_field_price_min_area','2013-07-30 22:25:54'),(87,'pricelist','0004_auto__add_field_price_items_per_pack','2013-08-25 17:41:59'),(88,'pricelist','0005_auto__add_field_price_min_tpl_price__add_field_price_min_rpl_price','2013-08-25 17:41:59'),(89,'basket','0006_auto__add_field_line_items_required','2013-08-25 17:42:01');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
INSERT INTO `thumbnail_kvstore` VALUES ('sorl-thumbnail||image||0e24c3f818b4b1d1e73146e705760e2c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/f6/53/f653323ad176811f7e0750a1fbbf8c8f.jpg\", \"size\": [250, 167]}'),('sorl-thumbnail||image||128c01520cf0f714573d47ceb606c862','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/db/76/db76d4194134d7fb94a7d2191b9277d3.jpg\", \"size\": [70, 47]}'),('sorl-thumbnail||image||1dc0577f193a6f179ba0f3684bb8c7ce','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/1b/05/1b05d7cb36119cc03cc7232fb90aa959.jpg\", \"size\": [250, 146]}'),('sorl-thumbnail||image||2193ea877b985736416bd575e198062e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/31/7b/317bb0f213471e3a6e36d7ed9a891a88.jpg\", \"size\": [70, 70]}'),('sorl-thumbnail||image||41217c2f6726dc642ad54783e02a9d54','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/products/2013/06/Standart_Business_Card_2x3.5_front1.jpg\", \"size\": [594, 348]}'),('sorl-thumbnail||image||630417cf4de05987b5f3d7a6deeda4f4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"gallery/item_2.gif\", \"size\": [41, 53]}'),('sorl-thumbnail||image||64ee296768a18db37eca03d8e3a9e6b1','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"gallery/portrait.gif\", \"size\": [38, 52]}'),('sorl-thumbnail||image||6ceee8460e4371732c304dc058dcc08f','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/products/2013/06/wire-bound-closeup-large.jpg\", \"size\": [600, 400]}'),('sorl-thumbnail||image||6d4263444451fe6bf648f4b55a03090a','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/4b/c6/4bc63497628db37a2f491da28a10b41d.jpg\", \"size\": [7, 10]}'),('sorl-thumbnail||image||7289c05130165fa454d8ac0ab2ae595e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/fb/d8/fbd859afa16fa5c544d0b0ec00b7817d.jpg\", \"size\": [25, 32]}'),('sorl-thumbnail||image||74a4c03cba36dd771e35f64f9eeed7f3','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ce/2a/ce2af2f2f1e4f79538c83d493162103a.jpg\", \"size\": [70, 41]}'),('sorl-thumbnail||image||7c16a8651ca6de302dc2bd7c5a6a3c4e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/0f/fc/0ffca25777e7d053949b950b7feb0e79.jpg\", \"size\": [200, 200]}'),('sorl-thumbnail||image||833a367243221efc51ad84c468cafe6c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"gallery/item_1.gif\", \"size\": [41, 53]}'),('sorl-thumbnail||image||8fbe751731a800ab606681dc61c2e5df','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ab/2e/ab2edfb9830386d5243e56b8515cd3e7.jpg\", \"size\": [200, 117]}'),('sorl-thumbnail||image||96d5508f670bd4136d64e4fa08444bef','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/73/cf/73cf17d314108debc4b6840ea8392679.jpg\", \"size\": [100, 95]}'),('sorl-thumbnail||image||9d33925d217de903899ae713a2bb6d12','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"gallery/landscape.gif\", \"size\": [52, 37]}'),('sorl-thumbnail||image||a3435871ac265ac2fce7fe4cd114b57e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/61/1f/611f5ac8b3f71b701ac16ca4c1f3d4d5.jpg\", \"size\": [70, 67]}'),('sorl-thumbnail||image||b0e429f9998c8e822b6c57e3675b2542','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/6c/cb/6ccb4bc160e18990c66efc0e8cd41d91.jpg\", \"size\": [25, 32]}'),('sorl-thumbnail||image||b65a32c3ed9a4e151b8f02368d7d9ee0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/products/2013/05/lGCONljtbA.jpg\", \"size\": [600, 571]}'),('sorl-thumbnail||image||bd781b8fa95186f0b96968340e8f31f4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/71/fc/71fc9b614d7dd13120db277add25da88.jpg\", \"size\": [250, 250]}'),('sorl-thumbnail||image||cbcbaf5ae250db7ed4d6d80cb24adfc3','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/18/4e/184eb7f5a7f769b7d3e7796e312a2fa2.jpg\", \"size\": [32, 23]}'),('sorl-thumbnail||image||cce2a7ea0389db7efc51dd8acade30ee','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/1e/51/1e51a2cd2c982da53c8bab7f4751216f.jpg\", \"size\": [200, 190]}'),('sorl-thumbnail||image||dce7ed5946c2f23e9d700fd65b84d123','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/products/2013/06/PE-Coated-Aluminium-Composite-Panel-for-Interior.jpg\", \"size\": [360, 360]}'),('sorl-thumbnail||image||dfa4b3bf731b37ae4fcea98f0b0be876','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/4e/f2/4ef2381fad2d171effd4f8ce9db0a31a.jpg\", \"size\": [23, 32]}'),('sorl-thumbnail||image||f98ab20c711a3db1a613ca5933a12b1b','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/d8/96/d896f9a58f6bb97f15bb07a62479e94f.jpg\", \"size\": [200, 133]}'),('sorl-thumbnail||thumbnails||41217c2f6726dc642ad54783e02a9d54','[\"1dc0577f193a6f179ba0f3684bb8c7ce\", \"74a4c03cba36dd771e35f64f9eeed7f3\", \"8fbe751731a800ab606681dc61c2e5df\"]'),('sorl-thumbnail||thumbnails||630417cf4de05987b5f3d7a6deeda4f4','[\"7289c05130165fa454d8ac0ab2ae595e\"]'),('sorl-thumbnail||thumbnails||64ee296768a18db37eca03d8e3a9e6b1','[\"dfa4b3bf731b37ae4fcea98f0b0be876\", \"6d4263444451fe6bf648f4b55a03090a\"]'),('sorl-thumbnail||thumbnails||6ceee8460e4371732c304dc058dcc08f','[\"128c01520cf0f714573d47ceb606c862\", \"0e24c3f818b4b1d1e73146e705760e2c\", \"f98ab20c711a3db1a613ca5933a12b1b\"]'),('sorl-thumbnail||thumbnails||833a367243221efc51ad84c468cafe6c','[\"b0e429f9998c8e822b6c57e3675b2542\"]'),('sorl-thumbnail||thumbnails||9d33925d217de903899ae713a2bb6d12','[\"cbcbaf5ae250db7ed4d6d80cb24adfc3\"]'),('sorl-thumbnail||thumbnails||b65a32c3ed9a4e151b8f02368d7d9ee0','[\"c9f97a8605104299cb646eb739d6b33c\", \"96d5508f670bd4136d64e4fa08444bef\", \"cce2a7ea0389db7efc51dd8acade30ee\", \"a3435871ac265ac2fce7fe4cd114b57e\"]'),('sorl-thumbnail||thumbnails||dce7ed5946c2f23e9d700fd65b84d123','[\"2193ea877b985736416bd575e198062e\", \"bd781b8fa95186f0b96968340e8f31f4\", \"7c16a8651ca6de302dc2bd7c5a6a3c4e\"]');
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher`
--

DROP TABLE IF EXISTS `voucher_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `usage` varchar(128) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher`
--

LOCK TABLES `voucher_voucher` WRITE;
/*!40000 ALTER TABLE `voucher_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher_offers`
--

DROP TABLE IF EXISTS `voucher_voucher_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `conditionaloffer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_voucher_offers_voucher_id_7a0c4a351389083e_uniq` (`voucher_id`,`conditionaloffer_id`),
  KEY `voucher_voucher_offers_7a302bdb` (`voucher_id`),
  KEY `voucher_voucher_offers_aabc43b6` (`conditionaloffer_id`),
  CONSTRAINT `conditionaloffer_id_refs_id_4e201b2f3632d1fd` FOREIGN KEY (`conditionaloffer_id`) REFERENCES `offer_conditionaloffer` (`id`),
  CONSTRAINT `voucher_id_refs_id_69332a6e2417707e` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher_offers`
--

LOCK TABLES `voucher_voucher_offers` WRITE;
/*!40000 ALTER TABLE `voucher_voucher_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucher_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucherapplication`
--

DROP TABLE IF EXISTS `voucher_voucherapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucherapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_voucherapplication_7a302bdb` (`voucher_id`),
  KEY `voucher_voucherapplication_fbfc09f1` (`user_id`),
  KEY `voucher_voucherapplication_8337030b` (`order_id`),
  CONSTRAINT `order_id_refs_id_1aa2a733608e4b3a` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `user_id_refs_id_71de8958324b3d23` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `voucher_id_refs_id_642bd10988ef0ff6` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucherapplication`
--

LOCK TABLES `voucher_voucherapplication` WRITE;
/*!40000 ALTER TABLE `voucher_voucherapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucherapplication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-29 15:34:47
