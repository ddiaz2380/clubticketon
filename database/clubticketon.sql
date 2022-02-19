/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : clubticketon

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 19/02/2022 19:29:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_table
-- ----------------------------
DROP TABLE IF EXISTS `address_table`;
CREATE TABLE `address_table`  (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `country` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `postcode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `town` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`address_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_address` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address_table
-- ----------------------------
INSERT INTO `address_table` VALUES (9, 2, 'Brunei Darussalam', 'BE3119', 'No 48', 'BSB');

-- ----------------------------
-- Table structure for cart_table
-- ----------------------------
DROP TABLE IF EXISTS `cart_table`;
CREATE TABLE `cart_table`  (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date_buy` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_cart` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_table
-- ----------------------------
INSERT INTO `cart_table` VALUES (12, 2, '2022-10-30 09:12:01', 1);
INSERT INTO `cart_table` VALUES (13, 2, '2022-10-31 10:24:58', 1);
INSERT INTO `cart_table` VALUES (15, 2, '2022-02-16 17:22:23', 1);
INSERT INTO `cart_table` VALUES (16, 2, '2022-02-16 17:41:24', 1);
INSERT INTO `cart_table` VALUES (17, 4, '0000-00-00 00:00:00', 0);
INSERT INTO `cart_table` VALUES (18, 2, '2022-02-18 01:52:52', 1);
INSERT INTO `cart_table` VALUES (19, 2, '0000-00-00 00:00:00', 0);

-- ----------------------------
-- Table structure for category_table
-- ----------------------------
DROP TABLE IF EXISTS `category_table`;
CREATE TABLE `category_table`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parent_category_id` int NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category_table
-- ----------------------------
INSERT INTO `category_table` VALUES (19, 'Calzado', 0);
INSERT INTO `category_table` VALUES (20, 'Joyeria', 0);
INSERT INTO `category_table` VALUES (21, 'Relojes', 0);
INSERT INTO `category_table` VALUES (22, 'Vestimenta', 0);
INSERT INTO `category_table` VALUES (23, 'Carteras', 0);
INSERT INTO `category_table` VALUES (25, 'Totes Bags', 23);
INSERT INTO `category_table` VALUES (26, 'Wallets', 23);
INSERT INTO `category_table` VALUES (27, 'Briefcase', 23);
INSERT INTO `category_table` VALUES (28, 'Casual', 19);
INSERT INTO `category_table` VALUES (29, 'Formal', 19);
INSERT INTO `category_table` VALUES (30, 'Sandalias', 19);
INSERT INTO `category_table` VALUES (32, 'Brazalete', 20);
INSERT INTO `category_table` VALUES (33, 'K-gold', 20);
INSERT INTO `category_table` VALUES (34, 'Mecanico', 21);
INSERT INTO `category_table` VALUES (35, 'Quartz', 21);
INSERT INTO `category_table` VALUES (36, 'Sport', 21);
INSERT INTO `category_table` VALUES (37, 'Digital', 21);
INSERT INTO `category_table` VALUES (38, 'Hoodie', 22);
INSERT INTO `category_table` VALUES (39, 'Jacket', 22);
INSERT INTO `category_table` VALUES (40, 'Beanie', 22);
INSERT INTO `category_table` VALUES (41, 'Basico', 19);

-- ----------------------------
-- Table structure for contact_table
-- ----------------------------
DROP TABLE IF EXISTS `contact_table`;
CREATE TABLE `contact_table`  (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `submit_time` datetime NOT NULL DEFAULT current_timestamp,
  `flag` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact_table
-- ----------------------------

-- ----------------------------
-- Table structure for municipio_table
-- ----------------------------
DROP TABLE IF EXISTS `municipio_table`;
CREATE TABLE `municipio_table`  (
  `municipio_id` int NOT NULL AUTO_INCREMENT,
  `municipio_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`municipio_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of municipio_table
-- ----------------------------

-- ----------------------------
-- Table structure for product_cart_table
-- ----------------------------
DROP TABLE IF EXISTS `product_cart_table`;
CREATE TABLE `product_cart_table`  (
  `product_cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`product_cart_id`) USING BTREE,
  INDEX `cart_id`(`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `product_cart_table_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart_table` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_cart_table_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_cart_table
-- ----------------------------
INSERT INTO `product_cart_table` VALUES (1, 12, 1, 1, '2022-10-30 01:10:29');
INSERT INTO `product_cart_table` VALUES (2, 12, 11, 1, '2022-10-30 01:10:36');
INSERT INTO `product_cart_table` VALUES (3, 12, 17, 1, '2022-10-30 01:10:42');
INSERT INTO `product_cart_table` VALUES (4, 12, 10, 2, '2022-10-30 01:11:16');
INSERT INTO `product_cart_table` VALUES (5, 12, 1, 3, '2022-10-30 01:11:28');
INSERT INTO `product_cart_table` VALUES (6, 13, 2, 1, '2022-10-30 16:03:42');
INSERT INTO `product_cart_table` VALUES (7, 13, 2, 2, '2022-10-31 02:23:23');
INSERT INTO `product_cart_table` VALUES (9, 13, 32, 1, '2022-10-31 02:23:47');
INSERT INTO `product_cart_table` VALUES (11, 15, 2, 1, '2022-10-31 02:36:33');
INSERT INTO `product_cart_table` VALUES (12, 16, 4, 1, '2022-02-16 20:41:05');
INSERT INTO `product_cart_table` VALUES (17, 17, 7, 1, '2022-02-17 10:50:28');
INSERT INTO `product_cart_table` VALUES (18, 18, 3, 1, '2022-02-18 01:52:10');
INSERT INTO `product_cart_table` VALUES (19, 19, 2, 1, '2022-02-18 01:53:34');
INSERT INTO `product_cart_table` VALUES (20, 19, 2, 1, '2022-02-18 14:44:51');

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `product_images_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_link` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`product_images_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `product_images` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, 1, 'uploads/casual_shoe_1.jpg');
INSERT INTO `product_images` VALUES (2, 2, 'uploads/casual_shoe_2.jpg');
INSERT INTO `product_images` VALUES (3, 3, 'uploads/casual_shoe_3.jpg');
INSERT INTO `product_images` VALUES (4, 4, 'uploads/formal_shoe_1.jpg');
INSERT INTO `product_images` VALUES (5, 5, 'uploads/formal_shoe_2.jpg');
INSERT INTO `product_images` VALUES (6, 6, 'uploads/sandal_shoe_1.jpg');
INSERT INTO `product_images` VALUES (7, 7, 'uploads/sandal_shoe_2.jpg');
INSERT INTO `product_images` VALUES (8, 8, 'uploads/sandal_shoe_3.jpg');
INSERT INTO `product_images` VALUES (9, 9, 'uploads/bracelet_2.jpg');
INSERT INTO `product_images` VALUES (10, 10, 'uploads/bracelet_3.jpg');
INSERT INTO `product_images` VALUES (11, 11, 'uploads/bracelet_4.jpg');
INSERT INTO `product_images` VALUES (12, 12, 'uploads/kgold_1.jpg');
INSERT INTO `product_images` VALUES (13, 13, 'uploads/kgold_2.jpg');
INSERT INTO `product_images` VALUES (14, 14, 'uploads/kgold_3.jpg');
INSERT INTO `product_images` VALUES (15, 15, 'uploads/mechanical_1.jpg');
INSERT INTO `product_images` VALUES (16, 16, 'uploads/mechanical_2.jpg');
INSERT INTO `product_images` VALUES (17, 17, 'uploads/mechanical_3.jpg');
INSERT INTO `product_images` VALUES (18, 18, 'uploads/quartz_1.jpg');
INSERT INTO `product_images` VALUES (19, 19, 'uploads/digital_1.jpg');
INSERT INTO `product_images` VALUES (20, 20, 'uploads/digital_2.jpg');
INSERT INTO `product_images` VALUES (21, 21, 'uploads/sport_1.jpg');
INSERT INTO `product_images` VALUES (22, 22, 'uploads/hoodie_1.jpg');
INSERT INTO `product_images` VALUES (23, 23, 'uploads/hoodie_2.jpg');
INSERT INTO `product_images` VALUES (24, 24, 'uploads/hoodie_3.jpg');
INSERT INTO `product_images` VALUES (26, 26, 'uploads/jacket_2.jpg');
INSERT INTO `product_images` VALUES (27, 27, 'uploads/jacket_3.jpg');
INSERT INTO `product_images` VALUES (28, 28, 'uploads/beanie_1.jpg');
INSERT INTO `product_images` VALUES (29, 29, 'uploads/beanie_2.jpg');
INSERT INTO `product_images` VALUES (30, 30, 'uploads/21192252_190708938136878_7205230965370112151_n.jpg');
INSERT INTO `product_images` VALUES (31, 31, 'uploads/totes_2.jpg');
INSERT INTO `product_images` VALUES (32, 32, 'uploads/totes_3.jpg');
INSERT INTO `product_images` VALUES (33, 33, 'uploads/wallet_1.jpg');
INSERT INTO `product_images` VALUES (34, 34, 'uploads/wallet_2.jpg');
INSERT INTO `product_images` VALUES (35, 35, 'uploads/wallet_3.jpg');
INSERT INTO `product_images` VALUES (36, 36, 'uploads/briefcase_1.jpg');

-- ----------------------------
-- Table structure for product_table
-- ----------------------------
DROP TABLE IF EXISTS `product_table`;
CREATE TABLE `product_table`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `seller_id` int NOT NULL,
  `product_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `price` int NOT NULL,
  `short_desc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `active_flag` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `seller_id`(`seller_id`) USING BTREE,
  CONSTRAINT `product_category` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_product` FOREIGN KEY (`seller_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_table
-- ----------------------------
INSERT INTO `product_table` VALUES (1, 28, 1, 'Winter Casual Ankle Boots ', 230, 'Warm Winter Fur Shoes Leather Footwear', '<ul>\r\n	<li>Brand Name:JINTOHO</li>\r\n	<li>Upper Material:Cow Suede</li>\r\n	<li>Boot Height:Ankle</li>\r\n	<li>Boot Type:Snow Boots</li>\r\n	<li>Toe Shape:Round Toe</li>\r\n	<li>Insole Material:Short Plush</li>\r\n	<li>Outsole Material:Rubber</li>\r\n	<li>Lining Material:Short Plush</li>\r\n	<li>Shaft Material:Cow Suede</li>\r\n	<li>Closure Type:Zip</li>\r\n	<li>Fashion Element:Turned-over Edge</li>\r\n	<li>Season:Winter</li>\r\n	<li>Pattern Type:Mixed Colors</li>\r\n	<li>is_handmade:No</li>\r\n	<li>Fit:Fits true to size, take your normal size</li>\r\n	<li>Heel Height:Low (1cm-3cm)</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Item Type:Boots</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (2, 28, 1, 'Ubfen Mesh Breathable Casual Shoes', 190, 'Lazy Male Shoes', '<ul>\r\n	<li>Brand Name:UBFEN</li>\r\n	<li>Upper Material:Synthetic</li>\r\n	<li>Feature:Breathable,Height Increasing,Hard-Wearing,Light,Sweat-Absorbant,Anti-Odor</li>\r\n	<li>Closure Type:Lace-Up</li>\r\n	<li>Outsole Material:EVA</li>\r\n	<li>Lining Material:Mesh</li>\r\n	<li>Season:Spring/Autumn</li>\r\n	<li>Insole Material:EVA</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Fit:Fits smaller than usual. Please check this store&#39;s sizing info</li>\r\n	<li>Shoes Type:Basic</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Item Type:casual shoes</li>\r\n	<li>staly 1:male shoes</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (3, 28, 1, 'Schoenen Mannen Male Shoe', 170, 'Men Casual Shoes Fly Weave Show', '<ul>\r\n	<li>Brand Name:Love Myun</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Item Type:casual shoes</li>\r\n	<li>Lining Material:PU</li>\r\n	<li>Upper Material:PU</li>\r\n	<li>Fit:Fits true to size, take your normal size</li>\r\n	<li>Insole Material:EVA</li>\r\n	<li>Outsole Material:PVC</li>\r\n	<li>Feature:Breathable,Massage,Height Increasing,Waterproof</li>\r\n	<li>Shoes Type:Basic</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Closure Type:Lace-Up</li>\r\n	<li>Model Number:21</li>\r\n	<li>Season:Spring/Autumn</li>\r\n	<li>Hot Sale:Fashion</li>\r\n	<li>Casual:superstar women</li>\r\n	<li>white shoes woman:zapatos mujer 2022</li>\r\n	<li>solomons speedcross:superstar women</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (4, 29, 1, 'Grimentin Luxury Shoes', 900, 'party shoes genuine leather', '<ul>\r\n	<li>Brand Name:GRIMENTIN</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Lining-Genuine Leather Type:Cow Leather</li>\r\n	<li>Fit:Fits true to size, take your normal size</li>\r\n	<li>Upper Material:Genuine Leather</li>\r\n	<li>Insole Material:Bonded Leather</li>\r\n	<li>Shoes Type:Basic</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Lining Material:Genuine Leather</li>\r\n	<li>Toe Shape:Pointed Toe</li>\r\n	<li>Outsole Material:Rubber</li>\r\n	<li>Closure Type:Hook &amp; Loop</li>\r\n	<li>Model Number:2z140 mens party shoes</li>\r\n	<li>Season:Spring/Autumn</li>\r\n	<li>Upper-Genuine Leather Type:Cow Leather</li>\r\n	<li>Occasion:Party</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (5, 29, 1, 'Vintage Design Dress Shoes', 280, 'Patent leather Business Dress Shoes', '<ul>\r\n	<li>Brand Name:Albrey</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Lining Material:PU</li>\r\n	<li>Closure Type:Lace-Up</li>\r\n	<li>Toe Shape:Pointed Toe</li>\r\n	<li>Outsole Material:Rubber</li>\r\n	<li>Fit:Fits true to size, take your normal size</li>\r\n	<li>Upper Material:PU</li>\r\n	<li>Model Number:S100701</li>\r\n	<li>Season:Spring/Autumn</li>\r\n	<li>Shoes Type:Basic</li>\r\n	<li>Insole Material:PU</li>\r\n	<li>Pattern Type:Floral</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (6, 30, 1, 'Zapatos Men Sandals', 250, 'Outdoor Flats Beach Shoes ', '<ul>\r\n	<li>Brand Name:UEXIA</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Item Type:Sandals</li>\r\n	<li>Lining Material:PU</li>\r\n	<li>Fit:Fits true to size, take your normal size</li>\r\n	<li>Sandal Type:Ankle Strap</li>\r\n	<li>Heel Height:Low (1cm-3cm)</li>\r\n	<li>Occasion:Casual</li>\r\n	<li>Upper Material:Split Leather</li>\r\n	<li>Insole Material:PU</li>\r\n	<li>Model Number:leather Mules</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Closure Type:Lace-Up</li>\r\n	<li>Outsole Material:Rubber</li>\r\n	<li>Fashion Element:Cross-tied</li>\r\n	<li>Style:Classics</li>\r\n	<li>Summer Men Sandals :Plus Size</li>\r\n	<li>Leather Sandals :Brown Khaki Green</li>\r\n	<li>Men Large Size :Top quality sandal</li>\r\n	<li>2022 new arrival :spring and summer</li>\r\n	<li>men sandals:leather</li>\r\n	<li>outdoor shoes:men leather sandals</li>\r\n	<li>Toe Protect:Soft Sole</li>\r\n	<li>Casual Shoes :Outdoor Beach Shoes</li>\r\n	<li>summer Leather Men Sandals:High Quality</li>\r\n	<li>Fashion Comfort :Top Quality</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (7, 30, 1, 'Croc Clogs Men Slip On', 120, 'Garden Shoes Lightweight Beach Sandals ', '<ul>\r\n	<li>Brand Name:ALEADER</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Item Type:Sandals</li>\r\n	<li>Outsole Material:EVA</li>\r\n	<li>Heel Height:Flat (&le;1cm)</li>\r\n	<li>Fit:Fits true to size, take your normal size</li>\r\n	<li>Sandal Type:Fisherman</li>\r\n	<li>Closure Type:Slip-On</li>\r\n	<li>Insole Material:EVA</li>\r\n	<li>Occasion:Casual</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Lining Material:PVC</li>\r\n	<li>Style:Concise</li>\r\n	<li>Model Number:WY-L626 yeezy sandals,yeezy slippers,flip flops men</li>\r\n	<li>Upper Material:EVA</li>\r\n	<li>Feature:Quick Dry Water Shoes,Breathable,Quick Drying,men sandals</li>\r\n	<li>Gender:sapatenis masculino,men sneakers,men garden shoes,clogs,crocs clogs</li>\r\n	<li>Year :New 2022 water shoes</li>\r\n	<li>Season:Summer sandals,beach shoes</li>\r\n	<li>is_customized:Yes</li>\r\n	<li>Upper Material:EVA</li>\r\n	<li>Upper Height:Low</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (8, 30, 1, 'Zapatos Sandalias Hombre', 330, 'Summer Beach Shoes Sandals Fashion Designers', '<ul>\r\n	<li>Brand Name:IAHEAD</li>\r\n	<li>Sandal Type:Basic</li>\r\n	<li>Upper Material:PU</li>\r\n	<li>Closure Type:Elastic band</li>\r\n	<li>Outsole Material:Rubber</li>\r\n	<li>Insole Material:Latex</li>\r\n	<li>Lining Material:None</li>\r\n	<li>Heel Height:Low (1cm-3cm)</li>\r\n	<li>Model Number:MF351</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Style:Fashion</li>\r\n	<li>Fashion Element:Shallow</li>\r\n	<li>Fit:Fits true to size, take your normal size</li>\r\n	<li>Occasion:Casual</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Item Type:Sandals</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Athletic Shoe Type:Men slippers</li>\r\n	<li>Color :Red Blue Yellow</li>\r\n	<li>Size:38 39 40 41 42 43 44 46</li>\r\n	<li>men leather sandal:summer sandals men</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (9, 32, 1, 'Natural Lava Stone Golden Owl Bracelet', 1000, 'Premium Soft Touch Lava Stone Bracelet', '<ul>\r\n	<li>Brand Name:hebehera</li>\r\n	<li>Item Type:Bracelets</li>\r\n	<li>Fine or Fashion:Fashion</li>\r\n	<li>Shape\\pattern:Ball</li>\r\n	<li>Bracelets Type:Charm Bracelets</li>\r\n	<li>Material:Stone</li>\r\n	<li>Gender:Women</li>\r\n	<li>Chain Type:Beaded Bracelet</li>\r\n	<li>Setting Type:None</li>\r\n	<li>Function:Message Reminder,Mood Tracker,Sleep Tracker,Alarm Clock,Period Tracker,Call Reminder,Fitness Tracker</li>\r\n	<li>Compatibility:All Compatible</li>\r\n	<li>Metals Type:Zinc Alloy</li>\r\n	<li>Style:Vintage</li>\r\n</ul>\r\n', '2022-02-17 02:14:53', 0);
INSERT INTO `product_table` VALUES (10, 32, 1, 'Vnox Punk Healthy Energy Bracelet', 140, 'Black Chain Link Bracelets Jewelry ', '<ul>\r\n	<li>Brand Name:VNOX</li>\r\n	<li>Item Type:Bracelets</li>\r\n	<li>Fine or Fashion:Fashion</li>\r\n	<li>Chain Type:Link Chain</li>\r\n	<li>Style:Punk</li>\r\n	<li>Model Number:SBRM-087</li>\r\n	<li>Shape\\pattern:Round</li>\r\n	<li>Compatibility:All Compatible</li>\r\n	<li>Clasp Type:Toggle-clasps</li>\r\n	<li>Setting Type:Tension Mount</li>\r\n	<li>Bracelets Type:Chain &amp; Link Bracelets</li>\r\n	<li>Metals Type:Stainless Steel</li>\r\n	<li>Gender:Men</li>\r\n	<li>Material:Metal</li>\r\n	<li>Function:fashion 2016</li>\r\n	<li>Color:black men bracelet</li>\r\n	<li>Length:22.2cm</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (11, 32, 1, 'Rainbow Chakra Natural Lava Stone Bracelet', 1000, '7 Reiki Chakra Healing Balance Beads', '<ul>\r\n	<li>Brand Name:Xinyao</li>\r\n	<li>Item Type:Bracelets</li>\r\n	<li>Fine or Fashion:Fashion</li>\r\n	<li>Material:Stone</li>\r\n	<li>Chain Type:Rope Chain</li>\r\n	<li>Metals Type:Zinc Alloy</li>\r\n	<li>Bracelets Type:Charm Bracelets</li>\r\n	<li>Setting Type:None</li>\r\n	<li>Style:Trendy</li>\r\n	<li>Gender:Women</li>\r\n	<li>Clasp Type:Hidden-safety-clasp</li>\r\n	<li>Model Number:F3770</li>\r\n	<li>Compatibility:All Compatible</li>\r\n	<li>Shape\\pattern:Round</li>\r\n	<li>Material:Natural Stone+Alloy</li>\r\n	<li>Bead Size:8mm</li>\r\n	<li>Length:19cm</li>\r\n	<li>Colors:As same as the picture</li>\r\n	<li>Packing:1pc/opp bag</li>\r\n	<li>Style:chakra bracelet</li>\r\n	<li>Type:bracelets for men 2022</li>\r\n	<li>Design:stretch bracelet</li>\r\n	<li>Feature:mala bracelet</li>\r\n	<li>Pattern:yoga bracelet</li>\r\n</ul>\r\n', '2022-02-17 02:14:53', 0);
INSERT INTO `product_table` VALUES (12, 33, 1, 'Jewelry Palace Infinity Love', 190, 'Wedding Engagement Ring', '<ul>\r\n	<li>Brand Name:JewelryPalace</li>\r\n	<li>Item Type:Rings</li>\r\n	<li>Fine or Fashion:Fine</li>\r\n	<li>Model Number:BRI-028</li>\r\n	<li>Style:Cute/Romantic</li>\r\n	<li>Occasion:Wedding</li>\r\n	<li>Gender:Women</li>\r\n	<li>Metals Type:Silver</li>\r\n	<li>Side Stone:Other Artificial material</li>\r\n	<li>Setting Type:Prong Setting</li>\r\n	<li>Metal Stamp:925,Sterling</li>\r\n	<li>Shape\\pattern:Round</li>\r\n	<li>CertificateType:Third Party Appraisal</li>\r\n	<li>Main Stone:Zircon</li>\r\n	<li>Rings Type:Wedding Bands</li>\r\n	<li>is_customized:Yes</li>\r\n	<li>Metals Type:Silver</li>\r\n	<li>Fine or Fashion:Fine</li>\r\n	<li>Material:Gemstone</li>\r\n	<li>Main Stone:Cubic Zirconia</li>\r\n	<li>Shape:Round</li>\r\n	<li>Color:D-E</li>\r\n	<li>Country of Manufacture:Beijing, China (Mainland)</li>\r\n	<li>Wear Occasion:Wedding Anniversary Daily Office Gift Proposal</li>\r\n	<li>Metal Stamp:Silver</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (13, 33, 1, 'Jewelry Palace Bow Anniversary Wedding Ring ', 600, 'Soild 925 Sterling Silver Jewelry', '<ul>\r\n	<li>Brand Name:JewelryPalace</li>\r\n	<li>Item Type:Rings</li>\r\n	<li>Fine or Fashion:Fine</li>\r\n	<li>Gender:Women</li>\r\n	<li>Metals Type:Silver</li>\r\n	<li>Side Stone:Other Artificial material</li>\r\n	<li>Occasion:Party</li>\r\n	<li>Setting Type:Prong Setting</li>\r\n	<li>Metal Stamp:925,Sterling</li>\r\n	<li>Model Number:AR854499</li>\r\n	<li>CertificateType:Third Party Appraisal</li>\r\n	<li>Style:Trendy</li>\r\n	<li>Main Stone:Zircon</li>\r\n	<li>Shape\\pattern:Animal</li>\r\n	<li>Rings Type:Wedding Bands</li>\r\n	<li>Main Stone:Cubic Zirconia</li>\r\n	<li>Metals Type:Silver</li>\r\n	<li>Metal Stamp:S925</li>\r\n	<li>Item Type:Ring</li>\r\n	<li>Fine or Fashion:Fashion</li>\r\n	<li>Material:Gemstone</li>\r\n	<li>is_customized:Yes</li>\r\n	<li>Gift for:Girl friend / Wife / Mom</li>\r\n</ul>\r\n', '2022-02-17 02:14:53', 0);
INSERT INTO `product_table` VALUES (14, 33, 1, 'Angel Girl 925 Sterling Silver Vintage Ring', 120, 'Women Round White Jewelry Rings', '<ul>\r\n	<li>Brand Name:Angel Girl</li>\r\n	<li>Item Type:Rings</li>\r\n	<li>Fine or Fashion:Fine</li>\r\n	<li>Style:Punk</li>\r\n	<li>Metal Stamp:925,Sterling</li>\r\n	<li>Side Stone:None</li>\r\n	<li>Model Number:S-R0012-WW-Z</li>\r\n	<li>Setting Type:Bezel Setting</li>\r\n	<li>Gender:Women</li>\r\n	<li>Occasion:Anniversary</li>\r\n	<li>Shape\\pattern:Geometric</li>\r\n	<li>Main Stone:Zircon</li>\r\n	<li>Metals Type:Silver</li>\r\n	<li>Rings Type:Wedding Bands</li>\r\n	<li>CertificateType:NGSTC</li>\r\n	<li>Certificate Number:X1706118239</li>\r\n	<li>Item Type:Female Rings</li>\r\n	<li>Metal:Real 925 Sterling Silver</li>\r\n	<li>Main Stone:Zircon rings</li>\r\n	<li>Wearing Occasion:Daily / Business / Anniversary / Party / School</li>\r\n	<li>Gift:Valentine&#39;s Day / Birthday / Thanksgiving</li>\r\n	<li>For:Girl friend / Wife / Mother / Sister</li>\r\n	<li>Application:Female / Women / Girls / Ladies</li>\r\n	<li>Advantage:Good design</li>\r\n	<li>Color:White / Silver</li>\r\n	<li>Packing:Gift bag</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (15, 34, 1, 'Relogio Masculino Mens Watch', 260, 'Chronograph Quartz-watch Male', '<ul>\r\n	<li>Brand Name:LIGE</li>\r\n	<li>Item Type:Quartz Wristwatches</li>\r\n	<li>Water Resistance Depth:3Bar</li>\r\n	<li>Case Shape:Round</li>\r\n	<li>Boxes &amp; Cases Material:Paper</li>\r\n	<li>Feature:Water Resistant,Shock Resistant,Stop Watch,Complete Calendar,Auto Date</li>\r\n	<li>Dial Diameter:42mm</li>\r\n	<li>Style:Fashion &amp; Casual</li>\r\n	<li>Band Length:21cm</li>\r\n	<li>Clasp Type:Bracelet Clasp</li>\r\n	<li>Case Material:Stainless Steel</li>\r\n	<li>Band Material Type:Stainless Steel</li>\r\n	<li>Movement:Quartz</li>\r\n	<li>Model Number:LIGE9838</li>\r\n	<li>Gender:Men</li>\r\n	<li>Dial Window Material Type:Hardlex</li>\r\n	<li>Band Width:22mm</li>\r\n	<li>Case Thickness:12mm</li>\r\n	<li>Watches Men:LIGE Watches</li>\r\n	<li>Men&#39;s Fashion Watch:Watch Men</li>\r\n	<li>Relogios Masculino:Quartz Watch Men</li>\r\n	<li>Erkek Kol Saati:Watches For Men</li>\r\n	<li>Quartz-Watch Men:Sport Watches</li>\r\n	<li>LIGE Watch Men:Mens Quartz-Watch</li>\r\n	<li>Montre Homme:Reloj Hombre</li>\r\n	<li>Men&#39;s Watches:Horloges Mannen</li>\r\n	<li>Famous LIGE Watch:Men&#39;s Gift</li>\r\n	<li>Men Watch:Mens Watches Top Brand Luxury</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (16, 34, 1, 'Skeleton Hollow Fashion Mechanical', 120, 'luxury male business leather strap', '<ul>\r\n	<li>Brand Name:T-WINNER</li>\r\n	<li>Item Type:Mechanical Wristwatches</li>\r\n	<li>Case Material:Stainless Steel</li>\r\n	<li>Water Resistance Depth:3Bar</li>\r\n	<li>Dial Window Material Type:Glass</li>\r\n	<li>Movement:Mechanical Hand Wind</li>\r\n	<li>Dial Diameter:42mm</li>\r\n	<li>Clasp Type:None</li>\r\n	<li>Gender:Men</li>\r\n	<li>Style:Fashion &amp; Casual</li>\r\n	<li>Case Shape:Round</li>\r\n	<li>Band Material Type:Leather</li>\r\n	<li>Band Length:24cm</li>\r\n	<li>Band Width:20mm</li>\r\n	<li>Case Thickness:12mm</li>\r\n	<li>Model Number:WINNER</li>\r\n	<li>Item Type:Wristwatches</li>\r\n	<li>Dial Material Type:Stainless Steel</li>\r\n	<li>Condition:New with tags</li>\r\n	<li>Dial Display:Analog</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (17, 34, 1, 'KINYUED Skeleton Tourbillon Mechanical Watch', 330, ' Automatic Classic Rose Gold Leather Mechanical ', '<ul>\r\n	<li>Brand Name:KINYUED</li>\r\n	<li>Item Type:Mechanical Wristwatches</li>\r\n	<li>Feature:Water Resistant,Complete Calendar,Auto Date</li>\r\n	<li>Model Number:JYD-J1012</li>\r\n	<li>Water Resistance Depth:3Bar</li>\r\n	<li>Dial Window Material Type:Hardlex</li>\r\n	<li>Case Material:Alloy</li>\r\n	<li>Movement:Automatic Self-Wind</li>\r\n	<li>Case Shape:Round</li>\r\n	<li>Clasp Type:Buckle</li>\r\n	<li>Gender:Men</li>\r\n	<li>Case Thickness:16mm</li>\r\n	<li>Dial Diameter:42mm</li>\r\n	<li>Boxes &amp; Cases Material:Paper</li>\r\n	<li>Band Width:20mm</li>\r\n	<li>Band Material Type:Leather</li>\r\n	<li>Band Length:24cm</li>\r\n	<li>Style:Fashion &amp; Casual</li>\r\n	<li>Features:Sports Army Military Automatic Watch Men</li>\r\n	<li>Display:time date month</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (18, 35, 1, 'DOOBO Wristwatches Fashion Casual', 900, 'Men Hodinky Relogio Masculino', '<ul>\r\n	<li>Brand Name:DOOBO</li>\r\n	<li>Gender:Men</li>\r\n	<li>Style:Fashion &amp; Casual</li>\r\n	<li>Movement:Quartz</li>\r\n	<li>Case Material:Alloy</li>\r\n	<li>Band Length:23cm</li>\r\n	<li>Clasp Type:Buckle</li>\r\n	<li>Water Resistance Depth:3Bar</li>\r\n	<li>Feature:Water Resistant,Auto Date</li>\r\n	<li>Dial Diameter:38mm</li>\r\n	<li>Model Number:D010</li>\r\n	<li>Boxes &amp; Cases Material:Paper</li>\r\n	<li>Dial Window Material Type:Hardlex</li>\r\n	<li>Case Shape:Round</li>\r\n	<li>Band Material Type:Leather</li>\r\n	<li>Band Width:18mm</li>\r\n	<li>Case Thickness:9mm</li>\r\n	<li>Item Type:Quartz Wristwatches</li>\r\n	<li>Mens Watch:Mens Wristwatches</li>\r\n	<li>Relogio Masculino:Quartz Watch Brand Men</li>\r\n	<li>Fashion Casual Watch:Watches For Men</li>\r\n	<li>Quartz-Watch Men:Sport Watches</li>\r\n	<li>DOOBO Watch Men:Mens Quartz-Watch</li>\r\n	<li>Quartz Wristwatches:Mens Watches Top Brand Luxury</li>\r\n</ul>\r\n', '2022-02-17 02:14:53', 0);
INSERT INTO `product_table` VALUES (19, 37, 1, 'Digital Watch Lava Type', 1000, 'Iron warrior Metal Watch', '<ul>\r\n	<li>Brand Name:HongC</li>\r\n	<li>Item Type:Digital Wristwatches</li>\r\n	<li>Case Shape:Rectangle</li>\r\n	<li>Movement:Digital</li>\r\n	<li>Case Material:Tungsten Steel</li>\r\n	<li>Dial Diameter:40mm</li>\r\n	<li>Style:Fashion &amp; Casual</li>\r\n	<li>Clasp Type:Bracelet Clasp</li>\r\n	<li>Boxes &amp; Cases Material:Leatherette</li>\r\n	<li>Band Material Type:Stainless Steel</li>\r\n	<li>Case Thickness:25mm</li>\r\n	<li>Feature:None</li>\r\n	<li>Water Resistance Depth:No waterproof</li>\r\n	<li>Gender:Men</li>\r\n	<li>Band Length:18inch</li>\r\n	<li>Model Number:Metal Watch</li>\r\n	<li>Dial Window Material Type:Glass</li>\r\n	<li>Band Width:42mm</li>\r\n	<li>style:Fashion Leisure</li>\r\n	<li>Color:Black</li>\r\n	<li>Strap Material:Tungsten</li>\r\n	<li>Type:Electronic Watch</li>\r\n	<li>Gender:Men</li>\r\n</ul>\r\n', '2022-02-17 02:14:53', 0);
INSERT INTO `product_table` VALUES (20, 37, 1, 'LED Display Luxury Watch', 130, 'Digital Military Men\'s Quartz ', '<ul>\r\n	<li>Brand Name:BINZI</li>\r\n	<li>Item Type:Digital Wristwatches</li>\r\n	<li>Band Width:32mm</li>\r\n	<li>Feature:Back Light,Shock Resistant,Stop Watch,Auto Date,LED display</li>\r\n	<li>Water Resistance Depth:3Bar</li>\r\n	<li>Case Shape:Round</li>\r\n	<li>Movement:Digital</li>\r\n	<li>Boxes &amp; Cases Material:Paper</li>\r\n	<li>Band Length:27.5cm</li>\r\n	<li>Clasp Type:Buckle</li>\r\n	<li>Dial Diameter:47mm</li>\r\n	<li>Case Material:Alloy</li>\r\n	<li>Model Number:SM3BZ11519</li>\r\n	<li>Style:Sport</li>\r\n	<li>Band Material Type:Silicone</li>\r\n	<li>Case Thickness:15mm</li>\r\n	<li>Gender:Men</li>\r\n	<li>Dial Window Material Type:Hardlex</li>\r\n	<li>men&#39;s watches:Military watches,sport watches for men</li>\r\n	<li>watches men,digital watch:waterproof watch,relogio digita</li>\r\n	<li>Quartz watch,new watch men:sports watch, watch men,sports watch brands</li>\r\n	<li>outdoor watch,military watches men:led watch, Auto Date watch,mens watches top brand luxury</li>\r\n	<li>Wristwatch,male watches:Digital watch,satt,horloges mannen</li>\r\n	<li>casual watch,army watch:luxury watch,reloj hombre,watches men luxury brand</li>\r\n	<li>silicone watch,watch led:shock watch,relogio,montre,man sport watch brand</li>\r\n	<li>fashion watch,military watch:brand watch, erkek digital saat</li>\r\n	<li>Fashion Luxury Sport Digital Watch:men watch luxury brand, clock. men clock</li>\r\n	<li>clock men, male watches:wristwatch,erkek kol saati, men watch</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (21, 36, 1, 'Pedometer Calories Chronograph Sport Watch', 200, 'Sports Watches 50M Waterproof ', '<ul>\r\n	<li>Brand Name:SKMEI</li>\r\n	<li>Item Type:Digital Wristwatches</li>\r\n	<li>Feature:Back Light,Alarm,Water Resistant,Chronograph,Week Display,Call Reminder,Shock Resistant,Bluetooth,Complete Calendar</li>\r\n	<li>Movement:Smart,Digital</li>\r\n	<li>Model Number:1227</li>\r\n	<li>Dial Diameter:54mm</li>\r\n	<li>Boxes &amp; Cases Material:No package</li>\r\n	<li>Style:Sport</li>\r\n	<li>Gender:Men</li>\r\n	<li>Case Material:Plastic</li>\r\n	<li>Case Shape:Round</li>\r\n	<li>Water Resistance Depth:5Bar</li>\r\n	<li>Case Thickness:18mm</li>\r\n	<li>Band Material Type:PU</li>\r\n	<li>Clasp Type:Buckle</li>\r\n	<li>Band Width:24mm</li>\r\n	<li>Dial Window Material Type:Resin</li>\r\n	<li>Band Length:25.5cm</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (22, 38, 1, 'Men Sweatshirt Long Sleeve Pullover', 120, 'Embroidery Turtleneck Tracksuit', '<ul>\r\n	<li>Brand Name:WSGYJ</li>\r\n	<li>Gender:Men</li>\r\n	<li>Item Type:Hoodies,Sweatshirts</li>\r\n	<li>Sleeve Length(cm):Full</li>\r\n	<li>Closure Type:None</li>\r\n	<li>Thickness:Standard</li>\r\n	<li>Style:Casual</li>\r\n	<li>Clothing Length:Regular</li>\r\n	<li>Sleeve Style:Regular</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Detachable Part:None</li>\r\n	<li>Hooded:Yes</li>\r\n	<li>Type:Slim</li>\r\n	<li>Collar:Turtleneck</li>\r\n	<li>Model Number:Men&#39;s hoodies</li>\r\n	<li>Material:Cotton,Microfiber</li>\r\n	<li>size:S-M-L-XL-XXL</li>\r\n	<li>hoodies:Men&#39;s hoodies</li>\r\n	<li>Men&#39;s sweatshirt:Solid hoodies</li>\r\n	<li>hoodies men:Embroidered hoodies</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (23, 38, 1, 'Hip Hop Sweatshirt', 120, 'Winter Cotton Pullover ', '<ul>\r\n	<li>Brand Name:T-bird</li>\r\n	<li>Gender:Men</li>\r\n	<li>Item Type:Hoodies,Sweatshirts</li>\r\n	<li>Sleeve Length(cm):Full</li>\r\n	<li>Collar:O-Neck</li>\r\n	<li>Closure Type:None</li>\r\n	<li>Pattern Type:Letter</li>\r\n	<li>Thickness:Standard</li>\r\n	<li>Style:Casual</li>\r\n	<li>Clothing Length:Regular</li>\r\n	<li>Sleeve Style:Regular</li>\r\n	<li>Material:Polyester,Acetate,Cotton</li>\r\n	<li>Hooded:Yes</li>\r\n	<li>Detachable Part:None</li>\r\n	<li>Model Number:Men&#39;s hoodies</li>\r\n	<li>Type:Regular</li>\r\n	<li>Size:M L XL XXL hoodies</li>\r\n	<li>Color:gray Dark gray Navy Red wine hoodies</li>\r\n	<li>Material:Cotton hoodies</li>\r\n	<li>pattern:Letter printing hoodies</li>\r\n	<li>style:Casual hoodies</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (24, 38, 1, 'Autumn Winter Patchwork', 130, 'Harajuku Hooded Hoodies', '<ul>\r\n	<li>Brand Name:herlova</li>\r\n	<li>Material:Polyester</li>\r\n	<li>Style:Casual</li>\r\n	<li>Fabric Type:Broadcloth</li>\r\n	<li>Sleeve Length(cm):Full</li>\r\n	<li>Clothing Length:Regular</li>\r\n	<li>Pattern Type:Patchwork</li>\r\n	<li>Type:Pullovers</li>\r\n	<li>Sleeve Style:Regular</li>\r\n	<li>Collar:Hooded</li>\r\n	<li>Hooded:Yes</li>\r\n	<li>Model Number:WS3249M</li>\r\n	<li>Gender:Women</li>\r\n	<li>Item Type:Sweatshirts</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (26, 39, 1, 'S.ARCHON New M65 Waterproof Military Army Jacket', 510, 'Pilot Field Tactical Jackets', '<ul>\r\n	<li>Brand Name:s.archon</li>\r\n	<li>Item Type:Outerwear &amp; Coats</li>\r\n	<li>Outerwear Type:Jackets</li>\r\n	<li>Gender:Men</li>\r\n	<li>Collar:O-Neck</li>\r\n	<li>Thickness:Standard</li>\r\n	<li>Lining Material:Polyester</li>\r\n	<li>Style:Casual</li>\r\n	<li>Closure Type:Zipper</li>\r\n	<li>Clothing Length:Regular</li>\r\n	<li>Sleeve Style:Regular</li>\r\n	<li>Material:Polyester,Spandex,Cotton</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Hooded:Yes</li>\r\n	<li>Model Number:M65</li>\r\n	<li>Detachable Part:None</li>\r\n	<li>Decoration:Pockets</li>\r\n	<li>Type:Regular</li>\r\n	<li>Cuff Style:Conventional</li>\r\n	<li>Color:Black, Brown, CP</li>\r\n	<li>Season :Autumn, Winter</li>\r\n	<li>Place of Origin:China (Mainland)</li>\r\n	<li>Feature:Windproof, Thermal, Anti-Pilling, Anti-Shrink,Anti-Wrinkle</li>\r\n	<li>Good For:SWAT, Army, Tactical, Military, Casual, Paintball, Combat, Fashion</li>\r\n	<li>Material:Cotton &amp; Polyester &amp; Spandex</li>\r\n	<li>Outwear Style :SWAT Military Army Combat Waterproof Tactical Jackets</li>\r\n	<li>Jacket Style:Military Camouflage Windbreaker Coat</li>\r\n	<li>Jacket Type:Thermal Camouflage Tactical Jackets Men</li>\r\n	<li>Style:Flight Hoodie Field Jacket</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (27, 39, 1, 'TAWILL Men Jacket Military Plus', 350, 'Army Soldier Cotton Air force', '<ul>\r\n	<li>Brand Name:Tawill</li>\r\n	<li>Item Type:Outerwear &amp; Coats</li>\r\n	<li>Outerwear Type:Jackets</li>\r\n	<li>Gender:Men</li>\r\n	<li>Collar:Mandarin Collar</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Detachable Part:None</li>\r\n	<li>Thickness:Standard</li>\r\n	<li>Lining Material:Polyester</li>\r\n	<li>Closure Type:Zipper</li>\r\n	<li>Material:Cotton</li>\r\n	<li>Type:Regular</li>\r\n	<li>Model Number:KY2</li>\r\n	<li>Decoration:None</li>\r\n	<li>Hooded:No</li>\r\n	<li>Cuff Style:Conventional</li>\r\n	<li>Clothing Length:Regular</li>\r\n	<li>Sleeve Style:Regular</li>\r\n	<li>Item Type:Outerwear &amp; Coats</li>\r\n	<li>Outerwear Type:Jackets</li>\r\n	<li>Gender:Men</li>\r\n	<li>color:army green, khaki, black</li>\r\n	<li>Plus size:M-6XL</li>\r\n	<li>Fabric Type:Broadcloth</li>\r\n	<li>Style:Fashion</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (28, 40, 1, 'Knitted Hat ', 900, 'Cashmere Thick Wool Hat', '<ul>\r\n	<li>Brand Name:SHRDTR</li>\r\n	<li>Item Type:Skullies &amp; Beanies</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Gender:Unisex</li>\r\n	<li>Model Number:H2022-S16SD</li>\r\n	<li>Style:Casual</li>\r\n	<li>Material:Cotton,Wool</li>\r\n	<li>Applicable scene:Parenting show, couple show, birthday present, skiing, snowfare</li>\r\n	<li>Design concept:Simple fashion, lMulti-purpose, warm, soft and not hurt the skin</li>\r\n	<li>Beanies hat size:Normal one size fit for 52-58cm</li>\r\n	<li>Applicable season:Winter,autumn</li>\r\n</ul>\r\n', '2022-02-17 02:14:53', 0);
INSERT INTO `product_table` VALUES (29, 40, 1, 'Winter Hat Skullies Beanies', 800, 'Balaclava Bonnet Cap Wool ', '<ul>\r\n	<li>Brand Name:FETSBUY</li>\r\n	<li>Item Type:Skullies &amp; Beanies</li>\r\n	<li>Department Name:Adult</li>\r\n	<li>Gender:Unisex</li>\r\n	<li>Pattern Type:Striped</li>\r\n	<li>Style:Casual</li>\r\n	<li>Material:Cotton,Wool</li>\r\n	<li>Model Number:18024</li>\r\n	<li>is_customized:yes</li>\r\n	<li>Chapeus Style:European and American style</li>\r\n	<li>Applicable Season:Spring autumn winter</li>\r\n	<li>beanies feature:Thick and warm</li>\r\n	<li>Style:Casual, Fashion, 2022 ,new</li>\r\n	<li>Usage 1:women hat, winter beanies, men beanies</li>\r\n	<li>Gender:hat men, hats for men ,men&#39;s winter hat</li>\r\n	<li>Skullies Beanies:Skullies Beanies ,knitted hat</li>\r\n</ul>\r\n', '2022-02-17 02:14:53', 0);
INSERT INTO `product_table` VALUES (30, 25, 1, 'LAORENTOU Real Leather Luxury Handbags', 740, 'Designer Brand Ladies Shoulder Bag', '<ul>\r\n	<li>Brand Name:LAORENTOU</li>\r\n	<li>Item Type:Handbags</li>\r\n	<li>Interior:Interior Compartment,Cell Phone Pocket,Interior Zipper Pocket,Interior Slot Pocket</li>\r\n	<li>Style:Fashion</li>\r\n	<li>Genuine Leather Type:Cow Leather</li>\r\n	<li>Gender:Women</li>\r\n	<li>Lining Material:Polyester</li>\r\n	<li>Exterior:Silt Pocket</li>\r\n	<li>Closure Type:Zipper</li>\r\n	<li>Types of bags:Handbags &amp; Crossbody bags</li>\r\n	<li>Decoration:Sequined,None</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Hardness:Soft</li>\r\n	<li>Model Number:958J083L</li>\r\n	<li>Number of Handles/Straps:Single</li>\r\n	<li>Shape:Casual Tote</li>\r\n	<li>Main Material:Genuine Leather</li>\r\n	<li>Handbags Type:Totes</li>\r\n	<li>Occasion:Versatile</li>\r\n	<li>Size:40*25*17CM</li>\r\n</ul>\r\n', '2022-02-18 15:24:24', 0);
INSERT INTO `product_table` VALUES (31, 25, 1, 'BOYATU Top-Handle Bags', 400, 'Luxury Handbags Designer ', '<ul>\r\n	<li>Brand Name:Boyatu</li>\r\n	<li>Item Type:Handbags</li>\r\n	<li>Interior:Interior Compartment,Cell Phone Pocket,Interior Zipper Pocket,Interior Slot Pocket</li>\r\n	<li>Style:Fashion</li>\r\n	<li>Genuine Leather Type:Cow Leather</li>\r\n	<li>Gender:Women</li>\r\n	<li>Closure Type:Zipper</li>\r\n	<li>Handbags Type:Shoulder Bags</li>\r\n	<li>Number of Handles/Straps:Two</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Hardness:Soft</li>\r\n	<li>Shape:Casual Tote</li>\r\n	<li>Types of bags:Shoulder &amp; Handbags</li>\r\n	<li>Main Material:Genuine Leather</li>\r\n	<li>Model Number:73819</li>\r\n	<li>Decoration:None</li>\r\n	<li>Occasion:Versatile</li>\r\n	<li>Lining Material:Bamboo Fiber</li>\r\n	<li>Exterior:None</li>\r\n	<li>Feature:Top-Handle Bags Female</li>\r\n	<li>Fit for:female gifts</li>\r\n	<li>style:Designer Bags for Women 2022 Genuin Leather</li>\r\n	<li>species:Luggage &amp; Bags,Women&#39;s Bags,Shoulder Bags</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (32, 25, 1, 'FOXER Brand Women Snakeskin', 142, 'Elunic Female Bags', '<ul>\r\n	<li>Brand Name:FOXER</li>\r\n	<li>Item Type:Handbags</li>\r\n	<li>Interior:Interior Compartment,Interior Zipper Pocket,Interior Slot Pocket</li>\r\n	<li>Genuine Leather Type:Cow Leather</li>\r\n	<li>Style:Casual</li>\r\n	<li>Gender:Women</li>\r\n	<li>Lining Material:Polyester</li>\r\n	<li>Closure Type:Zipper</li>\r\n	<li>Handbags Type:Shoulder Bags</li>\r\n	<li>Decoration:Sequined,Criss-Cross,Fur,Appliques,Chains</li>\r\n	<li>Number of Handles/Straps:Two</li>\r\n	<li>Pattern Type:Serpentine</li>\r\n	<li>Hardness:Soft</li>\r\n	<li>Model Number:928003F</li>\r\n	<li>Shape:Casual Tote</li>\r\n	<li>Types of bags:Shoulder &amp; Handbags</li>\r\n	<li>Main Material:Genuine Leather</li>\r\n	<li>Occasion:Versatile</li>\r\n	<li>Exterior:Open Pocket</li>\r\n	<li>Color:Golden,Black,Etc</li>\r\n	<li>Service:Free shipping,Drop shipping</li>\r\n	<li>Function:Handbags &amp; Handle Bag &amp; Shoulder bag</li>\r\n	<li>Weight:830g</li>\r\n	<li>Packiing :Opp and Non-Woven Bag</li>\r\n	<li>Type1:Women bag,Leather bag,High quality bag</li>\r\n	<li>Type2:High Quality,Luxury,Cheap</li>\r\n</ul>\r\n', '2022-02-17 10:01:14', 0);
INSERT INTO `product_table` VALUES (33, 26, 1, 'LANSPACE Leather Wallet', 120, 'Card Holder Fashion', '<ul>\r\n	<li>Brand Name:LANSPACE</li>\r\n	<li>Item Type:Card &amp; ID Holders</li>\r\n	<li>Genuine Leather Type:Cow Leather</li>\r\n	<li>Style:Casual</li>\r\n	<li>Gender:Unisex</li>\r\n	<li>Closure Type:Zipper</li>\r\n	<li>Use:Credit Card</li>\r\n	<li>Item Length:11.3cm</li>\r\n	<li>Material Composition:Cow Leather</li>\r\n	<li>Item Width:9.5cm</li>\r\n	<li>Model Number:LW124</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Shape:Box</li>\r\n	<li>Item Weight:0.1kg</li>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (34, 26, 1, 'FAMOUSFAMILY Men\'s Vintage Wallet', 140, 'Retro Fashion Casual Wallet', '<ul>\r\n	<li>Brand Name:FAMOUSFAMILY</li>\r\n	<li>Main Material:Genuine Leather</li>\r\n	<li>Genuine Leather Type:Cow Leather</li>\r\n	<li>Gender:Men</li>\r\n	<li>Style:Vintage</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Closure Type:No Zipper</li>\r\n	<li>Wallets:Standard Wallets</li>\r\n	<li>Wallet Length:Short</li>\r\n	<li>Item Height:3.9inch</li>\r\n	<li>Item Length:3.7inch</li>\r\n	<li>Item Weight:100g / 3.5oz</li>\r\n	<li>Item Width:15mm / 0.6in</li>\r\n	<li>Material Composition:Cowhide Leather</li>\r\n	<li>Model Number:M8642-1</li>\r\n	<li>Lining Material:Polyester</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (35, 26, 1, 'Laorentou Wallet ', 140, 'Genuine Leather Short Wallet', '<ul>\r\n	<li>Brand Name:LAORENTOU</li>\r\n	<li>Item Type:Wallet</li>\r\n	<li>Genuine Leather Type:Cow Leather</li>\r\n	<li>Wallet Length:Short</li>\r\n	<li>Lining Material:Polyester</li>\r\n	<li>Style:Casual</li>\r\n	<li>Gender:Men</li>\r\n	<li>Model Number:328J003L</li>\r\n	<li>Item Length:11cm</li>\r\n	<li>Interior:Photo Holder,Card Holder,Note Compartment</li>\r\n	<li>Closure Type:No Zipper</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Item Height:9.5cm</li>\r\n	<li>Item Width:2cm</li>\r\n	<li>Wallets:Standard Wallets</li>\r\n	<li>Material Composition:cowhide leather</li>\r\n	<li>Item Weight:0.3kg</li>\r\n	<li>Main Material:Genuine Leather</li>\r\n	<li>Size:11*9.5*2cm</li>\r\n	<li>Style 1:Luxury men wallet genuine leather purse men brand</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);
INSERT INTO `product_table` VALUES (36, 27, 1, 'Business Men Briefcase Bag', 340, 'PU Leather LaptopBriefcase', '<ul>\r\n	<li>Brand Name:shunvbasha</li>\r\n	<li>Item Type:Briefcases</li>\r\n	<li>Material Composition:pu</li>\r\n	<li>Interior:Interior Compartment,Computer Interlayer,Cell Phone Pocket,Interior Zipper Pocket,Interior Slot Pocket</li>\r\n	<li>Lining Material:Polyester</li>\r\n	<li>Exterior:Silt Pocket</li>\r\n	<li>Closure Type:Zipper</li>\r\n	<li>Gender:Men</li>\r\n	<li>Item Weight:0.7kg</li>\r\n	<li>Model Number:zda8-05</li>\r\n	<li>Item Width:7inch</li>\r\n	<li>Pattern Type:Solid</li>\r\n	<li>Item Height:28inch</li>\r\n	<li>Number of Handles/Straps:Single</li>\r\n	<li>Style:Business</li>\r\n	<li>Handle/Strap Type:Soft Handle</li>\r\n	<li>Main Material:PU</li>\r\n	<li>Item Length:38inch</li>\r\n	<li>Style :European and American style</li>\r\n	<li>wholesale:Yes</li>\r\n</ul>\r\n', '2022-02-17 10:02:10', 0);

-- ----------------------------
-- Table structure for review_table
-- ----------------------------
DROP TABLE IF EXISTS `review_table`;
CREATE TABLE `review_table`  (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `review` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `product_review` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_review` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review_table
-- ----------------------------
INSERT INTO `review_table` VALUES (1, 1, 2, 'PM', '2017-10-29 18:00:57');
INSERT INTO `review_table` VALUES (2, 32, 2, 'Bagus bag ani', '2017-10-30 19:24:01');

-- ----------------------------
-- Table structure for user_comprobante_estado_table
-- ----------------------------
DROP TABLE IF EXISTS `user_comprobante_estado_table`;
CREATE TABLE `user_comprobante_estado_table`  (
  `user_com_es_id` int NOT NULL AUTO_INCREMENT,
  `user_com_estado` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_com_es_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_comprobante_estado_table
-- ----------------------------

-- ----------------------------
-- Table structure for user_comprobante_table
-- ----------------------------
DROP TABLE IF EXISTS `user_comprobante_table`;
CREATE TABLE `user_comprobante_table`  (
  `user_comprobante_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `com_fecha_subida` datetime NULL DEFAULT NULL,
  `com_fecha_compra` datetime NULL DEFAULT NULL,
  `com_numero` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_cuit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `municipio_id` int NULL DEFAULT NULL,
  `image_link` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_estado_id` int NULL DEFAULT NULL,
  `com_estado_date` datetime NULL DEFAULT NULL,
  `com_estado_obs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `com_estado_opeid` int NULL DEFAULT NULL,
  `product_cart_id` int NULL DEFAULT NULL,
  `cart_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_comprobante_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_comprobante_table
-- ----------------------------

-- ----------------------------
-- Table structure for user_table
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'buyer',
  `ban_flag` tinyint(1) NOT NULL DEFAULT 0,
  `puntos` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_table
-- ----------------------------
INSERT INTO `user_table` VALUES (1, 'Admin', 'Admin', '', 'admin', 'admin@admin.com', '$2y$10$2fsiOiSV9GmPDfBLbo5D7eanESB3cFNLXk0MEAADhkhmv2IQwGZUy', 'admin', 0, NULL);
INSERT INTO `user_table` VALUES (2, 'testing', 'testing', '', 'testing', 'testing@gmail.com', '$2y$10$HDhpPaXA3vEuWw3Ia.3/gO.3v60XLy/us1PYP5YfkZq76rUzevTLO', 'user', 0, 250);
INSERT INTO `user_table` VALUES (4, 'ruben', 'vilte', '', 'ruben', 'ruben@gmail.com', '$2y$10$GHMWPOLqlaIweG5ZpGMFbOGmpzNE.Xjq67xGXnJTusoSARwR//826', 'user', 0, 150);

SET FOREIGN_KEY_CHECKS = 1;
