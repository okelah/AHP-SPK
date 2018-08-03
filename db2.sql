/*
SQLyog Enterprise - MySQL GUI v7.14 
MySQL - 5.0.27-community-nt-log : Database - db_ahp
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;
/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db2_ahp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db2_ahp`;

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

/*Table structure for table `tbl_kriteria` */

DROP TABLE IF EXISTS `tbl_kriteria`;

CREATE TABLE `tbl_kriteria` (
  `kodeKriteria` int(9) NOT NULL,
  `NamaKriteria` varchar(30) NOT NULL,
  PRIMARY KEY  (`NamaKriteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 

CREATE TABLE `tbl_kriteria_pelamar` (
  `No` int(11) NOT NULL auto_increment,
  `NoKTP` char(22) default NULL,
  `Kriteria` varchar(30) default NULL,
  `SUB` varchar(30) default NULL,
  `Nilai` double(10,2) default NULL,
  PRIMARY KEY  (`No`),
  UNIQUE KEY `No` (`No`),
  KEY `FK_tbl_kriteria_pelamar` (`Kriteria`),
  KEY `FK_tbl_kriteria_pelamar5` (`NoKTP`),
  CONSTRAINT `FK_tbl_kriteria_pelamar` FOREIGN KEY (`Kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_kriteria_pelamar5` FOREIGN KEY (`NoKTP`) REFERENCES `tbl_pelamar` (`NoKTP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_kriteria_pelamar` */
 

/*Table structure for table `tbl_login` */

DROP TABLE IF EXISTS `tbl_login`;

CREATE TABLE `tbl_login` (
  `username` varchar(30) default NULL,
  `password` varchar(30) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tbl_login` */

insert  into `tbl_login`(`username`,`password`) values ('123','123');

/*Table structure for table `tbl_pelamar` */

DROP TABLE IF EXISTS `tbl_pelamar`;

CREATE TABLE `tbl_pelamar` (
  `Nama` varchar(100) default NULL,
  `NoKTP` char(22) NOT NULL,
  `Alamat` varchar(200) default NULL,
  PRIMARY KEY  (`NoKTP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_pelamar` */ 

/*Table structure for table `tbl_prioritas` */

DROP TABLE IF EXISTS `tbl_prioritas`;

CREATE TABLE `tbl_prioritas` (
  `kriteria` varchar(30) default NULL,
  `Nilai` double(10,2) default NULL,
  KEY `FK_tbl_prioritas` (`kriteria`),
  CONSTRAINT `FK_tbl_prioritas` FOREIGN KEY (`kriteria`) REFERENCES `tbl_kriteria` (`NamaKriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_prioritas` */
 

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
/*Table structure for table `tblpenrima` */

DROP TABLE IF EXISTS `tblpenrima`;

CREATE TABLE `tblpenrima` (
  `NoKTP` varchar(15) NOT NULL,
  PRIMARY KEY  (`NoKTP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tblpenrima` */ 

/* Procedure structure for procedure `simpan_kriteria_pelamar` */

/*!50003 DROP PROCEDURE IF EXISTS  `simpan_kriteria_pelamar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `simpan_kriteria_pelamar`(NoKTP VARCHAR(30),Kri VARCHAR(30),sub VARCHAR(30))
BEGIN
DECLARE nil DOUBLE(10,2);
DECLARE nil2 DOUBLE(10,2);
DECLARE hsl DOUBLE(10,2);
SELECT nilai into nil from SubPrioritas where kriteria=Kri and SubKriteria=sub;
SELECT nilai into nil2 from tbl_prioritas where kriteria=Kri;
set @hsl=nil2*nil;
insert into tbl_kriteria_pelamar value(null,NoKTP,Kri,sub,@hsl);
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
FROM vpelamar;
SET @sql = CONCAT('SELECT Nama, NoKTP ,alamat,Kriteria,SUB,',@sql,',sum(nilai) As Hasil FROM vpelamar 
GROUP BY NoKTP having Kriteria=Kriteria and SUB=SUB  Order by Hasil desc' );
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `tampil_pelamar` */

/*!50003 DROP PROCEDURE IF EXISTS  `tampil_pelamar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_pelamar`()
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
FROM vpelamar ;
SET @sql = CONCAT('SELECT Nama, NoKTP ,alamat,Kriteria,',@sql,' FROM vpelamar 
GROUP BY NoKTP having Kriteria=Kriteria  Order by NoKTP asc' );
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
    END */$$
DELIMITER ;

/*Table structure for table `vpelamar` */

DROP TABLE IF EXISTS `vpelamar`;

/*!50001 DROP VIEW IF EXISTS `vpelamar` */;
/*!50001 DROP TABLE IF EXISTS `vpelamar` */;

/*!50001 CREATE TABLE `vpelamar` (
  `NO` int(11) NOT NULL default '0',
  `Nama` varchar(100) default NULL,
  `NoKTP` char(22) NOT NULL,
  `Alamat` varchar(200) default NULL,
  `Kriteria` varchar(30) default NULL,
  `SUB` varchar(30) default NULL,
  `Nilai` double(10,2) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `vditerima` */

DROP TABLE IF EXISTS `vditerima`;

/*!50001 DROP VIEW IF EXISTS `vditerima` */;
/*!50001 DROP TABLE IF EXISTS `vditerima` */;

/*!50001 CREATE TABLE `vditerima` (
  `NoKTP` varchar(15) NOT NULL,
  `Nama` varchar(100) default NULL,
  `Alamat` varchar(200) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*View structure for view vpelamar */

/*!50001 DROP TABLE IF EXISTS `vpelamar` */;
/*!50001 DROP VIEW IF EXISTS `vpelamar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpelamar` AS (select `tbl_kriteria_pelamar`.`No` AS `NO`,`tbl_pelamar`.`Nama` AS `Nama`,`tbl_pelamar`.`NoKTP` AS `NoKTP`,`tbl_pelamar`.`Alamat` AS `Alamat`,`tbl_kriteria_pelamar`.`Kriteria` AS `Kriteria`,`tbl_kriteria_pelamar`.`SUB` AS `SUB`,`tbl_kriteria_pelamar`.`Nilai` AS `Nilai` from (`tbl_kriteria_pelamar` join `tbl_pelamar` on((`tbl_kriteria_pelamar`.`NoKTP` = `tbl_pelamar`.`NoKTP`))) order by `tbl_kriteria_pelamar`.`No`) */;

/*View structure for view vditerima */

/*!50001 DROP TABLE IF EXISTS `vditerima` */;
/*!50001 DROP VIEW IF EXISTS `vditerima` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vditerima` AS (select `tblpenrima`.`NoKTP` AS `NoKTP`,`tbl_pelamar`.`Nama` AS `Nama`,`tbl_pelamar`.`Alamat` AS `Alamat` from (`tbl_pelamar` join `tblpenrima` on((`tbl_pelamar`.`NoKTP` = `tblpenrima`.`NoKTP`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
