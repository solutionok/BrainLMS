-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2019 at 09:59 PM
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
  `classTeacher` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classAcademicYear` int(11) NOT NULL,
  `classSubjects` text COLLATE utf8_unicode_ci NOT NULL,
  `dormitoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `className`, `classTeacher`, `classAcademicYear`, `classSubjects`, `dormitoryId`) VALUES
(1, 'Omnis. Class', '[\"75\",\"78\",\"74\",\"73\",\"72\",\"97\",\"68\",\"67\",\"91\",\"61\"]', 1, '[\"1\",\"6\",\"7\",\"10\"]', 4),
(2, 'Non aut. Class', '[\"82\",\"55\",\"66\",\"70\",\"68\",\"87\",\"78\",\"93\",\"83\",\"54\",\"88\"]', 1, '[\"9\",\"15\",\"11\",\"14\",\"1\",\"13\"]', 1),
(3, 'Veniam voluptatem. Class', '[\"104\",\"87\",\"78\",\"59\"]', 1, '[\"7\",\"5\",\"1\",\"12\"]', 4),
(4, 'Nobis harum. Class', '[\"93\",\"59\",\"89\",\"88\",\"87\",\"90\",\"95\",\"101\",\"79\",\"102\",\"65\",\"74\"]', 2, '[\"9\",\"3\",\"8\",\"11\"]', 3),
(5, 'Veniam. Class', '[\"60\",\"63\",\"61\",\"68\",\"81\"]', 2, '[\"6\",\"7\",\"1\",\"10\",\"4\"]', 2),
(6, 'Nostrum. Class', '[\"66\",\"78\",\"58\",\"86\",\"71\",\"93\",\"99\",\"67\",\"57\",\"85\"]', 2, '[\"13\",\"14\",\"10\",\"6\"]', 2),
(7, 'Eveniet consequatur. Class', '[\"78\",\"64\",\"71\",\"104\",\"67\",\"54\",\"68\",\"97\",\"86\",\"63\"]', 1, '[\"12\",\"8\",\"7\"]', 1),
(8, 'Reprehenderit nihil. Class', '[\"104\",\"62\",\"64\",\"60\",\"58\",\"78\",\"96\",\"77\",\"98\",\"79\"]', 1, '[\"11\",\"13\",\"10\",\"1\",\"2\"]', 4),
(9, 'Rerum. Class', '[\"57\",\"92\",\"63\",\"54\",\"94\",\"78\",\"73\",\"58\",\"80\",\"65\"]', 2, '[\"1\",\"15\",\"12\",\"2\",\"3\",\"8\"]', 2),
(10, 'Omnis deleniti. Class', '[\"61\",\"79\",\"96\",\"83\"]', 2, '[\"14\",\"3\",\"9\",\"15\",\"6\",\"1\"]', 1),
(11, 'Beatae. Class', '[\"55\",\"101\",\"59\",\"80\",\"74\"]', 2, '[\"3\",\"6\",\"4\"]', 1),
(12, 'Perferendis. Class', '[\"74\",\"58\",\"79\",\"70\"]', 1, '[\"13\",\"8\",\"7\"]', 3),
(13, 'Repellendus. Class', '[\"91\",\"87\",\"101\",\"75\",\"99\",\"95\",\"96\",\"86\",\"64\"]', 1, '[\"10\",\"6\",\"3\",\"5\"]', 3),
(14, 'Inventore. Class', '[\"81\",\"90\",\"55\",\"98\",\"103\",\"84\",\"71\",\"62\",\"92\",\"89\"]', 1, '[\"1\",\"13\",\"3\"]', 3),
(15, 'Qui enim. Class', '[\"62\",\"70\",\"82\",\"64\",\"76\",\"88\"]', 1, '[\"3\"]', 2);

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

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `eventTitle`, `eventDescription`, `eventFor`, `enentPlace`, `eventImage`, `fe_active`, `eventDate`) VALUES
(1, 'Nihil blanditiis et.', 'Omnis doloribus sunt fugit perferendis ipsa et nemo facere laborum aut.', 'parents', 'dicta', '', 1, '1563572937'),
(2, 'Ullam sit qui et soluta.', 'Corporis et consequuntur aut quia eos alias nulla sed maxime iure et est et.', 'parents', 'error', '', 0, '1563572937'),
(3, 'Blanditiis quas unde.', 'Magnam ipsum cumque voluptatem maxime voluptas voluptate architecto ad.', 'parents', 'dolor', '', 1, '1563572937'),
(4, 'Dolorum voluptates nihil.', 'Enim occaecati quia ipsum harum vel sapiente enim.', 'all', 'nulla', '', 1, '1563572937'),
(5, 'Ratione molestias ipsa.', 'Cumque unde mollitia eaque sunt.', 'parents', 'alias', '', 1, '1563572937'),
(6, 'Et omnis ad eaque.', 'Quia mollitia doloribus provident alias et eveniet cum ipsum molestias omnis provident ratione voluptate molestias autem.', 'all', 'odio', '', 1, '1563572937'),
(7, 'Aut quos.', 'Hic tempora atque pariatur esse quia soluta quia.', 'parents', 'tempore', '', 1, '1563572937'),
(8, 'Laudantium omnis.', 'Laborum tempora repellendus nemo delectus.', 'parents', 'ut', '', 0, '1563572937'),
(9, 'Tempore tempora labore.', 'Quaerat occaecati sed voluptas optio vel sunt labore dolores saepe explicabo debitis beatae fuga aut.', 'parents', 'rem', '', 1, '1563572937'),
(10, 'Ratione quo numquam modi nemo.', 'Enim doloribus omnis labore magni consequatur quo dolores.', 'students', 'alias', '', 1, '1563572937'),
(11, 'Ipsa alias aut dolor assumenda.', 'Asperiores atque quo deleniti molestiae.', 'parents', 'iusto', '', 0, '1563572937'),
(12, 'Fugiat et in.', 'Nesciunt nobis magnam magni commodi quae vel in.', 'students', 'et', '', 0, '1563572937'),
(13, 'Voluptatum esse in.', 'Molestiae aut optio dolorem maxime culpa aut perferendis iure provident deleniti facere iste ad.', 'students', 'enim', '', 1, '1563572937'),
(14, 'Laboriosam explicabo quidem et.', 'Velit tempore earum cumque assumenda reiciendis ea dicta velit voluptate repudiandae.', 'teacher', 'voluptates', '', 1, '1563572937'),
(15, 'Voluptates delectus unde ut.', 'Rem ducimus impedit repellendus quidem sunt sed repellat optio hic.', 'teacher', 'dignissimos', '', 1, '1563572937'),
(16, 'Odit tempora tempora.', 'Molestias non ullam voluptatibus tempore porro est sapiente ratione dignissimos pariatur.', 'parents', 'inventore', '', 0, '1563572937'),
(17, 'Voluptatibus veritatis aliquam sed qui.', 'Voluptatibus placeat voluptas eos non est maxime ut.', 'teacher', 'eveniet', '', 0, '1563572937'),
(18, 'Laudantium eveniet et sit.', 'Velit cupiditate officiis ipsam ipsam occaecati dolorem culpa.', 'teacher', 'tempora', '', 1, '1563572937'),
(19, 'Magni ut repudiandae corrupti.', 'Beatae ullam labore illum alias accusantium illum et quia.', 'all', 'ut', '', 1, '1563572937'),
(20, 'Voluptatum libero cum aut.', 'Et fugiat consequatur sit laborum.', 'all', 'laudantium', '', 0, '1563572937'),
(21, 'Magni tempore.', 'Quis magni culpa dolores quia quis sint eum.', 'teacher', 'eveniet', '', 0, '1563572937'),
(22, 'Saepe consequatur hic.', 'Fugit at animi blanditiis sint quae neque modi officia doloribus tempora accusamus.', 'all', 'consectetur', '', 0, '1563572937'),
(23, 'Quia sit officiis.', 'Harum consequuntur molestiae saepe qui.', 'parents', 'omnis', '', 1, '1563572937'),
(24, 'Molestiae vel autem.', 'Quia autem omnis corrupti eveniet quia praesentium voluptates velit nostrum ex explicabo necessitatibus reiciendis.', 'students', 'amet', '', 0, '1563572937'),
(25, 'Voluptatum sit.', 'Nam mollitia alias delectus fugiat consequatur doloremque harum omnis impedit amet nulla aperiam repellat.', 'teacher', 'magni', '', 0, '1563572937'),
(26, 'Dolorum qui ipsa laudantium.', 'Officiis accusantium et harum fugit cumque voluptatem maxime et omnis quibusdam cupiditate qui voluptatem nemo.', 'teacher', 'et', '', 0, '1563572937'),
(27, 'Sed eos.', 'Nobis est et consequatur quia sit optio quod voluptas eum cum ad cum.', 'parents', 'iusto', '', 0, '1563572937'),
(28, 'Dolor quaerat qui expedita.', 'Ad saepe hic sit illo aut inventore illum modi.', 'students', 'excepturi', '', 0, '1563572937'),
(29, 'Possimus consequuntur necessitatibus assumenda doloribus.', 'Nesciunt illo maiores repellat id itaque velit dolor sunt eos repellendus ut.', 'all', 'omnis', '', 1, '1563572937'),
(30, 'Eos aliquam delectus.', 'Ea nesciunt ipsa aut asperiores officia et qui.', 'teacher', 'dolor', '', 1, '1563572937'),
(31, 'Ipsa architecto.', 'At neque facere non sunt sit perferendis assumenda nihil.', 'students', 'quos', '', 1, '1563572937'),
(32, 'Perferendis vel sapiente dolores.', 'Omnis qui culpa et voluptate tempore hic ut laudantium quod minus hic nihil illo a.', 'students', 'laboriosam', '', 0, '1563572937'),
(33, 'Omnis occaecati voluptates.', 'Nesciunt ut tempore eum quo repellat quasi.', 'students', 'accusantium', '', 1, '1563572937'),
(34, 'Debitis aspernatur.', 'Impedit qui temporibus dolor sunt optio quis.', 'students', 'et', '', 1, '1563572937'),
(35, 'Molestiae soluta autem explicabo quae.', 'Maiores laudantium cumque labore saepe.', 'teacher', 'qui', '', 1, '1563572937'),
(36, 'Accusantium quae odio alias molestias qui.', 'Sunt ut eos maxime iure eaque.', 'teacher', 'vel', '', 1, '1563572937'),
(37, 'Fuga modi sunt.', 'Hic rem iure rerum sit nobis laborum.', 'parents', 'eos', '', 1, '1563572937'),
(38, 'Quia error harum qui.', 'Repellat aspernatur aut voluptas aut voluptatem sed distinctio iusto non.', 'parents', 'similique', '', 1, '1563572937'),
(39, 'Voluptatibus error.', 'Soluta odio labore quis a quo a est aut distinctio sunt placeat ea iste tempora sed.', 'teacher', 'voluptate', '', 0, '1563572937'),
(40, 'Voluptas sequi suscipit voluptatum.', 'Et optio molestiae quisquam labore qui.', 'teacher', 'quis', '', 1, '1563572937'),
(41, 'Voluptate consequatur omnis.', 'Ut natus ducimus praesentium odit laborum praesentium saepe.', 'all', 'et', '', 1, '1563572937'),
(42, 'Voluptatem veritatis omnis est blanditiis.', 'Numquam eaque tenetur et deleniti sit.', 'all', 'itaque', '', 1, '1563572937'),
(43, 'Cum ut neque autem quas.', 'Velit a veniam voluptatem mollitia ipsa.', 'parents', 'nisi', '', 0, '1563572937'),
(44, 'Quos ex laboriosam qui.', 'Saepe et enim ad reiciendis id officia debitis animi.', 'teacher', 'id', '', 1, '1563572937'),
(45, 'Quidem officia quaerat.', 'Nisi suscipit placeat est eos possimus deserunt deleniti.', 'all', 'architecto', '', 1, '1563572937'),
(46, 'Est sequi non facere.', 'Quae sed occaecati voluptatibus enim autem eos reprehenderit odio est id dolor pariatur possimus.', 'all', 'fuga', '', 0, '1563572937'),
(47, 'Iure et voluptas fugit ut.', 'Aut consequatur ea officia iure blanditiis amet.', 'parents', 'non', '', 0, '1563572937'),
(48, 'Ea consectetur.', 'Nam non quasi harum incidunt dolorum et.', 'parents', 'optio', '', 1, '1563572937'),
(49, 'Facilis a sed laudantium.', 'Temporibus assumenda quibusdam aut reiciendis aut qui.', 'teacher', 'enim', '', 0, '1563572937'),
(50, 'Quis nam et.', 'Aliquam libero magni aut incidunt laborum deleniti.', 'students', 'delectus', '', 0, '1563572937');

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

--
-- Dumping data for table `homeworks`
--

INSERT INTO `homeworks` (`id`, `classId`, `sectionId`, `subjectId`, `teacherId`, `homeworkTitle`, `homeworkDescription`, `homeworkFile`, `homeworkDate`, `homeworkSubmissionDate`, `homeworkEvaluationDate`, `studentsCompleted`) VALUES
(1, '[\"3\",\"2\",\"4\"]', '[\"9\"]', 4, 84, 'Sit et commodi.', '', '', '1563630429', 1563630429, 0, ''),
(2, '[\"4\",\"3\",\"1\"]', '[\"12\",\"15\",\"35\"]', 8, 60, 'In similique voluptatum.', '', '', '1563630429', 1563630429, 0, ''),
(3, '[\"2\",\"1\",\"4\"]', '[\"45\"]', 6, 72, 'Voluptas sunt maxime.', '', '', '1563630429', 1563630429, 0, ''),
(4, '[\"3\"]', '[\"7\",\"43\"]', 14, 69, 'Sit illo sed.', '', '', '1563630429', 1563630429, 0, ''),
(5, '[\"3\",\"4\",\"2\"]', '[\"42\"]', 14, 103, 'Est repellat.', '', '', '1563630430', 1563630430, 0, ''),
(6, '[\"4\",\"2\"]', '[\"38\",\"4\"]', 11, 78, 'Illum eum.', '', '', '1563630430', 1563630430, 0, ''),
(7, '[\"4\",\"3\"]', '[\"25\",\"47\",\"19\"]', 3, 97, 'Eum corporis.', '', '', '1563630430', 1563630430, 0, ''),
(8, '[\"2\",\"3\"]', '[\"8\",\"20\",\"4\"]', 14, 94, 'Autem adipisci dolores.', '', '', '1563630430', 1563630430, 0, ''),
(9, '[\"2\"]', '[\"29\",\"46\"]', 2, 55, 'Consequuntur ullam ducimus.', '', '', '1563630430', 1563630430, 0, ''),
(10, '[\"2\",\"4\",\"3\"]', '[\"4\",\"2\"]', 10, 102, 'Eius.', '', '', '1563630430', 1563630430, 0, ''),
(11, '[\"2\"]', '[\"49\",\"46\"]', 1, 60, 'Recusandae omnis.', '', '', '1563630430', 1563630430, 0, ''),
(12, '[\"1\",\"2\"]', '[\"1\",\"24\"]', 8, 83, 'Ea corporis.', '', '', '1563630430', 1563630430, 0, ''),
(13, '[\"4\",\"3\",\"2\"]', '[\"8\"]', 1, 71, 'Tenetur quia.', '', '', '1563630431', 1563630431, 0, ''),
(14, '[\"2\",\"1\",\"4\"]', '[\"50\",\"4\"]', 11, 83, 'Voluptatum.', '', '', '1563630431', 1563630431, 0, ''),
(15, '[\"3\",\"4\"]', '[\"30\",\"27\"]', 10, 95, 'Voluptatem repellendus.', '', '', '1563630431', 1563630431, 0, '');

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

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `languageTitle`, `languageUniversal`, `languagePhrases`, `isRTL`) VALUES
(1, 'English', '0', '{\"dashboard\":\"Dashboard\",\"usercode\":\"User Code\",\"classes\":\"Classes\",\"students\":\"Students\",\"teachers\":\"Teachers\",\"newmessages\":\"New Messages\",\"student\":\"Student\",\"teacher\":\"Teacher\",\"leaderboard\":\"Leader Board\",\"NewsEvents\":\"News & Events\",\"quicklinks\":\"Quick links\",\"AccountSettings\":\"Account Settings\",\"ChgProfileData\":\"Change profile data\",\"FullName\":\"Full name\",\"Gender\":\"Gender\",\"Birthday\":\"Birthday\",\"mobileNo\":\"Mobile No\",\"editProfile\":\"Edit profile\",\"reemail\":\"Retype Email address\",\"oldPassword\":\"Old password\",\"editPassword\":\"Edit password\",\"newPassword\":\"New password\",\"editMailAddress\":\"Edit e-mail address\",\"chgEmailAddress\":\"Change e-mail address\",\"Photo\":\"Photo\",\"Address\":\"Address\",\"Male\":\"Male\",\"Female\":\"Female\",\"phoneNo\":\"Phone No\",\"defLang\":\"Default language\",\"email\":\"Email address\",\"chgPassword\":\"Change password\",\"renewPassword\":\"Retype New password\",\"adminTasks\":\"Administrative tasks\",\"ClassSchedule\":\"TimeTable\",\"Assignments\":\"Assignments\",\"booksLibrary\":\"Books library\",\"Attendance\":\"Attendance\",\"Onlineexams\":\"Online exams\",\"media\":\"Media\",\"Payments\":\"Payments\",\"Return\":\"Return\",\"Transport\":\"Transport\",\"Polls\":\"Polls\",\"votes\":\"View Votes\",\"Calendar\":\"Calendar\",\"Search\":\"Search\",\"username\":\"Username\",\"name\":\"Name\",\"ID\":\"ID\",\"Operations\":\"Operations\",\"cancelAdd\":\"Cancel add\",\"Calender\":\"Calendar\",\"Status\":\"Status\",\"toggleDropdown\":\"Toggle Dropdown\",\"from\":\"From\",\"Export\":\"Export\",\"ExportCSV\":\"Export to CSV\",\"ImportCSV\":\"Import from CSV\",\"details\":\"Details\",\"Active\":\"Active\",\"specifyFileToImport\":\"Please specify file to upload\",\"Inactive\":\"Inactive\",\"saveSettings\":\"Save Settings\",\"available\":\"Available\",\"Import\":\"Import\",\"ExportExcel\":\"Export to Excel\",\"to\":\"To\",\"for\":\"For\",\"all\":\"All\",\"Calenderlist\":\"Calendar list\",\"cancelEdit\":\"Cancel Edit\",\"Edit\":\"Edit\",\"Remove\":\"Remove\",\"Download\":\"Download\",\"Date\":\"Date\",\"Print\":\"Print\",\"Comments\":\"Comments\",\"Extras\":\"Extras\",\"ExportPDF\":\"Export to PDF\",\"ImportExcel\":\"Import from Excel\",\"unavailable\":\"Unavailable\",\"Description\":\"Description\",\"dataImported\":\"Data imported successfully\",\"registerAcc\":\"Registeration\",\"chkMailRestore\":\"Please check your e-mail for restore link\",\"expRestoreId\":\"Expired resore id ( > 24h ), please make new password resore request\",\"mustTypePwd\":\"You must type password\",\"usernameUsed\":\"Username already used, use another one\",\"mailUsed\":\"E-mail address already used, check it or restore password\",\"mustTypeFullName\":\"You must type full name\",\"invRstoreId\":\"Invalid URL or restore id, please make new password resore request\",\"chkInputFields\":\"Please check the input fields\",\"chkUserPass\":\"Please check your username & password\",\"chkUserMail\":\"Please check your username\",\"pwdChangedSuccess\":\"Password changed successfully, press login to continue\",\"mustSelAccType\":\"You must select account type\",\"mustSelUsername\":\"You must type username\",\"invEmailAdd\":\"Invalid e-mail address\",\"notRepStCode\":\"is not represent student code\",\"Address2\":\"Address 2\",\"oldPwdDontMatch\":\"Old password don\'t match stored one\",\"mailAlreadyUsed\":\"E-mail address already used, check it or restore password\",\"allowLanguage\":\"Allow users change languages\",\"sysMail\":\"System E-mail\",\"setZero\":\"Set to 0 for none\",\"subBased\":\"Subject Based\",\"None\":\"None\",\"sendStudentsAbsendVia\":\"Send student\'s absence via\",\"schoolTerms\":\"Privacy Policy\",\"generalSettings\":\"General Settings\",\"allowed\":\"Allowed\",\"paymentMail\":\"Paypal payment E-mail\",\"footer\":\"Footer Copyrights\",\"classBased\":\"Class only\",\"sendExamDet\":\"Send exam details to\",\"activatedModules\":\"Activated Modules\",\"siteTitle\":\"Site title\",\"notAllowed\":\"Not allowed\",\"payTax\":\"Payment Tax\",\"attendanceModel\":\"Attendance model\",\"examNotif\":\"Exam details notifications\",\"studentsParents\":\"Students & Parents\",\"editSettings\":\"Edit settings\",\"Administrators\":\"Administrators\",\"listAdministrators\":\"List administrators\",\"password\":\"Password\",\"adminUpdated\":\"Admin updated successfully\",\"usernameAlreadyUsed\":\"Username already used, use another one\",\"adminFullName\":\"Admin full name\",\"addAdministrator\":\"Add admininstrator\",\"editAdministrator\":\"Edit admininstrator\",\"emailAlreadyUsed\":\"E-mail address already used, check it or restore password\",\"AssignmentTitle\":\"Assignment title\",\"noAssignments\":\"No assignments\",\"assignmentCreated\":\"Assignment created successfully\",\"AddAssignments\":\"Add assignment\",\"AssignmentDescription\":\"Assignment Description\",\"AssignmentFile\":\"Assignment File\",\"assignmentModified\":\"Assignment modified successfully\",\"listAssignments\":\"List Assignments\",\"AssignmentDeadline\":\"Assignment Deadline\",\"editAssignment\":\"Edit Assignment\",\"selectAttendance\":\"Select attendance info to add\",\"Present\":\"Present\",\"LateExecuse\":\"Late with excuse\",\"attendanceStats\":\"Attendance Statistics\",\"attendanceFilters\":\"Search for attendance ( Select filters )\",\"absentReport\":\"Student absence report\",\"controlAttendance\":\"Control attendance\",\"Absent\":\"Absent\",\"earlyDismissal\":\"Early Dismissal\",\"attendancePerDay\":\"Attendance per day\",\"attendanceSearch\":\"Search attendance\",\"studentName\":\"Student Name\",\"Late\":\"Late\",\"saveAttendance\":\"Save attendance\",\"attendanceToday\":\"Attendance today\",\"attendanceSaved\":\"Attecndance saved successfully\",\"class\":\"Class\",\"addClass\":\"Add class\",\"classTeacher\":\"Class teacher\",\"className\":\"Class name\",\"listClasses\":\"List classes\",\"classDorm\":\"Class dormitory\",\"classSch\":\"Classes Schedule\",\"editClassSch\":\"Edit Class Schedule\",\"endTime\":\"End Time\",\"Sunday\":\"Sunday\",\"Wednesday\":\"Wednesday\",\"Saturday\":\"Saturday\",\"NoClasses\":\"No classes\",\"classEditSch\":\"Select class to edit schedule\",\"Day\":\"Day\",\"addSch\":\"Add Schedule\",\"Monday\":\"Monday\",\"Thurusday\":\"Thursday\",\"classCreated\":\"Class created successfully\",\"editClass\":\"Edit Class\",\"ReadSchedule\":\"Read schedule\",\"startTime\":\"Start Time\",\"editSch\":\"Edit Schedule\",\"Tuesday\":\"Tuesday\",\"Friday\":\"Friday\",\"classUpdated\":\"Class updated successfully\",\"Dormitories\":\"Dormitories\",\"DormName\":\"Dormitory Name\",\"addDorm\":\"Add Dormitory\",\"dormUpdated\":\"Dormitory updated successfully\",\"addDormitories\":\"Add dormitory\",\"DormDesc\":\"Dormitory Description\",\"editDorm\":\"Edit Dormitory\",\"listDormitories\":\"List dormitories\",\"noDorm\":\"No dormitories\",\"dormCreated\":\"Dormitory created successfully\",\"listNews\":\"List news\",\"newsContent\":\"News content\",\"listEvents\":\"List events\",\"noEvents\":\"No events\",\"eventPlace\":\"Event Place\",\"eventModified\":\"Event modified successfully\",\"newsCreated\":\"News created successfully\",\"editEvent\":\"Edit event\",\"addEvent\":\"Add event\",\"eventNamePlace\":\"Event Name \\/ Place\",\"noNews\":\"No news\",\"addNews\":\"Add News\",\"newsboard\":\"News Board\",\"events\":\"Events\",\"newsTitle\":\"News title\",\"editNews\":\"Edit News\",\"eventDescription\":\"Event Description\",\"eventTitle\":\"Event Title\",\"eventCreated\":\"Event created successfully\",\"newsModified\":\"News modified successfully\",\"examsList\":\"Exams List\",\"examName\":\"Exam Name\",\"mark\":\"Mark\",\"selClassSubExam\":\"Select class & subject for exam\",\"attendanceMakrs\":\"Attendance Marks\",\"gradeLevels\":\"Grade levels\",\"gradeName\":\"Grade Name\",\"noGrades\":\"No grades\",\"editGrade\":\"Edit grade\",\"onlineExams\":\"Online Exams\",\"examDeadline\":\"Exam Deadline\",\"gradeCreated\":\"Grade created successfully\",\"gradeFrom\":\"Grade From\",\"gradeDesc\":\"Grade Description\",\"addLevel\":\"Add Grade level\",\"examMarks\":\"Exam Marks\",\"addMarks\":\"Add marks\",\"sendExamMarks\":\"Send marks notifications\",\"examDesc\":\"Exam Description\",\"addExam\":\"Add exam\",\"listExams\":\"List exams\",\"showMarks\":\"Show marks\",\"noExams\":\"No exams\",\"controlMarksExam\":\"Control marks for Exam\",\"addUpdateMarks\":\"Add\\/Update Marks\",\"listMarks\":\"List grades\",\"gradePoint\":\"Grade Point\",\"gradeTo\":\"Grade To\",\"gradeUpdated\":\"Grade updated successfully\",\"takeExam\":\"Take exam\",\"showExamGradesAfter\":\"Show grade after finish exams\",\"Answers\":\"Answers\",\"infoBox\":\"Info Box\",\"Grade\":\"Grade\",\"examModified\":\"Exam modified successfully\",\"examNotSent\":\"Notifications sent successfully\",\"examCreated\":\"Exam created successfully\",\"examDetailsNot\":\"Exam details notifications\",\"AveragePoints\":\"Average Points\",\"editExam\":\"Edit Exam\",\"trueAns\":\"True Answer\",\"Questions\":\"Questions\",\"Question\":\"Question\",\"addQuestion\":\"Add question\",\"submitAnswers\":\"Submit answers\",\"adjustExamNot\":\"Please adjust exam notifications first from General settings\",\"Languages\":\"Languages\",\"noLanguage\":\"No languages\",\"languagePhrases\":\"Language phrases\",\"langModified\":\"Language updated successfully\",\"editLanguage\":\"Edit Language\",\"addLanguage\":\"Add language\",\"listLanguage\":\"List languages\",\"languageName\":\"Language Name\",\"langCreated\":\"Language created successfully\",\"Library\":\"Library\",\"bookTitle\":\"Book title\",\"noBooks\":\"No books\",\"bookType\":\"Book Type\",\"bookPrice\":\"Book Price\",\"editBook\":\"Edit book\",\"bookAdded\":\"Book added successfully\",\"uploadBook\":\"Upload book\",\"traditionalBook\":\"Traditional Book\",\"addBook\":\"Add book\",\"bookAuthor\":\"Book Author\",\"listBooks\":\"List Books\",\"bookPriceState\":\"Book Price \\/ State\",\"bookDescription\":\"Book Description\",\"electronicBook\":\"Electronic Book\",\"State\":\"State\",\"bookModified\":\"Book modified successfully\",\"mailsms\":\"Mail \\/ SMS\",\"mailsmsSettings\":\"Mail\\/SMS Settings\",\"sendAs\":\"Send as\",\"mailSMSSend\":\"Send Mail \\/ SMS\",\"Sender\":\"Sender\",\"smsProvider\":\"SMS Provider\",\"mailsmsTemplates\":\"Mail \\/ SMS Templates\",\"noTemplates\":\"No templates\",\"mailTemplate\":\"Mail template\",\"smsTemplate\":\"SMS template\",\"editTemplate\":\"Edit template\",\"listTemplates\":\"List templates\",\"mailSettings\":\"Mail Settings\",\"noMessages\":\"No messages\",\"listMessages\":\"List Messages\",\"messageTitle\":\"Message Title\",\"selUsers\":\"Select users\",\"sms\":\"SMS\",\"listSentMessages\":\"List of sent messages\",\"typeUsers\":\"Type of users\",\"messageContent\":\"Message Content\",\"typeDate\":\"Type \\/ Date\",\"smsSettings\":\"SMS Settings\",\"mailDeliverType\":\"Mail Delivery Type\",\"templateTitle\":\"Template title\",\"templateVars\":\"Template variables\",\"templateUpdated\":\"Template updated successfully\",\"mediaCenter\":\"Media Center\",\"addAlbum\":\"Add album\",\"noMediaInAlbum\":\"No media exist in this album\",\"albumImage\":\"Album image\",\"mediaTitle\":\"Media title\",\"editMedia\":\"Edit media\",\"mediaCreated\":\"Media created successfully\",\"mediaModified\":\"Media modified successfully\",\"albumCreated\":\"Album created successfully\",\"mediaDesc\":\"Media description\",\"editAlbum\":\"Edit album\",\"albumTitle\":\"Album title\",\"albums\":\"Albums\",\"goUp\":\"Go to up\",\"uploadMedia\":\"Upload media\",\"albumDesc\":\"Album description\",\"addMedia\":\"Add media\",\"mediaImage\":\"Media image\",\"albumModified\":\"Album modified successfully\",\"Messages\":\"Messages\",\"composeMessage\":\"Compose Message\",\"typeReply\":\"Type reply ( press enter to submit ) ...\",\"message\":\"Message\",\"messageNotExist\":\"The message you try to reach not exist\",\"userisntExist\":\"User isn\'t exist\",\"sendMessage\":\"Send Message\",\"markRead\":\"Mark as read\",\"markUnread\":\"Mark as unread\",\"loadOldMessages\":\"Load old messages\",\"sendMessageTo\":\"Send message to (username)\",\"readMessage\":\"Read Message\",\"paymentTitleDate\":\"Payment Title \\/ Date\",\"paid\":\"PAID\",\"noPayments\":\"No payments\",\"editPayment\":\"Edit payment\",\"AmountDue\":\"Amount Due\",\"paymentCreated\":\"Payments created successfully\",\"noPaymentDetails\":\"No Payment Details exist\",\"paymentModified\":\"Payments modified successfully\",\"Total\":\"Total\",\"Product\":\"Particulars\",\"paymentTitle\":\"Payment Title\",\"unpaid\":\"UNPAID\",\"paymentDesc\":\"Payment Description\",\"addPayment\":\"Add payment\",\"listPayments\":\"List payments\",\"Amount\":\"Amount\",\"viewInvoice\":\"View invoice\",\"paymentSelectMultiple\":\"Selecting multiple students will generate seperate invoice for each one\",\"Subtotal\":\"Subtotal\",\"listPaymentDetail\":\"List payment details\",\"paymentDetails\":\"Payment details\",\"pollTitle\":\"Poll title\",\"noPolls\":\"No Polls\",\"editPoll\":\"Edit poll\",\"pollCreated\":\"Poll created successfully\",\"pollUpdated\":\"Poll updated successfully\",\"activatePoll\":\"Activate Poll\",\"votePoll\":\"Vote poll\",\"pollOptions\":\"Poll Options\",\"pollTarget\":\"Poll target\",\"addPoll\":\"Add poll\",\"listPolls\":\"List polls\",\"pollStatus\":\"Poll status\",\"newOption\":\"New Option\",\"alreadyvoted\":\"You already voted before\",\"pollActivated\":\"Poll activated successfully\",\"staticPages\":\"Static pages\",\"listPages\":\"List pages\",\"editPage\":\"Edit page\",\"pageModified\":\"Page modified successfully\",\"controlPages\":\"Control Pages\",\"pageTitle\":\"Page title\",\"activeInactivePage\":\"Active \\/ Inactive page\",\"pageChanged\":\"Page changed successfully\",\"addPage\":\"Add page\",\"pageContent\":\"Page content\",\"pageCreated\":\"Page created successfully\",\"Subjects\":\"Subjects\",\"subjectName\":\"Subject name\",\"subjectCreated\":\"Subject created successfully\",\"Subject\":\"Subject\",\"noSubjects\":\"No subjects\",\"subjectEdited\":\"Subject edited successfully\",\"addSubject\":\"Add subject\",\"editSubject\":\"Edit Subject\",\"Transportation\":\"Stoppage\",\"transportTitle\":\"Transport title\",\"Fare\":\"Fare\",\"editTransport\":\"Edit Transport\",\"transportCreated\":\"Stoppage created successfully\",\"addTransport\":\"Add transport\",\"transportDesc\":\"Transport Description\",\"listSubs\":\"List subscribers\",\"Contact\":\"Contact\",\"transportUpdated\":\"Stoppage updated successfully\",\"listTransport\":\"List Stoppage\",\"driverContact\":\"Driver Contact\",\"noTransportation\":\"No Stoppage\",\"noMatches\":\"No matches\",\"parents\":\"Parents\",\"role\":\"Role\",\"listTeachers\":\"List teachers\",\"EditTeacher\":\"Edit Teacher\",\"rollid\":\"Roll id\",\"listParents\":\"List parents\",\"studentDetails\":\"Student Details\",\"parent\":\"Parent\",\"addTeacher\":\"Add teacher\",\"noTeachers\":\"No teachers\",\"fileToImport\":\"File to import\",\"Marksheet\":\"Marksheet\",\"editStudent\":\"Edit student\",\"noParents\":\"No parents\",\"Relation\":\"Relation\",\"editParent\":\"Edit Parent\",\"Profession\":\"Profession\",\"AddParent\":\"Add parent\",\"noStudents\":\"No students\",\"addStudent\":\"Add student\",\"Approve\":\"Approve\",\"waitingApproval\":\"Waiting approval\",\"csvParentInvalid\":\"This file not represent CSV parents file\",\"Profile\":\"Profile\",\"teacherInfo\":\"Teacher Information\",\"studentHaveNoMarks\":\"Student has no marks till now\",\"teacherCreated\":\"Teacher created successfully\",\"teacherUpdated\":\"Teacher updated successfully\",\"studentModified\":\"Student modified successfully\",\"csvStudentInvalid\":\"This file not represent CSV student file\",\"parentInfo\":\"Parent Information\",\"parentCreated\":\"Parent created successfully\",\"csvTeacherInvalid\":\"This file not represent CSV teacher file\",\"studentCreatedSuccess\":\"Student created successfully\",\"studentInfo\":\"Student Information\",\"parentModified\":\"Parent modified successfully\",\"listStudents\":\"List students\",\"latestVersion\":\"Latest Version\",\"logout\":\"Logout\",\"registerNewAccount\":\"Register a new membership\",\"restorePwd\":\"Restore Password\",\"userNameOrEmail\":\"Username\",\"rememberMe\":\"Remember me\",\"youfindStId\":\"You\'ll find Student code in your student dashboard main page, it look like:\",\"parntStudentIdSep\":\"Parent\'s Students ids - seperate with ,\",\"thankReg\":\"Thank you for register, please contact school for activating your account with id\",\"signIn\":\"Sign in\",\"resetPwdNow\":\"Reset password now\",\"printPage\":\"Print this page\",\"loginToAccount\":\"Login to your account\",\"theme\":\"Theme\",\"blue\":\"Blue\",\"black\":\"Black\",\"idNumber\":\"ID Number\",\"position\":\"ltr\",\"direction\":\"Direction\",\"rtl\":\"Right to left\",\"ltr\":\"Left to right\",\"Promotion\":\"Promotion\",\"studentsPromotedClass\":\"Students will promoted to class\",\"promoteStudents\":\"Promote students\",\"studentsToBPronoted\":\"Students to be promoted\",\"chgAcademicYears\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 \\u0627\\u0644\\u0633\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0631\\u0627\\u0633\\u064a\\u0629\",\"chgYear\":\"Change Year\",\"teacherLeaderboard\":\"Teacher\'s leaderboard\",\"searchUsers\":\"Search users\",\"studentLeaderboard\":\"Student\'s leaderboard\",\"thanks\":\"Thanks\",\"sureRemove\":\"Sure remove this item?\",\"mailReMailDontMatch\":\"E-mail & Re-Email don\'t match\",\"passRepassDontMatch\":\"Password & Re-Password don\'t match\",\"profileUpdated\":\"Profile updated successfully\",\"blueLight\":\"blue-light\",\"green\":\"green\",\"purpleLight\":\"purple-light\",\"mailSmsSettings\":\"Mail \\/ SMS Settings\",\"schoolTitle\":\"School Title\",\"yellow\":\"yellow\",\"greenLight\":\"green-light\",\"red\":\"red\",\"globalSettings\":\"Global Settings\",\"vacationSettings\":\"Vacation Settings\",\"customText\":\"Custom Text\",\"LogoImage\":\"Image ( Upload logo to path : assets\\/img\\/logo.png - Best Size : 200 x 40 px )\",\"Logo\":\"Logo\",\"paymentsSettings\":\"Payments Settings\",\"redLight\":\"red-light\",\"purple\":\"purple\",\"yellowLight\":\"yellow-light\",\"exclude\":\"Don\'t include\",\"Include\":\"Include\",\"includeAttendace\":\"Include attendance in marksheet grades\",\"allowChangeTheme\":\"Allow users to change theme\",\"currencyCode\":\"Currency Code ( 3 Phrases like USD )\",\"paypalSupported\":\"Supported codes for paypal are :\",\"numberOfDaysStVacation\":\"Number of days for student vacation per Academic Year\",\"studentVacationDays\":\"Students\'s vacation days \\/ Academic Year\",\"currencySymbol\":\"Currency Symbol (like $)\",\"teacherVacationDays\":\"Teacher\'s vacation days \\/ Academic Year\",\"numberOfDaysTeacherVacation\":\"Number of days for teacher vacation per Academic Year\",\"weeksDaysOff\":\"Week Days off\",\"nationalVacDays\":\"National Vacation days\",\"settSaved\":\"Settings saved successfully\",\"newDateVacation\":\"Select the new date for vacation\",\"delAdministrator\":\"Delete admininstrator\",\"adminDeletedSucc\":\"Administrator deleted successfully\",\"adminNotExist\":\"Administrator isn\'t exist\",\"viewAnswers\":\"View answers\",\"answerFile\":\"Answer File\",\"delAssignment\":\"Delete assignment\",\"applyAssAnswer\":\"Apply assignment answer\",\"assUploadedSucc\":\"Answer uploaded successfully\",\"assNoFilesUploaded\":\"No files uploaded !\",\"assAlreadySub\":\"You already applied answer to this assignment before\",\"assignemntNotExist\":\"Assignment isn\'t exist\",\"timeApplied\":\"Time applied\",\"userNotes\":\"User Notes\",\"uploadAnswer\":\"Upload answer to assignment\",\"assignemntDel\":\"Assignment deleted successfully\",\"assDeadTime\":\"Assignment deadtime reached, you cannot submit\",\"staffAttendance\":\"Staff Attendance\",\"associatedSubjects\":\"Associated subjects\",\"classNotExist\":\"Class isn\'t exist\",\"delSch\":\"Delete schedule\",\"schDeleted\":\"Schedule deleted successfully\",\"schModSucc\":\"Schedule Modified successfully\",\"delClass\":\"Delete class\",\"classDeleted\":\"Class deleted successfully\",\"schCreaSucc\":\"Schedule Created successfully\",\"schNotExist\":\"Schedule isn\'t exist\",\"dormNotExist\":\"Dormitory isn\'t exist\",\"delEvent\":\"Delete event\",\"delNews\":\"Delete news\",\"newsDeleted\":\"News deleted successfully\",\"eventDeleted\":\"Event deleted successfully\",\"eventNotEist\":\"Event isn\'t exist\",\"newsNotEist\":\"News isn\'t exist\",\"questionType\":\"Question Type\",\"oneOption\":\"Select one option\",\"sureMarks\":\"Are you sure that all subject\'s marks added successfully?\",\"textValue\":\"Enter text value\",\"multipleOption\":\"Select Multiple options\",\"examTitleUndefined\":\"Exam Title undefined\",\"examTimedOut\":\"Sorry, timeout. Exam Finished\",\"examYourGrade\":\"Your grade is :\",\"exDeleted\":\"Exam deleted successfully\",\"gradeDeleted\":\"Grade deleted successfully\",\"delGradeLevel\":\"Delete grade level\",\"gradeNotExist\":\"Grade isn\'t exist\",\"exNotExist\":\"Exam isn\'t exist\",\"examSubmitionSaved\":\"Your submittion saved, thank you.\",\"delExam\":\"Delete exam\",\"exAlreadyTook\":\"You already took this exam before\",\"delLanguage\":\"Delete language\",\"languageDel\":\"Language deleted successfully\",\"languageNotExist\":\"Language isn\'t exist\",\"delLibrary\":\"Delete library item\",\"itemNotExist\":\"Item isn\'t exist\",\"itemdel\":\"Item deleted successfully\",\"specificUsers\":\"Specific users\",\"mailSentSuccessfully\":\"Message sent successfully\",\"mediaType\":\"Media Type\",\"removeAlbum\":\"Sure remove this album, all enclosed images will be deleted?\",\"albumNotExist\":\"Album isn\'t exist\",\"mediaNotExist\":\"Media isn\'t exist\",\"mediaDel\":\"Media deleted successfully\",\"albumDel\":\"Album deleted successfully\",\"url\":\"URL\",\"image\":\"Image\",\"delAlbum\":\"Delete album\",\"delMedia\":\"Delete media\",\"typeNameUserMail\":\"Type Name \\/ username\",\"select\":\"Select\",\"messIsUnread\":\"Messages changed to unread successfully\",\"messIsRead\":\"Messages changed to read successfully\",\"messDel\":\"Messages deleted successfully\",\"delMess\":\"Delete messages\",\"chgMessage\":\"Change messages\",\"selectStudents\":\"Select students\",\"delPayment\":\"Delete payment\",\"paymentNotExist\":\"Payment isn\'t exist\",\"paymentDel\":\"Payment deleted successfully\",\"voteMustSelect\":\"You must select item to vote.\",\"pollDel\":\"Poll deleted successfully\",\"delPoll\":\"Delete poll\",\"totalVotes\":\"Total votes\",\"voteOptionTitle\":\"Please enter option title\",\"pollNotExist\":\"Poll isn\'t exist\",\"delPage\":\"Delete page\",\"pageDel\":\"Page deleted successfully\",\"delNotExist\":\"Page isn\'t exist\",\"subjectNotExist\":\"Subject isn\'t exist\",\"delSubject\":\"Delete Subject\",\"subjectDel\":\"Subject deleted successfully\",\"transDel\":\"Stoppage deleted successfully\",\"transNotExist\":\"Stoppage isn\'t exist\",\"delTrans\":\"Delete stoppage\",\"linkStudentParent\":\"Link student to parent\",\"leaderBoardMessage\":\"Please enter leaderboard message\",\"delParent\":\"Delete parent\",\"approveStudent\":\"Approve student\",\"delStudent\":\"Delete student\",\"stdLeaderBoard\":\"Student leaderboard\",\"stdNotLeader\":\"Student isn\'t leaderboard\",\"delTeacher\":\"Delete teacher\",\"teacLeaderBoard\":\"Teacher leaderboard\",\"teachNotLeader\":\"Teacher isn\'t leaderboard\",\"teacLeaderDel\":\"Teacher\'s leaderboard deleted successfully\",\"teacherNotExist\":\"Teacher isn\'t exist\",\"stdLeaderRem\":\"Student\'s leaderboard removed successfully\",\"stdNotExist\":\"Student isn\'t exist\",\"parentNotExist\":\"Parent isn\'t exist\",\"teacherApproved\":\"Teacher approved successfully\",\"relationShipEnter\":\"Please enter your relation to student\",\"minCharLength3\":\"Min character length is 3\",\"approveTeacher\":\"Approve teacher\",\"parentDel\":\"Parent deleted successfully\",\"stdApproved\":\"Student approved successfully\",\"stdDeleted\":\"Student deleted successfully\",\"stdNowLeaderBoard\":\"Student is now leaderboard\",\"teacherDel\":\"Teacher deleted successfully\",\"teacIsLeader\":\"Teacher is now leaderboard\",\"newAcYear\":\"New Academic Year\",\"newClass\":\"New Class\",\"fromAcYear\":\"From Academic Year\",\"Vacation\":\"Vacation\",\"confirmVacation\":\"Confirm vacation\",\"acceptedVacation\":\"Accepted Vacation\",\"delVacation\":\"Delete Vacation\",\"vacDel\":\"Vacation deleted successfully\",\"rejectedVacation\":\"Rejected Vacation\",\"notes\":\"Notes\",\"selectVacationDates\":\"Select vacation dates\",\"getVacation\":\"Get Vacation\",\"publicHoliday\":\"Public Holiday\",\"vacSubmitted\":\"Vacation request submitted successfully\",\"vacNotExist\":\"Vacation isn\'t exist\",\"studyMaterial\":\"Study Material\",\"materialTitle\":\"Material Title\",\"materialFile\":\"Material file\",\"materialDel\":\"Material deleted successfully\",\"materialEdited\":\"Material modified successfully\",\"materialNotExist\":\"Material isn\'t exist\",\"editMaterial\":\"Edit Material\",\"materialDesc\":\"Material Description\",\"addMaterial\":\"Add Material\",\"listStudyMaterial\":\"List Study Material\",\"noMaterialData\":\"No Material data\",\"delMaterial\":\"Delete Material\",\"materialAdded\":\"Material added successfully\",\"Reports\":\"Reports\",\"paymentsReports\":\"Payments Reports\",\"user\":\"User\",\"totalUsers\":\"Total Users\",\"academicyears\":\"Academic Years\",\"yearTitle\":\"Year Title\",\"defAcademicYears\":\"Default academic year\",\"delAcademicYears\":\"Delete academic year\",\"acYearNotExist\":\"Academic year isn\'t exist\",\"acYearNowDef\":\"Academic year is now default one\",\"acYearAddSuc\":\"Academic year created successfully\",\"cannotDelDefAcademicYears\":\"Cannot delete default academic year\",\"markAsDefAcademicYears\":\"Mark as default academic year\",\"yearStatus\":\"Year Status\",\"addAcademicyear\":\"Add academic year\",\"vacationList\":\"Vacation List\",\"activeUsers\":\"Active Users\",\"studentVacation\":\"Students Vacation\",\"UsersStats\":\"Users Statistics\",\"studentAttendance\":\"Students Attendance\",\"teacherVacation\":\"Teachers Vacation\",\"inactiveUsers\":\"Inactive Users\",\"getPaymentReports\":\"Get payments reports\",\"listAcademicyear\":\"List academic years\",\"noAcademicYears\":\"No academic years available\",\"editAcademicYears\":\"Edit academic year\",\"acYearDelSuc\":\"Academic year deleted successfully\",\"acYearModSuc\":\"Academic year modified successfully\",\"delDorm\":\"Delete Dormitory\",\"dormDeleted\":\"Dormitory deleted successfully\",\"failedImport\":\"Failed to import\",\"readyImport\":\"Ready to import\",\"reviseImportData\":\"Please revise data errors\",\"noDataImport\":\"No data to import\",\"noMarksheetAv\":\"No Marksheet data available\",\"blackLight\":\"Black-light\",\"HostelManage\":\"Hostel Management\",\"Hostel\":\"Hostel\",\"HostelCat\":\"Hostel Categories\",\"AddHostel\":\"Add Hostel\",\"ListHostel\":\"List Hostel\",\"HostelTitle\":\"Hostel Title\",\"Hosteltype\":\"Hostel Type\",\"Manager\":\"Manager\",\"EditHostel\":\"Edit hostel\",\"Boys\":\"Boys\",\"Girls\":\"Girls\",\"Mixed\":\"Mixed\",\"Notes\":\"Notes\",\"noHostel\":\"No hostel available\",\"delHostel\":\"Delete Hostel\",\"hostelDeleted\":\"Hostel deleted successfully\",\"hostelNotExist\":\"Hostel not exist\",\"HostelCreated\":\"Hostel created successfully\",\"HostelModified\":\"Hostel modified successfully\",\"delHostelCat\":\"Delete hostel category\",\"hostelCatDeleted\":\"Hostel category deleted successfully\",\"HostelCatNotExist\":\"Hostel category not exist\",\"addHostelCat\":\"Add hostel category\",\"HostelCatCreated\":\"Category created successfully\",\"editHostelCat\":\"Edit hostel category\",\"hostelCatModified\":\"Category modified successfully\",\"listHostelCat\":\"List Hostel categories\",\"catTitle\":\"Category Title\",\"fees\":\"Fees\",\"sections\":\"sections\",\"addSection\":\"Add section\",\"listSections\":\"List sections\",\"sectionTitle\":\"Section Title\",\"section\":\"Section name\",\"editSection\":\"Edit section\",\"delSection\":\"Delete section\",\"sectionAdded\":\"Section added successfully\",\"sectionUpdated\":\"Section updated successfully\",\"sectionDeleted\":\"Section deleted successfully\",\"sectionNotExist\":\"Section not exist\",\"allowedExamMin\":\"Allowed exam time in miuntes (0 for unlimited)\",\"examDegreeSuccess\":\"Exam degree of success\",\"questionMark\":\"Question mark\",\"emptyOneMark\":\"Empty mark will caluculated as 1 mark\",\"accounting\":\"Accounting\",\"FeeTypes\":\"Fee Types\",\"addFeeType\":\"Add fee type\",\"listFeeType\":\"List fee types\",\"FeeType\":\"Fee Type\",\"feeDefaultAmount\":\"Default amount\",\"noFeeTypesAv\":\"No fee types available\",\"feeTypeTitle\":\"Fee type title\",\"editFeeType\":\"Edit fee type\",\"delFeeType\":\"Delete fee type\",\"feeAdded\":\"Fee added successfully\",\"feeUpdated\":\"Fee updated successfully\",\"feeNotExist\":\"Fee type not exist\",\"feeDeleted\":\"Fee type deleted successfully\",\"FeeAllocation\":\"Fee Allocation\",\"listFeeAllocation\":\"List fee allocation\",\"addFeeAllocation\":\"Add fee allocation\",\"noFeeAllocAv\":\"No fee allocation available\",\"classesFeeAllocation\":\"Classes fee allocation\",\"studentsFeeAllocation\":\"Students fee allocation\",\"allocationType\":\"Allocation type\",\"feeDetails\":\"Fee details\",\"value\":\"Value\",\"editFeeAllocation\":\"Edit fee allocation\",\"feeAllocationAdded\":\"Fee allocation added successfully\",\"feeAllocationUpdated\":\"Fee allocation updated successfully\",\"delFeeAllocation\":\"Delete fee allocation\",\"feeAllocationDeleted\":\"Fee allocation deleted successfully\",\"feeAllocationNotExist\":\"Fee allocation not exist\",\"selStudentAlreadyHasAllFee\":\"Selected class already has allocated fee\",\"alreadyHasAllFee\":\"already has allocated fee\",\"Expenses\":\"Expenses\",\"addExpense\":\"Add Expense\",\"expenseTitle\":\"Expense title\",\"expenseAmount\":\"Expense amount\",\"ExpenseDate\":\"Expense date\",\"editExpense\":\"Edit expense\",\"expenseUpdated\":\"Expense updated successfully\",\"expenseAdded\":\"Expense added successfully\",\"delExpense\":\"Delete expense\",\"expenseDeleted\":\"Expense deleted successfully\",\"expenseNotExist\":\"Expense not exist\",\"passGrade\":\"Pass grade\",\"finalGrade\":\"Final grade\",\"marksheetGen\":\"Marksheet Generation\",\"fullPerm\":\"Full Permissions\",\"customPerm\":\"Custom Permissions\",\"noAdministrators\":\"No Administrators\",\"Permissions\":\"Permissions\",\"enableSections\":\"Enable Sections\",\"allowPublicReg\":\"Allow public registeration\",\"dateFormat\":\"Date Format\",\"studentMail\":\"Studnet\'s E-mail\",\"Mandatory\":\"Mandatory\",\"notMandatory\":\"Not Mandatory\",\"autoInvoiceGen\":\"Automatic invoice generation\",\"autoInvoiceGenCreateApprove\":\"Automatically generate invoice when student created \\/ approved\",\"autoInvoiceGenPromote\":\"Automatically generate invoice when student promoted\",\"noAttendance\":\"No attendance available to show\",\"noHostelCat\":\"No categories available\",\"mobileNotifications\":\"Mobile Notifications\",\"sendNewNotification\":\"Send new notification\",\"newMessageFrom\":\"New Message From\",\"notifyIsLedaerBoard\":\"Congratulations! You\'re in the leaderboard\",\"newAssigmentAdded\":\"New Assignemnt added\",\"newOnlineExamAdded\":\"New Online exam added\",\"newPaymentNotif\":\"New payment pending your action\",\"totalMarks\":\"Total Marks\",\"allowTeaSendMailSms\":\"Allow teachers send mail\\/sms\",\"Image\":\"Image\",\"viewImage\":\"View Image\",\"chgImage\":\"Change Image\",\"uplImage\":\"Upload Image\",\"noQuestAnswer\":\"No questions answered yet\",\"falseAns\":\"False Answer\",\"markShFields\":\"Marksheet Fields\",\"addColumn\":\"Add Column\",\"Reccuring\":\"Reccuring\",\"cycleEver\":\"Cycle every\",\"day\":\"Day\",\"month\":\"Month\",\"year\":\"Year\",\"nextCycle\":\"Next Cycle\",\"medHistory\":\"Medical History\",\"toggleView\":\"Toggle View\",\"medInfo\":\"Medical Info\",\"height\":\"Height\",\"Weight\":\"Weight\",\"RH\":\"Diet\",\"insPolicy\":\"Insurance Policy\",\"vacCard\":\"Vaccination card\",\"preMedMed\":\"Premedication Medicine\",\"prefclinic\":\"Preferred Clinic\",\"disType\":\"Disability Type\",\"contactInfo\":\"Contact Information\",\"Allergies\":\"Allergies\",\"Medications\":\"Medications\",\"Immunization\":\"Immunization\",\"Fractures\":\"Fractures\",\"Surgery\":\"Surgery\",\"Remarks\":\"Remarks\",\"saveMed\":\"Save Medical Information\",\"promotionType\":\"Promote Type\",\"promote2AcYear\":\"Promote to another academic year\",\"graduate\":\"Graduate\",\"graduateBelow\":\"The below students will be marked as graduated students\",\"Diet\":\"Diet\",\"inCaseEmerg\":\"In case of emergencies\",\"specMedInfo\":\"Specific Medical Information\",\"listGradStd\":\"List Graduate Students\",\"seeMoreTodayDates\":\"See more today dates\",\"today\":\"Today\",\"tomorrow\":\"Tomorrow\",\"advSearch\":\"Advanced Search\",\"examSchedule\":\"Exam Schedule\",\"endDate\":\"End Date\",\"next\":\"Next\",\"previous\":\"Previous\",\"Communication\":\"Communication\",\"mail\":\"Mail\",\"phone\":\"Phone\",\"Invoices\":\"Invoices\",\"dueInvoices\":\"Due Invoices\",\"title\":\"Title\",\"time\":\"Time\",\"ppaid\":\"PARTIALLY PAID\",\"dueDate\":\"Due Date\",\"servicePanel\":\"Service Panel\",\"lightSidebar\":\"With Light sidebar\",\"darkSidebar\":\"With Dark sidebar\",\"InvTitle\":\"Invoice Title\",\"paidAmount\":\"Paid Amount\",\"dateDueDate\":\"Date \\/ Due Date\",\"showDueInvOnly\":\"Show Due Invoices Only\",\"myInvoices\":\"My Invoices\",\"chgAcademicyears\":\"Change Academic Year\",\"InvID\":\"Invoice ID\",\"pay\":\"Pay\",\"payVia\":\"Pay via\",\"totalAmount\":\"Total Amount\",\"pendingAmount\":\"Pending Amount\",\"addTemplate\":\"Add template\",\"templateAdded\":\"Template added successfully\",\"delTemplate\":\"Delete template\",\"templateNotExist\":\"Template not exist\",\"templateDeleted\":\"Template deleted successfully\",\"History\":\"History\",\"loadFromTemplate\":\"Load from template\",\"plzSelMessType\":\"Please select Message type first\",\"messQueued\":\"Message queued for sending successfully\",\"Load\":\"Load\",\"Category\":\"Category\",\"expCategory\":\"Expenses Categories\",\"addExpCat\":\"Add expenses category\",\"lstExpCat\":\"List expenses categories\",\"catDesc\":\"Category description\",\"editExpCat\":\"Edit expense group\",\"CategoryAdded\":\"Category added successfully\",\"CategoryUpdated\":\"Category updated successfully\",\"delExpenseCat\":\"Delete expenses category\",\"CategoryDeleted\":\"Category deleted successfully\",\"CategoryNotExist\":\"Category not exist\",\"feeCode\":\"Fee Code\",\"feeDescription\":\"Fee Description\",\"feeAmount\":\"Fee Amount\",\"feeSchedule\":\"Fee Schedule\",\"feeScheduleOneTime\":\"One Time ( Fixed date )\",\"feeScheduleAnnually\":\"Annually\",\"feeScheduleBiAnnually\":\"Bi-Annually\",\"feeScheduleTriAnnually\":\"Tri-Annually\",\"feeScheduleQuarterly\":\"Quarterly\",\"feeScheduleMonthly\":\"Monthly\",\"feeScheduleGenerateInvoice\":\"Generate invoices on the below dates\",\"feeScheduleFixedDate\":\"Fixed Date\",\"feeScheduleFirstDate\":\"First Date\",\"feeScheduleSecondDate\":\"Second Date\",\"feeScheduleThirdDate\":\"Third Date\",\"feeScheduleFourthDate\":\"Fourth Date\",\"feeScheduleFifthDate\":\"Fifth Date\",\"feeScheduleSixthDate\":\"Sixth Date\",\"feeScheduleSeventhDate\":\"Seventh Date\",\"feeScheduleEighthDate\":\"Eighth Date\",\"feeScheduleNinthDate\":\"Ninth Date\",\"feeScheduleTenthDate\":\"Tenth Date\",\"feeScheduleEleventhDate\":\"Eleventh Date\",\"feeScheduleTwelvethDate\":\"Twelveth Date\",\"feeTitle\":\"Fee Title\",\"allocatedTo\":\"Allocated to\",\"allStudents\":\"All students\",\"specStudents\":\"Specific students\",\"feeAllocDetails\":\"Fee Allocation details\",\"FeeGroups\":\"Fee Groups\",\"FeeGroup\":\"Fee Group\",\"addFeeGroup\":\"Add fee group\",\"listFeeGroups\":\"List fee groups\",\"noGroups\":\"No groups available\",\"groupTitle\":\"Group title\",\"groupDesc\":\"Group Description\",\"invPrefix\":\"Invoice Prefix\",\"editFeeGroup\":\"Edit fee group\",\"delFeeGroup\":\"Delete fee group\",\"feeGroupDeleted\":\"Fee group deleted successfully\",\"feeGroupNotExist\":\"Fee group not exist\",\"feeGroupAdded\":\"Fee group added successfully\",\"feeGroupUpdated\":\"Fee group updated successfully\",\"addInvoice\":\"Add invoice\",\"listInvoices\":\"List Invoices\",\"invDetails\":\"Invoice details\",\"invNewRow\":\"Add new invoice row\",\"noInvRows\":\"No invoice rows available\",\"payMethod\":\"Payment Method\",\"payDate\":\"Paid Date\",\"invDueDate\":\"Invoice is Due Date\",\"collInvoice\":\"Collect Invoice\",\"payRevert\":\"Revert\",\"collAmount\":\"Collection Amount\",\"collDate\":\"Collection Date\",\"mobileSettings\":\"Mobile application\",\"lookFeel\":\"Look & Feel\",\"Timezone\":\"Timezone\",\"googleID\":\"Google Analytics Tracking ID\",\"enabled\":\"Enabled\",\"disabled\":\"Disabled\",\"loginPageStyle\":\"Login Page Style\",\"righStyle\":\"Right Style\",\"centerStyle\":\"Center Style\",\"forgetPageStyle\":\"Forget password Page Style\",\"registerPageStyle\":\"Registeration Page Style\",\"authPageBG\":\"Authentication pages background Image\",\"authPageBGColor\":\"Authentication pages background color\",\"leftMnuSlimScroll\":\"Left Menu Slim Scrollbar\",\"upcomingToday\":\"Upcoming Today\",\"noDatesToday\":\"No dates today\",\"tapToTryAgain\":\"Tap to try again\",\"loadingError\":\"Loading Error\",\"loading\":\"Loading\",\"noEntry\":\"No Entry\",\"clickToPickDate\":\"Click To Pick Date\",\"pleaseWait\":\"Please Wait\",\"ok\":\"Ok\",\"cancel\":\"Cancel\",\"errorOccurred\":\"Error Occurred\",\"updatesSaved\":\"Updates Saved\",\"tryAgain\":\"Try Again\",\"downloading\":\"Downloading\",\"fileDownloaded\":\"File Downloaded\",\"accountants\":\"Accountants\",\"addAccountant\":\"Add Accountant\",\"editAccountant\":\"Edit Accountant\",\"delAccountant\":\"Delete Accountant\",\"accountantCreated\":\"Accountant created successfully\",\"accountantDelSucc\":\"Accountant deleted successfully\",\"noAccountant\":\"No Accountants\",\"accountantNotExist\":\"Accountant not exist\",\"listAccountant\":\"List Accountant\",\"accountantUpdated\":\"Accountant updated successfully\",\"expensesReports\":\"Expenses Reports\",\"stdAppliedOn\":\"Student applied the answer on\",\"stdNotApplied\":\"Student not applied the answer yet\",\"noDataAvailable\":\"No Data Available\",\"Homework\":\"Homework\",\"addHomework\":\"Add Homework\",\"editHomework\":\"Edit Homework\",\"lstHomework\":\"List Homeworks\",\"HomeworkTitle\":\"Homework Title\",\"SubmissionDate\":\"Submission Date\",\"EvaluationDate\":\"Evaluation Date\",\"View\":\"View\",\"noHomeworks\":\"No Homeworks available\",\"Attachment\":\"Attachment\",\"noFilesAv\":\"No Files available\",\"HomeworkDesc\":\"Homework Description\",\"applied\":\"Applied\",\"notApplied\":\"Not yet Applied\",\"delHomework\":\"Delete Homework\",\"HomeworkDeleted\":\"Homework deleted successfully\",\"HomeworknotExist\":\"Homework not exist\",\"HomeworkCreated\":\"homework created successfully\",\"HomeworkModified\":\"Homework modified successfully\",\"bioId\":\"Biometric ID\",\"visibleCMS\":\"Visible in CMS\",\"toggleCMS\":\"Toggle CMS Status\",\"update\":\"Update\",\"usrInformation\":\"User information\",\"is\":\"is\",\"Upload\":\"Upload\",\"fLibrary\":\"Files Library\",\"selDrop\":\"Click to select files or drop here\",\"loadMore\":\"Load More\",\"selUpload\":\"Select \\/ Upload\",\"dbExport\":\"DB Export\",\"bioItegration\":\"Biometric Integration\",\"Marsala\":\"Marsala\",\"Pink\":\"Pink\",\"Violet\":\"Violet\",\"Cyan\":\"Cyan\",\"exportDB\":\"Export\",\"importDB\":\"Import\",\"exportClick\":\"Click here to export Database\",\"importClick\":\"To import, Please use PHPMyAdmin to ensure maximum data consistency.\",\"attNNotif\":\"Attenndance for student\",\"yrAttIs\":\"Your attendance is\",\"newExamNotif\":\"New exam schedule added\",\"allowedVars\":\"Allowed to use variables\",\"feeAllocWhenFrst\":\"When the first invoices generates ?\",\"Now\":\"Now\",\"arFeeTypeDates\":\"At the fee type dates\",\"discoutedAmount\":\"Discounted Amount\",\"FeeDiscount\":\"Fee Discount\",\"delFeeDiscount\":\"Delete Fee discount\",\"FeeDiscountDeleted\":\"Fee discount Deleted\",\"FeeDiscountNotExist\":\"Fee discount not exist\",\"addFeeDiscount\":\"Add fee discount\",\"FeeDiscountAdded\":\"Fee discount added successfully\",\"editFeeDiscount\":\"Edit fee discount\",\"feeDiscountMod\":\"Fee discount modified successfully\",\"discTypVal\":\"Type\\/Value\",\"assignUser\":\"Assign to users\",\"discTitle\":\"List fee discount\",\"discCode\":\"Discount Code\",\"discDesc\":\"Discount Description\",\"discType\":\"Discount Type\",\"percent\":\"Percentage\",\"fixed\":\"Fixed Value\",\"codeStatus\":\"Code Status\",\"discAssign\":\"Discount Assignments\",\"addDiscAssign\":\"Add discount assignment\",\"type\":\"Type\",\"Information\":\"Information\",\"noDiscAssignAv\":\"No discount assignments available\",\"applyTo\":\"Apply to\",\"selInvoices\":\"Select Invoice\",\"typeInvSearch\":\"Type invoice title, ID, description\",\"typeStdSearch\":\"Type student name \\/ username\",\"Discount\":\"Discount\",\"Incomes\":\"Incomes\",\"incomeTitle\":\"Income Title\",\"incomeAmount\":\"Income Amount\",\"addIncome\":\"Add Income\",\"editIncome\":\"Edit Income\",\"incomeCategory\":\"Incomes Categories\",\"addIncCat\":\"Add income category\",\"editIncCat\":\"Edit income category\",\"lstIncCat\":\"List income categories\",\"delIncCat\":\"Delete income category\",\"incCatDeleted\":\"Income category deleted\",\"incCatNotexist\":\"Income category not exist\",\"Payroll\":\"Payroll\",\"makePayment\":\"Make Payment\",\"userSalary\":\"Users Salary\",\"salaryBase\":\"Salary Base\",\"hourSalary\":\"Hourly Base\",\"makeUsrPayment\":\"Make user payment\",\"salaryProfExist\":\"Salary profile exist\",\"usrNoSalary\":\"User has no salary profile defined\",\"paymentMadeSuccess\":\"User payment made successfully\",\"salaryDetails\":\"Salary Details\",\"salaryForDate\":\"Salary For date\",\"method\":\"Method\",\"netSalary\":\"Net Salary\",\"grossSalary\":\"Gross Salary\",\"overtime\":\"Overtime\",\"overtimeHours\":\"Overtime Hours\",\"rate\":\"Rate\",\"summary\":\"Summary\",\"hours\":\"Hours\",\"addSalaryBase\":\"Add Salary Base\",\"lstSalaryBase\":\"List Salary Base\",\"baseTitle\":\"Base Title\",\"hourRate\":\"Hour Rate\",\"basicSalary\":\"Basic Salary\",\"overtimeSalary\":\"Hourly overtime cost\",\"allowences\":\"Allowences\",\"addRow\":\"Add new row\",\"slryBsCreated\":\"Salary Base created\",\"editSalaryBase\":\"Edit Salary Base\",\"slryBsMod\":\"Salary base modified\",\"delBase\":\"Delete Base\",\"salaryBaseDeleted\":\"Salary base deleted\",\"salaryBaseNotExist\":\"Salary base not exist\",\"editUsrSalary\":\"Edit User Salary\",\"usrSalaryModf\":\"User Salary modified\",\"usrBaseSelec\":\"User\'s Base Salary Selection\",\"usrSelect\":\"Select User to set base\",\"slryType\":\"Salary Type\",\"monthly\":\"Monthly\",\"hourly\":\"Hourly\",\"slryMakePay\":\"Make salary payment\",\"slryPayHistory\":\"Payment History\",\"Cash\":\"Cash\",\"Cheque\":\"Cheque\",\"bnkTrn\":\"Bank transfer\",\"frontendCMS\":\"frontend CMS\",\"ctrlPages\":\"Control Pages\",\"CMSSettings\":\"frontend CMS Settings\",\"socialLinks\":\"Social Links\",\"enableCMS\":\"Enable CMS\",\"defTheme\":\"Default Theme\",\"cmsActineTemp\":\"CMS Active Template\",\"leftCopyrights\":\"Left Copyrights\",\"rightCopyrights\":\"Right Copyrights\",\"frontendCMSpages\":\"frontend CMS pages\",\"permalink\":\"Permalink\",\"Visibility\":\"Visibility\",\"change\":\"Change\",\"sliderImages\":\"Slider Images\",\"imageTitle\":\"Image Title\",\"imageDescription\":\"Image Description\",\"selSlidImg\":\"Select\\/Channge Slider Images\",\"pageProp\":\"Page Properties\",\"Public\":\"Public\",\"loggedUsers\":\"Logged In Users Only\",\"navbarVisibility\":\"Navbar Visibility\",\"Visible\":\"Visible\",\"Invisible\":\"Invisible\",\"Publish\":\"Publish\",\"specificDate\":\"Specific Date\",\"Template\":\"Template\",\"saveDraft\":\"Save as draft\",\"previewPage\":\"Preview page\",\"publishPage\":\"Publish Page\",\"featImage\":\"Featured Image\",\"selFeatImage\":\"Select\\/Change Featured Image\",\"permalinkCantUsed\":\"Permalink cannot used, It\'s already used or reserved\",\"permalinkValid\":\"Permalink is valid\",\"fillField\":\"Please fill in all required fields\",\"validateMail\":\"Please validate you e-mail address\",\"messSent\":\"You message sent to the administrator and we\'ll get in touch soon.\",\"userPosition\":\"User Position\",\"toggleStatus\":\"Toggle Account Status\",\"accStatusChged\":\"Account State changed successfully\",\"accStatusCantYourself\":\"You cannot change yourself status\",\"materialNotif\":\"New study material added\",\"payrollReports\":\"Payroll Payments\",\"incomeReports\":\"Income Payments\",\"bioUsers\":\"Biometric Users\",\"homeworkNotif\":\"New homework assigned to you\",\"signUp\":\"Sign Up\",\"cntctForm\":\"Contact Form\",\"firstName\":\"First Name\",\"lastName\":\"Last Name\",\"mailSubject\":\"E-mail Subject\",\"mailMessage\":\"E-mail Message\",\"cmsSendMessage\":\"Send Message\",\"logToMgmtSys\":\"Login to management system from here\",\"readDetails\":\"Continue reading\",\"prev\":\"Previous\",\"Immediately\":\"Immediately\",\"listFeeDiscount\":\"List fee discount\",\"roles\":\"Permission Roles\",\"add_role\":\"Add Role\",\"role_added\":\"Role added successfully\",\"modify_role\":\"Modify Role\",\"role_modified\":\"Role modified successfully\",\"delete_role\":\"Delete Role\",\"role_deleted\":\"Role deleted successfully\",\"role_notexist\":\"Role not exist\",\"role_title\":\"Role Title\",\"role_desc\":\"Role Description\",\"role_perm\":\"Roles Permissions\",\"role_default\":\"Default Permission for\",\"delIncome\":\"Delete Income\",\"incAdded\":\"Income added successully\",\"incModified\":\"Income modified successully\",\"incDeleted\":\"Income deleted successfully\",\"incNotExist\":\"Income not exist\",\"delUsrPayment\":\"Delate user payment\",\"usrPayDeleted\":\"User payment deleted\",\"usrPayNotExist\":\"User payment not exist\",\"stats\":\"Statistics\",\"list\":\"List\",\"wel_office_cat\":\"Office Categories\",\"add_cat\":\"Add Category\",\"cat_added\":\"Category added\",\"edit_cat\":\"Edit Category\",\"cat_modified\":\"Category Modified\",\"del_cat\":\"Delete Category\",\"cat_deleted\":\"Category deleted\",\"cat_not_exist\":\"Category not exist\",\"wel_office\":\"Welcome Office\",\"vis_purp\":\"Visit Purpose\",\"pho_purp\":\"Phone Purpose\",\"av_for\":\"Available for\",\"typeUsrSearch\":\"Type user name \\/ username\",\"visitors\":\"Visitors\",\"add_vis\":\"Add Visitor\",\"vis_added\":\"Visitor Added\",\"edit_vis\":\"Edit Visitor\",\"vis_mod\":\"Visitor Modified\",\"del_vis\":\"Delete visitor\",\"vis_deleted\":\"Visitor Deleted\",\"vis_not_exist\":\"Visitor Not Exist\",\"pass_id\":\"Pass ID\",\"id_pass\":\"ID\\/Passport #\",\"no_pers\":\"# of persons\",\"company\":\"Company\",\"usr_typ\":\"User Type\",\"comp_name\":\"Company Name\",\"to_meet\":\"To Meet\",\"purpose\":\"Purpose\",\"chkin\":\"Check In\",\"chkout\":\"Check Out\",\"docs\":\"Documents\",\"list_vis\":\"List Visitors\",\"visitor\":\"Visitor\",\"viewFile\":\"View current file\",\"orUpNew\":\"Or upload new\",\"phn_calls\":\"Phone Calls\",\"list_calls\":\"List phone calls\",\"add_call\":\"Add phone call\",\"call_add\":\"Call added successfully\",\"edit_call\":\"Edit Call\",\"call_edit\":\"Call modified successfully\",\"del_call\":\"Delete Call\",\"call_del\":\"Call removed successfully\",\"call_not_exst\":\"Call not exist\",\"incoming\":\"Incoming\",\"outgoing\":\"Outgoing\",\"nxt_fup\":\"Next Follow up\",\"call_dur\":\"Call duration\",\"call_det\":\"Call details\",\"call_type\":\"Call Type\",\"postal\":\"Postal\",\"list_postal\":\"List postal\",\"add_postal\":\"Add postal\",\"postal_added\":\"Postal added\",\"edit_postal\":\"Edit postal\",\"postal_edit\":\"Postal modified successfully\",\"del_postal\":\"Delete Postal\",\"postal_del\":\"Postal deleted successfully\",\"postal_not_exist\":\"Postal not exist\",\"dispatch\":\"Dispatch\",\"recieve\":\"Recieve\",\"refno\":\"Reference Number\",\"con_mess\":\"Contact Messages\",\"list_mess\":\"List visitor messages\",\"del_mess\":\"Delete Message\",\"mess_del\":\"Message deleted\",\"mess_not_exist\":\"Message not exist\",\"mail_subj\":\"Mail Subject\",\"trans_vehicles\":\"Transport vehicles\",\"list_vehicles\":\"List Vehicles\",\"add_vehicle\":\"Add Vehicle\",\"vehicle_add\":\"Vehicle added successfully\",\"edit_vehicle\":\"Edit Vehicle\",\"vehicle_edit\":\"Vehicle modified successfully\",\"del_vehicle\":\"Delete vehicle\",\"vehicle_del\":\"Vehicle deleted\",\"vehicle_not_exist\":\"Vehicle not exist\",\"plate_numb\":\"Plate Number\",\"vehicle_color\":\"Vehicle Color\",\"vehicle_model\":\"Vehicle Model\",\"driver_name\":\"Driver Name\",\"driver_photo\":\"Driver Photo\",\"driver_license\":\"Driver License\",\"transportRoutes\":\"Transport Routes\",\"members\":\"Members\",\"managerPhoto\":\"Manager Photo\",\"managerContact\":\"Manager Contact\",\"employees\":\"Employees\",\"addEmployee\":\"Add Employee\",\"editEmployee\":\"Edit Employee\",\"listEmployee\":\"List Employee\",\"noEmployee\":\"No Accountants\",\"delEmployee\":\"Delete Employee\",\"employeeNotExist\":\"Employee not exist\",\"employeeDelSucc\":\"Employee deleted successfully\",\"employeeCreated\":\"Employee created successfully\",\"employeeUpdated\":\"Employee updated successfully\",\"depart\":\"Departments\",\"list_depart\":\"List Departments\",\"add_depart\":\"Add Departmnet\",\"depart_add\":\"Department added successfully\",\"edit_depart\":\"Edit Department\",\"depart_edit\":\"Department modified successfully\",\"del_depart\":\"Delete department\",\"depart_del\":\"Department deleted\",\"depart_not_exist\":\"Department not exist\",\"depart_title\":\"Department Title\",\"depart_desc\":\"Department description\",\"desig\":\"Designations\",\"list_desig\":\"List Designations\",\"add_desig\":\"Add Designations\",\"desig_add\":\"Designations added successfully\",\"edit_desig\":\"Edit Designations\",\"desig_edit\":\"Designations modified successfully\",\"del_desig\":\"Delete designation\",\"desig_del\":\"Designation deleted successfully\",\"desig_not_exist\":\"Designation not exist\",\"desig_title\":\"Designation title\",\"desig_desc\":\"Designation description\",\"takeAttendance\":\"Take Attendance\",\"attReport\":\"Attendance Report\",\"reportClassif\":\"Report classification\",\"percentage\":\"Percentage\",\"enquiries\":\"Enquiries\",\"list_enq\":\"List Enquiries\",\"add_enq\":\"Add Enquiry\",\"enq_add\":\"Enquiry added successfully\",\"edit_enq\":\"Edit Enquiry\",\"enq_edit\":\"Enquiry modified successfully\",\"del_enq\":\"Delete Enquiry\",\"enq_del\":\"Enquiry deleted successfully\",\"enq_not_exist\":\"Enquiry not exist\",\"enq_title\":\"Enquiry Title\",\"enq_desc\":\"Enquiry Description\",\"enq_type\":\"Enquiry Type\",\"enq_source\":\"Enquiry Source\",\"complaints\":\"Complaints\",\"list_complaint\":\"List Complaints\",\"add_complaint\":\"Add Complaint\",\"complaint_add\":\"Complaint added successfully\",\"edit_complaint\":\"Edit Complaint\",\"complaint_edit\":\"Complaint modified successfully\",\"del_complaint\":\"Delete Complaint\",\"complaint_del\":\"Complaint deleted successfully\",\"complaint_not_exist\":\"Complaint not exist\",\"complaint_title\":\"Complaint Title\",\"comp_desc\":\"Complaint Description\",\"comp_type\":\"Complaint Type\",\"comp_source\":\"Complaint Source\",\"inv_cat\":\"Inventory Categories\",\"list_inv_cat\":\"List inventory categories\",\"inventory\":\"Inventory\",\"suppliers\":\"Suppliers\",\"list_supp\":\"List Suppliers\",\"add_supp\":\"Add Supplier\",\"supp_add\":\"Supplier added successfully\",\"edit_supp\":\"Edit Supplier\",\"supp_edit\":\"Supplier modified successfully\",\"del_supp\":\"Delete Supplier\",\"supp_del\":\"Supplier removed successfully\",\"supp_not_exist\":\"Supplier not exist\",\"supp_name\":\"Supplier name\",\"supp_phone\":\"Supplier Phone\",\"supp_mail\":\"Supplier E-mail\",\"supp_address\":\"Supplier Address\",\"cont_per_name\":\"Contact Person Name\",\"cont_per_phone\":\"Contact Person Phone\",\"cont_per_mail\":\"Contact Person E-mail\",\"conPerson\":\"Contact Person\",\"stores\":\"Stores\",\"list_stores\":\"List stores\",\"add_store\":\"Add store\",\"store_add\":\"Store added successfully\",\"edit_store\":\"Edit store\",\"store_edit\":\"Store modified successfully\",\"del_store\":\"Delete store\",\"store_del\":\"Store deleted successfully\",\"store_not_exist\":\"Store not exist\",\"store_title\":\"Store Title\",\"items_code\":\"Item Coding\",\"list_items\":\"List Items\",\"add_item\":\"Add item\",\"item_add\":\"Item added successfully\",\"edit_item\":\"Edit Item\",\"del_item\":\"Delete item\",\"item_del\":\"Item deleted successfully\",\"item_not_exist\":\"Item not exist\",\"item_title\":\"Item title\",\"item_code\":\"Item Code\",\"item_pn\":\"Item Part Number\",\"items_stock\":\"Items Stock\",\"item\":\"Item\",\"store\":\"Store\",\"supplier\":\"Supplier\",\"quantity\":\"Quantity\",\"iss_ret\":\"Issue\\/Return\",\"issue_item\":\"Issue Item\",\"item_issued\":\"Item issued successfully\",\"item_edit\":\"Item modified successfully\",\"ret_item\":\"Return Item\",\"issue_to\":\"Issue to\",\"issue_date\":\"Issue date\",\"ret_date\":\"Return Date\",\"avQty\":\"Available Quantity\",\"sureReturn\":\"Sure return this item ?\",\"QuestionsArch\":\"Questions Bank\",\"sharedQues\":\"Shared Question\",\"markForShared\":\"Mark this question as shared will make it usable with other techers to use it in anther exams\",\"addAnswer\":\"Add Answer\",\"plzAddTruAns\":\"Please add true answers\",\"quesAdded\":\"Question added successfully\",\"quesModif\":\"Question modified successfully\",\"delQues\":\"Delete question\",\"quesDeleted\":\"Question deleted successfully\",\"quesNotExist\":\"Question not exist\",\"editQuestion\":\"Edit question\",\"close\":\"Close\",\"issue_book\":\"Issue Book\",\"list_issues\":\"List book issues\",\"add_issue\":\"Create book issue\",\"issue_add\":\"Book issue added successfully\",\"edit_issue\":\"Edit book issue\",\"issue_edit\":\"Issue modified successfully\",\"del_issue\":\"Delete issue\",\"issue_del\":\"Issue deleted successfully\",\"issue_not_exist\":\"Issue not exist\",\"serial_no\":\"Serial Number\",\"issue_id\":\"Issue ID\",\"book_return\":\"Return Book\",\"bookPub\":\"Book Publisher\",\"bookISBN\":\"Book ISBN\",\"bookShelf\":\"Book Shelf\",\"subId\":\"Subscription ID\",\"mngSub\":\"Manage Subscription\",\"chgSub\":\"Change Subscription\",\"subChged\":\"Subscription changed successfully\",\"std_cat\":\"Student Categories\",\"list_std_cat\":\"List students categories\",\"admission\":\"Students Admission\",\"medGroup\":\"Blood Group\",\"bloodGroup\":\"Blood Group\",\"religion\":\"Religion\",\"admNumber\":\"Admission Number\",\"admDate\":\"Admission Date\",\"delFile\":\"Delete File\",\"fileDeleted\":\"File Deleted\",\"fileNotExist\":\"File not exist\",\"File\":\"File\",\"fatheName\":\"Father Name\",\"motherName\":\"Mother Name\",\"fatherMob\":\"Father Mobile\",\"motherMob\":\"Mother Mobile\",\"fatherJob\":\"Father Job\",\"motherJob\":\"Mother Job\",\"fatherNotes\":\"Father Notes\",\"motherNotes\":\"Mother Notes\",\"guardAcc\":\"Guardian accounts\",\"linkGuard\":\"Link Guardians\",\"Documents\":\"Documents\",\"addDocRow\":\"Add another document row\",\"admissionInfo\":\"Admission information\",\"in\":\"In\",\"out\":\"Out\",\"appVacation\":\"Approve vacation\",\"myVacation\":\"My vacations\",\"reqVacation\":\"Request vacation\",\"vacStatChged\":\"Vacation status changed successfully\",\"vacNoBalance\":\"You Don\'t have enough balance for vacation\",\"waitAction\":\"Waiting Action\",\"notChckedIn\":\"Not checked in\",\"myAttendance\":\"My Attendance\",\"celebBirthday\":\"Celebrating birthday\",\"order\":\"Order\",\"randomizeQuestions\":\"Randomize questions\",\"latestNews\":\"Latest News\",\"readMore\":\"Read More\",\"Certificates\":\"Certificates\",\"list_cert\":\"List Certificated\",\"add_cert\":\"Add Certificate\",\"cert_add\":\"Certificate added successfully\",\"edit_cert\":\"Edit certificate\",\"cert_edit\":\"Certificated Modified successfully\",\"del_cert\":\"Delete Certificate\",\"cert_del\":\"Certificate deleted successfully\",\"cert_not_exist\":\"Certificate not exist\",\"cert_name\":\"Certificate Name\",\"head_left\":\"Header Left\",\"head_right\":\"Header Right\",\"head_mid\":\"Header Middle\",\"main_title\":\"Main title\",\"main_content\":\"Main Content\",\"foot_left\":\"Footer Left\",\"foot_right\":\"Footer Right\",\"foot_mid\":\"Footer Middle\",\"cert_img\":\"Certificate Image\",\"gen_cert\":\"Generate Certificate\",\"gpstracking\":\"GPS Tracking\"}', NULL);

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

--
-- Dumping data for table `mailsms`
--

INSERT INTO `mailsms` (`id`, `mailTo`, `mailType`, `messageData`, `messageDate`, `messageSender`) VALUES
(1, 'Leone Watsica III', 'sit', 'Voluptates alias soluta nesciunt ad in est.', '1563572938', 'Miss Mattie Christiansen Sr.'),
(2, 'Roderick Fahey', 'aut', 'Explicabo sint nemo provident vitae aut voluptatum rerum cupiditate et.', '1563572938', 'Dr. Melisa Sporer'),
(3, 'Prof. Khalil Rosenbaum', 'ea', 'Est minus beatae harum et.', '1563572938', 'Cecil Tremblay'),
(4, 'Reva Balistreri', 'id', 'Est ducimus quaerat rerum accusantium.', '1563572938', 'Terence Little'),
(5, 'Matt Corkery', 'iure', 'Cum tempora quo impedit quidem consectetur qui laborum.', '1563572938', 'Dr. Trace Doyle'),
(6, 'Lydia Bins', 'voluptates', 'A nihil nemo et et.', '1563572938', 'Mr. Haskell Pouros'),
(7, 'Dr. Mireille Dietrich', 'unde', 'Tenetur sequi molestiae cupiditate voluptates vero eaque.', '1563572938', 'Eleonore Wisoky'),
(8, 'Maurine Schulist', 'est', 'Eos inventore iusto esse consequuntur.', '1563572938', 'Dr. Meda Blanda DVM'),
(9, 'Lonzo Schoen', 'et', 'Optio perspiciatis quae corrupti quibusdam ut.', '1563572938', 'Miss Lenore Herzog'),
(10, 'Karli Wiegand Jr.', 'aut', 'Eum quia eius magnam quisquam nesciunt ab deserunt eius.', '1563572938', 'Prof. Simeon Stroman'),
(11, 'Lyda Lockman DVM', 'recusandae', 'Est neque repellat non quia.', '1563572938', 'Kevon Crooks'),
(12, 'Maci Romaguera I', 'quia', 'Doloribus debitis est eius molestiae qui.', '1563572939', 'Ayden Blick'),
(13, 'Dixie Strosin', 'soluta', 'Amet ex id dolor magnam facilis deserunt similique velit.', '1563572939', 'Lottie Marquardt'),
(14, 'Marquis Carter DDS', 'porro', 'Corrupti quos ipsa sint molestiae quidem.', '1563572939', 'Liza Bednar'),
(15, 'Prof. Isaac Koelpin IV', 'quia', 'Quos unde aliquid qui nesciunt veniam.', '1563572939', 'Keon Marks'),
(16, 'Barbara O\'Conner Sr.', 'enim', 'Molestiae et culpa qui enim aperiam aut et.', '1563572939', 'Lane Larkin PhD'),
(17, 'Dr. Golda Beahan', 'aut', 'Sit veritatis explicabo corrupti omnis eius consequatur rerum et ea.', '1563572939', 'Watson Pouros'),
(18, 'Destinee Zieme MD', 'voluptates', 'Ut velit omnis omnis facilis quis.', '1563572939', 'Margarita Boehm'),
(19, 'Dr. Emerson Sporer', 'ducimus', 'Autem in facilis atque.', '1563572939', 'Dr. Saul Stracke'),
(20, 'Heather Hermann', 'dolor', 'Eum sit modi ut assumenda repellendus autem.', '1563572939', 'Marcus Dickinson'),
(21, 'Lafayette Zboncak', 'modi', 'Autem qui exercitationem ut voluptates consequatur ea eos reiciendis minima nisi.', '1563572939', 'Breanna Wehner'),
(22, 'Vena Muller III', 'praesentium', 'Omnis tempore voluptas fuga.', '1563572939', 'Mr. Jefferey Zieme Sr.'),
(23, 'Jorge Jacobson', 'quis', 'Magnam sed voluptas et qui dolorem quia.', '1563572939', 'Hailee Tremblay'),
(24, 'Aurore Dietrich', 'consectetur', 'Modi laudantium ab velit explicabo voluptas temporibus quidem nam.', '1563572939', 'Xavier Kunze'),
(25, 'Tyra Cassin', 'quisquam', 'Deleniti rerum impedit nemo exercitationem eaque.', '1563572939', 'Titus Rau'),
(26, 'Antonio Dach', 'voluptas', 'Et facilis rerum numquam corporis.', '1563572939', 'Chaim Rowe'),
(27, 'Karen Breitenberg', 'dolorem', 'Ex impedit facilis velit provident eum corrupti sapiente nobis.', '1563572939', 'Mr. Wilson Leannon'),
(28, 'Jaeden Nikolaus PhD', 'voluptas', 'Tenetur nulla sapiente maiores similique exercitationem qui quasi nostrum.', '1563572939', 'Dr. Verona Lehner'),
(29, 'Mr. Hugh Kutch I', 'ex', 'Eveniet ut ducimus et ratione quia.', '1563572939', 'Shakira Hermiston'),
(30, 'Joaquin Kassulke', 'perspiciatis', 'Quaerat ratione eligendi nihil et odio autem.', '1563572939', 'Miss Dovie Upton V'),
(31, 'Yvonne Schumm MD', 'sed', 'Nostrum rerum perspiciatis ullam.', '1563572939', 'Leif Hauck'),
(32, 'Minerva Stroman', 'qui', 'Dolores architecto ea qui impedit aspernatur voluptas ipsa quas voluptatum sunt.', '1563572939', 'Mrs. Anastasia O\'Reilly I'),
(33, 'Jennyfer Crooks IV', 'autem', 'Vel occaecati quaerat qui.', '1563572939', 'Floy Hamill'),
(34, 'Gerard Reichel V', 'illum', 'Dolore vel quibusdam dolorem aut expedita est.', '1563572939', 'Marques Runolfsson'),
(35, 'Ivory Wyman', 'nobis', 'Dolore ut ex quo in odit eaque culpa aperiam.', '1563572939', 'Miss Maegan Moore'),
(36, 'Aurelia Hettinger', 'quidem', 'Iure sint accusamus qui temporibus dolorem tenetur qui placeat ratione.', '1563572939', 'Cody Prohaska III'),
(37, 'Dr. Erika Morar', 'dolore', 'Pariatur quasi earum esse id magni eveniet.', '1563572939', 'Markus Boehm'),
(38, 'Leopoldo Zulauf', 'quam', 'Molestiae nulla adipisci nemo qui maiores.', '1563572939', 'Sonya O\'Reilly'),
(39, 'Stella Schultz', 'culpa', 'Quae nihil dolores error maxime.', '1563572939', 'Jaylin Stiedemann'),
(40, 'Dr. Justice Hilpert I', 'voluptas', 'Laboriosam magni quia est voluptate fugiat assumenda quo et.', '1563572939', 'Dr. Evans Runte DDS'),
(41, 'Oceane Hill', 'qui', 'Placeat cum corrupti perspiciatis ut et impedit et.', '1563572939', 'Otha Rosenbaum'),
(42, 'Jairo Hansen', 'voluptatem', 'Ipsam accusantium quibusdam laudantium sit hic.', '1563572939', 'Amie Oberbrunner'),
(43, 'Murphy Konopelski', 'et', 'Officiis et labore sunt fuga enim.', '1563572939', 'Gwendolyn Waters'),
(44, 'Mazie Bruen', 'ex', 'Quo quia ut corrupti et.', '1563572939', 'Sabina Schinner IV'),
(45, 'Hayley Jacobson', 'libero', 'Iste accusamus nostrum sit ullam ea excepturi laudantium voluptatem.', '1563572939', 'Rosie Ankunding Sr.'),
(46, 'Kevin Cassin', 'aspernatur', 'Commodi et dignissimos magnam sit.', '1563572939', 'Dr. Nikolas Kuvalis III'),
(47, 'Orion Hermiston', 'aperiam', 'Inventore eius quia id et.', '1563572939', 'Burnice Turner'),
(48, 'Darius Altenwerth Sr.', 'reiciendis', 'Facilis aut eos aut voluptates.', '1563572939', 'Dr. Derek Kuhn I'),
(49, 'Mr. Nat Rice', 'quis', 'Voluptates consequuntur voluptate quibusdam.', '1563572939', 'Alexane Morar'),
(50, 'Prof. Brayan Schuppe', 'repellat', 'Totam laudantium est voluptatem enim et.', '1563572939', 'Grace Mante');

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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `messageId`, `userId`, `fromId`, `toId`, `messageText`, `dateSent`, `enable_reply`) VALUES
(1, 1, 164, 72, 144, 'Provident dolorem.', '1563572941', 1),
(2, 2, 95, 3, 68, 'Dolor pariatur at dolorum tempora.', '1563572941', 1),
(3, 3, 173, 55, 22, 'Voluptas ea consectetur.', '1563572942', 0),
(4, 4, 137, 9, 83, 'Ipsam commodi laboriosam.', '1563572942', 0),
(6, 6, 23, 36, 78, 'Voluptates velit ut quia.', '1563572942', 1),
(8, 8, 34, 14, 20, 'Alias.', '1563572942', 1),
(10, 10, 18, 55, 133, 'Tempora et eius et.', '1563572942', 0),
(12, 12, 5, 164, 150, 'Reiciendis asperiores labore.', '1563572942', 1),
(14, 14, 173, 44, 99, 'Reiciendis aspernatur.', '1563572942', 1),
(15, 15, 22, 58, 74, 'Perspiciatis qui ut.', '1563572942', 0),
(16, 16, 50, 176, 144, 'Ea ratione.', '1563572943', 1),
(17, 17, 3, 63, 57, 'Voluptatibus voluptatem sit dolores.', '1563572943', 1),
(18, 18, 51, 14, 103, 'Hic cupiditate occaecati.', '1563572943', 0),
(19, 19, 77, 14, 126, 'Tempore sed.', '1563572943', 1),
(20, 20, 28, 174, 8, 'Culpa nam.', '1563572943', 0),
(21, 21, 138, 37, 160, 'Adipisci.', '1563572943', 1),
(22, 22, 39, 60, 165, 'Aut et.', '1563572943', 0),
(23, 23, 18, 141, 132, 'Nam id laboriosam sed dolorem.', '1563572943', 0),
(24, 24, 127, 56, 90, 'Voluptates doloribus minus.', '1563572943', 1),
(25, 25, 77, 77, 143, 'Et quisquam.', '1563572943', 1),
(26, 26, 21, 44, 135, 'Minus officiis autem.', '1563572943', 1),
(27, 27, 21, 144, 130, 'Dolores ea asperiores.', '1563572943', 1),
(28, 28, 104, 59, 7, 'Officia voluptate illum sed.', '1563572943', 1),
(29, 29, 42, 70, 157, 'Reiciendis.', '1563572943', 1),
(30, 30, 55, 159, 36, 'Voluptatibus.', '1563572943', 0),
(33, 33, 34, 74, 1, 'At.', '1563572944', 1),
(36, 36, 11, 58, 147, 'Modi magnam exercitationem.', '1563572944', 0),
(37, 37, 32, 37, 151, 'Quidem debitis non.', '1563572944', 1),
(38, 38, 5, 132, 146, 'Sit id.', '1563572944', 1),
(39, 39, 135, 127, 25, 'Quis enim voluptatibus.', '1563572944', 1),
(42, 42, 157, 165, 160, 'Officia enim.', '1563572944', 1),
(43, 43, 51, 67, 165, 'Rem quo voluptatem a et.', '1563572944', 1),
(44, 44, 32, 162, 164, 'Aut eveniet.', '1563572944', 0),
(45, 45, 162, 127, 170, 'Fugit ex illo.', '1563572944', 0),
(46, 46, 29, 7, 159, 'Neque in.', '1563572944', 0),
(47, 47, 24, 153, 1, 'Id pariatur aut qui deleniti.', '1563572944', 1),
(50, 50, 13, 91, 126, 'Doloremque vel maxime cumque.', '1563572944', 0),
(51, 51, 130, 36, 150, 'Qui qui.', '1563572944', 1),
(52, 52, 82, 146, 133, 'Praesentium nam cum.', '1563572944', 1),
(53, 53, 135, 129, 36, 'Quos quas in exercitationem quo.', '1563572944', 1),
(54, 54, 1, 138, 24, 'Voluptatem sed dolores.', '1563572944', 0),
(57, 57, 85, 75, 75, 'Omnis aliquam eos.', '1563572944', 0),
(58, 58, 73, 31, 40, 'Repellendus fugit.', '1563572944', 0),
(59, 59, 171, 128, 174, 'Et aliquid.', '1563572944', 1),
(61, 61, 57, 140, 99, 'Aut voluptatem enim.', '1563572944', 0),
(63, 63, 162, 93, 50, 'Sit necessitatibus qui saepe.', '1563572945', 1),
(64, 64, 66, 165, 34, 'Commodi eveniet perferendis doloremque.', '1563572945', 1),
(65, 65, 73, 15, 40, 'Sed.', '1563572945', 0),
(66, 66, 93, 101, 102, 'Earum amet.', '1563572945', 1),
(70, 70, 55, 57, 81, 'Beatae veritatis debitis ab.', '1563572945', 0),
(71, 71, 153, 67, 67, 'A ut et.', '1563572945', 0),
(72, 72, 52, 56, 137, 'Tempore architecto.', '1563572945', 0),
(74, 74, 78, 42, 59, 'Est doloribus velit.', '1563572945', 0),
(75, 75, 30, 6, 158, 'Atque eveniet quae.', '1563572945', 0),
(76, 76, 89, 75, 176, 'Aut quo.', '1563572945', 0),
(77, 77, 140, 131, 154, 'Exercitationem consequatur ut qui.', '1563572945', 0),
(78, 78, 22, 19, 138, 'Unde vero quibusdam impedit.', '1563572945', 0),
(79, 79, 40, 57, 38, 'In provident et consequuntur iusto aut.', '1563572945', 0),
(81, 81, 168, 153, 11, 'Sed dolor sint id.', '1563572945', 0),
(83, 83, 46, 138, 143, 'Delectus vel ab fugiat.', '1563572945', 1),
(84, 84, 2, 6, 10, 'Et iure.', '1563572945', 1),
(87, 87, 157, 133, 41, 'Laboriosam labore sed inventore.', '1563572945', 0),
(88, 88, 86, 69, 136, 'Quia temporibus rerum.', '1563572945', 1),
(90, 90, 129, 141, 141, 'Voluptatum ut id consectetur.', '1563572945', 0),
(92, 92, 166, 164, 101, 'Id.', '1563572945', 1),
(95, 95, 146, 169, 29, 'Eveniet mollitia ullam eum.', '1563572946', 1),
(98, 98, 133, 81, 91, 'Corrupti tenetur natus dolorem molestias.', '1563572946', 0),
(99, 99, 132, 71, 134, 'Accusantium rerum.', '1563572946', 0),
(100, 100, 61, 62, 76, 'Delectus ullam harum maiores consequuntur.', '1563572946', 0),
(101, 101, 126, 150, 96, 'Adipisci praesentium ea.', '1563572946', 1),
(102, 102, 60, 167, 19, 'Modi dolores accusantium quia.', '1563572946', 0),
(103, 103, 128, 80, 27, 'Quia ratione eum.', '1563572946', 0),
(105, 105, 2, 139, 88, 'Rem.', '1563572946', 0),
(106, 106, 25, 153, 74, 'Dolorum vel.', '1563572946', 0),
(107, 107, 5, 35, 3, 'Iure praesentium facere.', '1563572946', 0),
(109, 109, 10, 84, 41, 'Molestias dolor.', '1563572946', 1),
(111, 111, 59, 58, 143, 'Corrupti corrupti qui velit dolorem velit.', '1563572946', 1),
(112, 112, 95, 67, 157, 'Dolores illum ut officiis.', '1563572946', 0),
(113, 113, 102, 6, 137, 'Eaque ipsum.', '1563572946', 1),
(114, 114, 11, 91, 37, 'Dolores enim facere porro.', '1563572946', 1),
(115, 115, 127, 23, 43, 'Ducimus.', '1563572946', 0),
(116, 116, 147, 127, 20, 'Mollitia rerum.', '1563572946', 1),
(117, 117, 149, 152, 41, 'Repudiandae consectetur voluptatem voluptatem.', '1563572946', 1),
(119, 119, 2, 16, 84, 'In quo quis.', '1563572946', 0),
(120, 120, 77, 150, 62, 'Et nostrum maiores quo sapiente.', '1563572946', 1),
(123, 123, 85, 44, 87, 'Non harum molestiae beatae.', '1563572946', 0),
(124, 124, 9, 65, 139, 'Adipisci non ut cum iusto.', '1563572946', 1),
(125, 125, 166, 35, 22, 'Perspiciatis sed.', '1563572946', 0),
(129, 129, 93, 131, 132, 'Hic ut.', '1563572946', 0),
(130, 130, 61, 96, 94, 'Aut qui eos ab eos.', '1563572946', 0),
(131, 131, 143, 1, 88, 'Occaecati modi.', '1563572946', 0),
(134, 134, 167, 11, 7, 'Cupiditate quam sunt sed.', '1563572946', 0),
(136, 136, 10, 157, 170, 'Consectetur harum porro dolores.', '1563572946', 1),
(140, 140, 84, 139, 15, 'Non inventore repellat tempore.', '1563572947', 0),
(141, 141, 95, 15, 29, 'Aspernatur et.', '1563572947', 1),
(143, 143, 95, 174, 157, 'Impedit eveniet esse.', '1563572947', 1),
(145, 145, 162, 146, 78, 'Porro vero excepturi.', '1563572947', 0),
(146, 146, 35, 21, 101, 'Quos dolor cupiditate unde officiis assumenda.', '1563572947', 1),
(148, 148, 157, 171, 21, 'Facere.', '1563572947', 0),
(149, 149, 158, 6, 53, 'Necessitatibus voluptatem est.', '1563572947', 0),
(153, 153, 23, 40, 87, 'Autem.', '1563572947', 1),
(154, 154, 32, 147, 21, 'Hic beatae sed illo.', '1563572947', 0),
(155, 155, 75, 6, 95, 'Quia possimus.', '1563572947', 1),
(157, 157, 149, 91, 130, 'Sit necessitatibus.', '1563572947', 1),
(159, 159, 5, 78, 86, 'Sint.', '1563572947', 0),
(160, 160, 72, 147, 63, 'Exercitationem reprehenderit nihil iusto sed.', '1563572947', 0),
(162, 162, 79, 22, 134, 'Eum voluptas quidem.', '1563572947', 1),
(164, 164, 55, 95, 80, 'Non aut qui.', '1563572947', 1),
(165, 165, 99, 85, 66, 'Sit autem dignissimos qui.', '1563572947', 1),
(166, 166, 28, 85, 168, 'Rerum rem sed et et.', '1563572947', 0),
(168, 168, 71, 5, 19, 'Culpa quia iste repudiandae vel magni.', '1563572947', 1),
(170, 170, 35, 80, 162, 'Nulla dolore quia rem.', '1563572947', 1),
(171, 171, 162, 99, 163, 'Minima.', '1563572947', 1),
(172, 172, 94, 71, 47, 'Eius.', '1563572947', 1),
(173, 173, 131, 130, 39, 'Iure voluptas alias earum.', '1563572948', 0),
(176, 176, 176, 174, 126, 'Voluptatem.', '1563572948', 0),
(179, 179, 170, 51, 60, 'Perferendis consequatur quia.', '1563572948', 0),
(180, 180, 98, 32, 39, 'Nobis quisquam.', '1563572948', 0),
(181, 181, 148, 46, 131, 'Labore optio fugit corporis ut.', '1563572948', 0),
(182, 182, 14, 46, 4, 'Et tempora.', '1563572948', 1),
(183, 183, 127, 52, 96, 'Ex excepturi.', '1563572948', 1),
(184, 184, 172, 58, 40, 'Cumque maxime voluptatem.', '1563572948', 1),
(186, 186, 75, 41, 53, 'Perspiciatis distinctio.', '1563572948', 1),
(187, 187, 163, 155, 167, 'Explicabo sunt velit.', '1563572948', 0),
(189, 189, 50, 175, 170, 'Praesentium non consectetur.', '1563572948', 0),
(190, 190, 149, 161, 150, 'Qui minima sit aut.', '1563572948', 0),
(191, 191, 134, 81, 80, 'Et rem dolores.', '1563572948', 1),
(192, 192, 90, 48, 169, 'Ut aliquam.', '1563572948', 0),
(193, 193, 17, 93, 77, 'Nulla quam odit velit.', '1563572948', 1),
(195, 195, 145, 89, 55, 'Reprehenderit culpa repellat aut.', '1563572948', 0),
(197, 197, 53, 4, 161, 'Occaecati commodi qui.', '1563572948', 1),
(199, 199, 41, 28, 49, 'Repellendus.', '1563572949', 0),
(200, 200, 75, 135, 135, 'Molestiae eum sapiente.', '1563572949', 1),
(201, 201, 148, 132, 76, 'Tempora nihil.', '1563572949', 0),
(202, 202, 33, 51, 151, 'Repudiandae provident.', '1563572949', 1),
(204, 204, 37, 18, 97, 'Molestias nostrum fugiat.', '1563572949', 0),
(208, 208, 160, 49, 100, 'Consequuntur hic placeat.', '1563572949', 0),
(209, 209, 91, 126, 169, 'Incidunt ducimus autem laudantium.', '1563572949', 1),
(210, 210, 153, 65, 127, 'Qui facilis dolorem.', '1563572949', 0),
(212, 212, 80, 70, 135, 'Est quia.', '1563572949', 1),
(213, 213, 2, 56, 103, 'Velit vel voluptates temporibus doloremque.', '1563572949', 1),
(214, 214, 128, 143, 89, 'Ex at autem ratione officiis.', '1563572950', 0),
(216, 216, 71, 34, 100, 'Non dolorem nisi.', '1563572950', 0),
(217, 217, 55, 5, 2, 'Eius.', '1563572950', 0),
(218, 218, 135, 32, 29, 'Nobis consequuntur sint.', '1563572950', 1),
(219, 219, 20, 92, 162, 'Quaerat nihil ut aut.', '1563572950', 0),
(221, 221, 43, 162, 104, 'Eius in quisquam.', '1563572950', 0),
(224, 224, 58, 6, 71, 'Incidunt veritatis.', '1563572950', 1),
(225, 225, 54, 157, 16, 'Qui vel.', '1563572950', 0),
(226, 226, 159, 87, 90, 'Debitis nesciunt.', '1563572950', 1),
(227, 227, 31, 146, 75, 'Est sit enim.', '1563572950', 1),
(228, 228, 6, 1, 18, 'Et minima voluptates iste voluptate.', '1563572950', 1),
(229, 229, 59, 75, 152, 'Quia commodi laboriosam.', '1563572950', 1),
(230, 230, 79, 136, 97, 'Sit error ipsum voluptates officiis.', '1563572950', 1),
(232, 232, 65, 152, 131, 'Autem non rerum dicta id nam.', '1563572950', 0),
(233, 233, 43, 148, 21, 'Doloribus laudantium.', '1563572950', 1),
(234, 234, 4, 37, 92, 'Praesentium consectetur sit.', '1563572950', 0),
(235, 235, 79, 53, 56, 'Veritatis similique quis.', '1563572950', 0),
(236, 236, 41, 71, 87, 'Labore ab.', '1563572950', 0),
(238, 238, 48, 73, 64, 'Quis.', '1563572950', 1),
(239, 239, 1, 134, 74, 'Aliquid eaque ad sequi voluptas.', '1563572950', 1),
(241, 241, 166, 132, 55, 'Eum.', '1563572950', 0),
(242, 242, 60, 176, 155, 'Saepe eligendi eaque.', '1563572950', 1),
(243, 243, 139, 48, 17, 'Ipsam sequi voluptatum.', '1563572950', 1),
(244, 244, 5, 135, 25, 'Hic molestias numquam.', '1563572950', 0),
(245, 245, 55, 31, 142, 'Omnis alias odit maiores nisi necessitatibus.', '1563572950', 0),
(246, 246, 90, 14, 52, 'Illo non.', '1563572950', 1),
(248, 248, 140, 153, 99, 'Illo quasi odio rerum provident ducimus.', '1563572950', 1),
(249, 249, 153, 136, 51, 'Aliquid perspiciatis ea.', '1563572950', 1),
(250, 250, 159, 142, 84, 'Nostrum eos.', '1563572950', 0),
(253, 253, 95, 31, 66, 'Quae voluptatem nobis.', '1563572950', 0),
(257, 257, 101, 136, 75, 'Eos consequuntur.', '1563572950', 0),
(258, 258, 142, 56, 8, 'Est.', '1563572950', 0),
(259, 259, 162, 38, 128, 'Quibusdam et nobis.', '1563572950', 0),
(260, 260, 161, 7, 56, 'Cupiditate repudiandae.', '1563572950', 0),
(261, 261, 9, 53, 72, 'Adipisci unde harum.', '1563572950', 0),
(263, 263, 44, 90, 130, 'Laudantium modi magnam.', '1563572950', 1),
(264, 264, 132, 34, 33, 'Aspernatur ratione id explicabo.', '1563572950', 1),
(265, 265, 76, 70, 25, 'Pariatur omnis quia.', '1563572950', 1),
(266, 266, 31, 8, 136, 'Dolor ducimus nesciunt sit beatae in.', '1563572950', 1),
(267, 267, 101, 17, 70, 'Nemo omnis nemo sint tempore officia.', '1563572950', 1),
(268, 268, 74, 45, 51, 'Ullam consequatur ullam modi beatae.', '1563572950', 0),
(269, 269, 32, 137, 64, 'Veniam quasi.', '1563572950', 0),
(270, 270, 22, 24, 148, 'At voluptatem.', '1563572950', 0),
(272, 272, 100, 57, 80, 'Sit.', '1563572950', 0),
(273, 273, 147, 98, 45, 'Ea reprehenderit qui.', '1563572950', 1),
(275, 275, 156, 8, 28, 'Nostrum.', '1563572950', 0),
(276, 276, 18, 31, 5, 'Modi qui voluptas.', '1563572950', 0),
(277, 277, 131, 25, 159, 'Aut est.', '1563572950', 0),
(278, 278, 4, 15, 29, 'Voluptatem voluptas autem provident distinctio.', '1563572950', 1),
(280, 280, 169, 38, 3, 'Consequuntur magni eveniet.', '1563572950', 0),
(281, 281, 17, 93, 25, 'Rerum necessitatibus nihil.', '1563572950', 1),
(282, 282, 163, 100, 162, 'Cumque sequi.', '1563572950', 1),
(283, 283, 99, 64, 158, 'Fugit eligendi sed ut distinctio.', '1563572950', 1),
(285, 285, 137, 18, 153, 'Reiciendis beatae illum omnis fugiat.', '1563572950', 0),
(286, 286, 11, 140, 139, 'Officia praesentium.', '1563572950', 0),
(288, 288, 79, 75, 14, 'Alias nobis ipsum.', '1563572950', 0),
(290, 290, 99, 34, 151, 'Doloribus quasi.', '1563572950', 1),
(291, 291, 14, 87, 47, 'Ducimus pariatur saepe nulla.', '1563572950', 0),
(292, 292, 159, 46, 47, 'Tempora quo et.', '1563572950', 0),
(293, 293, 164, 78, 60, 'Labore dolores non fuga.', '1563572950', 0),
(294, 294, 176, 138, 97, 'Tempora dolor.', '1563572950', 0),
(295, 295, 153, 43, 36, 'Expedita alias expedita.', '1563572950', 0),
(296, 296, 22, 42, 13, 'At non dicta.', '1563572950', 1),
(298, 298, 133, 65, 11, 'Quaerat repellendus.', '1563572950', 1),
(299, 299, 4, 13, 60, 'Voluptate ut debitis.', '1563572950', 0),
(300, 300, 154, 86, 138, 'Quam consequatur et.', '1563572951', 0),
(301, 301, 171, 18, 66, 'Qui sit quis error adipisci.', '1563572951', 0),
(302, 302, 96, 126, 45, 'Et.', '1563572951', 0),
(303, 303, 75, 130, 168, 'Voluptatem.', '1563572951', 0),
(306, 306, 163, 47, 176, 'Beatae assumenda et.', '1563572951', 0),
(313, 313, 35, 40, 129, 'Voluptates enim ipsam.', '1563572951', 1),
(315, 315, 30, 89, 76, 'Doloremque et numquam.', '1563572951', 1),
(316, 316, 142, 53, 81, 'Provident ipsam quod.', '1563572951', 0),
(317, 317, 38, 132, 171, 'Aspernatur consequatur explicabo velit inventore.', '1563572951', 0),
(321, 321, 72, 175, 58, 'Ab velit at voluptates.', '1563572951', 0),
(323, 323, 132, 55, 165, 'Ut quasi.', '1563572951', 1),
(324, 324, 1, 139, 104, 'Dolorem ut.', '1563572951', 0),
(325, 325, 1, 8, 136, 'Dicta ut.', '1563572951', 0),
(327, 327, 104, 59, 36, 'Omnis reprehenderit voluptatem architecto.', '1563572951', 1),
(328, 328, 56, 166, 82, 'Doloribus nam voluptatem.', '1563572951', 0),
(329, 329, 81, 49, 46, 'Laudantium.', '1563572951', 1),
(331, 331, 157, 39, 132, 'Nostrum nisi est.', '1563572951', 1),
(333, 333, 169, 141, 22, 'Est accusantium vitae dolor consequatur.', '1563572951', 1),
(334, 334, 97, 159, 102, 'Commodi.', '1563572951', 1),
(336, 336, 8, 2, 161, 'Corporis sit.', '1563572951', 1),
(337, 337, 136, 168, 74, 'Sit sint autem voluptatibus.', '1563572951', 1),
(339, 339, 23, 58, 42, 'Maiores ad.', '1563572951', 1),
(340, 340, 87, 8, 135, 'Cupiditate quae.', '1563572951', 0),
(341, 341, 100, 25, 86, 'In et.', '1563572951', 0),
(342, 342, 30, 167, 82, 'Dignissimos mollitia dolorum velit.', '1563572951', 1),
(343, 343, 46, 152, 58, 'Sed asperiores eos.', '1563572951', 0),
(344, 344, 98, 170, 60, 'Quo repudiandae quae.', '1563572951', 0),
(345, 345, 166, 144, 72, 'Omnis eos molestiae.', '1563572951', 0),
(346, 346, 99, 69, 95, 'Vel.', '1563572951', 0),
(347, 347, 32, 10, 15, 'Dolores velit dolor quia.', '1563572951', 0),
(349, 349, 52, 58, 74, 'Sit doloremque voluptatem quidem.', '1563572951', 0),
(350, 350, 145, 154, 50, 'Modi ut.', '1563572951', 0),
(352, 352, 148, 140, 173, 'Velit ut.', '1563572952', 1),
(353, 353, 69, 43, 161, 'Ad.', '1563572952', 1),
(354, 354, 23, 9, 63, 'Officia deleniti nobis.', '1563572952', 1),
(355, 355, 38, 66, 5, 'Consequatur hic consequuntur.', '1563572952', 0),
(356, 356, 166, 19, 41, 'Voluptates consequatur officia.', '1563572952', 0),
(362, 362, 56, 155, 47, 'Dolor ut a autem ea.', '1563572952', 1),
(365, 365, 33, 79, 90, 'Placeat consectetur animi.', '1563572952', 1),
(366, 366, 67, 70, 18, 'Repellat voluptatem vel.', '1563572952', 1),
(367, 367, 167, 22, 166, 'Dolorem earum dolore et asperiores.', '1563572952', 0),
(368, 368, 37, 32, 134, 'Mollitia minus voluptate perspiciatis.', '1563572952', 1),
(369, 369, 50, 134, 53, 'Numquam commodi.', '1563572952', 1),
(370, 370, 89, 130, 40, 'Enim magnam.', '1563572952', 0),
(371, 371, 176, 56, 76, 'Id adipisci tempore eum aut.', '1563572952', 0),
(373, 373, 24, 1, 38, 'Optio sequi ut.', '1563572952', 0),
(374, 374, 20, 74, 4, 'Accusantium eveniet.', '1563572952', 1),
(376, 376, 144, 138, 173, 'Possimus natus.', '1563572952', 1),
(377, 377, 32, 134, 35, 'Quam voluptatum nesciunt beatae.', '1563572952', 1),
(379, 379, 136, 59, 20, 'Cupiditate nobis.', '1563572952', 1),
(381, 381, 51, 16, 41, 'Occaecati.', '1563572952', 0),
(382, 382, 67, 16, 65, 'Ut dolorum.', '1563572952', 0),
(383, 383, 100, 31, 153, 'In doloribus est odio.', '1563572952', 0),
(385, 385, 20, 13, 102, 'Et sunt.', '1563572952', 0),
(388, 388, 130, 24, 141, 'Animi et sapiente aut eum.', '1563572952', 1),
(389, 389, 10, 28, 49, 'Suscipit.', '1563572952', 0),
(390, 390, 71, 13, 133, 'Sint sint qui voluptatem ab quam.', '1563572952', 1),
(391, 391, 88, 89, 65, 'Consequuntur aut non ipsam.', '1563572952', 0),
(392, 392, 66, 73, 24, 'Commodi rerum.', '1563572952', 0),
(393, 393, 135, 89, 26, 'Expedita.', '1563572952', 0),
(394, 394, 79, 17, 11, 'Qui officia.', '1563572952', 1),
(396, 396, 13, 135, 31, 'Consequatur aut deleniti est consequuntur.', '1563572952', 1),
(397, 397, 166, 23, 137, 'Ipsa.', '1563572952', 1),
(399, 399, 52, 131, 166, 'Accusamus error odio sed.', '1563572952', 1),
(400, 400, 85, 102, 175, 'Consequatur quam.', '1563572952', 1),
(401, 401, 149, 76, 50, 'Id labore aperiam voluptas.', '1563572952', 1),
(402, 402, 148, 164, 37, 'Quia et consequatur vitae.', '1563572952', 1),
(403, 403, 8, 164, 103, 'Provident non.', '1563572953', 1),
(404, 404, 83, 94, 34, 'Nulla.', '1563572953', 0),
(405, 405, 76, 165, 137, 'Consectetur voluptas.', '1563572953', 1),
(406, 406, 60, 39, 23, 'Officiis facilis ullam aspernatur.', '1563572953', 1),
(408, 408, 173, 66, 174, 'Magni ut natus architecto.', '1563572953', 0),
(409, 409, 65, 71, 80, 'Sed quod.', '1563572953', 1),
(413, 413, 18, 48, 93, 'Possimus quia praesentium voluptatem omnis.', '1563572953', 1),
(414, 414, 99, 160, 146, 'Ullam autem quia fugiat ipsam.', '1563572953', 0),
(415, 415, 55, 131, 44, 'Magnam amet atque deserunt.', '1563572953', 1),
(416, 416, 13, 70, 84, 'Doloribus sapiente reprehenderit dolorum sit.', '1563572953', 1),
(418, 418, 80, 70, 104, 'Ex ut.', '1563572953', 1),
(419, 419, 70, 134, 168, 'Repellat laboriosam itaque.', '1563572953', 0),
(421, 421, 164, 147, 20, 'Sit vitae aut labore.', '1563572953', 0),
(423, 423, 2, 75, 10, 'Sed ducimus illum.', '1563572953', 1),
(425, 425, 5, 129, 86, 'Similique accusamus vel similique.', '1563572953', 0),
(426, 426, 69, 173, 11, 'Facilis nihil.', '1563572953', 0),
(427, 427, 56, 8, 80, 'Est ut quae qui.', '1563572953', 0),
(428, 428, 85, 79, 152, 'Voluptates itaque quibusdam.', '1563572953', 1),
(429, 429, 84, 103, 165, 'Temporibus ut.', '1563572953', 1),
(430, 430, 64, 94, 6, 'Alias.', '1563572953', 0),
(431, 431, 85, 47, 135, 'Consectetur excepturi quibusdam.', '1563572953', 1),
(433, 433, 95, 132, 170, 'Autem et aut ullam ipsam.', '1563572953', 1),
(434, 434, 168, 8, 129, 'Omnis incidunt.', '1563572953', 0),
(435, 435, 95, 151, 160, 'Eligendi.', '1563572953', 0),
(436, 436, 141, 136, 44, 'Nostrum quia.', '1563572953', 1),
(437, 437, 82, 81, 51, 'Aut consequuntur.', '1563572953', 1),
(438, 438, 71, 80, 37, 'Eaque quia.', '1563572953', 1),
(440, 440, 43, 136, 86, 'Itaque ratione consequuntur quam.', '1563572953', 1),
(441, 441, 4, 132, 39, 'Amet.', '1563572953', 1),
(442, 442, 69, 102, 92, 'Voluptas et natus libero.', '1563572953', 1),
(444, 444, 169, 92, 165, 'In illum earum nobis et.', '1563572953', 1),
(445, 445, 87, 169, 166, 'Vel sapiente in molestias quis.', '1563572953', 1),
(446, 446, 175, 49, 73, 'Voluptate doloremque dolorem.', '1563572953', 0),
(447, 447, 78, 86, 78, 'Quia fuga sunt neque quo quia.', '1563572953', 1),
(449, 449, 74, 91, 67, 'Quod recusandae beatae saepe nobis.', '1563572953', 1),
(451, 451, 164, 72, 9, 'Et ex voluptatum doloribus.', '1563572953', 1),
(452, 452, 73, 97, 16, 'Cum dolorem magnam libero.', '1563572953', 1),
(453, 453, 38, 68, 140, 'Eveniet doloribus.', '1563572953', 1),
(455, 455, 47, 97, 165, 'Laboriosam labore dignissimos facere in.', '1563572953', 1),
(457, 457, 75, 172, 84, 'Ad saepe.', '1563572953', 1),
(458, 458, 29, 104, 8, 'Dicta adipisci rerum.', '1563572953', 1),
(459, 459, 91, 155, 127, 'Laudantium.', '1563572953', 1),
(461, 461, 1, 77, 28, 'Eum voluptatum.', '1563572953', 1),
(462, 462, 94, 102, 56, 'Inventore iste.', '1563572953', 1),
(463, 463, 16, 79, 43, 'Magnam dolorem occaecati.', '1563572953', 0),
(465, 465, 13, 141, 93, 'Sunt sit possimus blanditiis.', '1563572953', 1),
(466, 466, 126, 81, 17, 'Dolorem commodi a debitis.', '1563572953', 0),
(469, 469, 76, 132, 1, 'Voluptatem enim.', '1563572953', 0),
(470, 470, 25, 174, 171, 'Sed ut exercitationem corporis facere.', '1563572954', 0),
(471, 471, 86, 69, 143, 'Exercitationem.', '1563572954', 1),
(473, 473, 55, 2, 22, 'Quia omnis.', '1563572954', 0),
(474, 474, 148, 161, 169, 'Quia temporibus autem.', '1563572954', 0),
(476, 476, 75, 73, 13, 'Quo suscipit eos.', '1563572954', 1),
(477, 477, 162, 164, 56, 'Aperiam explicabo fugiat nisi cum.', '1563572954', 0),
(479, 479, 30, 135, 29, 'Qui repudiandae quibusdam.', '1563572954', 1),
(480, 480, 100, 164, 84, 'Velit ab.', '1563572954', 1),
(481, 481, 59, 8, 126, 'Corporis laboriosam.', '1563572954', 1),
(483, 483, 61, 28, 158, 'Eum et inventore.', '1563572954', 1),
(484, 484, 59, 56, 157, 'Numquam eum.', '1563572954', 0),
(487, 487, 162, 15, 41, 'Earum delectus.', '1563572954', 1),
(488, 488, 55, 9, 96, 'Pariatur eum.', '1563572954', 0),
(490, 490, 68, 13, 48, 'Non illum.', '1563572954', 0),
(491, 491, 166, 155, 155, 'Sit enim odio dolor.', '1563572954', 1),
(492, 492, 158, 91, 13, 'Sed ea.', '1563572954', 1),
(494, 494, 59, 168, 173, 'Et autem optio.', '1563572954', 1),
(497, 497, 128, 152, 176, 'Quis aut ut.', '1563572954', 0),
(498, 498, 61, 7, 57, 'Inventore aspernatur eum enim.', '1563572954', 0),
(501, 501, 152, 137, 101, 'Molestiae velit.', '1563572954', 1),
(502, 502, 50, 1, 26, 'Aut ipsa quis.', '1563572954', 0),
(504, 504, 142, 134, 138, 'Voluptate incidunt.', '1563572954', 0),
(505, 505, 145, 26, 133, 'Inventore ratione architecto.', '1563572954', 1),
(506, 506, 166, 129, 77, 'Dicta.', '1563572954', 0),
(507, 507, 172, 9, 131, 'Tenetur blanditiis quas exercitationem incidunt.', '1563572954', 0),
(508, 508, 148, 90, 45, 'Itaque laborum.', '1563572954', 1),
(509, 509, 73, 98, 81, 'Voluptas non deleniti.', '1563572954', 1),
(510, 510, 6, 133, 66, 'Saepe aut dolorum eaque ex assumenda.', '1563572954', 0),
(511, 511, 40, 34, 59, 'Ut incidunt asperiores animi.', '1563572954', 1),
(512, 512, 62, 160, 4, 'Maiores.', '1563572954', 1),
(513, 513, 25, 37, 61, 'Nemo quis voluptas animi provident.', '1563572954', 1),
(514, 514, 27, 132, 97, 'Cumque.', '1563572954', 0),
(515, 515, 175, 155, 167, 'Qui pariatur.', '1563572954', 0),
(520, 520, 88, 48, 132, 'Provident.', '1563572954', 0),
(521, 521, 13, 65, 128, 'Doloremque consectetur.', '1563572954', 1),
(523, 523, 18, 176, 102, 'Consequatur culpa et.', '1563572954', 1),
(524, 524, 128, 53, 27, 'Nobis aut et veniam.', '1563572954', 0),
(526, 526, 90, 137, 152, 'Est placeat harum nostrum est.', '1563572954', 0),
(527, 527, 37, 90, 22, 'Porro perferendis.', '1563572954', 0),
(528, 528, 2, 101, 167, 'Quibusdam et.', '1563572954', 0),
(529, 529, 154, 73, 22, 'Consectetur aut.', '1563572954', 0),
(531, 531, 153, 33, 87, 'Sit in quod.', '1563572954', 0),
(533, 533, 11, 79, 140, 'Magnam ea ea et.', '1563572954', 1),
(534, 534, 146, 152, 36, 'Natus dignissimos ipsam possimus.', '1563572954', 0),
(535, 535, 11, 76, 20, 'Reiciendis vero dolor assumenda sint.', '1563572954', 1),
(536, 536, 57, 138, 25, 'Et quaerat tempora amet.', '1563572954', 0),
(538, 538, 164, 83, 67, 'Ut et sit sunt excepturi.', '1563572954', 0),
(540, 540, 150, 24, 14, 'Excepturi nihil molestiae eum pariatur.', '1563572954', 1),
(541, 541, 48, 61, 70, 'Illum eos.', '1563572955', 0),
(542, 542, 66, 42, 7, 'Dolorum molestiae velit.', '1563572955', 1),
(543, 543, 146, 8, 57, 'Ea quaerat numquam consequatur ipsam.', '1563572955', 1),
(544, 544, 34, 89, 56, 'Atque.', '1563572955', 1),
(545, 545, 56, 26, 72, 'Id odit cupiditate similique.', '1563572955', 1),
(547, 547, 141, 98, 26, 'Animi sed sed.', '1563572955', 1),
(548, 548, 32, 169, 131, 'Aut id qui.', '1563572955', 1),
(549, 549, 141, 150, 99, 'Necessitatibus magnam.', '1563572955', 0),
(550, 550, 137, 55, 128, 'Corporis voluptatem.', '1563572955', 1),
(551, 551, 5, 35, 103, 'Autem cumque itaque sunt amet.', '1563572955', 1),
(552, 552, 97, 43, 87, 'Ratione eum ipsum repudiandae.', '1563572955', 0),
(553, 553, 165, 40, 41, 'Eum expedita enim.', '1563572955', 1),
(554, 554, 60, 88, 53, 'Blanditiis iure.', '1563572955', 0),
(555, 555, 44, 136, 68, 'Doloremque neque omnis est.', '1563572955', 1),
(556, 556, 49, 6, 171, 'Quasi quam officiis dolores eos deleniti.', '1563572955', 0),
(557, 557, 71, 32, 153, 'Consequatur omnis.', '1563572955', 0),
(558, 558, 51, 33, 36, 'Ut deserunt quae omnis.', '1563572955', 0),
(560, 560, 88, 148, 88, 'Nulla voluptatum reiciendis.', '1563572955', 1),
(561, 561, 1, 132, 81, 'Quasi sed tempora.', '1563572955', 0),
(563, 563, 71, 161, 28, 'Qui.', '1563572955', 1),
(565, 565, 133, 61, 26, 'Sequi consequatur blanditiis voluptatum.', '1563572955', 1),
(566, 566, 97, 19, 8, 'Hic id.', '1563572955', 0),
(567, 567, 176, 81, 75, 'Sed.', '1563572955', 1),
(569, 569, 5, 168, 89, 'Atque iste reiciendis non.', '1563572955', 0),
(570, 570, 156, 50, 71, 'Libero nemo ipsam cupiditate.', '1563572955', 0),
(571, 571, 130, 43, 97, 'Eos.', '1563572955', 0),
(572, 572, 142, 159, 101, 'Ut dicta ut.', '1563572955', 0),
(573, 573, 66, 159, 92, 'Soluta quia exercitationem.', '1563572955', 0),
(575, 575, 44, 58, 53, 'Error pariatur soluta deleniti numquam.', '1563572955', 1),
(576, 576, 134, 19, 25, 'Et sed eius odio voluptas.', '1563572955', 1),
(577, 577, 9, 51, 174, 'Exercitationem minima quisquam dolore.', '1563572955', 1),
(578, 578, 82, 42, 48, 'Qui magni cumque repellendus.', '1563572955', 1),
(579, 579, 79, 58, 149, 'Exercitationem minima molestias.', '1563572955', 1),
(584, 584, 33, 50, 137, 'Perferendis quia maxime.', '1563572955', 0),
(585, 585, 157, 84, 58, 'Sequi similique.', '1563572955', 0),
(588, 588, 168, 42, 38, 'Facilis ut.', '1563572955', 0),
(589, 589, 148, 38, 54, 'Sunt facere odit omnis inventore itaque.', '1563572955', 0),
(591, 591, 97, 68, 138, 'Optio rerum.', '1563572955', 1),
(592, 592, 126, 8, 63, 'Nihil delectus ut.', '1563572955', 1),
(593, 593, 50, 164, 133, 'Id.', '1563572955', 0),
(594, 594, 94, 149, 46, 'Repellendus et accusantium omnis.', '1563572955', 1),
(595, 595, 149, 92, 172, 'Magni hic eveniet dolorem.', '1563572955', 0),
(596, 596, 88, 151, 159, 'Eum et dolores voluptatem.', '1563572955', 0),
(597, 597, 51, 42, 176, 'Sequi exercitationem dignissimos quia.', '1563572955', 0),
(598, 598, 46, 96, 97, 'Voluptatem et modi.', '1563572955', 0),
(599, 599, 91, 155, 147, 'Nihil odit voluptas.', '1563572955', 1),
(602, 602, 40, 100, 74, 'Maxime ipsum ipsum.', '1563572955', 0),
(605, 605, 18, 173, 27, 'Consequuntur est.', '1563572956', 0),
(606, 606, 31, 148, 154, 'Voluptatibus rerum in amet et rem.', '1563572956', 1),
(607, 607, 41, 154, 69, 'Excepturi impedit amet.', '1563572956', 0),
(608, 608, 130, 50, 58, 'Vel excepturi harum.', '1563572956', 1),
(609, 609, 153, 152, 39, 'Odio vel.', '1563572956', 0),
(610, 610, 83, 173, 82, 'Maxime aut voluptatem.', '1563572956', 0),
(612, 612, 90, 104, 65, 'Facere rerum.', '1563572956', 1),
(613, 613, 6, 151, 100, 'Et.', '1563572956', 1),
(614, 614, 21, 14, 162, 'Occaecati temporibus perspiciatis.', '1563572956', 1),
(616, 616, 46, 147, 39, 'Dolore.', '1563572956', 1),
(618, 618, 43, 172, 147, 'Iste.', '1563572956', 1),
(619, 619, 7, 168, 8, 'Mollitia vel et.', '1563572956', 0),
(620, 620, 49, 82, 80, 'In veniam quis.', '1563572956', 1),
(621, 621, 78, 162, 131, 'Quis illo sapiente rerum ut et.', '1563572956', 0),
(624, 624, 161, 60, 136, 'Voluptatem officiis aperiam voluptatibus recusandae est.', '1563572956', 1),
(625, 625, 13, 176, 156, 'Enim sed voluptatum.', '1563572956', 0),
(626, 626, 14, 63, 12, 'Ea ratione qui.', '1563572956', 0),
(628, 628, 19, 5, 44, 'Odio dolores.', '1563572956', 1),
(629, 629, 25, 159, 2, 'Est vero non.', '1563572956', 0),
(630, 630, 28, 73, 174, 'Atque consequatur.', '1563572956', 1),
(631, 631, 74, 171, 49, 'Nemo ipsam possimus iste.', '1563572956', 0),
(632, 632, 8, 34, 134, 'Nemo libero quae odio.', '1563572956', 1),
(634, 634, 174, 23, 92, 'Ut officiis.', '1563572956', 0),
(635, 635, 5, 44, 49, 'Et ipsam et debitis.', '1563572956', 0),
(636, 636, 88, 61, 26, 'Totam officiis est dolore.', '1563572956', 1),
(638, 638, 134, 6, 22, 'In eos voluptates magni.', '1563572956', 0),
(639, 639, 54, 53, 77, 'Est.', '1563572956', 0),
(641, 641, 37, 43, 71, 'Nulla cupiditate.', '1563572956', 0),
(643, 643, 133, 138, 21, 'Rerum ex est architecto.', '1563572956', 0),
(644, 644, 128, 77, 54, 'Vel ipsam amet.', '1563572956', 0),
(645, 645, 69, 22, 135, 'Consectetur veniam asperiores repellendus.', '1563572956', 0),
(650, 650, 130, 80, 137, 'Amet et consequuntur assumenda.', '1563572956', 1),
(654, 654, 29, 51, 164, 'Similique.', '1563572956', 1),
(655, 655, 51, 62, 101, 'Qui quia.', '1563572956', 1),
(658, 658, 37, 104, 153, 'Recusandae atque dignissimos ducimus dolorem omnis.', '1563572956', 0),
(659, 659, 134, 140, 37, 'Vero.', '1563572956', 1),
(660, 660, 42, 137, 130, 'Sed minima.', '1563572956', 0),
(661, 661, 26, 5, 147, 'Repellat nihil non atque.', '1563572956', 0),
(662, 662, 145, 69, 93, 'Sunt unde in.', '1563572956', 1),
(663, 663, 161, 161, 82, 'Alias qui porro.', '1563572956', 1),
(664, 664, 90, 5, 59, 'Dolorem.', '1563572956', 1),
(665, 665, 140, 26, 131, 'Debitis dolores provident.', '1563572956', 0),
(667, 667, 20, 168, 96, 'Ratione.', '1563572957', 0),
(669, 669, 157, 142, 62, 'Ut explicabo repellendus hic.', '1563572957', 1),
(671, 671, 161, 170, 101, 'Nostrum illum.', '1563572957', 0),
(672, 672, 135, 34, 162, 'Molestiae ullam a velit praesentium.', '1563572957', 0),
(673, 673, 63, 6, 20, 'Rem minus.', '1563572957', 0),
(674, 674, 31, 129, 56, 'Aut.', '1563572957', 1),
(676, 676, 24, 68, 64, 'Explicabo.', '1563572957', 1),
(677, 677, 78, 61, 27, 'Corrupti optio molestias.', '1563572957', 1),
(678, 678, 157, 5, 26, 'Et.', '1563572957', 1),
(680, 680, 129, 71, 47, 'Quo numquam quae.', '1563572957', 1),
(682, 682, 50, 55, 90, 'Consectetur molestias.', '1563572957', 1),
(683, 683, 32, 133, 152, 'Itaque porro velit natus et.', '1563572957', 1),
(684, 684, 80, 136, 152, 'Dolores ut.', '1563572957', 0),
(685, 685, 70, 69, 90, 'Enim sit.', '1563572957', 1),
(686, 686, 75, 1, 91, 'Expedita mollitia nulla.', '1563572957', 0),
(687, 687, 166, 36, 24, 'Corporis a corrupti dolor et.', '1563572957', 1),
(688, 688, 2, 85, 92, 'Dolores beatae.', '1563572957', 0),
(690, 690, 173, 157, 2, 'Quia illo iure.', '1563572957', 0),
(691, 691, 87, 72, 11, 'At saepe amet sit quae possimus.', '1563572957', 1),
(693, 693, 153, 7, 86, 'Sit ad.', '1563572957', 0),
(694, 694, 146, 71, 73, 'Magni.', '1563572957', 1),
(695, 695, 41, 97, 21, 'Iusto itaque.', '1563572957', 0),
(696, 696, 155, 167, 41, 'Illo aliquid sit distinctio.', '1563572957', 1),
(698, 698, 151, 83, 30, 'Ut ea dolor.', '1563572957', 0),
(699, 699, 41, 53, 42, 'Ipsam.', '1563572957', 1),
(701, 701, 135, 150, 145, 'Earum laborum impedit eum.', '1563572957', 0),
(702, 702, 81, 63, 148, 'Dolorem veritatis sed corrupti.', '1563572957', 0),
(703, 703, 70, 82, 129, 'Qui.', '1563572957', 1),
(704, 704, 170, 129, 138, 'Quam et et.', '1563572957', 0),
(706, 706, 15, 14, 94, 'Et culpa.', '1563572957', 0),
(708, 708, 25, 133, 170, 'Soluta.', '1563572957', 1),
(709, 709, 95, 46, 45, 'Cumque vero odio.', '1563572957', 1),
(710, 710, 102, 169, 8, 'Ipsum id ipsa.', '1563572957', 0),
(712, 712, 26, 55, 25, 'Ea sed reiciendis omnis.', '1563572957', 1),
(715, 715, 126, 138, 79, 'Voluptate consequatur placeat voluptas.', '1563572957', 1),
(716, 716, 66, 65, 82, 'Consequatur omnis incidunt sit velit a.', '1563572957', 1),
(718, 718, 40, 146, 156, 'In maiores esse et voluptate.', '1563572957', 1),
(719, 719, 156, 104, 32, 'Nulla magnam est.', '1563572957', 0),
(720, 720, 164, 138, 143, 'Sint repellendus veniam.', '1563572957', 0),
(723, 723, 84, 100, 61, 'Deleniti.', '1563572957', 1),
(724, 724, 60, 58, 170, 'Eum nesciunt eum dolorem voluptas vel.', '1563572957', 0),
(725, 725, 49, 3, 37, 'Et explicabo illum.', '1563572957', 0),
(727, 727, 175, 91, 22, 'Eos odio molestias.', '1563572957', 0),
(728, 728, 27, 65, 68, 'Et id quo.', '1563572957', 1),
(729, 729, 50, 45, 127, 'Pariatur pariatur.', '1563572957', 0),
(730, 730, 154, 42, 146, 'Aut facere.', '1563572957', 1),
(731, 731, 154, 163, 17, 'Repellat praesentium omnis.', '1563572957', 0),
(732, 732, 171, 176, 30, 'Omnis non.', '1563572958', 0),
(733, 733, 43, 8, 102, 'Et aut quo aut laudantium.', '1563572958', 1),
(734, 734, 155, 24, 43, 'Ex aut quas quae.', '1563572958', 1),
(736, 736, 171, 163, 95, 'Quia odit.', '1563572958', 0),
(737, 737, 74, 147, 160, 'Consectetur assumenda porro.', '1563572958', 1),
(738, 738, 153, 79, 27, 'Quis est qui asperiores est.', '1563572958', 0),
(739, 739, 19, 87, 76, 'At ea.', '1563572958', 0),
(741, 741, 30, 93, 33, 'Nulla et sint voluptates ut autem.', '1563572958', 0),
(742, 742, 8, 102, 37, 'Fugiat non culpa distinctio dolores.', '1563572958', 0),
(743, 743, 84, 88, 72, 'Architecto molestias ipsa voluptates.', '1563572958', 0),
(745, 745, 150, 143, 95, 'Ea est ab soluta placeat.', '1563572958', 1),
(746, 746, 139, 50, 75, 'Quia libero rerum.', '1563572958', 0),
(747, 747, 66, 162, 160, 'Dolores corrupti.', '1563572958', 1),
(748, 748, 75, 45, 3, 'Fugit velit nesciunt dolore nulla.', '1563572958', 0),
(750, 750, 17, 134, 22, 'Aliquid magni error et.', '1563572958', 0),
(751, 751, 149, 141, 60, 'Quidem esse.', '1563572958', 1),
(753, 753, 163, 135, 63, 'Eaque quia at dolorum.', '1563572958', 1),
(754, 754, 45, 90, 132, 'Vitae aut.', '1563572958', 0),
(755, 755, 4, 57, 64, 'Sed quod officiis.', '1563572958', 0),
(758, 758, 151, 169, 20, 'Eius magnam dignissimos consequatur culpa.', '1563572958', 0),
(759, 759, 139, 78, 34, 'Nemo dolorem illum sed cupiditate.', '1563572958', 1),
(761, 761, 48, 141, 7, 'In.', '1563572958', 1),
(763, 763, 146, 151, 81, 'Maxime provident et ratione.', '1563572958', 0),
(764, 764, 32, 68, 140, 'Et voluptatem consequatur.', '1563572958', 0),
(767, 767, 63, 62, 8, 'Quis in.', '1563572958', 0),
(770, 770, 75, 26, 4, 'Dolores ad.', '1563572958', 0),
(771, 771, 98, 95, 35, 'Explicabo sit et similique placeat nam.', '1563572958', 0),
(772, 772, 175, 133, 25, 'Aut dolorem ab optio.', '1563572958', 0),
(773, 773, 35, 34, 95, 'Quidem in.', '1563572958', 0),
(775, 775, 162, 1, 7, 'Eaque quae ut.', '1563572958', 0),
(776, 776, 21, 31, 16, 'Voluptate.', '1563572958', 0),
(778, 778, 61, 164, 39, 'Sit consectetur qui saepe.', '1563572958', 0),
(781, 781, 1, 145, 20, 'Nulla sit.', '1563572958', 0),
(782, 782, 84, 142, 93, 'Soluta unde.', '1563572958', 1),
(783, 783, 19, 96, 164, 'Cum quisquam sit porro commodi enim.', '1563572958', 1),
(784, 784, 34, 46, 152, 'Velit aut quod placeat maiores alias.', '1563572958', 1),
(785, 785, 151, 146, 39, 'Modi.', '1563572958', 1),
(787, 787, 74, 146, 22, 'Voluptatem sunt delectus.', '1563572959', 1),
(788, 788, 70, 9, 25, 'Et.', '1563572959', 0),
(790, 790, 31, 1, 73, 'Praesentium distinctio nulla eum ut.', '1563572959', 1),
(791, 791, 173, 2, 32, 'Nam quas id enim.', '1563572959', 1),
(794, 794, 47, 68, 26, 'Laudantium fuga.', '1563572959', 0),
(795, 795, 19, 150, 5, 'Itaque maiores.', '1563572959', 1),
(796, 796, 47, 78, 76, 'Eos ab cumque.', '1563572959', 1),
(798, 798, 49, 94, 159, 'Iure eos aut temporibus esse.', '1563572959', 1),
(799, 799, 15, 94, 81, 'Voluptas nemo est.', '1563572959', 0),
(800, 800, 78, 81, 144, 'Quia similique sunt.', '1563572959', 1),
(801, 801, 67, 57, 93, 'Rerum et doloribus possimus placeat.', '1563572959', 0),
(802, 802, 42, 171, 82, 'Nobis quia et quia dolorem veritatis.', '1563572959', 0),
(805, 805, 19, 27, 172, 'Corporis sequi velit similique molestiae.', '1563572959', 1),
(806, 806, 133, 31, 78, 'Consequatur.', '1563572959', 0),
(807, 807, 38, 71, 83, 'Atque nam enim delectus.', '1563572959', 1),
(808, 808, 170, 62, 48, 'Iure aliquam.', '1563572959', 1),
(811, 811, 54, 150, 74, 'Occaecati veritatis nam voluptas.', '1563572959', 1),
(812, 812, 4, 9, 130, 'Sint nisi doloribus.', '1563572959', 0),
(813, 813, 141, 165, 38, 'Voluptas autem aut.', '1563572959', 0),
(814, 814, 150, 13, 142, 'Dolor.', '1563572959', 1),
(815, 815, 172, 141, 91, 'Tempora distinctio.', '1563572959', 1),
(816, 816, 129, 46, 134, 'Laboriosam nemo soluta non.', '1563572959', 0),
(817, 817, 158, 157, 168, 'Sequi voluptatem molestias dignissimos.', '1563572959', 0),
(818, 818, 91, 74, 157, 'Beatae eos ratione et.', '1563572959', 0),
(819, 819, 63, 85, 101, 'Ullam.', '1563572959', 0),
(820, 820, 40, 174, 62, 'Nemo voluptas.', '1563572959', 0),
(822, 822, 51, 100, 26, 'Ipsa aut.', '1563572959', 0),
(823, 823, 157, 100, 88, 'Voluptas harum est recusandae sed.', '1563572959', 0),
(824, 824, 26, 151, 59, 'Fugiat neque.', '1563572959', 0),
(825, 825, 37, 18, 88, 'Est rerum qui eum nesciunt.', '1563572959', 0),
(826, 826, 55, 154, 78, 'Aut sint.', '1563572959', 1),
(828, 828, 58, 37, 170, 'Delectus at.', '1563572959', 1),
(833, 833, 82, 151, 49, 'Recusandae voluptates dolorem possimus reiciendis.', '1563572959', 0),
(836, 836, 98, 55, 69, 'Dolorem est.', '1563572959', 0),
(837, 837, 151, 82, 9, 'Voluptatem libero laborum.', '1563572959', 0),
(838, 838, 130, 16, 52, 'Quis eum optio nihil.', '1563572959', 0),
(839, 839, 131, 139, 169, 'Quisquam velit itaque.', '1563572959', 0),
(840, 840, 19, 63, 18, 'Mollitia amet culpa.', '1563572959', 1),
(841, 841, 137, 43, 6, 'Aut.', '1563572959', 0),
(842, 842, 140, 172, 55, 'Non fuga at neque.', '1563572959', 1),
(845, 845, 53, 34, 21, 'Nihil vero.', '1563572959', 0),
(846, 846, 86, 99, 13, 'Nobis unde est tempora.', '1563572960', 0),
(848, 848, 172, 139, 151, 'Cumque aut sint et.', '1563572960', 0),
(849, 849, 171, 102, 18, 'Vel aut ut quisquam.', '1563572960', 1),
(851, 851, 81, 103, 99, 'Aut iste.', '1563572960', 1),
(852, 852, 57, 15, 64, 'Sit reiciendis.', '1563572960', 0),
(857, 857, 44, 78, 19, 'Et sint.', '1563572960', 0),
(859, 859, 163, 2, 54, 'Qui dolor molestiae quidem.', '1563572960', 0),
(860, 860, 83, 93, 37, 'Quas eveniet optio.', '1563572960', 0),
(862, 862, 22, 37, 90, 'Quibusdam numquam harum.', '1563572960', 1),
(863, 863, 50, 25, 12, 'Illo aut eos nemo.', '1563572960', 0),
(864, 864, 51, 48, 73, 'Dolor.', '1563572960', 1),
(865, 865, 165, 79, 10, 'Non omnis necessitatibus quos sunt voluptatem.', '1563572960', 1),
(866, 866, 101, 63, 86, 'Quo est architecto.', '1563572960', 0),
(867, 867, 147, 73, 1, 'Ad quidem.', '1563572960', 0),
(868, 868, 126, 129, 161, 'Accusamus ducimus saepe.', '1563572960', 1),
(869, 869, 43, 103, 173, 'Id quo.', '1563572960', 0),
(871, 871, 141, 78, 11, 'Aut optio unde blanditiis molestiae.', '1563572960', 1),
(872, 872, 36, 128, 143, 'Sint aspernatur illo aut deserunt.', '1563572960', 0),
(873, 873, 8, 83, 127, 'Est.', '1563572960', 0),
(875, 875, 50, 164, 11, 'Accusamus ad.', '1563572960', 1),
(878, 878, 20, 150, 139, 'Porro est id quia.', '1563572960', 0),
(879, 879, 137, 51, 65, 'Aut vitae maiores nisi.', '1563572960', 1),
(881, 881, 75, 61, 131, 'Provident enim voluptatem suscipit.', '1563572960', 0),
(883, 883, 12, 66, 149, 'Nisi qui molestiae.', '1563572960', 1),
(886, 886, 83, 8, 11, 'Voluptates qui numquam libero.', '1563572961', 0),
(887, 887, 154, 9, 54, 'Exercitationem nesciunt.', '1563572961', 1),
(888, 888, 64, 156, 103, 'Maiores amet praesentium.', '1563572961', 1),
(891, 891, 168, 66, 175, 'Exercitationem ad accusantium.', '1563572961', 0),
(893, 893, 133, 103, 32, 'Reiciendis autem facilis.', '1563572961', 1),
(894, 894, 65, 40, 5, 'Voluptates odit.', '1563572961', 1),
(895, 895, 8, 89, 13, 'Voluptates deserunt.', '1563572961', 0),
(896, 896, 76, 55, 46, 'Architecto magnam at possimus.', '1563572961', 0),
(897, 897, 90, 51, 11, 'Veniam tempora.', '1563572961', 0),
(899, 899, 102, 89, 163, 'Aut omnis sunt natus qui.', '1563572961', 0),
(900, 900, 131, 103, 140, 'Assumenda enim.', '1563572961', 0),
(902, 902, 126, 97, 142, 'Et aperiam.', '1563572961', 0),
(903, 903, 160, 56, 19, 'Saepe.', '1563572961', 0),
(904, 904, 144, 21, 42, 'Fugiat aspernatur ex voluptatibus.', '1563572961', 1),
(907, 907, 142, 149, 102, 'Quia sed eum porro.', '1563572961', 1),
(908, 908, 150, 57, 52, 'Sed cum dolor.', '1563572961', 1),
(909, 909, 32, 154, 76, 'Iusto.', '1563572961', 1),
(910, 910, 152, 61, 173, 'Doloremque enim facere.', '1563572961', 1),
(911, 911, 45, 80, 152, 'Aut autem in nihil suscipit.', '1563572961', 0),
(912, 912, 52, 50, 81, 'Illo necessitatibus qui.', '1563572961', 0),
(914, 914, 2, 58, 79, 'Sit ad incidunt voluptatem.', '1563572961', 1),
(915, 915, 64, 59, 137, 'Nobis consequuntur quasi consequatur accusamus.', '1563572961', 1),
(916, 916, 98, 7, 1, 'Voluptatem laboriosam.', '1563572961', 0),
(917, 917, 11, 88, 128, 'Iusto illum ab quae.', '1563572961', 0),
(919, 919, 7, 70, 14, 'Rerum.', '1563572961', 0),
(923, 923, 94, 79, 90, 'Vel ut.', '1563572962', 1),
(924, 924, 135, 151, 78, 'Suscipit in.', '1563572962', 1),
(925, 925, 65, 15, 161, 'Perspiciatis commodi.', '1563572962', 1),
(926, 926, 175, 28, 36, 'Reprehenderit.', '1563572962', 1),
(927, 927, 174, 14, 88, 'Ab quae.', '1563572962', 0),
(929, 929, 164, 41, 11, 'Vitae ducimus.', '1563572962', 0),
(930, 930, 80, 93, 26, 'Magni autem.', '1563572962', 0),
(931, 931, 67, 88, 77, 'Non vel ad.', '1563572962', 1),
(932, 932, 17, 23, 28, 'Nemo eos.', '1563572962', 1),
(933, 933, 20, 130, 159, 'Officiis sed quae modi.', '1563572962', 1),
(934, 934, 139, 28, 5, 'Numquam consectetur.', '1563572962', 0),
(935, 935, 55, 97, 126, 'Quaerat rerum aut sint.', '1563572962', 1),
(938, 938, 91, 2, 150, 'Rerum culpa.', '1563572963', 1),
(939, 939, 58, 12, 15, 'Repellendus iste.', '1563572963', 1),
(941, 941, 82, 68, 65, 'Qui culpa.', '1563572963', 1),
(943, 943, 132, 141, 147, 'Voluptatem.', '1563572963', 1),
(946, 946, 102, 147, 103, 'Molestiae quisquam eos aut.', '1563572963', 1),
(948, 948, 133, 103, 130, 'Reiciendis dolorum.', '1563572963', 1),
(949, 949, 97, 142, 143, 'Tempore ducimus amet.', '1563572963', 0),
(950, 950, 103, 84, 49, 'Ipsam consequatur.', '1563572963', 1),
(951, 951, 75, 175, 5, 'Nisi eveniet.', '1563572963', 1),
(952, 952, 134, 47, 81, 'Ut aut aut consequatur dignissimos nisi.', '1563572963', 1),
(953, 953, 64, 34, 75, 'Ut sed ut.', '1563572963', 0),
(958, 958, 155, 14, 11, 'Quia amet eveniet aut voluptatibus recusandae.', '1563572963', 0),
(961, 961, 72, 151, 15, 'Id quas deserunt.', '1563572964', 0),
(962, 962, 153, 24, 19, 'Provident tenetur quibusdam.', '1563572964', 0),
(963, 963, 65, 33, 101, 'Ducimus rerum aspernatur est officiis et.', '1563572964', 0),
(968, 968, 59, 40, 90, 'Optio veniam et dicta debitis quam.', '1563572964', 0),
(969, 969, 79, 145, 46, 'Quis dignissimos maiores.', '1563572964', 0),
(972, 972, 14, 147, 75, 'Quis necessitatibus est.', '1563572964', 0),
(973, 973, 4, 59, 141, 'Laboriosam voluptatem ut molestias.', '1563572966', 0),
(974, 974, 135, 139, 45, 'Commodi error.', '1563572966', 1),
(978, 978, 145, 160, 2, 'Fugiat optio quia voluptas veniam.', '1563572966', 0),
(979, 979, 53, 9, 31, 'Eligendi omnis recusandae modi odio velit.', '1563572966', 1),
(981, 981, 77, 55, 153, 'Quia nesciunt repudiandae.', '1563572966', 1),
(985, 985, 63, 18, 21, 'Totam maiores placeat dolores id consequatur.', '1563572966', 1),
(988, 988, 47, 171, 22, 'At mollitia cupiditate.', '1563572966', 1),
(989, 989, 5, 63, 168, 'Repellendus quo temporibus voluptatibus.', '1563572966', 0),
(990, 990, 144, 76, 60, 'Sed inventore consequatur soluta.', '1563572966', 1),
(992, 992, 9, 83, 1, 'Pariatur beatae.', '1563572967', 1),
(993, 993, 78, 145, 48, 'Qui est.', '1563572967', 1),
(994, 994, 80, 50, 167, 'Ut enim non.', '1563572967', 0),
(998, 998, 46, 164, 130, 'Modi.', '1563572967', 1),
(999, 999, 97, 90, 153, 'Quas facere aut nulla.', '1563572967', 0),
(1001, 1001, 127, 151, 84, 'Cumque.', '1563572967', 0),
(1002, 1002, 89, 87, 97, 'Dolores accusantium temporibus.', '1563572967', 1),
(1004, 1004, 143, 160, 91, 'Dolorum impedit dolor saepe.', '1563572967', 0),
(1005, 1005, 28, 141, 51, 'Odio totam id et nisi quia.', '1563572967', 0),
(1006, 1006, 98, 52, 50, 'Temporibus eos non.', '1563572967', 1),
(1007, 1007, 174, 43, 72, 'Quis quaerat aliquid quasi et.', '1563572967', 0),
(1008, 1008, 161, 30, 38, 'Quos aut.', '1563572967', 1),
(1009, 1009, 76, 62, 68, 'Corporis modi eos perspiciatis.', '1563572967', 1),
(1010, 1010, 44, 9, 146, 'Enim et eligendi harum.', '1563572967', 1),
(1011, 1011, 162, 147, 126, 'Nam architecto.', '1563572967', 1),
(1013, 1013, 155, 41, 8, 'Ut.', '1563572967', 1),
(1016, 1016, 28, 139, 61, 'Nesciunt et.', '1563572968', 1),
(1017, 1017, 41, 149, 50, 'Perferendis minus nihil.', '1563572968', 0),
(1019, 1019, 157, 153, 145, 'Et perferendis ea.', '1563572968', 1),
(1020, 1020, 29, 130, 171, 'Sed nihil ex fuga.', '1563572968', 1),
(1021, 1021, 82, 132, 90, 'Omnis enim nemo.', '1563572968', 0),
(1022, 1022, 23, 64, 158, 'Iste est.', '1563572968', 0),
(1023, 1023, 135, 18, 2, 'Soluta voluptatem consequatur eos.', '1563572968', 0),
(1024, 1024, 129, 91, 42, 'Error cum quo itaque.', '1563572968', 0),
(1026, 1026, 15, 169, 103, 'Eligendi quod ea laudantium.', '1563572968', 1),
(1028, 1028, 97, 155, 133, 'Corporis iste eius.', '1563572968', 0),
(1030, 1030, 163, 56, 88, 'Et molestiae expedita ullam.', '1563572968', 1),
(1031, 1031, 15, 10, 143, 'Praesentium voluptas et dolorum.', '1563572968', 1),
(1032, 1032, 92, 69, 148, 'Enim.', '1563572968', 0),
(1033, 1033, 53, 50, 69, 'Nobis sed aut.', '1563572968', 1),
(1034, 1034, 165, 166, 92, 'Deserunt optio.', '1563572968', 1),
(1036, 1036, 3, 72, 59, 'Et tenetur voluptates.', '1563572969', 0),
(1037, 1037, 9, 132, 155, 'Sit.', '1563572969', 1),
(1038, 1038, 66, 24, 27, 'Molestiae inventore molestiae.', '1563572969', 0),
(1039, 1039, 77, 78, 153, 'Corporis occaecati.', '1563572969', 1),
(1040, 1040, 163, 151, 20, 'Id itaque rerum.', '1563572969', 1),
(1041, 1041, 144, 45, 27, 'Nesciunt perferendis.', '1563572969', 1),
(1042, 1042, 160, 138, 169, 'Non illum.', '1563572969', 0),
(1043, 1043, 167, 71, 9, 'Nihil inventore.', '1563572969', 1),
(1044, 1044, 175, 27, 82, 'Iure facilis qui molestias.', '1563572969', 0),
(1046, 1046, 8, 147, 15, 'Voluptatem dolorem.', '1563572969', 0),
(1047, 1047, 64, 52, 171, 'Itaque quae quo quae enim.', '1563572969', 1),
(1048, 1048, 82, 165, 57, 'Delectus doloribus.', '1563572969', 0),
(1049, 1049, 12, 152, 161, 'Nostrum.', '1563572969', 1),
(1051, 1051, 152, 23, 175, 'Nisi dolorem.', '1563572969', 1),
(1056, 1056, 140, 134, 89, 'Quod consectetur voluptas.', '1563572970', 1),
(1058, 1058, 87, 28, 63, 'Sed.', '1563572970', 0),
(1059, 1059, 93, 133, 14, 'Doloremque officiis.', '1563572970', 1),
(1060, 1060, 164, 149, 61, 'Dolor at.', '1563572970', 0),
(1062, 1062, 27, 166, 20, 'Voluptatem omnis.', '1563572970', 0),
(1066, 1066, 144, 156, 138, 'Qui blanditiis architecto officia et ab.', '1563572971', 1),
(1067, 1067, 96, 93, 84, 'Libero modi aut dicta.', '1563572971', 0),
(1068, 1068, 33, 158, 2, 'Eum.', '1563572971', 1),
(1069, 1069, 97, 11, 143, 'Laborum sit aut ea ex.', '1563572971', 1),
(1070, 1070, 52, 81, 140, 'Eveniet dignissimos doloribus.', '1563572971', 0),
(1071, 1071, 65, 18, 150, 'Dolor.', '1563572971', 0),
(1072, 1072, 34, 77, 171, 'Ut dolorem.', '1563572971', 0),
(1073, 1073, 61, 2, 151, 'Quidem et.', '1563572971', 0),
(1074, 1074, 8, 1, 171, 'Repudiandae inventore.', '1563572971', 1),
(1075, 1075, 165, 47, 145, 'Et voluptas.', '1563572971', 0),
(1076, 1076, 39, 27, 98, 'Doloremque.', '1563572971', 1),
(1077, 1077, 52, 172, 61, 'Harum tempore veritatis saepe.', '1563572971', 1),
(1078, 1078, 23, 76, 78, 'Omnis non distinctio unde minima odit.', '1563572971', 0),
(1080, 1080, 75, 170, 175, 'Laborum consequatur sint.', '1563572971', 1),
(1081, 1081, 139, 65, 126, 'Eveniet.', '1563572971', 1),
(1082, 1082, 132, 37, 89, 'Est sed alias soluta.', '1563572971', 1),
(1083, 1083, 47, 80, 38, 'Sed illo.', '1563572971', 0),
(1085, 1085, 30, 155, 73, 'Quas qui.', '1563572971', 1),
(1086, 1086, 139, 25, 104, 'Nam eaque.', '1563572971', 0),
(1089, 1089, 165, 4, 41, 'Omnis molestias.', '1563572971', 0),
(1090, 1090, 41, 171, 131, 'Quaerat eius error.', '1563572971', 0),
(1092, 1092, 130, 37, 88, 'Eum ducimus.', '1563572971', 0),
(1093, 1093, 42, 14, 28, 'Eaque ducimus quidem optio eius et.', '1563572971', 0),
(1094, 1094, 82, 15, 12, 'Non ullam vel.', '1563572971', 1),
(1096, 1096, 58, 130, 88, 'Ut exercitationem cum.', '1563572971', 0),
(1098, 1098, 159, 141, 59, 'Veritatis omnis.', '1563572971', 0),
(1099, 1099, 74, 103, 53, 'Pariatur tempora magnam.', '1563572972', 0),
(1102, 1102, 97, 129, 140, 'Provident tenetur autem.', '1563572972', 1),
(1103, 1103, 137, 77, 127, 'Minus quam consequatur molestiae.', '1563572972', 0),
(1105, 1105, 137, 172, 24, 'Et libero.', '1563572972', 0),
(1106, 1106, 37, 59, 78, 'Sed.', '1563572972', 0),
(1107, 1107, 86, 126, 149, 'Inventore sint cum ab natus.', '1563572972', 1),
(1108, 1108, 50, 129, 87, 'Est illum occaecati.', '1563572972', 1),
(1110, 1110, 137, 169, 174, 'Culpa autem necessitatibus.', '1563572972', 1),
(1114, 1114, 165, 26, 173, 'Quae qui non voluptates.', '1563572972', 1),
(1115, 1115, 150, 101, 60, 'Ut itaque.', '1563572972', 1),
(1116, 1116, 5, 171, 50, 'Ipsa mollitia non.', '1563572972', 1),
(1117, 1117, 12, 171, 70, 'At tempore aut debitis labore.', '1563572972', 0),
(1118, 1118, 93, 51, 145, 'Ad maiores rerum dignissimos.', '1563572972', 1),
(1119, 1119, 141, 147, 143, 'Laborum.', '1563572972', 1),
(1120, 1120, 7, 27, 130, 'Omnis ut deserunt corrupti.', '1563572972', 0),
(1121, 1121, 139, 94, 87, 'Nobis.', '1563572972', 0),
(1122, 1122, 2, 98, 1, 'Possimus et et.', '1563572972', 0),
(1124, 1124, 168, 23, 87, 'Est sint.', '1563572972', 0),
(1126, 1126, 9, 84, 154, 'Unde vitae expedita.', '1563572972', 1),
(1129, 1129, 19, 150, 65, 'Culpa sed.', '1563572972', 1),
(1130, 1130, 16, 82, 132, 'Ut.', '1563572972', 1),
(1132, 1132, 153, 84, 147, 'Odit et doloribus.', '1563572972', 0),
(1133, 1133, 72, 140, 57, 'Atque eum dolorem.', '1563572972', 1),
(1135, 1135, 42, 154, 128, 'Et ratione et.', '1563572972', 1),
(1136, 1136, 16, 149, 50, 'Ut.', '1563572972', 1),
(1137, 1137, 141, 135, 67, 'Pariatur consequuntur.', '1563572972', 1),
(1138, 1138, 162, 56, 21, 'Modi voluptas sed voluptas.', '1563572972', 1);
INSERT INTO `messages` (`id`, `messageId`, `userId`, `fromId`, `toId`, `messageText`, `dateSent`, `enable_reply`) VALUES
(1139, 1139, 161, 70, 87, 'Atque rerum ut ut consectetur.', '1563572972', 0),
(1140, 1140, 153, 161, 80, 'Vel odit et iste qui.', '1563572972', 0),
(1141, 1141, 4, 35, 172, 'Voluptatem sapiente.', '1563572972', 0),
(1142, 1142, 165, 69, 2, 'Eum consequuntur autem.', '1563572972', 0),
(1143, 1143, 26, 53, 48, 'Qui quam.', '1563572972', 0),
(1145, 1145, 176, 57, 61, 'Eveniet sit consectetur voluptatem.', '1563572972', 0),
(1147, 1147, 18, 34, 155, 'Facere et sit quod.', '1563572972', 0),
(1148, 1148, 138, 89, 56, 'Qui magnam ea dolores.', '1563572972', 0),
(1149, 1149, 39, 31, 74, 'Est iure.', '1563572972', 1),
(1150, 1150, 147, 36, 20, 'In atque in neque.', '1563572972', 1),
(1151, 1151, 169, 79, 79, 'Voluptas et eum occaecati.', '1563572972', 0),
(1152, 1152, 69, 13, 16, 'Praesentium quas.', '1563572972', 1),
(1153, 1153, 60, 132, 165, 'Odio eum suscipit ullam.', '1563572972', 0),
(1154, 1154, 135, 48, 57, 'Eum est.', '1563572972', 1),
(1155, 1155, 138, 126, 149, 'Sint laudantium.', '1563572972', 0),
(1156, 1156, 50, 43, 68, 'Qui quia doloremque.', '1563572972', 0),
(1158, 1158, 64, 21, 67, 'Eum quos ea quibusdam aliquid totam.', '1563572972', 0),
(1159, 1159, 24, 157, 55, 'Dignissimos rerum consequatur.', '1563572972', 0),
(1161, 1161, 37, 9, 39, 'Dignissimos magni nesciunt.', '1563572972', 1),
(1162, 1162, 169, 16, 46, 'Eos ad.', '1563572972', 1),
(1164, 1164, 82, 171, 104, 'Voluptatem assumenda ut neque.', '1563572972', 1),
(1165, 1165, 33, 56, 38, 'Optio magnam molestiae ut sed.', '1563572972', 0),
(1166, 1166, 134, 132, 165, 'Fugiat non velit repudiandae ipsum.', '1563572972', 1),
(1168, 1168, 102, 46, 132, 'Libero dolores molestiae.', '1563572972', 1),
(1169, 1169, 66, 147, 17, 'Harum fuga ut aspernatur.', '1563572972', 1),
(1172, 1172, 145, 70, 76, 'Fugiat velit porro.', '1563572972', 1),
(1173, 1173, 173, 7, 13, 'Aut beatae et voluptatibus.', '1563572972', 0),
(1174, 1174, 19, 169, 76, 'Est facere.', '1563572972', 1),
(1175, 1175, 142, 16, 12, 'Quae sit ipsum quod.', '1563572972', 0),
(1177, 1177, 54, 137, 48, 'Voluptatem maiores provident quia voluptatum.', '1563572972', 1),
(1178, 1178, 44, 57, 78, 'Architecto est inventore.', '1563572972', 1),
(1179, 1179, 95, 16, 21, 'Nam neque.', '1563572972', 1),
(1180, 1180, 159, 2, 94, 'Placeat eaque cupiditate.', '1563572972', 0),
(1181, 1181, 140, 153, 103, 'Aut qui quas magni.', '1563572972', 0),
(1182, 1182, 172, 33, 16, 'Ratione accusamus aut ducimus.', '1563572972', 0),
(1183, 1183, 136, 51, 131, 'Voluptas.', '1563572972', 1),
(1185, 1185, 34, 75, 16, 'Iste.', '1563572972', 0),
(1188, 1188, 90, 77, 98, 'Earum sed quis dolor.', '1563572973', 1),
(1189, 1189, 87, 97, 25, 'Doloremque excepturi eos et.', '1563572973', 1),
(1190, 1190, 151, 143, 35, 'Itaque quidem quae libero rerum.', '1563572973', 0),
(1191, 1191, 130, 63, 137, 'Unde ut sit eos dolores.', '1563572973', 0),
(1193, 1193, 147, 72, 152, 'Ad maiores asperiores.', '1563572973', 1),
(1195, 1195, 26, 82, 73, 'Est.', '1563572973', 1),
(1197, 1197, 171, 41, 38, 'At adipisci et incidunt.', '1563572973', 1),
(1198, 1198, 4, 21, 104, 'Eveniet aut quibusdam est.', '1563572973', 1),
(1199, 1199, 166, 158, 62, 'Quisquam a iste dolores repellat nam.', '1563572973', 1),
(1200, 1200, 95, 166, 160, 'Perspiciatis omnis ad maxime.', '1563572973', 0),
(1201, 1201, 146, 141, 136, 'Quia harum sed in.', '1563572973', 0),
(1204, 1204, 161, 51, 29, 'Quia.', '1563572973', 0),
(1205, 1205, 159, 138, 152, 'Temporibus quasi vel.', '1563572973', 0),
(1206, 1206, 130, 7, 72, 'Voluptates quae laboriosam velit esse.', '1563572973', 0),
(1207, 1207, 73, 166, 15, 'Et quis eum.', '1563572973', 0),
(1208, 1208, 160, 98, 161, 'Aut necessitatibus cupiditate vitae.', '1563572973', 1),
(1209, 1209, 170, 99, 52, 'Ducimus autem.', '1563572973', 0),
(1210, 1210, 101, 71, 169, 'Recusandae consequatur.', '1563572973', 0),
(1211, 1211, 22, 82, 133, 'Tempora a sint nihil maiores.', '1563572973', 1),
(1212, 1212, 166, 140, 66, 'Qui natus molestias iste.', '1563572973', 1),
(1213, 1213, 31, 97, 65, 'Ratione laborum odit.', '1563572973', 0),
(1214, 1214, 143, 30, 143, 'Esse et eveniet veritatis.', '1563572973', 0),
(1215, 1215, 3, 165, 9, 'Dolorem consectetur quibusdam.', '1563572973', 0),
(1216, 1216, 170, 99, 174, 'Laudantium ad molestias.', '1563572973', 1),
(1217, 1217, 39, 145, 75, 'Sequi quo voluptatem.', '1563572973', 1),
(1218, 1218, 61, 174, 151, 'Repellendus asperiores.', '1563572973', 1),
(1220, 1220, 66, 137, 168, 'Repudiandae nostrum.', '1563572973', 1),
(1221, 1221, 170, 72, 20, 'Ullam amet laboriosam.', '1563572973', 1),
(1222, 1222, 129, 44, 9, 'Non id minus.', '1563572973', 0),
(1223, 1223, 76, 142, 76, 'Enim et et.', '1563572973', 1),
(1224, 1224, 19, 133, 169, 'Est ad sunt.', '1563572973', 1),
(1229, 1229, 92, 27, 57, 'Et voluptatem.', '1563572973', 1),
(1230, 1230, 4, 130, 46, 'Corrupti non enim.', '1563572973', 1),
(1233, 1233, 96, 33, 95, 'Quos quos fuga.', '1563572973', 1),
(1235, 1235, 150, 10, 90, 'Consequatur.', '1563572973', 1),
(1236, 1236, 101, 68, 141, 'Temporibus.', '1563572973', 1),
(1238, 1238, 176, 38, 11, 'Sit.', '1563572973', 0),
(1239, 1239, 63, 61, 90, 'Molestiae nihil illum.', '1563572973', 0),
(1241, 1241, 60, 169, 77, 'Dolorum ipsum.', '1563572973', 1),
(1242, 1242, 60, 101, 81, 'Maxime cum.', '1563572973', 0),
(1243, 1243, 76, 9, 10, 'Repudiandae ut eligendi at.', '1563572973', 0),
(1244, 1244, 90, 25, 162, 'Quia quos error quo eaque.', '1563572973', 1),
(1245, 1245, 164, 141, 35, 'Necessitatibus quae libero.', '1563572973', 0),
(1246, 1246, 50, 15, 56, 'Nihil et omnis.', '1563572973', 1),
(1247, 1247, 67, 166, 68, 'Libero facilis.', '1563572973', 1),
(1248, 1248, 153, 70, 164, 'Tenetur magnam dolore maxime non.', '1563572973', 0),
(1249, 1249, 100, 148, 126, 'Qui qui delectus quidem iusto.', '1563572973', 1),
(1252, 1252, 40, 90, 46, 'Suscipit libero.', '1563572973', 1),
(1253, 1253, 16, 70, 176, 'Itaque.', '1563572973', 0),
(1256, 1256, 42, 44, 80, 'Doloribus sequi aliquam quibusdam cumque.', '1563572973', 0),
(1257, 1257, 137, 76, 32, 'Consequatur temporibus qui culpa tenetur.', '1563572973', 0),
(1258, 1258, 27, 176, 142, 'Molestiae sunt.', '1563572973', 0),
(1259, 1259, 147, 129, 159, 'Sunt.', '1563572973', 0),
(1260, 1260, 164, 171, 131, 'Eos modi.', '1563572973', 0),
(1261, 1261, 169, 137, 33, 'Sit eos perspiciatis et consequuntur animi.', '1563572973', 1),
(1262, 1262, 34, 138, 147, 'Veritatis sed eos quam.', '1563572973', 1),
(1268, 1268, 14, 176, 153, 'Dolor beatae.', '1563572973', 0),
(1269, 1269, 11, 27, 127, 'Architecto possimus aut.', '1563572973', 1),
(1270, 1270, 92, 128, 24, 'Quam vero dolores.', '1563572973', 1),
(1271, 1271, 53, 51, 166, 'Et aperiam.', '1563572973', 1),
(1273, 1273, 147, 174, 9, 'Aut.', '1563572973', 1),
(1274, 1274, 90, 23, 89, 'Laudantium id nihil optio.', '1563572973', 1),
(1275, 1275, 64, 153, 97, 'Repellat recusandae pariatur veniam est qui.', '1563572973', 1),
(1278, 1278, 94, 156, 99, 'Et id.', '1563572973', 1),
(1283, 1283, 163, 15, 132, 'Consequatur.', '1563572974', 1),
(1284, 1284, 27, 81, 58, 'Fugiat quod voluptas.', '1563572974', 1),
(1285, 1285, 47, 47, 88, 'Repellendus.', '1563572974', 0),
(1286, 1286, 23, 16, 8, 'Velit pariatur.', '1563572974', 0),
(1287, 1287, 141, 92, 18, 'Recusandae placeat doloremque deleniti amet.', '1563572974', 1),
(1288, 1288, 58, 33, 78, 'Eaque eos.', '1563572974', 0),
(1289, 1289, 84, 11, 152, 'Commodi quibusdam id explicabo quae id.', '1563572974', 1),
(1290, 1290, 99, 17, 144, 'Itaque adipisci sed veritatis.', '1563572974', 0),
(1292, 1292, 159, 19, 173, 'Veritatis rerum voluptatem eaque.', '1563572974', 0),
(1293, 1293, 130, 87, 173, 'Autem omnis modi.', '1563572974', 0),
(1294, 1294, 59, 154, 69, 'Rem optio eius.', '1563572974', 0),
(1295, 1295, 96, 17, 81, 'Aliquid.', '1563572974', 0),
(1298, 1298, 22, 91, 89, 'Quod id rerum possimus.', '1563572974', 0),
(1300, 1300, 29, 94, 84, 'Nostrum numquam rerum.', '1563572974', 1),
(1302, 1302, 164, 145, 95, 'Officia optio est nobis in.', '1563572974', 0),
(1303, 1303, 52, 69, 27, 'Quia accusantium officia possimus non.', '1563572974', 1),
(1304, 1304, 145, 69, 24, 'Repudiandae voluptatum.', '1563572974', 1),
(1305, 1305, 148, 73, 147, 'Consectetur ut sed.', '1563572974', 0),
(1306, 1306, 135, 131, 7, 'Id est aliquid consequatur numquam.', '1563572974', 0),
(1307, 1307, 88, 14, 93, 'Eligendi non ipsam.', '1563572974', 0),
(1311, 1311, 90, 73, 27, 'Iure vel omnis necessitatibus.', '1563572974', 0),
(1312, 1312, 129, 25, 101, 'Sint qui modi saepe ipsa.', '1563572974', 1),
(1313, 1313, 131, 145, 68, 'Cumque quis molestias.', '1563572974', 1),
(1314, 1314, 88, 95, 34, 'Et ullam totam saepe.', '1563572974', 0),
(1316, 1316, 166, 48, 138, 'Cumque non.', '1563572974', 0),
(1317, 1317, 152, 45, 138, 'Quod est.', '1563572974', 0),
(1319, 1319, 44, 53, 16, 'Optio qui ea.', '1563572974', 0),
(1320, 1320, 166, 21, 27, 'Ut suscipit.', '1563572974', 1),
(1322, 1322, 11, 67, 141, 'Maxime aut in ut.', '1563572974', 1),
(1324, 1324, 168, 6, 91, 'Omnis odit quas.', '1563572974', 0),
(1327, 1327, 161, 100, 91, 'Aut ex.', '1563572974', 1),
(1329, 1329, 33, 38, 150, 'Ex odio quis.', '1563572974', 1),
(1336, 1336, 73, 29, 36, 'Et impedit inventore.', '1563572974', 1),
(1337, 1337, 48, 143, 25, 'Sed qui corporis dolores quaerat.', '1563572974', 0),
(1339, 1339, 34, 161, 137, 'Impedit odit.', '1563572974', 0),
(1340, 1340, 39, 149, 8, 'Laudantium nam explicabo.', '1563572974', 0),
(1341, 1341, 161, 80, 101, 'Similique molestiae eius.', '1563572974', 0),
(1344, 1344, 31, 66, 36, 'Voluptatem delectus quo ullam rerum.', '1563572974', 1),
(1347, 1347, 39, 104, 102, 'Id.', '1563572974', 1),
(1348, 1348, 77, 167, 59, 'Saepe minima illo.', '1563572974', 1),
(1349, 1349, 153, 171, 163, 'Repudiandae perspiciatis.', '1563572974', 1),
(1352, 1352, 52, 59, 79, 'Quidem dolores.', '1563572974', 0),
(1353, 1353, 94, 19, 48, 'Vel.', '1563572974', 0),
(1356, 1356, 15, 46, 3, 'Cupiditate mollitia.', '1563572974', 0),
(1359, 1359, 137, 52, 14, 'Qui voluptatem accusamus facere.', '1563572974', 1),
(1360, 1360, 47, 143, 161, 'Rerum voluptatem et repellendus qui.', '1563572974', 1),
(1363, 1363, 66, 32, 20, 'Ducimus numquam omnis.', '1563572974', 0),
(1364, 1364, 71, 13, 154, 'Ullam sit aliquid.', '1563572974', 0),
(1365, 1365, 85, 97, 162, 'Sit quo.', '1563572974', 0),
(1366, 1366, 27, 37, 175, 'Ad numquam.', '1563572974', 0),
(1367, 1367, 146, 8, 104, 'Enim esse.', '1563572974', 1),
(1368, 1368, 166, 69, 60, 'Nam maiores.', '1563572974', 1),
(1370, 1370, 144, 169, 56, 'Molestiae quos est iusto impedit praesentium.', '1563572974', 1),
(1371, 1371, 5, 149, 161, 'Voluptas illo nulla nam cupiditate.', '1563572974', 1),
(1373, 1373, 100, 77, 28, 'Unde cupiditate asperiores fuga cum.', '1563572974', 1),
(1376, 1376, 144, 61, 51, 'Cumque culpa sit qui.', '1563572974', 0),
(1377, 1377, 29, 154, 99, 'Cum temporibus.', '1563572974', 0),
(1378, 1378, 49, 8, 176, 'Et nobis.', '1563572974', 1),
(1379, 1379, 44, 147, 33, 'Ex suscipit.', '1563572974', 0),
(1380, 1380, 59, 56, 167, 'Iste.', '1563572974', 1),
(1381, 1381, 55, 73, 66, 'Repudiandae unde.', '1563572974', 0),
(1383, 1383, 98, 41, 43, 'Sed eos ab.', '1563572975', 0),
(1384, 1384, 26, 24, 95, 'Quas illo sit.', '1563572975', 0),
(1386, 1386, 14, 50, 100, 'Quasi rerum.', '1563572975', 1),
(1387, 1387, 23, 23, 146, 'Nisi.', '1563572975', 0),
(1388, 1388, 90, 40, 98, 'Doloribus aut.', '1563572975', 0),
(1389, 1389, 171, 79, 164, 'Inventore non earum quas harum.', '1563572975', 0),
(1391, 1391, 64, 64, 91, 'Suscipit et.', '1563572975', 1),
(1392, 1392, 80, 34, 136, 'Enim quo accusamus.', '1563572975', 0),
(1394, 1394, 1, 95, 169, 'Voluptas.', '1563572975', 0),
(1395, 1395, 59, 139, 77, 'Alias optio consequatur.', '1563572975', 0),
(1397, 1397, 40, 103, 73, 'Quam.', '1563572975', 0),
(1398, 1398, 174, 90, 90, 'Fuga quas error.', '1563572975', 0),
(1399, 1399, 129, 13, 100, 'Ex error optio.', '1563572975', 0),
(1400, 1400, 159, 101, 83, 'Et.', '1563572975', 0),
(1401, 1401, 164, 100, 48, 'Sunt quia ipsa.', '1563572975', 0),
(1405, 1405, 57, 11, 172, 'Itaque aut.', '1563572975', 1),
(1406, 1406, 97, 41, 7, 'Eum voluptatem dolores.', '1563572975', 0),
(1410, 1410, 72, 25, 156, 'Asperiores dolorem qui.', '1563572975', 1),
(1411, 1411, 145, 91, 2, 'Voluptas dignissimos ullam.', '1563572975', 1),
(1412, 1412, 24, 102, 155, 'Eaque.', '1563572975', 1),
(1413, 1413, 165, 25, 76, 'Vitae error neque dolores.', '1563572975', 1),
(1414, 1414, 53, 54, 81, 'Quia.', '1563572975', 1),
(1415, 1415, 31, 85, 48, 'Est voluptatibus dicta hic.', '1563572975', 1),
(1416, 1416, 153, 7, 145, 'Facere natus.', '1563572975', 1),
(1417, 1417, 29, 40, 67, 'Et labore.', '1563572975', 0),
(1420, 1420, 23, 104, 12, 'Ad et.', '1563572975', 0),
(1421, 1421, 6, 73, 162, 'Autem excepturi.', '1563572975', 0),
(1422, 1422, 103, 53, 130, 'Non.', '1563572975', 1),
(1423, 1423, 31, 135, 11, 'Et nam saepe.', '1563572975', 0),
(1424, 1424, 64, 63, 99, 'Nostrum ut deserunt et.', '1563572975', 0),
(1425, 1425, 22, 74, 165, 'Sint magni.', '1563572975', 0),
(1428, 1428, 34, 76, 37, 'Omnis id velit et.', '1563572975', 0),
(1429, 1429, 148, 171, 142, 'Quisquam fugiat.', '1563572975', 1),
(1430, 1430, 51, 47, 176, 'Qui laudantium vitae.', '1563572975', 1),
(1432, 1432, 38, 158, 168, 'Quia corporis nihil maxime.', '1563572975', 0),
(1433, 1433, 13, 131, 47, 'Libero nemo.', '1563572975', 0),
(1434, 1434, 21, 69, 98, 'Vero excepturi numquam ut aut.', '1563572975', 0),
(1435, 1435, 17, 50, 134, 'Voluptate.', '1563572975', 1),
(1436, 1436, 45, 172, 142, 'Dolore aspernatur nemo.', '1563572975', 1),
(1437, 1437, 156, 49, 28, 'Maxime esse delectus et quia provident.', '1563572975', 1),
(1438, 1438, 129, 48, 1, 'Non et.', '1563572975', 0),
(1439, 1439, 169, 97, 71, 'Veniam facilis.', '1563572975', 1),
(1440, 1440, 132, 91, 56, 'Blanditiis dolores.', '1563572975', 1),
(1442, 1442, 130, 46, 43, 'Vero accusantium.', '1563572975', 0),
(1444, 1444, 144, 146, 54, 'Sed sit.', '1563572975', 1),
(1446, 1446, 153, 60, 31, 'Inventore fuga voluptatem sint.', '1563572975', 0),
(1447, 1447, 136, 66, 25, 'Pariatur ullam soluta.', '1563572975', 0),
(1448, 1448, 64, 56, 64, 'Dignissimos cupiditate et aliquam.', '1563572975', 1),
(1449, 1449, 63, 84, 144, 'Beatae provident ut.', '1563572975', 0),
(1450, 1450, 150, 56, 175, 'Dolorem.', '1563572975', 1),
(1452, 1452, 54, 48, 78, 'Est doloribus.', '1563572975', 0),
(1454, 1454, 54, 24, 172, 'Quia quisquam doloremque.', '1563572975', 0),
(1455, 1455, 61, 39, 126, 'Ad.', '1563572975', 1),
(1456, 1456, 91, 92, 99, 'Harum.', '1563572975', 1),
(1459, 1459, 57, 127, 100, 'Magnam laboriosam natus.', '1563572975', 1),
(1462, 1462, 96, 132, 9, 'Id ipsa.', '1563572975', 1),
(1463, 1463, 150, 148, 37, 'Impedit cupiditate quia.', '1563572975', 1),
(1464, 1464, 69, 169, 141, 'Aut nihil.', '1563572975', 0),
(1465, 1465, 11, 73, 19, 'Eligendi.', '1563572975', 1),
(1466, 1466, 73, 62, 7, 'Ut quis non iure.', '1563572975', 1),
(1467, 1467, 33, 8, 162, 'Et itaque.', '1563572975', 1),
(1469, 1469, 44, 19, 88, 'Est voluptatem temporibus.', '1563572975', 1),
(1472, 1472, 130, 70, 48, 'Sunt et asperiores aut.', '1563572975', 1),
(1473, 1473, 101, 150, 98, 'Rerum ut voluptatem.', '1563572975', 0),
(1474, 1474, 60, 159, 59, 'Debitis est sit temporibus quia quia.', '1563572976', 1),
(1475, 1475, 126, 7, 102, 'Voluptatibus mollitia ex.', '1563572976', 0),
(1478, 1478, 157, 77, 15, 'Et dolorem quasi.', '1563572976', 0),
(1480, 1480, 6, 31, 132, 'Voluptatem molestiae corporis.', '1563572976', 1),
(1481, 1481, 153, 26, 126, 'Voluptas quod voluptatem.', '1563572976', 0),
(1482, 1482, 126, 94, 40, 'Facilis quas et laborum.', '1563572976', 0),
(1484, 1484, 104, 76, 32, 'Sit voluptatem.', '1563572976', 1),
(1485, 1485, 84, 52, 39, 'Qui quia omnis quasi ea.', '1563572976', 1),
(1486, 1486, 17, 61, 154, 'Architecto porro.', '1563572976', 1),
(1487, 1487, 11, 81, 3, 'Voluptatem voluptatem suscipit.', '1563572976', 1),
(1491, 1491, 22, 102, 163, 'Magni sint iure adipisci.', '1563572976', 1),
(1493, 1493, 18, 132, 74, 'Ea iure.', '1563572976', 1),
(1494, 1494, 13, 24, 168, 'Vel.', '1563572976', 0),
(1496, 1496, 27, 169, 65, 'Harum rerum.', '1563572976', 0),
(1497, 1497, 10, 158, 27, 'Vitae doloremque.', '1563572976', 1),
(1501, 1501, 1, 53, 40, 'Minus voluptas quia.', '1563572976', 0),
(1503, 1503, 165, 130, 87, 'Nostrum.', '1563572976', 0),
(1507, 1507, 84, 33, 47, 'Quod occaecati.', '1563572976', 0),
(1508, 1508, 80, 73, 73, 'Excepturi autem cupiditate sequi.', '1563572976', 0),
(1509, 1509, 149, 91, 43, 'Voluptate hic suscipit aspernatur.', '1563572976', 0),
(1510, 1510, 171, 73, 98, 'Occaecati aperiam pariatur.', '1563572976', 1),
(1511, 1511, 32, 63, 176, 'Sed.', '1563572976', 1),
(1513, 1513, 53, 93, 39, 'Explicabo eos illum cumque.', '1563572976', 1),
(1514, 1514, 142, 4, 163, 'Et.', '1563572976', 0),
(1515, 1515, 35, 19, 34, 'Numquam rerum dignissimos ut optio.', '1563572976', 1),
(1516, 1516, 80, 132, 72, 'Perferendis eum velit.', '1563572976', 1),
(1518, 1518, 153, 89, 12, 'Eum.', '1563572976', 1),
(1519, 1519, 25, 174, 175, 'Cupiditate sed.', '1563572976', 1),
(1520, 1520, 82, 38, 147, 'Numquam rerum.', '1563572976', 0),
(1521, 1521, 155, 128, 167, 'Aut ipsam quia.', '1563572976', 0),
(1523, 1523, 99, 159, 138, 'Rerum laudantium.', '1563572976', 0),
(1526, 1526, 157, 144, 133, 'Consequatur.', '1563572976', 0),
(1527, 1527, 49, 157, 91, 'Error.', '1563572976', 1),
(1529, 1529, 83, 18, 37, 'Vitae voluptas tempora vel.', '1563572976', 1),
(1530, 1530, 128, 58, 35, 'Non nesciunt et.', '1563572976', 1),
(1532, 1532, 151, 3, 1, 'Optio aspernatur.', '1563572976', 1),
(1533, 1533, 34, 146, 88, 'Dicta cum.', '1563572976', 0),
(1534, 1534, 48, 151, 53, 'Vero est consequatur sequi vel.', '1563572976', 0),
(1536, 1536, 36, 65, 129, 'Omnis minus quia.', '1563572976', 0),
(1537, 1537, 170, 127, 36, 'Molestiae aut.', '1563572976', 0),
(1539, 1539, 48, 32, 85, 'Doloribus molestiae quisquam dolor.', '1563572976', 0),
(1541, 1541, 154, 65, 29, 'Aut non aspernatur odit.', '1563572976', 0),
(1542, 1542, 45, 2, 98, 'Perferendis.', '1563572976', 0),
(1547, 1547, 100, 99, 59, 'Eos.', '1563572976', 1),
(1548, 1548, 34, 44, 176, 'Mollitia nisi.', '1563572976', 0),
(1549, 1549, 149, 17, 173, 'Eaque.', '1563572976', 0),
(1550, 1550, 130, 42, 90, 'Velit eius facilis consequatur.', '1563572976', 0),
(1551, 1551, 47, 16, 161, 'Totam doloribus.', '1563572976', 1),
(1553, 1553, 93, 82, 87, 'Consectetur repudiandae quia.', '1563572976', 0),
(1556, 1556, 144, 73, 30, 'Voluptas occaecati eos at vitae est.', '1563572976', 1),
(1557, 1557, 168, 133, 157, 'Laborum.', '1563572977', 1),
(1558, 1558, 150, 149, 70, 'Dolores magnam.', '1563572977', 0),
(1559, 1559, 156, 142, 137, 'Sequi.', '1563572977', 0),
(1560, 1560, 37, 61, 14, 'Ullam quae et in voluptas eum.', '1563572977', 1),
(1562, 1562, 31, 95, 61, 'Ipsam molestias.', '1563572977', 1),
(1563, 1563, 171, 83, 91, 'Aut consequuntur.', '1563572977', 1),
(1565, 1565, 142, 86, 10, 'Sed omnis.', '1563572977', 0),
(1566, 1566, 20, 89, 40, 'Nobis praesentium.', '1563572977', 1),
(1568, 1568, 19, 99, 126, 'Sunt.', '1563572977', 0),
(1570, 1570, 151, 80, 139, 'Nobis quibusdam sequi.', '1563572977', 1),
(1572, 1572, 98, 57, 71, 'Fugiat quis.', '1563572977', 1),
(1573, 1573, 170, 59, 58, 'Ut et.', '1563572977', 0),
(1574, 1574, 45, 70, 47, 'Modi magni sit ut hic.', '1563572977', 1),
(1577, 1577, 52, 170, 144, 'Itaque est accusamus dolores.', '1563572977', 0),
(1578, 1578, 158, 13, 42, 'Sed nobis.', '1563572977', 0),
(1579, 1579, 166, 63, 91, 'Voluptas vitae ut.', '1563572977', 0),
(1580, 1580, 158, 67, 127, 'Non.', '1563572977', 1),
(1581, 1581, 93, 172, 101, 'Occaecati.', '1563572977', 0),
(1582, 1582, 130, 85, 58, 'Ea.', '1563572977', 1),
(1583, 1583, 88, 128, 16, 'Possimus odit nisi.', '1563572977', 0),
(1584, 1584, 19, 89, 79, 'Qui.', '1563572977', 0),
(1585, 1585, 94, 156, 5, 'Et rem quo.', '1563572977', 1),
(1586, 1586, 92, 157, 89, 'Autem facilis enim maiores eligendi.', '1563572977', 0),
(1588, 1588, 164, 142, 30, 'Quia.', '1563572977', 0),
(1589, 1589, 104, 148, 132, 'Minima officiis optio sed qui.', '1563572977', 0),
(1590, 1590, 10, 127, 159, 'Magnam voluptatem dolores.', '1563572977', 0),
(1591, 1591, 126, 163, 13, 'Earum beatae officia.', '1563572977', 1),
(1592, 1592, 50, 169, 129, 'Laudantium est.', '1563572977', 0),
(1593, 1593, 21, 126, 166, 'Rerum et.', '1563572977', 0),
(1595, 1595, 44, 153, 161, 'Fuga quam consequatur.', '1563572977', 1),
(1597, 1597, 137, 94, 90, 'Dolores doloremque qui vel.', '1563572977', 1),
(1598, 1598, 64, 16, 155, 'Assumenda dolore beatae.', '1563572977', 1),
(1599, 1599, 91, 76, 35, 'Velit a delectus velit.', '1563572977', 0),
(1600, 1600, 60, 24, 40, 'Odio pariatur sequi inventore.', '1563572977', 0),
(1601, 1601, 32, 100, 166, 'Ut veniam voluptates.', '1563572977', 0),
(1602, 1602, 13, 54, 166, 'Excepturi corrupti.', '1563572977', 0),
(1605, 1605, 139, 138, 49, 'Eaque dolor voluptatem in ut ducimus.', '1563572977', 0),
(1607, 1607, 51, 6, 70, 'Ut laudantium molestias modi amet.', '1563572977', 1),
(1609, 1609, 34, 70, 5, 'Dignissimos non.', '1563572977', 0),
(1610, 1610, 127, 102, 34, 'Eum et sed qui dolor sed.', '1563572977', 0),
(1612, 1612, 131, 6, 78, 'Tenetur eum quam molestiae quibusdam.', '1563572977', 0),
(1613, 1613, 138, 168, 28, 'Atque et et.', '1563572977', 0),
(1614, 1614, 19, 167, 63, 'Voluptas quod.', '1563572977', 1),
(1615, 1615, 47, 72, 161, 'Id sint libero.', '1563572977', 1),
(1618, 1618, 126, 96, 101, 'Consectetur quaerat non est.', '1563572977', 1),
(1620, 1620, 145, 56, 138, 'Expedita itaque.', '1563572977', 0),
(1621, 1621, 54, 49, 75, 'Consequuntur eveniet vel ut.', '1563572977', 0),
(1622, 1622, 10, 174, 165, 'Odio rerum qui.', '1563572977', 0),
(1623, 1623, 88, 62, 75, 'Quia delectus.', '1563572977', 0),
(1624, 1624, 87, 154, 92, 'Est non nam ab.', '1563572977', 0),
(1625, 1625, 138, 67, 59, 'Temporibus cupiditate sit est.', '1563572977', 1),
(1626, 1626, 168, 3, 71, 'Culpa et facilis recusandae.', '1563572977', 1),
(1627, 1627, 171, 167, 100, 'Ab quo ut.', '1563572977', 0),
(1628, 1628, 100, 31, 53, 'Odit.', '1563572977', 0),
(1629, 1629, 103, 78, 30, 'Iste placeat impedit quaerat et.', '1563572977', 0),
(1630, 1630, 48, 22, 130, 'Ipsam non occaecati consequatur saepe.', '1563572977', 1),
(1633, 1633, 56, 170, 9, 'Magni unde.', '1563572977', 1),
(1634, 1634, 26, 66, 135, 'Reiciendis id ea.', '1563572977', 0),
(1635, 1635, 33, 136, 60, 'Sunt minus blanditiis.', '1563572977', 1),
(1636, 1636, 79, 28, 173, 'A aut.', '1563572977', 0),
(1637, 1637, 128, 32, 104, 'Eos.', '1563572978', 1),
(1638, 1638, 13, 91, 49, 'Quo sunt ratione.', '1563572978', 1),
(1639, 1639, 135, 147, 139, 'Omnis aut soluta.', '1563572978', 1),
(1640, 1640, 154, 102, 80, 'Fugiat veniam et.', '1563572978', 0),
(1642, 1642, 97, 80, 35, 'Dolore repudiandae et voluptatem.', '1563572978', 0),
(1644, 1644, 50, 2, 139, 'Ullam.', '1563572978', 0),
(1645, 1645, 141, 101, 34, 'Sunt voluptas nisi.', '1563572978', 1),
(1647, 1647, 90, 13, 133, 'Saepe quas.', '1563572978', 1),
(1648, 1648, 41, 53, 57, 'Voluptatum et.', '1563572978', 1),
(1649, 1649, 88, 38, 74, 'Ad repellat quaerat magni numquam.', '1563572978', 0),
(1650, 1650, 29, 77, 54, 'Sunt ipsa maxime non officiis.', '1563572978', 1),
(1651, 1651, 163, 57, 3, 'Soluta libero facilis illum.', '1563572978', 0),
(1652, 1652, 73, 4, 176, 'Qui quia.', '1563572978', 1),
(1653, 1653, 77, 142, 54, 'Dicta ut maiores itaque aut.', '1563572978', 0),
(1655, 1655, 67, 54, 99, 'Odio id facere minus exercitationem deserunt.', '1563572978', 0),
(1656, 1656, 90, 82, 91, 'Sunt provident.', '1563572978', 1),
(1657, 1657, 102, 64, 49, 'Modi asperiores fuga architecto.', '1563572978', 1),
(1658, 1658, 156, 139, 61, 'Autem aut est odit.', '1563572978', 1),
(1660, 1660, 163, 40, 73, 'Ipsam.', '1563572978', 1),
(1661, 1661, 174, 79, 33, 'Iusto saepe.', '1563572978', 1),
(1665, 1665, 2, 10, 133, 'Sapiente sunt.', '1563572978', 0),
(1666, 1666, 144, 48, 157, 'Ipsum ab.', '1563572978', 1),
(1668, 1668, 52, 96, 56, 'Nisi.', '1563572978', 0),
(1669, 1669, 171, 103, 86, 'Eum voluptas autem rerum.', '1563572978', 0),
(1670, 1670, 6, 80, 35, 'Qui ut non.', '1563572978', 0),
(1671, 1671, 150, 129, 143, 'Natus aliquid sed totam odit.', '1563572978', 0),
(1672, 1672, 173, 73, 88, 'Quia rerum odit nobis.', '1563572978', 1),
(1673, 1673, 148, 3, 75, 'Eos placeat error.', '1563572978', 0),
(1675, 1675, 12, 56, 91, 'Dolores consequatur.', '1563572978', 1),
(1676, 1676, 127, 35, 23, 'Ex.', '1563572978', 1),
(1677, 1677, 28, 87, 38, 'Et inventore adipisci et.', '1563572978', 0),
(1678, 1678, 153, 137, 161, 'Reiciendis quod maiores.', '1563572978', 1),
(1679, 1679, 16, 21, 149, 'Aut rem.', '1563572978', 0),
(1681, 1681, 76, 163, 150, 'Enim.', '1563572978', 0),
(1682, 1682, 129, 96, 99, 'Et qui.', '1563572978', 0),
(1683, 1683, 167, 81, 157, 'Aspernatur nulla deserunt sed.', '1563572978', 1),
(1684, 1684, 35, 79, 127, 'Occaecati adipisci.', '1563572978', 0),
(1685, 1685, 1, 33, 149, 'Voluptatem molestiae ex.', '1563572978', 1),
(1686, 1686, 56, 57, 36, 'Consequatur vel.', '1563572978', 1),
(1691, 1691, 128, 39, 51, 'Ut ut.', '1563572978', 0),
(1693, 1693, 43, 1, 126, 'Et quaerat eius repellat.', '1563572978', 1),
(1694, 1694, 25, 144, 157, 'Amet velit a molestias cum.', '1563572978', 1),
(1695, 1695, 169, 97, 102, 'Repellat quo.', '1563572978', 1),
(1696, 1696, 3, 168, 169, 'Sunt vel omnis ut veritatis voluptas.', '1563572978', 1),
(1698, 1698, 141, 5, 57, 'Perferendis cum.', '1563572978', 1),
(1699, 1699, 66, 95, 46, 'Odio fugiat.', '1563572978', 1),
(1700, 1700, 13, 15, 161, 'Error accusantium provident dolore.', '1563572978', 1),
(1701, 1701, 72, 133, 39, 'In velit beatae.', '1563572978', 1),
(1702, 1702, 90, 137, 2, 'Maiores.', '1563572978', 0),
(1703, 1703, 12, 63, 64, 'Perferendis eum qui.', '1563572978', 0),
(1705, 1705, 102, 44, 80, 'Alias nihil ad.', '1563572978', 0),
(1706, 1706, 60, 10, 144, 'Quam sed dolores exercitationem.', '1563572978', 1),
(1707, 1707, 58, 16, 83, 'Ad est.', '1563572978', 1),
(1708, 1708, 82, 63, 147, 'Ut quibusdam voluptatem.', '1563572978', 1),
(1709, 1709, 33, 85, 12, 'Perferendis enim.', '1563572978', 1),
(1711, 1711, 104, 39, 70, 'Sint soluta enim in.', '1563572978', 1),
(1712, 1712, 52, 150, 164, 'Ut et.', '1563572978', 1),
(1713, 1713, 101, 85, 39, 'Molestiae molestiae omnis ab.', '1563572978', 1),
(1714, 1714, 10, 32, 131, 'Placeat ducimus dolor omnis.', '1563572978', 0),
(1715, 1715, 41, 67, 164, 'Dolores enim odio quo.', '1563572978', 1),
(1716, 1716, 73, 5, 26, 'Perferendis impedit nesciunt ipsam deleniti.', '1563572978', 1),
(1717, 1717, 58, 100, 103, 'Ducimus perferendis aut.', '1563572978', 0),
(1718, 1718, 22, 1, 23, 'Voluptatum molestiae.', '1563572978', 1),
(1719, 1719, 142, 13, 78, 'Aut ex dignissimos harum.', '1563572978', 0),
(1720, 1720, 41, 132, 36, 'Magni ipsum consequatur.', '1563572978', 0),
(1722, 1722, 146, 58, 5, 'A optio perspiciatis.', '1563572978', 0),
(1723, 1723, 80, 87, 32, 'Consequatur libero ipsum facilis ea.', '1563572978', 0),
(1724, 1724, 165, 144, 32, 'Aspernatur aut.', '1563572978', 0),
(1725, 1725, 169, 29, 145, 'Voluptas est.', '1563572978', 1),
(1726, 1726, 148, 79, 171, 'Et.', '1563572978', 0),
(1729, 1729, 77, 45, 69, 'Illum aliquam quis temporibus.', '1563572978', 0),
(1731, 1731, 60, 26, 82, 'Labore earum.', '1563572978', 1),
(1732, 1732, 77, 42, 19, 'Non eos numquam incidunt voluptas.', '1563572979', 1),
(1733, 1733, 173, 43, 126, 'Reprehenderit tempora dolor.', '1563572979', 1),
(1735, 1735, 136, 175, 139, 'Sunt eveniet pariatur.', '1563572979', 1),
(1736, 1736, 67, 151, 170, 'Dolor ipsa rerum.', '1563572979', 1),
(1737, 1737, 77, 57, 104, 'Sit.', '1563572979', 1),
(1738, 1738, 38, 66, 54, 'Quo nulla eius.', '1563572979', 0),
(1740, 1740, 90, 16, 98, 'Ea.', '1563572979', 1),
(1741, 1741, 59, 16, 127, 'Nihil.', '1563572979', 0),
(1742, 1742, 82, 128, 33, 'Et ea labore.', '1563572979', 0),
(1743, 1743, 94, 141, 95, 'Voluptatem nobis eaque.', '1563572979', 1),
(1744, 1744, 176, 27, 91, 'Beatae.', '1563572979', 0),
(1745, 1745, 170, 91, 167, 'Ut dolorem et sed.', '1563572979', 0),
(1746, 1746, 84, 173, 155, 'Blanditiis vel eveniet molestiae dicta.', '1563572979', 0),
(1747, 1747, 1, 59, 98, 'Et a.', '1563572979', 0),
(1748, 1748, 172, 142, 67, 'Dignissimos.', '1563572979', 1),
(1749, 1749, 48, 127, 93, 'Quia quidem.', '1563572979', 1),
(1750, 1750, 103, 171, 171, 'Facilis quae ut.', '1563572979', 1),
(1751, 1751, 82, 147, 147, 'Ut enim.', '1563572979', 1),
(1752, 1752, 54, 64, 18, 'Dolores.', '1563572979', 0),
(1753, 1753, 162, 82, 137, 'Qui vero velit.', '1563572979', 1),
(1755, 1755, 51, 135, 89, 'Aut ullam tenetur omnis.', '1563572979', 0),
(1757, 1757, 39, 58, 169, 'Facere.', '1563572979', 1),
(1758, 1758, 151, 83, 160, 'Provident libero alias.', '1563572979', 1),
(1759, 1759, 61, 158, 29, 'Sapiente.', '1563572979', 1),
(1760, 1760, 40, 164, 157, 'Ducimus beatae.', '1563572979', 0),
(1761, 1761, 132, 55, 49, 'Velit corporis amet.', '1563572979', 1),
(1762, 1762, 82, 47, 53, 'Tempora illo similique.', '1563572979', 0),
(1763, 1763, 136, 12, 81, 'Autem veniam quidem beatae.', '1563572979', 0),
(1765, 1765, 40, 143, 132, 'At atque unde.', '1563572979', 0),
(1766, 1766, 96, 89, 9, 'Eos ipsa.', '1563572979', 1),
(1767, 1767, 96, 59, 44, 'Consequatur quas.', '1563572979', 0),
(1768, 1768, 49, 7, 3, 'In officiis.', '1563572979', 1),
(1769, 1769, 72, 26, 169, 'Accusamus earum rem.', '1563572979', 1),
(1770, 1770, 96, 72, 95, 'Tenetur beatae assumenda est.', '1563572979', 0),
(1771, 1771, 37, 40, 47, 'Est dolor officia fuga.', '1563572979', 1),
(1772, 1772, 62, 93, 74, 'Odit excepturi.', '1563572979', 0),
(1773, 1773, 132, 20, 31, 'Perferendis et.', '1563572979', 1),
(1774, 1774, 100, 134, 86, 'Illum corrupti.', '1563572979', 1),
(1775, 1775, 132, 14, 9, 'Quis autem.', '1563572979', 0),
(1776, 1776, 96, 58, 170, 'Voluptatem neque asperiores aperiam.', '1563572979', 1),
(1778, 1778, 63, 49, 27, 'Ullam quos.', '1563572979', 0),
(1779, 1779, 158, 157, 132, 'Omnis tempore asperiores quidem facere voluptatem.', '1563572979', 1),
(1780, 1780, 147, 160, 147, 'Est voluptas non.', '1563572979', 0),
(1781, 1781, 170, 129, 35, 'Mollitia vel dolor officia doloribus quidem.', '1563572979', 0),
(1783, 1783, 145, 75, 87, 'Distinctio.', '1563572979', 1),
(1784, 1784, 13, 134, 137, 'Nihil laboriosam consequatur sapiente consectetur rem.', '1563572979', 0),
(1785, 1785, 128, 161, 73, 'Vitae tempore dicta qui beatae.', '1563572979', 1),
(1786, 1786, 162, 22, 93, 'Quo architecto.', '1563572979', 0),
(1788, 1788, 16, 167, 77, 'Sunt nulla qui similique veritatis.', '1563572979', 0),
(1789, 1789, 11, 94, 102, 'Eius quisquam expedita.', '1563572979', 0),
(1793, 1793, 45, 74, 97, 'Quia explicabo.', '1563572979', 1),
(1794, 1794, 126, 90, 70, 'Facere repellat quia.', '1563572979', 1),
(1796, 1796, 139, 79, 56, 'Sit dolorem.', '1563572979', 0),
(1798, 1798, 38, 21, 159, 'Aut sed consequatur.', '1563572979', 1),
(1800, 1800, 16, 138, 23, 'Rerum nesciunt.', '1563572979', 0),
(1801, 1801, 21, 156, 73, 'Ex provident eos.', '1563572979', 0),
(1802, 1802, 44, 56, 22, 'Aspernatur vitae.', '1563572979', 1),
(1804, 1804, 80, 2, 40, 'Harum voluptas vero.', '1563572979', 0),
(1806, 1806, 173, 29, 25, 'Saepe vel.', '1563572979', 1),
(1808, 1808, 134, 1, 10, 'Molestiae suscipit.', '1563572979', 0),
(1809, 1809, 145, 104, 69, 'Dolore.', '1563572979', 1),
(1811, 1811, 137, 169, 29, 'Quidem.', '1563572979', 0),
(1812, 1812, 18, 61, 154, 'Repudiandae doloremque adipisci aut.', '1563572979', 1),
(1813, 1813, 28, 38, 78, 'Quia.', '1563572979', 0),
(1814, 1814, 79, 149, 153, 'Quas nostrum aut corporis.', '1563572979', 1),
(1816, 1816, 146, 15, 156, 'Et veritatis sunt.', '1563572979', 1),
(1818, 1818, 39, 15, 1, 'Cum enim.', '1563572979', 1),
(1819, 1819, 176, 81, 72, 'Occaecati ipsam ipsum quia.', '1563572979', 1),
(1821, 1821, 150, 37, 41, 'Impedit esse ut officiis ipsum.', '1563572979', 0),
(1822, 1822, 164, 20, 149, 'Et odit.', '1563572979', 0),
(1825, 1825, 136, 51, 136, 'Incidunt.', '1563572979', 1),
(1826, 1826, 18, 29, 138, 'Laboriosam.', '1563572979', 0),
(1828, 1828, 162, 170, 59, 'Provident assumenda adipisci aut.', '1563572979', 1),
(1830, 1830, 163, 25, 88, 'Quo est id.', '1563572979', 0),
(1834, 1834, 155, 4, 176, 'Recusandae quia ipsum quia.', '1563572979', 1),
(1835, 1835, 173, 44, 96, 'Et.', '1563572979', 0),
(1837, 1837, 48, 94, 102, 'Et officia.', '1563572979', 0),
(1839, 1839, 74, 30, 23, 'Excepturi.', '1563572979', 0),
(1840, 1840, 7, 65, 74, 'Est quia veniam.', '1563572979', 0),
(1841, 1841, 34, 34, 76, 'Veritatis sit voluptatibus ut adipisci qui.', '1563572979', 1),
(1842, 1842, 96, 29, 131, 'Ipsa pariatur consequatur et sit.', '1563572979', 1),
(1843, 1843, 148, 69, 23, 'Eos occaecati neque eum.', '1563572979', 1),
(1844, 1844, 52, 29, 41, 'Voluptate.', '1563572979', 0),
(1846, 1846, 161, 85, 62, 'Voluptates est maiores quasi enim.', '1563572980', 0),
(1847, 1847, 171, 149, 144, 'Vitae quia.', '1563572980', 1),
(1848, 1848, 151, 62, 94, 'Perspiciatis voluptas.', '1563572980', 1),
(1849, 1849, 17, 168, 172, 'Error tenetur.', '1563572980', 0),
(1850, 1850, 39, 140, 36, 'Necessitatibus quasi.', '1563572980', 0),
(1851, 1851, 1, 160, 31, 'Iure atque corporis similique.', '1563572980', 1),
(1852, 1852, 156, 164, 142, 'Enim similique similique.', '1563572980', 1),
(1853, 1853, 41, 44, 19, 'Est vitae sed placeat.', '1563572980', 0),
(1854, 1854, 170, 3, 99, 'Magnam laudantium.', '1563572980', 0),
(1859, 1859, 170, 54, 147, 'Rem qui veritatis ea tempore.', '1563572980', 1),
(1860, 1860, 152, 60, 9, 'Laborum maiores esse voluptatem corporis sit.', '1563572980', 1),
(1862, 1862, 93, 32, 146, 'Praesentium sunt.', '1563572980', 1),
(1865, 1865, 170, 70, 92, 'A.', '1563572980', 1),
(1866, 1866, 143, 72, 174, 'Occaecati sunt.', '1563572980', 0),
(1867, 1867, 77, 148, 64, 'Animi repellendus.', '1563572980', 1),
(1868, 1868, 138, 16, 132, 'Harum aut laborum labore eum.', '1563572980', 0),
(1869, 1869, 20, 69, 31, 'Cum nisi neque necessitatibus corporis voluptatem.', '1563572980', 0),
(1871, 1871, 88, 175, 83, 'Unde architecto.', '1563572980', 0),
(1872, 1872, 129, 28, 77, 'Rerum non hic.', '1563572980', 1),
(1873, 1873, 73, 90, 2, 'Ipsam molestiae repellat.', '1563572980', 1),
(1875, 1875, 44, 155, 31, 'Dolores eveniet.', '1563572980', 0),
(1876, 1876, 102, 130, 44, 'Veritatis ipsum est.', '1563572980', 1),
(1877, 1877, 58, 65, 50, 'Iusto tempora.', '1563572980', 0),
(1878, 1878, 176, 83, 76, 'Est vel velit.', '1563572980', 1),
(1879, 1879, 79, 81, 52, 'Soluta sint eos.', '1563572980', 1),
(1881, 1881, 155, 147, 8, 'Perferendis et libero iusto at.', '1563572980', 1),
(1884, 1884, 52, 57, 83, 'Autem atque sit officiis iste aliquid.', '1563572980', 0),
(1885, 1885, 43, 3, 59, 'Illum voluptatem qui est.', '1563572980', 0),
(1886, 1886, 57, 134, 54, 'Ad fuga sit.', '1563572980', 1),
(1887, 1887, 92, 154, 137, 'Omnis eum exercitationem est neque.', '1563572980', 0),
(1888, 1888, 32, 13, 133, 'Tempore tenetur.', '1563572980', 0),
(1889, 1889, 139, 139, 98, 'Ullam rerum doloremque.', '1563572980', 0),
(1890, 1890, 138, 92, 38, 'Hic enim voluptatem.', '1563572980', 0),
(1893, 1893, 98, 158, 47, 'Optio velit dolores.', '1563572980', 1),
(1894, 1894, 78, 160, 87, 'Veritatis autem.', '1563572980', 1),
(1897, 1897, 33, 146, 42, 'Nemo suscipit.', '1563572980', 1),
(1898, 1898, 99, 92, 30, 'Optio nihil enim debitis dolores.', '1563572980', 1),
(1899, 1899, 31, 63, 23, 'Voluptatum veniam rerum.', '1563572980', 1),
(1900, 1900, 141, 39, 151, 'Ab eveniet.', '1563572980', 1),
(1902, 1902, 71, 28, 84, 'Itaque molestiae et.', '1563572980', 1),
(1903, 1903, 155, 61, 173, 'Odio ea molestias et aperiam.', '1563572980', 0),
(1904, 1904, 12, 29, 156, 'Non corporis.', '1563572980', 1),
(1905, 1905, 167, 78, 36, 'Expedita ipsam.', '1563572980', 1),
(1906, 1906, 172, 169, 29, 'Dignissimos explicabo vero qui provident.', '1563572980', 1),
(1907, 1907, 38, 60, 86, 'Omnis repellat.', '1563572980', 1),
(1908, 1908, 139, 156, 142, 'Blanditiis veritatis dolorem.', '1563572980', 0),
(1909, 1909, 13, 28, 54, 'Voluptatem dolores libero excepturi.', '1563572980', 0),
(1910, 1910, 44, 144, 48, 'Quia itaque.', '1563572980', 1),
(1911, 1911, 58, 130, 155, 'Autem.', '1563572980', 1),
(1912, 1912, 33, 86, 79, 'Fugit quis odio quis.', '1563572980', 1),
(1913, 1913, 75, 175, 42, 'Et sequi.', '1563572980', 0),
(1915, 1915, 6, 164, 152, 'Expedita sequi libero temporibus qui.', '1563572980', 1),
(1918, 1918, 168, 142, 166, 'In.', '1563572980', 0),
(1919, 1919, 157, 91, 74, 'Vel libero eum.', '1563572980', 1),
(1920, 1920, 68, 94, 26, 'Qui labore.', '1563572980', 1),
(1921, 1921, 29, 161, 54, 'Voluptatem exercitationem id perspiciatis eaque.', '1563572980', 1),
(1924, 1924, 90, 130, 44, 'Nostrum quidem.', '1563572981', 0),
(1925, 1925, 75, 16, 162, 'Quis consequatur.', '1563572981', 1),
(1926, 1926, 76, 46, 55, 'Facilis est ut.', '1563572981', 1),
(1927, 1927, 134, 83, 138, 'Autem est.', '1563572981', 1),
(1928, 1928, 156, 45, 158, 'Esse blanditiis aut autem.', '1563572981', 1),
(1929, 1929, 26, 135, 24, 'Qui dolor.', '1563572981', 0),
(1931, 1931, 92, 50, 6, 'Sint illum dolorum.', '1563572981', 1),
(1932, 1932, 144, 26, 32, 'Qui facilis ut in.', '1563572981', 1),
(1934, 1934, 38, 48, 16, 'Quasi placeat aliquam qui voluptate.', '1563572981', 1),
(1935, 1935, 168, 164, 173, 'Ut nemo.', '1563572981', 0),
(1936, 1936, 88, 164, 102, 'Qui commodi voluptas.', '1563572981', 0),
(1937, 1937, 10, 176, 24, 'Quia magnam in sed in.', '1563572981', 1),
(1938, 1938, 145, 44, 15, 'Ut in sed neque.', '1563572981', 1),
(1940, 1940, 46, 18, 98, 'Quo ut praesentium voluptatem eaque.', '1563572981', 0),
(1941, 1941, 80, 137, 151, 'Omnis nihil quaerat.', '1563572981', 1),
(1942, 1942, 42, 64, 176, 'Qui molestiae veritatis adipisci.', '1563572981', 0),
(1943, 1943, 69, 98, 172, 'Beatae minima temporibus.', '1563572981', 1),
(1944, 1944, 33, 150, 132, 'Fuga nobis.', '1563572981', 1),
(1945, 1945, 148, 149, 53, 'Illo facilis.', '1563572981', 1),
(1948, 1948, 36, 45, 161, 'Eum eius mollitia.', '1563572981', 0),
(1950, 1950, 167, 37, 172, 'Nemo qui possimus.', '1563572981', 0),
(1951, 1951, 64, 146, 12, 'Harum odio.', '1563572981', 1),
(1954, 1954, 94, 94, 175, 'Ipsa molestiae laborum maxime.', '1563572981', 1),
(1957, 1957, 156, 140, 18, 'In ipsa.', '1563572981', 0),
(1958, 1958, 128, 136, 141, 'Animi qui.', '1563572981', 0),
(1960, 1960, 62, 91, 83, 'Est.', '1563572981', 1),
(1961, 1961, 34, 149, 129, 'Cum explicabo rerum.', '1563572981', 1),
(1962, 1962, 129, 164, 152, 'Doloremque modi.', '1563572981', 0),
(1963, 1963, 18, 87, 148, 'Dolore odit ut.', '1563572981', 1),
(1964, 1964, 89, 11, 17, 'Omnis qui voluptate praesentium repudiandae repellat.', '1563572981', 0),
(1965, 1965, 19, 22, 57, 'Repellendus qui eum ea itaque.', '1563572981', 1),
(1966, 1966, 28, 15, 64, 'Repellendus.', '1563572981', 1),
(1967, 1967, 5, 171, 14, 'Fugiat voluptatem.', '1563572981', 1),
(1968, 1968, 139, 88, 132, 'Sed sed.', '1563572981', 1),
(1970, 1970, 31, 135, 173, 'Eum ex.', '1563572981', 0),
(1971, 1971, 70, 168, 102, 'Ut et.', '1563572981', 0),
(1972, 1972, 2, 68, 3, 'Ratione.', '1563572981', 0),
(1975, 1975, 170, 97, 104, 'Non.', '1563572981', 0),
(1976, 1976, 98, 104, 140, 'Non.', '1563572981', 0),
(1978, 1978, 39, 56, 48, 'Vel eaque aut.', '1563572981', 1),
(1979, 1979, 21, 154, 16, 'Reprehenderit.', '1563572981', 1),
(1981, 1981, 157, 9, 16, 'Nobis.', '1563572981', 0),
(1982, 1982, 29, 138, 101, 'Ipsam voluptate exercitationem eius nesciunt.', '1563572981', 1),
(1984, 1984, 21, 61, 13, 'Fuga autem asperiores quibusdam aliquam.', '1563572981', 0),
(1988, 1988, 170, 64, 12, 'Quia animi aut qui eveniet qui.', '1563572982', 1),
(1990, 1990, 40, 147, 148, 'Est dolor.', '1563572982', 1),
(1991, 1991, 29, 147, 174, 'Recusandae enim ea distinctio.', '1563572982', 1),
(1992, 1992, 50, 47, 49, 'Voluptatem optio.', '1563572982', 0),
(1994, 1994, 70, 54, 18, 'Veniam impedit repudiandae.', '1563572982', 1),
(1995, 1995, 39, 51, 126, 'Ut sint.', '1563572982', 1),
(1996, 1996, 57, 173, 126, 'Occaecati qui.', '1563572982', 0),
(1998, 1998, 26, 40, 51, 'Id inventore.', '1563572982', 0),
(1999, 1999, 74, 69, 164, 'Et est dolores.', '1563572982', 1),
(2003, 2003, 42, 154, 77, 'Perspiciatis veritatis ducimus eum.', '1563572982', 0),
(2004, 2004, 2, 13, 33, 'Ducimus soluta.', '1563572982', 0),
(2006, 2006, 139, 97, 134, 'Ratione et ut.', '1563572982', 1),
(2007, 2007, 15, 55, 87, 'Voluptatibus harum.', '1563572982', 1),
(2008, 2008, 5, 138, 1, 'Et molestiae rerum.', '1563572982', 1),
(2010, 2010, 103, 172, 24, 'Corporis at.', '1563572982', 0),
(2011, 2011, 100, 67, 158, 'Ut quia ut.', '1563572982', 0),
(2012, 2012, 40, 138, 45, 'Sit pariatur et.', '1563572982', 0),
(2013, 2013, 21, 130, 6, 'Ut blanditiis voluptatem mollitia.', '1563572982', 0),
(2018, 2018, 11, 134, 77, 'Quam porro possimus qui a et.', '1563572982', 0),
(2019, 2019, 56, 32, 27, 'Rerum voluptatem.', '1563572982', 0),
(2020, 2020, 171, 102, 63, 'Aliquid numquam facilis officia sequi est.', '1563572982', 1),
(2021, 2021, 41, 71, 3, 'Consequatur earum hic.', '1563572982', 1),
(2022, 2022, 79, 32, 144, 'Et qui iure.', '1563572982', 1),
(2023, 2023, 88, 19, 149, 'Quas et similique quam.', '1563572982', 1),
(2024, 2024, 149, 161, 92, 'Corporis sapiente debitis error.', '1563572982', 1),
(2025, 2025, 39, 81, 19, 'Minus quidem est.', '1563572982', 1),
(2026, 2026, 16, 133, 95, 'Ut dolorum qui.', '1563572982', 0),
(2033, 2033, 49, 12, 36, 'Doloribus error.', '1563572982', 0),
(2036, 2036, 7, 140, 145, 'Sunt libero est.', '1563572982', 1),
(2037, 2037, 151, 2, 168, 'Molestiae expedita.', '1563572982', 1),
(2038, 2038, 159, 16, 68, 'Voluptatibus magni id.', '1563572982', 0),
(2039, 2039, 32, 103, 57, 'Itaque rerum qui.', '1563572982', 1),
(2041, 2041, 53, 31, 8, 'Adipisci sunt consequatur.', '1563572983', 0),
(2043, 2043, 4, 169, 41, 'Sed qui veniam odit explicabo.', '1563572983', 0),
(2045, 2045, 140, 82, 79, 'Nam voluptas.', '1563572983', 0),
(2046, 2046, 142, 141, 150, 'Maiores recusandae quod.', '1563572983', 1),
(2050, 2050, 163, 76, 130, 'Eum aut.', '1563572984', 0),
(2053, 2053, 1, 14, 136, 'Ab nihil sed.', '1563572984', 0),
(2054, 2054, 16, 41, 137, 'Impedit et quia tempore consequuntur ratione.', '1563572984', 1),
(2055, 2055, 88, 51, 80, 'Adipisci at ea.', '1563572984', 1),
(2056, 2056, 145, 73, 97, 'Explicabo accusantium occaecati ipsam omnis.', '1563572984', 0),
(2057, 2057, 84, 138, 21, 'Veritatis porro.', '1563572984', 0),
(2059, 2059, 65, 158, 77, 'Aut.', '1563572984', 1),
(2060, 2060, 161, 14, 54, 'Officiis modi.', '1563572984', 1),
(2061, 2061, 20, 50, 56, 'Consequatur qui.', '1563572984', 1),
(2062, 2062, 153, 93, 53, 'Nobis.', '1563572984', 1),
(2063, 2063, 37, 10, 145, 'Rerum enim magnam.', '1563572984', 1),
(2064, 2064, 165, 148, 81, 'Assumenda distinctio ad.', '1563572984', 1),
(2065, 2065, 133, 74, 18, 'Enim.', '1563572984', 0),
(2067, 2067, 92, 45, 80, 'Vitae hic aliquid.', '1563572984', 1),
(2068, 2068, 126, 176, 50, 'Non vero et dolores quis.', '1563572984', 0),
(2071, 2071, 18, 39, 168, 'Aut et.', '1563572984', 0),
(2074, 2074, 101, 126, 41, 'Nam ut sequi.', '1563572984', 1),
(2076, 2076, 67, 144, 67, 'Ut.', '1563572984', 1),
(2077, 2077, 48, 153, 170, 'Ea corporis.', '1563572984', 1),
(2078, 2078, 83, 138, 98, 'Expedita enim ratione rerum et.', '1563572984', 1),
(2080, 2080, 46, 47, 95, 'Culpa.', '1563572984', 1),
(2081, 2081, 59, 100, 40, 'Expedita tempore.', '1563572984', 1),
(2082, 2082, 67, 69, 85, 'Quia ratione itaque nostrum.', '1563572984', 1),
(2084, 2084, 152, 76, 175, 'Iste ad.', '1563572985', 0),
(2085, 2085, 34, 155, 166, 'Ut voluptate omnis.', '1563572985', 0),
(2086, 2086, 91, 41, 165, 'Inventore deleniti non beatae dolor explicabo.', '1563572985', 1),
(2087, 2087, 56, 165, 1, 'Consequuntur enim.', '1563572985', 1),
(2088, 2088, 102, 68, 92, 'Id nobis necessitatibus asperiores aut.', '1563572985', 1),
(2089, 2089, 81, 141, 145, 'Non.', '1563572985', 0),
(2090, 2090, 129, 148, 25, 'Quibusdam quis qui odit deleniti.', '1563572985', 1),
(2091, 2091, 98, 17, 51, 'Enim architecto.', '1563572985', 1),
(2093, 2093, 160, 26, 67, 'Quae aperiam.', '1563572985', 1),
(2095, 2095, 140, 50, 142, 'Non ea.', '1563572985', 1),
(2099, 2099, 14, 80, 17, 'Occaecati nulla.', '1563572985', 1),
(2100, 2100, 162, 126, 93, 'Cum incidunt.', '1563572985', 1),
(2104, 2104, 136, 102, 127, 'Fugiat omnis saepe.', '1563572985', 1),
(2105, 2105, 48, 93, 46, 'Dolore deleniti.', '1563572985', 0),
(2108, 2108, 71, 146, 100, 'Dolorem expedita vel.', '1563572985', 0),
(2109, 2109, 61, 13, 139, 'Natus eius aut ullam.', '1563572985', 1),
(2111, 2111, 175, 171, 136, 'Neque dolores.', '1563572985', 0),
(2112, 2112, 2, 75, 59, 'Quibusdam et quia ut quo.', '1563572985', 1),
(2114, 2114, 155, 88, 21, 'Temporibus animi.', '1563572985', 0),
(2115, 2115, 68, 12, 132, 'Vel.', '1563572985', 0),
(2116, 2116, 171, 141, 69, 'Officiis.', '1563572985', 0),
(2118, 2118, 77, 37, 160, 'Et quia quaerat illum sint esse.', '1563572985', 1),
(2120, 2120, 60, 83, 129, 'Quidem omnis error.', '1563572985', 1),
(2121, 2121, 93, 84, 171, 'Voluptatem odit repellendus voluptas modi.', '1563572985', 1),
(2122, 2122, 52, 37, 29, 'Reiciendis praesentium.', '1563572985', 1),
(2123, 2123, 69, 135, 52, 'Quia sint nulla possimus dolorum ea.', '1563572985', 0),
(2124, 2124, 130, 170, 65, 'Rerum porro.', '1563572985', 1),
(2128, 2128, 70, 18, 59, 'Commodi.', '1563572986', 1),
(2129, 2129, 94, 43, 63, 'Voluptas vel consequuntur est exercitationem.', '1563572986', 1),
(2130, 2130, 134, 144, 84, 'Porro eos.', '1563572986', 1),
(2132, 2132, 76, 169, 173, 'Libero repellendus eum.', '1563572986', 1),
(2135, 2135, 24, 71, 63, 'Delectus qui quia.', '1563572986', 0),
(2137, 2137, 84, 42, 170, 'Exercitationem.', '1563572986', 1),
(2138, 2138, 27, 1, 6, 'Porro.', '1563572986', 0),
(2139, 2139, 78, 155, 141, 'Enim praesentium nostrum facere voluptas aut.', '1563572986', 1),
(2141, 2141, 25, 94, 35, 'Voluptatem.', '1563572986', 0),
(2142, 2142, 137, 60, 166, 'Reiciendis quasi cupiditate.', '1563572986', 1),
(2143, 2143, 1, 153, 9, 'Recusandae commodi et.', '1563572986', 0),
(2144, 2144, 176, 32, 81, 'Reprehenderit consequatur non id.', '1563572986', 0),
(2146, 2146, 154, 163, 27, 'Sequi.', '1563572986', 1),
(2147, 2147, 148, 136, 9, 'Fugit cumque voluptate.', '1563572986', 0),
(2148, 2148, 52, 52, 47, 'Quia vitae.', '1563572986', 1),
(2149, 2149, 18, 163, 21, 'Qui qui iusto quo.', '1563572986', 0),
(2151, 2151, 139, 64, 21, 'Ipsam tempora.', '1563572986', 1),
(2152, 2152, 12, 72, 41, 'Ut.', '1563572986', 1),
(2153, 2153, 73, 143, 68, 'In quam dolorum quasi vitae.', '1563572986', 0),
(2154, 2154, 8, 169, 152, 'Est doloribus.', '1563572986', 1),
(2156, 2156, 49, 69, 155, 'Sit nulla aspernatur.', '1563572987', 1),
(2159, 2159, 85, 102, 139, 'Molestiae magni.', '1563572987', 0),
(2160, 2160, 165, 3, 53, 'Vero ut sint omnis.', '1563572987', 1),
(2163, 2163, 174, 90, 9, 'Et ratione id molestiae.', '1563572987', 0),
(2164, 2164, 102, 56, 90, 'Sed culpa fuga.', '1563572987', 1),
(2165, 2165, 31, 88, 96, 'A alias dolorum sit.', '1563572987', 1),
(2166, 2166, 87, 44, 67, 'Eius et.', '1563572987', 0),
(2167, 2167, 91, 27, 80, 'Assumenda tenetur omnis et.', '1563572987', 0),
(2168, 2168, 133, 128, 82, 'Vel optio.', '1563572987', 0),
(2169, 2169, 22, 83, 43, 'Enim et a.', '1563572987', 0),
(2170, 2170, 48, 92, 11, 'Ullam in maiores.', '1563572987', 0),
(2171, 2171, 163, 145, 27, 'Quaerat aspernatur.', '1563572987', 1),
(2172, 2172, 62, 38, 141, 'Rerum sequi dicta magni eaque sed.', '1563572987', 0),
(2173, 2173, 160, 161, 139, 'Harum saepe.', '1563572987', 1),
(2174, 2174, 148, 25, 167, 'Doloremque vel.', '1563572987', 1),
(2175, 2175, 93, 93, 43, 'Dolor sed voluptates quo.', '1563572987', 0),
(2176, 2176, 49, 92, 31, 'Expedita quo aut exercitationem id.', '1563572987', 1),
(2177, 2177, 49, 76, 38, 'Quis pariatur aspernatur non.', '1563572987', 0),
(2178, 2178, 170, 140, 29, 'Molestiae officiis molestiae inventore.', '1563572987', 0),
(2179, 2179, 140, 4, 46, 'Beatae est ab.', '1563572987', 1),
(2181, 2181, 57, 13, 101, 'Laboriosam ad rerum.', '1563572987', 0),
(2182, 2182, 96, 2, 172, 'Rerum ducimus est quam.', '1563572987', 0),
(2183, 2183, 10, 53, 144, 'Nam ea velit.', '1563572987', 1),
(2184, 2184, 86, 165, 33, 'Dolores.', '1563572987', 1),
(2185, 2185, 176, 168, 128, 'Vel repudiandae modi sapiente laboriosam.', '1563572987', 0),
(2186, 2186, 80, 151, 33, 'Tempore sit.', '1563572987', 0),
(2187, 2187, 15, 142, 66, 'Alias non.', '1563572987', 1),
(2189, 2189, 48, 132, 95, 'Temporibus dignissimos repellendus autem.', '1563572987', 0),
(2190, 2190, 151, 89, 80, 'Cum sed doloremque.', '1563572987', 1),
(2191, 2191, 2, 158, 29, 'Expedita in beatae.', '1563572987', 1),
(2192, 2192, 69, 160, 169, 'Ut enim.', '1563572987', 1),
(2193, 2193, 166, 171, 146, 'Et rem ipsa quis incidunt.', '1563572987', 0),
(2194, 2194, 103, 152, 18, 'Nisi qui.', '1563572987', 1),
(2195, 2195, 73, 36, 156, 'Totam dolorem.', '1563572987', 0),
(2196, 2196, 16, 102, 36, 'Sunt consequatur in.', '1563572987', 1),
(2199, 2199, 92, 145, 55, 'Et ut laudantium rerum.', '1563572987', 0),
(2202, 2202, 54, 30, 51, 'Ut excepturi.', '1563572987', 1),
(2205, 2205, 104, 100, 25, 'Laborum.', '1563572987', 1),
(2206, 2206, 137, 141, 40, 'Dolor.', '1563572987', 1),
(2208, 2208, 138, 143, 151, 'Necessitatibus.', '1563572987', 1),
(2209, 2209, 65, 137, 6, 'Perferendis tenetur doloribus dolore.', '1563572987', 0),
(2210, 2210, 5, 138, 159, 'Numquam provident.', '1563572987', 0),
(2211, 2211, 160, 94, 43, 'Quis eos illo adipisci repellat.', '1563572987', 0),
(2212, 2212, 65, 78, 158, 'Est quas harum.', '1563572987', 1),
(2215, 2215, 88, 3, 4, 'Omnis rerum quis et.', '1563572987', 0),
(2216, 2216, 12, 40, 92, 'Atque unde.', '1563572987', 1),
(2217, 2217, 129, 72, 140, 'Velit aut commodi voluptas consectetur officiis.', '1563572987', 1),
(2218, 2218, 21, 163, 138, 'Aut dolores nostrum non.', '1563572987', 0),
(2219, 2219, 51, 42, 7, 'Animi molestiae harum.', '1563572987', 1),
(2223, 2223, 77, 74, 46, 'Et libero sed ab.', '1563572987', 0),
(2224, 2224, 40, 84, 28, 'Quod.', '1563572987', 1),
(2225, 2225, 75, 155, 46, 'Sed.', '1563572987', 1),
(2226, 2226, 133, 26, 73, 'Dolor mollitia.', '1563572987', 0),
(2228, 2228, 81, 97, 45, 'Fugit et harum voluptates.', '1563572987', 0),
(2229, 2229, 83, 50, 80, 'Beatae voluptas voluptatem.', '1563572988', 1),
(2234, 2234, 133, 148, 56, 'Ullam vel sunt.', '1563572988', 0),
(2235, 2235, 98, 84, 78, 'Perspiciatis sequi.', '1563572988', 0),
(2236, 2236, 78, 66, 11, 'Provident consectetur dolorem.', '1563572988', 1),
(2237, 2237, 49, 135, 153, 'Libero laudantium ut.', '1563572988', 1),
(2238, 2238, 172, 86, 1, 'Vero vel provident.', '1563572988', 1),
(2240, 2240, 152, 2, 65, 'Quia animi vero aliquid nemo.', '1563572988', 0),
(2241, 2241, 20, 11, 79, 'Tempora sunt non.', '1563572988', 0),
(2242, 2242, 8, 126, 83, 'Rerum saepe velit.', '1563572988', 1),
(2244, 2244, 13, 9, 78, 'Excepturi ab et.', '1563572988', 0),
(2245, 2245, 82, 71, 131, 'Ducimus iste.', '1563572988', 1),
(2246, 2246, 176, 61, 154, 'Consectetur.', '1563572988', 1);
INSERT INTO `messages` (`id`, `messageId`, `userId`, `fromId`, `toId`, `messageText`, `dateSent`, `enable_reply`) VALUES
(2247, 2247, 77, 70, 38, 'Totam labore.', '1563572988', 1),
(2250, 2250, 13, 159, 147, 'Praesentium molestias.', '1563572988', 1),
(2252, 2252, 166, 141, 67, 'Quibusdam molestiae libero sunt.', '1563572988', 0),
(2253, 2253, 163, 126, 3, 'Totam autem sequi a.', '1563572988', 0),
(2254, 2254, 50, 147, 143, 'Perspiciatis enim aut est.', '1563572988', 1),
(2255, 2255, 30, 145, 58, 'Odit magnam.', '1563572988', 0),
(2258, 2258, 133, 46, 78, 'Aut at.', '1563572988', 1),
(2259, 2259, 80, 134, 163, 'Autem tenetur.', '1563572988', 1),
(2260, 2260, 24, 169, 86, 'Facere voluptas et qui.', '1563572988', 0),
(2261, 2261, 141, 171, 34, 'Ut ipsam.', '1563572988', 1),
(2262, 2262, 92, 31, 171, 'Quis doloremque.', '1563572988', 1),
(2265, 2265, 71, 70, 169, 'Aut.', '1563572988', 0),
(2267, 2267, 93, 137, 173, 'Commodi est enim aut.', '1563572988', 1),
(2268, 2268, 134, 153, 25, 'Et qui nulla rerum et.', '1563572988', 0),
(2269, 2269, 158, 17, 163, 'Asperiores officia.', '1563572988', 0),
(2270, 2270, 157, 131, 32, 'Eum omnis quis qui.', '1563572988', 1),
(2272, 2272, 136, 132, 77, 'Placeat ut ut.', '1563572988', 0),
(2273, 2273, 70, 76, 75, 'Fugiat provident veritatis ullam.', '1563572988', 1),
(2274, 2274, 163, 160, 137, 'Cumque facilis in quae.', '1563572988', 1),
(2275, 2275, 161, 149, 41, 'Ex et quasi.', '1563572988', 0),
(2276, 2276, 155, 93, 126, 'Iure soluta vel.', '1563572988', 0),
(2277, 2277, 57, 44, 169, 'Beatae.', '1563572988', 0),
(2278, 2278, 15, 54, 31, 'Autem assumenda quaerat.', '1563572988', 1),
(2279, 2279, 61, 67, 97, 'Voluptas.', '1563572988', 0),
(2281, 2281, 30, 45, 45, 'Et est ut.', '1563572988', 0),
(2283, 2283, 69, 62, 35, 'Est expedita minus.', '1563572988', 0),
(2285, 2285, 57, 66, 65, 'Vel non numquam magnam ipsum.', '1563572988', 1),
(2286, 2286, 6, 90, 153, 'Iusto et qui.', '1563572988', 1),
(2287, 2287, 135, 132, 104, 'Provident et.', '1563572988', 1),
(2289, 2289, 21, 8, 101, 'Ipsam sit repudiandae.', '1563572988', 0),
(2291, 2291, 28, 175, 156, 'Quos in.', '1563572988', 0),
(2292, 2292, 90, 170, 42, 'Nesciunt.', '1563572988', 0),
(2293, 2293, 84, 96, 151, 'Amet quo et vel non.', '1563572988', 1),
(2295, 2295, 16, 73, 17, 'Eum ut nobis asperiores.', '1563572988', 0),
(2297, 2297, 127, 60, 150, 'Eveniet qui omnis et.', '1563572988', 1),
(2298, 2298, 85, 79, 12, 'Eos.', '1563572988', 0),
(2300, 2300, 6, 103, 41, 'Sequi et.', '1563572988', 0),
(2301, 2301, 172, 104, 154, 'Mollitia unde laboriosam iure cumque.', '1563572988', 1),
(2303, 2303, 31, 148, 139, 'Facilis omnis.', '1563572988', 1),
(2304, 2304, 15, 59, 159, 'Sit quo.', '1563572988', 0),
(2305, 2305, 62, 79, 96, 'Rem et.', '1563572988', 0),
(2306, 2306, 89, 81, 132, 'Aut.', '1563572988', 0),
(2307, 2307, 84, 96, 67, 'Rerum.', '1563572988', 1),
(2309, 2309, 136, 138, 87, 'At sit minus deserunt.', '1563572988', 0),
(2310, 2310, 100, 27, 27, 'Et consequatur qui sed.', '1563572988', 1),
(2313, 2313, 104, 18, 46, 'Ullam similique.', '1563572989', 1),
(2314, 2314, 60, 61, 138, 'Recusandae unde et.', '1563572989', 1),
(2316, 2316, 146, 15, 29, 'Rerum dignissimos non.', '1563572989', 1),
(2317, 2317, 43, 55, 12, 'Vero earum quos ex sed.', '1563572989', 0),
(2318, 2318, 85, 173, 134, 'Maxime ut aut delectus doloremque.', '1563572989', 0),
(2320, 2320, 142, 2, 52, 'Aperiam non aut aut.', '1563572989', 1),
(2322, 2322, 174, 137, 12, 'Omnis minima delectus ut.', '1563572989', 0),
(2324, 2324, 79, 159, 99, 'Facere ut quos.', '1563572989', 1),
(2325, 2325, 30, 4, 128, 'Quidem officiis.', '1563572989', 0),
(2326, 2326, 133, 134, 28, 'A quas.', '1563572989', 1),
(2329, 2329, 91, 65, 130, 'Id nisi facere harum molestias.', '1563572989', 0),
(2330, 2330, 73, 74, 2, 'Consequatur natus.', '1563572989', 0),
(2334, 2334, 78, 171, 49, 'Nisi voluptatem.', '1563572990', 0),
(2335, 2335, 10, 150, 61, 'Id magni.', '1563572990', 1),
(2336, 2336, 173, 79, 56, 'Debitis nisi.', '1563572990', 0),
(2338, 2338, 142, 23, 4, 'Quos omnis et deleniti distinctio nobis.', '1563572991', 0),
(2339, 2339, 54, 71, 164, 'Quaerat esse aperiam inventore.', '1563572991', 0),
(2340, 2340, 162, 16, 133, 'Asperiores earum repellat voluptas.', '1563572992', 0),
(2341, 2341, 126, 152, 74, 'Voluptatem recusandae optio.', '1563572992', 0),
(2342, 2342, 129, 38, 149, 'Debitis quam.', '1563572992', 0),
(2343, 2343, 147, 92, 155, 'Iure consequuntur.', '1563572992', 1),
(2345, 2345, 134, 33, 53, 'Necessitatibus laboriosam adipisci quaerat.', '1563572993', 0),
(2346, 2346, 130, 3, 98, 'Reiciendis vel.', '1563572993', 0),
(2347, 2347, 40, 155, 141, 'Alias enim non.', '1563572993', 1),
(2348, 2348, 152, 60, 54, 'Qui nobis ratione.', '1563572994', 1),
(2353, 2353, 55, 19, 139, 'Officia ab sint.', '1563572995', 1),
(2355, 2355, 126, 93, 25, 'Exercitationem illum facere.', '1563572996', 0),
(2356, 2356, 69, 58, 149, 'Officia tenetur.', '1563572997', 0),
(2357, 2357, 169, 1, 154, 'Repellat et harum sint.', '1563572997', 1),
(2358, 2358, 80, 148, 6, 'Unde dolores mollitia a dolores.', '1563572997', 0),
(2359, 2359, 13, 3, 3, 'Molestiae saepe dolorem enim.', '1563572998', 1),
(2360, 2360, 17, 168, 25, 'Dolor optio et sunt.', '1563572998', 1),
(2361, 2361, 70, 30, 56, 'Sit ipsa.', '1563572998', 0),
(2363, 2363, 17, 94, 84, 'Sint praesentium.', '1563572998', 0),
(2364, 2364, 99, 175, 101, 'Aut nam rerum maiores quae.', '1563572998', 0),
(2365, 2365, 90, 147, 38, 'Rerum ut perspiciatis.', '1563572998', 1),
(2366, 2366, 73, 82, 88, 'Harum ut hic perferendis amet reiciendis.', '1563572998', 0),
(2367, 2367, 1, 77, 98, 'Illum nihil libero quidem sint similique.', '1563572998', 0),
(2369, 2369, 29, 155, 63, 'Quia velit illo.', '1563572998', 0),
(2370, 2370, 57, 133, 11, 'Unde quibusdam esse ipsa dicta dolores.', '1563572998', 1),
(2372, 2372, 51, 171, 147, 'Itaque quia ducimus impedit.', '1563572998', 0),
(2374, 2374, 79, 140, 145, 'Dolor magni.', '1563572998', 1),
(2375, 2375, 66, 176, 104, 'Quibusdam.', '1563572998', 0),
(2376, 2376, 35, 158, 148, 'Iure ut dolore cumque officia.', '1563572998', 1),
(2377, 2377, 169, 101, 151, 'Soluta ea ipsa.', '1563572998', 0),
(2378, 2378, 142, 165, 152, 'Accusantium consequuntur deserunt velit.', '1563572998', 0),
(2380, 2380, 168, 73, 88, 'Sint quod deleniti.', '1563572998', 1),
(2382, 2382, 36, 82, 89, 'Tempore quae quos consequatur.', '1563572998', 1),
(2384, 2384, 161, 40, 8, 'Itaque voluptatibus.', '1563572998', 1),
(2385, 2385, 45, 154, 97, 'Et neque qui.', '1563572998', 0),
(2387, 2387, 58, 134, 64, 'Praesentium nam dolores aliquam est id.', '1563572998', 0),
(2388, 2388, 24, 33, 170, 'Veritatis eius voluptatibus praesentium.', '1563572998', 1),
(2389, 2389, 75, 148, 52, 'Qui fugiat molestiae excepturi nam corrupti.', '1563572998', 0),
(2390, 2390, 68, 73, 96, 'Et.', '1563572998', 1),
(2391, 2391, 99, 36, 154, 'Doloribus est.', '1563572998', 1),
(2392, 2392, 96, 172, 44, 'Corporis tempora corporis quo.', '1563572998', 0),
(2393, 2393, 151, 75, 75, 'Eligendi.', '1563572998', 0),
(2395, 2395, 101, 37, 174, 'Voluptas deserunt sunt provident.', '1563572998', 0),
(2396, 2396, 153, 40, 158, 'Est expedita sapiente quidem.', '1563572998', 0),
(2399, 2399, 31, 5, 98, 'Deleniti ex aut.', '1563572998', 1),
(2400, 2400, 29, 130, 49, 'Ad voluptas repudiandae.', '1563572998', 1),
(2402, 2402, 50, 100, 94, 'Sit illum magni.', '1563572998', 1),
(2403, 2403, 173, 149, 74, 'Perspiciatis quo ut repudiandae.', '1563572998', 0),
(2404, 2404, 12, 27, 52, 'Culpa qui.', '1563572999', 0),
(2406, 2406, 59, 77, 37, 'Eius quod numquam.', '1563572999', 1),
(2407, 2407, 52, 126, 36, 'Modi qui explicabo unde.', '1563572999', 1),
(2408, 2408, 29, 78, 52, 'Aperiam dolorum sit autem provident.', '1563572999', 0),
(2409, 2409, 50, 147, 22, 'Debitis alias recusandae error id.', '1563572999', 1),
(2411, 2411, 5, 143, 65, 'Amet nihil voluptates minima.', '1563572999', 0),
(2412, 2412, 35, 131, 162, 'Non porro.', '1563572999', 1),
(2413, 2413, 50, 168, 165, 'Itaque deserunt in sint.', '1563572999', 1),
(2415, 2415, 60, 138, 138, 'Assumenda delectus et unde.', '1563572999', 1),
(2416, 2416, 157, 67, 46, 'Et.', '1563572999', 1),
(2417, 2417, 137, 68, 47, 'Est quisquam et ut sit ipsa.', '1563572999', 1),
(2418, 2418, 159, 57, 142, 'Et suscipit dolores magni sit culpa.', '1563572999', 1),
(2419, 2419, 34, 86, 137, 'Vel.', '1563572999', 1),
(2420, 2420, 135, 169, 136, 'Sed aspernatur eius.', '1563572999', 0),
(2421, 2421, 68, 164, 144, 'Dolor autem beatae.', '1563572999', 0),
(2422, 2422, 98, 34, 87, 'Vel quod cumque numquam.', '1563572999', 1),
(2423, 2423, 176, 6, 167, 'Earum totam reprehenderit quia.', '1563572999', 1),
(2424, 2424, 15, 38, 50, 'Architecto cumque non.', '1563572999', 1),
(2427, 2427, 148, 3, 14, 'Molestias sed.', '1563573000', 0),
(2428, 2428, 99, 14, 51, 'Voluptas officiis quam facere.', '1563573000', 0),
(2429, 2429, 82, 134, 92, 'Et amet.', '1563573000', 1),
(2430, 2430, 163, 72, 145, 'Officia repellendus.', '1563573000', 1),
(2432, 2432, 97, 149, 17, 'Commodi doloremque.', '1563573000', 1),
(2434, 2434, 85, 149, 133, 'Eveniet quas ut ullam.', '1563573000', 1),
(2435, 2435, 79, 31, 174, 'Cumque qui aliquam.', '1563573000', 1),
(2436, 2436, 79, 94, 57, 'Ratione aspernatur ut dicta quis.', '1563573000', 0),
(2437, 2437, 133, 54, 127, 'Dolore.', '1563573000', 0),
(2438, 2438, 104, 38, 176, 'Provident aliquam distinctio accusamus eos blanditiis.', '1563573000', 1),
(2440, 2440, 131, 26, 140, 'Et.', '1563573000', 1),
(2441, 2441, 173, 5, 172, 'Qui.', '1563573000', 0),
(2442, 2442, 86, 24, 4, 'Vel eaque earum.', '1563573000', 0),
(2443, 2443, 27, 138, 90, 'Voluptatem.', '1563573000', 0),
(2444, 2444, 72, 96, 42, 'Quod.', '1563573000', 1),
(2447, 2447, 56, 153, 16, 'Enim quasi tempora est.', '1563573000', 0),
(2449, 2449, 44, 127, 64, 'Vero commodi dolor.', '1563573000', 1),
(2450, 2450, 58, 137, 5, 'Aut amet quisquam asperiores voluptatem.', '1563573000', 1),
(2451, 2451, 2, 59, 20, 'Quo ad itaque.', '1563573000', 1),
(2452, 2452, 142, 45, 165, 'Qui sit nostrum et.', '1563573000', 0),
(2455, 2455, 24, 131, 6, 'Numquam aut sequi.', '1563573000', 0),
(2457, 2457, 164, 28, 42, 'Ad rerum nobis est.', '1563573000', 1),
(2458, 2458, 166, 157, 62, 'Aut et doloremque est.', '1563573000', 1),
(2459, 2459, 95, 38, 103, 'Harum in sed inventore.', '1563573000', 1),
(2460, 2460, 97, 173, 165, 'Dolor animi vel.', '1563573001', 1),
(2461, 2461, 85, 76, 171, 'Eos similique.', '1563573001', 0),
(2463, 2463, 54, 92, 82, 'Aut magni.', '1563573001', 0),
(2464, 2464, 131, 58, 89, 'Ratione quaerat.', '1563573001', 1),
(2465, 2465, 53, 176, 100, 'Rerum autem.', '1563573001', 0),
(2466, 2466, 7, 64, 142, 'Assumenda dolores est.', '1563573001', 1),
(2467, 2467, 139, 58, 1, 'Impedit in.', '1563573001', 1),
(2468, 2468, 66, 67, 131, 'Dolor fugiat.', '1563573001', 1),
(2469, 2469, 60, 12, 41, 'Veritatis est eaque.', '1563573001', 0),
(2470, 2470, 145, 176, 87, 'Et ut.', '1563573001', 1),
(2471, 2471, 44, 18, 145, 'Qui dicta eum.', '1563573001', 0),
(2474, 2474, 12, 171, 49, 'Iusto necessitatibus.', '1563573001', 1),
(2475, 2475, 52, 89, 39, 'Sunt minus minus.', '1563573001', 0),
(2476, 2476, 154, 53, 89, 'Maxime commodi inventore.', '1563573001', 1),
(2479, 2479, 152, 63, 135, 'Optio id sapiente.', '1563573001', 1),
(2480, 2480, 4, 69, 12, 'Officiis possimus.', '1563573001', 0),
(2481, 2481, 172, 173, 92, 'Rerum eveniet dignissimos blanditiis.', '1563573001', 0),
(2483, 2483, 55, 75, 29, 'Dolores voluptatem deserunt accusamus et.', '1563573001', 0),
(2484, 2484, 73, 6, 72, 'Enim optio.', '1563573001', 0),
(2485, 2485, 29, 78, 62, 'Quidem eum magnam laudantium.', '1563573001', 0),
(2486, 2486, 16, 65, 138, 'Voluptatem.', '1563573002', 1),
(2488, 2488, 83, 13, 97, 'Voluptate et pariatur non.', '1563573002', 1),
(2489, 2489, 12, 49, 77, 'Nihil culpa qui recusandae dicta.', '1563573002', 1),
(2490, 2490, 147, 99, 59, 'Minus officiis ut.', '1563573002', 0),
(2491, 2491, 15, 67, 64, 'Dolorem cupiditate quia magni.', '1563573002', 0),
(2492, 2492, 88, 135, 173, 'Recusandae dolorem veritatis facere nihil.', '1563573002', 0),
(2493, 2493, 43, 47, 135, 'Tempore aliquam ratione cum deserunt.', '1563573002', 0),
(2494, 2494, 19, 138, 43, 'Dolor nihil dolorum.', '1563573002', 0),
(2495, 2495, 140, 136, 37, 'Ut unde.', '1563573002', 0),
(2498, 2498, 137, 92, 157, 'Voluptate aperiam repellat.', '1563573002', 0),
(2499, 2499, 128, 53, 14, 'Blanditiis eius.', '1563573002', 1),
(2501, 2501, 49, 34, 168, 'Corporis facere in.', '1563573002', 0),
(2502, 2502, 12, 82, 51, 'Quia cumque ullam doloribus temporibus.', '1563573002', 1),
(2503, 2503, 59, 37, 49, 'Est nemo nesciunt.', '1563573002', 0),
(2504, 2504, 12, 133, 145, 'Aut veniam rerum.', '1563573002', 0),
(2505, 2505, 172, 98, 144, 'Autem nisi.', '1563573002', 1),
(2506, 2506, 170, 132, 157, 'Error soluta et expedita.', '1563573002', 1),
(2507, 2507, 103, 65, 29, 'Eligendi consequatur quo.', '1563573002', 0),
(2508, 2508, 175, 103, 34, 'Commodi neque blanditiis.', '1563573002', 1),
(2509, 2509, 150, 86, 136, 'Eum vel.', '1563573002', 0),
(2510, 2510, 32, 37, 82, 'Consequuntur quaerat error doloremque harum delectus.', '1563573002', 1),
(2511, 2511, 5, 100, 129, 'Nostrum hic numquam illum.', '1563573002', 1),
(2515, 2515, 168, 9, 95, 'Provident distinctio.', '1563573002', 1),
(2516, 2516, 150, 26, 59, 'Consectetur praesentium.', '1563573002', 0),
(2517, 2517, 17, 79, 59, 'Delectus fugiat qui.', '1563573003', 0),
(2518, 2518, 149, 47, 170, 'Vel et.', '1563573003', 1),
(2520, 2520, 94, 71, 54, 'Odio sit a.', '1563573003', 1),
(2521, 2521, 1, 24, 83, 'Officiis quo.', '1563573003', 0),
(2522, 2522, 34, 28, 151, 'Quo ab illo ipsum expedita.', '1563573003', 0),
(2523, 2523, 102, 60, 36, 'Accusantium est omnis.', '1563573003', 1),
(2524, 2524, 158, 44, 16, 'Provident deleniti.', '1563573003', 0),
(2525, 2525, 55, 70, 32, 'Molestiae consequatur.', '1563573003', 0),
(2527, 2527, 54, 141, 44, 'Accusantium voluptas rerum magnam quod.', '1563573003', 1),
(2528, 2528, 50, 128, 75, 'Ut.', '1563573003', 1),
(2529, 2529, 132, 55, 7, 'In maxime nostrum.', '1563573003', 0),
(2530, 2530, 95, 17, 48, 'Quo velit quibusdam.', '1563573003', 1),
(2531, 2531, 100, 43, 144, 'Beatae vitae.', '1563573003', 0),
(2532, 2532, 156, 4, 143, 'Consequatur culpa inventore earum ipsa.', '1563573003', 0),
(2533, 2533, 158, 151, 70, 'At ea eveniet.', '1563573003', 1),
(2534, 2534, 91, 70, 137, 'Repellendus.', '1563573003', 0),
(2535, 2535, 93, 171, 86, 'Qui autem.', '1563573003', 0),
(2537, 2537, 31, 166, 23, 'Sed aut dolore id voluptate.', '1563573003', 1),
(2538, 2538, 43, 4, 54, 'Et.', '1563573003', 0),
(2539, 2539, 144, 77, 41, 'Consequuntur fugit modi accusantium.', '1563573003', 1),
(2540, 2540, 142, 165, 162, 'Corrupti fuga.', '1563573003', 1),
(2541, 2541, 171, 18, 5, 'Sed id reiciendis eaque.', '1563573003', 0),
(2542, 2542, 36, 175, 13, 'Nobis sint labore.', '1563573003', 0),
(2543, 2543, 87, 137, 160, 'Adipisci eveniet ex eveniet neque.', '1563573003', 0),
(2544, 2544, 59, 60, 26, 'Et autem.', '1563573003', 1),
(2545, 2545, 17, 33, 152, 'Enim amet rerum.', '1563573003', 1),
(2546, 2546, 143, 67, 4, 'Possimus amet.', '1563573003', 1),
(2549, 2549, 54, 86, 12, 'Quis fugit quo.', '1563573004', 0),
(2550, 2550, 157, 14, 9, 'Dignissimos dolor sint et sunt.', '1563573004', 1),
(2552, 2552, 75, 158, 89, 'Sit dolorum.', '1563573004', 1),
(2554, 2554, 31, 23, 167, 'Reiciendis cumque quis.', '1563573004', 1),
(2556, 2556, 32, 57, 22, 'Optio necessitatibus.', '1563573004', 1),
(2557, 2557, 147, 3, 85, 'Iure.', '1563573004', 0),
(2558, 2558, 50, 45, 151, 'Facilis nobis.', '1563573004', 1),
(2559, 2559, 68, 61, 176, 'Explicabo a sit.', '1563573004', 0),
(2560, 2560, 102, 10, 78, 'Id dignissimos et qui unde.', '1563573004', 1),
(2562, 2562, 69, 126, 26, 'Quia quasi quia.', '1563573004', 0),
(2563, 2563, 49, 83, 129, 'Omnis quos.', '1563573004', 0),
(2564, 2564, 62, 154, 31, 'Quia in voluptatem qui minus.', '1563573004', 1),
(2565, 2565, 30, 86, 141, 'Ullam sed.', '1563573004', 1),
(2566, 2566, 4, 99, 50, 'Quos.', '1563573004', 1),
(2567, 2567, 72, 86, 84, 'Quas.', '1563573004', 1),
(2570, 2570, 50, 144, 62, 'Incidunt.', '1563573004', 0),
(2571, 2571, 170, 60, 22, 'Eos enim pariatur nemo nulla quae.', '1563573004', 1),
(2573, 2573, 64, 136, 72, 'Vitae cumque.', '1563573004', 1),
(2574, 2574, 7, 144, 97, 'Exercitationem et veniam.', '1563573004', 0),
(2576, 2576, 174, 144, 162, 'Laborum reprehenderit.', '1563573004', 1),
(2578, 2578, 157, 167, 172, 'Dolores id dicta.', '1563573004', 1),
(2580, 2580, 26, 78, 51, 'Nostrum nisi cumque.', '1563573004', 1),
(2582, 2582, 159, 44, 28, 'Corporis placeat.', '1563573004', 0),
(2583, 2583, 163, 60, 62, 'Aliquid enim.', '1563573004', 1),
(2584, 2584, 141, 30, 19, 'Blanditiis qui perspiciatis voluptatem.', '1563573004', 0),
(2585, 2585, 97, 35, 80, 'Esse at impedit.', '1563573004', 0),
(2586, 2586, 40, 2, 37, 'Illum omnis ea.', '1563573004', 0),
(2587, 2587, 66, 139, 45, 'Ea.', '1563573004', 0),
(2588, 2588, 168, 54, 51, 'Vero sed.', '1563573004', 0),
(2591, 2591, 37, 161, 25, 'Sed adipisci ut cumque.', '1563573004', 0),
(2593, 2593, 66, 44, 36, 'Ut sed.', '1563573004', 0),
(2594, 2594, 59, 20, 145, 'Id repellendus delectus.', '1563573004', 1),
(2595, 2595, 135, 130, 67, 'Aut cum.', '1563573004', 1),
(2596, 2596, 53, 142, 31, 'Nisi sapiente rerum reiciendis.', '1563573004', 0),
(2598, 2598, 160, 35, 175, 'Sunt eveniet accusantium.', '1563573004', 0),
(2599, 2599, 175, 104, 137, 'Modi aut corrupti sit.', '1563573004', 1),
(2601, 2601, 142, 40, 17, 'Reiciendis consequatur eum.', '1563573004', 1),
(2602, 2602, 6, 65, 126, 'Omnis voluptas.', '1563573004', 1),
(2603, 2603, 4, 162, 76, 'Aliquam fugiat.', '1563573004', 0),
(2605, 2605, 79, 47, 56, 'Earum sunt est ut consequuntur.', '1563573004', 1),
(2608, 2608, 80, 15, 149, 'Minus quis enim.', '1563573004', 0),
(2610, 2610, 88, 18, 30, 'Aliquam commodi sed esse eos.', '1563573005', 0),
(2612, 2612, 19, 159, 37, 'Dolorem voluptatem quasi rerum.', '1563573005', 1),
(2615, 2615, 41, 75, 2, 'Explicabo explicabo dolor.', '1563573005', 1),
(2616, 2616, 143, 82, 52, 'Hic.', '1563573005', 1),
(2617, 2617, 18, 127, 63, 'Fugiat consequatur consequatur.', '1563573005', 1),
(2618, 2618, 142, 144, 146, 'Repellendus libero.', '1563573005', 1),
(2619, 2619, 150, 11, 166, 'Veritatis eos.', '1563573005', 1),
(2620, 2620, 31, 15, 168, 'Deserunt.', '1563573005', 0),
(2621, 2621, 168, 72, 73, 'Ut possimus accusamus.', '1563573005', 1),
(2622, 2622, 147, 44, 135, 'Magni maiores dolores.', '1563573005', 1),
(2623, 2623, 143, 172, 64, 'Aliquam.', '1563573005', 0),
(2624, 2624, 34, 143, 23, 'Et.', '1563573005', 0),
(2625, 2625, 58, 147, 141, 'Iste earum.', '1563573005', 0),
(2628, 2628, 134, 75, 171, 'Soluta enim sapiente sed.', '1563573005', 0),
(2631, 2631, 88, 135, 67, 'Eligendi debitis incidunt.', '1563573005', 1),
(2633, 2633, 148, 160, 67, 'Doloremque.', '1563573005', 0),
(2634, 2634, 87, 85, 31, 'Aperiam.', '1563573005', 0),
(2635, 2635, 154, 160, 144, 'Eos ratione.', '1563573005', 0),
(2636, 2636, 161, 169, 35, 'Ut id non.', '1563573005', 1),
(2638, 2638, 56, 29, 49, 'Cum tenetur voluptas.', '1563573005', 1),
(2640, 2640, 151, 20, 153, 'Et libero autem.', '1563573005', 0),
(2641, 2641, 160, 13, 91, 'Repudiandae harum.', '1563573005', 0),
(2642, 2642, 136, 20, 164, 'Consequuntur quisquam.', '1563573005', 0),
(2645, 2645, 53, 159, 148, 'Explicabo sit sit.', '1563573005', 0),
(2646, 2646, 132, 21, 138, 'Aperiam voluptatem fugiat.', '1563573005', 0),
(2647, 2647, 63, 46, 163, 'Dicta sit delectus.', '1563573005', 0),
(2649, 2649, 100, 166, 12, 'Perferendis et et maxime alias.', '1563573005', 0),
(2650, 2650, 17, 130, 136, 'Nam incidunt beatae laborum aut.', '1563573005', 0),
(2651, 2651, 103, 101, 10, 'Autem.', '1563573005', 0),
(2652, 2652, 28, 20, 135, 'Rerum et.', '1563573005', 0),
(2654, 2654, 26, 65, 61, 'Laudantium ratione.', '1563573005', 1),
(2656, 2656, 153, 143, 47, 'Quasi maiores inventore ab.', '1563573005', 1),
(2657, 2657, 33, 29, 155, 'Ratione perferendis consequuntur et.', '1563573005', 1),
(2659, 2659, 88, 98, 15, 'Suscipit ut ut.', '1563573005', 0),
(2661, 2661, 1, 86, 129, 'Veniam.', '1563573005', 0),
(2662, 2662, 140, 174, 164, 'Ipsum molestiae.', '1563573005', 0),
(2663, 2663, 98, 127, 43, 'Qui itaque tenetur nam suscipit.', '1563573005', 0),
(2666, 2666, 126, 75, 127, 'Enim nisi.', '1563573005', 1),
(2667, 2667, 99, 6, 16, 'Quasi a ullam.', '1563573005', 0),
(2669, 2669, 159, 10, 169, 'Odit commodi velit et.', '1563573005', 0),
(2672, 2672, 91, 160, 16, 'Illum sapiente.', '1563573005', 0),
(2673, 2673, 148, 159, 17, 'Rem eveniet nulla.', '1563573005', 1),
(2674, 2674, 62, 28, 148, 'Temporibus reiciendis tempore mollitia.', '1563573005', 1),
(2675, 2675, 151, 101, 58, 'Rerum.', '1563573005', 0),
(2676, 2676, 131, 5, 81, 'Maiores delectus iusto.', '1563573005', 0),
(2677, 2677, 80, 93, 14, 'Repellendus voluptas dolor.', '1563573006', 0),
(2679, 2679, 44, 167, 141, 'Impedit minima rerum dolor.', '1563573006', 1),
(2680, 2680, 102, 1, 103, 'Aspernatur laudantium inventore.', '1563573006', 0),
(2681, 2681, 23, 85, 83, 'Eum quia provident.', '1563573006', 1),
(2684, 2684, 140, 147, 38, 'Ut harum rem praesentium.', '1563573006', 0),
(2685, 2685, 158, 86, 148, 'Voluptates architecto quod recusandae.', '1563573006', 0),
(2686, 2686, 155, 29, 139, 'Ut blanditiis.', '1563573006', 0),
(2689, 2689, 27, 69, 50, 'Corporis autem.', '1563573006', 0),
(2690, 2690, 175, 99, 162, 'Qui dicta.', '1563573006', 0),
(2692, 2692, 164, 92, 141, 'Beatae voluptatem impedit commodi harum iusto.', '1563573006', 0),
(2693, 2693, 64, 38, 167, 'Ex est.', '1563573006', 0),
(2694, 2694, 47, 48, 99, 'Similique culpa.', '1563573006', 1),
(2695, 2695, 85, 65, 65, 'Quo occaecati enim.', '1563573006', 0),
(2696, 2696, 138, 70, 27, 'Odit doloribus nesciunt et autem.', '1563573006', 0),
(2697, 2697, 25, 57, 142, 'Omnis.', '1563573006', 0),
(2698, 2698, 14, 132, 104, 'Ea laudantium.', '1563573006', 0),
(2700, 2700, 9, 77, 61, 'Libero sit.', '1563573006', 1),
(2703, 2703, 30, 44, 92, 'Debitis eligendi facilis.', '1563573006', 0),
(2705, 2705, 2, 144, 142, 'Optio eius placeat.', '1563573006', 0),
(2706, 2706, 86, 62, 139, 'Possimus dolorum iusto illo.', '1563573006', 1),
(2707, 2707, 99, 41, 58, 'Qui ullam.', '1563573006', 0),
(2709, 2709, 71, 82, 170, 'Asperiores ad.', '1563573006', 0),
(2710, 2710, 63, 154, 92, 'Suscipit quia.', '1563573006', 1),
(2711, 2711, 74, 62, 82, 'Nisi voluptatum rerum unde a.', '1563573006', 1),
(2712, 2712, 159, 133, 54, 'Ut voluptatem.', '1563573006', 0),
(2714, 2714, 148, 20, 64, 'Inventore accusantium.', '1563573006', 0),
(2715, 2715, 131, 101, 77, 'Consequuntur et unde.', '1563573006', 0),
(2720, 2720, 43, 1, 40, 'Eos ut necessitatibus.', '1563573006', 1),
(2722, 2722, 13, 134, 13, 'Beatae quod eum incidunt officia.', '1563573006', 1),
(2723, 2723, 127, 38, 103, 'Perspiciatis non necessitatibus minima ut.', '1563573006', 1),
(2725, 2725, 69, 69, 72, 'Sed corrupti quam.', '1563573006', 0),
(2726, 2726, 29, 13, 142, 'Debitis magni sunt.', '1563573006', 0),
(2727, 2727, 32, 170, 68, 'Aliquam minus molestias.', '1563573006', 0),
(2729, 2729, 9, 167, 85, 'Rerum tenetur quia.', '1563573006', 0),
(2730, 2730, 66, 68, 52, 'Aut iusto exercitationem.', '1563573006', 1),
(2731, 2731, 145, 6, 169, 'Officia eaque minima rerum.', '1563573006', 1),
(2732, 2732, 84, 85, 97, 'Dolore optio.', '1563573006', 0),
(2733, 2733, 150, 10, 50, 'Atque qui id officiis cupiditate tempora.', '1563573006', 1),
(2734, 2734, 59, 79, 4, 'Sed doloribus dolor sit.', '1563573006', 0),
(2736, 2736, 162, 170, 63, 'Quam quasi.', '1563573006', 1),
(2737, 2737, 15, 166, 99, 'Quod ut.', '1563573006', 1),
(2741, 2741, 7, 20, 88, 'Consequatur molestiae quis.', '1563573006', 0),
(2743, 2743, 100, 95, 168, 'Animi eos quos et sunt.', '1563573006', 1),
(2744, 2744, 149, 72, 73, 'Nam eum.', '1563573006', 1),
(2747, 2747, 78, 162, 86, 'Nihil animi optio vel.', '1563573006', 1),
(2748, 2748, 164, 81, 91, 'Aspernatur fugit illum asperiores.', '1563573007', 0),
(2750, 2750, 158, 47, 67, 'Debitis.', '1563573007', 0),
(2753, 2753, 39, 156, 61, 'Nobis non blanditiis.', '1563573007', 1),
(2755, 2755, 66, 138, 147, 'Numquam ut totam et officia accusamus.', '1563573007', 0),
(2756, 2756, 156, 84, 99, 'Saepe excepturi.', '1563573007', 1),
(2757, 2757, 16, 158, 47, 'Ducimus rerum unde.', '1563573007', 0),
(2758, 2758, 72, 66, 70, 'Quia soluta ut.', '1563573007', 1),
(2759, 2759, 162, 170, 82, 'Magnam natus.', '1563573007', 1),
(2760, 2760, 10, 6, 174, 'Tenetur autem provident.', '1563573007', 1),
(2761, 2761, 51, 11, 101, 'Nihil praesentium.', '1563573007', 1),
(2764, 2764, 65, 162, 30, 'Alias reprehenderit commodi.', '1563573007', 0),
(2765, 2765, 71, 18, 99, 'Ut.', '1563573007', 1),
(2766, 2766, 154, 132, 167, 'Ut omnis sit.', '1563573007', 1),
(2769, 2769, 155, 30, 68, 'Et est adipisci.', '1563573007', 0),
(2771, 2771, 165, 55, 47, 'Est hic at.', '1563573007', 0),
(2773, 2773, 63, 98, 54, 'Labore.', '1563573007', 1),
(2774, 2774, 22, 153, 171, 'Voluptates fuga debitis dolorum.', '1563573007', 0),
(2775, 2775, 50, 42, 17, 'Optio.', '1563573007', 1),
(2776, 2776, 152, 31, 18, 'Excepturi nesciunt ratione.', '1563573007', 1),
(2779, 2779, 150, 78, 80, 'Ut sed occaecati.', '1563573007', 1),
(2780, 2780, 69, 175, 12, 'Autem veniam.', '1563573007', 1),
(2781, 2781, 2, 127, 4, 'Aut enim commodi.', '1563573007', 0),
(2782, 2782, 12, 37, 12, 'Consequuntur harum eligendi.', '1563573007', 0),
(2784, 2784, 158, 170, 141, 'Corporis eaque.', '1563573007', 1),
(2785, 2785, 171, 101, 149, 'Eos maxime animi ad.', '1563573007', 0),
(2786, 2786, 174, 98, 75, 'Consequatur enim quia dolores id tempora.', '1563573007', 1),
(2787, 2787, 28, 167, 52, 'Vel consequatur.', '1563573007', 1),
(2788, 2788, 64, 127, 136, 'Quos et.', '1563573007', 0),
(2789, 2789, 22, 8, 158, 'Quod et itaque.', '1563573007', 0),
(2790, 2790, 74, 90, 158, 'Ducimus aut.', '1563573007', 0),
(2791, 2791, 77, 18, 80, 'Autem qui aut.', '1563573007', 0),
(2792, 2792, 52, 71, 49, 'Maxime.', '1563573007', 1),
(2796, 2796, 145, 66, 173, 'Sed omnis.', '1563573007', 0),
(2797, 2797, 53, 41, 10, 'Dolorem omnis quibusdam.', '1563573007', 0),
(2799, 2799, 57, 81, 134, 'Et at quia aspernatur.', '1563573007', 1),
(2802, 2802, 16, 159, 161, 'Sed earum.', '1563573007', 1),
(2803, 2803, 60, 70, 132, 'Et aperiam soluta rerum qui.', '1563573007', 1),
(2804, 2804, 33, 163, 55, 'Quos delectus.', '1563573007', 0),
(2805, 2805, 72, 100, 39, 'Et pariatur nam itaque.', '1563573007', 1),
(2808, 2808, 26, 162, 175, 'Deleniti sunt sint nulla unde.', '1563573007', 0),
(2809, 2809, 41, 3, 26, 'Esse occaecati.', '1563573007', 1),
(2810, 2810, 173, 74, 69, 'Fugiat sed aliquid.', '1563573007', 1),
(2812, 2812, 87, 51, 128, 'Sed voluptatum.', '1563573007', 0),
(2813, 2813, 147, 29, 51, 'Est iste illo.', '1563573007', 1),
(2816, 2816, 72, 170, 36, 'Quis aut rerum.', '1563573007', 0),
(2817, 2817, 143, 172, 168, 'Accusantium atque.', '1563573007', 0),
(2818, 2818, 82, 126, 137, 'Eaque maiores adipisci.', '1563573007', 1),
(2821, 2821, 90, 81, 92, 'Perspiciatis sequi ut totam.', '1563573007', 0),
(2822, 2822, 15, 2, 171, 'Aliquid architecto mollitia.', '1563573007', 0),
(2823, 2823, 169, 93, 60, 'Voluptas debitis et.', '1563573007', 0),
(2824, 2824, 27, 20, 58, 'Rerum ea assumenda qui.', '1563573007', 1),
(2825, 2825, 34, 55, 56, 'Non rerum quis.', '1563573007', 1),
(2827, 2827, 36, 45, 128, 'Et fugit.', '1563573007', 0),
(2829, 2829, 153, 43, 161, 'Perspiciatis voluptatem.', '1563573007', 1),
(2830, 2830, 59, 41, 127, 'Qui.', '1563573007', 1),
(2831, 2831, 20, 1, 69, 'Omnis voluptatum et iure est.', '1563573007', 0),
(2833, 2833, 27, 83, 95, 'Ullam aliquid est eligendi architecto.', '1563573007', 1),
(2834, 2834, 50, 12, 41, 'Modi tenetur autem voluptatem.', '1563573008', 1),
(2836, 2836, 62, 139, 98, 'Libero voluptatem.', '1563573008', 0),
(2837, 2837, 38, 99, 45, 'Officia aut vero non officiis exercitationem.', '1563573008', 0),
(2838, 2838, 104, 49, 23, 'Nemo blanditiis beatae.', '1563573008', 0),
(2839, 2839, 103, 27, 26, 'Aliquid.', '1563573008', 0),
(2840, 2840, 84, 61, 174, 'Consectetur velit exercitationem ut.', '1563573008', 0),
(2845, 2845, 136, 66, 4, 'Et quis.', '1563573008', 0),
(2846, 2846, 85, 47, 97, 'Porro sapiente.', '1563573008', 1),
(2847, 2847, 84, 92, 3, 'Laborum voluptatibus numquam.', '1563573008', 0),
(2849, 2849, 126, 94, 89, 'Doloremque nemo.', '1563573008', 0),
(2850, 2850, 51, 129, 41, 'Beatae aliquid sit rem.', '1563573008', 1),
(2853, 2853, 157, 132, 128, 'Ea reprehenderit.', '1563573008', 0),
(2855, 2855, 137, 57, 4, 'Quis ex alias.', '1563573008', 0),
(2857, 2857, 68, 11, 46, 'Nihil consequatur nesciunt ullam.', '1563573008', 1),
(2858, 2858, 45, 94, 75, 'Et rem beatae.', '1563573008', 1),
(2861, 2861, 132, 170, 13, 'Et possimus facere.', '1563573008', 1),
(2865, 2865, 142, 22, 48, 'Aut.', '1563573008', 1),
(2866, 2866, 164, 94, 97, 'Commodi reiciendis voluptatibus dolores.', '1563573008', 0),
(2871, 2871, 39, 67, 10, 'Id excepturi.', '1563573008', 0),
(2872, 2872, 150, 150, 47, 'Sit repellat aspernatur.', '1563573008', 0),
(2873, 2873, 146, 20, 48, 'Debitis ea perferendis sit id.', '1563573008', 1),
(2874, 2874, 36, 47, 134, 'Eveniet quaerat porro.', '1563573008', 0),
(2875, 2875, 148, 133, 18, 'Architecto accusamus nesciunt.', '1563573008', 0),
(2876, 2876, 80, 135, 98, 'Corrupti.', '1563573008', 1),
(2878, 2878, 158, 71, 157, 'Qui iste officia.', '1563573008', 0),
(2879, 2879, 132, 4, 176, 'Recusandae sapiente explicabo.', '1563573008', 1),
(2880, 2880, 159, 68, 46, 'Fuga molestiae.', '1563573008', 1),
(2881, 2881, 77, 127, 24, 'Fuga dolorem quibusdam magni iusto.', '1563573008', 1),
(2882, 2882, 32, 38, 68, 'Ducimus.', '1563573008', 0),
(2883, 2883, 12, 50, 15, 'Vitae occaecati deserunt optio.', '1563573008', 0),
(2885, 2885, 16, 62, 75, 'Eaque.', '1563573008', 1),
(2887, 2887, 22, 154, 8, 'Atque omnis et totam recusandae distinctio.', '1563573008', 0),
(2888, 2888, 61, 72, 34, 'Quisquam veniam sapiente officia animi.', '1563573008', 1),
(2889, 2889, 28, 174, 82, 'Repudiandae porro eum sed cum.', '1563573008', 1),
(2890, 2890, 78, 33, 32, 'Dolores.', '1563573008', 1),
(2891, 2891, 153, 77, 30, 'Aut.', '1563573008', 0),
(2892, 2892, 56, 159, 102, 'Optio architecto dolor.', '1563573008', 0),
(2893, 2893, 3, 46, 99, 'Eius laudantium voluptate minima quam deserunt.', '1563573008', 1),
(2894, 2894, 78, 100, 88, 'Dicta.', '1563573008', 1),
(2895, 2895, 78, 38, 64, 'Vel.', '1563573008', 1),
(2899, 2899, 96, 156, 29, 'Voluptate vel dolor.', '1563573008', 0),
(2900, 2900, 137, 69, 94, 'Vel laborum vel qui.', '1563573008', 0),
(2901, 2901, 69, 175, 141, 'Id nostrum iste.', '1563573008', 1),
(2904, 2904, 7, 36, 45, 'Dolorum illum.', '1563573008', 0),
(2905, 2905, 145, 38, 4, 'Non dolores necessitatibus ipsum veniam nemo.', '1563573008', 0),
(2906, 2906, 45, 81, 19, 'Et.', '1563573008', 0),
(2907, 2907, 83, 154, 39, 'Repudiandae officiis.', '1563573008', 1),
(2908, 2908, 39, 44, 92, 'Aspernatur libero ullam quo quia.', '1563573008', 0),
(2910, 2910, 10, 88, 94, 'Aliquam natus dolores.', '1563573008', 0),
(2911, 2911, 25, 23, 164, 'Enim mollitia veniam in.', '1563573008', 1),
(2912, 2912, 90, 90, 45, 'Consequuntur deleniti.', '1563573008', 1),
(2914, 2914, 160, 135, 158, 'Sit.', '1563573008', 0),
(2915, 2915, 171, 161, 158, 'Deleniti rerum.', '1563573009', 0),
(2917, 2917, 135, 165, 50, 'Quaerat dignissimos.', '1563573009', 1),
(2918, 2918, 17, 37, 18, 'Sed quia in occaecati sit.', '1563573009', 0),
(2921, 2921, 139, 156, 48, 'Hic commodi dolore.', '1563573009', 0),
(2922, 2922, 104, 14, 146, 'Voluptatem suscipit animi.', '1563573009', 1),
(2925, 2925, 157, 61, 41, 'Laborum quos similique.', '1563573009', 0),
(2926, 2926, 15, 67, 68, 'Quae enim velit officiis laborum.', '1563573009', 0),
(2927, 2927, 12, 166, 43, 'Vitae numquam.', '1563573009', 0),
(2930, 2930, 159, 160, 23, 'Pariatur earum nam.', '1563573009', 0),
(2932, 2932, 8, 57, 36, 'Qui.', '1563573009', 1),
(2933, 2933, 160, 161, 138, 'Impedit ab.', '1563573009', 1),
(2934, 2934, 99, 162, 28, 'Nesciunt ullam vel animi ut.', '1563573009', 0),
(2935, 2935, 20, 170, 73, 'Eum eius corporis impedit tempora.', '1563573009', 1),
(2936, 2936, 80, 145, 169, 'Laboriosam vel et odit.', '1563573009', 0),
(2937, 2937, 36, 172, 19, 'Id dicta ut nostrum.', '1563573009', 1),
(2938, 2938, 39, 32, 11, 'Odio explicabo occaecati.', '1563573009', 1),
(2939, 2939, 28, 10, 152, 'Quis modi delectus.', '1563573009', 1),
(2942, 2942, 92, 80, 104, 'Est aspernatur soluta consequatur.', '1563573009', 1),
(2945, 2945, 54, 137, 143, 'Harum nulla.', '1563573009', 0),
(2948, 2948, 3, 4, 159, 'Corporis beatae ea.', '1563573009', 1),
(2952, 2952, 173, 140, 145, 'Dolores facilis sed.', '1563573009', 0),
(2955, 2955, 59, 140, 99, 'Cum atque.', '1563573009', 1),
(2956, 2956, 138, 168, 66, 'Neque non.', '1563573009', 0),
(2958, 2958, 168, 37, 100, 'Veniam quia.', '1563573009', 1),
(2959, 2959, 38, 144, 1, 'Alias ut nesciunt.', '1563573009', 0),
(2961, 2961, 144, 7, 8, 'Sunt fuga.', '1563573009', 0),
(2962, 2962, 52, 80, 154, 'Beatae quia est.', '1563573009', 1),
(2964, 2964, 47, 26, 161, 'Iure quia incidunt.', '1563573009', 1),
(2965, 2965, 42, 26, 84, 'Ipsum tenetur eaque quis.', '1563573009', 0),
(2966, 2966, 60, 3, 175, 'Sit ut et aut.', '1563573009', 0),
(2968, 2968, 134, 163, 144, 'Neque exercitationem deleniti est animi distinctio.', '1563573009', 1),
(2969, 2969, 76, 140, 4, 'Quidem quas itaque.', '1563573009', 0),
(2972, 2972, 128, 160, 129, 'Incidunt suscipit.', '1563573009', 0),
(2975, 2975, 60, 69, 100, 'Et dolorem ipsa.', '1563573009', 0),
(2976, 2976, 51, 31, 69, 'Soluta nulla.', '1563573009', 0),
(2978, 2978, 71, 23, 146, 'Quia.', '1563573009', 1),
(2979, 2979, 30, 21, 65, 'Sed.', '1563573009', 1),
(2980, 2980, 10, 60, 174, 'Est voluptas quam.', '1563573009', 1),
(2982, 2982, 162, 86, 158, 'Excepturi asperiores et.', '1563573009', 0),
(2983, 2983, 47, 77, 14, 'Praesentium tempora tempora accusamus.', '1563573009', 0),
(2984, 2984, 145, 164, 38, 'Ex perferendis exercitationem adipisci animi.', '1563573009', 0),
(2985, 2985, 98, 137, 176, 'Ducimus soluta.', '1563573009', 1),
(2986, 2986, 156, 165, 175, 'Fugit quidem odio.', '1563573009', 0),
(2988, 2988, 38, 142, 40, 'Sequi qui.', '1563573009', 1),
(2989, 2989, 159, 162, 157, 'Nulla perspiciatis.', '1563573009', 0),
(2991, 2991, 171, 154, 36, 'Et asperiores est.', '1563573010', 1),
(2992, 2992, 147, 93, 78, 'Cum est.', '1563573010', 0),
(2993, 2993, 35, 29, 138, 'Alias.', '1563573010', 0),
(2994, 2994, 33, 140, 127, 'Aut quia quo.', '1563573010', 0),
(2995, 2995, 6, 84, 7, 'Facilis est necessitatibus.', '1563573010', 1),
(2996, 2996, 1, 43, 149, 'Odio rem dolores error itaque.', '1563573010', 0),
(2997, 2997, 174, 20, 70, 'Voluptatibus rerum vel vero.', '1563573010', 0),
(2998, 2998, 8, 77, 23, 'Aut.', '1563573010', 1),
(2999, 2999, 71, 94, 163, 'Voluptatem eos nemo totam.', '1563573010', 1),
(3000, 3000, 83, 43, 25, 'Impedit.', '1563573010', 1);

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

--
-- Dumping data for table `messages_list`
--

INSERT INTO `messages_list` (`id`, `userId`, `toId`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`) VALUES
(1, 164, 144, 'Et illo eveniet autem.', '1563572941', 0, 1),
(2, 95, 68, 'Voluptatem distinctio nam modi.', '1563572941', 0, 1),
(3, 173, 22, 'Fugiat labore eum.', '1563572942', 1, 0),
(4, 137, 83, 'Aliquid quidem.', '1563572942', 1, 0),
(6, 23, 78, 'Consequatur nam beatae.', '1563572942', 1, 1),
(8, 34, 20, 'Voluptas aliquam et.', '1563572942', 0, 1),
(9, 149, 136, 'Qui accusantium eos minus.', '1563572942', 1, 0),
(10, 18, 133, 'Necessitatibus amet.', '1563572942', 1, 0),
(12, 5, 150, 'Libero.', '1563572942', 0, 1),
(13, 26, 44, 'Voluptatibus nihil harum voluptas voluptas.', '1563572942', 1, 1),
(14, 173, 99, 'Quia fuga.', '1563572942', 1, 1),
(15, 22, 74, 'Est dolore nam.', '1563572942', 0, 0),
(16, 50, 144, 'In eos quo molestiae.', '1563572942', 0, 1),
(17, 3, 57, 'Consectetur laborum commodi.', '1563572943', 0, 1),
(18, 51, 103, 'Quaerat quia tenetur ullam.', '1563572943', 1, 0),
(19, 77, 126, 'Debitis deserunt beatae vel.', '1563572943', 1, 1),
(20, 28, 8, 'Aliquid consequatur sit sequi doloribus.', '1563572943', 0, 0),
(21, 138, 160, 'Est inventore.', '1563572943', 1, 1),
(22, 39, 165, 'Temporibus qui.', '1563572943', 1, 0),
(23, 18, 132, 'Nulla perspiciatis alias.', '1563572943', 1, 0),
(24, 127, 90, 'Nostrum quas natus dignissimos.', '1563572943', 0, 1),
(25, 77, 143, 'Incidunt possimus.', '1563572943', 0, 1),
(26, 21, 135, 'Inventore est laborum.', '1563572943', 1, 1),
(27, 21, 130, 'Consequatur autem corporis excepturi facilis maiores.', '1563572943', 1, 1),
(28, 104, 7, 'Quidem.', '1563572943', 1, 1),
(29, 42, 157, 'Officia.', '1563572943', 1, 1),
(30, 55, 36, 'Minima officia eum.', '1563572943', 0, 0),
(33, 34, 1, 'Ut et incidunt ut.', '1563572944', 1, 1),
(34, 158, 55, 'Dignissimos vel.', '1563572944', 0, 0),
(36, 11, 147, 'Accusantium omnis voluptatum quasi ducimus.', '1563572944', 0, 0),
(37, 32, 151, 'Quia iure minima.', '1563572944', 1, 1),
(38, 5, 146, 'Quo sed suscipit officia.', '1563572944', 1, 1),
(39, 135, 25, 'Sint veniam minus enim accusamus.', '1563572944', 1, 1),
(42, 157, 160, 'Vero eius.', '1563572944', 0, 1),
(43, 51, 165, 'Unde sed.', '1563572944', 1, 1),
(44, 32, 164, 'Maxime quas facilis.', '1563572944', 0, 0),
(45, 162, 170, 'Et consequuntur.', '1563572944', 0, 0),
(46, 29, 159, 'Eos praesentium.', '1563572944', 1, 0),
(47, 24, 1, 'Sint et est sed.', '1563572944', 1, 1),
(49, 167, 161, 'Quo corrupti in.', '1563572944', 1, 0),
(50, 13, 126, 'Sequi quae libero quo ipsum fugiat.', '1563572944', 0, 0),
(51, 130, 150, 'Est sed.', '1563572944', 0, 1),
(52, 82, 133, 'Dolorum sapiente commodi aperiam.', '1563572944', 1, 1),
(53, 135, 36, 'Recusandae corrupti corporis.', '1563572944', 1, 1),
(54, 1, 24, 'Praesentium repellat.', '1563572944', 1, 0),
(55, 169, 12, 'Voluptas quia.', '1563572944', 0, 1),
(57, 85, 75, 'Aut officia.', '1563572944', 0, 0),
(58, 73, 40, 'Consectetur dolore.', '1563572944', 1, 0),
(59, 171, 174, 'Velit voluptates sed eos repellendus.', '1563572944', 0, 1),
(61, 57, 99, 'Laudantium sit delectus sunt.', '1563572944', 1, 0),
(63, 162, 50, 'Eum.', '1563572945', 0, 1),
(64, 66, 34, 'Incidunt ut.', '1563572945', 1, 1),
(65, 73, 40, 'Illum veniam aliquid.', '1563572945', 1, 0),
(66, 93, 102, 'Natus.', '1563572945', 0, 1),
(70, 55, 81, 'Aut sint.', '1563572945', 1, 0),
(71, 153, 67, 'Aliquam minima.', '1563572945', 1, 0),
(72, 52, 137, 'Quis est omnis quis.', '1563572945', 0, 0),
(74, 78, 59, 'Maiores recusandae et.', '1563572945', 0, 0),
(75, 30, 158, 'Tempora voluptatem.', '1563572945', 0, 0),
(76, 89, 176, 'Aut est.', '1563572945', 0, 0),
(77, 140, 154, 'Molestiae.', '1563572945', 1, 0),
(78, 22, 138, 'Veniam atque.', '1563572945', 1, 0),
(79, 40, 38, 'Ea aspernatur sapiente.', '1563572945', 0, 0),
(81, 168, 11, 'Eos.', '1563572945', 1, 0),
(83, 46, 143, 'Ex.', '1563572945', 1, 1),
(84, 2, 10, 'Tempora.', '1563572945', 1, 1),
(87, 157, 41, 'Animi voluptatem nihil ut ut recusandae.', '1563572945', 0, 0),
(88, 86, 136, 'Voluptatibus et expedita.', '1563572945', 1, 1),
(89, 152, 133, 'Quos et quidem.', '1563572945', 1, 1),
(90, 129, 141, 'Ipsum.', '1563572945', 0, 0),
(92, 166, 101, 'Et consequuntur quisquam repellat odio natus.', '1563572945', 1, 1),
(93, 140, 4, 'Fugit qui eligendi.', '1563572945', 0, 0),
(95, 146, 29, 'Quo temporibus tenetur ipsam dolores consequatur.', '1563572946', 1, 1),
(98, 133, 91, 'Soluta saepe perspiciatis.', '1563572946', 0, 0),
(99, 132, 134, 'Distinctio hic.', '1563572946', 1, 0),
(100, 61, 76, 'Corrupti omnis qui.', '1563572946', 1, 0),
(101, 126, 96, 'Odit qui qui optio.', '1563572946', 0, 1),
(102, 60, 19, 'Sed qui omnis.', '1563572946', 1, 0),
(103, 128, 27, 'Autem suscipit voluptatem quis.', '1563572946', 0, 0),
(105, 2, 88, 'Odit repellat nostrum nulla est.', '1563572946', 1, 0),
(106, 25, 74, 'Est accusantium est.', '1563572946', 0, 0),
(107, 5, 3, 'Enim reprehenderit.', '1563572946', 1, 0),
(109, 10, 41, 'Nulla eum.', '1563572946', 1, 1),
(111, 59, 143, 'Commodi culpa atque consectetur omnis.', '1563572946', 0, 1),
(112, 95, 157, 'Dolor.', '1563572946', 1, 0),
(113, 102, 137, 'Consectetur modi laboriosam molestiae blanditiis quam.', '1563572946', 0, 1),
(114, 11, 37, 'Rerum sit.', '1563572946', 1, 1),
(115, 127, 43, 'Ut.', '1563572946', 1, 0),
(116, 147, 20, 'Quia maiores dolor.', '1563572946', 0, 1),
(117, 149, 41, 'Officiis in rerum.', '1563572946', 0, 1),
(119, 2, 84, 'Sit quasi harum rerum.', '1563572946', 1, 0),
(120, 77, 62, 'Autem tempore.', '1563572946', 1, 1),
(121, 53, 176, 'Neque.', '1563572946', 1, 1),
(123, 85, 87, 'Omnis omnis.', '1563572946', 1, 0),
(124, 9, 139, 'Quas omnis.', '1563572946', 0, 1),
(125, 166, 22, 'Aspernatur omnis reprehenderit eos.', '1563572946', 1, 0),
(126, 42, 19, 'Nisi.', '1563572946', 1, 0),
(129, 93, 132, 'Autem earum voluptatibus.', '1563572946', 1, 0),
(130, 61, 94, 'Maiores debitis aliquid et velit.', '1563572946', 1, 0),
(131, 143, 88, 'Et.', '1563572946', 1, 0),
(132, 161, 164, 'Sint numquam.', '1563572946', 1, 1),
(133, 77, 71, 'Ut numquam ex.', '1563572946', 1, 1),
(134, 167, 7, 'Omnis et.', '1563572946', 1, 0),
(136, 10, 170, 'Eum voluptatem.', '1563572946', 1, 1),
(137, 43, 65, 'Autem quia molestiae.', '1563572947', 1, 0),
(140, 84, 15, 'Aliquam maiores facere.', '1563572947', 0, 0),
(141, 95, 29, 'Modi aliquam velit.', '1563572947', 1, 1),
(142, 41, 163, 'Repellat iusto quam.', '1563572947', 1, 1),
(143, 95, 157, 'Sit hic a.', '1563572947', 0, 1),
(145, 162, 78, 'Neque autem nesciunt distinctio.', '1563572947', 1, 0),
(146, 35, 101, 'Neque consequatur sunt ipsam.', '1563572947', 0, 1),
(148, 157, 21, 'Qui beatae.', '1563572947', 0, 0),
(149, 158, 53, 'Facilis sed.', '1563572947', 1, 0),
(150, 131, 169, 'Officia ratione.', '1563572947', 1, 1),
(153, 23, 87, 'Dolor voluptatem sunt.', '1563572947', 0, 1),
(154, 32, 21, 'Et qui itaque aperiam.', '1563572947', 1, 0),
(155, 75, 95, 'Sunt ut qui.', '1563572947', 1, 1),
(157, 149, 130, 'Possimus.', '1563572947', 0, 1),
(159, 5, 86, 'Neque commodi cumque et.', '1563572947', 1, 0),
(160, 72, 63, 'Temporibus temporibus culpa.', '1563572947', 1, 0),
(161, 87, 58, 'Aut dolor.', '1563572947', 0, 0),
(162, 79, 134, 'Omnis.', '1563572947', 1, 1),
(164, 55, 80, 'Quod dicta nihil.', '1563572947', 0, 1),
(165, 99, 66, 'Dignissimos maxime.', '1563572947', 1, 1),
(166, 28, 168, 'Qui cum earum.', '1563572947', 1, 0),
(168, 71, 19, 'Qui rerum recusandae qui.', '1563572947', 1, 1),
(170, 35, 162, 'Deserunt illo.', '1563572947', 1, 1),
(171, 162, 163, 'Animi est ad cumque qui.', '1563572947', 0, 1),
(172, 94, 47, 'Culpa.', '1563572947', 0, 1),
(173, 131, 39, 'In necessitatibus et soluta.', '1563572948', 0, 0),
(175, 5, 50, 'Sed quo.', '1563572948', 1, 1),
(176, 176, 126, 'Iusto.', '1563572948', 1, 0),
(177, 98, 26, 'Quo libero.', '1563572948', 0, 0),
(179, 170, 60, 'Et dicta recusandae optio.', '1563572948', 0, 0),
(180, 98, 39, 'Nihil adipisci.', '1563572948', 1, 0),
(181, 148, 131, 'Quia aut doloremque.', '1563572948', 1, 0),
(182, 14, 4, 'Ea hic assumenda voluptas consequatur et.', '1563572948', 0, 1),
(183, 127, 96, 'Voluptas omnis provident asperiores saepe in.', '1563572948', 0, 1),
(184, 172, 40, 'Quae nam velit.', '1563572948', 0, 1),
(185, 20, 138, 'Quia praesentium amet.', '1563572948', 0, 0),
(186, 75, 53, 'Molestiae exercitationem saepe sapiente amet deserunt.', '1563572948', 0, 1),
(187, 163, 167, 'Et.', '1563572948', 1, 0),
(189, 50, 170, 'Tempore eum deserunt quo porro.', '1563572948', 1, 0),
(190, 149, 150, 'Eum ex molestiae.', '1563572948', 1, 0),
(191, 134, 80, 'Quibusdam non deleniti.', '1563572948', 0, 1),
(192, 90, 169, 'Et qui corrupti quia.', '1563572948', 0, 0),
(193, 17, 77, 'Necessitatibus necessitatibus.', '1563572948', 0, 1),
(195, 145, 55, 'Unde sapiente sed.', '1563572948', 0, 0),
(197, 53, 161, 'Voluptas dolorem veritatis.', '1563572948', 1, 1),
(199, 41, 49, 'Aut rerum qui.', '1563572949', 0, 0),
(200, 75, 135, 'Sit facere provident possimus.', '1563572949', 0, 1),
(201, 148, 76, 'Quos voluptate ipsum.', '1563572949', 0, 0),
(202, 33, 151, 'Natus dignissimos tempora.', '1563572949', 1, 1),
(203, 136, 103, 'Aut non libero.', '1563572949', 1, 1),
(204, 37, 97, 'Rem vel et.', '1563572949', 0, 0),
(208, 160, 100, 'Possimus et non dolorem illum.', '1563572949', 1, 0),
(209, 91, 169, 'Atque temporibus.', '1563572949', 0, 1),
(210, 153, 127, 'Sit architecto.', '1563572949', 0, 0),
(212, 80, 135, 'Magnam qui eos.', '1563572949', 0, 1),
(213, 2, 103, 'Praesentium et eligendi ut distinctio.', '1563572949', 0, 1),
(214, 128, 89, 'Est.', '1563572950', 1, 0),
(216, 71, 100, 'Aut et occaecati vel.', '1563572950', 1, 0),
(217, 55, 2, 'Ipsa sequi hic.', '1563572950', 1, 0),
(218, 135, 29, 'Ex nostrum voluptas.', '1563572950', 0, 1),
(219, 20, 162, 'Alias minus dignissimos.', '1563572950', 0, 0),
(221, 43, 104, 'Voluptatem aut non.', '1563572950', 1, 0),
(224, 58, 71, 'Dolores necessitatibus perspiciatis in distinctio.', '1563572950', 1, 1),
(225, 54, 16, 'Autem perspiciatis dolore.', '1563572950', 0, 0),
(226, 159, 90, 'Quaerat officia.', '1563572950', 1, 1),
(227, 31, 75, 'Ut ut est.', '1563572950', 1, 1),
(228, 6, 18, 'Non aut dolor necessitatibus.', '1563572950', 0, 1),
(229, 59, 152, 'Placeat magni.', '1563572950', 1, 1),
(230, 79, 97, 'Voluptate architecto.', '1563572950', 1, 1),
(232, 65, 131, 'Non.', '1563572950', 0, 0),
(233, 43, 21, 'Qui mollitia.', '1563572950', 1, 1),
(234, 4, 92, 'Sit aliquid.', '1563572950', 1, 0),
(235, 79, 56, 'Vero dignissimos dolorum.', '1563572950', 1, 0),
(236, 41, 87, 'Officiis est et.', '1563572950', 1, 0),
(238, 48, 64, 'Sed perferendis.', '1563572950', 1, 1),
(239, 1, 74, 'Voluptates ratione.', '1563572950', 0, 1),
(240, 131, 2, 'Labore nihil et doloremque numquam odit.', '1563572950', 1, 0),
(241, 166, 55, 'Omnis maiores sunt autem dolorem quam.', '1563572950', 0, 0),
(242, 60, 155, 'Voluptas rerum.', '1563572950', 1, 1),
(243, 139, 17, 'Commodi adipisci est placeat.', '1563572950', 1, 1),
(244, 5, 25, 'Consectetur et voluptatem accusantium.', '1563572950', 0, 0),
(245, 55, 142, 'Consequatur asperiores.', '1563572950', 1, 0),
(246, 90, 52, 'Aut consequatur.', '1563572950', 0, 1),
(248, 140, 99, 'Quibusdam quia mollitia id.', '1563572950', 1, 1),
(249, 153, 51, 'Est ex voluptas.', '1563572950', 1, 1),
(250, 159, 84, 'Accusamus corrupti qui nulla sed.', '1563572950', 1, 0),
(253, 95, 66, 'Dolor ut at.', '1563572950', 0, 0),
(254, 6, 7, 'Ut ut.', '1563572950', 0, 0),
(256, 95, 12, 'Ullam suscipit officia expedita minima.', '1563572950', 0, 1),
(257, 101, 75, 'Soluta sed quam quis.', '1563572950', 1, 0),
(258, 142, 8, 'Eum suscipit ut numquam.', '1563572950', 0, 0),
(259, 162, 128, 'In.', '1563572950', 0, 0),
(260, 161, 56, 'Omnis id voluptatibus harum temporibus eius.', '1563572950', 1, 0),
(261, 9, 72, 'Nulla sed.', '1563572950', 0, 0),
(263, 44, 130, 'Veniam maxime quam.', '1563572950', 1, 1),
(264, 132, 33, 'Ut placeat cumque recusandae.', '1563572950', 0, 1),
(265, 76, 25, 'Quia est ea voluptas.', '1563572950', 0, 1),
(266, 31, 136, 'Ut quaerat repudiandae.', '1563572950', 0, 1),
(267, 101, 70, 'Rem doloremque.', '1563572950', 1, 1),
(268, 74, 51, 'Nulla sint.', '1563572950', 1, 0),
(269, 32, 64, 'Atque est.', '1563572950', 1, 0),
(270, 22, 148, 'Eos pariatur unde.', '1563572950', 1, 0),
(272, 100, 80, 'Eveniet eligendi nihil nemo quae at.', '1563572950', 1, 0),
(273, 147, 45, 'Nisi cum.', '1563572950', 1, 1),
(274, 91, 136, 'Quia vitae.', '1563572950', 1, 0),
(275, 156, 28, 'Repellat.', '1563572950', 1, 0),
(276, 18, 5, 'Pariatur ut.', '1563572950', 0, 0),
(277, 131, 159, 'Aut eos nihil.', '1563572950', 0, 0),
(278, 4, 29, 'Modi.', '1563572950', 1, 1),
(279, 77, 42, 'Sed quia sunt.', '1563572950', 0, 0),
(280, 169, 3, 'Necessitatibus dolores.', '1563572950', 0, 0),
(281, 17, 25, 'Rem nihil fugit.', '1563572950', 0, 1),
(282, 163, 162, 'Reprehenderit consequatur.', '1563572950', 1, 1),
(283, 99, 158, 'Et consequatur sed.', '1563572950', 0, 1),
(285, 137, 153, 'Et amet.', '1563572950', 1, 0),
(286, 11, 139, 'Rerum suscipit.', '1563572950', 0, 0),
(288, 79, 14, 'Maxime voluptatum.', '1563572950', 1, 0),
(289, 29, 175, 'Illum.', '1563572950', 0, 0),
(290, 99, 151, 'Quia pariatur eum.', '1563572950', 0, 1),
(291, 14, 47, 'Voluptatem mollitia odit in dolorum.', '1563572950', 0, 0),
(292, 159, 47, 'Quos et delectus suscipit.', '1563572950', 0, 0),
(293, 164, 60, 'Aut et fugit.', '1563572950', 1, 0),
(294, 176, 97, 'Rerum.', '1563572950', 0, 0),
(295, 153, 36, 'Quo delectus corrupti quibusdam modi.', '1563572950', 0, 0),
(296, 22, 13, 'Aut blanditiis tempore.', '1563572950', 0, 1),
(297, 9, 132, 'Est quod sed.', '1563572950', 1, 1),
(298, 133, 11, 'Assumenda quia.', '1563572950', 1, 1),
(299, 4, 60, 'Placeat harum facilis numquam labore.', '1563572950', 1, 0),
(300, 154, 138, 'Ratione.', '1563572950', 0, 0),
(301, 171, 66, 'Debitis.', '1563572951', 0, 0),
(302, 96, 45, 'Eveniet distinctio veniam saepe.', '1563572951', 1, 0),
(303, 75, 168, 'Est ipsum.', '1563572951', 1, 0),
(306, 163, 176, 'Ad in enim.', '1563572951', 0, 0),
(313, 35, 129, 'Nulla minus molestias ab.', '1563572951', 0, 1),
(315, 30, 76, 'Quisquam est adipisci.', '1563572951', 0, 1),
(316, 142, 81, 'Dolor consequatur inventore et.', '1563572951', 1, 0),
(317, 38, 171, 'Id delectus.', '1563572951', 1, 0),
(320, 140, 12, 'Blanditiis eligendi eveniet.', '1563572951', 1, 1),
(321, 72, 58, 'Corporis culpa voluptatum et soluta atque.', '1563572951', 0, 0),
(323, 132, 165, 'Ipsum et numquam exercitationem quisquam.', '1563572951', 1, 1),
(324, 1, 104, 'Iure quam consequatur.', '1563572951', 1, 0),
(325, 1, 136, 'Suscipit.', '1563572951', 0, 0),
(327, 104, 36, 'Suscipit.', '1563572951', 1, 1),
(328, 56, 82, 'Voluptatem ut animi.', '1563572951', 0, 0),
(329, 81, 46, 'Dolore id mollitia.', '1563572951', 0, 1),
(331, 157, 132, 'Accusantium fugit.', '1563572951', 0, 1),
(333, 169, 22, 'Veniam et itaque.', '1563572951', 0, 1),
(334, 97, 102, 'Id.', '1563572951', 0, 1),
(336, 8, 161, 'Porro perferendis eligendi vel accusamus.', '1563572951', 1, 1),
(337, 136, 74, 'Eaque ea.', '1563572951', 0, 1),
(338, 32, 128, 'Ut aliquam.', '1563572951', 0, 1),
(339, 23, 42, 'Aut dolorem et.', '1563572951', 0, 1),
(340, 87, 135, 'Mollitia nihil.', '1563572951', 0, 0),
(341, 100, 86, 'Eum dolores possimus.', '1563572951', 0, 0),
(342, 30, 82, 'Voluptas.', '1563572951', 1, 1),
(343, 46, 58, 'Voluptas et.', '1563572951', 0, 0),
(344, 98, 60, 'Odio pariatur.', '1563572951', 1, 0),
(345, 166, 72, 'Temporibus vel commodi possimus dolorem voluptatem.', '1563572951', 0, 0),
(346, 99, 95, 'Tempore recusandae eveniet.', '1563572951', 0, 0),
(347, 32, 15, 'Et earum recusandae temporibus eos.', '1563572951', 1, 0),
(349, 52, 74, 'Ipsum unde velit enim.', '1563572951', 0, 0),
(350, 145, 50, 'Explicabo.', '1563572951', 1, 0),
(352, 148, 173, 'Magni a.', '1563572952', 1, 1),
(353, 69, 161, 'Sed nobis occaecati placeat et.', '1563572952', 1, 1),
(354, 23, 63, 'Fuga illo.', '1563572952', 1, 1),
(355, 38, 5, 'Minima recusandae rerum.', '1563572952', 0, 0),
(356, 166, 41, 'Nihil.', '1563572952', 0, 0),
(359, 21, 74, 'Est minus molestiae quis.', '1563572952', 0, 1),
(362, 56, 47, 'Cupiditate consequatur quas.', '1563572952', 0, 1),
(364, 176, 132, 'Iusto aliquam consequatur qui.', '1563572952', 0, 0),
(365, 33, 90, 'Dolores a alias nemo voluptatem.', '1563572952', 1, 1),
(366, 67, 18, 'Odit voluptatum.', '1563572952', 0, 1),
(367, 167, 166, 'Quidem at at doloribus voluptas.', '1563572952', 0, 0),
(368, 37, 134, 'Distinctio aut qui velit velit enim.', '1563572952', 0, 1),
(369, 50, 53, 'Et suscipit sed.', '1563572952', 1, 1),
(370, 89, 40, 'Quia porro sunt inventore.', '1563572952', 1, 0),
(371, 176, 76, 'Sit et ea voluptas.', '1563572952', 1, 0),
(373, 24, 38, 'Laudantium est ipsam.', '1563572952', 1, 0),
(374, 20, 4, 'Libero quaerat voluptates.', '1563572952', 0, 1),
(375, 127, 155, 'Sit iure.', '1563572952', 0, 1),
(376, 144, 173, 'Eveniet enim nihil.', '1563572952', 1, 1),
(377, 32, 35, 'Sequi neque.', '1563572952', 1, 1),
(378, 167, 10, 'Omnis est.', '1563572952', 1, 1),
(379, 136, 20, 'Aut.', '1563572952', 1, 1),
(380, 80, 132, 'Aut et.', '1563572952', 1, 0),
(381, 51, 41, 'Pariatur atque et.', '1563572952', 1, 0),
(382, 67, 65, 'Qui.', '1563572952', 0, 0),
(383, 100, 153, 'Deserunt.', '1563572952', 0, 0),
(385, 20, 102, 'Voluptas impedit maiores cupiditate.', '1563572952', 1, 0),
(386, 163, 157, 'In architecto.', '1563572952', 0, 0),
(388, 130, 141, 'Dolorem sunt.', '1563572952', 1, 1),
(389, 10, 49, 'Fuga ab est.', '1563572952', 0, 0),
(390, 71, 133, 'Est debitis.', '1563572952', 0, 1),
(391, 88, 65, 'Ex omnis autem numquam fugiat.', '1563572952', 1, 0),
(392, 66, 24, 'Consequuntur reiciendis.', '1563572952', 1, 0),
(393, 135, 26, 'Sed est eius.', '1563572952', 0, 0),
(394, 79, 11, 'Asperiores.', '1563572952', 0, 1),
(396, 13, 31, 'Aut nihil quae repellat.', '1563572952', 0, 1),
(397, 166, 137, 'Cumque fugiat.', '1563572952', 1, 1),
(399, 52, 166, 'Est.', '1563572952', 1, 1),
(400, 85, 175, 'Et adipisci natus occaecati.', '1563572952', 0, 1),
(401, 149, 50, 'Optio dolore.', '1563572952', 1, 1),
(402, 148, 37, 'Est quia perspiciatis dolorem.', '1563572952', 1, 1),
(403, 8, 103, 'Autem inventore voluptatem quia.', '1563572952', 1, 1),
(404, 83, 34, 'Consectetur laborum possimus occaecati.', '1563572953', 1, 0),
(405, 76, 137, 'Delectus sapiente.', '1563572953', 0, 1),
(406, 60, 23, 'Laborum sunt.', '1563572953', 0, 1),
(408, 173, 174, 'Reiciendis mollitia suscipit omnis.', '1563572953', 0, 0),
(409, 65, 80, 'Maxime eveniet ut culpa.', '1563572953', 1, 1),
(412, 89, 22, 'Adipisci.', '1563572953', 0, 0),
(413, 18, 93, 'Asperiores exercitationem inventore quas.', '1563572953', 0, 1),
(414, 99, 146, 'Consequatur nisi delectus.', '1563572953', 0, 0),
(415, 55, 44, 'Est aut.', '1563572953', 1, 1),
(416, 13, 84, 'Fugit enim eos.', '1563572953', 1, 1),
(418, 80, 104, 'Soluta blanditiis cum.', '1563572953', 0, 1),
(419, 70, 168, 'Dicta et illum aliquid.', '1563572953', 0, 0),
(420, 49, 79, 'Sit omnis labore dolorum.', '1563572953', 0, 0),
(421, 164, 20, 'Praesentium.', '1563572953', 0, 0),
(422, 85, 76, 'Harum reprehenderit est veniam magnam.', '1563572953', 0, 1),
(423, 2, 10, 'Quis facilis sed dignissimos voluptas.', '1563572953', 0, 1),
(424, 127, 16, 'Ipsam aut.', '1563572953', 0, 1),
(425, 5, 86, 'Eum.', '1563572953', 1, 0),
(426, 69, 11, 'Similique.', '1563572953', 1, 0),
(427, 56, 80, 'Alias alias ex.', '1563572953', 0, 0),
(428, 85, 152, 'Nemo temporibus rerum.', '1563572953', 1, 1),
(429, 84, 165, 'Sint perspiciatis quisquam cum.', '1563572953', 1, 1),
(430, 64, 6, 'Nihil aut omnis aut ut.', '1563572953', 0, 0),
(431, 85, 135, 'Sit laboriosam fuga minus dignissimos.', '1563572953', 0, 1),
(433, 95, 170, 'Sequi vero sunt aut.', '1563572953', 0, 1),
(434, 168, 129, 'Non voluptates qui quia.', '1563572953', 1, 0),
(435, 95, 160, 'Veniam voluptas ut sint.', '1563572953', 0, 0),
(436, 141, 44, 'Veniam minus.', '1563572953', 0, 1),
(437, 82, 51, 'Aut officia doloribus sit quae atque.', '1563572953', 0, 1),
(438, 71, 37, 'Explicabo.', '1563572953', 0, 1),
(440, 43, 86, 'Perspiciatis facere illum nostrum aperiam architecto.', '1563572953', 0, 1),
(441, 4, 39, 'Et quibusdam esse.', '1563572953', 1, 1),
(442, 69, 92, 'Aut.', '1563572953', 1, 1),
(444, 169, 165, 'Omnis maxime expedita.', '1563572953', 1, 1),
(445, 87, 166, 'Rerum.', '1563572953', 1, 1),
(446, 175, 73, 'Autem odio aut.', '1563572953', 1, 0),
(447, 78, 78, 'Eos non et et.', '1563572953', 1, 1),
(448, 50, 79, 'Veniam assumenda.', '1563572953', 1, 0),
(449, 74, 67, 'Quidem.', '1563572953', 0, 1),
(451, 164, 9, 'Enim.', '1563572953', 0, 1),
(452, 73, 16, 'Et deleniti reiciendis.', '1563572953', 0, 1),
(453, 38, 140, 'Dolor officiis dolores sapiente.', '1563572953', 1, 1),
(455, 47, 165, 'Delectus eos.', '1563572953', 1, 1),
(456, 78, 48, 'Delectus deserunt.', '1563572953', 1, 0),
(457, 75, 84, 'Repellat blanditiis ipsa.', '1563572953', 0, 1),
(458, 29, 8, 'Voluptas nisi a.', '1563572953', 1, 1),
(459, 91, 127, 'Magnam nesciunt assumenda.', '1563572953', 0, 1),
(461, 1, 28, 'Qui nisi quod in.', '1563572953', 0, 1),
(462, 94, 56, 'Soluta.', '1563572953', 0, 1),
(463, 16, 43, 'Dolore deserunt sit quae.', '1563572953', 1, 0),
(465, 13, 93, 'Nesciunt rerum distinctio consequuntur rerum asperiores.', '1563572953', 1, 1),
(466, 126, 17, 'Quis sunt.', '1563572953', 0, 0),
(469, 76, 1, 'Repellendus esse et et.', '1563572953', 0, 0),
(470, 25, 171, 'Necessitatibus et odio.', '1563572954', 0, 0),
(471, 86, 143, 'Quo.', '1563572954', 0, 1),
(473, 55, 22, 'Et magni consequatur.', '1563572954', 0, 0),
(474, 148, 169, 'Voluptatem sint placeat odit.', '1563572954', 1, 0),
(476, 75, 13, 'Soluta quia.', '1563572954', 1, 1),
(477, 162, 56, 'Aliquid.', '1563572954', 0, 0),
(479, 30, 29, 'Voluptas nobis nostrum.', '1563572954', 0, 1),
(480, 100, 84, 'A.', '1563572954', 1, 1),
(481, 59, 126, 'Nihil temporibus ut.', '1563572954', 1, 1),
(482, 175, 130, 'Esse deserunt nihil aut.', '1563572954', 0, 1),
(483, 61, 158, 'Est illo est exercitationem in.', '1563572954', 1, 1),
(484, 59, 157, 'Et consequatur suscipit et inventore labore.', '1563572954', 0, 0),
(486, 143, 68, 'Exercitationem repellat.', '1563572954', 1, 1),
(487, 162, 41, 'Consequatur porro ducimus.', '1563572954', 0, 1),
(488, 55, 96, 'Ut.', '1563572954', 0, 0),
(490, 68, 48, 'Quis consequatur.', '1563572954', 0, 0),
(491, 166, 155, 'Veritatis eum.', '1563572954', 0, 1),
(492, 158, 13, 'Labore sequi.', '1563572954', 1, 1),
(493, 67, 26, 'Rem harum nobis iusto laboriosam.', '1563572954', 0, 0),
(494, 59, 173, 'Ut culpa.', '1563572954', 0, 1),
(495, 134, 52, 'Consequatur aut.', '1563572954', 0, 1),
(497, 128, 176, 'Aliquid reprehenderit ut.', '1563572954', 1, 0),
(498, 61, 57, 'Accusantium enim.', '1563572954', 0, 0),
(501, 152, 101, 'Neque unde.', '1563572954', 0, 1),
(502, 50, 26, 'Culpa quia voluptate nostrum provident.', '1563572954', 0, 0),
(503, 143, 51, 'Quod ut id et.', '1563572954', 0, 0),
(504, 142, 138, 'Consequuntur.', '1563572954', 1, 0),
(505, 145, 133, 'Quisquam.', '1563572954', 1, 1),
(506, 166, 77, 'Tenetur.', '1563572954', 1, 0),
(507, 172, 131, 'Consequatur perferendis.', '1563572954', 0, 0),
(508, 148, 45, 'Rem sint.', '1563572954', 0, 1),
(509, 73, 81, 'Fugit quia reprehenderit debitis.', '1563572954', 0, 1),
(510, 6, 66, 'Qui ipsam veniam non.', '1563572954', 0, 0),
(511, 40, 59, 'Blanditiis est quaerat quia.', '1563572954', 0, 1),
(512, 62, 4, 'Rem cum.', '1563572954', 0, 1),
(513, 25, 61, 'Eum.', '1563572954', 0, 1),
(514, 27, 97, 'Libero qui magni.', '1563572954', 1, 0),
(515, 175, 167, 'Ut placeat.', '1563572954', 1, 0),
(517, 49, 133, 'Quia optio sint.', '1563572954', 0, 1),
(520, 88, 132, 'Et aut explicabo.', '1563572954', 0, 0),
(521, 13, 128, 'Eos consequuntur libero.', '1563572954', 1, 1),
(523, 18, 102, 'Repellendus asperiores laborum consequatur similique.', '1563572954', 1, 1),
(524, 128, 27, 'Eligendi.', '1563572954', 1, 0),
(526, 90, 152, 'Exercitationem totam repellat quo.', '1563572954', 1, 0),
(527, 37, 22, 'Voluptate illum.', '1563572954', 0, 0),
(528, 2, 167, 'Numquam aut et.', '1563572954', 0, 0),
(529, 154, 22, 'Et fugiat accusamus.', '1563572954', 0, 0),
(531, 153, 87, 'Voluptas dolores.', '1563572954', 0, 0),
(533, 11, 140, 'Enim quia asperiores et.', '1563572954', 0, 1),
(534, 146, 36, 'Animi.', '1563572954', 1, 0),
(535, 11, 20, 'Incidunt magni consequatur.', '1563572954', 0, 1),
(536, 57, 25, 'Quas dicta nemo sed qui.', '1563572954', 0, 0),
(538, 164, 67, 'Itaque qui neque qui.', '1563572954', 0, 0),
(540, 150, 14, 'Amet inventore ab placeat.', '1563572954', 1, 1),
(541, 48, 70, 'Ut praesentium vero.', '1563572954', 1, 0),
(542, 66, 7, 'Magni architecto eligendi cum ex ex.', '1563572955', 1, 1),
(543, 146, 57, 'Sunt et totam omnis.', '1563572955', 0, 1),
(544, 34, 56, 'Vel rem.', '1563572955', 0, 1),
(545, 56, 72, 'Repudiandae consequatur nihil amet.', '1563572955', 1, 1),
(546, 103, 67, 'Illum enim.', '1563572955', 0, 1),
(547, 141, 26, 'Qui non natus ea.', '1563572955', 1, 1),
(548, 32, 131, 'Aut dolores consequatur.', '1563572955', 1, 1),
(549, 141, 99, 'Quo ut.', '1563572955', 0, 0),
(550, 137, 128, 'Facilis esse.', '1563572955', 0, 1),
(551, 5, 103, 'Eaque.', '1563572955', 0, 1),
(552, 97, 87, 'Numquam consequatur.', '1563572955', 0, 0),
(553, 165, 41, 'Sed occaecati modi.', '1563572955', 1, 1),
(554, 60, 53, 'Ut dolores adipisci quo unde.', '1563572955', 1, 0),
(555, 44, 68, 'Enim.', '1563572955', 1, 1),
(556, 49, 171, 'Illum et similique.', '1563572955', 1, 0),
(557, 71, 153, 'Iure.', '1563572955', 1, 0),
(558, 51, 36, 'Consequuntur provident.', '1563572955', 0, 0),
(559, 142, 75, 'Beatae occaecati debitis.', '1563572955', 0, 0),
(560, 88, 88, 'Voluptas nemo dolore.', '1563572955', 0, 1),
(561, 1, 81, 'Nostrum debitis est cum.', '1563572955', 0, 0),
(563, 71, 28, 'Sed sunt.', '1563572955', 1, 1),
(564, 94, 94, 'Molestiae.', '1563572955', 0, 0),
(565, 133, 26, 'Omnis aut.', '1563572955', 1, 1),
(566, 97, 8, 'Animi blanditiis nihil.', '1563572955', 0, 0),
(567, 176, 75, 'Debitis dolor distinctio rerum.', '1563572955', 0, 1),
(569, 5, 89, 'Tenetur hic minima iste hic consequatur.', '1563572955', 0, 0),
(570, 156, 71, 'Sed.', '1563572955', 0, 0),
(571, 130, 97, 'Labore aliquam quam saepe.', '1563572955', 0, 0),
(572, 142, 101, 'Nihil alias aspernatur at.', '1563572955', 1, 0),
(573, 66, 92, 'Aut possimus dolorum.', '1563572955', 0, 0),
(575, 44, 53, 'Rerum necessitatibus praesentium.', '1563572955', 1, 1),
(576, 134, 25, 'Odio.', '1563572955', 1, 1),
(577, 9, 174, 'Repellendus.', '1563572955', 0, 1),
(578, 82, 48, 'Mollitia dolor ducimus quos.', '1563572955', 0, 1),
(579, 79, 149, 'Dolorem enim quia impedit.', '1563572955', 0, 1),
(582, 4, 15, 'Est iste et.', '1563572955', 1, 1),
(584, 33, 137, 'Nihil.', '1563572955', 0, 0),
(585, 157, 58, 'Et rerum ea.', '1563572955', 0, 0),
(588, 168, 38, 'Ipsa assumenda commodi.', '1563572955', 0, 0),
(589, 148, 54, 'Sapiente et nulla ipsa.', '1563572955', 0, 0),
(591, 97, 138, 'Ipsum.', '1563572955', 1, 1),
(592, 126, 63, 'Est cumque officia quia ea.', '1563572955', 1, 1),
(593, 50, 133, 'Aut voluptate quia nostrum.', '1563572955', 1, 0),
(594, 94, 46, 'Molestiae neque.', '1563572955', 1, 1),
(595, 149, 172, 'Quibusdam tenetur ut amet sed enim.', '1563572955', 0, 0),
(596, 88, 159, 'Modi voluptatum autem error.', '1563572955', 1, 0),
(597, 51, 176, 'Quae doloremque assumenda.', '1563572955', 1, 0),
(598, 46, 97, 'Sit a.', '1563572955', 0, 0),
(599, 91, 147, 'Possimus ex.', '1563572955', 0, 1),
(602, 40, 74, 'Molestias non voluptatem.', '1563572955', 1, 0),
(605, 18, 27, 'Quasi dolor.', '1563572956', 0, 0),
(606, 31, 154, 'Rerum reiciendis ut temporibus ipsa.', '1563572956', 1, 1),
(607, 41, 69, 'Minima molestias ut est.', '1563572956', 0, 0),
(608, 130, 58, 'Assumenda atque harum eum ut.', '1563572956', 0, 1),
(609, 153, 39, 'Repellat aut sunt aspernatur.', '1563572956', 1, 0),
(610, 83, 82, 'Quia molestias quisquam.', '1563572956', 0, 0),
(612, 90, 65, 'Consectetur tenetur.', '1563572956', 0, 1),
(613, 6, 100, 'Velit nobis aut.', '1563572956', 1, 1),
(614, 21, 162, 'Modi soluta ratione repudiandae.', '1563572956', 1, 1),
(615, 4, 77, 'Voluptatem cumque.', '1563572956', 1, 0),
(616, 46, 39, 'Labore in aut.', '1563572956', 1, 1),
(618, 43, 147, 'Et veniam recusandae.', '1563572956', 1, 1),
(619, 7, 8, 'Adipisci.', '1563572956', 1, 0),
(620, 49, 80, 'Nesciunt sint sit sapiente animi.', '1563572956', 1, 1),
(621, 78, 131, 'Rerum iusto omnis laborum.', '1563572956', 1, 0),
(622, 70, 130, 'Libero qui qui aliquid qui.', '1563572956', 1, 0),
(624, 161, 136, 'Facere eius natus.', '1563572956', 1, 1),
(625, 13, 156, 'Pariatur ut.', '1563572956', 1, 0),
(626, 14, 12, 'Ad hic veritatis ea.', '1563572956', 1, 0),
(627, 174, 100, 'In cumque fugit voluptatibus aut.', '1563572956', 0, 0),
(628, 19, 44, 'Accusamus quis laboriosam.', '1563572956', 1, 1),
(629, 25, 2, 'Rerum error eaque consequatur adipisci.', '1563572956', 1, 0),
(630, 28, 174, 'Autem sapiente corrupti.', '1563572956', 1, 1),
(631, 74, 49, 'Sed nihil aut.', '1563572956', 1, 0),
(632, 8, 134, 'Soluta qui.', '1563572956', 0, 1),
(634, 174, 92, 'Provident assumenda.', '1563572956', 1, 0),
(635, 5, 49, 'Esse maiores.', '1563572956', 1, 0),
(636, 88, 26, 'Qui sint numquam quis sunt at.', '1563572956', 1, 1),
(638, 134, 22, 'Assumenda rem amet.', '1563572956', 1, 0),
(639, 54, 77, 'Commodi.', '1563572956', 1, 0),
(640, 31, 155, 'Sunt.', '1563572956', 1, 1),
(641, 37, 71, 'Excepturi tempora.', '1563572956', 1, 0),
(643, 133, 21, 'Perferendis.', '1563572956', 1, 0),
(644, 128, 54, 'Et officia quam.', '1563572956', 0, 0),
(645, 69, 135, 'Aut consequatur.', '1563572956', 1, 0),
(650, 130, 137, 'Minus atque sapiente sint earum.', '1563572956', 0, 1),
(654, 29, 164, 'Quam ea.', '1563572956', 0, 1),
(655, 51, 101, 'Ullam dolores accusamus nihil omnis.', '1563572956', 1, 1),
(656, 99, 145, 'Ipsum.', '1563572956', 0, 1),
(658, 37, 153, 'Amet.', '1563572956', 1, 0),
(659, 134, 37, 'Molestiae ipsum rerum illo dolorum.', '1563572956', 1, 1),
(660, 42, 130, 'Quasi vitae.', '1563572956', 1, 0),
(661, 26, 147, 'Provident quo et.', '1563572956', 1, 0),
(662, 145, 93, 'Nam.', '1563572956', 1, 1),
(663, 161, 82, 'Inventore non.', '1563572956', 1, 1),
(664, 90, 59, 'Illum nisi voluptatem explicabo necessitatibus.', '1563572956', 0, 1),
(665, 140, 131, 'Rerum quas odio neque.', '1563572956', 1, 0),
(667, 20, 96, 'Officia dolores delectus harum.', '1563572957', 0, 0),
(669, 157, 62, 'Aut incidunt.', '1563572957', 0, 1),
(670, 39, 46, 'Deleniti dicta placeat expedita occaecati.', '1563572957', 1, 1),
(671, 161, 101, 'Sit eligendi.', '1563572957', 1, 0),
(672, 135, 162, 'Eum reprehenderit.', '1563572957', 1, 0),
(673, 63, 20, 'Omnis cum molestias eos.', '1563572957', 0, 0),
(674, 31, 56, 'Fugit inventore eos quisquam aperiam nobis.', '1563572957', 0, 1),
(675, 85, 81, 'Temporibus.', '1563572957', 1, 1),
(676, 24, 64, 'Dolores et sunt facere.', '1563572957', 1, 1),
(677, 78, 27, 'Atque eos.', '1563572957', 0, 1),
(678, 157, 26, 'Voluptatem perspiciatis.', '1563572957', 1, 1),
(680, 129, 47, 'Sequi velit ducimus minus in.', '1563572957', 1, 1),
(681, 31, 129, 'Laudantium et itaque.', '1563572957', 1, 1),
(682, 50, 90, 'Nesciunt corrupti.', '1563572957', 1, 1),
(683, 32, 152, 'Sunt et vel ea molestias.', '1563572957', 1, 1),
(684, 80, 152, 'Repellendus aspernatur.', '1563572957', 0, 0),
(685, 70, 90, 'Quo nostrum ut.', '1563572957', 0, 1),
(686, 75, 91, 'Atque accusamus culpa cupiditate sunt.', '1563572957', 1, 0),
(687, 166, 24, 'Id magni impedit.', '1563572957', 1, 1),
(688, 2, 92, 'Vero officia.', '1563572957', 1, 0),
(690, 173, 2, 'Ad qui quia quis.', '1563572957', 1, 0),
(691, 87, 11, 'Quo eveniet.', '1563572957', 0, 1),
(693, 153, 86, 'Omnis laborum.', '1563572957', 0, 0),
(694, 146, 73, 'Et autem autem officia.', '1563572957', 0, 1),
(695, 41, 21, 'Repellat occaecati voluptatum vel.', '1563572957', 0, 0),
(696, 155, 41, 'Tenetur repellendus.', '1563572957', 1, 1),
(698, 151, 30, 'Accusantium perferendis qui.', '1563572957', 1, 0),
(699, 41, 42, 'Qui exercitationem ratione veniam.', '1563572957', 1, 1),
(700, 12, 20, 'Recusandae nulla.', '1563572957', 0, 0),
(701, 135, 145, 'Aliquid consequatur.', '1563572957', 1, 0),
(702, 81, 148, 'Voluptatem sunt libero.', '1563572957', 0, 0),
(703, 70, 129, 'Aut deleniti maxime.', '1563572957', 1, 1),
(704, 170, 138, 'Ad.', '1563572957', 0, 0),
(706, 15, 94, 'Sunt facilis.', '1563572957', 1, 0),
(708, 25, 170, 'Sed reiciendis quos.', '1563572957', 1, 1),
(709, 95, 45, 'Facilis non facere.', '1563572957', 0, 1),
(710, 102, 8, 'Ratione sunt.', '1563572957', 1, 0),
(711, 152, 88, 'Debitis eos aut omnis mollitia.', '1563572957', 0, 0),
(712, 26, 25, 'Ut asperiores.', '1563572957', 0, 1),
(714, 9, 156, 'Explicabo hic quia.', '1563572957', 0, 1),
(715, 126, 79, 'Totam adipisci delectus.', '1563572957', 1, 1),
(716, 66, 82, 'Sed suscipit vitae.', '1563572957', 0, 1),
(718, 40, 156, 'Est quasi.', '1563572957', 0, 1),
(719, 156, 32, 'Quo voluptatum repellendus.', '1563572957', 0, 0),
(720, 164, 143, 'Amet ut dolorem id accusantium autem.', '1563572957', 0, 0),
(721, 101, 34, 'Magni magnam ut.', '1563572957', 1, 1),
(723, 84, 61, 'Qui.', '1563572957', 0, 1),
(724, 60, 170, 'Sint qui porro.', '1563572957', 1, 0),
(725, 49, 37, 'Consequatur odio dolores aut harum quis.', '1563572957', 1, 0),
(727, 175, 22, 'Reiciendis hic voluptatibus et.', '1563572957', 1, 0),
(728, 27, 68, 'Consequuntur in voluptas.', '1563572957', 1, 1),
(729, 50, 127, 'Et repudiandae illo quia.', '1563572957', 1, 0),
(730, 154, 146, 'Ea quia quia.', '1563572957', 0, 1),
(731, 154, 17, 'Deleniti error.', '1563572957', 0, 0),
(732, 171, 30, 'Mollitia sequi asperiores.', '1563572957', 1, 0),
(733, 43, 102, 'Quisquam molestiae.', '1563572958', 0, 1),
(734, 155, 43, 'Ducimus ipsam dolore.', '1563572958', 0, 1),
(736, 171, 95, 'Sunt ea provident.', '1563572958', 1, 0),
(737, 74, 160, 'Et ad.', '1563572958', 0, 1),
(738, 153, 27, 'Voluptate vel expedita.', '1563572958', 1, 0),
(739, 19, 76, 'Nemo qui.', '1563572958', 1, 0),
(741, 30, 33, 'Non deleniti.', '1563572958', 1, 0),
(742, 8, 37, 'Vitae provident.', '1563572958', 0, 0),
(743, 84, 72, 'Possimus sit itaque officia.', '1563572958', 1, 0),
(745, 150, 95, 'Delectus illum.', '1563572958', 1, 1),
(746, 139, 75, 'Sequi consequatur.', '1563572958', 0, 0),
(747, 66, 160, 'Qui vel autem rerum.', '1563572958', 0, 1),
(748, 75, 3, 'Rerum modi voluptatem commodi tempora.', '1563572958', 0, 0),
(750, 17, 22, 'Impedit facilis repellat alias.', '1563572958', 1, 0),
(751, 149, 60, 'Perferendis a.', '1563572958', 1, 1),
(753, 163, 63, 'Ut dolores in ut.', '1563572958', 0, 1),
(754, 45, 132, 'Molestiae quos.', '1563572958', 1, 0),
(755, 4, 64, 'Cupiditate repellendus sequi.', '1563572958', 0, 0),
(756, 164, 92, 'Porro neque vero.', '1563572958', 1, 0),
(757, 29, 69, 'Nobis.', '1563572958', 1, 1),
(758, 151, 20, 'Quas.', '1563572958', 0, 0),
(759, 139, 34, 'Voluptas ea.', '1563572958', 1, 1),
(761, 48, 7, 'Provident debitis quaerat consectetur.', '1563572958', 0, 1),
(763, 146, 81, 'Et officia perspiciatis.', '1563572958', 1, 0),
(764, 32, 140, 'Eligendi ad deleniti.', '1563572958', 0, 0),
(765, 162, 28, 'Hic.', '1563572958', 0, 0),
(766, 89, 39, 'Suscipit tenetur qui.', '1563572958', 1, 0),
(767, 63, 8, 'Soluta ut.', '1563572958', 0, 0),
(770, 75, 4, 'Vitae recusandae iste ratione nobis amet.', '1563572958', 1, 0),
(771, 98, 35, 'Eos omnis asperiores vitae qui.', '1563572958', 0, 0),
(772, 175, 25, 'Quis.', '1563572958', 1, 0),
(773, 35, 95, 'Et totam.', '1563572958', 0, 0),
(775, 162, 7, 'Omnis asperiores.', '1563572958', 0, 0),
(776, 21, 16, 'Architecto dolorem nulla non est.', '1563572958', 0, 0),
(778, 61, 39, 'Nostrum beatae.', '1563572958', 1, 0),
(779, 25, 85, 'Voluptatum dolorum veritatis.', '1563572958', 0, 1),
(780, 9, 50, 'Laboriosam quidem ducimus.', '1563572958', 0, 0),
(781, 1, 20, 'Deleniti dolores.', '1563572958', 0, 0),
(782, 84, 93, 'Dolores ipsa.', '1563572958', 0, 1),
(783, 19, 164, 'Neque animi temporibus.', '1563572958', 1, 1),
(784, 34, 152, 'Aliquid itaque perspiciatis labore ad temporibus.', '1563572958', 1, 1),
(785, 151, 39, 'Laborum.', '1563572958', 0, 1),
(786, 45, 58, 'At aut et quas.', '1563572958', 1, 0),
(787, 74, 22, 'Aut doloribus sit reprehenderit.', '1563572958', 1, 1),
(788, 70, 25, 'Et libero eaque eius doloribus.', '1563572959', 0, 0),
(790, 31, 73, 'Dolores.', '1563572959', 0, 1),
(791, 173, 32, 'Iste sit at quod et pariatur.', '1563572959', 1, 1),
(793, 36, 160, 'Recusandae ex perferendis.', '1563572959', 0, 0),
(794, 47, 26, 'Perspiciatis officiis.', '1563572959', 0, 0),
(795, 19, 5, 'Et possimus voluptatum.', '1563572959', 0, 1),
(796, 47, 76, 'Et aliquam molestiae.', '1563572959', 0, 1),
(798, 49, 159, 'Ea.', '1563572959', 1, 1),
(799, 15, 81, 'Velit odio.', '1563572959', 1, 0),
(800, 78, 144, 'Odit cum est sapiente et dolorem.', '1563572959', 0, 1),
(801, 67, 93, 'Magnam.', '1563572959', 1, 0),
(802, 42, 82, 'Molestiae laborum voluptas enim accusamus.', '1563572959', 1, 0),
(803, 59, 167, 'Eum nam.', '1563572959', 0, 0),
(805, 19, 172, 'Voluptatibus qui reiciendis.', '1563572959', 1, 1),
(806, 133, 78, 'Nisi reiciendis ipsa praesentium quas.', '1563572959', 1, 0),
(807, 38, 83, 'Sit et.', '1563572959', 1, 1),
(808, 170, 48, 'Quae vitae.', '1563572959', 1, 1),
(811, 54, 74, 'Quam officia voluptas.', '1563572959', 0, 1),
(812, 4, 130, 'Est beatae.', '1563572959', 0, 0),
(813, 141, 38, 'Id ipsum.', '1563572959', 1, 0),
(814, 150, 142, 'Odit quo ullam rerum.', '1563572959', 1, 1),
(815, 172, 91, 'Voluptas amet quidem dolorem.', '1563572959', 0, 1),
(816, 129, 134, 'Aliquid voluptas molestiae.', '1563572959', 0, 0),
(817, 158, 168, 'Beatae qui.', '1563572959', 1, 0),
(818, 91, 157, 'Autem rerum dolore.', '1563572959', 0, 0),
(819, 63, 101, 'Non ducimus et ipsam sed.', '1563572959', 1, 0),
(820, 40, 62, 'Debitis dolorum maiores inventore aspernatur rem.', '1563572959', 0, 0),
(821, 2, 60, 'Qui perspiciatis earum.', '1563572959', 0, 1),
(822, 51, 26, 'Et inventore fugiat in quasi deleniti.', '1563572959', 1, 0),
(823, 157, 88, 'Consequatur eum et error.', '1563572959', 0, 0),
(824, 26, 59, 'Maiores ratione qui.', '1563572959', 1, 0),
(825, 37, 88, 'Quibusdam quasi harum.', '1563572959', 0, 0),
(826, 55, 78, 'Odit ad.', '1563572959', 1, 1),
(828, 58, 170, 'Distinctio ipsa.', '1563572959', 1, 1),
(830, 78, 27, 'Sint in reiciendis dolor.', '1563572959', 0, 1),
(833, 82, 49, 'Qui.', '1563572959', 1, 0),
(834, 73, 58, 'Necessitatibus dolor earum.', '1563572959', 0, 0),
(835, 89, 69, 'Iste fugit possimus.', '1563572959', 1, 0),
(836, 98, 69, 'Consectetur.', '1563572959', 1, 0),
(837, 151, 9, 'Non at.', '1563572959', 1, 0),
(838, 130, 52, 'Earum.', '1563572959', 1, 0),
(839, 131, 169, 'Dolor.', '1563572959', 0, 0),
(840, 19, 18, 'Tempore.', '1563572959', 0, 1),
(841, 137, 6, 'Minus praesentium est.', '1563572959', 1, 0),
(842, 140, 55, 'Ea eum cumque sit alias.', '1563572959', 1, 1),
(843, 128, 32, 'Est in beatae fuga at.', '1563572959', 0, 1),
(845, 53, 21, 'Aspernatur magni quo et.', '1563572959', 1, 0),
(846, 86, 13, 'Aut consequatur.', '1563572959', 1, 0),
(848, 172, 151, 'Sed vel fuga.', '1563572960', 0, 0),
(849, 171, 18, 'Tempore ab alias optio facilis eos.', '1563572960', 1, 1),
(851, 81, 99, 'Sed nisi dolorem minus.', '1563572960', 0, 1),
(852, 57, 64, 'Porro natus dolore.', '1563572960', 0, 0),
(854, 92, 19, 'Velit et neque id.', '1563572960', 1, 1),
(855, 26, 86, 'Tempore debitis est necessitatibus nobis.', '1563572960', 1, 1),
(856, 88, 174, 'Quo.', '1563572960', 0, 1),
(857, 44, 19, 'Dolor.', '1563572960', 0, 0),
(859, 163, 54, 'Esse et omnis.', '1563572960', 1, 0),
(860, 83, 37, 'Et minus pariatur nobis.', '1563572960', 0, 0),
(861, 83, 36, 'Ut fuga ad.', '1563572960', 1, 1),
(862, 22, 90, 'Non dolores quos.', '1563572960', 0, 1),
(863, 50, 12, 'Odit quod.', '1563572960', 1, 0),
(864, 51, 73, 'Facere enim.', '1563572960', 0, 1),
(865, 165, 10, 'Eveniet eos vitae.', '1563572960', 1, 1),
(866, 101, 86, 'Sed.', '1563572960', 0, 0),
(867, 147, 1, 'Minus ratione dolor nobis architecto.', '1563572960', 0, 0),
(868, 126, 161, 'Sequi illo inventore.', '1563572960', 1, 1),
(869, 43, 173, 'Totam aliquid.', '1563572960', 1, 0),
(870, 38, 169, 'Dicta.', '1563572960', 1, 0),
(871, 141, 11, 'Ut.', '1563572960', 0, 1),
(872, 36, 143, 'Eum dolor sint nihil harum.', '1563572960', 1, 0),
(873, 8, 127, 'Nostrum consequuntur repellat.', '1563572960', 1, 0),
(875, 50, 11, 'Pariatur.', '1563572960', 1, 1),
(878, 20, 139, 'Sed.', '1563572960', 0, 0),
(879, 137, 65, 'Qui voluptas.', '1563572960', 1, 1),
(881, 75, 131, 'Numquam et alias.', '1563572960', 0, 0),
(883, 12, 149, 'Ipsum voluptas voluptas.', '1563572960', 1, 1),
(886, 83, 11, 'Est nobis aut.', '1563572960', 1, 0),
(887, 154, 54, 'Quia et eveniet.', '1563572961', 0, 1),
(888, 64, 103, 'Sapiente et.', '1563572961', 1, 1),
(890, 151, 166, 'Mollitia velit ea amet atque aperiam.', '1563572961', 1, 0),
(891, 168, 175, 'Aut eligendi.', '1563572961', 0, 0),
(892, 62, 138, 'Officia animi impedit.', '1563572961', 1, 0),
(893, 133, 32, 'Quibusdam eum.', '1563572961', 1, 1),
(894, 65, 5, 'Ut illo.', '1563572961', 0, 1),
(895, 8, 13, 'Debitis distinctio nostrum.', '1563572961', 1, 0),
(896, 76, 46, 'Ratione cumque eaque vel illo.', '1563572961', 0, 0),
(897, 90, 11, 'Officiis non.', '1563572961', 1, 0),
(899, 102, 163, 'Quis.', '1563572961', 1, 0),
(900, 131, 140, 'Excepturi dolor.', '1563572961', 0, 0),
(902, 126, 142, 'Qui occaecati.', '1563572961', 0, 0),
(903, 160, 19, 'Beatae quo cumque.', '1563572961', 1, 0),
(904, 144, 42, 'Ea voluptatum aut reiciendis ratione qui.', '1563572961', 0, 1),
(907, 142, 102, 'Nemo aliquid repellendus.', '1563572961', 1, 1),
(908, 150, 52, 'Qui quam totam qui vel quae.', '1563572961', 0, 1),
(909, 32, 76, 'Ex cum labore.', '1563572961', 1, 1),
(910, 152, 173, 'Earum eius inventore.', '1563572961', 1, 1),
(911, 45, 152, 'Explicabo occaecati neque ea magnam.', '1563572961', 0, 0),
(912, 52, 81, 'Natus.', '1563572961', 1, 0),
(914, 2, 79, 'Dignissimos dolores magni saepe et facilis.', '1563572961', 0, 1),
(915, 64, 137, 'Eum numquam praesentium at.', '1563572961', 0, 1),
(916, 98, 1, 'Qui nihil eum.', '1563572961', 0, 0),
(917, 11, 128, 'Qui sit laborum omnis.', '1563572961', 1, 0),
(919, 7, 14, 'Quaerat dicta delectus error.', '1563572961', 1, 0),
(921, 47, 33, 'Itaque sint.', '1563572962', 1, 0),
(923, 94, 90, 'Exercitationem incidunt.', '1563572962', 1, 1),
(924, 135, 78, 'Illum quos deserunt occaecati quia.', '1563572962', 1, 1),
(925, 65, 161, 'Ipsa quibusdam totam saepe at dolorem.', '1563572962', 1, 1),
(926, 175, 36, 'Nihil et.', '1563572962', 1, 1),
(927, 174, 88, 'Voluptas aut provident.', '1563572962', 1, 0),
(929, 164, 11, 'Dolores pariatur harum.', '1563572962', 1, 0),
(930, 80, 26, 'Officia vel eaque.', '1563572962', 0, 0),
(931, 67, 77, 'Qui velit voluptas.', '1563572962', 1, 1),
(932, 17, 28, 'Odit aut.', '1563572962', 0, 1),
(933, 20, 159, 'Error ut.', '1563572962', 0, 1),
(934, 139, 5, 'Et.', '1563572962', 1, 0),
(935, 55, 126, 'Aut ratione voluptatibus molestiae.', '1563572962', 1, 1),
(936, 39, 14, 'Et tempore cum sed.', '1563572962', 0, 0),
(938, 91, 150, 'Et nesciunt atque.', '1563572963', 0, 1),
(939, 58, 15, 'Voluptas.', '1563572963', 1, 1),
(940, 2, 8, 'Illo ipsa quis.', '1563572963', 0, 1),
(941, 82, 65, 'Nihil.', '1563572963', 0, 1),
(942, 164, 77, 'Rerum facilis.', '1563572963', 1, 0),
(943, 132, 147, 'Quasi animi ad provident modi.', '1563572963', 0, 1),
(946, 102, 103, 'Sit.', '1563572963', 0, 1),
(948, 133, 130, 'Mollitia sit fugiat cumque.', '1563572963', 0, 1),
(949, 97, 143, 'Ea pariatur reprehenderit voluptatem inventore.', '1563572963', 0, 0),
(950, 103, 49, 'Quia quam iste culpa.', '1563572963', 0, 1),
(951, 75, 5, 'Accusantium quia porro error.', '1563572963', 1, 1),
(952, 134, 81, 'Ipsum.', '1563572963', 1, 1),
(953, 64, 75, 'Velit.', '1563572963', 1, 0),
(955, 139, 22, 'Dignissimos ab vitae.', '1563572963', 0, 1),
(958, 155, 11, 'Ut alias.', '1563572963', 0, 0),
(959, 37, 94, 'Est autem.', '1563572963', 1, 0),
(961, 72, 15, 'Veniam nihil sed autem nam.', '1563572964', 0, 0),
(962, 153, 19, 'Alias tempora et explicabo.', '1563572964', 0, 0),
(963, 65, 101, 'Tenetur maxime ut.', '1563572964', 1, 0),
(967, 138, 89, 'Tenetur nulla.', '1563572964', 1, 0),
(968, 59, 90, 'Ullam nostrum.', '1563572964', 1, 0),
(969, 79, 46, 'Ab cumque libero omnis.', '1563572964', 0, 0),
(972, 14, 75, 'Saepe iste.', '1563572964', 0, 0),
(973, 4, 141, 'Voluptas recusandae voluptas quam expedita.', '1563572965', 1, 0),
(974, 135, 45, 'Autem.', '1563572966', 0, 1),
(976, 79, 90, 'Impedit adipisci.', '1563572966', 0, 1),
(977, 2, 53, 'Tempora.', '1563572966', 0, 0),
(978, 145, 2, 'Et velit doloribus et animi.', '1563572966', 1, 0),
(979, 53, 31, 'Culpa maxime aut.', '1563572966', 0, 1),
(980, 75, 42, 'Dolores quae.', '1563572966', 0, 1),
(981, 77, 153, 'Voluptatum ut excepturi expedita.', '1563572966', 0, 1),
(982, 129, 24, 'Voluptatum velit doloribus beatae nesciunt.', '1563572966', 0, 1),
(985, 63, 21, 'Doloremque.', '1563572966', 0, 1),
(987, 140, 85, 'Hic officia minus.', '1563572966', 0, 0),
(988, 47, 22, 'Commodi occaecati optio quod quis sunt.', '1563572966', 1, 1),
(989, 5, 168, 'Voluptas nihil.', '1563572966', 0, 0),
(990, 144, 60, 'Fuga quibusdam.', '1563572966', 0, 1),
(992, 9, 1, 'Voluptatem quae est minima.', '1563572967', 1, 1),
(993, 78, 48, 'Odio dicta fuga.', '1563572967', 1, 1),
(994, 80, 167, 'Commodi rerum suscipit dolor quas.', '1563572967', 0, 0),
(998, 46, 130, 'Et minus maxime.', '1563572967', 1, 1),
(999, 97, 153, 'Eum.', '1563572967', 1, 0),
(1001, 127, 84, 'Dolores consequuntur voluptatum in facere aut.', '1563572967', 0, 0),
(1002, 89, 97, 'Earum aut similique doloribus eum.', '1563572967', 0, 1),
(1003, 95, 60, 'Quia et.', '1563572967', 0, 0),
(1004, 143, 91, 'Blanditiis laboriosam.', '1563572967', 1, 0),
(1005, 28, 51, 'Deserunt et quo.', '1563572967', 0, 0),
(1006, 98, 50, 'Et.', '1563572967', 0, 1),
(1007, 174, 72, 'Quam odit repudiandae.', '1563572967', 1, 0),
(1008, 161, 38, 'Et esse aperiam et.', '1563572967', 0, 1),
(1009, 76, 68, 'Nostrum praesentium.', '1563572967', 0, 1),
(1010, 44, 146, 'Odit.', '1563572967', 0, 1),
(1011, 162, 126, 'Est ullam animi voluptatum.', '1563572967', 0, 1),
(1012, 128, 148, 'Est voluptas rerum et ea.', '1563572967', 0, 0),
(1013, 155, 8, 'Rerum libero dolore qui.', '1563572967', 0, 1),
(1016, 28, 61, 'Beatae est incidunt mollitia dicta.', '1563572968', 0, 1),
(1017, 41, 50, 'Optio voluptatibus.', '1563572968', 1, 0),
(1019, 157, 145, 'Quisquam architecto.', '1563572968', 0, 1),
(1020, 29, 171, 'Ut et.', '1563572968', 0, 1),
(1021, 82, 90, 'Sit non ab.', '1563572968', 1, 0),
(1022, 23, 158, 'Sit sunt labore omnis esse doloremque.', '1563572968', 1, 0),
(1023, 135, 2, 'Voluptatum.', '1563572968', 0, 0),
(1024, 129, 42, 'Qui et sed voluptas.', '1563572968', 0, 0),
(1026, 15, 103, 'Non ipsa et.', '1563572968', 1, 1),
(1028, 97, 133, 'Dolor.', '1563572968', 0, 0),
(1029, 175, 11, 'Molestiae incidunt inventore.', '1563572968', 0, 1),
(1030, 163, 88, 'Deserunt omnis.', '1563572968', 1, 1),
(1031, 15, 143, 'Rerum aut.', '1563572968', 0, 1),
(1032, 92, 148, 'Consectetur provident.', '1563572968', 1, 0),
(1033, 53, 69, 'Est fuga qui cumque.', '1563572968', 0, 1),
(1034, 165, 92, 'Molestiae.', '1563572968', 0, 1),
(1036, 3, 59, 'Qui voluptatem numquam excepturi sit.', '1563572969', 1, 0),
(1037, 9, 155, 'Ea earum commodi.', '1563572969', 0, 1),
(1038, 66, 27, 'Veniam numquam.', '1563572969', 1, 0),
(1039, 77, 153, 'Voluptates explicabo maxime.', '1563572969', 1, 1),
(1040, 163, 20, 'Laboriosam nisi.', '1563572969', 1, 1),
(1041, 144, 27, 'Quaerat.', '1563572969', 0, 1),
(1042, 160, 169, 'Quasi corrupti.', '1563572969', 0, 0),
(1043, 167, 9, 'Quia adipisci suscipit quia.', '1563572969', 1, 1),
(1044, 175, 82, 'Ad.', '1563572969', 1, 0),
(1046, 8, 15, 'Aliquam ut.', '1563572969', 1, 0),
(1047, 64, 171, 'Vero iure.', '1563572969', 1, 1),
(1048, 82, 57, 'Autem itaque.', '1563572969', 1, 0),
(1049, 12, 161, 'Cumque sapiente debitis delectus.', '1563572969', 1, 1),
(1050, 61, 163, 'Non pariatur.', '1563572969', 1, 1),
(1051, 152, 175, 'In odit quos.', '1563572969', 1, 1),
(1055, 147, 61, 'Earum et velit.', '1563572970', 0, 0),
(1056, 140, 89, 'Sint.', '1563572970', 1, 1),
(1058, 87, 63, 'Impedit enim sit.', '1563572970', 0, 0),
(1059, 93, 14, 'Provident.', '1563572970', 1, 1),
(1060, 164, 61, 'A natus autem error corporis.', '1563572970', 1, 0),
(1062, 27, 20, 'Laboriosam minima repellat.', '1563572970', 0, 0),
(1063, 101, 25, 'Laudantium corporis eum.', '1563572970', 1, 0),
(1066, 144, 138, 'Explicabo.', '1563572970', 1, 1),
(1067, 96, 84, 'Reiciendis cupiditate reprehenderit.', '1563572971', 0, 0),
(1068, 33, 2, 'Qui odio rem alias.', '1563572971', 1, 1),
(1069, 97, 143, 'Est modi.', '1563572971', 1, 1),
(1070, 52, 140, 'Et corporis saepe quis.', '1563572971', 1, 0),
(1071, 65, 150, 'Aspernatur voluptatem maiores qui.', '1563572971', 1, 0),
(1072, 34, 171, 'Sunt maiores doloribus ut.', '1563572971', 0, 0),
(1073, 61, 151, 'Numquam nostrum.', '1563572971', 0, 0),
(1074, 8, 171, 'Tempora aliquam recusandae.', '1563572971', 0, 1),
(1075, 165, 145, 'Repellat quis quis omnis totam.', '1563572971', 0, 0),
(1076, 39, 98, 'Maxime in incidunt quia.', '1563572971', 1, 1),
(1077, 52, 61, 'A nostrum quis molestiae.', '1563572971', 0, 1),
(1078, 23, 78, 'Eveniet.', '1563572971', 1, 0),
(1080, 75, 175, 'Iusto amet expedita officiis architecto.', '1563572971', 0, 1),
(1081, 139, 126, 'Cum voluptas vel quibusdam.', '1563572971', 1, 1),
(1082, 132, 89, 'Laborum quibusdam adipisci.', '1563572971', 1, 1),
(1083, 47, 38, 'Doloremque soluta nisi.', '1563572971', 0, 0),
(1085, 30, 73, 'Accusantium autem et est veniam.', '1563572971', 1, 1),
(1086, 139, 104, 'Quia fuga impedit.', '1563572971', 0, 0),
(1088, 5, 133, 'Sit facere.', '1563572971', 1, 0),
(1089, 165, 41, 'Nam repellat dignissimos doloremque perspiciatis.', '1563572971', 0, 0),
(1090, 41, 131, 'Minus laborum tenetur aut eligendi.', '1563572971', 0, 0),
(1091, 14, 5, 'Aut placeat.', '1563572971', 0, 1),
(1092, 130, 88, 'Nemo voluptatem maxime est.', '1563572971', 1, 0),
(1093, 42, 28, 'Consequatur dolores dicta.', '1563572971', 0, 0),
(1094, 82, 12, 'Consequatur reiciendis.', '1563572971', 0, 1),
(1096, 58, 88, 'Amet nobis animi.', '1563572971', 1, 0),
(1098, 159, 59, 'Corrupti vitae possimus totam eligendi.', '1563572971', 1, 0),
(1099, 74, 53, 'Aspernatur est et.', '1563572972', 1, 0),
(1102, 97, 140, 'Ad rerum repellat id.', '1563572972', 1, 1),
(1103, 137, 127, 'Aut sit pariatur.', '1563572972', 1, 0),
(1105, 137, 24, 'Sint animi necessitatibus.', '1563572972', 0, 0),
(1106, 37, 78, 'In eveniet consectetur.', '1563572972', 1, 0),
(1107, 86, 149, 'Aperiam nihil quidem temporibus.', '1563572972', 0, 1),
(1108, 50, 87, 'Impedit tempore quis sint distinctio.', '1563572972', 0, 1),
(1110, 137, 174, 'Exercitationem unde cupiditate.', '1563572972', 1, 1),
(1111, 129, 174, 'Voluptas quas sed est.', '1563572972', 0, 0),
(1114, 165, 173, 'Molestias mollitia est distinctio ut.', '1563572972', 1, 1),
(1115, 150, 60, 'Consectetur et atque.', '1563572972', 1, 1),
(1116, 5, 50, 'Neque tenetur.', '1563572972', 1, 1),
(1117, 12, 70, 'Id enim ullam beatae quae praesentium.', '1563572972', 1, 0),
(1118, 93, 145, 'Labore velit velit eos.', '1563572972', 0, 1),
(1119, 141, 143, 'Quia dignissimos qui.', '1563572972', 0, 1);
INSERT INTO `messages_list` (`id`, `userId`, `toId`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`) VALUES
(1120, 7, 130, 'Qui veritatis quis.', '1563572972', 0, 0),
(1121, 139, 87, 'Quia dignissimos autem aspernatur laudantium.', '1563572972', 1, 0),
(1122, 2, 1, 'Laborum fugit eos illo.', '1563572972', 0, 0),
(1124, 168, 87, 'Molestiae reprehenderit.', '1563572972', 0, 0),
(1126, 9, 154, 'Sunt asperiores.', '1563572972', 0, 1),
(1129, 19, 65, 'Rerum excepturi nihil minima quia.', '1563572972', 0, 1),
(1130, 16, 132, 'Quidem provident distinctio.', '1563572972', 1, 1),
(1131, 6, 40, 'Id dolor nemo similique.', '1563572972', 1, 1),
(1132, 153, 147, 'Deserunt porro sed repudiandae nihil.', '1563572972', 1, 0),
(1133, 72, 57, 'Corporis dolorem.', '1563572972', 0, 1),
(1135, 42, 128, 'Et blanditiis dolorum.', '1563572972', 1, 1),
(1136, 16, 50, 'Veritatis veritatis fugiat aut.', '1563572972', 1, 1),
(1137, 141, 67, 'Illo doloribus voluptas.', '1563572972', 0, 1),
(1138, 162, 21, 'Ipsam.', '1563572972', 1, 1),
(1139, 161, 87, 'Fugiat nihil.', '1563572972', 0, 0),
(1140, 153, 80, 'Nisi temporibus blanditiis.', '1563572972', 0, 0),
(1141, 4, 172, 'At ratione ducimus assumenda ea.', '1563572972', 0, 0),
(1142, 165, 2, 'Libero fugit.', '1563572972', 0, 0),
(1143, 26, 48, 'Tenetur magnam.', '1563572972', 0, 0),
(1145, 176, 61, 'Ut rerum id.', '1563572972', 1, 0),
(1147, 18, 155, 'Qui voluptatem corrupti.', '1563572972', 1, 0),
(1148, 138, 56, 'Aut.', '1563572972', 0, 0),
(1149, 39, 74, 'Sint sapiente voluptates harum quasi blanditiis.', '1563572972', 1, 1),
(1150, 147, 20, 'Autem nihil.', '1563572972', 1, 1),
(1151, 169, 79, 'Nulla maxime quisquam explicabo.', '1563572972', 1, 0),
(1152, 69, 16, 'Eum sed.', '1563572972', 0, 1),
(1153, 60, 165, 'Dolore minus.', '1563572972', 0, 0),
(1154, 135, 57, 'Et provident adipisci.', '1563572972', 1, 1),
(1155, 138, 149, 'Occaecati odit.', '1563572972', 1, 0),
(1156, 50, 68, 'Atque.', '1563572972', 0, 0),
(1158, 64, 67, 'Minima culpa consectetur.', '1563572972', 1, 0),
(1159, 24, 55, 'Sunt in voluptatem dolores.', '1563572972', 0, 0),
(1161, 37, 39, 'Amet nihil amet.', '1563572972', 0, 1),
(1162, 169, 46, 'Eos ipsam perferendis provident.', '1563572972', 1, 1),
(1163, 93, 68, 'Aut voluptatem ea.', '1563572972', 0, 0),
(1164, 82, 104, 'Adipisci dicta.', '1563572972', 0, 1),
(1165, 33, 38, 'Dolores ullam ipsa.', '1563572972', 0, 0),
(1166, 134, 165, 'Molestiae.', '1563572972', 1, 1),
(1168, 102, 132, 'Et qui atque sit.', '1563572972', 1, 1),
(1169, 66, 17, 'Velit voluptas facilis.', '1563572972', 1, 1),
(1172, 145, 76, 'Quia tenetur cupiditate aut.', '1563572972', 1, 1),
(1173, 173, 13, 'Consequatur consectetur perspiciatis odit iste eos.', '1563572972', 1, 0),
(1174, 19, 76, 'Numquam cupiditate quaerat veritatis.', '1563572972', 1, 1),
(1175, 142, 12, 'Aspernatur accusantium.', '1563572972', 1, 0),
(1177, 54, 48, 'Culpa et.', '1563572972', 0, 1),
(1178, 44, 78, 'Qui non et cupiditate blanditiis.', '1563572972', 1, 1),
(1179, 95, 21, 'Quia odio.', '1563572972', 1, 1),
(1180, 159, 94, 'Atque nostrum pariatur.', '1563572972', 1, 0),
(1181, 140, 103, 'Non tempora.', '1563572972', 0, 0),
(1182, 172, 16, 'Doloremque esse.', '1563572972', 1, 0),
(1183, 136, 131, 'Quibusdam rerum labore.', '1563572972', 1, 1),
(1185, 34, 16, 'Ut.', '1563572972', 1, 0),
(1188, 90, 98, 'Ullam iure ipsum impedit.', '1563572973', 0, 1),
(1189, 87, 25, 'Rerum esse.', '1563572973', 0, 1),
(1190, 151, 35, 'Aperiam non labore.', '1563572973', 1, 0),
(1191, 130, 137, 'Aliquam esse.', '1563572973', 1, 0),
(1193, 147, 152, 'Architecto modi.', '1563572973', 0, 1),
(1195, 26, 73, 'Est qui consequatur.', '1563572973', 1, 1),
(1196, 133, 42, 'Quo eos.', '1563572973', 0, 1),
(1197, 171, 38, 'Et.', '1563572973', 1, 1),
(1198, 4, 104, 'Cum natus.', '1563572973', 0, 1),
(1199, 166, 62, 'Cum animi.', '1563572973', 0, 1),
(1200, 95, 160, 'Rerum sunt ut consequatur dolor.', '1563572973', 0, 0),
(1201, 146, 136, 'Dolore nesciunt ipsa iure est cum.', '1563572973', 1, 0),
(1204, 161, 29, 'Doloribus placeat cupiditate fugit.', '1563572973', 1, 0),
(1205, 159, 152, 'Non quibusdam quaerat.', '1563572973', 0, 0),
(1206, 130, 72, 'Expedita qui.', '1563572973', 0, 0),
(1207, 73, 15, 'Et.', '1563572973', 0, 0),
(1208, 160, 161, 'Ut quia corrupti.', '1563572973', 1, 1),
(1209, 170, 52, 'Nobis velit nesciunt.', '1563572973', 0, 0),
(1210, 101, 169, 'Corrupti expedita.', '1563572973', 0, 0),
(1211, 22, 133, 'Non in veritatis et.', '1563572973', 1, 1),
(1212, 166, 66, 'Quia et repudiandae.', '1563572973', 1, 1),
(1213, 31, 65, 'Ad similique explicabo.', '1563572973', 0, 0),
(1214, 143, 143, 'Accusamus.', '1563572973', 1, 0),
(1215, 3, 9, 'Distinctio.', '1563572973', 1, 0),
(1216, 170, 174, 'Nihil facilis blanditiis rerum exercitationem suscipit.', '1563572973', 1, 1),
(1217, 39, 75, 'Amet quia rerum.', '1563572973', 0, 1),
(1218, 61, 151, 'Modi suscipit rerum.', '1563572973', 1, 1),
(1220, 66, 168, 'Modi ut similique voluptate.', '1563572973', 1, 1),
(1221, 170, 20, 'Et fuga.', '1563572973', 0, 1),
(1222, 129, 9, 'Totam eos et molestiae.', '1563572973', 0, 0),
(1223, 76, 76, 'Eveniet enim.', '1563572973', 0, 1),
(1224, 19, 169, 'Aut eos deleniti ea aut.', '1563572973', 1, 1),
(1225, 152, 167, 'Vel repellendus rem.', '1563572973', 0, 1),
(1227, 159, 9, 'Eius accusamus nulla corporis est.', '1563572973', 1, 1),
(1229, 92, 57, 'Iusto eaque.', '1563572973', 1, 1),
(1230, 4, 46, 'Similique et.', '1563572973', 0, 1),
(1233, 96, 95, 'Autem illum magnam.', '1563572973', 0, 1),
(1235, 150, 90, 'Ad iste praesentium fugiat modi ut.', '1563572973', 1, 1),
(1236, 101, 141, 'Sed temporibus ut mollitia.', '1563572973', 1, 1),
(1238, 176, 11, 'Veritatis eveniet fuga.', '1563572973', 1, 0),
(1239, 63, 90, 'Et.', '1563572973', 1, 0),
(1241, 60, 77, 'Aperiam labore.', '1563572973', 1, 1),
(1242, 60, 81, 'Corporis aut ipsam aut.', '1563572973', 1, 0),
(1243, 76, 10, 'Enim deserunt sit.', '1563572973', 1, 0),
(1244, 90, 162, 'Magnam distinctio ullam dolores.', '1563572973', 1, 1),
(1245, 164, 35, 'Corrupti voluptatem.', '1563572973', 1, 0),
(1246, 50, 56, 'Nostrum autem quis.', '1563572973', 0, 1),
(1247, 67, 68, 'Harum doloremque cum voluptatibus.', '1563572973', 1, 1),
(1248, 153, 164, 'Omnis beatae odio quis.', '1563572973', 1, 0),
(1249, 100, 126, 'Quae error dolore.', '1563572973', 0, 1),
(1252, 40, 46, 'Qui fugit consequuntur.', '1563572973', 1, 1),
(1253, 16, 176, 'Dolores consequatur accusantium.', '1563572973', 0, 0),
(1254, 104, 151, 'Enim doloremque sint.', '1563572973', 1, 0),
(1256, 42, 80, 'Voluptatem sed.', '1563572973', 0, 0),
(1257, 137, 32, 'Itaque nesciunt repellat repudiandae.', '1563572973', 0, 0),
(1258, 27, 142, 'Id.', '1563572973', 1, 0),
(1259, 147, 159, 'Iure voluptatum quo.', '1563572973', 0, 0),
(1260, 164, 131, 'Iste ad dignissimos voluptas quod.', '1563572973', 0, 0),
(1261, 169, 33, 'Dolor.', '1563572973', 1, 1),
(1262, 34, 147, 'Corporis.', '1563572973', 0, 1),
(1264, 77, 53, 'Minus odio.', '1563572973', 0, 0),
(1268, 14, 153, 'Aspernatur praesentium perferendis.', '1563572973', 1, 0),
(1269, 11, 127, 'Esse voluptatibus.', '1563572973', 1, 1),
(1270, 92, 24, 'Recusandae.', '1563572973', 1, 1),
(1271, 53, 166, 'Cupiditate ipsam voluptate.', '1563572973', 0, 1),
(1273, 147, 9, 'Quaerat corrupti nemo.', '1563572973', 0, 1),
(1274, 90, 89, 'Officia voluptatum magni.', '1563572973', 0, 1),
(1275, 64, 97, 'Totam et.', '1563572973', 0, 1),
(1278, 94, 99, 'Nihil.', '1563572973', 1, 1),
(1279, 137, 3, 'Maiores aut aut et.', '1563572973', 0, 1),
(1283, 163, 132, 'Atque aperiam eos.', '1563572974', 0, 1),
(1284, 27, 58, 'Nihil.', '1563572974', 0, 1),
(1285, 47, 88, 'Eligendi.', '1563572974', 1, 0),
(1286, 23, 8, 'Architecto reprehenderit placeat.', '1563572974', 1, 0),
(1287, 141, 18, 'Nisi et et totam.', '1563572974', 0, 1),
(1288, 58, 78, 'Dignissimos inventore cupiditate.', '1563572974', 1, 0),
(1289, 84, 152, 'Est tempora.', '1563572974', 1, 1),
(1290, 99, 144, 'Sit.', '1563572974', 0, 0),
(1291, 151, 148, 'Adipisci.', '1563572974', 1, 1),
(1292, 159, 173, 'Hic.', '1563572974', 1, 0),
(1293, 130, 173, 'Voluptatem laboriosam est hic.', '1563572974', 0, 0),
(1294, 59, 69, 'Et non.', '1563572974', 1, 0),
(1295, 96, 81, 'Repellat.', '1563572974', 1, 0),
(1296, 171, 81, 'Et beatae.', '1563572974', 0, 0),
(1298, 22, 89, 'Unde qui.', '1563572974', 1, 0),
(1300, 29, 84, 'Est quasi.', '1563572974', 1, 1),
(1302, 164, 95, 'Et.', '1563572974', 0, 0),
(1303, 52, 27, 'Quasi at.', '1563572974', 1, 1),
(1304, 145, 24, 'Ab tenetur in sed.', '1563572974', 0, 1),
(1305, 148, 147, 'Eaque totam ipsam.', '1563572974', 0, 0),
(1306, 135, 7, 'Nostrum qui quasi rerum.', '1563572974', 1, 0),
(1307, 88, 93, 'Consectetur at laborum.', '1563572974', 1, 0),
(1311, 90, 27, 'Aut ut.', '1563572974', 0, 0),
(1312, 129, 101, 'Ipsum voluptatem debitis.', '1563572974', 1, 1),
(1313, 131, 68, 'Mollitia qui repellendus.', '1563572974', 1, 1),
(1314, 88, 34, 'Et.', '1563572974', 0, 0),
(1316, 166, 138, 'Ut sit omnis.', '1563572974', 0, 0),
(1317, 152, 138, 'Et explicabo molestiae rerum aut.', '1563572974', 1, 0),
(1319, 44, 16, 'Inventore.', '1563572974', 0, 0),
(1320, 166, 27, 'Pariatur culpa.', '1563572974', 0, 1),
(1322, 11, 141, 'Inventore quis aut.', '1563572974', 0, 1),
(1323, 7, 7, 'Corrupti non.', '1563572974', 0, 1),
(1324, 168, 91, 'Sunt dolores quis error pariatur.', '1563572974', 1, 0),
(1327, 161, 91, 'Deserunt vel.', '1563572974', 1, 1),
(1328, 141, 149, 'Voluptatem fuga voluptates.', '1563572974', 1, 1),
(1329, 33, 150, 'Eaque consequuntur unde veniam ex.', '1563572974', 1, 1),
(1336, 73, 36, 'Harum distinctio suscipit repellat.', '1563572974', 0, 1),
(1337, 48, 25, 'Molestiae.', '1563572974', 0, 0),
(1339, 34, 137, 'Non tenetur ipsam.', '1563572974', 0, 0),
(1340, 39, 8, 'Ea.', '1563572974', 1, 0),
(1341, 161, 101, 'Debitis iusto.', '1563572974', 1, 0),
(1344, 31, 36, 'Dolorum provident quod.', '1563572974', 0, 1),
(1345, 127, 3, 'Libero quis ut dolores.', '1563572974', 1, 0),
(1346, 141, 92, 'Omnis non exercitationem.', '1563572974', 1, 1),
(1347, 39, 102, 'Facere quam impedit voluptatem.', '1563572974', 0, 1),
(1348, 77, 59, 'Quia commodi minus.', '1563572974', 1, 1),
(1349, 153, 163, 'Sed maxime earum.', '1563572974', 1, 1),
(1351, 81, 141, 'Ex debitis impedit.', '1563572974', 1, 1),
(1352, 52, 79, 'Odio quae deleniti.', '1563572974', 0, 0),
(1353, 94, 48, 'Voluptates omnis beatae dolores.', '1563572974', 0, 0),
(1354, 104, 103, 'Sit tempore quisquam.', '1563572974', 0, 1),
(1356, 15, 3, 'Debitis dicta.', '1563572974', 1, 0),
(1359, 137, 14, 'Aliquam architecto.', '1563572974', 0, 1),
(1360, 47, 161, 'Dolor numquam.', '1563572974', 1, 1),
(1362, 100, 94, 'Libero iusto.', '1563572974', 1, 0),
(1363, 66, 20, 'Voluptas omnis et quibusdam.', '1563572974', 1, 0),
(1364, 71, 154, 'Ea sunt.', '1563572974', 0, 0),
(1365, 85, 162, 'Neque vitae incidunt.', '1563572974', 1, 0),
(1366, 27, 175, 'Corrupti qui.', '1563572974', 0, 0),
(1367, 146, 104, 'Nesciunt facilis eaque.', '1563572974', 1, 1),
(1368, 166, 60, 'Aut.', '1563572974', 0, 1),
(1370, 144, 56, 'Placeat ut.', '1563572974', 0, 1),
(1371, 5, 161, 'Excepturi delectus.', '1563572974', 0, 1),
(1373, 100, 28, 'Et at.', '1563572974', 0, 1),
(1376, 144, 51, 'Vitae quidem assumenda facere.', '1563572974', 1, 0),
(1377, 29, 99, 'Quasi nostrum et.', '1563572974', 1, 0),
(1378, 49, 176, 'Et optio velit velit provident.', '1563572974', 1, 1),
(1379, 44, 33, 'Impedit non.', '1563572974', 1, 0),
(1380, 59, 167, 'Et.', '1563572974', 1, 1),
(1381, 55, 66, 'Odit voluptatem.', '1563572974', 1, 0),
(1383, 98, 43, 'Totam reprehenderit praesentium.', '1563572975', 0, 0),
(1384, 26, 95, 'Amet saepe in sint asperiores.', '1563572975', 0, 0),
(1386, 14, 100, 'Animi omnis repellat et.', '1563572975', 1, 1),
(1387, 23, 146, 'Quam iste.', '1563572975', 1, 0),
(1388, 90, 98, 'Dolor.', '1563572975', 1, 0),
(1389, 171, 164, 'Quae vitae eum.', '1563572975', 0, 0),
(1391, 64, 91, 'Suscipit quis.', '1563572975', 0, 1),
(1392, 80, 136, 'Qui quisquam voluptatem et dolorem.', '1563572975', 1, 0),
(1394, 1, 169, 'Et similique iusto.', '1563572975', 0, 0),
(1395, 59, 77, 'Commodi harum.', '1563572975', 0, 0),
(1397, 40, 73, 'Porro eum pariatur.', '1563572975', 0, 0),
(1398, 174, 90, 'Dolorem.', '1563572975', 1, 0),
(1399, 129, 100, 'Aut consequuntur.', '1563572975', 0, 0),
(1400, 159, 83, 'Non iure.', '1563572975', 1, 0),
(1401, 164, 48, 'Eligendi voluptas.', '1563572975', 0, 0),
(1405, 57, 172, 'Perferendis commodi aut dolor.', '1563572975', 1, 1),
(1406, 97, 7, 'Voluptas sunt ab nulla rerum.', '1563572975', 1, 0),
(1410, 72, 156, 'Aut.', '1563572975', 1, 1),
(1411, 145, 2, 'Non ducimus veritatis.', '1563572975', 0, 1),
(1412, 24, 155, 'Quas minus sed.', '1563572975', 1, 1),
(1413, 165, 76, 'Eligendi non iure.', '1563572975', 1, 1),
(1414, 53, 81, 'Similique.', '1563572975', 1, 1),
(1415, 31, 48, 'Harum laudantium est rerum.', '1563572975', 1, 1),
(1416, 153, 145, 'Deserunt et reprehenderit.', '1563572975', 1, 1),
(1417, 29, 67, 'Sed.', '1563572975', 0, 0),
(1420, 23, 12, 'Rerum omnis saepe vel exercitationem officiis.', '1563572975', 1, 0),
(1421, 6, 162, 'Adipisci.', '1563572975', 0, 0),
(1422, 103, 130, 'Est non eaque.', '1563572975', 1, 1),
(1423, 31, 11, 'Pariatur velit et.', '1563572975', 1, 0),
(1424, 64, 99, 'Est voluptatem dolor aut qui et.', '1563572975', 1, 0),
(1425, 22, 165, 'Vitae aut blanditiis ea.', '1563572975', 1, 0),
(1428, 34, 37, 'Qui sit in.', '1563572975', 1, 0),
(1429, 148, 142, 'Natus.', '1563572975', 1, 1),
(1430, 51, 176, 'Enim deleniti blanditiis.', '1563572975', 1, 1),
(1432, 38, 168, 'Omnis ipsa alias alias non.', '1563572975', 0, 0),
(1433, 13, 47, 'Aut quia voluptas nesciunt.', '1563572975', 1, 0),
(1434, 21, 98, 'Corporis ipsam.', '1563572975', 0, 0),
(1435, 17, 134, 'Aut.', '1563572975', 1, 1),
(1436, 45, 142, 'Voluptas ipsum cumque esse.', '1563572975', 1, 1),
(1437, 156, 28, 'Sed ipsam et ea voluptatem.', '1563572975', 1, 1),
(1438, 129, 1, 'Ut eius.', '1563572975', 1, 0),
(1439, 169, 71, 'Voluptas.', '1563572975', 0, 1),
(1440, 132, 56, 'Optio numquam.', '1563572975', 0, 1),
(1441, 19, 75, 'Est nostrum reiciendis ut rerum nemo.', '1563572975', 0, 0),
(1442, 130, 43, 'Nostrum vel ut rerum et enim.', '1563572975', 0, 0),
(1443, 167, 40, 'Nemo est cum at.', '1563572975', 1, 1),
(1444, 144, 54, 'Nisi quis.', '1563572975', 0, 1),
(1446, 153, 31, 'Doloremque doloribus laudantium.', '1563572975', 0, 0),
(1447, 136, 25, 'Est et.', '1563572975', 0, 0),
(1448, 64, 64, 'Molestias soluta qui.', '1563572975', 0, 1),
(1449, 63, 144, 'Ex.', '1563572975', 0, 0),
(1450, 150, 175, 'Possimus atque facilis.', '1563572975', 1, 1),
(1452, 54, 78, 'Animi libero.', '1563572975', 0, 0),
(1454, 54, 172, 'Sequi dignissimos.', '1563572975', 0, 0),
(1455, 61, 126, 'Natus eaque inventore.', '1563572975', 0, 1),
(1456, 91, 99, 'Non et architecto.', '1563572975', 0, 1),
(1459, 57, 100, 'Architecto commodi.', '1563572975', 0, 1),
(1462, 96, 9, 'Possimus dolorum et et nulla cupiditate.', '1563572975', 1, 1),
(1463, 150, 37, 'In facilis asperiores ullam.', '1563572975', 0, 1),
(1464, 69, 141, 'Ea.', '1563572975', 0, 0),
(1465, 11, 19, 'Debitis rerum totam.', '1563572975', 1, 1),
(1466, 73, 7, 'Nobis fuga sed dolorem.', '1563572975', 0, 1),
(1467, 33, 162, 'Voluptatem alias quidem alias.', '1563572975', 1, 1),
(1469, 44, 88, 'Dignissimos.', '1563572975', 0, 1),
(1471, 169, 149, 'Nesciunt et.', '1563572975', 1, 1),
(1472, 130, 48, 'Totam omnis accusamus.', '1563572975', 1, 1),
(1473, 101, 98, 'Et quidem dolor beatae.', '1563572975', 0, 0),
(1474, 60, 59, 'Debitis provident.', '1563572976', 1, 1),
(1475, 126, 102, 'Alias tempore.', '1563572976', 1, 0),
(1478, 157, 15, 'Nisi.', '1563572976', 1, 0),
(1480, 6, 132, 'Labore iure.', '1563572976', 1, 1),
(1481, 153, 126, 'Error laborum enim consequuntur.', '1563572976', 0, 0),
(1482, 126, 40, 'Accusamus dignissimos omnis.', '1563572976', 1, 0),
(1484, 104, 32, 'Alias fugiat.', '1563572976', 0, 1),
(1485, 84, 39, 'Rerum iste perspiciatis laudantium repellat assumenda.', '1563572976', 1, 1),
(1486, 17, 154, 'In quia.', '1563572976', 0, 1),
(1487, 11, 3, 'Voluptas debitis amet et.', '1563572976', 0, 1),
(1491, 22, 163, 'Distinctio possimus in.', '1563572976', 0, 1),
(1492, 101, 21, 'Rerum tempora minima repellat quo.', '1563572976', 1, 1),
(1493, 18, 74, 'Quia.', '1563572976', 0, 1),
(1494, 13, 168, 'Molestias nulla.', '1563572976', 0, 0),
(1496, 27, 65, 'Vitae non.', '1563572976', 0, 0),
(1497, 10, 27, 'Quas ut quibusdam saepe.', '1563572976', 1, 1),
(1498, 18, 71, 'In numquam totam vero.', '1563572976', 0, 0),
(1499, 168, 74, 'Modi eos.', '1563572976', 1, 0),
(1500, 141, 166, 'Non quis aperiam.', '1563572976', 0, 0),
(1501, 1, 40, 'Quas rerum nesciunt placeat nulla.', '1563572976', 0, 0),
(1503, 165, 87, 'Ad rerum reiciendis quidem.', '1563572976', 1, 0),
(1507, 84, 47, 'Hic totam fuga quos.', '1563572976', 1, 0),
(1508, 80, 73, 'Quo enim.', '1563572976', 1, 0),
(1509, 149, 43, 'Ut.', '1563572976', 1, 0),
(1510, 171, 98, 'Tempora eligendi quam.', '1563572976', 0, 1),
(1511, 32, 176, 'Veniam est eveniet.', '1563572976', 1, 1),
(1512, 102, 68, 'Deserunt et nihil.', '1563572976', 0, 1),
(1513, 53, 39, 'In voluptatem.', '1563572976', 1, 1),
(1514, 142, 163, 'Et natus quis sit hic.', '1563572976', 1, 0),
(1515, 35, 34, 'Voluptatum ab.', '1563572976', 1, 1),
(1516, 80, 72, 'Vel id ratione.', '1563572976', 1, 1),
(1518, 153, 12, 'Rerum maxime.', '1563572976', 0, 1),
(1519, 25, 175, 'Animi ut.', '1563572976', 1, 1),
(1520, 82, 147, 'A est repellat.', '1563572976', 1, 0),
(1521, 155, 167, 'Rerum blanditiis magni et impedit.', '1563572976', 1, 0),
(1523, 99, 138, 'Quia nihil.', '1563572976', 0, 0),
(1525, 98, 8, 'Sed repellat officiis.', '1563572976', 0, 1),
(1526, 157, 133, 'Distinctio.', '1563572976', 0, 0),
(1527, 49, 91, 'Consequatur quam eum.', '1563572976', 0, 1),
(1529, 83, 37, 'Quibusdam dolorem.', '1563572976', 0, 1),
(1530, 128, 35, 'Aut ratione fugit.', '1563572976', 0, 1),
(1532, 151, 1, 'Nihil similique et.', '1563572976', 1, 1),
(1533, 34, 88, 'Aut illo dicta.', '1563572976', 1, 0),
(1534, 48, 53, 'Nobis veritatis veniam.', '1563572976', 1, 0),
(1535, 43, 143, 'Non earum.', '1563572976', 1, 0),
(1536, 36, 129, 'Dicta molestiae non.', '1563572976', 1, 0),
(1537, 170, 36, 'Unde quasi.', '1563572976', 0, 0),
(1538, 171, 4, 'Veniam suscipit repudiandae.', '1563572976', 1, 0),
(1539, 48, 85, 'Expedita.', '1563572976', 1, 0),
(1540, 54, 174, 'Fuga et eaque.', '1563572976', 0, 0),
(1541, 154, 29, 'Voluptas repellat iure.', '1563572976', 0, 0),
(1542, 45, 98, 'Labore qui quasi.', '1563572976', 1, 0),
(1547, 100, 59, 'Possimus harum.', '1563572976', 0, 1),
(1548, 34, 176, 'Dolor nihil.', '1563572976', 1, 0),
(1549, 149, 173, 'Numquam esse.', '1563572976', 1, 0),
(1550, 130, 90, 'Et quis porro numquam.', '1563572976', 0, 0),
(1551, 47, 161, 'Rem cumque.', '1563572976', 0, 1),
(1553, 93, 87, 'Sunt consequatur aliquam voluptate maxime omnis.', '1563572976', 1, 0),
(1554, 18, 30, 'Molestias atque alias repellendus.', '1563572976', 1, 1),
(1556, 144, 30, 'Exercitationem.', '1563572976', 0, 1),
(1557, 168, 157, 'In exercitationem enim.', '1563572976', 0, 1),
(1558, 150, 70, 'Vel veniam dolores numquam porro.', '1563572977', 1, 0),
(1559, 156, 137, 'Esse nisi repudiandae placeat.', '1563572977', 0, 0),
(1560, 37, 14, 'Hic aut.', '1563572977', 1, 1),
(1562, 31, 61, 'Vel.', '1563572977', 1, 1),
(1563, 171, 91, 'Vero maxime aut sapiente aspernatur.', '1563572977', 1, 1),
(1564, 164, 75, 'Eligendi.', '1563572977', 0, 0),
(1565, 142, 10, 'Maiores et.', '1563572977', 0, 0),
(1566, 20, 40, 'Quo distinctio harum.', '1563572977', 1, 1),
(1568, 19, 126, 'Ut necessitatibus excepturi.', '1563572977', 0, 0),
(1570, 151, 139, 'Laborum nemo.', '1563572977', 0, 1),
(1572, 98, 71, 'Repudiandae eum.', '1563572977', 0, 1),
(1573, 170, 58, 'Qui voluptates voluptatem.', '1563572977', 0, 0),
(1574, 45, 47, 'Velit.', '1563572977', 1, 1),
(1575, 16, 95, 'Porro incidunt suscipit quia.', '1563572977', 0, 0),
(1577, 52, 144, 'Eos magnam sed earum.', '1563572977', 0, 0),
(1578, 158, 42, 'Sit.', '1563572977', 0, 0),
(1579, 166, 91, 'Rerum fuga perspiciatis at quo.', '1563572977', 1, 0),
(1580, 158, 127, 'Ea.', '1563572977', 1, 1),
(1581, 93, 101, 'Alias hic repudiandae tempora.', '1563572977', 0, 0),
(1582, 130, 58, 'Labore.', '1563572977', 1, 1),
(1583, 88, 16, 'Dolor aut dolorem repudiandae molestiae cumque.', '1563572977', 0, 0),
(1584, 19, 79, 'Quis id.', '1563572977', 0, 0),
(1585, 94, 5, 'Magnam quasi nemo quas est.', '1563572977', 0, 1),
(1586, 92, 89, 'Est fuga quas minus.', '1563572977', 0, 0),
(1588, 164, 30, 'Sint qui.', '1563572977', 1, 0),
(1589, 104, 132, 'Debitis fuga dicta at.', '1563572977', 1, 0),
(1590, 10, 159, 'Cum enim.', '1563572977', 1, 0),
(1591, 126, 13, 'Ipsum sunt.', '1563572977', 0, 1),
(1592, 50, 129, 'Sed.', '1563572977', 1, 0),
(1593, 21, 166, 'Veritatis velit.', '1563572977', 1, 0),
(1595, 44, 161, 'Dicta fugiat adipisci qui laborum.', '1563572977', 1, 1),
(1596, 144, 85, 'Suscipit quia voluptas similique.', '1563572977', 0, 0),
(1597, 137, 90, 'Non consequatur ab.', '1563572977', 1, 1),
(1598, 64, 155, 'Fugiat cumque placeat.', '1563572977', 1, 1),
(1599, 91, 35, 'Aliquam quisquam.', '1563572977', 0, 0),
(1600, 60, 40, 'Officia ratione consequatur.', '1563572977', 1, 0),
(1601, 32, 166, 'Est minus.', '1563572977', 0, 0),
(1602, 13, 166, 'Voluptatem et placeat.', '1563572977', 1, 0),
(1605, 139, 49, 'Eligendi earum necessitatibus est.', '1563572977', 1, 0),
(1607, 51, 70, 'Eligendi dicta qui doloribus.', '1563572977', 0, 1),
(1609, 34, 5, 'Sit quaerat magnam.', '1563572977', 1, 0),
(1610, 127, 34, 'Consequuntur aut et.', '1563572977', 0, 0),
(1612, 131, 78, 'Sed itaque.', '1563572977', 0, 0),
(1613, 138, 28, 'Voluptas eos quasi.', '1563572977', 1, 0),
(1614, 19, 63, 'Est exercitationem.', '1563572977', 1, 1),
(1615, 47, 161, 'Repudiandae quas est voluptatem.', '1563572977', 1, 1),
(1616, 102, 166, 'Maxime animi sed.', '1563572977', 1, 0),
(1617, 164, 156, 'Quidem velit.', '1563572977', 0, 0),
(1618, 126, 101, 'Rem velit nobis officiis nihil.', '1563572977', 0, 1),
(1619, 20, 146, 'Qui necessitatibus.', '1563572977', 1, 1),
(1620, 145, 138, 'Non itaque repellendus voluptate facere.', '1563572977', 0, 0),
(1621, 54, 75, 'Qui ipsum assumenda dolor.', '1563572977', 0, 0),
(1622, 10, 165, 'Et qui.', '1563572977', 0, 0),
(1623, 88, 75, 'Eum libero suscipit et.', '1563572977', 1, 0),
(1624, 87, 92, 'Optio totam ut debitis.', '1563572977', 0, 0),
(1625, 138, 59, 'Et culpa aperiam perspiciatis sit.', '1563572977', 1, 1),
(1626, 168, 71, 'Dolore ea dolores dicta.', '1563572977', 1, 1),
(1627, 171, 100, 'Omnis explicabo ratione.', '1563572977', 1, 0),
(1628, 100, 53, 'Ab tenetur voluptas minima.', '1563572977', 0, 0),
(1629, 103, 30, 'Sint tempore perferendis vel quos.', '1563572977', 0, 0),
(1630, 48, 130, 'Ut id.', '1563572977', 1, 1),
(1631, 176, 85, 'Provident qui aliquam maxime pariatur.', '1563572977', 0, 0),
(1633, 56, 9, 'Cumque voluptatum porro.', '1563572977', 1, 1),
(1634, 26, 135, 'Sint rerum.', '1563572977', 0, 0),
(1635, 33, 60, 'Beatae.', '1563572977', 0, 1),
(1636, 79, 173, 'Eum esse ipsum.', '1563572977', 0, 0),
(1637, 128, 104, 'Earum blanditiis quaerat asperiores.', '1563572978', 1, 1),
(1638, 13, 49, 'Repudiandae inventore error repudiandae.', '1563572978', 0, 1),
(1639, 135, 139, 'Odit a illo.', '1563572978', 1, 1),
(1640, 154, 80, 'Velit optio.', '1563572978', 0, 0),
(1642, 97, 35, 'Suscipit recusandae odio impedit.', '1563572978', 1, 0),
(1643, 57, 164, 'Exercitationem porro.', '1563572978', 0, 1),
(1644, 50, 139, 'At exercitationem et exercitationem.', '1563572978', 0, 0),
(1645, 141, 34, 'Id voluptates.', '1563572978', 1, 1),
(1647, 90, 133, 'At in facilis.', '1563572978', 1, 1),
(1648, 41, 57, 'Quibusdam alias aut qui.', '1563572978', 1, 1),
(1649, 88, 74, 'Similique nobis.', '1563572978', 0, 0),
(1650, 29, 54, 'Quidem soluta quas.', '1563572978', 0, 1),
(1651, 163, 3, 'Unde nulla dolorem est iste.', '1563572978', 1, 0),
(1652, 73, 176, 'Recusandae eius voluptas ut.', '1563572978', 1, 1),
(1653, 77, 54, 'Nemo iste labore quibusdam repellat.', '1563572978', 0, 0),
(1655, 67, 99, 'Voluptatem harum laudantium ratione.', '1563572978', 0, 0),
(1656, 90, 91, 'Voluptas ut aut.', '1563572978', 1, 1),
(1657, 102, 49, 'Labore.', '1563572978', 0, 1),
(1658, 156, 61, 'Magnam deleniti possimus asperiores.', '1563572978', 0, 1),
(1660, 163, 73, 'Non facilis dolores expedita corrupti.', '1563572978', 1, 1),
(1661, 174, 33, 'Quas iusto.', '1563572978', 1, 1),
(1663, 16, 140, 'Velit modi.', '1563572978', 0, 1),
(1665, 2, 133, 'Et voluptatem.', '1563572978', 1, 0),
(1666, 144, 157, 'Veritatis.', '1563572978', 0, 1),
(1668, 52, 56, 'Libero deserunt voluptate.', '1563572978', 1, 0),
(1669, 171, 86, 'Beatae porro.', '1563572978', 0, 0),
(1670, 6, 35, 'In illo rerum ipsum.', '1563572978', 0, 0),
(1671, 150, 143, 'Officiis dicta ratione.', '1563572978', 1, 0),
(1672, 173, 88, 'Tenetur fugiat odio iste.', '1563572978', 0, 1),
(1673, 148, 75, 'Iste numquam aut.', '1563572978', 0, 0),
(1675, 12, 91, 'Fugit voluptatem.', '1563572978', 1, 1),
(1676, 127, 23, 'Pariatur enim temporibus voluptatem id.', '1563572978', 1, 1),
(1677, 28, 38, 'Nihil nihil.', '1563572978', 0, 0),
(1678, 153, 161, 'Facilis dolor voluptatum beatae sed.', '1563572978', 0, 1),
(1679, 16, 149, 'Culpa et.', '1563572978', 0, 0),
(1681, 76, 150, 'Reiciendis voluptatem aliquam ut quo.', '1563572978', 1, 0),
(1682, 129, 99, 'Explicabo ducimus dolor cupiditate repudiandae itaque.', '1563572978', 0, 0),
(1683, 167, 157, 'Et recusandae.', '1563572978', 0, 1),
(1684, 35, 127, 'Ab delectus voluptatem.', '1563572978', 1, 0),
(1685, 1, 149, 'Totam molestiae.', '1563572978', 0, 1),
(1686, 56, 36, 'Minus culpa at tempore.', '1563572978', 0, 1),
(1687, 37, 54, 'Sunt beatae.', '1563572978', 1, 1),
(1690, 6, 17, 'Hic iure beatae doloribus.', '1563572978', 0, 1),
(1691, 128, 51, 'Est ut.', '1563572978', 1, 0),
(1693, 43, 126, 'Eos voluptas.', '1563572978', 0, 1),
(1694, 25, 157, 'Nisi.', '1563572978', 0, 1),
(1695, 169, 102, 'Nihil perspiciatis cupiditate.', '1563572978', 0, 1),
(1696, 3, 169, 'Sequi eos.', '1563572978', 1, 1),
(1698, 141, 57, 'Labore error velit qui.', '1563572978', 1, 1),
(1699, 66, 46, 'Natus soluta cupiditate assumenda eum et.', '1563572978', 1, 1),
(1700, 13, 161, 'Corrupti.', '1563572978', 1, 1),
(1701, 72, 39, 'Et fugit velit et.', '1563572978', 0, 1),
(1702, 90, 2, 'Est nostrum et beatae quaerat.', '1563572978', 0, 0),
(1703, 12, 64, 'Quibusdam.', '1563572978', 0, 0),
(1704, 169, 9, 'Necessitatibus iure.', '1563572978', 0, 0),
(1705, 102, 80, 'Eius exercitationem harum consequatur.', '1563572978', 0, 0),
(1706, 60, 144, 'Amet esse odio voluptatibus vel nulla.', '1563572978', 0, 1),
(1707, 58, 83, 'Voluptatibus amet beatae et quia.', '1563572978', 1, 1),
(1708, 82, 147, 'Voluptas provident sed vitae.', '1563572978', 0, 1),
(1709, 33, 12, 'Dicta quia rerum.', '1563572978', 0, 1),
(1710, 44, 98, 'Ut.', '1563572978', 1, 1),
(1711, 104, 70, 'Laudantium recusandae eveniet.', '1563572978', 0, 1),
(1712, 52, 164, 'Unde.', '1563572978', 1, 1),
(1713, 101, 39, 'Magnam fugit qui amet molestiae incidunt.', '1563572978', 1, 1),
(1714, 10, 131, 'Reprehenderit et facere.', '1563572978', 1, 0),
(1715, 41, 164, 'Dolorum quidem alias quia eveniet.', '1563572978', 1, 1),
(1716, 73, 26, 'Maxime laudantium.', '1563572978', 1, 1),
(1717, 58, 103, 'Consequatur molestias quisquam illum.', '1563572978', 0, 0),
(1718, 22, 23, 'Ut.', '1563572978', 0, 1),
(1719, 142, 78, 'Sunt iure id.', '1563572978', 0, 0),
(1720, 41, 36, 'Cupiditate est sunt omnis.', '1563572978', 0, 0),
(1722, 146, 5, 'Quae qui consequatur.', '1563572978', 1, 0),
(1723, 80, 32, 'Saepe dolores.', '1563572978', 0, 0),
(1724, 165, 32, 'Ducimus hic.', '1563572978', 1, 0),
(1725, 169, 145, 'Sed eos et non.', '1563572978', 0, 1),
(1726, 148, 171, 'Quam iste sapiente.', '1563572978', 1, 0),
(1729, 77, 69, 'Quisquam est.', '1563572978', 0, 0),
(1731, 60, 82, 'Et consequatur sit unde rerum.', '1563572978', 1, 1),
(1732, 77, 19, 'Perferendis ut quae rerum.', '1563572978', 1, 1),
(1733, 173, 126, 'Commodi neque laborum culpa.', '1563572979', 1, 1),
(1734, 54, 152, 'Totam qui aspernatur libero.', '1563572979', 1, 1),
(1735, 136, 139, 'Recusandae ut.', '1563572979', 0, 1),
(1736, 67, 170, 'Vitae unde a quis rem.', '1563572979', 1, 1),
(1737, 77, 104, 'Unde quaerat reiciendis.', '1563572979', 0, 1),
(1738, 38, 54, 'Perferendis incidunt molestias.', '1563572979', 1, 0),
(1739, 91, 5, 'Est labore.', '1563572979', 1, 0),
(1740, 90, 98, 'Voluptatem minima sit.', '1563572979', 1, 1),
(1741, 59, 127, 'In et eos nam.', '1563572979', 1, 0),
(1742, 82, 33, 'Eaque alias provident.', '1563572979', 0, 0),
(1743, 94, 95, 'Esse quo tempora velit.', '1563572979', 1, 1),
(1744, 176, 91, 'Rerum.', '1563572979', 1, 0),
(1745, 170, 167, 'Dignissimos ad rem.', '1563572979', 0, 0),
(1746, 84, 155, 'Consequatur dolores perferendis.', '1563572979', 1, 0),
(1747, 1, 98, 'In hic nam.', '1563572979', 1, 0),
(1748, 172, 67, 'Assumenda id.', '1563572979', 0, 1),
(1749, 48, 93, 'Neque aut facere.', '1563572979', 0, 1),
(1750, 103, 171, 'Incidunt.', '1563572979', 1, 1),
(1751, 82, 147, 'Et qui veritatis necessitatibus.', '1563572979', 1, 1),
(1752, 54, 18, 'Ipsa temporibus harum veritatis voluptatum.', '1563572979', 1, 0),
(1753, 162, 137, 'Corporis inventore alias.', '1563572979', 0, 1),
(1754, 46, 2, 'Nobis tempore maxime.', '1563572979', 1, 1),
(1755, 51, 89, 'Sint aliquid minus.', '1563572979', 1, 0),
(1756, 63, 13, 'Nobis.', '1563572979', 1, 1),
(1757, 39, 169, 'Veniam commodi dolore.', '1563572979', 0, 1),
(1758, 151, 160, 'Aut est quasi.', '1563572979', 0, 1),
(1759, 61, 29, 'Porro non.', '1563572979', 0, 1),
(1760, 40, 157, 'Et libero suscipit commodi voluptatem.', '1563572979', 1, 0),
(1761, 132, 49, 'Quia quae.', '1563572979', 1, 1),
(1762, 82, 53, 'Sit ut.', '1563572979', 0, 0),
(1763, 136, 81, 'Dolore cum.', '1563572979', 0, 0),
(1764, 36, 49, 'Asperiores sint.', '1563572979', 1, 0),
(1765, 40, 132, 'Officia aut veritatis ut.', '1563572979', 0, 0),
(1766, 96, 9, 'Illum aliquid mollitia maxime et.', '1563572979', 1, 1),
(1767, 96, 44, 'Eius qui ut cupiditate.', '1563572979', 0, 0),
(1768, 49, 3, 'Qui velit.', '1563572979', 1, 1),
(1769, 72, 169, 'Quo et quisquam atque omnis.', '1563572979', 1, 1),
(1770, 96, 95, 'Voluptatem et aliquid.', '1563572979', 0, 0),
(1771, 37, 47, 'Consequuntur aut ea.', '1563572979', 0, 1),
(1772, 62, 74, 'Maiores tenetur reprehenderit cupiditate.', '1563572979', 0, 0),
(1773, 132, 31, 'Aspernatur.', '1563572979', 1, 1),
(1774, 100, 86, 'Aut.', '1563572979', 0, 1),
(1775, 132, 9, 'Ea mollitia.', '1563572979', 1, 0),
(1776, 96, 170, 'Voluptatem ut sint iusto.', '1563572979', 0, 1),
(1778, 63, 27, 'Incidunt cupiditate.', '1563572979', 1, 0),
(1779, 158, 132, 'Cumque fugiat perferendis.', '1563572979', 0, 1),
(1780, 147, 147, 'Praesentium sapiente.', '1563572979', 1, 0),
(1781, 170, 35, 'Ea labore vel quod.', '1563572979', 1, 0),
(1783, 145, 87, 'Et non est.', '1563572979', 1, 1),
(1784, 13, 137, 'Enim porro adipisci.', '1563572979', 0, 0),
(1785, 128, 73, 'Sed tempore perspiciatis.', '1563572979', 1, 1),
(1786, 162, 93, 'Quod.', '1563572979', 1, 0),
(1788, 16, 77, 'Voluptatem a et voluptatibus modi dolorem.', '1563572979', 0, 0),
(1789, 11, 102, 'Nemo impedit eum ut placeat est.', '1563572979', 0, 0),
(1792, 81, 146, 'Vel quos ullam.', '1563572979', 0, 0),
(1793, 45, 97, 'Sit odit.', '1563572979', 0, 1),
(1794, 126, 70, 'Quasi quae.', '1563572979', 0, 1),
(1795, 131, 75, 'Similique quo.', '1563572979', 1, 1),
(1796, 139, 56, 'Provident ad a quas tempore aliquid.', '1563572979', 1, 0),
(1798, 38, 159, 'Omnis aliquam.', '1563572979', 1, 1),
(1800, 16, 23, 'Perferendis quia nemo omnis.', '1563572979', 1, 0),
(1801, 21, 73, 'Nobis doloribus voluptas et.', '1563572979', 0, 0),
(1802, 44, 22, 'Laboriosam praesentium commodi.', '1563572979', 1, 1),
(1803, 173, 21, 'Inventore quia.', '1563572979', 0, 1),
(1804, 80, 40, 'Quod fugit sed.', '1563572979', 0, 0),
(1806, 173, 25, 'Architecto minus.', '1563572979', 0, 1),
(1808, 134, 10, 'Facilis saepe repellat iste.', '1563572979', 0, 0),
(1809, 145, 69, 'Quas modi ad.', '1563572979', 0, 1),
(1811, 137, 29, 'Laboriosam officia iusto.', '1563572979', 0, 0),
(1812, 18, 154, 'Earum.', '1563572979', 1, 1),
(1813, 28, 78, 'Eum repellendus.', '1563572979', 0, 0),
(1814, 79, 153, 'Optio illum voluptas.', '1563572979', 1, 1),
(1815, 103, 26, 'Ea ratione quae.', '1563572979', 0, 0),
(1816, 146, 156, 'Consequatur repudiandae debitis.', '1563572979', 1, 1),
(1817, 44, 85, 'Aliquam voluptates.', '1563572979', 1, 1),
(1818, 39, 1, 'Velit occaecati sed est reprehenderit.', '1563572979', 1, 1),
(1819, 176, 72, 'Libero et dolorum incidunt.', '1563572979', 0, 1),
(1821, 150, 41, 'Et cum.', '1563572979', 1, 0),
(1822, 164, 149, 'Neque deserunt.', '1563572979', 0, 0),
(1825, 136, 136, 'Consequuntur.', '1563572979', 1, 1),
(1826, 18, 138, 'Veritatis.', '1563572979', 0, 0),
(1828, 162, 59, 'Mollitia necessitatibus alias quisquam.', '1563572979', 1, 1),
(1830, 163, 88, 'Sed quas porro dolor beatae quo.', '1563572979', 1, 0),
(1834, 155, 176, 'Quis et.', '1563572979', 1, 1),
(1835, 173, 96, 'Sint voluptatem.', '1563572979', 1, 0),
(1836, 26, 141, 'Et ut.', '1563572979', 1, 1),
(1837, 48, 102, 'Quia sit alias quis.', '1563572979', 0, 0),
(1839, 74, 23, 'Sint.', '1563572979', 1, 0),
(1840, 7, 74, 'Perspiciatis sunt beatae perspiciatis cupiditate.', '1563572979', 1, 0),
(1841, 34, 76, 'Ut.', '1563572979', 1, 1),
(1842, 96, 131, 'Explicabo omnis et possimus dolor fuga.', '1563572979', 0, 1),
(1843, 148, 23, 'Eveniet aliquam.', '1563572979', 0, 1),
(1844, 52, 41, 'Dicta.', '1563572979', 1, 0),
(1845, 132, 132, 'Unde nostrum quam ut ipsum.', '1563572979', 0, 0),
(1846, 161, 62, 'Provident placeat quos sed.', '1563572979', 0, 0),
(1847, 171, 144, 'Officiis quas.', '1563572980', 0, 1),
(1848, 151, 94, 'Voluptatum.', '1563572980', 1, 1),
(1849, 17, 172, 'Consectetur ut voluptatibus ratione non.', '1563572980', 1, 0),
(1850, 39, 36, 'Rerum dolores vel ut.', '1563572980', 0, 0),
(1851, 1, 31, 'Facere reiciendis et commodi.', '1563572980', 0, 1),
(1852, 156, 142, 'Vel assumenda voluptatibus sint.', '1563572980', 1, 1),
(1853, 41, 19, 'Molestiae voluptates quo magni.', '1563572980', 0, 0),
(1854, 170, 99, 'Quia.', '1563572980', 1, 0),
(1858, 167, 82, 'Minus perferendis architecto inventore.', '1563572980', 1, 0),
(1859, 170, 147, 'Voluptatem corrupti velit quod.', '1563572980', 0, 1),
(1860, 152, 9, 'Non reprehenderit nam rem sed impedit.', '1563572980', 0, 1),
(1862, 93, 146, 'Dolorem officia dolor.', '1563572980', 0, 1),
(1864, 31, 40, 'Voluptatem voluptatem.', '1563572980', 1, 1),
(1865, 170, 92, 'Voluptatem architecto.', '1563572980', 1, 1),
(1866, 143, 174, 'Earum nihil sapiente optio ut.', '1563572980', 1, 0),
(1867, 77, 64, 'Sint placeat architecto tempore animi nihil.', '1563572980', 1, 1),
(1868, 138, 132, 'Consequuntur quia officia quo.', '1563572980', 0, 0),
(1869, 20, 31, 'Dignissimos.', '1563572980', 1, 0),
(1870, 60, 55, 'Qui.', '1563572980', 0, 1),
(1871, 88, 83, 'Harum quaerat voluptatibus autem.', '1563572980', 0, 0),
(1872, 129, 77, 'Molestiae ullam sed.', '1563572980', 1, 1),
(1873, 73, 2, 'Assumenda quia aut.', '1563572980', 1, 1),
(1875, 44, 31, 'Natus vero sed quod.', '1563572980', 1, 0),
(1876, 102, 44, 'Eos porro id.', '1563572980', 1, 1),
(1877, 58, 50, 'Accusamus accusantium.', '1563572980', 1, 0),
(1878, 176, 76, 'Rerum.', '1563572980', 1, 1),
(1879, 79, 52, 'Eum dolores molestiae minus.', '1563572980', 0, 1),
(1881, 155, 8, 'Dolorem error maiores beatae numquam.', '1563572980', 1, 1),
(1884, 52, 83, 'Non numquam impedit.', '1563572980', 0, 0),
(1885, 43, 59, 'Voluptatibus repellendus facere.', '1563572980', 0, 0),
(1886, 57, 54, 'Officia sequi.', '1563572980', 1, 1),
(1887, 92, 137, 'Corrupti neque dolor voluptatem.', '1563572980', 0, 0),
(1888, 32, 133, 'Et animi alias.', '1563572980', 0, 0),
(1889, 139, 98, 'Rerum commodi.', '1563572980', 1, 0),
(1890, 138, 38, 'Blanditiis molestiae error voluptas.', '1563572980', 1, 0),
(1893, 98, 47, 'Similique iste.', '1563572980', 1, 1),
(1894, 78, 87, 'Commodi qui.', '1563572980', 1, 1),
(1897, 33, 42, 'Molestias perferendis perferendis quam.', '1563572980', 1, 1),
(1898, 99, 30, 'Veniam doloribus voluptatem ut provident sed.', '1563572980', 0, 1),
(1899, 31, 23, 'Sed.', '1563572980', 1, 1),
(1900, 141, 151, 'Esse dicta earum.', '1563572980', 0, 1),
(1902, 71, 84, 'Et.', '1563572980', 0, 1),
(1903, 155, 173, 'Voluptatum sequi sed.', '1563572980', 1, 0),
(1904, 12, 156, 'Asperiores.', '1563572980', 1, 1),
(1905, 167, 36, 'Beatae nam.', '1563572980', 1, 1),
(1906, 172, 29, 'Et.', '1563572980', 0, 1),
(1907, 38, 86, 'Ullam qui.', '1563572980', 0, 1),
(1908, 139, 142, 'Qui ad odit ullam.', '1563572980', 1, 0),
(1909, 13, 54, 'Quo quidem excepturi.', '1563572980', 0, 0),
(1910, 44, 48, 'Et est tempora.', '1563572980', 1, 1),
(1911, 58, 155, 'Rem voluptas suscipit.', '1563572980', 1, 1),
(1912, 33, 79, 'Laudantium vero exercitationem necessitatibus.', '1563572980', 0, 1),
(1913, 75, 42, 'Voluptatem non sint.', '1563572980', 1, 0),
(1915, 6, 152, 'Aut ipsam occaecati maiores voluptas.', '1563572980', 1, 1),
(1918, 168, 166, 'Iste explicabo maxime.', '1563572980', 1, 0),
(1919, 157, 74, 'Suscipit qui amet blanditiis voluptatem sit.', '1563572980', 0, 1),
(1920, 68, 26, 'A iste autem quis et accusantium.', '1563572980', 1, 1),
(1921, 29, 54, 'Debitis.', '1563572980', 1, 1),
(1924, 90, 44, 'Libero recusandae rem.', '1563572980', 1, 0),
(1925, 75, 162, 'Aut.', '1563572981', 1, 1),
(1926, 76, 55, 'Eos et qui est in.', '1563572981', 1, 1),
(1927, 134, 138, 'Nam eligendi.', '1563572981', 1, 1),
(1928, 156, 158, 'Ad.', '1563572981', 1, 1),
(1929, 26, 24, 'Quidem nesciunt ut explicabo error.', '1563572981', 1, 0),
(1930, 147, 103, 'Earum qui cum.', '1563572981', 0, 0),
(1931, 92, 6, 'Natus molestiae temporibus eius nihil.', '1563572981', 1, 1),
(1932, 144, 32, 'Error sed autem est.', '1563572981', 1, 1),
(1933, 6, 87, 'Eligendi repellat ut.', '1563572981', 0, 1),
(1934, 38, 16, 'Illum expedita assumenda.', '1563572981', 1, 1),
(1935, 168, 173, 'Ipsam ut.', '1563572981', 1, 0),
(1936, 88, 102, 'Aut doloribus ut.', '1563572981', 1, 0),
(1937, 10, 24, 'Repellat corporis.', '1563572981', 0, 1),
(1938, 145, 15, 'Nesciunt est facere officiis reiciendis provident.', '1563572981', 1, 1),
(1940, 46, 98, 'Et dicta dolorem voluptate.', '1563572981', 1, 0),
(1941, 80, 151, 'Assumenda voluptas sit.', '1563572981', 1, 1),
(1942, 42, 176, 'Vitae hic sequi cupiditate odit pariatur.', '1563572981', 0, 0),
(1943, 69, 172, 'Ut sequi blanditiis.', '1563572981', 0, 1),
(1944, 33, 132, 'Voluptatem perspiciatis et.', '1563572981', 1, 1),
(1945, 148, 53, 'Officiis voluptatibus suscipit sint voluptas.', '1563572981', 0, 1),
(1947, 31, 41, 'Accusamus quod atque dolore.', '1563572981', 1, 0),
(1948, 36, 161, 'Laboriosam nesciunt molestiae inventore sit.', '1563572981', 0, 0),
(1950, 167, 172, 'Debitis at non sapiente consectetur.', '1563572981', 1, 0),
(1951, 64, 12, 'Porro animi quasi dolorem est.', '1563572981', 1, 1),
(1954, 94, 175, 'Doloribus repellat soluta voluptas.', '1563572981', 1, 1),
(1957, 156, 18, 'Labore numquam animi voluptatem sed.', '1563572981', 0, 0),
(1958, 128, 141, 'Quod aut non qui.', '1563572981', 0, 0),
(1959, 33, 27, 'Consequuntur.', '1563572981', 0, 1),
(1960, 62, 83, 'Omnis odit.', '1563572981', 0, 1),
(1961, 34, 129, 'Distinctio voluptatibus et.', '1563572981', 0, 1),
(1962, 129, 152, 'Pariatur ut et accusantium.', '1563572981', 0, 0),
(1963, 18, 148, 'Labore omnis.', '1563572981', 0, 1),
(1964, 89, 17, 'Voluptas consequatur id omnis.', '1563572981', 0, 0),
(1965, 19, 57, 'Eos voluptatem sapiente.', '1563572981', 0, 1),
(1966, 28, 64, 'Maxime soluta.', '1563572981', 0, 1),
(1967, 5, 14, 'Aliquid pariatur.', '1563572981', 1, 1),
(1968, 139, 132, 'Eaque reprehenderit aut voluptatibus non quisquam.', '1563572981', 1, 1),
(1970, 31, 173, 'Libero.', '1563572981', 1, 0),
(1971, 70, 102, 'Hic sit quos.', '1563572981', 1, 0),
(1972, 2, 3, 'Sint accusantium at.', '1563572981', 1, 0),
(1975, 170, 104, 'Repudiandae voluptatem autem ullam.', '1563572981', 1, 0),
(1976, 98, 140, 'Id.', '1563572981', 0, 0),
(1978, 39, 48, 'Laboriosam expedita et.', '1563572981', 0, 1),
(1979, 21, 16, 'Dolore mollitia aut fugit.', '1563572981', 0, 1),
(1981, 157, 16, 'Ut quia incidunt sit odio.', '1563572981', 1, 0),
(1982, 29, 101, 'Nulla quia.', '1563572981', 1, 1),
(1984, 21, 13, 'Sunt.', '1563572981', 0, 0),
(1988, 170, 12, 'Non.', '1563572981', 0, 1),
(1989, 21, 137, 'Officiis consequatur ut mollitia qui.', '1563572982', 1, 1),
(1990, 40, 148, 'Ducimus ullam voluptate.', '1563572982', 1, 1),
(1991, 29, 174, 'Voluptatem autem qui consectetur.', '1563572982', 1, 1),
(1992, 50, 49, 'Inventore nulla id.', '1563572982', 1, 0),
(1994, 70, 18, 'Et animi.', '1563572982', 1, 1),
(1995, 39, 126, 'Vel.', '1563572982', 0, 1),
(1996, 57, 126, 'Veritatis.', '1563572982', 1, 0),
(1998, 26, 51, 'Saepe.', '1563572982', 1, 0),
(1999, 74, 164, 'Veritatis aut praesentium odio mollitia.', '1563572982', 0, 1),
(2003, 42, 77, 'Eum ut qui.', '1563572982', 1, 0),
(2004, 2, 33, 'Aut ea.', '1563572982', 0, 0),
(2005, 90, 97, 'Ut dolorem reprehenderit.', '1563572982', 1, 0),
(2006, 139, 134, 'Vitae ducimus.', '1563572982', 0, 1),
(2007, 15, 87, 'Temporibus consequatur possimus.', '1563572982', 1, 1),
(2008, 5, 1, 'Voluptas voluptatem.', '1563572982', 1, 1),
(2009, 151, 30, 'Maiores est sequi.', '1563572982', 0, 1),
(2010, 103, 24, 'Laboriosam qui est.', '1563572982', 1, 0),
(2011, 100, 158, 'Aut corrupti ut.', '1563572982', 0, 0),
(2012, 40, 45, 'Placeat et.', '1563572982', 1, 0),
(2013, 21, 6, 'Qui.', '1563572982', 0, 0),
(2014, 138, 90, 'Numquam perspiciatis quasi dolorem.', '1563572982', 1, 0),
(2018, 11, 77, 'In est eos qui.', '1563572982', 1, 0),
(2019, 56, 27, 'Qui natus.', '1563572982', 0, 0),
(2020, 171, 63, 'Ut assumenda quo ut ut ratione.', '1563572982', 1, 1),
(2021, 41, 3, 'Omnis eius esse.', '1563572982', 0, 1),
(2022, 79, 144, 'Fuga mollitia temporibus autem.', '1563572982', 1, 1),
(2023, 88, 149, 'Voluptate debitis aperiam.', '1563572982', 1, 1),
(2024, 149, 92, 'Quia.', '1563572982', 0, 1),
(2025, 39, 19, 'Ut.', '1563572982', 1, 1),
(2026, 16, 95, 'Harum.', '1563572982', 0, 0),
(2027, 153, 53, 'Fugit quidem qui.', '1563572982', 1, 0),
(2032, 164, 79, 'Fugit sint.', '1563572982', 0, 1),
(2033, 49, 36, 'Est saepe.', '1563572982', 0, 0),
(2035, 10, 38, 'Corporis aspernatur culpa quam voluptatibus fugiat.', '1563572982', 1, 1),
(2036, 7, 145, 'Accusantium eligendi.', '1563572982', 1, 1),
(2037, 151, 168, 'Ut eaque illum distinctio.', '1563572982', 0, 1),
(2038, 159, 68, 'Magni quibusdam.', '1563572982', 0, 0),
(2039, 32, 57, 'Vero optio laborum in.', '1563572982', 1, 1),
(2040, 101, 9, 'Nam suscipit.', '1563572982', 0, 0),
(2041, 53, 8, 'Beatae est.', '1563572983', 0, 0),
(2042, 95, 78, 'Quis eveniet nisi.', '1563572983', 1, 1),
(2043, 4, 41, 'Ut.', '1563572983', 0, 0),
(2045, 140, 79, 'Nesciunt natus quaerat.', '1563572983', 1, 0),
(2046, 142, 150, 'Id sunt necessitatibus eos incidunt sint.', '1563572983', 1, 1),
(2047, 59, 22, 'At vel sint architecto.', '1563572983', 0, 0),
(2049, 133, 159, 'Omnis et veritatis quia.', '1563572984', 1, 0),
(2050, 163, 130, 'Sint repellat qui adipisci quo.', '1563572984', 0, 0),
(2052, 64, 43, 'Soluta rerum.', '1563572984', 0, 1),
(2053, 1, 136, 'Voluptas delectus itaque tenetur.', '1563572984', 1, 0),
(2054, 16, 137, 'Et dolorem reiciendis quis.', '1563572984', 0, 1),
(2055, 88, 80, 'Sint in eius.', '1563572984', 0, 1),
(2056, 145, 97, 'Sit natus eligendi corrupti.', '1563572984', 0, 0),
(2057, 84, 21, 'Rem.', '1563572984', 0, 0),
(2058, 174, 7, 'Id.', '1563572984', 0, 0),
(2059, 65, 77, 'Enim aut.', '1563572984', 1, 1),
(2060, 161, 54, 'Tempora molestiae aut quo.', '1563572984', 0, 1),
(2061, 20, 56, 'Quia quis.', '1563572984', 0, 1),
(2062, 153, 53, 'Velit neque porro ut.', '1563572984', 0, 1),
(2063, 37, 145, 'Sed non temporibus.', '1563572984', 0, 1),
(2064, 165, 81, 'Ab illo.', '1563572984', 1, 1),
(2065, 133, 18, 'Accusamus harum fugit.', '1563572984', 0, 0),
(2067, 92, 80, 'Voluptatem sapiente reiciendis provident sed assumenda.', '1563572984', 0, 1),
(2068, 126, 50, 'Cupiditate dolorem dolor.', '1563572984', 1, 0),
(2071, 18, 168, 'Et pariatur.', '1563572984', 0, 0),
(2074, 101, 41, 'Quisquam velit nisi assumenda.', '1563572984', 1, 1),
(2076, 67, 67, 'Cum voluptatum.', '1563572984', 0, 1),
(2077, 48, 170, 'Quo hic est neque.', '1563572984', 0, 1),
(2078, 83, 98, 'Impedit nihil repudiandae.', '1563572984', 0, 1),
(2079, 4, 163, 'Qui illum placeat deleniti.', '1563572984', 1, 1),
(2080, 46, 95, 'Qui ea aut.', '1563572984', 1, 1),
(2081, 59, 40, 'Saepe corrupti non impedit eum.', '1563572984', 1, 1),
(2082, 67, 85, 'Natus et ipsam.', '1563572984', 1, 1),
(2084, 152, 175, 'Occaecati ut exercitationem.', '1563572985', 1, 0),
(2085, 34, 166, 'Cum eos sit.', '1563572985', 1, 0),
(2086, 91, 165, 'Tempore vero sed id.', '1563572985', 1, 1),
(2087, 56, 1, 'Excepturi sit dolorem.', '1563572985', 1, 1),
(2088, 102, 92, 'Quidem rem dignissimos.', '1563572985', 0, 1),
(2089, 81, 145, 'Non illum.', '1563572985', 0, 0),
(2090, 129, 25, 'Vel sequi.', '1563572985', 0, 1),
(2091, 98, 51, 'Totam atque blanditiis eaque.', '1563572985', 1, 1),
(2093, 160, 67, 'Qui voluptates eius.', '1563572985', 1, 1),
(2095, 140, 142, 'Accusamus ut dicta.', '1563572985', 1, 1),
(2097, 80, 6, 'Facere sint inventore.', '1563572985', 0, 1),
(2098, 14, 25, 'Voluptatem commodi architecto.', '1563572985', 1, 0),
(2099, 14, 17, 'Praesentium quis quam.', '1563572985', 1, 1),
(2100, 162, 93, 'Molestias omnis.', '1563572985', 1, 1),
(2101, 95, 157, 'Corrupti deserunt eius ratione.', '1563572985', 1, 1),
(2104, 136, 127, 'Nisi mollitia.', '1563572985', 1, 1),
(2105, 48, 46, 'Est est sit delectus ipsum saepe.', '1563572985', 1, 0),
(2106, 72, 70, 'Ipsum libero incidunt non.', '1563572985', 1, 0),
(2107, 128, 138, 'Nostrum repudiandae libero libero enim.', '1563572985', 0, 1),
(2108, 71, 100, 'Unde natus pariatur.', '1563572985', 0, 0),
(2109, 61, 139, 'Quidem dolor quidem nulla at.', '1563572985', 1, 1),
(2111, 175, 136, 'Omnis quis voluptate libero fugit.', '1563572985', 0, 0),
(2112, 2, 59, 'Nihil expedita veritatis adipisci eaque quo.', '1563572985', 0, 1),
(2114, 155, 21, 'Ratione et nobis voluptatem.', '1563572985', 0, 0),
(2115, 68, 132, 'Nam quis praesentium.', '1563572985', 0, 0),
(2116, 171, 69, 'Aspernatur officiis culpa ut hic.', '1563572985', 1, 0),
(2118, 77, 160, 'Quia nemo.', '1563572985', 0, 1),
(2119, 8, 166, 'Omnis aut.', '1563572985', 0, 1),
(2120, 60, 129, 'Nihil.', '1563572985', 1, 1),
(2121, 93, 171, 'Voluptatem.', '1563572985', 1, 1),
(2122, 52, 29, 'Harum.', '1563572985', 0, 1),
(2123, 69, 52, 'Vitae natus sed.', '1563572985', 1, 0),
(2124, 130, 65, 'Qui et aut perferendis sed rerum.', '1563572985', 1, 1),
(2126, 138, 85, 'Nisi eos qui velit enim.', '1563572986', 0, 1),
(2127, 36, 12, 'Vel qui laudantium ipsa.', '1563572986', 1, 0),
(2128, 70, 59, 'Consequuntur consequatur similique similique.', '1563572986', 0, 1),
(2129, 94, 63, 'Esse dolorum nostrum.', '1563572986', 0, 1),
(2130, 134, 84, 'Non sed.', '1563572986', 1, 1),
(2131, 17, 53, 'Neque quo.', '1563572986', 0, 0),
(2132, 76, 173, 'Eveniet molestias.', '1563572986', 1, 1),
(2134, 129, 62, 'Eveniet velit.', '1563572986', 1, 1),
(2135, 24, 63, 'Dicta repellendus.', '1563572986', 1, 0),
(2137, 84, 170, 'Incidunt.', '1563572986', 0, 1),
(2138, 27, 6, 'Facilis nihil.', '1563572986', 0, 0),
(2139, 78, 141, 'Culpa.', '1563572986', 0, 1),
(2140, 45, 39, 'Non odit qui ex quis.', '1563572986', 0, 0),
(2141, 25, 35, 'Laudantium omnis.', '1563572986', 1, 0),
(2142, 137, 166, 'Dolores.', '1563572986', 0, 1),
(2143, 1, 9, 'Quia aspernatur.', '1563572986', 0, 0),
(2144, 176, 81, 'Ea.', '1563572986', 0, 0),
(2146, 154, 27, 'Et consequuntur deleniti.', '1563572986', 0, 1),
(2147, 148, 9, 'Dicta officia consequatur.', '1563572986', 1, 0),
(2148, 52, 47, 'Id pariatur consectetur debitis illum.', '1563572986', 0, 1),
(2149, 18, 21, 'Molestias provident eius perferendis et nostrum.', '1563572986', 1, 0),
(2151, 139, 21, 'Non facere culpa.', '1563572986', 1, 1),
(2152, 12, 41, 'Magni quas aperiam.', '1563572986', 0, 1),
(2153, 73, 68, 'Quas unde praesentium consequatur quia.', '1563572986', 0, 0),
(2154, 8, 152, 'Rem ipsa.', '1563572986', 0, 1),
(2156, 49, 155, 'Optio aut.', '1563572987', 1, 1),
(2159, 85, 139, 'Consequatur est aut et.', '1563572987', 1, 0),
(2160, 165, 53, 'Commodi ab consectetur aut.', '1563572987', 0, 1),
(2163, 174, 9, 'Ea vero omnis.', '1563572987', 0, 0),
(2164, 102, 90, 'Quam nihil nostrum.', '1563572987', 0, 1),
(2165, 31, 96, 'Aut et cumque molestiae.', '1563572987', 0, 1),
(2166, 87, 67, 'Amet beatae dolores.', '1563572987', 1, 0),
(2167, 91, 80, 'Voluptas sed adipisci.', '1563572987', 1, 0),
(2168, 133, 82, 'A suscipit sit in occaecati corrupti.', '1563572987', 0, 0),
(2169, 22, 43, 'Placeat.', '1563572987', 1, 0),
(2170, 48, 11, 'Repudiandae sapiente aut.', '1563572987', 1, 0),
(2171, 163, 27, 'Quaerat ut.', '1563572987', 0, 1),
(2172, 62, 141, 'Rerum molestiae autem.', '1563572987', 0, 0),
(2173, 160, 139, 'Culpa quisquam hic quia natus.', '1563572987', 1, 1),
(2174, 148, 167, 'Sint.', '1563572987', 1, 1),
(2175, 93, 43, 'Eveniet ut.', '1563572987', 0, 0),
(2176, 49, 31, 'Et consequatur quo nihil qui.', '1563572987', 1, 1),
(2177, 49, 38, 'Consequatur perspiciatis commodi minus distinctio.', '1563572987', 1, 0),
(2178, 170, 29, 'Dignissimos iusto eos adipisci.', '1563572987', 0, 0),
(2179, 140, 46, 'Qui quidem natus assumenda.', '1563572987', 0, 1),
(2180, 150, 23, 'Et labore.', '1563572987', 0, 1),
(2181, 57, 101, 'Quo nam labore quia.', '1563572987', 0, 0),
(2182, 96, 172, 'Vel eius eos.', '1563572987', 1, 0),
(2183, 10, 144, 'Id neque maxime culpa unde.', '1563572987', 1, 1),
(2184, 86, 33, 'Qui molestiae repudiandae.', '1563572987', 0, 1),
(2185, 176, 128, 'Voluptatem dolorum ipsa.', '1563572987', 1, 0),
(2186, 80, 33, 'Voluptates quasi.', '1563572987', 0, 0),
(2187, 15, 66, 'Ex sed.', '1563572987', 0, 1),
(2189, 48, 95, 'A similique.', '1563572987', 1, 0),
(2190, 151, 80, 'Amet sit.', '1563572987', 0, 1),
(2191, 2, 29, 'Necessitatibus adipisci.', '1563572987', 0, 1),
(2192, 69, 169, 'Mollitia.', '1563572987', 0, 1),
(2193, 166, 146, 'Aut sit.', '1563572987', 0, 0),
(2194, 103, 18, 'Dignissimos.', '1563572987', 0, 1),
(2195, 73, 156, 'Voluptatem.', '1563572987', 0, 0),
(2196, 16, 36, 'Non eligendi.', '1563572987', 1, 1),
(2199, 92, 55, 'Cupiditate non est ut est.', '1563572987', 1, 0),
(2202, 54, 51, 'Sed consequuntur quae.', '1563572987', 1, 1),
(2205, 104, 25, 'Eveniet enim qui.', '1563572987', 0, 1),
(2206, 137, 40, 'Non.', '1563572987', 0, 1),
(2208, 138, 151, 'Explicabo earum nulla accusamus.', '1563572987', 1, 1),
(2209, 65, 6, 'Voluptate esse non.', '1563572987', 1, 0),
(2210, 5, 159, 'Qui laboriosam.', '1563572987', 1, 0),
(2211, 160, 43, 'Sint quos.', '1563572987', 1, 0),
(2212, 65, 158, 'Blanditiis repellendus.', '1563572987', 0, 1),
(2215, 88, 4, 'Non aperiam unde.', '1563572987', 1, 0),
(2216, 12, 92, 'Consectetur corporis veniam voluptatibus.', '1563572987', 1, 1),
(2217, 129, 140, 'Non fugit.', '1563572987', 1, 1),
(2218, 21, 138, 'Rerum quia qui.', '1563572987', 0, 0),
(2219, 51, 7, 'Sit.', '1563572987', 1, 1);
INSERT INTO `messages_list` (`id`, `userId`, `toId`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`) VALUES
(2223, 77, 46, 'Officia ipsum provident.', '1563572987', 1, 0),
(2224, 40, 28, 'Beatae modi eius explicabo.', '1563572987', 1, 1),
(2225, 75, 46, 'Sequi est a.', '1563572987', 0, 1),
(2226, 133, 73, 'Ut voluptas at sint vel.', '1563572987', 0, 0),
(2227, 171, 79, 'Maiores.', '1563572987', 0, 1),
(2228, 81, 45, 'Debitis consequatur voluptas corrupti.', '1563572987', 1, 0),
(2229, 83, 80, 'Dolorem fugit cum odit.', '1563572988', 0, 1),
(2234, 133, 56, 'Est in voluptatum.', '1563572988', 0, 0),
(2235, 98, 78, 'Corporis rerum mollitia ut.', '1563572988', 1, 0),
(2236, 78, 11, 'Aut eum blanditiis rerum.', '1563572988', 1, 1),
(2237, 49, 153, 'Voluptates.', '1563572988', 0, 1),
(2238, 172, 1, 'Ut.', '1563572988', 1, 1),
(2240, 152, 65, 'Ut nihil sit.', '1563572988', 1, 0),
(2241, 20, 79, 'Earum amet in.', '1563572988', 1, 0),
(2242, 8, 83, 'Ad molestias quos minus.', '1563572988', 1, 1),
(2243, 6, 71, 'Molestiae qui eaque molestiae.', '1563572988', 1, 1),
(2244, 13, 78, 'Dolores consectetur aut.', '1563572988', 1, 0),
(2245, 82, 131, 'Aut et dolore dignissimos.', '1563572988', 0, 1),
(2246, 176, 154, 'Harum amet.', '1563572988', 1, 1),
(2247, 77, 38, 'Iure numquam consequatur sint.', '1563572988', 0, 1),
(2250, 13, 147, 'Vitae commodi unde quas voluptas.', '1563572988', 0, 1),
(2252, 166, 67, 'Quia.', '1563572988', 0, 0),
(2253, 163, 3, 'Omnis minus et.', '1563572988', 0, 0),
(2254, 50, 143, 'Eius et ducimus.', '1563572988', 1, 1),
(2255, 30, 58, 'Quasi rerum necessitatibus quam.', '1563572988', 0, 0),
(2256, 1, 98, 'Consectetur qui a incidunt.', '1563572988', 0, 1),
(2257, 98, 138, 'Ipsum tempore eum.', '1563572988', 1, 0),
(2258, 133, 78, 'Sit nihil sed.', '1563572988', 0, 1),
(2259, 80, 163, 'Est voluptatem.', '1563572988', 1, 1),
(2260, 24, 86, 'Rem quod cum.', '1563572988', 1, 0),
(2261, 141, 34, 'Architecto sed ut.', '1563572988', 1, 1),
(2262, 92, 171, 'Id deserunt omnis.', '1563572988', 1, 1),
(2264, 164, 70, 'Qui eaque consequatur.', '1563572988', 0, 0),
(2265, 71, 169, 'Cum assumenda maiores.', '1563572988', 1, 0),
(2267, 93, 173, 'Fuga nisi.', '1563572988', 0, 1),
(2268, 134, 25, 'Perspiciatis atque est.', '1563572988', 0, 0),
(2269, 158, 163, 'Repellat perferendis dicta.', '1563572988', 1, 0),
(2270, 157, 32, 'Animi sunt et.', '1563572988', 1, 1),
(2272, 136, 77, 'Rerum qui.', '1563572988', 0, 0),
(2273, 70, 75, 'Asperiores sunt.', '1563572988', 0, 1),
(2274, 163, 137, 'Ut veniam quo ab necessitatibus.', '1563572988', 0, 1),
(2275, 161, 41, 'Nam.', '1563572988', 1, 0),
(2276, 155, 126, 'Cum sit.', '1563572988', 1, 0),
(2277, 57, 169, 'Accusantium blanditiis soluta.', '1563572988', 1, 0),
(2278, 15, 31, 'Architecto iusto expedita.', '1563572988', 0, 1),
(2279, 61, 97, 'Numquam suscipit libero.', '1563572988', 0, 0),
(2281, 30, 45, 'Impedit sapiente eum.', '1563572988', 0, 0),
(2283, 69, 35, 'Et omnis.', '1563572988', 0, 0),
(2285, 57, 65, 'Ducimus dolorem.', '1563572988', 0, 1),
(2286, 6, 153, 'Odit labore.', '1563572988', 0, 1),
(2287, 135, 104, 'Inventore repellendus.', '1563572988', 0, 1),
(2289, 21, 101, 'Perspiciatis eligendi est.', '1563572988', 0, 0),
(2290, 33, 167, 'Soluta soluta et.', '1563572988', 1, 1),
(2291, 28, 156, 'In.', '1563572988', 0, 0),
(2292, 90, 42, 'Qui et maiores et in rem.', '1563572988', 1, 0),
(2293, 84, 151, 'Aperiam doloribus voluptates eaque.', '1563572988', 0, 1),
(2294, 39, 72, 'Exercitationem ea perspiciatis.', '1563572988', 0, 0),
(2295, 16, 17, 'Aliquid nisi ducimus est saepe.', '1563572988', 1, 0),
(2297, 127, 150, 'Quae molestiae fuga.', '1563572988', 0, 1),
(2298, 85, 12, 'Ad perferendis voluptatum.', '1563572988', 0, 0),
(2300, 6, 41, 'Nisi dolores est quis consequatur et.', '1563572988', 1, 0),
(2301, 172, 154, 'Soluta officia ex necessitatibus laboriosam occaecati.', '1563572988', 1, 1),
(2303, 31, 139, 'Error aliquid aspernatur voluptatem consequatur.', '1563572988', 1, 1),
(2304, 15, 159, 'Ut corporis nam.', '1563572988', 1, 0),
(2305, 62, 96, 'Dolor aut.', '1563572988', 0, 0),
(2306, 89, 132, 'Nobis eos.', '1563572988', 0, 0),
(2307, 84, 67, 'Voluptates itaque.', '1563572988', 0, 1),
(2309, 136, 87, 'Magnam est ut et.', '1563572988', 1, 0),
(2310, 100, 27, 'Quam.', '1563572988', 0, 1),
(2311, 10, 51, 'Corrupti reprehenderit non.', '1563572988', 1, 1),
(2313, 104, 46, 'Repellat neque.', '1563572989', 0, 1),
(2314, 60, 138, 'Et.', '1563572989', 1, 1),
(2316, 146, 29, 'Optio aut dolorum ut.', '1563572989', 1, 1),
(2317, 43, 12, 'Eius neque ut.', '1563572989', 0, 0),
(2318, 85, 134, 'Dolorum et.', '1563572989', 1, 0),
(2319, 163, 159, 'Iste voluptas eligendi.', '1563572989', 1, 0),
(2320, 142, 52, 'Deserunt quis.', '1563572989', 0, 1),
(2322, 174, 12, 'Aut magni.', '1563572989', 1, 0),
(2324, 79, 99, 'Vero in molestiae voluptatem nihil.', '1563572989', 0, 1),
(2325, 30, 128, 'Modi omnis.', '1563572989', 0, 0),
(2326, 133, 28, 'Doloremque vel.', '1563572989', 0, 1),
(2329, 91, 130, 'Repellendus voluptas aut.', '1563572989', 1, 0),
(2330, 73, 2, 'Doloribus quia.', '1563572989', 1, 0),
(2331, 19, 160, 'Maiores cumque est sit.', '1563572989', 1, 0),
(2332, 145, 72, 'Dolorum.', '1563572989', 0, 0),
(2333, 89, 101, 'Cum tempora.', '1563572990', 1, 1),
(2334, 78, 49, 'Ad odio rerum magnam dolore.', '1563572990', 0, 0),
(2335, 10, 61, 'Qui ipsum voluptas officia.', '1563572990', 1, 1),
(2336, 173, 56, 'Modi tempore ea.', '1563572990', 1, 0),
(2338, 142, 4, 'Amet.', '1563572991', 1, 0),
(2339, 54, 164, 'Minus sit voluptatem.', '1563572991', 0, 0),
(2340, 162, 133, 'Nobis modi molestiae.', '1563572992', 1, 0),
(2341, 126, 74, 'Amet omnis.', '1563572992', 1, 0),
(2342, 129, 149, 'Et velit.', '1563572992', 1, 0),
(2343, 147, 155, 'Est atque impedit nobis.', '1563572992', 0, 1),
(2345, 134, 53, 'Praesentium qui exercitationem.', '1563572993', 1, 0),
(2346, 130, 98, 'Ea dolor ut.', '1563572993', 0, 0),
(2347, 40, 141, 'Rerum et ad est.', '1563572993', 1, 1),
(2348, 152, 54, 'Aliquid voluptas vitae pariatur voluptatem.', '1563572994', 1, 1),
(2350, 75, 31, 'Vel rerum aut.', '1563572995', 0, 0),
(2351, 159, 79, 'Facilis voluptatum repudiandae.', '1563572995', 0, 0),
(2352, 4, 89, 'Ut omnis aut.', '1563572995', 1, 0),
(2353, 55, 139, 'Ut cupiditate sint.', '1563572995', 0, 1),
(2355, 126, 25, 'Similique aperiam.', '1563572996', 0, 0),
(2356, 69, 149, 'Vel fugit eum maiores.', '1563572997', 0, 0),
(2357, 169, 154, 'A delectus iusto.', '1563572997', 0, 1),
(2358, 80, 6, 'Cum sint consectetur.', '1563572997', 0, 0),
(2359, 13, 3, 'Harum odit.', '1563572998', 0, 1),
(2360, 17, 25, 'Iste aut culpa.', '1563572998', 0, 1),
(2361, 70, 56, 'Pariatur nam quam inventore.', '1563572998', 1, 0),
(2363, 17, 84, 'Ut delectus et.', '1563572998', 1, 0),
(2364, 99, 101, 'Aut nesciunt.', '1563572998', 0, 0),
(2365, 90, 38, 'Similique quas molestiae.', '1563572998', 0, 1),
(2366, 73, 88, 'Perspiciatis consequuntur.', '1563572998', 0, 0),
(2367, 1, 98, 'Et dolorem doloribus.', '1563572998', 0, 0),
(2369, 29, 63, 'Sint est.', '1563572998', 1, 0),
(2370, 57, 11, 'Numquam nam molestiae.', '1563572998', 1, 1),
(2372, 51, 147, 'Rem.', '1563572998', 1, 0),
(2374, 79, 145, 'Et.', '1563572998', 1, 1),
(2375, 66, 104, 'Ratione totam veniam.', '1563572998', 1, 0),
(2376, 35, 148, 'Est consequuntur.', '1563572998', 1, 1),
(2377, 169, 151, 'Delectus sunt.', '1563572998', 0, 0),
(2378, 142, 152, 'Est dolor.', '1563572998', 0, 0),
(2379, 84, 175, 'Et dolores aspernatur.', '1563572998', 1, 1),
(2380, 168, 88, 'Laudantium sed.', '1563572998', 0, 1),
(2382, 36, 89, 'Optio.', '1563572998', 0, 1),
(2384, 161, 8, 'Voluptatem voluptatum adipisci rerum vitae.', '1563572998', 1, 1),
(2385, 45, 97, 'Occaecati incidunt unde animi.', '1563572998', 1, 0),
(2387, 58, 64, 'Sint sit.', '1563572998', 1, 0),
(2388, 24, 170, 'Qui tempore.', '1563572998', 0, 1),
(2389, 75, 52, 'Blanditiis ut at labore iste.', '1563572998', 0, 0),
(2390, 68, 96, 'Nostrum excepturi aut sed recusandae.', '1563572998', 1, 1),
(2391, 99, 154, 'Magnam sed facere.', '1563572998', 1, 1),
(2392, 96, 44, 'Aliquid amet est asperiores soluta.', '1563572998', 1, 0),
(2393, 151, 75, 'Cumque accusamus blanditiis et nulla.', '1563572998', 0, 0),
(2395, 101, 174, 'Magni eum voluptas.', '1563572998', 0, 0),
(2396, 153, 158, 'Nemo voluptas dolor.', '1563572998', 0, 0),
(2399, 31, 98, 'Enim.', '1563572998', 0, 1),
(2400, 29, 49, 'Dignissimos.', '1563572998', 1, 1),
(2402, 50, 94, 'Iusto velit.', '1563572998', 1, 1),
(2403, 173, 74, 'Pariatur.', '1563572998', 0, 0),
(2404, 12, 52, 'Aut excepturi.', '1563572998', 0, 0),
(2406, 59, 37, 'Quam reiciendis.', '1563572999', 0, 1),
(2407, 52, 36, 'Laborum optio.', '1563572999', 0, 1),
(2408, 29, 52, 'Eos aut autem cupiditate.', '1563572999', 1, 0),
(2409, 50, 22, 'Quia.', '1563572999', 1, 1),
(2411, 5, 65, 'Qui debitis facilis.', '1563572999', 1, 0),
(2412, 35, 162, 'Labore.', '1563572999', 0, 1),
(2413, 50, 165, 'Ut et.', '1563572999', 1, 1),
(2415, 60, 138, 'Corporis vel architecto.', '1563572999', 1, 1),
(2416, 157, 46, 'Libero dolores quis doloribus.', '1563572999', 0, 1),
(2417, 137, 47, 'Exercitationem rerum.', '1563572999', 0, 1),
(2418, 159, 142, 'Laudantium deserunt id possimus recusandae.', '1563572999', 1, 1),
(2419, 34, 137, 'Aut hic explicabo omnis.', '1563572999', 1, 1),
(2420, 135, 136, 'Similique sed eligendi.', '1563572999', 1, 0),
(2421, 68, 144, 'Sint expedita.', '1563572999', 1, 0),
(2422, 98, 87, 'Quasi architecto vel sunt sint.', '1563572999', 0, 1),
(2423, 176, 167, 'Quos est itaque.', '1563572999', 0, 1),
(2424, 15, 50, 'Quae qui ad aut iste.', '1563572999', 1, 1),
(2425, 134, 140, 'Doloribus unde voluptatem facilis quasi.', '1563572999', 1, 0),
(2427, 148, 14, 'Dolor praesentium ad.', '1563572999', 1, 0),
(2428, 99, 51, 'Libero eum.', '1563573000', 0, 0),
(2429, 82, 92, 'Sed ipsa.', '1563573000', 0, 1),
(2430, 163, 145, 'Rerum et et et.', '1563573000', 0, 1),
(2431, 127, 170, 'Delectus ea.', '1563573000', 1, 1),
(2432, 97, 17, 'Consectetur esse.', '1563573000', 0, 1),
(2433, 96, 84, 'Perferendis iure voluptatem.', '1563573000', 1, 1),
(2434, 85, 133, 'Magni culpa.', '1563573000', 1, 1),
(2435, 79, 174, 'Sapiente placeat dolorem.', '1563573000', 0, 1),
(2436, 79, 57, 'Consequatur non.', '1563573000', 0, 0),
(2437, 133, 127, 'Cupiditate.', '1563573000', 1, 0),
(2438, 104, 176, 'Eum consequatur quia voluptas delectus.', '1563573000', 0, 1),
(2439, 131, 136, 'Temporibus rerum maxime et.', '1563573000', 1, 0),
(2440, 131, 140, 'Eum consequuntur modi.', '1563573000', 1, 1),
(2441, 173, 172, 'Quaerat vitae ipsum.', '1563573000', 0, 0),
(2442, 86, 4, 'Reprehenderit non.', '1563573000', 0, 0),
(2443, 27, 90, 'Sapiente culpa eum sequi.', '1563573000', 0, 0),
(2444, 72, 42, 'Quas dolorum.', '1563573000', 1, 1),
(2447, 56, 16, 'Qui voluptas.', '1563573000', 1, 0),
(2449, 44, 64, 'Alias ducimus.', '1563573000', 0, 1),
(2450, 58, 5, 'Distinctio est culpa.', '1563573000', 0, 1),
(2451, 2, 20, 'Modi sit ut eaque.', '1563573000', 1, 1),
(2452, 142, 165, 'Nulla vel aut culpa.', '1563573000', 0, 0),
(2453, 170, 126, 'Autem alias reiciendis.', '1563573000', 1, 0),
(2455, 24, 6, 'Minima est aliquid et omnis.', '1563573000', 0, 0),
(2457, 164, 42, 'Consequatur tempora placeat.', '1563573000', 1, 1),
(2458, 166, 62, 'Qui laudantium.', '1563573000', 1, 1),
(2459, 95, 103, 'Quos.', '1563573000', 0, 1),
(2460, 97, 165, 'Culpa commodi.', '1563573000', 0, 1),
(2461, 85, 171, 'Officia et.', '1563573001', 0, 0),
(2463, 54, 82, 'Alias voluptatem dolore nulla.', '1563573001', 0, 0),
(2464, 131, 89, 'Sed sint.', '1563573001', 0, 1),
(2465, 53, 100, 'Vel.', '1563573001', 0, 0),
(2466, 7, 142, 'Sit.', '1563573001', 0, 1),
(2467, 139, 1, 'Voluptatem fugiat animi recusandae harum.', '1563573001', 1, 1),
(2468, 66, 131, 'Qui sit similique.', '1563573001', 0, 1),
(2469, 60, 41, 'Nisi atque repudiandae rem.', '1563573001', 1, 0),
(2470, 145, 87, 'Corrupti fugiat.', '1563573001', 0, 1),
(2471, 44, 145, 'Dolor magnam.', '1563573001', 0, 0),
(2472, 40, 141, 'Vel unde excepturi.', '1563573001', 1, 0),
(2474, 12, 49, 'Assumenda quia.', '1563573001', 0, 1),
(2475, 52, 39, 'Nemo voluptas.', '1563573001', 0, 0),
(2476, 154, 89, 'Repudiandae qui optio.', '1563573001', 0, 1),
(2478, 57, 19, 'Sint nostrum enim.', '1563573001', 0, 1),
(2479, 152, 135, 'Repudiandae.', '1563573001', 0, 1),
(2480, 4, 12, 'Cum voluptatem est.', '1563573001', 0, 0),
(2481, 172, 92, 'Et consequatur dolorem expedita.', '1563573001', 0, 0),
(2483, 55, 29, 'Enim.', '1563573001', 0, 0),
(2484, 73, 72, 'Dolorum sequi.', '1563573001', 0, 0),
(2485, 29, 62, 'Aut natus veniam itaque.', '1563573001', 1, 0),
(2486, 16, 138, 'Et.', '1563573002', 1, 1),
(2488, 83, 97, 'Odit voluptatibus amet inventore.', '1563573002', 1, 1),
(2489, 12, 77, 'Rerum laborum libero rem nobis.', '1563573002', 0, 1),
(2490, 147, 59, 'Aut dignissimos in.', '1563573002', 0, 0),
(2491, 15, 64, 'Adipisci labore.', '1563573002', 1, 0),
(2492, 88, 173, 'Maiores ut quos.', '1563573002', 1, 0),
(2493, 43, 135, 'Velit et at.', '1563573002', 0, 0),
(2494, 19, 43, 'Alias nihil.', '1563573002', 1, 0),
(2495, 140, 37, 'Enim reiciendis.', '1563573002', 1, 0),
(2498, 137, 157, 'Cumque libero quis reiciendis.', '1563573002', 1, 0),
(2499, 128, 14, 'Est.', '1563573002', 0, 1),
(2501, 49, 168, 'Aut accusamus.', '1563573002', 0, 0),
(2502, 12, 51, 'Eum.', '1563573002', 1, 1),
(2503, 59, 49, 'Accusamus consequatur occaecati labore.', '1563573002', 1, 0),
(2504, 12, 145, 'Suscipit aliquid necessitatibus.', '1563573002', 1, 0),
(2505, 172, 144, 'Dolore soluta.', '1563573002', 0, 1),
(2506, 170, 157, 'Ut quas voluptas delectus maiores ipsum.', '1563573002', 0, 1),
(2507, 103, 29, 'Id voluptatem.', '1563573002', 0, 0),
(2508, 175, 34, 'Nihil magni placeat dolorum.', '1563573002', 1, 1),
(2509, 150, 136, 'Enim saepe.', '1563573002', 0, 0),
(2510, 32, 82, 'Aperiam aut labore.', '1563573002', 1, 1),
(2511, 5, 129, 'Quia cupiditate in.', '1563573002', 1, 1),
(2515, 168, 95, 'Ducimus quis.', '1563573002', 0, 1),
(2516, 150, 59, 'In doloremque.', '1563573002', 0, 0),
(2517, 17, 59, 'Nesciunt commodi rem assumenda.', '1563573003', 1, 0),
(2518, 149, 170, 'Assumenda aliquid.', '1563573003', 1, 1),
(2519, 128, 131, 'Velit rerum temporibus quia eveniet ea.', '1563573003', 1, 1),
(2520, 94, 54, 'Asperiores et iusto commodi.', '1563573003', 1, 1),
(2521, 1, 83, 'Quasi ex dolores laudantium.', '1563573003', 1, 0),
(2522, 34, 151, 'Vero reiciendis nam.', '1563573003', 1, 0),
(2523, 102, 36, 'Minima sint autem.', '1563573003', 0, 1),
(2524, 158, 16, 'Atque asperiores voluptates officia.', '1563573003', 1, 0),
(2525, 55, 32, 'Ratione eum neque quis voluptatem.', '1563573003', 0, 0),
(2527, 54, 44, 'Accusantium et.', '1563573003', 1, 1),
(2528, 50, 75, 'Placeat voluptates.', '1563573003', 1, 1),
(2529, 132, 7, 'Illum deserunt non consequatur quasi dolorum.', '1563573003', 1, 0),
(2530, 95, 48, 'Ut est harum officiis.', '1563573003', 0, 1),
(2531, 100, 144, 'Odio voluptate at.', '1563573003', 0, 0),
(2532, 156, 143, 'Et molestiae commodi.', '1563573003', 0, 0),
(2533, 158, 70, 'Aut iure saepe.', '1563573003', 0, 1),
(2534, 91, 137, 'Velit.', '1563573003', 0, 0),
(2535, 93, 86, 'Voluptas dolore magni maxime asperiores delectus.', '1563573003', 1, 0),
(2537, 31, 23, 'Iste occaecati.', '1563573003', 1, 1),
(2538, 43, 54, 'Necessitatibus unde incidunt.', '1563573003', 0, 0),
(2539, 144, 41, 'Non perspiciatis adipisci recusandae.', '1563573003', 0, 1),
(2540, 142, 162, 'Aut sed nemo est.', '1563573003', 0, 1),
(2541, 171, 5, 'Excepturi sed.', '1563573003', 1, 0),
(2542, 36, 13, 'Omnis quisquam.', '1563573003', 1, 0),
(2543, 87, 160, 'Eius asperiores distinctio vero necessitatibus.', '1563573003', 1, 0),
(2544, 59, 26, 'Et consectetur culpa accusantium.', '1563573003', 1, 1),
(2545, 17, 152, 'Et et.', '1563573003', 0, 1),
(2546, 143, 4, 'Blanditiis aliquid voluptas ratione voluptatem.', '1563573003', 0, 1),
(2547, 9, 167, 'Adipisci inventore.', '1563573003', 0, 1),
(2548, 171, 63, 'Reiciendis iusto provident deserunt.', '1563573004', 0, 1),
(2549, 54, 12, 'Qui at et.', '1563573004', 0, 0),
(2550, 157, 9, 'Nihil repellat eligendi beatae.', '1563573004', 1, 1),
(2551, 67, 138, 'Possimus aperiam laboriosam.', '1563573004', 1, 0),
(2552, 75, 89, 'Sed repudiandae eum qui.', '1563573004', 1, 1),
(2553, 132, 15, 'Autem.', '1563573004', 0, 1),
(2554, 31, 167, 'Ab quia.', '1563573004', 0, 1),
(2555, 89, 36, 'Autem iure soluta.', '1563573004', 1, 0),
(2556, 32, 22, 'Sunt maiores voluptatum.', '1563573004', 0, 1),
(2557, 147, 85, 'Esse repudiandae asperiores autem.', '1563573004', 0, 0),
(2558, 50, 151, 'Qui pariatur voluptatem a.', '1563573004', 0, 1),
(2559, 68, 176, 'Ut ut et explicabo vitae et.', '1563573004', 0, 0),
(2560, 102, 78, 'Voluptatem voluptatem necessitatibus.', '1563573004', 1, 1),
(2562, 69, 26, 'Ipsum natus dolores dicta.', '1563573004', 1, 0),
(2563, 49, 129, 'Nihil qui id neque ut rerum.', '1563573004', 1, 0),
(2564, 62, 31, 'Corporis tenetur.', '1563573004', 0, 1),
(2565, 30, 141, 'Vel odio.', '1563573004', 0, 1),
(2566, 4, 50, 'Ullam adipisci.', '1563573004', 1, 1),
(2567, 72, 84, 'Ut ex corrupti ut.', '1563573004', 1, 1),
(2570, 50, 62, 'Iure.', '1563573004', 0, 0),
(2571, 170, 22, 'Eum quos ea.', '1563573004', 1, 1),
(2573, 64, 72, 'In tenetur.', '1563573004', 0, 1),
(2574, 7, 97, 'Sit quam iusto.', '1563573004', 0, 0),
(2576, 174, 162, 'Dolorum illo veniam enim eius aut.', '1563573004', 1, 1),
(2578, 157, 172, 'Quidem.', '1563573004', 0, 1),
(2580, 26, 51, 'Debitis sint nemo ipsam adipisci.', '1563573004', 0, 1),
(2581, 42, 89, 'Porro et.', '1563573004', 0, 1),
(2582, 159, 28, 'Numquam voluptatem ex officia repellendus voluptates.', '1563573004', 1, 0),
(2583, 163, 62, 'Quia non quis possimus adipisci.', '1563573004', 0, 1),
(2584, 141, 19, 'Illo.', '1563573004', 0, 0),
(2585, 97, 80, 'Odit aut eligendi.', '1563573004', 1, 0),
(2586, 40, 37, 'Aut.', '1563573004', 0, 0),
(2587, 66, 45, 'Ducimus maxime tempora.', '1563573004', 0, 0),
(2588, 168, 51, 'Nisi molestiae commodi accusamus est et.', '1563573004', 0, 0),
(2589, 11, 90, 'Hic sunt.', '1563573004', 1, 0),
(2591, 37, 25, 'Quo.', '1563573004', 0, 0),
(2593, 66, 36, 'Eum qui enim dicta velit.', '1563573004', 1, 0),
(2594, 59, 145, 'Recusandae.', '1563573004', 0, 1),
(2595, 135, 67, 'Minima laudantium eveniet labore.', '1563573004', 0, 1),
(2596, 53, 31, 'Quas quia fugit.', '1563573004', 0, 0),
(2598, 160, 175, 'Non qui.', '1563573004', 1, 0),
(2599, 175, 137, 'Sunt laudantium necessitatibus et.', '1563573004', 0, 1),
(2600, 143, 165, 'Rem omnis ab.', '1563573004', 1, 0),
(2601, 142, 17, 'Deleniti quo mollitia.', '1563573004', 0, 1),
(2602, 6, 126, 'Eaque dolor illum.', '1563573004', 0, 1),
(2603, 4, 76, 'Culpa ut.', '1563573004', 0, 0),
(2605, 79, 56, 'Ex ut magni.', '1563573004', 1, 1),
(2607, 60, 6, 'Necessitatibus voluptates sint dolore omnis.', '1563573004', 0, 0),
(2608, 80, 149, 'Quia libero et.', '1563573004', 1, 0),
(2609, 38, 52, 'Impedit saepe.', '1563573004', 1, 1),
(2610, 88, 30, 'Dignissimos consequatur soluta impedit dolores.', '1563573005', 0, 0),
(2611, 89, 18, 'Iste.', '1563573005', 0, 0),
(2612, 19, 37, 'Et debitis ratione.', '1563573005', 1, 1),
(2615, 41, 2, 'Qui velit officia.', '1563573005', 0, 1),
(2616, 143, 52, 'Molestiae.', '1563573005', 1, 1),
(2617, 18, 63, 'Ipsum est iste perspiciatis.', '1563573005', 0, 1),
(2618, 142, 146, 'Iusto rerum.', '1563573005', 1, 1),
(2619, 150, 166, 'Qui culpa dolor.', '1563573005', 1, 1),
(2620, 31, 168, 'Labore vel.', '1563573005', 1, 0),
(2621, 168, 73, 'Ducimus dolorum voluptatem.', '1563573005', 1, 1),
(2622, 147, 135, 'Voluptas non cupiditate voluptatem.', '1563573005', 0, 1),
(2623, 143, 64, 'Ratione.', '1563573005', 1, 0),
(2624, 34, 23, 'Repellat rerum rem voluptas.', '1563573005', 1, 0),
(2625, 58, 141, 'Ipsum.', '1563573005', 0, 0),
(2628, 134, 171, 'Aperiam incidunt omnis.', '1563573005', 0, 0),
(2631, 88, 67, 'Quidem iure est.', '1563573005', 0, 1),
(2633, 148, 67, 'Ea repellendus autem nobis itaque.', '1563573005', 0, 0),
(2634, 87, 31, 'Consequuntur sapiente.', '1563573005', 1, 0),
(2635, 154, 144, 'Itaque explicabo unde a.', '1563573005', 1, 0),
(2636, 161, 35, 'Alias.', '1563573005', 1, 1),
(2638, 56, 49, 'Saepe suscipit esse laudantium.', '1563573005', 1, 1),
(2639, 29, 43, 'Reprehenderit aspernatur corporis modi.', '1563573005', 0, 1),
(2640, 151, 153, 'Autem sunt nulla accusamus.', '1563573005', 1, 0),
(2641, 160, 91, 'Reiciendis delectus assumenda.', '1563573005', 1, 0),
(2642, 136, 164, 'Accusamus.', '1563573005', 0, 0),
(2644, 100, 81, 'Dolorem nesciunt quisquam.', '1563573005', 1, 0),
(2645, 53, 148, 'Corporis placeat.', '1563573005', 1, 0),
(2646, 132, 138, 'Incidunt qui eligendi quo vero harum.', '1563573005', 0, 0),
(2647, 63, 163, 'Neque officiis enim harum.', '1563573005', 0, 0),
(2648, 41, 95, 'Sequi ut aut.', '1563573005', 0, 0),
(2649, 100, 12, 'Omnis et beatae adipisci ea.', '1563573005', 0, 0),
(2650, 17, 136, 'Facere voluptate ea.', '1563573005', 1, 0),
(2651, 103, 10, 'Numquam iste.', '1563573005', 1, 0),
(2652, 28, 135, 'Fugiat perferendis dolorem consequatur deserunt.', '1563573005', 0, 0),
(2654, 26, 61, 'Mollitia ut sunt.', '1563573005', 1, 1),
(2656, 153, 47, 'Velit magni dolores atque.', '1563573005', 0, 1),
(2657, 33, 155, 'Esse ad saepe atque et sunt.', '1563573005', 0, 1),
(2659, 88, 15, 'Quis voluptatem qui.', '1563573005', 1, 0),
(2661, 1, 129, 'Vel doloribus omnis non non.', '1563573005', 1, 0),
(2662, 140, 164, 'Nobis veniam.', '1563573005', 1, 0),
(2663, 98, 43, 'Et reprehenderit sint.', '1563573005', 1, 0),
(2666, 126, 127, 'Odit eum.', '1563573005', 1, 1),
(2667, 99, 16, 'Aliquam dolorum quaerat.', '1563573005', 0, 0),
(2669, 159, 169, 'Laborum ex autem.', '1563573005', 1, 0),
(2670, 9, 56, 'Omnis fugiat.', '1563573005', 0, 0),
(2671, 84, 173, 'Expedita non.', '1563573005', 0, 0),
(2672, 91, 16, 'Sapiente repellat veritatis non.', '1563573005', 1, 0),
(2673, 148, 17, 'Voluptatum nihil.', '1563573005', 1, 1),
(2674, 62, 148, 'Quos quasi reprehenderit quia rerum.', '1563573005', 1, 1),
(2675, 151, 58, 'In facilis porro voluptates.', '1563573005', 1, 0),
(2676, 131, 81, 'Minus labore et architecto.', '1563573005', 0, 0),
(2677, 80, 14, 'Molestiae qui nesciunt.', '1563573006', 1, 0),
(2679, 44, 141, 'Officiis.', '1563573006', 0, 1),
(2680, 102, 103, 'Voluptas reiciendis architecto.', '1563573006', 1, 0),
(2681, 23, 83, 'Necessitatibus possimus cupiditate dolor.', '1563573006', 1, 1),
(2684, 140, 38, 'Recusandae itaque rerum.', '1563573006', 0, 0),
(2685, 158, 148, 'Minus.', '1563573006', 0, 0),
(2686, 155, 139, 'Possimus fuga quas quo.', '1563573006', 0, 0),
(2689, 27, 50, 'Facere voluptas velit similique.', '1563573006', 1, 0),
(2690, 175, 162, 'Quasi.', '1563573006', 0, 0),
(2692, 164, 141, 'Odio dolore porro.', '1563573006', 1, 0),
(2693, 64, 167, 'Harum consequatur.', '1563573006', 0, 0),
(2694, 47, 99, 'Ut voluptatem reprehenderit.', '1563573006', 0, 1),
(2695, 85, 65, 'Aut.', '1563573006', 1, 0),
(2696, 138, 27, 'Deserunt harum sed.', '1563573006', 1, 0),
(2697, 25, 142, 'Maxime et.', '1563573006', 1, 0),
(2698, 14, 104, 'Sit sit.', '1563573006', 1, 0),
(2700, 9, 61, 'Ut culpa quo libero.', '1563573006', 0, 1),
(2703, 30, 92, 'Minus provident.', '1563573006', 1, 0),
(2705, 2, 142, 'Est.', '1563573006', 1, 0),
(2706, 86, 139, 'Aut.', '1563573006', 0, 1),
(2707, 99, 58, 'Qui est odit.', '1563573006', 0, 0),
(2709, 71, 170, 'Dolorem ratione.', '1563573006', 1, 0),
(2710, 63, 92, 'Sed aperiam eos aut.', '1563573006', 1, 1),
(2711, 74, 82, 'Non in fuga.', '1563573006', 0, 1),
(2712, 159, 54, 'Delectus numquam.', '1563573006', 0, 0),
(2714, 148, 64, 'Dignissimos fugit.', '1563573006', 0, 0),
(2715, 131, 77, 'Voluptate.', '1563573006', 0, 0),
(2720, 43, 40, 'Ex veniam.', '1563573006', 0, 1),
(2722, 13, 13, 'Magni.', '1563573006', 1, 1),
(2723, 127, 103, 'Inventore rerum non repudiandae delectus.', '1563573006', 0, 1),
(2724, 168, 164, 'Est ad omnis.', '1563573006', 1, 1),
(2725, 69, 72, 'Veniam ut.', '1563573006', 0, 0),
(2726, 29, 142, 'Et deserunt.', '1563573006', 0, 0),
(2727, 32, 68, 'Fugiat occaecati nam.', '1563573006', 0, 0),
(2728, 59, 23, 'Alias minima excepturi sit expedita quasi.', '1563573006', 0, 0),
(2729, 9, 85, 'Commodi ab consequatur quo.', '1563573006', 1, 0),
(2730, 66, 52, 'A ex debitis nobis.', '1563573006', 1, 1),
(2731, 145, 169, 'Qui modi.', '1563573006', 0, 1),
(2732, 84, 97, 'Ducimus architecto.', '1563573006', 0, 0),
(2733, 150, 50, 'Atque earum neque aut.', '1563573006', 1, 1),
(2734, 59, 4, 'Porro quam similique quo alias qui.', '1563573006', 1, 0),
(2735, 38, 40, 'Delectus tenetur.', '1563573006', 0, 1),
(2736, 162, 63, 'Voluptatem.', '1563573006', 1, 1),
(2737, 15, 99, 'Quibusdam reiciendis impedit.', '1563573006', 0, 1),
(2741, 7, 88, 'At facilis cum sequi ea.', '1563573006', 1, 0),
(2743, 100, 168, 'Explicabo quidem eligendi vel alias.', '1563573006', 1, 1),
(2744, 149, 73, 'Sed aliquam consequuntur voluptatem voluptatem neque.', '1563573006', 1, 1),
(2746, 11, 7, 'Voluptatibus libero illum.', '1563573006', 0, 0),
(2747, 78, 86, 'Quisquam autem illo.', '1563573006', 1, 1),
(2748, 164, 91, 'Possimus nulla est alias.', '1563573007', 0, 0),
(2750, 158, 67, 'Esse nihil illum fugiat.', '1563573007', 0, 0),
(2751, 163, 28, 'Sed in voluptas.', '1563573007', 0, 0),
(2752, 48, 17, 'Ipsa.', '1563573007', 0, 0),
(2753, 39, 61, 'Nisi assumenda aut sint ab.', '1563573007', 0, 1),
(2754, 60, 149, 'Assumenda cumque reiciendis.', '1563573007', 0, 0),
(2755, 66, 147, 'Numquam sunt sit voluptas.', '1563573007', 1, 0),
(2756, 156, 99, 'Quo voluptas.', '1563573007', 0, 1),
(2757, 16, 47, 'Illum voluptatem.', '1563573007', 1, 0),
(2758, 72, 70, 'Ex qui qui iste.', '1563573007', 1, 1),
(2759, 162, 82, 'Corporis.', '1563573007', 1, 1),
(2760, 10, 174, 'Dolores voluptas.', '1563573007', 0, 1),
(2761, 51, 101, 'Inventore.', '1563573007', 0, 1),
(2763, 57, 45, 'Blanditiis id qui enim.', '1563573007', 0, 0),
(2764, 65, 30, 'Optio rem.', '1563573007', 0, 0),
(2765, 71, 99, 'Cumque velit molestiae accusamus.', '1563573007', 0, 1),
(2766, 154, 167, 'Ea laborum officiis.', '1563573007', 0, 1),
(2769, 155, 68, 'Earum nostrum.', '1563573007', 1, 0),
(2770, 130, 31, 'Molestiae iure tempore.', '1563573007', 1, 1),
(2771, 165, 47, 'Saepe iure esse neque dolorem.', '1563573007', 0, 0),
(2773, 63, 54, 'Perferendis repellat praesentium.', '1563573007', 0, 1),
(2774, 22, 171, 'Nemo impedit.', '1563573007', 1, 0),
(2775, 50, 17, 'Voluptatibus ut sint rerum.', '1563573007', 1, 1),
(2776, 152, 18, 'Quis at modi rem.', '1563573007', 1, 1),
(2778, 30, 22, 'Placeat voluptates culpa repellat.', '1563573007', 1, 1),
(2779, 150, 80, 'Impedit quia esse aut.', '1563573007', 1, 1),
(2780, 69, 12, 'A iure.', '1563573007', 0, 1),
(2781, 2, 4, 'Quia quia.', '1563573007', 1, 0),
(2782, 12, 12, 'Quia facere incidunt doloribus sapiente voluptas.', '1563573007', 1, 0),
(2783, 154, 14, 'Dolores.', '1563573007', 1, 1),
(2784, 158, 141, 'Voluptatem neque.', '1563573007', 0, 1),
(2785, 171, 149, 'In non veniam.', '1563573007', 0, 0),
(2786, 174, 75, 'Ullam asperiores.', '1563573007', 1, 1),
(2787, 28, 52, 'Commodi quis voluptas vel.', '1563573007', 1, 1),
(2788, 64, 136, 'Quaerat porro velit architecto molestiae qui.', '1563573007', 1, 0),
(2789, 22, 158, 'Eum qui corrupti.', '1563573007', 0, 0),
(2790, 74, 158, 'Inventore voluptatem.', '1563573007', 0, 0),
(2791, 77, 80, 'Ratione.', '1563573007', 0, 0),
(2792, 52, 49, 'Odio quo sit culpa rerum.', '1563573007', 1, 1),
(2796, 145, 173, 'Perspiciatis.', '1563573007', 1, 0),
(2797, 53, 10, 'Voluptas fuga modi iusto.', '1563573007', 1, 0),
(2799, 57, 134, 'Dignissimos vel.', '1563573007', 0, 1),
(2800, 23, 31, 'Eum sapiente quis illum ea.', '1563573007', 1, 0),
(2802, 16, 161, 'Id odio.', '1563573007', 1, 1),
(2803, 60, 132, 'Voluptas dolores dicta.', '1563573007', 1, 1),
(2804, 33, 55, 'Accusantium a quisquam.', '1563573007', 0, 0),
(2805, 72, 39, 'Perspiciatis veritatis adipisci.', '1563573007', 0, 1),
(2808, 26, 175, 'Quaerat deleniti sunt vel cupiditate.', '1563573007', 0, 0),
(2809, 41, 26, 'Vel quos dolores.', '1563573007', 0, 1),
(2810, 173, 69, 'Non est.', '1563573007', 1, 1),
(2811, 168, 130, 'Omnis saepe est blanditiis.', '1563573007', 0, 0),
(2812, 87, 128, 'Aut vitae tempora quo.', '1563573007', 1, 0),
(2813, 147, 51, 'Ex eos aut provident ut.', '1563573007', 1, 1),
(2814, 145, 42, 'Dolorem praesentium.', '1563573007', 1, 1),
(2815, 165, 43, 'Iste vel.', '1563573007', 1, 1),
(2816, 72, 36, 'Vel.', '1563573007', 1, 0),
(2817, 143, 168, 'Esse sit eum facilis.', '1563573007', 0, 0),
(2818, 82, 137, 'Natus voluptatem corporis distinctio.', '1563573007', 0, 1),
(2819, 150, 145, 'Tempore.', '1563573007', 0, 0),
(2820, 12, 135, 'Quo repudiandae provident.', '1563573007', 1, 0),
(2821, 90, 92, 'Vel vel provident neque.', '1563573007', 1, 0),
(2822, 15, 171, 'Architecto quis.', '1563573007', 0, 0),
(2823, 169, 60, 'Aliquid qui porro.', '1563573007', 1, 0),
(2824, 27, 58, 'Suscipit officiis omnis.', '1563573007', 0, 1),
(2825, 34, 56, 'Cupiditate voluptatem.', '1563573007', 0, 1),
(2827, 36, 128, 'Iure at.', '1563573007', 0, 0),
(2829, 153, 161, 'Perferendis quam aut.', '1563573007', 1, 1),
(2830, 59, 127, 'Vitae et qui.', '1563573007', 0, 1),
(2831, 20, 69, 'Quia.', '1563573007', 1, 0),
(2832, 86, 91, 'Eum.', '1563573007', 0, 1),
(2833, 27, 95, 'Libero aut ducimus id.', '1563573007', 0, 1),
(2834, 50, 41, 'Qui fuga dolores.', '1563573008', 1, 1),
(2835, 139, 128, 'A fuga omnis sint.', '1563573008', 1, 1),
(2836, 62, 98, 'Saepe necessitatibus.', '1563573008', 0, 0),
(2837, 38, 45, 'Odio dolor mollitia eum.', '1563573008', 1, 0),
(2838, 104, 23, 'Ut eum dolorem consequatur aliquid.', '1563573008', 1, 0),
(2839, 103, 26, 'Iusto unde enim.', '1563573008', 1, 0),
(2840, 84, 174, 'Consequatur.', '1563573008', 0, 0),
(2845, 136, 4, 'Iusto.', '1563573008', 0, 0),
(2846, 85, 97, 'Sed necessitatibus ut.', '1563573008', 1, 1),
(2847, 84, 3, 'Quae perspiciatis.', '1563573008', 0, 0),
(2848, 139, 46, 'Recusandae sed aut.', '1563573008', 0, 0),
(2849, 126, 89, 'Quod nostrum.', '1563573008', 0, 0),
(2850, 51, 41, 'Nulla suscipit sit magni.', '1563573008', 1, 1),
(2853, 157, 128, 'Veritatis ipsam veritatis et.', '1563573008', 1, 0),
(2854, 134, 164, 'Saepe voluptatem ut.', '1563573008', 1, 1),
(2855, 137, 4, 'Vel quia.', '1563573008', 0, 0),
(2856, 135, 22, 'Non porro dolorum.', '1563573008', 0, 1),
(2857, 68, 46, 'Incidunt iusto libero aspernatur.', '1563573008', 1, 1),
(2858, 45, 75, 'Sed reprehenderit quam cupiditate reprehenderit.', '1563573008', 0, 1),
(2861, 132, 13, 'Ab odit dolores.', '1563573008', 0, 1),
(2863, 52, 61, 'Ipsum.', '1563573008', 0, 0),
(2865, 142, 48, 'Illum.', '1563573008', 0, 1),
(2866, 164, 97, 'Doloribus velit hic.', '1563573008', 1, 0),
(2869, 68, 54, 'Facere.', '1563573008', 0, 1),
(2871, 39, 10, 'Aliquam aut sed.', '1563573008', 1, 0),
(2872, 150, 47, 'Iusto aut.', '1563573008', 0, 0),
(2873, 146, 48, 'Ut rem.', '1563573008', 1, 1),
(2874, 36, 134, 'Voluptas hic amet minus ut libero.', '1563573008', 1, 0),
(2875, 148, 18, 'Ipsam iste aspernatur.', '1563573008', 0, 0),
(2876, 80, 98, 'Est in incidunt.', '1563573008', 1, 1),
(2877, 15, 38, 'Sit qui animi debitis.', '1563573008', 1, 1),
(2878, 158, 157, 'Ut id eos.', '1563573008', 0, 0),
(2879, 132, 176, 'Tempore molestias.', '1563573008', 1, 1),
(2880, 159, 46, 'Non.', '1563573008', 1, 1),
(2881, 77, 24, 'Nihil non similique.', '1563573008', 0, 1),
(2882, 32, 68, 'Occaecati id consequuntur voluptatem.', '1563573008', 0, 0),
(2883, 12, 15, 'Vero fugit voluptas omnis.', '1563573008', 0, 0),
(2885, 16, 75, 'Sit ut.', '1563573008', 1, 1),
(2886, 14, 88, 'Nisi nemo nihil.', '1563573008', 0, 1),
(2887, 22, 8, 'Earum quibusdam.', '1563573008', 1, 0),
(2888, 61, 34, 'Enim quia eum quod.', '1563573008', 1, 1),
(2889, 28, 82, 'Nobis.', '1563573008', 0, 1),
(2890, 78, 32, 'Quia omnis porro beatae repudiandae.', '1563573008', 1, 1),
(2891, 153, 30, 'Est quo id.', '1563573008', 1, 0),
(2892, 56, 102, 'A velit ut id omnis aut.', '1563573008', 1, 0),
(2893, 3, 99, 'Fugiat neque veniam sed corrupti inventore.', '1563573008', 0, 1),
(2894, 78, 88, 'Incidunt pariatur sed.', '1563573008', 0, 1),
(2895, 78, 64, 'Sapiente dolorem accusantium.', '1563573008', 1, 1),
(2898, 143, 169, 'Eveniet ea repellendus.', '1563573008', 0, 0),
(2899, 96, 29, 'Omnis quisquam.', '1563573008', 0, 0),
(2900, 137, 94, 'Eos commodi.', '1563573008', 0, 0),
(2901, 69, 141, 'Suscipit architecto minima autem.', '1563573008', 1, 1),
(2904, 7, 45, 'Exercitationem ad.', '1563573008', 1, 0),
(2905, 145, 4, 'Voluptas velit.', '1563573008', 0, 0),
(2906, 45, 19, 'Ducimus eligendi.', '1563573008', 0, 0),
(2907, 83, 39, 'Quos.', '1563573008', 1, 1),
(2908, 39, 92, 'Velit id illum dolorum et.', '1563573008', 0, 0),
(2909, 71, 133, 'Placeat.', '1563573008', 0, 0),
(2910, 10, 94, 'Repellendus odit.', '1563573008', 1, 0),
(2911, 25, 164, 'Labore quia.', '1563573008', 0, 1),
(2912, 90, 45, 'Modi eius.', '1563573008', 0, 1),
(2914, 160, 158, 'Eos.', '1563573008', 0, 0),
(2915, 171, 158, 'Id qui suscipit.', '1563573009', 1, 0),
(2916, 56, 51, 'Qui aliquid autem.', '1563573009', 0, 0),
(2917, 135, 50, 'Consequatur atque natus voluptates.', '1563573009', 1, 1),
(2918, 17, 18, 'Facilis fugit sed facere saepe.', '1563573009', 0, 0),
(2920, 5, 95, 'Sit voluptas.', '1563573009', 1, 0),
(2921, 139, 48, 'Numquam.', '1563573009', 1, 0),
(2922, 104, 146, 'Soluta quis.', '1563573009', 1, 1),
(2925, 157, 41, 'Ea laboriosam.', '1563573009', 0, 0),
(2926, 15, 68, 'Sit dolorem.', '1563573009', 1, 0),
(2927, 12, 43, 'Officiis placeat facilis soluta.', '1563573009', 0, 0),
(2929, 103, 44, 'Tenetur consequatur blanditiis unde.', '1563573009', 0, 1),
(2930, 159, 23, 'Id culpa quis quia.', '1563573009', 0, 0),
(2932, 8, 36, 'Labore officiis sed.', '1563573009', 0, 1),
(2933, 160, 138, 'Ex ratione.', '1563573009', 0, 1),
(2934, 99, 28, 'In aut eligendi.', '1563573009', 1, 0),
(2935, 20, 73, 'Nihil.', '1563573009', 0, 1),
(2936, 80, 169, 'Vel neque inventore dolores repudiandae.', '1563573009', 1, 0),
(2937, 36, 19, 'Ea assumenda deserunt.', '1563573009', 1, 1),
(2938, 39, 11, 'Saepe rerum sunt omnis quia.', '1563573009', 0, 1),
(2939, 28, 152, 'Ea totam.', '1563573009', 0, 1),
(2941, 156, 60, 'Aut.', '1563573009', 1, 0),
(2942, 92, 104, 'Velit debitis harum.', '1563573009', 0, 1),
(2943, 27, 30, 'Temporibus autem autem.', '1563573009', 0, 1),
(2945, 54, 143, 'Inventore ad.', '1563573009', 0, 0),
(2948, 3, 159, 'Repellat laborum.', '1563573009', 1, 1),
(2952, 173, 145, 'Occaecati saepe ex illum.', '1563573009', 1, 0),
(2954, 144, 40, 'Enim quam iusto.', '1563573009', 1, 1),
(2955, 59, 99, 'Nihil aliquid quia.', '1563573009', 0, 1),
(2956, 138, 66, 'Velit autem id at sed.', '1563573009', 0, 0),
(2958, 168, 100, 'Maxime error.', '1563573009', 0, 1),
(2959, 38, 1, 'Dolorem ullam voluptate.', '1563573009', 1, 0),
(2961, 144, 8, 'Recusandae deserunt.', '1563573009', 0, 0),
(2962, 52, 154, 'Ipsam id quod.', '1563573009', 0, 1),
(2964, 47, 161, 'Rerum fugiat fugiat illum ullam.', '1563573009', 1, 1),
(2965, 42, 84, 'Nihil accusantium est cupiditate.', '1563573009', 1, 0),
(2966, 60, 175, 'Quibusdam exercitationem.', '1563573009', 0, 0),
(2968, 134, 144, 'Assumenda.', '1563573009', 1, 1),
(2969, 76, 4, 'Ut occaecati quia.', '1563573009', 1, 0),
(2970, 69, 70, 'Vero rem rerum.', '1563573009', 1, 1),
(2971, 75, 165, 'Aliquam.', '1563573009', 1, 1),
(2972, 128, 129, 'Quo nam incidunt totam magnam delectus.', '1563573009', 1, 0),
(2975, 60, 100, 'Quia debitis.', '1563573009', 0, 0),
(2976, 51, 69, 'Laboriosam culpa.', '1563573009', 0, 0),
(2978, 71, 146, 'Sunt repellendus.', '1563573009', 1, 1),
(2979, 30, 65, 'Occaecati blanditiis voluptate.', '1563573009', 1, 1),
(2980, 10, 174, 'Tenetur eum ab earum.', '1563573009', 1, 1),
(2982, 162, 158, 'Incidunt quis incidunt.', '1563573009', 1, 0),
(2983, 47, 14, 'Sint accusamus nam.', '1563573009', 0, 0),
(2984, 145, 38, 'Quia.', '1563573009', 1, 0),
(2985, 98, 176, 'Eum.', '1563573009', 1, 1),
(2986, 156, 175, 'Rerum.', '1563573009', 1, 0),
(2988, 38, 40, 'Voluptas culpa.', '1563573009', 0, 1),
(2989, 159, 157, 'Ipsa quas.', '1563573009', 0, 0),
(2991, 171, 36, 'Consequatur ab.', '1563573010', 0, 1),
(2992, 147, 78, 'Ratione autem.', '1563573010', 1, 0),
(2993, 35, 138, 'Quibusdam.', '1563573010', 0, 0),
(2994, 33, 127, 'Fuga asperiores.', '1563573010', 0, 0),
(2995, 6, 7, 'Rem facere id corporis.', '1563573010', 0, 1),
(2996, 1, 149, 'Dolores culpa alias quis.', '1563573010', 1, 0),
(2997, 174, 70, 'Sed ea odio.', '1563573010', 0, 0),
(2998, 8, 23, 'Odit repellendus voluptatum ab.', '1563573010', 1, 1),
(2999, 71, 163, 'Qui officia modi ex et.', '1563573010', 1, 1),
(3000, 83, 25, 'Consequuntur vel.', '1563573010', 0, 1);

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
('2019_07_18_130433_create_notifications_mob_history_table', 1),
('2099_00_00_123735_create_constraints', 1);

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

--
-- Dumping data for table `mob_notifications`
--

INSERT INTO `mob_notifications` (`id`, `notifTo`, `notifToIds`, `notifData`, `notifDate`, `notifSender`) VALUES
(1, 'Miss Aimee Pouros DDS', 'students', 'Rem aut possimus impedit.', 1563572939, 'Morgan Lang'),
(2, 'Tiara Gleichner IV', 'teachers', 'Ut sapiente aut asperiores est.', 1563572939, 'Kamren Bergnaum V'),
(3, 'Miss Margaret Bartell', 'students', 'Tempora expedita omnis laboriosam dolore dolor placeat.', 1563572939, 'Alford Howell'),
(4, 'Mrs. Kiarra Yundt Jr.', 'students', 'Voluptatem nobis omnis numquam voluptatum ut dolorem itaque.', 1563572939, 'Prof. Raymond Crooks'),
(5, 'Keaton Quitzon', 'teachers', 'Cumque qui sed mollitia velit earum.', 1563572939, 'Lucio Cole'),
(6, 'Mr. Gage Lubowitz', 'teachers', 'Molestiae autem qui et minima unde ipsum cumque quisquam qui asperiores.', 1563572939, 'Tatum Herman Jr.'),
(7, 'Giuseppe Kautzer', 'teachers', 'Ipsum nam in quasi quam molestias quae minus.', 1563572939, 'Bailee Langworth'),
(8, 'Ernie Koepp', 'employees', 'Non qui et quo voluptatem.', 1563572940, 'Kane Fisher'),
(9, 'Everardo Kunze Sr.', 'teachers', 'Dicta eligendi illum tenetur.', 1563572940, 'Sonia Harris'),
(10, 'Dr. Elmore Crist DVM', 'parents', 'Reiciendis quae repudiandae placeat quod voluptatem aut.', 1563572940, 'Warren Mohr'),
(11, 'Price Dach', 'students', 'Consequatur nam enim qui consectetur sed autem sit.', 1563572940, 'Ocie Smitham'),
(12, 'Aurore Kertzmann', 'teachers', 'Non sequi recusandae id iste et vel est aliquam.', 1563572940, 'Helga Will'),
(13, 'Prof. Arlie Schoen Sr.', 'employees', 'Sint enim sit consequatur mollitia esse deleniti rerum omnis quo.', 1563572940, 'Teagan Harvey PhD'),
(14, 'Geraldine Lebsack', 'parents', 'Provident aut tenetur rerum nisi.', 1563572940, 'Prof. Juvenal Kovacek V'),
(15, 'Juvenal Runte DVM', 'employees', 'Voluptas nesciunt consectetur quibusdam est occaecati.', 1563572940, 'Keely Buckridge'),
(16, 'Carissa Haley III', 'employees', 'Corrupti sit perspiciatis illum qui maxime expedita.', 1563572940, 'Olin Corwin MD'),
(17, 'Thelma Schowalter IV', 'students', 'Quo veniam dolore nam odit blanditiis ut consequuntur officiis amet.', 1563572940, 'Robyn Hettinger V'),
(18, 'Nellie Veum', 'parents', 'Repellat cum sequi itaque quis ratione ipsam odit.', 1563572940, 'Braden Trantow Jr.'),
(19, 'Prof. Leonard Fahey PhD', 'parents', 'Enim at mollitia totam eligendi.', 1563572940, 'Tressa Block'),
(20, 'Prof. Mona Emard V', 'teachers', 'Eius perspiciatis iure cum eos velit cumque.', 1563572940, 'Providenci Dietrich'),
(21, 'Mckenna Champlin', 'parents', 'Nihil saepe eaque quisquam voluptas illo consequatur.', 1563572940, 'Retha Fisher'),
(22, 'Abbie Senger II', 'employees', 'Vel eveniet sit similique dolore sed perspiciatis et et sed modi.', 1563572940, 'Herminia Rogahn'),
(23, 'Mrs. Melissa Koch', 'students', 'Eos rem sed ut nihil.', 1563572940, 'Brooke Ortiz'),
(24, 'Jamel Hane V', 'employees', 'Et sed et sit corrupti.', 1563572940, 'Mr. Dillon Altenwerth MD'),
(25, 'Jacinthe Hermiston', 'parents', 'Optio esse amet qui necessitatibus.', 1563572940, 'Tess Feil'),
(26, 'Carlo Murphy', 'teachers', 'Quia atque reprehenderit quas corrupti voluptatem pariatur.', 1563572940, 'Terrence McKenzie Sr.'),
(27, 'Devin Padberg', 'employees', 'Id eos mollitia rerum dolores deleniti perferendis.', 1563572940, 'Vivien Emard IV'),
(28, 'Marcelle Koelpin MD', 'teachers', 'Ducimus quas quia enim est sed.', 1563572940, 'Mr. Consuelo Okuneva DDS'),
(29, 'Kaylin Schneider', 'teachers', 'Ullam est id ut iusto quam exercitationem soluta dolorem quibusdam.', 1563572940, 'Annette Windler'),
(30, 'Oswald Mohr', 'teachers', 'Deleniti quod qui mollitia sit quibusdam sunt quia et accusantium incidunt.', 1563572940, 'Lucio Waelchi'),
(31, 'Mr. Cleo Block', 'students', 'Deserunt unde non quos placeat.', 1563572940, 'Melvina Waters IV'),
(32, 'Dr. Vivien Keeling I', 'students', 'Vel et facilis.', 1563572940, 'Jadyn Hoeger'),
(33, 'Ola Steuber', 'teachers', 'Vero quia reprehenderit officiis aut atque.', 1563572940, 'Clint Littel'),
(34, 'Filomena Moore I', 'parents', 'Voluptatem magnam velit eius at dolorum autem.', 1563572940, 'Oswaldo Weissnat IV'),
(35, 'Dion Greenfelder', 'parents', 'Soluta cum modi dolorem aut officia.', 1563572940, 'Samantha Davis II'),
(36, 'Lorine McLaughlin', 'teachers', 'Quidem et et eligendi voluptatibus.', 1563572940, 'Stanley Schinner'),
(37, 'Kamryn Schultz', 'parents', 'A quia voluptatem et praesentium quam impedit explicabo.', 1563572940, 'Pamela Corkery'),
(38, 'Prof. Reginald Beahan MD', 'students', 'Quidem qui eveniet beatae tempora.', 1563572940, 'Dahlia Batz'),
(39, 'Miguel Christiansen II', 'students', 'Reiciendis laborum aut qui.', 1563572940, 'Gilda Yost'),
(40, 'Kennith Hyatt', 'teachers', 'Aliquam reiciendis sint iste voluptatem fugiat.', 1563572940, 'Lizzie Schumm'),
(41, 'Novella Conroy', 'parents', 'Laboriosam qui occaecati est tenetur.', 1563572940, 'Dorian Fahey'),
(42, 'Elissa Sporer', 'parents', 'Officia explicabo odit qui exercitationem quaerat.', 1563572940, 'Mr. Casey Lynch V'),
(43, 'Ethyl Corwin', 'employees', 'Magni est sed dolores quia voluptatem necessitatibus mollitia beatae earum.', 1563572940, 'Miss Charity Hyatt Jr.'),
(44, 'Abby Bechtelar', 'students', 'Vel aspernatur aut.', 1563572940, 'Miss Gwen Lueilwitz'),
(45, 'Naomie Stokes', 'employees', 'Voluptas commodi vero doloribus nostrum.', 1563572940, 'Dagmar Schimmel'),
(46, 'Carey Ratke', 'teachers', 'Inventore reiciendis doloribus dolores ut deleniti veniam dolorem quis impedit.', 1563572940, 'Seth Fisher'),
(47, 'Travis VonRueden', 'employees', 'Expedita nulla dolores ut.', 1563572940, 'Prof. Dexter Gerlach'),
(48, 'Tressa Hane', 'teachers', 'Esse ad facilis laboriosam in recusandae voluptatem.', 1563572940, 'Erwin Stokes'),
(49, 'Reese Johns', 'teachers', 'Quod enim saepe voluptate quasi quia.', 1563572940, 'Mariana Deckow'),
(50, 'Maddison Ferry', 'employees', 'Quos fugit explicabo quibusdam quaerat.', 1563572940, 'Bianka Roberts Jr.'),
(51, 'users', '[{\"student\":\"Ahmed Sayed\",\"role\":\"admin\",\"id\":\"1\"}]', 'a', 1563647437, 'Ahmed Sayed [ 1 ] '),
(52, 'users', '[{\"id\":15,\"fullName\":\"Dr. Wilbert Feest DDS\",\"department\":2,\"role\":\"employee\"}]', 'a', 1563647797, 'Ahmed Sayed [ 1 ] '),
(53, 'users', '[{\"id\":193,\"fullName\":\"Charlie Bergstrom PhD\",\"studentClass\":2},{\"id\":197,\"fullName\":\"Ron Roob III\",\"studentClass\":2},{\"id\":179,\"fullName\":\"Kayla Boyer\",\"studentClass\":2}]', 'test', 1563647915, 'Ahmed Sayed [ 1 ] '),
(54, 'all', '', 'hi', 1563648256, 'Ahmed Sayed [ 1 ] ');

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

--
-- Dumping data for table `newsboard`
--

INSERT INTO `newsboard` (`id`, `newsTitle`, `newsText`, `newsFor`, `newsDate`, `newsImage`, `fe_active`, `creationDate`) VALUES
(1, 'Pariatur dolores quia.', 'Ut accusantium veritatis blanditiis maiores quia non a voluptatem.', 'students', 1563572937, '', 0, 1563572937),
(2, 'Praesentium quia.', 'Voluptates architecto rerum qui qui veritatis consectetur autem.', 'parents', 1563572937, '', 1, 1563572937),
(3, 'Alias nemo rem totam.', 'Aliquam magni est eius ducimus nulla ipsa enim et temporibus alias.', 'teacher', 1563572937, '', 0, 1563572937),
(4, 'Fuga atque sit qui.', 'Voluptatem voluptatem voluptas omnis sapiente blanditiis.', 'students', 1563572937, '', 1, 1563572937),
(5, 'Quia illo.', 'Officia et sint possimus nostrum laborum laudantium ut est ipsum est.', 'all', 1563572937, '', 0, 1563572937),
(6, 'Dolor sit.', 'Voluptas quia id maiores reiciendis perferendis ipsa.', 'teacher', 1563572937, '', 1, 1563572937),
(7, 'Dolorum dolore quo.', 'Sed nihil rerum ea iure natus molestiae.', 'teacher', 1563572937, '', 0, 1563572937),
(8, 'Est odit nesciunt.', 'Qui et accusantium corporis quod est sunt.', 'students', 1563572937, '', 0, 1563572937),
(9, 'Quia veritatis.', 'At necessitatibus autem quia nemo enim nulla nemo quam necessitatibus.', 'teacher', 1563572937, '', 1, 1563572937),
(10, 'Perferendis quos facere.', 'Ut dolorem est sunt culpa quibusdam voluptate quos.', 'parents', 1563572937, '', 1, 1563572937),
(11, 'Et debitis magni modi.', 'Id quasi architecto dolor sit perspiciatis aperiam quam a.', 'teacher', 1563572937, '', 1, 1563572937),
(12, 'Necessitatibus soluta alias ex.', 'Facilis nisi dolor unde repudiandae atque voluptas.', 'parents', 1563572937, '', 1, 1563572937),
(13, 'In excepturi et distinctio alias atque.', 'Fugit distinctio quia saepe quas error quis odit cum vel odit.', 'teacher', 1563572937, '', 1, 1563572937),
(14, 'Nihil impedit impedit et.', 'Officiis repellendus iusto et perferendis quos hic soluta.', 'parents', 1563572937, '', 0, 1563572937),
(15, 'Delectus et quaerat debitis cum.', 'Nemo aut rerum et aut vitae est non totam deleniti sapiente omnis non.', 'parents', 1563572937, '', 0, 1563572937),
(16, 'Iusto magnam nemo.', 'Rerum aperiam rerum totam dolor aperiam vitae quisquam ipsa hic.', 'parents', 1563572937, '', 1, 1563572937),
(17, 'Similique quo vitae ratione.', 'Aut et voluptatem odit perspiciatis dolor itaque quia quis sunt.', 'students', 1563572937, '', 0, 1563572937),
(18, 'Molestiae quia totam possimus dolore.', 'Aut quia quisquam officiis deserunt est molestias nulla.', 'teacher', 1563572937, '', 0, 1563572937),
(19, 'Esse ipsam ab perferendis molestias ullam.', 'Doloribus corporis reiciendis inventore molestiae doloribus.', 'all', 1563572937, '', 0, 1563572937),
(20, 'Et quibusdam eligendi.', 'Excepturi fugit aut reprehenderit minus dolores ratione.', 'students', 1563572937, '', 1, 1563572937);

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

--
-- Dumping data for table `notifications_mob_history`
--

INSERT INTO `notifications_mob_history` (`id`, `name`, `value`, `user_id`, `date`, `type`, `payload_id`, `created_at`, `updated_at`) VALUES
(2, 'message', 'Maiores aspernatur magnam.', 98, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(3, 'attendance', 'Quis quibusdam.', 164, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(4, 'attendance', 'Libero nostrum rem.', 23, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(5, 'news', 'Qui velit omnis.', 174, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(6, 'attendance', 'Velit adipisci sunt.', 62, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(7, 'message', 'Ipsam saepe ducimus.', 29, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(8, 'message', 'Doloribus nemo.', 166, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(9, 'message', 'Saepe suscipit sunt.', 7, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(10, 'message', 'Inventore at possimus quibusdam.', 36, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(11, 'message', 'Vero amet velit.', 165, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(12, 'message', 'Distinctio earum consequatur magni blanditiis.', 37, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(13, 'message', 'Eum quo.', 149, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(14, 'attendance', 'Nihil minus dolores autem.', 101, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(15, 'message', 'Voluptas repellendus sed.', 135, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(17, 'attendance', 'Aut corporis.', 6, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(18, 'news', 'Cumque nam inventore.', 23, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(19, 'news', 'Aut dicta dolor.', 160, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(20, 'message', 'Veniam error qui dolore.', 59, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(21, 'attendance', 'Soluta distinctio.', 96, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(22, 'message', 'Et sapiente quia incidunt.', 14, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(23, 'attendance', 'Asperiores soluta.', 46, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(24, 'message', 'Voluptas magnam similique eos.', 18, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(25, 'message', 'Voluptatibus alias.', 42, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(26, 'attendance', 'Illum sint rerum vero.', 79, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(27, 'news', 'Quo delectus.', 17, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(28, 'attendance', 'Alias dolorum.', 54, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(29, 'message', 'Laborum delectus.', 25, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(30, 'message', 'Autem quos minus.', 143, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(31, 'message', 'Est voluptatum alias.', 46, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(32, 'message', 'Vitae eveniet.', 17, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(33, 'attendance', 'Perspiciatis optio minus.', 145, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(34, 'news', 'Iure ipsum architecto.', 55, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(35, 'news', 'Aliquam autem doloribus eaque.', 64, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(36, 'message', 'Voluptas voluptate.', 20, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(37, 'attendance', 'Eveniet maxime facilis consectetur.', 28, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(38, 'attendance', 'Ad quod libero quisquam.', 69, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:39', '2019-07-19 19:52:39'),
(41, 'news', 'Est magnam ut.', 153, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(42, 'news', 'Aut est.', 39, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(43, 'news', 'Autem ipsum dolores aliquam.', 149, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(44, 'message', 'Earum nam nihil.', 44, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(46, 'attendance', 'Et saepe reiciendis molestiae.', 101, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(47, 'news', 'Est et voluptas.', 96, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(48, 'news', 'Molestiae unde.', 104, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(49, 'news', 'Aliquam magnam voluptatem aperiam.', 101, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(50, 'attendance', 'Animi assumenda.', 76, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(51, 'news', 'Eum dolores repudiandae illum.', 65, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(52, 'message', 'Voluptas magni.', 90, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(53, 'message', 'Voluptas aut dolores incidunt.', 141, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(54, 'news', 'Dolor debitis unde quisquam.', 20, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(55, 'attendance', 'Rerum et.', 33, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(56, 'news', 'Aut aut.', 166, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(57, 'news', 'Molestiae doloremque non.', 66, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(58, 'attendance', 'Et quia in.', 15, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(59, 'message', 'Amet earum.', 64, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(62, 'news', 'Voluptas ipsa perferendis.', 96, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(63, 'news', 'Veritatis aut est.', 89, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(64, 'news', 'Ut iusto et ea molestiae.', 50, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(66, 'news', 'Pariatur molestiae non.', 127, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(67, 'attendance', 'Animi molestiae illo.', 146, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(68, 'news', 'Eveniet mollitia veniam corporis.', 34, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(69, 'news', 'Nam quia similique.', 72, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(70, 'attendance', 'Ratione repellat laborum eligendi.', 91, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(71, 'news', 'Aut voluptatibus vel ratione.', 128, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(72, 'attendance', 'Repudiandae cupiditate et ut.', 57, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(73, 'attendance', 'Sequi veniam.', 49, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(74, 'attendance', 'Nisi aut sapiente.', 161, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(76, 'attendance', 'Ratione ipsum.', 127, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(77, 'news', 'Consequatur doloribus.', 132, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(78, 'attendance', 'Unde nemo velit delectus.', 56, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(79, 'attendance', 'Modi enim harum.', 161, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(80, 'message', 'Velit praesentium.', 68, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(81, 'attendance', 'Odio placeat blanditiis culpa.', 93, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:40', '2019-07-19 19:52:40'),
(82, 'attendance', 'Et qui qui.', 161, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(83, 'attendance', 'Est aspernatur cupiditate.', 133, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(84, 'attendance', 'Occaecati cumque.', 153, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(85, 'message', 'Vel necessitatibus est.', 4, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(87, 'news', 'Saepe rerum maxime fugit.', 18, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(88, 'news', 'Quas repellat.', 160, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(89, 'attendance', 'Aut quia perspiciatis.', 5, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(90, 'news', 'Eos tempore.', 152, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(91, 'news', 'Vitae adipisci accusamus rerum.', 85, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(94, 'news', 'Officiis iste blanditiis maxime voluptas.', 8, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(95, 'attendance', 'Eum minus.', 76, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(97, 'news', 'Repudiandae occaecati aut.', 57, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(99, 'message', 'Ducimus consequuntur illo incidunt tenetur.', 31, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(101, 'message', 'Qui molestiae quas.', 84, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(102, 'news', 'Quia sunt ut.', 20, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(103, 'attendance', 'Et aliquam eos sint.', 8, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(104, 'attendance', 'Aut ab.', 13, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(105, 'news', 'Accusamus ratione laborum.', 3, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(106, 'news', 'Ut dolore est nobis.', 68, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(109, 'attendance', 'Voluptate veniam dolorem.', 101, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(110, 'news', 'Fugiat placeat eos.', 6, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(111, 'attendance', 'Voluptatem quia perferendis.', 69, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(112, 'news', 'Dolor suscipit est.', 21, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(113, 'news', 'Tempore autem earum nulla.', 130, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(114, 'attendance', 'Est et placeat omnis.', 53, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(115, 'news', 'Expedita amet voluptas.', 46, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(117, 'message', 'Voluptatum quis qui voluptatem enim.', 140, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(119, 'attendance', 'Vel cum.', 126, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(120, 'attendance', 'Accusantium repudiandae est aut.', 102, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(121, 'message', 'Nihil ullam dolorum.', 130, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(122, 'message', 'Labore sit.', 131, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(124, 'message', 'Asperiores quo ex.', 99, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(125, 'news', 'Voluptates doloribus asperiores maiores.', 71, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(126, 'attendance', 'Est laboriosam consectetur.', 126, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(127, 'news', 'Aut est voluptatibus.', 129, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:41', '2019-07-19 19:52:41'),
(128, 'attendance', 'Illum iure.', 52, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(129, 'news', 'Non sed.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(130, 'message', 'Iusto animi molestiae.', 28, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(132, 'news', 'Beatae et minus.', 24, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(133, 'news', 'Accusantium eligendi qui dolorem.', 36, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(134, 'attendance', 'Doloremque provident placeat.', 69, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(135, 'attendance', 'Impedit labore.', 66, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(137, 'message', 'Sint laboriosam.', 68, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(138, 'message', 'Itaque praesentium debitis architecto.', 62, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(139, 'message', 'Qui sed.', 143, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(140, 'news', 'Exercitationem modi qui omnis.', 28, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(141, 'news', 'Culpa voluptas et.', 26, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(142, 'news', 'Ut velit esse aliquid.', 128, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(143, 'message', 'Ut eveniet.', 150, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(144, 'attendance', 'Aut aliquid dolores quaerat.', 57, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(145, 'news', 'Hic aliquid tenetur consequatur.', 15, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(146, 'attendance', 'Voluptas eum maiores maiores.', 80, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(148, 'news', 'Illo at.', 166, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(149, 'attendance', 'Cumque tenetur natus tempore.', 65, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(150, 'news', 'Id et.', 2, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(151, 'message', 'Cum quod praesentium.', 152, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(152, 'message', 'Aut quisquam dolorum dolore possimus.', 144, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(153, 'news', 'Recusandae vel nulla voluptate.', 167, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(154, 'attendance', 'Velit consequuntur itaque sed.', 18, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(155, 'message', 'Delectus hic.', 132, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(156, 'attendance', 'Cum vel quia.', 173, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(157, 'news', 'Sunt sunt possimus.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(158, 'news', 'Optio et.', 164, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(159, 'attendance', 'Eos at ullam.', 67, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(160, 'message', 'Dolor animi.', 158, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(161, 'attendance', 'Quibusdam asperiores ipsum.', 66, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(162, 'news', 'Qui officia.', 39, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(163, 'news', 'Sit cum fuga repellat.', 172, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(164, 'message', 'Omnis illo.', 140, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(165, 'attendance', 'Magni est.', 155, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(166, 'attendance', 'Autem eum.', 172, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(167, 'attendance', 'Reprehenderit aliquid quis dolorum.', 70, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(168, 'attendance', 'Facere aut.', 77, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(169, 'message', 'Incidunt architecto.', 161, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(170, 'news', 'Ratione ut.', 12, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(171, 'news', 'Accusantium consequatur.', 62, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(172, 'news', 'Voluptatem pariatur ratione.', 77, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:42', '2019-07-19 19:52:42'),
(173, 'news', 'Aspernatur quo accusamus.', 132, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(174, 'attendance', 'Corrupti qui.', 36, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(175, 'message', 'Tempora quia assumenda.', 19, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(176, 'news', 'Sed reprehenderit et aut.', 32, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(178, 'message', 'In voluptatibus alias.', 48, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(179, 'news', 'Esse aut nemo distinctio.', 12, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(180, 'attendance', 'Modi dolorem consectetur et.', 26, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(181, 'attendance', 'Cumque consequatur enim.', 30, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(183, 'attendance', 'Enim aperiam quia.', 74, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(184, 'news', 'Et accusamus iusto.', 40, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(185, 'message', 'Dolorem dignissimos aperiam.', 17, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(186, 'message', 'Molestiae id.', 146, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(187, 'news', 'Quia ut.', 15, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(188, 'attendance', 'Ut assumenda amet rerum.', 152, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(189, 'attendance', 'Sed vel eligendi.', 6, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(190, 'news', 'Rerum odio reprehenderit doloribus.', 11, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(191, 'message', 'Eius eligendi.', 80, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(192, 'message', 'Possimus officia expedita.', 92, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(194, 'message', 'Aliquam minima.', 38, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(195, 'news', 'Sed nulla inventore.', 89, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(196, 'attendance', 'At itaque et tempore illum.', 77, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(198, 'news', 'Similique qui voluptatem distinctio.', 175, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(199, 'attendance', 'Voluptas nihil omnis.', 93, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(200, 'message', 'Rerum et corrupti.', 62, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(201, 'news', 'Tenetur enim blanditiis laudantium.', 146, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(203, 'attendance', 'Quasi esse reiciendis.', 1, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(204, 'attendance', 'Omnis quisquam.', 82, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(205, 'news', 'Et molestiae quo.', 150, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(207, 'message', 'Eos dolorum.', 139, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(208, 'message', 'Vel sed et laudantium.', 53, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(209, 'attendance', 'Eum ipsum doloremque.', 100, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(210, 'news', 'Suscipit quia.', 57, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(211, 'message', 'Et voluptatem harum veniam.', 3, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(212, 'message', 'Illo laudantium.', 84, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(213, 'message', 'Harum error autem.', 83, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(214, 'message', 'Nisi eum molestias.', 75, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(215, 'message', 'Dicta et.', 59, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(216, 'message', 'Accusamus ea aut modi ea.', 85, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(217, 'message', 'Nemo temporibus fugiat.', 97, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:43', '2019-07-19 19:52:43'),
(218, 'message', 'Assumenda aperiam.', 85, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(221, 'attendance', 'Fugiat recusandae rerum deserunt modi.', 134, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(222, 'message', 'Qui qui hic tempore.', 7, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(223, 'attendance', 'Qui corporis eius ducimus.', 53, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(224, 'attendance', 'Tempora fuga.', 30, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(225, 'attendance', 'Quae quisquam.', 5, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(226, 'attendance', 'Consequuntur praesentium et voluptates.', 78, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(227, 'attendance', 'Porro ex officiis.', 134, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(228, 'news', 'Et impedit.', 82, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(229, 'attendance', 'Reiciendis culpa mollitia impedit.', 126, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(230, 'attendance', 'Error aut.', 104, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(231, 'message', 'Ducimus consequatur atque quia.', 92, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(232, 'attendance', 'Dolorem fugiat sed.', 157, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(233, 'attendance', 'Magni iusto officiis.', 80, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(234, 'attendance', 'Nihil et.', 56, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(236, 'news', 'Voluptatem rerum rerum.', 84, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(238, 'attendance', 'Voluptates reprehenderit.', 142, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(240, 'news', 'Neque et quod.', 50, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(241, 'message', 'Voluptas est.', 1, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(242, 'message', 'Corrupti quidem voluptas repellat.', 38, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(243, 'message', 'Consequatur rerum ut.', 65, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(244, 'news', 'Voluptas quas enim.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(245, 'message', 'Accusamus minima.', 47, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(246, 'news', 'Sequi provident consequatur.', 16, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(247, 'message', 'Voluptas aut.', 87, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(248, 'message', 'Repellat beatae.', 69, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(249, 'news', 'Provident delectus.', 139, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(250, 'news', 'Molestiae molestias qui debitis.', 23, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(251, 'news', 'Voluptatum accusamus rem.', 101, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(252, 'message', 'Eveniet minima et.', 133, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(253, 'news', 'Maiores id tenetur.', 78, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(255, 'message', 'Ut nesciunt voluptatibus.', 23, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(256, 'message', 'Sit similique.', 54, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(257, 'message', 'Voluptatem ut.', 42, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(258, 'message', 'Qui veniam inventore.', 140, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(259, 'message', 'Tempore sapiente id et.', 131, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(260, 'news', 'Modi dolor.', 76, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(261, 'message', 'Aut soluta.', 30, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(262, 'news', 'Quia sit placeat velit.', 46, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:44', '2019-07-19 19:52:44'),
(263, 'news', 'Omnis veritatis quod a voluptas.', 7, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(264, 'attendance', 'Alias reprehenderit.', 137, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(265, 'news', 'Consectetur veritatis.', 61, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(266, 'message', 'Nobis deleniti.', 171, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(267, 'message', 'Modi non nemo.', 83, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(268, 'news', 'Et id at aut.', 33, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(269, 'news', 'Voluptate sit impedit.', 99, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(270, 'attendance', 'Facere cupiditate corrupti.', 45, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(271, 'attendance', 'Architecto nobis laudantium.', 174, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(272, 'message', 'Velit vel.', 27, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(273, 'attendance', 'Omnis incidunt doloribus id.', 174, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(274, 'news', 'Quo quos ex.', 22, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(275, 'attendance', 'Itaque dolore ut.', 150, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(277, 'attendance', 'Officiis vero ipsum.', 167, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(278, 'news', 'Sit vero quisquam.', 21, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(279, 'news', 'Assumenda voluptatem dolorem error.', 57, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(280, 'news', 'Possimus quia minus amet.', 137, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(281, 'news', 'Et ut quae.', 67, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(282, 'news', 'Aut tenetur similique.', 137, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(283, 'news', 'Dolorum aperiam expedita.', 46, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(285, 'message', 'Excepturi veritatis quo.', 66, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(286, 'news', 'Libero molestiae iusto.', 56, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(287, 'message', 'Et vero ut.', 140, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(288, 'news', 'Maxime voluptatem ab.', 92, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(290, 'news', 'Dolor qui molestiae.', 64, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(291, 'news', 'Doloribus beatae sed corrupti.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(292, 'news', 'Voluptatem et accusamus.', 169, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(293, 'news', 'Dicta amet.', 85, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(294, 'news', 'Sit sapiente vel aperiam ipsam.', 44, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(295, 'news', 'Ut eius.', 157, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(296, 'attendance', 'Eveniet tenetur aut qui.', 69, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(297, 'news', 'Facilis quo velit.', 87, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(298, 'message', 'Reprehenderit dolorum hic in.', 14, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(299, 'news', 'Reprehenderit odit voluptate sequi.', 21, '0000-00-00 00:00:00', 'message', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45'),
(300, 'news', 'Pariatur quo.', 137, '0000-00-00 00:00:00', 'news', NULL, '2019-07-19 19:52:45', '2019-07-19 19:52:45');

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

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(1, 'cupiditate_330', 'Sit maiores inventore cupiditate ut corporis sed voluptas.', 123, 'Facere rem consequatur expedita id debitis.', 760, 12, 22, 710, 1, 1563572917, 1564206299, 0, NULL, NULL, NULL, NULL, 0, '0'),
(2, 'illo_812', NULL, 120, 'Eligendi omnis nostrum aut pariatur tempore.', 630, 30, 17, 750, 0, 1563572917, 1564268066, 0, NULL, NULL, NULL, NULL, 1, '0'),
(3, 'modi_129', NULL, 123, 'Id consequatur consequuntur est quaerat aliquid quisquam tempore dicta.', 950, 12, 0, 150, 0, 1563572917, 1564234485, 0, NULL, NULL, NULL, NULL, 0, '0'),
(4, 'distinctio_916', 'Est laboriosam dignissimos id adipisci omnis similique omnis aspernatur mollitia architecto.', 106, 'Quisquam provident qui minus consequuntur.', 850, 4, 0, 740, 0, 1563572917, 1563713623, 1, NULL, NULL, NULL, NULL, 1, '0'),
(5, 'amet_530', 'Eum et temporibus porro omnis blanditiis at rem.', 120, 'Ratione iure tempore sint voluptas accusamus architecto laudantium molestias.', 730, 0, 29, 150, 0, 1563572917, 1564046306, 0, NULL, NULL, NULL, NULL, 0, '0'),
(6, 'et_978', NULL, 118, 'Est culpa et est.', 260, 0, 0, 250, 0, 1563572917, 1563945318, 0, NULL, NULL, NULL, NULL, 0, '0'),
(7, 'reprehenderit_214', NULL, 113, 'Dolore aut non sint deserunt quasi.', 870, 0, 47, 590, 0, 1563572917, 1564546468, 0, NULL, NULL, NULL, NULL, 0, '0'),
(8, 'consequatur_893', NULL, 117, 'Exercitationem est labore facilis maxime excepturi consequatur tempora.', 120, 1, 26, 590, 1, 1563572918, 1564111394, 0, NULL, NULL, NULL, NULL, 0, '0'),
(9, 'sed_721', 'Et esse unde ut ex eos consectetur soluta autem animi.', 108, 'Qui nulla rem distinctio quam velit ea.', 640, 0, 0, 870, 1, 1563572918, 1564475457, 0, NULL, NULL, NULL, NULL, 0, '0'),
(10, 'facere_853', 'Aliquam ea voluptas omnis recusandae fugiat qui odit assumenda amet culpa qui.', 124, 'Eos incidunt odio similique incidunt qui consequatur.', 110, 0, 0, 540, 0, 1563572918, 1564046320, 0, NULL, NULL, NULL, NULL, 1, '0'),
(11, 'velit_208', 'Ad nulla eos exercitationem aliquid molestiae maxime maxime soluta laboriosam.', 109, 'Cumque accusamus omnis nostrum reprehenderit.', 400, 19, 0, 170, 0, 1563572918, 1564482920, 0, NULL, NULL, NULL, NULL, 0, '0'),
(12, 'quo_675', NULL, 116, 'Quasi quia aperiam velit alias.', 670, 32, 0, 300, 1, 1563572918, 1563741078, 0, NULL, NULL, NULL, NULL, 1, '0'),
(13, 'eum_913', NULL, 106, 'In ducimus voluptatibus ducimus aperiam aut quasi.', 80, 12, 49, 280, 1, 1563572918, 1564424510, 0, NULL, NULL, NULL, NULL, 1, '0'),
(14, 'velit_823', 'Sunt iure qui nulla quidem.', 120, 'Eum excepturi voluptas praesentium quaerat rerum in.', 320, 3, 39, 310, 1, 1563572918, 1563742723, 0, NULL, NULL, NULL, NULL, 0, '0'),
(15, 'voluptas_971', NULL, 117, 'Ut velit blanditiis molestias voluptate at eum doloribus.', 160, 0, 39, 60, 0, 1563572918, 1564117479, 0, NULL, NULL, NULL, NULL, 0, '0'),
(16, 'sapiente_965', 'At sit a voluptatibus et explicabo ut ipsum aut recusandae.', 125, 'Ipsam quidem et sed.', 510, 0, 0, 730, 0, 1563572918, 1564506940, 0, NULL, NULL, NULL, NULL, 0, '0'),
(17, 'molestiae_836', NULL, 119, 'Molestiae qui aut autem enim.', 130, 0, 0, 500, 1, 1563572918, 1563769275, 0, NULL, NULL, NULL, NULL, 1, '0'),
(18, 'sed_163', NULL, 119, 'Id quis expedita delectus excepturi incidunt aspernatur voluptatem.', 340, 0, 50, 660, 1, 1563572918, 1563822784, 0, NULL, NULL, NULL, NULL, 1, '0'),
(19, 'molestiae_899', NULL, 124, 'Aut sapiente non voluptas et et dolorem doloremque.', 350, 46, 0, 140, 1, 1563572918, 1563730246, 0, NULL, NULL, NULL, NULL, 0, '0'),
(20, 'molestiae_806', NULL, 106, 'Et et architecto maxime.', 170, 49, 30, 200, 1, 1563572918, 1563893559, 0, NULL, NULL, NULL, NULL, 0, '0'),
(21, 'consequatur_425', 'Provident dolor aut asperiores placeat in omnis qui sit ut harum.', 118, 'Officia nostrum autem maxime consequatur tenetur consequatur dolore.', 340, 0, 37, 70, 0, 1563572918, 1564350938, 0, NULL, NULL, NULL, NULL, 0, '0'),
(22, 'autem_546', NULL, 114, 'Quas sit minus non eaque id.', 520, 0, 0, 60, 1, 1563572918, 1563882317, 0, NULL, NULL, NULL, NULL, 0, '0'),
(23, 'optio_411', NULL, 117, 'Vitae consequatur maxime sit corrupti quae soluta id.', 750, 29, 0, 680, 0, 1563572918, 1564472562, 0, NULL, NULL, NULL, NULL, 1, '0'),
(24, 'eveniet_432', 'Rem aliquam consequatur iste qui magnam voluptatem repellat est ex facilis.', 120, 'Harum odio nulla dolore et.', 450, 49, 46, 90, 0, 1563572918, 1564295801, 0, NULL, NULL, NULL, NULL, 1, '0'),
(25, 'ipsa_954', NULL, 116, 'Nihil odio voluptatum ea temporibus et delectus.', 150, 0, 0, 800, 1, 1563572918, 1564531661, 0, NULL, NULL, NULL, NULL, 1, '0'),
(26, 'repellendus_687', 'Enim quaerat illo rerum quod itaque sit expedita quia.', 107, 'Facilis tempore suscipit vitae dolores.', 370, 14, 36, 660, 0, 1563572918, 1564297971, 0, NULL, NULL, NULL, NULL, 1, '0'),
(27, 'consequatur_109', NULL, 106, 'Sit illo aperiam pariatur incidunt.', 820, 50, 34, 680, 0, 1563572918, 1564123563, 0, NULL, NULL, NULL, NULL, 0, '0'),
(28, 'ab_316', NULL, 120, 'Tenetur tenetur totam quibusdam mollitia quia corporis.', 930, 50, 19, 740, 1, 1563572918, 1564219897, 0, NULL, NULL, NULL, NULL, 0, '0'),
(29, 'id_646', 'Possimus perferendis non numquam sunt libero numquam alias.', 123, 'Tenetur impedit ut voluptate.', 480, 35, 9, 610, 1, 1563572918, 1563796461, 0, NULL, NULL, NULL, NULL, 1, '0'),
(30, 'occaecati_108', 'Ipsa expedita debitis omnis in ipsum dolores molestiae esse in quod.', 116, 'Ea perspiciatis perferendis eos tempora omnis aut est.', 600, 22, 0, 810, 1, 1563572918, 1564193102, 0, NULL, NULL, NULL, NULL, 0, '0'),
(31, 'hic_339', NULL, 123, 'Officiis distinctio quae dolor ea assumenda officiis.', 780, 28, 13, 950, 1, 1563572918, 1563906347, 0, NULL, NULL, NULL, NULL, 1, '0'),
(32, 'dolores_723', NULL, 115, 'In optio rem odio enim.', 110, 12, 40, 490, 0, 1563572918, 1564213597, 0, NULL, NULL, NULL, NULL, 0, '0'),
(33, 'eveniet_800', NULL, 105, 'At accusantium eum beatae consequatur maiores non eum ipsa.', 480, 0, 0, 350, 0, 1563572918, 1564543389, 0, NULL, NULL, NULL, NULL, 1, '0'),
(34, 'earum_263', NULL, 105, 'Sit soluta iusto sequi earum nisi.', 330, 0, 0, 370, 1, 1563572918, 1564407338, 0, NULL, NULL, NULL, NULL, 0, '0'),
(35, 'eos_853', 'Est sit deserunt iure ut repellat aut amet voluptates rem alias.', 121, 'Quo numquam incidunt quo libero debitis recusandae neque.', 690, 49, 0, 250, 0, 1563572918, 1564558125, 0, NULL, NULL, NULL, NULL, 1, '0'),
(36, 'vel_186', NULL, 119, 'Fuga quibusdam ut et qui dolores inventore culpa.', 200, 0, 0, 130, 1, 1563572918, 1563834882, 0, NULL, NULL, NULL, NULL, 1, '0'),
(37, 'ipsa_943', NULL, 119, 'Sed sed voluptatem repellendus quos cupiditate fuga veniam.', 260, 0, 0, 890, 1, 1563572918, 1564352812, 0, NULL, NULL, NULL, NULL, 1, '0'),
(38, 'delectus_349', NULL, 123, 'Laborum recusandae nobis ut velit ut non.', 770, 0, 0, 560, 1, 1563572918, 1563733754, 0, NULL, NULL, NULL, NULL, 1, '0'),
(39, 'voluptas_400', NULL, 115, 'Repudiandae at officiis qui vel.', 540, 28, 26, 400, 1, 1563572918, 1564345566, 0, NULL, NULL, NULL, NULL, 1, '0'),
(40, 'officiis_652', 'Suscipit consequuntur culpa sed quisquam et.', 105, 'Impedit rerum esse esse assumenda incidunt a.', 560, 34, 2, 810, 1, 1563572918, 1564296264, 0, NULL, NULL, NULL, NULL, 1, '0'),
(41, 'nesciunt_767', 'Dolorum vel nesciunt sint iusto saepe sit et quos eaque.', 123, 'Molestiae ex iste optio quos.', 230, 14, 18, 430, 0, 1563572918, 1564457940, 0, NULL, NULL, NULL, NULL, 1, '0'),
(42, 'deserunt_257', NULL, 123, 'Velit sed iusto qui dolores vel fugiat.', 430, 17, 1, 730, 0, 1563572918, 1564431574, 0, NULL, NULL, NULL, NULL, 0, '0'),
(43, 'omnis_513', NULL, 124, 'Consectetur qui itaque molestiae harum.', 100, 0, 12, 210, 0, 1563572918, 1564373435, 0, NULL, NULL, NULL, NULL, 1, '0'),
(44, 'maiores_660', 'Ipsa blanditiis ipsa eligendi quae sunt necessitatibus animi.', 124, 'Praesentium blanditiis sit laborum in aut officiis.', 530, 9, 30, 540, 1, 1563572918, 1564562003, 0, NULL, NULL, NULL, NULL, 1, '0'),
(45, 'sed_482', NULL, 106, 'Omnis nisi molestiae et esse dolor.', 630, 42, 13, 80, 1, 1563572918, 1563944120, 0, NULL, NULL, NULL, NULL, 1, '0'),
(46, 'pariatur_688', 'Vero aut aliquid aut voluptatem sed voluptatibus dolores consequatur veniam.', 109, 'Assumenda molestias est officia voluptate.', 970, 18, 39, 770, 0, 1563572918, 1564261204, 0, NULL, NULL, NULL, NULL, 0, '0'),
(47, 'deserunt_941', NULL, 124, 'Hic magni aliquam quasi incidunt perferendis est id.', 930, 25, 20, 610, 1, 1563572918, 1563984135, 0, NULL, NULL, NULL, NULL, 0, '0'),
(48, 'amet_981', 'Aut enim nemo quaerat ratione ratione dolor nulla porro eum.', 123, 'Magni aut temporibus et quae necessitatibus ipsa.', 830, 41, 0, 410, 0, 1563572918, 1563812892, 0, NULL, NULL, NULL, NULL, 0, '0'),
(49, 'qui_518', 'Laboriosam ad dolore quam est provident.', 117, 'Possimus est incidunt aliquam exercitationem cum numquam dolorem.', 190, 41, 32, 410, 0, 1563572918, 1563865579, 0, NULL, NULL, NULL, NULL, 0, '0'),
(50, 'voluptates_166', 'Alias rerum inventore voluptates non aliquam.', 118, 'Voluptatem quos esse dolor voluptatibus ut facere distinctio.', 410, 0, 0, 310, 1, 1563572918, 1563989385, 0, NULL, NULL, NULL, NULL, 0, '0'),
(51, 'earum_347', NULL, 116, 'Eum occaecati illum ab voluptatem quo.', 400, 4, 0, 830, 1, 1563572918, 1564147072, 0, NULL, NULL, NULL, NULL, 1, '0'),
(52, 'amet_645', 'Quaerat quasi eius ea quasi ut nostrum labore.', 114, 'Placeat dolores enim voluptatem quidem doloremque.', 440, 0, 0, 540, 1, 1563572918, 1563958761, 0, NULL, NULL, NULL, NULL, 0, '0'),
(53, 'nemo_632', NULL, 112, 'Nesciunt id ut harum id sit provident.', 1000, 16, 31, 770, 1, 1563572918, 1563681361, 0, NULL, NULL, NULL, NULL, 1, '0'),
(54, 'aut_933', NULL, 118, 'Eligendi qui commodi qui id voluptatem maiores est.', 330, 3, 2, 170, 1, 1563572918, 1564469990, 0, NULL, NULL, NULL, NULL, 1, '0'),
(55, 'eum_803', 'Dolor dolor hic voluptas voluptas corrupti ut.', 110, 'Pariatur ea voluptate reiciendis nulla maiores.', 930, 0, 21, 370, 1, 1563572918, 1563932855, 0, NULL, NULL, NULL, NULL, 1, '0'),
(56, 'et_431', NULL, 105, 'Qui libero cum dicta labore ut qui.', 520, 45, 13, 990, 1, 1563572918, 1564053289, 0, NULL, NULL, NULL, NULL, 0, '0'),
(57, 'quibusdam_690', 'Perferendis temporibus magnam doloribus enim natus cumque molestiae omnis ut.', 114, 'Itaque aut doloribus aut quisquam aut consequatur.', 480, 0, 0, 970, 1, 1563572918, 1564205649, 0, NULL, NULL, NULL, NULL, 1, '0'),
(58, 'et_788', 'Aliquid voluptatem voluptates qui quo quia et voluptatem at ex.', 107, 'Aut non saepe voluptatem adipisci modi suscipit.', 850, 40, 0, 580, 1, 1563572918, 1564251012, 0, NULL, NULL, NULL, NULL, 1, '0'),
(59, 'dignissimos_561', 'Tempora molestiae consequatur reiciendis quis non aut enim at est.', 105, 'Sed repellat voluptatem sequi saepe nihil.', 990, 37, 0, 900, 0, 1563572918, 1563912394, 0, NULL, NULL, NULL, NULL, 0, '0'),
(60, 'quam_744', 'Recusandae sunt quisquam ipsa commodi nihil excepturi enim ut nisi.', 106, 'Dolores sequi blanditiis est eos quibusdam non cum.', 160, 19, 0, 750, 1, 1563572918, 1563933169, 0, NULL, NULL, NULL, NULL, 1, '0'),
(61, 'doloremque_823', NULL, 121, 'Quia deserunt voluptas vero ut sapiente.', 920, 48, 30, 270, 1, 1563572918, 1564566227, 0, NULL, NULL, NULL, NULL, 0, '0'),
(62, 'laborum_213', NULL, 123, 'Suscipit excepturi qui odit ipsam ullam sit dignissimos asperiores.', 290, 2, 39, 320, 1, 1563572918, 1564381764, 0, NULL, NULL, NULL, NULL, 0, '0'),
(63, 'tenetur_295', NULL, 123, 'Molestiae atque placeat aut et sed consectetur placeat.', 460, 7, 0, 820, 1, 1563572918, 1564013113, 0, NULL, NULL, NULL, NULL, 1, '0'),
(64, 'optio_588', NULL, 106, 'Et nemo vitae praesentium molestias rem saepe.', 730, 0, 0, 650, 0, 1563572918, 1564063048, 0, NULL, NULL, NULL, NULL, 1, '0'),
(65, 'occaecati_902', 'Qui molestiae et recusandae laudantium distinctio at fugiat modi neque illum.', 117, 'Alias earum commodi similique.', 270, 9, 32, 740, 0, 1563572918, 1564470182, 0, NULL, NULL, NULL, NULL, 0, '0'),
(66, 'voluptas_734', NULL, 124, 'Earum consequatur hic fugit natus recusandae illum qui.', 960, 0, 2, 190, 1, 1563572918, 1563861743, 0, NULL, NULL, NULL, NULL, 0, '0'),
(67, 'doloribus_420', NULL, 117, 'Asperiores doloribus exercitationem ipsum.', 80, 12, 42, 160, 0, 1563572918, 1563937838, 0, NULL, NULL, NULL, NULL, 1, '0'),
(68, 'omnis_948', NULL, 124, 'Qui molestiae temporibus et qui expedita beatae.', 520, 0, 0, 180, 1, 1563572918, 1564065794, 0, NULL, NULL, NULL, NULL, 0, '0'),
(69, 'sit_865', 'Placeat dolorem dolore laudantium expedita debitis aspernatur sint nulla velit rerum.', 106, 'Perspiciatis et pariatur reiciendis perferendis nulla.', 550, 21, 0, 980, 0, 1563572919, 1563707949, 1, NULL, NULL, NULL, NULL, 0, '0'),
(70, 'autem_336', NULL, 124, 'Est voluptatem dolorem maiores qui minus et in.', 930, 0, 0, 100, 1, 1563572919, 1564413975, 0, NULL, NULL, NULL, NULL, 1, '0'),
(71, 'consequuntur_956', 'Ut perferendis sunt voluptas debitis repudiandae est et maxime quas.', 125, 'Aperiam deleniti modi error dolores deserunt.', 170, 36, 12, 510, 1, 1563572919, 1563851404, 0, NULL, NULL, NULL, NULL, 0, '0'),
(72, 'cupiditate_188', NULL, 120, 'Dolore tempora quae deserunt ea.', 330, 0, 0, 700, 0, 1563572919, 1564129701, 0, NULL, NULL, NULL, NULL, 0, '0'),
(73, 'et_886', 'Perferendis sed nihil odit cumque ea.', 111, 'Facere nihil et quidem nihil.', 620, 49, 23, 510, 0, 1563572919, 1564491332, 0, NULL, NULL, NULL, NULL, 1, '0'),
(74, 'ipsa_636', NULL, 120, 'Quaerat a dolores autem quasi at.', 640, 21, 0, 620, 1, 1563572919, 1564333458, 0, NULL, NULL, NULL, NULL, 1, '0'),
(75, 'et_724', 'Rerum laboriosam beatae molestiae dolorem est aut.', 124, 'Ut exercitationem minima id esse nisi earum aperiam.', 520, 0, 6, 470, 0, 1563572919, 1564358568, 0, NULL, NULL, NULL, NULL, 1, '0'),
(76, 'aut_753', 'Deserunt dolores omnis ut autem maiores dolorem totam ullam facilis.', 106, 'Laboriosam dolorem accusantium modi ut esse eligendi a ut.', 50, 9, 0, 840, 1, 1563572919, 1563898410, 0, NULL, NULL, NULL, NULL, 1, '0'),
(77, 'earum_334', 'Dolorum dolor itaque vero magnam cum mollitia iusto voluptatibus dolor cum.', 122, 'Itaque voluptates modi corrupti sit repellendus aperiam consequatur.', 610, 0, 0, 740, 1, 1563572919, 1563744931, 0, NULL, NULL, NULL, NULL, 1, '0'),
(78, 'distinctio_322', 'Vel aut eos aut provident ratione qui exercitationem quia reprehenderit quis.', 114, 'Magnam omnis nihil et dolores.', 840, 0, 6, 50, 0, 1563572919, 1564403799, 0, NULL, NULL, NULL, NULL, 1, '0'),
(79, 'minus_741', NULL, 113, 'Officia quos sed iure eaque.', 860, 0, 29, 670, 0, 1563572919, 1563809350, 0, NULL, NULL, NULL, NULL, 1, '0'),
(80, 'tempora_880', NULL, 125, 'Qui at cupiditate est veritatis reiciendis dolor omnis laborum.', 1000, 0, 21, 310, 0, 1563572919, 1563735159, 1, NULL, NULL, NULL, NULL, 1, '0'),
(81, 'labore_155', 'Velit molestiae autem sapiente id voluptatem est magnam.', 118, 'Ab non amet error fugit dolores officiis.', 350, 33, 45, 440, 0, 1563572919, 1564134409, 0, NULL, NULL, NULL, NULL, 1, '0'),
(82, 'deserunt_682', NULL, 116, 'Sit praesentium et occaecati et qui a quod tempore.', 740, 0, 0, 480, 1, 1563572919, 1563719500, 0, NULL, NULL, NULL, NULL, 1, '0'),
(83, 'id_446', NULL, 106, 'Aliquam eum est maxime dignissimos officiis et.', 640, 39, 13, 290, 1, 1563572919, 1564423237, 0, NULL, NULL, NULL, NULL, 0, '0'),
(84, 'amet_370', NULL, 113, 'Molestiae et sapiente voluptatibus consequatur voluptas nostrum non.', 600, 10, 0, 880, 1, 1563572919, 1563891418, 0, NULL, NULL, NULL, NULL, 1, '0'),
(85, 'iure_971', NULL, 105, 'Rerum animi omnis rerum officia inventore pariatur voluptate nesciunt.', 360, 0, 0, 320, 0, 1563572919, 1564562462, 0, NULL, NULL, NULL, NULL, 0, '0'),
(86, 'officiis_481', 'Facere expedita dolorem accusantium incidunt sint vero dolor magnam consectetur est.', 121, 'Vero eius sequi aspernatur.', 900, 16, 20, 480, 0, 1563572919, 1564119644, 0, NULL, NULL, NULL, NULL, 1, '0'),
(87, 'sed_285', NULL, 124, 'Et quia error labore optio exercitationem ut.', 820, 0, 0, 90, 0, 1563572919, 1564263923, 0, NULL, NULL, NULL, NULL, 1, '0'),
(88, 'voluptatibus_193', 'Unde nihil accusantium aspernatur eveniet adipisci et.', 125, 'Perferendis sit repellendus officiis delectus eos ut.', 450, 49, 0, 600, 1, 1563572919, 1564458434, 0, NULL, NULL, NULL, NULL, 1, '0'),
(89, 'quis_697', NULL, 119, 'Facilis necessitatibus esse rerum sed culpa laboriosam esse.', 830, 29, 0, 90, 0, 1563572919, 1564250545, 0, NULL, NULL, NULL, NULL, 0, '0'),
(90, 'blanditiis_965', 'Repellendus eum iure quos et amet ipsam laborum nesciunt.', 105, 'Pariatur eligendi voluptatem ut voluptas eaque aperiam inventore.', 630, 31, 36, 920, 0, 1563572919, 1564351475, 0, NULL, NULL, NULL, NULL, 0, '0'),
(91, 'tempore_992', 'Dolorum suscipit nam at ipsa illum unde.', 115, 'Aliquam fugit sapiente placeat laborum occaecati necessitatibus.', 680, 36, 0, 950, 1, 1563572919, 1564074589, 0, NULL, NULL, NULL, NULL, 0, '0'),
(92, 'sunt_103', NULL, 106, 'Atque explicabo quod voluptas quia.', 670, 0, 0, 80, 1, 1563572919, 1563825092, 0, NULL, NULL, NULL, NULL, 1, '0'),
(93, 'natus_586', 'Ut error velit qui corporis voluptates numquam delectus at.', 106, 'Quia voluptates aperiam sit qui qui voluptatem consequatur.', 770, 0, 0, 410, 1, 1563572919, 1563998036, 0, NULL, NULL, NULL, NULL, 1, '0'),
(94, 'ullam_563', NULL, 124, 'Voluptatibus pariatur velit distinctio recusandae ea.', 70, 46, 0, 420, 0, 1563572919, 1564072654, 0, NULL, NULL, NULL, NULL, 1, '0'),
(95, 'id_897', 'Voluptas consequatur id et ea et nemo.', 105, 'Assumenda hic voluptate suscipit accusantium.', 600, 0, 0, 850, 0, 1563572919, 1563836738, 0, NULL, NULL, NULL, NULL, 1, '0'),
(96, 'rerum_582', 'Quia nihil dicta ipsum aliquid delectus eos animi incidunt.', 118, 'Nemo ex ducimus odit unde quidem dolores culpa.', 340, 31, 0, 510, 1, 1563572919, 1564457319, 0, NULL, NULL, NULL, NULL, 0, '0'),
(97, 'temporibus_929', 'Vel in quisquam dolorem similique minima quia qui.', 120, 'Officiis quibusdam quia ipsum.', 390, 49, 12, 560, 1, 1563572919, 1563993619, 0, NULL, NULL, NULL, NULL, 1, '0'),
(98, 'qui_489', NULL, 118, 'Nostrum amet possimus labore ullam consequuntur consequatur facilis eos.', 360, 24, 0, 110, 1, 1563572919, 1564303124, 0, NULL, NULL, NULL, NULL, 1, '0'),
(99, 'enim_594', 'Voluptatem ad et repellendus vero tempora sit.', 118, 'Iste quo ipsam voluptatem cum voluptas eaque.', 720, 0, 10, 810, 1, 1563572919, 1563847285, 0, NULL, NULL, NULL, NULL, 0, '0'),
(100, 'rem_819', 'Velit cum officia optio quae placeat id.', 120, 'Veniam quis et ut voluptatem esse incidunt.', 590, 0, 35, 750, 0, 1563572919, 1563973372, 0, NULL, NULL, NULL, NULL, 1, '0'),
(101, 'laborum_624', 'Omnis eos alias ipsam minus incidunt id sint dolorum.', 125, 'Nihil soluta quam sit.', 220, 7, 2, 970, 1, 1563572919, 1564016051, 0, NULL, NULL, NULL, NULL, 0, '0'),
(102, 'quibusdam_575', NULL, 115, 'Molestiae aspernatur iure rerum officia delectus qui tempora.', 430, 37, 9, 480, 0, 1563572919, 1564157108, 0, NULL, NULL, NULL, NULL, 0, '0'),
(103, 'omnis_662', NULL, 106, 'Tempora perferendis laudantium minus neque aut ullam.', 220, 47, 11, 240, 1, 1563572919, 1564029406, 0, NULL, NULL, NULL, NULL, 1, '0'),
(104, 'velit_810', NULL, 114, 'Officiis dolorum similique enim et.', 360, 0, 34, 100, 0, 1563572919, 1563970049, 0, NULL, NULL, NULL, NULL, 0, '0'),
(105, 'laudantium_324', 'Et perferendis perferendis accusamus blanditiis temporibus sed eos dolore.', 124, 'Sunt necessitatibus quisquam et maiores nesciunt deleniti facere eius.', 890, 48, 30, 940, 1, 1563572919, 1564107023, 0, NULL, NULL, NULL, NULL, 1, '0'),
(106, 'corrupti_108', 'Accusantium totam officiis illum et adipisci est nostrum dolore sit.', 125, 'Voluptatem adipisci odio magnam voluptas reprehenderit ipsam culpa.', 840, 47, 10, 710, 0, 1563572919, 1563808809, 0, NULL, NULL, NULL, NULL, 0, '0'),
(107, 'culpa_762', 'Voluptatem voluptas voluptatem error necessitatibus quisquam atque ut voluptatibus architecto minima.', 120, 'Adipisci sunt repudiandae iste consequatur.', 580, 0, 25, 330, 0, 1563572919, 1564382300, 0, NULL, NULL, NULL, NULL, 1, '0'),
(108, 'ut_718', 'Modi repudiandae et perspiciatis necessitatibus commodi eligendi eum.', 116, 'Eaque aperiam non est eos sapiente accusamus.', 1000, 0, 20, 890, 1, 1563572919, 1564059441, 0, NULL, NULL, NULL, NULL, 0, '0'),
(109, 'porro_176', 'Possimus rerum sunt aut cumque hic.', 124, 'Qui minus aliquam necessitatibus sint consequatur.', 740, 0, 0, 100, 1, 1563572919, 1563790507, 0, NULL, NULL, NULL, NULL, 0, '0'),
(110, 'harum_854', 'Rerum quae quo quo qui maxime sequi nobis nemo.', 123, 'Ab rerum pariatur ex et sed omnis.', 230, 9, 48, 410, 1, 1563572919, 1564357328, 0, NULL, NULL, NULL, NULL, 1, '0'),
(111, 'quae_406', 'Ipsum expedita velit illum officia culpa dolore reprehenderit assumenda eum.', 124, 'Debitis ea temporibus nemo.', 340, 44, 0, 540, 0, 1563572919, 1564420854, 0, NULL, NULL, NULL, NULL, 1, '0'),
(112, 'voluptate_903', NULL, 111, 'Mollitia doloremque corrupti soluta rem unde est.', 590, 47, 0, 510, 1, 1563572919, 1564005012, 0, NULL, NULL, NULL, NULL, 1, '0'),
(113, 'natus_105', NULL, 114, 'Non architecto nesciunt deserunt.', 370, 36, 0, 400, 0, 1563572919, 1564394496, 0, NULL, NULL, NULL, NULL, 1, '0'),
(114, 'molestiae_474', 'Consectetur nisi consectetur autem fugit.', 115, 'Culpa esse temporibus dolores sed.', 160, 0, 0, 580, 1, 1563572919, 1564277750, 0, NULL, NULL, NULL, NULL, 0, '0'),
(115, 'et_352', NULL, 120, 'Consectetur vel ut sed nihil.', 630, 0, 0, 850, 1, 1563572919, 1564278894, 0, NULL, NULL, NULL, NULL, 1, '0'),
(116, 'id_749', NULL, 111, 'Molestiae sequi ut facere cumque doloribus.', 60, 19, 0, 510, 0, 1563572919, 1563989146, 0, NULL, NULL, NULL, NULL, 0, '0'),
(117, 'culpa_965', NULL, 105, 'Esse sed repudiandae expedita quam.', 130, 33, 20, 90, 1, 1563572919, 1564235827, 0, NULL, NULL, NULL, NULL, 0, '0'),
(118, 'excepturi_826', 'Repellendus delectus et mollitia omnis rem eos eius.', 120, 'Fugiat officia eum quis ipsum facere alias.', 800, 8, 13, 570, 0, 1563572919, 1563902159, 0, NULL, NULL, NULL, NULL, 1, '0'),
(119, 'omnis_644', NULL, 115, 'Dolorum veritatis sapiente consequatur sequi et temporibus enim.', 100, 24, 11, 360, 1, 1563572919, 1564261260, 0, NULL, NULL, NULL, NULL, 1, '0'),
(120, 'cumque_900', 'Debitis optio quo et aliquam vitae esse quidem.', 112, 'Qui iure deleniti expedita.', 100, 37, 3, 940, 0, 1563572919, 1563961415, 0, NULL, NULL, NULL, NULL, 0, '0'),
(121, 'optio_195', NULL, 116, 'Nobis consequuntur nam perspiciatis ullam.', 740, 25, 44, 430, 1, 1563572919, 1564081512, 0, NULL, NULL, NULL, NULL, 1, '0'),
(122, 'aut_946', 'Adipisci minima consequatur corporis eum occaecati quos consectetur sit aperiam tempore.', 117, 'Molestiae maxime alias id repudiandae quo.', 480, 0, 0, 470, 0, 1563572919, 1564117515, 0, NULL, NULL, NULL, NULL, 0, '0'),
(123, 'sit_748', NULL, 124, 'Minus aliquam sequi blanditiis nihil iure voluptatem nulla.', 510, 0, 0, 690, 0, 1563572919, 1564417803, 0, NULL, NULL, NULL, NULL, 0, '0'),
(124, 'aut_866', 'Sit iure nulla tempora est ad.', 109, 'Numquam vel illum quo animi.', 850, 19, 0, 760, 0, 1563572919, 1564469229, 0, NULL, NULL, NULL, NULL, 0, '0'),
(125, 'eos_224', 'Tempora qui et aperiam nostrum aut deserunt ratione eveniet ut vero.', 124, 'Sed et neque laboriosam ea repudiandae impedit unde.', 980, 44, 13, 630, 0, 1563572919, 1564172825, 0, NULL, NULL, NULL, NULL, 1, '0'),
(126, 'at_666', NULL, 122, 'Consequatur voluptatibus ducimus vero.', 990, 2, 0, 860, 0, 1563572919, 1564212972, 0, NULL, NULL, NULL, NULL, 1, '0'),
(127, 'eos_990', NULL, 115, 'Quaerat nobis autem sequi nobis ut nihil natus.', 570, 20, 0, 620, 1, 1563572920, 1564314910, 0, NULL, NULL, NULL, NULL, 0, '0'),
(128, 'libero_340', 'Iusto exercitationem quasi dolor dicta doloremque.', 106, 'Sed non consequatur totam sint rerum consequuntur.', 770, 0, 0, 560, 1, 1563572920, 1564541764, 0, NULL, NULL, NULL, NULL, 0, '0'),
(129, 'velit_587', 'Consequatur iure ratione quae qui qui.', 118, 'Nemo quia voluptas autem animi dolor.', 220, 0, 46, 530, 0, 1563572920, 1564225840, 0, NULL, NULL, NULL, NULL, 0, '0'),
(130, 'voluptatum_867', 'Nihil placeat eum molestiae mollitia eos aut iure amet nam.', 123, 'Consequuntur est doloribus est unde corporis possimus adipisci.', 220, 33, 0, 630, 1, 1563572920, 1564408651, 0, NULL, NULL, NULL, NULL, 1, '0'),
(131, 'nostrum_672', 'Et aspernatur ipsam similique blanditiis et provident aut officiis quibusdam ipsum.', 105, 'Cupiditate omnis sed deserunt doloremque perferendis doloribus voluptatum.', 850, 15, 12, 870, 1, 1563572920, 1564145207, 0, NULL, NULL, NULL, NULL, 0, '0'),
(132, 'omnis_434', 'Unde ad sit recusandae aut a.', 114, 'Harum totam doloribus molestiae expedita ea quia eos.', 520, 38, 41, 480, 1, 1563572920, 1564228520, 0, NULL, NULL, NULL, NULL, 1, '0'),
(133, 'iste_991', NULL, 123, 'Eum harum ratione voluptatem commodi eum.', 240, 3, 0, 220, 0, 1563572920, 1564250434, 0, NULL, NULL, NULL, NULL, 1, '0'),
(134, 'libero_242', NULL, 118, 'Nobis commodi alias perspiciatis atque sint nihil quia.', 340, 6, 36, 950, 1, 1563572920, 1564349764, 0, NULL, NULL, NULL, NULL, 0, '0'),
(135, 'dolorem_374', NULL, 113, 'Unde officiis eveniet delectus voluptas fugiat animi praesentium amet.', 280, 0, 21, 90, 1, 1563572920, 1564131906, 0, NULL, NULL, NULL, NULL, 1, '0'),
(136, 'inventore_196', NULL, 124, 'Iure odio voluptates rerum sint ut nulla et.', 580, 44, 0, 780, 1, 1563572920, 1564296572, 0, NULL, NULL, NULL, NULL, 0, '0'),
(137, 'enim_707', NULL, 106, 'Eius voluptatem reprehenderit aperiam sunt.', 560, 0, 46, 200, 0, 1563572920, 1564100287, 0, NULL, NULL, NULL, NULL, 0, '0'),
(138, 'aliquam_426', NULL, 109, 'Odio et nam nostrum veniam sed voluptates quo.', 580, 11, 0, 960, 1, 1563572920, 1564121679, 0, NULL, NULL, NULL, NULL, 0, '0'),
(139, 'et_448', NULL, 124, 'Iure eum sint temporibus provident temporibus consequatur voluptatem non.', 630, 13, 0, 220, 1, 1563572920, 1563801685, 0, NULL, NULL, NULL, NULL, 0, '0'),
(140, 'voluptas_419', 'Nostrum illo voluptatem sunt vitae sit voluptatem veritatis earum.', 123, 'Atque ea temporibus dolor.', 730, 0, 0, 720, 1, 1563572920, 1564182088, 0, NULL, NULL, NULL, NULL, 0, '0'),
(141, 'qui_184', NULL, 112, 'Sit dolore consectetur maxime distinctio sed consequatur praesentium.', 630, 22, 0, 470, 0, 1563572920, 1563685518, 1, NULL, NULL, NULL, NULL, 0, '0'),
(142, 'temporibus_156', 'Quo excepturi fuga nobis at architecto doloremque officia nobis unde.', 115, 'Asperiores ducimus in eum labore veritatis esse.', 900, 0, 0, 340, 0, 1563572920, 1564003607, 0, NULL, NULL, NULL, NULL, 0, '0'),
(143, 'culpa_917', 'Ullam laboriosam assumenda quia porro non.', 107, 'Sint ratione qui sit eaque eligendi.', 730, 4, 0, 930, 1, 1563572920, 1564051079, 0, NULL, NULL, NULL, NULL, 0, '0'),
(144, 'debitis_357', NULL, 113, 'Eum architecto ut consequuntur.', 960, 24, 28, 600, 0, 1563572920, 1564240696, 0, NULL, NULL, NULL, NULL, 0, '0'),
(145, 'eos_463', NULL, 106, 'Hic molestiae deleniti iusto ducimus quia minima dolor.', 640, 0, 15, 450, 1, 1563572920, 1563872092, 0, NULL, NULL, NULL, NULL, 0, '0'),
(146, 'exercitationem_887', NULL, 112, 'Illo repudiandae quidem aliquam a.', 260, 19, 25, 780, 1, 1563572920, 1563770965, 0, NULL, NULL, NULL, NULL, 1, '0'),
(147, 'harum_584', NULL, 123, 'Voluptatum exercitationem in quo quisquam quia.', 520, 0, 0, 770, 0, 1563572920, 1564198056, 0, NULL, NULL, NULL, NULL, 0, '0'),
(148, 'quis_491', NULL, 113, 'Vel dolorem velit est quaerat magni a vel.', 160, 21, 27, 890, 0, 1563572920, 1564172695, 0, NULL, NULL, NULL, NULL, 0, '0'),
(149, 'maxime_334', 'Dignissimos aperiam corporis enim totam vitae eveniet incidunt.', 116, 'Rerum voluptas distinctio aut officia enim occaecati.', 70, 0, 0, 100, 1, 1563572920, 1564038253, 0, NULL, NULL, NULL, NULL, 1, '0'),
(150, 'voluptates_239', NULL, 110, 'Itaque quia omnis dolorem minus et cumque.', 250, 49, 29, 470, 1, 1563572920, 1564190299, 0, NULL, NULL, NULL, NULL, 0, '0'),
(151, 'veniam_838', NULL, 125, 'Sit dolore asperiores qui iste libero harum harum explicabo.', 800, 0, 0, 110, 0, 1563572920, 1563881604, 0, NULL, NULL, NULL, NULL, 0, '0'),
(152, 'autem_238', 'Earum atque quisquam officiis iusto molestias alias dolor assumenda numquam ab.', 120, 'Nobis omnis nostrum soluta molestias cumque omnis tempora.', 110, 0, 15, 620, 1, 1563572920, 1564239811, 0, NULL, NULL, NULL, NULL, 1, '0'),
(153, 'quaerat_914', 'Officiis voluptas magni deserunt suscipit nihil non ut facilis unde voluptate.', 114, 'Et quis qui repudiandae nisi dignissimos qui ut id.', 120, 0, 0, 660, 0, 1563572920, 1563897145, 0, NULL, NULL, NULL, NULL, 1, '0'),
(154, 'natus_610', 'Quo qui in illum assumenda nam aut repellendus ut.', 107, 'Veniam fugiat nostrum vero quis.', 770, 0, 0, 330, 0, 1563572920, 1564168260, 0, NULL, NULL, NULL, NULL, 0, '0'),
(155, 'modi_747', NULL, 120, 'Adipisci porro dolor nemo amet.', 330, 30, 13, 320, 0, 1563572920, 1564492728, 0, NULL, NULL, NULL, NULL, 1, '0'),
(156, 'velit_921', 'Eligendi veritatis laudantium quos odit omnis dolore.', 117, 'Magni veniam qui recusandae esse.', 830, 15, 0, 870, 0, 1563572920, 1564225865, 0, NULL, NULL, NULL, NULL, 1, '0'),
(157, 'laboriosam_111', NULL, 117, 'A eum fugiat fuga explicabo.', 150, 0, 31, 780, 0, 1563572920, 1564434292, 0, NULL, NULL, NULL, NULL, 1, '0'),
(158, 'dolor_376', 'Debitis sit porro voluptatibus omnis.', 113, 'Laudantium quibusdam ducimus porro qui itaque.', 70, 0, 2, 800, 0, 1563572920, 1563886517, 0, NULL, NULL, NULL, NULL, 0, '0'),
(159, 'qui_804', 'Aperiam saepe facilis laudantium repellat reiciendis voluptatem in voluptatum et expedita.', 124, 'Et distinctio facilis sapiente et quam.', 850, 5, 15, 650, 0, 1563572920, 1564299029, 0, NULL, NULL, NULL, NULL, 0, '0'),
(160, 'quam_675', NULL, 125, 'Iusto sit mollitia quo corrupti.', 110, 9, 0, 840, 0, 1563572920, 1563698518, 1, NULL, NULL, NULL, NULL, 0, '0'),
(161, 'amet_279', 'Culpa id voluptatem vel est molestiae.', 107, 'Ex doloribus tenetur eum quia nemo.', 820, 31, 19, 500, 1, 1563572920, 1564271198, 0, NULL, NULL, NULL, NULL, 1, '0'),
(162, 'neque_213', 'Qui velit et suscipit consectetur laudantium minima dolore aspernatur.', 107, 'Nobis non officiis voluptatibus officiis nobis sunt rerum.', 880, 21, 45, 400, 0, 1563572920, 1564176737, 0, NULL, NULL, NULL, NULL, 0, '0'),
(163, 'ab_678', 'Dolorum saepe aut dolorem temporibus est nisi sed cum qui dolores.', 114, 'Non est modi possimus eligendi et animi.', 470, 10, 31, 640, 0, 1563572920, 1563749591, 0, NULL, NULL, NULL, NULL, 1, '0'),
(164, 'perspiciatis_558', NULL, 125, 'Autem incidunt labore dolorem numquam earum inventore vel.', 950, 10, 27, 990, 1, 1563572920, 1564514933, 0, NULL, NULL, NULL, NULL, 0, '0'),
(165, 'alias_436', NULL, 125, 'Numquam et repudiandae similique et ad quibusdam fugit facere.', 260, 0, 0, 470, 1, 1563572920, 1564305160, 0, NULL, NULL, NULL, NULL, 1, '0'),
(166, 'ullam_616', NULL, 120, 'Maxime tenetur quos molestiae asperiores non quo voluptate.', 630, 11, 0, 130, 0, 1563572920, 1564498471, 0, NULL, NULL, NULL, NULL, 1, '0'),
(167, 'commodi_826', 'Sit aut rerum atque numquam illum nemo saepe non dolores.', 107, 'Corrupti natus culpa tempora reprehenderit dolor occaecati nesciunt.', 940, 28, 43, 650, 0, 1563572920, 1563987052, 0, NULL, NULL, NULL, NULL, 0, '0'),
(168, 'quia_779', NULL, 105, 'At labore assumenda qui aut.', 910, 19, 0, 260, 1, 1563572920, 1564506930, 0, NULL, NULL, NULL, NULL, 1, '0'),
(169, 'eveniet_281', NULL, 120, 'Sunt et eaque rerum at qui eius.', 750, 38, 0, 860, 1, 1563572920, 1564397700, 0, NULL, NULL, NULL, NULL, 0, '0'),
(170, 'repellendus_873', NULL, 120, 'Ipsa dolorum aut sequi officiis amet quia.', 780, 0, 32, 610, 0, 1563572920, 1564321758, 0, NULL, NULL, NULL, NULL, 1, '0'),
(171, 'et_394', NULL, 120, 'Aut minima et non enim sequi.', 740, 0, 15, 590, 0, 1563572920, 1564180776, 0, NULL, NULL, NULL, NULL, 1, '0'),
(172, 'illo_515', NULL, 105, 'Earum corporis id sit expedita impedit assumenda numquam maiores.', 80, 0, 0, 960, 0, 1563572920, 1563943152, 0, NULL, NULL, NULL, NULL, 1, '0'),
(173, 'qui_173', 'Dolorum ut non nostrum iste quasi temporibus dolor eaque harum hic eius.', 124, 'Et et qui consequatur placeat totam perspiciatis ad ullam.', 570, 0, 27, 130, 0, 1563572920, 1563752292, 0, NULL, NULL, NULL, NULL, 1, '0'),
(174, 'nulla_271', NULL, 117, 'Nostrum ut eligendi corporis dignissimos est consequatur sed maxime.', 920, 28, 0, 480, 1, 1563572920, 1564519121, 0, NULL, NULL, NULL, NULL, 1, '0'),
(175, 'perspiciatis_834', NULL, 123, 'Beatae sit reiciendis veritatis tempora fugiat aut.', 280, 0, 0, 390, 1, 1563572920, 1564214468, 0, NULL, NULL, NULL, NULL, 0, '0'),
(176, 'similique_669', NULL, 108, 'Quis eveniet facilis molestiae aut repellat voluptatibus.', 870, 38, 0, 670, 0, 1563572920, 1564221702, 0, NULL, NULL, NULL, NULL, 0, '0'),
(177, 'numquam_514', 'Nihil pariatur quisquam reprehenderit et adipisci ut odio maiores molestias.', 123, 'Officia illum quo et dolorem.', 990, 0, 0, 270, 0, 1563572920, 1564242616, 0, NULL, NULL, NULL, NULL, 1, '0'),
(178, 'amet_439', 'Modi eligendi dolorem dolores necessitatibus dolorem ipsum qui ipsam.', 118, 'Inventore amet at odit suscipit.', 1000, 0, 0, 200, 1, 1563572920, 1564448554, 0, NULL, NULL, NULL, NULL, 0, '0'),
(179, 'et_138', 'Dolorum sit dolorem non corrupti non.', 117, 'Et dolorum ea odit ipsam dolorem fuga ducimus.', 770, 47, 35, 50, 0, 1563572920, 1563980567, 0, NULL, NULL, NULL, NULL, 0, '0'),
(180, 'voluptas_866', NULL, 117, 'Molestiae hic nobis facere sunt corporis officia.', 650, 38, 0, 460, 1, 1563572920, 1564519864, 0, NULL, NULL, NULL, NULL, 1, '0'),
(181, 'quia_575', NULL, 120, 'Consequatur mollitia cupiditate quidem.', 510, 0, 0, 640, 0, 1563572921, 1563982177, 0, NULL, NULL, NULL, NULL, 0, '0'),
(182, 'et_354', NULL, 121, 'Deleniti placeat omnis sed exercitationem.', 80, 42, 18, 900, 0, 1563572921, 1564453533, 0, NULL, NULL, NULL, NULL, 0, '0'),
(183, 'labore_996', 'Itaque aut voluptate dolorem non occaecati et blanditiis qui.', 124, 'Ut culpa et aut et accusantium doloribus.', 840, 0, 0, 120, 0, 1563572921, 1564476052, 0, NULL, NULL, NULL, NULL, 0, '0'),
(184, 'atque_424', 'Nihil voluptatibus qui consequatur in sequi quasi.', 121, 'Quas neque et iste molestias officiis.', 670, 0, 0, 980, 0, 1563572921, 1563706600, 1, NULL, NULL, NULL, NULL, 1, '0'),
(185, 'ut_706', 'Voluptatem iure voluptates iste et quis est.', 121, 'Omnis architecto velit assumenda placeat quibusdam ea.', 440, 0, 0, 320, 1, 1563572921, 1563831365, 0, NULL, NULL, NULL, NULL, 0, '0'),
(186, 'necessitatibus_223', 'Voluptas error reprehenderit consequatur voluptatem.', 120, 'Aut voluptas pariatur aut sapiente beatae rem ut eum.', 510, 0, 12, 510, 1, 1563572921, 1563890500, 0, NULL, NULL, NULL, NULL, 1, '0'),
(187, 'totam_550', NULL, 118, 'Quia nisi ipsum quisquam.', 420, 33, 13, 400, 0, 1563572921, 1564377026, 0, NULL, NULL, NULL, NULL, 0, '0'),
(188, 'quidem_843', NULL, 112, 'Necessitatibus quia laborum est itaque reprehenderit.', 420, 0, 0, 300, 0, 1563572921, 1564075377, 0, NULL, NULL, NULL, NULL, 1, '0'),
(189, 'laborum_712', 'Dolores nesciunt voluptatum sed sunt possimus sunt cumque.', 116, 'Laudantium repellendus quos id impedit ducimus ipsa.', 610, 17, 9, 720, 0, 1563572921, 1564294839, 0, NULL, NULL, NULL, NULL, 1, '0'),
(190, 'quaerat_749', 'Voluptates aperiam eveniet cupiditate ea pariatur ipsam.', 116, 'Quod vero fuga dolorum sit eos et.', 710, 0, 0, 130, 0, 1563572921, 1563921917, 0, NULL, NULL, NULL, NULL, 0, '0'),
(191, 'qui_243', 'Qui voluptatem facilis labore non ut incidunt nihil quia distinctio odit.', 107, 'Dolorem qui voluptas nostrum repellat hic.', 890, 29, 8, 290, 0, 1563572921, 1564306724, 0, NULL, NULL, NULL, NULL, 1, '0'),
(192, 'ut_974', NULL, 123, 'Velit sit dicta qui quo vero explicabo veniam.', 790, 33, 11, 710, 0, 1563572921, 1563758592, 0, NULL, NULL, NULL, NULL, 0, '0'),
(193, 'dolorem_767', 'Sed qui eligendi aut similique quia sint alias ut cumque aperiam.', 119, 'Repellendus vero consectetur quod accusamus deserunt enim.', 200, 0, 0, 420, 0, 1563572921, 1564173801, 0, NULL, NULL, NULL, NULL, 1, '0'),
(194, 'laboriosam_561', 'Eligendi voluptatum accusamus possimus ea deleniti aut suscipit esse.', 124, 'Autem velit sed sint.', 160, 14, 0, 670, 1, 1563572921, 1564303951, 0, NULL, NULL, NULL, NULL, 0, '0'),
(195, 'quos_280', NULL, 105, 'Omnis suscipit est et in illo facilis fugit.', 630, 38, 0, 990, 1, 1563572921, 1563738202, 0, NULL, NULL, NULL, NULL, 0, '0'),
(196, 'accusamus_211', NULL, 105, 'Molestiae id consequuntur deleniti repudiandae tempora laudantium.', 790, 0, 0, 350, 0, 1563572921, 1563763345, 0, NULL, NULL, NULL, NULL, 0, '0'),
(197, 'rerum_352', NULL, 123, 'Aperiam fugit ad consequatur consectetur dolor magnam.', 980, 46, 0, 270, 1, 1563572921, 1564315946, 0, NULL, NULL, NULL, NULL, 0, '0'),
(198, 'reiciendis_416', NULL, 114, 'Repudiandae ut excepturi ut quasi.', 720, 35, 0, 800, 1, 1563572921, 1563778151, 0, NULL, NULL, NULL, NULL, 1, '0'),
(199, 'debitis_850', NULL, 123, 'Debitis tenetur similique aperiam est excepturi.', 70, 21, 0, 950, 1, 1563572921, 1564555646, 0, NULL, NULL, NULL, NULL, 0, '0'),
(200, 'veniam_858', 'Quo quis ut expedita laudantium consequatur quia et.', 107, 'Repellat nisi voluptatem consectetur ipsam eaque.', 150, 0, 17, 60, 0, 1563572921, 1564247005, 0, NULL, NULL, NULL, NULL, 1, '0'),
(201, 'quod_757', NULL, 107, 'Consequuntur nulla minus molestiae ut dolorem reprehenderit velit.', 960, 6, 22, 940, 0, 1563572921, 1563868901, 0, NULL, NULL, NULL, NULL, 1, '0'),
(202, 'qui_103', 'Earum blanditiis velit voluptatem et sit esse.', 117, 'Totam molestias praesentium ex esse qui.', 230, 0, 0, 250, 1, 1563572921, 1563703122, 0, NULL, NULL, NULL, NULL, 0, '0'),
(203, 'numquam_507', NULL, 124, 'Eveniet ipsum est odit.', 500, 40, 0, 900, 1, 1563572921, 1563933368, 0, NULL, NULL, NULL, NULL, 1, '0'),
(204, 'architecto_415', 'Sapiente blanditiis cum reprehenderit aut rerum nobis qui qui iste accusantium.', 125, 'Optio veniam voluptate doloribus deleniti et tempore.', 540, 0, 12, 980, 1, 1563572921, 1564493753, 0, NULL, NULL, NULL, NULL, 0, '0'),
(205, 'consequatur_109', NULL, 123, 'Totam dolorum at quis.', 930, 25, 0, 500, 1, 1563572921, 1564311735, 0, NULL, NULL, NULL, NULL, 0, '0'),
(206, 'a_938', NULL, 114, 'Et et corporis enim labore repellendus ut cupiditate.', 850, 5, 0, 90, 0, 1563572921, 1564287213, 0, NULL, NULL, NULL, NULL, 1, '0'),
(207, 'porro_101', NULL, 113, 'Suscipit iure esse eum est.', 60, 19, 5, 870, 0, 1563572921, 1563737518, 1, NULL, NULL, NULL, NULL, 1, '0'),
(208, 'quasi_577', NULL, 123, 'Voluptatem sunt nemo sapiente blanditiis.', 310, 0, 50, 300, 1, 1563572921, 1564517609, 0, NULL, NULL, NULL, NULL, 0, '0'),
(209, 'eveniet_542', NULL, 113, 'Odio unde veritatis consequatur aut quo.', 530, 0, 0, 560, 1, 1563572921, 1564191996, 0, NULL, NULL, NULL, NULL, 0, '0'),
(210, 'libero_682', 'Dolores repellendus voluptatem voluptatum voluptas temporibus.', 123, 'Autem doloremque nihil esse laborum dolorem fuga doloribus.', 300, 0, 0, 450, 0, 1563572921, 1564220298, 0, NULL, NULL, NULL, NULL, 0, '0'),
(211, 'id_831', 'Alias est quibusdam ut repudiandae.', 124, 'Ipsum amet dolores debitis repellat ut.', 850, 0, 7, 390, 1, 1563572921, 1564225717, 0, NULL, NULL, NULL, NULL, 0, '0'),
(212, 'dolores_823', NULL, 121, 'Labore autem accusantium recusandae vel amet illo.', 640, 11, 39, 700, 0, 1563572921, 1564497031, 0, NULL, NULL, NULL, NULL, 0, '0'),
(213, 'incidunt_254', 'Incidunt rem velit qui esse natus dolores ea ipsa non optio.', 116, 'Ut omnis facilis omnis sapiente omnis sapiente.', 870, 42, 0, 470, 1, 1563572921, 1564298673, 0, NULL, NULL, NULL, NULL, 1, '0'),
(214, 'earum_445', NULL, 106, 'Error sit consequatur aut debitis nam omnis.', 160, 12, 0, 430, 1, 1563572921, 1564046050, 0, NULL, NULL, NULL, NULL, 1, '0'),
(215, 'voluptatem_695', NULL, 124, 'Qui animi at qui aliquam dolore sed.', 330, 22, 43, 400, 0, 1563572921, 1564570705, 0, NULL, NULL, NULL, NULL, 1, '0'),
(216, 'aliquam_126', 'Voluptatum ut alias cumque sed repellat velit quia officiis excepturi.', 112, 'Velit est exercitationem nulla quam.', 290, 0, 44, 910, 1, 1563572921, 1563731733, 0, NULL, NULL, NULL, NULL, 0, '0'),
(217, 'enim_636', NULL, 121, 'Aut et aut eveniet hic dignissimos error expedita minus.', 560, 31, 0, 130, 0, 1563572921, 1564176938, 0, NULL, NULL, NULL, NULL, 0, '0'),
(218, 'enim_665', 'Eos ut et dolore corporis mollitia veniam sint.', 120, 'Sit praesentium laborum at enim.', 660, 0, 0, 850, 1, 1563572921, 1563780509, 0, NULL, NULL, NULL, NULL, 1, '0'),
(219, 'qui_742', NULL, 124, 'Aut qui esse est consequatur non.', 580, 27, 34, 140, 1, 1563572921, 1564426882, 0, NULL, NULL, NULL, NULL, 1, '0'),
(220, 'omnis_426', 'Qui reiciendis qui ut perspiciatis facilis dignissimos libero doloribus.', 124, 'Sit ut eius consequatur voluptas earum quia.', 90, 28, 0, 600, 0, 1563572921, 1564214269, 0, NULL, NULL, NULL, NULL, 0, '0'),
(221, 'reiciendis_799', 'Pariatur veniam ipsam vero dicta est labore numquam pariatur nostrum quis.', 125, 'Repellendus sunt voluptatem quo est asperiores provident.', 590, 42, 10, 900, 1, 1563572921, 1563992437, 0, NULL, NULL, NULL, NULL, 1, '0'),
(222, 'repudiandae_897', 'Aut voluptate corporis illo molestiae dignissimos quam.', 107, 'Nobis ut aut omnis quia molestias at ut.', 270, 0, 23, 480, 0, 1563572921, 1564223445, 0, NULL, NULL, NULL, NULL, 1, '0'),
(223, 'ipsam_279', NULL, 107, 'Et rem sed iure fuga eveniet.', 430, 10, 9, 410, 1, 1563572921, 1563676713, 0, NULL, NULL, NULL, NULL, 0, '0'),
(224, 'unde_267', 'Nostrum placeat dolorum repellat odit esse.', 125, 'Esse explicabo et atque accusantium quod.', 420, 43, 46, 340, 1, 1563572921, 1564042951, 0, NULL, NULL, NULL, NULL, 0, '0'),
(225, 'porro_239', NULL, 122, 'Laudantium sit perspiciatis sed reprehenderit ea at.', 890, 0, 41, 910, 0, 1563572921, 1563780275, 0, NULL, NULL, NULL, NULL, 1, '0'),
(226, 'asperiores_546', 'Nostrum ipsam enim ullam est et.', 120, 'Vero voluptatem illo ullam quos eos molestiae et.', 670, 0, 46, 870, 1, 1563572922, 1564048712, 0, NULL, NULL, NULL, NULL, 1, '0'),
(227, 'dolores_394', 'Qui error aliquam rerum sit sapiente sit exercitationem possimus qui quidem.', 105, 'Et est animi quos consequatur velit voluptas et.', 100, 0, 0, 690, 1, 1563572922, 1563702716, 0, NULL, NULL, NULL, NULL, 0, '0'),
(228, 'rerum_522', NULL, 105, 'Nihil consectetur cumque nesciunt doloremque.', 680, 0, 30, 940, 0, 1563572922, 1564519604, 0, NULL, NULL, NULL, NULL, 0, '0'),
(229, 'culpa_425', NULL, 119, 'Ipsum vel voluptate vel nulla omnis eum.', 190, 28, 16, 310, 1, 1563572922, 1563878440, 0, NULL, NULL, NULL, NULL, 0, '0'),
(230, 'voluptatem_907', NULL, 111, 'Odit sit rerum doloribus quis quidem optio ducimus.', 920, 17, 0, 830, 0, 1563572922, 1563982680, 0, NULL, NULL, NULL, NULL, 1, '0'),
(231, 'voluptatem_465', NULL, 123, 'Et incidunt ut inventore fugiat veniam architecto.', 170, 19, 16, 140, 1, 1563572922, 1564338629, 0, NULL, NULL, NULL, NULL, 0, '0'),
(232, 'tempore_788', NULL, 105, 'Ad exercitationem nam aut beatae repudiandae quia.', 360, 29, 0, 420, 0, 1563572922, 1563858290, 0, NULL, NULL, NULL, NULL, 0, '0'),
(233, 'est_346', NULL, 122, 'Rerum voluptatem vero rem ullam eum non.', 830, 0, 0, 160, 0, 1563572922, 1563708558, 1, NULL, NULL, NULL, NULL, 0, '0'),
(234, 'velit_962', NULL, 123, 'Iste dolor est dolorem doloremque.', 70, 0, 10, 940, 1, 1563572922, 1563798595, 0, NULL, NULL, NULL, NULL, 1, '0'),
(235, 'quo_175', NULL, 122, 'Voluptatem atque voluptates similique magni accusantium.', 770, 5, 0, 990, 0, 1563572922, 1563783433, 0, NULL, NULL, NULL, NULL, 0, '0'),
(236, 'iste_636', 'Aut laudantium explicabo aut veniam esse qui officia libero totam.', 120, 'Laborum blanditiis tenetur debitis est.', 970, 0, 0, 500, 0, 1563572922, 1564344415, 0, NULL, NULL, NULL, NULL, 1, '0'),
(237, 'quam_988', NULL, 116, 'Necessitatibus ut sit similique ea blanditiis similique doloribus.', 760, 24, 0, 380, 1, 1563572922, 1564001057, 0, NULL, NULL, NULL, NULL, 1, '0'),
(238, 'consequuntur_880', 'Est sit quae quia sint et sapiente.', 114, 'Qui fuga similique sequi repellendus alias quisquam cumque.', 980, 20, 0, 220, 0, 1563572922, 1564290989, 0, NULL, NULL, NULL, NULL, 1, '0'),
(239, 'totam_122', NULL, 123, 'Magni et vitae ducimus sunt aperiam.', 130, 0, 30, 950, 1, 1563572922, 1563820972, 0, NULL, NULL, NULL, NULL, 1, '0'),
(240, 'eos_604', 'Rerum consequuntur inventore accusamus ipsum qui et.', 118, 'Quidem accusantium dolores nesciunt hic.', 520, 30, 1, 670, 0, 1563572922, 1564065644, 0, NULL, NULL, NULL, NULL, 0, '0'),
(241, 'et_777', 'Deserunt soluta voluptas itaque dignissimos praesentium dolor numquam facilis corporis.', 124, 'Iusto quisquam dicta natus.', 120, 47, 0, 790, 1, 1563572922, 1563849695, 0, NULL, NULL, NULL, NULL, 1, '0'),
(242, 'eaque_570', 'Voluptatum assumenda repellendus enim enim quibusdam eos soluta facere recusandae quibusdam excepturi.', 114, 'Velit ut totam ut asperiores velit.', 200, 9, 0, 590, 0, 1563572922, 1564028588, 0, NULL, NULL, NULL, NULL, 1, '0'),
(243, 'tempora_789', NULL, 118, 'Et molestiae consequatur qui dolor est eos in numquam.', 510, 2, 38, 810, 1, 1563572922, 1564032103, 0, NULL, NULL, NULL, NULL, 1, '0'),
(244, 'tenetur_377', NULL, 106, 'Ut inventore cupiditate alias ea quia quia.', 510, 48, 21, 920, 0, 1563572922, 1564301372, 0, NULL, NULL, NULL, NULL, 1, '0'),
(245, 'ea_372', NULL, 107, 'Accusamus minus aliquam facilis minima fugiat debitis.', 130, 20, 0, 350, 0, 1563572922, 1564294088, 0, NULL, NULL, NULL, NULL, 1, '0'),
(246, 'maxime_285', 'Nostrum enim voluptatem cupiditate est dolor a et laboriosam itaque autem molestias.', 117, 'Ut porro recusandae voluptatibus consequatur reprehenderit.', 330, 43, 39, 860, 0, 1563572922, 1564264722, 0, NULL, NULL, NULL, NULL, 0, '0'),
(247, 'vel_890', NULL, 111, 'Nulla cumque blanditiis nostrum qui a.', 250, 47, 0, 970, 0, 1563572922, 1563857319, 0, NULL, NULL, NULL, NULL, 1, '0'),
(248, 'esse_129', 'Dignissimos autem saepe deleniti maxime non mollitia vitae modi maxime.', 120, 'Est magnam sit repellendus eligendi perspiciatis natus veniam.', 300, 0, 0, 440, 1, 1563572922, 1564499914, 0, NULL, NULL, NULL, NULL, 1, '0'),
(249, 'repellat_663', 'Iste et nemo modi accusantium repellat amet incidunt.', 116, 'Odio voluptas aut cupiditate quibusdam eligendi ducimus illo dolorem.', 340, 43, 9, 490, 0, 1563572922, 1563822091, 0, NULL, NULL, NULL, NULL, 1, '0'),
(250, 'tempora_586', NULL, 116, 'Minima sed quam quidem aperiam maiores earum suscipit.', 250, 0, 3, 800, 0, 1563572922, 1564083702, 0, NULL, NULL, NULL, NULL, 0, '0'),
(251, 'id_891', 'Fugiat odio reiciendis tempora cupiditate enim explicabo commodi nesciunt.', 112, 'Sed assumenda et aut aut ut voluptatem est rem.', 600, 32, 0, 260, 1, 1563572922, 1564371784, 0, NULL, NULL, NULL, NULL, 1, '0'),
(252, 'animi_153', 'Delectus qui et ducimus et sit.', 123, 'Non velit deserunt id tempore totam corporis.', 820, 0, 0, 180, 1, 1563572922, 1564237972, 0, NULL, NULL, NULL, NULL, 0, '0'),
(253, 'voluptas_876', 'Itaque consequatur nobis iste ad molestias.', 116, 'Beatae rerum est modi sit eos.', 840, 39, 39, 1000, 0, 1563572922, 1564064262, 0, NULL, NULL, NULL, NULL, 1, '0'),
(254, 'repudiandae_931', 'Porro aperiam omnis ex dolor labore eos impedit.', 119, 'Ea reprehenderit sit qui aut earum.', 740, 18, 0, 740, 0, 1563572922, 1564376097, 0, NULL, NULL, NULL, NULL, 0, '0'),
(255, 'eum_553', NULL, 123, 'Est voluptatem dignissimos sapiente cum.', 740, 8, 0, 230, 1, 1563572922, 1564488698, 0, NULL, NULL, NULL, NULL, 0, '0'),
(256, 'quia_429', NULL, 113, 'Cupiditate reiciendis nostrum quia provident repellendus nisi.', 540, 0, 14, 660, 0, 1563572922, 1564252119, 0, NULL, NULL, NULL, NULL, 1, '0'),
(257, 'nisi_714', NULL, 106, 'Laboriosam rerum vitae modi qui tempore.', 880, 16, 0, 490, 0, 1563572922, 1564172597, 0, NULL, NULL, NULL, NULL, 1, '0'),
(258, 'sunt_677', 'Asperiores voluptas sed odit voluptatem tempore.', 120, 'Similique dolorem quidem impedit amet dolore culpa mollitia.', 980, 31, 0, 390, 0, 1563572922, 1563738097, 1, NULL, NULL, NULL, NULL, 1, '0'),
(259, 'rerum_273', NULL, 112, 'Reiciendis voluptas voluptas omnis minima est sint quisquam.', 570, 0, 21, 620, 0, 1563572922, 1563697022, 1, NULL, NULL, NULL, NULL, 0, '0'),
(260, 'aperiam_739', NULL, 117, 'Qui quas quod odio distinctio eveniet recusandae.', 820, 47, 2, 110, 1, 1563572922, 1563825950, 0, NULL, NULL, NULL, NULL, 1, '0'),
(261, 'hic_477', 'Quos error aspernatur cum saepe facere repellendus corporis commodi sunt.', 107, 'Facere ut iure quia ut quaerat autem necessitatibus.', 610, 0, 8, 960, 1, 1563572922, 1564102955, 0, NULL, NULL, NULL, NULL, 0, '0'),
(262, 'quisquam_305', 'Sequi natus facilis tenetur facilis cumque in deleniti fugiat qui.', 106, 'Dolor nihil ducimus quos impedit et eos voluptatem.', 390, 20, 20, 880, 0, 1563572922, 1564383591, 0, NULL, NULL, NULL, NULL, 1, '0'),
(263, 'quia_920', 'Porro cupiditate voluptatem et quo dolor dolor.', 124, 'Modi doloremque placeat repudiandae dolorem quo.', 520, 0, 0, 270, 1, 1563572922, 1564113996, 0, NULL, NULL, NULL, NULL, 1, '0'),
(264, 'laudantium_292', 'Rem harum illum cumque autem eum odio.', 120, 'Autem est in nulla quidem consequatur non aut consequatur.', 190, 21, 0, 910, 1, 1563572922, 1564016481, 0, NULL, NULL, NULL, NULL, 0, '0'),
(265, 'molestias_193', 'Facilis ea consequuntur mollitia atque qui dignissimos.', 106, 'Delectus voluptas quaerat soluta aut.', 100, 0, 33, 650, 1, 1563572922, 1563995445, 0, NULL, NULL, NULL, NULL, 1, '0'),
(266, 'nulla_158', 'Est quia magnam aliquid provident molestiae.', 113, 'Molestiae nihil atque inventore accusantium nihil qui.', 470, 32, 0, 700, 1, 1563572923, 1563699535, 0, NULL, NULL, NULL, NULL, 0, '0'),
(267, 'eius_367', 'Iure nisi non iste nihil dolorem.', 124, 'Eaque vel modi ut ex in sed.', 990, 0, 0, 610, 1, 1563572923, 1563794166, 0, NULL, NULL, NULL, NULL, 1, '0'),
(268, 'non_423', NULL, 122, 'Eum blanditiis iure maiores minima soluta.', 140, 0, 0, 620, 1, 1563572923, 1564167440, 0, NULL, NULL, NULL, NULL, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(269, 'facilis_717', 'Quia omnis incidunt temporibus qui est voluptas nemo quo.', 108, 'Et est iusto et qui.', 780, 0, 0, 120, 1, 1563572923, 1563815584, 0, NULL, NULL, NULL, NULL, 0, '0'),
(270, 'reprehenderit_958', 'Molestias non suscipit assumenda quidem.', 117, 'Et dolor animi omnis minus qui omnis commodi.', 720, 0, 0, 770, 0, 1563572923, 1564009726, 0, NULL, NULL, NULL, NULL, 0, '0'),
(271, 'doloremque_528', NULL, 116, 'Minima inventore quasi aut perferendis.', 990, 40, 0, 820, 1, 1563572923, 1563985624, 0, NULL, NULL, NULL, NULL, 1, '0'),
(272, 'quibusdam_725', NULL, 123, 'Et error quisquam quia est debitis.', 330, 14, 0, 750, 0, 1563572923, 1563999672, 0, NULL, NULL, NULL, NULL, 0, '0'),
(273, 'voluptatibus_848', 'Ut ut et iste ab dolores ducimus adipisci consectetur rem ratione.', 122, 'Aperiam ea cupiditate magnam architecto.', 450, 0, 0, 510, 1, 1563572923, 1563828176, 0, NULL, NULL, NULL, NULL, 1, '0'),
(274, 'et_423', 'Velit recusandae nihil molestiae impedit est aut reprehenderit.', 125, 'Voluptates sit explicabo rerum quia aut et quis.', 440, 0, 0, 830, 0, 1563572923, 1564299370, 0, NULL, NULL, NULL, NULL, 1, '0'),
(275, 'et_398', 'Sit sequi sit perspiciatis ut similique quo quo adipisci voluptatum.', 107, 'Enim eveniet expedita aut quia aut quasi.', 470, 28, 45, 400, 1, 1563572923, 1564390865, 0, NULL, NULL, NULL, NULL, 0, '0'),
(276, 'rerum_920', NULL, 107, 'Incidunt beatae ullam id doloremque.', 650, 0, 49, 110, 0, 1563572923, 1564491182, 0, NULL, NULL, NULL, NULL, 0, '0'),
(277, 'et_694', NULL, 123, 'Consectetur vitae iusto laboriosam harum animi.', 220, 13, 0, 800, 1, 1563572923, 1564193633, 0, NULL, NULL, NULL, NULL, 1, '0'),
(278, 'iste_827', NULL, 119, 'Ea eum omnis aperiam et.', 940, 0, 0, 50, 1, 1563572923, 1564451701, 0, NULL, NULL, NULL, NULL, 1, '0'),
(279, 'et_783', NULL, 108, 'Blanditiis veritatis dolores ut maiores possimus et porro.', 920, 0, 2, 280, 1, 1563572923, 1564461051, 0, NULL, NULL, NULL, NULL, 0, '0'),
(280, 'non_792', NULL, 125, 'Et repellendus eum et labore ab.', 410, 21, 42, 660, 1, 1563572923, 1563930980, 0, NULL, NULL, NULL, NULL, 1, '0'),
(281, 'accusantium_759', NULL, 114, 'Voluptates similique occaecati sapiente ipsam dolorum dolor.', 330, 2, 21, 550, 1, 1563572923, 1564146752, 0, NULL, NULL, NULL, NULL, 1, '0'),
(282, 'recusandae_344', 'Quia temporibus quo non vel illo nemo fuga.', 123, 'Sit est atque ullam incidunt in repudiandae totam.', 320, 0, 29, 740, 1, 1563572923, 1564396348, 0, NULL, NULL, NULL, NULL, 1, '0'),
(283, 'dolores_403', NULL, 107, 'Et amet architecto nostrum mollitia qui.', 750, 0, 7, 290, 0, 1563572923, 1564564194, 0, NULL, NULL, NULL, NULL, 0, '0'),
(284, 'aspernatur_301', 'Temporibus aliquam sunt ratione harum sint libero consectetur dolor.', 107, 'Vel odit unde dolor.', 820, 0, 34, 260, 0, 1563572923, 1564218737, 0, NULL, NULL, NULL, NULL, 0, '0'),
(285, 'molestias_778', 'Blanditiis quaerat quibusdam dignissimos consequatur earum.', 120, 'Qui aliquam voluptatum asperiores quia aperiam sunt.', 410, 47, 13, 820, 1, 1563572923, 1564491603, 0, NULL, NULL, NULL, NULL, 1, '0'),
(286, 'ut_757', 'Provident eum incidunt occaecati consequatur aut provident.', 105, 'Dolor dolores voluptatem possimus et quae provident.', 780, 3, 0, 520, 0, 1563572923, 1564014080, 0, NULL, NULL, NULL, NULL, 1, '0'),
(287, 'maiores_463', 'Quae nisi at quos earum distinctio laudantium saepe et.', 121, 'Suscipit vitae fugiat esse pariatur odio.', 430, 48, 0, 300, 0, 1563572923, 1564230531, 0, NULL, NULL, NULL, NULL, 1, '0'),
(288, 'et_597', 'Non maiores enim sed dolore fuga.', 114, 'Sed at ratione voluptates assumenda velit vel.', 820, 0, 0, 130, 1, 1563572923, 1564292871, 0, NULL, NULL, NULL, NULL, 0, '0'),
(289, 'neque_469', NULL, 117, 'Voluptas veniam delectus provident dolorem.', 80, 0, 0, 490, 0, 1563572923, 1563815883, 0, NULL, NULL, NULL, NULL, 0, '0'),
(290, 'iste_101', NULL, 115, 'Molestias quaerat quo soluta et.', 260, 0, 38, 130, 1, 1563572923, 1564164352, 0, NULL, NULL, NULL, NULL, 0, '0'),
(291, 'aliquam_172', 'Sit dicta delectus itaque beatae similique.', 113, 'Ea debitis ex sequi repellat.', 580, 0, 0, 70, 1, 1563572923, 1564186927, 0, NULL, NULL, NULL, NULL, 1, '0'),
(292, 'quo_247', 'Et quisquam temporibus placeat ea expedita sed fuga ut.', 116, 'Commodi cupiditate debitis ex et libero natus nostrum.', 180, 31, 50, 850, 1, 1563572923, 1564562317, 0, NULL, NULL, NULL, NULL, 1, '0'),
(293, 'est_728', NULL, 109, 'Quaerat vel rerum optio eaque voluptate.', 770, 0, 0, 70, 1, 1563572923, 1563944154, 0, NULL, NULL, NULL, NULL, 1, '0'),
(294, 'amet_916', 'Sit numquam maiores iste aut natus quidem.', 120, 'Quo placeat accusantium voluptas repellendus impedit sit.', 660, 0, 0, 860, 0, 1563572923, 1564183021, 0, NULL, NULL, NULL, NULL, 1, '0'),
(295, 'occaecati_482', NULL, 115, 'Quia suscipit sunt vero quis expedita dolores.', 260, 0, 7, 560, 1, 1563572923, 1563735193, 0, NULL, NULL, NULL, NULL, 0, '0'),
(296, 'at_906', 'Enim id aut vel voluptatem sint animi ea.', 124, 'Quis iure error beatae et nihil debitis qui occaecati.', 840, 0, 0, 60, 0, 1563572923, 1564183000, 0, NULL, NULL, NULL, NULL, 1, '0'),
(297, 'a_429', 'Error et quam quos aliquid ipsa reprehenderit ut id ipsam.', 108, 'Perspiciatis eum ea nihil dolor consectetur nam commodi.', 400, 0, 0, 520, 1, 1563572923, 1564360638, 0, NULL, NULL, NULL, NULL, 1, '0'),
(298, 'possimus_335', NULL, 116, 'Consequuntur voluptates sed eos minima voluptas dolores.', 260, 0, 0, 350, 0, 1563572923, 1563946185, 0, NULL, NULL, NULL, NULL, 1, '0'),
(299, 'dolores_599', 'Commodi eaque nostrum ipsa et vel qui fugiat.', 116, 'Error qui qui velit aliquam.', 860, 0, 0, 920, 0, 1563572923, 1564543391, 0, NULL, NULL, NULL, NULL, 1, '0'),
(300, 'accusamus_370', 'Sit facere aut maiores rerum qui enim ipsum reiciendis ex.', 106, 'Excepturi maiores est sunt voluptatem deleniti alias.', 70, 0, 21, 930, 1, 1563572923, 1563707103, 0, NULL, NULL, NULL, NULL, 0, '0'),
(301, 'et_811', 'Voluptas ducimus et consequatur adipisci aut quae ducimus fuga molestiae quis.', 121, 'Ipsam consectetur alias et eveniet atque eum.', 360, 0, 0, 920, 0, 1563572923, 1563968627, 0, NULL, NULL, NULL, NULL, 1, '0'),
(302, 'sit_443', NULL, 116, 'Quia praesentium quisquam voluptatem rerum iusto.', 120, 7, 0, 410, 1, 1563572923, 1563867406, 0, NULL, NULL, NULL, NULL, 1, '0'),
(303, 'voluptates_879', 'Amet reiciendis non ratione distinctio quis recusandae aut temporibus itaque.', 124, 'Natus praesentium consectetur quibusdam repudiandae delectus consequatur.', 900, 0, 47, 610, 0, 1563572923, 1563753162, 0, NULL, NULL, NULL, NULL, 1, '0'),
(304, 'id_205', 'Id numquam hic praesentium ut eveniet et eos autem quas labore.', 107, 'Dolores eligendi et quae omnis recusandae molestias id.', 260, 30, 49, 670, 0, 1563572923, 1563785849, 0, NULL, NULL, NULL, NULL, 1, '0'),
(305, 'beatae_235', NULL, 125, 'Quia tempora autem nihil enim aperiam qui.', 720, 0, 3, 930, 0, 1563572923, 1564148136, 0, NULL, NULL, NULL, NULL, 1, '0'),
(306, 'omnis_869', NULL, 109, 'Ut veniam ad nihil cupiditate sit est est.', 770, 0, 9, 600, 0, 1563572923, 1563824798, 0, NULL, NULL, NULL, NULL, 1, '0'),
(307, 'fuga_324', NULL, 107, 'Velit at in natus distinctio.', 790, 0, 0, 290, 0, 1563572924, 1564288739, 0, NULL, NULL, NULL, NULL, 0, '0'),
(308, 'autem_131', 'Ad eum aut quos quia accusamus.', 107, 'Natus aut tempora excepturi voluptatem dicta.', 480, 0, 0, 900, 1, 1563572924, 1563978947, 0, NULL, NULL, NULL, NULL, 0, '0'),
(309, 'ad_986', NULL, 114, 'Nulla illum facere omnis a.', 750, 0, 0, 170, 0, 1563572924, 1564111274, 0, NULL, NULL, NULL, NULL, 0, '0'),
(310, 'cum_422', NULL, 111, 'Quidem quo delectus molestiae incidunt sit sunt.', 280, 41, 19, 440, 0, 1563572924, 1563777526, 0, NULL, NULL, NULL, NULL, 0, '0'),
(311, 'dolorem_504', NULL, 114, 'Esse qui incidunt blanditiis et.', 300, 0, 0, 420, 1, 1563572924, 1563721126, 0, NULL, NULL, NULL, NULL, 0, '0'),
(312, 'exercitationem_415', 'Officiis aut autem et dolores molestiae dolorem tempore.', 111, 'Exercitationem consectetur omnis sit corrupti corporis ad sint.', 740, 17, 0, 640, 0, 1563572924, 1564316411, 0, NULL, NULL, NULL, NULL, 0, '0'),
(313, 'modi_730', NULL, 119, 'Sunt eum perspiciatis qui eligendi commodi.', 410, 0, 27, 70, 0, 1563572924, 1563689262, 1, NULL, NULL, NULL, NULL, 1, '0'),
(314, 'temporibus_422', 'Sit delectus dolorem voluptas rerum velit et suscipit similique adipisci enim.', 119, 'Consequuntur tenetur soluta commodi delectus quos aut.', 340, 29, 0, 690, 1, 1563572924, 1563998975, 0, NULL, NULL, NULL, NULL, 1, '0'),
(315, 'repellat_297', 'Et id et consequatur et voluptatem reiciendis itaque sapiente dolores.', 119, 'Perferendis voluptatibus libero quas incidunt facilis veritatis corrupti.', 630, 3, 8, 450, 1, 1563572924, 1564021427, 0, NULL, NULL, NULL, NULL, 0, '0'),
(316, 'sequi_340', NULL, 116, 'In qui cupiditate et accusantium qui aliquid facere.', 710, 0, 0, 870, 1, 1563572924, 1563838851, 0, NULL, NULL, NULL, NULL, 0, '0'),
(317, 'autem_619', 'Illo enim nobis quos error distinctio omnis ratione esse voluptas.', 113, 'Suscipit quae consequatur non vel sed suscipit quidem.', 630, 31, 39, 840, 0, 1563572924, 1563863218, 0, NULL, NULL, NULL, NULL, 1, '0'),
(318, 'aut_393', NULL, 106, 'Est cum consequatur totam omnis et.', 50, 21, 0, 340, 1, 1563572924, 1564029235, 0, NULL, NULL, NULL, NULL, 1, '0'),
(319, 'veritatis_955', NULL, 123, 'Nostrum culpa sunt consequatur quasi ipsum.', 850, 30, 0, 540, 1, 1563572924, 1564555460, 0, NULL, NULL, NULL, NULL, 0, '0'),
(320, 'facere_145', 'Expedita voluptatibus in mollitia corrupti a et.', 110, 'Doloribus quo rerum eum delectus omnis est odit et.', 120, 31, 0, 930, 0, 1563572924, 1563914161, 0, NULL, NULL, NULL, NULL, 1, '0'),
(321, 'et_218', NULL, 110, 'Dolores voluptas dolor maxime voluptates ut nihil ratione.', 450, 0, 26, 820, 1, 1563572924, 1564500769, 0, NULL, NULL, NULL, NULL, 0, '0'),
(322, 'eligendi_164', NULL, 116, 'Consequatur necessitatibus quia veniam.', 310, 0, 0, 540, 0, 1563572924, 1563877211, 0, NULL, NULL, NULL, NULL, 0, '0'),
(323, 'ab_484', NULL, 116, 'Placeat voluptatem dignissimos qui eum culpa iste.', 210, 0, 0, 530, 0, 1563572924, 1563942406, 0, NULL, NULL, NULL, NULL, 1, '0'),
(324, 'asperiores_613', 'Architecto sunt nam maiores est beatae dolorum atque quam doloremque.', 114, 'Et inventore esse sapiente nihil dolore fugiat accusantium.', 420, 29, 33, 120, 1, 1563572924, 1564360145, 0, NULL, NULL, NULL, NULL, 1, '0'),
(325, 'corporis_857', NULL, 118, 'Ea beatae est facilis velit eos est.', 770, 0, 0, 630, 1, 1563572924, 1564124690, 0, NULL, NULL, NULL, NULL, 1, '0'),
(326, 'id_581', NULL, 114, 'Occaecati qui ut harum et.', 70, 0, 2, 880, 0, 1563572924, 1564239987, 0, NULL, NULL, NULL, NULL, 0, '0'),
(327, 'illum_247', NULL, 120, 'Animi at hic fuga et.', 210, 49, 0, 380, 0, 1563572924, 1563959656, 0, NULL, NULL, NULL, NULL, 1, '0'),
(328, 'et_946', NULL, 115, 'Recusandae neque voluptate nemo in eaque dolorum consequatur.', 680, 29, 30, 320, 0, 1563572924, 1563944393, 0, NULL, NULL, NULL, NULL, 1, '0'),
(329, 'delectus_757', 'Est accusantium ut quasi numquam facilis aut nesciunt est velit repellendus.', 116, 'Et laboriosam molestiae perspiciatis consequuntur.', 800, 41, 2, 680, 1, 1563572924, 1563790830, 0, NULL, NULL, NULL, NULL, 0, '0'),
(330, 'deserunt_195', 'Fugiat consequatur quod nulla ipsam hic.', 106, 'Nam adipisci est incidunt voluptatum.', 670, 45, 37, 220, 1, 1563572924, 1564304772, 0, NULL, NULL, NULL, NULL, 0, '0'),
(331, 'quaerat_785', 'Unde nemo labore et inventore esse quaerat illo sit voluptate.', 106, 'In blanditiis aut ut reiciendis eius dolores repudiandae.', 880, 31, 0, 230, 1, 1563572924, 1563958407, 0, NULL, NULL, NULL, NULL, 0, '0'),
(332, 'consequatur_766', NULL, 116, 'Voluptatum dolorem iste amet et incidunt aut.', 890, 0, 0, 660, 1, 1563572924, 1564233725, 0, NULL, NULL, NULL, NULL, 1, '0'),
(333, 'qui_365', NULL, 116, 'Alias voluptas ut non sapiente debitis.', 670, 47, 26, 530, 0, 1563572924, 1564325690, 0, NULL, NULL, NULL, NULL, 1, '0'),
(334, 'totam_213', 'Impedit non autem eum recusandae aspernatur qui id doloribus ipsa fugiat.', 107, 'Sequi explicabo eaque et laborum unde iure id.', 120, 0, 22, 760, 0, 1563572924, 1564144459, 0, NULL, NULL, NULL, NULL, 1, '0'),
(335, 'est_128', 'Ducimus qui eligendi alias similique non est consequatur.', 122, 'Repudiandae odit expedita est vitae debitis non.', 90, 35, 0, 520, 1, 1563572924, 1563960362, 0, NULL, NULL, NULL, NULL, 1, '0'),
(336, 'ipsam_203', NULL, 119, 'Aspernatur voluptate quos odit sed quibusdam ullam.', 630, 0, 0, 570, 0, 1563572924, 1563677877, 1, NULL, NULL, NULL, NULL, 0, '0'),
(337, 'ut_893', NULL, 107, 'Sunt sunt odit totam alias et aut dolor.', 410, 5, 0, 610, 0, 1563572924, 1563876558, 0, NULL, NULL, NULL, NULL, 1, '0'),
(338, 'odio_850', 'Cumque quia est autem totam dolor nihil sit similique voluptatem porro.', 113, 'Animi quia soluta quod eum.', 290, 0, 49, 320, 0, 1563572924, 1563836140, 0, NULL, NULL, NULL, NULL, 1, '0'),
(339, 'quae_217', 'Aspernatur officiis error soluta pariatur maiores.', 125, 'Dolorem et ducimus explicabo minima magnam.', 570, 10, 36, 820, 1, 1563572924, 1564201943, 0, NULL, NULL, NULL, NULL, 1, '0'),
(340, 'optio_893', NULL, 120, 'Repudiandae qui nisi voluptate adipisci.', 100, 45, 0, 390, 1, 1563572924, 1564001186, 0, NULL, NULL, NULL, NULL, 0, '0'),
(341, 'aliquid_667', 'Quam asperiores velit omnis cumque quibusdam voluptatem qui sunt alias.', 117, 'Voluptatem sit distinctio dicta magnam.', 650, 0, 28, 980, 0, 1563572924, 1564192407, 0, NULL, NULL, NULL, NULL, 1, '0'),
(342, 'voluptas_338', NULL, 118, 'Nesciunt maxime illo deserunt vitae dolores.', 60, 0, 17, 910, 0, 1563572924, 1564544035, 0, NULL, NULL, NULL, NULL, 1, '0'),
(343, 'dolorum_322', NULL, 113, 'Nobis quo numquam ut autem.', 50, 39, 2, 580, 0, 1563572925, 1564542701, 0, NULL, NULL, NULL, NULL, 0, '0'),
(344, 'nemo_510', NULL, 105, 'Voluptas magnam adipisci nemo quasi quo qui.', 570, 0, 0, 780, 1, 1563572925, 1564237421, 0, NULL, NULL, NULL, NULL, 0, '0'),
(345, 'facilis_193', 'Ad voluptatem et adipisci impedit vel ad est.', 106, 'Aut laborum quasi explicabo et nisi nihil qui.', 220, 47, 0, 640, 0, 1563572925, 1564178385, 0, NULL, NULL, NULL, NULL, 1, '0'),
(346, 'omnis_777', NULL, 125, 'Fugiat est fugit vel veritatis et eum.', 210, 0, 0, 450, 0, 1563572925, 1564343708, 0, NULL, NULL, NULL, NULL, 0, '0'),
(347, 'nesciunt_602', NULL, 114, 'Quia sit ea blanditiis nihil.', 650, 8, 13, 700, 0, 1563572925, 1563802231, 0, NULL, NULL, NULL, NULL, 1, '0'),
(348, 'voluptatem_180', NULL, 114, 'Totam eveniet nihil ipsum quia nostrum.', 400, 0, 0, 850, 0, 1563572925, 1564255267, 0, NULL, NULL, NULL, NULL, 1, '0'),
(349, 'nesciunt_391', 'Vero eos omnis nulla dolorem atque fugit illum ut asperiores labore.', 106, 'Atque sunt illo illo enim natus eos modi.', 390, 0, 1, 600, 0, 1563572925, 1564232478, 0, NULL, NULL, NULL, NULL, 1, '0'),
(350, 'quae_311', NULL, 116, 'Ut vitae est minima qui.', 830, 0, 5, 390, 0, 1563572925, 1564547619, 0, NULL, NULL, NULL, NULL, 1, '0'),
(351, 'itaque_669', NULL, 124, 'Cum laudantium dolor aut vel.', 920, 21, 19, 590, 0, 1563572925, 1564486294, 0, NULL, NULL, NULL, NULL, 0, '0'),
(352, 'modi_939', 'Rerum suscipit aut facere ipsum in quia ut voluptatem omnis aut.', 117, 'Aut aut facere et repudiandae commodi provident.', 100, 20, 0, 800, 0, 1563572925, 1564390051, 0, NULL, NULL, NULL, NULL, 1, '0'),
(353, 'enim_336', 'Nam aut harum modi voluptatem nobis sit dolores omnis aut.', 123, 'Praesentium alias facere omnis soluta.', 500, 31, 18, 680, 1, 1563572925, 1563765893, 0, NULL, NULL, NULL, NULL, 1, '0'),
(354, 'minima_534', 'Odio omnis quos suscipit deserunt facilis necessitatibus.', 125, 'Voluptas iste adipisci pariatur mollitia facilis laudantium.', 630, 0, 0, 340, 1, 1563572925, 1564065502, 0, NULL, NULL, NULL, NULL, 0, '0'),
(355, 'sint_147', 'Omnis voluptatibus qui aspernatur consequatur nesciunt sint.', 119, 'Molestias culpa doloremque est maiores praesentium.', 280, 18, 17, 530, 0, 1563572925, 1563712994, 1, NULL, NULL, NULL, NULL, 0, '0'),
(356, 'in_383', 'Velit reiciendis dolor dolores et et et et eos assumenda voluptatibus unde.', 110, 'Voluptate itaque aperiam et et placeat ab et.', 920, 3, 35, 840, 1, 1563572925, 1564397151, 0, NULL, NULL, NULL, NULL, 1, '0'),
(357, 'odio_920', 'Et earum repellendus exercitationem cumque magnam et voluptas rerum et corrupti.', 114, 'In eaque aut molestias quia.', 60, 0, 50, 410, 0, 1563572925, 1563971961, 0, NULL, NULL, NULL, NULL, 1, '0'),
(358, 'dolore_658', 'Earum minima aut repellendus ut fugit qui repellendus a recusandae error.', 114, 'Laborum error laborum cumque ut.', 160, 46, 25, 510, 0, 1563572925, 1563753306, 0, NULL, NULL, NULL, NULL, 1, '0'),
(359, 'aut_857', 'Aut itaque provident exercitationem et pariatur.', 111, 'Nam voluptatum architecto eveniet inventore minus.', 320, 22, 0, 420, 1, 1563572925, 1564314274, 0, NULL, NULL, NULL, NULL, 0, '0'),
(360, 'adipisci_503', 'Pariatur animi voluptatem architecto quia sed numquam.', 105, 'Officiis doloribus delectus et voluptatum.', 690, 0, 0, 800, 1, 1563572925, 1564432221, 0, NULL, NULL, NULL, NULL, 1, '0'),
(361, 'autem_460', 'Rerum est non et ducimus reiciendis architecto non aut aliquid.', 115, 'Ipsam repellat illum velit.', 980, 0, 0, 330, 1, 1563572925, 1563725723, 0, NULL, NULL, NULL, NULL, 0, '0'),
(362, 'praesentium_187', 'Facilis inventore praesentium et voluptatem sapiente totam laborum sint.', 120, 'Et eos dolor deleniti magnam corporis quia.', 340, 2, 0, 270, 1, 1563572925, 1563978215, 0, NULL, NULL, NULL, NULL, 1, '0'),
(363, 'ad_625', NULL, 123, 'Nesciunt qui quae quas culpa voluptatem sequi.', 440, 37, 18, 960, 0, 1563572925, 1564425720, 0, NULL, NULL, NULL, NULL, 1, '0'),
(364, 'dolores_411', NULL, 117, 'Dolorem deleniti aut dolorum exercitationem atque veniam officia.', 50, 22, 0, 270, 0, 1563572925, 1564156685, 0, NULL, NULL, NULL, NULL, 0, '0'),
(365, 'nisi_201', NULL, 106, 'Et exercitationem aut quae ipsa est nam minima.', 360, 6, 49, 230, 1, 1563572925, 1564235282, 0, NULL, NULL, NULL, NULL, 0, '0'),
(366, 'aut_985', NULL, 122, 'Voluptatibus odit unde earum incidunt perferendis error qui.', 380, 45, 8, 610, 1, 1563572925, 1564428250, 0, NULL, NULL, NULL, NULL, 1, '0'),
(367, 'culpa_835', NULL, 125, 'Exercitationem delectus quos molestias mollitia sit dolores.', 800, 0, 0, 520, 0, 1563572925, 1564316823, 0, NULL, NULL, NULL, NULL, 1, '0'),
(368, 'ducimus_337', 'Occaecati dicta est blanditiis laborum fugiat magnam voluptatum.', 108, 'Dolore et ipsa vitae quo et sapiente.', 410, 22, 0, 600, 0, 1563572925, 1563832620, 0, NULL, NULL, NULL, NULL, 1, '0'),
(369, 'sed_707', 'Maxime praesentium saepe excepturi illum non similique ex quo.', 113, 'Sunt laboriosam temporibus cupiditate laborum iure consequatur.', 50, 43, 0, 420, 1, 1563572925, 1564313235, 0, NULL, NULL, NULL, NULL, 1, '0'),
(370, 'accusantium_268', NULL, 122, 'Libero et sit aperiam pariatur.', 240, 0, 6, 110, 1, 1563572925, 1563946099, 0, NULL, NULL, NULL, NULL, 0, '0'),
(371, 'consequatur_417', NULL, 120, 'Reprehenderit vero maxime iure accusantium et neque illo laudantium.', 270, 8, 0, 250, 1, 1563572925, 1563779316, 0, NULL, NULL, NULL, NULL, 0, '0'),
(372, 'quis_231', 'Quia ipsam est enim eos ut corporis inventore ut expedita reprehenderit.', 117, 'Ut ut rem magnam fugit velit aut.', 470, 3, 0, 1000, 0, 1563572925, 1563785752, 0, NULL, NULL, NULL, NULL, 1, '0'),
(373, 'necessitatibus_722', NULL, 122, 'Architecto nostrum necessitatibus quibusdam iure cupiditate inventore cumque atque.', 570, 0, 0, 670, 1, 1563572925, 1563748215, 0, NULL, NULL, NULL, NULL, 1, '0'),
(374, 'reprehenderit_305', 'Voluptatem eum eos rerum ut qui dolores rem nihil.', 118, 'Magnam dolore dolor perspiciatis dolor optio nesciunt quo.', 630, 40, 20, 780, 1, 1563572925, 1564252117, 0, NULL, NULL, NULL, NULL, 1, '0'),
(375, 'atque_688', 'Possimus excepturi voluptatum velit voluptatum iste labore iusto impedit.', 113, 'Cum voluptas maxime et pariatur eligendi ut.', 730, 0, 0, 130, 1, 1563572925, 1563803078, 0, NULL, NULL, NULL, NULL, 0, '0'),
(376, 'repellendus_981', 'Nihil earum sed vero blanditiis quis.', 116, 'Aliquam sed vitae voluptatum ipsam.', 430, 0, 0, 570, 1, 1563572925, 1564544396, 0, NULL, NULL, NULL, NULL, 0, '0'),
(377, 'consequatur_703', NULL, 106, 'Magnam deleniti quo molestiae dolorum et.', 900, 15, 0, 460, 0, 1563572925, 1564278309, 0, NULL, NULL, NULL, NULL, 0, '0'),
(378, 'amet_310', NULL, 111, 'Et occaecati impedit ut sint consectetur.', 660, 0, 2, 250, 0, 1563572925, 1564344083, 0, NULL, NULL, NULL, NULL, 0, '0'),
(379, 'dolorem_115', NULL, 125, 'Aspernatur assumenda vitae molestias quos atque.', 730, 0, 0, 330, 0, 1563572925, 1563829585, 0, NULL, NULL, NULL, NULL, 0, '0'),
(380, 'labore_344', 'Laborum et labore sed hic impedit nihil eum.', 106, 'Perferendis officia fugiat esse officia sunt et.', 770, 0, 7, 820, 1, 1563572925, 1563798893, 0, NULL, NULL, NULL, NULL, 1, '0'),
(381, 'expedita_961', NULL, 117, 'Dolor et et at vero voluptatem non ducimus.', 710, 2, 47, 110, 0, 1563572926, 1563944344, 0, NULL, NULL, NULL, NULL, 0, '0'),
(382, 'dolor_554', NULL, 116, 'Esse quis amet laboriosam saepe asperiores consequatur.', 200, 34, 23, 580, 1, 1563572926, 1564457460, 0, NULL, NULL, NULL, NULL, 0, '0'),
(383, 'est_450', NULL, 107, 'Enim esse vel cum et maxime qui.', 160, 27, 24, 380, 0, 1563572926, 1564410528, 0, NULL, NULL, NULL, NULL, 0, '0'),
(384, 'ut_849', 'Consequuntur voluptas odit omnis aut quasi voluptatibus.', 123, 'Voluptatem facere asperiores adipisci cupiditate.', 770, 13, 0, 550, 0, 1563572926, 1563849174, 0, NULL, NULL, NULL, NULL, 0, '0'),
(385, 'ipsa_142', 'Velit in molestiae eligendi tempora omnis molestiae et eum quas.', 115, 'Et autem nulla sint doloremque mollitia natus.', 340, 7, 0, 620, 1, 1563572926, 1563732963, 0, NULL, NULL, NULL, NULL, 1, '0'),
(386, 'sint_586', 'Odio est eos commodi magni aut sit.', 125, 'Harum a deserunt et exercitationem accusamus perferendis.', 810, 0, 0, 770, 1, 1563572926, 1564294530, 0, NULL, NULL, NULL, NULL, 1, '0'),
(387, 'magnam_598', NULL, 116, 'Odio sed provident maxime tenetur consectetur.', 430, 0, 44, 550, 1, 1563572926, 1564388873, 0, NULL, NULL, NULL, NULL, 0, '0'),
(388, 'et_878', NULL, 108, 'Nulla qui accusamus impedit rerum.', 300, 0, 0, 290, 0, 1563572926, 1564018207, 0, NULL, NULL, NULL, NULL, 0, '0'),
(389, 'eum_933', NULL, 114, 'Eaque dolores vel quos beatae quos corrupti occaecati cumque.', 800, 5, 0, 760, 0, 1563572926, 1564353485, 0, NULL, NULL, NULL, NULL, 0, '0'),
(390, 'inventore_228', NULL, 123, 'Maxime quis sint autem soluta nobis.', 480, 6, 0, 1000, 0, 1563572926, 1564334458, 0, NULL, NULL, NULL, NULL, 0, '0'),
(391, 'vero_976', NULL, 117, 'Aliquid eum aspernatur sed voluptas omnis.', 810, 0, 5, 970, 1, 1563572926, 1563714906, 0, NULL, NULL, NULL, NULL, 0, '0'),
(392, 'nihil_982', 'A architecto corporis et sunt fugiat.', 112, 'Debitis porro nisi voluptatem ipsum dignissimos.', 290, 20, 45, 360, 1, 1563572926, 1563743810, 0, NULL, NULL, NULL, NULL, 1, '0'),
(393, 'quidem_655', NULL, 117, 'Repellendus aspernatur quasi molestiae fugit.', 430, 0, 0, 190, 1, 1563572926, 1563932505, 0, NULL, NULL, NULL, NULL, 0, '0'),
(394, 'molestiae_837', 'Quidem adipisci temporibus sed voluptatem nobis qui.', 116, 'Quibusdam labore sed laudantium nihil quas voluptatem.', 390, 47, 42, 810, 0, 1563572926, 1564057852, 0, NULL, NULL, NULL, NULL, 0, '0'),
(395, 'et_916', NULL, 116, 'Veniam laboriosam iste voluptate facere amet.', 170, 0, 0, 820, 0, 1563572926, 1564522233, 0, NULL, NULL, NULL, NULL, 1, '0'),
(396, 'facilis_339', NULL, 107, 'Eum voluptas quibusdam eius fugit molestiae.', 80, 28, 50, 990, 1, 1563572926, 1563964537, 0, NULL, NULL, NULL, NULL, 1, '0'),
(397, 'enim_379', 'Ducimus dolores magni aut et quas nulla dignissimos cupiditate expedita doloremque.', 120, 'Ipsa necessitatibus ea quia reiciendis.', 870, 48, 0, 100, 1, 1563572926, 1563963933, 0, NULL, NULL, NULL, NULL, 1, '0'),
(398, 'rem_385', NULL, 120, 'Est nisi quae eaque doloremque error perferendis reiciendis.', 660, 4, 0, 440, 1, 1563572926, 1563885003, 0, NULL, NULL, NULL, NULL, 0, '0'),
(399, 'dolores_350', NULL, 120, 'Quis dolore provident rerum.', 120, 19, 0, 660, 1, 1563572926, 1564096517, 0, NULL, NULL, NULL, NULL, 0, '0'),
(400, 'ratione_325', NULL, 105, 'In ex porro veniam.', 170, 0, 8, 210, 0, 1563572926, 1563907177, 0, NULL, NULL, NULL, NULL, 0, '0'),
(401, 'et_910', NULL, 107, 'Atque facere quia aliquam nobis velit repudiandae.', 270, 0, 0, 240, 0, 1563572926, 1564571020, 0, NULL, NULL, NULL, NULL, 0, '0'),
(402, 'et_423', 'Et voluptatem voluptatem non omnis commodi sunt voluptatem voluptatum.', 125, 'Ut molestiae est magnam sint et et et.', 1000, 12, 41, 540, 1, 1563572926, 1564156868, 0, NULL, NULL, NULL, NULL, 0, '0'),
(403, 'pariatur_587', NULL, 105, 'Suscipit nemo assumenda porro saepe perferendis at voluptatem et.', 200, 30, 0, 670, 0, 1563572926, 1563919958, 0, NULL, NULL, NULL, NULL, 0, '0'),
(404, 'unde_750', 'Cumque ipsa animi sed amet aut ab minima doloribus.', 116, 'Optio debitis cum nam perspiciatis nostrum omnis harum.', 660, 39, 0, 320, 0, 1563572926, 1564421033, 0, NULL, NULL, NULL, NULL, 0, '0'),
(405, 'reiciendis_417', NULL, 122, 'Quia corrupti in eum ut ut.', 320, 41, 19, 270, 0, 1563572926, 1564375217, 0, NULL, NULL, NULL, NULL, 1, '0'),
(406, 'ex_822', 'Laborum magni facere dicta ut saepe qui necessitatibus laudantium.', 110, 'Adipisci pariatur qui eos sit dolores.', 840, 16, 26, 140, 0, 1563572926, 1563794473, 0, NULL, NULL, NULL, NULL, 0, '0'),
(407, 'incidunt_178', 'Temporibus animi doloribus maxime exercitationem quia.', 112, 'Eius est et inventore ad architecto.', 930, 0, 29, 530, 0, 1563572926, 1563958489, 0, NULL, NULL, NULL, NULL, 0, '0'),
(408, 'at_769', NULL, 110, 'Ut sint commodi maxime et.', 840, 6, 0, 260, 0, 1563572926, 1564252119, 0, NULL, NULL, NULL, NULL, 1, '0'),
(409, 'sunt_793', NULL, 117, 'Molestias ea dolor id repellat.', 340, 24, 0, 80, 0, 1563572926, 1563807220, 0, NULL, NULL, NULL, NULL, 0, '0'),
(410, 'aperiam_442', 'Quia eveniet rerum necessitatibus consequatur vel nihil atque in harum.', 109, 'Autem inventore labore et excepturi.', 650, 0, 0, 460, 0, 1563572926, 1563926315, 0, NULL, NULL, NULL, NULL, 1, '0'),
(411, 'quis_179', NULL, 116, 'Ullam dolores qui neque quia et blanditiis consequatur at.', 910, 45, 8, 300, 0, 1563572927, 1563982954, 0, NULL, NULL, NULL, NULL, 1, '0'),
(412, 'et_589', NULL, 114, 'Qui sint et et et harum distinctio.', 760, 0, 0, 310, 0, 1563572927, 1564498061, 0, NULL, NULL, NULL, NULL, 0, '0'),
(413, 'sit_703', NULL, 112, 'Itaque aliquam repudiandae et quasi.', 120, 0, 13, 90, 0, 1563572927, 1563674019, 1, NULL, NULL, NULL, NULL, 0, '0'),
(414, 'sunt_766', NULL, 120, 'Quis quam fugiat veritatis id.', 260, 0, 20, 760, 1, 1563572927, 1563724420, 0, NULL, NULL, NULL, NULL, 1, '0'),
(415, 'magni_231', 'Consectetur cumque autem perferendis modi nihil beatae.', 106, 'Molestiae reiciendis dolorum aut impedit qui voluptates.', 380, 35, 0, 140, 0, 1563572927, 1563838710, 0, NULL, NULL, NULL, NULL, 1, '0'),
(416, 'vero_413', NULL, 117, 'Dolorum illo odio blanditiis aliquam.', 90, 0, 35, 50, 1, 1563572927, 1564433630, 0, NULL, NULL, NULL, NULL, 0, '0'),
(417, 'adipisci_879', NULL, 116, 'Ipsum dicta ea eaque debitis est consectetur.', 810, 0, 35, 390, 1, 1563572927, 1564158145, 0, NULL, NULL, NULL, NULL, 0, '0'),
(418, 'non_169', 'Voluptate sapiente ab est possimus pariatur eveniet aut.', 106, 'Suscipit qui facere cupiditate maiores autem soluta laboriosam facilis.', 800, 31, 44, 60, 1, 1563572927, 1564109573, 0, NULL, NULL, NULL, NULL, 1, '0'),
(419, 'qui_529', 'Necessitatibus quo rerum quia et sint aliquid.', 123, 'Magni qui nihil neque quo.', 110, 0, 22, 340, 0, 1563572927, 1564159013, 0, NULL, NULL, NULL, NULL, 1, '0'),
(420, 'vitae_426', 'Consequatur quod nam quia qui maiores quisquam.', 124, 'Incidunt quod corrupti explicabo voluptatem soluta dignissimos.', 580, 15, 30, 980, 0, 1563572927, 1564261995, 0, NULL, NULL, NULL, NULL, 0, '0'),
(421, 'rerum_728', NULL, 124, 'Corporis fugit porro et omnis exercitationem quam ullam.', 770, 0, 36, 430, 1, 1563572927, 1563848528, 0, NULL, NULL, NULL, NULL, 0, '0'),
(422, 'optio_433', 'Vel sunt quas officia cupiditate quo ut aut.', 124, 'Inventore ut facere quia dolores voluptas quam.', 230, 0, 0, 340, 1, 1563572927, 1564258511, 0, NULL, NULL, NULL, NULL, 0, '0'),
(423, 'debitis_483', NULL, 118, 'Numquam laborum eum et blanditiis tenetur harum.', 460, 50, 38, 420, 0, 1563572927, 1563947484, 0, NULL, NULL, NULL, NULL, 1, '0'),
(424, 'incidunt_960', 'Nostrum quidem cumque ex ut quidem nihil qui beatae vel.', 115, 'Porro deleniti vitae nihil.', 690, 0, 0, 770, 1, 1563572927, 1564047000, 0, NULL, NULL, NULL, NULL, 0, '0'),
(425, 'dolores_103', NULL, 106, 'Veritatis et ratione animi molestias neque minus.', 340, 31, 0, 1000, 1, 1563572927, 1564486471, 0, NULL, NULL, NULL, NULL, 1, '0'),
(426, 'harum_902', 'Adipisci quam eligendi autem ipsum ut quam.', 124, 'Eum numquam sint omnis distinctio ad fugit debitis.', 760, 2, 0, 140, 0, 1563572927, 1564513620, 0, NULL, NULL, NULL, NULL, 0, '0'),
(427, 'dolores_384', 'Sunt eaque cum mollitia veritatis occaecati dolorem cupiditate.', 122, 'Animi qui animi nihil debitis vitae ut alias.', 240, 31, 0, 370, 1, 1563572927, 1564283737, 0, NULL, NULL, NULL, NULL, 0, '0'),
(428, 'dolorem_457', NULL, 121, 'Blanditiis sed rerum blanditiis delectus.', 360, 2, 45, 640, 0, 1563572927, 1564175018, 0, NULL, NULL, NULL, NULL, 1, '0'),
(429, 'ad_779', NULL, 111, 'Nobis sit dolor unde dolorum dolores.', 770, 45, 5, 440, 1, 1563572927, 1564465188, 0, NULL, NULL, NULL, NULL, 0, '0'),
(430, 'blanditiis_726', 'Non officiis impedit rerum repellat consequatur quis officia rem nisi corporis.', 115, 'Perferendis natus sed voluptatem occaecati quia rerum omnis vel.', 750, 17, 2, 710, 0, 1563572927, 1563704462, 1, NULL, NULL, NULL, NULL, 0, '0'),
(431, 'ipsa_835', 'Dolorum quibusdam cum dolor et sunt ducimus est quod.', 114, 'Sapiente beatae nesciunt dicta quibusdam ut temporibus.', 220, 0, 5, 940, 1, 1563572927, 1564324430, 0, NULL, NULL, NULL, NULL, 1, '0'),
(432, 'ut_517', 'Iusto iure cumque dicta repellendus qui a eum ut fugit enim.', 114, 'Laudantium vero explicabo laudantium.', 580, 0, 27, 130, 1, 1563572927, 1563890299, 0, NULL, NULL, NULL, NULL, 1, '0'),
(433, 'minus_673', 'Sed neque vel cum harum voluptatibus enim provident beatae sed ducimus.', 123, 'Iste cupiditate quia mollitia dignissimos est doloremque mollitia.', 270, 0, 0, 800, 1, 1563572927, 1563888346, 0, NULL, NULL, NULL, NULL, 0, '0'),
(434, 'facilis_980', NULL, 113, 'Vero praesentium voluptatem ut vero.', 80, 44, 40, 290, 1, 1563572927, 1563678209, 0, NULL, NULL, NULL, NULL, 1, '0'),
(435, 'fugiat_205', 'Mollitia et voluptate molestiae dolorum.', 120, 'Dolorum quaerat provident sit eaque.', 810, 0, 0, 160, 1, 1563572927, 1563795442, 0, NULL, NULL, NULL, NULL, 0, '0'),
(436, 'animi_145', 'Explicabo sed nisi ipsam eos modi nostrum nemo.', 125, 'Voluptas unde deleniti et et.', 100, 20, 0, 330, 1, 1563572927, 1564241256, 0, NULL, NULL, NULL, NULL, 0, '0'),
(437, 'dolores_991', NULL, 106, 'Sunt illum eaque harum praesentium earum.', 920, 0, 0, 740, 1, 1563572927, 1564301924, 0, NULL, NULL, NULL, NULL, 0, '0'),
(438, 'ipsam_431', 'Qui incidunt rem qui quo temporibus voluptatem vel est et sint.', 123, 'Ea sint velit incidunt dolorem omnis atque.', 560, 0, 0, 450, 0, 1563572927, 1563998072, 0, NULL, NULL, NULL, NULL, 1, '0'),
(439, 'inventore_384', NULL, 120, 'Omnis et quam quia aut.', 830, 4, 13, 140, 1, 1563572927, 1564133895, 0, NULL, NULL, NULL, NULL, 0, '0'),
(440, 'distinctio_134', 'Totam voluptatem velit culpa qui.', 116, 'Ut vel esse necessitatibus voluptatem veritatis.', 980, 9, 26, 820, 0, 1563572927, 1563873507, 0, NULL, NULL, NULL, NULL, 1, '0'),
(441, 'non_154', 'Minus officia corporis ab ullam enim ut neque excepturi atque non.', 117, 'Aut minima ad molestiae unde velit.', 980, 9, 35, 650, 0, 1563572927, 1564463176, 0, NULL, NULL, NULL, NULL, 0, '0'),
(442, 'sunt_548', 'Impedit sint consectetur sed aut quos laborum consequuntur ad odio praesentium.', 121, 'Aliquid voluptatem aut voluptatem commodi.', 430, 0, 14, 480, 0, 1563572927, 1563698534, 1, NULL, NULL, NULL, NULL, 1, '0'),
(443, 'alias_266', 'Nam tempore natus officia natus ea possimus.', 118, 'Ipsam eum dignissimos quam possimus.', 840, 0, 16, 690, 0, 1563572927, 1563820848, 0, NULL, NULL, NULL, NULL, 0, '0'),
(444, 'quis_717', NULL, 109, 'Quasi sit ratione aut aliquid.', 210, 19, 30, 570, 1, 1563572927, 1564065873, 0, NULL, NULL, NULL, NULL, 0, '0'),
(445, 'soluta_763', NULL, 123, 'Sit ipsa temporibus exercitationem.', 290, 0, 13, 630, 0, 1563572927, 1564066851, 0, NULL, NULL, NULL, NULL, 1, '0'),
(446, 'ex_141', 'Repudiandae aut eaque libero aut sint rerum.', 125, 'Quisquam illum error ad quia.', 280, 47, 48, 380, 1, 1563572927, 1564286300, 0, NULL, NULL, NULL, NULL, 1, '0'),
(447, 'neque_618', NULL, 124, 'Esse in cum ipsam delectus aut.', 880, 0, 21, 370, 1, 1563572927, 1564013059, 0, NULL, NULL, NULL, NULL, 1, '0'),
(448, 'commodi_775', 'Quia beatae quo corrupti rerum et quaerat vel.', 123, 'Amet ea sed enim maiores non voluptate quos quia.', 230, 30, 0, 320, 0, 1563572928, 1564342674, 0, NULL, NULL, NULL, NULL, 0, '0'),
(449, 'aspernatur_727', NULL, 123, 'Et est fugiat sed sed.', 80, 0, 0, 240, 0, 1563572928, 1564032307, 0, NULL, NULL, NULL, NULL, 0, '0'),
(450, 'repellat_432', NULL, 118, 'Cumque et natus quia vel corporis qui.', 540, 29, 0, 960, 1, 1563572928, 1564138927, 0, NULL, NULL, NULL, NULL, 0, '0'),
(451, 'impedit_249', NULL, 118, 'Est recusandae provident natus accusantium.', 710, 0, 0, 500, 0, 1563572928, 1563934055, 0, NULL, NULL, NULL, NULL, 1, '0'),
(452, 'occaecati_111', 'Eos saepe exercitationem qui ipsam veritatis hic.', 123, 'Officiis voluptatibus corporis iste dolorum.', 670, 0, 13, 400, 0, 1563572928, 1563958159, 0, NULL, NULL, NULL, NULL, 0, '0'),
(453, 'beatae_524', NULL, 114, 'Molestias animi mollitia sit voluptatem.', 140, 25, 0, 350, 0, 1563572928, 1564462547, 0, NULL, NULL, NULL, NULL, 0, '0'),
(454, 'unde_430', NULL, 106, 'Non dolorem aut deleniti sapiente.', 390, 4, 0, 610, 1, 1563572928, 1564367740, 0, NULL, NULL, NULL, NULL, 0, '0'),
(455, 'non_495', 'Ullam ut fuga voluptatem velit itaque quas ut similique.', 123, 'Et hic tempore dolores dolorem recusandae.', 550, 0, 0, 540, 1, 1563572928, 1564097704, 0, NULL, NULL, NULL, NULL, 1, '0'),
(456, 'ratione_940', NULL, 111, 'Temporibus est modi asperiores mollitia omnis est.', 390, 42, 37, 240, 1, 1563572928, 1563743689, 0, NULL, NULL, NULL, NULL, 0, '0'),
(457, 'aliquid_253', 'Ratione eos qui corporis nostrum id enim consequuntur.', 123, 'Fugiat modi illum optio aut sequi praesentium commodi consequatur.', 920, 48, 0, 920, 1, 1563572928, 1564309313, 0, NULL, NULL, NULL, NULL, 1, '0'),
(458, 'possimus_732', 'Qui minus dicta in rerum sit et et iusto laudantium sit occaecati.', 120, 'Deleniti sapiente ipsam et perspiciatis quis id a.', 120, 17, 0, 480, 1, 1563572928, 1564244416, 0, NULL, NULL, NULL, NULL, 0, '0'),
(459, 'laboriosam_910', 'Aut eos sed dolore sit ut.', 120, 'Aut accusantium facere nihil iste maxime rerum deleniti ullam.', 560, 0, 48, 110, 0, 1563572929, 1564456690, 0, NULL, NULL, NULL, NULL, 1, '0'),
(460, 'eos_148', NULL, 105, 'Qui id dolores non.', 870, 0, 8, 830, 0, 1563572929, 1564021767, 0, NULL, NULL, NULL, NULL, 0, '0'),
(461, 'voluptatem_101', 'Nam voluptas esse dolores doloremque optio.', 118, 'Ipsa aut reprehenderit voluptas ex sequi ullam.', 390, 5, 0, 870, 0, 1563572929, 1563980789, 0, NULL, NULL, NULL, NULL, 1, '0'),
(462, 'eius_696', NULL, 106, 'Placeat inventore consequuntur qui deleniti.', 280, 0, 16, 300, 1, 1563572929, 1564385709, 0, NULL, NULL, NULL, NULL, 0, '0'),
(463, 'cupiditate_897', NULL, 124, 'Nobis nam aut qui sit.', 870, 0, 50, 830, 1, 1563572929, 1564291854, 0, NULL, NULL, NULL, NULL, 0, '0'),
(464, 'occaecati_681', NULL, 116, 'Hic quas et ipsum accusamus quibusdam.', 50, 0, 0, 170, 0, 1563572929, 1564258314, 0, NULL, NULL, NULL, NULL, 1, '0'),
(465, 'cupiditate_898', 'Et veniam rem in non nobis voluptatum reprehenderit.', 122, 'Quia molestiae officia placeat voluptatem.', 230, 0, 1, 760, 1, 1563572929, 1563710251, 0, NULL, NULL, NULL, NULL, 0, '0'),
(466, 'nobis_247', 'Dolorem veritatis eligendi recusandae quo expedita qui veritatis voluptatem rerum.', 113, 'Architecto eum accusamus nobis quia recusandae possimus temporibus.', 900, 45, 20, 420, 1, 1563572929, 1564175172, 0, NULL, NULL, NULL, NULL, 1, '0'),
(467, 'maiores_431', 'Pariatur dolores consectetur mollitia sed nam id.', 106, 'Odio rem sunt iusto quisquam perspiciatis facilis.', 870, 11, 0, 180, 1, 1563572929, 1563850638, 0, NULL, NULL, NULL, NULL, 1, '0'),
(468, 'vel_384', NULL, 106, 'Enim natus fuga laboriosam dicta sint qui dolores.', 670, 0, 37, 810, 1, 1563572929, 1563985122, 0, NULL, NULL, NULL, NULL, 1, '0'),
(469, 'necessitatibus_298', 'Harum iure nobis tempore ab quis facilis iure quasi.', 106, 'Non possimus voluptatem enim cupiditate debitis laboriosam.', 320, 0, 47, 670, 1, 1563572929, 1564406152, 0, NULL, NULL, NULL, NULL, 1, '0'),
(470, 'accusantium_827', 'Vel sapiente aut voluptatibus repellendus illo veniam illum.', 120, 'Amet quia atque voluptatum sunt sint suscipit.', 520, 15, 1, 610, 1, 1563572929, 1563746070, 0, NULL, NULL, NULL, NULL, 1, '0'),
(471, 'quaerat_651', 'Neque enim maxime harum aut sit ratione.', 120, 'Amet labore aspernatur distinctio veniam inventore sed.', 160, 0, 24, 820, 1, 1563572929, 1564212567, 0, NULL, NULL, NULL, NULL, 0, '0'),
(472, 'provident_322', 'Ratione autem placeat et ut laboriosam laboriosam omnis quo quia.', 114, 'Porro aut voluptatem ut quae ut deleniti voluptate iure.', 660, 0, 41, 890, 1, 1563572929, 1564563620, 0, NULL, NULL, NULL, NULL, 1, '0'),
(473, 'rerum_562', NULL, 105, 'Exercitationem dolores autem inventore a nesciunt aut.', 90, 0, 0, 570, 0, 1563572929, 1563925089, 0, NULL, NULL, NULL, NULL, 0, '0'),
(474, 'aut_647', 'Ut aliquid ullam cumque vitae voluptatibus molestiae vitae iste sed ut eaque.', 121, 'Reiciendis quia et accusamus provident.', 960, 0, 24, 980, 1, 1563572929, 1564079639, 0, NULL, NULL, NULL, NULL, 1, '0'),
(475, 'quidem_756', 'Provident dolore natus sit est nulla.', 123, 'Modi et nisi quos in.', 200, 0, 46, 930, 1, 1563572930, 1564324120, 0, NULL, NULL, NULL, NULL, 1, '0'),
(476, 'quasi_175', 'Veritatis voluptatibus quia mollitia aut deserunt explicabo laboriosam.', 116, 'Qui quasi ab corporis quidem.', 70, 0, 18, 860, 0, 1563572930, 1564565898, 0, NULL, NULL, NULL, NULL, 1, '0'),
(477, 'quasi_791', NULL, 123, 'Numquam et quos tempore molestias.', 1000, 47, 0, 370, 0, 1563572930, 1563746261, 0, NULL, NULL, NULL, NULL, 0, '0'),
(478, 'in_547', NULL, 109, 'Quis tempora autem molestiae qui recusandae ut aut sequi.', 800, 0, 48, 320, 0, 1563572930, 1563735507, 1, NULL, NULL, NULL, NULL, 1, '0'),
(479, 'deserunt_832', 'Et in repellat possimus qui est asperiores cum consequatur.', 124, 'Et blanditiis ex numquam tempore adipisci quas blanditiis.', 660, 0, 0, 300, 0, 1563572930, 1564149796, 0, NULL, NULL, NULL, NULL, 1, '0'),
(480, 'velit_692', NULL, 105, 'Et ut reprehenderit est eos nisi voluptatem.', 700, 0, 12, 740, 0, 1563572930, 1564148808, 0, NULL, NULL, NULL, NULL, 0, '0'),
(481, 'nostrum_117', 'Sit accusamus distinctio placeat non aut minus quia quia.', 121, 'Qui molestias aut et non.', 50, 0, 0, 160, 0, 1563572930, 1564193972, 0, NULL, NULL, NULL, NULL, 1, '0'),
(482, 'aliquam_476', NULL, 114, 'Earum atque magnam commodi distinctio accusantium quaerat deleniti.', 120, 14, 0, 860, 1, 1563572930, 1564352364, 0, NULL, NULL, NULL, NULL, 1, '0'),
(483, 'rem_169', 'Nisi ut cum voluptatem animi voluptatem.', 114, 'Veritatis commodi ipsum et aliquam voluptas.', 840, 35, 0, 120, 1, 1563572930, 1564235010, 0, NULL, NULL, NULL, NULL, 1, '0'),
(484, 'et_871', 'Dolorum veritatis vero magnam vero aspernatur et eos.', 106, 'Iusto sapiente aut nihil saepe autem animi.', 860, 0, 0, 80, 1, 1563572930, 1563853518, 0, NULL, NULL, NULL, NULL, 0, '0'),
(485, 'facilis_660', 'Sint dolorem quisquam facere qui quis impedit quisquam quam facere.', 124, 'Nihil voluptatem aut reiciendis sint.', 410, 0, 7, 190, 1, 1563572930, 1564079067, 0, NULL, NULL, NULL, NULL, 0, '0'),
(486, 'asperiores_689', 'Esse quis nisi nihil qui inventore.', 117, 'Mollitia fugit asperiores possimus qui.', 930, 36, 38, 700, 0, 1563572930, 1564005654, 0, NULL, NULL, NULL, NULL, 1, '0'),
(487, 'sit_944', 'Expedita molestiae quas qui aut quisquam.', 114, 'Iure voluptate aut commodi.', 570, 0, 0, 510, 0, 1563572930, 1563909968, 0, NULL, NULL, NULL, NULL, 0, '0'),
(488, 'ut_923', 'In officiis sunt reiciendis aspernatur temporibus quia quos.', 118, 'Provident sint animi nulla quia blanditiis.', 940, 0, 0, 960, 0, 1563572930, 1564517885, 0, NULL, NULL, NULL, NULL, 1, '0'),
(489, 'optio_566', NULL, 105, 'Reprehenderit eaque fuga a maxime ratione dicta.', 370, 0, 0, 260, 0, 1563572930, 1563825359, 0, NULL, NULL, NULL, NULL, 1, '0'),
(490, 'recusandae_487', 'Ipsam aspernatur ipsa repudiandae nulla veritatis et voluptas perspiciatis ipsum.', 116, 'Qui voluptatem rerum atque in id sint inventore nostrum.', 800, 0, 16, 240, 1, 1563572930, 1563673103, 0, NULL, NULL, NULL, NULL, 0, '0'),
(491, 'saepe_361', 'Dolores repellendus dolores deleniti ratione qui ab excepturi vel.', 125, 'Corporis autem incidunt et aut.', 220, 0, 0, 620, 0, 1563572930, 1563933573, 0, NULL, NULL, NULL, NULL, 0, '0'),
(492, 'voluptates_220', NULL, 122, 'Dignissimos consequatur repellat adipisci ea odio sunt.', 660, 5, 0, 220, 1, 1563572931, 1563859285, 0, NULL, NULL, NULL, NULL, 0, '0'),
(493, 'hic_381', NULL, 107, 'Voluptas ut laudantium incidunt quis.', 430, 0, 20, 940, 0, 1563572931, 1563947001, 0, NULL, NULL, NULL, NULL, 0, '0'),
(494, 'debitis_938', NULL, 106, 'Odio itaque blanditiis facilis.', 620, 0, 45, 600, 1, 1563572931, 1563869730, 0, NULL, NULL, NULL, NULL, 0, '0'),
(495, 'voluptatem_797', NULL, 109, 'In dolor aut voluptatem molestiae doloribus debitis quasi.', 160, 0, 0, 900, 0, 1563572931, 1564151271, 0, NULL, NULL, NULL, NULL, 1, '0'),
(496, 'et_309', 'Eligendi ab qui quia optio sunt atque animi.', 123, 'Laborum et est asperiores iure rerum ad.', 790, 46, 0, 590, 0, 1563572931, 1563993792, 0, NULL, NULL, NULL, NULL, 1, '0'),
(497, 'ipsam_301', NULL, 125, 'Facere atque velit occaecati enim nam nemo rerum eum.', 460, 0, 0, 760, 0, 1563572931, 1564452862, 0, NULL, NULL, NULL, NULL, 1, '0'),
(498, 'beatae_742', 'Voluptatibus laborum et magnam rerum ratione qui debitis.', 106, 'Voluptatem et est tempore aspernatur est necessitatibus repellat recusandae.', 800, 20, 42, 860, 0, 1563572931, 1564567918, 0, NULL, NULL, NULL, NULL, 0, '0'),
(499, 'autem_826', 'Minus aspernatur dolores quidem animi illum rem quia quia.', 106, 'Libero iure nam eius est.', 230, 0, 46, 440, 1, 1563572931, 1563977579, 0, NULL, NULL, NULL, NULL, 0, '0'),
(500, 'tempora_541', 'Facere quaerat ratione ad quae quia exercitationem exercitationem inventore.', 123, 'Molestiae vel qui eum nisi minus sequi.', 150, 0, 0, 730, 0, 1563572931, 1563860354, 0, NULL, NULL, NULL, NULL, 0, '0'),
(501, 'earum_878', NULL, 109, 'Dicta dicta totam veniam delectus consequatur.', 370, 24, 0, 730, 1, 1563572931, 1564019597, 0, NULL, NULL, NULL, NULL, 1, '0'),
(502, 'perferendis_366', NULL, 109, 'Ullam placeat fugit doloremque perferendis voluptatem et.', 220, 6, 49, 380, 1, 1563572931, 1563981033, 0, NULL, NULL, NULL, NULL, 1, '0'),
(503, 'maxime_887', NULL, 109, 'Rerum nihil ut dolor itaque dicta nihil.', 820, 0, 43, 330, 0, 1563572931, 1563740311, 0, NULL, NULL, NULL, NULL, 1, '0'),
(504, 'omnis_425', NULL, 109, 'Illo quaerat et atque necessitatibus harum harum.', 680, 0, 50, 550, 1, 1563572931, 1563999586, 0, NULL, NULL, NULL, NULL, 1, '0'),
(505, 'nemo_967', NULL, 109, 'Occaecati qui nesciunt doloremque iste et nisi ipsum.', 480, 0, 41, 350, 1, 1563572931, 1564235270, 0, NULL, NULL, NULL, NULL, 1, '0'),
(506, 'exercitationem_898', NULL, 109, 'Doloribus et nesciunt quasi.', 390, 28, 34, 320, 1, 1563572931, 1564212010, 0, NULL, NULL, NULL, NULL, 0, '0'),
(507, 'quos_871', NULL, 109, 'Eum voluptas veniam id est doloremque ut.', 410, 31, 47, 720, 0, 1563572931, 1564185363, 0, NULL, NULL, NULL, NULL, 0, '0'),
(508, 'autem_667', NULL, 109, 'Voluptates voluptatem qui rerum qui nihil atque illo.', 750, 10, 0, 690, 0, 1563572931, 1564360451, 0, NULL, NULL, NULL, NULL, 0, '0'),
(509, 'voluptatem_716', 'Et officiis error fuga nobis numquam consequuntur rerum et nemo et.', 109, 'Omnis soluta accusantium quod qui.', 970, 0, 0, 620, 1, 1563572931, 1564564180, 0, NULL, NULL, NULL, NULL, 0, '0'),
(510, 'et_870', NULL, 109, 'Sit harum recusandae necessitatibus eum similique ut ullam dolor.', 580, 0, 0, 170, 0, 1563572931, 1564059029, 0, NULL, NULL, NULL, NULL, 0, '0'),
(511, 'et_689', NULL, 109, 'Consequatur qui et dolore perspiciatis inventore mollitia adipisci ea.', 240, 5, 13, 980, 0, 1563572931, 1563878969, 0, NULL, NULL, NULL, NULL, 1, '0'),
(512, 'ullam_818', NULL, 109, 'Voluptatem inventore nulla earum autem non.', 250, 32, 25, 970, 0, 1563572931, 1563849045, 0, NULL, NULL, NULL, NULL, 1, '0'),
(513, 'aliquam_429', 'At quaerat distinctio totam in aut voluptatem mollitia earum quia.', 109, 'Voluptates explicabo natus autem distinctio at cum qui.', 870, 6, 2, 230, 1, 1563572931, 1564226606, 0, NULL, NULL, NULL, NULL, 0, '0'),
(514, 'ut_704', 'Quisquam ad suscipit qui necessitatibus vel voluptas voluptates officiis quam sequi.', 109, 'Consequatur aut ab consequatur dolorum tenetur autem non.', 170, 2, 11, 890, 0, 1563572931, 1563928643, 0, NULL, NULL, NULL, NULL, 1, '0'),
(515, 'quas_657', 'Quia quis vitae et voluptatibus iste sit cupiditate.', 109, 'Qui et sit perspiciatis voluptatum distinctio.', 410, 5, 0, 930, 0, 1563572931, 1564218221, 0, NULL, NULL, NULL, NULL, 1, '0'),
(516, 'aut_803', 'Distinctio minus eligendi error a et a ut at amet.', 109, 'Accusantium rerum magnam et eligendi ut debitis neque impedit.', 780, 36, 12, 190, 1, 1563572932, 1564424798, 0, NULL, NULL, NULL, NULL, 0, '0'),
(517, 'dignissimos_615', 'Ab et accusamus et placeat rem nihil quibusdam porro et.', 109, 'Est tempore sapiente voluptatem rerum.', 470, 0, 50, 200, 1, 1563572932, 1563860783, 0, NULL, NULL, NULL, NULL, 1, '0'),
(518, 'est_397', 'Omnis quas perspiciatis corrupti nam assumenda eos.', 109, 'Totam odio eveniet rerum eligendi sint ut.', 710, 5, 0, 260, 1, 1563572932, 1563905046, 0, NULL, NULL, NULL, NULL, 0, '0'),
(519, 'deleniti_169', 'Accusantium commodi at consectetur in alias dolorem.', 109, 'Et eum aut rerum quasi.', 680, 0, 34, 170, 0, 1563572932, 1564470439, 0, NULL, NULL, NULL, NULL, 1, '0'),
(520, 'cumque_533', 'Est esse sunt voluptate debitis explicabo dolore libero neque veniam nihil.', 109, 'Totam vel tempora sint sunt sunt dolorum sunt.', 70, 27, 27, 100, 1, 1563572932, 1564463994, 0, NULL, NULL, NULL, NULL, 1, '0'),
(521, 'perferendis_430', NULL, 109, 'Sequi nihil repudiandae itaque repellat.', 570, 34, 0, 680, 0, 1563572932, 1564333584, 0, NULL, NULL, NULL, NULL, 1, '0'),
(522, 'sed_660', NULL, 109, 'Veniam eum repellat incidunt architecto porro.', 650, 0, 2, 180, 0, 1563572932, 1563688838, 1, NULL, NULL, NULL, NULL, 1, '0'),
(523, 'id_495', NULL, 109, 'Alias autem aspernatur molestias in qui explicabo.', 430, 0, 0, 770, 1, 1563572932, 1564140655, 0, NULL, NULL, NULL, NULL, 1, '0'),
(524, 'animi_734', NULL, 109, 'In odio eos corrupti enim nemo nostrum.', 520, 0, 10, 320, 1, 1563572932, 1564248061, 0, NULL, NULL, NULL, NULL, 0, '0'),
(525, 'similique_221', 'Maxime commodi non illum labore aut velit expedita.', 109, 'Esse dolorum quia tenetur.', 990, 11, 7, 800, 1, 1563572932, 1564551528, 0, NULL, NULL, NULL, NULL, 0, '0'),
(526, 'sit_679', NULL, 109, 'Quos aut molestias fugiat omnis odit occaecati impedit.', 50, 43, 0, 1000, 1, 1563572932, 1563906388, 0, NULL, NULL, NULL, NULL, 0, '0'),
(527, 'porro_412', NULL, 109, 'Aliquam aut natus rem non sint repellat et.', 960, 0, 44, 380, 1, 1563572932, 1563863857, 0, NULL, NULL, NULL, NULL, 1, '0'),
(528, 'consequuntur_446', NULL, 109, 'Illum optio voluptate blanditiis omnis.', 270, 0, 35, 500, 0, 1563572932, 1564386339, 0, NULL, NULL, NULL, NULL, 1, '0'),
(529, 'ex_136', 'Est explicabo eos dolor voluptate odio velit omnis voluptatem doloribus similique.', 109, 'Ipsam voluptas in quidem et minima.', 470, 13, 0, 150, 0, 1563572932, 1564139973, 0, NULL, NULL, NULL, NULL, 1, '0'),
(530, 'ut_370', NULL, 109, 'Molestiae omnis quisquam doloribus natus cupiditate.', 830, 30, 0, 240, 0, 1563572932, 1563688346, 1, NULL, NULL, NULL, NULL, 0, '0'),
(531, 'porro_141', NULL, 109, 'Eum est eaque occaecati.', 70, 0, 2, 450, 1, 1563572932, 1564268348, 0, NULL, NULL, NULL, NULL, 1, '0'),
(532, 'illo_456', 'Dignissimos aut in facere ut sit dolor repellendus qui.', 109, 'Eveniet quis sed ab mollitia.', 470, 2, 0, 890, 1, 1563572932, 1564529766, 0, NULL, NULL, NULL, NULL, 0, '0'),
(533, 'corporis_511', 'Sit aut quis autem molestiae sapiente.', 109, 'Et architecto quis voluptatem asperiores dolores facere.', 460, 0, 22, 250, 0, 1563572932, 1563832625, 0, NULL, NULL, NULL, NULL, 1, '0'),
(534, 'voluptates_943', NULL, 109, 'Iure voluptatem quisquam aut voluptate neque aspernatur.', 580, 29, 0, 380, 0, 1563572932, 1564310563, 0, NULL, NULL, NULL, NULL, 0, '0'),
(535, 'suscipit_653', NULL, 109, 'Ut voluptatem excepturi autem consequuntur sed.', 150, 45, 0, 1000, 1, 1563572932, 1564052625, 0, NULL, NULL, NULL, NULL, 0, '0'),
(536, 'voluptas_359', NULL, 109, 'Aliquam error quas nesciunt eius.', 890, 14, 5, 1000, 0, 1563572932, 1564234371, 0, NULL, NULL, NULL, NULL, 1, '0'),
(537, 'excepturi_692', NULL, 109, 'Voluptatibus ea earum autem nemo totam.', 620, 0, 0, 150, 0, 1563572932, 1563904744, 0, NULL, NULL, NULL, NULL, 1, '0'),
(538, 'itaque_527', 'Voluptas cumque quisquam accusamus quisquam veritatis et ipsam magni earum.', 109, 'Consequatur et iste et voluptatem eveniet vitae maiores.', 630, 37, 6, 310, 0, 1563572932, 1563793565, 0, NULL, NULL, NULL, NULL, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(539, 'voluptatem_901', 'Est quos quia rerum dolorum eos aut aut sint.', 109, 'Itaque adipisci voluptatem rem voluptatem.', 480, 14, 18, 870, 1, 1563572932, 1563826108, 0, NULL, NULL, NULL, NULL, 0, '0'),
(540, 'vel_191', 'Dicta sed eum a est totam corrupti.', 109, 'Perferendis quis nihil tempore magni.', 700, 0, 37, 560, 1, 1563572932, 1564336261, 0, NULL, NULL, NULL, NULL, 1, '0'),
(541, 'quia_755', 'Iste ipsa odit officia omnis corrupti aut alias vel.', 109, 'Tempora voluptatibus aliquid similique.', 720, 0, 14, 800, 1, 1563572932, 1564288014, 0, NULL, NULL, NULL, NULL, 1, '0'),
(542, 'impedit_438', 'Voluptatem totam autem aut laborum sint odio earum et ea et.', 109, 'Possimus autem ut reprehenderit dicta qui ea aut.', 520, 16, 27, 190, 1, 1563572932, 1564026953, 0, NULL, NULL, NULL, NULL, 1, '0'),
(543, 'ab_351', NULL, 109, 'Veritatis sit eius quis omnis veritatis.', 90, 41, 0, 440, 1, 1563572933, 1563702340, 0, NULL, NULL, NULL, NULL, 1, '0'),
(544, 'veniam_823', NULL, 109, 'Sed est non magni maiores omnis quia quis consequatur.', 300, 35, 3, 950, 0, 1563572933, 1563935269, 0, NULL, NULL, NULL, NULL, 1, '0'),
(545, 'ipsa_154', NULL, 109, 'Adipisci et non error.', 70, 0, 47, 400, 1, 1563572933, 1563777201, 0, NULL, NULL, NULL, NULL, 1, '0'),
(546, 'non_346', 'Non voluptatibus nostrum facere et ipsam ea dolores doloribus iste culpa.', 109, 'Repellat molestias tenetur repellat.', 250, 49, 0, 700, 1, 1563572933, 1564559946, 0, NULL, NULL, NULL, NULL, 0, '0'),
(547, 'perspiciatis_121', 'Qui unde qui quaerat praesentium sint molestias quia.', 109, 'Blanditiis fugit cupiditate voluptate tempore voluptas.', 210, 0, 0, 610, 0, 1563572933, 1563746525, 0, NULL, NULL, NULL, NULL, 0, '0'),
(548, 'a_428', 'Quidem velit ut qui aliquam sit labore delectus ipsam.', 109, 'Assumenda facere minima doloribus ex similique.', 570, 0, 50, 790, 1, 1563572933, 1564082511, 0, NULL, NULL, NULL, NULL, 0, '0'),
(549, 'earum_546', NULL, 109, 'Possimus aut velit velit et.', 700, 0, 0, 490, 1, 1563572933, 1563870194, 0, NULL, NULL, NULL, NULL, 0, '0'),
(550, 'sint_172', 'Repellat ut eaque eius quis aliquid sit.', 109, 'Perferendis velit vero ab illum quam.', 680, 21, 0, 880, 1, 1563572933, 1564167890, 0, NULL, NULL, NULL, NULL, 0, '0'),
(551, 'et_820', 'Assumenda est qui rerum unde voluptates voluptate qui itaque.', 109, 'Atque autem et debitis voluptas sed dicta quaerat.', 700, 0, 0, 190, 0, 1563572933, 1564342221, 0, NULL, NULL, NULL, NULL, 1, '0'),
(552, 'beatae_659', NULL, 109, 'Molestias consequatur qui praesentium quidem.', 470, 0, 0, 920, 0, 1563572933, 1564111191, 0, NULL, NULL, NULL, NULL, 0, '0'),
(553, 'soluta_163', 'Molestias recusandae illum et eos officiis.', 109, 'Esse qui consequuntur minus nihil.', 880, 0, 10, 80, 1, 1563572933, 1564273234, 0, NULL, NULL, NULL, NULL, 1, '0'),
(554, 'expedita_868', 'Qui odit accusamus officia aut aut officia atque.', 109, 'Esse maxime veniam mollitia quasi rem.', 990, 0, 0, 600, 0, 1563572933, 1564361734, 0, NULL, NULL, NULL, NULL, 1, '0'),
(555, 'exercitationem_629', 'Voluptas omnis modi fugit non ullam error voluptate quas aut omnis.', 109, 'Rem atque quibusdam dolores quis quis cumque aliquid rerum.', 350, 35, 0, 470, 1, 1563572933, 1564031598, 0, NULL, NULL, NULL, NULL, 0, '0'),
(556, 'cupiditate_916', 'Quis voluptatem est ut voluptas.', 109, 'Et molestiae nulla omnis veniam.', 990, 0, 0, 830, 0, 1563572933, 1563884307, 0, NULL, NULL, NULL, NULL, 0, '0'),
(557, 'ratione_480', 'Necessitatibus iure quis ut occaecati impedit eos aut sint quod.', 109, 'Omnis adipisci incidunt mollitia nesciunt ipsum rerum distinctio.', 550, 27, 40, 780, 0, 1563572933, 1563947352, 0, NULL, NULL, NULL, NULL, 1, '0'),
(558, 'molestiae_394', 'Sunt atque quaerat voluptatem occaecati dolorem ipsam error laudantium.', 109, 'Et et et ea repudiandae dolore qui consequatur et.', 390, 20, 29, 600, 1, 1563572933, 1563928093, 0, NULL, NULL, NULL, NULL, 0, '0'),
(559, 'deleniti_111', NULL, 109, 'Sed tenetur veritatis nulla ex totam hic a.', 580, 0, 14, 110, 0, 1563572933, 1563979924, 0, NULL, NULL, NULL, NULL, 0, '0'),
(560, 'enim_605', NULL, 109, 'Dolores et deserunt fugit eius et.', 860, 0, 37, 620, 0, 1563572933, 1564028503, 0, NULL, NULL, NULL, NULL, 1, '0'),
(561, 'dolorum_228', 'Odit corporis facilis dolore voluptatem fugit optio non et.', 109, 'Culpa laborum quasi temporibus non voluptas.', 60, 0, 0, 440, 0, 1563572933, 1563753987, 0, NULL, NULL, NULL, NULL, 1, '0'),
(562, 'culpa_642', NULL, 109, 'Eum molestiae aut ea.', 100, 0, 0, 170, 0, 1563572933, 1564514892, 0, NULL, NULL, NULL, NULL, 1, '0'),
(563, 'eius_384', NULL, 109, 'Et quam eligendi reiciendis dolores.', 470, 0, 0, 530, 0, 1563572933, 1563982168, 0, NULL, NULL, NULL, NULL, 1, '0'),
(564, 'assumenda_569', NULL, 109, 'Maiores autem nesciunt unde dolorem voluptas aspernatur at.', 960, 4, 0, 850, 1, 1563572933, 1564040035, 0, NULL, NULL, NULL, NULL, 0, '0'),
(565, 'dolorum_384', NULL, 109, 'Alias tempore necessitatibus maiores molestias.', 290, 0, 19, 830, 0, 1563572933, 1563807860, 0, NULL, NULL, NULL, NULL, 0, '0'),
(566, 'eum_952', NULL, 109, 'Voluptatem tempore quae non quia sunt id.', 990, 39, 9, 860, 0, 1563572933, 1563939392, 0, NULL, NULL, NULL, NULL, 1, '0'),
(567, 'sed_257', 'Quidem officiis accusantium velit nihil sequi earum maiores laborum atque.', 109, 'Aut et quo rerum sunt enim.', 340, 0, 45, 290, 1, 1563572933, 1564259593, 0, NULL, NULL, NULL, NULL, 1, '0'),
(568, 'rerum_234', 'Voluptate nulla molestiae at et et nobis beatae aliquid enim.', 109, 'Ut consequuntur voluptatum commodi dignissimos commodi rerum aspernatur.', 810, 35, 19, 1000, 1, 1563572933, 1563840491, 0, NULL, NULL, NULL, NULL, 0, '0'),
(569, 'molestias_272', NULL, 109, 'Consequuntur temporibus voluptatem non qui ad sit.', 600, 47, 0, 270, 0, 1563572933, 1563735253, 1, NULL, NULL, NULL, NULL, 1, '0'),
(570, 'aperiam_100', NULL, 109, 'Sed qui fuga consectetur autem excepturi soluta.', 800, 0, 0, 240, 1, 1563572933, 1564231746, 0, NULL, NULL, NULL, NULL, 1, '0'),
(571, 'quis_490', NULL, 109, 'Repellat voluptatem aut placeat ducimus doloremque voluptas dolorem.', 690, 0, 0, 270, 1, 1563572933, 1564486753, 0, NULL, NULL, NULL, NULL, 1, '0'),
(572, 'ea_563', NULL, 109, 'Qui neque earum corrupti qui.', 850, 0, 0, 400, 1, 1563572933, 1564057644, 0, NULL, NULL, NULL, NULL, 0, '0'),
(573, 'aperiam_495', NULL, 109, 'Sapiente deleniti et adipisci provident maxime et non.', 330, 50, 18, 540, 0, 1563572934, 1564131767, 0, NULL, NULL, NULL, NULL, 0, '0'),
(574, 'architecto_375', NULL, 109, 'Repellat non rem quo aut magnam esse minima.', 860, 44, 0, 1000, 1, 1563572934, 1564564903, 0, NULL, NULL, NULL, NULL, 1, '0'),
(575, 'modi_652', 'Laboriosam dolor laborum excepturi ut sunt.', 109, 'Qui eos illum non et sed distinctio.', 380, 40, 0, 120, 0, 1563572934, 1564475557, 0, NULL, NULL, NULL, NULL, 1, '0'),
(576, 'explicabo_123', NULL, 109, 'Dicta laborum tempore eligendi.', 380, 46, 43, 530, 1, 1563572934, 1563707485, 0, NULL, NULL, NULL, NULL, 1, '0'),
(577, 'cupiditate_200', 'Ut quo necessitatibus enim officia beatae dolor ipsum ratione.', 109, 'Quibusdam est ut nihil rerum est voluptates.', 120, 0, 22, 870, 1, 1563572934, 1564093643, 0, NULL, NULL, NULL, NULL, 1, '0'),
(578, 'quo_847', NULL, 109, 'Velit dicta voluptatum sunt quis in est laboriosam.', 370, 0, 16, 800, 0, 1563572934, 1563868471, 0, NULL, NULL, NULL, NULL, 0, '0'),
(579, 'cum_905', 'Et dolorem quam nisi voluptas quam laborum.', 109, 'Nihil consectetur ullam saepe recusandae ad.', 730, 0, 0, 420, 0, 1563572934, 1563863672, 0, NULL, NULL, NULL, NULL, 0, '0'),
(580, 'vitae_818', NULL, 109, 'Voluptatem iusto asperiores corporis quis commodi natus quia modi.', 600, 0, 0, 530, 1, 1563572934, 1564083318, 0, NULL, NULL, NULL, NULL, 1, '0'),
(581, 'accusantium_906', 'Enim laudantium voluptatum perspiciatis dolorem culpa ex libero.', 109, 'Illo repellendus blanditiis nostrum voluptatem est id sit.', 820, 46, 0, 190, 1, 1563572934, 1564270095, 0, NULL, NULL, NULL, NULL, 0, '0'),
(582, 'quos_316', NULL, 109, 'Dolor odio qui iste mollitia sed aliquid neque dolorem.', 900, 0, 23, 620, 0, 1563572934, 1564125210, 0, NULL, NULL, NULL, NULL, 1, '0'),
(583, 'nulla_598', NULL, 109, 'Et et quis consequatur tempora omnis earum.', 660, 0, 0, 980, 1, 1563572934, 1563770308, 0, NULL, NULL, NULL, NULL, 0, '0'),
(584, 'id_294', 'Fugit molestiae iure consequuntur iste perferendis pariatur omnis eum odit dignissimos.', 109, 'Assumenda quia vitae amet voluptatem amet.', 960, 0, 0, 420, 1, 1563572934, 1564079686, 0, NULL, NULL, NULL, NULL, 0, '0'),
(585, 'eos_709', 'Rem nihil quae dicta dolores esse enim.', 109, 'Dolores molestiae sapiente aspernatur quos totam quia aut.', 850, 0, 0, 580, 0, 1563572934, 1563864600, 0, NULL, NULL, NULL, NULL, 0, '0'),
(586, 'adipisci_389', 'Ipsam est voluptatem et cupiditate odio qui voluptatem placeat a quisquam.', 109, 'Suscipit dolor mollitia voluptatum.', 440, 1, 11, 780, 1, 1563572934, 1564130259, 0, NULL, NULL, NULL, NULL, 0, '0'),
(587, 'iure_773', NULL, 109, 'Repellendus omnis tenetur iure a.', 860, 37, 18, 860, 0, 1563572934, 1564204032, 0, NULL, NULL, NULL, NULL, 1, '0'),
(588, 'et_338', NULL, 109, 'Quidem voluptatem dolores ut eum enim.', 440, 24, 0, 710, 1, 1563572934, 1564435991, 0, NULL, NULL, NULL, NULL, 0, '0'),
(589, 'cupiditate_418', 'Blanditiis aperiam maxime laborum amet consectetur quia consequatur cupiditate.', 109, 'Autem unde sequi non dolores ex aperiam.', 820, 11, 2, 470, 0, 1563572934, 1564445330, 0, NULL, NULL, NULL, NULL, 1, '0'),
(590, 'sapiente_826', NULL, 109, 'Assumenda odio est distinctio voluptatum suscipit voluptatum.', 700, 0, 34, 280, 0, 1563572934, 1564322289, 0, NULL, NULL, NULL, NULL, 0, '0'),
(591, 'necessitatibus_195', 'In quam nulla occaecati consequatur labore dolorem laborum ea aut quisquam.', 109, 'In voluptatem deserunt nihil quod voluptates accusamus adipisci blanditiis.', 260, 47, 0, 420, 0, 1563572934, 1563679330, 1, NULL, NULL, NULL, NULL, 0, '0'),
(592, 'sunt_101', 'Est consequuntur ipsam et est dicta ex et excepturi.', 109, 'Libero dolores voluptas non unde.', 380, 17, 0, 150, 0, 1563572935, 1564419703, 0, NULL, NULL, NULL, NULL, 1, '0'),
(593, 'ea_425', 'Ipsam asperiores beatae illo autem eaque.', 109, 'Assumenda voluptatibus deleniti qui.', 80, 45, 23, 280, 1, 1563572935, 1564553916, 0, NULL, NULL, NULL, NULL, 0, '0'),
(594, 'ut_319', 'Non assumenda iste ut explicabo delectus.', 109, 'Expedita ea distinctio et.', 820, 50, 21, 110, 0, 1563572935, 1564486566, 0, NULL, NULL, NULL, NULL, 1, '0'),
(595, 'nulla_961', NULL, 109, 'Vitae eveniet quibusdam ut dolores.', 130, 43, 0, 440, 0, 1563572935, 1563972310, 0, NULL, NULL, NULL, NULL, 1, '0'),
(596, 'cumque_430', NULL, 109, 'Fugiat possimus vel ducimus nihil sit enim.', 500, 9, 0, 430, 1, 1563572935, 1564334536, 0, NULL, NULL, NULL, NULL, 1, '0'),
(597, 'cum_797', NULL, 109, 'Et eos non cum ducimus.', 230, 0, 0, 260, 0, 1563572935, 1564304254, 0, NULL, NULL, NULL, NULL, 1, '0'),
(598, 'laudantium_352', 'Dolor eos necessitatibus ut fugit maxime provident.', 109, 'Quia corrupti neque ut nihil cupiditate consequatur.', 400, 39, 0, 190, 1, 1563572935, 1564001505, 0, NULL, NULL, NULL, NULL, 1, '0'),
(599, 'asperiores_755', 'Voluptate voluptatem consequatur veritatis dolorem in.', 109, 'Error vel similique pariatur debitis ut quia expedita.', 580, 13, 0, 460, 0, 1563572935, 1564542760, 0, NULL, NULL, NULL, NULL, 0, '0'),
(600, 'rem_428', NULL, 109, 'Iure unde qui adipisci.', 580, 42, 0, 420, 0, 1563572935, 1564422753, 0, NULL, NULL, NULL, NULL, 0, '0'),
(601, 'autem_478', 'Ut eos officia laboriosam labore tempore vel earum minus et dignissimos fugit.', 109, 'Quo iusto consectetur autem minima molestiae illum.', 210, 38, 0, 890, 0, 1563572935, 1563858054, 0, NULL, NULL, NULL, NULL, 0, '0'),
(602, 'ut_609', NULL, 109, 'Accusantium minus perferendis voluptates minus autem voluptas.', 890, 46, 0, 480, 1, 1563572935, 1564137648, 0, NULL, NULL, NULL, NULL, 0, '0'),
(603, 'eum_273', 'Doloremque consequuntur omnis voluptatem fugiat et accusantium magni nihil consequatur.', 109, 'Odit neque consequatur dolor facilis.', 770, 31, 0, 490, 1, 1563572935, 1563865334, 0, NULL, NULL, NULL, NULL, 1, '0'),
(604, 'delectus_560', 'Repudiandae deleniti nostrum sunt ut repellat vero minima nemo officia sint.', 109, 'Doloremque tempore ex sequi aut.', 440, 2, 20, 550, 1, 1563572935, 1564533789, 0, NULL, NULL, NULL, NULL, 1, '0'),
(605, 'culpa_718', NULL, 109, 'Eveniet ut quas est eum ut.', 630, 30, 47, 360, 0, 1563572935, 1564062963, 0, NULL, NULL, NULL, NULL, 0, '0'),
(606, 'porro_163', NULL, 109, 'Inventore iure neque suscipit itaque incidunt commodi.', 690, 22, 0, 500, 1, 1563572935, 1564184691, 0, NULL, NULL, NULL, NULL, 1, '0'),
(607, 'sapiente_455', NULL, 109, 'Consequatur et rerum nisi autem impedit velit est.', 890, 37, 0, 270, 0, 1563572935, 1564524670, 0, NULL, NULL, NULL, NULL, 0, '0'),
(608, 'aut_625', 'Voluptates eligendi dignissimos in est reprehenderit ut atque.', 109, 'Repudiandae beatae dolorem cumque dolor dolor odio culpa.', 730, 0, 4, 890, 0, 1563572935, 1564061331, 0, NULL, NULL, NULL, NULL, 1, '0'),
(609, 'nihil_662', 'Non dolorem dignissimos neque debitis doloribus eum unde.', 109, 'Et doloremque nam expedita sint impedit officia labore.', 830, 0, 0, 160, 0, 1563572935, 1564164730, 0, NULL, NULL, NULL, NULL, 0, '0'),
(610, 'eaque_466', NULL, 109, 'Fuga voluptas quisquam esse voluptatem id.', 470, 0, 0, 840, 0, 1563572935, 1564058240, 0, NULL, NULL, NULL, NULL, 0, '0'),
(611, 'ducimus_850', NULL, 109, 'Nam tenetur temporibus voluptas deserunt et aspernatur.', 320, 37, 0, 560, 0, 1563572935, 1563683877, 1, NULL, NULL, NULL, NULL, 0, '0'),
(612, 'eos_792', 'Vel autem sapiente molestiae aut ut sequi dolor.', 109, 'Tenetur ipsum ipsa incidunt quia voluptas harum dignissimos.', 530, 2, 0, 780, 0, 1563572935, 1564286886, 0, NULL, NULL, NULL, NULL, 1, '0'),
(613, 'consectetur_398', 'Nemo et et eaque qui ea corrupti.', 109, 'Qui dolores quia est aut voluptas.', 560, 5, 0, 150, 0, 1563572935, 1564103254, 0, NULL, NULL, NULL, NULL, 1, '0'),
(614, 'molestias_351', 'Fugit dolorem quia modi expedita laboriosam repellat voluptatem consequatur quia.', 109, 'Animi sunt blanditiis reprehenderit esse aliquam.', 190, 7, 50, 220, 1, 1563572935, 1563919234, 0, NULL, NULL, NULL, NULL, 1, '0'),
(615, 'consequuntur_908', NULL, 109, 'Alias atque enim cumque rem.', 720, 16, 0, 710, 1, 1563572935, 1563956547, 0, NULL, NULL, NULL, NULL, 0, '0'),
(616, 'nulla_167', NULL, 109, 'Voluptatibus architecto quos non ipsam.', 310, 34, 0, 610, 0, 1563572935, 1564226769, 0, NULL, NULL, NULL, NULL, 1, '0'),
(617, 'consequatur_357', NULL, 109, 'Quia minus est harum iure.', 950, 0, 0, 870, 1, 1563572935, 1564283276, 0, NULL, NULL, NULL, NULL, 0, '0'),
(618, 'adipisci_937', NULL, 109, 'Fugit tempore sapiente perspiciatis eveniet.', 560, 0, 25, 110, 0, 1563572935, 1563762890, 0, NULL, NULL, NULL, NULL, 0, '0'),
(619, 'repellendus_193', NULL, 109, 'Veritatis nostrum commodi fugiat ut impedit eligendi.', 490, 9, 0, 800, 0, 1563572935, 1564197205, 0, NULL, NULL, NULL, NULL, 1, '0'),
(620, 'excepturi_774', 'Sed qui excepturi eos omnis alias unde libero sit omnis quae.', 109, 'Et tenetur ipsa placeat quia.', 140, 0, 0, 930, 0, 1563572935, 1564119335, 0, NULL, NULL, NULL, NULL, 1, '0'),
(621, 'corrupti_317', NULL, 109, 'Accusantium quo dolores ea.', 540, 0, 0, 350, 1, 1563572935, 1564068921, 0, NULL, NULL, NULL, NULL, 0, '0'),
(622, 'debitis_284', 'Molestiae veritatis maiores iste magni doloremque magnam voluptas omnis et quibusdam.', 109, 'Ut doloremque eos quasi temporibus est et.', 470, 8, 33, 640, 1, 1563572936, 1564340242, 0, NULL, NULL, NULL, NULL, 1, '0'),
(623, 'dolores_164', NULL, 109, 'Ullam qui at perferendis veritatis.', 410, 0, 13, 280, 1, 1563572936, 1564325011, 0, NULL, NULL, NULL, NULL, 1, '0'),
(624, 'repellendus_298', NULL, 109, 'Ea reprehenderit cumque non vero accusantium hic nesciunt.', 670, 31, 0, 890, 1, 1563572936, 1564530165, 0, NULL, NULL, NULL, NULL, 0, '0'),
(625, 'voluptates_242', NULL, 109, 'Quaerat culpa deserunt qui ullam.', 630, 0, 25, 510, 0, 1563572936, 1563955959, 0, NULL, NULL, NULL, NULL, 0, '0'),
(626, 'inventore_663', 'Quos illum molestiae laudantium ut eos nam.', 109, 'Id tenetur eaque voluptas perferendis.', 780, 42, 9, 510, 0, 1563572936, 1564146583, 0, NULL, NULL, NULL, NULL, 0, '0'),
(627, 'error_122', 'Voluptas numquam debitis exercitationem voluptatibus assumenda doloremque.', 109, 'Aut reiciendis dignissimos odit ab aperiam eum qui.', 930, 0, 0, 100, 1, 1563572936, 1564234414, 0, NULL, NULL, NULL, NULL, 1, '0'),
(628, 'consequuntur_805', NULL, 109, 'Error exercitationem deserunt alias consequatur mollitia.', 300, 0, 0, 300, 0, 1563572936, 1564401770, 0, NULL, NULL, NULL, NULL, 1, '0'),
(629, 'repudiandae_536', 'Harum ipsum nam ipsam atque ut porro aspernatur quibusdam.', 109, 'Et necessitatibus nam voluptate non similique ab doloremque.', 340, 47, 14, 1000, 1, 1563572936, 1564255546, 0, NULL, NULL, NULL, NULL, 1, '0'),
(630, 'occaecati_978', 'Illo ipsam sunt ipsa dolorum sit delectus et qui odio provident.', 109, 'Dignissimos voluptates illum accusamus veritatis perferendis.', 250, 24, 0, 560, 0, 1563572936, 1564521938, 0, NULL, NULL, NULL, NULL, 0, '0'),
(631, 'maiores_303', NULL, 109, 'Voluptatibus porro laboriosam atque perspiciatis voluptatem et et.', 140, 42, 0, 940, 0, 1563572936, 1563814062, 0, NULL, NULL, NULL, NULL, 1, '0'),
(632, 'soluta_928', 'Qui et nobis recusandae voluptatem porro perspiciatis.', 109, 'Doloribus et aut vel.', 480, 0, 26, 620, 0, 1563572936, 1563732181, 1, NULL, NULL, NULL, NULL, 1, '0'),
(633, 'facilis_218', NULL, 109, 'Vero laborum quisquam odit aspernatur omnis delectus quae.', 490, 39, 0, 830, 0, 1563572936, 1564132576, 0, NULL, NULL, NULL, NULL, 1, '0'),
(634, 'maxime_652', 'Dolorum est eum ab ea eligendi rerum commodi id.', 109, 'Tempore laboriosam ut autem.', 800, 7, 0, 680, 1, 1563572936, 1563946986, 0, NULL, NULL, NULL, NULL, 0, '0'),
(635, 'eveniet_790', 'Quo voluptatibus natus nisi dignissimos suscipit praesentium fugit assumenda doloremque modi.', 109, 'Odio esse non dolores natus.', 970, 0, 47, 410, 0, 1563572936, 1564471502, 0, NULL, NULL, NULL, NULL, 0, '0'),
(636, 'quo_663', 'Ratione illum ab illum in rerum dolor mollitia accusamus ut.', 109, 'Ipsam molestiae ipsam corporis minus eos.', 930, 0, 0, 210, 1, 1563572936, 1564291920, 0, NULL, NULL, NULL, NULL, 1, '0'),
(637, 'nostrum_366', 'Labore porro deserunt exercitationem ipsam incidunt non aspernatur id.', 109, 'Eum tempora aperiam libero itaque velit rerum consectetur.', 140, 43, 0, 340, 0, 1563572936, 1564377942, 0, NULL, NULL, NULL, NULL, 1, '0'),
(638, 'nulla_909', 'Cupiditate autem minima et et velit expedita cum quia et.', 109, 'Consectetur ut nulla et distinctio quis.', 530, 0, 0, 90, 1, 1563572936, 1564427368, 0, NULL, NULL, NULL, NULL, 1, '0'),
(639, 'sed_733', NULL, 109, 'Omnis ea qui rerum excepturi commodi.', 740, 36, 0, 280, 1, 1563572936, 1564010496, 0, NULL, NULL, NULL, NULL, 1, '0'),
(640, 'laudantium_585', 'Dolorum qui modi magnam fugit aut dicta.', 109, 'Qui neque officiis sint est excepturi eum.', 170, 0, 0, 800, 0, 1563572936, 1563849973, 0, NULL, NULL, NULL, NULL, 1, '0'),
(641, 'omnis_831', 'Voluptas incidunt asperiores consequatur asperiores ut et.', 109, 'Illo explicabo similique soluta officia iure.', 140, 0, 38, 310, 1, 1563572936, 1564234928, 0, NULL, NULL, NULL, NULL, 1, '0'),
(642, 'officia_735', NULL, 109, 'Et odio voluptatem porro facilis.', 560, 0, 0, 260, 1, 1563572936, 1564362438, 0, NULL, NULL, NULL, NULL, 1, '0'),
(643, 'laborum_719', 'Corporis est nesciunt tempore omnis.', 109, 'Temporibus est corrupti blanditiis.', 390, 0, 0, 90, 1, 1563572936, 1563869248, 0, NULL, NULL, NULL, NULL, 1, '0'),
(644, 'quam_537', 'Aliquid magni molestiae temporibus voluptatem modi nihil.', 109, 'Amet eum ea voluptatibus totam pariatur.', 260, 5, 39, 730, 0, 1563572936, 1564238704, 0, NULL, NULL, NULL, NULL, 1, '0'),
(645, 'quasi_664', NULL, 109, 'Sunt eum rem vero provident velit dignissimos fugit consequatur.', 660, 1, 0, 600, 0, 1563572936, 1563836714, 0, NULL, NULL, NULL, NULL, 0, '0'),
(646, 'eum_852', NULL, 109, 'Odio minima autem dolorum est rerum blanditiis.', 730, 21, 0, 530, 1, 1563572936, 1563730517, 0, NULL, NULL, NULL, NULL, 0, '0'),
(647, 'harum_839', NULL, 109, 'Temporibus et quod facere officiis nemo et illum consectetur.', 290, 0, 48, 460, 1, 1563572936, 1564545961, 0, NULL, NULL, NULL, NULL, 1, '0'),
(648, 'consequatur_108', 'Ipsam voluptates inventore nisi aut quis aut voluptas sit illo voluptate.', 109, 'Minus nobis aut veniam excepturi quae dolorum pariatur dolores.', 330, 0, 9, 520, 0, 1563572937, 1564072841, 0, NULL, NULL, NULL, NULL, 0, '0'),
(649, 'consequatur_359', NULL, 109, 'Magni eligendi ut voluptate recusandae sit minus distinctio.', 440, 0, 21, 580, 0, 1563572937, 1563897960, 0, NULL, NULL, NULL, NULL, 0, '0'),
(650, 'atque_527', 'Voluptatem eos corrupti numquam velit occaecati accusamus voluptatibus earum.', 109, 'Voluptate atque ab voluptatem sunt soluta.', 570, 0, 0, 650, 0, 1563572937, 1564164483, 0, NULL, NULL, NULL, NULL, 0, '0'),
(651, 'Fee_id', 'Test invoice', 1, '[{\"title\":\"test1\",\"amount\":\"1000\"},{\"title\":\"test2\",\"amount\":\"500\"}]', 1500, 0, 1500, 0, 0, 1562783400, 1564425000, 0, '5d3427c78bece', NULL, NULL, NULL, 0, '1500'),
(652, 'ID', 'title', 178, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2d9d4a1', NULL, NULL, NULL, 0, '1500'),
(653, 'ID', 'title', 180, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2da846b', NULL, NULL, NULL, 0, '1500'),
(654, 'ID', 'title', 186, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2daab7c', NULL, NULL, NULL, 0, '1500'),
(655, 'ID', 'title', 187, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2dad28c', NULL, NULL, NULL, 0, '1500'),
(656, 'ID', 'title', 188, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2db381e', NULL, NULL, NULL, 0, '1500'),
(657, 'ID', 'title', 189, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2db91f7', NULL, NULL, NULL, 0, '1500'),
(658, 'ID', 'title', 190, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2dbc8a8', NULL, NULL, NULL, 0, '1500'),
(659, 'ID', 'title', 195, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2dbefb9', NULL, NULL, NULL, 0, '1500'),
(660, 'ID', 'title', 196, '[]', 0, 0, 0, 0, 0, 1563647400, 1563820200, 0, '5d342a2dc12e1', NULL, NULL, NULL, 0, '1500'),
(661, 'asd', 'asd', 179, '[{\"title\":\"1500\",\"amount\":\"1500\"}]', 1500, 0, 1500, 0, 0, 1563647400, 1563820200, 0, '5d342ac8478ee', NULL, NULL, NULL, 0, '1500'),
(662, 'asd', 'asd', 181, '[{\"title\":\"1500\",\"amount\":\"1500\"}]', 1500, 0, 1500, 0, 0, 1563647400, 1563820200, 0, '5d342ac850978', NULL, NULL, NULL, 0, '1500'),
(663, 'asd', 'asd', 183, '[{\"title\":\"1500\",\"amount\":\"1500\"}]', 1500, 0, 1500, 0, 0, 1563647400, 1563820200, 0, '5d342ac8576da', NULL, NULL, NULL, 0, '1500'),
(664, 'asd', 'asd', 193, '[{\"title\":\"1500\",\"amount\":\"1500\"}]', 1500, 0, 1500, 0, 0, 1563647400, 1563820200, 0, '5d342ac859a02', NULL, NULL, NULL, 0, '1500'),
(665, 'asd', 'asd', 197, '[{\"title\":\"1500\",\"amount\":\"1500\"}]', 1500, 0, 1500, 0, 0, 1563647400, 1563820200, 0, '5d342ac85bd2b', NULL, NULL, NULL, 0, '1500'),
(666, 'test5552', 'asd', 178, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae07a6ef', NULL, NULL, NULL, 0, '1500'),
(667, 'test5552', 'asd', 180, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae086659', NULL, NULL, NULL, 0, '1500'),
(668, 'test5552', 'asd', 186, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae088982', NULL, NULL, NULL, 0, '1500'),
(669, 'test5552', 'asd', 187, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae08acab', NULL, NULL, NULL, 0, '1500'),
(670, 'test5552', 'asd', 188, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae08d3bb', NULL, NULL, NULL, 0, '1500'),
(671, 'test5552', 'asd', 189, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae08f2fc', NULL, NULL, NULL, 0, '1500'),
(672, 'test5552', 'asd', 190, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae091a0c', NULL, NULL, NULL, 0, '1500'),
(673, 'test5552', 'asd', 195, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae098f3e', NULL, NULL, NULL, 0, '1500'),
(674, 'test5552', 'asd', 196, '[]', 0, 0, 0, 0, 0, 1563647400, 1563993000, 0, '5d342ae09ba36', NULL, NULL, NULL, 0, '1500');

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

--
-- Dumping data for table `phone_calls`
--

INSERT INTO `phone_calls` (`id`, `FullName`, `phoneNo`, `email`, `call_type`, `purpose`, `call_time`, `nxt_follow`, `call_duration`, `call_details`) VALUES
(1, 'Molestiae beatae accusantium et.', '69610', 'marty.volkman@kulas.com', 'non', 'tenetur', '1563572937', 'in', '15 minutes', 'In iure cupiditate nisi minima amet ducimus fugit est dolorem.'),
(2, 'Ut sed fugiat.', '76529', 'friesen.brielle@yahoo.com', 'sit', 'animi', '1563572937', 'quaerat', '11 minutes', 'Nobis repellat voluptates non illo illum dolores ea voluptate quia.'),
(3, 'Delectus nulla rerum.', '79182', 'fredrick43@powlowski.com', 'officia', 'voluptates', '1563572937', 'atque', '9 minutes', 'Optio error nemo fugiat ea exercitationem consectetur nam vel quo omnis nesciunt.'),
(4, 'Non earum quo fugit ducimus ut.', '72036', 'akeebler@gmail.com', 'aperiam', 'similique', '1563572937', 'nisi', '16 minutes', 'Recusandae voluptate harum beatae eius qui aut expedita.'),
(5, 'Laudantium repellat modi aliquid.', '81508', 'bfahey@heller.biz', 'pariatur', 'consequatur', '1563572937', 'hic', '30 minutes', 'Sint minus quam ut harum est.'),
(6, 'Deserunt rerum sed.', '70270', 'rahsaan35@bode.biz', 'ab', 'aut', '1563572937', 'ipsa', '9 minutes', 'Voluptas dolor ullam sapiente nisi iusto error sit.'),
(7, 'Nesciunt totam eum.', '13953', 'jones.laury@batz.com', 'nobis', 'sapiente', '1563572937', 'voluptatum', '18 minutes', 'Et deleniti est dolorem illum eum.'),
(8, 'Omnis est qui placeat.', '35382', 'ludie.steuber@yahoo.com', 'libero', 'doloribus', '1563572937', 'voluptatem', '24 minutes', 'Voluptatum pariatur id nihil fugiat sit veniam hic sed.'),
(9, 'Cupiditate quisquam praesentium aliquid.', '59421', 'emard.gage@yahoo.com', 'nulla', 'earum', '1563572937', 'odit', '16 minutes', 'Voluptatibus fugiat autem et nemo id quos architecto mollitia.'),
(10, 'Dicta porro enim blanditiis.', '45305', 'jade40@gmail.com', 'magni', 'ut', '1563572937', 'ullam', '20 minutes', 'Et et voluptatem odit eos veniam itaque tempore.'),
(11, 'Magni voluptas numquam.', '87992', 'bechtelar.candace@hotmail.com', 'odio', 'ratione', '1563572937', 'et', '18 minutes', 'Explicabo velit accusantium et illum ex sit dolore inventore ut et.'),
(12, 'Molestiae at ea vero.', '46986', 'adriana.renner@sawayn.biz', 'ea', 'earum', '1563572937', 'ea', '5 minutes', 'Ipsam reprehenderit enim aut qui magni laborum voluptates cumque sed.'),
(13, 'Quas quia nam accusamus quos.', '48616', 'brooks.brekke@hamill.com', 'officia', 'aliquid', '1563572937', 'provident', '4 minutes', 'Facere minima itaque atque mollitia dolores ut quos.'),
(14, 'Dolorum praesentium provident sit.', '18477', 'zackary.maggio@kirlin.com', 'modi', 'dignissimos', '1563572937', 'minus', '20 minutes', 'Occaecati tempore est cum voluptates deleniti harum mollitia mollitia dicta quos.'),
(15, 'Veritatis repudiandae sit praesentium.', '24020', 'dmoen@kautzer.info', 'unde', 'amet', '1563572937', 'vero', '14 minutes', 'Quos id aut autem vero pariatur quo natus nihil et nemo debitis vel.'),
(16, 'Possimus esse animi.', '98155', 'nhand@gmail.com', 'quaerat', 'accusantium', '1563572937', 'dolor', '25 minutes', 'Sed maxime necessitatibus alias explicabo ipsum magnam et.'),
(17, 'Officia dolor voluptatibus.', '56021', 'bell32@schmeler.com', 'velit', 'non', '1563572937', 'pariatur', '12 minutes', 'Dicta ratione necessitatibus occaecati qui accusantium dolor quia.'),
(18, 'Quibusdam nihil error ut accusantium eius.', '37086', 'harber.raleigh@smith.com', 'assumenda', 'mollitia', '1563572937', 'reprehenderit', '3 minutes', 'Nesciunt incidunt cumque quibusdam et sit eligendi odit.'),
(19, 'Sunt sapiente unde rerum.', '48253', 'hudson.sandy@stroman.net', 'non', 'asperiores', '1563572937', 'minima', '28 minutes', 'Minus optio et sunt ipsum repellendus occaecati error quisquam placeat.'),
(20, 'Laborum ratione maiores.', '86027', 'sawayn.eldred@hotmail.com', 'iure', 'sunt', '1563572937', 'sit', '17 minutes', 'Laboriosam cumque voluptatem nihil quo et sapiente reiciendis labore.'),
(21, 'Voluptas corrupti qui.', '84538', 'gboyle@monahan.net', 'dolorum', 'voluptatem', '1563572937', 'distinctio', '16 minutes', 'Vero illo tenetur aut et doloribus corporis aut accusantium optio natus reprehenderit.'),
(22, 'Dolorem repellat magnam.', '90812', 'block.rowland@yahoo.com', 'officia', 'ex', '1563572937', 'fuga', '21 minutes', 'Quidem quos molestias accusantium asperiores eveniet.'),
(23, 'Similique iste ea architecto.', '47554', 'lkuhic@hotmail.com', 'saepe', 'amet', '1563572937', 'debitis', '24 minutes', 'Id aut ipsa qui qui perferendis ab.'),
(24, 'Incidunt ducimus et ducimus enim.', '20844', 'osinski.santos@sporer.org', 'consequatur', 'corrupti', '1563572937', 'non', '28 minutes', 'Voluptatem enim voluptatibus ipsam laborum corporis aspernatur occaecati sint molestiae.'),
(25, 'Quasi velit.', '95078', 'gabriella91@welch.com', 'sed', 'voluptas', '1563572937', 'rerum', '30 minutes', 'Consequatur qui itaque ex doloribus.'),
(26, 'Consequatur quis at dolorum explicabo.', '87009', 'ronny63@ledner.net', 'optio', 'consequatur', '1563572937', 'earum', '8 minutes', 'Sit quo omnis ipsa molestiae laboriosam voluptas harum voluptatibus dolore voluptas et rerum sit.'),
(27, 'Et et.', '60550', 'travon.torphy@yahoo.com', 'maxime', 'sed', '1563572937', 'ea', '22 minutes', 'Expedita dignissimos ut eligendi quas atque.'),
(28, 'Aliquid non quod.', '88787', 'raphaelle19@quitzon.com', 'sed', 'dolorum', '1563572937', 'quam', '10 minutes', 'Eum atque ipsum id aperiam quibusdam nisi et et asperiores molestiae.'),
(29, 'Voluptatibus consectetur repellendus ex doloremque.', '93811', 'ezequiel80@hessel.net', 'ut', 'qui', '1563572937', 'earum', '11 minutes', 'Nihil molestias quia voluptate sed blanditiis alias dolor praesentium est.'),
(30, 'Quo tempora qui.', '36777', 'dietrich.henderson@yahoo.com', 'autem', 'esse', '1563572937', 'accusamus', '18 minutes', 'Doloribus facere quae repellendus consequatur in ducimus omnis.'),
(31, 'Nihil architecto aut qui vel perferendis.', '92950', 'aschowalter@yahoo.com', 'inventore', 'ut', '1563572937', 'quia', '4 minutes', 'Quia earum iste et qui natus voluptatem velit non ab.'),
(32, 'Est officiis placeat fugit.', '43247', 'adela.walter@gmail.com', 'ut', 'quae', '1563572937', 'quam', '21 minutes', 'Ipsa illo voluptatem aut rerum accusamus corporis atque eaque magni quas ipsa.'),
(33, 'Nostrum ea a.', '31790', 'einar94@yahoo.com', 'quia', 'nisi', '1563572937', 'est', '23 minutes', 'Et vero quia harum quia tempora delectus perferendis qui.'),
(34, 'Blanditiis ab ut harum.', '72348', 'schinner.chance@weber.info', 'sint', 'ut', '1563572937', 'quas', '28 minutes', 'Quia libero placeat quia et commodi et alias et optio sint.'),
(35, 'Maiores et.', '75797', 'reynolds.nicole@ritchie.biz', 'voluptas', 'maxime', '1563572937', 'ex', '18 minutes', 'Rerum sit ut omnis fugiat et id.'),
(36, 'Aperiam aspernatur est sit id.', '71426', 'bpacocha@gmail.com', 'ut', 'quisquam', '1563572937', 'fuga', '8 minutes', 'Perferendis qui repellat nemo sit eum porro soluta eum quae eaque corporis quod.'),
(37, 'Accusantium consequatur sunt.', '92781', 'astrid.marks@wintheiser.com', 'nam', 'nihil', '1563572937', 'dolores', '26 minutes', 'Nostrum laudantium dolores est id qui error quasi.'),
(38, 'Ut blanditiis.', '58265', 'elza05@greenholt.org', 'minus', 'distinctio', '1563572937', 'libero', '9 minutes', 'Quis voluptas iusto molestiae officia.'),
(39, 'Laborum expedita maxime.', '88449', 'huels.ubaldo@hotmail.com', 'nesciunt', 'veritatis', '1563572937', 'sint', '23 minutes', 'Aut perferendis optio accusamus quae quia.'),
(40, 'Voluptatum enim non doloribus corporis.', '95935', 'buck.ward@hotmail.com', 'numquam', 'velit', '1563572937', 'nesciunt', '20 minutes', 'Placeat laudantium laborum sunt voluptas rem consectetur quam.'),
(41, 'Libero inventore et.', '65940', 'kaia.hagenes@lemke.com', 'aut', 'vel', '1563572937', 'odio', '26 minutes', 'Nam rerum omnis est error officia.'),
(42, 'Sit nobis placeat sunt.', '91701', 'harris.justice@gmail.com', 'et', 'et', '1563572937', 'commodi', '29 minutes', 'Mollitia minus incidunt fuga possimus labore est aut.'),
(43, 'Sunt corporis odit enim.', '57379', 'lmarks@pollich.com', 'vero', 'quod', '1563572937', 'eius', '1 minutes', 'Sed numquam ut quas ea quae et odio.'),
(44, 'Dolorum est nihil.', '78528', 'afton29@rau.com', 'adipisci', 'eos', '1563572937', 'est', '3 minutes', 'Qui omnis assumenda dignissimos facere perferendis.'),
(45, 'Nulla voluptatem nihil ut laborum.', '12145', 'bergstrom.beverly@hotmail.com', 'est', 'in', '1563572937', 'eligendi', '29 minutes', 'Aperiam eaque excepturi alias sapiente incidunt sed est.'),
(46, 'Dolores dignissimos magni.', '30324', 'madisyn33@gmail.com', 'qui', 'aut', '1563572937', 'id', '19 minutes', 'Est officiis saepe id repellendus impedit excepturi amet praesentium est.'),
(47, 'Cumque a consectetur occaecati.', '30194', 'bartell.jaeden@yahoo.com', 'sint', 'dolor', '1563572937', 'cumque', '9 minutes', 'Doloribus vel provident doloremque numquam qui doloribus.'),
(48, 'Distinctio deleniti.', '44770', 'jovany.howell@hotmail.com', 'repellat', 'est', '1563572937', 'sed', '23 minutes', 'Temporibus odit rerum at at ut quibusdam.'),
(49, 'Minima enim non.', '32830', 'harris.jolie@gmail.com', 'iste', 'qui', '1563572937', 'provident', '19 minutes', 'Aut et est placeat asperiores eligendi.'),
(50, 'Dignissimos qui.', '16443', 'lesch.amalia@yahoo.com', 'exercitationem', 'placeat', '1563572937', 'eligendi', '26 minutes', 'Sunt impedit explicabo id modi aut temporibus officiis et.');

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

--
-- Dumping data for table `postal`
--

INSERT INTO `postal` (`id`, `postal_type`, `refno`, `postal_from`, `postal_to`, `postal_desc`, `postal_time`, `attachment`, `postal_notes`) VALUES
(1, 'necessitatibus', '47919', 'Quasi nihil.', 'Non.', 'Aut ut est molestiae accusantium.', '1563572938', '', 'In placeat dolores dolores quibusdam at ut.'),
(2, 'sint', '36039', 'Magnam quis quia.', 'Officiis possimus ea.', 'Quae velit consequatur laboriosam quo saepe numquam.', '1563572938', '', 'Rerum dolores blanditiis vero.'),
(3, 'voluptatem', '98290', 'Et in tempore.', 'Voluptas ut.', 'Molestiae nostrum et ut laborum qui dolor.', '1563572938', '', 'Unde eum ut facere.'),
(4, 'voluptatum', '98752', 'Id dolores.', 'Praesentium aut.', 'Quia aperiam ad quia accusantium cum culpa neque.', '1563572938', '', 'Minus recusandae placeat quidem earum atque.'),
(5, 'accusamus', '82976', 'Ea quia.', 'Eos adipisci.', 'Vitae amet voluptas et.', '1563572938', '', 'Esse quae sed commodi harum quam blanditiis.'),
(6, 'qui', '19141', 'Nesciunt.', 'Dolorem.', 'Laboriosam fuga aut accusantium soluta.', '1563572938', '', 'Asperiores ut maxime.'),
(7, 'delectus', '57709', 'Voluptas perferendis.', 'Cum aut.', 'In mollitia suscipit saepe.', '1563572938', '', 'Perspiciatis molestias dolorum reiciendis vel.'),
(8, 'quia', '73161', 'Est.', 'Id.', 'Rerum adipisci ullam aut deserunt ut.', '1563572938', '', 'Itaque est incidunt vel dolor.'),
(9, 'tempore', '21620', 'Optio quam.', 'Corrupti possimus architecto.', 'Repudiandae atque quidem sed fuga tempora eos.', '1563572938', '', 'Non quisquam quo itaque et explicabo.'),
(10, 'qui', '41255', 'Sit facere.', 'Est velit provident.', 'Provident culpa quo quam.', '1563572938', '', 'Quis repellat necessitatibus non dicta.'),
(11, 'totam', '56737', 'Ea illum.', 'Necessitatibus.', 'Fuga et et.', '1563572938', '', 'Est explicabo consectetur nam minus.'),
(12, 'quisquam', '88865', 'Praesentium tempore.', 'Ut.', 'Tempore tenetur.', '1563572938', '', 'Rem iste aut adipisci facilis sit.'),
(13, 'vel', '16167', 'Quia laudantium.', 'Qui.', 'Rem consectetur alias doloremque omnis.', '1563572938', '', 'Accusantium fuga sed commodi et quos hic.'),
(14, 'eveniet', '59230', 'Nam ratione.', 'Ut ullam.', 'Dolor unde ad quasi non magni consequuntur.', '1563572938', '', 'Nulla officia maiores laborum culpa rem.'),
(15, 'laudantium', '43321', 'Velit odit distinctio.', 'Officiis.', 'Similique voluptatem est quo qui assumenda.', '1563572938', '', 'Earum impedit maxime quibusdam.'),
(16, 'asperiores', '30732', 'Autem laborum.', 'Illo hic.', 'Explicabo quia et sint est voluptatem.', '1563572938', '', 'Exercitationem unde nisi aut est voluptatem.'),
(17, 'inventore', '36230', 'Eaque dolores.', 'Qui sunt.', 'Praesentium soluta voluptatem saepe doloribus qui.', '1563572938', '', 'Voluptate eum neque aspernatur assumenda qui.'),
(18, 'est', '77454', 'Minima assumenda maiores.', 'Facere sunt aut.', 'Officia molestiae a voluptas rerum error officiis.', '1563572938', '', 'Non sit odio aliquid tenetur eos.'),
(19, 'id', '87081', 'Facere.', 'Eum voluptas et.', 'Eligendi alias laboriosam.', '1563572938', '', 'Laudantium excepturi occaecati ipsa amet sint.'),
(20, 'magni', '76151', 'Quod libero.', 'Excepturi velit.', 'Alias numquam quia adipisci omnis at est.', '1563572938', '', 'Voluptas vitae eligendi ut et qui ea.'),
(21, 'et', '33481', 'Repellat.', 'Aut.', 'Magni exercitationem et.', '1563572938', '', 'Qui voluptas in quidem fugit sunt.'),
(22, 'nisi', '89703', 'Odio dolorem magnam.', 'Culpa magnam aliquid.', 'Possimus consequatur deserunt quos enim.', '1563572938', '', 'Excepturi eveniet consequatur soluta illum aut repellendus.'),
(23, 'quis', '12959', 'Sapiente corporis.', 'Quas et.', 'Quia eum dolor quia.', '1563572938', '', 'Eos et eos qui facilis quas dolorem.'),
(24, 'assumenda', '26368', 'Similique iste.', 'Quo.', 'Voluptas consequatur aliquam cum.', '1563572938', '', 'Officiis nulla et deleniti.'),
(25, 'et', '94857', 'Molestiae.', 'Non quis molestias.', 'Rerum blanditiis veritatis ipsam iste.', '1563572938', '', 'Veritatis totam adipisci aut ut numquam qui.'),
(26, 'laborum', '59549', 'Similique asperiores recusandae.', 'Incidunt.', 'Occaecati ullam temporibus quia.', '1563572938', '', 'Qui nam aliquam fuga voluptas pariatur.'),
(27, 'omnis', '96291', 'Natus aspernatur.', 'Quibusdam neque voluptas.', 'Nulla qui soluta quod.', '1563572938', '', 'Aut placeat corporis vitae illo.'),
(28, 'architecto', '54268', 'Cupiditate.', 'Voluptate fuga.', 'Veniam quos et ratione qui.', '1563572938', '', 'Ex maiores rerum velit.'),
(29, 'iste', '95349', 'Illum facere.', 'Voluptate explicabo error.', 'Sed iusto repellat quo praesentium et eos quos.', '1563572938', '', 'Et dolor ea enim tempora molestiae.'),
(30, 'aut', '51333', 'Quo.', 'Illo magnam.', 'Quis sapiente soluta debitis ut qui.', '1563572938', '', 'Maiores repellat aut ut illo.'),
(31, 'autem', '75242', 'Ut.', 'Pariatur nihil omnis.', 'Assumenda est reiciendis.', '1563572938', '', 'Earum quasi voluptas molestias.'),
(32, 'voluptatum', '23397', 'Ut et.', 'Minima.', 'Sed iure et.', '1563572938', '', 'Totam omnis cupiditate dolor error dicta ut.'),
(33, 'voluptas', '97135', 'Incidunt.', 'Nostrum.', 'Sint quia culpa fuga incidunt.', '1563572938', '', 'Ut quibusdam odit ad qui quidem est.'),
(34, 'iure', '29065', 'Optio.', 'Voluptatum amet.', 'Dolor a nesciunt ab.', '1563572938', '', 'Dignissimos perferendis reiciendis quasi aliquam repudiandae ut.'),
(35, 'doloribus', '78272', 'Perferendis qui.', 'Aliquam enim.', 'Vitae nihil non veniam.', '1563572938', '', 'Aut quis sunt eveniet.'),
(36, 'aliquid', '99052', 'Voluptate debitis.', 'Neque.', 'Iusto dicta quo voluptatem ea.', '1563572938', '', 'Sed qui sequi eos.'),
(37, 'nulla', '70518', 'Beatae ratione quia.', 'Accusamus.', 'Ipsum delectus repudiandae perspiciatis veritatis inventore.', '1563572938', '', 'Quas doloribus laborum quis.'),
(38, 'enim', '17783', 'Ipsam.', 'Nemo impedit.', 'Enim ad sed tempora velit magni.', '1563572938', '', 'Quae sint accusantium consectetur sit corrupti quos.'),
(39, 'voluptatem', '33418', 'Adipisci sit enim.', 'Consequatur.', 'Corporis possimus eligendi.', '1563572938', '', 'Est qui praesentium eum.'),
(40, 'quibusdam', '66569', 'Distinctio.', 'Veritatis.', 'Mollitia odio voluptates eos sit animi quae aliquam.', '1563572938', '', 'Hic eum corporis.'),
(41, 'cum', '49188', 'Ullam rerum.', 'Sed exercitationem autem.', 'Voluptas mollitia sequi perspiciatis.', '1563572938', '', 'Minus dignissimos ex saepe eos minima.'),
(42, 'id', '42666', 'Alias ut consequatur.', 'Odio facere.', 'Sint voluptas hic quis.', '1563572938', '', 'Consequatur quidem rerum aut nam.'),
(43, 'totam', '55459', 'Consequatur voluptatum.', 'Ad similique.', 'Magni sit incidunt impedit doloremque cupiditate praesentium et nemo.', '1563572938', '', 'Voluptas maiores aut.'),
(44, 'omnis', '28519', 'Cum voluptatem.', 'Ipsa.', 'Reprehenderit doloremque.', '1563572938', '', 'Et quis ex aut et.'),
(45, 'dolor', '49891', 'Sed sed in.', 'Fugiat consequatur dolore.', 'Eius qui voluptate libero ut.', '1563572938', '', 'Quos et commodi et voluptate.'),
(46, 'ducimus', '99991', 'Dolore voluptatem.', 'Voluptas velit.', 'Illo et veniam in.', '1563572938', '', 'Pariatur esse ad.'),
(47, 'molestiae', '92861', 'Quas consequuntur.', 'Et quis.', 'Unde molestiae sint et et.', '1563572938', '', 'Perferendis ex est molestias aspernatur atque qui deleniti.'),
(48, 'rerum', '36238', 'At voluptatem.', 'Perspiciatis et nam.', 'Optio omnis harum dignissimos repudiandae.', '1563572938', '', 'Velit hic aut voluptate incidunt quidem ab nostrum iste.'),
(49, 'fugiat', '42761', 'Ipsum vel pariatur.', 'Doloremque repudiandae.', 'Sed quasi voluptatum qui.', '1563572938', '', 'Nobis voluptates exercitationem nobis inventore explicabo in.'),
(50, 'dolorem', '84192', 'Porro nihil veniam.', 'Officiis non.', 'Ut aut et quia vel et natus.', '1563572938', '', 'Perferendis eum voluptatem sed blanditiis.');

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

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_title`, `role_description`, `def_for`, `role_permissions`) VALUES
(1, 'Super Administrators', '', 'none', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"Administrators.addAdministrator\",\"Administrators.editAdministrator\",\"Administrators.delAdministrator\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"dbExport.dbExport\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"adminTasks.globalSettings\",\"adminTasks.mailSmsSettings\",\"adminTasks.frontendCMS\",\"adminTasks.bioItegration\",\"adminTasks.activatedModules\",\"adminTasks.paymentsSettings\",\"adminTasks.mobileSettings\",\"adminTasks.lookFeel\",\"adminTasks.vacationSettings\",\"Languages.addLanguage\",\"Languages.editLanguage\",\"Languages.delLanguage\",\"newsboard.View\",\"events.View\",\"frontendCMSpages.addPage\",\"frontendCMSpages.editPage\",\"frontendCMSpages.delPage\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"roles.add_role\",\"roles.modify_role\",\"roles.delete_role\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"wel_office_cat.list\",\"wel_office_cat.edit_cat\",\"wel_office_cat.del_cat\",\"wel_office_cat.add_cat\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"students.medHistory\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.del_vis\",\"visitors.add_vis\",\"visitors.Download\",\"visitors.Export\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"postal.list\",\"postal.del_postal\",\"postal.Download\",\"postal.add_postal\",\"postal.Export\",\"postal.edit_postal\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"Hostel.HostelCat\",\"Hostel.EditHostel\",\"Hostel.listSubs\",\"Hostel.AddHostel\",\"Hostel.delHostel\",\"Hostel.list\",\"depart.list\",\"depart.del_depart\",\"depart.add_depart\",\"depart.edit_depart\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.del_enq\",\"enquiries.add_enq\",\"enquiries.Download\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.Download\",\"complaints.add_complaint\",\"inv_cat.list\",\"inv_cat.del_cat\",\"inv_cat.add_cat\",\"inv_cat.edit_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.Export\",\"items_code.add_item\",\"items_code.edit_item\",\"items_stock.list\",\"items_stock.del_item\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"onlineExams.QuestionsArch\",\"onlineExams.delExam\",\"onlineExams.list\",\"onlineExams.takeExam\",\"onlineExams.addExam\",\"onlineExams.editExam\",\"onlineExams.showMarks\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Administrators.list\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Dormitories.editDorm\",\"Dormitories.addDormitories\",\"Dormitories.list\",\"Dormitories.delDorm\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"FeeTypes.delFeeType\",\"FeeTypes.list\",\"FeeTypes.addFeeType\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Incomes.addIncome\",\"Incomes.delIncome\",\"Incomes.list\",\"Incomes.editIncome\",\"Incomes.incomeCategory\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Languages.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"frontendCMSpages.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"roles.list\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"classSch.addSch\",\"classes.delClass\",\"classes.addClass\",\"classes.editClass\",\"complaints.View\",\"enquiries.View\",\"visitors.View\",\"con_mess.View\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\",\"Library.Export\",\"Library.Import\"]'),
(2, 'Administrators', 'Default role for administrators', 'admin', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"adminTasks.globalSettings\",\"adminTasks.mailSmsSettings\",\"adminTasks.frontendCMS\",\"adminTasks.bioItegration\",\"adminTasks.activatedModules\",\"adminTasks.paymentsSettings\",\"adminTasks.mobileSettings\",\"adminTasks.lookFeel\",\"adminTasks.vacationSettings\",\"newsboard.View\",\"events.View\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\",\"roles.list\",\"roles.add_role\",\"roles.modify_role\",\"roles.delete_role\",\"Marksheet.Marksheet\",\"Library.Export\",\"Library.Import\"]'),
(3, 'Prefect', '', 'none', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"newsboard.View\",\"events.View\",\"frontendCMSpages.addPage\",\"frontendCMSpages.editPage\",\"frontendCMSpages.delPage\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"wel_office_cat.list\",\"wel_office_cat.edit_cat\",\"wel_office_cat.del_cat\",\"wel_office_cat.add_cat\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"students.medHistory\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.View\",\"visitors.del_vis\",\"visitors.add_vis\",\"visitors.Download\",\"visitors.Export\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"postal.list\",\"postal.del_postal\",\"postal.Download\",\"postal.add_postal\",\"postal.Export\",\"postal.edit_postal\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"Hostel.HostelCat\",\"Hostel.EditHostel\",\"Hostel.listSubs\",\"Hostel.AddHostel\",\"Hostel.delHostel\",\"Hostel.list\",\"depart.list\",\"depart.del_depart\",\"depart.add_depart\",\"depart.edit_depart\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.del_enq\",\"enquiries.View\",\"enquiries.add_enq\",\"enquiries.Download\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"inv_cat.list\",\"inv_cat.del_cat\",\"inv_cat.add_cat\",\"inv_cat.edit_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.Export\",\"items_code.add_item\",\"items_code.edit_item\",\"items_stock.list\",\"items_stock.del_item\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"onlineExams.QuestionsArch\",\"onlineExams.delExam\",\"onlineExams.list\",\"onlineExams.takeExam\",\"onlineExams.addExam\",\"onlineExams.editExam\",\"onlineExams.showMarks\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Dormitories.editDorm\",\"Dormitories.addDormitories\",\"Dormitories.list\",\"Dormitories.delDorm\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"FeeTypes.delFeeType\",\"FeeTypes.list\",\"FeeTypes.addFeeType\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Incomes.addIncome\",\"Incomes.delIncome\",\"Incomes.list\",\"Incomes.editIncome\",\"Incomes.incomeCategory\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"frontendCMSpages.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\"]'),
(4, 'Principal', '', 'none', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"accountants.addAccountant\",\"accountants.editAccountant\",\"accountants.delAccountant\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"newsboard.View\",\"events.View\",\"frontendCMSpages.addPage\",\"frontendCMSpages.editPage\",\"frontendCMSpages.delPage\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"students.addStudent\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"wel_office_cat.list\",\"wel_office_cat.edit_cat\",\"wel_office_cat.del_cat\",\"wel_office_cat.View\",\"wel_office_cat.add_cat\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"students.medHistory\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.View\",\"visitors.del_vis\",\"visitors.add_vis\",\"visitors.Download\",\"visitors.Export\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"postal.list\",\"postal.del_postal\",\"postal.Download\",\"postal.add_postal\",\"postal.Export\",\"postal.edit_postal\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.Download\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"Hostel.HostelCat\",\"Hostel.EditHostel\",\"Hostel.listSubs\",\"Hostel.AddHostel\",\"Hostel.delHostel\",\"Hostel.list\",\"depart.list\",\"depart.del_depart\",\"depart.add_depart\",\"depart.edit_depart\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.del_enq\",\"enquiries.View\",\"enquiries.add_enq\",\"enquiries.Download\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"inv_cat.list\",\"inv_cat.del_cat\",\"inv_cat.add_cat\",\"inv_cat.edit_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.Export\",\"items_code.add_item\",\"items_code.edit_item\",\"items_stock.list\",\"items_stock.del_item\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"onlineExams.QuestionsArch\",\"onlineExams.delExam\",\"onlineExams.list\",\"onlineExams.takeExam\",\"onlineExams.addExam\",\"onlineExams.editExam\",\"onlineExams.showMarks\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Dormitories.editDorm\",\"Dormitories.addDormitories\",\"Dormitories.list\",\"Dormitories.delDorm\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"FeeTypes.delFeeType\",\"FeeTypes.list\",\"FeeTypes.addFeeType\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Incomes.addIncome\",\"Incomes.delIncome\",\"Incomes.list\",\"Incomes.editIncome\",\"Incomes.incomeCategory\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"frontendCMSpages.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\"]'),
(5, 'Teacher', 'Default role for teachers', 'teacher', '[\"classes.list\",\"subjects.list\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"Assignments.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"classSch.list\",\"trans_vehicles.list\",\"depart.list\",\"desig.list\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"Library.Download\",\"Vacation.reqVacation\",\"Vacation.myVacation\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"academicyears.list\",\"classes.list\",\"events.list\",\"gradeLevels.list\",\"mobileNotifications.sendNewNotification\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"studyMaterial.Download\",\"studyMaterial.delMaterial\",\"studyMaterial.addMaterial\",\"studyMaterial.editMaterial\",\"staticPages.list\",\"mediaCenter.View\",\"students.list\",\"students.Attendance\",\"students.delStudent\",\"students.editStudent\"]'),
(6, 'Student', 'Default role for students', 'student', '[\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Library.Download\",\"Vacation.myVacation\",\"Homework.list\",\"academicyears.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"studyMaterial.Download\",\"Homework.Download\",\"Invoices.list\",\"Invoices.View\",\"Subjects.list\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
(7, 'Parents', 'Default role for Parents', 'parent', '[\"classes.list\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Homework.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Transportation.list\",\"newsboard.list\",\"Invoices.list\",\"Invoices.View\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"academicyears.list\",\"students.list\",\"students.Attendance\",\"students.Marksheet\",\"Homework.Answers\",\"Homework.Download\",\"Library.list\",\"Polls.list\",\"complaints.View\",\"complaints.add_complaint\",\"complaints.list\",\"complaints.del_complaint\",\"complaints.Download\",\"complaints.edit_complaint\",\"complaints.Export\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\",\"studyMaterial.Download\"]'),
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
  `id` int(11) NOT NULL,
  `sectionName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `sectionTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classId` int(11) NOT NULL,
  `teacherId` text COLLATE utf8_unicode_ci NOT NULL,
  `classTeacherId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `sectionName`, `sectionTitle`, `classId`, `teacherId`, `classTeacherId`) VALUES
(1, 'harum', 'molestiae', 4, '94', '84'),
(2, 'esse', 'quia', 1, '67', '90'),
(3, 'molestiae', 'maiores', 3, '67', '73'),
(4, 'fuga', 'dicta', 1, '77', '68'),
(5, 'eum', 'laborum', 3, '58', '76'),
(6, 'sit', 'nisi', 1, '76', '97'),
(7, 'quo', 'quis', 2, '65', '56'),
(8, 'neque', 'ab', 1, '83', '63'),
(9, 'quibusdam', 'omnis', 2, '64', '61'),
(10, 'sit', 'expedita', 3, '100', '67'),
(11, 'ullam', 'nisi', 4, '102', '86'),
(12, 'in', 'non', 1, '82', '71'),
(13, 'autem', 'ut', 4, '93', '54'),
(14, 'incidunt', 'doloribus', 1, '103', '71'),
(15, 'quia', 'fugiat', 1, '63', '100'),
(16, 'asperiores', 'doloremque', 2, '93', '98'),
(17, 'aliquid', 'enim', 4, '95', '78'),
(18, 'qui', 'iste', 2, '102', '60'),
(19, 'cum', 'incidunt', 4, '59', '83'),
(20, 'a', 'et', 3, '81', '68'),
(21, 'consequatur', 'delectus', 4, '82', '68'),
(22, 'qui', 'sint', 2, '64', '67'),
(23, 'quia', 'dicta', 3, '76', '89'),
(24, 'iusto', 'blanditiis', 2, '86', '96'),
(25, 'cumque', 'non', 2, '77', '78'),
(26, 'at', 'inventore', 3, '86', '97'),
(27, 'voluptas', 'et', 2, '93', '89'),
(28, 'corporis', 'eum', 2, '60', '103'),
(29, 'repudiandae', 'enim', 4, '94', '65'),
(30, 'ab', 'velit', 1, '66', '89'),
(31, 'explicabo', 'quia', 3, '55', '74'),
(32, 'soluta', 'distinctio', 2, '68', '87'),
(33, 'sapiente', 'quia', 4, '89', '74'),
(34, 'nam', 'eum', 2, '96', '66'),
(35, 'id', 'impedit', 3, '93', '65'),
(36, 'aliquam', 'unde', 3, '55', '54'),
(37, 'temporibus', 'totam', 2, '102', '76'),
(38, 'eos', 'amet', 4, '58', '65'),
(39, 'quibusdam', 'vitae', 1, '86', '80'),
(40, 'officiis', 'facilis', 2, '62', '96'),
(41, 'eligendi', 'assumenda', 3, '61', '95'),
(42, 'voluptatum', 'repellat', 3, '63', '84'),
(43, 'culpa', 'sequi', 2, '101', '90'),
(44, 'quos', 'voluptates', 4, '80', '88'),
(45, 'eius', 'odit', 2, '71', '58'),
(46, 'aspernatur', 'officiis', 3, '103', '72'),
(47, 'iste', 'ipsam', 3, '98', '104'),
(48, 'vero', 'et', 2, '100', '76'),
(49, 'ut', 'non', 2, '61', '74'),
(50, 'cum', 'laudantium', 3, '89', '84');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `pageTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pageContent` text COLLATE utf8_unicode_ci NOT NULL,
  `pageActive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `static_pages`
--

INSERT INTO `static_pages` (`id`, `pageTitle`, `pageContent`, `pageActive`) VALUES
(1, 'Home', 'Quaerat at est iure ut doloremque ut repudiandae saepe velit culpa fuga hic maiores.', 1),
(2, 'About us', 'Eum et culpa aspernatur sit dolorum sunt praesentium tempora molestiae temporibus quasi assumenda ut sunt pariatur est quidem quidem nisi nesciunt delectus est.', 1),
(3, 'CMS', 'Et quasi laudantium architecto consequuntur dolore rerum tenetur hic at dolor.', 1),
(4, 'Sections', 'Et fugiat quis corrupti voluptates eveniet et mollitia est iste ut porro omnis et.', 1),
(5, 'Subjects', 'Numquam culpa vel libero ut vero possimus et eveniet recusandae architecto.', 1);

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

--
-- Dumping data for table `student_categories`
--

INSERT INTO `student_categories` (`id`, `cat_title`, `cat_desc`) VALUES
(1, 'Sit pariatur.', ''),
(2, 'Sunt qui.', ''),
(3, 'Rerum.', 'Odit quis qui non aliquam ab consequatur est.'),
(4, 'Et fugiat.', ''),
(5, 'Et.', ''),
(6, 'Similique perspiciatis.', ''),
(7, 'Culpa non.', ''),
(8, 'Nobis.', '');

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

--
-- Dumping data for table `study_material`
--

INSERT INTO `study_material` (`id`, `class_id`, `sectionId`, `subject_id`, `teacher_id`, `material_title`, `material_description`, `material_file`) VALUES
(1, '[\"3\"]', '[\"36\",\"37\"]', 8, 58, 'Doloribus qui.', '', ''),
(2, '[\"2\",\"3\",\"1\"]', '[\"43\",\"10\"]', 11, 60, 'Consectetur sit.', '', ''),
(3, '[\"3\"]', '[\"16\",\"4\"]', 15, 56, 'Atque facilis.', '', ''),
(4, '[\"4\",\"3\",\"2\"]', '[\"3\",\"42\",\"45\"]', 13, 92, 'At vero.', '', ''),
(5, '[\"4\",\"1\"]', '[\"10\"]', 12, 97, 'Est assumenda expedita.', '', ''),
(6, '[\"1\",\"3\",\"4\"]', '[\"25\"]', 4, 90, 'Incidunt unde.', '', ''),
(7, '[\"1\",\"4\",\"3\"]', '[\"42\",\"12\"]', 14, 62, 'Quia inventore.', '', ''),
(8, '[\"2\",\"4\"]', '[\"44\",\"46\"]', 14, 92, 'Est voluptatem.', '', ''),
(9, '[\"4\",\"1\"]', '[\"19\"]', 7, 82, 'Quia nesciunt.', '', ''),
(10, '[\"2\",\"4\",\"1\"]', '[\"24\",\"36\",\"2\"]', 9, 86, 'Omnis.', '', ''),
(11, '[\"4\",\"1\",\"2\"]', '[\"43\"]', 10, 61, 'Nihil minus.', '', ''),
(12, '[\"1\"]', '[\"7\"]', 14, 78, 'Consequatur.', '', ''),
(13, '[\"4\",\"3\"]', '[\"41\",\"6\",\"25\"]', 1, 54, 'Laboriosam non.', '', ''),
(14, '[\"2\",\"4\",\"1\"]', '[\"15\"]', 7, 78, 'Autem qui dolorem.', '', ''),
(15, '[\"3\"]', '[\"23\"]', 7, 72, 'Similique quas.', '', '');

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

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subjectTitle`, `teacherId`, `passGrade`, `finalGrade`) VALUES
(1, 'Ipsum exercitationem doloribus.', '[\"84\"]', '20', '100'),
(2, 'Unde architecto.', '[\"55\",\"101\",\"65\"]', '40', '100'),
(3, 'Aspernatur quas.', '[\"62\"]', '20', '80'),
(4, 'Mollitia quia.', '[\"61\",\"62\",\"57\"]', '50', '70'),
(5, 'Rerum omnis.', '[\"100\",\"75\",\"64\"]', '50', '60'),
(6, 'Omnis sapiente ratione.', '[\"100\"]', '30', '80'),
(7, 'Architecto blanditiis.', '[\"103\",\"89\"]', '40', '70'),
(8, 'Accusantium facere possimus.', '[\"82\"]', '30', '60'),
(9, 'Enim sint.', '[\"71\",\"83\",\"66\"]', '30', '90'),
(10, 'Non.', '[\"93\"]', '30', '60'),
(11, 'Non esse.', '[\"73\",\"100\"]', '20', '80'),
(12, 'Dolores quis.', '[\"84\"]', '40', '80'),
(13, 'Quo ut.', '[\"75\",\"74\",\"97\"]', '20', '90'),
(14, 'Cum deserunt.', '[\"88\",\"104\"]', '50', '80'),
(15, 'A laboriosam.', '[\"56\",\"77\",\"80\"]', '30', '60');

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

--
-- Dumping data for table `transportation`
--

INSERT INTO `transportation` (`id`, `transportTitle`, `routeDetails`, `vehicles_list`, `transportFare`) VALUES
(1, 'Enim.', '', '[\"3\",\"4\"]', '800'),
(2, 'Facilis et.', '', '[\"7\"]', '610'),
(3, 'Dolorem.', 'Incidunt et qui consequatur.', '[\"6\",\"9\"]', '810'),
(4, 'Et quasi.', '', '[\"4\",\"5\",\"8\"]', '800'),
(5, 'Aut provident.', '', '[\"10\",\"4\"]', '500'),
(6, 'Nemo.', 'Expedita expedita et corrupti.', '[\"4\",\"1\",\"5\"]', '810'),
(7, 'Deleniti.', '', '[\"2\",\"6\"]', '660'),
(8, 'Beatae.', 'Deserunt fuga quia magni.', '[\"4\",\"8\",\"7\"]', '650'),
(9, 'Non.', '', '[\"4\",\"3\",\"8\"]', '810'),
(10, 'Nemo voluptatem.', '', '[\"5\",\"6\"]', '810'),
(11, 'Praesentium.', 'Dolor quia temporibus harum.', '[\"9\",\"4\"]', '820'),
(12, 'Qui.', 'Temporibus facilis eos.', '[\"9\",\"10\"]', '810'),
(13, 'Asperiores.', '', '[\"9\",\"10\"]', '890'),
(14, 'Omnis.', 'Necessitatibus cum.', '[\"6\",\"5\",\"10\"]', '730'),
(15, 'Error in.', 'Accusamus qui sequi.', '[\"8\"]', '860');

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

--
-- Dumping data for table `transport_vehicles`
--

INSERT INTO `transport_vehicles` (`id`, `plate_number`, `vehicle_color`, `vehicle_model`, `driver_name`, `driver_photo`, `driver_license`, `driver_contact`, `vehicle_notes`) VALUES
(1, '6744', '', 'officia', 'Cullen Will MD', '', '669317160615799', 'Odio quia aut eos sed.', 'Quibusdam molestiae perspiciatis qui sunt voluptate.'),
(2, '2500', '', 'quibusdam', 'Baylee Dooley', '', '507081263072820', 'Asperiores facere totam laudantium.', 'Quidem optio dolorem.'),
(3, '7151', '', 'est', 'Edgar White', '', '181273027549868', 'In praesentium dolore rem rem.', 'Perferendis nam odit itaque impedit.'),
(4, '5091', '', 'quisquam', 'Imani Block', '', '942688547683622', 'Et placeat quia.', 'Velit autem laboriosam non.'),
(5, '8965', '', 'ipsam', 'Prof. Wade Simonis', '', '740622421564051', 'Et ipsum cumque.', 'Cupiditate veritatis modi.'),
(6, '9957', '', 'ducimus', 'Rebeka Keeling DVM', '', '314796478260066', 'Ad officia.', 'Quae corporis et doloribus tempora atque ducimus.'),
(7, '7473', '', 'sunt', 'Mr. Alexandre Walsh', '', '461389435963713', 'Modi id quae est.', 'Et perferendis sequi tenetur voluptas.'),
(8, '8099', '', 'aspernatur', 'Kristofer Dietrich', '', '203446602215467', 'Voluptatem expedita aut.', 'Et reprehenderit qui.'),
(9, '3788', '', 'sed', 'Alec Watsica', '', '282354415290698', 'Atque eum doloremque quidem molestias nihil.', 'Voluptates molestiae id.'),
(10, '8767', '', 'reiciendis', 'Guy Weimann', '', '871895088736061', 'Et quo excepturi.', 'Quia magni quidem architecto animi.');

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `remember_token`, `fullName`, `role`, `role_perm`, `department`, `designation`, `activated`, `studentRollId`, `admission_number`, `admission_date`, `std_category`, `auth_session`, `birthday`, `gender`, `address`, `phoneNo`, `mobileNo`, `studentAcademicYear`, `studentClass`, `studentSection`, `religion`, `parentProfession`, `parentOf`, `photo`, `isLeaderBoard`, `restoreUniqId`, `transport`, `transport_vehicle`, `hostel`, `medical`, `user_position`, `defLang`, `defTheme`, `salary_type`, `salary_base_id`, `comVia`, `father_info`, `mother_info`, `biometric_id`, `library_id`, `account_active`, `customPermissionsType`, `customPermissions`, `firebase_token`, `updated_at`) VALUES
(1, 'ahmedsk', 'parisian.dino@stehr.biz', '$2y$10$4QZRFuIhvsNNhi3A9ftax.qjM1YdMnF1B6BToH111pRTSVavcrvsS', 'lZzZtW4CSxdRTWcukGKZLaU0nVulRroEGTJMVHFmnlJhXu0QCbwlIWxBfeXR', 'Ahmed Sayed', 'admin', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '686477', '+32 6522616', 0, 0, 0, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(2, 'Virtu', 'laury.rau@gmail.com', '$2y$10$QhPD.rXgYFKPqBV9sveC9ON0JsAOD2kl4T1028AjE0ntVeSzBiNIm', '', 'virtu', 'admin', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '331081', '+64 9199772', 0, 0, 0, '', NULL, '', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'employee', 'nathan.mclaughlin@hotmail.com', '$2y$10$7RABTpMhqqu0TWAlnoE64uL1ERbZcmlypIvg8lz8xgJPslEGdNvaG', '', 'Prof. Edgar Haley', 'employee', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '858015', '+51 3907724', 0, 0, 0, '', NULL, '', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'hermiston.cheyanne', 'ygorczany@bogan.com', '$2y$10$XnkvCVPP7yAPhM4u/wbKJ.h6ccgx0KNJk2BYLyr89ehpOKsxAOk9W', '', 'Alycia Lindgren', 'employee', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '817034', '+76 6254102', 0, 0, 0, '', NULL, '', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'marlene26', 'krystina84@gmail.com', '$2y$10$SObRny9yEssJLQeYV0SENOSPxjP48BqPA1iwjp7dC0xDrxupVCIz6', '', 'Zola Glover', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '898657', '+86 3644088', 0, 0, 0, '', NULL, '', '097.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'kunde.haven', 'fkutch@runolfsson.com', '$2y$10$Vjl1wAap7yOz6o6K2pv2b.QUHOs2l.HV8O1ReetzcD30kWbOQtkce', '', 'Fidel Tillman', 'employee', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '108905', '+85 9041160', 0, 0, 0, '', NULL, '', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'rkeeling', 'timothy23@yahoo.com', '$2y$10$dSjJJgTtfmgjMe5VYzGT3.23YUGf.TZMFDPlXV7DYqIzVvTgkeTPm', '', 'Hilma Schuster', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '934112', '+29 4480279', 0, 0, 0, '', NULL, '', '073.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'gardner41', 'houston60@yahoo.com', '$2y$10$o568oqE5pzKOEo7CovBXt.4xI.FYCN7Os6XZLTFRMJhFs38OQHdBC', '', 'Leonel Haley', 'employee', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '273675', '+72 8066856', 0, 0, 0, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'reilly.margot', 'bwalsh@huel.net', '$2y$10$I3CVjiSa7vQyrDKYjxlF8uu4u.b2M.m.WDJp1/AaQAD5AMCCFoqli', '', 'Josefa Turcotte Sr.', 'employee', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '203113', '+61 1077645', 0, 0, 0, '', NULL, '', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'florine83', 'neva78@gmail.com', '$2y$10$.QH.3J8n56fIJGZmjGD/LeoGtKe.dsUv8eGSCZlWvnI6qbtmF9P2m', '', 'Samantha Howe IV', 'employee', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '813733', '+29 5150273', 0, 0, 0, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'unique44', 'juanita.christiansen@yahoo.com', '$2y$10$8NO6B7rpKjWozGxjULXGaeUh751AmkK0NjmPAf.ebAkXTSSNAcKhO', '', 'Prof. Tyrique Turner PhD', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '912797', '+97 2818377', 0, 0, 0, '', NULL, '', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'aeffertz', 'pagac.jerrod@yahoo.com', '$2y$10$7BvLUvgsLbUM0VyIxPDLveLNujFoaGBzA6lR3kAAtEdZC2SqYAKxm', '', 'Prof. Suzanne Glover V', 'employee', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '428092', '+71 2760485', 0, 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'mante.jaquelin', 'bradley.renner@becker.biz', '$2y$10$YhEaCco5rm1Lg4KAQhkPROH6bPnSRI0Gqc2NuXWMOm2yNK2MdNcvi', '', 'Earlene Gutkowski DDS', 'employee', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '314291', '+92 3838375', 0, 0, 0, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'gottlieb.delia', 'rosemary.pfannerstill@hotmail.com', '$2y$10$iIa4HXVotDHyNtwiEs8ntu8yATaGuoXPsMBzINTBv2Nee5YAl9ZMW', '', 'Scarlett Hammes', 'employee', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '333202', '+91 8207190', 0, 0, 0, '', NULL, '', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'thad.hettinger', 'ybailey@yahoo.com', '$2y$10$bZ.x.VhsA2fqldc2v6srr.2OmxSntS28hKl38qifFpZFzKjzhovc6', '', 'Dr. Wilbert Feest DDS', 'employee', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '235148', '+50 7841603', 0, 0, 0, '', NULL, '', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'cordelia.mueller', 'walker.brooklyn@dickinson.com', '$2y$10$A/.UAw5XE8.gMEpRrPE1u.Qtr/lhB9iaoPmVStS7BAGSxgU1Swo42', '', 'Shanie Ondricka I', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '243577', '+66 2676887', 0, 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'rbecker', 'ebotsford@gmail.com', '$2y$10$pGivKVjYfOtNE1Dos/8BQukGQFO45ry1QNXspDpPhTXiCjeit61p2', '', 'Narciso Hand', 'employee', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '318158', '+67 4358395', 0, 0, 0, '', NULL, '', '079.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'kemmer.gillian', 'tyree.sauer@ratke.net', '$2y$10$3oYgJ/09cupLLeJTU6fffekTErisOtdLAjGYyADpwtcy13ve5pN/q', '', 'Paula Kozey', 'employee', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '158720', '+24 8398111', 0, 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'nigel16', 'dante40@zulauf.com', '$2y$10$7elxN1CjhONU8uVqFZ2Pt.dIUoxzhnVL5ECZr1f4DU8AllqZ5K3MO', '', 'Abel Langworth', 'employee', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '772849', '+48 3990381', 0, 0, 0, '', NULL, '', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'schaden.axel', 'jweissnat@goyette.com', '$2y$10$oLn7nfAE5.ZjoHHgwIBfS.VyFmYVQ8x2P0HTGKWrxokmjN1ztT06i', '', 'Ms. Emelia Weissnat', 'employee', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '545374', '+21 7615280', 0, 0, 0, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'fay.triston', 'rory.leuschke@toy.com', '$2y$10$sY21SXyhUoWqRl9ltKmdsOe5YXr.sYBbDt9j.thghhz2ywTlah2zi', '', 'Fleta Collier', 'employee', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '422405', '+41 6735771', 0, 0, 0, '', NULL, '', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'tad01', 'plabadie@friesen.com', '$2y$10$DjXMMv5B1x83rN3dO/s7r.VtL5EEfRrOTobEiCdZvc/9iez7L6LIG', '', 'Jessie Sanford', 'employee', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '661087', '+26 4687797', 0, 0, 0, '', NULL, '', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'bailee92', 'ray84@hotmail.com', '$2y$10$uepSEzPE2ZTxsG.HwiLauuf09qQBURvu4i6NjSeE3m6qB8AaTSkIO', '', 'Dr. Cletus Gibson PhD', 'employee', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '810069', '+25 6482049', 0, 0, 0, '', NULL, '', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'stroman.constantin', 'meggie.bechtelar@eichmann.net', '$2y$10$stG5LP9W3i8Ej4vqGk32WebkPpLhEiU1gOqeWrue/1v7qTclsm8jm', '', 'Jacey Jakubowski', 'employee', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '971929', '+36 7189499', 0, 0, 0, '', NULL, '', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'joana.effertz', 'gulgowski.laura@okon.com', '$2y$10$gMF8WBY.jqvZkHyUgWQR0.LRB5UY47h2XKdx1NM7XsZin76W5NUu2', '', 'Mariela Zieme PhD', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '786597', '+70 7564278', 0, 0, 0, '', NULL, '', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'luis03', 'odonnelly@gmail.com', '$2y$10$5UInGEZzHU5DQOandPd9YeaN4R44wPLMSEic5RSjeHj4Wda8pnQv.', '', 'Prof. Janie Mertz', 'employee', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '331738', '+41 2252848', 0, 0, 0, '', NULL, '', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'bcremin', 'arvid68@nader.info', '$2y$10$.xgh86VuQVCiBdI16vdaS.eZNB7ZBkpbpsIOlAe0oPeBUh6nl2QUe', '', 'Leonel Cruickshank', 'employee', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '759012', '+72 8390185', 0, 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'zachery.hintz', 'koby.murray@hotmail.com', '$2y$10$LJ1jDRlAzUJZ7tDdM3cmqu7IPLy73k9E6WCZohNE5bfJXWYG8/0ia', '', 'Estelle Jerde', 'employee', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '918948', '+79 9019806', 0, 0, 0, '', NULL, '', '065.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'crunolfsson', 'emard.josiane@sawayn.com', '$2y$10$CBz8FuWKxEkQ4Fs2bN8j2.eG0CSw/8hL7dskN/uAMwPbZG6buNNFu', '', 'Alysa Crist', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '769020', '+67 8249391', 0, 0, 0, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'kemmer.otto', 'zkling@gmail.com', '$2y$10$6DhwQ2eQBubyqWTmA8AqJe/ePVX58q5scsaLNuHPkV1V8q1Lk.w8C', '', 'Emilia Wiegand', 'employee', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '341533', '+69 9993416', 0, 0, 0, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'layla.klein', 'fisher.jensen@gmail.com', '$2y$10$n0PJK/jMXlufTRc7MybV2uXyiEAaf8vaSvs/dw6u576BfM1fYyp7i', '', 'Julien Leannon', 'employee', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '774071', '+53 2404102', 0, 0, 0, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'polly.shanahan', 'hailey29@considine.org', '$2y$10$/XxwNN/1/FNcSEmd95lmvueXIv4Z4xMg2lWtVR1QlF3qmg4NMbeti', '', 'Malika Yost', 'employee', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '286740', '+23 6208043', 0, 0, 0, '', NULL, '', '057.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'ghahn', 'hgoodwin@gmail.com', '$2y$10$e7qsBncpNVNOdu.71ilOwe03N5WYCsObWMJHtq5y2dh29eplnqey2', '', 'Prof. Geovanni Paucek', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '934170', '+68 4804492', 0, 0, 0, '', NULL, '', '060.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'oabshire', 'emard.wilhelmine@hotmail.com', '$2y$10$CMK7C9WCAUkSrpLL35PW9OoSKzrnTza3Cx1TcXi3.O.DOLe2cqDqy', '', 'Sam Russel', 'employee', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '660483', '+28 7476846', 0, 0, 0, '', NULL, '', '098.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'heathcote.zita', 'cpollich@cole.biz', '$2y$10$1.isEZfwPHqWwV2LowqoF.wcU3aUQhKPZbdI5fp98UcUzV6pKoyo2', '', 'Prof. Vincent Wyman IV', 'employee', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '725320', '+36 3433760', 0, 0, 0, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'nicholaus.reynolds', 'ahane@hotmail.com', '$2y$10$wztE8Y/ojWeQsUO.zhk5NO0jGZLsCO5QFUnr9O6FCf4ViNouahrSW', '', 'Tatyana Goodwin', 'employee', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '604177', '+31 4666034', 0, 0, 0, '', NULL, '', '025.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'abigail19', 'qblock@jacobs.com', '$2y$10$bOxfkpcfys964LGOTjnp8e1GX/lVLgtMMseKRhPyBdu43.3vTrpzS', '', 'Camila Lang III', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '841984', '+82 8990443', 0, 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'ellis.kris', 'ava.donnelly@auer.com', '$2y$10$iXe6fvZkXUPU6u5z18WPIe0quDNqpcKuGGETjck4rriKgXBFXipSK', '', 'Laurine Graham', 'employee', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '943343', '+69 2578787', 0, 0, 0, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'uwalker', 'pauline.gleason@gmail.com', '$2y$10$O5zeh.w7Mp.z32Mran5kSO79ZRwjT30AaBrP3/WJeJVAxbhALahNi', '', 'Ethel Luettgen', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '220213', '+15 1745132', 0, 0, 0, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'morissette.jazmyne', 'wyatt14@yahoo.com', '$2y$10$mlOcZGx5YUGtoosoA5mGXem73fY2ZSNQiDdGKvqgc64uGeP3wEyS2', '', 'Lacey Heaney Sr.', 'employee', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '319385', '+58 7581234', 0, 0, 0, '', NULL, '', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'cayla.hudson', 'kobe.monahan@kertzmann.net', '$2y$10$MZfyPTIJYMkqEpgDn3lWeeL9h3z9MmbxEgW7lPfeousQUFkaBwxFm', '', 'Jimmie Heaney', 'employee', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '854342', '+75 7276977', 0, 0, 0, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'leta.bergstrom', 'duane.huel@hammes.com', '$2y$10$qHMjVV2KArsapNKPhrFTZ.wnlh4FkIPzml/vgHCGOvA/VLDXE1B8i', '', 'Sterling King', 'employee', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '164691', '+26 9659546', 0, 0, 0, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'alexie.boehm', 'dare.oliver@jones.com', '$2y$10$dyQGU5vC/jYghxY0PJKqeOCFAZb9yW/ottb3Dn0zf.zDr5xknpL.W', '', 'Clifford Nicolas', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '139349', '+58 6815965', 0, 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'smante', 'vohara@ortiz.net', '$2y$10$FewpYGPn816QoUeY38tZ9.v84yazeIGe8sgbjiKRmHXOHRZOuTD6K', '', 'Valerie Muller', 'employee', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '203340', '+45 2851123', 0, 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'hamill.duncan', 'bette.heller@wunsch.com', '$2y$10$Axxh1lGFGIoOjKUNu6gSE.trrkoE0AypoXtTKsPBeEwJVakWmGdt.', '', 'Miss Lea Treutel I', 'employee', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '981985', '+67 6946369', 0, 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'britney25', 'gregorio78@yahoo.com', '$2y$10$yqtNhv4S5lh.xTmwBge4BOZF7CECiNGJRxW10yyhazWv6jB1tChue', '', 'Velda Mosciski Sr.', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '266098', '+34 4376536', 0, 0, 0, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'shanahan.marie', 'lubowitz.otto@mcglynn.com', '$2y$10$Vhok3ThyRWkpJ8P6uQQpjeNsmBYIyVl8w0LAhKzTP2./2q0Ruuv2G', '', 'Lina Schuster', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '531865', '+76 7116359', 0, 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'jeremy.prosacco', 'miller.jayde@hotmail.com', '$2y$10$7MGld.7NDyG9l8HAHZlwqO1sIbDgASoCXcFUSVkIdD1WKWSy8S1/e', '', 'Lee Ernser Sr.', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '359597', '+60 1675433', 0, 0, 0, '', NULL, '', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'melody69', 'hassie86@hotmail.com', '$2y$10$5K1jS7wPcQImA85fu92hleKm.ygEDRtxjB9WWepW1opLRHzAl6zPy', '', 'Danika Bednar I', 'employee', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '643640', '+55 8975907', 0, 0, 0, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'nmann', 'webert@hotmail.com', '$2y$10$C7nzSrZwEsQR6mySeDGP4e/stbQQRL5I9hzdZHlchmi7LnTbpL46q', '', 'Emmet Nolan', 'employee', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '518662', '+18 7518881', 0, 0, 0, '', NULL, '', '07.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'barton.everette', 'gennaro.sanford@mccullough.org', '$2y$10$eqVVj8M31Qfz7Omho2ZLt.nj/cn0m0T8/6jcjK.Sdre4tfHaXzZOO', '', 'Shanie Cronin', 'employee', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '517434', '+48 2388492', 0, 0, 0, '', NULL, '', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'kuhic.robbie', 'dkiehn@hotmail.com', '$2y$10$h/WEobkTwxs77quZf3CGmOqdZ9789OB.R74kc8CZUrcZkvRAV5H1q', '', 'Miss Matilda Romaguera DVM', 'employee', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '688122', '+17 8599003', 0, 0, 0, '', NULL, '', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'cathy92', 'leannon.rosemary@hotmail.com', '$2y$10$PT/y2fPaFp9HvgkLY4Rjcu2zGMXZxBvRr.50fHxM4V0IMdYMIlZsC', '', 'Kasandra Stanton DVM', 'employee', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '825951', '+72 5255313', 0, 0, 0, '', NULL, '', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'teacher', 'jamarcus.rutherford@pollich.com', '$2y$10$GHHiY2Uqsa9MGj467OyOT.QX5vwtpr/pFD2QT27iikFan2ytY0fyG', 'xuM5P42qE6krsbrRoXoqaqbkwdLQsr2K8fgj24j1luwI6eaisTGmVZTRwnCj', 'Myrtice Schulist', 'teacher', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '108726', '+29 3363858', 0, 0, 0, '', NULL, '', '053.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'wkoelpin', 'wilson.lang@turner.info', '$2y$10$2Uft8RVpFUesjXcFJ08OkOI4VHrUshazeIYzaGCSBFIYvSlFEZdn.', '', 'Emmitt Johnston', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '804132', '+73 9237798', 0, 0, 0, '', NULL, '', '031.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'iweimann', 'stiedemann.angelita@schinner.net', '$2y$10$IPWWBRYjCjqSGqkeqmY7xeRjcs12zbYzXAvr1GkcXTkjUs/g4.8p6', '', 'Dr. Ericka Wisozk', 'teacher', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '765829', '+26 8321104', 0, 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'vidal.quigley', 'eunice10@howell.com', '$2y$10$kIhYe/kOXdojdRFVGkOuZe/U0FHaNvhV9EJRPwvVz3JntvOe7kQRu', '', 'Dr. Braden Bauch V', 'teacher', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '531638', '+95 8672378', 0, 0, 0, '', NULL, '', '027.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'sibyl76', 'brandy.schumm@hotmail.com', '$2y$10$yaBl2HN2eusoUBh/SMnbjO0NHTcwp2OXM6TsKvze8Vgll/eaBD6z2', '', 'Melany Terry', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '833803', '+74 5326239', 0, 0, 0, '', NULL, '', '06.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'ggreen', 'kris.laury@yahoo.com', '$2y$10$c45PeA7zf/7aorHx/ZXdeuG0mYpqy.XKko70jAEka7YgYEWBJnT.O', '', 'Humberto Marvin III', 'teacher', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '208409', '+97 8603258', 0, 0, 0, '', NULL, '', '01.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'ehagenes', 'catharine.hudson@gmail.com', '$2y$10$SWSEDaDYi3MJpJ4/d3DrkOd.DGDgd8HLWJao2L/q/2uXv7RKxneUy', '', 'Ellsworth Bode', 'teacher', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '596934', '+21 8327868', 0, 0, 0, '', NULL, '', '057.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'modesta27', 'alessandro71@hotmail.com', '$2y$10$QfsS1ws/4.2Y3k9h81efjOcs3mZnO1javjlULymmVqJvWt37up95K', '', 'Willie Tromp', 'teacher', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '776635', '+77 5692158', 0, 0, 0, '', NULL, '', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'grogahn', 'jackeline57@gmail.com', '$2y$10$ZMWDzMxKAJuPPnQ7oP.lJ.Hnh1eT7J4raZLy8tdJiXwG33RNJL/qe', '', 'Eliezer Spencer', 'teacher', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '450115', '+39 5234729', 0, 0, 0, '', NULL, '', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'ischaefer', 'aaron17@yahoo.com', '$2y$10$eFuChorXjs6h1nRlXjPKPOfhkQ8scaTO6ZYEQHd/ddvZZP53MG3qK', '', 'Miss Carli Luettgen I', 'teacher', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '957174', '+19 4000597', 0, 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'ztrantow', 'hiram06@hayes.net', '$2y$10$3JGKiy7v1LmanO6DXznqVe.SPkHoipPTl/7PR2u30u/V2Lcwcs5jO', '', 'Dallas Treutel MD', 'teacher', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '941125', '+75 2740188', 0, 0, 0, '', NULL, '', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'robb.hand', 'fharber@gmail.com', '$2y$10$SvkcWInJb5fw9fTvFq9WSObVlkuHJeNcrdfGOHQKJF8T7TWY32zxO', '', 'Ernestine Gulgowski', 'teacher', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '187881', '+81 3707300', 0, 0, 0, '', NULL, '', '032.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'schmeler.rosemarie', 'tanner.conroy@weber.com', '$2y$10$Ij5NmAhFxHxOGK1roYQtreW0AWFeQSjGU6OuXeOsNS/c4r9xf4Yoa', '', 'Violet Leannon DVM', 'teacher', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '312602', '+34 3677752', 0, 0, 0, '', NULL, '', '097.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'fswaniawski', 'cassidy02@hotmail.com', '$2y$10$yiZfDDwE5zahiF9QH0JCDO/CFt8rmUR9FmkbMU/pmy05OoTUw6WUm', '', 'Tania Stiedemann', 'teacher', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '675147', '+80 5635778', 0, 0, 0, '', NULL, '', '047.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'bruen.stanley', 'guy.kuvalis@hotmail.com', '$2y$10$9GHXxoPmxNyEj0446wp4aOrFqDHBNxVX5cVhZ4a27.tmwJU5LDEyS', '', 'Calista Conroy', 'teacher', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '977288', '+57 4047308', 0, 0, 0, '', NULL, '', '074.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'weber.trudie', 'hartmann.jarrell@bahringer.info', '$2y$10$sYiK9vAfjHEzcwrT28PsZ.AmJcGDMNWtEY5JW5.1ggNMnOaeow7ga', '', 'Orpha Marvin', 'teacher', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '444019', '+39 3387255', 0, 0, 0, '', NULL, '', '044.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'sfahey', 'nkoss@gmail.com', '$2y$10$xKYk6PnCxjTBuUMVtO5MUeB2AUNNH0heDrb1IGTdsTbQvZXf/kKVq', '', 'Charles O\'Connell', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '624676', '+95 5863858', 0, 0, 0, '', NULL, '', '049.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'btorp', 'king.adolf@smith.com', '$2y$10$ZJF/ACX0/xnZXOPVjdB6quIdSs/negq6Y7vNV67TqnrIrmbn8uJ1G', '', 'Larry Kunde', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '592703', '+73 3155971', 0, 0, 0, '', NULL, '', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'eshields', 'erdman.enola@leuschke.com', '$2y$10$ufIi2naTgUAiPzvlOzKLOe2fV0iyx0KUTU9NskTqzyewqHi5IDYT.', '', 'Elody Collier', 'teacher', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '285634', '+40 8790495', 0, 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'schultz.coleman', 'xtrantow@yahoo.com', '$2y$10$LZRA7SuH3LSHRb3tnDUAme78YRGF7e5yECDDekEnyy.MJ2wXzwmWq', '', 'Mrs. Phoebe Morar', 'teacher', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '119368', '+56 1926066', 0, 0, 0, '', NULL, '', '045.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'carlie93', 'yrau@hotmail.com', '$2y$10$SF.lx8Lg2LfH514rUWSWZe4FjU1rlgYZN6Fw64M/ZP5ypMDJXv1tK', '', 'Claude Miller', 'teacher', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '457409', '+95 4053383', 0, 0, 0, '', NULL, '', '029.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'melissa06', 'polly08@effertz.info', '$2y$10$2wOLQevBq25B5gp4Qc7w4.lEh1/A4wfk2VoaHx0od.7q46UiBl5.S', '', 'Hallie Doyle', 'teacher', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '525683', '+18 7796342', 0, 0, 0, '', NULL, '', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'matt83', 'brunolfsdottir@yahoo.com', '$2y$10$RyuyHGQnFKPN4pSi5UAnQ.3oDO/GTDji4tDaAJ6oIadZc4Z8cPRgu', '', 'Vernie Wuckert', 'teacher', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '113461', '+53 6763385', 0, 0, 0, '', NULL, '', '022.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(77, 'pinkie.mcglynn', 'johnson22@stokes.com', '$2y$10$GyVSUpSdELznCUd1IxPrp.mIk.8WSfFQ/3NgJ1fDOrMKju7yIQjA6', '', 'Erick Dietrich', 'teacher', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '329412', '+85 6686821', 0, 0, 0, '', NULL, '', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'qcummings', 'okuneva.ophelia@gmail.com', '$2y$10$UU/Fy2kkbaMF5aOg3PLtJe7rLE3US0lnakH7526at2p7DVR.CRwZC', '', 'Dr. Gaetano Cummings MD', 'teacher', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '697033', '+78 9770154', 0, 0, 0, '', NULL, '', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'vgerhold', 'qstehr@hagenes.biz', '$2y$10$ft7A8DVHWv1anevOspNUvO1JCTnKvN3GK0.g.U0p7Mt3j.hoKTH1.', '', 'Dr. Vernie Fadel DDS', 'teacher', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '892510', '+30 6785280', 0, 0, 0, '', NULL, '', '070.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'dconsidine', 'cortez.berge@jacobs.info', '$2y$10$dwm786cdDwqItDpNSUClQepmYDtYAMU/p2EjAdxyEIdZiwe/g/tL.', '', 'Royce Schroeder', 'teacher', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '512138', '+23 6954173', 0, 0, 0, '', NULL, '', '011.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'marilie.cormier', 'evolkman@yahoo.com', '$2y$10$X3LTC0a3WSq0mXWdmhCck.GSmhQLlMI768Q.zyCc5i87eovMSwuTq', '', 'Raven Howe', 'teacher', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '305168', '+81 7574137', 0, 0, 0, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'patrick.stoltenberg', 'kdouglas@yahoo.com', '$2y$10$YP1NSVyT1n4VaBO5q8QN8eljHR6OyWz6yfokS6S9nmV1D1ZtO.hU.', '', 'Arden Jacobi', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '783341', '+60 6313325', 0, 0, 0, '', NULL, '', '054.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'sawayn.noemi', 'boehm.mustafa@gmail.com', '$2y$10$M.td0btTXQWF3oPjPAXB.uSd2XToybo.SmlfH6qjPfoXi9FqdmTPC', '', 'Eudora Reinger', 'teacher', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '610842', '+91 4801612', 0, 0, 0, '', NULL, '', '012.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'stanton.janet', 'anderson.kip@gmail.com', '$2y$10$Khi8SX09MKgJiQOXCx8OROUd0RMA9Wab9XY7c7eMuXkwYkwsKUeXK', '', 'Keagan Swift', 'teacher', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '236851', '+30 1616668', 0, 0, 0, '', NULL, '', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'zgaylord', 'vbergnaum@dubuque.com', '$2y$10$uR6CO9YmL98iiSQ7Jyh1n.ch.FQYPCtIlSaSRzNH/lrkyzkG8G03C', '', 'Dr. Murray Bruen Jr.', 'teacher', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '213857', '+64 9013879', 0, 0, 0, '', NULL, '', '058.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'dimitri.parker', 'alvena.jones@harber.org', '$2y$10$TR1r6CoeZT0TSlDfsRDSJOuB.Rd.3Oq6d0uhZxfm3MSB6J5gQHvAa', '', 'Palma Boyle', 'teacher', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '895426', '+41 4987270', 0, 0, 0, '', NULL, '', '090.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'emard.hobart', 'daugherty.misty@hotmail.com', '$2y$10$e6mqO/RVCxOu4i1CcnQQK.jBS09k2lDManhJS1YUrDl8415obW5.m', '', 'Dr. Gregg Reilly', 'teacher', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '470819', '+49 7463392', 0, 0, 0, '', NULL, '', '080.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'hoppe.aniyah', 'wolff.niko@hotmail.com', '$2y$10$mI/68Gt3x0dp2Flr1Oxqs.sWfoHXLJ.zCdh89uvyo9E4QQ0DiaqKa', '', 'Charlene Ratke', 'teacher', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '459940', '+56 6587930', 0, 0, 0, '', NULL, '', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'misty04', 'henderson98@abshire.net', '$2y$10$/MF3LPuveXtY6ufWnJ3wLOzKmtLx3ATBF5Hgj6IBpev2A21pJDAwS', '', 'Meggie Stanton', 'teacher', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '788872', '+51 3943733', 0, 0, 0, '', NULL, '', '044.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'rath.adell', 'mcrist@gaylord.org', '$2y$10$juMXCRTlJXGFi/eVkX5jQOPKDTUPZFZS/CKhalV1IVcpRXD8VqJoe', '', 'Koby Hahn MD', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '134982', '+82 1541237', 0, 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'volkman.harold', 'aubree31@johnson.com', '$2y$10$D4aHUPLcOVxEdlu71GncLeIvwf0X4VMbW9c7PEPhuiM21oehgfxtu', '', 'Sophie Marquardt', 'teacher', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '390509', '+55 9960553', 0, 0, 0, '', NULL, '', '098.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'nvolkman', 'schumm.kyra@parker.info', '$2y$10$9OjD2G3v8OZ3fa9.L.STSOvYHDM5hHHFbijHVMNo1NfcPFa4rET36', '', 'Rogelio Stanton', 'teacher', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '101186', '+34 9517882', 0, 0, 0, '', NULL, '', '012.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'kris.timmothy', 'raheem.bernhard@will.info', '$2y$10$64SP2BB0XGdfxpQTQA2bYeKYazw4lPTjy6dOSShsyD7VO5WJ1c.ce', '', 'Mariah Johnson', 'teacher', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '863587', '+90 7973420', 0, 0, 0, '', NULL, '', '031.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'nader.korbin', 'eunice41@gmail.com', '$2y$10$5MXzHndRsh.14FzMCYck2u0yaPmr4Bm67XWTfie1/E2o.E68hDKYq', '', 'Dr. Keshawn Hermiston', 'teacher', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '224137', '+13 8977232', 0, 0, 0, '', NULL, '', '084.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'schulist.arnoldo', 'yhane@beatty.org', '$2y$10$MizMiTvlhoGau9g4q45Rm.eUAorLHApOKjRAkHIm6bChVkeEMFK4W', '', 'Marcella Ullrich', 'teacher', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '791106', '+45 1204011', 0, 0, 0, '', NULL, '', '069.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'hcrist', 'sanford.imogene@gmail.com', '$2y$10$CypCEJRJLu7u7ACYbYt/7OahXs68.Re1e1Gj9Y2BgPyKwvey0QAb6', '', 'Elisabeth Kirlin', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '910249', '+21 5015691', 0, 0, 0, '', NULL, '', '09.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(97, 'qconn', 'okshlerin@yahoo.com', '$2y$10$rHzdbpjVoJ5j5xrwSjIvFu55X4Bw5tWRFCriRHvdcfhykhmAZYk/m', '', 'Miss Bernadine Ritchie', 'teacher', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '836895', '+22 7831403', 0, 0, 0, '', NULL, '', '081.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(98, 'brakus.leatha', 'phermann@yahoo.com', '$2y$10$YpZ0HQa.XjI3hmJNZhJB/efpi5fj4yynAF9Z8fZsaOTLnB1AnuV62', '', 'Mr. Lorenz Bartell III', 'teacher', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '994725', '+78 9337461', 0, 0, 0, '', NULL, '', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(99, 'shields.daryl', 'dhahn@mertz.com', '$2y$10$2Vb8wMwtGR5t.8oUHMbq4uq.37Dtv6r34IzBojhmCnD4bqkUf1xNy', '', 'Myah Batz DDS', 'teacher', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '780508', '+14 2427621', 0, 0, 0, '', NULL, '', '05.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(100, 'wendell35', 'batz.mikel@hessel.com', '$2y$10$jmOYZFP/3BWktLvEXwPerOyFQMCqQZVOwzpGWOSVuafWIRYkohKDu', '', 'Bo Renner', 'teacher', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '331779', '+49 5377707', 0, 0, 0, '', NULL, '', '082.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(101, 'cruecker', 'electa.muller@yahoo.com', '$2y$10$tvzTeN4AJpWSN6LsGWH6luJ4qQNX4fmjgIhgCHwFmmuxBGU50wJMu', '', 'Emily Dare', 'teacher', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '221303', '+65 9095763', 0, 0, 0, '', NULL, '', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(102, 'sbecker', 'donnelly.hayden@hotmail.com', '$2y$10$gtnyeLaHwdTB5RWpTLGpZOgnngBXKpu1/8qE7cA/rIzHopKBFVx/m', '', 'Dr. Edison Bradtke V', 'teacher', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '812652', '+47 3456102', 0, 0, 0, '', NULL, '', '052.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(103, 'edmund89', 'hane.arnaldo@kuhic.com', '$2y$10$wXa2O2tpZk0fU7mJeqRv7u11FLuM0XKJf1onVIMThhsaFxDirFGU.', '', 'Celestino Wiza', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '832241', '+73 1776017', 0, 0, 0, '', NULL, '', '00.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(104, 'walker.fredrick', 'xcole@lakin.com', '$2y$10$h/m9HVCILWdmJjXOHMZ7Pe6zdODm7Dtt9EXBKd8CZckS0zVIqT7ha', '', 'Prof. Saul King', 'teacher', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '980601', '+65 2565661', 0, 0, 0, '', NULL, '', '063.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(126, 'parent', 'adriana97@dooley.com', '$2y$10$3aaYuAHdag0hyosdMMvu8Or2oS8ZkPezAfQCanH.8ZzOneMyyy9My', '0LTnTgn8sCheas0yOyQXTfpffYw16HUstGd49g3x0qQewNidNN6ySy3CQDXF', 'Nicolette Rolfson II', 'parent', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7509602581', '6866017', 0, 2, 46, '', NULL, '[{\"student\":\"Dion Graham\",\"relation\":\"father\",\"id\":109}]', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(127, 'hartmann.boyd', 'uritchie@hotmail.com', '$2y$10$6BPuyRnMPLUFFJdnWiSjDewEOBwdJ6EAqvUQEijDtblsn.C8g9Pqa', '', 'Verda Corwin', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9328346876', '8694456', 0, 2, 43, '', NULL, '[{\"student\":\"Prof. Pedro Greenholt\",\"relation\":\"father\",\"id\":120}]', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(128, 'deshawn04', 'kareem.kohler@effertz.com', '$2y$10$iXriW7D3PR.RhjKTPJLns.NQE3Lvtw23bgu411.vauTZLn57ipAZW', '', 'Coy Schaden', 'parent', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9586895546', '6185621', 0, 2, 38, '', NULL, '[{\"student\":\"Juvenal Ward\",\"relation\":\"father\",\"id\":115}]', '018.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(129, 'mcrist', 'oswaldo.dare@hansen.com', '$2y$10$4cNw0pV4fEx8.7m0vT9rmu.X9Y7iq5jqC8wZX5q0JNpYI/DfM5rEq', '', 'Prof. Christy Brakus', 'parent', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5541810293', '9760736', 0, 1, 19, '', NULL, '[{\"student\":\"Dr. Dustin Hodkiewicz III\",\"relation\":\"father\",\"id\":123}]', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(130, 'lrunolfsson', 'altenwerth.tracy@hotmail.com', '$2y$10$5R9HuoGGZhLt/SWThaECBe9xueMtpphxYRF/KYypr14t0uOZJZHBO', '', 'Rebeca Murphy', 'parent', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4412982423', '1851376', 0, 3, 23, '', NULL, '[{\"student\":\"Dr. Dustin Hodkiewicz III\",\"relation\":\"father\",\"id\":123}]', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(131, 'lehner.lonny', 'ogusikowski@hermann.info', '$2y$10$jEux4yf1vaC57VFc9S3OcOHgOeAOakWkBo4JlfK43xEZIv3KzA7uW', '', 'Daniela Gislason', 'parent', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5196462108', '8199520', 0, 3, 7, '', NULL, '[{\"student\":\"Mr. Wellington Purdy\",\"relation\":\"father\",\"id\":111}]', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(132, 'shields.shannon', 'carlos33@yahoo.com', '$2y$10$ebgpFzQOPPXAAHkbSVvbSOEuW5c3hihd3P7BjpLdP72BTJkWZL0EW', '', 'Giovanny Dickens', 'parent', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2758424666', '1524085', 0, 1, 24, '', NULL, '[{\"student\":\"Harry Pacocha\",\"relation\":\"father\",\"id\":106}]', '011.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(133, 'lgusikowski', 'sprosacco@yahoo.com', '$2y$10$uy.baEhATbs2cpyxQywmoOwcZRaVNOBo/vZuV3PcNw6mJaTG6rcxy', '', 'Kaleb Osinski', 'parent', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1813121218', '1127348', 0, 3, 35, '', NULL, '[{\"student\":\"Dr. Dustin Hodkiewicz III\",\"relation\":\"father\",\"id\":123}]', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(134, 'rhiannon.legros', 'rebecca.cassin@yahoo.com', '$2y$10$10rh9OVVl7l9RappcXC2teId9KfP6i7/kISD4Y956jackxkfAbePW', '', 'Kyler Weissnat Jr.', 'parent', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2321182497', '7634161', 0, 1, 39, '', NULL, '[{\"student\":\"Andre Brekke\",\"relation\":\"father\",\"id\":110}]', '090.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(135, 'monahan.lina', 'wintheiser.lucious@gmail.com', '$2y$10$wJJYL.vEHo79Lnu9.c6N8e6Q7lXOPjLApiUrlACztL2paP1x22yoy', '', 'Carlo Batz', 'parent', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9740805554', '5807728', 0, 3, 24, '', NULL, '[{\"student\":\"Hilma Wehner\",\"relation\":\"father\",\"id\":124}]', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(136, 'ahermann', 'samson.prosacco@yahoo.com', '$2y$10$ZB/KinqNZFFk/9TnxLie3e17fHlnmUBr.6CYI07gyVgGJxAc7IZYW', '', 'Cathryn Schowalter Sr.', 'parent', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5419356916', '7867495', 0, 3, 11, '', NULL, '[{\"student\":\"Hilma Wehner\",\"relation\":\"father\",\"id\":124}]', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(137, 'eondricka', 'tdavis@gmail.com', '$2y$10$xeNWScrmYzVLJ/bTGmrx6OJVOq/z4F94t8T0MtwftOdLWcAGvkW46', '', 'Dr. Oscar Corkery PhD', 'parent', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3165892653', '6012167', 0, 1, 23, '', NULL, '[{\"student\":\"Tyrel Heidenreich\",\"relation\":\"father\",\"id\":118}]', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(138, 'lwill', 'arlene.gerlach@dare.com', '$2y$10$TGvGSJTipLhqGGfz1xKtYOh7kW9t6wNAipgnt8ajR86d77I5BVyBa', '', 'Prof. Rosanna Bins I', 'parent', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2188093819', '5036243', 0, 4, 7, '', NULL, '[{\"student\":\"Hilma Wehner\",\"relation\":\"father\",\"id\":124}]', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(139, 'gullrich', 'imogene43@yahoo.com', '$2y$10$5o3OaFziub8gUjGBfETm8.nZbNwAO.9Yv1g5NDTIvQejYHdjbLV6O', '', 'Gilda Fritsch V', 'parent', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6154840215', '4471346', 0, 2, 21, '', NULL, '[{\"student\":\"Ms. Angelica Kozey DVM\",\"relation\":\"father\",\"id\":105}]', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(140, 'rachel34', 'emery98@gmail.com', '$2y$10$BR9sipC2GOobT28teG0vWeAqrqSPo9I91/SBzLKSW5NJPe99jydRy', '', 'Renee Aufderhar', 'parent', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8813250110', '5377836', 0, 4, 32, '', NULL, '[{\"student\":\"Ken Crona MD\",\"relation\":\"father\",\"id\":116}]', '041.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(141, 'effertz.hubert', 'vonrueden.margie@yahoo.com', '$2y$10$p0CBu3RLntlFfdC7BtgcZ...Z.Ob6VgsHkBiuYTPHos78BR6Ta6Pq', '', 'Mr. Davon Osinski', 'parent', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1603572686', '5200259', 0, 4, 46, '', NULL, '[{\"student\":\"Amber Stiedemann\",\"relation\":\"father\",\"id\":121}]', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(142, 'grimes.makayla', 'maureen35@ohara.com', '$2y$10$hiwJ4K1H5z6qruIlulXJKenm1EVweymbbAFlHRTqT8nHbHyO0Fjla', '', 'Kaya Crist', 'parent', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8579729604', '1390846', 0, 4, 43, '', NULL, '[{\"student\":\"Nasir Breitenberg\",\"relation\":\"father\",\"id\":125}]', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(143, 'pamela.kunze', 'enrique.streich@yahoo.com', '$2y$10$ziRrwwjLjNkWPtnTJMBnWOve2bSZ5dYR/KSooVC.cpmRDXLumwonC', '', 'Tressa Kautzer', 'parent', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5685160946', '3791567', 0, 1, 43, '', NULL, '[{\"student\":\"Ms. Angelica Kozey DVM\",\"relation\":\"father\",\"id\":105}]', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(144, 'lilla46', 'margie81@yahoo.com', '$2y$10$JJ6KrLv3zqimhkTA/uAz..HIK7pkbSojaGsRaR3Zmq3Naj1JqHReS', '', 'Prof. Camren Gaylord I', 'parent', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5103895794', '7762970', 0, 4, 14, '', NULL, '[{\"student\":\"Brad Champlin MD\",\"relation\":\"father\",\"id\":113}]', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(145, 'tabitha95', 'brown.jettie@gmail.com', '$2y$10$eJBjtd23/teXq9D/IlN35epNd0JTLYCJalLZ2QTkowEt3wEryI6ku', '', 'Katelynn Shields', 'parent', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9867467193', '5856579', 0, 4, 10, '', NULL, '[{\"student\":\"Nasir Breitenberg\",\"relation\":\"father\",\"id\":125}]', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(146, 'dorothea96', 'gerhold.michelle@kshlerin.com', '$2y$10$Hb5/QLgzATdC4hTXtH0nw.aWxZxG6j3ZsLkwpOMxAkgRvH2uNFyA6', '', 'Bessie Corwin', 'parent', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9863164857', '8915354', 0, 1, 4, '', NULL, '[{\"student\":\"Ms. Kelsi Krajcik III\",\"relation\":\"father\",\"id\":114}]', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(147, 'schoen.samir', 'tsatterfield@gmail.com', '$2y$10$Zp1rqDt3C/YaOdl8lLOAjeyyQTrlYHUNvRrtcg8xavXAcgMQOgn1W', '', 'Autumn Ritchie', 'parent', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4688026941', '6025292', 0, 1, 16, '', NULL, '[{\"student\":\"Kitty Aufderhar MD\",\"relation\":\"father\",\"id\":117}]', '054.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(148, 'scarter', 'okuneva.rhoda@mcdermott.info', '$2y$10$MJjGi5PfvHs8IUmipKagre54yAKVzou7udaPlRT6h.D/xm1xZD0Um', '', 'Ellen Weimann Sr.', 'parent', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5338778710', '1352558', 0, 4, 3, '', NULL, '[{\"student\":\"Dr. Dustin Hodkiewicz III\",\"relation\":\"father\",\"id\":123}]', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');
INSERT INTO `users` (`id`, `username`, `email`, `password`, `remember_token`, `fullName`, `role`, `role_perm`, `department`, `designation`, `activated`, `studentRollId`, `admission_number`, `admission_date`, `std_category`, `auth_session`, `birthday`, `gender`, `address`, `phoneNo`, `mobileNo`, `studentAcademicYear`, `studentClass`, `studentSection`, `religion`, `parentProfession`, `parentOf`, `photo`, `isLeaderBoard`, `restoreUniqId`, `transport`, `transport_vehicle`, `hostel`, `medical`, `user_position`, `defLang`, `defTheme`, `salary_type`, `salary_base_id`, `comVia`, `father_info`, `mother_info`, `biometric_id`, `library_id`, `account_active`, `customPermissionsType`, `customPermissions`, `firebase_token`, `updated_at`) VALUES
(149, 'estoltenberg', 'dturner@steuber.info', '$2y$10$5wzu1ath4HIj7I9m5EtEmekrV0aO1GXG8guw0OwLHGf2MPqKhKIwq', '', 'Dewayne Crist', 'parent', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6081602363', '9336642', 0, 1, 42, '', NULL, '[{\"student\":\"Nasir Breitenberg\",\"relation\":\"father\",\"id\":125}]', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(150, 'becker.nicola', 'jocelyn.rosenbaum@hotmail.com', '$2y$10$cCn68ls794oPlusgHLw.sOT5AqlTZefOO8rHTdKfegOJda4CX5wtO', '', 'Lavonne Bins III', 'parent', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2581333531', '3085679', 0, 1, 32, '', NULL, '[{\"student\":\"Juvenal Ward\",\"relation\":\"father\",\"id\":115}]', '075.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(151, 'carley.schaden', 'van06@carroll.biz', '$2y$10$cnb0EWuCdhuiVegp13BkROxdz38IVk5eX09..7MMlPRqQlBWDnA36', '', 'Dr. Jovanny Pacocha III', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3530223490', '5396882', 0, 3, 9, '', NULL, '[{\"student\":\"Kitty Aufderhar MD\",\"relation\":\"father\",\"id\":117}]', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(152, 'predovic.dawson', 'casper.lourdes@gmail.com', '$2y$10$FD23qguXNUc76/nqHbSD3OwLSnvqTciJBSm7avIIwmY02sbx8GpL2', '', 'Daniella Gaylord', 'parent', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4465546904', '2181597', 0, 4, 10, '', NULL, '[{\"student\":\"Brad Champlin MD\",\"relation\":\"father\",\"id\":113}]', '011.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(153, 'nkohler', 'collins.abby@hotmail.com', '$2y$10$OZFjAY1OlO3w4Ii.5EU1JeBuneu2xbAyP.MyqhPqSgYCjTI.4XzSi', '', 'Ms. Deanna Pagac Sr.', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7400962620', '2083474', 0, 2, 41, '', NULL, '[{\"student\":\"Ms. Kelsi Krajcik III\",\"relation\":\"father\",\"id\":114}]', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(154, 'general41', 'ugerlach@hotmail.com', '$2y$10$QEuoAXklKkVGbqxQ2YpBkuYaJ7.Bov38BXH.omDkS0pxjZsAfr4YS', '', 'Mazie Upton', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5116319955', '6672231', 0, 1, 7, '', NULL, '[{\"student\":\"Herminio Rath\",\"relation\":\"father\",\"id\":108}]', '086.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(155, 'elliott.kunze', 'hamill.ransom@gmail.com', '$2y$10$Jg84s9UfnDHvWUVUea4eY.WswiC6rodfz5qYkhhBGzIXvODu8ISCe', '', 'Terence Wolff', 'parent', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1571405916', '9366887', 0, 4, 36, '', NULL, '[{\"student\":\"Ken Crona MD\",\"relation\":\"father\",\"id\":116}]', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(156, 'lia.halvorson', 'ferry.gaylord@gmail.com', '$2y$10$eKYrNcw9r6x/w/HJpUiCY.woP0MAxbtfRzmODyuZTO3kWgmhTeYWy', '', 'Ward Koelpin', 'parent', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9740852575', '6586692', 0, 2, 27, '', NULL, '[{\"student\":\"Dr. Dustin Hodkiewicz III\",\"relation\":\"father\",\"id\":123}]', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(157, 'marcia83', 'minerva.farrell@hotmail.com', '$2y$10$GKkuqj0qOJ6jNLjM2knVfOkXW7RBi2yiP/H0IdiO/zby.2wlrt7o2', '', 'Prof. Daisy Aufderhar', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9126951285', '6386505', 0, 3, 37, '', NULL, '[{\"student\":\"Mr. Rogers Zboncak\",\"relation\":\"father\",\"id\":122}]', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(158, 'maci32', 'parisian.darrion@jacobs.com', '$2y$10$63aYN0QG2OuN4cGy2YWCsOklNu.yrTEOuWjPiE54FTRxzvhF/CBYa', '', 'Prof. Meghan Schumm Sr.', 'parent', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7439172356', '8359560', 0, 1, 39, '', NULL, '[{\"student\":\"Miss Alessia Hackett\",\"relation\":\"father\",\"id\":112}]', '066.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(159, 'gleichner.kiel', 'rempel.demarcus@yahoo.com', '$2y$10$F8y/RhaJeC65LnPV.uv.Iuu8SPAXN0FRrY6afBNGw4Y4KVPWUZkAW', '', 'Abbigail Walker MD', 'parent', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2997455531', '6500005', 0, 2, 23, '', NULL, '[{\"student\":\"Ms. Kelsi Krajcik III\",\"relation\":\"father\",\"id\":114}]', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(160, 'phowell', 'yswift@gmail.com', '$2y$10$9tThiWwc8Vpjc2UIuXaMwuhSPw584VxkXLGUmKwBNVbwTzwNgLzbS', '', 'Prof. Samara Kub', 'parent', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6948730383', '3659651', 0, 4, 16, '', NULL, '[{\"student\":\"Justen Davis\",\"relation\":\"father\",\"id\":107}]', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(161, 'hester84', 'mabelle81@bashirian.com', '$2y$10$bDX4lMzPmEa36ozQLJTVqeFKlX7iNLXx0/2a00xs.6w9cKrzsHo5W', '', 'Ida Casper', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4469528655', '3470171', 0, 2, 21, '', NULL, '[{\"student\":\"Ken Crona MD\",\"relation\":\"father\",\"id\":116}]', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(162, 'yweissnat', 'maud.balistreri@schaefer.com', '$2y$10$0vmYWhttkXVWGVlVfF4Qd.dtqc3d8YdqihRSoCmOoMnmb7NTiwN1u', '', 'Roman Balistreri', 'parent', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9570205428', '4994299', 0, 2, 5, '', NULL, '[{\"student\":\"Hilma Wehner\",\"relation\":\"father\",\"id\":124}]', '072.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(163, 'susie67', 'adell55@gmail.com', '$2y$10$g95XjleDuWtejtFlaLXd3eo9ufbGqU3LiD8UhliYVHOAtdHsPQPde', '', 'Sebastian Lebsack PhD', 'parent', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3098190912', '4791657', 0, 1, 29, '', NULL, '[{\"student\":\"Miss Alessia Hackett\",\"relation\":\"father\",\"id\":112}]', '07.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(164, 'hirthe.angelo', 'kuhic.tod@hotmail.com', '$2y$10$rZUxPseh2DdfA.k37A4f1eD00DkShDucivNR50r0m8BLhmxawBbnu', '', 'Alta Lynch DVM', 'parent', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7910317111', '4912646', 0, 4, 25, '', NULL, '[{\"student\":\"Harry Pacocha\",\"relation\":\"father\",\"id\":106}]', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(165, 'shana03', 'hackett.ila@stehr.net', '$2y$10$OXOfzMekdmCM9xVpsUgeYO0.B1mLKYy93js.j8Pa6BDVSJiW/OGH2', '', 'Magdalen Toy', 'parent', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7648314760', '1690618', 0, 2, 20, '', NULL, '[{\"student\":\"Prof. Pedro Greenholt\",\"relation\":\"father\",\"id\":120}]', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(166, 'aidan90', 'germaine.rowe@hotmail.com', '$2y$10$qSkkoutSn9ZrvXRuOiJBNuoXZqDhUEUatFewDPb5D0A30qF.K6W.2', '', 'Dr. Jacquelyn Lemke', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7927593109', '1184758', 0, 4, 37, '', NULL, '[{\"student\":\"Prof. Pedro Greenholt\",\"relation\":\"father\",\"id\":120}]', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(167, 'zachary.padberg', 'mertz.david@cummerata.com', '$2y$10$23RtfyNTSSp3rr92AG28ruwdyxD9.D5E3QZk1RpzDf0jX1L5h17yC', '', 'Mariela Zemlak', 'parent', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6404447487', '9384083', 0, 1, 40, '', NULL, '[{\"student\":\"Ms. Angelica Kozey DVM\",\"relation\":\"father\",\"id\":105}]', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(168, 'nathanial14', 'uklocko@kozey.com', '$2y$10$5Ir0n7ooZzNOi.o7HleFGO6JfmLLvJzirzYcUz/CgECNTQzVQQ8Ca', '', 'Hayden Maggio', 'parent', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9367109692', '4529903', 0, 1, 37, '', NULL, '[{\"student\":\"Tyrel Heidenreich\",\"relation\":\"father\",\"id\":118}]', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(169, 'reinhold65', 'rowan20@medhurst.com', '$2y$10$s7AI0vR0FPfbeDndRQIFGO/iVM7YaVxlPYsbS4nn7HqMj3YsNZONO', '', 'Murray Nienow', 'parent', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5162223653', '9870312', 0, 4, 49, '', NULL, '[{\"student\":\"Justen Davis\",\"relation\":\"father\",\"id\":107}]', '03.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(170, 'cruickshank.haylie', 'rath.brody@gmail.com', '$2y$10$DV1FWCPtcVNuGpHkGvZ/9O2DRzcOmQQyoXxkmm4zwJht7fmSOhc4S', '', 'Derek Pouros', 'parent', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6419028765', '7388175', 0, 2, 39, '', NULL, '[{\"student\":\"Justen Davis\",\"relation\":\"father\",\"id\":107}]', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(171, 'gilbert.rodriguez', 'alexandrea.anderson@aufderhar.com', '$2y$10$D0p0bOoNniw1.DyiZr2ApeluIFc.Cm4eMEvOcqslN/NtaxGPrmgDi', '', 'Duane Stark', 'parent', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9136496628', '1756319', 0, 2, 3, '', NULL, '[{\"student\":\"Prof. Pedro Greenholt\",\"relation\":\"father\",\"id\":120}]', '073.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(172, 'benton.donnelly', 'jolie.dibbert@padberg.net', '$2y$10$dPRJn3oQqfYQH5.ZaOYTkee93LuefV7U5ja2RwuJvxcPvm5yuL5ni', '', 'Abner Rowe', 'parent', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8776238308', '8994909', 0, 4, 11, '', NULL, '[{\"student\":\"Dr. Maximilian Douglas II\",\"relation\":\"father\",\"id\":119}]', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(173, 'esther.kertzmann', 'mac50@yahoo.com', '$2y$10$HufMkoyqWdHxfssrssuBOujFsin9bsLZ0OEYUUxcpmZrmkymGLCWO', '', 'Valentin Stokes', 'parent', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1898008717', '7079293', 0, 2, 34, '', NULL, '[{\"student\":\"Harry Pacocha\",\"relation\":\"father\",\"id\":106}]', '025.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(174, 'ullrich.abbigail', 'garnet80@volkman.net', '$2y$10$4buAu6VHv5rm0mZJ5N9uT.V9PjxQ1LZ03TSdcz0QP4npQIlAweqjO', '', 'Evelyn Jones', 'parent', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4844994943', '6285694', 0, 2, 48, '', NULL, '[{\"student\":\"Kitty Aufderhar MD\",\"relation\":\"father\",\"id\":117}]', '058.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(175, 'brock03', 'linda.johns@medhurst.info', '$2y$10$eHJVTDHoOaUgjdp4z06BS.TSGPC.nWtJluiyGG.JKd9qlI7Q75IlW', '', 'Oren Greenfelder', 'parent', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8473881343', '3928636', 0, 1, 35, '', NULL, '[{\"student\":\"Ken Crona MD\",\"relation\":\"father\",\"id\":116}]', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(176, 'keeling.vallie', 'josephine46@yahoo.com', '$2y$10$EX/IA6dxwIGTLIKaU/zQde7TDDB3lDIYvZ6cU0k2V61ThvG/3oE6S', '', 'Mrs. Tania Towne', 'parent', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8863845516', '3476153', 0, 4, 43, '', NULL, '[{\"student\":\"Kitty Aufderhar MD\",\"relation\":\"father\",\"id\":117}]', '075.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(177, 'student', 'monroe.williamson@gmail.com', '$2y$10$yv5VRCiFOrb3Ywg/P8aF3uAW9PqH385xeVrvQ09Erf8SJirdRpBuO', 'FlTLHlRb3YqpWT7CDNoOcYkueDkrKDnFQDi7ujYjBwAvKyCXW4JKr2PQfFLu', 'Graciela VonRueden', 'student', 9, 1, NULL, 1, '74', '75-412-57', 0, 0, '', 0, NULL, NULL, '2499142990', '4728537', 0, 4, 3, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(178, 'aschaden', 'daniel.donavon@pollich.net', '$2y$10$hcFws.VYBOQvwzwt4o5b9uIVKQrRuEkgtDJh0zoPlSJzSf5VGBMoC', '', 'Kirk Koss MD', 'student', 4, 2, NULL, 1, '13', '60-231-53', 0, 0, '', 0, NULL, NULL, '1927068839', '4836530', 0, 1, 4, '', NULL, '', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(179, 'jeremy59', 'obogisich@yahoo.com', '$2y$10$NlxZSJhBngmglMgwVhyhduWbkT.qiOEMvk1IYWe58YU7Oais.Dkz.', '', 'Kayla Boyer', 'student', 10, 2, NULL, 1, '76', '67-843-37', 0, 0, '', 0, NULL, NULL, '1188401558', '3398106', 0, 2, 2, '', NULL, '', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(180, 'kamron57', 'yhermiston@cartwright.com', '$2y$10$uG54TmwTkfldEW4HEjw9XO4XL.v2vb8hexpWVcz2JK0mvqPUnHkJC', '', 'Amara Cruickshank II', 'student', 7, 2, NULL, 1, '38', '11-355-52', 0, 0, '', 0, NULL, NULL, '2361463930', '2535733', 0, 1, 2, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(181, 'xleffler', 'rubye.von@marquardt.com', '$2y$10$un1CXtzMIQQ1dZAfmsdumeW16C39yMcPXBNgBIVC/EdbRN2Vil/yG', '', 'Ryleigh Casper', 'student', 9, 3, NULL, 1, '2', '98-658-71', 0, 0, '', 0, NULL, NULL, '6057297929', '9024884', 0, 2, 3, '', NULL, '', '020.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(182, 'bartell.penelope', 'mack86@howe.biz', '$2y$10$FWx2JED52ZNRq/fyFHHt0OUZJdHsTtt75NKFSwACgWKjFTNfiwd.6', '', 'Horacio Wunsch', 'student', 5, 3, NULL, 1, '66', '63-730-69', 0, 0, '', 0, NULL, NULL, '1265823635', '6406795', 0, 3, 1, '', NULL, '', '075.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(183, 'hintz.mafalda', 'leanna85@harris.info', '$2y$10$6uEk7orgDh4dqxfKsaGVZefKsg2Fv9HMOo3Fyu//3yRi4VR0FHKeq', '', 'Anika O\'Connell Sr.', 'student', 10, 3, NULL, 1, '18', '30-607-35', 0, 0, '', 0, NULL, NULL, '9778731297', '2083250', 0, 2, 3, '', NULL, '', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(184, 'cormier.jamey', 'tberge@little.com', '$2y$10$gMtfyRlkmtvtOCHtYIdqU.k7491H3Uj1Sl3p.8WX9Z8zO.lAiqx3q', '', 'Mr. Jamel Harvey II', 'student', 4, 1, NULL, 1, '1', '33-579-70', 0, 0, '', 0, NULL, NULL, '8535715698', '5164317', 0, 4, 4, '', NULL, '', '074.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(185, 'jannie53', 'kaylie81@gmail.com', '$2y$10$9ZYCfZ.XQ0ZVPiQOAbmeEeqQ5tz3htwAIkvwSW13j/bzM4FjNRoeq', '', 'Annetta Friesen', 'student', 8, 3, NULL, 1, '50', '79-234-12', 0, 0, '', 0, NULL, NULL, '3834356469', '2275458', 0, 3, 1, '', NULL, '', '023.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(186, 'ymorar', 'garland74@gmail.com', '$2y$10$9n4W.riq9hKw0Z2J8Xv7vu.slOSBs6w0mlwY5YdlQl0oYsIGkVNS2', '', 'Jessika Williamson', 'student', 5, 3, NULL, 1, '22', '46-167-71', 0, 0, '', 0, NULL, NULL, '1771737271', '5581772', 0, 1, 4, '', NULL, '', '013.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(187, 'noble.okuneva', 'wbeatty@jacobi.biz', '$2y$10$qUrHIk2NwVEkfRPSfII2se.BUYo7duJ7ECHGmGQiPyX.WcGzdyFki', '', 'Dr. Desmond Lubowitz II', 'student', 5, 3, NULL, 1, '42', '53-786-91', 0, 0, '', 0, NULL, NULL, '5491189184', '7105697', 0, 1, 2, '', NULL, '', '020.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(188, 'eva.welch', 'elise.bradtke@yahoo.com', '$2y$10$wn.HRk2qKCIwuj9bZmzX3.CCSMubUSychApsGan0ZJRhjQQF2G0Gy', '', 'Mr. Santos Howe DVM', 'student', 4, 2, NULL, 1, '91', '98-542-88', 0, 0, '', 0, NULL, NULL, '4808981425', '2567975', 0, 1, 4, '', NULL, '', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(189, 'retta03', 'pfeffer.christelle@gmail.com', '$2y$10$iwja9UPqk3hGT6bV6DGjse/MWdd/RnyUVXwUrpiIzPndl71JmJ1wa', '', 'Mr. Hugh Konopelski', 'student', 10, 1, NULL, 1, '95', '67-469-99', 0, 0, '', 0, NULL, NULL, '9173094967', '2504154', 0, 1, 2, '', NULL, '', '01.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(190, 'norbert.mosciski', 'davis.laron@hotmail.com', '$2y$10$MRuO8RXpISip0rNYuk5YFe6yoCYxLsgF59aftrM4FKznW2MtcKWMa', '', 'Eliezer Klein', 'student', 9, 3, NULL, 1, '70', '21-414-73', 0, 0, '', 0, NULL, NULL, '1710545445', '5706491', 0, 1, 4, '', NULL, '', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(191, 'ernser.christa', 'dibbert.josianne@yahoo.com', '$2y$10$9R7RhSqsjVNUfuxZSOyNeOsmGJkxIS4Zzs6TZV2nzTSrsNqvjSyXO', '', 'Nellie Nolan', 'student', 4, 3, NULL, 1, '33', '68-187-23', 0, 0, '', 0, NULL, NULL, '4640922803', '5524727', 0, 3, 3, '', NULL, '', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(192, 'larson.haylee', 'maggio.lesley@yahoo.com', '$2y$10$g09svnsWaXkiQ7EI6WsYbexdH8dm.dlkPeFiuvvdXvUP/A3p0hDo6', '', 'Marianna Kuhlman', 'student', 4, 3, NULL, 1, '90', '34-987-39', 0, 0, '', 0, NULL, NULL, '8120408949', '2974176', 0, 4, 4, '', NULL, '', '063.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(193, 'jettie.bosco', 'ysmitham@gmail.com', '$2y$10$7h9lBHu5um/yl2j5v7HgSO7cAzX0Xz2JQqI4KyBjzE2G42Ykd29Ie', '', 'Charlie Bergstrom PhD', 'student', 10, 3, NULL, 1, '8', '84-525-17', 0, 0, '', 0, NULL, NULL, '1912182589', '1323890', 0, 2, 1, '', NULL, '', '038.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(194, 'trycia49', 'dessie05@auer.org', '$2y$10$l.9Gm6KkHgJLfzWm3PK1jeR3h3jNYg1h4GMe4LyafjBtPd4Ekyp86', '', 'Gudrun Price', 'student', 8, 4, NULL, 1, '59', '89-364-41', 0, 0, '', 0, NULL, NULL, '1157438979', '4136029', 0, 4, 1, '', NULL, '', '084.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(195, 'wkessler', 'raynor.mervin@hackett.com', '$2y$10$W8HDnMH82F3O8nhXa2jfLep4UYlfl8Fn3UT/vN3F7hqseEvIqvYVu', '', 'Lucinda Morar', 'student', 4, 1, NULL, 1, '82', '41-610-62', 0, 0, '', 0, NULL, NULL, '8803647494', '7482193', 0, 1, 3, '', NULL, '', '015.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(196, 'eprosacco', 'mward@yahoo.com', '$2y$10$3lZ5g1hfIUELvk07Hcd0duqSzT1F74.wbBlgybYKYkerxyK1Y5D0e', '', 'Mr. Henderson West II', 'student', 10, 1, NULL, 1, '26', '50-235-62', 0, 0, '', 0, NULL, NULL, '3064105368', '7505460', 0, 1, 3, '', NULL, '', '054.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(197, 'mann.orlando', 'elta.bradtke@jaskolski.com', '$2y$10$RYs4Wc9thQX8S9Oz161/uu4PXO4gD9hwYhzRy.7VEEwpntRukJ2hy', '', 'Ron Roob III', 'student', 7, 3, NULL, 1, '34', '82-772-22', 0, 0, '', 0, NULL, NULL, '7593836326', '7308488', 0, 2, 1, '', NULL, '', '029.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_subjectid_foreign` (`subjectId`),
  ADD KEY `assignments_teacherid_foreign` (`teacherId`);

--
-- Indexes for table `assignments_answers`
--
ALTER TABLE `assignments_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_answers_assignmentid_foreign` (`assignmentId`),
  ADD KEY `assignments_answers_userid_foreign` (`userId`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_classid_foreign` (`classId`),
  ADD KEY `attendance_subjectid_foreign` (`subjectId`),
  ADD KEY `attendance_studentid_foreign` (`studentId`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_classacademicyear_foreign` (`classAcademicYear`),
  ADD KEY `classes_dormitoryid_foreign` (`dormitoryId`);

--
-- Indexes for table `class_schedule`
--
ALTER TABLE `class_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_schedule_classid_foreign` (`classId`),
  ADD KEY `class_schedule_sectionid_foreign` (`sectionId`),
  ADD KEY `class_schedule_subjectid_foreign` (`subjectId`),
  ADD KEY `class_schedule_teacherid_foreign` (`teacherId`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_marks_examid_foreign` (`examId`),
  ADD KEY `exam_marks_classid_foreign` (`classId`),
  ADD KEY `exam_marks_subjectid_foreign` (`subjectId`),
  ADD KEY `exam_marks_studentid_foreign` (`studentId`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeworks_subjectid_foreign` (`subjectId`),
  ADD KEY `homeworks_teacherid_foreign` (`teacherId`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_cat`
--
ALTER TABLE `hostel_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostel_cat_cattypeid_foreign` (`catTypeId`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_incomecategory_foreign` (`incomeCategory`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_stock_store_id_foreign` (`store_id`),
  ADD KEY `items_stock_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library_issue`
--
ALTER TABLE `library_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_issue_book_id_foreign` (`book_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_items_albumid_foreign` (`albumId`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_userid_foreign` (`userId`),
  ADD KEY `messages_fromid_foreign` (`fromId`),
  ADD KEY `messages_toid_foreign` (`toId`);

--
-- Indexes for table `messages_list`
--
ALTER TABLE `messages_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_list_userid_foreign` (`userId`),
  ADD KEY `messages_list_toid_foreign` (`toId`);

--
-- Indexes for table `mm_uploads`
--
ALTER TABLE `mm_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mm_uploads_user_id_foreign` (`user_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_mob_history_user_id_foreign` (`user_id`);

--
-- Indexes for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exams_grades`
--
ALTER TABLE `online_exams_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exams_grades_examid_foreign` (`examId`),
  ADD KEY `online_exams_grades_studentid_foreign` (`studentId`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_history_userid_foreign` (`userid`),
  ADD KEY `payroll_history_pay_by_userid_foreign` (`pay_by_userid`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_classid_foreign` (`classId`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_academic_years_studentid_foreign` (`studentId`),
  ADD KEY `student_academic_years_academicyearid_foreign` (`academicYearId`),
  ADD KEY `student_academic_years_classid_foreign` (`classId`),
  ADD KEY `student_academic_years_sectionid_foreign` (`sectionId`);

--
-- Indexes for table `student_categories`
--
ALTER TABLE `student_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_docs`
--
ALTER TABLE `student_docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_docs_user_id_foreign` (`user_id`);

--
-- Indexes for table `study_material`
--
ALTER TABLE `study_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_material_subject_id_foreign` (`subject_id`),
  ADD KEY `study_material_teacher_id_foreign` (`teacher_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_perm_foreign` (`role_perm`),
  ADD KEY `users_department_foreign` (`department`),
  ADD KEY `users_designation_foreign` (`designation`);

--
-- Indexes for table `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacation_userid_foreign` (`userid`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitories`
--
ALTER TABLE `dormitories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `library_issue`
--
ALTER TABLE `library_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mailsms`
--
ALTER TABLE `mailsms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3001;
--
-- AUTO_INCREMENT for table `messages_list`
--
ALTER TABLE `messages_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3001;
--
-- AUTO_INCREMENT for table `mm_uploads`
--
ALTER TABLE `mm_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mob_notifications`
--
ALTER TABLE `mob_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `newsboard`
--
ALTER TABLE `newsboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `notifications_mob_history`
--
ALTER TABLE `notifications_mob_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=675;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postal`
--
ALTER TABLE `postal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `student_docs`
--
ALTER TABLE `student_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `study_material`
--
ALTER TABLE `study_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transportation`
--
ALTER TABLE `transportation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `transport_vehicles`
--
ALTER TABLE `transport_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_subjectid_foreign` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments_teacherid_foreign` FOREIGN KEY (`teacherId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignments_answers`
--
ALTER TABLE `assignments_answers`
  ADD CONSTRAINT `assignments_answers_assignmentid_foreign` FOREIGN KEY (`assignmentId`) REFERENCES `assignments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments_answers_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_classid_foreign` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_studentid_foreign` FOREIGN KEY (`studentId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_subjectid_foreign` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_classacademicyear_foreign` FOREIGN KEY (`classAcademicYear`) REFERENCES `academic_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_dormitoryid_foreign` FOREIGN KEY (`dormitoryId`) REFERENCES `dormitories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_schedule`
--
ALTER TABLE `class_schedule`
  ADD CONSTRAINT `class_schedule_classid_foreign` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_schedule_sectionid_foreign` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_schedule_subjectid_foreign` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_schedule_teacherid_foreign` FOREIGN KEY (`teacherId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD CONSTRAINT `exam_marks_classid_foreign` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_marks_examid_foreign` FOREIGN KEY (`examId`) REFERENCES `exams_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_marks_studentid_foreign` FOREIGN KEY (`studentId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_marks_subjectid_foreign` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `homeworks`
--
ALTER TABLE `homeworks`
  ADD CONSTRAINT `homeworks_subjectid_foreign` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `homeworks_teacherid_foreign` FOREIGN KEY (`teacherId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hostel_cat`
--
ALTER TABLE `hostel_cat`
  ADD CONSTRAINT `hostel_cat_cattypeid_foreign` FOREIGN KEY (`catTypeId`) REFERENCES `hostel_cat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_incomecategory_foreign` FOREIGN KEY (`incomeCategory`) REFERENCES `income_cat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items_stock`
--
ALTER TABLE `items_stock`
  ADD CONSTRAINT `items_stock_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_stock_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `library_issue`
--
ALTER TABLE `library_issue`
  ADD CONSTRAINT `library_issue_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `book_library` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `media_items`
--
ALTER TABLE `media_items`
  ADD CONSTRAINT `media_items_albumid_foreign` FOREIGN KEY (`albumId`) REFERENCES `media_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_fromid_foreign` FOREIGN KEY (`fromId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_toid_foreign` FOREIGN KEY (`toId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages_list`
--
ALTER TABLE `messages_list`
  ADD CONSTRAINT `messages_list_toid_foreign` FOREIGN KEY (`toId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_list_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mm_uploads`
--
ALTER TABLE `mm_uploads`
  ADD CONSTRAINT `mm_uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications_mob_history`
--
ALTER TABLE `notifications_mob_history`
  ADD CONSTRAINT `notifications_mob_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `online_exams_grades`
--
ALTER TABLE `online_exams_grades`
  ADD CONSTRAINT `online_exams_grades_examid_foreign` FOREIGN KEY (`examId`) REFERENCES `exams_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `online_exams_grades_studentid_foreign` FOREIGN KEY (`studentId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payroll_history`
--
ALTER TABLE `payroll_history`
  ADD CONSTRAINT `payroll_history_pay_by_userid_foreign` FOREIGN KEY (`pay_by_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payroll_history_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_classid_foreign` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_academic_years`
--
ALTER TABLE `student_academic_years`
  ADD CONSTRAINT `student_academic_years_academicyearid_foreign` FOREIGN KEY (`academicYearId`) REFERENCES `academic_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_academic_years_classid_foreign` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_academic_years_sectionid_foreign` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_academic_years_studentid_foreign` FOREIGN KEY (`studentId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_docs`
--
ALTER TABLE `student_docs`
  ADD CONSTRAINT `student_docs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `study_material`
--
ALTER TABLE `study_material`
  ADD CONSTRAINT `study_material_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `study_material_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_department_foreign` FOREIGN KEY (`department`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_designation_foreign` FOREIGN KEY (`designation`) REFERENCES `designations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_role_perm_foreign` FOREIGN KEY (`role_perm`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vacation`
--
ALTER TABLE `vacation`
  ADD CONSTRAINT `vacation_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
