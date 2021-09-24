-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 21, 2021 at 10:43 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpdmf`
--

-- --------------------------------------------------------

--
-- Table structure for table `answervote`
--

DROP TABLE IF EXISTS `answervote`;
CREATE TABLE IF NOT EXISTS `answervote` (
  `memberId` varchar(10) NOT NULL,
  `forumId` int(7) NOT NULL,
  `answerId` int(7) NOT NULL,
  `vote` int(1) NOT NULL,
  PRIMARY KEY (`memberId`,`answerId`,`forumId`),
  KEY `fk_fid_ans` (`forumId`),
  KEY `fk_ans` (`answerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `approvedmember`
--

DROP TABLE IF EXISTS `approvedmember`;
CREATE TABLE IF NOT EXISTS `approvedmember` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mid_approved` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `associatemember`
--

DROP TABLE IF EXISTS `associatemember`;
CREATE TABLE IF NOT EXISTS `associatemember` (
  `memberId` varchar(10) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `blogId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `publishedDate` date NOT NULL,
  `image` varchar(255) NOT NULL,
  `readMin` int(3) NOT NULL,
  `readCount` int(5) NOT NULL,
  `likeCount` int(5) NOT NULL,
  `reviewBy` varchar(10) NOT NULL,
  PRIMARY KEY (`blogId`,`memberId`),
  KEY `fk_mid_blog` (`memberId`),
  KEY `fk_reviewby_blog` (`reviewBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogcomment`
--

DROP TABLE IF EXISTS `blogcomment`;
CREATE TABLE IF NOT EXISTS `blogcomment` (
  `commentId` int(7) NOT NULL,
  `blogId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `replyFor` int(7) NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `fk_bid_bcomm` (`blogId`),
  KEY `fk_mid_bcomm` (`memberId`),
  KEY `fk_reply_bcomm` (`replyFor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contentaccess`
--

DROP TABLE IF EXISTS `contentaccess`;
CREATE TABLE IF NOT EXISTS `contentaccess` (
  `memberId` varchar(10) NOT NULL,
  `courseId` int(7) NOT NULL,
  `contentId` varchar(20) NOT NULL,
  `starDate` date NOT NULL,
  `completeDate` date NOT NULL,
  `lastAccess` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `testAttempt` int(10) NOT NULL,
  PRIMARY KEY (`contentId`,`courseId`,`memberId`),
  KEY `fk_mid_con_acc` (`memberId`),
  KEY `fk_course_id` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `councilmember`
--

DROP TABLE IF EXISTS `councilmember`;
CREATE TABLE IF NOT EXISTS `councilmember` (
  `memberId` varchar(10) NOT NULL,
  `coFlag` int(1) NOT NULL,
  `cmFlag` int(1) NOT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coursecomment`
--

DROP TABLE IF EXISTS `coursecomment`;
CREATE TABLE IF NOT EXISTS `coursecomment` (
  `commentId` int(6) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `contentId` varchar(20) NOT NULL,
  `type` varchar(30) NOT NULL,
  `description` varchar(60) NOT NULL,
  `date` date NOT NULL,
  `replyFor` int(6) NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `fk_mid_com` (`memberId`),
  KEY `fk_cid_com` (`contentId`),
  KEY `fk_reply_comm` (`replyFor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coursecontent`
--

DROP TABLE IF EXISTS `coursecontent`;
CREATE TABLE IF NOT EXISTS `coursecontent` (
  `contentId` varchar(20) NOT NULL,
  `contentNo` int(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `contentType` varchar(30) NOT NULL,
  `content` varchar(100) NOT NULL,
  `examFlag` varchar(10) NOT NULL,
  `passMark` int(10) NOT NULL,
  `courseId` int(7) NOT NULL,
  PRIMARY KEY (`contentId`,`courseId`),
  KEY `fk_cid_content` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courseenroll`
--

DROP TABLE IF EXISTS `courseenroll`;
CREATE TABLE IF NOT EXISTS `courseenroll` (
  `courseId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `startDate` date NOT NULL,
  `lastAccess` datetime NOT NULL,
  `status` varchar(30) NOT NULL,
  `certifiedDate` date NOT NULL,
  PRIMARY KEY (`courseId`,`memberId`),
  KEY `fk_mid_enroll` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courseqchoice`
--

DROP TABLE IF EXISTS `courseqchoice`;
CREATE TABLE IF NOT EXISTS `courseqchoice` (
  `chId` varchar(20) NOT NULL,
  `qId` varchar(20) NOT NULL,
  `courseId` int(8) NOT NULL,
  `contentId` varchar(20) NOT NULL,
  `choice` varchar(50) NOT NULL,
  `correctFlag` varchar(10) NOT NULL,
  PRIMARY KEY (`chId`),
  KEY `fk_qid_ch` (`qId`),
  KEY `fk_content_ch` (`contentId`),
  KEY `fk_course_ch` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courseque`
--

DROP TABLE IF EXISTS `courseque`;
CREATE TABLE IF NOT EXISTS `courseque` (
  `qId` varchar(20) NOT NULL,
  `qNum` int(4) NOT NULL,
  `courseId` int(7) NOT NULL,
  `contentId` varchar(20) NOT NULL,
  `qDescription` varchar(50) NOT NULL,
  `marks` int(10) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`qId`),
  KEY `fk_course_que` (`courseId`),
  KEY `fk_content_que` (`contentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cpdrecords`
--

DROP TABLE IF EXISTS `cpdrecords`;
CREATE TABLE IF NOT EXISTS `cpdrecords` (
  `recordId` int(7) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(10) NOT NULL,
  `type` varchar(30) NOT NULL,
  `proof` varchar(100) NOT NULL,
  `note` varchar(50) NOT NULL,
  `credit` int(10) NOT NULL,
  `recordDate` date NOT NULL,
  `approvedBy` varchar(10) NOT NULL,
  `approvedDate` date NOT NULL,
  `status` varchar(15) NOT NULL,
  `refId` int(10) NOT NULL,
  PRIMARY KEY (`recordId`),
  KEY `fk_mid_cpd` (`memberId`),
  KEY `fk_appby_cpd` (`approvedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creditinfo`
--

DROP TABLE IF EXISTS `creditinfo`;
CREATE TABLE IF NOT EXISTS `creditinfo` (
  `memberId` varchar(6) NOT NULL,
  `year` year(4) NOT NULL,
  `creditLevel` int(10) NOT NULL,
  `completedCredits` int(10) NOT NULL,
  PRIMARY KEY (`memberId`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `csslcourse`
--

DROP TABLE IF EXISTS `csslcourse`;
CREATE TABLE IF NOT EXISTS `csslcourse` (
  `courseId` int(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `duration` int(10) NOT NULL,
  `language` varchar(30) NOT NULL,
  `skillLevel` varchar(50) NOT NULL,
  `image` int(11) NOT NULL,
  `mode` varchar(30) NOT NULL,
  `conductedBy` varchar(10) NOT NULL,
  `approvedBy` varchar(10) NOT NULL,
  `approvedDate` date NOT NULL,
  `noOfInteraction` int(30) NOT NULL,
  `avgRate` int(20) NOT NULL,
  PRIMARY KEY (`courseId`),
  KEY `fk_approve_cc` (`approvedBy`),
  KEY `fk_conduct_cc` (`conductedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `csslworkshop`
--

DROP TABLE IF EXISTS `csslworkshop`;
CREATE TABLE IF NOT EXISTS `csslworkshop` (
  `wId` int(7) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `fromDate` date NOT NULL,
  `toDate` date NOT NULL,
  `duration` int(10) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `qrCode` varchar(255) NOT NULL,
  `credit` int(10) NOT NULL,
  `addBy` int(6) NOT NULL,
  `verifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`wId`),
  KEY `fk_very_cw` (`verifiedBy`),
  KEY `fk_add_cw` (`addBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `forumId` int(7) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `publishDate` date NOT NULL,
  `memberId` varchar(10) NOT NULL,
  PRIMARY KEY (`forumId`),
  KEY `fk_mid_forum` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forumanswer`
--

DROP TABLE IF EXISTS `forumanswer`;
CREATE TABLE IF NOT EXISTS `forumanswer` (
  `answerId` int(10) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `forumId` int(8) NOT NULL,
  `date` datetime NOT NULL,
  `answer` varchar(300) NOT NULL,
  `voteCount` int(5) NOT NULL,
  PRIMARY KEY (`answerId`,`forumId`),
  KEY `fk_mid_fans` (`memberId`),
  KEY `fk_fid_fans` (`forumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `glapplicant`
--

DROP TABLE IF EXISTS `glapplicant`;
CREATE TABLE IF NOT EXISTS `glapplicant` (
  `gId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `appliedDate` date NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`gId`,`memberId`),
  KEY `fk_mid_gapp` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `glselect`
--

DROP TABLE IF EXISTS `glselect`;
CREATE TABLE IF NOT EXISTS `glselect` (
  `gId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `selectedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`gId`,`memberId`,`selectedBy`),
  KEY `fk_mid_gselect` (`memberId`),
  KEY `fk_seby_gselect` (`selectedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guestlecture`
--

DROP TABLE IF EXISTS `guestlecture`;
CREATE TABLE IF NOT EXISTS `guestlecture` (
  `gId` int(7) NOT NULL AUTO_INCREMENT,
  `university` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `addBy` int(6) NOT NULL,
  `credit` int(3) NOT NULL,
  `verifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`gId`),
  KEY `fk_verify_gl` (`verifiedBy`),
  KEY `fk_add_gl` (`addBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobapplicant`
--

DROP TABLE IF EXISTS `jobapplicant`;
CREATE TABLE IF NOT EXISTS `jobapplicant` (
  `jvId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `cv` blob NOT NULL,
  `description` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `marks` int(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `answerSheet` varchar(250) NOT NULL,
  PRIMARY KEY (`jvId`,`memberId`),
  KEY `fk_mid_japp` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobvacancy`
--

DROP TABLE IF EXISTS `jobvacancy`;
CREATE TABLE IF NOT EXISTS `jobvacancy` (
  `jvId` int(7) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `advertisment` varchar(300) NOT NULL,
  `addBy` int(6) NOT NULL,
  PRIMARY KEY (`jvId`),
  KEY `fk_add_jvac` (`addBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `memberType` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `memberjob`
--

DROP TABLE IF EXISTS `memberjob`;
CREATE TABLE IF NOT EXISTS `memberjob` (
  `jobId` int(7) NOT NULL,
  `companyName` varchar(30) NOT NULL,
  `designation` varchar(40) NOT NULL,
  `postolNo` int(10) NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `contact` int(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `fax` varchar(40) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  PRIMARY KEY (`memberId`,`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `memberlogin`
--

DROP TABLE IF EXISTS `memberlogin`;
CREATE TABLE IF NOT EXISTS `memberlogin` (
  `username` varchar(30) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_mid_login` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
CREATE TABLE IF NOT EXISTS `officer` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `officerType` varchar(50) NOT NULL,
  `addBy` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_officer` (`addBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `officerlogin`
--

DROP TABLE IF EXISTS `officerlogin`;
CREATE TABLE IF NOT EXISTS `officerlogin` (
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `officerId` int(6) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_officer_login` (`officerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `othercourse`
--

DROP TABLE IF EXISTS `othercourse`;
CREATE TABLE IF NOT EXISTS `othercourse` (
  `courseId` int(7) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `platform` varchar(20) NOT NULL,
  `skillLevel` varchar(40) NOT NULL,
  `duration` int(7) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `category` varchar(20) NOT NULL,
  `partner` int(7) NOT NULL,
  `approvedBy` varchar(10) NOT NULL,
  `approvedDate` date NOT NULL,
  `credit` int(10) NOT NULL,
  PRIMARY KEY (`courseId`),
  KEY `fk_approve_oc` (`approvedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentId` int(7) NOT NULL,
  `year` year(4) NOT NULL,
  `payDate` date NOT NULL,
  `amount` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `verifiedBy` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `fk_mid_pay` (`memberId`),
  KEY `fk_oid_pay` (`verifiedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `professionalmember`
--

DROP TABLE IF EXISTS `professionalmember`;
CREATE TABLE IF NOT EXISTS `professionalmember` (
  `memberId` varchar(10) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `previousFlag` int(1) NOT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
CREATE TABLE IF NOT EXISTS `referee` (
  `refId` int(7) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` int(10) NOT NULL,
  `id` int(6) NOT NULL,
  PRIMARY KEY (`id`,`refId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `studentmember`
--

DROP TABLE IF EXISTS `studentmember`;
CREATE TABLE IF NOT EXISTS `studentmember` (
  `memberId` varchar(10) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testinfo`
--

DROP TABLE IF EXISTS `testinfo`;
CREATE TABLE IF NOT EXISTS `testinfo` (
  `testId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `contentId` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `marks` int(10) NOT NULL,
  `attempNo` int(10) NOT NULL,
  `answerSheet` varchar(200) NOT NULL,
  PRIMARY KEY (`testId`),
  KEY `fk_mid_test` (`memberId`),
  KEY `fk_cid_test` (`contentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `postalNo` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contactNo` varchar(12) NOT NULL,
  `userType` varchar(40) NOT NULL,
  `approvedBy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nic` (`nic`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_cm1` (`approvedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workshopconduct`
--

DROP TABLE IF EXISTS `workshopconduct`;
CREATE TABLE IF NOT EXISTS `workshopconduct` (
  `wId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`wId`,`memberId`),
  KEY `fk_mid_conduct` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workshopparticipate`
--

DROP TABLE IF EXISTS `workshopparticipate`;
CREATE TABLE IF NOT EXISTS `workshopparticipate` (
  `wId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`wId`,`memberId`),
  KEY `fk_mid_wpartici` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workshopreg`
--

DROP TABLE IF EXISTS `workshopreg`;
CREATE TABLE IF NOT EXISTS `workshopreg` (
  `wId` int(7) NOT NULL,
  `memberId` varchar(10) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`wId`,`memberId`),
  KEY `fk_mid_wreg` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answervote`
--
ALTER TABLE `answervote`
  ADD CONSTRAINT `fk_ans` FOREIGN KEY (`answerId`) REFERENCES `forumanswer` (`answerId`),
  ADD CONSTRAINT `fk_fid_ans` FOREIGN KEY (`forumId`) REFERENCES `forum` (`forumId`),
  ADD CONSTRAINT `fk_mid_ans` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `approvedmember`
--
ALTER TABLE `approvedmember`
  ADD CONSTRAINT `fk_mid_approved` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_uid_approved` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Constraints for table `associatemember`
--
ALTER TABLE `associatemember`
  ADD CONSTRAINT `fk_ass_member` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `fk_mid_blog` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_reviewby_blog` FOREIGN KEY (`reviewBy`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `blogcomment`
--
ALTER TABLE `blogcomment`
  ADD CONSTRAINT `fk_bid_bcomm` FOREIGN KEY (`blogId`) REFERENCES `blog` (`blogId`),
  ADD CONSTRAINT `fk_mid_bcomm` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_reply_bcomm` FOREIGN KEY (`replyFor`) REFERENCES `blogcomment` (`commentId`);

--
-- Constraints for table `contentaccess`
--
ALTER TABLE `contentaccess`
  ADD CONSTRAINT `fk_conid` FOREIGN KEY (`contentId`) REFERENCES `coursecontent` (`contentId`),
  ADD CONSTRAINT `fk_course_id` FOREIGN KEY (`courseId`) REFERENCES `csslcourse` (`courseId`),
  ADD CONSTRAINT `fk_mid_con_acc` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `councilmember`
--
ALTER TABLE `councilmember`
  ADD CONSTRAINT `fk_cocm` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `coursecomment`
--
ALTER TABLE `coursecomment`
  ADD CONSTRAINT `fk_cid_com` FOREIGN KEY (`contentId`) REFERENCES `coursecontent` (`contentId`),
  ADD CONSTRAINT `fk_mid_com` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_reply_comm` FOREIGN KEY (`replyFor`) REFERENCES `coursecomment` (`commentId`);

--
-- Constraints for table `coursecontent`
--
ALTER TABLE `coursecontent`
  ADD CONSTRAINT `fk_cid_content` FOREIGN KEY (`courseId`) REFERENCES `csslcourse` (`courseId`);

--
-- Constraints for table `courseenroll`
--
ALTER TABLE `courseenroll`
  ADD CONSTRAINT `fk_cid_enroll` FOREIGN KEY (`courseId`) REFERENCES `csslcourse` (`courseId`),
  ADD CONSTRAINT `fk_mid_enroll` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `courseqchoice`
--
ALTER TABLE `courseqchoice`
  ADD CONSTRAINT `fk_content_ch` FOREIGN KEY (`contentId`) REFERENCES `coursecontent` (`contentId`),
  ADD CONSTRAINT `fk_course_ch` FOREIGN KEY (`courseId`) REFERENCES `csslcourse` (`courseId`),
  ADD CONSTRAINT `fk_qid_ch` FOREIGN KEY (`qId`) REFERENCES `courseque` (`qId`);

--
-- Constraints for table `courseque`
--
ALTER TABLE `courseque`
  ADD CONSTRAINT `fk_content_que` FOREIGN KEY (`contentId`) REFERENCES `coursecontent` (`contentId`),
  ADD CONSTRAINT `fk_course_que` FOREIGN KEY (`courseId`) REFERENCES `csslcourse` (`courseId`);

--
-- Constraints for table `cpdrecords`
--
ALTER TABLE `cpdrecords`
  ADD CONSTRAINT `fk_appby_cpd` FOREIGN KEY (`approvedBy`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_mid_cpd` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `creditinfo`
--
ALTER TABLE `creditinfo`
  ADD CONSTRAINT `fk_creditinfo` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `csslcourse`
--
ALTER TABLE `csslcourse`
  ADD CONSTRAINT `fk_approve_cc` FOREIGN KEY (`approvedBy`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_conduct_cc` FOREIGN KEY (`conductedBy`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `csslworkshop`
--
ALTER TABLE `csslworkshop`
  ADD CONSTRAINT `fk_add_cw` FOREIGN KEY (`addBy`) REFERENCES `officer` (`id`),
  ADD CONSTRAINT `fk_very_cw` FOREIGN KEY (`verifiedBy`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `fk_mid_forum` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `forumanswer`
--
ALTER TABLE `forumanswer`
  ADD CONSTRAINT `fk_fid_fans` FOREIGN KEY (`forumId`) REFERENCES `forum` (`forumId`),
  ADD CONSTRAINT `fk_mid_fans` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `glapplicant`
--
ALTER TABLE `glapplicant`
  ADD CONSTRAINT `fk_gid_gapp` FOREIGN KEY (`gId`) REFERENCES `guestlecture` (`gId`),
  ADD CONSTRAINT `fk_mid_gapp` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `glselect`
--
ALTER TABLE `glselect`
  ADD CONSTRAINT `fk_gid_gselect` FOREIGN KEY (`gId`) REFERENCES `guestlecture` (`gId`),
  ADD CONSTRAINT `fk_mid_gselect` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_seby_gselect` FOREIGN KEY (`selectedBy`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `guestlecture`
--
ALTER TABLE `guestlecture`
  ADD CONSTRAINT `fk_add_gl` FOREIGN KEY (`addBy`) REFERENCES `officer` (`id`),
  ADD CONSTRAINT `fk_verify_gl` FOREIGN KEY (`verifiedBy`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `jobapplicant`
--
ALTER TABLE `jobapplicant`
  ADD CONSTRAINT `fk_jid_japp` FOREIGN KEY (`jvId`) REFERENCES `jobvacancy` (`jvId`),
  ADD CONSTRAINT `fk_mid_japp` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `jobvacancy`
--
ALTER TABLE `jobvacancy`
  ADD CONSTRAINT `fk_add_jvac` FOREIGN KEY (`addBy`) REFERENCES `officer` (`id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `fk_uid1` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Constraints for table `memberjob`
--
ALTER TABLE `memberjob`
  ADD CONSTRAINT `fk_member_job` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `memberlogin`
--
ALTER TABLE `memberlogin`
  ADD CONSTRAINT `fk_mid_login` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `officer`
--
ALTER TABLE `officer`
  ADD CONSTRAINT `fk_admin_officer` FOREIGN KEY (`addBy`) REFERENCES `officer` (`id`),
  ADD CONSTRAINT `fk_uid_officer` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Constraints for table `officerlogin`
--
ALTER TABLE `officerlogin`
  ADD CONSTRAINT `fk_officer_login` FOREIGN KEY (`officerId`) REFERENCES `officer` (`id`);

--
-- Constraints for table `othercourse`
--
ALTER TABLE `othercourse`
  ADD CONSTRAINT `fk_approve_oc` FOREIGN KEY (`approvedBy`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_mid_pay` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_oid_pay` FOREIGN KEY (`verifiedBy`) REFERENCES `officer` (`id`);

--
-- Constraints for table `professionalmember`
--
ALTER TABLE `professionalmember`
  ADD CONSTRAINT `fk_pro_member` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `referee`
--
ALTER TABLE `referee`
  ADD CONSTRAINT `fk_ref` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Constraints for table `studentmember`
--
ALTER TABLE `studentmember`
  ADD CONSTRAINT `fk_st_member` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `testinfo`
--
ALTER TABLE `testinfo`
  ADD CONSTRAINT `fk_cid_test` FOREIGN KEY (`contentId`) REFERENCES `coursecontent` (`contentId`),
  ADD CONSTRAINT `fk_mid_test` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_cm1` FOREIGN KEY (`approvedBy`) REFERENCES `member` (`memberId`);

--
-- Constraints for table `workshopconduct`
--
ALTER TABLE `workshopconduct`
  ADD CONSTRAINT `fk_mid_conduct` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_wid_conduct` FOREIGN KEY (`wId`) REFERENCES `csslworkshop` (`wId`);

--
-- Constraints for table `workshopparticipate`
--
ALTER TABLE `workshopparticipate`
  ADD CONSTRAINT `fk_mid_wpartici` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_wid_wpartici` FOREIGN KEY (`wId`) REFERENCES `csslworkshop` (`wId`);

--
-- Constraints for table `workshopreg`
--
ALTER TABLE `workshopreg`
  ADD CONSTRAINT `fk_mid_wreg` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `fk_wid_wreg` FOREIGN KEY (`wId`) REFERENCES `csslworkshop` (`wId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
