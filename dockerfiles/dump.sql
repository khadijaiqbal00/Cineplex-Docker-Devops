-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2023 at 04:27 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_30_201624_create_movies_table', 1),
(6, '2021_12_30_201841_create_tickets_table', 1),
(7, '2021_12_30_201914_create_shows_table', 1),
(8, '2022_01_10_140946_create_movie_review_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_name` varchar(191) NOT NULL,
  `movie_description` mediumtext NOT NULL,
  `ratings` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `movie_cover` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `movie_name`, `movie_description`, `ratings`, `year`, `movie_cover`, `created_at`, `updated_at`) VALUES
(1, 'Spider Man', 'Title: Spider-Man: No Way Home\r\n\r\nGenre: Action/Adventure/Sci-Fi\r\n\r\nSynopsis:\r\n\"Spider-Man: No Way Home\" takes audiences on a mind-bending and action-packed journey as Peter Parker, also known as Spider-Man, faces his greatest challenge yet. Struggling to balance his personal life and responsibilities as a superhero.\r\nHaunted by the events of the previous film, Peter seeks the help of Doctor Strange, the Sorcerer Supreme, to erase the world\'s knowledge of his true identity. But a miscalculated spell by Strange inadvertently tears open the fabric of the multiverse,', 9, 2021, '1685283821.jpg', '2023-05-28 14:17:03', '2023-05-28 09:23:41'),
(2, 'Fast and Furious 7', '\"Fast & Furious 7\" is a thrilling and emotional ride, showcasing the signature fast cars, daring stunts, and explosive action sequences that fans have come to love. With its breathtaking visuals, heart-stopping moments, and a celebration of the franchise\'s enduring spirit, this installment pays homage to its roots while propelling the Fast & Furious series into an electrifying future.', 8, 2015, '1685283834.jpg', '2023-05-28 14:17:25', '2023-05-28 09:23:54'),
(3, 'Dead pool 2', 'Title: Deadpool 2\r\n\r\nGenre: Action/Comedy/Adventure\r\n\r\nSynopsis:\r\n\"Deadpool 2\" brings back the irreverent and wisecracking anti-hero, Wade Wilson, in a wild and hilarious sequel that takes the action to new heights.', 7, 2013, '1685283851.jpeg', '2023-05-28 14:18:37', '2023-05-28 09:24:11'),
(5, 'abc', 'Title: abc  2\r\n\r\nGenre: Action/Comedy/Adventure\r\n\r\nSynopsis:\r\n\"Deadpool 2\" brings back the irreverent and wisecracking anti-hero, Wade Wilson, in a wild and hilarious sequel that takes the action to new heights.', 7, 2013, '1685283865.jpg', '2023-05-28 14:19:11', '2023-05-28 09:24:25'),
(8, 'Venom', '\"Venom\" combines thrilling action sequences, dark humor, and an exploration of duality to deliver an exhilarating cinematic experience. With stunning visual effects, intense battles, and a captivating performance by Tom Hardy, the film showcases the complex nature of its anti-hero protagonist and sets the stage for future symbiote-infused adventures.', 7, 2022, '1685283875.jpg', '2023-05-28 14:19:56', '2023-05-28 09:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `movie_review`
--

CREATE TABLE `movie_review` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `movie_review` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` int(11) NOT NULL,
  `movie_seats` int(11) NOT NULL,
  `movie_dateTime` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `movie_seats` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `user_role` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=user,1=admin',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'khadija', 'Khadijaiqbal0123@gmail.com', NULL, '$2y$10$i3LCIrxSg0gb1driJw84l.EEy53mESeycL3seSPk9EjRdDHcbJH0q', 0, NULL, '2023-05-28 08:34:12', '2023-05-28 08:34:12'),
(2, 'Admin', 'Admin@gmail.com', NULL, '$2y$10$i3LCIrxSg0gb1driJw84l.EEy53mESeycL3seSPk9EjRdDHcbJH0q', 1, NULL, '2023-05-28 08:34:12', '2023-05-28 08:34:12'),
(3, 'admin', 'admin1@gmail.com', NULL, '$2y$10$DSr5jUucpsF/bD0VKz7xHOCMxAFAg1k7kzTzb8lPQO1F9KjkH/Hxe', 1, NULL, '2023-05-28 09:21:59', '2023-05-28 09:21:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `movies_movie_name_unique` (`movie_name`);

--
-- Indexes for table `movie_review`
--
ALTER TABLE `movie_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `movie_review`
--
ALTER TABLE `movie_review`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
