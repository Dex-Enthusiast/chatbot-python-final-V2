-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2025 at 04:07 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_bot`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int NOT NULL,
  `pertanyaan` varchar(255) DEFAULT NULL,
  `jawaban` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chatbot`
--

INSERT INTO `chatbot` (`id`, `pertanyaan`, `jawaban`) VALUES
(1, 'pemilik', 'Pemilik saya adalah Jack Vercetti'),
(2, 'halo', 'Hai juga! Apa ada yang bisa saya bantu? ^_^'),
(3, 'lokasi', 'Kantor kami berada di jl.Buah Batu, PT. Rekhatama'),
(4, 'bayar pakai', 'Kami menerima pembayaran via transfer bank, e-wallet, dana, gopay, dan kartu kredit'),
(5, 'cara booking', 'Kamu bisa booking langsung lewat website, aplikasi kami atau hubungi sales melalui WhatsApp, Hubungi : 08213****'),
(6, 'oh', 'Iyaa :)'),
(7, 'bayar nya pakai', 'Kami menerima pembayaran via transfer bank, e-wallet, dana, gopay, dan kartu kredit'),
(8, 'hi', 'Hi juga! Apa ada yang bisa saya bantu? ^_^'),
(9, 'hai', 'Hai juga! Apa ada yang bisa saya bantu? ^_^'),
(10, 'siapa kamu', 'Saya Evangeline, chatbot sederhana yang diciptakan oleh Jack Vicettra. Jika anda butuh sesuatu, saya akan berusaha sebisa mungkin untuk menjawab pertanyaan anda.'),
(11, 'kamu siapa', 'Saya Evangeline, chatbot sederhana yang diciptakan oleh Jack Vercetti. Jika anda butuh sesuatu, saya akan berusaha sebisa mungkin untuk menjawab pertanyaan anda :).'),
(12, 'list tempat', 'Untuk List Tempat Wisata yang Tersedia:\r\n1. Bali \r\n2. Yogyakarta \r\n3. Lombok \r\n4. Bandung \r\n5. Labuan Bajo\r\n'),
(13, 'list wisata', 'Untuk List Tempat Wisata yang Tersedia:\r\n1. Bali \r\n2. Yogyakarta \r\n3. Lombok \r\n4. Bandung \r\n5. Labuan Bajo\r\n'),
(14, 'list tempat wisata', 'Untuk List Tempat Wisata yang Tersedia:\r\n1. Bali \r\n2. Yogyakarta \r\n3. Lombok \r\n4. Bandung \r\n5. Labuan Bajo\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `paket_wisata`
--

CREATE TABLE `paket_wisata` (
  `id` int NOT NULL,
  `nama_paket` varchar(255) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `harga` int NOT NULL,
  `kontak_sales` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `paket_wisata`
--

INSERT INTO `paket_wisata` (`id`, `nama_paket`, `tempat`, `harga`, `kontak_sales`) VALUES
(1, 'paket merapi', 'merapi, jogja', 2500000, '29332'),
(2, 'Paket Bali', 'Bali', 5000000, '543210'),
(3, 'Paket Komodo', 'Pulau Komodo', 8000000, '12233445'),
(4, 'Paket Labuan Bajo', 'Labuan Bajo', 10000000, '23344556'),
(5, 'Paket Sultan', 'Eropa Barat', 100000000, '8877665'),
(6, 'Paket Hemat Bali', 'Bali', 2500000, '081234567891'),
(7, 'Paket Seru Jogja', 'Yogyakarta', 2800000, '081234567892'),
(8, 'Paket Cerdas Bandung', 'Bandung', 2700000, '081234567893'),
(36, 'Paket Murah A', 'Bandung', 1000000, '0811'),
(37, 'Paket Murah B', 'Semarang', 2000000, '0812'),
(38, 'Paket Sedang A', 'Lombok', 4000000, '0813'),
(39, 'Paket Sedang B', 'Malang', 4500000, '0814'),
(40, 'Paket Mahal A', 'Bali', 7000000, '0815'),
(41, 'Paket Mahal B', 'Labuan Bajo', 8000000, '0816');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket_wisata`
--
ALTER TABLE `paket_wisata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `paket_wisata`
--
ALTER TABLE `paket_wisata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
