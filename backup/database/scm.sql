-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2015 at 08:38 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of Manufacturing unit',
  `username` varchar(20) NOT NULL COMMENT 'username for login',
  `password` varchar(20) NOT NULL COMMENT 'password of user login',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Details of Manufacturer login' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of category',
  `cat_name` varchar(25) NOT NULL COMMENT 'Name of category',
  `cat_details` text COMMENT 'Details about the category',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Category details' AUTO_INCREMENT=12 ;

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
-- Table structure for table `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `man_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of distributor',
  `man_name` varchar(25) NOT NULL COMMENT 'Name of distributor',
  `man_email` varchar(40) DEFAULT NULL COMMENT 'Email of distributor',
  `man_phone` varchar(10) DEFAULT NULL COMMENT 'Phone number of distributor',
  `username` varchar(20) NOT NULL COMMENT 'username for login',
  `password` varchar(20) NOT NULL COMMENT 'password of user',
  PRIMARY KEY (`man_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Dispatcher details' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`man_id`, `man_name`, `man_email`, `man_phone`, `username`, `password`) VALUES
(1, 'Rajesh Mehta', 'rajeshmehta@hotmail.com', '8798665783', 'rajesh123', 'rajesh123'),
(2, 'Suresh Kumar', 'sureshkumar@yahoo.co.in', '9978654690', 'suresh567', '9876584839'),
(3, 'Nishit Shah', 'nishit.shah44@gmail.com', '8000786785', 'nishit44', 'shah456'),
(4, 'Nayan Boghani', 'nayanbh@hotmail.com', '9909087932', 'boghani890', 'nayan567'),
(5, 'Altaf Neva', 'altafneva@gmail.com', '9978112131', 'altafneva', 'myname'),
(6, 'Altaf Husain', 'altafneva@gmail.com', '9978112131', 'altafneva', 'altaf123');

-- --------------------------------------------------------

--
-- Table structure for table `man_invoice`
--

CREATE TABLE IF NOT EXISTS `man_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of invoice',
  `order_id` int(11) NOT NULL COMMENT 'Id of order',
  PRIMARY KEY (`invoice_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Invoice of Manufacturing unit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `man_order`
--

CREATE TABLE IF NOT EXISTS `man_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of order',
  `date` date NOT NULL COMMENT 'Date of order placed',
  `retailer_id` int(11) NOT NULL COMMENT 'Id of retailer',
  `status` tinyint(1) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL COMMENT 'Total amount',
  PRIMARY KEY (`order_id`),
  KEY `dist_id` (`retailer_id`),
  KEY `retailer_id` (`retailer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Orders at manufacturing units' AUTO_INCREMENT=19 ;

--
-- Dumping data for table `man_order`
--

INSERT INTO `man_order` (`order_id`, `date`, `retailer_id`, `status`, `total_amount`) VALUES
(1, '2015-02-26', 1, 0, '974.88'),
(2, '2015-02-26', 2, 1, '50.01'),
(3, '2015-02-27', 1, 0, '100.02'),
(4, '2015-02-27', 1, 0, '118.71'),
(5, '2015-02-27', 3, 1, '141.69'),
(6, '2015-02-27', 1, 0, '240.00'),
(7, '2015-02-27', 1, 0, '132.33'),
(8, '2015-02-27', 1, 0, '132.33'),
(9, '2015-03-04', 1, 0, '100.02'),
(10, '2015-03-04', 1, 0, '100.02'),
(11, '2015-03-04', 1, 0, '100.02'),
(12, '2015-03-04', 1, 0, '100.02'),
(13, '2015-03-04', 1, 0, '50.01'),
(14, '2015-03-04', 1, 0, '50.01'),
(15, '2015-03-04', 1, 0, '50.01'),
(16, '2015-03-04', 1, 0, '1117.42'),
(17, '2015-03-04', 1, 0, '150.03'),
(18, '2015-03-04', 1, 0, '150.03');

-- --------------------------------------------------------

--
-- Table structure for table `man_order_items`
--

CREATE TABLE IF NOT EXISTS `man_order_items` (
  `order_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  PRIMARY KEY (`order_items_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `man_order_items`
--

INSERT INTO `man_order_items` (`order_items_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 15, 1, '3'),
(2, 16, 1, '4'),
(3, 16, 2, '10'),
(4, 16, 12, '3'),
(6, 17, 1, '4'),
(7, 17, 2, '5'),
(8, 18, 1, '4'),
(9, 18, 2, '5');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of product',
  `pro_name` varchar(25) NOT NULL COMMENT 'Name of product',
  `pro_desc` text COMMENT 'Description of the product',
  `pro_price` decimal(10,2) NOT NULL COMMENT 'Price of the product',
  `unit` int(3) NOT NULL COMMENT 'unit of measurement',
  `quantity_in_stock` int(8) NOT NULL COMMENT 'Quantity of the product in stock',
  `pro_cat_id` int(11) NOT NULL COMMENT 'Id of the category of product',
  PRIMARY KEY (`pro_id`),
  KEY `pro_cat_id` (`pro_cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Details of products at manufacturing unit' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_desc`, `pro_price`, `unit`, `quantity_in_stock`, `pro_cat_id`) VALUES
(1, 'Butter Puff', '', '16.67', 2, 0, 1),
(2, 'Corn Puff', '', '16.67', 2, 0, 1),
(3, 'Garlic Cheese Roll', '', '39.57', 2, 0, 1),
(4, 'Butter Stuffed Bun', '', '42.00', 2, 0, 1),
(5, 'Paneer Tikka S. Bun', '', '52.50', 2, 0, 1),
(6, 'Burger Bun 4 PCS', '', '42.00', 2, 0, 2),
(7, 'Hot Dog Bun 4 PCS', '', '46.00', 2, 0, 2),
(8, 'Garlic Lauf', '', '47.23', 2, 0, 2),
(9, 'Dabeli Bun 12 PCS', '', '48.54', 2, 0, 2),
(10, 'Pizza Base 4 PCS', '', '35.65', 2, 0, 2),
(11, 'Pizza Sauce', '', '120.00', 1, 0, 9),
(12, 'Sweet Onion Sauce', '', '112.00', 1, 0, 9),
(13, 'Strawberry Cake 1 KG', '', '386.67', 1, 0, 3),
(14, 'Choco Chips Cake 1 KG', '', '480.00', 1, 0, 3),
(15, 'Belgium Cake 1 KG', '', '395.67', 1, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

CREATE TABLE IF NOT EXISTS `retailer` (
  `retailer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `address` varchar(200) NOT NULL,
  `area_code` varchar(25) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`retailer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`retailer_id`, `username`, `password`, `address`, `area_code`, `phone`, `email`) VALUES
(1, 'rajesh123', 'mrpuff', 'Maninagar', 'MNGR', '9876543456', 'rajesh@mrpuff.in'),
(2, 'suresh567', '2349870', 'New Ranip', 'NRNP', '9044549234', 'suresh@mrpuff.in'),
(3, 'nishit44', 'hey435', 'Vastrapur', 'VTPR', '9898734511', 'nishit44@mrpuff.in'),
(4, 'boghani890', 'nayan12345', 'Nikol', 'NIKL', '8000875643', 'nayan@mrpuff.in');

-- --------------------------------------------------------

--
-- Table structure for table `retailer_invoice`
--

CREATE TABLE IF NOT EXISTS `retailer_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of invoice',
  `order_id` int(11) NOT NULL COMMENT 'Id of order',
  PRIMARY KEY (`invoice_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Invoice details at Distribution Unit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `retailer_orders`
--

CREATE TABLE IF NOT EXISTS `retailer_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of order',
  `order_date` date NOT NULL COMMENT 'Date of order placed',
  `status` varchar(15) NOT NULL COMMENT 'Processing or Completed',
  `pro_id` int(11) NOT NULL COMMENT 'Id of product',
  `amount` decimal(8,2) NOT NULL COMMENT 'Total amount',
  PRIMARY KEY (`order_id`),
  KEY `pro_id` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Orders at Distribution unit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit_name`, `description`) VALUES
(1, 'KG', 'Kilo gram'),
(2, 'PCS', 'Pieces'),
(3, 'LTR', ''),
(4, 'ML', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `man_invoice`
--
ALTER TABLE `man_invoice`
  ADD CONSTRAINT `man_invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `man_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `man_order`
--
ALTER TABLE `man_order`
  ADD CONSTRAINT `man_order_ibfk_1` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`retailer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `man_order_items`
--
ALTER TABLE `man_order_items`
  ADD CONSTRAINT `man_order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `man_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `man_order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`pro_cat_id`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retailer_invoice`
--
ALTER TABLE `retailer_invoice`
  ADD CONSTRAINT `retailer_invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `retailer_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retailer_orders`
--
ALTER TABLE `retailer_orders`
  ADD CONSTRAINT `retailer_orders_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
