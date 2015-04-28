-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2015 at 10:40 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scm_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL,
  `area_code` varchar(10) NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `area_name`, `area_code`) VALUES
(1, 'Sarkhej', 'SRKJ'),
(2, 'Vastrapur', 'VSTR'),
(3, 'Maninagar', 'MNGR'),
(4, 'New Ranip', 'NRANIP'),
(5, 'Vejalpur', 'VJLP');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(25) NOT NULL,
  `cat_details` text,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_details`) VALUES
(1, 'Fast Food', ''),
(2, 'Bread Buns', ''),
(3, 'Counter Cakes', ''),
(4, 'Deserts', ''),
(5, 'Pastry Rs - 55', ''),
(6, 'Pastry Rs - 60', ''),
(7, 'Pastry Rs - 65', ''),
(8, 'Pastry Rs - 70', ''),
(9, 'Add On Items', ''),
(10, 'Cakes', ''),
(11, 'Cheese Cake', '');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE IF NOT EXISTS `distributor` (
  `dist_id` int(11) NOT NULL AUTO_INCREMENT,
  `dist_name` varchar(25) NOT NULL,
  `dist_email` varchar(50) DEFAULT NULL,
  `dist_phone` varchar(10) NOT NULL,
  `dist_address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`dist_id`, `dist_name`, `dist_email`, `dist_phone`, `dist_address`) VALUES
(1, 'Nishant Shah', 'nishant45@gmail.com', '8980769792', 'Alpha Mall, Vastrapur, Ahmedabad'),
(2, 'Rahul Pandey', 'rahul431@gmail.com', '9099432197', 'Gota, S.G. Highway, Ahmedabad'),
(3, 'Pawan Panchal', 'pawan.rocks@gmail.com', '7878025437', 'Modhera Stadium, Ahmedabad'),
(4, 'Pushpak Patel', 'pushpak@gmail.com', '9012376544', 'Navrangpura, Ahmedabad'),
(5, 'Haniket Patel', 'hanipatel@gmail.com', '8980745372', 'CTM, Ahmedabad');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total_amount` decimal(10,3) NOT NULL,
  `comments` text,
  PRIMARY KEY (`invoice_id`),
  KEY `order_id` (`order_id`),
  KEY `retailer_id` (`retailer_id`),
  KEY `dist_id` (`dist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `order_id`, `retailer_id`, `dist_id`, `date`, `total_amount`, `comments`) VALUES
(1, 2, 4, 3, '2015-04-28', '5119.500', ''),
(2, 1, 2, 5, '2015-04-28', '4780.150', ''),
(3, 3, 1, 1, '2015-04-28', '8891.680', ''),
(4, 4, 5, 4, '2015-04-28', '7888.960', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE IF NOT EXISTS `invoice_items` (
  `invoice_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(6) NOT NULL,
  PRIMARY KEY (`invoice_items_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`invoice_items_id`, `invoice_id`, `product_id`, `quantity`) VALUES
(1, 1, 4, 20),
(2, 1, 5, 5),
(3, 1, 7, 10),
(4, 1, 9, 10),
(5, 1, 12, 6),
(6, 1, 14, 5),
(7, 2, 1, 20),
(8, 2, 2, 15),
(9, 2, 5, 10),
(10, 2, 8, 5),
(11, 2, 10, 8),
(12, 2, 11, 10),
(13, 2, 13, 2),
(14, 2, 15, 3),
(15, 3, 1, 2),
(16, 3, 2, 4),
(17, 3, 3, 3),
(18, 3, 4, 8),
(19, 3, 5, 10),
(20, 3, 6, 12),
(21, 3, 8, 4),
(22, 3, 11, 10),
(23, 3, 13, 3),
(24, 3, 14, 5),
(25, 3, 15, 6),
(26, 4, 2, 12),
(27, 4, 4, 30),
(28, 4, 8, 4),
(29, 4, 11, 20),
(30, 4, 14, 8);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `man_id` int(11) NOT NULL AUTO_INCREMENT,
  `man_name` varchar(25) NOT NULL,
  `man_email` varchar(50) DEFAULT NULL,
  `man_phone` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`man_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`man_id`, `man_name`, `man_email`, `man_phone`, `username`, `password`) VALUES
(1, 'Suresh Kumar', 'suresh@gmail.com', '9890234510', 'suresh', 'suresh123'),
(2, 'Ankit Pandya', 'ankitp@gmail.com', '8980956231', 'ankit', 'ankit123'),
(3, 'Paawan Shah', 'paawanshah@gmail.com', '9934672300', 'paawan', 'paawan123'),
(4, 'Jainish Shah', 'jainishshah@gmail.com', '9807634905', 'jainish', 'jainish123'),
(5, 'Krupal Joshi', 'krupal12@yahoo.co.in', '7634507610', 'krupal', 'krupal123');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `total_amount` decimal(10,3) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `retailer_id` (`retailer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `retailer_id`, `approved`, `status`, `total_amount`) VALUES
(1, '2015-04-28', 2, 1, 1, '4780.150'),
(2, '2015-04-28', 4, 1, 1, '5119.500'),
(3, '2015-04-28', 1, 1, 1, '8891.680'),
(4, '2015-04-28', 5, 1, 1, '7888.960'),
(5, '2015-04-28', 5, 0, 0, '8919.880');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `order_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `quantity` int(6) NOT NULL,
  PRIMARY KEY (`order_items_id`),
  KEY `order_id` (`order_id`),
  KEY `pro_id` (`pro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_id`, `pro_id`, `quantity`) VALUES
(1, 1, 1, 20),
(2, 1, 2, 15),
(3, 1, 5, 10),
(4, 1, 8, 5),
(5, 1, 10, 8),
(6, 1, 11, 10),
(7, 1, 13, 2),
(8, 1, 15, 3),
(9, 2, 4, 20),
(10, 2, 5, 5),
(11, 2, 7, 10),
(12, 2, 9, 10),
(13, 2, 12, 6),
(14, 2, 14, 5),
(15, 3, 1, 2),
(16, 3, 2, 4),
(17, 3, 3, 3),
(18, 3, 4, 8),
(19, 3, 5, 10),
(20, 3, 6, 12),
(21, 3, 8, 4),
(22, 3, 11, 10),
(23, 3, 13, 3),
(24, 3, 14, 5),
(25, 3, 15, 6),
(26, 4, 2, 12),
(27, 4, 4, 30),
(28, 4, 8, 4),
(29, 4, 11, 20),
(30, 4, 14, 8),
(31, 5, 1, 1),
(32, 5, 2, 3),
(33, 5, 3, 5),
(34, 5, 4, 15),
(35, 5, 6, 30),
(36, 5, 8, 45),
(37, 5, 12, 20),
(38, 5, 14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(25) NOT NULL,
  `pro_desc` text,
  `pro_price` decimal(10,3) NOT NULL,
  `unit` int(11) NOT NULL,
  `pro_cat` int(11) NOT NULL,
  `quantity` int(6) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `unit` (`unit`),
  KEY `pro_cat` (`pro_cat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_desc`, `pro_price`, `unit`, `pro_cat`, `quantity`) VALUES
(1, 'Butter Puff', '', '16.670', 2, 1, NULL),
(2, 'Corn Puff', '', '16.670', 2, 1, NULL),
(3, 'Garlic Cheese Roll', '', '39.570', 2, 1, NULL),
(4, 'Butter Stuffed Bun', '', '42.000', 2, 1, NULL),
(5, 'Paneer Tikka S. Bun', '', '52.500', 2, 1, NULL),
(6, 'Burger Bun 4 PCS', '', '42.000', 2, 2, NULL),
(7, 'Hot Dog Bun 4 PCS', '', '46.000', 2, 2, NULL),
(8, 'Garlic Lauf', '', '47.230', 2, 2, NULL),
(9, 'Dabeli Bun 12 PCS', '', '48.500', 2, 2, NULL),
(10, 'Pizza Base 4 PCS', '', '35.650', 2, 2, NULL),
(11, 'Pizza Sauce', '', '120.000', 1, 9, 60),
(12, 'Sweet Onion Sauce', '', '112.000', 1, 9, 94),
(13, 'Strawberry Cake 1 KG', '', '381.670', 1, 3, NULL),
(14, 'Choco Chips Cake 1 KG', '', '480.000', 1, 3, NULL),
(15, 'Belgium Cake 1 KG', '', '395.670', 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

CREATE TABLE IF NOT EXISTS `retailer` (
  `retailer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `address` varchar(200) NOT NULL,
  `area_id` int(11) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`retailer_id`),
  KEY `area_code` (`area_id`),
  KEY `area_id` (`area_id`),
  KEY `area_id_2` (`area_id`),
  KEY `area_id_3` (`area_id`),
  KEY `area_id_4` (`area_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`retailer_id`, `username`, `password`, `address`, `area_id`, `phone`, `email`) VALUES
(1, 'altaf', 'altaf123', 'A4 Ali Abad Appt, Kajal Park Soci, Sarkhej Road, Ahmedabad', 1, '9978454323', 'altafneva@gmail.com'),
(2, 'nayan', 'nayan123', 'Opp. Shivalik Complex, Vastrapur, Ahmedabad', 2, '9898906523', 'nayan@gmail.com'),
(3, 'nishit', 'nishit123', 'B/H Kakariya Lake, Maninagar, Ahmedabad', 3, '8980941941', 'nishit@gmail.com'),
(4, 'dharmil', 'dharmil123', 'Near Vejalpur Police Station, Vejalpur, Ahmedabad', 5, '7865340091', 'dharmil123@gmail.com'),
(5, 'rajesh', 'rajesh123', 'C4-Pushpak Complex, New Ranip, Ahmedabad', 4, '7898902365', 'rajesh123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) NOT NULL,
  `unit_details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit_name`, `unit_details`) VALUES
(1, 'KG', 'Kilo Gram'),
(2, 'PCS', 'Pieces'),
(3, 'LTR', 'Litre');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`retailer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`dist_id`) REFERENCES `distributor` (`dist_id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`pro_id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`retailer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`pro_cat`) REFERENCES `categories` (`cat_id`) ON UPDATE CASCADE;

--
-- Constraints for table `retailer`
--
ALTER TABLE `retailer`
  ADD CONSTRAINT `retailer_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
