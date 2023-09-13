-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: calendar
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `k_client` bigint(20) NOT NULL AUTO_INCREMENT,
  `n_name` text NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`k_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `k_project` bigint(20) NOT NULL AUTO_INCREMENT,
  `n_name` text NOT NULL,
  `n_description` text NOT NULL,
  `fk_user` bigint(20) NOT NULL,
  `fk_client` bigint(20) NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`k_project`),
  KEY `fk_user` (`fk_user`),
  KEY `fk_client` (`fk_client`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`fk_client`) REFERENCES `clients` (`k_client`) ON UPDATE CASCADE,
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`fk_user`) REFERENCES `users` (`k_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `k_role` bigint(20) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(255) NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`k_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_status` (
  `k_status` bigint(20) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(255) NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`k_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `k_task` bigint(20) NOT NULL AUTO_INCREMENT,
  `n_description` text NOT NULL,
  `fk_project` bigint(20) NOT NULL,
  `f_start` datetime NOT NULL,
  `f_end` datetime NOT NULL,
  `fk_status` bigint(20) NOT NULL,
  `fk_user_creator` bigint(20) NOT NULL,
  `fk_user_responsible` bigint(20) NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`k_task`),
  KEY `fk_project` (`fk_project`),
  KEY `fk_status` (`fk_status`),
  KEY `fk_user_creator` (`fk_user_creator`),
  KEY `fk_user_responsible` (`fk_user_responsible`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`fk_status`) REFERENCES `task_status` (`k_status`) ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`fk_user_creator`) REFERENCES `users` (`k_user`) ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`fk_project`) REFERENCES `projects` (`k_project`) ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`fk_user_responsible`) REFERENCES `users` (`k_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `k_user_role` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_user` bigint(20) NOT NULL,
  `fk_role` bigint(20) NOT NULL,
  PRIMARY KEY (`k_user_role`),
  KEY `fk_role_user` (`fk_role`,`fk_user`) USING BTREE,
  KEY `fk_user` (`fk_user`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`k_user`) ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`fk_role`) REFERENCES `roles` (`k_role`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `k_user` bigint(20) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(255) NOT NULL,
  `n_last_name` varchar(255) NOT NULL,
  `n_email` varchar(100) NOT NULL,
  `n_password` text NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`k_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'Santiago','Martinez','cmartinezco07@correo.com','$2b$10$JdQw5/H68sgS5FcVaMC2heLxzJqFfnI6OcYCMY58sZ9K2sWDkm5vS','2023-09-13 17:43:14',NULL),(10,'Santiago','Martinez','cmartinezco@correo.com','$2b$10$wybAZGb0KbAazHVyd4ErLu1tqv8rr3jDddLwJOsw38eStYD0ovvly','2023-09-13 17:55:32',NULL),(11,'Santiago','Martinez','cmartinezco0707@correo.com','$2b$10$yZ/gIHXOw3/BBQklcDO4dultaVzmGy.xZBcNcJumV62W8AIJacKK2','2023-09-13 18:25:54',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'calendar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-13 18:31:24
