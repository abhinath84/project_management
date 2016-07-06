-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2015 at 05:47 AM
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
(1111, 'NO', 'YES', 'NO', '', ''),
(2133120, 'N/A', 'N/A', 'N/A', 'N/A', ''),
(2221013, 'NO', 'NO', 'NO', 'NO', ''),
(2226914, 'NO', 'NO', 'NO', 'NO', ''),
(2244774, 'NO', 'NO', 'NO', 'NO', ''),
(2249565, 'NO', 'NO', 'NO', 'YES', '');

-- --------------------------------------------------------

--
-- Table structure for table `spr_tracking`
--

CREATE TABLE IF NOT EXISTS `spr_tracking` (
  `spr_no` int(10) NOT NULL,
  `user_name` varbinary(100) NOT NULL,
  `type` enum('SPR','REGRESSION','OTHERS') NOT NULL,
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
(1111, 'anath', 'SPR', 'NONE', '', 2014, 'P10,P20', 'P-10-32', '2014-02-12'),
(1111, 'rtripathi', 'SPR', 'INVESTIGATING', '', 2014, 'P10', '', '2014-02-01'),
(1112, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10', '', '2015-02-15'),
(1101609, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '2015-01-06'),
(1126558, 'anath', 'SPR', 'CLOSED', 'Hi Roland,Iâ€™m investigating SPR 1126558 (The TITLE_INFO check does not report any errors/warnings, even if there are entries in tables (title bl', 2012, 'L03,P10,P20', '', '2015-01-06'),
(1185049, 'anath', 'SPR', 'ON HOLD', ' Add a missing "Post Regeneration" relation.', 2012, 'L03,P10,P20', '', '2015-01-06'),
(1192881, 'anath', 'REGRESSION', 'NONE', '', 2014, 'P20', '', '0000-00-00'),
(1198281, 'anath', 'REGRESSION', 'NONE', '', 2015, 'P10', '', '2015-02-15'),
(1585365, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(1842746, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2031382, 'anath', 'SPR', 'PASS TO CORRESPONDING GROUP', 'Assigning this SPR back to Assembly group as our team no more working on Assembly SPRs.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2035003, 'anath', 'SPR', 'NOT AN ISSUE', 'In case of ''STD_PRT_INFO_FILE'', external text file does not support ''PRT_PARAMETER'' & ''PRT_LAYER''. Its only support ''PRT_MODEL_NAME'', ''PRT_PARAM_NOTE_', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2035552, 'anath', 'SPR', 'NOT AN ISSUE', 'In case of ''STD_ASM_INFO_FILE'', external text file does not support ''ASM_PARAMETER'' & ''ASM_LAYER''. Its only support ''ASM_MODEL_NAME'', ''ASM_PARAM_NOTE_', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2059037, 'anath', 'SPR', 'PASS TO CORRESPONDING GROUP', 'Pass to corresponding group and mail it to ''Mark''. Defect is closed by corresponding group.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2066734, 'anath', 'SPR', 'SUBMITTED', 'Send mail to Irina and passed her the defect. In the mail described her how problem caused by creating a toolkit App.- Hi Irina,Thanks for the file.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2080495, 'anath', 'SPR', 'PASS FOR TESTING', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2080509, 'anath', 'SPR', 'PASS FOR TESTING', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2081059, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2082181, 'anath', 'SPR', 'SUBMITTED', 'From: Nath, Abhishek \r\nSent: 29 August 2013 05:26 PM\r\nTo: Ender, Matthew\r\nCc: Singh, Kuldeep; Gupta, Arvind\r\nSubject: SPR 2082181\r\n\r\nHi Matthew,\r\n\r\nIâ', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2082658, 'anath', 'SPR', 'NOT AN ISSUE', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2092140, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2093441, 'anath', 'SPR', 'NEED MORE INFO', 'Doesn''t understand what to do? According to the mail threads, ''DETAIL_USERPARAM'' this feature is not supported, then what should we do?\r\n- Close the d', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2093672, 'anath', 'SPR', 'NOT AN ISSUE', 'Sent a mail to ''Michael Youkelzon'' regarding how to reproduce the issue.\r\nClosed by Michael.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2101422, 'anath', 'SPR', 'NONE', 'ggg', 2015, 'P10,P20', '', '2014-12-05'),
(2108488, 'anath', 'SPR', 'NOT AN ISSUE', 'Sent mail to Urs to inform that issue is not reproducing L-03-50 and follow version.Hi Urs,I?ve checked the SPR 2108488 with L-03-50 (M160). And I fou', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2119697, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2121988, 'anath', 'SPR', 'NOT AN ISSUE', 'Abhijit sent mail to tech support to thell them itâ€™s the boundary of the product. And also explain why so.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2125042, 'anath', 'SPR', 'PASS FOR TESTING', '', 2012, 'P20', '', '0000-00-00'),
(2126775, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2128804, 'anath', 'SPR', 'NOT AN ISSUE', 'Hi Abderrazzaq,\r\nI forgot to mentioned that Iâ€™m closing the issue.\r\n\r\n\r\nThanks and best regards\r\nAbhishek\r\n\r\nFrom: Nath, Abhishek \r\nSent: 17 June 20', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2129403, 'anath', 'SPR', 'NOT AN ISSUE', 'Close the defect. Have not get any reply from Thomas and we explained him every thing.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2131809, 'anath', 'SPR', 'SUBMITTED', 'Hi Pallab,\r\n\r\nIâ€™m investigating SPR 2131809 ([SC_P10_REGREBUILD] User unable to add missing comments from model check browser.)\r\nIn Relation, when t', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2133120, 'anath', 'SPR', 'NONE', '', 2015, 'L03,P10,P20', '', '2012-06-04'),
(2139597, 'anath', 'SPR', 'SUBMITTED', 'Submitted on P-10-24, L-03-54', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2147150, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2148229, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2149869, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2150446, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2150796, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2151067, 'anath', 'SPR', 'NOT AN ISSUE', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2151188, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2151193, 'anath', 'SPR', 'NOT AN ISSUE', 'Sent mail to ''Serge'' and describe why it is not a defect.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2157154, 'anath', 'SPR', 'NOT AN ISSUE', 'Have to write a mail to tech support that its not a defect and wrong behavior due to ''REGEN_*'' related checks. If you remove all those checks then pro', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2162137, 'anath', 'SPR', 'SUBMITTED', 'Unable to reproduce the defect. Need more info, I have to investigate more.\r\nProblem resolved. \r\nProblem caused due to the mismatch of tabname(CUSTUM/', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2169019, 'anath', 'SPR', 'PASS TO CORRESPONDING GROUP', 'Its an enhancement. Pass the defect to Rosemary. ', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2169393, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2169984, 'anath', 'SPR', 'NONE', 'Ask Abhijit about the proper msg.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2171226, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2178525, 'anath', 'SPR', 'NOT AN ISSUE', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2179114, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2180784, 'anath', 'SPR', 'PASS TO CORRESPONDING GROUP', 'Problem cause in the function ''ProMdlcheckGetModelmcdata(...)''. Inside this funciton modelCHECK collect ''Creation Date''. So, I have to pass this to co', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2181006, 'anath', 'SPR', 'SUBMITTED', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2186181, 'anath', 'SPR', 'NONE', 'This is the same issue as SPR 2181006.\r\nSo, maked its as duplicate.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2186281, 'anath', 'SPR', 'NOT AN ISSUE', 'Hi Amit,\r\n\r\nAccording to the SPR, in P-10, the only ModelCHECK report difference is â€˜Drawing Detail Setupâ€™.\r\nNow if we click â€˜Drawing Detail Set', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2189973, 'anath', 'SPR', 'SUBMITTED', 'Hi Erich/Rico,\r\n\r\nThis functionality is not a bug.\r\nBy default, circular references are supposed to be reported for all levels in the assembly.\r\nWe ha', 2013, 'L03,P10,P20', '', '0000-00-00'),
(2191768, 'anath', 'SPR', 'NONE', '', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2192761, 'anath', 'SPR', 'NONE', 'Hi Rico,\r\n\r\nSPR 2192761 having a TAN (106836) and customer severity having low impact.\r\nSPR needs substantial changes and its will also change the out', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2193022, 'anath', 'SPR', 'CLOSED', 'It''s a MC gatekeeper problem, while MC is not applicable for bulk item, then gatekeeper must not check for it.', 2012, 'L03,P10,P20', '', '0000-00-00'),
(2218565, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', 'Submitted on P-10-32.Creating a subroutine using MULTAX and copy CL output produces operation CL data containing Rapid feed instead of FEDRAT', 2015, 'P10,P20', 'P-10-32', '2015-01-06'),
(2220422, 'anath', 'SPR', 'NONE', '', 2013, 'P20', '', '0000-00-00'),
(2221013, 'anath', 'SPR', 'NEED MORE INFO', 'Hi Mahesh,Me and Prashant (QA) tried to reproduce the issue by playing trail files or manually, but we are unable to reproduce the issue.Trail files are not working properly and manually itÃƒÂ¢Ã‚Â€Ã‚Â™s not reproducing.My request to you, can you please provide trail file with proper model.It would be better if you provide a video which cover the crash.I mark this SPR as need info.Thanks and best regardsAbhishek', 2015, 'P10,P20', '', '0000-00-00'),
(2226914, 'anath', 'SPR', 'SUBMITTED', 'Submitted on P-10-32.Wrong Toolpath for Area turning NC sequence in Creo Parametric when the NC sequence parameter "STEP_DEPTH_COMPUTATION" is set to "BY_AREA".', 2015, 'P10,P20,P30', 'P-10-32', '0000-00-00'),
(2227587, 'anath', 'SPR', 'SUBMITTED', 'If model is not associated with input tool then API ProToolModelMdlnameGet() returns E_NOT_FOUND (ie 4) instead or returning PRO_TK_E_NOT_FOUND (-4). ', 2013, 'P20', 'P-20-60', '0000-00-00'),
(2239054, 'anath', 'SPR', 'SUBMITTED', 'In a classic face milling sequence CUT_ANGLE seems to be incorrect: instead of 180 (as in parameters) it produces.', 2013, 'P10,P20', 'P-10-32', '0000-00-00'),
(2240004, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', 'FLASH tools are unexpectedly in standard orientation when Material Removal is ran in Vericut from Creo Parametric 3.0.', 2015, 'P20', '', '0000-00-00'),
(2241145, 'anath', 'SPR', 'NOT AN ISSUE', 'Feed is not correctly updated when changing the number of flutes when using the option mm/tooth', 2015, 'P10,P20', '', '0000-00-00'),
(2244774, 'anath', 'SPR', 'NONE', 'Stock allowance setting is not keeping along the whole turn profile for turning sequence "1SP_SCHAUFELN_VORDREHEN"', 2015, 'P10,P20', 'P-10-33', '0000-00-00'),
(2246120, 'anath', 'SPR', 'NONE', 'Response by date 15-Dec.Remove material works incorrectly in turning operation', 2015, 'P10,P20', 'P-10-33', '0000-00-00'),
(2246227, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'PASS FOR TESTING', 'Entry & Exit conditions do not behave as expected in Profile Wire EDM Sequences in Creo Parametric 2.0', 2015, 'P10,P20', 'P-10-33', '2015-01-06'),
(2249565, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'SUBMITTED', 'Submitted on P-20-64.Automatic simulation for multiple operations with different csys in Vericut. Ability to simulate the complete process: Top and bottom machining of par', 2015, 'P10,P20', 'P-20-64', '2015-01-07'),
(2249748, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', 'ResponseSimilar kind of problem in SPR 1837193.ask Bill.Hasenjaeger@cgtech.com corporate.Support@cgtech.com', 2015, 'P10,P20', '', '2015-01-06'),
(2250972, 'anath', 'SPR', 'NONE', '', 2015, 'P10,P20', 'P-10-34', '2015-01-05'),
(2251260, 'anath', 'SPR', 'NONE', 'Respond by 07-Jan-2014', 2015, 'P10,P20', '', '2015-01-07'),
(2252032, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20', '', '2015-01-26'),
(2253386, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P10,P20,P30', 'P-10-34', '2015-02-02'),
(2254103, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P20, P30', 'P-20-66', '2015-02-09'),
(2254166, 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'SPR', 'NONE', '', 2015, 'P20,P30', '', '2015-03-09');

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
('rtripathi', 'abc', 'Rishabh', 'Tripathi', 'Male', 'Tech Lead', 'MCAD', 'rtripathi@ptc.com', '', 'agupta'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `work_tracker`
--

INSERT INTO `work_tracker` (`id`, `day`, `user_name`, `task`, `category`, `time`, `comment`) VALUES
(1, '2014-12-22', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '2226914', 'SPR', 3, 'Commit Build P-10-32'),
(2, '2014-12-22', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', 'project management', 'OTHERS', 1, 'kk'),
(15, '2014-12-29', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '66', 'SPR', 9, ''),
(28, '2015-01-16', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '3333', 'SPR', 2, ''),
(31, '2015-01-16', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '44', 'SPR', 2, ''),
(33, '2015-01-22', 'xDK1A19VIXHFSXK2lSl30H/R5AM31+wwkIi0pa1Kz/c=', '4444', 'SPR', 2, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
