-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2023 at 12:49 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `springmvcbasicfree`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `code`, `name`) VALUES
(1, NULL, NULL, NULL, NULL, 'the-thao', 'Thể Thao'),
(2, NULL, NULL, NULL, NULL, 'the-gioi', 'Thế Giới'),
(3, NULL, NULL, NULL, NULL, 'chinh-tri', 'Chính Trị'),
(4, NULL, NULL, NULL, NULL, 'thoi-su', 'Thời Sự'),
(5, NULL, NULL, NULL, NULL, 'goc-nhin', 'Góc Nhìn'),
(6, NULL, NULL, NULL, NULL, 'kinh-doanh', 'Kinh Doanh'),
(7, NULL, NULL, NULL, NULL, 'giai-tri', 'Giải Trí'),
(8, NULL, NULL, NULL, NULL, 'suc-khoe', 'Sức khỏe'),
(9, NULL, NULL, NULL, NULL, 'doi-song', 'Đời sống'),
(10, NULL, NULL, NULL, NULL, 'phap-luat', 'Pháp luật'),
(11, NULL, NULL, NULL, NULL, 'bat-dong-san', 'Bất động sản');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `content` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `new_id` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `parent_id`, `content`, `user_id`, `new_id`, `createddate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(11, NULL, 'hola', 4, 17, '2023-05-14 14:41:00', '2023-05-14 14:41:00', 'admin', 'admin'),
(12, 11, 'Trả lời: @Trịnh Huỳnh Chấn Quang xin chào', 4, 17, '2023-05-14 14:41:18', '2023-05-14 14:41:18', 'admin', 'admin'),
(14, 13, 'Trả lời: @Trương Tùng Lâm hơi khỏe ', 17, 17, '2023-05-15 09:05:46', '2023-05-15 09:05:46', 'cathong', 'cathong'),
(15, 12, 'Trả lời: @Trịnh Huỳnh Chấn Quang hola', 125, 17, '2023-05-15 15:31:32', '2023-05-15 15:31:32', 'truongtunglam', 'truongtunglam'),
(16, 15, 'Trả lời: @Trương Tùng Lâm hola\r\n', 17, 17, '2023-05-15 15:31:55', '2023-05-15 15:31:55', 'cathong', 'cathong'),
(17, NULL, 'dcm\r\n', 4, 17, '2023-05-16 09:43:38', '2023-05-16 09:43:38', 'admin', 'admin'),
(18, 17, 'Trả lời: @Trịnh Huỳnh Chấn Quang cmm', 4, 17, '2023-05-16 09:43:46', '2023-05-16 09:43:46', 'admin', 'admin'),
(19, 18, 'Trả lời: @Trịnh Huỳnh Chấn Quang cc', 128, 17, '2023-05-16 09:44:34', '2023-05-16 09:44:34', 'toan', 'toan'),
(20, NULL, 'haha', 7, 63, '2023-05-16 10:17:40', '2023-05-16 10:17:40', 'quangvk', 'quangvk'),
(21, NULL, 'hahahaha\r\n', 4, 17, '2023-05-17 02:33:08', '2023-05-17 02:33:08', 'admin', 'admin'),
(22, 16, 'Trả lời: @Huỳnh Thị Thu Hồng ok', 132, 17, '2023-05-17 02:40:49', '2023-05-17 02:40:49', 'tientran9702', 'tientran9702'),
(26, 11, 'Trả lời: @Trịnh Huỳnh Chấn Quang chiến', 4, 17, '2023-05-19 10:29:44', '2023-05-19 10:29:44', 'admin', 'admin'),
(27, 22, 'Trả lời: @Tran Nguyen Tien kkk', 4, 17, '2023-05-19 10:31:27', '2023-05-19 10:31:27', 'admin', 'admin'),
(28, 20, 'Trả lời: @Trịnh Huỳnh Chấn Quang kkk', 4, 63, '2023-05-20 16:13:26', '2023-05-20 16:13:26', 'admin', 'admin'),
(29, NULL, 'huhu vô địch lâu ghê\r\n', 4, 60, '2023-05-21 12:36:27', '2023-05-21 12:36:27', 'admin', 'admin'),
(30, 27, 'Trả lời: @Twinkle lololo', 4, 17, '2023-06-01 02:46:10', '2023-06-01 02:46:10', 'admin', 'admin'),
(31, NULL, 'asdasd', 4, 20, '2023-06-01 02:57:34', '2023-06-01 02:57:34', 'admin', 'admin'),
(32, 31, 'Trả lời: @Twinkle adsadas', 4, 20, '2023-06-01 02:57:39', '2023-06-01 02:57:39', 'admin', 'admin'),
(33, 12, 'Trả lời: @Twinkle dasda', 144, 17, '2023-06-02 04:20:22', '2023-06-02 04:20:22', 'tu', 'tu'),
(34, 29, 'Trả lời: @Twinkle hjknjkn', 4, 60, '2023-06-21 15:33:14', '2023-06-21 15:33:14', 'admin', 'admin'),
(35, NULL, 'asd', 4, 17, '2023-07-09 15:22:02', '2023-07-09 15:22:02', 'admin', 'admin'),
(36, 35, 'Trả lời: @Twinkle 1213241312', 4, 17, '2023-07-09 15:22:14', '2023-07-09 15:22:14', 'admin', 'admin'),
(37, 36, 'Trả lời: @Twinkle cc', 4, 17, '2023-07-09 15:23:04', '2023-07-09 15:23:04', 'admin', 'admin'),
(38, 33, 'Trả lời: @Nguyễn Thanh Tú asdasdasdasd', 4, 17, '2023-07-10 02:54:13', '2023-07-10 02:54:13', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `comment_post`
--

CREATE TABLE `comment_post` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `modifiedby` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment_post`
--

INSERT INTO `comment_post` (`id`, `user_id`, `post_id`, `parent_id`, `content`, `thumbnail`, `createddate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(5, 4, 19, NULL, 'hay z 3', NULL, '2023-05-22 13:32:12', '2023-05-22 13:32:12', 'admin', 'admin'),
(10, 17, 19, NULL, 'ok la', NULL, '2023-05-22 13:52:15', '2023-05-22 13:52:15', 'cathong', 'cathong'),
(12, 17, 13, NULL, 'đẹp quá', NULL, '2023-05-22 13:57:54', '2023-05-22 13:57:54', 'cathong', 'cathong'),
(13, 17, 18, NULL, 'quang', NULL, '2023-05-22 23:25:10', '2023-05-22 23:25:11', 'admin', 'admin'),
(19, 4, 18, NULL, 'hehe', NULL, '2023-05-22 23:58:50', '2023-05-22 23:58:50', 'admin', 'admin'),
(20, 4, 16, NULL, 'haha', NULL, '2023-05-23 01:21:41', '2023-05-23 01:21:41', 'admin', 'admin'),
(21, 4, 16, NULL, 'kkkk', NULL, '2023-05-23 01:23:13', '2023-05-23 01:23:13', 'admin', 'admin'),
(22, 4, 16, NULL, 'vcl', NULL, '2023-05-23 01:23:39', '2023-05-23 01:23:39', 'admin', 'admin'),
(23, 4, 16, NULL, 'ui hay z', NULL, '2023-05-23 01:23:54', '2023-05-23 01:23:54', 'admin', 'admin'),
(24, 4, 19, NULL, 'hehe', NULL, '2023-05-23 01:24:28', '2023-05-23 01:24:28', 'admin', 'admin'),
(25, 4, 16, NULL, 'aloalo', NULL, '2023-05-23 01:27:44', '2023-05-23 01:27:44', 'admin', 'admin'),
(26, 4, 16, NULL, 'hehe', NULL, '2023-05-23 01:28:11', '2023-05-23 01:28:11', 'admin', 'admin'),
(27, 4, 16, NULL, 'quang', NULL, '2023-05-23 01:29:41', '2023-05-23 01:29:41', 'admin', 'admin'),
(28, 4, 16, NULL, 'chấn quang', NULL, '2023-05-23 01:30:04', '2023-05-23 01:30:04', 'admin', 'admin'),
(29, 4, 16, NULL, 'tui hay nè', NULL, '2023-05-23 01:30:44', '2023-05-23 01:30:44', 'admin', 'admin'),
(30, 4, 16, NULL, 'good job', NULL, '2023-05-23 01:31:03', '2023-05-23 01:31:03', 'admin', 'admin'),
(31, 4, 16, NULL, 'vcl', NULL, '2023-05-23 01:38:45', '2023-05-23 01:38:45', 'admin', 'admin'),
(32, 4, 16, NULL, 'vcl', NULL, '2023-05-23 01:38:47', '2023-05-23 01:38:47', 'admin', 'admin'),
(33, 4, 16, NULL, 'vcl', NULL, '2023-05-23 01:38:50', '2023-05-23 01:38:50', 'admin', 'admin'),
(34, 4, 16, NULL, '', NULL, '2023-05-23 01:39:10', '2023-05-23 01:39:10', 'admin', 'admin'),
(35, 4, 16, NULL, 'haha', NULL, '2023-05-23 01:39:16', '2023-05-23 01:39:16', 'admin', 'admin'),
(36, 4, 16, NULL, 'haha', NULL, '2023-05-23 01:39:25', '2023-05-23 01:39:25', 'admin', 'admin'),
(37, 17, 18, NULL, 'alo 123', NULL, '2023-05-23 02:37:55', '2023-05-23 02:37:55', 'cathong', 'cathong'),
(38, 133, 19, NULL, 'haha', NULL, '2023-05-23 12:48:33', '2023-05-23 12:48:33', 'kiembeo', 'kiembeo'),
(39, 4, 22, NULL, 'comment 1', NULL, '2023-05-23 13:14:53', '2023-05-23 13:14:53', 'admin', 'admin'),
(40, 4, 23, NULL, 'ok ko', NULL, '2023-05-23 13:15:20', '2023-05-23 13:15:20', 'admin', 'admin'),
(41, 4, 25, NULL, 'comment 1', NULL, '2023-05-23 13:20:27', '2023-05-23 13:20:27', 'admin', 'admin'),
(46, 4, 25, NULL, 'hahaha', NULL, '2023-05-23 14:32:14', '2023-05-23 14:32:14', 'admin', 'admin'),
(47, 4, 25, NULL, 'đẹp trai', NULL, '2023-05-23 14:49:43', '2023-05-23 14:49:43', 'admin', 'admin'),
(63, 125, 23, NULL, 'hay nè', NULL, '2023-05-23 15:20:40', '2023-05-23 15:20:40', 'truongtunglam', 'truongtunglam'),
(64, 125, 25, NULL, 'hay nè', NULL, '2023-05-23 15:21:05', '2023-05-23 15:21:05', 'truongtunglam', 'truongtunglam'),
(65, 125, 25, NULL, 'hay nè', NULL, '2023-05-23 15:21:39', '2023-05-23 15:21:39', 'truongtunglam', 'truongtunglam'),
(66, 125, 19, NULL, 'đẹp trai v', NULL, '2023-05-23 15:24:30', '2023-05-23 15:24:30', 'truongtunglam', 'truongtunglam'),
(67, 4, 23, NULL, 'ổn', NULL, '2023-05-23 17:13:46', '2023-05-23 17:13:46', 'admin', 'admin'),
(68, 4, 22, NULL, 'ngầu', NULL, '2023-05-23 17:13:56', '2023-05-23 17:13:56', 'admin', 'admin'),
(69, 4, 19, NULL, 'ok v', NULL, '2023-05-23 17:16:36', '2023-05-23 17:16:36', 'admin', 'admin'),
(70, 4, 18, NULL, 'gorgeous', NULL, '2023-05-23 17:17:04', '2023-05-23 17:17:04', 'admin', 'admin'),
(71, 4, 25, NULL, 'ok', NULL, '2023-05-23 17:18:22', '2023-05-23 17:18:22', 'admin', 'admin'),
(72, 4, 23, NULL, 'gg', NULL, '2023-05-23 17:19:40', '2023-05-23 17:19:40', 'admin', 'admin'),
(73, 4, 22, NULL, 'kkk', NULL, '2023-05-23 17:19:56', '2023-05-23 17:19:56', 'admin', 'admin'),
(74, 4, 16, NULL, 'ok la', NULL, '2023-05-24 23:16:59', '2023-05-24 23:16:59', 'admin', 'admin'),
(75, 4, 16, NULL, 'hay v', NULL, '2023-05-25 01:36:23', '2023-05-25 01:36:23', 'admin', 'admin'),
(76, 4, 16, NULL, 'vc', NULL, '2023-05-25 01:36:41', '2023-05-25 01:36:41', 'admin', 'admin'),
(77, 4, 16, NULL, 'hay nè', NULL, '2023-05-25 01:40:44', '2023-05-25 01:40:44', 'admin', 'admin'),
(78, 4, 16, NULL, 'ok la', NULL, '2023-05-25 01:44:18', '2023-05-25 01:44:18', 'admin', 'admin'),
(79, 4, 16, NULL, 'vcc', NULL, '2023-05-25 01:44:33', '2023-05-25 01:44:33', 'admin', 'admin'),
(80, 4, 16, NULL, 'hay z', NULL, '2023-05-25 01:44:52', '2023-05-25 01:44:52', 'admin', 'admin'),
(81, 4, 22, NULL, 'vl', NULL, '2023-05-25 01:50:08', '2023-05-25 01:50:08', 'admin', 'admin'),
(82, 4, 19, NULL, 'haha', NULL, '2023-05-25 01:51:32', '2023-05-25 01:51:32', 'admin', 'admin'),
(83, 4, 19, NULL, 'kkkk', NULL, '2023-05-25 01:54:19', '2023-05-25 01:54:19', 'admin', 'admin'),
(87, 4, 25, NULL, 'gg', NULL, '2023-05-25 02:04:08', '2023-05-25 02:04:08', 'admin', 'admin'),
(88, 4, 25, NULL, 'ok la', NULL, '2023-05-25 02:07:43', '2023-05-25 02:07:43', 'admin', 'admin'),
(89, 4, 25, NULL, 'vcl', NULL, '2023-05-25 02:07:53', '2023-05-25 02:07:53', 'admin', 'admin'),
(90, 4, 25, NULL, 'gg', NULL, '2023-05-25 02:08:26', '2023-05-25 02:08:26', 'admin', 'admin'),
(91, 4, 25, NULL, 'haha', NULL, '2023-05-25 02:09:24', '2023-05-25 02:09:24', 'admin', 'admin'),
(92, 4, 25, NULL, 'og', NULL, '2023-05-25 02:10:02', '2023-05-25 02:10:02', 'admin', 'admin'),
(93, 4, 25, NULL, 'qwe', NULL, '2023-05-25 02:10:57', '2023-05-25 02:10:57', 'admin', 'admin'),
(94, 4, 23, NULL, 'hehe', NULL, '2023-05-25 02:11:43', '2023-05-25 02:11:43', 'admin', 'admin'),
(95, 4, 22, NULL, 'ohh wow!', NULL, '2023-05-25 02:11:51', '2023-05-25 02:11:51', 'admin', 'admin'),
(96, 4, 19, NULL, 'dc v', NULL, '2023-05-25 02:13:04', '2023-05-25 02:13:04', 'admin', 'admin'),
(97, 4, 19, NULL, 'hehe', NULL, '2023-05-25 02:13:09', '2023-05-25 02:13:09', 'admin', 'admin'),
(98, 4, 25, NULL, 'comment 1', NULL, '2023-05-25 02:30:25', '2023-05-25 02:30:25', 'admin', 'admin'),
(99, 4, 13, NULL, 'đẹp ghia', NULL, '2023-05-25 02:31:34', '2023-05-25 02:31:34', 'admin', 'admin'),
(103, 135, 32, NULL, 'căng ko :D', NULL, '2023-05-25 02:49:50', '2023-05-25 02:49:50', 'hoang', 'hoang'),
(104, 135, 33, NULL, 'ok la', NULL, '2023-05-25 02:50:20', '2023-05-25 02:50:20', 'hoang', 'hoang'),
(105, 135, 33, NULL, 'kkkk', NULL, '2023-05-25 02:50:29', '2023-05-25 02:50:29', 'hoang', 'hoang'),
(106, 135, 25, NULL, 'ngầu :D', NULL, '2023-05-25 02:50:54', '2023-05-25 02:50:54', 'hoang', 'hoang'),
(107, 125, 18, NULL, 'aloalo', NULL, '2023-05-27 00:51:48', '2023-05-27 00:51:48', 'truongtunglam', 'truongtunglam'),
(108, 137, 25, NULL, 'alo :D', NULL, '2023-05-27 02:49:21', '2023-05-27 02:49:21', 'thienphu', 'thienphu'),
(109, 4, 36, NULL, 'vcl', NULL, '2023-05-27 10:14:32', '2023-05-27 10:14:32', 'admin', 'admin'),
(110, 4, 24, NULL, 'haha', NULL, '2023-05-27 10:40:08', '2023-05-27 10:40:08', 'admin', 'admin'),
(111, 4, 24, NULL, 'dữ z', NULL, '2023-05-27 10:40:15', '2023-05-27 10:40:15', 'admin', 'admin'),
(112, 4, 24, NULL, 'hoho', NULL, '2023-05-28 02:36:46', '2023-05-28 02:36:46', 'admin', 'admin'),
(113, 4, 34, NULL, 'vcl', NULL, '2023-05-31 15:39:12', '2023-05-31 15:39:12', 'admin', 'admin'),
(114, 4, 25, NULL, 'alo\r\n', NULL, '2023-06-01 02:44:49', '2023-06-01 02:44:49', 'admin', 'admin'),
(115, 4, 23, NULL, 'kkkk', NULL, '2023-06-01 02:45:09', '2023-06-01 02:45:09', 'admin', 'admin'),
(116, 143, 18, NULL, 'lalala', NULL, '2023-06-01 02:55:38', '2023-06-01 02:55:38', 'ngoquocan', 'ngoquocan'),
(117, 4, 36, NULL, 'asd', NULL, '2023-06-02 04:18:41', '2023-06-02 04:18:41', 'admin', 'admin'),
(118, 144, 23, NULL, 'sdasd', NULL, '2023-06-02 04:22:33', '2023-06-02 04:22:33', 'tu', 'tu'),
(119, 4, 30, NULL, 'hvhvh', NULL, '2023-06-21 15:31:41', '2023-06-21 15:31:41', 'admin', 'admin'),
(120, 4, 30, NULL, 'jjnjnjk', NULL, '2023-06-21 15:31:44', '2023-06-21 15:31:44', 'admin', 'admin'),
(121, 4, 44, NULL, 'asdasd', NULL, '2023-07-09 15:19:31', '2023-07-09 15:19:31', 'admin', 'admin'),
(122, 4, 35, NULL, 'ccc', NULL, '2023-07-09 15:20:32', '2023-07-09 15:20:32', 'admin', 'admin'),
(123, 4, 33, NULL, 'hgghguhb', NULL, '2023-07-10 03:00:16', '2023-07-10 03:00:16', 'admin', 'admin'),
(124, 4, 45, NULL, 'asdasd', NULL, '2023-07-24 14:12:53', '2023-07-24 14:12:53', 'admin', 'admin'),
(125, 4, 13, NULL, 'asdasd', NULL, '2023-07-24 14:13:41', '2023-07-24 14:13:41', 'admin', 'admin'),
(126, 7, 43, NULL, 'holaa', NULL, '2023-09-11 10:32:05', '2023-09-11 10:32:05', 'quangvk', 'quangvk'),
(127, 7, 48, NULL, 'aloha ', 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694859762/kryjkkcrdvresncatjam.jpg', '2023-09-16 10:22:43', '2023-09-16 10:22:43', 'quangvk', 'quangvk'),
(128, 7, 23, NULL, 'okla ', NULL, '2023-09-16 10:23:29', '2023-09-16 10:23:29', 'quangvk', 'quangvk'),
(129, 7, 23, NULL, '', 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694859822/sovbdgsa9vryhpnevqpi.jpg', '2023-09-16 10:23:43', '2023-09-16 10:23:43', 'quangvk', 'quangvk'),
(130, 4, 50, NULL, 'vvcl', NULL, '2023-09-16 10:33:21', '2023-09-16 10:33:21', 'admin', 'admin'),
(131, 4, 48, NULL, 'haha', NULL, '2023-09-16 10:33:28', '2023-09-16 10:33:28', 'admin', 'admin'),
(132, 4, 46, NULL, 'gafa', 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694860421/ltuwvxaktufgsz9jhou7.jpg', '2023-09-16 10:33:42', '2023-09-16 10:33:42', 'admin', 'admin'),
(133, 7, 25, NULL, 'hehe', NULL, '2023-09-16 10:39:00', '2023-09-16 10:39:00', 'quangvk', 'quangvk');

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE `friendship` (
  `id` bigint(20) NOT NULL,
  `requester_id` bigint(20) DEFAULT NULL,
  `addressee_id` bigint(20) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `friendship`
--

INSERT INTO `friendship` (`id`, `requester_id`, `addressee_id`, `status`, `createddate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(76, 125, 4, b'1', '2023-05-15 15:30:58', '2023-05-15 15:30:58', 'truongtunglam', 'truongtunglam'),
(80, 4, 8, b'1', '2023-05-15 15:34:25', '2023-05-15 15:34:25', 'admin', 'admin'),
(84, 4, 128, b'1', '2023-05-15 16:43:18', '2023-05-15 16:43:18', 'admin', 'admin'),
(85, 4, 129, b'1', '2023-05-15 16:43:34', '2023-05-15 16:43:34', 'admin', 'admin'),
(86, 4, 130, b'1', '2023-05-15 16:44:23', '2023-05-15 16:44:23', 'admin', 'admin'),
(87, 4, 127, b'1', '2023-05-15 16:45:19', '2023-05-15 16:45:19', 'admin', 'admin'),
(88, 128, 7, b'1', '2023-05-16 09:45:50', '2023-05-16 09:46:11', 'toan', 'quangvk'),
(91, 17, 128, b'1', '2023-05-16 12:51:43', '2023-05-16 12:51:43', 'cathong', 'cathong'),
(92, 17, 129, b'1', '2023-05-16 12:58:39', '2023-05-16 12:58:39', 'cathong', 'cathong'),
(93, 17, 125, b'1', '2023-05-16 12:59:04', '2023-05-16 12:59:04', 'cathong', 'cathong'),
(95, 17, 7, b'0', '2023-05-21 04:46:05', '2023-05-21 04:46:05', 'cathong', 'cathong'),
(97, 4, 133, b'1', '2023-05-23 12:47:40', '2023-05-23 12:48:25', 'admin', 'kiembeo'),
(100, 17, 4, b'1', '2023-05-23 13:19:19', '2023-05-23 13:19:44', 'cathong', 'admin'),
(101, 7, 4, b'1', '2023-05-24 23:41:37', '2023-05-24 23:41:37', 'quangvk', 'quangvk'),
(102, 4, 135, b'1', '2023-05-25 02:51:44', '2023-05-25 02:52:08', 'admin', 'hoang'),
(103, 135, 125, b'0', '2023-05-25 02:52:38', '2023-05-25 02:52:38', 'hoang', 'hoang'),
(104, 135, 17, b'0', '2023-05-25 02:52:41', '2023-05-25 02:52:41', 'hoang', 'hoang'),
(105, 136, 4, b'1', '2023-05-26 13:07:49', '2023-05-26 13:07:49', 'thanhbinh', 'thanhbinh'),
(106, 4, 137, b'1', '2023-05-26 13:09:59', '2023-05-26 13:09:59', 'admin', 'admin'),
(107, 4, 132, b'0', '2023-05-26 16:49:40', '2023-05-26 16:49:40', 'admin', 'admin'),
(108, 143, 4, b'1', '2023-06-01 02:53:49', '2023-06-01 02:54:59', 'ngoquocan', 'admin'),
(109, 143, 8, b'0', '2023-06-01 02:55:54', '2023-06-01 02:55:54', 'ngoquocan', 'ngoquocan'),
(110, 4, 144, b'1', '2023-06-02 04:21:31', '2023-06-02 04:21:41', 'admin', 'tu'),
(111, 4, 126, b'0', '2023-07-15 03:49:48', '2023-07-15 03:49:48', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `like_post`
--

CREATE TABLE `like_post` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` char(50) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `modifiedby` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `like_post`
--

INSERT INTO `like_post` (`id`, `user_id`, `post_id`, `status`, `createddate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(23, 4, 18, 'LIKE', '2023-05-24 10:59:34', '2023-05-24 10:59:34', 'admin', 'admin'),
(35, 17, 25, 'LIKE', '2023-05-24 12:47:09', '2023-05-24 12:47:09', 'cathong', 'cathong'),
(36, 17, 23, 'LIKE', '2023-05-24 12:47:11', '2023-05-24 12:47:11', 'cathong', 'cathong'),
(37, 17, 22, 'LIKE', '2023-05-24 12:47:13', '2023-05-24 12:47:13', 'cathong', 'cathong'),
(38, 17, 19, 'LIKE', '2023-05-24 12:47:16', '2023-05-24 12:47:16', 'cathong', 'cathong'),
(39, 17, 18, 'LIKE', '2023-05-24 12:47:19', '2023-05-24 12:47:19', 'cathong', 'cathong'),
(40, 17, 16, 'LIKE', '2023-05-24 12:47:22', '2023-05-24 12:47:22', 'cathong', 'cathong'),
(52, 125, 19, 'LIKE', '2023-05-24 14:03:41', '2023-05-24 14:03:41', 'truongtunglam', 'truongtunglam'),
(59, 125, 24, 'LIKE', '2023-05-24 14:17:30', '2023-05-24 14:17:30', 'truongtunglam', 'truongtunglam'),
(79, 4, 16, 'LIKE', '2023-05-25 02:16:41', '2023-05-25 02:16:41', 'admin', 'admin'),
(90, 125, 30, 'LIKE', '2023-05-25 02:34:52', '2023-05-25 02:34:52', 'truongtunglam', 'truongtunglam'),
(92, 135, 32, 'LIKE', '2023-05-25 02:49:44', '2023-05-25 02:49:44', 'hoang', 'hoang'),
(93, 135, 33, 'LIKE', '2023-05-25 02:50:17', '2023-05-25 02:50:17', 'hoang', 'hoang'),
(94, 135, 25, 'LIKE', '2023-05-25 02:50:46', '2023-05-25 02:50:46', 'hoang', 'hoang'),
(95, 135, 23, 'LIKE', '2023-05-25 02:51:01', '2023-05-25 02:51:01', 'hoang', 'hoang'),
(96, 135, 22, 'LIKE', '2023-05-25 02:51:04', '2023-05-25 02:51:04', 'hoang', 'hoang'),
(97, 135, 19, 'LIKE', '2023-05-25 02:51:06', '2023-05-25 02:51:06', 'hoang', 'hoang'),
(99, 135, 16, 'LIKE', '2023-05-25 02:51:12', '2023-05-25 02:51:12', 'hoang', 'hoang'),
(101, 135, 18, 'LIKE', '2023-05-27 00:44:58', '2023-05-27 00:44:58', 'hoang', 'hoang'),
(102, 125, 25, 'LIKE', '2023-05-27 00:46:02', '2023-05-27 00:46:02', 'truongtunglam', 'truongtunglam'),
(103, 125, 16, 'LIKE', '2023-05-27 00:46:07', '2023-05-27 00:46:07', 'truongtunglam', 'truongtunglam'),
(105, 137, 25, 'LIKE', '2023-05-27 02:49:01', '2023-05-27 02:49:01', 'thienphu', 'thienphu'),
(106, 137, 36, 'LIKE', '2023-05-27 02:51:10', '2023-05-27 02:51:10', 'thienphu', 'thienphu'),
(115, 8, 23, 'LIKE', '2023-05-28 03:12:41', '2023-05-28 03:12:41', 'nguyenvana', 'nguyenvana'),
(116, 8, 19, 'LIKE', '2023-05-28 03:12:58', '2023-05-28 03:12:58', 'nguyenvana', 'nguyenvana'),
(140, 4, 23, 'LIKE', '2023-05-31 16:42:09', '2023-05-31 16:42:09', 'admin', 'admin'),
(167, 4, 22, 'LIKE', '2023-05-31 16:49:08', '2023-05-31 16:49:08', 'admin', 'admin'),
(169, 4, 19, 'LIKE', '2023-05-31 16:49:14', '2023-05-31 16:49:14', 'admin', 'admin'),
(176, 143, 44, 'LIKE', '2023-06-01 02:53:35', '2023-06-01 02:53:35', 'ngoquocan', 'ngoquocan'),
(178, 143, 18, 'LIKE', '2023-06-01 02:55:31', '2023-06-01 02:55:31', 'ngoquocan', 'ngoquocan'),
(179, 143, 19, 'LIKE', '2023-06-01 02:55:42', '2023-06-01 02:55:42', 'ngoquocan', 'ngoquocan'),
(180, 143, 25, 'LIKE', '2023-06-01 02:55:44', '2023-06-01 02:55:44', 'ngoquocan', 'ngoquocan'),
(184, 144, 45, 'LIKE', '2023-06-02 04:21:01', '2023-06-02 04:21:01', 'tu', 'tu'),
(185, 144, 25, 'LIKE', '2023-06-02 04:22:14', '2023-06-02 04:22:14', 'tu', 'tu'),
(186, 144, 19, 'LIKE', '2023-06-02 04:22:19', '2023-06-02 04:22:19', 'tu', 'tu'),
(187, 144, 42, 'LIKE', '2023-06-02 04:22:24', '2023-06-02 04:22:24', 'tu', 'tu'),
(189, 144, 23, 'LIKE', '2023-06-02 04:22:29', '2023-06-02 04:22:29', 'tu', 'tu'),
(190, 144, 43, 'LIKE', '2023-06-02 04:22:37', '2023-06-02 04:22:37', 'tu', 'tu'),
(191, 144, 18, 'LIKE', '2023-06-02 04:22:38', '2023-06-02 04:22:38', 'tu', 'tu'),
(195, 4, 43, 'LIKE', '2023-06-03 13:47:46', '2023-06-03 13:47:46', 'admin', 'admin'),
(196, 4, 42, 'LIKE', '2023-06-03 13:47:49', '2023-06-03 13:47:49', 'admin', 'admin'),
(198, 4, 34, 'LIKE', '2023-06-21 15:30:01', '2023-06-21 15:30:01', 'admin', 'admin'),
(203, 4, 44, 'LIKE', '2023-07-09 15:19:37', '2023-07-09 15:19:37', 'admin', 'admin'),
(206, 4, 45, 'LIKE', '2023-07-24 14:12:47', '2023-07-24 14:12:47', 'admin', 'admin'),
(208, 4, 13, 'LIKE', '2023-07-24 14:13:29', '2023-07-24 14:13:29', 'admin', 'admin'),
(209, 4, 32, 'LIKE', '2023-07-24 14:14:22', '2023-07-24 14:14:22', 'admin', 'admin'),
(212, 4, 35, 'LIKE', '2023-08-27 10:51:22', '2023-08-27 10:51:22', 'admin', 'admin'),
(215, 7, 22, 'LIKE', '2023-08-29 14:34:35', '2023-08-29 14:34:35', 'quangvk', 'quangvk'),
(217, 7, 43, 'LIKE', '2023-09-11 10:31:59', '2023-09-11 10:31:59', 'quangvk', 'quangvk'),
(220, 7, 49, 'LIKE', '2023-09-16 10:22:05', '2023-09-16 10:22:05', 'quangvk', 'quangvk'),
(221, 7, 23, 'LIKE', '2023-09-16 10:23:23', '2023-09-16 10:23:23', 'quangvk', 'quangvk'),
(222, 4, 50, 'LIKE', '2023-09-16 10:33:18', '2023-09-16 10:33:18', 'admin', 'admin'),
(223, 7, 52, 'LIKE', '2023-09-16 10:48:16', '2023-09-16 10:48:16', 'quangvk', 'quangvk'),
(224, 7, 51, 'LIKE', '2023-09-16 10:48:17', '2023-09-16 10:48:17', 'quangvk', 'quangvk');

-- --------------------------------------------------------

--
-- Table structure for table `new`
--

CREATE TABLE `new` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `shortdescription` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `new`
--

INSERT INTO `new` (`id`, `title`, `thumbnail`, `shortdescription`, `content`, `category_id`, `createddate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(17, 'Chiến lược \'im lặng là vàng\' của Tổng thống Biden trước vụ ông Trump bị truy tố', 'https://res.cloudinary.com/dxctlgwec/image/upload/lg9iso714rxlfzrgcjjw', 'Chiến lược \'im lặng là vàng\' của Tổng thống Biden trước vụ ông Trump bị truy tố. Thông tin cựu Tổng thống Donald Trump bị truy tố hình sự đã khuấy đảo chính trường Mỹ bởi trong lịch sử Mỹ chưa từng có cựu tổng thống hay tổng thống đương nhiệm nào dính vào rắc rối pháp lý lớn như vậy.', '<p><strong>Kh&ocirc;ng chỉ bản th&acirc;n &ocirc;ng Trump, nhiều ch&iacute;nh trị gia Mỹ đ&atilde; l&ecirc;n tiếng về vụ việc. Chưa r&otilde; kết cục sẽ ra sao nhưng chắc chắn vụ việc đ&atilde; tạo ra một tiền lệ mới m&agrave; theo giới ph&acirc;n t&iacute;ch ch&iacute;nh trị l&agrave; khiến nước Mỹ thay đổi. Gần hơn th&igrave; cuộc đua v&agrave;o Nh&agrave; Trắng năm 2024 sẽ trở n&ecirc;n bất định. &Ocirc;ng Trump vốn đ&atilde; khởi động chiến dịch vận động tranh cử.</strong></p>\n\n<p>Thế nhưng, &ocirc;ng Biden &ndash; người kế nhiệm &ocirc;ng Trump cũng l&agrave; người đ&atilde; chiến thắng trước &ocirc;ng Trump &ndash; lại chọn chiến lược kh&ocirc;ng b&igrave;nh luận.</p>\n\n<p>&quot;T&ocirc;i sẽ kh&ocirc;ng n&oacute;i về bản c&aacute;o trạng của &ocirc;ng Trump&quot;, Tổng thống Biden nhấn mạnh nhiều lần khi ph&oacute;ng vi&ecirc;n hỏi.</p>\n\n<p>Reuters đ&atilde; m&ocirc; tả chiến lược n&agrave;y của &ocirc;ng Biden rằng &quot;im lặng l&agrave; v&agrave;ng&quot;.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/3/biden-1680491025983869425035.jpg\" target=\"_blank\" title=\"Tổng thống Biden trước khi lên đường tới Mississippi thăm vùng bị ảnh hưởng bởi lốc xoáy hôm 31.3\"><img alt=\"Chiến lược \'im lặng là vàng\' của Tổng thống Biden trước vụ ông Trump bị truy tố - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/3/biden-1680491025983869425035.jpg\" title=\"Chiến lược \'im lặng là vàng\' của Tổng thống Biden trước vụ ông Trump bị truy tố - Ảnh 1.\" /></a></p>\n\n<p>Tổng thống Biden trước khi l&ecirc;n đường tới Mississippi thăm v&ugrave;ng bị ảnh hưởng bởi lốc xo&aacute;y h&ocirc;m 31.3</p>\n\n<p>REUTERS</p>\n\n<p>Tuy nhi&ecirc;n, kh&ocirc;ng chắc v&agrave;ng n&agrave;y sẽ ra sao bởi theo giới ph&acirc;n t&iacute;ch, n&oacute; sẽ bị thử th&aacute;ch trong những ng&agrave;y tới khi phi&ecirc;n t&ograve;a của &ocirc;ng Trump dự kiến sẽ diễn ra v&agrave;o ng&agrave;y 4.4. B&ecirc;n cạnh đ&oacute;, c&aacute;c đảng vi&ecirc;n Cộng h&ograve;a ủng hộ cựu tổng thống c&oacute; thể sẽ mở m&agrave;n những cuộc tấn c&ocirc;ng v&agrave;o hệ thống tư ph&aacute;p Mỹ, thậm ch&iacute; những nỗi lo ngại về biểu t&igrave;nh trở th&agrave;nh bạo lực cũng trở n&ecirc;n cận kề hơn.</p>\n\n<p>Khi chiến thắng trước &ocirc;ng Trump để đắc cử tổng thống, &ocirc;ng Biden đ&atilde; cam kết kh&ocirc;i phục &quot;linh hồn nước Mỹ&quot; sau 4 năm cầm quyền đầy hỗn loạn của người tiền nhiệm. Tr&ecirc;n cương vị tổng thống, &ocirc;ng Biden đ&atilde; chỉ tr&iacute;ch c&aacute;c ch&iacute;nh s&aacute;ch &quot;L&agrave;m cho nước Mỹ vĩ đại trở lại&quot; (MAGA) cũng như c&aacute;c đồng minh của &ocirc;ng Trump. Tuy nhi&ecirc;n, hiếm khi &ocirc;ng Biden chỉ tr&iacute;ch đ&iacute;ch danh &ocirc;ng Trump.</p>\n\n<p>C&aacute;c chiến lược gia của đảng D&acirc;n chủ cho rằng sự im lặng c&oacute; chủ đ&iacute;ch của Tổng thống Biden v&agrave; đội ngũ của &ocirc;ng mang &yacute; nghĩa ch&iacute;nh trị. Theo chiến lược gia Karen Finney, ch&iacute;nh quyền Biden n&ecirc;n tiếp tục những g&igrave; đ&atilde; l&agrave;m từ trước tới nay, tập trung v&agrave;o việc quản l&yacute; v&agrave; giải quyết c&aacute;c mối quan t&acirc;m của người Mỹ. &quot;Đ&acirc;y l&agrave; thời điểm để trấn an người Mỹ bằng c&aacute;ch tiếp tục chứng minh sự l&atilde;nh đạo mạnh mẽ, ổn định v&agrave; hiệu quả l&agrave; như thế n&agrave;o&quot;, Reuters dẫn lời &ocirc;ng n&oacute;i.</p>\n\n<p>Cựu Tổng thống Trump bị truy tố: Chuyện g&igrave; sẽ xảy ra?</p>\n\n<p>Lis Smith, một chiến lược gia D&acirc;n chủ kh&aacute;c đ&aacute;nh gi&aacute;: &quot;Họ đ&atilde; rất th&ocirc;ng minh khi đứng ngo&agrave;i cuộc. Hồi năm 2020, &ocirc;ng Biden được hưởng lợi từ sự mệt mỏi của cử tri với sự hỗn loạn của ch&iacute;nh quyền Trump. Sự đối lập khi Tổng thống Biden tập trung l&agrave;m tốt c&ocirc;ng việc của m&igrave;nh so với một &ocirc;ng Trump v&agrave; đảng Cộng h&ograve;a trong hỗn loạn sẽ chỉ gi&uacute;p &iacute;ch cho &ocirc;ng ấy&quot;.</p>\n\n<p>Nh&agrave; Trắng cho biết họ sẽ kh&ocirc;ng b&igrave;nh luận về vụ truy tố &ocirc;ng Trump v&igrave; đ&oacute; l&agrave; c&ocirc;ng t&aacute;c ri&ecirc;ng của Bộ Tư ph&aacute;p. &Ocirc;ng Biden đ&atilde; cam kết để cơ quan n&agrave;y l&agrave;m việc độc lập trong việc điều tra.</p>\n\n<p>Người ph&aacute;t ng&ocirc;n Nh&agrave; Trắng Karine Jean-Pierre h&ocirc;m 31.3 từ chối b&igrave;nh luận về bất kỳ biện ph&aacute;p ph&ograve;ng ngừa n&agrave;o m&agrave; ch&iacute;nh phủ li&ecirc;n bang c&oacute; thể thực hiện, ngoại trừ n&oacute;i rằng họ lu&ocirc;n chuẩn bị cho viễn cảnh bạo lực. B&agrave; nhấn mạnh Tổng thống Biden lu&ocirc;n ủng hộ mọi người &quot;biểu t&igrave;nh một c&aacute;ch &ocirc;n h&ograve;a&quot;.</p>\n\n<p>Theo c&aacute;c nguồn thạo tin, Tổng thống Biden coi &ocirc;ng Trump l&agrave; người ch&acirc;m ng&ograve;i cho c&aacute;c phong tr&agrave;o biểu t&igrave;nh nguy hiểm v&agrave; &ocirc;ng lu&ocirc;n cảnh b&aacute;o về t&iacute;nh cực đoan trong MAGA.</p>\n\n<p>Chiến lược gia D&acirc;n chủ Donna Brazile cho rằng nếu Tổng thống Biden vẫn chưa ch&iacute;nh thức tuy&ecirc;n bố m&igrave;nh l&agrave; ứng vi&ecirc;n trong cuộc bầu cử năm 2024 th&igrave; &ocirc;ng kh&ocirc;ng cần c&oacute; bất kỳ ph&aacute;t ng&ocirc;n n&agrave;o về t&igrave;nh h&igrave;nh của người tiền nhiệm.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Ng&ocirc; quoc an</p>\n', 3, '2023-03-29 20:25:03', '2023-09-16 16:48:43', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(19, 'Chính phủ Úc cấm TikTok', 'https://res.cloudinary.com/dxctlgwec/image/upload/myx206sbsuies5gay6gh', 'Chính phủ Úc ngày 4.4 đã tuyên bố sẽ xóa TikTok khỏi tất cả thiết bị thuộc sở hữu của chính phủ liên bang vì lo ngại bảo mật.', '<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/tiktok-1680584550832744605854.jpg\" target=\"_blank\" title=\"Chính phủ Úc sẽ xóa ứng dụng TikTok khỏi các thiết bị do chính phủ liên bang sở hữu\"><img alt=\"Chính phủ Úc cấm TikTok  - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/tiktok-1680584550832744605854.jpg\" title=\"Chính phủ Úc cấm TikTok  - Ảnh 1.\" /></a></p>\n\n<p>Ch&iacute;nh phủ &Uacute;c sẽ x&oacute;a ứng dụng&nbsp;<a href=\"https://thanhnien.vn/quan-chuc-my-vi-tiktok-nhu-ngua-go-thanh-troy-185230328232649805.htm\" title=\"Quan chức Mỹ ví TikTok như \'ngựa gỗ thành Troy\'\">TikTok</a>&nbsp;khỏi c&aacute;c thiết bị do ch&iacute;nh phủ li&ecirc;n bang sở hữu</p>\n\n<p>Reuters dẫn tuy&ecirc;n bố của Bộ trưởng Tư ph&aacute;p &Uacute;c Mark Dreyfus ng&agrave;y 4.4 cho biết nước n&agrave;y sẽ x&oacute;a ứng dụng&nbsp;<a href=\"https://thanhnien.vn/cac-nghi-si-my-da-quay-ceo-tiktok-nhu-the-nao-185230324230302004.htm\" target=\"_blank\" title=\"Các nghị sĩ Mỹ đã \'quay\'  CEO TikTok như thế nào ?\">TikTok</a>&nbsp;khỏi tất cả c&aacute;c thiết bị do ch&iacute;nh phủ li&ecirc;n bang sở hữu v&igrave; lo ngại về bảo mật.</p>\n\n<p>Trong tuy&ecirc;n bố, Bộ trưởng Dreyfus n&oacute;i lệnh cấm sẽ c&oacute; hiệu lực &quot;ngay khi c&oacute; thể&quot;, đồng thời cho biết th&ecirc;m rằng quyền miễn trừ sẽ chỉ được cấp sau khi xem x&eacute;t từng trường hợp cụ thể v&agrave; c&oacute; c&aacute;c biện ph&aacute;p an ninh th&iacute;ch hợp.</p>\n\n<p>Động th&aacute;i tr&ecirc;n cho thấy mối lo ngại của &Uacute;c với việc ch&iacute;nh phủ Trung Quốc c&oacute; thể sử dụng&nbsp;<a href=\"https://thanhnien.vn/gan-nua-dan-so-my-hoat-dong-tren-tiktok-185230321200722154.htm\" target=\"_blank\" title=\"\'Gần nửa dân số Mỹ hoạt động trên TikTok\'\">TikTok</a>, thuộc sở hữu của c&ocirc;ng ty Trung Quốc ByteDance, để thu thập dữ liệu của người d&ugrave;ng, l&agrave;m suy yếu lợi &iacute;ch an ninh của phương T&acirc;y.</p>\n\n<p>Với lệnh cấm của &Uacute;c, to&agrave;n bộ 5 th&agrave;nh vi&ecirc;n của li&ecirc;n minh chia sẻ th&ocirc;ng tin t&igrave;nh b&aacute;o Ngũ nh&atilde;n - bao gồm &Uacute;c, Canada, Mỹ, Anh v&agrave; New Zealand - đều cấm&nbsp;<a href=\"https://thanhnien.vn/giam-doc-fbi-canh-bao-nguy-co-tiktok-gay-hai-cho-an-ninh-my-185230309113855165.htm\" target=\"_blank\" title=\"Giám đốc FBI cảnh báo nguy cơ TikTok gây hại cho an ninh Mỹ\">TikTok</a>&nbsp;tr&ecirc;n thiết bị của ch&iacute;nh phủ. Ph&aacute;p, Bỉ v&agrave; Ủy ban ch&acirc;u &Acirc;u cũng đ&atilde; c&ocirc;ng bố c&aacute;c lệnh cấm tương tự.</p>\n\n<p>TikTok l&agrave;m g&igrave; khiến h&atilde;ng vũ kh&iacute; Na Uy kh&ocirc;ng thể tăng sản xuất đạn?</p>\n\n<p>B&aacute;o&nbsp;<em>The Australian</em>&nbsp;v&agrave;o cuối ng&agrave;y 3.4 đưa tin Thủ tướng &Uacute;c Anthony Albanese đ&atilde; đồng &yacute; với lệnh cấm sử dụng&nbsp;<a href=\"https://thanhnien.vn/nha-trang-ung-ho-du-luat-manh-tay-voi-tiktok-18523030809283385.htm\" target=\"_blank\" title=\"Nhà Trắng ủng hộ dự luật mạnh tay với TikTok\">TikTok</a>&nbsp;sau khi Bộ Nội vụ ho&agrave;n th&agrave;nh đ&aacute;nh gi&aacute;.</p>\n\n<p>Bộ trưởng Tư ph&aacute;p Dreyfus x&aacute;c nhận ch&iacute;nh phủ li&ecirc;n bang gần đ&acirc;y đ&atilde; nhận được b&aacute;o c&aacute;o &quot;Đ&aacute;nh gi&aacute; sự can thiệp của nước ngo&agrave;i th&ocirc;ng qua c&aacute;c ứng dụng truyền th&ocirc;ng x&atilde; hội&quot; v&agrave; c&aacute;c khuyến nghị của b&aacute;o c&aacute;o vẫn đang được xem x&eacute;t.</p>\n\n<p>Đ&aacute;p lại,&nbsp;<a href=\"https://thanhnien.vn/tiktok-doi-mat-kha-nang-bi-cam-cua-o-my-185230228072952146.htm\" target=\"_blank\" title=\"TikTok đối mặt khả năng bị cấm cửa ở Mỹ\">TikTok</a>&nbsp;cho biết họ &quot;v&ocirc; c&ugrave;ng thất vọng&quot; trước quyết định của &Uacute;c. C&ocirc;ng ty n&oacute;i rằng lệnh cấm c&oacute; mục đ&iacute;ch ch&iacute;nh trị, &quot;kh&ocirc;ng phải do t&igrave;nh h&igrave;nh thực tế&quot;.</p>\n\n<p>&quot;Kh&ocirc;ng c&oacute; bằng chứng cho thấy&nbsp;<a href=\"https://thanhnien.vn/tiktok-tiep-tuc-gap-kho-o-eu-canada-185230225003212494.htm\" target=\"_blank\" title=\"TikTok tiếp tục gặp khó ở EU, Canada\">TikTok</a>&nbsp;l&agrave; một rủi ro bảo mật đối với người &Uacute;c.&nbsp;<a href=\"https://thanhnien.vn/tiktok-tiep-tuc-gap-kho-o-eu-canada-185230225003212494.htm\" target=\"_blank\" title=\"TikTok tiếp tục gặp khó ở EU, Canada\">TikTok</a>&nbsp;kh&ocirc;ng n&ecirc;n bị đối xử kh&aacute;c biệt với c&aacute;c nền tảng truyền th&ocirc;ng x&atilde; hội kh&aacute;c&quot;, &ocirc;ng Lee Hunter, Gi&aacute;m đốc&nbsp;<a href=\"https://thanhnien.vn/tiktok-doi-mat-kha-nang-bi-cam-cua-o-my-185230228072952146.htm\" target=\"_blank\" title=\"TikTok đối mặt khả năng bị cấm cửa ở Mỹ\">TikTok</a>&nbsp;tại &Uacute;c v&agrave; New Zealand, cho biết trong một tuy&ecirc;n bố.</p>\n\n<p>Với lệnh cấm của &Uacute;c, c&aacute;c ch&iacute;nh trị gia vẫn c&oacute; thể sử dụng TikTok tr&ecirc;n điện thoại c&aacute; nh&acirc;n của m&igrave;nh. Tuy nhi&ecirc;n, Bộ trưởng Dịch vụ Ch&iacute;nh phủ li&ecirc;n bang Bill Shorten v&agrave; Thủ hiến Daniel Andrews của bang Victoria đ&atilde; quyết định x&oacute;a t&agrave;i khoản TikTok của họ.</p>\n\n<p>Tổng gi&aacute;m đốc TikTok bị nghị sĩ Mỹ &#39;quay&#39; tr&ecirc;n ghế n&oacute;ng</p>\n\n<p>Người ph&aacute;t ng&ocirc;n của bang Victoria cho biết ch&iacute;nh quyền bang cũng sẽ cấm ứng dụng n&agrave;y tr&ecirc;n c&aacute;c điện thoại do ch&iacute;nh quyền tiểu bang sở hữu.</p>\n', 2, '2023-03-29 20:26:05', '2023-09-16 16:31:29', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(20, 'Trung Quốc không có đại sứ tại Mỹ hơn 3 tháng, lâu nhất từ năm 1979', 'https://res.cloudinary.com/dxctlgwec/image/upload/u8kvruxnv4f4p6bb76bz', 'Bắc Kinh đã để trống vị trí đại sứ ở Washington trong hơn 3 tháng qua, khoảng thời gian dài nhất kể từ khi hai bên bình thường hóa quan hệ vào năm 1979.', '<p>Lần cuối c&ugrave;ng vị tr&iacute; n&agrave;y bị bỏ trống l&acirc;u l&agrave; v&agrave;o th&aacute;ng 6.1995 khi Trung Quốc triệu hồi đại sứ khi đ&oacute; l&agrave; L&yacute; Đạo Dự về nước trong hai th&aacute;ng. Khi đ&oacute;, quan hệ hai b&ecirc;n trở n&ecirc;n căng thẳng v&igrave; Washington cho ph&eacute;p nh&agrave; l&atilde;nh đạo Đ&agrave;i Loan L&yacute; Đăng Huy đến thăm Mỹ trước thềm một cuộc bầu cử gay cấn ở h&ograve;n đảo, theo&nbsp;<em>South China Morning Post</em>.</p>\n\n<p>Trung Quốc hiện kh&ocirc;ng c&oacute; đại sứ ở Washington DC sau khi &ocirc;ng Tần Cương được bổ nhiệm l&agrave;m ngoại trưởng Trung Quốc v&agrave;o cuối th&aacute;ng 12.2022 v&agrave; th&ocirc;i chức đại sứ v&agrave;o đầu th&aacute;ng 1 năm nay.</p>\n\n<p>Theo &ocirc;ng Charles Freeman, học giả kh&aacute;ch mời tại Đại học Brown (Mỹ), Trung Quốc &quot;đang xem x&eacute;t to&agrave;n diện những g&igrave; đang diễn ra, đặt vấn đề rằng c&oacute; đ&aacute;ng để đầu tư v&agrave;o quan hệ ngoại giao với Mỹ hay kh&ocirc;ng&quot;. &Ocirc;ng Freeman từng l&agrave; th&ocirc;ng dịch vi&ecirc;n của Tổng thống Mỹ Richard Nixon khi nh&agrave; l&atilde;nh đạo đến Bắc Kinh trong chuyến thăm mang t&iacute;nh bước ngoặt năm 1972.</p>\n\n<p>Đại sứ tiếp theo của Trung Quốc tại Mỹ được đồn đo&aacute;n l&agrave; &ocirc;ng Tạ Phong, người hiện giữ chức thứ trưởng tại Bộ Ngoại giao Trung Quốc, mặc d&ugrave; Bắc Kinh chưa c&ocirc;ng bố việc bổ nhiệm &ocirc;ng. Bằng chứng cho thấy &ocirc;ng được lựa chọn ngồi v&agrave;o chiếc ghế n&oacute;ng ở Washington DC l&agrave; việc &ocirc;ng xuất hiện với vai tr&ograve; nổi bật trong cuộc gặp gỡ l&atilde;nh đạo doanh nghiệp Mỹ v&agrave;o ng&agrave;y 24.3 tại Bắc Kinh.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/26820299-d1e6-4e08-b8da-885fd46f81b210779c84-1680585318791258893729.jpg\" target=\"_blank\" title=\"Thứ trưởng Bộ Ngoại giao Trung Quốc Tạ Phong, người có thể sắp trở thành đại sứ mới của Bắc Kinh tại Mỹ\"><img alt=\"Trung Quốc không có đại sứ tại Mỹ hơn 3 tháng, lâu nhất từ năm 1979 - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/26820299-d1e6-4e08-b8da-885fd46f81b210779c84-1680585318791258893729.jpg\" title=\"Trung Quốc không có đại sứ tại Mỹ hơn 3 tháng, lâu nhất từ năm 1979 - Ảnh 1.\" /></a></p>\n\n<p>Thứ trưởng Bộ Ngoại giao Trung Quốc Tạ Phong, người c&oacute; thể sắp trở th&agrave;nh đại sứ mới của Bắc Kinh tại Mỹ</p>\n\n<p>AFP</p>\n\n<p>&Ocirc;ng Tạ đang phụ tr&aacute;ch gi&aacute;m s&aacute;t danh mục đầu tư của Mỹ v&agrave;o Trung Quốc, l&agrave; nh&agrave; ngoại giao kỳ cựu với nhiều mối quan hệ v&agrave; kinh nghiệm li&ecirc;n quan đến Mỹ. Trong khi chờ đợi, Đại sứ qu&aacute;n Trung Quốc ở Mỹ hiện tại được điều h&agrave;nh bởi đại biện l&acirc;m thời Từ Học Uy&ecirc;n.</p>\n\n<p>C&aacute;c chuy&ecirc;n gia ngoại giao cho rằng kh&ocirc;ng c&oacute; vấn đề g&igrave; với qu&aacute; tr&igrave;nh &quot;agr&eacute;ment&quot; của &ocirc;ng Tạ, thủ tục m&agrave; qua đ&oacute; nước chủ nh&agrave; chấp nhận người được một nước ngo&agrave;i cử đến l&agrave;m đại sứ.</p>\n', 2, '2023-03-29 20:26:23', '2023-09-16 16:31:41', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(21, 'Nước Mỹ trước thời điểm ông Trump trình diện tại tòa', 'https://res.cloudinary.com/dxctlgwec/image/upload/ra6zwq8tpihoae3iccdk', 'An ninh được thắt chặt trước phiên tòa lịch sử, khi cựu Tổng thống Mỹ Donald Trump trình diện tại tòa về cáo buộc hình sự.', '<p><a href=\"https://thanhnien.vn/cuu-tong-thong-my-donald-trump-noi-minh-se-bi-bat-vao-3-ngay-nua-185230318200853328.htm\" title=\"Cựu Tổng thống Mỹ Donald Trump \">Cựu Tổng thống Mỹ Donald Trump&nbsp;</a>dự kiến sẽ tr&igrave;nh diện tại t&ograve;a &aacute;n ở New York v&agrave;o l&uacute;c 14 giờ 15 ng&agrave;y 4.4 (giờ địa phương, 1 giờ 15 s&aacute;ng 5.4 tại VN), trở th&agrave;nh cựu tổng thống đầu ti&ecirc;n của Mỹ ra t&ograve;a do bị truy tố h&igrave;nh sự.</p>\n\n<p>Trong những ng&agrave;y trước phi&ecirc;n t&ograve;a, &ocirc;ng đ&atilde; chơi golf, l&ecirc;n mạng x&atilde; hội, gặp gỡ c&aacute;c cố vấn, gọi điện v&agrave; nhắn tin cho c&aacute;c đồng minh li&ecirc;n quan vụ việc. Theo CNN, ch&iacute;nh trị gia 77 tuổi n&agrave;y b&igrave;nh tĩnh v&agrave; tập trung một c&aacute;ch kh&aacute;c thường.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/3/24a-1680534583947168326408.jpg\" target=\"_blank\" title=\"Rào chắn được dựng lên bên ngoài Tòa Hình sự Manhattan\"><img alt=\"Nước Mỹ trước thời điểm ông Trump trình diện tại tòa  - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/3/24a-1680534583947168326408.jpg\" title=\"Nước Mỹ trước thời điểm ông Trump trình diện tại tòa  - Ảnh 1.\" /></a></p>\n\n<p>R&agrave;o chắn được dựng l&ecirc;n b&ecirc;n ngo&agrave;i T&ograve;a H&igrave;nh sự Manhattan</p>\n\n<p>Reuters</p>\n\n<h2>Thời khắc lịch sử</h2>\n\n<p>Theo kế hoạch, &ocirc;ng Trump đi m&aacute;y bay từ Florida đến TP.New York (bang New York) trước khi ra t&ograve;a, được cho l&agrave; li&ecirc;n quan c&aacute;o buộc chi 130.000 USD &quot;bịt miệng&quot; diễn vi&ecirc;n phim khi&ecirc;u d&acirc;m Stormy Daniels (t&ecirc;n thật l&agrave; Stephanie Clifford) trước cuộc bầu cử tổng thống năm 2016. Theo thủ tục, &ocirc;ng sẽ lăn dấu tay, chụp ảnh, nghe c&aacute;o trạng v&agrave; b&aacute;c bỏ hoặc x&aacute;c nhận tại t&ograve;a, nhưng hiện chưa r&otilde; tội danh cụ thể n&ecirc;u trong c&aacute;o trạng. Reuters đưa tin cảnh s&aacute;t New York đ&atilde; lập h&agrave;ng r&agrave;o sắt quanh th&aacute;p Trump v&agrave; phong tỏa c&aacute;c tuyến đường gần T&ograve;a H&igrave;nh sự Manhattan, nơi dự kiến diễn ra biểu t&igrave;nh trước phi&ecirc;n t&ograve;a.</p>\n\n<p>&nbsp;</p>\n\n<p>Cựu Tổng thống Trump bị truy tố: Chuyện g&igrave; sẽ xảy ra?</p>\n\n<p>Đ&agrave;i NY1 dẫn lời cựu nh&acirc;n vi&ecirc;n mật vụ Robert Sica, người từng phụ tr&aacute;ch văn ph&ograve;ng hiện trường của mật vụ tại New York, cho biết lực lượng n&agrave;y sẽ phụ tr&aacute;ch kế hoạch an ninh chung, với sự phối hợp của cảnh s&aacute;t v&agrave; t&ograve;a &aacute;n. Theo đ&oacute;, &ocirc;ng Trump sẽ đi trong đo&agrave;n xe theo lối v&agrave;o ri&ecirc;ng v&agrave; được mật vụ theo s&aacute;t đến tận phi&ecirc;n t&ograve;a. Khi được hỏi về phản ứng của mật vụ nếu xảy ra biến cố, &ocirc;ng Sica chỉ n&oacute;i rằng m&igrave;nh hiểu r&otilde; &quot;đ&acirc;y l&agrave; thời khắc lịch sử của đất nước&quot;. Ph&aacute;t ng&ocirc;n vi&ecirc;n Lucian Chalfen của t&ograve;a &aacute;n New York tiết lộ th&ecirc;m rằng cựu tổng thống sẽ kh&ocirc;ng bị c&ograve;ng tay.</p>\n\n<h2>Kế hoạch của &ocirc;ng Trump</h2>\n\n<p>Trước phi&ecirc;n t&ograve;a lịch sử, luật sư của &ocirc;ng Trump tuy&ecirc;n bố nh&agrave; l&atilde;nh đạo sẽ kh&ocirc;ng thừa nhận bất cứ tội danh n&agrave;o. C&aacute;o trạng c&ograve;n được ni&ecirc;m phong, nhưng truyền th&ocirc;ng Mỹ loan tin l&agrave;<a href=\"https://thanhnien.vn/new-york-rao-riet-siet-chat-an-ninh-phong-tinh-huong-ong-trump-bi-truy-to-185230321102510976.htm\" title=\" ông Trump bị truy tố\">&nbsp;&ocirc;ng Trump bị truy tố</a>&nbsp;hơn 30 tội danh, trong đ&oacute; c&oacute; trọng tội với &aacute;n phạt tối thiểu 1 năm t&ugrave;. &quot;Ch&uacute;ng t&ocirc;i sẽ n&oacute;i rất r&otilde; l&agrave; &ocirc;ng ấy kh&ocirc;ng c&oacute; tội&quot;, CNN ng&agrave;y 3.4 dẫn lời luật sư Joe Tacopina của cựu Tổng thống Trump. &Ocirc;ng tuy&ecirc;n bố đội ngũ luật sư sẽ mổ xẻ v&agrave; phản đối từng c&aacute;o buộc.</p>\n\n<h2>Mặt t&iacute;ch cực đối với &ocirc;ng Trump</h2>\n\n<p>Theo trang Axios ng&agrave;y 3.4, c&aacute;o trạng đối với &ocirc;ng Trump, được đưa ra v&agrave;o thời điểm &ocirc;ng đang vượt l&ecirc;n trong c&aacute;c cuộc khảo s&aacute;t, đ&atilde; gi&uacute;p đo&agrave;n kết đảng Cộng h&ograve;a v&agrave; khiến c&aacute;c đối thủ kh&aacute;c của &ocirc;ng trong đảng giảm sức thu h&uacute;t. Khảo s&aacute;t của trang Yahoo News/YouGov đưa ra ng&agrave;y 1.4 cho thấy sự ủng hộ của &ocirc;ng Trump tăng vọt trong số những người theo đảng Cộng h&ograve;a. Hiện &ocirc;ng dẫn trước đối thủ l&agrave; thống đốc Florida Ron DeSantis đến 26 điểm, so với c&aacute;ch biệt chỉ 8 điểm c&aacute;ch đ&acirc;y 2 tuần. Khảo s&aacute;t c&oacute; sự tham gia của 1.089 người d&acirc;n Mỹ, được tiến h&agrave;nh 24 giờ sau khi đại bồi thẩm đo&agrave;n bỏ phiếu th&ocirc;ng qua việc truy tố &ocirc;ng Trump. Một khảo s&aacute;t kh&aacute;c đối với 593 người d&acirc;n Mỹ, được Đ&agrave;i ABC/Ipsos đưa ra ng&agrave;y 2.4, cho thấy 47% nghĩ rằng việc truy tố c&oacute; động cơ ch&iacute;nh trị, trong khi 32% kh&ocirc;ng nghĩ vậy v&agrave; số c&ograve;n lại chưa chắc chắn.</p>\n\n<p>&nbsp;</p>\n\n<p>Luật sư Tacopina tin rằng &ocirc;ng Trump đối diện nhiều tội nhẹ v&agrave; đội ngũ luật sư sẽ c&oacute; chiến dịch biện hộ bao gồm việc c&ocirc;ng k&iacute;ch v&agrave;o thẩm quyền của c&ocirc;ng tố vi&ecirc;n Alvin Bragg trong việc đưa ra c&aacute;c c&aacute;o buộc cấp tiểu bang đối với một cuộc bầu cử li&ecirc;n bang. Theo luật sư Tacopina, c&aacute;c khoản tiền đ&atilde; được Ủy ban Bầu cử li&ecirc;n bang (FEC) v&agrave; Bộ Tư ph&aacute;p điều tra v&agrave; kết luận l&agrave; kh&ocirc;ng vi phạm.</p>\n\n<p>&quot;Một c&ocirc;ng tố vi&ecirc;n cấp tiểu bang lại nhắm v&agrave;o một tội nhẹ v&agrave; t&igrave;m c&aacute;ch gắn kết, biến n&oacute; th&agrave;nh tội nặng khi c&aacute;o buộc &ocirc;ng ấy vi phạm quy định vận động tranh cử li&ecirc;n bang, điều m&agrave; FEC đ&atilde; n&oacute;i l&agrave; kh&ocirc;ng tồn tại&quot;, &ocirc;ng Tacopina n&oacute;i. Cựu luật sư Michael Cohen của &ocirc;ng Trump đ&atilde; thừa nhận c&aacute;o buộc li&ecirc;n bang li&ecirc;n quan khoản tiền trả cho b&agrave; Daniels v&agrave;o năm 2018. &Ocirc;ng Trump kh&ocirc;ng bị đụng đến khi đ&oacute; do&nbsp;<a href=\"https://thanhnien.vn/bo-tu-phap-my-mo-duong-cho-vu-kien-ong-trump-185230303122609447.htm\" title=\"Bộ Tư pháp Mỹ\">Bộ Tư ph&aacute;p Mỹ</a>&nbsp;c&oacute; ch&iacute;nh s&aacute;ch kh&ocirc;ng truy tố tổng thống đương nhiệm.</p>\n\n<p>Mặt kh&aacute;c, &ocirc;ng Tacopina c&ograve;n bảo vệ việc &ocirc;ng Trump chỉ tr&iacute;ch thẩm ph&aacute;n Juan Merchan, người sẽ l&agrave;m chủ tọa trong vụ &aacute;n n&agrave;y. D&ugrave; cựu Tổng thống Trump n&oacute;i rằng &ocirc;ng Merchan gh&eacute;t m&igrave;nh, nhưng luật sư Tacopina cho biết kh&ocirc;ng c&oacute; &yacute; định y&ecirc;u cầu thay đổi thẩm ph&aacute;n kh&aacute;c.</p>\n', 2, '2023-03-29 20:40:03', '2023-09-16 16:32:03', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(22, 'Chính phủ trình Quốc hội 7 nhóm chính sách đặc thù cho TP.HCM', 'https://res.cloudinary.com/dxctlgwec/image/upload/tkz7t9avficf4uelceyw', 'Chính phủ ngày 28.3 đã có tờ trình Ủy ban Thường vụ Quốc hội đề nghị bổ sung Nghị quyết của Quốc hội về thí điểm một số cơ chế, chính sách đặc thù phát triển TP.HCM vào Chương trình xây dựng luật, pháp lệnh năm 2023; soạn thảo theo trình tự, thủ tục rút gọn, trình Quốc hội cho ý kiến, thông qua tại kỳ họp thứ 5 theo quy trình một kỳ họp.', '<p><a href=\"https://thanhnien.vn/phat-trien-tphcm-thanh-trung-tam-kinh-te-tai-chinh-chau-a-vao-nam-2045-185230328160904971.htm\" title=\"Mục tiêu phát triển TP.HCM\">Mục ti&ecirc;u ph&aacute;t triển TP.HCM</a>&nbsp;đến năm 2030 trở th&agrave;nh th&agrave;nh phố văn minh, hiện đại, nghĩa t&igrave;nh, năng động s&aacute;ng tạo, c&oacute; nguồn nh&acirc;n lực chất lượng cao; l&agrave; th&agrave;nh phố dịch vụ c&ocirc;ng nghiệp hiện đại, đầu t&agrave;u về kinh tế số, x&atilde; hội số, trung t&acirc;m kinh tế, t&agrave;i ch&iacute;nh, thương mại, văn h&oacute;a, gi&aacute;o dục, khoa học - c&ocirc;ng nghệ của cả nước; hội nhập quốc tế s&acirc;u rộng, c&oacute; vị thế nổi trội trong khu vực Đ&ocirc;ng Nam &Aacute;.</p>\n\n<p>Tầm nh&igrave;n đến năm 2045, TP.HCM ph&aacute;t triển ngang tầm c&aacute;c đ&ocirc; thị lớn tr&ecirc;n thế giới, trở th&agrave;nh trung t&acirc;m kinh tế, t&agrave;i ch&iacute;nh, dịch vụ của ch&acirc;u &Aacute;, l&agrave; điểm đến hấp dẫn to&agrave;n cầu; kinh tế, văn h&oacute;a ph&aacute;t triển đặc sắc, người d&acirc;n c&oacute; chất lượng cuộc sống cao. X&acirc;y dựng TP.HCM l&agrave; hạt nh&acirc;n của v&ugrave;ng TP.HCM v&agrave; v&ugrave;ng Đ&ocirc;ng Nam bộ, cực tăng trưởng của cả nước; nơi thu h&uacute;t c&aacute;c định chế t&agrave;i ch&iacute;nh v&agrave; tập đo&agrave;n kinh tế quốc tế.</p>\n\n<p>Trước đ&oacute;, Bộ KH-ĐT đ&atilde; phối hợp với UBND TP.HCM, c&aacute;c bộ, ng&agrave;nh c&oacute; li&ecirc;n quan lập đề nghị x&acirc;y dựng nghị quyết. Hồ sơ đề nghị x&acirc;y dựng nghị quyết đ&atilde; được Bộ Tư ph&aacute;p thẩm định v&agrave; được Ch&iacute;nh phủ xem x&eacute;t, th&ocirc;ng qua tại Nghị quyết số 38/NQ-CP với 7 nh&oacute;m&nbsp;<a href=\"https://thanhnien.vn/chinh-phu-hop-ban-chinh-sach-dac-thu-cho-tphcm-185230227153039438.htm\" title=\"chính sách đặc thù\">ch&iacute;nh s&aacute;ch đặc th&ugrave;</a>, gồm: nh&oacute;m ch&iacute;nh s&aacute;ch về quản l&yacute; đầu tư; nh&oacute;m ch&iacute;nh s&aacute;ch về t&agrave;i ch&iacute;nh, ng&acirc;n s&aacute;ch; nh&oacute;m ch&iacute;nh s&aacute;ch về quản l&yacute; đ&ocirc; thị v&agrave; t&agrave;i nguy&ecirc;n m&ocirc;i trường; nh&oacute;m ch&iacute;nh s&aacute;ch về thu h&uacute;t nh&agrave; đầu tư chiến lược; nh&oacute;m ch&iacute;nh s&aacute;ch về quản l&yacute; khoa học v&agrave; c&ocirc;ng nghệ, đổi mới s&aacute;ng tạo; nh&oacute;m ch&iacute;nh s&aacute;ch về tổ chức bộ m&aacute;y của TP.HCM; nh&oacute;m ch&iacute;nh s&aacute;ch về tổ chức bộ m&aacute;y TP.Thủ Đức (TP.HCM).</p>\n', 3, '2023-03-29 23:11:25', '2023-09-16 16:32:22', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(30, 'Đồng loạt khám xét 3 trung tâm đăng kiểm xe cơ giới ở Lâm Đồng', 'https://res.cloudinary.com/dxctlgwec/image/upload/tgjcho5ysu46yelgxee8', 'Sáng 4.4, Công an tỉnh Lâm Đồng phối hợp với các cơ quan chức năng khám xét 3 trung tâm đăng kiểm để điều tra các sai phạm liên quan đến kiểm định xe.', '<h1 style=\"text-align:justify\">Ghi nhận của PV&nbsp;<em>Thanh Ni&ecirc;n</em>, s&aacute;ng 4.4, nhiều phương tiện &ocirc; t&ocirc; được chủ nh&acirc;n đưa đến Trung t&acirc;m Đăng kiểm xe cơ giới ở đường T&ocirc; Hiến Th&agrave;nh, TP.Đ&agrave; Lạt (Trung t&acirc;m 49-01S) để kiểm định theo định kỳ nhưng bị lực lượng c&ocirc;ng an chặn lại, cổng v&agrave;o&nbsp;<a href=\"https://thanhnien.vn/bat-cuu-dang-kiem-vien-trung-tam-dang-kiem-98-06d-nhan-hoi-lo-185230401112003375.htm\" target=\"_blank\" title=\"Bắt cựu đăng kiểm viên Trung tâm Đăng kiểm 98-06D nhận hối lộ\">trung t&acirc;m đăng kiểm</a>&nbsp;bị giăng d&acirc;y phong tỏa để kh&aacute;m x&eacute;t.</h1>\n\n<p style=\"text-align:justify\"><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/h7-1680574760073815760146.jpg\" target=\"_blank\" title=\"Chi nhánh đăng kiểm xe cơ giới 49-03S ở H.Đức Trọng tạm ngưng hoạt động\"><img alt=\"Khám xét cùng lúc 3 Trung tâm đăng kiểm xe cơ giới ở Lâm Đồng - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/h7-1680574760073815760146.jpg\" title=\"Khám xét cùng lúc 3 Trung tâm đăng kiểm xe cơ giới ở Lâm Đồng - Ảnh 1.\" /></a></p>\n\n<p style=\"text-align:justify\">Chi nh&aacute;nh đăng kiểm xe cơ giới 49-03S ở H.Đức Trọng tạm ngưng hoạt động</p>\n\n<p style=\"text-align:justify\">L&Acirc;M VI&Ecirc;N</p>\n\n<p style=\"text-align:justify\"><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/dalat-1680574839630949973402.jpg\" target=\"_blank\" title=\"Lối vào Trung tâm Đăng kiểm 49-01S bị phong tỏa để kiểm tra\"><img alt=\"Khám xét cùng lúc 3 Trung tâm đăng kiểm xe cơ giới ở Lâm Đồng - Ảnh 2.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/dalat-1680574839630949973402.jpg\" title=\"Khám xét cùng lúc 3 Trung tâm đăng kiểm xe cơ giới ở Lâm Đồng - Ảnh 2.\" /></a></p>\n\n<p style=\"text-align:justify\">Lối v&agrave;o Trung t&acirc;m Đăng kiểm 49-01S bị phong tỏa để kiểm tra</p>\n\n<p style=\"text-align:justify\">L&Acirc;M VI&Ecirc;N</p>\n\n<p style=\"text-align:justify\">Tương tự, tại chi nh&aacute;nh Đăng kiểm H.Đức Trọng (49-03S), nhiều phương tiện đưa đến kiểm định cũng phải quay đầu. Tại&nbsp;<a href=\"https://thanhnien.vn/trung-tam-dang-kiem-61-09d-bo-qua-loi-vi-pham-cua-phuong-tien-khi-kiem-dinh-185230329165624846.htm\" target=\"_blank\" title=\"Trung tâm đăng kiểm 61-09D bỏ qua lỗi vi phạm của phương tiện khi kiểm định\">Trung t&acirc;m Đăng kiểm</a>&nbsp;xe cơ giới ở TP.Bảo Lộc (49-02S) cũng tạm ngưng hoạt động để kh&aacute;m x&eacute;t.</p>\n\n<p style=\"text-align:justify\">Việc kh&aacute;m x&eacute;t n&agrave;y được thực hiện sau một thời gian C&ocirc;ng an L&acirc;m Đồng mời một số c&aacute;n bộ, nh&acirc;n vi&ecirc;n của 3 trung t&acirc;m đăng kiểm tr&ecirc;n để điều tra, x&aacute;c minh những dấu hiệu sai phạm tại c&aacute;c trung t&acirc;m n&oacute;i tr&ecirc;n.</p>\n\n<p style=\"text-align:justify\"><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/h6-16805747600101863246731.jpg\" target=\"_blank\" title=\"Lực lượng công an phong tỏa lối vào Trung tâm Đăng kiểm xe cơ giời 4901S\"><img alt=\"Khám xét cùng lúc 3 Trung tâm đăng kiểm xe cơ giới ở Lâm Đồng - Ảnh 3.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/h6-16805747600101863246731.jpg\" title=\"Khám xét cùng lúc 3 Trung tâm đăng kiểm xe cơ giới ở Lâm Đồng - Ảnh 3.\" /></a></p>\n\n<p style=\"text-align:justify\">Lực lượng c&ocirc;ng an phong tỏa lối v&agrave;o Trung t&acirc;m Đăng kiểm xe cơ giời 4901S</p>\n\n<p style=\"text-align:justify\">L&Acirc;M VI&Ecirc;N</p>\n\n<p style=\"text-align:justify\">Li&ecirc;n quan đến c&aacute;c Trung t&acirc;m đăng kiểm xe cơ giới, trước đ&oacute; ng&agrave;y 23.2, Sở GTVT L&acirc;m Đồng c&oacute; văn bản b&aacute;o c&aacute;o UBND tỉnh L&acirc;m Đồng kết quả kiểm tra hoạt động kiểm định xe cơ giới tr&ecirc;n địa b&agrave;n tỉnh. Trong b&aacute;o c&aacute;o, cơ quan n&agrave;y nhấn mạnh kh&ocirc;ng ph&aacute;t hiện vi phạm tại c&aacute;c trung t&acirc;m đăng kiểm hoạt động kiểm định xe cơ giới.</p>\n\n<p style=\"text-align:justify\"><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/h8-1680574760084408963898.jpg\" target=\"_blank\" title=\"Nhiều chủ xe cơ giới ngỡ ngàng khi trung tâm đăng kiểm bất ngờ ngưng hoạt động.\"><img alt=\"Khám xét cùng lúc 3 Trung tâm đăng kiểm xe cơ giới ở Lâm Đồng - Ảnh 4.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/h8-1680574760084408963898.jpg\" title=\"Khám xét cùng lúc 3 Trung tâm đăng kiểm xe cơ giới ở Lâm Đồng - Ảnh 4.\" /></a></p>\n\n<p style=\"text-align:justify\">Nhiều chủ xe cơ giới ngỡ ng&agrave;ng khi trung t&acirc;m đăng kiểm bất ngờ ngưng hoạt động.</p>\n\n<p style=\"text-align:justify\">CTV</p>\n\n<p style=\"text-align:justify\">Một l&atilde;nh đạo Sở GTVT L&acirc;m Đồng cho biết, tr&ecirc;n địa b&agrave;n L&acirc;m Đồng ngo&agrave;i 3 trung t&acirc;m đăng kiểm n&oacute;i tr&ecirc;n, c&ograve;n c&oacute; 1 trung t&acirc;m đăng kiểm tư nh&acirc;n đ&oacute;ng tr&ecirc;n địa b&agrave;n TP.Bảo Lộc.</p>\n', 4, '2023-04-02 13:38:06', '2023-09-16 16:32:40', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(31, 'TOTTENHAM THỜI HẬU CONTE: \'Bình mới rượu cũ\'?', 'https://res.cloudinary.com/dxctlgwec/image/upload/pxyefxn5qtc8zzpfab2u', 'Tưởng chừng việc thay tướng sẽ giúp cho Gà trống thành London ', '<h1 style=\"text-align:justify\">&nbsp;</h1>\n\n<p style=\"text-align:justify\">Tưởng chừng việc thay tướng sẽ gi&uacute;p cho G&agrave; trống th&agrave;nh London &quot;đổi vận&quot; nhưng c&oacute; vẻ như mọi chuyện vẫn chỉ l&agrave; một bức tranh x&aacute;m xịt bao tr&ugrave;m.</p>\n\n<p style=\"text-align:justify\">Sau chuỗi th&agrave;nh t&iacute;ch k&eacute;m thuyết phục c&ugrave;ng việc xảy ra nhiều rắc rối b&ecirc;n trong nội bộ,&nbsp;<a href=\"https://thethao247.vn/439-chinh-thuc-conte-da-bi-bld-tottenham-sa-thai-d282363.html\" target=\"_blank\">BLĐ Tottenham đ&atilde; đi tới quyết định sa thải HLV Antonio Conte</a>&nbsp;để t&igrave;m kiếm giải ph&aacute;p thay thế. H&agrave;ng loạt những c&aacute;i t&ecirc;n thuộc diện &quot;tin đồn&quot; đ&atilde; xuất hiện như Julian Nagelsmann - cựu HLV Bayern hay cả người cũ Pochettino cũng được đồn đo&aacute;n l&agrave; sẽ ngồi v&agrave;o chiếc ghế n&oacute;ng tại Tottenham Stadium. D&ugrave; vậy, G&agrave; trống th&agrave;nh London mới chỉ đang dừng lại ở việc bổ nhiệm Cristian Stellini l&agrave;m HLV tạm quyền.</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Cristian Stellini l&agrave; HLV tạm quyền của Tottenham. Ảnh: internet.</p>\n\n<p style=\"text-align:justify\"><strong>B&Agrave;I LI&Ecirc;N QUAN</strong></p>\n\n<p style=\"text-align:justify\"><a href=\"https://thethao247.vn/451-vu-hlv-conte-bi-tottenham-sa-thai-cuu-den-da-len-tieng-d282795.html\" target=\"_blank\" title=\"Vụ HLV Conte bị Tottenham sa thải, \'cừu đen\' đã lên tiếng\"><img alt=\"Vụ HLV Conte bị Tottenham sa thải, \'cừu đen\' đã lên tiếng\" src=\"https://cdn-img.thethao247.vn/resize_696x416/storage/files/vidh/2023/03/31/conte-1680228882-091707.jpg\" style=\"height:104px; width:174px\" /></a><a href=\"https://thethao247.vn/451-vu-hlv-conte-bi-tottenham-sa-thai-cuu-den-da-len-tieng-d282795.html\" target=\"_blank\" title=\"Vụ HLV Conte bị Tottenham sa thải, \'cừu đen\' đã lên tiếng\">Vụ HLV Conte bị Tottenham sa thải, &#39;cừu đen&#39; đ&atilde; l&ecirc;n tiếng</a></p>\n\n<p style=\"text-align:justify\">Những vấn đề xoay quanh th&agrave;nh t&iacute;ch bết b&aacute;t của Tottenham kể từ đầu m&ugrave;a giải ban đầu được x&aacute;c định l&agrave; do hệ thống chiến thuật c&oacute; phần &quot;lỗi thời&quot; của Conte. Tuy nhi&ecirc;n, sau khi vị chiến lược gia n&agrave;y rời đi, m&agrave;n thể hiện của Tottenham ở trận đấu gần nhất với đội bị đ&aacute;nh gi&aacute; thấp hơn l&agrave; Everton cũng chẳng cho thấy nhiều sự kh&aacute;c biệt. Thậm ch&iacute;, nếu kh&ocirc;ng c&oacute; pha đ&aacute; penalty th&agrave;nh c&ocirc;ng của Harry Kane, c&aacute;c vị kh&aacute;ch ho&agrave;n to&agrave;n c&oacute; thể phải rời Goodison Park với hai b&agrave;n tay trắng.</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Đ&aacute;ng ch&uacute; &yacute;, dấu ấn chiến thuật của vị HLV tạm quyền gần như l&agrave; kh&ocirc;ng c&oacute;, trong khi c&aacute;c cầu thủ Tottenham thi đấu ở tr&ecirc;n s&acirc;n với một th&aacute;i độ bạc nhược, thiếu t&iacute;nh gắn kết d&ugrave; sở hữu một họng ph&aacute;o hạng nặng mang t&ecirc;n Harry Kane. Trung phong người Anh vẫn đều đặn ghi b&agrave;n, tuy nhi&ecirc;n một m&igrave;nh anh l&agrave; kh&ocirc;ng đủ để gi&uacute;p G&agrave; trống th&agrave;nh London cải thiện th&agrave;nh t&iacute;ch của họ tr&ecirc;n BXH.&nbsp;</p>\n\n<p style=\"text-align:justify\">Tới đ&acirc;y, nhiều người h&acirc;m mộ của đội b&oacute;ng &aacute;o trắng c&ugrave;ng c&aacute;c fan b&oacute;ng đ&aacute; trung lập c&oacute; thể đi tới một kết luận rằng Tottenham sa thải Conte c&oacute; lẽ kh&ocirc;ng v&igrave; yếu tố th&agrave;nh t&iacute;ch tr&ecirc;n s&acirc;n. Như đ&atilde; nhận định, sự bạc nhược trong lối chơi phần nhiều tới từ tinh thần của c&aacute;c cầu thủ v&agrave; ngo&agrave;i ra, sự &quot;o bế, nu&ocirc;ng chiều&quot; của Chủ tịch CLB Daniel Levy đ&atilde; khiến cho tập thể đội b&oacute;ng kh&ocirc;ng c&ograve;n nghe lời HLV, thay v&agrave;o đ&oacute; l&agrave; sự chỉ tr&iacute;ch lẫn nhau, g&acirc;y b&egrave; kết ph&aacute;i trong nội bộ đội b&oacute;ng.</p>\n\n<p style=\"text-align:justify\"><a href=\"https://cdn-img.thethao247.vn/origin_865x0/storage/files/kiennt/2023/04/04/1606995-1-1680577794-101710.jpg\" rel=\"nofollow noopener\"><img alt=\"1606995-1-1680577794.jpg\" src=\"https://cdn-img.thethao247.vn/origin_865x0/storage/files/kiennt/2023/04/04/1606995-1-1680577794-101710.jpg\" style=\"height:712px; width:1200px\" title=\"\" /></a></p>\n\n<p style=\"text-align:justify\">Conte đ&atilde; n&oacute;i l&ecirc;n sự thật về Tottenham hiện tại. Ảnh: internet.</p>\n\n<p style=\"text-align:justify\">HLV Conte trước thời điểm bị sa thải đ&atilde; mạnh dạn tuy&ecirc;n bố rằng:&nbsp;<a href=\"https://thethao247.vn/436-cang-thang-leo-thang-ban-an-cho-hlv-conte-duoc-thi-hanh-ngay-lap-tuc-d281857.html\" target=\"_blank\"><strong><em>&quot;Nếu họ muốn sa thải t&ocirc;i, điều n&agrave;y sẽ chẳng c&oacute; g&igrave; bất ngờ nhưng n&oacute; cũng kh&ocirc;ng thay đổi được g&igrave;, kể cả khi c&oacute; người mới đến.&quot;</em></strong></a>&nbsp;Những lời n&oacute;i tr&ecirc;n cho thấy chiến lược gia n&agrave;y nhận thức r&otilde; được t&igrave;nh h&igrave;nh nội bộ cực kỳ rối ren của Tottenham v&agrave; &ocirc;ng ho&agrave;n to&agrave;n chấp nhận việc m&igrave;nh c&oacute; thể bị sa thải khi đưa ra những ph&aacute;t biểu &quot;đắng ngắt&quot; n&agrave;y.</p>\n\n<p style=\"text-align:justify\">D&ugrave; trận h&ograve;a tr&ecirc;n cũng đ&atilde; đủ để Tottenham &quot;hất văng&quot; Man United ra khỏi top 4 nhưng họ đ&atilde; chơi nhiều hơn Quỷ đỏ 2 trận. Hơn nữa, đo&agrave;n qu&acirc;n của Ten Hag cũng sẽ chạm tr&aacute;n với G&agrave; trống th&agrave;nh London sắp tới đ&acirc;y v&agrave; trận cầu n&agrave;y hứa hẹn cũng sẽ cực kỳ kh&oacute; khăn đối với HLV tạm quyền Stellini. Nếu kh&ocirc;ng thể kết th&uacute;c m&ugrave;a giải trong top 4, Tottenham sẽ phải đối diện với nguy cơ rất lớn về một cuộc &quot;th&aacute;o chạy&quot; của h&agrave;ng loạt ng&ocirc;i sao đ&igrave;nh đ&aacute;m, trong đ&oacute; chắc chắn c&oacute; sự xuất hiện của Harry Kane - cầu thủ &quot;trong mơ&quot; của Man United.</p>\n', 1, '2023-04-02 17:28:15', '2023-09-16 16:33:01', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(32, 'Xe xếp hàng đăng kiểm gây ùn tắc nghiêm trọng tại QL13', 'https://res.cloudinary.com/dxctlgwec/image/upload/p4h6vfdix5mozmkuit1t', 'Sáng nay 4.4, tình hình ùn tắc tại một số trung tâm đăng kiểm đã khiến cho tài xế và cả người đi đường vất vả vượt qua điểm kẹt xe.', '<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/ttdk5-504-16805819219341169936120.jpg\" target=\"_blank\" title=\"Dòng xe xếp hàng chờ kiểm định kéo ra tận QL13 gây ách tắc nghiêm trọng\"><img alt=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/ttdk5-504-16805819219341169936120.jpg\" title=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 1.\" /></a></p>\n\n<p>D&ograve;ng xe xếp h&agrave;ng chờ kiểm định k&eacute;o ra tận QL13 g&acirc;y &aacute;ch tắc nghi&ecirc;m trọng</p>\n\n<p>ĐINH ĐANG</p>\n\n<p>Chị H.T.V, ngụ tại P. Hiệp B&igrave;nh Phước, TP.Thủ Đức (TP.HCM) bức x&uacute;c kể: &quot;S&aacute;ng nay t&ocirc;i đi đăng kiểm xe tại Trung t&acirc;m Đăng kiểm 50-03S tr&ecirc;n QL13. T&igrave;nh trạng &ugrave;n tắc đ&atilde; diễn ra mấy th&aacute;ng nay nhưng v&agrave;i ng&agrave;y gần đ&acirc;y lượng xe đổ về nhiều hơn, xếp h&agrave;ng ra cả QL13 v&agrave; k&eacute;o d&agrave;i đến tận khu đ&ocirc; thị Vạn Ph&uacute;c. Khu vực n&agrave;y vốn dĩ thường xuy&ecirc;n &aacute;ch tắc v&agrave;o giờ cao điểm, h&ocirc;m nay lại c&oacute; th&ecirc;m 1 l&agrave;n xe xếp h&agrave;ng kiểm định, t&igrave;nh trạng kẹt xe c&ograve;n nghi&ecirc;m trọng hơn&quot;.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/ttdk5-505-16805819220571060646805.jpg\" target=\"_blank\" title=\"Rất đông tài xế đứng túm tụm hoang mang khi nhìn thấy dòng xe quá đông giữa trời nắng nóng, không biết khi nào mới đến lượt mình\"><img alt=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 2.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/ttdk5-505-16805819220571060646805.jpg\" title=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 2.\" /></a></p>\n\n<p>Rất đ&ocirc;ng t&agrave;i xế đứng t&uacute;m tụm hoang mang khi nh&igrave;n thấy d&ograve;ng xe qu&aacute; đ&ocirc;ng giữa trời nắng n&oacute;ng, kh&ocirc;ng biết khi n&agrave;o mới đến lượt m&igrave;nh</p>\n\n<p>ĐINH ĐANG</p>\n\n<p>Theo ghi nhận của PV&nbsp;<em>Thanh Ni&ecirc;n</em>, &ugrave;n tắc ở c&aacute;c trung t&acirc;m đăng kiểm tr&ecirc;n địa b&agrave;n TP.HCM đang gia tăng nghi&ecirc;m trọng trở lại ở c&aacute;c trung t&acirc;m như 50-03V, P.B&igrave;nh Chiểu; 50-03S, P.Hiệp B&igrave;nh Phước; 50-04V, P.C&aacute;t L&aacute;i (TP.Thủ Đức). C&aacute;c phương tiện xếp h&agrave;ng chờ đợi k&eacute;o d&agrave;i, g&acirc;y &aacute;ch tắc giao th&ocirc;ng v&agrave; ảnh hưởng đến việc di chuyển, vận tải h&agrave;ng h&oacute;a, kinh doanh mua b&aacute;n của người d&acirc;n khu vực n&oacute;i tr&ecirc;n.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/ttdk5-501-16805819217981000165782.jpg\" target=\"_blank\" title=\"Ùn tắc bùng phát tại một số trung tâm đăng kiểm trên địa bàn TP.HCM trong mấy ngày gần đây\"><img alt=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 3.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/ttdk5-501-16805819217981000165782.jpg\" title=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 3.\" /></a></p>\n\n<p>&Ugrave;n tắc b&ugrave;ng ph&aacute;t tại một số trung t&acirc;m đăng kiểm tr&ecirc;n địa b&agrave;n TP.HCM trong mấy ng&agrave;y gần đ&acirc;y</p>\n\n<p>ĐINH ĐANG</p>\n\n<p>Tại Trung t&acirc;m Đăng kiểm 50-03S, nhiều t&agrave;i xế cho biết đ&atilde; đến xếp h&agrave;ng từ 4 giờ s&aacute;ng nhưng đến gần trưa vẫn kh&ocirc;ng v&agrave;o được b&ecirc;n trong. &Ocirc;ng N.V.V, chủ xe ngụ tại Q.Ph&uacute; Nhuận (TP.HCM) than thở: &quot;Xe của t&ocirc;i hết hạn kiểm định v&agrave;o ng&agrave;y 12.4, t&ocirc;i chạy đến nhiều nơi gần nh&agrave; nhưng đều qu&aacute; tải, nếu muốn đi sang c&aacute;c điểm kh&aacute;c phải mất đến 20km. T&igrave;nh trạng n&agrave;y k&eacute;o d&agrave;i l&acirc;u nay phải n&oacute;i l&agrave; rất khổ sở&quot;.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/ttdk5-508-16805819221711859984299.jpg\" target=\"_blank\" title=\"Hiện có 5/9 trung tâm đăng kiểm thực hiện việc tiếp nhận xe đăng ký qua ứng dụng trên điện thoại nhưng lịch xếp chỗ rất xa, khiến cho các chủ phương tiện đổ dồn về các trạm tiếp nhận theo cách xếp hàng truyền thống\"><img alt=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 4.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/ttdk5-508-16805819221711859984299.jpg\" title=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 4.\" /></a></p>\n\n<p>Hiện c&oacute; 5/9 trung t&acirc;m đăng kiểm thực hiện việc tiếp nhận xe đăng k&yacute; qua ứng dụng tr&ecirc;n điện thoại nhưng lịch xếp chỗ rất xa, khiến cho c&aacute;c chủ phương tiện đổ dồn về c&aacute;c trạm tiếp nhận theo c&aacute;ch xếp h&agrave;ng truyền thống</p>\n\n<p>ĐINH ĐANG</p>\n\n<p>Theo t&igrave;m hiểu, hiện nay c&oacute; 5/9 trung t&acirc;m đăng kiểm tại TP.HCM th&ocirc;ng b&aacute;o chỉ nhận đăng k&yacute; qua app (ứng dụng) TTDK, nhưng thời hạn chọn được lịch trống kh&aacute; xa, c&oacute; khi đến th&aacute;ng 5 mới xếp được chỗ. Trong khi đ&oacute;, nhiều chủ xe lớn tuổi hoặc kh&ocirc;ng r&agrave;nh c&ocirc;ng nghệ rất kh&oacute; thao t&aacute;c để đăng k&yacute;. Ch&iacute;nh v&igrave; vậy, những xe gần hết hạn đ&atilde; đổ về những trung t&acirc;m đăng kiểm đang tiếp nhận theo kiểu xếp h&agrave;ng truyền thống, g&acirc;y n&ecirc;n cảnh &ugrave;n tắc nghi&ecirc;m trọng trong mấy ng&agrave;y gần đ&acirc;y.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/4/ttdk5-506-16805819220681446594409.jpg\" target=\"_blank\" title=\"Nhiều tài xế lớn tuổi không biết cách thao tác để đăng ký kiểm định qua ứng dụng trên điện thoại\"><img alt=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 5.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/4/ttdk5-506-16805819220681446594409.jpg\" title=\"TP.HCM lại ùn tắc trung tâm đăng kiểm  - Ảnh 5.\" /></a></p>\n\n<p>Nhiều t&agrave;i xế lớn tuổi kh&ocirc;ng biết c&aacute;ch thao t&aacute;c để đăng k&yacute; kiểm định qua ứng dụng tr&ecirc;n điện thoại</p>\n\n<p>ĐINH ĐANG</p>\n', 4, '2023-04-02 17:38:07', '2023-09-16 16:33:22', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(33, 'Liverpool gây sốc, cất 3 trụ cột không thể thay thế khi đại chiến Chelsea?', 'https://res.cloudinary.com/dxctlgwec/image/upload/mzcgrvswoknlcvchllu3', 'Liverpool sẽ có chuyến làm khách tới sân của Chelsea ở trận đá bù vòng 8 Ngoại hạng Anh. Theo thông tin mới nhất, HLV Jurgen Klopp dự kiến gây sốc khi cất 3 trụ cột đặc biệt quan trọng.', '<p>Liverpool sẽ c&oacute; chuyến l&agrave;m kh&aacute;ch tới s&acirc;n của Chelsea ở trận đ&aacute; b&ugrave; v&ograve;ng 8 Ngoại hạng Anh. Theo th&ocirc;ng tin mới nhất, HLV Jurgen Klopp dự kiến g&acirc;y sốc khi cất 3 trụ cột đặc biệt quan trọng.</p>\n\n<p><a href=\"https://thethao247.vn/439-ket-qua-man-city-vs-liverpool-18h30-ngay-1-4-d282886.html\" target=\"_blank\">Sau thất bại đậm 1-4 trước Man City tại v&ograve;ng 29 Ngoại hạng Anh</a>, Liverpool sẽ tiếp tục c&oacute; thử th&aacute;ch đầy kh&oacute; khăn kh&aacute;c khi phải l&agrave;m kh&aacute;ch trước Chelsea ở trận đ&aacute; b&ugrave; v&ograve;ng 8 giải đấu diễn ra v&agrave;o 2h00 ng&agrave;y 5/4 (giờ Việt Nam).&nbsp;</p>\n\n<p>D&ugrave; cho đối thủ đang kh&ocirc;ng c&oacute; phong độ cao v&agrave; vừa sa thải HLV trưởng song đ&acirc;y vẫn l&agrave; 90 ph&uacute;t đầy th&aacute;ch thức với đo&agrave;n qu&acirc;n của Jurgen Klopp. Trước thềm m&agrave;n chạm tr&aacute;n n&oacute;i tr&ecirc;n, truyền th&ocirc;ng Anh vừa tiết lộ một th&ocirc;ng tin g&acirc;y sốc.</p>\n\n<p>Theo tiết lộ từ tờ The Times, vị chiến lược gia người Đức đ&atilde; quyết định sẽ cất 3 trụ cột kh&ocirc;ng thể thay thế tr&ecirc;n băng ghế dự bị ở chuyến l&agrave;m kh&aacute;ch tới s&acirc;n của Chelsea. Cụ thể, những c&aacute;i t&ecirc;n phải ngồi ngo&agrave;i bao gồm: Trent Alexander-Arnold, Virgil Van Dijk c&ugrave;ng Mohamed Salah.</p>\n\n<p>Thực tế, trong 3 ng&ocirc;i sao đ&atilde; nhắc tới, ngoại trừ Alexander-Arnold tr&igrave;nh diễn phong độ k&eacute;m thuyết phục ở qu&atilde;ng thời gian v&agrave; gần nhất l&agrave; trận gặp Man City th&igrave; Van Dijk hay Salah vẫn thể hiện kh&aacute; ấn tượng.</p>\n\n<p>&nbsp;</p>\n\n<p>Thậm ch&iacute;,&nbsp;<a href=\"https://thethao247.vn/448-xe-luoi-man-city-salah-di-vao-lich-su-ngoai-hang-anh-voi-ky-luc-vo-tien-khoang-hau-d282940.html\" target=\"_blank\">Mo Salah c&ograve;n l&agrave; c&aacute;i t&ecirc;n ghi b&agrave;n thắng danh dự cho The Kop trong chuyến h&agrave;nh qu&acirc;n đến s&acirc;n Etihad</a>&nbsp;tại v&ograve;ng 29 Ngoại hạng Anh v&agrave;o ng&agrave;y 1/4 vừa qua. V&igrave; thế, việc bỏ ch&acirc;n s&uacute;t h&agrave;ng đầu ở b&ecirc;n ngo&agrave;i thực sự l&agrave; quyết định g&acirc;y sốc của Klopp tại trận đại chiến cực kỳ quan trọng sắp diễn ra.</p>\n\n<p><a href=\"https://cdn-img.thethao247.vn/origin_865x0/storage/files/manhlt/2023/04/04/liverpool-chelsea-1680576796-095426.jpeg\" rel=\"nofollow noopener\"><img alt=\"liverpool-chelsea-1680576796.jpeg\" src=\"https://cdn-img.thethao247.vn/origin_865x0/storage/files/manhlt/2023/04/04/liverpool-chelsea-1680576796-095426.jpeg\" style=\"height:900px; width:1600px\" title=\"\" /></a></p>\n\n<p>Salah, Van Dijk v&agrave; Alexander-Arnold theo tiết lộ sẽ chỉ c&oacute; t&ecirc;n ở băng ghế dự bị trận gặp Chelsea (Nguồn: Internet)</p>\n\n<p>C&ograve;n nhớ, ở thời điểm bị Man City dẫn trước, chiến lược gia người Đức cũng đ&atilde; thay Mo Salah ra s&acirc;n trong sự ngỡ ng&agrave;ng từ cổ động vi&ecirc;n Lữ đo&agrave;n đỏ bởi tiền đạo ấy l&agrave; ng&ocirc;i sao thi đấu gần như hay nhất tại đội h&igrave;nh trận đ&oacute;.&nbsp;</p>\n\n<p>&ldquo;Bỏ qua&rdquo; trụ cột, những c&aacute;i t&ecirc;n được lựa chọn thay thế theo tiết lộ gồm: Joel Matip, Joe Gomez c&ugrave;ng Darwin Nunez. Thậm ch&iacute;, Roberto Firmino cũng c&oacute; khả năng được Klopp tin tưởng ở trận đấu tới thay thế cho Diogo Jota chơi kh&ocirc;ng thuyết phục trước Man City.</p>\n\n<p>Hiện tại, Liverpool đang xếp thứ 8 với 8 điểm k&eacute;m top 4. Bởi vậy, muốn nu&ocirc;i hy vọng gi&agrave;nh v&eacute; tham dự Champions League, họ buộc phải đ&aacute;nh bại Chelsea đồng thời tạo đ&agrave; cho m&agrave;n chạm tr&aacute;n Arsenal v&agrave;o cuối tuần.</p>\n\n<p>&nbsp;</p>\n', 1, '2023-04-04 10:07:41', '2023-09-16 16:33:44', 'Trịnh Huỳnh Chấn Quang', 'quangvk');
INSERT INTO `new` (`id`, `title`, `thumbnail`, `shortdescription`, `content`, `category_id`, `createddate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(34, 'Thanh tra toàn diện TikTok tại Việt Nam', 'https://res.cloudinary.com/dxctlgwec/image/upload/hqdd6fk4z4hjfjodrmez', 'Bộ TT-TT sẽ thanh tra toàn diện mạng xã hội TikTok với gần 50 triệu người dùng do xuất hiện nhiều nội dung xấu độc, phản cảm, các thông tin sai sự thật, mê tín dị đoan…', '<p>Th&ocirc;ng tin vừa được &ocirc;ng L&ecirc; Quang Tự Do, Cục trưởng Cục Ph&aacute;t thanh, truyền h&igrave;nh - th&ocirc;ng tin điện tử (Bộ TT-TT), cho biết tối 3.4.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/3/tiktok-16805411698081002787953.jpg\" target=\"_blank\" title=\"Bộ TT-TT sẽ thanh tra toàn diện TikTok từ đầu tháng 5 tới\"><img alt=\"Thanh tra toàn diện TikTok tại Việt Nam - Ảnh 1.\" src=\"https://images2.thanhnien.vn/528068263637045248/2023/4/3/tiktok-16805411698081002787953.jpg\" title=\"Thanh tra toàn diện TikTok tại Việt Nam - Ảnh 1.\" /></a></p>\n\n<p>Bộ TT-TT sẽ thanh tra to&agrave;n diện TikTok từ đầu th&aacute;ng 5 tới</p>\n\n<p>ẢNH CHỤP M&Agrave;N H&Igrave;NH</p>\n\n<p>Theo Bộ TT-TT, thời gian gần đ&acirc;y, tr&ecirc;n mạng x&atilde; hội TikTok xuất hiện nhiều nội dung xấu độc, phản cảm, c&aacute;c th&ocirc;ng tin sai sự thật, m&ecirc; t&iacute;n dị đoan... Trước thực trạng tr&ecirc;n, Bộ TT-TT sẽ tiến h&agrave;nh thanh tra to&agrave;n diện đối với nền tảng mạng x&atilde; hội TikTok.</p>\n\n<p>Việc thanh tra dự kiến sẽ bắt đầu tiến h&agrave;nh từ th&aacute;ng 5, nhằm đảm bảo việc tu&acirc;n thủ ph&aacute;p luật của nền tảng n&agrave;y trong qu&aacute; tr&igrave;nh hoạt động, kinh doanh tại Việt Nam. Nếu ph&aacute;t hiện sai phạm, Bộ TT-TT sẽ xử l&yacute; nghi&ecirc;m; đồng thời sẽ phối hợp với c&aacute;c cơ quan chức năng &aacute;p dụng nhiều giải ph&aacute;p mạnh tay, triệt để.</p>\n\n<p>&quot;TikTok, Facebook, YouTube đều l&agrave; c&aacute;c nền tảng&nbsp;<a href=\"https://thanhnien.vn/nguoi-tre-phai-tinh-tao-truoc-content-rac-nhan-nhan-khap-mang-xa-hoi-185230330094904653.htm\" title=\"mạng xã hội\">mạng x&atilde; hội</a>&nbsp;xuy&ecirc;n bi&ecirc;n giới. Họ c&oacute; ti&ecirc;u chuẩn cộng đồng &aacute;p dụng tr&ecirc;n to&agrave;n cầu. Tuy nhi&ecirc;n, khi v&agrave;o Việt Nam, c&aacute;c nền tảng n&agrave;y phải tu&acirc;n thủ theo luật ph&aacute;p Việt Nam, v&agrave; ph&aacute;p luật đ&oacute; kh&ocirc;ng chỉ bao gồm việc quản l&yacute; về nội dung m&agrave; c&ograve;n cả nghĩa vụ về thuế, thanh to&aacute;n, quảng c&aacute;o&hellip; để tổng hợp đồng bộ c&aacute;c giải ph&aacute;p th&igrave; họ mới tu&acirc;n thủ quy định tốt của Việt Nam&quot;, &ocirc;ng Tự Do nhấn mạnh.</p>\n\n<p>TikTok ch&iacute;nh thức ra mắt tại Việt Nam v&agrave;o năm 2019, sau 1 năm thử nghiệm. Chỉ trong v&agrave;i năm, đến nay, TikTok đ&atilde; b&ugrave;ng&nbsp;nổ với gần 50 triệu người sử dụng mạng x&atilde; hội n&agrave;y. Việt Nam hiện xếp thứ 6 trong số 10 quốc gia c&oacute; đ&ocirc;ng người sử dụng TikTok nhất thế giới.</p>\n\n<p>TikTok gợi &yacute; nội dung cho người xem bằng thuật to&aacute;n ri&ecirc;ng do đơn vị n&agrave;y ph&aacute;t triển. Những nội dung xấu độc, th&ocirc;ng tin sai sự thật nếu kh&ocirc;ng c&oacute; biện ph&aacute;p ngăn chặn kịp thời sẽ li&ecirc;n tục hiện l&ecirc;n trang của người d&ugrave;ng.</p>\n\n<p>Trước đ&oacute;, th&aacute;ng 11.2022, Bộ trưởng Bộ TT-TT Nguyễn Mạnh H&ugrave;ng cho biết, vấn đề quảng c&aacute;o sai sự thật xuất hiện nhiều tr&ecirc;n c&aacute;c nền tảng xuy&ecirc;n bi&ecirc;n giới. Bộ sẽ thanh tra c&aacute;c nền tảng xuy&ecirc;n bi&ecirc;n giới, trong đ&oacute; c&oacute; TikTok về vấn đề quảng c&aacute;o.</p>\n', 4, '2023-04-04 10:43:11', '2023-09-16 16:34:05', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(35, 'HLV Philippe Troussier nhận tin dữ ở đội tuyển Việt Nam', 'https://res.cloudinary.com/dxctlgwec/image/upload/u4g9rbxcvytm79gpq3kc', 'HLV Philippe Troussier nhận tin kém vui khi tiền vệ Phan Văn Đức dính chấn thương nặng, phải nghỉ thi đấu dài hạn.', '<p>Theo th&ocirc;ng tin từ CLB C&ocirc;ng an H&agrave; Nội (CAHN), tiền vệ Phan Văn Đức d&iacute;nh chấn thương nặng v&agrave; phải nghỉ thi đấu khoảng 9 th&aacute;ng để hồi phục.</p>\n\n<p><img alt=\"hlv philippe troussier nhận tin dữ ở đội tuyển việt nam\" src=\"https://cdn.baogiaothong.vn/upload/images/2023-2/article_img/2023-04-04/img-bgt-2021-van-duc-1680594450-width1280height720.jpg\" /></p>\n\n<p>Văn Đức d&iacute;nh chấn thương phải nghỉ thi đấu d&agrave;i hạn. Ảnh CAHN</p>\n\n<p>Cụ thể, anh được x&aacute;c định đứt ho&agrave;n to&agrave;n d&acirc;y chằng ch&eacute;o trước v&agrave; bị dập sừng sau sụn ch&ecirc;m trong độ I, loại chấn thương cực kỳ phức tạp.</p>\n\n<p>Đội b&oacute;ng ng&agrave;nh C&ocirc;ng an cho biết sẽ sớm thu xếp để Văn Đức được phẫu thuật xử l&yacute; chấn thương.</p>\n\n<p>Trước đ&oacute;, ở ph&uacute;t 35 cuộc đối đầu giữa CAHN v&agrave; Kh&aacute;nh H&ograve;a trong khu&ocirc;n khổ v&ograve;ng loại C&uacute;p Quốc gia, Văn Đức đ&atilde; gặp phải một chấn thương kh&ocirc;ng đ&aacute;ng c&oacute; sau t&igrave;nh huống đỡ b&oacute;ng giữa s&acirc;n.</p>\n\n<p>Ngay lập tức anh đ&atilde; được đội ngũ&nbsp;<a href=\"https://www.baogiaothong.vn/y-te/\" title=\"Y tế\">y tế</a>&nbsp;của CLB chăm s&oacute;c nhưng kh&ocirc;ng thể tiếp tục thi đấu.</p>\n\n<p>Việc cầu thủ xứ Nghệ phải nghỉ thi đấu 9 th&aacute;ng l&agrave; mất m&aacute;t lớn với CAHN trong cuộc đua tại V-League 2023.</p>\n\n<p>Ngo&agrave;i ra, Văn Đức chấn thương cũng ảnh hưởng tới kế hoạch của đội tuyển Việt Nam tại v&ograve;ng loại World Cup 2026 cũng như Asian Cup 2023 (diễn ra đầu năm 2024).</p>\n\n<p>HLV Philippe Troussier sẽ phải t&igrave;m kiếm nh&acirc;n sự thay thế vị tr&iacute; tiền vệ qu&ecirc; Nghệ An để lại.</p>\n', 1, '2023-04-04 17:37:15', '2023-09-16 16:34:22', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(36, 'HLV Thái Lan nhận xét cực đúng về U.22 Việt Nam và ông Troussier', 'https://res.cloudinary.com/dxctlgwec/image/upload/evomdwzhkxhscmieyr0y', 'HLV trưởng U.22 Thái Lan - ông Issara Sritaro đã có những nhận định về các đối thủ cùng bảng B SEA Games 32, trong đó có U.22 Việt Nam.', '<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/u23-vn-16790687619111791858150-16807673594281665528164.jpg\" target=\"_blank\" title=\"HLV Troussier đang nỗ lực cải cách lối chơi của U.22 Việt Nam\"><img alt=\"HLV Thái Lan nhận xét cực đúng về U.22 Việt Nam và ông Troussier - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/u23-vn-16790687619111791858150-16807673594281665528164.jpg\" title=\"HLV Thái Lan nhận xét cực đúng về U.22 Việt Nam và ông Troussier - Ảnh 1.\" /></a></p>\n\n<p>HLV Troussier đang nỗ lực cải c&aacute;ch lối chơi của U.22 Việt Nam</p>\n\n<p>MINH T&Uacute;</p>\n\n<p>Theo kết quả bốc thăm m&ocirc;n b&oacute;ng đ&aacute; nam&nbsp;<a href=\"https://thanhnien.vn/sea-games.html\" target=\"_blank\" title=\"Sea games\">SEA Games</a>&nbsp;32 v&agrave;o chiều 5.4 tại Campuchia,&nbsp;<a href=\"https://thanhnien.vn/u22-thai-lan.html\" target=\"_blank\" title=\"U.22 Thái Lan\">U.22 Th&aacute;i Lan</a>&nbsp;nằm c&ugrave;ng bảng B với đương kim v&ocirc; địch&nbsp;<a href=\"https://thanhnien.vn/u-22-viet-nam.html\" target=\"_blank\" title=\"U 22 Việt Nam\">U.22 Việt Nam</a>, U.22 Malaysia, U.22 Singapore v&agrave; U.22 L&agrave;o. Về kết quả bốc thăm, HLV Issara Sritaro chia sẻ với&nbsp;<em>Thairath Sport:&nbsp;</em>&quot;Tốt th&ocirc;i, bạn c&oacute; thể gặp bất kỳ đối thủ n&agrave;o tại&nbsp;<a href=\"https://thanhnien.vn/sea-games-32-u22-viet-nam-va-nhung-tran-chung-ket-som-185230405171252133.htm\" target=\"_blank\" title=\"SEA Games 32: U.22 Việt Nam và những trận chung kết sớm, gặp U.22 Thái Lan ngày nào?\">SEA Games</a>&nbsp;32. Đội b&oacute;ng n&agrave;o cũng mạnh. U.22 Indonesia lẽ ra cũng n&ecirc;n nằm ở bảng B. Sự cạnh tranh quyết liệt với c&aacute;c đối thủ mạnh sẽ gi&uacute;p n&acirc;ng cao tr&igrave;nh độ của đội b&oacute;ng. Chỉ cần được thi đấu với một đối thủ mạnh, c&aacute;c cầu thủ cũng đ&atilde; c&oacute; sự tiến bộ&quot;.</p>\n\n<p>&nbsp;</p>\n\n<p>Nhận định đối thủ của U.22 Việt Nam: Th&aacute;i Lan tấn c&ocirc;ng đẹp mắt</p>\n\n<p>Về&nbsp;<a href=\"https://thanhnien.vn/sea-games-32-u22-viet-nam-va-nhung-tran-chung-ket-som-185230405171252133.htm\" target=\"_blank\" title=\"SEA Games 32: U.22 Việt Nam và những trận chung kết sớm, gặp U.22 Thái Lan ngày nào?\">U.22 Việt Nam</a>, đội từng đ&aacute;nh bại ch&iacute;nh&nbsp;<a href=\"https://thanhnien.vn/sea-games-32-u22-viet-nam-va-nhung-tran-chung-ket-som-185230405171252133.htm\" target=\"_blank\" title=\"SEA Games 32: U.22 Việt Nam và những trận chung kết sớm, gặp U.22 Thái Lan ngày nào?\">U.22 Th&aacute;i Lan</a>&nbsp;ở trận chung kết để gi&agrave;nh huy chương v&agrave;ng SEA Games 31 tại H&agrave; Nội, HLV Sritaro nhận định: &quot;U.22 Việt Nam đ&atilde; c&oacute; HLV mới (&ocirc;ng&nbsp;<a href=\"https://thanhnien.vn/troussier.html\" target=\"_blank\" title=\"Troussier\">Troussier</a>) v&agrave; &ocirc;ng ấy từng dẫn dắt một đội trẻ (U.19). T&ocirc;i cũng c&oacute; theo d&otilde;i đội U.22 Việt Nam thi đấu tại Doha Cup 2023. Họ thực sự l&agrave; một đội b&oacute;ng tốt. HLV&nbsp;<a href=\"https://thanhnien.vn/hlv-troussier-doi-mat-bai-toan-kho-o-doi-tuyen-viet-nam-185230405140012545.htm\" target=\"_blank\" title=\"HLV Troussier đối mặt bài toán khó ở đội tuyển Việt Nam\">Troussier</a>&nbsp;đ&atilde; tạo ra một đội b&oacute;ng c&oacute; khả năng ban bật v&agrave; kiểm so&aacute;t b&oacute;ng tốt. U.22 Việt Nam chỉ c&ograve;n thiếu s&oacute;t về sự hiệu quả ở khu vực cuối s&acirc;n. &Ocirc;ng Troussier c&oacute; khoảng 1 th&aacute;ng để đưa ra sự điều chỉnh. D&ugrave; sao đi nữa th&igrave; &ocirc;ng ấy v&agrave; U.22 Việt Nam cũng phải trở n&ecirc;n tốt hơn&quot;.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/dfqror7owzulq5fa5bcwcvssnq1gewrqsnxt3g1lk16rpfdtj0msvncgtgzvt9jqozy-16807673594501906937496.png\" target=\"_blank\" title=\"HLV trưởng U.22 Thái Lan - Issara Sritaro\"><img alt=\"HLV Thái Lan nhận xét cực đúng về U.22 Việt Nam và ông Troussier - Ảnh 2.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/dfqror7owzulq5fa5bcwcvssnq1gewrqsnxt3g1lk16rpfdtj0msvncgtgzvt9jqozy-16807673594501906937496.png\" title=\"HLV Thái Lan nhận xét cực đúng về U.22 Việt Nam và ông Troussier - Ảnh 2.\" /></a></p>\n\n<p>HLV trưởng U.22 Th&aacute;i Lan - Issara Sritaro</p>\n\n<p>THAIRATH</p>\n\n<p>Dưới thời của m&igrave;nh, HLV Troussier đang nỗ lực thay đổi lối chơi của U.22 Việt Nam. Vị HLV người Ph&aacute;p muốn c&aacute;c cầu thủ kiểm so&aacute;t trận đấu bằng c&aacute;ch cầm b&oacute;ng chủ động, khi chạm tr&aacute;n với bất cứ đối thủ n&agrave;o.</p>\n\n<p>Triết l&yacute; chơi b&oacute;ng của HLV Troussier phần n&agrave;o đ&atilde; được thể hiện qua c&aacute;c trận đấu của U.22 Việt Nam tại giải giao hữu Doha Cup 2023 c&aacute;ch đ&acirc;y kh&ocirc;ng l&acirc;u. C&aacute;c cầu thủ U.22 Việt Nam c&oacute; tỷ lệ kiểm so&aacute;t b&oacute;ng tốt trước những đội b&oacute;ng mạnh. Tuy nhi&ecirc;n, khả năng đột biến v&agrave; tạo ra những t&igrave;nh huống tấn c&ocirc;ng nguy hiểm về khung th&agrave;nh đối phương l&agrave; điều đội b&oacute;ng của HLV Troussier chưa l&agrave;m tốt. Sau 3 trận ở Doha Cup 2023, c&aacute;c cầu thủ U.22 Việt Nam kh&ocirc;ng thể chọc thủng lưới đội bạn lần n&agrave;o.</p>\n\n<p>Về th&agrave;nh phần đội U.22 Th&aacute;i Lan dự SEA Games 32, &quot;Voi chiến&quot; nhiều khả năng sẽ kh&ocirc;ng c&oacute; sự phục vụ của &quot;thần đồng&quot; Suphanat Mueanta. &quot;Về trường hợp của Suphanat, t&ocirc;i đ&atilde; n&oacute;i chuyện với chủ tịch CLB Buriram United (&ocirc;ng Newin Chidchob). Sẽ rất kh&oacute; để Suphanat tập trung c&ugrave;ng U.22 Th&aacute;i Lan, v&igrave; cậu ấy sẽ được cử sang ch&acirc;u &Acirc;u để tập huấn v&agrave; thi đấu. Tuy nhi&ecirc;n, ch&uacute;ng t&ocirc;i vẫn xem x&eacute;t khả năng sẽ để Suphanat thi đấu ở những trận kh&aacute;c, chẳng hạn như b&aacute;n kết, hay chung kết của SEA Games 32&quot;.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/suphanat-mueanta-7178-1680767389886368070975.jpeg\" target=\"_blank\" title=\"Tiền đạo sinh năm 2002 - Suphanat Mueanta\"><img alt=\"HLV Thái Lan nhận xét cực đúng về U.22 Việt Nam và ông Troussier - Ảnh 3.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/suphanat-mueanta-7178-1680767389886368070975.jpeg\" title=\"HLV Thái Lan nhận xét cực đúng về U.22 Việt Nam và ông Troussier - Ảnh 3.\" /></a></p>\n\n<p>Tiền đạo sinh năm 2002 - Suphanat Mueanta</p>\n\n<p>FAT</p>\n\n<p>HLV Sritaro n&oacute;i tiếp: &quot;Ch&uacute;ng t&ocirc;i sẽ l&ecirc;n danh s&aacute;ch v&agrave; chia c&aacute;c cầu thủ v&agrave;o 3 dạng, gồm những cầu thủ chắc chắn dự SEA Games, những người c&oacute; thể g&oacute;p mặt v&agrave; những c&aacute;i t&ecirc;n &iacute;t khả năng sang Campuchia. N&ograve;ng cốt đội h&igrave;nh U.22 Th&aacute;i Lan vẫn l&agrave; những cầu thủ thi đấu tại Doha Cup 2023. Ch&uacute;ng t&ocirc;i kh&ocirc;ng thể chỉ tập trung v&agrave;o một m&igrave;nh Suphanat&quot;.</p>\n\n<p>Theo&nbsp;<em>Thairath</em>, đội tuyển U.22 Th&aacute;i Lan dự kiến sẽ hội qu&acirc;n từ ng&agrave;y 20.4 v&agrave; l&ecirc;n đường sang Campuchia để dự SEA Games 32 v&agrave;o ng&agrave;y 27.4.</p>\n', 1, '2023-04-06 21:21:09', '2023-09-16 16:34:42', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(37, 'Cơ sở nào để U.22 Việt Nam tự tin trước U.22 Thái Lan, U.22 Malaysia?', 'https://res.cloudinary.com/dxctlgwec/image/upload/cudyvqqydgxnlppjvpj5', 'U.22 Việt Nam rơi vào bảng đấu khó tại SEA Games 32, nhưng thầy trò HLV Philippe Troussier có đầy đủ lý do tự tin trước những đội mạnh như U.22 Thái Lan, U.22 Malaysia.', '<p>Tại v&ograve;ng bảng&nbsp;<a href=\"https://thanhnien.vn/sea-games-32-vang-that-khong-so-lua-185230405234808754.htm\" target=\"_blank\" title=\"SEA Games 32: Vàng thật không sợ lửa !\">SEA Games 32</a>,&nbsp;<a href=\"https://thanhnien.vn/u22-viet-nam-tap-huan-o-noi-thay-park-tung-rat-thich-dau-giao-huu-voi-doi-tphcm-185230406094349248.htm\" target=\"_blank\" title=\"U.22 Việt Nam tập huấn ở nơi thầy Park từng rất thích, đấu giao hữu với đội TP.HCM\">U.22 Việt Nam</a>&nbsp;sẽ đương đầu với&nbsp;<a href=\"https://thanhnien.vn/bao-thai-lan-u22-thai-lan-khong-de-tho-truoc-u22-viet-nam-va-malaysia-185230405170653297.htm\" target=\"_blank\" title=\"Báo Thái Lan: U.22 Thái Lan không dễ thở trước U.22 Việt Nam và Malaysia\">U.22 Th&aacute;i Lan</a>,&nbsp;<a href=\"https://thanhnien.vn/tuyen-u-22-malaysia-tu-tin-den-viet-nam-lay-vang-sea-games-31-1851397563.htm\" target=\"_blank\" title=\"Tuyển U.22 Malaysia tự tin đến Việt Nam lấy vàng SEA Games 31\">U.22 Malaysia</a>, U.22 L&agrave;o v&agrave; U.22 Singapore. Đ&acirc;y l&agrave; bảng đấu kh&oacute; lường, với 3 đội tuyển từng lọt v&agrave;o b&aacute;n kết SEA Games 31, chưa kể b&oacute;ng đ&aacute; L&agrave;o cũng chuyển m&igrave;nh trong thời gian qua khi đội U.17, U.19 v&agrave; U.23 nước n&agrave;y đều thi đấu tốt ở s&acirc;n chơi Đ&ocirc;ng Nam &Aacute;.</p>\n\n<p>Tuy nhi&ecirc;n,&nbsp;<a href=\"https://thanhnien.vn/u22-viet-nam-va-thu-thach-cuc-dai-mang-ten-sea-games-32-18523040523531117.htm\" target=\"_blank\" title=\"U.22 Việt Nam và thử thách cực đại mang tên SEA Games 32\">U.22 Việt Nam</a>&nbsp;vẫn c&oacute; cơ sở tự tin trước những đội mạnh. Trước ti&ecirc;n, b&oacute;ng đ&aacute; trẻ Việt Nam c&oacute; th&agrave;nh t&iacute;ch đối đầu rất tốt với Th&aacute;i Lan, Malaysia trong 5 năm qua. Thậm ch&iacute; t&iacute;nh ri&ecirc;ng trong năm 2022, c&aacute;c đội tuyển trẻ Th&aacute;i Lan cứ gặp Việt Nam l&agrave; sẽ h&ograve;a hoặc thua, chưa một lần xếp hạng cao hơn ở cấp độ U.17, U.19 lẫn U.23.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/vn-168076229764792517905.jpeg\" target=\"_blank\" title=\"U.22 Việt Nam có thành tích đối đầu tốt với U.22 Thái Lan\"><img alt=\"Cơ sở nào để U.22 Việt Nam tự tin trước U.22 Thái Lan, U.22 Malaysia? - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/vn-168076229764792517905.jpeg\" title=\"Cơ sở nào để U.22 Việt Nam tự tin trước U.22 Thái Lan, U.22 Malaysia? - Ảnh 1.\" /></a></p>\n\n<p>U.22 Việt Nam c&oacute; th&agrave;nh t&iacute;ch đối đầu tốt với U.22 Th&aacute;i Lan</p>\n\n<p>VƯƠNG ANH</p>\n\n<p>Ở giải U.23 Đ&ocirc;ng Nam &Aacute; 2022, U.23 Th&aacute;i Lan thua 0-1 trước U.23 Việt Nam ở trận chung kết bởi b&agrave;n thắng duy nhất của Bảo To&agrave;n. Ở v&ograve;ng bảng, đội b&oacute;ng trẻ xứ ch&ugrave;a v&agrave;ng cũng thua U.23 Việt Nam với tỷ số 0-1.</p>\n\n<p>Đến SEA Games 31, U.23 Việt Nam lại gieo sầu cho đối thủ khi thắng U.23 Th&aacute;i Lan 1-0 ở trận chung kết tr&ecirc;n s&acirc;n Mỹ Đ&igrave;nh. 2 tuần sau, U.23 Việt Nam v&agrave; U.23 Th&aacute;i Lan t&aacute;i đấu ở v&ograve;ng bảng U.23 ch&acirc;u &Aacute; 2022. Lần n&agrave;y, hai đội c&oacute; kết quả h&ograve;a 2-2. Sau đ&oacute;, U.23 Việt Nam gi&agrave;nh v&eacute; v&agrave;o tứ kết, c&ograve;n U.23 Th&aacute;i Lan dừng bước ở v&ograve;ng bảng.</p>\n\n<p>Đến giải U.19 Đ&ocirc;ng Nam &Aacute;, U.19 Việt Nam v&agrave; U.19 Th&aacute;i Lan g&acirc;y thất vọng khi kh&ocirc;ng thể c&oacute; mặt trong trận chung kết. D&ugrave; vậy, một lần nữa Việt Nam lại xếp tr&ecirc;n Th&aacute;i Lan. Thầy tr&ograve; HLV Đinh Thế Nam h&ograve;a đối thủ 1-1 ở v&ograve;ng bảng v&agrave; thắng đối thủ ở trận tranh hạng Ba tr&ecirc;n chấm lu&acirc;n lưu.</p>\n\n<p>Như vậy, c&aacute;c đội U.23 v&agrave; U.19 Việt Nam c&oacute; 6 trận bất bại trước Th&aacute;i Lan v&agrave; c&oacute; thứ hạng chung cuộc tốt hơn đối thủ ở cả 4 giải đấu trong năm 2022. Đến v&ograve;ng loại U.17 ch&acirc;u &Aacute; 2023, U.17 Việt Nam thắng gi&ograve;n gi&atilde; 3-0 trước U.17 Th&aacute;i Lan.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/vn-1-16807624213491464998291.jpeg\" target=\"_blank\" title=\"U.22 Thái Lan mạnh, nhưng U.22 Việt Nam của HLV Troussier sẽ có cách hóa giải\"><img alt=\"Cơ sở nào để U.22 Việt Nam tự tin trước U.22 Thái Lan, U.22 Malaysia? - Ảnh 2.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/vn-1-16807624213491464998291.jpeg\" title=\"Cơ sở nào để U.22 Việt Nam tự tin trước U.22 Thái Lan, U.22 Malaysia? - Ảnh 2.\" /></a></p>\n\n<p>U.22 Th&aacute;i Lan mạnh, nhưng U.22 Việt Nam của HLV Troussier sẽ c&oacute; c&aacute;ch h&oacute;a giải</p>\n\n<p>PH&Uacute;C THẮNG</p>\n\n<p>Nếu b&oacute;ng đ&aacute; trẻ Việt Nam c&oacute; th&agrave;nh tựu với chức v&ocirc; địch U.23 Đ&ocirc;ng Nam &Aacute; v&agrave; SEA Games, b&ecirc;n cạnh tấm v&eacute; đ&aacute; tứ kết U.23 ch&acirc;u &Aacute;, b&oacute;ng đ&aacute; trẻ Th&aacute;i Lan vẫn loay hoay khi chưa t&igrave;m được danh hiệu n&agrave;o. Từ năm 2018 đến nay, c&aacute;c đội U.19, U.23 Th&aacute;i Lan trắng tay ở c&aacute;c giải đấu từ Đ&ocirc;ng Nam &Aacute; đến ch&acirc;u &Aacute;, d&ugrave; li&ecirc;n tục thay đổi lứa cầu thủ v&agrave; HLV. Đ&acirc;y cũng l&agrave; khoảng thời gian U.22 Th&aacute;i Lan li&ecirc;n tục h&ograve;a v&agrave; thua U.22 Việt Nam, d&ugrave; đối đầu ở s&acirc;n chơi n&agrave;o.</p>\n\n<p>Tại s&acirc;n chơi SEA Games, U.22 Việt Nam cũng bất bại 2 trận gần nhất khi gặp đội b&oacute;ng xứ ch&ugrave;a v&agrave;ng, d&ugrave; c&aacute;c trận đấu kh&ocirc;ng hề dễ d&agrave;ng.</p>\n\n<p>Với U.22 Malaysia, U.22 Việt Nam cũng c&oacute; th&agrave;nh t&iacute;ch đối đầu tốt khi to&agrave;n thắng 2 trận gần nhất tại SEA Games (thắng 1-0 ở SEA Games 31, thắng 5-1 ở SEA Games 28), b&ecirc;n cạnh trận thắng 2-0 ở giải U.23 ch&acirc;u &Aacute; 2022. B&oacute;ng đ&aacute; trẻ Việt Nam cũng kh&ocirc;ng ng&aacute;n ngại Malaysia, khi ngoại trừ trận thua 0-3 của U.19 Việt Nam trước U.19 Malaysia ở giải Đ&ocirc;ng Nam &Aacute; năm ngo&aacute;i, c&aacute;c đội trẻ Việt Nam thường kh&ocirc;ng gặp kh&oacute; trước &quot;M&atilde;nh hổ&quot;.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/5/u22-vn-16806903040071488899884.jpeg\" target=\"_blank\" title=\"U.22 Việt Nam hai lần thắng U.22 Malaysia trong năm 2022\"><img alt=\"Cơ sở nào để U.22 Việt Nam tự tin trước U.22 Thái Lan, U.22 Malaysia? - Ảnh 3.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/5/u22-vn-16806903040071488899884.jpeg\" title=\"Cơ sở nào để U.22 Việt Nam tự tin trước U.22 Thái Lan, U.22 Malaysia? - Ảnh 3.\" /></a></p>\n\n<p>U.22 Việt Nam hai lần thắng U.22 Malaysia trong năm 2022</p>\n\n<p>ĐỘC LẬP</p>\n\n<p>Theo chuy&ecirc;n gia Đo&agrave;n Minh Xương, vấn đề của HLV Troussier l&agrave; tập hợp được lực lượng tối ưu. Đội U.22 Việt Nam vẫn c&ograve;n 6 cầu thủ từng đ&aacute;nh bại Malaysia v&agrave; Th&aacute;i Lan ở SEA Games 31, bao gồm C&ocirc;ng Đến, Văn Đ&ocirc;, Văn Chuẩn, Tiến Long, Duy Cương v&agrave; Văn T&ugrave;ng. Nhưng ngo&agrave;i ra, HLV người Ph&aacute;p cần c&oacute; đội h&igrave;nh tối ưu từ những cầu thủ đ&atilde; kh&ocirc;ng dự Doha Cup 2023 đang chơi cho một số đội V-League như CLB Đ&agrave; Nẵng, CLB B&igrave;nh Dương hay SLNA.</p>\n\n<p>&quot;U.22 Việt Nam cần tập hợp được nguồn lực cầu thủ tốt nhất, đặc biệt l&agrave; c&aacute;c cầu thủ đang thi đấu ở c&aacute;c đội V-League. Thực tế ở Doha Cup 2023, U.22 Việt Nam chưa c&oacute; lực lượng mạnh nhất, do đ&oacute; tại SEA Games n&agrave;y, ch&uacute;ng ta cần c&oacute; đội h&igrave;nh tối ưu. Vấn đề hiện tại vẫn l&agrave; con người th&ocirc;i. C&oacute; cầu thủ tốt, &ocirc;ng Troussier sẽ x&acirc;y dựng v&agrave; tổ chức được lối đ&aacute; ưng &yacute;&quot;, chuy&ecirc;n gia Đo&agrave;n Minh Xương cho biết.</p>\n', 1, '2023-04-06 21:21:43', '2023-09-16 16:35:01', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(38, 'Đội Argentina trở lại vị trí số 1 thế giới sau 6 năm, đội Việt Nam xếp hạng 95', 'https://res.cloudinary.com/dxctlgwec/image/upload/imm7kv0dcz6t9uob5b8u', 'Vào ngày 6.4.2023, Liên đoàn Bóng đá thế giới (FIFA) đã chính thức công bố bảng xếp hạng mới sau đợt tập trung của các đội tuyển quốc gia vào cuối tháng 3.2023. Đáng chú ý, nhà vô địch của World Cup 2022 là đội tuyển Argentina đã trở lại vị trí số 1 sau 6 năm.', '<p>Trong đợt tập trung vừa qua, Messi c&ugrave;ng&nbsp;<a href=\"https://thanhnien.vn/doi-tuyen-futsal-viet-nam-se-dau-voi-doi-tuyen-argentina-va-paraguay-trong-thang-6-185230402162750023.htm\" title=\"đội tuyển Argentina\">đội tuyển Argentina</a>&nbsp;đ&atilde; gi&agrave;nh hai chiến thắng trước c&aacute;c đối thủ Curacao v&agrave; Panama. Đo&agrave;n qu&acirc;n của HLV Scaloni được cộng th&ecirc;m 2,55 điểm, giữ vững th&agrave;nh t&iacute;ch bất bại kể từ sau chức v&ocirc; địch&nbsp;<a href=\"https://thanhnien.vn/messi-het-cam-hung-o-psg-sau-chuc-vo-dich-world-cup-2022-18523032111004761.htm\" title=\"World Cup 2022\">World Cup 2022</a>&nbsp;v&agrave; vươn l&ecirc;n vị tr&iacute; số 1 tr&ecirc;n bảng xếp hạng FIFA sau 6 năm. Trong khi đ&oacute;, đội tuyển Brazil - đội xếp ở vị tr&iacute; số 1 tr&ecirc;n bảng xếp hạng FIFA trước đ&oacute; đ&atilde; phải nhận thất bại trước đội tuyển Ma Rốc v&agrave; bị trừ 6,56 điểm, phải tụt 2 bậc, xuống vị tr&iacute; thứ 3 tr&ecirc;n&nbsp;<a href=\"https://thanhnien.vn/doi-tuyen-viet-nam-tang-bac-thai-lan-rot-hang-tren-bang-xep-hang-fifa-thang-4-185230329170406401.htm\" title=\"bảng xếp hạng\">bảng xếp hạng</a>.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/1680778036-1680787567960995823555.jpeg\" target=\"_blank\" title=\"Đội tuyển Argentina vươn lên vị trí số 1 trên bảng xếp hạng FIFA sau 6 năm\"><img alt=\"Argentina trở lại vị trí số 1 trên bảng xếp hạng của FIFA sau 6 năm - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/1680778036-1680787567960995823555.jpeg\" title=\"Argentina trở lại vị trí số 1 trên bảng xếp hạng của FIFA sau 6 năm - Ảnh 1.\" /></a></p>\n\n<p>Đội tuyển Argentina vươn l&ecirc;n vị tr&iacute; số 1 tr&ecirc;n bảng xếp hạng FIFA sau 6 năm</p>\n\n<p>AFP</p>\n\n<p>Nh&agrave; v&ocirc; địch thế giới 2018 l&agrave; đội tuyển Ph&aacute;p cũng tăng 1 bậc, đứng thứ hai trong bảng xếp hạng sau khi c&oacute; được 2 thắng lợi tại v&ograve;ng loại EURO 2024. Mbappe c&ugrave;ng c&aacute;c đồng đội đ&atilde; gi&agrave;nh chiến thắng 4-0 trước&nbsp;<a href=\"https://thanhnien.vn/su-nghiep-ky-la-cua-ga-khong-lo-trong-khung-go-doi-tuyen-ha-lan-1851525516.htm\" title=\"đội tuyển Hà Lan \">đội tuyển H&agrave; Lan&nbsp;</a>v&agrave; 1-0 trước đội tuyển Ireland.</p>\n\n<p>Ngo&agrave;i 3 vị tr&iacute; dẫn đầu, c&aacute;c thứ hạng c&ograve;n lại trong tốp&nbsp;10 của bảng xếp hạng FIFA kh&ocirc;ng c&oacute; sự thay đổi. C&aacute;c đội tuyển tại ch&acirc;u &Acirc;u vẫn l&agrave; những đội tuyển &aacute;p đảo khi c&oacute; đến 8 đại diện g&oacute;p mặt.&nbsp;</p>\n\n<p>Sau chiến thắng bất ngờ 2-1 trước Brazil, &ldquo;<a href=\"https://thanhnien.vn/world-cup-2022-diem-mat-nhung-chu-ngua-o-1851522383.htm\" title=\"Chú ngựa ô\">Ch&uacute; ngựa &ocirc;</a>&rdquo; của World Cup 2022 - đội tuyển Ma Rốc tiếp tục được cộng th&ecirc;m 5,44 điểm, xếp ở vị tr&iacute; thứ 11 v&agrave; l&agrave; quốc gia ch&acirc;u Phi c&oacute; thứ hạng cao nhất.&nbsp;</p>\n\n<p>Ở khu vực ch&acirc;u &Aacute;, đội tuyển Nhật Bản đứng thứ 20 v&agrave; vẫn l&agrave; đội c&oacute; thứ hạng cao nhất. Đ&aacute;ng ch&uacute; &yacute;, chủ nh&agrave; World Cup 2022 l&agrave;&nbsp;<a href=\"https://thanhnien.vn/carlos-queiroz-duoc-bo-nhiem-lam-hlv-doi-tuyen-qatar-18523020706431069.htm\" title=\"đội tuyển Qatar\">đội tuyển Qatar</a>&nbsp;tiếp tục bị trừ 4,95 điểm v&agrave; rơi xuống vị tr&iacute; thứ 61.&nbsp;</p>\n\n<p>Ở khu vực Đ&ocirc;ng Nam &Aacute;, đội tuyển Việt Nam d&ugrave; kh&ocirc;ng thi đấu ở loạt trận FIFA Days nhưng vẫn được cộng th&ecirc;m 1,06 điểm, tăng 1 bậc, xếp hạng 95 thế giới. &ldquo;Những chiến binh sao v&agrave;ng&rdquo; tiếp tục trở th&agrave;nh đội tuyển c&oacute; thứ hạng cao nhất tr&ecirc;n&nbsp;<a href=\"https://thanhnien.vn/doi-tuyen-viet-nam-tang-bac-thai-lan-rot-hang-tren-bang-xep-hang-fifa-thang-4-185230329170406401.htm\" title=\"bảng xếp hạng FIFA \">bảng xếp hạng FIFA&nbsp;</a>của khu vực n&agrave;y.&nbsp;</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/doi-tuyen-viet-nam-1680692694653597317473-0-0-1250-2000-crop-16806928351302078491310-16807876426371261833193.jpeg\" target=\"_blank\" title=\"Đội tuyển Việt Nam được cộng thêm 1,06 điểm, xếp hạng 95 thế giới\"><img alt=\"Argentina trở lại vị trí số 1 trên bảng xếp hạng của FIFA sau 6 năm - Ảnh 2.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/doi-tuyen-viet-nam-1680692694653597317473-0-0-1250-2000-crop-16806928351302078491310-16807876426371261833193.jpeg\" title=\"Argentina trở lại vị trí số 1 trên bảng xếp hạng của FIFA sau 6 năm - Ảnh 2.\" /></a></p>\n\n<p>Đội tuyển Việt Nam được cộng th&ecirc;m 1,06 điểm, xếp hạng 95 thế giới</p>\n', 1, '2023-04-06 21:22:23', '2023-09-16 16:35:19', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(39, 'HLV Mourinho nhận mức lương kỷ lục nếu đến châu Á', 'https://res.cloudinary.com/dxctlgwec/image/upload/sffvt2vsmx5ubyntvoq2', 'Xuất hiện thông tin cho rằng HLV Mourinho đã nhận được lời đề nghị với mức lương cao kỷ lục để đến châu Á làm việc.', '<p>C&oacute; th&ocirc;ng tin cho rằng,&nbsp;<a href=\"https://thanhnien.vn/hlv-mourinho.html\" target=\"_blank\" title=\"HLV Mourinho\">HLV Mourinho</a>&nbsp;đ&atilde; nhận được lời đề nghị để đến ch&acirc;u &Aacute; l&agrave;m việc. Cụ thể, l&atilde;nh đạo của b&oacute;ng đ&aacute; Ả Rập X&ecirc; &Uacute;t được cho l&agrave; đ&atilde; c&oacute; động th&aacute;i tiếp cận với &quot;Người đặc biệt&quot; để đặt vấn đề về một bản hợp đồng với mức lương l&ecirc;n đến 100 triệu bảng Anh, với thời hạn 2 năm.</p>\n\n<p>Theo&nbsp;<em>Corriere dello Sport</em>, nếu nhận lời dẫn dắt đội tuyển Ả Rập X&ecirc; &Uacute;t,&nbsp;<a href=\"https://thanhnien.vn/doi-bong-cua-hlv-mourinho-thang-dep-ap-sat-top-4-185230403062755385.htm\" target=\"_blank\" title=\"Đội bóng của HLV Mourinho thắng đẹp, áp sát tốp 4\">HLV Mourinho</a>&nbsp;sẽ trở th&agrave;nh HLV nhận lương cao nhất kể từ trước đến nay, khi bỏ t&uacute;i khoảng 50 triệu bảng Anh mỗi năm. Sau 1 năm l&agrave;m việc, vị HLV người Bồ Đ&agrave;o Nha c&oacute; thể đơn phương chấm dứt hợp đồng hoặc gia hạn th&ecirc;m đến năm 2026, tức l&agrave; khi World Cup diễn ra.</p>\n\n<p>Chiếc ghế HLV trưởng của đội tuyển Ả Rập X&ecirc; &Uacute;t hiện vẫn c&ograve;n trống sau khi HLV Herve Renard đột ngột n&oacute;i lời chia tay. &Ocirc;ng Herve Renard đ&atilde; nhận lời dẫn dắt đội tuyển nữ Ph&aacute;p với mục ti&ecirc;u đạt th&agrave;nh t&iacute;ch cao tại VCK World Cup nữ 2023, diễn ra ở &Uacute;c v&agrave; New Zealand v&agrave;o th&aacute;ng 7 tới đ&acirc;y. Vị HLV người Ph&aacute;p từng trở n&ecirc;n nổi tiếng khi c&ugrave;ng đội tuyển Ả Rập X&ecirc; &Uacute;t ngược d&ograve;ng ngoạn mục để gi&agrave;nh chiến thắng trước đội tuyển Argentina tại lượt trận đầu của VCK World Cup 2022.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/paulofonseca-mourinhojekp-16807837069301541803470.jpeg\" target=\"_blank\" title=\"HLV Mourinho được đề nghị mức lương cao kỷ lục nếu đến Ả Rập Xê Út làm việc\"><img alt=\"HLV Mourinho nhận mức lương kỷ lục nếu đến châu Á - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/paulofonseca-mourinhojekp-16807837069301541803470.jpeg\" title=\"HLV Mourinho nhận mức lương kỷ lục nếu đến châu Á - Ảnh 1.\" /></a></p>\n\n<p>HLV Mourinho được đề nghị mức lương cao kỷ lục nếu đến Ả Rập X&ecirc; &Uacute;t l&agrave;m việc</p>\n\n<p>AFP</p>\n\n<p>HLV Mourinho gia nhập&nbsp;<a href=\"https://thanhnien.vn/as-roma.html\" target=\"_blank\" title=\"AS Roma\">AS Roma</a>&nbsp;từ năm 2021 v&agrave; hiện đang nhận mức lương khoảng 8 triệu bảng Anh/năm. Hợp đồng hiện tại của &quot;Người đặc biệt&quot; v&agrave; CLB nước &Yacute; c&oacute; thời hạn đến năm 2024. Trong khi đ&oacute;, HLV đang hưởng lương cao nhất thế giới v&agrave;o l&uacute;c n&agrave;y l&agrave; Diego Simeone, khi nhận khoảng 30 triệu bảng Anh mỗi m&ugrave;a từ CLB Atletico Madrid.</p>\n\n<p>Hiện tại, HLV Mourinho vẫn chưa l&ecirc;n tiếng về th&ocirc;ng tin n&agrave;y. Tuy nhi&ecirc;n, trước những đồn đo&aacute;n sẽ thay đổi nơi l&agrave;m việc trước đ&acirc;y, cựu HLV của Real Marid từng khẳng định vẫn ưu ti&ecirc;n ở lại AS Roma, &iacute;t nhất l&agrave; cho đến hết m&ugrave;a giải 2022 - 2023. HLV Mourinho muốn xem x&eacute;t tham vọng của đội b&oacute;ng &aacute;o b&atilde; trầu trong thời gian tới, với những bản hợp đồng chất lượng để hướng đến mục ti&ecirc;u cao hơn. &Ocirc;ng được cho l&agrave; đ&atilde; y&ecirc;u cầu ban l&atilde;nh đạo CLB mua &iacute;t nhất 3 cầu thủ mới, gồm 1 tiền đạo, 1 tiền vệ v&agrave; 1 hậu vệ trong kỳ chuyển nhượng m&ugrave;a h&egrave; sắp tới nếu tiếp tục nắm quyền.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/tai-xuong-1-1680783950199955276584.jpeg\" target=\"_blank\" title=\"CLB của Ronaldo cũng được cho là đã tiếp cận với HLV Mourinho\"><img alt=\"HLV Mourinho nhận mức lương kỷ lục nếu đến châu Á - Ảnh 2.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/tai-xuong-1-1680783950199955276584.jpeg\" title=\"HLV Mourinho nhận mức lương kỷ lục nếu đến châu Á - Ảnh 2.\" /></a></p>\n\n<p>CLB của Ronaldo cũng được cho l&agrave; đ&atilde; tiếp cận với HLV Mourinho</p>\n\n<p>AFP</p>\n\n<p>B&ecirc;n cạnh lời đề nghị nắm đội tuyển Ả Rập X&ecirc; &Uacute;t, b&aacute;o ch&iacute; &Yacute; cũng đưa tin rằng HLV Mourinho c&oacute; khả năng t&aacute;i ngộ với người cũ Cristiano&nbsp;<a href=\"https://thanhnien.vn/ronaldo.html\" target=\"_blank\" title=\"Ronaldo\">Ronaldo</a>. Tiền đạo người Bồ Đ&agrave;o Nha hiện đang thi đấu trong m&agrave;u &aacute;o CLB Al-Nassr tại giải v&ocirc; địch quốc gia Ả Rập X&ecirc; &Uacute;t.</p>\n', 1, '2023-04-06 21:23:40', '2023-09-16 16:35:39', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(40, 'Erik ten-Hag nổi giận khi M.U chơi một trận tồi tệ', 'https://res.cloudinary.com/dxctlgwec/image/upload/zrf1nnjclj4wyfun9cuf', 'M.U đang có phong độ tốt nhưng bất ngờ chơi một trận dưới sức để cho Liverpool đánh bại với tỷ số 7-0 khiến cho HLV Erik ten-Hag nổi giận.', '<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/3/5/mu-that-bai-16780567367821322460491.jpg\" target=\"_blank\" title=\"M.U thất bại thảm hại trước Liverpool\"><img alt=\"Erik ten-Hag nổi giận khi M.U chơi một trận tồi tệ - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/3/5/mu-that-bai-16780567367821322460491.jpg\" title=\"Erik ten-Hag nổi giận khi M.U chơi một trận tồi tệ - Ảnh 1.\" /></a></p>\n\n<p>M.U thất bại thảm hại trước Liverpool</p>\n\n<p>AFP</p>\n\n<p><a href=\"https://thanhnien.vn/hlv-erik-ten-hag-tiet-lo-da-ngu-ngon-sau-khi-tong-khu-cristiano-ronaldo-khoi-mu-185230305082901744.htm\" title=\"Erik ten Hag\">Erik ten Hag</a>&nbsp;đ&atilde; nổi giận sau thất bại thảm hại của Manchester United trước Liverpool. &Ocirc;ng n&oacute;i rằng c&aacute;c cầu thủ của m&igrave;nh đ&atilde; c&oacute; m&agrave;n tr&igrave;nh diễn &quot;thiếu chuy&ecirc;n nghiệp&quot; v&agrave; thiếu kỷ luật.</p>\n\n<p>M.U đ&atilde; bị đối thủ kh&ocirc;ng đội trời chung của m&igrave;nh đ&aacute;nh bại 7-0 tại Anfield khi Cody Gakpo, Darwin Nunez v&agrave; Mohamed Salah mỗi người ghi 2 b&agrave;n. B&agrave;n c&ograve;n lại do Roberto Firmino cuối trận để cứa th&ecirc;m nh&aacute;t dao v&agrave;o nỗi đau của &quot;Quỷ đỏ&quot;. Trận thua n&agrave;y, khiến Manchester United gần như kh&ocirc;ng c&ograve;n cơ hội đua v&ocirc; địch Ngoại hạng Anh ở m&ugrave;a giải năm nay khi họ đ&atilde; thua đội đầu bảng Arsenal đến 14 điểm.</p>\n\n<p>Đ&acirc;y cũng l&agrave; trận thua nặng nề nhất của HLV Erik ten-Hag trong trận đấu thứ 481 của &ocirc;ng tr&ecirc;n cương vị huấn luyện vi&ecirc;n.</p>\n\n<p>Sau trận thua, HLV người H&agrave; Lan n&oacute;i với Sky Sports: &quot;T&ocirc;i kh&ocirc;ng c&oacute; lời giải th&iacute;ch n&agrave;o. Trong hiệp một, ch&uacute;ng t&ocirc;i đ&atilde; kiểm so&aacute;t kh&aacute; tốt. Đầu hiệp hai, ch&uacute;ng t&ocirc;i đ&atilde; để thủng lưới hai b&agrave;n. Ch&uacute;ng t&ocirc;i kh&ocirc;ng c&ograve;n l&agrave; một đội b&oacute;ng. C&aacute;c cầu thủ đ&atilde; kh&ocirc;ng tu&acirc;n theo kế hoạch. T&ocirc;i kh&ocirc;ng thể kiểm so&aacute;t được c&aacute;ch chơi của c&aacute;c cầu thủ, điều đ&oacute; thực sự tồi tệ. T&ocirc;i đ&atilde; n&oacute;i chuyện với c&aacute;c cầu thủ. Thật kh&ocirc;ng chuy&ecirc;n nghiệp.</p>\n\n<p>Ở tr&ecirc;n s&acirc;n, c&aacute;c cầu thủ biết rằng họ lu&ocirc;n phải gắn b&oacute;, hỗ trợ nhau như một tập thể tốt. Nhưng họ đ&atilde; kh&ocirc;ng l&agrave;m được điều đ&oacute;. Kh&ocirc;ng c&oacute; kỷ luật. Bất cứ l&uacute;c n&agrave;o ch&uacute;ng ta cũng c&oacute; thể thất bại, nhưng ch&uacute;ng ta phải gắn b&oacute; với nhau v&agrave; ho&agrave;n th&agrave;nh c&ocirc;ng việc của m&igrave;nh&quot;.</p>\n\n<p>Liverpool đ&atilde; tận hưởng chiến thắng đậm nhất trước&nbsp;<a href=\"https://thanhnien.vn/casemiro-tro-thanh-nguoi-hung-ganh-vac-tuyen-giua-mu-the-nao-185230305090653795.htm\" title=\"M.U \">M.U&nbsp;</a>trong lịch sử đối đầu của 2 đội, chiến thắng lớn nhất trước đ&acirc;y l&agrave; trận thắng 7-1 của Liverpool v&agrave;o th&aacute;ng 10 năm 1895. Trận thắng n&agrave;y, gi&uacute;p Liverpool mở ra hy vọng đua v&agrave;o top 4 khi chỉ c&ograve;n thua đội đang xếp thứ 4 l&agrave; Tottenham 3 điểm.</p>\n\n<p>Gần như chưa thể nuốt tr&ocirc;i thất bại qu&aacute; &ecirc; ch&egrave;, HLV Erik ten-Hag n&oacute;i th&ecirc;m: &quot;T&ocirc;i thật sự thất vọng v&agrave; tức giận. Ch&uacute;ng t&ocirc;i đ&atilde; khiến người h&acirc;m mộ thất vọng. Đ&uacute;ng ra c&aacute;c cầu thủ phải gắn b&oacute; với nhau, hỗ trợ lẫn nhau v&agrave; chiến đấu v&igrave; nhau. Ch&uacute;ng t&ocirc;i đ&uacute;ng ra phải ph&ograve;ng thủ tốt, nhưng đ&atilde; kh&ocirc;ng l&agrave;m được điều đ&oacute;, thật sự rất thiếu chuy&ecirc;n nghiệp. Ch&uacute;ng t&ocirc;i đ&atilde; đạt được nhiều tiến bộ trong thời gian qua, nhưng khi chơi một trận đấu thiếu chuy&ecirc;n nghiệp đ&atilde; đ&aacute;nh mất tất cả. T&ocirc;i đ&atilde; n&oacute;i với c&aacute;c cầu thủ trong ph&ograve;ng thay đồ l&agrave; điều n&agrave;y kh&ocirc;ng thể chấp nhận được&quot;.</p>\n\n<p>M.U sẽ cần chứng tỏ m&igrave;nh trong trận tiếp Real Betis ở lượt đi v&ograve;ng 16 đội Europa League v&agrave;o thứ năm tới để xoa dịu nỗi đau thua đậm trước Liverpool.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Chỉnh sửa b&agrave;i viết ở đ&acirc;y</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', 1, '2023-04-06 21:24:19', '2023-09-16 16:35:56', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(41, 'Fernandes bị bêu xấu khi đòi ra sân trong trận thảm bại của M.U trước Liverpool', 'https://res.cloudinary.com/dxctlgwec/image/upload/zrf1nnjclj4wyfun9cuf', 'Cựu hậu vệ nổi tiếng của M.U Gary Neville chỉ trích Bruno Fernandes vì yêu cầu HLV Erik ten Hag được thay thế trong trận thua thảm bại 0-7 của \'Quỷ đỏ\' trên sân Liverpool ở vòng 27 Ngoại hạng Anh kết thúc rạng sáng nay (6.3).', '<p>Huyền thoại đội chủ s&acirc;n s&acirc;n&nbsp;<a href=\"https://thanhnien.vn/hlv-klopp-len-tieng-sau-khi-liverpool-de-bep-mu-185230306050703033.htm\" title=\"Old Trafford\">Old Trafford</a>, Gary Neville thực sự bị sốc trước h&agrave;nh động &quot;thiếu chuy&ecirc;n nghiệp&quot; của Fernandes, nhất l&agrave; khi M.U đang bị Liverpool dẫn 6-0 tr&ecirc;n s&acirc;n Anfield. Khi Anthony Elanga v&agrave;o thay Marcus Rashford ở ph&uacute;t 85, Neville n&oacute;i với<em>&nbsp;Sky Sports</em>: &quot; Bruno Fernandes đứng ở v&ograve;ng tr&ograve;n trung t&acirc;m giơ hai tay l&ecirc;n v&agrave; n&oacute;i: Tại sao t&ocirc;i kh&ocirc;ng ra s&acirc;n? T&ocirc;i phải th&agrave;nh thật n&oacute;i rằng một số h&agrave;nh vi của anh ấy (Fernandes) trong hiệp 2 l&agrave; một sự xấu hổ&quot; Neville sau đ&oacute; nhấn mạnh th&ecirc;m: &quot;T&ocirc;i đ&atilde; ch&aacute;n ngấy cảnh anh ta vung tay, kh&ocirc;ng thi đấu. Đ&oacute; kh&ocirc;ng phải l&agrave; m&agrave;n tr&igrave;nh diễn của một đội trưởng&quot;.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/3/5/00033al4du-16780564651531208148225.jpg\" target=\"_blank\" title=\"Fernandes bị chỉ trích vì đòi thay người khi M.U bị dẫn 6-0\"><img alt=\"Fernandes bị bêu xấu khi đòi ra sân trong trận thảm bại của M.U trước Liverpool - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/3/5/00033al4du-16780564651531208148225.jpg\" title=\"Fernandes bị bêu xấu khi đòi ra sân trong trận thảm bại của M.U trước Liverpool - Ảnh 1.\" /></a></p>\n\n<p>Fernandes bị chỉ tr&iacute;ch v&igrave; đ&ograve;i thay người khi M.U bị dẫn 6-0</p>\n\n<p>AFP</p>\n\n<p>Đồng đội cũ của Neville ở&nbsp;<a href=\"https://thanhnien.vn/hlv-klopp-len-tieng-sau-khi-liverpool-de-bep-mu-185230306050703033.htm\" title=\"M.U\">M.U</a>, Roy Keane , cũng kh&oacute; chịu kh&ocirc;ng k&eacute;m với Fernandes. C&aacute;c chuy&ecirc;n gia b&igrave;nh luận như Keane v&agrave; Graeme Souness cho rằng M.U đ&atilde; &quot;bu&ocirc;ng xu&ocirc;i&quot; khi&nbsp;<a href=\"https://thanhnien.vn/hlv-klopp-len-tieng-sau-khi-liverpool-de-bep-mu-185230306050703033.htm\" title=\"Liverpool\">Liverpool</a>&nbsp;li&ecirc;n tiếp ghi 6 b&agrave;n trong hiệp 2 sau khi dẫn 1-0 trong hiệp đầu ti&ecirc;n v&agrave; l&agrave;m n&ecirc;n chiến thắng đậm kỷ lục trước đối thủ được v&iacute; &quot;kh&ocirc;ng đội trời chung&quot;. Cody Gakpo, Darwin Nunez v&agrave; Mohamed Salah mỗi người lập c&uacute; đ&uacute;p trước khi Roberto Firmino dứt điểm kh&eacute;o l&eacute;o ghi b&agrave;n thứ 7 cho đội b&oacute;ng của HLV Jurgen Klopp.</p>\n\n<p>Ph&aacute;t biểu tr&ecirc;n&nbsp;<em>Sky Sports</em>, Keane n&oacute;i: &quot;Ng&ocirc;n ngữ cơ thể của Fernandes h&ocirc;m nay thật đ&aacute;ng xấu hổ&quot;. Keane n&oacute;i th&ecirc;m: &quot;C&aacute;c cầu thủ chắc chắn sẽ cảm thấy xấu hổ. Họ đ&atilde; mất t&iacute;ch trong hiệp 2. Nhưng t&ocirc;i phải n&oacute;i rằng Liverpool thực sự tuyệt vời. Năng lượng của họ, khả năng ra quyết định&hellip; Liverpool đ&atilde; trở lại với phong độ rất tốt&quot;.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/3/5/00033al4dm-16780564650681018549496.jpg\" target=\"_blank\" title=\"Liverpool đã có chiến thắng đậm kỷ lục trước kình địch M.U\"><img alt=\"Fernandes bị bêu xấu khi đòi ra sân trong trận thảm bại của M.U trước Liverpool - Ảnh 2.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/3/5/00033al4dm-16780564650681018549496.jpg\" title=\"Fernandes bị bêu xấu khi đòi ra sân trong trận thảm bại của M.U trước Liverpool - Ảnh 2.\" /></a></p>\n\n<p>Liverpool đ&atilde; c&oacute; chiến thắng đậm kỷ lục trước k&igrave;nh địch M.U</p>\n\n<p>AFP</p>\n\n<p>Bản th&acirc;n Fernandes sau đ&oacute; cũng thừa nhận: &quot;Thật sự rất bực bội v&igrave; đ&oacute; l&agrave; một kết quả qu&aacute; tệ. Hiệp 1 diễn ra thực sự tốt, ch&uacute;ng t&ocirc;i tạo ra nhiều c&aacute;c cơ hội, họ kh&ocirc;ng c&oacute; nhiều. Hiệp 2 kh&ocirc;ng phải l&agrave; đẳng cấp của ch&uacute;ng t&ocirc;i&quot;.</p>\n\n<p>Trận thua đậm tr&ecirc;n s&acirc;n Liverpool khiến hy vọng theo đuổi chức v&ocirc; địch Ngoại hạng Anh m&ugrave;a n&agrave;y của M.U lung lay do k&eacute;m đội đầu bảng Arsenal 13 điểm. Trong khi đ&oacute;, Liverpool &aacute;p s&aacute;t tốp 4 sau chuỗi trận sa s&uacute;t.</p>\n', 1, '2023-04-06 21:25:55', '2023-09-16 16:36:10', 'Trịnh Huỳnh Chấn Quang', 'quangvk'),
(59, 'Barcelona sẽ trả khoản nợ 1,5 tỉ euro để cải tạo SVĐ sớm hơn 5 năm', 'https://res.cloudinary.com/dxctlgwec/image/upload/ve2rv73ksmlu5gxq2mst', 'Theo các trang báo của Tây Ban Nha là El Confidencial và La Vanguardia, Barcelona sẽ hoàn thành việc thanh toán khoản nợ đã vay 1,5 tỉ euro để cải tạo SVĐ Camp Nou sớm hơn 5 năm so với thỏa thuận trước đó.', '<p>Theo đ&oacute;, ng&agrave;y 6.4, Barcelona&nbsp;đ&atilde; đ&agrave;m ph&aacute;n một kế hoạch t&agrave;i ch&iacute;nh trị gi&aacute; 1,5 tỉ euro với hai đơn vị Goldman Sachs GS.N v&agrave; JP Morgan JPM.N. Theo c&aacute;c b&aacute;o c&aacute;o trước đ&oacute;, khoản nợ c&oacute; l&atilde;i suất sẽ rơi v&agrave;o con số 5,5%. Hai đơn vị n&agrave;y cam kết sẽ t&aacute;i cấp vốn cho khoản vay sau 5 năm, khi s&acirc;n đ&atilde; được n&acirc;ng cấp v&agrave; đi v&agrave;o hoạt động.</p>\n\n<p>Cũng theo c&aacute;c điều khoản mới,&nbsp;<a href=\"https://thanhnien.vn/barcelona-phu-nhan-tim-cach-dua-messi-tro-ve-san-nou-camp-185230406075652662.htm\" title=\"Barcelona\">Barcelona</a>&nbsp;sẽ cam kết trả hết khoản vay v&agrave;o năm 2047 thay v&igrave; năm 2052 như trước đ&oacute;. Người ph&aacute;t ng&ocirc;n của Barcelona cho biết đ&acirc;y l&agrave; một kế hoạch phức tạp v&agrave; họ sẽ c&oacute; th&ocirc;ng b&aacute;o chi tiết đến với người h&acirc;m mộ khi c&oacute; những k&yacute; kết ch&iacute;nh thức.</p>\n\n<p><a href=\"https://images2.thanhnien.vn/528068263637045248/2023/4/6/campnou-gettyimages-16807899545951214458886.jpg\" target=\"_blank\" title=\"Barcelona sẽ trả khoản vay 1,5 tỉ euro vào năm 2047 thay vì năm 2052 như trước đó\"><img alt=\"Barcelona sẽ trả khoản nợ 1,5 tỉ euro để cải tạo SVĐ sớm hơn 5 năm - Ảnh 1.\" src=\"https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/6/campnou-gettyimages-16807899545951214458886.jpg\" title=\"Barcelona sẽ trả khoản nợ 1,5 tỉ euro để cải tạo SVĐ sớm hơn 5 năm - Ảnh 1.\" /></a></p>\n\n<p>Barcelona sẽ trả khoản vay 1,5 tỉ euro v&agrave;o năm 2047 thay v&igrave; năm 2052 như trước đ&oacute;</p>\n\n<p>AFP</p>\n\n<p>Việc đ&agrave;m ph&aacute;n giữa Barcelona v&agrave; hai đơn vị cho vay l&agrave; Goldman Sachs GS.N, JP Morgan JPM.N diễn ra trong bối cảnh đội b&oacute;ng xứ Catalan vẫn đang bị điều tra v&igrave; những c&aacute;o buộc li&ecirc;n quan đến hối lộ trọng t&agrave;i. Trước đ&oacute;, chủ tịch UEFA, &ocirc;ng&nbsp;<a href=\"https://thanhnien.vn/chu-tich-aleksander-ceferin-uefa-dang-mat-hang-trieu-usd-vi-covid-19-1851352800.htm\" title=\"Aleksander Ceferin\">Aleksander Ceferin</a>&nbsp;đ&atilde; gọi đ&acirc;y l&agrave; một trong những vụ việc nghi&ecirc;m trọng nhất trong b&oacute;ng đ&aacute;.</p>\n\n<p>UEFA cũng đ&atilde; mở một cuộc điều tra ch&iacute;nh thức về Barcelona v&agrave;o th&aacute;ng 3.2023. Cơ quan n&agrave;y nghi ngờ rằng ngo&agrave;i những b&ecirc; bối li&ecirc;n quan đến trọng t&agrave;i, Barcelona c&oacute; thể đ&atilde; vi phạm những vấn đề t&agrave;i ch&iacute;nh kh&aacute;c.</p>\n\n<p>Trước đ&oacute;, Barcelona đ&atilde; bị c&aacute;o buộc thanh to&aacute;n khoản tiền 7,3 triệu euro cho c&aacute;c c&ocirc;ng ty thuộc sở hữu của Jose Maria Enriquez&nbsp;<a href=\"https://thanhnien.vn/chu-tich-uefa-canh-bao-clb-barcelona-vu-negreira-rat-nghiem-trong-185230404091519439.htm\" title=\"Negreira \">Negreira&nbsp;</a>- người từng l&agrave; Ph&oacute; chủ tịch Ủy ban trọng t&agrave;i của Li&ecirc;n đo&agrave;n B&oacute;ng đ&aacute; T&acirc;y Ban Nha trong giai đoạn từ năm 2001 đến 2018.&nbsp;</p>\n\n<p>Trong một tuy&ecirc;n bố v&agrave;o th&aacute;ng 2.2023, Barcelona đ&atilde; phủ nhận mọi h&agrave;nh vi sai tr&aacute;i v&agrave; đội b&oacute;ng xứ Catalan n&oacute;i rằng họ chỉ đơn thuần l&agrave; trả tiền cho một nh&agrave; tư vấn b&ecirc;n ngo&agrave;i, người đ&atilde; cung cấp cho đội b&oacute;ng c&aacute;c b&aacute;o c&aacute;o kỹ thuật li&ecirc;n quan đến trọng t&agrave;i chuy&ecirc;n nghiệp.&nbsp;<a href=\"https://thanhnien.vn/barcelona-phu-nhan-tim-cach-dua-messi-tro-ve-san-nou-camp-185230406075652662.htm\" title=\"Barcelona\">Barcelona</a>&nbsp;cho rằng điều n&agrave;y hết sức b&igrave;nh thường v&agrave; n&oacute; đ&atilde; được nhiều đội b&oacute;ng thi đấu chuy&ecirc;n nghiệp &aacute;p dụng.&nbsp;</p>\n', 1, '2023-05-01 09:13:09', '2023-09-16 16:36:25', 'admin', 'quangvk');
INSERT INTO `new` (`id`, `title`, `thumbnail`, `shortdescription`, `content`, `category_id`, `createddate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(60, 'M.U chính thức vô địch C1 2007-2008', 'https://res.cloudinary.com/dxctlgwec/image/upload/xok2fp8x3d76g9mzrrup', 'Mùa 2007/08, Man United với những Cristiano Ronaldo, Edwin van der Sar, Wayne Rooney, Rio Ferdinand... đã xuất sắc bỏ túi \"cú đúp\" danh hiệu gồm Premier League và Champions League. Vậy số phận của họ giờ ra sao?', '<p>THỦ M&Ocirc;N: EDWIN VAN DER SAR</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu1.jpg\" /></p>\n\n<p>Sau những năm th&aacute;ng h&agrave;o h&ugrave;ng c&ugrave;ng M.U, Van der Sar giải nghệ v&agrave;o năm 2011. Hiện tại, &ocirc;ng đang đảm nhận vai tr&ograve; gi&aacute;m đốc điều h&agrave;nh tại CLB cũ Ajax Amsterdam.</p>\n\n<p>HẬU VỆ PHẢI: WES BROWN</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu2.jpg\" /></p>\n\n<p>Do Gary Neville chấn thương, Sir Alex Ferguson đ&atilde; k&eacute;o Brown đ&atilde; hậu vệ phải ở m&ugrave;a 2007/08. Đ&acirc;y l&agrave; một quyết định mạo hiểm nhưng Brown đ&atilde; đ&aacute;p lại niềm tin của &ocirc;ng thầy người Scotland. Anh rời&nbsp;<a href=\"https://bongdaplus.vn/man-united-tags.html\">M.U</a>&nbsp;năm 2011, chuyển sang kho&aacute;c &aacute;o Sunderland, Blackburn Rovers rồi Kerala Blasters. Ở tuổi 40, Brown giờ l&agrave; cầu thủ tự do sau khi chia tay Kerala năm 2018.</p>\n\n<p>TRUNG VỆ: RIO FERDINAND</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu3.jpg\" /></p>\n\n<p>Ferdinand ch&iacute;nh l&agrave; &quot;h&ograve;n đ&aacute; tảng&quot; của M.U năm xưa. Anh rời Old Trafford năm 2014, d&agrave;nh một m&ugrave;a thi đấu cho Queens Park Rangers trước khi treo gi&agrave;y. Hiện tại, Ferdinand l&agrave; chuy&ecirc;n gia b&igrave;nh luận của k&ecirc;nh BT Sport.</p>\n\n<p>TRUNG VỆ: NEMANJA VIDIC</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu4.jpg\" /></p>\n\n<p>Vidic kết hợp với Ferdinand tạo ra tấm l&aacute; chắn th&eacute;p kh&oacute; bị xuy&ecirc;n ph&aacute; của M.U xuy&ecirc;n suốt m&ugrave;a 2007/08. Trung vệ n&agrave;y giải nghệ v&agrave;o năm 2016 sau khi c&oacute; qu&atilde;ng thời gian ngắn kho&aacute;c &aacute;o Inter Milan.</p>\n\n<p>HẬU VỆ TR&Aacute;I: PATRICE EVRA</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu5.jpg\" /></p>\n\n<p>M&agrave;n tr&igrave;nh diễn xuất sắc của Evra b&ecirc;n h&agrave;nh lang c&aacute;nh tr&aacute;i l&agrave; tiền đề gi&uacute;p Man United th&agrave;nh c&ocirc;ng ở Premier League lẫn Champions League m&ugrave;a 2007/08. Anh rời M.U sang Juventus năm 2014. Tới th&aacute;ng 7/2019, Evra tuy&ecirc;n bố giải nghệ sau thời gian đ&aacute;o hạn hợp đồng với West Ham.</p>\n\n<p>TIỀN VỆ TR&Aacute;I: RYAN GIGGS</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu6.jpg\" /></p>\n\n<p>Giggs ch&iacute;nh l&agrave; người thực hiện quả đ&aacute; 11 m&eacute;t quyết định gi&uacute;p M.U v&ocirc; địch Champions League 2007/08 ở Moscow, Nga. Sau khi giải nghệ năm 2014, Giggs l&agrave;m trợ l&yacute; cho Louis van Gaal tại Quỷ đỏ trong 2 năm. Hiện tại, Giggs đang l&agrave; HLV trưởng của ĐTQG xứ Wales.</p>\n\n<p>TIỀN VỆ TRUNG T&Acirc;M: MICHAEL CARRICK</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu7.jpg\" /></p>\n\n<p>M&ugrave;a 2007/08 kh&ocirc;ng phải m&ugrave;a giải hay nhất của Carrick do anh d&iacute;nh chấn thương. Tuy nhi&ecirc;n, anh đ&atilde; chơi trọn 120 ph&uacute;t ở trận chung kết Champions League, g&oacute;p c&ocirc;ng gi&uacute;p Quỷ đỏ đăng quang. Carrick vẫn ở M.U tới năm 2018 trước khi giải nghệ. Anh hiện l&agrave; trợ l&yacute; cho HLV Ole Gunnar Solskjaer ở M.U.</p>\n\n<p>TIỀN VỆ TRUNG T&Acirc;M: PAUL SCHOLES</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu8.jpg\" /></p>\n\n<p>Scholes l&agrave; t&aacute;c giả của b&agrave;n thắng tuyệt đẹp v&agrave;o lưới Barcelona, gi&uacute;p M.U v&agrave;o chung kết Champions League 2007/08. Scholes treo gi&agrave;y năm 2012 song bất ngờ trở lại khi được Sir Alex mời gọi cứu rỗi đội b&oacute;ng trong giai đoạn chấn thương t&agrave;n ph&aacute; đội b&oacute;ng. Anh treo gi&agrave;y lần 2 v&agrave;o năm 2013, trở th&agrave;nh chuy&ecirc;n gia b&igrave;nh luận. Ngo&agrave;i ra, Scholes c&ograve;n l&agrave; đồng sở hữu của CLB Salford c&ugrave;ng với Ryan Giggs, Nicky Butt v&agrave; anh em nh&agrave; Neville.</p>\n\n<p>TIỀN VỆ PHẢI: CRISTIANO RONALDO</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu9.jpg\" /></p>\n\n<p>Ở m&ugrave;a 2007/08, Ronaldo ghi 42 b&agrave;n c&ugrave;ng 8 đường kiến tạo sau 49 lần ra s&acirc;n tr&ecirc;n mọi đấu trường. Đ&oacute; cũng l&agrave; năm si&ecirc;u sao người Bồ Đ&agrave;o Nha ẵm danh hiệu Quả b&oacute;ng V&agrave;ng v&agrave; Cầu thủ xuất sắc nhất năm của FIFA. Ronaldo rời M.U gia nhập Real Madrid năm 2009, vươn tầm trở th&agrave;nh một trong những cầu thủ vĩ đại nhất lịch sử l&agrave;ng t&uacute;c cầu. Hiện tại, CR7 đang chơi cho Juventus ở Serie A.</p>\n\n<p>TIỀN ĐẠO: CARLOS TEVEZ</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu10.jpg\" /></p>\n\n<p>Sau khi cứu West Ham tho&aacute;t khỏi suất xuống hạng m&ugrave;a 2006/07, Tevez gia nhập Man United. Sau 48 lần ra s&acirc;n, ch&acirc;n s&uacute;t người Argentina đ&oacute;ng g&oacute;p 19 b&agrave;n c&ugrave;ng 7 đường kiến tạo. Hiện tại, Tevez đang thi đấu cho CLB Boca Juniors, sau qu&atilde;ng thời gian cống hiến cho Juventus v&agrave; Shanghai Shenhua.</p>\n\n<p>WAYNE ROONEY</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/muu11.jpg\" /></p>\n\n<p>Rooney v&agrave; Ronaldo đ&atilde; tạo ra cặp b&agrave;i tr&ugrave;ng đ&aacute;ng sợ của M.U m&ugrave;a 2007/08. Sau khi Ronaldo rời đi, &quot;G&atilde; Shrek&quot; trở th&agrave;nh chủ c&ocirc;ng của Quỷ đỏ, ghi cả thảy 253 b&agrave;n sau 559 trận tr&ecirc;n mọi đấu trường. Rooney rời M.U năm 2017, v&agrave; hiện l&agrave; HLV ki&ecirc;m cầu thủ của Derby County - CLB đang thi đấu tại Championship.</p>\n\n<p>&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.bongdaplus.vn/Assets/Media/2020/04/17/66/mu2.jpg\" /></p>\n\n<p>&nbsp;</p>\n\n<p>@Twinkle</p>\n', 1, '2023-05-03 21:57:41', '2023-09-16 16:36:45', 'hieuou123', 'quangvk'),
(63, 'U22 Việt Nam - U22 Myanmar (hiệp 2) 2-0: Văn Cường lập cú đúp', 'https://res.cloudinary.com/dxctlgwec/image/upload/ewiy4qovnrr9auorwmmf', 'Phút 35, Hồ Văn Cường thoát xuống bên cánh phải dứt điểm cận thành nâng tỉ số lên 2-0 cho U22 Việt Nam trước U22 Myanmar. Đây cũng là pha lập công thứ hai của Văn Cường ở trận này.', '<p><a href=\"https://cdn.tuoitre.vn/471584752817336320/2023/5/16/van-cuong-mo-ti-so-16842283077971217469918.jpeg\" rel=\"nofollow\" target=\"_blank\"><img alt=\"U22 Việt Nam sớm có bàn thắng trước U22 Myanmar - Ảnh: N.K\" id=\"img_582858555744292864\" src=\"https://cdn.tuoitre.vn/thumb_w/1060/471584752817336320/2023/5/16/van-cuong-mo-ti-so-16842283077971217469918.jpeg\" title=\"U22 Việt Nam - U22 Myanmar (hiệp 1) 1-0: Văn Cường mở tỉ số - Ảnh 1.\" /></a></p>\n\n<p>U22 Việt Nam sớm c&oacute; b&agrave;n thắng trước U22 Myanmar - Ảnh: N.K</p>\n\n<p>D&ugrave; được đ&aacute;nh gi&aacute; cao hơn U22 Myanmar nhưng&nbsp;<a href=\"https://tuoitre.vn/u22-viet-nam.html\" title=\"U22 Việt Nam\">U22 Việt Nam</a>&nbsp;cần phải cải thiện tấn c&ocirc;ng lẫn ph&ograve;ng ngự nếu muốn gi&agrave;nh chiến thắng.</p>\n\n<p>Thật vậy, h&agrave;ng c&ocirc;ng - chỗ dựa cho triết l&yacute; &quot;chiến thắng bằng c&aacute;ch ghi nhiều b&agrave;n hơn đối thủ&quot; của HLV Troussier đ&atilde; bỏ qua nhiều cơ hội ghi b&agrave;n trong c&aacute;c trận đấu vừa qua. Trong khi đ&oacute;, h&agrave;ng ph&ograve;ng ngự tiếp tục mắc nhiều sai s&oacute;t.</p>\n\n<p>U22 Việt Nam chỉ c&oacute; một buổi tập v&agrave;o h&ocirc;m qua (15-5) để thay đổi, nhưng thể hiện thế n&agrave;o lại l&agrave; c&acirc;u chuyện phải chờ sự kiểm chứng của... U22 Myanmar.</p>\n\n<p>Mất tiền đạo Thanh Nh&agrave;n v&igrave; chấn thương, HLV Troussier mất đi một mũi xuy&ecirc;n ph&aacute; lợi hại ở bi&ecirc;n phải. Ở c&aacute;nh đối diện, L&ecirc; Văn Đ&ocirc; cũng tịt ng&ograve;i. Trận n&agrave;y, HLV Troussier lại mất&nbsp; Văn T&ugrave;ng v&igrave; chấn thương. Do đ&oacute; tr&aacute;ch nhiệm ghi b&agrave;n được đặt l&ecirc;n vai bộ ba Văn Khang - Văn Trường - Văn Đ&ocirc;.</p>\n\n<p><a href=\"https://cdn.tuoitre.vn/471584752817336320/2023/5/16/doi-hinh-ra-san-u22-viet-nam-16842295234821069243130.png\" rel=\"nofollow\" target=\"_blank\"><img alt=\"Đội hình ra sân của U22 Việt Nam - Đồ hoạ: AN BÌNH\" id=\"img_582863655378857984\" src=\"https://cdn.tuoitre.vn/thumb_w/1060/471584752817336320/2023/5/16/doi-hinh-ra-san-u22-viet-nam-16842295234821069243130.png\" title=\"U22 Việt Nam - U22 Myanmar (hiệp 1) 1-0: Văn Cường mở tỉ số - Ảnh 2.\" /></a></p>\n\n<p>Đội h&igrave;nh ra s&acirc;n của U22 Việt Nam - Đồ hoạ: AN B&Igrave;NH</p>\n', 1, '2023-05-16 17:16:17', '2023-09-16 16:37:05', 'quangvk', 'quangvk'),
(66, 'Cổ động viên Thái Lan gửi lời xin lỗi đến U22 Indonesia', 'https://res.cloudinary.com/dxctlgwec/image/upload/hh5dpsb1xw4wyzlsxbhm', 'Cuộc hỗn chiến giữa U22 Thái Lan và Indonesia ở chung kết SEA Games đã trở thành đề tài chính trên các diễn đàn bóng đá Đông Nam Á.', '<p>Hỗn chiến ở trận chung kết b&oacute;ng đ&aacute; nam SEA Games 32 giữa U22 Indonesia v&agrave; U22 Th&aacute;i Lan - Nguồn: FPT Play</p>\n\n<p><a href=\"https://cdn.tuoitre.vn/471584752817336320/2023/5/16/34454577655853043249026104968755797948955700n-16842492894401628456167.jpg\" rel=\"nofollow\" target=\"_blank\"><img alt=\"Cổ động viên Thái Lan gửi lời xin lỗi đến U22 Indonesia - Ảnh 1.\" id=\"img_582946561749135360\" src=\"https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/5/16/34454577655853043249026104968755797948955700n-16842492894401628456167.jpg\" title=\"Cổ động viên Thái Lan gửi lời xin lỗi đến U22 Indonesia - Ảnh 1.\" /></a></p>\n\n<p>C&aacute;c cầu thủ U22 Th&aacute;i Lan v&agrave; U22 Indonesia hỗn chiến ở chung kết SEA Games 32 - Ảnh: NAM TRẦN</p>\n\n<p>B&agrave;i đăng về cuộc hỗn chiến giữa hai đội tr&ecirc;n ASEAN Football v&agrave; nhiều diễn đ&agrave;n kh&aacute;c đ&atilde; thu h&uacute;t h&agrave;ng ng&agrave;n lượt like v&agrave; b&igrave;nh luận. Một số cổ động vi&ecirc;n Th&aacute;i Lan đ&atilde; gửi lời xin lỗi đến đội tuyển&nbsp;<a href=\"https://tuoitre.vn/do-mau-vi-au-da-cau-thu-u22-indonesia-phai-bang-moi-len-nhan-hcv-20230517002318927.htm\" title=\"U22 Indonesia\">U22 Indonesia</a>&nbsp;v&agrave; cho biết rất xấu hổ khi chứng kiến h&agrave;nh động của đội nh&agrave;.</p>\n\n<p>CĐV Th&aacute;i Lan c&oacute; t&agrave;i khoản Chatchawan Panchobsingh viết: &quot;L&agrave; một người Th&aacute;i Lan, t&ocirc;i cảm thấy xấu hổ. Xấu hổ trước&nbsp;<a href=\"https://tuoitre.vn/hon-chien-o-chung-ket-sea-games-32-voi-thai-lan-u22-indonesia-gianh-huy-chuong-vang-20230516215059775.htm\" title=\"hành động của đội U22 Thái Lan\">h&agrave;nh động của đội U22 Th&aacute;i Lan</a>&nbsp;hơn thất bại. Phi thể thao kh&ocirc;ng phải l&agrave; điều Th&aacute;i Lan hướng tới. Kh&ocirc;ng thể chấp nhận được.&nbsp;</p>\n\n<p>Ch&uacute;ng t&ocirc;i xin lỗi đội tuyển b&oacute;ng đ&aacute; U22 Indonesia. Xin ch&uacute;c mừng chiến thắng của Indonesia. C&aacute;c bạn xứng đ&aacute;ng với chiến thắng n&agrave;y&quot;.</p>\n\n<p>Dưới b&igrave;nh luận của Panchobsingh, nhiều CĐV&nbsp;Th&aacute;i Lan&nbsp;b&agrave;y tỏ sự đồng t&igrave;nh v&agrave; cũng gửi lời xin lỗi đến U22 Indonesia. Đ&aacute;p lại, c&aacute;c CĐV Indonesia gửi lời cảm ơn đến Panchobsingh v&agrave; khẳng định &quot;Indonesia v&agrave; Th&aacute;i Lan vẫn l&agrave; những người bạn th&acirc;n thiết&quot;.&nbsp;</p>\n', 1, '2023-05-17 09:32:30', '2023-09-16 16:37:26', 'admin', 'quangvk');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `modifiedby` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `user_id`, `thumbnail`, `content`, `createddate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(13, 17, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', '', '2023-05-21 11:35:37', '2023-05-21 11:35:37', 'cathong', 'cathong'),
(16, 4, NULL, '123', '2023-05-21 19:21:56', '2023-05-21 19:21:56', 'admin', 'admin'),
(18, 4, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'This is gorgeous though :>>', '2023-05-21 19:33:44', '2023-05-21 19:33:44', 'admin', 'admin'),
(19, 4, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'Hope u guys feeling good today', '2023-05-21 19:34:10', '2023-05-21 19:34:10', 'admin', 'admin'),
(22, 4, NULL, 'đăng ảnh mới nè :>>>', '2023-05-23 20:14:43', '2023-05-23 20:14:43', 'admin', 'admin'),
(23, 4, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'đăng ảnh mới thứ 2', '2023-05-23 20:15:09', '2023-05-23 20:15:09', 'admin', 'admin'),
(24, 17, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'bài viết mới ', '2023-05-23 20:15:57', '2023-05-23 20:15:57', 'cathong', 'cathong'),
(25, 4, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'ảnh mới nha', '2023-05-23 20:20:13', '2023-05-23 20:20:13', 'admin', 'admin'),
(30, 125, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', '', '2023-05-25 09:34:41', '2023-05-25 09:34:41', 'truongtunglam', 'truongtunglam'),
(32, 135, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'Đăng bài viết đầu tiên nè :>>>>', '2023-05-25 09:49:38', '2023-05-25 09:49:38', 'hoang', 'hoang'),
(33, 135, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'Đăng bài viết thứ 2 nè', '2023-05-25 09:50:09', '2023-05-25 09:50:09', 'hoang', 'hoang'),
(34, 136, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', '', '2023-05-26 20:08:27', '2023-05-26 20:08:27', 'thanhbinh', 'thanhbinh'),
(35, 137, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', '', '2023-05-26 20:09:37', '2023-05-26 20:09:37', 'thienphu', 'thienphu'),
(36, 137, NULL, 'hellpo mng ', '2023-05-27 09:51:06', '2023-05-27 09:51:06', 'thienphu', 'thienphu'),
(42, 4, NULL, 'aloha\r\n', '2023-05-31 23:43:39', '2023-05-31 23:43:39', 'admin', 'admin'),
(43, 4, NULL, 'alalalala', '2023-06-01 09:45:24', '2023-06-01 09:45:24', 'admin', 'admin'),
(44, 143, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'lalalal', '2023-06-01 09:53:32', '2023-06-01 09:53:32', 'ngoquocan', 'ngoquocan'),
(45, 144, NULL, 'alohaassdasd', '2023-06-02 11:20:45', '2023-06-02 11:20:45', 'tu', 'tu'),
(46, 4, NULL, '123', '2023-06-21 22:28:59', '2023-06-21 22:28:59', 'admin', 'admin'),
(47, 146, 'https://res.cloudinary.com/dxctlgwec/image/upload/cld-sample', 'đăng bài 1', '2023-07-24 21:20:38', '2023-07-24 21:20:38', 'ailoyu1111', 'ailoyu1111'),
(48, 4, NULL, '123123', '2023-07-24 21:21:37', '2023-07-24 21:21:37', 'admin', 'admin'),
(49, 7, 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694859713/w9oibxovwbfrtmghuyy6.jpg', 'hehe', '2023-09-16 17:21:54', '2023-09-16 17:21:54', 'quangvk', 'quangvk'),
(50, 4, 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694860391/zapw4nhttojnknckoa61.jpg', '55456', '2023-09-16 17:33:12', '2023-09-16 17:33:12', 'admin', 'admin'),
(51, 7, NULL, 'hola', '2023-09-16 17:47:33', '2023-09-16 17:47:33', 'quangvk', 'quangvk'),
(52, 7, 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694861268/z6wueir6y4j1t9pd9idd.jpg', 'asd', '2023-09-16 17:47:49', '2023-09-16 17:47:49', 'quangvk', 'quangvk');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `code`, `name`) VALUES
(1, NULL, NULL, NULL, NULL, 'ADMIN', 'Quản trị'),
(2, NULL, NULL, NULL, NULL, 'USER', 'Người dùng');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `avatar` text DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `valid_time` datetime DEFAULT NULL,
  `token` varchar(10) DEFAULT NULL,
  `emailReceived` bit(1) DEFAULT NULL,
  `change_password_status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `createdby`, `username`, `avatar`, `fullname`, `status`, `createddate`, `modifiedby`, `modifieddate`, `password`, `email`, `valid_time`, `token`, `emailReceived`, `change_password_status`) VALUES
(4, 'anonymousUser', 'admin', 'https://res.cloudinary.com/dxctlgwec/image/upload/bw63k0t9lbb4ooet6tfv', 'Twinkle', 1, '2023-04-26 17:04:20', 'admin', '2023-09-16 16:40:03', '$2a$10$5vWIAOGjq8NcYs9HUIxS4OTiIAFTM7rTp1SvyHKyj1M9HOc6gSayq', 'quangtrinhhuynh02@gmail.com', '2023-05-14 20:19:46', NULL, b'1', b'0'),
(7, 'anonymousUser', 'quangvk', 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694858145/gycjuhgjpys2utch4jew.jpg', 'quangvk', 1, '2023-04-26 17:21:16', 'quangvk', '2023-09-16 16:55:45', '$2a$10$gxaPCt0v0KftpWn5sL4sz.iL.3L3yPjuwGqN/.89Ow0wUipMHwLSS', 'quangtrinhhuynh02@gmail.com', '2023-05-05 20:22:32', '722323', b'1', b'1'),
(8, 'anonymousUser', 'nguyenvana', 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694858192/uit5rmd75rwapf20qopt.jpg', 'Hồ Ngọc Hà', 1, '2023-04-26 17:30:39', 'nguyenvana', '2023-09-16 16:56:33', '$2a$10$Pj6aK5mY27aRJFZT0aw9tuwKOvl.peCxD3pLoFgyLTv0f3IRaKUOq', 'quangtrinhhuynh02@gmail.com', '2023-05-02 09:39:30', '996494', b'0', b'1'),
(12, 'anonymousUser', 'nguyenvanc', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Quang Đẹp Trai', 1, '2023-04-26 17:37:29', 'anonymousUser', '2023-05-05 21:01:21', '$2a$10$pAQwbE2Ew5yCYjz.PEs.Yu5K6ck81xZ1KBv8btndT83vAOEaFv8su', 'quangtrinhhuynh02@gmail.com', '2023-05-05 21:01:26', NULL, b'1', b'1'),
(17, 'anonymousUser', 'cathong', 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694858219/zypj0v8ppvgixjp8oon3.jpg', 'Huỳnh Thị Thu Hồng', 1, '2023-04-26 20:22:13', 'cathong', '2023-09-16 16:57:00', '$2a$10$PVmw4hYeOeAKra/KZlesFuFoHi8QfRvjbtXOFNmxnELEItjm6C/de', 'quangtrinhhuynh02@gmail.com', '2023-05-16 19:42:35', NULL, b'1', b'0'),
(125, 'anonymousUser', 'truongtunglam', 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694858248/v5whrvwn2ouxyb76er1w.jpg', 'Trương Tùng Lâm', 1, '2023-05-15 22:29:32', 'truongtunglam', '2023-09-16 16:57:28', '$2a$10$gvwO4Ry.Kke3lHb2J2xZIehpoXt8JoV8st7HYs2/32i/t3ATGgoim', 'quangtrinhhuynh02@gmail.com', '2023-05-16 19:39:16', '074565', b'1', b'1'),
(126, 'anonymousUser', 'ailoyu', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Trịnh Huỳnh Chấn Quang', 1, '2023-05-15 23:35:27', 'anonymousUser', '2023-05-15 23:35:45', '$2a$10$Uad5O4ZnqqqWLBXKpbhvGOPWwiTx3t/R1U6gjONh5ToHgAde/GVCy', 'quangtrinhhuynh02@gmail.com', '2023-05-15 23:37:27', '927691', b'1', NULL),
(127, 'anonymousUser', 'damvinhhung', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Đàm Vĩnh Hưng', 1, '2023-05-15 23:36:37', 'anonymousUser', '2023-05-15 23:36:54', '$2a$10$/yqp8yJalf8mQvMFZHFEOOVfwDag1Xl2jUP.ZXyS0Tn1doSzWwYli', 'quangtrinhhuynh02@gmail.com', '2023-05-15 23:38:37', '322046', b'1', NULL),
(128, 'anonymousUser', 'toan', 'https://res.cloudinary.com/dxctlgwec/image/upload/v1694858276/j3enzbw8wnhvywetdlov.jpg', 'Phạm Đức Toàn', 1, '2023-05-15 23:39:29', 'toan', '2023-09-16 16:57:56', '$2a$10$.ifncn4xBOKYjlRRKHEGXu.sQIc34fv0EvKPF2pbQ6EkKbbHCTKLy', 'quangtrinhhuynh02@gmail.com', '2023-05-15 23:41:29', '083711', b'1', NULL),
(129, 'anonymousUser', 'hieuou123', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Lê Ngọc Hiếu', 1, '2023-05-15 23:40:04', 'anonymousUser', '2023-05-15 23:40:19', '$2a$10$S.dBym5kqjCsls/Ip4KHsu7lX46869Nt9da2HYAdiG0EB9pq65ami', 'quangtrinhhuynh02@gmail.com', '2023-05-15 23:42:04', '695554', b'1', NULL),
(130, 'anonymousUser', 'phong123', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Phong', 1, '2023-05-15 23:41:00', 'anonymousUser', '2023-05-15 23:41:24', '$2a$10$1AkSLUtiPtMrqvZBJWOg1u3H9CLTjbKg1.GdSELiRsM8pGFSEFaoe', 'quangtrinhhuynh02@gmail.com', '2023-05-15 23:43:00', '815851', b'1', NULL),
(131, 'anonymousUser', 'hoangnon', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Trần Minh Hoàng', 1, '2023-05-16 19:03:27', 'hoangnon', '2023-05-16 19:06:23', '$2a$10$4aIsCr5aTEHE8X5/xN8/r.21FM4S5xhojyy9iSkKI.LA71rflPCsG', 'quangtrinhhuynh02@gmail.com', '2023-05-16 19:05:26', '616423', b'1', b'0'),
(132, 'anonymousUser', 'tientran9702', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Tran Nguyen Tien', 1, '2023-05-17 09:38:14', 'anonymousUser', '2023-05-17 09:38:57', '$2a$10$.4QJ714.xx.JpjDuxXfZeuQgbq8wBph3i8lODeXAeXhNiMh4Obh.O', 'ccqt9720@gmail.com', '2023-05-17 09:40:14', '652396', b'1', NULL),
(133, 'anonymousUser', 'kiembeo', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Nguyễn Trang Chí Kiêm', 1, '2023-05-17 10:22:08', 'kiembeo', '2023-05-17 10:23:49', '$2a$10$rM7NlpBvEANBgfsFY1IMDOUfgqNYu.PbYRTOtbBSjvGHTfHC.BEvK', 'quangtrinhhuynh02@gmail.com', '2023-05-17 10:24:08', '828104', b'1', NULL),
(135, 'anonymousUser', 'hoang', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Trần Minh Hoàng', 1, '2023-05-25 09:48:19', 'hoang', '2023-05-25 09:49:17', '$2a$10$XI4nNAIyCIbyxPYtupHBg.Muq/GKtEv4/DB8e7rd0bJL8JgdNhzRq', 'quangtrinhhuynh02@gmail.com', '2023-05-25 09:50:19', '042823', b'1', NULL),
(136, 'anonymousUser', 'thanhbinh', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Bùi Thanh Bình', 1, '2023-05-26 20:07:06', 'anonymousUser', '2023-05-26 20:07:06', '$2a$10$VnP/LPvzNKROhpGl/g5QwOSXh/UOKXkPbxYwmAFrODF1sno4838q2', 'quangtrinhhuynh02@gmail.com', '2023-05-26 20:09:06', '916743', b'1', NULL),
(137, 'anonymousUser', 'thienphu', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Nguyễn Hoàng Thiên Phú', 1, '2023-05-26 20:09:06', 'thienphu', '2023-05-27 09:50:47', '$2a$10$skb1bqEG.ROPMddzXPgmuuzROpZ76rRM4FesZ7BwxtSGKnLXdE9/q', 'quangtrinhhuynh02@gmail.com', '2023-05-26 20:11:06', '157186', b'1', NULL),
(138, 'anonymousUser', 'phu', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Nguyễn Hoàng Thiên Phú', 1, '2023-05-27 09:44:43', 'anonymousUser', '2023-05-27 09:45:11', '$2a$10$JjBa7I/XYpJJq13tghJkl.ILfdAWhiCg5vwr.P4LVpdelzVAz0Qt.', 'thienphubinhduong0410@gmail.com', '2023-05-27 09:46:43', '371547', b'1', NULL),
(142, 'anonymousUser', 'quocan', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Ngô Quốc Ân', 0, '2023-06-01 09:50:01', 'anonymousUser', '2023-06-01 09:50:01', '$2a$10$nfVKcEwIIZWBcFZaHK.uMuO.eQqXcdUiKW6HBoQ5cXGmGSreC03Ju', 'quangtrinhhuynh02@gmail.com', '2023-06-01 09:52:01', '451276', b'1', NULL),
(143, 'anonymousUser', 'ngoquocan', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Ngô Quốc Ân', 1, '2023-06-01 09:51:04', 'ngoquocan', '2023-06-01 09:53:14', '$2a$10$u7UgZ17Z.O9LTvnO21vYw.EqIFw4grcH5vWWzu1nHANJg526a7ThG', 'ngoquocan04112002@gmail.com', '2023-06-01 09:53:03', '683123', b'1', NULL),
(144, 'anonymousUser', 'tu', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Nguyễn Thanh Tú', 1, '2023-06-02 11:15:53', 'tu', '2023-06-02 11:17:07', '$2a$10$hMY9Z7UgaLYHdj3g.hh7suGBy3gFvXCf.ECPXqy00kvJvj9ZEejne', 'nguyentu.tn.2002@gmail.com', '2023-06-02 11:17:53', '106233', b'1', NULL),
(146, 'anonymousUser', 'ailoyu1111', 'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg', 'Huỳnh Tuấn Kiệt', 1, '2023-07-24 21:16:57', 'anonymousUser', '2023-07-24 21:18:07', '$2a$10$OKM3FgXUzoteEqo..xMA0.UZLbXSokg83rVRB/S.0gtEHxKgBqBd6', 'ab.8937100@gmail.com', '2023-07-24 21:18:57', '123729', b'1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`userid`, `roleid`) VALUES
(4, 1),
(7, 1),
(8, 2),
(12, 2),
(17, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 1),
(133, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 2),
(142, 2),
(143, 2),
(144, 2),
(146, 2);

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `new_id` bigint(20) DEFAULT NULL,
  `view_count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `user_id`, `new_id`, `view_count`) VALUES
(99, 125, 17, 1),
(100, 17, 17, 4),
(101, 4, 17, 37),
(102, 128, 17, 1),
(103, 128, 17, 1),
(104, 7, 40, 2),
(105, 7, 60, 2),
(106, 7, 59, 2),
(107, 7, 36, 1),
(108, 7, 63, 3),
(109, 4, 60, 7),
(110, 128, 17, 1),
(111, 128, 17, 1),
(113, 4, 66, 4),
(114, 132, 17, 1),
(115, 132, 17, 1),
(119, 4, 21, 2),
(120, 4, 31, 13),
(121, 4, 20, 3),
(122, 4, 63, 2),
(123, 4, 19, 4),
(124, 137, 17, 1),
(125, 144, 17, 1),
(126, 144, 17, 1),
(127, 7, 17, 2),
(129, 7, 22, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_comment_user` (`user_id`) USING BTREE,
  ADD KEY `fk_comment_news` (`new_id`) USING BTREE;

--
-- Indexes for table `comment_post`
--
ALTER TABLE `comment_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comment_post_user` (`user_id`),
  ADD KEY `FK_comment_post_post` (`post_id`);

--
-- Indexes for table `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__user` (`requester_id`) USING BTREE,
  ADD KEY `FK__user_2` (`addressee_id`) USING BTREE;

--
-- Indexes for table `like_post`
--
ALTER TABLE `like_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_like_post_user` (`user_id`),
  ADD KEY `FK_like_post_post` (`post_id`);

--
-- Indexes for table `new`
--
ALTER TABLE `new`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_n64e68925ltftar1nwdaqhaa` (`category_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_post_user` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FK_jpkvqqgndeonhr2alguthv64e` (`roleid`),
  ADD KEY `FK_jwv62hhuqojjk7pot7kaex3e1` (`userid`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_view_count_user` (`user_id`),
  ADD KEY `FK_view_count_new` (`new_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `comment_post`
--
ALTER TABLE `comment_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `friendship`
--
ALTER TABLE `friendship`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `like_post`
--
ALTER TABLE `like_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `new`
--
ALTER TABLE `new`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_news` FOREIGN KEY (`new_id`) REFERENCES `new` (`id`),
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `comment_post`
--
ALTER TABLE `comment_post`
  ADD CONSTRAINT `FK_comment_post_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_comment_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `friendship`
--
ALTER TABLE `friendship`
  ADD CONSTRAINT `FK__user` FOREIGN KEY (`requester_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__user_2` FOREIGN KEY (`addressee_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `like_post`
--
ALTER TABLE `like_post`
  ADD CONSTRAINT `FK_like_post_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_like_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `new`
--
ALTER TABLE `new`
  ADD CONSTRAINT `FK_n64e68925ltftar1nwdaqhaa` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK_jpkvqqgndeonhr2alguthv64e` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FK_jwv62hhuqojjk7pot7kaex3e1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `FK_view_count_new` FOREIGN KEY (`new_id`) REFERENCES `new` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_view_count_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
