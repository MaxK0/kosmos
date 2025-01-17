-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 06 2024 г., 07:58
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel_edu`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gagarin_flights`
--

CREATE TABLE `gagarin_flights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gagarin_flights`
--

INSERT INTO `gagarin_flights` (`id`, `data`, `created_at`, `updated_at`) VALUES
(1, '{\r\n            \"mission\": {\r\n                \"name\": \"Восток 1\",\r\n                \"launch_details\": {\r\n                    \"launch_date\": \"1961-04-12\",\r\n                    \"launch_site\": {\r\n                        \"name\": \"Космодром Байконур\",\r\n                        \"location\": {\r\n                            \"latitude\": 45.965,\r\n                            \"longitude\": 63.305\r\n                        }\r\n                    }\r\n                },\r\n                \"flight_duration\": {\r\n                    \"hours\": 1,\r\n                    \"minutes\": 48\r\n                },\r\n                \"spacecraft\": {\r\n                    \"name\": \"Восток 3KA\",\r\n                    \"manufacturer\": \"OKB-1\",\r\n                    \"crew_capacity\": 1\r\n                }\r\n            },\r\n            \"landing\": {\r\n                \"date\": \"1961-04-12\",\r\n                \"site\": {\r\n                    \"name\": \"Смеловка\",\r\n                    \"country\": \"СССР\",\r\n                    \"coordinates\": {\r\n                        \"latitude\": 51.27,\r\n                        \"longitude\": 45.997\r\n                    }\r\n                },\r\n                \"details\": {\r\n                    \"parachute_landing\": true,\r\n                    \"mpc\": 7\r\n                }\r\n            },\r\n            \"cosmonaut\": {\r\n                \"name\": \"Юрий Гагарин\",\r\n                \"birthdate\": \"1934-03-09\",\r\n                \"rank\": \"Старший лейтенант\",\r\n                \"bio\": {\r\n                    \"early_life\": \"Родился в Клушино, Россия..\",\r\n                    \"career\": \"Отобран в отряд космонавтов в 1960 году...\",\r\n                    \"post_flight\": \"Стал международным героем..\"\r\n                }\r\n            }\r\n        }\r\n', '2024-11-13 05:32:53', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lunar_missions`
--

CREATE TABLE `lunar_missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `launch_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`launch_details`)),
  `landing_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`landing_details`)),
  `spacecraft` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`spacecraft`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lunar_missions`
--

INSERT INTO `lunar_missions` (`id`, `user_id`, `name`, `launch_details`, `landing_details`, `spacecraft`, `created_at`, `updated_at`) VALUES
(3, 12, 'Apollo-17', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":28.5721,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Виктор\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-05 01:36:04', '2024-11-05 01:36:04'),
(5, 13, 'Apollo-18', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":28.5721,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Evgeniy Cernan\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-05 02:42:31', '2024-11-05 02:52:14'),
(6, 13, 'apollo-17', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":28.5721,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Evgeniy Cernan\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-06 01:32:02', '2024-11-06 01:32:02'),
(7, 13, 'Apollo-17', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":28.5721,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Evgeniy Cernan\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-06 01:36:55', '2024-11-06 01:36:55'),
(8, 13, 'Apollo-17', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":28.5721,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Evgeniy Cernan\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-06 01:38:49', '2024-11-06 01:38:49'),
(9, 13, 'Apollo-17', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":28.5721,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Evgeniy Cernan\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-06 01:43:00', '2024-11-06 01:43:00'),
(10, 13, 'Apollo-17', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":-90,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Evgeniy Cernan\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-06 01:43:17', '2024-11-06 01:43:17'),
(11, 13, 'Apollo-17', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":-90,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Evgeniy Cernan\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-06 01:44:22', '2024-11-06 01:44:22'),
(12, 13, 'Apollo-17', '{\"launch_date\":\"1972-12-07\",\"launch_site\":{\"name\":\"Kennedy Space Center\",\"location\":{\"latitude\":-90,\"longitude\":-80.648}}}', '{\"landing_date\":\"1972-12-19\",\"landing_site\":{\"name\":\"Taurus-Littrov\",\"coordinates\":{\"latitude\":20.1908,\"longitude\":30.7717}}}', '{\"command_module\":\"America\",\"lunar_module\":\"Challenger\",\"crew\":[{\"name\":\"Evgeniy Cernan\",\"role\":\"Commander\"},{\"name\":\"Harrison Schmitt\",\"role\":\"Lunar module pilot\"},{\"name\":\"Ronald Evans\",\"role\":\"Lunar module pilot\"}]}', '2024-11-06 01:44:33', '2024-11-06 01:44:33');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '0001_01_01_000000_create_users_table', 1),
(6, '0001_01_01_000001_create_cache_table', 1),
(7, '0001_01_01_000002_create_jobs_table', 1),
(8, '2024_11_04_061911_create_personal_access_tokens_table', 1),
(9, '2024_11_04_072128_change_date_column_from_users_table', 2),
(10, '2024_11_05_051847_create_gagarin_flights_table', 3),
(12, '2024_11_05_054937_create_lunal_missions_table', 4),
(13, '2024_11_06_051234_create_space_flights_table', 5),
(14, '2024_11_06_054049_create_user_flights_table', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 12, 'api', '07ec0f3d5b91ea28b6cd6117bf57970dda1056a51e44ab15775e42a5cb356fa7', '[\"*\"]', NULL, NULL, '2024-11-04 02:58:39', '2024-11-04 02:58:39'),
(2, 'App\\Models\\User', 12, 'api', 'd74ba09d9470a8086bb22c709979967aa613a7092a03d8e7fa76266f7a4f5018', '[\"*\"]', NULL, NULL, '2024-11-04 02:59:26', '2024-11-04 02:59:26'),
(5, 'App\\Models\\User', 12, 'api', '88b93a7345141ef87ba23641efeee9aa853700a155a7e0f6ea818498677a1f0a', '[\"*\"]', '2024-11-05 01:16:13', NULL, '2024-11-05 01:12:21', '2024-11-05 01:16:13'),
(6, 'App\\Models\\User', 12, 'api', 'fb5e2f8a4a6044517668a4aea0ed243a9b0ec2af8befd07205dc1af1e643c3e5', '[\"*\"]', NULL, NULL, '2024-11-05 01:17:11', '2024-11-05 01:17:11'),
(7, 'App\\Models\\User', 12, 'api', '4b312d8f0c3951f8369ea2125b1cbfb9035f64f1d61a6fddfc4492dd50319170', '[\"*\"]', NULL, NULL, '2024-11-05 01:17:14', '2024-11-05 01:17:14'),
(8, 'App\\Models\\User', 12, 'api', '7592a553c03fad494b25ac3197aea79ffde51555f442714e61a91be621032659', '[\"*\"]', '2024-11-05 02:30:21', NULL, '2024-11-05 01:17:16', '2024-11-05 02:30:21'),
(10, 'App\\Models\\User', 13, 'api', '5e273e9255ca0220394835e3ab9c61550b9ab2cc414a0ba846835be5078ef496', '[\"*\"]', '2024-11-06 01:47:20', NULL, '2024-11-05 03:40:41', '2024-11-06 01:47:20');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('PcaZ0VrnYCEMPzoUiNtx16bXYsG83cHfL7zlzUZZ', NULL, '::1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFo4RzdyaDdOeUFHd3pUd2FpUEY4cmUyWm1lbkViZzdaYVFUNnZ3ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3QvbGFyYXZlbC1lZHUvcHVibGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730704302),
('wCBpTo4n3bNU7raUx1yyRdFGhmPSDIJzT3jZVM2S', NULL, '::1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWE2YkJNNlZ6RTYydEJKdE92MDJBaVNCdTl0Zm9TVFZXYWhHempQNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3QvbGFyYXZlbC1lZHUvcHVibGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730870581);

-- --------------------------------------------------------

--
-- Структура таблицы `space_flights`
--

CREATE TABLE `space_flights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flight_number` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `launch_date` varchar(255) NOT NULL,
  `seats_available` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `space_flights`
--

INSERT INTO `space_flights` (`id`, `flight_number`, `destination`, `launch_date`, `seats_available`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'Test', '2000-01-01', 3, '2024-11-06 00:25:57', '2024-11-06 00:25:57'),
(2, 'Test', 'Test', '2000-01-01', 3, '2024-11-06 00:28:21', '2024-11-06 00:28:21'),
(3, 'Test', 'Test', '2000-01-01', 3, '2024-11-06 01:46:09', '2024-11-06 01:46:09');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `patronymic` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birth_date` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `patronymic`, `email`, `password`, `birth_date`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'asfsaf', 'Last', 'Pat', 'email@mail.ru', '$2y$12$ZRcqBOgabtXrOBYJSTCHqeNPSFBleDp1UXstp4o/qf0YvcPBtyKYm', '2000-01-01', NULL, '2024-11-04 02:11:13', '2024-11-04 02:11:13'),
(5, 'asfsaf', 'Last', 'Pat', 'email@mail.ru1', '$2y$12$gAzOc6WRrjCoqLBkv.tKN.kJxPOQlaXVlDxVUEvd7.Q4PH7EO9a8y', '2000-01-01', NULL, '2024-11-04 02:11:37', '2024-11-04 02:11:37'),
(6, 'First', 'Last', 'Pat', 'test@test.ru', '$2y$12$OPhUUHek8RiXzh/a.Ck2m.5hRo1.RqRiy9o6/xdkAgdVAcCMBXhDm', '2000-01-01', NULL, '2024-11-04 02:25:53', '2024-11-04 02:25:53'),
(7, 'First', 'Last', 'Pat', 'test@test.ru1', '$2y$12$JkwYD0AZ.yeFxRWhtw2iz.Ua/Y..i5ZXujIB9.QS4IghCbZ.PL4c2', '2000-01-01', NULL, '2024-11-04 02:27:27', '2024-11-04 02:27:27'),
(8, 'First', 'Last', 'Pat', 'test@test.ru11', '$2y$12$8UaUkNGelcRNrzeP8wMzquuG1twOfjCRzNZ5qYi8oQ1yQFgNIFbhO', '2000-01-01', NULL, '2024-11-04 02:27:41', '2024-11-04 02:27:41'),
(9, 'First', 'Last', 'Pat', 'test@test.ru0', '$2y$12$pe459Cf/ZPKWAj0fWf0Jh.QelIA23nCUPb/JfWWIqGhjhrqkNVLXq', '2000-01-01', NULL, '2024-11-04 02:31:16', '2024-11-04 02:31:16'),
(10, 'First', 'Last', 'Pat', 'test@test.ru01', '$2y$12$2yT1lxYb.DCE2Ivba0xSeOLgY2rdX5xE4mjeIKZN7t99weLE3Rm3q', '2000-01-01', NULL, '2024-11-04 02:35:30', '2024-11-04 02:35:30'),
(11, 'First', 'Last', 'Pat', 'test@test.ru011', '$2y$12$Tp51w7vaS37qsQhOQq4vA.syUub2Lx0S6Y6HuerOn0gXEmexl.8We', '2000-01-01', NULL, '2024-11-04 02:36:25', '2024-11-04 02:36:25'),
(12, 'First', 'Last', 'Pat', 'test@test.ru0114', '$2y$12$R5rBBm9gI7Psc5dLBW8CeOHgLcqftSJFZVx20wDVV7V2HQCCNUr5S', '2000-01-01', NULL, '2024-11-04 02:37:08', '2024-11-04 02:37:08'),
(13, 'First', 'Last', 'Pat', 'test@test.ru01141', '$2y$12$V.hKriAC8cF6G0TAvcJ2duQY9HTMnexbXvNRtMkX/1hwAQba0Kege', '2000-01-01', NULL, '2024-11-05 02:30:34', '2024-11-05 02:30:34');

-- --------------------------------------------------------

--
-- Структура таблицы `user_flights`
--

CREATE TABLE `user_flights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `flight_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_flights`
--

INSERT INTO `user_flights` (`id`, `user_id`, `flight_id`, `created_at`, `updated_at`) VALUES
(1, 13, 1, '2024-11-06 00:46:12', '2024-11-06 00:46:12'),
(2, 13, 1, '2024-11-06 00:48:13', '2024-11-06 00:48:13'),
(3, 13, 1, '2024-11-06 00:48:15', '2024-11-06 00:48:15');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `gagarin_flights`
--
ALTER TABLE `gagarin_flights`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lunar_missions`
--
ALTER TABLE `lunar_missions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lunar_missions_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `space_flights`
--
ALTER TABLE `space_flights`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `user_flights`
--
ALTER TABLE `user_flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_flights_user_id_foreign` (`user_id`),
  ADD KEY `user_flights_flight_id_foreign` (`flight_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gagarin_flights`
--
ALTER TABLE `gagarin_flights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lunar_missions`
--
ALTER TABLE `lunar_missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `space_flights`
--
ALTER TABLE `space_flights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `user_flights`
--
ALTER TABLE `user_flights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lunar_missions`
--
ALTER TABLE `lunar_missions`
  ADD CONSTRAINT `lunar_missions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_flights`
--
ALTER TABLE `user_flights`
  ADD CONSTRAINT `user_flights_flight_id_foreign` FOREIGN KEY (`flight_id`) REFERENCES `space_flights` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_flights_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
