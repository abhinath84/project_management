-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2016 at 03:44 PM
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
(111111, 'N/A', 'YES', 'YES', 'YES', ''),
(2209453, 'N/A', 'N/A', 'YES', 'YES', ''),
(2218565, 'N/A', 'YES', 'YES', 'YES', ''),
(2226914, 'N/A', 'YES', 'YES', 'YES', ''),
(2246227, 'N/A', 'YES', 'YES', 'YES', ''),
(2249565, 'N/A', 'N/A', 'YES', 'N/A', ''),
(2249748, 'N/A', 'REOPENED', 'REOPENED', 'REOPENED', ''),
(2254103, 'N/A', 'N/A', 'YES', 'YES', ''),
(2259093, 'N/A', 'YES', 'N/A', 'N/A', ''),
(2259882, 'N/A', 'N/A', 'YES', 'YES', ''),
(2863663, 'N/A', 'N/A', 'YES', 'YES', ''),
(4411687, 'N/A', 'N/A', 'YES', 'YES', ''),
(4411738, 'N/A', 'N/A', 'YES', 'YES', ''),
(4414552, 'N/A', 'YES', 'YES', 'YES', ''),
(4456470, 'N/A', 'N/A', 'YES', 'YES', ''),
(4773513, 'N/A', 'YES', 'YES', 'YES', ''),
(4779259, 'N/A', 'NO', 'NO', 'NO', ''),
(5009203, 'N/A', 'N/A', 'YES', 'YES', ''),
(5039835, 'N/A', 'N/A', 'YES', 'YES', ''),
(5141221, 'N/A', 'YES', 'YES', 'YES', ''),
(5141233, 'N/A', 'YES', 'YES', 'YES', ''),
(5141476, 'N/A', 'YES', 'YES', 'YES', ''),
(5161466, 'N/A', 'YES', 'YES', 'YES', ''),
(5177818, 'N/A', 'YES', 'YES', 'YES', ''),
(5194772, 'N/A', 'YES', 'YES', 'YES', ''),
(5201098, 'N/A', 'YES', 'YES', 'YES', ''),
(5242493, 'N/A', 'N/A', 'YES', 'YES', ''),
(5259193, 'N/A', 'YES', 'YES', 'YES', ''),
(5267298, 'N/A', 'N/A', 'YES', 'YES', ''),
(5306303, 'N/A', 'YES', 'YES', 'YES', ''),
(5321984, 'N/A', 'YES', 'YES', 'YES', ''),
(5339991, 'N/A', 'N/A', 'YES', 'YES', ''),
(5655615, 'N/A', 'YES', 'YES', 'YES', ''),
(5657601, 'N/A', 'N/A', 'YES', 'YES', ''),
(5697116, 'N/A', 'N/A', 'YES', 'YES', ''),
(5838001, 'N/A', 'N/A', 'YES', 'YES', ''),
(5856608, 'N/A', 'N/A', 'YES', 'YES', '');

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
(1290911, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'NONE', '', 2015, 'P20', '', '2015-08-23'),
(1339862, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2016, 'P10', 'P-10-38', '2016-01-19'),
(1339864, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2016, 'P10', 'P-10-38', '2016-01-25'),
(1345001, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2016, 'P10', 'P-10-38', '2016-02-02'),
(1351294, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2016, 'P20', 'P-20-70', '2015-02-26'),
(1376311, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'PASS TO CORRESPONDING GROUP', '', 2016, 'P30', '', '2016-04-11'),
(1376400, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'SUBMITTED', '', 2016, 'P30', '', '2016-04-11'),
(1379673, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'REGRESSION', 'NOT AN ISSUE', '', 2016, 'P30', '', '2016-04-11'),
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
(2252032, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'RESOLVED', '', 2015, 'P10,P20,P30', '', '2015-01-26'),
(2253386, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'INVESTIGATING', 'Move commit build from P-10-34 to P-10-35', 2015, 'P10,P20,P30', 'P-10-XX', '2015-02-02'),
(2254103, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-66', '2015-02-09'),
(2254166, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P20,P30', '', '2015-03-15'),
(2256263, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NOT AN ISSUE', '', 2015, 'P10,P20,P30', '', '2015-03-05'),
(2257897, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', 'P-10-XX', '2015-04-01'),
(2259093, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P10,P20,P30', 'P-10-33', '2015-04-06'),
(2259882, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-67', '2015-04-28'),
(2261508, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2016, 'P10,P20,P30', '', '2015-10-23'),
(2863663, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-66', '2015-03-05'),
(4411687, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2015, 'P20,P30', '', '2015-06-04'),
(4411738, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', 'Pass to reproter(Paulo) as need info. What is the problem is exactly? Does he talking about model flipping for 2nd operstion?', 2015, 'P20,P30', 'P-20-67', '2015-06-07'),
(4414552, 'rF2DBIUAwwuxssPP+F3jxSkJAbXsoFRIZOMUeGQHo9A=', 'INTEGRITY SPR', 'SUBMITTED', 'how to output info of the Minimal acceptable tool length in Creo Parametric.', 2015, 'P10,P20,P30', '', '2015-06-08'),
(4456470, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2015, 'P20,P30', 'P-20-67', '2015-06-21'),
(4492258, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', 'Hi Seshu,I have analysed the SPR  4492258 (Unable to create a solid tool using ProToolFileRead() in Creo Parametric 2.0).During my analysis I found following points:-ÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â˜ProToolFileRead()ÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â™ working correctly. This function Creates a new tool or redefines an existing tool from XML file.-ÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â˜ProToolFileRead()ÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â™ function support create/redefine tools using XML file.-This function create/redefine tool to tool array of the mfg assembly (current model).-This function doesnÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â™t add/redefine tool in tool setup table of the corresponding work cell. And itÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â™s an intended behaviour.-So, you have to update tool setup table explicitly using other functionality.-Here is the step to update tool in Tool setup table.oCreate tool by reading XML file using ÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â˜ProToolFileRead()ÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â™.oGet corresponding WorkCell handler from current mfg model.oAdd newly created tool to tool setup table of the WorkCell. -Every time you add/redefine a tool, you have to update tool setup table of the corresponding WorkCell to see the impact of your changes.Please have a look on ÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â€ÃƒÂƒÃ‚Â‚ÃƒÂ‚Ã‚Â˜Manual ReferencesÃƒÂƒÃ‚ÂƒÃƒÂ‚Ã‚Â¢ÃƒÂƒÃ‚Â', 2015, 'P10,P20,p30', '', '2015-07-02'),
(4639862, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NONE', '', 2015, 'P20,P30', 'P-20-XX', '2015-08-12'),
(4681479, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'RESOLVED', 'As we are not supporting Vericut, so resolve this SPR as "No Plans To Implements".', 2015, 'P20,P30', 'P-20-71', '2015-08-26'),
(4758401, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', '', 2015, 'P10,P20,P30', '', '2015-09-28'),
(4773513, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2015-11-13'),
(4779259, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-XX', '2015-11-14'),
(4861678, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'PASS TO CORRESPONDING GROUP', 'Hi Pushkaraj,I have analysed the issue and found that the problem causing due to round off of double value up to 2 decimal inside the function â€˜ProElementDoubleAddâ€™.And this function is calling from â€˜ProElemtreeFromXMLCreateâ€™ API.We had discussed about it.As you suggest that the current behaviour of this functionality (ProElementDoubleAdd) is very old and used in many places, so itâ€™s difficult modify.As itâ€™s a very basic functionality, Iâ€™m not modifying this function to solve the SPR issue and passing this issue to you.Please do the needful, whether update the function or anything else.I set the commit build as Creo 3.0 M090.Please inform me if any further help is needed.Thanks and best regardsAbhishek', 2016, 'P20,P30', 'P-20-70', '2015-11-05'),
(4911095, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', '', 2016, 'P20,P30', '', '2015-11-29'),
(4914051, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', '', 2016, 'P20,P30', '', '2015-12-03'),
(4914069, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', '', 2016, 'P20,P30', '', '2015-12-03'),
(4915660, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', '-Hi Ariel,Thanks for the information.I have analysed the issue using that config option and found following points:-According to the documentation of the config â€˜mfg_param_auto_copy_from_toolâ€™,<cuttingâ€”copies all="" the="" cutting="" conditionsâ€”feed,="" speed="" and="" depth.="" nc="" manufacturing="" uses="" roughing="" condition="" for="" roughing,="" re-roughing,="" volume="" milling="" local="" finishing="" conditions="" other="" toolpaths.="">And as we select â€˜allâ€™ option itâ€™s satisfying this condition.-The model given by user, they are using â€˜IT-80-D20-A3-R0_4â€™ ', 2016, 'P20,P30', 'P-20-71', '2015-12-06'),
(4989720, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', '', 2016, 'P10,P20,P30', '', '2015-12-30'),
(5009203, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P20,P30', 'P-20-70', '2016-01-05'),
(5039835, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', 'Solution ready. But have following question:- Does this API support multi  feature id? No.- What will be the error id?PRO_TK_GENERAL_ERROR, As this is the error id if any nc seq fail.- Where to put the code?- Reg test is remain.', 2016, 'P20,P30', 'P-20-71', '2016-01-14'),
(5141221, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2016-02-17'),
(5141233, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2016-02-08'),
(5141476, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10', '', '2016-02-05'),
(5161466, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2016-01-28'),
(5177818, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2016-02-06'),
(5194772, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2016-02-12'),
(5195354, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'OTHERS', 'Enhancement.Sent mail to Michael to know the functionality which get/set unit of a parameter.', 2016, 'P20,P30', 'P-20-XX', '2016-03-02'),
(5201098, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2016-02-16'),
(5224797, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'OTHERS', 'Enhancement.', 2016, 'P20,P30', 'P-20-XX', '2016-03-13'),
(5242493, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P20,P30', 'P-20-70', '2016-02-25'),
(5259193, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2016-03-02'),
(5267298, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P20,P30', 'P-20-72', '2016-03-24'),
(5306303, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-40', '2016-04-07'),
(5321984, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-40', '2016-04-17'),
(5339991, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P20,P30', 'P-20-72', '2016-04-21'),
(5655615, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-41', '2016-05-26'),
(5657601, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P20,P30', 'P-20-72', '2016-05-29'),
(5697116, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P20,P30', 'P-20-72', '2016-06-11'),
(5709237, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'INVESTIGATING', '', 2016, 'P10,P20,P30', 'P-10-41', '2016-06-22'),
(5752653, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NONE', '', 2016, 'P20,P30', 'P-20-73', '2016-07-17'),
(5782926, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NOT AN ISSUE', '', 2016, 'P20,P30', '', '2016-07-31'),
(5838001, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P20,P30', '', '2016-08-18'),
(5856608, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'SUBMITTED', '', 2016, 'P20,P30', '', '2016-08-25'),
(6088656, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'INTEGRITY SPR', 'NONE', '', 2016, 'P20,P30', '', '2016-09-21'),
(12593987, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'OTHERS', 'NOT AN ISSUE', 'Its a customer case. problem causing as user attached model  as Assembly not as reference model. So,its become ''fixture'' type of component not as ''design'' model.', 2015, 'P10', '', '2015-07-02'),
(13033054, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'OTHERS', 'SUBMITTED', '', 2016, 'P20', 'P-20-70', '2016-01-28'),
(13033055, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'OTHERS', 'SUBMITTED', '', 2016, 'P10,P20,P30', 'P-10-38', '2015-10-14');

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
('WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'knuSIZaz5fcTW1khefxlfDePue00/uNJEKaNOzUbbZ4=', '9+1eSgPSqvp17soJWpMjmS5MfBkbgrwyPy79FxblNDg=', 'vJZVYRau/FkkKKOeMtEyM/bsrp7kGZNsMHZ0w6j7t8E=', 'Female', 'USq7XEHqk8y4JCBfJiHDcaN+K+1KXiN2Ql+BeWJGET8=', 'hDJbEDyRcywkMYy6up4Cvv2m/zS7m9008XxCV1kuKww=', 'JlcN+KuWmLWNzLcVOO2l7rkHh27WOorHeXxjVwnqfJU=', 'fXdeBw50RmNAlA4PJ+Wxt1McgtSt12GVV4DLDYtbFrA=', 'Jqi+Elq9XHX7rAjE5Fl7H1fcqrNjFPn4eNYWmC0sQsc='),
('rF2DBIUAwwuxssPP+F3jxSkJAbXsoFRIZOMUeGQHo9A=', 'VKa4qqgt8Hamyy9OeS6oTqRTqEzbovSvNkONwCF2iSc=', 'o1a46ZdcBKb9FyFfAp6LtA9sIIkc6nM/rQM9/VpogI4=', 'naAjpwCvTQKqg+VJXU8U6Aq1BkuXFIx6MGMTA46YWIc=', 'Male', 'vGBP1IaWuSSR1+GIJn7JwJkjuXbKZgXIdT3Z2kTunkk=', 'hDJbEDyRcywkMYy6up4Cvv2m/zS7m9008XxCV1kuKww=', 'zgq6K+mxRdcCiI6AE9DFULZz6bUVVD3mwrc0vuBlYFg=', 'eIiJ8C5EU/V8n8jSJ3WDwWqUNuCj2GtVtj6FMrol+ag=', 'Jqi+Elq9XHX7rAjE5Fl7H1fcqrNjFPn4eNYWmC0sQsc='),
('slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'KI3BV9KhsOCnInFPkxAOjRMmpMlB9gAa4i1S6XueEVY=', 'mwCnzvn5j1UxwkVD1cXsyoKbM0cWruQJJAfpAraMyTU=', 'zSyPvHKkuDsIlDOfa54hhAbuqwPyECs4jJqxgzcB7IU=', 'Male', '1b6IlJ4aKdThBkd9V9l9AP3CVuC5/pXHgj10wutzeVE=', 'hDJbEDyRcywkMYy6up4Cvv2m/zS7m9008XxCV1kuKww=', 'd3elgaKg83/Dub0b+57mHLwxLw8vqnQ0HoYLR30t2ok=', 'tmk3u3OK91VekzmEYRh1uX1ErEewmcSeDJHxEjOdsSE=', 'Jqi+Elq9XHX7rAjE5Fl7H1fcqrNjFPn4eNYWmC0sQsc='),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=161 ;

--
-- Dumping data for table `work_tracker`
--

INSERT INTO `work_tracker` (`id`, `day`, `user_name`, `task`, `category`, `time`, `comment`) VALUES
(34, '2015-03-03', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '1205553', 'REGRESSION TEST', 3, 'Fix the reg failure. Doing regression test. Will submit it on P10-33.'),
(35, '2015-03-03', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '2244774', 'SPR', 1, 'Write mail to tech support and close the spr as ''work to spec''.'),
(36, '2015-03-03', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Project management', 'OTHERS', 1, 'Add real data and shorted problems and enhancement. Did some code changes.'),
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
(57, '2015-07-16', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'Enhancement : Local milling', 'PROJECT', 4, 'more debugging. know how to collect cl data for display for classic seq.'),
(58, '2016-07-05', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'training', 'OTHERS', 3, 'follow the training plan by Kuldeep Singh'),
(59, '2016-07-05', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'installation', 'OTHERS', 2, 'cygwin,intrigrity client'),
(60, '2016-07-05', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Reading', 'OTHERS', 2, 'introduction to manufacturing from ptc university site'),
(61, '2016-07-05', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Training', 'OTHERS', 3, 'Introduction training'),
(62, '2016-07-05', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Installation', 'MISC', 2, 'Intalling cygwin, Itegrity client'),
(63, '2016-07-06', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Installation', 'OTHERS', 1, 'Installed Visual Studio 2012 and installed its update.'),
(64, '2016-07-06', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Installation', 'OTHERS', 1, 'Installed XTendVS and made set up\n'),
(65, '2016-07-06', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Surfing PTC Employee Portal', 'MISC', 1, 'Surfed various sections of PTC Employee Portal'),
(66, '2016-07-07', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Investigating Creo', 'MISC', 1, 'Creating model in Creo.\n'),
(67, '2016-07-07', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'HelpDesk Request', 'OTHERS', 0.5, 'Raised IT Helpdesk request for "Not working password" and "desk phone"'),
(68, '2016-07-07', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Training', 'OTHERS', 1.5, 'Attended training on launcing creo. This training was given by Rishabh'),
(69, '2016-07-08', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Part and Assembly ', 'OTHERS', 0.5, 'Created part and assembly as per example given by Rishabh'),
(70, '2016-07-07', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Installed nodepad++', 'OTHERS', 0.5, 'Installed notepad++\n'),
(71, '2016-07-08', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'FollowUp', 'MISC', 0.5, 'Followd up the it help desk request to get phone and to get password working for webpayroll, olms, it help desk, integrity helpdesk'),
(72, '2016-07-08', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Create IT Helpdesk request ', 'OTHERS', 0.5, 'Created IT helpdesk request for web payroll and olms system'),
(73, '2016-07-11', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Meeting Creation', 'OTHERS', 0.5, 'Created meeting for SPR, Regression test and submission tool, Model from Integrity'),
(74, '2016-07-12', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Training ', 'OTHERS', 1.5, 'Attended training by Arvind on SPR.'),
(75, '2016-07-12', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'training', 'OTHERS', 4, 'follow the trainig plan, training by Arvind Gupta, Sachin Sathe, Rushida Kashalkar'),
(76, '2016-07-06', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'installation', 'OTHERS', 2, 'VS 2012, XtendVS, Notepad++\n'),
(77, '2016-07-06', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Training', 'OTHERS', 2, 'follow the training plan, training by Rishab Tripathi'),
(78, '2016-07-12', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Training', 'OTHERS', 1.5, 'Attended training on Regression Test and submission tool by Sachin'),
(79, '2016-07-13', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Traing', 'OTHERS', 5, 'folllow the trainig plan by Abhishek Nath, Rushida Kashalkar'),
(80, '2016-07-14', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Training', 'OTHERS', 2, 'folllow the trainig plan by Abhishek Nath\n'),
(81, '0000-00-00', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Installation', 'OTHERS', 1, 'Cisco Webex Meeting, snagit, Filezilla , VNC client , Open text Exceed'),
(82, '2016-07-13', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'installation', 'OTHERS', 1, 'Cisco Webex Meeting, snagit, Filezilla, VNC client , Open text Exceed '),
(83, '2016-07-11', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'OTHERS', 1, 'By Arvind gupta\n'),
(84, '2016-07-08', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'OTHERS', 1, 'By Arvind gupta\n'),
(85, '2016-07-07', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Reading', 'OTHERS', 3, 'From PTC University'),
(86, '2016-07-06', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'reading', 'OTHERS', 2, 'From PTC University'),
(87, '2016-07-07', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Watching', 'OTHERS', 3, 'Creo video on youtube\n'),
(88, '2016-07-08', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'reading', 'OTHERS', 2, 'From PTC University'),
(89, '2016-07-08', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'watching', 'OTHERS', 2, 'Creo video on youtube '),
(90, '2016-07-11', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'watching ', 'OTHERS', 2, 'Creo video on youtube '),
(91, '2016-07-11', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'reading', 'OTHERS', 2, 'From PTC University'),
(92, '2016-07-18', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Working on SPR 4860260', 'SPR', 6, 'Analysing the issue'),
(93, '2016-07-19', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Working on SPR 4860260', 'SPR', 0.5, 'Found the issue using Play Path'),
(94, '2016-07-20', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Working on SPR 4860260', 'SPR', 2, 'Got exact location of the problem. '),
(95, '2016-07-20', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Working on SPR 4860260', 'SPR', 2, 'xtop build issue on my machine '),
(96, '2016-07-20', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Working on SPR 4860260', 'SPR', 3, 'Resolved build issue.'),
(97, '2016-07-22', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Working on SPR 4860260', 'SPR', 5, 'Understanding code flow'),
(98, '2016-07-25', 'slDTSs4vlYmHaZ441IFmi8MwUex0y9Q8emsklrtfq3g=', 'Working on SPR 4860260', 'SPR', 3, 'Debugging trajtpath file'),
(99, '2016-08-11', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 4, 'Compare the reg "mfg_goodyear_sprs_j01" in different version.run the same reg in 64 and 32 bit and analyse the differences.'),
(100, '2016-08-10', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 5, 'follow the step of regreesion test by Abhishek .'),
(101, '2016-08-05', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Bug fixing', 'SPR', 5, 'Change in function code as per Surya Sir said. '),
(102, '2016-08-08', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Bug Fixing', 'SPR', 5, 'Again changing code in some other place in same SPR. After that try to build in p2072. But facing same build issues, like :-xtop was not build.'),
(103, '2016-08-09', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Bug fixing', 'SPR', 5, 'Build xtop. Launch Regreesion and Submission of that SPR.'),
(104, '2016-08-04', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Submission', 'OTHERS', 5, 'Doing the assignment of submission test given by Arvind Sir.'),
(105, '2016-08-03', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Submission', 'OTHERS', 5, 'Training on submission by Rishab.'),
(106, '2016-08-12', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 5, 'Compare the reg "mfg_goodyear_sprs_j01" in different version. run the same reg in 64 and 32 bit and analyse the differences.'),
(107, '2016-08-16', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 4, 'Compare the reg "mfg_bas_spr_1738200_l01" in different version. run the same reg in 64 and 32 bit and analyse the differences.'),
(108, '2016-08-16', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'OTHERS', 1, 'Sprint Meeting'),
(110, '2016-08-11', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'OTHERS', 2, 'Retrospective and ASH Meeting'),
(111, '2016-08-17', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 5, 'Compare the reg "mfg_bas_spr_1738200_l01" in different version. run the same reg in 64 and 32 bit and analyse the differences.'),
(112, '2016-08-17', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 1, 'Discuss with Abhishek on regression'),
(113, '2016-08-16', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 1, 'Discuss with Abhishek on regression'),
(114, '2016-08-18', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 4, 'Compare the reg "mfg_bas_spr_1738200_l01" in different version. run the same reg in 64 and 32 bit and analyse the differences. '),
(115, '2016-08-18', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 1, 'Discuss with Abhishek on regression.'),
(116, '2016-08-02', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'SPR Tracking', 'OTHERS', 6, 'Tracking SPR & updating excel sheet. Submit the sheet to Arvind.'),
(117, '2016-08-01', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'SPR Tracking', 'OTHERS', 5, 'Again Correcting the sheet. Tracking SPR '),
(118, '2016-07-29', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'SPR Tracking', 'OTHERS', 5, 'Tracking SPR & updating excel sheet. Correcting the sheet'),
(119, '2016-07-28', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'SPR Tracking', 'OTHERS', 5, 'Tracking SPR & updating excel sheet. Correcting the sheet.'),
(120, '2016-07-27', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'SPR Tracking', 'OTHERS', 5, 'Tracking SPR & updating excel sheet.'),
(121, '2016-08-18', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'OTHERS', 1, 'Family day meeting.'),
(122, '2016-08-19', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Crashing', 'REGRESSION TEST', 4, 'xtop is crash and it takes too much time. Working on "prod_mfg_bas_crash_spr2833208_p10" regression.'),
(123, '2016-08-19', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Change the ownership of directories', 'MISC', 1, 'Change the ownership of the directory as per Rahul instruction.'),
(124, '2016-08-19', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'OTHERS', 1, 'Family day meeting.'),
(125, '2016-08-22', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 3, 'Complete regression "mfg_goodyear_sprs_j01" and  "mfg_bas_spr_1738200_l01".'),
(126, '2016-08-22', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Crashing', 'REGRESSION TEST', 3, 'run this "prod_mfg_bas_crash_spr2833208_p10" regression through uigtm xtop and analyse the differences.'),
(127, '2016-08-23', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Crashing', 'REGRESSION TEST', 3, 'Complete "prod_mfg_bas_crash_spr2833208_p10" regression.'),
(128, '2016-08-23', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', ' 	Crashing', 'REGRESSION TEST', 1, 'Analyse "mfg_bas_drillgrp_cppst_spr2890661_p20" regression but Arvind said don''t work on such reg that is on "sun_solaris_64".'),
(129, '2016-08-23', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Crashing', 'REGRESSION TEST', 2, 'Analyse "mfg_bas_qar_rough_4_p10 " regression.'),
(130, '2016-08-24', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 4, 'Analyse "mold_bas_famtab_shrink_k01 " regression. Talk with Abhishek and Rupesh regarding this regression.'),
(131, '2016-08-24', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'AR/VR', 'OTHERS', 2, 'Learning and watching video.'),
(132, '2016-08-25', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 5, 'Analyse the "mold_bas_famtab_shrink_k01 " regression and talk with QA (Rupesh) . Share my desktop to him.'),
(133, '2016-08-25', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'OTHERS', 1, 'Attend Tech Talk - AR Experience using Vuforia Studio.'),
(134, '2016-08-26', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 4, 'fixing the reg test "mold_bas_famtab_shrink_k01 ".'),
(135, '2016-08-26', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'OTHERS', 1, '" India Council Quarterly Update."'),
(136, '2016-08-26', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 1, 'Analyse "mfg_bas_disp_all_param_l01" regression.'),
(137, '2016-08-29', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 8, 'Submit "mfg_bas_disp_all_param_l01". Analyse and fix "mfg_bas_mancycle_3xtraj_spr2183565_p10" regression.'),
(138, '2016-08-30', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 9, 'Analyse and Fix "mfg_bas_colnt_optns_traj_hm_p20 " and "cast_bas_3d_thickness_check_p20 " regression.'),
(139, '2016-08-31', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 4, 'submit "cast_bas_3d_thickness_check_p20 " regression. Analyse "mfg_bas_rou_fin_traj_followcut_p10 " regresiion. And talk with Rupesh.'),
(140, '2016-09-01', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 6, 'Analyse  "mold_bas_moldblock_k01",  "mold_block_rename", \n"mold_bas_rmbmenu_graphics_3_p20", "mold_ui_ribbon_top_l05 " and "mold_bas_rmbmenu_mdltree_3_p20" regression.'),
(141, '2016-09-02', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REG FIX', 4, 'Analyse "cast_ui_ribbon_2_13022866_l05" and "cast_bas_ribbon_13022866_l05" reegression.'),
(142, '2016-09-02', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', '<input id=', 'REGRESSION TEST', 2, 'Work on another regression, given by Surya Sir.'),
(143, '2016-09-06', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Misc', 'REGRESSION TEST', 3, 'Work on another regression, given by Surya Sir and follow instruction.'),
(144, '2016-09-06', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Misc', 'REGRESSION TEST', 3, 'Analyse "mfg_bas_pattern_play_spr5722714_p20" and "mfg_bas_pattern_play_spr5722714_p20" regression.'),
(145, '2016-09-07', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Misc', 'REGRESSION TEST', 2, 'Completed Surya sir work '),
(146, '2016-09-07', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 2, 'Analyse "mfg_bas_toolpath_synch_rolex_p20" regression.'),
(147, '2016-09-07', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 2, 'Complete "cast_ui_ribbon_2_13022866_l05" , "cast_bas_ribbon_13022866_l05", "cmm_bas_rmb_model_tree_p20" and "cmm_bas_disp_all_param_l01" regression.\n'),
(148, '2016-09-08', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 2, 'Again helping Surya sir on same work because output is not as per his exceptation.'),
(149, '2016-09-08', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 4, 'Analyse "mfg_bas_toolpath_synch_rolex_p20" regression.'),
(150, '2016-09-09', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 4, 'Analyse "mfg_bas_toolpath_synch_rolex_p20" regression.'),
(151, '2016-09-09', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 2, 'Again helping Surya sir on same work.'),
(152, '2016-09-13', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 3, 'Again helping Surya sir on same work.'),
(153, '2016-09-03', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 3, 'nalyse "mfg_bas_toolpath_synch_rolex_p20" regression.'),
(154, '2016-09-13', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 3, 'Analyse "mfg_bas_toolpath_synch_rolex_p20" regression.'),
(155, '2016-09-14', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 2, 'Again helping Surya sir on same work.'),
(156, '2016-09-14', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'OOS', 'REGRESSION TEST', 3, 'Analyse "mfg_bas_toolpath_synch_rolex_p20" regression. And talk to Rahul.'),
(157, '2016-09-14', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 1, 'Analyse "mfg_bas_not_cen_ref_miss_p20" regression.'),
(158, '2016-09-15', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 4, 'Analyse "mfg_bas_not_cen_ref_miss_p20 " ,  "mfg_bas_not_cent_turn_p20 " , "mold_bas_mt_notif_cntr_msng_comp_p20 " , "mfg_bas_pro_nc_noti_cen_mt_p20" and "mfg_bas_pro_process_noti_cent_blood_trail_p20" regression.'),
(159, '2016-09-16', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'QCR', 'REGRESSION TEST', 4, 'Analyse "mfg_bas_not_cen_ref_miss_p20 " , "mfg_bas_not_cent_turn_p20 " , "mold_bas_mt_notif_cntr_msng_comp_p20 " , "mfg_bas_pro_nc_noti_cen_mt_p20" and "mfg_bas_pro_process_noti_cent_blood_trail_p20" regression.\n		\n	'),
(160, '2016-09-16', 'WMLcSbOlTD9M+JAgQu2fu112+IG3X7DnZzsqc/b9dG0=', 'Meeting', 'MISC', 1, 'Sprint retrospective Meeting.');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
