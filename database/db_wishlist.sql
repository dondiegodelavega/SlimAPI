# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: db_wishlist
# Generation Time: 2016-11-17 13:49:06 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table wl_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wl_user`;

CREATE TABLE `wl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `username` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `password` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `apikey` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wl_user` WRITE;
/*!40000 ALTER TABLE `wl_user` DISABLE KEYS */;

INSERT INTO `wl_user` (`id`, `name`, `username`, `password`, `apikey`, `created_at`, `updated_at`)
VALUES
	(1,'Hamidreza','delavega','1a1dc91c907325c69271ddf0c944bc72','17EA4931D317F48E62F2A78A836AB','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `wl_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wl_wish
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wl_wish`;

CREATE TABLE `wl_wish` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `description` text CHARACTER SET latin1 NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `wl_wishlist_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wl_wishlist_id` (`wl_wishlist_id`),
  CONSTRAINT `wl_wish_ibfk_1` FOREIGN KEY (`wl_wishlist_id`) REFERENCES `wl_wishlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wl_wish` WRITE;
/*!40000 ALTER TABLE `wl_wish` DISABLE KEYS */;

INSERT INTO `wl_wish` (`id`, `name`, `description`, `latitude`, `longitude`, `wl_wishlist_id`, `created_at`, `updated_at`)
VALUES
	(1,'Malaysia','Visit Malaysia beaches.',0.000000,0.000000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(2,'Canada','Visit mountains in Canada.',0.000000,0.000000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(3,'Scotland','Visit Scotland forests.',0.000000,0.000000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(4,'Astin Cafe','Eat Nasi Lemak in Astin Cafe.',0.000000,0.000000,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(5,'Hokaydo Shop','Eat Bakuteh in Hokaydo sushi shop.',0.000000,0.000000,2,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `wl_wish` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wl_wishlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wl_wishlist`;

CREATE TABLE `wl_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `description` text CHARACTER SET latin1 NOT NULL,
  `wl_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wl_user_id` (`wl_user_id`),
  CONSTRAINT `wl_wishlist_ibfk_1` FOREIGN KEY (`wl_user_id`) REFERENCES `wl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wl_wishlist` WRITE;
/*!40000 ALTER TABLE `wl_wishlist` DISABLE KEYS */;

INSERT INTO `wl_wishlist` (`id`, `name`, `description`, `wl_user_id`, `created_at`, `updated_at`)
VALUES
	(1,'Travel','All the places I wish to travel by this year.',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(2,'Restaurant','All the foods I wish to try by this year.',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `wl_wishlist` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
