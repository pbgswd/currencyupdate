-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 31, 2012 at 12:24 AM
-- Server version: 5.0.95
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `your-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `currencies_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) NOT NULL default '',
  `code` char(3) NOT NULL default '',
  `symbol_left` varchar(12) default NULL,
  `symbol_right` varchar(12) default NULL,
  `decimal_point` char(1) default NULL,
  `thousands_point` char(1) default NULL,
  `decimal_places` char(1) default NULL,
  `value` float(13,8) default NULL,
  `last_updated` datetime default NULL,
  PRIMARY KEY  (`currencies_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'US$ US Dollar', 'USD', 'US$', '', '.', ',', '0', 1.00000000, '2012-05-30 21:01:02'),
(2, '‚Äö?á¬® Euro', 'EUR', '‚Äö?á¬®', '', '.', ',', '0', 0.79839998, '2012-05-30 15:01:03'),
(3, 'C$ CDN Dollar', 'CAD', 'C$', '', '.', ',', '0', 1.02670002, '2012-05-31 00:01:06'),
(4, '¬¨¬£ British Pound', 'GBP', '¬¨¬£', '', '.', '', '0', 0.64200002, '2012-05-31 00:01:07'),
(5, 'SF  Swiss Franc', 'CHF', 'SF', '', '.', ',', '0', 0.95940000, '2012-05-30 12:01:04'),
(6, 'A$  Australian Dollar', 'AUD', 'A$', '', '.', ',', '0', 1.02339995, '2012-05-31 00:01:08'),
(7, '¬¨‚Ä¢ Japanese Yen', 'JPY', '¬¨‚Ä¢', '', '.', ',', '', 79.25650024, '2012-05-30 21:01:05'),
(8, 'MXN$ Mexican Peso', 'MXN', 'MXN$', '', '.', ',', '0', 13.99709988, '2012-05-30 21:01:05');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
