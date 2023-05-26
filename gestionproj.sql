-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projectmanager
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id_Projet` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `dateLine` date DEFAULT NULL,
  `creationDate` date DEFAULT NULL,
  `id_task_project` int DEFAULT NULL,
  PRIMARY KEY (`id_Projet`),
  KEY `project_task_idx` (`id_task_project`),
  CONSTRAINT `project_task` FOREIGN KEY (`id_task_project`) REFERENCES `task` (`idTask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `idTask` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `dateLine` datetime DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `project_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idTask`),
  KEY `task_project_idx` (`project_id`),
  CONSTRAINT `task_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id_Projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id_teams` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_team_project` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_teams`),
  KEY `team_project_idx` (`id_team_project`),
  CONSTRAINT `team_project` FOREIGN KEY (`id_team_project`) REFERENCES `project` (`id_Projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `task_id` int DEFAULT NULL,
  PRIMARY KEY (`id_users`),
  KEY `users_teams_idx` (`team_id`),
  KEY `users_tasks_idx` (`task_id`),
  CONSTRAINT `users_tasks` FOREIGN KEY (`task_id`) REFERENCES `task` (`idTask`),
  CONSTRAINT `users_teams` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id_teams`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-10 15:57:35
