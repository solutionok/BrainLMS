-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2019 at 05:38 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `l5_cutebrains`
--

-- --------------------------------------------------------

--
-- Table structure for table `mailsms_templates`
--

CREATE TABLE `mailsms_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `templateTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `templateMail` text COLLATE utf8_unicode_ci,
  `templateSMS` text COLLATE utf8_unicode_ci,
  `templateVars` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mailsms_templates`
--

INSERT INTO `mailsms_templates` (`id`, `templateTitle`, `templateMail`, `templateSMS`, `templateVars`) VALUES
(1, 'Exam Details', '<p>Dear {studentName},</p>\n							<p>the following table contain the marks of exam : {examTitle} started on {examDate}</p>\n							<p>{examGradesTable}</p>\n							<p>Best Regards,</p>\n							<p>{schoolTitle}</p>', 'Dear {studentName}, exam {examTitle} marks : {examGradesTable}', '{studentName},{studentRoll},{studentEmail},{studentUsername},{examGradesTable},{examTitle},{examDescription},{examDate},{schoolTitle}'),
(2, 'Exam Details mini', '<p>Dear {studentName},</p>\n							<p>total marks of exam : {examTitle} started on {examDate}</p>\n							<p>{totalMarks}</p>\n							<p>Best Regards,</p>', 'Dear {studentName}, exam {examTitle} marks : {examGradesTable}', '{studentName},{studentRoll},{studentEmail},{studentUsername},{totalMarks},{examTitle},{examDate},{schoolTitle}'),
(3, 'Student Absent', '<p>Dear {parentName},</p>\n							<p>The student {studentName} is absent Today with status : {absentStatus}</p>\n							<p>Absense date : {absentDate}</p>\n							<p>Best Regards,</p>\n							<p>{schoolTitle}</p>', 'Dear {parentName}, The student {studentName} is absent Today with status : {absentStatus}', '{studentName},{studentRoll},{studentEmail},{studentUsername},{parentName},{parentEmail},{parentEmail},{absentDate},{absentStatus},{schoolTitle}'),
(4, 'New Template', '<p>This template used when sending new mail&nbsp;</p>', 'This template used when sending new sms', NULL),
(5, 'Due Invoice', '<p>Hello {name},</p>\n							<p>Invoice {invoice_id} is due.</p>\n							<p>Invoice details : {invoice_details}</p>\n							<p>Amount : {invoice_amount}</p>\n							<p>Invoice Date : {invoice_date}</p>', 'Invoice {invoice_id} is due with amount {invoice_amount}', NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
