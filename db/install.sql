# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.5-10.1.9-MariaDB-log)
# Database: phpgrid_custom_crm
# Generation Time: 2017-01-13 06:33:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Course_Name` varchar(30) NOT NULL,
  `Course_Category` varchar(30) NOT NULL,
  `Course_URL` varchar(50) NOT NULL,
  `Course_Date` date NOT NULL,
  `Course_Completion` varchar(2) NOT NULL,
  `Course_Cost` decimal(10,2) NOT NULL,
  `Course_Notes` varchar(50) NOT NULL
  PRIMARY KEY (`id`),
--   KEY `FK_SALES_REP` (`Sales_Rep`),
--   KEY `FK_STATUS` (`Status`),
--   CONSTRAINT `FK_SALES_REP` FOREIGN KEY (`Sales_Rep`) REFERENCES `users` (`id`),
--   CONSTRAINT `FK_STATUS` FOREIGN KEY (`Status`) REFERENCES `contact_status` (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;

INSERT INTO `course` (`id`, `Course_Name`, `Course_Category`, `Course_URL`, `Course_Date`, `Course_Completion`,  `Course_Cost`, `Course_Notes`)
VALUES
	(1,NULL,'PHP',NULL,),
	(2,NULL,),
	(3,NULL,),
	(4,NULL,),
    (5,NULL,),
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Notes` tinytext,
  `Is_New_Todo` int(11) unsigned NOT NULL,
  `Todo_Type_ID` int(11) unsigned NOT NULL,
  `Todo_Desc_ID` int(11) unsigned NOT NULL,
  `Todo_Due_Date` varchar(29) DEFAULT NULL,
  `Contact` int(11) unsigned NOT NULL,
  `Task_Status` int(11) unsigned NOT NULL,
  `Task_Update` varchar(51) DEFAULT NULL,
  `Sales_Rep` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EVENT_NAME` (`Todo_Type_ID`),
  KEY `FK_EVENT_TYPE` (`Todo_Desc_ID`),
  KEY `FK_CONTACT_ID` (`Contact`),
  KEY `FK_SALES_ID` (`Sales_Rep`),
  KEY `FK_TASK_STATUS` (`Task_Status`),
  CONSTRAINT `FK_CONTACT_ID` FOREIGN KEY (`Contact`) REFERENCES `contact` (`id`),
  CONSTRAINT `FK_EVENT_NAME` FOREIGN KEY (`Todo_Type_ID`) REFERENCES `todo_type` (`id`),
  CONSTRAINT `FK_EVENT_TYPE` FOREIGN KEY (`Todo_Desc_ID`) REFERENCES `todo_desc` (`id`),
  CONSTRAINT `FK_SALES_ID` FOREIGN KEY (`Sales_Rep`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_TASK_STATUS` FOREIGN KEY (`Task_Status`) REFERENCES `task_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;

INSERT INTO `notes` (`id`, `Date`, `Notes`, `Is_New_Todo`, `Todo_Type_ID`, `Todo_Desc_ID`, `Todo_Due_Date`, `Contact`, `Task_Status`, `Task_Update`, `Sales_Rep`)
VALUES
	(1,'2014-07-11','ddddd',1,1,1,'07/23/2014 6:00pm to 8:00pm',1,1,'',1),
	(2,'2015-10-10','Sample Note',0,1,1,NULL,2,1,NULL,2),
	(3,'2015-05-21','sx',1,1,2,'07/31/2014',3,1,'',1),
	(4,'2014-06-01','Want to be sure to communicate weekly.',1,2,3,'07/04/2014 10:00am to 10:30am',4,1,'Ongoing',1),
	(5,'2014-01-31','Was introduced at textile conference.zzz',1,1,1,'04/09/2014 3:45pm to 4:45pm',5,2,'Great demo. All they needed to seal the deal.<br>',1),
	(6,'2014-11-11','Great to have this customer on board!',0,1,4,NULL,6,1,NULL,1),
	(7,'2017-01-27','test',0,1,2,'',3,1,'',1),
	(8,'2017-01-11','test123',0,1,5,NULL,6,1,NULL,1);

/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `role`)
VALUES
	(1,'Sales Rep'),
	(2,'Sales Manager'),
	(3,'Admin');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table task_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_status`;

CREATE TABLE `task_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;

INSERT INTO `task_status` (`id`, `status`)
VALUES
	(1,'pending'),
	(2,'completed');

/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table todo_desc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `todo_desc`;

CREATE TABLE `todo_desc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `todo_desc` WRITE;
/*!40000 ALTER TABLE `todo_desc` DISABLE KEYS */;

INSERT INTO `todo_desc` (`id`, `description`)
VALUES
	(1,'Follow Up Email'),
	(2,'Phone Call'),
	(3,'Lunch Meeting'),
	(4,'Tech Demo'),
	(5,'Meetup'),
	(6,'Conference'),
	(7,'Others');

/*!40000 ALTER TABLE `todo_desc` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table todo_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `todo_type`;

CREATE TABLE `todo_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `todo_type` WRITE;
/*!40000 ALTER TABLE `todo_type` DISABLE KEYS */;

INSERT INTO `todo_type` (`id`, `type`)
VALUES
	(1,'task'),
	(2,'meeting');

/*!40000 ALTER TABLE `todo_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_status`;

CREATE TABLE `user_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;

INSERT INTO `user_status` (`id`, `status`)
VALUES
	(1,'active'),
	(2,'inactive'),
	(3,'pending approval');

/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name_Title` varchar(30) DEFAULT NULL,
  `Name_First` varchar(6) NOT NULL,
  `Name_Middle` varchar(30) DEFAULT NULL,
  `Name_Last` varchar(8) NOT NULL,
  `Email` varchar(16) NOT NULL,
  `Password` varchar(9) NOT NULL,
  `User_Roles` int(11) unsigned NOT NULL,
  `User_Status` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USER_STATUS` (`User_Status`),
  KEY `FK_ROLE` (`User_Roles`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`User_Roles`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_USER_STATUS` FOREIGN KEY (`User_Status`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `Name_Title`, `Name_First`, `Name_Middle`, `Name_Last`, `Email`, `Password`, `User_Roles`, `User_Status`)
VALUES
	(1,NULL,'Johnny',NULL,'Rep','rep@test.com','123456',1,1),
	(2,NULL,'Mary',NULL,'Rep','rep2@test.com','123456',1,1),
	(3,NULL,'Suzy',NULL,'Manager','manager@test.com','123456',2,1),
	(4,NULL,'Sales',NULL,'Manager1','sm@sm.com','123456',2,1),
	(5,NULL,'Rich',NULL,'C','test@test.com','123456',1,1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
