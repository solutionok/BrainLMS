-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2019 at 12:01 PM
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
  `id` int(10) UNSIGNED NOT NULL,
  `yearTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `isDefault` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `academic_year`
--

INSERT INTO `academic_year` (`id`, `yearTitle`, `isDefault`) VALUES
(1, '2019 - 2020', 1),
(2, '2020 - 2021', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `AssignTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `AssignDescription` text COLLATE utf8_unicode_ci,
  `AssignFile` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `AssignDeadLine` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classId` text COLLATE utf8_unicode_ci NOT NULL,
  `sectionId` text COLLATE utf8_unicode_ci NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments_answers`
--

CREATE TABLE `assignments_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `fileName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `userNotes` text COLLATE utf8_unicode_ci NOT NULL,
  `userTime` int(11) NOT NULL,
  `assignmentId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `in_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `out_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `attNotes` text COLLATE utf8_unicode_ci NOT NULL,
  `classId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_library`
--

CREATE TABLE `book_library` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `className` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `classAcademicYear` int(11) NOT NULL,
  `dormitoryId` int(11) DEFAULT NULL,
  `classTeacher` text COLLATE utf8_unicode_ci NOT NULL,
  `classSubjects` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `className`, `classAcademicYear`, `dormitoryId`, `classTeacher`, `classSubjects`) VALUES
(1, 'Harum. Class', 2, 3, '[\"33\",\"25\",\"30\",\"41\",\"43\",\"31\",\"40\",\"38\",\"24\",\"27\",\"36\",\"28\",\"32\",\"42\",\"34\"]', '[\"6\",\"9\",\"2\",\"3\",\"5\",\"1\"]'),
(2, 'Sequi. Class', 1, 4, '[\"35\",\"32\",\"29\",\"40\",\"38\",\"36\",\"28\",\"43\",\"30\"]', ''),
(3, 'Voluptatem. Class', 1, 3, '[\"34\",\"41\",\"29\",\"31\",\"26\",\"35\",\"30\"]', '[\"2\",\"1\",\"4\",\"8\",\"7\",\"3\"]'),
(4, 'Sint. Class', 2, 3, '[\"33\",\"26\",\"27\",\"36\",\"29\",\"32\"]', ''),
(5, 'Dolorem esse. Class', 2, 4, '[\"25\",\"36\",\"34\",\"38\",\"42\",\"33\",\"27\",\"44\",\"37\",\"26\",\"40\",\"43\",\"29\",\"28\",\"24\"]', ''),
(6, 'Provident. Class', 2, 1, '[\"41\",\"38\",\"44\",\"28\",\"36\",\"24\",\"42\",\"26\",\"32\",\"27\"]', '[\"7\"]'),
(7, 'Omnis. Class', 1, 4, '[\"37\",\"41\",\"38\",\"28\",\"35\",\"42\",\"24\",\"30\"]', '[\"7\",\"9\",\"1\"]'),
(8, 'Eveniet. Class', 1, 3, '[\"25\",\"44\",\"41\",\"37\",\"35\",\"32\",\"36\"]', ''),
(9, 'Dolorum. Class', 1, 4, '[\"27\",\"34\",\"25\",\"43\",\"30\",\"37\",\"44\",\"32\",\"33\",\"24\",\"39\",\"28\",\"31\"]', '[\"7\",\"9\"]'),
(10, 'Vel dolorum. Class', 1, 4, '[\"41\",\"40\",\"39\",\"42\",\"38\",\"43\",\"32\",\"24\",\"31\",\"36\",\"44\",\"34\",\"27\",\"35\"]', '[\"8\",\"4\",\"10\"]'),
(11, 'Alias. Class', 2, 4, '[\"32\",\"35\",\"36\",\"39\",\"44\",\"28\",\"29\",\"42\",\"33\",\"27\",\"37\",\"41\"]', '[\"7\",\"2\",\"8\"]'),
(12, 'Magni. Class', 2, 4, '[\"25\",\"24\",\"38\",\"43\",\"36\",\"40\",\"41\",\"33\",\"37\",\"42\",\"39\",\"44\",\"27\"]', '[\"9\",\"3\",\"10\"]');

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule`
--

CREATE TABLE `class_schedule` (
  `id` int(10) UNSIGNED NOT NULL,
  `dayOfWeek` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `startTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `endTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `classId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `depart_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `depart_desc` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `depart_title`, `depart_desc`) VALUES
(1, 'department1', ''),
(2, 'department2', ''),
(3, 'department3', ''),
(4, 'department4', '');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(10) UNSIGNED NOT NULL,
  `desig_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `desig_desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dormitories`
--

CREATE TABLE `dormitories` (
  `id` int(10) UNSIGNED NOT NULL,
  `dormitory` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `dormDesc` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dormitories`
--

INSERT INTO `dormitories` (`id`, `dormitory`, `dormDesc`) VALUES
(1, 'dormitory 1', ''),
(2, 'dormitory 2', ''),
(3, 'dormitory 3', ''),
(4, 'dormitory 4', '');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `eventTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `eventDescription` text COLLATE utf8_unicode_ci,
  `eventFor` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enentPlace` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eventImage` text COLLATE utf8_unicode_ci NOT NULL,
  `fe_active` int(11) NOT NULL,
  `eventDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `eventTitle`, `eventDescription`, `eventFor`, `enentPlace`, `eventImage`, `fe_active`, `eventDate`) VALUES
(1, 'Laboriosam ullam quod ut.', 'Exercitationem iusto quia provident aut possimus iste tempore culpa quidem.', 'parents', 'Accusamus.', '', 1, '1565430321'),
(2, 'Temporibus quo quaerat.', 'Soluta placeat dolor itaque ut deserunt maiores nostrum atque ut.', 'parents', 'Perferendis.', '', 1, '1563702321'),
(3, 'Id assumenda.', 'Repellat provident consequatur unde qui amet eaque molestiae sint quod tempore aspernatur illo asperiores quis.', 'teacher', 'Est.', '', 0, '1565430321'),
(4, 'Animi fuga molestiae debitis.', 'Similique voluptas autem ad repellat quis esse vero nesciunt quod architecto.', 'teacher', 'Eaque.', '', 1, '1564220721'),
(5, 'Ducimus placeat molestias ipsam aut sunt.', 'Sit sapiente omnis et earum rerum.', 'teacher', 'Tempore.', '', 0, '1564393521'),
(6, 'Enim quisquam labore.', 'Voluptate cumque quidem dolore unde sit.', 'all', 'Deleniti.', '', 0, '1564134321'),
(7, 'Consequuntur possimus vel.', 'Doloribus deserunt ipsum et fugiat molestiae rerum neque aperiam sequi.', 'parents', 'Quia iusto.', '', 1, '1565516721'),
(8, 'Et omnis.', 'Illum laborum quis dolor.', 'teacher', 'Nihil.', '', 0, '1565430321'),
(9, 'Facilis qui est rerum nisi facilis.', 'Doloremque et neque est quidem esse.', 'teacher', 'Porro aut.', '', 0, '1565430321'),
(10, 'Qui occaecati id.', 'Velit repellendus nostrum et.', 'teacher', 'Esse.', '', 0, '1565603121');

-- --------------------------------------------------------

--
-- Table structure for table `exams_list`
--

CREATE TABLE `exams_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `examTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `examDescription` text COLLATE utf8_unicode_ci,
  `examDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `examEndDate` int(11) NOT NULL,
  `examAcYear` int(11) NOT NULL,
  `examClasses` text COLLATE utf8_unicode_ci NOT NULL,
  `examMarksheetColumns` text COLLATE utf8_unicode_ci NOT NULL,
  `examSchedule` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` int(10) UNSIGNED NOT NULL,
  `examMark` text COLLATE utf8_unicode_ci NOT NULL,
  `totalMarks` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `markComments` text COLLATE utf8_unicode_ci,
  `examId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `expenseTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `expenseDate` int(11) NOT NULL,
  `expenseAmount` int(11) NOT NULL,
  `expenseImage` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `expenseNotes` text COLLATE utf8_unicode_ci,
  `expenseCategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_cat`
--

CREATE TABLE `expenses_cat` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_pages`
--

CREATE TABLE `frontend_pages` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `homeworkTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `homeworkDescription` text COLLATE utf8_unicode_ci,
  `homeworkFile` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `homeworkDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `homeworkSubmissionDate` int(11) NOT NULL,
  `homeworkEvaluationDate` int(11) NOT NULL,
  `classId` text COLLATE utf8_unicode_ci NOT NULL,
  `sectionId` text COLLATE utf8_unicode_ci NOT NULL,
  `studentsCompleted` text COLLATE utf8_unicode_ci NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `homeworks`
--

INSERT INTO `homeworks` (`id`, `homeworkTitle`, `homeworkDescription`, `homeworkFile`, `homeworkDate`, `homeworkSubmissionDate`, `homeworkEvaluationDate`, `classId`, `sectionId`, `studentsCompleted`, `subjectId`, `teacherId`) VALUES
(1, 'Nobis voluptate.', '', '', '1564911930', 1563615930, 0, '[\"2\",\"12\"]', '[\"53\",\"26\",\"17\"]', '', 9, 32),
(2, 'Ratione.', '', '', '1564911930', 1564998330, 0, '[\"6\"]', '[\"17\",\"24\",\"7\"]', '', 1, 33),
(3, 'Et placeat.', '', '', '1564911931', 1564652731, 0, '[\"1\",\"7\"]', '[\"60\",\"44\"]', '', 6, 43),
(4, 'Non.', '', '', '1564911931', 1565516731, 0, '[\"12\"]', '[\"12\",\"32\",\"3\"]', '', 2, 25),
(5, 'Cupiditate voluptas eaque.', '', '', '1564911931', 1565862331, 0, '[\"10\",\"8\"]', '[\"15\",\"39\",\"37\"]', '', 3, 25),
(6, 'Nam unde.', '', '', '1564911931', 1566035131, 0, '[\"9\",\"12\",\"4\"]', '[\"48\",\"34\",\"40\"]', '', 6, 36),
(7, 'Enim.', '', '', '1564911931', 1563615931, 0, '[\"3\",\"11\",\"9\"]', '[\"3\",\"37\",\"20\"]', '', 6, 44),
(8, 'Culpa molestias.', '', '', '1564911931', 1564479931, 0, '[\"12\"]', '[\"51\"]', '', 3, 41),
(9, 'Quibusdam eius.', '', '', '1564911931', 1563875131, 0, '[\"5\",\"9\",\"7\"]', '[\"38\",\"21\",\"44\"]', '', 7, 30),
(10, 'Aut accusamus.', '', '', '1564911931', 1564393531, 0, '[\"1\"]', '[\"30\"]', '', 6, 40),
(11, 'Et.', '', '', '1564911932', 1564047932, 0, '[\"2\",\"9\",\"8\"]', '[\"44\"]', '', 2, 31),
(12, 'Corrupti similique sit.', '', '', '1564911932', 1564479932, 0, '[\"11\",\"5\",\"4\"]', '[\"15\",\"21\"]', '', 9, 44),
(13, 'Ratione occaecati esse.', '', '', '1564911932', 1566035132, 0, '[\"7\",\"3\",\"6\"]', '[\"9\"]', '', 3, 29),
(14, 'Porro.', '', '', '1564911932', 1565171132, 0, '[\"1\"]', '[\"31\",\"21\"]', '', 5, 42),
(15, 'Aut velit.', '', '', '1564911932', 1565689532, 0, '[\"6\"]', '[\"2\",\"1\",\"22\"]', '', 3, 35);

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `catTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `catFees` int(11) NOT NULL,
  `catNotes` text COLLATE utf8_unicode_ci NOT NULL,
  `catTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_cat`
--

CREATE TABLE `inv_cat` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_issue`
--

CREATE TABLE `inv_issue` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `languageTitle` text COLLATE utf8_unicode_ci NOT NULL,
  `languageUniversal` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `languagePhrases` text COLLATE utf8_unicode_ci NOT NULL,
  `isRTL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `languageTitle`, `languageUniversal`, `languagePhrases`, `isRTL`) VALUES
(1, 'English', '0', '{\"TrackBus\":\"Track Bus\",\"dashboard\":\"Dashboard\",\"usercode\":\"User Code\",\"classes\":\"Classes\",\"students\":\"Students\",\"teachers\":\"Teachers\",\"newmessages\":\"New Messages\",\"student\":\"Student\",\"teacher\":\"Teacher\",\"leaderboard\":\"Leader Board\",\"NewsEvents\":\"News & Events\",\"quicklinks\":\"Quick links\",\"AccountSettings\":\"Account Settings\",\"ChgProfileData\":\"Change profile data\",\"FullName\":\"Full name\",\"Gender\":\"Gender\",\"Birthday\":\"Birthday\",\"mobileNo\":\"Mobile No\",\"editProfile\":\"Edit profile\",\"reemail\":\"Retype Email address\",\"oldPassword\":\"Old password\",\"editPassword\":\"Edit password\",\"newPassword\":\"New password\",\"editMailAddress\":\"Edit e-mail address\",\"chgEmailAddress\":\"Change e-mail address\",\"Photo\":\"Photo\",\"Address\":\"Address\",\"Male\":\"Male\",\"Female\":\"Female\",\"phoneNo\":\"Phone No\",\"defLang\":\"Default language\",\"email\":\"Email address\",\"chgPassword\":\"Change password\",\"renewPassword\":\"Retype New password\",\"adminTasks\":\"Administrative tasks\",\"ClassSchedule\":\"TimeTable\",\"Assignments\":\"Assignments\",\"booksLibrary\":\"Books library\",\"Attendance\":\"Attendance\",\"Onlineexams\":\"Online exams\",\"media\":\"Media\",\"Payments\":\"Payments\",\"Return\":\"Return\",\"Transport\":\"Transport\",\"Polls\":\"Polls\",\"votes\":\"View Votes\",\"Calendar\":\"Calendar\",\"Search\":\"Search\",\"username\":\"Username\",\"name\":\"Name\",\"ID\":\"ID\",\"Operations\":\"Operations\",\"cancelAdd\":\"Cancel add\",\"Calender\":\"Calendar\",\"Status\":\"Status\",\"toggleDropdown\":\"Toggle Dropdown\",\"from\":\"From\",\"Export\":\"Export\",\"ExportCSV\":\"Export to CSV\",\"ImportCSV\":\"Import from CSV\",\"details\":\"Details\",\"Active\":\"Active\",\"specifyFileToImport\":\"Please specify file to upload\",\"Inactive\":\"Inactive\",\"saveSettings\":\"Save Settings\",\"available\":\"Available\",\"Import\":\"Import\",\"ExportExcel\":\"Export to Excel\",\"to\":\"To\",\"for\":\"For\",\"all\":\"All\",\"Calenderlist\":\"Calendar list\",\"cancelEdit\":\"Cancel Edit\",\"Edit\":\"Edit\",\"Remove\":\"Remove\",\"Download\":\"Download\",\"Date\":\"Date\",\"Print\":\"Print\",\"Comments\":\"Comments\",\"Extras\":\"Extras\",\"ExportPDF\":\"Export to PDF\",\"ImportExcel\":\"Import from Excel\",\"unavailable\":\"Unavailable\",\"Description\":\"Description\",\"dataImported\":\"Data imported successfully\",\"registerAcc\":\"Registeration\",\"chkMailRestore\":\"Please check your e-mail for restore link\",\"expRestoreId\":\"Expired resore id ( > 24h ), please make new password resore request\",\"mustTypePwd\":\"You must type password\",\"usernameUsed\":\"Username already used, use another one\",\"mailUsed\":\"E-mail address already used, check it or restore password\",\"mustTypeFullName\":\"You must type full name\",\"invRstoreId\":\"Invalid URL or restore id, please make new password resore request\",\"chkInputFields\":\"Please check the input fields\",\"chkUserPass\":\"Please check your username & password\",\"chkUserMail\":\"Please check your username\",\"pwdChangedSuccess\":\"Password changed successfully, press login to continue\",\"mustSelAccType\":\"You must select account type\",\"mustSelUsername\":\"You must type username\",\"invEmailAdd\":\"Invalid e-mail address\",\"notRepStCode\":\"is not represent student code\",\"Address2\":\"Address 2\",\"oldPwdDontMatch\":\"Old password don\'t match stored one\",\"mailAlreadyUsed\":\"E-mail address already used, check it or restore password\",\"allowLanguage\":\"Allow users change languages\",\"sysMail\":\"System E-mail\",\"setZero\":\"Set to 0 for none\",\"subBased\":\"Subject Based\",\"None\":\"None\",\"sendStudentsAbsendVia\":\"Send student\'s absence via\",\"schoolTerms\":\"Privacy Policy\",\"generalSettings\":\"General Settings\",\"allowed\":\"Allowed\",\"paymentMail\":\"Paypal payment E-mail\",\"footer\":\"Footer Copyrights\",\"classBased\":\"Class only\",\"sendExamDet\":\"Send exam details to\",\"activatedModules\":\"Activated Modules\",\"siteTitle\":\"Site title\",\"notAllowed\":\"Not allowed\",\"payTax\":\"Payment Tax\",\"attendanceModel\":\"Attendance model\",\"examNotif\":\"Exam details notifications\",\"studentsParents\":\"Students & Parents\",\"editSettings\":\"Edit settings\",\"Administrators\":\"Administrators\",\"listAdministrators\":\"List administrators\",\"password\":\"Password\",\"adminUpdated\":\"Admin updated successfully\",\"usernameAlreadyUsed\":\"Username already used, use another one\",\"adminFullName\":\"Admin full name\",\"addAdministrator\":\"Add admininstrator\",\"editAdministrator\":\"Edit admininstrator\",\"emailAlreadyUsed\":\"E-mail address already used, check it or restore password\",\"AssignmentTitle\":\"Assignment title\",\"noAssignments\":\"No assignments\",\"assignmentCreated\":\"Assignment created successfully\",\"AddAssignments\":\"Add assignment\",\"AssignmentDescription\":\"Assignment Description\",\"AssignmentFile\":\"Assignment File\",\"assignmentModified\":\"Assignment modified successfully\",\"listAssignments\":\"List Assignments\",\"AssignmentDeadline\":\"Assignment Deadline\",\"editAssignment\":\"Edit Assignment\",\"selectAttendance\":\"Select attendance info to add\",\"Present\":\"Present\",\"LateExecuse\":\"Late with excuse\",\"attendanceStats\":\"Attendance Statistics\",\"attendanceFilters\":\"Search for attendance ( Select filters )\",\"absentReport\":\"Student absence report\",\"controlAttendance\":\"Control attendance\",\"Absent\":\"Absent\",\"earlyDismissal\":\"Early Dismissal\",\"attendancePerDay\":\"Attendance per day\",\"attendanceSearch\":\"Search attendance\",\"studentName\":\"Student Name\",\"Late\":\"Late\",\"saveAttendance\":\"Save attendance\",\"attendanceToday\":\"Attendance today\",\"attendanceSaved\":\"Attecndance saved successfully\",\"class\":\"Class\",\"addClass\":\"Add class\",\"classTeacher\":\"Class teacher\",\"className\":\"Class name\",\"listClasses\":\"List classes\",\"classDorm\":\"Class dormitory\",\"classSch\":\"Classes Schedule\",\"editClassSch\":\"Edit Class Schedule\",\"endTime\":\"End Time\",\"Sunday\":\"Sunday\",\"Wednesday\":\"Wednesday\",\"Saturday\":\"Saturday\",\"NoClasses\":\"No classes\",\"classEditSch\":\"Select class to edit schedule\",\"Day\":\"Day\",\"addSch\":\"Add Schedule\",\"Monday\":\"Monday\",\"Thurusday\":\"Thursday\",\"classCreated\":\"Class created successfully\",\"editClass\":\"Edit Class\",\"ReadSchedule\":\"Read schedule\",\"startTime\":\"Start Time\",\"editSch\":\"Edit Schedule\",\"Tuesday\":\"Tuesday\",\"Friday\":\"Friday\",\"classUpdated\":\"Class updated successfully\",\"Dormitories\":\"Dormitories\",\"DormName\":\"Dormitory Name\",\"addDorm\":\"Add Dormitory\",\"dormUpdated\":\"Dormitory updated successfully\",\"addDormitories\":\"Add dormitory\",\"DormDesc\":\"Dormitory Description\",\"editDorm\":\"Edit Dormitory\",\"listDormitories\":\"List dormitories\",\"noDorm\":\"No dormitories\",\"dormCreated\":\"Dormitory created successfully\",\"listNews\":\"List news\",\"newsContent\":\"News content\",\"listEvents\":\"List events\",\"noEvents\":\"No events\",\"eventPlace\":\"Event Place\",\"eventModified\":\"Event modified successfully\",\"newsCreated\":\"News created successfully\",\"editEvent\":\"Edit event\",\"addEvent\":\"Add event\",\"eventNamePlace\":\"Event Name \\/ Place\",\"noNews\":\"No news\",\"addNews\":\"Add News\",\"newsboard\":\"News Board\",\"events\":\"Events\",\"newsTitle\":\"News title\",\"editNews\":\"Edit News\",\"eventDescription\":\"Event Description\",\"eventTitle\":\"Event Title\",\"eventCreated\":\"Event created successfully\",\"newsModified\":\"News modified successfully\",\"examsList\":\"Exams List\",\"examName\":\"Exam Name\",\"mark\":\"Mark\",\"selClassSubExam\":\"Select class & subject for exam\",\"attendanceMakrs\":\"Attendance Marks\",\"gradeLevels\":\"Grade levels\",\"gradeName\":\"Grade Name\",\"noGrades\":\"No grades\",\"editGrade\":\"Edit grade\",\"onlineExams\":\"Online Exams\",\"examDeadline\":\"Exam Deadline\",\"gradeCreated\":\"Grade created successfully\",\"gradeFrom\":\"Grade From\",\"gradeDesc\":\"Grade Description\",\"addLevel\":\"Add Grade level\",\"examMarks\":\"Exam Marks\",\"addMarks\":\"Add marks\",\"sendExamMarks\":\"Send marks notifications\",\"examDesc\":\"Exam Description\",\"addExam\":\"Add exam\",\"listExams\":\"List exams\",\"showMarks\":\"Show marks\",\"noExams\":\"No exams\",\"controlMarksExam\":\"Control marks for Exam\",\"addUpdateMarks\":\"Add\\/Update Marks\",\"listMarks\":\"List grades\",\"gradePoint\":\"Grade Point\",\"gradeTo\":\"Grade To\",\"gradeUpdated\":\"Grade updated successfully\",\"takeExam\":\"Take exam\",\"showExamGradesAfter\":\"Show grade after finish exams\",\"Answers\":\"Answers\",\"infoBox\":\"Info Box\",\"Grade\":\"Grade\",\"examModified\":\"Exam modified successfully\",\"examNotSent\":\"Notifications sent successfully\",\"examCreated\":\"Exam created successfully\",\"examDetailsNot\":\"Exam details notifications\",\"AveragePoints\":\"Average Points\",\"editExam\":\"Edit Exam\",\"trueAns\":\"True Answer\",\"Questions\":\"Questions\",\"Question\":\"Question\",\"addQuestion\":\"Add question\",\"submitAnswers\":\"Submit answers\",\"adjustExamNot\":\"Please adjust exam notifications first from General settings\",\"Languages\":\"Languages\",\"noLanguage\":\"No languages\",\"languagePhrases\":\"Language phrases\",\"langModified\":\"Language updated successfully\",\"editLanguage\":\"Edit Language\",\"addLanguage\":\"Add language\",\"listLanguage\":\"List languages\",\"languageName\":\"Language Name\",\"langCreated\":\"Language created successfully\",\"Library\":\"Library\",\"bookTitle\":\"Book title\",\"noBooks\":\"No books\",\"bookType\":\"Book Type\",\"bookPrice\":\"Book Price\",\"editBook\":\"Edit book\",\"bookAdded\":\"Book added successfully\",\"uploadBook\":\"Upload book\",\"traditionalBook\":\"Traditional Book\",\"addBook\":\"Add book\",\"bookAuthor\":\"Book Author\",\"listBooks\":\"List Books\",\"bookPriceState\":\"Book Price \\/ State\",\"bookDescription\":\"Book Description\",\"electronicBook\":\"Electronic Book\",\"State\":\"State\",\"bookModified\":\"Book modified successfully\",\"mailsms\":\"Mail \\/ SMS\",\"mailsmsSettings\":\"Mail\\/SMS Settings\",\"sendAs\":\"Send as\",\"mailSMSSend\":\"Send Mail \\/ SMS\",\"Sender\":\"Sender\",\"smsProvider\":\"SMS Provider\",\"mailsmsTemplates\":\"Mail \\/ SMS Templates\",\"noTemplates\":\"No templates\",\"mailTemplate\":\"Mail template\",\"smsTemplate\":\"SMS template\",\"editTemplate\":\"Edit template\",\"listTemplates\":\"List templates\",\"mailSettings\":\"Mail Settings\",\"noMessages\":\"No messages\",\"listMessages\":\"List Messages\",\"messageTitle\":\"Message Title\",\"selUsers\":\"Select users\",\"sms\":\"SMS\",\"listSentMessages\":\"List of sent messages\",\"typeUsers\":\"Type of users\",\"messageContent\":\"Message Content\",\"typeDate\":\"Type \\/ Date\",\"smsSettings\":\"SMS Settings\",\"mailDeliverType\":\"Mail Delivery Type\",\"templateTitle\":\"Template title\",\"templateVars\":\"Template variables\",\"templateUpdated\":\"Template updated successfully\",\"mediaCenter\":\"Media Center\",\"addAlbum\":\"Add album\",\"noMediaInAlbum\":\"No media exist in this album\",\"albumImage\":\"Album image\",\"mediaTitle\":\"Media title\",\"editMedia\":\"Edit media\",\"mediaCreated\":\"Media created successfully\",\"mediaModified\":\"Media modified successfully\",\"albumCreated\":\"Album created successfully\",\"mediaDesc\":\"Media description\",\"editAlbum\":\"Edit album\",\"albumTitle\":\"Album title\",\"albums\":\"Albums\",\"goUp\":\"Go to up\",\"uploadMedia\":\"Upload media\",\"albumDesc\":\"Album description\",\"addMedia\":\"Add media\",\"mediaImage\":\"Media image\",\"albumModified\":\"Album modified successfully\",\"Messages\":\"Messages\",\"composeMessage\":\"Compose Message\",\"typeReply\":\"Type reply ( press enter to submit ) ...\",\"message\":\"Message\",\"messageNotExist\":\"The message you try to reach not exist\",\"userisntExist\":\"User isn\'t exist\",\"sendMessage\":\"Send Message\",\"markRead\":\"Mark as read\",\"markUnread\":\"Mark as unread\",\"loadOldMessages\":\"Load old messages\",\"sendMessageTo\":\"Send message to (username)\",\"readMessage\":\"Read Message\",\"paymentTitleDate\":\"Payment Title \\/ Date\",\"paid\":\"PAID\",\"noPayments\":\"No payments\",\"editPayment\":\"Edit payment\",\"AmountDue\":\"Amount Due\",\"paymentCreated\":\"Payments created successfully\",\"noPaymentDetails\":\"No Payment Details exist\",\"paymentModified\":\"Payments modified successfully\",\"Total\":\"Total\",\"Product\":\"Particulars\",\"paymentTitle\":\"Payment Title\",\"unpaid\":\"UNPAID\",\"paymentDesc\":\"Payment Description\",\"addPayment\":\"Add payment\",\"listPayments\":\"List payments\",\"Amount\":\"Amount\",\"viewInvoice\":\"View invoice\",\"paymentSelectMultiple\":\"Selecting multiple students will generate seperate invoice for each one\",\"Subtotal\":\"Subtotal\",\"listPaymentDetail\":\"List payment details\",\"paymentDetails\":\"Payment details\",\"pollTitle\":\"Poll title\",\"noPolls\":\"No Polls\",\"editPoll\":\"Edit poll\",\"pollCreated\":\"Poll created successfully\",\"pollUpdated\":\"Poll updated successfully\",\"activatePoll\":\"Activate Poll\",\"votePoll\":\"Vote poll\",\"pollOptions\":\"Poll Options\",\"pollTarget\":\"Poll target\",\"addPoll\":\"Add poll\",\"listPolls\":\"List polls\",\"pollStatus\":\"Poll status\",\"newOption\":\"New Option\",\"alreadyvoted\":\"You already voted before\",\"pollActivated\":\"Poll activated successfully\",\"staticPages\":\"Static pages\",\"listPages\":\"List pages\",\"editPage\":\"Edit page\",\"pageModified\":\"Page modified successfully\",\"controlPages\":\"Control Pages\",\"pageTitle\":\"Page title\",\"activeInactivePage\":\"Active \\/ Inactive page\",\"pageChanged\":\"Page changed successfully\",\"addPage\":\"Add page\",\"pageContent\":\"Page content\",\"pageCreated\":\"Page created successfully\",\"Subjects\":\"Subjects\",\"subjectName\":\"Subject name\",\"subjectCreated\":\"Subject created successfully\",\"Subject\":\"Subject\",\"noSubjects\":\"No subjects\",\"subjectEdited\":\"Subject edited successfully\",\"addSubject\":\"Add subject\",\"editSubject\":\"Edit Subject\",\"Transportation\":\"Stoppage\",\"transportTitle\":\"Transport title\",\"Fare\":\"Fare\",\"editTransport\":\"Edit Transport\",\"transportCreated\":\"Stoppage created successfully\",\"addTransport\":\"Add transport\",\"transportDesc\":\"Transport Description\",\"listSubs\":\"List subscribers\",\"Contact\":\"Contact\",\"transportUpdated\":\"Stoppage updated successfully\",\"listTransport\":\"List Stoppage\",\"driverContact\":\"Driver Contact\",\"noTransportation\":\"No Stoppage\",\"noMatches\":\"No matches\",\"parents\":\"Parents\",\"role\":\"Role\",\"listTeachers\":\"List teachers\",\"EditTeacher\":\"Edit Teacher\",\"rollid\":\"Roll id\",\"listParents\":\"List parents\",\"studentDetails\":\"Student Details\",\"parent\":\"Parent\",\"addTeacher\":\"Add teacher\",\"noTeachers\":\"No teachers\",\"fileToImport\":\"File to import\",\"Marksheet\":\"Marksheet\",\"editStudent\":\"Edit student\",\"noParents\":\"No parents\",\"Relation\":\"Relation\",\"editParent\":\"Edit Parent\",\"Profession\":\"Profession\",\"AddParent\":\"Add parent\",\"noStudents\":\"No students\",\"addStudent\":\"Add student\",\"Approve\":\"Approve\",\"waitingApproval\":\"Waiting approval\",\"csvParentInvalid\":\"This file not represent CSV parents file\",\"Profile\":\"Profile\",\"teacherInfo\":\"Teacher Information\",\"studentHaveNoMarks\":\"Student has no marks till now\",\"teacherCreated\":\"Teacher created successfully\",\"teacherUpdated\":\"Teacher updated successfully\",\"studentModified\":\"Student modified successfully\",\"csvStudentInvalid\":\"This file not represent CSV student file\",\"parentInfo\":\"Parent Information\",\"parentCreated\":\"Parent created successfully\",\"csvTeacherInvalid\":\"This file not represent CSV teacher file\",\"studentCreatedSuccess\":\"Student created successfully\",\"studentInfo\":\"Student Information\",\"parentModified\":\"Parent modified successfully\",\"listStudents\":\"List students\",\"latestVersion\":\"Latest Version\",\"logout\":\"Logout\",\"registerNewAccount\":\"Register a new membership\",\"restorePwd\":\"Restore Password\",\"userNameOrEmail\":\"Username\",\"rememberMe\":\"Remember me\",\"youfindStId\":\"You\'ll find Student code in your student dashboard main page, it look like:\",\"parntStudentIdSep\":\"Parent\'s Students ids - seperate with ,\",\"thankReg\":\"Thank you for register, please contact school for activating your account with id\",\"signIn\":\"Sign in\",\"resetPwdNow\":\"Reset password now\",\"printPage\":\"Print this page\",\"loginToAccount\":\"Login to your account\",\"theme\":\"Theme\",\"blue\":\"Blue\",\"black\":\"Black\",\"idNumber\":\"ID Number\",\"position\":\"ltr\",\"direction\":\"Direction\",\"rtl\":\"Right to left\",\"ltr\":\"Left to right\",\"Promotion\":\"Promotion\",\"studentsPromotedClass\":\"Students will promoted to class\",\"promoteStudents\":\"Promote students\",\"studentsToBPronoted\":\"Students to be promoted\",\"chgAcademicYears\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 \\u0627\\u0644\\u0633\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0631\\u0627\\u0633\\u064a\\u0629\",\"chgYear\":\"Change Year\",\"teacherLeaderboard\":\"Teacher\'s leaderboard\",\"searchUsers\":\"Search users\",\"studentLeaderboard\":\"Student\'s leaderboard\",\"thanks\":\"Thanks\",\"sureRemove\":\"Sure remove this item?\",\"mailReMailDontMatch\":\"E-mail & Re-Email don\'t match\",\"passRepassDontMatch\":\"Password & Re-Password don\'t match\",\"profileUpdated\":\"Profile updated successfully\",\"blueLight\":\"blue-light\",\"green\":\"green\",\"purpleLight\":\"purple-light\",\"mailSmsSettings\":\"Mail \\/ SMS Settings\",\"schoolTitle\":\"School Title\",\"yellow\":\"yellow\",\"greenLight\":\"green-light\",\"red\":\"red\",\"globalSettings\":\"Global Settings\",\"vacationSettings\":\"Vacation Settings\",\"customText\":\"Custom Text\",\"LogoImage\":\"Image ( Upload logo to path : assets\\/img\\/logo.png - Best Size : 200 x 40 px )\",\"Logo\":\"Logo\",\"paymentsSettings\":\"Payments Settings\",\"redLight\":\"red-light\",\"purple\":\"purple\",\"yellowLight\":\"yellow-light\",\"exclude\":\"Don\'t include\",\"Include\":\"Include\",\"includeAttendace\":\"Include attendance in marksheet grades\",\"allowChangeTheme\":\"Allow users to change theme\",\"currencyCode\":\"Currency Code ( 3 Phrases like USD )\",\"paypalSupported\":\"Supported codes for paypal are :\",\"numberOfDaysStVacation\":\"Number of days for student vacation per Academic Year\",\"studentVacationDays\":\"Students\'s vacation days \\/ Academic Year\",\"currencySymbol\":\"Currency Symbol (like $)\",\"teacherVacationDays\":\"Teacher\'s vacation days \\/ Academic Year\",\"numberOfDaysTeacherVacation\":\"Number of days for teacher vacation per Academic Year\",\"weeksDaysOff\":\"Week Days off\",\"nationalVacDays\":\"National Vacation days\",\"settSaved\":\"Settings saved successfully\",\"newDateVacation\":\"Select the new date for vacation\",\"delAdministrator\":\"Delete admininstrator\",\"adminDeletedSucc\":\"Administrator deleted successfully\",\"adminNotExist\":\"Administrator isn\'t exist\",\"viewAnswers\":\"View answers\",\"answerFile\":\"Answer File\",\"delAssignment\":\"Delete assignment\",\"applyAssAnswer\":\"Apply assignment answer\",\"assUploadedSucc\":\"Answer uploaded successfully\",\"assNoFilesUploaded\":\"No files uploaded !\",\"assAlreadySub\":\"You already applied answer to this assignment before\",\"assignemntNotExist\":\"Assignment isn\'t exist\",\"timeApplied\":\"Time applied\",\"userNotes\":\"User Notes\",\"uploadAnswer\":\"Upload answer to assignment\",\"assignemntDel\":\"Assignment deleted successfully\",\"assDeadTime\":\"Assignment deadtime reached, you cannot submit\",\"staffAttendance\":\"Staff Attendance\",\"associatedSubjects\":\"Associated subjects\",\"classNotExist\":\"Class isn\'t exist\",\"delSch\":\"Delete schedule\",\"schDeleted\":\"Schedule deleted successfully\",\"schModSucc\":\"Schedule Modified successfully\",\"delClass\":\"Delete class\",\"classDeleted\":\"Class deleted successfully\",\"schCreaSucc\":\"Schedule Created successfully\",\"schNotExist\":\"Schedule isn\'t exist\",\"dormNotExist\":\"Dormitory isn\'t exist\",\"delEvent\":\"Delete event\",\"delNews\":\"Delete news\",\"newsDeleted\":\"News deleted successfully\",\"eventDeleted\":\"Event deleted successfully\",\"eventNotEist\":\"Event isn\'t exist\",\"newsNotEist\":\"News isn\'t exist\",\"questionType\":\"Question Type\",\"oneOption\":\"Select one option\",\"sureMarks\":\"Are you sure that all subject\'s marks added successfully?\",\"textValue\":\"Enter text value\",\"multipleOption\":\"Select Multiple options\",\"examTitleUndefined\":\"Exam Title undefined\",\"examTimedOut\":\"Sorry, timeout. Exam Finished\",\"examYourGrade\":\"Your grade is :\",\"exDeleted\":\"Exam deleted successfully\",\"gradeDeleted\":\"Grade deleted successfully\",\"delGradeLevel\":\"Delete grade level\",\"gradeNotExist\":\"Grade isn\'t exist\",\"exNotExist\":\"Exam isn\'t exist\",\"examSubmitionSaved\":\"Your submittion saved, thank you.\",\"delExam\":\"Delete exam\",\"exAlreadyTook\":\"You already took this exam before\",\"delLanguage\":\"Delete language\",\"languageDel\":\"Language deleted successfully\",\"languageNotExist\":\"Language isn\'t exist\",\"delLibrary\":\"Delete library item\",\"itemNotExist\":\"Item isn\'t exist\",\"itemdel\":\"Item deleted successfully\",\"specificUsers\":\"Specific users\",\"mailSentSuccessfully\":\"Message sent successfully\",\"mediaType\":\"Media Type\",\"removeAlbum\":\"Sure remove this album, all enclosed images will be deleted?\",\"albumNotExist\":\"Album isn\'t exist\",\"mediaNotExist\":\"Media isn\'t exist\",\"mediaDel\":\"Media deleted successfully\",\"albumDel\":\"Album deleted successfully\",\"url\":\"URL\",\"image\":\"Image\",\"delAlbum\":\"Delete album\",\"delMedia\":\"Delete media\",\"typeNameUserMail\":\"Type Name \\/ username\",\"select\":\"Select\",\"messIsUnread\":\"Messages changed to unread successfully\",\"messIsRead\":\"Messages changed to read successfully\",\"messDel\":\"Messages deleted successfully\",\"delMess\":\"Delete messages\",\"chgMessage\":\"Change messages\",\"selectStudents\":\"Select students\",\"delPayment\":\"Delete payment\",\"paymentNotExist\":\"Payment isn\'t exist\",\"paymentDel\":\"Payment deleted successfully\",\"voteMustSelect\":\"You must select item to vote.\",\"pollDel\":\"Poll deleted successfully\",\"delPoll\":\"Delete poll\",\"totalVotes\":\"Total votes\",\"voteOptionTitle\":\"Please enter option title\",\"pollNotExist\":\"Poll isn\'t exist\",\"delPage\":\"Delete page\",\"pageDel\":\"Page deleted successfully\",\"delNotExist\":\"Page isn\'t exist\",\"subjectNotExist\":\"Subject isn\'t exist\",\"delSubject\":\"Delete Subject\",\"subjectDel\":\"Subject deleted successfully\",\"transDel\":\"Stoppage deleted successfully\",\"transNotExist\":\"Stoppage isn\'t exist\",\"delTrans\":\"Delete stoppage\",\"linkStudentParent\":\"Link student to parent\",\"leaderBoardMessage\":\"Please enter leaderboard message\",\"delParent\":\"Delete parent\",\"approveStudent\":\"Approve student\",\"delStudent\":\"Delete student\",\"stdLeaderBoard\":\"Student leaderboard\",\"stdNotLeader\":\"Student isn\'t leaderboard\",\"delTeacher\":\"Delete teacher\",\"teacLeaderBoard\":\"Teacher leaderboard\",\"teachNotLeader\":\"Teacher isn\'t leaderboard\",\"teacLeaderDel\":\"Teacher\'s leaderboard deleted successfully\",\"teacherNotExist\":\"Teacher isn\'t exist\",\"stdLeaderRem\":\"Student\'s leaderboard removed successfully\",\"stdNotExist\":\"Student isn\'t exist\",\"parentNotExist\":\"Parent isn\'t exist\",\"teacherApproved\":\"Teacher approved successfully\",\"relationShipEnter\":\"Please enter your relation to student\",\"minCharLength3\":\"Min character length is 3\",\"approveTeacher\":\"Approve teacher\",\"parentDel\":\"Parent deleted successfully\",\"stdApproved\":\"Student approved successfully\",\"stdDeleted\":\"Student deleted successfully\",\"stdNowLeaderBoard\":\"Student is now leaderboard\",\"teacherDel\":\"Teacher deleted successfully\",\"teacIsLeader\":\"Teacher is now leaderboard\",\"newAcYear\":\"New Academic Year\",\"newClass\":\"New Class\",\"fromAcYear\":\"From Academic Year\",\"Vacation\":\"Vacation\",\"confirmVacation\":\"Confirm vacation\",\"acceptedVacation\":\"Accepted Vacation\",\"delVacation\":\"Delete Vacation\",\"vacDel\":\"Vacation deleted successfully\",\"rejectedVacation\":\"Rejected Vacation\",\"notes\":\"Notes\",\"selectVacationDates\":\"Select vacation dates\",\"getVacation\":\"Get Vacation\",\"publicHoliday\":\"Public Holiday\",\"vacSubmitted\":\"Vacation request submitted successfully\",\"vacNotExist\":\"Vacation isn\'t exist\",\"studyMaterial\":\"Study Material\",\"materialTitle\":\"Material Title\",\"materialFile\":\"Material file\",\"materialDel\":\"Material deleted successfully\",\"materialEdited\":\"Material modified successfully\",\"materialNotExist\":\"Material isn\'t exist\",\"editMaterial\":\"Edit Material\",\"materialDesc\":\"Material Description\",\"addMaterial\":\"Add Material\",\"listStudyMaterial\":\"List Study Material\",\"noMaterialData\":\"No Material data\",\"delMaterial\":\"Delete Material\",\"materialAdded\":\"Material added successfully\",\"Reports\":\"Reports\",\"paymentsReports\":\"Payments Reports\",\"user\":\"User\",\"totalUsers\":\"Total Users\",\"academicyears\":\"Academic Years\",\"yearTitle\":\"Year Title\",\"defAcademicYears\":\"Default academic year\",\"delAcademicYears\":\"Delete academic year\",\"acYearNotExist\":\"Academic year isn\'t exist\",\"acYearNowDef\":\"Academic year is now default one\",\"acYearAddSuc\":\"Academic year created successfully\",\"cannotDelDefAcademicYears\":\"Cannot delete default academic year\",\"markAsDefAcademicYears\":\"Mark as default academic year\",\"yearStatus\":\"Year Status\",\"addAcademicyear\":\"Add academic year\",\"vacationList\":\"Vacation List\",\"activeUsers\":\"Active Users\",\"studentVacation\":\"Students Vacation\",\"UsersStats\":\"Users Statistics\",\"studentAttendance\":\"Students Attendance\",\"teacherVacation\":\"Teachers Vacation\",\"inactiveUsers\":\"Inactive Users\",\"getPaymentReports\":\"Get payments reports\",\"listAcademicyear\":\"List academic years\",\"noAcademicYears\":\"No academic years available\",\"editAcademicYears\":\"Edit academic year\",\"acYearDelSuc\":\"Academic year deleted successfully\",\"acYearModSuc\":\"Academic year modified successfully\",\"delDorm\":\"Delete Dormitory\",\"dormDeleted\":\"Dormitory deleted successfully\",\"failedImport\":\"Failed to import\",\"readyImport\":\"Ready to import\",\"reviseImportData\":\"Please revise data errors\",\"noDataImport\":\"No data to import\",\"noMarksheetAv\":\"No Marksheet data available\",\"blackLight\":\"Black-light\",\"HostelManage\":\"Hostel Management\",\"Hostel\":\"Hostel\",\"HostelCat\":\"Hostel Categories\",\"AddHostel\":\"Add Hostel\",\"ListHostel\":\"List Hostel\",\"HostelTitle\":\"Hostel Title\",\"Hosteltype\":\"Hostel Type\",\"Manager\":\"Manager\",\"EditHostel\":\"Edit hostel\",\"Boys\":\"Boys\",\"Girls\":\"Girls\",\"Mixed\":\"Mixed\",\"Notes\":\"Notes\",\"noHostel\":\"No hostel available\",\"delHostel\":\"Delete Hostel\",\"hostelDeleted\":\"Hostel deleted successfully\",\"hostelNotExist\":\"Hostel not exist\",\"HostelCreated\":\"Hostel created successfully\",\"HostelModified\":\"Hostel modified successfully\",\"delHostelCat\":\"Delete hostel category\",\"hostelCatDeleted\":\"Hostel category deleted successfully\",\"HostelCatNotExist\":\"Hostel category not exist\",\"addHostelCat\":\"Add hostel category\",\"HostelCatCreated\":\"Category created successfully\",\"editHostelCat\":\"Edit hostel category\",\"hostelCatModified\":\"Category modified successfully\",\"listHostelCat\":\"List Hostel categories\",\"catTitle\":\"Category Title\",\"fees\":\"Fees\",\"sections\":\"sections\",\"addSection\":\"Add section\",\"listSections\":\"List sections\",\"sectionTitle\":\"Section Title\",\"section\":\"Section name\",\"editSection\":\"Edit section\",\"delSection\":\"Delete section\",\"sectionAdded\":\"Section added successfully\",\"sectionUpdated\":\"Section updated successfully\",\"sectionDeleted\":\"Section deleted successfully\",\"sectionNotExist\":\"Section not exist\",\"allowedExamMin\":\"Allowed exam time in miuntes (0 for unlimited)\",\"examDegreeSuccess\":\"Exam degree of success\",\"questionMark\":\"Question mark\",\"emptyOneMark\":\"Empty mark will caluculated as 1 mark\",\"accounting\":\"Accounting\",\"FeeTypes\":\"Fee Types\",\"addFeeType\":\"Add fee type\",\"listFeeType\":\"List fee types\",\"FeeType\":\"Fee Type\",\"feeDefaultAmount\":\"Default amount\",\"noFeeTypesAv\":\"No fee types available\",\"feeTypeTitle\":\"Fee type title\",\"editFeeType\":\"Edit fee type\",\"delFeeType\":\"Delete fee type\",\"feeAdded\":\"Fee added successfully\",\"feeUpdated\":\"Fee updated successfully\",\"feeNotExist\":\"Fee type not exist\",\"feeDeleted\":\"Fee type deleted successfully\",\"FeeAllocation\":\"Fee Allocation\",\"listFeeAllocation\":\"List fee allocation\",\"addFeeAllocation\":\"Add fee allocation\",\"noFeeAllocAv\":\"No fee allocation available\",\"classesFeeAllocation\":\"Classes fee allocation\",\"studentsFeeAllocation\":\"Students fee allocation\",\"allocationType\":\"Allocation type\",\"feeDetails\":\"Fee details\",\"value\":\"Value\",\"editFeeAllocation\":\"Edit fee allocation\",\"feeAllocationAdded\":\"Fee allocation added successfully\",\"feeAllocationUpdated\":\"Fee allocation updated successfully\",\"delFeeAllocation\":\"Delete fee allocation\",\"feeAllocationDeleted\":\"Fee allocation deleted successfully\",\"feeAllocationNotExist\":\"Fee allocation not exist\",\"selStudentAlreadyHasAllFee\":\"Selected class already has allocated fee\",\"alreadyHasAllFee\":\"already has allocated fee\",\"Expenses\":\"Expenses\",\"addExpense\":\"Add Expense\",\"expenseTitle\":\"Expense title\",\"expenseAmount\":\"Expense amount\",\"ExpenseDate\":\"Expense date\",\"editExpense\":\"Edit expense\",\"expenseUpdated\":\"Expense updated successfully\",\"expenseAdded\":\"Expense added successfully\",\"delExpense\":\"Delete expense\",\"expenseDeleted\":\"Expense deleted successfully\",\"expenseNotExist\":\"Expense not exist\",\"passGrade\":\"Pass grade\",\"finalGrade\":\"Final grade\",\"marksheetGen\":\"Marksheet Generation\",\"fullPerm\":\"Full Permissions\",\"customPerm\":\"Custom Permissions\",\"noAdministrators\":\"No Administrators\",\"Permissions\":\"Permissions\",\"enableSections\":\"Enable Sections\",\"allowPublicReg\":\"Allow public registeration\",\"dateFormat\":\"Date Format\",\"studentMail\":\"Studnet\'s E-mail\",\"Mandatory\":\"Mandatory\",\"notMandatory\":\"Not Mandatory\",\"autoInvoiceGen\":\"Automatic invoice generation\",\"autoInvoiceGenCreateApprove\":\"Automatically generate invoice when student created \\/ approved\",\"autoInvoiceGenPromote\":\"Automatically generate invoice when student promoted\",\"noAttendance\":\"No attendance available to show\",\"noHostelCat\":\"No categories available\",\"mobileNotifications\":\"Mobile Notifications\",\"sendNewNotification\":\"Send new notification\",\"newMessageFrom\":\"New Message From\",\"notifyIsLedaerBoard\":\"Congratulations! You\'re in the leaderboard\",\"newAssigmentAdded\":\"New Assignemnt added\",\"newOnlineExamAdded\":\"New Online exam added\",\"newPaymentNotif\":\"New payment pending your action\",\"totalMarks\":\"Total Marks\",\"allowTeaSendMailSms\":\"Allow teachers send mail\\/sms\",\"Image\":\"Image\",\"viewImage\":\"View Image\",\"chgImage\":\"Change Image\",\"uplImage\":\"Upload Image\",\"noQuestAnswer\":\"No questions answered yet\",\"falseAns\":\"False Answer\",\"markShFields\":\"Marksheet Fields\",\"addColumn\":\"Add Column\",\"Reccuring\":\"Reccuring\",\"cycleEver\":\"Cycle every\",\"day\":\"Day\",\"month\":\"Month\",\"year\":\"Year\",\"nextCycle\":\"Next Cycle\",\"medHistory\":\"Medical History\",\"toggleView\":\"Toggle View\",\"medInfo\":\"Medical Info\",\"height\":\"Height\",\"Weight\":\"Weight\",\"RH\":\"Diet\",\"insPolicy\":\"Insurance Policy\",\"vacCard\":\"Vaccination card\",\"preMedMed\":\"Premedication Medicine\",\"prefclinic\":\"Preferred Clinic\",\"disType\":\"Disability Type\",\"contactInfo\":\"Contact Information\",\"Allergies\":\"Allergies\",\"Medications\":\"Medications\",\"Immunization\":\"Immunization\",\"Fractures\":\"Fractures\",\"Surgery\":\"Surgery\",\"Remarks\":\"Remarks\",\"saveMed\":\"Save Medical Information\",\"promotionType\":\"Promote Type\",\"promote2AcYear\":\"Promote to another academic year\",\"graduate\":\"Graduate\",\"graduateBelow\":\"The below students will be marked as graduated students\",\"Diet\":\"Diet\",\"inCaseEmerg\":\"In case of emergencies\",\"specMedInfo\":\"Specific Medical Information\",\"listGradStd\":\"List Graduate Students\",\"seeMoreTodayDates\":\"See more today dates\",\"today\":\"Today\",\"tomorrow\":\"Tomorrow\",\"advSearch\":\"Advanced Search\",\"examSchedule\":\"Exam Schedule\",\"endDate\":\"End Date\",\"next\":\"Next\",\"previous\":\"Previous\",\"Communication\":\"Communication\",\"mail\":\"Mail\",\"phone\":\"Phone\",\"Invoices\":\"Invoices\",\"dueInvoices\":\"Due Invoices\",\"title\":\"Title\",\"time\":\"Time\",\"ppaid\":\"PARTIALLY PAID\",\"dueDate\":\"Due Date\",\"servicePanel\":\"Service Panel\",\"lightSidebar\":\"With Light sidebar\",\"darkSidebar\":\"With Dark sidebar\",\"InvTitle\":\"Invoice Title\",\"paidAmount\":\"Paid Amount\",\"dateDueDate\":\"Date \\/ Due Date\",\"showDueInvOnly\":\"Show Due Invoices Only\",\"myInvoices\":\"My Invoices\",\"chgAcademicyears\":\"Change Academic Year\",\"InvID\":\"Invoice ID\",\"pay\":\"Pay\",\"payVia\":\"Pay via\",\"totalAmount\":\"Total Amount\",\"pendingAmount\":\"Pending Amount\",\"addTemplate\":\"Add template\",\"templateAdded\":\"Template added successfully\",\"delTemplate\":\"Delete template\",\"templateNotExist\":\"Template not exist\",\"templateDeleted\":\"Template deleted successfully\",\"History\":\"History\",\"loadFromTemplate\":\"Load from template\",\"plzSelMessType\":\"Please select Message type first\",\"messQueued\":\"Message queued for sending successfully\",\"Load\":\"Load\",\"Category\":\"Category\",\"expCategory\":\"Expenses Categories\",\"addExpCat\":\"Add expenses category\",\"lstExpCat\":\"List expenses categories\",\"catDesc\":\"Category description\",\"editExpCat\":\"Edit expense group\",\"CategoryAdded\":\"Category added successfully\",\"CategoryUpdated\":\"Category updated successfully\",\"delExpenseCat\":\"Delete expenses category\",\"CategoryDeleted\":\"Category deleted successfully\",\"CategoryNotExist\":\"Category not exist\",\"feeCode\":\"Fee Code\",\"feeDescription\":\"Fee Description\",\"feeAmount\":\"Fee Amount\",\"feeSchedule\":\"Fee Schedule\",\"feeScheduleOneTime\":\"One Time ( Fixed date )\",\"feeScheduleAnnually\":\"Annually\",\"feeScheduleBiAnnually\":\"Bi-Annually\",\"feeScheduleTriAnnually\":\"Tri-Annually\",\"feeScheduleQuarterly\":\"Quarterly\",\"feeScheduleMonthly\":\"Monthly\",\"feeScheduleGenerateInvoice\":\"Generate invoices on the below dates\",\"feeScheduleFixedDate\":\"Fixed Date\",\"feeScheduleFirstDate\":\"First Date\",\"feeScheduleSecondDate\":\"Second Date\",\"feeScheduleThirdDate\":\"Third Date\",\"feeScheduleFourthDate\":\"Fourth Date\",\"feeScheduleFifthDate\":\"Fifth Date\",\"feeScheduleSixthDate\":\"Sixth Date\",\"feeScheduleSeventhDate\":\"Seventh Date\",\"feeScheduleEighthDate\":\"Eighth Date\",\"feeScheduleNinthDate\":\"Ninth Date\",\"feeScheduleTenthDate\":\"Tenth Date\",\"feeScheduleEleventhDate\":\"Eleventh Date\",\"feeScheduleTwelvethDate\":\"Twelveth Date\",\"feeTitle\":\"Fee Title\",\"allocatedTo\":\"Allocated to\",\"allStudents\":\"All students\",\"specStudents\":\"Specific students\",\"feeAllocDetails\":\"Fee Allocation details\",\"FeeGroups\":\"Fee Groups\",\"FeeGroup\":\"Fee Group\",\"addFeeGroup\":\"Add fee group\",\"listFeeGroups\":\"List fee groups\",\"noGroups\":\"No groups available\",\"groupTitle\":\"Group title\",\"groupDesc\":\"Group Description\",\"invPrefix\":\"Invoice Prefix\",\"editFeeGroup\":\"Edit fee group\",\"delFeeGroup\":\"Delete fee group\",\"feeGroupDeleted\":\"Fee group deleted successfully\",\"feeGroupNotExist\":\"Fee group not exist\",\"feeGroupAdded\":\"Fee group added successfully\",\"feeGroupUpdated\":\"Fee group updated successfully\",\"addInvoice\":\"Add invoice\",\"listInvoices\":\"List Invoices\",\"invDetails\":\"Invoice details\",\"invNewRow\":\"Add new invoice row\",\"noInvRows\":\"No invoice rows available\",\"payMethod\":\"Payment Method\",\"payDate\":\"Paid Date\",\"invDueDate\":\"Invoice is Due Date\",\"collInvoice\":\"Collect Invoice\",\"payRevert\":\"Revert\",\"collAmount\":\"Collection Amount\",\"collDate\":\"Collection Date\",\"mobileSettings\":\"Mobile application\",\"lookFeel\":\"Look & Feel\",\"Timezone\":\"Timezone\",\"googleID\":\"Google Analytics Tracking ID\",\"enabled\":\"Enabled\",\"disabled\":\"Disabled\",\"loginPageStyle\":\"Login Page Style\",\"righStyle\":\"Right Style\",\"centerStyle\":\"Center Style\",\"forgetPageStyle\":\"Forget password Page Style\",\"registerPageStyle\":\"Registeration Page Style\",\"authPageBG\":\"Authentication pages background Image\",\"authPageBGColor\":\"Authentication pages background color\",\"leftMnuSlimScroll\":\"Left Menu Slim Scrollbar\",\"upcomingToday\":\"Upcoming Today\",\"noDatesToday\":\"No dates today\",\"tapToTryAgain\":\"Tap to try again\",\"loadingError\":\"Loading Error\",\"loading\":\"Loading\",\"noEntry\":\"No Entry\",\"clickToPickDate\":\"Click To Pick Date\",\"pleaseWait\":\"Please Wait\",\"ok\":\"Ok\",\"cancel\":\"Cancel\",\"errorOccurred\":\"Error Occurred\",\"updatesSaved\":\"Updates Saved\",\"tryAgain\":\"Try Again\",\"downloading\":\"Downloading\",\"fileDownloaded\":\"File Downloaded\",\"accountants\":\"Accountants\",\"addAccountant\":\"Add Accountant\",\"editAccountant\":\"Edit Accountant\",\"delAccountant\":\"Delete Accountant\",\"accountantCreated\":\"Accountant created successfully\",\"accountantDelSucc\":\"Accountant deleted successfully\",\"noAccountant\":\"No Accountants\",\"accountantNotExist\":\"Accountant not exist\",\"listAccountant\":\"List Accountant\",\"accountantUpdated\":\"Accountant updated successfully\",\"expensesReports\":\"Expenses Reports\",\"stdAppliedOn\":\"Student applied the answer on\",\"stdNotApplied\":\"Student not applied the answer yet\",\"noDataAvailable\":\"No Data Available\",\"Homework\":\"Homework\",\"addHomework\":\"Add Homework\",\"editHomework\":\"Edit Homework\",\"lstHomework\":\"List Homeworks\",\"HomeworkTitle\":\"Homework Title\",\"SubmissionDate\":\"Submission Date\",\"EvaluationDate\":\"Evaluation Date\",\"View\":\"View\",\"noHomeworks\":\"No Homeworks available\",\"Attachment\":\"Attachment\",\"noFilesAv\":\"No Files available\",\"HomeworkDesc\":\"Homework Description\",\"applied\":\"Applied\",\"notApplied\":\"Not yet Applied\",\"delHomework\":\"Delete Homework\",\"HomeworkDeleted\":\"Homework deleted successfully\",\"HomeworknotExist\":\"Homework not exist\",\"HomeworkCreated\":\"homework created successfully\",\"HomeworkModified\":\"Homework modified successfully\",\"bioId\":\"Biometric ID\",\"visibleCMS\":\"Visible in CMS\",\"toggleCMS\":\"Toggle CMS Status\",\"update\":\"Update\",\"usrInformation\":\"User information\",\"is\":\"is\",\"Upload\":\"Upload\",\"fLibrary\":\"Files Library\",\"selDrop\":\"Click to select files or drop here\",\"loadMore\":\"Load More\",\"selUpload\":\"Select \\/ Upload\",\"dbExport\":\"DB Export\",\"bioItegration\":\"Biometric Integration\",\"Marsala\":\"Marsala\",\"Pink\":\"Pink\",\"Violet\":\"Violet\",\"Cyan\":\"Cyan\",\"exportDB\":\"Export\",\"importDB\":\"Import\",\"exportClick\":\"Click here to export Database\",\"importClick\":\"To import, Please use PHPMyAdmin to ensure maximum data consistency.\",\"attNNotif\":\"Attenndance for student\",\"yrAttIs\":\"Your attendance is\",\"newExamNotif\":\"New exam schedule added\",\"allowedVars\":\"Allowed to use variables\",\"feeAllocWhenFrst\":\"When the first invoices generates ?\",\"Now\":\"Now\",\"arFeeTypeDates\":\"At the fee type dates\",\"discoutedAmount\":\"Discounted Amount\",\"FeeDiscount\":\"Fee Discount\",\"delFeeDiscount\":\"Delete Fee discount\",\"FeeDiscountDeleted\":\"Fee discount Deleted\",\"FeeDiscountNotExist\":\"Fee discount not exist\",\"addFeeDiscount\":\"Add fee discount\",\"FeeDiscountAdded\":\"Fee discount added successfully\",\"editFeeDiscount\":\"Edit fee discount\",\"feeDiscountMod\":\"Fee discount modified successfully\",\"discTypVal\":\"Type\\/Value\",\"assignUser\":\"Assign to users\",\"discTitle\":\"List fee discount\",\"discCode\":\"Discount Code\",\"discDesc\":\"Discount Description\",\"discType\":\"Discount Type\",\"percent\":\"Percentage\",\"fixed\":\"Fixed Value\",\"codeStatus\":\"Code Status\",\"discAssign\":\"Discount Assignments\",\"addDiscAssign\":\"Add discount assignment\",\"type\":\"Type\",\"Information\":\"Information\",\"noDiscAssignAv\":\"No discount assignments available\",\"applyTo\":\"Apply to\",\"selInvoices\":\"Select Invoice\",\"typeInvSearch\":\"Type invoice title, ID, description\",\"typeStdSearch\":\"Type student name \\/ username\",\"Discount\":\"Discount\",\"Incomes\":\"Incomes\",\"incomeTitle\":\"Income Title\",\"incomeAmount\":\"Income Amount\",\"addIncome\":\"Add Income\",\"editIncome\":\"Edit Income\",\"incomeCategory\":\"Incomes Categories\",\"addIncCat\":\"Add income category\",\"editIncCat\":\"Edit income category\",\"lstIncCat\":\"List income categories\",\"delIncCat\":\"Delete income category\",\"incCatDeleted\":\"Income category deleted\",\"incCatNotexist\":\"Income category not exist\",\"Payroll\":\"Payroll\",\"makePayment\":\"Make Payment\",\"userSalary\":\"Users Salary\",\"salaryBase\":\"Salary Base\",\"hourSalary\":\"Hourly Base\",\"makeUsrPayment\":\"Make user payment\",\"salaryProfExist\":\"Salary profile exist\",\"usrNoSalary\":\"User has no salary profile defined\",\"paymentMadeSuccess\":\"User payment made successfully\",\"salaryDetails\":\"Salary Details\",\"salaryForDate\":\"Salary For date\",\"method\":\"Method\",\"netSalary\":\"Net Salary\",\"grossSalary\":\"Gross Salary\",\"overtime\":\"Overtime\",\"overtimeHours\":\"Overtime Hours\",\"rate\":\"Rate\",\"summary\":\"Summary\",\"hours\":\"Hours\",\"addSalaryBase\":\"Add Salary Base\",\"lstSalaryBase\":\"List Salary Base\",\"baseTitle\":\"Base Title\",\"hourRate\":\"Hour Rate\",\"basicSalary\":\"Basic Salary\",\"overtimeSalary\":\"Hourly overtime cost\",\"allowences\":\"Allowences\",\"addRow\":\"Add new row\",\"slryBsCreated\":\"Salary Base created\",\"editSalaryBase\":\"Edit Salary Base\",\"slryBsMod\":\"Salary base modified\",\"delBase\":\"Delete Base\",\"salaryBaseDeleted\":\"Salary base deleted\",\"salaryBaseNotExist\":\"Salary base not exist\",\"editUsrSalary\":\"Edit User Salary\",\"usrSalaryModf\":\"User Salary modified\",\"usrBaseSelec\":\"User\'s Base Salary Selection\",\"usrSelect\":\"Select User to set base\",\"slryType\":\"Salary Type\",\"monthly\":\"Monthly\",\"hourly\":\"Hourly\",\"slryMakePay\":\"Make salary payment\",\"slryPayHistory\":\"Payment History\",\"Cash\":\"Cash\",\"Cheque\":\"Cheque\",\"bnkTrn\":\"Bank transfer\",\"frontendCMS\":\"frontend CMS\",\"ctrlPages\":\"Control Pages\",\"CMSSettings\":\"frontend CMS Settings\",\"socialLinks\":\"Social Links\",\"enableCMS\":\"Enable CMS\",\"defTheme\":\"Default Theme\",\"cmsActineTemp\":\"CMS Active Template\",\"leftCopyrights\":\"Left Copyrights\",\"rightCopyrights\":\"Right Copyrights\",\"frontendCMSpages\":\"frontend CMS pages\",\"permalink\":\"Permalink\",\"Visibility\":\"Visibility\",\"change\":\"Change\",\"sliderImages\":\"Slider Images\",\"imageTitle\":\"Image Title\",\"imageDescription\":\"Image Description\",\"selSlidImg\":\"Select\\/Channge Slider Images\",\"pageProp\":\"Page Properties\",\"Public\":\"Public\",\"loggedUsers\":\"Logged In Users Only\",\"navbarVisibility\":\"Navbar Visibility\",\"Visible\":\"Visible\",\"Invisible\":\"Invisible\",\"Publish\":\"Publish\",\"specificDate\":\"Specific Date\",\"Template\":\"Template\",\"saveDraft\":\"Save as draft\",\"previewPage\":\"Preview page\",\"publishPage\":\"Publish Page\",\"featImage\":\"Featured Image\",\"selFeatImage\":\"Select\\/Change Featured Image\",\"permalinkCantUsed\":\"Permalink cannot used, It\'s already used or reserved\",\"permalinkValid\":\"Permalink is valid\",\"fillField\":\"Please fill in all required fields\",\"validateMail\":\"Please validate you e-mail address\",\"messSent\":\"You message sent to the administrator and we\'ll get in touch soon.\",\"userPosition\":\"User Position\",\"toggleStatus\":\"Toggle Account Status\",\"accStatusChged\":\"Account State changed successfully\",\"accStatusCantYourself\":\"You cannot change yourself status\",\"materialNotif\":\"New study material added\",\"payrollReports\":\"Payroll Payments\",\"incomeReports\":\"Income Payments\",\"bioUsers\":\"Biometric Users\",\"homeworkNotif\":\"New homework assigned to you\",\"signUp\":\"Sign Up\",\"cntctForm\":\"Contact Form\",\"firstName\":\"First Name\",\"lastName\":\"Last Name\",\"mailSubject\":\"E-mail Subject\",\"mailMessage\":\"E-mail Message\",\"cmsSendMessage\":\"Send Message\",\"logToMgmtSys\":\"Login to management system from here\",\"readDetails\":\"Continue reading\",\"prev\":\"Previous\",\"Immediately\":\"Immediately\",\"listFeeDiscount\":\"List fee discount\",\"roles\":\"Permission Roles\",\"add_role\":\"Add Role\",\"role_added\":\"Role added successfully\",\"modify_role\":\"Modify Role\",\"role_modified\":\"Role modified successfully\",\"delete_role\":\"Delete Role\",\"role_deleted\":\"Role deleted successfully\",\"role_notexist\":\"Role not exist\",\"role_title\":\"Role Title\",\"role_desc\":\"Role Description\",\"role_perm\":\"Roles Permissions\",\"role_default\":\"Default Permission for\",\"delIncome\":\"Delete Income\",\"incAdded\":\"Income added successully\",\"incModified\":\"Income modified successully\",\"incDeleted\":\"Income deleted successfully\",\"incNotExist\":\"Income not exist\",\"delUsrPayment\":\"Delate user payment\",\"usrPayDeleted\":\"User payment deleted\",\"usrPayNotExist\":\"User payment not exist\",\"stats\":\"Statistics\",\"list\":\"List\",\"wel_office_cat\":\"Office Categories\",\"add_cat\":\"Add Category\",\"cat_added\":\"Category added\",\"edit_cat\":\"Edit Category\",\"cat_modified\":\"Category Modified\",\"del_cat\":\"Delete Category\",\"cat_deleted\":\"Category deleted\",\"cat_not_exist\":\"Category not exist\",\"wel_office\":\"Welcome Office\",\"vis_purp\":\"Visit Purpose\",\"pho_purp\":\"Phone Purpose\",\"av_for\":\"Available for\",\"typeUsrSearch\":\"Type user name \\/ username\",\"visitors\":\"Visitors\",\"add_vis\":\"Add Visitor\",\"vis_added\":\"Visitor Added\",\"edit_vis\":\"Edit Visitor\",\"vis_mod\":\"Visitor Modified\",\"del_vis\":\"Delete visitor\",\"vis_deleted\":\"Visitor Deleted\",\"vis_not_exist\":\"Visitor Not Exist\",\"pass_id\":\"Pass ID\",\"id_pass\":\"ID\\/Passport #\",\"no_pers\":\"# of persons\",\"company\":\"Company\",\"usr_typ\":\"User Type\",\"comp_name\":\"Company Name\",\"to_meet\":\"To Meet\",\"purpose\":\"Purpose\",\"chkin\":\"Check In\",\"chkout\":\"Check Out\",\"docs\":\"Documents\",\"list_vis\":\"List Visitors\",\"visitor\":\"Visitor\",\"viewFile\":\"View current file\",\"orUpNew\":\"Or upload new\",\"phn_calls\":\"Phone Calls\",\"list_calls\":\"List phone calls\",\"add_call\":\"Add phone call\",\"call_add\":\"Call added successfully\",\"edit_call\":\"Edit Call\",\"call_edit\":\"Call modified successfully\",\"del_call\":\"Delete Call\",\"call_del\":\"Call removed successfully\",\"call_not_exst\":\"Call not exist\",\"incoming\":\"Incoming\",\"outgoing\":\"Outgoing\",\"nxt_fup\":\"Next Follow up\",\"call_dur\":\"Call duration\",\"call_det\":\"Call details\",\"call_type\":\"Call Type\",\"postal\":\"Postal\",\"list_postal\":\"List postal\",\"add_postal\":\"Add postal\",\"postal_added\":\"Postal added\",\"edit_postal\":\"Edit postal\",\"postal_edit\":\"Postal modified successfully\",\"del_postal\":\"Delete Postal\",\"postal_del\":\"Postal deleted successfully\",\"postal_not_exist\":\"Postal not exist\",\"dispatch\":\"Dispatch\",\"recieve\":\"Recieve\",\"refno\":\"Reference Number\",\"con_mess\":\"Contact Messages\",\"list_mess\":\"List visitor messages\",\"del_mess\":\"Delete Message\",\"mess_del\":\"Message deleted\",\"mess_not_exist\":\"Message not exist\",\"mail_subj\":\"Mail Subject\",\"trans_vehicles\":\"Transport vehicles\",\"list_vehicles\":\"List Vehicles\",\"add_vehicle\":\"Add Vehicle\",\"vehicle_add\":\"Vehicle added successfully\",\"edit_vehicle\":\"Edit Vehicle\",\"vehicle_edit\":\"Vehicle modified successfully\",\"del_vehicle\":\"Delete vehicle\",\"vehicle_del\":\"Vehicle deleted\",\"vehicle_not_exist\":\"Vehicle not exist\",\"plate_numb\":\"Plate Number\",\"vehicle_color\":\"Vehicle Color\",\"vehicle_model\":\"Vehicle Model\",\"driver_name\":\"Driver Name\",\"driver_photo\":\"Driver Photo\",\"driver_license\":\"Driver License\",\"transportRoutes\":\"Transport Routes\",\"members\":\"Members\",\"managerPhoto\":\"Manager Photo\",\"managerContact\":\"Manager Contact\",\"employees\":\"Employees\",\"addEmployee\":\"Add Employee\",\"editEmployee\":\"Edit Employee\",\"listEmployee\":\"List Employee\",\"noEmployee\":\"No Accountants\",\"delEmployee\":\"Delete Employee\",\"employeeNotExist\":\"Employee not exist\",\"employeeDelSucc\":\"Employee deleted successfully\",\"employeeCreated\":\"Employee created successfully\",\"employeeUpdated\":\"Employee updated successfully\",\"depart\":\"Departments\",\"list_depart\":\"List Departments\",\"add_depart\":\"Add Departmnet\",\"depart_add\":\"Department added successfully\",\"edit_depart\":\"Edit Department\",\"depart_edit\":\"Department modified successfully\",\"del_depart\":\"Delete department\",\"depart_del\":\"Department deleted\",\"depart_not_exist\":\"Department not exist\",\"depart_title\":\"Department Title\",\"depart_desc\":\"Department description\",\"desig\":\"Designations\",\"list_desig\":\"List Designations\",\"add_desig\":\"Add Designations\",\"desig_add\":\"Designations added successfully\",\"edit_desig\":\"Edit Designations\",\"desig_edit\":\"Designations modified successfully\",\"del_desig\":\"Delete designation\",\"desig_del\":\"Designation deleted successfully\",\"desig_not_exist\":\"Designation not exist\",\"desig_title\":\"Designation title\",\"desig_desc\":\"Designation description\",\"takeAttendance\":\"Take Attendance\",\"attReport\":\"Attendance Report\",\"reportClassif\":\"Report classification\",\"percentage\":\"Percentage\",\"enquiries\":\"Enquiries\",\"list_enq\":\"List Enquiries\",\"add_enq\":\"Add Enquiry\",\"enq_add\":\"Enquiry added successfully\",\"edit_enq\":\"Edit Enquiry\",\"enq_edit\":\"Enquiry modified successfully\",\"del_enq\":\"Delete Enquiry\",\"enq_del\":\"Enquiry deleted successfully\",\"enq_not_exist\":\"Enquiry not exist\",\"enq_title\":\"Enquiry Title\",\"enq_desc\":\"Enquiry Description\",\"enq_type\":\"Enquiry Type\",\"enq_source\":\"Enquiry Source\",\"complaints\":\"Complaints\",\"list_complaint\":\"List Complaints\",\"add_complaint\":\"Add Complaint\",\"complaint_add\":\"Complaint added successfully\",\"edit_complaint\":\"Edit Complaint\",\"complaint_edit\":\"Complaint modified successfully\",\"del_complaint\":\"Delete Complaint\",\"complaint_del\":\"Complaint deleted successfully\",\"complaint_not_exist\":\"Complaint not exist\",\"complaint_title\":\"Complaint Title\",\"comp_desc\":\"Complaint Description\",\"comp_type\":\"Complaint Type\",\"comp_source\":\"Complaint Source\",\"inv_cat\":\"Inventory Categories\",\"list_inv_cat\":\"List inventory categories\",\"inventory\":\"Inventory\",\"suppliers\":\"Suppliers\",\"list_supp\":\"List Suppliers\",\"add_supp\":\"Add Supplier\",\"supp_add\":\"Supplier added successfully\",\"edit_supp\":\"Edit Supplier\",\"supp_edit\":\"Supplier modified successfully\",\"del_supp\":\"Delete Supplier\",\"supp_del\":\"Supplier removed successfully\",\"supp_not_exist\":\"Supplier not exist\",\"supp_name\":\"Supplier name\",\"supp_phone\":\"Supplier Phone\",\"supp_mail\":\"Supplier E-mail\",\"supp_address\":\"Supplier Address\",\"cont_per_name\":\"Contact Person Name\",\"cont_per_phone\":\"Contact Person Phone\",\"cont_per_mail\":\"Contact Person E-mail\",\"conPerson\":\"Contact Person\",\"stores\":\"Stores\",\"list_stores\":\"List stores\",\"add_store\":\"Add store\",\"store_add\":\"Store added successfully\",\"edit_store\":\"Edit store\",\"store_edit\":\"Store modified successfully\",\"del_store\":\"Delete store\",\"store_del\":\"Store deleted successfully\",\"store_not_exist\":\"Store not exist\",\"store_title\":\"Store Title\",\"items_code\":\"Item Coding\",\"list_items\":\"List Items\",\"add_item\":\"Add item\",\"item_add\":\"Item added successfully\",\"edit_item\":\"Edit Item\",\"del_item\":\"Delete item\",\"item_del\":\"Item deleted successfully\",\"item_not_exist\":\"Item not exist\",\"item_title\":\"Item title\",\"item_code\":\"Item Code\",\"item_pn\":\"Item Part Number\",\"items_stock\":\"Items Stock\",\"item\":\"Item\",\"store\":\"Store\",\"supplier\":\"Supplier\",\"quantity\":\"Quantity\",\"iss_ret\":\"Issue\\/Return\",\"issue_item\":\"Issue Item\",\"item_issued\":\"Item issued successfully\",\"item_edit\":\"Item modified successfully\",\"ret_item\":\"Return Item\",\"issue_to\":\"Issue to\",\"issue_date\":\"Issue date\",\"ret_date\":\"Return Date\",\"avQty\":\"Available Quantity\",\"sureReturn\":\"Sure return this item ?\",\"QuestionsArch\":\"Questions Bank\",\"sharedQues\":\"Shared Question\",\"markForShared\":\"Mark this question as shared will make it usable with other techers to use it in anther exams\",\"addAnswer\":\"Add Answer\",\"plzAddTruAns\":\"Please add true answers\",\"quesAdded\":\"Question added successfully\",\"quesModif\":\"Question modified successfully\",\"delQues\":\"Delete question\",\"quesDeleted\":\"Question deleted successfully\",\"quesNotExist\":\"Question not exist\",\"editQuestion\":\"Edit question\",\"close\":\"Close\",\"issue_book\":\"Issue Book\",\"list_issues\":\"List book issues\",\"add_issue\":\"Create book issue\",\"issue_add\":\"Book issue added successfully\",\"edit_issue\":\"Edit book issue\",\"issue_edit\":\"Issue modified successfully\",\"del_issue\":\"Delete issue\",\"issue_del\":\"Issue deleted successfully\",\"issue_not_exist\":\"Issue not exist\",\"serial_no\":\"Serial Number\",\"issue_id\":\"Issue ID\",\"book_return\":\"Return Book\",\"bookPub\":\"Book Publisher\",\"bookISBN\":\"Book ISBN\",\"bookShelf\":\"Book Shelf\",\"subId\":\"Subscription ID\",\"mngSub\":\"Manage Subscription\",\"chgSub\":\"Change Subscription\",\"subChged\":\"Subscription changed successfully\",\"std_cat\":\"Student Categories\",\"list_std_cat\":\"List students categories\",\"admission\":\"Students Admission\",\"medGroup\":\"Blood Group\",\"bloodGroup\":\"Blood Group\",\"religion\":\"Religion\",\"admNumber\":\"Admission Number\",\"admDate\":\"Admission Date\",\"delFile\":\"Delete File\",\"fileDeleted\":\"File Deleted\",\"fileNotExist\":\"File not exist\",\"File\":\"File\",\"fatheName\":\"Father Name\",\"motherName\":\"Mother Name\",\"fatherMob\":\"Father Mobile\",\"motherMob\":\"Mother Mobile\",\"fatherJob\":\"Father Job\",\"motherJob\":\"Mother Job\",\"fatherNotes\":\"Father Notes\",\"motherNotes\":\"Mother Notes\",\"guardAcc\":\"Guardian accounts\",\"linkGuard\":\"Link Guardians\",\"Documents\":\"Documents\",\"addDocRow\":\"Add another document row\",\"admissionInfo\":\"Admission information\",\"in\":\"In\",\"out\":\"Out\",\"appVacation\":\"Approve vacation\",\"myVacation\":\"My vacations\",\"reqVacation\":\"Request vacation\",\"vacStatChged\":\"Vacation status changed successfully\",\"vacNoBalance\":\"You Don\'t have enough balance for vacation\",\"waitAction\":\"Waiting Action\",\"notChckedIn\":\"Not checked in\",\"myAttendance\":\"My Attendance\",\"celebBirthday\":\"Celebrating birthday\",\"order\":\"Order\",\"randomizeQuestions\":\"Randomize questions\",\"latestNews\":\"Latest News\",\"readMore\":\"Read More\",\"Certificates\":\"Certificates\",\"list_cert\":\"List Certificated\",\"add_cert\":\"Add Certificate\",\"cert_add\":\"Certificate added successfully\",\"edit_cert\":\"Edit certificate\",\"cert_edit\":\"Certificated Modified successfully\",\"del_cert\":\"Delete Certificate\",\"cert_del\":\"Certificate deleted successfully\",\"cert_not_exist\":\"Certificate not exist\",\"cert_name\":\"Certificate Name\",\"head_left\":\"Header Left\",\"head_right\":\"Header Right\",\"head_mid\":\"Header Middle\",\"main_title\":\"Main title\",\"main_content\":\"Main Content\",\"foot_left\":\"Footer Left\",\"foot_right\":\"Footer Right\",\"foot_mid\":\"Footer Middle\",\"cert_img\":\"Certificate Image\",\"gen_cert\":\"Generate Certificate\",\"gpstracking\":\"GPS Tracking\"}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `library_issue`
--

CREATE TABLE `library_issue` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `mailTo` text COLLATE utf8_unicode_ci NOT NULL,
  `mailType` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `messageData` text COLLATE utf8_unicode_ci NOT NULL,
  `messageDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `messageSender` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mailsms`
--

INSERT INTO `mailsms` (`id`, `mailTo`, `mailType`, `messageData`, `messageDate`, `messageSender`) VALUES
(1, 'Loren Eichmann', 'dolores', 'Ipsum at sapiente neque beatae debitis voluptate deleniti quia quasi quis illo.', '1564911923', 'Stan Feeney'),
(2, 'Russell Bailey', 'aut', 'Inventore autem amet dolorem sapiente nam.', '1564911923', 'Chloe Okuneva'),
(3, 'Miss Lacy Rodriguez', 'tempora', 'Veniam deserunt qui et sint consequatur quae deleniti qui.', '1564911923', 'Kamryn Rath'),
(4, 'Hyman Walter', 'autem', 'Ut nisi in repellat illum quibusdam dignissimos dolorem et.', '1564911923', 'Jasen Kling PhD'),
(5, 'Dr. Justen Hauck PhD', 'deleniti', 'Quidem incidunt fugit dignissimos sit sed nesciunt.', '1564911923', 'Davion Stracke'),
(6, 'Toby Lueilwitz', 'et', 'Nihil rerum tenetur modi et.', '1564911923', 'Mr. Jordyn Wintheiser'),
(7, 'Kylie Hoeger DVM', 'veniam', 'Quibusdam sapiente quis aut incidunt.', '1564911923', 'Creola Nikolaus DDS'),
(8, 'Wilfrid Corwin', 'perferendis', 'Ex nobis iste sequi recusandae veritatis nulla.', '1564911923', 'Mr. Wilford McKenzie'),
(9, 'Dr. Kameron Windler', 'deleniti', 'Esse voluptatem voluptate.', '1564911923', 'Lucas Ratke'),
(10, 'Prof. Johnnie Morissette DDS', 'cumque', 'Voluptatibus quia rerum fugiat inventore.', '1564911923', 'Dr. Marquis Adams III'),
(11, 'Tyson Nicolas', 'ea', 'Dolorem aliquid deserunt at esse.', '1564911923', 'Dr. Reynold McDermott'),
(12, 'Gaston Monahan II', 'hic', 'Ut deleniti nisi in voluptatem.', '1564911923', 'Camille Haley'),
(13, 'Heloise McLaughlin', 'aspernatur', 'Minima beatae atque sequi voluptatibus.', '1564911923', 'Ms. Nyah Bayer V'),
(14, 'Mr. Jerad Cole', 'et', 'Sapiente nemo libero nihil aut.', '1564911923', 'Ora Thiel'),
(15, 'Adalberto Considine', 'debitis', 'Velit quam accusantium id deleniti vitae natus molestiae laborum repellendus.', '1564911923', 'Tyrique Will'),
(16, 'Fletcher McDermott PhD', 'consequatur', 'Voluptates aut porro.', '1564911923', 'Bettie Koepp'),
(17, 'Destiny Olson', 'modi', 'Totam natus qui eos.', '1564911923', 'Alexys Rath'),
(18, 'Denis Ritchie', 'debitis', 'In impedit sed ut possimus.', '1564911923', 'Laron Koepp'),
(19, 'Alexane Abernathy', 'aut', 'Nobis incidunt facilis sed dignissimos ut fugiat.', '1564911923', 'Mr. Corbin Pouros'),
(20, 'Prof. Nannie Bins', 'ex', 'Quisquam quis dolorem sed est.', '1564911923', 'Else Osinski'),
(21, 'Prof. Freddie Ruecker V', 'dolor', 'At esse ut ut velit at aut corporis esse facere.', '1564911923', 'Devonte Bruen'),
(22, 'Dr. Myrtice Grimes II', 'quidem', 'Similique et ut consequuntur nemo fugiat provident tempora et corporis consectetur.', '1564911923', 'Mr. Keegan Torphy'),
(23, 'Elinore Thompson IV', 'consequatur', 'Velit molestiae dolor sint voluptatem eum rerum expedita.', '1564911923', 'Miss Lela Thompson III'),
(24, 'Enid Kshlerin', 'esse', 'Ratione error et quisquam corporis.', '1564911923', 'Stuart Stiedemann'),
(25, 'Prof. Orpha Kunze', 'eius', 'Quas voluptatem consequuntur labore corrupti id aut enim dolor.', '1564911923', 'Ms. Betty Hegmann MD'),
(26, 'Carolyn Brakus', 'iste', 'Et fugit asperiores.', '1564911923', 'Deontae Heller'),
(27, 'Myron Harber', 'ut', 'A eos quod dolor rerum quam.', '1564911923', 'Garry Rempel'),
(28, 'Jamey Schumm', 'assumenda', 'Voluptates velit sed fugiat et.', '1564911923', 'Benny Bergstrom II'),
(29, 'Leopold Gorczany', 'molestiae', 'Delectus perferendis facere natus sed aliquam.', '1564911923', 'Mr. Reynold Kreiger IV'),
(30, 'Jacquelyn Wyman', 'omnis', 'Molestiae iusto nam sunt accusamus quo.', '1564911923', 'Joyce Kuhic'),
(31, 'Tremaine Gulgowski', 'debitis', 'Aut magnam hic ut non.', '1564911923', 'Leatha Zemlak'),
(32, 'Nigel Prohaska III', 'et', 'Et ut magni.', '1564911923', 'Adele Fadel'),
(33, 'Lauren Kreiger', 'doloremque', 'Autem nostrum facilis dignissimos et nihil aut.', '1564911923', 'Bryana Grant'),
(34, 'Mr. Gustave Crooks', 'possimus', 'Non quaerat laborum aut et et sunt quos.', '1564911923', 'Bud Jerde'),
(35, 'Gardner Marvin', 'rerum', 'Eum et reprehenderit sunt doloremque autem quae rerum eum laudantium.', '1564911923', 'Delores Schmidt'),
(36, 'Adonis Kris', 'quia', 'Est enim sit ut sint vitae aut dolor voluptatem.', '1564911923', 'Mrs. Lempi Barton II'),
(37, 'Dr. Alize Hettinger II', 'non', 'Alias molestiae pariatur minus.', '1564911923', 'Mozell Klocko V'),
(38, 'Luz Stark', 'placeat', 'Aut aliquam nihil molestias autem temporibus tempore.', '1564911923', 'Bertram Ritchie'),
(39, 'Marcellus Rogahn', 'aspernatur', 'Libero corporis adipisci quia deserunt.', '1564911923', 'Payton Borer'),
(40, 'Heidi Aufderhar', 'voluptas', 'Nulla atque earum ut eum rerum hic accusamus.', '1564911923', 'Miss Caitlyn Hettinger MD'),
(41, 'Rosemarie Crooks MD', 'quisquam', 'Recusandae in numquam aliquid atque non repellat quidem.', '1564911923', 'Miss Ofelia Kuhn III'),
(42, 'Thomas Collins', 'iusto', 'Quo recusandae iure omnis dolorem accusamus.', '1564911923', 'Stephany Mohr'),
(43, 'Salma Torphy', 'asperiores', 'Illum aut ut consequatur assumenda illum.', '1564911923', 'Daisy Dooley'),
(44, 'Alfred Gerhold', 'quaerat', 'Aliquid quae incidunt repellat non quia explicabo non nihil id.', '1564911923', 'Ms. Shyann Wintheiser'),
(45, 'Michel Deckow III', 'aspernatur', 'Consequatur et placeat aut.', '1564911923', 'Charlie Hane'),
(46, 'Ahmed Rohan', 'omnis', 'Ducimus et odio ut occaecati voluptatem quia.', '1564911923', 'Dr. Cristal Erdman IV'),
(47, 'Theodore Wunsch Sr.', 'voluptatibus', 'Necessitatibus labore voluptatum dolorum officiis voluptatem.', '1564911923', 'Vena Hammes'),
(48, 'Mr. Emiliano Lesch IV', 'inventore', 'Qui quaerat reiciendis delectus perferendis veniam.', '1564911923', 'Eloisa Hartmann'),
(49, 'Kathleen Jerde', 'nisi', 'Accusantium et ullam saepe soluta est.', '1564911923', 'Gracie Daniel'),
(50, 'Viviane Lowe', 'minima', 'Amet voluptatem et nobis labore minus perferendis.', '1564911923', 'Audreanne Smith');

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

-- --------------------------------------------------------

--
-- Table structure for table `media_albums`
--

CREATE TABLE `media_albums` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `messageText` text COLLATE utf8_unicode_ci NOT NULL,
  `dateSent` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `enable_reply` tinyint(1) NOT NULL DEFAULT '1',
  `messageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `fromId` int(11) NOT NULL,
  `toId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `messageText`, `dateSent`, `enable_reply`, `messageId`, `userId`, `fromId`, `toId`) VALUES
(1, 'Hiiiii', '1564912477', 0, 1, 1, 1, 28),
(2, 'Hiiiii', '1564912477', 0, 2, 28, 1, 28),
(3, 'Hiiiii', '1564912477', 0, 3, 1, 1, 29),
(4, 'Hiiiii', '1564912477', 0, 4, 29, 1, 29),
(5, 'Hiiiii', '1564912477', 0, 5, 1, 1, 30),
(6, 'Hiiiii', '1564912477', 0, 6, 30, 1, 30),
(7, 'Hiiiii', '1564912478', 0, 7, 1, 1, 32),
(8, 'Hiiiii', '1564912478', 0, 8, 32, 1, 32),
(9, 'Hello teachers', '1564912554', 0, 1, 1, 1, 28),
(10, 'Hello teachers', '1564912554', 0, 2, 28, 1, 28),
(11, 'Hello teachers', '1564912554', 0, 5, 1, 1, 30),
(12, 'Hello teachers', '1564912554', 0, 6, 30, 1, 30),
(13, 'Hello teachers', '1564912554', 0, 9, 1, 1, 35),
(14, 'Hello teachers', '1564912554', 0, 10, 35, 1, 35),
(15, 'Hello teachers', '1564912554', 0, 11, 1, 1, 37),
(16, 'Hello teachers', '1564912554', 0, 12, 37, 1, 37);

-- --------------------------------------------------------

--
-- Table structure for table `messages_list`
--

CREATE TABLE `messages_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `lastMessage` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `lastMessageDate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `messageStatus` int(11) NOT NULL,
  `enable_reply` tinyint(1) NOT NULL DEFAULT '1',
  `userId` int(11) NOT NULL,
  `toId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages_list`
--

INSERT INTO `messages_list` (`id`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`, `userId`, `toId`) VALUES
(1, 'Hello teachers', '1564912554', 0, 0, 1, 28),
(2, 'Hello teachers', '1564912554', 1, 0, 28, 1),
(3, 'Hiiiii', '1564912477', 0, 0, 1, 29),
(4, 'Hiiiii', '1564912477', 1, 0, 29, 1),
(5, 'Hello teachers', '1564912554', 0, 0, 1, 30),
(6, 'Hello teachers', '1564912554', 1, 0, 30, 1),
(7, 'Hiiiii', '1564912477', 0, 0, 1, 32),
(8, 'Hiiiii', '1564912478', 1, 0, 32, 1),
(9, 'Hello teachers', '1564912554', 0, 0, 1, 35),
(10, 'Hello teachers', '1564912554', 1, 0, 35, 1),
(11, 'Hello teachers', '1564912554', 0, 0, 1, 37),
(12, 'Hello teachers', '1564912554', 1, 0, 37, 1);

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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `notifTo` text COLLATE utf8_unicode_ci NOT NULL,
  `notifToIds` text COLLATE utf8_unicode_ci NOT NULL,
  `notifData` text COLLATE utf8_unicode_ci NOT NULL,
  `notifDate` int(11) NOT NULL,
  `notifSender` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mob_notifications`
--

INSERT INTO `mob_notifications` (`id`, `notifTo`, `notifToIds`, `notifData`, `notifDate`, `notifSender`) VALUES
(1, 'Harold Green', 'students', 'Maiores voluptatem libero quam dolorem dolores.', 1564911923, 'Delpha Rosenbaum'),
(2, 'Dr. Ulises Roberts', 'teachers', 'Molestias quibusdam cumque autem.', 1564911923, 'Dusty Cormier'),
(3, 'Leta Quigley', 'students', 'Et qui aut doloribus cum.', 1564911923, 'Kimberly Hegmann'),
(4, 'Graham Hauck', 'employees', 'Dolorum asperiores ut eaque neque ipsa sint tenetur rem et.', 1564911923, 'Prof. Vernice Keebler I'),
(5, 'Dr. Kaci Ward PhD', 'parents', 'Quo voluptate necessitatibus quo atque.', 1564911923, 'Isabella Mohr'),
(6, 'Lilliana Jacobi', 'teachers', 'Velit veritatis corporis iure recusandae dolor est.', 1564911923, 'Dorris Hane I'),
(7, 'Adolphus Nicolas', 'students', 'Dolor repellat est laboriosam et cupiditate.', 1564911923, 'Lorenzo Emmerich I'),
(8, 'Garland Smith', 'employees', 'In cum vero atque impedit a suscipit sit.', 1564911923, 'Allene Feest'),
(9, 'Dorthy Upton', 'employees', 'Perferendis ex inventore corrupti tenetur ipsam est velit.', 1564911923, 'Mrs. Jewell Kutch MD'),
(10, 'Talia Gutkowski', 'teachers', 'Autem dolor dolor temporibus.', 1564911923, 'Miss Cordia Ankunding'),
(11, 'Bennett Kuhic', 'employees', 'Voluptas qui suscipit.', 1564911923, 'Van Boyer'),
(12, 'Dr. Reva Larson', 'parents', 'Facilis ratione at dignissimos labore ea inventore natus nulla sequi modi.', 1564911923, 'Thaddeus Ward Sr.'),
(13, 'Rachelle Fadel', 'parents', 'Voluptatibus nisi est natus magni minima.', 1564911923, 'Telly Beier'),
(14, 'Adolf Walsh Jr.', 'students', 'Ratione cupiditate rerum est consequatur aliquam delectus placeat eligendi ipsa.', 1564911923, 'Wilfred Ferry'),
(15, 'Bernadette Ziemann V', 'teachers', 'Libero reiciendis tempora reiciendis dolores.', 1564911923, 'Micah Smith'),
(16, 'Claudia Ernser', 'parents', 'Aliquid labore repudiandae id consequatur et explicabo assumenda ullam vero.', 1564911923, 'Geraldine Bergstrom'),
(17, 'Gaetano Smitham', 'students', 'Et consequatur laudantium voluptatibus nihil qui repellendus reprehenderit sequi.', 1564911923, 'Tiana Renner'),
(18, 'Meda Pouros', 'students', 'Eum qui quia velit corrupti dolores.', 1564911923, 'Vernice Nitzsche'),
(19, 'Mr. Berta Kuvalis', 'parents', 'Aspernatur fugit rerum dolores commodi quaerat.', 1564911923, 'Mrs. Marjolaine Hickle'),
(20, 'Dorris Little', 'teachers', 'Natus repellat minus id in.', 1564911923, 'Kailey Collier'),
(21, 'Harry Will', 'teachers', 'Sapiente alias voluptas ut molestias sed.', 1564911923, 'Dariana Harris'),
(22, 'Dahlia Strosin', 'parents', 'Ut animi temporibus ullam culpa.', 1564911923, 'Bertrand Bartell'),
(23, 'Cortney Koepp', 'teachers', 'Sint earum provident nisi animi quo incidunt necessitatibus sit blanditiis.', 1564911923, 'Dr. Sigurd Denesik'),
(24, 'Roxane Murray', 'teachers', 'Officiis corporis placeat autem fugiat totam.', 1564911923, 'Maria Hammes DDS'),
(25, 'Prof. Aidan Zulauf DVM', 'parents', 'Autem in eveniet labore labore voluptatem et ut id.', 1564911923, 'Jessy Beatty'),
(26, 'Gage Waelchi IV', 'parents', 'Ratione exercitationem sit facere.', 1564911923, 'Mayra Marquardt'),
(27, 'Prof. Jaden Ryan', 'parents', 'Sed tempora laborum voluptates.', 1564911923, 'Elenor Bosco I'),
(28, 'Dr. Carlie Bernhard', 'parents', 'Et nihil autem aut veritatis quia deleniti quasi consequatur.', 1564911923, 'Adolf Gislason'),
(29, 'Eva Brakus', 'employees', 'Quia omnis voluptas cumque et minus eos.', 1564911923, 'Elmore Schamberger'),
(30, 'Ebony Jacobi', 'students', 'Consequatur voluptas vero a amet velit qui.', 1564911923, 'Thelma Ullrich'),
(31, 'Heloise Waelchi III', 'students', 'Aut dolorum repudiandae unde in quas.', 1564911923, 'Crystal Brakus'),
(32, 'Nash Tillman I', 'teachers', 'Nesciunt fuga aut voluptates molestias nesciunt assumenda.', 1564911923, 'Miss Kaitlyn Koch MD'),
(33, 'Raul Reilly', 'teachers', 'Veniam aut numquam qui.', 1564911923, 'Retha Gaylord'),
(34, 'Virgie Marquardt IV', 'parents', 'Consectetur necessitatibus consectetur aut tempora cum consequuntur quas.', 1564911923, 'Lamont Lowe'),
(35, 'Jaqueline Wintheiser', 'employees', 'Nam quia quisquam voluptatum ea fuga quod et.', 1564911923, 'Ross Cummings II'),
(36, 'Ruby Renner', 'teachers', 'Eligendi magni quisquam ad.', 1564911923, 'Mrs. Naomie Welch'),
(37, 'Reilly Bernhard II', 'employees', 'Magni reiciendis sed enim ex.', 1564911923, 'Bobbie Williamson'),
(38, 'Tessie Lakin', 'employees', 'Et consectetur doloremque quia culpa mollitia ut.', 1564911923, 'Mr. Kristofer Lueilwitz'),
(39, 'Prof. Orval Harvey', 'employees', 'Sit sit earum ipsam quibusdam et.', 1564911923, 'Mr. Jayson Schroeder IV'),
(40, 'Bradly Lockman', 'parents', 'Voluptatem facilis aut optio culpa quas.', 1564911923, 'Jodie Wolff'),
(41, 'Gia Bernier', 'students', 'Soluta eum amet mollitia rerum.', 1564911923, 'Name Cummerata'),
(42, 'Anne Franecki V', 'employees', 'Sint qui voluptates rem laudantium sed.', 1564911923, 'Vanessa Gutkowski PhD'),
(43, 'Osborne Hackett', 'parents', 'Quam et eveniet porro.', 1564911923, 'Marcia Adams V'),
(44, 'Dr. Paris Koch II', 'teachers', 'Esse eos reprehenderit natus sed eveniet.', 1564911923, 'Monty Kutch'),
(45, 'Jaron Ruecker', 'students', 'Magni beatae pariatur rerum ab.', 1564911923, 'Adella Bode'),
(46, 'Prof. Reed Kessler', 'parents', 'Itaque natus est fugiat vel nam aliquid qui ad.', 1564911923, 'Mrs. Margarete Langosh'),
(47, 'Katherine Prosacco', 'teachers', 'Et quibusdam numquam molestias reprehenderit ut sit quod accusamus quos facere.', 1564911923, 'Reina O\'Keefe'),
(48, 'Omer Gleason PhD', 'employees', 'Eos quibusdam consequatur id magnam corporis perferendis.', 1564911923, 'Jaden Block'),
(49, 'Mrs. Earlene Schneider V', 'parents', 'Saepe excepturi delectus.', 1564911923, 'Prof. Walker Kozey'),
(50, 'Icie Kshlerin', 'employees', 'Consequuntur aliquid nulla et aliquid laborum.', 1564911923, 'Hank Zulauf');

-- --------------------------------------------------------

--
-- Table structure for table `newsboard`
--

CREATE TABLE `newsboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `newsTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `newsText` text COLLATE utf8_unicode_ci NOT NULL,
  `newsFor` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `newsDate` int(11) NOT NULL,
  `newsImage` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fe_active` int(11) NOT NULL,
  `creationDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `newsboard`
--

INSERT INTO `newsboard` (`id`, `newsTitle`, `newsText`, `newsFor`, `newsDate`, `newsImage`, `fe_active`, `creationDate`) VALUES
(1, 'Sed aspernatur.', 'Dolorum praesentium expedita est ab voluptatem officiis nesciunt.', 'students', 1564911921, '', 0, 1564911921),
(2, 'Fugit tempora illo.', 'Ut aut eligendi suscipit esse aut qui aut.', 'parents', 1564911921, '', 0, 1564911921),
(3, 'Placeat error sunt.', 'Labore voluptatibus ab et eum hic quod cum non.', 'parents', 1564911921, '', 1, 1564911921),
(4, 'Deserunt quisquam nihil laudantium.', 'Atque est temporibus illum id illum iusto.', 'students', 1564911921, '', 1, 1564911921),
(5, 'Magnam sint ipsa rerum.', 'Debitis minima ab qui natus autem ducimus labore ducimus voluptates sed rerum.', 'students', 1564911921, '', 1, 1564911921),
(6, 'Dolor et.', 'Quia vero deleniti quia illo fugit odit.', 'all', 1564911921, '', 1, 1564911921),
(7, 'Quaerat vel autem culpa.', 'Qui repellat praesentium et qui est adipisci aut eos iste.', 'parents', 1564911921, '', 0, 1564911921),
(8, 'Earum ipsum laudantium neque et.', 'Dolor a qui deserunt veniam temporibus voluptas sunt tempore doloribus voluptatem accusantium.', 'students', 1564911921, '', 1, 1564911921),
(9, 'Tenetur voluptas accusamus sed est at.', 'Et rem optio aut veniam quod aspernatur aliquam illum rerum.', 'teacher', 1564911921, '', 1, 1564911921),
(10, 'Nihil qui similique laudantium velit itaque.', 'Dignissimos minima facere eveniet qui et minima suscipit optio natus consequatur quaerat id.', 'students', 1564911921, '', 0, 1564911921),
(11, 'Facere quae.', 'Non optio et ad quasi consequatur architecto amet quas id est.', 'all', 1564911921, '', 0, 1564911921),
(12, 'Consequatur sequi totam ut.', 'Sapiente et dolor enim omnis voluptatibus laborum vel.', 'all', 1564911921, '', 0, 1564911921),
(13, 'Placeat quibusdam aut fuga et.', 'Debitis cum recusandae unde numquam illum nobis optio.', 'all', 1564911921, '', 1, 1564911921),
(14, 'Animi deleniti quis facere quibusdam modi.', 'Voluptatum asperiores beatae consequatur quo.', 'all', 1564911921, '', 1, 1564911921),
(15, 'Nobis sapiente magnam.', 'Nam dolores nostrum ratione amet velit ut eos.', 'all', 1564911921, '', 1, 1564911921),
(16, 'Quisquam fuga.', 'Tenetur optio ipsum ducimus provident tempore qui qui magni libero.', 'all', 1564911921, '', 1, 1564911921),
(17, 'Sed praesentium voluptatem ad.', 'Dolore enim minima odit est aut incidunt non quis.', 'all', 1564911921, '', 1, 1564911921),
(18, 'Ipsa pariatur occaecati.', 'Voluptas sed ut odio voluptas culpa accusamus.', 'teacher', 1564911921, '', 0, 1564911921),
(19, 'Dolores fugiat dolore.', 'Odio itaque qui et rerum in dicta.', 'teacher', 1564911921, '', 1, 1564911921),
(20, 'Nesciunt quasi eum.', 'Quis inventore tempore totam id maxime.', 'parents', 1564911921, '', 0, 1564911921);

-- --------------------------------------------------------

--
-- Table structure for table `notifications_mob_history`
--

CREATE TABLE `notifications_mob_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payload_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications_mob_history`
--

INSERT INTO `notifications_mob_history` (`id`, `name`, `value`, `user_id`, `date`, `type`, `payload_id`) VALUES
(1, 'Et illo.', 'New home work is added', 78, 1564652724, 'attendance', NULL),
(2, 'Adipisci ex.', 'New home work is added', 89, 1563702324, 'event', NULL),
(3, 'Ut ea nam.', 'New home work is added', 89, 1564220724, 'event', NULL),
(4, 'Minus id.', 'New home work is added', 87, 1563702324, 'attendance', NULL),
(5, 'Totam voluptatem.', 'New event was set', 76, 1563615924, 'attendance', NULL),
(6, 'Quasi aliquam nemo.', 'Attenndance for student: Elvis Johns III is present', 78, 1565343924, 'event', NULL),
(7, 'Commodi.', 'New event was set', 88, 1566035124, 'homework', NULL),
(8, 'Quae.', 'Attenndance for student: Elvis Johns III is present', 84, 1563702324, 'homework', NULL),
(9, 'Expedita omnis.', 'New event was set', 84, 1564307124, 'homework', NULL),
(10, 'Ducimus eum.', 'New home work is added', 87, 1564739124, 'attendance', NULL),
(11, 'Libero tempore.', 'New home work is added', 83, 1566207924, 'attendance', NULL),
(12, 'Qui unde esse.', 'Attenndance for student: Elvis Johns III is present', 78, 1566035124, 'homework', NULL),
(13, 'Quia.', 'Attenndance for student: Elvis Johns III is present', 76, 1566121524, 'event', NULL),
(14, 'Doloremque.', 'New event was set', 77, 1566121524, 'event', NULL),
(15, 'Suscipit omnis.', 'New home work is added', 87, 1565862324, 'event', NULL),
(16, 'Blanditiis deserunt iusto.', 'New event was set', 87, 1564220724, 'homework', NULL),
(17, 'Laborum assumenda rerum.', 'New home work is added', 95, 1566207924, 'homework', NULL),
(18, 'Natus odio qui.', 'Attenndance for student: Elvis Johns III is present', 89, 1563702324, 'event', NULL),
(19, 'Qui culpa.', 'New event was set', 79, 1564307124, 'homework', NULL),
(20, 'Corporis iure.', 'New home work is added', 83, 1566035124, 'homework', NULL),
(21, 'Occaecati et.', 'New event was set', 92, 1563615924, 'event', NULL),
(22, 'Atque voluptates ullam.', 'New event was set', 94, 1564825524, 'attendance', NULL),
(23, 'Aut qui.', 'Attenndance for student: Elvis Johns III is present', 78, 1564134324, 'homework', NULL),
(24, 'Aut.', 'Attenndance for student: Elvis Johns III is present', 79, 1565948724, 'attendance', NULL),
(25, 'Dicta in.', 'Attenndance for student: Elvis Johns III is present', 83, 1564566324, 'attendance', NULL),
(26, 'Magnam ut.', 'New home work is added', 76, 1566035124, 'attendance', NULL),
(27, 'Dolor omnis quia.', 'New home work is added', 78, 1564220724, 'attendance', NULL),
(28, 'Eos quo omnis.', 'New event was set', 84, 1563788724, 'event', NULL),
(29, 'Veritatis sit.', 'Attenndance for student: Elvis Johns III is present', 83, 1564652724, 'event', NULL),
(30, 'Voluptatum molestiae.', 'Attenndance for student: Elvis Johns III is present', 78, 1564825524, 'event', NULL),
(31, 'Praesentium officiis.', 'Attenndance for student: Elvis Johns III is present', 93, 1563615924, 'event', NULL),
(32, 'Voluptatibus blanditiis deserunt.', 'New home work is added', 94, 1565171124, 'homework', NULL),
(33, 'Vel nobis.', 'New event was set', 96, 1564479924, 'event', NULL),
(34, 'Facilis.', 'New home work is added', 92, 1563702324, 'homework', NULL),
(35, 'Magnam aut quaerat.', 'New home work is added', 81, 1564739124, 'homework', NULL),
(36, 'Dicta nostrum.', 'Attenndance for student: Elvis Johns III is present', 94, 1565257524, 'homework', NULL),
(37, 'Quia in.', 'New event was set', 96, 1564307124, 'attendance', NULL),
(38, 'Perspiciatis.', 'New home work is added', 81, 1565516724, 'event', NULL),
(39, 'Molestias autem et.', 'New event was set', 86, 1566035124, 'attendance', NULL),
(40, 'Et.', 'New home work is added', 82, 1564739125, 'homework', NULL),
(41, 'Veniam.', 'New event was set', 90, 1565257525, 'event', NULL),
(42, 'Voluptas eligendi.', 'Attenndance for student: Elvis Johns III is present', 79, 1566121525, 'homework', NULL),
(43, 'Dolor labore aspernatur.', 'Attenndance for student: Elvis Johns III is present', 79, 1564393525, 'attendance', NULL),
(44, 'Perferendis eos occaecati.', 'Attenndance for student: Elvis Johns III is present', 85, 1564134325, 'attendance', NULL),
(45, 'Sed.', 'New home work is added', 92, 1565862325, 'attendance', NULL),
(46, 'Tempora expedita.', 'New home work is added', 96, 1563615925, 'event', NULL),
(47, 'Laudantium sed.', 'New home work is added', 83, 1563615925, 'attendance', NULL),
(48, 'Earum nulla.', 'New event was set', 91, 1564825525, 'event', NULL),
(49, 'Iure.', 'New event was set', 84, 1564739125, 'event', NULL),
(50, 'Voluptas voluptates.', 'New home work is added', 90, 1565084725, 'attendance', NULL),
(51, 'Expedita.', 'New event was set', 93, 1564739125, 'attendance', NULL),
(52, 'Soluta quod laboriosam.', 'Attenndance for student: Elvis Johns III is present', 84, 1564479925, 'attendance', NULL),
(53, 'Autem.', 'Attenndance for student: Elvis Johns III is present', 83, 1563875125, 'attendance', NULL),
(54, 'Dicta.', 'Attenndance for student: Elvis Johns III is present', 95, 1565775925, 'attendance', NULL),
(55, 'Voluptatum nobis molestiae.', 'New event was set', 95, 1565430325, 'event', NULL),
(56, 'Qui voluptas.', 'New home work is added', 95, 1565257525, 'attendance', NULL),
(57, 'Repudiandae.', 'Attenndance for student: Elvis Johns III is present', 86, 1563615925, 'homework', NULL),
(58, 'Et molestias.', 'Attenndance for student: Elvis Johns III is present', 96, 1565430325, 'event', NULL),
(59, 'Dolorem aut error.', 'New home work is added', 86, 1564047925, 'homework', NULL),
(60, 'Dolorem.', 'New home work is added', 77, 1565171125, 'attendance', NULL),
(61, 'Sed voluptates.', 'New home work is added', 76, 1565862325, 'attendance', NULL),
(62, 'Fugiat dolores nisi.', 'Attenndance for student: Elvis Johns III is present', 86, 1563702325, 'attendance', NULL),
(63, 'Tempora.', 'Attenndance for student: Elvis Johns III is present', 91, 1563788725, 'event', NULL),
(64, 'Iste officia.', 'New event was set', 80, 1564220725, 'homework', NULL),
(65, 'Suscipit est.', 'New event was set', 88, 1565171125, 'homework', NULL),
(66, 'Et iusto quo.', 'Attenndance for student: Elvis Johns III is present', 93, 1565603125, 'event', NULL),
(67, 'Voluptatibus numquam placeat.', 'New home work is added', 90, 1564998325, 'event', NULL),
(68, 'Nisi.', 'New event was set', 89, 1564307125, 'event', NULL),
(69, 'Est.', 'Attenndance for student: Elvis Johns III is present', 91, 1563875125, 'homework', NULL),
(70, 'Illo.', 'New event was set', 76, 1564393525, 'homework', NULL),
(71, 'Inventore.', 'New home work is added', 86, 1566207925, 'homework', NULL),
(72, 'Est et.', 'Attenndance for student: Elvis Johns III is present', 81, 1564566325, 'event', NULL),
(73, 'Et quia labore.', 'New home work is added', 87, 1566207925, 'event', NULL),
(74, 'Cum sunt.', 'Attenndance for student: Elvis Johns III is present', 94, 1563615925, 'event', NULL),
(75, 'Unde sed voluptate.', 'Attenndance for student: Elvis Johns III is present', 96, 1565603125, 'homework', NULL),
(76, 'Dolor.', 'New home work is added', 81, 1566035125, 'homework', NULL),
(77, 'Aliquam est consequatur.', 'New home work is added', 89, 1565171125, 'attendance', NULL),
(78, 'Nemo libero ducimus.', 'Attenndance for student: Elvis Johns III is present', 86, 1564307125, 'event', NULL),
(79, 'Aperiam suscipit rerum.', 'New event was set', 84, 1564479925, 'event', NULL),
(80, 'Reiciendis velit.', 'New home work is added', 83, 1563615925, 'event', NULL),
(81, 'A necessitatibus.', 'Attenndance for student: Elvis Johns III is present', 82, 1565689525, 'homework', NULL),
(82, 'Incidunt.', 'Attenndance for student: Elvis Johns III is present', 78, 1563875125, 'attendance', NULL),
(83, 'Dolorem optio.', 'Attenndance for student: Elvis Johns III is present', 95, 1564739125, 'event', NULL),
(84, 'Qui non.', 'Attenndance for student: Elvis Johns III is present', 84, 1566035125, 'event', NULL),
(85, 'Amet non ea.', 'New event was set', 93, 1564220725, 'attendance', NULL),
(86, 'Et sed dolorem.', 'New event was set', 87, 1564652725, 'homework', NULL),
(87, 'Laudantium qui.', 'Attenndance for student: Elvis Johns III is present', 80, 1566035125, 'event', NULL),
(88, 'Vel.', 'New home work is added', 85, 1564566325, 'homework', NULL),
(89, 'Quidem.', 'New home work is added', 94, 1565343925, 'attendance', NULL),
(90, 'Voluptates at.', 'New event was set', 93, 1564825525, 'homework', NULL),
(91, 'Molestiae repellat.', 'New home work is added', 82, 1565343925, 'event', NULL),
(92, 'Sunt corporis.', 'Attenndance for student: Elvis Johns III is present', 89, 1564739125, 'event', NULL),
(93, 'Accusamus et quo.', 'Attenndance for student: Elvis Johns III is present', 86, 1563875125, 'homework', NULL),
(94, 'Placeat.', 'Attenndance for student: Elvis Johns III is present', 93, 1565430325, 'homework', NULL),
(95, 'Vel.', 'Attenndance for student: Elvis Johns III is present', 76, 1565171125, 'attendance', NULL),
(96, 'Culpa et impedit.', 'Attenndance for student: Elvis Johns III is present', 92, 1565603125, 'attendance', NULL),
(97, 'Nemo omnis in.', 'New event was set', 83, 1565775925, 'homework', NULL),
(98, 'Eos nemo eum.', 'New event was set', 88, 1564307125, 'event', NULL),
(99, 'Fugit nihil.', 'New home work is added', 79, 1565948726, 'event', NULL),
(100, 'Delectus.', 'New event was set', 91, 1564479926, 'event', NULL),
(101, 'Totam commodi voluptatem.', 'Attenndance for student: Elvis Johns III is present', 91, 1565862326, 'attendance', NULL),
(102, 'Eius veritatis.', 'New home work is added', 84, 1565775926, 'event', NULL),
(103, 'Sapiente.', 'New home work is added', 86, 1564652726, 'attendance', NULL),
(104, 'Dignissimos ex.', 'Attenndance for student: Elvis Johns III is present', 92, 1564479926, 'attendance', NULL),
(105, 'Enim assumenda.', 'New home work is added', 77, 1564393526, 'attendance', NULL),
(106, 'Nihil beatae ipsam.', 'New home work is added', 78, 1566035126, 'homework', NULL),
(107, 'Voluptatem quia.', 'Attenndance for student: Elvis Johns III is present', 93, 1565775926, 'homework', NULL),
(108, 'In.', 'New home work is added', 78, 1563961526, 'attendance', NULL),
(109, 'Est.', 'New event was set', 84, 1565603126, 'homework', NULL),
(110, 'Quaerat quisquam ea.', 'New event was set', 91, 1565603126, 'event', NULL),
(111, 'Magni molestiae.', 'Attenndance for student: Elvis Johns III is present', 94, 1565516726, 'attendance', NULL),
(112, 'Perferendis ullam veritatis.', 'New home work is added', 92, 1565257526, 'event', NULL),
(113, 'Omnis autem soluta.', 'Attenndance for student: Elvis Johns III is present', 83, 1564652726, 'event', NULL),
(114, 'Ut asperiores.', 'New event was set', 86, 1564566326, 'homework', NULL),
(115, 'Sunt fugiat.', 'New home work is added', 86, 1564393526, 'attendance', NULL),
(116, 'Nihil veritatis voluptates.', 'New home work is added', 76, 1565257526, 'attendance', NULL),
(117, 'Non sint.', 'New home work is added', 79, 1564739126, 'event', NULL),
(118, 'Reprehenderit qui explicabo.', 'New home work is added', 89, 1564134326, 'event', NULL),
(119, 'Ut.', 'Attenndance for student: Elvis Johns III is present', 77, 1565171126, 'event', NULL),
(120, 'Aspernatur.', 'New event was set', 91, 1566035126, 'attendance', NULL),
(121, 'Aut.', 'New event was set', 82, 1564047926, 'event', NULL),
(122, 'Sed sequi sed.', 'New home work is added', 79, 1566035126, 'homework', NULL),
(123, 'Voluptas quibusdam.', 'New home work is added', 85, 1563702326, 'attendance', NULL),
(124, 'Et at.', 'New home work is added', 82, 1565862326, 'event', NULL),
(125, 'Consequatur enim sed.', 'New event was set', 76, 1564566326, 'event', NULL),
(126, 'Est error est.', 'New event was set', 89, 1563788726, 'event', NULL),
(127, 'Voluptatem.', 'Attenndance for student: Elvis Johns III is present', 82, 1566035126, 'homework', NULL),
(128, 'Quisquam vel.', 'New home work is added', 88, 1566035126, 'homework', NULL),
(129, 'Eveniet cupiditate quasi.', 'New home work is added', 86, 1564652726, 'attendance', NULL),
(130, 'Alias voluptatibus tempore.', 'Attenndance for student: Elvis Johns III is present', 95, 1564393526, 'attendance', NULL),
(131, 'Perferendis.', 'Attenndance for student: Elvis Johns III is present', 80, 1564825526, 'event', NULL),
(132, 'Nemo.', 'New event was set', 76, 1564566326, 'attendance', NULL),
(133, 'Quo.', 'New event was set', 84, 1564134326, 'homework', NULL),
(134, 'At qui.', 'Attenndance for student: Elvis Johns III is present', 95, 1564652726, 'homework', NULL),
(135, 'Consequuntur sed et.', 'New event was set', 86, 1564998326, 'event', NULL),
(136, 'Qui.', 'New event was set', 95, 1566121526, 'event', NULL),
(137, 'Rerum rerum.', 'New event was set', 94, 1566207926, 'event', NULL),
(138, 'Tenetur harum in.', 'New home work is added', 78, 1566121526, 'homework', NULL),
(139, 'Ut velit.', 'Attenndance for student: Elvis Johns III is present', 83, 1564739126, 'event', NULL),
(140, 'Non est.', 'Attenndance for student: Elvis Johns III is present', 77, 1566121526, 'attendance', NULL),
(141, 'Necessitatibus quia.', 'New home work is added', 81, 1565257526, 'attendance', NULL),
(142, 'Repellendus sunt.', 'Attenndance for student: Elvis Johns III is present', 93, 1564220726, 'attendance', NULL),
(143, 'Voluptatem sed.', 'Attenndance for student: Elvis Johns III is present', 85, 1565862326, 'event', NULL),
(144, 'Aspernatur iure.', 'Attenndance for student: Elvis Johns III is present', 94, 1564998326, 'homework', NULL),
(145, 'Repellat aut.', 'New event was set', 96, 1565171126, 'homework', NULL),
(146, 'Suscipit qui.', 'New event was set', 96, 1565516726, 'homework', NULL),
(147, 'Nobis eaque.', 'New home work is added', 83, 1566207926, 'event', NULL),
(148, 'Aliquid rerum.', 'New home work is added', 80, 1564998326, 'event', NULL),
(149, 'Quod sit ab.', 'New event was set', 88, 1564220726, 'event', NULL),
(150, 'Rem.', 'New home work is added', 93, 1565689526, 'attendance', NULL),
(151, 'Totam.', 'New event was set', 96, 1564739126, 'homework', NULL),
(152, 'Voluptatem dolorum.', 'New home work is added', 96, 1564825526, 'event', NULL),
(153, 'Aut quia.', 'Attenndance for student: Elvis Johns III is present', 96, 1564998326, 'attendance', NULL),
(154, 'Reprehenderit.', 'New home work is added', 89, 1564307126, 'homework', NULL),
(155, 'Amet autem.', 'New home work is added', 93, 1566121526, 'event', NULL),
(156, 'Earum ab voluptatem.', 'New event was set', 83, 1565862326, 'homework', NULL),
(157, 'Qui quia.', 'New event was set', 83, 1564825526, 'attendance', NULL),
(158, 'Aut maxime.', 'New event was set', 84, 1565862326, 'event', NULL),
(159, 'Natus aperiam.', 'New event was set', 91, 1565257526, 'homework', NULL),
(160, 'Numquam dolorem.', 'New event was set', 94, 1564047926, 'event', NULL),
(161, 'Labore id.', 'New event was set', 76, 1566207926, 'attendance', NULL),
(162, 'Fugiat praesentium.', 'New home work is added', 88, 1564566326, 'event', NULL),
(163, 'Aperiam commodi placeat.', 'New event was set', 78, 1563615926, 'event', NULL),
(164, 'Sunt molestiae.', 'New home work is added', 81, 1566207926, 'homework', NULL),
(165, 'Aut ut et.', 'Attenndance for student: Elvis Johns III is present', 86, 1564134327, 'homework', NULL),
(166, 'Itaque vel doloribus.', 'Attenndance for student: Elvis Johns III is present', 92, 1565257527, 'homework', NULL),
(167, 'Earum.', 'New event was set', 83, 1566035127, 'attendance', NULL),
(168, 'Veritatis nesciunt cum.', 'New event was set', 88, 1566121527, 'attendance', NULL),
(169, 'Occaecati ea.', 'New home work is added', 84, 1565689527, 'event', NULL),
(170, 'Ea saepe consequatur.', 'New event was set', 92, 1566207927, 'homework', NULL),
(171, 'Et dignissimos ducimus.', 'New home work is added', 88, 1564825527, 'homework', NULL),
(172, 'Dolore.', 'New home work is added', 93, 1565343927, 'homework', NULL),
(173, 'Reiciendis dolor.', 'New event was set', 84, 1563702327, 'attendance', NULL),
(174, 'Quia est.', 'New home work is added', 94, 1563702327, 'attendance', NULL),
(175, 'Optio reprehenderit.', 'Attenndance for student: Elvis Johns III is present', 84, 1564739127, 'homework', NULL),
(176, 'Omnis explicabo.', 'New event was set', 85, 1566121527, 'event', NULL),
(177, 'Reprehenderit quis.', 'Attenndance for student: Elvis Johns III is present', 91, 1566035127, 'homework', NULL),
(178, 'Saepe nam enim.', 'Attenndance for student: Elvis Johns III is present', 92, 1564825527, 'attendance', NULL),
(179, 'Recusandae sunt.', 'New home work is added', 95, 1565775927, 'attendance', NULL),
(180, 'Ut repudiandae.', 'New event was set', 80, 1563961527, 'attendance', NULL),
(181, 'Qui nihil.', 'Attenndance for student: Elvis Johns III is present', 93, 1565689527, 'homework', NULL),
(182, 'Sunt aut aspernatur.', 'Attenndance for student: Elvis Johns III is present', 96, 1566035127, 'homework', NULL),
(183, 'Iure.', 'Attenndance for student: Elvis Johns III is present', 89, 1564479927, 'event', NULL),
(184, 'Molestiae dolorum.', 'New home work is added', 77, 1564047927, 'event', NULL),
(185, 'Quod.', 'New home work is added', 89, 1566207927, 'attendance', NULL),
(186, 'In laborum.', 'New event was set', 83, 1564566327, 'attendance', NULL),
(187, 'Provident velit quia.', 'Attenndance for student: Elvis Johns III is present', 95, 1564479927, 'homework', NULL),
(188, 'Nulla.', 'New event was set', 90, 1565948727, 'attendance', NULL),
(189, 'Accusantium.', 'Attenndance for student: Elvis Johns III is present', 94, 1563615927, 'attendance', NULL),
(190, 'Perferendis.', 'Attenndance for student: Elvis Johns III is present', 95, 1565603127, 'attendance', NULL),
(191, 'Sit.', 'Attenndance for student: Elvis Johns III is present', 92, 1563788727, 'event', NULL),
(192, 'Rerum velit saepe.', 'New home work is added', 96, 1563702327, 'attendance', NULL),
(193, 'Nulla et aut.', 'New event was set', 82, 1566207927, 'event', NULL),
(194, 'Molestiae dolorem molestias.', 'New event was set', 93, 1564479927, 'homework', NULL),
(195, 'Sunt pariatur sit.', 'Attenndance for student: Elvis Johns III is present', 94, 1565084727, 'event', NULL),
(196, 'Ut dolorum cumque.', 'New home work is added', 94, 1563875127, 'attendance', NULL),
(197, 'Omnis totam.', 'Attenndance for student: Elvis Johns III is present', 79, 1564134327, 'attendance', NULL),
(198, 'Aut.', 'Attenndance for student: Elvis Johns III is present', 79, 1564479927, 'homework', NULL),
(199, 'Et est.', 'Attenndance for student: Elvis Johns III is present', 83, 1565343927, 'event', NULL),
(200, 'Omnis.', 'New home work is added', 76, 1564393527, 'homework', NULL),
(201, 'Aliquam officia.', 'New event was set', 92, 1566121527, 'attendance', NULL),
(202, 'Ut dolorem.', 'New event was set', 87, 1565862327, 'attendance', NULL),
(203, 'Neque.', 'New event was set', 86, 1564739128, 'homework', NULL),
(204, 'Aut culpa.', 'New event was set', 80, 1564393528, 'homework', NULL),
(205, 'Et dolores.', 'New home work is added', 85, 1564134328, 'homework', NULL),
(206, 'Aut odit.', 'Attenndance for student: Elvis Johns III is present', 78, 1564479928, 'event', NULL),
(207, 'Adipisci illo.', 'Attenndance for student: Elvis Johns III is present', 84, 1565689528, 'homework', NULL),
(208, 'Nulla.', 'New event was set', 84, 1564998328, 'homework', NULL),
(209, 'Eveniet.', 'Attenndance for student: Elvis Johns III is present', 90, 1565084728, 'attendance', NULL),
(210, 'Est.', 'New home work is added', 91, 1566035128, 'homework', NULL),
(211, 'Excepturi et.', 'Attenndance for student: Elvis Johns III is present', 85, 1563875128, 'event', NULL),
(212, 'Voluptate amet unde.', 'Attenndance for student: Elvis Johns III is present', 86, 1565862328, 'homework', NULL),
(213, 'Ex est.', 'New home work is added', 76, 1564998328, 'event', NULL),
(214, 'Ducimus.', 'New event was set', 94, 1564739128, 'event', NULL),
(215, 'Delectus voluptates.', 'Attenndance for student: Elvis Johns III is present', 93, 1565257528, 'event', NULL),
(216, 'Voluptatem voluptatibus.', 'New home work is added', 78, 1565084728, 'attendance', NULL),
(217, 'Vel iure.', 'New event was set', 93, 1565257528, 'attendance', NULL),
(218, 'Voluptatem maiores.', 'Attenndance for student: Elvis Johns III is present', 91, 1563961528, 'attendance', NULL),
(219, 'Dolores laboriosam.', 'Attenndance for student: Elvis Johns III is present', 91, 1565689528, 'event', NULL),
(220, 'Sequi sint.', 'New home work is added', 90, 1563702328, 'attendance', NULL),
(221, 'Inventore aut.', 'Attenndance for student: Elvis Johns III is present', 88, 1565171128, 'homework', NULL),
(222, 'Earum quia officiis.', 'New home work is added', 91, 1563702328, 'attendance', NULL),
(223, 'Laboriosam.', 'Attenndance for student: Elvis Johns III is present', 77, 1563615928, 'homework', NULL),
(224, 'Cupiditate aspernatur a.', 'Attenndance for student: Elvis Johns III is present', 89, 1565948728, 'event', NULL),
(225, 'Quos delectus.', 'New home work is added', 76, 1564134328, 'attendance', NULL),
(226, 'Quia corrupti.', 'New home work is added', 82, 1566121528, 'event', NULL),
(227, 'Debitis.', 'New event was set', 93, 1565516728, 'event', NULL),
(228, 'Nesciunt.', 'Attenndance for student: Elvis Johns III is present', 96, 1564393528, 'event', NULL),
(229, 'Quis.', 'Attenndance for student: Elvis Johns III is present', 81, 1564134328, 'attendance', NULL),
(230, 'Rem quidem.', 'New event was set', 78, 1563788728, 'homework', NULL),
(231, 'Facere excepturi.', 'New home work is added', 85, 1565516728, 'homework', NULL),
(232, 'Ut consequatur.', 'New event was set', 93, 1565343928, 'attendance', NULL),
(233, 'Eius quasi aliquam.', 'New home work is added', 83, 1564739128, 'event', NULL),
(234, 'Eos corporis.', 'New event was set', 81, 1563788728, 'homework', NULL),
(235, 'Hic nam.', 'New event was set', 83, 1566035128, 'homework', NULL),
(236, 'Sed veritatis incidunt.', 'New event was set', 83, 1565084728, 'homework', NULL),
(237, 'Officiis eaque.', 'Attenndance for student: Elvis Johns III is present', 85, 1565430328, 'event', NULL),
(238, 'Tempora temporibus doloribus.', 'New event was set', 90, 1563615928, 'attendance', NULL),
(239, 'Ipsum culpa.', 'Attenndance for student: Elvis Johns III is present', 81, 1565171128, 'event', NULL),
(240, 'Repudiandae.', 'New event was set', 87, 1564307128, 'attendance', NULL),
(241, 'Porro qui quia.', 'New event was set', 94, 1564393528, 'homework', NULL),
(242, 'Et excepturi.', 'New home work is added', 78, 1565603129, 'homework', NULL),
(243, 'Natus porro.', 'New home work is added', 87, 1563875129, 'event', NULL),
(244, 'Velit vitae.', 'New event was set', 76, 1563702329, 'attendance', NULL),
(245, 'Et.', 'Attenndance for student: Elvis Johns III is present', 79, 1565603129, 'attendance', NULL),
(246, 'Sed laudantium.', 'New event was set', 96, 1563615929, 'homework', NULL),
(247, 'Exercitationem.', 'New event was set', 92, 1563788729, 'homework', NULL),
(248, 'Est alias.', 'New home work is added', 87, 1563788729, 'attendance', NULL),
(249, 'Et.', 'Attenndance for student: Elvis Johns III is present', 79, 1563615929, 'homework', NULL),
(250, 'Quis quis alias.', 'Attenndance for student: Elvis Johns III is present', 95, 1565862329, 'attendance', NULL),
(251, 'Repudiandae.', 'Attenndance for student: Elvis Johns III is present', 95, 1564479929, 'attendance', NULL),
(252, 'Voluptatem magni consequatur.', 'Attenndance for student: Elvis Johns III is present', 76, 1564134329, 'homework', NULL),
(253, 'Nobis quia.', 'New event was set', 88, 1565343929, 'homework', NULL),
(254, 'Similique voluptatum.', 'New home work is added', 93, 1565430329, 'attendance', NULL),
(255, 'Maxime.', 'New home work is added', 85, 1565603129, 'event', NULL),
(256, 'Aperiam velit modi.', 'New event was set', 82, 1564047929, 'attendance', NULL),
(257, 'Mollitia enim.', 'New event was set', 76, 1564825529, 'attendance', NULL),
(258, 'Recusandae voluptas veniam.', 'New event was set', 84, 1564047929, 'homework', NULL),
(259, 'Est rerum.', 'New event was set', 95, 1565257529, 'homework', NULL),
(260, 'Voluptas non.', 'New event was set', 92, 1564998329, 'homework', NULL),
(261, 'Vitae.', 'Attenndance for student: Elvis Johns III is present', 84, 1564998329, 'event', NULL),
(262, 'Ipsum eum.', 'New event was set', 88, 1564393529, 'attendance', NULL),
(263, 'Dignissimos repellat.', 'Attenndance for student: Elvis Johns III is present', 94, 1565775929, 'attendance', NULL),
(264, 'Culpa architecto inventore.', 'New event was set', 90, 1566035129, 'event', NULL),
(265, 'Adipisci culpa tempora.', 'Attenndance for student: Elvis Johns III is present', 77, 1563875129, 'homework', NULL),
(266, 'Est enim quo.', 'New event was set', 85, 1564652729, 'attendance', NULL),
(267, 'Illo ipsa.', 'New home work is added', 96, 1563788729, 'attendance', NULL),
(268, 'Molestiae enim quia.', 'New home work is added', 96, 1565257529, 'event', NULL),
(269, 'Itaque voluptatem.', 'New home work is added', 96, 1563788730, 'attendance', NULL),
(270, 'Enim.', 'New home work is added', 84, 1566035130, 'homework', NULL),
(271, 'Veritatis voluptas.', 'Attenndance for student: Elvis Johns III is present', 77, 1563961530, 'attendance', NULL),
(272, 'Et minima eveniet.', 'Attenndance for student: Elvis Johns III is present', 85, 1564739130, 'event', NULL),
(273, 'Tempora.', 'New home work is added', 94, 1566121530, 'homework', NULL),
(274, 'Quia error.', 'Attenndance for student: Elvis Johns III is present', 76, 1565171130, 'homework', NULL),
(275, 'Omnis.', 'New home work is added', 83, 1564220730, 'event', NULL),
(276, 'Labore sint.', 'New event was set', 95, 1563788730, 'homework', NULL),
(277, 'Delectus porro.', 'New event was set', 84, 1565948730, 'attendance', NULL),
(278, 'Doloremque in esse.', 'New home work is added', 79, 1565171130, 'event', NULL),
(279, 'Labore.', 'New event was set', 94, 1564134330, 'attendance', NULL),
(280, 'Nisi quo voluptas.', 'New event was set', 88, 1565948730, 'attendance', NULL),
(281, 'Soluta.', 'Attenndance for student: Elvis Johns III is present', 86, 1565689530, 'event', NULL),
(282, 'Rerum rerum.', 'New home work is added', 88, 1563961530, 'attendance', NULL),
(283, 'Voluptatem quae.', 'Attenndance for student: Elvis Johns III is present', 76, 1564825530, 'homework', NULL),
(284, 'Culpa sed.', 'New event was set', 83, 1565171130, 'attendance', NULL),
(285, 'Dolores quia.', 'Attenndance for student: Elvis Johns III is present', 92, 1563788730, 'attendance', NULL),
(286, 'Et veritatis.', 'New home work is added', 88, 1564393530, 'attendance', NULL),
(287, 'Quis aut.', 'New event was set', 81, 1564825530, 'event', NULL),
(288, 'Fugit consequatur placeat.', 'New home work is added', 80, 1565689530, 'attendance', NULL),
(289, 'Sed rerum ullam.', 'New home work is added', 84, 1564825530, 'homework', NULL),
(290, 'Culpa quos.', 'Attenndance for student: Elvis Johns III is present', 80, 1564739130, 'attendance', NULL),
(291, 'Occaecati quis.', 'New home work is added', 91, 1565343930, 'homework', NULL),
(292, 'Et distinctio.', 'New home work is added', 85, 1565775930, 'homework', NULL),
(293, 'Mollitia.', 'New event was set', 92, 1565862330, 'homework', NULL),
(294, 'Impedit sint.', 'Attenndance for student: Elvis Johns III is present', 85, 1564220730, 'homework', NULL),
(295, 'Rerum.', 'New event was set', 92, 1565343930, 'attendance', NULL),
(296, 'Iste omnis.', 'New home work is added', 83, 1564998330, 'event', NULL),
(297, 'Et dolores.', 'New event was set', 79, 1563875130, 'attendance', NULL),
(298, 'Sit ut.', 'New event was set', 80, 1564047930, 'attendance', NULL),
(299, 'Nobis totam.', 'New home work is added', 80, 1565430330, 'event', NULL),
(300, 'Veritatis.', 'New event was set', 87, 1564307130, 'attendance', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `online_exams`
--

CREATE TABLE `online_exams` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(1, 'quis_222', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 520, 0, 44, 260, 1, 1564307108, 1564825508, 0, NULL, NULL, 'Online', 1565603108, 1, '0'),
(2, 'sint_919', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 280, 0, 0, 190, 1, 1564479908, 1564652708, 0, NULL, NULL, 'Card', 1563961508, 0, '0'),
(3, 'veniam_480', 'Eos assumenda praesentium repellat eaque assumenda et itaque molestiae.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 690, 14, 8, 720, 1, 1564393508, 1564998308, 0, NULL, NULL, 'Cheque', 1564998308, 0, '0'),
(4, 'qui_163', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 750, 32, 33, 860, 0, 1564652708, 1564652708, 1, NULL, NULL, 'Cheque', 1564739108, 0, '0'),
(5, 'et_134', NULL, 67, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 990, 0, 31, 310, 0, 1564307108, 1565862308, 0, NULL, NULL, 'Bank Deposit', 1566121508, 1, '0'),
(6, 'cumque_559', 'Natus dolores rem non ratione alias.', 55, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 930, 28, 0, 150, 1, 1563615908, 1564739108, 0, NULL, NULL, 'Online', 1565343908, 1, '0'),
(7, 'nobis_301', 'Dolorem est quis qui qui at ipsum ut aliquam qui.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 1000, 7, 39, 810, 0, 1564134308, 1564652708, 1, NULL, NULL, 'Card', 1565516708, 0, '0'),
(8, 'et_475', NULL, 59, '[{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 680, 4, 2, 480, 0, 1563615908, 1564825508, 1, NULL, NULL, 'Online', 1564393508, 0, '0'),
(9, 'nesciunt_968', 'Aliquam ad dolor itaque repellendus qui a ex aliquid ad.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 110, 0, 29, 850, 1, 1564393508, 1564652708, 0, NULL, NULL, 'Cheque', 1564739108, 0, '0'),
(10, 'sint_529', 'Vero officia quam est harum et accusantium et.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 650, 0, 0, 170, 0, 1564479908, 1564825508, 1, NULL, NULL, 'Card', 1564220708, 1, '0'),
(11, 'id_266', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 920, 15, 0, 870, 1, 1564134308, 1564739108, 0, NULL, NULL, 'Online', 1565171108, 1, '0'),
(12, 'rerum_394', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 420, 24, 13, 930, 0, 1563788708, 1564739108, 1, NULL, NULL, 'Cheque', 1566035108, 0, '0'),
(13, 'et_233', 'Id deleniti officiis cumque cum voluptates soluta autem nostrum.', 56, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 860, 0, 7, 560, 0, 1564479908, 1565689508, 0, NULL, NULL, 'Bank Deposit', 1565257508, 1, '0'),
(14, 'beatae_811', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 780, 0, 0, 560, 0, 1563875108, 1565430308, 0, NULL, NULL, 'Online', 1565257508, 0, '0'),
(15, 'officiis_222', 'Magni molestias est rerum repudiandae enim quaerat labore porro voluptatem.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 310, 0, 0, 130, 1, 1564393508, 1566207908, 0, NULL, NULL, 'Bank Deposit', 1564652708, 1, '0'),
(16, 'quaerat_963', 'Architecto officia et aut delectus nulla ipsum cumque delectus sit.', 54, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 270, 0, 0, 900, 1, 1564652708, 1565257508, 0, NULL, NULL, 'Online', 1565430308, 1, '0'),
(17, 'quis_298', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 600, 0, 21, 220, 1, 1564047908, 1565430308, 0, NULL, NULL, 'Bank Deposit', 1564652708, 0, '0'),
(18, 'nostrum_390', NULL, 57, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 890, 11, 0, 550, 1, 1563615908, 1564825508, 0, NULL, NULL, 'Cash', 1563788708, 0, '0'),
(19, 'optio_419', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 420, 11, 0, 150, 0, 1564566308, 1564739108, 1, NULL, NULL, 'Card', 1565603108, 0, '0'),
(20, 'quia_658', 'Impedit et impedit corrupti voluptate sunt.', 48, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 940, 0, 46, 340, 0, 1564479909, 1565430309, 0, NULL, NULL, 'Cash', 1564220709, 0, '0'),
(21, 'sed_543', NULL, 46, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 460, 14, 40, 610, 1, 1564566309, 1564825509, 0, NULL, NULL, 'Online', 1565603109, 0, '0'),
(22, 'tempore_753', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 90, 0, 46, 530, 0, 1564134309, 1564652709, 1, NULL, NULL, 'Cheque', 1563961509, 1, '0'),
(23, 'perspiciatis_621', 'Deserunt rerum voluptas et quod velit dolores enim et voluptas et.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 790, 7, 0, 610, 0, 1564393509, 1566121509, 0, NULL, NULL, 'Online', 1564998309, 0, '0'),
(24, 'placeat_415', 'Accusantium velit quia facilis sed aliquid error quis qui error eveniet illo.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 760, 12, 34, 700, 0, 1563702309, 1564739109, 1, NULL, NULL, 'Card', 1566121509, 1, '0'),
(25, 'non_906', 'Qui itaque ea eveniet quaerat quaerat perferendis corporis quia et tempora.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 720, 0, 0, 650, 1, 1564652709, 1564739109, 0, NULL, NULL, 'Cheque', 1563702309, 1, '0'),
(26, 'suscipit_866', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 160, 0, 0, 520, 0, 1564566309, 1566121509, 0, NULL, NULL, 'Bank Deposit', 1565084709, 0, '0'),
(27, 'ut_367', 'Ad reprehenderit cupiditate nostrum est ducimus modi sed.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 570, 0, 0, 690, 0, 1564566309, 1566121509, 0, NULL, NULL, 'Bank Deposit', 1565343909, 0, '0'),
(28, 'in_882', 'Suscipit ratione temporibus nobis error.', 60, ']', 280, 0, 44, 910, 0, 1563615909, 1565257509, 0, NULL, NULL, 'Online', 1565689509, 1, '0'),
(29, 'possimus_316', NULL, 67, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 710, 0, 33, 150, 0, 1563702309, 1565603109, 0, NULL, NULL, 'Cheque', 1563702309, 1, '0'),
(30, 'praesentium_217', 'Incidunt sequi qui est et quibusdam sunt distinctio necessitatibus.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 640, 46, 0, 650, 0, 1564047909, 1564739109, 1, NULL, NULL, 'Bank Deposit', 1564739109, 1, '0'),
(31, 'possimus_314', 'Provident velit modi illum molestiae sed.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 200, 1, 2, 170, 0, 1564047909, 1564652709, 1, NULL, NULL, 'Cash', 1565948709, 0, '0'),
(32, 'adipisci_741', 'Deleniti sint ea rerum nobis incidunt ipsum voluptatem impedit qui in.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 540, 0, 48, 290, 0, 1564566309, 1565948709, 0, NULL, NULL, 'Cash', 1564479909, 0, '0'),
(33, 'est_667', 'Mollitia saepe quia hic a enim.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 780, 38, 43, 910, 1, 1563702309, 1564652709, 0, NULL, NULL, 'Cheque', 1564307109, 1, '0'),
(34, 'et_201', 'Et dolores inventore ut quo sed quis est velit temporibus magni et.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 530, 3, 0, 120, 1, 1564307109, 1564825509, 0, NULL, NULL, 'Cash', 1563615909, 0, '0'),
(35, 'nesciunt_885', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 370, 0, 0, 640, 0, 1563961509, 1564652709, 1, NULL, NULL, 'Bank Deposit', 1563702309, 0, '0'),
(36, 'aliquam_928', NULL, 55, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 890, 0, 0, 340, 0, 1563615909, 1564739109, 1, NULL, NULL, 'Bank Deposit', 1565084709, 1, '0'),
(37, 'rerum_712', NULL, 48, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 240, 49, 0, 290, 1, 1564220709, 1564825509, 0, NULL, NULL, 'Card', 1563875109, 1, '0'),
(38, 'necessitatibus_155', NULL, 46, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 110, 20, 26, 230, 0, 1564652709, 1564825509, 1, NULL, NULL, 'Cheque', 1565430309, 0, '0'),
(39, 'temporibus_847', 'Eum sint et rerum amet ipsa velit.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 230, 41, 0, 50, 1, 1564566309, 1564825509, 0, NULL, NULL, 'Card', 1565343909, 0, '0'),
(40, 'vel_190', 'Et placeat officia ut dicta similique aut rem repellat dolorem.', 46, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 850, 25, 0, 830, 1, 1563961509, 1564825509, 0, NULL, NULL, 'Bank Deposit', 1563875109, 0, '0'),
(41, 'sunt_368', 'Quia recusandae repellendus praesentium odio.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 790, 32, 0, 980, 1, 1564652709, 1564825509, 0, NULL, NULL, 'Bank Deposit', 1564739109, 0, '0'),
(42, 'mollitia_160', 'Repellendus et officiis qui dolor error est quis sit dolores.', 63, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 330, 0, 6, 470, 1, 1563788709, 1564652709, 0, NULL, NULL, 'Cheque', 1565171109, 1, '0'),
(43, 'rem_551', 'Asperiores ratione ipsam expedita sed nemo perspiciatis dolores voluptatem ea error et.', 67, '[{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 230, 40, 0, 90, 1, 1564307109, 1565775909, 0, NULL, NULL, 'Cash', 1565084709, 1, '0'),
(44, 'quos_944', 'Sed voluptatibus et et suscipit optio qui.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 310, 20, 28, 610, 1, 1564220709, 1566121509, 0, NULL, NULL, 'Card', 1563875109, 1, '0'),
(45, 'assumenda_922', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"}]', 820, 7, 0, 180, 1, 1563788709, 1565862309, 0, NULL, NULL, 'Cash', 1563875109, 1, '0'),
(46, 'quidem_258', 'Temporibus ea corporis suscipit voluptatem nulla consequatur.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 650, 34, 7, 800, 1, 1563875109, 1564739109, 0, NULL, NULL, 'Card', 1566207909, 1, '0'),
(47, 'qui_696', NULL, 46, '[{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 580, 21, 50, 550, 0, 1564393509, 1564825509, 1, NULL, NULL, 'Cheque', 1565257509, 1, '0'),
(48, 'et_568', 'Enim nostrum dolorem officiis atque distinctio est et voluptas doloribus.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 660, 44, 0, 570, 0, 1564307109, 1564739109, 1, NULL, NULL, 'Cash', 1564393509, 0, '0'),
(49, 'dolorem_968', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 320, 15, 0, 70, 1, 1563875109, 1565343909, 0, NULL, NULL, 'Cheque', 1566035109, 0, '0'),
(50, 'qui_978', 'Nam fugit sit dolor et natus praesentium suscipit.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 380, 33, 1, 650, 1, 1564566309, 1566207909, 0, NULL, NULL, 'Bank Deposit', 1564393509, 1, '0'),
(51, 'iusto_315', 'Quis illum facilis illum praesentium est sapiente quidem.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 320, 25, 0, 920, 1, 1563788709, 1565084709, 0, NULL, NULL, 'Cheque', 1563702309, 0, '0'),
(52, 'laudantium_987', NULL, 67, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 580, 0, 0, 580, 0, 1564134309, 1565343909, 0, NULL, NULL, 'Online', 1564825509, 1, '0'),
(53, 'natus_409', 'Accusantium sequi cumque aut ut sed ad totam ut.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 530, 20, 0, 80, 0, 1564652709, 1564825509, 1, NULL, NULL, 'Card', 1565603109, 0, '0'),
(54, 'omnis_411', 'Tenetur exercitationem nobis fugit et.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 830, 0, 30, 600, 1, 1563615909, 1565603109, 0, NULL, NULL, 'Online', 1564825509, 1, '0'),
(55, 'rerum_760', 'Est aliquam enim illum totam autem ut ipsum totam.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 940, 18, 38, 160, 1, 1564652709, 1565171109, 0, NULL, NULL, 'Online', 1565084709, 1, '0'),
(56, 'magnam_230', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 150, 0, 22, 140, 1, 1564393509, 1564825509, 0, NULL, NULL, 'Bank Deposit', 1565171109, 1, '0'),
(57, 'dolorem_333', 'Et aut voluptatem saepe consequatur excepturi sapiente architecto culpa quisquam est ullam.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 470, 45, 49, 290, 0, 1564307109, 1564739109, 1, NULL, NULL, 'Online', 1565084709, 1, '0'),
(58, 'dolorem_152', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 910, 0, 7, 210, 1, 1564566309, 1565689509, 0, NULL, NULL, 'Cash', 1565084709, 0, '0'),
(59, 'non_956', 'Et possimus reiciendis debitis omnis iure praesentium quod eaque ut voluptatem.', 63, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 90, 0, 0, 920, 1, 1563702309, 1564739109, 0, NULL, NULL, 'Cash', 1565430309, 0, '0'),
(60, 'eum_244', 'Eveniet incidunt quae commodi quasi ut corrupti accusamus corrupti quas doloremque.', 54, '[{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 590, 0, 8, 320, 1, 1564220709, 1565516709, 0, NULL, NULL, 'Cash', 1563702309, 1, '0'),
(61, 'modi_742', 'Id odit sit ut corporis ipsam facilis quia suscipit laborum rerum.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 360, 0, 0, 200, 0, 1563615909, 1564652709, 1, NULL, NULL, 'Card', 1566121509, 1, '0'),
(62, 'eos_815', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 340, 0, 0, 600, 0, 1563702309, 1565171109, 0, NULL, NULL, 'Online', 1565603109, 0, '0'),
(63, 'voluptas_644', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 950, 42, 50, 230, 0, 1563875109, 1565430309, 0, NULL, NULL, 'Bank Deposit', 1565775909, 0, '0'),
(64, 'quia_869', 'Distinctio ipsa quo dolorum est ex qui.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 440, 11, 0, 280, 0, 1563875109, 1564739109, 1, NULL, NULL, 'Card', 1563702309, 1, '0'),
(65, 'mollitia_540', 'Ipsum ut ut voluptates neque quidem distinctio illum et mollitia consequatur.', 57, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 340, 49, 36, 620, 1, 1563875109, 1565257509, 0, NULL, NULL, 'Cheque', 1565084709, 0, '0'),
(66, 'qui_585', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 250, 8, 0, 550, 0, 1564393509, 1566035109, 0, NULL, NULL, 'Cash', 1564393509, 0, '0'),
(67, 'nesciunt_962', 'Aut autem itaque porro occaecati autem architecto ut placeat ut.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 980, 15, 0, 260, 1, 1564220709, 1566121509, 0, NULL, NULL, 'Card', 1565430309, 0, '0'),
(68, 'aliquam_396', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 410, 11, 27, 150, 0, 1564566309, 1565948709, 0, NULL, NULL, 'Card', 1564825509, 0, '0'),
(69, 'provident_823', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 340, 30, 0, 220, 1, 1563961509, 1566035109, 0, NULL, NULL, 'Online', 1564479909, 0, '0'),
(70, 'blanditiis_770', 'Cupiditate aut deserunt suscipit et ut non.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 620, 14, 8, 460, 1, 1564134309, 1566035109, 0, NULL, NULL, 'Cheque', 1565084709, 1, '0'),
(71, 'doloremque_857', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 960, 48, 0, 770, 1, 1564134309, 1565862309, 0, NULL, NULL, 'Bank Deposit', 1565516709, 0, '0'),
(72, 'iusto_691', 'Neque voluptatem culpa non iste qui sit fugit a quam laboriosam.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 60, 0, 0, 790, 1, 1564134309, 1564739109, 0, NULL, NULL, 'Bank Deposit', 1563875109, 1, '0'),
(73, 'aut_763', NULL, 48, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 730, 41, 16, 920, 1, 1563875110, 1566207910, 0, NULL, NULL, 'Cheque', 1565689510, 1, '0'),
(74, 'dolor_915', 'Tempore molestiae amet odit modi qui voluptatem omnis aut beatae in provident.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 850, 40, 41, 900, 0, 1563615910, 1564998310, 0, NULL, NULL, 'Cash', 1564998310, 0, '0'),
(75, 'modi_595', 'Veniam eum rerum deleniti iure enim nemo nihil necessitatibus rerum impedit.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 910, 0, 31, 980, 1, 1564566310, 1564652710, 0, NULL, NULL, 'Bank Deposit', 1564825510, 1, '0'),
(76, 'et_812', 'Voluptatem at minima sed sint totam.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 650, 0, 48, 740, 1, 1564652710, 1564652710, 0, NULL, NULL, 'Online', 1563615910, 0, '0'),
(77, 'magnam_579', 'Praesentium id alias sunt asperiores nobis corporis dicta.', 57, ']', 220, 0, 27, 520, 1, 1564134310, 1564652710, 0, NULL, NULL, 'Online', 1563615910, 0, '0'),
(78, 'autem_427', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 580, 0, 0, 640, 1, 1563702310, 1565430310, 0, NULL, NULL, 'Online', 1565516710, 1, '0'),
(79, 'et_179', NULL, 52, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 860, 0, 0, 470, 1, 1563788710, 1565689510, 0, NULL, NULL, 'Card', 1565257510, 0, '0'),
(80, 'provident_199', 'Molestiae qui sint praesentium quis adipisci reprehenderit.', 67, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 360, 0, 44, 940, 1, 1564134310, 1564825510, 0, NULL, NULL, 'Card', 1564134310, 1, '0'),
(81, 'dignissimos_794', 'Ipsam numquam sit dicta fugit reiciendis facilis ipsa.', 50, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 230, 35, 49, 750, 1, 1564134310, 1565430310, 0, NULL, NULL, 'Cheque', 1565084710, 1, '0'),
(82, 'est_957', NULL, 52, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 60, 0, 0, 80, 0, 1564307110, 1564825510, 1, NULL, NULL, 'Cheque', 1564566310, 1, '0'),
(83, 'tenetur_620', 'Voluptas voluptatibus ad et quia itaque.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 790, 20, 20, 770, 0, 1564307110, 1565343910, 0, NULL, NULL, 'Cash', 1565603110, 1, '0'),
(84, 'aut_911', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 530, 26, 25, 110, 1, 1564652710, 1564739110, 0, NULL, NULL, 'Card', 1565171110, 0, '0'),
(85, 'aperiam_726', 'Quia nam ut laboriosam laboriosam quis voluptates amet.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 270, 0, 36, 820, 1, 1564652710, 1565084710, 0, NULL, NULL, 'Online', 1564220710, 1, '0'),
(86, 'autem_932', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 390, 0, 36, 460, 0, 1564047910, 1564652710, 1, NULL, NULL, 'Cash', 1564047910, 1, '0'),
(87, 'perferendis_929', 'Qui voluptas repellat consequatur iusto sint tempore optio magnam quidem.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 270, 8, 0, 800, 1, 1563961510, 1564652710, 0, NULL, NULL, 'Bank Deposit', 1565775910, 0, '0'),
(88, 'dolores_999', 'Itaque ullam ab nesciunt sit vero.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 230, 0, 0, 940, 0, 1564307110, 1564825510, 1, NULL, NULL, 'Cheque', 1564393510, 1, '0'),
(89, 'dolores_538', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 100, 43, 32, 130, 0, 1563702310, 1564652710, 1, NULL, NULL, 'Cash', 1564998310, 0, '0'),
(90, 'a_170', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 760, 17, 0, 670, 0, 1563788710, 1564652710, 1, NULL, NULL, 'Online', 1566035110, 0, '0'),
(91, 'enim_839', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 370, 46, 0, 330, 1, 1564566310, 1564739110, 0, NULL, NULL, 'Cash', 1564047910, 1, '0'),
(92, 'quas_590', 'Autem delectus omnis aperiam incidunt magni neque reprehenderit.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 800, 0, 0, 230, 1, 1563875110, 1564825510, 0, NULL, NULL, 'Bank Deposit', 1565603110, 0, '0'),
(93, 'nemo_732', 'Ullam tempore quasi eos facilis qui.', 46, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 960, 0, 0, 560, 1, 1564134310, 1564739110, 0, NULL, NULL, 'Cheque', 1565948710, 1, '0'),
(94, 'blanditiis_835', 'Necessitatibus ab rem harum aliquid ut quas.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 150, 0, 0, 280, 0, 1564220710, 1565257510, 0, NULL, NULL, 'Cash', 1565862310, 0, '0'),
(95, 'qui_869', 'Qui nihil nulla unde consequatur eum laudantium mollitia fugit minima.', 49, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 350, 24, 7, 290, 0, 1564047910, 1565171110, 0, NULL, NULL, 'Card', 1564220710, 1, '0'),
(96, 'enim_917', 'Et unde aspernatur alias dolorem enim sit aut.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 340, 0, 0, 550, 1, 1563788710, 1564825510, 0, NULL, NULL, 'Cheque', 1565862310, 0, '0'),
(97, 'odio_286', 'Quidem nesciunt non voluptatem iste doloribus rerum sit animi laudantium.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 300, 34, 0, 610, 1, 1564479910, 1564825510, 0, NULL, NULL, 'Bank Deposit', 1564047910, 1, '0'),
(98, 'veritatis_218', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 720, 0, 0, 390, 0, 1564479910, 1565084710, 0, NULL, NULL, 'Card', 1564220710, 0, '0'),
(99, 'repellendus_811', 'Pariatur voluptatem molestias quam sed illum ipsa dolor voluptatem impedit voluptatum enim.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 530, 0, 23, 200, 0, 1563788710, 1564652710, 1, NULL, NULL, 'Card', 1564652710, 0, '0'),
(100, 'voluptatem_702', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 910, 6, 7, 940, 0, 1563961510, 1565689510, 0, NULL, NULL, 'Bank Deposit', 1564134310, 1, '0'),
(101, 'repellat_638', NULL, 58, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 360, 0, 0, 400, 1, 1563875110, 1565948710, 0, NULL, NULL, 'Card', 1563875110, 0, '0'),
(102, 'nemo_631', NULL, 55, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 340, 27, 43, 210, 0, 1564652710, 1566121510, 0, NULL, NULL, 'Online', 1566121510, 0, '0'),
(103, 'sunt_668', 'Sed sapiente corrupti incidunt perspiciatis et assumenda ex quod pariatur possimus.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 320, 42, 44, 220, 0, 1563702310, 1564652710, 1, NULL, NULL, 'Online', 1563702310, 1, '0'),
(104, 'qui_917', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 420, 0, 15, 80, 1, 1564220710, 1564739110, 0, NULL, NULL, 'Cash', 1565603110, 1, '0'),
(105, 'iusto_877', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 60, 30, 18, 450, 1, 1564307110, 1566035110, 0, NULL, NULL, 'Cheque', 1565084710, 1, '0'),
(106, 'dolor_609', NULL, 55, '[{\"title\":\"Transport fee\",\"amount\":\"200\"}]', 820, 26, 0, 770, 1, 1564393510, 1564825510, 0, NULL, NULL, 'Cash', 1563788710, 0, '0'),
(107, 'consequatur_331', 'Accusamus facere est animi culpa recusandae perspiciatis ipsum et.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 350, 39, 18, 860, 0, 1564220710, 1565171110, 0, NULL, NULL, 'Card', 1566207910, 0, '0'),
(108, 'dolores_446', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 620, 0, 0, 260, 0, 1564479910, 1564739110, 1, NULL, NULL, 'Online', 1566207910, 1, '0'),
(109, 'et_512', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 140, 0, 0, 520, 1, 1564134310, 1565343910, 0, NULL, NULL, 'Online', 1565689510, 0, '0'),
(110, 'necessitatibus_418', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 160, 0, 0, 320, 1, 1563702310, 1565343910, 0, NULL, NULL, 'Bank Deposit', 1565343910, 1, '0'),
(111, 'ea_753', 'Assumenda autem eius quod cupiditate tempore ad ipsam.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 430, 19, 1, 270, 1, 1564479910, 1564825510, 0, NULL, NULL, 'Cash', 1565948710, 1, '0'),
(112, 'labore_860', 'Quia qui cupiditate culpa libero molestiae sed non iure accusantium.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 570, 16, 40, 930, 1, 1563702310, 1566121510, 0, NULL, NULL, 'Cheque', 1564652710, 0, '0'),
(113, 'et_923', 'Autem nisi cumque animi voluptatem nulla deleniti.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 840, 0, 0, 210, 1, 1564652710, 1565343910, 0, NULL, NULL, 'Card', 1565171110, 1, '0'),
(114, 'vitae_824', 'Aliquid eum aut omnis alias illum consequuntur fuga doloremque dolorum.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 590, 16, 0, 840, 1, 1564047910, 1565948710, 0, NULL, NULL, 'Cash', 1565689510, 0, '0'),
(115, 'et_551', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 540, 0, 0, 750, 0, 1564307110, 1566207910, 0, NULL, NULL, 'Card', 1563702310, 0, '0'),
(116, 'maxime_314', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 140, 0, 27, 280, 0, 1564134310, 1564739110, 1, NULL, NULL, 'Cash', 1566035110, 0, '0'),
(117, 'eum_962', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 90, 0, 19, 230, 0, 1564220710, 1564652710, 1, NULL, NULL, 'Cheque', 1564220710, 1, '0'),
(118, 'quia_352', 'Odio atque reprehenderit maiores provident non aut accusantium odit.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 660, 0, 0, 650, 0, 1563788710, 1564998310, 0, NULL, NULL, 'Online', 1564047910, 1, '0'),
(119, 'provident_952', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 270, 0, 0, 600, 1, 1563875110, 1565257510, 0, NULL, NULL, 'Cheque', 1565603110, 1, '0'),
(120, 'odit_216', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 340, 0, 40, 730, 0, 1564047910, 1564825510, 1, NULL, NULL, 'Cheque', 1563788710, 1, '0'),
(121, 'et_527', 'Aspernatur quas ad est in vero.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 180, 0, 23, 180, 1, 1563788710, 1564652710, 0, NULL, NULL, 'Cheque', 1565430310, 1, '0'),
(122, 'voluptate_711', NULL, 48, '[{\"title\":\"Building fee\",\"amount\":\"400\"}]', 70, 0, 26, 650, 1, 1563615910, 1565343910, 0, NULL, NULL, 'Online', 1563875110, 0, '0'),
(123, 'est_438', 'Facilis sint et maiores veritatis asperiores aut enim eos nobis qui.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 820, 0, 0, 650, 1, 1564307110, 1564825510, 0, NULL, NULL, 'Cheque', 1564825510, 0, '0'),
(124, 'sequi_195', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 320, 34, 0, 320, 0, 1563702310, 1564739110, 1, NULL, NULL, 'Online', 1565948710, 1, '0'),
(125, 'sed_889', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 450, 0, 0, 170, 0, 1563702310, 1564652710, 1, NULL, NULL, 'Cheque', 1563788710, 1, '0'),
(126, 'corrupti_979', NULL, 50, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 690, 33, 0, 680, 1, 1564220710, 1565257510, 0, NULL, NULL, 'Bank Deposit', 1563875110, 0, '0'),
(127, 'deleniti_523', 'Pariatur sit voluptatum quia omnis aut corporis explicabo.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 540, 1, 3, 360, 0, 1564134310, 1564825510, 1, NULL, NULL, 'Card', 1563615910, 0, '0'),
(128, 'a_265', 'Cum quis mollitia dignissimos necessitatibus est.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 380, 0, 0, 480, 1, 1564047911, 1564825511, 0, NULL, NULL, 'Card', 1565257511, 1, '0'),
(129, 'temporibus_555', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 550, 25, 23, 670, 0, 1563788711, 1565862311, 0, NULL, NULL, 'Bank Deposit', 1566121511, 1, '0'),
(130, 'fugiat_745', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 760, 31, 0, 240, 0, 1563788711, 1566121511, 0, NULL, NULL, 'Cheque', 1564393511, 0, '0'),
(131, 'aut_343', 'Corrupti repellat cumque ducimus porro provident quasi totam.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 650, 48, 0, 250, 1, 1564134311, 1564739111, 0, NULL, NULL, 'Cheque', 1564998311, 1, '0'),
(132, 'dolore_376', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 830, 47, 36, 650, 0, 1563788711, 1564652711, 1, NULL, NULL, 'Cheque', 1564825511, 0, '0'),
(133, 'placeat_411', 'Recusandae magni occaecati qui ut sint excepturi qui perferendis.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 340, 15, 3, 60, 0, 1563788711, 1565862311, 0, NULL, NULL, 'Cheque', 1564393511, 0, '0'),
(134, 'voluptas_340', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"700\"}]', 150, 0, 24, 450, 1, 1563615911, 1564825511, 0, NULL, NULL, 'Online', 1566207911, 0, '0'),
(135, 'consequuntur_551', 'Amet quos veniam consequatur sit aut voluptatibus tenetur quia aut.', 48, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 640, 0, 0, 600, 0, 1564047911, 1564739111, 1, NULL, NULL, 'Cash', 1564566311, 1, '0'),
(136, 'at_416', 'Debitis ipsam repudiandae dicta sed totam eum libero quo earum reprehenderit.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 600, 31, 46, 350, 0, 1564566311, 1564998311, 0, NULL, NULL, 'Card', 1563788711, 1, '0'),
(137, 'ut_444', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 720, 0, 0, 50, 0, 1564047911, 1564739111, 1, NULL, NULL, 'Cash', 1564652711, 1, '0'),
(138, 'sint_408', 'Et quod ducimus in consequatur sit provident sequi rem autem.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 320, 22, 13, 970, 1, 1564047911, 1565516711, 0, NULL, NULL, 'Cash', 1564652711, 1, '0'),
(139, 'quis_691', NULL, 55, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 430, 8, 24, 750, 0, 1564220711, 1566035111, 0, NULL, NULL, 'Cheque', 1566207911, 0, '0'),
(140, 'ut_932', 'Incidunt repellat in quo non quae est a.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 60, 15, 25, 320, 1, 1563788711, 1564652711, 0, NULL, NULL, 'Cash', 1564566311, 0, '0'),
(141, 'ipsum_958', 'At consequatur odit qui quae exercitationem sint.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 170, 0, 0, 740, 1, 1563702311, 1564739111, 0, NULL, NULL, 'Cheque', 1566207911, 0, '0'),
(142, 'eius_968', 'Unde qui cupiditate iste commodi occaecati beatae et deleniti.', 57, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 460, 0, 0, 280, 1, 1563615911, 1564652711, 0, NULL, NULL, 'Card', 1564825511, 0, '0'),
(143, 'molestias_342', 'Eos maxime ex excepturi adipisci eligendi sit quam quaerat quia quo.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 890, 0, 15, 80, 0, 1564307111, 1565343911, 0, NULL, NULL, 'Cheque', 1563615911, 1, '0'),
(144, 'ratione_139', 'Ex est ad id odit maxime quia reprehenderit fugiat impedit ut.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 600, 33, 17, 460, 0, 1564134311, 1565689511, 0, NULL, NULL, 'Cash', 1565603111, 0, '0'),
(145, 'aut_786', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 910, 0, 15, 70, 1, 1563875111, 1565689511, 0, NULL, NULL, 'Bank Deposit', 1565516711, 0, '0'),
(146, 'animi_721', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 90, 0, 3, 130, 1, 1564220711, 1565171111, 0, NULL, NULL, 'Cheque', 1563961511, 0, '0'),
(147, 'minus_777', NULL, 55, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 340, 0, 0, 70, 1, 1564047911, 1565257511, 0, NULL, NULL, 'Bank Deposit', 1563961511, 1, '0'),
(148, 'facere_759', 'Aliquam sunt eum quas nihil ipsum voluptatem et commodi.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 760, 0, 0, 370, 0, 1564307111, 1564825511, 1, NULL, NULL, 'Online', 1564047911, 1, '0'),
(149, 'facilis_758', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 320, 0, 0, 690, 1, 1563788711, 1564739111, 0, NULL, NULL, 'Card', 1565171111, 0, '0'),
(150, 'quia_428', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 350, 35, 0, 540, 0, 1564307111, 1565257511, 0, NULL, NULL, 'Cheque', 1564047911, 1, '0'),
(151, 'quis_200', NULL, 67, '[{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 760, 13, 0, 740, 0, 1563961511, 1565257511, 0, NULL, NULL, 'Bank Deposit', 1565171111, 0, '0'),
(152, 'temporibus_646', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 100, 0, 0, 50, 0, 1563702311, 1564739111, 1, NULL, NULL, 'Cash', 1564739111, 1, '0'),
(153, 'quis_645', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 100, 0, 0, 400, 0, 1563615911, 1564825511, 1, NULL, NULL, 'Bank Deposit', 1564652711, 0, '0'),
(154, 'est_961', NULL, 63, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 500, 0, 0, 190, 0, 1564047911, 1564825511, 1, NULL, NULL, 'Online', 1565689511, 1, '0'),
(155, 'et_833', 'Quisquam corrupti nihil sint sed accusantium sunt.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 340, 0, 0, 130, 0, 1563615911, 1564652711, 1, NULL, NULL, 'Cash', 1564134311, 0, '0'),
(156, 'repudiandae_469', 'Aut provident qui et voluptate est et maxime.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 350, 0, 0, 730, 0, 1564479911, 1564739111, 1, NULL, NULL, 'Card', 1565257511, 1, '0'),
(157, 'reiciendis_564', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 540, 29, 39, 370, 1, 1564307111, 1565516711, 0, NULL, NULL, 'Card', 1563615911, 0, '0'),
(158, 'qui_493', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 370, 23, 0, 430, 0, 1563788711, 1565430311, 0, NULL, NULL, 'Cash', 1564393511, 1, '0'),
(159, 'excepturi_821', 'Ut architecto temporibus nesciunt magnam et.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 240, 34, 5, 550, 0, 1564566311, 1565775911, 0, NULL, NULL, 'Card', 1566207911, 0, '0'),
(160, 'culpa_968', 'Eaque ea quaerat porro praesentium deleniti.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 540, 10, 13, 70, 1, 1564479911, 1564998311, 0, NULL, NULL, 'Cash', 1565689511, 1, '0'),
(161, 'fugit_313', 'Eveniet voluptas est nobis distinctio sit.', 51, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 850, 3, 0, 620, 1, 1563615911, 1565948711, 0, NULL, NULL, 'Online', 1563961511, 1, '0'),
(162, 'porro_888', 'Eveniet dicta fugiat culpa aspernatur itaque incidunt quia cum et.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 600, 0, 0, 420, 0, 1563702311, 1564998311, 0, NULL, NULL, 'Card', 1563788711, 1, '0'),
(163, 'eveniet_250', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 810, 0, 0, 70, 1, 1564566311, 1565689511, 0, NULL, NULL, 'Bank Deposit', 1565430311, 0, '0'),
(164, 'fuga_579', 'Dolorum veniam molestias sequi fugit omnis.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 710, 33, 0, 190, 1, 1563702311, 1564652711, 0, NULL, NULL, 'Bank Deposit', 1564220711, 0, '0'),
(165, 'et_586', 'Quis excepturi excepturi veritatis omnis.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 910, 0, 0, 120, 0, 1564566311, 1565689511, 0, NULL, NULL, 'Cheque', 1565343911, 1, '0'),
(166, 'libero_310', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 580, 0, 9, 950, 1, 1563702311, 1564825511, 0, NULL, NULL, 'Bank Deposit', 1565257511, 0, '0'),
(167, 'quas_141', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 370, 26, 0, 540, 0, 1563615911, 1564652711, 1, NULL, NULL, 'Bank Deposit', 1565516711, 0, '0'),
(168, 'magni_341', 'Unde error perspiciatis totam cum distinctio assumenda voluptas.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 140, 0, 0, 930, 0, 1564479911, 1564998311, 0, NULL, NULL, 'Online', 1564047911, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(169, 'quod_195', 'Sed distinctio in et aut iure unde inventore.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 200, 0, 0, 150, 1, 1564566311, 1566207911, 0, NULL, NULL, 'Online', 1564393511, 0, '0'),
(170, 'odit_624', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 880, 0, 13, 130, 1, 1563875111, 1565689511, 0, NULL, NULL, 'Cheque', 1563702311, 1, '0'),
(171, 'quisquam_969', 'Earum officia voluptas temporibus itaque nisi illum ut et eaque reiciendis sed.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 110, 0, 39, 960, 0, 1564393511, 1564739111, 1, NULL, NULL, 'Cash', 1564479911, 0, '0'),
(172, 'vel_853', 'Inventore et eaque ut quis architecto minima saepe doloremque accusantium est.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 570, 45, 37, 420, 1, 1563702311, 1566035111, 0, NULL, NULL, 'Bank Deposit', 1565948711, 0, '0'),
(173, 'voluptatem_116', 'Est mollitia corporis deserunt ipsa molestias inventore illum autem.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 530, 40, 44, 360, 0, 1563615911, 1565948711, 0, NULL, NULL, 'Bank Deposit', 1564479911, 1, '0'),
(174, 'excepturi_625', 'Et quam voluptatem nihil nulla totam eum qui.', 48, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 800, 0, 0, 300, 0, 1563875112, 1565430312, 0, NULL, NULL, 'Card', 1563961512, 1, '0'),
(175, 'minima_290', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 460, 0, 0, 310, 1, 1564307112, 1565603112, 0, NULL, NULL, 'Cash', 1563788712, 1, '0'),
(176, 'architecto_689', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 450, 4, 35, 180, 1, 1564479912, 1565689512, 0, NULL, NULL, 'Bank Deposit', 1565775912, 0, '0'),
(177, 'minus_774', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 970, 0, 47, 200, 1, 1564220712, 1564739112, 0, NULL, NULL, 'Card', 1563961512, 1, '0'),
(178, 'aliquid_298', 'Dolorem odit illum sit accusantium repellat sunt rerum alias.', 67, '[{\"title\":\"Building fee\",\"amount\":\"100\"}]', 800, 6, 39, 550, 1, 1564566312, 1564739112, 0, NULL, NULL, 'Cash', 1565257512, 1, '0'),
(179, 'quidem_423', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 560, 7, 47, 90, 0, 1564047912, 1564652712, 1, NULL, NULL, 'Bank Deposit', 1563961512, 0, '0'),
(180, 'harum_585', 'Minus velit non sequi deleniti sit delectus.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 450, 36, 0, 210, 1, 1563875112, 1564825512, 0, NULL, NULL, 'Cash', 1563788712, 0, '0'),
(181, 'nihil_287', 'Omnis omnis error consequatur tenetur earum esse velit nihil debitis beatae.', 63, '[{\"title\":\"Building fee\",\"amount\":\"400\"}]', 560, 46, 0, 330, 0, 1564393512, 1565603112, 0, NULL, NULL, 'Online', 1566121512, 0, '0'),
(182, 'et_720', 'Dolore magnam nisi voluptatibus enim ullam est aut.', 60, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 790, 0, 40, 910, 1, 1564134312, 1564739112, 0, NULL, NULL, 'Card', 1564479912, 1, '0'),
(183, 'repellendus_635', 'Sint modi ut quos porro earum quas officia cumque.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 1000, 24, 0, 700, 1, 1564566312, 1566121512, 0, NULL, NULL, 'Card', 1565171112, 1, '0'),
(184, 'asperiores_755', 'Minima sint odit aperiam voluptatem dolorem omnis est assumenda qui quasi.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 740, 18, 18, 280, 0, 1564220712, 1565084712, 0, NULL, NULL, 'Cash', 1563702312, 0, '0'),
(185, 'occaecati_394', 'Quis odit laboriosam aut tenetur dolorum.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 790, 0, 0, 790, 0, 1563788712, 1565084712, 0, NULL, NULL, 'Bank Deposit', 1565257512, 1, '0'),
(186, 'esse_524', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 410, 27, 7, 1000, 1, 1564393512, 1564825512, 0, NULL, NULL, 'Online', 1566207912, 1, '0'),
(187, 'voluptates_868', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 240, 0, 0, 230, 1, 1563961512, 1564739112, 0, NULL, NULL, 'Online', 1565862312, 0, '0'),
(188, 'praesentium_802', 'Soluta deserunt impedit velit debitis saepe molestiae voluptas et.', 71, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 50, 0, 6, 190, 0, 1563615912, 1564825512, 1, NULL, NULL, 'Online', 1563961512, 1, '0'),
(189, 'et_820', 'Dolorem omnis saepe repellendus dolor impedit.', 71, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 720, 19, 0, 990, 0, 1564134312, 1564652712, 1, NULL, NULL, 'Online', 1564566312, 0, '0'),
(190, 'est_742', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 970, 32, 37, 810, 0, 1563875112, 1565171112, 0, NULL, NULL, 'Cheque', 1566121512, 0, '0'),
(191, 'impedit_527', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 280, 12, 0, 100, 0, 1564393512, 1564739112, 1, NULL, NULL, 'Cash', 1563702312, 1, '0'),
(192, 'vitae_196', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 510, 0, 26, 320, 0, 1563961512, 1564739112, 1, NULL, NULL, 'Cash', 1564220712, 1, '0'),
(193, 'quam_426', 'Ducimus voluptatibus fuga velit nemo consequuntur ut similique.', 71, ']', 840, 12, 49, 640, 0, 1564047912, 1565171112, 0, NULL, NULL, 'Cheque', 1564393512, 1, '0'),
(194, 'et_195', NULL, 55, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 910, 0, 40, 300, 1, 1564652712, 1564825512, 0, NULL, NULL, 'Bank Deposit', 1564825512, 1, '0'),
(195, 'ipsum_541', 'Quasi libero sint sint consectetur quae.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 740, 18, 0, 730, 1, 1563961512, 1564652712, 0, NULL, NULL, 'Cheque', 1563615912, 0, '0'),
(196, 'qui_457', NULL, 58, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 600, 49, 0, 650, 1, 1564220712, 1564739112, 0, NULL, NULL, 'Online', 1563615912, 0, '0'),
(197, 'quae_737', 'Dolorem exercitationem optio pariatur quod voluptatum facilis.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"}]', 710, 7, 50, 730, 0, 1564220712, 1564739112, 1, NULL, NULL, 'Card', 1563615912, 0, '0'),
(198, 'est_208', NULL, 49, '[{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 710, 29, 0, 800, 0, 1564566312, 1564652712, 1, NULL, NULL, 'Cash', 1563875112, 1, '0'),
(199, 'labore_869', NULL, 60, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 950, 0, 0, 480, 1, 1563788712, 1564652712, 0, NULL, NULL, 'Cheque', 1566121512, 1, '0'),
(200, 'enim_810', 'Autem voluptas nam et tenetur et.', 55, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 800, 37, 0, 530, 0, 1564479912, 1564825512, 1, NULL, NULL, 'Bank Deposit', 1565171112, 1, '0'),
(201, 'eligendi_620', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 280, 30, 18, 150, 0, 1564652712, 1565343912, 0, NULL, NULL, 'Bank Deposit', 1566207912, 0, '0'),
(202, 'alias_326', 'Nisi error minima fugiat explicabo.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 480, 16, 0, 910, 1, 1564134312, 1564652712, 0, NULL, NULL, 'Bank Deposit', 1565084712, 0, '0'),
(203, 'quis_678', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 350, 20, 0, 810, 0, 1563788712, 1564652712, 1, NULL, NULL, 'Card', 1564825512, 1, '0'),
(204, 'deleniti_347', NULL, 52, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 150, 5, 13, 430, 0, 1563702312, 1564739112, 1, NULL, NULL, 'Cash', 1565948712, 1, '0'),
(205, 'id_847', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 430, 0, 0, 360, 0, 1564220712, 1565689512, 0, NULL, NULL, 'Card', 1565257512, 1, '0'),
(206, 'nihil_165', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 280, 0, 0, 410, 0, 1563875112, 1566207912, 0, NULL, NULL, 'Bank Deposit', 1566035112, 1, '0'),
(207, 'repellat_219', 'Est sint molestiae necessitatibus quia vero quas iure ad corrupti.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 140, 6, 10, 880, 1, 1564566312, 1565862312, 0, NULL, NULL, 'Cheque', 1564134312, 0, '0'),
(208, 'non_814', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 750, 22, 0, 750, 0, 1564393512, 1564825512, 1, NULL, NULL, 'Online', 1563788712, 1, '0'),
(209, 'sit_533', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 960, 0, 37, 880, 0, 1563875112, 1565516712, 0, NULL, NULL, 'Cheque', 1564652712, 0, '0'),
(210, 'quos_747', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 230, 0, 28, 140, 1, 1563615912, 1564739112, 0, NULL, NULL, 'Bank Deposit', 1566121512, 0, '0'),
(211, 'magnam_904', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 90, 0, 0, 870, 1, 1563961512, 1565430312, 0, NULL, NULL, 'Cheque', 1564825512, 0, '0'),
(212, 'placeat_241', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 280, 5, 0, 300, 1, 1564652712, 1565430312, 0, NULL, NULL, 'Online', 1563961512, 0, '0'),
(213, 'quam_310', 'Est dolores est vel ab quaerat molestiae.', 60, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 110, 0, 44, 1000, 0, 1563875112, 1564652712, 1, NULL, NULL, 'Cheque', 1564134312, 0, '0'),
(214, 'quo_487', 'Aperiam amet vel quo perspiciatis odit est provident explicabo.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 620, 0, 10, 840, 1, 1563615912, 1566207912, 0, NULL, NULL, 'Online', 1565603112, 1, '0'),
(215, 'dolores_342', 'Totam odio magni sed sit inventore aut.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"700\"}]', 740, 0, 0, 740, 0, 1564652712, 1565516712, 0, NULL, NULL, 'Cash', 1564134312, 0, '0'),
(216, 'nam_148', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 540, 0, 10, 760, 0, 1564134312, 1564652712, 1, NULL, NULL, 'Card', 1565603112, 0, '0'),
(217, 'odit_553', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 880, 0, 29, 320, 0, 1564393512, 1564739112, 1, NULL, NULL, 'Card', 1565689512, 0, '0'),
(218, 'qui_324', 'Voluptatem quasi facere soluta facere cupiditate aut dicta et corrupti.', 71, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 170, 40, 0, 780, 0, 1564047912, 1564739112, 1, NULL, NULL, 'Card', 1565430312, 1, '0'),
(219, 'reprehenderit_774', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 820, 45, 7, 590, 0, 1563702313, 1564825513, 1, NULL, NULL, 'Cash', 1565430313, 1, '0'),
(220, 'voluptas_434', 'Placeat veritatis voluptate qui amet voluptas autem.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 680, 0, 46, 480, 1, 1563788713, 1564652713, 0, NULL, NULL, 'Cheque', 1565257513, 0, '0'),
(221, 'repudiandae_868', 'Aut ut deserunt voluptatem eveniet sit iure quis sit.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 140, 0, 0, 790, 1, 1564566313, 1566035113, 0, NULL, NULL, 'Cheque', 1565257513, 0, '0'),
(222, 'magni_453', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 560, 29, 0, 820, 1, 1564479913, 1564739113, 0, NULL, NULL, 'Card', 1565603113, 0, '0'),
(223, 'dolores_105', 'Et quaerat laborum labore velit.', 55, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 210, 0, 0, 420, 1, 1563961513, 1565603113, 0, NULL, NULL, 'Cheque', 1564220713, 1, '0'),
(224, 'aut_869', NULL, 57, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 250, 0, 26, 60, 0, 1564134313, 1564652713, 1, NULL, NULL, 'Bank Deposit', 1563961513, 0, '0'),
(225, 'molestias_603', NULL, 60, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 890, 0, 0, 450, 1, 1564134313, 1564998313, 0, NULL, NULL, 'Bank Deposit', 1565862313, 0, '0'),
(226, 'et_150', NULL, 48, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 490, 0, 0, 230, 1, 1563961513, 1564825513, 0, NULL, NULL, 'Online', 1564220713, 1, '0'),
(227, 'nobis_348', 'Est delectus at ipsum consequatur necessitatibus voluptates reiciendis voluptate.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 950, 0, 0, 570, 1, 1564393513, 1564652713, 0, NULL, NULL, 'Card', 1563702313, 0, '0'),
(228, 'ea_870', NULL, 58, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 750, 0, 0, 90, 1, 1564566313, 1564739113, 0, NULL, NULL, 'Card', 1564479913, 1, '0'),
(229, 'et_515', 'Eos ratione eum qui sit recusandae est.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 610, 2, 0, 470, 0, 1563875113, 1564825513, 1, NULL, NULL, 'Online', 1563788713, 0, '0'),
(230, 'aspernatur_767', NULL, 71, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 110, 0, 7, 300, 0, 1564393513, 1564825513, 1, NULL, NULL, 'Online', 1565948713, 0, '0'),
(231, 'autem_935', 'Sapiente praesentium praesentium qui et doloribus tempore incidunt culpa.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 270, 0, 0, 920, 0, 1563702313, 1564739113, 1, NULL, NULL, 'Cash', 1565430313, 1, '0'),
(232, 'alias_794', 'Eius velit sunt culpa corporis totam vel.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 290, 45, 31, 180, 1, 1564566313, 1564739113, 0, NULL, NULL, 'Card', 1566207913, 0, '0'),
(233, 'nostrum_503', 'Id eos nostrum enim accusamus qui autem nobis et reiciendis minus.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 110, 0, 0, 800, 1, 1564566313, 1565430313, 0, NULL, NULL, 'Cheque', 1564307113, 1, '0'),
(234, 'nostrum_800', NULL, 54, '[{\"title\":\"Library fee\",\"amount\":\"500\"}]', 600, 0, 10, 520, 0, 1563961513, 1565343913, 0, NULL, NULL, 'Cheque', 1566207913, 0, '0'),
(235, 'voluptatem_528', NULL, 58, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 580, 0, 19, 580, 1, 1564479913, 1565775913, 0, NULL, NULL, 'Bank Deposit', 1565862313, 1, '0'),
(236, 'velit_376', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 290, 12, 41, 790, 0, 1564393513, 1566035113, 0, NULL, NULL, 'Online', 1565430313, 0, '0'),
(237, 'dolor_898', NULL, 58, '[{\"title\":\"Transport fee\",\"amount\":\"100\"}]', 160, 20, 0, 570, 0, 1564220713, 1564652713, 1, NULL, NULL, 'Online', 1565343913, 1, '0'),
(238, 'vitae_976', 'Amet quia dolor ea ut recusandae a placeat illo quod.', 71, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 640, 30, 49, 430, 1, 1563875113, 1565689513, 0, NULL, NULL, 'Card', 1565948713, 0, '0'),
(239, 'sit_450', 'Molestiae assumenda quaerat et et repellendus autem.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 580, 36, 0, 480, 1, 1564047913, 1564739113, 0, NULL, NULL, 'Cheque', 1564307113, 0, '0'),
(240, 'cumque_153', NULL, 55, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 440, 20, 0, 810, 1, 1564652713, 1564739113, 0, NULL, NULL, 'Online', 1565430313, 0, '0'),
(241, 'quaerat_171', 'Placeat dolore deserunt est perferendis.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 250, 0, 0, 700, 0, 1564220713, 1564998313, 0, NULL, NULL, 'Cash', 1564566313, 0, '0'),
(242, 'quod_865', 'Consequatur vitae accusamus accusamus molestiae.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 310, 0, 0, 1000, 1, 1564047913, 1565516713, 0, NULL, NULL, 'Card', 1565948713, 0, '0'),
(243, 'ut_867', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 110, 0, 0, 820, 0, 1564393513, 1564825513, 1, NULL, NULL, 'Online', 1563875113, 0, '0'),
(244, 'dolores_170', 'Placeat qui laboriosam iure quae saepe asperiores temporibus enim eos.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 320, 2, 0, 980, 1, 1564566313, 1565603113, 0, NULL, NULL, 'Cash', 1565343913, 0, '0'),
(245, 'eveniet_426', 'Eaque quia ipsam ipsam alias laudantium voluptatem optio molestiae.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 960, 0, 0, 330, 0, 1563875113, 1564825513, 1, NULL, NULL, 'Cash', 1563875113, 1, '0'),
(246, 'nostrum_350', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 870, 3, 34, 820, 1, 1564393513, 1564739113, 0, NULL, NULL, 'Cheque', 1565775913, 1, '0'),
(247, 'rerum_468', 'Voluptates ut labore sint culpa et saepe aut voluptatem.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 990, 0, 0, 800, 0, 1564479913, 1565775913, 0, NULL, NULL, 'Cash', 1564393513, 0, '0'),
(248, 'quam_992', 'Molestiae distinctio placeat aut fuga facilis et est maxime.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 320, 0, 32, 280, 1, 1563875113, 1564652713, 0, NULL, NULL, 'Card', 1563875113, 0, '0'),
(249, 'ipsa_488', 'Reprehenderit numquam minus veritatis quidem sed minus aperiam unde maiores.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 460, 43, 0, 90, 0, 1563702313, 1565516713, 0, NULL, NULL, 'Online', 1564566313, 1, '0'),
(250, 'facilis_863', NULL, 50, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 70, 0, 5, 350, 1, 1564479913, 1564739113, 0, NULL, NULL, 'Cheque', 1563788713, 1, '0'),
(251, 'quia_152', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 680, 16, 0, 870, 0, 1563788713, 1564739113, 1, NULL, NULL, 'Bank Deposit', 1565084713, 1, '0'),
(252, 'hic_650', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 570, 0, 0, 710, 0, 1564134313, 1564652713, 1, NULL, NULL, 'Cheque', 1566035113, 0, '0'),
(253, 'enim_240', 'Sit dolorem esse officia reiciendis rerum dolor sed perferendis.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 700, 5, 0, 520, 0, 1564566313, 1564739113, 1, NULL, NULL, 'Cheque', 1564566313, 1, '0'),
(254, 'non_784', 'Veniam qui rerum assumenda numquam et dolor animi.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 440, 0, 0, 680, 0, 1563788713, 1564825513, 1, NULL, NULL, 'Cash', 1565084713, 1, '0'),
(255, 'officiis_981', 'Dicta nihil repellendus non non iure sunt.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 910, 0, 0, 80, 1, 1563961513, 1564825513, 0, NULL, NULL, 'Online', 1563961513, 0, '0'),
(256, 'id_909', 'Eius qui blanditiis quis ut aut aut excepturi quam illo non.', 58, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 690, 0, 39, 730, 1, 1563615913, 1566035113, 0, NULL, NULL, 'Cheque', 1564652713, 1, '0'),
(257, 'voluptatum_584', 'Vel qui eos autem et nemo vitae.', 58, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 600, 44, 49, 880, 1, 1564047913, 1565516713, 0, NULL, NULL, 'Card', 1566121513, 1, '0'),
(258, 'sequi_513', 'Reiciendis pariatur ea quaerat iusto earum.', 48, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 310, 0, 2, 110, 0, 1563875113, 1564739113, 1, NULL, NULL, 'Bank Deposit', 1565775913, 0, '0'),
(259, 'qui_498', 'Ut repellat deserunt voluptatem placeat animi rerum voluptatem rerum et.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 940, 4, 15, 670, 0, 1564652713, 1564825513, 1, NULL, NULL, 'Cheque', 1564825513, 1, '0'),
(260, 'delectus_300', 'Velit blanditiis enim quia itaque eos.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 750, 14, 32, 670, 1, 1564134313, 1564739113, 0, NULL, NULL, 'Cheque', 1565084713, 1, '0'),
(261, 'quidem_823', 'Facere autem repellendus et quisquam voluptas quibusdam consequatur commodi quisquam est eos.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 940, 8, 0, 750, 0, 1563788714, 1564652714, 1, NULL, NULL, 'Bank Deposit', 1565430314, 1, '0'),
(262, 'saepe_988', 'At rerum error debitis ratione qui vitae dolores eos dolorem.', 46, '[{\"title\":\"Library fee\",\"amount\":\"300\"}]', 720, 19, 0, 640, 1, 1563788714, 1564739114, 0, NULL, NULL, 'Card', 1565689514, 1, '0'),
(263, 'et_953', NULL, 55, '[{\"title\":\"Building fee\",\"amount\":\"200\"}]', 290, 0, 32, 410, 0, 1564566314, 1565430314, 0, NULL, NULL, 'Bank Deposit', 1563702314, 0, '0'),
(264, 'sunt_868', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 220, 49, 0, 850, 1, 1563702314, 1564825514, 0, NULL, NULL, 'Cheque', 1563702314, 1, '0'),
(265, 'provident_123', 'Et unde veniam et cum recusandae cumque molestias eveniet.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 980, 0, 40, 670, 0, 1564220714, 1565084714, 0, NULL, NULL, 'Cash', 1565430314, 1, '0'),
(266, 'quibusdam_422', NULL, 58, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 930, 17, 0, 400, 0, 1563702314, 1564739114, 1, NULL, NULL, 'Online', 1565862314, 0, '0'),
(267, 'ratione_506', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 650, 0, 0, 850, 0, 1564479914, 1564825514, 1, NULL, NULL, 'Bank Deposit', 1565257514, 0, '0'),
(268, 'hic_943', 'Dolores odio ut voluptatem pariatur omnis sed et temporibus a non.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 300, 0, 0, 770, 1, 1564393514, 1565257514, 0, NULL, NULL, 'Bank Deposit', 1564134314, 0, '0'),
(269, 'dignissimos_116', NULL, 48, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 260, 0, 16, 640, 1, 1564393514, 1564998314, 0, NULL, NULL, 'Online', 1564307114, 1, '0'),
(270, 'totam_355', 'Nemo veritatis omnis sed tenetur saepe necessitatibus sed aut.', 55, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 430, 0, 0, 90, 1, 1564307114, 1564739114, 0, NULL, NULL, 'Bank Deposit', 1565862314, 0, '0'),
(271, 'quia_206', 'Enim molestias non soluta illo expedita nesciunt.', 67, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 270, 47, 0, 420, 0, 1563615914, 1565862314, 0, NULL, NULL, 'Card', 1565343914, 1, '0'),
(272, 'quisquam_493', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 780, 29, 22, 500, 0, 1563788714, 1564739114, 1, NULL, NULL, 'Bank Deposit', 1565603114, 1, '0'),
(273, 'accusantium_303', 'Officia ea suscipit quod beatae.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 290, 23, 2, 790, 1, 1563961514, 1564652714, 0, NULL, NULL, 'Cash', 1563961514, 0, '0'),
(274, 'id_712', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 520, 0, 7, 210, 1, 1563961514, 1565516714, 0, NULL, NULL, 'Card', 1563875114, 0, '0'),
(275, 'ducimus_217', 'Quod dolores quaerat qui voluptas odio dolorum expedita consequatur inventore voluptas.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 690, 28, 35, 820, 1, 1564220714, 1564998314, 0, NULL, NULL, 'Bank Deposit', 1563961514, 0, '0'),
(276, 'ipsa_514', NULL, 67, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 570, 0, 25, 50, 1, 1563875114, 1566035114, 0, NULL, NULL, 'Bank Deposit', 1565689514, 1, '0'),
(277, 'porro_613', NULL, 63, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 50, 0, 17, 530, 0, 1563788714, 1564739114, 1, NULL, NULL, 'Cash', 1564134314, 0, '0'),
(278, 'sequi_606', 'Vel ex eum incidunt ut vel.', 63, '[{\"title\":\"Library fee\",\"amount\":\"800\"}]', 240, 16, 8, 570, 1, 1563702314, 1564739114, 0, NULL, NULL, 'Cash', 1565516714, 0, '0'),
(279, 'dignissimos_124', 'In numquam saepe molestiae et dolorum praesentium.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 650, 26, 0, 390, 0, 1563875114, 1565516714, 0, NULL, NULL, 'Card', 1564998314, 0, '0'),
(280, 'explicabo_485', 'Quos suscipit et earum facere assumenda.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 590, 24, 21, 590, 0, 1564566314, 1564652714, 1, NULL, NULL, 'Cash', 1563788714, 0, '0'),
(281, 'maiores_907', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 100, 0, 0, 290, 1, 1564220714, 1564739114, 0, NULL, NULL, 'Cash', 1563702314, 1, '0'),
(282, 'eum_841', NULL, 67, ']', 470, 0, 1, 510, 1, 1563788714, 1564739114, 0, NULL, NULL, 'Cheque', 1565343914, 1, '0'),
(283, 'temporibus_243', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 220, 0, 0, 110, 0, 1563961514, 1564739114, 1, NULL, NULL, 'Bank Deposit', 1565516714, 0, '0'),
(284, 'iusto_488', 'Similique perferendis perspiciatis enim consequatur nostrum necessitatibus incidunt quaerat ut omnis.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 620, 0, 0, 870, 0, 1564220714, 1564825514, 1, NULL, NULL, 'Cheque', 1565948714, 0, '0'),
(285, 'quibusdam_597', NULL, 54, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 700, 0, 0, 60, 0, 1564134314, 1564652714, 1, NULL, NULL, 'Online', 1565171114, 0, '0'),
(286, 'quia_548', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 250, 3, 0, 500, 0, 1564047914, 1565603114, 0, NULL, NULL, 'Online', 1565516714, 0, '0'),
(287, 'exercitationem_144', 'Voluptatum vitae eum laudantium non aut totam.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 300, 0, 0, 970, 1, 1563788714, 1564652714, 0, NULL, NULL, 'Card', 1565603114, 1, '0'),
(288, 'delectus_164', 'Rerum velit et similique cumque quasi quae dolores nihil quasi.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 500, 22, 0, 660, 0, 1563788714, 1565343914, 0, NULL, NULL, 'Online', 1563702314, 0, '0'),
(289, 'beatae_608', NULL, 48, '[{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 550, 0, 30, 670, 0, 1563615914, 1564739114, 1, NULL, NULL, 'Cash', 1563961514, 0, '0'),
(290, 'fuga_508', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 810, 0, 0, 440, 1, 1564047914, 1564825514, 0, NULL, NULL, 'Card', 1563875114, 0, '0'),
(291, 'labore_523', 'Libero ex alias accusantium consequuntur aspernatur numquam minus magni omnis.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 190, 38, 0, 680, 1, 1564134314, 1564652714, 0, NULL, NULL, 'Cash', 1565084714, 0, '0'),
(292, 'illum_755', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 660, 0, 0, 190, 0, 1564307114, 1565343914, 0, NULL, NULL, 'Online', 1563961514, 0, '0'),
(293, 'molestias_990', NULL, 60, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 120, 22, 27, 730, 1, 1563615914, 1565948714, 0, NULL, NULL, 'Cash', 1565775914, 0, '0'),
(294, 'facilis_775', 'Ut recusandae magni vero ut voluptatem consequatur consequatur molestiae.', 67, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 900, 0, 0, 540, 0, 1563788714, 1565343914, 0, NULL, NULL, 'Cash', 1565948714, 0, '0'),
(295, 'commodi_222', NULL, 46, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 250, 0, 1, 270, 1, 1564220714, 1564652714, 0, NULL, NULL, 'Online', 1564825514, 0, '0'),
(296, 'omnis_555', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 700, 34, 48, 180, 0, 1564393514, 1564739114, 1, NULL, NULL, 'Card', 1563875114, 1, '0'),
(297, 'reiciendis_112', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 920, 41, 46, 380, 0, 1564566314, 1564998314, 0, NULL, NULL, 'Cash', 1564566314, 1, '0'),
(298, 'consectetur_346', 'Porro corrupti perspiciatis minus ipsum ex sapiente dolorem.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 650, 0, 45, 100, 1, 1563615914, 1565948714, 0, NULL, NULL, 'Cash', 1565343914, 1, '0'),
(299, 'harum_510', NULL, 67, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 440, 14, 3, 100, 1, 1564134314, 1564739114, 0, NULL, NULL, 'Card', 1565948714, 0, '0'),
(300, 'repellendus_440', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 790, 11, 0, 930, 1, 1563615914, 1565343914, 0, NULL, NULL, 'Card', 1565171114, 1, '0'),
(301, 'ut_270', 'Excepturi consequatur in dolor delectus odit magnam quis repudiandae officia ab exercitationem.', 48, '[{\"title\":\"Library fee\",\"amount\":\"400\"}]', 910, 28, 26, 460, 0, 1564220714, 1564739114, 1, NULL, NULL, 'Cash', 1565516714, 0, '0'),
(302, 'eveniet_233', 'Inventore rem dolorem saepe debitis iste nobis dolorum esse facilis.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 650, 10, 40, 890, 0, 1563615914, 1564652714, 1, NULL, NULL, 'Cash', 1565084714, 1, '0'),
(303, 'aut_179', 'Quam asperiores officiis tenetur quo velit aliquid.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 770, 0, 0, 680, 1, 1563961514, 1565343914, 0, NULL, NULL, 'Bank Deposit', 1565171114, 1, '0'),
(304, 'dolor_365', 'Magni qui libero fugit corporis voluptatibus consequatur.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 470, 0, 48, 670, 0, 1564566315, 1565430315, 0, NULL, NULL, 'Cheque', 1565516715, 0, '0'),
(305, 'et_842', 'Velit aspernatur a ipsum sit non fugiat.', 63, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 890, 0, 27, 600, 1, 1564393515, 1565343915, 0, NULL, NULL, 'Card', 1565689515, 0, '0'),
(306, 'eum_949', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 710, 7, 17, 100, 1, 1563615915, 1564652715, 0, NULL, NULL, 'Cash', 1565603115, 1, '0'),
(307, 'qui_321', 'Et accusamus eum asperiores natus nihil laudantium modi rerum magni.', 51, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 290, 0, 0, 650, 1, 1563702315, 1566207915, 0, NULL, NULL, 'Card', 1564825515, 0, '0'),
(308, 'facere_635', 'Tempora aut sed nesciunt molestiae animi voluptatem.', 46, ']', 80, 17, 1, 890, 0, 1564047915, 1564739115, 1, NULL, NULL, 'Online', 1565171115, 1, '0'),
(309, 'aut_450', 'Soluta est aut corporis ea recusandae praesentium assumenda quae sint.', 59, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 310, 0, 0, 920, 0, 1563788715, 1566035115, 0, NULL, NULL, 'Online', 1565862315, 0, '0'),
(310, 'deserunt_750', 'Itaque harum dicta sed et ut suscipit ut quos ut deserunt.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 950, 0, 27, 950, 0, 1564220715, 1565257515, 0, NULL, NULL, 'Online', 1565430315, 0, '0'),
(311, 'qui_293', 'Non est et quo maiores officiis explicabo consequatur sint aliquid.', 57, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 860, 35, 32, 960, 1, 1563961515, 1566121515, 0, NULL, NULL, 'Card', 1563961515, 1, '0'),
(312, 'optio_146', 'Id voluptatibus cupiditate reprehenderit sed facilis quod amet eveniet exercitationem quam.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 720, 24, 35, 220, 0, 1564134315, 1565516715, 0, NULL, NULL, 'Card', 1563788715, 1, '0'),
(313, 'omnis_106', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 310, 0, 0, 920, 0, 1563961515, 1565948715, 0, NULL, NULL, 'Bank Deposit', 1563788715, 1, '0'),
(314, 'aspernatur_201', NULL, 60, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 730, 0, 20, 410, 0, 1563702315, 1565689515, 0, NULL, NULL, 'Cash', 1565689515, 1, '0'),
(315, 'magni_397', 'Qui eos fugit ut laborum quos nihil nostrum ea.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 580, 22, 0, 970, 0, 1564652715, 1565862315, 0, NULL, NULL, 'Bank Deposit', 1563875115, 1, '0'),
(316, 'similique_324', 'Minus eius vero quia tenetur possimus.', 63, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 960, 0, 15, 330, 1, 1564047915, 1565084715, 0, NULL, NULL, 'Cheque', 1566035115, 0, '0'),
(317, 'vitae_766', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 390, 25, 0, 580, 1, 1563702315, 1564652715, 0, NULL, NULL, 'Online', 1564220715, 1, '0'),
(318, 'nemo_375', NULL, 71, '[{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 290, 46, 0, 210, 0, 1563961515, 1564652715, 1, NULL, NULL, 'Card', 1565689515, 0, '0'),
(319, 'rerum_407', 'Ex laboriosam nulla tempore qui qui nemo.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 440, 0, 24, 570, 0, 1564566315, 1565948715, 0, NULL, NULL, 'Cash', 1565257515, 1, '0'),
(320, 'assumenda_944', 'Molestiae tenetur reprehenderit beatae dolores ratione est.', 54, '[{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 180, 12, 12, 290, 0, 1564307115, 1565862315, 0, NULL, NULL, 'Online', 1564566315, 1, '0'),
(321, 'vero_636', 'Dolor explicabo minus eius suscipit earum provident.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 830, 25, 0, 540, 1, 1564220715, 1564825515, 0, NULL, NULL, 'Bank Deposit', 1564307115, 0, '0'),
(322, 'quod_145', NULL, 63, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 600, 2, 0, 660, 1, 1564652715, 1564825515, 0, NULL, NULL, 'Online', 1564134315, 0, '0'),
(323, 'culpa_188', 'Facere aut dolor qui sit ea architecto.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 630, 41, 5, 140, 0, 1563702315, 1565257515, 0, NULL, NULL, 'Cash', 1564479915, 1, '0'),
(324, 'exercitationem_364', 'Neque sapiente eveniet incidunt deserunt veritatis.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 840, 29, 20, 860, 1, 1564479915, 1565516715, 0, NULL, NULL, 'Cash', 1565603115, 0, '0'),
(325, 'culpa_379', 'Ut veniam error voluptatem harum deleniti ipsa voluptatum ut ut.', 55, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 390, 45, 0, 350, 1, 1563615915, 1566207915, 0, NULL, NULL, 'Bank Deposit', 1565862315, 0, '0'),
(326, 'optio_881', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 120, 9, 24, 680, 0, 1563788715, 1565948715, 0, NULL, NULL, 'Bank Deposit', 1564134315, 1, '0'),
(327, 'rerum_456', 'In iure numquam similique iste dolorem maiores quos corporis.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 170, 49, 0, 200, 1, 1563961515, 1565948715, 0, NULL, NULL, 'Cheque', 1565775915, 0, '0'),
(328, 'et_354', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 140, 1, 0, 200, 0, 1563961515, 1566207915, 0, NULL, NULL, 'Bank Deposit', 1564307115, 1, '0'),
(329, 'aut_466', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 280, 0, 48, 230, 1, 1564566315, 1566207915, 0, NULL, NULL, 'Online', 1564739115, 1, '0'),
(330, 'aut_499', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 460, 13, 37, 730, 1, 1564307115, 1564825515, 0, NULL, NULL, 'Online', 1564047915, 1, '0'),
(331, 'consequatur_408', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 760, 33, 48, 690, 0, 1564479915, 1566121515, 0, NULL, NULL, 'Card', 1564825515, 1, '0'),
(332, 'quisquam_183', 'Eum sit animi exercitationem sint et.', 59, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 170, 0, 33, 870, 0, 1564393515, 1565343915, 0, NULL, NULL, 'Bank Deposit', 1565775915, 1, '0'),
(333, 'nam_807', 'Dolorum rem dolorem illo consequatur aliquam et et dicta sed mollitia.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 710, 46, 0, 400, 0, 1564566315, 1564825515, 1, NULL, NULL, 'Cheque', 1563702315, 0, '0'),
(334, 'repellendus_394', 'Inventore rerum est aspernatur nam quia qui alias.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 80, 0, 0, 820, 0, 1564307115, 1564652715, 1, NULL, NULL, 'Cheque', 1564998315, 0, '0'),
(335, 'dolore_192', 'Vel nisi et est ipsam eos laborum a ut ullam.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 970, 0, 0, 820, 1, 1564566315, 1564998315, 0, NULL, NULL, 'Bank Deposit', 1566207915, 0, '0'),
(336, 'quos_959', NULL, 58, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 630, 0, 8, 710, 1, 1563875115, 1564825515, 0, NULL, NULL, 'Bank Deposit', 1565775915, 0, '0'),
(337, 'deleniti_727', NULL, 57, '[{\"title\":\"Building fee\",\"amount\":\"400\"}]', 420, 33, 0, 720, 1, 1563702315, 1565775915, 0, NULL, NULL, 'Cash', 1564134315, 0, '0'),
(338, 'beatae_119', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 700, 23, 28, 380, 1, 1564393515, 1564825515, 0, NULL, NULL, 'Cheque', 1566207915, 0, '0'),
(339, 'atque_728', NULL, 67, '[{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 570, 0, 0, 360, 0, 1564566315, 1564739115, 1, NULL, NULL, 'Cheque', 1564652715, 1, '0'),
(340, 'accusamus_195', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"500\"}]', 120, 0, 0, 120, 1, 1563702315, 1566035115, 0, NULL, NULL, 'Cheque', 1564479915, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(341, 'consequatur_562', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 890, 0, 0, 810, 0, 1563788715, 1564652715, 1, NULL, NULL, 'Card', 1564998315, 1, '0'),
(342, 'earum_913', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 400, 28, 32, 890, 0, 1564220716, 1564739116, 1, NULL, NULL, 'Card', 1566207916, 1, '0'),
(343, 'voluptates_367', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 560, 15, 0, 140, 0, 1564479916, 1565084716, 0, NULL, NULL, 'Card', 1565343916, 0, '0'),
(344, 'nobis_504', 'Ipsa cupiditate quasi neque quos sunt.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 230, 27, 22, 270, 1, 1563961516, 1565516716, 0, NULL, NULL, 'Card', 1566121516, 0, '0'),
(345, 'eligendi_728', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 880, 2, 48, 860, 1, 1563875116, 1566121516, 0, NULL, NULL, 'Cheque', 1564047916, 1, '0'),
(346, 'quidem_950', NULL, 58, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 60, 0, 0, 930, 1, 1564393516, 1566035116, 0, NULL, NULL, 'Online', 1565171116, 0, '0'),
(347, 'repellendus_241', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 800, 15, 0, 640, 1, 1564393516, 1565257516, 0, NULL, NULL, 'Online', 1565948716, 0, '0'),
(348, 'et_527', 'Voluptatem laudantium deleniti fugiat ut ut iure rerum.', 71, '[{\"title\":\"Library fee\",\"amount\":\"100\"}]', 430, 0, 5, 700, 0, 1564220716, 1565948716, 0, NULL, NULL, 'Bank Deposit', 1565171116, 1, '0'),
(349, 'fuga_997', 'Dolorem debitis sint explicabo molestiae dolore officiis explicabo est veniam ut.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 400, 0, 17, 610, 1, 1563615916, 1564739116, 0, NULL, NULL, 'Cheque', 1565516716, 0, '0'),
(350, 'quidem_902', NULL, 46, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 300, 0, 0, 50, 1, 1563702316, 1565603116, 0, NULL, NULL, 'Card', 1565689516, 0, '0'),
(351, 'sint_992', 'Doloremque velit maiores provident est quaerat.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 310, 34, 0, 690, 1, 1564393516, 1565171116, 0, NULL, NULL, 'Cheque', 1564479916, 1, '0'),
(352, 'quia_121', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 570, 0, 0, 260, 0, 1564652716, 1566121516, 0, NULL, NULL, 'Cheque', 1564047916, 1, '0'),
(353, 'alias_820', 'Consequuntur quo libero consectetur natus qui aut minima repudiandae.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 620, 0, 0, 970, 1, 1564134316, 1566121516, 0, NULL, NULL, 'Card', 1564998316, 1, '0'),
(354, 'ea_450', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 540, 0, 0, 210, 1, 1563788716, 1565948716, 0, NULL, NULL, 'Online', 1566121516, 0, '0'),
(355, 'exercitationem_914', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 60, 0, 20, 680, 1, 1564134316, 1564739116, 0, NULL, NULL, 'Card', 1563788716, 1, '0'),
(356, 'unde_776', 'Aut ut aut consequatur sit quibusdam similique saepe dolorem fugit.', 59, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 310, 0, 9, 770, 0, 1563875116, 1564825516, 1, NULL, NULL, 'Online', 1564739116, 1, '0'),
(357, 'est_755', NULL, 52, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 340, 8, 0, 740, 1, 1564047916, 1564825516, 0, NULL, NULL, 'Bank Deposit', 1564134316, 0, '0'),
(358, 'soluta_930', 'Vel voluptatibus incidunt maiores unde minus non rerum voluptatem voluptas harum.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 770, 0, 26, 540, 1, 1564479916, 1565948716, 0, NULL, NULL, 'Online', 1565948716, 0, '0'),
(359, 'quia_868', 'Sit iure rerum autem sed sequi neque amet.', 58, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 90, 0, 19, 670, 0, 1564566316, 1566207916, 0, NULL, NULL, 'Bank Deposit', 1564393516, 0, '0'),
(360, 'veritatis_532', 'Alias corrupti consequatur numquam et rerum necessitatibus.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 790, 0, 41, 280, 1, 1564479916, 1565257516, 0, NULL, NULL, 'Card', 1564134316, 0, '0'),
(361, 'sapiente_703', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 170, 18, 0, 630, 1, 1564047916, 1564739116, 0, NULL, NULL, 'Bank Deposit', 1564134316, 0, '0'),
(362, 'odit_838', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 720, 24, 20, 750, 1, 1564220716, 1565689516, 0, NULL, NULL, 'Card', 1565862316, 0, '0'),
(363, 'eaque_330', 'Libero quia ea qui eum sapiente.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"}]', 620, 38, 0, 410, 0, 1563788716, 1564825516, 1, NULL, NULL, 'Card', 1563615916, 1, '0'),
(364, 'sint_683', 'Nostrum non voluptas fugit soluta provident quibusdam omnis quo aut dolorem.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 90, 0, 4, 530, 0, 1564134316, 1565516716, 0, NULL, NULL, 'Card', 1565171116, 0, '0'),
(365, 'et_446', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 410, 23, 40, 360, 1, 1564134316, 1564739116, 0, NULL, NULL, 'Online', 1565257516, 1, '0'),
(366, 'molestias_842', 'Sit non animi consectetur omnis unde quasi est pariatur distinctio sed.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 230, 0, 0, 290, 1, 1564652716, 1566035116, 0, NULL, NULL, 'Card', 1564307116, 0, '0'),
(367, 'vel_265', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 520, 0, 39, 630, 0, 1563702316, 1564825516, 1, NULL, NULL, 'Bank Deposit', 1565343916, 0, '0'),
(368, 'sunt_735', 'Sit provident pariatur id nam quae.', 63, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 90, 35, 46, 990, 0, 1564047916, 1564825516, 1, NULL, NULL, 'Bank Deposit', 1564998316, 1, '0'),
(369, 'optio_974', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 450, 37, 34, 760, 0, 1564393516, 1566121516, 0, NULL, NULL, 'Cash', 1564393516, 1, '0'),
(370, 'vero_663', 'Nisi est dolorem assumenda repellendus consequatur dolores.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 250, 4, 0, 980, 0, 1564479916, 1565516716, 0, NULL, NULL, 'Cash', 1564047916, 1, '0'),
(371, 'autem_633', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 710, 0, 37, 310, 1, 1563961516, 1564825516, 0, NULL, NULL, 'Cash', 1564825516, 1, '0'),
(372, 'vel_244', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 920, 0, 0, 340, 1, 1564393516, 1564652716, 0, NULL, NULL, 'Bank Deposit', 1565343916, 0, '0'),
(373, 'quia_168', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 370, 0, 43, 830, 1, 1564566316, 1565775916, 0, NULL, NULL, 'Cheque', 1564825516, 1, '0'),
(374, 'aliquid_828', 'Saepe sed ut amet nihil voluptate.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 120, 6, 31, 240, 1, 1563875116, 1566035116, 0, NULL, NULL, 'Cash', 1565084716, 0, '0'),
(375, 'illo_773', 'Amet illo non deserunt fugit et.', 71, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 680, 28, 22, 640, 1, 1564393516, 1564739116, 0, NULL, NULL, 'Cheque', 1563615916, 0, '0'),
(376, 'nobis_667', 'Laborum qui dolorem ipsum dolorem qui eos.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 440, 26, 0, 410, 1, 1563615916, 1564998316, 0, NULL, NULL, 'Cash', 1565948716, 1, '0'),
(377, 'quidem_324', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 640, 35, 37, 550, 1, 1564566316, 1564652716, 0, NULL, NULL, 'Bank Deposit', 1564134316, 0, '0'),
(378, 'et_920', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 390, 7, 13, 770, 1, 1564479916, 1564825516, 0, NULL, NULL, 'Bank Deposit', 1564566316, 0, '0'),
(379, 'suscipit_843', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 910, 0, 44, 150, 1, 1564566316, 1565430316, 0, NULL, NULL, 'Card', 1564739116, 1, '0'),
(380, 'voluptatem_829', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 160, 11, 0, 60, 1, 1563702316, 1564825516, 0, NULL, NULL, 'Cash', 1564739116, 0, '0'),
(381, 'assumenda_500', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 640, 0, 0, 230, 1, 1564393516, 1564652716, 0, NULL, NULL, 'Cheque', 1565257516, 1, '0'),
(382, 'et_600', 'Et tenetur molestias iste inventore consequatur veritatis.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 140, 0, 25, 970, 0, 1564307116, 1564825516, 1, NULL, NULL, 'Cash', 1565516716, 1, '0'),
(383, 'vel_806', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 580, 0, 4, 220, 1, 1563961516, 1564825516, 0, NULL, NULL, 'Cash', 1564479916, 1, '0'),
(384, 'harum_354', NULL, 59, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 130, 0, 0, 780, 0, 1564134316, 1566035116, 0, NULL, NULL, 'Online', 1566035116, 0, '0'),
(385, 'qui_581', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"600\"}]', 80, 43, 0, 130, 1, 1563875117, 1564739117, 0, NULL, NULL, 'Cheque', 1565516717, 1, '0'),
(386, 'quas_181', 'Asperiores rerum consequatur commodi ut explicabo.', 48, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 610, 0, 32, 780, 1, 1563788717, 1566207917, 0, NULL, NULL, 'Cash', 1564652717, 0, '0'),
(387, 'nobis_189', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 720, 0, 46, 790, 0, 1564134317, 1566035117, 0, NULL, NULL, 'Cash', 1564825517, 0, '0'),
(388, 'hic_298', 'Rem sed laboriosam aliquid qui qui eius adipisci modi ea.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 820, 0, 0, 1000, 1, 1564479917, 1564652717, 0, NULL, NULL, 'Bank Deposit', 1564652717, 0, '0'),
(389, 'quod_532', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 730, 0, 0, 590, 0, 1563615917, 1564825517, 1, NULL, NULL, 'Cash', 1565343917, 1, '0'),
(390, 'modi_947', NULL, 63, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 920, 44, 39, 900, 1, 1564566317, 1565343917, 0, NULL, NULL, 'Cheque', 1565257517, 0, '0'),
(391, 'ipsam_882', 'Est itaque dolorum cum quam.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 530, 0, 0, 120, 1, 1563875117, 1565257517, 0, NULL, NULL, 'Card', 1565948717, 0, '0'),
(392, 'autem_211', NULL, 55, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 760, 4, 0, 300, 0, 1564307117, 1564652717, 1, NULL, NULL, 'Cheque', 1564134317, 1, '0'),
(393, 'qui_649', 'Architecto ipsum velit ipsum repudiandae qui totam aut qui.', 56, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 200, 18, 5, 610, 0, 1564047917, 1565430317, 0, NULL, NULL, 'Cash', 1565343917, 1, '0'),
(394, 'cum_131', 'Dolores quam dolores minus expedita.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 390, 45, 0, 350, 1, 1564393517, 1564739117, 0, NULL, NULL, 'Card', 1563702317, 0, '0'),
(395, 'dignissimos_268', 'Eligendi id sint voluptatum beatae occaecati quasi error.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 360, 0, 30, 570, 0, 1564134317, 1564825517, 1, NULL, NULL, 'Bank Deposit', 1563788717, 1, '0'),
(396, 'itaque_621', NULL, 60, ']', 490, 43, 0, 780, 1, 1563788717, 1566035117, 0, NULL, NULL, 'Online', 1563788717, 1, '0'),
(397, 'impedit_481', 'Dolor omnis sint ipsam dolores non error.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 910, 0, 13, 120, 1, 1563615917, 1565171117, 0, NULL, NULL, 'Bank Deposit', 1564825517, 0, '0'),
(398, 'voluptates_438', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 290, 0, 8, 710, 1, 1563788717, 1564825517, 0, NULL, NULL, 'Card', 1564566317, 0, '0'),
(399, 'minima_967', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 120, 48, 36, 520, 0, 1564220717, 1565689517, 0, NULL, NULL, 'Bank Deposit', 1564652717, 0, '0'),
(400, 'aperiam_572', NULL, 60, '[{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 210, 25, 20, 80, 0, 1564220717, 1565343917, 0, NULL, NULL, 'Card', 1565257517, 1, '0'),
(401, 'iste_914', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 450, 0, 34, 670, 1, 1564307117, 1564652717, 0, NULL, NULL, 'Bank Deposit', 1564739117, 0, '0'),
(402, 'sit_456', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 60, 42, 29, 510, 0, 1563702317, 1565343917, 0, NULL, NULL, 'Cash', 1564307117, 1, '0'),
(403, 'non_146', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 830, 22, 1, 240, 1, 1564566317, 1566121517, 0, NULL, NULL, 'Cheque', 1564825517, 1, '0'),
(404, 'reprehenderit_543', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 250, 0, 0, 730, 0, 1563961517, 1565257517, 0, NULL, NULL, 'Online', 1564220717, 1, '0'),
(405, 'molestiae_477', 'Dolor dolor quis eum officia voluptas esse.', 71, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 720, 0, 0, 240, 1, 1563788717, 1564652717, 0, NULL, NULL, 'Card', 1565689517, 0, '0'),
(406, 'ab_436', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 700, 37, 0, 730, 1, 1563702317, 1565689517, 0, NULL, NULL, 'Bank Deposit', 1564825517, 1, '0'),
(407, 'dolorem_664', 'Praesentium fugiat aliquid non aut quidem tempora aut est.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 280, 18, 0, 640, 1, 1563702317, 1564825517, 0, NULL, NULL, 'Bank Deposit', 1565084717, 0, '0'),
(408, 'omnis_646', 'Dolores vero suscipit rerum nihil minus atque libero.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 270, 0, 39, 500, 1, 1564566317, 1564739117, 0, NULL, NULL, 'Cheque', 1565689517, 0, '0'),
(409, 'quam_825', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"300\"}]', 460, 34, 1, 960, 1, 1564134317, 1564825517, 0, NULL, NULL, 'Cash', 1563875117, 1, '0'),
(410, 'deserunt_206', 'Eum sunt id eum hic nesciunt.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 580, 0, 0, 620, 0, 1563615917, 1565689517, 0, NULL, NULL, 'Card', 1564393517, 1, '0'),
(411, 'cumque_751', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 900, 0, 0, 190, 0, 1563615917, 1565516717, 0, NULL, NULL, 'Cash', 1563702317, 0, '0'),
(412, 'rerum_312', 'Qui numquam aperiam quas occaecati facilis esse enim sapiente animi quod est.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 770, 0, 38, 230, 1, 1564393517, 1564825517, 0, NULL, NULL, 'Card', 1563702317, 0, '0'),
(413, 'pariatur_805', 'Ipsum esse voluptatem modi cumque quas.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 530, 0, 25, 650, 0, 1564220717, 1564825517, 1, NULL, NULL, 'Cheque', 1564047917, 1, '0'),
(414, 'provident_337', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 660, 0, 44, 310, 0, 1564393517, 1565775917, 0, NULL, NULL, 'Cheque', 1565171117, 1, '0'),
(415, 'minima_348', 'Optio cupiditate expedita nesciunt nulla qui ipsam et architecto assumenda.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 990, 0, 3, 640, 0, 1564220717, 1564652717, 1, NULL, NULL, 'Bank Deposit', 1565084717, 0, '0'),
(416, 'iste_848', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 560, 40, 3, 210, 0, 1563788717, 1565948717, 0, NULL, NULL, 'Cash', 1564652717, 0, '0'),
(417, 'quia_275', 'Ea sapiente reiciendis voluptas omnis maiores ad soluta.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 80, 48, 0, 350, 1, 1563615917, 1564998317, 0, NULL, NULL, 'Cheque', 1564739117, 0, '0'),
(418, 'est_108', 'Ipsam rerum quod sed voluptatem molestiae animi quod odit.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 340, 10, 14, 420, 0, 1564652717, 1564825517, 1, NULL, NULL, 'Bank Deposit', 1563961517, 0, '0'),
(419, 'vel_696', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 910, 0, 0, 710, 0, 1564479917, 1564739117, 1, NULL, NULL, 'Cash', 1564307117, 0, '0'),
(420, 'illum_380', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"}]', 860, 0, 0, 90, 1, 1563788717, 1564652717, 0, NULL, NULL, 'Cash', 1564566317, 1, '0'),
(421, 'qui_800', 'Voluptate minima sit quia doloribus voluptatem ratione quo vel est numquam.', 71, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 860, 3, 31, 400, 0, 1563615917, 1564652717, 1, NULL, NULL, 'Cheque', 1564998317, 0, '0'),
(422, 'officiis_329', 'Accusamus unde adipisci officia quasi perspiciatis sit quis odio vel a.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 460, 0, 0, 960, 0, 1564566317, 1564998317, 0, NULL, NULL, 'Online', 1563615917, 0, '0'),
(423, 'et_715', 'Facilis aperiam nobis expedita reiciendis nisi dolorem voluptas exercitationem.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 650, 0, 48, 430, 0, 1564479917, 1565257517, 0, NULL, NULL, 'Cheque', 1565516717, 1, '0'),
(424, 'expedita_975', 'Praesentium fugiat quidem aliquam minima quo maxime.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 150, 26, 2, 970, 1, 1563702318, 1564998318, 0, NULL, NULL, 'Cheque', 1564825518, 1, '0'),
(425, 'expedita_657', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 60, 0, 18, 920, 1, 1564134318, 1564825518, 0, NULL, NULL, 'Cheque', 1565689518, 1, '0'),
(426, 'qui_436', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 450, 0, 47, 900, 1, 1563788718, 1564998318, 0, NULL, NULL, 'Bank Deposit', 1566035118, 0, '0'),
(427, 'maiores_383', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 960, 17, 28, 630, 0, 1563788718, 1565257518, 0, NULL, NULL, 'Cheque', 1565084718, 0, '0'),
(428, 'alias_832', 'Placeat minus minima officiis est ea id incidunt.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 700, 0, 0, 470, 0, 1564566318, 1564652718, 1, NULL, NULL, 'Card', 1565689518, 0, '0'),
(429, 'odio_133', 'Ut voluptatem neque sunt quia sed voluptatem doloribus qui omnis.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 350, 40, 32, 650, 1, 1564307118, 1565343918, 0, NULL, NULL, 'Online', 1564307118, 1, '0'),
(430, 'facere_742', NULL, 71, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 550, 49, 15, 770, 1, 1563615918, 1564825518, 0, NULL, NULL, 'Cheque', 1565948718, 1, '0'),
(431, 'repudiandae_539', 'Sed nostrum est modi et ut quia consectetur atque quis.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 920, 0, 0, 940, 1, 1564307118, 1564739118, 0, NULL, NULL, 'Cash', 1565603118, 0, '0'),
(432, 'et_859', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 500, 0, 0, 140, 1, 1564652718, 1564739118, 0, NULL, NULL, 'Cheque', 1564652718, 0, '0'),
(433, 'vel_870', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"800\"}]', 840, 34, 33, 300, 1, 1563615918, 1564825518, 0, NULL, NULL, 'Card', 1563615918, 1, '0'),
(434, 'ea_346', 'Asperiores iste porro quidem eum doloribus saepe quia amet.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 550, 38, 27, 980, 1, 1563788718, 1566207918, 0, NULL, NULL, 'Card', 1565775918, 0, '0'),
(435, 'inventore_692', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 220, 0, 26, 240, 1, 1564134318, 1565430318, 0, NULL, NULL, 'Card', 1566035118, 0, '0'),
(436, 'similique_601', 'Aperiam dolor eum voluptas incidunt est.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 200, 0, 0, 890, 1, 1563961518, 1565516718, 0, NULL, NULL, 'Bank Deposit', 1565257518, 1, '0'),
(437, 'officiis_716', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 740, 35, 12, 470, 1, 1564652718, 1564652718, 0, NULL, NULL, 'Card', 1564393518, 0, '0'),
(438, 'numquam_908', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 180, 0, 5, 480, 1, 1564220718, 1564652718, 0, NULL, NULL, 'Online', 1564047918, 1, '0'),
(439, 'eaque_916', 'Maiores ea enim ut molestiae reprehenderit voluptatem ipsam dignissimos magnam.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 140, 31, 28, 680, 0, 1564652718, 1564652718, 1, NULL, NULL, 'Bank Deposit', 1565862318, 1, '0'),
(440, 'accusamus_724', 'Molestiae occaecati ratione expedita alias perspiciatis amet aspernatur.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 250, 5, 0, 500, 1, 1564652718, 1565603118, 0, NULL, NULL, 'Bank Deposit', 1564479918, 0, '0'),
(441, 'rerum_764', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 150, 0, 49, 960, 0, 1564220718, 1565862318, 0, NULL, NULL, 'Cash', 1565430318, 0, '0'),
(442, 'qui_899', 'Excepturi ex reiciendis ab voluptatum qui natus.', 71, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 70, 1, 0, 280, 1, 1564652718, 1564739118, 0, NULL, NULL, 'Bank Deposit', 1565775918, 0, '0'),
(443, 'aut_535', 'Possimus praesentium tempora magnam voluptatem voluptas alias dicta architecto autem excepturi.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 270, 5, 27, 760, 1, 1564393518, 1564739118, 0, NULL, NULL, 'Cheque', 1563961518, 1, '0'),
(444, 'voluptatem_709', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 660, 0, 0, 840, 1, 1564307118, 1565343918, 0, NULL, NULL, 'Cash', 1566035118, 1, '0'),
(445, 'voluptas_746', 'Ipsum at ut dolorum minus eum voluptas autem.', 71, '[{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 720, 23, 5, 160, 1, 1563961518, 1564652718, 0, NULL, NULL, 'Cash', 1565257518, 1, '0'),
(446, 'rem_120', NULL, 71, '[{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 330, 0, 0, 680, 1, 1564134318, 1564739118, 0, NULL, NULL, 'Card', 1563961518, 1, '0'),
(447, 'est_884', 'In sapiente totam laboriosam numquam inventore nam laborum qui ut.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 430, 0, 42, 630, 1, 1563788718, 1565430318, 0, NULL, NULL, 'Bank Deposit', 1565862318, 1, '0'),
(448, 'quas_978', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 820, 0, 0, 70, 1, 1564566318, 1564998318, 0, NULL, NULL, 'Online', 1566121518, 0, '0'),
(449, 'et_975', 'Quae voluptas modi animi doloremque minima corrupti aliquid.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 530, 6, 0, 180, 0, 1564220718, 1565516718, 0, NULL, NULL, 'Cash', 1563875118, 0, '0'),
(450, 'ea_453', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 510, 12, 0, 170, 0, 1563788718, 1564739118, 1, NULL, NULL, 'Bank Deposit', 1564047918, 0, '0'),
(451, 'quia_797', 'Ut laudantium rem esse aut ad consectetur quae assumenda.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 120, 0, 0, 80, 1, 1563702318, 1566207918, 0, NULL, NULL, 'Online', 1566121518, 0, '0'),
(452, 'et_894', 'Consequuntur quis sunt omnis qui est eaque minus repudiandae provident consequuntur.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 930, 0, 5, 750, 0, 1563788718, 1565171118, 0, NULL, NULL, 'Cash', 1564739118, 0, '0'),
(453, 'autem_930', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 700, 29, 8, 210, 1, 1563702318, 1565084718, 0, NULL, NULL, 'Online', 1565775918, 1, '0'),
(454, 'adipisci_633', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 440, 49, 10, 610, 1, 1564220718, 1564652718, 0, NULL, NULL, 'Online', 1564739118, 0, '0'),
(455, 'reprehenderit_788', 'Incidunt dolore optio enim quis ad.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 80, 0, 0, 1000, 1, 1563788718, 1564652718, 0, NULL, NULL, 'Card', 1563875118, 0, '0'),
(456, 'et_154', 'Cupiditate a enim commodi sed dolorem sint in explicabo.', 71, '[{\"title\":\"Building fee\",\"amount\":\"400\"}]', 620, 18, 48, 220, 0, 1564479918, 1564825518, 1, NULL, NULL, 'Cash', 1564739118, 0, '0'),
(457, 'sed_369', 'Ut atque amet non totam dolor sed.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 660, 0, 0, 290, 0, 1564652718, 1565430318, 0, NULL, NULL, 'Card', 1563702318, 0, '0'),
(458, 'provident_242', 'Repellendus error deserunt qui sapiente nesciunt odio adipisci corrupti minima tempora.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 80, 43, 17, 640, 1, 1564307118, 1565775918, 0, NULL, NULL, 'Card', 1565689518, 0, '0'),
(459, 'vel_252', 'Aspernatur facere sed omnis aut occaecati.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 580, 26, 0, 960, 1, 1564479918, 1564739118, 0, NULL, NULL, 'Cash', 1564739118, 0, '0'),
(460, 'voluptas_770', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 560, 0, 0, 440, 0, 1563788718, 1565775918, 0, NULL, NULL, 'Card', 1563961518, 1, '0'),
(461, 'ipsa_861', 'Quidem numquam recusandae maiores perspiciatis totam et provident.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 260, 0, 0, 540, 0, 1564479918, 1564652718, 1, NULL, NULL, 'Bank Deposit', 1565689518, 0, '0'),
(462, 'sint_619', 'Voluptatem enim dicta et et fugiat.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 670, 0, 33, 890, 1, 1563788718, 1565343918, 0, NULL, NULL, 'Cash', 1565257518, 0, '0'),
(463, 'voluptas_860', 'Dignissimos ratione velit non voluptatem sapiente blanditiis consequatur.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 910, 0, 0, 180, 0, 1564652719, 1564739119, 1, NULL, NULL, 'Online', 1565343919, 1, '0'),
(464, 'laborum_842', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 600, 0, 0, 700, 0, 1564307119, 1564825519, 1, NULL, NULL, 'Online', 1565516719, 1, '0'),
(465, 'ut_817', 'Distinctio consequuntur unde ut similique impedit deserunt natus.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 910, 0, 0, 480, 1, 1564047919, 1564652719, 0, NULL, NULL, 'Online', 1564220719, 0, '0'),
(466, 'quidem_472', 'Provident modi qui accusamus sint non veritatis a eligendi totam.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 730, 0, 0, 250, 0, 1563788719, 1566035119, 0, NULL, NULL, 'Online', 1564393519, 1, '0'),
(467, 'et_921', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 60, 46, 34, 190, 0, 1564566319, 1564825519, 1, NULL, NULL, 'Cash', 1564566319, 0, '0'),
(468, 'eum_156', 'Voluptatibus iure tempora nihil esse tempore.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 780, 0, 0, 70, 1, 1564652719, 1565603119, 0, NULL, NULL, 'Online', 1565257519, 1, '0'),
(469, 'tempore_637', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 900, 37, 0, 560, 1, 1564047919, 1564652719, 0, NULL, NULL, 'Card', 1565862319, 1, '0'),
(470, 'numquam_972', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 100, 0, 23, 520, 1, 1563615919, 1564652719, 0, NULL, NULL, 'Card', 1564652719, 1, '0'),
(471, 'aut_909', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 900, 21, 0, 940, 1, 1564134319, 1565516719, 0, NULL, NULL, 'Cheque', 1564393519, 0, '0'),
(472, 'ipsum_728', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 50, 0, 24, 430, 0, 1564652719, 1564825519, 1, NULL, NULL, 'Online', 1563615919, 0, '0'),
(473, 'asperiores_271', NULL, 71, '[{\"title\":\"Library fee\",\"amount\":\"400\"}]', 240, 41, 0, 560, 1, 1564307119, 1565689519, 0, NULL, NULL, 'Online', 1564739119, 0, '0'),
(474, 'autem_851', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 280, 0, 0, 600, 0, 1564393519, 1565603119, 0, NULL, NULL, 'Card', 1565430319, 0, '0'),
(475, 'laudantium_412', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 940, 1, 0, 560, 1, 1564566319, 1565171119, 0, NULL, NULL, 'Online', 1565516719, 0, '0'),
(476, 'quam_996', 'Vel totam error dicta similique ex rerum.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 830, 0, 0, 350, 1, 1563615919, 1564739119, 0, NULL, NULL, 'Card', 1566035119, 0, '0'),
(477, 'omnis_756', 'Minus omnis ipsam neque voluptatem atque blanditiis.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 340, 0, 0, 900, 1, 1563961519, 1564739119, 0, NULL, NULL, 'Cheque', 1563961519, 0, '0'),
(478, 'voluptas_400', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 470, 0, 0, 150, 0, 1563788719, 1564825519, 1, NULL, NULL, 'Online', 1565084719, 0, '0'),
(479, 'molestias_123', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 240, 43, 0, 860, 0, 1564393519, 1565430319, 0, NULL, NULL, 'Cash', 1566035119, 1, '0'),
(480, 'libero_730', 'Rerum enim dolor non corporis nostrum officia porro possimus.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 380, 41, 0, 120, 0, 1564307119, 1564739119, 1, NULL, NULL, 'Online', 1565862319, 1, '0'),
(481, 'sint_265', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 570, 0, 0, 840, 0, 1564047919, 1565343919, 0, NULL, NULL, 'Online', 1564566319, 0, '0'),
(482, 'harum_915', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 940, 0, 32, 370, 1, 1564479919, 1566121519, 0, NULL, NULL, 'Cash', 1565603119, 0, '0'),
(483, 'vitae_427', 'Est sint sint voluptas unde et quae.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 660, 5, 32, 700, 0, 1563615919, 1565257519, 0, NULL, NULL, 'Cash', 1565862319, 0, '0'),
(484, 'eveniet_405', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 960, 0, 14, 110, 1, 1564566319, 1565603119, 0, NULL, NULL, 'Online', 1565171119, 0, '0'),
(485, 'voluptatem_862', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 890, 0, 20, 140, 0, 1564307119, 1565516719, 0, NULL, NULL, 'Card', 1565257519, 1, '0'),
(486, 'molestiae_548', NULL, 71, '[{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 700, 0, 0, 260, 0, 1564479919, 1566121519, 0, NULL, NULL, 'Online', 1563615919, 0, '0'),
(487, 'voluptas_743', NULL, 71, ']', 310, 0, 0, 790, 1, 1563875119, 1564652719, 0, NULL, NULL, 'Online', 1565775919, 1, '0'),
(488, 'esse_381', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 510, 0, 35, 210, 1, 1563875119, 1564739119, 0, NULL, NULL, 'Cheque', 1564739119, 0, '0'),
(489, 'rerum_726', 'Temporibus quia non et debitis et sit eos itaque.', 71, '[{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 390, 0, 41, 410, 0, 1563875119, 1566207919, 0, NULL, NULL, 'Online', 1565084719, 0, '0'),
(490, 'qui_945', NULL, 71, '[{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 900, 0, 39, 820, 0, 1563875119, 1564825519, 1, NULL, NULL, 'Cash', 1565171119, 0, '0'),
(491, 'unde_289', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 870, 43, 23, 740, 1, 1564047919, 1565775919, 0, NULL, NULL, 'Bank Deposit', 1563961519, 0, '0'),
(492, 'sapiente_388', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 780, 0, 0, 560, 0, 1564047919, 1566035119, 0, NULL, NULL, 'Online', 1564220719, 1, '0'),
(493, 'voluptatum_173', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 990, 0, 0, 80, 0, 1563615919, 1565603119, 0, NULL, NULL, 'Online', 1564307119, 0, '0'),
(494, 'similique_356', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 700, 0, 0, 190, 1, 1564047919, 1565171119, 0, NULL, NULL, 'Cash', 1565603119, 1, '0'),
(495, 'voluptate_957', 'Voluptatem voluptas minus natus suscipit in iure tenetur consequatur et atque.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 200, 28, 11, 540, 0, 1564566320, 1565171120, 0, NULL, NULL, 'Cheque', 1564652720, 0, '0'),
(496, 'consequatur_859', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 720, 0, 0, 310, 1, 1563788720, 1564739120, 0, NULL, NULL, 'Online', 1564998320, 1, '0'),
(497, 'debitis_853', 'Quia quos dicta numquam dolorum quae.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 600, 0, 2, 1000, 1, 1564393520, 1565689520, 0, NULL, NULL, 'Bank Deposit', 1564134320, 1, '0'),
(498, 'laborum_186', 'Ut aut nostrum voluptates earum quibusdam ea ipsum minima.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 580, 31, 28, 910, 0, 1564220720, 1565603120, 0, NULL, NULL, 'Bank Deposit', 1565430320, 0, '0'),
(499, 'vel_117', 'Velit praesentium alias et est sunt repellendus.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 610, 50, 0, 800, 0, 1563788720, 1564825520, 1, NULL, NULL, 'Card', 1564307120, 1, '0'),
(500, 'rem_465', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 890, 38, 0, 210, 1, 1564652720, 1566207920, 0, NULL, NULL, 'Cash', 1565430320, 0, '0'),
(501, 'inventore_388', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 520, 0, 29, 340, 0, 1563615920, 1564652720, 1, NULL, NULL, 'Cash', 1565343920, 0, '0'),
(502, 'qui_551', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 100, 0, 9, 270, 1, 1564566320, 1564825520, 0, NULL, NULL, 'Online', 1565603120, 0, '0'),
(503, 'nemo_476', 'Sed voluptatem dolore aliquam delectus aut est ullam non soluta dolorem.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 300, 24, 0, 440, 0, 1563961520, 1564652720, 1, NULL, NULL, 'Cash', 1565257520, 1, '0'),
(504, 'amet_437', 'Beatae est aut quaerat non iusto vero rerum assumenda voluptatibus.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 870, 0, 0, 890, 1, 1563702320, 1564739120, 0, NULL, NULL, 'Online', 1566207920, 0, '0'),
(505, 'sed_291', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 740, 0, 0, 210, 0, 1563788720, 1565775920, 0, NULL, NULL, 'Online', 1563875120, 1, '0'),
(506, 'amet_784', NULL, 71, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 850, 14, 0, 280, 0, 1563615920, 1564652720, 1, NULL, NULL, 'Online', 1565257520, 1, '0'),
(507, 'pariatur_225', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 730, 33, 0, 910, 1, 1564307120, 1565516720, 0, NULL, NULL, 'Online', 1565862320, 0, '0'),
(508, 'nihil_524', 'Quo vero ipsa quibusdam tempore dolores sint.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 630, 37, 20, 950, 0, 1564134320, 1564825520, 1, NULL, NULL, 'Online', 1565948720, 0, '0'),
(509, 'ut_821', 'Ea quia occaecati ut omnis unde illum ipsa nesciunt accusamus nobis.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 560, 21, 45, 360, 0, 1563961520, 1564652720, 1, NULL, NULL, 'Online', 1563702320, 1, '0'),
(510, 'maxime_187', NULL, 71, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 940, 7, 0, 340, 1, 1564652720, 1565516720, 0, NULL, NULL, 'Online', 1563961520, 0, '0'),
(511, 'omnis_478', 'Reprehenderit eveniet quo aperiam quo ad sed aut.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 310, 0, 50, 560, 1, 1564393520, 1565257520, 0, NULL, NULL, 'Card', 1564739120, 1, '0'),
(512, 'blanditiis_798', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 400, 46, 2, 410, 1, 1564134320, 1564652720, 0, NULL, NULL, 'Cash', 1564393520, 0, '0'),
(513, 'beatae_875', 'Corrupti pariatur et quisquam harum eligendi debitis provident.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 530, 8, 2, 540, 1, 1563875120, 1564652720, 0, NULL, NULL, 'Card', 1563875120, 0, '0'),
(514, 'voluptates_607', 'Commodi aut facere itaque nisi culpa et provident culpa corrupti eos.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 150, 43, 0, 410, 1, 1564047920, 1565430320, 0, NULL, NULL, 'Cash', 1565257520, 1, '0'),
(515, 'hic_915', 'Iure porro quo veniam blanditiis quibusdam.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 870, 17, 0, 380, 0, 1564393520, 1565862320, 0, NULL, NULL, 'Bank Deposit', 1565689520, 1, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(516, 'omnis_182', 'Molestiae necessitatibus harum eligendi provident quo sequi praesentium.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 940, 0, 27, 240, 1, 1564134320, 1564652720, 0, NULL, NULL, 'Cheque', 1565084720, 1, '0'),
(517, 'quis_266', NULL, 71, '[{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 1000, 0, 0, 1000, 0, 1564479920, 1564739120, 1, NULL, NULL, 'Online', 1563702320, 0, '0'),
(518, 'deleniti_999', 'Voluptatem itaque nihil qui pariatur dolorem eum deserunt dolores sed deleniti.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 280, 9, 0, 140, 1, 1563875120, 1565689520, 0, NULL, NULL, 'Online', 1566121520, 0, '0'),
(519, 'ut_972', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 740, 0, 20, 580, 0, 1564566320, 1564998320, 0, NULL, NULL, 'Online', 1565775920, 0, '0'),
(520, 'nisi_226', 'Vel quo quam aut veritatis voluptates eos eum vel.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 70, 11, 0, 720, 0, 1563615920, 1564652720, 1, NULL, NULL, 'Online', 1565343920, 1, '0'),
(521, 'omnis_649', NULL, 71, '[{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 1000, 41, 42, 870, 1, 1563961520, 1564825520, 0, NULL, NULL, 'Bank Deposit', 1564739120, 0, '0'),
(522, 'sit_814', 'Iure sed et a eaque accusamus perferendis fuga.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 540, 0, 13, 590, 1, 1563788720, 1566035120, 0, NULL, NULL, 'Card', 1565084720, 1, '0'),
(523, 'magni_924', 'Nobis ea ea ut repellendus porro necessitatibus laudantium nihil officia.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 690, 0, 0, 380, 1, 1564479920, 1565775920, 0, NULL, NULL, 'Bank Deposit', 1565862320, 1, '0'),
(524, 'eveniet_126', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 910, 0, 0, 910, 0, 1564134320, 1564739120, 1, NULL, NULL, 'Card', 1565689520, 0, '0'),
(525, 'architecto_448', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 300, 0, 0, 70, 0, 1564047920, 1564825520, 1, NULL, NULL, 'Cash', 1565430320, 0, '0'),
(526, 'blanditiis_821', 'Alias reprehenderit delectus exercitationem molestiae alias quas voluptas.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 830, 38, 19, 330, 0, 1564220720, 1565603120, 0, NULL, NULL, 'Card', 1564998320, 0, '0'),
(527, 'aut_701', 'Ab autem soluta qui quibusdam hic vitae nihil.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 850, 19, 4, 540, 0, 1563961520, 1564652720, 1, NULL, NULL, 'Cash', 1565257520, 1, '0'),
(528, 'nostrum_801', 'Eum amet nihil illo odit voluptatem incidunt.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 340, 0, 0, 890, 1, 1564393520, 1565862320, 0, NULL, NULL, 'Online', 1563875120, 1, '0'),
(529, 'harum_755', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 480, 38, 37, 400, 1, 1564220720, 1564739120, 0, NULL, NULL, 'Card', 1564047920, 0, '0'),
(530, 'at_122', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 420, 47, 0, 760, 0, 1563788720, 1564739120, 1, NULL, NULL, 'Bank Deposit', 1565171120, 1, '0'),
(531, 'sunt_564', NULL, 71, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 600, 49, 10, 530, 0, 1563961520, 1564739120, 1, NULL, NULL, 'Card', 1565343920, 1, '0'),
(532, 'dicta_715', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 220, 36, 0, 610, 0, 1564220720, 1564825520, 1, NULL, NULL, 'Online', 1565343920, 1, '0'),
(533, 'doloremque_346', 'Nostrum eaque odit hic similique quam est deserunt consequatur a quia.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 310, 0, 22, 740, 1, 1563788720, 1565257520, 0, NULL, NULL, 'Cash', 1564739120, 0, '0'),
(534, 'nihil_495', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 220, 28, 40, 330, 1, 1564393520, 1566121520, 0, NULL, NULL, 'Online', 1563615920, 1, '0'),
(535, 'non_846', 'Nisi temporibus soluta expedita repellat sint.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 900, 0, 0, 830, 0, 1563961520, 1564998320, 0, NULL, NULL, 'Bank Deposit', 1565171120, 0, '0'),
(536, 'pariatur_282', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 790, 34, 0, 580, 0, 1564134321, 1564825521, 1, NULL, NULL, 'Bank Deposit', 1565430321, 0, '0'),
(537, 'ipsum_729', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 180, 0, 32, 860, 1, 1564652721, 1565257521, 0, NULL, NULL, 'Bank Deposit', 1564652721, 1, '0'),
(538, 'ipsum_527', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 450, 0, 43, 180, 0, 1564652721, 1566207921, 0, NULL, NULL, 'Cheque', 1563615921, 0, '0'),
(539, 'perferendis_213', 'Harum et illo minima et voluptas sint.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 1000, 39, 10, 230, 1, 1564479921, 1565171121, 0, NULL, NULL, 'Cheque', 1565343921, 0, '0'),
(540, 'explicabo_752', 'Aut cumque voluptatum qui porro quia sed saepe minima.', 71, '[{\"title\":\"Library fee\",\"amount\":\"500\"}]', 520, 0, 15, 360, 0, 1564134321, 1564652721, 1, NULL, NULL, 'Cash', 1565603121, 0, '0'),
(541, 'ullam_755', 'Delectus aliquam sunt dolorem earum in qui recusandae quis deserunt sequi.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 1000, 28, 0, 880, 1, 1564652721, 1564652721, 0, NULL, NULL, 'Cash', 1563961521, 0, '0'),
(542, 'quos_485', 'Quo est rerum aliquam voluptatum temporibus.', 71, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 920, 46, 0, 900, 0, 1563961521, 1565516721, 0, NULL, NULL, 'Card', 1564998321, 0, '0'),
(543, 'mollitia_672', 'Iusto autem repudiandae numquam molestiae.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 960, 0, 0, 410, 1, 1564307121, 1565689521, 0, NULL, NULL, 'Online', 1564566321, 0, '0'),
(544, 'voluptas_357', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 340, 16, 0, 800, 0, 1564307121, 1566207921, 0, NULL, NULL, 'Cash', 1564047921, 0, '0'),
(545, 'sint_934', NULL, 71, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 320, 1, 0, 530, 0, 1564047921, 1564998321, 0, NULL, NULL, 'Cheque', 1565257521, 0, '0'),
(546, 'quis_576', 'Necessitatibus voluptatum quis nam id est.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 390, 0, 1, 900, 1, 1564652721, 1564652721, 0, NULL, NULL, 'Cash', 1564220721, 1, '0'),
(547, 'qui_732', NULL, 71, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 210, 46, 14, 630, 1, 1563788721, 1564652721, 0, NULL, NULL, 'Cash', 1564479921, 1, '0'),
(548, 'minus_410', 'Et aut quis veniam eligendi quas sint est.', 71, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 780, 12, 24, 130, 0, 1564566321, 1564998321, 0, NULL, NULL, 'Card', 1566121521, 1, '0'),
(549, 'esse_837', 'Illo esse nihil illum accusamus reiciendis quisquam occaecati natus.', 71, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 160, 30, 21, 370, 0, 1564566321, 1566121521, 0, NULL, NULL, 'Cash', 1563788721, 0, '0'),
(550, 'nam_678', NULL, 71, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 630, 0, 17, 660, 1, 1564652721, 1565343921, 0, NULL, NULL, 'Online', 1563961521, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `paymentscollection`
--

CREATE TABLE `paymentscollection` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `salary_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `hourly_cost` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salary_base`
--

CREATE TABLE `payroll_salary_base` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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

--
-- Dumping data for table `phone_calls`
--

INSERT INTO `phone_calls` (`id`, `FullName`, `phoneNo`, `email`, `call_type`, `purpose`, `call_time`, `nxt_follow`, `call_duration`, `call_details`) VALUES
(1, 'Ea non a harum.', '63712', 'quigley.adan@gmail.com', 'est', 'totam', '1564911921', 'facilis', '25 minutes', 'Quia et laboriosam pariatur ipsam minus reprehenderit quisquam.'),
(2, 'Aut non.', '84414', 'jerad.lubowitz@wolf.biz', 'nam', 'aut', '1564911921', 'impedit', '15 minutes', 'Ab voluptas deserunt ipsa commodi harum placeat autem est.'),
(3, 'Aut sunt nobis.', '25697', 'daugherty.nina@yahoo.com', 'deleniti', 'modi', '1564911921', 'neque', '1 minutes', 'Et labore a voluptatem sit quaerat mollitia minima voluptatem nemo.'),
(4, 'Quos temporibus.', '98134', 'vivienne92@maggio.com', 'voluptate', 'eum', '1564911921', 'cum', '14 minutes', 'Velit quam voluptatum qui rem aut.'),
(5, 'Est tenetur et corporis.', '78171', 'mohr.josiah@turner.com', 'et', 'quia', '1564911921', 'nesciunt', '2 minutes', 'Et nesciunt saepe non voluptatem fugiat.'),
(6, 'Inventore aut voluptatem magnam.', '92380', 'ramon94@hotmail.com', 'ab', 'consequuntur', '1564911921', 'iure', '29 minutes', 'Aut velit recusandae excepturi at et odit similique non consequatur alias.'),
(7, 'Dignissimos voluptatibus voluptate.', '69568', 'tianna.schowalter@wunsch.info', 'velit', 'assumenda', '1564911921', 'perspiciatis', '8 minutes', 'Repellat unde repellendus similique consequatur sed accusamus quis asperiores nemo sed.'),
(8, 'Et occaecati amet.', '48586', 'maida.okeefe@gulgowski.net', 'labore', 'dolores', '1564911921', 'consequuntur', '23 minutes', 'Fuga sed aut in rerum mollitia iusto assumenda nostrum.'),
(9, 'Provident qui est.', '84985', 'kellen86@stracke.com', 'voluptatem', 'possimus', '1564911921', 'dolorem', '30 minutes', 'Sit sit nobis architecto maxime voluptas eum iste corporis.'),
(10, 'Aut saepe aut.', '18366', 'andreane05@steuber.com', 'impedit', 'temporibus', '1564911921', 'error', '26 minutes', 'Quod ab quia quae in voluptatum voluptatem autem aut.'),
(11, 'Ea inventore nemo.', '81939', 'novella.lang@gaylord.com', 'sapiente', 'dolor', '1564911921', 'quod', '5 minutes', 'Vel ut sint quibusdam iure animi.'),
(12, 'Sed enim id sit et.', '67526', 'wilber.aufderhar@schoen.com', 'dolorem', 'eos', '1564911921', 'illo', '3 minutes', 'Et eum in voluptate autem omnis molestiae.'),
(13, 'In mollitia autem excepturi.', '53067', 'andreanne72@conroy.org', 'qui', 'ut', '1564911921', 'aspernatur', '13 minutes', 'Quod eum nesciunt maiores blanditiis.'),
(14, 'Magni vitae.', '57829', 'beatty.lorenz@funk.com', 'laborum', 'est', '1564911921', 'similique', '22 minutes', 'Sint ut vero aliquid dolores temporibus.'),
(15, 'Voluptatibus error unde.', '94711', 'gardner53@yahoo.com', 'cum', 'eos', '1564911921', 'autem', '4 minutes', 'Corrupti enim molestias facilis reiciendis.'),
(16, 'Qui quia.', '22376', 'ezra.emard@dubuque.info', 'unde', 'vero', '1564911921', 'repudiandae', '28 minutes', 'Soluta voluptate mollitia sit est veniam.'),
(17, 'Libero et.', '75700', 'kschroeder@gmail.com', 'aliquam', 'laudantium', '1564911921', 'numquam', '25 minutes', 'Tempora rem adipisci cumque molestias nemo aut qui.'),
(18, 'Aut a corrupti eos.', '16901', 'jkuhn@yahoo.com', 'iste', 'ut', '1564911921', 'reiciendis', '15 minutes', 'Nam voluptas quaerat ut aut velit.'),
(19, 'Ullam ea quis quaerat.', '17582', 'nrunte@frami.net', 'nam', 'quos', '1564911921', 'dolores', '9 minutes', 'Magni deserunt ipsam rerum corrupti tempore nesciunt.'),
(20, 'Libero facere dolorum.', '70291', 'aiden.daniel@konopelski.biz', 'odit', 'et', '1564911921', 'omnis', '25 minutes', 'Recusandae fugit aut et esse cum veritatis nemo at suscipit.'),
(21, 'Reprehenderit aut ea.', '96325', 'keeling.ludwig@yahoo.com', 'consequuntur', 'sint', '1564911921', 'culpa', '15 minutes', 'Non facere eligendi repellendus eaque optio et.'),
(22, 'Sapiente nam est neque voluptas.', '71618', 'cristobal78@keebler.com', 'qui', 'mollitia', '1564911921', 'sit', '24 minutes', 'Consequatur nam ea id qui.'),
(23, 'Nihil cumque.', '86318', 'lula.wuckert@yahoo.com', 'eos', 'nulla', '1564911921', 'magnam', '13 minutes', 'Aut fuga saepe quos sed.'),
(24, 'Architecto accusantium provident voluptatem.', '67468', 'rhoda45@yahoo.com', 'at', 'nesciunt', '1564911921', 'et', '24 minutes', 'Rerum voluptatum voluptas vel sed adipisci perspiciatis voluptas magnam quisquam non in eaque.'),
(25, 'Optio est quaerat.', '92744', 'xritchie@emard.info', 'vel', 'alias', '1564911921', 'repellendus', '24 minutes', 'Asperiores asperiores dolorum voluptatem non molestias.'),
(26, 'Aperiam est veritatis.', '57436', 'mertz.isac@macejkovic.com', 'dicta', 'laudantium', '1564911921', 'consequuntur', '13 minutes', 'Unde harum earum id voluptas atque optio ut molestiae fuga.'),
(27, 'Hic provident.', '95779', 'wmayert@hudson.com', 'nulla', 'non', '1564911921', 'ut', '22 minutes', 'Qui suscipit culpa qui dolores recusandae consectetur enim.'),
(28, 'Recusandae accusamus.', '53194', 'naomi91@hotmail.com', 'et', 'iusto', '1564911921', 'est', '11 minutes', 'In aut quo ad soluta dolorem aliquid repellat.'),
(29, 'Praesentium error et molestias atque.', '60649', 'williamson.major@haley.net', 'amet', 'enim', '1564911921', 'rerum', '26 minutes', 'Adipisci enim est repellat qui porro illo et incidunt dignissimos et.'),
(30, 'Dolor sapiente harum exercitationem.', '67806', 'lizeth.hegmann@gmail.com', 'quod', 'eius', '1564911921', 'consequuntur', '3 minutes', 'Enim exercitationem voluptas amet accusantium molestiae et sint error.'),
(31, 'Repudiandae rem id.', '28615', 'arvilla.kilback@pagac.info', 'ipsum', 'error', '1564911921', 'fugiat', '6 minutes', 'Iusto et reiciendis accusamus enim repudiandae fugiat rerum omnis cum laborum sed consequatur.'),
(32, 'Ullam necessitatibus in.', '91502', 'funk.juanita@gmail.com', 'non', 'distinctio', '1564911921', 'aliquam', '27 minutes', 'Et distinctio eum id non quidem debitis provident.'),
(33, 'Tempore provident ratione.', '39750', 'von.marc@marvin.com', 'minus', 'sed', '1564911922', 'repellendus', '2 minutes', 'Iste cupiditate maiores porro est adipisci numquam voluptatem repellendus sunt et totam blanditiis.'),
(34, 'Ea et voluptas.', '42452', 'oran81@gmail.com', 'voluptatibus', 'quia', '1564911922', 'qui', '4 minutes', 'Et quaerat assumenda illo numquam.'),
(35, 'Necessitatibus atque eos asperiores.', '57089', 'herzog.adrienne@corkery.com', 'et', 'fuga', '1564911922', 'eveniet', '14 minutes', 'Vel temporibus blanditiis porro repudiandae aliquid velit dicta quod non quia dolorum optio.'),
(36, 'Optio facilis.', '48829', 'kschmidt@kuhlman.com', 'repudiandae', 'exercitationem', '1564911922', 'explicabo', '14 minutes', 'Quisquam voluptatum accusamus tempore dignissimos quod praesentium reiciendis ipsam doloremque.'),
(37, 'Et est et.', '54511', 'bria37@rippin.org', 'beatae', 'animi', '1564911922', 'voluptatem', '12 minutes', 'Dignissimos temporibus est neque in.'),
(38, 'Nesciunt fugiat.', '45256', 'aubrey50@gmail.com', 'soluta', 'soluta', '1564911922', 'sunt', '25 minutes', 'Est laboriosam quia maiores quod harum omnis ullam laudantium.'),
(39, 'Veniam voluptatem quia.', '68935', 'amanda.heaney@hotmail.com', 'natus', 'voluptatem', '1564911922', 'in', '19 minutes', 'Nam tenetur in nihil possimus ipsum eveniet.'),
(40, 'Esse et voluptates.', '29683', 'otilia66@mcclure.info', 'et', 'non', '1564911922', 'occaecati', '25 minutes', 'Voluptatem velit necessitatibus at ut molestiae ut quo et ratione.'),
(41, 'Ipsa alias rerum.', '30435', 'albin71@wuckert.com', 'consequatur', 'nihil', '1564911922', 'mollitia', '19 minutes', 'Sunt et sit quae sit harum.'),
(42, 'Illum corrupti minima.', '35067', 'petra.mcdermott@treutel.com', 'dolore', 'eos', '1564911922', 'possimus', '10 minutes', 'Quia sunt cum rerum voluptatum porro qui.'),
(43, 'Magni consequatur ab adipisci.', '36026', 'donna36@yahoo.com', 'eum', 'commodi', '1564911922', 'occaecati', '25 minutes', 'Ea quam odio enim aperiam inventore unde impedit.'),
(44, 'Fugiat totam sunt dolor cum expedita.', '75950', 'aaliyah.kozey@gerhold.com', 'et', 'omnis', '1564911922', 'sed', '18 minutes', 'Voluptates ducimus ut numquam libero quia dolor rerum qui.'),
(45, 'Quidem molestias voluptas voluptate.', '83740', 'vandervort.dennis@durgan.info', 'iure', 'nulla', '1564911922', 'laudantium', '20 minutes', 'Dolorum et dolorem molestiae et eum.'),
(46, 'Et praesentium accusamus itaque.', '83554', 'novella.ryan@hamill.com', 'laudantium', 'maiores', '1564911922', 'sit', '17 minutes', 'Hic ea dolorem ut mollitia.'),
(47, 'Architecto tempora.', '20885', 'blakin@gmail.com', 'cupiditate', 'non', '1564911922', 'ut', '29 minutes', 'Sed itaque eos iure dignissimos est nesciunt aliquid.'),
(48, 'Consequuntur laborum in aspernatur.', '16227', 'vcarroll@gmail.com', 'vitae', 'delectus', '1564911922', 'tempora', '2 minutes', 'Iste et fuga earum repellat.'),
(49, 'Aperiam et commodi error.', '70747', 'lenny.paucek@hayes.com', 'non', 'odit', '1564911922', 'assumenda', '14 minutes', 'In architecto et sit sapiente dignissimos dolorum unde.'),
(50, 'Assumenda quaerat qui.', '41039', 'hickle.verdie@torp.info', 'vero', 'minima', '1564911922', 'reiciendis', '16 minutes', 'Sunt ea sint nemo laborum iste.');

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `postal_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `refno` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `postal_from` text COLLATE utf8_unicode_ci NOT NULL,
  `postal_to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `postal_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `postal_time` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `attachment` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `postal_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `postal`
--

INSERT INTO `postal` (`id`, `postal_type`, `refno`, `postal_from`, `postal_to`, `postal_desc`, `postal_time`, `attachment`, `postal_notes`) VALUES
(1, 'itaque', '11501', 'Illum magnam.', 'Ut veritatis.', 'Id doloremque quaerat.', '1564911922', '', 'Magni porro perspiciatis.'),
(2, 'fugiat', '23829', 'Veniam voluptatibus.', 'Ea.', 'Minus voluptatem aliquid odio et accusamus incidunt.', '1564911922', '', 'Autem nulla aut dolore delectus doloremque consequatur.'),
(3, 'tempora', '63990', 'Voluptas quo.', 'Magnam dolor.', 'Voluptates et magnam dolor.', '1564911922', '', 'Rerum unde labore sed illum.'),
(4, 'cupiditate', '18872', 'Vel autem.', 'Esse aut.', 'Neque eligendi tempora.', '1564911922', '', 'Sit et fugiat ipsam at.'),
(5, 'voluptates', '48748', 'Iure deserunt.', 'Sapiente vel.', 'Quod dolorum.', '1564911922', '', 'Ut veritatis nobis molestiae molestias voluptatem et accusantium sint.'),
(6, 'doloremque', '84404', 'Laudantium vel.', 'Sed culpa quidem.', 'Perferendis ut quia magni vel.', '1564911922', '', 'Quia rem aperiam.'),
(7, 'culpa', '75785', 'Qui nostrum.', 'Sit nihil.', 'Repellat et atque.', '1564911922', '', 'Harum aut sint unde.'),
(8, 'alias', '19593', 'Et est.', 'A.', 'Et vitae aliquam.', '1564911922', '', 'Ratione et laboriosam voluptatibus.'),
(9, 'sit', '89240', 'Pariatur recusandae.', 'Aliquam porro nemo.', 'Nam illum dignissimos quidem.', '1564911922', '', 'Aspernatur officiis ea repudiandae est velit consequatur.'),
(10, 'architecto', '58988', 'Dolores et.', 'Beatae.', 'Dignissimos sequi deserunt et quae.', '1564911922', '', 'Omnis sunt.'),
(11, 'alias', '14077', 'Et laborum aut.', 'Eum nulla.', 'Inventore vero velit qui dolorum.', '1564911922', '', 'Blanditiis officiis illum.'),
(12, 'dolor', '14878', 'Qui dolores.', 'Facere corporis.', 'Quibusdam adipisci eum optio.', '1564911922', '', 'Reprehenderit dolore temporibus.'),
(13, 'minus', '67760', 'Et quo quae.', 'Porro.', 'Consequuntur quae nobis.', '1564911922', '', 'Voluptas accusamus praesentium amet possimus quod.'),
(14, 'voluptatem', '51946', 'Libero quis sed.', 'Non amet.', 'Temporibus aut vel provident commodi explicabo dolor ipsam.', '1564911922', '', 'Sed ea aliquam itaque ipsa harum architecto.'),
(15, 'autem', '61285', 'Ut maiores soluta.', 'Delectus.', 'Voluptas earum quo.', '1564911922', '', 'Est labore et veritatis ipsum.'),
(16, 'rerum', '26191', 'Deserunt quo.', 'Sed in.', 'Dolorem recusandae ad in et sit sit ducimus accusantium.', '1564911922', '', 'Eum voluptatem qui aut.'),
(17, 'est', '68072', 'Autem aut.', 'Quidem illo ut.', 'Omnis aspernatur unde.', '1564911922', '', 'Nihil pariatur reiciendis quidem.'),
(18, 'pariatur', '86945', 'Est.', 'Dicta est.', 'Harum voluptate provident quae.', '1564911922', '', 'Ut voluptatem.'),
(19, 'excepturi', '24227', 'Culpa est.', 'Doloribus.', 'Est nulla dignissimos.', '1564911922', '', 'Est et recusandae sed.'),
(20, 'eum', '15952', 'Adipisci ad.', 'Praesentium.', 'Dolorum consequatur voluptas.', '1564911922', '', 'Vel dolor deserunt voluptatem.'),
(21, 'error', '68101', 'Sed voluptas.', 'Dolor.', 'Fugit facilis perferendis.', '1564911922', '', 'Delectus qui suscipit autem id.'),
(22, 'et', '49686', 'Dolore sit architecto.', 'Tempora voluptatum animi.', 'Deleniti libero eos aliquid.', '1564911922', '', 'Nam architecto dolorem velit.'),
(23, 'voluptatibus', '32233', 'Aliquid.', 'Fugit officiis.', 'Autem eveniet voluptate et in est.', '1564911922', '', 'Nostrum aut aut dicta qui.'),
(24, 'expedita', '91904', 'Quasi vero.', 'Reprehenderit.', 'Numquam sed voluptatem blanditiis alias quam.', '1564911922', '', 'Reiciendis nam delectus quia.'),
(25, 'velit', '66882', 'Velit.', 'Tempora dignissimos iste.', 'Quae repellendus ut.', '1564911922', '', 'Doloribus laudantium voluptas eos.'),
(26, 'est', '32626', 'Praesentium at.', 'Sit aut.', 'Vitae qui voluptatem.', '1564911922', '', 'Dignissimos blanditiis dolores.'),
(27, 'labore', '61413', 'Impedit corrupti.', 'Ut blanditiis.', 'Illo voluptate eos necessitatibus provident quisquam sed.', '1564911922', '', 'Dolores saepe distinctio rerum et quia.'),
(28, 'dolores', '64919', 'Esse beatae maiores.', 'Id.', 'Laborum illo.', '1564911922', '', 'Nihil distinctio autem placeat ut.'),
(29, 'minima', '15542', 'Nesciunt veritatis a.', 'Est ducimus magni.', 'Ipsa nam magni rem sit.', '1564911922', '', 'Officiis molestiae incidunt.'),
(30, 'expedita', '84267', 'Debitis nemo.', 'Est explicabo officiis.', 'Consequatur nihil quasi reprehenderit.', '1564911922', '', 'Perspiciatis aliquam eos.'),
(31, 'et', '77033', 'Temporibus.', 'Itaque non.', 'Et qui quisquam laudantium.', '1564911922', '', 'Accusantium expedita doloribus.'),
(32, 'ut', '71598', 'Minima quibusdam.', 'Odio iste.', 'Aut molestiae perspiciatis esse dolorem porro laborum omnis.', '1564911922', '', 'Vero quis dicta.'),
(33, 'impedit', '42575', 'Voluptatem nam.', 'Expedita.', 'Exercitationem omnis qui qui.', '1564911922', '', 'Nihil qui sunt molestiae consequatur.'),
(34, 'earum', '73437', 'Consequatur et ipsam.', 'Cupiditate.', 'Accusamus cupiditate ratione ut dolores nesciunt aut.', '1564911922', '', 'Totam dignissimos vel quidem doloremque.'),
(35, 'illum', '49012', 'Libero.', 'Qui dolor.', 'Ipsa eaque praesentium ipsa animi.', '1564911922', '', 'Ullam iste culpa qui maiores corrupti et.'),
(36, 'minus', '89072', 'Est reiciendis.', 'Perferendis.', 'Eius est tempora a maiores neque quia.', '1564911922', '', 'Reiciendis ut asperiores laudantium voluptates perferendis ut totam.'),
(37, 'nisi', '52349', 'Et.', 'Omnis modi nostrum.', 'Modi voluptatem esse natus.', '1564911922', '', 'Soluta optio nostrum enim est non.'),
(38, 'aliquid', '55552', 'Dicta.', 'Nobis.', 'Omnis eum omnis qui.', '1564911922', '', 'Voluptatem voluptas dolorem.'),
(39, 'facere', '11345', 'Possimus magni.', 'Deserunt praesentium quisquam.', 'Maxime perferendis vel qui exercitationem beatae.', '1564911922', '', 'Consequatur et nisi delectus nesciunt et natus corrupti repellat.'),
(40, 'qui', '59177', 'Totam.', 'Facilis.', 'Et non cupiditate qui quidem veritatis.', '1564911922', '', 'Molestiae dolores aliquid illum.'),
(41, 'omnis', '34383', 'Sunt reprehenderit quae.', 'Aut facilis.', 'Libero voluptate perspiciatis qui recusandae dolore.', '1564911922', '', 'Accusamus fugiat nostrum molestiae occaecati ipsa accusamus.'),
(42, 'assumenda', '31884', 'Amet.', 'Inventore amet.', 'Ad nulla reprehenderit consequatur quae consequatur maiores hic et.', '1564911922', '', 'Illo quisquam tenetur aliquam ut soluta.'),
(43, 'est', '74934', 'Voluptas ut.', 'Aut vitae numquam.', 'Labore rerum sunt quaerat provident aperiam unde.', '1564911922', '', 'Qui tempora et nemo molestias laudantium.'),
(44, 'aspernatur', '38057', 'Itaque id.', 'Cumque quo.', 'Qui velit quis velit.', '1564911922', '', 'Mollitia quaerat debitis quam in quasi.'),
(45, 'aut', '55125', 'Culpa odit.', 'Quo occaecati.', 'Modi ducimus harum sed reprehenderit vel rerum aut sunt.', '1564911922', '', 'Eius saepe non consequatur laudantium rem.'),
(46, 'doloribus', '97780', 'Repellat.', 'Consectetur optio.', 'Unde dolor nesciunt eum.', '1564911923', '', 'Vitae impedit repellat recusandae voluptatum.'),
(47, 'id', '49111', 'Et fugiat.', 'Ut sunt facere.', 'Est quo dignissimos amet.', '1564911923', '', 'Molestiae molestiae et cum.'),
(48, 'quia', '50386', 'Hic blanditiis.', 'Mollitia natus.', 'Ut esse dolor nemo dolores voluptas praesentium id.', '1564911923', '', 'Adipisci aperiam aut aliquid.'),
(49, 'voluptas', '36498', 'Adipisci ut eveniet.', 'Et.', 'Dolor ut tempore atque a.', '1564911923', '', 'Et animi corrupti sed.'),
(50, 'nam', '19078', 'Nisi corrupti.', 'Omnis dolores autem.', 'Fuga aliquid maiores quia et repellendus ipsum.', '1564911923', '', 'Molestiae aut minus.');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_description` text COLLATE utf8_unicode_ci NOT NULL,
  `def_for` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_permissions` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_title`, `role_description`, `def_for`, `role_permissions`) VALUES
(1, 'Super Administrators', '', 'none', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"Administrators.addAdministrator\",\"Administrators.editAdministrator\",\"Administrators.delAdministrator\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"dbExport.dbExport\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"adminTasks.globalSettings\",\"adminTasks.mailSmsSettings\",\"adminTasks.frontendCMS\",\"adminTasks.bioItegration\",\"adminTasks.activatedModules\",\"adminTasks.paymentsSettings\",\"adminTasks.mobileSettings\",\"adminTasks.lookFeel\",\"adminTasks.vacationSettings\",\"Languages.addLanguage\",\"Languages.editLanguage\",\"Languages.delLanguage\",\"newsboard.View\",\"events.View\",\"frontendCMSpages.addPage\",\"frontendCMSpages.editPage\",\"frontendCMSpages.delPage\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"roles.add_role\",\"roles.modify_role\",\"roles.delete_role\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"wel_office_cat.list\",\"wel_office_cat.edit_cat\",\"wel_office_cat.del_cat\",\"wel_office_cat.add_cat\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"students.medHistory\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.del_vis\",\"visitors.add_vis\",\"visitors.Download\",\"visitors.Export\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"postal.list\",\"postal.del_postal\",\"postal.Download\",\"postal.add_postal\",\"postal.Export\",\"postal.edit_postal\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"Hostel.HostelCat\",\"Hostel.EditHostel\",\"Hostel.listSubs\",\"Hostel.AddHostel\",\"Hostel.delHostel\",\"Hostel.list\",\"depart.list\",\"depart.del_depart\",\"depart.add_depart\",\"depart.edit_depart\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.del_enq\",\"enquiries.add_enq\",\"enquiries.Download\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.Download\",\"complaints.add_complaint\",\"inv_cat.list\",\"inv_cat.del_cat\",\"inv_cat.add_cat\",\"inv_cat.edit_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.Export\",\"items_code.add_item\",\"items_code.edit_item\",\"items_stock.list\",\"items_stock.del_item\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"onlineExams.QuestionsArch\",\"onlineExams.delExam\",\"onlineExams.list\",\"onlineExams.takeExam\",\"onlineExams.addExam\",\"onlineExams.editExam\",\"onlineExams.showMarks\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Administrators.list\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Dormitories.editDorm\",\"Dormitories.addDormitories\",\"Dormitories.list\",\"Dormitories.delDorm\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"FeeTypes.delFeeType\",\"FeeTypes.list\",\"FeeTypes.addFeeType\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Incomes.addIncome\",\"Incomes.delIncome\",\"Incomes.list\",\"Incomes.editIncome\",\"Incomes.incomeCategory\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Languages.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"frontendCMSpages.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"roles.list\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"classSch.addSch\",\"classes.delClass\",\"classes.addClass\",\"classes.editClass\",\"complaints.View\",\"enquiries.View\",\"visitors.View\",\"con_mess.View\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\",\"Library.Export\",\"Library.Import\"]'),
(2, 'Administrators', 'Default role for administrators', 'admin', '[\"students.TrackBus\",\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"adminTasks.globalSettings\",\"adminTasks.mailSmsSettings\",\"adminTasks.frontendCMS\",\"adminTasks.bioItegration\",\"adminTasks.activatedModules\",\"adminTasks.paymentsSettings\",\"adminTasks.mobileSettings\",\"adminTasks.lookFeel\",\"adminTasks.vacationSettings\",\"newsboard.View\",\"events.View\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\",\"roles.list\",\"roles.add_role\",\"roles.modify_role\",\"roles.delete_role\",\"Marksheet.Marksheet\",\"Library.Export\",\"Library.Import\"]'),
(3, 'Prefect', '', 'none', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"newsboard.View\",\"events.View\",\"frontendCMSpages.addPage\",\"frontendCMSpages.editPage\",\"frontendCMSpages.delPage\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"wel_office_cat.list\",\"wel_office_cat.edit_cat\",\"wel_office_cat.del_cat\",\"wel_office_cat.add_cat\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"students.medHistory\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.View\",\"visitors.del_vis\",\"visitors.add_vis\",\"visitors.Download\",\"visitors.Export\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"postal.list\",\"postal.del_postal\",\"postal.Download\",\"postal.add_postal\",\"postal.Export\",\"postal.edit_postal\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"Hostel.HostelCat\",\"Hostel.EditHostel\",\"Hostel.listSubs\",\"Hostel.AddHostel\",\"Hostel.delHostel\",\"Hostel.list\",\"depart.list\",\"depart.del_depart\",\"depart.add_depart\",\"depart.edit_depart\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.del_enq\",\"enquiries.View\",\"enquiries.add_enq\",\"enquiries.Download\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"inv_cat.list\",\"inv_cat.del_cat\",\"inv_cat.add_cat\",\"inv_cat.edit_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.Export\",\"items_code.add_item\",\"items_code.edit_item\",\"items_stock.list\",\"items_stock.del_item\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"onlineExams.QuestionsArch\",\"onlineExams.delExam\",\"onlineExams.list\",\"onlineExams.takeExam\",\"onlineExams.addExam\",\"onlineExams.editExam\",\"onlineExams.showMarks\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Dormitories.editDorm\",\"Dormitories.addDormitories\",\"Dormitories.list\",\"Dormitories.delDorm\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"FeeTypes.delFeeType\",\"FeeTypes.list\",\"FeeTypes.addFeeType\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Incomes.addIncome\",\"Incomes.delIncome\",\"Incomes.list\",\"Incomes.editIncome\",\"Incomes.incomeCategory\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"frontendCMSpages.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\"]'),
(4, 'Principal', '', 'none', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"accountants.addAccountant\",\"accountants.editAccountant\",\"accountants.delAccountant\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"newsboard.View\",\"events.View\",\"frontendCMSpages.addPage\",\"frontendCMSpages.editPage\",\"frontendCMSpages.delPage\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"students.addStudent\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"wel_office_cat.list\",\"wel_office_cat.edit_cat\",\"wel_office_cat.del_cat\",\"wel_office_cat.View\",\"wel_office_cat.add_cat\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"students.medHistory\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.View\",\"visitors.del_vis\",\"visitors.add_vis\",\"visitors.Download\",\"visitors.Export\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"postal.list\",\"postal.del_postal\",\"postal.Download\",\"postal.add_postal\",\"postal.Export\",\"postal.edit_postal\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.Download\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"Hostel.HostelCat\",\"Hostel.EditHostel\",\"Hostel.listSubs\",\"Hostel.AddHostel\",\"Hostel.delHostel\",\"Hostel.list\",\"depart.list\",\"depart.del_depart\",\"depart.add_depart\",\"depart.edit_depart\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.del_enq\",\"enquiries.View\",\"enquiries.add_enq\",\"enquiries.Download\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"inv_cat.list\",\"inv_cat.del_cat\",\"inv_cat.add_cat\",\"inv_cat.edit_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.Export\",\"items_code.add_item\",\"items_code.edit_item\",\"items_stock.list\",\"items_stock.del_item\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"onlineExams.QuestionsArch\",\"onlineExams.delExam\",\"onlineExams.list\",\"onlineExams.takeExam\",\"onlineExams.addExam\",\"onlineExams.editExam\",\"onlineExams.showMarks\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Dormitories.editDorm\",\"Dormitories.addDormitories\",\"Dormitories.list\",\"Dormitories.delDorm\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"FeeTypes.delFeeType\",\"FeeTypes.list\",\"FeeTypes.addFeeType\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Incomes.addIncome\",\"Incomes.delIncome\",\"Incomes.list\",\"Incomes.editIncome\",\"Incomes.incomeCategory\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"frontendCMSpages.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\"]'),
(5, 'Teacher', 'Default role for teachers', 'teacher', '[\"Attendance.takeAttendance\",\"Attendance.attReport\",\"classes.list\",\"Subjects.list\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"Assignments.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"classSch.list\",\"trans_vehicles.list\",\"depart.list\",\"desig.list\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"Library.Download\",\"Vacation.reqVacation\",\"Vacation.myVacation\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"academicyears.list\",\"classes.list\",\"events.list\",\"gradeLevels.list\",\"mobileNotifications.sendNewNotification\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"studyMaterial.Download\",\"studyMaterial.delMaterial\",\"studyMaterial.addMaterial\",\"studyMaterial.editMaterial\",\"staticPages.list\",\"mediaCenter.View\",\"students.list\",\"students.Attendance\",\"students.delStudent\",\"students.editStudent\"]'),
(6, 'Student', 'Default role for students', 'student', '[\"students.TrackBus\",\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Library.Download\",\"Vacation.myVacation\",\"Homework.list\",\"academicyears.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"Homework.Download\",\"Invoices.list\",\"Invoices.View\",\"Subjects.list\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
(7, 'Parents', 'Default role for Parents', 'parent', '[\"mobileNotifications.sendNewNotification\",\"students.TrackBus\",\"studyMaterial.Download\",\"classes.list\",\"Subjects.list\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Homework.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Transportation.list\",\"newsboard.list\",\"Invoices.list\",\"Invoices.View\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"academicyears.list\",\"students.list\",\"students.Attendance\",\"students.Marksheet\",\"Homework.Answers\",\"Homework.Download\",\"Library.list\",\"Polls.list\",\"complaints.View\",\"complaints.add_complaint\",\"complaints.list\",\"complaints.del_complaint\",\"complaints.Download\",\"complaints.edit_complaint\",\"complaints.Export\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
(8, 'Accountant', '', 'none', '[\"staticPages.View\",\"staticPages.list\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.chgEmailAddress\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"FeeAllocation.editFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.assignUser\",\"FeeDiscount.editFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeTypes.list\",\"FeeTypes.delFeeType\",\"FeeTypes.addFeeType\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"Incomes.list\",\"Incomes.delIncome\",\"Incomes.addIncome\",\"Incomes.incomeCategory\",\"Incomes.editIncome\",\"Invoices.addPayment\",\"Invoices.collInvoice\",\"Invoices.Export\",\"Invoices.dueInvoices\",\"Invoices.delPayment\",\"Invoices.View\",\"Invoices.list\",\"Invoices.payRevert\",\"Invoices.editPayment\",\"dashboard.stats\",\"newsboard.list\",\"events.list\"]'),
(9, 'Librarian', '', 'none', '[\"staticPages.View\",\"staticPages.list\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.chgEmailAddress\",\"dashboard.stats\",\"newsboard.list\",\"events.list\",\"Library.list\",\"Library.delLibrary\",\"Library.addBook\",\"Library.Download\",\"Library.editBook\",\"Library.mngSub\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\"]'),
(10, 'HR', '', 'none', '[\"staticPages.View\",\"staticPages.list\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.chgEmailAddress\",\"dashboard.stats\",\"newsboard.list\",\"events.list\",\"Attendance.attReport\",\"Attendance.takeAttendance\",\"staffAttendance.attReport\",\"staffAttendance.takeAttendance\",\"Vacation.appVacation\",\"employees.list\",\"employees.addEmployee\",\"employees.editEmployee\",\"employees.delEmployee\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.View\",\"enquiries.del_enq\",\"enquiries.Download\",\"enquiries.add_enq\",\"complaints.add_complaint\",\"complaints.Download\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.delUsrPayment\",\"Payroll.hourSalary\",\"Payroll.userSalary\"]'),
(11, 'Receptionist', '', 'none', '[\"staticPages.View\",\"staticPages.list\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.chgEmailAddress\",\"dashboard.stats\",\"newsboard.list\",\"events.list\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.Export\",\"visitors.del_vis\",\"visitors.View\",\"visitors.add_vis\",\"visitors.Download\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.add_call\",\"phn_calls.Export\",\"postal.Export\",\"postal.edit_postal\",\"postal.add_postal\",\"postal.Download\",\"postal.del_postal\",\"postal.list\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"enquiries.add_enq\",\"enquiries.Download\",\"enquiries.del_enq\",\"enquiries.View\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"complaints.list\",\"complaints.edit_complaint\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.add_complaint\",\"complaints.Download\"]'),
(12, 'Store Keeper', '', 'none', '[\"staticPages.View\",\"staticPages.list\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.chgEmailAddress\",\"dashboard.stats\",\"newsboard.list\",\"events.list\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.add_item\",\"items_code.Export\",\"items_code.edit_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.list\",\"items_stock.del_item\",\"iss_ret.del_item\",\"iss_ret.list\",\"iss_ret.issue_item\",\"iss_ret.Download\",\"iss_ret.edit_item\",\"inv_cat.edit_cat\",\"iss_ret.Export\",\"inv_cat.add_cat\",\"inv_cat.list\",\"inv_cat.del_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\"]'),
(13, 'Class Teacher', '!!!!!!!!DO NOT REMOVE THIS ROLE !!!!!!!!ONLY MODIFYING PERMISSIONS IS ALLOWED', 'none', '[\"students.list\",\"students.Attendance\",\"studyMaterial.list\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"studyMaterial.editMaterial\",\"studyMaterial.delMaterial\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.chgEmailAddress\",\"Homework.Answers\",\"Homework.list\",\"Homework.editHomework\",\"Homework.View\",\"Homework.delHomework\",\"Homework.addHomework\",\"Homework.Download\",\"Library.list\",\"Library.Download\",\"Transportation.list\",\"Vacation.reqVacation\",\"Vacation.myVacation\",\"academicyears.list\",\"classSch.list\",\"classes.list\",\"depart.list\",\"desig.list\",\"events.list\",\"events.View\",\"examsList.list\",\"examsList.editExam\",\"examsList.showMarks\",\"examsList.View\",\"examsList.delExam\",\"examsList.controlMarksExam\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"gradeLevels.list\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.View\",\"trans_vehicles.list\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.Download\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"staticPages.list\",\"mediaCenter.View\",\"students.delStudent\",\"students.editStudent\"]'),
(14, 'Media Coordinator', 'Uploading, Editing and Deleting media', '', '[\"mediaCenter.View\",\"mediaCenter.addAlbum\",\"mediaCenter.editAlbum\",\"mediaCenter.delAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editMedia\",\"mediaCenter.delMedia\"]');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `sectionName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classId` int(11) NOT NULL,
  `classTeacherId` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `sectionName`, `classId`, `classTeacherId`) VALUES
(1, 'ut Sec', 6, '[\"44\",\"27\",\"26\",\"32\",\"41\"]'),
(2, 'officia Sec', 3, '[\"35\",\"30\",\"31\",\"34\"]'),
(3, 'nisi Sec', 9, '[\"39\",\"30\",\"32\",\"31\",\"24\",\"25\",\"28\"]'),
(4, 'enim Sec', 12, '[\"41\",\"24\",\"43\",\"27\"]'),
(5, 'voluptas Sec', 6, '[\"24\",\"44\",\"27\",\"36\",\"32\"]'),
(6, 'qui Sec', 4, '[\"29\",\"26\",\"27\"]'),
(7, 'dolorem Sec', 2, '[\"28\",\"29\",\"30\",\"43\",\"35\"]'),
(8, 'rerum Sec', 5, '[\"36\",\"28\",\"24\",\"37\",\"26\",\"27\",\"25\",\"40\"]'),
(9, 'facilis Sec', 8, '[\"32\",\"36\"]'),
(10, 'nemo Sec', 6, '[\"27\",\"24\",\"28\",\"36\",\"44\"]'),
(11, 'voluptate Sec', 1, '[\"25\",\"40\",\"31\",\"42\",\"30\",\"27\",\"43\",\"24\"]'),
(12, 'modi Sec', 6, '[\"36\",\"28\",\"41\"]'),
(13, 'dicta Sec', 10, '[\"38\",\"39\",\"27\",\"42\",\"41\"]'),
(14, 'aut Sec', 9, '[\"34\",\"27\",\"25\",\"24\",\"28\",\"44\",\"37\"]'),
(15, 'quam Sec', 10, '[\"44\",\"39\",\"34\",\"41\",\"40\"]'),
(16, 'corrupti Sec', 6, '[\"27\",\"38\",\"24\",\"42\",\"28\"]'),
(17, 'autem Sec', 4, '[\"29\",\"32\",\"26\"]'),
(18, 'omnis Sec', 3, '[\"29\",\"31\",\"30\",\"34\"]'),
(19, 'ratione Sec', 6, '[\"24\",\"42\",\"44\"]'),
(20, 'nihil Sec', 10, '[\"42\",\"38\",\"40\",\"44\",\"31\"]'),
(21, 'non Sec', 6, '[\"42\",\"28\",\"24\",\"41\",\"32\"]'),
(22, 'facilis Sec', 6, '[\"41\",\"26\",\"28\",\"27\",\"38\"]'),
(23, 'numquam Sec', 9, '[\"32\",\"25\",\"44\",\"24\"]'),
(24, 'ad Sec', 11, '[\"41\",\"39\",\"32\",\"33\",\"27\",\"42\"]'),
(25, 'accusantium Sec', 12, '[\"42\",\"27\",\"41\",\"39\"]'),
(26, 'qui Sec', 8, '[\"35\",\"44\",\"41\",\"32\"]'),
(27, 'labore Sec', 9, '[\"24\",\"34\",\"39\",\"44\",\"33\",\"27\",\"30\"]'),
(28, 'omnis Sec', 9, '[\"25\",\"32\",\"31\",\"30\"]'),
(29, 'rem Sec', 10, '[\"34\",\"27\",\"39\",\"43\",\"41\"]'),
(30, 'similique Sec', 1, '[\"41\",\"33\",\"24\",\"40\",\"27\"]'),
(31, 'omnis Sec', 10, '[\"41\",\"43\",\"44\",\"38\",\"42\",\"27\",\"36\"]'),
(32, 'ullam Sec', 2, '[\"35\",\"38\",\"30\",\"29\",\"28\"]'),
(33, 'minima Sec', 11, '[\"28\",\"42\",\"39\",\"27\"]'),
(34, 'fugiat Sec', 11, '[\"41\",\"36\",\"44\",\"42\"]'),
(35, 'cumque Sec', 10, '[\"24\",\"40\",\"43\",\"36\",\"32\"]'),
(36, 'quibusdam Sec', 10, '[\"41\",\"27\",\"44\",\"24\",\"32\",\"36\",\"34\"]'),
(37, 'ut Sec', 6, '[\"36\",\"32\",\"41\",\"27\",\"28\"]'),
(38, 'cupiditate Sec', 4, '[\"27\",\"29\"]'),
(39, 'illum Sec', 5, '[\"33\",\"40\",\"38\",\"34\",\"36\",\"25\",\"24\",\"28\"]'),
(40, 'aut Sec', 5, '[\"40\",\"43\",\"28\",\"24\",\"33\"]'),
(41, 'eveniet Sec', 7, '[\"35\",\"28\",\"42\",\"24\"]'),
(42, 'dolore Sec', 11, '[\"44\",\"36\",\"41\",\"35\",\"32\",\"27\"]'),
(43, 'sunt Sec', 5, '[\"33\",\"36\",\"24\",\"40\",\"26\"]'),
(44, 'dolorum Sec', 12, '[\"40\",\"37\",\"39\",\"36\",\"24\",\"27\",\"42\"]'),
(45, 'est Sec', 9, '[\"44\",\"33\",\"39\",\"30\",\"34\",\"28\",\"32\"]'),
(46, 'maiores Sec', 2, '[\"28\",\"30\",\"32\",\"43\",\"36\"]'),
(47, 'quibusdam Sec', 6, '[\"27\",\"36\",\"32\",\"38\",\"42\"]'),
(48, 'esse Sec', 11, '[\"37\",\"32\",\"35\",\"28\"]'),
(49, 'et Sec', 3, '[\"30\",\"41\",\"35\",\"34\"]'),
(50, 'aut Sec', 9, '[\"30\",\"43\",\"32\",\"31\"]'),
(51, 'culpa Sec', 10, '[\"41\",\"32\",\"35\",\"43\",\"44\",\"34\",\"39\"]'),
(52, 'provident Sec', 8, '[\"44\",\"35\"]'),
(53, 'delectus Sec', 3, '[\"35\",\"34\"]'),
(54, 'recusandae Sec', 3, '[\"29\",\"34\"]'),
(55, 'nihil Sec', 12, '[\"42\",\"37\",\"43\",\"38\"]'),
(56, 'veniam Sec', 4, '[\"26\",\"33\"]'),
(57, 'voluptatem Sec', 10, '[\"42\",\"36\",\"24\",\"27\",\"35\"]'),
(58, 'ut Sec', 7, '[\"28\",\"42\",\"37\"]'),
(59, 'quas Sec', 9, '[\"27\",\"31\",\"24\",\"44\"]'),
(60, 'id Sec', 1, '[\"33\",\"27\",\"28\",\"24\",\"30\",\"40\",\"32\",\"41\"]');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `fieldName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fieldValue` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `fieldName`, `fieldValue`) VALUES
(1, 'address', 'South Office Para, New Parastoli, Shyamali Colony, Doranda, Ranchi, Jharkhand 834002'),
(2, 'footer', 'All Rights Reserved, virtu.co'),
(3, 'lastUpdateCheck', '1561789833'),
(4, 'latestVersion', '3.0'),
(5, 'latestVersionUrl', 'http:'),
(6, 'phoneNo', '2253777'),
(7, 'siteTitle', 'Virtu School'),
(8, 'systemEmail', 'demo.virtucutebrains@gmail.com'),
(9, 'finishInstall', '1'),
(10, 'schoolTerms', 'Privacy Policy of CuteBrains<br />\r\n					With Effect From &ndash; 22.03.2019<br />\r\n					Privacy Policy<br />\r\n					Virtu Information Technologies Pvt. Ltd. (&ldquo;our&rdquo;, &ldquo;we&rdquo;, or &ldquo;us&rdquo;) operates the CuteBrains web and mobile application ( the &ldquo;Service&rdquo;).<br />\r\n					This page provides you the information regarding our policies concerning disclosure, use, and collection of personal data, when you opt to use our services. This section also explains the choices that you have regarding our data.<br />\r\n					We make use of the data to provide you the service and data is also used to improve the services being offered. When you use this service, it is implied that you give your consent to the use and collection of information according to this policy. If not stated specifically in this Privacy Policy, the terminologies used in this Privacy Policy carries the same meaning as mentioned in our Terms and Conditions.<br />\r\n					Information Gathering And Further Use<br />\r\n					Various types of Information is collated by us to offer you and further improve this service.<br />\r\n					Kinds of Data Collection<br />\r\n					Personal Data<br />\r\n					When you make use of our services, we may ask you to furnish a certain kind of personally identifiable information.&nbsp; This data would be used either to contact you or for your identification (&ldquo;Personal Data&rdquo;). The scope of personally identifiable information is inclusive of but not limited to the following:\r\n					<ul>\r\n						<li>First name, middle name and last name</li>\r\n						<li>Email ID</li>\r\n						<li>Usage and Cookies Data</li>\r\n						<li>Phone number</li>\r\n					</ul>\r\n					Usage Data<br />\r\n					When you access the application through any device, some information may be collected by us automatically. This information is inclusive but not limited to type of device, unique ID of your device, the IP address of device, your operating system, type of internet browser you use, unique device identifiers and various other kinds of Usage data (&ldquo;Diagnostic Data&rdquo;) .<br />\r\n					Cookies &amp; Tracking Data<br />\r\n					We make use of cookies and other similar type of tracking data to follow the activities done by you on our application or service and we withhold some information.<br />\r\n					Cookies are nothing but files with little amount of data. They may or may not include an anonymous unique identifier. The website sends cookies to your browser, which is stored on your device. Use of scripts, tags, and beacons is made by the tracking technologies to collate and keep a track of information. This is done for improvement and analysis of our services.<br />\r\n					However, you can instruct your browser not to accept all cookies or to give you an indication when a cookie is being sent. But we would like to mention specifically that if you refuse to accept cookies, you would not be able to use some sections of our service being offered.<br />\r\n					Some Examples of Cookies used by us:-\r\n					<ul>\r\n						<li>Security Cookies: These are used for security purposes.</li>\r\n						<li>Session Cookies: These are used to operate our service.</li>\r\n						<li>Preference Cookies: These are used to remember certain settings and your preferences.</li>\r\n					</ul>\r\n					Data Usage<br />\r\n					CuteBrains makes use of the collected data for various purposes:\r\n					<ul>\r\n						<li>For prevention, detection and addressing of technical issues</li>\r\n						<li>For monitoring service usage</li>\r\n						<li>For collection of valuable insights to improve the service</li>\r\n						<li>For providing support and customer care services</li>\r\n						<li>For allowing you to participate in interactive options of our application , when you choose to do so</li>\r\n						<li>For sending you notification about changes of our service</li>\r\n						<li>For maintenance and providing of service</li>\r\n					</ul>\r\n					Data Transfer<br />\r\n					The information that you choose to furnish to us inclusive of Personal Data may be sent to computers outside your own region of stay. In these circumstances the governmental jurisdiction and data protection law may be different from what is applicable in your region of stay or country. &nbsp;<br />\r\n					If your region of stay is outside India, then please note that we send your personal identifiable data to India and process it there.<br />\r\n					When you agree to this privacy policy and provide the submission of information, then it is understood that you agree to this clause of Data Transfer.<br />\r\n					CuteBrains would assure that your data is treated securely and according to the Privacy Policy stated herein. &nbsp;We would also ensure that no transfer of your personal identifiable data takes place to any organization or country where adequate controls and data security measures are not in place.<br />\r\n					Data Disclosure<br />\r\n					Legal Prerequisites<br />\r\n					CuteBrains may disclose your personal identifiable data in good belief where the action is needed for:\r\n					<ul>\r\n						<li>For protection against legal liability</li>\r\n						<li>For protection of personal safety of users of the service or the public at large</li>\r\n						<li>For investigating and protecting against possible wrongdoing related to the service</li>\r\n						<li>For defending and protecting the rights or property of CuteBrains</li>\r\n						<li>For complying with a legal obligation</li>\r\n					</ul>\r\n					Data Security<br />\r\n					The safety and security of your data is very vital to us, but remember that the process of data transfer over the internet, or electronic data interchange is never 100% secure. Hence, it must be understood by you that however, we fully strive to protect and safeguard your personal data, but we cannot guarantee the absolute security of the data.<br />\r\n					Providers of Service<br />\r\n					We may make use or employ third party companies to assist us in providing you the services on our behalf, to perform service related activities or in the analysis of the service usage.<br />\r\n					The third party companies that we would be employing shall just offer you the services on our behalf and are in no way obligated to use or disclose your personal data for any other purpose.<br />\r\n					Links to Other Sites<br />\r\n					Our application may contain links to other sites that are not operated by us. We strictly recommend that you visit the Privacy policy of each and every site you visit.&nbsp;<br />\r\n					We do not supervise or control the content, privacy policies etc. of the third party services or sites.<br />\r\n					Privacy for Children<br />\r\n					Our services are not meant to be addressed for any one below the age of 18 (Children).<br />\r\n					Our policy is not to collect the personally identifiable information from any one below the age of 18. If your child has knowingly or unknowingly provided us the personal identifiable information, then you as a parent must bring this to our notice. We would then take steps to remove this information from our servers.<br />\r\n					Changes to this existing Privacy Policy<br />\r\n					Our privacy policy is subject to updates from time to time. We are supposed to post the new privacy policy on this page time to time when such updates are available.<br />\r\n					You would be sent an email or other conspicuous notice may be sent to you, in order to notify you regarding the abovementioned changes. We are also mentioning an effective date at the top of this Privacy Policy.<br />\r\n					This is a general advice to you, that you keep checking this page for sighting any changes that are made to this privacy policy.<br />\r\n					Contact Us<br />\r\n					If you have any queries regarding this privacy policy, please get in touch with us via email info@virtu.co'),
(11, 'attendanceModel', 'class'),
(12, 'smsProvider', '{\"smsProvider\":\"nexmo\",\"nexmoApiKey\":\"\",\"nexmoApiSecret\":\"\",\"nexmoPhoneNumber\":\"dfc\",\"twilioSID\":\"ee\",\"twilioToken\":\"\",\"twilioFN\":\"\",\"hoiioAppId\":\"\",\"hoiioAccessToken\":\"\",\"clickatellApiKey\":\"\",\"clickatellUserName\":\"\",\"clickatellPassword\":\"\",\"intellismsUserName\":\"\",\"intellismsPassword\":\"\",\"intellismsSenderNumber\":\"\",\"bulksmsUserName\":\"\",\"bulksmsPassword\":\"\",\"conceptoUserName\":\"\",\"conceptoPassword\":\"\",\"conceptoSenderId\":\"\",\"msg91Authkey\":\"\",\"msg91SenderId\":\"\",\"customHTTPToFormat\":\"+\",\"customHTTPType\":\"post\",\"nexmoFromId\":\"\"}'),
(13, 'mailProvider', '{\"mailProvider\":\"mail\",\"smtpHost\":\"\",\"smtpPort\":\"\",\"smtpUserName\":\"\",\"smtpPassWord\":\"\",\"AmazonSESAccessKey\":\"\",\"AmazonSESSecretKey\":\"\",\"AmazonSESVerifiedSender\":\"\",\"smtpTLS\":\"TLS\"}'),
(14, 'examDetailsNotif', 'mailsms'),
(15, 'examDetailsNotifTo', 'both'),
(16, 'absentNotif', 'mailsms'),
(17, 'address2', 'address line 2'),
(18, 'paypalPayment', ''),
(19, 'paymentTax', '0'),
(20, 'activatedModules', '[\"eventsAct\",\"attendanceAct\",\"staffAttendanceAct\",\"bookslibraryAct\",\"assignmentsAct\",\"mediaAct\",\"paymentsAct\",\"pollsAct\",\"reportsAct\",\"materialsAct\",\"vacationAct\",\"transportAct\",\"staticPages\",\"messagesAct\",\"calendarAct\",\"classSchAct\",\"sendNotifAct\",\"mailSmsAct\",\"homeworkAct\",\"payrollAct\",\"incomeAct\",\"conMessAct\",\"employeesAct\",\"newsboardAct\",\"certAct\",\"visitorsAct\",\"phoneCallsAct\",\"postalAct\",\"complainAct\",\"enquiriesAct\",\"staticpagesAct\"]'),
(21, 'languageDef', '1'),
(22, 'languageAllow', '1'),
(23, 'layoutColor', 'red'),
(24, 'thisVersion', '5.1'),
(25, 'currency_code', 'INR'),
(26, 'currency_symbol', '₹'),
(27, 'studentVacationDays', '21'),
(28, 'teacherVacationDays', '18'),
(29, 'daysWeekOff', '[\"1\"]'),
(30, 'officialVacationDay', '[]'),
(31, 'attendanceOnMarksheet', '1'),
(32, 'layoutColorUserChange', '1'),
(33, 'siteLogo', 'image'),
(34, 'siteLogoAdditional', 'Virtu School'),
(35, 'allowPublicReg', '1'),
(36, 'invoiceGenStudentCreated', '1'),
(37, 'invoiceGenStudentPromotion', '1'),
(38, 'dateformat', 'd/m/Y'),
(39, 'enableSections', '1'),
(40, 'emailIsMandatory', '0'),
(41, 'allowTeachersMailSMS', 'both'),
(42, 'gTrackId', ''),
(43, 'loginPageStyle', 'c'),
(44, 'registerPageStyle', 'c'),
(45, 'forgetPwdPageStyle', 'c'),
(46, 'pullAppClosed', '600'),
(47, 'pullAppActive', '3'),
(48, 'pullAppMessagesActive', '2'),
(49, 'timezone', 'Asia/Kolkata'),
(50, 'gcalendar', 'gregorian'),
(51, 'studentsSort', 'fullName ASC'),
(52, 'teachersSort', 'id + 0 DESC'),
(53, 'parentsSort', 'fullName ASC'),
(54, 'favicon', 'd'),
(55, 'paypalEnabled', '0'),
(56, '2coEnabled', '0'),
(57, 'twocheckoutsid', ''),
(58, 'twocheckoutHash', ''),
(59, 'payumoneyEnabled', '0'),
(60, 'payumoneyKey', ''),
(61, 'payumoneySalt', ''),
(62, 'authPageImage', '1'),
(63, 'authPageColor', '#c0c0c0'),
(64, 'leftmenuScroller', 'e'),
(65, 'calendarOffset', '0'),
(66, 'firebase_apikey', 'AAAA1Rsyd5E:APA91bGLOzWcPwrFUiOZAgI3bJ7l6uXTzL2xg_-BRQeu1_LHO4CSuav6dUVX71EScIXoXGH3ldFYW2FHuHTQG_37ruT5URMbFvF5etIz9G-0DsL1Z1kufAsmDAXkJYmZlk2wqF_F_CoQ'),
(67, 'dueInvoicesNotif', 'mailsms'),
(68, 'dueInvoicesNotifTo', 'both'),
(69, 'https_enabled', '1'),
(70, 'country', 'IN'),
(71, 'wysiwyg_type', 'advanced'),
(72, 'cms_active', '1'),
(73, 'cms_template', 'modern'),
(74, 'cms_facebook', 'http://facebook.com/'),
(75, 'cms_google', ''),
(76, 'cms_twitter', 'https://twitter.com/'),
(77, 'cms_footer_right', '&copy; 2018. Your company / name goes here'),
(78, 'cms_footer_left', '&copy; 2018. Your company / name goes here'),
(79, 'biometric_device_ip', '192.168.1.224'),
(80, 'biometric_device_status', ''),
(81, 'cms_theme', 'blue'),
(82, 'sAttendanceInOut', '1'),
(83, 'finishInstall', '1'),
(84, 'eazypayEnabled', '1'),
(85, 'enc_key', '2119472418501000'),
(86, 'merch_id', '211851'),
(87, 'returnUrl', 'https://payments.cutebrains.com/return'),
(88, 'fineAmount', '2'),
(89, 'invoice_sc_1', '01/06/2019'),
(90, 'months_1', '2'),
(91, 'invoice_sc_due_1', '21/06/2019'),
(92, 'invoice_sc_2', ''),
(93, 'months_2', '2'),
(94, 'invoice_sc_due_2', ''),
(95, 'invoice_sc_3', ''),
(96, 'months_3', '2'),
(97, 'invoice_sc_due_3', ''),
(98, 'invoice_sc_4', ''),
(99, 'months_4', ''),
(100, 'invoice_sc_due_4', ''),
(101, 'invoice_sc_5', ''),
(102, 'months_5', ''),
(103, 'invoice_sc_due_5', ''),
(104, 'invoice_sc_6', ''),
(105, 'months_6', ''),
(106, 'invoice_sc_due_6', ''),
(107, 'invoice_sc_7', ''),
(108, 'months_7', ''),
(109, 'invoice_sc_due_7', ''),
(110, 'invoice_sc_8', ''),
(111, 'months_8', ''),
(112, 'invoice_sc_due_8', ''),
(113, 'invoice_sc_9', ''),
(114, 'months_9', ''),
(115, 'invoice_sc_due_9', ''),
(116, 'invoice_sc_10', ''),
(117, 'months_10', ''),
(118, 'invoice_sc_due_10', ''),
(119, 'invoice_sc_11', ''),
(120, 'months_11', '0'),
(121, 'invoice_sc_due_11', ''),
(122, 'invoice_sc_12', ''),
(123, 'months_12', '0'),
(124, 'invoice_sc_due_12', ''),
(125, 'fine_tra', '50');

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE `static_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `pageTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pageContent` text COLLATE utf8_unicode_ci NOT NULL,
  `pageActive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `static_pages`
--

INSERT INTO `static_pages` (`id`, `pageTitle`, `pageContent`, `pageActive`) VALUES
(1, 'Home', 'Suscipit qui odio non impedit sint aspernatur architecto ducimus sint.', 1),
(2, 'About us', 'Consequuntur non nihil quis ut qui ut quas nostrum delectus iste.', 1),
(3, 'CMS', 'Consectetur alias itaque fugit aut quaerat accusantium laudantium eos et pariatur impedit cum necessitatibus animi.', 1),
(4, 'Sections', 'Molestiae ea ipsum reiciendis eius ea eos illo similique sed et non aut animi.', 1),
(5, 'Subjects', 'Sunt quibusdam nobis ut pariatur rerum similique ut.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `store_desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_academic_years`
--

CREATE TABLE `student_academic_years` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `cat_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cat_desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_categories`
--

INSERT INTO `student_categories` (`id`, `cat_title`, `cat_desc`) VALUES
(1, 'Fugiat.', 'Aut aspernatur magnam quasi quisquam rerum dolor sed autem perspiciatis enim sed totam eum nesciunt velit labore commodi fugit voluptas officiis sit tempora.'),
(2, 'Necessitatibus.', 'Sapiente maxime dolores voluptatem sed qui numquam et vel repellendus et harum quia sed expedita a aut nihil et.'),
(3, 'Deserunt neque.', ''),
(4, 'Est.', ''),
(5, 'Nostrum quibusdam.', 'Nobis quod officia repellat accusantium et cumque recusandae doloremque.'),
(6, 'Error ratione.', 'Magnam vero quo fugiat quidem nostrum in tempora tempore consequatur omnis quae molestiae fugit est laudantium expedita et asperiores et iste est laudantium.'),
(7, 'Omnis quo.', 'Quaerat ea totam et et vel consectetur qui aperiam quod voluptatibus ducimus ea neque sunt odit nobis debitis ipsam corrupti molestiae.'),
(8, 'Laboriosam sunt.', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_docs`
--

CREATE TABLE `student_docs` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `material_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `material_description` text COLLATE utf8_unicode_ci,
  `material_file` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_id` text COLLATE utf8_unicode_ci NOT NULL,
  `sectionId` text COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `study_material`
--

INSERT INTO `study_material` (`id`, `material_title`, `material_description`, `material_file`, `class_id`, `sectionId`, `subject_id`, `teacher_id`) VALUES
(1, 'Illo.', '', '', '[\"11\",\"7\"]', '[\"19\",\"28\"]', 10, 32),
(2, 'Deserunt qui sint.', '', '', '[\"6\",\"3\",\"7\"]', '[\"55\",\"26\"]', 6, 38),
(3, 'Sint temporibus molestias.', '', '', '[\"1\"]', '[\"27\",\"52\",\"4\"]', 8, 39),
(4, 'Quos praesentium.', '', '', '[\"12\",\"5\",\"11\"]', '[\"51\"]', 2, 42),
(5, 'Harum ea.', '', '', '[\"10\",\"12\",\"4\"]', '[\"14\",\"28\"]', 1, 41),
(6, 'Vero.', '', '', '[\"1\"]', '[\"35\",\"30\"]', 10, 37),
(7, 'Cupiditate architecto.', '', '', '[\"5\"]', '[\"46\",\"3\",\"20\"]', 6, 40),
(8, 'Natus molestiae.', '', '', '[\"8\",\"3\",\"12\"]', '[\"41\"]', 6, 38),
(9, 'Placeat sequi aspernatur.', '', '', '[\"7\",\"2\",\"5\"]', '[\"1\",\"46\",\"58\"]', 1, 36),
(10, 'Quibusdam.', '', '', '[\"11\"]', '[\"54\"]', 3, 43),
(11, 'Ipsam asperiores non.', '', '', '[\"4\"]', '[\"45\"]', 8, 31),
(12, 'Incidunt assumenda commodi.', '', '', '[\"8\"]', '[\"35\",\"7\"]', 10, 40),
(13, 'Tempore atque.', '', '', '[\"8\"]', '[\"22\",\"28\"]', 9, 40),
(14, 'Officia.', '', '', '[\"10\"]', '[\"41\"]', 6, 37),
(15, 'Perspiciatis voluptas.', '', '', '[\"2\",\"4\",\"11\"]', '[\"4\"]', 5, 26);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(10) UNSIGNED NOT NULL,
  `subjectTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `passGrade` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `finalGrade` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `teacherId` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subjectTitle`, `passGrade`, `finalGrade`, `teacherId`) VALUES
(1, 'Quisquam.', '40', '100', '[\"39\",\"26\",\"40\",\"28\",\"37\",\"30\",\"24\",\"32\",\"38\",\"34\",\"42\",\"29\"]'),
(2, 'Quia in.', '20', '70', '[\"28\",\"41\",\"26\",\"24\",\"39\",\"32\",\"38\",\"42\",\"43\",\"25\",\"40\"]'),
(3, 'Quas sequi quisquam.', '40', '70', '[\"37\",\"30\",\"24\",\"27\",\"35\",\"31\",\"39\",\"26\",\"33\"]'),
(4, 'Ipsam.', '40', '60', '[\"37\",\"42\",\"28\",\"24\",\"27\",\"40\",\"31\",\"33\",\"34\"]'),
(5, 'Ut natus omnis.', '20', '90', '[\"36\",\"27\",\"40\",\"44\",\"34\",\"26\",\"41\",\"38\",\"32\",\"37\",\"30\"]'),
(6, 'Autem error voluptas.', '40', '70', '[\"44\",\"32\",\"26\",\"42\",\"33\",\"36\",\"37\",\"27\"]'),
(7, 'Ad non.', '40', '70', '[\"28\",\"40\",\"39\",\"34\",\"35\",\"37\",\"38\",\"29\",\"31\"]'),
(8, 'Ipsam est.', '10', '60', '[\"35\",\"36\",\"37\",\"29\",\"43\",\"38\"]'),
(9, 'Saepe in.', '50', '100', '[\"39\",\"30\",\"38\",\"34\",\"31\",\"43\",\"32\",\"37\",\"24\",\"26\",\"25\",\"36\",\"41\"]'),
(10, 'Qui.', '10', '80', '[\"27\",\"41\",\"42\",\"31\",\"43\",\"35\",\"36\",\"40\",\"28\",\"24\",\"33\",\"38\",\"32\",\"26\",\"39\"]');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `transportTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `routeDetails` text COLLATE utf8_unicode_ci,
  `vehicles_list` text COLLATE utf8_unicode_ci NOT NULL,
  `transportFare` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transportation`
--

INSERT INTO `transportation` (`id`, `transportTitle`, `routeDetails`, `vehicles_list`, `transportFare`) VALUES
(1, 'Saepe tempore.', 'Hic quia voluptas et velit.', '[\"1\",\"10\"]', '880'),
(2, 'Fuga aliquam.', '', '[\"5\",\"10\"]', '820'),
(3, 'Corrupti.', 'Suscipit sint ut.', '[\"7\"]', '750'),
(4, 'Commodi et.', 'Est eos enim.', '[\"2\"]', '880'),
(5, 'Eum et.', '', '[\"4\",\"9\"]', '780'),
(6, 'Expedita quasi.', 'Molestias laborum error.', '[\"10\",\"9\"]', '650'),
(7, 'Adipisci exercitationem.', 'Dolores rem aperiam.', '[\"6\",\"10\",\"1\"]', '660'),
(8, 'Quo veniam.', 'Velit laudantium.', '[\"7\"]', '900'),
(9, 'Sunt consequuntur.', 'Cum harum voluptates.', '[\"6\",\"2\"]', '870'),
(10, 'Odio.', 'Et quia ab.', '[\"8\"]', '720'),
(11, 'Officiis quo.', '', '[\"4\"]', '600'),
(12, 'Cumque.', '', '[\"3\",\"8\",\"10\"]', '610'),
(13, 'Quos.', 'Non tenetur repellendus.', '[\"6\"]', '520'),
(14, 'Et numquam.', '', '[\"6\",\"7\",\"10\"]', '690'),
(15, 'Optio.', '', '[\"5\"]', '890');

-- --------------------------------------------------------

--
-- Table structure for table `transport_vehicles`
--

CREATE TABLE `transport_vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `plate_number` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `vehicle_color` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `vehicle_model` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `driver_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `driver_photo` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `driver_license` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `driver_contact` text COLLATE utf8_unicode_ci NOT NULL,
  `vehicle_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transport_vehicles`
--

INSERT INTO `transport_vehicles` (`id`, `plate_number`, `vehicle_color`, `vehicle_model`, `driver_name`, `driver_photo`, `driver_license`, `driver_contact`, `vehicle_notes`) VALUES
(1, '3445', '', 'architecto', 'Prof. Angus Kautzer IV', '', '649234304110015', 'Ut et asperiores ut rem.', 'Voluptatem enim consequatur atque.'),
(2, '7918', '', 'autem', 'Wilburn Langosh', '', '396294510426033', 'Voluptatem deleniti ad eius odit deserunt.', 'Qui est veniam quia.'),
(3, '5701', '', 'quia', 'Miss Alexanne Hodkiewicz Jr.', '', '908448862888078', 'Dolorum nihil autem qui.', 'Cupiditate odit officia saepe deleniti.'),
(4, '9879', '', 'dignissimos', 'Elmira Hagenes', '', '491227870194286', 'Recusandae voluptates officiis.', 'Exercitationem omnis nulla perspiciatis.'),
(5, '1873', '', 'autem', 'Prof. Luciano Schinner', '', '473831510774376', 'Quidem incidunt rerum.', 'Vel ipsa quam maiores.'),
(6, '7679', '', 'non', 'Tobin Yost', '', '695754651682651', 'Rem tenetur quo.', 'Blanditiis ipsam necessitatibus distinctio illum blanditiis eaque molestiae.'),
(7, '3395', '', 'laudantium', 'Kamryn Ruecker Sr.', '', '503861458952876', 'Ut id repudiandae.', 'Natus iusto facere quisquam saepe excepturi.'),
(8, '4156', '', 'ab', 'Hipolito Towne PhD', '', '433723877757978', 'Fugiat voluptatem est veritatis tenetur.', 'Et esse veritatis veritatis eveniet.'),
(9, '7342', '', 'ea', 'Eda Crooks Sr.', '', '230827947746256', 'Fugiat voluptas deserunt ea.', 'Quia ad quae tempora placeat consequuntur similique.'),
(10, '9341', '', 'corporis', 'Tatyana O\'Kon', '', '274434806325101', 'Hic sunt doloremque omnis.', 'Eaque et fuga quia earum nobis eos esse.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fullName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `role_perm` int(11) NOT NULL,
  `department` int(11) DEFAULT NULL,
  `designation` int(11) DEFAULT NULL,
  `studentAcademicYear` int(11) NOT NULL,
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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `remember_token`, `fullName`, `role`, `role_perm`, `department`, `designation`, `studentAcademicYear`, `activated`, `studentRollId`, `admission_number`, `admission_date`, `std_category`, `auth_session`, `birthday`, `gender`, `address`, `phoneNo`, `mobileNo`, `studentClass`, `studentSection`, `religion`, `parentProfession`, `parentOf`, `photo`, `isLeaderBoard`, `restoreUniqId`, `transport`, `transport_vehicle`, `hostel`, `medical`, `user_position`, `defLang`, `defTheme`, `salary_type`, `salary_base_id`, `comVia`, `father_info`, `mother_info`, `biometric_id`, `library_id`, `account_active`, `customPermissionsType`, `customPermissions`, `firebase_token`, `updated_at`) VALUES
(1, 'ahmedsk', 'miller40@gislason.net', '$2y$10$LadsXAmi2srmwWL8vjqm9ODbSzqojq8NENsHgSKyvgkUXLY4QUWu6', '', 'Ahmed Sayed', 'admin', 2, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '460469', '+25 1093684', 0, 0, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(2, 'virtu', 'rosalinda84@smith.biz', '$2y$10$Axi0jfJPiLsGhtLooYWe/OgeNaccvbuqQiQ6itl5wU.F8y0BXDbvu', '', 'Virtu', 'admin', 2, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '151990', '+62 5876466', 0, 0, '', NULL, '', '025.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'employee', 'marcelo06@gusikowski.org', '$2y$10$Nh5xY5EhZ8Wh7/A1BScuSO1CeqtsCwfb3srOthDySWXAUncDGz.ca', '', '[Em] Mrs. Adaline Blanda', 'employee', 11, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '379747', '+57 2862112', 0, 0, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'whermann', 'modesto.kautzer@mann.org', '$2y$10$7/SJjQAoKKZMbJU.o//pY.deszkVv.XmoA1xyIsoCAagS6vM4MJnm', '', '[Em] Lauren Luettgen', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '416467', '+67 6568334', 0, 0, '', NULL, '', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'mkuhlman', 'rachelle04@gmail.com', '$2y$10$wfzULyHrP55aZeH8M0NXH.NS3fHk2wwDHcUgESSrBQN5.JmKs1bMi', '', '[Em] Jacklyn Hane II', 'employee', 10, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '219359', '+62 1570985', 0, 0, '', NULL, '', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'qhand', 'considine.lilliana@gmail.com', '$2y$10$OWXenor3z0SRNVljaRV2pusKj3Ks.sxIDKSwHiOcRLwK77klqC5r2', '', '[Em] Diamond Bayer', 'employee', 8, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '274451', '+29 9294734', 0, 0, '', NULL, '', '065.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'emmalee.sawayn', 'bernhard53@walter.net', '$2y$10$59UdLY992EQjoGD5Jt.LVuuEjEUnwAB.rCoHt5etvErJr/pEbwg5O', '', '[Em] Prof. Susie Mitchell', 'employee', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '620465', '+16 6708025', 0, 0, '', NULL, '', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'porter23', 'eadams@yahoo.com', '$2y$10$NQr9VKnIBi0R.HUpw04dd.0NOpn0nwcGTcWV5p/oH3bqSMqpChVR.', '', '[Em] Sydney Harber MD', 'employee', 13, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '200173', '+86 9208229', 0, 0, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'ygrimes', 'quigley.nicole@yahoo.com', '$2y$10$19F0ch7/2Zep.0nh0ZSqSejIYQ5PZc1lvv/sqnSbpQjyE8oYP252y', '', '[Em] Euna Prohaska', 'employee', 10, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '319582', '+14 3414811', 0, 0, '', NULL, '', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'morgan.block', 'kuhlman.kathlyn@vandervort.com', '$2y$10$ONauFEUwC3h43zCYKZXttecHk3ylbrBoIyz/qYNNdToMHhQldtoPu', '', '[Em] Theron Roob', 'employee', 4, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '788118', '+74 9526649', 0, 0, '', NULL, '', '077.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'zmaggio', 'anika.trantow@hotmail.com', '$2y$10$ot5iBVlGQgKMGWNET9CGU.0LEAMpZI9LSxeU4O/pzCJXp6yJDJq8e', '', '[Em] Prof. Chance Leffler V', 'employee', 4, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '556135', '+60 9637128', 0, 0, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'altenwerth.raegan', 'roob.larissa@gmail.com', '$2y$10$01ldJvueNcwfCAvtBfoH9e424n4Y/M/X8gCPJd7bzs1b7SyoSXV0i', '', '[Em] Dr. Domenico Dach', 'employee', 11, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '672955', '+39 7350573', 0, 0, '', NULL, '', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'vrempel', 'camille95@hotmail.com', '$2y$10$F2Lx2XGr1MbTlZG7DP6OR.ZQIEiSDHtvvX2fsI17VvHje4.SoBOlC', '', '[Em] Gussie Schamberger', 'employee', 13, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '819737', '+56 4289342', 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'nasir.wisozk', 'adele38@king.com', '$2y$10$ojMKr8nti4Ur1DlPwcV.JOmp8QKtIJipkVIP7NNJqXtuoXVQ71TXK', '', '[Em] Owen Bogisich III', 'employee', 3, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '768439', '+84 9420984', 0, 0, '', NULL, '', '097.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'nhoppe', 'ureichel@yahoo.com', '$2y$10$u2LCo4im8ZVYFX3wQVA5GOLEy7KEs0XkKhaHS/pOjjAr8bFoWjjuq', '', '[Em] Kaia Towne', 'employee', 11, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '994838', '+70 5042452', 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'peyton.davis', 'dereck50@yahoo.com', '$2y$10$nMSYbJECCdD5Fuy5.ZOAS.7cfRc.8sm4F2ci6ahY4pCP1qsead1uq', '', '[Em] Josefina Nader', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '226704', '+84 1229933', 0, 0, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'micheal.walsh', 'bartoletti.mittie@boyer.biz', '$2y$10$2lUgiUrdo54mG8a0MtGbe.ul71HWWnzg8NRBoiw6ZO2zVLZ32gy8u', '', '[Em] Prof. Jerel Glover V', 'employee', 10, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '701121', '+63 7247557', 0, 0, '', NULL, '', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'melba.jerde', 'virginie.stark@yahoo.com', '$2y$10$GIjngfCYlHBWOkEHYC.NRetLPN//zw.6pMo4bAVf2gLLI8jWizhDS', '', '[Em] Bernardo Kessler', 'employee', 11, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '550594', '+71 3058309', 0, 0, '', NULL, '', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'christy55', 'morton.hartmann@heathcote.com', '$2y$10$hzF6qRCpS0On.k8MWaQCku/3Z0hceWOD5/PlbdQYAklSQ9vC9AUwC', '', '[Em] Scotty Koelpin', 'employee', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '100032', '+53 4807812', 0, 0, '', NULL, '', '021.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'djohns', 'davis.harmon@bayer.com', '$2y$10$5V.im1k0B/aH9L7qwLKhQeLMrhCRXznNVIUXlpNs0HKoQpkX7VDg.', '', '[Em] Dr. Furman Nolan', 'employee', 10, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '549063', '+47 7213722', 0, 0, '', NULL, '', '015.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'ferry.garnett', 'hill.rory@yahoo.com', '$2y$10$V/OI4R1f2geBAIrDYnZnSOWkXjF/zLGaype0ktrNDvh89XvvRkY5y', '', '[Em] Annette Hintz', 'employee', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '656747', '+73 6149217', 0, 0, '', NULL, '', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'fcorkery', 'clementina76@ohara.com', '$2y$10$uECKQalpmkia8Gw5H6zSKuiN3HYJQSVFq5CF1zarBhMiBWrxjoOku', '', '[Em] Ms. Courtney Zieme PhD', 'employee', 11, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '481715', '+57 3899075', 0, 0, '', NULL, '', '052.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'nicholaus.zboncak', 'kuhlman.alec@lesch.com', '$2y$10$iiQ5Lr/mnRUhhxnbjPwNKuD9.J6ql./J72qHDdYDyqNvbSi3z0.ne', '', '[Em] Prof. Myrna Cummings DDS', 'employee', 3, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '819798', '+45 5811533', 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'teacher', 'qauer@gmail.com', '$2y$10$ja8cQeQIEcyCHOHa.iuztu31XsmM2ZzkKXMlUabT0cRD9FlWk/a5.', '', '[Te] Aryanna Veum', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '458752', '+53 4171066', 0, 0, '', NULL, '', '014.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'eschmitt', 'elody86@heathcote.com', '$2y$10$Gf.eW0haGmHn9Q3C7S088eky6xxP9PIGENjhQQnLvEtvgewtpzMTC', '', '[Te] Cayla Schumm', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '733680', '+75 5300955', 0, 0, '', NULL, '', '044.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'isobel21', 'eulah.lindgren@trantow.com', '$2y$10$x5FC1ibkF9bq1GXr.1WlK.ssTb7zMHlFRe/CukokRSevsCFYFnzay', '', '[Te] Mr. Caden Rolfson', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '382349', '+72 1243941', 0, 0, '', NULL, '', '075.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'virginie39', 'addie.mclaughlin@hotmail.com', '$2y$10$MP8wBCAYcymW5JwT5cOEZOmXlPt1HlMCnFM/4HiyeXtE6bXQAFrFS', '', '[Te] Thora Prohaska', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '471621', '+52 2305973', 0, 0, '', NULL, '', '091.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'senger.buford', 'hector06@yahoo.com', '$2y$10$DKC4H0t84cyu2ZSQdmmPp.apUKIWnCoo8pEsXkA94qGpwlixAOeCe', '', '[Te] Coty Murray IV', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '636200', '+97 7575517', 0, 0, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'lucious84', 'strosin.jaylan@yahoo.com', '$2y$10$HkTUjDrjJ0ZFsa95RPufjuBQljxk.bwr0cwmeiAIxFOGbQbDDaVMy', '', '[Te] Taurean Grimes', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '776511', '+61 4782233', 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'owen24', 'julien45@hotmail.com', '$2y$10$6x86VlMyZnrCOsZ6/KipoOBYnoT0h6LhfKBMEIvED8RhdCaEcoqd2', '', '[Te] Dr. Erling Considine', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '853234', '+94 3930937', 0, 0, '', NULL, '', '069.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'glover.ella', 'lockman.henderson@hotmail.com', '$2y$10$E3U69SywIPHwldcXK4Zm9OoXmod7nhZ9A7I/dLrjTGtp2ttOtGy4a', '', '[Te] Darrel Ullrich', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '242681', '+95 2376423', 0, 0, '', NULL, '', '04.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'mikayla.davis', 'wilfred.kreiger@mcdermott.com', '$2y$10$E61ACh.CXrnk28SV9xbGU.HBFvHwm2O9IMCtMoKQrqlllE3QsWaU2', '', '[Te] Prof. Tillman McLaughlin', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '252225', '+10 1538261', 0, 0, '', NULL, '', '086.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'lesley.rosenbaum', 'botsford.jacky@effertz.com', '$2y$10$fEiFpyRIjNeiK2of8WqUz.vhoUQ49f9U9Vp3dHhH.3JWiV4KZ1vVu', '', '[Te] Prof. Clotilde Quitzon III', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '545010', '+17 1690522', 0, 0, '', NULL, '', '06.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'kshlerin.brady', 'ulices.nolan@hotmail.com', '$2y$10$vhY/uc97C2HTDXMEoN8n3OOERnXIhM54USFQOwuyiPBgqOJyZn0w2', '', '[Te] Tyrel Schuster Jr.', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '916788', '+25 8621333', 0, 0, '', NULL, '', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'patrick.stamm', 'doug.haag@tillman.biz', '$2y$10$LU8P6Y.qjal5//LMYqlcAexKWi9ji8UkScbypjwR5HeEMqtwR/mJO', '', '[Te] Prof. Lonny Nolan DVM', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '245332', '+23 1820666', 0, 0, '', NULL, '', '077.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'gilberto05', 'joey.bergnaum@wolff.com', '$2y$10$T2QZG9DhNRYBpTujqiLUBuiKw6u/5zXT8cP5Cv1nPzjDkj/TaR6Gu', '', '[Te] Josephine Olson', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '217721', '+84 5751396', 0, 0, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'awatsica', 'gardner26@langosh.com', '$2y$10$c9lxAJw94iqP3VQQyLM/rO2me8LU4TBrC78UcfNg51Yp6xSqhgpCG', '', '[Te] Garnet Streich', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '780414', '+85 6444653', 0, 0, '', NULL, '', '049.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'linda53', 'bobbie61@hotmail.com', '$2y$10$dfvjwob4KKKhdsebCSKXw.MzmyRKw9U2S3mh86igQrGec6n7yT2HG', '', '[Te] Dr. Hulda Connelly MD', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '270098', '+72 5300484', 0, 0, '', NULL, '', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'jkiehn', 'carolyne.crooks@gmail.com', '$2y$10$tIoqYWIGLumSc8zSI4nbTuj9kySbbDEvD8RB5boCNxAYUicRWgE1m', '', '[Te] Gregg Lesch DDS', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '685012', '+89 1286415', 0, 0, '', NULL, '', '093.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'nicholas.hane', 'valentine16@robel.com', '$2y$10$4n5qunx31Y5rB6k8/MkU5uMFpoLQUNIJGMXaoFFSTs9dWrB28kpwK', '', '[Te] Ebba Jacobi', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '101475', '+31 7280242', 0, 0, '', NULL, '', '091.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'friesen.zita', 'blick.kiley@gmail.com', '$2y$10$U3cZpQbGEc10GnIQGJNy.OcS33SUkJqQ3AA3TzvdaZLPaViRC0w0i', '', '[Te] Mrs. Kelly Conn Jr.', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '908311', '+83 6663948', 0, 0, '', NULL, '', '092.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'fzemlak', 'dannie.cremin@jones.com', '$2y$10$oRbEHMXdlrrar8yTppm5cezrnAeSWpcJpLnhalhbH7.c2dEhC.Chi', '', '[Te] Loy Gutkowski MD', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '694286', '+59 6015837', 0, 0, '', NULL, '', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'douglas.smith', 'jamarcus.durgan@anderson.com', '$2y$10$FnFfhhF1IUuWo1oD041DQu17/u95INexKmI9erTd54bpQrBaz23fe', '', '[Te] Ms. Mertie Halvorson IV', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '451391', '+67 3782242', 0, 0, '', NULL, '', '025.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'electa.nikolaus', 'talia84@jast.com', '$2y$10$qbNHocn7Vt5EpWKA5RQCc.kndwGu3YFQ4gCcIoVR5ipPP7Ib8rXtm', '', '[Te] Odessa Bartell', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '406941', '+13 8653289', 0, 0, '', NULL, '', '051.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'student', 'breitenberg.addison@yahoo.com', '$2y$10$iTD3lF1QTwRyqMnoNwVjYO6vTLi9MGGJOExP.2L2CnMrtxkEC6hAe', '', '[St] Emerald Wiza MD', 'student', 6, 3, NULL, 0, 1, '38', '76-322-71', 0, 0, '', 0, NULL, NULL, '9964387173', '9958917', 5, 43, '', NULL, '', '030.png', 'Advanced one', '', 11, 4, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'boyle.kenyatta', 'gernser@yahoo.com', '$2y$10$Vhzao4BZq8QaX0.A49RIEO/CYxXU8V0EKyHLImALanHZZyDebkWr.', '', '[St] Elfrieda Corkery', 'student', 6, 3, NULL, 0, 1, '30', '34-121-42', 0, 0, '', 0, NULL, NULL, '4222555436', '7467343', 3, 49, '', NULL, '', '01.png', '', '', 14, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'klocko.britney', 'kaycee33@hotmail.com', '$2y$10$ZzX3U1zd.1PxBHrP8.2J1uWzcUlYe2xoA.LY.3nHHCCsiZlWXcSUu', '', '[St] Mr. Horacio Kutch', 'student', 6, 4, NULL, 0, 1, '71', '22-352-50', 0, 0, '', 0, NULL, NULL, '1657450247', '4359240', 5, 8, '', NULL, '', '034.png', '', '', 5, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'adalberto.parisian', 'kessler.sigrid@welch.com', '$2y$10$klbjsm7wGdFHkZRcTbkmzut2R5zMKHe2ZAiYNPvowVWTr95Xk22ze', '', '[St] Sylvester Keebler Jr.', 'student', 6, 4, NULL, 0, 1, '99', '89-548-60', 0, 0, '', 0, NULL, NULL, '3623408426', '8167989', 5, 8, '', NULL, '', '013.png', '', '', 6, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'wkoch', 'glover.lisette@hotmail.com', '$2y$10$VwAi5vnqc5nlq6JwdenqUO7FsNihdNb3.andhO5AN1GMKZafPkKuW', '', '[St] Dr. Taurean Boyle', 'student', 6, 4, NULL, 0, 1, '51', '47-677-83', 0, 0, '', 0, NULL, NULL, '8851733669', '2312552', 11, 24, '', NULL, '', '012.png', 'Captain: Yellow House', '', 9, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'zemlak.antwan', 'gmertz@hessel.net', '$2y$10$Q/KFQDnyfpuaCqEKxIWu5OTLZoX7sDSm9HepCIzYNZDWBYtg.TK8e', '', '[St] Prof. Macy Steuber I', 'student', 6, 2, NULL, 0, 1, '55', '50-243-84', 0, 0, '', 0, NULL, NULL, '2172848921', '6543110', 4, 38, '', NULL, '', '013.png', '', '', 3, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'kbarton', 'boris64@yahoo.com', '$2y$10$lYKiTp34ZzmRggwWzxVaMeaUqCkFJ7tzL2ixN67FhKmOwOMut7vCK', '', '[St] Monique Kohler', 'student', 6, 2, NULL, 0, 1, '26', '81-397-38', 0, 0, '', 0, NULL, NULL, '9914560966', '7144383', 12, 25, '', NULL, '', '054.png', 'Principal', '', 6, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'golda12', 'bettie64@yahoo.com', '$2y$10$qpZI8Y5YAbjG8xI7b96tlOkid3vjS.GQif9kTs3pPR5G1TCCCEsJ.', '', '[St] Julius Schaefer', 'student', 6, 1, NULL, 0, 1, '22', '84-587-90', 0, 0, '', 0, NULL, NULL, '5658670913', '9244699', 4, 17, '', NULL, '', '011.png', 'Advanced one', '', 10, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'welch.polly', 'avery.leuschke@rodriguez.com', '$2y$10$7AXJ6Ru.QHW/ycRZWv.F8OfuSVjfvQOBKCcl9UhbmvG2WPTU5AnWi', '', '[St] Vita Heller', 'student', 6, 3, NULL, 0, 1, '83', '53-490-97', 0, 0, '', 0, NULL, NULL, '7904442641', '3355505', 6, 19, '', NULL, '', '081.png', 'Clever', '', 14, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'justina22', 'elvis.schroeder@howell.biz', '$2y$10$UPGLEMt0voEwumWnXw7r4e4uWX/0KyGu9F3fxIOeAsyLVhJ/E7ym.', '', '[St] Mr. Chris Murray I', 'student', 6, 3, NULL, 0, 1, '26', '87-453-27', 0, 0, '', 0, NULL, NULL, '7252022973', '4686343', 1, 60, '', NULL, '', '077.png', '', '', 12, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'swyman', 'pkoelpin@yahoo.com', '$2y$10$XcD6Lb5d795.48tut39K9O/9rBzcgVm5e3JA87d68rTms.byjX2bC', '', '[St] Isabell Jaskolski III', 'student', 6, 3, NULL, 0, 1, '48', '15-997-51', 0, 0, '', 0, NULL, NULL, '7658555623', '9011827', 5, 8, '', NULL, '', '070.png', '', '', 2, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'edicki', 'emilia.stanton@renner.info', '$2y$10$IdUWK5bbKj2fHAqeG1qiCOR1iq0erzyDy5Cefg35j9OjIdKKUlOWC', '', '[St] Keegan Dooley IV', 'student', 6, 4, NULL, 0, 1, '40', '38-108-61', 0, 0, '', 0, NULL, NULL, '5330126757', '3697080', 1, 30, '', NULL, '', '037.png', 'Advanced one', '', 7, 1, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'eleanore74', 'antwon04@gorczany.com', '$2y$10$eRFr0a1zZoXBYzY95w4eCOYAiULboLgloMfq2Oms.FFBumJfmgiHm', '', '[St] Leola Bahringer', 'student', 6, 2, NULL, 0, 1, '68', '52-134-88', 0, 0, '', 0, NULL, NULL, '6694828492', '3418722', 4, 6, '', NULL, '', '073.png', '', '', 2, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'czieme', 'kerluke.emmet@hotmail.com', '$2y$10$VKGnHIRCu9zqhyAL6Ir5lOZeGT31vFQlCazJsauDscRZ4TxCFewwi', '', '[St] Prof. Dereck Turcotte', 'student', 6, 1, NULL, 0, 1, '3', '46-711-78', 0, 0, '', 0, NULL, NULL, '6016519757', '6526582', 8, 26, '', NULL, '', '05.png', 'Captain: Yellow House', '', 15, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'nglover', 'zakary.ritchie@hotmail.com', '$2y$10$NiMIJIoWRigUFQpj8StNyunTcCWij5YN5kZ4wKcuFjLRYMLQowjE2', '', '[St] Anika Herman', 'student', 6, 4, NULL, 0, 1, '22', '74-129-48', 0, 0, '', 0, NULL, NULL, '7065490750', '4819054', 12, 44, '', NULL, '', '062.png', '', '', 12, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'elias19', 'annabelle.rodriguez@gmail.com', '$2y$10$EGPZDS97yzxSLeRdCVFmvOpVMyhDzyPx6KQVs4XPxXFfAaTTpi./.', '', '[St] Dr. Coty Heller', 'student', 6, 4, NULL, 0, 1, '33', '11-668-88', 0, 0, '', 0, NULL, NULL, '6224748540', '2168429', 7, 58, '', NULL, '', '027.png', 'Captain: Yellow House', '', 14, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'orie74', 'coy02@rath.com', '$2y$10$sU2THOUxysfKMLUSS/7kdeW3px.mTcFe7SW3RBBV3K9vKOO7t/1sm', '', '[St] Richie Rempel', 'student', 6, 3, NULL, 0, 1, '51', '58-740-30', 0, 0, '', 0, NULL, NULL, '1720893896', '6876874', 2, 46, '', NULL, '', '031.png', '', '', 15, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'hhartmann', 'elwyn45@anderson.info', '$2y$10$Npvlj1qU0uBjCBL1qPDcNeniqlso/KXjqGRkQM7wSNUadNKvRYulm', '', '[St] Treva Casper', 'student', 6, 1, NULL, 0, 1, '81', '31-188-89', 0, 0, '', 0, NULL, NULL, '4320824865', '8152114', 8, 52, '', NULL, '', '033.png', '', '', 7, 1, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'brakus.idell', 'ydavis@hagenes.com', '$2y$10$650CmfvN7xqcdKNIcqXgXOsoaGYmMIxVAKCQqOLnB0FA3lYEZZaba', '', '[St] Mr. Pietro Denesik', 'student', 6, 1, NULL, 0, 1, '10', '97-324-99', 0, 0, '', 0, NULL, NULL, '3825639713', '4759960', 4, 38, '', NULL, '', '09.png', '', '', 12, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'collier.aaliyah', 'tkeebler@gmail.com', '$2y$10$CGfl2MglF6Dxi1QwHua3GOjacH3QIgrwY5iit6RhqmP9M/UAkJLQW', '', '[St] Gail Price Sr.', 'student', 6, 3, NULL, 0, 1, '88', '47-751-56', 0, 0, '', 0, NULL, NULL, '8622681102', '1028375', 7, 41, '', NULL, '', '080.png', '', '', 14, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'orland.hackett', 'lavada.moen@gmail.com', '$2y$10$Gw06Ma10I3xSFF99dvb8BeHRdT6HMfVevEBAMebwDAzE5E1CaBnlO', '', '[St] Kiera Reichert', 'student', 6, 2, NULL, 0, 1, '7', '85-424-42', 0, 0, '', 0, NULL, NULL, '3599839316', '4759595', 9, 50, '', NULL, '', '03.png', '', '', 8, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'peyton.murazik', 'nick67@reilly.net', '$2y$10$joOsPgSgwrueY7SfvyuWNeIKCeHo5VjrSJbSrKCgQIcW.AWyYF1yC', '', '[St] Bridie Krajcik', 'student', 6, 3, NULL, 0, 1, '42', '10-554-84', 0, 0, '', 0, NULL, NULL, '4299386706', '8971008', 5, 8, '', NULL, '', '023.png', '', '', 8, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'blick.elliot', 'janiya09@hyatt.com', '$2y$10$TmsmQfM9EYoJGtPPtFcXveaKveCpvnU7hlzg1YsIXIP2hssm1FLpq', '', '[St] Stanley Bernier', 'student', 6, 2, NULL, 0, 1, '91', '60-634-58', 0, 0, '', 0, NULL, NULL, '5993012684', '1896621', 11, 33, '', NULL, '', '038.png', '', '', 8, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'constance.goyette', 'hudson.lessie@jacobi.com', '$2y$10$r/4Al6l.k9y4G/FtbR5an.R/DRollgCYaiLZ9CrUu95AXb.CrCDjq', '', '[St] Amira Mante', 'student', 6, 1, NULL, 0, 1, '98', '34-519-42', 0, 0, '', 0, NULL, NULL, '5686977890', '2164953', 12, 55, '', NULL, '', '087.png', '', '', 15, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'ferry.rodrigo', 'merl.morar@gmail.com', '$2y$10$3VYM5V7Gp6kPdx1CLnj9yORP2J0lgM8fsutzwlpFz8A3Ztg10qMw2', '', '[St] Macie Cassin', 'student', 6, 2, NULL, 0, 1, '62', '25-444-68', 0, 0, '', 0, NULL, NULL, '9051046247', '5286127', 12, 55, '', NULL, '', '045.png', '', '', 2, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'rosa37', 'simonis.myriam@rogahn.com', '$2y$10$QF8DuLWcvcdvc7NA9bVjMuRRFXWJ39ksv.iAH8taNhxsDaAW98ypO', '', '[St] Keenan Beatty PhD', 'student', 6, 2, NULL, 0, 1, '14', '57-326-61', 0, 0, '', 0, NULL, NULL, '2822403108', '3878897', 10, 51, '', NULL, '', '024.png', '', '', 5, 4, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'freddy.lebsack', 'michale.spinka@tromp.com', '$2y$10$xv8EZCzRGZwXmjAFJe7J6.qL6BRqHSRyhOgEcv9N59WxU3hvMdPA.', '', '[St] Cara Pacocha', 'student', 6, 4, NULL, 0, 1, '95', '31-799-10', 0, 0, '', 0, NULL, NULL, '3659466655', '3429988', 8, 26, '', NULL, '', '087.png', '', '', 11, 4, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'ullrich.emily', 'egusikowski@hotmail.com', '$2y$10$aQWYg8e/WcFWiF0hqf//Z.lto7WuLtSYxfcbKTmxTjj0nFFhFYLsO', '', '[St] Alberta Gaylord', 'student', 6, 3, NULL, 0, 1, '17', '82-142-68', 0, 0, '', 0, NULL, NULL, '5365342279', '7325633', 6, 1, '', NULL, '', '080.png', 'Clever', '', 6, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'delores31', 'alessandra77@hotmail.com', '$2y$10$efBbvPWNeaHkIX6oeK/GRuTWu9mCPJMa6uPb/uWoaHImFSl3vIZwW', '', '[St] Mrs. Marisa Ritchie', 'student', 6, 3, NULL, 0, 1, '79', '40-281-48', 0, 0, '', 0, NULL, NULL, '1673527426', '5787615', 8, 9, '', NULL, '', '096.png', '', '', 3, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'orn.rosetta', 'agustina87@yahoo.com', '$2y$10$W.ye5jlitLubHtPWQxeI/O/bsoc/eyAmAbNO54aKuem1S0IvSOHUa', '', '[St] Drake Ratke', 'student', 6, 1, NULL, 0, 1, '48', '89-388-87', 0, 0, '', 0, NULL, NULL, '3517185774', '9547233', 6, 10, '', NULL, '', '022.png', '', '', 12, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'lkulas', 'jammie33@barton.com', '$2y$10$MaQs.eDkoHFqJx4xddIlDevOWS6nXHu13vas9EUUNfqonl5E84Qz2', '', '[St] Mr. Waino Herman PhD', 'student', 6, 4, NULL, 0, 1, '54', '96-132-45', 0, 0, '', 0, NULL, NULL, '4516504349', '4955460', 7, 58, '', NULL, '', '096.png', 'Captain: Yellow House', '', 15, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'parent', 'sierra78@gmail.com', '$2y$10$.lIWVNfMABV.hZqwAmiCIOuoNQVtFw/.RirOgWrXjL4vUWO2V/41S', '', '[Pa] Alba Fritsch', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4646318596', '8949265', 8, 35, '', NULL, '[{\"student\":\"[St] Cara Pacocha\",\"relation\":\"father\",\"id\":71}]', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(77, 'abbott.gladys', 'hudson.jaquan@thiel.net', '$2y$10$Oj9jbNk8.1VVCA9M08sfKOoR5nKtRSWJploX0CMOMaMD9voKZtG1O', '', '[Pa] Yolanda Block II', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2024955490', '8387181', 9, 29, '', NULL, '[{\"student\":\"[St] Sylvester Keebler Jr.\",\"relation\":\"father\",\"id\":48}]', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'sawayn.presley', 'evie42@yahoo.com', '$2y$10$9QD7fs45IIFyiXI8EVZztOQo0ZA3g7Wbp6lPtng5GRza/8wtC5Hii', '', '[Pa] Vivianne Lehner', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4152876604', '1869702', 4, 25, '', NULL, '[{\"student\":\"[St] Cara Pacocha\",\"relation\":\"father\",\"id\":71}]', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'lindgren.roxane', 'tyrese14@oreilly.info', '$2y$10$0Djyu8uSiF.fCzkwsciI7exMFfXrcHlcNXvmOV0TAJYyPDrNAMV/6', '', '[Pa] Mr. Linwood Lesch III', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9311499423', '4484502', 8, 44, '', NULL, '[{\"student\":\"[St] Julius Schaefer\",\"relation\":\"father\",\"id\":52}]', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'gquigley', 'roscoe.marquardt@rolfson.com', '$2y$10$lAWrVpIyTg2THoCMAvmRM.W8Q7GxpG1TsKTh.Ct6blMX7p6X8IPcu', '', '[Pa] Mr. Akeem Schulist', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1562398167', '8265062', 4, 11, '', NULL, '[{\"student\":\"[St] Mr. Chris Murray I\",\"relation\":\"father\",\"id\":54}]', '070.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'richie80', 'deckow.carmen@gmail.com', '$2y$10$wVi.SCR0wv2R8kEUBe4y9.W526FXwH7o5mHJMvOsN7c7iv/De2Oxq', '', '[Pa] Monique Torp', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3128377659', '2666086', 8, 41, '', NULL, '[{\"student\":\"[St] Prof. Macy Steuber I\",\"relation\":\"father\",\"id\":50}]', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'ywalsh', 'walter.rupert@hilpert.com', '$2y$10$5iQjoSDdBKxjvSFPfkwXNekNyPKKqvE.E8uxkKZz5cKZ6zlb5QXNW', '', '[Pa] Prof. Kaley O\'Conner DDS', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9274149478', '2794606', 10, 28, '', NULL, '[{\"student\":\"[St] Elfrieda Corkery\",\"relation\":\"father\",\"id\":46}]', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'yritchie', 'ohayes@gmail.com', '$2y$10$c9eDX0T/Y0A7ylxbq1C7h.VXyb2VhtTHcProV7iTNcm1Kyb5zInqW', '', '[Pa] Mrs. Elta Keeling', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4880608402', '2036226', 5, 50, '', NULL, '[{\"student\":\"[St] Dr. Taurean Boyle\",\"relation\":\"father\",\"id\":49}]', '069.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'niko52', 'schulist.laila@ondricka.com', '$2y$10$Tj8XvCDASPVj5y83WZGRmO17tOXXgLrioywL2QvI9Sr7YaOpnFpGm', '', '[Pa] Dr. Carmel Schinner DVM', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9603460319', '8346180', 3, 54, '', NULL, '[{\"student\":\"[St] Monique Kohler\",\"relation\":\"father\",\"id\":51}]', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'deanna48', 'nader.cleora@hotmail.com', '$2y$10$7SB5R.CsS04ub1rT/XL/HOD98ZfY21EfaSv9tzLARVA7A5HiOyt8i', '', '[Pa] Amari Smitham', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7309818393', '4865849', 3, 7, '', NULL, '[{\"student\":\"[St] Elfrieda Corkery\",\"relation\":\"father\",\"id\":46}]', '036.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'maximillia87', 'rickie44@yahoo.com', '$2y$10$q4VinvXKaK7sXFW6KD/eS.RRlTMZJSgve3jjKZBIC0abgJjSQJsPS', '', '[Pa] Leopoldo Padberg V', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1919753386', '9105592', 9, 12, '', NULL, '[{\"student\":\"[St] Cara Pacocha\",\"relation\":\"father\",\"id\":71}]', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'sstanton', 'littel.lenna@murazik.info', '$2y$10$Rpdc3kGtIafUUhd1se4j4O0wB9oQxwQOfz1EFdjqttUePUCWfIWA2', '', '[Pa] Ali Harvey', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9889452770', '2563226', 3, 29, '', NULL, '[{\"student\":\"[St] Leola Bahringer\",\"relation\":\"father\",\"id\":57}]', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'elegros', 'leanne57@gmail.com', '$2y$10$bTBMByK9kizSc5hrtRBcEe7glG7XfiEF6ojgDzYjFdNq8Bvg/w.0O', '', '[Pa] Luigi Koss MD', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9121826962', '9398770', 8, 9, '', NULL, '[{\"student\":\"[St] Dr. Coty Heller\",\"relation\":\"father\",\"id\":60}]', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'collin16', 'stewart.fadel@upton.com', '$2y$10$.Jrd5l4mMN/5XmoI3ZgQY.dmkomuw1CpQ1QFY0Mi6HsP0UBiOFhYC', '', '[Pa] Verlie Herzog', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5239799309', '7476938', 7, 19, '', NULL, '[{\"student\":\"[St] Mr. Pietro Denesik\",\"relation\":\"father\",\"id\":63}]', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'yrowe', 'uprohaska@yahoo.com', '$2y$10$XbJf5UAQ3fPPfzUO6vF4EO7KExHbKFFThfnqdrH3WYcc/b6IzjShu', '', '[Pa] Elfrieda Frami', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3009192632', '9017195', 3, 39, '', NULL, '[{\"student\":\"[St] Keegan Dooley IV\",\"relation\":\"father\",\"id\":56}]', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'bogan.shawna', 'jerde.cecilia@hotmail.com', '$2y$10$6xHHMdWjfANA448vYqtOzehvaQa.P9jVBFIvMPuZYEUBXhIF.Zeje', '', '[Pa] Miss Minnie Hagenes', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6125069630', '7710133', 5, 31, '', NULL, '[{\"student\":\"[St] Stanley Bernier\",\"relation\":\"father\",\"id\":67}]', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'yklocko', 'pearline72@marks.com', '$2y$10$jFbLE2x/GE.87Vv9aarfL.h53TpoBuLrRhMAMpfWpSww42JoTdTta', '', '[Pa] Madge Sporer', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2981245428', '8675407', 4, 11, '', NULL, '[{\"student\":\"[St] Stanley Bernier\",\"relation\":\"father\",\"id\":67}]', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'vivianne42', 'jerrold.frami@yahoo.com', '$2y$10$JXRmV8ULi5.MvTpLbj912u6OTG.7TdqeBfW055i3b8SBHpfqQw5hW', '', '[Pa] Emely Parker', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9299192947', '8581648', 6, 23, '', NULL, '[{\"student\":\"[St] Prof. Dereck Turcotte\",\"relation\":\"father\",\"id\":58}]', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'henderson00', 'dewayne.fahey@bogan.com', '$2y$10$BvGZmv7wOJbP5K0JBrVLyemMAxPn1LsIP3FGqPxOLjiIvG.SfIfZ2', '', '[Pa] Izabella Weissnat', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6383067772', '6469475', 7, 37, '', NULL, '[{\"student\":\"[St] Isabell Jaskolski III\",\"relation\":\"father\",\"id\":55}]', '010.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'bryan', 'shawn.russel@ward.com', '$2y$10$V.bXIjab4R0bvpksb5xFKue3Bwy5dCX0oDeDx./8y1me2eUcJUfjm', '', '[Pa] Ellsworth Paucek II', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8669883941', '1961676', 6, 6, '', NULL, '[{\"student\":\"[St] Anika Herman\",\"relation\":\"father\",\"id\":59}]', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'renner.amara', 'ghills@gmail.com', '$2y$10$d6mmU7Nl6qfsJqTp9VVs2etWXbpS2uBOrNwq52qqtBTwXuJm8nRsG', '', '[Pa] Presley Greenholt III', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1865804238', '9153206', 9, 20, '', NULL, '[{\"student\":\"[St] Mr. Pietro Denesik\",\"relation\":\"father\",\"id\":63}]', '021.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
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
  ADD PRIMARY KEY (`id`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assignments_answers`
--
ALTER TABLE `assignments_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `book_library`
--
ALTER TABLE `book_library`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `class_schedule`
--
ALTER TABLE `class_schedule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitories`
--
ALTER TABLE `dormitories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `exams_list`
--
ALTER TABLE `exams_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expenses_cat`
--
ALTER TABLE `expenses_cat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `frontend_pages`
--
ALTER TABLE `frontend_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grade_levels`
--
ALTER TABLE `grade_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `homeworks`
--
ALTER TABLE `homeworks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hostel_cat`
--
ALTER TABLE `hostel_cat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income_cat`
--
ALTER TABLE `income_cat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inv_cat`
--
ALTER TABLE `inv_cat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inv_issue`
--
ALTER TABLE `inv_issue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items_code`
--
ALTER TABLE `items_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items_stock`
--
ALTER TABLE `items_stock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `library_issue`
--
ALTER TABLE `library_issue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mailsms`
--
ALTER TABLE `mailsms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `mailsms_templates`
--
ALTER TABLE `mailsms_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_albums`
--
ALTER TABLE `media_albums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_items`
--
ALTER TABLE `media_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `messages_list`
--
ALTER TABLE `messages_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `mm_uploads`
--
ALTER TABLE `mm_uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mob_notifications`
--
ALTER TABLE `mob_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `newsboard`
--
ALTER TABLE `newsboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `notifications_mob_history`
--
ALTER TABLE `notifications_mob_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;
--
-- AUTO_INCREMENT for table `online_exams`
--
ALTER TABLE `online_exams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `online_exams_grades`
--
ALTER TABLE `online_exams_grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `online_exams_questions`
--
ALTER TABLE `online_exams_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=551;
--
-- AUTO_INCREMENT for table `paymentscollection`
--
ALTER TABLE `paymentscollection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payroll_history`
--
ALTER TABLE `payroll_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payroll_hourly_base`
--
ALTER TABLE `payroll_hourly_base`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payroll_salary_base`
--
ALTER TABLE `payroll_salary_base`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postal`
--
ALTER TABLE `postal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_academic_years`
--
ALTER TABLE `student_academic_years`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_categories`
--
ALTER TABLE `student_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `student_docs`
--
ALTER TABLE `student_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `study_material`
--
ALTER TABLE `study_material`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transportation`
--
ALTER TABLE `transportation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `transport_vehicles`
--
ALTER TABLE `transport_vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wel_office`
--
ALTER TABLE `wel_office`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
