# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.25)
# Database: co_ecommerce
# Generation Time: 2015-08-22 06:35:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `remember_digest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `email`, `password`, `created_at`, `updated_at`, `password_digest`, `remember_digest`)
VALUES
	(8,'Jesus','Gutierrez','enrique@homie.mx',NULL,'2015-08-21 02:26:58','2015-08-22 06:04:36','$2a$10$VKZgtlwqvj3All26pjfwjulZFmVeZM15aWp5fUqIyOHzbEhUfUsXO','m1qXd5AU-QojfF-Aff0joA'),
	(9,'Homie','Tester','tester@homie.mx',NULL,'2015-08-22 06:06:19','2015-08-22 06:07:00','$2a$10$VKZgtlwqvj3All26pjfwjulZFmVeZM15aWp5fUqIyOHzbEhUfUsXO','m1qXd5AU-QojfF-Aff0joA');

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_lines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_lines`;

CREATE TABLE `order_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_lines` WRITE;
/*!40000 ALTER TABLE `order_lines` DISABLE KEYS */;

INSERT INTO `order_lines` (`id`, `order_id`, `product_id`, `qty`, `unit_price`, `total_price`, `created_at`, `updated_at`)
VALUES
	(12,5,1,45,23123.00,1040535.00,'2015-08-22 05:52:20','2015-08-22 05:52:20'),
	(13,5,3,12,345.00,4140.00,'2015-08-22 05:52:30','2015-08-22 05:52:30'),
	(14,6,5,5,45.00,225.00,'2015-08-22 05:53:19','2015-08-22 05:53:19'),
	(15,7,1,3,23123.00,69369.00,'2015-08-22 06:09:19','2015-08-22 06:09:19'),
	(16,7,5,45,45.00,2025.00,'2015-08-22 06:09:40','2015-08-22 06:09:40');

/*!40000 ALTER TABLE `order_lines` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `order_no`, `Customer_id`, `total`, `date`, `closed`)
VALUES
	(5,'A00001',8,1044675.00,'2015-08-22',1),
	(6,'A00002',8,225.00,'2015-08-22',1),
	(7,'A00003',9,71394.00,'2015-08-22',1);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `description`, `name`, `price`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Something','Should be',23123.00,1,'2015-08-20 21:41:20','2015-08-20 21:41:20'),
	(2,'Another Product','ANPRO',456.00,1,'2015-08-22 02:41:45','2015-08-22 02:41:45'),
	(3,'Chanel','Cwe',345.00,1,'2015-08-22 02:42:08','2015-08-22 02:42:08'),
	(4,'SomethingNew','New',12.00,1,'2015-08-22 02:50:02','2015-08-22 02:50:02'),
	(5,'newwww','nwwe',45.00,1,'2015-08-22 02:55:14','2015-08-22 02:55:14'),
	(6,'poiqwe','poiadpoi',12.87,1,'2015-08-22 02:58:57','2015-08-22 03:04:33'),
	(7,'ijasdoij','joiajsdoij',56.54,1,'2015-08-22 03:05:49','2015-08-22 03:05:49'),
	(8,'asdasd','asdasdqweq',56.70,1,'2015-08-22 03:06:27','2015-08-22 03:06:27'),
	(9,'nothingggg','Homie product',45.35,1,'2015-08-22 06:14:11','2015-08-22 06:14:35');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20150820201612'),
	('20150820211150'),
	('20150820234837'),
	('20150820235930'),
	('20150821000059'),
	('20150821000940'),
	('20150821003132'),
	('20150821022307'),
	('20150822002340'),
	('20150822015401');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
