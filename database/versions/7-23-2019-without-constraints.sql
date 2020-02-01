-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2019 at 09:24 AM
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
-- Table structure for table `academic_year`
--

CREATE TABLE `academic_year` (
  `id` int(11) NOT NULL,
  `yearTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `isDefault` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `classId` text COLLATE utf8_unicode_ci NOT NULL,
  `sectionId` text COLLATE utf8_unicode_ci NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `AssignTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `AssignDescription` text COLLATE utf8_unicode_ci,
  `AssignFile` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `AssignDeadLine` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments_answers`
--

CREATE TABLE `assignments_answers` (
  `id` int(11) NOT NULL,
  `assignmentId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `fileName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `userNotes` text COLLATE utf8_unicode_ci NOT NULL,
  `userTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `date` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `studentId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `in_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `out_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `attNotes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_library`
--

CREATE TABLE `book_library` (
  `id` int(11) NOT NULL,
  `bookName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `bookDescription` text COLLATE utf8_unicode_ci NOT NULL,
  `bookISBN` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `bookAuthor` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `bookPublisher` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `bookType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `bookPrice` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bookFile` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bookState` int(11) DEFAULT NULL,
  `bookQuantity` int(11) NOT NULL,
  `bookShelf` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `certificate_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `header_left` text COLLATE utf8_unicode_ci NOT NULL,
  `header_right` text COLLATE utf8_unicode_ci NOT NULL,
  `header_middle` text COLLATE utf8_unicode_ci NOT NULL,
  `main_title` text COLLATE utf8_unicode_ci NOT NULL,
  `main_content` text COLLATE utf8_unicode_ci NOT NULL,
  `footer_left` text COLLATE utf8_unicode_ci NOT NULL,
  `footer_right` text COLLATE utf8_unicode_ci NOT NULL,
  `footer_middle` text COLLATE utf8_unicode_ci NOT NULL,
  `certificate_image` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `className` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classAcademicYear` int(11) NOT NULL,
  `classTeacher` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classSubjects` text COLLATE utf8_unicode_ci NOT NULL,
  `dormitoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule`
--

CREATE TABLE `class_schedule` (
  `id` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `dayOfWeek` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `startTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `endTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `comp_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comp_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `comp_type` int(11) NOT NULL,
  `comp_source` int(11) NOT NULL,
  `FullName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNo` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enq_date` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `nxt_fup` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enq_file` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enq_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `mail_subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `message_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `depart_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `depart_desc` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(11) NOT NULL,
  `desig_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `desig_desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dormitories`
--

CREATE TABLE `dormitories` (
  `id` int(11) NOT NULL,
  `dormitory` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `dormDesc` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(11) NOT NULL,
  `enq_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enq_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `enq_type` int(11) NOT NULL,
  `enq_source` int(11) NOT NULL,
  `FullName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNo` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enq_date` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `nxt_fup` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enq_file` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enq_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `eventTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `eventDescription` text COLLATE utf8_unicode_ci,
  `eventFor` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enentPlace` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eventImage` text COLLATE utf8_unicode_ci NOT NULL,
  `fe_active` int(11) NOT NULL,
  `eventDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams_list`
--

CREATE TABLE `exams_list` (
  `id` int(11) NOT NULL,
  `examTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `examDescription` text COLLATE utf8_unicode_ci,
  `examDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `examEndDate` int(11) NOT NULL,
  `examClasses` text COLLATE utf8_unicode_ci NOT NULL,
  `examMarksheetColumns` text COLLATE utf8_unicode_ci NOT NULL,
  `examAcYear` int(11) NOT NULL,
  `examSchedule` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` int(11) NOT NULL,
  `examId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `examMark` text COLLATE utf8_unicode_ci NOT NULL,
  `totalMarks` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `markComments` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expenseDate` int(11) NOT NULL,
  `expenseTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `expenseAmount` int(11) NOT NULL,
  `expenseCategory` int(11) NOT NULL,
  `expenseImage` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `expenseNotes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_cat`
--

CREATE TABLE `expenses_cat` (
  `id` int(11) NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_pages`
--

CREATE TABLE `frontend_pages` (
  `id` int(11) NOT NULL,
  `page_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `page_permalink` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `page_content` text COLLATE utf8_unicode_ci NOT NULL,
  `page_status` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `page_visibility` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `page_navbar_visible` int(11) NOT NULL,
  `page_password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `page_publish_date` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `page_publish_specific_date` int(11) NOT NULL,
  `page_template` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `page_feat_image` text COLLATE utf8_unicode_ci NOT NULL,
  `page_slider_images` text COLLATE utf8_unicode_ci NOT NULL,
  `page_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_levels`
--

CREATE TABLE `grade_levels` (
  `id` int(11) NOT NULL,
  `gradeName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gradeDescription` text COLLATE utf8_unicode_ci,
  `gradePoints` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gradeFrom` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gradeTo` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homeworks`
--

CREATE TABLE `homeworks` (
  `id` int(11) NOT NULL,
  `classId` text COLLATE utf8_unicode_ci NOT NULL,
  `sectionId` text COLLATE utf8_unicode_ci NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `homeworkTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `homeworkDescription` text COLLATE utf8_unicode_ci,
  `homeworkFile` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `homeworkDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `homeworkSubmissionDate` int(11) NOT NULL,
  `homeworkEvaluationDate` int(11) NOT NULL,
  `studentsCompleted` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `hostelTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `hostelType` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hostelAddress` text COLLATE utf8_unicode_ci NOT NULL,
  `hostelManager` text COLLATE utf8_unicode_ci NOT NULL,
  `managerPhoto` text COLLATE utf8_unicode_ci NOT NULL,
  `managerContact` text COLLATE utf8_unicode_ci NOT NULL,
  `hostelNotes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_cat`
--

CREATE TABLE `hostel_cat` (
  `id` int(11) NOT NULL,
  `catTypeId` int(11) NOT NULL,
  `catTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `catFees` int(11) NOT NULL,
  `catNotes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `incomeDate` int(11) NOT NULL,
  `incomeTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `incomeAmount` int(11) NOT NULL,
  `incomeCategory` int(11) NOT NULL,
  `incomeImage` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `incomeNotes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_cat`
--

CREATE TABLE `income_cat` (
  `id` int(11) NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_cat`
--

CREATE TABLE `inv_cat` (
  `id` int(11) NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_issue`
--

CREATE TABLE `inv_issue` (
  `id` int(11) NOT NULL,
  `refno` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `item_cat` int(11) NOT NULL,
  `item_title` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `issue_tu` text COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` int(11) NOT NULL,
  `ret_date` int(11) NOT NULL,
  `is_returned` int(11) NOT NULL DEFAULT '0',
  `attachment` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `issue_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_code`
--

CREATE TABLE `items_code` (
  `id` int(11) NOT NULL,
  `item_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `item_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `item_cat` int(11) NOT NULL,
  `item_code` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `item_pn` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_stock`
--

CREATE TABLE `items_stock` (
  `id` int(11) NOT NULL,
  `refno` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `qty` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `stock_date` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `stock_attach` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `stock_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `languageTitle` text COLLATE utf8_unicode_ci NOT NULL,
  `languageUniversal` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `languagePhrases` text COLLATE utf8_unicode_ci NOT NULL,
  `isRTL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_issue`
--

CREATE TABLE `library_issue` (
  `id` int(11) NOT NULL,
  `issue_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` text COLLATE utf8_unicode_ci NOT NULL,
  `book_id` int(11) NOT NULL,
  `serial_num` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` int(11) NOT NULL,
  `ret_date` int(11) NOT NULL,
  `is_returned` int(11) NOT NULL DEFAULT '0',
  `issue_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mailsms`
--

CREATE TABLE `mailsms` (
  `id` int(11) NOT NULL,
  `mailTo` text COLLATE utf8_unicode_ci NOT NULL,
  `mailType` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `messageData` text COLLATE utf8_unicode_ci NOT NULL,
  `messageDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `messageSender` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mailsms_templates`
--

CREATE TABLE `mailsms_templates` (
  `id` int(11) NOT NULL,
  `templateTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `templateMail` text COLLATE utf8_unicode_ci,
  `templateSMS` text COLLATE utf8_unicode_ci,
  `templateVars` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_albums`
--

CREATE TABLE `media_albums` (
  `id` int(11) NOT NULL,
  `albumTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `albumDescription` text COLLATE utf8_unicode_ci NOT NULL,
  `albumImage` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `albumParent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_items`
--

CREATE TABLE `media_items` (
  `id` int(11) NOT NULL,
  `albumId` int(11) NOT NULL DEFAULT '0',
  `mediaType` int(11) NOT NULL,
  `mediaURL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mediaURLThumb` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mediaTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mediaDescription` text COLLATE utf8_unicode_ci NOT NULL,
  `mediaDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `messageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `fromId` int(11) NOT NULL,
  `toId` int(11) NOT NULL,
  `messageText` text COLLATE utf8_unicode_ci NOT NULL,
  `dateSent` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enable_reply` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages_list`
--

CREATE TABLE `messages_list` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `toId` int(11) NOT NULL,
  `lastMessage` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `lastMessageDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `messageStatus` int(11) NOT NULL,
  `enable_reply` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2019_07_06_184534_create_academic_year_table', 1),
('2019_07_06_184534_create_assignments_answers_table', 1),
('2019_07_06_184534_create_assignments_table', 1),
('2019_07_06_184534_create_attendance_table', 1),
('2019_07_06_184534_create_book_library_table', 1),
('2019_07_06_184534_create_certificates_table', 1),
('2019_07_06_184534_create_class_schedule_table', 1),
('2019_07_06_184534_create_classes_table', 1),
('2019_07_06_184534_create_complaints_table', 1),
('2019_07_06_184534_create_contact_messages_table', 1),
('2019_07_06_184534_create_departments_table', 1),
('2019_07_06_184534_create_designations_table', 1),
('2019_07_06_184534_create_dormitories_table', 1),
('2019_07_06_184534_create_enquiries_table', 1),
('2019_07_06_184534_create_events_table', 1),
('2019_07_06_184534_create_exam_marks_table', 1),
('2019_07_06_184534_create_exams_list_table', 1),
('2019_07_06_184534_create_expenses_cat_table', 1),
('2019_07_06_184534_create_expenses_table', 1),
('2019_07_06_184534_create_frontend_pages_table', 1),
('2019_07_06_184534_create_grade_levels_table', 1),
('2019_07_06_184534_create_homeworks_table', 1),
('2019_07_06_184534_create_hostel_cat_table', 1),
('2019_07_06_184534_create_hostel_table', 1),
('2019_07_06_184534_create_income_cat_table', 1),
('2019_07_06_184534_create_income_table', 1),
('2019_07_06_184534_create_inv_cat_table', 1),
('2019_07_06_184534_create_inv_issue_table', 1),
('2019_07_06_184534_create_items_code_table', 1),
('2019_07_06_184534_create_items_stock_table', 1),
('2019_07_06_184534_create_languages_table', 1),
('2019_07_06_184534_create_library_issue_table', 1),
('2019_07_06_184534_create_mailsms_table', 1),
('2019_07_06_184534_create_mailsms_templates_table', 1),
('2019_07_06_184534_create_media_albums_table', 1),
('2019_07_06_184534_create_media_items_table', 1),
('2019_07_06_184534_create_messages_list_table', 1),
('2019_07_06_184534_create_messages_table', 1),
('2019_07_06_184534_create_mm_uploads_table', 1),
('2019_07_06_184534_create_mob_notifications_table', 1),
('2019_07_06_184534_create_newsboard_table', 1),
('2019_07_06_184534_create_online_exams_grades_table', 1),
('2019_07_06_184534_create_online_exams_questions_table', 1),
('2019_07_06_184534_create_online_exams_table', 1),
('2019_07_06_184534_create_payments_table', 1),
('2019_07_06_184534_create_paymentscollection_table', 1),
('2019_07_06_184534_create_payroll_history_table', 1),
('2019_07_06_184534_create_payroll_hourly_base_table', 1),
('2019_07_06_184534_create_payroll_salary_base_table', 1),
('2019_07_06_184534_create_phone_calls_table', 1),
('2019_07_06_184534_create_polls_table', 1),
('2019_07_06_184534_create_postal_table', 1),
('2019_07_06_184534_create_roles_table', 1),
('2019_07_06_184534_create_sections_table', 1),
('2019_07_06_184534_create_settings_table', 1),
('2019_07_06_184534_create_static_pages_table', 1),
('2019_07_06_184534_create_stores_table', 1),
('2019_07_06_184534_create_student_academic_years_table', 1),
('2019_07_06_184534_create_student_categories_table', 1),
('2019_07_06_184534_create_student_docs_table', 1),
('2019_07_06_184534_create_study_material_table', 1),
('2019_07_06_184534_create_subject_table', 1),
('2019_07_06_184534_create_suppliers_table', 1),
('2019_07_06_184534_create_ta_auth_tokens_table', 1),
('2019_07_06_184534_create_transport_vehicles_table', 1),
('2019_07_06_184534_create_transportation_table', 1),
('2019_07_06_184534_create_users_table', 1),
('2019_07_06_184534_create_vacation_table', 1),
('2019_07_06_184534_create_visitors_table', 1),
('2019_07_06_184534_create_wel_office_table', 1),
('2019_07_18_130433_create_notifications_mob_history_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mm_uploads`
--

CREATE TABLE `mm_uploads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_orig_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `file_uploaded_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_mime` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `file_uploaded_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mob_notifications`
--

CREATE TABLE `mob_notifications` (
  `id` int(11) NOT NULL,
  `notifTo` text COLLATE utf8_unicode_ci NOT NULL,
  `notifToIds` text COLLATE utf8_unicode_ci NOT NULL,
  `notifData` text COLLATE utf8_unicode_ci NOT NULL,
  `notifDate` int(11) NOT NULL,
  `notifSender` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsboard`
--

CREATE TABLE `newsboard` (
  `id` int(11) NOT NULL,
  `newsTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `newsText` text COLLATE utf8_unicode_ci NOT NULL,
  `newsFor` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `newsDate` int(11) NOT NULL,
  `newsImage` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fe_active` int(11) NOT NULL,
  `creationDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications_mob_history`
--

CREATE TABLE `notifications_mob_history` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payload_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exams`
--

CREATE TABLE `online_exams` (
  `id` int(11) NOT NULL,
  `examTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `examDescription` text COLLATE utf8_unicode_ci,
  `examClass` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `sectionId` text COLLATE utf8_unicode_ci NOT NULL,
  `examTeacher` int(11) NOT NULL,
  `examSubject` int(11) NOT NULL,
  `examDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `exAcYear` int(11) NOT NULL,
  `ExamEndDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `examTimeMinutes` int(11) NOT NULL DEFAULT '0',
  `examDegreeSuccess` int(11) NOT NULL,
  `ExamShowGrade` int(11) NOT NULL DEFAULT '0',
  `random_questions` int(11) NOT NULL,
  `examQuestion` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exams_grades`
--

CREATE TABLE `online_exams_grades` (
  `id` int(11) NOT NULL,
  `examId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `examQuestionsAnswers` text COLLATE utf8_unicode_ci,
  `examGrade` int(11) DEFAULT NULL,
  `examDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exams_questions`
--

CREATE TABLE `online_exams_questions` (
  `id` int(11) NOT NULL,
  `question_text` text COLLATE utf8_unicode_ci NOT NULL,
  `question_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `question_answers` text COLLATE utf8_unicode_ci NOT NULL,
  `question_mark` double NOT NULL,
  `question_image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `question_subject` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `is_shared` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `paymentTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `paymentDescription` text COLLATE utf8_unicode_ci,
  `paymentStudent` int(11) NOT NULL,
  `paymentRows` text COLLATE utf8_unicode_ci NOT NULL,
  `paymentAmount` double NOT NULL,
  `paymentDiscount` double NOT NULL,
  `paymentDiscounted` double NOT NULL,
  `paidAmount` double NOT NULL DEFAULT '0',
  `paymentStatus` int(11) NOT NULL,
  `paymentDate` int(11) NOT NULL,
  `dueDate` int(11) NOT NULL,
  `dueNotified` int(11) NOT NULL DEFAULT '0',
  `paymentUniqid` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paymentSuccessDetails` text COLLATE utf8_unicode_ci,
  `paidMethod` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paidTime` int(11) DEFAULT NULL,
  `discount_id` int(11) NOT NULL,
  `fine_amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentscollection`
--

CREATE TABLE `paymentscollection` (
  `id` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `collectionAmount` double NOT NULL,
  `collectionDate` int(11) NOT NULL,
  `collectionMethod` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `collectionNote` text COLLATE utf8_unicode_ci NOT NULL,
  `collectedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_history`
--

CREATE TABLE `payroll_history` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `pay_by_userid` int(11) NOT NULL,
  `salary_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `salary_value` decimal(10,0) NOT NULL,
  `hour_overtime` decimal(10,0) NOT NULL,
  `hour_count` decimal(10,0) NOT NULL,
  `pay_month` int(11) NOT NULL,
  `pay_year` int(11) NOT NULL,
  `pay_date` int(11) NOT NULL,
  `pay_amount` decimal(10,0) NOT NULL,
  `pay_method` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pay_comments` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_hourly_base`
--

CREATE TABLE `payroll_hourly_base` (
  `id` int(11) NOT NULL,
  `salary_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `hourly_cost` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salary_base`
--

CREATE TABLE `payroll_salary_base` (
  `id` int(11) NOT NULL,
  `salary_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `salary_basic` decimal(10,0) NOT NULL,
  `hour_overtime` decimal(10,0) NOT NULL,
  `salary_allowence` text COLLATE utf8_unicode_ci NOT NULL,
  `salary_deduction` text COLLATE utf8_unicode_ci NOT NULL,
  `net_salary` decimal(10,0) NOT NULL,
  `gross_salary` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `FullName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNo` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `call_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `call_time` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `nxt_follow` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `call_duration` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `call_details` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` int(11) NOT NULL,
  `pollTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pollOptions` text COLLATE utf8_unicode_ci NOT NULL,
  `pollTarget` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `pollStatus` int(11) NOT NULL DEFAULT '1',
  `userVoted` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postal`
--

CREATE TABLE `postal` (
  `id` int(11) NOT NULL,
  `postal_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `refno` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `postal_from` text COLLATE utf8_unicode_ci NOT NULL,
  `postal_to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `postal_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `postal_time` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `attachment` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `postal_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_description` text COLLATE utf8_unicode_ci NOT NULL,
  `def_for` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_permissions` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `sectionName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classId` int(11) NOT NULL,
  `teacherId` text COLLATE utf8_unicode_ci NOT NULL,
  `classTeacherId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `fieldName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fieldValue` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE `static_pages` (
  `id` int(11) NOT NULL,
  `pageTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pageContent` text COLLATE utf8_unicode_ci NOT NULL,
  `pageActive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `store_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `store_desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_academic_years`
--

CREATE TABLE `student_academic_years` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `academicYearId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_categories`
--

CREATE TABLE `student_categories` (
  `id` int(11) NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_docs`
--

CREATE TABLE `student_docs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `file_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_material`
--

CREATE TABLE `study_material` (
  `id` int(11) NOT NULL,
  `class_id` text COLLATE utf8_unicode_ci NOT NULL,
  `sectionId` text COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `material_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `material_description` text COLLATE utf8_unicode_ci NOT NULL,
  `material_file` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `subjectTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `teacherId` text COLLATE utf8_unicode_ci NOT NULL,
  `passGrade` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `finalGrade` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `supp_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `supp_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `supp_phone` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `supp_mail` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `supp_address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cont_per_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cont_per_phone` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cont_per_mail` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `supp_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ta_auth_tokens`
--

CREATE TABLE `ta_auth_tokens` (
  `auth_identifier` int(11) NOT NULL,
  `public_key` varchar(96) COLLATE utf8_unicode_ci NOT NULL,
  `private_key` varchar(96) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transportation`
--

CREATE TABLE `transportation` (
  `id` int(11) NOT NULL,
  `transportTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `routeDetails` text COLLATE utf8_unicode_ci,
  `vehicles_list` text COLLATE utf8_unicode_ci NOT NULL,
  `transportFare` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_vehicles`
--

CREATE TABLE `transport_vehicles` (
  `id` int(11) NOT NULL,
  `plate_number` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `vehicle_color` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `vehicle_model` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `driver_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `driver_photo` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `driver_license` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `driver_contact` text COLLATE utf8_unicode_ci NOT NULL,
  `vehicle_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fullName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `role_perm` int(11) NOT NULL,
  `department` int(11) DEFAULT NULL,
  `designation` int(11) DEFAULT NULL,
  `activated` int(11) NOT NULL DEFAULT '1',
  `studentRollId` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admission_number` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `admission_date` int(11) NOT NULL,
  `std_category` int(11) NOT NULL,
  `auth_session` text COLLATE utf8_unicode_ci NOT NULL,
  `birthday` int(11) NOT NULL DEFAULT '0',
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phoneNo` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileNo` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studentAcademicYear` int(11) NOT NULL,
  `studentClass` int(11) DEFAULT '0',
  `studentSection` int(11) NOT NULL DEFAULT '0',
  `religion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `parentProfession` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentOf` text COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `isLeaderBoard` text COLLATE utf8_unicode_ci NOT NULL,
  `restoreUniqId` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `transport` int(11) NOT NULL DEFAULT '0',
  `transport_vehicle` int(11) DEFAULT '0',
  `hostel` int(11) NOT NULL,
  `medical` text COLLATE utf8_unicode_ci NOT NULL,
  `user_position` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `defLang` int(11) NOT NULL DEFAULT '0',
  `defTheme` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `salary_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `salary_base_id` int(11) NOT NULL,
  `comVia` text COLLATE utf8_unicode_ci NOT NULL,
  `father_info` text COLLATE utf8_unicode_ci NOT NULL,
  `mother_info` text COLLATE utf8_unicode_ci NOT NULL,
  `biometric_id` int(11) NOT NULL,
  `library_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `account_active` int(11) NOT NULL DEFAULT '1',
  `customPermissionsType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customPermissions` text COLLATE utf8_unicode_ci NOT NULL,
  `firebase_token` text COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `vacDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `acYear` int(11) NOT NULL,
  `role` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `acceptedVacation` int(11) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `pass_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fullName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNo` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_pass_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `no_pers` int(11) NOT NULL DEFAULT '1',
  `usr_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `student` text COLLATE utf8_unicode_ci NOT NULL,
  `std_relation` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comp_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to_meet` text COLLATE utf8_unicode_ci NOT NULL,
  `purpose` text COLLATE utf8_unicode_ci NOT NULL,
  `check_in` text COLLATE utf8_unicode_ci NOT NULL,
  `check_out` text COLLATE utf8_unicode_ci NOT NULL,
  `docs` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `visit_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wel_office`
--

CREATE TABLE `wel_office` (
  `id` int(11) NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `av_for` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_year`
--
ALTER TABLE `academic_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments_answers`
--
ALTER TABLE `assignments_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_library`
--
ALTER TABLE `book_library`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_schedule`
--
ALTER TABLE `class_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dormitories`
--
ALTER TABLE `dormitories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams_list`
--
ALTER TABLE `exams_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses_cat`
--
ALTER TABLE `expenses_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_pages`
--
ALTER TABLE `frontend_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade_levels`
--
ALTER TABLE `grade_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homeworks`
--
ALTER TABLE `homeworks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_cat`
--
ALTER TABLE `hostel_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_cat`
--
ALTER TABLE `income_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_cat`
--
ALTER TABLE `inv_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_issue`
--
ALTER TABLE `inv_issue`
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `items_code`
--
ALTER TABLE `items_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_stock`
--
ALTER TABLE `items_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library_issue`
--
ALTER TABLE `library_issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mailsms`
--
ALTER TABLE `mailsms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mailsms_templates`
--
ALTER TABLE `mailsms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_albums`
--
ALTER TABLE `media_albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_items`
--
ALTER TABLE `media_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages_list`
--
ALTER TABLE `messages_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mm_uploads`
--
ALTER TABLE `mm_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mob_notifications`
--
ALTER TABLE `mob_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsboard`
--
ALTER TABLE `newsboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_mob_history`
--
ALTER TABLE `notifications_mob_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exams_grades`
--
ALTER TABLE `online_exams_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exams_questions`
--
ALTER TABLE `online_exams_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentscollection`
--
ALTER TABLE `paymentscollection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_history`
--
ALTER TABLE `payroll_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_hourly_base`
--
ALTER TABLE `payroll_hourly_base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_salary_base`
--
ALTER TABLE `payroll_salary_base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postal`
--
ALTER TABLE `postal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_academic_years`
--
ALTER TABLE `student_academic_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_categories`
--
ALTER TABLE `student_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_docs`
--
ALTER TABLE `student_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `study_material`
--
ALTER TABLE `study_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ta_auth_tokens`
--
ALTER TABLE `ta_auth_tokens`
  ADD PRIMARY KEY (`auth_identifier`,`public_key`,`private_key`);

--
-- Indexes for table `transportation`
--
ALTER TABLE `transportation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_vehicles`
--
ALTER TABLE `transport_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wel_office`
--
ALTER TABLE `wel_office`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_year`
--
ALTER TABLE `academic_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assignments_answers`
--
ALTER TABLE `assignments_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `book_library`
--
ALTER TABLE `book_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_schedule`
--
ALTER TABLE `class_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitories`
--
ALTER TABLE `dormitories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exams_list`
--
ALTER TABLE `exams_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expenses_cat`
--
ALTER TABLE `expenses_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `frontend_pages`
--
ALTER TABLE `frontend_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grade_levels`
--
ALTER TABLE `grade_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `homeworks`
--
ALTER TABLE `homeworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hostel_cat`
--
ALTER TABLE `hostel_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income_cat`
--
ALTER TABLE `income_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inv_cat`
--
ALTER TABLE `inv_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items_code`
--
ALTER TABLE `items_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items_stock`
--
ALTER TABLE `items_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `library_issue`
--
ALTER TABLE `library_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mailsms`
--
ALTER TABLE `mailsms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mailsms_templates`
--
ALTER TABLE `mailsms_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_albums`
--
ALTER TABLE `media_albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_items`
--
ALTER TABLE `media_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages_list`
--
ALTER TABLE `messages_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mm_uploads`
--
ALTER TABLE `mm_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mob_notifications`
--
ALTER TABLE `mob_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsboard`
--
ALTER TABLE `newsboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications_mob_history`
--
ALTER TABLE `notifications_mob_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `online_exams`
--
ALTER TABLE `online_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `online_exams_grades`
--
ALTER TABLE `online_exams_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `online_exams_questions`
--
ALTER TABLE `online_exams_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paymentscollection`
--
ALTER TABLE `paymentscollection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payroll_history`
--
ALTER TABLE `payroll_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payroll_hourly_base`
--
ALTER TABLE `payroll_hourly_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payroll_salary_base`
--
ALTER TABLE `payroll_salary_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postal`
--
ALTER TABLE `postal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_academic_years`
--
ALTER TABLE `student_academic_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_categories`
--
ALTER TABLE `student_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_docs`
--
ALTER TABLE `student_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `study_material`
--
ALTER TABLE `study_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transportation`
--
ALTER TABLE `transportation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transport_vehicles`
--
ALTER TABLE `transport_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wel_office`
--
ALTER TABLE `wel_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
