-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 14, 2026 at 02:03 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livewire_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1781334141;', 1781334141),
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:1;', 1781334141);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `amount`, `invoice_file`, `created_at`, `updated_at`) VALUES
(6, '5455', '600', 'invoices/T6511EVOMudbIDdXxaGAajmQOJqonyCSRIu5ZHpl.pdf', '2026-06-12 07:13:27', '2026-06-12 07:13:27'),
(7, '3434', '500', 'invoices/bzSYdMBJSfDKcC7M5ZLKOEMyylh58qEXrdy9ydv9.pdf', '2026-06-12 21:20:55', '2026-06-12 21:20:55'),
(8, '4545', '565', 'invoices/fCJbqRb7LgxHiY9sGCxyu1Od0jDwA7qRuTnB37hF.pdf', '2026-06-12 21:25:46', '2026-06-12 21:25:46'),
(9, '888888', '8000', 'invoices/dIqTJy6Suo0L6rucjZBVx1zJofxWhIqYe4jmJpnu.pdf', '2026-06-12 22:04:53', '2026-06-12 22:04:53'),
(10, '333', '333', 'invoices/XdZpOugN17nJSJUA9tBJn365VdQr6A2GAvOfiPEQ.pdf', '2026-06-13 00:51:12', '2026-06-13 00:51:12'),
(11, '44', '55', 'invoices/No7Ualpo3fKyOM5AhUvHOC3aw5SlKYxG3UIFRtTb.pdf', '2026-06-13 00:52:55', '2026-06-13 00:52:55'),
(12, '44', '44', 'invoices/9ipvf9hFtYoY2rid8tSTHh8AtgJ1qsJrh00eDsnD.pdf', '2026-06-13 00:53:51', '2026-06-13 00:53:51'),
(13, '22', '22', 'invoices/ubwNScKh5TL0stZgobMFIzCywP1sYnhUwK2MpXW0.pdf', '2026-06-13 00:55:26', '2026-06-13 00:55:26'),
(14, '44', '44', 'invoices/7veZl7ZJRNBZAJJdy6xUwd0iE3DYgDtX0OTsiptp.pdf', '2026-06-13 00:58:23', '2026-06-13 00:58:23'),
(15, '33', '44', 'invoices/QXcyV5B8VsYWMJ9cTznu9UIaHz4KoD4t5tC9RTHl.pdf', '2026-06-13 01:00:14', '2026-06-13 01:00:14'),
(16, '33', '33', 'invoices/iJdPcStT5NmlEMUfoqBztsbSHppNKKP5BaqpZMtv.pdf', '2026-06-13 01:01:22', '2026-06-13 01:01:22');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_11_000543_create_registrations_table', 1),
(5, '2026_06_12_115412_create_invoices_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
CREATE TABLE IF NOT EXISTS `registrations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `name`, `email`, `password`, `image`, `created_at`, `updated_at`) VALUES
(7, 'Tomal', 'toamal@gmail.com', '1234567', 'register_images/MwFk53aiGFBQpDFfCGzDAQSNFYDsyRc35wuCJbz5.jpg', '2026-06-11 10:13:51', '2026-06-11 10:13:51'),
(6, 'wewew', 'parvazreza00@gmail.com', '123456', 'register_images/EDuWo9grg1UqRuLWxxAJNRdIoLEEMt4xAQ60ep2r.jpg', '2026-06-10 18:54:31', '2026-06-10 18:54:31'),
(5, 'fgdfdf', 'parvazreza00@gmail.com', '123456', 'register_images/KY3WQ7rf0CHn0f565M70esBkrtTdFhE4Wb4VpoPG.png', '2026-06-10 18:49:19', '2026-06-10 18:49:19'),
(8, 'Hasan ', 'hansa@gmail.com', '1234567', 'register_images/kGW4dKs2UmT6agxReUAqt4VanB7UosLioXaRi2oZ.jpg', '2026-06-11 10:15:09', '2026-06-11 10:15:09'),
(9, 'Tamim', 'tamim@gmail.com', '12345678', 'register_images/JuGmSK955b7smyKkJocmKS3xtOql8RRgLx3z0EoZ.jpg', '2026-06-11 10:19:26', '2026-06-11 10:19:26'),
(10, 'nayem', 'nayem@gmail.com', '1234567', 'register_images/BrAxqfZMfmo0Z1qRcxSIsorv1IcixxdSs0vE86DP.jpg', '2026-06-11 10:50:34', '2026-06-11 10:50:34'),
(11, 'dsds', 'parvazreza0011@gmail.com', '12345678', 'register_images/0JPdEJ77UWfOKXaFaRv8IiKUuW8R2Af6L6Jb8CYx.jpg', '2026-06-12 03:16:31', '2026-06-12 03:16:31'),
(12, 'Adib', 'adib@gmail.com', '123456789', 'register_images/XgcsAUFrImV826jIEl9cEkhdwkmarMCA07HLrEBr.jpg', '2026-06-12 03:20:13', '2026-06-12 03:20:13'),
(13, 'dsfsd', 'parvazreza00@gmail.com', 'ssfdsf', 'register_images/DPCCDLYBcpJaN5gC9TCm8pHitWuRDEDEPZLzs1jJ.png', '2026-06-12 03:20:28', '2026-06-12 03:20:28'),
(14, 'fdfd', 'dfdf@gmail.com', 'sfsdfsd', 'register_images/bT4hPg8u4bxVcKXSvBsCBhiFoS4p1ZkBgsXzABhK.jpg', '2026-06-12 03:23:35', '2026-06-12 03:23:35'),
(15, 'Anail', 'anil@gmail.com', 'anil1234', 'register_images/rV0j5CendTbHNTmYRnl1a7TuWTnnNbn7qkeaXXYc.jpg', '2026-06-12 03:25:57', '2026-06-12 03:25:57'),
(16, 'Abdullah', 'Abdullah@gmail.com', 'Abdullah', 'register_images/lYN6OdvAUkRY39T98XV1pdp4wHa4XYbhaXePSgbk.jpg', '2026-06-12 03:29:02', '2026-06-12 03:29:02'),
(17, 'fdsfsd', 'sdfsdfsd@gmail.com', 'ssdfsdfsd', 'register_images/SIKoqxSQrjcQ8OvXA95AvH9niGrRYakGFNKTqJHP.png', '2026-06-12 03:29:20', '2026-06-12 03:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('tj1l4Fcil1Ea3vqHWN6MOAEOraqgn097bMwL1XHS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'eyJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sIl90b2tlbiI6IldWZndncURJZklPd0ZuZFYwckJ6UWNtRkhuaFZqZDZNelJXYnhjMmciLCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2hvbWUiLCJyb3V0ZSI6ImhvbWUifX0=', 1781353635);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
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
