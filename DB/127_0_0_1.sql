-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2015 at 08:37 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(2209453, 'N/A', 'N/A', 'YES', 'YES', ''),
(2218565, 'N/A', 'YES', 'YES', 'YES', ''),
(2226914, 'N/A', 'YES', 'YES', 'YES', ''),
(2246227, 'N/A', 'YES', 'YES', 'YES', ''),
(2249565, 'N/A', 'N/A', 'YES', 'N/A', ''),
(2249748, 'N/A', 'REOPENED', 'REOPENED', 'REOPENED', ''),
(2254103, 'N/A', 'N/A', 'YES', 'YES', ''),
(2259093, 'N/A', 'YES', 'N/A', 'N/A', ''),
(2259882, 'N/A', 'N/A', 'YES', 'YES', ''),
(2863663, 'N/A', 'N/A', 'YES', 'NO', ''),
(4411687, 'N/A', 'N/A', 'YES', 'YES', ''),
(4411738, 'N/A', 'N/A', 'YES', 'YES', ''),
(4414552, 'N/A', 'YES', 'YES', 'YES', ''),
(4456470, 'N/A', 'N/A', 'YES', 'YES', '');

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
(1192881, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2015, 'P20', '', '2015-01-12'),
(1205553, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', 'Fix the reg failure. Doing regression test. Will submit on P10-33.', 2015, 'P10', '', '2015-03-02'),
(1258347, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'NOT AN ISSUE', 'mfg_bas_tool_attach_vericut_l01 - OOS', 2015, 'P30', '', '2015-07-01'),
(1262990, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2015, 'P20', '', '2015-07-02'),
(1262996, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2015, 'P20', '', '2015-06-23'),
(1263033, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2015, 'P20', '', '2015-07-13'),
(1263060, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2015, 'P20', '', '2015-07-13'),
(1263077, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2015, 'P20', '', '2015-06-25'),
(1984908, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,L03', '', '2010-06-09'),
(2101422, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', '', '2011-11-21'),
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
(2249748, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', 'Move commit build from P-10-34 to P-10-XX', 2015, 'P10,P20,P30', 'P-10-XX', '2015-01-16'),
(2250972, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', 'Move commit build from P-10-34 to P-10-XX', 2015, 'P10,P20,P30', 'P-10-XX', '2015-01-05'),
(2251260, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', '', '2015-01-07'),
(2252032, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', '', '2015-01-26'),
(2253386, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'INVESTIGATING', 'Move commit build from P-10-34 to P-10-35', 2015, 'P10,P20,P30', 'P-10-35', '2015-02-02'),
(2254103, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-66', '2015-02-09'),
(2254166, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'ON HOLD', '', 2015, 'P20,P30', '', '2015-03-15'),
(2256263, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NOT AN ISSUE', '', 2015, 'P10,P20,P30', '', '2015-03-05'),
(2257897, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', 'P-10-35', '2015-04-01'),
(2259093, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', 'P-10-33', '2015-04-06'),
(2259882, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-67', '2015-04-28'),
(2863663, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-66', '2015-03-05'),
(4411687, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2015, 'P20,P30', '', '2015-06-04'),
(4411738, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', 'Pass to reproter(Paulo) as need info. What is the problem is exactly? Does he talking about model flipping for 2nd operstion?', 2015, 'P20,P30', 'P-20-67', '2015-06-07'),
(4414552, 'rF2DBIUAwwuxssPP+F3jxSkJAbXsoFRIZOMUeGQHo9A=', 'INTEGRITY SPR', 'SUBMITTED', 'how to output info of the Minimal acceptable tool length in Creo Parametric.', 2015, 'P10,P20,P30', '', '2015-06-08'),
(4456470, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-67', '2015-06-21'),
(4492258, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', 'Hi Seshu,I have analysed the SPR  4492258 (Unable to create a solid tool using ProToolFileRead() in Creo Parametric 2.0).During my analysis I found following points:-ÃƒÂ¢Ã‚Â€Ã‚Â˜ProToolFileRead()ÃƒÂ¢Ã‚Â€Ã‚Â™ working correctly. This function Creates a new tool or redefines an existing tool from XML file.-ÃƒÂ¢Ã‚Â€Ã‚Â˜ProToolFileRead()ÃƒÂ¢Ã‚Â€Ã‚Â™ function support create/redefine tools using XML file.-This function create/redefine tool to tool array of the mfg assembly (current model).-This function doesnÃƒÂ¢Ã‚Â€Ã‚Â™t add/redefine tool in tool setup table of the corresponding work cell. And itÃƒÂ¢Ã‚Â€Ã‚Â™s an intended behaviour.-So, you have to update tool setup table explicitly using other functionality.-Here is the step to update tool in Tool setup table.oCreate tool by reading XML file using ÃƒÂ¢Ã‚Â€Ã‚Â˜ProToolFileRead()ÃƒÂ¢Ã‚Â€Ã‚Â™.oGet corresponding WorkCell handler from current mfg model.oAdd newly created tool to tool setup table of the WorkCell. -Every time you add/redefine a tool, you have to update tool setup table of the corresponding WorkCell to see the impact of your changes.Please have a look on ÃƒÂ¢Ã‚Â€Ã‚Â˜Manual ReferencesÃƒÂ¢Ã‚Â€Ã‚Â™ of ÃƒÂ¢Ã‚Â€Ã‚Â˜ProToolFileReadÃƒÂ¢Ã‚Â€Ã‚Â™ for update tool setup table of a WorkCell. Please go through ÃƒÂ¢Ã‚Â€Ã‚Â˜UgMfgMillSeqCreate.cÃƒÂ¢Ã‚Â€Ã‚Â™, ÃƒÂ¢Ã‚Â€Ã‚Â˜UgMfgWcellCreate.cÃƒÂ¢Ã‚Â€Ã‚Â™ files.Please inform me in any help is needed.IÃƒÂ¢Ã‚Â€Ã‚Â™m resolving this SPR as ÃƒÂ¢Ã‚Â€Ã‚Â˜Customer Data FixedÃƒÂ¢Ã‚Â€Ã‚Â™.Thanks and best', 2015, 'P10,P20,p30', '', '2015-07-02'),
(12593987, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'OTHERS', 'NOT AN ISSUE', 'Its a customer case. problem causing as user attached model  as Assembly not as reference model. So,its become ''fixture'' type of component not as ''design'' model.', 2015, 'P10', '', '2015-07-02');

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
('rF2DBIUAwwuxssPP+F3jxSkJAbXsoFRIZOMUeGQHo9A=', 'VKa4qqgt8Hamyy9OeS6oTqRTqEzbovSvNkONwCF2iSc=', 'o1a46ZdcBKb9FyFfAp6LtA9sIIkc6nM/rQM9/VpogI4=', 'naAjpwCvTQKqg+VJXU8U6Aq1BkuXFIx6MGMTA46YWIc=', 'Male', 'vGBP1IaWuSSR1+GIJn7JwJkjuXbKZgXIdT3Z2kTunkk=', 'hDJbEDyRcywkMYy6up4Cvv2m/zS7m9008XxCV1kuKww=', 'zgq6K+mxRdcCiI6AE9DFULZz6bUVVD3mwrc0vuBlYFg=', 'eIiJ8C5EU/V8n8jSJ3WDwWqUNuCj2GtVtj6FMrol+ag=', 'Jqi+Elq9XHX7rAjE5Fl7H1fcqrNjFPn4eNYWmC0sQsc='),
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
  `comment` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

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
(43, '2015-03-11', 'LldHA02JFEoxUd/f59Eouz+DLIhj9zP1vd3YqheWc50=', 'uuuu', 'OTHERS', 5, 'uiijokjjoi\n'),
(45, '2015-07-09', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Vericut new version', 'SPR', 2, 'Analyse and sent mail to CGTech about the problem of new version.'),
(46, '2015-07-09', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Enhancement : Local milling', 'PROJECT', 4, '1. Understand what is Local milling.2. study the flow of classical menu ui for Local milling. try to understand overall (menu ui) mechanism.'),
(47, '2015-07-13', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Enhancement : Local milling', 'PROJECT', 3, '-''setup_vol_mill()'' function is being called by both type of seq. procedure (classic & dashboard) to do their final setting. When this function is called from classical seq. step, it passes ''cut_motion'' for further process. And in case of dashboard seq., it passes ''tool_motion''.\n-''gen_vol_mill ()'' function called after then to generate volume milling seq. according to ''cut_motion''/''tool_motion'' passed by corresponding seq.\n-Calling of those function for both the seq. type is totally different.'),
(48, '2015-07-13', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '1263033, 1263060', 'REGRESSION TEST', 1, ''),
(49, '2015-07-13', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Self Study', 'MISC', 0.5, 'watch tutorial on khanacademy.org. Related to series.\n'),
(50, '2015-07-14', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Enhancement : Local milling', 'PROJECT', 6, 'Start coding. Lots of change needed. Feat_ptr structures are different for both the type (classic/dashboard). So, need to update Feat_ptr with proper info.'),
(52, '2015-07-15', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '2257889', 'SPR', 1.5, 'Porting to P30. Build the project and doing manual testing.'),
(53, '2015-07-15', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Enhancement : Local milling', 'PROJECT', 3.5, 'More analysis.'),
(54, '2015-07-15', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '1263060', 'REG FIX', 1, 'Test and submit the reg failures.'),
(55, '0000-00-00', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'git knowledge', 'OTHERS', 2, 'Knoledge about git (source controler).'),
(56, '2015-07-16', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'git knowlledge', 'OTHERS', 2, 'knowledge about git (source controler)'),
(57, '2015-07-16', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Enhancement : Local milling', 'PROJECT', 4, 'more debugging. know how to collect cl data for display for classic seq.');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
