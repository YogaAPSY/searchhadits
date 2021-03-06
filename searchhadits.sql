-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2019 at 01:19 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `searchhadits`
--

-- --------------------------------------------------------

--
-- Table structure for table `hadits`
--

CREATE TABLE `hadits` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_hadits` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `index` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hadits_translate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hadits`
--

INSERT INTO `hadits` (`id`, `nama_hadits`, `index`, `hadits_translate`, `created_at`, `updated_at`) VALUES
(1, 'Malik No 740', 'idul fitri', 'Telah menceritakan kepadaku dari Malik dari [Muhammad bin Yahya bin Habban] dari [Al A\'raj] dari [Abu Hurairah] berkata, \"Rasulullah shallallahu \'alaihi wasallam melarang puasa pada dua Hari Raya, Idul Fitri dan Idul Adha.\"', '2019-03-26 21:14:20', '2019-03-26 21:14:20'),
(2, 'Malik No 589', 'idul fitri', 'Telah menceritakan kepadaku Yahya dari Malik dari [Muhammad bin Yahya bin Habban] dari [Al A\'raj] dari [Abu Hurairah], bahwa Rasulullah shallallahu \'alaihi wasallam melarang berpuasa pada dua hari raya, Idul Fitri dan Idul Adlha', '2019-03-26 21:14:44', '2019-03-26 21:14:44'),
(3, 'Bukhari No 904', 'idul fitri', 'Telah menceritakan kepada kami [Ibrahim bin Al Mundzir] berkata, telah menceritakan kepada kami [Anas bin \'Iyadl] dari [\'Ubaidullah] dari [Nafi\'] dari [\'Abdullah bin \'Umar] bahwa Rasulullah shallallahu \'alaihi wasallam melaksanakan shalat \'Idul Adlha dan \'Idul Fitri kemudian berkhutbah setelah shalat.\"', '2019-03-26 21:15:19', '2019-03-26 21:15:19'),
(4, 'Malik No 388', 'idul fitri', 'Telah menceritakan kepadaku dari Malik dari [Ibnu Syihab] dari [Sa\'id bin Musayyab] Bahwasanya ia mengabarkan kepadanya, Bahwa orang-orang diperintahkan makan pagi di hari raya Idul Fitri sebelum pergi ke tempat shalat.\" Malik berkata; \"Saya tidak mendapatkan pendapat bahwa orang-orang di periintahkan untuk makan pada hari Idul Adlha.\"', '2019-03-26 21:15:37', '2019-03-26 21:15:37'),
(5, 'Malik No 385', 'idul fitri', 'Telah menceritakan kepadaku Yahya dari Malik dari [Ibnu Syihab], bahwa Rasulullah shallallahu \'alaihi wasallam melaksanakan shalat pada hari raya Idul Fitri dan Idul Adlha sebelum beliau berkhuthbah.\" Telah menceritakan kepadaku dari Malik telah sampai kepadanya bahwa Abu Bakar dan Umar juga mengerjakan hal itu.\"', '2019-03-26 21:16:06', '2019-03-26 21:16:06'),
(6, 'Tirmidzi No 497', 'idul fitri', 'Telah menceritakan kepada kami [Al Hasan bin Shabah Al Bazzar Al Baghdadi] telah menceritakan kepada kami [\'Abdush Shamad bin \'Abd Al Warits] dari [Tsawab bin \'Utbah] dari [Abdullah bin Buraidah] dari [ayahnya] dia berkata, bahwa Nabi Shallahu \'alaihi wa sallam tidak keluar (ke tempat shalat) pada hari raya idul fitri sampai beliau makan terlebih dahulu, dan baliau tidak makan terlabih dahulu pada hari raya idul adlha sampai beliau shalat terlebih dahulu. (perawi) berkata, dalam bab ini (ada juga riwayat -pent) dari Ali dan Anas. Abu Isa berkata, hadits Buraidah bin Hushaib Al Aslami adalah hadits gharib. Muhammad berkata, dan saya tidak mengetahui (riwayatnya) Tsawab bin \'Utbah selain hadits ini. Dan dikalangan ahli ilmu menganjurkan supaya tidak keluar (menuju tempat shalat) sehingga makan sesuatu pada hari raya idul fitri, dan mereka juga menganjurkan untuk memakan kurma, dan tidak makan terlebih dahulu pada hari raya idul adla sampai dia kembali (dari tempat shalat).', '2019-03-26 21:20:07', '2019-03-26 21:20:07'),
(7, 'Malik no 391', 'idul fitri', 'Telah menceritakan kepadaku Yahya dari Malik dari [Nafi\'], bahwa [Abdullah bin Umar] tidak pernah shalat sunah pada hari raya Idul Fitri sebelum dan sesudahnya.\"', '2019-03-26 21:20:41', '2019-03-26 21:20:41'),
(8, 'Bukhari no 907', 'idul fitri', '(Masih dari jalur periwayatan yang sama dengan hadits sebelumnya), telah mengabarkan kepadaku [\'Atha\'] dari [Ibnu \'Abbas], dan dari [Jabir bin \'Abdullah] keduanya berkata, \"Dalam shalat Idul Fitri dan Idul Adlha tidak ada adzan.\"', '2019-03-26 21:21:00', '2019-03-26 21:21:00'),
(9, 'Malik no 393', 'idul fitri', 'Telah menceritakan kepadaku dari Malik dari [Hisyam bin Urwah] dari [Bapaknya], bahwa pada hari raya Idul Fitri dia malaksanakan shalat (sunah) sebelum shalat (Id) di masjid.\"', '2019-03-26 21:21:22', '2019-03-26 21:21:22'),
(10, 'Nasai no 1423', 'idul fitri', 'Telah mengabarkan kepada kami [Humaid bin Mas\'adah] dari [Sufyan bin Habib] dari [Syu\'bah] dari [Zubaid] dari [\'Abdurrahman bin Abu Laila] dari [\'Umar] dia berkata; \"Shalat Jum\'at dua raka\'at, shalat Idul Fitri dua raka\'at, shalat Idul Adha dua raka? t, dan juga safar dua raka\'at. Itu semua (dilaksanakan) sempurna bukan qashar, menurut lisan Nabi shallallahu \'alaihi wasallam.\"', '2019-03-26 21:21:47', '2019-03-26 21:21:47'),
(11, 'Nasai no 1547', 'idul fitri', 'Telah mengabarkan kepada kami [Ishaq bin Ibrahim] dia berkata; telah memberitakan kepada kami [\'Abdurrazzaq] dia berkata; telah memberitakan kepada kami [Ma\'mar] dari [Ayyub] dari [Nafi\'] dari [Ibnu \'Umar] bahwa Rasulullah Shalallahu \'Alaihi Wa Sallam keluar pada hari Idul Fitri dan Idul Adha dengan membawa tombak, lalu beliau menancapkannya, kemudian shalat menghadap ke arahnya.', '2019-03-26 21:22:15', '2019-03-26 21:22:15'),
(12, 'Malik No 387', 'idul fitri', 'Telah menceritakan kepadaku Yahya dari Malik dari [Hisyam bin Urwah] dari [Bapaknya], bahwasanya pada hari Idul Fitri ia makan pagi sebelum pergi (ke tempat shalat) .\"', '2019-03-26 21:22:35', '2019-03-26 21:22:35'),
(13, 'Malik No 390', 'idul fitri', 'Telah menceritakan kepadaku dari Malik dari [Nafi\'] mantan budak Abdullah bin Umar, dia berkata; \"Saya menyaksikan Idul Adlha dan Idul Fitri bersama [Abu Hurairah] . Maka pada rakaat pertama ia bertakbir tujuh takbir kali sebelum bacaan, dan pada rakaat yang terakhir dengan lima takbir sebelum bacaan.\"', '2019-03-26 21:22:56', '2019-03-26 21:22:56'),
(14, 'Malik No 556', 'idul fitri', 'Telah menceritakan kepadaku dari Malik dari [Nafi\'] bahwa [Abdullah bin Umar] memberikan zakat fitrah atas apa yang menjadi tanggungannya dua atau tiga hari sebelum shalat hari raya Idul Fitri.\"', '2019-03-26 21:23:48', '2019-03-26 21:23:48'),
(15, 'Malik no 384', 'idul fitri', 'Telah menceritakan kepadaku dari Malik dari [Nafi\'] bahwa [Abdullah bin Umar] mandi pada Hari Raya Idul Fitri sebelum pergi ke tempat shalat Ied.\"', '2019-03-26 21:24:19', '2019-03-26 21:24:19'),
(16, 'Malik no 1548', 'idul fitri', 'Telah mengabarkan kepada kami [\'Imran bin Musa] dia berkata; telah menceritakan kepada kami [Yazid bin Zurai\'] dia berkata; telah menceritakan kepada kami [Sufyan bin Sa\'id] dari [Zubaid Al Ayami] dari [\'Abdurrahman bin Abu Laila] menyebutkannya dari [\'Umar bin Al Khaththab radliallahu \'anhu] dia berkata; \"Shalat Idul Adha dua rakaat, shalat Idul Fitri dua rakaat, shalat musafir dua rakaat, dan shalat Jum\'at dua rakaat. Semua itu sempurna, bukan qashar (diringkas) menurut sabda Rasulullah shallallahu \'alaihi wasallam.', '2019-03-26 21:24:37', '2019-03-26 21:24:37'),
(17, 'Tirmidzi no 731', 'idul fitri', 'Telah menceritakan kepada kami [Yahya bin Musa] telah menceritakan kepada kami [Yahya bin Al Yaman] dari [Ma\'mar] dari [Muhammad bin Al Munkadir] dari [\'Aisyah] berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Idul Fitri ialah hari di mana orang-orang berbuka dan Idul Adlha ialah hari di mana orang-orang berkurban.\" Abu \'Isa berkata; \"Saya telah bertanya kepada Muhammad; \'Apakah Muhammad bin Al Munkadir mendengar hadits ini dari \'Aisyah? \' Dia menjawab; \'Ya, dia mengatakan dalam haditsnya, Saya telah mendengar \'Aisyah\'. Abu \'Isa berkata; \"Ini merupakan hadits hasan shahih gharib melalui riwayat ini.\"', '2019-03-26 21:25:16', '2019-03-26 21:25:16'),
(18, 'Tirmidzi No 498', 'idul fitri', 'Telah menceritakan kepada kami [Qutaibah] telah menceritakan kepada kami [Husyaim] dari [Muhammad bin Ishaq] dari [Hafsh bin \'Ubaidillah bin Anas] dari [Anas bin Malik] bahwa Nabi Shallahu \'alaihi wa sallam makan beberapa buah kurma dihari raya idul fitri sebelum keluar menuju tempat shalat. Abu Isa berkata, ini adalah hadits hasan gharib shahih', '2019-03-26 21:25:42', '2019-03-26 21:25:42'),
(19, 'Malik no 389', 'idul fitri', 'Telah menceritakan kepadaku Yahya dari Malik dari [Dlamrah bin Sa\'id Al Mazini] dari [Ubaidullah bin Abdullah bin Utbah bin Mas\'ud], bahwa Umar bin Khatthab bertanya kepada [Abu Waqid Al Laitsi], tentang apa yang dibaca oleh Rasulullah shallallahu \'alaihi wasallam di hari raya Idul Adlha dan Idul Fitri. Abu Waqid lalu menjawab; \"Beliau membaca surat, \'QAAF, WAL QURANIL MAJID\' (surat Qaff) dan \'IQTARABATIS SAA\'ATU WANSYAQQAL QAMAR (surat Al Qamar) \'.\"', '2019-03-26 21:26:05', '2019-03-26 21:26:05'),
(20, 'Bukhari No 905', 'idul fitri', 'Telah menceritakan kepada kami [Ibrahim bin Musa] berkata, telah mengabarkan kepada kami [Hisyam] bahwa [Ibnu Juraij] telah mengabarkan kepada mereka, ia berkata; telah mengabarkan kepadaku [\'Atha\'] dari [Jabir bin \'Abdullah] berkata, Aku mendengarnya berkata, \"Rasulullah shallallahu \'alaihi wasallam keluar pada hari Raya \'Idul Fitri, beliau memulainya dengan shalat kemudian khutbah.\"', '2019-03-26 21:26:43', '2019-03-26 21:26:43'),
(21, 'Nasai no 1558', 'idul fitri', 'Telah mengabarkan kepada kami [Qutaibah] dia berkata; telah menceritakan kepada kami [\'Abdul \'Aziz] dari [Dawud] dari [\'Iyadh bin \'Abdullah] dari [Abu Sa\'id Al Khudri] bahwa Rasulullah shallallahu \'alaihi wasallam pada hari Idul Fitri dan Idul Adha ke Mushalla (lapangan tempat shalat) lalu Beliau shalat bersama manusia. Bila beliau telah duduk pada rakaat kedua maka beliau mengucapkan salam, kemudian menghadap kepada manusia dengan wajahnya, sedangkan manusia duduk. Bila beliau mempunyai suatu keperluan, yakni hendak mengutus pasukan, maka beliau menyebutkannya, dan jika tidak ada keperluan maka beliau memerintahkan manusia untuk sedekah dengan bersabda \"Bersedekahlah.\" Beliau mengucapkannya sebanyak tiga kali. Sebagian besar yang bersedekah adalah wanita.', '2019-03-26 21:27:08', '2019-03-26 21:27:08'),
(22, 'Tirmidzi No 703', 'idul fitri', 'Telah menceritakan kepada kami [Qutaibah] telah menceritakan kepada kami [Abdul Aziz bin Muhammad] dari [Amru bin Yahya] dari [ayahnya] dari [Abu Sa\'id Al Khudri] berkata; \"Rasulullah shallallahu \'alaihi wasallam melarang dua puasa. Yaitu pada dua hari, pada hari raya Idul Adlha dan Idul Fitri.\" (Abu Isa At Tirmidzi) berkata; \"Hadits semakna diriwayatkan dari Umar, Ali, \'Aisyah, Abu Hurairah, Uqbah bin Amir dan Anas.\" Abu \'Isa berkata; \"Hadits Abu Sa\'id merupakan hadits hasan shahih dan diamalkan oleh ahlul ilmu.\" Dia menambahkan; \"Amr bin Yahya ialah Ibnu \'Umarah bin Abu Al Hasan Al Mazini Al Madani, dan dia seorang yang tsiqah serta meriwayatkan darinya: Sufyan Ats Tsauri, Syu\'bah dan Malik bin Anas.\"', '2019-03-26 21:27:54', '2019-03-26 21:27:54'),
(23, 'Nasai no 1403', 'idul fitri', 'Telah mengabarkan kepada kami [\'Ali bin Hujr] dia berkata; telah menceritakan kepada kami [Syarik] dari [Zubaid] dari [\'Abdurrahman bin Abu Laila] dia berkata; [\'Umar] berkata; \"Shalat Jum\'at dua raka\'at, shalat Idul Fitri dua raka\'at, dan shalat Safar dua raka\'at. Itu semua adalah sempurna, bukan qashar (diringkas) menurut lisan Rasulullah shallallahu \'alaihi wasallam.\" Abu Abdurrahman berkata; Abdurrahman bin Abu Laila tidak mendengar dari Umar.', '2019-03-26 21:28:20', '2019-03-26 21:28:20'),
(24, 'Bukhari No 911', 'idul fitri', 'Telah menceritakan kepada kami [Sulaiman bin Harb] berkata, telah menceritakan kepada kami [Syu\'bah] dari [\'Adi bin Tsabit] dari [Sa\'id bin Jubair] dari [Ibnu \'Abbas], bahwa Rasulullah shallallahu \'alaihi wasallam melaksanakan shalat Hari Raya \'Idul Fitri dua rakaat dan tidak shalat sebelum atau sesudahnya. Kemudian beliau mendatangi para wanita dan memerintahkan mereka untuk bersedekah. Maka para wanita memberikan sedekah hingga ada seorang wanita yang memberikan anting dan kalungnya.\"', '2019-03-26 21:28:43', '2019-03-26 21:28:43'),
(25, 'Tirmidzi No 702', 'idul fitri', 'Telah menceritakan kepada kami [Muhammad bin Abdul Malik bin Abu Syawarib] telah menceritakan kepada kami [Yazid bin Zurai\'] telah menceritakan kepada kami [Ma\'mar] dari [Az Zuhri] dari [Abu \'Ubaid] mantan budak Abdurrahman bin \'Auf, berkata; \"Saya menyaksikan [Umar bin Al Khaththab] pada hari Raya Idul Adlha melaksanakan shalat sebelum berkhotbah. Lalu dia berkata; \'Aku mendengar Nabi shallallahu \'alaihi wasallam melarang berpuasa pada dua hari raya ini. Hari Raya Idul Fitri karena waktu berbuka dari puasa kalian juga merupakan Hari Raya kaum muslim. Hari Raya Idul Adlha, makanlah daging hewan sembelihan kalian\'.\" Abu \'Isa berkata; \"Ini merupakan hadits hasan shahih, Abu Ubaid mantan budak Abdurrahman bin Auf namanya Sa\'ad. Terkadang dipanggil mantan budak Abdurrahman bin Azhar. Dia adalah anak paman Abdurrahman bin Auf.', '2019-03-26 21:29:12', '2019-03-26 21:29:12'),
(26, 'Tirmidzi No 491', 'idul fitri', 'Telah menceritakan kepada kami [Ishaq bin Musa Al Anshari] telah menceritakan kepada kami [Ma\'an bin Isa] telah menceritakan kepada kami [Malik bin Anas] dari [Dlamrah bin Sa\'id Al Mazini] dari [\'Ubaidillah bin Abdullah bin \'Utbah] bahwa Umar bin Al Khaththab bertanya kepada [Abu Waqid Al Laitsi], apakah Rasulullah Shallahu \'alaihi wa sallam membaca surat waktu (shalat) idul fitri dan idul adlha? Dia menjawab, beliau membaca QAAF WAL QUR\'ANIL MAJIID dan IQTARABITIS SAA\'AH WAN SYAQQAL QAMAR. Abu Isa berkata, ini adalah hadits hasan shahih, telah menceritakan kepada kami [Hannad] telah menceritakan kepada kami [Sufyan bin \'Uyainah] dari [Dlamrah bin Sa\'id] dengan isnad yang seperti ini, Abu Isa berkata, Abu Waqid Al Laitsi namanya adalah Al Harits bin \'Auf.', '2019-03-26 21:29:53', '2019-03-26 21:29:53'),
(27, 'Tirmidzi No 613', 'idul fitri', 'Telah menceritakan kepada kami [Muslim bin Amru bin Muslim Abu Amru Al Khaddza\' Al Madani] telah menceritakan kepadaku [Abdullah bin Nafi\' As Sha`igh] dari [Ibnu Abu Zannad] dari [Musa bin Uqbah] dari [Nafi\'] dari [Ibnu Umar] bahwasanya Rasulullah Shallallaahu \'alaihi wasallam memerintahkan untuk membayar zakat fitrah sebelum berangkat (ke tempat shalat) pada hari raya idul fitri. Abu \'Isa berkata, ini merupakan hadits hasan shahih gharib, atas dasar ini para ulama lebih menganjurkan untuk membayar zakat fitrah sebelum berangkat shalat.', '2019-03-26 21:30:21', '2019-03-26 21:30:21'),
(28, 'Ahmad No 2988', 'idul fitri', 'Telah menceritakan kepada kami Muhammad bin Ja\'far dan Bahz keduanya berkata; telah menceritakan kepada kami Syu\'bah dari \'Adi bin Tsabit ia berkata; Aku mendengar Sa\'id bin Jubair menceritakan dari Ibnu Abbas bahwa Rasulullah shallallahu \'alaihi wasallam berangkat pada hari Idul Adlha dan Idul Fithri. Ia berkata; Kuat dugaanku bahwa ia berkata; Pada hari Idul Fithri beliau shalat dua rakaat, beliau tidak shalat sebelum dan sesudah kedua hari itu. Kemudian beliau menemui kaum wanita bersama Bilal, lalu beliau suruh mereka bersedekah. Maka ada seorang wanita yang menyerahkan anting-anting dan kalungnya. Bahz tidak ragu, ia berkata; Hari Idul Fithri. Dan ia berkata sekedar dengan redaksi \'Menyerahkan kalung (tidak ada redaksi anting-anting).', '2019-03-26 22:05:30', '2019-03-26 22:05:30'),
(29, 'Muslim No 1475', 'idul fitri', 'Dan telah menceritakan kepada kami Amru An Naqid telah menceritakan kepada kami Isa bin Yunus telah menceritakan kepada kami Hisyam dari Hafshah binti Sirin dari Ummu Athiyyah ia berkata; Rasulullah shallallahu \'alaihi wasallam memerintahkan kepada kami agar mengajak serta keluar melakukan shalat idul fithri dan idul Adlha para gadis, wanita haid dan wanita yang sedang dipingit. Adapun mereka yang sedang haidl tidak ikut shalat, namun turut menyaksikan kebaikan dan menyambut seruan kaum muslimin. Saya bertanya kepada Rasulullah shallallahu \'alaihi wasallam, \"Wahai Rasulullah, di antara kami ada yang tidak memiliki baju.\" Beliau menjawab: \"Hendaknya saudaranya yang memiliki jilbab memakaikannya.\"', '2019-03-26 22:07:13', '2019-03-26 22:07:13'),
(30, 'Ahmad No 2940', 'idul fitri', 'Telah menceritakan kepada kami Abdush Shamad telah menceritakan kepada kami Dawud yaitu Ibnu Abu Furat, dan Abu Abdurrahman dari Daud berkata; telah menceritakan kepada kami Ibrahim dari \'Atha` dari Ibnu Abbas ia berkata; Rasulullah shallallahu \'alaihi wasallam shalat Idul Fithri bersama orang-orang sebanyak dua rakaat tanpa adzan kemudian beliau berkhutbah setelah shalat, lalu beliau mengajak Bilal menemui kaum wanita, beliau pun menasehati mereka. Kemudian setelah beliau selesai (menasehati) mereka, beliau menyuruh Bilal menghampiri dan menyuruh mereka agar bersedekah.', '2019-03-26 22:08:29', '2019-03-26 22:08:29'),
(31, 'Tirmidzi No 1151', 'jual beli', 'Telah menceritakan kepada kami [Abu Kuraib] telah memberitakan kepada kami [Abu Usamah] dari [Ubaidullah bin Umar] dari [Abu Az Zinad] dari [Al A\'raj] dari [Abu Hurairah] ia berkata; Rasulullah shallallahu \'alaihi wasallam melarang jual beli yang mengandung unsur penipuan dan jual beli menggunakan kerikil. Ia mengatakan; Dalam hal ini ada hadits serupa dari Ibnu Umar, Ibnu Abbas, Abu Sa\'id dan Anas. Abu Isa berkata; Hadits Abu Hurairah adalah hadits hasan shahih dan menjadi pedoman amal menurut para ulama, mereka memakruhkan jual beli yang mengandung unsur penipuan. Asy Syafi\'i berkata; Termasuk jual beli yang mengandung unsur penipuan adalah jual beli ikan di air, jual beli seorang budak yang melarikan diri, jual beli burung di langit dan jual beli lain yang semacam itu. Maksud jual beli menggunakan kerikil adalah seorang penjual mengatakan kepada pembeli; Jika aku membuang kerikil ini kepadamu, maka wajib terlaksana akad jual beli yang terjadi antara aku dan kamu. Hal ini serupa dengan jual beli munabadzah yang termasuk salah satu dari jual beli orang-orang jahiliyah.', '2019-03-27 01:45:12', '2019-03-27 01:45:12'),
(32, 'Nasai No 4391', 'jual beli', 'Telah mengabarkan kepada kami [Muhammad bin Ali Al Marwazi], ia berkata; telah menceritakan kepada kami [Muhriz bin Al Wadhdhah] dari [Isma\'il] dari [Nafi\'] dari [Ibnu Umar], ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Dua orang yang berjual beli memiliki hak memilih selama mereka belum berpisah, kecuali jual beli tersebut dengan syarat adanya hak memilih, apabila jual beli tersebut dengan syarat adanya hak memilih maka jual beli tersebut telah tetap.\"', '2019-03-27 01:45:30', '2019-03-27 01:45:30'),
(33, 'Bukhari No 2055', 'jual beli', 'Telah menceritakan kepada kami [Ishaq bin Wahab] telah menceritakan kepada kami [\'Umar bin Yunus] berkata, telah menceritakan kepada saya [bapakku] telah menceritakan kepada saya [Ishaq bin Abi Tholhah Al Anshari] dari [Anas bin Malik] radliallahu \'anhu bahwa dia berkata: Rasulullah shallallahu \'alaihi wasallam melarang dari Al Muhaaqalah (jual beli buah yang masih ditangkai dengan gandum), Al Mukhodharoh (jual beli buah atau biji-bijian sebelum matang), Al Mulaamasah (terjadi jual beli jika calon pembeli memegang barang dagangan), Al Munaabadzah (jual beli dengan melempar barang dagangan) dan Al Muzaabanah (jual beli kurma yang masih dipohon dengan kurma yang sudah dipetik).', '2019-03-27 01:45:50', '2019-03-27 01:45:50'),
(34, 'Nasai No 4392', 'jual beli', 'Telah mengabarkan kepada kami [Ali bin Maimun], ia berkata; telah menceritakan kepada kami [Sufyan] dari [Ibnu Juraij], ia berkata; Ali mendektekan kepada [Nafi\'] dari [Ibnu Umar], ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Apabila dua orang yang berjual beli telah melakukan jual beli maka setiap mereka memiliki hak memilih dalam jual belinya selama mereka belum berpisah, atau jual beli mereka dengan syarat adanya hak memilih, apabila dengan syarat adanya hak memilih maka jual beli tersebut telah tetap.\"', '2019-03-27 01:46:07', '2019-03-27 01:46:07'),
(35, 'Nasai No 4396', 'jual beli', 'Telah mengabarkan kepada kami [Qutaibah], ia berkata; telah menceritakan kepada kami [Al Laits] dari [Nafi\'] dari [Ibnu Umar] dari Rasulullah shallallahu \'alaihi wasallam beliau bersabda: \"Apabila dua orang saling berjaul beli maka setiap mereka memiliki hak memilih hingga mereka berpisah\" dan berkata sekali lagi; selama mereka belum berpisah atau salah seorang diantara mereka memberikan hak memilih kepada yang lain, maka apabila salah seorang diantara mereka memberikan hak memilih kepada kepada yang lain kemudian mereka berjual beli atas dasar hal tersebut maka jual beli mereka telah tetap, kemudian apabila mereka berpisah setelah melakukan jual beli dan salah seorang diantara mereka tidak meninggalkan jual beli maka jual beli tersebut telah tetap\"', '2019-03-27 01:46:23', '2019-03-27 01:46:23'),
(36, 'Abu daud No 2997', 'jual beli', 'Telah menceritakan kepada kami [Qutaibah bin Sa\'id], telah menceritakan kepada kami [Al Laits] dari [Ibnu \'Ajlan] dari [\'Amr bin Syu\'aib] dari [ayahnya] dari [Abdullah bin \'Amr bin Al \'Ash] bahwa Rasulullah shallallahu \'alaihi wasallam bersabda: \"Dua orang yang saling berjual beli memiliki hak memilih selama mereka belum berpisah, kecuali jual beli tersebut adalah jual beli dengan syarat adanya hak memilih, dan tidak halal baginya untuk meninggalkan sahabatnya karena khawatir membatalkan jual beli.\"', '2019-03-27 01:46:43', '2019-03-27 01:46:43'),
(37, 'Bukhari No 1965', 'jual beli', 'Telah menceritakan kepada kami [Shadaqah] telah mengabarkan kepada kami [\'Abdul Wahhab] berkata, aku mendengar [Yahya bin Sa\'id] berkata, aku mendengar [Nafi\'] dari [Ibnu \'Umar radliallahu \'anhuma] dari Nabi shallallahu \'alaihi wasallam bersabda: \"Dua orang yang melakukan jual beli boleh melakukan khiyar (pilihan untuk melangsungkan atau membatalkan) dalam jual beli selama keduanya belum berpisah, atau jual beli menjadi khiyar (terjadi dengan pilihan) \". Nafi\' berkata: \"Adalah Ibnu \'Umar radliallahu \'anhuma bila membeli sesuatu, baru menganggapnya telah terjadi jual beli bila sudah berpisah dari penjualnya\".', '2019-03-27 01:47:04', '2019-03-27 01:47:04'),
(38, 'Muslim No 2856', 'jual beli', 'Telah menceritakan kepada kami [Ishaq bin Ibrahim Al Handlali] telah mengabarkan kepada kami [Makhlad bin Yazid Al Jazari] telah menceritakan kepada kami [Ibnu Juraij] telah mengabarkan kepadaku [\'Atha`] dari [Jabir bin Abdullah] bahwa Rasulullah Shallallu \'alaihi wa sallam melarang jual beli mukhabarah, muhaqalah, muzabanah, melarang menjual buah hingga layak untuk dimakan, dan melarang membeli melainkan dengan dinar atau dirham kecuali jual beli \'araya. \'Atha` berkata; \"Jabir menjelaskan kepada kami, bahwa Mukhabarah adalah menyewakan tanah gersang dengan hasil tanaman dari tanah tersebut, Muzabanah ialah jual beli kurma basah dengan kurma kering dengan takaran yang sama, Muhaqalah ialah jual beli tanaman yang masih di pohon dengan biji-bijian yang ditakar.\"', '2019-03-27 01:47:26', '2019-03-27 01:47:26'),
(39, 'Bukhari No 1971', 'jual beli', 'Telah menceritakan kepada kami [Muhammad bin Yusuf] telah menceritakan kepada kami [Sufyan] dari [\'Abdullah bin Dinar] dari [Ibnu \'Umar radliallahu \'anhuma] dari Nabi shallallahu \'alaihi wasallam bersabda: \"Setiap dua orang yang melakukan jual beli dianggap tidak terjadi transaksi sah jual beli hingga keduanya berpisah, kecuali jual beli yang tidak membutuhkan perpisahan\".', '2019-03-27 01:47:47', '2019-03-27 01:47:47'),
(40, 'Nasai No 4439', 'jual beli', 'Telah mengabarkan kepada kami [Muhammad bin Rafi\'], ia berkata; telah menceritakan kepada kami [Abdur Razzaq], ia berkata; telah menceritakan kepada kami [Ma\'mar] dari [Az Zuhri] dari [\'Atho` bin Yazid] dari [Abu Sa\'id Al Khudri], ia berkata; Rasulullah shallallahu \'alaihi wasallam melarang dari dua pakaian dan dari dua macam jual beli. Adapun dua macam jual beli yaitu mulamasah dan munabadzah, yaitu berkata; apabila saya melempar baju ini maka telah terjadi jual beli. Sedangkan mulamasah yaitu memegang dengan tangannya dan tidak membukanya serta membalikkannya, apabila ia memegangnya maka telah terjadi jual beli.', '2019-03-27 01:48:06', '2019-03-27 01:48:06'),
(41, 'Muslim No 2847', 'jual beli', 'Telah menceritakan kepada kami [Abu Bakar bin Abi Syaibah] dan [Muhammad bin Abdullah bin Numair] keduanya berkata; Telah menceritakan kepada kami [Muhammad bin Bisyr] telah menceritakan kepada kami [\'Ubaidullah] dari [Nafi\'] bahwa [Abdullah] telah mengabarkan kepadanya bahwa Nabi shallallahu \'alaihi wasallam melarang jual beli dengan praktek Muzabanah, yaitu jual beli kurma basah dengan kurma kering dengan takaran tertentu, dan jual beli anggur basah dengan anggur kering dengan takaran tertentu serta jual beli gandum yang masih kasar dengan gandum yang halus dengan takaran tertentu.\" Dan telah menceritakan kepada kami [Abu Bakar bin Abu Syaibah] telah menceritakan kepada kami [Ibnu Abu Za`idah] dari [\'Ubaidillah] dengan isnad seperti ini.', '2019-03-27 01:48:27', '2019-03-27 01:48:27'),
(42, 'Tirmidzi No 1231', 'jual beli', 'Telah menceritakan kepada kami [Abu Kuraib] dan [Mahmud bin Ghailan] keduanya berkata; Telah menceritakan kepada kami [Waki\'] dari [Sufyan] dari [Abu Az Zinad] dari [Al A\'raj] dari [Abu Hurairah] ia berkata; Rasulullah shallallahu \'alaihi wasallam melarang jual beli munabadzah dan mulamasah. Ia mengatakan; Dalam hal ini ada hadits serupa dari Abu Sa\'id dan Ibnu Umar. Abu Isa berkata; Hadits Abu Hurairah adalah hadits hasan shahih, dan makna hadits ini (munabadzah) adalah seseorang mengatakan; Jika aku melempar suatu barang kepadamu, maka jual beli antara aku dan kamu harus diteruskan (terjadi transaksi jual beli). Mulamasah adalah seseorang mengatakan; Jika kamu menyentuh suatu barang, maka harus dilaksanakan jual beli, walaupun ia tidak melihat sesuatu darinya seperti (menjual (sesuatu) yang ada pada sarung pedang atau yang lainnya. Sesungguhnya hal ini termasuk dari jual beli orang-orang jahiliyah, oleh karena itu beliau melarang hal itu.', '2019-03-27 01:48:45', '2019-03-27 01:48:45'),
(43, 'Bukhari No 1969', 'jual beli', 'Telah menceritakan kepada kami [\'Abdullah bin Yusuf] telah mengabarkan kepada kami [Malik] dari [Nafi\'] dari [\'Abdullah bin \'Umar radliallahu \'anhu] bahwa Rasulullah shallallahu \'alaihi wasallam bersabda: \"Dua orang yang melakukan jual beli, masing-masing punya hak pilihan atas teman jual belinya selama keduanya belum berpisah, kecuali jual beli yang tidak membutuhkan berpisah.\"', '2019-03-27 01:49:05', '2019-03-27 01:49:05'),
(44, 'Muslim No 2844', 'jual beli', 'Telah menceritakan kepada kami [Abu Bakar bin Abu Syaibah] dan [Hasan Al Khulwani] keduanya berkata; Telah menceritakan kepada kami [Abu Usamah] dari [Al Walid bin Katsir] telah menceritakan kepadaku [Busyair bin Yasar] bekas budak Bani Haritsah, bahwa [Rafi\' bin Khudaij] dan [Sahl bin Abu Khaitsamah] telah menceritakan kepadanya bahwa Rasulullah shallallahu \'alaihi wasallam melarang jual beli dengan praktek Muzabanah, yaitu menjual buaj dengan kurma kering kecuali jual beli dengan sistem \'Ariyyah, karena mereka telah diizinkan untuk melakukan jual beli seperti itu.\"', '2019-03-27 01:49:22', '2019-03-27 01:49:22'),
(45, 'Abu Daud No 3037', 'jual beli', 'Telah menceritakan kepada kami [Abdullah bin Maslamah] dari [Malik] dari [Abdullah bin Dinar] dari [Ibnu Umar] bahwa seorang laki-laki menyebutkan kepada Rasulullah shallallahu \'alaihi wasallam bahwa dirinya telah ditipu dalam jual beli. Kemudian Rasulullah shallallahu \'alaihi wasallam bersabda: \"Apabila engkau melakukan transaksi jual beli maka katakanlah, \'Tidak boleh ada penipuan\'.\" Setelah itu jika laki-laki tersebut melakukan transaksi jual beli ia selalu mengatakan, \'Tidak boleh ada penipuan\'.\"', '2019-03-27 01:49:38', '2019-03-27 01:49:38'),
(46, 'Bukhari No 1970', 'jual beli', 'Telah menceritakan kepada kami [Qutaibah] telah menceritakan kepada kami [Al Laits] dari [Nafi\'] dari [Ibnu \'Umar radliallahu \'anhuma] dari Rasulullah shallallahu \'alaihi wasallam bahwa Beliau bersabda: \"Jika dua orang melakukan jual beli maka masing-masingnya punya hak khiyar (pilihan) atas jual belinya selama keduanya belum berpisah. Jika keduanya sepakat atau salah satu dari keduanya memilih lalu dilakukan transaksi maka berarti jual beli telah terjadi dengan sah, dan seandainya keduanya berpisah setelah transaksi sedangkan salah seorang dari keduanya tidak membatalkan transaksi maka jual beli sudah sah\".', '2019-03-27 01:49:57', '2019-03-27 01:49:57'),
(47, 'Muslim No 2859', 'jual beli', 'Telah menceritakan kepada kami [Ubaidillah bin Umar Al Qawariri] dan [Muhammad bin \'Ubaid Al Ghubari] sedangkan lafazhnya dari Ubaidillah keduanya berkata; Telah menceritakan kepada kami [Hammad bin Zaid] telah menceritakan kepada kami [Ayyub] dari [Abu Zubair] dan [Sa\'id bin Mina`] dari [Jabir bin Abdullah] dia berkata; Rasulullah Shallallu \'alaihi wa sallam melarang jual beli muhaqalah, muzabanah, mu\'awamah (menjual pohon kurma hanya beberapa tahun) dan Mukhabarah -salah satu keduanya menyebutkan; \"Jual beli siniin, yaitu jual beli mu\'awamah, dari dari jual belia tsanya (yaitu penjualan dengan pengecualian yang tidak ditentukan) - dan beliau memberi keringanan dalam \'ariyyah. Dan telah menceritakan kepada kami [Abu Bakar bin Abi Syaibah] dan [Ali bin Hujr] keduanya berkata; Telah menceritakan kepada kami [Isma\'il dia adalah Ibnu \'Ulayyah] dari [Ayyub] dari [Abu Az Zubair] dari [Jabir] dari Nabi Shallallu \'alaihi wa sallam, namun dia tidak menyebutkan jual beli sinin adalah mu\'awamah.', '2019-03-27 01:50:15', '2019-03-27 01:50:15'),
(48, 'Nasai No 4399', 'jual beli', 'Telah mengabarkan kepada kami [Ali bin Hujr] dari [Isma\'il] dari [Abdullah bin Dinar] dari [Ibnu Umar], ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Setiap dua orang yang berjual beli tidak ada jual beli diantara mereka hingga mereka berpisah kecuali jual beli dengan syarat adanya hak memilih.\"', '2019-03-27 01:50:33', '2019-03-27 01:50:33'),
(49, 'Ibnu Majah No 2172', 'jual beli', 'Telah menceritakan kepada kami [Muhammad bin Rumh Al Mishri] berkata, telah memberitakan kepada kami [Al Laits bin Sa\'d] dari [Nafi\'] dari [Abdullah bin Umar] dari Rasulullah shallallahu \'alaihi wasallam, beliau bersabda: \"Jika dua orang saling bertransaksi, maka setiap dari keduanya mempunyai hak pilih selama belum berpisah. Keduanya, atau masing-masing di antara keduanya sama-sama mempunyai hak pilih (untuk meneruskan atau membatalkan jual beli). Jika salah satunya memberi tawaran lantas keduanya terjadi kesepakatan, maka jual beli telah berlaku. Jika keduanya berpisah setelah terjadi kesepakatan, dan salah satunya tidak menggagalkan transaksi, jual beli telah berlaku.\"', '2019-03-27 01:50:50', '2019-03-27 01:50:50'),
(50, 'Tirmidzi No 1171', 'jual beli', 'Telah menceritakan kepada kami [Yusuf bin Hammad Al Bashri] telah menceritakan kepada kami [Abdul A\'la bin Abdul A\'la] dari [Sa\'id] dari [Qatadah] dari [Anas] bahwa ada seorang laki-laki yang lemah dalam akadnya namun ia melakukan jual beli, lalu keluarganya datang kepada Nabi shallallahu \'alaihi wasallam seraya berkata; wahai Rasulullah tahanlah ia (untuk tidak melakukan jual beli), maka Nabi shallallahu \'alaihi wasallam memanggilnya dan melarangnya (jual beli), laki-laki itu berkata; wahai Rasulullah sesungguhnya aku tidak bisa menahan (diri) dari jual beli, maka Nabi shallallahu \'alaihi wasallam bersabda; \"jika kamu melakuakan jual beli maka katakan; (silahkan) ini dan ini, tidak ada penipuan\", Abu Isa berkata; dan serupa dengan hal ini hadits yang diriwayatkan dari Ibnu Umar. Dan hadits Anas adalah hadits hasan shahih gharib, dan hadits ini menjadi pedoman amal menurut sebagian ulama\' dan mereka berkata; menahan dan mengurus seorang yang merdeka itu apabila ia lemah akalnya, ini adalah pendapat Ahmad dan Ishaq, namun sebagian mereka tidak berpendapat boleh untuk menahan serta mengurus seorang yang merdeka dan baligh.', '2019-03-27 01:51:11', '2019-03-27 01:51:11'),
(51, 'Muslim No 2855', 'jual beli', 'Telah menceritakan kepada kami [Abu Bakar bin Abi Syaibah] dan [Muhammad bin Abdullah bin Numair] serta [Zuhair bin Harb] mereka semua berkata; Telah menceritakan kepada kami [Sufyan bin \'Uyainah] dari [Ibnu Juraij] dari [\'Atha`] dari [Jabir bin Abdullah] dia berkata; Rasulullah Shallallu \'alaihi wa sallam melarang jual beli muhaqalah dan muzabanah serta mukhabarah, melarang jual beli buah hingga kelihatan jelas matangnya, melarang jual beli melainkan dengan dinar dan dirham (uang tunai) kecuali jual beli \'araya. Dan telah menceritakan kepada kami [Abdullah bin Humaid] telah mengabarkan kepada kami [Abu \'Ashim] telah mengabarkan kepada kami [Ibnu Juraij] dari [\'Atha`] dan [Abu Zubair] bahwa keduanya pernah mendengar [Jabir bin Abdullah] berkata; \"Rasulullah Shallallu \'alaihi wa sallam melarang…\" kemudian dia menyebutkan hadits yang sama.', '2019-03-27 01:51:26', '2019-03-27 01:51:26'),
(52, 'Bukhari No 1967', 'jual beli', 'Telah menceritakan kepada kami [Abu An-Nu\'man] telah menceritakan kepada kami [Hammad bin Zaid] telah menceritakan kepada kami [Ayyub] dari [Nafi\'] dari [Ibnu \'Umar radliallahu \'anhuma] berkata; Nabi shallallahu \'alaihi wasallam bersabda: \"Dua orang yang melakukan jual beli boleh melakukan khiyar (pilihan untuk melangsungkan atau membatalkan) dalam jual beli selama keduanya belum berpisah\". Atau Beliau bersabda: \"(Selama belum berpisah) seorang dari rekannya\". Atau Beliau bersabda: \"Jual beli menjadi khiyar (terjadi dengan pilihan) \".', '2019-03-27 01:51:44', '2019-03-27 01:51:44'),
(53, 'Nasai No 4398', 'jual beli', 'Telah mengabarkan kepada kami [Ali bin Hujr], ia berkata; telah menceritakan kepada kami [Husyaim] dari [Yahya bin Sa\'id], ia berkata; telah menceritakan kepada kami [Nafi\'] dari [Ibnu Umar], ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Dua orang yang berjual beli tidak ada jual beli antara mereka berdua hingga mereka berpisah, kecuali jual beli dengah syarat adanya hak memilih.\"', '2019-03-27 01:51:59', '2019-03-27 01:51:59'),
(54, 'Nasai No 4400', 'jual beli', 'Telah mengabarkan kepada kami [Muhammad bin Abdullah bin Abdul Hakam] dari [Syu\'aib] dari [Al Laits] dari [Ibnu Al Had] dari [Abdullah bin Dinar] dari [Abdullah bin Umar] bahwa ia mendengar Rasulullah shallallahu \'alaihi wasallam bersabda: \"Setiap dua orang yang berjual beli tidak ada jual beli diantara mereka hingga mereka berpisah kecuali jual beli dengan syarat adanya hak memilih.\"', '2019-03-27 01:52:12', '2019-03-27 01:52:12'),
(55, 'Muslim No 2848', 'jual beli', 'Telah menceritakan kepadaku [Yahya bin Ma\'in] dan [Harun bin \'Abdullah] dan [Husain bin Isa] mereka berkata; Telah menceritakan kepada kami [Abu Usamah] telah menceritakan kepada kami [\'Ubaidullah] dari [Nafi\'] dari [Ibnu Umar] dia berkata; Rasulullah shallallahu \'alaihi wasallam melarangh praktek Muzabanah (dalam jual beli), dan MUzabanah adalah jual beli kurma basah (yang masih pada pohonnya) dengan kurma kering dengan takaran tertentu, dan jual beli anggur basah dengan anggur kering dengan takaran tertentu dan setiap kurma basah yang ditaksir.\"', '2019-03-27 01:52:30', '2019-03-27 01:52:30'),
(56, 'Nasai No 4401', 'jual beli', 'Telah mengabarkan kepada kami [Abdul Hamid bin Muhammad], ia berkata; telah menceritakan kepada kami [Makhlad], ia berkata; telah menceritakan kepada kami [Sufyan] dari [\'Amr bin Dinar] dari [Ibnu Umar], ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Setiap dua orang yang berjual beli tidak ada jual beli diantara mereka hingga mereka berpisah kecuali jual beli dengan syarat adanya hak memilih.\"', '2019-03-27 01:52:46', '2019-03-27 01:52:46'),
(57, 'Nasai No 4403', 'jual beli', 'Telah mengabarkan kepada kami [\'Amr bin Yazid] dari [Bahz bin Asad], ia berkata; telah menceritakan kepada kami [Syu\'bah], ia berkata; telah menceritakan kepada kami [Abdullah bin Dinar] dari [Ibnu Umar], ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Setiap dua orang yang berjual beli tidak ada jual beli diantara mereka hingga mereka berpisah kecuali jual beli dengan syarat adanya hak memilih.\"', '2019-03-27 01:53:01', '2019-03-27 01:53:01'),
(58, 'Bukhari No 1940', 'jual beli', 'Telah menceritakan kepada kami [Badal bin Al Muhabbar] telah menceritakan kepada kami [Syu\'bah] dari [Qatadah] berkata, aku mendengar [Abu Al Khalil] menceritakan dari [\'Abdullah bin Al Harits] dari [Hakim bin Hizam radliallahu \'anhu] dari Nabi shallallahu \'alaihi wasallam bersabda: \"Dua orang yang melakukan jual beli boleh melakukan khiyar (pilihan untuk melangsungkan atau membatalkan jual beli) selama keduanya belum berpisah\", Atau sabda Beliau: \"hingga keduanya berpisah. Jika keduanya jujur dan menampakkan cacat dagangannya maka keduanya diberkahi dalam jual belinya dan bila menyembunyikan cacat dan berdusta maka akan dimusnahkan keberkahan jual belinya\".', '2019-03-27 01:53:22', '2019-03-27 01:53:22'),
(59, 'Bukhari No 1856', 'jual beli', 'Telah menceritakan kepada kami [Ibrahim bin Musa] telah mengabarkan kepada kami [Hisyam] dari [Ibnu Juraij] berkata, telah mengabarkan kepada saya [\'Amru bin Dinar] dari [\'Atho\' bin Mina] berkata; Aku mendengar dia menceritakan dari [Abu Hurairah radliallahu \'anhu] yang berkata: \"Telah dilarang berpuasa dan berjual beli pada hari Raya \'Iedul Fithri dan \'Iedul \'Adha, dan juga dilarang jual beli tanpa mengetahui barang yang dijual dan juga jual beli tanpa memeriksa barang yang dijual\".', '2019-03-27 01:53:35', '2019-03-27 01:53:35'),
(60, 'Nasai No 4402', 'jual beli', 'Telah mengabarkan kepada kami [Ar Rabi\' bin Sulaiman bin Daud], ia berkata; telah menceritakan kepada kami [Ishaq bin Bakr], ia berkata; telah menceritakan kepada kami [ayahku] dari [Yazid] dari [Abdullah bin Dinar] dari [Ibnu Umar] bahwa ia mendengar Rasulullah shallallahu \'alaihi wasallam bersabda: \"Setiap dua orang yang berjual beli tidak ada jual beli diantara mereka hingga mereka berpisah kecuali jual beli dengan syarat adanya hak memilih.\"', '2019-03-27 01:53:48', '2019-03-27 01:53:48'),
(61, 'Muslim No 5146', 'fitnah', 'Telah menceritakan kepada kami [Harmalah bin Yahya At Tujibi] telah mengkhabarkan kepada kami [Ibnu Wahb] telah mengkhabarkan kepadaku [Yunus] dari [Ibnu Syihab] bahwa [Abu Idris Al Khaulani] berkata: [Hudzaifah bin Al Yaman] berkata: Demi Allah, sesungguhnya aku adalah orang yang paling tahu tentang fitnah yang terjadi antara aku hingga kiamat. Itu karena Rasulullah Shallallahu \'alaihi wa Salam memberitahukan sesuatu tentang hal itu secara rahasia, beliau tidak menceritakannya pada selainku, tapi Rasulullah Shallallahu \'alaihi wa Salam bercerita tentang fitnah kepada majlis dimana aku berada disana, Rasulullah Shallallahu \'alaihi wa Salam bersabda, beliau menghitung fitnah-fitnah, diantaranya ada tiga fitnah yang hampir tidak meninggalkan apa pun, ada fitnah-fitnah seperti angin musim panas, ada yang kecil dan ada yang besar. Hudzaifah berkata: Lalu mereka pergi semua kecuali aku', '2019-03-27 15:37:22', '2019-03-27 15:37:22'),
(62, 'Bukhari No 5899', 'fitnah', 'Telah menceritakan kepada kami [Musa bin Isma\'il] telah menceritakan kepada kami [Salam bin Abu Muthi\'] dari [Hisyam] dari [Ayahnya] dari [Bibinya] bahwa Nabi shallallahu \'alaihi wasallam biasa meminta perlindungan dengan (membaca): \"ALLAHUMMA INNI A\'UUDZUBIKA MIN FITNATIN NAAR WAMIN \'ADZAABIN NAAR WA A\'UUDZUBIKA MIN FITNATIL QABRI WA A\'UUDZUBIKA MIN \'ADZAABIL QABRI WA A\'UUDZUBIKA MIN FITNATIL GHANIY WA A\'UUDZUBIKA MIN FITNATIL FAQRI WA A\'UUDZUBIKA MIN FITNATIL MASIIHID DAJJAL (Ya Allah, aku berlindung kepada-Mu dari fitnah neraka dan siksa neraka, aku berlindung kepada-Mu dari fitnah kubur dan siksa kubur, aku berlindung kepada-Mu dari fitnah kekayaan dan aku berlindung kepada-Mu dari fitnah kefakiran dan aku berlindung kepada-Mu dari fitnah Dajjal).\"', '2019-03-27 15:37:42', '2019-03-27 15:37:42'),
(63, 'Bukhari No 660', 'fitnah', 'Telah menceritakan kepada kami [Muhammad bin Basysyar] berkata, telah menceritakan kepada kami [Ghundar] berkata, telah menceritakan kepada kami [Syu\'bah] dari [\'Amru] berkata, Aku mendengar [Jabir bin \'Abdullah] berkata, \"Mu\'adz bin Jabal pernah shalat bersama Nabi shallallahu \'alaihi wasallam, dia lalu kembali pulang dan mengimami kaumnya shalat \'Isya dengan membaca surah Al Baqarah. Kemudian ada seorang laki-laki keluar dan pergi, Mu\'adz seakan menyebut orang tersebut dengan keburukan. Kejadian ini kemudian sampai kepada Nabi shallallahu \'alaihi wasallam, maka beliau pun bersabda: \"Apa engkau akan membuat fitnah? Apa engkau akan membuat fitnah? Apa engkau akan membuat membuat fitnah?\" Beliau ucapkanhingga tiga kali. Atau kata beliau: \"Apakah kamu menjadi pembuat fitnah? Apakah kamu menjadi pembuat fitnah? Apakah kamu menjadi pembuat fitnah?\" Lalu beliau memerintahkannya (Mu\'adz) untuk membaca dua surah saja dari pertengahan Al Mufashshal.\" Amru berkata, \'Namun aku tidak hafal kedua surat tersebut.\"', '2019-03-27 15:37:58', '2019-03-27 15:37:58'),
(64, 'Ahmad No 4863', 'fitnah', 'Telah menceritakan kepada kami [Muhammad bin Abdullah Az Zubairi] telah menceritakan kepada kami [Sufyan] dari [Abdullah bin Dinar] aku mendengar [Ibnu Umar] berkata, \"Rasulullah shallallahu \'alaihi wasallam bersabda sambil menunjukkan tangannya ke arah timur, beliau bersabda: \"Ketahuilah, sesungguhnya fitnah akan muncul dari sini, fitnah akan muncul dari sini, fitnah akan muncul dari sini, dari tempat terbitnya tanduk setan.\"', '2019-03-27 15:38:18', '2019-03-27 15:38:18'),
(65, 'Tirmidzi No 3528', 'fitnah', 'Telah menceritakan kepada kami [Abu Kuraib] telah menceritakan kepada kami [Abu Mu\'awiyah] dari [Al A\'masy] dari [Abu Shalih] dari [Abu Hurairah] dia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Berlindunglah kalian kepada Allah dari siksa neraka dan berlindunglah kalian kepada Allah dari siksa kubur. Berlindunglah kalian kepada Allah dari fitnah al-Masihud Dajjal, berlindunglah kalian kepada Allah dari fitnah kehidupan serta fitnah kematian.\" Abu Isa berkata; \"Hadits ini derajatnya hasan shahih.\"', '2019-03-27 15:38:32', '2019-03-27 15:38:32'),
(66, 'Abu Daud No 4134', 'fitnah', 'Telah menceritakan kepada kami [Musaddad] berkata, telah menceritakan kepada kami [Yahya] dari [Syu\'bah] dari [Ziyad bin Ilaqah] dari [Arfajah] ia berkata; Aku mendengar Rasulullah shallallahu \'alaihi wasallam bersabda: \"Akan terjadi pada umatku fitnah dan kebid\'ahan, fitnah dan kebid\'ahan, fitnah dan kebid\'ahan. Maka siapa yang ingin memecah-belah urusan kaum muslimin -ketika mereka bersatu- maka bunuhlah, siapapun dia.\"', '2019-03-27 15:38:48', '2019-03-27 15:38:48'),
(67, 'Ibnu Majah No 3834', 'fitnah', 'Telah menceritakan kepada kami [Ali bin Muhammad] telah menceritakan kepada kami [Waki\'] dari [Isra`il] dari [Abu Ishaq] dari [\'Amru bin Maimun] dari [Umar] bahwa Nabi shallallahu \'alaihi wasallam selalu berlindung diri dari sifat pengecut dan bakhil, kepikunan, siksa kubur, dan dari fitnah dada. Waki’ menerangkan; yaitu seseorang meninggal diatas fitnah dan dia tidak beristighfar kepada kepada Allah dari fitnah tersebut.', '2019-03-27 15:39:07', '2019-03-27 15:39:07'),
(68, 'Bukhari No 6566', 'fitnah', 'Telah menceritakan kepada kami [Ishaq bin Syahin Al Wasithi] telah menceritakan kepada kami [Khalid] dari [Bayan] dari [Wabarah bin Abdurrahman] dari [Sa\'id bin Jubair] mengatakan, [Abdullah bin Umar] menemui kami, kami sangat berharap agar ia menceritakan kepada kami sebuah pembicaraan yang baik. Tiba-tiba ada seorang laki-laki yang mendahului kami menemuinya dan berujar; \'ya Abu Abdurrahman, ceritakanlah kepada kami sebuah cerita tentang perang dalam fitnah yang telah Allah firmankan: \'Dan perangilah mereka hingga tak ada lagi fitnah di muka bumi\' (QS. Albaqarah; 193). Maka Abdullah bin Umar bertanya; \'Apakah kamu tahu apa fitnah itu, duhai malangnya ibumu kehilangan dirimu, Dahulu Muhammad Shallallahu\'alaihiwasallam memerangi orang-orang musyrik dan siapa saja yang memasuki agama mereka (pindah agama) itulah yang dimaksud fitnah, dan fitnah maksudnya bukanlah perang kalian terhadap para raja (penguasa).', '2019-03-27 15:39:22', '2019-03-27 15:39:22'),
(69, 'Muslim No 5169', 'fitnah', 'Telah menceritakan kepadaku [Harmalah bin Yahya] telah mengkhabarkan kepada kami [Ibnu Wahab] telah mengkhabarkan kepadaku [Yunus] dari [Ibnu Syihab] dari [Salim bin Abdullah] dari [ayahnya] Rasulullah Shallallahu \'alaihi wa Salam bersabda dan beliau menghadap ke timur: \"Ingat, sesungguhnya fitnah itu disini, Ingat, sesungguhnya fitnah itu disini, Ingat, sesungguhnya fitnah itu disini, dari arah terbitnya tanduk setan.\"', '2019-03-27 15:39:37', '2019-03-27 15:39:37'),
(70, 'Muslim No 4877', 'fitnah', 'Telah menceritakan kepada kami [Abu Bakr bin Abu Syaibah] dan [Abu Kuraib] -dan lafadh ini milik Abu Bakr- mereka berdua berkata; telah menceritakan kepada kami [Ibnu Numair] telah menceritakan kepada kami [Hisyam] dari [bapaknya] dari [\'Aisyah] bahwasanya Rasulullah shallallahu \'alaihi wasallam pernah membaca doa yang berbunyi: \"Ya Allah, sesungguhnya aku berlindung kepada-Mu dari fitnah api neraka dan siksanya, dari fitnah kubur dan siksanya, dari fitnah kekayaan, dari fitnah kefakiran, dan aku berlindung kepada-Mu ya Allah dari fitnah Dajjal. Ya Allah, hapuskanlah dosaku dengan air salju dan air embun, bersihkanlah hatiku dari segala kesalahan sebagaimana Engkau bersihkan kain putih dari noda. Ya Allah, jauhkanlah antara aku dan dosaku sebagaimana Engkau jauhkan antara timur dengan barat. Ya Allah, sesungguhnya aku berlindung kepada-Mu dari kemalasan dan kepikunan serta dari dosa dan lilitan hutang.\" Dan telah menceritakannya kepada kami [Abu Kuraib] telah menceritakan kepada kami [Abu Mu\'awiyah] dan [Waki\'] dari [Hisyam] dengan sanad ini.', '2019-03-27 15:39:55', '2019-03-27 15:39:55'),
(71, 'Ahmad No 19396', 'fitnah', 'Telah menceritakan kepada kami [Muhammad bin Ja\'far], telah menceritakan kepada kami [Syu\'bah] dari [Ziyad bin \'Ilaqah] ia berkata, saya mendengar [\'Arfajah] berkata; \"Aku mendengar Rasulullah Shallalahu \'alaihi wasallam bersabda: \'Akan datang gelombang fitnah yang diteruskan dengan fitnah-fitnah, barangsiapa ingin memecah belah urusan umat ini sedang mereka dalam keadaan bersatu, maka bunuhlah ia dengan pedang kapan dan dimanapun saja.\"', '2019-03-27 15:40:08', '2019-03-27 15:40:08'),
(72, 'Bukhari No 4284', 'fitnah', 'Telah menceritakan kepada kami [Ahmad bin Yunus] Telah menceritakan kepada kami [Zuhair] Telah menceritakan kepada kami [Bayan] bahwa [Wabarah] Telah menceritakan kepadanya dia berkata; Telah menceritakan kepadaku [Sa\'id bin Jubair] dia berkata; [Ibnu \'Umar] keluar menemui kami, lalu seseorang bertanya; \"Bagaimana pendapatmu tentang memerangi fitnah? Ibnu Umar menjawab; \'Tahukah kamu apa yang dimaksud fitnah? \' Nabi shallallahu \'alaihi wasallam memerangi orang-orang Musyrik, dan masuk ke dalam golongan mereka adalah fitnah, bukan seperti perang kalian dalam memerangi penguasa.\'', '2019-03-27 15:40:24', '2019-03-27 15:40:24'),
(73, 'Ibnu Majah No 3828', 'fitnah', 'Telah menceritakan kepada kami [Abu Bakar bin Abu Syaibah] telah menceritakan kepada kami [Abdullah bin Numair]. Dan telah di riwayatkan dari jalur lain, telah menceritakan kepada kami [Ali bin Muhammad] telah menceritakan kepada kami [Waki\'] semuanya dari [Hisyam bin \'Urwah] dari [ayahnya] da ri [\'aisyah] bawa Nabi shallallahu \'alaihi wasallam berdo\'a dengan kalimat-kalimat ini, yaitu; \"Ya Allah, aku berlindung kepada-Mu dari fitnah neraka dan dari siksa api neraka, dari fitnah kubur dan dari siksa kubur, dari buruknya fitnah kekayaan dan dari buruknya kekafiran serta dari fitnah Al Masih Ad Dajjal. Ya Allah, bersihkanlah kesalahan-kesalahanku dengan air sajju dan air embun, sucikanlah hatiku dari kotoran-kotoran sebagaimana Engkau menyucikan baju yang putih dari kotoran. Dan jauhkanlah antara diriku dan kesalahan-kesalahanku sebagaimana Engkau jauhkan antara timur dan barat. Ya Allah, aku berlindung kepada-Mu dari rasa malas, kepikunan, kesalahan dan kerugian.\"', '2019-03-27 15:40:37', '2019-03-27 15:40:37'),
(74, 'Abu Daud No 834', 'fitnah', 'Telah menceritakan kepada kami [Wahb bin Baqiyah] telah mengabarkan kepada kami [Umar bin Yunus Al Yamami] telah menceritakan kepadaku [Muhammad bin Abdullah bin Thawus] dari [ayahnya] dari [Thawus] dari [Ibnu Abbas] dari Nabi shallallahu \'alaihi wasallam bahwa setelah tasyahud beliau sering membaca do\'a; \"Allahumma inni a\'uudzu bika min \'adzaabi jahannam wa a\'uudzu bika min \'adzzabil qabri wa a\'uudzu bika min fitnatid dajjal wa a\'uudzu bika min fitnatil mahyaa wal mamaati (Ya Allah aku berlindung kepada-Mu dari siksa neraka Jahannam, dari siksa kubur, dan dari fitnah Dajjal fitnah serta fitnah kehidupan dan kematian.\"', '2019-03-27 15:40:50', '2019-03-27 15:40:50'),
(75, 'Nasai No 5425', 'fitnah', 'Telah mengabarkan kepada kami [Amru bin Sawwad] ia berkata; telah menceritakan kepada kami [Ibnu Wahb] ia berkata; telah menceritakan kepada kami [\'Amru Ibnul Harits] dari [Yazid bin Abu Habib] dari [Sulaiman bin Sinan Al Muzanni] bahwa ia mendengar [Abu Hurairah] berkata; \"Aku mendengar Al Qasim shallallahu \'alaihi wasallam mengucapkan dalam shalatnya: \"ALLAHUMMA INNI A\'UUDZU BIKA MIN FITNATIL QABRI WA MIN FITNATID DAJJAL WA MIN FITNATIL MAHYAA WAL MAMAATI WA MIN HARRI JAHANNAMA (Ya Allah, aku berlindung kepada-Mu dari fitnah kubur, fitnah Dajjal, fitnah kehidupan dan kematian, dan dari panasnya api jahannam).\"', '2019-03-27 15:45:56', '2019-03-27 15:45:56'),
(76, 'Bukhari No 1544', 'fitnah', 'Telah menceritakan kepadaku Malik dari [Abdullah bin Dinar] dari [Abdullah bin Umar] berkata; \"Aku melihat Rasulullah shallallahu \'alaihi wasallam menunjuk ke arah timur dan bersabda: \'Sesungguhnya fitnah itu dari sana, sesungguhnya fitnah itu dari sana, dari tempat munculnya tanduk setan\'.\"', '2019-03-27 15:46:17', '2019-03-27 15:46:17');
INSERT INTO `hadits` (`id`, `nama_hadits`, `index`, `hadits_translate`, `created_at`, `updated_at`) VALUES
(77, 'Bukhari No 6544', 'fitnah', 'Telah menceritakan kepada kami [Muhammad bin Ubaidullah] telah menceritakan kepada kami [Ibrahim bin Sa\'d] dari [ayahnya] dari [Abu Salamah bin Abdurrahman] dari [Abu Hurairah] -lewat jalur periwayatan lain- [Ibrahim] mengatakan, dan telah menceritakan kepada kami [Shalih bin Kisan] dari [Ibnu Syihab] dari [Sa\'id bin Musayyab] dari [Abu Hurairah] menuturkan; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Akan terjadi fitnah, ketika itu yang duduk lebih baik daripada yang berdiri, yang berdiri lebih baik daripada yang berjalan, yang berjalan lebih baik daripada yang berlari, barangsiapa berusaha menghadapi fitnah itu, justru fitnah itu akan mempengaruhinya, maka barangsiapa mendapat tempat berlindung atau base camp pertahanan, hendaklah ia berlindung diri di tempat itu.\"', '2019-03-27 15:46:31', '2019-03-27 15:46:31'),
(78, 'Ahmad No 16829', 'fitnah', 'Telah menceritakan kepada kami [Abul Ala` Al Hasan bin Sawwar] Telah menceritakan kepada kami [Laits bin Sa\'id] dari [Mu\'awiyah bin Shalih] dari [Abdurrahman bin Jubair bin Nufair] dari [Bapaknya] dari [Ka\'b bin Iyadl] ia berkata, \"Saya mendengar Rasulullah shallallahu \'alaihi wasallam bersabda: \"Sesungguhnya setiap umat memiliki fitnah, dan fitnah umatku adalah harta.\"', '2019-03-27 15:46:47', '2019-03-27 15:46:47'),
(79, 'Bukhari No 3037', 'fitnah', 'Telah bercerita kepada kami [\'Abdullah bin Maslamah] dari [Malik] dari [\'Abdullah bin Dinar] dari [\'Abdullah bin \'Umar radliallahu \'anhuma] berkata; \"Aku melihat Rasulullah shallallahu \'alaihi wasallam menunjuk ke arah timur lalu bersabda: \"Fitnah itu akan timbul dari sana. Fitnah timbul dari tempat terbitnya tanduk setan\".', '2019-03-27 15:47:06', '2019-03-27 15:47:06'),
(80, 'Nasai No 5409', 'fitnah', 'Telah mengabarkan kepada kami [Qutaibah] ia berkata; telah menceritakan kepada kami [Sufyan] dari [Yahya] dari [Amrah] dari [\'Aisyah] ia berkata; \"Nabi shallallahu \'alaihi wasallam biasa berlindung kepada Allah dari siksa kubur dan fitnah Dajjal.\" perawai berkata; \"Beliau bersabda: \"Sungguh, kalian akan menghadapi fitnah dalam kubur.\"', '2019-03-27 15:47:23', '2019-03-27 15:47:23'),
(81, 'Nasai No 3719', 'fitnah', 'Telah menceritakan kepada kami [Ibrahim Ibnul Hasan Al Misshishi] berkata, telah menceritakan kepada kami [Hajjaj] -maksudnya Hajjaj bin Muhammad- ia berkata, telah menceritakan kepada kami [Al Laits bin Sa\'d] ia berkata; telah menceritakan kepadaku [Mu\'awiyah bin Shalih] bahwa [\'Abdurrahman bin Jubair] menceritakan kepadanya dari [Bapaknya] dari [Al Miqdad Ibnul Aswad] ia berkata, \"Demi Allah, aku telah mendengar Rasulullah shallallahu \'alaihi wasallam bersabda: \"Orang yang bahagia adalah orang yang terhindar dari fitnah, orang yang bahagia adalah orang yang terhindar dari fitnah, orang yang bahagia adalah orang yang terhindar dari fitnah dan orang yang tertimpa musibah lalu bersabar seraya mengucapkan, \"Betapa baiknya cobaan ini!\"', '2019-03-27 15:47:37', '2019-03-27 15:47:37'),
(82, 'Tirmidzi No 994', 'fitnah', 'Telah menceritakan kepada kami Muhammad bin Basyar, telah menceritakan kepada kami Abdurrahman bin Mahdi dan Abu \'Amir Al \'Aqadi berkata; telah menceritakan kepada kami Hisyam bin Sa\'id dari Sa\'id bin Abu Hilal dari Rabi\'ah bin Saif dari Abdullah bin \'Amr berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Tidaklah seorang muslim meninggal pada hari Jum\'at atau malam Jum\'at, kecuali Allah akan menjaganya dari fitnah kubur.\" Abu Isa berkata; \"Ini merupakan hadits gharib.\" (Abu Isa At Tirmidzi) berkata; \"Hadits ini sanadnya tidak muttasil. Rabi\'ah bin Saif meriwayatkan dari Abu Abdurrahman Al Hubuli dari Abdullah bin \'Amr dan kami tidak mengetahui kalau Rabi\'ah bin Saif pernah mendengar Abdullah bin \'Amr.\"', '2019-03-27 15:47:51', '2019-03-27 15:47:51'),
(83, 'Tirmidzi No 3641', 'fitnah', 'Telah menceritakan kepada kami Ibrahim bin Sa\'id Al Jauhari telah menceritakan kepada kami Syadzan Al Aswad bin \'Amir dari Sinan bin Harun Al Burjumi dari Kulaib bin Wa`il dari Ibnu Umar dia berkata; \"Rasulullah shallallahu \'alaihi wasallam pernah menjelaskan tentang fitnah seraya besabda: \"Orang Ini akan dibunuh di dalam peristiwa itu dengan dzalim.\" Yaitu bagi Utsman. Abu Isa berkata; \"Hadits ini derajatnya hasan gharib melalui jalur indah, yaitu dari hadits Ibnu Umar.\"', '2019-03-27 15:48:05', '2019-03-27 15:48:05'),
(84, 'Tirmidzi No 2811', 'fitnah', 'Telah menceritakan kepada kami Muhammad bin Basyar telah menceritakan kepada kami Muhammad bin Ja\'far telah menceritakan kepada kami Syu\'bah dari Qatadah dari Salim bin Abu Al Ja\'d dari Ma\'dan bin Abu Thalhah dari Abu Ad Darda` dari Nabi shallallahu \'alaihi wasallam, beliau bersabda: \"Barangsiapa membaca tiga ayat permulaan surat Al Kahfi, maka ia akan terjaga dari fitnah Dajjal.\" Telah menceritakan kepada kami Muhammad bin Basyar telah menceritakan kepada kami Mu\'adz bin Hisyam telah menceritakan kepadaku Ayahku dari Qatadah dengan sanad dan maksud yang sama. Abu Isa berkata; Hadits ini hasan shahih.', '2019-03-27 15:48:21', '2019-03-27 15:48:21'),
(85, 'Tirmidzi No 2194', 'fitnah', 'Telah menceritakan kepada kami Abd bin Humaid telah menceritakan kepada kami Abdurrazzaq telah mengkhabarkan kepada kami Ma\'mar dari Az Zuhri dari Salim dari Ibnu Umar berkata: Rasulullah Shallallahu \'alahi wa Salam berdiri di mimbar lalu bersabda: \"Disinilah tanah fitnah\" beliau menunjuk ke arah timur, yaitu arah terbitnya tonggak setan atau berkata: Tanduk setan. Hadits ini hasan shahih.', '2019-03-27 15:48:37', '2019-03-27 15:48:37'),
(86, 'Tirmidzi No 2184', 'fitnah', 'Telah menceritakan kepada kami Mahmud bin Ghailan telah menceritakan kepada kami Abu Dawud telah memberitakan kepada kami Syu\'bah dari Al A\'masy dan Hammad serta \'Ashim bin Bahdalah, mereka mendengar Abu Wa\'il dari Hudzaifah berkata: Umar berkata: Siapa diantara kalian yang hafal sabda Rasulullah Shallallahu \'alahi wa Salam tentang fitnah? Berkata Hudzaifah: Saya. Berkata Hudzaifah: Fitnahnya seseorang dalam keluarga, harta, anak dan tetangganya, bisa dihapus oleh shalat, puasa, sedekah, amar ma\'ruf dan nahyi munkar. Umar berkata: Bukan itu yang aku tanyakan, tapi tentang fitnah yang bergelombang laksana ombak samudera. Berkata Huzaifah: Wahai Amirul Mu`minin, sesungguhnya diantaramu dan fitnah itu ada pintu yang tertutup. Umar bertanya: Apakah dibuka atau didobrak? Hudzaifah menjawab: Didobrak. Umar berkata: Berarti tidak tertutup hingga hari kiamat. Berkata Abu Wa`il dalam hadits Hammad: Aku berkata kepada Masruq: Tanyakan kepada Hudzaifah apa pintu yang dimaksud. Masruq bertanya lalu Hudzaifah menjawab: Umar. Berkata Abu Isa: Hadits ini shahih.', '2019-03-27 15:48:57', '2019-03-27 15:48:57'),
(87, 'Tirmidzi No 2121', 'fitnah', 'Telah menceritakan kepada kami Qutaibah telah menceritakan kepada kami Abdul \'Aziz bin Muhammad dari Al \'Alla` bin Abdurrahman dari ayahnya dari Abu Huraiah, Rasulullah Shallallahu \'alaihi wa Salam bersabda: \"Segeralah melakukan berbagai amal sebelum datangnya berbagai fitnah seperti bagian malam gelap, di pagi hari seseorang beriman dan di sore hari menjadi kafir, sore hari beriman dan di pagi hari menjadi kafir, salah seorang dari mereka menjual agamanya dengan barang dunia.\" Berkata Abu Isa: Hadits ini hasan shahih.', '2019-03-27 15:49:13', '2019-03-27 15:49:13'),
(88, 'Tirmidzi No 2122', 'fitnah', 'Telah menceritakan kepada kami Suwaid bin Nashr telah menceritakan kepada kami Abdullah bin Al Mubarak telah menceritakan kepada kami Ma\'mar dari Az Zuhri dari Hindun binti Al Harits dari Ummu Salamah, pada suatu malam nabi Shallallahu \'alaihi wa Salam bangun lalu bersabda: \"Subhaanallaah, fitnah apa yang diturunkan tadi malam, harta simpanan apa yang diturunkan, siapa yang membangunkan orang-orang tidur, alangkah banyaknya wanita berpakaian di dunia tapi telanjang di akhirat.\" Hadits ini hasan shahih.', '2019-03-27 15:49:28', '2019-03-27 15:49:28'),
(89, 'Tirmidzi No 2014', 'fitnah', 'Telah menceritakan kepada kami Abdullah bin Mu\'awiyah Al Jumahi telah menceritakan kepada kami Hammad bin Salamah telah menceritakan kepada kami Laits dari Thawus dari Ziyad bin Simin Kusy dari Abdullah bin \'Amru berkata: Rasulullah Shallallahu \'alaihi wa Salam bersabda: \"Akan terjadi fitnah, orang-orang arab yang berusaha membersihkan korban-korbannya akan masuk neraka, dan lidah pada waktu itu lebih tajam dari pedang.\" Abu Isa berkata: Hadits ini gharib, aku telah mendengar Muhammad bin Isma\'il berkata: Tidak dikenal dari Ziyad bin Simin kusy selain hadits ini. Hammad bin Salamah telah meriwayatkan hadits ini dari Laits dan memarfu\'kannya (sampai kepada Nabi Shallallahu \'alaihi wa Salam), sedangkan Hammad bin Zaid telah meriwayatkannya dari Laits namun memauqufkannya (hanya sampai pada sahabat).', '2019-03-27 15:49:41', '2019-03-27 15:49:41'),
(90, 'Tirmidzi No 2103', 'fitnah', 'Telah menceritakan kepada kami \'Imran bin Musa Al Qazzaz Al Bashri telah menceritakan kepada kami Abdul Warits bin Sa\'id telah menceritakan kepada kami Muhammad bin Juhadah dari seseorang dari Thawus dari Ummu Malik Al Bahziyyah berkata: Rasulullah Shallallahu \'alaihi wa Salam menyebutkan suatu fitnah lalu beliau mendekatkannya. Berkata Ummu Malik: Wahai Rasulullah, siapakah orang terbaik dalam fitnah itu. Rasulullah Shallallahu \'alaihi wa Salam menjawab: Seseorang berada di antara binatang ternaknya, ia menunaikan hak binatang ternaknya, menyembah Rabbnya, seseorang yang memegang kepala kudanya seraya menakuti-nakuti musuh dan mereka takut padanya.\" Berkata Abu Isa: Dalam hal ini ada hadits serupa dari Ummu Mubasysyir, Abu Sa\'id dan Ibnu \'Abbas dan hadits ini hasan gharib dari sanad ini. Al Laits bin Abu Sulaim meriwayatkannya dari Thawus dari Ummu Malik Al Bahziyyah dari nabi Shallallahu \'alaihi wa Salam.', '2019-03-27 15:49:57', '2019-03-27 15:49:57'),
(91, 'Tirmidzi No 1638', 'peperangan', 'Telah menceritakan kepada kami [Ibnu Abu Umar] berkata, telah menceritakan kepada kami [Sufyan] dari [Yazid bin Abu Ziyad] dari [\'Abdurrahman bin Abu Laila] dari [Ibnu Umar] ia berkata, \"Rasulullah shallallahu \'alaihi wasallam mengutuskan kami dalam sebuah ekspedisi, lalu orang-orang melarikan diri dari peperangan. Katika sampai di Madinah, kami bersembunyi karena malu. Kami lalu berkata; \"Kita telah celaka.\" Setelah itu kami mendatangi Rasulullah shallallahu \'alaihi wasallam dan berkata, \"Wahai Rasulullah, kami adalah orang-orang yang telah lari dari peperangan!\" beliau menjawab: \"Bahkan kalian adalah orang-orang yang kembali pada kancah peperangan, dan aku berada pada kelompok kalian.\" Abu Isa berkata, \"Ini adalah hadits hasan, kami tidak mengetahuinya kecuali dari hadits Yazid bin Ziyad. Adapun makna dari ungkapan, \'orang-orang melarikan diri dari peperangan\' adalah mundur mundur dari peperangan. Dan makna sabda Nabi, \'Bahkan kalian adalah orang-orang yang kembali pada kancah peperangan\' adalah berlari kepada pemimpinnya agar ia menolongnya, bukan lari untuk kabur dari peperangan.\"', '2019-03-27 20:30:21', '2019-03-27 20:30:21'),
(92, 'Ibnu Majah No 4037', 'peperangan', 'Telah menceritakan kepada kami [Abu Marwan Al Utsmani] telah menceritakan kepada kami [Abdul Aziz bin Abu Hazim] dari [Al \'Ala bin Abdurrahman] dari [Ayahnya] dari [Abu Hurairah], bahwa Rasulullah shallallahu \'alaihi wasallam bersabda: \"Tidak akan terjadi hari Kiamat sampai harta benda melimpah, munculnya berbagai fitnah, serta maraknya kekacauan.\" Para sahabat bertanya, \"Apakah yang dimaksud dengan kekacauan wahai Rasulullah?\" Beliau menjawab: \"Peperangan, peperangan, peperangan.\" Beliau mengucapkan sebanyak tiga kali.', '2019-03-27 20:30:36', '2019-03-27 20:30:36'),
(93, 'Ahmad No 18324', 'peperangan', 'Telah menceritakan kepada kami [Waki\'] Telah menceritakan kepada kami [Sufyan] dari [Abu Ya\'fur Al Abdi] ia berkata, saya mendengar [Ibnu Abu Aufa] berkata; Kami pernah berperang bersama Rasulullah shallallahu \'alaihi wasallam sebanyak tujuh kali peperangan. Dan dalam peperangan itu kami sempat makan belalang.', '2019-03-27 20:31:03', '2019-03-27 20:31:03'),
(94, 'Tirmidzi No 1744', 'peperangan', 'Telah menceritakan kepada kami [Ahmad bin Mani\'], telah menceritakan kepada kami [Sufyan] dari [Abu Ya\'fur Al Abdi] dari [Abdullah bin Abu Aufa] bahwa ia pernah ditanya tentang belalang. Maka ia pun menjawab, \"Aku telah berperang bersama-sama dengan Rasulullah shallallahu \'alaihi wasallam sebanyak enam kali peperangan, dan saat itu kami memakan belalang.\" Abu Isa berkata; Seperti inilah yang diriwayatkan oleh Sufyan bin Uyainah dari Abu Ya\'fur dan ia menyebutkan; Enam kali peperangan. Sufyan Ats Tsauri dan yang lainnya juga meriwayatkan hadits ini dari Abu Ya\'fur dan ia menyebutkan; \"Tujuh kali peperangan.\"', '2019-03-27 20:31:42', '2019-03-27 20:31:42'),
(95, 'Muslim No 3610', 'peperangan', 'Telah menceritakan kepada kami [Abu Kamil Al Jahdari] telah menceritakan kepada kami [Abu \'Awanah] dari [Abu Ya\'fur] dari [\'Abdullah bin Abu Aufa] dia berkata, \"Kami berperang bersama Rasulullah shallallahu \'alaihi wasallam dalam tujuh peperangan, di mana kami pernah memakan belalang.\" Dan telah menceritakan kepada kami [Abu Bakar bin Abu Syaibah] dan [Ishaq bin Ibrahim] dan [Ibnu Abu \'Umar] semunya dari [Ibnu \'Uyaianah] dari [Abu Ya\'fur] dengan isnad ini. Abu Bakar menyebutkan dalam riwayatnya, \"Tujuh peperangan.\" Dan Ishaq menyebutkan, \"Enam peperangan.\" Dan Ibnu Umar menyebutkan, \"Enam atau tujuh peperangan.\" Dan telah menceritakan kepada kami [Muhammad bin Al Mutsanna] telah menceritakan kepada kami [Ibnu Abu \'Adi]. (dalam jalur lain disebutkan) Telah menceritakan kepada kami [Ibnu Basysyar] dari [Muhammad bin Ja\'far] keduanya dari [Syu\'bah] dari [Abu Ya\'fur] dengan isnad ini. Dia berkata, \"Tujuh kali.\"', '2019-03-27 20:32:29', '2019-03-27 20:32:29'),
(96, 'Tirmidzi No 1370', 'peperangan', 'Telah menceritakan kepada kami [Qutaibah], telah menceritakan kepada kami [Ibnu Lahi\'ah] dari [\'Ayyasy bin Abbas] dari [Syuyaim bin Baitan] dari [Junadah bin Abu Umayyah] dari [Busr bin Arthah] ia berkata; Aku mendengar Nabi shallallahu \'alaihi wasallam bersabda: \"Tidak ada potong tangan dalam peperangan.\" Abu Isa berkata; Hadits ini gharib, ada selain Ibnu Lahi\'ah yang meriwayatkan dengan sanad ini seperti hadits ini. Ia dipanggil juga dengan Busr bin Abu Arthah. Hadits ini menjadi pedoman amal menurut sebagian ulama di antaranya Al Auza\'i, mereka tidak membolehkan menegakkan hukuman dalam peperangan ketika musuh datang, khawatir orang yang sedang dihukum bergabung dengan musuh. Maka jika imam telah keluar dari bumi peperangan dan kembali ke negara Islam, maka ia harus menegakkan hukuman kepada orang yang salah, demikian yang dikatakan oleh Al Auza\'i.', '2019-03-27 20:32:50', '2019-03-27 20:32:50'),
(97, 'Bukhari No 5071', 'peperangan', 'Telah menceritakan kepada kami [Abul Walid] berkata, telah menceritakan kepada kami [Syu\'bah] dari [Abu Ya\'fur] ia berkata; aku mendengar [Ibnu Abu Aufa] radliallahu \'anhuma, ia berkata, \"Kami pernah bersama Nabi shallallahu \'alaihi wasallam melakukan peperangan sebanyak tujuh atau enam kali, dan setiap itu kami bersama beliau makan belalang.\" [Sufyan] dan [Abu Awanah] dan [Israil] menyebutkan dari [Abu Ya\'fur] dari [Ibnu Abu Aufa] dengan lafadz, \"Tujuh peperangan.\"', '2019-03-27 20:33:08', '2019-03-27 20:33:08'),
(98, 'Ahmad No 16820', 'peperangan', 'Telah menceritakan kepada kami [Hammad bin Khalid] -ia adalah Al Khayyath- dari [Mu\'awiyah] -yakni Ibnu Shalih- dari [Ala` bin Harits] dari [Makhul] dari [Ziyad bin Jariyah] dari [Habib bin Maslamah], bahwa Rasulullah shallallahu \'alaihi wasallam memberi tambahan sebanyak seperempat setelah seperlima pada awal perang (peperangan pertama). Dan memberikan tambahan sepertiga setelah seperlima saat kembali (peperangan kedua).\"', '2019-03-27 20:33:25', '2019-03-27 20:33:25'),
(99, 'Tirmidzi No 3504', 'peperangan', 'Telah menceritakan kepada kami [Abu Al Walid Ad Dimasyqi Ahmad bin Abdurrahman bin Bakkar] telah menceritakan kepada kami [Al Walid bin Muslim] telah menceritakan kepada kami [\'Ufair bin Ma\'dan] bahwa dia mendengar [Abu Daus Al Yahshubi] bercerita dari [Ibnu \'Aidz Al Yahshubi] dari [\'Umarah bin Za\'karah] dia berkata; saya mendengar Rasulullah shallallahu \'alaihi wasallam bersabda: \"Sesungguhnya Allah \'azza wajalla berfirman: \"Sesungguhnya hamba-Ku (yang sebenarnya) adalah setiap hamba-ku yang selalu mengingat-Ku sementara ia bertemu dengan lawannya, yakni pada waktu peperangan.\" Abu Isa berkata; \"Hadits ini derajatnya gharib, kami tidak mengetahuinya kecuali dari jalur ini, dan isnadnya pun tidak kuat (lemah), kami juga tidak mengenal (riwayatnya) \'Umarah bin Za\'karah dari Nabi shallallahu \'alaihi wasallam kecuali hanya hadits yang satu ini, makna dari firman-Nya; \"sementara ia bertemu dengan lawannya, adalah pada saat peperangan, maksudnya hendaklah ia mengingat Allah pada saat itu (peperangan).\"', '2019-03-27 20:33:42', '2019-03-27 20:33:42'),
(100, 'Bukhari No 3637', 'peperangan', 'Telah menceritakan kepada kami [\'Ubaidullah bin Sa\'id] telah menceritakan kepada kami [Abu Usamah] dari [Hisyam] dari [bapaknya] dari [\'Aisyah] radliallahu \'anha berkata; \"Hari peperangan Bu\'ats adalah peperangan yang ditunjukkan oleh Allah dalam kehidupan Rasulullah shallallahu \'alaihi wasallam. Kemudian Rasulullah shallallahu \'alaihi wasallam tiba di Madinah dalam keadaan mereka saling bertengkar dan telah terbunuh para pembesar yang mereka muliakan. Dan Allah juga telah menunjukkan kepada Rasulullah shallallahu \'alaihi wasallam tentang masuk Islamnya mereka.\"', '2019-03-27 20:33:58', '2019-03-27 20:33:58'),
(101, 'Bukhari No 2594', 'peperangan', 'Telah bercerita kepada kami [Yahya bin Bukair] telah bercerita kepada kami [Al Laits] berkata telah bercerita kepadaku [Yunus] dari [Ibnu Syihab] dari [\'Ubaidullah bin \'Abdullah] bahwa [\'Abdullah bin \'Abbas radliallahu \'anhu] pernah mengabarkannya [Abu Sufyan bin Harb] mengabarkannya bahwa Heraklius berkata kepadanya: \"Aku telah bertanya kepadamu bagaimana kesudahan peperangan antara kalian dengannya lalu kamu jawab bahwa peperangan yang terjadi bergantian saling mengalahkan. Begitulah adanya para rasul, dimana dia diuji kemudian akhirnya mereka mendapatkan kejayaan\".', '2019-03-27 20:34:20', '2019-03-27 20:34:20'),
(102, 'Ibnu Majah 2767', 'peperangan', 'Telah menceritakan kepada kami [Hisyam bin Ammar]; telah menceritakan kepada kami [Baqiyyah] dari [Mua\'awiyyah bin Yahya] dari [Laits bin Abu Sulaim] dari [Yahya bin \'Abbad] dari [Ummu Darda`] dari [Abu Darda`], ia berkata; Sesungguhnya Rasulullah shallallahu \'alaihi wasallam bersabda: \'Peperangan di lautan itu seperti sepuluh kali peperangan di daratan, dan orang yang pusing di tengah laut seperti orang yang berlumuran dengan darahnya di jalan Allah Subhaanahu wa ta\'ala.\"', '2019-03-27 20:34:35', '2019-03-27 20:34:35'),
(103, 'Muslim No 3326', 'peperangan', 'Telah menceritakan kepada kami [Ahmad bin Jannab Al Mishishi] telah menceritakan kepada kami [Isa bin Yunus] dari [Zakaria] dari [Abu Ishaq] dia berkata, \"Seorang laki-laki datang kepada [Al Barra] seraya bertanya, \"Wahai Abu \'Umarah, apakah kalian pernah lari dari peperangan Hunain?\" maka dia menjawab, \"Aku bersaksi atas Nabi Allah shallallahu \'alaihi wasallam, (pasukan) beliau tidaklah lari, akan tetapi saat itu orang-orang (yang ikut serta) tergesa-gesa tanpa membawa persenjataan yang lengkap menuju perkampungan Bani Hawazin ini, padahal mereka adalah pasukan pemanah, lantas orang-orang kafir melemparinya dengan anak panah, seakan-akan mereka (kaum Muslimin) seperti sekumpulan belalang. Sehingga kaum Muslimin pun kocar-kacir dan terpaksa berbalik kepada Rasulullah shallallahu \'alaihi wasallam, sementara itu Abu Sufyan sedang mengawal dengan memegang bighal beliau. Kemudian beliau turun dan berdo\'a dengan memohon pertolongan, beliau bersabda: \"Aku adalah seorang Nabi, tidak seorang pendusta, aku adalah putra Abdul Mutthalib. Ya Allah…turunkanlah bala bantuan-Mu.\" Barra berkata, \"Demi Allah, kami saat itu sangat mengkhawatirkan karena dahsyatnya peperangan, dan orang yang paling pemberani adalah orang yang paling dekat dengan peperangan, yaitu Nabi shallallahu \'alaihi wasallam.\"', '2019-03-27 20:34:52', '2019-03-27 20:34:52'),
(104, 'Muslim No 3383', 'peperangan', 'Telah menceritakan kepada kami [Zuhair bin Harb] telah menceritakan kepada kami [Rauh bin \'Ubadah] telah menceritakan kepada kami [Zakaria] telah mengabarkan kepada kami [Abu Az Zubair] bahwa dia pernah mendengar [Jabir bin Abdullah] berkata, \"Aku pernah mengikuti peperangan bersama Rasulullah shallallahu \'alaihi wasallam sebanyak sembilan belas kali peperangan.\" Jabir berkata, \"Namun aku tidak ikut dalam perang Badar dan perang Uhud, sebab ayahku melarangku untuk mengikutinya, ketika Abdullah terbunuh pada waktu perang Uhud, maka aku tidak pernah ketinggalan sekali pun untuk ikut perang bersama Rasulullah shallallahu \'alaihi wasallam.\"', '2019-03-27 20:35:09', '2019-03-27 20:35:09'),
(105, 'Bukhari No 1858', 'peperangan', 'Telah menceritakan kepada kami [Hajjaj bin Minhal] telah menceritakan kepada kami [Syu\'bah] dari [\'Abdul Malik bin \'Umair] berkata, aku mendengar [QAza\'ah] berkata; Aku mendengar [Abu Sa\'id Al Khudriy radliallahu \'anhu] yang pernah mengikuti peperangan bersama Nabi shallallahu \'alaihi wasallam sebanyak dua belas peperangan, berkata: \"Empat perkara yang aku dapatkan dari Nabi shallallahu \'alaihi wasallam, yang perkara-perkara itu menakjubkan aku (yaitu): \"Tidak boleh seorang wanita bepergian sepanjang dua hari perjalanan kecuali bersama suaminya atau mahramnya, dan tidak boleh shaum dua hari raya, \'Iedul Fithri dan \'Iedul Adhha, dan tidak boleh melaksanakan dua shalat, yaitu setelah \'Ashar hingga matahari terbenam, dan setelah Shubuh hingga matahari terbit, dan tidaklah ditekankan untuk berziarah kecuali untuk mengunjungi tiga masjid, Al Masjidil Haram, Masjidil Aqsha dan Masjidku ini \".', '2019-03-27 20:35:24', '2019-03-27 20:35:24'),
(106, 'Muslim No 3384', 'peperangan', 'Dan telah menceritakan kepada kami [Abu Bakar bin Abu Syaibah] telah menceritakan kepada kami [Zaid bin Al Hubab]. (dalam jalur lain disebutkan) Telah menceritakan kepada kami [Sa\'id bin Muhammad Al Jarmi] telah menceritakan kepada kami [Abu Tumailah] dia berkata; telah menceritakan kepada kami [Husain bin Waqid] dari [Abdullah bin Buraidah] dari [ayahnya] dia berkata, \"Rasulullah shallallahu \'alaihi wasallam ikut serta dalam peperangan sebanyak sembilan balas kali, delapan kali di antaranya (beliau) terjun langsung dalam kancah peperangan tersebut.\" Namun Abu Bakar tidak menyebutkan, \"di antaranya.\" Dan haditsnya ia menyebutkan, \"Telah menceritakan kepadaku, Abdullah bin Buraidah.\"', '2019-03-27 20:35:39', '2019-03-27 20:35:39'),
(107, 'Ahmad No 16824', 'peperangan', 'Telah menceritakan kepada kami [Abul Mughirah] Telah menceritakan kepada kami [Sa\'id bin Abdul Aziz] Telah menceritakan kepada kami [Sulaiman bin Musa] dari [Ziyad bin Jariyah] dari [Habib bin Maslamah] ia berkata, \"Saya menyaksikan Rasulullah shallallahu \'alaihi wasallam memberi tambahan sebanyak seperempat setelah seperlima pada awal perang (peperangan pertama). Dan memberikan tambahan sepertiga setelah seperlima saat kembali (peperangan kedua).\" Abu Abdurrahman berkata, \"Aku mendengar bapakku berkata, \"Tidak ada seorang laki-laki pun di Syam yang haditsnya lebih shahih dari Sa\'id bin Abdil Aziz, yakni At Tanukhi.\"', '2019-03-27 20:35:55', '2019-03-27 20:35:55'),
(108, 'Ahmad No 16968', 'peperangan', 'Telah menceritakan kepada kami [Hasan bin Musa] Telah menceritakan kepada kami [Abdullah bin Lahi\'ah] Telah menceritakan kepada kami [Ayyasy bin Abbas] dari [Syiyaim bin Baitan] dari [Junadah bin Abu Umayyah] bahwasanya ia pernah berkhutbh di atas mimbar di Rudis (nama tempat) saat ia mendera dua orang laki-laki yang mencuri ghanimah. Ia katakan, \"Sesungguhnya tidak ada sesuatu pun yang menghalangiku untuk memotong tangan keduanya, kecuali karena Yusra bin Arthah pernah mendapati seorang laki-laki yang bernama Mashdar mencuri dalam peperangan, namun ia hanya mendera dan tidak memotong tangannya. setelah itu ia berkata, \"Rasulullah shallallahu \'alaihi wasallam melarang kami untuk memotong tangan dalam peperangan.\"', '2019-03-27 20:36:08', '2019-03-27 20:36:08'),
(109, 'Muslim No 3386', 'peperangan', 'Telah menceritakan kepada kami [Muhammad bin \'Abbad] telah menceritakan kepada kami [Hatim] -yaitu Ibnu Isma\'il- dari [Yazid] -yaitu Ibnu Abu \'Ubaid- dia berkata; aku mendengar [Salamah] berkata, \"Aku pernah berperang bersama-sama dengan Rasulullah shallallahu \'alaihi wasallam sebanyak tujuh kali, kemudian aku juga pernah ikut dalam pasukan yang dikirim oleh beliau sebanyak sembilan kali peperangan, sekali dipimpin oleh Abu Bakar dan satu kali di bawah pimpinan Usamah bin Zaid.\" Dan telah menceritakan kepada kami [Qutaibah bin Sa\'id] telah menceritakan kepada kami [Hatim] dengan isnad ini, namun dia mengatakan dalam kedua hadits tersebut sebanyak tujuh kali peperangan.\"', '2019-03-27 20:36:22', '2019-03-27 20:36:22'),
(110, 'Nasai No 4281', 'peperangan', 'Telah mengabarkan kepada kami Humaid bin Mas\'adah dari Sufyan yaitu Ibnu Habib dari Syu\'bah dari Abu Ya\'fur, ia mendengar Abdullah bin Abu Aufa berkata; kami berperang bersama Rasulullah shallallahu \'alaihi wasallam sebanyak tujuh peperangan, dan kami makan belalang.', '2019-03-27 20:36:59', '2019-03-27 20:36:59'),
(111, 'Nasai No 3081', 'peperangan', 'Telah mengabarkan kepada kami Harun bin Muhammad bin Bakkar bin Bilal, ia berkata; telah menceritakan kepada kami Muhammad bin Isa bin Al Qasim bin Sumai`, ia berkata; telah menceritakan kepada kami Zaid bin Waqid, ia berkata; telah menceritakan kepadaku Busr bin Ubaidullah dari Abu Idris Al Khaulani dari Abu Ad Darda`, ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Barangsiapa yang mendirikan shalat, menunaikan zakat dan ia mati tidak menyekutukan Allah dengan selainNya, maka hal tersebut menjadi hak bagi Allah Azza wa Jalla untuk mengampuninya sebagai orang yang berhijrah dan meninggal disaat dilahirkan, \" Lalu kami berkata; wahai Rasulullah tidakkah kami mengabarkannya kepada manusia agar mereka mendapatkan berita gembira?\", beliau bersabda: \" Sesungguhnya dalam surga terdapat seratus derajat, setiap derajat berjarak antara langit dan bumi, yang Allah siapkan untuk orang-orang yang berjihad dijalanNya. Kalaulah bukan karena alasan aku memberatkan kaum mukminin, dan aku tidak mendapatkan kendaraan untuk mengangkut mereka untuknya (berjihad), dan jiwa-jiwa mereka keberatan jika tidak menyertai sepeninggalku, pasti aku akan duduk dibelakang ekspedisi peperangan, dan aku ingin terbunuh kemudian dihidupkan lalu aku terbunuh.\"', '2019-03-27 20:37:18', '2019-03-27 20:37:18'),
(112, 'Muslim No 3450', 'peperangan', 'Dan telah menceritakan kepada kami Abu Bakar bin Abu Syaibah telah menceritakan kepada kami Ibnu \'Uyainah. Telah menceritakan kepada kami Ibnu Numair telah menceritakan kepada kami Sufyan dari Abu Az Zubair dari Jabir dia berkata, \"Kami tidak berbai\'at kepada Rasulullah shallallahu \'alaihi wasallam di atas kematian, hanyasanya kami berbai\'at kepada beliau untuk tidak lari (dari peperangan).\"', '2019-03-27 20:37:35', '2019-03-27 20:37:35'),
(113, 'Malik No 860', 'peperangan', 'Telah menceritakan kepadaku dari Malik dari Yahya bin Sa\'id bahwa Sa\'id Ibnul Musayyab berkata; \"Jika seseorang diberi sesuatu dalam sebuah peperangan, lalu dia sampai lokasi keberangkatan perang, maka barang itu menjadi miliknya.\"', '2019-03-27 20:37:52', '2019-03-27 20:37:52'),
(114, 'Malik No 862', 'peperangan', 'Telah menceritakan kepadaku dari Malik dari Yahya bin Sa\'id bahwa ia mendengar Sa\'id bin Musayyab berkata; \"Orang-orang (kaum muslimin) jika membagi harta ghanimah dari peperangan, mereka mensetarakan satu ekor unta dengan sepuluh kambing.\"', '2019-03-27 20:38:11', '2019-03-27 20:38:11'),
(115, 'Muslim No 3449', 'peperangan', 'Telah menceritakan kepada kami Qutaibah bin Sa\'id telah menceritakan kepada kami Laits bin Sa\'d. (dalam jalur lain disebutkan) Telah menceritakan kepada kami Muhammad bin Rumh telah mengabarkan kepada kami Al Laits dari Abu Az Zubair dari Jabir dia berkata, \"Di hari Hudaibiyyah kami berjumlah seribu empat ratus orang, kami berbaiat kepada beliau. Umar memegang tangan beliau di bawah pohon Samurah sambil berkata, \"Kami berbai\'at kepada beliau bahwa kami tidak akan lari (dari peperangan) dan kami tidak berbai\'at atas kematian.\"', '2019-03-27 20:38:29', '2019-03-27 20:38:29'),
(116, 'Malik No 875', 'peperangan', 'Telah menceritakan kepadaku dari Malik dari Yahya bin Sa\'id dari Sa\'id bin Abu Sa\'id Al Maqburi dari Abdullah bin Abu Qatadah dari Bapaknya berkata; \"Seorang laki-laki menemui Rasulullah shallallahu \'alaihi wasallam dan bertanya, \"Wahai Rasulullah, jika saya terbunuh di jalan Allah dalam keadaan sabar mengharap ridla-Nya, terus maju tanpa lari dari peperangan, apakah Allah akan mengampuni dosa-dosaku\'. Rasulullah shallallahu \'alaihi wasallam bersabda: \'Ya benar\'. Tatkala lelaki tadi pergi, Rasulullah memanggilnya kembali, atau memerintahkan seseorang untuk memanggilnya. Beliau bertanya kepadanya: \"Apa yang telah kamu katakan tad?\" laki-laki itu lalu mengulangi ucapannya. Kemudian Nabi shallallahu \'alaihi wasallam bersabda: \"Ya, kecuali hutang. Hal itulah yang dikatakan JIbril kepadaku\'.\"', '2019-03-27 20:38:51', '2019-03-27 20:38:51'),
(117, 'Malik No 879', 'peperangan', 'Telah menceritakan kepadaku dari Malik dari Yahya bin Sa\'id bahwa Umar bin Khattab berkata; \"Kemuliaan seorang mukmin adalah ketakwaannya, agamanya adalah kehormatannya, wibawanya adalah akhlaknya, sedangkan keberanian dan jiwa pengecut adalah adalah naluri yang Allah tanamkan kepada siapa yang Ia kehendaki. Orang yang takut akan lari dari membela bapak dan ibunya, sedang orang yang berani akan berperang membela sesuatu yang tidak akan dibawa ke dalam rumahnya. Gugur dalam peperangan adalah salah satu jenis kematian, sedangkan syahid adalah orang yang menyerahkan jiwanya kepada Allah.\"', '2019-03-27 20:39:11', '2019-03-27 20:39:11'),
(118, 'Ibnu Majah No 2864', 'peperangan', 'Telah menceritakan kepada kami Imran bin Musa Al Laitsi; telah menceritakan kepada kami Hammad bin Zaid; telah memberitakan kepada kami \'Ali bin Zaid bin Jud\'an dari Abu Nadlrah dari Abu Said Al Khudri, ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Ingatlah, akan ditancapkan bendera di hari kiamat bagi orang yang melarikan diri dari peperangan sesuai dengan pengkhianatannya.\"', '2019-03-27 20:39:26', '2019-03-27 20:39:26'),
(119, 'Ibnu Majah No 2863', 'peperangan', 'Telah menceritakan kepada kami Muhammad bin Abdullah bin Numair; telah menceritakan kepada kami Abu Al Walid; telah menceritakan kepada kami Syu\'bah; demikian juga telah diriwayatkan dari jalur yang lainnya, dan telah menceritakan kepada kami Muhammad bin Basysyar; telah menceritakan kepada kami Ibnu Abu \'Adi dari Syu\'bah dari Al A\'masy dari Abu Wa`il dari \'Abdullah, ia berkata; Rasulullah shallallahu \'alaihi wasallam bersabda: \"Akan ditancapkan pada setiap orang yang melarikan diri dari peperangan berupa bendera di hari kiamat. Dikatakan: ini adalah pengkhianatan si fulan.\"', '2019-03-27 20:39:59', '2019-03-27 20:39:59'),
(120, 'Ibnu Majah No 2891', 'peperangan', 'Telah menceritakan kepada kami Hisyam bin \'Ammar; telah menceritakan kepada kami Syu\'aib bin Ishaq; telah menceritakan kepada kami Ibnu Juraij; telah menceritakan kepadaku \'Amru bin Dinar bahwa ia mendengar Abu Ma\'bad -mantan budak- Ibnu Abbas dari Ibnu Abbas radliallahu \'anhu, ia berkata; \"Seorang Arab Badui datang menemui Nabi shallallahu \'alaihi wasallam lantas berkata; \'Aku telah ditugaskan dalam sebuah peperangan ini dan itu, sedangkan (saat itu) istriku tengah punya hajat (yang harus dipenuhi).\' Maka beliau shallallahu \'alaihi wasallam bersabda: \'Kembalilah kamu bersamanya\'.\"', '2019-03-27 20:40:15', '2019-03-27 20:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `jaccard`
--

CREATE TABLE `jaccard` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_document` int(11) NOT NULL,
  `jaccard_similarity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jaccard`
--

INSERT INTO `jaccard` (`id`, `keyword`, `id_document`, `jaccard_similarity`, `created_at`, `updated_at`) VALUES
(1, 'idul fitri', 7, '0.07952222803401014', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(2, 'idul fitri', 1, '0.07145738938854436', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(3, 'idul fitri', 2, '0.06770270870948537', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(4, 'idul fitri', 5, '0.06693864248517134', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(5, 'idul fitri', 14, '0.05757178408618811', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(6, 'idul fitri', 15, '0.0570779630107349', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(7, 'idul fitri', 3, '0.05516242813156573', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(8, 'idul fitri', 12, '0.052343280403510405', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(9, 'idul fitri', 8, '0.047512347172770704', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(10, 'idul fitri', 9, '0.0401918994072026', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(11, 'idul fitri', 4, '0.03875423181538794', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(12, 'idul fitri', 20, '0.03231910208229276', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(13, 'idul fitri', 11, '0.0275314349767604', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(14, 'idul fitri', 18, '0.022114283635855245', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(15, 'idul fitri', 13, '0.01690875392008984', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(16, 'idul fitri', 17, '0.015633137641517206', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(17, 'idul fitri', 24, '0.014861397181049438', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(18, 'idul fitri', 16, '0.014558604607736723', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(19, 'idul fitri', 22, '0.012251301007346258', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(20, 'idul fitri', 19, '0.010301161497865838', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(21, 'idul fitri', 6, '0.010243364156910718', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(22, 'idul fitri', 10, '0.009935542857116833', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(23, 'idul fitri', 28, '0.00955505040357084', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(24, 'idul fitri', 26, '0.008481253701548357', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(25, 'idul fitri', 23, '0.007983493823548916', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(26, 'idul fitri', 21, '0.007626966824938607', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(27, 'idul fitri', 25, '0.006949908277254378', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(28, 'idul fitri', 29, '0.006858032332058827', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(29, 'idul fitri', 27, '0.006480431997365459', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(30, 'idul fitri', 30, '0.0033175360013912867', '2019-05-23 20:19:05', '2019-05-23 20:19:05'),
(31, 'jual beli', 48, '0.11185085926666735', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(32, 'jual beli', 56, '0.08882341889525039', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(33, 'jual beli', 57, '0.08528595907721863', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(34, 'jual beli', 43, '0.0821209131159104', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(35, 'jual beli', 53, '0.07960229097301769', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(36, 'jual beli', 54, '0.07274518662709449', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(37, 'jual beli', 39, '0.07208530752174748', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(38, 'jual beli', 60, '0.06584841579864996', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(39, 'jual beli', 34, '0.061545495205728475', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(40, 'jual beli', 32, '0.05276655548121338', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(41, 'jual beli', 37, '0.04795405162786425', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(42, 'jual beli', 36, '0.04668804006908156', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(43, 'jual beli', 35, '0.045912157754488515', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(44, 'jual beli', 59, '0.0433920710471677', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(45, 'jual beli', 40, '0.03873480373837286', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(46, 'jual beli', 52, '0.038261129157491795', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(47, 'jual beli', 46, '0.03749662366543185', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(48, 'jual beli', 45, '0.03737705306052659', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(49, 'jual beli', 42, '0.03155534948583651', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(50, 'jual beli', 33, '0.030148419427189054', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(51, 'jual beli', 44, '0.027473450140835517', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(52, 'jual beli', 58, '0.02727713293206443', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(53, 'jual beli', 31, '0.026044312241980293', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(54, 'jual beli', 51, '0.02464539834457098', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(55, 'jual beli', 38, '0.020962941106780503', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(56, 'jual beli', 49, '0.020111227382313517', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(57, 'jual beli', 41, '0.0199670412374341', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(58, 'jual beli', 55, '0.01840553809284983', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(59, 'jual beli', 47, '0.01811957655893066', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(60, 'jual beli', 50, '0.015939949167298333', '2019-05-23 20:23:56', '2019-05-23 20:23:56'),
(61, 'jual beli', 87, '0.003451155295053373', '2019-05-23 20:23:56', '2019-05-23 20:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_12_12_111440_create_hadits_table', 1),
(5, '2019_03_14_040314_create_similarity_table', 2),
(6, '2019_03_14_075317_create_jaccard_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_cosine` int(11) NOT NULL,
  `tp_jaccard` int(11) NOT NULL,
  `fp_cosine` int(11) NOT NULL,
  `fp_jaccard` int(11) NOT NULL,
  `fn_cosine` int(11) NOT NULL,
  `fn_jaccard` int(11) NOT NULL,
  `recall_cosine` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recall_jaccard` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precision_cosine` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precision_jaccard` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_cosine` int(11) NOT NULL,
  `total_jaccard` int(11) NOT NULL,
  `time_cosine` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_jaccard` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `keyword`, `tp_cosine`, `tp_jaccard`, `fp_cosine`, `fp_jaccard`, `fn_cosine`, `fn_jaccard`, `recall_cosine`, `recall_jaccard`, `precision_cosine`, `precision_jaccard`, `total_cosine`, `total_jaccard`, `time_cosine`, `time_jaccard`, `created_at`, `updated_at`) VALUES
(1, 'idul fitri', 30, 30, 0, 0, 0, 0, '100', '100', '100', '100', 30, 30, '3.3196620941', '5.0638370514', '2019-05-23 20:12:09', '2019-05-23 20:12:09'),
(2, 'Telah menceritakan kepadaku Yahya dari Malik dari [Nafi\'], bahwa [Abdullah bin Umar] tidak pernah shalat sunah pada hari raya Idul Fitri sebelum dan sesudahnya.\"', 0, 0, 120, 120, 0, 0, '0', '0', '0', '0', 120, 120, '3.2649919987', '3.2678508759', '2019-05-23 20:14:16', '2019-05-23 20:14:16'),
(3, 'jual beli', 30, 30, 1, 1, 0, 0, '100', '100', '96.77419355', '96.77419355', 31, 31, '3.2337660789', '3.3095290661', '2019-05-23 20:23:59', '2019-05-23 20:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `similarity`
--

CREATE TABLE `similarity` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_document` int(11) NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cosine_similarity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `similarity`
--

INSERT INTO `similarity` (`id`, `id_document`, `keyword`, `cosine_similarity`, `created_at`, `updated_at`) VALUES
(1, 1, 'idul fitri', '0.31978043958228736', NULL, NULL),
(2, 2, 'idul fitri', '0.3114468708502734', NULL, NULL),
(3, 5, 'idul fitri', '0.3097211368302514', NULL, NULL),
(4, 7, 'idul fitri', '0.2819968581988284', NULL, NULL),
(5, 3, 'idul fitri', '0.2816751434702577', NULL, NULL),
(6, 8, 'idul fitri', '0.2617265185663957', NULL, NULL),
(7, 14, 'idul fitri', '0.2399412096455882', NULL, NULL),
(8, 15, 'idul fitri', '0.2389099474922191', NULL, NULL),
(9, 4, 'idul fitri', '0.2366999659497654', NULL, NULL),
(10, 12, 'idul fitri', '0.2287865389473568', NULL, NULL),
(11, 9, 'idul fitri', '0.20047917449750885', NULL, NULL),
(12, 11, 'idul fitri', '0.19985581212070117', NULL, NULL),
(13, 20, 'idul fitri', '0.17977514311576215', NULL, NULL),
(14, 6, 'idul fitri', '0.17256957849015594', NULL, NULL),
(15, 13, 'idul fitri', '0.15688576304005555', NULL, NULL),
(16, 17, 'idul fitri', '0.15088222416181404', NULL, NULL),
(17, 18, 'idul fitri', '0.14870872077943256', NULL, NULL),
(18, 16, 'idul fitri', '0.14562918425781096', NULL, NULL),
(19, 22, 'idul fitri', '0.13364036072929855', NULL, NULL),
(20, 28, 'idul fitri', '0.1327973733206991', NULL, NULL),
(21, 19, 'idul fitri', '0.12258102761253256', NULL, NULL),
(22, 24, 'idul fitri', '0.12190733030072243', NULL, NULL),
(23, 10, 'idul fitri', '0.12039294055736588', NULL, NULL),
(24, 25, 'idul fitri', '0.1155292646124796', NULL, NULL),
(25, 26, 'idul fitri', '0.11125895164854838', NULL, NULL),
(26, 21, 'idul fitri', '0.10552113675025719', NULL, NULL),
(27, 23, 'idul fitri', '0.08935039912361285', NULL, NULL),
(28, 27, 'idul fitri', '0.08050113041048218', NULL, NULL),
(29, 29, 'idul fitri', '0.07974964570364355', NULL, NULL),
(30, 30, 'idul fitri', '0.03928619527866064', NULL, NULL),
(31, 31, 'jual beli', '0.5750021529248781', NULL, NULL),
(32, 48, 'jual beli', '0.5588091282047434', NULL, NULL),
(33, 34, 'jual beli', '0.541559855695298', NULL, NULL),
(34, 56, 'jual beli', '0.5015707285961101', NULL, NULL),
(35, 35, 'jual beli', '0.4938621965971777', NULL, NULL),
(36, 57, 'jual beli', '0.49202958742800285', NULL, NULL),
(37, 43, 'jual beli', '0.48329611729628913', NULL, NULL),
(38, 37, 'jual beli', '0.48053276216133767', NULL, NULL),
(39, 53, 'jual beli', '0.4762063288299889', NULL, NULL),
(40, 54, 'jual beli', '0.45622513223421285', NULL, NULL),
(41, 39, 'jual beli', '0.4542464900587128', NULL, NULL),
(42, 32, 'jual beli', '0.4505899201087893', NULL, NULL),
(43, 60, 'jual beli', '0.4350148311283604', NULL, NULL),
(44, 36, 'jual beli', '0.424775323287683', NULL, NULL),
(45, 42, 'jual beli', '0.410877511306367', NULL, NULL),
(46, 59, 'jual beli', '0.4087817521865381', NULL, NULL),
(47, 33, 'jual beli', '0.40270931576030294', NULL, NULL),
(48, 40, 'jual beli', '0.3880272307841713', NULL, NULL),
(49, 46, 'jual beli', '0.38194748323905636', NULL, NULL),
(50, 52, 'jual beli', '0.3345569955235843', NULL, NULL),
(51, 45, 'jual beli', '0.3307642687542447', NULL, NULL),
(52, 58, 'jual beli', '0.32698800408185585', NULL, NULL),
(53, 38, 'jual beli', '0.3210699585859543', NULL, NULL),
(54, 47, 'jual beli', '0.31235065463072914', NULL, NULL),
(55, 51, 'jual beli', '0.3111148928013375', NULL, NULL),
(56, 44, 'jual beli', '0.30657213140003486', NULL, NULL),
(57, 50, 'jual beli', '0.28052845649649333', NULL, NULL),
(58, 41, 'jual beli', '0.28051695783529', NULL, NULL),
(59, 49, 'jual beli', '0.24399889619963125', NULL, NULL),
(60, 55, 'jual beli', '0.23355363270109192', NULL, NULL),
(61, 87, 'jual beli', '0.04111447636340033', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hadits`
--
ALTER TABLE `hadits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jaccard`
--
ALTER TABLE `jaccard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `similarity`
--
ALTER TABLE `similarity`
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
-- AUTO_INCREMENT for table `hadits`
--
ALTER TABLE `hadits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `jaccard`
--
ALTER TABLE `jaccard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `similarity`
--
ALTER TABLE `similarity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
