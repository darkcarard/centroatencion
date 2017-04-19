CREATE DATABASE  IF NOT EXISTS `centro_atencion` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `centro_atencion`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: centro_atencion
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `centro_medico`
--

DROP TABLE IF EXISTS `centro_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada Centro Médico',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del Centro Médico',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'Descripción del Centro Médico',
  `dirección` varchar(120) NOT NULL COMMENT 'dirección del Centro Médico',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Centros médicos afiliados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_medico`
--

LOCK TABLES `centro_medico` WRITE;
/*!40000 ALTER TABLE `centro_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_medico_persona`
--

DROP TABLE IF EXISTS `centro_medico_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_medico_persona` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada elemento de la tabla',
  `centro_medico` int(11) NOT NULL COMMENT 'Llave foránea con la tabla centro_medico',
  `persona` int(11) NOT NULL COMMENT 'Llave foránea con la tabla persona',
  PRIMARY KEY (`id`),
  KEY `fk_persona_id_idx` (`persona`),
  KEY `fk_centro_medico_id_idx` (`centro_medico`),
  CONSTRAINT `fk_centromedicopersona_cm` FOREIGN KEY (`centro_medico`) REFERENCES `centro_medico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_centromedicopersona_persona` FOREIGN KEY (`persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de relación entre los Centros médicos y las personas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_medico_persona`
--

LOCK TABLES `centro_medico_persona` WRITE;
/*!40000 ALTER TABLE `centro_medico_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_medico_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnostico` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada diagnóstico',
  `descripcion` varchar(500) NOT NULL COMMENT 'Descripción del diagnóstico realizado',
  `medico` int(11) NOT NULL COMMENT 'Persona de tipo médico que realizó el diagnóstico. Llave foránea con la tabla Persona.',
  `paciente` int(11) NOT NULL COMMENT 'Persona de tipo paciente a la que se realizó el diagnóstico. Llave foránea con la tabla Persona.',
  `signos` bigint(9) NOT NULL COMMENT 'Signos vitales presentados en el diagnóstico. Llave foránea con la tabla Signos.',
  PRIMARY KEY (`id`),
  KEY `fk_medico_id_idx` (`medico`),
  KEY `fk_paciente_id_idx` (`paciente`),
  KEY `fk_signos_id_idx` (`signos`),
  CONSTRAINT `fk_diagnostico_medico` FOREIGN KEY (`medico`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostico_paciente` FOREIGN KEY (`paciente`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostico_signos` FOREIGN KEY (`signos`) REFERENCES `signos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Diagnosticos realizados a los pacientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada enfermedad registrada en la aplicación',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre de la enfermedad',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'Descripción de los datos más importantes de la enfermedad',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enfermedades que están registradas en el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad`
--

LOCK TABLES `enfermedad` WRITE;
/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad_persona`
--

DROP TABLE IF EXISTS `enfermedad_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad_persona` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada una de las relaciones de la tabla',
  `enfermedad` int(11) NOT NULL COMMENT 'Enfermedad que padece el paciente. Llave foránea con la tabla Enfermedad',
  `persona` int(11) NOT NULL COMMENT 'Persona que padece la enfermedad. Llave foránea con la tabla Persona',
  PRIMARY KEY (`id`),
  KEY `fk_enfermedad_id_idx` (`enfermedad`),
  KEY `fk_persona_id_idx` (`persona`),
  CONSTRAINT `fk_enfermedadpersona_enfermedad` FOREIGN KEY (`enfermedad`) REFERENCES `enfermedad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfermedadpersona_persona` FOREIGN KEY (`persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de relación entre las enfermedades y las personas que las padecen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad_persona`
--

LOCK TABLES `enfermedad_persona` WRITE;
/*!40000 ALTER TABLE `enfermedad_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedad_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del medicamento',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del medicamento',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'Descripción detallada del medicamento',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Medicamentos registrados en el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento_persona`
--

DROP TABLE IF EXISTS `medicamento_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada relación',
  `medicamento` int(11) NOT NULL COMMENT 'Identificador del medicamento. Llave foránea con la tabla Medicamento',
  `persona` int(11) NOT NULL COMMENT 'Identificador de la persona. Llave foránea con la tabla Persona',
  PRIMARY KEY (`id`),
  KEY `fk_medicamentopersona_medicamento_idx` (`medicamento`),
  KEY `fk_medicamentopersona_persona_idx` (`persona`),
  CONSTRAINT `fk_medicamentopersona_medicamento` FOREIGN KEY (`medicamento`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicamentopersona_persona` FOREIGN KEY (`persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que relaciona cada persona con los medicamentos recetados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento_persona`
--

LOCK TABLES `medicamento_persona` WRITE;
/*!40000 ALTER TABLE `medicamento_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada menú',
  `padre` int(11) DEFAULT NULL COMMENT 'Identificador del menú padre. Si es un menú padre es nulo.',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del menú. Este es el que se visualiza en las vistas de la aplicación.',
  `outcome` varchar(20) NOT NULL COMMENT 'Outcome de la navegación JSF que dirige a la página relacionada a este menú',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción corta del menú. Esta se puede visualizar como un tooltip en la aplicación',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Información de los menús de la aplicación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_rol`
--

DROP TABLE IF EXISTS `menu_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada relación',
  `menu` int(11) NOT NULL COMMENT 'Identificador del menú que puede ver el rol. Llave foránea con la tablas Menu.',
  `rol` int(11) NOT NULL COMMENT 'Identificador del rol autorizado para ver el menú. Llave foránea con la tabla Rol.',
  PRIMARY KEY (`id`),
  KEY `fk_menurol_menu_idx` (`menu`),
  KEY `fk_menurol_rol_idx` (`rol`),
  CONSTRAINT `fk_menurol_menu` FOREIGN KEY (`menu`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menurol_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de relación entre los menus y los roles permitidos para verlos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_rol`
--

LOCK TABLES `menu_rol` WRITE;
/*!40000 ALTER TABLE `menu_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador interno de cada persona registrada en la aplicación',
  `tipo_identificacion` int(11) NOT NULL COMMENT 'Id del tipo de identificación que tiene la persona. Llave foránea con la tabla tipo_identificacion. Campo obligatorio.',
  `identificacion` varchar(45) NOT NULL COMMENT 'Número de documento de identidad de la persona. Campo obligatorio.',
  `nombre` varchar(200) NOT NULL COMMENT 'Nombre completo de la persona. Campo obligatorio.',
  `correo_electronico` varchar(200) DEFAULT NULL COMMENT 'correo electrónico de la persona',
  `telefono_fijo` varchar(25) DEFAULT NULL COMMENT 'teléfono fijo de la persona',
  `telefono_celular` varchar(25) NOT NULL COMMENT 'Número de teléfono celular de la persona. Campo obligatorio.',
  `direccion` varchar(100) NOT NULL COMMENT 'Dirección de la persona.',
  `tipo_persona` int(11) NOT NULL COMMENT 'tipo de la persona: puede ser paciente, médico, persona a cargo, etc. Llave foránea con la tabla tipo_persona',
  PRIMARY KEY (`id`),
  KEY `fk_tipo_persona_idx` (`tipo_persona`),
  KEY `fk_tipo_identificacion_idx` (`tipo_identificacion`),
  CONSTRAINT `fk_persona_tipoidentificacion` FOREIGN KEY (`tipo_identificacion`) REFERENCES `tipo_identificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_tipopersona` FOREIGN KEY (`tipo_persona`) REFERENCES `tipo_persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datos principales de cada persona perteneciente a la aplicación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada rol',
  `nombre` varchar(25) NOT NULL COMMENT 'Nombre del rol',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Breve descripción de las funciones del rol',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Roles para los usuarios de la aplicación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signos`
--

DROP TABLE IF EXISTS `signos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signos` (
  `id` bigint(9) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada signo vital',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del signo vital',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'descripción del signo vital',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datos de los signos tomados en el diagnóstico realizado al paciente vía consulta o dispositivos caseros';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signos`
--

LOCK TABLES `signos` WRITE;
/*!40000 ALTER TABLE `signos` DISABLE KEYS */;
/*!40000 ALTER TABLE `signos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_identificacion`
--

DROP TABLE IF EXISTS `tipo_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_identificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada tipo de identificación',
  `Nombre` varchar(50) NOT NULL COMMENT 'Nombre del tipo de identificación. Puede ser: cédula, tarjeta de identidad, pasaporte, etc.',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción corta del tipo de identificación',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipo de identificación de una persona: Tarjeta de Identidad, cédula, pasaporte, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_identificacion`
--

LOCK TABLES `tipo_identificacion` WRITE;
/*!40000 ALTER TABLE `tipo_identificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_persona`
--

DROP TABLE IF EXISTS `tipo_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada tipo de persona',
  `Nombre` varchar(50) NOT NULL COMMENT 'Nombre del tipo de persona. Puede ser: médico, paciente, persona a cargo, etc.',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción corta del tipo de persona',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipos de persona de la aplicación: médicos, pacientes y personas a Cargo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_persona`
--

LOCK TABLES `tipo_persona` WRITE;
/*!40000 ALTER TABLE `tipo_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador interno de los usuarios de la aplicación',
  `persona` int(11) NOT NULL COMMENT 'Identificador de la persona. Llave foránea con la tabla Persona',
  `clave` varchar(100) NOT NULL COMMENT 'Clave para ingreso a la aplicación. La clave está hasheada mediante SHA1.',
  `rol` int(11) NOT NULL COMMENT 'Identificador del Rol de la persona en la aplicación. Llave foránea con la tabla Rol.',
  PRIMARY KEY (`id`),
  KEY `fk_usuario_rol_idx` (`rol`),
  KEY `fk_usuario_persona_idx` (`persona`),
  CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datos referentes a los usuarios que acceden a la aplicación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-19 12:31:57
