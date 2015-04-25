-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: uconnjobsearch
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `UserName` varchar(45) NOT NULL,
  `AdministratorPrivileges` varchar(45) NOT NULL,
  `AdministratorExpirDate` date DEFAULT NULL,
  `AdministratorPassword` varchar(45) NOT NULL,
  PRIMARY KEY (`UserName`),
  KEY `fk_Administrator_User1_idx` (`UserName`),
  CONSTRAINT `fk_Administrator_User1` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applies`
--

DROP TABLE IF EXISTS `applies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applies` (
  `ApplicationID` int(11) NOT NULL,
  `ApplicationDate` date DEFAULT NULL,
  `Job_JobID` int(11) NOT NULL COMMENT 'FK',
  `SeekerUserName` varchar(45) NOT NULL COMMENT 'FK',
  `Status` enum('Pending','Accepted','Rejected') NOT NULL,
  PRIMARY KEY (`ApplicationID`),
  KEY `fk_Job_has_Seeker_Seeker1_idx` (`SeekerUserName`),
  KEY `fk_Job_has_Seeker_Job1_idx` (`Job_JobID`),
  CONSTRAINT `fk_Job_has_Seeker_Job1` FOREIGN KEY (`Job_JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_has_Seeker_Seeker1` FOREIGN KEY (`SeekerUserName`) REFERENCES `seeker` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applies`
--

LOCK TABLES `applies` WRITE;
/*!40000 ALTER TABLE `applies` DISABLE KEYS */;
/*!40000 ALTER TABLE `applies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankpayment`
--

DROP TABLE IF EXISTS `bankpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankpayment` (
  `BankPaymentName` varchar(45) NOT NULL,
  `BankPaymentNumber` int(11) NOT NULL,
  `BankPaymentAcctNumber` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `fk_BankPayment_Payment1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankpayment`
--

LOCK TABLES `bankpayment` WRITE;
/*!40000 ALTER TABLE `bankpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `CompanyName` varchar(60) NOT NULL,
  `CompanyStreet1` varchar(45) NOT NULL,
  `CompanyStreet2` varchar(45) DEFAULT NULL,
  `CompanyCity` varchar(45) NOT NULL,
  `CompanyZip` int(11) NOT NULL,
  `CompanyEmail` varchar(45) NOT NULL,
  `CompanyPhone` varchar(11) NOT NULL,
  `CompanyFax` varchar(11) DEFAULT NULL,
  `CompanyCell` varchar(11) DEFAULT NULL,
  `CompanyHomePage` varchar(45) DEFAULT NULL,
  `CompanyId` decimal(6,0) unsigned zerofill NOT NULL,
  PRIMARY KEY (`CompanyName`),
  UNIQUE KEY `CompanyId_UNIQUE` (`CompanyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('A&T Systems, Inc.','123 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000001),('AC Technologies, Inc.','124 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000002),('ADVANCED CONCEPTS, INC.','125 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000003),('Ahmad Associates, Ltd.','126 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000004),('Analex Corporation','127 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000005),('ANTEON CORPORATION','128 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000006),('AnviCom, Inc.','129 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000007),('ASCENTRY TECHNOLOGIES, Inc.','130 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000008),('ATS','131 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000009),('Baesch Computer Consulting, Inc','132 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000010),('Bechtel','133 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000011),('Beers & Cutler Government Contracts Consulting','134 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000012),('Booz Allen Hamilton','135 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000013),('Brand-Name IT Products and Services Provider','136 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000014),('C&S Wholesale Grocers','137 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000015),('Computer & Hi-tech Management, Inc.','138 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000016),('Consumer Electronics Association','139 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000017),('Cox Enterprises','140 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000018),('Decision Systems Technologies, Inc.','141 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000019),('DeVry University','142 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000020),('DSA Information Technology Solutions','143 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000021),('Electronic Consulting Services, Inc.','144 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000022),('Engineering and Technical Services','145 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000023),('ENSCO, Inc.','146 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000024),('Enterprise Rent-A-Car','147 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000025),('Ernst & Young','148 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000026),('Fidelity Investments','149 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000027),('Gefion, Inc.','150 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000028),('GeoLogics Corporation<','151 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000029),('Georgia Institute of Technology','152 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000030),('Giant Eagle','153 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000031),('Graybar Electric','154 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000032),('HE Butt Grocery','155 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000033),('High Performance Technologies, Inc.','156 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000034),('Hogan & Hartson L.L.P.','157 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000035),('Huntsman','158 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000036),('IBM Corporation Federal Software Group','159 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000037),('Innovative Logistics Techniques, Inc.','160 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000038),('Integic Corporation','161 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000039),('Integrated Systems Analysts, Inc.','162 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000040),('JM Family Enterprises','163 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000041),('Ken Leiner Associates, Inc.','164 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000042),('Keynote System, Inc.','165 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000043),('Koch Industries','166 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000044),('Levi Strauss & Co','167 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000045),('Lloyd Lamont Design, Inc.','168 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000046),('Marmon Group','169 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000047),('Mars','170 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000048),('MATCOM International Corporation','171 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000049),('MBM','172 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000050),('Meijer','173 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000051),('Menard','174 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000052),('NATEK Incorporated','175 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000053),('NCI Information Systems, Inc.','176 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000054),('Panacea Consulting, Inc.','177 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000055),('PCCI Government Solutions','178 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000056),('Perot Systems Government Services','179 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000057),('Phoenix Computer Associates, Inc.','180 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000058),('Planned Systems International, Inc.','181 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000059),('PricewaterhouseCoopers','182 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000060),('Publix Super Markets','183 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000061),('QSS Group, Inc.','184 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000062),('RESOURCE CONSULTANTS, INC.','185 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000063),('SAGE, Inc.','186 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000064),('Science Applications Intl','187 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000065),('Seagate Technology','188 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000066),('SRA International, Inc.','189 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000067),('Swift & Co','190 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000068),('TranTech, Inc.','191 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000069),('Wilson Sonsini Goodrich & Rosati','192 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000070),('Windsor Group,LLC','193 pinetree dr','','Storrs',6279,'jon.doe@gmail.com','5555555555','5555555555','5555555555','htttp://homepage.com',000071);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard` (
  `CreditCardNumber` int(11) NOT NULL,
  `CreditCardType` varchar(45) NOT NULL,
  `CreditCardExpirDate` date NOT NULL,
  `CreditCardDate` date NOT NULL,
  `PaymentID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `fk_CreditCard_Payment1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `EduID` int(11) NOT NULL AUTO_INCREMENT,
  `EducationUniversity` varchar(45) NOT NULL COMMENT 'ResumeID FK',
  `EducationDegreeType` varchar(45) NOT NULL,
  `EducationDegreeArea` varchar(45) NOT NULL,
  `EducationGPA` double NOT NULL,
  `EducationStartDate` varchar(45) NOT NULL,
  `EducationGradDate` varchar(45) DEFAULT NULL,
  `UserId` varchar(45) NOT NULL,
  PRIMARY KEY (`EduID`,`EducationUniversity`,`EducationDegreeType`,`EducationDegreeArea`,`UserId`),
  UNIQUE KEY `EduID_UNIQUE` (`EduID`),
  KEY `UserID_idx` (`UserId`),
  CONSTRAINT `seeker` FOREIGN KEY (`UserId`) REFERENCES `seeker` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'UConn','High School or Equivalent','Biology',1.2,'04/15/2015','04/13/2015','s'),(2,'UC Berkeley','Masters Degree','Art',3.92,'04/01/2015','04/15/2010','s'),(6,'school','High School or Equivalent','Earth and Atmospheric Sciences',4,'05/14/2014','04/08/2015','s'),(7,'University of Connecticut','Masters Degree','Computer Science',4,'01/11/2010','05/06/2015','admin'),(8,'UCONN','High School or Equivalent','Aerospace Engineering',4.5,'04/20/2015','04/20/2015','admin'),(9,'a','Bachelors Degree','Earth and Atmospheric Sciences',4,'04/08/2009','04/20/2017','s');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `InvoiceNumber` int(11) NOT NULL,
  `InvoiceDate` date NOT NULL,
  `PaymentID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `fk_Invoice_Payment1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jdegreeareas`
--

DROP TABLE IF EXISTS `jdegreeareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jdegreeareas` (
  `JobDegreeArea` varchar(45) NOT NULL,
  `JobID` int(11) NOT NULL,
  PRIMARY KEY (`JobDegreeArea`,`JobID`),
  KEY `fk_JDegreeAreas_Job1_idx` (`JobID`),
  CONSTRAINT `fk_JDegreeAreas_Job1` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jdegreeareas`
--

LOCK TABLES `jdegreeareas` WRITE;
/*!40000 ALTER TABLE `jdegreeareas` DISABLE KEYS */;
INSERT INTO `jdegreeareas` VALUES ('Aerospace',2);
/*!40000 ALTER TABLE `jdegreeareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jdegreetypes`
--

DROP TABLE IF EXISTS `jdegreetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jdegreetypes` (
  `JobDegreeType` varchar(45) NOT NULL,
  `JobID` int(11) NOT NULL,
  PRIMARY KEY (`JobDegreeType`,`JobID`),
  KEY `fk_JDegreeTypes_Job1_idx` (`JobID`),
  CONSTRAINT `fk_JDegreeTypes_Job1` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jdegreetypes`
--

LOCK TABLES `jdegreetypes` WRITE;
/*!40000 ALTER TABLE `jdegreetypes` DISABLE KEYS */;
INSERT INTO `jdegreetypes` VALUES ('2',2),('2',20);
/*!40000 ALTER TABLE `jdegreetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `JobID` int(11) NOT NULL COMMENT 'CompanyName FK',
  `JobListDate` varchar(11) NOT NULL,
  `JobTitle` varchar(45) NOT NULL,
  `JobCity` varchar(45) NOT NULL,
  `JobState` varchar(45) DEFAULT NULL,
  `JobZip` int(11) NOT NULL,
  `JobDuties` varchar(45) DEFAULT NULL,
  `JobYRSExperience` int(11) DEFAULT NULL,
  `JobDegreeTypes` varchar(45) DEFAULT NULL,
  `JobDegreeAreas` varchar(45) DEFAULT NULL,
  `JobJLowRange` varchar(45) DEFAULT NULL,
  `JobHighRange` varchar(45) DEFAULT NULL,
  `JobFillStatus` varchar(45) DEFAULT NULL,
  `PosterUserName` varchar(45) NOT NULL COMMENT 'FK',
  `CompanyName` varchar(45) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`JobID`),
  KEY `fk_Job_Company1_idx` (`CompanyName`),
  KEY `fk_Job_Poster1_idx` (`PosterUserName`),
  CONSTRAINT `fk_Job_Company1` FOREIGN KEY (`CompanyName`) REFERENCES `company` (`CompanyName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_Poster1` FOREIGN KEY (`PosterUserName`) REFERENCES `poster` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (2,'1/2/2001','Accountant','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'25500','50500','No','p','AC Technologies, Inc.'),(20,'1/20/200','Manager','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'34500','59500','No','bob','DeVry University'),(21,'1/21/200','Marketing Research Analysis','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'35000','60000','No','post','DSA Information Technology Solutions'),(26,'1/26/200','Occupational Theropist','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'37500','62500','Yes','dlewis','Ernst & Young'),(30,'1/30/200','Physician','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'39500','64500','Yes','ncooper','Georgia Institute of Technology');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobskillrequirements`
--

DROP TABLE IF EXISTS `jobskillrequirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobskillrequirements` (
  `JobID` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL,
  PRIMARY KEY (`JobID`),
  KEY `fk_JobSkillRequirements_Job1_idx` (`JobID`),
  KEY `fk_JobSkillRequirements_Skills1_idx` (`SkillID`),
  CONSTRAINT `fk_JobSkillRequirements_Job1` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_JobSkillRequirements_Skills1` FOREIGN KEY (`SkillID`) REFERENCES `skills` (`SkillID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobskillrequirements`
--

LOCK TABLES `jobskillrequirements` WRITE;
/*!40000 ALTER TABLE `jobskillrequirements` DISABLE KEYS */;
INSERT INTO `jobskillrequirements` VALUES (2,2);
/*!40000 ALTER TABLE `jobskillrequirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlineservice`
--

DROP TABLE IF EXISTS `onlineservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlineservice` (
  `ServiceName` varchar(45) NOT NULL,
  `ServiceTransID` int(11) NOT NULL,
  `ServiceFee` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `fk_OnLineService_Payment1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlineservice`
--

LOCK TABLES `onlineservice` WRITE;
/*!40000 ALTER TABLE `onlineservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `onlineservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'JobID FK',
  `PaymentAmount` double NOT NULL,
  `PaymentStatus` varchar(45) NOT NULL,
  `PaymentDate` date NOT NULL,
  `Job_JobID` int(11) NOT NULL,
  `PaymentMethod` enum('online','bank','credit') NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_Payment_Job1_idx` (`Job_JobID`),
  CONSTRAINT `fk_Payment_Job1` FOREIGN KEY (`Job_JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster`
--

DROP TABLE IF EXISTS `poster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poster` (
  `UserName` varchar(45) NOT NULL,
  `PosterPosition` varchar(45) NOT NULL COMMENT 'CompanyName FK',
  `PosterContactEmail` varchar(45) NOT NULL,
  `CompanyName` varchar(45) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`UserName`),
  KEY `fk_Poster_Company1_idx` (`CompanyName`),
  KEY `fk_Poster_User1_idx` (`UserName`),
  CONSTRAINT `fk_Poster_Company1` FOREIGN KEY (`CompanyName`) REFERENCES `company` (`CompanyName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poster_User1` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster`
--

LOCK TABLES `poster` WRITE;
/*!40000 ALTER TABLE `poster` DISABLE KEYS */;
INSERT INTO `poster` VALUES ('bfry','HR','bfry@sra.com','SRA International, Inc.'),('bob','Test','abc@abc','DeVry University'),('dlewis','HR','dlewis@ey.com','Ernst & Young'),('ncooper','HR','ncooper@gatech.edu','Georgia Institute of Technology'),('p','test','test','AC Technologies, Inc.'),('post','President','poster@poster.com','DSA Information Technology Solutions');
/*!40000 ALTER TABLE `poster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priorjobs`
--

DROP TABLE IF EXISTS `priorjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priorjobs` (
  `JobID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PJCompanyName` varchar(45) NOT NULL COMMENT 'ResumeID FK',
  `PJJobTitle` varchar(45) NOT NULL,
  `PJDuties` varchar(45) DEFAULT NULL,
  `PJCity` varchar(45) DEFAULT NULL,
  `PJState` varchar(45) DEFAULT NULL,
  `PJStartDate` varchar(45) DEFAULT NULL,
  `PJEndDate` varchar(45) DEFAULT NULL,
  `UserId` varchar(45) NOT NULL,
  PRIMARY KEY (`JobID`),
  UNIQUE KEY `JobID_UNIQUE` (`JobID`),
  KEY `UserId_idx` (`UserId`),
  CONSTRAINT `seekername` FOREIGN KEY (`UserId`) REFERENCES `seeker` (`UserName`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priorjobs`
--

LOCK TABLES `priorjobs` WRITE;
/*!40000 ALTER TABLE `priorjobs` DISABLE KEYS */;
INSERT INTO `priorjobs` VALUES (1,'Optum Technology Inc.','International Intern','hello ','Hartford','Connecticut','04/01/2015','04/01/2015','s'),(5,'Vet Care','Dog Petter','pet cats and dogs that are so sad ','tokyo','japan','04/21/2015','04/21/2015','s'),(6,'johns hopkins','research assistant','lab experiments ','lima','peru','04/07/2010','04/16/2015','s');
/*!40000 ALTER TABLE `priorjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resume` (
  `ResumeID` int(11) NOT NULL AUTO_INCREMENT,
  `ResumeLastName` varchar(45) NOT NULL,
  `ResumeFirstName` varchar(45) NOT NULL,
  `ResumeObjective` varchar(1000) NOT NULL,
  `ResumeSalaryMin` varchar(14) DEFAULT NULL,
  `ResumeFileName` varchar(45) DEFAULT 'No File',
  `ResumeFilePath` varchar(45) DEFAULT NULL,
  `ResumeFile` mediumblob,
  `Added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SeekerId` varchar(45) NOT NULL,
  PRIMARY KEY (`ResumeID`),
  UNIQUE KEY `ResumeID_UNIQUE` (`ResumeID`),
  KEY `SeekerId_idx` (`SeekerId`),
  CONSTRAINT `seekers` FOREIGN KEY (`SeekerId`) REFERENCES `seeker` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumelistedskills`
--

DROP TABLE IF EXISTS `resumelistedskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumelistedskills` (
  `ResumeID` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL,
  PRIMARY KEY (`ResumeID`,`SkillID`),
  KEY `fk_ResumeListedSkills_Resume1_idx` (`ResumeID`),
  KEY `fk_ResumeListedSkills_Skills1_idx` (`SkillID`),
  CONSTRAINT `fk_ResumeListedSkills_Skills1` FOREIGN KEY (`SkillID`) REFERENCES `skills` (`SkillID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `resumeid` FOREIGN KEY (`ResumeID`) REFERENCES `resume` (`ResumeID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumelistedskills`
--

LOCK TABLES `resumelistedskills` WRITE;
/*!40000 ALTER TABLE `resumelistedskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumelistedskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeker`
--

DROP TABLE IF EXISTS `seeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seeker` (
  `UserName` varchar(45) NOT NULL,
  PRIMARY KEY (`UserName`),
  KEY `fk_Seeker_User1_idx` (`UserName`),
  CONSTRAINT `user` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker`
--

LOCK TABLES `seeker` WRITE;
/*!40000 ALTER TABLE `seeker` DISABLE KEYS */;
INSERT INTO `seeker` VALUES ('admin'),('ebaily'),('s');
/*!40000 ALTER TABLE `seeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `SkillID` int(11) NOT NULL,
  `SkillName` varchar(45) NOT NULL,
  PRIMARY KEY (`SkillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'C++'),(2,'C'),(3,'Java'),(4,'XML'),(5,'Visual Basic'),(6,'Cobol'),(7,'Informix'),(8,'Oracle'),(9,'MySQL'),(10,'C#'),(11,'.NET'),(12,'HTML'),(13,'JavaScript'),(14,'Visual Basic'),(15,'VB Script'),(16,'UNIX'),(17,'Java Server Pages'),(18,'Active Server Pages'),(19,'SyBase'),(20,'Python'),(21,'Fortran'),(22,'Microsoft Word'),(23,'Microsoft Access'),(24,'Microsoft Project'),(25,'Linux'),(26,'Pascal'),(27,'Assembly'),(28,'DBase'),(29,'FoxPro'),(30,'LISP');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserName` varchar(45) NOT NULL,
  `UserPassword` varchar(45) NOT NULL,
  `UserFirstName` varchar(45) NOT NULL,
  `UserLastName` varchar(45) NOT NULL,
  `UserStreet1` varchar(45) NOT NULL,
  `UserStreet2` varchar(45) DEFAULT NULL,
  `UserCity` varchar(45) NOT NULL,
  `UserState` varchar(45) NOT NULL,
  `UserZip` varchar(45) NOT NULL,
  `UserEmail` varchar(45) NOT NULL,
  `UserPhone` varchar(45) NOT NULL,
  `UserFax` varchar(45) DEFAULT NULL,
  `UserCell` varchar(45) DEFAULT NULL,
  `UserHomePage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('a','a','admin','dude','','street','city','ALABAMA','6279','admin@google.com','phone','fax','cell','homepage'),('admin','password','admin','admin','','','a city','Connecticut','a zipcode','admin@gmail.com','admin',NULL,NULL,NULL),('anid','pass','fname','lname','addre','','city','Iowa','12345','asdasda@asda','123456789','','123456789',''),('another test user','abc','firstname','lastname','address','address','city','Connecticut','12345','abcdefg@hijklmnop.com','phonenumber','','phonenumber',''),('bfry','poster01','Barbara','Fry','P.O. Box 92957','','Los Angeles','CALIFORNIA','90009','bfry@sra.com','','','',''),('bob','bob','Bob','Bob','a','N/A','a','MASSACHUSETTS','12122','abc@abc','N/A','N/A','N/A','wwww.test.com'),('dlewis','poster02','Duane ','Lewis','123 Anywhere Street','','Atlanta','GEORGIA','30123','dlewis@ey.com','','','',''),('ebaily','seeker01','Eric','Bailey','2345 James Avenue','','Los Angeles','CALIFORNIA','90009','ebaily@needjob.com','','','',''),('han','dog','han','hu','','','some place','Connecticut','12345','hanhan@gmail.com','123456789',NULL,NULL,NULL),('maarcus','a','marcus','li','somwhere in ct','','storrs','Connecticut','06something','maarcus.li@uconn.edu','8603833756','non','8603833756','non'),('mar@gmail.com','a','mar','mar','an address','','c','Kentucky','111111','mar@gmail.com','123456789','','',''),('marcus','a password','marcus','li','somwhere in ct','','storrs','Connecticut','06something','marcus.li@uconn.edu','8603833756','non','8603833756','non'),('marcusli','another','Marcus','Li','','','West Hartford','Connecticut','06119','marcus.li@uconn.edu','8602325015',NULL,NULL,NULL),('marcuslis','admin','Marcus','Li','','','West Hartford','Connecticut','06119','marcus.li@uconn.edu','8602325015',NULL,NULL,NULL),('ncooper','poster03','Nathalie','Cooper','456 Nowhere Street','','Atlanta','GEORGIA','33219','ncooper@gatech.edu','8601','','',''),('p','p','the','poster','street','N/A','abc','FLORIDA','12','asds','N/A','N/A','N/A',''),('post','post','Mr','Poster','Addr','N/A','Cty','ARIZONA','01011','poster@poster.com','N/A','N/A','N/A','www.dsa.com'),('q','q','q','q','123456789','','storrs','Alabama','11111','q@q','123456789','','',''),('s','sdf','another','person','11 something',NULL,'Los Angeles','CALIFORNIA','01013','sdf@gmail.com','',NULL,NULL,NULL),('sallen','seeker03','Susan','Allen','231 Tech Lane','','Atlanta','GEORGIA','33219','sallen@needjob.com','','','',''),('ssdffdfsdf','q','asd','asd','sdfsdf','','sfsdf','Indiana','12312','w@uio','123',NULL,NULL,NULL),('tbrittan','seeker02','Tyrone','Brittan','3321 Old Peachtree Road','','Doraville','GEORGIA','30123','tbrittan@needjob.com','','','','');
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

-- Dump completed on 2015-04-25 11:49:10
