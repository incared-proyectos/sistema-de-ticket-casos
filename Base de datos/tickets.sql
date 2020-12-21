-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-12-2020 a las 18:12:24
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.13

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
(2, 7),
(3, 1),
(3, 2),
(3, 7),
(4, 6);

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
(3, 2),
(3, 9),
(3, 12),
(3, 19),
(3, 21),
(4, 2),
(4, 9),
(4, 11),
(4, 15),
(4, 19),
(4, 21),
(5, 9),
(5, 15),
(5, 21),
(6, 15);

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
(35, 1, 'gg', NULL, NULL, 6, NULL, '2020-12-21 16:36:02', '2020-12-21 16:36:02'),
(36, 1, 'ff', NULL, NULL, 6, NULL, '2020-12-21 16:36:20', '2020-12-21 16:36:20'),
(37, 1, '22', NULL, NULL, 6, NULL, '2020-12-21 17:07:33', '2020-12-21 17:07:33'),
(38, 1, '44', NULL, NULL, 6, NULL, '2020-12-21 17:07:56', '2020-12-21 17:07:56'),
(39, 1, '33', NULL, NULL, 6, NULL, '2020-12-21 17:08:14', '2020-12-21 17:08:14'),
(40, 1, '33', NULL, NULL, 6, NULL, '2020-12-21 17:08:46', '2020-12-21 17:08:46'),
(41, 1, '555', NULL, NULL, 6, NULL, '2020-12-21 17:08:56', '2020-12-21 17:08:56'),
(42, 1, 'archivos necesarios', '4Xbw8X8Ozz8Uwf8efz8fPAGe3zIoa3h4JcGwiODv.pdf', 'VLtInm2mgsrkGtPKK5rmJpA2oVldayLy2rRne4eF.jpeg', 6, NULL, '2020-12-21 17:09:12', '2020-12-21 17:09:12');

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
(4, '2020_10_29_124002_create_permission_tables', 2);

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
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 10),
(1, 'App\\Models\\User', 11),
(1, 'App\\Models\\User', 12),
(1, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 15),
(4, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 2);

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
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 12),
(1, 'App\\Models\\User', 15),
(1, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 19);

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
(1, 'edit', 'web', '2020-10-30 04:00:00', '2020-10-31 04:00:00'),
(2, 'created2', 'web', '2020-10-30 04:00:00', '2020-11-02 20:40:22'),
(4, 'visualizar', 'web', '2020-10-31 22:35:53', '2020-10-31 22:35:53'),
(5, 'desplazar', 'web', '2020-10-31 22:35:59', '2020-10-31 22:35:59'),
(6, 'sistemas', 'web', '2020-11-26 23:26:44', '2020-11-26 23:26:44');

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
(1, 'administrador2', 'web', '2020-10-30 04:00:00', '2020-11-27 23:55:03'),
(2, 'user2', 'web', '2020-10-30 04:00:00', '2020-11-02 20:40:02'),
(3, 'otros', 'web', '2020-11-02 19:47:00', '2020-11-02 19:47:00');

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
  `descripcion` text NOT NULL,
  `apertura` varchar(100) NOT NULL,
  `users_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `fecha_caducidad` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `codigo`, `titulo`, `descripcion`, `apertura`, `users_id`, `status`, `fecha_caducidad`, `created_at`, `updated_at`) VALUES
(1, 'TK-00000001', 'Pruebas tickets', 'asdasd', 'Pedro Avila', 2, 'active', '2020-12-18 17:35:00', '2020-11-26 19:58:14', '2020-12-18 19:27:38'),
(2, 'TK-00000002', 'Pruebas tickets2', 'asdasdasdasd', 'Pedro Avila', 2, 'active', NULL, '2020-11-26 20:09:33', '2020-12-16 20:38:30'),
(6, 'TK-00000003', 'Pruebas tickets4', 'asdasdasd', 'Pedro Avila', 2, 'inactive', '2020-12-01 17:50:00', '2020-11-27 16:26:11', '2020-12-18 21:23:44'),
(7, 'TK-00000004', 'asdasd', 'asdasdasdasd', 'Pedro Avila', 2, 'active', '2020-12-26 14:35:00', '2020-12-16 18:37:39', '2020-12-17 18:42:17');

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
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `telefono`, `direccion`, `sede`, `img_src`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pedro Avila', 'pedrojosavila@gmail.com', 'ggg', 'otros', 'ggg', 'VnKUtbxstZPZF7HG3bpNylMXWqqIaSNglVDKJ7dW.jpeg', NULL, '$2y$10$e0L5HbchjCfUntOnrePV5Oih2HLgnlnS7U4Xv5WPID.djS9fJWMMu', NULL, '2020-10-29 07:22:41', '2020-11-02 19:44:22'),
(2, 'prueba', 'prueba@gmail.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$/sqdeCRQzSYJxsAHVe1gvunRDxtyArfw/MCcGT.ByZUOslw.rjA5e', NULL, '2020-10-29 23:16:13', '2020-10-29 23:16:13'),
(9, 'pruebas', 'pruebas@gmail.com', NULL, 'asdasdasdq', NULL, NULL, NULL, '$2y$10$UnQqmSPA.6mw9Q0JUGqSdOl6BWOpgRS0MEg.JP4ex5cSlGj9urPyy', NULL, '2020-10-30 19:34:42', '2020-10-30 19:34:42'),
(10, 'Jose Avila', 'avila@gmail.com', NULL, 'asdasd', NULL, NULL, NULL, '$2y$10$hp5pVU4rbyobZExcKMCQKe10kq.kk/awnfyGgTT7tQlAvoz1oS3tC', NULL, '2020-10-30 19:40:44', '2020-10-30 19:40:44'),
(11, 'Antonio', 'antonio@gmail.com', NULL, 'adasda', NULL, NULL, NULL, '$2y$10$I7aGeQfsORgcnhBeVQhstu7X6ETgy6mQCHETQY5T6hNjm.djgWHaW', NULL, '2020-10-30 19:41:49', '2020-10-30 19:41:49'),
(12, 'admin', 'admin@gmail.com', NULL, 'asdasdadasdas', NULL, NULL, NULL, '$2y$10$ObrQtZarDk6T7fkqznCViuA.1Evr2hkUU/.eaSkS4UbJqmXdYxdty', NULL, '2020-10-30 19:46:19', '2020-10-30 19:46:19'),
(15, 'Pedro Avila2', 'pedrojam1433@gmail.com', NULL, 'asdasd', 'asdasd', NULL, NULL, '$2y$10$1O4p4EZn9Mb23rEIGvyCueMwV8tpai.hVLuUy3f3t5s8uT7fbg/wS', NULL, '2020-11-02 20:43:01', '2020-11-02 20:43:01'),
(19, 'pruebas7', 'pruebas7@gmail.com', NULL, 'asdasd', 'asdasd', NULL, NULL, '$2y$10$B17gJ5N2gx7eBaJSGUrEuOGQByGAcir2DfdqutCQxmKnu03rUvj9q', NULL, '2020-11-27 21:52:54', '2020-11-27 21:52:54'),
(21, 'pruebas25', 'pruebas25@gmail.com', NULL, 'asdasda', 'asdasd', NULL, NULL, '$2y$10$sCr8G75x0AvUp63/BnBOeeCMD4prUGLFxxrpYsSCRqGIOIHVMH70e', NULL, '2020-11-27 23:56:07', '2020-11-27 23:56:07');

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
