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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` text,
  `telefone` text,
  `cpf` text,
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Igor Ferreira','1999-07-30','Rua Afonso de Mendonça, 1756 Santo André - SP','923731858','39012112717'),(2,'Martim Ferreira','2002-08-10','Rua Afonso de Mendonça, 1756 Santo André - SP','923575158','74937393760'),(3,'Catherine Zubareva','2003-11-07','Rua Coronel Fernando Prestes, 365 Itapetininga-SP','974657321','764920545720'),(4,'Kai Rodrigues Santos','2003-11-07','Rua Paraíba, 1166 Amparo-SP','910142818','999988865432'),(5,'Mirabel Madrigal','2003-11-07','Rua Quinze de Novembro, 141 Bauru-SP','910142818','64730287965'),(6,'Eliza Morales','2003-11-07','Rua Paraíba, 1166 Amparo-SP','910142818','87454632642'),(7,'Camilla SIlva','2003-11-07','Rua Rubi, 1458 Itapetininga-SP','910142818','22277966310'),(8,'Alex Poljak ','0200-11-07','Rua Paraíba, 1166 Amparo-SP','974629081','54637398291'),(9,'Luigi diAngelo','2004-11-16','Rua Alfredo Mendes, 181 Ribeirão Pires-SP','2593-3090','53819273978'),(10,'Ágatha Barros Goncalves','1980-05-20','Rua Maquiru, 401\nRibeirão Pires-SP','945782937','22828773364');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
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
