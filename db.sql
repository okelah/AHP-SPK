/*
SQLyog Enterprise - MySQL GUI v7.14 
MySQL - 5.0.27-community-nt-log : Database - db_ahp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_ahp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_ahp`;

/*Table structure for table `bobot_kriteria` */

DROP TABLE IF EXISTS `bobot_kriteria`;

CREATE TABLE `bobot_kriteria` (
  `nama_kriteria` varchar(30) default NULL,
  `value` double(10,2) default NULL,
  `x(baris)` int(9) default NULL,
  `y(kolomn)` int(9) default NULL,
  KEY `FK_bobot_kriteria` (`nama_kriteria`),
  CONSTRAINT `FK_bobot_kriteria` FOREIGN KEY (`nama_kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bobot_kriteria` */

insert  into `bobot_kriteria`(`nama_kriteria`,`value`,`x(baris)`,`y(kolomn)`) values ('Penghasilan',1.00,0,1),('Penghasilan',2.00,0,2),('Penghasilan',2.00,0,3),('Penghasilan',3.00,0,4),('Penghasilan',5.00,0,5),('tanggungan_dibawah_15_th',0.50,1,1),('tanggungan_dibawah_15_th',1.00,1,2),('tanggungan_dibawah_15_th',2.00,1,3),('tanggungan_dibawah_15_th',2.00,1,4),('tanggungan_dibawah_15_th',3.00,1,5),('tanggungan_di_atas_15_th',0.50,2,1),('tanggungan_di_atas_15_th',0.50,2,2),('tanggungan_di_atas_15_th',1.00,2,3),('tanggungan_di_atas_15_th',3.00,2,4),('tanggungan_di_atas_15_th',3.00,2,5),('pekerjaan',0.33,3,1),('pekerjaan',0.50,3,2),('pekerjaan',0.33,3,3),('pekerjaan',1.00,3,4),('pekerjaan',3.00,3,5),('Status',0.20,4,1),('Status',0.33,4,2),('Status',0.33,4,3),('Status',0.33,4,4),('Status',1.00,4,5);

/*Table structure for table `bobot_sub_kriteria` */

DROP TABLE IF EXISTS `bobot_sub_kriteria`;

CREATE TABLE `bobot_sub_kriteria` (
  `Nama_kriteria` varchar(30) default NULL,
  `nama_sub` varchar(50) default NULL,
  `value` double(10,2) default NULL,
  `x(baris)` int(9) default NULL,
  `y(kolomn)` int(9) default NULL,
  KEY `FK_bobot_sub_kriteria` (`Nama_kriteria`),
  CONSTRAINT `FK_bobot_sub_kriteria` FOREIGN KEY (`Nama_kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bobot_sub_kriteria` */

insert  into `bobot_sub_kriteria`(`Nama_kriteria`,`nama_sub`,`value`,`x(baris)`,`y(kolomn)`) values ('tanggungan_dibawah_15_th','banyak',2.00,0,2),('Penghasilan','>UMR',1.00,1,2),('Penghasilan','>UMR',0.50,1,1),('Penghasilan','<UMR',2.00,0,2),('Penghasilan','<UMR',1.00,0,1),('tanggungan_dibawah_15_th','banyak',1.00,0,1),('Pekerjaan','tetap',1.00,1,2),('Pekerjaan','tidak',1.00,0,1),('Pekerjaan','tidak',2.00,0,2),('Pekerjaan','tetap',0.50,1,1),('tanggungan_dibawah_15_th','sedikit',0.50,1,1),('tanggungan_dibawah_15_th','sedikit',1.00,1,2),('tanggungan_di_atas_15_th','banyak',1.00,0,1),('tanggungan_di_atas_15_th','banyak',2.00,0,2),('tanggungan_di_atas_15_th','sedikit',0.50,1,1),('tanggungan_di_atas_15_th','sedikit',1.00,1,2);

/*Table structure for table `hasil_bobot` */

DROP TABLE IF EXISTS `hasil_bobot`;

CREATE TABLE `hasil_bobot` (
  `jml` double(10,3) default NULL,
  `n` double(10,3) default NULL,
  `max` double(10,3) default NULL,
  `CI` double(10,3) default NULL,
  `CR` double(10,3) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `hasil_bobot` */

insert  into `hasil_bobot`(`jml`,`n`,`max`,`CI`,`CR`) values (10.268,5.000,2.054,-0.589,-0.526);

/*Table structure for table `hasil_sub_bobot` */

DROP TABLE IF EXISTS `hasil_sub_bobot`;

CREATE TABLE `hasil_sub_bobot` (
  `Nama_Kriteria` varchar(50) default NULL,
  `jml` double(10,3) default NULL,
  `n` double(10,3) default NULL,
  `max` double(10,3) default NULL,
  `CI` double(10,3) default NULL,
  `CR` double(10,3) default NULL,
  KEY `FK_hasil_sub_bobot` (`Nama_Kriteria`),
  CONSTRAINT `FK_hasil_sub_bobot` FOREIGN KEY (`Nama_Kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hasil_sub_bobot` */

insert  into `hasil_sub_bobot`(`Nama_Kriteria`,`jml`,`n`,`max`,`CI`,`CR`) values ('tanggungan_dibawah_15_th',5.250,2.000,2.625,0.313,0.279),('Pekerjaan',5.250,2.000,2.625,0.313,0.279),('Penghasilan',5.250,2.000,2.625,0.313,0.279),('Status',5.250,2.000,2.625,0.313,0.279),('tanggungan_di_atas_15_th',5.250,2.000,2.625,0.313,0.279);

/*Table structure for table `subprioritas` */

DROP TABLE IF EXISTS `subprioritas`;

CREATE TABLE `subprioritas` (
  `Kriteria` varchar(30) default NULL,
  `SubKriteria` varchar(30) default NULL,
  `Nilai` double(10,2) default NULL,
  KEY `FK_subprioritas` (`Kriteria`),
  CONSTRAINT `FK_subprioritas` FOREIGN KEY (`Kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `subprioritas` */

insert  into `subprioritas`(`Kriteria`,`SubKriteria`,`Nilai`) values ('Penghasilan','>UMR',0.50),('Penghasilan','<UMR',1.00),('Status','Pribadi',0.50),('Status','Sewa',1.00),('Pekerjaan','tetap',0.50),('Pekerjaan','tidak',1.00),('tanggungan_dibawah_15_th','banyak',1.00),('tanggungan_dibawah_15_th','sedikit',0.50),('tanggungan_di_atas_15_th','banyak',1.00),('tanggungan_di_atas_15_th','sedikit',0.50);

/*Table structure for table `tbl_kriteria` */

DROP TABLE IF EXISTS `tbl_kriteria`;

CREATE TABLE `tbl_kriteria` (
  `kodeKriteria` int(9) NOT NULL,
  `NamaKriteria` varchar(30) NOT NULL,
  PRIMARY KEY  (`NamaKriteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_kriteria` */

insert  into `tbl_kriteria`(`kodeKriteria`,`NamaKriteria`) values (4,'pekerjaan'),(1,'Penghasilan'),(5,'Status'),(2,'tanggungan_dibawah_15_th'),(3,'tanggungan_di_atas_15_th');

/*Table structure for table `tbl_kriteria_penduduk` */

DROP TABLE IF EXISTS `tbl_kriteria_penduduk`;

CREATE TABLE `tbl_kriteria_penduduk` (
  `No` int(11) NOT NULL auto_increment,
  `NoKK` char(22) default NULL,
  `Kriteria` varchar(30) default NULL,
  `SUB` varchar(30) default NULL,
  `Nilai` double(10,2) default NULL,
  PRIMARY KEY  (`No`),
  UNIQUE KEY `No` (`No`),
  KEY `FK_tbl_kriteria_penduduk` (`Kriteria`),
  KEY `FK_tbl_kriteria_penduduk5` (`NoKK`),
  CONSTRAINT `FK_tbl_kriteria_penduduk` FOREIGN KEY (`Kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_kriteria_penduduk5` FOREIGN KEY (`NoKK`) REFERENCES `tbl_penduduk` (`NOKK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_kriteria_penduduk` */

insert  into `tbl_kriteria_penduduk`(`No`,`NoKK`,`Kriteria`,`SUB`,`Nilai`) values (149,'8927','pekerjaan','tetap',0.06),(150,'8927','Penghasilan','>UMR',0.19),(151,'8927','Status','Sewa',0.06),(152,'8927','tanggungan_dibawah_15_th','banyak',0.24),(153,'8927','tanggungan_di_atas_15_th','sedikit',0.10),(164,'99181','pekerjaan','tidak',0.12),(165,'99181','Penghasilan','<UMR',0.37),(166,'99181','Status','Sewa',0.06),(167,'99181','tanggungan_dibawah_15_th','banyak',0.24),(168,'99181','tanggungan_di_atas_15_th','banyak',0.20),(169,'12312','pekerjaan','tidak',0.12),(170,'12312','Penghasilan','>UMR',0.19),(171,'12312','Status','Sewa',0.06),(172,'12312','tanggungan_dibawah_15_th','banyak',0.24),(173,'12312','tanggungan_di_atas_15_th','banyak',0.20);

/*Table structure for table `tbl_login` */

DROP TABLE IF EXISTS `tbl_login`;

CREATE TABLE `tbl_login` (
  `username` varchar(30) default NULL,
  `password` varchar(30) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tbl_login` */

insert  into `tbl_login`(`username`,`password`) values ('123','123');

/*Table structure for table `tbl_penduduk` */

DROP TABLE IF EXISTS `tbl_penduduk`;

CREATE TABLE `tbl_penduduk` (
  `Nama` varchar(100) default NULL,
  `NOKK` char(22) NOT NULL,
  `Alamat` varchar(200) default NULL,
  PRIMARY KEY  (`NOKK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_penduduk` */

insert  into `tbl_penduduk`(`Nama`,`NOKK`,`Alamat`) values ('Rizki','1','Jl.Kelinci'),('PRASETYO','12','ALDHASJDH'),('Rizki','1231','kldnasldsaldnask'),('jojon','12312','asdlaldjskj'),('agung','3','Jl.Nusantara'),('Rizki','8927','Jl.Sultan Agung '),('rioajd','99181','zcjnx');

/*Table structure for table `tbl_prioritas` */

DROP TABLE IF EXISTS `tbl_prioritas`;

CREATE TABLE `tbl_prioritas` (
  `kriteria` varchar(30) default NULL,
  `Nilai` double(10,2) default NULL,
  KEY `FK_tbl_prioritas` (`kriteria`),
  CONSTRAINT `FK_tbl_prioritas` FOREIGN KEY (`kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_prioritas` */

insert  into `tbl_prioritas`(`kriteria`,`Nilai`) values ('pekerjaan',0.12),('Status',0.06),('tanggungan_di_atas_15_th',0.20),('Penghasilan',0.37),('tanggungan_dibawah_15_th',0.24);

/*Table structure for table `tbl_sub_kriteria` */

DROP TABLE IF EXISTS `tbl_sub_kriteria`;

CREATE TABLE `tbl_sub_kriteria` (
  `kode_sub` int(11) NOT NULL auto_increment,
  `Nama_Kriteria` varchar(50) default NULL,
  `Nama` varchar(50) NOT NULL,
  UNIQUE KEY `kode_sub` (`kode_sub`),
  KEY `FK_tbl_sub_kriteria` (`Nama_Kriteria`),
  CONSTRAINT `FK_tbl_sub_kriteria` FOREIGN KEY (`Nama_Kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_sub_kriteria` */

insert  into `tbl_sub_kriteria`(`kode_sub`,`Nama_Kriteria`,`Nama`) values (5,'Status','Sewa'),(6,'Status','Pribadi'),(7,'Penghasilan','<UMR'),(8,'Penghasilan','>UMR'),(9,'Pekerjaan','tidak'),(10,'Pekerjaan','tetap'),(66,'tanggungan_dibawah_15_th','banyak'),(67,'tanggungan_dibawah_15_th','sedikit'),(68,'tanggungan_di_atas_15_th','banyak'),(69,'tanggungan_di_atas_15_th','sedikit');

/*Table structure for table `tblpenrima` */

DROP TABLE IF EXISTS `tblpenrima`;

CREATE TABLE `tblpenrima` (
  `NoKK` varchar(15) NOT NULL,
  PRIMARY KEY  (`NoKK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tblpenrima` */

insert  into `tblpenrima`(`NoKK`) values ('12312'),('99181');

/* Procedure structure for procedure `simpan_kriteria_penduduk` */

/*!50003 DROP PROCEDURE IF EXISTS  `simpan_kriteria_penduduk` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `simpan_kriteria_penduduk`(NOKK VARCHAR(30),Kri VARCHAR(30),sub VARCHAR(30))
BEGIN
DECLARE nil DOUBLE(10,2);
DECLARE nil2 DOUBLE(10,2);
DECLARE hsl DOUBLE(10,2);
SELECT nilai into nil from SubPrioritas where kriteria=Kri and SubKriteria=sub;
SELECT nilai into nil2 from tbl_prioritas where kriteria=Kri;
set @hsl=nil2*nil;
insert into tbl_kriteria_penduduk value(null,NOKK,Kri,sub,@hsl);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `tampil_HASIL` */

/*!50003 DROP PROCEDURE IF EXISTS  `tampil_HASIL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_HASIL`()
BEGIN
SET @sql = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(Kriteria = ''',
      Kriteria,
      ''', nilai,0)) AS ',
      Kriteria
    )
  ) INTO @sql
FROM vpenduduk;
SET @sql = CONCAT('SELECT Nama, NOKK ,alamat,Kriteria,SUB,',@sql,',sum(nilai) As Hasil FROM vpenduduk 
GROUP BY NOKK having Kriteria=Kriteria and SUB=SUB  Order by Hasil desc' );
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `tampil_penduduk` */

/*!50003 DROP PROCEDURE IF EXISTS  `tampil_penduduk` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_penduduk`()
BEGIN
SET @sql = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(Kriteria = ''',
      Kriteria,
      ''', SUB, 0)) AS ',
      Kriteria
    )
  ) INTO @sql
FROM vpenduduk ;
SET @sql = CONCAT('SELECT Nama, NOKK ,alamat,Kriteria,',@sql,' FROM vpenduduk 
GROUP BY NOKK having Kriteria=Kriteria  Order by NOKK asc' );
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
    END */$$
DELIMITER ;

/*Table structure for table `vpenduduk` */

DROP TABLE IF EXISTS `vpenduduk`;

/*!50001 DROP VIEW IF EXISTS `vpenduduk` */;
/*!50001 DROP TABLE IF EXISTS `vpenduduk` */;

/*!50001 CREATE TABLE `vpenduduk` (
  `NO` int(11) NOT NULL default '0',
  `Nama` varchar(100) default NULL,
  `NOKK` char(22) NOT NULL,
  `Alamat` varchar(200) default NULL,
  `Kriteria` varchar(30) default NULL,
  `SUB` varchar(30) default NULL,
  `Nilai` double(10,2) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `vpenerima` */

DROP TABLE IF EXISTS `vpenerima`;

/*!50001 DROP VIEW IF EXISTS `vpenerima` */;
/*!50001 DROP TABLE IF EXISTS `vpenerima` */;

/*!50001 CREATE TABLE `vpenerima` (
  `NoKK` varchar(15) NOT NULL,
  `Nama` varchar(100) default NULL,
  `Alamat` varchar(200) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*View structure for view vpenduduk */

/*!50001 DROP TABLE IF EXISTS `vpenduduk` */;
/*!50001 DROP VIEW IF EXISTS `vpenduduk` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpenduduk` AS (select `tbl_kriteria_penduduk`.`No` AS `NO`,`tbl_penduduk`.`Nama` AS `Nama`,`tbl_penduduk`.`NOKK` AS `NOKK`,`tbl_penduduk`.`Alamat` AS `Alamat`,`tbl_kriteria_penduduk`.`Kriteria` AS `Kriteria`,`tbl_kriteria_penduduk`.`SUB` AS `SUB`,`tbl_kriteria_penduduk`.`Nilai` AS `Nilai` from (`tbl_kriteria_penduduk` join `tbl_penduduk` on((`tbl_kriteria_penduduk`.`NoKK` = `tbl_penduduk`.`NOKK`))) order by `tbl_kriteria_penduduk`.`No`) */;

/*View structure for view vpenerima */

/*!50001 DROP TABLE IF EXISTS `vpenerima` */;
/*!50001 DROP VIEW IF EXISTS `vpenerima` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpenerima` AS (select `tblpenrima`.`NoKK` AS `NoKK`,`tbl_penduduk`.`Nama` AS `Nama`,`tbl_penduduk`.`Alamat` AS `Alamat` from (`tbl_penduduk` join `tblpenrima` on((`tbl_penduduk`.`NOKK` = `tblpenrima`.`NoKK`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
