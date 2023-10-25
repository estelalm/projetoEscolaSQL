-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mobius_escoladb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `professores`
--

DROP TABLE IF EXISTS `professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professores` (
  `id_professor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `data_contratacao` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` text,
  `id_disciplina` int DEFAULT NULL,
  PRIMARY KEY (`id_professor`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `professores_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores`
--

LOCK TABLES `professores` WRITE;
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
INSERT INTO `professores` VALUES (1,'João Arnaldo de Almeida','2010-02-20','joaoalmeida@mobemail.com','11917689462',1),(2,'Jennifer Corrêa','2010-02-20',' jennifercorrea@mobemail.com','1198486573',2),(3,'Oswaldo Geoberto Callado','2015-06-06','oswaldocalado@mobemail.com','1173829467',3),(4,'Vivianne Karlei','2017-04-17','viviannekarlei@mobemail.com','11901704017',4),(5,'Olivia Helena Santos','2015-03-30','oliviasantos@mobemail.com','11903213023',5),(6,'Kimberly Lacerda Paes','2018-03-10','kimberlypaes@mobemail.com','11903213027',6),(7,'Pedro Emilio Camargo','2018-03-30','pedrocamargo@mobemail.com','11903213029',7),(8,'Antonio Lacerda ','2018-11-10','antoniolacerda@mobemail.com','11932017388',8),(9,'Jorge Amado','2019-02-27','jorgeamado@mobemail.com','11949320263',9),(10,'Sócrates da Silva','2021-05-30','socratessilva@mobemail.com','11954292731',10),(11,'Karina de Aragão','2023-06-30','karinaaragao@mobemail.com','11954027658',11);
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-25 13:49:36
