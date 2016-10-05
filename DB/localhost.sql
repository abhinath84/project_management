-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 29, 2015 at 04:29 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `project_management`
--
CREATE DATABASE `project_management` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `project_management`;

-- --------------------------------------------------------

--
-- Table structure for table `backlog`
--

CREATE TABLE IF NOT EXISTS `backlog` (
  `name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `sprint_name` varchar(50) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `priority` int(10) DEFAULT NULL,
  `comment` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`name`,`sprint_name`),
  KEY `user_name` (`user_name`),
  KEY `sprint_name` (`sprint_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scrum`
--

CREATE TABLE IF NOT EXISTS `scrum` (
  `name` varchar(50) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scrum_member`
--

CREATE TABLE IF NOT EXISTS `scrum_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `scrum_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  KEY `scrum_name` (`scrum_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spr_submission`
--

CREATE TABLE IF NOT EXISTS `spr_submission` (
  `spr_no` int(10) NOT NULL,
  `l03` enum('YES','NO','N/A','IDLING','REOPENED') DEFAULT NULL,
  `p10` enum('YES','NO','N/A','IDLING','REOPENED') DEFAULT NULL,
  `p20` enum('YES','NO','N/A','IDLING','REOPENED') DEFAULT NULL,
  `P30` enum('YES','NO','N/A','IDLING','REOPENED') DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`spr_no`),
  KEY `spr_no` (`spr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spr_submission`
--

INSERT INTO `spr_submission` (`spr_no`, `l03`, `p10`, `p20`, `P30`, `comment`) VALUES
(1192881, 'N/A', 'N/A', 'YES', 'N/A', 'Reg failure.'),
(1205553, 'N/A', 'YES', 'N/A', 'N/A', ''),
(2209453, 'N/A', 'N/A', 'YES', 'YES', ''),
(2218565, 'N/A', 'YES', 'YES', 'YES', ''),
(2226914, 'N/A', 'YES', 'YES', 'YES', ''),
(2246227, 'N/A', 'YES', 'YES', 'YES', ''),
(2249565, 'N/A', 'N/A', 'YES', 'N/A', ''),
(2249748, 'N/A', 'YES', 'YES', 'YES', ''),
(2259093, 'N/A', 'YES', 'N/A', 'N/A', ''),
(2259882, 'N/A', 'N/A', 'YES', 'YES', ''),
(4411687, 'N/A', 'N/A', 'YES', 'YES', '');

-- --------------------------------------------------------

--
-- Table structure for table `spr_tracking`
--

CREATE TABLE IF NOT EXISTS `spr_tracking` (
  `spr_no` int(10) NOT NULL,
  `user_name` varbinary(100) NOT NULL,
  `type` enum('SPR','INTEGRITY SPR','REGRESSION','OTHERS') NOT NULL,
  `status` enum('NONE','INVESTIGATING','NOT AN ISSUE','SUBMITTED','RESOLVED','PASS FOR TESTING','CLOSED','ON HOLD','TESTING COMPLETE','PASS TO CORRESPONDING GROUP','NEED MORE INFO','OTHERS') DEFAULT NULL,
  `comment` varchar(1500) DEFAULT NULL,
  `session` int(10) DEFAULT NULL,
  `build_version` varchar(25) NOT NULL,
  `commit_build` varchar(25) NOT NULL,
  `respond_by_date` date DEFAULT NULL,
  PRIMARY KEY (`spr_no`,`user_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spr_tracking`
--

INSERT INTO `spr_tracking` (`spr_no`, `user_name`, `type`, `status`, `comment`, `session`, `build_version`, `commit_build`, `respond_by_date`) VALUES
(111111, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NONE', '', 2015, 'P20', '', '2015-06-03'),
(222222, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NONE', '', 2015, 'P20', '', '2015-06-22'),
(1192881, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2015, 'P20', '', '2015-01-12'),
(1205553, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', 'Fix the reg failure. Doing regression test. Will submit on P10-33.', 2015, 'P10', '', '2015-03-02'),
(1984908, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,L03', '', '2010-06-09'),
(2101422, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', '', '2011-11-21'),
(2110237, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30,L03', '', '2012-01-12'),
(2129568, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', '', '2014-05-31'),
(2133120, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'L03,P10,P20,P30', '', '2012-06-12'),
(2209453, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', 'P-20-65', '2015-02-26'),
(2218565, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', 'P-10-32', '2014-04-28'),
(2219012, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', '', '2014-05-22'),
(2221013, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', '', '2014-05-31'),
(2226914, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', 'P-10-32', '2014-07-28'),
(2240004, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P20,P30', '', '2014-08-25'),
(2241145, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NOT AN ISSUE', '', 2015, 'P10,P20', ' 	P-10-31', '2014-09-28'),
(2244774, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NOT AN ISSUE', '', 2015, 'P10,P20,P30', 'P-10-33', '2014-11-11'),
(2246120, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NOT AN ISSUE', '', 2015, 'P10,P20,P30', 'P-10-33', '2014-12-15'),
(2246227, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', 'P-10-33', '2014-12-05'),
(2249565, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20', '', '2014-12-23'),
(2249748, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', 'P-10-34', '2015-01-16'),
(2250972, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'INVESTIGATING', '', 2015, 'P10,P20,P30', 'P-10-34', '2015-01-05'),
(2251260, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', '', '2015-01-07'),
(2252032, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', '', '2015-01-26'),
(2253386, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'INVESTIGATING', '', 2015, 'P10,P20,P30', 'P-10-34', '2015-02-02'),
(2254103, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P20,P30', 'P-20-66', '2015-02-09'),
(2254166, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'ON HOLD', '', 2015, 'P20,P30', '', '2015-03-15'),
(2256263, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NOT AN ISSUE', '', 2015, 'P10,P20,P30', '', '2015-03-05'),
(2257897, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', 'P-10-35', '2015-04-01'),
(2259093, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', 'P-10-33', '2015-04-06'),
(2259882, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-67', '2015-04-28'),
(4411687, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2015, 'P20,P30', '', '2015-06-04'),
(4411738, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'INVESTIGATING', 'Pass to reproter(Paulo) as need info. What is the problem is exactly? Does he talking about model flipping for 2nd operstion?', 2015, 'P20,P30', '', '2015-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `sprint`
--

CREATE TABLE IF NOT EXISTS `sprint` (
  `scrum_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `perday` int(10) NOT NULL,
  PRIMARY KEY (`name`,`scrum_name`),
  KEY `scrum_name` (`scrum_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sprint_member`
--

CREATE TABLE IF NOT EXISTS `sprint_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `sprint_name` varchar(50) NOT NULL,
  `working_day` int(10) DEFAULT NULL,
  `buffer_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  KEY `sprint_name` (`sprint_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sprint_name` varchar(50) NOT NULL,
  `estimated_time` int(10) DEFAULT NULL,
  `spent_time` int(10) DEFAULT NULL,
  `status` enum('BLOCK','IN-PROCESS','COMPLETE') DEFAULT NULL,
  `comment` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sprint_name` (`sprint_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_name` varbinary(100) NOT NULL,
  `password` varbinary(100) DEFAULT NULL,
  `first_name` varbinary(100) DEFAULT NULL,
  `last_name` varbinary(100) DEFAULT NULL,
  `gender` enum('Female','Male') DEFAULT NULL,
  `title` varbinary(100) DEFAULT NULL,
  `department` varbinary(100) DEFAULT NULL,
  `email` varbinary(100) DEFAULT NULL,
  `alt_email` varbinary(100) DEFAULT NULL,
  `manager` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_name`, `password`, `first_name`, `last_name`, `gender`, `title`, `department`, `email`, `alt_email`, `manager`) VALUES
('01+O14EZgMXS3toX8BZa7J8XMNOyu4C40/hqxFDYNlc=', 'qeTT+p3nNdnFV3p0mn5oA5nmwdlITU+ZugTwCb4re9U=', '3hQ8CW5f6t59R0+14wvyGkmD05N7V63RBW8EOfDnU7E=', 'KcdInh7PFN8iFSuqwtAV5cBYM8VXgYJvkNd8Jbh9O9Y=', 'Male', 'WTicVckYMOCEULjdMX1q89zNKXQjTR0Ows6uZVTCoEQ=', 'hDJbEDyRcywkMYy6up4Cvv2m/zS7m9008XxCV1kuKww=', 'zxApBNrIloozd6QiLpEbnhN+blGm4rQDYl4fVcGj9wk=', '', 'Jqi+Elq9XHX7rAjE5Fl7H1fcqrNjFPn4eNYWmC0sQsc='),
('Jqi+Elq9XHX7rAjE5Fl7H1fcqrNjFPn4eNYWmC0sQsc=', 'e9+Kfk9zWqxZ6sv5VjiKOvZazFq2KK5o9IKhx0Xc07Q=', 'Ax37GGLPeAFMJsCUlM5+rJXfBv/e8hX5AZq65/NCCuk=', 'Q50e2UJPXsaZ7vwaxSF9GrGfM4/AU3UuSmApe/GPKIQ=', 'Male', 'vGBP1IaWuSSR1+GIJn7JwJkjuXbKZgXIdT3Z2kTunkk=', 'hDJbEDyRcywkMYy6up4Cvv2m/zS7m9008XxCV1kuKww=', '4AR+XDFQuXoRVHjKLUQEMnDAFSETRCGGbSoCoy+QRJc=', '', 'V1s5jRbowk0cxbLZHo9TpM5YCdWL3OVIbZd2oVrUuFI='),
('LldHA02JFEoxUd/f59Eouz+DLIhj9zP1vd3YqheWc50=', 'hbjICZrYSFcdho7w+bjNVBtL448IqXJeRGsgeQjDELs=', 'B2j8on5VkePdG2ZTX18hV8kTOp/1U6tdbirfWzA/k2w=', 'iVXYa3eLeCwDCfPo8btrNGLwIiI6MY/xPrwqwmNThIk=', 'Male', 'UuKJklodv87UEd/WdLZoTeKplq6g9X4dvu+9KVltnFg=', 'hDJbEDyRcywkMYy6up4Cvv2m/zS7m9008XxCV1kuKww=', 'nvdW5ZLmmlvRtoW7ERdB28FoyosXVIm1fbltDG16zNM=', '', 'xo2l4MQcGFY85imc2Y8CCMHoFgYn12KAZuivob6w2KY='),
('xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '13b4Ox7lX/yi5iscn4Di06fAqpGveWmu5/X1O46o4Og=', 'SorAaxQB3SNa6YIWdiddv2wu7Ur9BkaBZwXfl6JvB3I=', 'lRz5tl5vQuqwpl/tlC0sEBvTBIf9HZNsGwQdR+AT9Eo=', 'Male', 'WTicVckYMOCEULjdMX1q89zNKXQjTR0Ows6uZVTCoEQ=', 'hDJbEDyRcywkMYy6up4Cvv2m/zS7m9008XxCV1kuKww=', 'VdBVN0sqW1wKSehBXWuzagTOp4lSQf4BmAeWk3/eyxE=', '', 'Jqi+Elq9XHX7rAjE5Fl7H1fcqrNjFPn4eNYWmC0sQsc=');

-- --------------------------------------------------------

--
-- Table structure for table `work_tracker`
--

CREATE TABLE IF NOT EXISTS `work_tracker` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `user_name` varbinary(100) NOT NULL,
  `task` varchar(50) NOT NULL,
  `category` enum('SPR','REG FIX','REGRESSION TEST','SF','REG CLEAN-UP','CONSULTATION','PROJECT','MISC','OTHERS') DEFAULT NULL,
  `time` double DEFAULT NULL,
  `comment` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `work_tracker`
--

INSERT INTO `work_tracker` (`id`, `day`, `user_name`, `task`, `category`, `time`, `comment`) VALUES
(34, '2015-03-03', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '1205553', 'REGRESSION TEST', 3, 'Fix the reg failure. Doing regression test. Will submit it on P10-33.\n'),
(35, '2015-03-03', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '2244774', 'SPR', 1, 'Write mail to tech support and close the spr as ''work to spec''.'),
(36, '2015-03-03', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Project management', 'OTHERS', 1, 'Add real data and shorted problems and enhancement. Did some code changes.\n'),
(37, '2015-03-03', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '2246227', 'SPR', 1, 'Again debug in same area. Also analize other WEDM related issue.'),
(38, '2015-03-04', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '1205553', 'REGRESSION TEST', 1, 'Prepare submission form and other related work and submit it on P-10-33.'),
(39, '2015-03-04', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Project management', 'OTHERS', 1.5, ''),
(40, '2015-03-04', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '2246227', 'SPR', 2, ''),
(41, '2015-03-04', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '2246120', 'SPR', 1, ''),
(43, '2015-03-11', 'LldHA02JFEoxUd/f59Eouz+DLIhj9zP1vd3YqheWc50=', 'uuuu', 'OTHERS', 5, 'uiijokjjoi\n');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
