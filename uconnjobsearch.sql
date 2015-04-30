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
INSERT INTO `resume` VALUES (101,'x','100','qaq','adsaxwq',NULL,'2015-04-29 03:17:48','Gorky'),(102,'','','No File',NULL,NULL,'2015-04-30 04:12:51','admin'),(103,'get an A on this project','100','Plan Of Study.pdf',NULL,'%PDF-1.6\r\n7 0 obj\r\n<< /Length 4912 /Filter /FlateDecode >>\r\nstream\r\n��H\n|�������]q\\\\c�����I�A��n�^��oL]y�7�i��+ю\n�L�\\\"�]�`�~���Mz�^΍�>�����\\\'�h�WV,j(.J/�1��,�S����#�|��؟�fQ`K�>\\\'!�nn­j-��J�*������+�A\\\\1�Z�IXs�G扖�e\n�tO��Uٮ��\\\'�����ދ�J�T�²������eO��k*����3��7+�\\\"W�Bdz���;��ZȀ\\0܋�!�V%�������X~�8p�ƥ��̾/�v[��X�oU2�5���kSa�ZH�<o �]��=+�!xK�d���k�13p=�Oa�s�^o\\\'  r�����D�0���	�7�|�ҿ�6� �$(#\r ��z��܏/O����j�G��p�Ԏ�S���*��F m(����I�#��p�;��f���7WHk�7ѵ��嬘��5Fp貺���H�v���0��hBQ����z����C��|Ml_D�~�/�ҌE���i\Zכֿ ^k�֫��v��3#4�w[���n�V3$at�voQl���(T�\\\\��Y�Rطq]���o+&�~^�L.?|}�1��I��k��\r��(ƍ�9�­�����D�;�ݸT�y�Uf�]:e��t�y\\\'��}L��\\\'���*�G�>#�+^=n\\0t�/P���s�P�u�i[S��I��p�����ue\Z�(�W��FI%�V�\n�-�@J��G��]Q=<KݚL�.����x�\r��f�����s�:�+�<���Hl�~o��L�+0��1<H4��7��1\r9��Dd�34�Q)yvf�QD����Z���@O��]����j��\\0�ar�c(mso\\\'p͏�o�:W�:<�C\n�d�T�WAR�Q��0��ë�P��9��dbo�X�i�=�z�=�4�.T:t���WrOV����E��d�L�c�)@��\\\'|�Զ9AȟW���U�$���P��0Z�O#�[�U�\r�\Z=�����ch0j����J�(\\\\/?&rؓ��Y�h�c���md��E�1��L������f����y\n\\\\��!9��~�nhJ�0߰�&�i^�������`�QY/lfv��B�2i�D�K�L�ϏG�cDa{Q�lP���ZX��m����2���x�)w��ʯb�͟i���cQ�΀��8�^�Eu�������<��_f��xX�:��o�y8����.ɸ84�W�=H�\\0�j!D�S���Ƨ��iHwG\\\\zo����~������ܯt=s�<euۗ1ÒV�54~��g�ɕ�SC�K�d�9\\\"��_����$��-H@쩨g\nđi��y����o������\n��с�ę��O̸J.�b+�:�l<)\Z0O�;����F�MM兼�	aR0EM����(ҩ|� %���x��������j=o�Z�˙�%s�e�F�xG��\\\\/W^�h�������/Q�=H-;��?�R?E{_�=��׿�+g��~J$G���^�=z�t�1�������.1�K�j��qmtz�_�%S�.��(�s��g�lh��0iu3���0c��4XËyI\\\"��ٛ��;���?O\\\\p�\\\"I3.�8\\0���y�G��T����H8QR�r��18V����Q�B*-g�X�6��R�-r8���>��4������@��$�R��y>@S<�\\\"\rT���QK�\\\"C���L�O������#�t/�WM_��f��\r腲��gܯ6nP��^������y��%2��S�E�J�.�1��]�����֟��`�b�8Y\\\'���yQ��w�\\0[n�����纈��!�!2*iW]�U��!�����uL,���r���fݩ���4���y��\\\"�v�E<��/)�[O�|�jBYՎ�[���������i��Y�$���QNFpii\\\'�5\re4�c�1���زo>��Mi���v���,)�q[Vi\ru	��g<�eu��s=��0��26S���\\\'\\\"ꪚ�ڧ��7BK�>�l7z�D�P[˽aSB��67���@���@��:\\0��q/s��T��ݬk���-|��V��I\Z`�0��/{�ȡ�Q��o��C�Ȍg.��Ԉ�j\\0,6|�~F*u\\\'����W�B�^p������#w��R�\r���m��{�{�?�|:8(w���2Rɮ��-�$�Pr�zpp�gId!�D�83:h@�2����Čbv�5~�� �������B�u=��B#�� ��O�H/ioE����q�E��S	㳀���)е���l�ʁ���~���:$[�\\\\-���ͼ0��6	�N����Wh��+��;@��\\\"�I���Ɏ��j�=4���R��ItV�}�\n�ی�0���U%��;��ľ�*׫\\\"y�¶��eW~K��J�����9�u�|�G��6��u���Zd���$�nm<%�ov����n�����m��J�m�򓵛����O�RJSE��k}����[�-��7�܈a��t�u�K4.�T��j�I��� �l�C>�	|������<B\\\\8�usU��<�BC�����7`i�Y�ׯM2N.���?6�CȕmB��IJ��+��1�\\\\��Odw\\\\�hҥ0��ujseK���J�9lwx�g�\\\\#.R8��0Ik�*6U�c9�	(Y5������#3rM��3�RVWE>�|@\r��.^$ԛӋ �!��\\\"/O�z����B�]$���U	s��q���F��(�Re�\\\'j?+HHǌ��!�v�)�P�,�}��q	��!�Қ���fƛ��f;�)�������ǬweDa4Z�y�Qt�&Syv��۬��!�Og\\\\�h���i��{Uܹx�\\\\��<״�}�P�ݴ�68���S��\\\"L6��[vݬ.7lTo7�d�c���!�YC�lxD�6�PG���N^���մڳ(y��s9(¬*,�d��r��Q-?4GO��# |[���\Z�P���:���R�S�jʬ������@�t�9W��!z�l�`u�5��O�>�����	\n�(=�1yF3)���քF+���C�R3H�e�u7D��+���w�׃@l�ӽ�(I�%�N�б8j}��9Z�	:��2�����K�%�a����<��ֆ�o��o����k�%���8ӱ|\n�z!�b$��ʕ���kϘ�@꒱t�m\\\'Ѓ�l��`�ō�\\0�ߟ)��ݛqis��\r=/į�\\\"*KqS|E*\\\'���K��}�ro�.G]W���J��`uO�u2z&��6�(�1��\r�\\\"AY�!OE�-࿁���)f��Q2#��%���j�4�Z�ɛ�\r�!�򧐝�i��m���Q�ο��kR_�nNhO�X���Y�]I��͝I�<�p9`��n�����{���\r6� ������VvH*�>Ի��,����\Z�O�C 3u�r�e��\\0��cIiAC ����U�)�A��o��K�fɄn��GY�{|u�=߆���A��L��8����0�Q�>m��<ޱ �v�9��f�ߌ�����)�i[sR�g�I������h��\rF�?VVD��}�6g�bm�FB�xZI��ې�M`���Qc�>\n\\\"�͚<�R-�0�\\\"V�;%����`0�/�̩��D8����D/+�&�V��dWζx�*�	b�\\\\��%�<7\r�e�8�`O-+V��L�=M�q�?���@��`�M3�;j�N�t��kn�\\\\bC�X��]����Â��ɍ2���lglW	P��g�H����	��#t������al��o�l�6����V-.�8��C.(`7���������vY�������70�\\0ue������3�PjK̂�z�O{i��8�hc�+��teqD��\n^��J,c�C9ޠ��{��w�NɛKl6iNw�4�ն�Y9E�-GE1r^��G\Z�;�;�\n��u2=��V�/I/�t�2��&��n,�m+���̷��d�mޟ�V#�8W�z?�n�p����o���q]�U� ]2���\\\\�k��`<�#��fgE��R�LGأ��b�E-���./\\\'\\0dG3s166,a[�X���*���g��4�2�4$�}FWf��`���e��g��\r�\n	߃N}�h��]F�ywRǍK��۩�} *�85���՞��y�x`����\nݺR���o�V�Y�HնxI������4^������j��>L_�P�����Y�|kg,h�F�\\0�.� �j!��q,KM[U~�\n.�TҲM��<�6�dCP�\Z��\\\"�����\\\"��DPƷ�!߷#+�k��Q��X�i�ư�rTA+�q���ݗ�!1��VD�&��h�������u�^|/�Ƒ��}\\\"�UuR��_��Ce�W�b�u\\\'1���M@\r��t���M���l���VI���8�4�R�����Pd����s��0�w�4��!)�f�ew@#0�ѫ�\\\'t>�`9�k��?\nO��f�Ff`�0g�OUc��j�u�>��+�-xE�\nP$�-�z��g)f��uIy�T��JA�k�ʽl<�N^y������%���Ǯ��\r�X��9��q��D*d�h&��Tt��Vo%_ck,�[�@��^�`(q�������z�)1b4�$�>��\\\'&�-��+j�a��I���9�r~�A���dlZ�4GQJ:�\\\'HZUj<�`@˯�wۋ��E�b��vP�#1�\\0J���:�I�z�M�R������~\\0�E�*F��_�k1���d�����\\\\����w����	���.8�]w>���~ B� :���8��w��z�d䷢$oK��\\\\����֙ ��T��ZQ=zBL��_��jJ\n�\Z$(���dA�,\r�I�x����i0(��\\\'c�7ow=O����VA+O$hy��|6G~Т>j;F���ʻ��_r��\rqQ�����{>�N�y�N�S�\r~x�z��/�䐏4�=��u�\Z��ZM�֝EM>4���q�\r\nendstream\r\nendobj\r\n9 0 obj\r\n<</Type/XObject/Subtype/Form/FormType 1/BBox[0 0 612.0 792.0] /Length 144 /Filter /FlateDecode >>\r\nstream\r\n��6U������W܌��X\\0�RhM|��B5p�\\\"�y�Bl����b��$��e��\n��g���|���/�;��2�r�A�/�0�S�d��lE�*��&��T[��si��~�1��`��Ԙ��G�෬t��-�������4&�q�\\\\\\\\\r\nendstream\r\nendobj\r\n14 0 obj\r\n<</Type/XObject/Subtype/Form/FormType 1/BBox[0 0 612.0 792.0] /Length 144 /Filter /FlateDecode >>\r\nstream\r\n7T��C\\\"S�mfT<�A�Be�p�~�DG�u:#�\\0��g\\0�*�j�d�5�C(�U�+������Q�6	�\n`�La�\\\"��\n�D�D����<w�h=X����W�su9��*�k��:U>3.y����sFC��`��\r\nendstream\r\nendobj\r\n13 0 obj\r\n<< /Length 4160 /Filter /FlateDecode >>\r\nstream\r\n�떼���[�NB���Z(��?u��3mӪ���h�bw�;Sve��i����z������I�ONe����:p���T���d	�o<�G9�ѾOxE�rҧ`�eӽ֌0\Z߲À9lv-+c�	rh�5e�|�>�{<����n�v�R�#+�P#�fk GՎT���~x�ˋ��sL���[4h�Z`�k���9��.K�XV�{��V<*�\\\"]�ĉ|:��:��Vi\\0;�*��>�~ێG�\\\\���\Z0Q����}��7t?�r�gǚ��O�<�����g�Al�����p�#\n�8�P���m_e�\n�_x!q:�\nK�@\n�U�}@X�Q���9pQ�ϩ�����\n�Ƙ�mv4J��̲�]��0;����o�ކ]�ZN�Ǖ���z>�,�L�����>:yv��HȄ����%�%�_\\\'��\\\\\n\\\'�еg��[����K�I�N��%�_���f%���񑊪YW����*tA�(K85��C�î=��1�C,��%[���\Z��Q�E�ժꤍ.�vs�r�8�$��n�:���pVg\r�	�f/\\0��l#w;=�����d]�!@:w�\\\\�AYH�?l\\\"�Հ�-�챴&\\\'x�ĳ ��UN�����u}e\rHl(�ܱ\\\"IϦ4�N��8�,Ѥ4�.�a�]���2(��\\03]����d�g��9�� ńР�����%��������kD���Ŕb䄞�Oɩ�-x`�m�(���1V�y�]0|*�\n7B�dmz�$Zf�\Z�#H�h���U\r�����\\\"�Ni��ͱ� CU�b�R�m��DHG��Z�E�(\Zj�����=��.y����ũ]����O8Mb�@���\r��o�^\\\\<��B�5sp�:��&��;�x�uM�q�c_����NN�o٣ש0\r}�y��d��v���`Yh���g��[~��	�\nT�S&�o�S{���?�B��Ye�uS2���E�Hu�1��l �d�׌� o�7V\Z�=Ϻ���K���5霉�Ƕ�<�ʴAg��̝t�;}�`�HQ]P��\\\'-�;��. ��ۈ)f5���ȴ��6�\\\"���7Q�o��0��/�e��_�|B~�_��Uc����\r}�>O�y����x�!���T�|$cco+l�=�w�8�\\\'�=)�����c��3��:P5�uYu����S���ٿՖ�y�\\0Du\\\'�`�v��w�^H���J ����@�Vuؘ�F�xHE7���1b�R80��\Z� \Z�N����A�\\\\P�n�miEJ�z�\r�gry�[��MI6R*mѦ�&􄣎(d�F�r.�9w���XF�M�^�ٳ\ZM�\\\'��>�6�:Wd�M�������^QǹK�j;�������������2:g�%3N�2�� �f�E��%P�FuO�\\0�J!K�8J7?�l��]�o�m�M��m���}w|A��U��z^<�L�rbZ��&�׋351N�&AF�Ƽ_J#��-\\\"6��v�6�2bp���	L��ϝ@�C:�ӧv{���%=���̓/�]�-B)�C����`�������.%��@�s���\\\"�#RGT�jDޠ�,L Xr�8�V�.��,�����XL��)��0���O���6���ɮF�n�q<���3��a�k�:�uͮ��U�	g��I��CNV!���q,n6X?uq+��R���(���יS���O�!���?הu(���7��ؚ=Μ��,Ԫ8��I��z҂X4�e�O���}�wP?m�����[�	�6��j-�⼠V׍��̭�k�n=f�S=\\0`�p\Z[f�{x���Q��H�a� V�>��6�2��>	̆�����\\\'ߧ����x�b��qtOADv��ΖiT�j��l�Eٷ��Y&B�T~n&b�\n�\\\\ZJ��mG)�x2\n+;�s߄���~T���Y��?�\\\\$����������Mf�\\\\�ԭtϺG��p�5{;�߸@ը��LEhb�T~\\\\�HJ��=��YR���lN�f7E�#��K`6��Aن�5�OE�qmq�Xs��úeT\r�Y_U�`�q��<Ppbr�J@��h�;��)\r��K�R���f�aԙ_0q��=jň�o�Ћ9-�\\0�����=�2FT�XW��y�֕�;D0V�����Tk~Z:h��3��v�q��fnҙ@�lc5P>h�[_�aA���C���-���li�����S�].�t�r������|�`�*|v�U�H�$��j6�Y\Z�%�s�K�8�ç�Src;�ٽ�T>���Ոb�x�>)�>*PGO����Z��3��s5�R���%��9��oجAK��k>����8�(���\r<�ň�7tv��;#:eW�V�<��j)v��>|.1aD���iF|>��}�(Ҝ���t\n�r�S5t�c�ܚ���2�ŋU���]��B��#Cy��\\0\r�t4�6!��)�zO����dP@K�W�[�s�q�;���hUu{��l\Z�H��F�\nq��V�U�@�`�(��ins֕�z{�����\\\'�˥���!#�8������\Zn2*W��ٷ�O�}���oք<A����O�����J��(��S��P3��������EYݦ�;7*���s�����vs�J�wS���W��/��kp �<�`�H��%�S���2���Ui�T��1�d��q�P�Pg�a=�K1�/-�K����:ټo���X	�[���`���[�/Z��L��W���Njx�D6��3@~\ZJ�i)pL�{,�X��t�q. �j:�e9+,)BWh�\r���<^\\\"�_)ܑ�F�o�h��!��i����:��:\\0��K\\\"��Y¿�	П!m*���\n9��]�5V\\\"�d�n@���2���t\\\"Ӟ\\\")��ktq�<�>�Z��]�$m�M�f�HA�*�k�-����<��E���ǁܞ{^`.Q���ID�y�}�6���ҵ7<#j��u�P�����\Z�g�s\r_\\0Z]+5oFF_�}W���ޝ���YSh�c�JP(o����E�Û�%.�n���[�\\\'T�/���h[\\\'Z�K�!>���oPT(^�䬀m�����\\0n�P#�X!L����/Oʦ��p�\\\'���tJ��IOl�Xʛ��(=��s*��x�*!5�9��\r�֐��Y\n���1�E�o�@��ܘNJT���7��D싒g|Hm?Џ:\\0�>����7W����ZXݛ׀S��ӠGd�k֮�c�ޤ�5	�v#W���~�I)�3Y���S1�$b|�1�f�t��}��0�:� B��t�1���a��<0D_+qoBR�k[��uFP��L�r��v::��Y,�+HD��b�w���eŜ��=���1���lL�`~�lJ�D�\\0AB�-�8�/�/S0ч��8)6��W1��,��;I����X6�ב	�Ę�47-�RbŨ��Z�\\\"�f�EX��,r`��q��^k7-�I��G�/>@��aI�%����X��\r}��2����)g�+�80�jfA4�t{�/a�����=\\\'�L�z��6������CuV���P$Q,���ޗdcL�Ƴ���/k��o}u�yþވ2��*�ڹA�t<@\\\\���[�PqI�C�hj�l��pb��l4�����3�3��G�<Rl��Ve(�>2���㬻�i7*��Vo�t��2���Bǖ%���RŌ�Kh���:�>E\rL����v\\\\[��[\\\'�F\Z~�����yM�0b׎��-��o0M���Y]{�����0!YCIq���o���n��)��\\\\��BwXB;��XIx�z�%Q9�w_�H�4a��7t�is������b�>�U�]��t?e��b_�VMN�\r�e�qG�qj�F�91u؁\\\\woO�lQ������G43LZ�����w{�qqlS>�)�v��j�^�)�T�Z,�V1�hm�ّ��h��~D�L���d4J5�����}WL���(���5���p_�w[�//cty��c�T��~�E|ے�F��<���\r%�h>��S�V!�k��L���M���>+�\\0��O�{GF�oz���U@�Mt�~e1�����l�#���đ.����Cwea�HⅥ�3I�֎G7��)G\r\n���ۥ~ES��\\0⡻��w���wj= � �~P�R�q/��\\\\���Ӫq��\\0I��i�`o�;������X)q�&P,\ZL<(�]1��u��ك��!�\r\nendstream\r\nendobj\r\n1 0 obj\r\n<<\r\n/Filter /Standard\r\n/O (6Eӝu;|�,\\\\(�fZ��5?�4�Sh���\\\\\\\\W�)\r\n/U (��%\\\\(��q�˸��+8\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0)\r\n/P -1340\r\n/R 4\r\n/V 4\r\n/Length 128\r\n/CF<</StdCF<</Length 16/AuthEvent/DocOpen/CFM/AESV2>>>>\r\n/StrF/StdCF\r\n/StmF/StdCF\r\n>>\r\nendobj\r\n2 0 obj\r\n<<\r\n/Type /Catalog\r\n/Pages 4 0 R\r\n>>\r\nendobj\r\n3 0 obj\r\n<<\r\n/Type /Info\r\n/Producer (��F� ��G��HN��VC�|C�@W��6E�N�mz�����vx��l<�Gj\\\\n���<�|.H`��)\r\n>>\r\nendobj\r\n4 0 obj\r\n<<\r\n/Type /Pages\r\n/Kids [\r\n6 0 R\r\n12 0 R\r\n]\r\n/Count 2\r\n>>\r\nendobj\r\n5 0 obj\r\n<<\r\n/ProcSet [ /PDF /Text ]\r\n/Font << \r\n/F1 8 0 R\r\n/F2 10 0 R\r\n/F3 11 0 R\r\n>>\r\n/XObject << \r\n/fx0 9 0 R\r\n/fx1 14 0 R\r\n>>\r\n>>\r\nendobj\r\n6 0 obj\r\n<<\r\n/Type /Page\r\n/Parent 4 0 R\r\n/Resources 5 0 R\r\n/Contents 7 0 R\r\n/MediaBox[ 0 0 612.0 792.0 ]\r\n/CropBox[ 0 0 612.0 792.0 ]\r\n/Rotate 0\r\n>>\r\nendobj\r\n8 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Helvetica\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n10 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Helvetica-Bold\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n11 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Times-Bold\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n12 0 obj\r\n<<\r\n/Type /Page\r\n/Parent 4 0 R\r\n/Resources 5 0 R\r\n/Contents 13 0 R\r\n/MediaBox[ 0 0 612.0 792.0 ]\r\n/CropBox[ 0 0 612.0 792.0 ]\r\n/Rotate 0\r\n>>\r\nendobj\r\n15 0 obj\r\n[ 12 0 R /XYZ 317.4 135.271 null ]\r\nendobj\r\n16 0 obj\r\n[ 12 0 R /XYZ 317.4 135.271 null ]\r\nendobj\r\nxref\r\n0 17\r\n0000000000 65535 f\r\n0000009804 00000 n\r\n0000010047 00000 n\r\n0000010102 00000 n\r\n0000010219 00000 n\r\n0000010295 00000 n\r\n0000010438 00000 n\r\n0000000010 00000 n\r\n0000010596 00000 n\r\n0000005001 00000 n\r\n0000010701 00000 n\r\n0000010812 00000 n\r\n0000010919 00000 n\r\n0000005564 00000 n\r\n0000005282 00000 n\r\n0000011079 00000 n\r\n0000011133 00000 n\r\ntrailer\r\n<<\r\n/Size 17\r\n/Root 2 0 R\r\n/Info 3 0 R\r\n/Encrypt 1 0 R\r\n/ID [<7dcf5b8729edb00dd2105ce9460df375><7dcf5b8729edb00dd2105ce9460df375>]\r\n>>\r\nstartxref\r\n11187\r\n%%EOF\r\n','2015-04-30 17:02:15','admin'),(104,'A third resume to test main page','100','Plan Of Study.pdf',NULL,'%PDF-1.6\r\n7 0 obj\r\n<< /Length 4912 /Filter /FlateDecode >>\r\nstream\r\n��H\n|�������]q\\\\c�����I�A��n�^��oL]y�7�i��+ю\n�L�\\\"�]�`�~���Mz�^΍�>�����\\\'�h�WV,j(.J/�1��,�S����#�|��؟�fQ`K�>\\\'!�nn­j-��J�*������+�A\\\\1�Z�IXs�G扖�e\n�tO��Uٮ��\\\'�����ދ�J�T�²������eO��k*����3��7+�\\\"W�Bdz���;��ZȀ\\0܋�!�V%�������X~�8p�ƥ��̾/�v[��X�oU2�5���kSa�ZH�<o �]��=+�!xK�d���k�13p=�Oa�s�^o\\\'  r�����D�0���	�7�|�ҿ�6� �$(#\r ��z��܏/O����j�G��p�Ԏ�S���*��F m(����I�#��p�;��f���7WHk�7ѵ��嬘��5Fp貺���H�v���0��hBQ����z����C��|Ml_D�~�/�ҌE���i\Zכֿ ^k�֫��v��3#4�w[���n�V3$at�voQl���(T�\\\\��Y�Rطq]���o+&�~^�L.?|}�1��I��k��\r��(ƍ�9�­�����D�;�ݸT�y�Uf�]:e��t�y\\\'��}L��\\\'���*�G�>#�+^=n\\0t�/P���s�P�u�i[S��I��p�����ue\Z�(�W��FI%�V�\n�-�@J��G��]Q=<KݚL�.����x�\r��f�����s�:�+�<���Hl�~o��L�+0��1<H4��7��1\r9��Dd�34�Q)yvf�QD����Z���@O��]����j��\\0�ar�c(mso\\\'p͏�o�:W�:<�C\n�d�T�WAR�Q��0��ë�P��9��dbo�X�i�=�z�=�4�.T:t���WrOV����E��d�L�c�)@��\\\'|�Զ9AȟW���U�$���P��0Z�O#�[�U�\r�\Z=�����ch0j����J�(\\\\/?&rؓ��Y�h�c���md��E�1��L������f����y\n\\\\��!9��~�nhJ�0߰�&�i^�������`�QY/lfv��B�2i�D�K�L�ϏG�cDa{Q�lP���ZX��m����2���x�)w��ʯb�͟i���cQ�΀��8�^�Eu�������<��_f��xX�:��o�y8����.ɸ84�W�=H�\\0�j!D�S���Ƨ��iHwG\\\\zo����~������ܯt=s�<euۗ1ÒV�54~��g�ɕ�SC�K�d�9\\\"��_����$��-H@쩨g\nđi��y����o������\n��с�ę��O̸J.�b+�:�l<)\Z0O�;����F�MM兼�	aR0EM����(ҩ|� %���x��������j=o�Z�˙�%s�e�F�xG��\\\\/W^�h�������/Q�=H-;��?�R?E{_�=��׿�+g��~J$G���^�=z�t�1�������.1�K�j��qmtz�_�%S�.��(�s��g�lh��0iu3���0c��4XËyI\\\"��ٛ��;���?O\\\\p�\\\"I3.�8\\0���y�G��T����H8QR�r��18V����Q�B*-g�X�6��R�-r8���>��4������@��$�R��y>@S<�\\\"\rT���QK�\\\"C���L�O������#�t/�WM_��f��\r腲��gܯ6nP��^������y��%2��S�E�J�.�1��]�����֟��`�b�8Y\\\'���yQ��w�\\0[n�����纈��!�!2*iW]�U��!�����uL,���r���fݩ���4���y��\\\"�v�E<��/)�[O�|�jBYՎ�[���������i��Y�$���QNFpii\\\'�5\re4�c�1���زo>��Mi���v���,)�q[Vi\ru	��g<�eu��s=��0��26S���\\\'\\\"ꪚ�ڧ��7BK�>�l7z�D�P[˽aSB��67���@���@��:\\0��q/s��T��ݬk���-|��V��I\Z`�0��/{�ȡ�Q��o��C�Ȍg.��Ԉ�j\\0,6|�~F*u\\\'����W�B�^p������#w��R�\r���m��{�{�?�|:8(w���2Rɮ��-�$�Pr�zpp�gId!�D�83:h@�2����Čbv�5~�� �������B�u=��B#�� ��O�H/ioE����q�E��S	㳀���)е���l�ʁ���~���:$[�\\\\-���ͼ0��6	�N����Wh��+��;@��\\\"�I���Ɏ��j�=4���R��ItV�}�\n�ی�0���U%��;��ľ�*׫\\\"y�¶��eW~K��J�����9�u�|�G��6��u���Zd���$�nm<%�ov����n�����m��J�m�򓵛����O�RJSE��k}����[�-��7�܈a��t�u�K4.�T��j�I��� �l�C>�	|������<B\\\\8�usU��<�BC�����7`i�Y�ׯM2N.���?6�CȕmB��IJ��+��1�\\\\��Odw\\\\�hҥ0��ujseK���J�9lwx�g�\\\\#.R8��0Ik�*6U�c9�	(Y5������#3rM��3�RVWE>�|@\r��.^$ԛӋ �!��\\\"/O�z����B�]$���U	s��q���F��(�Re�\\\'j?+HHǌ��!�v�)�P�,�}��q	��!�Қ���fƛ��f;�)�������ǬweDa4Z�y�Qt�&Syv��۬��!�Og\\\\�h���i��{Uܹx�\\\\��<״�}�P�ݴ�68���S��\\\"L6��[vݬ.7lTo7�d�c���!�YC�lxD�6�PG���N^���մڳ(y��s9(¬*,�d��r��Q-?4GO��# |[���\Z�P���:���R�S�jʬ������@�t�9W��!z�l�`u�5��O�>�����	\n�(=�1yF3)���քF+���C�R3H�e�u7D��+���w�׃@l�ӽ�(I�%�N�б8j}��9Z�	:��2�����K�%�a����<��ֆ�o��o����k�%���8ӱ|\n�z!�b$��ʕ���kϘ�@꒱t�m\\\'Ѓ�l��`�ō�\\0�ߟ)��ݛqis��\r=/į�\\\"*KqS|E*\\\'���K��}�ro�.G]W���J��`uO�u2z&��6�(�1��\r�\\\"AY�!OE�-࿁���)f��Q2#��%���j�4�Z�ɛ�\r�!�򧐝�i��m���Q�ο��kR_�nNhO�X���Y�]I��͝I�<�p9`��n�����{���\r6� ������VvH*�>Ի��,����\Z�O�C 3u�r�e��\\0��cIiAC ����U�)�A��o��K�fɄn��GY�{|u�=߆���A��L��8����0�Q�>m��<ޱ �v�9��f�ߌ�����)�i[sR�g�I������h��\rF�?VVD��}�6g�bm�FB�xZI��ې�M`���Qc�>\n\\\"�͚<�R-�0�\\\"V�;%����`0�/�̩��D8����D/+�&�V��dWζx�*�	b�\\\\��%�<7\r�e�8�`O-+V��L�=M�q�?���@��`�M3�;j�N�t��kn�\\\\bC�X��]����Â��ɍ2���lglW	P��g�H����	��#t������al��o�l�6����V-.�8��C.(`7���������vY�������70�\\0ue������3�PjK̂�z�O{i��8�hc�+��teqD��\n^��J,c�C9ޠ��{��w�NɛKl6iNw�4�ն�Y9E�-GE1r^��G\Z�;�;�\n��u2=��V�/I/�t�2��&��n,�m+���̷��d�mޟ�V#�8W�z?�n�p����o���q]�U� ]2���\\\\�k��`<�#��fgE��R�LGأ��b�E-���./\\\'\\0dG3s166,a[�X���*���g��4�2�4$�}FWf��`���e��g��\r�\n	߃N}�h��]F�ywRǍK��۩�} *�85���՞��y�x`����\nݺR���o�V�Y�HնxI������4^������j��>L_�P�����Y�|kg,h�F�\\0�.� �j!��q,KM[U~�\n.�TҲM��<�6�dCP�\Z��\\\"�����\\\"��DPƷ�!߷#+�k��Q��X�i�ư�rTA+�q���ݗ�!1��VD�&��h�������u�^|/�Ƒ��}\\\"�UuR��_��Ce�W�b�u\\\'1���M@\r��t���M���l���VI���8�4�R�����Pd����s��0�w�4��!)�f�ew@#0�ѫ�\\\'t>�`9�k��?\nO��f�Ff`�0g�OUc��j�u�>��+�-xE�\nP$�-�z��g)f��uIy�T��JA�k�ʽl<�N^y������%���Ǯ��\r�X��9��q��D*d�h&��Tt��Vo%_ck,�[�@��^�`(q�������z�)1b4�$�>��\\\'&�-��+j�a��I���9�r~�A���dlZ�4GQJ:�\\\'HZUj<�`@˯�wۋ��E�b��vP�#1�\\0J���:�I�z�M�R������~\\0�E�*F��_�k1���d�����\\\\����w����	���.8�]w>���~ B� :���8��w��z�d䷢$oK��\\\\����֙ ��T��ZQ=zBL��_��jJ\n�\Z$(���dA�,\r�I�x����i0(��\\\'c�7ow=O����VA+O$hy��|6G~Т>j;F���ʻ��_r��\rqQ�����{>�N�y�N�S�\r~x�z��/�䐏4�=��u�\Z��ZM�֝EM>4���q�\r\nendstream\r\nendobj\r\n9 0 obj\r\n<</Type/XObject/Subtype/Form/FormType 1/BBox[0 0 612.0 792.0] /Length 144 /Filter /FlateDecode >>\r\nstream\r\n��6U������W܌��X\\0�RhM|��B5p�\\\"�y�Bl����b��$��e��\n��g���|���/�;��2�r�A�/�0�S�d��lE�*��&��T[��si��~�1��`��Ԙ��G�෬t��-�������4&�q�\\\\\\\\\r\nendstream\r\nendobj\r\n14 0 obj\r\n<</Type/XObject/Subtype/Form/FormType 1/BBox[0 0 612.0 792.0] /Length 144 /Filter /FlateDecode >>\r\nstream\r\n7T��C\\\"S�mfT<�A�Be�p�~�DG�u:#�\\0��g\\0�*�j�d�5�C(�U�+������Q�6	�\n`�La�\\\"��\n�D�D����<w�h=X����W�su9��*�k��:U>3.y����sFC��`��\r\nendstream\r\nendobj\r\n13 0 obj\r\n<< /Length 4160 /Filter /FlateDecode >>\r\nstream\r\n�떼���[�NB���Z(��?u��3mӪ���h�bw�;Sve��i����z������I�ONe����:p���T���d	�o<�G9�ѾOxE�rҧ`�eӽ֌0\Z߲À9lv-+c�	rh�5e�|�>�{<����n�v�R�#+�P#�fk GՎT���~x�ˋ��sL���[4h�Z`�k���9��.K�XV�{��V<*�\\\"]�ĉ|:��:��Vi\\0;�*��>�~ێG�\\\\���\Z0Q����}��7t?�r�gǚ��O�<�����g�Al�����p�#\n�8�P���m_e�\n�_x!q:�\nK�@\n�U�}@X�Q���9pQ�ϩ�����\n�Ƙ�mv4J��̲�]��0;����o�ކ]�ZN�Ǖ���z>�,�L�����>:yv��HȄ����%�%�_\\\'��\\\\\n\\\'�еg��[����K�I�N��%�_���f%���񑊪YW����*tA�(K85��C�î=��1�C,��%[���\Z��Q�E�ժꤍ.�vs�r�8�$��n�:���pVg\r�	�f/\\0��l#w;=�����d]�!@:w�\\\\�AYH�?l\\\"�Հ�-�챴&\\\'x�ĳ ��UN�����u}e\rHl(�ܱ\\\"IϦ4�N��8�,Ѥ4�.�a�]���2(��\\03]����d�g��9�� ńР�����%��������kD���Ŕb䄞�Oɩ�-x`�m�(���1V�y�]0|*�\n7B�dmz�$Zf�\Z�#H�h���U\r�����\\\"�Ni��ͱ� CU�b�R�m��DHG��Z�E�(\Zj�����=��.y����ũ]����O8Mb�@���\r��o�^\\\\<��B�5sp�:��&��;�x�uM�q�c_����NN�o٣ש0\r}�y��d��v���`Yh���g��[~��	�\nT�S&�o�S{���?�B��Ye�uS2���E�Hu�1��l �d�׌� o�7V\Z�=Ϻ���K���5霉�Ƕ�<�ʴAg��̝t�;}�`�HQ]P��\\\'-�;��. ��ۈ)f5���ȴ��6�\\\"���7Q�o��0��/�e��_�|B~�_��Uc����\r}�>O�y����x�!���T�|$cco+l�=�w�8�\\\'�=)�����c��3��:P5�uYu����S���ٿՖ�y�\\0Du\\\'�`�v��w�^H���J ����@�Vuؘ�F�xHE7���1b�R80��\Z� \Z�N����A�\\\\P�n�miEJ�z�\r�gry�[��MI6R*mѦ�&􄣎(d�F�r.�9w���XF�M�^�ٳ\ZM�\\\'��>�6�:Wd�M�������^QǹK�j;�������������2:g�%3N�2�� �f�E��%P�FuO�\\0�J!K�8J7?�l��]�o�m�M��m���}w|A��U��z^<�L�rbZ��&�׋351N�&AF�Ƽ_J#��-\\\"6��v�6�2bp���	L��ϝ@�C:�ӧv{���%=���̓/�]�-B)�C����`�������.%��@�s���\\\"�#RGT�jDޠ�,L Xr�8�V�.��,�����XL��)��0���O���6���ɮF�n�q<���3��a�k�:�uͮ��U�	g��I��CNV!���q,n6X?uq+��R���(���יS���O�!���?הu(���7��ؚ=Μ��,Ԫ8��I��z҂X4�e�O���}�wP?m�����[�	�6��j-�⼠V׍��̭�k�n=f�S=\\0`�p\Z[f�{x���Q��H�a� V�>��6�2��>	̆�����\\\'ߧ����x�b��qtOADv��ΖiT�j��l�Eٷ��Y&B�T~n&b�\n�\\\\ZJ��mG)�x2\n+;�s߄���~T���Y��?�\\\\$����������Mf�\\\\�ԭtϺG��p�5{;�߸@ը��LEhb�T~\\\\�HJ��=��YR���lN�f7E�#��K`6��Aن�5�OE�qmq�Xs��úeT\r�Y_U�`�q��<Ppbr�J@��h�;��)\r��K�R���f�aԙ_0q��=jň�o�Ћ9-�\\0�����=�2FT�XW��y�֕�;D0V�����Tk~Z:h��3��v�q��fnҙ@�lc5P>h�[_�aA���C���-���li�����S�].�t�r������|�`�*|v�U�H�$��j6�Y\Z�%�s�K�8�ç�Src;�ٽ�T>���Ոb�x�>)�>*PGO����Z��3��s5�R���%��9��oجAK��k>����8�(���\r<�ň�7tv��;#:eW�V�<��j)v��>|.1aD���iF|>��}�(Ҝ���t\n�r�S5t�c�ܚ���2�ŋU���]��B��#Cy��\\0\r�t4�6!��)�zO����dP@K�W�[�s�q�;���hUu{��l\Z�H��F�\nq��V�U�@�`�(��ins֕�z{�����\\\'�˥���!#�8������\Zn2*W��ٷ�O�}���oք<A����O�����J��(��S��P3��������EYݦ�;7*���s�����vs�J�wS���W��/��kp �<�`�H��%�S���2���Ui�T��1�d��q�P�Pg�a=�K1�/-�K����:ټo���X	�[���`���[�/Z��L��W���Njx�D6��3@~\ZJ�i)pL�{,�X��t�q. �j:�e9+,)BWh�\r���<^\\\"�_)ܑ�F�o�h��!��i����:��:\\0��K\\\"��Y¿�	П!m*���\n9��]�5V\\\"�d�n@���2���t\\\"Ӟ\\\")��ktq�<�>�Z��]�$m�M�f�HA�*�k�-����<��E���ǁܞ{^`.Q���ID�y�}�6���ҵ7<#j��u�P�����\Z�g�s\r_\\0Z]+5oFF_�}W���ޝ���YSh�c�JP(o����E�Û�%.�n���[�\\\'T�/���h[\\\'Z�K�!>���oPT(^�䬀m�����\\0n�P#�X!L����/Oʦ��p�\\\'���tJ��IOl�Xʛ��(=��s*��x�*!5�9��\r�֐��Y\n���1�E�o�@��ܘNJT���7��D싒g|Hm?Џ:\\0�>����7W����ZXݛ׀S��ӠGd�k֮�c�ޤ�5	�v#W���~�I)�3Y���S1�$b|�1�f�t��}��0�:� B��t�1���a��<0D_+qoBR�k[��uFP��L�r��v::��Y,�+HD��b�w���eŜ��=���1���lL�`~�lJ�D�\\0AB�-�8�/�/S0ч��8)6��W1��,��;I����X6�ב	�Ę�47-�RbŨ��Z�\\\"�f�EX��,r`��q��^k7-�I��G�/>@��aI�%����X��\r}��2����)g�+�80�jfA4�t{�/a�����=\\\'�L�z��6������CuV���P$Q,���ޗdcL�Ƴ���/k��o}u�yþވ2��*�ڹA�t<@\\\\���[�PqI�C�hj�l��pb��l4�����3�3��G�<Rl��Ve(�>2���㬻�i7*��Vo�t��2���Bǖ%���RŌ�Kh���:�>E\rL����v\\\\[��[\\\'�F\Z~�����yM�0b׎��-��o0M���Y]{�����0!YCIq���o���n��)��\\\\��BwXB;��XIx�z�%Q9�w_�H�4a��7t�is������b�>�U�]��t?e��b_�VMN�\r�e�qG�qj�F�91u؁\\\\woO�lQ������G43LZ�����w{�qqlS>�)�v��j�^�)�T�Z,�V1�hm�ّ��h��~D�L���d4J5�����}WL���(���5���p_�w[�//cty��c�T��~�E|ے�F��<���\r%�h>��S�V!�k��L���M���>+�\\0��O�{GF�oz���U@�Mt�~e1�����l�#���đ.����Cwea�HⅥ�3I�֎G7��)G\r\n���ۥ~ES��\\0⡻��w���wj= � �~P�R�q/��\\\\���Ӫq��\\0I��i�`o�;������X)q�&P,\ZL<(�]1��u��ك��!�\r\nendstream\r\nendobj\r\n1 0 obj\r\n<<\r\n/Filter /Standard\r\n/O (6Eӝu;|�,\\\\(�fZ��5?�4�Sh���\\\\\\\\W�)\r\n/U (��%\\\\(��q�˸��+8\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0\\0)\r\n/P -1340\r\n/R 4\r\n/V 4\r\n/Length 128\r\n/CF<</StdCF<</Length 16/AuthEvent/DocOpen/CFM/AESV2>>>>\r\n/StrF/StdCF\r\n/StmF/StdCF\r\n>>\r\nendobj\r\n2 0 obj\r\n<<\r\n/Type /Catalog\r\n/Pages 4 0 R\r\n>>\r\nendobj\r\n3 0 obj\r\n<<\r\n/Type /Info\r\n/Producer (��F� ��G��HN��VC�|C�@W��6E�N�mz�����vx��l<�Gj\\\\n���<�|.H`��)\r\n>>\r\nendobj\r\n4 0 obj\r\n<<\r\n/Type /Pages\r\n/Kids [\r\n6 0 R\r\n12 0 R\r\n]\r\n/Count 2\r\n>>\r\nendobj\r\n5 0 obj\r\n<<\r\n/ProcSet [ /PDF /Text ]\r\n/Font << \r\n/F1 8 0 R\r\n/F2 10 0 R\r\n/F3 11 0 R\r\n>>\r\n/XObject << \r\n/fx0 9 0 R\r\n/fx1 14 0 R\r\n>>\r\n>>\r\nendobj\r\n6 0 obj\r\n<<\r\n/Type /Page\r\n/Parent 4 0 R\r\n/Resources 5 0 R\r\n/Contents 7 0 R\r\n/MediaBox[ 0 0 612.0 792.0 ]\r\n/CropBox[ 0 0 612.0 792.0 ]\r\n/Rotate 0\r\n>>\r\nendobj\r\n8 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Helvetica\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n10 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Helvetica-Bold\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n11 0 obj\r\n<<\r\n/Type /Font\r\n/Subtype /Type1\r\n/BaseFont /Times-Bold\r\n/Encoding /WinAnsiEncoding\r\n>>\r\nendobj\r\n12 0 obj\r\n<<\r\n/Type /Page\r\n/Parent 4 0 R\r\n/Resources 5 0 R\r\n/Contents 13 0 R\r\n/MediaBox[ 0 0 612.0 792.0 ]\r\n/CropBox[ 0 0 612.0 792.0 ]\r\n/Rotate 0\r\n>>\r\nendobj\r\n15 0 obj\r\n[ 12 0 R /XYZ 317.4 135.271 null ]\r\nendobj\r\n16 0 obj\r\n[ 12 0 R /XYZ 317.4 135.271 null ]\r\nendobj\r\nxref\r\n0 17\r\n0000000000 65535 f\r\n0000009804 00000 n\r\n0000010047 00000 n\r\n0000010102 00000 n\r\n0000010219 00000 n\r\n0000010295 00000 n\r\n0000010438 00000 n\r\n0000000010 00000 n\r\n0000010596 00000 n\r\n0000005001 00000 n\r\n0000010701 00000 n\r\n0000010812 00000 n\r\n0000010919 00000 n\r\n0000005564 00000 n\r\n0000005282 00000 n\r\n0000011079 00000 n\r\n0000011133 00000 n\r\ntrailer\r\n<<\r\n/Size 17\r\n/Root 2 0 R\r\n/Info 3 0 R\r\n/Encrypt 1 0 R\r\n/ID [<7dcf5b8729edb00dd2105ce9460df375><7dcf5b8729edb00dd2105ce9460df375>]\r\n>>\r\nstartxref\r\n11187\r\n%%EOF\r\n','2015-04-30 17:03:37','admin');
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
