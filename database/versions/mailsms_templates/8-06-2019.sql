-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 06, 2019 at 02:18 PM
-- Server version: 5.7.27-0ubuntu0.16.04.1
-- PHP Version: 5.6.40-8+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cutebrainsdev`
--

-- --------------------------------------------------------

--
-- Table structure for table `mailsms_templates`
--

CREATE TABLE `mailsms_templates` (
  `id` int(250) NOT NULL,
  `templateTitle` varchar(250) NOT NULL,
  `templateMail` longtext,
  `templateSMS` text,
  `templateVars` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mailsms_templates`
--

INSERT INTO `mailsms_templates` (`id`, `templateTitle`, `templateMail`, `templateSMS`, `templateVars`) VALUES
(1, 'Exam Details', '<p>Dear {studentName},</p>\n\n<p>the following table contain the marks of exam : {examTitle} started on {examDate}</p>\n\n<p>{examGradesTable}</p>\n\n<p>Best Regards,</p>\n\n<p>{schoolTitle}</p>\n', 'Dear {studentName}, exam {examTitle} marks : {examGradesTable}', '{studentName},{studentRoll},{studentEmail},{studentUsername},{examGradesTable},{examTitle},{examDescription},{examDate},{schoolTitle}'),
(2, 'Student Absent', '<p>Dear {parentName},</p>\n\n<p>The student {studentName} is absent Today with status : {absentStatus}</p>\n\n<p>Absense date : {absentDate}</p>\n\n<p>Best Regards,</p>\n\n<p>{schoolTitle}</p>\n', 'Dear {parentName}, The student {studentName} is absent Today with status : {absentStatus}', '{studentName},{studentRoll},{studentEmail},{studentUsername},{parentName},{parentEmail},{parentEmail},{absentDate},{absentStatus},{schoolTitle}'),
(3, 'New Template', '<p>This template used when sending new mail&nbsp;</p>\n', 'This template used when sending new sms', NULL),
(4, 'Due Invoice', '<p>Hello {name},</p>\n\n<p>Invoice {invoice_id} is due.</p>\n\n<p>Invoice details : {invoice_details}</p>\n\n<p>Amount : {invoice_amount}</p>\n\n<p>Invoice Date : {invoice_date}</p>\n', 'Invoice {invoice_id} is due with amount {invoice_amount}', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mailsms_templates`
--
ALTER TABLE `mailsms_templates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mailsms_templates`
--
ALTER TABLE `mailsms_templates`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
