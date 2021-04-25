-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema etramites
--

CREATE DATABASE IF NOT EXISTS etramites;
USE etramites;

--
-- Definition of table `anexos`
--

DROP TABLE IF EXISTS `anexos`;
CREATE TABLE `anexos` (
  `id_anexo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `ruta_documentos` varchar(450) NOT NULL,
  `avance_entregables` varchar(450) NOT NULL,
  `indicadores_impacto` varchar(450) NOT NULL,
  `comprobantes_egresos` varchar(450) NOT NULL,
  `formato` varchar(450) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_anexo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anexos`
--

/*!40000 ALTER TABLE `anexos` DISABLE KEYS */;
INSERT INTO `anexos` (`id_anexo`,`id_registro`,`ruta_documentos`,`avance_entregables`,`indicadores_impacto`,`comprobantes_egresos`,`formato`,`fecha_registro`) VALUES 
 (1,1,'Archivos/2020/1','8QLzXGO_.pdf','13_enriquez_rodriguez_1.PDF','13T0on3z.pdf','40langrefe.pdf','2020-08-17 09:15:41');
/*!40000 ALTER TABLE `anexos` ENABLE KEYS */;


--
-- Definition of table `avance_entregables`
--

DROP TABLE IF EXISTS `avance_entregables`;
CREATE TABLE `avance_entregables` (
  `id_avanceent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `clave` varchar(45) NOT NULL,
  `valor_objetivo` float NOT NULL,
  `actual` float NOT NULL,
  `porcentaje_ponderacion` float NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_avanceent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avance_entregables`
--

/*!40000 ALTER TABLE `avance_entregables` DISABLE KEYS */;
INSERT INTO `avance_entregables` (`id_avanceent`,`id_registro`,`clave`,`valor_objetivo`,`actual`,`porcentaje_ponderacion`,`fecha_registro`) VALUES 
 (1,1,'111',1,1,1,'2020-08-10 00:00:00'),
 (2,2,'1',2,2,2,'2020-08-14 11:51:20');
/*!40000 ALTER TABLE `avance_entregables` ENABLE KEYS */;


--
-- Definition of table `avance_indicadores`
--

DROP TABLE IF EXISTS `avance_indicadores`;
CREATE TABLE `avance_indicadores` (
  `id_avance_ind` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `clave` varchar(45) NOT NULL,
  `valor_objetivo` varchar(45) NOT NULL,
  `valor_actual` varchar(45) NOT NULL,
  `porcentaje_ponderacion` float NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_avance_ind`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avance_indicadores`
--

/*!40000 ALTER TABLE `avance_indicadores` DISABLE KEYS */;
INSERT INTO `avance_indicadores` (`id_avance_ind`,`id_registro`,`clave`,`valor_objetivo`,`valor_actual`,`porcentaje_ponderacion`,`fecha_registro`) VALUES 
 (1,1,'1','2','2',3,'2020-08-04 22:25:20'),
 (2,2,'1','1','1',2,'2020-08-14 11:51:45');
/*!40000 ALTER TABLE `avance_indicadores` ENABLE KEYS */;


--
-- Definition of table `comprobante_egresos`
--

DROP TABLE IF EXISTS `comprobante_egresos`;
CREATE TABLE `comprobante_egresos` (
  `id_comprobante` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `clave` varchar(45) NOT NULL,
  `concepto` varchar(45) NOT NULL,
  `num_comprobantes` varchar(45) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `monto_factura` float NOT NULL,
  `monto_prosoft` float NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_comprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comprobante_egresos`
--

/*!40000 ALTER TABLE `comprobante_egresos` DISABLE KEYS */;
INSERT INTO `comprobante_egresos` (`id_comprobante`,`id_registro`,`clave`,`concepto`,`num_comprobantes`,`RFC`,`monto_factura`,`monto_prosoft`,`fecha_registro`) VALUES 
 (1,1,'1','2','1','togr8003261r2',100,100,'2020-08-05 19:49:38'),
 (2,2,'2','2','2','togr8003261r2',2,2,'2020-08-14 11:52:02');
/*!40000 ALTER TABLE `comprobante_egresos` ENABLE KEYS */;


--
-- Definition of table `documentosae`
--

DROP TABLE IF EXISTS `documentosae`;
CREATE TABLE `documentosae` (
  `id_documentos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registroae` int(10) unsigned NOT NULL,
  `ruta` varchar(450) NOT NULL,
  `certificado` varchar(450) DEFAULT NULL,
  `curricula` varchar(450) NOT NULL,
  `formato` varchar(450) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_documentos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documentosae`
--

/*!40000 ALTER TABLE `documentosae` DISABLE KEYS */;
INSERT INTO `documentosae` (`id_documentos`,`id_registroae`,`ruta`,`certificado`,`curricula`,`formato`,`fecha_registro`) VALUES 
 (1,1,'Archivos/2020/1','8QLzXGO_(2).pdf','8QLzXGO_(1).pdf','13_enriquez_rodriguez_1.PDF','2020-08-28 12:42:58');
/*!40000 ALTER TABLE `documentosae` ENABLE KEYS */;


--
-- Definition of table `entregables_ae`
--

DROP TABLE IF EXISTS `entregables_ae`;
CREATE TABLE `entregables_ae` (
  `id_entregableae` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registroae` int(10) unsigned NOT NULL,
  `con_entregable` varchar(450) NOT NULL,
  `ent_original` varchar(450) NOT NULL,
  `ent_modificado` varchar(450) NOT NULL,
  `costo_original` float NOT NULL,
  `costo_modificado` float NOT NULL,
  `justificacion` varchar(450) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_entregableae`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entregables_ae`
--

/*!40000 ALTER TABLE `entregables_ae` DISABLE KEYS */;
INSERT INTO `entregables_ae` (`id_entregableae`,`id_registroae`,`con_entregable`,`ent_original`,`ent_modificado`,`costo_original`,`costo_modificado`,`justificacion`,`fecha_registro`) VALUES 
 (3,1,'1','1','1',1,1,'1','2020-09-02 12:29:43');
/*!40000 ALTER TABLE `entregables_ae` ENABLE KEYS */;


--
-- Definition of table `folio`
--

DROP TABLE IF EXISTS `folio`;
CREATE TABLE `folio` (
  `id_folio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `folio` varchar(45) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_folio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `folio`
--

/*!40000 ALTER TABLE `folio` DISABLE KEYS */;
INSERT INTO `folio` (`id_folio`,`id_registro`,`folio`,`fecha_registro`) VALUES 
 (2,1,'SE-FO-06-018-0000001','2020-09-01 15:37:36');
/*!40000 ALTER TABLE `folio` ENABLE KEYS */;


--
-- Definition of table `folio_ae`
--

DROP TABLE IF EXISTS `folio_ae`;
CREATE TABLE `folio_ae` (
  `id_folio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registroae` int(10) unsigned NOT NULL,
  `folio` varchar(45) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_folio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `folio_ae`
--

/*!40000 ALTER TABLE `folio_ae` DISABLE KEYS */;
INSERT INTO `folio_ae` (`id_folio`,`id_registroae`,`folio`,`fecha_registro`) VALUES 
 (1,1,'SE-FO-06-027-0000001','2020-09-01 14:24:33'),
 (2,1,'SE-FO-06-027-0000002','2020-09-01 23:31:24'),
 (3,1,'SE-FO-06-027-0000003','2020-09-01 23:31:24'),
 (4,1,'SE-FO-06-027-0000004','2020-09-02 12:25:34'),
 (5,1,'SE-FO-06-027-0000005','2020-09-02 12:31:12');
/*!40000 ALTER TABLE `folio_ae` ENABLE KEYS */;


--
-- Definition of table `indicadores_impacto`
--

DROP TABLE IF EXISTS `indicadores_impacto`;
CREATE TABLE `indicadores_impacto` (
  `id_indicadores` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `clave` varchar(45) NOT NULL,
  `indicador` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_indicadores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indicadores_impacto`
--

/*!40000 ALTER TABLE `indicadores_impacto` DISABLE KEYS */;
INSERT INTO `indicadores_impacto` (`id_indicadores`,`id_registro`,`clave`,`indicador`,`valor`,`fecha_registro`) VALUES 
 (1,1,'1','1','1','2020-08-10 00:00:00'),
 (2,2,'1','2','2','2020-08-14 11:51:31');
/*!40000 ALTER TABLE `indicadores_impacto` ENABLE KEYS */;


--
-- Definition of table `inversion`
--

DROP TABLE IF EXISTS `inversion`;
CREATE TABLE `inversion` (
  `id_inversion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `monto_ejercido_se1` float NOT NULL,
  `monto_solicitud_se1` float NOT NULL,
  `monto_ejercido_se2` float NOT NULL,
  `monto_solicitud_se2` float NOT NULL,
  `monto_ejercido_ef1` float NOT NULL,
  `monto_solicitud_ef1` float NOT NULL,
  `monto_ejercido_ef2` float NOT NULL,
  `monto_solicitud_ef2` float NOT NULL,
  `monto_ejercido_ip1` float NOT NULL,
  `monto_solicitud_ip1` float NOT NULL,
  `monto_ejercido_ip2` float NOT NULL,
  `monto_solicitud_ip2` float NOT NULL,
  `monto_ejercido_a1` float NOT NULL,
  `monto_solicitud_a1` float NOT NULL,
  `monto_ejercido_a2` float NOT NULL,
  `monto_solicitud_a2` float NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_inversion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inversion`
--

/*!40000 ALTER TABLE `inversion` DISABLE KEYS */;
INSERT INTO `inversion` (`id_inversion`,`id_registro`,`monto_ejercido_se1`,`monto_solicitud_se1`,`monto_ejercido_se2`,`monto_solicitud_se2`,`monto_ejercido_ef1`,`monto_solicitud_ef1`,`monto_ejercido_ef2`,`monto_solicitud_ef2`,`monto_ejercido_ip1`,`monto_solicitud_ip1`,`monto_ejercido_ip2`,`monto_solicitud_ip2`,`monto_ejercido_a1`,`monto_solicitud_a1`,`monto_ejercido_a2`,`monto_solicitud_a2`,`fecha_registro`) VALUES 
 (1,1,1,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,'2020-08-27 12:37:41'),
 (3,2,20,30,200,200,0,0,0,0,0,0,0,0,0,0,0,0,'2020-08-14 11:54:33');
/*!40000 ALTER TABLE `inversion` ENABLE KEYS */;


--
-- Definition of table `listado_entregables`
--

DROP TABLE IF EXISTS `listado_entregables`;
CREATE TABLE `listado_entregables` (
  `id_entregable` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `clave` varchar(45) NOT NULL,
  `rubro` varchar(45) NOT NULL,
  `concepto` text NOT NULL,
  `entregable` text NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_entregable`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listado_entregables`
--

/*!40000 ALTER TABLE `listado_entregables` DISABLE KEYS */;
INSERT INTO `listado_entregables` (`id_entregable`,`id_registro`,`clave`,`rubro`,`concepto`,`entregable`,`fecha_registro`) VALUES 
 (1,1,'1','1','1','1','2020-08-10 00:00:00'),
 (2,2,'1','1','1','1','2020-08-14 11:51:08');
/*!40000 ALTER TABLE `listado_entregables` ENABLE KEYS */;


--
-- Definition of table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id_proveedores` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registroae` int(10) unsigned NOT NULL,
  `nombre_proveedor` varchar(450) NOT NULL,
  `justificacion` text NOT NULL,
  `aclaracion` text NOT NULL,
  `solicitudes` text NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_proveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proveedores`
--

/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` (`id_proveedores`,`id_registroae`,`nombre_proveedor`,`justificacion`,`aclaracion`,`solicitudes`,`fecha_registro`) VALUES 
 (1,1,'prueba','prueba','x','x','2020-09-02 12:31:43');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;


--
-- Definition of table `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE `registro` (
  `registro_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(450) NOT NULL,
  `nombre` varchar(450) NOT NULL,
  `ap_paterno` varchar(450) NOT NULL,
  `ap_materno` varchar(450) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `folio_proyecto` varchar(45) NOT NULL,
  `responsable_seguimiento` varchar(450) NOT NULL,
  `fecha_convenio` date NOT NULL,
  `nombre_proyecto` varchar(450) NOT NULL,
  `numero_electronico` varchar(45) NOT NULL,
  `correo` varchar(450) NOT NULL,
  `lada1` varchar(3) NOT NULL,
  `telefono_fijo` varchar(10) NOT NULL,
  `lada2` varchar(5) NOT NULL,
  `telefono_movil` varchar(10) NOT NULL,
  `pagina_web` varchar(450) NOT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fin` date NOT NULL,
  `tipo_reporte` varchar(6) NOT NULL,
  `resoluciones` varchar(450) NOT NULL,
  `beneficiario` text NOT NULL,
  `objetivo_general` text NOT NULL,
  `objetivo_especifico` text NOT NULL,
  `finalidades_adicionales` varchar(45) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`registro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registro`
--

/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` (`registro_id`,`razon_social`,`nombre`,`ap_paterno`,`ap_materno`,`rfc`,`entidad`,`folio_proyecto`,`responsable_seguimiento`,`fecha_convenio`,`nombre_proyecto`,`numero_electronico`,`correo`,`lada1`,`telefono_fijo`,`lada2`,`telefono_movil`,`pagina_web`,`periodo_inicio`,`periodo_fin`,`tipo_reporte`,`resoluciones`,`beneficiario`,`objetivo_general`,`objetivo_especifico`,`finalidades_adicionales`,`fecha_registro`) VALUES 
 (1,'prueba','prueba','prueba','prueba','TOGR8003261R2',5,'123','prueba','2020-02-08','prueba','123','raul.torrescano@economia.gob.mx','111','1111111111','11111','1111111111','web','2020-02-08','2020-02-08','1erSem','123','prueba','prueba','prueba','Si','2020-08-27 12:37:24'),
 (2,'a','a','a','a','AOJP840712MP1',5,'1','aaa','2020-08-14','a','a','a@h.com','111','1111111111','11111','1111111111','111','2020-08-14','2020-08-14','1erSem','1','1','1','1','Si','2020-08-14 11:49:54');
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;


--
-- Definition of table `registro_ae`
--

DROP TABLE IF EXISTS `registro_ae`;
CREATE TABLE `registro_ae` (
  `registroae_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(450) NOT NULL,
  `nombre` varchar(450) NOT NULL,
  `ap_paterno` varchar(450) NOT NULL,
  `ap_materno` varchar(450) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `folio_proyecto` varchar(45) NOT NULL,
  `fecha_convenio` date NOT NULL,
  `nombre_proyecto` varchar(450) NOT NULL,
  `numero_electronico` varchar(45) NOT NULL,
  `correo` varchar(450) NOT NULL,
  `lada1` varchar(3) NOT NULL,
  `telefono_fijo` varchar(10) NOT NULL,
  `lada2` varchar(5) NOT NULL,
  `telefono_movil` varchar(10) NOT NULL,
  `mod_sol` varchar(450) NOT NULL,
  `justificacion` varchar(450) NOT NULL,
  `fecha_cierre` date NOT NULL,
  `fecha_original` date NOT NULL,
  `fecha_propuesta` date NOT NULL,
  `num_prorrogas` int(10) NOT NULL,
  `finalidades_adicionales` varchar(45) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`registroae_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registro_ae`
--

/*!40000 ALTER TABLE `registro_ae` DISABLE KEYS */;
INSERT INTO `registro_ae` (`registroae_id`,`razon_social`,`nombre`,`ap_paterno`,`ap_materno`,`rfc`,`folio_proyecto`,`fecha_convenio`,`nombre_proyecto`,`numero_electronico`,`correo`,`lada1`,`telefono_fijo`,`lada2`,`telefono_movil`,`mod_sol`,`justificacion`,`fecha_cierre`,`fecha_original`,`fecha_propuesta`,`num_prorrogas`,`finalidades_adicionales`,`fecha_registro`) VALUES 
 (1,'prueba','x','x','x','TOGR8003261R2','1','2020-08-27','1','123','raul.torrescano@economia.gob.mx','111','1111111111','11111','1111111111','prueba','prueba','2020-08-27','2020-08-27','2020-08-27',1,'Si','2020-09-02 12:29:30');
/*!40000 ALTER TABLE `registro_ae` ENABLE KEYS */;


--
-- Definition of table `resumen_avances`
--

DROP TABLE IF EXISTS `resumen_avances`;
CREATE TABLE `resumen_avances` (
  `id_resumen` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registro` int(10) unsigned NOT NULL,
  `avance_fisico` float NOT NULL,
  `avance_impacto` float NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_resumen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resumen_avances`
--

/*!40000 ALTER TABLE `resumen_avances` DISABLE KEYS */;
INSERT INTO `resumen_avances` (`id_resumen`,`id_registro`,`avance_fisico`,`avance_impacto`,`fecha_registro`) VALUES 
 (1,1,1,2,'2020-08-27 12:37:41'),
 (2,2,100,100,'2020-08-14 11:54:33');
/*!40000 ALTER TABLE `resumen_avances` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
