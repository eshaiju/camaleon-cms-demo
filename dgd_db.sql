-- MySQL dump 10.13  Distrib 5.6.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dgd_db
-- ------------------------------------------------------
-- Server version	5.6.24-0ubuntu2

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `approved` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_parent` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_approved` (`approved`),
  KEY `index_comments_on_comment_parent` (`comment_parent`),
  KEY `index_comments_on_post_id` (`post_id`),
  KEY `index_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objectid` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `is_repeat` tinyint(1) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_object_class` (`object_class`),
  KEY `index_custom_fields_on_slug` (`slug`),
  KEY `index_custom_fields_on_objectid` (`objectid`),
  KEY `index_custom_fields_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (9,'Theme','New theme settings','theme_new_fields',18,1,NULL,0,0,'new theme',NULL),(10,'_fields','Background color','theme_custom_bg_color',NULL,9,NULL,0,0,NULL,NULL),(11,'_fields','Links color','theme_custom_links_color',NULL,9,NULL,0,0,NULL,NULL),(12,'_fields','Footer text','theme_custom_footer_text',NULL,9,NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_relationships`
--

DROP TABLE IF EXISTS `custom_fields_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `term_order` int(11) DEFAULT NULL,
  `object_class` varchar(255) DEFAULT NULL,
  `value` longtext,
  `custom_field_slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_relationships_on_objectid` (`objectid`),
  KEY `index_custom_fields_relationships_on_custom_field_id` (`custom_field_id`),
  KEY `index_custom_fields_relationships_on_object_class` (`object_class`),
  KEY `index_custom_fields_relationships_on_custom_field_slug` (`custom_field_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_relationships`
--

LOCK TABLES `custom_fields_relationships` WRITE;
/*!40000 ALTER TABLE `custom_fields_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `objectid` int(11) DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_metas_on_key` (`key`),
  KEY `index_metas_on_objectid` (`objectid`),
  KEY `index_metas_on_object_class` (`object_class`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
INSERT INTO `metas` VALUES (1,'_default','{\"has_category\":true,\"has_tags\":true,\"not_deleted\":true,\"has_summary\":true,\"has_content\":true,\"has_comments\":true,\"has_picture\":true,\"has_template\":true}',2,'PostType'),(2,'_post_type_1','{\"edit\":[2,7,31],\"edit_other\":[2,7,31],\"edit_publish\":[2,7,31],\"publish\":[2,7,31],\"delete\":[2,7,31],\"delete_other\":[2,7,31],\"delete_publish\":[2,7,31],\"manage_categories\":[2,7,31],\"manage_tags\":[2,7,31]}',3,'UserRole'),(3,'_manager_1','{\"media\":1,\"comments\":1,\"themes\":1,\"widgets\":1,\"nav_menu\":1,\"plugins\":1,\"users\":1,\"settings\":1}',3,'UserRole'),(4,'_post_type_1','{\"edit\":[31],\"edit_other\":[31],\"edit_publish\":[31],\"publish\":[31],\"delete\":[31],\"delete_other\":[31],\"delete_publish\":[31],\"manage_categories\":[31],\"manage_tags\":[31]}',4,'UserRole'),(5,'_post_type_1','{\"edit\":[31]}',5,'UserRole'),(6,'_default','{\"not_deleted\":true}',6,'Category'),(7,'_default','{\"has_category\":false,\"has_tags\":false,\"not_deleted\":true,\"has_summary\":false,\"has_content\":true,\"has_comments\":false,\"has_picture\":true,\"has_template\":true,\"default_thumb\":\"\",\"has_keywords\":false}',7,'PostType'),(10,'_post_type_1','{}',12,'UserRole'),(11,'_manager_1','{}',12,'UserRole'),(12,'front_cache_elements','{\"paths\":[],\"posts\":[\"29\",\"27\",\"25\",\"23\",\"15\",\"11\"],\"post_types\":[\"7\"],\"skip_posts\":[],\"cache_login\":\"1\",\"home\":\"1\"}',1,'Site'),(13,'attack_config','{\"get\":{\"sec\":20,\"max\":10},\"post\":{\"sec\":20,\"max\":5},\"msg\":\"Requests Limit exceeded!\",\"ban\":5,\"cleared\":\"2015-08-19T00:22:33.707+05:30\"}',1,'Site'),(14,'_default','{\"_theme\":\"new\",\"date_notified\":\"2015-08-19\",\"has_create_account\":\"\",\"keywords\":\"\",\"logo\":\"/assets/camaleon-fb80e22c681bdcc089dc3615bca4d9ba30329cbd30a1e64fd44bc86dd0ea2236.png\",\"icon\":\"/favicon.ico\",\"screenshot\":\"\",\"home_page\":11,\"error_404\":\"\",\"email\":\"\",\"front_per_page\":10,\"admin_per_page\":10,\"comment_status\":\"pending\"}',1,'Site'),(21,'date_notified_message','',1,'Site'),(22,'_default','{\"field_key\":\"colorpicker\",\"required\":true}',10,'CustomField'),(23,'_default','{\"field_key\":\"colorpicker\",\"required\":true}',11,'CustomField'),(24,'_default','{\"field_key\":\"editor\",\"translate\":true}',12,'CustomField'),(25,'has_comments','0',3,'Post'),(26,'thumb','',3,'Post'),(27,'slug','home',3,'Post'),(28,'summary','',3,'Post'),(29,'_default','{\"keywords\":\"\"}',3,'Post'),(30,'has_comments','0',1,'Post'),(31,'thumb','',1,'Post'),(32,'slug','home',1,'Post'),(33,'summary','',1,'Post'),(34,'_default','{\"keywords\":\"\",\"status_default\":\"published\"}',1,'Post'),(58,'thumb','',9,'Post'),(59,'slug','home-1',9,'Post'),(60,'_default','{\"keywords\":\"\",\"status_default\":\"published\"}',9,'Post'),(64,'thumb','',11,'Post'),(65,'slug','index',11,'Post'),(66,'_default','{\"keywords\":null}',11,'Post'),(67,'thumb','',12,'Post'),(68,'slug','index',12,'Post'),(69,'_default','{\"keywords\":\"\"}',12,'Post'),(73,'_default','{\"status_default\":\"published\"}',2,'Post'),(77,'thumb','',15,'Post'),(78,'slug','about-us',15,'Post'),(79,'_default','{\"keywords\":null}',15,'Post'),(91,'thumb','',19,'Post'),(92,'slug','exclusive-brands',19,'Post'),(93,'_default','{\"keywords\":null}',19,'Post'),(94,'thumb','',20,'Post'),(95,'slug','brands',20,'Post'),(96,'_default','{\"keywords\":null,\"status_default\":\"published\"}',20,'Post'),(100,'thumb','',21,'Post'),(101,'slug','brands',21,'Post'),(102,'_default','{\"keywords\":null}',21,'Post'),(106,'thumb','',23,'Post'),(107,'slug','media',23,'Post'),(108,'_default','{\"keywords\":null}',23,'Post'),(112,'thumb','',25,'Post'),(113,'slug','careers',25,'Post'),(114,'_default','{\"keywords\":null}',25,'Post'),(118,'thumb','',27,'Post'),(119,'slug','showrooms',27,'Post'),(120,'_default','{\"keywords\":null}',27,'Post'),(124,'thumb','',29,'Post'),(125,'slug','reach-us',29,'Post'),(126,'_default','{\"keywords\":null}',29,'Post'),(142,'share_sessions','f',1,'Site'),(147,'template','template_sample_page.html.erb',34,'Post'),(148,'thumb','',34,'Post'),(149,'slug','sss',34,'Post'),(150,'_default','{\"keywords\":null,\"status_default\":\"published\"}',34,'Post'),(159,'template','template_brand.html.erb',19,'Post'),(160,'template','template_home.html.erb',11,'Post'),(165,'thumb','http://localhost:3000/media/1/1.jpg',38,'Post'),(166,'slug','model-no-h5698',38,'Post'),(167,'_default','{\"keywords\":null}',38,'Post'),(168,'thumb','http://localhost:3000/media/1/1.jpg',39,'Post'),(169,'slug','model1',39,'Post'),(170,'_default','{\"keywords\":null}',39,'Post'),(171,'_default','{\"has_category\":false,\"has_tags\":false,\"has_summary\":true,\"has_content\":true,\"has_comments\":false,\"has_picture\":true,\"has_template\":false,\"not_deleted\":false,\"default_thumb\":\"\",\"has_keywords\":false}',31,'PostType'),(176,'thumb','http://localhost:3000/media/1/1.jpg',41,'Post'),(177,'slug','model-no-h5698-1',41,'Post'),(178,'summary','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.',41,'Post'),(179,'_default','{\"keywords\":null}',41,'Post'),(180,'template','',42,'Post'),(181,'has_comments','0',42,'Post'),(182,'thumb','',42,'Post'),(183,'slug','sfds',42,'Post'),(184,'summary','',42,'Post'),(185,'_default','{\"keywords\":\"\"}',42,'Post'),(186,'thumb','http://localhost:3000/media/1/2.jpg',43,'Post'),(187,'slug','model-no-h5698',43,'Post'),(188,'summary','',43,'Post'),(189,'_default','{\"keywords\":null}',43,'Post'),(194,'thumb','http://localhost:3000/media/1/3.jpg',45,'Post'),(195,'slug','model-no-h5698-2',45,'Post'),(196,'summary','',45,'Post'),(197,'_default','{\"keywords\":null}',45,'Post'),(202,'thumb','http://localhost:3000/media/1/4.jpg',47,'Post'),(203,'slug','model-no-h5698-3',47,'Post'),(204,'summary','',47,'Post'),(205,'_default','{\"keywords\":null}',47,'Post'),(210,'thumb','http://localhost:3000/media/1/5.jpg',49,'Post'),(211,'slug','model-no-h5698-4',49,'Post'),(212,'summary','',49,'Post'),(213,'_default','{\"keywords\":null}',49,'Post'),(218,'thumb','http://localhost:3000/media/1/6.jpg',51,'Post'),(219,'slug','model-no-h5698-5',51,'Post'),(220,'summary','',51,'Post'),(221,'_default','{\"keywords\":null}',51,'Post'),(223,'template','template_default.html.erb',15,'Post'),(224,'template','template_default.html.erb',29,'Post'),(225,'template','template_default.html.erb',27,'Post'),(226,'template','template_default.html.erb',25,'Post'),(227,'template','template_default.html.erb',23,'Post'),(232,'_default','{\"type\":\"post\",\"object_id\":\"15\"}',32,'NavMenuItem'),(233,'_default','{\"type\":\"post\",\"object_id\":\"19\"}',33,'NavMenuItem'),(234,'_default','{\"type\":\"post\",\"object_id\":\"23\"}',34,'NavMenuItem'),(235,'_default','{\"type\":\"post\",\"object_id\":\"25\"}',35,'NavMenuItem'),(236,'_default','{\"type\":\"post\",\"object_id\":\"27\"}',36,'NavMenuItem'),(237,'_default','{\"type\":\"post\",\"object_id\":\"29\"}',37,'NavMenuItem');
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins_attacks`
--

DROP TABLE IF EXISTS `plugins_attacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins_attacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_plugins_attacks_on_path` (`path`),
  KEY `index_plugins_attacks_on_browser_key` (`browser_key`),
  KEY `index_plugins_attacks_on_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_attacks`
--

LOCK TABLES `plugins_attacks` WRITE;
/*!40000 ALTER TABLE `plugins_attacks` DISABLE KEYS */;
INSERT INTO `plugins_attacks` VALUES (288,'get_/','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:52:33'),(289,'get_/','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:52:47'),(290,'get_/about-us.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:52:50'),(291,'get_/exclusive-brands.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:52:52'),(292,'get_/index.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:52:55'),(293,'get_/index.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:52:59'),(294,'get_/index.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:00'),(295,'get_/','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:03'),(296,'get_/','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:03'),(297,'get_/','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:24'),(298,'get_/admin/login','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:25'),(299,'post_/admin/login','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:35'),(300,'get_/admin/dashboard','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:35'),(301,'get_/admin/plugins','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:38'),(302,'get_/admin/appearances/themes','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:53:49'),(303,'get_/admin/settings/site','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:08'),(304,'post_/admin/settings/site_saved','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:22'),(305,'get_/admin/settings/site','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:23'),(306,'get_/','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:26'),(307,'get_/index.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:28'),(308,'get_/','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:32'),(309,'get_/about-us.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:35'),(310,'get_/exclusive-brands.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:37'),(311,'get_/reach-us.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:38'),(312,'get_/reach-us.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:40'),(313,'get_/showrooms.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:41'),(314,'get_/careers.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:43'),(315,'get_/media.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:46'),(316,'get_/reach-us.html','d67f0b5ae23e2226cc90e1c025b5ce9b',1,'2015-08-18 18:54:55'),(317,'get_/index.html','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:55:26'),(318,'get_/admin/post_type/7/posts/11/edit','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:55:29'),(319,'get_/admin/post_type/7/post_tags/list','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:55:31'),(320,'get_/admin/appearances/nav_menus/menu','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:55:41'),(321,'post_/admin/appearances/nav_menus/save','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:56:08'),(322,'get_/index.html','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:56:16'),(323,'get_/reach-us.html','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:56:24'),(324,'get_/admin/appearances/nav_menus/menu','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:56:44'),(325,'get_/reach-us.html','8045dbb8be2a375c46ea95869c714e9c',1,'2015-08-18 18:56:50');
/*!40000 ALTER TABLE `plugins_attacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins_contact_forms`
--

DROP TABLE IF EXISTS `plugins_contact_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins_contact_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `value` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_contact_forms`
--

LOCK TABLES `plugins_contact_forms` WRITE;
/*!40000 ALTER TABLE `plugins_contact_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins_contact_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext,
  `content_filtered` longtext,
  `status` varchar(255) DEFAULT 'published',
  `comment_count` int(11) DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `post_parent` int(11) DEFAULT NULL,
  `visibility` varchar(255) DEFAULT 'public',
  `visibility_value` text,
  `post_class` varchar(255) DEFAULT 'Post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_posts_on_slug` (`slug`),
  KEY `index_posts_on_status` (`status`),
  KEY `index_posts_on_post_parent` (`post_parent`),
  KEY `index_posts_on_post_class` (`post_class`),
  KEY `index_posts_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Home','home','<div class=\"main_content_home\">\r\n<div class=\"row home_content_block\">\r\n<div class=\"container content_head_block\">\r\n<h1><em>Exclusive Brands</em></h1>\r\n</div>\r\n<div class=\"container\">\r\n<div class=\"home_img_block\">\r\n<div class=\"col-md-7 col-sm-7 col-xs-12 home_img_block_left\">\r\n<div class=\"row img_block_left_top\">\r\n<div class=\"col-md-4 col-sm-4 col-xs-12 img_left_top1 pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/aid.jpg\" alt=\"\" width=\"194\" height=\"444\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 97%; top: 17%; height: 80%;\">\r\n<div class=\"img_block_right_middle_content\" style=\"float: none !important; width: auto !important;\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"float: none !important; width: auto !important;\"><img src=\"http://localhost:3000/media/1/ain.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"float: none !important; width: auto !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-8 col-sm-8 col-xs-12 img_left_top2 pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/heritage.jpg\" alt=\"\" width=\"350\" height=\"395\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: 23%; height: 60%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%;\"><img src=\"http://localhost:3000/media/1/heritage-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-md-12 img_block_left_bottom pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/glitz.jpg\" alt=\"\" width=\"593\" height=\"178\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 101%; top: -17%; height: 145%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%;\"><img src=\"http://localhost:3000/media/1/glitz-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-5 col-sm-5 col-xs-12 home_img_block_right\">\r\n<div class=\"row img_block_right_top\">\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/devo.jpg\" alt=\"\" width=\"196\" height=\"220\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: -10%; height: 136%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/devo-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"#\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/platinum.jpg\" alt=\"\" width=\"196\" height=\"220\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 99%; top: -10%; height: 136%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/pl-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row img_block_right_middle pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/benzer.jpg\" alt=\"\" width=\"398\" height=\"210\" />\r\n<div class=\"img_block_right_middle_inrblock\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo\"><img src=\"http://localhost:3000/media/1/hover-logo-benzer.png\" alt=\"\" width=\"160\" height=\"62\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row img_block_right_bottom\">\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/isma.jpg\" alt=\"\" width=\"198\" height=\"148\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: -32%; height: 192%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/isma-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/zaara.jpg\" alt=\"\" width=\"198\" height=\"148\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 98%; top: -32%; height: 192%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/zara-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>','   Exclusive Brands          Click here to view more        Click here to view more          Click here to view more            Click here to view more        Click here to view more         Click here to view more         Click here to view more        Click here to view more         ','trash',0,NULL,NULL,'public',NULL,'Post','2015-08-18 15:12:21','2015-08-18 15:55:41',1),(2,'Welcome','welcome','<p style=\'text-align: center;\'><img width=\'155\' height=\'155\' src=\'http://camaleon.tuzitio.com/media/132/logo2.png\' alt=\'logo\' /></p><p><strong>Camaleon CMS</strong>&nbsp;is a free and open-source tool and a fexible content management system (CMS) based on <a href=\'rubyonrails.org\'>Ruby on Rails 4</a>&nbsp;and MySQL.&nbsp;</p> <p>With Camaleon you can do the following:</p> <ul> <li>Create instantly a lot of sites&nbsp;in the same installation</li> <li>Manage your content information in several languages</li> <li>Extend current functionality by&nbsp;plugins (MVC structure and no more echo or prints anywhere)</li> <li>Create or install different themes for each site</li> <li>Create your own structure without coding anything (adapt Camaleon as you want&nbsp;and not you for Camaleon)</li> <li>Create your store and start to sell your products using our plugins</li> <li>Avoid web attacks</li> <li>Compare the speed and enjoy the speed of your new Camaleon site</li> <li>Customize or create your themes for mobile support</li> <li>Support&nbsp;more visitors at the same time</li> <li>Manage your information with a panel like wordpress&nbsp;</li> <li>All urls are oriented for SEO</li> <li>Multiples roles of users</li> </ul>','Camaleon CMS is a free and open-source tool and a fexible content management system (CMS) based on Ruby on Rails 4 and MySQL.  With Camaleon you can do the following:  Create instantly a lot of sites in the same installation Manage your content information in several languages Extend current functionality by plugins (MVC structure and no more echo or prints anywhere) Create or install different themes for each site Create your own structure without coding anything (adapt Camaleon as you want and not you for Camaleon) Create your store and start to sell your products using our plugins Avoid web attacks Compare the speed and enjoy the speed of your new Camaleon site Customize or create your themes for mobile support Support more visitors at the same time Manage your information with a panel like wordpress  All urls are oriented for SEO Multiples roles of users ','trash',0,NULL,NULL,'public',NULL,'Post','2015-08-18 15:12:21','2015-08-18 15:12:21',1),(3,'home','home','<p>&lt;div class=\"main_content_home\"&gt;<br /> &lt;div class=\"row home_content_block\"&gt;<br /> &lt;div class=\"container content_head_block\"&gt;<br /> &lt;h1&gt;&lt;i&gt;Exclusive Brands&lt;/i&gt;&lt;/h1&gt;<br /> &lt;/div&gt;<br /> &lt;div class=\"container\"&gt;<br /> &lt;div class=\"home_img_block\"&gt;<br /> <br /> &lt;div class=\"col-md-7 col-sm-7 col-xs-12 home_img_block_left\"&gt;<br /> &lt;div class=\"row img_block_left_top\"&gt;<br /> &lt;div class=\"col-md-4 col-sm-4 col-xs-12 img_left_top1 pdng_3\"&gt; &lt;img class=\"img-responsive\" src=\"/collections/aid.jpg\"&gt; <br /> &lt;div class=\"img_block_right_middle_inrblock\" style=\"width:97%; top: 17%; height: 80%;\"&gt;<br /> &lt;div class=\"img_block_right_middle_content\" style=\"float:none !important;width:auto !important;\"&gt;<br /> &lt;div class=\"hover_content_rgt-midl_logo \" style=\"float:none !important;width:auto !important;\"&gt; &lt;img src=\"images/hover/ain.jpg\"&gt; &lt;/div&gt;<br /> &lt;div class=\"hover_content_rgt-midl_link\" style=\"float:none !important;width:auto !important;\" &gt;&lt;a href=\"product.html\"&gt;Click here to view more&lt;/a&gt;&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> <br /> &lt;/div&gt;<br /> &lt;div class=\"col-md-8 col-sm-8 col-xs-12 img_left_top2 pdng_3\"&gt; &lt;img class=\"img-responsive\" src=\"images/collections/heritage.jpg\"&gt;<br /> &lt;div class=\"img_block_right_middle_inrblock\" style=\"width:100%; top: 23%; height:60%;\"&gt;<br /> &lt;div class=\"img_block_right_middle_content\" &gt;<br /> &lt;div class=\"hover_content_rgt-midl_logo \" style=\"width:48%;\"&gt; &lt;img src=\"images/hover/heritage.jpg\" &gt; &lt;/div&gt;<br /> &lt;div class=\"hover_content_rgt-midl_link\" &gt;&lt;a href=\"product.html\"&gt;Click here to view more&lt;/a&gt;&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;div class=\"row\"&gt;<br /> &lt;div class=\"col-md-12 img_block_left_bottom pdng_3\"&gt; &lt;img class=\"img-responsive\" src=\"images/collections/glitz.jpg\"&gt; <br /> &lt;div class=\"img_block_right_middle_inrblock\" style=\"width:101%; top: -17%; height: 145%;\"&gt;<br /> &lt;div class=\"img_block_right_middle_content\" &gt;<br /> &lt;div class=\"hover_content_rgt-midl_logo \" style=\"width:48%;\"&gt; &lt;img src=\"images/hover/glitz.jpg\"&gt; &lt;/div&gt;<br /> &lt;div class=\"hover_content_rgt-midl_link\" &gt;&lt;a href=\"product.html\"&gt;Click here to view more&lt;/a&gt;&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;div class=\"col-md-5 col-sm-5 col-xs-12 home_img_block_right\"&gt;<br /> &lt;div class=\"row img_block_right_top\"&gt;<br /> &lt;div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"&gt; &lt;img class=\"img-responsive\" src=\"images/collections/devo.jpg\"&gt;<br /> &lt;div class=\"img_block_right_middle_inrblock\" style=\"width:100%; top: -10%; height: 136%;\"&gt;<br /> &lt;div class=\"img_block_right_middle_content\" &gt;<br /> &lt;div class=\"hover_content_rgt-midl_logo \" style=\"width:48%; float:none !important;\"&gt; &lt;img style=\"float:none !important; border:none !important;\" src=\"images/hover/devo.jpg\"&gt; &lt;/div&gt;<br /> &lt;div class=\"hover_content_rgt-midl_link\" style=\"width:100%; float:none !important;\" &gt;&lt;a href=\"#\"&gt;Click here to view more&lt;/a&gt;&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"&gt; &lt;img class=\"img-responsive\" src=\"images/collections/platinum.jpg\"&gt;<br /> &lt;div class=\"img_block_right_middle_inrblock\" style=\"width:99%; top: -10%; height: 136%;\"&gt;<br /> &lt;div class=\"img_block_right_middle_content\" &gt;<br /> &lt;div class=\"hover_content_rgt-midl_logo \" style=\"width:48%; float:none !important;\"&gt; &lt;img style=\"float:none !important; border:none !important;\" src=\"images/hover/pl.jpg\"&gt; &lt;/div&gt;<br /> &lt;div class=\"hover_content_rgt-midl_link\" style=\"width:100%; float:none !important;\" &gt;&lt;a href=\"product.html\"&gt;Click here to view more&lt;/a&gt;&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;</p>\r\n<p>&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;div class=\"row img_block_right_middle pdng_3\"&gt; &lt;img class=\"img-responsive\" src=\"images/collections/benzer.jpg\"&gt;<br /> &lt;div class=\"img_block_right_middle_inrblock\"&gt;<br /> &lt;div class=\"img_block_right_middle_content\"&gt;<br /> &lt;div class=\"hover_content_rgt-midl_logo\"&gt; &lt;img src=\"images/hover-logo-benzer.png\"&gt; &lt;/div&gt;<br /> &lt;div class=\"hover_content_rgt-midl_link\"&gt;&lt;a href=\"product.html\"&gt;Click here to view more&lt;/a&gt;&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;div class=\"row img_block_right_bottom\"&gt;<br /> &lt;div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"&gt; &lt;img class=\"img-responsive\" src=\"images/collections/isma.jpg\"&gt; <br /> &lt;div class=\"img_block_right_middle_inrblock\" style=\"width:100%; top: -32%; height: 192%;\"&gt;<br /> &lt;div class=\"img_block_right_middle_content\" &gt;<br /> &lt;div class=\"hover_content_rgt-midl_logo \" style=\"width:48%; float:none !important;\"&gt; &lt;img style=\"float:none !important; border:none !important;\" src=\"images/hover/isma.jpg\"&gt; &lt;/div&gt;<br /> &lt;div class=\"hover_content_rgt-midl_link\" style=\"width:100%; float:none !important;\" &gt;&lt;a href=\"product.html\"&gt;Click here to view more&lt;/a&gt;&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"&gt; &lt;img class=\"img-responsive\" src=\"images/collections/zaara.jpg\"&gt; <br /> &lt;div class=\"img_block_right_middle_inrblock\" style=\"width:98%; top: -32%; height: 192%;\"&gt;<br /> &lt;div class=\"img_block_right_middle_content\" &gt;<br /> &lt;div class=\"hover_content_rgt-midl_logo \" style=\"width:48%; float:none !important;\"&gt; &lt;img style=\"float:none !important; border:none !important;\" src=\"images/hover/zara.jpg\"&gt; &lt;/div&gt;<br /> &lt;div class=\"hover_content_rgt-midl_link\" style=\"width:100%; float:none !important;\" &gt;&lt;a href=\"product.html\"&gt;Click here to view more&lt;/a&gt;&lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;<br /> &lt;/div&gt;</p>','<div class=\"main_content_home\"> <div class=\"row home_content_block\"> <div class=\"container content_head_block\"> <h1><i>Exclusive Brands</i></h1> </div> <div class=\"container\"> <div class=\"home_img_block\">  <div class=\"col-md-7 col-sm-7 col-xs-12 home_img_block_left\"> <div class=\"row img_block_left_top\"> <div class=\"col-md-4 col-sm-4 col-xs-12 img_left_top1 pdng_3\"> <img class=\"img-responsive\" src=\"/collections/aid.jpg\">  <div class=\"img_block_right_middle_inrblock\" style=\"width:97%; top: 17%; height: 80%;\"> <div class=\"img_block_right_middle_content\" style=\"float:none !important;width:auto !important;\"> <div class=\"hover_content_rgt-midl_logo \" style=\"float:none !important;width:auto !important;\"> <img src=\"images/hover/ain.jpg\"> </div> <div class=\"hover_content_rgt-midl_link\" style=\"float:none !important;width:auto !important;\" ><a href=\"product.html\">Click here to view more</a></div> </div> </div>  </div> <div class=\"col-md-8 col-sm-8 col-xs-12 img_left_top2 pdng_3\"> <img class=\"img-responsive\" src=\"images/collections/heritage.jpg\"> <div class=\"img_block_right_middle_inrblock\" style=\"width:100%; top: 23%; height:60%;\"> <div class=\"img_block_right_middle_content\" > <div class=\"hover_content_rgt-midl_logo \" style=\"width:48%;\"> <img src=\"images/hover/heritage.jpg\" > </div> <div class=\"hover_content_rgt-midl_link\" ><a href=\"product.html\">Click here to view more</a></div> </div> </div> </div> </div> <div class=\"row\"> <div class=\"col-md-12 img_block_left_bottom pdng_3\"> <img class=\"img-responsive\" src=\"images/collections/glitz.jpg\">  <div class=\"img_block_right_middle_inrblock\" style=\"width:101%; top: -17%; height: 145%;\"> <div class=\"img_block_right_middle_content\" > <div class=\"hover_content_rgt-midl_logo \" style=\"width:48%;\"> <img src=\"images/hover/glitz.jpg\"> </div> <div class=\"hover_content_rgt-midl_link\" ><a href=\"product.html\">Click here to view more</a></div> </div> </div> </div> </div> </div> <div class=\"col-md-5 col-sm-5 col-xs-12 home_img_block_right\"> <div class=\"row img_block_right_top\"> <div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"> <img class=\"img-responsive\" src=\"images/collections/devo.jpg\"> <div class=\"img_block_right_middle_inrblock\" style=\"width:100%; top: -10%; height: 136%;\"> <div class=\"img_block_right_middle_content\" > <div class=\"hover_content_rgt-midl_logo \" style=\"width:48%; float:none !important;\"> <img style=\"float:none !important; border:none !important;\" src=\"images/hover/devo.jpg\"> </div> <div class=\"hover_content_rgt-midl_link\" style=\"width:100%; float:none !important;\" ><a href=\"#\">Click here to view more</a></div> </div> </div> </div> <div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"> <img class=\"img-responsive\" src=\"images/collections/platinum.jpg\"> <div class=\"img_block_right_middle_inrblock\" style=\"width:99%; top: -10%; height: 136%;\"> <div class=\"img_block_right_middle_content\" > <div class=\"hover_content_rgt-midl_logo \" style=\"width:48%; float:none !important;\"> <img style=\"float:none !important; border:none !important;\" src=\"images/hover/pl.jpg\"> </div> <div class=\"hover_content_rgt-midl_link\" style=\"width:100%; float:none !important;\" ><a href=\"product.html\">Click here to view more</a></div> </div> </div> </div> </div> <div class=\"row img_block_right_middle pdng_3\"> <img class=\"img-responsive\" src=\"images/collections/benzer.jpg\"> <div class=\"img_block_right_middle_inrblock\"> <div class=\"img_block_right_middle_content\"> <div class=\"hover_content_rgt-midl_logo\"> <img src=\"images/hover-logo-benzer.png\"> </div> <div class=\"hover_content_rgt-midl_link\"><a href=\"product.html\">Click here to view more</a></div> </div> </div> </div> <div class=\"row img_block_right_bottom\"> <div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"> <img class=\"img-responsive\" src=\"images/collections/isma.jpg\">  <div class=\"img_block_right_middle_inrblock\" style=\"width:100%; top: -32%; height: 192%;\"> <div class=\"img_block_right_middle_content\" > <div class=\"hover_content_rgt-midl_logo \" style=\"width:48%; float:none !important;\"> <img style=\"float:none !important; border:none !important;\" src=\"images/hover/isma.jpg\"> </div> <div class=\"hover_content_rgt-midl_link\" style=\"width:100%; float:none !important;\" ><a href=\"product.html\">Click here to view more</a></div> </div> </div> </div> <div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"> <img class=\"img-responsive\" src=\"images/collections/zaara.jpg\">  <div class=\"img_block_right_middle_inrblock\" style=\"width:98%; top: -32%; height: 192%;\"> <div class=\"img_block_right_middle_content\" > <div class=\"hover_content_rgt-midl_logo \" style=\"width:48%; float:none !important;\"> <img style=\"float:none !important; border:none !important;\" src=\"images/hover/zara.jpg\"> </div> <div class=\"hover_content_rgt-midl_link\" style=\"width:100%; float:none !important;\" ><a href=\"product.html\">Click here to view more</a></div> </div> </div> </div> </div> </div> </div> </div> </div> </div> </div>','draft',0,NULL,NULL,'public',NULL,'Post','2015-08-18 15:31:22','2015-08-18 15:31:22',1),(9,'home','home-1','<div class=\"container content_head_block\">\r\n<h1><em>Exclusive Brands</em></h1>\r\n</div>\r\n<div class=\"container\">\r\n<div class=\"home_img_block\">\r\n<div class=\"col-md-7 col-sm-7 col-xs-12 home_img_block_left\">\r\n<div class=\"row img_block_left_top\">\r\n<div class=\"col-md-4 col-sm-4 col-xs-12 img_left_top1 pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/aid.jpg\" alt=\"\" width=\"194\" height=\"444\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 97%; top: 17%; height: 80%;\">\r\n<div class=\"img_block_right_middle_content\" style=\"float: none !important; width: auto !important;\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"float: none !important; width: auto !important;\"><img src=\"http://localhost:3000/media/1/ain.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"float: none !important; width: auto !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-8 col-sm-8 col-xs-12 img_left_top2 pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/heritage.jpg\" alt=\"\" width=\"350\" height=\"395\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: 23%; height: 60%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%;\"><img src=\"http://localhost:3000/media/1/heritage-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-md-12 img_block_left_bottom pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/glitz.jpg\" alt=\"\" width=\"593\" height=\"178\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 101%; top: -17%; height: 145%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%;\"><img src=\"http://localhost:3000/media/1/glitz-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-5 col-sm-5 col-xs-12 home_img_block_right\">\r\n<div class=\"row img_block_right_top\">\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/devo.jpg\" alt=\"\" width=\"196\" height=\"220\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: -10%; height: 136%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/devo-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"#\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/platinum.jpg\" alt=\"\" width=\"196\" height=\"220\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 99%; top: -10%; height: 136%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/pl-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row img_block_right_middle pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/benzer.jpg\" alt=\"\" width=\"398\" height=\"210\" />\r\n<div class=\"img_block_right_middle_inrblock\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo\"><img src=\"http://localhost:3000/media/1/hover-logo-benzer.png\" alt=\"\" width=\"160\" height=\"62\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row img_block_right_bottom\">\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/isma.jpg\" alt=\"\" width=\"198\" height=\"148\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: -32%; height: 192%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/isma-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/zaara.jpg\" alt=\"\" width=\"198\" height=\"148\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 98%; top: -32%; height: 192%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/zara-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',' Exclusive Brands          Click here to view more        Click here to view more          Click here to view more            Click here to view more        Click here to view more         Click here to view more         Click here to view more        Click here to view more       ','trash',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:08:20','2015-08-18 16:08:20',1),(11,'Home','index','<div class=\"container content_head_block\">\r\n<h1><em>Exclusive Brands</em></h1>\r\n</div>\r\n<div class=\"container\">\r\n<div class=\"home_img_block\">\r\n<div class=\"col-md-7 col-sm-7 col-xs-12 home_img_block_left\">\r\n<div class=\"row img_block_left_top\">\r\n<div class=\"col-md-4 col-sm-4 col-xs-12 img_left_top1 pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/aid.jpg\" alt=\"\" width=\"194\" height=\"444\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 97%; top: 17%; height: 80%;\">\r\n<div class=\"img_block_right_middle_content\" style=\"float: none !important; width: auto !important;\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"float: none !important; width: auto !important;\"><img src=\"http://localhost:3000/media/1/ain.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"float: none !important; width: auto !important;\"><a href=\"http://localhost:3000/exclusive-brands.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-8 col-sm-8 col-xs-12 img_left_top2 pdng_3\"><a href=\"http://localhost:3000/exclusive-brands.html\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/heritage.jpg\" alt=\"\" width=\"350\" height=\"395\" /></a>\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: 23%; height: 60%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%;\"><a href=\"http://localhost:3000/exclusive-brands.html\"><img src=\"http://localhost:3000/media/1/heritage-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></a></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/exclusive-brands.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-md-12 img_block_left_bottom pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/glitz.jpg\" alt=\"\" width=\"593\" height=\"178\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 101%; top: -17%; height: 145%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%;\"><img src=\"http://localhost:3000/media/1/glitz-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/exclusive-brands.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-5 col-sm-5 col-xs-12 home_img_block_right\">\r\n<div class=\"row img_block_right_top\">\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/devo.jpg\" alt=\"\" width=\"196\" height=\"220\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: -10%; height: 136%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/devo-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/exclusive-brands.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/platinum.jpg\" alt=\"\" width=\"196\" height=\"220\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 99%; top: -10%; height: 136%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/pl-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/exclusive-brands.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row img_block_right_middle pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/benzer.jpg\" alt=\"\" width=\"398\" height=\"210\" />\r\n<div class=\"img_block_right_middle_inrblock\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo\"><img src=\"http://localhost:3000/media/1/hover-logo-benzer.png\" alt=\"\" width=\"160\" height=\"62\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/exclusive-brands.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row img_block_right_bottom\">\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/isma.jpg\" alt=\"\" width=\"198\" height=\"148\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: -32%; height: 192%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/isma-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/exclusive-brands.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/zaara.jpg\" alt=\"\" width=\"198\" height=\"148\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 98%; top: -32%; height: 192%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/zara-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/exclusive-brands.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',' Exclusive Brands          Click here to view more        Click here to view more          Click here to view more            Click here to view more        Click here to view more         Click here to view more         Click here to view more        Click here to view more       ','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:10:07','2015-08-18 18:41:37',1),(12,'home','index','<div class=\"container content_head_block\">\r\n<h1><em>Exclusive Brands</em></h1>\r\n</div>\r\n<div class=\"container\">\r\n<div class=\"home_img_block\">\r\n<div class=\"col-md-7 col-sm-7 col-xs-12 home_img_block_left\">\r\n<div class=\"row img_block_left_top\">\r\n<div class=\"col-md-4 col-sm-4 col-xs-12 img_left_top1 pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/aid.jpg\" alt=\"\" width=\"194\" height=\"444\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 97%; top: 17%; height: 80%;\">\r\n<div class=\"img_block_right_middle_content\" style=\"float: none !important; width: auto !important;\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"float: none !important; width: auto !important;\"><img src=\"http://localhost:3000/media/1/ain.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"float: none !important; width: auto !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-8 col-sm-8 col-xs-12 img_left_top2 pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/heritage.jpg\" alt=\"\" width=\"350\" height=\"395\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: 23%; height: 60%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%;\"><img src=\"http://localhost:3000/media/1/heritage-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-md-12 img_block_left_bottom pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/glitz.jpg\" alt=\"\" width=\"593\" height=\"178\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 101%; top: -17%; height: 145%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%;\"><img src=\"http://localhost:3000/media/1/glitz-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-5 col-sm-5 col-xs-12 home_img_block_right\">\r\n<div class=\"row img_block_right_top\">\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/devo.jpg\" alt=\"\" width=\"196\" height=\"220\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: -10%; height: 136%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/devo-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"#\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/platinum.jpg\" alt=\"\" width=\"196\" height=\"220\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 99%; top: -10%; height: 136%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/pl-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row img_block_right_middle pdng_3\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/benzer.jpg\" alt=\"\" width=\"398\" height=\"210\" />\r\n<div class=\"img_block_right_middle_inrblock\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo\"><img src=\"http://localhost:3000/media/1/hover-logo-benzer.png\" alt=\"\" width=\"160\" height=\"62\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row img_block_right_bottom\">\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top1\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/isma.jpg\" alt=\"\" width=\"198\" height=\"148\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 100%; top: -32%; height: 192%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/isma-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-6 col-xs-12 pdng_3 img_right_top2\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/zaara.jpg\" alt=\"\" width=\"198\" height=\"148\" />\r\n<div class=\"img_block_right_middle_inrblock\" style=\"width: 98%; top: -32%; height: 192%;\">\r\n<div class=\"img_block_right_middle_content\">\r\n<div class=\"hover_content_rgt-midl_logo \" style=\"width: 48%; float: none !important;\"><img style=\"float: none !important; border: none !important;\" src=\"http://localhost:3000/media/1/zara-h.jpg\" alt=\"\" width=\"147\" height=\"46\" /></div>\r\n<div class=\"hover_content_rgt-midl_link\" style=\"width: 100%; float: none !important;\"><a href=\"http://localhost:3000/admin/post_type/2/posts/1/product.html\">Click here to view more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',' Exclusive Brands          Click here to view more        Click here to view more          Click here to view more            Click here to view more        Click here to view more         Click here to view more         Click here to view more        Click here to view more       ','draft',0,NULL,9,'public',NULL,'Post','2015-08-18 16:20:54','2015-08-18 16:25:30',1),(15,'About us','about-us','<div>&nbsp;</div>',' ','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:37:02','2015-08-18 18:23:47',1),(19,'Exclusive brands','exclusive-brands','<div class=\"col-md-12 text-center heritage-logo\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/heritage-logo.jpg\" alt=\"\" width=\"185\" height=\"108\" />\r\n<h1 class=\"title\">Exquisite Heritage Collections</h1>\r\n</div>',' Exquisite Heritage Collections ','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:40:16','2015-08-18 18:16:54',1),(20,'Exclusive brands','brands',NULL,'','trash',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:40:58','2015-08-18 16:40:58',1),(21,'Exclusive brands','brands',NULL,'','draft',0,NULL,20,'public',NULL,'Post','2015-08-18 16:41:59','2015-08-18 16:41:59',1),(23,'Media','media','<div>&nbsp;</div>',' ','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:42:18','2015-08-18 18:26:15',1),(25,'Careers','careers','<div>&nbsp;</div>',' ','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:42:33','2015-08-18 18:25:24',1),(27,'Showrooms','showrooms','<div>&nbsp;</div>',' ','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:42:55','2015-08-18 18:25:08',1),(29,'Reach us','reach-us','<div>&nbsp;</div>',' ','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 16:43:14','2015-08-18 18:24:52',1),(34,'sss','sss','<div class=\"col-md-12 text-center heritage-logo\"><img class=\"img-responsive\" src=\"http://localhost:3000/media/1/heritage-logo.jpg\" alt=\"\" width=\"185\" height=\"108\" />\r\n<h1 class=\"title\">Exquisite Heritage Collections</h1>\r\n</div>',' Exquisite Heritage Collections ','trash',0,NULL,NULL,'public',NULL,'Post','2015-08-18 17:12:39','2015-08-18 17:15:03',1),(38,'Model No. H5698','model-no-h5698','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 17:31:48','2015-08-18 17:31:48',1),(39,'Model No. H5698','model1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 17:32:09','2015-08-18 17:32:09',1),(41,'Model No. H5698','model-no-h5698-1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 17:37:04','2015-08-18 18:06:11',1),(42,'sfds','sfds','','','draft',0,NULL,NULL,'public',NULL,'Post','2015-08-18 17:45:44','2015-08-18 17:45:44',1),(43,'Model No. H5698','model-no-h5698','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 18:05:34','2015-08-18 18:05:34',1),(45,'Model No. H5698','model-no-h5698-2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 18:08:39','2015-08-18 18:08:39',1),(47,'Model No. H5698','model-no-h5698-3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 18:10:05','2015-08-18 18:10:05',1),(49,'Model No. H5698','model-no-h5698-4','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 18:11:05','2015-08-18 18:11:05',1),(51,'Model No. H5698','model-no-h5698-5','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.</p>','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec aliquet.','published',0,NULL,NULL,'public',NULL,'Post','2015-08-18 18:11:53','2015-08-18 18:11:53',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150611161134');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_relationships`
--

DROP TABLE IF EXISTS `term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` int(11) DEFAULT NULL,
  `term_order` int(11) DEFAULT NULL,
  `term_taxonomy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_term_relationships_on_objectid` (`objectid`),
  KEY `index_term_relationships_on_term_order` (`term_order`),
  KEY `index_term_relationships_on_term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_relationships`
--

LOCK TABLES `term_relationships` WRITE;
/*!40000 ALTER TABLE `term_relationships` DISABLE KEYS */;
INSERT INTO `term_relationships` VALUES (1,1,NULL,2),(2,1,NULL,6),(3,2,NULL,7),(4,3,NULL,2),(7,3,NULL,6),(17,9,NULL,7),(19,11,NULL,7),(20,12,NULL,7),(23,15,NULL,7),(27,19,NULL,7),(28,20,NULL,7),(29,21,NULL,7),(31,23,NULL,7),(33,25,NULL,7),(35,27,NULL,7),(37,29,NULL,7),(42,34,NULL,7),(49,41,NULL,31),(50,42,NULL,2),(51,42,NULL,6),(52,43,NULL,31),(54,45,NULL,31),(56,47,NULL,31),(58,49,NULL,31),(60,51,NULL,31);
/*!40000 ALTER TABLE `term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_taxonomy`
--

DROP TABLE IF EXISTS `term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_taxonomy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxonomy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term_group` int(11) DEFAULT NULL,
  `term_order` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_term_taxonomy_on_taxonomy` (`taxonomy`),
  KEY `index_term_taxonomy_on_parent_id` (`parent_id`),
  KEY `index_term_taxonomy_on_slug` (`slug`),
  KEY `index_term_taxonomy_on_term_order` (`term_order`),
  KEY `index_term_taxonomy_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_taxonomy`
--

LOCK TABLES `term_taxonomy` WRITE;
/*!40000 ALTER TABLE `term_taxonomy` DISABLE KEYS */;
INSERT INTO `term_taxonomy` VALUES (1,'site','',NULL,NULL,'dgd','localhost:3000',NULL,NULL,NULL,'2015-08-18 15:12:18','2015-08-18 18:54:22',NULL),(2,'post_type','Posts',1,3,'Post','post',NULL,NULL,NULL,'2015-08-18 15:12:18','2015-08-18 15:12:18',NULL),(3,'user_roles','Default roles admin',1,NULL,'Administrator','admin',-1,NULL,NULL,'2015-08-18 15:12:19','2015-08-18 15:12:19',NULL),(4,'user_roles','Editor Role',1,NULL,'Editor','editor',NULL,NULL,NULL,'2015-08-18 15:12:20','2015-08-18 15:12:20',NULL),(5,'user_roles','Contributor Role',1,NULL,'Contributor','contributor',NULL,NULL,NULL,'2015-08-18 15:12:20','2015-08-18 15:12:20',NULL),(6,'category',NULL,2,0,'Uncategorized','uncategorized',1,NULL,'2','2015-08-18 15:12:20','2015-08-18 15:12:20',NULL),(7,'post_type','Pages',1,7,'Page','page',NULL,NULL,NULL,'2015-08-18 15:12:20','2015-08-18 15:12:20',NULL),(8,'sidebar',NULL,1,NULL,'default sidebar','default-sidebar',NULL,NULL,NULL,'2015-08-18 15:12:20','2015-08-18 15:12:20',NULL),(9,'nav_menu',NULL,1,6,'Main Menu','main_menu',NULL,NULL,NULL,'2015-08-18 15:12:20','2015-08-18 15:12:20',NULL),(12,'user_roles','Default roles client',1,NULL,'Client','client',-1,NULL,NULL,'2015-08-18 15:12:21','2015-08-18 15:12:21',NULL),(13,'plugin',NULL,1,NULL,'front_cache','front_cache',1,NULL,NULL,'2015-08-18 15:12:21','2015-08-18 15:12:21',NULL),(14,'plugin',NULL,1,NULL,'contact_form','contact_form',1,NULL,NULL,'2015-08-18 15:12:22','2015-08-18 15:12:22',NULL),(15,'plugin',NULL,1,NULL,'attack','attack',1,NULL,NULL,'2015-08-18 15:12:23','2015-08-18 15:12:23',NULL),(18,'theme',NULL,1,NULL,'Clean Theme','new',NULL,NULL,NULL,'2015-08-18 15:18:28','2015-08-18 15:18:28',NULL),(31,'post_type','',1,6,'brand','brand',NULL,NULL,NULL,'2015-08-18 17:36:21','2015-08-18 17:36:21',NULL),(32,'nav_menu_item',NULL,9,NULL,'About us','about-us',NULL,NULL,NULL,'2015-08-18 18:56:09','2015-08-18 18:56:09',NULL),(33,'nav_menu_item',NULL,9,NULL,'Exclusive brands','exclusive-brands',NULL,NULL,NULL,'2015-08-18 18:56:09','2015-08-18 18:56:09',NULL),(34,'nav_menu_item',NULL,9,NULL,'Media','media',NULL,NULL,NULL,'2015-08-18 18:56:09','2015-08-18 18:56:09',NULL),(35,'nav_menu_item',NULL,9,NULL,'Careers','careers',NULL,NULL,NULL,'2015-08-18 18:56:09','2015-08-18 18:56:09',NULL),(36,'nav_menu_item',NULL,9,NULL,'Showrooms','showrooms',NULL,NULL,NULL,'2015-08-18 18:56:09','2015-08-18 18:56:09',NULL),(37,'nav_menu_item',NULL,9,NULL,'Reach us','reach-us',NULL,NULL,NULL,'2015-08-18 18:56:09','2015-08-18 18:56:09',NULL);
/*!40000 ALTER TABLE `term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_relationships`
--

DROP TABLE IF EXISTS `user_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term_order` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `term_taxonomy_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_relationships_on_term_taxonomy_id` (`term_taxonomy_id`),
  KEY `index_user_relationships_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_relationships`
--

LOCK TABLES `user_relationships` WRITE;
/*!40000 ALTER TABLE `user_relationships` DISABLE KEYS */;
INSERT INTO `user_relationships` VALUES (1,NULL,1,1,1);
/*!40000 ALTER TABLE `user_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'client',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `password_reset_sent_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `index_users_on_username` (`username`),
  KEY `index_users_on_role` (`role`),
  KEY `index_users_on_email` (`email`),
  KEY `index_users_on_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@local.com','admin','$2a$10$aT1UcM48/jgJMM0y29BGlOeKzRUgdry9evK3LqywDnYPh136UZDvy','FkLfRE2F-woO3ecCCoaSaA',NULL,NULL,NULL,'2015-08-18 18:53:35','2015-08-18 15:12:20','2015-08-18 18:53:35',-1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-19  0:44:26
