-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 15, 2023 at 01:20 PM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `training_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Men', NULL, NULL, ''),
(2, 'Women', NULL, NULL, ''),
(3, 'Sport', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

DROP TABLE IF EXISTS `categorys`;
CREATE TABLE IF NOT EXISTS `categorys` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Men', NULL, NULL),
(2, 'Women', NULL, NULL),
(3, 'Sport', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(15, '2019_08_19_000000_create_failed_jobs_table', 1),
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2023_05_13_152938_create_products_table', 2),
(21, '2023_05_13_154434_create_categorys_table', 2),
(22, '2023_05_13_154656_create_products_image_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorys_id` int NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `products_name`, `products_price`, `description`, `categorys_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Quần M', '122', 'This is quần M', 1, 'T-shirt-1.png', NULL, NULL),
(2, 'Polo-shirt-1', '111', 'This is Polo-shirt-1', 1, 'polo-shirt-2.png', NULL, NULL),
(3, 'Polo-shirt-2', '222', 'This is Polo-shirt-2', 1, 'polo-shirt-4.png', NULL, NULL),
(4, 'Polo-shirt-3', '333', 'This is Polo-shirt-3', 1, 'polo-shirt-5.png', NULL, NULL),
(5, 'Polo-shirt-5', '555', 'This is Polo-shirt-5', 1, 'polo-shirt-6.png', NULL, NULL),
(6, 'Polo-shirt-6', '765', 'This is Polo-shirt-6', 1, 't-shirt-1.png', NULL, NULL),
(7, 'T-shirt-1', '456', 'This is T-shirt-1', 1, 'Girl-1.png', NULL, NULL),
(8, 'Girl-1', '123', 'This is girl 1', 2, 'Girl-2.png', NULL, NULL),
(9, 'Girl-2', '723', 'This is girl-2', 2, 'Girl-4.png', NULL, NULL),
(10, 'Girl-3', '122', 'This is Girl-3', 2, 'Girl-4.png', NULL, NULL),
(11, 'Girl-4', '232', 'This is Girl-4', 2, 'Girl-5.png', NULL, NULL),
(12, 'Girl-5', '323', 'This is Girl-5', 2, 'Girl-6.png', NULL, NULL),
(13, 'Girl-7', '333', 'This is Girl-7', 2, 'Girl-7.png', NULL, NULL),
(14, 'Girl-6', '666', 'This is Girl-6', 2, 'Sport-1.png', NULL, NULL),
(15, 'Sport-1', '111', 'This is Sport-1', 3, 'Sport-2.png', NULL, NULL),
(16, 'Sport-2', '444', 'This is Sport-2', 3, 'Sport-3.png', NULL, NULL),
(17, 'Sport-3', '554', 'This is Sport-3', 3, 'Sport-3.png', NULL, NULL),
(18, 'Sport-4', '777', 'This is Sport-4', 3, 'Sport-5.png', NULL, NULL),
(19, 'Sport-5', '444', 'This is Sport-5', 3, 'Sport-4.png', NULL, NULL),
(20, 'Sport-6', '878', 'This is Sport-6', 3, 'Sport-5.png', NULL, NULL),
(21, 'Sport-7', '222', 'This is Sport-7', 3, 'Sport-7.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_image`
--

DROP TABLE IF EXISTS `products_image`;
CREATE TABLE IF NOT EXISTS `products_image` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `img_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_image`
--

INSERT INTO `products_image` (`id`, `img_name`, `products_id`, `created_at`, `updated_at`) VALUES
(1, 'T-shirt-1.png', 1, NULL, NULL),
(2, 'polo-shirt-2.png', 2, NULL, NULL),
(3, 'polo-shirt-4.png', 3, NULL, NULL),
(4, 'polo-shirt-5.png', 4, NULL, NULL),
(5, 'polo-shirt-6.png', 5, NULL, NULL),
(6, 't-shirt-1.png', 6, NULL, NULL),
(7, 'Girl-1.png', 8, NULL, NULL),
(8, 'Girl-2.png', 9, NULL, NULL),
(9, 'Girl-3.png', 10, NULL, NULL),
(10, 'Girl-4.png', 11, NULL, NULL),
(11, 'Girl-5.png', 12, NULL, NULL),
(12, 'Girl-6.png', 13, NULL, NULL),
(13, 'Girl-7.png', 14, NULL, NULL),
(14, 'Sport-1.png', 15, NULL, NULL),
(15, 'Sport-2.png', 16, NULL, NULL),
(16, 'Sport-3.png', 17, NULL, NULL),
(17, 'Sport-4.png', 18, NULL, NULL),
(18, 'Sport-5.png', 19, NULL, NULL),
(19, 'Sport-6.png', 20, NULL, NULL),
(20, 'Sport-7.png', 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `img_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `img_name`, `products_id`, `created_at`, `updated_at`) VALUES
(1, 'T-shirt-1.png', 1, NULL, NULL),
(2, 'polo-shirt-2.png', 2, NULL, NULL),
(3, 'polo-shirt-4.png', 3, NULL, NULL),
(4, 'polo-shirt-5.png', 4, NULL, NULL),
(5, 'polo-shirt-6.png', 5, NULL, NULL),
(6, 't-shirt-1.png', 6, NULL, NULL),
(7, 'Girl-1.png', 8, NULL, NULL),
(8, 'Girl-2.png', 9, NULL, NULL),
(9, 'Girl-3.png', 10, NULL, NULL),
(10, 'Girl-4.png', 11, NULL, NULL),
(11, 'Girl-5.png', 12, NULL, NULL),
(12, 'Girl-6.png', 13, NULL, NULL),
(13, 'Girl-7.png', 14, NULL, NULL),
(14, 'Sport-1.png', 15, NULL, NULL),
(15, 'Sport-2.png', 16, NULL, NULL),
(16, 'Sport-3.png', 17, NULL, NULL),
(17, 'Sport-4.png', 18, NULL, NULL),
(18, 'Sport-5.png', 19, NULL, NULL),
(19, 'Sport-6.png', 20, NULL, NULL),
(20, 'Sport-7.png', 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
