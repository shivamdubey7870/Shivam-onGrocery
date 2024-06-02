-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 10, 2023 at 12:08 PM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u245095168_demo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `password`) VALUES
(1, 'Raj Kumar', 'raj@gmail.com', '123456'),
(2, 'raj Kumar', 'rajkumar@mejona.in', '9608022060'),
(3, 'Nikita ', 'Nikita@mejona.in', 'Hoz15520'),
(4, 'Khushi Gupta', 'khushi@mejona.in', 'Hob36283'),
(5, 'Kumar Shivam', 'kumar.shivam@mejona.in', 'Cod64736'),
(6, 'Kumar Shivam', 'kumar.shivam2@mejona.in', 'Cod64736'),
(7, 'fg', 'ghdh@gmail', '123456'),
(8, 'fdjhj', 'hhjh@hgjff', '12323'),
(9, 'fdjhj jh', 'hhjh@hgjffjhh', '12323'),
(10, 'gdgd', 'ghghjh2@ghfg', '123456'),
(11, 'fgdfg', 'rdgd@rgg', '121343'),
(12, 'fdgd', 'gfg@dgd', '1213'),
(13, 'Animesh Chandra', 'animesh0722@gmail.com', 'Classic@350');

-- --------------------------------------------------------

--
-- Table structure for table `customerOrder`
--

CREATE TABLE `customerOrder` (
  `order_id` int(11) NOT NULL,
  `customer_email` varchar(250) NOT NULL,
  `order_details` varchar(2500) NOT NULL,
  `orderAmount` varchar(250) NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customerOrder`
--

INSERT INTO `customerOrder` (`order_id`, `customer_email`, `order_details`, `orderAmount`, `dateTime`) VALUES
(20, 'khushi@mejona.in', '[{\"image\":\"image\\/product-2.png\",\"name\":\"fresh onion\",\"price\":\"$7.99\\/-\",\"quantity\":\"1\"},{\"image\":\"image\\/product-2.png\",\"name\":\"fresh onion\",\"price\":\"$7.99\\/-\",\"quantity\":\"1\"},{\"image\":\"image\\/product-1.png\",\"name\":\"fresh orange\",\"price\":\"$4.99\\/-\",\"quantity\":\"1\"},{\"image\":\"image\\/product-5.png\",\"name\":\"fresh potato\",\"price\":\"$10.99\\/-\",\"quantity\":\"1\"}]', '31.96', '2023-08-09 18:31:34'),
(21, 'khushi@mejona.in', '[{\"image\":\"image\\/product-1.png\",\"name\":\"fresh orange\",\"price\":\"$4.99\\/-\",\"quantity\":\"3\"},{\"image\":\"image\\/product-2.png\",\"name\":\"fresh onion\",\"price\":\"$7.99\\/-\",\"quantity\":\"4\"},{\"image\":\"image\\/product-6.png\",\"name\":\"fresh avocado\",\"price\":\"$14.99\\/-\",\"quantity\":\"1\"},{\"image\":\"image\\/product-7.png\",\"name\":\"fresh carrot\",\"price\":\"$10.99\\/-\",\"quantity\":\"1\"},{\"image\":\"image\\/product-4.png\",\"name\":\"fresh cabbage\",\"price\":\"$11.99\\/-\",\"quantity\":\"1\"},{\"image\":\"image\\/product-8.png\",\"name\":\"green lemon\",\"price\":\"$1.99\\/-\",\"quantity\":\"3\"}]', '52.94', '2023-08-09 18:48:00'),
(22, 'khushi@mejona.in', '[{\"image\":\"image\\/product-5.png\",\"name\":\"fresh potato\",\"price\":\"10.99\",\"quantity\":\"3\",\"productTotalPrice\":\"32.97\"},{\"image\":\"image\\/product-6.png\",\"name\":\"fresh avocado\",\"price\":\"14.99\",\"quantity\":\"3\",\"productTotalPrice\":\"44.97\"},{\"image\":\"image\\/product-3.png\",\"name\":\"fresh meat\",\"price\":\"19.99\",\"quantity\":\"1\",\"productTotalPrice\":\"19.99\"},{\"image\":\"image\\/product-4.png\",\"name\":\"fresh cabbage\",\"price\":\"11.99\",\"quantity\":\"1\",\"productTotalPrice\":\"11.99\"}]', '109.92', '2023-08-09 21:01:23'),
(23, 'khushi@mejona.in', '[{\"image\":\"image\\/product-1.png\",\"name\":\"fresh orange\",\"price\":\"4.99\",\"quantity\":\"2\",\"productTotalPrice\":\"9.98\"},{\"image\":\"image\\/product-3.png\",\"name\":\"fresh meat\",\"price\":\"19.99\",\"quantity\":\"1\",\"productTotalPrice\":\"19.99\"},{\"image\":\"image\\/product-8.png\",\"name\":\"green lemon\",\"price\":\"1.99\",\"quantity\":\"1\",\"productTotalPrice\":\"1.99\"}]', '31.96', '2023-08-09 21:05:27'),
(24, 'animesh0722@gmail.com', '[{\"image\":\"image\\/product-1.png\",\"name\":\"fresh orange\",\"price\":\"4.99\",\"quantity\":\"1\",\"productTotalPrice\":\"4.99\"}]', '4.99', '2023-08-10 00:31:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customerOrder`
--
ALTER TABLE `customerOrder`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customerOrder`
--

ALTER TABLE `customerOrder`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
