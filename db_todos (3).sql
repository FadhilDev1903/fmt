-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2024 pada 03.35
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_todos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `adhocprojectdetails`
--

CREATE TABLE `adhocprojectdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `adhocprojectdetails`
--

INSERT INTO `adhocprojectdetails` (`id`, `project_id`, `user_id`, `salary`, `country`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1000', 'ID', '2024-02-26 19:08:29', '2024-02-26 19:08:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `adhocprojects`
--

CREATE TABLE `adhocprojects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `wbs_number` varchar(255) DEFAULT NULL,
  `cost_center` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remark` varchar(255) NOT NULL,
  `manage` varchar(255) NOT NULL,
  `budget` decimal(15,2) NOT NULL,
  `startdate` varchar(255) NOT NULL,
  `enddate` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `adhocprojects`
--

INSERT INTO `adhocprojects` (`id`, `parent_id`, `wbs_number`, `cost_center`, `name`, `description`, `remark`, `manage`, `budget`, `startdate`, `enddate`, `country`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Adhoc', 'Adhoc', 'Adhoc', 'Adhoc', 'Adhoc', 'Adhoc', 10000.00, '2024-01-02', '2024-01-25', 'ID', '2024-02-26 19:08:29', '2024-03-11 15:24:08'),
(2, NULL, '1', NULL, 'Adhoc 1', 'a', 'a', 'a', 100000.00, '2024-03-12', '2024-03-12', 'ID', '2024-03-11 15:31:48', '2024-03-11 15:36:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_type` varchar(255) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `bank_code` varchar(255) DEFAULT NULL,
  `bank_swift` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `bank_type`, `bank_address`, `bank_code`, `bank_swift`, `created_at`, `updated_at`) VALUES
(1, 'BANK INDONESIA', 'Konvensional', 'JL. MH. THAMRIN NO.2 JAKARTA', '0010016', 'INDOIDJA', NULL, NULL),
(2, 'PT. BANK RAKYAT INDONESIA (Persero) Tbk.', 'Konvensional', 'JL. JEND.SUDIRMAN NO.42-43', '0020307', 'BRINIDJA', NULL, NULL),
(3, 'PT. BANK MANDIRI (Persero) Tbk.', 'Konvensional', 'JL. TANAH ABANG TIMUR NO. 1-2 LT.2', '0080017', 'BMRIIDJA', NULL, NULL),
(4, 'PT. BANK NEGARA INDONESIA 1946 (Persero) Tbk.', 'Konvensional', 'JL. JEND. SUDIRMAN KAV.1 JAKARTA PUSAT (10220)', '0090010', 'BNINIDJA', NULL, NULL),
(5, 'PT. BANK DANAMON INDONESIA INDONESIA Tbk.', 'Konvensional', 'JL. KEBON SIRIH NO.15  JAKARTA PUSAT', '0110042', 'BDINIDJA', NULL, NULL),
(6, 'PT. BANK DANAMON INDONESIA INDONESIA Tbk. (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL. RAYA BOGOR NO.2 CIRACAS  JAKTIM', '0119920', 'SYBDIDJ1', NULL, NULL),
(7, 'PT. BANK PERMATA Tbk.', 'Konvensional', 'JL. HAYAM WURUK NO 84-85 JAKARTA 11160', '130475', 'BBBAIDJA', NULL, NULL),
(8, 'PT. BANK PERMATA Tbk. (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL. METRO PONDOK INDAH BLOK B7   JAKARTA 12310', '0139926', 'SYBBIDJ1', NULL, NULL),
(9, 'PT. BANK CENTRAL ASIA Tbk.', 'Konvensional', 'Menara BCA-Grand Indonesia Jl MH Thamrin No.1 Jkt', '0140397', 'CENAIDJA', NULL, NULL),
(10, 'PT. BANK MAYBANK INDONESIA (formerly Bank Internasional Indonesia)', 'Konvensional', 'GD SENTRAL SENAYAN JL.ASIA AFRIKA NO.8 JAKARTA', '0160131', 'IBBKIDJA', NULL, NULL),
(11, 'PT. BANK MAYBANK INDONESIA (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL. MH THAMRIN NO.53', '0169925', 'SYBKIDJ1', NULL, NULL),
(12, 'PT. PANIN BANK Tbk.', 'Konvensional', 'JL. JEND SUDIRMAN KAV 1  JAKARTA PUSAT', '0190017', 'PINBIDJA', NULL, NULL),
(13, 'PT. BANK CIMB NIAGA TBK', 'Konvensional', 'JL. GAJAH MADA NO.18 JAKARTA 10130', '0220026', 'BNIAIDJA', NULL, NULL),
(14, 'PT. BANK CIMB NIAGA TBK (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL. SULTAN HASANUDIN KAV. 47-51- KEBAYORAN BARU', '0229920', 'SYNAIDJ1', NULL, NULL),
(15, 'PT. BANK UOB INDONESIA', 'Konvensional', 'JL. ASEMKA NO.32-36 JAKARTA', '0230016', 'BBIJIDJA', NULL, NULL),
(16, 'PT. BANK OCBC NISP  Tbk.', 'Konvensional', 'JL.PROF.DR.SATRIO KAV.25 JAKARTA', '0280024', 'NISPIDJA', NULL, NULL),
(17, 'PT. BANK OCBC NISP  Tbk. (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'OCBC NISP TOWER LT.2 JL.PROF DR SATRIO KAV.25 JAKS', '0289928', 'SYONIDJ1', NULL, NULL),
(18, 'CITIBANK NA', 'Konvensional', 'CITIBANK TOWER  PLASA BAPINDO  JL. JEND.SUDIRMAN KAV 54-55', '0310305', 'CITIIDJX', NULL, NULL),
(19, 'JPMORGAN CHASE BANK  NA', 'Konvensional', 'Gd.The Energy Lt.5/6 SCBD Lot 11A Jl.Jend.Sudirman', '0320308', 'CHASIDJX', NULL, NULL),
(20, 'BANK OF AMERICA   NA', 'Konvensional', 'JSE BLD  TOWER II LT. 23  JL.JEND. SUDIRMAN KAV.52-53 JKT', '0330301', 'BOFAID2X', NULL, NULL),
(21, 'PT. BANK WINDU KENTJANA INTERNATIONAL  TBK', 'Konvensional', 'EQUITY TWR LT.9 SCBD LOT 9 JL.JEND.SUDIRMAN JKT', '0360300', 'MCORIDJA', NULL, NULL),
(22, 'PT. BANK ARTHA GRAHA INTERNASIONAL  TBK', 'Konvensional', 'JL. JEND. SUDIRMAN KAV. 52-53 JAKARTA 12190', '0370028', 'ARTGIDJA', NULL, NULL),
(23, 'BANGKOK BANK PUBLIC CO.LTD', 'Konvensional', 'JL.M.H.THAMRIN NO.3', '0400309', 'BKKBIDJA', NULL, NULL),
(24, 'PT BANK HSBC INDONESIA', 'Konvensional', 'WTC JL JEND SUDIRMAN KAV 29-31 JAKARTA', '0870010', 'HSBCIDJA', NULL, NULL),
(25, 'THE BANK OF TOKYO MITSUBISHI UFJ LTD.', 'Konvensional', 'MIDPLAZA BUILDING 1-3 JL. SUDIRMAN KAV. 10-11 JAKARTA 10227', '0420305', 'BOTKIDJX', NULL, NULL),
(26, 'PT. BANK SUMITOMO MITSUI INDONESIA', 'Konvensional', 'SUMMITMAS II LT.10 JL. JEND.SUDIRMAN KAV.61-62 JAKARTA', '0450304', 'SUNIIDJA', NULL, NULL),
(27, 'PT. BANK DBS INDONESIA', 'Konvensional', 'DBS BANK TOWER JL.PROF.DR.SATRIO KAV.3-5 JAKARTA', '0460307', 'DBSBIDJA', NULL, NULL),
(28, 'PT. BANK RESONA PERDANIA', 'Konvensional', 'JL.JEND.SUDIRMAN KAV.9-11 KARET SMGGI JAKSEL', '0470300', 'BPIAIDJA', NULL, NULL),
(29, 'PT. BANK MIZUHO INDONESIA', 'Konvensional', 'PLAZA BII MENARA II LANTAI 24 JL. M.H. THAMRIN NO.51 JAKARTA', '0480303', 'MHCCIDJA', NULL, NULL),
(30, 'STANDARD CHARTERED BANK', 'Konvensional', 'WISMA STANDARD CHARTERED BANK LT 7 JL JEND SUDIRMAN KAV 33A', '0500306', 'SCBLIDJX', NULL, NULL),
(31, 'PT. BANK CAPITAL INDONESIA', 'Konvensional', 'SONA TOPAS TOWER LT.16 JL.JEND.SUDIRMAN KAV.26JAKARTA', '0540308', 'BCIAIDJA', NULL, NULL),
(32, 'PT. BANK BNP PARIBAS INDONESIA', 'Konvensional', 'MENARA BATAVIA LT. 20 JL. K.H.MAS MANSYUR KAV.126 JAKARTA', '0570307', 'BNPAIDJA', NULL, NULL),
(33, 'PT. BANK ANZ INDONESIA', 'Konvensional', 'JL.JEND.SUDIRMAN KAV 33A JAKARTA', '0610306', 'ANZBIDJX', NULL, NULL),
(34, 'DEUTSCHE BANK AG', 'Konvensional', 'GD.DEUTSCHE BANK JL.IMAM BONJOL 80', '0670304', 'DEUTIDJA', NULL, NULL),
(35, 'PT. BANK WOORI SAUDARA INDONESIA 1906 TBK (TT Payment)', 'Konvensional', 'JSEB TOWER I JL. JEND.SUDIRMAN KAV. 52-53 JAKARTA 12190', NULL, 'HVBKIDJA', NULL, NULL),
(36, 'PT. BANK WOORI SAUDARA INDONESIA 1906 TBK (Local Payment)', 'Konvensional', 'JSEB TOWER I JL. JEND.SUDIRMAN KAV. 52-53 JAKARTA 12190', '2120001', 'BSDRIDJA', NULL, NULL),
(37, 'BANK OF CHINA LIMITED', 'Konvensional', 'WISMA TAMARA  SUITE 101 & 201  JL. JEND. SUDIRMAN KAV. 24', '0690300', 'BKCHIDJA', NULL, NULL),
(38, 'PT. BANK BUMI ARTA', 'Konvensional', 'JL. WAHID HASYIM NO.234 JAKARTA PUSAT 10250', '0760010', 'BBAIIDJA', NULL, NULL),
(39, 'PT. BANK ANTAR DAERAH', 'Konvensional', 'JL. BONGKARAN NO.28-30 SURABAYA', '0880013', 'ANTDIDJD', NULL, NULL),
(40, 'PT. BANK RABOBANK INTERNATIONAL INDONESIA', 'Konvensional', 'JL. PLAZA 89 LT 1. JL.HR. RASUNA SAID KAV X 7 NO.6', '0890016', 'RABOIDJA', NULL, NULL),
(41, 'PT. BANK JTRUST INDONESIA (formerly PT. BANK MUTIARA  TBK)', 'Konvensional', 'JL.JEND.SUDIRMAN KAV.22-23 GD BARCLAYS HOUSE LT.2 ', '0950011', 'CICTIDJA', NULL, NULL),
(42, 'PT. BANK MAYAPADA', 'Konvensional', 'JL JEN SUDIRMAN KAV 28  JAKARTA 12920', '0970017', 'MAYAIDJA', NULL, NULL),
(43, 'PT. BANK JABAR BANTEN TBK', 'Konvensional', 'JL. NARIPAN NO. 12 - 14 BANDUNG', '1100019', 'PDJBIDJA', NULL, NULL),
(44, 'PT. BANK PEMBANGUNAN DAERAH DKI JAKARTA', 'Konvensional', 'JL.IR.H. JUANDA III 7-9', '1110012', 'BDKIIDJ1', NULL, NULL),
(45, 'PT. BANK PEMBANGUNAN DAERAH DKI JAKARTA (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL. WAHID HASYIM 153 TANAH ABANG  JAKARTA PUSAT 10240', '1119916', 'SYDKIDJ1', NULL, NULL),
(46, 'PT. BANK PEMBANGUNAN DAERAH DIY', 'Konvensional', 'JL.TENTARA PELAJAR NO.7 YOGYAKARTA', '1120015', 'PDYKIDJ1', NULL, NULL),
(47, 'PT. BANK PEMBANGUNAN DAERAH DIY (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL.CIK DITIRO No.34 YOGYAKARTA', '1129922', 'SYYKIDJ1', NULL, NULL),
(48, 'PT. BANK PEMBANGUNAN DAERAH JAWA TENGAH', 'Konvensional', 'JL. PEMUDA NO.142 SEMARANG', '1130348', 'PDJGIDJ1', NULL, NULL),
(49, 'PT. BANK PEMBANGUNAN DAERAH JATENG (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'GD.GRINATHA LT.3 JL.PEMUDA NO.142 SEMARANG', '1139938', 'SYJGIDJ1', NULL, NULL),
(50, 'PT. BANK PEMBANGUNAN JAWA TIMUR', 'Konvensional', 'JL.THAMRIN BLVD CT.LT.1 NO.1 THAMCITY JAKPUS', '1140383', 'PDJTIDJ1', NULL, NULL),
(51, 'PT. BANK PEMBANGUNAN JAWA TIMUR (UNIT USAHA SYARIAH)', 'Unit Usaha Syariah', 'JL. BASUKI RACHMAD NO. 98-104 SURABAYA', '1149928', 'SYJTIDJ1', NULL, NULL),
(52, 'PT. BANK PEMBANGUNAN DAERAH JAMBI', 'Konvensional', 'JL.JEND.A.YANI NO.18 TELANAIPURA JAMBI', '1150014', 'PDJMIDJ1', NULL, NULL),
(53, 'PT. BANK PEMBANGUNAN DAERAH JAMBI UUS', 'Unit Usaha Syariah', 'BPD JAMBI UUS', NULL, 'SYJMIDJ1', NULL, NULL),
(54, 'PT. BANK ACEH (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL.TGK.DAUD BEUREU-EH NO.24 BANDA ACEH', '1169924', 'SYACIDJ1', NULL, NULL),
(55, 'PT. BANK PEMBANGUNAN DAERAH SUMUT', 'Konvensional', 'JL. IMAM BONJOL NO.18 MEDAN', '1170010', 'PDSUIDJ1', NULL, NULL),
(56, 'PT. BANK PEMBANGUNAN DAERAH SUMUT UUS (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL. S.PARMAN NO.50 A MEDAN', '1179927', 'SYSUIDJ1', NULL, NULL),
(57, 'PT. BANK PEMBANGUNAN DAERAH SUMATERA BARAT', 'Konvensional', 'JLN TALANG BETUTU NO 17', '1180259', 'PDSBIDJ1', NULL, NULL),
(58, 'PT. BANK PEMBANGUNAN DAERAH SUMATERA BARAT (PT. BANK NAGARI) UNIT USAHA SYARIAH', 'Unit Usaha Syariah', 'JL. PEMUDA NO.21', '1180013', 'SYSBIDJ1', NULL, NULL),
(59, 'PT. BANK PEMBANGUNAN DAERAH RIAU', 'Konvensional', 'JL.JEND.SUDIRMAN NO.377 PEKANBARU', '1190016', 'PDRIIDJA', NULL, NULL),
(60, 'PT. BPD SUMSEL DAN BABEL', 'Konvensional', 'JL.KAPT.A.RIVAI NO.21 PALEMBANG', '1200016', 'BSSPIDSP', NULL, NULL),
(61, 'PT. BPD SUMSEL DAN BABEL (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL.LETKOL ISKANDAR NO.537 PALEMBANG', '1209923', 'SYSSIDJ1', NULL, NULL),
(62, 'PT. BANK PEMBANGUNAN DAERAH LAMPUNG', 'Konvensional', 'JL.WOLTER MONGINSIDI NO.182 LAMPUNG', '1210051', 'PDLPIDJ1', NULL, NULL),
(63, 'PT. BANK PEMBANGUNAN DAERAH KALIMANTAN SELATAN', 'Konvensional', 'JL.LAMBUNG MANGKURAT NO.7 BANJARMASIN', '1220012', 'PDKSIDJ1', NULL, NULL),
(64, 'PT. BANK PEMBANGUNAN DAERAH KALIMANTAN SELATAN (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL HASAN BASRI NO.8 BANJARMASIN', '1229929', 'SYKSIDJ1', NULL, NULL),
(65, 'PT. BANK PEMBANGUNAN DAERAH KALIMANTAN BARAT', 'Konvensional', 'JL.RAHADI OSMAN NO.10 PONTIANAK', '1230015', 'PDKBIDJ1', NULL, NULL),
(66, 'PT. BANK PEMBANGUNAN DAERAH KALIMANTAN BARAT (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL.A.YANI NO.5-6 PONTIANAK', '1239922', 'SYKBIDJ1', NULL, NULL),
(67, 'PT. BANK PEMBANGUNAN DAERAH KALIMANTAN TIMUR', 'Konvensional', 'JL.JEND.SUDIRMAN NO.33 SAMARINDA', '1240018', 'PDKTIDJ1', NULL, NULL),
(68, 'PT. BANK PEMBANGUNAN DAERAH KALTIM (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL.A.YANI II NO.31 SAMARINDA', '1249925', 'SYKTIDJ1', NULL, NULL),
(69, 'PT. BANK PEMBANGUNAN DAERAH KALTENG', 'Konvensional', 'JL. RTA MILONO NO.12 PALANGKA RAYA', '1250011', 'PDKGIDJ1', NULL, NULL),
(70, 'PT. BANK SULSELBAR', 'Konvensional', 'JL.DR.RATULANGI NO.16 MAKASSAR', '1260027', 'PDWSIDJ1', NULL, NULL),
(71, 'PT. BANK SULSELBAR - UNIT USAHA SYARIAH', 'Unit Usaha Syariah', 'JL.DR.RATULANGI NO.16 MAKASSAR', NULL, 'SYWSIDJ1', NULL, NULL),
(72, 'PT. BANK PEMBANGUNAN SULAWESI UTARA', 'Konvensional', 'JL. SAM RATULANGI NO.9 MANADO', '1270017', 'PDWUIDJ1', NULL, NULL),
(73, 'PT. BANK PEMBANGUNAN DAERAH NTB', 'Konvensional', 'JL.PEJANGGIK NO. 30 MATARAM', '1280010', 'PDNBIDJ1', NULL, NULL),
(74, 'PT. BANK PEMBANGUNAN DAERAH BALI', 'Konvensional', 'JL.RAYA PUPUTAN NITI MANDALA RENON DENPASAR', '1290013', 'ABALIDBS', NULL, NULL),
(75, 'PT. BANK PEMBANGUNAN DAERAH NUSA TENGGARA TIMUR', 'Konvensional', 'JL.MOH.HATTA NO.56 KUPANG', '1300013', 'PDNTIDJ1', NULL, NULL),
(76, 'PT. BANK PEMBANGUNAN DAERAH MALUKU', 'Konvensional', 'JL.RAYA PATTIMURA NO.9 AMBON', '1310016', 'PDMLIDJ1', NULL, NULL),
(77, 'PT. BANK PEMBANGUNAN DAERAH PAPUA', 'Konvensional', 'JL.A.YANI NO.5-7 JAYAPURA', '1320019', 'PDIJIDJ1', NULL, NULL),
(78, 'PT. BPD BENGKULU', 'Konvensional', 'JL.BASUKI RACHMAT NO.6 BENGKULU', '1330012', 'PDBKIDJ1', NULL, NULL),
(79, 'PT. BANK PEMBANGUNAN DAERAH SULAWESI TENGAH', 'Konvensional', 'JL.SULTAN HASANUDDIN NO.20 PALU', '1340015', 'PDWGIDJ1', NULL, NULL),
(80, 'PT. BANK PEMBANGUNAN DAERAH SULAWESI TENGGARA', 'Konvensional', 'JL.MAYJEN SUTOYO NO.95 KENDARI', '1350018', 'PDWRIDJ1', NULL, NULL),
(81, 'PT. BANK NUSANTARA PARAHYANGAN', 'Konvensional', 'JL. IR. H. JUANDA NO. 95  BANDUNG - 40132', '1450015', 'NUPAIDJ6', NULL, NULL),
(82, 'PT. BANK OF INDIA INDONESIA  TBK', 'Konvensional', 'JL. H.SAMANHUDI NO. 37  JAKARTA PUSAT', '1460047', 'SWBAIDJ1', NULL, NULL),
(83, 'PT. BANK MUAMALAT INDONESIA', 'Bank Syariah', 'JL. JEND. SUDIRMAN KAV.2 GEDUNG ARTHALOKA JAKARTA PUSAT', '1470011', 'MUABIDJA', NULL, NULL),
(84, 'PT. BANK MESTIKA DHARMA', 'Konvensional', 'JL. ZAINUL ARIFIN NO.118', '1510010', 'MEDHIDS1', NULL, NULL),
(85, 'PT. BANK SHINHAN INDONESIA', 'Konvensional', 'JL. HAYAM WURUK NO. 19-20 JAKARTA PUSAT', '1520013', 'MEEKIDJ1', NULL, NULL),
(86, 'PT. BANK SINARMAS', 'Konvensional', 'PLAZA BII TOWER I  JL.MH.THAMRIN NO.51', '1530016', 'SBJKIDJA', NULL, NULL),
(87, 'PT. BANK SINARMAS (Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL.TEUKU CIK DITIRO NO.29 JAKARTA PUSAT', '1539923', 'SYTBIDJ1', NULL, NULL),
(88, 'PT. BANK MASPION INDONESIA', 'Konvensional', 'JL. BASUKI RAHMAT NO.50-54 SURABAYA', '1570018', 'MASDIDJ1', NULL, NULL),
(89, 'PT. BANK GANESHA', 'Konvensional', 'GRAHA GANESHA  JL. HAYAM WURUK NO. 28  JAKARTA 10120', '1610017', 'GNESIDJA', NULL, NULL),
(90, 'PT. BANK ICBC INDONESIA', 'Konvensional', 'THE CITY TOWER  LT DSR JL.M.H.THAMRIN NO.81', '1640058', 'ICBKIDJA', NULL, NULL),
(91, 'PT. BANK QNB INDONESIA. TBK', 'Konvensional', 'JL. JEND. SUDIRMAN KAV.52-53 JAKARTA', '1670015', 'AWANIDJA', NULL, NULL),
(92, 'PT. BANK TABUNGAN NEGARA (Persero)', 'Konvensional', 'JL.GAJAHMADA 1 JAKARTA', '2000150', 'BTANIDJA', NULL, NULL),
(93, 'PT. BANK TABUNGAN NEGARA (Persero)-(Unit Usaha Syariah)', 'Unit Usaha Syariah', 'JL. GAJAH MADA NO. 1', '2009928', 'SYBTIDJ1', NULL, NULL),
(94, 'PT. Bank Tabungan Pensiunan Nasional (BTPN)', 'Konvensional', 'MENARA CYBER 2  JL.HR RASUNA SAID KUNINGAN-JAKSEL', '2130101', 'BTPNIDJA', NULL, NULL),
(95, 'PT. BANK VICTORIA SYARIAH', 'Bank Syariah', 'JL. RS.FATMAWATI NO.85 A JAKARTA', '4050072', 'SWAGIDJ1', NULL, NULL),
(96, 'PT. BANK SYARIAH BRI', 'Bank Syariah', 'JL.WAHID HASYIM NO. 288 JAKARTA PUSAT', '4220051', 'DJARIDJ1', NULL, NULL),
(97, 'PT. BANK JABAR BANTEN SYARIAH', 'Bank Syariah', 'JL. BRAGA NO. 135 BANDUNG', '4250018', 'SYJBIDJ1', NULL, NULL),
(98, 'PT. BANK MEGA Tbk.', 'Konvensional', 'JL.KAPT.TENDEAN KAV.12-14 JAKARTA SELATAN', '4260121', 'MEGAIDJA', NULL, NULL),
(99, 'PT. BANK BNI SYARIAH', 'Bank Syariah', 'JL. RS FATMAWATI NO.33/1 JAKARTA SELATAN', '4270027', 'SYNIIDJ1', NULL, NULL),
(100, 'PT. BANK UMUM KOPERASI INDONESIA (BUKOPIN)', 'Konvensional', 'JL.MT HARYONO KAV 50-51 JAKARTA SELATAN', '4410010', 'BBUKIDJA', NULL, NULL),
(101, 'PT. BANK SYARIAH MANDIRI', 'Bank Syariah', 'JL. MH. THAMRIN NO. 5  JAKARTA 10340', '4510017', 'BSMDIDJA', NULL, NULL),
(102, 'PT. BANK BISNIS INTERNATIONAL', 'Konvensional', 'JL. ASIA-AFRIKA NO. 121', '4590011', 'BUSTIDJ1', NULL, NULL),
(103, 'PT. BANK ANDARA', 'Konvensional', 'JL.W.R. SUPRATMAN 27 X DENPASAR', '4660019', 'RIPAIDJ1', NULL, NULL),
(104, 'PT. BANK JASA JAKARTA', 'Konvensional', 'JL. TIANG BENDERA III NO.26-32 JAKARTA', '4720014', 'JSABIDJ1', NULL, NULL),
(105, 'PT. BANK KEB HANA INDONESIA', 'Konvensional', 'WISMA MULIA LT.52 JL.JEND.GT.SUBROTO NO.42 JAKSEL', '4840017', 'HNBNIDJA', NULL, NULL),
(106, 'PT. BANK MNC INTERNASIONAL  TBK (Formerly PT. BANK ICB BUMIPUTERA TBK.)', 'Konvensional', 'JL. JEND SUDIRMAN KAV. 75 JAKARTA 12910', '4850010', 'BUMIIDJA', NULL, NULL),
(107, 'PT. BANK YUDHA BHAKTI', 'Konvensional', 'GD. PRIMAGRAHA PERSADA JL. GD. KESENIAN NO. 3-7 JAKPUS', '4900012', 'YUDBIDJ1', NULL, NULL),
(108, 'PT. BANK MITRANIAGA', 'Konvensional', 'JL. LETJEN S.PARMAN KAV.77  SLIPI JAKARTA BARAT', '4910015', 'MGABIDJ1', NULL, NULL),
(109, 'PT. BANK RAKYAT INDONESIA AGRONIAGA  TBK', 'Konvensional', 'PLAZA GRI JL. HR RASUNA SAID BLOK X2 NO. 1 JAKARTA 12950', '4940014', 'AGTBIDJA', NULL, NULL),
(110, 'PT. BANK SBI INDONESIA', 'Konvensional', 'JL. PASAR BARU SELATAN NO. 19  JAK-PUS', '4980016', 'IDMOIDJ1', NULL, NULL),
(111, 'PT. BANK ROYAL INDONESIA', 'Konvensional', 'JL. SURYOPRANOTO NO. 52', '5010011', 'ROYBIDJ1', NULL, NULL),
(112, 'PT. BANK NATIONALNOBU', 'Konvensional', 'THE PLAZA SEMANGGI LT.8 JL.JEN.SUDIRMAN KAV.50 JKT', '5030017', 'LFIBIDJ1', NULL, NULL),
(113, 'PT. BANK MEGA SYARIAH', 'Bank Syariah', 'WISMA TUGU II JL. HR RASUNA SAID KAV C-7 JAKARTA 12940', '5060016', 'BUTGIDJ1', NULL, NULL),
(114, 'PT. BANK INA PERDANA', 'Konvensional', 'WISMA BSG LT.1   JL.ABDUL MUIS NO:40  10160', '5130014', 'INPBIDJ1', NULL, NULL),
(115, 'PT. BANK PANIN DUBAI SYARIAH', 'Bank Syariah', 'GD PANIN LIFE CENTRE LT.1 LETJEN S.PARMAN KAV.91', '5170016', 'ARFAIDJ1', NULL, NULL),
(116, 'PT. PRIMA MASTER BANK', 'Konvensional', 'JL. JEMBATAN MERAH NO.15-17 SURABAYA', '5200012', 'PMASIDJ1', NULL, NULL),
(117, 'PT. BANK SYARIAH BUKOPIN', 'Bank Syariah', 'JL. SALEMBA RAYA NO.55 JAKARTA', '5210031', 'SDOBIDJ1', NULL, NULL),
(118, 'PT. BANK SAHABAT SAMPOERNA', 'Konvensional', 'JL.JEND.SUDIRMAN KAV.45-46 SETIA BUDI JAKSEL 12930', '5230011', 'BDIPIDJ1', NULL, NULL),
(119, 'PT. BANK DINAR INDONESIA', 'Konvensional', 'JL. IR. H. JUANDA NO.12 JAK - PUS', '5260010', 'LMANIDJ1', NULL, NULL),
(120, 'PT. BANK AMAR INDONESIA (formerly PT.ANGLOMAS INTERNATIONAL BANK)', 'Konvensional', 'JL. SIMPANG DUKUH NO.38-40 SURABAYA', '5310012', 'LOMAIDJ1', NULL, NULL),
(121, 'PT. BANK KESEJAHTERAAN EKONOMI', 'Konvensional', 'JL. RP.SOEROSO NO.21 JAKARTA', '5350014', 'KSEBIDJ1', NULL, NULL),
(122, 'PT. BANK BCA SYARIAH', 'Bank Syariah', 'JL. JATINEGARA TIMUR NO. 72 JAKARTA 13310', '5360020', 'SYCAIDJ1', NULL, NULL),
(123, 'PT. BANK ARTOS INDONESIA', 'Konvensional', 'JL.OTTO ISKANDARDINATA 18', '5420012', 'ATOSIDJ1', NULL, NULL),
(124, 'PT. BANK TABUNGAN PENSIUNAN NASIONAL SYARIAH', 'Bank Syariah', 'MNARA CYBER 2 LT.34 JL.HR.RASUNA SAID KAV.X5 NO.13', '5470046', 'PUBAIDJ1', NULL, NULL),
(125, 'PT. BANK MULTIARTA SENTOSA', 'Konvensional', 'JL. SETIABUDI SEL.KAV.10 GD GRH GAWI LT.2 JAKSEL', '5480010', 'BMSEIDJA', NULL, NULL),
(126, 'PT. BANK MAYORA INDONESIA', 'Konvensional', 'JL. TOMANG RAYA 21-23 JAKARTA BARAT ', '5530012', 'MAYOIDJA', NULL, NULL),
(127, 'PT. BANK INDEX SELINDO', 'Konvensional', 'JL.MH.THAMRIN NO.57 GD.PLZ PERMATA JAKPUS', '5550018', 'BIDXIDJA', NULL, NULL),
(128, 'PT. BANK PEMBANGUNAN DAERAH BANTEN (formerly PT. BANK PUNDI INDONESIA  TBK)', 'Konvensional', 'JL.RS FATMAWATI NO.12 JAKSEL 12150', '5580017', 'EKSTIDJ1', NULL, NULL),
(129, 'PT. BANK FAMA INTERNATIONAL', 'Konvensional', 'JL. ASIA AFRIKA NO. 115 BANDUNG', '5620016', 'FAMAIDJ1', NULL, NULL),
(130, 'PT. BANK MANDIRI TASPEN POS (formerly PT. BANK SINAR HARAPAN BALI)', 'Konvensional', 'JL. MELATI NO. 65 DENPASAR', '5640012', 'SIHBIDJ1', NULL, NULL),
(131, 'PT. BANK VICTORIA INTERNATIONAL', 'Konvensional', 'JL.JENDRAL SUDIRMAN NO.1 JAKARTA', '5660018', 'VICTIDJ1', NULL, NULL),
(132, 'PT. BANK HARDA INTERNASIONAL', 'Konvensional', 'ASEAN TOWER LANTAI 3 JL.SAMANHUDI NO.10 JKT.PUSAT', '5670011', 'HRDAIDJ1', NULL, NULL),
(133, 'PT. BANK AGRIS (Formerly Bank Finconesia)', 'Konvensional', 'SENTRAL SENAYAN I LT 6 JL.ASIA AFRIKA NO.8', '9450305', 'AGSSIDJA', NULL, NULL),
(134, 'PT. BANK MAYBANK SYARIAH INDONESIA', 'Bank Syariah', 'SONAS TOPAS TOWER LT.17 JL.JEND.SUDIRMAN KAV.26JKT', '9470302', 'MBBEIDJA', NULL, NULL),
(135, 'PT. BANK CTBC INDONESIA', 'Konvensional', 'WISMA TAMARA  LANTAI 16-JL. JEND. SUDIRMAN KAV. 24 JAKARTA', '9490307', 'CTCBIDJA', NULL, NULL),
(136, 'PT. BANK COMMONWEALTH', 'Konvensional', 'GEDUNG WISMA METROPOLITAN II LT.DASAR JL.JEND.SUDIRMAN JKT', '9500307', 'BICNIDJA', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `periode_name` varchar(255) NOT NULL,
  `gsnr` varchar(255) NOT NULL,
  `collection_status` varchar(255) NOT NULL,
  `collection_reason` varchar(255) DEFAULT NULL,
  `collection_pgfill` varchar(255) DEFAULT NULL,
  `collection_newmodel` varchar(255) DEFAULT NULL,
  `collection_remind` varchar(255) DEFAULT NULL,
  `collection_display` varchar(255) DEFAULT NULL,
  `collection_missing` varchar(255) DEFAULT NULL,
  `collection_feedback` varchar(255) DEFAULT NULL,
  `collection_startload` varchar(255) DEFAULT NULL,
  `collection_dateinput` varchar(255) DEFAULT NULL,
  `collection_staffname` varchar(255) DEFAULT NULL,
  `collection_image` varchar(255) DEFAULT NULL,
  `collection_lat` varchar(255) DEFAULT NULL,
  `collection_long` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `collections`
--

INSERT INTO `collections` (`id`, `periode_name`, `gsnr`, `collection_status`, `collection_reason`, `collection_pgfill`, `collection_newmodel`, `collection_remind`, `collection_display`, `collection_missing`, `collection_feedback`, `collection_startload`, `collection_dateinput`, `collection_staffname`, `collection_image`, `collection_lat`, `collection_long`, `country`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'coba Periode', '14', 'uncollected', 'Gagal', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-21 07:09:16', '2024-02-21 07:09:16', 'Agung Putra', '65d5a19c494bb.jpeg', '-6.1164672', '106.7697308', 'ID', '2024-02-21 00:09:16', '2024-02-21 00:09:16', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`id`, `title`, `user_id`, `start`, `end`, `created_at`, `updated_at`) VALUES
(1, 'Task 1', '1', '2024-03-09 01:05:00', '2024-03-09 01:10:00', '2024-03-09 11:07:15', '2024-03-09 11:07:15'),
(2, 'Task 2', '1', '2024-03-09 01:05:00', '2024-03-09 01:10:00', '2024-03-09 11:07:45', '2024-03-09 12:44:57'),
(3, 'Task 3', '1', '2024-03-09 01:10:00', '2024-03-09 01:30:00', '2024-03-09 11:07:45', '2024-03-09 12:44:57'),
(4, 'Task 4', '1', '2024-03-10 02:45:00', '2024-03-10 02:48:00', '2024-03-09 12:45:34', '2024-03-09 12:45:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `claim_date` date NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `claim_type` enum('local','travel') NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `project_percentage` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `approved_status` enum('Wait','Approve','Reject') NOT NULL DEFAULT 'Wait',
  `approved_by` varchar(25) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `expenses`
--

INSERT INTO `expenses` (`id`, `claim_date`, `user_id`, `department`, `claim_type`, `category`, `item`, `remarks`, `currency`, `project`, `amount`, `project_percentage`, `image`, `approved_status`, `approved_by`, `approved_at`, `created_at`, `updated_at`) VALUES
(1, '2024-03-09', '1', 'Dev', 'local', 'Training', 'TrainingCosts', 'Remarks', 'IDR', '1', 10000.00, '10', '65ec8104b7b59.jpeg', 'Approve', 'Agung Putra', '2024-03-11 00:00:00', '2024-03-09 08:32:20', '2024-03-11 16:10:29'),
(2, '2024-03-12', '1', 'Dev', 'local', 'HotelPayment', 'HotelUpcountry', 'Remarks', 'IDR', '1', 10000.00, '1', '65ef8a01a7007.jpg', 'Approve', 'Agung Putra', '2024-03-11 00:00:00', '2024-03-11 15:47:29', '2024-03-11 16:18:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `menu`, `url`, `parent_id`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dashboard', 'home', NULL, 'fas fa-home', '2024-02-24 13:55:06', NULL, NULL),
(2, 'Todo list', '', NULL, 'fas fa-list', '2024-02-21 22:53:54', NULL, NULL),
(3, 'Data Collection', 'data-collection', 2, 'fas fa-envelope', '2024-02-02 11:07:48', NULL, NULL),
(4, 'Panel Servicing', 'panel-servicing', 2, 'fas fa-users', '2024-02-02 11:07:48', NULL, NULL),
(5, 'Panel Recruitment', 'panel-recruitment', 2, 'fas fa-exchange-alt', '2024-02-02 11:07:48', NULL, NULL),
(6, 'Project', 'project', NULL, 'fas fa-tasks', '2024-02-22 03:07:13', NULL, NULL),
(7, 'Expenses', '', NULL, 'fas fa-money-check', '2024-02-22 03:08:56', NULL, NULL),
(8, 'Claim', 'claim', 7, 'fas fa-receipt', '2024-02-24 07:06:39', NULL, NULL),
(9, 'Timesheet', 'timesheet', 7, 'fas fa-stream', '2024-02-25 01:04:43', NULL, NULL),
(10, 'My Expense', 'my-expense', 7, 'fas fa-wallet', '2024-03-09 22:46:19', NULL, NULL),
(11, 'Adhoc', 'adhocproject', NULL, 'fas fa-bars', '2024-02-27 01:51:44', NULL, NULL),
(12, 'Set Periode', 'set-periode', NULL, 'fas fa-calendar', '2024-02-22 03:12:49', NULL, NULL),
(13, 'Users Approve', 'users-approve', NULL, 'fas fa-user', '2024-02-22 03:12:47', NULL, NULL),
(14, 'Report', 'report', NULL, 'fas fa-download', '2024-02-22 03:12:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2024_02_02_104942_create_menu_table', 2),
(9, '2024_02_08_085924_create_shoplist_table', 5),
(11, '2024_02_07_024316_create_periodeshoplist_table', 6),
(12, '2024_02_11_150450_create_collection_table', 7),
(13, '2024_02_20_152650_create_user_detail_table', 8),
(14, '2024_02_21_071926_create_panelservicing_table', 9),
(15, '2024_02_21_081904_create_panelrecruit_table', 10),
(18, '2024_02_22_040345_create_project_table', 11),
(19, '2024_02_22_054449_create_projectdetails_table', 11),
(20, '2024_02_26_164202_create_expenses_table', 12),
(21, '2024_02_27_013019_create_adhocprojects_table', 13),
(22, '2024_02_27_013256_create_adhocprojectdetails_table', 13),
(23, '2024_02_27_022407_create_events_table', 14),
(24, '2024_03_03_005510_create_bank_models_table', 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `panelrecruits`
--

CREATE TABLE `panelrecruits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `periode_name` varchar(255) NOT NULL,
  `shopname` varchar(255) NOT NULL,
  `shoptype` varchar(255) NOT NULL,
  `shopsize` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `startload` varchar(255) NOT NULL,
  `inputdate` varchar(255) NOT NULL,
  `staffname` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `long` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `panelrecruits`
--

INSERT INTO `panelrecruits` (`id`, `periode_name`, `shopname`, `shoptype`, `shopsize`, `address`, `city`, `status`, `reason`, `startload`, `inputdate`, `staffname`, `image`, `lat`, `long`, `country`, `created_at`, `updated_at`) VALUES
(1, 'coba Periode', 'ss', 'AUDIO VISUAL SP', 'SMALL', 'de', 'BANDAR LAMPUNG, KOTA', 'yes', NULL, '2024-02-21 08:59:37', '2024-02-21 08:59:37', 'Agung Putra', '65d5bb7940a6d.jpg', '-6.1164643', '106.7697199', 'ID', '2024-02-21 01:59:37', '2024-02-21 01:59:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `panelservicings`
--

CREATE TABLE `panelservicings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `periode_name` varchar(255) NOT NULL,
  `gsnr` varchar(255) NOT NULL,
  `panelservicing_method` varchar(255) NOT NULL,
  `panelservicing_feedback` varchar(255) NOT NULL,
  `panelservicing_startload` varchar(255) NOT NULL,
  `panelservicing_inputdate` varchar(255) NOT NULL,
  `panelservicing_staffname` varchar(255) NOT NULL,
  `panelservicing_image` varchar(255) NOT NULL,
  `panelservicing_lat` varchar(255) NOT NULL,
  `panelservicing_long` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `panelservicings`
--

INSERT INTO `panelservicings` (`id`, `periode_name`, `gsnr`, `panelservicing_method`, `panelservicing_feedback`, `panelservicing_startload`, `panelservicing_inputdate`, `panelservicing_staffname`, `panelservicing_image`, `panelservicing_lat`, `panelservicing_long`, `country`, `created_at`, `updated_at`) VALUES
(1, 'coba Periode', '141', 'Presentation', 'Feedback', '2024-02-21 08:10:39', '2024-02-21 08:10:39', 'Agung Putra', '65d5afffb5740.jpg', '-6.1164758', '106.7697329', 'ID', '2024-02-21 01:10:39', '2024-02-21 01:10:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sangmoduser@gmail.com', '$2y$10$K5xNlIPcAZ2hwzxDCLxCQe3glnfl34Ps1APRYhatfxp6vtOBcCodu', '2024-02-27 10:40:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periodeshoplists`
--

CREATE TABLE `periodeshoplists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `periode_startdate` date NOT NULL,
  `periode_enddate` date NOT NULL,
  `periodeshoplist_name` varchar(255) NOT NULL,
  `periodeshoplist_gsnr` varchar(255) NOT NULL,
  `periodeshoplist_inputdate` varchar(255) NOT NULL,
  `dispatch_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  `servicing_id` int(11) DEFAULT NULL,
  `shopDetail_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `periodeshoplists`
--

INSERT INTO `periodeshoplists` (`id`, `periode_startdate`, `periode_enddate`, `periodeshoplist_name`, `periodeshoplist_gsnr`, `periodeshoplist_inputdate`, `dispatch_id`, `collection_id`, `recruitment_id`, `servicing_id`, `shopDetail_id`, `created_at`, `updated_at`) VALUES
(1, '2024-03-03', '2024-03-30', 'Test Periode Name', '14', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(2, '2024-03-03', '2024-03-30', 'Test Periode Name', '21', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(3, '2024-03-03', '2024-03-30', 'Test Periode Name', '23', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(4, '2024-03-03', '2024-03-30', 'Test Periode Name', '25', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(5, '2024-03-03', '2024-03-30', 'Test Periode Name', '29', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(6, '2024-03-03', '2024-03-30', 'Test Periode Name', '31', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(7, '2024-03-03', '2024-03-30', 'Test Periode Name', '42', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(8, '2024-03-03', '2024-03-30', 'Test Periode Name', '43', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(9, '2024-03-03', '2024-03-30', 'Test Periode Name', '63', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(10, '2024-03-03', '2024-03-30', 'Test Periode Name', '64', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(11, '2024-03-03', '2024-03-30', 'Test Periode Name', '65', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(12, '2024-03-03', '2024-03-30', 'Test Periode Name', '66', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(13, '2024-03-03', '2024-03-30', 'Test Periode Name', '67', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(14, '2024-03-03', '2024-03-30', 'Test Periode Name', '68', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(15, '2024-03-03', '2024-03-30', 'Test Periode Name', '72', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(16, '2024-03-03', '2024-03-30', 'Test Periode Name', '76', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(17, '2024-03-03', '2024-03-30', 'Test Periode Name', '89', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(18, '2024-03-03', '2024-03-30', 'Test Periode Name', '93', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(19, '2024-03-03', '2024-03-30', 'Test Periode Name', '119', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(20, '2024-03-03', '2024-03-30', 'Test Periode Name', '123', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(21, '2024-03-03', '2024-03-30', 'Test Periode Name', '131', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(22, '2024-03-03', '2024-03-30', 'Test Periode Name', '132', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(23, '2024-03-03', '2024-03-30', 'Test Periode Name', '133', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(24, '2024-03-03', '2024-03-30', 'Test Periode Name', '134', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(25, '2024-03-03', '2024-03-30', 'Test Periode Name', '136', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(26, '2024-03-03', '2024-03-30', 'Test Periode Name', '137', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(27, '2024-03-03', '2024-03-30', 'Test Periode Name', '138', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(28, '2024-03-03', '2024-03-30', 'Test Periode Name', '139', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(29, '2024-03-03', '2024-03-30', 'Test Periode Name', '141', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(30, '2024-03-03', '2024-03-30', 'Test Periode Name', '142', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(31, '2024-03-03', '2024-03-30', 'Test Periode Name', '143', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(32, '2024-03-03', '2024-03-30', 'Test Periode Name', '144', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(33, '2024-03-03', '2024-03-30', 'Test Periode Name', '145', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(34, '2024-03-03', '2024-03-30', 'Test Periode Name', '146', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(35, '2024-03-03', '2024-03-30', 'Test Periode Name', '147', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(36, '2024-03-03', '2024-03-30', 'Test Periode Name', '148', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(37, '2024-03-03', '2024-03-30', 'Test Periode Name', '149', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(38, '2024-03-03', '2024-03-30', 'Test Periode Name', '151', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(39, '2024-03-03', '2024-03-30', 'Test Periode Name', '152', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(40, '2024-03-03', '2024-03-30', 'Test Periode Name', '153', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:39', '2024-03-03 06:26:12'),
(41, '2024-03-03', '2024-03-30', 'Test Periode Name', '154', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(42, '2024-03-03', '2024-03-30', 'Test Periode Name', '161', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(43, '2024-03-03', '2024-03-30', 'Test Periode Name', '177', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(44, '2024-03-03', '2024-03-30', 'Test Periode Name', '188', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(45, '2024-03-03', '2024-03-30', 'Test Periode Name', '193', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(46, '2024-03-03', '2024-03-30', 'Test Periode Name', '194', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(47, '2024-03-03', '2024-03-30', 'Test Periode Name', '198', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(48, '2024-03-03', '2024-03-30', 'Test Periode Name', '212', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(49, '2024-03-03', '2024-03-30', 'Test Periode Name', '213', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(50, '2024-03-03', '2024-03-30', 'Test Periode Name', '222', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(51, '2024-03-03', '2024-03-30', 'Test Periode Name', '234', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(52, '2024-03-03', '2024-03-30', 'Test Periode Name', '241', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(53, '2024-03-03', '2024-03-30', 'Test Periode Name', '251', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(54, '2024-03-03', '2024-03-30', 'Test Periode Name', '258', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(55, '2024-03-03', '2024-03-30', 'Test Periode Name', '272', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(56, '2024-03-03', '2024-03-30', 'Test Periode Name', '278', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(57, '2024-03-03', '2024-03-30', 'Test Periode Name', '281', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(58, '2024-03-03', '2024-03-30', 'Test Periode Name', '283', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(59, '2024-03-03', '2024-03-30', 'Test Periode Name', '284', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(60, '2024-03-03', '2024-03-30', 'Test Periode Name', '286', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(61, '2024-03-03', '2024-03-30', 'Test Periode Name', '288', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(62, '2024-03-03', '2024-03-30', 'Test Periode Name', '292', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(63, '2024-03-03', '2024-03-30', 'Test Periode Name', '335', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(64, '2024-03-03', '2024-03-30', 'Test Periode Name', '338', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(65, '2024-03-03', '2024-03-30', 'Test Periode Name', '345', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(66, '2024-03-03', '2024-03-30', 'Test Periode Name', '346', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(67, '2024-03-03', '2024-03-30', 'Test Periode Name', '349', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(68, '2024-03-03', '2024-03-30', 'Test Periode Name', '359', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(69, '2024-03-03', '2024-03-30', 'Test Periode Name', '366', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(70, '2024-03-03', '2024-03-30', 'Test Periode Name', '383', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:12'),
(71, '2024-03-03', '2024-03-30', 'Test Periode Name', '385', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(72, '2024-03-03', '2024-03-30', 'Test Periode Name', '412', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(73, '2024-03-03', '2024-03-30', 'Test Periode Name', '455', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(74, '2024-03-03', '2024-03-30', 'Test Periode Name', '466', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(75, '2024-03-03', '2024-03-30', 'Test Periode Name', '467', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(76, '2024-03-03', '2024-03-30', 'Test Periode Name', '475', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(77, '2024-03-03', '2024-03-30', 'Test Periode Name', '491', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(78, '2024-03-03', '2024-03-30', 'Test Periode Name', '521', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(79, '2024-03-03', '2024-03-30', 'Test Periode Name', '527', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(80, '2024-03-03', '2024-03-30', 'Test Periode Name', '532', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(81, '2024-03-03', '2024-03-30', 'Test Periode Name', '535', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(82, '2024-03-03', '2024-03-30', 'Test Periode Name', '536', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(83, '2024-03-03', '2024-03-30', 'Test Periode Name', '537', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(84, '2024-03-03', '2024-03-30', 'Test Periode Name', '539', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(85, '2024-03-03', '2024-03-30', 'Test Periode Name', '551', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(86, '2024-03-03', '2024-03-30', 'Test Periode Name', '556', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(87, '2024-03-03', '2024-03-30', 'Test Periode Name', '557', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(88, '2024-03-03', '2024-03-30', 'Test Periode Name', '558', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(89, '2024-03-03', '2024-03-30', 'Test Periode Name', '559', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(90, '2024-03-03', '2024-03-30', 'Test Periode Name', '564', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(91, '2024-03-03', '2024-03-30', 'Test Periode Name', '576', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(92, '2024-03-03', '2024-03-30', 'Test Periode Name', '577', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(93, '2024-03-03', '2024-03-30', 'Test Periode Name', '589', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(94, '2024-03-03', '2024-03-30', 'Test Periode Name', '591', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(95, '2024-03-03', '2024-03-30', 'Test Periode Name', '592', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(96, '2024-03-03', '2024-03-30', 'Test Periode Name', '594', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(97, '2024-03-03', '2024-03-30', 'Test Periode Name', '596', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(98, '2024-03-03', '2024-03-30', 'Test Periode Name', '597', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(99, '2024-03-03', '2024-03-30', 'Test Periode Name', '598', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(100, '2024-03-03', '2024-03-30', 'Test Periode Name', '616', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(101, '2024-03-03', '2024-03-30', 'Test Periode Name', '617', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(102, '2024-03-03', '2024-03-30', 'Test Periode Name', '622', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(103, '2024-03-03', '2024-03-30', 'Test Periode Name', '624', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(104, '2024-03-03', '2024-03-30', 'Test Periode Name', '628', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(105, '2024-03-03', '2024-03-30', 'Test Periode Name', '629', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(106, '2024-03-03', '2024-03-30', 'Test Periode Name', '632', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(107, '2024-03-03', '2024-03-30', 'Test Periode Name', '633', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(108, '2024-03-03', '2024-03-30', 'Test Periode Name', '634', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(109, '2024-03-03', '2024-03-30', 'Test Periode Name', '635', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(110, '2024-03-03', '2024-03-30', 'Test Periode Name', '643', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:40', '2024-03-03 06:26:13'),
(111, '2024-03-03', '2024-03-30', 'Test Periode Name', '644', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(112, '2024-03-03', '2024-03-30', 'Test Periode Name', '666', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(113, '2024-03-03', '2024-03-30', 'Test Periode Name', '667', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(114, '2024-03-03', '2024-03-30', 'Test Periode Name', '673', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(115, '2024-03-03', '2024-03-30', 'Test Periode Name', '682', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(116, '2024-03-03', '2024-03-30', 'Test Periode Name', '685', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(117, '2024-03-03', '2024-03-30', 'Test Periode Name', '703', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(118, '2024-03-03', '2024-03-30', 'Test Periode Name', '721', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(119, '2024-03-03', '2024-03-30', 'Test Periode Name', '743', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(120, '2024-03-03', '2024-03-30', 'Test Periode Name', '751', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(121, '2024-03-03', '2024-03-30', 'Test Periode Name', '761', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(122, '2024-03-03', '2024-03-30', 'Test Periode Name', '762', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(123, '2024-03-03', '2024-03-30', 'Test Periode Name', '764', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(124, '2024-03-03', '2024-03-30', 'Test Periode Name', '765', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(125, '2024-03-03', '2024-03-30', 'Test Periode Name', '788', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(126, '2024-03-03', '2024-03-30', 'Test Periode Name', '792', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(127, '2024-03-03', '2024-03-30', 'Test Periode Name', '876', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(128, '2024-03-03', '2024-03-30', 'Test Periode Name', '912', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(129, '2024-03-03', '2024-03-30', 'Test Periode Name', '918', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(130, '2024-03-03', '2024-03-30', 'Test Periode Name', '921', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(131, '2024-03-03', '2024-03-30', 'Test Periode Name', '928', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(132, '2024-03-03', '2024-03-30', 'Test Periode Name', '929', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(133, '2024-03-03', '2024-03-30', 'Test Periode Name', '931', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(134, '2024-03-03', '2024-03-30', 'Test Periode Name', '941', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(135, '2024-03-03', '2024-03-30', 'Test Periode Name', '962', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(136, '2024-03-03', '2024-03-30', 'Test Periode Name', '969', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(137, '2024-03-03', '2024-03-30', 'Test Periode Name', '1034', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(138, '2024-03-03', '2024-03-30', 'Test Periode Name', '1069', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(139, '2024-03-03', '2024-03-30', 'Test Periode Name', '1070', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(140, '2024-03-03', '2024-03-30', 'Test Periode Name', '1072', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(141, '2024-03-03', '2024-03-30', 'Test Periode Name', '1074', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(142, '2024-03-03', '2024-03-30', 'Test Periode Name', '1093', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(143, '2024-03-03', '2024-03-30', 'Test Periode Name', '1094', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(144, '2024-03-03', '2024-03-30', 'Test Periode Name', '1118', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:13'),
(145, '2024-03-03', '2024-03-30', 'Test Periode Name', '1122', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(146, '2024-03-03', '2024-03-30', 'Test Periode Name', '1139', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(147, '2024-03-03', '2024-03-30', 'Test Periode Name', '1141', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(148, '2024-03-03', '2024-03-30', 'Test Periode Name', '1147', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(149, '2024-03-03', '2024-03-30', 'Test Periode Name', '1148', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(150, '2024-03-03', '2024-03-30', 'Test Periode Name', '1155', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(151, '2024-03-03', '2024-03-30', 'Test Periode Name', '1156', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(152, '2024-03-03', '2024-03-30', 'Test Periode Name', '1173', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(153, '2024-03-03', '2024-03-30', 'Test Periode Name', '1177', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(154, '2024-03-03', '2024-03-30', 'Test Periode Name', '1178', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(155, '2024-03-03', '2024-03-30', 'Test Periode Name', '1217', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(156, '2024-03-03', '2024-03-30', 'Test Periode Name', '1225', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(157, '2024-03-03', '2024-03-30', 'Test Periode Name', '1231', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(158, '2024-03-03', '2024-03-30', 'Test Periode Name', '1265', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(159, '2024-03-03', '2024-03-30', 'Test Periode Name', '1272', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(160, '2024-03-03', '2024-03-30', 'Test Periode Name', '1274', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(161, '2024-03-03', '2024-03-30', 'Test Periode Name', '1293', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(162, '2024-03-03', '2024-03-30', 'Test Periode Name', '1311', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(163, '2024-03-03', '2024-03-30', 'Test Periode Name', '1312', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(164, '2024-03-03', '2024-03-30', 'Test Periode Name', '1361', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(165, '2024-03-03', '2024-03-30', 'Test Periode Name', '1416', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(166, '2024-03-03', '2024-03-30', 'Test Periode Name', '1417', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(167, '2024-03-03', '2024-03-30', 'Test Periode Name', '1421', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(168, '2024-03-03', '2024-03-30', 'Test Periode Name', '1422', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(169, '2024-03-03', '2024-03-30', 'Test Periode Name', '1427', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(170, '2024-03-03', '2024-03-30', 'Test Periode Name', '1428', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(171, '2024-03-03', '2024-03-30', 'Test Periode Name', '1429', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(172, '2024-03-03', '2024-03-30', 'Test Periode Name', '1443', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(173, '2024-03-03', '2024-03-30', 'Test Periode Name', '1458', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(174, '2024-03-03', '2024-03-30', 'Test Periode Name', '1479', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(175, '2024-03-03', '2024-03-30', 'Test Periode Name', '1504', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(176, '2024-03-03', '2024-03-30', 'Test Periode Name', '1511', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:41', '2024-03-03 06:26:14'),
(177, '2024-03-03', '2024-03-30', 'Test Periode Name', '1517', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(178, '2024-03-03', '2024-03-30', 'Test Periode Name', '1518', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(179, '2024-03-03', '2024-03-30', 'Test Periode Name', '1549', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(180, '2024-03-03', '2024-03-30', 'Test Periode Name', '1551', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(181, '2024-03-03', '2024-03-30', 'Test Periode Name', '1564', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(182, '2024-03-03', '2024-03-30', 'Test Periode Name', '1566', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(183, '2024-03-03', '2024-03-30', 'Test Periode Name', '1572', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(184, '2024-03-03', '2024-03-30', 'Test Periode Name', '1574', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(185, '2024-03-03', '2024-03-30', 'Test Periode Name', '1575', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(186, '2024-03-03', '2024-03-30', 'Test Periode Name', '1576', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(187, '2024-03-03', '2024-03-30', 'Test Periode Name', '1581', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(188, '2024-03-03', '2024-03-30', 'Test Periode Name', '1584', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(189, '2024-03-03', '2024-03-30', 'Test Periode Name', '1585', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(190, '2024-03-03', '2024-03-30', 'Test Periode Name', '1586', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(191, '2024-03-03', '2024-03-30', 'Test Periode Name', '1588', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(192, '2024-03-03', '2024-03-30', 'Test Periode Name', '1589', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(193, '2024-03-03', '2024-03-30', 'Test Periode Name', '1596', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(194, '2024-03-03', '2024-03-30', 'Test Periode Name', '1611', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(195, '2024-03-03', '2024-03-30', 'Test Periode Name', '1624', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(196, '2024-03-03', '2024-03-30', 'Test Periode Name', '1626', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(197, '2024-03-03', '2024-03-30', 'Test Periode Name', '1653', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(198, '2024-03-03', '2024-03-30', 'Test Periode Name', '1684', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(199, '2024-03-03', '2024-03-30', 'Test Periode Name', '1685', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(200, '2024-03-03', '2024-03-30', 'Test Periode Name', '1686', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(201, '2024-03-03', '2024-03-30', 'Test Periode Name', '1694', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(202, '2024-03-03', '2024-03-30', 'Test Periode Name', '1695', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(203, '2024-03-03', '2024-03-30', 'Test Periode Name', '1715', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(204, '2024-03-03', '2024-03-30', 'Test Periode Name', '1716', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(205, '2024-03-03', '2024-03-30', 'Test Periode Name', '1717', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(206, '2024-03-03', '2024-03-30', 'Test Periode Name', '1719', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(207, '2024-03-03', '2024-03-30', 'Test Periode Name', '1753', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(208, '2024-03-03', '2024-03-30', 'Test Periode Name', '1761', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(209, '2024-03-03', '2024-03-30', 'Test Periode Name', '1762', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(210, '2024-03-03', '2024-03-30', 'Test Periode Name', '1766', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(211, '2024-03-03', '2024-03-30', 'Test Periode Name', '1769', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(212, '2024-03-03', '2024-03-30', 'Test Periode Name', '1771', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(213, '2024-03-03', '2024-03-30', 'Test Periode Name', '1773', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(214, '2024-03-03', '2024-03-30', 'Test Periode Name', '1777', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(215, '2024-03-03', '2024-03-30', 'Test Periode Name', '1778', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(216, '2024-03-03', '2024-03-30', 'Test Periode Name', '1780', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(217, '2024-03-03', '2024-03-30', 'Test Periode Name', '1781', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(218, '2024-03-03', '2024-03-30', 'Test Periode Name', '1825', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(219, '2024-03-03', '2024-03-30', 'Test Periode Name', '1842', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:14'),
(220, '2024-03-03', '2024-03-30', 'Test Periode Name', '1855', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(221, '2024-03-03', '2024-03-30', 'Test Periode Name', '1873', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(222, '2024-03-03', '2024-03-30', 'Test Periode Name', '1883', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(223, '2024-03-03', '2024-03-30', 'Test Periode Name', '1884', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(224, '2024-03-03', '2024-03-30', 'Test Periode Name', '1915', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(225, '2024-03-03', '2024-03-30', 'Test Periode Name', '1925', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(226, '2024-03-03', '2024-03-30', 'Test Periode Name', '1952', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(227, '2024-03-03', '2024-03-30', 'Test Periode Name', '1960', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(228, '2024-03-03', '2024-03-30', 'Test Periode Name', '1967', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(229, '2024-03-03', '2024-03-30', 'Test Periode Name', '1973', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(230, '2024-03-03', '2024-03-30', 'Test Periode Name', '1989', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(231, '2024-03-03', '2024-03-30', 'Test Periode Name', '1990', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(232, '2024-03-03', '2024-03-30', 'Test Periode Name', '1991', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(233, '2024-03-03', '2024-03-30', 'Test Periode Name', '1994', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(234, '2024-03-03', '2024-03-30', 'Test Periode Name', '1996', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(235, '2024-03-03', '2024-03-30', 'Test Periode Name', '2118', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(236, '2024-03-03', '2024-03-30', 'Test Periode Name', '2127', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:42', '2024-03-03 06:26:15'),
(237, '2024-03-03', '2024-03-30', 'Test Periode Name', '2128', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(238, '2024-03-03', '2024-03-30', 'Test Periode Name', '2129', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(239, '2024-03-03', '2024-03-30', 'Test Periode Name', '2131', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(240, '2024-03-03', '2024-03-30', 'Test Periode Name', '2132', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(241, '2024-03-03', '2024-03-30', 'Test Periode Name', '2133', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(242, '2024-03-03', '2024-03-30', 'Test Periode Name', '2134', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(243, '2024-03-03', '2024-03-30', 'Test Periode Name', '2135', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(244, '2024-03-03', '2024-03-30', 'Test Periode Name', '2139', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(245, '2024-03-03', '2024-03-30', 'Test Periode Name', '2158', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(246, '2024-03-03', '2024-03-30', 'Test Periode Name', '2159', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(247, '2024-03-03', '2024-03-30', 'Test Periode Name', '2217', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(248, '2024-03-03', '2024-03-30', 'Test Periode Name', '2241', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(249, '2024-03-03', '2024-03-30', 'Test Periode Name', '2243', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(250, '2024-03-03', '2024-03-30', 'Test Periode Name', '2244', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(251, '2024-03-03', '2024-03-30', 'Test Periode Name', '2246', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(252, '2024-03-03', '2024-03-30', 'Test Periode Name', '2266', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(253, '2024-03-03', '2024-03-30', 'Test Periode Name', '2275', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(254, '2024-03-03', '2024-03-30', 'Test Periode Name', '2276', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(255, '2024-03-03', '2024-03-30', 'Test Periode Name', '2278', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(256, '2024-03-03', '2024-03-30', 'Test Periode Name', '2279', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(257, '2024-03-03', '2024-03-30', 'Test Periode Name', '2286', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(258, '2024-03-03', '2024-03-30', 'Test Periode Name', '2288', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(259, '2024-03-03', '2024-03-30', 'Test Periode Name', '2294', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(260, '2024-03-03', '2024-03-30', 'Test Periode Name', '2298', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(261, '2024-03-03', '2024-03-30', 'Test Periode Name', '2299', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(262, '2024-03-03', '2024-03-30', 'Test Periode Name', '2392', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(263, '2024-03-03', '2024-03-30', 'Test Periode Name', '2393', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(264, '2024-03-03', '2024-03-30', 'Test Periode Name', '2396', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(265, '2024-03-03', '2024-03-30', 'Test Periode Name', '2397', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(266, '2024-03-03', '2024-03-30', 'Test Periode Name', '2398', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(267, '2024-03-03', '2024-03-30', 'Test Periode Name', '2401', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(268, '2024-03-03', '2024-03-30', 'Test Periode Name', '2421', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(269, '2024-03-03', '2024-03-30', 'Test Periode Name', '2430', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(270, '2024-03-03', '2024-03-30', 'Test Periode Name', '2437', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(271, '2024-03-03', '2024-03-30', 'Test Periode Name', '2469', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(272, '2024-03-03', '2024-03-30', 'Test Periode Name', '2493', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(273, '2024-03-03', '2024-03-30', 'Test Periode Name', '2522', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(274, '2024-03-03', '2024-03-30', 'Test Periode Name', '2529', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(275, '2024-03-03', '2024-03-30', 'Test Periode Name', '2549', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(276, '2024-03-03', '2024-03-30', 'Test Periode Name', '2555', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(277, '2024-03-03', '2024-03-30', 'Test Periode Name', '2557', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(278, '2024-03-03', '2024-03-30', 'Test Periode Name', '2564', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(279, '2024-03-03', '2024-03-30', 'Test Periode Name', '2572', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(280, '2024-03-03', '2024-03-30', 'Test Periode Name', '2580', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(281, '2024-03-03', '2024-03-30', 'Test Periode Name', '2583', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(282, '2024-03-03', '2024-03-30', 'Test Periode Name', '2584', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(283, '2024-03-03', '2024-03-30', 'Test Periode Name', '2593', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(284, '2024-03-03', '2024-03-30', 'Test Periode Name', '2602', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(285, '2024-03-03', '2024-03-30', 'Test Periode Name', '2606', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(286, '2024-03-03', '2024-03-30', 'Test Periode Name', '2619', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(287, '2024-03-03', '2024-03-30', 'Test Periode Name', '2621', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(288, '2024-03-03', '2024-03-30', 'Test Periode Name', '2622', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(289, '2024-03-03', '2024-03-30', 'Test Periode Name', '2629', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(290, '2024-03-03', '2024-03-30', 'Test Periode Name', '2632', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(291, '2024-03-03', '2024-03-30', 'Test Periode Name', '2652', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(292, '2024-03-03', '2024-03-30', 'Test Periode Name', '2653', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:15'),
(293, '2024-03-03', '2024-03-30', 'Test Periode Name', '2654', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:16'),
(294, '2024-03-03', '2024-03-30', 'Test Periode Name', '2655', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:43', '2024-03-03 06:26:16'),
(295, '2024-03-03', '2024-03-30', 'Test Periode Name', '2662', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(296, '2024-03-03', '2024-03-30', 'Test Periode Name', '2666', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(297, '2024-03-03', '2024-03-30', 'Test Periode Name', '2667', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(298, '2024-03-03', '2024-03-30', 'Test Periode Name', '2692', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(299, '2024-03-03', '2024-03-30', 'Test Periode Name', '2693', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(300, '2024-03-03', '2024-03-30', 'Test Periode Name', '2728', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(301, '2024-03-03', '2024-03-30', 'Test Periode Name', '2732', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(302, '2024-03-03', '2024-03-30', 'Test Periode Name', '2736', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(303, '2024-03-03', '2024-03-30', 'Test Periode Name', '2743', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(304, '2024-03-03', '2024-03-30', 'Test Periode Name', '2760', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(305, '2024-03-03', '2024-03-30', 'Test Periode Name', '2778', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(306, '2024-03-03', '2024-03-30', 'Test Periode Name', '2779', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(307, '2024-03-03', '2024-03-30', 'Test Periode Name', '2784', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(308, '2024-03-03', '2024-03-30', 'Test Periode Name', '2788', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(309, '2024-03-03', '2024-03-30', 'Test Periode Name', '2793', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(310, '2024-03-03', '2024-03-30', 'Test Periode Name', '2809', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(311, '2024-03-03', '2024-03-30', 'Test Periode Name', '2828', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(312, '2024-03-03', '2024-03-30', 'Test Periode Name', '2842', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(313, '2024-03-03', '2024-03-30', 'Test Periode Name', '2843', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(314, '2024-03-03', '2024-03-30', 'Test Periode Name', '2848', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(315, '2024-03-03', '2024-03-30', 'Test Periode Name', '2850', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(316, '2024-03-03', '2024-03-30', 'Test Periode Name', '2854', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(317, '2024-03-03', '2024-03-30', 'Test Periode Name', '2874', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(318, '2024-03-03', '2024-03-30', 'Test Periode Name', '2882', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(319, '2024-03-03', '2024-03-30', 'Test Periode Name', '2884', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(320, '2024-03-03', '2024-03-30', 'Test Periode Name', '2926', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(321, '2024-03-03', '2024-03-30', 'Test Periode Name', '2932', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(322, '2024-03-03', '2024-03-30', 'Test Periode Name', '2933', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(323, '2024-03-03', '2024-03-30', 'Test Periode Name', '2937', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(324, '2024-03-03', '2024-03-30', 'Test Periode Name', '2938', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(325, '2024-03-03', '2024-03-30', 'Test Periode Name', '2945', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(326, '2024-03-03', '2024-03-30', 'Test Periode Name', '2946', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(327, '2024-03-03', '2024-03-30', 'Test Periode Name', '2953', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(328, '2024-03-03', '2024-03-30', 'Test Periode Name', '2969', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16');
INSERT INTO `periodeshoplists` (`id`, `periode_startdate`, `periode_enddate`, `periodeshoplist_name`, `periodeshoplist_gsnr`, `periodeshoplist_inputdate`, `dispatch_id`, `collection_id`, `recruitment_id`, `servicing_id`, `shopDetail_id`, `created_at`, `updated_at`) VALUES
(329, '2024-03-03', '2024-03-30', 'Test Periode Name', '2973', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(330, '2024-03-03', '2024-03-30', 'Test Periode Name', '2998', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(331, '2024-03-03', '2024-03-30', 'Test Periode Name', '3006', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(332, '2024-03-03', '2024-03-30', 'Test Periode Name', '3011', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(333, '2024-03-03', '2024-03-30', 'Test Periode Name', '3060', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(334, '2024-03-03', '2024-03-30', 'Test Periode Name', '3101', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(335, '2024-03-03', '2024-03-30', 'Test Periode Name', '3121', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(336, '2024-03-03', '2024-03-30', 'Test Periode Name', '3171', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(337, '2024-03-03', '2024-03-30', 'Test Periode Name', '3172', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(338, '2024-03-03', '2024-03-30', 'Test Periode Name', '3176', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(339, '2024-03-03', '2024-03-30', 'Test Periode Name', '3182', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(340, '2024-03-03', '2024-03-30', 'Test Periode Name', '3183', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(341, '2024-03-03', '2024-03-30', 'Test Periode Name', '3196', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(342, '2024-03-03', '2024-03-30', 'Test Periode Name', '3198', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(343, '2024-03-03', '2024-03-30', 'Test Periode Name', '3200', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(344, '2024-03-03', '2024-03-30', 'Test Periode Name', '3224', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(345, '2024-03-03', '2024-03-30', 'Test Periode Name', '3231', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(346, '2024-03-03', '2024-03-30', 'Test Periode Name', '3233', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(347, '2024-03-03', '2024-03-30', 'Test Periode Name', '3234', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(348, '2024-03-03', '2024-03-30', 'Test Periode Name', '3235', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(349, '2024-03-03', '2024-03-30', 'Test Periode Name', '3238', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:44', '2024-03-03 06:26:16'),
(350, '2024-03-03', '2024-03-30', 'Test Periode Name', '3249', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(351, '2024-03-03', '2024-03-30', 'Test Periode Name', '3252', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(352, '2024-03-03', '2024-03-30', 'Test Periode Name', '3253', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(353, '2024-03-03', '2024-03-30', 'Test Periode Name', '3254', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(354, '2024-03-03', '2024-03-30', 'Test Periode Name', '3255', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(355, '2024-03-03', '2024-03-30', 'Test Periode Name', '3257', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(356, '2024-03-03', '2024-03-30', 'Test Periode Name', '3261', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(357, '2024-03-03', '2024-03-30', 'Test Periode Name', '3263', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(358, '2024-03-03', '2024-03-30', 'Test Periode Name', '3267', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(359, '2024-03-03', '2024-03-30', 'Test Periode Name', '3268', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(360, '2024-03-03', '2024-03-30', 'Test Periode Name', '3269', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(361, '2024-03-03', '2024-03-30', 'Test Periode Name', '3271', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(362, '2024-03-03', '2024-03-30', 'Test Periode Name', '3272', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(363, '2024-03-03', '2024-03-30', 'Test Periode Name', '3273', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(364, '2024-03-03', '2024-03-30', 'Test Periode Name', '3281', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:16'),
(365, '2024-03-03', '2024-03-30', 'Test Periode Name', '3283', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(366, '2024-03-03', '2024-03-30', 'Test Periode Name', '3285', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(367, '2024-03-03', '2024-03-30', 'Test Periode Name', '3286', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(368, '2024-03-03', '2024-03-30', 'Test Periode Name', '3287', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(369, '2024-03-03', '2024-03-30', 'Test Periode Name', '3298', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(370, '2024-03-03', '2024-03-30', 'Test Periode Name', '3301', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(371, '2024-03-03', '2024-03-30', 'Test Periode Name', '3306', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(372, '2024-03-03', '2024-03-30', 'Test Periode Name', '3310', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(373, '2024-03-03', '2024-03-30', 'Test Periode Name', '3311', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(374, '2024-03-03', '2024-03-30', 'Test Periode Name', '3312', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(375, '2024-03-03', '2024-03-30', 'Test Periode Name', '3313', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(376, '2024-03-03', '2024-03-30', 'Test Periode Name', '3314', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(377, '2024-03-03', '2024-03-30', 'Test Periode Name', '3315', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(378, '2024-03-03', '2024-03-30', 'Test Periode Name', '3316', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(379, '2024-03-03', '2024-03-30', 'Test Periode Name', '3318', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(380, '2024-03-03', '2024-03-30', 'Test Periode Name', '3320', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(381, '2024-03-03', '2024-03-30', 'Test Periode Name', '3321', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(382, '2024-03-03', '2024-03-30', 'Test Periode Name', '3322', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(383, '2024-03-03', '2024-03-30', 'Test Periode Name', '3325', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(384, '2024-03-03', '2024-03-30', 'Test Periode Name', '3328', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(385, '2024-03-03', '2024-03-30', 'Test Periode Name', '3329', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(386, '2024-03-03', '2024-03-30', 'Test Periode Name', '3330', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(387, '2024-03-03', '2024-03-30', 'Test Periode Name', '3334', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(388, '2024-03-03', '2024-03-30', 'Test Periode Name', '3343', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(389, '2024-03-03', '2024-03-30', 'Test Periode Name', '3345', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(390, '2024-03-03', '2024-03-30', 'Test Periode Name', '3353', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(391, '2024-03-03', '2024-03-30', 'Test Periode Name', '3354', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(392, '2024-03-03', '2024-03-30', 'Test Periode Name', '3355', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(393, '2024-03-03', '2024-03-30', 'Test Periode Name', '3357', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(394, '2024-03-03', '2024-03-30', 'Test Periode Name', '3362', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(395, '2024-03-03', '2024-03-30', 'Test Periode Name', '3365', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(396, '2024-03-03', '2024-03-30', 'Test Periode Name', '3367', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(397, '2024-03-03', '2024-03-30', 'Test Periode Name', '3369', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(398, '2024-03-03', '2024-03-30', 'Test Periode Name', '3371', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(399, '2024-03-03', '2024-03-30', 'Test Periode Name', '3373', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(400, '2024-03-03', '2024-03-30', 'Test Periode Name', '3374', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(401, '2024-03-03', '2024-03-30', 'Test Periode Name', '3375', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(402, '2024-03-03', '2024-03-30', 'Test Periode Name', '3376', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(403, '2024-03-03', '2024-03-30', 'Test Periode Name', '3387', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(404, '2024-03-03', '2024-03-30', 'Test Periode Name', '3390', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:45', '2024-03-03 06:26:17'),
(405, '2024-03-03', '2024-03-30', 'Test Periode Name', '3391', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(406, '2024-03-03', '2024-03-30', 'Test Periode Name', '3400', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(407, '2024-03-03', '2024-03-30', 'Test Periode Name', '3401', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(408, '2024-03-03', '2024-03-30', 'Test Periode Name', '3412', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(409, '2024-03-03', '2024-03-30', 'Test Periode Name', '3414', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(410, '2024-03-03', '2024-03-30', 'Test Periode Name', '3416', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(411, '2024-03-03', '2024-03-30', 'Test Periode Name', '3417', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(412, '2024-03-03', '2024-03-30', 'Test Periode Name', '3421', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(413, '2024-03-03', '2024-03-30', 'Test Periode Name', '3422', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(414, '2024-03-03', '2024-03-30', 'Test Periode Name', '3426', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(415, '2024-03-03', '2024-03-30', 'Test Periode Name', '3432', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(416, '2024-03-03', '2024-03-30', 'Test Periode Name', '3439', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(417, '2024-03-03', '2024-03-30', 'Test Periode Name', '3443', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(418, '2024-03-03', '2024-03-30', 'Test Periode Name', '3448', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(419, '2024-03-03', '2024-03-30', 'Test Periode Name', '3454', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(420, '2024-03-03', '2024-03-30', 'Test Periode Name', '3456', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(421, '2024-03-03', '2024-03-30', 'Test Periode Name', '3457', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(422, '2024-03-03', '2024-03-30', 'Test Periode Name', '3458', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(423, '2024-03-03', '2024-03-30', 'Test Periode Name', '3459', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(424, '2024-03-03', '2024-03-30', 'Test Periode Name', '3461', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(425, '2024-03-03', '2024-03-30', 'Test Periode Name', '3462', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(426, '2024-03-03', '2024-03-30', 'Test Periode Name', '3471', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(427, '2024-03-03', '2024-03-30', 'Test Periode Name', '3491', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(428, '2024-03-03', '2024-03-30', 'Test Periode Name', '3510', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(429, '2024-03-03', '2024-03-30', 'Test Periode Name', '3512', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(430, '2024-03-03', '2024-03-30', 'Test Periode Name', '3525', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(431, '2024-03-03', '2024-03-30', 'Test Periode Name', '3543', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(432, '2024-03-03', '2024-03-30', 'Test Periode Name', '3550', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(433, '2024-03-03', '2024-03-30', 'Test Periode Name', '3563', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:17'),
(434, '2024-03-03', '2024-03-30', 'Test Periode Name', '3566', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(435, '2024-03-03', '2024-03-30', 'Test Periode Name', '3571', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(436, '2024-03-03', '2024-03-30', 'Test Periode Name', '3579', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(437, '2024-03-03', '2024-03-30', 'Test Periode Name', '3582', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(438, '2024-03-03', '2024-03-30', 'Test Periode Name', '3584', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(439, '2024-03-03', '2024-03-30', 'Test Periode Name', '3585', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(440, '2024-03-03', '2024-03-30', 'Test Periode Name', '3587', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(441, '2024-03-03', '2024-03-30', 'Test Periode Name', '3588', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(442, '2024-03-03', '2024-03-30', 'Test Periode Name', '3589', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(443, '2024-03-03', '2024-03-30', 'Test Periode Name', '3599', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(444, '2024-03-03', '2024-03-30', 'Test Periode Name', '3623', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(445, '2024-03-03', '2024-03-30', 'Test Periode Name', '3649', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(446, '2024-03-03', '2024-03-30', 'Test Periode Name', '3672', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(447, '2024-03-03', '2024-03-30', 'Test Periode Name', '3673', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(448, '2024-03-03', '2024-03-30', 'Test Periode Name', '3674', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(449, '2024-03-03', '2024-03-30', 'Test Periode Name', '3677', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(450, '2024-03-03', '2024-03-30', 'Test Periode Name', '3679', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(451, '2024-03-03', '2024-03-30', 'Test Periode Name', '3680', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(452, '2024-03-03', '2024-03-30', 'Test Periode Name', '3696', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(453, '2024-03-03', '2024-03-30', 'Test Periode Name', '3705', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(454, '2024-03-03', '2024-03-30', 'Test Periode Name', '3718', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(455, '2024-03-03', '2024-03-30', 'Test Periode Name', '3757', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(456, '2024-03-03', '2024-03-30', 'Test Periode Name', '3760', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(457, '2024-03-03', '2024-03-30', 'Test Periode Name', '3761', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(458, '2024-03-03', '2024-03-30', 'Test Periode Name', '3766', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(459, '2024-03-03', '2024-03-30', 'Test Periode Name', '3767', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(460, '2024-03-03', '2024-03-30', 'Test Periode Name', '3793', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(461, '2024-03-03', '2024-03-30', 'Test Periode Name', '3794', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(462, '2024-03-03', '2024-03-30', 'Test Periode Name', '3808', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:46', '2024-03-03 06:26:18'),
(463, '2024-03-03', '2024-03-30', 'Test Periode Name', '3810', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(464, '2024-03-03', '2024-03-30', 'Test Periode Name', '3843', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(465, '2024-03-03', '2024-03-30', 'Test Periode Name', '3845', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(466, '2024-03-03', '2024-03-30', 'Test Periode Name', '3848', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(467, '2024-03-03', '2024-03-30', 'Test Periode Name', '3849', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(468, '2024-03-03', '2024-03-30', 'Test Periode Name', '3851', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(469, '2024-03-03', '2024-03-30', 'Test Periode Name', '3853', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(470, '2024-03-03', '2024-03-30', 'Test Periode Name', '3855', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(471, '2024-03-03', '2024-03-30', 'Test Periode Name', '3863', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(472, '2024-03-03', '2024-03-30', 'Test Periode Name', '3867', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(473, '2024-03-03', '2024-03-30', 'Test Periode Name', '3868', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(474, '2024-03-03', '2024-03-30', 'Test Periode Name', '3880', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(475, '2024-03-03', '2024-03-30', 'Test Periode Name', '3883', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(476, '2024-03-03', '2024-03-30', 'Test Periode Name', '3884', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(477, '2024-03-03', '2024-03-30', 'Test Periode Name', '3885', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(478, '2024-03-03', '2024-03-30', 'Test Periode Name', '3886', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(479, '2024-03-03', '2024-03-30', 'Test Periode Name', '3902', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(480, '2024-03-03', '2024-03-30', 'Test Periode Name', '3912', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(481, '2024-03-03', '2024-03-30', 'Test Periode Name', '3916', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(482, '2024-03-03', '2024-03-30', 'Test Periode Name', '3922', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(483, '2024-03-03', '2024-03-30', 'Test Periode Name', '3923', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(484, '2024-03-03', '2024-03-30', 'Test Periode Name', '3924', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(485, '2024-03-03', '2024-03-30', 'Test Periode Name', '3925', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(486, '2024-03-03', '2024-03-30', 'Test Periode Name', '3957', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(487, '2024-03-03', '2024-03-30', 'Test Periode Name', '3991', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(488, '2024-03-03', '2024-03-30', 'Test Periode Name', '3998', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(489, '2024-03-03', '2024-03-30', 'Test Periode Name', '3999', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(490, '2024-03-03', '2024-03-30', 'Test Periode Name', '4001', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(491, '2024-03-03', '2024-03-30', 'Test Periode Name', '4004', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(492, '2024-03-03', '2024-03-30', 'Test Periode Name', '4006', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(493, '2024-03-03', '2024-03-30', 'Test Periode Name', '4014', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(494, '2024-03-03', '2024-03-30', 'Test Periode Name', '4036', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(495, '2024-03-03', '2024-03-30', 'Test Periode Name', '4068', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(496, '2024-03-03', '2024-03-30', 'Test Periode Name', '4104', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(497, '2024-03-03', '2024-03-30', 'Test Periode Name', '4105', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(498, '2024-03-03', '2024-03-30', 'Test Periode Name', '4106', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18'),
(499, '2024-03-03', '2024-03-30', 'Test Periode Name', '4107', '2024-03-03', NULL, NULL, NULL, NULL, NULL, '2024-03-03 06:25:47', '2024-03-03 06:26:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `projectdetails`
--

CREATE TABLE `projectdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `projectdetails`
--

INSERT INTO `projectdetails` (`id`, `project_id`, `user_id`, `salary`, `country`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1000', 'ID', '2024-03-08 00:06:17', '2024-03-08 00:06:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `wbs_number` varchar(255) DEFAULT NULL,
  `cost_center` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remark` varchar(255) NOT NULL,
  `manage` varchar(255) NOT NULL,
  `budget` decimal(15,2) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `projects`
--

INSERT INTO `projects` (`id`, `parent_id`, `wbs_number`, `cost_center`, `name`, `description`, `remark`, `manage`, `budget`, `startdate`, `enddate`, `country`, `created_at`, `updated_at`) VALUES
(1, NULL, '3', 'Cost', 'Project Name', 'Description', 'Remarks', 'Need', 10000.00, '2024-03-08', '2024-03-31', 'ID', '2024-03-08 00:06:17', '2024-03-11 15:15:00'),
(2, NULL, '1', 'a', 'Project Name 1', NULL, 'Remarks', 'a', 10000.00, '2024-03-12', '2024-03-31', 'ID', '2024-03-11 15:16:11', '2024-03-11 15:16:11'),
(3, NULL, '1', '1', '1', 'a', 'a', 'a', 10000.00, '2024-03-12', '2024-03-31', 'ID', '2024-03-11 15:30:46', '2024-03-11 15:36:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shoplists`
--

CREATE TABLE `shoplists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project` varchar(255) DEFAULT NULL,
  `sh_type` varchar(255) DEFAULT NULL,
  `gsnr` varchar(255) NOT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `shop_type` varchar(255) DEFAULT NULL,
  `assembled` varchar(255) DEFAULT NULL,
  `a_clients` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region2` varchar(255) DEFAULT NULL,
  `organisat_type` varchar(255) DEFAULT NULL,
  `shopsize1` varchar(255) DEFAULT NULL,
  `sample_status` varchar(255) DEFAULT NULL,
  `metode_konversi` varchar(255) DEFAULT NULL,
  `penyampaian_ke_gfK` varchar(255) DEFAULT NULL,
  `datadeliverytyp` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `data_collector` varchar(255) DEFAULT NULL,
  `base_staff` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `courier` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `v_type` varchar(255) DEFAULT NULL,
  `v_amount` varchar(255) DEFAULT NULL,
  `kelipatan_25` varchar(255) DEFAULT NULL,
  `spv` varchar(255) DEFAULT NULL,
  `spv_id` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `nameofshop` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `shoplists`
--

INSERT INTO `shoplists` (`id`, `project`, `sh_type`, `gsnr`, `shop_name`, `city`, `channel_name`, `shop_type`, `assembled`, `a_clients`, `region`, `region2`, `organisat_type`, `shopsize1`, `sample_status`, `metode_konversi`, `penyampaian_ke_gfK`, `datadeliverytyp`, `schedule`, `data_collector`, `base_staff`, `area`, `street`, `delivery_address`, `courier`, `telephone`, `mobile_phone`, `contact_person`, `v_type`, `v_amount`, `kelipatan_25`, `spv`, `spv_id`, `country`, `nameofshop`, `created_at`, `updated_at`) VALUES
(1, 'Business as usual (Regular)', 'TCS', '14', 'SUCCESS FONE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Galeria Lt. 2 NO. 826', NULL, 'Field', '31-531931-12', '31-834179', 'Mr. Natan', 'None', '0', ' ', 'Hariyanto', '', 'ID', '14-SUCCESS FONE-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(2, 'Business as usual (Regular)', 'ITS', '21', 'CV. TUNAS ABADI', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', '< untuk dilengkapi >', NULL, 'Field', '31-5478673', ' ', 'Ms. Yani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '21-CV. TUNAS ABADI-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(3, 'Business as usual (Regular)', 'PHO', '23', 'DIGITAL CENTER', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1A / 49', NULL, 'Field', '31-531745', ' ', 'Ms. Liss', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '23-DIGITAL CENTER-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(4, 'Business as usual (Regular)', 'CTS', '25', 'GAJAH MAS BAN', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', 'BRIDGESTONE', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Mulyosari 131', NULL, 'Field', '31-5935324', '31-5993227', 'Ms. Yuni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '25-GAJAH MAS BAN-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(5, 'Business as usual (Regular)', 'CONS', '29', 'SUPER INKER PRATAMA', 'SURABAYA, KOTA', 'Consumable Specialists', 'CARTRIDGE SHOPS', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 2E / 11', NULL, 'Field', '31-848138 ext 312', NULL, 'Mr. Edi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '29-SUPER INKER PRATAMA-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(6, 'Sample enhancement', 'TCS', '31', 'MEGA CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'WTC', 'WTC lantai 2 No 23 surabaya', NULL, 'Field', ' ', '87855852777', 'Ms. Mona', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '31-MEGA CELL-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(7, 'Business as usual (Regular)', 'TCS', '42', 'REY CELLULAR', 'PALEMBANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM PAPER', 'Regular', NULL, 'PALEMBANG', NULL, 'Megahria Shoping Centre Lt. 2 ', NULL, 'Field', '8127841567', '0711-7359796', 'Mr. Owen', 'None', '0', ' ', 'Murbeng Lelana', '', 'ID', '42-REY CELLULAR-PALEMBANG, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(8, 'Business as usual (Regular)', 'ITS', '43', 'SURABAYA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. Dasar D / 44', NULL, 'Field', '31-5311366', '31-7767934', 'Ms. Rini', 'None', '0', ' ', 'Hariyanto', '', 'ID', '43-SURABAYA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(9, 'Business as usual (Regular)', 'TCS', '63', 'BEAUTY CELLULAR (HI-TECH)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. Dasar C1 No. 26-27', NULL, 'Field', '31-5478655', '31-799991', 'Ms. Bety', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '63-BEAUTY CELLULAR (HI-TECH)-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(10, 'Business as usual (Regular)', 'TCS', '64', 'BEAUTY CELLULAR (ROYAL PLAZA)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Royal Plaza', 'Royal Plaza Lt. 2 K1 No. 3', NULL, 'Field', '31-8271656', '882335613', 'Ms. Lina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '64-BEAUTY CELLULAR (ROYAL PLAZA)-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(11, 'Business as usual (Regular)', 'TCS', '65', 'SMILE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plasa Marina Lt. III H-549', NULL, 'Field', '31-8475888 ext 549', NULL, 'Ms. Yuni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '65-SMILE-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(12, 'Business as usual (Regular)', 'TCS', '66', 'UNIVERSAL CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. II H-235', NULL, 'Field', '31-8474235', '85733475595', 'Ms.Devi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '66-UNIVERSAL CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(13, 'Business as usual (Regular)', 'TCS', '67', 'PITCELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 2 no 219', NULL, 'Field', '31-7636185', ' ', 'Ms.Rosa', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '67-PITCELL-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(14, 'Business as usual (Regular)', 'TCS', '68', 'TOM-TOM', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Surabaya Lt. 2', NULL, 'Field', '< untuk dilengkapi >', NULL, 'Ms. Nisa/Ms. Is', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '68-TOM-TOM-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(15, 'Business as usual (Regular)', 'VSP', '72', 'DOBEL - CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. SUTOREJO 136', NULL, 'Field', '8565569864', ' ', 'MRS. UMI', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '72-DOBEL - CELL-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(16, 'Business as usual (Regular)', 'IACC/IPPS', '76', 'WILSON COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. Dasar B-19A', NULL, 'Field', '85633943', ' ', 'Ms. Ririn', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '76-WILSON COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(17, 'Business as usual (Regular)', 'CTY', '89', 'GBT LARAS IMBANG', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raden Saleh No. 18-2', NULL, 'Field', '31-5321521', '811318823', 'Mrs. Theresia', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '89-GBT LARAS IMBANG-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(18, 'Business as usual (Regular)', 'ITS', '93', 'FAST N CHEAP', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'ITC Mega Grosir Blok G1 No. 5-6 Jl. Gembong No. 2-3', 'olivelove_popeye@yahoo.co.id', 'Field', '31-374381', '857334634', 'Ms. Olivia', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '93-FAST N CHEAP-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(19, '2018 BAU', 'TCS', '119', 'MULTI SELULAR (*)', 'JAKARTA PUSAT, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Eka.Sugiarti', 'JAKARTA', 'ITC Roxy Mas', 'ITC Roxy Mas Lt. 3 No. 137-138', 'irwan.multi@gmail.com / ridwan.378@gmail.com', 'Casual', '02134835112', '081905551777', 'Mr. Irwan', 'OVO', '6', 'Yes', 'Sutrio', '', 'ID', '119-MULTI SELULAR (*)-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(20, 'Business as usual (Regular)', 'TCS', '123', 'DUTA CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 2 / 249', NULL, 'Field', '3177782333', '31-71619596', 'Mr. Anton/ Ms. Arni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '123-DUTA CELL-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(21, 'Business as usual (Regular)', 'IACC/IPPS', '131', 'SUMBER MULYA', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. Dasar D /42', NULL, 'Field', '31-77986532', ' ', 'Mr. Santoso', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '131-SUMBER MULYA-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(22, 'Business as usual (Regular)', 'INBS', '132', 'X-BOOK', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. 1B-28', NULL, 'Field', '8573299288', '83854192188', 'Ms. Rina ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '132-X-BOOK-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(23, 'Business as usual (Regular)', 'TCS', '133', 'CELLULAR WORLD (WTC)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', 'WTC', 'WTC Lt. 4 R. 445', NULL, 'Field', 'Lengkapi bila ada', '8585611164', 'Mr. Hamim', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '133-CELLULAR WORLD (WTC)-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(24, 'Business as usual (Regular)', 'TCS', '134', 'EIFFEL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. II. Ruang 212', NULL, 'Field', '31-8417172', ' ', 'Mr. Rizki', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '134-EIFFEL-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(25, 'Business as usual (Regular)', 'TCS', '136', 'OSCAR PHONE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC. LT. III / R. 352', NULL, 'Field', '31-6225177', '31-71197969', 'Ms. Rini', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '136-OSCAR PHONE-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(26, 'Business as usual (Regular)', 'TCS', '137', 'PERDANA CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'WTC', 'WTC LT 1 /724', NULL, 'Field', ' ', '813314555', 'Mr. Wiska', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '137-PERDANA CELL-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(27, 'Business as usual (Regular)', 'TCS', '138', 'SENTRA', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC. LT. I / R. 73', NULL, 'Field', '31-531931', ' ', 'Ms. Nanik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '138-SENTRA-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(28, 'Business as usual (Regular)', 'IACC', '139', 'MARVEL KOMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Hi - Tech Mall', 'Hi-Tech Mall Lt 1 Blok C No 9', NULL, 'Field', '31-78369989', '85232837513', 'Mr. Rudi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '139-MARVEL KOMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(29, 'Business as usual (Regular)', 'TCS', '141', 'ANDA CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Galeria Lt. 2 88', NULL, 'Field', '85852383', ' ', 'Ms. Tria', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '141-ANDA CELL-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(30, 'Business as usual (Regular)', 'TCS', '142', 'ASTRO CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Siwalankerto 12 (Dekat Kampus Petra)', NULL, 'Field', '817937324', ' ', 'Ms. Diyani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '142-ASTRO CELL-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(31, 'Business as usual (Regular)', 'TCS', '143', 'BURSA CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plasa Marina Lt. 11 blok H 23', 'ariagustina27@gmail.com', 'Field', '32 8475888 EXT 245', ' 856-314165', 'Ms Nikmah', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '143-BURSA CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(32, 'Business as usual (Regular)', 'TCS', '144', 'CELLULAR WORLD (MARINA)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2. C. 12', 'nov.ryan@gmail.com', 'Field', '31-91782222', '8134321918', 'Mr. Ryan', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '144-CELLULAR WORLD (MARINA)-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(33, 'Business as usual (Regular)', 'TCS', '145', 'HMD CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 2 / 239', NULL, 'Field', '81233994412', '81233994412', 'Mr. Hamid', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '145-HMD CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(34, 'Business as usual (Regular)', 'TCS', '146', 'SAN SAN (NEW 88)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Surabaya 6-7', NULL, 'Field', '85788726551', ' ', 'Ms Linda / Ms. Endang', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '146-SAN SAN (NEW 88)-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(35, 'Business as usual (Regular)', 'TCS', '147', 'TRENZ CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 1 Ruang 715', NULL, 'Field', '31-5313569', ' ', 'Ms. Dilla', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '147-TRENZ CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(36, 'Business as usual (Regular)', 'TCS', '148', 'CM', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 1 173-174', NULL, 'Field', '31-546363', ' ', 'Mr. Hartanto  ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '148-CM-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(37, 'Business as usual (Regular)', 'TCS', '149', 'FIRST PHONE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Galeria Lt. 2 / 244', NULL, 'Field', '31-5482267', ' ', 'Mrs. Susan', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '149-FIRST PHONE-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(38, 'Business as usual (Regular)', 'TCS', '151', 'SINAR CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 2 / 241', NULL, 'Field', '85645433393', ' ', 'Ms. Annie', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '151-SINAR CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(39, 'Business as usual (Regular)', 'TCS', '152', 'LAS VEGAS', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2. H. 241', 'Saimy_sasuke85@yahoo.com', 'Field', ' ', '878552999', 'Ms. Yuni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '152-LAS VEGAS-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(40, 'Business as usual (Regular)', 'TCS', '153', 'S CELL (PT SINAR JAYA SUKSES MANDIRI)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 2. H. 21', NULL, 'Field', '318411722', ' ', 'Ms. Mia', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '153-S CELL (PT SINAR JAYA SUKSES MANDIRI)-SURABAYA, KOTA', '2024-03-03 06:25:39', '2024-03-03 06:25:39'),
(41, 'Business as usual (Regular)', 'TCS', '154', 'RADJA (COUNTER)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 3. H. 534 (Counter Radja)', NULL, 'Field', '3184322', ' ', 'Ms. Rifa', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '154-RADJA (COUNTER)-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(42, 'Business as usual (Regular)', 'SPBU', '161', 'SPBU 54 - 61 - 35', 'SURABAYA, KOTA', 'Gas Stations', NULL, ' ', 'PERTAMINA', 'EAST JAVA', '0', 'CHAINS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Darmo Indah Timur', NULL, 'Field', '8213122466', ' ', 'Mr. Muhajir', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '161-SPBU 54 - 61 - 35-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(43, 'Business as usual (Regular)', 'GES', '177', 'MAJU BERSAMA 2', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Tambak ReJO 37A', NULL, 'Field', '31-376183', '31-3717617', 'Ms. Nonik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '177-MAJU BERSAMA 2-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(44, 'Business as usual (Regular)', 'TCS', '188', 'CHANNEL COM', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Maspion Square C-1', NULL, 'Field', '821431179', '31-781925', 'Mrs. Astrid', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '188-CHANNEL COM-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(45, 'Business as usual (Regular)', 'IACC/IPPS', '193', 'EMPIRE', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1A / 2-3', NULL, 'Field', '31-5321168', ' ', 'Ms. Anik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '193-EMPIRE-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(46, 'Business as usual (Regular)', 'IASS', '194', 'GLORINDO COMPUTER CENTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Ngagel Jaya Tengah 52', NULL, 'Field', '31-526475', ' ', 'Mr. Chandra ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '194-GLORINDO COMPUTER CENTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(47, 'Business as usual (Regular)', 'IACC/IPPS', '198', 'SUMBER MAKMUR JAYA KOMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hitech Mall Lt. dasar C 2', NULL, 'Field', '31-5345325/5345325', NULL, 'Mrs.Tatik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '198-SUMBER MAKMUR JAYA KOMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(48, 'Business as usual (Regular)', 'IASS', '212', 'SINAR MAS COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', 'Hi - Tech Mall', 'Hi-Tech Mall Lt. Dasar D / 61', NULL, 'Field', '31-5356939', '87851838989', 'Mr. Michael Yang', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '212-SINAR MAS COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(49, 'Business as usual (Regular)', 'PHO', '213', 'SINAR BAHAGIA', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', '< untuk dilengkapi >', NULL, 'Field', '31-5342513', '31-5322844', 'Ms. Upik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '213-SINAR BAHAGIA-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(50, 'Business as usual (Regular)', 'ITS', '222', 'GAMMA MICROTECH COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Kertajaya 76', 'gammamicrotech@gmail.com', 'Field', '31-5184', ' ', 'Mr. Sugiarto', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '222-GAMMA MICROTECH COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(51, 'Business as usual (Regular)', 'ITS', '234', 'CHIPS', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1A / 34', NULL, 'Field', '31-5471844', ' ', 'Ms. Ima', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '234-CHIPS-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(52, 'Business as usual (Regular)', 'ITS', '241', 'NUSANTARA POLAR', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1A / 24', NULL, 'Field', '31-5345485', '31-5348981', 'Ms. Novan', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '241-NUSANTARA POLAR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(53, 'Business as usual (Regular)', 'CTS', '251', 'GBT LARAS IMBANG', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. NGAGEL JAYA 74', NULL, 'Field', '31-52496', ' ', 'Miss. Nisa/ Reny', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '251-GBT LARAS IMBANG-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(54, 'Business as usual (Regular)', 'IACC', '258', 'NEXT COMP', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt 2 Blok D - 2', 'nextcomp2@yahoo.com/nextcomp2@gmail.com/dJOito@gmail.com', 'Field', '31-848138 Ext 224', 'Lengkapi bila ada', 'Mr. Djoito', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '258-NEXT COMP-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(55, 'Business as usual (Regular)', 'EGO', '272', 'UD MITOR', 'SURABAYA, KOTA', 'Car Accessories Specialists', 'ENGINE OIL SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jalan Gembong Tebasan 31 Surabaya', NULL, 'Field', '31-3765116', '31-3765498', 'Mr. Agus Juanda', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '272-UD MITOR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(56, 'Business as usual (Regular)', 'ML', '278', 'CATHAY PACIFIC', 'SURABAYA, KOTA', 'Minilabs', ' ', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', '< untuk dilengkapi >', NULL, 'Field', '31-5451272', '31-5451275', 'Mrs. Lisa', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '278-CATHAY PACIFIC-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(57, 'Business as usual (Regular)', 'DIY', '281', 'SUMBANG SURUNG \'89', 'SURABAYA, KOTA', 'DIY Shops', ' ', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Ploso Baru 52', NULL, 'Field', '31-381575', ' ', 'Ms. Winarni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '281-SUMBANG SURUNG \'89-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(58, 'Business as usual (Regular)', 'TCS', '283', 'DUKOM SELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 2 / 224', NULL, 'Field', '31-843833', ' ', 'Ms.Arni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '283-DUKOM SELL-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(59, 'Business as usual (Regular)', 'ITS', '284', 'DOT COMP', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plasa Marina Lt. 2D / 2', NULL, 'Field', '31-7518353', '31-848138 ext 215', 'Mr. Hudiono Tjahjadi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '284-DOT COMP-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(60, 'Business as usual (Regular)', 'ITS', '286', 'ASIA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1A /85', NULL, 'Field', '31-5357921', '31-72636', 'Mrs. Ipung', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '286-ASIA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(61, 'Business as usual (Regular)', 'PHO', '288', 'PHOTO PRO', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hitech Mall (depan Ramayana)', NULL, 'Field', '31-5348988', ' ', 'Miss Ida', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '288-PHOTO PRO-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(62, '2018 BAU', 'TCS', '292', 'TRINITY', 'MAKASSAR, KOTA', 'Mobile Phone Specialists', '0', ' ', ' ', 'SULAWESI', 'SOUTH SULAWESI', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Andika.Zainal', 'MAKASSAR', ' ', 'MTC Karebosi Lt. 1 Blok Y No. 8-9', ' ', ' ', '0411-5010567', '81243333545', 'MS IDA', 'None', '0', ' ', 'Nurdiansyah', '', 'ID', '292-TRINITY-MAKASSAR, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(63, '2018 BAU', 'TCS', '335', 'MENTARI SELLULAR', 'DENPASAR, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Putu.Ariana', 'DENPASAR', NULL, 'Jl. Veteran 65', NULL, 'Field', '087842252422', '081909090191', 'Mr. Wayan Gunarsa', 'e-Indomaret', '10', NULL, 'Mestika Pradana', '', 'ID', '335-MENTARI SELLULAR-DENPASAR, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(64, 'Business as usual (Regular)', 'IM', '338', 'TEKAD BARU', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', '< untuk dilengkapi >', NULL, 'Field', '31-54628', ' ', 'Ms. Dina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '338-TEKAD BARU-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(65, 'Business as usual (Regular)', 'SDA', '345', 'BINTANG TERANG', 'SURABAYA, KOTA', 'Electrical Specialists', 'SDA SPECIALISTS', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Pusat Grosir Surabaya Lt. 1 / F-6 No. 8', NULL, 'Field', '31-7918353', ',3191171515', 'Ms. Poppy', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '345-BINTANG TERANG-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(66, 'Business as usual (Regular)', 'GLW', '346', 'CENDANA MAKMUR', 'SURABAYA, KOTA', 'Household Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'ITC Mega Grosir Lt. Ground E5/5', NULL, 'Field', '31-37435', ' ', 'Mr. Kony', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '346-CENDANA MAKMUR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(67, 'Sample enhancement', 'MCG', '349', 'TRIJAYA MOTOR', 'SURABAYA, KOTA', 'Motorcycle Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'JL. MASTRIP KARANGPILANG NO 17', NULL, 'Field', ' ', '87855598527', 'MR. DENNY', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '349-TRIJAYA MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(68, 'Business as usual (Regular)', 'TCS', '359', 'OUTLET CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2H / 221', 'itapurwati38@gmail.com', 'Field', '31-654328', '8123459531', 'Mr. Liswanto', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '359-OUTLET CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(69, 'Business as usual (Regular)', 'SDA', '366', 'RUKUN JAYA', 'SURABAYA, KOTA', 'Electrical Specialists', 'SDA SPECIALISTS', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Pasar Blauran Lt. 1A / 5-6', NULL, 'Field', '31-5315146', '31-6585634', 'Mrs. Anik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '366-RUKUN JAYA-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(70, 'Business as usual (Regular)', 'MCG', '383', 'JAYA AGUNG MOTOR', 'SURABAYA, KOTA', 'Motorcycle Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', ' ', 'Jl. Kedungmangu no. 1', NULL, 'Field', 'Lengkapi bila ada', '83854914492', 'Mrs. Mukhimah', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '383-JAYA AGUNG MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(71, 'Business as usual (Regular)', 'CBS', '385', 'METRO', 'SURABAYA, KOTA', 'Electrical Specialists', 'MIX CE/PHOTO', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plasa Marina Lt. 2A / 2', NULL, 'Field', '31-846613', ' ', 'Ms. Ella', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '385-METRO-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(72, 'Business as usual (Regular)', 'TCS', '412', 'DBI', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 3 No. 369', 'Kapas Lor Wetan 3 no. 8 Surabaya', 'Field', '31-654567', ' ', 'Ms. Ana', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '412-DBI-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(73, 'Business as usual (Regular)', 'SDA', '455', 'ORBIT PERDANA', 'SURABAYA, KOTA', 'Electrical Specialists', 'SDA SPECIALISTS', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'ITC Mega Grosir Lt. Ground D12 A / 3A ( Jl. krembangan baru 7/5 )', NULL, 'Field', '31-3743693', '31-3571122', 'Mrs. Nunuk', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '455-ORBIT PERDANA-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(74, 'Business as usual (Regular)', 'TCS', '466', 'CRYSTAL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Surabaya Plaza (Handphone Centre) Lt. 2 / 17', NULL, 'Field', '31-5316368', '3171817169', 'Ms. Yeti', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '466-CRYSTAL-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(75, 'Business as usual (Regular)', 'TCS', '467', 'PRAYOGA CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'JMP', 'Jembatan Merah Plaza Blok A No. S-3A', NULL, 'Field', ' ', '82232417475', 'Mrs. Siti', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '467-PRAYOGA CELL-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(76, 'Business as usual (Regular)', 'TCS', '475', 'MAGNET CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'JMP', 'Jembatan Merah Plaza Blok C No. S-1B', NULL, 'Field', ' ', '87851523', 'Mr. Jhoni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '475-MAGNET CELL-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(77, 'Business as usual (Regular)', 'CTS', '491', 'SENTRASERVIS - DUNIA BAN', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', 'GOODYEAR', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Kedungsari 95', NULL, 'Field', '31-534212', '8135756956', 'Ms. Linda', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '491-SENTRASERVIS - DUNIA BAN-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(78, 'Business as usual (Regular)', 'ITS', '521', 'DIPCOM', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1A / 7B', NULL, 'Field', '31-5478657', ' ', 'Mr. Budi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '521-DIPCOM-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(79, 'Business as usual (Regular)', 'IM', '527', 'OMEGA ELEKTRIC', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Kupang Jaya 1 AD-kav 3', 'abadisentosa@gmail.com', 'Field', '317344778', '31665182', 'Ms. Emilia', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '527-OMEGA ELEKTRIC-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(80, 'Business as usual (Regular)', 'INBS', '532', 'SAKTI COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1', NULL, 'Field', '8135773616', '31-7759828', 'Mr. Eko', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '532-SAKTI COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(81, '2018 BAU', 'PHO', '535', 'SUMBER BAHAGIA', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Kramat Gantung 2', 'sumberbahagiaphoto@hotmail.com', 'Field', '31-5344995', '31-5459382', 'Mr. Wiro / Ms.Ajeng (Cynthia Liliana 811311881 + Ajeng  8233141372) ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '535-SUMBER BAHAGIA-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(82, 'Business as usual (Regular)', 'ITS', '536', 'MIO COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. Dasar A / 28', NULL, 'Field', '3-5483328', ' ', 'Ms. Ika', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '536-MIO COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(83, 'Business as usual (Regular)', 'IASS', '537', 'ARCHI KOMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1 E/31', NULL, 'Field', '31-547719', '31-7744', 'Mr. Fandy', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '537-ARCHI KOMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(84, '2018 BAU', 'TCS', '539', 'ADA JADI PONSEL', 'MEDAN, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Yuli.Annisyah', 'MEDAN', 'PLAZA MILLENIUM', 'Plaza Millenium Lt. 1 No. 08', 'Wenditjan@gmail.com', 'Field', '085262030000', '0813-67565261', 'Mr. Wendi / Ms. Putri', 'OVO', '5', 'Yes', 'Dedi Masriyal', '', 'ID', '539-ADA JADI PONSEL-MEDAN, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(85, '2018 BAU', 'TCS', '551', 'BAKOEL HAPE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2 Blok H- 54', 'itapurwati38@gmail.com', 'Field', '31-8475888 ext. 54', '8123459531', 'Mr. Liswanto', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '551-BAKOEL HAPE-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(86, 'Business as usual (Regular)', 'TCS', '556', 'MASTER & DONARTA', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Golden City Mall Lt. UG A19-2', 'Jl. AW Siammin 27-29', 'Field', '87751345662', ' ', 'Ms. Santy', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '556-MASTER & DONARTA-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(87, 'Business as usual (Regular)', 'TCS', '557', 'PEACE CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 3 Suite 364', 'elylovely99@gmail.com', 'Field', '< untuk dilengkapi >', '81938396647', 'Ms. Anitta', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '557-PEACE CELL-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(88, 'Business as usual (Regular)', 'TCS', '558', 'OCEAN PHONE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC lt 1/175-179', 'Remote  Staff', 'Field', '31-5319319', ' ', 'Ms. Dewi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '558-OCEAN PHONE-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(89, 'Business as usual (Regular)', 'ITS', '559', 'BERIN COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2 blok G 3-4', 'berin.comp@gmail.com', 'Field', '85851856978/819145154', '83849834961', 'Mr. Oenawan/Mrs. Tiara', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '559-BERIN COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(90, 'Business as usual (Regular)', 'TCS', '564', 'DUNIA CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Surabaya Lt. 2R / 16', NULL, 'Field', '31-5314825', '31-72886657', 'Ms. Desi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '564-DUNIA CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(91, 'Business as usual (Regular)', 'TCS', '576', 'GALLERY CELLULAR 2', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plasa Marina Lt. 2/ 28', NULL, 'Field', '31-5313511', '31-69898', 'Ms. Lina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '576-GALLERY CELLULAR 2-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(92, 'Business as usual (Regular)', 'VSP', '577', 'SUNRISE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 2 Galeria 843', NULL, 'Field', '8573533767', '87859844484', 'Ms. Leny', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '577-SUNRISE-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(93, 'Business as usual (Regular)', 'CGR', '589', 'TRI SAKTI MOTOR', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. TempureJO 65', NULL, 'Field', '31-389319', '8387877555', 'Mr. Tris / Ms. Iis', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '589-TRI SAKTI MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(94, 'Business as usual (Regular)', 'CGR', '591', 'SPEEDY AUTO CARE', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Ketintang Madya 148 B', NULL, 'Field', '31-8291921', ' ', 'Mr. Agus ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '591-SPEEDY AUTO CARE-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(95, 'Business as usual (Regular)', 'FF', '592', 'CHEAP AND CLEAN', 'SURABAYA, KOTA', 'Fast Fit Car Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. KUPANG JAYA 11', NULL, 'Field', '31-7318189', '31-7123883', 'Mrs. Yuli ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '592-CHEAP AND CLEAN-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(96, 'Business as usual (Regular)', 'INBS', '594', 'X-3', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. 1B-18', 'Email ke XBOOK_SBY@YAHOO.COM', 'Field', '31531366', '8573346948', 'Ms. Novi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '594-X-3-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(97, 'Business as usual (Regular)', 'TCS', '596', 'SINAR CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 2 / 241- 242', NULL, 'Field', '31-5321983', '317652', 'Ms. Wahyu', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '596-SINAR CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(98, 'Business as usual (Regular)', 'CGR', '597', 'STEVE AUTOMOTIVE', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Kupang Jaya 55', NULL, 'Field', '81332425', 'Lengkapi bila ada', 'Mr. Arie', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '597-STEVE AUTOMOTIVE-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(99, 'Business as usual (Regular)', 'TCS', '598', 'YOYO CELLULER', 'PALEMBANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM PAPER', 'Regular', NULL, 'PALEMBANG', NULL, 'Megahria Shoping Centre Lt. 2 ', NULL, 'TIKI ONS', '8127870611', '0711-7919505', 'Mr. Frans', 'None', '0', ' ', 'Murbeng Lelana', '', 'ID', '598-YOYO CELLULER-PALEMBANG, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(100, 'Business as usual (Regular)', 'TCS', '616', 'CHICOM', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plasa Marina Lt. 2 / 242', NULL, 'Field', '31-8497652', ' ', 'Mr. Rosiana', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '616-CHICOM-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(101, 'Business as usual (Regular)', 'EGO', '617', 'UD. DASAR INDAH PRATAMA', 'SURABAYA, KOTA', 'Car Accessories Specialists', 'ENGINE OIL SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Perak Barat 47', NULL, 'Field', '31-3541481', ' ', 'Mr. Linus', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '617-UD. DASAR INDAH PRATAMA-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(102, 'Business as usual (Regular)', 'VGS', '622', 'DUNIA FANTASI', 'SURABAYA, KOTA', 'Home Entertainment Specialists', 'VIDEO_GAME_SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Tec Lt. UG No. 17-117', NULL, 'Field', '31-5243272', '31-7631215', 'Mrs. Ika', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '622-DUNIA FANTASI-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(103, 'Business as usual (Regular)', 'TCS', '624', 'GALLERY CELLULAR 1', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plasa Marina Lt. 2H / 239', NULL, 'Field', '31-819869', ' ', 'Ms.Lina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '624-GALLERY CELLULAR 1-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(104, 'Business as usual (Regular)', 'INBS', '628', 'MITRA MEDIA', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'HI TECH MALL Lt. DASAR BLOK D-24', NULL, 'Field', '857324849', '3181797379', 'Mr. Angga', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '628-MITRA MEDIA-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(105, 'Business as usual (Regular)', 'IACC/IPPS', '629', 'BEST N CHEAP', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'HI TECH MALL Lt. IE No. 22', NULL, 'Field', '31-547623', '85732157977', 'Ms. Eni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '629-BEST N CHEAP-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(106, 'Business as usual (Regular)', 'VSP', '632', 'AGURA CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. KUPANG JAYA A2 No. 49', NULL, 'Field', '85731838', ' ', 'Mr. Arif', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '632-AGURA CELL-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(107, 'Business as usual (Regular)', 'VSP', '633', 'DEASY PHONE (NAMA BARU D & M PHONE )', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. NGINDEN SEMOLO 58', NULL, 'Field', '315966665', ' ', 'Ms. Fitri', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '633-DEASY PHONE (NAMA BARU D & M PHONE )-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(108, 'Business as usual (Regular)', 'VSP', '634', 'IMMANUEL CELL (NGAGEL REDJO)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Ngagel RedJO Kidul 36', NULL, 'Field', '3177771346', ' ', 'Ms. Uum', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '634-IMMANUEL CELL (NGAGEL REDJO)-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(109, 'Business as usual (Regular)', 'VSP', '635', 'RYAN CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Bratang Gede 3', NULL, 'Field', '31-71517349', ' ', 'Mr. Antok', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '635-RYAN CELL-SURABAYA, KOTA', '2024-03-03 06:25:40', '2024-03-03 06:25:40'),
(110, 'Business as usual (Regular)', 'CGR', '643', 'UD DWI PUTRA JAYA', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Kenjeran 183', NULL, 'Field', '31-3762266', '31-3737777', 'Mrs. Sugianto/ Ms. Deby ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '643-UD DWI PUTRA JAYA-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41');
INSERT INTO `shoplists` (`id`, `project`, `sh_type`, `gsnr`, `shop_name`, `city`, `channel_name`, `shop_type`, `assembled`, `a_clients`, `region`, `region2`, `organisat_type`, `shopsize1`, `sample_status`, `metode_konversi`, `penyampaian_ke_gfK`, `datadeliverytyp`, `schedule`, `data_collector`, `base_staff`, `area`, `street`, `delivery_address`, `courier`, `telephone`, `mobile_phone`, `contact_person`, `v_type`, `v_amount`, `kelipatan_25`, `spv`, `spv_id`, `country`, `nameofshop`, `created_at`, `updated_at`) VALUES
(111, 'Business as usual (Regular)', 'CGR', '644', 'WIDHIA MOTOR', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', ' ', 'Jl. Raya Mulyosari 159', NULL, 'Field', '31-593992', '31-593871', 'Mrs. Sri Hartutik/ Ms Yani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '644-WIDHIA MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(112, 'Business as usual (Regular)', 'GES', '666', 'METRON', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', '< untuk dilengkapi >', NULL, 'Field', '< untuk dilengkapi >', NULL, ' ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '666-METRON-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(113, 'Business as usual (Regular)', 'GES', '667', 'PLANET ELECTRONIC', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Tambak ReJO 41', NULL, 'Field', '31-6354141', ' ', 'Mrs. Nonik ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '667-PLANET ELECTRONIC-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(114, 'Business as usual (Regular)', 'TCS', '673', 'PONSELINDO', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 2 / 264', 'Herlina.biofood@gmail.com', 'Field', '31-8475888', '31-7275833', 'Mr. Budi / Ms. Herlina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '673-PONSELINDO-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(115, 'Business as usual (Regular)', 'AIR', '682', 'PLAZA AC', 'SURABAYA, KOTA', 'Air-Treatment Installers', 'AIRCOND SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Ruko Surya Inti Permata 1 Blok B no 9, Jl. HR Muhammad', NULL, 'Field', '881969192', ' ', 'Ms. Lina / Ms. Neti', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '682-PLAZA AC-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(116, 'Business as usual (Regular)', 'IM', '685', 'TOKO MULYOSARI', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Mulyosari 352', NULL, 'Field', '31-5934715', ' ', 'Mrs. Lani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '685-TOKO MULYOSARI-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(117, '2018 BAU', 'TCS', '703', 'ANI CELL', 'BANDUNG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Taufik.Ashari', 'BANDUNG', 'Bandung Electronic Centre', 'Bandung Electronic Centre 2 Lt. LG Blok T No. 20', NULL, 'Field', 'Lengkapi bila ada', '083820006061', 'Mr. Sigit', 'None', '0', NULL, 'Novan Ergana', '', 'ID', '703-ANI CELL-BANDUNG, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(118, 'Business as usual (Regular)', 'VSP', '721', 'RAZID CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. MULYOREJO UTARA 59', NULL, 'Field', '3134345899', ' ', 'Mrs. Ida', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '721-RAZID CELL-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(119, 'Business as usual (Regular)', 'TCS', '743', 'PHOENIX PHONE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Surabaya Lt. 2 / 5', NULL, 'Field', '31-5311536', '8563354468', 'MS. Ambar', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '743-PHOENIX PHONE-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(120, 'Business as usual (Regular)', 'IBRD', '751', 'PC MAX', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'NO', 'APPLE', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. Dasar D 1-4', 'aliehartanto@yahoo.co.id', 'Field', '31-545235', ' ', 'Mr. Fajar', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '751-PC MAX-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(121, 'Business as usual (Regular)', 'VSP', '761', 'OKE CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. KarangreJO 3/3B', NULL, 'Field', '31797759', '8383945454', 'Mr. Adi Susanto / Mrs. Suparni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '761-OKE CELL-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(122, 'Business as usual (Regular)', 'CTS', '762', 'UD MARGA JAYA', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Jalan Pengampon No. 115', NULL, 'Field', '31-353964', '31-353137', 'Mr. Soeroso', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '762-UD MARGA JAYA-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(123, 'Business as usual (Regular)', 'DIY', '764', 'TOKO ANANDA', 'SURABAYA, KOTA', 'DIY Shops', ' ', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. KarangreJO I No. 2', NULL, 'Field', '31-8284382', ' ', 'Mr. Atmari ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '764-TOKO ANANDA-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(124, 'Business as usual (Regular)', 'IASS', '765', 'SUMBERJAYA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. Dasar A-33', NULL, 'Field', '31-547739', '8161589139', 'Ms. Mamik / Ms. Yulia / MS YUNI', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '765-SUMBERJAYA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(125, 'Business as usual (Regular)', 'IACC/IPPS', '788', 'ARTA CITRA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. Dasar A-47', NULL, 'Field', '31-547431', '812311151', 'Ms. Mega I', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '788-ARTA CITRA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(126, 'Business as usual (Regular)', 'IBRD', '792', 'MEGA STAR', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'NO', 'HEWLETT PACKARD', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Hi - Tech Mall', 'Hi-Tech Mall Lt. 1 Blok E No. 1&2', 'hpstore. hitech@yahoo.com', 'Field', '31-5467659', '8223131925', 'Mr. Budi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '792-MEGA STAR-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(127, 'Business as usual (Regular)', 'IACC/IPPS', '876', 'E-DEPO COPMT', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 2D / 4-5', 'Remote Staff', 'Field', '856-557-2266', ' ', 'Ms. Poppy', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '876-E-DEPO COPMT-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(128, 'Business as usual (Regular)', 'VSP', '912', 'TOKO PUSKRIB', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Ketintang 135A', NULL, 'Field', '31-8287486', 'Lengkapi bila ada', 'Mr. Bayu  ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '912-TOKO PUSKRIB-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(129, 'Business as usual (Regular)', 'CGR', '918', 'UD. AGUNG BAGUS', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Kali Bokor Selatan 2 No. 4', NULL, 'Field', '< untuk dilengkapi >', '8223472827', 'Mrs. Suheksi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '918-UD. AGUNG BAGUS-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(130, 'Business as usual (Regular)', 'TCS', '921', 'ARTOMORO', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Jarak No. 124', NULL, 'Field', '31-722677', ' ', 'Mr. JOKO', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '921-ARTOMORO-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(131, 'Business as usual (Regular)', 'ITS', '928', 'ROCKY TECH', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Siwalankerto 126', NULL, 'Field', '87854341', ' ', 'Mr. Putra', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '928-ROCKY TECH-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(132, 'Business as usual (Regular)', 'ITS', '929', 'SENTRA DROID', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 3 No. 56', 'argodion@sentradigital.com <argodion@sentradigital.com>;', 'Field', '8179311188', ' ', 'Mr. Argo', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '929-SENTRA DROID-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(133, 'Business as usual (Regular)', 'ITS', '931', 'DIACOM', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hitech Mall Lt. Dasar A No. 21', NULL, 'Field', '31-81751975/548143', '8585546112', 'MS. Ani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '931-DIACOM-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(134, 'Business as usual (Regular)', 'CGR', '941', 'FIGO AUTOMOTIVE', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Bratang Binangun 24', NULL, 'Field', '31-541532', '317718111', 'Ms. Vina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '941-FIGO AUTOMOTIVE-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(135, 'Business as usual (Regular)', 'VGS', '962', 'KINGMAN GAMES', 'SURABAYA, KOTA', 'Home Entertainment Specialists', 'VIDEO_GAME_SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Tec Lt. UG No 37', NULL, 'Field', '8121668538', ' ', 'Mrs. Marta', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '962-KINGMAN GAMES-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(136, 'Business as usual (Regular)', 'IACC/IPPS', '969', 'BAKUL ACCESSORIES', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'BG Junction Lt. 2c Blok C 45', NULL, 'Field', '31-535591', '31-717878', 'Mr. Leo', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '969-BAKUL ACCESSORIES-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(137, 'Business as usual (Regular)', 'GES', '1034', 'DEWI SRI ELECTRONIC', 'SIDOARJO, KAB.', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SIDOARJO', ' ', 'Pasar Larangan BB / 20', 'dewisri_elektro@yahoo.com', 'Field', '031 8949567', '81357968896', 'Mr. Muh Takim', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1034-DEWI SRI ELECTRONIC-SIDOARJO, KAB.', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(138, '2018 BAU', 'GES', '1069', 'JS. ELECTRONIC', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Luxman.Sanjaya', 'SIDOARJO', NULL, 'Jl. Pasar Turi 26B', NULL, 'Field', '031-3558521/0315315339', '82140830060', 'Mrs. Charles/Mrs. Anik', 'e-Indomaret', '10', 'Yes', 'Hariyanto', '', 'ID', '1069-JS. ELECTRONIC-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(139, '2018 BAU', 'GES', '1070', 'GALILEA', 'SERANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE NEW', 'Manual A/S', 'Manual A/S', 'STREAM Audit Internal (N-Able)', 'Rolling Sample', 'Sumarwoto.Sumarwoto', 'SERANG', 'ROAD AREA', 'Jl. M. Hasanudin No. 32 Serang - Banten', 'Amplop isi FD dikirim ke Jl.Hasanudin No.32 U/P Ms.Dewi (Nama tokonya Pulau indah jgn Galilea)', 'Casual', '0254-213907', '0882 1278 3132', 'Mr. Nur', 'None', '0', NULL, 'Triyana', '', 'ID', '1070-GALILEA-SERANG, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(140, '2018 BAU', 'GES', '1072', 'DUNIA ELEKTRONIK', 'PONOROGO, KAB.', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Isfan.Utomo', 'PONOROGO', NULL, 'Jl. Sultan Agung 39', NULL, 'Field', '0352-484606/0352-489851', '81330324988', 'Mrs. Yosefin/Mrs Nurul/Ms. Eny (OVO- Ms. Tan Tan)', 'OVO', '7.5', 'Yes', 'Hariyanto', '', 'ID', '1072-DUNIA ELEKTRONIK-PONOROGO, KAB.', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(141, '2018 BAU', 'GES', '1074', 'SAHABAT', 'SUMEDANG, KAB', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'ePOS', 'Non Visit - Email', 'ePOS - INDIRECT', 'Regular', 'Wawan', 'BANDUNG', 'Sumedang', 'Jl. Mayor Abdurachman No. 67 A', NULL, 'Field', '0261-202288', '081321558846', 'Mr. Athen / Mrs. Erni', 'Yogya', '10', NULL, 'Novan Ergana', '', 'ID', '1074-SAHABAT-SUMEDANG, KAB', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(142, ' ', ' ', '1093', 'ENGGAL JAYA P 2', 'YOGYAKARTA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Jl. Urip Sumoharjo No. 17', ' ', 'Field', '0274 - 515892 ', '0274-514388', 'Mrs. Atiek / Ms. Hartati', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '1093-ENGGAL JAYA P 2-YOGYAKARTA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(143, '2018 BAU', 'GES', '1094', 'RATU IRAMA (*)', 'SEMARANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', 'Nota (milik toko)', 'ON THE SPOT', 'STREAM AUD INT', 'Rolling Sample', 'Erwin.Prihatmoko', 'SEMARANG', ' ', 'Jl. Jend. Sudirman No. 71', NULL, 'Field', '024-7603131', '024-70135820', 'Mr. Eko Widiyanto', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '1094-RATU IRAMA (*)-SEMARANG, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(144, '2018 BAU', 'GES', '1118', 'ANIW 2', 'SUMEDANG, KAB', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Wawan', 'BANDUNG', 'Sumedang', 'Jl. Prabu Geusan Ulun No. 166', NULL, 'Field', '0261-201713', '081214886104', 'Mr. Miming Hediyanto/Dedi', 'Yogya', '10', NULL, 'Novan Ergana', '', 'ID', '1118-ANIW 2-SUMEDANG, KAB', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(145, 'Business as usual (Regular)', 'LS', '1122', 'SINAR TURI1', 'SURABAYA, KOTA', 'Lighting Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'PGS Lantai dasar E27-29-3', NULL, 'Field', '31-524539', ' ', 'MS. YENI', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1122-SINAR TURI1-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(146, '2018 BAU', 'GES', '1139', 'PADANG', 'SUKABUMI, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'TEMPLATE Indirect', 'Rolling Sample', 'Reza.Sukabumi', 'SUKABUMI', 'ROAD AREA', 'Jl. Jend. A. Yani No. 125', NULL, 'Field', '0266-222962', '0815 8361 111', 'Mr. Ikbal', 'e-Indomaret', '10', NULL, 'Triyana', '', 'ID', '1139-PADANG-SUKABUMI, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(147, 'Business as usual (Regular)', 'GES', '1141', 'TANDA JAYA', 'KEDIRI, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'KEDIRI', ' ', 'Jl. Dhoho 161', ' ', 'Field', '0354-682233', '81335266255', 'Mrs. Sulis', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1141-TANDA JAYA-KEDIRI, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(148, '2018 BAU', 'GES', '1147', 'ELKANA', 'SEMARANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Ajie.Winarko', 'SEMARANG', ' ', 'Jl. H. Agus Salim No. 14', NULL, 'Field', '024-3541238', NULL, 'Mrs. Kristi', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '1147-ELKANA-SEMARANG, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(149, 'Business as usual (Regular)', 'IDS', '1148', 'CV. SURYA INDAH PERKASA', 'SURABAYA, KOTA', 'Industrial Suppliers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Kembang Jepun 61', NULL, 'Field', '31-355162', ' ', 'Mrs. Ana', 'None', '0', ' ', 'Hariyanto', '', 'ID', '1148-CV. SURYA INDAH PERKASA-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(150, '2018 BAU', 'GES', '1155', 'ADY SWARA', 'GARUT, KAB', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Gorga.Alamsyah', 'GARUT', 'Garut', 'Jl. Ciledug No. 66', NULL, 'Field', '0262-231921', '089686909332', 'Mr. Deri', 'e-Indomaret', '5', NULL, 'Novan Ergana', '', 'ID', '1155-ADY SWARA-GARUT, KAB', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(151, '2018 BAU', 'GES', '1156', 'ANEKA ELEKTRONIK', 'MOJOKERTO, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'e-A/S', 'Non Visit - Email', 'TEMPLATE Indirect', 'Regular', 'Mohammad.Rony', 'JOMBANG', NULL, 'Jl. Mojopahit 130-134', NULL, 'Field', '0321-323820', '08123589969', 'Mr. Agus Sutanto/Mrs Lenny Mayasari Sutanto', 'OVO', '7.5', 'Yes', 'Hariyanto', '', 'ID', '1156-ANEKA ELEKTRONIK-MOJOKERTO, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(152, 'Business as usual (Regular)', 'TCS', '1173', 'SMP - SURABAYA - WTC (SELULAR WORLD)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, 'SAMSUNG', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Galeria Lt 1 R 714', 'herlinawibowo26@gmail.com', 'Field', '31-9117257', ' ', 'MR. Linda', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1173-SMP - SURABAYA - WTC (SELULAR WORLD)-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(153, 'Business as usual (Regular)', 'TCS', '1177', 'BLESSING', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt 2 no', NULL, 'Field', '8214241417', ' ', 'Ms. Silvi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1177-BLESSING-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(154, 'Business as usual (Regular)', 'DIY', '1178', 'SULFI JAYA', 'SURABAYA, KOTA', 'DIY Shops', ' ', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Rajawali No. 115', NULL, 'Field', '31 7115223', ' ', 'Ms. Iis', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1178-SULFI JAYA-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(155, 'Business as usual (Regular)', 'INBS', '1217', 'MBU (MITRA BINTANG UTAMA)', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plasa Mariina Lt. 2 blok A 1-2', 'Chusnul Yaqin <qienzindonesia89@gmail.com>', NULL, '31-847596', ' ', 'Mr. Chusnul Yaqin', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1217-MBU (MITRA BINTANG UTAMA)-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(156, 'Business as usual (Regular)', 'TCS', '1225', 'M&B CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt 2 no 24', 'iramaya12393@gmail.com', 'Field', '31-8475888', '812341559', 'Ms. Ira', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1225-M&B CELL-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(157, 'Business as usual (Regular)', 'DIY', '1231', 'UD MATAHARI', 'SURABAYA, KOTA', 'DIY Shops', ' ', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Arif Rahman Hakim No. 71', NULL, 'Field', '31-5926227', ' ', 'Mr. Yakub', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1231-UD MATAHARI-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(158, 'Business as usual (Regular)', 'TCS', '1265', 'PT SINAR JAYA SUKSES MANDIRI (WTC)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. II 274', NULL, 'Field', '31 5477652', '31 72889214', 'Ms. Indar', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1265-PT SINAR JAYA SUKSES MANDIRI (WTC)-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(159, 'Business as usual (Regular)', 'VGS', '1272', 'CORNER GAME', 'SURABAYA, KOTA', 'Home Entertainment Specialists', 'VIDEO_GAME_SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Tec Jl. Tunjungan Lt. ug No. 133', NULL, 'Field', '31-71953988', ' ', 'Mrs. Ratna', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1272-CORNER GAME-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(160, 'Business as usual (Regular)', 'INBS', '1274', 'BIMA SAKTI COMP', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Hi - Tech Mall', 'Hi - Tech Mall Lt. Dasar A64', 'refree_ekapaksi@yahoo.com', 'Field', '31-547123', '85731691558', 'Ms. Riris', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1274-BIMA SAKTI COMP-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(161, '2018 BAU', 'AVS', '1293', 'SIGMA ELECTRONIC', 'SURAKARTA, KOTA', 'Electrical Specialists', 'AUDIO VISUAL SP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'TEMPLATE Indirect', 'Regular', 'Dian.Marshela', 'SURAKARTA', NULL, 'Pasar Elektronik Ngarsopuro Jl. Ronggowarsito (Depan Mangkunegaran) ', NULL, 'Field', '081233742191', 'Lengkapi bila ada', 'Tarti', 'e-Indomaret', '7.5', 'Yes', 'Toni Warsono', '', 'ID', '1293-SIGMA ELECTRONIC-SURAKARTA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(162, 'Business as usual (Regular)', 'IACC', '1311', 'JESSLYN COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Hi - Tech Mall', 'Hi - Tech Mall Lantai Dasar D-34', NULL, 'Field', '31-5313166', '821313282', 'Mrs.Dwi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1311-JESSLYN COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(163, 'Business as usual (Regular)', 'IACC/IPPS', '1312', 'ASIA DIGITAL', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. Dasar A52', 'Saiful_ucup@yahoo.com', 'Field', '31-5476629', '31-5321643', 'Mr. Saiful', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1312-ASIA DIGITAL-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(164, '2018 BAU', 'AVS', '1361', 'INDAH JAYA (BLAURAN)', 'SURABAYA, KOTA', 'Electrical Specialists', 'AUDIO VISUAL SP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Gusti.Qodarsih', 'SURABAYA', NULL, 'Pasar Blauran Lt. 1B / 95-96', NULL, 'Field', '031-5311237', '83134719135', 'Mr. Hendri', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '1361-INDAH JAYA (BLAURAN)-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(165, 'Business as usual (Regular)', 'INBS', '1416', 'BUNGA SURYA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lantai Dasar B-31', 'bungasuryacomputer@yahoo.co.id', 'Field', '31-547719', '8223238647', 'Mr. Yudi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1416-BUNGA SURYA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(166, 'Business as usual (Regular)', 'VGS', '1417', 'TERMINAL GAME', 'SURABAYA, KOTA', 'Home Entertainment Specialists', 'VIDEO_GAME_SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'ROYAL PLAZA LT 2 K1 NO. 1', NULL, 'Field', '8133287552', ' ', 'MS. VIA/NURUL', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1417-TERMINAL GAME-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(167, 'Business as usual (Regular)', 'VSP', '1421', 'ALIF CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', ' ', 'Jl. Siwalankerto Timur 151 ', NULL, 'Field', '31-8122896', 'Lengkapi bila ada', 'Mr.Deni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1421-ALIF CELL-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(168, '2018 BAU', 'AIR', '1422', 'ANEKA ELECTRONIC', 'JAKARTA UTARA, KOTA', 'Air-Treatment Installers', 'AIRCOND SPEC', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - DIRECT', 'Rolling Sample', 'Shafiq.Ruslan', 'JAKARTA', 'KELAPA GADING', 'Komp. Pertokoan Kelapa Gading Blok. M No. 16 - 17, Kelapa Gading', NULL, 'Field', '0214500614', '021-4509086', 'Mr. Hartono / Ms. Eni', 'e-Indomaret', '12.5', 'Yes', 'Sutrio', '', 'ID', '1422-ANEKA ELECTRONIC-JAKARTA UTARA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(169, 'Business as usual (Regular)', 'CTS', '1427', 'ANEKA JAYA BAN', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya menganti babatan no 6', 'anekajayabanwiyung@gmail.com', 'Field', '31-7535467', '87854246198', 'Ms. Dian / Mr. Hendrik Kwandi ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1427-ANEKA JAYA BAN-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(170, 'Business as usual (Regular)', 'VSP', '1428', 'KARISMA JAYA CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Bendul Merisi Kav. I', NULL, 'Field', '31-8419', ' ', 'Ms. Sandiaya', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1428-KARISMA JAYA CELL-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(171, 'Business as usual (Regular)', 'TCS', '1429', 'HARD ROCK CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2 239', 'Saimy_sasuke85@yahoo.com', 'Field', '31-848427', '878552999', 'Ms. Yuni', 'None', '0', ' ', 'Hariyanto', '', 'ID', '1429-HARD ROCK CELL-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(172, 'Business as usual (Regular)', 'AVS', '1443', 'INDAH JAYA', 'SURABAYA, KOTA', 'Electrical Specialists', 'AUDIO VISUAL SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Mayjen Sungkono NO. 94', NULL, 'Field', '31-7183878', ' ', 'Ms. Yuly', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1443-INDAH JAYA-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(173, '2018 BAU', 'GES', '1458', 'MEGA RAYA', 'BANDUNG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Dede.Maradinata', 'BANDUNG', 'ABC', 'Jl. ABC No. 11 A', NULL, 'Field', '022-4205973', '0878-25982588', 'Ms. Imas', 'Yogya', '10', NULL, 'Novan Ergana', '', 'ID', '1458-MEGA RAYA-BANDUNG, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(174, 'Business as usual (Regular)', 'GES', '1479', 'TOKO DUTA PERSADA', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Jarak 19', ' ', 'Field', '< untuk dilengkapi >', '85733549372', 'Ms. Ina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1479-TOKO DUTA PERSADA-SURABAYA, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(175, '2018 BAU', 'GES', '1504', 'MEGA', 'JAKARTA PUSAT, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Efi.Destiani', 'JAKARTA', 'Harco Manga Dua', 'Harco Mangga Dua Lt. Dasar Blok A No. 130', NULL, 'Casual', '0216129511', '0216129512', 'Mrs. She She', 'Indomaret', '7.5', NULL, 'Sutrio', '', 'ID', '1504-MEGA-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(176, 'Business as usual (Regular)', 'AVS', '1511', 'TOKO SABAR', 'MOJOKERTO, KOTA', 'Electrical Specialists', 'AUDIO VISUAL SP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'JOMBANG', ' ', 'Jl. Majapahit 203', ' ', 'Field', '0321-321240', ' ', 'Mrs. Sani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1511-TOKO SABAR-MOJOKERTO, KOTA', '2024-03-03 06:25:41', '2024-03-03 06:25:41'),
(177, 'Business as usual (Regular)', 'TCS', '1517', 'GAUL PONSEL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Girilaya No 4', NULL, 'Field', '8315345861', ' ', 'Mr. Evan', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1517-GAUL PONSEL-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(178, 'Business as usual (Regular)', 'AVS', '1518', 'MULYA JAYA', 'SURABAYA, KOTA', 'Electrical Specialists', 'AUDIO VISUAL SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Pasar Blauran Lt. 1A / 1-4', NULL, 'Field', '31-5311237', ' ', 'Mrs. Cu', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1518-MULYA JAYA-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(179, '2018 BAU', 'GES', '1549', 'BSS ELEKTRONIK 1', 'TANGERANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Rolling Sample', 'Ahmad.Rivai', 'BOTABEK', 'PASAR ANYAR', 'Jl. Merdeka Comp. Grand Plaza B/12 A', NULL, 'Field', '021 5524551', '08111885214', 'Ms. Lina Phang', 'OVO', '10', NULL, 'Desnider Tambunan', '', 'ID', '1549-BSS ELEKTRONIK 1-TANGERANG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(180, '2018 BAU', 'GES', '1551', 'SUKA JAYA', 'TANGERANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Rolling Sample', 'Syaifullah.Bayu', 'BOTABEK', 'ROAD AREA', 'Jl. Raya Cileduk No. 22-24', NULL, 'Casual', '021 5847432', '081808490668', 'Mr. Drajat', 'e-Indomaret', '10', NULL, 'Desnider Tambunan', '', 'ID', '1551-SUKA JAYA-TANGERANG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(181, 'Business as usual (Regular)', 'VSP', '1564', 'KOST CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Semampir tengah II/2A', NULL, 'Field', '87854142214', ' ', 'Mrs. Mega', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1564-KOST CELL-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(182, ' ', ' ', '1566', 'PODOMORO', 'YOGYAKARTA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Jl. Malioboro No. 34', ' ', 'Field', '0274-563414', ' ', 'Ms. Dwi', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '1566-PODOMORO-YOGYAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(183, '2018 BAU', 'GES', '1572', 'PALAPA', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Luxman.Sanjaya', 'SIDOARJO', NULL, 'Jl. Pasar Turi 26B', '3122', 'Field', '031-3525589', '82140830060', 'Mrs. Charles/Mrs. Anik', 'Indomaret', '10', NULL, 'Hariyanto', '', 'ID', '1572-PALAPA-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(184, '2018 BAU', 'GES', '1574', 'MAKMUR', 'MALANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Elfa.Ramandhita', 'MALANG', NULL, 'Jl. Pasar Besar 115 ', NULL, 'Field', '0341 325775', '0341 362050', 'Mrs. Pudjo. W. Tanoto', 'Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '1574-MAKMUR-MALANG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(185, 'Business as usual (Regular)', 'ITS', '1575', 'UNIVERSAL COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Jambangan Kebon Agung 2', 'universal.comp@yahoo.co.id', 'Field', '317956222', ' ', 'Mr. Putra', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1575-UNIVERSAL COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(186, 'Business as usual (Regular)', 'INBS', '1576', 'ARYA WIYASA', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lantai Dasar D-41', 'youdiepenges@yahoo.co.id', 'Field', '31-5459329', ' ', 'Mr. Irul', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1576-ARYA WIYASA-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(187, '2018 BAU', 'GES', '1581', 'DEPO PELITA ELEKTRONIK', 'PURWAKARTA, KAB.', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Herlia.Anindi', 'SURAKARTA', NULL, 'Jl. AW. Sumarmo No. 13 Purbalingga 53311', NULL, 'TIKI ONS', '0281-6844000', '81328722177', 'Mr. Toto / Mrs. Eni', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '1581-DEPO PELITA ELEKTRONIK-PURWAKARTA, KAB.', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(188, 'Business as usual (Regular)', 'VSP', '1584', 'NON CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Rungkut Kidul 33', NULL, 'Field', '31-7179233', 'Lengkapi bila ada', 'Mr. Rudi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1584-NON CELL-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(189, '2018 BAU', 'GES', '1585', 'ALFA OMEGA ELECTRONIC', 'YOGYAKARTA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Whatsapp', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Tulus.Handoko', 'YOGYAKARTA', NULL, 'Jl. Gejayan CTX / 47', NULL, 'Field', '0274 4462965', '085727123104', 'Mrs. Sulis', 'e-Indomaret', '5', 'Yes', 'Agung Sunaryo', '', 'ID', '1585-ALFA OMEGA ELECTRONIC-YOGYAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(190, 'Business as usual (Regular)', 'VSP', '1586', 'RM SHOP', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'TEL. VOUCHER SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Semampir Tengah IV A no 12A', NULL, 'Field', '81555311', '8385555523', 'Mr. Mahmud Wahyudi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1586-RM SHOP-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(191, '2018 BAU', 'GES', '1588', 'RADIO BHAKTI', 'SURAKARTA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Aji.Prasetyo', 'SURAKARTA', NULL, 'Pasar Ngarsopuran Lt. 1 Jl. Ronggowarsito ', NULL, 'Field', '0271-645506', NULL, 'Mr. Adrian Sudarmanto', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '1588-RADIO BHAKTI-SURAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(192, '2018 BAU', 'GES', '1589', 'TRISAKTI', 'PURBALINGGA, KAB', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'e-A/S', 'Non Visit - Email', 'TEMPLATE Indirect', 'Regular', 'Toni.Warsono', 'SURAKARTA', NULL, 'Jl. Wirasaba No. 2', NULL, 'Field', 'Lengkapi bila ada', '082135222679', 'Ms. Anti', 'e-Indomaret', '10', NULL, 'Toni Warsono', '', 'ID', '1589-TRISAKTI-PURBALINGGA, KAB', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(193, 'Business as usual (Regular)', 'IM', '1596', 'BINTANG SEJATI', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Menganti Kedurus 28A', NULL, 'Field', '31-77666436', ' ', 'Mr. Giovani', 'None', '0', ' ', 'Hariyanto', '', 'ID', '1596-BINTANG SEJATI-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(194, 'Business as usual (Regular)', 'SPBU', '1611', 'SPBU 51 - 6 - 165', 'SURABAYA, KOTA', 'Gas Stations', NULL, ' ', 'PERTAMINA', 'EAST JAVA', '0', 'CHAINS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', '< untuk dilengkapi >', NULL, 'Field', '31-8437131', ' ', 'Mr. Gatot', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1611-SPBU 51 - 6 - 165-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(195, 'Business as usual (Regular)', 'CGR', '1624', 'CARS HOME', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. MENGANTI KARANGAN 62', NULL, 'Field', '31-7112', '81-2362728', 'Mr. Jeffri', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1624-CARS HOME-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(196, 'Business as usual (Regular)', 'CGR', '1626', 'BNS', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Rungkut Asri Utara XII no 12', NULL, 'Field', '31-7191956', '811387912', 'Mr. Benny', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1626-BNS-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(197, '2018 BAU', 'GES', '1653', 'MEGARIA MITRA JAYA', 'BANDUNG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Dede.Maradinata', 'BANDUNG', 'ABC', 'Jl. ABC No. 43', NULL, 'Field', '022-4208445', '022-4205010', 'Ms. Sugi', 'Yogya', '10', NULL, 'Novan Ergana', '', 'ID', '1653-MEGARIA MITRA JAYA-BANDUNG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(198, '2018 BAU', 'GES', '1684', 'MAYESTIC ELECTRONIC', 'SURAKARTA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Dian.Marshela', 'SURAKARTA', NULL, 'Jl. Slamet Riyadi No. 241', NULL, 'TIKI ONS', '0271-36947', '0271-651551', 'Mrs. Handoko Christianto / Mr. Manto', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '1684-MAYESTIC ELECTRONIC-SURAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(199, '2018 BAU', 'GES', '1685', 'SEMERU', 'SURAKARTA, KOTA', 'Technical Superstores', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'ACTIVE', 'ePOS', 'Non Visit - Email', 'ePOS - INDIRECT', 'Regular', 'Toni.Warsono', 'SURAKARTA', NULL, 'Jl. Kalilarangan No. 88 ', NULL, 'Field', '08112639366', 'Lengkapi bila ada', 'Mr. Agus', 'OVO', '45', NULL, 'Toni Warsono', '', 'ID', '1685-SEMERU-SURAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(200, '2018 BAU', 'GES', '1686', 'SANSUI', 'JAKARTA TIMUR, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Sunardi.Sunardi', 'JAKARTA', 'JATINEGARA', 'Jl. Raya Bekasi Barat No. 30 - Jatinegara', NULL, 'Casual', '0218194180', '081219122848', 'Mrs. A Ye', 'e-Indomaret', '5', NULL, 'Sutrio', '', 'ID', '1686-SANSUI-JAKARTA TIMUR, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(201, 'Business as usual (Regular)', 'GES', '1694', 'TOKO DUTA PERSADA', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', ' ', 'Jl. Jetis Kulon 1/ \'5-6', NULL, 'Field', '8223441372', '8577528113', 'Mr. Rudy', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1694-TOKO DUTA PERSADA-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(202, 'Business as usual (Regular)', 'GES', '1695', 'SARITAMA ELEKTRONIK', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Rungkut Tengah no. 19', NULL, 'Field', '857-3143-1257', ' ', 'Mr. Denny', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1695-SARITAMA ELEKTRONIK-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(203, 'Business as usual (Regular)', 'ATPM 2W', '1715', 'AHASS - GRAHA DUA MOTOR', 'SURABAYA, KOTA', 'Motorcycle Dealers', NULL, ' ', 'AHASS', 'EAST JAVA', '0', 'CHAINS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Jetis Kulon I no. 11', NULL, 'Field', '31-829332', '85668281466', 'Mr. Yustiono', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1715-AHASS - GRAHA DUA MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(204, 'Business as usual (Regular)', 'ATPM 2W', '1716', 'YAMAHA - LESTARI MOTOR', 'SURABAYA, KOTA', 'Motorcycle Dealers', NULL, ' ', 'YAMAHA', 'EAST JAVA', '0', 'CHAINS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Jetis Kulon I no. 69', NULL, 'Field', ' ', '878462948', 'Ms. Siska', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1716-YAMAHA - LESTARI MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(205, 'Business as usual (Regular)', 'ATPM 2W', '1717', 'SUZUKI - CV. ARTA AGUNG', 'SURABAYA, KOTA', 'Motorcycle Dealers', NULL, ' ', 'SUZUKI', 'EAST JAVA', '0', 'CHAINS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Gunung Sari H. 22', NULL, 'Field', '8573159495', ' ', 'Mrs. Hani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1717-SUZUKI - CV. ARTA AGUNG-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(206, 'Business as usual (Regular)', 'ATPM 2W', '1719', 'SUZUKI - PT. DWIMITRA SEJAHTERA UTAMA', 'MOJOKERTO, KAB.', 'Motorcycle Dealers', NULL, ' ', 'SUZUKI', 'EAST JAVA', '0', 'CHAINS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Diponegoro No 116 Mojokerto', 'Suzuki_puri@yahoo.co.id', 'Field', '321-322165', 'Lengkapi bila ada', 'Mrs. Ulfa', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1719-SUZUKI - PT. DWIMITRA SEJAHTERA UTAMA-MOJOKERTO, KAB.', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(207, '2018 BAU', 'GES', '1753', 'PT. BAHAGIA SUKSES SENTOSA', 'TANGERANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Rolling Sample', 'Ahmad.Rivai', 'BOTABEK', 'PASAR ANYAR', 'Jl. Merdeka Comp. Grand Plaza B/12 A ', NULL, 'Casual', '021 5524578', '08128349967', 'Ms. Anna', 'OVO', '10', NULL, 'Desnider Tambunan', '', 'ID', '1753-PT. BAHAGIA SUKSES SENTOSA-TANGERANG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(208, '2018 BAU', 'GES', '1761', 'METRO', 'PURBALINGGA, KAB', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'ACTIVE', 'e-A/S', 'Non Visit - Email', 'TEMPLATE Indirect', 'Regular', 'Toni.Warsono', 'SURAKARTA', NULL, 'Jl. Jend. Sudirman No. 40', NULL, 'Field', '0281-892573', '081391099133', 'Ms. Henny', 'e-Indomaret', '10', NULL, 'Toni Warsono', '', 'ID', '1761-METRO-PURBALINGGA, KAB', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(209, '2018 BAU', 'GES', '1762', 'JUWITA BARU ELECTRONIC', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - By Application (GPOS & Weblink)', 'Weblink', 'Regular', 'Gusti.Qodarsih', 'SURABAYA', NULL, 'Jl. Manukan Lor 4N / 14, Tandes', NULL, 'Field', '031-7442657', '081230400389', 'Mr. Asiong', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '1762-JUWITA BARU ELECTRONIC-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(210, ' ', ' ', '1766', 'ENGGAL JAYA', 'YOGYAKARTA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM PAPER', 'Regular', 'Dimas.Ridlo', 'YOGYAKARTA', ' ', 'Jl. Urip Sumoharjo No. 77', ' ', 'Field', '0274-515892', 'No. Telp Wajib di isi', 'Mrs. Hartati Tjipto R', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '1766-ENGGAL JAYA-YOGYAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(211, 'Business as usual (Regular)', 'GES', '1769', 'TOKO INDRAWAN', 'DENPASAR, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'DENPASAR', ' ', 'Jl. Hasanudin 53', ' ', 'Field', '0361 483693', ' ', 'Mr. Indrawan', 'None', '0', ' ', 'Mestika Pradana', '', 'ID', '1769-TOKO INDRAWAN-DENPASAR, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(212, '2018 BAU', 'GES', '1771', 'JUWITA ELECTRONIC', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Wiwin.Kartikasari', 'SURABAYA', NULL, 'Jl. Tambak ReJO 25', NULL, 'Field', '031-3765179', '031-71040829', 'Mr. Ayung / Ms. Lina', 'Indomaret', '7.5', NULL, 'Hariyanto', '', 'ID', '1771-JUWITA ELECTRONIC-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(213, '2018 BAU', 'GES', '1773', 'ALAM RIA', 'BANDUNG, KAB.', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', 'E-AS', 'E-AS', 'TEMPLATE Indirect', 'Rolling Sample', 'Shandy.Nurhadyansyah', 'BANDUNG', 'Kopo', 'Jl. Kopo Sayati 180N/B 124', NULL, 'Field', '022-5401624', '022-5415948', 'Ms. Enny / Ms. Cencen', 'None', '0', NULL, 'Novan Ergana', '', 'ID', '1773-ALAM RIA-BANDUNG, KAB.', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(214, '2018 BAU', 'GES', '1777', 'ADY SURJA', 'GARUT, KAB', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Gorga.Alamsyah', 'GARUT', 'Garut', 'Jl. Jend. Ahmad Yani No. 145', NULL, 'Field', '0262-233546', '082316363047', 'Ms. Rista ', 'e-Indomaret', '7.5', 'Yes', 'Novan Ergana', '', 'ID', '1777-ADY SURJA-GARUT, KAB', '2024-03-03 06:25:42', '2024-03-03 06:25:42');
INSERT INTO `shoplists` (`id`, `project`, `sh_type`, `gsnr`, `shop_name`, `city`, `channel_name`, `shop_type`, `assembled`, `a_clients`, `region`, `region2`, `organisat_type`, `shopsize1`, `sample_status`, `metode_konversi`, `penyampaian_ke_gfK`, `datadeliverytyp`, `schedule`, `data_collector`, `base_staff`, `area`, `street`, `delivery_address`, `courier`, `telephone`, `mobile_phone`, `contact_person`, `v_type`, `v_amount`, `kelipatan_25`, `spv`, `spv_id`, `country`, `nameofshop`, `created_at`, `updated_at`) VALUES
(215, '2018 BAU', 'GES', '1778', 'ANIW 1', 'SUMEDANG, KAB', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Wawan', 'BANDUNG', 'Sumedang', 'Jl. P. Geusan Ulun No. 166', NULL, 'Field', '0261-201713', '081214886104', 'Mr. Miming Hediyanto/Dedi', 'Yogya', '10', NULL, 'Novan Ergana', '', 'ID', '1778-ANIW 1-SUMEDANG, KAB', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(216, '2018 BAU', 'GES', '1780', 'SINAR SURYA ELECTRONIC', 'SEMARANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Ardha.Restamulia', 'SEMARANG', ' ', 'Jl. MT. HaryoNo No. 315', NULL, 'Field', '024-3540053', '024-33074848', 'Mr. Kokon Suprana', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '1780-SINAR SURYA ELECTRONIC-SEMARANG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(217, '2018 BAU', 'GES', '1781', 'ALFA OMEGA ELEK [GEFO]', 'YOGYAKARTA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Whatsapp', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Tulus.Handoko', 'YOGYAKARTA', NULL, 'Perempatan Condong Catur Gejayan', NULL, 'Field', '0274 4462965', '085727123104', 'Mrs. Sulis', 'e-Indomaret', '10', 'Yes', 'Agung Sunaryo', '', 'ID', '1781-ALFA OMEGA ELEK [GEFO]-YOGYAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(218, ' ', ' ', '1825', 'C4U', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Ramai Centra Computer (Ramai Mall) Lt. 2 Blok A No. 7', ' ', 'Field', '83900000000', ' ', 'Ms. Ety', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '1825-C4U-YOGYAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(219, '2018 BAU', 'ITS', '1842', 'CITRA LINTAS SOLUSINDO', 'SURABAYA, KOTA', 'Computerhardware-Shops', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'ePOS', 'Non Visit - Email', 'ePOS - INDIRECT', 'Rolling Sample', 'Hariyanto.Hariyanto', 'SIDOARJO', NULL, 'Jl. Demak Selatan 3 no 10', NULL, 'Field', '031-5467683', '08155065591', 'Mrs. Nurul', 'e-Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '1842-CITRA LINTAS SOLUSINDO-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(220, '2018 BAU', 'ITS', '1855', 'YOMA COMPUTER', 'BANDUNG, KOTA', 'Computerhardware-Shops', '0', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'e-A/S', 'Staff Visit - USB FlashDisk', 'TEMPLATE Indirect', 'Rolling Sample', 'Shandy.Nurhadyansyah', 'BANDUNG', 'Dago', 'Jl. Dipati Ukur No. 120', NULL, 'Field', '022 2505174', '085220052535', 'Mr. Asep Yudhiana', 'e-Indomaret', '7.5', 'Yes', 'Novan Ergana', '', 'ID', '1855-YOMA COMPUTER-BANDUNG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(221, 'Business as usual (Regular)', 'MBSS', '1873', 'ZELDA', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBBSTICKSPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 2 572 (counter depan queen)', NULL, 'Field', '857335356', ' ', 'Ms. Mufa / Ms. Rina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1873-ZELDA-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(222, 'Business as usual (Regular)', 'ATPM 4W', '1883', 'DAIHATSU - WARU', 'SIDOARJO, KAB.', 'Car Dealers', NULL, ' ', 'DAIHATSU', 'EAST JAVA', '0', 'CHAINS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', ' ', 'JL. RAYA WARU KM 15', NULL, ' ', ' ', '8126785191', 'MR. WIDODO', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1883-DAIHATSU - WARU-SIDOARJO, KAB.', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(223, '2018 BAU', 'IACC/IPPS', '1884', 'BERKAH KOMPUTER', 'BANDUNG, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'e-A/S', 'Staff Visit - USB FlashDisk', 'TEMPLATE Indirect', 'Rolling Sample', 'Dede.Maradinata', 'BANDUNG', 'Bandung Trade Mall', 'Bandung Trade Mall Lt. 02 Blok BB No. 24', NULL, 'Field', 'Lengkapi bila ada', '087821244061', 'Ms. Santi', 'e-Indomaret', '7.5', 'Yes', 'Novan Ergana', '', 'ID', '1884-BERKAH KOMPUTER-BANDUNG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(224, 'Business as usual (Regular)', 'IACC/IPPS', '1915', 'IB COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1E / 33', 'Remote Staff', 'Field', '81553238821', ' ', 'Ms. Yayuk', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1915-IB COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(225, ' ', ' ', '1925', 'MM COMPUTER', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Jl. Kali Urang Km. 10. 7', ' ', 'Field', '0274-882409', ' ', 'Mr. Suhardjo / Ms. Yuli', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '1925-MM COMPUTER-YOGYAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(226, 'Business as usual (Regular)', 'TCS', '1952', 'VICTORY CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt 3 Blok H 535', NULL, 'Field', ' ', '82231365437', 'Ms. Erna', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1952-VICTORY CELL-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(227, '2018 BAU', 'IACC/IPPS', '1960', 'CIPTA PRIMA', 'JAKARTA PUSAT, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'e-A/S', 'Staff Visit - Manual', 'TEMPLATE Indirect', 'Regular', 'Triyana', 'JAKARTA', 'Orion Dusit', 'Dusit Orion Lt. 2 No. 5B', NULL, 'Casual', '02162302447', '021-62302448/0818-08517333', 'Mr. Jono/Ms. Imah', 'e-Indomaret', '10', NULL, 'Sutrio', '', 'ID', '1960-CIPTA PRIMA-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(228, '2018 BAU', 'IASS', '1967', 'CYBER COMPUTER', 'BANDUNG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'e-A/S', 'Staff Visit - USB FlashDisk', 'TEMPLATE Indirect', 'Rolling Sample', 'Dede.Maradinata', 'BANDUNG', 'Bandung Trade Mall', 'Bandung Trade Mall Lt. 02 Blok AA No. 04', NULL, 'Field', '022-76452096', '081320304680', 'Mr. Haris Budiana', 'e-Indomaret', '7.5', 'Yes', 'Novan Ergana', '', 'ID', '1967-CYBER COMPUTER-BANDUNG, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(229, ' ', ' ', '1973', 'MICROTECH', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Jl. Palagan TP (Monjali) 117', ' ', 'Field', '0274-7482094', '0274-7416206', 'Ms. Iin', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '1973-MICROTECH-YOGYAKARTA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(230, '2018 BAU', 'IBRD', '1989', 'MAKRO IT MART 2 (*)', 'JAKARTA PUSAT, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'NO', 'HEWLETT PACKARD', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Dina.Khaira', 'JAKARTA', 'Mangga Dua Mall', 'Mangga Dua Mall Lt. 3 No. 04A', 'makro_eshop@yahoo.com', 'Field', '081319194745', '0216121965', 'Ms. Dina ', 'Indomaret', '7.5', 'Yes', 'Sutrio', '', 'ID', '1989-MAKRO IT MART 2 (*)-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(231, '2018 BAU', 'INBS', '1990', 'MAKRO IT MART 1 (*)', 'JAKARTA PUSAT, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', '0', 'LENOVO', 'JABOTABEK', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Dina.Khaira', 'JAKARTA', 'Mangga Dua Mall', 'Mangga Dua Mall Lt. 3 No. 04A ', 'makro_eshop@yahoo.com', 'Field', '081319194745', '0216121965', 'Ms. Dina', 'Indomaret', '7.5', 'Yes', 'Sutrio', '', 'ID', '1990-MAKRO IT MART 1 (*)-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(232, 'Business as usual (Regular)', 'IBRD', '1991', 'IT TALK', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'NO', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. dasar E no 1', NULL, 'Field', '31-53493', '31-54753', 'Ms. Nurul', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1991-IT TALK-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(233, 'Business as usual (Regular)', 'PHO', '1994', 'PLANET DIGITAL', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1 Blok B-9', NULL, 'Field', '31-5347512', ' ', 'Mr Rony', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1994-PLANET DIGITAL-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(234, 'Business as usual (Regular)', 'PHO', '1996', 'LOLUX', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Royal Plaza Lt. 2 No. K1-2', NULL, 'Field', '< untuk dilengkapi >', NULL, 'Mr. Tony', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '1996-LOLUX-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(235, 'Business as usual (Regular)', 'PHO', '2118', 'APOLLO', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'BG Junction Level 2 / 66-67', 'DROP TOKO TUTUP', 'Field', '31-531163', '8565564845', 'Mr. Adji/Mr. Wandi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2118-APOLLO-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(236, 'Business as usual (Regular)', 'INBS', '2127', 'MOBITEK', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi - Tech Mall Lt. 1C No. 69', 'mytha_mobi@yahoo.com', 'Field', '31 534 957', '82234323866', 'Ms Mytha', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2127-MOBITEK-SURABAYA, KOTA', '2024-03-03 06:25:42', '2024-03-03 06:25:42'),
(237, 'Business as usual (Regular)', 'INBS', '2128', 'LINESTORE', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Hi - Tech Mall', 'Hi-Tech Mall Lantai Dasar A1/22', 'ndik84@yahoo.co.id', 'Field', ' ', '81241589929', 'Mr. Danis', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2128-LINESTORE-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(238, 'Business as usual (Regular)', 'IASS', '2129', 'HOSHITECH COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hitech Mall Lt. 1 blok A-39', 'hoshitec@yahoo.co.id', 'Field', '31-5452759', '85732728415', 'Ms. Fida / Nanik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2129-HOSHITECH COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(239, 'Business as usual (Regular)', 'TCS', '2131', 'QUEEN - SF PREMIUM STORE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, 'SMARTFREN', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 3', NULL, 'Field', '85646328892', ' ', 'Ms Fira', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2131-QUEEN - SF PREMIUM STORE-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(240, 'Business as usual (Regular)', 'PHO', '2132', 'BIG!', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. Dasar Blok B-23C', NULL, 'Field', '8964793246', ' ', 'Mr. Reno', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2132-BIG!-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(241, 'Business as usual (Regular)', 'PHO', '2133', 'FOTO PRO', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. Dasar Blok B-46', NULL, 'Field', '82143326871', ' ', 'Ms. Indah', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2133-FOTO PRO-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(242, 'Business as usual (Regular)', 'INBS', '2134', 'LAPTOPKU', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 2 Blok E no 1-2', NULL, 'Field', '31532619', ' ', 'Mr. Justin', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2134-LAPTOPKU-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(243, 'Business as usual (Regular)', 'ITS', '2135', 'AHA TECH', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hitech Mall Lantai Dasar D-27', NULL, 'Field', '8577129994', ' ', 'Mrs. Rita', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2135-AHA TECH-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(244, 'Business as usual (Regular)', 'ITS', '2139', 'DELTA PERKASA COMPUTER', 'SIDOARJO, KAB.', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SIDOARJO', ' ', 'Jl. Gelora Delt. A No 8 Sidoarjo', NULL, 'Field', 'Lengkapi bila ada', '81241589929', 'Mr. Danis', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2139-DELTA PERKASA COMPUTER-SIDOARJO, KAB.', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(245, 'Business as usual (Regular)', 'CTS', '2158', 'UD NIAGA', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', '< untuk dilengkapi >', NULL, 'Field', '31 -5341765', ' ', 'Ms. Kimiko', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2158-UD NIAGA-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(246, 'Business as usual (Regular)', 'CTS', '2159', 'RAHMAN BAN', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Karang Pilang Barat 24', NULL, 'Field', '31 - 7662141', '8173361511/85331451', 'Mr. Rahman', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2159-RAHMAN BAN-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(247, 'Business as usual (Regular)', 'TCS', '2217', 'QIUTECH', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, 'OPPO', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina lt. 2 blok c1-c2', NULL, 'Field', ' ', '89563196352', 'Ms. Rina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2217-QIUTECH-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(248, 'Business as usual (Regular)', 'MCG', '2241', 'TOKO \"WIJAYA MOTOR\"', 'SURABAYA, KOTA', 'Motorcycle Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Balongsari Tama', NULL, 'Field', '31-741696', ' ', 'Mr. Sumijan', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2241-TOKO \"WIJAYA MOTOR\"-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(249, 'Business as usual (Regular)', 'TCS', '2243', 'PLAYER POZ', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC LT 1 R No 147', NULL, 'Field', '31-5459897', ' ', 'Ms. Ratna', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2243-PLAYER POZ-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(250, 'Business as usual (Regular)', 'ATPM 2W', '2244', 'SUZUKI - SUZUKI KENJERAN', 'SURABAYA, KOTA', 'Motorcycle Dealers', NULL, ' ', 'SUZUKI', 'EAST JAVA', '0', 'CHAINS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Kenjeran 452 A', NULL, 'Field', '858542472', ' ', 'Ms. Vika/Ms. Vita', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2244-SUZUKI - SUZUKI KENJERAN-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(251, 'Business as usual (Regular)', 'TCS', '2246', 'S CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'WTC', 'WTC Lt 2 No 274', NULL, 'Field', '31-53515', '81241589929', 'Mr. Danis', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2246-S CELL-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(252, 'Business as usual (Regular)', 'CGR', '2266', 'NEW PERDANA', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Raya Tenggilis 144', NULL, 'Field', '31-843483', ' ', 'Ms. Dwi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2266-NEW PERDANA-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(253, 'Business as usual (Regular)', 'TCS', '2275', 'CENTRUM', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 1/73 ', NULL, 'Field', '8785914211', ' ', 'Ms. Yeni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2275-CENTRUM-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(254, 'Business as usual (Regular)', 'TCS', '2276', 'TOKO BAGUS', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Maspion Square Lt Dasar E-2', NULL, 'Field', '87853514451', ' ', 'Ms. Hani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2276-TOKO BAGUS-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(255, 'Business as usual (Regular)', 'TCS', '2278', 'SWISS COMM', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 3H NO. A1', NULL, 'Field', ' ', '85885458545', 'Mr. Tatak', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2278-SWISS COMM-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(256, 'Business as usual (Regular)', 'TCS', '2279', 'MCS (MOBILE CONCEPT SOLUTIONS)', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Mastech Blok E 3 Maspion Square', NULL, 'Field', '8574599', ' ', 'Mr. Suherman', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2279-MCS (MOBILE CONCEPT SOLUTIONS)-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(257, 'Business as usual (Regular)', 'PHO', '2286', 'GLOBAL DIGITAL', 'SURABAYA, KOTA', 'Photo Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hitech Mall Lt. Dasar C1 No 1', NULL, 'Field', '31-81434832', ' ', ' ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2286-GLOBAL DIGITAL-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(258, 'Business as usual (Regular)', 'MCG', '2288', 'OLIVIA MOTOR', 'SURABAYA, KOTA', 'Motorcycle Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Kapas Krampung 18 B', NULL, 'Field', '< untuk dilengkapi >', NULL, 'Mr. Anton', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2288-OLIVIA MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(259, 'Business as usual (Regular)', 'TCS', '2294', 'SINAR CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt 2 No 241', 'ikakitty339@gmail.com', 'Field', '85648568', ' ', 'Ms. Ika', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2294-SINAR CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(260, 'Business as usual (Regular)', 'ITS', '2298', 'ALFA OMEGA', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Bratang', 'Jl. Baratajaya XVIII No 63', 'andy_marketingalfa@yahoo.com', 'Field', ' ', '81332913', 'Mr. Andy', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2298-ALFA OMEGA-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(261, 'Business as usual (Regular)', 'IACC/IPPS', '2299', 'DEN-T COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt. 2 Blok A-8', NULL, 'Field', '31-848138', '81217777667', 'Ms. Lia', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2299-DEN-T COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(262, 'Business as usual (Regular)', 'IASS', '2392', 'NARITA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. Dasar C1 / 54', NULL, 'Field', '31-5467548', ' ', 'Ms. Tia', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2392-NARITA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(263, 'Business as usual (Regular)', 'CGR', '2393', 'TOP SPOT', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya tenggilis no 42', NULL, 'Field', '31-8483683', 'Lengkapi bila ada', 'Mr Hansen', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2393-TOP SPOT-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(264, 'Business as usual (Regular)', 'ITS', '2396', 'NAGA CAHAYA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hitech Mall Lt 1A no 7B', NULL, 'Field', '< untuk dilengkapi >', '8233821471', 'Mr. Budi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2396-NAGA CAHAYA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(265, 'Business as usual (Regular)', 'ITS', '2397', 'SANCA WIJAYA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'HI-TECH MALL Lt. 1A No. 83', NULL, 'Field', '31-5316561 ', ' ', 'Ms. Era Wass', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2397-SANCA WIJAYA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(266, 'Business as usual (Regular)', 'INBS', '2398', 'CACTUS COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Hi - Tech Mall', 'Hi-Tech Mall Lt. Dasar A / 28', 'adhityafirman12@gmail.com', 'Field', ' ', '85326722352', 'Mr. Adhitya Firman', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2398-CACTUS COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(267, '2018 BAU', 'TCS', '2401', 'ICON HP', 'JAKARTA PUSAT, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Eka.Sugiarti', 'JAKARTA', 'ITC Roxy Mas', 'ITC Roxy Mas Lt. 3 No. 108', 'KE ICON HP2', 'Casual', '021-63858986', '081213138726', 'Ms. Siti', 'OVO', '5', NULL, 'Sutrio', '', 'ID', '2401-ICON HP-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(268, '2018 BAU', 'GES', '2421', 'SUARA AGUNG (*)', 'JAKARTA BARAT, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'e-A/S', 'Non Visit - Email', 'TEMPLATE Indirect', 'Rolling Sample', 'Parlin.Hutagalung', 'JAKARTA', 'Glodok', 'Komp. Ruko Glodok Plaza Blok F No. 57-58', NULL, 'Field', '021-6491689', '081290751744', 'Mr. Daniel', 'OVO', '12.5', 'Yes', 'Sutrio', '', 'ID', '2421-SUARA AGUNG (*)-JAKARTA BARAT, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(269, ' ', ' ', '2430', 'NABILA(BCA COM)', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Ramai Centra Computer (Ramai Mall) Lt. 2 Jl. A. Yani No. 73', ' ', 'Field', '0274-6589189', ' ', 'Ms. Uut', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '2430-NABILA(BCA COM)-YOGYAKARTA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(270, '2018 BAU', 'TCS', '2437', 'ASIA JAYA [WTC LT. 2]', 'SURABAYA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'Sales Recap', 'Non Visit - Whatsapp', 'TEMPLATE Indirect', 'Rolling Sample', 'Wendy.Prasetyo', 'LAMONGAN', 'WTC', 'WTC Lt. 2 / 254', 'simusyalfa02@yahoo.co.id', 'Field', '031-5319240', '87851340999', 'Mrs. Siti', 'e-Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '2437-ASIA JAYA [WTC LT. 2]-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(271, ' ', ' ', '2469', 'CENTRAL FOTO', 'YOGYAKARTA, KOTA', 'Minilabs', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM Audit Internal (Non Able)', 'Regular', 'Fuad.Kurniawan', 'YOGYAKARTA', ' ', 'Jl. Urip Sumoharjo No. 50', ' ', 'Field', '0274-515396', '8975084022', 'Mrs. Mayang', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '2469-CENTRAL FOTO-YOGYAKARTA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(272, 'Business as usual (Regular)', 'IM', '2493', 'NEW GALAXY', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'JL. Gunung Sari NO. 51 A', NULL, 'Field', '< untuk dilengkapi >', '818529112', 'Mr. Peter', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2493-NEW GALAXY-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(273, 'Business as usual (Regular)', 'INBS', '2522', 'ARDYA COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1C / 5', NULL, 'Field', '31-547234', ' ', 'Ms. Nilawati', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2522-ARDYA COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(274, 'Business as usual (Regular)', 'CGR', '2529', 'PERKASA', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Prapen No 4', NULL, 'Field', '31-8413757', '8385524256', 'Mrs. Wati', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2529-PERKASA-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(275, 'Business as usual (Regular)', 'INBS', '2549', 'X-BOOK', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', 'Hi - Tech Mall', 'Hi-Tech Mall Lt. 1 - B no 28', 'Iwaned.iwaned@yahoo.com', 'Field', '856552426', '8121772934', 'Mr. Iwan', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2549-X-BOOK-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(276, 'Business as usual (Regular)', 'IM', '2555', 'TERANG JAYA', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Tambang Boyo 11', 'radius58@gmail.com', 'Field', '85646655131', '87855216743', 'Mr. Radius', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2555-TERANG JAYA-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(277, '2018 BAU', 'TCS', '2557', 'BG CELULAR', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Ema.Agustina', 'SURAKARTA', NULL, 'Singosaren Plaza Lt. 1', NULL, 'TIKI ONS', '2717022758', NULL, 'Mr. Deny', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2557-BG CELULAR-SURAKARTA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(278, '2018 BAU', 'TCS', '2564', 'PINK CELL - PUPUTAN', 'KLUNGKUNG, KAB.', 'Mobile Phone Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Rolling Sample', 'Gatot.Suputra', 'DENPASAR', NULL, 'Jl. Puputan 17', NULL, 'Field', 'Lengkapi bila ada', '087861982299', 'Mr. Agus Eka', 'e-Indomaret', '5', 'Yes', 'Mestika Pradana', '', 'ID', '2564-PINK CELL - PUPUTAN-KLUNGKUNG, KAB.', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(279, '2018 BAU', 'TCS', '2572', 'SEGA CELLULAR', 'MALANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'STREAM Other', 'Regular', 'Elfa.Ramandhita', 'MALANG', 'Malang Plaza', 'Malang Plaza Lt. 3', NULL, 'Field', 'Lengkapi bila ada', '08977002777', 'Mr. Hengky', 'e-Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '2572-SEGA CELLULAR-MALANG, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(280, '2018 BAU', 'GES', '2580', 'PURICELL', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Faridah.Ulfah', 'SURAKARTA', NULL, 'Solo Grand Mall Lt. 3 [PERLU KIRIM AMPLOP]', NULL, '0', '0271-740347', NULL, 'Cindy', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2580-PURICELL-SURAKARTA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(281, '2018 BAU', 'GES', '2583', 'JAGO SELULAR', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Priyo.Handoko', 'SURAKARTA', NULL, 'Solo Grand Mall Lt. 3 Blok K No. 7', NULL, 'TIKI ONS', '0856-47402088', NULL, 'Ms. Ririn', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2583-JAGO SELULAR-SURAKARTA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(282, '2018 BAU', 'TCS', '2584', 'SAS-07', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Rizky.Julaicha', 'SURAKARTA', NULL, 'Singosaren Plaza Lt. 1 Blok F No. 57 ', NULL, 'Field', '8562515949', NULL, 'Mr. Widodo', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2584-SAS-07-SURAKARTA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(283, '2018 BAU', 'TCS', '2593', 'RB. MANDIRI', 'SAMARINDA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'KALIMANTAN', 'EAST KALIMANTAN', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'Mini Nota (by GfK)', 'Non Visit - Whatsapp', 'STREAM Other', 'Regular', 'Dedy.Marhadi', 'SAMARINDA', NULL, 'Mall Mesra Indah Lt. Dasar (DPN Hero)', NULL, 'Casual', '0541 - 765530 ', '085250382727', 'Wajib dilengkapi (Mr. /Mrs. /Ms. )', 'KFC', '4', NULL, 'Mahfud', '', 'ID', '2593-RB. MANDIRI-SAMARINDA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(284, '2018 BAU', 'TCS', '2602', 'DILLA CELL', 'PADANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', NULL, NULL, 'TEMPLATE INDIR', 'Regular', 'Ferry.Azwar', 'PADANG', 'Mall', 'Plaza Andalas Lt. II', 'Remote Staff', 'Field', 'Lengkapi bila ada', '085263238008', 'Mr. Udo', 'None', '0', NULL, 'Muhamad Asfaroini', '', 'ID', '2602-DILLA CELL-PADANG, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(285, '2018 BAU', 'TCS', '2606', 'MOCCHI PHONE', 'PADANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', NULL, NULL, 'TEMPLATE INDIR', 'Regular', 'Ferry.Azwar', 'PADANG', 'Mall', 'Plaza Andalas Lt. II', NULL, 'Field', 'Lengkapi bila ada', '08128066860', 'Ms. Olive', 'None', '0', NULL, 'Muhamad Asfaroini', '', 'ID', '2606-MOCCHI PHONE-PADANG, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(286, '2018 BAU', 'TCS', '2619', 'WAWA CELLULAR', 'BANDAR LAMPUNG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'XLARGE', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Budi.Handono', 'BANDAR LAMPUNG', 'MALL KARTINI', 'Mall Kartini Lt. Dasar Blok E No. 42', NULL, 'Field', 'Lengkapi bila ada', '082178138080', 'Mr. Iwan', 'KFC', '5', NULL, 'Murbeng Lelana', '', 'ID', '2619-WAWA CELLULAR-BANDAR LAMPUNG, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(287, '2018 BAU', 'TCS', '2621', 'VIE CELL', 'BANDAR LAMPUNG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Budi.Handono', 'BANDAR LAMPUNG', 'MALL KARTINI', 'Mall Kartini Lt. Dasar C No. 8', NULL, 'Field', 'Lengkapi bila ada', '082177419990', 'Mr. Cornelius', 'KFC', '5', NULL, 'Murbeng Lelana', '', 'ID', '2621-VIE CELL-BANDAR LAMPUNG, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(288, '2018 BAU', 'TCS', '2622', 'CV. ABADI', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Herlia.Anindi', 'SURAKARTA', NULL, 'Jl. Slamet Riyadi No. 152 ', NULL, 'TIKI ONS', '0271-653072', NULL, 'Ms. Herlina', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2622-CV. ABADI-SURAKARTA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(289, 'Business as usual (Regular)', 'GLW', '2629', 'BERKAT JAYA', 'SURABAYA, KOTA', 'Household Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'PGS lantai Ground G -3', NULL, 'Field', '81216521246', ' ', 'Mrs. Melani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2629-BERKAT JAYA-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(290, 'Business as usual (Regular)', 'TCA', '2632', 'DRICELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Galeria Lt. 2 No. 839', NULL, 'Field', '31-778552', '8128162627', 'Ms. Welly', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2632-DRICELL-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(291, 'Business as usual (Regular)', 'MCA', '2652', 'ABANG MOTOR', 'SURABAYA, KOTA', 'Motorcycle Accessories Spec', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Kenjeran 72', NULL, 'Field', '< untuk dilengkapi >', '87751787', 'Mr. Abang', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2652-ABANG MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(292, '2018 BAU', 'TCS', '2653', 'EDY MOBILE PHONE', 'PONTIANAK, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'KALIMANTAN', 'WEST KALIMANTAN', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Jeffri.Jefri', 'PONTIANAK', 'Road Area', 'Jl. Gusti Sulung Lelanang No. 12', 'Auditshet kirim ke Alamat RS', 'Field', 'Lengkapi bila ada', '08125644343', 'Mr. Edy', 'e-Indomaret', '5', NULL, 'Murbeng lelana', '', 'ID', '2653-EDY MOBILE PHONE-PONTIANAK, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(293, 'Business as usual (Regular)', 'MCA', '2654', 'WILSON MOTOR', 'SURABAYA, KOTA', 'Motorcycle Accessories Spec', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Bratang', 'Jl. Bratang Gede No 89', NULL, 'Field', 'Lengkapi bila ada', '8585211119', 'Mr. Windu', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2654-WILSON MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(294, 'Business as usual (Regular)', 'MCA', '2655', 'FANDY JAYA MOTOR', 'SURABAYA, KOTA', 'Motorcycle Accessories Spec', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Bratang', 'Jl. Barata Jaya No. 11C', NULL, 'Field', 'Lengkapi bila ada', '8512444465', 'Mrs. Eddy/ Mrs. Sofi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2655-FANDY JAYA MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:43', '2024-03-03 06:25:43'),
(295, '2018 BAU', 'TCS', '2662', 'FAVORITE CELL', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Aji.Prasetyo', 'SURAKARTA', NULL, 'Singosaren Plaza Lt. 1 Blok F No. 58-59', NULL, '0', '0271-637559', NULL, 'Mr. Endrizal', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2662-FAVORITE CELL-SURAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(296, 'Business as usual (Regular)', 'TCS', '2666', 'RADJA SATELITE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2 No. 289-29', NULL, 'Field', 'Lengkapi bila ada', '8775325771', 'Mrs. Ita', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2666-RADJA SATELITE-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(297, '2018 BAU', 'TCS', '2667', 'MENARA DIGITAL', 'PONTIANAK, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'KALIMANTAN', 'WEST KALIMANTAN', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Jeffri.Jefri', 'PONTIANAK', 'Plaza', 'Jl. Sultan Abdurahman', 'Auditshet kirim ke Alamat RS', 'Field', '089507958685', '089507958685', 'Ms. Maulidia Adisti', 'OVO', '5', NULL, 'Murbeng lelana', '', 'ID', '2667-MENARA DIGITAL-PONTIANAK, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(298, 'Business as usual (Regular)', 'INBS', '2692', 'QL STORE', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', 'APPLE', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', '< untuk dilengkapi >', NULL, 'Field', '31-54766', ' ', 'Mr. Albert / Mr. Bambang', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2692-QL STORE-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(299, 'Business as usual (Regular)', 'PDA', '2693', 'TOKO PDA', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PDA SPECIALISTS', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Surabaya Lt. 2 / 6', NULL, 'Field', '31-5315368', ' ', 'Mr. Erick / Agus', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2693-TOKO PDA-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(300, '2018 BAU', 'TCS', '2728', 'LAMPUNG CELL', 'BANDAR LAMPUNG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Budi.Handono', 'BANDAR LAMPUNG', 'SIMPUR CENTER', 'Simpur Center Lt. Dasar Blok A No. 50', NULL, 'Field', 'Lengkapi bila ada', '081279555500', 'Ms. Fina', 'KFC', '5', NULL, 'Murbeng Lelana', '', 'ID', '2728-LAMPUNG CELL-BANDAR LAMPUNG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(301, '2018 BAU', 'TCA', '2732', 'ORIGINAL SHOP', 'BANDUNG, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Rully.Ibrahim', 'BANDUNG', 'Bandung Electronic Centre', 'Bandung Electronic Centre Lt. LG Blok B No. 10', NULL, 'Field', '022-4223031', '087824571974', 'Ms. Flaviana/Ayu', 'e-Indomaret', '4', NULL, 'Novan Ergana', '', 'ID', '2732-ORIGINAL SHOP-BANDUNG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(302, 'Business as usual (Regular)', 'TCA', '2736', 'SATELITE', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2 ', NULL, 'Field', 'Lengkapi bila ada', '81249114413', 'Ms. Luluk', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2736-SATELITE-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(303, 'Business as usual (Regular)', 'CTS', '2743', 'SAMUDRA BAN', 'SURABAYA, KOTA', 'Tire Specialist', 'CAR TIRES', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Undaan Wetan 16C', NULL, 'Field', '31-5345657', '811374612', 'Ms. Selvi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2743-SAMUDRA BAN-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(304, '2018 BAU', 'PHO', '2760', 'AURORA PHOTO', 'SURABAYA, KOTA', 'Photo Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Luxman.Sanjaya', 'SIDOARJO', NULL, 'Jl. Kramat Gantung No. 18', NULL, 'Field', '031-5350515', '081231622263', 'Ms. Risma/ Ms. Narti', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '2760-AURORA PHOTO-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(305, 'Business as usual (Regular)', 'TCA', '2778', 'CITY CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'JMP', 'JMP Lantai Dasar Blok A No S8A', NULL, 'Field', ' ', '81231988878', 'Mr. Agus', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2778-CITY CELL-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(306, 'Business as usual (Regular)', 'TCS', '2779', 'CAHAYA CELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'JMP', 'JMP Lantai Dasar Blok A No 2B', NULL, 'Field', 'Lengkapi bila ada', '88228384685', 'Mrs. Tika', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2779-CAHAYA CELL-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(307, '2018 BAU', 'IACC/IPPS', '2784', 'DINAMIS KOMPUTER', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Agung.Sunaryo', 'YOGYAKARTA', 'Jogjatronik (JKM)', 'Jogjatronik (JKM) Lt. 2 Jl. Brigjen Katamso 75-77', NULL, 'Field', '0274 7889490', 'No. Telp Wajib di isi', 'Ms. Fitri/Mrs. Siti', 'e-Indomaret', '5', NULL, 'Agung Sunaryo', '', 'ID', '2784-DINAMIS KOMPUTER-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(308, '2018 BAU', 'IASS', '2788', 'EXPO COMPUTER', 'BANDUNG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'e-A/S', 'Staff Visit - USB FlashDisk', 'TEMPLATE Indirect', 'Regular', 'Dede.Maradinata', 'BANDUNG', 'Bandung Trade Mall', 'Bandung Trade Mall Lt. 02 Blok BB No. 07', NULL, 'Field', 'Lengkapi bila ada', '081809019191', 'Mr. Rendi', 'e-Indomaret', '7.5', 'Yes', 'Novan Ergana', '', 'ID', '2788-EXPO COMPUTER-BANDUNG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(309, 'Business as usual (Regular)', 'IBRD', '2793', 'BRANDED SHOP', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'NO', 'HEWLETT PACKARD', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. Dasar E / 8', NULL, 'Field', '31-5471515', ' ', 'Mr. Ashuri', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2793-BRANDED SHOP-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(310, '2018 BAU', 'PDA', '2809', 'GADGET STORE', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PDA SPECIALISTS', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Tulus.Handoko', 'YOGYAKARTA', NULL, 'Plaza Ambarukmo Lt. LG A-26 Jl. Laksda Adisucipto ', NULL, 'Field', '0274 4331201', '082138838919', 'Ms. Ratna', 'e-Indomaret', '5', NULL, 'Agung Sunaryo', '', 'ID', '2809-GADGET STORE-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(311, 'Business as usual (Regular)', 'CONS', '2828', 'JAVA PRINT', 'SURABAYA, KOTA', 'Consumable Specialists', 'CARTRIDGE SHOPS', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Penjaringan Sari Timur No. 62', 'Remote Staff', 'Field', '856344495', '85731599679', 'Ms. Nina/Mr. Kiki', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2828-JAVA PRINT-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(312, 'Business as usual (Regular)', 'TCA', '2842', 'MOBI PART', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'WTC Lt. 4 / 41', 'MobiolshopSurabaya@gmail.com', 'Field', '31-535572', '83831252', 'Ms. Malinda', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2842-MOBI PART-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(313, '2018 BAU', 'TCS', '2843', 'AA CELLULAR (SINGOSAREN)', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Dian.Marshela', 'SURAKARTA', NULL, 'Singosaren Plaza Lt. 1', NULL, 'TIKI ONS', '0271-7073250', '0271-7563355', 'Mr. Edi', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2843-AA CELLULAR (SINGOSAREN)-SURAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(314, ' ', ' ', '2848', 'AGEN RESMI DIGITAL', 'YOGYAKARTA, KOTA', 'Electrical Specialists', 'MIX CE/PHOTO', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Jl. Urip Sumaharjo ', ' ', 'Field', '0274-7197911/ 0247-551455', '0856.2805.704', 'Mr. Jones / Ms. Tika / Ms. Wulan', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '2848-AGEN RESMI DIGITAL-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(315, '2018 BAU', 'CBS', '2850', 'IT STORE 2', 'YOGYAKARTA, KOTA', 'Electrical Specialists', 'MIX CE/PHOTO', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'Sales Recap', 'Non Visit - Whatsapp', 'STREAM Other', 'Rolling Sample', 'Tulus.Handoko', 'YOGYAKARTA', NULL, 'Jl. Kaliurang Km. 5. 2 No. 23', NULL, 'Field', 'Lengkapi bila ada', '087839537890', 'Ms. Decy ', 'e-Indomaret', '5', NULL, 'Agung Sunaryo', '', 'ID', '2850-IT STORE 2-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(316, '2018 BAU', 'CBS', '2854', 'CASIO CONCEPT SHOP', 'YOGYAKARTA, KOTA', 'Electrical Specialists', 'MIX CE/PHOTO', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'Sales Recap', 'Non Visit - Whatsapp', 'STREAM Other', 'Rolling Sample', 'Tulus.Handoko', 'YOGYAKARTA', NULL, 'Plaza Ambarukmo Lt. 2', NULL, 'Field', '0274 4331389', '087839537890', 'Ms. Decy', 'e-Indomaret', '5', NULL, 'Agung Sunaryo', '', 'ID', '2854-CASIO CONCEPT SHOP-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(317, ' ', ' ', '2874', 'JUPITER', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM PAPER (E-AS)', 'Regular', NULL, 'YOGYAKARTA', 'Ramai Mall', 'Ramai Centra Computer, Ramai Mall Lt. 2 Jl. A. Yani 73 ', ' ', 'Field', 'Lengkapi bila ada', '82135970627', 'Mr.Agung', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '2874-JUPITER-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(318, 'Business as usual (Regular)', 'ITS', '2882', 'RIZQI COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Pasar TempureJO stand AA No. 2. Jalan TempureJO Surabaya', NULL, 'Field', '31-83229', '31-6261969', 'Mrs. Icha / Mrs. Rina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2882-RIZQI COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(319, ' ', ' ', '2884', 'AMANAH (JOGJATRONIK)', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Jogjatronik (JKM) Lt. 2 Jl. Brigjen Katamso 75-77', ' ', 'Field', '0274-557028', '0813.2836.4146 / 0274-420421', 'Ms. Nia / Ms. Try', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '2884-AMANAH (JOGJATRONIK)-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44');
INSERT INTO `shoplists` (`id`, `project`, `sh_type`, `gsnr`, `shop_name`, `city`, `channel_name`, `shop_type`, `assembled`, `a_clients`, `region`, `region2`, `organisat_type`, `shopsize1`, `sample_status`, `metode_konversi`, `penyampaian_ke_gfK`, `datadeliverytyp`, `schedule`, `data_collector`, `base_staff`, `area`, `street`, `delivery_address`, `courier`, `telephone`, `mobile_phone`, `contact_person`, `v_type`, `v_amount`, `kelipatan_25`, `spv`, `spv_id`, `country`, `nameofshop`, `created_at`, `updated_at`) VALUES
(320, '2018 BAU', 'TCS', '2926', 'DD CELLULAR', 'PALEMBANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'SMALL', 'FAILURE', 'e-A/S', 'Staff Visit - USB FlashDisk', 'TEMPLATE Indirect', 'Rolling Sample', 'Rizka.Putra', 'PALEMBANG', 'MEGAHRIA', 'Megahria Shoping Centre Lt. Dasar Basment Parkir', NULL, 'TIKI ONS', '0853-69990999', '0853-69990999', 'Mr. Asikin', 'None', '0', ' ', 'Murbeng Lelana', '', 'ID', '2926-DD CELLULAR-PALEMBANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(321, 'Business as usual (Regular)', 'MCTY', '2932', 'AGUS VARIASI MOTOR', 'SURABAYA, KOTA', 'Motorcycle Accessories Spec', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', ' ', 'Jl. Ketintang Barat no. 1', NULL, 'Field', 'Lengkapi bila ada', '821 4 6624', 'Mr. Agus', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2932-AGUS VARIASI MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(322, 'Business as usual (Regular)', 'TCA', '2933', 'INDOKA', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'WTC', 'WTC Lt. 3 / 32', NULL, 'Field', 'Lengkapi bila ada', '8774421666', 'Ms. Septina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2933-INDOKA-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(323, '2018 BAU', 'TCS', '2937', 'DUTA CELL', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', 'E-AS', 'E-AS', 'TEMPLATE Indirect', 'Regular', 'Herlia.Anindi', 'SURAKARTA', NULL, 'Singosaren Plaza Lt. Dasar Blok B No. 23', NULL, 'Field', ' ', '85643128912', 'Mr. Arif', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2937-DUTA CELL-SURAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(324, '2018 BAU', 'TCS', '2938', 'GAGA CELLULAR', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'e-A/S', 'Non Visit - Email', 'TEMPLATE Indirect', 'Regular', 'Dian.Marshela', 'SURAKARTA', NULL, 'Singosaren Plaza Lt. Dasar', NULL, 'Field', '088228727969', 'No. Telp Wajib di isi', 'Mr. Nur', 'Indomaret', '5', NULL, 'Toni Warsono', '', 'ID', '2938-GAGA CELLULAR-SURAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(325, 'Business as usual (Regular)', 'ITS', '2945', 'FUJI COMP', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Marina Lt 2 Blok F no 2', NULL, 'Field', '< untuk dilengkapi >', NULL, ' ', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2945-FUJI COMP-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(326, 'Business as usual (Regular)', 'ITS', '2946', 'INTAN COMPUTER', 'SURABAYA, KOTA', 'Computerhardware-Shops', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hitech Mall Lt Dasar Blok A -23', NULL, 'Field', '31-5476574', ' ', 'Ms.Erlina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2946-INTAN COMPUTER-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(327, 'Business as usual (Regular)', 'GES', '2953', 'SUMBER JAYA ELEKTRONIK', 'SIDOARJO, KAB.', 'Electrical Specialists', 'GEN ELEC SHOP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Pasar Baru Sepanjang-Taman', NULL, 'Field', 'Lengkapi bila ada', '81217116211', 'Mr. Efendi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2953-SUMBER JAYA ELEKTRONIK-SIDOARJO, KAB.', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(328, '2018 BAU', 'TCS', '2969', 'ONSEN CELULAR 2', 'PADANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Ferry.Azwar', 'PADANG', NULL, 'Jl. Alai No. 1', 'Remote Staff', 'Field', 'Lengkapi bila ada', '082288148199', 'Mr. Yudi / Ms. Meta', 'OVO', '5', NULL, 'Muhamad Asfaroini', '', 'ID', '2969-ONSEN CELULAR 2-PADANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(329, '2018 BAU', 'TCS', '2973', 'ANDA CELULAR', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Ema.Agustina', 'SURAKARTA', NULL, 'Jl. Yos Sudarso No. 401', NULL, 'TIKI ONS', '0271-5846509', NULL, 'Mr. Agus', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '2973-ANDA CELULAR-SURAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(330, 'Sample enhancement', 'TCS', '2998', 'DUKOMSELL', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plaza Marina', 'Plaza Marina Lt.2 224', NULL, 'Field', ' ', '82338883898', 'Ms.Dia', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '2998-DUKOMSELL-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(331, 'Business as usual (Regular)', 'TCS', '3006', 'MEDIA PONSELINDO (PTC) (*)', 'PALEMBANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM PAPER', 'Regular', NULL, 'PALEMBANG', NULL, 'PTC Mall Lt. Dsr Jl. R. Soekamto', NULL, 'Field', '0711-7363216', NULL, 'Mr. Eman', 'None', '0', ' ', 'Murbeng Lelana', '', 'ID', '3006-MEDIA PONSELINDO (PTC) (*)-PALEMBANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(332, '2018 BAU', 'IASS', '3011', 'YASA COMP', 'BANDUNG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'e-A/S', 'Staff Visit - USB FlashDisk', 'TEMPLATE Indirect', 'Rolling Sample', 'Dede.Maradinata', 'BANDUNG', 'Bandung Trade Mall', 'Bandung Trade Mall Lt. 02 Blok BB No. 11', NULL, 'Field', 'Lengkapi bila ada', '081809019191', 'Mr. Rendi', 'e-Indomaret', '7.5', 'Yes', 'Novan Ergana', '', 'ID', '3011-YASA COMP-BANDUNG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(333, '2018 BAU', 'TCS', '3060', 'GAYA CELLULAR', 'PADANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Specific', 'Staff Visit - on The Spot', 'WEBLINK', 'Regular', 'Ferry.Azwar', 'PADANG', NULL, 'Jl. Permindo ', NULL, 'Field', 'Lengkapi bila ada', '0751-9789646', 'Mr. Firman / Ms. Desy', 'KFC', '6', NULL, 'Muhamad Asfaroini', '', 'ID', '3060-GAYA CELLULAR-PADANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(334, 'Business as usual (Regular)', 'TCS', '3101', 'CS SELULAR (*)', 'PALEMBANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM PAPER', 'Regular', NULL, 'PALEMBANG', NULL, 'Palembang Square Basement Floor Jl. Angkatan 45 No. 1', NULL, 'Field', '0878-05345192', NULL, 'Ms. Siowen', 'None', '0', ' ', 'Murbeng Lelana', '', 'ID', '3101-CS SELULAR (*)-PALEMBANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(335, 'Sample enhancement', 'CGR', '3121', 'TIMOR NGINDEN MOTOR', 'SURABAYA, KOTA', 'Car Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', 'SURABAYA, KOD', 'Jl. Raya Nginden 1', NULL, 'Field', '81249938993', ' ', 'Mrs. Suswati', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3121-TIMOR NGINDEN MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(336, '2020 Sample Enhancement', 'MCG', '3171', 'ADJI JAYA MOTOR  (Jalan Pogot)', 'SURABAYA, KOTA', 'Motorcycle Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'SURABAYA, KOD', 'Jl. Pogot 123', NULL, 'Field', '31-3731371', 'Lengkapi bila ada', 'Mrs. Hartani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3171-ADJI JAYA MOTOR  (Jalan Pogot)-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(337, '2020 Sample Enhancement', 'MCG', '3172', 'ADJI JAYA MOTOR (Jalan Kenjeran)', 'SURABAYA, KOTA', 'Motorcycle Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'SURABAYA, KOD', 'Jl. Kenjeran  281A', NULL, 'Field', '31-3731371', 'Lengkapi bila ada', 'Mrs. Hartani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3172-ADJI JAYA MOTOR (Jalan Kenjeran)-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(338, '2018 BAU', 'PHO', '3176', 'BLITZ CAM\'S (*)', 'JAKARTA PUSAT, KOTA', 'Photo Specialists', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Dina.Khaira', 'JAKARTA', 'Mangga Dua Mall', 'Mangga Dua Mall Lt. 2 No. 35 ', 'marianaprima230@gmail.com', 'Casual', '085323668549', '085819931723', 'Ms. Marina', 'Indomaret', '5', NULL, 'Sutrio', '', 'ID', '3176-BLITZ CAM\'S (*)-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(339, '2018 BAU', 'GES', '3182', 'SIGMA ELECTRONIC', 'SEMARANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Catur.Nugroho', 'SEMARANG', ' ', 'Jl. Lamper Tengah I', NULL, 'Field', '024-6715467', NULL, 'Ms. Erna', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3182-SIGMA ELECTRONIC-SEMARANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(340, '2018 BAU', 'GES', '3183', 'SAKURA JAYA ELECTRONIC', 'SUKABUMI, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE NEW', 'Manual A/S', 'Manual A/S', 'STREAM PAPER', 'Rolling Sample', 'Reza.Sukabumi', 'SUKABUMI', 'ROAD AREA', 'Jl. Jend. A. Yani No. 162', NULL, 'Field', '0266-225047', '085814429710', 'Mr. Herianto', 'None', '0', NULL, 'Triyana', '', 'ID', '3183-SAKURA JAYA ELECTRONIC-SUKABUMI, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(341, 'Business as usual (Regular)', 'INBS', '3196', 'IMPERIAL', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1B1 / 1', NULL, 'Field', '31-535544', '31-546972', 'Ms. Novi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3196-IMPERIAL-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(342, ' ', ' ', '3198', 'ELLA', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Jogjatronik (JKM) Lt. 2 Jl. Brigjen Katamso 75-77', ' ', 'Field', '0274-547156', '8971945899', 'Mrs. Intan', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3198-ELLA-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(343, '2018 BAU', 'ML', '3200', 'MODERN PHOTO (SENEN)', 'JAKARTA PUSAT, KOTA', 'Motorcycle Garages', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE NEW', 'A/S Whatsapp', 'Non Visit - Whatsapp', 'STREAM Audit Internal (N-Able)', 'Rolling Sample', 'Ardi.Saputra', 'JAKARTA', 'Senen', 'Ruko Segitiga Senen Blok E No. 19-20 ', NULL, 'Casual', '021-3852368', '087888615570', 'Mr. Rudi', 'None', '0', NULL, 'Sutrio', '', 'ID', '3200-MODERN PHOTO (SENEN)-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(344, 'Business as usual (Regular)', 'IACC', '3224', 'MMC', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plaza Marina', 'Plaza Marina Lt 2 Blok E - 7', NULL, 'Field', ' ', '85335892471', 'Ms.Indah', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3224-MMC-SURABAYA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(345, '2018 BAU', 'TCS', '3231', 'MBAHMAN 354 SELL', 'SEMARANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Ardha.Restamulia', 'SEMARANG', NULL, 'Plaza Simpang Lima Lt. 2 Blok B / 33', NULL, 'Field', '024 70330200', '08122810887', 'Ms. Wati', 'Indomaret', '10', NULL, 'Toni Warsono', '', 'ID', '3231-MBAHMAN 354 SELL-SEMARANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(346, '2018 BAU', 'TCS', '3233', 'KURNIA SELLULAR', 'SEMARANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Ardha.Restamulia', 'SEMARANG', NULL, 'Jl. Singosari Raya No. 8A', NULL, 'Field', '024-70106789', '085647351802', 'Mr. Andre', 'Indomaret', '5', NULL, 'Toni Warsono', '', 'ID', '3233-KURNIA SELLULAR-SEMARANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(347, '2018 BAU', 'TCA', '3234', 'ANAMELLY', 'SEMARANG, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Chandrika.Kusuma', 'SEMARANG', ' ', 'Jl. Pandanaran No. 89', NULL, 'Field', '024-8455577', '0815.7511.2112', 'Mr. Bayu Yulianto', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3234-ANAMELLY-SEMARANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(348, '2018 BAU', 'TCS', '3235', 'IWAN SELULAR 1', 'SEMARANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Chandrika.Kusuma', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. Dasar ', NULL, 'Field', '< untuk dilengkapi >', '085-727222256', 'Mr. Iwan', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3235-IWAN SELULAR 1-SEMARANG, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(349, ' ', ' ', '3238', 'QUICK SELLULAR', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Gedung Ex BDNI (Wisma HartoNo) Lt. 2 No. 1-2 ', ' ', 'Field', '0274-554402', '85643030808', 'Mr. Adi Sanjaya', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3238-QUICK SELLULAR-YOGYAKARTA, KOTA', '2024-03-03 06:25:44', '2024-03-03 06:25:44'),
(350, ' ', ' ', '3249', 'OVALINDO', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Malioboro Cellular Market (Eks. Sami Jaya)', ' ', 'Field', '0274-8226001', '81931705999', 'Ms. Arini', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3249-OVALINDO-YOGYAKARTA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(351, 'Business as usual (Regular)', 'TCA', '3252', 'GALAXY', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'Small', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plaza Marina', 'Plaza Marina Lt. 3  Blok H No. 546', NULL, 'Field', ' ', '85733441213', 'Ms. Indah', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3252-GALAXY-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(352, ' ', ' ', '3253', 'PARADISE TECH', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Malioboro Cellular Market (Eks. Sami Jaya)', ' ', 'Field', '8112800684', ' ', 'Mr.Sigit', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3253-PARADISE TECH-YOGYAKARTA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(353, ' ', ' ', '3254', 'ERSA PHONE', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM Audit Internal (Non Able)', 'Regular', 'Abadie.Prasetyo', 'YOGYAKARTA', ' ', 'Malioboro Cellular Market (Eks. Sami Jaya) Blok - D4', ' ', 'Field', '0274-7009 345', '85292708686', 'Ms. Indah', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3254-ERSA PHONE-YOGYAKARTA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(354, ' ', ' ', '3255', 'XCELLINDO', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Ramai Mall Lt. 1 ', ' ', 'Field', '0274-557047', '81578142006', 'Ms. Suci', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3255-XCELLINDO-YOGYAKARTA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(355, '2018 BAU', 'TCS', '3257', 'CAHAYA SELULAR', 'SEMARANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'Weblink', 'Non Visit - Weblink', 'Weblink', 'Regular', 'Ardha.Restamulia', 'SEMARANG', NULL, 'Plaza Simpang Lima Lt. Dasar B / 04', NULL, 'Field', '024 8453916', '08164249449', 'Mr. Juan Reno', 'Indomaret', '5', NULL, 'Toni Warsono', '', 'ID', '3257-CAHAYA SELULAR-SEMARANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(356, ' ', ' ', '3261', 'CLASSY PHONE', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Gedung Ex BDNI (Wisma HartoNo) Lt. 2 ', ' ', 'Field', '0274-554392', '81227656669', 'Mr. Kajidz', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3261-CLASSY PHONE-YOGYAKARTA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(357, '2018 BAU', 'TCS', '3263', 'SURYA MAS SELULER', 'SEMARANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', 'PRINT OUT (POS/PEMBUKUAN)', 'PRINT OUT', 'STREAM AUD INT', 'Rolling Sample', 'Ajie.Winarko', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. Dasar ( Phone Mareket )', NULL, 'Field', '024-8441324', '85727858872', 'Ms. Puji', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3263-SURYA MAS SELULER-SEMARANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(358, ' ', ' ', '3267', 'INDOTECH', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Samijaya Phone Market Jl. Malioboro No. 20', ' ', 'Field', '85300000000', '81901942477', 'Ms. Murti', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3267-INDOTECH-YOGYAKARTA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(359, '2018 BAU', 'TCS', '3268', 'QUALITY PHONE', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'ePOS', 'Non Visit - Email', 'ePOS - INDIRECT', 'Regular', 'Agung.Sunaryo', 'YOGYAKARTA', 'Jogjatronik (JKM)', 'Jogjatronik (JKM) LG Jl. Brigjen Katamso 75-77', NULL, 'Field', '0274 7848009', '081227771983', 'Ms. Isna', 'e-Indomaret', '5', NULL, 'Agung Sunaryo', '', 'ID', '3268-QUALITY PHONE-YOGYAKARTA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(360, '2018 BAU', 'TCS', '3269', 'BE SMART', 'YOGYAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Tulus.Handoko', 'YOGYAKARTA', NULL, 'Ambarukmo Phone Market, Ambarukmo Plaza Lt. LG PMA3 (Selatan Ayam goreng Hayam Wuruk), Jln. Adisucipto', NULL, 'Field', '0274 6611175', '089653262143', 'Mr. Dwi', 'e-Indomaret', '5', NULL, 'Agung Sunaryo', '', 'ID', '3269-BE SMART-YOGYAKARTA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(361, 'Business as usual (Regular)', 'TCA', '3271', 'BINTANG PUSAT ASESORIS', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Manyar 75', NULL, 'Field', ' ', '81332417753', 'Mr. Iwan', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3271-BINTANG PUSAT ASESORIS-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(362, 'Business as usual (Regular)', 'TCA', '3272', 'FRENZ', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Ngagel Rejo Kidul 32C', NULL, 'Field', ' ', '8316527276', 'Ms. Nia', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3272-FRENZ-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(363, 'Business as usual (Regular)', 'TCA', '3273', 'INDORAYA', 'SURABAYA, KOTA', 'Mobile Phone Specialists', 'MOBILE ACCESSSP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Manyar 93', NULL, 'Field', ' ', '89681576233', 'Mr. Reza', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3273-INDORAYA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(364, '2018 BAU', 'PHO', '3281', 'FANUEL CAMERA 2', 'SEMARANG, KOTA', 'Photo Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', 'GPOS', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Ardha.Restamulia', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. 5', NULL, 'Field', '024-7018302', '024-8452676', 'Mrs. Ika', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3281-FANUEL CAMERA 2-SEMARANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(365, '2018 BAU', 'PHO', '3283', 'FANUEL CAMERA 1', 'SEMARANG, KOTA', 'Photo Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', 'Nota (milik toko)', 'ON THE SPOT', 'STREAM AUD INT', 'Rolling Sample', 'Erwin.Prihatmoko', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. Dasar ( Depan Sadewa Food Court )', NULL, 'Field', '024-70183402', 'Lengkapi bila ada', 'Mr. Gunadi', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3283-FANUEL CAMERA 1-SEMARANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(366, '2018 BAU', 'PHO', '3285', 'DIGITAL CAMERA SHOP', 'SEMARANG, KOTA', 'Photo Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', 'Nota (milik toko)', 'ON THE SPOT', 'STREAM AUD INT', 'Rolling Sample', 'Erwin.Prihatmoko', 'SEMARANG', ' ', 'Citraland Mall Lt. 2 ( Depan Food Fair )', NULL, 'Field', 'Lengkapi bila ada', '85740021644', 'Ms. Suci', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3285-DIGITAL CAMERA SHOP-SEMARANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(367, '2018 BAU', 'PHO', '3286', 'TOP DIGITAL', 'SEMARANG, KOTA', 'Photo Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Eggy.Novianty', 'SEMARANG', ' ', 'Plaza Simpang 5 Lt. 5 No. 35 ( Depan Swalayan Matahari) Jl. Ahmad Yani No. 1', NULL, 'Field', '024-70448581', '024- 70183402', 'Ms. Rose / Ms. Eli', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3286-TOP DIGITAL-SEMARANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(368, '2018 BAU', 'PHO', '3287', 'MONIKA KAMERA', 'SEMARANG, KOTA', 'Photo Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Ardha.Restamulia', 'SEMARANG', NULL, 'Jl. Jendral Sudirman No. 163', NULL, 'Field', '024-70345763', 'No. Telp Wajib di isi', 'Ms. Srie', 'Indomaret', '5', NULL, 'Toni Warsono', '', 'ID', '3287-MONIKA KAMERA-SEMARANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(369, 'Business as usual (Regular)', 'IM', '3298', 'SINAR MURNI', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Lidah Wetan 24B', 'Danny.wijaya@yahoo.com', 'Field', '31-715788', '83861696767/8383597878', 'Mr. Dani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3298-SINAR MURNI-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(370, '2018 BAU', 'IM', '3301', 'TOMANG ELECTRONIC', 'JAKARTA BARAT, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Nurdya.Ningsih', 'JAKARTA', 'TANJUNG DUREN', 'Pasar Tomang Barat Lt. Dasar 14-15', NULL, 'Casual', '021-5667467', '08159110918', 'Mr. Iwan', 'OVO', '5', NULL, 'Sutrio', '', 'ID', '3301-TOMANG ELECTRONIC-JAKARTA BARAT, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(371, '2018 BAU', 'IM', '3306', 'SATELIT ELECTRONIC', 'JAKARTA PUSAT, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Dina.Khaira', 'JAKARTA', 'Sumur Batu', 'Pasar Sumur Batu / Jl. Sumur Batu Raya No. 26', NULL, 'Casual', '0214213558', '02197863796', 'Mr. Bong Kwet Bun/Mrs. Deni', 'Indomaret', '7.5', 'Yes', 'Sutrio', '', 'ID', '3306-SATELIT ELECTRONIC-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(372, '2018 BAU', 'IM', '3310', 'TOKO NUR', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Dwi.Mardiono', 'SURABAYA', NULL, 'Jl. Pagesangan 27', NULL, 'Field', '031-8291831', 'Lengkapi bila ada', 'Ms. Nuryanti Ningsih', 'KFC', '5', NULL, 'Hariyanto', '', 'ID', '3310-TOKO NUR-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(373, 'Business as usual (Regular)', 'IM', '3311', 'TOKO ANAM JAYA', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Pagesangan 137', NULL, 'Field', '31-8275837', ' ', 'Mrs. Mujiyati', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3311-TOKO ANAM JAYA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(374, 'Business as usual (Regular)', 'IM', '3312', 'TOKO BERKAT', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Menganti Karangan 35', NULL, 'Field', '31-71195668', ' ', 'Ms. Dina', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3312-TOKO BERKAT-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(375, '2018 BAU', 'IM', '3313', 'CAHAYA MAKMUR', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Gusti.Qodarsih', 'SURABAYA', NULL, 'Jl. Petemon Barat 184', NULL, 'Field', '031-5351289', '85648252048', 'Mrs. Indra Santoso', 'Indomaret', '7.5', 'Yes', 'Hariyanto', '', 'ID', '3313-CAHAYA MAKMUR-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(376, 'Business as usual (Regular)', 'IM', '3314', 'IMANUEL', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Menganti Gogor 7, Wiyung', NULL, 'Field', '31-767228', '31-725566', 'Mr. Arif', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3314-IMANUEL-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(377, '2018 BAU', 'IM', '3315', 'TOKO SAHABAT', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Whatsapp', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Gusti.Qodarsih', 'SURABAYA', NULL, 'Jl. Raya Dukuh Kupang Kav. 300 (Depan Carrefour)', NULL, 'Field', '031-5670396', '82139659266', 'Mr. Budhi Dharma P.', 'KFC', '6', NULL, 'Hariyanto', '', 'ID', '3315-TOKO SAHABAT-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(378, '2018 BAU', 'IM', '3316', 'TOKO SINAR JAYA', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Gusti.Qodarsih', 'SURABAYA', 'PGS', 'Pusat Grosir Surabaya Lt. 1 / I-6 No. I-3', NULL, 'Field', '031-52403601', '81803063588', 'Ms. Silia', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3316-TOKO SINAR JAYA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(379, 'Business as usual (Regular)', 'IM', '3318', 'TOKO TIGA SURYA', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Lidah Wetan 7', NULL, 'Field', '31-753399', ' ', 'Mr. Sugiono', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3318-TOKO TIGA SURYA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(380, 'Business as usual (Regular)', 'IM', '3320', 'SUMBER MULIA', 'GRESIK, KAB.', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'GRESIK', 'Jaksa Agung Suprapto', 'Jl. Jaksa Agung Suprapto 95', ' ', 'Field', '031-3984496', '031-70716171', 'Mrs. Lukman Hadikusuma', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3320-SUMBER MULIA-GRESIK, KAB.', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(381, '2018 BAU', 'IM', '3321', 'MURAH SADAR', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Fachrizal.Umar', 'SURABAYA', NULL, 'Jl. Rungkut Kidul 53A', NULL, 'Field', '031-8715329', '85843590956', 'Ms. Findi Fu\' Aidia', 'OVO', '7.5', 'Yes', 'Hariyanto', '', 'ID', '3321-MURAH SADAR-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(382, 'Business as usual (Regular)', 'IM', '3322', 'ARTA', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE ', ' ', ' ', ' ', ' ', NULL, 'SURABAYA', ' ', 'Jl. A. Yani (Frontage) 6', NULL, 'Field', '31-9913256', 'Lengkapi bila ada', 'Ms. Wiwit', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3322-ARTA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(383, 'Business as usual (Regular)', 'IM', '3325', 'MAPAN BAHAGIA', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Rungkut Mapan 6 Blok FA / 4', NULL, 'Field', '31-8711561', ' ', 'Mr. Alam Hartanto', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3325-MAPAN BAHAGIA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(384, '2018 BAU', 'IM', '3328', 'SAMUDERA', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Ayu.Multisari', 'SURABAYA', NULL, 'Jl. Darmahusada 28', NULL, 'Field', '031-5929879', '81330490251', 'Mrs. Siti', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3328-SAMUDERA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(385, 'Business as usual (Regular)', 'IM', '3329', 'TOKO SLAMET', 'GRESIK, KAB.', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'GRESIK', ' ', 'Jl. Saman Hudi 100', ' ', 'Field', '031-3981516', 'Lengkapi bila ada', 'Mrs. Lili', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3329-TOKO SLAMET-GRESIK, KAB.', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(386, '2020 Sample Enhancement', 'IM', '3330', 'RAMEDI', 'DEPOK, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'Sales Recap', 'Non Visit - WhatsApp', 'STREAM Other', 'Regular', 'Noviansyah.Noviansyah', 'BOTABEK', 'PASAR DEPOK JAYA', 'Jl. Nusantara Raya', NULL, 'Field', '021 7520668', 'No. Telp Wajib di isi', 'Mr. Edy / Mr. Adam', 'e-Indomaret', '10', NULL, 'Desnider Tambunan', '', 'ID', '3330-RAMEDI-DEPOK, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(387, '2018 BAU', 'IM', '3334', 'SUMBER REJEKI', 'MALANG, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Elfa.Ramandhita', 'MALANG', NULL, 'Jl. Ahmad Yani 19', NULL, 'Field', '0341 475598', '81334646888', 'Mrs. Eka', 'OVO', '3', NULL, 'Mestika Pradana', '', 'ID', '3334-SUMBER REJEKI-MALANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(388, '2018 BAU', 'IM', '3343', 'SARI TRISNO', 'SIDOARJO, KAB.', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Whatsapp', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Arif.Setiawan', 'SIDOARJO', NULL, 'Pasar Larangan Unit III / 39-40', NULL, 'Field', '031-8921675', 'Lengkapi bila ada', 'Mrs. Novi', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3343-SARI TRISNO-SIDOARJO, KAB.', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(389, '2018 BAU', 'IM', '3345', 'IRAMA ELEKTRONIK', 'BOGOR, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Farid.Akmal', 'BOTABEK', 'BOGOR TENGAH', 'Jl. Dewi Sartika No. 34 A', NULL, 'Field', '0251 8362587', '081398389447', 'Mr. Amin/Mr. Irwan', 'KFC', '5', NULL, 'Desnider Tambunan', '', 'ID', '3345-IRAMA ELEKTRONIK-BOGOR, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(390, '2018 BAU', 'IM', '3353', 'SINAR BARU', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Gpos', 'Non Visit - Gpos', 'GPOS', 'Regular', 'Ayu.Multisari', 'SURABAYA', NULL, 'Jl. Sidoyoso 1 No. 16 Surabaya', NULL, 'Field', '031-3713108', 'Lengkapi bila ada', 'Mr. Andy Sadikin', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3353-SINAR BARU-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(391, '2018 BAU', 'IM', '3354', 'NUSANTARA LISTRIK', 'SIDOARJO, KAB.', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - By Application (GPOS & Weblink)', 'Weblink', 'Regular', 'Arif.Setiawan', 'SIDOARJO', NULL, 'Jl. Gajah Mada 201', NULL, 'Field', '031-8961412', 'Lengkapi bila ada', 'Ms. Liana', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3354-NUSANTARA LISTRIK-SIDOARJO, KAB.', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(392, '2018 BAU', 'IM', '3355', 'MAJU MAPAN', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Whatsapp', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Fachrizal.Umar', 'SURABAYA', NULL, 'Jl. Rungkut Kidul 49A', NULL, 'Field', '031-8705480', 'Lengkapi bila ada', 'Mr. Andi', 'KFC', '5', NULL, 'Hariyanto', '', 'ID', '3355-MAJU MAPAN-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(393, '2018 BAU', 'IM', '3357', 'ANEKA II', 'JEMBER, KAB.', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Elok.Yuliana', 'JEMBER', NULL, 'Jl. Sultan Agung 100', NULL, 'Field', '0331 424096', '81234787999', 'Mr. Sudarto / Mr. Sinyo Budi', 'e-Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '3357-ANEKA II-JEMBER, KAB.', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(394, '2018 BAU', 'IM', '3362', 'SUMBER JAYA', 'JAKARTA SELATAN, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Hafila', 'JAKARTA', 'Kebayoran Baru', 'Pasar Kebayoran Lama Lt. 1', NULL, 'Casual', '021-7200873', '0812-8550-596', 'Mrs. Merry', 'Indomaret', '7.5', 'Yes', 'Sutrio', '', 'ID', '3362-SUMBER JAYA-JAKARTA SELATAN, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(395, '2018 BAU', 'IM', '3365', 'TERANG ABADI', 'TANGERANG, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Syaifullah.Bayu', 'BOTABEK', 'DEPAN TOMANG TOL', 'Depan Tomang Tol Jl. Raya Ciledug No. 3A', NULL, 'Casual', '021-99533972', '08128176488', 'Mr. Ket Djiu', 'e-Indomaret', '7.5', 'Yes', 'Desnider Tambunan', '', 'ID', '3365-TERANG ABADI-TANGERANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(396, 'Business as usual (Regular)', 'IM', '3367', 'MANINJAU JAYA', 'MALANG, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'MALANG', ' ', 'Ruko Maninjau A-28 Sawojajar', ' ', 'Field', ' ', '81232281719', 'Mr. Handi', 'None', '0', ' ', 'Mestika Pradana', '', 'ID', '3367-MANINJAU JAYA-MALANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(397, 'Business as usual (Regular)', 'IM', '3369', 'TARA', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Wiyung 32 (Dekat pasar Wiyung)', NULL, 'Field', '8173625979', ' ', 'Mrs. Irianingsih', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3369-TARA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(398, '2018 BAU', 'IM', '3371', 'CAHAYA MULYA', 'SURABAYA, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - By Application (GPOS & Weblink)', 'Weblink', 'Regular', 'Fachrizal.Umar', 'SURABAYA', NULL, 'Jl. Raya Nginden 23', NULL, 'Field', '031-5921216', 'Lengkapi bila ada', 'Mr. A. Budiono', 'KFC', '6', NULL, 'Hariyanto', '', 'ID', '3371-CAHAYA MULYA-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(399, 'New initiatives (NBD)', 'BAC', '3373', 'HAPPY BABY', 'SURABAYA, KOTA', 'Mother and Child Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Wiyung 36B', NULL, 'Field', '31-813489', 'Lengkapi bila ada', 'Ms. Lany', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3373-HAPPY BABY-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(400, 'Business as usual (Regular)', 'IM', '3374', 'HARCO', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Simo Tambaan 27', NULL, 'Field', '31-74942', ' ', 'Mr. Andi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3374-HARCO-SURABAYA, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(401, '2018 BAU', 'IM', '3375', 'ANEKA LISTRIK', 'MALANG, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Elfa.Ramandhita', 'MALANG', NULL, 'Jl. A. Sucipto 52', NULL, 'Field', '0341 486749', '081233919773', 'Mr. Yudhi', 'Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '3375-ANEKA LISTRIK-MALANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(402, 'Business as usual (Regular)', 'IM', '3376', 'CAHAYA SAKTI', 'MALANG, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'MALANG', ' ', 'Jl. Bendungan Sutami No. 16A', ' ', 'Field', '0341 565628', '0341 8108899', 'Mr. Charles / Mrs. Siska', 'None', '0', ' ', 'Mestika Pradana', '', 'ID', '3376-CAHAYA SAKTI-MALANG, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(403, '2018 BAU', 'SDA', '3387', 'SUMBER REZEKI', 'JAKARTA PUSAT, KOTA', 'Electrical Specialists', 'SDA SPECIALISTS', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'Weblink', 'Non Visit - Weblink', 'Weblink', 'Rolling Sample', 'Taufik.Aprialdo', 'JAKARTA', 'Kenari Mas', 'Kenari Mas Lower Ground Blok B117', 'K1 (K2 DIKIRIM KE K1)', 'Casual', '021-39845716', '021339507380', 'Mr. Gunawan / Mr. Handoko', 'Indomaret', '5', NULL, 'Sutrio', '', 'ID', '3387-SUMBER REZEKI-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:45', '2024-03-03 06:25:45'),
(404, '2018 BAU', 'SDA', '3390', 'EKA JAYA MANDIRI', 'TANGERANG, KOTA', 'Electrical Specialists', 'SDA SPECIALISTS', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - DIRECT', 'Rolling Sample', 'Ahmad.Rivai', 'BOTABEK', 'PASAR ANYAR', 'Jl. Kiasnawi No. 117', NULL, 'Field', '021 5586231', '0818173563', 'Mr. Suhendi', 'OVO', '10', NULL, 'Desnider Tambunan', '', 'ID', '3390-EKA JAYA MANDIRI-TANGERANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(405, 'Business as usual (Regular)', 'GLW', '3391', 'REJO AGUNG', 'MALANG, KOTA', 'Household Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'MALANG', ' ', 'Jl. Pasar Besar No. 137', ' ', 'Field', '0341 366397', '81333335333', 'Mr. Prabowo', 'None', '0', ' ', 'Mestika Pradana', '', 'ID', '3391-REJO AGUNG-MALANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(406, '2018 BAU', 'SDA', '3400', 'MAJU TERUS', 'JAKARTA PUSAT, KOTA', 'Electrical Specialists', 'SDA SPECIALISTS', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Whatsapp', 'Non Visit - Whatsapp', 'STREAM Other', 'Regular', 'Dina.Khaira', 'JAKARTA', 'Sumur Batu', 'Pasar Sumur Batu / Jl. Sumur Batu Raya (Sebelah Apotik)', NULL, 'Casual', '0214206980', '089638991745', 'Mr. Aliong/Mr. Joni', 'Indomaret', '7.5', 'Yes', 'Sutrio', '', 'ID', '3400-MAJU TERUS-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(407, '2018 BAU', 'SDA', '3401', 'ASIA HOME', 'DENPASAR, KOTA', 'Electrical Specialists', 'SDA SPECIALISTS', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Putu.Ariana', 'DENPASAR', NULL, 'Jl. Pamogan 175X', NULL, 'Field', '0361 7948101', '081703300884', 'Mr. Rio Steven', 'e-Indomaret', '10', NULL, 'Mestika Pradana', '', 'ID', '3401-ASIA HOME-DENPASAR, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(408, '2018 BAU', 'ITS', '3412', 'MULTI MANDIRI COMPUTER', 'LAMONGAN, KAB.', 'Computerhardware-Shops', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Ainur.Roziqin', 'LAMONGAN', NULL, 'Plasa Lamongan D / 06 Jl. K. H Hashim Ashari', NULL, 'Field', '0322-323787', '85746231818', 'Mr. Fadlun Effendi', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3412-MULTI MANDIRI COMPUTER-LAMONGAN, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(409, 'Business as usual (Regular)', 'IACC/IPPS', '3414', 'MAESTRO COMPUTER CENTER', 'JOMBANG, KAB.', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'JOMBANG', ' ', 'Jl. Hayam Wuruk 6A', ' ', 'Field', '0321-877180', '81553102031', 'Mr. Anwar', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3414-MAESTRO COMPUTER CENTER-JOMBANG, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(410, 'Business as usual (Regular)', 'IASS', '3416', 'MITRA DATA BUANA (MDB)', 'JOMBANG, KAB.', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'JOMBANG', ' ', 'Ruko Simpang Tiga Blok C - 12', ' ', 'Field', '0321-877222', '85853003654', 'Ms. Fitri', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3416-MITRA DATA BUANA (MDB)-JOMBANG, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(411, '2018 BAU', 'IACC', '3417', 'ONJ COMPUTER', 'MALANG, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'e-A/S', 'Non Visit - Email', 'TEMPLATE Indirect', 'Regular', 'Mestika.Pradana', 'MALANG', NULL, 'Jl. Galunggung 50F', 'odanjecomputer@gmail.com', 'Field', '0341 558615', '08123547709', 'Mr. Ony', 'e-Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '3417-ONJ COMPUTER-MALANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(412, 'Business as usual (Regular)', 'ITS', '3421', 'MULTI TECH', 'LAMONGAN, KAB.', 'Computerhardware-Shops', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'LAMONGAN', ' ', 'Jl. Veteran 60', ' ', 'Field', '0322-7712529', '0322-316920', 'Mr. A. Muzaky', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3421-MULTI TECH-LAMONGAN, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(413, '2018 BAU', 'IASS', '3422', 'TALENTA', 'MALANG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'e-A/S', 'Non Visit - Email', 'TEMPLATE Indirect', 'Regular', 'Mestika.Pradana', 'MALANG', NULL, 'Jl. Kendalsari 2 Ruko E - F', 'tarsisari@gmail.com', 'Field', '0341 400969', '88227000300', 'Mr. Tarsis', 'e-Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '3422-TALENTA-MALANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(414, '2018 BAU', 'IACC', '3426', 'BURSA KOMPUTER', 'MALANG, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'e-A/S', 'Non Visit - Whatsapp', 'TEMPLATE Indirect', 'Regular', 'Mestika.Pradana', 'MALANG', NULL, 'Jl. Sumbersari 285A', NULL, 'Field', '0341 557926', '83845996663', 'Mrs. Dyah', 'e-Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '3426-BURSA KOMPUTER-MALANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(415, '2018 BAU', 'PDA', '3432', 'SMART PHONE', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'PDA SPECIALISTS', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Ajie.Winarko', 'SEMARANG', ' ', 'Puri Anjasmoro Lt. 2B II / 15', NULL, 'Field', '024-7605050', '0818 05927070', 'Mr. Bayu  ', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3432-SMART PHONE-SEMARANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(416, '2018 BAU', 'GLW', '3439', 'ERWIN', 'JAKARTA PUSAT, KOTA', 'Household Specialists', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Eka.Sugiarti', 'JAKARTA', 'BENHILL', 'Pasar Benhil Lt. Dasar Blok BKS No. 75', NULL, 'Casual', 'Lengkapi bila ada', '081211764924', 'Mr. Cahyono', 'KFC', '5', NULL, 'Sutrio', '', 'ID', '3439-ERWIN-JAKARTA PUSAT, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(417, '2018 BAU', 'GLW', '3443', 'SEMI JAYA', 'MALANG, KOTA', 'Household Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'STREAM Other', 'Regular', 'Elfa.Ramandhita', 'MALANG', NULL, 'Pasar Besar Blok A No. 18-20', NULL, 'Field', '0341 326480', NULL, 'Mrs. Novi', 'Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '3443-SEMI JAYA-MALANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(418, '2018 BAU', 'GLW', '3448', 'KIKI', 'JAKARTA BARAT, KOTA', 'Household Specialists', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Nurdya.Ningsih', 'JAKARTA', 'TANJUNG DUREN', 'Jl. Tanjung Duren Raya No. 2A', NULL, 'Casual', '021-5685039', '081584046191', 'Mrs. Kiki', 'Indomaret', '5', NULL, 'Sutrio', '', 'ID', '3448-KIKI-JAKARTA BARAT, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(419, 'Business as usual (Regular)', 'GLW', '3454', 'KENDALI SODO', 'SURABAYA, KOTA', 'Household Specialists', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Pasar Tambak ReJO Blok H / 6', NULL, 'Field', '8123664771', ' ', 'Mrs. Saroh', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3454-KENDALI SODO-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(420, '2018 BAU', 'GLW', '3456', 'ITIK KURIH', 'SIDOARJO, KAB.', 'Household Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - By Application (GPOS & Weblink)', 'Weblink', 'Regular', 'Fachrizal.Umar', 'SURABAYA', NULL, 'Jl. LetJend. Suprapto 68B, Wadungasri - Waru', NULL, 'Field', '031-8667735', 'Lengkapi bila ada', 'Mr. Sa\'id', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3456-ITIK KURIH-SIDOARJO, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(421, '2018 BAU', 'GLW', '3457', 'ABADI JAYA', 'SURABAYA, KOTA', 'Household Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Mini Nota (By Store)', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Fachrizal.Umar', 'SURABAYA', NULL, 'Jl. Raya Rungkut Kidul Industri 45', 'Jl. Manggis VII / M-589 Perum Pondok Candra, Waru - SidoarJO', 'Field', 'Lengkapi bila ada', '82330960860', 'Mrs. Linda', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3457-ABADI JAYA-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(422, '2018 BAU', 'GLW', '3458', 'TIGA BINTANG TERANG', 'SURABAYA, KOTA', 'Household Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'Sales Recap', 'Non Visit - Whatsapp', 'TEMPLATE Indirect', 'Regular', 'Gusti.Qodarsih', 'SURABAYA', NULL, 'Pusat Grosir Surabaya Lt. 4 / E-10 No. 8-20', 'yayukdambudi@gmail.com', 'Field', '031-52405306', '081213735590', 'Ms. Yayuk', 'OVO', '5', NULL, 'Hariyanto', '', 'ID', '3458-TIGA BINTANG TERANG-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(423, '2018 BAU', 'GLW', '3459', 'NIAGA BARU', 'BOGOR, KOTA', 'Household Specialists', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Farid.Akmal', 'BOTABEK', 'BOGOR TENGAH', 'Jl. Dewi Sartika, Ruko Central Blok A No. 7', NULL, 'Field', '0251 8354106', 'No. Telp Wajib di isi', 'Mr. Chandra / Enko', 'Yogya', '7.5', 'Yes', 'Desnider Tambunan', '', 'ID', '3459-NIAGA BARU-BOGOR, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46');
INSERT INTO `shoplists` (`id`, `project`, `sh_type`, `gsnr`, `shop_name`, `city`, `channel_name`, `shop_type`, `assembled`, `a_clients`, `region`, `region2`, `organisat_type`, `shopsize1`, `sample_status`, `metode_konversi`, `penyampaian_ke_gfK`, `datadeliverytyp`, `schedule`, `data_collector`, `base_staff`, `area`, `street`, `delivery_address`, `courier`, `telephone`, `mobile_phone`, `contact_person`, `v_type`, `v_amount`, `kelipatan_25`, `spv`, `spv_id`, `country`, `nameofshop`, `created_at`, `updated_at`) VALUES
(424, '2018 BAU', 'GLW', '3461', 'SINAR JAYA 2', 'JEMBER, KAB.', 'Household Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Elok.Yuliana', 'JEMBER', NULL, 'Pasar Tanjung Lt. 1 Blok G No. 10', NULL, 'Field', '0331 489167/085101739463', '81332077605', 'Mr. Ahmad Said', 'e-Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '3461-SINAR JAYA 2-JEMBER, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(425, '2018 BAU', 'GLW', '3462', 'NIAGA BARU 2', 'BOGOR, KOTA', 'Household Specialists', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Farid.Akmal', 'BOTABEK', 'BOGOR TENGAH', 'Jl. Dewi Sartika, Ruko Central Blok C No. 5', NULL, 'Field', '0251 8354106', 'No. Telp Wajib di isi', 'Mr. Chandra / Enko', 'Yogya', '7.5', 'Yes', 'Desnider Tambunan', '', 'ID', '3462-NIAGA BARU 2-BOGOR, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(426, 'Business as usual (Regular)', 'IM', '3471', 'TOKO SAMUDERA TEKNIK', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Wisma lidah kulon Ruko 8 No 3F', NULL, 'Field', ' ', '81249391616', 'Mr. Gunalihani', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3471-TOKO SAMUDERA TEKNIK-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(427, 'Sample enhancement', 'MCG', '3491', 'ANEKA MOTOR', 'SURABAYA, KOTA', 'Motorcycle Garages', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE  ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'JL. MENGANTI BABATAN NO 12', NULL, NULL, ' ', '8123318762', 'MR. SUPENO', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3491-ANEKA MOTOR-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(428, 'Business as usual (Regular)', 'IM', '3510', 'TOKO SAKINAH', 'GRESIK, KAB.', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'GRESIK', 'Jaksa Agung Suprapto', 'Jl. Jaksa Agung Suprapto 56', ' ', 'Field', ' ', '8113377891', 'Mrs. Aisyah', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3510-TOKO SAKINAH-GRESIK, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(429, '2018 BAU', 'IM', '3512', 'KURNIA JAYA', 'SIDOARJO, KAB.', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Regular', 'Arif.Setiawan', 'SIDOARJO', NULL, 'Pasar Larangan AA / 05', NULL, 'Field', '031-91122049', '81999764859', 'Mr. Khoiri', 'e-Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3512-KURNIA JAYA-SIDOARJO, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(430, '2018 BAU', 'GES', '3525', 'SIGMA LIGHT', 'SURAKARTA, KOTA', 'Electrical Specialists', 'SDA SPECIALISTS', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', 'E-AS', 'E-AS', 'TEMPLATE Indirect', 'Regular', 'Herlia.Anindi', 'SURAKARTA', NULL, 'Jl. Honggowongso No. 14 ', NULL, 'Field', ' ', '83866582465', 'Ms. Mini', 'None', '0', 'Yes', 'Toni Warsono', '', 'ID', '3525-SIGMA LIGHT-SURAKARTA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(431, '2018 BAU', 'TCS', '3543', 'TRIO CELLULAR', 'PALEMBANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'SMALL', 'FAILURE', 'Sales Recap', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Rizka.Putra', 'PALEMBANG', 'MEGAHRIA', 'Basement Megahria Shopping Centre Jl. TP. Rustam Effendy', NULL, 'TIKI ONS', '0821-77959697', '82185000000', 'Ms. Titin', 'None', '0', ' ', 'Murbeng Lelana', '', 'ID', '3543-TRIO CELLULAR-PALEMBANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(432, '2018 BAU', 'IM', '3550', 'SINAR LISTRIK', 'GRESIK, KAB.', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - By Application (GPOS & Weblink)', 'Weblink', 'Regular', 'Wendy.Prasetyo', 'LAMONGAN', 'Usman sadar', 'Jl. Usman Sadar 171', 'rustianto69@yahoo.co.id', 'Field', '031-3981358', '81357799449', 'Mr. Rustianto BASTIAN', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3550-SINAR LISTRIK-GRESIK, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(433, 'Business as usual (Regular)', 'IM', '3563', 'ABADI LISTRIK', 'SURABAYA, KOTA', 'Ironmongers', NULL, ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Raya Kutisari 133', NULL, 'Field', ' ', '858786664', 'Mr. fauzi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3563-ABADI LISTRIK-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(434, '2018 BAU', 'GES', '3566', 'DAFFA ELEKTRONIK', 'KLATEN, KAB.', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Faridah.Ulfah', 'SURAKARTA', NULL, 'Jl. Ki Ageng Gribig, Karangwetan, Gergunung, Klaten Utara', NULL, 'TIKI ONS', '0812.2635.761', '8282511055', 'Mr. Maman', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3566-DAFFA ELEKTRONIK-KLATEN, KAB.', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(435, '2018 BAU', 'GES', '3571', 'IRAMA JAYA', 'SEMARANG, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Erwin.Prihatmoko', 'SEMARANG', ' ', 'Jl. Kanjengan Blok E / 4', NULL, 'Field', '024-3555690', '0813.9005.4697', 'Mr. Tiok ', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3571-IRAMA JAYA-SEMARANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(436, 'Business as usual (Regular)', 'IACC/IPPS', '3579', 'ACCESSORIES DOT COM', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Hi-Tech Mall Lt. 1E / 14-15', NULL, 'Field', '31-5471255', ' ', 'Mrs. Vivi', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3579-ACCESSORIES DOT COM-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(437, ' ', ' ', '3582', 'ACC KOMPUTER', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM OTHER', 'Regular', 'Fuad.Kurniawan', 'YOGYAKARTA', 'Jogjatronik (JKM)', 'Jogjatronik (JKM) Lt. 2 Jl. Brigjen Katamso 75-77', ' ', 'Field', '0274-420230 ( Hunting )', '895000000000', 'Ms. Devny', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3582-ACC KOMPUTER-YOGYAKARTA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(438, ' ', ' ', '3584', 'VENUS', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Ramai Centra Computer, Ramai Mall Lt. 2 Jl. A. Yani 73', ' ', 'Field', '81900000000', ' ', 'Ms. Kasih', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3584-VENUS-YOGYAKARTA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(439, '2018 BAU', 'IACC/IPPS', '3585', 'CLICK & CLICK', 'BANDUNG, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'ePOS', 'Non Visit - Email', 'ePOS - INDIRECT', 'Rolling Sample', 'Rully.Ibrahim', 'BANDUNG', 'Bandung Electronic Centre', 'Bandung Electronic Centre Lt. 2 Blok P No. 3', NULL, 'Field', 'Lengkapi bila ada', '081807938451', 'Mr. Sandi', 'OVO', '5', NULL, 'Novan Ergana', '', 'ID', '3585-CLICK & CLICK-BANDUNG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(440, '2018 BAU', 'IACC/IPPS', '3587', 'GENESIS', 'BANDUNG, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Rully.Ibrahim', 'BANDUNG', 'Bandung Electronic Centre', 'Bandung Electronic Centre Lt. 1 Blok Z No. 09-10', 'Bandung Electronic Centre Lt. LT.2 Blok P-3', 'Field', 'Lengkapi bila ada', '081807938451', 'Mr. Sandi', 'OVO', '5', NULL, 'Novan Ergana', '', 'ID', '3587-GENESIS-BANDUNG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(441, '2018 BAU', 'IACC/IPPS', '3588', 'SMART CD', 'BANDUNG, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Rully.Ibrahim', 'BANDUNG', 'Bandung Electronic Centre', 'Bandung Electronic Centre Lt. 1 Blok F No. 07', 'Bandung Electronic Centre Lt. LT.2 Blok P-3', 'Field', 'Lengkapi bila ada', '081807938451', 'Mr. Sandi', 'OVO', '5', NULL, 'Novan Ergana', '', 'ID', '3588-SMART CD-BANDUNG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(442, 'Business as usual (Regular)', 'IACC/IPPS', '3589', 'FAST N\' CHEAP DELTA', 'SURABAYA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Plaza Surabaya Lt. 2', NULL, 'Field', '31-5468526', ' ', 'Mr.Taufik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3589-FAST N\' CHEAP DELTA-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(443, 'Business as usual (Regular)', 'TCS', '3599', 'MGM CELLULAR', 'SURABAYA, KOTA', 'Mobile Phone Specialists', NULL, NULL, ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'FAILURE ', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', 'Plasa Marina', 'Plaza Marina Lt. 2H / 289', 'Saimy_sasuke85@yahoo.com', 'Field', '31-8475888 ext. 265', '878552999', 'Ms. Yuni', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3599-MGM CELLULAR-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(444, 'Business as usual (Regular)', 'VGS', '3623', 'GAME STATION', 'SURABAYA, KOTA', 'Home Entertainment Specialists', 'VIDEO_GAME_SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Surabaya Plaza Lt. 3 (depan Gunung Agung)', NULL, 'Field', '8573345777', ' ', 'Mrs. Ninik', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3623-GAME STATION-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(445, '2018 BAU', 'IM', '3649', 'CAHAYA ABADI', 'JAKARTA TIMUR, KOTA', 'Motorcycle Garages', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE NEW', 'GPOS', 'Non Visit - GPOS', 'GPOS', 'Rolling Sample', 'Sunardi.Sunardi', 'JAKARTA', 'JATINEGARA', 'Jl. Raya Mantraman No. 187A (Jatinegara)', NULL, 'Casual', '021-8566227', '087785099978', 'Mr. Cahyadi/Mr. Herman', 'None', '0', 'Yes', 'Sutrio', '', 'ID', '3649-CAHAYA ABADI-JAKARTA TIMUR, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(446, '2018 BAU', 'TCS', '3672', 'JATI INDAH', 'SEMARANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Fajar.Nihayat', 'SEMARANG', ' ', 'Plaza Simpang Lima I Lt. 2', NULL, 'Field', '024-70118344', '0838-838383700', 'Ms. Dian / Mr. Amrul', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3672-JATI INDAH-SEMARANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(447, '2018 BAU', 'TCS', '3673', 'MAJU JAYA', 'SEMARANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Muhrofi.Muhrofi', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. 2 Blok H No. 4', NULL, 'Field', '024-70170155', '0856.400.10168', 'Ms. Ineke', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3673-MAJU JAYA-SEMARANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(448, 'Business as usual (Regular)', 'TCS', '3674', 'GOLDEN TELESHOP', 'BATAM, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'SMALL', 'FAILURE', NULL, NULL, 'TEMPLATE INDIRECT', 'Rolling Sample', 'Siti.Wasiah', 'BATAM', NULL, 'Komp. Lucky Plaza Lt. Dasar Blok C No. 3-4', NULL, 'TIKI Reg', '0856 6809 4999', '0778- 452 750', 'Ms. Afhung', 'None', '0', NULL, 'Muhamad Asfaroini', '', 'ID', '3674-GOLDEN TELESHOP-BATAM, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(449, '2018 BAU', 'TCS', '3677', 'TWINS CELL', 'SUKABUMI, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE NEW', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Reza.Sukabumi', 'SUKABUMI', 'ROAD AREA', 'Jl. A. Yani No. 186', NULL, 'Field', '0266-211222', '085723674923', 'Mr. Cecep', 'None', '0', NULL, 'Triyana', '', 'ID', '3677-TWINS CELL-SUKABUMI, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(450, '2018 BAU', 'TCS', '3679', 'TIMUR CELL', 'SUKABUMI, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - Weblink', 'Weblink', 'Rolling Sample', 'Reza.Sukabumi', 'SUKABUMI', 'ROAD AREA', 'Jl. A. Yani No. 295', NULL, 'Field', '0266-7028234', '0853-1388-8999', 'Ms. Cici', 'e-Indomaret', '5', NULL, 'Triyana', '', 'ID', '3679-TIMUR CELL-SUKABUMI, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(451, NULL, NULL, '3680', 'PROCELL', 'CIREBON, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', NULL, NULL, 'STREAM AUD INT', 'Rolling Sample', 'Rika.Wijayanti', 'CIREBON', 'GRAGE', 'Grage Mall Lt. I2', NULL, 'Field', '0231-242532', '0858-60774888', 'Mr. Indra', 'None', '0', NULL, 'Sutrio', '', 'ID', '3680-PROCELL-CIREBON, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(452, NULL, NULL, '3696', 'MUSTIKA JAYA', 'CIREBON, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'WEST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', NULL, NULL, 'TEMPLATE INDIR', 'Rolling Sample', 'Rika.Wijayanti', 'CIREBON', 'GRAGE', 'Grage Mall Extension Lt. 2 Blok C No. 05', NULL, 'Field', '0231-222932', '0896-26262625', 'Mr. Iwan', 'None', '0', NULL, 'Sutrio', '', 'ID', '3696-MUSTIKA JAYA-CIREBON, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(453, '2018 BAU', 'IBRD', '3705', 'MITRA ABADI', 'BANDUNG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'NO', 'AXIOO', 'WEST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', 'e-A/S', 'Staff Visit - Manual', 'TEMPLATE Indirect', 'Regular', 'Rully.Ibrahim', 'BANDUNG', 'Bandung Electronic Centre', 'Bandung Electronic Centre Lt. 2 Blok G No. 6', NULL, 'Field', '022-4202247', '087799144236', 'Mr. Agi', 'None', '0', NULL, 'Novan Ergana', '', 'ID', '3705-MITRA ABADI-BANDUNG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(454, '2018 BAU', 'TCS', '3718', 'KRING CELL', 'MALANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'STREAM Other', 'Regular', 'Elfa.Ramandhita', 'MALANG', 'Malang Plaza', 'Malang Plaza Lt. 3', NULL, 'Field', 'Lengkapi bila ada', '81334886789', 'Mr. Andri', 'e-Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '3718-KRING CELL-MALANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(455, 'Business as usual (Regular)', 'TCS', '3757', 'FAZA CELLULAR (*)', 'PALEMBANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'SOUTH SUMATERA', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM PAPER', 'Regular', NULL, 'PALEMBANG', NULL, 'Ramayana Shopping Centre 4th Floor Jl. Radial No. 1', NULL, 'Field', '0816-384874', '0882-74039363', 'Mr. Sholihin / Ms. Dini', 'None', '0', ' ', 'Murbeng Lelana', '', 'ID', '3757-FAZA CELLULAR (*)-PALEMBANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(456, '2018 BAU', 'TCS', '3760', 'MEGA PONSEL KHATULISTIWA', 'PONTIANAK, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'KALIMANTAN', 'WEST KALIMANTAN', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Jeffri.Jefri', 'PONTIANAK', 'Plaza', 'Jl. Pangeran Diponegoro Komp Khatulistiwa Plaza No. 14-15 Lt. Dasar', 'Auditshet kirim ke Alamat RS', 'Field', '0561-765931', '082156025678', 'Ms. Santi/Mr. Vendi Chandra', 'OVO', '5', NULL, 'Murbeng lelana', '', 'ID', '3760-MEGA PONSEL KHATULISTIWA-PONTIANAK, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(457, '2018 BAU', 'TCS', '3761', 'SAHABAT  PONSEL KP', 'PONTIANAK, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'KALIMANTAN', 'WEST KALIMANTAN', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Jeffri.Jefri', 'PONTIANAK', 'Plaza', 'Jl. Pangeran Diponegoro Komp Khatulistiwa Plaza Lantai dasar No 75', 'Auditshet kirim ke Alamat RS', 'Field', 'Lengkapi bila ada', 'No. Telp Wajib di isi', 'Mr. Jicek', 'Indomaret', '5', NULL, 'Murbeng lelana', '', 'ID', '3761-SAHABAT  PONSEL KP-PONTIANAK, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(458, '2018 BAU', 'TCS', '3766', 'YOEDHI PHONE', 'SEMARANG, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Priyo.Handoko', 'SEMARANG', ' ', 'Plaza Simpang 5 Lt. 2 B22A Jl. Ahmad Yani No. 1', NULL, 'Field', '024-33162116', '85640110940', 'Mr. Didik Prasetyo', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3766-YOEDHI PHONE-SEMARANG, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(459, 'Business as usual (Regular)', 'VGS', '3767', 'GAME SQUARE', 'SURABAYA, KOTA', 'Home Entertainment Specialists', 'VIDEO_GAME_SP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Tunjungan Plaza I Lt. LG 22(Dekat ATM Center)', NULL, 'Field', '31-5317857', ' ', 'Mrs. Diah', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3767-GAME SQUARE-SURABAYA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(460, ' ', ' ', '3793', 'GENIUS SHOP', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', NULL, 'YOGYAKARTA', ' ', 'Ramai Centra Computer, Ramai Mall Lt. 2 Jl. A. Yani 73', ' ', 'Field', '0274-6543334', ' ', 'Mr. Abidin', 'None', '0', ' ', 'Agung Sunaryo', '', 'ID', '3793-GENIUS SHOP-YOGYAKARTA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(461, '2018 BAU', 'IASS', '3794', 'DEMANK COM', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Agung.Sunaryo', 'YOGYAKARTA', 'Jogjatronik (JKM)', 'Jogjatronik (JKM) Lt. 2 Jl. Brigjen Katamso 75-77', NULL, 'Field', 'Lengkapi bila ada', '088232033303', 'Mr. Pur', 'e-Indomaret', '5', NULL, 'Agung Sunaryo', '', 'ID', '3794-DEMANK COM-YOGYAKARTA, KOTA', '2024-03-03 06:25:46', '2024-03-03 06:25:46'),
(462, '2018 BAU', 'TCS', '3808', '77 PHONE', 'SAMARINDA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'KALIMANTAN', 'EAST KALIMANTAN', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'A/S Generic', 'Non Visit - Email', 'ePOS - INDIRECT', 'Regular', 'Dedy.Marhadi', 'SAMARINDA', NULL, 'Malll Mesra Lt. 4', NULL, 'TIKI Reg', '0852 51453539', '0852 51453539', 'Ms. Fatimah', 'e-Indomaret', '5', NULL, 'Mahfud', '', 'ID', '3808-77 PHONE-SAMARINDA, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(463, '2018 BAU', 'TCS', '3810', 'YAN\'S CELLULAR', 'SURAKARTA, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Herlia.Anindi', 'SURAKARTA', NULL, 'Singosaren Plaza Lt. Dasar Blok F [PERLU KIRIM AMPLOP]', NULL, 'TIKI ONS', '0271-8005569', NULL, 'Ms. Yani', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3810-YAN\'S CELLULAR-SURAKARTA, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(464, '2018 BAU', 'PHO', '3843', 'FOTO AURORA', 'SURABAYA, KOTA', 'Photo Specialists', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Generic', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Luxman.Sanjaya', 'SIDOARJO', NULL, 'Jl. Tanjung Anom I / 16', NULL, 'Field', '031-5350515', '85100098300', 'Ms. Risma/ Ms. Narti', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3843-FOTO AURORA-SURABAYA, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(465, '2018 BAU', 'IM', '3845', 'RATNA JAYA', 'MOJOKERTO, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Sales Recap', 'Non Visit - Whatsapp', 'TEMPLATE Indirect', 'Regular', 'Mohammad.Rony', 'JOMBANG', NULL, 'Jl. Mojopahit Pasar Kliwon Ruko 5', NULL, 'Field', '0321-381506', '81515774042', 'Ms. Lily', 'OVO', '5', NULL, 'Hariyanto', '', 'ID', '3845-RATNA JAYA-MOJOKERTO, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(466, '2018 BAU', 'WGS', '3848', 'SINAR ELEKTRO (*)', 'JAKARTA BARAT, KOTA', 'Motorcycle Garages', 'WHITE GOODS SP.', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE NEW', 'A/S Whatsapp', 'Staff Visit - Manual', 'STREAM Other', 'Regular', 'Raihan.Alif', 'JAKARTA', 'Glodok', 'Komp. Ruko Glodok Plaza Blok B No. 20 ', NULL, 'Field', 'Lengkapi bila ada', '081574360048', 'Mr. Adang', 'None', '0', NULL, 'Sutrio', '', 'ID', '3848-SINAR ELEKTRO (*)-JAKARTA BARAT, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(467, '2018 BAU', 'PHO', '3849', 'FOCUS', 'SEMARANG, KOTA', 'Photo Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'ePOS', 'Non Visit - Email', 'ePOS - INDIRECT', 'Regular', 'Ajie.Winarko', 'SEMARANG', NULL, 'Plaza Simpang 5 Lt. 5 No. 26 Jl. Ahmad Yani No. 1', NULL, 'Field', '089643375757', 'No. Telp Wajib di isi', 'Ms. Anas', 'Indomaret', '5', NULL, 'Toni Warsono', '', 'ID', '3849-FOCUS-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(468, '2018 BAU', 'CBS', '3851', 'CAHAYA ELECTRONICS', 'JAKARTA BARAT, KOTA', 'Electrical Specialists', 'MIX CE/PHOTO', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - Weblink', 'Weblink', 'Rolling Sample', 'Parlin.Hutagalung', 'JAKARTA', 'Glodok', 'Jembatan Milenium Blok E No. 2-4', NULL, 'Casual', '021-6309545 / 6269834', '0822 2609 4870 ', 'Mrs. Leny', 'Indomaret', '7.5', 'Yes', 'Sutrio', '', 'ID', '3851-CAHAYA ELECTRONICS-JAKARTA BARAT, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(469, '2018 BAU', 'CBS', '3853', 'MEGA ELECTRONIC', 'JAKARTA BARAT, KOTA', 'Electrical Specialists', 'MIX CE/PHOTO', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - Weblink', 'Weblink', 'Rolling Sample', 'Parlin.Hutagalung', 'JAKARTA', 'Glodok', 'Orion Plaza Lt. Dasar Blok G No. 6A', 'N3', 'Casual', 'Lengkapi bila ada', '081234804157', 'Ms. Bila', 'Indomaret', '7.5', 'Yes', 'Sutrio', '', 'ID', '3853-MEGA ELECTRONIC-JAKARTA BARAT, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(470, '2018 BAU', 'CBS', '3855', 'MEGA DIGITAL', 'JAKARTA BARAT, KOTA', 'Electrical Specialists', 'MIX CE/PHOTO', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'Weblink', 'Non Visit - Weblink', 'Weblink', 'Rolling Sample', 'Parlin.Hutagalung', 'JAKARTA', 'Glodok', 'Orion Plaza Lt. Dasar Blok G No. 5B', NULL, 'Casual', '021-6290033', '0812 8169 0888', 'Ms. Lusiana', 'Indomaret', '7.5', 'Yes', 'Sutrio', '', 'ID', '3855-MEGA DIGITAL-JAKARTA BARAT, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(471, '2018 BAU', 'GES', '3863', 'SEMERU 4', 'SURAKARTA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'XLARGE', 'ACTIVE', 'ePOS', 'Non Visit - Email', 'ePOS - INDIRECT', 'Regular', 'Toni.Warsono', 'SURAKARTA', NULL, 'Jl. Kalilarangan No. 88 ', '1685', 'Field', '08112639366', 'Lengkapi bila ada', 'Mr. Agus', 'OVO', '45', NULL, 'Toni Warsono', '', 'ID', '3863-SEMERU 4-SURAKARTA, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(472, 'Business as usual (Regular)', 'GES', '3867', 'SUMBER REJEKI', 'SIDOARJO, KAB.', 'Electrical Specialists', 'GEN ELEC SHOP', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SIDOARJO', ' ', 'Jl. Wonocolo Sepanjang 32', ' ', 'Field', '031-70832559', ' \'0318941893', 'Mr. Saiful', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3867-SUMBER REJEKI-SIDOARJO, KAB.', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(473, 'Business as usual (Regular)', 'GES', '3868', 'MIAMI', 'SURABAYA, KOTA', 'Electrical Specialists', 'GEN ELEC SHOP', ' ', ' ', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', ' ', 'Regular', NULL, 'SURABAYA', ' ', 'Jl. Kertajaya 23', NULL, 'Field', '31-53215', '81331719888', 'Mr. William', 'None', ' ', ' ', 'Hariyanto', '', 'ID', '3868-MIAMI-SURABAYA, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(474, '2018 BAU', 'IACC/IPPS', '3880', 'RPM', 'YOGYAKARTA, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Agung.Sunaryo', 'YOGYAKARTA', 'Jogjatronik (JKM)', 'Jogjatronik Lt. 2 Jl. BrigJend. Katamso 75 - 77 ', NULL, 'Field', 'Lengkapi bila ada', '085643210788', 'Mr. Agus', 'e-Indomaret', '5', NULL, 'Agung Sunaryo', '', 'ID', '3880-RPM-YOGYAKARTA, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(475, '2018 BAU', 'ITS', '3883', 'OSCAR COMP 2', 'SEMARANG, KOTA', 'Computerhardware-Shops', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Ria.Melani', 'SEMARANG', ' ', 'DP Mall Lt. 2 No. 8', NULL, 'Field', '024-86578041', NULL, 'Mr. Daniel', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3883-OSCAR COMP 2-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(476, '2018 BAU', 'INBS', '3884', 'DS KOMPUTER', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', 'GPOS', 'Non Visit - Whatsapp', 'STREAM Other', 'Regular', 'Ajie.Winarko', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. 5 No. 25', NULL, 'Field', '85647918698', 'Lengkapi bila ada', 'Wahyu', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3884-DS KOMPUTER-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(477, '2018 BAU', 'ITS', '3885', 'YES COM 1', 'SEMARANG, KOTA', 'Computerhardware-Shops', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', 'ePOS', 'Non Visit - email', 'ePOS - INDIRECT', 'Regular', 'Ardha.Restamulia', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. 5 No 43', NULL, 'Field', '024-70704701', '0856-40640100', 'Mr. Chandra / Mr. Daniel', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3885-YES COM 1-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(478, '2018 BAU', 'IACC/IPPS', '3886', 'NICHOLAS D COMPUTER', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'PC PER/ACC SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'ePOS', 'Non Visit - Email', 'ePOS - INDIRECT', 'Regular', 'Ajie.Winarko', 'SEMARANG', NULL, 'Plaza Simpang Lima Lt. Dasar B04F', NULL, 'Field', '085868945887', 'Lengkapi bila ada', 'Yani', 'e-Indomaret', '5', NULL, 'Toni Warsono', '', 'ID', '3886-NICHOLAS D COMPUTER-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(479, ' ', ' ', '3902', 'GUDANG KOMPUTER', 'MEDAN, KOTA', 'Motorcycle Garages', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', '#N/A', 'Regular', NULL, 'MEDAN', ' ', 'Jl. Putri Merak Jingga No. 178', NULL, 'Field', '061-4510236', '85100596183', 'Mr. Efendi', 'None', '0', ' ', 'Dedi Masriyal', '', 'ID', '3902-GUDANG KOMPUTER-MEDAN, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(480, '2018 BAU', 'INBS', '3912', 'MSI COMPUTER', 'MAKASSAR, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', NULL, '0', 'SULAWESI', 'SOUTH SULAWESI', 'INDEPENDENTS', 'XLARGE', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Husnul Khatimah', 'MAKASSAR', NULL, 'MTC Karebosi Lt. 2 Blok P No. 8-9', NULL, NULL, '0411-350149', '081341718665', 'Ms. H. Dija', 'Indomaret', '7.5', 'Yes', 'Nurdiansyah', '', 'ID', '3912-MSI COMPUTER-MAKASSAR, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(481, ' ', ' ', '3916', 'NEXT COM', 'MEDAN, KOTA', 'Motorcycle Garages', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', '#N/A', 'Regular', NULL, 'MEDAN', ' ', 'Jl. Bambu II No. 75AA', 'next_computer7@yahoo.com', 'Field', '061-6621335', '81231115677', 'Ms. Aini', 'None', '0', ' ', 'Dedi Masriyal', '', 'ID', '3916-NEXT COM-MEDAN, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(482, '2018 BAU', 'INBS', '3922', 'XION', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Sigit.Kristiyanto', 'SEMARANG', ' ', 'SCC Plaza Simpang Lima Lt. 5 No. 45', NULL, 'Field', '024-70309038', NULL, 'Ms.Fitri', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3922-XION-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(483, '2018 BAU', 'IASS', '3923', 'HG COMPUTER', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Ajie.Winarko', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. 5', NULL, 'Field', '024-91061637', '0898-5555921', 'Ms. Monica', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3923-HG COMPUTER-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(484, '2018 BAU', 'INBS', '3924', 'BAROKAH.COM', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Erwin.Prihatmoko', 'SEMARANG', NULL, 'Plaza Simpang Lima Lt. 5/34', NULL, 'Field', '024-8456384', '085-740101271', 'Mr. Puguh', 'Indomaret', '5', NULL, 'Toni Warsono', '', 'ID', '3924-BAROKAH.COM-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(485, '2018 BAU', 'GLW', '3925', 'SUMBER MAJU JAYA', 'JAKARTA TIMUR, KOTA', 'Household Specialists', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Sunardi.Sunardi', 'JAKARTA', 'JATINEGARA', 'Pasar Jatinegara (Depan Bank Niaga)', NULL, 'Casual', '021-85904645/85904635', '087878671778', 'Mr. Tito', 'Indomaret', '5', NULL, 'Sutrio', '', 'ID', '3925-SUMBER MAJU JAYA-JAKARTA TIMUR, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(486, '2018 BAU', 'AIR', '3957', 'EDISON ELECTRONIC', 'SURABAYA, KOTA', 'Air-Treatment Installers', 'AIRCOND SPEC', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'LARGE', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Luxman.Sanjaya', 'SIDOARJO', NULL, 'Jl. Tunjungan 57B', 'tokoedison57@gmail.com', 'Field', '085733581824', '82140677758', 'Mr. Yanto', 'Indomaret', '5', NULL, 'Hariyanto', '', 'ID', '3957-EDISON ELECTRONIC-SURABAYA, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(487, '2018 BAU', 'IASS', '3991', 'STARCOM', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Ardha.Restamulia', 'SEMARANG', ' ', 'Jl. Kaligarang No. 14', NULL, 'Field', '024-70223288', '0856-41412276', 'Mr. Arie Prasetyo', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3991-STARCOM-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(488, '2018 BAU', 'ITS', '3998', 'BHINNEKA COMPUTER 2 (*)', 'SEMARANG, KOTA', 'Computerhardware-Shops', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Regular', 'Ajie.Winarko', 'SEMARANG', NULL, 'Jl. Kelud Raya No. 15 D', NULL, 'Field', '024-70770015', '08156569771', 'Ms. Ike', 'e-Indomaret', '5', NULL, 'Toni Warsono', '', 'ID', '3998-BHINNEKA COMPUTER 2 (*)-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(489, '2018 BAU', 'IASS', '3999', 'INDO MANDIRI COMPUTER (*)', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Catur.Nugroho', 'SEMARANG', ' ', 'Plaza Simpang Lima Lt. 5 No. 9', NULL, 'Field', '0852-90318329', NULL, 'Mr. Syahid', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '3999-INDO MANDIRI COMPUTER (*)-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(490, '2018 BAU', 'IASS', '4001', 'CV NAVIRI', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'LARGE', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Chandrika.Kusuma', 'SEMARANG', ' ', 'Jl. Ngesrep Timur V No. 212', NULL, 'Field', '024-7498150', '0878-38793937', 'Ms. Eva', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '4001-CV NAVIRI-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(491, '2018 BAU', 'IASS', '4004', 'DYNASTI', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'PC SPECIALISTS', 'YES', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Chandrika.Kusuma', 'SEMARANG', ' ', 'Jl. Sirojudin 23 A Tembalang', NULL, 'Field', '024-7471450', NULL, 'Mr. Indra Sonjaya', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '4004-DYNASTI-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(492, '2018 BAU', 'INBS', '4006', 'WANTUTRI', 'SEMARANG, KOTA', 'Computerhardware-Shops', 'NOTEBOOK SPEC', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Eggy.Novianty', 'SEMARANG', ' ', 'Plasa Simpang Lima Lt. 5 No. 65 (SCC 3)', NULL, 'Field', '< untuk dilengkapi >', '0856-2654807', 'Mr. Winarno', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '4006-WANTUTRI-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(493, 'Business as usual (Regular)', 'TCS', '4014', 'WINNER COM', 'BATAM, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Staff Visit - Manual', 'TEMPLATE Indirect', 'Rolling Sample', 'Hafiz.Prasetyo', 'BATAM', 'SP Plaza', 'SP Plaza I lantai dasar, Batu Aji', NULL, 'TIKI Reg', 'Lengkapi bila ada', '089620187786', 'Mrs. Novi', 'Indomaret', '5', NULL, 'Muhamad Asfaroini', '', 'ID', '4014-WINNER COM-BATAM, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(494, '2018 BAU', 'IM', '4036', 'REMAJA ELEKTRONIK', 'MALANG, KOTA', 'Ironmongers', '0', '0', '0', 'EAST JAVA', '0', 'INDEPENDENTS', 'MEDIUM', 'ACTIVE', 'GPOS', 'Non Visit - By Application (GPOS & Weblink)', 'GPOS', 'Regular', 'Elfa.Ramandhita', 'MALANG', NULL, 'Ruko Danau Toba Blok C No. 24', NULL, 'Field', '0341 722594', '82140142728', 'Mr. Iwan', 'e-Indomaret', '5', NULL, 'Mestika Pradana', '', 'ID', '4036-REMAJA ELEKTRONIK-MALANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(495, 'Business as usual (Regular)', 'TCS', '4068', 'GALAXY (ULTRA PONSEL)', 'BATAM, KOTA', 'Mobile Phone Specialists', '0', '0', '0', 'SUMATERA', 'NORTH SUMATERA', 'INDEPENDENTS', 'XLARGE', 'ACTIVE', 'E-A/S', 'Staff Visit - USB FlashDisk', 'TEMPLATE Indirect', 'Rolling Sample', 'Hafiz.Prasetyo', 'BATAM', 'Panbil Mall', 'Panbil Mall Lt. Dsr No. 3 Muka Kuning', NULL, 'TIKI Reg', '085264105623', '085245270887', 'Ms. Lili Yanti/fengky', 'OVO', '5', NULL, 'Muhamad Asfaroini', '', 'ID', '4068-GALAXY (ULTRA PONSEL)-BATAM, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(496, '2018 BAU', 'PHO', '4104', 'MONIKA DIGITAL', 'SEMARANG, KOTA', 'Photo Specialists', '0', '0', '0', 'CENTRAL JAVA', '0', 'INDEPENDENTS', 'SMALL', 'FAILURE', ' ', ' ', 'STREAM AUD INT', 'Regular', 'Erwin.Prihatmoko', 'SEMARANG', ' ', 'DP Mall Lt. Dasar J8/6', NULL, 'Field', '024-86578014', '81904414972', 'Ms. Sri', 'None', '0', ' ', 'Toni Warsono', '', 'ID', '4104-MONIKA DIGITAL-SEMARANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(497, '2018 BAU', 'IM', '4105', 'SINAR MULIA (TOMANG)', 'TANGERANG, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Syaifullah.Bayu', 'BOTABEK', 'DEPAN TOMANG TOL', 'Depan Tomang Tol (Jl. Raya Ciledug) No. 4C', NULL, 'Casual', '08971437988', '081315400634', 'Ms. Amoi', 'Indomaret', '7.5', NULL, 'Desnider Tambunan', '', 'ID', '4105-SINAR MULIA (TOMANG)-TANGERANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(498, '2018 BAU', 'IM', '4106', 'DUNIA TERANG', 'TANGERANG, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'A/S Specific', 'Staff Visit - Manual', 'STREAM PAPER', 'Rolling Sample', 'Syaifullah.Bayu', 'BOTABEK', 'DEPAN TOMANG TOL', 'Depan Tomang Tol (Jl. Raya Ciledug)', NULL, 'Field', '089687435485', '081384501127', 'Mr. Rudiyanto', 'e-Indomaret', '5', NULL, 'Desnider Tambunan', '', 'ID', '4106-DUNIA TERANG-TANGERANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47'),
(499, '2018 BAU', 'IM', '4107', 'CAHAYA MULIA', 'TANGERANG, KOTA', 'Ironmongers', '0', '0', '0', 'JABOTABEK', '0', 'INDEPENDENTS', 'SMALL', 'ACTIVE', 'GPOS', 'Non Visit - GPOS', 'GPos - DIRECT CDI', 'Rolling Sample', 'Syaifullah.Bayu', 'BOTABEK', 'DEPAN TOMANG TOL', 'Depan Tomang Tol (Jl. Raya Ciledug)', NULL, 'Field', 'Lengkapi bila ada', '081382091189', 'Ms. Achiang', 'e-Indomaret', '7.5', 'Yes', 'Desnider Tambunan', '', 'ID', '4107-CAHAYA MULIA-TANGERANG, KOTA', '2024-03-03 06:25:47', '2024-03-03 06:25:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userdetails`
--

CREATE TABLE `userdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_card_number` varchar(255) NOT NULL,
  `id_card_file` varchar(255) NOT NULL,
  `tax_card_number` varchar(255) NOT NULL,
  `tax_card_file` varchar(255) NOT NULL,
  `bank_full_name` varchar(255) DEFAULT NULL,
  `bank_code` varchar(255) DEFAULT NULL,
  `bank_account_number` varchar(255) DEFAULT NULL,
  `bank_book` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `family_card` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `userdetails`
--

INSERT INTO `userdetails` (`id`, `id_user`, `id_card_number`, `id_card_file`, `tax_card_number`, `tax_card_file`, `bank_full_name`, `bank_code`, `bank_account_number`, `bank_book`, `marital_status`, `family_card`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, '3174090708990008', '65d4deb15af8c.jpg', '3174090708990008', '65d4deb15b548.jpg', 'Muhammad Agung Putra Nugroho', '317409070899', '3174090708990008', '65d4deb15babb.jpg', 'not_married', '65d4deb15c001.jpg', 'depok', '2024-02-20 10:17:37', '2024-02-20 10:17:37'),
(2, 2, '3174090708990008', '65d6b483cf7f4.jpg', '3174090708990008', '65d6b483cffc8.jpg', 'Muhammad Agung Putra Nugroho', '317409070899', '3174090708990008', '65d6b483d05dc.jpg', 'not_married', '65d6b483d0b85.jpg', 'Depok', '2024-02-21 19:42:11', '2024-02-21 19:42:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(2) NOT NULL,
  `status` enum('adm','spv','col','sup') DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `emp_id` varchar(10) DEFAULT NULL,
  `spv_id` varchar(10) DEFAULT NULL,
  `admin_approval` timestamp NULL DEFAULT NULL,
  `image_profile` text DEFAULT NULL,
  `register_1` timestamp NULL DEFAULT NULL,
  `register_2` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `country`, `status`, `email`, `username`, `email_verified_at`, `password`, `phone`, `emp_id`, `spv_id`, `admin_approval`, `image_profile`, `register_1`, `register_2`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Agung Putra', 'ID', 'adm', 'sangmoduser@gmail.com', 'agung.putra', '2024-02-20 01:55:04', '$2y$10$wdK.fgqua01Nni2QVIm02O0UWW3pu/4SfNQqvEdFQzRMyTfS.fPri', '083872790091', NULL, '2', '2024-02-21 19:47:25', '65d1b4bd3a5f8.jpg', '2024-02-20 01:42:03', '2024-02-20 10:17:37', NULL, NULL, NULL, '2024-02-20 01:42:03', '2024-02-21 19:47:25'),
(2, 'Muhammad Agung', 'ID', 'spv', 'muhammadagung0708@gmail.com', 'muhammad1.agung', '2024-02-21 19:40:52', '$2y$10$JQn4HOLBuPcwSDTvLH4vRO06GGcL58tiaUYXG5W/VnV.YejXXrmgS', '083872790091', NULL, NULL, '2024-02-21 19:44:40', NULL, '2024-02-21 19:39:33', '2024-02-21 19:42:12', NULL, NULL, NULL, '2024-02-21 19:39:33', '2024-02-21 19:44:40'),
(11, 'Muhammad Agung', 'ID', 'col', 'itksppsbam@gmail.com', 'muhammad.agung', '2024-03-03 04:17:54', '$2y$10$JQn4HOLBuPcwSDTvLH4vRO06GGcL58tiaUYXG5W/VnV.YejXXrmgS', NULL, NULL, NULL, '2024-03-11 01:39:51', NULL, '2024-03-03 03:16:14', '2024-03-11 01:39:58', NULL, NULL, NULL, '2024-03-03 03:16:14', '2024-03-03 04:17:54');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `adhocprojectdetails`
--
ALTER TABLE `adhocprojectdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `adhocprojects`
--
ALTER TABLE `adhocprojects`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `panelrecruits`
--
ALTER TABLE `panelrecruits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `panelservicings`
--
ALTER TABLE `panelservicings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `periodeshoplists`
--
ALTER TABLE `periodeshoplists`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `projectdetails`
--
ALTER TABLE `projectdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shoplists`
--
ALTER TABLE `shoplists`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `adhocprojectdetails`
--
ALTER TABLE `adhocprojectdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `adhocprojects`
--
ALTER TABLE `adhocprojects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT untuk tabel `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `panelrecruits`
--
ALTER TABLE `panelrecruits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `panelservicings`
--
ALTER TABLE `panelservicings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `periodeshoplists`
--
ALTER TABLE `periodeshoplists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT untuk tabel `projectdetails`
--
ALTER TABLE `projectdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `shoplists`
--
ALTER TABLE `shoplists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT untuk tabel `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
