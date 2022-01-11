-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2021 at 01:53 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `code`) VALUES
(1, 'United States', 'USA'),
(2, 'United Kingdom', 'UK'),
(3, 'Canada', 'CA');

-- --------------------------------------------------------

--
-- Table structure for table `mt_booking_room`
--

CREATE TABLE IF NOT EXISTS `mt_booking_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `total_count_room` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `date_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL DEFAULT 0,
  `slug_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_booking_room`
--

INSERT INTO `mt_booking_room` (`id`, `uuid`, `organization_id`, `name`, `location`, `total_count_room`, `status`, `date_at`, `update_at`, `created_by`, `slug_url`) VALUES
(1, '', 4, 'New delhi inn public', 'New delhi south west', 3, 0, '2021-08-11 10:18:26', '2021-08-11 10:18:26', 1, 'new-delhi-inn-public'),
(2, '', 3, 'Noida Room1', 'noida sector-18', 2, 1, '2021-08-11 10:19:28', '2021-08-11 10:19:28', 1, 'noida-room1'),
(3, '', 2, 'Delhi Room1', 'New delhi sourh ', 4, 1, '2021-08-11 12:11:48', '2021-08-11 12:11:48', 0, 'delhi-room1'),
(4, '', 1, 'Delhi Room1', 'dylhi', 3, 1, '2021-08-12 10:49:46', '2021-08-12 10:49:46', 28, 'delhi-room1'),
(7, '', 1, 'State Delhi', 'Delhi East Dwarka', 5, 1, '2021-08-13 10:12:31', '2021-08-13 10:12:31', 28, 'state-delhi'),
(8, '', 1, 'Test One Room With title', 'Room Address', 6, 1, '2021-08-16 10:34:34', '2021-08-16 10:34:34', 28, 'test-one-room-with-title'),
(9, '', 2, 'test2 room named', 'New delhi sourh  defli', 0, 0, '2021-08-16 10:29:29', '2021-08-16 13:59:29', 28, 'test2-room-named'),
(10, '', 1, 'Delhi Room1123', 'New delhi sourh ', 4, 1, '2021-08-17 07:13:39', '2021-08-17 10:43:39', 1, 'delhi-room1123');

-- --------------------------------------------------------

--
-- Table structure for table `mt_booking_room_serial`
--

CREATE TABLE IF NOT EXISTS `mt_booking_room_serial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `organization_id` int(200) DEFAULT NULL,
  `date_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 0,
  `price` int(11) DEFAULT NULL,
  `price_per_heaed` int(11) DEFAULT 0,
  `room_number` varchar(200) DEFAULT NULL,
  `available` int(11) DEFAULT 0,
  `booked` int(11) DEFAULT 0,
  `no_bed` int(11) DEFAULT 0,
  `created_by` int(11) DEFAULT 0,
  `is_share` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_booking_room_serial`
--

INSERT INTO `mt_booking_room_serial` (`id`, `room_id`, `room_type_id`, `organization_id`, `date_at`, `update_at`, `status`, `price`, `price_per_heaed`, `room_number`, `available`, `booked`, `no_bed`, `created_by`, `is_share`) VALUES
(1, 1, 1, 4, '2021-08-13 11:47:16', '2021-08-11 11:12:21', 1, 1200, 400, '4_NE_0', 3, 0, 3, 28, 1),
(11, 3, 1, 2, '2021-08-13 10:11:15', '2021-08-11 18:26:13', 1, 1113, 0, '2_DE_0', 5, 0, 5, 28, 1),
(12, 3, 3, 2, '2021-08-13 10:11:08', '2021-08-11 18:26:32', 1, 0, 0, '2_DE_1', 2, 0, 2, 28, 1),
(13, 3, 2, 2, '2021-08-13 10:09:52', '2021-08-11 18:45:38', 1, 12, 0, '2_DE_2', 12, 0, 12, 28, 1),
(14, 3, 4, 2, '2021-08-13 10:09:54', '2021-08-11 18:46:37', 1, 121212, 0, '2_DE_3', 10, 0, 10, 28, 1),
(15, 2, 1, 3, '2021-08-13 10:09:39', '2021-08-12 09:42:46', 1, 1200, 0, '3_NO_0', 4, 0, 4, 28, 1),
(16, 2, 2, 3, '2021-08-13 10:09:41', '2021-08-12 09:43:22', 1, 1500, 0, '3_NO_1', 5, 0, 5, 28, 1),
(17, 4, 1, 1, '2021-08-13 10:23:51', '2021-08-12 11:04:30', 1, 1290, 323, '1_DE_0', 4, 0, 4, 28, 1),
(18, 4, 2, 1, '2021-08-13 10:10:05', '2021-08-12 11:06:22', 1, 12, 0, '1_DE_1', 12, 0, 12, 28, 1),
(19, 4, 3, 1, '2021-08-13 10:10:06', '2021-08-12 11:29:40', 1, 1200, 0, '1_DE_2', 12, 0, 12, 28, 1),
(20, 1, 2, 4, '2021-08-13 11:47:50', '2021-08-13 10:08:48', 1, 1300, 217, '4_NE_1', 6, 0, 6, 28, 1),
(21, 7, 1, 1, '2021-08-13 10:13:59', '2021-08-13 10:13:01', 1, 1200, 0, '1_ST_0', 3, 0, 3, 28, 1),
(22, 7, 1, 1, '2021-08-13 10:14:12', '2021-08-13 10:14:12', 1, 12, 0, '1_ST_1', 4, 0, 4, 28, 1),
(23, 8, 1, 1, '2021-08-16 10:34:55', '2021-08-16 10:34:55', 1, 2000, 667, '1_TE_0', 3, 0, 3, 28, 1),
(24, 9, 1, 2, '2021-08-17 07:12:34', '2021-08-16 14:00:23', 1, 1200, 240, '2_TE_0', 5, 0, 5, 1, 1),
(25, 9, 2, 1, '2021-08-16 10:31:12', '2021-08-16 14:01:12', 1, 1290, 108, '1_TE_1', 12, 0, 12, 28, 1),
(26, 10, 1, 1, '2021-08-17 07:54:04', '2021-08-17 10:43:52', 1, 24000, 2000, '1_DE_0', 12, 0, 12, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_facility`
--

CREATE TABLE IF NOT EXISTS `mt_facility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `date_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_facility`
--

INSERT INTO `mt_facility` (`id`, `name`, `status`, `date_at`, `update_at`, `created_by`) VALUES
(1, 'AC', 1, '2021-08-11 10:53:13', '2021-08-11 10:53:13', 1),
(2, 'TV', 1, '2021-08-11 10:54:40', '2021-08-11 10:54:40', 1),
(3, 'WIFI', 1, '2021-08-11 10:54:40', '2021-08-11 10:54:40', 1),
(4, 'Sofa', 1, '2021-08-11 10:54:40', '2021-08-11 10:54:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_organization_room`
--

CREATE TABLE IF NOT EXISTS `mt_organization_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `date_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_organization_room`
--

INSERT INTO `mt_organization_room` (`id`, `name`, `status`, `date_at`, `update_at`) VALUES
(1, 'Organization1', 1, '2021-08-11 10:27:55', '2021-08-11 10:27:55'),
(2, 'Organization2', 1, '2021-08-11 10:30:20', '2021-08-11 10:30:20'),
(3, 'Organization3', 1, '2021-08-11 10:30:20', '2021-08-11 10:30:20'),
(4, 'Organization4', 1, '2021-08-11 10:30:20', '2021-08-11 10:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `mt_room_book_detail`
--

CREATE TABLE IF NOT EXISTS `mt_room_book_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `room_type` int(11) DEFAULT NULL,
  `room_number` varchar(200) DEFAULT NULL,
  `bed_number` varchar(200) DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `adult` int(11) DEFAULT NULL,
  `child` int(11) DEFAULT NULL,
  `book_order_id` int(11) DEFAULT NULL,
  `date_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `serial_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `check_in_str` int(20) DEFAULT NULL,
  `check_out_str` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_room_book_detail`
--

INSERT INTO `mt_room_book_detail` (`id`, `Name`, `room_id`, `organization_id`, `room_type`, `room_number`, `bed_number`, `check_in`, `check_out`, `status`, `adult`, `child`, `book_order_id`, `date_at`, `update_at`, `serial_id`, `user_id`, `amount`, `check_in_str`, `check_out_str`) VALUES
(1, NULL, 1, 4, 2, NULL, '1', '2021-08-13 00:00:00', '2021-08-16 00:00:00', 1, NULL, NULL, 1, '2021-08-13 00:00:00', NULL, 20, 28, '217', NULL, NULL),
(2, NULL, 1, 4, 2, NULL, '1', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 2, '2021-08-13 00:00:00', NULL, 20, 28, '217', NULL, NULL),
(3, NULL, 4, 1, 3, NULL, '1', '2021-08-13 00:00:00', '2021-08-16 00:00:00', 1, NULL, NULL, 3, '2021-08-13 00:00:00', NULL, 19, 28, '0', NULL, NULL),
(4, NULL, 1, 4, 2, NULL, '3', '2021-08-13 00:00:00', '2021-08-14 00:00:00', 1, NULL, NULL, 4, '2021-08-13 00:00:00', NULL, 20, 28, '217', NULL, NULL),
(5, NULL, 1, 4, 2, NULL, '2', '2021-08-13 00:00:00', '2021-08-14 00:00:00', 1, NULL, NULL, 5, '2021-08-13 00:00:00', NULL, 20, 28, '217', NULL, NULL),
(6, NULL, 1, 4, 1, NULL, '1', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 6, '2021-08-16 00:00:00', NULL, 1, 28, '400', NULL, NULL),
(7, NULL, 1, 4, 1, NULL, '2', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 6, '2021-08-16 00:00:00', NULL, 1, 28, '400', NULL, NULL),
(8, NULL, 1, 4, 1, NULL, '1', '2021-08-18 00:00:00', '2021-08-19 00:00:00', 1, NULL, NULL, 7, '2021-08-16 00:00:00', NULL, 1, 28, '400', NULL, NULL),
(9, NULL, 3, 2, 1, NULL, '1', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 8, '2021-08-16 00:00:00', NULL, 11, 28, '0', NULL, NULL),
(10, NULL, 3, 2, 1, NULL, '2', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 8, '2021-08-16 00:00:00', NULL, 11, 28, '0', NULL, NULL),
(11, NULL, 7, 1, 1, NULL, '1', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 9, '2021-08-16 00:00:00', NULL, 21, 28, '0', NULL, NULL),
(12, NULL, 7, 1, 1, NULL, '2', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 9, '2021-08-16 00:00:00', NULL, 21, 28, '0', NULL, NULL),
(13, NULL, 7, 1, 1, NULL, '1', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 10, '2021-08-16 00:00:00', NULL, 22, 28, '0', NULL, NULL),
(14, NULL, 7, 1, 1, NULL, '2', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 10, '2021-08-16 00:00:00', NULL, 22, 28, '0', NULL, NULL),
(15, NULL, 2, 3, 1, NULL, '1', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 11, '2021-08-16 00:00:00', NULL, 15, 26, '0', NULL, NULL),
(16, NULL, 2, 3, 1, NULL, '2', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 11, '2021-08-16 00:00:00', NULL, 15, 26, '0', NULL, NULL),
(17, NULL, 2, 3, 1, NULL, '3', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 12, '2021-08-16 00:00:00', NULL, 15, 26, '0', 20210816, 2021),
(18, NULL, 2, 3, 1, NULL, '4', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 13, '2021-08-16 00:00:00', NULL, 15, 26, '0', 20210816, 2021),
(19, NULL, 2, 3, 1, NULL, '1', '2021-08-18 00:00:00', '2021-08-19 00:00:00', 1, NULL, NULL, 14, '2021-08-16 00:00:00', NULL, 15, 26, '0', 20210818, 2021444444),
(20, NULL, 2, 3, 1, NULL, '2', '2021-08-19 00:00:00', '2021-08-20 00:00:00', 1, NULL, NULL, 15, '2021-08-16 00:00:00', NULL, 15, 26, '0', 20210819, 20210820),
(21, NULL, 2, 3, 1, NULL, '3', '2021-08-19 00:00:00', '2021-08-20 00:00:00', 1, NULL, NULL, 15, '2021-08-16 00:00:00', NULL, 15, 26, '0', 20210819, 20210820),
(22, NULL, 2, 3, 2, NULL, '1', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 16, '2021-08-16 00:00:00', NULL, 16, 26, '0', 20210816, 20210817),
(23, NULL, 2, 3, 2, NULL, '2', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 16, '2021-08-16 00:00:00', NULL, 16, 26, '0', 20210816, 20210817),
(24, NULL, 2, 3, 2, NULL, '4', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 17, '2021-08-16 00:00:00', NULL, 16, 26, '0', 20210816, 20210817),
(25, NULL, 2, 3, 2, NULL, '5', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 17, '2021-08-16 00:00:00', NULL, 16, 26, '0', 20210816, 20210817),
(26, NULL, 2, 3, 2, NULL, '3', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 1, NULL, NULL, 18, '2021-08-16 00:00:00', NULL, 16, 26, '0', 20210816, 20210817),
(27, NULL, 2, 3, 2, NULL, '1', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 19, '2021-08-17 00:00:00', NULL, 16, 28, '0', 20210817, 20210818),
(28, NULL, 2, 3, 1, NULL, '1', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 20, '2021-08-17 00:00:00', NULL, 15, 1, '0', 20210817, 20210818),
(29, NULL, 2, 3, 1, '3_NO_0', '2', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 22, '2021-08-17 00:00:00', NULL, 15, 1, '0', 20210817, 20210818),
(30, NULL, 2, 3, 1, '3_NO_0', '4', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 23, '2021-08-17 00:00:00', NULL, 15, 1, '0', 20210817, 20210818),
(31, NULL, 2, 3, 1, '3_NO_0', '3', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 24, '2021-08-17 00:00:00', NULL, 15, 1, '0', 20210817, 20210818),
(32, NULL, 10, 1, 1, '1_DE_0', '1', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 25, '2021-08-17 00:00:00', NULL, 26, 1, '2000', 20210817, 20210818),
(33, NULL, 10, 1, 1, '1_DE_0', '2', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 26, '2021-08-17 00:00:00', NULL, 26, 1, '2000', 20210817, 20210818),
(34, NULL, 10, 1, 1, '1_DE_0', '3', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 27, '2021-08-17 00:00:00', NULL, 26, 1, '2000', 20210817, 20210818),
(35, NULL, 10, 1, 1, '1_DE_0', '4', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 28, '2021-08-17 00:00:00', NULL, 26, 1, '2000', 20210817, 20210818),
(36, NULL, 10, 1, 1, '1_DE_0', '5', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 29, '2021-08-17 00:00:00', NULL, 26, 1, '2000', 20210817, 20210818),
(37, NULL, 10, 1, 1, '1_DE_0', '6', '2021-08-17 00:00:00', '2021-08-18 00:00:00', 1, NULL, NULL, 30, '2021-08-17 00:00:00', NULL, 26, 1, '2000', 20210817, 20210818);

-- --------------------------------------------------------

--
-- Table structure for table `mt_room_book_order`
--

CREATE TABLE IF NOT EXISTS `mt_room_book_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT 0,
  `transaction_id` varchar(200) DEFAULT NULL,
  `date_at` datetime DEFAULT current_timestamp(),
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `no_of_bed` int(11) DEFAULT 0,
  `room_number` varchar(200) DEFAULT NULL,
  `no_of_adult` int(11) DEFAULT NULL,
  `no_of_child` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `salutation` int(11) DEFAULT NULL,
  `f_name` varchar(200) DEFAULT NULL,
  `l_name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `check_in_str` int(20) DEFAULT NULL,
  `check_out_str` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_room_book_order`
--

INSERT INTO `mt_room_book_order` (`id`, `user_id`, `transaction_id`, `date_at`, `check_in`, `check_out`, `room_id`, `no_of_bed`, `room_number`, `no_of_adult`, `no_of_child`, `status`, `update_at`, `amount`, `salutation`, `f_name`, `l_name`, `email`, `mobile`, `check_in_str`, `check_out_str`) VALUES
(1, 28, '1', '2021-08-13 00:00:00', '2021-08-13 00:00:00', '2021-08-16 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '217', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 28, '2', '2021-08-13 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '217', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 28, '3', '2021-08-13 00:00:00', '2021-08-13 00:00:00', '2021-08-16 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 28, '4', '2021-08-13 00:00:00', '2021-08-13 00:00:00', '2021-08-14 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '217', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 28, '5', '2021-08-13 00:00:00', '2021-08-13 00:00:00', '2021-08-14 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '217', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 28, '6', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 2, NULL, NULL, 0, 1, NULL, '800', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 28, '7', '2021-08-16 00:00:00', '2021-08-18 00:00:00', '2021-08-19 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '400', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 28, '10', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 2, NULL, NULL, 0, 1, NULL, '0', 1, NULL, NULL, 'amitkhurana12@gmail.com', '123123123111', NULL, NULL),
(9, 28, '11', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 2, NULL, NULL, 0, 1, NULL, '0', 1, NULL, NULL, 'amitkhurana12@gmail.com', '123123123111', NULL, NULL),
(10, 28, '12', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 2, NULL, NULL, 0, 1, NULL, '0', 1, 'amitkhurana12', 'khurana12', 'amitkhurana12@gmail.com', '123123123111', NULL, NULL),
(11, 26, '13', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 2, NULL, NULL, 0, 1, NULL, '0', 1, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', NULL, NULL),
(12, 26, '14', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '0', 1, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', 20210816, 20210817),
(13, 26, '15', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '0', 1, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', 20210816, 20210817),
(14, 26, '16', '2021-08-16 00:00:00', '2021-08-18 00:00:00', '2021-08-19 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '0', 1, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', 20210818, 20210819),
(15, 26, '17', '2021-08-16 00:00:00', '2021-08-19 00:00:00', '2021-08-20 00:00:00', NULL, 2, NULL, 0, 0, 1, NULL, '0', 1, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', 20210819, 20210820),
(16, 26, '18', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 1, NULL, NULL, 0, 1, NULL, '0', 1, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', 20210816, 20210817),
(17, 26, '19', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 2, NULL, 1, 0, 1, NULL, '0', 1, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', 20210816, 20210817),
(18, 26, '20', '2021-08-16 00:00:00', '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, 1, NULL, 2, 0, 1, NULL, '0', 1, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', 20210816, 20210817),
(19, 28, '21', '2021-08-17 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '0', 1, 'amitkhurana12', 'khurana12', 'amitkhurana12@gmail.com', '123123123111', 20210817, 20210818),
(20, 1, '22', '2021-08-17 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '0', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(21, 1, '23', '2021-08-17 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, NULL, 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(22, 1, '24', '2021-08-17 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '0', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(23, 1, '25', '2021-08-17 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '0', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(24, 1, '26', '2021-08-17 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, NULL, 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(25, 1, '27', '2021-08-17 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, NULL, 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(26, 1, '28', '2021-08-17 00:00:00', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '2000', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(27, 1, '29', '2021-08-17 08:21:40', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '2000', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(28, 1, '30', '2021-08-17 11:52:37', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '2000', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(29, 1, '31', '2021-08-17 11:54:50', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '2000', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(30, 1, '32', '2021-08-17 11:57:26', '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '2000', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210817, 20210818),
(31, 1, '33', '2021-08-17 12:20:07', '2021-08-18 00:00:00', '2021-08-19 00:00:00', NULL, 1, NULL, 1, 0, 1, NULL, '2000', 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', 20210818, 20210819);

-- --------------------------------------------------------

--
-- Table structure for table `mt_room_book_transaction`
--

CREATE TABLE IF NOT EXISTS `mt_room_book_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `pay_mode` int(11) NOT NULL,
  `book_order_id` int(11) NOT NULL,
  `date_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 1 COMMENT '1.Pending\r\n2.Payment Done\r\n3.Payment Cancel',
  `checkin` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `room_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_room_book_transaction`
--

INSERT INTO `mt_room_book_transaction` (`id`, `amount`, `pay_type`, `pay_mode`, `book_order_id`, `date_at`, `update_at`, `user_id`, `name`, `payment_status`, `checkin`, `checkout`, `room_id`, `organization_id`, `room_type`) VALUES
(1, 217, 0, 0, 1, '2021-08-13 00:00:00', NULL, 28, 0, 2, '2021-08-13 00:00:00', '2021-08-16 00:00:00', NULL, NULL, NULL),
(2, 217, 0, 0, 2, '2021-08-13 00:00:00', NULL, 28, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(3, 0, 0, 0, 3, '2021-08-13 00:00:00', NULL, 28, 0, 2, '2021-08-13 00:00:00', '2021-08-16 00:00:00', NULL, NULL, NULL),
(4, 217, 0, 0, 4, '2021-08-13 00:00:00', NULL, 28, 0, 2, '2021-08-13 00:00:00', '2021-08-14 00:00:00', NULL, NULL, NULL),
(5, 217, 0, 0, 5, '2021-08-13 00:00:00', NULL, 28, 0, 2, '2021-08-13 00:00:00', '2021-08-14 00:00:00', NULL, NULL, NULL),
(6, 800, 0, 0, 6, '2021-08-16 00:00:00', NULL, 28, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(7, 400, 0, 0, 7, '2021-08-16 00:00:00', NULL, 28, 0, 2, '2021-08-18 00:00:00', '2021-08-19 00:00:00', NULL, NULL, NULL),
(8, 0, 0, 0, 0, '2021-08-16 00:00:00', NULL, 28, 0, 1, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(9, 0, 0, 0, 0, '2021-08-16 00:00:00', NULL, 28, 0, 1, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(10, 0, 0, 0, 8, '2021-08-16 00:00:00', NULL, 28, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(11, 0, 0, 0, 9, '2021-08-16 00:00:00', NULL, 28, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(12, 0, 0, 0, 10, '2021-08-16 00:00:00', NULL, 28, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(13, 0, 0, 0, 11, '2021-08-16 00:00:00', NULL, 26, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(14, 0, 0, 0, 12, '2021-08-16 00:00:00', NULL, 26, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(15, 0, 0, 0, 13, '2021-08-16 00:00:00', NULL, 26, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(16, 0, 0, 0, 14, '2021-08-16 00:00:00', NULL, 26, 0, 2, '2021-08-18 00:00:00', '2021-08-19 00:00:00', NULL, NULL, NULL),
(17, 0, 0, 0, 15, '2021-08-16 00:00:00', NULL, 26, 0, 2, '2021-08-19 00:00:00', '2021-08-20 00:00:00', NULL, NULL, NULL),
(18, 0, 0, 0, 16, '2021-08-16 00:00:00', NULL, 26, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(19, 0, 0, 0, 17, '2021-08-16 00:00:00', NULL, 26, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(20, 0, 0, 0, 18, '2021-08-16 00:00:00', NULL, 26, 0, 2, '2021-08-16 00:00:00', '2021-08-17 00:00:00', NULL, NULL, NULL),
(21, 0, 0, 0, 19, '2021-08-17 00:00:00', NULL, 28, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(22, 0, 0, 0, 20, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(23, 0, 0, 0, 0, '2021-08-17 00:00:00', NULL, 1, 0, 1, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(24, 0, 0, 0, 22, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(25, 0, 0, 0, 23, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(26, 0, 0, 0, 0, '2021-08-17 00:00:00', NULL, 1, 0, 1, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(27, 0, 0, 0, 0, '2021-08-17 00:00:00', NULL, 1, 0, 1, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(28, 2000, 0, 0, 26, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(29, 2000, 0, 0, 27, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(30, 2000, 0, 0, 28, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(31, 2000, 0, 0, 29, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(32, 2000, 0, 0, 30, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-17 00:00:00', '2021-08-18 00:00:00', NULL, NULL, NULL),
(33, 2000, 0, 0, 31, '2021-08-17 00:00:00', NULL, 1, 0, 2, '2021-08-18 00:00:00', '2021-08-19 00:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mt_room_facility`
--

CREATE TABLE IF NOT EXISTS `mt_room_facility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `facility_id` int(11) DEFAULT 0,
  `organization_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `date_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_room_facility`
--

INSERT INTO `mt_room_facility` (`id`, `room_id`, `facility_id`, `organization_id`, `room_type_id`, `status`, `date_at`, `update_at`, `created_by`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-08-11 10:57:45', '2021-08-11 07:27:20', 1),
(2, 1, 2, NULL, NULL, 1, '2021-08-11 10:57:45', '2021-08-11 07:27:20', 1),
(3, 2, 3, NULL, NULL, 1, '2021-08-11 10:58:31', '2021-08-11 07:27:20', 1),
(4, 2, 1, NULL, NULL, 1, '2021-08-11 10:58:31', '2021-08-11 07:27:20', 1),
(5, 2, 2, NULL, NULL, 1, '2021-08-11 10:58:31', '2021-08-11 07:27:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_room_type`
--

CREATE TABLE IF NOT EXISTS `mt_room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `date_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp(),
  `number_of_bed` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mt_room_type`
--

INSERT INTO `mt_room_type` (`id`, `name`, `status`, `date_at`, `update_at`, `number_of_bed`) VALUES
(1, 'Basic', 1, '2021-08-11 10:27:55', '2021-08-11 10:27:55', 2),
(2, 'Duplex', 1, '2021-08-11 10:30:20', '2021-08-11 10:30:20', 2),
(3, 'Family', 1, '2021-08-11 10:30:20', '2021-08-11 10:30:20', 2),
(4, 'Super Comfort', 1, '2021-08-11 10:30:20', '2021-08-11 10:30:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE IF NOT EXISTS `signup` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `signUpName` varchar(100) NOT NULL,
  `signUpEmail` varchar(100) NOT NULL,
  `signUpPassword` varchar(100) NOT NULL,
  `signUpConfirmPassword` varchar(100) NOT NULL,
  `signUpPhone` int(100) NOT NULL,
  `signUpAgent` varchar(100) NOT NULL,
  `signUpNameRobot` varchar(100) NOT NULL,
  `signUpNameTerms` varchar(100) NOT NULL,
  `signUpNameUpdates` varchar(100) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryId` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `countryId`, `code`, `name`) VALUES
(1, 1, 'AL', 'Alabama'),
(2, 1, 'AK', 'Alaska'),
(3, 1, 'AZ', 'Arizona'),
(4, 1, 'AR', 'Arkansas'),
(5, 1, 'CA', 'California'),
(6, 1, 'CO', 'Colorado'),
(7, 1, 'CT', 'Connecticut'),
(8, 1, 'DE', 'Delaware'),
(9, 1, 'DC', 'District of Columbia'),
(10, 1, 'FL', 'Florida'),
(11, 1, 'GA', 'Georgia'),
(12, 1, 'HI', 'Hawaii'),
(13, 1, 'ID', 'Idaho'),
(14, 1, 'IL', 'Illinois'),
(15, 1, 'IN', 'Indiana'),
(16, 1, 'IA', 'Iowa'),
(17, 1, 'KS', 'Kansas'),
(18, 1, 'KY', 'Kentucky'),
(19, 1, 'LA', 'Louisiana'),
(20, 1, 'ME', 'Maine'),
(21, 1, 'MD', 'Maryland'),
(22, 1, 'MA', 'Massachusetts'),
(23, 1, 'MI', 'Michigan'),
(24, 1, 'MN', 'Minnesota'),
(25, 1, 'MS', 'Mississippi'),
(26, 1, 'MO', 'Missouri'),
(27, 1, 'MT', 'Montana'),
(28, 1, 'NE', 'Nebraska'),
(29, 1, 'NV', 'Nevada'),
(30, 1, 'NH', 'New Hampshire'),
(31, 1, 'NJ', 'New Jersey'),
(32, 1, 'NM', 'New Mexico'),
(33, 1, 'NY', 'New York'),
(34, 1, 'NC', 'North Carolina'),
(35, 1, 'ND', 'North Dakota'),
(36, 1, 'OH', 'Ohio'),
(37, 1, 'OK', 'Oklahoma'),
(38, 1, 'OR', 'Oregon'),
(39, 1, 'PA', 'Pennsylvania'),
(40, 1, 'PR', 'Puerto Rico'),
(41, 1, 'RI', 'Rhode Island'),
(42, 1, 'SC', 'South Carolina'),
(43, 1, 'SD', 'South Dakota'),
(44, 1, 'TN', 'Tennessee'),
(45, 1, 'TX', 'Texas'),
(46, 1, 'UT', 'Utah'),
(47, 1, 'VT', 'Vermont'),
(48, 1, 'VA', 'Virginia'),
(49, 1, 'WA', 'Washington'),
(50, 1, 'WV', 'West Virginia'),
(51, 1, 'WI', 'Wisconsin'),
(52, 1, 'WY', 'Wyoming'),
(53, 2, ' ', 'Aberdeen'),
(54, 2, ' ', 'Aberdeenshire'),
(55, 2, ' ', 'Argyll'),
(56, 2, ' ', 'Armagh'),
(57, 2, ' ', 'Bedfordshire'),
(58, 2, ' ', 'Belfast'),
(59, 2, ' ', 'Berkshire'),
(60, 2, ' ', 'Birmingham'),
(61, 2, ' ', 'Brechin'),
(62, 2, ' ', 'Bridgnorth'),
(63, 2, ' ', 'Bristol'),
(64, 2, ' ', 'Buckinghamshire'),
(65, 2, ' ', 'Cambridge'),
(66, 2, ' ', 'Cambridgeshire'),
(67, 2, ' ', 'Channel Islands'),
(68, 2, ' ', 'Cheshire'),
(69, 2, ' ', 'Cleveland'),
(70, 2, ' ', 'Co Fermanagh'),
(71, 2, ' ', 'Conwy'),
(72, 2, ' ', 'Cornwall'),
(73, 2, ' ', 'Coventry'),
(74, 2, ' ', 'Craven Arms'),
(75, 2, ' ', 'Cumbria'),
(76, 2, ' ', 'Denbighshire'),
(77, 2, ' ', 'Derby'),
(78, 2, ' ', 'Derbyshire'),
(79, 2, ' ', 'Devon'),
(80, 2, ' ', 'Dial Code Dungannon'),
(81, 2, ' ', 'Didcot'),
(82, 2, ' ', 'Dorset'),
(83, 2, ' ', 'Dunbartonshire'),
(84, 2, ' ', 'Durham'),
(85, 2, ' ', 'East Dunbartonshire'),
(86, 2, ' ', 'East Lothian'),
(87, 2, ' ', 'East Midlands'),
(88, 2, ' ', 'East Sussex'),
(89, 2, ' ', 'East Yorkshire'),
(90, 2, ' ', 'England'),
(91, 2, ' ', 'Essex'),
(92, 2, ' ', 'Fermanagh'),
(93, 2, ' ', 'Fife'),
(94, 2, ' ', 'Flintshire'),
(95, 2, ' ', 'Fulham'),
(96, 2, ' ', 'Gainsborough'),
(97, 2, ' ', 'Glocestershire'),
(98, 2, ' ', 'Gwent'),
(99, 2, ' ', 'Hampshire'),
(100, 2, ' ', 'Hants'),
(101, 2, ' ', 'Herefordshire'),
(102, 2, ' ', 'Hertfordshire'),
(103, 2, ' ', 'Ireland'),
(104, 2, ' ', 'Isle Of Man'),
(105, 2, ' ', 'Isle of Wight'),
(106, 2, ' ', 'Kenford'),
(107, 2, ' ', 'Kent'),
(108, 2, ' ', 'Kilmarnock'),
(109, 2, ' ', 'Lanarkshire'),
(110, 2, ' ', 'Lancashire'),
(111, 2, ' ', 'Leicestershire'),
(112, 2, ' ', 'Lincolnshire'),
(113, 2, ' ', 'Llanymynech'),
(114, 2, ' ', 'London'),
(115, 2, ' ', 'Ludlow'),
(116, 2, ' ', 'Manchester'),
(117, 2, ' ', 'Mayfair'),
(118, 2, ' ', 'Merseyside'),
(119, 2, ' ', 'Mid Glamorgan'),
(120, 2, ' ', 'Middlesex'),
(121, 2, ' ', 'Mildenhall'),
(122, 2, ' ', 'Monmouthshire'),
(123, 2, ' ', 'Newton Stewart'),
(124, 2, ' ', 'Norfolk'),
(125, 2, ' ', 'North Humberside'),
(126, 2, ' ', 'North Yorkshire'),
(127, 2, ' ', 'Northamptonshire'),
(128, 2, ' ', 'Northants'),
(129, 2, ' ', 'Northern Ireland'),
(130, 2, ' ', 'Northumberland'),
(131, 2, ' ', 'Nottinghamshire'),
(132, 2, ' ', 'Oxford'),
(133, 2, ' ', 'Powys'),
(134, 2, ' ', 'Roos-shire'),
(135, 2, ' ', 'SUSSEX'),
(136, 2, ' ', 'Sark'),
(137, 2, ' ', 'Scotland'),
(138, 2, ' ', 'Scottish Borders'),
(139, 2, ' ', 'Shropshire'),
(140, 2, ' ', 'Somerset'),
(141, 2, ' ', 'South Glamorgan'),
(142, 2, ' ', 'South Wales'),
(143, 2, ' ', 'South Yorkshire'),
(144, 2, ' ', 'Southwell'),
(145, 2, ' ', 'Staffordshire'),
(146, 2, ' ', 'Strabane'),
(147, 2, ' ', 'Suffolk'),
(148, 2, ' ', 'Surrey'),
(149, 2, ' ', 'Sussex'),
(150, 2, ' ', 'Twickenham'),
(151, 2, ' ', 'Tyne and Wear'),
(152, 2, ' ', 'Tyrone'),
(153, 2, ' ', 'Utah'),
(154, 2, ' ', 'Wales'),
(155, 2, ' ', 'Warwickshire'),
(156, 2, ' ', 'West Lothian'),
(157, 2, ' ', 'West Midlands'),
(158, 2, ' ', 'West Sussex'),
(159, 2, ' ', 'West Yorkshire'),
(160, 2, ' ', 'Whissendine'),
(161, 2, ' ', 'Wiltshire'),
(162, 2, ' ', 'Wokingham'),
(163, 2, ' ', 'Worcestershire'),
(164, 2, ' ', 'Wrexham'),
(165, 2, ' ', 'Wurttemberg'),
(166, 2, ' ', 'Yorkshire'),
(167, 3, ' ', 'Alberta'),
(168, 3, ' ', 'British Columbia'),
(169, 3, ' ', 'Manitoba'),
(170, 3, ' ', 'New Brunswick'),
(171, 3, ' ', 'Newfoundland and Lab'),
(172, 3, ' ', 'Northwest Territorie'),
(173, 3, ' ', 'Nova Scotia'),
(174, 3, ' ', 'Nunavut'),
(175, 3, ' ', 'Ontario'),
(176, 3, ' ', 'Prince Edward Island'),
(177, 3, ' ', 'Quebec'),
(178, 3, ' ', 'Saskatchewan'),
(179, 3, ' ', 'Yukon'),
(180, 4, ' ', 'Auckland'),
(181, 4, ' ', 'Australian Capital T'),
(182, 4, ' ', 'Balgowlah'),
(183, 4, ' ', 'Balmain'),
(184, 4, ' ', 'Bankstown'),
(185, 4, ' ', 'Baulkham Hills'),
(186, 4, ' ', 'Bonnet Bay'),
(187, 4, ' ', 'Camberwell'),
(188, 4, ' ', 'Carole Park'),
(189, 4, ' ', 'Castle Hill'),
(190, 4, ' ', 'Caulfield'),
(191, 4, ' ', 'Chatswood'),
(192, 4, ' ', 'Cheltenham'),
(193, 4, ' ', 'Cherrybrook'),
(194, 4, ' ', 'Clayton'),
(195, 4, ' ', 'Collingwood'),
(196, 4, ' ', 'Frenchs Forest'),
(197, 4, ' ', 'Hawthorn'),
(198, 4, ' ', 'Jannnali'),
(199, 4, ' ', 'Knoxfield'),
(200, 4, ' ', 'Melbourne'),
(201, 4, ' ', 'New South Wales'),
(202, 4, ' ', 'Northern Territory'),
(203, 4, ' ', 'Perth'),
(204, 4, ' ', 'Queensland'),
(205, 4, ' ', 'South Australia'),
(206, 4, ' ', 'Tasmania'),
(207, 4, ' ', 'Templestowe'),
(208, 4, ' ', 'Victoria'),
(209, 4, ' ', 'Werribee south'),
(210, 4, ' ', 'Western Australia'),
(211, 4, ' ', 'Wheeler');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '1:admin,\r\n2:user\r\n',
  `fname` varchar(40) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `password` varchar(40) NOT NULL,
  `decripted_password` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `date_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp(),
  `vcode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `type`, `fname`, `lname`, `email`, `phone`, `street`, `city`, `state`, `country`, `zipcode`, `password`, `decripted_password`, `status`, `date_at`, `update_at`, `vcode`) VALUES
(1, 1, 'Vendor1', 'LastName', 'admin@demo.com', '9078563412', '', '', '', '', '', '65da5fc952cb836fede0dc0c6111ed40', 'Anit!@#$%54321', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 2, 'Abbas', 'Muzammil', 'abbas@demo.com', '7905754500', '', '', '', '', '', 'Noki@3310', NULL, 1, '2021-01-25 12:07:41', '2021-02-22 12:54:54', NULL),
(17, 2, 'Sunny', 'Deol', 'sunny@demo.com', '9876543219', '', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, '2021-03-25 09:37:17', '0000-00-00 00:00:00', NULL),
(16, 2, 'Arjun', 'Pandey', 'arjun@demo.com', '9876543219', '', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, '2021-03-25 09:36:05', '0000-00-00 00:00:00', NULL),
(15, 3, 'Rahul Sharma', '', 'rahul@demo.com', '9638527413', '', '', '', '', '', '123456789', NULL, 3, '2021-03-24 15:13:11', '0000-00-00 00:00:00', NULL),
(14, 3, '', '', 'anil@gmail.com', '9638527413', '', '', '', '', '', '123456', NULL, 3, '2021-03-24 15:07:12', '0000-00-00 00:00:00', NULL),
(13, 2, 'Samad', 'Idrisi', 'samad@demo.com', '9876543219', '', '', '', '', '', '25f9e794323b453885f5181f1b624d0b', NULL, 1, '2021-03-24 12:03:19', '0000-00-00 00:00:00', NULL),
(12, 3, '', '', 'arshad@demo.com', '789456123', '', '', '', '', '', '123456', NULL, 3, '2021-03-24 08:16:28', '0000-00-00 00:00:00', NULL),
(18, 2, 'Hello', 'Hey', 'hello@demo.com', '7894563214', '', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, '2021-03-25 09:38:11', '0000-00-00 00:00:00', NULL),
(19, 2, 'Kabir', 'Singh', 'kabir@demo.com', '9876543219', '', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, '2021-03-25 10:08:06', '0000-00-00 00:00:00', NULL),
(20, 2, 'Ramesh', 'Kumar', 'ramesh@demo.com', '7894561236', '', '', '', '', '', '25f9e794323b453885f5181f1b624d0b', NULL, 1, '2021-04-01 07:40:46', '0000-00-00 00:00:00', NULL),
(21, 3, 'Bottle Singh', '', 'bottle@demo.com', '919876543215', '', '', '', '', '', '5a05254570cc97ac9582ad7c5877f1ad', NULL, 1, '2021-04-01 11:56:22', '0000-00-00 00:00:00', ''),
(22, 2, 'Sam', 'Rizvi', 'samrizriz5@gmail.com', '9876543215', '', '', '', '', '', '250cf8b51c773f3f8dc8b4be867a9a02', NULL, 1, '2021-04-06 11:03:26', '0000-00-00 00:00:00', '79WRc6fb2FTIJpXj'),
(23, 2, 'samrizriz05', 'samrizriz05', 'samrizriz05@gmail.com', '999999999999', '', '', '', '', '', 'edcef089cc2d79f57b0691ee85c67c6b', NULL, 1, '2021-04-06 11:10:05', '0000-00-00 00:00:00', ''),
(24, 2, 'amit', 'khurana', 'amitkhurana@gmail.com', '1236547896', '', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, '2021-07-31 06:28:19', '0000-00-00 00:00:00', ''),
(25, 2, 'Muzammil', 'Abbas', 'muzzuaj@gmail.com', '07905754500', '', '', '', '', '', '5178ad6c749f2e047c6093495e57b483', NULL, 2, '2021-08-02 05:56:40', '0000-00-00 00:00:00', 'Gsq4auNd7fWO2QJ6'),
(26, 3, 'Muzammil', 'Abbas', 'abcd@demo.com', '07905754500', '', '', '', '', '', '65da5fc952cb836fede0dc0c6111ed40', 'Anit!@#$%54321', 1, '2021-08-02 05:57:31', '0000-00-00 00:00:00', ''),
(27, 2, 'anilkumar', '', 'anilkumar@demo.com', '124578963258', '', '', '', '', '', '65da5fc952cb836fede0dc0c6111ed40', 'Anit!@#$%54321', 1, '2021-08-11 06:37:30', '0000-00-00 00:00:00', ''),
(28, 2, 'amitkhurana12', 'khurana12', 'amitkhurana12@gmail.com', '123123123111', '', '', '', '', '', '65da5fc952cb836fede0dc0c6111ed40', 'Anit!@#$%54321', 0, '2021-08-12 09:32:44', '0000-00-00 00:00:00', ''),
(29, 2, 'Anilkumar', 'maurya', 'anilkumasrm309@gmail.com', '789888888888', '', '', '', '', '', '40a265654a2266d318e82cfbb50a679d', 'Anil!@#$%54321', 1, '2021-08-17 16:55:45', '2021-08-17 16:55:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `z_admin`
--

CREATE TABLE IF NOT EXISTS `z_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `admin_type` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(130) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `otp` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `z_admin`
--

INSERT INTO `z_admin` (`id`, `name`, `admin_type`, `email`, `phone`, `address`, `password`, `date_at`, `update_at`, `status`, `otp`) VALUES
(1, 'Admin', 1, 'admin@demo.com', '9876543210', 'Noida , Up , India', '123456', '2018-04-10 00:00:00', '0000-00-00 00:00:00', 1, ''),
(4, 'Sub Admin', 0, 'subadmin@demo.com', '9876543210', 'Noida', '123456', '2018-04-10 22:49:58', '0000-00-00 00:00:00', 1, '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
