-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 16, 2016 at 09:43 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ibc_resource`
--

-- --------------------------------------------------------

--
-- Table structure for table `ck_activity`
--

CREATE TABLE IF NOT EXISTS `ck_activity` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL COMMENT '1:content;2:norma;3:peraturan;4:produk;5:program;6:sig;7:user',
  `activity_value` varchar(50) NOT NULL,
  `n_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ck_activity_log`
--

CREATE TABLE IF NOT EXISTS `ck_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `activity_desc` varchar(250) NOT NULL,
  `source` varchar(20) NOT NULL,
  `datetimes` datetime NOT NULL,
  `n_status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ck_admin_member`
--

CREATE TABLE IF NOT EXISTS `ck_admin_member` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(46) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `menu_akses` varchar(300) DEFAULT NULL,
  `username` varchar(46) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1:admin, 2:verifikator, 3:evaluator, 4: balai',
  `salt` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `n_status` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ck_admin_member`
--

INSERT INTO `ck_admin_member` (`id`, `name`, `nickname`, `email`, `register_date`, `menu_akses`, `username`, `type`, `salt`, `password`, `n_status`) VALUES
(1, 'admin', 'admin', 'admin@example.com', '2014-08-07 15:56:36', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24', 'admin', 1, 'codekir v3.0', 'b2e982d12c95911b6abeacad24e256ff3fa47fdb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ck_menu`
--

CREATE TABLE IF NOT EXISTS `ck_menu` (
  `menuID` int(2) NOT NULL AUTO_INCREMENT,
  `menuDesc` varchar(50) DEFAULT NULL,
  `menuParent` int(2) DEFAULT NULL,
  `menuPath` varchar(100) DEFAULT NULL,
  `menuIcon` varchar(100) DEFAULT NULL,
  `menuStatus` int(11) NOT NULL,
  `menuAksesLogin` int(11) NOT NULL,
  PRIMARY KEY (`menuID`),
  KEY `menuID` (`menuID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ck_menu_parent`
--

CREATE TABLE IF NOT EXISTS `ck_menu_parent` (
  `menuParentID` int(2) NOT NULL AUTO_INCREMENT,
  `menuParentDesc` varchar(20) DEFAULT NULL,
  `menuOrder` int(11) NOT NULL,
  PRIMARY KEY (`menuParentID`),
  KEY `menuParentID` (`menuParentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_file`
--

CREATE TABLE IF NOT EXISTS `hr_file` (
  `idFile` int(11) NOT NULL AUTO_INCREMENT,
  `idProject` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `path` text,
  `n_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idFile`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_project`
--

CREATE TABLE IF NOT EXISTS `hr_project` (
  `idProject` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `description` text,
  `n_status` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`idProject`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hr_project`
--

INSERT INTO `hr_project` (`idProject`, `name`, `client`, `date_start`, `date_end`, `image`, `description`, `n_status`) VALUES
(1, 'Training Simbada', 'LabMa', '2016-01-15 00:00:00', '2016-01-19 00:00:00', 'c9dfea31ff2e990b42f64b61ac24b955.jpg', 'Hey John,\r\n												&amp;lt;br&amp;gt;&amp;lt;br&amp;gt;\r\n												Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&amp;lt;br&amp;gt;&amp;lt;br&amp;gt;\r\n												&amp;lt;blockquote class=&amp;quot;text-muted&amp;quot;&amp;gt;\r\n													Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n												&amp;lt;/blockquote&amp;gt;\r\n												Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\r\n												&amp;lt;br&amp;gt;&amp;lt;br&amp;gt;\r\n												Regards,\r\n												&amp;lt;br&amp;gt;&amp;lt;br&amp;gt;\r\n												&amp;lt;strong&amp;gt;Lisa D. Smith&amp;lt;/strong&amp;gt;&amp;lt;br&amp;gt;\r\n												2834 Street Name&amp;lt;br&amp;gt;\r\n												San Francisco, CA&amp;lt;br&amp;gt;', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_timeline`
--

CREATE TABLE IF NOT EXISTS `hr_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProject` int(11) DEFAULT NULL,
  `desc` text,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_userproject`
--

CREATE TABLE IF NOT EXISTS `hr_userproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProject` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `desc` text,
  `status` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_users`
--

CREATE TABLE IF NOT EXISTS `hr_users` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `nik` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jenis_kelamin` tinyint(1) DEFAULT NULL,
  `tempat_lahir` tinytext,
  `tanggal_lahir` date DEFAULT NULL,
  `pendidikan` varchar(255) DEFAULT NULL,
  `institusi` tinytext,
  `jenis_pekerjaan` varchar(255) DEFAULT NULL,
  `hp` tinytext,
  `alamat` text,
  `other_data` text,
  `type` int(11) DEFAULT NULL COMMENT '1:admin,2:user',
  `salt` varchar(200) DEFAULT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `email_token` varchar(255) DEFAULT NULL,
  `is_online` int(11) NOT NULL DEFAULT '0',
  `n_status` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hr_users`
--

INSERT INTO `hr_users` (`id`, `nik`, `name`, `username`, `email`, `password`, `register_date`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `pendidikan`, `institusi`, `jenis_pekerjaan`, `hp`, `alamat`, `other_data`, `type`, `salt`, `login_count`, `email_token`, `is_online`, `n_status`) VALUES
(1, NULL, 'admin', 'admin', 'admin@example.com', 'b2e982d12c95911b6abeacad24e256ff3fa47fdb', '2016-01-11 14:19:28', 0, 'Jakarta', '1989-08-09', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'codekir v3.0', 0, NULL, 0, 1),
(4, NULL, 'Andreass Bayu', 'andreassbayu', 'andreass.bayu@gmail.com', '8e7ade691e55def6d2984a2272a0fb9e75b8c7bc', '2016-01-15 00:53:26', NULL, NULL, NULL, 'S2', 'Gunadarma', 'Information Management', NULL, NULL, NULL, 3, '1234567890', 0, NULL, 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
