-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 10, 2019 at 07:41 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flighthub`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
CREATE TABLE IF NOT EXISTS `airlines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AC', 'Air Canada', '2019-01-05 10:00:00', '2019-01-05 10:00:00'),
(2, 'BA', 'British Airways', '2019-01-05 10:00:00', '2019-01-05 10:00:00'),
(3, 'UA', 'United Airlines', '2019-01-06 10:00:00', '2019-01-06 10:00:00'),
(4, 'DA', 'Delta Airlines', '2019-01-06 10:00:00', '2019-01-06 10:00:00'),
(5, 'QTR', 'Qatar Airways', '2019-01-06 10:00:00', '2019-01-06 10:00:00'),
(6, 'SA', 'Swiss Airlines', '2019-01-06 10:00:00', '2019-01-06 10:00:00'),
(7, 'JA', 'Jet Airways', '2019-01-06 10:00:00', '2019-01-06 10:00:00'),
(8, 'AC', 'Air China', '2019-01-06 10:00:00', '2019-01-06 10:00:00'),
(9, 'CS', 'China Southern', '2019-01-06 10:00:00', '2019-01-06 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
CREATE TABLE IF NOT EXISTS `airports` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lattitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`id`, `code`, `city_code`, `city`, `country_code`, `region_code`, `lattitude`, `longitude`, `timezone`, `name`) VALUES
(1, 'YUL', 'YMQ', 'Montreal', 'CA', 'QC', '45.45771400', '-73.74990800', 'America/Montreal', 'Pierre Elliott Trudeau International'),
(2, 'YVR', 'YVR', 'Vancouver', 'CA', 'BC', '49.19469800', '-123.17919200', 'America/Vancouver', 'Vancouver International'),
(3, 'DMK', 'BKK', 'Bangkok', 'THA', 'BG', '13.75630000', '100.50180000', 'Asia/Bangkok', 'Don Mueang International Airport'),
(4, 'DEL', 'DEL', 'New Delhi', 'DEL', 'DEL', '28.70410000', '77.10250000', 'Asia/Kolkata', 'Indira Gandhi International Airport');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
CREATE TABLE IF NOT EXISTS `flights` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_seats` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wifi_availability` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `airline_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `flight_number`, `total_seats`, `wifi_availability`, `airline_id`) VALUES
(1, '301', '25', '0', '1'),
(2, '302', '35', '1', '1'),
(3, '303', '40', '0', '2'),
(4, '304', '40', '1', '7'),
(5, '305', '45', '0', '4'),
(6, '306', '40', '1', '5'),
(7, '307', '45', '0', '6');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2014_10_12_000000_create_users_table', 1),
(21, '2014_10_12_100000_create_password_resets_table', 1),
(22, '2019_01_04_221311_create_airports_table', 1),
(23, '2019_01_05_190236_create_airlines_table', 1),
(24, '2019_01_05_190341_create_flights_table', 1),
(25, '2019_01_08_181148_create_trips_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
CREATE TABLE IF NOT EXISTS `trips` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flight_id` int(11) NOT NULL,
  `departure_airport_id` int(11) NOT NULL,
  `arrival_airport_id` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `departure_date_time` datetime NOT NULL,
  `arrival_date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `flight_id`, `departure_airport_id`, `arrival_airport_id`, `price`, `departure_date_time`, `arrival_date_time`) VALUES
(1, 1, 1, 2, '273.00', '2019-01-09 22:56:00', '2019-01-09 20:00:00'),
(2, 2, 2, 1, '221.00', '2019-01-18 10:00:00', '2019-01-18 18:00:00'),
(3, 3, 2, 1, '330.00', '2019-01-18 08:30:00', '2019-01-18 19:30:00'),
(4, 4, 1, 2, '220.00', '2019-01-11 12:30:00', '2019-01-11 21:00:00'),
(5, 5, 1, 2, '300.00', '2019-01-12 13:00:00', '2019-01-12 17:00:00'),
(6, 6, 1, 2, '300.00', '2019-01-15 10:00:00', '2019-01-15 18:00:00'),
(7, 7, 1, 2, '200.00', '2019-01-15 07:00:00', '2019-01-15 20:00:00'),
(8, 2, 3, 4, '220.00', '2019-01-16 08:00:00', '2019-01-17 10:00:00'),
(9, 4, 4, 3, '300.00', '2019-01-20 14:00:00', '2019-01-21 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
