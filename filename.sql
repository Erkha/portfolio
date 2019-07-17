-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.19.04.1

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
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_590C103A76ED395` (`user_id`),
  CONSTRAINT `FK_590C103A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,1,'2019-02-25 00:00:00',NULL,'Développeur Web','Wild Code School','school','<p><span style=\"color:#484848\">Formation intensive au d&eacute;veloppement Web, sp&eacute;cialisation PHP/Symfony</span></p>\r\n\r\n<p><span style=\"color:#484848\">RNCP D&eacute;veloppeur logiciel, 2019</span></p>'),(2,1,'2011-01-10 00:00:00','2019-02-01 00:00:00','Responsable Qualité','SERAM','company','<ul>\r\n	<li><strong>Pilotage projets</strong><span style=\"color:#484848\"> transverses d&#39;am&eacute;lioration continue</span></li>\r\n	<li><span style=\"color:#484848\">Mise en &oelig;uvre certification ISO 9001</span></li>\r\n	<li><span style=\"color:#484848\">Gestion des r&eacute;clamations qualit&eacute; avec nos </span><strong>clients</strong></li>\r\n	<li><strong>Encadrement</strong><span style=\"color:#484848\"> </span><span style=\"color:#484848\">des &eacute;quipes Contr&ocirc;le</span></li>\r\n	<li><span style=\"color:#484848\">Travail quotidien avec nos </span><strong>&eacute;quipes Internationales</strong></li>\r\n	<li><span style=\"color:#484848\">Veille r&eacute;glementaire Produit</span></li>\r\n</ul>');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience_skill`
--

DROP TABLE IF EXISTS `experience_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience_skill` (
  `experience_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  PRIMARY KEY (`experience_id`,`skill_id`),
  KEY `IDX_3D6F986146E90E27` (`experience_id`),
  KEY `IDX_3D6F98615585C142` (`skill_id`),
  CONSTRAINT `FK_3D6F986146E90E27` FOREIGN KEY (`experience_id`) REFERENCES `experience` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3D6F98615585C142` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_skill`
--

LOCK TABLES `experience_skill` WRITE;
/*!40000 ALTER TABLE `experience_skill` DISABLE KEYS */;
INSERT INTO `experience_skill` VALUES (1,1),(1,5),(1,6),(1,7),(2,4);
/*!40000 ALTER TABLE `experience_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pfile`
--

DROP TABLE IF EXISTS `pfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_922BFEDE166D1F9C` (`project_id`),
  CONSTRAINT `FK_922BFEDE166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pfile`
--

LOCK TABLES `pfile` WRITE;
/*!40000 ALTER TABLE `pfile` DISABLE KEYS */;
INSERT INTO `pfile` VALUES (1,NULL,'git-5d2dce25c230c.png','logo git'),(2,NULL,'symfony-5d2ecb9a09f2e.jpeg','logo symfony'),(3,NULL,'php-5d2ecba8eaf10.png','logo php'),(4,NULL,'linux-5d2ecbb731101.png','logo linux'),(5,NULL,'js-5d2ecbd6cc4bd.png','logo JS'),(6,NULL,'bootstrap-5d2ecc06d1dc8.png','logo bootstrap'),(7,NULL,'wcs-5d2ecc1b5b3b3.png','wcs'),(8,NULL,'unitedkingdom2332854_960_720-5d2ecc507052a.png','logo EN'),(9,1,'mainsi-5d2f0ff1e0ed6.png','SIMain'),(11,1,'accueilsi-5d2f1bf160575.png','SIAccueil'),(12,1,'adminsi-5d2f20f198ab6.png','adminSI'),(13,NULL,'scrum-5d2f22415ae93.png','scrum logo');
/*!40000 ALTER TABLE `pfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2FB3D0EEA76ED395` (`user_id`),
  CONSTRAINT `FK_2FB3D0EEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'Festival Sens Interdits','<p><span style=\"color:#484848\">Refonte du site du festival &quot;Sens Interdits&quot;. Cr&eacute;ation d&#39;une interface d&#39;administration, gestion de contenus reflexifs, ... </span></p>',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_skill`
--

DROP TABLE IF EXISTS `project_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_skill` (
  `project_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`skill_id`),
  KEY `IDX_4D68EDE9166D1F9C` (`project_id`),
  KEY `IDX_4D68EDE95585C142` (`skill_id`),
  CONSTRAINT `FK_4D68EDE9166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4D68EDE95585C142` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_skill`
--

LOCK TABLES `project_skill` WRITE;
/*!40000 ALTER TABLE `project_skill` DISABLE KEYS */;
INSERT INTO `project_skill` VALUES (1,1),(1,5),(1,7),(1,11);
/*!40000 ALTER TABLE `project_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5E3DE477F98F144A` (`logo_id`),
  KEY `IDX_5E3DE477A76ED395` (`user_id`),
  CONSTRAINT `FK_5E3DE477A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_5E3DE477F98F144A` FOREIGN KEY (`logo_id`) REFERENCES `pfile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,1,1,'Git','tool'),(3,4,1,'Linux','tool'),(4,8,1,'Anglais','soft'),(5,2,1,'Symfony 4','hard'),(6,3,1,'PHP 7','hard'),(7,6,1,'Bootstrap 4','hard'),(11,13,1,'scrum','soft');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','[\"ROLE_ADMIN\"]','$argon2id$v=19$m=65536,t=6,p=1$3Uem9mXbOldZJ3fIC8OOZg$6G2SNIGCL08k6JLS6Cuw463LmKSsYwOiIbOgKmspkS8');
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

-- Dump completed on 2019-07-17 17:43:54
