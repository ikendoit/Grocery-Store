-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: grocery
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

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
-- Table structure for table `Dependants`
--

DROP TABLE IF EXISTS `Dependants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dependants` (
  `Staff_ID` int(11) NOT NULL,
  `dSin` int(11) NOT NULL,
  `d_Name` varchar(30) NOT NULL,
  `Birthdate` date NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  CONSTRAINT `Dependants_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependants`
--

LOCK TABLES `Dependants` WRITE;
/*!40000 ALTER TABLE `Dependants` DISABLE KEYS */;
INSERT INTO `Dependants` VALUES (1,73345928,'Hilario N','1967-03-01'),(2,667107619,'Brian Y','1992-03-01'),(3,594750267,'Tracie B','1963-03-01'),(4,479766180,'Donna P','1964-03-01'),(5,311901268,'Joseph J','1965-03-01');
/*!40000 ALTER TABLE `Dependants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Export_Desc`
--

DROP TABLE IF EXISTS `Export_Desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Export_Desc` (
  `Export_ID` int(11) NOT NULL,
  `SKU` varchar(30) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`Export_ID`,`SKU`),
  KEY `SKU` (`SKU`),
  CONSTRAINT `Export_Desc_ibfk_1` FOREIGN KEY (`Export_ID`) REFERENCES `Order_Exports` (`Export_ID`) ON DELETE CASCADE,
  CONSTRAINT `Export_Desc_ibfk_2` FOREIGN KEY (`SKU`) REFERENCES `Products` (`SKU`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Export_Desc`
--

LOCK TABLES `Export_Desc` WRITE;
/*!40000 ALTER TABLE `Export_Desc` DISABLE KEYS */;
INSERT INTO `Export_Desc` VALUES (1,'2',20),(2,'2',20),(3,'3',24),(4,'3',70),(5,'3',70),(6,'2',29),(6,'9',4),(7,'2',49),(7,'7',6),(8,'8',8),(9,'10',7),(9,'2',119),(10,'1',20),(10,'10',1),(10,'2',22),(10,'3',32),(10,'4',52),(10,'5',62),(10,'6',16),(10,'7',62),(10,'8',12),(10,'9',12);
/*!40000 ALTER TABLE `Export_Desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Import_Desc`
--

DROP TABLE IF EXISTS `Import_Desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Import_Desc` (
  `Import_ID` int(11) NOT NULL,
  `SKU` varchar(30) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`Import_ID`,`SKU`),
  KEY `SKU` (`SKU`),
  CONSTRAINT `Import_Desc_ibfk_1` FOREIGN KEY (`Import_ID`) REFERENCES `Order_Imports` (`Import_ID`) ON DELETE CASCADE,
  CONSTRAINT `Import_Desc_ibfk_2` FOREIGN KEY (`SKU`) REFERENCES `Products` (`SKU`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Import_Desc`
--

LOCK TABLES `Import_Desc` WRITE;
/*!40000 ALTER TABLE `Import_Desc` DISABLE KEYS */;
INSERT INTO `Import_Desc` VALUES (1,'3',11),(2,'4',12),(3,'1',11),(4,'5',21),(5,'3',11),(6,'8',12),(7,'10',22),(8,'6',10),(9,'9',3),(10,'7',2);
/*!40000 ALTER TABLE `Import_Desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manager` (
  `Staff_ID` int(11) NOT NULL,
  `Salary` int(11) NOT NULL DEFAULT '1000000',
  `Date_info_Start_Manager` date NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  CONSTRAINT `Manager_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
INSERT INTO `Manager` VALUES (6,100000,'1929-03-02'),(7,100000,'1929-03-01'),(8,199999,'1929-01-30'),(9,99999,'1929-01-29'),(10,172000,'1929-01-28');
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modify`
--

DROP TABLE IF EXISTS `Modify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Modify` (
  `Date_info` date NOT NULL,
  `SKU` varchar(30) NOT NULL,
  `Staff_ID` int(11) NOT NULL,
  PRIMARY KEY (`Date_info`,`SKU`,`Staff_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `SKU` (`SKU`),
  CONSTRAINT `Modify_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `Manager` (`Staff_ID`) ON DELETE CASCADE,
  CONSTRAINT `Modify_ibfk_2` FOREIGN KEY (`SKU`) REFERENCES `Products` (`SKU`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modify`
--

LOCK TABLES `Modify` WRITE;
/*!40000 ALTER TABLE `Modify` DISABLE KEYS */;
INSERT INTO `Modify` VALUES ('2017-02-01','1',6),('2017-02-02','1',7),('2018-04-04','7',7),('2017-02-01','3',8),('2017-02-01','4',9),('2017-02-01','5',10),('2018-04-04','10',10),('2018-04-04','2',10),('2018-04-04','3',10),('2018-04-04','7',10),('2018-04-04','8',10),('2018-04-04','9',10);
/*!40000 ALTER TABLE `Modify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Exports`
--

DROP TABLE IF EXISTS `Order_Exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Exports` (
  `Export_ID` int(11) NOT NULL AUTO_INCREMENT,
  `V_ID` int(11) NOT NULL,
  `Date_info` date NOT NULL,
  `Total_Price` float(15,3) NOT NULL,
  PRIMARY KEY (`Export_ID`),
  KEY `V_ID` (`V_ID`),
  CONSTRAINT `Order_Exports_ibfk_1` FOREIGN KEY (`V_ID`) REFERENCES `Vendors` (`V_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Exports`
--

LOCK TABLES `Order_Exports` WRITE;
/*!40000 ALTER TABLE `Order_Exports` DISABLE KEYS */;
INSERT INTO `Order_Exports` VALUES (1,1,'2016-04-03',23000.232),(2,2,'2017-04-02',23000.232),(3,1,'2016-04-05',24000.232),(4,1,'2016-04-06',26000.232),(5,1,'2016-04-07',23000.232),(6,3,'2016-04-10',36046.234),(7,5,'2017-04-13',13458.322),(8,5,'2016-04-14',10025.346),(9,4,'2016-04-11',62145.312),(10,2,'2016-04-12',6869.233);
/*!40000 ALTER TABLE `Order_Exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Imports`
--

DROP TABLE IF EXISTS `Order_Imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Imports` (
  `Import_ID` int(11) NOT NULL AUTO_INCREMENT,
  `P_ID` int(11) NOT NULL,
  `Date_info` date NOT NULL,
  `Total_Price` float(15,3) NOT NULL,
  PRIMARY KEY (`Import_ID`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `Order_Imports_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `Producers` (`P_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Imports`
--

LOCK TABLES `Order_Imports` WRITE;
/*!40000 ALTER TABLE `Order_Imports` DISABLE KEYS */;
INSERT INTO `Order_Imports` VALUES (1,1,'2017-05-01',18000.109),(2,3,'2017-05-02',18002.221),(3,4,'2017-05-03',18030.131),(4,5,'2017-05-04',48000.410),(5,2,'2017-05-05',15000.510),(6,2,'2017-05-06',12564.864),(7,4,'2017-05-07',30646.316),(8,4,'2017-05-08',76321.648),(9,1,'2017-05-09',16849.348),(10,3,'2017-05-10',13154.035);
/*!40000 ALTER TABLE `Order_Imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Oversees_Export`
--

DROP TABLE IF EXISTS `Oversees_Export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Oversees_Export` (
  `V_ID` int(11) NOT NULL,
  `Export_ID` int(11) NOT NULL,
  `Staff_ID` int(11) NOT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`V_ID`,`Export_ID`,`Staff_ID`),
  KEY `Export_ID` (`Export_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `Oversees_Export_ibfk_1` FOREIGN KEY (`V_ID`) REFERENCES `Vendors` (`V_ID`) ON DELETE CASCADE,
  CONSTRAINT `Oversees_Export_ibfk_2` FOREIGN KEY (`Export_ID`) REFERENCES `Order_Exports` (`Export_ID`) ON DELETE CASCADE,
  CONSTRAINT `Oversees_Export_ibfk_3` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Oversees_Export`
--

LOCK TABLES `Oversees_Export` WRITE;
/*!40000 ALTER TABLE `Oversees_Export` DISABLE KEYS */;
INSERT INTO `Oversees_Export` VALUES (1,1,1,''),(1,3,4,''),(2,2,3,''),(3,4,2,'\0'),(4,5,5,'\0');
/*!40000 ALTER TABLE `Oversees_Export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Oversees_Import`
--

DROP TABLE IF EXISTS `Oversees_Import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Oversees_Import` (
  `P_ID` int(11) NOT NULL,
  `Import_ID` int(11) NOT NULL,
  `Staff_ID` int(11) NOT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Import_ID`,`P_ID`,`Staff_ID`),
  KEY `P_ID` (`P_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `Oversees_Import_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `Producers` (`P_ID`) ON DELETE CASCADE,
  CONSTRAINT `Oversees_Import_ibfk_2` FOREIGN KEY (`Import_ID`) REFERENCES `Order_Imports` (`Import_ID`) ON DELETE CASCADE,
  CONSTRAINT `Oversees_Import_ibfk_3` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Oversees_Import`
--

LOCK TABLES `Oversees_Import` WRITE;
/*!40000 ALTER TABLE `Oversees_Import` DISABLE KEYS */;
INSERT INTO `Oversees_Import` VALUES (2,1,3,''),(3,1,2,'\0'),(5,1,5,''),(4,2,1,''),(2,3,4,'\0');
/*!40000 ALTER TABLE `Oversees_Import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producers`
--

DROP TABLE IF EXISTS `Producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producers` (
  `P_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(30) NOT NULL,
  `PhoneNum` varchar(15) NOT NULL,
  `P_Name` varchar(50) NOT NULL,
  `Owner_Name` varchar(50) NOT NULL,
  `Address` varchar(40) NOT NULL,
  PRIMARY KEY (`P_ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `PhoneNum` (`PhoneNum`),
  UNIQUE KEY `P_Name` (`P_Name`),
  UNIQUE KEY `Address` (`Address`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producers`
--

LOCK TABLES `Producers` WRITE;
/*!40000 ALTER TABLE `Producers` DISABLE KEYS */;
INSERT INTO `Producers` VALUES (1,'tenoid@gmail.com','11111112222','TenderMeater','Leonora C Golden','4033 Robson St'),(2,'homonix@gmail.com','12211112222','homonix','Jose J Avery','3367 Hardy Street'),(3,'biomm@gmail.com','11111113333','biomm','Joseph M Yim','4240 Nootka Street'),(4,'redel@gmail.com','11111114444','redel','Georgie M Cornelison','2912 Hastings Street'),(5,'telente@gmail.com','11111115555','telente','Keith A Williamson','1344 Robson St');
/*!40000 ALTER TABLE `Producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `SKU` varchar(30) NOT NULL,
  `Section_Num` int(11) DEFAULT NULL,
  `Weight` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Product_Name` varchar(30) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`SKU`),
  UNIQUE KEY `Product_Name` (`Product_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES ('1',10,3,110,'MP3',19),('10',3,5,245,'PaLates',20),('2',21,4,112,'T-Shirts',20),('3',16,6,113,'Stuffed Toy',23),('4',44,14,14,'Dumbell',24),('5',25,5,115,'Package of Paper',35),('6',1,3,63,'Pants',15),('7',9,2,10,'Chinese Ipad',115),('8',2,3,35,'Ropes',15),('9',8,10,11,'Garbage bags',27);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger TriggerTest AFTER UPDATE on Products FOR EACH ROW INSERT INTO Modify(SKU,Date_info,Staff_ID) values(NEW.SKU,CURDATE(),10) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Quantify`
--

DROP TABLE IF EXISTS `Quantify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Quantify` (
  `SKU` varchar(30) NOT NULL,
  `Date_info` date NOT NULL,
  `Staff_ID` int(11) NOT NULL,
  PRIMARY KEY (`SKU`,`Date_info`,`Staff_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `Quantify_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON DELETE CASCADE,
  CONSTRAINT `Quantify_ibfk_2` FOREIGN KEY (`SKU`) REFERENCES `Products` (`SKU`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quantify`
--

LOCK TABLES `Quantify` WRITE;
/*!40000 ALTER TABLE `Quantify` DISABLE KEYS */;
INSERT INTO `Quantify` VALUES ('1','2017-03-01',1),('3','2017-03-01',2),('2','2017-03-01',3),('4','2017-03-01',4),('5','2017-03-01',5);
/*!40000 ALTER TABLE `Quantify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `Staff_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `sSin` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Birthdate` date NOT NULL,
  `PhoneNum` varchar(15) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Bank_Info` varchar(30) NOT NULL,
  `Date_info_Start` date NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  UNIQUE KEY `sSin` (`sSin`),
  UNIQUE KEY `PhoneNum` (`PhoneNum`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Bank_Info` (`Bank_Info`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Ken N','143430346','3913 Cates Landing Way','1998-03-01','6047191600','virginman101@gmail.com','5520033435035168','2017-09-06'),(2,'Gary Y','138347950','3988 Alness Street','1912-03-01','6047206029','mthurn@live.com','5137403916368732','2017-09-01'),(3,'Parm B','164791279','700 184th Street','1913-03-01','6043666528','fangorn@hotmail.com','5127175163174482','2017-09-02'),(4,'Bradley P','082191289','1738 St. John Street','1992-03-01','6044425489','euice@outlook.com','5221226689506908','2017-09-05'),(5,'Diane J','482518123','1190 Fourth Avenue','1991-03-01','7789898303','rgarcia@optonline.net','5404374921536637','2016-09-06'),(6,'Albert M','093507382','2472 St. John Street','1991-03-01','6042801947','webdragon@comcast.net','5324206172373343','2016-01-06'),(7,'Ken W','452091192','2318 Tycos Dr','1989-03-01','6049234929','mxiao@yahoo.com','5177433405186197','2016-02-06'),(8,'Ruby M','255165425','127 Sheppard Ave','1991-01-01','6047343929','drezet@me.com','5289002117773645','2016-12-06'),(9,'David R','507959773','1756 Wellington Ave','1991-03-01','6047310740','miyop@icloud.com','5324205940851432','2016-05-06'),(10,'Francis L','350231072','1381 MacLaren Street','1991-12-01','6046481365','sakusha@yahoo.ca','5177430140201414','2016-07-06'),(11,'Trung  Trung','54224565','4444 Trung Street','1992-02-28','4404421122','4444@satan.com','444444 444444','2018-04-04');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendors`
--

DROP TABLE IF EXISTS `Vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendors` (
  `V_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(30) NOT NULL,
  `PhoneNum` varchar(15) NOT NULL,
  `V_Name` varchar(50) NOT NULL,
  `Owner_Name` varchar(50) NOT NULL,
  `Address` varchar(40) NOT NULL,
  PRIMARY KEY (`V_ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `PhoneNum` (`PhoneNum`),
  UNIQUE KEY `V_Name` (`V_Name`),
  UNIQUE KEY `Address` (`Address`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendors`
--

LOCK TABLES `Vendors` WRITE;
/*!40000 ALTER TABLE `Vendors` DISABLE KEYS */;
INSERT INTO `Vendors` VALUES (1,'mistita@gmail.com','1111111111','mistita','Andrew K Coleman','1706 Robson St'),(2,'dezz@gmail.com','2211111111','dezz','Iris A Twilley','2636 rue Levy'),(3,'conore@gmail.com','3311111111','conore','David M Hines','4626 St Marys Rd'),(4,'dure@gmail.com','4411111111','dure','Nicole W Rodriguez','2846 Weston Rd'),(5,'supent@gmail.com','5511111111','supent','Antonio E Wells','4624 Exmouth Street');
/*!40000 ALTER TABLE `Vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workers`
--

DROP TABLE IF EXISTS `Workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Workers` (
  `Staff_ID` int(11) NOT NULL,
  `Hourly_Rate` int(11) NOT NULL DEFAULT '12',
  `Role` varchar(20) NOT NULL,
  `Mentor_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`),
  KEY `Mentor_ID` (`Mentor_ID`),
  CONSTRAINT `Workers_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON DELETE CASCADE,
  CONSTRAINT `Workers_ibfk_2` FOREIGN KEY (`Mentor_ID`) REFERENCES `Staff` (`Staff_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workers`
--

LOCK TABLES `Workers` WRITE;
/*!40000 ALTER TABLE `Workers` DISABLE KEYS */;
INSERT INTO `Workers` VALUES (1,12,'Quality Assurance',2),(2,12,'Quality Assurance',NULL),(3,12,'Loader/Unloader',2),(4,12,'Loader/Unloader',NULL),(5,12,'Stocker',4);
/*!40000 ALTER TABLE `Workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-04 22:13:16
