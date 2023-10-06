-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: universidades
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `idestado` int NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(45) DEFAULT NULL,
  `nombre_provincia` varchar(45) DEFAULT NULL,
  `latitud` decimal(10,7) DEFAULT NULL,
  `longitud` decimal(11,7) DEFAULT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'United States','unknown',NULL,NULL),(2,'United States','Pennsylvania',40.9699889,-77.7278831),(3,'United States','Texas',31.2638905,-98.5456116),(4,'United States','Utah',39.4225192,-111.7143580),(5,'United States','Nevada',39.5158825,-116.8537227),(6,'United States','Iowa',41.9216734,-93.3122705),(7,'United States','Virginia',37.1232245,-78.4927721),(8,'United States','Indiana',40.3270127,-86.1746933),(9,'United States','Colorado',38.7251776,-105.6077160),(10,'United States','Ohio',40.2253569,-82.6881395),(11,'United States','Indianapolis',39.7683331,-86.1583502),(12,'United States','New York',40.7127281,-74.0060152),(13,'United States','California',36.7014631,-118.7559970),(14,'United States','Illinois',40.0796606,-89.4337288),(15,'United States','New Hampshire',43.4849133,-71.6553992),(16,'United States','North Carolina',35.6729639,-79.0392919),(17,'United States','South Carolina',33.6874388,-80.4363743),(18,'United States','Washington',38.8950368,-77.0365427),(19,'United States','Missouri',38.7604815,-92.5617875),(20,'United States','North Dakota',47.6201461,-100.5407370),(21,'United States','Michigan',43.6211955,-84.6824346),(22,'United States','Florida',27.7567667,-81.4639835),(23,'United States','Georgia',41.6809707,44.0287382),(24,'United States','Maine',45.7090970,-68.8590201),(25,'Canada','Quebec',52.4760892,-71.8258668),(26,'Canada','Ontario',50.0006780,-86.0009770),(27,'Canada','Nova Scotia',45.1960403,-63.1653789),(28,'Canada','British Columbia',55.0012510,-125.0024410),(29,'Canada','Alberta',55.0012510,-115.0021360),(30,'Canada','Manitoba',55.0012510,-97.0010380),(31,'Canada','New Brunswick',46.5002830,-66.7501830),(32,'Canada','Saskatchewan',55.5321257,-106.1412243),(33,'Canada','unknown',NULL,NULL),(34,'Canada','Newfoundland and Labrador',53.8217327,-61.2295532),(35,'Canada','Prince Edward Island',46.5036807,-63.5954110),(36,'Canada','Yukon',63.0001470,-136.0025020),(37,'Argentina','Buenos Aires',-34.6075682,-58.4370894),(38,'Argentina','Entre Ríos',-31.6252842,-59.3539578),(39,'Argentina','Salta',-25.1076701,-64.3494964),(40,'Argentina','Córdoba',37.8845813,-4.7760138),(41,'Argentina','Mendoza',-34.7870930,-68.4381868),(42,'Argentina','Santa Fé',35.6876096,-105.9384560),(43,'Argentina','unknown',NULL,NULL),(44,'Argentina','Santiago Del Estero',-27.6431016,-63.5408542),(45,'Argentina','Misiones',-26.7372240,-54.4315257),(46,'Argentina','Catamarca',-27.1910825,-67.1053740),(47,'Argentina','Formosa',23.9739374,120.9820179),(48,'Argentina','Jujuy',-23.3161458,-65.7595288),(49,'Argentina','La Rioja',42.2814642,-2.4828050),(50,'Argentina','La Pampa',-37.2314643,-65.3972948),(51,'Argentina','San Juan',18.4652990,-66.1166660),(52,'Argentina','San Luis',38.6280278,-90.1910154),(53,'Argentina','Tucumán',-26.5643582,-64.8823970);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28 12:50:00
