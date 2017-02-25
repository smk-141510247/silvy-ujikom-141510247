-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 24, 2017 at 06:33 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujikom`
--

-- --------------------------------------------------------

--
-- Table structure for table `golongans`
--

CREATE TABLE `golongans` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_golongan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama_golongan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `besaran_uang` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `golongans`
--

INSERT INTO `golongans` (`id`, `kode_golongan`, `nama_golongan`, `besaran_uang`, `created_at`, `updated_at`) VALUES
(1, '22', '1AT', 200000, NULL, NULL),
(2, '109', 'T11A', 1900000, '2017-02-10 14:14:28', '2017-02-10 14:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `jabatans`
--

CREATE TABLE `jabatans` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_jabatan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama_jabatan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `besaran_uang` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jabatans`
--

INSERT INTO `jabatans` (`id`, `kode_jabatan`, `nama_jabatan`, `besaran_uang`, `created_at`, `updated_at`) VALUES
(2, '12', 'HRD', 1000000, NULL, NULL),
(3, '1', 'Adm', 5000000, '2017-02-10 13:48:08', '2017-02-10 13:48:08'),
(4, '13', 'Adm', 5000000, '2017-02-10 13:48:21', '2017-02-10 13:48:21'),
(6, '11', 'Akutansi', 900000, '2017-02-12 07:59:36', '2017-02-12 07:59:36'),
(7, 'k2', 'Manager', 5000000, '2017-02-15 09:38:42', '2017-02-15 09:38:42'),
(8, '2', 'HDR', 20000, '2017-02-18 14:31:51', '2017-02-18 14:31:51');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_lemburs`
--

CREATE TABLE `kategori_lemburs` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_lembur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_jabatan` int(10) UNSIGNED DEFAULT NULL,
  `id_golongan` int(10) UNSIGNED DEFAULT NULL,
  `besaran_uang` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategori_lemburs`
--

INSERT INTO `kategori_lemburs` (`id`, `kode_lembur`, `id_jabatan`, `id_golongan`, `besaran_uang`, `created_at`, `updated_at`) VALUES
(1, 'KL1', 6, 2, 80000, '2017-02-19 12:26:32', '2017-02-19 12:26:32');

-- --------------------------------------------------------

--
-- Table structure for table `lembur_pegawais`
--

CREATE TABLE `lembur_pegawais` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_lembur_id` int(10) UNSIGNED DEFAULT NULL,
  `id_pegawai` int(10) UNSIGNED DEFAULT NULL,
  `jumlah_jam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lembur_pegawais`
--

INSERT INTO `lembur_pegawais` (`id`, `kode_lembur_id`, `id_pegawai`, `jumlah_jam`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 2, '2017-02-19 12:44:57', '2017-02-19 12:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_01_30_090545_create_jabatans_table', 1),
(4, '2017_01_30_090558_create_golongans_table', 1),
(5, '2017_01_30_092210_create_tunjangans_table', 1),
(6, '2017_01_30_093930_create_pegawais_table', 1),
(7, '2017_01_30_100549_create_kategori_lemburs_table', 1),
(8, '2017_01_30_101402_create_lembur_pegawais_table', 1),
(9, '2017_01_30_103331_create_tunjangan_pegawais_table', 1),
(10, '2017_01_30_103649_create_penggajians_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawais`
--

CREATE TABLE `pegawais` (
  `id` int(10) UNSIGNED NOT NULL,
  `nip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `id_jabatan` int(10) UNSIGNED DEFAULT NULL,
  `id_golongan` int(10) UNSIGNED DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pegawais`
--

INSERT INTO `pegawais` (`id`, `nip`, `id_user`, `id_jabatan`, `id_golongan`, `foto`, `created_at`, `updated_at`) VALUES
(3, '101', 7, 2, 1, 'b.PNG', '2017-02-10 12:36:43', '2017-02-24 10:59:21'),
(4, '670', 8, 7, 2, 'inpeng.PNG', '2017-02-24 11:01:03', '2017-02-24 11:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `penggajians`
--

CREATE TABLE `penggajians` (
  `id` int(10) UNSIGNED NOT NULL,
  `tunjangan_pegawai_id` int(10) UNSIGNED DEFAULT NULL,
  `jumlah_uang_lembur` int(11) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `tanggal_pengambilan` date NOT NULL,
  `status_pengambilan` tinyint(1) NOT NULL DEFAULT '0',
  `petugas_penerima` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tunjangans`
--

CREATE TABLE `tunjangans` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_tunjangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_jabatan` int(10) UNSIGNED DEFAULT NULL,
  `id_golongan` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah_anak` int(11) NOT NULL,
  `besaran_uang` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tunjangans`
--

INSERT INTO `tunjangans` (`id`, `kode_tunjangan`, `id_jabatan`, `id_golongan`, `status`, `jumlah_anak`, `besaran_uang`, `created_at`, `updated_at`) VALUES
(1, 'k52', 4, 1, 'mblo', 0, 120000, '2017-02-18 15:19:47', '2017-02-18 15:19:47'),
(2, '12', 6, 2, 'Menikah', 12, 1000000, '2017-02-19 12:31:33', '2017-02-19 12:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `tunjangan_pegawais`
--

CREATE TABLE `tunjangan_pegawais` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_tunjangan_id` int(10) UNSIGNED DEFAULT NULL,
  `id_pegawai` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tunjangan_pegawais`
--

INSERT INTO `tunjangan_pegawais` (`id`, `kode_tunjangan_id`, `id_pegawai`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2017-02-19 13:04:45', '2017-02-19 13:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permission` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `permission`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rahul', 'Rahul29@gmail.com', '$2y$10$SXH9bIPk250kcIXzM6zw7Oi9PRp4rBbpt95V7eKcIopUSIPJgSEYW', 'Admin', NULL, '2017-02-10 11:55:32', '2017-02-10 11:55:32'),
(2, 'Rahuul', 'Rahul123@gmail.com', '$2y$10$EoXaCpcIZ9B9Pf0ZAwENe.QhnvkT.wCc8bww5jQtlk6SWQOJbAa5i', 'Admin', NULL, '2017-02-10 11:59:46', '2017-02-10 11:59:46'),
(3, 'ArianaGrande', 'Arianaa11@gmail.com', '$2y$10$2rRe.8lonUGhpHlyHohtCu5cLiM1UhTdfikg/JWwo94NhPMKz9d2y', 'Admin', NULL, '2017-02-10 12:28:13', '2017-02-10 12:28:13'),
(4, 'ArianaGrandee', 'Arianaa12@gmail.com', '$2y$10$FUUudh5SqbmDJ6HMYDLYj..xo1N48SCeiWcZt2AlSHT63NwbVBmcO', 'Admin', NULL, '2017-02-10 12:29:36', '2017-02-10 12:29:36'),
(5, 'ArianaG', 'Arianaa10@gmail.com', '$2y$10$6p9cxgKCuDvwKtgdl/mDzuQg.m9M470xBQcR0xveKtXwrDQFzp0GS', 'admin', NULL, '2017-02-10 12:33:41', '2017-02-10 12:33:41'),
(6, 'ArianaGrande1', 'Arianaa@gmail.com', '$2y$10$oijADgmsJO.LQQffZLEbqOCbYYCKs.EuYPJuSWv.6cMbO1WgI3EGG', 'admin', NULL, '2017-02-10 12:34:46', '2017-02-10 12:34:46'),
(7, 'ArianaGrande11', 'Arianaaa@gmail.com', '$2y$10$PX3aVvW2UiPUDB4y4cqcP.y9B5URzd1MVrUPtlcPPiWTl3kFaV0rW', 'admin', 'AJq84sww8jB9K59nV3Y0vTv50zI9DH1idQhvgGNWldCD6K2lSv1uhdcd7Lgc', '2017-02-10 12:36:42', '2017-02-24 11:01:29'),
(8, 'SilvyEkaPratiwi', 'Pratiwisilvy@gmail.com', '$2y$10$ZyVYKQVJw/3LI.Rnh5u6huFnEFP5UB6I.JsWct2NyLlDB3tA2Y.cC', 'HRD', NULL, '2017-02-24 11:01:03', '2017-02-24 11:01:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `golongans`
--
ALTER TABLE `golongans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `golongans_kode_golongan_unique` (`kode_golongan`);

--
-- Indexes for table `jabatans`
--
ALTER TABLE `jabatans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jabatans_kode_jabatan_unique` (`kode_jabatan`);

--
-- Indexes for table `kategori_lemburs`
--
ALTER TABLE `kategori_lemburs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategori_lemburs_kode_lembur_unique` (`kode_lembur`),
  ADD KEY `kategori_lemburs_id_jabatan_foreign` (`id_jabatan`),
  ADD KEY `kategori_lemburs_id_golongan_foreign` (`id_golongan`);

--
-- Indexes for table `lembur_pegawais`
--
ALTER TABLE `lembur_pegawais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lembur_pegawais_kode_lembur_id_foreign` (`kode_lembur_id`),
  ADD KEY `lembur_pegawais_id_pegawai_foreign` (`id_pegawai`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pegawais_nip_unique` (`nip`),
  ADD KEY `pegawais_id_user_foreign` (`id_user`),
  ADD KEY `pegawais_id_jabatan_foreign` (`id_jabatan`),
  ADD KEY `pegawais_id_golongan_foreign` (`id_golongan`);

--
-- Indexes for table `penggajians`
--
ALTER TABLE `penggajians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penggajians_tunjangan_pegawai_id_foreign` (`tunjangan_pegawai_id`);

--
-- Indexes for table `tunjangans`
--
ALTER TABLE `tunjangans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tunjangans_kode_tunjangan_unique` (`kode_tunjangan`),
  ADD KEY `tunjangans_id_jabatan_foreign` (`id_jabatan`),
  ADD KEY `tunjangans_id_golongan_foreign` (`id_golongan`);

--
-- Indexes for table `tunjangan_pegawais`
--
ALTER TABLE `tunjangan_pegawais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tunjangan_pegawais_kode_tunjangan_id_foreign` (`kode_tunjangan_id`),
  ADD KEY `tunjangan_pegawais_id_pegawai_foreign` (`id_pegawai`);

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
-- AUTO_INCREMENT for table `golongans`
--
ALTER TABLE `golongans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jabatans`
--
ALTER TABLE `jabatans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `kategori_lemburs`
--
ALTER TABLE `kategori_lemburs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lembur_pegawais`
--
ALTER TABLE `lembur_pegawais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pegawais`
--
ALTER TABLE `pegawais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `penggajians`
--
ALTER TABLE `penggajians`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tunjangans`
--
ALTER TABLE `tunjangans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tunjangan_pegawais`
--
ALTER TABLE `tunjangan_pegawais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategori_lemburs`
--
ALTER TABLE `kategori_lemburs`
  ADD CONSTRAINT `kategori_lemburs_id_golongan_foreign` FOREIGN KEY (`id_golongan`) REFERENCES `golongans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kategori_lemburs_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lembur_pegawais`
--
ALTER TABLE `lembur_pegawais`
  ADD CONSTRAINT `lembur_pegawais_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lembur_pegawais_kode_lembur_id_foreign` FOREIGN KEY (`kode_lembur_id`) REFERENCES `kategori_lemburs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD CONSTRAINT `pegawais_id_golongan_foreign` FOREIGN KEY (`id_golongan`) REFERENCES `golongans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawais_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawais_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penggajians`
--
ALTER TABLE `penggajians`
  ADD CONSTRAINT `penggajians_tunjangan_pegawai_id_foreign` FOREIGN KEY (`tunjangan_pegawai_id`) REFERENCES `tunjangan_pegawais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tunjangans`
--
ALTER TABLE `tunjangans`
  ADD CONSTRAINT `tunjangans_id_golongan_foreign` FOREIGN KEY (`id_golongan`) REFERENCES `golongans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tunjangans_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tunjangan_pegawais`
--
ALTER TABLE `tunjangan_pegawais`
  ADD CONSTRAINT `tunjangan_pegawais_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tunjangan_pegawais_kode_tunjangan_id_foreign` FOREIGN KEY (`kode_tunjangan_id`) REFERENCES `tunjangans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
