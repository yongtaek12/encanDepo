/*!999999\- enable the sandbox mode */ 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;
DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add product',7,'add_product'),
(26,'Can change product',7,'change_product'),
(27,'Can delete product',7,'delete_product'),
(28,'Can view product',7,'view_product');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$260000$OpoNEFtdZIIZDPTnJbfviu$uIzxaXsXp/MIRUczY/jTa3UpRX9VFYn8AvJ2gd5a21s=','2019-12-13 11:41:33.728107',1,'laund','','','laundryday085@gmail.com',1,1,'2019-11-30 13:25:40.752122');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2019-11-30 14:13:58.904871','1','Lenovo ThinkPad T14 Gen 1',1,'[{\"added\": {}}]',7,1),
(2,'2019-11-30 14:15:03.602916','2','HP ZBook 14u G6',1,'[{\"added\": {}}]',7,1),
(3,'2019-11-30 14:15:46.515433','3','HP ProBook 640 G4',1,'[{\"added\": {}}]',7,1),
(4,'2019-11-30 14:16:33.455473','4','Dell Latitude 5500',1,'[{\"added\": {}}]',7,1),
(5,'2019-11-30 14:30:57.437063','5','Dell Latitude 7400',1,'[{\"added\": {}}]',7,1),
(6,'2019-11-30 14:31:30.497326','6','Lenovo ThinkPad X1 Carbon Gen 7',1,'[{\"added\": {}}]',7,1),
(7,'2019-11-30 14:31:56.624513','7','HP EliteBook 840 G5',1,'[{\"added\": {}}]',7,1),
(8,'2019-11-30 14:32:20.945966','8','Dell Precision 3541',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'product','product'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2019-11-30 12:58:43.310971'),
(2,'auth','0001_initial','2019-11-30 12:58:43.518626'),
(3,'admin','0001_initial','2019-11-30 12:58:43.565809'),
(4,'admin','0002_logentry_remove_auto_add','2019-11-30 12:58:43.577394'),
(5,'admin','0003_logentry_add_action_flag_choices','2019-11-30 12:58:43.589925'),
(6,'contenttypes','0002_remove_content_type_name','2019-11-30 12:58:43.627827'),
(7,'auth','0002_alter_permission_name_max_length','2019-11-30 12:58:43.645771'),
(8,'auth','0003_alter_user_email_max_length','2019-11-30 12:58:43.664047'),
(9,'auth','0004_alter_user_username_opts','2019-11-30 12:58:43.675881'),
(10,'auth','0005_alter_user_last_login_null','2019-11-30 12:58:43.701136'),
(11,'auth','0006_require_contenttypes_0002','2019-11-30 12:58:43.706117'),
(12,'auth','0007_alter_validators_add_error_messages','2019-11-30 12:58:43.719713'),
(13,'auth','0008_alter_user_username_max_length','2019-11-30 12:58:43.742221'),
(14,'auth','0009_alter_user_last_name_max_length','2019-11-30 12:58:43.764050'),
(15,'auth','0010_alter_group_name_max_length','2019-11-30 12:58:43.782163'),
(16,'auth','0011_update_proxy_permissions','2019-11-30 12:58:43.795645'),
(17,'auth','0012_alter_user_first_name_max_length','2019-11-30 12:58:43.814204'),
(18,'product','0001_initial','2019-11-30 12:58:43.832837'),
(19,'sessions','0001_initial','2019-11-30 12:58:43.854597'),
(20,'product','0002_product_display_order','2019-12-14 00:58:07.483746');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('bfcm7m1m6vfp8mpjhtoib2dmxb1qzvvg','.eJxVjEsOAiEQBe_C2hCYARpcuvcMhG4aGTWQzGdlvLtOMgvdvqp6LxHTtta4LTzHKYuz0OL0u2GiB7cd5Htqty6pt3WeUO6KPOgirz3z83K4fwc1LfVbG9BkyQMWDyGoMKjBGwbLxVlHDg0CJgvFo2fL2o3EjhQMgUZLpJx4fwDPKjeU:1wQkjV:uG1a1k38jorU9abtsMyhvK7Nro2oy7wtUUc7luFGZrQ','2019-12-27 11:41:33.730157'),
('qnb7z29bb6q4h3aaf2v7m3q4vd642vnr','.eJxVjMEOwiAQRP-FsyG7FVjw6N1vIAtspGpoUtqT8d9tkx70Npn3Zt4q8rrUuHaZ41jURaE6_XaJ81PaDsqD233SeWrLPCa9K_qgXd-mIq_r4f4dVO51W1sgtiZAMgSWIRESIwyC5Lwhd3bCEiyGECgJe2f8lgeHGQNkhKQ-X6K0NiY:1vPhjv:9saM1SE3mKZ-I6M37VN6ABM-vwYydc_n0eWnbQnaNJ0','2019-12-14 13:45:23.129704');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `spec_cpu` varchar(100) NOT NULL,
  `spec_ram` varchar(100) NOT NULL,
  `spec_ssd` varchar(100) NOT NULL,
  `spec_screen` varchar(100) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `warranty` varchar(50) NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES
(1,'Lenovo ThinkPad T14 Gen 1',349.00,399.00,'Intel Core i5 10e génération','16GB RAM DDR4','SSD 256GB NVMe','Écran 14\" Full HD','img/laptop_placeholder_1.jpg','Garantie 1 mois',0),
(2,'HP ZBook 14u G6',330.00,390.00,'Intel Core i5 8e génération','8GB RAM DDR4','SSD 256GB','Écran 14\" Full HD','img/laptop_placeholder_2.jpg','Garantie 1 mois',0),
(3,'HP ProBook 640 G4',270.00,290.00,'Intel Core i5 8e génération','8GB RAM DDR4','SSD 256GB','Écran 14\" HD','img/laptop_placeholder_3.jpg','Garantie 1 mois',0),
(4,'Dell Latitude 5500',310.00,350.00,'Intel Core i7 8e génération','16GB RAM DDR4','SSD 512GB','Écran 15.6\" Full HD','img/laptop_placeholder_4.jpg','Garantie 1 mois',0),
(5,'Dell Latitude 7400',450.00,499.00,'Intel Core i7 8e génération','16GB RAM DDR4','SSD 512GB NVMe','Écran 14\" Full HD Touch','img/laptop_placeholder_5.jpg','Garantie 1 mois',0),
(6,'Lenovo ThinkPad X1 Carbon Gen 7',590.00,650.00,'Intel Core i5 10e génération','8GB RAM LPDDR3','SSD 256GB NVMe','Écran 14\" WQHD','img/laptop_placeholder_6.jpg','Garantie 1 mois',0),
(7,'HP EliteBook 840 G5',380.00,420.00,'Intel Core i7 7e génération','16GB RAM DDR4','SSD 256GB','Écran 14\" Full HD','img/laptop_placeholder_7.jpg','Garantie 1 mois',0),
(8,'Dell Precision 3541',620.00,690.00,'Intel Core i9 9e génération','32GB RAM DDR4','SSD 1TB NVMe','Écran 15.6\" Full HD','img/laptop_placeholder_8.jpg','Garantie 1 mois',0),
(9,'Dell OptiPlex 7010 SFF',180.00,220.00,'Intel Core i5-3470 3e génération','8GB RAM DDR3','SSD 256GB','Format SFF - Sans écran','img/desktop_optiplex_7010.jpg','Garantie 1 mois',0),
(10,'Dell OptiPlex 9020 SFF',320.00,380.00,'Intel Core i7-4770 4e génération','16GB RAM DDR3','SSD 256GB','Format SFF - Sans écran','img/desktop_optiplex_9020.jpg','Garantie 1 mois',0),
(11,'Lenovo ThinkCentre M83 Small',240.00,290.00,'Intel Core i5-4570 4e génération','8GB RAM DDR3','SSD 256GB','Format Small - Sans écran','img/desktop_thinkcentre_m83.jpg','Garantie 1 mois',0),
(12,'Lenovo ThinkCentre M900 Tower',390.00,450.00,'Intel Core i7-6700 6e génération','16GB RAM DDR4','SSD 256GB','Format Tower - Sans écran','img/desktop_thinkcentre_m900.jpg','Garantie 1 mois',0),
(13,'WD Elements 2TB Portable',65.00,110.00,'Capacité 2TB','Interface USB 3.0','Disque dur portable 2.5\"','Compatible PC / Mac','img/hdd_wd_my_passport.jpg','Garantie 1 mois',100),
(14,'Seagate Expansion 2TB Portable',65.00,90.00,'Capacité 2TB','Interface USB 3.0','Disque dur portable 2.5\"','Compatible PC / Mac','img/hdd_seagate_portable.jpg','Garantie 1 mois',100),
(15,'NVIDIA GeForce GTX 1060 6GB',220.00,280.00,'NVIDIA Pascal GP106','6GB GDDR5 192-bit','1280 CUDA Cores','PCIe 3.0 x16 - DP/HDMI/DVI','img/gpu_gtx_1060.jpg','Garantie 1 mois',100),
(16,'AMD Radeon RX 580 8GB',200.00,240.00,'AMD Polaris 20 XTX','8GB GDDR5 256-bit','2304 Stream Processors','PCIe 3.0 x16 - DP/HDMI/DVI','img/gpu_rx_580.jpg','Garantie 1 mois',100);
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

