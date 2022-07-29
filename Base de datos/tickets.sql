-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2022 a las 20:02:05
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tickets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'updated', 'App\\Models\\Ticket', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"descripcion\":\"aasdasdasd3b\"},\"old\":{\"descripcion\":\"aasdasdasd3\"}}', '2021-01-11 23:11:02', '2021-01-11 23:11:02'),
(2, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"descripcion\":\"asdasdb\"},\"old\":{\"descripcion\":\"asdasd\"}}', '2021-01-11 23:11:36', '2021-01-11 23:11:36'),
(3, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"descripcion\":\"asdasdb3\"},\"old\":{\"descripcion\":\"asdasdb\"}}', '2021-01-11 23:12:16', '2021-01-11 23:12:16'),
(4, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"fecha_caducidad\":\"2020-12-26 17:35:00\"},\"old\":{\"fecha_caducidad\":\"2020-12-18 17:35:00\"}}', '2021-01-11 23:12:37', '2021-01-11 23:12:37'),
(5, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"fecha_caducidad\":\"2020-12-04 17:35:00\"},\"old\":{\"fecha_caducidad\":\"2020-12-26 17:35:00\"}}', '2021-01-11 23:15:21', '2021-01-11 23:15:21'),
(6, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"descripcion\":\"asdasdasd33\"},\"old\":{\"descripcion\":\"asdasdasd\"}}', '2021-01-11 23:58:51', '2021-01-11 23:58:51'),
(7, 'default', 'updated', 'App\\Models\\Ticket', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"descripcion\":\"asdasdasdasd44888\"},\"old\":{\"descripcion\":\"asdasdasdasd44\"}}', '2021-01-12 00:02:05', '2021-01-12 00:02:05'),
(8, 'default', 'updated', 'App\\Models\\Ticket', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"descripcion\":\"aasdasdasd\"},\"old\":{\"descripcion\":\"aasdasdasd3b\"}}', '2021-01-12 00:06:20', '2021-01-12 00:06:20'),
(9, 'default', 'updated', 'App\\Models\\Ticket', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"users_id\":15},\"old\":{\"users_id\":2}}', '2021-01-12 21:35:03', '2021-01-12 21:35:03'),
(10, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"users_id\":1},\"old\":{\"users_id\":2}}', '2021-01-12 22:05:35', '2021-01-12 22:05:35'),
(11, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"users_id\":1},\"old\":{\"users_id\":2}}', '2021-01-12 22:06:00', '2021-01-12 22:06:00'),
(12, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"active\"}}', '2021-01-13 00:26:31', '2021-01-13 00:26:31'),
(13, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-13 00:26:34', '2021-01-13 00:26:34'),
(14, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"En proceso\"}}', '2021-01-13 00:26:36', '2021-01-13 00:26:36'),
(15, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-01-13 00:41:29', '2021-01-13 00:41:29'),
(16, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-13 00:41:32', '2021-01-13 00:41:32'),
(17, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-01-13 00:41:34', '2021-01-13 00:41:34'),
(18, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"4444\"},\"old\":{\"status\":\"Activo\"}}', '2021-01-13 00:41:37', '2021-01-13 00:41:37'),
(19, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"4444\"}}', '2021-01-13 00:41:39', '2021-01-13 00:41:39'),
(20, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"En proceso\"}}', '2021-01-13 00:41:42', '2021-01-13 00:41:42'),
(21, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-13 00:41:43', '2021-01-13 00:41:43'),
(22, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"Activo\"}}', '2021-01-13 00:41:46', '2021-01-13 00:41:46'),
(23, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"En proceso\"}}', '2021-01-13 00:41:49', '2021-01-13 00:41:49'),
(24, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"active\"}}', '2021-01-13 00:42:18', '2021-01-13 00:42:18'),
(25, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"En proceso\"}}', '2021-01-13 00:44:48', '2021-01-13 00:44:48'),
(26, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"active\"}}', '2021-01-13 00:44:50', '2021-01-13 00:44:50'),
(27, 'default', 'updated', 'App\\Models\\Ticket', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"active\"}}', '2021-01-13 01:13:10', '2021-01-13 01:13:10'),
(28, 'default', 'updated', 'App\\Models\\Ticket', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"active\"}}', '2021-01-13 01:13:12', '2021-01-13 01:13:12'),
(29, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-01-13 01:13:14', '2021-01-13 01:13:14'),
(30, 'default', 'updated', 'App\\Models\\Ticket', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-01-13 01:13:16', '2021-01-13 01:13:16'),
(31, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-01-13 01:13:18', '2021-01-13 01:13:18'),
(32, 'default', 'created', 'App\\Models\\Ticket', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"p\\u00f1louououoi\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-15 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:02:36', '2021-01-13 23:02:36'),
(33, 'default', 'deleted', 'App\\Models\\Ticket', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"p\\u00f1louououoi\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-15 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:02:46', '2021-01-13 23:02:46'),
(34, 'default', 'created', 'App\\Models\\Ticket', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"asdsd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-15 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:03:35', '2021-01-13 23:03:35'),
(35, 'default', 'deleted', 'App\\Models\\Ticket', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"asdsd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-15 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:04:03', '2021-01-13 23:04:03'),
(36, 'default', 'created', 'App\\Models\\Ticket', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"asdasdasdas\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-15 15:30:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:04:17', '2021-01-13 23:04:17'),
(37, 'default', 'deleted', 'App\\Models\\Ticket', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"asdasdasdas\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-15 15:30:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:04:46', '2021-01-13 23:04:46'),
(38, 'default', 'created', 'App\\Models\\Ticket', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"sd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-16 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:05:02', '2021-01-13 23:05:02'),
(39, 'default', 'created', 'App\\Models\\Ticket', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000007\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"sd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-16 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:05:15', '2021-01-13 23:05:15'),
(40, 'default', 'created', 'App\\Models\\Ticket', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000008\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"sd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-16 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:05:35', '2021-01-13 23:05:35'),
(41, 'default', 'deleted', 'App\\Models\\Ticket', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000008\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"sd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-16 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:05:46', '2021-01-13 23:05:46'),
(42, 'default', 'deleted', 'App\\Models\\Ticket', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"sd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-16 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:05:49', '2021-01-13 23:05:49'),
(43, 'default', 'deleted', 'App\\Models\\Ticket', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"aasdasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-30 13:50:00\",\"status\":\"Realizado\",\"users_id\":1}}', '2021-01-13 23:05:51', '2021-01-13 23:05:51'),
(44, 'default', 'deleted', 'App\\Models\\Ticket', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000007\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"sd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-16 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:05:57', '2021-01-13 23:05:57'),
(45, 'default', 'created', 'App\\Models\\Ticket', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"adasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-14 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:07:40', '2021-01-13 23:07:40'),
(46, 'default', 'deleted', 'App\\Models\\Ticket', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"adasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-14 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:08:32', '2021-01-13 23:08:32'),
(47, 'default', 'created', 'App\\Models\\Ticket', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"asdasd\",\"descripcion\":\"dasdasdasdadasdsd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-14 15:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:08:46', '2021-01-13 23:08:46'),
(48, 'default', 'created', 'App\\Models\\Ticket', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"asdasdadasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-22 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:10:28', '2021-01-13 23:10:28'),
(49, 'default', 'deleted', 'App\\Models\\Ticket', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 33\",\"descripcion\":\"asdasdadasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-22 15:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:11:22', '2021-01-13 23:11:22'),
(50, 'default', 'deleted', 'App\\Models\\Ticket', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"asdasd\",\"descripcion\":\"dasdasdasdadasdsd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-14 15:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:11:25', '2021-01-13 23:11:25'),
(51, 'default', 'created', 'App\\Models\\Ticket', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"ticket 88 pruebas\",\"descripcion\":\"asdasdasdasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-14 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:12:01', '2021-01-13 23:12:01'),
(52, 'default', 'deleted', 'App\\Models\\Ticket', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"ticket 88 pruebas\",\"descripcion\":\"asdasdasdasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-14 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:12:37', '2021-01-13 23:12:37'),
(53, 'default', 'created', 'App\\Models\\Ticket', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"pruebas 99999\",\"descripcion\":\"asasdasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-12 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:12:50', '2021-01-13 23:12:50'),
(54, 'default', 'created', 'App\\Models\\Ticket', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"oiioyyui\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-14 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:14:39', '2021-01-13 23:14:39'),
(55, 'default', 'deleted', 'App\\Models\\Ticket', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"oiioyyui\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-14 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:14:53', '2021-01-13 23:14:53'),
(56, 'default', 'created', 'App\\Models\\Ticket', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"gggg\",\"descripcion\":\"sadasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-12 15:25:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:15:09', '2021-01-13 23:15:09'),
(57, 'default', 'deleted', 'App\\Models\\Ticket', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"gggg\",\"descripcion\":\"sadasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-12 15:25:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:16:28', '2021-01-13 23:16:28'),
(58, 'default', 'deleted', 'App\\Models\\Ticket', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"pruebas 99999\",\"descripcion\":\"asasdasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-12 15:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-13 23:16:31', '2021-01-13 23:16:31'),
(59, 'default', 'updated', 'App\\Models\\Ticket', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-13 23:16:34', '2021-01-13 23:16:34'),
(60, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-13 23:16:36', '2021-01-13 23:16:36'),
(61, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-13 23:16:38', '2021-01-13 23:16:38'),
(62, 'default', 'created', 'App\\Models\\Ticket', 22, 'App\\Models\\User', 22, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"ticket pruebas 36\",\"descripcion\":\"asdasdasd\",\"apertura\":\"Pedro Jose Avila Moreno\",\"fecha_caducidad\":\"2021-01-16 17:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-14 01:44:52', '2021-01-14 01:44:52'),
(63, 'default', 'deleted', 'App\\Models\\Ticket', 22, 'App\\Models\\User', 22, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"ticket pruebas 36\",\"descripcion\":\"asdasdasd\",\"apertura\":\"Pedro Jose Avila Moreno\",\"fecha_caducidad\":\"2021-01-16 17:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-14 02:35:08', '2021-01-14 02:35:08'),
(64, 'default', 'created', 'App\\Models\\Ticket', 23, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"pruebas20\",\"descripcion\":\"asdasdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 14:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:31:03', '2021-01-25 22:31:03'),
(65, 'default', 'created', 'App\\Models\\Ticket', 24, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"pruebas90\",\"descripcion\":\"\\u00e0sda<sdad\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 14:35:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:31:32', '2021-01-25 22:31:32'),
(66, 'default', 'created', 'App\\Models\\Ticket', 25, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000007\",\"titulo\":\"pppppppp\",\"descripcion\":\"asdasdd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 14:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:32:34', '2021-01-25 22:32:34'),
(67, 'default', 'created', 'App\\Models\\Ticket', 26, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000008\",\"titulo\":\"pppppppp3\",\"descripcion\":\"asdasdd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 14:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:35:37', '2021-01-25 22:35:37'),
(68, 'default', 'created', 'App\\Models\\Ticket', 27, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000009\",\"titulo\":\"asdasd3333\",\"descripcion\":\"asd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-31 14:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:36:49', '2021-01-25 22:36:49'),
(69, 'default', 'created', 'App\\Models\\Ticket', 28, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000010\",\"titulo\":\"asdasd3333\",\"descripcion\":\"asd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-31 14:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:37:12', '2021-01-25 22:37:12'),
(70, 'default', 'created', 'App\\Models\\Ticket', 29, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000011\",\"titulo\":\"asdasd333333333\",\"descripcion\":\"asd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-31 14:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:37:33', '2021-01-25 22:37:33'),
(71, 'default', 'created', 'App\\Models\\Ticket', 30, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"asdasdasdas\",\"descripcion\":\"asdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 14:30:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:39:26', '2021-01-25 22:39:26'),
(72, 'default', 'created', 'App\\Models\\Ticket', 31, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"asdasdasd\",\"descripcion\":\"asdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 14:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:39:57', '2021-01-25 22:39:57'),
(73, 'default', 'created', 'App\\Models\\Ticket', 32, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000007\",\"titulo\":\"asdasdasdasdasd\",\"descripcion\":\"asdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-31 14:50:00\",\"status\":\"active\",\"users_id\":2}}', '2021-01-25 22:40:34', '2021-01-25 22:40:34'),
(74, 'default', 'created', 'App\\Models\\Ticket', 33, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000008\",\"titulo\":\"asdasdasd3\",\"descripcion\":\"dd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-31 14:50:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:41:10', '2021-01-25 22:41:10'),
(75, 'default', 'created', 'App\\Models\\Ticket', 34, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000009\",\"titulo\":\"232134213123\",\"descripcion\":\"sdasdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-31 14:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:41:55', '2021-01-25 22:41:55'),
(76, 'default', 'created', 'App\\Models\\Ticket', 35, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000010\",\"titulo\":\"adasdasd\",\"descripcion\":\"sdasdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-29 14:50:00\",\"status\":\"active\",\"users_id\":19}}', '2021-01-25 22:42:51', '2021-01-25 22:42:51'),
(77, 'default', 'created', 'App\\Models\\Ticket', 36, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000004\",\"titulo\":\"ticket pruebas 3\",\"descripcion\":\"asdasdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 14:55:00\",\"status\":\"active\",\"users_id\":1}}', '2021-01-25 22:44:07', '2021-01-25 22:44:07'),
(78, 'default', 'updated', 'App\\Models\\Ticket', 36, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"active\"}}', '2021-01-25 22:59:54', '2021-01-25 22:59:54'),
(79, 'default', 'created', 'App\\Models\\Ticket', 37, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000005\",\"titulo\":\"Pruebas tickets43\",\"descripcion\":\"asdasdasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-30 14:50:00\",\"status\":\"active\",\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-27 22:57:56', '2021-01-27 22:57:56'),
(80, 'default', 'created', 'App\\Models\\Ticket', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000006\",\"titulo\":\"Pruebas tickets433\",\"descripcion\":\"asdasdasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-30 14:50:00\",\"status\":\"active\",\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-27 22:58:21', '2021-01-27 22:58:21'),
(81, 'default', 'updated', 'App\\Models\\Ticket', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 00:21:51', '2021-01-28 00:21:51'),
(82, 'default', 'created', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"codigo\":\"TK-00000007\",\"titulo\":\"Pruebas tickets45646\",\"descripcion\":\"asdasdasd\",\"apertura\":\"Pedro Avila\",\"fecha_caducidad\":\"2021-01-30 16:45:00\",\"status\":\"active\",\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-28 00:54:10', '2021-01-28 00:54:10'),
(83, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"1\\\":{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},\\\"3\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-28 01:32:21', '2021-01-28 01:32:21'),
(84, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"1\\\":{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},\\\"3\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"}}', '2021-01-28 01:37:58', '2021-01-28 01:37:58'),
(85, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"1\\\":{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},\\\"3\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-28 01:39:18', '2021-01-28 01:39:18'),
(86, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"3\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"1\\\":{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},\\\"3\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"}}', '2021-01-28 01:39:26', '2021-01-28 01:39:26'),
(87, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"3\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"}}', '2021-01-28 01:40:10', '2021-01-28 01:40:10'),
(88, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"2\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 01:40:27', '2021-01-28 01:40:27'),
(89, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"2\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"}}', '2021-01-28 01:40:35', '2021-01-28 01:40:35'),
(90, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 01:41:05', '2021-01-28 01:41:05'),
(91, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[]\"}}', '2021-01-28 01:41:16', '2021-01-28 01:41:16'),
(92, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[]\"}}', '2021-01-28 01:46:32', '2021-01-28 01:46:32'),
(93, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},\\\"2\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-28 01:53:02', '2021-01-28 01:53:02'),
(94, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[]\"}}', '2021-01-28 02:01:49', '2021-01-28 02:01:49'),
(95, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 02:02:53', '2021-01-28 02:02:53'),
(96, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[]\"}}', '2021-01-28 02:06:46', '2021-01-28 02:06:46'),
(97, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-28 02:08:18', '2021-01-28 02:08:18'),
(98, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":12,\\\"name\\\":\\\"admin\\\",\\\"email\\\":\\\"admin@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[]\"}}', '2021-01-28 02:08:28', '2021-01-28 02:08:28'),
(99, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":12,\\\"name\\\":\\\"admin\\\",\\\"email\\\":\\\"admin@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":12,\\\"name\\\":\\\"admin\\\",\\\"email\\\":\\\"admin@gmail.com\\\"}]\"}}', '2021-01-28 02:08:38', '2021-01-28 02:08:38'),
(100, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[]\"}}', '2021-01-28 02:09:12', '2021-01-28 02:09:12'),
(101, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 02:09:20', '2021-01-28 02:09:20'),
(102, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[]\"}}', '2021-01-28 02:14:38', '2021-01-28 02:14:38'),
(103, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"}}', '2021-01-28 02:22:42', '2021-01-28 02:22:42'),
(104, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"}}', '2021-01-28 02:23:12', '2021-01-28 02:23:12'),
(105, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":null}}', '2021-01-28 19:01:33', '2021-01-28 19:01:33'),
(106, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}]\"}}', '2021-01-28 19:02:00', '2021-01-28 19:02:00'),
(107, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 19:04:20', '2021-01-28 19:04:20'),
(108, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"{\\\"1\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 19:05:12', '2021-01-28 19:05:12'),
(109, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 19:07:01', '2021-01-28 19:07:01'),
(110, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 19:07:24', '2021-01-28 19:07:24'),
(111, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"2\\\":{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 19:09:53', '2021-01-28 19:09:53'),
(112, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},\\\"1\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"3\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}}\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 19:11:22', '2021-01-28 19:11:22'),
(113, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"{\\\"0\\\":{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},\\\"1\\\":{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},\\\"3\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}}\"}}', '2021-01-28 20:09:43', '2021-01-28 20:09:43'),
(114, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":15,\\\"name\\\":\\\"Pedro Avila2\\\",\\\"email\\\":\\\"pedrojam1433@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"}}', '2021-01-28 20:10:07', '2021-01-28 20:10:07'),
(115, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"}}', '2021-01-28 20:10:08', '2021-01-28 20:10:08'),
(116, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"}}', '2021-01-28 20:10:09', '2021-01-28 20:10:09'),
(117, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"},{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"}}', '2021-01-28 20:10:19', '2021-01-28 20:10:19'),
(118, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"},{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}]\"}}', '2021-01-28 20:10:27', '2021-01-28 20:10:27'),
(119, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}]\"}}', '2021-01-28 20:10:37', '2021-01-28 20:10:37'),
(120, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"}}', '2021-01-28 20:10:49', '2021-01-28 20:10:49'),
(121, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-28 20:11:00', '2021-01-28 20:11:00'),
(122, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-28 20:11:02', '2021-01-28 20:11:02'),
(123, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-28 20:19:13', '2021-01-28 20:19:13'),
(124, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 20:19:21', '2021-01-28 20:19:21'),
(125, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-28 20:20:46', '2021-01-28 20:20:46'),
(126, 'default', 'updated', 'App\\Models\\Ticket', 2, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"}}', '2021-01-28 20:21:05', '2021-01-28 20:21:05'),
(127, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"}}', '2021-01-28 21:19:14', '2021-01-28 21:19:14'),
(128, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"},{\\\"id\\\":11,\\\"name\\\":\\\"Antonio\\\",\\\"email\\\":\\\"antonio@gmail.com\\\"}]\"}}', '2021-01-28 21:19:21', '2021-01-28 21:19:21'),
(129, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"}}', '2021-01-29 00:10:00', '2021-01-29 00:10:00'),
(130, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"}}', '2021-01-29 00:10:01', '2021-01-29 00:10:01');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(131, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[]\"}}', '2021-01-29 00:10:49', '2021-01-29 00:10:49'),
(132, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-29 01:40:06', '2021-01-29 01:40:06'),
(133, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"}}', '2021-01-29 01:46:35', '2021-01-29 01:46:35'),
(134, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-29 19:25:25', '2021-01-29 19:25:25'),
(135, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"}}', '2021-01-29 19:32:45', '2021-01-29 19:32:45'),
(136, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"}}', '2021-01-29 19:34:43', '2021-01-29 19:34:43'),
(137, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"}}', '2021-01-29 19:34:52', '2021-01-29 19:34:52'),
(138, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-29 20:20:43', '2021-01-29 20:20:43'),
(139, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}]\"}}', '2021-01-29 20:21:28', '2021-01-29 20:21:28'),
(140, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}]\"}}', '2021-01-29 20:21:29', '2021-01-29 20:21:29'),
(141, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"}]\"}}', '2021-01-29 20:21:36', '2021-01-29 20:21:36'),
(142, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":null}}', '2021-01-29 20:31:08', '2021-01-29 20:31:08'),
(143, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"}]\"}}', '2021-01-29 20:31:11', '2021-01-29 20:31:11'),
(144, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":2,\\\"name\\\":\\\"prueba\\\",\\\"email\\\":\\\"prueba@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-29 20:32:00', '2021-01-29 20:32:00'),
(145, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-29 20:32:00', '2021-01-29 20:32:00'),
(146, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"}}', '2021-01-29 20:32:17', '2021-01-29 20:32:17'),
(147, 'default', 'created', 'App\\Models\\Ticket', 40, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000008\",\"titulo\":\"pruebastickets2555\",\"descripcion\":\"asdasdasdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 15:55:00\",\"status\":\"active\",\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-29 23:04:46', '2021-01-29 23:04:46'),
(148, 'default', 'created', 'App\\Models\\Ticket', 41, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000009\",\"titulo\":\"pruebastickets2555\",\"descripcion\":\"asdasdasdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 15:55:00\",\"status\":\"active\",\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-29 23:04:52', '2021-01-29 23:04:52'),
(149, 'default', 'created', 'App\\Models\\Ticket', 42, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000010\",\"titulo\":\"pruebastickets2555\",\"descripcion\":\"asdasdasdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 15:55:00\",\"status\":\"active\",\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-29 23:05:02', '2021-01-29 23:05:02'),
(150, 'default', 'updated', 'App\\Models\\Ticket', 42, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-29 23:05:24', '2021-01-29 23:05:24'),
(151, 'default', 'updated', 'App\\Models\\Ticket', 41, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"active\"}}', '2021-01-29 23:42:17', '2021-01-29 23:42:17'),
(152, 'default', 'updated', 'App\\Models\\Ticket', 42, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"active\"}}', '2021-01-29 23:42:19', '2021-01-29 23:42:19'),
(153, 'default', 'updated', 'App\\Models\\Ticket', 40, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"active\"}}', '2021-01-29 23:42:21', '2021-01-29 23:42:21'),
(154, 'default', 'updated', 'App\\Models\\Ticket', 39, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"active\"}}', '2021-01-29 23:51:45', '2021-01-29 23:51:45'),
(155, 'default', 'updated', 'App\\Models\\Ticket', 38, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"active\"}}', '2021-01-29 23:51:46', '2021-01-29 23:51:46'),
(156, 'default', 'updated', 'App\\Models\\Ticket', 37, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"active\"}}', '2021-01-29 23:51:47', '2021-01-29 23:51:47'),
(157, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-01-29 23:55:11', '2021-01-29 23:55:11'),
(158, 'default', 'updated', 'App\\Models\\Ticket', 1, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-29 23:55:14', '2021-01-29 23:55:14'),
(159, 'default', 'updated', 'App\\Models\\Ticket', 36, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-29 23:57:37', '2021-01-29 23:57:37'),
(160, 'default', 'created', 'App\\Models\\Ticket', 43, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000011\",\"titulo\":\"probandoultimoticket\",\"descripcion\":\"asdasdasdasdasdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 15:55:00\",\"status\":\"Activo\",\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"}]\"}}', '2021-01-30 00:00:37', '2021-01-30 00:00:37'),
(161, 'default', 'updated', 'App\\Models\\Ticket', 43, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"}]\"}}', '2021-01-30 00:00:55', '2021-01-30 00:00:55'),
(162, 'default', 'updated', 'App\\Models\\Ticket', 43, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"}]\"}}', '2021-01-30 00:05:54', '2021-01-30 00:05:54'),
(163, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":null}}', '2021-01-30 00:06:52', '2021-01-30 00:06:52'),
(164, 'default', 'updated', 'App\\Models\\Ticket', 43, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"}}', '2021-01-30 00:07:22', '2021-01-30 00:07:22'),
(165, 'default', 'updated', 'App\\Models\\Ticket', 43, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"}]\"}}', '2021-01-30 00:07:26', '2021-01-30 00:07:26'),
(166, 'default', 'updated', 'App\\Models\\Ticket', 43, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":22,\\\"name\\\":\\\"Pedro Jose Avila Moreno\\\",\\\"email\\\":\\\"pedrojam14@gmail.com\\\"},{\\\"id\\\":9,\\\"name\\\":\\\"pruebas\\\",\\\"email\\\":\\\"pruebas@gmail.com\\\"},{\\\"id\\\":21,\\\"name\\\":\\\"pruebas25\\\",\\\"email\\\":\\\"pruebas25@gmail.com\\\"}]\"}}', '2021-01-30 00:07:28', '2021-01-30 00:07:28'),
(167, 'default', 'created', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 12, '{\"attributes\":{\"codigo\":\"TK-00000012\",\"titulo\":\"probandotickets23455\",\"descripcion\":\"asdasd\",\"apertura\":\"admin\",\"fecha_caducidad\":\"2021-01-30 16:35:00\",\"status\":\"Activo\",\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}]\"}}', '2021-01-30 00:07:50', '2021-01-30 00:07:50'),
(168, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"}]\"}}', '2021-01-30 00:08:05', '2021-01-30 00:08:05'),
(169, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"}]\"}}', '2021-01-31 01:39:10', '2021-01-31 01:39:10'),
(170, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 12, '{\"attributes\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"},\"old\":{\"users_asigne_json\":\"[{\\\"id\\\":1,\\\"name\\\":\\\"Pedro Avila\\\",\\\"email\\\":\\\"pedrojosavila@gmail.com\\\"},{\\\"id\\\":23,\\\"name\\\":\\\"pedro jos\\\\u00e8\\\",\\\"email\\\":\\\"eldiamantepedro@hotmail.com\\\"},{\\\"id\\\":19,\\\"name\\\":\\\"pruebas7\\\",\\\"email\\\":\\\"pruebas7@gmail.com\\\"}]\"}}', '2021-01-31 01:39:15', '2021-01-31 01:39:15'),
(171, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-01-31 01:44:48', '2021-01-31 01:44:48'),
(172, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-01-31 01:44:59', '2021-01-31 01:44:59'),
(173, 'default', 'updated', 'App\\Models\\Ticket', 36, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Activo\"}}', '2021-01-31 01:45:02', '2021-01-31 01:45:02'),
(174, 'default', 'updated', 'App\\Models\\Ticket', 37, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Activo\"}}', '2021-01-31 01:45:05', '2021-01-31 01:45:05'),
(175, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Activo\"}}', '2021-02-01 18:24:26', '2021-02-01 18:24:26'),
(176, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-02-03 04:16:26', '2021-02-03 04:16:26'),
(177, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-02-03 04:16:27', '2021-02-03 04:16:27'),
(178, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"Activo\"}}', '2021-02-03 04:16:29', '2021-02-03 04:16:29'),
(179, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"En proceso\"}}', '2021-02-03 04:16:30', '2021-02-03 04:16:30'),
(180, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"Activo\"}}', '2021-02-03 04:16:32', '2021-02-03 04:16:32'),
(181, 'default', 'updated', 'App\\Models\\Ticket', 44, 'App\\Models\\User', 27, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"En proceso\"}}', '2021-02-03 04:36:55', '2021-02-03 04:36:55'),
(182, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-02-03 21:55:35', '2021-02-03 21:55:35'),
(183, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Activo\"}}', '2021-02-03 21:55:42', '2021-02-03 21:55:42'),
(184, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-02-03 21:58:24', '2021-02-03 21:58:24'),
(185, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"Inactivo\"}}', '2021-02-03 21:58:44', '2021-02-03 21:58:44'),
(186, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-02-03 21:59:05', '2021-02-03 21:59:05'),
(187, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"Activo\"}}', '2021-02-03 21:59:08', '2021-02-03 21:59:08'),
(188, 'default', 'updated', 'App\\Models\\Ticket', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"En proceso\"}}', '2021-02-03 21:59:10', '2021-02-03 21:59:10'),
(189, 'default', 'created', 'App\\Models\\Ticket', 45, 'App\\Models\\User', 2, '{\"attributes\":{\"codigo\":\"TK-00000013\",\"titulo\":\"prea\",\"descripcion\":null,\"apertura\":\"prueba\",\"fecha_caducidad\":\"2021-03-06 16:50:00\",\"status\":\"Activo\",\"apertura_id\":2}}', '2021-02-04 00:38:07', '2021-02-04 00:38:07'),
(190, 'default', 'updated', 'App\\Models\\Ticket', 41, 'App\\Models\\User', 22, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"Activo\"}}', '2021-02-04 05:34:22', '2021-02-04 05:34:22'),
(191, 'default', 'updated', 'App\\Models\\Ticket', 41, 'App\\Models\\User', 22, '{\"attributes\":{\"status\":\"Realizado\"},\"old\":{\"status\":\"En proceso\"}}', '2021-02-04 05:34:25', '2021-02-04 05:34:25'),
(192, 'default', 'updated', 'App\\Models\\Ticket', 41, 'App\\Models\\User', 22, '{\"attributes\":{\"status\":\"Activo\"},\"old\":{\"status\":\"Realizado\"}}', '2021-02-04 05:34:27', '2021-02-04 05:34:27'),
(193, 'default', 'updated', 'App\\Models\\Ticket', 41, 'App\\Models\\User', 22, '{\"attributes\":{\"status\":\"En proceso\"},\"old\":{\"status\":\"Activo\"}}', '2021-02-04 05:34:31', '2021-02-04 05:34:31'),
(194, 'default', 'updated', 'App\\Models\\Ticket', 45, 'App\\Models\\User', 2, '{\"attributes\":{\"status\":\"Inactivo\"},\"old\":{\"status\":\"Activo\"}}', '2021-02-05 05:53:00', '2021-02-05 05:53:00'),
(195, 'default', 'created', 'App\\Models\\Ticket', 46, 'App\\Models\\User', 9, '{\"attributes\":{\"codigo\":\"TK-00000014\",\"titulo\":\"prea\",\"descripcion\":null,\"apertura\":\"pruebas\",\"fecha_caducidad\":\"2021-02-27 21:55:00\",\"status\":\"Activo\",\"apertura_id\":9}}', '2021-02-05 05:54:03', '2021-02-05 05:54:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buttons`
--

CREATE TABLE `buttons` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `class` varchar(100) NOT NULL,
  `url_to` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `buttons`
--

INSERT INTO `buttons` (`id`, `nombre`, `icon`, `class`, `url_to`, `created_at`, `updated_at`) VALUES
(1, NULL, '<i class=\"far fa-address-card\"></i>', 'btn btn-primary', 'index', '2021-02-01 16:03:52', '2021-02-01 16:03:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_caducidad` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `fecha_caducidad`, `created_at`, `updated_at`) VALUES
(2, 'editar1', NULL, '2020-11-27 14:30:21', '2020-11-27 14:30:21'),
(3, 'Creartickets', NULL, '2020-11-27 14:30:30', '2020-11-27 14:30:30'),
(4, 'general', NULL, '2020-11-27 14:30:33', '2020-11-27 14:30:33'),
(5, 'general2', NULL, '2020-11-27 14:30:35', '2020-11-27 14:30:35'),
(6, 'editores', '2020-12-15 17:55:00', '2020-11-27 19:56:37', '2020-12-15 21:26:08'),
(7, 'Creacion de usuario', '2020-12-24 16:55:00', '2020-12-15 14:38:03', '2020-12-16 20:13:08'),
(8, 'crearotros', '2020-12-15 17:26:00', '2020-12-15 21:26:17', '2020-12-15 21:26:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_has_tickets`
--

CREATE TABLE `categorias_has_tickets` (
  `categoria_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias_has_tickets`
--

INSERT INTO `categorias_has_tickets` (`categoria_id`, `ticket_id`) VALUES
(2, 1),
(2, 2),
(2, 6),
(2, 7),
(2, 24),
(2, 31),
(2, 34),
(2, 36),
(2, 44),
(2, 45),
(2, 46),
(3, 1),
(3, 2),
(3, 7),
(3, 23),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 32),
(3, 33),
(3, 35),
(3, 36),
(3, 43),
(4, 6),
(4, 30),
(5, 1),
(6, 37),
(6, 38),
(6, 39),
(6, 40),
(6, 41),
(6, 42);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_has_users`
--

CREATE TABLE `categorias_has_users` (
  `categoria_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias_has_users`
--

INSERT INTO `categorias_has_users` (`categoria_id`, `user_id`) VALUES
(2, 2),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 21),
(2, 22),
(2, 23),
(2, 26),
(3, 2),
(3, 9),
(3, 12),
(3, 19),
(3, 21),
(4, 9),
(4, 11),
(4, 15),
(4, 19),
(4, 21),
(4, 22),
(4, 25),
(5, 15),
(5, 21),
(6, 15),
(6, 22),
(8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cron_job_mails`
--

CREATE TABLE `cron_job_mails` (
  `id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `ticket_codigo` varchar(100) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `to_email` text NOT NULL,
  `to_name` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cron_job_mails`
--

INSERT INTO `cron_job_mails` (`id`, `mensaje`, `ticket_codigo`, `from_email`, `from_name`, `to_email`, `to_name`, `created_at`, `updated_at`) VALUES
(12, '<p>asdasd</p>', 'TK-00000002', 'admin@gmail.com', 'admin', 'pedrojam14@gmail.com', 'Pedro Jose Avila Moreno', '2021-01-29 19:00:05', '2021-01-29 19:00:05'),
(13, 'pruebastickets2555', 'TK-00000010', 'admin@gmail.com', 'admin', 'pedrojam14@gmail.com', 'Pedro Jose Avila Moreno', '2021-01-29 19:05:02', '2021-01-29 19:05:02'),
(14, 'pruebastickets2555', 'TK-00000010', 'admin@gmail.com', 'admin', 'eldiamantepedro@hotmail.com', 'pedro josè', '2021-01-29 19:05:02', '2021-01-29 19:05:02'),
(15, 'pruebastickets2555', 'TK-00000010', 'admin@gmail.com', 'admin', 'pruebas25@gmail.com', 'pruebas25', '2021-01-29 19:05:02', '2021-01-29 19:05:02'),
(16, 'probandoultimoticket', 'TK-00000011', 'admin@gmail.com', 'admin', 'pruebas25@gmail.com', 'pruebas25', '2021-01-29 20:00:37', '2021-01-29 20:00:37'),
(17, 'probandoultimoticket', 'TK-00000011', 'admin@gmail.com', 'admin', 'pedrojam14@gmail.com', 'Pedro Jose Avila Moreno', '2021-01-29 20:00:37', '2021-01-29 20:00:37'),
(18, 'probandoultimoticket', 'TK-00000011', 'admin@gmail.com', 'admin', 'eldiamantepedro@hotmail.com', 'pedro josè', '2021-01-29 20:00:37', '2021-01-29 20:00:37'),
(19, 'probandotickets23455', 'TK-00000012', 'admin@gmail.com', 'admin', 'pedrojosavila@gmail.com', 'Pedro Avila', '2021-01-29 20:07:50', '2021-01-29 20:07:50'),
(20, '<p>hola mundoo como estan ?&nbsp;</p>', 'TK-00000012', 'admin@gmail.com', 'admin', 'pedrojosavila@gmail.com', 'Pedro Avila', '2021-01-29 20:08:18', '2021-01-29 20:08:18'),
(21, '<p>hola mundoo como estan ?&nbsp;</p>', 'TK-00000012', 'admin@gmail.com', 'admin', 'eldiamantepedro@hotmail.com', 'pedro josè', '2021-01-29 20:08:18', '2021-01-29 20:08:18'),
(22, '<p>Hola mundo una prueba de email</p>', 'TK-00000012', 'admin@gmail.com', 'admin', 'pedrojosavila@gmail.com', 'Pedro Avila', '2021-01-30 21:39:34', '2021-01-30 21:39:34'),
(23, '<p>Hola mundo una prueba de email</p>', 'TK-00000012', 'admin@gmail.com', 'admin', 'pruebas7@gmail.com', 'pruebas7', '2021-01-30 21:39:34', '2021-01-30 21:39:34'),
(24, 'prea', 'TK-00000013', 'prueba@gmail.com', 'prueba', 'pruebas25@gmail.com', 'pruebas25', '2021-02-03 20:38:07', '2021-02-03 20:38:07'),
(25, '<p>asdasd</p><p>&nbsp;</p>', 'TK-00000013', 'prueba@gmail.com', 'prueba', 'pruebas25@gmail.com', 'pruebas25', '2021-02-03 20:38:25', '2021-02-03 20:38:25'),
(26, 'prea', 'TK-00000014', 'pruebas@gmail.com', 'pruebas', 'pedrojam14@gmail.com', 'Pedro Jose Avila Moreno', '2021-02-05 01:54:03', '2021-02-05 01:54:03'),
(27, '<p>easdad</p>', 'TK-00000014', 'pruebas@gmail.com', 'pruebas', 'pedrojam14@gmail.com', 'Pedro Jose Avila Moreno', '2021-02-05 01:54:20', '2021-02-05 01:54:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `ruc` int(11) NOT NULL,
  `rsocial` varchar(200) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `color` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `name`, `surname`, `ruc`, `rsocial`, `logo`, `color`, `created_at`, `updated_at`) VALUES
(1, 'test2', 'test apellido', 123123, 'asda', 'GbXJ8afm8PtSbnKJwThRJFYsJvCpFdVrMYBMPpkl.jpg', 'red', '2022-07-25 16:45:52', '2022-07-27 15:26:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `color` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `nombre`, `color`, `created_at`, `updated_at`) VALUES
(3, 'Inactivo', '#ff8000', '2021-01-12 19:44:26', '2021-01-12 20:32:31'),
(4, 'En proceso', NULL, '2021-01-12 19:44:29', '2021-01-12 19:44:29'),
(5, 'Realizado', '#9cd12e', '2021-01-12 19:44:38', '2021-01-12 20:42:07'),
(6, '4444', NULL, '2021-01-12 20:30:02', '2021-01-12 20:30:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `file_src` text DEFAULT NULL,
  `img_src` text DEFAULT NULL,
  `ticket_id` int(11) NOT NULL,
  `notice_message` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `from_id`, `mensaje`, `file_src`, `img_src`, `ticket_id`, `notice_message`, `created_at`, `updated_at`) VALUES
(24, 1, 'Se ha actualizado el ticket, actualizacion: ', NULL, NULL, 1, 1, '2021-01-11 19:09:28', '2021-01-11 19:09:28'),
(25, 1, 'Se ha actualizado el ticket, actualizacion: ', NULL, NULL, 1, 1, '2021-01-11 19:09:36', '2021-01-11 19:09:36'),
(26, 1, 'Se ha actualizado el ticket, actualizacion: ', NULL, NULL, 1, 1, '2021-01-11 19:09:53', '2021-01-11 19:09:53'),
(28, 1, 'Se ha actualizado el ticket, actualizacion: ', NULL, NULL, 1, 1, '2021-01-11 19:10:42', '2021-01-11 19:10:42'),
(31, 1, 'Se ha actualizado el ticket, actualizacion: <b>descripcion</b> |', NULL, NULL, 1, 1, '2021-01-11 19:11:54', '2021-01-11 19:11:54'),
(32, 1, 'Se ha actualizado el ticket, actualizacion: <b>descripcion</b> |', NULL, NULL, 1, 1, '2021-01-11 19:12:06', '2021-01-11 19:12:06'),
(33, 1, 'Se ha actualizado el ticket, actualizacion: <b>descripcion</b> |', NULL, NULL, 1, 1, '2021-01-11 19:12:16', '2021-01-11 19:12:16'),
(34, 1, 'Se ha actualizado el ticket, actualizacion: <b>descripcion</b> |', NULL, NULL, 1, 1, '2021-01-11 19:12:37', '2021-01-11 19:12:37'),
(35, 1, 'Se ha actualizado el ticket, actualizacion: <b>Fecha de caducidad</b> |', NULL, NULL, 1, 1, '2021-01-11 19:15:21', '2021-01-11 19:15:21'),
(39, 1, 'Se ha actualizado el ticket, actualizacion: <b>descripcion</b> |', NULL, NULL, 6, 1, '2021-01-11 19:58:51', '2021-01-11 19:58:51'),
(40, 1, 'Se ha actualizado el ticket, actualizacion: <b> Categorias </b> | ', NULL, NULL, 7, 1, '2021-01-11 20:01:49', '2021-01-11 20:01:49'),
(41, 1, 'Se ha actualizado el ticket, actualizacion: <b> Categorias </b> | <b>descripcion</b> |', NULL, NULL, 7, 1, '2021-01-11 20:02:05', '2021-01-11 20:02:05'),
(44, 1, 'Se ha actualizado el ticket, actualizacion: <b>Usuario asignado</b> |', NULL, NULL, 7, 1, '2021-01-12 17:35:03', '2021-01-12 17:35:03'),
(45, 1, 'Se ha actualizado el ticket, actualizacion: <b>Usuario asignado</b> |', NULL, NULL, 1, 1, '2021-01-12 18:05:35', '2021-01-12 18:05:35'),
(46, 1, 'Se ha actualizado el ticket, actualizacion: <b>Usuario asignado</b> |', NULL, NULL, 6, 1, '2021-01-12 18:06:00', '2021-01-12 18:06:00'),
(47, 1, '<p>pl</p>', NULL, NULL, 7, NULL, '2021-01-12 21:20:07', '2021-01-12 21:20:07'),
(48, 12, '<p>pruebas</p>', NULL, NULL, 7, NULL, '2021-01-14 19:29:34', '2021-01-14 19:29:34'),
(49, 12, '<p>fffffff</p>', NULL, NULL, 7, NULL, '2021-01-14 19:31:31', '2021-01-14 19:31:31'),
(50, 12, '<p>probando&nbsp;</p>', NULL, NULL, 7, NULL, '2021-01-14 19:56:20', '2021-01-14 19:56:20'),
(51, 12, '<p>pruebasss</p>', NULL, NULL, 7, NULL, '2021-01-14 20:05:39', '2021-01-14 20:05:39'),
(52, 12, '<p><strong>pruebas5555</strong></p>', NULL, NULL, 7, NULL, '2021-01-14 20:11:49', '2021-01-14 20:11:49'),
(53, 12, 'Se ha actualizado el ticket, actualizacion: <b> Categorias </b> | ', NULL, NULL, 1, 1, '2021-01-29 16:35:35', '2021-01-29 16:35:35'),
(54, 12, '<p>asdasd</p>', NULL, NULL, 2, NULL, '2021-01-29 19:00:05', '2021-01-29 19:00:05'),
(55, 12, '<p>hola mundoo como estan ?&nbsp;</p>', NULL, 'c3T6q1ZVFXKrCR0dMPgKlq5HQFer0sg8XIh2IuTZ.png', 44, NULL, '2021-01-29 20:08:18', '2021-01-29 20:08:18'),
(56, 12, '<p>Hola mundo una prueba de email</p>', NULL, NULL, 44, NULL, '2021-01-30 21:39:34', '2021-01-30 21:39:34'),
(57, 2, '<p>asdasd</p><p>&nbsp;</p>', NULL, NULL, 45, NULL, '2021-02-03 20:38:25', '2021-02-03 20:38:25'),
(58, 9, '<p>easdad</p>', NULL, NULL, 46, NULL, '2021-02-05 01:54:20', '2021-02-05 01:54:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_29_124002_create_permission_tables', 2),
(5, '2021_01_11_161749_create_activity_log_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 10),
(1, 'App\\Models\\User', 11),
(1, 'App\\Models\\User', 12),
(1, 'App\\Models\\User', 15),
(1, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 26),
(5, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 25),
(6, 'App\\Models\\User', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 12),
(1, 'App\\Models\\User', 15),
(1, 'App\\Models\\User', 21),
(1, 'App\\Models\\User', 22),
(1, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'edit1333', 'web', '2020-10-30 04:00:00', '2021-02-01 22:48:10'),
(2, 'created2', 'web', '2020-10-30 04:00:00', '2020-11-02 20:40:22'),
(4, 'visualizar', 'web', '2020-10-31 22:35:53', '2020-10-31 22:35:53'),
(5, 'desplazar', 'web', '2020-10-31 22:35:59', '2020-10-31 22:35:59'),
(6, 'sistemas', 'web', '2020-11-26 23:26:44', '2020-11-26 23:26:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `number` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reports`
--

INSERT INTO `reports` (`id`, `number`, `code`, `empresa_id`, `created_at`, `updated_at`) VALUES
(15, '1', 'rp-1', 1, '2022-07-28 16:44:18', '2022-07-28 16:44:18'),
(17, '2', 'rp-2', 1, '2022-07-28 18:45:27', '2022-07-28 18:45:27'),
(18, '3', 'rp-3', 1, '2022-07-28 18:45:53', '2022-07-28 18:45:53'),
(22, '4', 'rp-4', 1, '2022-07-29 14:59:25', '2022-07-29 14:59:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `report_lines`
--

CREATE TABLE `report_lines` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `page_type` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `files` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `report_lines`
--

INSERT INTO `report_lines` (`id`, `title`, `description`, `page_type`, `report_id`, `files`, `created_at`, `updated_at`) VALUES
(1, 'test', '<p>asdasd</p>', 1, 15, '[\"TXWiMj8YyPrhrW1fZ20BwzrntdoHQlAtmtwu8QRy.jpg\",\"JnTT70P4ebtu8T5HZBL2no7UmBdQFnTDhSOpgfj1.jpg\",\"fUM0yQ1ag9hgWb5IedmwXs8HKhRo3HyEy5mIUAAT.jpg\"]', '2022-07-28 16:44:18', '2022-07-28 18:43:50'),
(3, 'test', '<p>asdasd</p>', 1, 17, '[\"et3rLGceMw6Yrc8ZT5WyqU3oT4boLO0nHhlnn3Rc.jpg\"]', '2022-07-28 18:45:27', '2022-07-28 18:45:27'),
(4, '123123', '<p>asdasasdasd</p>', 1, 18, '[\"x7PlrKRhrby3XYvnp0VvuYp7pnDzKRrqwNPs6YQE.jpg\",\"espq9zp8E4tTdrUdqPJQiWVX5KCpV2cDBy3q79uS.jpg\"]', '2022-07-28 18:45:53', '2022-07-28 18:46:46'),
(8, 'test title', '<p>asdasdasd</p>', 1, 22, '[\"ebCpyIlDd5xmEHMB9wuLQAkz2R73mtRDSzOqg7iZ.jpg\",\"PGdhCzajCrgjs3EElVKiBAGhHenBcE42ibgsk4H4.jpg\"]', '2022-07-29 14:59:25', '2022-07-29 15:30:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repository_files`
--

CREATE TABLE `repository_files` (
  `id` int(11) NOT NULL,
  `type_file` varchar(100) NOT NULL,
  `src_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrador', 'web', '2020-10-30 04:00:00', '2021-02-03 19:22:03'),
(2, 'usuario', 'web', '2020-10-30 04:00:00', '2021-02-03 19:22:10'),
(3, 'tecnico', 'web', '2020-11-02 19:47:00', '2021-02-03 19:22:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `codigo` varchar(150) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `apertura` varchar(100) NOT NULL,
  `apertura_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `users_asigne_json` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `status_color` varchar(150) DEFAULT NULL,
  `fecha_caducidad` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `codigo`, `titulo`, `descripcion`, `apertura`, `apertura_id`, `users_id`, `users_asigne_json`, `status`, `status_color`, `fecha_caducidad`, `created_at`, `updated_at`) VALUES
(1, 'TK-00000001', 'Pruebas tickets', 'asdasdb3', 'Pedro Avila', 22, 1, '[{\"id\":21,\"name\":\"pruebas25\",\"email\":\"pruebas25@gmail.com\"},{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"},{\"id\":23,\"name\":\"pedro jos\\u00e8\",\"email\":\"eldiamantepedro@hotmail.com\"}]', 'Realizado', '#9cd12e', '2020-12-04 17:35:00', '2020-11-26 19:58:14', '2021-02-03 20:38:54'),
(2, 'TK-00000002', 'Pruebas tickets2', 'asdasdasdasd1', 'Pedro Avila', 0, 2, '[{\"id\":23,\"name\":\"pedro jos\\u00e8\",\"email\":\"eldiamantepedro@hotmail.com\"},{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"}]', 'Realizado', '', '2020-12-17 17:55:00', '2020-11-26 20:09:33', '2021-01-28 16:21:05'),
(6, 'TK-00000003', 'Pruebas tickets4', 'asdasdasd33', 'Pedro Avila', 0, 1, '[{\"id\":21,\"name\":\"pruebas25\",\"email\":\"pruebas25@gmail.com\"},{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"}]', 'Activo', '#233eba', '2020-12-01 17:50:00', '2020-11-27 16:26:11', '2021-02-03 17:59:10'),
(36, 'TK-00000004', 'ticket pruebas 3', 'asdasdasd', 'admin', 0, 1, NULL, 'Realizado', '#9cd12e', '2021-01-30 14:55:00', '2021-01-25 18:44:07', '2021-01-30 21:45:02'),
(37, 'TK-00000005', 'Pruebas tickets43', 'asdasdasdasd', 'Pedro Avila', 0, 22, '[{\"id\":15,\"name\":\"Pedro Avila2\",\"email\":\"pedrojam1433@gmail.com\"},{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"}]', 'Realizado', '#9cd12e', '2021-01-30 14:50:00', '2021-01-27 18:57:56', '2021-01-30 21:45:05'),
(38, 'TK-00000006', 'Pruebas tickets433', 'asdasdasdasd', 'Pedro Avila', 1, 22, '[{\"id\":15,\"name\":\"Pedro Avila2\",\"email\":\"pedrojam1433@gmail.com\"}]', 'Activo', '#233eba', '2021-01-30 14:50:00', '2021-01-27 18:58:21', '2021-01-29 19:51:46'),
(39, 'TK-00000007', 'Pruebas tickets45646', 'asdasdasd', 'Pedro Avila', 0, 21, '[{\"id\":23,\"name\":\"pedro jos\\u00e8\",\"email\":\"eldiamantepedro@hotmail.com\"},{\"id\":19,\"name\":\"pruebas7\",\"email\":\"pruebas7@gmail.com\"},{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"},{\"id\":1,\"name\":\"Pedro Avila\",\"email\":\"pedrojosavila@gmail.com\"}]', 'Activo', '#233eba', '2021-01-30 16:45:00', '2021-01-27 20:54:10', '2021-01-29 19:51:45'),
(40, 'TK-00000008', 'pruebastickets2555', 'asdasdasdasd', 'admin', 0, 1, '[{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"},{\"id\":23,\"name\":\"pedro josè\",\"email\":\"eldiamantepedro@hotmail.com\"},{\"id\":21,\"name\":\"pruebas25\",\"email\":\"pruebas25@gmail.com\"}]', 'Activo', '', '2021-01-30 15:55:00', '2021-01-29 19:04:46', '2021-01-29 19:42:21'),
(41, 'TK-00000009', 'pruebastickets2555', 'asdasdasdasd', 'admin', 0, 1, '[{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"},{\"id\":23,\"name\":\"pedro josè\",\"email\":\"eldiamantepedro@hotmail.com\"},{\"id\":21,\"name\":\"pruebas25\",\"email\":\"pruebas25@gmail.com\"}]', 'En proceso', NULL, '2021-01-30 15:55:00', '2021-01-29 19:04:52', '2021-02-04 01:34:31'),
(42, 'TK-00000010', 'pruebastickets2555', 'asdasdasdasd', 'admin', 0, 1, '[{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"},{\"id\":21,\"name\":\"pruebas25\",\"email\":\"pruebas25@gmail.com\"}]', 'Activo', '', '2021-01-30 15:55:00', '2021-01-29 19:05:02', '2021-01-29 19:42:19'),
(43, 'TK-00000011', 'probandoultimoticket', 'asdasdasdasdasdasd', 'admin', 0, 1, '[{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"},{\"id\":9,\"name\":\"pruebas\",\"email\":\"pruebas@gmail.com\"},{\"id\":21,\"name\":\"pruebas25\",\"email\":\"pruebas25@gmail.com\"}]', 'Activo', NULL, '2021-01-30 15:55:00', '2021-01-29 20:00:37', '2021-01-29 20:07:28'),
(44, 'TK-00000012', 'probandotickets23455', 'asdasd', 'admin', 0, 1, '[{\"id\":1,\"name\":\"Pedro Avila\",\"email\":\"pedrojosavila@gmail.com\"},{\"id\":19,\"name\":\"pruebas7\",\"email\":\"pruebas7@gmail.com\"}]', 'Activo', '#233eba', '2021-01-30 16:35:00', '2021-01-29 20:07:50', '2021-02-03 00:36:55'),
(45, 'TK-00000013', 'prea', NULL, 'prueba', 2, 1, '[{\"id\":21,\"name\":\"pruebas25\",\"email\":\"pruebas25@gmail.com\"}]', 'Inactivo', '#ff8000', '2021-03-06 16:50:00', '2021-02-03 20:38:07', '2021-02-05 01:53:00'),
(46, 'TK-00000014', 'prea', NULL, 'pruebas', 9, 1, '[{\"id\":22,\"name\":\"Pedro Jose Avila Moreno\",\"email\":\"pedrojam14@gmail.com\"}]', 'Activo', NULL, '2021-02-27 21:55:00', '2021-02-05 01:54:03', '2021-02-05 01:54:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sede` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_change` tinyint(1) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `telefono`, `direccion`, `sede`, `img_src`, `sidebar_change`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pedro Avila', 'pedrojosavila@gmail.com', 'ggg', 'otros', 'ggg', 'ND0tij93MkNjG1vDPLFUZHV4ubLsZ39uWUoZTNjy.png', 0, NULL, '$2y$10$e0L5HbchjCfUntOnrePV5Oih2HLgnlnS7U4Xv5WPID.djS9fJWMMu', NULL, '2020-10-29 07:22:41', '2021-02-05 00:04:29'),
(2, 'prueba', 'prueba@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, '$2y$10$2ZFFCC45w4oFdctGusUo4OOfbSaNq86sXd0rLjI8KW6lm4Y2Zglau', NULL, '2020-10-29 23:16:13', '2021-02-04 23:59:32'),
(9, 'pruebas', 'pruebas@gmail.com', NULL, 'asdasdasdq', NULL, NULL, NULL, NULL, '$2y$10$wvkD6V0suJ1euMOUf7E8Ru1TU3Pa389UF6YO3Q7pydkxxMIloeTZ6', NULL, '2020-10-30 19:34:42', '2021-02-04 23:23:59'),
(10, 'Jose Avila', 'avila@gmail.com', NULL, 'asdasd', NULL, NULL, NULL, NULL, '$2y$10$l4alRII5zp8pn/9C9rbQtOdz4G5uVnKe2DSc87uaXiJBc84C1aTFS', NULL, '2020-10-30 19:40:44', '2021-02-03 23:43:29'),
(11, 'Antonio', 'antonio@gmail.com', NULL, 'adasda', NULL, NULL, NULL, NULL, '$2y$10$I7aGeQfsORgcnhBeVQhstu7X6ETgy6mQCHETQY5T6hNjm.djgWHaW', NULL, '2020-10-30 19:41:49', '2020-10-30 19:41:49'),
(12, 'admin', 'admin@gmail.com', NULL, 'asdasdadasdas', NULL, NULL, NULL, NULL, '$2y$10$ObrQtZarDk6T7fkqznCViuA.1Evr2hkUU/.eaSkS4UbJqmXdYxdty', 'aNxNCq2uwDNhVsx5JQOzPetoG3rL5tb82KOaJyMhom5x7GFcXJBujXuUUh9D', '2020-10-30 19:46:19', '2020-10-30 19:46:19'),
(15, 'Pedro Avila2', 'pedrojam1433@gmail.com', NULL, 'asdasd', 'asdasd', NULL, NULL, NULL, '$2y$10$1O4p4EZn9Mb23rEIGvyCueMwV8tpai.hVLuUy3f3t5s8uT7fbg/wS', NULL, '2020-11-02 20:43:01', '2020-11-02 20:43:01'),
(19, 'pruebas7', 'pruebas7@gmail.com', NULL, 'asdasd', 'asdasd', NULL, NULL, NULL, '$2y$10$B17gJ5N2gx7eBaJSGUrEuOGQByGAcir2DfdqutCQxmKnu03rUvj9q', NULL, '2020-11-27 21:52:54', '2020-11-27 21:52:54'),
(21, 'pruebas25', 'pruebas25@gmail.com', NULL, 'asdasda', 'asdasd', NULL, NULL, NULL, '$2y$10$sCr8G75x0AvUp63/BnBOeeCMD4prUGLFxxrpYsSCRqGIOIHVMH70e', NULL, '2020-11-27 23:56:07', '2020-11-27 23:56:07'),
(22, 'Pedro Jose Avila Moreno', 'pedrojam14@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, '$2y$10$5zOzw0TcFR9oDUZmKROsUueODee9SKUsSJgspl5hCbAqMfeLa.H0K', NULL, '2021-01-06 21:51:34', '2021-02-05 05:51:20'),
(23, 'pedro josè', 'eldiamantepedro@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Kxx8lqOLzYvDk1thWu2v3Osc0b4aG0DT7XBVWeBB3/cwoXQ5jkPAW', NULL, '2021-01-07 00:55:56', '2021-01-07 00:55:56'),
(25, 'Pedro Jose Avila Moreno', 'pedrojam14322@gmail.com', NULL, 'Altagracia-guarico', 'asdasdasd', NULL, NULL, NULL, '$2y$10$Al96SZ9.lthE4SPr5Kld3OFK08zAy9XELbWyFoLufX3cGXLrtskMW', NULL, '2021-02-01 22:12:04', '2021-02-01 22:12:04'),
(26, 'probando', 'probads@gmail.com', NULL, 'Altagracia-guarico', 'asdasdasd', NULL, NULL, NULL, '$2y$10$6LtZIRh5qRNhiLnPcmbmGuL4lzzIBmdk2280YJb5T61S3mfiRGpju', NULL, '2021-02-01 22:51:51', '2021-02-01 22:51:51'),
(27, 'pruebas88', 'pruebas8@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$8dG3yryREBVi29tysnenpOCREUxOhWiWOx5HyN1cXaBieSNQqJSjq', NULL, '2021-02-03 04:22:24', '2021-02-03 04:22:24');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indices de la tabla `buttons`
--
ALTER TABLE `buttons`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_has_tickets`
--
ALTER TABLE `categorias_has_tickets`
  ADD PRIMARY KEY (`categoria_id`,`ticket_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indices de la tabla `categorias_has_users`
--
ALTER TABLE `categorias_has_users`
  ADD PRIMARY KEY (`categoria_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `cron_job_mails`
--
ALTER TABLE `cron_job_mails`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `report_lines`
--
ALTER TABLE `report_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indices de la tabla `repository_files`
--
ALTER TABLE `repository_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `users_id` (`users_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT de la tabla `buttons`
--
ALTER TABLE `buttons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cron_job_mails`
--
ALTER TABLE `cron_job_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `report_lines`
--
ALTER TABLE `report_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `repository_files`
--
ALTER TABLE `repository_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias_has_tickets`
--
ALTER TABLE `categorias_has_tickets`
  ADD CONSTRAINT `categorias_has_tickets_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categorias_has_users`
--
ALTER TABLE `categorias_has_users`
  ADD CONSTRAINT `categorias_has_users_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `report_lines`
--
ALTER TABLE `report_lines`
  ADD CONSTRAINT `report_lines_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
