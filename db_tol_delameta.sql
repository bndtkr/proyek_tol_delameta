-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 21, 2021 at 03:38 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tol_delameta`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_datasheet`
--

CREATE TABLE `tb_datasheet` (
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_golongan`
--

CREATE TABLE `tb_golongan` (
  `id_golongan` int(11) NOT NULL,
  `id_tol` int(11) NOT NULL,
  `tarif` int(100) NOT NULL,
  `nama_golongan` enum('golongan_1','golongan_2','golongan_3') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_golongan`
--

INSERT INTO `tb_golongan` (`id_golongan`, `id_tol`, `tarif`, `nama_golongan`) VALUES
(8, 813, 13000, 'golongan_1'),
(9, 813, 26000, 'golongan_2'),
(10, 812, 13000, 'golongan_1'),
(11, 812, 20000, 'golongan_2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_monitoring`
--

CREATE TABLE `tb_monitoring` (
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nomor_rfid` varchar(100) NOT NULL,
  `id_rfid` int(11) NOT NULL,
  `status` enum('Berhasil','Gagal','Tol','Saldo') NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `keterangan` enum('transaksi_berhasil','rfid_tidak_terdaftar','tol_tidak_terdaftar','saldo_tidak_cukup') NOT NULL,
  `tarif` int(100) NOT NULL,
  `saldo` int(100) NOT NULL,
  `nama_tol` varchar(100) NOT NULL,
  `palang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_monitoring`
--

INSERT INTO `tb_monitoring` (`tanggal`, `nomor_rfid`, `id_rfid`, `status`, `no_transaksi`, `id_pembayaran`, `keterangan`, `tarif`, `saldo`, `nama_tol`, `palang`) VALUES
('2021-12-21 13:59:47', 'Unknown', 4, 'Tol', 'Unknown', 0, 'tol_tidak_terdaftar', 0, 0, 'Unknown', 'tutup');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rfid`
--

CREATE TABLE `tb_rfid` (
  `id_rfid` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `foto_ktp` varchar(5000) NOT NULL,
  `saldo` int(11) NOT NULL,
  `nomor_rfid` varchar(100) NOT NULL,
  `nama_tol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_rfid`
--

INSERT INTO `tb_rfid` (`id_rfid`, `nama_lengkap`, `alamat`, `telepon`, `foto_ktp`, `saldo`, `nomor_rfid`, `nama_tol`) VALUES
(1, 'Kamal', 'Sudirman Central Business District', '087492475823', '', 2000, 'CFFD953', 'Tegal'),
(2, 'Benedetto', 'Jl. Joglo Raya No. 12', '081947588234', '', 1312000, '1ACE980', 'Tegal'),
(3, 'Liani', 'Buaran, Jakarta Timur, DKI Jakarta', '084200348593', '', 50000, 'AAAAC', 'Tegal'),
(4, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 0, 'Unknown', 'Unknown');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tol`
--

CREATE TABLE `tb_tol` (
  `id_tol` int(11) NOT NULL,
  `nama_tol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tol`
--

INSERT INTO `tb_tol` (`id_tol`, `nama_tol`) VALUES
(0, 'Unknown'),
(810, 'Yogyakarta'),
(811, 'Bawen'),
(812, 'Tegal'),
(813, 'Bogor');

-- --------------------------------------------------------

--
-- Table structure for table `tb_topup`
--

CREATE TABLE `tb_topup` (
  `id_topup` int(11) NOT NULL,
  `id_rfid` int(11) NOT NULL,
  `tanggal_topup` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nominal` int(100) NOT NULL,
  `status` enum('Berhasil','Gagal','Tunggu') NOT NULL,
  `no_topup` varchar(100) NOT NULL,
  `saldo_akhir` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_topup`
--

INSERT INTO `tb_topup` (`id_topup`, `id_rfid`, `tanggal_topup`, `nominal`, `status`, `no_topup`, `saldo_akhir`) VALUES
(12347, 1, '2021-12-16 21:50:07', 70000, 'Berhasil', 'INVTOPUP12021121740137', 210000),
(12348, 2, '2021-12-16 21:55:08', 200000, 'Gagal', 'INVTOPUP22021121745444', 0),
(12349, 2, '2021-12-16 21:55:48', 200000, 'Berhasil', 'INVTOPUP22021121745537', 5487000),
(12350, 3, '2021-12-16 22:11:40', 100000, 'Berhasil', 'INVTOPUP32021121751107', 126000),
(12351, 1, '2021-12-18 03:11:25', 100000, 'Berhasil', 'INVTOPUP120211218101111', 100000),
(12352, 3, '2021-12-21 01:51:18', 10000, 'Berhasil', 'INVTOPUP32021122185108', 40000),
(12353, 3, '2021-12-21 03:34:44', 10000, 'Berhasil', 'INVTOPUP320211221103435', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_tol`
--

CREATE TABLE `tb_transaksi_tol` (
  `id_pembayaran` int(11) NOT NULL,
  `id_tol` int(11) NOT NULL,
  `id_rfid` int(11) NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Berhasil','Gagal','Saldo','Tol') NOT NULL,
  `saldo_akhir` int(100) NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `keterangan` enum('transaksi_berhasil','saldo_tidak_cukup','rfid_tidak_terdaftar','tol_tidak_terdaftar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_transaksi_tol`
--

INSERT INTO `tb_transaksi_tol` (`id_pembayaran`, `id_tol`, `id_rfid`, `tanggal_transaksi`, `status`, `saldo_akhir`, `no_transaksi`, `keterangan`) VALUES
(4898, 0, 4, '2021-12-16 13:26:14', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4899, 813, 2, '2021-12-16 13:26:52', 'Berhasil', 5287000, 'INVTOL2813202652', 'transaksi_berhasil'),
(4900, 0, 4, '2021-12-16 15:03:52', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4901, 813, 3, '2021-12-16 15:04:19', 'Berhasil', 26000, 'INVTOL3813220419', 'transaksi_berhasil'),
(4902, 812, 2, '2021-12-16 23:37:28', 'Berhasil', 5487000, 'INVTOL281263728', 'transaksi_berhasil'),
(4903, 812, 2, '2021-12-16 23:39:14', 'Berhasil', 5487000, 'INVTOL281263914', 'transaksi_berhasil'),
(4904, 812, 2, '2021-12-16 23:39:19', 'Berhasil', 5487000, 'INVTOL281263919', 'transaksi_berhasil'),
(4905, 812, 2, '2021-12-16 23:41:51', 'Berhasil', 5475000, 'INVTOL281264151', 'transaksi_berhasil'),
(4906, 811, 2, '2021-12-16 23:45:21', 'Berhasil', 5464000, 'INVTOL281164521', 'transaksi_berhasil'),
(4907, 811, 2, '2021-12-16 23:46:18', 'Berhasil', 5453000, 'INVTOL281164618', 'transaksi_berhasil'),
(4908, 812, 3, '2021-12-17 01:06:23', 'Berhasil', 126000, 'INVTOL381280623', 'transaksi_berhasil'),
(4909, 0, 4, '2021-12-18 02:50:34', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4910, 0, 4, '2021-12-18 02:52:41', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4911, 0, 4, '2021-12-18 02:55:36', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4912, 0, 4, '2021-12-18 02:57:54', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4913, 813, 2, '2021-12-18 02:58:49', 'Berhasil', 5440000, 'INVTOL2813895849', 'transaksi_berhasil'),
(4914, 0, 4, '2021-12-18 02:59:01', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4915, 813, 2, '2021-12-18 02:59:11', 'Berhasil', 5427000, 'INVTOL2813895911', 'transaksi_berhasil'),
(4916, 813, 2, '2021-12-18 03:03:02', 'Berhasil', 5414000, 'INVTOL28138100302', 'transaksi_berhasil'),
(4917, 813, 1, '2021-12-18 03:03:27', 'Gagal', 10000, 'Unknown', 'transaksi_berhasil'),
(4918, 813, 1, '2021-12-18 03:07:43', 'Gagal', 10000, 'Unknown', 'transaksi_berhasil'),
(4919, 811, 1, '2021-12-18 03:07:55', 'Gagal', 10000, 'Unknown', 'transaksi_berhasil'),
(4920, 811, 1, '2021-12-18 03:08:25', 'Gagal', 10000, 'Unknown', 'transaksi_berhasil'),
(4921, 811, 1, '2021-12-18 03:10:37', 'Berhasil', 0, 'INVTOL18115101037', 'transaksi_berhasil'),
(4922, 811, 1, '2021-12-18 03:10:43', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4923, 811, 1, '2021-12-18 03:12:06', 'Berhasil', 90000, 'INVTOL18115101206', 'transaksi_berhasil'),
(4924, 0, 4, '2021-12-18 03:14:25', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4925, 811, 1, '2021-12-18 03:18:30', 'Berhasil', 80000, 'INVTOL18115101830', 'transaksi_berhasil'),
(4926, 811, 1, '2021-12-18 03:19:10', 'Berhasil', 70000, 'INVTOL18115101910', 'transaksi_berhasil'),
(4927, 811, 1, '2021-12-18 03:21:46', 'Berhasil', 60000, 'INVTOL18115102146', 'transaksi_berhasil'),
(4928, 0, 4, '2021-12-18 03:23:59', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4929, 0, 4, '2021-12-18 03:24:09', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4930, 811, 1, '2021-12-18 03:24:15', 'Berhasil', 50000, 'INVTOL18115102415', 'transaksi_berhasil'),
(4931, 812, 1, '2021-12-18 03:24:26', 'Berhasil', 38000, 'INVTOL181210102426', 'transaksi_berhasil'),
(4932, 0, 4, '2021-12-18 03:24:38', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4933, 812, 3, '2021-12-18 03:24:48', 'Berhasil', 114000, 'INVTOL381210102448', 'transaksi_berhasil'),
(4934, 0, 4, '2021-12-18 03:25:05', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4935, 0, 4, '2021-12-18 03:25:32', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4936, 812, 1, '2021-12-18 03:25:37', 'Berhasil', 26000, 'INVTOL181210102537', 'transaksi_berhasil'),
(4937, 812, 1, '2021-12-18 03:25:39', 'Berhasil', 14000, 'INVTOL181210102539', 'transaksi_berhasil'),
(4938, 812, 1, '2021-12-18 03:25:40', 'Berhasil', 2000, 'INVTOL181210102540', 'transaksi_berhasil'),
(4939, 812, 1, '2021-12-18 03:25:43', 'Gagal', 2000, 'Unknown', 'transaksi_berhasil'),
(4940, 812, 1, '2021-12-18 03:25:52', 'Gagal', 2000, 'Unknown', 'transaksi_berhasil'),
(4941, 0, 4, '2021-12-18 04:58:01', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4942, 812, 2, '2021-12-18 04:58:12', 'Berhasil', 5402000, 'INVTOL281210115812', 'transaksi_berhasil'),
(4943, 812, 2, '2021-12-18 04:58:26', 'Berhasil', 5390000, 'INVTOL281210115826', 'transaksi_berhasil'),
(4944, 812, 2, '2021-12-18 05:00:26', 'Berhasil', 5378000, 'INVTOL281210120026', 'transaksi_berhasil'),
(4945, 0, 4, '2021-12-18 05:00:37', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4946, 812, 2, '2021-12-18 05:01:30', 'Berhasil', 5366000, 'INVTOL281210120130', 'transaksi_berhasil'),
(4947, 0, 4, '2021-12-18 05:02:32', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4948, 0, 4, '2021-12-18 05:03:48', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4949, 812, 2, '2021-12-18 05:15:49', 'Berhasil', 5354000, 'INVTOL281210121549', 'transaksi_berhasil'),
(4950, 0, 4, '2021-12-18 05:17:15', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4951, 812, 2, '2021-12-18 05:17:20', 'Berhasil', 5342000, 'INVTOL281210121720', 'transaksi_berhasil'),
(4952, 812, 2, '2021-12-18 05:17:27', 'Berhasil', 5330000, 'INVTOL281210121727', 'transaksi_berhasil'),
(4953, 812, 2, '2021-12-18 05:19:38', 'Berhasil', 5318000, 'INVTOL281210121938', 'transaksi_berhasil'),
(4954, 0, 4, '2021-12-18 05:20:22', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4955, 812, 2, '2021-12-18 05:20:28', 'Berhasil', 5306000, 'INVTOL281210122028', 'transaksi_berhasil'),
(4956, 0, 4, '2021-12-18 05:20:39', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4957, 812, 2, '2021-12-18 05:21:11', 'Berhasil', 5294000, 'INVTOL281210122111', 'transaksi_berhasil'),
(4958, 812, 2, '2021-12-18 05:21:25', 'Berhasil', 5282000, 'INVTOL281210122125', 'transaksi_berhasil'),
(4959, 0, 4, '2021-12-18 05:21:37', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4960, 812, 2, '2021-12-18 05:21:44', 'Berhasil', 5270000, 'INVTOL281210122144', 'transaksi_berhasil'),
(4961, 0, 4, '2021-12-18 05:22:18', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4962, 812, 2, '2021-12-18 05:23:10', 'Berhasil', 5258000, 'INVTOL281210122310', 'transaksi_berhasil'),
(4963, 0, 4, '2021-12-18 05:33:43', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4964, 0, 4, '2021-12-18 05:35:02', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4965, 0, 4, '2021-12-18 05:35:36', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4966, 0, 4, '2021-12-18 05:37:33', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4967, 0, 4, '2021-12-18 05:37:40', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4968, 0, 4, '2021-12-18 05:37:40', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4969, 0, 4, '2021-12-18 05:39:37', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4970, 0, 4, '2021-12-18 05:40:29', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4971, 0, 4, '2021-12-18 05:40:37', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4972, 0, 4, '2021-12-18 05:41:02', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4973, 0, 4, '2021-12-18 05:41:06', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4974, 0, 4, '2021-12-18 05:41:23', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4975, 0, 4, '2021-12-18 05:44:00', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4976, 0, 4, '2021-12-18 05:44:32', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4977, 0, 4, '2021-12-18 06:15:05', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4978, 0, 4, '2021-12-18 06:16:23', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4979, 0, 4, '2021-12-18 06:16:34', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4980, 0, 4, '2021-12-18 06:53:57', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4981, 812, 2, '2021-12-18 06:55:27', 'Berhasil', 5238000, 'INVTOL281211135527', 'transaksi_berhasil'),
(4982, 812, 2, '2021-12-18 06:56:11', 'Berhasil', 5226000, 'INVTOL281210135611', 'transaksi_berhasil'),
(4983, 812, 2, '2021-12-18 06:59:17', 'Berhasil', 5206000, 'INVTOL281211135917', 'transaksi_berhasil'),
(4984, 812, 2, '2021-12-18 07:00:59', 'Berhasil', 5194000, 'INVTOL281210140059', 'transaksi_berhasil'),
(4985, 812, 2, '2021-12-18 07:02:41', 'Berhasil', 5174000, 'INVTOL281211140241', 'transaksi_berhasil'),
(4986, 812, 2, '2021-12-18 07:08:02', 'Berhasil', 5154000, 'INVTOL281211140802', 'transaksi_berhasil'),
(4987, 812, 2, '2021-12-18 07:11:38', 'Berhasil', 5142000, 'INVTOL281210141138', 'transaksi_berhasil'),
(4988, 812, 2, '2021-12-18 07:13:16', 'Berhasil', 5130000, 'INVTOL281210141316', 'transaksi_berhasil'),
(4989, 812, 2, '2021-12-18 07:14:42', 'Berhasil', 5110000, 'INVTOL281211141442', 'transaksi_berhasil'),
(4990, 812, 2, '2021-12-18 07:16:36', 'Berhasil', 5090000, 'INVTOL281211141636', 'transaksi_berhasil'),
(4991, 812, 2, '2021-12-18 07:19:24', 'Berhasil', 5070000, 'INVTOL281211141924', 'transaksi_berhasil'),
(4992, 812, 2, '2021-12-18 07:21:36', 'Berhasil', 5050000, 'INVTOL281211142136', 'transaksi_berhasil'),
(4993, 812, 2, '2021-12-18 07:23:45', 'Berhasil', 5030000, 'INVTOL281211142345', 'transaksi_berhasil'),
(4994, 812, 2, '2021-12-18 07:24:57', 'Berhasil', 5010000, 'INVTOL281211142457', 'transaksi_berhasil'),
(4995, 812, 2, '2021-12-18 07:26:34', 'Berhasil', 4990000, 'INVTOL281211142634', 'transaksi_berhasil'),
(4996, 812, 2, '2021-12-18 07:29:52', 'Berhasil', 4978000, 'INVTOL281210142952', 'transaksi_berhasil'),
(4997, 0, 4, '2021-12-18 07:34:50', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(4998, 812, 2, '2021-12-18 07:36:21', 'Berhasil', 4966000, 'INVTOL281210143621', 'transaksi_berhasil'),
(4999, 812, 2, '2021-12-18 07:37:08', 'Berhasil', 4946000, 'INVTOL281211143708', 'transaksi_berhasil'),
(5000, 812, 2, '2021-12-18 07:38:42', 'Berhasil', 4926000, 'INVTOL281211143842', 'transaksi_berhasil'),
(5001, 812, 2, '2021-12-18 07:40:09', 'Berhasil', 4906000, 'INVTOL281211144009', 'transaksi_berhasil'),
(5002, 812, 2, '2021-12-18 07:43:12', 'Berhasil', 4886000, 'INVTOL281211144312', 'transaksi_berhasil'),
(5003, 812, 2, '2021-12-18 07:43:30', 'Berhasil', 4866000, 'INVTOL281211144330', 'transaksi_berhasil'),
(5004, 812, 2, '2021-12-18 07:43:57', 'Berhasil', 4854000, 'INVTOL281210144357', 'transaksi_berhasil'),
(5005, 812, 2, '2021-12-18 07:44:39', 'Berhasil', 4834000, 'INVTOL281211144439', 'transaksi_berhasil'),
(5006, 0, 4, '2021-12-18 07:45:03', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(5007, 812, 2, '2021-12-18 07:49:28', 'Berhasil', 4814000, 'INVTOL281211144928', 'transaksi_berhasil'),
(5008, 812, 2, '2021-12-18 07:50:29', 'Berhasil', 4802000, 'INVTOL281210145029', 'transaksi_berhasil'),
(5009, 0, 4, '2021-12-18 07:51:27', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(5010, 812, 3, '2021-12-18 08:04:16', 'Berhasil', 66000, 'INVTOL381210150416', 'transaksi_berhasil'),
(5011, 812, 2, '2021-12-18 08:04:31', 'Berhasil', 4766000, 'INVTOL281210150431', 'transaksi_berhasil'),
(5012, 812, 2, '2021-12-18 08:05:15', 'Berhasil', 4746000, 'INVTOL281211150515', 'transaksi_berhasil'),
(5013, 812, 2, '2021-12-18 08:06:49', 'Berhasil', 4726000, 'INVTOL281211150649', 'transaksi_berhasil'),
(5014, 812, 2, '2021-12-18 08:09:11', 'Berhasil', 4706000, 'INVTOL281211150911', 'transaksi_berhasil'),
(5015, 812, 2, '2021-12-18 08:09:57', 'Berhasil', 4686000, 'INVTOL281211150957', 'transaksi_berhasil'),
(5016, 812, 2, '2021-12-18 08:11:00', 'Berhasil', 4666000, 'INVTOL281211151100', 'transaksi_berhasil'),
(5017, 812, 2, '2021-12-18 08:13:36', 'Berhasil', 4646000, 'INVTOL281211151336', 'transaksi_berhasil'),
(5018, 0, 4, '2021-12-18 08:15:06', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(5019, 812, 3, '2021-12-18 08:17:07', 'Berhasil', 54000, 'INVTOL381210151707', 'transaksi_berhasil'),
(5020, 0, 4, '2021-12-18 08:17:16', 'Gagal', 0, 'Unknown', 'transaksi_berhasil'),
(5021, 812, 3, '2021-12-18 08:22:09', 'Berhasil', 42000, 'INVTOL381210152209', 'transaksi_berhasil'),
(5022, 812, 2, '2021-12-18 08:24:14', 'Berhasil', 4634000, 'INVTOL281210152414', 'transaksi_berhasil'),
(5023, 0, 4, '2021-12-18 08:24:25', 'Gagal', 0, 'Unknown', 'tol_tidak_terdaftar'),
(5024, 0, 4, '2021-12-18 08:24:34', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5025, 0, 4, '2021-12-18 08:24:46', 'Gagal', 0, 'Unknown', 'tol_tidak_terdaftar'),
(5026, 812, 1, '2021-12-18 08:25:08', 'Gagal', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5027, 0, 4, '2021-12-18 08:26:14', 'Gagal', 0, 'Unknown', 'tol_tidak_terdaftar'),
(5028, 0, 4, '2021-12-18 08:28:15', 'Gagal', 0, 'Unknown', 'tol_tidak_terdaftar'),
(5029, 812, 2, '2021-12-18 08:30:17', 'Berhasil', 4614000, 'INVTOL281211153017', 'transaksi_berhasil'),
(5030, 812, 2, '2021-12-18 08:33:41', 'Berhasil', 4594000, 'INVTOL281211153341', 'transaksi_berhasil'),
(5031, 812, 2, '2021-12-18 08:35:00', 'Berhasil', 4574000, 'INVTOL281211153500', 'transaksi_berhasil'),
(5032, 812, 2, '2021-12-18 08:36:29', 'Berhasil', 4562000, 'INVTOL281210153629', 'transaksi_berhasil'),
(5033, 812, 2, '2021-12-18 08:37:11', 'Berhasil', 4550000, 'INVTOL281210153711', 'transaksi_berhasil'),
(5034, 812, 2, '2021-12-18 08:38:01', 'Berhasil', 4538000, 'INVTOL281210153801', 'transaksi_berhasil'),
(5035, 812, 2, '2021-12-18 08:39:06', 'Berhasil', 4518000, 'INVTOL281211153906', 'transaksi_berhasil'),
(5036, 812, 2, '2021-12-18 08:39:51', 'Berhasil', 4506000, 'INVTOL281210153951', 'transaksi_berhasil'),
(5037, 812, 1, '2021-12-18 08:45:09', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5038, 812, 3, '2021-12-18 08:45:14', 'Berhasil', 30000, 'INVTOL381210154514', 'transaksi_berhasil'),
(5039, 0, 4, '2021-12-18 08:45:19', 'Tol', 0, 'Unknown', 'tol_tidak_terdaftar'),
(5040, 0, 4, '2021-12-18 08:45:24', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5041, 812, 2, '2021-12-18 08:47:23', 'Berhasil', 4494000, 'INVTOL281210154723', 'transaksi_berhasil'),
(5042, 0, 4, '2021-12-18 08:47:35', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5043, 0, 4, '2021-12-18 08:48:39', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5044, 812, 2, '2021-12-18 08:49:04', 'Berhasil', 4482000, 'INVTOL281210154904', 'transaksi_berhasil'),
(5045, 812, 2, '2021-12-18 08:49:52', 'Berhasil', 4470000, 'INVTOL281210154952', 'transaksi_berhasil'),
(5046, 812, 2, '2021-12-18 08:50:05', 'Berhasil', 4450000, 'INVTOL281211155005', 'transaksi_berhasil'),
(5047, 0, 4, '2021-12-18 08:50:21', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5048, 812, 2, '2021-12-18 08:51:17', 'Berhasil', 4430000, 'INVTOL281211155117', 'transaksi_berhasil'),
(5049, 812, 2, '2021-12-18 08:51:58', 'Berhasil', 4410000, 'INVTOL281211155158', 'transaksi_berhasil'),
(5050, 0, 4, '2021-12-18 08:52:11', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5051, 812, 2, '2021-12-18 08:52:51', 'Berhasil', 4398000, 'INVTOL281210155251', 'transaksi_berhasil'),
(5052, 812, 2, '2021-12-18 08:53:04', 'Berhasil', 4386000, 'INVTOL281210155304', 'transaksi_berhasil'),
(5053, 0, 4, '2021-12-18 08:54:53', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5054, 812, 2, '2021-12-18 08:55:54', 'Berhasil', 4366000, 'INVTOL281211155554', 'transaksi_berhasil'),
(5055, 0, 4, '2021-12-18 08:56:05', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5056, 812, 1, '2021-12-18 08:56:20', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5057, 812, 2, '2021-12-18 08:56:34', 'Berhasil', 4346000, 'INVTOL281211155634', 'transaksi_berhasil'),
(5058, 812, 1, '2021-12-18 08:57:03', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5059, 812, 2, '2021-12-18 08:57:10', 'Berhasil', 4334000, 'INVTOL281210155710', 'transaksi_berhasil'),
(5060, 0, 4, '2021-12-18 08:57:27', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5061, 812, 2, '2021-12-18 08:57:46', 'Berhasil', 4322000, 'INVTOL281210155746', 'transaksi_berhasil'),
(5062, 812, 2, '2021-12-18 08:59:19', 'Berhasil', 4310000, 'INVTOL281210155919', 'transaksi_berhasil'),
(5063, 0, 4, '2021-12-18 08:59:34', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5064, 812, 1, '2021-12-18 08:59:40', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5065, 812, 2, '2021-12-18 08:59:45', 'Berhasil', 4298000, 'INVTOL281210155945', 'transaksi_berhasil'),
(5066, 812, 2, '2021-12-18 09:00:18', 'Berhasil', 4286000, 'INVTOL281210160018', 'transaksi_berhasil'),
(5067, 0, 4, '2021-12-18 09:00:50', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5068, 812, 1, '2021-12-18 09:00:54', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5069, 812, 1, '2021-12-18 09:01:00', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5070, 0, 4, '2021-12-18 09:01:03', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5071, 812, 2, '2021-12-18 09:01:07', 'Berhasil', 4274000, 'INVTOL281210160107', 'transaksi_berhasil'),
(5072, 812, 2, '2021-12-18 09:01:57', 'Berhasil', 4262000, 'INVTOL281210160157', 'transaksi_berhasil'),
(5073, 812, 1, '2021-12-18 09:02:19', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5074, 812, 2, '2021-12-18 09:03:31', 'Berhasil', 4242000, 'INVTOL281211160331', 'transaksi_berhasil'),
(5075, 812, 1, '2021-12-18 09:06:39', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5076, 812, 2, '2021-12-18 09:06:47', 'Berhasil', 4230000, 'INVTOL281210160647', 'transaksi_berhasil'),
(5077, 812, 1, '2021-12-18 09:07:13', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5078, 812, 1, '2021-12-18 09:07:16', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5079, 812, 1, '2021-12-18 09:07:19', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5080, 812, 1, '2021-12-18 09:07:22', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5081, 0, 4, '2021-12-18 09:07:31', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5082, 812, 2, '2021-12-18 09:07:34', 'Berhasil', 4210000, 'INVTOL281211160734', 'transaksi_berhasil'),
(5083, 0, 4, '2021-12-18 09:20:20', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5084, 812, 1, '2021-12-18 09:23:00', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5085, 812, 2, '2021-12-18 09:23:13', 'Berhasil', 4190000, 'INVTOL281211162313', 'transaksi_berhasil'),
(5086, 0, 4, '2021-12-18 09:23:28', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5087, 812, 1, '2021-12-18 09:23:48', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5088, 812, 1, '2021-12-18 09:24:36', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5089, 812, 2, '2021-12-18 09:24:47', 'Berhasil', 4170000, 'INVTOL281211162447', 'transaksi_berhasil'),
(5090, 812, 1, '2021-12-18 09:27:38', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5091, 0, 4, '2021-12-18 09:27:45', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5092, 812, 2, '2021-12-18 09:27:54', 'Berhasil', 4150000, 'INVTOL281211162754', 'transaksi_berhasil'),
(5093, 0, 4, '2021-12-18 09:33:07', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5094, 812, 1, '2021-12-18 09:34:08', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5095, 0, 4, '2021-12-18 09:34:15', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5096, 812, 2, '2021-12-18 09:34:23', 'Berhasil', 4130000, 'INVTOL281211163423', 'transaksi_berhasil'),
(5097, 812, 1, '2021-12-18 09:35:50', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5098, 0, 4, '2021-12-18 09:35:58', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5099, 812, 2, '2021-12-18 09:36:04', 'Berhasil', 4118000, 'INVTOL281210163604', 'transaksi_berhasil'),
(5100, 0, 4, '2021-12-18 09:37:10', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5101, 812, 2, '2021-12-18 09:37:15', 'Berhasil', 4098000, 'INVTOL281211163715', 'transaksi_berhasil'),
(5102, 812, 2, '2021-12-18 09:38:09', 'Berhasil', 4078000, 'INVTOL281211163809', 'transaksi_berhasil'),
(5103, 812, 2, '2021-12-18 09:38:29', 'Berhasil', 4066000, 'INVTOL281210163829', 'transaksi_berhasil'),
(5104, 812, 1, '2021-12-18 09:38:41', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5105, 0, 4, '2021-12-18 09:38:49', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5106, 812, 2, '2021-12-18 09:38:54', 'Berhasil', 4046000, 'INVTOL281211163854', 'transaksi_berhasil'),
(5107, 812, 1, '2021-12-18 10:37:39', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5108, 0, 4, '2021-12-18 10:37:47', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5109, 812, 2, '2021-12-18 10:37:51', 'Berhasil', 4026000, 'INVTOL281211173751', 'transaksi_berhasil'),
(5110, 812, 1, '2021-12-18 10:38:57', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5111, 812, 1, '2021-12-18 10:39:06', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5112, 0, 4, '2021-12-18 10:39:13', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5113, 0, 4, '2021-12-18 10:39:17', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5114, 0, 4, '2021-12-18 10:39:21', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5115, 0, 4, '2021-12-18 10:39:21', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5116, 0, 4, '2021-12-18 10:39:25', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5117, 0, 4, '2021-12-18 10:39:29', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5118, 0, 4, '2021-12-18 10:39:36', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5119, 0, 4, '2021-12-18 10:39:39', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5120, 812, 2, '2021-12-18 10:39:42', 'Berhasil', 4014000, 'INVTOL281210173942', 'transaksi_berhasil'),
(5121, 0, 4, '2021-12-18 10:39:56', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5122, 0, 4, '2021-12-18 10:40:23', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5123, 812, 2, '2021-12-18 10:40:28', 'Berhasil', 3994000, 'INVTOL281211174028', 'transaksi_berhasil'),
(5124, 812, 2, '2021-12-18 10:41:17', 'Berhasil', 3974000, 'INVTOL281211174117', 'transaksi_berhasil'),
(5125, 812, 1, '2021-12-18 10:41:31', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5126, 812, 1, '2021-12-18 10:41:34', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5127, 812, 1, '2021-12-18 10:41:46', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5128, 812, 2, '2021-12-18 10:41:59', 'Berhasil', 3954000, 'INVTOL281211174159', 'transaksi_berhasil'),
(5129, 812, 1, '2021-12-18 10:43:03', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5130, 812, 2, '2021-12-18 10:43:06', 'Berhasil', 3934000, 'INVTOL281211174306', 'transaksi_berhasil'),
(5131, 0, 4, '2021-12-18 10:45:13', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5132, 812, 1, '2021-12-18 10:45:18', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5133, 0, 4, '2021-12-18 10:45:39', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5134, 0, 4, '2021-12-18 10:45:43', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5135, 0, 4, '2021-12-18 10:45:46', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5136, 812, 1, '2021-12-18 10:45:52', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5137, 812, 2, '2021-12-18 10:46:01', 'Berhasil', 3914000, 'INVTOL281211174601', 'transaksi_berhasil'),
(5138, 812, 2, '2021-12-18 10:46:26', 'Berhasil', 3894000, 'INVTOL281211174626', 'transaksi_berhasil'),
(5139, 812, 2, '2021-12-18 10:46:47', 'Berhasil', 3874000, 'INVTOL281211174647', 'transaksi_berhasil'),
(5140, 812, 1, '2021-12-18 10:47:02', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5141, 0, 4, '2021-12-18 10:47:06', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5142, 812, 1, '2021-12-18 10:47:10', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5143, 0, 4, '2021-12-18 10:47:47', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5144, 812, 1, '2021-12-18 10:47:53', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5145, 812, 2, '2021-12-18 10:47:58', 'Berhasil', 3854000, 'INVTOL281211174758', 'transaksi_berhasil'),
(5146, 0, 4, '2021-12-18 11:18:37', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5147, 812, 1, '2021-12-18 11:18:44', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5148, 812, 2, '2021-12-18 11:41:05', 'Berhasil', 3834000, 'INVTOL281211184105', 'transaksi_berhasil'),
(5149, 812, 2, '2021-12-18 11:41:59', 'Berhasil', 3814000, 'INVTOL281211184159', 'transaksi_berhasil'),
(5150, 0, 4, '2021-12-18 11:42:15', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5151, 812, 1, '2021-12-18 11:42:55', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5152, 812, 1, '2021-12-18 11:43:02', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5153, 812, 2, '2021-12-18 11:43:07', 'Berhasil', 3802000, 'INVTOL281210184307', 'transaksi_berhasil'),
(5154, 812, 1, '2021-12-18 11:43:53', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5155, 0, 4, '2021-12-18 11:45:32', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5156, 812, 2, '2021-12-18 11:45:43', 'Berhasil', 3782000, 'INVTOL281211184543', 'transaksi_berhasil'),
(5157, 812, 2, '2021-12-18 11:45:44', 'Berhasil', 3762000, 'INVTOL281211184544', 'transaksi_berhasil'),
(5158, 812, 2, '2021-12-18 12:07:11', 'Berhasil', 3742000, 'INVTOL281211190711', 'transaksi_berhasil'),
(5159, 812, 2, '2021-12-18 12:09:03', 'Berhasil', 3722000, 'INVTOL281211190903', 'transaksi_berhasil'),
(5160, 812, 2, '2021-12-19 05:02:01', 'Berhasil', 3702000, 'INVTOL281211120201', 'transaksi_berhasil'),
(5161, 0, 4, '2021-12-19 05:05:17', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5162, 812, 1, '2021-12-19 05:05:23', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5163, 812, 2, '2021-12-19 05:05:29', 'Berhasil', 3690000, 'INVTOL281210120529', 'transaksi_berhasil'),
(5164, 0, 4, '2021-12-19 05:06:31', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5165, 812, 2, '2021-12-19 05:06:36', 'Berhasil', 3678000, 'INVTOL281210120636', 'transaksi_berhasil'),
(5166, 812, 1, '2021-12-19 05:06:41', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5167, 812, 1, '2021-12-19 05:07:41', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5168, 0, 4, '2021-12-19 05:07:46', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5169, 812, 2, '2021-12-19 05:07:51', 'Berhasil', 3666000, 'INVTOL281210120751', 'transaksi_berhasil'),
(5170, 812, 2, '2021-12-19 05:07:55', 'Berhasil', 3654000, 'INVTOL281210120755', 'transaksi_berhasil'),
(5171, 812, 2, '2021-12-19 05:07:57', 'Berhasil', 3642000, 'INVTOL281210120757', 'transaksi_berhasil'),
(5172, 812, 2, '2021-12-19 05:08:43', 'Berhasil', 3630000, 'INVTOL281210120843', 'transaksi_berhasil'),
(5173, 812, 2, '2021-12-19 05:09:24', 'Berhasil', 3618000, 'INVTOL281210120924', 'transaksi_berhasil'),
(5174, 0, 4, '2021-12-19 05:09:43', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5175, 812, 1, '2021-12-19 05:09:49', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5176, 812, 1, '2021-12-19 05:09:55', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5177, 0, 4, '2021-12-19 05:10:03', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5178, 812, 2, '2021-12-19 05:19:20', 'Berhasil', 3598000, 'INVTOL281211121920', 'transaksi_berhasil'),
(5179, 812, 2, '2021-12-19 05:20:24', 'Berhasil', 3586000, 'INVTOL281210122024', 'transaksi_berhasil'),
(5180, 812, 2, '2021-12-19 05:24:02', 'Berhasil', 3574000, 'INVTOL281210122402', 'transaksi_berhasil'),
(5181, 812, 2, '2021-12-19 05:24:25', 'Berhasil', 3562000, 'INVTOL281210122425', 'transaksi_berhasil'),
(5182, 812, 2, '2021-12-19 05:27:05', 'Berhasil', 3542000, 'INVTOL281211122705', 'transaksi_berhasil'),
(5183, 812, 2, '2021-12-19 05:27:32', 'Berhasil', 3530000, 'INVTOL281210122732', 'transaksi_berhasil'),
(5184, 0, 4, '2021-12-19 05:28:02', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5185, 0, 4, '2021-12-19 05:30:07', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5186, 812, 1, '2021-12-19 05:30:12', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5187, 812, 2, '2021-12-19 05:30:15', 'Berhasil', 3518000, 'INVTOL281210123015', 'transaksi_berhasil'),
(5188, 812, 2, '2021-12-19 05:30:32', 'Berhasil', 3506000, 'INVTOL281210123032', 'transaksi_berhasil'),
(5189, 812, 2, '2021-12-19 05:57:06', 'Berhasil', 3486000, 'INVTOL281211125706', 'transaksi_berhasil'),
(5190, 812, 2, '2021-12-19 05:58:12', 'Berhasil', 3466000, 'INVTOL281211125812', 'transaksi_berhasil'),
(5191, 0, 4, '2021-12-19 06:44:41', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5192, 812, 2, '2021-12-19 06:44:48', 'Berhasil', 3454000, 'INVTOL281210134448', 'transaksi_berhasil'),
(5193, 812, 2, '2021-12-19 06:56:13', 'Berhasil', 3434000, 'INVTOL281211135613', 'transaksi_berhasil'),
(5194, 812, 2, '2021-12-19 06:56:14', 'Berhasil', 3414000, 'INVTOL281211135614', 'transaksi_berhasil'),
(5195, 812, 2, '2021-12-19 06:56:41', 'Berhasil', 3394000, 'INVTOL281211135641', 'transaksi_berhasil'),
(5196, 0, 4, '2021-12-19 06:56:58', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5197, 812, 1, '2021-12-19 06:57:04', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5198, 0, 4, '2021-12-19 06:57:20', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5199, 812, 1, '2021-12-19 06:57:27', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5200, 812, 2, '2021-12-19 06:58:17', 'Berhasil', 3374000, 'INVTOL281211135817', 'transaksi_berhasil'),
(5201, 812, 2, '2021-12-19 06:58:36', 'Berhasil', 3354000, 'INVTOL281211135836', 'transaksi_berhasil'),
(5202, 812, 2, '2021-12-19 06:59:38', 'Berhasil', 3334000, 'INVTOL281211135938', 'transaksi_berhasil'),
(5203, 812, 1, '2021-12-19 07:00:25', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5204, 0, 4, '2021-12-19 07:00:45', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5205, 812, 1, '2021-12-19 07:03:24', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5206, 0, 4, '2021-12-19 07:03:32', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5207, 812, 2, '2021-12-19 07:03:58', 'Berhasil', 3314000, 'INVTOL281211140358', 'transaksi_berhasil'),
(5208, 812, 1, '2021-12-19 07:04:07', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5209, 812, 1, '2021-12-19 07:04:52', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5210, 0, 4, '2021-12-19 07:04:57', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5211, 812, 2, '2021-12-19 07:05:03', 'Berhasil', 3302000, 'INVTOL281210140503', 'transaksi_berhasil'),
(5212, 812, 1, '2021-12-19 07:06:17', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5213, 812, 2, '2021-12-19 07:09:32', 'Berhasil', 3282000, 'INVTOL281211140932', 'transaksi_berhasil'),
(5214, 0, 4, '2021-12-19 07:10:01', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5215, 0, 4, '2021-12-19 07:13:19', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5216, 812, 1, '2021-12-19 07:13:27', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5217, 812, 2, '2021-12-19 07:13:42', 'Berhasil', 3270000, 'INVTOL281210141342', 'transaksi_berhasil'),
(5218, 812, 2, '2021-12-19 07:15:42', 'Berhasil', 3250000, 'INVTOL281211141542', 'transaksi_berhasil'),
(5219, 0, 4, '2021-12-19 07:16:01', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5220, 812, 1, '2021-12-19 07:16:08', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5221, 812, 2, '2021-12-19 07:16:19', 'Berhasil', 3230000, 'INVTOL281211141619', 'transaksi_berhasil'),
(5222, 812, 2, '2021-12-19 07:16:39', 'Berhasil', 3210000, 'INVTOL281211141639', 'transaksi_berhasil'),
(5223, 812, 1, '2021-12-19 07:17:05', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5224, 0, 4, '2021-12-19 07:17:10', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5225, 812, 2, '2021-12-19 07:17:15', 'Berhasil', 3198000, 'INVTOL281210141715', 'transaksi_berhasil'),
(5226, 812, 2, '2021-12-19 07:17:25', 'Berhasil', 3186000, 'INVTOL281210141725', 'transaksi_berhasil'),
(5227, 812, 1, '2021-12-19 07:17:39', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5228, 812, 1, '2021-12-19 07:17:46', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5229, 812, 2, '2021-12-19 07:17:50', 'Berhasil', 3166000, 'INVTOL281211141750', 'transaksi_berhasil'),
(5230, 0, 4, '2021-12-19 07:18:02', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5231, 812, 1, '2021-12-19 07:18:07', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5232, 0, 4, '2021-12-19 07:18:16', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5233, 812, 2, '2021-12-19 07:18:20', 'Berhasil', 3146000, 'INVTOL281211141820', 'transaksi_berhasil'),
(5234, 0, 4, '2021-12-19 07:18:37', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5235, 812, 1, '2021-12-19 07:18:41', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5236, 812, 2, '2021-12-19 07:18:45', 'Berhasil', 3134000, 'INVTOL281210141845', 'transaksi_berhasil'),
(5237, 812, 1, '2021-12-19 07:19:43', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5238, 812, 1, '2021-12-19 07:19:47', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5239, 0, 4, '2021-12-19 07:20:23', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5240, 812, 2, '2021-12-19 07:20:27', 'Berhasil', 3122000, 'INVTOL281210142027', 'transaksi_berhasil'),
(5241, 812, 2, '2021-12-19 07:39:42', 'Berhasil', 3102000, 'INVTOL281211143942', 'transaksi_berhasil'),
(5242, 812, 1, '2021-12-19 07:39:53', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5243, 0, 4, '2021-12-19 07:40:12', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5244, 812, 1, '2021-12-19 07:41:00', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5245, 0, 4, '2021-12-19 07:41:38', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5246, 812, 1, '2021-12-19 07:41:43', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5247, 812, 2, '2021-12-19 07:42:28', 'Berhasil', 3082000, 'INVTOL281211144228', 'transaksi_berhasil'),
(5248, 0, 4, '2021-12-19 07:42:32', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5249, 812, 1, '2021-12-19 07:42:36', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5250, 812, 2, '2021-12-19 07:43:17', 'Berhasil', 3070000, 'INVTOL281210144317', 'transaksi_berhasil'),
(5251, 812, 1, '2021-12-19 07:43:23', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5252, 0, 4, '2021-12-19 07:43:33', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5253, 0, 4, '2021-12-19 07:46:34', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5254, 812, 2, '2021-12-19 07:46:40', 'Berhasil', 3050000, 'INVTOL281211144640', 'transaksi_berhasil'),
(5255, 812, 1, '2021-12-19 07:46:47', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5256, 0, 4, '2021-12-19 07:46:51', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5257, 812, 1, '2021-12-19 07:49:15', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5258, 0, 4, '2021-12-19 07:49:20', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5259, 0, 4, '2021-12-19 07:57:23', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5260, 812, 1, '2021-12-19 07:57:27', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5261, 812, 1, '2021-12-19 08:00:54', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5262, 0, 4, '2021-12-19 08:00:59', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5263, 812, 1, '2021-12-19 08:04:53', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5264, 0, 4, '2021-12-19 08:04:58', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5265, 812, 2, '2021-12-19 08:05:03', 'Berhasil', 3030000, 'INVTOL281211150503', 'transaksi_berhasil'),
(5266, 0, 4, '2021-12-19 08:05:38', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5267, 812, 1, '2021-12-19 08:05:43', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5268, 0, 4, '2021-12-19 08:07:06', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5269, 812, 1, '2021-12-19 08:07:10', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5270, 812, 2, '2021-12-19 08:09:17', 'Berhasil', 3010000, 'INVTOL281211150917', 'transaksi_berhasil'),
(5271, 0, 4, '2021-12-19 08:09:24', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5272, 812, 1, '2021-12-19 08:09:28', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5273, 812, 2, '2021-12-19 08:09:32', 'Berhasil', 2990000, 'INVTOL281211150932', 'transaksi_berhasil'),
(5274, 812, 1, '2021-12-19 08:09:43', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5275, 0, 4, '2021-12-19 08:09:47', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5276, 812, 2, '2021-12-19 08:09:51', 'Berhasil', 2978000, 'INVTOL281210150951', 'transaksi_berhasil'),
(5277, 0, 4, '2021-12-19 08:19:33', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5278, 812, 1, '2021-12-19 08:19:38', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5279, 812, 2, '2021-12-19 08:19:45', 'Berhasil', 2966000, 'INVTOL281210151945', 'transaksi_berhasil'),
(5280, 812, 2, '2021-12-19 08:21:23', 'Berhasil', 2954000, 'INVTOL281210152123', 'transaksi_berhasil'),
(5281, 812, 1, '2021-12-19 08:21:36', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5282, 812, 2, '2021-12-19 08:21:42', 'Berhasil', 2942000, 'INVTOL281210152142', 'transaksi_berhasil'),
(5283, 812, 1, '2021-12-19 08:21:52', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5284, 0, 4, '2021-12-19 08:21:56', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5285, 812, 2, '2021-12-19 08:22:00', 'Berhasil', 2930000, 'INVTOL281210152200', 'transaksi_berhasil'),
(5286, 812, 2, '2021-12-19 08:22:44', 'Berhasil', 2918000, 'INVTOL281210152244', 'transaksi_berhasil'),
(5287, 812, 2, '2021-12-19 08:22:53', 'Berhasil', 2906000, 'INVTOL281210152253', 'transaksi_berhasil'),
(5288, 812, 1, '2021-12-19 08:23:04', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5289, 812, 1, '2021-12-19 08:23:34', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5290, 812, 2, '2021-12-19 08:23:38', 'Berhasil', 2894000, 'INVTOL281210152338', 'transaksi_berhasil'),
(5291, 0, 4, '2021-12-19 08:23:52', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5292, 0, 4, '2021-12-19 08:23:57', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5293, 0, 4, '2021-12-19 08:24:23', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5294, 812, 2, '2021-12-19 08:24:27', 'Berhasil', 2882000, 'INVTOL281210152427', 'transaksi_berhasil'),
(5295, 812, 1, '2021-12-19 08:24:40', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5296, 0, 4, '2021-12-19 08:24:44', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5297, 812, 2, '2021-12-19 08:24:49', 'Berhasil', 2870000, 'INVTOL281210152449', 'transaksi_berhasil'),
(5298, 812, 2, '2021-12-19 08:32:12', 'Berhasil', 2858000, 'INVTOL281210153212', 'transaksi_berhasil'),
(5299, 812, 2, '2021-12-19 08:32:23', 'Berhasil', 2846000, 'INVTOL281210153223', 'transaksi_berhasil'),
(5300, 0, 4, '2021-12-19 08:36:06', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5301, 812, 2, '2021-12-19 08:36:12', 'Berhasil', 2834000, 'INVTOL281210153612', 'transaksi_berhasil'),
(5302, 812, 1, '2021-12-19 09:02:35', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5303, 812, 1, '2021-12-19 09:02:39', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5304, 0, 4, '2021-12-19 09:03:37', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5305, 812, 2, '2021-12-19 09:03:44', 'Berhasil', 2822000, 'INVTOL281210160344', 'transaksi_berhasil'),
(5306, 812, 2, '2021-12-19 09:03:46', 'Berhasil', 2810000, 'INVTOL281210160346', 'transaksi_berhasil'),
(5307, 812, 2, '2021-12-19 09:03:48', 'Berhasil', 2798000, 'INVTOL281210160348', 'transaksi_berhasil'),
(5308, 812, 2, '2021-12-19 09:03:49', 'Berhasil', 2786000, 'INVTOL281210160349', 'transaksi_berhasil'),
(5309, 812, 2, '2021-12-19 09:03:55', 'Berhasil', 2774000, 'INVTOL281210160355', 'transaksi_berhasil'),
(5310, 812, 2, '2021-12-19 09:03:56', 'Berhasil', 2762000, 'INVTOL281210160356', 'transaksi_berhasil'),
(5311, 812, 1, '2021-12-19 09:04:04', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5312, 0, 4, '2021-12-19 09:08:31', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5313, 812, 1, '2021-12-19 09:08:40', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5314, 812, 2, '2021-12-19 09:09:03', 'Berhasil', 2750000, 'INVTOL281210160903', 'transaksi_berhasil'),
(5315, 812, 2, '2021-12-19 09:12:50', 'Berhasil', 2738000, 'INVTOL281210161250', 'transaksi_berhasil'),
(5316, 812, 1, '2021-12-19 09:13:26', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5317, 812, 2, '2021-12-19 09:14:29', 'Berhasil', 2726000, 'INVTOL281210161429', 'transaksi_berhasil'),
(5318, 0, 4, '2021-12-19 09:14:41', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5319, 812, 1, '2021-12-19 09:14:44', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5320, 812, 2, '2021-12-19 09:14:48', 'Berhasil', 2714000, 'INVTOL281210161448', 'transaksi_berhasil'),
(5321, 812, 2, '2021-12-19 09:15:51', 'Berhasil', 2702000, 'INVTOL281210161551', 'transaksi_berhasil'),
(5322, 0, 4, '2021-12-19 10:21:15', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5323, 812, 2, '2021-12-19 10:21:20', 'Berhasil', 2690000, 'INVTOL281210172120', 'transaksi_berhasil'),
(5324, 812, 2, '2021-12-19 10:23:29', 'Berhasil', 2678000, 'INVTOL281210172329', 'transaksi_berhasil'),
(5325, 0, 4, '2021-12-19 10:24:07', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5326, 812, 1, '2021-12-19 10:24:13', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5327, 812, 1, '2021-12-19 10:24:16', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5328, 812, 1, '2021-12-19 10:24:19', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5329, 812, 2, '2021-12-19 10:24:50', 'Berhasil', 2666000, 'INVTOL281210172450', 'transaksi_berhasil'),
(5330, 812, 2, '2021-12-19 10:25:02', 'Berhasil', 2654000, 'INVTOL281210172502', 'transaksi_berhasil'),
(5331, 0, 4, '2021-12-19 10:25:30', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5332, 812, 2, '2021-12-19 10:25:34', 'Berhasil', 2642000, 'INVTOL281210172534', 'transaksi_berhasil'),
(5333, 812, 2, '2021-12-19 10:25:57', 'Berhasil', 2630000, 'INVTOL281210172557', 'transaksi_berhasil'),
(5334, 812, 1, '2021-12-19 10:26:08', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5335, 0, 4, '2021-12-19 10:26:45', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5336, 812, 2, '2021-12-19 10:26:50', 'Berhasil', 2618000, 'INVTOL281210172650', 'transaksi_berhasil'),
(5337, 0, 4, '2021-12-19 10:26:54', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5338, 812, 2, '2021-12-19 10:26:58', 'Berhasil', 2606000, 'INVTOL281210172658', 'transaksi_berhasil'),
(5339, 812, 2, '2021-12-19 10:27:18', 'Berhasil', 2586000, 'INVTOL281211172718', 'transaksi_berhasil'),
(5340, 812, 2, '2021-12-19 10:27:41', 'Berhasil', 2574000, 'INVTOL281210172741', 'transaksi_berhasil'),
(5341, 0, 4, '2021-12-19 10:27:57', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5342, 812, 1, '2021-12-19 10:28:05', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5343, 0, 4, '2021-12-19 10:28:08', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5344, 812, 2, '2021-12-19 10:28:15', 'Berhasil', 2562000, 'INVTOL281210172815', 'transaksi_berhasil'),
(5345, 812, 1, '2021-12-19 10:28:37', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5346, 812, 2, '2021-12-19 10:28:44', 'Berhasil', 2550000, 'INVTOL281210172844', 'transaksi_berhasil'),
(5347, 812, 1, '2021-12-19 10:29:00', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5348, 0, 4, '2021-12-19 10:29:02', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5349, 812, 2, '2021-12-19 10:29:28', 'Berhasil', 2538000, 'INVTOL281210172928', 'transaksi_berhasil'),
(5350, 812, 1, '2021-12-19 10:29:37', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5351, 0, 4, '2021-12-19 10:29:40', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5352, 812, 2, '2021-12-19 10:29:43', 'Berhasil', 2526000, 'INVTOL281210172943', 'transaksi_berhasil'),
(5353, 812, 2, '2021-12-19 10:29:57', 'Berhasil', 2514000, 'INVTOL281210172957', 'transaksi_berhasil'),
(5354, 812, 2, '2021-12-19 10:30:07', 'Berhasil', 2502000, 'INVTOL281210173007', 'transaksi_berhasil'),
(5355, 0, 4, '2021-12-19 10:30:38', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5356, 812, 2, '2021-12-19 10:30:43', 'Berhasil', 2490000, 'INVTOL281210173043', 'transaksi_berhasil'),
(5357, 812, 2, '2021-12-19 10:32:33', 'Berhasil', 2478000, 'INVTOL281210173233', 'transaksi_berhasil'),
(5358, 0, 4, '2021-12-19 10:32:53', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5359, 812, 1, '2021-12-19 10:32:57', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5360, 812, 1, '2021-12-19 10:33:00', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5361, 0, 4, '2021-12-19 10:33:04', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5362, 0, 4, '2021-12-19 10:33:08', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5363, 812, 2, '2021-12-19 10:33:11', 'Berhasil', 2466000, 'INVTOL281210173311', 'transaksi_berhasil'),
(5364, 812, 1, '2021-12-19 10:33:32', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5365, 812, 1, '2021-12-19 10:33:39', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5366, 812, 2, '2021-12-19 10:33:44', 'Berhasil', 2454000, 'INVTOL281210173344', 'transaksi_berhasil'),
(5367, 812, 2, '2021-12-19 10:33:52', 'Berhasil', 2442000, 'INVTOL281210173352', 'transaksi_berhasil'),
(5368, 812, 2, '2021-12-19 10:33:55', 'Berhasil', 2430000, 'INVTOL281210173355', 'transaksi_berhasil'),
(5369, 812, 1, '2021-12-19 10:33:58', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5370, 0, 4, '2021-12-19 10:34:01', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5371, 812, 1, '2021-12-19 10:34:03', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5372, 812, 2, '2021-12-19 10:34:05', 'Berhasil', 2418000, 'INVTOL281210173405', 'transaksi_berhasil'),
(5373, 812, 2, '2021-12-19 10:34:21', 'Berhasil', 2406000, 'INVTOL281210173421', 'transaksi_berhasil'),
(5374, 812, 2, '2021-12-19 10:34:33', 'Berhasil', 2394000, 'INVTOL281210173433', 'transaksi_berhasil'),
(5375, 0, 4, '2021-12-19 10:34:42', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5376, 812, 1, '2021-12-19 10:34:46', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5377, 812, 2, '2021-12-19 10:34:51', 'Berhasil', 2382000, 'INVTOL281210173451', 'transaksi_berhasil'),
(5378, 0, 4, '2021-12-19 10:37:04', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5379, 812, 2, '2021-12-19 10:37:13', 'Berhasil', 2370000, 'INVTOL281210173713', 'transaksi_berhasil'),
(5380, 0, 4, '2021-12-19 10:37:18', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5381, 812, 1, '2021-12-19 10:37:22', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5382, 812, 2, '2021-12-19 10:37:25', 'Berhasil', 2358000, 'INVTOL281210173725', 'transaksi_berhasil'),
(5383, 812, 2, '2021-12-19 10:37:45', 'Berhasil', 2346000, 'INVTOL281210173745', 'transaksi_berhasil'),
(5384, 0, 4, '2021-12-19 10:40:23', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5385, 812, 2, '2021-12-19 10:40:28', 'Berhasil', 2334000, 'INVTOL281210174028', 'transaksi_berhasil'),
(5386, 812, 2, '2021-12-19 10:40:48', 'Berhasil', 2314000, 'INVTOL281211174048', 'transaksi_berhasil'),
(5387, 0, 4, '2021-12-19 10:41:01', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5388, 812, 2, '2021-12-19 10:41:22', 'Berhasil', 2302000, 'INVTOL281210174122', 'transaksi_berhasil'),
(5389, 812, 2, '2021-12-19 10:41:34', 'Berhasil', 2290000, 'INVTOL281210174134', 'transaksi_berhasil'),
(5390, 812, 1, '2021-12-19 10:41:55', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5391, 0, 4, '2021-12-19 10:42:00', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5392, 812, 2, '2021-12-19 10:42:05', 'Berhasil', 2278000, 'INVTOL281210174205', 'transaksi_berhasil'),
(5393, 0, 4, '2021-12-19 10:42:28', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5394, 812, 1, '2021-12-19 10:42:32', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5395, 0, 4, '2021-12-19 10:42:35', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5396, 812, 1, '2021-12-19 10:42:44', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5397, 812, 1, '2021-12-19 10:42:47', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5398, 812, 2, '2021-12-19 10:42:50', 'Berhasil', 2266000, 'INVTOL281210174250', 'transaksi_berhasil'),
(5399, 812, 1, '2021-12-19 12:53:00', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5400, 812, 1, '2021-12-19 12:53:06', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5401, 812, 2, '2021-12-19 12:53:34', 'Berhasil', 2254000, 'INVTOL281210195334', 'transaksi_berhasil'),
(5402, 0, 4, '2021-12-19 12:54:11', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5403, 812, 1, '2021-12-19 12:54:29', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5404, 0, 4, '2021-12-19 12:54:34', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5405, 0, 4, '2021-12-19 12:54:44', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5406, 812, 1, '2021-12-19 12:54:49', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5407, 812, 2, '2021-12-19 12:54:54', 'Berhasil', 2242000, 'INVTOL281210195454', 'transaksi_berhasil'),
(5408, 812, 2, '2021-12-19 12:55:08', 'Berhasil', 2230000, 'INVTOL281210195508', 'transaksi_berhasil'),
(5409, 0, 4, '2021-12-19 12:55:18', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5410, 812, 1, '2021-12-19 12:55:22', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5411, 812, 2, '2021-12-19 12:55:26', 'Berhasil', 2210000, 'INVTOL281211195526', 'transaksi_berhasil'),
(5412, 0, 4, '2021-12-19 12:56:34', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5413, 812, 2, '2021-12-19 12:56:44', 'Berhasil', 2198000, 'INVTOL281210195644', 'transaksi_berhasil'),
(5414, 812, 2, '2021-12-19 12:57:05', 'Berhasil', 2186000, 'INVTOL281210195705', 'transaksi_berhasil'),
(5415, 812, 1, '2021-12-19 12:57:32', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5416, 812, 2, '2021-12-19 12:57:41', 'Berhasil', 2174000, 'INVTOL281210195741', 'transaksi_berhasil'),
(5417, 0, 4, '2021-12-19 12:58:19', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5418, 812, 2, '2021-12-19 12:58:29', 'Berhasil', 2162000, 'INVTOL281210195829', 'transaksi_berhasil'),
(5419, 812, 1, '2021-12-19 12:58:49', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5420, 0, 4, '2021-12-19 12:58:54', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5421, 0, 4, '2021-12-19 12:59:01', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5422, 812, 1, '2021-12-19 12:59:04', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5423, 0, 4, '2021-12-19 12:59:08', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5424, 812, 1, '2021-12-19 12:59:11', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5425, 812, 2, '2021-12-19 12:59:23', 'Berhasil', 2150000, 'INVTOL281210195923', 'transaksi_berhasil'),
(5426, 812, 2, '2021-12-19 13:01:16', 'Berhasil', 2138000, 'INVTOL281210200116', 'transaksi_berhasil'),
(5427, 812, 2, '2021-12-19 13:02:32', 'Berhasil', 2126000, 'INVTOL281210200232', 'transaksi_berhasil'),
(5428, 0, 4, '2021-12-19 13:02:51', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5429, 812, 1, '2021-12-19 13:02:55', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5430, 0, 4, '2021-12-19 13:02:59', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5431, 812, 2, '2021-12-19 13:03:14', 'Berhasil', 2106000, 'INVTOL281211200314', 'transaksi_berhasil'),
(5432, 812, 2, '2021-12-19 13:03:39', 'Berhasil', 2094000, 'INVTOL281210200339', 'transaksi_berhasil'),
(5433, 812, 1, '2021-12-19 13:04:17', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5434, 812, 2, '2021-12-19 13:04:32', 'Berhasil', 2082000, 'INVTOL281210200432', 'transaksi_berhasil'),
(5435, 812, 2, '2021-12-19 13:06:25', 'Berhasil', 2070000, 'INVTOL281210200625', 'transaksi_berhasil'),
(5436, 812, 2, '2021-12-19 13:08:27', 'Berhasil', 2058000, 'INVTOL281210200827', 'transaksi_berhasil'),
(5437, 812, 2, '2021-12-19 13:09:10', 'Berhasil', 2046000, 'INVTOL281210200910', 'transaksi_berhasil'),
(5438, 812, 2, '2021-12-19 13:16:34', 'Berhasil', 2034000, 'INVTOL281210201634', 'transaksi_berhasil'),
(5439, 812, 2, '2021-12-20 02:09:18', 'Berhasil', 2022000, 'INVTOL28121090918', 'transaksi_berhasil'),
(5440, 812, 2, '2021-12-20 02:09:55', 'Berhasil', 2010000, 'INVTOL28121090955', 'transaksi_berhasil'),
(5441, 0, 4, '2021-12-20 02:10:39', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5442, 812, 1, '2021-12-20 02:10:59', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup');
INSERT INTO `tb_transaksi_tol` (`id_pembayaran`, `id_tol`, `id_rfid`, `tanggal_transaksi`, `status`, `saldo_akhir`, `no_transaksi`, `keterangan`) VALUES
(5443, 0, 4, '2021-12-20 02:11:05', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5444, 812, 2, '2021-12-20 02:11:18', 'Berhasil', 1998000, 'INVTOL28121091118', 'transaksi_berhasil'),
(5445, 812, 2, '2021-12-20 02:11:46', 'Berhasil', 1986000, 'INVTOL28121091146', 'transaksi_berhasil'),
(5446, 812, 2, '2021-12-20 02:18:45', 'Berhasil', 1966000, 'INVTOL28121191845', 'transaksi_berhasil'),
(5447, 812, 2, '2021-12-20 02:18:55', 'Berhasil', 1954000, 'INVTOL28121091855', 'transaksi_berhasil'),
(5448, 812, 2, '2021-12-20 02:19:11', 'Berhasil', 1942000, 'INVTOL28121091911', 'transaksi_berhasil'),
(5449, 0, 4, '2021-12-20 02:19:37', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5450, 812, 1, '2021-12-20 02:19:42', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5451, 812, 2, '2021-12-20 02:19:46', 'Berhasil', 1930000, 'INVTOL28121091946', 'transaksi_berhasil'),
(5452, 812, 1, '2021-12-20 02:20:10', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5453, 812, 2, '2021-12-20 02:20:29', 'Berhasil', 1918000, 'INVTOL28121092029', 'transaksi_berhasil'),
(5454, 812, 2, '2021-12-20 02:29:27', 'Berhasil', 1906000, 'INVTOL28121092927', 'transaksi_berhasil'),
(5455, 0, 4, '2021-12-20 02:29:44', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5456, 812, 2, '2021-12-20 02:29:49', 'Berhasil', 1894000, 'INVTOL28121092949', 'transaksi_berhasil'),
(5457, 812, 2, '2021-12-20 02:32:43', 'Berhasil', 1882000, 'INVTOL28121093243', 'transaksi_berhasil'),
(5458, 812, 2, '2021-12-20 02:34:27', 'Berhasil', 1870000, 'INVTOL28121093427', 'transaksi_berhasil'),
(5459, 0, 4, '2021-12-20 02:34:54', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5460, 812, 1, '2021-12-20 02:35:01', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5461, 812, 2, '2021-12-20 02:36:19', 'Berhasil', 1858000, 'INVTOL28121093619', 'transaksi_berhasil'),
(5462, 812, 2, '2021-12-20 02:39:32', 'Berhasil', 1846000, 'INVTOL28121093932', 'transaksi_berhasil'),
(5463, 812, 2, '2021-12-20 02:41:51', 'Berhasil', 1834000, 'INVTOL28121094151', 'transaksi_berhasil'),
(5464, 812, 2, '2021-12-20 02:52:03', 'Berhasil', 1822000, 'INVTOL28121095203', 'transaksi_berhasil'),
(5465, 812, 2, '2021-12-20 02:54:46', 'Berhasil', 1810000, 'INVTOL28121095446', 'transaksi_berhasil'),
(5466, 812, 1, '2021-12-20 02:55:04', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5467, 0, 4, '2021-12-20 02:55:08', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5468, 812, 1, '2021-12-20 02:55:13', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5469, 812, 2, '2021-12-20 02:55:16', 'Berhasil', 1798000, 'INVTOL28121095516', 'transaksi_berhasil'),
(5470, 812, 2, '2021-12-20 02:57:35', 'Berhasil', 1786000, 'INVTOL28121095735', 'transaksi_berhasil'),
(5471, 812, 2, '2021-12-20 02:57:53', 'Berhasil', 1774000, 'INVTOL28121095753', 'transaksi_berhasil'),
(5472, 812, 1, '2021-12-20 02:58:08', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5473, 0, 4, '2021-12-20 02:58:12', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5474, 812, 2, '2021-12-20 02:58:19', 'Berhasil', 1762000, 'INVTOL28121095819', 'transaksi_berhasil'),
(5475, 812, 2, '2021-12-20 03:02:59', 'Berhasil', 1750000, 'INVTOL281210100259', 'transaksi_berhasil'),
(5476, 0, 4, '2021-12-20 03:03:18', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5477, 812, 1, '2021-12-20 03:03:22', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5478, 812, 2, '2021-12-20 03:03:27', 'Berhasil', 1738000, 'INVTOL281210100327', 'transaksi_berhasil'),
(5479, 0, 4, '2021-12-20 03:03:55', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5480, 812, 2, '2021-12-20 03:03:59', 'Berhasil', 1726000, 'INVTOL281210100359', 'transaksi_berhasil'),
(5481, 0, 4, '2021-12-20 03:04:17', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5482, 812, 1, '2021-12-20 03:04:20', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5483, 812, 1, '2021-12-20 03:04:24', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5484, 0, 4, '2021-12-20 03:04:28', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5485, 812, 2, '2021-12-20 03:04:31', 'Berhasil', 1706000, 'INVTOL281211100431', 'transaksi_berhasil'),
(5486, 812, 2, '2021-12-20 03:23:20', 'Berhasil', 1686000, 'INVTOL281211102320', 'transaksi_berhasil'),
(5487, 0, 4, '2021-12-20 03:23:54', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5488, 812, 1, '2021-12-20 03:23:58', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5489, 812, 1, '2021-12-20 03:24:05', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5490, 0, 4, '2021-12-20 03:24:10', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5491, 812, 2, '2021-12-20 03:24:16', 'Berhasil', 1674000, 'INVTOL281210102416', 'transaksi_berhasil'),
(5492, 0, 4, '2021-12-20 03:24:54', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5493, 812, 2, '2021-12-20 03:24:58', 'Berhasil', 1662000, 'INVTOL281210102458', 'transaksi_berhasil'),
(5494, 0, 4, '2021-12-20 03:25:44', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5495, 812, 2, '2021-12-20 03:25:47', 'Berhasil', 1650000, 'INVTOL281210102547', 'transaksi_berhasil'),
(5496, 812, 1, '2021-12-20 05:56:10', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5497, 812, 2, '2021-12-20 05:56:46', 'Berhasil', 1638000, 'INVTOL281210125646', 'transaksi_berhasil'),
(5498, 812, 2, '2021-12-20 05:57:17', 'Berhasil', 1626000, 'INVTOL281210125717', 'transaksi_berhasil'),
(5499, 812, 2, '2021-12-20 06:01:15', 'Berhasil', 1614000, 'INVTOL281210130115', 'transaksi_berhasil'),
(5500, 812, 2, '2021-12-20 06:02:40', 'Berhasil', 1602000, 'INVTOL281210130240', 'transaksi_berhasil'),
(5501, 812, 2, '2021-12-20 06:04:17', 'Berhasil', 1590000, 'INVTOL281210130417', 'transaksi_berhasil'),
(5502, 812, 1, '2021-12-20 06:07:24', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5503, 0, 4, '2021-12-20 06:07:33', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5504, 812, 1, '2021-12-20 06:07:39', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5505, 0, 4, '2021-12-20 06:07:43', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5506, 812, 2, '2021-12-20 06:07:46', 'Berhasil', 1578000, 'INVTOL281210130746', 'transaksi_berhasil'),
(5507, 0, 4, '2021-12-20 06:07:58', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5508, 812, 2, '2021-12-20 06:08:02', 'Berhasil', 1566000, 'INVTOL281210130802', 'transaksi_berhasil'),
(5509, 812, 2, '2021-12-20 06:08:15', 'Berhasil', 1546000, 'INVTOL281211130815', 'transaksi_berhasil'),
(5510, 812, 2, '2021-12-20 06:08:34', 'Berhasil', 1534000, 'INVTOL281210130834', 'transaksi_berhasil'),
(5511, 812, 2, '2021-12-20 06:08:44', 'Berhasil', 1522000, 'INVTOL281210130844', 'transaksi_berhasil'),
(5512, 812, 2, '2021-12-20 06:09:19', 'Berhasil', 1510000, 'INVTOL281210130919', 'transaksi_berhasil'),
(5513, 812, 2, '2021-12-20 06:10:29', 'Berhasil', 1498000, 'INVTOL281210131029', 'transaksi_berhasil'),
(5514, 812, 2, '2021-12-20 06:11:30', 'Berhasil', 1486000, 'INVTOL281210131130', 'transaksi_berhasil'),
(5515, 812, 2, '2021-12-20 06:16:40', 'Berhasil', 1474000, 'INVTOL281210131640', 'transaksi_berhasil'),
(5516, 812, 1, '2021-12-20 06:16:57', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5517, 0, 4, '2021-12-20 06:17:07', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5518, 812, 2, '2021-12-20 06:17:11', 'Berhasil', 1462000, 'INVTOL281210131711', 'transaksi_berhasil'),
(5519, 0, 4, '2021-12-20 06:17:26', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5520, 812, 1, '2021-12-20 06:17:30', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5521, 0, 4, '2021-12-20 06:17:35', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5522, 812, 1, '2021-12-20 06:17:38', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5523, 812, 1, '2021-12-20 06:17:46', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5524, 0, 4, '2021-12-20 06:17:49', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5525, 812, 2, '2021-12-20 06:17:52', 'Berhasil', 1450000, 'INVTOL281210131752', 'transaksi_berhasil'),
(5526, 0, 4, '2021-12-21 03:54:21', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5527, 812, 2, '2021-12-21 06:23:45', 'Berhasil', 1437000, 'INVTOL281210132345', 'transaksi_berhasil'),
(5528, 0, 4, '2021-12-21 06:27:48', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5529, 812, 2, '2021-12-21 06:28:20', 'Berhasil', 1424000, 'INVTOL281210132820', 'transaksi_berhasil'),
(5530, 812, 2, '2021-12-21 06:29:45', 'Berhasil', 1411000, 'INVTOL281210132945', 'transaksi_berhasil'),
(5531, 812, 1, '2021-12-21 06:29:59', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5532, 0, 4, '2021-12-21 06:30:03', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5533, 812, 2, '2021-12-21 06:30:07', 'Berhasil', 1398000, 'INVTOL281210133007', 'transaksi_berhasil'),
(5534, 0, 4, '2021-12-21 06:30:20', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5535, 812, 2, '2021-12-21 06:30:23', 'Berhasil', 1378000, 'INVTOL281211133023', 'transaksi_berhasil'),
(5536, 812, 2, '2021-12-21 06:36:34', 'Berhasil', 1365000, 'INVTOL281210133634', 'transaksi_berhasil'),
(5537, 0, 4, '2021-12-21 06:36:42', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5538, 812, 1, '2021-12-21 06:36:47', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5539, 0, 4, '2021-12-21 06:36:50', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5540, 0, 4, '2021-12-21 06:36:55', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5541, 812, 2, '2021-12-21 06:37:01', 'Berhasil', 1352000, 'INVTOL281210133701', 'transaksi_berhasil'),
(5542, 0, 4, '2021-12-21 06:37:06', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5543, 0, 4, '2021-12-21 06:37:10', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5544, 812, 2, '2021-12-21 06:37:14', 'Berhasil', 1332000, 'INVTOL281211133714', 'transaksi_berhasil'),
(5545, 0, 4, '2021-12-21 13:58:48', 'Gagal', 0, 'Unknown', 'rfid_tidak_terdaftar'),
(5546, 812, 2, '2021-12-21 13:59:03', 'Berhasil', 1312000, 'INVTOL281211205903', 'transaksi_berhasil'),
(5547, 812, 1, '2021-12-21 13:59:31', 'Saldo', 2000, 'Unknown', 'saldo_tidak_cukup'),
(5548, 0, 4, '2021-12-21 13:59:47', 'Tol', 0, 'Unknown', 'tol_tidak_terdaftar');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `id_rfid` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `level` enum('admin','user') NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `id_rfid`, `password`, `username`, `level`, `email`) VALUES
(2, 2, 'bento', 'bento', 'user', 'bento@gmail.com'),
(4, 1, 'kamal', 'kamal', 'user', 'kamal@gmail.com'),
(5, 3, 'liani', 'Liani', 'user', 'lianialia@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_golongan`
--
ALTER TABLE `tb_golongan`
  ADD PRIMARY KEY (`id_golongan`),
  ADD KEY `id_tol` (`id_tol`);

--
-- Indexes for table `tb_rfid`
--
ALTER TABLE `tb_rfid`
  ADD PRIMARY KEY (`id_rfid`);

--
-- Indexes for table `tb_tol`
--
ALTER TABLE `tb_tol`
  ADD PRIMARY KEY (`id_tol`);

--
-- Indexes for table `tb_topup`
--
ALTER TABLE `tb_topup`
  ADD PRIMARY KEY (`id_topup`),
  ADD KEY `id_rfid` (`id_rfid`);

--
-- Indexes for table `tb_transaksi_tol`
--
ALTER TABLE `tb_transaksi_tol`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_tol` (`id_tol`),
  ADD KEY `id_rfid` (`id_rfid`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_rfid` (`id_rfid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_golongan`
--
ALTER TABLE `tb_golongan`
  MODIFY `id_golongan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_rfid`
--
ALTER TABLE `tb_rfid`
  MODIFY `id_rfid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_tol`
--
ALTER TABLE `tb_tol`
  MODIFY `id_tol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=815;

--
-- AUTO_INCREMENT for table `tb_topup`
--
ALTER TABLE `tb_topup`
  MODIFY `id_topup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12354;

--
-- AUTO_INCREMENT for table `tb_transaksi_tol`
--
ALTER TABLE `tb_transaksi_tol`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5549;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_golongan`
--
ALTER TABLE `tb_golongan`
  ADD CONSTRAINT `tb_golongan_ibfk_1` FOREIGN KEY (`id_tol`) REFERENCES `tb_tol` (`id_tol`);

--
-- Constraints for table `tb_topup`
--
ALTER TABLE `tb_topup`
  ADD CONSTRAINT `tb_topup_ibfk_1` FOREIGN KEY (`id_rfid`) REFERENCES `tb_rfid` (`id_rfid`);

--
-- Constraints for table `tb_transaksi_tol`
--
ALTER TABLE `tb_transaksi_tol`
  ADD CONSTRAINT `tb_transaksi_tol_ibfk_1` FOREIGN KEY (`id_tol`) REFERENCES `tb_tol` (`id_tol`),
  ADD CONSTRAINT `tb_transaksi_tol_ibfk_2` FOREIGN KEY (`id_rfid`) REFERENCES `tb_rfid` (`id_rfid`);

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_rfid`) REFERENCES `tb_rfid` (`id_rfid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
