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
  `ApplicationID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Job_JobID` int(11) NOT NULL COMMENT 'FK',
  `SeekerUserName` varchar(45) NOT NULL COMMENT 'FK',
  `Status` enum('Pending','Accepted','Rejected') NOT NULL DEFAULT 'Pending',
  `ResumeId` int(11) NOT NULL,
  PRIMARY KEY (`ApplicationID`),
  KEY `fk_Job_has_Seeker_Seeker1_idx` (`SeekerUserName`),
  KEY `fk_Job_has_Seeker_Job1_idx` (`Job_JobID`),
  KEY `resumeid_idx` (`ResumeId`),
  CONSTRAINT `fk_Job_has_Seeker_Job1` FOREIGN KEY (`Job_JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_has_Seeker_Seeker1` FOREIGN KEY (`SeekerUserName`) REFERENCES `seeker` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkresumeselected` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'UConn','High School or Equivalent','Biology',1.2,'04/15/2015','04/13/2015','s'),(2,'UC Berkeley','Masters Degree','Art',3.92,'04/01/2015','04/15/2010','s'),(6,'school','High School or Equivalent','Earth and Atmospheric Sciences',4,'05/14/2014','04/08/2015','s'),(7,'University of Connecticut','Masters Degree','Computer Science',4,'01/11/2010','05/06/2015','admin'),(8,'UCONN','High School or Equivalent','Aerospace Engineering',4.5,'04/20/2015','04/20/2015','admin'),(10,'uconn','Masters Degree','Art',4,'04/23/2015','04/24/2015','Gorky');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
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
INSERT INTO `jdegreeareas` VALUES ('Aerospace',2),('Computer Science',2),('Computer Science',20),('Farming',20),('Finance',20),('Business',21);
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
INSERT INTO `jdegreetypes` VALUES ('High School or equivalent',2),('Associate Degree',20),('Bachelors Degree',20),('Masters Degree',21);
/*!40000 ALTER TABLE `jdegreetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `JobID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CompanyName FK',
  `JobListDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JobTitle` varchar(45) NOT NULL,
  `JobCity` varchar(45) NOT NULL,
  `JobState` varchar(45) DEFAULT NULL,
  `JobZip` int(11) NOT NULL,
  `JobDuties` varchar(1000) DEFAULT NULL,
  `JobYRSExperience` int(11) DEFAULT NULL,
  `JobDegreeTypes` varchar(45) DEFAULT NULL,
  `JobDegreeAreas` varchar(45) DEFAULT NULL,
  `JobJLowRange` varchar(45) DEFAULT NULL,
  `JobHighRange` varchar(45) DEFAULT NULL,
  `JobFillStatus` varchar(45) DEFAULT NULL,
  `PosterUserName` varchar(45) NOT NULL COMMENT 'FK',
  `CompanyName` varchar(200) NOT NULL COMMENT 'FK',
  `jobDescription` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`JobID`),
  KEY `fk_Job_Company1_idx` (`CompanyName`),
  KEY `fk_Job_Poster1_idx` (`PosterUserName`),
  CONSTRAINT `fk_Job_Company1` FOREIGN KEY (`CompanyName`) REFERENCES `company` (`CompanyName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_Poster1` FOREIGN KEY (`PosterUserName`) REFERENCES `poster` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (2,'0000-00-00 00:00:00','Accountant','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'25500','50500','No','p','AC Technologies, Inc.',NULL),(20,'0000-00-00 00:00:00','Manager','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'34500','59500','No','bob','DeVry University',NULL),(21,'0000-00-00 00:00:00','Marketing Research Analysis','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'35000','60000','No','post','DSA Information Technology Solutions',NULL),(26,'0000-00-00 00:00:00','Occupational Theropist','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'37500','62500','Yes','dlewis','Ernst & Young',NULL),(30,'0000-00-00 00:00:00','Physician','storrs','CONNECTICUT',6279,'Do work',5,NULL,NULL,'39500','64500','Yes','ncooper','Georgia Institute of Technology',NULL);
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
INSERT INTO `jobskillrequirements` VALUES (2,2),(20,23),(26,5),(30,2),(20,10),(20,5),(20,3),(21,5);
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
  `PaymentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JobID` int(11) DEFAULT NULL,
  `PaymentMethod` enum('online','bank','credit') NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_Payment_Job1_idx` (`JobID`),
  CONSTRAINT `fk_Payment_Job1` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1000,'1','2015-01-25 05:00:00',2,'credit'),(2,1500,'0','2015-10-06 04:00:00',2,'online'),(3,666,'x','2015-10-22 04:00:00',20,'bank');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priorjobs`
--

LOCK TABLES `priorjobs` WRITE;
/*!40000 ALTER TABLE `priorjobs` DISABLE KEYS */;
INSERT INTO `priorjobs` VALUES (1,'Optum Technology Inc.','International Intern','hello ','Hartford','Connecticut','04/01/2015','04/01/2015','s'),(5,'Vet Care','Dog Petter','pet cats and dogs that are so sad ','tokyo','japan','04/21/2015','04/21/2015','s'),(6,'johns hopkins','research assistant','lab experiments ','lima','peru','04/07/2010','04/16/2015','s'),(7,'A','B',' cccccc','ssss','CT','04/02/2015','04/22/2015','Gorky');
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
  `ResumeObjective` varchar(1000) DEFAULT 'not specified',
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES (101,'x','100','qaq','adsaxwq',NULL,'2015-04-29 03:17:48','Gorky'),(102,'','','No File',NULL,NULL,'2015-04-30 04:12:51','admin'),(103,'get an A on this project','100','Plan Of Study.pdf',NULL,'%PDF-1.6\r\n7 0 obj\r\n<< /Length 4912 /Filter /FlateDecode >>\r\nstream\r\n ğH\n|ÉàÂà­è¤]q\\\\c°®œ»ˆIãºAªén÷^öŠoL]yš7…i²º+Ñ\nŞLï\\\"Ú]°`º~˜çÊMzÅ^Îü>àû±‚Í\\\'ùhöWV,j(.J/Ë1¨”,ğS§òÿ#ã|›ºØŸ±fQ`KŠ>\\\'!œnnÂ­j-åÛJ…*¬Šú£Æî+«A\\\\1ÁZšIXsÙGæ‰–©e\n†tOĞıUÙ®é¯î\\\'øùì“Ş‹ôJìT’Â²×æÒÛ†ºeOº‹k*¨îæ‡È3½‹7+ñŒ\\\"WÉBdz”ÚÁ;çİZÈ€\\0Ü‹Á!V%‚¶ÈùÊÎéX~í¾8pÆ¥°¼Ì¾/Ëv[óÃXõoU2Ã5š‰‡kSaZHú<o Ø]Õ=+´!xKídÏùÌk¼13p=ğOaòsÒ^o\\\'  r¿ûıƒDğ0Çùº	®7Œ|ÉÒ¿ç6Ì õ$(#\r —z”ªÜ/OŠôÌj†Gş¼p¸ÔâS„è*Ÿ¹F m(ÔâÇIÊ#ó–Õp˜;½fŞÎÛ7WHkú7Ñµ‰•å¬˜Üø5Fpè²º›º®HváâÖ0¿„hBQ§äğ«Òz·ÈÅCïı|Ml_D–~”/òÒŒEï¾ÿ…i\Zï­ ^kİÖ«Úév˜š3#4«w[£ÑÕn”V3$atÍvoQl»ÊÕ(TÌ\\\\¿ÓYÊRØ·q]ÄÔÍo+&ª~^•L.?|}Ÿ1èÈIêêk´Ó\rú(Æ¹9ËÂ­¼§Ÿ‹D¥;¾İ¸Tºyó›Ufë]:eãt´y\\\'¤ò}LÏá\\\'„*ªG‘>#š+^=n\\0t»/PŒÊísÿP–u†i[S˜èIÁìp‡º‹°İue\ZÆ(¬WÎÆFI%ìVí¨\nƒ-Ø@J—GÓÇ]Q=<KİšLÄ.Ú”ù£xÇ\r¨fº”¿½ìsù:Ê+—<´›˜Hlİ~oåœòLğ+0œ¨1<H4µÎ7Á¼1\r9®ÑDdÛ34‘Q)yvfÀQDõêÁ•ZşìÌ@Oç–æ]ƒıÜá˜j“\\0¡ar’c(mso\\\'pÍo:W¦:<ßC\nìdˆTŞWAR QÁà0—¾Ã« Pƒ¨9Îò»dboŸX¬i‹=ïz¶=®4Ó.T:tÀáÃWrOV€øÙïE˜Úd™Lò»cÅ)@ÖÇ\\\'|ŠÔ¶9AÈŸWŸœçUƒ$¬’ÚPö„0Z²O#ó[‚U©\r¶\Z=¤™›ch0j½ãËĞJà(\\\\/?&rØ“¥ Yêhàc¡Éømd·ÀE€1ÖÔLûµşîù­fíÇµày\n\\\\ÀÙ!9ŸŒ~’nhJ”0ß°Ô&·i^Š˜õ«ºŞ`¶QY/lfv¨èBç2iÜD†K³L†ÏGícDa{Q…lP¢êZX®¼m£†•š2üÅxé)w³ÏÊ¯bóÍŸi††cQ¤Î€ıÑ8“^Euæô «µ½©<ÉÔ_fúƒxXú:çoîy8¿»²ò.É¸84WØ=Hß\\0®j!DñŸS«ñçÆ§ñöiHwG\\\\zo·º©ü~ŒÄô§©ÑÜ¯t=s²<euÛ—1Ã’V 54~Ûê°g‡É•”SC‹Kµdù9\\\"¸Æ_Öû½å$÷-H@ì©¨g\nÄ‘i†Şy¸º´âo‡˜ƒ²ï¤\n×ÂÑ¹Ä™°OÌ¸J.’b+Ö:ìl<)\Z0Oö; °úäFÅMMå…¼¨	aR0EM½°§(Ò©|È %Ïòàxœ¬µ¦‡áûÁj=o×Z¢Ë™è%sá®eÜF‰xGùİ\\\\/W^ºh¾§ù˜ÅÉ/Q‰=H-;¼†?İR?E{_ú=²š×¿Ë+g‰ì~J$GÉÒ×^ñ=zÖtÇ1’˜Üó‡ŠôŸ†.1âKíjˆqmtzœ_µ%Sñ.Š(ŸsâÖgó¿lhç0iu3…˜0c¹ú4XÃ‹yI\\\"‘•Ù›§ó;‰®Ÿ?O\\\\p“\\\"I3.å8\\0„ˆ¸yöGû¶Tíå²ƒ•H8QRÓrö‡18V¨‡§õQáB*-g…Xú6¥ÊRÎ-r8şŸß>¦ƒ4¦üûšÕâ@ûò$æR´Áy>@S<û\\\"\rTûà¬QK¡\\\"CßçòLOáğ¿Ÿû£É…#ªt/äWM_Şòf¤æ\rè…²®ÖgÜ¯6nP†á^œ³†Îèéy«À%2‚ËSıEJÃ.Í1æŞ]‘¹—“¨ÖŸ„­`Ùbâ8Y\\\'ÔœyQ¡ãw®\\0[n»«ÔèçºˆÀ›!„!2*iW]±Uúµ!”ÄëíãuL,†ÿrÚâfİ©Àšö4†ˆày÷õ\\\"æv»E<“Ï/)ù[Oœ|şjBYÕÕ[…¾ŠÇêèèâ×iÆãYõ$ÿš‚QNFpii\\\'º5\re4Écß1Š¢Ø²o>·ÅMiÖòÈv¢›î,)Œq[Vi\ru	ƒÏg<”eu©ïs=Ïô0–õ26S¯¬ô\\\'\\\"êªš´Ú§ú7BKå>Õl7zäDÁP[Ë½aSB¸Œ67É§ç@‡ŒË@‡:\\0ê±q/s¾İT…©İ¬k•ÁÉ-|¡ªVˆØI\Z`û0ºĞ/{‚È¡ÏQ×õoöCĞÈŒg.ÊĞÔˆ©j\\0,6|Û~F*u\\\'Õ÷‚¨WïBÁ^pÊÿ¦â˜Åß#wœì™RÈ\r¾ï‰m•â{ä{ã?è|:8(w¼øã‡2RÉ®¾¶-Î$µPrÒzppÁgId!ìDÂ83:h@¸2ØşİÎÄŒbvİ5~ùÜ ¯ûø·Ê÷ñBÓu=‘B#¾É ÈàOàH/ioEõıšŸqŞEÍüS	ã³€ãğü)Ğµà“Ñl¼Ê¹´¿~Ÿ½¸:$[À\\\\-½Æ˜Í¼0–µ6	¿N­…Â„î‹ÌWh¥¤+£­;@òÔ\\\"ÜI³»É”jÌ=4­ƒİR×úItV¼}Ä\n’ÛŒÏ0¦¨§U%¥œ;‡êÄ¾Ô*×«\\\"y’Â¶ØÂeW~KùÀJ˜…İ÷é9¤u¦|ÌGöö6©¶u”éî¥ZdôÙÔ$nm<%­ov«ş³»n¨ïûÎmØï§Jémæò“µ›½ÛáíORJSEüØk}Ç÷¸[æ-ºÚ7ªÜˆa­àtÁuÕK4.ÚTöƒjï»IµÀå„ ·lÊC>©	|âÊñòâÑ<B\\\\8÷usU•è<–BCÔõ¦¹7`i»Y¤×¯M2N.üÄë?6åCÈ•mB…ÀIJÅ+óÌ1á\\\\”»Odw\\\\ŠhÒ¥0áÆujseKÂø†J¼9lwxÃgí\\\\#.R8œÔ0Ik³*6U¸c9´	(Y5®ğ³šÍóÃ#3rMŒ‡3ûRVWE>|@\r€Ä.^$Ô›Ó‹ „!¾æ\\\"/OÈzıùšçB³]$Ÿ¶åU	s¨áq¾®“FÚú(ÎReş\\\'j?+HHÇŒ­¯!Ævş)·Pé,„}£õq	Ğ–!€Òš£«ÛfÆ›ˆ¹f;×)Äæïü•®®Ç¬weDa4ZÚyœQt´&Syvûä„Û¬ãä!íOg\\\\è¦h±Ë×ië†{UÜ¹xÎ\\\\·<×´í}ñP½İ´©68•ğĞSèœû\\\"L6’¼[vİ¬.7lTo7”dóc…‹ï!ÄYCñlxDĞ6·PG•¿àN^¢½ÚÕ´Ú³(yš†s9(Â¬*,ædÎó…rÃÀQ-?4GO“Ä# |[ô™¯\ZôPÁ– :ó°ò¬ŒRÖSÃjÊ¬Æõ‘½éË@¡tÄ9W÷“!zÏlœ`uû5˜úOï>÷ÌÓìÔ	\n(=æ1yF3)í¨Ö„F+íŞÛCƒR3Hƒeïu7DÌÍ+·îw§×ƒ@l¨Ó½œ(Iğ%˜NåĞ±8j}§‡9Zî	:Ä²2ªüÁÓÃKÆ%¡a÷¼†ë<îÑÖ†¿o¾™o€ŸĞákü%¬¬¡8Ó±|\nãz!Ûb$œ³Ê•„¿kÏ˜é@ê’±tƒm\\\'Ğƒõl‰ù`ÂÅ…\\0¡ßŸ)ş°İ›qis€´\r=/Ä¯Ô\\\"*KqS|E*\\\'ßû§K´Ù}ro¬.G]WßË„Jº—`uO»u2z&ª®6ê(ò1“’\rÜ\\\"AYã!OEª-à¿–±Ğ)f¾ËQ2#ù—%´ÚÃjÍ4ˆZ©É›–\r·!ò§Åiû‘mªÀå˜QßÎ¿¯ñkR_õnNhO°XÍŒñ§Y§]I¦½ÍI <Õp9`™Ønøæğ{¤…¬\r6¼ ¸·•™×VvH*¨>Ô»ìÌ,šºÓô\Z…OÄC 3u×r³e–\\0¹cIiAC şèåUÖ)ğA­Ñoü’KºfÉ„n³õGYÓ{|uñ=ß†§ÌÛA·ëL¦ù8÷¿®¦0ÎQˆ>mú‹<Ş± ¾vÁ9íífÇßŒöıœòÑ)¥i[sR¥góIËúğ®âÍ„hÙÏ\rF¸?VVDáÆ}­6g¶bmàFBºxZIŒÛñ¨†M`¸ËâQc>\n\\\"‰Íš<ÙR-Á0\\\"V;%¡²—è¾`0Ÿ/÷Ì©ğîD8êÍóˆD/+ &âV®édWÎ¶x™*ı	bÁ\\\\ÁÕ%º<7\rèe¶8ä`O-+VñâLÒ=M˜qø?²¯Ú@áÅ`ÏM3Ã;j¢N‘t¼ knÀ\\\\bC°X…†]òó¥¹‘úÃ‚ÀöÉ2Á¾¯lglW	PÂîgÄHŸµ³Š	ìÊ#t¨úËöÒ»alèÑoĞlê6ı ÿV-.ê¹8¾C.(`7û®Äöèûäü vY÷ŞúºşşÀ70Ö\\0ue¿° ”©Û3–PjKÌ‚¢z—O{iœ…8Èhcº+ÿÅteqDûÉ\n^…«J,c†C9Ş Í{áñwÇNÉ›Kl6iNwš4ŸÕ¶¦Y9Eİ-GE1r^Øï‰G\Z’;û;ö\nÜÉu2=¤öV‹/I/´tç2Ïş&Án,ÿm+ÌÛÔÌ·õ«d«mŞŸ”V#–8WØz?ênŸpö±Šöo›ÕÏq]­Uà ]2å\\\\¬k…`<½#ü¸fgEœRéLGØ£êøbàE-ÆÂà./\\\'\\0dG3s166,a[ÜX²ú¿*«àÜgÍ4½2¬4$Ñ}FWf`Êİè”eàÓgÁî\ré\n	ßƒN}ôhÙî]F¾ywRÇKşöÛ©ó} *‰85üÕº›yñx`…¨µ\nİºR—²oÉVîYûHÕ¶xI¶íâÓğŒ4^¦óÁ“½»j•‚>L_³PäÀ½®‚YÒ|kg,h¶F³\\0ã. ²j!ÚÄq,KM[U~Í\n.ÎTÒ²M¤™<6¼dCPÚ\Zşò\\\"œÊäËÇ\\\"»ÒDPÆ·”!ß·#+ıkÙòQÔğšX¹iœÆ°“rTA+óq€ÂÉİ—Ä!1ÿğVDÒ&¢hÓ»“âõ¸u½^|/ÉÆ‘°œ}\\\"åUuRÉè•_Š‰Ce¤Wbéu\\\'1ºßÑM@\räìt¹¬ÛM ¯Âl”ñæVI£¶ô8‚4¢Rå¹”¼éPdº¢‹às”0Ãw4¨Ø!) f‡ew@#0îÑ«†\\\'t>±`9Ök·¢?\nO±ŒfÏFf`¢0gîOUcë„ıj¼uã>…Ì+—-xEÔ\nP$†-€zàÙg)fÂÖuIyåTê¼ÉJAîk³Ê½l<•N^yÊ’•¯³%òÌÿÇ®íú\rÇX’â9ßôqÁ˜D*dÛh&÷«Tt°µVo%_ck,Ü[˜@ÉÕ^”`(q·Ÿ•Ö×´zÙ)1b4¸$ı>œŸ\\\'&§-¹ş+jòaø¹I¢¥ù9•r~ĞAªö³dlZî4GQJ:€\\\'HZUj<Ñ`@Ë¯úwÛ‹ô¸E«b¡ˆvPŸ#1¯\\0JÚ:ŞIzì±MR¯ñÛØãì~\\0€Eª*F¤î‹_»k1ˆÈædª¶À©ñ…\\\\À¤èèw·©ôÒ	÷˜¯.8Œ]w>éº~ B£ :äÚõ8Àõw„ìz«dä·¢$oKıû\\\\ĞÂÂèÖ™ ÿÆTúˆZQ=zBLúí_±³jJ\n°\Z$(¤¦õdAî¶,\r’I—x³¾¦Ìi0(§°\\\'cê7ow=O¢À„ØVA+O$hyˆû|6G~Ğ¢>j;F‰ØÃÊ»‹ı_r¿Ş\rqQ¡¿Ò™ÿ{>¥N¯yğN™SÙ\r~x˜zŸÖ/¨ä4à=½Ãu™\Zœ¿ZMÏÖEM>4˜ƒÓq´\r\nendstream\r\nendobj\r\n9 0 obj\r\n<</Type/XObject/Subtype/Form/FormType 1/BBox[0 0 612.0 792.0] /Length 144 /Filter /FlateDecode >>\r\nstream\r\n¯î6U“òşşÁWÜŒöœX\\0²RhM|ôæB5p‹\\\"«yãBl‡ÁÃbòğ$Áåe¹›\nŠ‰gŒƒ”|¿ö/ï;Íó2ä‰r‹Aÿ/Š0äSÓdğælE¾*©Ô& •T[´÷siÀÂ~‰1¨¦`†ÖÔ˜½ÄGÖà·¬tâæ´-·ô­·“­İ4&îq…\\\\\\\\\r\nendstream\r\nendobj\r\n14 0 obj\r\n<</Type/XObject/Subtype/Form/FormType 1/BBox[0 0 612.0 792.0] /Length 144 /Filter /FlateDecode >>\r\nstream\r\n7TòÊC\\\"SèmfT<¹ABeõpÖ~¬DGÕu:#ˆ\\0ø­g\\0â*Øj‡dĞ5ÉC(¨Uç„+¼®ü¤ºßQ¨6	È\n`La\\\"Ş\nãD´DíàÛÉ<w‰h=X½îãèWˆsu9óê*Ùk:U>3.y†ˆ’×sFC ®`åä\r\nendstream\r\nendobj\r\n13 0 obj\r\n<< /Length 4160 /Filter /FlateDecode >>\r\nstream\r\nÏë–¼Éû¢[¹NBŒ…üZ(Éä?uÖÆ3mÓª‰¹¡hìbwÜ;Sve¤âiøšç±z˜Ãù‹¬ÛIËONe—‹ƒß:p¥¥€T˜øë d	öo<‡G9»Ñ¾OxEærÒ§`¥eÓ½ÖŒ0\Zß²Ã€9lv-+cÆ	rhô5eî|…>Ç{<º–Éín v‚Rã#+P#¯fk GÕT¯†ş~xàË‹Ù¿sL°´±[4h¯Z`€küä¼Å9Ìµ.KÅXVÜ{û½V<*Ä\\\"]¶Ä‰|:ˆ¯:éâVi\\0;†*±Ÿ>¯~ÛGÔ\\\\Òèø\Z0Q†ïıæ¼}óõ7t?Îr»gÇš¶»OÁ< •şÂìgAlºœº„pÊ#\n˜8çPûïÀm_e—\nê_x!q:×\nKè«@\n¥UæŠ}@X¿Qı¼–9pQÅÏ©ŞıõÀø\nÆÆ˜ˆmv4J¾ÒÌ²¸]—ı0;ºô®¤oÁŞ†]ÒZNÖÇ•¬Ÿğz>í,‚LÃó¸Î’÷>:yv‹ƒHÈ„“Œµ%Ò%¼_\\\'ÁÂ\\\\\n\\\'ÜĞµgµ¨[”½šßK¢IÖNïî‹%_¯…áf%âô›ñ‘ŠªYW†Œ²Ò*tAÅ(K85ûšCèÃ®=®á1¡C,Ç%[‹˜è\Z®ŒQµEÌÕªê¤.ëvsªrë¥8‰$¥ğ¢nÇ:ÜÌàpVg\rø	íŸf/\\0»Àl#w;=²†¡ïd]š!@:wó\\\\ªAYHğ?l\\\"í­®Õ€Í-ùì±´&\\\'x°Ä³ “ğ¥UNı¥½à›u}e\rHl(“Ü±\\\"IÏ¦4ŒNÖä¢8ê,Ñ¤4ê.èaö]’ Ì2(»ˆ\\03]·´§‘dÒgğå9¿Î Å„Ğ âíı§µ%‚û¤œğÊÆãkD«‚ÑÅ”bä„¨OÉ©è-x`Ãm¹(¤ãÅ1Våyˆ]0|*ã“\n7Bó¢dmzÊ$Zfµ\Z¥#H—hİõ”U\rƒ¬¡¦Ì\\\"„NiŸ¡Í±Ó CUÏb¯R¹mŸËDHG°¯ZÕE¶(\Zj‡İñğ›¯Ü=ö‡.yãÉê°äÅ©]ºÔøãO8MbÃ@…—ï\rØŞoš^\\\\<öB€5sp¿:»ğ&ª—;ñx˜uM²qêc_ì§ÁİîNN÷oÙ£×©0\r}Áyïëd­¹vşµâ`Yh‰æïgœÓ[~ú”	Æ\nTíS&œo­S{ñÖ?”B‘ë±YeİuS2úğŸäEûHu·1ö¡l êdà×Œ× oí7V\Z¯=Ïº»ÓËKİô’5éœ‰ËÇ¶¹<¡Ê´AgéÊÌt„;}§`ŞHQ]Pˆ˜\\\'-“;¾Ù. ©ïÛˆ)f5 ôî¿È´À6«\\\"‰Ïş7Q¢o¢ì0ÿÌ/­eìÁ_Ô|B~˜_¤²Uc¯†ŸÉ\r}ˆ>O–y¶“œŠxã!ÑèäT¦|$cco+lÀÂ‡=”w8ú\\\'™=)ü­Š¦Éc˜÷3áÛ:P5óuYuö¹öùS½Û›Ù¿Õ–Îyæ\\0Du\\\'ó`Òv¥€wƒ^H”±ÃJ ”‰¸µ@™VuØ˜ÁF¡xHE7ô‘÷1b³R80øÙ\Z£ \ZŸN–åöA±\\\\PİnçmiEJ»z’\rögryÁ[ĞÆMI6R*mÑ¦¥&ô„£(d²Fªr.Í9wæéÇXF¤M•^ËÙ³\ZM·\\\'²Î>·6š:Wd„M¬À´ùôÇ^QÇ¹K‡j;´¤À‡¬×öÙóéğì´é2:g£%3N°2úï Óf¿EûŒ%PòFuO\\0ªJ!Kÿ8J7?†lÿŠ]×oÄmóM ‚m†ÀÌ}w|A¦÷UñĞz^<ÑLê‡rbZßÖ&¸×‹351NÓ&AFÜÆ¼_J#Ãâ-\\\"6¿—v×6ˆ2bpÃÄ	Lé÷Ï@©C:ÔÓ§v{­ñş%=¤•’Ì“/ ]ë-B)ßCòÓæ€ï`ÀñÁªŞÉğ.%Ÿ±@´sµ³Ó\\\"¡#RGTâjDŞ à´,L Xré8½Vå.äË,¾ª³áÌXL»‰)ˆÉ0²×éO—–ù6áÈÈÉ®Fˆn§q<¹¥3æøaŸk”:ßuÍ®ÇÚUç	gŠ…IûCNV!øƒÄq,n6X?uq+€ˆRÑòÏ(“‡‘×™S“²îO±!øòë?×”u(œ°–7ìËØš=Îœäş,Ôª8ˆŒI«³zÒ‚X4ŠeÔOÒğî›}ÇwP?mï‡Åµù÷[	¹6•Ój-™â¼ V×ş‚Ì­œk³n=fşS=\\0`¶p\Z[f¬{xúıÄQİüHíaçº Vä>õü6Î2• >	Ì†–¢ ÊÚ\\\'ß§Ûù²¡xïb”qtOADv‹ÔÎ–iTƒjlâ–EÙ·ÄğY&BÛT~n&b‡\nö\\\\ZJ€„mG)àx2\n+;¹sß„›­†~T¥ÀÛYÿ„?‡\\\\$¯»íş²Šöïà¦Mfú\\\\§Ô­tÏºG½ pâ5{;ºß¸@Õ¨°¡LEhbï•T~\\\\¡HJˆ°=ˆìŸYRóØ—lNªf7EÈ#úàK`6í­AÙ†Ç5è¦OEÅqmq¥Xs½ÊÃºeT\rÆY_Uâ`ëq«Î<PpbrˆJ@ØÉh;†ö)\r˜¨KÌRˆŞf•aÔ™_0qÙÔ=jÅˆ«o§Ğ‹9-æ§\\0¤à‰ç×=¼2FTäXW®ğy—Ö•µ;D0Vù– ¶õTk~Z:h Ş3×ˆvq÷fnÒ™@âlc5P>h½[_³aAÄå»ÊC¨®¿-‹Ğÿli¶¢–ÌSš].€tğr¯Ìóú®º|¤`¼*|vëU HÚ$„¯j6€Y\Z·%ös´K§8ô‹Ã§öSrc;ó‘Ù½ıT>‚·ùÕˆbÚxì>)Ù>*PGOşô’şZ¸É3ñ÷s5ÀR‰İ%‰ö9åŠ¸oØ¬AK¿k>‘¨ã8Ì(Íù×\r<ñÅˆ±7tvÂ¹;#:eWÖVé<÷Œj)vğ¿>|.1aD‹Á©iF|>¤}â(Òœ©²ít\nïr²S5tÁc•Üš¢¢ß2§Å‹Uà£]ûäB¤ä#Cy—›\\0\rƒt4ƒ6!”ä¿)ÀzO¥’ËÑdP@K°Wù[ÆsêqÜ;„êÿhUu{½¼l\ZŞHê«Fß\nq³éVßU’@è`ß(ù™insÖ•°z{°ÉôéÜ\\\'ÙË¥–½È!#ï8Œˆ³Éô\Zn2*W©òÙ·°OÛ}›ùoÖ„<A½ö…ãO°—‘ıJÿ(‘—S–ØP3¢ºğıÈòòÖEYİ¦ä;7*³ìÑs‚’¶ïvs•J¿wS«ÛôWî÷/›³kp —<é`ôH¸á%ÖS¢İå2ÜïâUiÃT€Û1ˆd«qÊPŒPgô‡a=ŸK1/-ùK¼œÈ:Ù¼oÈğX	ç[ƒ›Â`›š…[„/ZÒÛL²ô…Wçö”NjxÚD6–µ3@~\ZJÕi)pL˜{,üXÂ´tÎq. ³j:ç¼e9+,)BWh‚\r–›Ê<^\\\"Ê_)Ü‘ñ¨FìoÈh¯ã!õŞi«´Èó:—Ğ:\\0¬öK\\\"šèYÂ¿É	ĞŸ!m*§äÜ\n9õ¿]É5V\\\"¦dÂn@Å÷ç¸2¦¥ç“t\\\"Ó\\\")“ùktqÌ<î>¾Zá³]Š$m‰M±fĞHAÌ*kİ-ëóİì<´áEñÙÌÇÜ{^`.Q›âÏIDÇy·}Û6ˆĞí–Òµ7<#jÃ¤u¥P¾†µ•ø\ZûgÓs\r_\\0Z]+5oFF_·}W¿¦ïŞ¸ÿúYSh°cêJP(oËÁğ„E¨UÌ‚á%. n‰Ñ[±\\\'T÷/§Ôöh[\\\'ZÁK˜!>ˆš¦oPT(^Óä¬€m¥ã­˜Í\\0nØP#äX!L›’û–/OÊ¦Şíp®\\\'‘±•tJ¿€IOlÿXÊ›Õà(=Áœs*³¾xö*!5Ï9ü¸\rŞÖ®·Y\nÀó¦û1¶Eç‰o‡@¶™Ü˜NJT‰‘7ı‘Dì‹’g|Hm?Ğ:\\0¼>‘–ôÛ7W–ˆ‰ñZXİ›×€SİôÓ GdÃkÖ®²cÀŞ¤•5	Ív#WÍû¸~§I)Ä3Y¼ƒS1¨$b|1fŒtÔğ}¸×0 :Æ Bä¾Ót‡1’¦ßa±²<0D_+qoBRâk[“¯uFP®L r’Äv::ê¥ØY,–+HD†ïbw³ÚëeÅœ„¹=À€Î1Îà¾ùlL¼`~úlJÅD×\\0AB‹-è8â¹/ğ/S0Ñ‡íû8)6ÖÔW1°Œ,ƒ±;I’ª¦şX6æ¨×‘	×Ä˜º47-RbÅ¨²Zä\\\"—füEXŒô,r`‚±qô¶^k7-‹IÍÇG¸/>@êÆaIı%¦ˆçXàô\r}õ©2™ş‰¬)g‡+°80ÙjfA4út{³/ağ°Æó°­=\\\'©Lƒz´¸6®öõ¨ÊŞCuVÃôºP$Q,á’”œŞ—dcLßÆ³•Óñ/kúào}uïyÃ¾Şˆ2º¥*İÚ¹Aót<@\\\\‹úÌ[®PqIœCîhjïlş pbÃÈl4ˆö°Æ÷3±3¨ğG÷<RlñVe(Ó>2×­ã¬»æ§i7*ÎÛVoÍtÌè2üª¡BÇ–%Ñï×RÅŒ™KhĞĞØ:´>E\rLŸÖşûv\\\\[…§[\\\'½F\Z~ô¬ÙyM0b×™®-¤ä¦o0MŒœŸY]{§€üÛ0!YCIq¤©°o¥Ÿşnğû)İù\\\\˜‹BwXB;°äXIx¶z†%Q9Ùw_ÚH§4aÛ7tä°iséõ”€éêbÇ>è»UË]t?eŠıb_¥VMNÿ\rï•eÆqG»qjF…91uØ\\\\woO»lQ˜üü¸ ÒG43LZúøøãw{’qqlS>ì)—väíj¹^©)úT¢Z,ŸV1Íhm‹Ù‘ÿ¤híÖ~D»LòŞ”d4J5Ãüş¨Û}WLıïí§«(¤¤Ï5¿Âép_î·w[ö//ctyœÚcƒT¼‹~şE|Û’î‚F¼¼<¹„Õ\r%Áh>­ıSç•V!–k†—Lô¢ÀMÄÉ¤>+›\\0à›OÙ{GF»oz¨ØÕU@‰Mt¼~e1ˆİlë#™ÄƒÄ‘.¦ñÏìCweaHâ…¥·3IôÖG7†)G\r\nÍÒ÷Û¥~ESšã\\0â¡»Š©w•ÎÉwj= § ”~PñR»q/î»\\\\Üê®ÔÓªqÀ\\0I¿äi»`oı;šÁ½“ÒÅX)qí&P,\ZL<(ë]1÷ÎuÎôÙƒ›˜!İ\r\nendstream\r\nendobj\r\n1 0 obj\r\n<<\r\n/Filter /Standard\r\n/O (6EÓu;|’,\\\\(æfZ¤ó5?°4‹Sh“ã±Û\\\\\\\\W›)\r\n/U (£’%\\\\(…qÅË¸™”+8\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0)\r\n/P -1340\r\n/R 4\r\n/V 4\r\n/Length 128\r\n/CF<</StdCF<</Length 16/AuthEvent/DocOpen/CFM/AESV2>>>>\r\n/StrF/StdCF\r\n/StmF/StdCF\r\n>>\r\nendobj\r\n2 0 obj\r\n<<\r\n/Type /Catalog\r\n/Pages 4 0 R\r\n>>\r\nendobj\r\n3 0 obj\r\n<<\r\n/Type /Info\r\n/Producer (×ÍFÑ §ÒG°ÆHN½é¶VCŠ|C‡@Wò6EÿNÌmzœ»àôvxÁl<õGj\\\\nºùÓ<î|.H`çÍ)\r\n>>\r\nendobj\r\n4 0 obj\r\n<<\r\n/Type /Pages\r\n/Kids [\r\n6 0 R\r\n12 0 R\r\n]\r\n/Count 2\r\n>>\r\nendobj\r\n5 0 obj\r\n<<\r\n/ProcSet [ /PDF /Text ]\r\n/Font << \r\n/F1 8 0 R\r\n/F2 10 0 R\r\n/F3 11 0 R\r\n>>\r\n/XObject << \r\n/fx0 9 0 R\r\n/fx1 14 0 R\r\n>>\r\n>>\r\nendobj\r\n6 0 obj\r\n<<\r\n/Type /Page\r\n/Parent 4 0 R\r\n/Resources 5 0 R\r\n/Contents 7 0 R\r\n/MediaBox[ 0 0 612.0 792.0 ]\r\n/CropBox[ 0 0 612.0 792.0 ]\r\n/Rotate 0\r\n>>\r\nendobj\r\n8 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Helvetica\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n10 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Helvetica-Bold\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n11 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Times-Bold\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n12 0 obj\r\n<<\r\n/Type /Page\r\n/Parent 4 0 R\r\n/Resources 5 0 R\r\n/Contents 13 0 R\r\n/MediaBox[ 0 0 612.0 792.0 ]\r\n/CropBox[ 0 0 612.0 792.0 ]\r\n/Rotate 0\r\n>>\r\nendobj\r\n15 0 obj\r\n[ 12 0 R /XYZ 317.4 135.271 null ]\r\nendobj\r\n16 0 obj\r\n[ 12 0 R /XYZ 317.4 135.271 null ]\r\nendobj\r\nxref\r\n0 17\r\n0000000000 65535 f\r\n0000009804 00000 n\r\n0000010047 00000 n\r\n0000010102 00000 n\r\n0000010219 00000 n\r\n0000010295 00000 n\r\n0000010438 00000 n\r\n0000000010 00000 n\r\n0000010596 00000 n\r\n0000005001 00000 n\r\n0000010701 00000 n\r\n0000010812 00000 n\r\n0000010919 00000 n\r\n0000005564 00000 n\r\n0000005282 00000 n\r\n0000011079 00000 n\r\n0000011133 00000 n\r\ntrailer\r\n<<\r\n/Size 17\r\n/Root 2 0 R\r\n/Info 3 0 R\r\n/Encrypt 1 0 R\r\n/ID [<7dcf5b8729edb00dd2105ce9460df375><7dcf5b8729edb00dd2105ce9460df375>]\r\n>>\r\nstartxref\r\n11187\r\n%%EOF\r\n','2015-04-30 17:02:15','admin'),(104,'A third resume to test main page','100','Plan Of Study.pdf',NULL,'%PDF-1.6\r\n7 0 obj\r\n<< /Length 4912 /Filter /FlateDecode >>\r\nstream\r\n ğH\n|ÉàÂà­è¤]q\\\\c°®œ»ˆIãºAªén÷^öŠoL]yš7…i²º+Ñ\nŞLï\\\"Ú]°`º~˜çÊMzÅ^Îü>àû±‚Í\\\'ùhöWV,j(.J/Ë1¨”,ğS§òÿ#ã|›ºØŸ±fQ`KŠ>\\\'!œnnÂ­j-åÛJ…*¬Šú£Æî+«A\\\\1ÁZšIXsÙGæ‰–©e\n†tOĞıUÙ®é¯î\\\'øùì“Ş‹ôJìT’Â²×æÒÛ†ºeOº‹k*¨îæ‡È3½‹7+ñŒ\\\"WÉBdz”ÚÁ;çİZÈ€\\0Ü‹Á!V%‚¶ÈùÊÎéX~í¾8pÆ¥°¼Ì¾/Ëv[óÃXõoU2Ã5š‰‡kSaZHú<o Ø]Õ=+´!xKídÏùÌk¼13p=ğOaòsÒ^o\\\'  r¿ûıƒDğ0Çùº	®7Œ|ÉÒ¿ç6Ì õ$(#\r —z”ªÜ/OŠôÌj†Gş¼p¸ÔâS„è*Ÿ¹F m(ÔâÇIÊ#ó–Õp˜;½fŞÎÛ7WHkú7Ñµ‰•å¬˜Üø5Fpè²º›º®HváâÖ0¿„hBQ§äğ«Òz·ÈÅCïı|Ml_D–~”/òÒŒEï¾ÿ…i\Zï­ ^kİÖ«Úév˜š3#4«w[£ÑÕn”V3$atÍvoQl»ÊÕ(TÌ\\\\¿ÓYÊRØ·q]ÄÔÍo+&ª~^•L.?|}Ÿ1èÈIêêk´Ó\rú(Æ¹9ËÂ­¼§Ÿ‹D¥;¾İ¸Tºyó›Ufë]:eãt´y\\\'¤ò}LÏá\\\'„*ªG‘>#š+^=n\\0t»/PŒÊísÿP–u†i[S˜èIÁìp‡º‹°İue\ZÆ(¬WÎÆFI%ìVí¨\nƒ-Ø@J—GÓÇ]Q=<KİšLÄ.Ú”ù£xÇ\r¨fº”¿½ìsù:Ê+—<´›˜Hlİ~oåœòLğ+0œ¨1<H4µÎ7Á¼1\r9®ÑDdÛ34‘Q)yvfÀQDõêÁ•ZşìÌ@Oç–æ]ƒıÜá˜j“\\0¡ar’c(mso\\\'pÍo:W¦:<ßC\nìdˆTŞWAR QÁà0—¾Ã« Pƒ¨9Îò»dboŸX¬i‹=ïz¶=®4Ó.T:tÀáÃWrOV€øÙïE˜Úd™Lò»cÅ)@ÖÇ\\\'|ŠÔ¶9AÈŸWŸœçUƒ$¬’ÚPö„0Z²O#ó[‚U©\r¶\Z=¤™›ch0j½ãËĞJà(\\\\/?&rØ“¥ Yêhàc¡Éømd·ÀE€1ÖÔLûµşîù­fíÇµày\n\\\\ÀÙ!9ŸŒ~’nhJ”0ß°Ô&·i^Š˜õ«ºŞ`¶QY/lfv¨èBç2iÜD†K³L†ÏGícDa{Q…lP¢êZX®¼m£†•š2üÅxé)w³ÏÊ¯bóÍŸi††cQ¤Î€ıÑ8“^Euæô «µ½©<ÉÔ_fúƒxXú:çoîy8¿»²ò.É¸84WØ=Hß\\0®j!DñŸS«ñçÆ§ñöiHwG\\\\zo·º©ü~ŒÄô§©ÑÜ¯t=s²<euÛ—1Ã’V 54~Ûê°g‡É•”SC‹Kµdù9\\\"¸Æ_Öû½å$÷-H@ì©¨g\nÄ‘i†Şy¸º´âo‡˜ƒ²ï¤\n×ÂÑ¹Ä™°OÌ¸J.’b+Ö:ìl<)\Z0Oö; °úäFÅMMå…¼¨	aR0EM½°§(Ò©|È %Ïòàxœ¬µ¦‡áûÁj=o×Z¢Ë™è%sá®eÜF‰xGùİ\\\\/W^ºh¾§ù˜ÅÉ/Q‰=H-;¼†?İR?E{_ú=²š×¿Ë+g‰ì~J$GÉÒ×^ñ=zÖtÇ1’˜Üó‡ŠôŸ†.1âKíjˆqmtzœ_µ%Sñ.Š(ŸsâÖgó¿lhç0iu3…˜0c¹ú4XÃ‹yI\\\"‘•Ù›§ó;‰®Ÿ?O\\\\p“\\\"I3.å8\\0„ˆ¸yöGû¶Tíå²ƒ•H8QRÓrö‡18V¨‡§õQáB*-g…Xú6¥ÊRÎ-r8şŸß>¦ƒ4¦üûšÕâ@ûò$æR´Áy>@S<û\\\"\rTûà¬QK¡\\\"CßçòLOáğ¿Ÿû£É…#ªt/äWM_Şòf¤æ\rè…²®ÖgÜ¯6nP†á^œ³†Îèéy«À%2‚ËSıEJÃ.Í1æŞ]‘¹—“¨ÖŸ„­`Ùbâ8Y\\\'ÔœyQ¡ãw®\\0[n»«ÔèçºˆÀ›!„!2*iW]±Uúµ!”ÄëíãuL,†ÿrÚâfİ©Àšö4†ˆày÷õ\\\"æv»E<“Ï/)ù[Oœ|şjBYÕÕ[…¾ŠÇêèèâ×iÆãYõ$ÿš‚QNFpii\\\'º5\re4Écß1Š¢Ø²o>·ÅMiÖòÈv¢›î,)Œq[Vi\ru	ƒÏg<”eu©ïs=Ïô0–õ26S¯¬ô\\\'\\\"êªš´Ú§ú7BKå>Õl7zäDÁP[Ë½aSB¸Œ67É§ç@‡ŒË@‡:\\0ê±q/s¾İT…©İ¬k•ÁÉ-|¡ªVˆØI\Z`û0ºĞ/{‚È¡ÏQ×õoöCĞÈŒg.ÊĞÔˆ©j\\0,6|Û~F*u\\\'Õ÷‚¨WïBÁ^pÊÿ¦â˜Åß#wœì™RÈ\r¾ï‰m•â{ä{ã?è|:8(w¼øã‡2RÉ®¾¶-Î$µPrÒzppÁgId!ìDÂ83:h@¸2ØşİÎÄŒbvİ5~ùÜ ¯ûø·Ê÷ñBÓu=‘B#¾É ÈàOàH/ioEõıšŸqŞEÍüS	ã³€ãğü)Ğµà“Ñl¼Ê¹´¿~Ÿ½¸:$[À\\\\-½Æ˜Í¼0–µ6	¿N­…Â„î‹ÌWh¥¤+£­;@òÔ\\\"ÜI³»É”jÌ=4­ƒİR×úItV¼}Ä\n’ÛŒÏ0¦¨§U%¥œ;‡êÄ¾Ô*×«\\\"y’Â¶ØÂeW~KùÀJ˜…İ÷é9¤u¦|ÌGöö6©¶u”éî¥ZdôÙÔ$nm<%­ov«ş³»n¨ïûÎmØï§Jémæò“µ›½ÛáíORJSEüØk}Ç÷¸[æ-ºÚ7ªÜˆa­àtÁuÕK4.ÚTöƒjï»IµÀå„ ·lÊC>©	|âÊñòâÑ<B\\\\8÷usU•è<–BCÔõ¦¹7`i»Y¤×¯M2N.üÄë?6åCÈ•mB…ÀIJÅ+óÌ1á\\\\”»Odw\\\\ŠhÒ¥0áÆujseKÂø†J¼9lwxÃgí\\\\#.R8œÔ0Ik³*6U¸c9´	(Y5®ğ³šÍóÃ#3rMŒ‡3ûRVWE>|@\r€Ä.^$Ô›Ó‹ „!¾æ\\\"/OÈzıùšçB³]$Ÿ¶åU	s¨áq¾®“FÚú(ÎReş\\\'j?+HHÇŒ­¯!Ævş)·Pé,„}£õq	Ğ–!€Òš£«ÛfÆ›ˆ¹f;×)Äæïü•®®Ç¬weDa4ZÚyœQt´&Syvûä„Û¬ãä!íOg\\\\è¦h±Ë×ië†{UÜ¹xÎ\\\\·<×´í}ñP½İ´©68•ğĞSèœû\\\"L6’¼[vİ¬.7lTo7”dóc…‹ï!ÄYCñlxDĞ6·PG•¿àN^¢½ÚÕ´Ú³(yš†s9(Â¬*,ædÎó…rÃÀQ-?4GO“Ä# |[ô™¯\ZôPÁ– :ó°ò¬ŒRÖSÃjÊ¬Æõ‘½éË@¡tÄ9W÷“!zÏlœ`uû5˜úOï>÷ÌÓìÔ	\n(=æ1yF3)í¨Ö„F+íŞÛCƒR3Hƒeïu7DÌÍ+·îw§×ƒ@l¨Ó½œ(Iğ%˜NåĞ±8j}§‡9Zî	:Ä²2ªüÁÓÃKÆ%¡a÷¼†ë<îÑÖ†¿o¾™o€ŸĞákü%¬¬¡8Ó±|\nãz!Ûb$œ³Ê•„¿kÏ˜é@ê’±tƒm\\\'Ğƒõl‰ù`ÂÅ…\\0¡ßŸ)ş°İ›qis€´\r=/Ä¯Ô\\\"*KqS|E*\\\'ßû§K´Ù}ro¬.G]WßË„Jº—`uO»u2z&ª®6ê(ò1“’\rÜ\\\"AYã!OEª-à¿–±Ğ)f¾ËQ2#ù—%´ÚÃjÍ4ˆZ©É›–\r·!ò§Åiû‘mªÀå˜QßÎ¿¯ñkR_õnNhO°XÍŒñ§Y§]I¦½ÍI <Õp9`™Ønøæğ{¤…¬\r6¼ ¸·•™×VvH*¨>Ô»ìÌ,šºÓô\Z…OÄC 3u×r³e–\\0¹cIiAC şèåUÖ)ğA­Ñoü’KºfÉ„n³õGYÓ{|uñ=ß†§ÌÛA·ëL¦ù8÷¿®¦0ÎQˆ>mú‹<Ş± ¾vÁ9íífÇßŒöıœòÑ)¥i[sR¥góIËúğ®âÍ„hÙÏ\rF¸?VVDáÆ}­6g¶bmàFBºxZIŒÛñ¨†M`¸ËâQc>\n\\\"‰Íš<ÙR-Á0\\\"V;%¡²—è¾`0Ÿ/÷Ì©ğîD8êÍóˆD/+ &âV®édWÎ¶x™*ı	bÁ\\\\ÁÕ%º<7\rèe¶8ä`O-+VñâLÒ=M˜qø?²¯Ú@áÅ`ÏM3Ã;j¢N‘t¼ knÀ\\\\bC°X…†]òó¥¹‘úÃ‚ÀöÉ2Á¾¯lglW	PÂîgÄHŸµ³Š	ìÊ#t¨úËöÒ»alèÑoĞlê6ı ÿV-.ê¹8¾C.(`7û®Äöèûäü vY÷ŞúºşşÀ70Ö\\0ue¿° ”©Û3–PjKÌ‚¢z—O{iœ…8Èhcº+ÿÅteqDûÉ\n^…«J,c†C9Ş Í{áñwÇNÉ›Kl6iNwš4ŸÕ¶¦Y9Eİ-GE1r^Øï‰G\Z’;û;ö\nÜÉu2=¤öV‹/I/´tç2Ïş&Án,ÿm+ÌÛÔÌ·õ«d«mŞŸ”V#–8WØz?ênŸpö±Šöo›ÕÏq]­Uà ]2å\\\\¬k…`<½#ü¸fgEœRéLGØ£êøbàE-ÆÂà./\\\'\\0dG3s166,a[ÜX²ú¿*«àÜgÍ4½2¬4$Ñ}FWf`Êİè”eàÓgÁî\ré\n	ßƒN}ôhÙî]F¾ywRÇKşöÛ©ó} *‰85üÕº›yñx`…¨µ\nİºR—²oÉVîYûHÕ¶xI¶íâÓğŒ4^¦óÁ“½»j•‚>L_³PäÀ½®‚YÒ|kg,h¶F³\\0ã. ²j!ÚÄq,KM[U~Í\n.ÎTÒ²M¤™<6¼dCPÚ\Zşò\\\"œÊäËÇ\\\"»ÒDPÆ·”!ß·#+ıkÙòQÔğšX¹iœÆ°“rTA+óq€ÂÉİ—Ä!1ÿğVDÒ&¢hÓ»“âõ¸u½^|/ÉÆ‘°œ}\\\"åUuRÉè•_Š‰Ce¤Wbéu\\\'1ºßÑM@\räìt¹¬ÛM ¯Âl”ñæVI£¶ô8‚4¢Rå¹”¼éPdº¢‹às”0Ãw4¨Ø!) f‡ew@#0îÑ«†\\\'t>±`9Ök·¢?\nO±ŒfÏFf`¢0gîOUcë„ıj¼uã>…Ì+—-xEÔ\nP$†-€zàÙg)fÂÖuIyåTê¼ÉJAîk³Ê½l<•N^yÊ’•¯³%òÌÿÇ®íú\rÇX’â9ßôqÁ˜D*dÛh&÷«Tt°µVo%_ck,Ü[˜@ÉÕ^”`(q·Ÿ•Ö×´zÙ)1b4¸$ı>œŸ\\\'&§-¹ş+jòaø¹I¢¥ù9•r~ĞAªö³dlZî4GQJ:€\\\'HZUj<Ñ`@Ë¯úwÛ‹ô¸E«b¡ˆvPŸ#1¯\\0JÚ:ŞIzì±MR¯ñÛØãì~\\0€Eª*F¤î‹_»k1ˆÈædª¶À©ñ…\\\\À¤èèw·©ôÒ	÷˜¯.8Œ]w>éº~ B£ :äÚõ8Àõw„ìz«dä·¢$oKıû\\\\ĞÂÂèÖ™ ÿÆTúˆZQ=zBLúí_±³jJ\n°\Z$(¤¦õdAî¶,\r’I—x³¾¦Ìi0(§°\\\'cê7ow=O¢À„ØVA+O$hyˆû|6G~Ğ¢>j;F‰ØÃÊ»‹ı_r¿Ş\rqQ¡¿Ò™ÿ{>¥N¯yğN™SÙ\r~x˜zŸÖ/¨ä4à=½Ãu™\Zœ¿ZMÏÖEM>4˜ƒÓq´\r\nendstream\r\nendobj\r\n9 0 obj\r\n<</Type/XObject/Subtype/Form/FormType 1/BBox[0 0 612.0 792.0] /Length 144 /Filter /FlateDecode >>\r\nstream\r\n¯î6U“òşşÁWÜŒöœX\\0²RhM|ôæB5p‹\\\"«yãBl‡ÁÃbòğ$Áåe¹›\nŠ‰gŒƒ”|¿ö/ï;Íó2ä‰r‹Aÿ/Š0äSÓdğælE¾*©Ô& •T[´÷siÀÂ~‰1¨¦`†ÖÔ˜½ÄGÖà·¬tâæ´-·ô­·“­İ4&îq…\\\\\\\\\r\nendstream\r\nendobj\r\n14 0 obj\r\n<</Type/XObject/Subtype/Form/FormType 1/BBox[0 0 612.0 792.0] /Length 144 /Filter /FlateDecode >>\r\nstream\r\n7TòÊC\\\"SèmfT<¹ABeõpÖ~¬DGÕu:#ˆ\\0ø­g\\0â*Øj‡dĞ5ÉC(¨Uç„+¼®ü¤ºßQ¨6	È\n`La\\\"Ş\nãD´DíàÛÉ<w‰h=X½îãèWˆsu9óê*Ùk:U>3.y†ˆ’×sFC ®`åä\r\nendstream\r\nendobj\r\n13 0 obj\r\n<< /Length 4160 /Filter /FlateDecode >>\r\nstream\r\nÏë–¼Éû¢[¹NBŒ…üZ(Éä?uÖÆ3mÓª‰¹¡hìbwÜ;Sve¤âiøšç±z˜Ãù‹¬ÛIËONe—‹ƒß:p¥¥€T˜øë d	öo<‡G9»Ñ¾OxEærÒ§`¥eÓ½ÖŒ0\Zß²Ã€9lv-+cÆ	rhô5eî|…>Ç{<º–Éín v‚Rã#+P#¯fk GÕT¯†ş~xàË‹Ù¿sL°´±[4h¯Z`€küä¼Å9Ìµ.KÅXVÜ{û½V<*Ä\\\"]¶Ä‰|:ˆ¯:éâVi\\0;†*±Ÿ>¯~ÛGÔ\\\\Òèø\Z0Q†ïıæ¼}óõ7t?Îr»gÇš¶»OÁ< •şÂìgAlºœº„pÊ#\n˜8çPûïÀm_e—\nê_x!q:×\nKè«@\n¥UæŠ}@X¿Qı¼–9pQÅÏ©ŞıõÀø\nÆÆ˜ˆmv4J¾ÒÌ²¸]—ı0;ºô®¤oÁŞ†]ÒZNÖÇ•¬Ÿğz>í,‚LÃó¸Î’÷>:yv‹ƒHÈ„“Œµ%Ò%¼_\\\'ÁÂ\\\\\n\\\'ÜĞµgµ¨[”½šßK¢IÖNïî‹%_¯…áf%âô›ñ‘ŠªYW†Œ²Ò*tAÅ(K85ûšCèÃ®=®á1¡C,Ç%[‹˜è\Z®ŒQµEÌÕªê¤.ëvsªrë¥8‰$¥ğ¢nÇ:ÜÌàpVg\rø	íŸf/\\0»Àl#w;=²†¡ïd]š!@:wó\\\\ªAYHğ?l\\\"í­®Õ€Í-ùì±´&\\\'x°Ä³ “ğ¥UNı¥½à›u}e\rHl(“Ü±\\\"IÏ¦4ŒNÖä¢8ê,Ñ¤4ê.èaö]’ Ì2(»ˆ\\03]·´§‘dÒgğå9¿Î Å„Ğ âíı§µ%‚û¤œğÊÆãkD«‚ÑÅ”bä„¨OÉ©è-x`Ãm¹(¤ãÅ1Våyˆ]0|*ã“\n7Bó¢dmzÊ$Zfµ\Z¥#H—hİõ”U\rƒ¬¡¦Ì\\\"„NiŸ¡Í±Ó CUÏb¯R¹mŸËDHG°¯ZÕE¶(\Zj‡İñğ›¯Ü=ö‡.yãÉê°äÅ©]ºÔøãO8MbÃ@…—ï\rØŞoš^\\\\<öB€5sp¿:»ğ&ª—;ñx˜uM²qêc_ì§ÁİîNN÷oÙ£×©0\r}Áyïëd­¹vşµâ`Yh‰æïgœÓ[~ú”	Æ\nTíS&œo­S{ñÖ?”B‘ë±YeİuS2úğŸäEûHu·1ö¡l êdà×Œ× oí7V\Z¯=Ïº»ÓËKİô’5éœ‰ËÇ¶¹<¡Ê´AgéÊÌt„;}§`ŞHQ]Pˆ˜\\\'-“;¾Ù. ©ïÛˆ)f5 ôî¿È´À6«\\\"‰Ïş7Q¢o¢ì0ÿÌ/­eìÁ_Ô|B~˜_¤²Uc¯†ŸÉ\r}ˆ>O–y¶“œŠxã!ÑèäT¦|$cco+lÀÂ‡=”w8ú\\\'™=)ü­Š¦Éc˜÷3áÛ:P5óuYuö¹öùS½Û›Ù¿Õ–Îyæ\\0Du\\\'ó`Òv¥€wƒ^H”±ÃJ ”‰¸µ@™VuØ˜ÁF¡xHE7ô‘÷1b³R80øÙ\Z£ \ZŸN–åöA±\\\\PİnçmiEJ»z’\rögryÁ[ĞÆMI6R*mÑ¦¥&ô„£(d²Fªr.Í9wæéÇXF¤M•^ËÙ³\ZM·\\\'²Î>·6š:Wd„M¬À´ùôÇ^QÇ¹K‡j;´¤À‡¬×öÙóéğì´é2:g£%3N°2úï Óf¿EûŒ%PòFuO\\0ªJ!Kÿ8J7?†lÿŠ]×oÄmóM ‚m†ÀÌ}w|A¦÷UñĞz^<ÑLê‡rbZßÖ&¸×‹351NÓ&AFÜÆ¼_J#Ãâ-\\\"6¿—v×6ˆ2bpÃÄ	Lé÷Ï@©C:ÔÓ§v{­ñş%=¤•’Ì“/ ]ë-B)ßCòÓæ€ï`ÀñÁªŞÉğ.%Ÿ±@´sµ³Ó\\\"¡#RGTâjDŞ à´,L Xré8½Vå.äË,¾ª³áÌXL»‰)ˆÉ0²×éO—–ù6áÈÈÉ®Fˆn§q<¹¥3æøaŸk”:ßuÍ®ÇÚUç	gŠ…IûCNV!øƒÄq,n6X?uq+€ˆRÑòÏ(“‡‘×™S“²îO±!øòë?×”u(œ°–7ìËØš=Îœäş,Ôª8ˆŒI«³zÒ‚X4ŠeÔOÒğî›}ÇwP?mï‡Åµù÷[	¹6•Ój-™â¼ V×ş‚Ì­œk³n=fşS=\\0`¶p\Z[f¬{xúıÄQİüHíaçº Vä>õü6Î2• >	Ì†–¢ ÊÚ\\\'ß§Ûù²¡xïb”qtOADv‹ÔÎ–iTƒjlâ–EÙ·ÄğY&BÛT~n&b‡\nö\\\\ZJ€„mG)àx2\n+;¹sß„›­†~T¥ÀÛYÿ„?‡\\\\$¯»íş²Šöïà¦Mfú\\\\§Ô­tÏºG½ pâ5{;ºß¸@Õ¨°¡LEhbï•T~\\\\¡HJˆ°=ˆìŸYRóØ—lNªf7EÈ#úàK`6í­AÙ†Ç5è¦OEÅqmq¥Xs½ÊÃºeT\rÆY_Uâ`ëq«Î<PpbrˆJ@ØÉh;†ö)\r˜¨KÌRˆŞf•aÔ™_0qÙÔ=jÅˆ«o§Ğ‹9-æ§\\0¤à‰ç×=¼2FTäXW®ğy—Ö•µ;D0Vù– ¶õTk~Z:h Ş3×ˆvq÷fnÒ™@âlc5P>h½[_³aAÄå»ÊC¨®¿-‹Ğÿli¶¢–ÌSš].€tğr¯Ìóú®º|¤`¼*|vëU HÚ$„¯j6€Y\Z·%ös´K§8ô‹Ã§öSrc;ó‘Ù½ıT>‚·ùÕˆbÚxì>)Ù>*PGOşô’şZ¸É3ñ÷s5ÀR‰İ%‰ö9åŠ¸oØ¬AK¿k>‘¨ã8Ì(Íù×\r<ñÅˆ±7tvÂ¹;#:eWÖVé<÷Œj)vğ¿>|.1aD‹Á©iF|>¤}â(Òœ©²ít\nïr²S5tÁc•Üš¢¢ß2§Å‹Uà£]ûäB¤ä#Cy—›\\0\rƒt4ƒ6!”ä¿)ÀzO¥’ËÑdP@K°Wù[ÆsêqÜ;„êÿhUu{½¼l\ZŞHê«Fß\nq³éVßU’@è`ß(ù™insÖ•°z{°ÉôéÜ\\\'ÙË¥–½È!#ï8Œˆ³Éô\Zn2*W©òÙ·°OÛ}›ùoÖ„<A½ö…ãO°—‘ıJÿ(‘—S–ØP3¢ºğıÈòòÖEYİ¦ä;7*³ìÑs‚’¶ïvs•J¿wS«ÛôWî÷/›³kp —<é`ôH¸á%ÖS¢İå2ÜïâUiÃT€Û1ˆd«qÊPŒPgô‡a=ŸK1/-ùK¼œÈ:Ù¼oÈğX	ç[ƒ›Â`›š…[„/ZÒÛL²ô…Wçö”NjxÚD6–µ3@~\ZJÕi)pL˜{,üXÂ´tÎq. ³j:ç¼e9+,)BWh‚\r–›Ê<^\\\"Ê_)Ü‘ñ¨FìoÈh¯ã!õŞi«´Èó:—Ğ:\\0¬öK\\\"šèYÂ¿É	ĞŸ!m*§äÜ\n9õ¿]É5V\\\"¦dÂn@Å÷ç¸2¦¥ç“t\\\"Ó\\\")“ùktqÌ<î>¾Zá³]Š$m‰M±fĞHAÌ*kİ-ëóİì<´áEñÙÌÇÜ{^`.Q›âÏIDÇy·}Û6ˆĞí–Òµ7<#jÃ¤u¥P¾†µ•ø\ZûgÓs\r_\\0Z]+5oFF_·}W¿¦ïŞ¸ÿúYSh°cêJP(oËÁğ„E¨UÌ‚á%. n‰Ñ[±\\\'T÷/§Ôöh[\\\'ZÁK˜!>ˆš¦oPT(^Óä¬€m¥ã­˜Í\\0nØP#äX!L›’û–/OÊ¦Şíp®\\\'‘±•tJ¿€IOlÿXÊ›Õà(=Áœs*³¾xö*!5Ï9ü¸\rŞÖ®·Y\nÀó¦û1¶Eç‰o‡@¶™Ü˜NJT‰‘7ı‘Dì‹’g|Hm?Ğ:\\0¼>‘–ôÛ7W–ˆ‰ñZXİ›×€SİôÓ GdÃkÖ®²cÀŞ¤•5	Ív#WÍû¸~§I)Ä3Y¼ƒS1¨$b|1fŒtÔğ}¸×0 :Æ Bä¾Ót‡1’¦ßa±²<0D_+qoBRâk[“¯uFP®L r’Äv::ê¥ØY,–+HD†ïbw³ÚëeÅœ„¹=À€Î1Îà¾ùlL¼`~úlJÅD×\\0AB‹-è8â¹/ğ/S0Ñ‡íû8)6ÖÔW1°Œ,ƒ±;I’ª¦şX6æ¨×‘	×Ä˜º47-RbÅ¨²Zä\\\"—füEXŒô,r`‚±qô¶^k7-‹IÍÇG¸/>@êÆaIı%¦ˆçXàô\r}õ©2™ş‰¬)g‡+°80ÙjfA4út{³/ağ°Æó°­=\\\'©Lƒz´¸6®öõ¨ÊŞCuVÃôºP$Q,á’”œŞ—dcLßÆ³•Óñ/kúào}uïyÃ¾Şˆ2º¥*İÚ¹Aót<@\\\\‹úÌ[®PqIœCîhjïlş pbÃÈl4ˆö°Æ÷3±3¨ğG÷<RlñVe(Ó>2×­ã¬»æ§i7*ÎÛVoÍtÌè2üª¡BÇ–%Ñï×RÅŒ™KhĞĞØ:´>E\rLŸÖşûv\\\\[…§[\\\'½F\Z~ô¬ÙyM0b×™®-¤ä¦o0MŒœŸY]{§€üÛ0!YCIq¤©°o¥Ÿşnğû)İù\\\\˜‹BwXB;°äXIx¶z†%Q9Ùw_ÚH§4aÛ7tä°iséõ”€éêbÇ>è»UË]t?eŠıb_¥VMNÿ\rï•eÆqG»qjF…91uØ\\\\woO»lQ˜üü¸ ÒG43LZúøøãw{’qqlS>ì)—väíj¹^©)úT¢Z,ŸV1Íhm‹Ù‘ÿ¤híÖ~D»LòŞ”d4J5Ãüş¨Û}WLıïí§«(¤¤Ï5¿Âép_î·w[ö//ctyœÚcƒT¼‹~şE|Û’î‚F¼¼<¹„Õ\r%Áh>­ıSç•V!–k†—Lô¢ÀMÄÉ¤>+›\\0à›OÙ{GF»oz¨ØÕU@‰Mt¼~e1ˆİlë#™ÄƒÄ‘.¦ñÏìCweaHâ…¥·3IôÖG7†)G\r\nÍÒ÷Û¥~ESšã\\0â¡»Š©w•ÎÉwj= § ”~PñR»q/î»\\\\Üê®ÔÓªqÀ\\0I¿äi»`oı;šÁ½“ÒÅX)qí&P,\ZL<(ë]1÷ÎuÎôÙƒ›˜!İ\r\nendstream\r\nendobj\r\n1 0 obj\r\n<<\r\n/Filter /Standard\r\n/O (6EÓu;|’,\\\\(æfZ¤ó5?°4‹Sh“ã±Û\\\\\\\\W›)\r\n/U (£’%\\\\(…qÅË¸™”+8\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0)\r\n/P -1340\r\n/R 4\r\n/V 4\r\n/Length 128\r\n/CF<</StdCF<</Length 16/AuthEvent/DocOpen/CFM/AESV2>>>>\r\n/StrF/StdCF\r\n/StmF/StdCF\r\n>>\r\nendobj\r\n2 0 obj\r\n<<\r\n/Type /Catalog\r\n/Pages 4 0 R\r\n>>\r\nendobj\r\n3 0 obj\r\n<<\r\n/Type /Info\r\n/Producer (×ÍFÑ §ÒG°ÆHN½é¶VCŠ|C‡@Wò6EÿNÌmzœ»àôvxÁl<õGj\\\\nºùÓ<î|.H`çÍ)\r\n>>\r\nendobj\r\n4 0 obj\r\n<<\r\n/Type /Pages\r\n/Kids [\r\n6 0 R\r\n12 0 R\r\n]\r\n/Count 2\r\n>>\r\nendobj\r\n5 0 obj\r\n<<\r\n/ProcSet [ /PDF /Text ]\r\n/Font << \r\n/F1 8 0 R\r\n/F2 10 0 R\r\n/F3 11 0 R\r\n>>\r\n/XObject << \r\n/fx0 9 0 R\r\n/fx1 14 0 R\r\n>>\r\n>>\r\nendobj\r\n6 0 obj\r\n<<\r\n/Type /Page\r\n/Parent 4 0 R\r\n/Resources 5 0 R\r\n/Contents 7 0 R\r\n/MediaBox[ 0 0 612.0 792.0 ]\r\n/CropBox[ 0 0 612.0 792.0 ]\r\n/Rotate 0\r\n>>\r\nendobj\r\n8 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Helvetica\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n10 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Helvetica-Bold\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n11 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Times-Bold\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n12 0 obj\r\n<<\r\n/Type /Page\r\n/Parent 4 0 R\r\n/Resources 5 0 R\r\n/Contents 13 0 R\r\n/MediaBox[ 0 0 612.0 792.0 ]\r\n/CropBox[ 0 0 612.0 792.0 ]\r\n/Rotate 0\r\n>>\r\nendobj\r\n15 0 obj\r\n[ 12 0 R /XYZ 317.4 135.271 null ]\r\nendobj\r\n16 0 obj\r\n[ 12 0 R /XYZ 317.4 135.271 null ]\r\nendobj\r\nxref\r\n0 17\r\n0000000000 65535 f\r\n0000009804 00000 n\r\n0000010047 00000 n\r\n0000010102 00000 n\r\n0000010219 00000 n\r\n0000010295 00000 n\r\n0000010438 00000 n\r\n0000000010 00000 n\r\n0000010596 00000 n\r\n0000005001 00000 n\r\n0000010701 00000 n\r\n0000010812 00000 n\r\n0000010919 00000 n\r\n0000005564 00000 n\r\n0000005282 00000 n\r\n0000011079 00000 n\r\n0000011133 00000 n\r\ntrailer\r\n<<\r\n/Size 17\r\n/Root 2 0 R\r\n/Info 3 0 R\r\n/Encrypt 1 0 R\r\n/ID [<7dcf5b8729edb00dd2105ce9460df375><7dcf5b8729edb00dd2105ce9460df375>]\r\n>>\r\nstartxref\r\n11187\r\n%%EOF\r\n','2015-04-30 17:03:37','admin');
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
INSERT INTO `resumelistedskills` VALUES (101,2),(103,25),(103,26),(103,27),(103,28),(103,29),(103,30),(104,4),(104,5),(104,6),(104,7),(104,8),(104,9),(104,28),(104,29),(104,30);
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
  `JobID` varchar(45) DEFAULT NULL,
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
INSERT INTO `seeker` VALUES ('admin',NULL),('ebaily',NULL),('Gorky',NULL),('qwer',NULL),('s',NULL);
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
INSERT INTO `user` VALUES ('a','pass','admin','dude','','street','city','ALABAMA','6279','admin@google.com','phone','fax','cell','homepage'),('admin','pass','adminFirstName','adminLastName','18 arbitrary drive','','New London','Connecticut','11009','admin@gmail.com','(860)123-4567',NULL,NULL,NULL),('anid','pass','fname','lname','addre','','city','Iowa','12345','asdasda@asda','123456789','','123456789',''),('another test user','pass','firstname','lastname','address','address','city','Connecticut','12345','abcdefg@hijklmnop.com','phonenumber','','phonenumber',''),('bfry','pass','Barbara','Fry','P.O. Box 92957','','Los Angeles','CALIFORNIA','90009','bfry@sra.com','','','',''),('bob','pass','Bob','Bob','a','N/A','a','MASSACHUSETTS','12122','abc@abc','N/A','N/A','N/A','wwww.test.com'),('dlewis','pass','Duane ','Lewis','123 Anywhere Street','','Atlanta','GEORGIA','30123','dlewis@ey.com','','','',''),('ebaily','pass','Eric','Bailey','2345 James Avenue','','Los Angeles','CALIFORNIA','90009','ebaily@needjob.com','','','',''),('Gorky','pass','Erming','Gao','10 fort','','Storrs','Connecticut','06250','erg@com','8607124430',NULL,NULL,NULL),('han','pass','han','hu','','','some place','Connecticut','12345','hanhan@gmail.com','123456789',NULL,NULL,NULL),('maarcus','pass','marcus','li','somwhere in ct','','storrs','Connecticut','06something','maarcus.li@uconn.edu','8603833756','non','8603833756','non'),('mar@gmail.com','pass','mar','mar','an address','','c','Kentucky','111111','mar@gmail.com','123456789','','',''),('marcus','pass','marcus','li','somwhere in ct','','storrs','Connecticut','06something','marcus.li@uconn.edu','8603833756','non','8603833756','non'),('marcusli','pass','Marcus','Li','','','West Hartford','Connecticut','06119','marcus.li@uconn.edu','8602325015',NULL,NULL,NULL),('marcuslis','pass','Marcus','Li','','','West Hartford','Connecticut','06119','marcus.li@uconn.edu','8602325015',NULL,NULL,NULL),('ncooper','poster03','Nathalie','Cooper','456 Nowhere Street','','Atlanta','GEORGIA','33219','ncooper@gatech.edu','8601','','',''),('p','p','the','poster','street','N/A','abc','FLORIDA','12','asds','N/A','N/A','N/A',''),('post','post','Mr','Poster','Addr','N/A','Cty','ARIZONA','01011','poster@poster.com','N/A','N/A','N/A','www.dsa.com'),('q','q','q','q','123456789','','storrs','Alabama','11111','q@q','123456789','','',''),('qwer','a','marcus','li','te','','tes','Alabama','123','h@q','test',NULL,NULL,NULL),('s','sdf','Test','li','street','','sdf','Connecticut','06269','anemail@gmail.com','none','123','none','google.com'),('sallen','seeker03','Susan','Allen','231 Tech Lane','','Atlanta','GEORGIA','33219','sallen@needjob.com','','','',''),('sdf','123','m','l','q','','q','Louisiana','1','qwe@qwe','q',NULL,NULL,NULL),('ssdffdfsdf','asd','asd','123','sdfsdf','','sfsdf','Indiana','123','w@uio','123asd','','','asd'),('tbrittan','seeker02','Tyrone','Brittan','3321 Old Peachtree Road','','Doraville','GEORGIA','30123','tbrittan@needjob.com','','','','');
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

-- Dump completed on 2015-04-30 15:21:28
