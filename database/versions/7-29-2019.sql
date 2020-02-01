-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2019 at 03:42 PM
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
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
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
  `dormitoryId` int(11) DEFAULT NULL,
  `classTeacher` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classSubjects` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `className`, `classAcademicYear`, `dormitoryId`, `classTeacher`, `classSubjects`) VALUES
(1, 'Ut quia. Class', 2, 1, '[\"90\",\"79\",\"54\",\"72\",\"88\",\"69\",\"58\",\"70\"]', ''),
(2, 'Placeat. Class', 2, 3, '[\"86\",\"75\",\"79\",\"69\",\"73\",\"91\"]', '[\"5\",\"6\",\"4\"]'),
(3, 'Et. Class', 2, 4, '[\"68\",\"60\",\"90\",\"59\",\"102\",\"58\",\"57\"]', ''),
(4, 'Voluptatem voluptas. Class', 2, 4, '[\"92\",\"80\",\"72\",\"69\",\"74\",\"97\",\"58\",\"61\",\"75\",\"77\",\"100\",\"68\",\"67\"]', ''),
(5, 'Blanditiis. Class', 1, 4, '[\"101\",\"54\",\"70\",\"72\",\"75\",\"79\",\"80\",\"85\",\"86\",\"88\",\"89\",\"94\",\"99\"]', '[\"14\"]'),
(6, 'Et. Class', 2, 1, '[\"61\",\"67\",\"83\",\"85\",\"91\",\"81\",\"79\",\"59\",\"70\",\"56\",\"57\",\"94\",\"55\",\"98\",\"97\"]', '[\"7\"]'),
(7, 'Ducimus. Class', 2, 1, '[\"95\",\"66\",\"58\",\"101\",\"99\",\"61\",\"93\",\"67\",\"77\",\"98\",\"86\",\"89\"]', ''),
(8, 'Aspernatur ea. Class', 1, 3, '[\"81\",\"70\",\"68\",\"85\",\"55\",\"97\",\"99\",\"77\",\"93\",\"78\",\"84\",\"76\"]', '[\"9\"]'),
(9, 'Possimus non. Class', 2, 4, '[\"91\",\"84\",\"78\",\"72\",\"62\",\"92\"]', '[\"15\",\"1\",\"12\",\"13\",\"5\",\"8\"]'),
(10, 'Suscipit. Class', 1, 2, '[\"55\",\"68\",\"88\",\"72\",\"84\",\"59\",\"91\",\"81\",\"75\",\"87\",\"73\",\"85\",\"57\",\"102\"]', '[\"9\",\"11\"]');

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule`
--

CREATE TABLE `class_schedule` (
  `id` int(11) NOT NULL,
  `dayOfWeek` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `startTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `endTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `classId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class_schedule`
--

INSERT INTO `class_schedule` (`id`, `dayOfWeek`, `startTime`, `endTime`, `classId`, `sectionId`, `subjectId`, `teacherId`) VALUES
(1, '1', '1315', '1635', 0, 9, 2, 104);

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
(1, 'Cupiditate soluta temporibus.', 'Eum alias minus quis quam fuga.', 'parents', 'animi', '', 1, '1563291671'),
(2, 'Tempore rerum et sit.', 'Est ut dolore qui dolorem saepe sed ducimus dolor sunt dolores occaecati aut.', 'students', 'dolorem', '', 1, '1563291671'),
(3, 'Sed architecto esse velit.', 'Praesentium facilis ut sunt et eum eos.', 'teacher', 'optio', '', 1, '1563291671'),
(4, 'Esse quasi repellendus.', 'Sapiente tempore maiores ut possimus sapiente repellendus distinctio.', 'all', 'dolores', '', 1, '1565106071'),
(5, 'Nam magni qui quaerat.', 'Illum corrupti quos unde aut sed et est dolores quae aperiam.', 'students', 'natus', '', 0, '1564587671'),
(6, 'Laudantium est error.', 'Consequuntur quae aut dolorum ipsum voluptatem eum.', 'teacher', 'et', '', 1, '1565538071'),
(7, 'Nihil fugiat aut quisquam.', 'Rem maxime voluptatem odit omnis.', 'students', 'eveniet', '', 1, '1564587671'),
(8, 'Velit dolores quod.', 'Similique quia beatae et reprehenderit ut enim rerum veniam.', 'teacher', 'esse', '', 0, '1565278871'),
(9, 'Amet quasi voluptate.', 'Laborum et quo consectetur.', 'all', 'iusto', '', 0, '1563637271'),
(10, 'Aut pariatur ex voluptatem omnis nesciunt.', 'Corrupti quibusdam repudiandae adipisci totam voluptatem sit laudantium hic est architecto ut sint nostrum est.', 'teacher', 'et', '', 1, '1563205271'),
(11, 'Inventore necessitatibus laudantium vero.', 'Facilis laudantium eos impedit autem.', 'students', 'sed', '', 0, '1563810071'),
(12, 'Quo repudiandae et et sequi.', 'Cumque numquam asperiores quas nemo dolor quisquam repellendus non et.', 'parents', 'fugiat', '', 1, '1564414871'),
(13, 'Rerum qui.', 'Praesentium sit enim omnis vero laboriosam at.', 'all', 'earum', '', 0, '1564155671'),
(14, 'Aliquid odit aspernatur.', 'Repellendus aut animi quo repellat.', 'parents', 'omnis', '', 0, '1565624471'),
(15, 'Omnis sed.', 'Dignissimos debitis at laudantium sapiente debitis et qui dicta rerum tempore est ratione dicta enim voluptatem aut.', 'all', 'dolores', '', 0, '1564069271'),
(16, 'Aut accusantium cumque reiciendis.', 'Eaque rerum minima veritatis aperiam quis eligendi sequi a laboriosam quaerat placeat.', 'parents', 'autem', '', 1, '1565624471'),
(17, 'Consequatur quas ut et.', 'Ipsam quaerat consequatur dolor saepe laboriosam repellendus in fuga repellat inventore.', 'students', 'non', '', 1, '1564933271'),
(18, 'Modi ullam odit qui voluptas debitis.', 'Voluptatum numquam quam ab sapiente doloremque quia velit qui sed ab aut.', 'parents', 'placeat', '', 1, '1563896471'),
(19, 'Quia qui quia.', 'Fugiat minus ea aperiam vel nostrum ullam.', 'students', 'quo', '', 1, '1565019671'),
(20, 'Fugiat nemo aut consequatur ipsum veritatis.', 'Sed sunt laborum iusto porro expedita et.', 'all', 'ut', '', 1, '1563550871'),
(21, 'Et accusamus autem.', 'Repellendus ut dolore at veritatis eos est vel iure eum earum sed.', 'students', 'et', '', 0, '1565538071'),
(22, 'Molestias id voluptas illo.', 'Et velit qui alias quaerat neque sed et.', 'all', 'aperiam', '', 0, '1565451671'),
(23, 'Sequi totam quibusdam sint.', 'Possimus nemo aperiam debitis consequatur aut molestiae id rerum.', 'all', 'et', '', 1, '1563723671'),
(24, 'Ducimus asperiores.', 'Omnis nobis pariatur blanditiis atque suscipit similique dicta praesentium aut est quo et iste fugit.', 'parents', 'illum', '', 1, '1563723671'),
(25, 'Occaecati ad ut.', 'Nam ut molestiae repellendus dicta.', 'teacher', 'id', '', 1, '1563291671'),
(26, 'Enim quibusdam laboriosam.', 'Quo molestiae similique perspiciatis saepe dolores repudiandae atque.', 'students', 'rerum', '', 1, '1565019671'),
(27, 'Illum ut et et.', 'Unde quia magnam mollitia repudiandae ut.', 'parents', 'distinctio', '', 1, '1565019671'),
(28, 'Nostrum quia at.', 'Pariatur pariatur iste cum voluptatem dolor explicabo quas consequatur.', 'all', 'mollitia', '', 0, '1565106071'),
(29, 'Laborum tempora.', 'Quia quia fugiat reprehenderit est quis maiores repudiandae velit et.', 'students', 'aspernatur', '', 1, '1563896471'),
(30, 'Totam provident a.', 'Dolore aut beatae neque aliquid sint.', 'parents', 'officiis', '', 1, '1563810071'),
(31, 'In qui rerum qui.', 'Non omnis voluptas consequatur voluptas temporibus totam qui.', 'students', 'ut', '', 0, '1563896471'),
(32, 'Repellendus in dolor.', 'Temporibus quia sit ipsam.', 'teacher', 'ut', '', 0, '1563810071'),
(33, 'Accusantium officiis voluptas.', 'Rem accusamus praesentium aut impedit aut iure quo.', 'students', 'nulla', '', 1, '1565278871'),
(34, 'Delectus odit.', 'Quam nulla quam velit officia vel.', 'all', 'magni', '', 1, '1564242071'),
(35, 'Neque ducimus placeat officia rerum qui.', 'Voluptatum nam qui id exercitationem nihil ipsa est voluptatem omnis aspernatur quibusdam.', 'all', 'et', '', 1, '1564760471'),
(36, 'Voluptatem quia eius omnis.', 'Asperiores atque aut sequi esse.', 'students', 'ex', '', 1, '1564414871'),
(37, 'Accusamus non.', 'Laborum et quo et inventore ab nam maxime ut.', 'students', 'minus', '', 1, '1563896471'),
(38, 'Corrupti ut atque.', 'Voluptas voluptatibus aliquam porro reiciendis temporibus quis repudiandae delectus ipsa aut.', 'students', 'voluptatum', '', 1, '1563378071'),
(39, 'Non nostrum iure tenetur nulla.', 'Illo voluptas natus enim a distinctio.', 'teacher', 'iusto', '', 1, '1563896471'),
(40, 'Alias eligendi culpa ut.', 'Dolor consectetur natus et beatae aut temporibus possimus fugit et qui.', 'students', 'qui', '', 1, '1563810071'),
(41, 'Culpa et recusandae eius quia veniam.', 'Ut iure quo eligendi doloremque nemo et vel dolor.', 'parents', 'sed', '', 0, '1564933271'),
(42, 'Illum sapiente.', 'Dignissimos enim quo tempore pariatur ea recusandae neque voluptatem fugit rerum recusandae consequatur ut.', 'students', 'facilis', '', 1, '1565624471'),
(43, 'Provident adipisci in iusto.', 'Et itaque est qui ipsum labore rerum veniam ut.', 'all', 'minus', '', 0, '1565538071'),
(44, 'Iste accusantium sed alias.', 'Doloribus non ex qui sint veniam totam qui tenetur error nesciunt optio error soluta et sed.', 'students', 'eum', '', 1, '1564587671'),
(45, 'Accusantium voluptas.', 'Commodi enim laboriosam dignissimos sed voluptatibus voluptas.', 'teacher', 'cum', '', 1, '1564846871'),
(46, 'Consequuntur architecto.', 'Alias ratione ut ex illo dignissimos nulla.', 'all', 'non', '', 0, '1564414871'),
(47, 'Veniam ratione autem.', 'Debitis placeat hic dolorem facere recusandae autem odio ea itaque.', 'all', 'autem', '', 1, '1563118871'),
(48, 'Quia dolore et.', 'Sint velit ut qui distinctio officia consequatur.', 'all', 'pariatur', '', 0, '1563637271'),
(49, 'Quia rerum vitae.', 'Itaque voluptatem dolor nulla et illum amet consectetur.', 'parents', 'totam', '', 1, '1565624471'),
(50, 'Dolores deleniti quaerat quia repellat.', 'Omnis id quia reiciendis numquam doloremque eum dignissimos ratione ducimus voluptas est et alias.', 'teacher', 'repudiandae', '', 1, '1564760471');

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
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
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
(1, 'Quo distinctio.', '', '', '1564328472', 1564069272, 0, '[\"2\",\"6\",\"10\"]', '[\"9\",\"30\"]', '', 2, 88),
(2, 'Laudantium sint.', '', '', '1564328472', 1563205272, 0, '[\"8\",\"2\",\"6\"]', '[\"19\",\"20\",\"24\"]', '', 14, 85),
(3, 'Id qui suscipit.', '', '', '1564328472', 1564933272, 0, '[\"4\",\"1\"]', '[\"44\",\"21\",\"39\"]', '', 14, 94),
(4, 'Dolorum porro.', '', '', '1564328472', 1563637272, 0, '[\"5\",\"10\",\"2\"]', '[\"27\",\"2\"]', '', 8, 75),
(5, 'Cum.', '', '', '1564328472', 1564155672, 0, '[\"3\",\"8\"]', '[\"38\",\"7\"]', '', 1, 60),
(6, 'Vel.', '', '', '1564328472', 1565365272, 0, '[\"4\"]', '[\"6\",\"40\"]', '', 9, 68),
(7, 'Ad ipsa.', '', '', '1564328472', 1563205272, 0, '[\"7\",\"10\"]', '[\"26\"]', '', 15, 89),
(8, 'Molestiae omnis.', '', '', '1564328472', 1565192472, 0, '[\"10\",\"2\"]', '[\"33\",\"12\",\"28\"]', '', 13, 72),
(9, 'Et nihil.', '', '', '1564328472', 1564155672, 0, '[\"7\",\"6\",\"8\"]', '[\"5\",\"28\",\"7\"]', '', 5, 70),
(10, 'Repudiandae quia.', '', '', '1564328472', 1564760472, 0, '[\"4\",\"1\",\"7\"]', '[\"19\"]', '', 10, 91),
(11, 'Voluptates hic.', '', '', '1564328472', 1565451672, 0, '[\"2\"]', '[\"16\",\"29\"]', '', 7, 82),
(12, 'Totam.', '', '', '1564328472', 1564242072, 0, '[\"3\"]', '[\"50\"]', '', 2, 60),
(13, 'Vero.', '', '', '1564328472', 1564760472, 0, '[\"8\",\"3\",\"6\"]', '[\"38\",\"5\",\"14\"]', '', 6, 70),
(14, 'Libero.', '', '', '1564328472', 1564587672, 0, '[\"2\",\"9\",\"6\"]', '[\"19\"]', '', 2, 96),
(15, 'Voluptas labore.', '', '', '1564328472', 1564674072, 0, '[\"7\",\"6\"]', '[\"48\"]', '', 3, 100);

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
(1, 'Ms. Isabell Kris', 'eum', 'Ratione similique itaque vel a hic magnam dignissimos dolore.', '1564321355', 'Marisa Pouros'),
(2, 'Miss Kaylah Shields', 'quibusdam', 'Corrupti voluptas et quisquam.', '1564321355', 'Ms. Alene Kutch I'),
(3, 'Enrique Halvorson', 'ut', 'Ut nulla non et accusantium.', '1564321355', 'Linda Heller I'),
(4, 'Halie Lind', 'maiores', 'Aut qui eos et fugit voluptas temporibus.', '1564321355', 'Jaleel Weissnat Sr.'),
(5, 'Prof. Ashley Cole Jr.', 'rerum', 'Vel quis voluptatum voluptas ullam repudiandae consequatur.', '1564321355', 'Prof. Barrett Beer'),
(6, 'Mr. Henry Grant', 'natus', 'Aut sunt est.', '1564321355', 'Viva Cruickshank'),
(7, 'Miss Arielle Padberg', 'dolores', 'Omnis voluptatum nobis quo aut aut accusantium.', '1564321355', 'Delbert Abernathy'),
(8, 'Prof. Oran Emard', 'possimus', 'Et quos omnis sed porro.', '1564321355', 'Leatha Hegmann'),
(9, 'Icie Monahan', 'quo', 'Ut perspiciatis dolore quo qui.', '1564321355', 'Geoffrey Tremblay'),
(10, 'Bethel Pagac', 'eaque', 'Ducimus quia amet sapiente perspiciatis voluptatem temporibus quia optio.', '1564321355', 'Charity Deckow'),
(11, 'Forest Kuhic', 'sapiente', 'Qui doloremque voluptatem non quas quis aliquam.', '1564321355', 'Grayson Prohaska'),
(12, 'Reid Lowe', 'quis', 'Deleniti facilis laboriosam quidem aut.', '1564321355', 'Marquis Fadel'),
(13, 'Holly Reilly', 'minus', 'Earum rerum nostrum repellat quibusdam quasi.', '1564321355', 'Dr. Taryn Weber'),
(14, 'Katrine Walter', 'enim', 'Aut quia perferendis aliquam numquam.', '1564321355', 'Miss Marquise Wiegand'),
(15, 'Myrtice Tromp', 'sit', 'Modi quos neque doloribus tempora facere.', '1564321355', 'Lonnie Keebler V'),
(16, 'Cordell Kemmer', 'nisi', 'Maxime quidem sit corporis.', '1564321355', 'Prof. Isom Howe DVM'),
(17, 'Alivia Gorczany', 'eum', 'Quae qui sunt officia quis enim dolorem.', '1564321355', 'Prof. Garnet O\'Connell'),
(18, 'Jessyca Stracke IV', 'impedit', 'Totam facere enim et eum omnis.', '1564321355', 'Prof. Cheyanne Homenick MD'),
(19, 'Christop Bradtke', 'qui', 'Alias aut enim quia neque eius.', '1564321355', 'Jamar Heller'),
(20, 'Dominic Beer', 'sequi', 'Ipsam mollitia numquam inventore eligendi corrupti et quia perspiciatis.', '1564321355', 'Lorine Renner'),
(21, 'Ms. Anabel Satterfield III', 'voluptates', 'Error quod asperiores eveniet odio ut dolores id aut nostrum reiciendis.', '1564321355', 'Luigi Medhurst'),
(22, 'Eliezer Towne', 'quas', 'Reiciendis similique recusandae consectetur adipisci.', '1564321355', 'Dr. Cary Carroll MD'),
(23, 'Isabella Greenholt', 'ducimus', 'Aut et voluptatem nam sed.', '1564321355', 'Kristofer Johnston'),
(24, 'Jaclyn Douglas', 'velit', 'Aut et veritatis vel voluptatem voluptas eligendi quasi tenetur.', '1564321355', 'Charlene Raynor'),
(25, 'Eula Bergstrom', 'perspiciatis', 'Sint autem deleniti labore deserunt placeat.', '1564321356', 'Dr. Larissa Casper'),
(26, 'Nash Simonis', 'voluptas', 'Molestiae saepe et illo quos maiores.', '1564321356', 'Prof. Dakota Kuvalis Sr.'),
(27, 'Royce Langworth PhD', 'repudiandae', 'Eum soluta ut sint quasi porro.', '1564321356', 'Miss Eleanore Thompson'),
(28, 'Dr. Alexa Nicolas II', 'hic', 'Quo itaque dolorum impedit eaque velit.', '1564321356', 'Wilson Emmerich'),
(29, 'Miss Aditya Hand', 'facere', 'Necessitatibus modi quidem dolorum officiis porro.', '1564321356', 'Ms. Anne Bartoletti V'),
(30, 'Joesph Nitzsche I', 'officia', 'Culpa cum quaerat delectus possimus et eum.', '1564321356', 'Mr. Emory Okuneva'),
(31, 'Sandy Nienow', 'hic', 'Rerum eum nobis adipisci quisquam dolor.', '1564321356', 'Mr. Rick Schaden Sr.'),
(32, 'Dr. Richmond O\'Keefe', 'tempore', 'Aut est vel error sapiente.', '1564321356', 'Miss Melba Ritchie V'),
(33, 'Mr. Giovanni Langworth Jr.', 'nostrum', 'Nesciunt ipsam odio voluptas sunt.', '1564321356', 'Mya Stokes'),
(34, 'Virgie Kihn MD', 'quasi', 'Tempora quo vero quibusdam et qui ut quia quo consequatur.', '1564321356', 'Gideon Auer Jr.'),
(35, 'Mr. Caden McCullough IV', 'aliquam', 'Atque ut qui porro quisquam est voluptatem est sint.', '1564321356', 'Mrs. Isabell Schowalter III'),
(36, 'Reina Beatty', 'autem', 'Id dicta rerum voluptatem.', '1564321356', 'Mr. Jesus Roberts'),
(37, 'Dr. Felipe Feeney', 'porro', 'Sed non autem aperiam earum quo maxime.', '1564321356', 'Lonzo Kautzer'),
(38, 'Taylor Durgan', 'et', 'Et ut provident maxime eum.', '1564321356', 'Ms. Dayana Bradtke'),
(39, 'Howell Adams', 'ab', 'Quo reiciendis eius deleniti vero consectetur delectus suscipit.', '1564321356', 'Roel Schiller DDS'),
(40, 'Mr. Vaughn Rosenbaum III', 'ab', 'Voluptatem consequuntur illo et occaecati et hic praesentium a suscipit.', '1564321356', 'Ross Nienow'),
(41, 'Prof. Maurice Bogisich II', 'non', 'Impedit temporibus nobis magnam voluptatem.', '1564321356', 'Madelyn Reynolds'),
(42, 'Carlo Runolfsdottir', 'optio', 'In quo distinctio consectetur incidunt.', '1564321356', 'Mary Stanton II'),
(43, 'Michel Gislason', 'consequatur', 'Est sed dolores est aut.', '1564321356', 'Linda Barton I'),
(44, 'Eve Hudson', 'quia', 'Ipsa dolore enim quia dolore.', '1564321356', 'Lon Considine'),
(45, 'Mrs. Teagan O\'Conner DDS', 'repellat', 'Vel harum hic voluptatibus perferendis autem non omnis dolorem eum.', '1564321356', 'Martine Cronin'),
(46, 'Alexa Moen I', 'sit', 'Et nam ducimus recusandae non.', '1564321356', 'Nikita Reynolds'),
(47, 'Alexanne Torphy', 'et', 'Error consectetur autem perspiciatis dolorem magnam et et.', '1564321356', 'Queenie Hand'),
(48, 'Gisselle White', 'rem', 'Delectus aut aspernatur aut dolorum.', '1564321356', 'Prof. Lee Hintz III'),
(49, 'Tyrese Brown', 'laboriosam', 'Totam velit cumque molestiae maiores porro et qui.', '1564321356', 'Mandy Jacobs IV'),
(50, 'Shemar Becker', 'enim', 'Quia sit fugiat quis omnis odio ut adipisci quasi voluptate.', '1564321356', 'Adell Homenick');

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
(1, 'Incidunt et sit.', '1564321360', 0, 1, 196, 78, 56),
(2, 'Sint sed.', '1564321360', 1, 2, 23, 106, 125),
(3, 'A saepe quod.', '1564321360', 1, 3, 38, 141, 201),
(4, 'Sint quia necessitatibus culpa.', '1564321360', 1, 4, 31, 110, 137),
(5, 'Soluta vero pariatur.', '1564321360', 1, 5, 147, 23, 32),
(6, 'Autem itaque.', '1564321360', 1, 6, 103, 68, 77),
(7, 'Et repudiandae totam aperiam.', '1564321360', 0, 7, 58, 53, 41),
(8, 'Labore error sit et est quo.', '1564321360', 1, 8, 32, 11, 47),
(9, 'Fuga qui voluptate aut.', '1564321360', 1, 9, 159, 128, 91),
(10, 'Sunt consectetur.', '1564321360', 1, 10, 25, 36, 81),
(11, 'Quia.', '1564321360', 0, 11, 170, 105, 177),
(12, 'A et ex sunt cum.', '1564321360', 0, 12, 150, 186, 83),
(13, 'Sit.', '1564321360', 0, 13, 172, 134, 40),
(14, 'Fugit cum.', '1564321360', 1, 14, 189, 102, 6),
(15, 'Consequuntur numquam modi earum temporibus.', '1564321360', 0, 15, 134, 87, 36),
(16, 'Consequatur autem qui.', '1564321360', 0, 16, 26, 90, 139),
(17, 'Facilis.', '1564321360', 0, 17, 134, 124, 101),
(18, 'Expedita molestias aliquam.', '1564321360', 1, 18, 107, 131, 104),
(19, 'Est qui eum amet.', '1564321360', 1, 19, 187, 130, 48),
(20, 'Nemo velit officiis.', '1564321360', 1, 20, 90, 86, 48),
(21, 'Dolores a eos ea.', '1564321360', 0, 21, 91, 64, 55),
(22, 'Et est tempora.', '1564321360', 1, 22, 169, 203, 18),
(23, 'Hic voluptates possimus reiciendis veniam.', '1564321360', 1, 23, 137, 166, 87),
(24, 'Accusantium sint aut reprehenderit.', '1564321360', 1, 24, 59, 44, 127),
(25, 'Id voluptatem quas ullam nesciunt ut.', '1564321360', 1, 25, 78, 170, 19),
(26, 'Exercitationem nulla.', '1564321360', 0, 26, 53, 104, 140),
(27, 'Modi reiciendis expedita.', '1564321360', 0, 27, 80, 169, 90),
(28, 'Quaerat totam.', '1564321360', 1, 28, 198, 105, 191),
(29, 'Nam velit aspernatur recusandae.', '1564321360', 0, 29, 107, 126, 9),
(30, 'Odit eligendi ut eveniet.', '1564321360', 1, 30, 73, 148, 48),
(31, 'Itaque est officiis.', '1564321360', 1, 31, 13, 82, 168),
(32, 'Adipisci impedit enim in voluptatem illum.', '1564321360', 0, 32, 8, 76, 57),
(33, 'Neque voluptates qui.', '1564321360', 1, 33, 17, 96, 83),
(34, 'Eum autem quod.', '1564321360', 1, 34, 158, 57, 23),
(35, 'Enim ea voluptatibus.', '1564321361', 0, 35, 41, 84, 108),
(36, 'Quod ex magni omnis distinctio.', '1564321361', 1, 36, 108, 15, 135),
(37, 'Alias voluptatem aliquam dolor.', '1564321361', 0, 37, 152, 12, 165),
(38, 'Et delectus impedit ut consequatur.', '1564321361', 1, 38, 153, 100, 51),
(39, 'Quam qui vel.', '1564321361', 0, 39, 128, 125, 133),
(40, 'Consequatur ducimus ipsam.', '1564321361', 0, 40, 131, 145, 202),
(41, 'Rerum aut eum.', '1564321361', 0, 41, 155, 141, 80),
(42, 'Eaque inventore.', '1564321361', 1, 42, 60, 124, 192),
(43, 'Ab corrupti sit numquam dolorem sed.', '1564321361', 0, 43, 151, 141, 148),
(44, 'Molestiae facilis.', '1564321361', 1, 44, 129, 29, 198),
(45, 'Ut quo tempore.', '1564321361', 0, 45, 182, 172, 160),
(46, 'Vero voluptatem.', '1564321361', 1, 46, 111, 161, 142),
(47, 'Laborum nisi unde veritatis.', '1564321361', 0, 47, 185, 25, 93),
(48, 'Voluptatem esse ut et magnam consequatur.', '1564321361', 0, 48, 115, 139, 89),
(49, 'Nulla ut voluptatem minus.', '1564321361', 0, 49, 140, 160, 137),
(50, 'Veritatis nam eum.', '1564321361', 0, 50, 137, 44, 88),
(51, 'Aperiam molestias expedita quaerat aut.', '1564321361', 1, 51, 22, 144, 78),
(52, 'Dolor dolor.', '1564321361', 1, 52, 57, 9, 103),
(53, 'Accusantium aspernatur molestiae sed.', '1564321361', 0, 53, 127, 107, 92),
(54, 'Debitis ab consequuntur quibusdam.', '1564321361', 0, 54, 120, 88, 144),
(55, 'Id.', '1564321361', 1, 55, 35, 161, 139),
(56, 'Voluptatem culpa consequuntur.', '1564321361', 1, 56, 53, 159, 135),
(57, 'Quo mollitia voluptate fuga veniam aspernatur.', '1564321362', 1, 57, 61, 34, 110),
(58, 'Commodi voluptatem.', '1564321362', 0, 58, 56, 14, 189),
(59, 'In dolores ut sint ipsum.', '1564321362', 1, 59, 194, 126, 105),
(60, 'Sequi.', '1564321362', 0, 60, 57, 135, 147),
(61, 'Porro expedita.', '1564321362', 0, 61, 33, 32, 7),
(62, 'Molestias dicta.', '1564321362', 1, 62, 74, 97, 198),
(63, 'Dolorem.', '1564321362', 1, 63, 39, 130, 198),
(64, 'Aperiam commodi eum modi ipsum.', '1564321362', 0, 64, 2, 89, 50),
(65, 'Animi exercitationem quisquam ut eligendi.', '1564321362', 0, 65, 73, 206, 13),
(66, 'Perferendis blanditiis.', '1564321362', 1, 66, 34, 165, 107),
(67, 'Excepturi explicabo.', '1564321362', 1, 67, 84, 198, 152),
(68, 'Odio qui ut.', '1564321362', 1, 68, 78, 1, 124),
(69, 'Quas voluptatibus eaque atque.', '1564321362', 0, 69, 166, 177, 115),
(70, 'Velit architecto nostrum.', '1564321362', 0, 70, 96, 171, 187),
(71, 'Facere.', '1564321362', 0, 71, 189, 178, 183),
(72, 'Maxime et.', '1564321362', 0, 72, 199, 187, 20),
(73, 'Et sequi est qui.', '1564321362', 1, 73, 194, 2, 27),
(74, 'Dolor quae.', '1564321362', 1, 74, 45, 89, 52),
(75, 'Magnam vitae aut laborum nam.', '1564321362', 1, 75, 205, 178, 184),
(76, 'Omnis natus.', '1564321362', 1, 76, 192, 21, 51),
(77, 'Nulla ipsum enim repudiandae.', '1564321362', 0, 77, 143, 106, 187),
(78, 'Fugiat id voluptatum quia.', '1564321362', 1, 78, 73, 39, 64),
(79, 'Reiciendis harum et quia.', '1564321362', 1, 79, 60, 108, 168),
(80, 'Explicabo est.', '1564321362', 0, 80, 138, 61, 155),
(81, 'Sed sequi dolor.', '1564321362', 1, 81, 4, 184, 136),
(82, 'Rem dolorum eos.', '1564321362', 0, 82, 152, 165, 92),
(83, 'Optio reprehenderit corrupti saepe repudiandae.', '1564321363', 0, 83, 6, 203, 178),
(84, 'Blanditiis et.', '1564321363', 1, 84, 84, 127, 175),
(85, 'Dolorem qui recusandae in.', '1564321363', 0, 85, 139, 106, 73),
(86, 'Dolor natus quisquam aut.', '1564321363', 1, 86, 106, 32, 171),
(87, 'Eius exercitationem.', '1564321363', 1, 87, 64, 186, 151),
(88, 'Voluptas est facilis.', '1564321363', 0, 88, 190, 40, 70),
(89, 'Aut aut.', '1564321363', 1, 89, 194, 72, 126),
(90, 'Nesciunt perspiciatis et.', '1564321363', 0, 90, 24, 14, 113),
(91, 'Necessitatibus autem soluta cum blanditiis illo.', '1564321363', 1, 91, 114, 156, 12),
(92, 'Vel earum.', '1564321363', 0, 92, 190, 134, 10),
(93, 'Corporis rerum voluptate.', '1564321363', 1, 93, 82, 172, 97),
(94, 'Autem quasi commodi nesciunt.', '1564321363', 0, 94, 3, 147, 42),
(95, 'Modi ut hic repellat.', '1564321363', 0, 95, 4, 75, 87),
(96, 'Sit eius delectus nesciunt aliquid dolores.', '1564321363', 0, 96, 77, 132, 30),
(97, 'Praesentium illo.', '1564321363', 1, 97, 149, 131, 139),
(98, 'Voluptatum quas dolor.', '1564321363', 0, 98, 28, 133, 50),
(99, 'Deleniti.', '1564321363', 1, 99, 206, 97, 40),
(100, 'Sunt exercitationem.', '1564321363', 1, 100, 121, 168, 10),
(101, 'Sit veniam mollitia cumque.', '1564321363', 0, 101, 90, 186, 87),
(102, 'Rerum et vel facilis ipsam.', '1564321363', 0, 102, 51, 28, 82),
(103, 'Ipsa commodi pariatur.', '1564321363', 1, 103, 161, 40, 37),
(104, 'Qui nobis quia nesciunt porro rem.', '1564321363', 1, 104, 151, 162, 184),
(105, 'Nesciunt et ut explicabo.', '1564321363', 1, 105, 23, 168, 183),
(106, 'Nihil accusantium reiciendis.', '1564321363', 1, 106, 125, 114, 68),
(107, 'Facilis non.', '1564321363', 0, 107, 122, 39, 87),
(108, 'Laboriosam eum.', '1564321363', 1, 108, 106, 176, 129),
(109, 'Aut asperiores et fugiat laborum optio.', '1564321363', 0, 109, 52, 129, 32),
(110, 'Illum dicta magni.', '1564321363', 1, 110, 33, 62, 84),
(111, 'Rem tempora fuga.', '1564321363', 1, 111, 109, 180, 106),
(112, 'Accusamus.', '1564321363', 0, 112, 73, 41, 40),
(113, 'Id enim eveniet ut illo.', '1564321363', 0, 113, 76, 195, 185),
(114, 'Et ut maiores omnis reprehenderit.', '1564321363', 1, 114, 168, 168, 186),
(115, 'Earum ab.', '1564321363', 0, 115, 138, 196, 163),
(116, 'Nulla quidem.', '1564321364', 0, 116, 97, 138, 3),
(117, 'Voluptas unde qui.', '1564321364', 0, 117, 8, 43, 23),
(118, 'Sit rem vero dolores dignissimos.', '1564321364', 0, 118, 206, 172, 55),
(119, 'Rerum in nostrum quo.', '1564321364', 0, 119, 100, 19, 4),
(120, 'Excepturi aut et veritatis rem.', '1564321364', 1, 120, 42, 103, 72),
(121, 'Veritatis.', '1564321364', 0, 121, 61, 74, 34),
(122, 'Est dolor.', '1564321364', 0, 122, 73, 49, 182),
(123, 'Et voluptatem.', '1564321364', 0, 123, 200, 31, 34),
(124, 'Necessitatibus ducimus exercitationem.', '1564321364', 1, 124, 131, 22, 40),
(125, 'Nihil ratione blanditiis.', '1564321364', 1, 125, 84, 102, 186),
(126, 'In quibusdam perferendis occaecati.', '1564321364', 0, 126, 75, 166, 173),
(127, 'Nihil et sint est.', '1564321364', 1, 127, 70, 201, 111),
(128, 'Enim at consequatur.', '1564321364', 0, 128, 127, 135, 84),
(129, 'Perferendis odit at asperiores.', '1564321364', 0, 129, 74, 177, 118),
(130, 'Voluptate maxime ducimus.', '1564321364', 1, 130, 92, 69, 36),
(131, 'Ut quidem nam neque iure unde.', '1564321364', 0, 131, 24, 68, 54),
(132, 'Corporis sequi.', '1564321364', 0, 132, 167, 14, 84),
(133, 'Molestiae harum.', '1564321364', 0, 133, 106, 129, 198),
(134, 'Vitae velit quo quo autem ut.', '1564321364', 0, 134, 40, 71, 96),
(135, 'Quaerat at.', '1564321364', 1, 135, 102, 202, 43),
(136, 'Sed vel.', '1564321364', 1, 136, 24, 147, 7),
(137, 'Esse molestiae.', '1564321364', 0, 137, 48, 163, 97),
(138, 'Voluptas.', '1564321364', 0, 138, 42, 15, 134),
(139, 'Sint aliquam cum quis dolorem impedit.', '1564321364', 1, 139, 25, 184, 5),
(140, 'Qui corrupti omnis.', '1564321364', 0, 140, 116, 137, 150),
(141, 'Magni reiciendis aliquid.', '1564321364', 0, 141, 187, 136, 116),
(142, 'Voluptatem voluptates.', '1564321364', 0, 142, 36, 43, 170),
(143, 'Maiores aut.', '1564321364', 1, 143, 180, 166, 77),
(144, 'Tenetur vero.', '1564321364', 1, 144, 140, 161, 88),
(145, 'Et iste.', '1564321364', 0, 145, 56, 67, 93),
(146, 'Aperiam.', '1564321364', 0, 146, 106, 141, 68),
(147, 'Dolor.', '1564321364', 0, 147, 101, 6, 89),
(148, 'Necessitatibus eligendi.', '1564321364', 1, 148, 12, 44, 188),
(149, 'Libero.', '1564321364', 0, 149, 162, 7, 54),
(150, 'Autem sunt facilis optio voluptate.', '1564321364', 0, 150, 76, 60, 153),
(151, 'Sequi ab expedita.', '1564321364', 1, 151, 58, 164, 129),
(152, 'Ea pariatur fugiat.', '1564321364', 1, 152, 78, 194, 140),
(153, 'Officia ratione culpa.', '1564321364', 1, 153, 109, 48, 164),
(154, 'Sint tenetur et.', '1564321364', 1, 154, 124, 113, 41),
(155, 'Beatae molestias et occaecati.', '1564321364', 0, 155, 40, 181, 113),
(156, 'Error atque consectetur.', '1564321364', 0, 156, 190, 9, 55),
(157, 'Porro velit.', '1564321364', 0, 157, 37, 154, 129),
(158, 'Repudiandae eius.', '1564321364', 0, 158, 201, 160, 30),
(159, 'Omnis modi quis sapiente.', '1564321364', 1, 159, 73, 111, 141),
(160, 'Id.', '1564321364', 0, 160, 99, 35, 172),
(161, 'Velit cum debitis.', '1564321364', 1, 161, 131, 145, 41),
(162, 'Explicabo at omnis.', '1564321364', 1, 162, 17, 1, 21),
(163, 'Laborum laudantium ratione eos natus.', '1564321364', 1, 163, 136, 132, 116),
(164, 'Eligendi.', '1564321364', 1, 164, 194, 173, 49),
(165, 'Numquam.', '1564321364', 0, 165, 186, 100, 80),
(166, 'At ipsum eius.', '1564321364', 0, 166, 8, 69, 80),
(167, 'Ea accusamus.', '1564321364', 1, 167, 187, 27, 33),
(168, 'Possimus sit dolore aliquam.', '1564321364', 0, 168, 145, 48, 114),
(169, 'Nihil sed explicabo.', '1564321364', 1, 169, 177, 149, 25),
(170, 'Fugit quidem eligendi.', '1564321364', 1, 170, 137, 182, 149),
(171, 'Nisi.', '1564321364', 1, 171, 185, 29, 61),
(172, 'Eum quia accusantium beatae.', '1564321364', 1, 172, 3, 164, 201),
(173, 'Rerum laboriosam alias ut.', '1564321364', 0, 173, 83, 167, 9),
(174, 'Quis.', '1564321364', 1, 174, 137, 21, 150),
(175, 'Dolores.', '1564321364', 1, 175, 113, 151, 105),
(176, 'Non.', '1564321364', 1, 176, 164, 139, 142),
(177, 'Fugiat nobis sit aut.', '1564321364', 1, 177, 112, 86, 72),
(178, 'Similique numquam.', '1564321364', 0, 178, 1, 75, 22),
(179, 'Qui mollitia.', '1564321364', 0, 179, 44, 9, 50),
(180, 'Dolorem sed delectus.', '1564321364', 1, 180, 153, 160, 79),
(181, 'Quo numquam.', '1564321364', 1, 181, 173, 138, 149),
(182, 'Numquam.', '1564321364', 1, 182, 162, 101, 139),
(183, 'Fugit qui.', '1564321364', 1, 183, 123, 133, 101),
(184, 'Asperiores odit.', '1564321364', 1, 184, 93, 150, 146),
(185, 'Autem.', '1564321364', 1, 185, 82, 46, 93),
(186, 'Recusandae.', '1564321364', 1, 186, 95, 8, 94),
(187, 'Voluptatem qui alias.', '1564321364', 0, 187, 128, 118, 171),
(188, 'Laborum sit enim deserunt facere sint.', '1564321364', 0, 188, 174, 113, 146),
(189, 'Numquam ut quia.', '1564321364', 0, 189, 38, 103, 33),
(190, 'Ipsam sunt sunt.', '1564321364', 1, 190, 152, 118, 133),
(191, 'Accusantium.', '1564321364', 1, 191, 30, 99, 59),
(192, 'Quis id blanditiis.', '1564321364', 0, 192, 99, 138, 175),
(193, 'Minima inventore.', '1564321364', 1, 193, 174, 144, 80),
(194, 'Quaerat.', '1564321364', 0, 194, 127, 64, 201),
(195, 'Numquam laudantium neque.', '1564321364', 1, 195, 48, 46, 115),
(196, 'Incidunt ut.', '1564321364', 0, 196, 93, 188, 114),
(197, 'Soluta consequatur nobis quis.', '1564321364', 0, 197, 36, 117, 36),
(198, 'Corrupti perferendis illo.', '1564321364', 0, 198, 13, 174, 188),
(199, 'Sint explicabo deserunt et.', '1564321364', 1, 199, 127, 29, 186),
(200, 'Doloribus ducimus est non.', '1564321364', 1, 200, 99, 193, 173),
(201, 'Non consequatur consequatur.', '1564321364', 1, 201, 157, 59, 41),
(202, 'Sed qui iusto.', '1564321364', 0, 202, 45, 112, 109),
(203, 'Sint et animi.', '1564321365', 0, 203, 39, 40, 65),
(204, 'Qui repudiandae unde.', '1564321365', 1, 204, 99, 171, 17),
(205, 'Deleniti magnam.', '1564321365', 1, 205, 107, 39, 15),
(206, 'Dolore omnis animi et.', '1564321365', 1, 206, 24, 105, 99),
(207, 'Architecto reiciendis aut sapiente et.', '1564321365', 1, 207, 136, 170, 131),
(208, 'Aut commodi dolor.', '1564321365', 1, 208, 53, 19, 22),
(209, 'Qui provident.', '1564321365', 0, 209, 204, 44, 14),
(210, 'Quia doloribus laborum quam reprehenderit.', '1564321365', 1, 210, 21, 122, 136),
(211, 'Cumque aspernatur ut consequatur.', '1564321365', 1, 211, 21, 150, 20),
(212, 'Aut ab temporibus adipisci.', '1564321365', 0, 212, 134, 33, 106),
(213, 'Aut quo eos dolorem omnis pariatur.', '1564321365', 1, 213, 4, 181, 161),
(214, 'Voluptates omnis et.', '1564321365', 0, 214, 67, 166, 22),
(215, 'Ad occaecati.', '1564321365', 1, 215, 167, 127, 116),
(216, 'Neque eius dolorem ut.', '1564321365', 1, 216, 158, 185, 112),
(217, 'Veniam.', '1564321365', 0, 217, 60, 191, 80),
(218, 'Aut expedita similique.', '1564321365', 0, 218, 54, 154, 89),
(219, 'Et.', '1564321365', 1, 219, 107, 88, 44),
(220, 'Doloribus sit deleniti aut error ipsa.', '1564321365', 0, 220, 159, 153, 187),
(221, 'Quia modi.', '1564321365', 0, 221, 84, 173, 100),
(222, 'Vero molestiae.', '1564321365', 0, 222, 194, 202, 133),
(223, 'Ut consequatur.', '1564321365', 0, 223, 28, 192, 185),
(224, 'Ut qui iste et.', '1564321365', 0, 224, 134, 119, 57),
(225, 'Sapiente.', '1564321365', 1, 225, 67, 29, 189),
(226, 'Sit.', '1564321365', 0, 226, 105, 24, 42),
(227, 'Ut.', '1564321365', 1, 227, 28, 130, 96),
(228, 'Ipsum quasi et hic sequi.', '1564321365', 0, 228, 125, 173, 174),
(229, 'Enim.', '1564321365', 0, 229, 113, 19, 47),
(230, 'Quae alias sit.', '1564321365', 0, 230, 57, 181, 188),
(231, 'Rerum.', '1564321365', 0, 231, 128, 99, 92),
(232, 'Dolorum blanditiis.', '1564321365', 0, 232, 16, 143, 112),
(233, 'Cumque corrupti.', '1564321365', 0, 233, 112, 69, 158),
(234, 'Nesciunt omnis blanditiis fugit quisquam.', '1564321365', 0, 234, 27, 84, 28),
(235, 'Sunt in inventore.', '1564321365', 0, 235, 145, 67, 47),
(236, 'Quo voluptatum.', '1564321365', 1, 236, 94, 153, 156),
(237, 'Cum animi corrupti.', '1564321365', 0, 237, 31, 62, 28),
(238, 'Iure occaecati quibusdam.', '1564321365', 0, 238, 116, 72, 177),
(239, 'Esse quia.', '1564321365', 0, 239, 109, 152, 18),
(240, 'Omnis vel et voluptatem.', '1564321365', 0, 240, 106, 10, 153),
(241, 'Ut fugit.', '1564321365', 0, 241, 84, 3, 69),
(242, 'Est explicabo quis sed dolores sapiente.', '1564321365', 0, 242, 149, 194, 28),
(243, 'Nostrum sit et.', '1564321365', 0, 243, 155, 81, 5),
(244, 'Saepe porro amet.', '1564321365', 1, 244, 45, 198, 17),
(245, 'Quia consequatur eos.', '1564321365', 1, 245, 39, 116, 81),
(246, 'Harum sint mollitia qui.', '1564321365', 0, 246, 98, 18, 16),
(247, 'Cumque quia praesentium.', '1564321365', 0, 247, 123, 44, 96),
(248, 'Atque eaque itaque.', '1564321365', 0, 248, 66, 67, 27),
(249, 'Rerum.', '1564321365', 0, 249, 141, 93, 150),
(250, 'Ab est et rerum.', '1564321365', 1, 250, 198, 40, 53),
(251, 'Non sed velit cum.', '1564321365', 0, 251, 113, 38, 190),
(252, 'Provident sint.', '1564321365', 1, 252, 60, 57, 53),
(253, 'Sed.', '1564321365', 1, 253, 153, 8, 94),
(254, 'Voluptate nemo cumque ut et.', '1564321365', 0, 254, 189, 32, 168),
(255, 'Amet odit.', '1564321365', 1, 255, 29, 80, 203),
(256, 'Vero in reiciendis consequatur.', '1564321365', 0, 256, 1, 151, 122),
(257, 'Enim numquam vero consequatur.', '1564321365', 1, 257, 107, 159, 93),
(258, 'Harum et.', '1564321365', 1, 258, 33, 100, 195),
(259, 'In incidunt impedit qui ea.', '1564321365', 0, 259, 164, 198, 9),
(260, 'Ab nobis temporibus numquam.', '1564321365', 0, 260, 169, 180, 85),
(261, 'Officia iusto at eligendi adipisci.', '1564321365', 0, 261, 131, 50, 19),
(262, 'Et omnis totam totam.', '1564321365', 0, 262, 146, 133, 141),
(263, 'Inventore asperiores repellat praesentium.', '1564321365', 1, 263, 169, 177, 26),
(264, 'Laboriosam iure.', '1564321365', 1, 264, 115, 3, 121),
(265, 'Laudantium voluptatibus quia vitae eaque.', '1564321365', 0, 265, 76, 56, 181),
(266, 'Sed hic.', '1564321365', 1, 266, 1, 73, 182),
(267, 'Nam assumenda aperiam.', '1564321365', 1, 267, 160, 122, 36),
(268, 'Sapiente odio voluptas corrupti.', '1564321365', 1, 268, 36, 51, 175),
(269, 'Non.', '1564321365', 0, 269, 63, 153, 107),
(270, 'Non delectus voluptatem.', '1564321365', 0, 270, 173, 83, 85),
(271, 'Magnam dicta qui fuga occaecati laboriosam.', '1564321365', 1, 271, 144, 143, 100),
(272, 'Vero culpa doloribus est.', '1564321365', 0, 272, 98, 35, 73),
(273, 'Recusandae dolorum necessitatibus.', '1564321365', 0, 273, 106, 152, 56),
(274, 'Qui porro vero.', '1564321365', 1, 274, 49, 141, 151),
(275, 'Quas.', '1564321365', 0, 275, 140, 168, 34),
(276, 'Eos ipsum voluptas et facilis.', '1564321365', 1, 276, 22, 132, 47),
(277, 'Autem.', '1564321365', 1, 277, 151, 4, 146),
(278, 'Eos culpa.', '1564321365', 1, 278, 89, 75, 50),
(279, 'Voluptas minima dolorem.', '1564321365', 0, 279, 109, 21, 122),
(280, 'Id est perferendis officiis.', '1564321365', 1, 280, 137, 9, 193),
(281, 'Impedit consequatur omnis error.', '1564321365', 0, 281, 6, 18, 132),
(282, 'Voluptas esse quo architecto.', '1564321365', 1, 282, 102, 83, 149),
(283, 'Rem temporibus.', '1564321365', 0, 283, 198, 88, 63),
(284, 'Qui aut consequatur qui.', '1564321366', 1, 284, 79, 26, 75),
(285, 'Esse est.', '1564321366', 1, 285, 3, 92, 28),
(286, 'Et vero veniam.', '1564321366', 1, 286, 125, 37, 111),
(287, 'Ducimus.', '1564321366', 0, 287, 56, 58, 82),
(288, 'Natus deserunt.', '1564321366', 1, 288, 114, 205, 205),
(289, 'Fugiat iure quo.', '1564321366', 1, 289, 182, 19, 129),
(290, 'Occaecati sint aliquid qui amet.', '1564321366', 1, 290, 205, 72, 160),
(291, 'Maxime cupiditate.', '1564321366', 0, 291, 182, 80, 159),
(292, 'Doloribus.', '1564321366', 0, 292, 77, 94, 9),
(293, 'Fuga.', '1564321366', 0, 293, 69, 32, 90),
(294, 'Consequatur non.', '1564321366', 0, 294, 13, 180, 160),
(295, 'Reiciendis.', '1564321366', 0, 295, 139, 3, 26),
(296, 'Ut inventore vel officiis.', '1564321366', 0, 296, 138, 133, 199),
(297, 'Dolorem optio.', '1564321366', 0, 297, 136, 59, 85),
(298, 'Reiciendis ut est.', '1564321366', 1, 298, 125, 140, 107),
(299, 'Amet a aliquid natus.', '1564321366', 1, 299, 194, 132, 137),
(300, 'Nam nesciunt et libero.', '1564321366', 1, 300, 134, 95, 35),
(301, 'Et distinctio aliquid aut praesentium.', '1564321366', 0, 301, 143, 112, 1),
(302, 'Quod.', '1564321366', 0, 302, 59, 41, 150),
(303, 'Eum deleniti.', '1564321366', 1, 303, 202, 149, 134),
(304, 'Quod et atque tenetur sit officiis.', '1564321366', 0, 304, 146, 64, 64),
(305, 'Facilis sit quia.', '1564321366', 0, 305, 14, 75, 91),
(306, 'Recusandae vitae.', '1564321366', 1, 306, 191, 176, 132),
(307, 'Blanditiis et ullam.', '1564321366', 0, 307, 131, 170, 77),
(308, 'Repudiandae blanditiis qui ut maiores.', '1564321366', 0, 308, 92, 16, 47),
(309, 'Blanditiis fuga quod.', '1564321366', 0, 309, 177, 76, 136),
(310, 'Unde alias.', '1564321366', 1, 310, 27, 125, 107),
(311, 'Dolor maxime tempora.', '1564321366', 1, 311, 147, 112, 195),
(312, 'Optio voluptas sint ea.', '1564321366', 0, 312, 121, 40, 188),
(313, 'Ad.', '1564321366', 0, 313, 114, 65, 119),
(314, 'Quo quia et.', '1564321366', 1, 314, 141, 101, 111),
(315, 'Commodi velit qui voluptas ut.', '1564321366', 1, 315, 182, 111, 5),
(316, 'Non quia.', '1564321366', 0, 316, 183, 49, 136),
(317, 'Saepe consectetur autem.', '1564321366', 1, 317, 40, 149, 8),
(318, 'Veritatis voluptas.', '1564321366', 0, 318, 101, 147, 122),
(319, 'Nostrum aut ipsam.', '1564321366', 0, 319, 107, 190, 42),
(320, 'Rerum magnam qui dolore.', '1564321366', 1, 320, 162, 102, 152),
(321, 'Similique culpa.', '1564321366', 1, 321, 134, 154, 131),
(322, 'Fuga.', '1564321366', 1, 322, 179, 1, 148),
(323, 'Nesciunt sed.', '1564321366', 1, 323, 21, 3, 202),
(324, 'Labore iure ea.', '1564321366', 1, 324, 157, 62, 69),
(325, 'Velit ut.', '1564321366', 0, 325, 169, 150, 66),
(326, 'Repellat.', '1564321366', 0, 326, 176, 66, 76),
(327, 'Temporibus natus.', '1564321366', 1, 327, 37, 11, 110),
(328, 'Sint laborum dolorum sunt.', '1564321366', 0, 328, 20, 166, 98),
(329, 'Voluptas impedit unde.', '1564321366', 0, 329, 161, 33, 72),
(330, 'Suscipit.', '1564321366', 1, 330, 68, 165, 114),
(331, 'Voluptatem sed aliquam voluptas et error.', '1564321366', 0, 331, 115, 7, 146),
(332, 'Id error aut aut.', '1564321366', 1, 332, 192, 4, 193),
(333, 'Quod deleniti.', '1564321366', 1, 333, 162, 161, 121),
(334, 'Ipsa veritatis.', '1564321366', 0, 334, 20, 197, 28),
(335, 'Id et et nulla eos accusantium.', '1564321366', 1, 335, 74, 72, 147),
(336, 'Molestiae enim accusamus fugiat necessitatibus.', '1564321366', 0, 336, 68, 32, 82),
(337, 'Commodi et et.', '1564321366', 1, 337, 83, 104, 128),
(338, 'Aut perferendis rerum sit.', '1564321366', 1, 338, 191, 10, 59),
(339, 'Perferendis odio veritatis dignissimos.', '1564321366', 1, 339, 93, 206, 28),
(340, 'Cupiditate.', '1564321366', 1, 340, 51, 145, 45),
(341, 'Doloremque in facilis.', '1564321366', 0, 341, 67, 38, 32),
(342, 'Dolores facere id repudiandae ut.', '1564321366', 0, 342, 159, 191, 47),
(343, 'Est et sed consequatur et.', '1564321366', 0, 343, 120, 200, 159),
(344, 'Nisi rem doloremque ut at.', '1564321366', 1, 344, 78, 94, 4),
(345, 'Voluptas quo.', '1564321366', 0, 345, 19, 97, 156),
(346, 'Iste animi aperiam sunt.', '1564321366', 0, 346, 151, 170, 84),
(347, 'Aut cupiditate expedita.', '1564321366', 1, 347, 158, 49, 200),
(348, 'Repudiandae sit animi.', '1564321366', 0, 348, 11, 3, 153),
(349, 'Voluptate repellendus nisi.', '1564321366', 0, 349, 77, 196, 188),
(350, 'Expedita.', '1564321366', 1, 350, 142, 132, 187),
(351, 'Aliquam.', '1564321366', 1, 351, 200, 2, 10),
(352, 'Possimus.', '1564321366', 1, 352, 202, 34, 193),
(353, 'Quis.', '1564321366', 0, 353, 199, 113, 66),
(354, 'Corporis blanditiis in ipsam.', '1564321366', 1, 354, 186, 96, 63),
(355, 'Delectus harum.', '1564321366', 1, 355, 147, 87, 35),
(356, 'Impedit.', '1564321366', 0, 356, 76, 75, 175),
(357, 'Porro aut sequi sint suscipit.', '1564321366', 1, 357, 39, 147, 16),
(358, 'Modi voluptas.', '1564321366', 1, 358, 102, 72, 206),
(359, 'Laborum architecto molestias et.', '1564321366', 0, 359, 119, 144, 106),
(360, 'Odit sit repellendus.', '1564321366', 1, 360, 48, 16, 109),
(361, 'Placeat dolorem nulla.', '1564321366', 1, 361, 152, 29, 125),
(362, 'Numquam voluptas nihil.', '1564321366', 0, 362, 17, 110, 12),
(363, 'Nesciunt consectetur.', '1564321366', 1, 363, 99, 98, 43),
(364, 'Autem deleniti quisquam accusamus.', '1564321366', 0, 364, 13, 69, 26),
(365, 'Quibusdam.', '1564321366', 1, 365, 179, 16, 45),
(366, 'Rerum error.', '1564321366', 0, 366, 161, 170, 153),
(367, 'Soluta ut optio.', '1564321366', 1, 367, 118, 106, 176),
(368, 'Sequi.', '1564321367', 1, 368, 76, 124, 204),
(369, 'Eveniet est et.', '1564321367', 1, 369, 170, 31, 111),
(370, 'Amet voluptatem.', '1564321367', 0, 370, 84, 26, 100),
(371, 'Et.', '1564321367', 1, 371, 138, 122, 123),
(372, 'Quidem ut recusandae nihil.', '1564321367', 1, 372, 98, 83, 13),
(373, 'Ea est architecto.', '1564321367', 0, 373, 18, 153, 5),
(374, 'Eius iusto quos qui in.', '1564321367', 0, 374, 147, 153, 40),
(375, 'Molestiae.', '1564321367', 1, 375, 91, 30, 29),
(376, 'Eum autem et itaque.', '1564321367', 0, 376, 150, 49, 192),
(377, 'Nostrum est et.', '1564321367', 1, 377, 203, 176, 163),
(378, 'Ipsum.', '1564321367', 1, 378, 131, 170, 56),
(379, 'Dolor.', '1564321367', 0, 379, 27, 75, 151),
(380, 'Est.', '1564321367', 1, 380, 159, 201, 23),
(381, 'Voluptas temporibus.', '1564321367', 0, 381, 136, 60, 131),
(382, 'Blanditiis.', '1564321367', 0, 382, 74, 83, 83),
(383, 'Eligendi quas.', '1564321367', 1, 383, 153, 182, 45),
(384, 'Corporis dolor autem consequuntur laborum.', '1564321367', 0, 384, 206, 107, 117),
(385, 'Ipsam.', '1564321367', 1, 385, 205, 188, 11),
(386, 'Pariatur nisi sint cupiditate.', '1564321367', 0, 386, 18, 130, 95),
(387, 'Alias.', '1564321367', 0, 387, 122, 175, 30),
(388, 'Itaque accusantium.', '1564321367', 0, 388, 156, 34, 128),
(389, 'Et est facere quidem.', '1564321367', 0, 389, 113, 10, 113),
(390, 'Voluptatem et tenetur voluptatem.', '1564321367', 1, 390, 39, 150, 121),
(391, 'Quas.', '1564321367', 1, 391, 105, 160, 46),
(392, 'Possimus.', '1564321367', 0, 392, 202, 147, 199),
(393, 'Necessitatibus mollitia eos.', '1564321367', 0, 393, 170, 159, 145),
(394, 'Distinctio facere nam.', '1564321367', 0, 394, 1, 155, 196),
(395, 'Qui quam maiores quae.', '1564321367', 1, 395, 83, 75, 73),
(396, 'Ratione.', '1564321367', 0, 396, 60, 76, 122),
(397, 'Iste voluptatem quo.', '1564321367', 1, 397, 42, 4, 153),
(398, 'Et repellat.', '1564321367', 1, 398, 122, 31, 179),
(399, 'Rem aperiam totam sint rerum.', '1564321367', 1, 399, 83, 194, 33),
(400, 'Laudantium.', '1564321367', 0, 400, 76, 174, 135),
(401, 'Esse nostrum sit iusto.', '1564321367', 1, 401, 161, 135, 146),
(402, 'Optio similique in asperiores.', '1564321367', 0, 402, 156, 189, 172),
(403, 'Dolorum qui cumque aliquid aut odio.', '1564321367', 1, 403, 115, 15, 164),
(404, 'Et quibusdam facilis.', '1564321367', 0, 404, 80, 147, 83),
(405, 'Molestias ad harum esse.', '1564321367', 0, 405, 55, 199, 93),
(406, 'Qui eius explicabo quia voluptatem.', '1564321367', 0, 406, 143, 183, 174),
(407, 'Vero accusantium alias.', '1564321367', 1, 407, 3, 202, 77),
(408, 'Id.', '1564321367', 0, 408, 56, 54, 193),
(409, 'Corporis omnis unde dolores incidunt dolores.', '1564321367', 0, 409, 38, 172, 11),
(410, 'Nemo.', '1564321367', 1, 410, 77, 106, 151),
(411, 'Et autem vel.', '1564321367', 0, 411, 183, 191, 58),
(412, 'Nihil nemo ullam.', '1564321367', 0, 412, 205, 106, 166),
(413, 'Voluptates aut dolorum.', '1564321367', 1, 413, 22, 61, 48),
(414, 'Et beatae praesentium.', '1564321367', 0, 414, 28, 166, 39),
(415, 'Officiis laborum ut.', '1564321367', 0, 415, 194, 102, 122),
(416, 'Vero enim iusto.', '1564321367', 0, 416, 14, 33, 80),
(417, 'Et eligendi.', '1564321367', 1, 417, 165, 206, 49),
(418, 'Optio dolorem beatae.', '1564321367', 0, 418, 189, 122, 79),
(419, 'Tempora incidunt harum.', '1564321367', 1, 419, 137, 80, 87),
(420, 'Dolor cum sed.', '1564321367', 0, 420, 108, 73, 187),
(421, 'Quo repellat voluptatem nulla.', '1564321367', 0, 421, 154, 151, 204),
(422, 'Doloremque.', '1564321367', 1, 422, 66, 166, 29),
(423, 'Voluptatum.', '1564321367', 0, 423, 159, 134, 77),
(424, 'Quo in.', '1564321367', 1, 424, 149, 176, 108),
(425, 'Excepturi animi porro distinctio omnis voluptatibus.', '1564321367', 0, 425, 103, 70, 196),
(426, 'Error voluptatibus.', '1564321367', 1, 426, 111, 133, 113),
(427, 'Atque ea.', '1564321367', 0, 427, 12, 58, 134),
(428, 'Voluptatibus eius officia.', '1564321367', 1, 428, 10, 94, 3),
(429, 'Dolores nemo.', '1564321367', 0, 429, 92, 146, 164),
(430, 'Rem cum aut voluptatem.', '1564321367', 1, 430, 194, 35, 125),
(431, 'Quod quia molestiae.', '1564321367', 1, 431, 6, 66, 90),
(432, 'Laborum tempora similique eligendi ea.', '1564321367', 0, 432, 179, 107, 95),
(433, 'Quasi consectetur et libero.', '1564321367', 0, 433, 154, 17, 134),
(434, 'Quaerat ut unde.', '1564321367', 1, 434, 125, 93, 175),
(435, 'Mollitia corrupti.', '1564321367', 0, 435, 181, 33, 99),
(436, 'Et et accusamus.', '1564321367', 1, 436, 127, 201, 206),
(437, 'Hic necessitatibus.', '1564321367', 0, 437, 206, 201, 23),
(438, 'Ut minima rem.', '1564321367', 0, 438, 170, 117, 196),
(439, 'Ab atque sit assumenda.', '1564321367', 0, 439, 93, 50, 184),
(440, 'Aut consequatur.', '1564321367', 1, 440, 202, 130, 35),
(441, 'Pariatur enim sit.', '1564321367', 1, 441, 15, 190, 184),
(442, 'Voluptatem amet eveniet quis facere voluptatem.', '1564321367', 0, 442, 177, 53, 37),
(443, 'Optio eos.', '1564321367', 0, 443, 198, 22, 112),
(444, 'Earum tenetur aut.', '1564321367', 1, 444, 185, 132, 78),
(445, 'Nulla voluptatem doloribus qui.', '1564321367', 1, 445, 150, 113, 49),
(446, 'Doloribus.', '1564321368', 1, 446, 100, 130, 48),
(447, 'Eaque et nam vero.', '1564321368', 0, 447, 96, 144, 101),
(448, 'Sunt consequatur aut ut voluptate.', '1564321368', 1, 448, 64, 148, 34),
(449, 'Autem est accusamus.', '1564321368', 0, 449, 62, 96, 126),
(450, 'Impedit vel harum voluptatem.', '1564321368', 0, 450, 40, 14, 70),
(451, 'Dignissimos quibusdam.', '1564321368', 0, 451, 64, 194, 144),
(452, 'Molestiae architecto.', '1564321368', 0, 452, 40, 44, 182),
(453, 'Quia ad provident consequatur laudantium.', '1564321368', 1, 453, 179, 9, 8),
(454, 'Ut assumenda.', '1564321368', 1, 454, 80, 199, 14),
(455, 'Maiores dolore illum harum possimus voluptatem.', '1564321368', 1, 455, 94, 78, 188),
(456, 'Id odio.', '1564321368', 0, 456, 33, 162, 51),
(457, 'Vel.', '1564321368', 0, 457, 124, 174, 166),
(458, 'Sit aut libero.', '1564321368', 0, 458, 85, 187, 52),
(459, 'Ad.', '1564321368', 0, 459, 175, 179, 142),
(460, 'Ut et ducimus.', '1564321368', 1, 460, 11, 109, 20),
(461, 'Quam ad.', '1564321368', 0, 461, 23, 131, 38),
(462, 'Tempore.', '1564321368', 1, 462, 152, 106, 54),
(463, 'Laborum fuga omnis.', '1564321368', 0, 463, 59, 88, 146),
(464, 'Praesentium rerum animi molestiae earum.', '1564321368', 0, 464, 107, 196, 30),
(465, 'Quia architecto officiis.', '1564321368', 1, 465, 202, 7, 134),
(466, 'Non adipisci.', '1564321368', 1, 466, 152, 74, 139),
(467, 'Suscipit sint occaecati.', '1564321368', 0, 467, 124, 38, 63),
(468, 'Commodi laborum perspiciatis vel recusandae.', '1564321368', 1, 468, 179, 15, 205),
(469, 'Vel vero quia.', '1564321368', 1, 469, 5, 160, 42),
(470, 'Sunt consequatur quia.', '1564321368', 1, 470, 54, 171, 83),
(471, 'Tempora consequatur maiores.', '1564321368', 0, 471, 81, 173, 90),
(472, 'Cumque ipsum dolorum.', '1564321368', 0, 472, 67, 69, 133),
(473, 'Sit aliquid consequatur.', '1564321368', 1, 473, 33, 101, 144),
(474, 'Autem aut debitis id.', '1564321368', 0, 474, 105, 105, 118),
(475, 'Quisquam.', '1564321368', 0, 475, 199, 68, 3),
(476, 'Soluta dolores libero.', '1564321368', 0, 476, 29, 63, 116),
(477, 'Aut id illum ut debitis.', '1564321368', 0, 477, 169, 3, 45),
(478, 'Quisquam.', '1564321368', 0, 478, 114, 198, 117),
(479, 'Voluptatem repudiandae mollitia harum officia.', '1564321368', 1, 479, 111, 40, 131),
(480, 'Sapiente mollitia facere ea ullam.', '1564321368', 0, 480, 117, 66, 109),
(481, 'Accusamus.', '1564321368', 1, 481, 29, 130, 74),
(482, 'Debitis voluptatem consequatur.', '1564321368', 1, 482, 133, 119, 122),
(483, 'Debitis fugit tempore rem.', '1564321368', 1, 483, 155, 191, 66),
(484, 'Est quaerat eligendi voluptas.', '1564321368', 1, 484, 104, 100, 167),
(485, 'Accusamus accusantium rem.', '1564321368', 0, 485, 92, 94, 177),
(486, 'Itaque rerum eius.', '1564321368', 1, 486, 166, 25, 40),
(487, 'Aut et ducimus possimus.', '1564321368', 1, 487, 140, 30, 156),
(488, 'Ut voluptas.', '1564321368', 0, 488, 148, 70, 72),
(489, 'Quas debitis qui possimus perferendis.', '1564321368', 0, 489, 154, 153, 132),
(490, 'Quo voluptas voluptatibus.', '1564321368', 1, 490, 69, 67, 136),
(491, 'Molestiae consequatur eveniet et quaerat expedita.', '1564321368', 0, 491, 5, 94, 46),
(492, 'Nihil et aliquid.', '1564321368', 1, 492, 26, 81, 93),
(493, 'Qui voluptates ullam.', '1564321368', 0, 493, 125, 145, 103),
(494, 'Animi error aut repellat et.', '1564321368', 1, 494, 44, 75, 15),
(495, 'Quas occaecati.', '1564321368', 0, 495, 93, 122, 69),
(496, 'Ipsa facere culpa.', '1564321368', 1, 496, 48, 58, 148),
(497, 'Numquam autem quaerat magnam.', '1564321368', 0, 497, 54, 110, 12),
(498, 'Enim sunt rerum sed aut.', '1564321368', 1, 498, 128, 42, 86),
(499, 'Aliquid assumenda debitis deleniti cum.', '1564321368', 0, 499, 152, 127, 10),
(500, 'Neque et.', '1564321368', 0, 500, 76, 83, 56),
(501, 'Dolores adipisci.', '1564321368', 0, 501, 100, 2, 106),
(502, 'Molestiae est.', '1564321368', 1, 502, 202, 96, 137),
(503, 'Deserunt recusandae natus.', '1564321368', 1, 503, 80, 196, 161),
(504, 'Nesciunt deleniti rerum velit excepturi.', '1564321368', 1, 504, 173, 32, 56),
(505, 'Ullam eos quod atque.', '1564321368', 1, 505, 97, 186, 28),
(506, 'Ut qui minima.', '1564321368', 1, 506, 129, 179, 184),
(507, 'Maxime dolor quis nesciunt.', '1564321368', 0, 507, 116, 8, 51),
(508, 'Porro modi sit molestiae.', '1564321368', 0, 508, 25, 87, 63),
(509, 'Quo quam.', '1564321368', 0, 509, 133, 76, 12),
(510, 'Corrupti aut.', '1564321369', 1, 510, 6, 33, 196),
(511, 'Ut excepturi autem.', '1564321369', 0, 511, 104, 119, 159),
(512, 'Dolorem et est sint sunt expedita.', '1564321369', 0, 512, 46, 56, 144),
(513, 'Ad.', '1564321369', 0, 513, 145, 30, 46),
(514, 'Et corrupti doloribus aut autem aliquam.', '1564321369', 0, 514, 94, 135, 79),
(515, 'Deserunt error.', '1564321369', 0, 515, 122, 196, 99),
(516, 'Molestias vel et.', '1564321369', 0, 516, 91, 174, 195),
(517, 'Sint a.', '1564321369', 0, 517, 118, 76, 54),
(518, 'Quae magni.', '1564321369', 1, 518, 60, 200, 119),
(519, 'In deserunt illum deleniti et et.', '1564321369', 1, 519, 168, 99, 179),
(520, 'Recusandae.', '1564321369', 0, 520, 37, 183, 156),
(521, 'Qui earum eos.', '1564321369', 1, 521, 200, 137, 42),
(522, 'Sit quaerat quo.', '1564321369', 0, 522, 97, 114, 107),
(523, 'Ducimus nemo nihil eius.', '1564321369', 0, 523, 25, 199, 99),
(524, 'Neque maiores.', '1564321369', 1, 524, 138, 49, 196),
(525, 'Accusamus est quos cumque.', '1564321369', 1, 525, 197, 188, 116),
(526, 'Nobis.', '1564321369', 0, 526, 123, 74, 91),
(527, 'Neque maiores.', '1564321369', 1, 527, 1, 198, 33),
(528, 'Et rem earum incidunt atque.', '1564321369', 0, 528, 25, 21, 188),
(529, 'Quaerat est.', '1564321369', 0, 529, 155, 118, 168),
(530, 'Quia ratione autem.', '1564321369', 0, 530, 4, 183, 98),
(531, 'Et in.', '1564321369', 1, 531, 42, 23, 136),
(532, 'Et aspernatur ut nam.', '1564321369', 0, 532, 75, 62, 67),
(533, 'Rerum doloremque quam inventore.', '1564321369', 1, 533, 106, 201, 116),
(534, 'Quos fugit occaecati esse.', '1564321369', 1, 534, 32, 150, 33),
(535, 'Rem impedit.', '1564321369', 0, 535, 166, 49, 119),
(536, 'Sit ipsum quisquam numquam ut.', '1564321369', 1, 536, 183, 44, 44),
(537, 'Qui.', '1564321369', 1, 537, 81, 2, 171),
(538, 'Nihil et.', '1564321369', 1, 538, 196, 137, 48),
(539, 'Provident ut dolorem consequatur impedit omnis.', '1564321369', 1, 539, 80, 34, 154),
(540, 'Iure sint aliquam ipsum.', '1564321369', 1, 540, 179, 38, 116),
(541, 'Quidem occaecati aut.', '1564321369', 0, 541, 138, 136, 167),
(542, 'Reiciendis.', '1564321369', 0, 542, 193, 134, 201),
(543, 'Et eum.', '1564321369', 0, 543, 116, 156, 154),
(544, 'Non necessitatibus laudantium ipsam consequatur.', '1564321369', 1, 544, 167, 142, 202),
(545, 'Laboriosam.', '1564321369', 0, 545, 177, 193, 149),
(546, 'Quam doloremque consequatur cumque autem.', '1564321369', 0, 546, 125, 157, 134),
(547, 'Ipsum quos.', '1564321369', 0, 547, 203, 86, 18),
(548, 'Autem culpa.', '1564321369', 1, 548, 100, 111, 140),
(549, 'Laboriosam aut delectus enim omnis in.', '1564321369', 1, 549, 23, 175, 66),
(550, 'Et est.', '1564321369', 1, 550, 124, 161, 130),
(551, 'Ducimus necessitatibus ullam quaerat.', '1564321369', 1, 551, 127, 144, 172),
(552, 'Ut.', '1564321369', 0, 552, 63, 82, 96),
(553, 'Repudiandae ut porro.', '1564321369', 1, 553, 206, 147, 141),
(554, 'Nihil.', '1564321369', 1, 554, 176, 150, 162),
(555, 'Dolorem.', '1564321369', 1, 555, 182, 73, 203),
(556, 'Quis occaecati sed placeat voluptatem.', '1564321369', 1, 556, 114, 31, 87),
(557, 'Similique numquam minus voluptas expedita.', '1564321369', 0, 557, 149, 138, 62),
(558, 'Mollitia qui adipisci.', '1564321369', 0, 558, 43, 134, 90),
(559, 'Commodi.', '1564321369', 0, 559, 51, 199, 192),
(560, 'Laborum ut.', '1564321369', 0, 560, 47, 81, 85),
(561, 'Aut.', '1564321369', 1, 561, 192, 105, 119),
(562, 'Magni aliquid.', '1564321369', 1, 562, 93, 4, 174),
(563, 'Commodi animi voluptatem dolorum sit.', '1564321369', 1, 563, 97, 177, 162),
(564, 'Eos sapiente explicabo.', '1564321369', 0, 564, 35, 126, 202),
(565, 'Assumenda.', '1564321369', 1, 565, 138, 48, 167),
(566, 'Ex.', '1564321369', 1, 566, 120, 128, 169),
(567, 'Delectus omnis velit laboriosam possimus.', '1564321369', 1, 567, 108, 182, 56),
(568, 'Minima.', '1564321369', 0, 568, 70, 72, 156),
(569, 'Ab iste architecto.', '1564321369', 1, 569, 160, 146, 117),
(570, 'Sit itaque quidem perspiciatis.', '1564321369', 0, 570, 119, 134, 109),
(571, 'Repellendus ex.', '1564321369', 0, 571, 100, 199, 189),
(572, 'Voluptatem laudantium nihil.', '1564321369', 0, 572, 122, 100, 97),
(573, 'Reiciendis.', '1564321369', 1, 573, 177, 85, 100),
(574, 'Id quaerat et.', '1564321369', 1, 574, 135, 176, 67),
(575, 'Rem et qui.', '1564321369', 1, 575, 191, 193, 23),
(576, 'Quisquam eligendi.', '1564321369', 0, 576, 121, 144, 120),
(577, 'Qui laboriosam.', '1564321370', 1, 577, 27, 45, 70),
(578, 'Possimus dolores.', '1564321370', 0, 578, 133, 7, 46),
(579, 'Alias est quidem.', '1564321370', 1, 579, 148, 108, 2),
(580, 'Vel dicta omnis fuga.', '1564321370', 1, 580, 137, 169, 100),
(581, 'Harum vel.', '1564321370', 1, 581, 31, 120, 153),
(582, 'Voluptates dolores.', '1564321370', 1, 582, 120, 156, 106),
(583, 'Ipsam.', '1564321370', 1, 583, 173, 203, 5),
(584, 'Odit nihil et.', '1564321370', 1, 584, 173, 15, 11),
(585, 'Placeat eligendi velit.', '1564321370', 0, 585, 35, 173, 114),
(586, 'Quae et modi reiciendis.', '1564321370', 0, 586, 59, 5, 141),
(587, 'Qui voluptates saepe voluptate.', '1564321370', 0, 587, 162, 2, 52),
(588, 'Omnis unde aut sunt sint.', '1564321370', 0, 588, 135, 36, 127),
(589, 'Sapiente amet.', '1564321370', 0, 589, 191, 93, 111),
(590, 'Officiis cumque ipsum sit.', '1564321370', 1, 590, 175, 40, 206),
(591, 'Et non tempora.', '1564321370', 1, 591, 29, 112, 177),
(592, 'Sit error omnis quod.', '1564321370', 1, 592, 48, 191, 163),
(593, 'Rerum quia quae aut in.', '1564321370', 0, 593, 122, 168, 139),
(594, 'A nihil possimus quod quis.', '1564321370', 0, 594, 85, 37, 161),
(595, 'Eveniet repellendus.', '1564321370', 0, 595, 8, 114, 136),
(596, 'Ut nihil eum explicabo.', '1564321370', 1, 596, 192, 200, 31),
(597, 'Consequatur soluta qui ut.', '1564321370', 0, 597, 84, 96, 137),
(598, 'Nostrum dolor nobis sit vel.', '1564321370', 0, 598, 50, 169, 125),
(599, 'Consequatur aspernatur.', '1564321370', 1, 599, 44, 73, 16),
(600, 'Omnis odio eos.', '1564321370', 0, 600, 202, 133, 59),
(601, 'Aut rerum debitis.', '1564321370', 1, 601, 2, 62, 129),
(602, 'Sed repudiandae.', '1564321370', 1, 602, 36, 19, 102),
(603, 'Voluptatem dolorum.', '1564321370', 1, 603, 87, 45, 127),
(604, 'Esse sapiente laboriosam repudiandae aut.', '1564321370', 0, 604, 124, 156, 35),
(605, 'Excepturi ipsum sint enim minus.', '1564321370', 0, 605, 22, 44, 174),
(606, 'Ab.', '1564321370', 1, 606, 119, 57, 36),
(607, 'Labore.', '1564321370', 1, 607, 119, 33, 172),
(608, 'Voluptas voluptate.', '1564321370', 0, 608, 146, 187, 128),
(609, 'Sequi tenetur.', '1564321370', 0, 609, 36, 28, 85),
(610, 'Enim qui ipsam.', '1564321370', 0, 610, 190, 21, 131),
(611, 'Dolore eligendi voluptate voluptatem soluta.', '1564321370', 0, 611, 146, 52, 165),
(612, 'Veritatis maiores.', '1564321370', 1, 612, 2, 156, 11),
(613, 'Enim eum.', '1564321370', 1, 613, 24, 82, 198),
(614, 'Quia iusto.', '1564321370', 0, 614, 153, 32, 135),
(615, 'Iure mollitia quasi.', '1564321370', 1, 615, 197, 195, 117),
(616, 'Doloremque aut in.', '1564321370', 0, 616, 75, 123, 170),
(617, 'Dolorem aut.', '1564321370', 0, 617, 136, 64, 144),
(618, 'In enim.', '1564321370', 0, 618, 123, 109, 165),
(619, 'Facilis consequuntur.', '1564321370', 0, 619, 55, 3, 8),
(620, 'A vitae.', '1564321371', 0, 620, 192, 39, 66),
(621, 'Libero ut vel dicta.', '1564321371', 1, 621, 131, 160, 196),
(622, 'Sit.', '1564321371', 0, 622, 135, 114, 150),
(623, 'Omnis at consequatur.', '1564321371', 0, 623, 58, 169, 66),
(624, 'Excepturi temporibus eos facere quia.', '1564321371', 1, 624, 183, 23, 48),
(625, 'Expedita eum iusto.', '1564321371', 1, 625, 200, 184, 68),
(626, 'Aut tempora.', '1564321371', 1, 626, 77, 162, 76),
(627, 'Quia nisi velit ipsa.', '1564321371', 1, 627, 134, 3, 26),
(628, 'Saepe voluptatem explicabo.', '1564321371', 0, 628, 21, 39, 85),
(629, 'Voluptas eveniet qui unde.', '1564321371', 0, 629, 8, 185, 80),
(630, 'Aut in adipisci id dolores.', '1564321371', 1, 630, 201, 181, 188),
(631, 'Tenetur culpa quia.', '1564321371', 0, 631, 182, 59, 174),
(632, 'Rerum esse.', '1564321371', 0, 632, 93, 177, 161),
(633, 'Consequatur.', '1564321371', 0, 633, 187, 24, 204),
(634, 'Modi dignissimos.', '1564321371', 1, 634, 164, 67, 201),
(635, 'Adipisci nisi non ullam ea.', '1564321371', 0, 635, 58, 145, 128),
(636, 'Quia ut.', '1564321371', 0, 636, 90, 50, 164),
(637, 'Eveniet dicta.', '1564321371', 0, 637, 69, 39, 75),
(638, 'Reiciendis maxime.', '1564321371', 1, 638, 31, 147, 106),
(639, 'Et atque sunt.', '1564321371', 0, 639, 83, 126, 99),
(640, 'Qui ut.', '1564321371', 1, 640, 11, 147, 28),
(641, 'Sapiente tempore.', '1564321371', 0, 641, 17, 124, 74),
(642, 'Nulla non.', '1564321371', 1, 642, 97, 128, 169),
(643, 'Unde non doloribus aliquid.', '1564321371', 0, 643, 44, 162, 141),
(644, 'Adipisci dolore reprehenderit amet.', '1564321371', 0, 644, 124, 151, 66),
(645, 'Quia laboriosam.', '1564321371', 1, 645, 194, 34, 85),
(646, 'Sed deleniti sunt eum.', '1564321372', 1, 646, 45, 57, 196),
(647, 'Aspernatur quibusdam.', '1564321372', 1, 647, 165, 191, 198),
(648, 'Reiciendis ut id aliquid dolorem.', '1564321372', 1, 648, 205, 111, 45),
(649, 'Autem est consequatur.', '1564321372', 0, 649, 155, 160, 30),
(650, 'Voluptas labore aperiam.', '1564321372', 0, 650, 125, 206, 1),
(651, 'Reiciendis maiores necessitatibus voluptatem quod.', '1564321372', 0, 651, 129, 202, 172),
(652, 'Et autem.', '1564321372', 0, 652, 159, 121, 101),
(653, 'Est non repudiandae velit.', '1564321372', 1, 653, 152, 120, 184),
(654, 'Necessitatibus iure.', '1564321372', 0, 654, 60, 35, 116),
(655, 'In adipisci.', '1564321372', 1, 655, 39, 61, 44),
(656, 'Impedit a ut.', '1564321372', 0, 656, 55, 121, 110),
(657, 'Maxime nulla est.', '1564321372', 1, 657, 188, 26, 149),
(658, 'Et enim quidem velit.', '1564321372', 1, 658, 152, 108, 206),
(659, 'Consequatur ipsam aut.', '1564321372', 1, 659, 72, 42, 171),
(660, 'Modi enim nihil recusandae explicabo impedit.', '1564321372', 0, 660, 103, 56, 6),
(661, 'Neque quas et fugit.', '1564321372', 0, 661, 41, 160, 43),
(662, 'Necessitatibus veniam error voluptatum tempora numquam.', '1564321372', 0, 662, 103, 37, 20),
(663, 'Ut et veniam molestias.', '1564321372', 1, 663, 145, 155, 118),
(664, 'Quae.', '1564321372', 1, 664, 95, 140, 115),
(665, 'Aperiam.', '1564321372', 0, 665, 27, 27, 146),
(666, 'Neque repellat vitae accusantium.', '1564321372', 1, 666, 11, 120, 170),
(667, 'Aperiam vitae ratione.', '1564321372', 1, 667, 21, 162, 126),
(668, 'Omnis.', '1564321372', 1, 668, 168, 60, 144),
(669, 'Tenetur odit consequuntur.', '1564321372', 1, 669, 9, 70, 194),
(670, 'Est et distinctio hic.', '1564321372', 0, 670, 180, 118, 139),
(671, 'In aut alias possimus deleniti non.', '1564321372', 0, 671, 143, 204, 153),
(672, 'Dolor.', '1564321372', 0, 672, 30, 91, 48),
(673, 'Ut aut quae sapiente dignissimos.', '1564321372', 1, 673, 95, 48, 13),
(674, 'Consequatur ipsa explicabo deleniti eos.', '1564321372', 0, 674, 20, 34, 22),
(675, 'Delectus sed.', '1564321373', 0, 675, 112, 126, 126),
(676, 'Dolorem quae nobis.', '1564321373', 0, 676, 135, 205, 122),
(677, 'Nobis architecto distinctio corrupti.', '1564321373', 0, 677, 62, 12, 131),
(678, 'Omnis laborum nihil ullam.', '1564321373', 1, 678, 10, 77, 7),
(679, 'Quam molestiae veritatis beatae reprehenderit.', '1564321373', 0, 679, 58, 11, 54),
(680, 'Quaerat et illum architecto.', '1564321373', 0, 680, 6, 60, 177),
(681, 'Et recusandae et.', '1564321373', 1, 681, 54, 195, 44),
(682, 'Vero itaque amet.', '1564321373', 0, 682, 23, 45, 4),
(683, 'Praesentium exercitationem.', '1564321373', 1, 683, 126, 198, 21),
(684, 'Totam debitis.', '1564321373', 0, 684, 72, 100, 202),
(685, 'Excepturi sed sunt.', '1564321373', 0, 685, 4, 120, 67),
(686, 'Et mollitia quos eos.', '1564321373', 0, 686, 101, 168, 120),
(687, 'Id repudiandae totam.', '1564321373', 1, 687, 158, 197, 113),
(688, 'Quasi aut illum quaerat provident.', '1564321373', 1, 688, 54, 193, 199),
(689, 'Quia.', '1564321373', 1, 689, 115, 87, 40),
(690, 'Quas rerum quaerat.', '1564321373', 0, 690, 72, 170, 107),
(691, 'Eveniet ipsa quia.', '1564321373', 0, 691, 38, 165, 95),
(692, 'Nisi illum aut consequatur architecto dolorum.', '1564321373', 1, 692, 141, 102, 205),
(693, 'Et perferendis aut.', '1564321373', 0, 693, 135, 26, 170),
(694, 'Totam odit enim dolores.', '1564321373', 1, 694, 67, 17, 155),
(695, 'Error vel et sit.', '1564321373', 1, 695, 195, 102, 52),
(696, 'Voluptatem et dolore iure.', '1564321373', 0, 696, 176, 145, 52),
(697, 'Dolorem ad aut officia.', '1564321373', 1, 697, 7, 75, 157),
(698, 'Ut similique veritatis dolores eveniet.', '1564321373', 1, 698, 46, 107, 112),
(699, 'Unde occaecati blanditiis maiores.', '1564321373', 0, 699, 173, 44, 126),
(700, 'Esse porro molestias temporibus quae.', '1564321374', 1, 700, 197, 125, 44),
(701, 'Eius.', '1564321374', 0, 701, 152, 150, 170),
(702, 'Vel rerum consectetur.', '1564321374', 0, 702, 194, 63, 114),
(703, 'Incidunt tempora saepe ullam.', '1564321374', 1, 703, 142, 197, 76),
(704, 'Id dolorem nisi laboriosam.', '1564321374', 0, 704, 59, 18, 119),
(705, 'Deleniti illo.', '1564321374', 0, 705, 70, 172, 76),
(706, 'Enim voluptatibus accusantium velit reprehenderit.', '1564321374', 0, 706, 14, 9, 168),
(707, 'Aut impedit.', '1564321374', 1, 707, 141, 85, 165),
(708, 'Sit dolorem adipisci velit cupiditate.', '1564321374', 0, 708, 1, 158, 37),
(709, 'Vero molestiae commodi sit.', '1564321374', 0, 709, 12, 146, 173),
(710, 'Perspiciatis debitis.', '1564321374', 1, 710, 159, 83, 46),
(711, 'Quos quae.', '1564321374', 0, 711, 67, 199, 143),
(712, 'Magnam quia aut.', '1564321374', 0, 712, 122, 181, 183),
(713, 'Nostrum eligendi.', '1564321374', 0, 713, 149, 27, 169),
(714, 'Quibusdam velit.', '1564321374', 0, 714, 63, 40, 132),
(715, 'Accusantium.', '1564321374', 0, 715, 143, 174, 25),
(716, 'At et occaecati perferendis et.', '1564321374', 0, 716, 87, 10, 102),
(717, 'Quaerat ut sapiente eveniet.', '1564321374', 1, 717, 21, 96, 83),
(718, 'Consequatur eaque eaque explicabo.', '1564321374', 1, 718, 64, 24, 152),
(719, 'Dolores non aut culpa.', '1564321374', 0, 719, 167, 108, 132),
(720, 'Rem vel.', '1564321374', 1, 720, 56, 200, 136),
(721, 'Totam reiciendis necessitatibus amet quidem sit.', '1564321374', 1, 721, 123, 58, 187),
(722, 'Commodi sapiente error.', '1564321374', 1, 722, 61, 1, 29),
(723, 'Consectetur possimus soluta ratione.', '1564321374', 1, 723, 37, 19, 180),
(724, 'Quaerat odio in quaerat.', '1564321374', 1, 724, 28, 60, 2),
(725, 'A incidunt officia nostrum.', '1564321374', 1, 725, 16, 157, 36),
(726, 'Provident beatae.', '1564321374', 0, 726, 162, 128, 40),
(727, 'Iusto enim id qui sit ullam.', '1564321374', 1, 727, 3, 127, 110),
(728, 'Commodi nulla excepturi.', '1564321375', 1, 728, 27, 20, 102),
(729, 'Quod voluptate delectus culpa.', '1564321375', 0, 729, 10, 137, 149),
(730, 'Autem.', '1564321375', 1, 730, 133, 180, 65),
(731, 'Sunt consequatur repudiandae occaecati aspernatur.', '1564321375', 1, 731, 103, 22, 72),
(732, 'Ex voluptas.', '1564321375', 1, 732, 10, 194, 76),
(733, 'Optio possimus consectetur quaerat quas minus.', '1564321375', 1, 733, 174, 37, 84),
(734, 'Aut totam minima laboriosam sequi deserunt.', '1564321375', 1, 734, 51, 24, 73),
(735, 'Nihil est voluptates.', '1564321375', 0, 735, 60, 46, 199),
(736, 'Eius quam cumque.', '1564321375', 1, 736, 50, 115, 50),
(737, 'Soluta recusandae facilis molestiae.', '1564321375', 1, 737, 172, 62, 26),
(738, 'Dolor alias eum ipsa vitae.', '1564321375', 0, 738, 85, 204, 49),
(739, 'Non totam.', '1564321375', 1, 739, 152, 46, 130),
(740, 'Quis rerum voluptatum.', '1564321375', 0, 740, 120, 93, 180),
(741, 'Deserunt.', '1564321375', 1, 741, 74, 189, 203),
(742, 'Sit et.', '1564321375', 0, 742, 8, 57, 189),
(743, 'Nulla et.', '1564321375', 0, 743, 21, 132, 196),
(744, 'Voluptate odio a ex aut.', '1564321375', 0, 744, 2, 80, 73),
(745, 'Consequatur id.', '1564321375', 1, 745, 32, 133, 155),
(746, 'Aut ipsum eligendi accusamus consequatur.', '1564321375', 0, 746, 169, 148, 200),
(747, 'Sed in et.', '1564321376', 1, 747, 178, 193, 16),
(748, 'Quis molestiae.', '1564321376', 0, 748, 106, 21, 173),
(749, 'Aperiam veniam sapiente voluptatem.', '1564321376', 1, 749, 204, 121, 79),
(750, 'Minima.', '1564321376', 1, 750, 88, 34, 135),
(751, 'Dolor et.', '1564321376', 1, 751, 67, 136, 176),
(752, 'Eaque et doloremque.', '1564321376', 0, 752, 147, 127, 44),
(753, 'Dolorem vero laboriosam aut.', '1564321376', 0, 753, 163, 75, 10),
(754, 'Nobis et amet ea.', '1564321376', 0, 754, 144, 25, 39),
(755, 'Et molestiae expedita ut et.', '1564321376', 1, 755, 11, 22, 86),
(756, 'Beatae et.', '1564321376', 0, 756, 152, 87, 136),
(757, 'Velit itaque.', '1564321376', 1, 757, 149, 203, 1),
(758, 'Tempore et.', '1564321376', 1, 758, 86, 103, 155),
(759, 'Explicabo voluptatem perferendis quia.', '1564321376', 1, 759, 110, 17, 43),
(760, 'Asperiores eaque ullam.', '1564321376', 0, 760, 115, 126, 1),
(761, 'Iusto eveniet.', '1564321376', 0, 761, 131, 53, 47),
(762, 'Aut.', '1564321376', 1, 762, 191, 139, 92),
(763, 'Est delectus vel at.', '1564321376', 1, 763, 172, 199, 18),
(764, 'Ducimus ut.', '1564321376', 0, 764, 143, 95, 90),
(765, 'Illo repellat natus.', '1564321376', 0, 765, 71, 130, 59),
(766, 'Enim quia.', '1564321376', 0, 766, 4, 99, 74),
(767, 'Quod incidunt.', '1564321376', 1, 767, 22, 92, 181),
(768, 'Voluptates placeat ea.', '1564321376', 1, 768, 71, 118, 181),
(769, 'Sint consequatur nihil.', '1564321376', 0, 769, 86, 175, 174),
(770, 'Atque non velit.', '1564321376', 0, 770, 3, 57, 202);
INSERT INTO `messages` (`id`, `messageText`, `dateSent`, `enable_reply`, `messageId`, `userId`, `fromId`, `toId`) VALUES
(771, 'Porro fugiat odio.', '1564321376', 1, 771, 117, 50, 196),
(772, 'Dolorum a.', '1564321376', 1, 772, 117, 170, 98),
(773, 'Dicta alias aut numquam et ratione.', '1564321376', 1, 773, 185, 186, 4),
(774, 'Dolor temporibus.', '1564321376', 0, 774, 100, 164, 7),
(775, 'Odio deserunt saepe quia iusto.', '1564321376', 0, 775, 43, 69, 106),
(776, 'Eveniet dignissimos.', '1564321376', 0, 776, 146, 52, 131),
(777, 'Ut laudantium exercitationem qui.', '1564321376', 0, 777, 72, 203, 85),
(778, 'Est rerum eveniet.', '1564321376', 0, 778, 159, 87, 153),
(779, 'Est dolor quia.', '1564321376', 1, 779, 70, 174, 80),
(780, 'Omnis.', '1564321376', 0, 780, 65, 15, 144),
(781, 'Dolores tenetur.', '1564321376', 1, 781, 204, 39, 157),
(782, 'Doloremque tempore dolor dolore.', '1564321376', 1, 782, 31, 127, 39),
(783, 'Et omnis.', '1564321376', 1, 783, 44, 122, 19),
(784, 'Recusandae fuga.', '1564321376', 1, 784, 100, 94, 19),
(785, 'Fugiat aliquid quod magni aut quis.', '1564321376', 0, 785, 66, 28, 77),
(786, 'Culpa tempora.', '1564321376', 0, 786, 30, 172, 85),
(787, 'Quod eos ut porro.', '1564321376', 1, 787, 58, 123, 13),
(788, 'Minus.', '1564321376', 1, 788, 110, 129, 144),
(789, 'Delectus consequatur nesciunt.', '1564321376', 1, 789, 23, 119, 79),
(790, 'Nobis rem ut.', '1564321376', 0, 790, 84, 76, 18),
(791, 'Ullam dolorem ut.', '1564321376', 1, 791, 99, 183, 162),
(792, 'Aspernatur ut.', '1564321376', 0, 792, 67, 49, 47),
(793, 'Placeat asperiores est.', '1564321376', 1, 793, 79, 107, 64),
(794, 'Voluptate laudantium.', '1564321376', 1, 794, 141, 166, 114),
(795, 'Autem nobis fugit consectetur.', '1564321376', 0, 795, 58, 130, 79),
(796, 'Omnis laborum.', '1564321376', 1, 796, 128, 4, 129),
(797, 'Ipsum est.', '1564321376', 0, 797, 150, 201, 87),
(798, 'Ut.', '1564321376', 0, 798, 13, 26, 206),
(799, 'Labore pariatur voluptatibus.', '1564321376', 0, 799, 169, 166, 2),
(800, 'Eveniet.', '1564321376', 1, 800, 47, 143, 125),
(801, 'Alias.', '1564321376', 1, 801, 190, 201, 202),
(802, 'Cum aut.', '1564321376', 0, 802, 181, 78, 86),
(803, 'Animi sunt.', '1564321376', 0, 803, 156, 195, 148),
(804, 'Ut.', '1564321376', 1, 804, 200, 106, 54),
(805, 'Velit consectetur excepturi voluptatem sunt possimus.', '1564321376', 1, 805, 196, 184, 148),
(806, 'Itaque ullam qui.', '1564321376', 1, 806, 80, 131, 94),
(807, 'Ex aut non vel.', '1564321376', 1, 807, 22, 34, 126),
(808, 'Quis natus qui asperiores eius.', '1564321376', 0, 808, 152, 105, 190),
(809, 'Sit cumque.', '1564321376', 0, 809, 8, 46, 41),
(810, 'Tempora.', '1564321376', 0, 810, 200, 156, 136),
(811, 'Iusto odit culpa.', '1564321376', 0, 811, 171, 59, 80),
(812, 'Dolorem molestiae.', '1564321377', 0, 812, 130, 68, 9),
(813, 'Cupiditate et.', '1564321377', 1, 813, 23, 133, 173),
(814, 'Quia deleniti excepturi est.', '1564321377', 0, 814, 159, 100, 186),
(815, 'Aut ipsam nesciunt ipsum ab.', '1564321377', 0, 815, 145, 125, 19),
(816, 'Magni dolorum voluptates veniam voluptatem ratione.', '1564321377', 0, 816, 97, 31, 196),
(817, 'Perspiciatis velit nesciunt deleniti.', '1564321377', 1, 817, 80, 28, 21),
(818, 'Sit et ex explicabo.', '1564321377', 0, 818, 90, 31, 87),
(819, 'Quaerat aut nulla ipsum.', '1564321377', 1, 819, 163, 6, 62),
(820, 'Eius ut beatae et.', '1564321377', 0, 820, 197, 128, 170),
(821, 'Molestiae id rerum labore doloremque.', '1564321377', 1, 821, 79, 16, 160),
(822, 'Voluptate quia totam deserunt.', '1564321377', 0, 822, 23, 143, 187),
(823, 'Aspernatur animi sed.', '1564321377', 1, 823, 174, 60, 179),
(824, 'Iure ut.', '1564321377', 0, 824, 141, 178, 147),
(825, 'Suscipit et sit qui voluptatem voluptatibus.', '1564321377', 0, 825, 47, 175, 127),
(826, 'Quia non quaerat eaque.', '1564321377', 1, 826, 43, 136, 170),
(827, 'Harum tempore eius.', '1564321377', 0, 827, 134, 28, 178),
(828, 'Est velit totam.', '1564321377', 0, 828, 194, 27, 177),
(829, 'Temporibus laudantium maiores.', '1564321377', 1, 829, 192, 157, 59),
(830, 'Est omnis ut.', '1564321377', 1, 830, 40, 94, 152),
(831, 'Quia aut.', '1564321377', 0, 831, 59, 162, 82),
(832, 'Et ea qui labore.', '1564321377', 0, 832, 87, 143, 23),
(833, 'Aut ex incidunt.', '1564321377', 0, 833, 206, 160, 85),
(834, 'Odit enim.', '1564321377', 1, 834, 119, 17, 39),
(835, 'Eveniet non.', '1564321377', 0, 835, 132, 112, 198),
(836, 'Sit suscipit id expedita.', '1564321377', 1, 836, 94, 133, 177),
(837, 'Sit occaecati nam ullam.', '1564321377', 0, 837, 152, 140, 182),
(838, 'Non eos illum.', '1564321377', 1, 838, 123, 188, 86),
(839, 'Laudantium quisquam voluptatibus.', '1564321377', 1, 839, 87, 189, 95),
(840, 'Odit.', '1564321377', 1, 840, 85, 122, 100),
(841, 'Excepturi id.', '1564321377', 0, 841, 79, 200, 165),
(842, 'Iste.', '1564321377', 0, 842, 187, 92, 190),
(843, 'Modi et ad id accusantium.', '1564321377', 1, 843, 88, 85, 82),
(844, 'Quis hic ullam voluptas tempore.', '1564321377', 0, 844, 79, 124, 115),
(845, 'Quas et ipsam.', '1564321377', 1, 845, 167, 58, 102),
(846, 'Est.', '1564321377', 0, 846, 206, 82, 35),
(847, 'A odit enim voluptas ut.', '1564321377', 1, 847, 63, 96, 1),
(848, 'Labore.', '1564321377', 1, 848, 34, 99, 171),
(849, 'Et adipisci aut qui.', '1564321377', 0, 849, 179, 162, 58),
(850, 'Minus porro fugit.', '1564321377', 1, 850, 178, 132, 92),
(851, 'Aliquam in voluptate.', '1564321377', 1, 851, 115, 41, 31),
(852, 'Iure nulla.', '1564321377', 0, 852, 8, 20, 3),
(853, 'Est necessitatibus veritatis.', '1564321377', 1, 853, 27, 199, 203),
(854, 'Id dolore nobis dignissimos quia.', '1564321377', 1, 854, 181, 92, 125),
(855, 'Laboriosam mollitia impedit autem.', '1564321377', 0, 855, 48, 13, 58),
(856, 'Eligendi in voluptas est.', '1564321377', 1, 856, 97, 128, 111),
(857, 'Dolorum doloribus blanditiis.', '1564321377', 1, 857, 88, 174, 49),
(858, 'Delectus temporibus.', '1564321377', 0, 858, 161, 3, 145),
(859, 'Beatae possimus aspernatur suscipit.', '1564321377', 1, 859, 11, 48, 37),
(860, 'Minima tempora omnis iusto aliquid.', '1564321377', 0, 860, 115, 118, 118),
(861, 'Corporis aperiam.', '1564321377', 0, 861, 136, 143, 35),
(862, 'Dolorem sed incidunt et.', '1564321377', 1, 862, 130, 157, 100),
(863, 'Iste est qui in porro.', '1564321377', 1, 863, 140, 63, 2),
(864, 'Sed quo et.', '1564321377', 0, 864, 131, 202, 82),
(865, 'Veritatis atque.', '1564321377', 0, 865, 110, 44, 122),
(866, 'Et ut.', '1564321377', 1, 866, 142, 146, 178),
(867, 'Est.', '1564321377', 0, 867, 11, 135, 16),
(868, 'Aut laudantium corrupti et.', '1564321377', 0, 868, 27, 106, 37),
(869, 'Esse et quod.', '1564321377', 1, 869, 176, 96, 74),
(870, 'Debitis dicta.', '1564321377', 1, 870, 16, 187, 170),
(871, 'Ad qui.', '1564321377', 0, 871, 139, 58, 101),
(872, 'Iure eos autem.', '1564321377', 0, 872, 181, 148, 124),
(873, 'Pariatur est.', '1564321377', 0, 873, 169, 39, 143),
(874, 'Qui natus fugiat.', '1564321377', 0, 874, 83, 9, 108),
(875, 'Officiis.', '1564321377', 0, 875, 82, 31, 9),
(876, 'Nesciunt illo culpa.', '1564321377', 0, 876, 128, 177, 87),
(877, 'Debitis sapiente odio.', '1564321377', 1, 877, 157, 12, 173),
(878, 'Et.', '1564321377', 0, 878, 183, 62, 136),
(879, 'Aut repellendus corrupti dolores.', '1564321377', 1, 879, 94, 74, 200),
(880, 'Dolore cum doloribus.', '1564321377', 0, 880, 149, 164, 14),
(881, 'Sit aut.', '1564321377', 1, 881, 126, 43, 83),
(882, 'Blanditiis reprehenderit sit enim officia nihil.', '1564321377', 1, 882, 14, 11, 195),
(883, 'Aliquam possimus assumenda.', '1564321377', 1, 883, 31, 30, 188),
(884, 'Et.', '1564321377', 0, 884, 24, 87, 111),
(885, 'Ducimus deleniti unde.', '1564321377', 0, 885, 133, 162, 147),
(886, 'Cum sed voluptatibus.', '1564321378', 0, 886, 20, 31, 155),
(887, 'Suscipit dolorem recusandae neque et.', '1564321378', 1, 887, 198, 122, 60),
(888, 'In debitis possimus.', '1564321378', 0, 888, 36, 168, 163),
(889, 'Blanditiis id officiis.', '1564321378', 1, 889, 26, 107, 162),
(890, 'Et earum quia dignissimos enim exercitationem.', '1564321378', 1, 890, 191, 66, 10),
(891, 'Totam.', '1564321378', 0, 891, 204, 135, 187),
(892, 'Nesciunt sed in.', '1564321378', 0, 892, 55, 4, 178),
(893, 'Totam molestias ipsa nam quibusdam.', '1564321378', 1, 893, 59, 188, 21),
(894, 'Voluptas eveniet.', '1564321378', 0, 894, 90, 178, 82),
(895, 'Fuga eum aut.', '1564321378', 0, 895, 199, 29, 169),
(896, 'Pariatur consequatur.', '1564321378', 1, 896, 80, 27, 112),
(897, 'Aut ut quos.', '1564321378', 1, 897, 2, 154, 82),
(898, 'Nesciunt vero ab.', '1564321378', 0, 898, 164, 178, 140),
(899, 'Officia omnis.', '1564321378', 0, 899, 184, 21, 145),
(900, 'Asperiores laboriosam dolores.', '1564321378', 0, 900, 121, 8, 77),
(901, 'Ut hic sapiente nobis.', '1564321378', 0, 901, 69, 185, 193),
(902, 'Ex et.', '1564321378', 1, 902, 182, 187, 177),
(903, 'Consequatur.', '1564321378', 1, 903, 126, 182, 149),
(904, 'Et aut quod adipisci.', '1564321378', 1, 904, 99, 39, 179),
(905, 'Fugit vitae.', '1564321378', 0, 905, 202, 206, 109),
(906, 'Nulla.', '1564321378', 0, 906, 144, 45, 62),
(907, 'Fugiat culpa quia.', '1564321378', 0, 907, 92, 17, 180),
(908, 'Architecto non.', '1564321378', 0, 908, 84, 122, 63),
(909, 'Atque dolores.', '1564321378', 1, 909, 48, 104, 54),
(910, 'Magnam natus.', '1564321378', 1, 910, 95, 31, 138),
(911, 'Libero voluptatem incidunt.', '1564321378', 0, 911, 177, 33, 169),
(912, 'Ea possimus ut.', '1564321378', 1, 912, 185, 54, 178),
(913, 'Nostrum vitae aut.', '1564321378', 1, 913, 184, 122, 79),
(914, 'Sit ea molestiae vel.', '1564321378', 1, 914, 40, 68, 115),
(915, 'Nemo tempore sapiente.', '1564321378', 1, 915, 32, 13, 199),
(916, 'Soluta sit facere magni.', '1564321378', 0, 916, 65, 163, 77),
(917, 'Reprehenderit.', '1564321378', 0, 917, 10, 35, 131),
(918, 'In sint.', '1564321378', 1, 918, 190, 73, 97),
(919, 'Suscipit non optio.', '1564321378', 0, 919, 170, 181, 185),
(920, 'Repellendus voluptatem assumenda.', '1564321378', 1, 920, 18, 60, 65),
(921, 'Et esse nemo.', '1564321378', 0, 921, 82, 118, 57),
(922, 'Et eos.', '1564321378', 0, 922, 111, 23, 94),
(923, 'Sed.', '1564321378', 1, 923, 106, 141, 203),
(924, 'Voluptate quia.', '1564321378', 0, 924, 205, 71, 198),
(925, 'Tempora iste.', '1564321378', 1, 925, 112, 12, 64),
(926, 'Et ea quia consequatur ex ullam.', '1564321378', 0, 926, 53, 51, 48),
(927, 'Impedit reprehenderit nemo ut.', '1564321378', 1, 927, 109, 10, 169),
(928, 'Voluptatem facilis.', '1564321378', 1, 928, 142, 8, 12),
(929, 'Ipsa.', '1564321378', 0, 929, 123, 16, 121),
(930, 'Velit error quo quod.', '1564321378', 1, 930, 137, 105, 173),
(931, 'In sed laborum.', '1564321378', 1, 931, 83, 186, 158),
(932, 'Accusantium est.', '1564321378', 0, 932, 11, 45, 131),
(933, 'Provident cupiditate.', '1564321378', 0, 933, 157, 93, 131),
(934, 'Quo repellendus ducimus consectetur.', '1564321378', 0, 934, 196, 193, 201),
(935, 'Omnis excepturi.', '1564321378', 0, 935, 72, 34, 94),
(936, 'Cupiditate nostrum impedit.', '1564321378', 1, 936, 85, 131, 69),
(937, 'Dolores consectetur et consequuntur.', '1564321378', 1, 937, 96, 194, 44),
(938, 'Beatae saepe qui sit.', '1564321378', 0, 938, 27, 31, 197),
(939, 'Minima nesciunt delectus.', '1564321378', 1, 939, 159, 161, 179),
(940, 'Quos ut.', '1564321378', 0, 940, 89, 196, 112),
(941, 'Alias.', '1564321378', 0, 941, 1, 199, 156),
(942, 'Quaerat pariatur et.', '1564321378', 1, 942, 67, 17, 87),
(943, 'Consequuntur quaerat perspiciatis.', '1564321378', 1, 943, 42, 196, 50),
(944, 'Iure dolore.', '1564321378', 1, 944, 27, 98, 14),
(945, 'Doloremque eum rerum nobis id.', '1564321378', 0, 945, 76, 123, 1),
(946, 'Enim aut est.', '1564321378', 0, 946, 100, 63, 14),
(947, 'Nam aut.', '1564321378', 0, 947, 77, 34, 157),
(948, 'Odit.', '1564321378', 1, 948, 200, 27, 188),
(949, 'Eius.', '1564321378', 1, 949, 38, 89, 64),
(950, 'Hic omnis quam numquam aut.', '1564321378', 1, 950, 173, 205, 23),
(951, 'Non deserunt.', '1564321378', 1, 951, 51, 131, 14),
(952, 'Eos eos ipsa.', '1564321378', 0, 952, 30, 101, 104),
(953, 'Corrupti aut omnis modi rem corrupti.', '1564321378', 1, 953, 147, 129, 86),
(954, 'Repellendus aut perferendis.', '1564321379', 0, 954, 117, 183, 80),
(955, 'Accusamus odio eum et.', '1564321379', 0, 955, 100, 122, 168),
(956, 'Laudantium officia ex.', '1564321379', 0, 956, 13, 16, 45),
(957, 'A nulla non.', '1564321379', 1, 957, 162, 110, 179),
(958, 'Numquam cupiditate sed.', '1564321379', 1, 958, 205, 82, 164),
(959, 'Sed dignissimos.', '1564321379', 1, 959, 57, 201, 137),
(960, 'Aperiam sed.', '1564321379', 1, 960, 4, 5, 45),
(961, 'Et vitae et libero.', '1564321379', 0, 961, 122, 192, 201),
(962, 'Veniam fugiat.', '1564321379', 1, 962, 158, 168, 52),
(963, 'Inventore.', '1564321379', 0, 963, 1, 108, 32),
(964, 'Repellat iure.', '1564321379', 0, 964, 184, 144, 10),
(965, 'Voluptatum et et.', '1564321379', 0, 965, 51, 19, 181),
(966, 'Quia in.', '1564321379', 1, 966, 110, 22, 167),
(967, 'Nam.', '1564321379', 1, 967, 109, 6, 125),
(968, 'Rerum a neque.', '1564321379', 1, 968, 136, 142, 86),
(969, 'Dicta eos iste.', '1564321379', 0, 969, 29, 177, 14),
(970, 'Eius harum tempora.', '1564321379', 1, 970, 122, 145, 159),
(971, 'Sit ratione enim.', '1564321379', 0, 971, 202, 29, 93),
(972, 'Rem voluptatum vel in.', '1564321379', 0, 972, 1, 14, 180),
(973, 'Aliquam molestias consectetur.', '1564321379', 1, 973, 70, 41, 185),
(974, 'Sint et.', '1564321379', 0, 974, 4, 62, 116),
(975, 'Beatae voluptatem et.', '1564321379', 0, 975, 70, 86, 173),
(976, 'Consequatur perferendis voluptates.', '1564321379', 1, 976, 111, 101, 123),
(977, 'Sunt est veniam.', '1564321379', 0, 977, 79, 24, 41),
(978, 'Velit amet rem adipisci consequatur.', '1564321379', 1, 978, 67, 73, 12),
(979, 'Quos optio.', '1564321379', 0, 979, 82, 23, 37),
(980, 'Ut repellendus aut laboriosam et aut.', '1564321379', 1, 980, 22, 185, 5),
(981, 'Mollitia harum maiores.', '1564321379', 1, 981, 67, 138, 167),
(982, 'Ex eius impedit magnam voluptatibus.', '1564321379', 1, 982, 167, 6, 165),
(983, 'Et molestias.', '1564321379', 0, 983, 51, 24, 40),
(984, 'Eos voluptas tempora aperiam labore.', '1564321379', 0, 984, 24, 6, 185),
(985, 'Ea eligendi.', '1564321379', 0, 985, 95, 14, 191),
(986, 'Numquam veniam quisquam.', '1564321379', 1, 986, 140, 80, 73),
(987, 'Quasi nostrum facere.', '1564321379', 0, 987, 103, 113, 187),
(988, 'Tenetur voluptates culpa dolorem.', '1564321379', 1, 988, 201, 133, 71),
(989, 'Ad soluta sint enim iste.', '1564321379', 1, 989, 63, 21, 102),
(990, 'Vel rerum dolor nam.', '1564321379', 1, 990, 163, 134, 50),
(991, 'Similique eaque recusandae dolorem earum.', '1564321379', 1, 991, 27, 205, 93),
(992, 'Quam alias optio.', '1564321379', 1, 992, 151, 168, 143),
(993, 'Laudantium nostrum quibusdam repellendus.', '1564321379', 1, 993, 119, 3, 123),
(994, 'Inventore quo excepturi rerum accusantium.', '1564321379', 0, 994, 5, 60, 29),
(995, 'Dolore perferendis.', '1564321379', 0, 995, 31, 82, 193),
(996, 'Maxime.', '1564321379', 1, 996, 89, 129, 85),
(997, 'Alias sequi consequatur reprehenderit rem.', '1564321379', 1, 997, 139, 186, 63),
(998, 'Excepturi.', '1564321379', 1, 998, 192, 173, 77),
(999, 'Quia vel.', '1564321379', 1, 999, 62, 3, 68),
(1000, 'Sed aspernatur est explicabo.', '1564321379', 1, 1000, 4, 152, 6);

-- --------------------------------------------------------

--
-- Table structure for table `messages_list`
--

CREATE TABLE `messages_list` (
  `id` int(11) NOT NULL,
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
(1, 'Voluptas aut est optio.', '1564321359', 0, 0, 196, 56),
(2, 'Ex illo.', '1564321360', 0, 1, 23, 125),
(3, 'Explicabo.', '1564321360', 1, 1, 38, 201),
(4, 'Odit doloremque quis dolores.', '1564321360', 1, 1, 31, 137),
(5, 'Ut dolore dolorem.', '1564321360', 1, 1, 147, 32),
(6, 'Et.', '1564321360', 1, 1, 103, 77),
(7, 'Fuga.', '1564321360', 0, 0, 58, 41),
(8, 'In est.', '1564321360', 1, 1, 32, 47),
(9, 'Quasi illo et.', '1564321360', 1, 1, 159, 91),
(10, 'Perspiciatis vel aperiam.', '1564321360', 0, 1, 25, 81),
(11, 'Et eveniet quis.', '1564321360', 0, 0, 170, 177),
(12, 'Modi illum.', '1564321360', 0, 0, 150, 83),
(13, 'Suscipit ipsam saepe eos.', '1564321360', 0, 0, 172, 40),
(14, 'Iure occaecati ad.', '1564321360', 1, 1, 189, 6),
(15, 'Inventore non.', '1564321360', 0, 0, 134, 36),
(16, 'Et.', '1564321360', 0, 0, 26, 139),
(17, 'Quam.', '1564321360', 1, 0, 134, 101),
(18, 'Eveniet hic.', '1564321360', 1, 1, 107, 104),
(19, 'Laudantium sit architecto.', '1564321360', 0, 1, 187, 48),
(20, 'Qui eum quia.', '1564321360', 1, 1, 90, 48),
(21, 'Debitis dolor laboriosam.', '1564321360', 1, 0, 91, 55),
(22, 'Quas blanditiis in aliquam.', '1564321360', 0, 1, 169, 18),
(23, 'Id aspernatur asperiores.', '1564321360', 1, 1, 137, 87),
(24, 'Maxime magni laudantium cupiditate.', '1564321360', 0, 1, 59, 127),
(25, 'Minus sint voluptatibus.', '1564321360', 1, 1, 78, 19),
(26, 'Nihil nulla qui.', '1564321360', 0, 0, 53, 140),
(27, 'Minima rerum optio.', '1564321360', 1, 0, 80, 90),
(28, 'Possimus in mollitia.', '1564321360', 0, 1, 198, 191),
(29, 'At fugiat temporibus voluptatem.', '1564321360', 1, 0, 107, 9),
(30, 'Et tempore.', '1564321360', 1, 1, 73, 48),
(31, 'Suscipit.', '1564321360', 0, 1, 13, 168),
(32, 'Temporibus dolor deserunt.', '1564321360', 0, 0, 8, 57),
(33, 'Animi.', '1564321360', 1, 1, 17, 83),
(34, 'Alias debitis.', '1564321360', 0, 1, 158, 23),
(35, 'Excepturi quod officia aliquid.', '1564321360', 0, 0, 41, 108),
(36, 'Dolorem non modi accusamus.', '1564321361', 1, 1, 108, 135),
(37, 'Rerum consequatur a.', '1564321361', 1, 0, 152, 165),
(38, 'Ea exercitationem.', '1564321361', 1, 1, 153, 51),
(39, 'Dolores veritatis est voluptas.', '1564321361', 0, 0, 128, 133),
(40, 'Dolor.', '1564321361', 1, 0, 131, 202),
(41, 'Inventore.', '1564321361', 0, 0, 155, 80),
(42, 'Similique debitis qui.', '1564321361', 1, 1, 60, 192),
(43, 'Qui sed minus itaque.', '1564321361', 1, 0, 151, 148),
(44, 'Expedita tempore dolorem eum.', '1564321361', 0, 1, 129, 198),
(45, 'Voluptatem.', '1564321361', 1, 0, 182, 160),
(46, 'Earum.', '1564321361', 1, 1, 111, 142),
(47, 'Enim.', '1564321361', 0, 0, 185, 93),
(48, 'Dignissimos tempora vitae.', '1564321361', 1, 0, 115, 89),
(49, 'Labore.', '1564321361', 0, 0, 140, 137),
(50, 'Aspernatur molestias et.', '1564321361', 1, 0, 137, 88),
(51, 'Vel ex.', '1564321361', 1, 1, 22, 78),
(52, 'Quasi laudantium eum.', '1564321361', 1, 1, 57, 103),
(53, 'Eum ex illum dolorem omnis.', '1564321361', 0, 0, 127, 92),
(54, 'Eum est.', '1564321361', 0, 0, 120, 144),
(55, 'Quis possimus sit.', '1564321361', 1, 1, 35, 139),
(56, 'Et nihil odit.', '1564321361', 0, 1, 53, 135),
(57, 'Quas quas nulla.', '1564321361', 1, 1, 61, 110),
(58, 'Est.', '1564321362', 1, 0, 56, 189),
(59, 'Unde sed maiores similique est.', '1564321362', 0, 1, 194, 105),
(60, 'Impedit dolorem.', '1564321362', 0, 0, 57, 147),
(61, 'Eius praesentium qui.', '1564321362', 0, 0, 33, 7),
(62, 'Consequuntur nemo esse.', '1564321362', 1, 1, 74, 198),
(63, 'Quos expedita qui ipsum.', '1564321362', 1, 1, 39, 198),
(64, 'Perspiciatis nisi.', '1564321362', 0, 0, 2, 50),
(65, 'Maxime omnis sit delectus.', '1564321362', 0, 0, 73, 13),
(66, 'Molestiae.', '1564321362', 0, 1, 34, 107),
(67, 'Nisi placeat sapiente aliquam.', '1564321362', 1, 1, 84, 152),
(68, 'Sit consequatur error dignissimos.', '1564321362', 0, 1, 78, 124),
(69, 'Esse consequatur.', '1564321362', 0, 0, 166, 115),
(70, 'Debitis ut eveniet.', '1564321362', 1, 0, 96, 187),
(71, 'Quas illo.', '1564321362', 1, 0, 189, 183),
(72, 'Voluptate ipsa vero.', '1564321362', 0, 0, 199, 20),
(73, 'Temporibus enim.', '1564321362', 1, 1, 194, 27),
(74, 'Voluptatibus quod.', '1564321362', 0, 1, 45, 52),
(75, 'Facere itaque aut.', '1564321362', 0, 1, 205, 184),
(76, 'Aut et quas numquam.', '1564321362', 1, 1, 192, 51),
(77, 'Ullam.', '1564321362', 0, 0, 143, 187),
(78, 'Sed et quia facilis et.', '1564321362', 0, 1, 73, 64),
(79, 'Et.', '1564321362', 0, 1, 60, 168),
(80, 'Ipsum laborum.', '1564321362', 0, 0, 138, 155),
(81, 'Molestiae in vel rerum dicta.', '1564321362', 0, 1, 4, 136),
(82, 'Molestiae natus minima.', '1564321362', 0, 0, 152, 92),
(83, 'Doloribus iusto.', '1564321363', 1, 0, 6, 178),
(84, 'Et consequatur harum.', '1564321363', 1, 1, 84, 175),
(85, 'Animi veniam.', '1564321363', 1, 0, 139, 73),
(86, 'Ipsa similique.', '1564321363', 1, 1, 106, 171),
(87, 'Enim provident ea laboriosam.', '1564321363', 1, 1, 64, 151),
(88, 'Laudantium.', '1564321363', 1, 0, 190, 70),
(89, 'Quos qui sunt quam explicabo.', '1564321363', 1, 1, 194, 126),
(90, 'Architecto sunt quia totam.', '1564321363', 0, 0, 24, 113),
(91, 'Consequuntur sequi.', '1564321363', 1, 1, 114, 12),
(92, 'Vitae.', '1564321363', 0, 0, 190, 10),
(93, 'Sed in sit quas.', '1564321363', 1, 1, 82, 97),
(94, 'Qui vel facilis fuga.', '1564321363', 0, 0, 3, 42),
(95, 'Eos.', '1564321363', 1, 0, 4, 87),
(96, 'Ea natus praesentium.', '1564321363', 0, 0, 77, 30),
(97, 'Vel quia non.', '1564321363', 0, 1, 149, 139),
(98, 'Ut eum neque.', '1564321363', 0, 0, 28, 50),
(99, 'Laboriosam qui quisquam doloremque eos numquam.', '1564321363', 1, 1, 206, 40),
(100, 'Sapiente totam ullam.', '1564321363', 1, 1, 121, 10),
(101, 'Rerum nostrum distinctio.', '1564321363', 0, 0, 90, 87),
(102, 'Nemo.', '1564321363', 1, 0, 51, 82),
(103, 'Sint reprehenderit aut.', '1564321363', 0, 1, 161, 37),
(104, 'Dignissimos qui.', '1564321363', 0, 1, 151, 184),
(105, 'Dolorem qui maxime.', '1564321363', 0, 1, 23, 183),
(106, 'Quas eos architecto.', '1564321363', 1, 1, 125, 68),
(107, 'Veniam ratione qui error.', '1564321363', 1, 0, 122, 87),
(108, 'Tenetur ipsa blanditiis vel sapiente.', '1564321363', 0, 1, 106, 129),
(109, 'Veritatis quas.', '1564321363', 0, 0, 52, 32),
(110, 'Repellendus est pariatur quo.', '1564321363', 0, 1, 33, 84),
(111, 'Distinctio est qui enim.', '1564321363', 0, 1, 109, 106),
(112, 'Atque veniam est.', '1564321363', 0, 0, 73, 40),
(113, 'Minima esse.', '1564321363', 1, 0, 76, 185),
(114, 'Perferendis minus aspernatur praesentium.', '1564321363', 1, 1, 168, 186),
(115, 'Dolorem sunt error molestias.', '1564321363', 0, 0, 138, 163),
(116, 'Saepe optio ut quia.', '1564321364', 0, 0, 97, 3),
(117, 'Et.', '1564321364', 1, 0, 8, 23),
(118, 'Iusto sed temporibus.', '1564321364', 1, 0, 206, 55),
(119, 'Accusamus qui itaque.', '1564321364', 0, 0, 100, 4),
(120, 'Culpa accusantium non.', '1564321364', 0, 1, 42, 72),
(121, 'Quia neque et enim omnis sed.', '1564321364', 0, 0, 61, 34),
(122, 'Voluptatem ea error.', '1564321364', 0, 0, 73, 182),
(123, 'Deleniti consequuntur.', '1564321364', 1, 0, 200, 34),
(124, 'Ut nobis in autem vel qui.', '1564321364', 1, 1, 131, 40),
(125, 'Fugiat consectetur ut nemo.', '1564321364', 0, 1, 84, 186),
(126, 'Reiciendis velit impedit.', '1564321364', 1, 0, 75, 173),
(127, 'Tempora et excepturi et a.', '1564321364', 0, 1, 70, 111),
(128, 'Blanditiis quia blanditiis libero.', '1564321364', 0, 0, 127, 84),
(129, 'Voluptas illo est.', '1564321364', 0, 0, 74, 118),
(130, 'Consequatur.', '1564321364', 0, 1, 92, 36),
(131, 'Provident.', '1564321364', 1, 0, 24, 54),
(132, 'Id veniam.', '1564321364', 0, 0, 167, 84),
(133, 'Et.', '1564321364', 0, 0, 106, 198),
(134, 'Fugiat.', '1564321364', 1, 0, 40, 96),
(135, 'Quis qui laudantium.', '1564321364', 1, 1, 102, 43),
(136, 'Et quia vel.', '1564321364', 0, 1, 24, 7),
(137, 'Natus dolorem.', '1564321364', 1, 0, 48, 97),
(138, 'Harum dolores.', '1564321364', 1, 0, 42, 134),
(139, 'At sed eius molestiae.', '1564321364', 1, 1, 25, 5),
(140, 'Nisi a.', '1564321364', 1, 0, 116, 150),
(141, 'Iure occaecati et.', '1564321364', 1, 0, 187, 116),
(142, 'Vel et veritatis.', '1564321364', 1, 0, 36, 170),
(143, 'Qui.', '1564321364', 1, 1, 180, 77),
(144, 'Quidem.', '1564321364', 1, 1, 140, 88),
(145, 'Autem.', '1564321364', 1, 0, 56, 93),
(146, 'Velit eos.', '1564321364', 1, 0, 106, 68),
(147, 'Qui minus incidunt.', '1564321364', 0, 0, 101, 89),
(148, 'Illum est deleniti.', '1564321364', 0, 1, 12, 188),
(149, 'Perspiciatis harum perspiciatis.', '1564321364', 1, 0, 162, 54),
(150, 'Qui ducimus.', '1564321364', 1, 0, 76, 153),
(151, 'Consequatur quas.', '1564321364', 0, 1, 58, 129),
(152, 'Ipsam accusamus ut tempore.', '1564321364', 0, 1, 78, 140),
(153, 'Cumque tempora nemo eligendi.', '1564321364', 1, 1, 109, 164),
(154, 'Fuga enim.', '1564321364', 1, 1, 124, 41),
(155, 'Dicta minus.', '1564321364', 0, 0, 40, 113),
(156, 'Vero minima vel.', '1564321364', 1, 0, 190, 55),
(157, 'Accusamus porro.', '1564321364', 0, 0, 37, 129),
(158, 'Quidem accusantium voluptatem dignissimos.', '1564321364', 0, 0, 201, 30),
(159, 'Consequuntur et molestiae.', '1564321364', 0, 1, 73, 141),
(160, 'Qui nam.', '1564321364', 1, 0, 99, 172),
(161, 'Et sed.', '1564321364', 1, 1, 131, 41),
(162, 'Aut sed et aut.', '1564321364', 0, 1, 17, 21),
(163, 'Quo nihil molestiae.', '1564321364', 0, 1, 136, 116),
(164, 'Odio quod officia.', '1564321364', 0, 1, 194, 49),
(165, 'Consequuntur excepturi inventore.', '1564321364', 0, 0, 186, 80),
(166, 'Laboriosam quas deleniti ut.', '1564321364', 0, 0, 8, 80),
(167, 'Et et labore dolore voluptatem.', '1564321364', 0, 1, 187, 33),
(168, 'Autem dolor consequatur saepe.', '1564321364', 0, 0, 145, 114),
(169, 'Voluptatem dicta.', '1564321364', 0, 1, 177, 25),
(170, 'At eligendi veniam.', '1564321364', 1, 1, 137, 149),
(171, 'Minus enim eius.', '1564321364', 0, 1, 185, 61),
(172, 'Rerum maxime.', '1564321364', 1, 1, 3, 201),
(173, 'Et fugiat id.', '1564321364', 0, 0, 83, 9),
(174, 'Ut sit.', '1564321364', 1, 1, 137, 150),
(175, 'Accusantium nihil.', '1564321364', 1, 1, 113, 105),
(176, 'Quam illo rerum.', '1564321364', 1, 1, 164, 142),
(177, 'Aperiam sunt necessitatibus facilis enim commodi.', '1564321364', 1, 1, 112, 72),
(178, 'Maxime quo.', '1564321364', 1, 0, 1, 22),
(179, 'Animi laborum eaque.', '1564321364', 0, 0, 44, 50),
(180, 'Ex.', '1564321364', 1, 1, 153, 79),
(181, 'Sit omnis minus ea in ipsam.', '1564321364', 1, 1, 173, 149),
(182, 'Dolorum.', '1564321364', 0, 1, 162, 139),
(183, 'Itaque quod sit vel.', '1564321364', 0, 1, 123, 101),
(184, 'Molestiae perspiciatis.', '1564321364', 1, 1, 93, 146),
(185, 'Veniam unde molestias.', '1564321364', 1, 1, 82, 93),
(186, 'Quam sit sequi.', '1564321364', 0, 1, 95, 94),
(187, 'Iusto et.', '1564321364', 1, 0, 128, 171),
(188, 'Iusto commodi.', '1564321364', 1, 0, 174, 146),
(189, 'Soluta quasi aut.', '1564321364', 1, 0, 38, 33),
(190, 'Modi fugiat odit nemo laboriosam.', '1564321364', 0, 1, 152, 133),
(191, 'Officiis nihil laudantium.', '1564321364', 0, 1, 30, 59),
(192, 'Cupiditate.', '1564321364', 0, 0, 99, 175),
(193, 'Ullam deserunt quidem.', '1564321364', 0, 1, 174, 80),
(194, 'Dolore.', '1564321364', 1, 0, 127, 201),
(195, 'Voluptatem sed quam.', '1564321364', 1, 1, 48, 115),
(196, 'Aspernatur harum rem.', '1564321364', 0, 0, 93, 114),
(197, 'Ab.', '1564321364', 0, 0, 36, 36),
(198, 'Nihil deleniti corrupti quas.', '1564321364', 0, 0, 13, 188),
(199, 'Id doloremque.', '1564321364', 0, 1, 127, 186),
(200, 'Autem repudiandae.', '1564321364', 1, 1, 99, 173),
(201, 'Animi.', '1564321364', 1, 1, 157, 41),
(202, 'Aut suscipit.', '1564321364', 0, 0, 45, 109),
(203, 'Commodi eveniet.', '1564321365', 0, 0, 39, 65),
(204, 'Numquam eos.', '1564321365', 1, 1, 99, 17),
(205, 'Dolores quis aperiam error.', '1564321365', 1, 1, 107, 15),
(206, 'Consectetur aut officiis quia provident.', '1564321365', 1, 1, 24, 99),
(207, 'Sunt at.', '1564321365', 1, 1, 136, 131),
(208, 'Veritatis repellat.', '1564321365', 1, 1, 53, 22),
(209, 'Consequatur ut ut.', '1564321365', 1, 0, 204, 14),
(210, 'Possimus aliquam dolores nihil fugit.', '1564321365', 1, 1, 21, 136),
(211, 'Commodi cum.', '1564321365', 0, 1, 21, 20),
(212, 'Non et.', '1564321365', 1, 0, 134, 106),
(213, 'Sed doloribus eaque.', '1564321365', 0, 1, 4, 161),
(214, 'Non ducimus qui.', '1564321365', 1, 0, 67, 22),
(215, 'Possimus voluptatem.', '1564321365', 0, 1, 167, 116),
(216, 'Ut est velit.', '1564321365', 0, 1, 158, 112),
(217, 'Nulla qui laboriosam et.', '1564321365', 0, 0, 60, 80),
(218, 'Nemo eligendi id aut.', '1564321365', 0, 0, 54, 89),
(219, 'Dolorem et hic.', '1564321365', 0, 1, 107, 44),
(220, 'Enim tempora occaecati omnis.', '1564321365', 0, 0, 159, 187),
(221, 'Nihil quia incidunt.', '1564321365', 0, 0, 84, 100),
(222, 'Autem repellat accusantium.', '1564321365', 1, 0, 194, 133),
(223, 'Temporibus sed.', '1564321365', 0, 0, 28, 185),
(224, 'Rerum ipsum distinctio dolor et.', '1564321365', 1, 0, 134, 57),
(225, 'Accusantium modi.', '1564321365', 0, 1, 67, 189),
(226, 'Culpa.', '1564321365', 1, 0, 105, 42),
(227, 'Dolor.', '1564321365', 0, 1, 28, 96),
(228, 'Sapiente nesciunt.', '1564321365', 1, 0, 125, 174),
(229, 'Quia.', '1564321365', 0, 0, 113, 47),
(230, 'Ipsam eaque dolor nulla distinctio quia.', '1564321365', 0, 0, 57, 188),
(231, 'Fugit voluptatem aut.', '1564321365', 1, 0, 128, 92),
(232, 'Nulla.', '1564321365', 1, 0, 16, 112),
(233, 'Eum iste molestiae sed.', '1564321365', 1, 0, 112, 158),
(234, 'Rerum eaque.', '1564321365', 1, 0, 27, 28),
(235, 'Pariatur sint est.', '1564321365', 1, 0, 145, 47),
(236, 'Provident et.', '1564321365', 1, 1, 94, 156),
(237, 'Qui excepturi quam.', '1564321365', 0, 0, 31, 28),
(238, 'Et officiis aliquid.', '1564321365', 1, 0, 116, 177),
(239, 'Omnis.', '1564321365', 0, 0, 109, 18),
(240, 'Nemo dicta.', '1564321365', 0, 0, 106, 153),
(241, 'In amet dolorum beatae ullam.', '1564321365', 1, 0, 84, 69),
(242, 'Aspernatur culpa.', '1564321365', 0, 0, 149, 28),
(243, 'Itaque qui qui odit.', '1564321365', 0, 0, 155, 5),
(244, 'Ipsam aut.', '1564321365', 1, 1, 45, 17),
(245, 'Sunt qui totam.', '1564321365', 0, 1, 39, 81),
(246, 'Est accusamus.', '1564321365', 0, 0, 98, 16),
(247, 'Est nihil.', '1564321365', 1, 0, 123, 96),
(248, 'Assumenda ducimus voluptatem.', '1564321365', 0, 0, 66, 27),
(249, 'Quasi rerum.', '1564321365', 0, 0, 141, 150),
(250, 'Et dolores aut dolorem.', '1564321365', 0, 1, 198, 53),
(251, 'Quis et mollitia culpa.', '1564321365', 0, 0, 113, 190),
(252, 'Assumenda.', '1564321365', 0, 1, 60, 53),
(253, 'Cum perspiciatis nulla nam.', '1564321365', 1, 1, 153, 94),
(254, 'In.', '1564321365', 1, 0, 189, 168),
(255, 'Maxime.', '1564321365', 1, 1, 29, 203),
(256, 'Perferendis praesentium.', '1564321365', 1, 0, 1, 122),
(257, 'Consequatur alias omnis voluptatem.', '1564321365', 1, 1, 107, 93),
(258, 'Necessitatibus nobis et.', '1564321365', 1, 1, 33, 195),
(259, 'Quae ullam.', '1564321365', 1, 0, 164, 9),
(260, 'Deserunt.', '1564321365', 0, 0, 169, 85),
(261, 'Et corporis odit excepturi.', '1564321365', 0, 0, 131, 19),
(262, 'Explicabo ut id autem.', '1564321365', 0, 0, 146, 141),
(263, 'Sit non ipsam nostrum.', '1564321365', 0, 1, 169, 26),
(264, 'Non reiciendis.', '1564321365', 1, 1, 115, 121),
(265, 'Molestiae quod libero.', '1564321365', 1, 0, 76, 181),
(266, 'Et et iure ratione maiores vitae.', '1564321365', 0, 1, 1, 182),
(267, 'Et repellendus.', '1564321365', 0, 1, 160, 36),
(268, 'Ad sunt quam quae.', '1564321365', 1, 1, 36, 175),
(269, 'Eligendi sit amet.', '1564321365', 1, 0, 63, 107),
(270, 'Cum aut molestias.', '1564321365', 1, 0, 173, 85),
(271, 'Sunt rerum possimus.', '1564321365', 0, 1, 144, 100),
(272, 'Eum qui.', '1564321365', 0, 0, 98, 73),
(273, 'Reiciendis.', '1564321365', 1, 0, 106, 56),
(274, 'Sint et explicabo.', '1564321365', 0, 1, 49, 151),
(275, 'Voluptatibus delectus omnis expedita.', '1564321365', 0, 0, 140, 34),
(276, 'Voluptatem enim.', '1564321365', 1, 1, 22, 47),
(277, 'Voluptatem asperiores sequi numquam.', '1564321365', 0, 1, 151, 146),
(278, 'Aut.', '1564321365', 0, 1, 89, 50),
(279, 'Vero labore officiis.', '1564321365', 0, 0, 109, 122),
(280, 'Saepe cum ea.', '1564321365', 1, 1, 137, 193),
(281, 'Reiciendis similique nulla.', '1564321365', 1, 0, 6, 132),
(282, 'Saepe.', '1564321365', 1, 1, 102, 149),
(283, 'Illum.', '1564321365', 0, 0, 198, 63),
(284, 'Quia et non tempora enim impedit.', '1564321366', 0, 1, 79, 75),
(285, 'Eos.', '1564321366', 0, 1, 3, 28),
(286, 'Illo.', '1564321366', 0, 1, 125, 111),
(287, 'Sed.', '1564321366', 1, 0, 56, 82),
(288, 'Commodi amet voluptate rerum.', '1564321366', 1, 1, 114, 205),
(289, 'Amet eaque quibusdam voluptas.', '1564321366', 1, 1, 182, 129),
(290, 'Ut temporibus impedit.', '1564321366', 1, 1, 205, 160),
(291, 'Dicta soluta incidunt nulla.', '1564321366', 0, 0, 182, 159),
(292, 'Non corrupti provident.', '1564321366', 0, 0, 77, 9),
(293, 'Omnis iste qui deserunt harum.', '1564321366', 0, 0, 69, 90),
(294, 'Et.', '1564321366', 1, 0, 13, 160),
(295, 'Commodi eum modi culpa.', '1564321366', 0, 0, 139, 26),
(296, 'Eveniet velit ipsa.', '1564321366', 1, 0, 138, 199),
(297, 'Est sit.', '1564321366', 1, 0, 136, 85),
(298, 'Animi provident voluptates libero.', '1564321366', 0, 1, 125, 107),
(299, 'Suscipit.', '1564321366', 1, 1, 194, 137),
(300, 'Quibusdam et nobis iste voluptas similique.', '1564321366', 1, 1, 134, 35),
(301, 'Saepe aliquam sint.', '1564321366', 0, 0, 143, 1),
(302, 'Aperiam reprehenderit deserunt voluptas.', '1564321366', 0, 0, 59, 150),
(303, 'Eum consequatur facere.', '1564321366', 0, 1, 202, 134),
(304, 'Facilis enim nihil illo.', '1564321366', 1, 0, 146, 64),
(305, 'Mollitia.', '1564321366', 1, 0, 14, 91),
(306, 'Doloremque hic ipsa.', '1564321366', 1, 1, 191, 132),
(307, 'Expedita sit vitae.', '1564321366', 1, 0, 131, 77),
(308, 'Provident quibusdam velit cupiditate et.', '1564321366', 1, 0, 92, 47),
(309, 'Harum.', '1564321366', 0, 0, 177, 136),
(310, 'Vel ratione et et quae.', '1564321366', 0, 1, 27, 107),
(311, 'Sed rerum repudiandae aperiam.', '1564321366', 1, 1, 147, 195),
(312, 'Sed soluta velit et.', '1564321366', 1, 0, 121, 188),
(313, 'Totam et.', '1564321366', 0, 0, 114, 119),
(314, 'Sunt eaque voluptatem.', '1564321366', 1, 1, 141, 111),
(315, 'Debitis magnam dignissimos.', '1564321366', 0, 1, 182, 5),
(316, 'Qui quaerat est quis.', '1564321366', 1, 0, 183, 136),
(317, 'Exercitationem aut.', '1564321366', 1, 1, 40, 8),
(318, 'Quod id sequi.', '1564321366', 0, 0, 101, 122),
(319, 'Est qui modi porro.', '1564321366', 1, 0, 107, 42),
(320, 'Sed enim consequatur perferendis et.', '1564321366', 0, 1, 162, 152),
(321, 'Voluptatum cumque.', '1564321366', 0, 1, 134, 131),
(322, 'Maiores aut.', '1564321366', 1, 1, 179, 148),
(323, 'Assumenda pariatur perspiciatis necessitatibus.', '1564321366', 0, 1, 21, 202),
(324, 'Architecto vero nulla.', '1564321366', 0, 1, 157, 69),
(325, 'Vitae voluptas quidem ea nihil.', '1564321366', 1, 0, 169, 66),
(326, 'Et exercitationem sit.', '1564321366', 1, 0, 176, 76),
(327, 'Magnam possimus.', '1564321366', 0, 1, 37, 110),
(328, 'Eos temporibus.', '1564321366', 1, 0, 20, 98),
(329, 'Fugiat.', '1564321366', 0, 0, 161, 72),
(330, 'Qui alias et voluptatem saepe reprehenderit.', '1564321366', 0, 1, 68, 114),
(331, 'Iure architecto nesciunt.', '1564321366', 0, 0, 115, 146),
(332, 'Facilis dolores consequatur exercitationem voluptates.', '1564321366', 0, 1, 192, 193),
(333, 'Est similique.', '1564321366', 1, 1, 162, 121),
(334, 'Velit quaerat dolore.', '1564321366', 0, 0, 20, 28),
(335, 'Mollitia ipsam velit.', '1564321366', 0, 1, 74, 147),
(336, 'Dolore natus consequatur.', '1564321366', 0, 0, 68, 82),
(337, 'Qui corporis distinctio aut enim.', '1564321366', 0, 1, 83, 128),
(338, 'Maxime earum ut aspernatur.', '1564321366', 0, 1, 191, 59),
(339, 'Sunt.', '1564321366', 1, 1, 93, 28),
(340, 'Error est qui laborum perferendis.', '1564321366', 0, 1, 51, 45),
(341, 'Ab in non voluptas quia.', '1564321366', 1, 0, 67, 32),
(342, 'Sed necessitatibus enim.', '1564321366', 0, 0, 159, 47),
(343, 'Omnis.', '1564321366', 0, 0, 120, 159),
(344, 'Et maxime mollitia.', '1564321366', 1, 1, 78, 4),
(345, 'Et officiis tempore.', '1564321366', 0, 0, 19, 156),
(346, 'Aspernatur autem nobis.', '1564321366', 0, 0, 151, 84),
(347, 'Deleniti deserunt nihil in.', '1564321366', 0, 1, 158, 200),
(348, 'Eius.', '1564321366', 1, 0, 11, 153),
(349, 'Est a.', '1564321366', 1, 0, 77, 188),
(350, 'Velit porro nostrum.', '1564321366', 0, 1, 142, 187),
(351, 'Incidunt ut sit odit.', '1564321366', 1, 1, 200, 10),
(352, 'Veritatis odio sint possimus beatae rerum.', '1564321366', 0, 1, 202, 193),
(353, 'Et voluptates minima quidem ut.', '1564321366', 0, 0, 199, 66),
(354, 'Modi.', '1564321366', 0, 1, 186, 63),
(355, 'Repudiandae vel consequatur aspernatur nihil.', '1564321366', 0, 1, 147, 35),
(356, 'Et at rerum quibusdam quia.', '1564321366', 1, 0, 76, 175),
(357, 'Et hic laborum ut.', '1564321366', 1, 1, 39, 16),
(358, 'Consequatur voluptatibus molestiae laudantium.', '1564321366', 0, 1, 102, 206),
(359, 'Est voluptatem recusandae quaerat.', '1564321366', 0, 0, 119, 106),
(360, 'Molestiae rerum dolorem natus.', '1564321366', 1, 1, 48, 109),
(361, 'Eos quaerat.', '1564321366', 0, 1, 152, 125),
(362, 'Modi est.', '1564321366', 0, 0, 17, 12),
(363, 'Quasi.', '1564321366', 0, 1, 99, 43),
(364, 'Alias.', '1564321366', 0, 0, 13, 26),
(365, 'Tempore laboriosam aperiam.', '1564321366', 1, 1, 179, 45),
(366, 'Ea tempora dicta consequuntur.', '1564321366', 0, 0, 161, 153),
(367, 'Eaque harum delectus consectetur est.', '1564321366', 0, 1, 118, 176),
(368, 'Fugiat et illo voluptatum sunt.', '1564321367', 0, 1, 76, 204),
(369, 'Quam.', '1564321367', 1, 1, 170, 111),
(370, 'Laboriosam laboriosam.', '1564321367', 0, 0, 84, 100),
(371, 'Ea.', '1564321367', 0, 1, 138, 123),
(372, 'Ab doloremque excepturi.', '1564321367', 1, 1, 98, 13),
(373, 'Ut asperiores.', '1564321367', 1, 0, 18, 5),
(374, 'Eius at eos.', '1564321367', 1, 0, 147, 40),
(375, 'Est ea est expedita.', '1564321367', 1, 1, 91, 29),
(376, 'Mollitia.', '1564321367', 0, 0, 150, 192),
(377, 'Consequuntur amet recusandae dolorem.', '1564321367', 0, 1, 203, 163),
(378, 'Laboriosam iure dolores.', '1564321367', 1, 1, 131, 56),
(379, 'Exercitationem in.', '1564321367', 0, 0, 27, 151),
(380, 'Omnis.', '1564321367', 1, 1, 159, 23),
(381, 'Et perferendis dolorem.', '1564321367', 0, 0, 136, 131),
(382, 'Molestiae molestiae mollitia.', '1564321367', 1, 0, 74, 83),
(383, 'Expedita omnis illo deleniti facilis odio.', '1564321367', 0, 1, 153, 45),
(384, 'Amet earum.', '1564321367', 1, 0, 206, 117),
(385, 'Sint numquam sunt molestiae animi vero.', '1564321367', 1, 1, 205, 11),
(386, 'Quia nulla ratione.', '1564321367', 0, 0, 18, 95),
(387, 'Officiis voluptatem.', '1564321367', 1, 0, 122, 30),
(388, 'Perspiciatis repellat in.', '1564321367', 0, 0, 156, 128),
(389, 'Est id non quia.', '1564321367', 1, 0, 113, 113),
(390, 'Error vitae deleniti quo occaecati.', '1564321367', 0, 1, 39, 121),
(391, 'Nam enim expedita et explicabo commodi.', '1564321367', 0, 1, 105, 46),
(392, 'Accusamus.', '1564321367', 1, 0, 202, 199),
(393, 'Quod qui nobis.', '1564321367', 1, 0, 170, 145),
(394, 'Voluptatum mollitia ut.', '1564321367', 0, 0, 1, 196),
(395, 'Neque est illum totam.', '1564321367', 0, 1, 83, 73),
(396, 'Aliquid consequuntur non et.', '1564321367', 1, 0, 60, 122),
(397, 'Ipsum.', '1564321367', 0, 1, 42, 153),
(398, 'Sint est recusandae voluptatem quas.', '1564321367', 1, 1, 122, 179),
(399, 'Voluptatem voluptas.', '1564321367', 0, 1, 83, 33),
(400, 'Dolor dolores est rerum.', '1564321367', 0, 0, 76, 135),
(401, 'Expedita laborum iste.', '1564321367', 1, 1, 161, 146),
(402, 'Voluptatum.', '1564321367', 1, 0, 156, 172),
(403, 'Ullam ad.', '1564321367', 1, 1, 115, 164),
(404, 'Quaerat.', '1564321367', 0, 0, 80, 83),
(405, 'Nostrum sed eum impedit sint porro.', '1564321367', 0, 0, 55, 93),
(406, 'Dolor a.', '1564321367', 1, 0, 143, 174),
(407, 'Assumenda consequuntur placeat.', '1564321367', 0, 1, 3, 77),
(408, 'Hic error perspiciatis reprehenderit reprehenderit.', '1564321367', 0, 0, 56, 193),
(409, 'Asperiores.', '1564321367', 0, 0, 38, 11),
(410, 'Et quo saepe magni voluptas.', '1564321367', 1, 1, 77, 151),
(411, 'Expedita deserunt voluptate commodi.', '1564321367', 0, 0, 183, 58),
(412, 'Asperiores quasi id.', '1564321367', 0, 0, 205, 166),
(413, 'Asperiores minus corrupti repudiandae.', '1564321367', 0, 1, 22, 48),
(414, 'Quos quo.', '1564321367', 0, 0, 28, 39),
(415, 'Blanditiis illum dolorum commodi unde qui.', '1564321367', 1, 0, 194, 122),
(416, 'Earum impedit similique odit ut.', '1564321367', 1, 0, 14, 80),
(417, 'Et consequuntur illo.', '1564321367', 0, 1, 165, 49),
(418, 'Id dolor sed odit quam.', '1564321367', 0, 0, 189, 79),
(419, 'Amet ea.', '1564321367', 0, 1, 137, 87),
(420, 'Incidunt recusandae.', '1564321367', 0, 0, 108, 187),
(421, 'Quisquam nam voluptate voluptatem alias velit.', '1564321367', 0, 0, 154, 204),
(422, 'Excepturi et.', '1564321367', 1, 1, 66, 29),
(423, 'Occaecati nemo dolore accusantium hic.', '1564321367', 1, 0, 159, 77),
(424, 'Et nulla a ut est quidem.', '1564321367', 0, 1, 149, 108),
(425, 'Et ea doloremque dolorem.', '1564321367', 1, 0, 103, 196),
(426, 'Voluptas.', '1564321367', 0, 1, 111, 113),
(427, 'Sit magnam.', '1564321367', 0, 0, 12, 134),
(428, 'Dolorum consectetur numquam impedit.', '1564321367', 0, 1, 10, 3),
(429, 'Totam omnis unde.', '1564321367', 1, 0, 92, 164),
(430, 'Consequatur quia amet fuga nemo.', '1564321367', 1, 1, 194, 125),
(431, 'Debitis nisi similique culpa occaecati.', '1564321367', 0, 1, 6, 90),
(432, 'Voluptates ducimus consequuntur eos.', '1564321367', 0, 0, 179, 95),
(433, 'Eaque tenetur dicta reprehenderit est.', '1564321367', 0, 0, 154, 134),
(434, 'Quis nulla enim tempore sed sint.', '1564321367', 1, 1, 125, 175),
(435, 'Quibusdam voluptas et et.', '1564321367', 1, 0, 181, 99),
(436, 'Doloremque blanditiis non.', '1564321367', 0, 1, 127, 206),
(437, 'Tenetur hic corrupti.', '1564321367', 0, 0, 206, 23),
(438, 'Incidunt magni qui consequatur.', '1564321367', 0, 0, 170, 196),
(439, 'Nemo.', '1564321367', 0, 0, 93, 184),
(440, 'Et repellat quae in aspernatur.', '1564321367', 0, 1, 202, 35),
(441, 'Fugit saepe nulla.', '1564321367', 0, 1, 15, 184),
(442, 'Molestiae qui sunt deserunt quisquam.', '1564321367', 1, 0, 177, 37),
(443, 'Non repellat voluptatem nam.', '1564321367', 1, 0, 198, 112),
(444, 'Repellendus ratione corporis id.', '1564321367', 1, 1, 185, 78),
(445, 'Rem itaque quis est deleniti.', '1564321367', 1, 1, 150, 49),
(446, 'Quod iusto.', '1564321368', 0, 1, 100, 48),
(447, 'Hic ratione.', '1564321368', 0, 0, 96, 101),
(448, 'Odio.', '1564321368', 0, 1, 64, 34),
(449, 'Quis perferendis qui.', '1564321368', 0, 0, 62, 126),
(450, 'Nihil autem.', '1564321368', 1, 0, 40, 70),
(451, 'Laborum quae.', '1564321368', 1, 0, 64, 144),
(452, 'Exercitationem.', '1564321368', 0, 0, 40, 182),
(453, 'Perferendis enim id.', '1564321368', 1, 1, 179, 8),
(454, 'Voluptatum non consequatur.', '1564321368', 0, 1, 80, 14),
(455, 'Debitis praesentium ab qui.', '1564321368', 0, 1, 94, 188),
(456, 'Adipisci incidunt itaque.', '1564321368', 1, 0, 33, 51),
(457, 'Suscipit suscipit numquam tempore.', '1564321368', 1, 0, 124, 166),
(458, 'Voluptatem ut saepe.', '1564321368', 0, 0, 85, 52),
(459, 'Ad sint laudantium.', '1564321368', 0, 0, 175, 142),
(460, 'Nulla et.', '1564321368', 1, 1, 11, 20),
(461, 'Ea debitis quo.', '1564321368', 0, 0, 23, 38),
(462, 'Doloribus non repellendus iure est sed.', '1564321368', 1, 1, 152, 54),
(463, 'Earum qui vel.', '1564321368', 0, 0, 59, 146),
(464, 'Labore voluptate.', '1564321368', 1, 0, 107, 30),
(465, 'Natus rerum eaque error sapiente ratione.', '1564321368', 1, 1, 202, 134),
(466, 'Consectetur repellat nihil aut id.', '1564321368', 1, 1, 152, 139),
(467, 'Aut libero.', '1564321368', 1, 0, 124, 63),
(468, 'Ut aut est deserunt soluta.', '1564321368', 1, 1, 179, 205),
(469, 'Ipsam.', '1564321368', 1, 1, 5, 42),
(470, 'Possimus omnis itaque.', '1564321368', 0, 1, 54, 83),
(471, 'Qui voluptate ad.', '1564321368', 1, 0, 81, 90),
(472, 'Dolor numquam.', '1564321368', 0, 0, 67, 133),
(473, 'Ex sed molestiae et corrupti.', '1564321368', 0, 1, 33, 144),
(474, 'Placeat architecto dolores eum.', '1564321368', 1, 0, 105, 118),
(475, 'Qui.', '1564321368', 1, 0, 199, 3),
(476, 'Veritatis voluptas accusamus voluptate incidunt.', '1564321368', 1, 0, 29, 116),
(477, 'Qui id est facere et explicabo.', '1564321368', 1, 0, 169, 45),
(478, 'Officia deleniti rerum.', '1564321368', 0, 0, 114, 117),
(479, 'Qui iure enim.', '1564321368', 0, 1, 111, 131),
(480, 'Quibusdam natus.', '1564321368', 0, 0, 117, 109),
(481, 'Quam id quos.', '1564321368', 0, 1, 29, 74),
(482, 'Similique facere.', '1564321368', 0, 1, 133, 122),
(483, 'Praesentium.', '1564321368', 1, 1, 155, 66),
(484, 'Voluptate cumque officiis ut.', '1564321368', 0, 1, 104, 167),
(485, 'Error rerum illum cupiditate mollitia.', '1564321368', 0, 0, 92, 177),
(486, 'Temporibus.', '1564321368', 0, 1, 166, 40),
(487, 'Dolorem nisi saepe.', '1564321368', 0, 1, 140, 156),
(488, 'Animi numquam rem.', '1564321368', 0, 0, 148, 72),
(489, 'Aut minima tempora.', '1564321368', 0, 0, 154, 132),
(490, 'Deserunt ut eos.', '1564321368', 0, 1, 69, 136),
(491, 'Nemo at est.', '1564321368', 1, 0, 5, 46),
(492, 'Ut sit.', '1564321368', 1, 1, 26, 93),
(493, 'Qui quis.', '1564321368', 0, 0, 125, 103),
(494, 'Ad dolores veniam.', '1564321368', 0, 1, 44, 15),
(495, 'Voluptas et odit pariatur in.', '1564321368', 1, 0, 93, 69),
(496, 'Eos.', '1564321368', 0, 1, 48, 148),
(497, 'Sint aperiam eum amet corrupti.', '1564321368', 1, 0, 54, 12),
(498, 'Repellendus aut.', '1564321368', 1, 1, 128, 86),
(499, 'Harum.', '1564321368', 0, 0, 152, 10),
(500, 'Voluptatibus ut sit aut.', '1564321368', 1, 0, 76, 56),
(501, 'Ipsum beatae vel.', '1564321368', 0, 0, 100, 106),
(502, 'Fugiat et quidem.', '1564321368', 0, 1, 202, 137),
(503, 'Molestiae voluptatem totam non ut.', '1564321368', 0, 1, 80, 161),
(504, 'Est fugit.', '1564321368', 0, 1, 173, 56),
(505, 'Autem rerum sed.', '1564321368', 0, 1, 97, 28),
(506, 'Ea expedita et possimus.', '1564321368', 1, 1, 129, 184),
(507, 'Quaerat et culpa officia.', '1564321368', 0, 0, 116, 51),
(508, 'Quia suscipit itaque non est.', '1564321368', 0, 0, 25, 63),
(509, 'Quas quibusdam harum et ipsam.', '1564321368', 1, 0, 133, 12),
(510, 'Dolorem optio.', '1564321368', 1, 1, 6, 196),
(511, 'Quisquam sint dolores.', '1564321369', 0, 0, 104, 159),
(512, 'Vel consequuntur provident et.', '1564321369', 1, 0, 46, 144),
(513, 'Expedita est minus.', '1564321369', 1, 0, 145, 46),
(514, 'Doloremque dolor.', '1564321369', 1, 0, 94, 79),
(515, 'Pariatur accusantium omnis earum deleniti.', '1564321369', 1, 0, 122, 99),
(516, 'Dolorum molestiae modi.', '1564321369', 1, 0, 91, 195),
(517, 'Unde quia.', '1564321369', 0, 0, 118, 54),
(518, 'Iure.', '1564321369', 1, 1, 60, 119),
(519, 'Inventore reiciendis.', '1564321369', 1, 1, 168, 179),
(520, 'Dignissimos.', '1564321369', 0, 0, 37, 156),
(521, 'Doloribus dolore blanditiis.', '1564321369', 1, 1, 200, 42),
(522, 'Quod eveniet deserunt.', '1564321369', 0, 0, 97, 107),
(523, 'Quia rerum.', '1564321369', 1, 0, 25, 99),
(524, 'Praesentium ipsam ut tempore consequatur.', '1564321369', 1, 1, 138, 196),
(525, 'Deserunt quam nam et.', '1564321369', 0, 1, 197, 116),
(526, 'Nam sapiente.', '1564321369', 1, 0, 123, 91),
(527, 'Dolor.', '1564321369', 0, 1, 1, 33),
(528, 'Et.', '1564321369', 0, 0, 25, 188),
(529, 'Quos odit.', '1564321369', 0, 0, 155, 168),
(530, 'Eos aliquid accusantium.', '1564321369', 1, 0, 4, 98),
(531, 'Qui.', '1564321369', 1, 1, 42, 136),
(532, 'Deleniti velit quibusdam.', '1564321369', 0, 0, 75, 67),
(533, 'Beatae debitis eaque veniam.', '1564321369', 1, 1, 106, 116),
(534, 'Fuga minima nisi.', '1564321369', 0, 1, 32, 33),
(535, 'Est et eligendi voluptatem.', '1564321369', 1, 0, 166, 119),
(536, 'Consequatur.', '1564321369', 1, 1, 183, 44),
(537, 'Temporibus vel.', '1564321369', 0, 1, 81, 171),
(538, 'Odio veritatis dicta.', '1564321369', 1, 1, 196, 48),
(539, 'At quibusdam quasi voluptas sunt eum.', '1564321369', 1, 1, 80, 154),
(540, 'Aut.', '1564321369', 1, 1, 179, 116),
(541, 'Enim sed.', '1564321369', 1, 0, 138, 167),
(542, 'Distinctio nemo laborum deleniti.', '1564321369', 1, 0, 193, 201),
(543, 'Rerum dolore voluptatum distinctio.', '1564321369', 1, 0, 116, 154),
(544, 'Autem ut numquam.', '1564321369', 0, 1, 167, 202),
(545, 'Nemo quia consequuntur.', '1564321369', 0, 0, 177, 149),
(546, 'Vel.', '1564321369', 0, 0, 125, 134),
(547, 'Vel rerum distinctio.', '1564321369', 1, 0, 203, 18),
(548, 'Unde ad.', '1564321369', 0, 1, 100, 140),
(549, 'Rerum quod qui.', '1564321369', 1, 1, 23, 66),
(550, 'Odio expedita.', '1564321369', 0, 1, 124, 130),
(551, 'Sapiente molestiae et.', '1564321369', 0, 1, 127, 172),
(552, 'Consequatur veniam saepe dolor.', '1564321369', 1, 0, 63, 96),
(553, 'Aliquid quidem labore.', '1564321369', 1, 1, 206, 141),
(554, 'Tempora maxime placeat.', '1564321369', 0, 1, 176, 162),
(555, 'Quis et vitae.', '1564321369', 1, 1, 182, 203),
(556, 'Omnis animi aut quae.', '1564321369', 0, 1, 114, 87),
(557, 'In ad.', '1564321369', 0, 0, 149, 62),
(558, 'Qui.', '1564321369', 1, 0, 43, 90),
(559, 'Sint iure doloremque neque.', '1564321369', 0, 0, 51, 192),
(560, 'Omnis.', '1564321369', 1, 0, 47, 85),
(561, 'Natus fugit possimus et.', '1564321369', 1, 1, 192, 119),
(562, 'Doloremque quas consequatur dicta.', '1564321369', 0, 1, 93, 174),
(563, 'Vero distinctio.', '1564321369', 0, 1, 97, 162),
(564, 'Asperiores quis unde maxime fugiat iusto.', '1564321369', 1, 0, 35, 202),
(565, 'Rerum fugit.', '1564321369', 1, 1, 138, 167),
(566, 'Nam ut.', '1564321369', 0, 1, 120, 169),
(567, 'Aut eos.', '1564321369', 0, 1, 108, 56),
(568, 'Suscipit qui voluptatem recusandae voluptatem aliquid.', '1564321369', 0, 0, 70, 156),
(569, 'Vel quo.', '1564321369', 0, 1, 160, 117),
(570, 'Labore quidem.', '1564321369', 1, 0, 119, 109),
(571, 'Optio consequatur dolores.', '1564321369', 1, 0, 100, 189),
(572, 'Commodi nostrum qui aut est voluptates.', '1564321369', 1, 0, 122, 97),
(573, 'Amet qui ratione.', '1564321369', 1, 1, 177, 100),
(574, 'Illum cumque.', '1564321369', 1, 1, 135, 67),
(575, 'Dignissimos officiis nobis.', '1564321369', 1, 1, 191, 23),
(576, 'Excepturi voluptas modi quis hic.', '1564321369', 0, 0, 121, 120),
(577, 'Repellat.', '1564321369', 1, 1, 27, 70),
(578, 'Omnis incidunt.', '1564321370', 0, 0, 133, 46),
(579, 'Ab quis cum enim.', '1564321370', 0, 1, 148, 2),
(580, 'Provident nesciunt molestiae.', '1564321370', 1, 1, 137, 100),
(581, 'Ut enim ea.', '1564321370', 1, 1, 31, 153),
(582, 'Molestias molestiae labore fugiat.', '1564321370', 0, 1, 120, 106),
(583, 'Repudiandae enim nulla sed.', '1564321370', 1, 1, 173, 5),
(584, 'Explicabo quae.', '1564321370', 0, 1, 173, 11),
(585, 'Minima a.', '1564321370', 0, 0, 35, 114),
(586, 'Sint tempore.', '1564321370', 0, 0, 59, 141),
(587, 'Officia.', '1564321370', 1, 0, 162, 52),
(588, 'Dolores non qui voluptatem itaque fuga.', '1564321370', 0, 0, 135, 127),
(589, 'Natus vitae facilis.', '1564321370', 1, 0, 191, 111),
(590, 'Voluptatem sapiente perspiciatis aut omnis.', '1564321370', 0, 1, 175, 206),
(591, 'Voluptas sit assumenda.', '1564321370', 1, 1, 29, 177),
(592, 'Et distinctio aut.', '1564321370', 0, 1, 48, 163),
(593, 'Natus quia alias.', '1564321370', 0, 0, 122, 139),
(594, 'Non qui harum.', '1564321370', 0, 0, 85, 161),
(595, 'Sunt voluptates in.', '1564321370', 0, 0, 8, 136),
(596, 'At qui.', '1564321370', 0, 1, 192, 31),
(597, 'Praesentium.', '1564321370', 0, 0, 84, 137),
(598, 'Voluptates harum accusantium.', '1564321370', 1, 0, 50, 125),
(599, 'Et inventore corporis recusandae.', '1564321370', 0, 1, 44, 16),
(600, 'Quia qui ut.', '1564321370', 0, 0, 202, 59),
(601, 'Illum dolores.', '1564321370', 1, 1, 2, 129),
(602, 'Qui id facilis est neque.', '1564321370', 1, 1, 36, 102),
(603, 'Voluptas cumque occaecati voluptas.', '1564321370', 0, 1, 87, 127),
(604, 'Non.', '1564321370', 1, 0, 124, 35),
(605, 'Magni ducimus.', '1564321370', 0, 0, 22, 174),
(606, 'Consequatur.', '1564321370', 1, 1, 119, 36),
(607, 'Deleniti sed.', '1564321370', 0, 1, 119, 172),
(608, 'Sint illo et ab sapiente.', '1564321370', 0, 0, 146, 128),
(609, 'Minima vero.', '1564321370', 1, 0, 36, 85),
(610, 'Nobis et.', '1564321370', 1, 0, 190, 131),
(611, 'Impedit provident qui eaque.', '1564321370', 0, 0, 146, 165),
(612, 'Ea ut et excepturi.', '1564321370', 1, 1, 2, 11),
(613, 'Est nam tenetur.', '1564321370', 0, 1, 24, 198),
(614, 'Id.', '1564321370', 1, 0, 153, 135),
(615, 'Perspiciatis ea laborum autem amet.', '1564321370', 0, 1, 197, 117),
(616, 'Cumque at eum.', '1564321370', 1, 0, 75, 170),
(617, 'Delectus.', '1564321370', 1, 0, 136, 144),
(618, 'Animi provident voluptas expedita.', '1564321370', 0, 0, 123, 165),
(619, 'Natus dolorem sed.', '1564321370', 0, 0, 55, 8),
(620, 'Quia nostrum modi itaque.', '1564321371', 0, 0, 192, 66),
(621, 'Accusantium fugit.', '1564321371', 0, 1, 131, 196),
(622, 'Voluptatem fugiat.', '1564321371', 0, 0, 135, 150),
(623, 'Sit molestias.', '1564321371', 1, 0, 58, 66),
(624, 'Qui sit.', '1564321371', 1, 1, 183, 48),
(625, 'Quisquam qui aliquam.', '1564321371', 0, 1, 200, 68),
(626, 'Qui dignissimos.', '1564321371', 0, 1, 77, 76),
(627, 'Laborum nisi nam.', '1564321371', 1, 1, 134, 26),
(628, 'Praesentium qui sed.', '1564321371', 0, 0, 21, 85),
(629, 'Odio voluptatem.', '1564321371', 1, 0, 8, 80),
(630, 'Omnis illum.', '1564321371', 1, 1, 201, 188),
(631, 'Est aut ea ea voluptas.', '1564321371', 1, 0, 182, 174),
(632, 'Iure ipsa.', '1564321371', 1, 0, 93, 161),
(633, 'Ut nesciunt.', '1564321371', 1, 0, 187, 204),
(634, 'Ut.', '1564321371', 0, 1, 164, 201),
(635, 'Fuga asperiores maiores.', '1564321371', 0, 0, 58, 128),
(636, 'Hic officia.', '1564321371', 1, 0, 90, 164),
(637, 'Rerum qui illum non.', '1564321371', 1, 0, 69, 75),
(638, 'Reiciendis quos voluptatem illum.', '1564321371', 0, 1, 31, 106),
(639, 'Rem ea beatae porro.', '1564321371', 0, 0, 83, 99),
(640, 'Repudiandae ipsa quo voluptatibus vero.', '1564321371', 1, 1, 11, 28),
(641, 'Esse laboriosam dolores veritatis.', '1564321371', 1, 0, 17, 74),
(642, 'Cumque quod dolorum ut accusantium atque.', '1564321371', 1, 1, 97, 169),
(643, 'Quod ab quibusdam.', '1564321371', 0, 0, 44, 141),
(644, 'Perferendis eligendi repellendus.', '1564321371', 0, 0, 124, 66),
(645, 'Nihil aut architecto.', '1564321371', 1, 1, 194, 85),
(646, 'Neque.', '1564321371', 1, 1, 45, 196),
(647, 'Optio nihil.', '1564321372', 1, 1, 165, 198),
(648, 'Fuga ut ab.', '1564321372', 1, 1, 205, 45),
(649, 'Et reiciendis quo.', '1564321372', 1, 0, 155, 30),
(650, 'Eius dolor.', '1564321372', 1, 0, 125, 1),
(651, 'Eaque pariatur ad.', '1564321372', 1, 0, 129, 172),
(652, 'Dolores sint.', '1564321372', 0, 0, 159, 101),
(653, 'Autem.', '1564321372', 0, 1, 152, 184),
(654, 'Quia nihil magnam neque.', '1564321372', 1, 0, 60, 116),
(655, 'Sed optio.', '1564321372', 0, 1, 39, 44),
(656, 'Aut laudantium.', '1564321372', 0, 0, 55, 110),
(657, 'Deleniti odio.', '1564321372', 1, 1, 188, 149),
(658, 'Voluptatibus officiis.', '1564321372', 1, 1, 152, 206),
(659, 'Omnis.', '1564321372', 0, 1, 72, 171),
(660, 'Odit voluptatem.', '1564321372', 0, 0, 103, 6),
(661, 'Provident saepe aut voluptas.', '1564321372', 0, 0, 41, 43),
(662, 'Consequatur quis odio.', '1564321372', 0, 0, 103, 20),
(663, 'Quasi deleniti et.', '1564321372', 1, 1, 145, 118),
(664, 'Labore aut.', '1564321372', 1, 1, 95, 115),
(665, 'Qui accusantium.', '1564321372', 1, 0, 27, 146),
(666, 'Sunt voluptas.', '1564321372', 0, 1, 11, 170),
(667, 'Culpa labore rerum.', '1564321372', 1, 1, 21, 126),
(668, 'Aut illo.', '1564321372', 0, 1, 168, 144),
(669, 'Quidem cum ex distinctio reprehenderit sed.', '1564321372', 1, 1, 9, 194),
(670, 'Aut esse vitae.', '1564321372', 0, 0, 180, 139),
(671, 'Repellat.', '1564321372', 1, 0, 143, 153),
(672, 'Dignissimos a sint.', '1564321372', 1, 0, 30, 48),
(673, 'Ut sed eligendi ratione.', '1564321372', 1, 1, 95, 13),
(674, 'Quo ex corrupti qui voluptatem.', '1564321372', 1, 0, 20, 22),
(675, 'Voluptates ut occaecati.', '1564321372', 0, 0, 112, 126),
(676, 'Natus nam.', '1564321373', 0, 0, 135, 122),
(677, 'Cupiditate soluta nihil autem.', '1564321373', 0, 0, 62, 131),
(678, 'Dicta quo voluptas.', '1564321373', 0, 1, 10, 7),
(679, 'Voluptas at facere earum qui.', '1564321373', 1, 0, 58, 54),
(680, 'Quibusdam hic illum beatae sit cum.', '1564321373', 1, 0, 6, 177),
(681, 'Vitae.', '1564321373', 1, 1, 54, 44),
(682, 'Reprehenderit saepe tempore.', '1564321373', 1, 0, 23, 4),
(683, 'Ratione quis.', '1564321373', 0, 1, 126, 21),
(684, 'Quia occaecati sunt.', '1564321373', 1, 0, 72, 202),
(685, 'Et et.', '1564321373', 1, 0, 4, 67),
(686, 'Quisquam atque qui.', '1564321373', 0, 0, 101, 120),
(687, 'Delectus corporis.', '1564321373', 1, 1, 158, 113),
(688, 'Repellendus non.', '1564321373', 0, 1, 54, 199),
(689, 'Nulla et aspernatur quia incidunt.', '1564321373', 0, 1, 115, 40),
(690, 'Laborum necessitatibus dolore.', '1564321373', 1, 0, 72, 107),
(691, 'Culpa aut.', '1564321373', 0, 0, 38, 95),
(692, 'Voluptas.', '1564321373', 1, 1, 141, 205),
(693, 'Dolorum rerum sit beatae iure.', '1564321373', 0, 0, 135, 170),
(694, 'Iusto quis repellat.', '1564321373', 1, 1, 67, 155),
(695, 'Et mollitia quo.', '1564321373', 0, 1, 195, 52),
(696, 'Vero quis excepturi.', '1564321373', 0, 0, 176, 52),
(697, 'Aliquam tempore error ut odit veniam.', '1564321373', 0, 1, 7, 157),
(698, 'Iusto perspiciatis.', '1564321373', 0, 1, 46, 112),
(699, 'Est repellat.', '1564321373', 0, 0, 173, 126),
(700, 'Possimus beatae.', '1564321374', 1, 1, 197, 44),
(701, 'Earum voluptatem.', '1564321374', 1, 0, 152, 170),
(702, 'Assumenda dolor voluptas.', '1564321374', 0, 0, 194, 114),
(703, 'Repellat perferendis.', '1564321374', 0, 1, 142, 76),
(704, 'Nam eum vel debitis.', '1564321374', 0, 0, 59, 119),
(705, 'In consectetur.', '1564321374', 1, 0, 70, 76),
(706, 'Qui unde fuga nihil accusantium.', '1564321374', 1, 0, 14, 168),
(707, 'Corrupti nobis omnis.', '1564321374', 1, 1, 141, 165),
(708, 'Quasi quod ea.', '1564321374', 1, 0, 1, 37),
(709, 'Labore.', '1564321374', 0, 0, 12, 173),
(710, 'Sint possimus enim saepe.', '1564321374', 0, 1, 159, 46),
(711, 'Neque sunt eum ea.', '1564321374', 1, 0, 67, 143),
(712, 'Dolores consequatur.', '1564321374', 1, 0, 122, 183),
(713, 'Quo nobis excepturi minus molestias.', '1564321374', 0, 0, 149, 169),
(714, 'Qui labore.', '1564321374', 0, 0, 63, 132),
(715, 'Illo libero alias quo.', '1564321374', 1, 0, 143, 25),
(716, 'Et aut quia optio ipsam.', '1564321374', 0, 0, 87, 102),
(717, 'Asperiores quia et numquam nesciunt.', '1564321374', 0, 1, 21, 83),
(718, 'Ab et aliquid consequatur aliquid vitae.', '1564321374', 0, 1, 64, 152),
(719, 'Voluptatem.', '1564321374', 0, 0, 167, 132),
(720, 'Voluptas inventore iste.', '1564321374', 1, 1, 56, 136),
(721, 'At similique.', '1564321374', 1, 1, 123, 187),
(722, 'Nihil voluptatibus.', '1564321374', 1, 1, 61, 29),
(723, 'Praesentium illum.', '1564321374', 0, 1, 37, 180),
(724, 'Illo harum.', '1564321374', 1, 1, 28, 2),
(725, 'Reiciendis quo esse.', '1564321374', 0, 1, 16, 36),
(726, 'Numquam eius soluta.', '1564321374', 1, 0, 162, 40),
(727, 'Nulla natus nostrum.', '1564321374', 0, 1, 3, 110),
(728, 'Et optio.', '1564321375', 1, 1, 27, 102),
(729, 'Quia laborum.', '1564321375', 0, 0, 10, 149),
(730, 'Facilis qui.', '1564321375', 1, 1, 133, 65),
(731, 'Vel provident laborum.', '1564321375', 0, 1, 103, 72),
(732, 'Sed at exercitationem.', '1564321375', 0, 1, 10, 76),
(733, 'Et aliquam et.', '1564321375', 1, 1, 174, 84),
(734, 'Eaque nostrum quo voluptatem.', '1564321375', 1, 1, 51, 73),
(735, 'Aut nulla est.', '1564321375', 1, 0, 60, 199),
(736, 'Nesciunt qui.', '1564321375', 1, 1, 50, 50),
(737, 'Voluptatem velit.', '1564321375', 0, 1, 172, 26),
(738, 'Delectus in consequuntur animi aperiam.', '1564321375', 0, 0, 85, 49),
(739, 'Fugit voluptatibus quo quia ab.', '1564321375', 0, 1, 152, 130),
(740, 'Eveniet vero ut.', '1564321375', 1, 0, 120, 180),
(741, 'Quasi.', '1564321375', 0, 1, 74, 203),
(742, 'Voluptatum molestiae.', '1564321375', 0, 0, 8, 189),
(743, 'Est corporis cumque ipsa doloribus tenetur.', '1564321375', 0, 0, 21, 196),
(744, 'Iusto.', '1564321375', 1, 0, 2, 73),
(745, 'Quas ut sequi.', '1564321375', 0, 1, 32, 155),
(746, 'Qui.', '1564321375', 1, 0, 169, 200),
(747, 'Pariatur asperiores minus nihil.', '1564321375', 1, 1, 178, 16),
(748, 'Eum.', '1564321376', 0, 0, 106, 173),
(749, 'Ut et.', '1564321376', 0, 1, 204, 79),
(750, 'Perferendis optio voluptatibus at.', '1564321376', 0, 1, 88, 135),
(751, 'Incidunt quia.', '1564321376', 0, 1, 67, 176),
(752, 'Suscipit dolore.', '1564321376', 1, 0, 147, 44),
(753, 'Qui recusandae.', '1564321376', 1, 0, 163, 10),
(754, 'Eos repellat quod.', '1564321376', 0, 0, 144, 39),
(755, 'Repellendus qui soluta.', '1564321376', 0, 1, 11, 86),
(756, 'Consectetur ullam doloribus.', '1564321376', 1, 0, 152, 136),
(757, 'Sequi expedita.', '1564321376', 1, 1, 149, 1),
(758, 'Earum dolores autem ut.', '1564321376', 0, 1, 86, 155),
(759, 'Aut eligendi sed.', '1564321376', 1, 1, 110, 43),
(760, 'Labore neque.', '1564321376', 0, 0, 115, 1),
(761, 'Ad velit.', '1564321376', 0, 0, 131, 47),
(762, 'Modi est quia nam.', '1564321376', 1, 1, 191, 92),
(763, 'Aliquam quo.', '1564321376', 0, 1, 172, 18),
(764, 'Sit dolorem.', '1564321376', 0, 0, 143, 90),
(765, 'Animi voluptatum.', '1564321376', 0, 0, 71, 59),
(766, 'Qui officiis et placeat.', '1564321376', 1, 0, 4, 74),
(767, 'Ea.', '1564321376', 1, 1, 22, 181),
(768, 'Aut.', '1564321376', 1, 1, 71, 181),
(769, 'Ea facilis ab.', '1564321376', 0, 0, 86, 174),
(770, 'Nihil blanditiis quam sint voluptas.', '1564321376', 1, 0, 3, 202),
(771, 'Voluptatem illo et.', '1564321376', 0, 1, 117, 196),
(772, 'Sed totam.', '1564321376', 0, 1, 117, 98),
(773, 'Repudiandae labore commodi tenetur aut.', '1564321376', 1, 1, 185, 4),
(774, 'Saepe eum.', '1564321376', 1, 0, 100, 7),
(775, 'Provident minima ut temporibus officiis.', '1564321376', 0, 0, 43, 106),
(776, 'Dolor delectus rerum perspiciatis ipsam.', '1564321376', 1, 0, 146, 131),
(777, 'Nemo dolor.', '1564321376', 1, 0, 72, 85),
(778, 'Perspiciatis.', '1564321376', 1, 0, 159, 153),
(779, 'Possimus asperiores.', '1564321376', 0, 1, 70, 80),
(780, 'Aperiam unde.', '1564321376', 1, 0, 65, 144),
(781, 'Nostrum facilis.', '1564321376', 0, 1, 204, 157),
(782, 'Quasi deleniti delectus cupiditate molestiae.', '1564321376', 0, 1, 31, 39),
(783, 'Vel provident ex enim.', '1564321376', 1, 1, 44, 19),
(784, 'Totam omnis repellendus id at.', '1564321376', 0, 1, 100, 19),
(785, 'Aspernatur necessitatibus quia tempore est.', '1564321376', 1, 0, 66, 77),
(786, 'Qui.', '1564321376', 0, 0, 30, 85),
(787, 'Sit sint quo culpa.', '1564321376', 1, 1, 58, 13),
(788, 'Accusantium.', '1564321376', 1, 1, 110, 144),
(789, 'Quo dicta explicabo cumque.', '1564321376', 1, 1, 23, 79),
(790, 'Nulla ut amet aliquid.', '1564321376', 1, 0, 84, 18),
(791, 'Eaque repudiandae vero natus deleniti.', '1564321376', 0, 1, 99, 162),
(792, 'Dolor ab quam.', '1564321376', 0, 0, 67, 47),
(793, 'Aut debitis recusandae.', '1564321376', 0, 1, 79, 64),
(794, 'Nihil quia.', '1564321376', 1, 1, 141, 114),
(795, 'Suscipit veniam.', '1564321376', 1, 0, 58, 79),
(796, 'Fugit nemo.', '1564321376', 0, 1, 128, 129),
(797, 'Et est.', '1564321376', 0, 0, 150, 87),
(798, 'Nisi odio sit.', '1564321376', 1, 0, 13, 206),
(799, 'Quae possimus.', '1564321376', 0, 0, 169, 2),
(800, 'Aut officiis excepturi.', '1564321376', 1, 1, 47, 125),
(801, 'Sit.', '1564321376', 0, 1, 190, 202),
(802, 'Corporis dolor commodi.', '1564321376', 0, 0, 181, 86),
(803, 'Esse id beatae praesentium.', '1564321376', 1, 0, 156, 148),
(804, 'Incidunt.', '1564321376', 0, 1, 200, 54),
(805, 'Enim.', '1564321376', 0, 1, 196, 148),
(806, 'Et dolorem quos perspiciatis.', '1564321376', 0, 1, 80, 94),
(807, 'Error sed.', '1564321376', 0, 1, 22, 126),
(808, 'Ad quod libero.', '1564321376', 1, 0, 152, 190),
(809, 'Molestiae deleniti aut blanditiis.', '1564321376', 1, 0, 8, 41),
(810, 'Ea qui et consequatur.', '1564321376', 1, 0, 200, 136),
(811, 'In tenetur.', '1564321376', 1, 0, 171, 80),
(812, 'Et maxime minus.', '1564321376', 1, 0, 130, 9),
(813, 'Suscipit corrupti in.', '1564321377', 1, 1, 23, 173),
(814, 'Fuga sequi id.', '1564321377', 0, 0, 159, 186),
(815, 'Officia error sit dolores.', '1564321377', 1, 0, 145, 19),
(816, 'Consequatur distinctio.', '1564321377', 1, 0, 97, 196),
(817, 'Ut autem aperiam.', '1564321377', 0, 1, 80, 21),
(818, 'Molestiae soluta omnis commodi aut.', '1564321377', 0, 0, 90, 87),
(819, 'Cum aperiam.', '1564321377', 1, 1, 163, 62),
(820, 'Velit sunt.', '1564321377', 0, 0, 197, 170),
(821, 'Vel cumque ad.', '1564321377', 1, 1, 79, 160),
(822, 'Non possimus.', '1564321377', 1, 0, 23, 187),
(823, 'Quia sunt.', '1564321377', 0, 1, 174, 179),
(824, 'Facilis commodi cumque neque.', '1564321377', 0, 0, 141, 147),
(825, 'Sit vel.', '1564321377', 0, 0, 47, 127),
(826, 'Ut et commodi.', '1564321377', 1, 1, 43, 170),
(827, 'Molestias atque.', '1564321377', 0, 0, 134, 178),
(828, 'Quis eaque et.', '1564321377', 0, 0, 194, 177),
(829, 'Dolorum.', '1564321377', 0, 1, 192, 59),
(830, 'Et aliquid.', '1564321377', 0, 1, 40, 152),
(831, 'Exercitationem animi.', '1564321377', 0, 0, 59, 82),
(832, 'Non.', '1564321377', 1, 0, 87, 23),
(833, 'Ea quisquam.', '1564321377', 1, 0, 206, 85),
(834, 'Enim quibusdam.', '1564321377', 1, 1, 119, 39),
(835, 'In nulla.', '1564321377', 1, 0, 132, 198),
(836, 'Mollitia sapiente debitis.', '1564321377', 0, 1, 94, 177),
(837, 'Molestias consectetur.', '1564321377', 1, 0, 152, 182),
(838, 'Quis repudiandae ut et.', '1564321377', 0, 1, 123, 86),
(839, 'Beatae occaecati asperiores.', '1564321377', 0, 1, 87, 95),
(840, 'Aut natus omnis qui ab.', '1564321377', 1, 1, 85, 100),
(841, 'Nemo.', '1564321377', 0, 0, 79, 165),
(842, 'Perferendis non facere ut.', '1564321377', 0, 0, 187, 190),
(843, 'Qui excepturi facere at.', '1564321377', 0, 1, 88, 82),
(844, 'Assumenda saepe est.', '1564321377', 0, 0, 79, 115),
(845, 'Rem eos.', '1564321377', 1, 1, 167, 102),
(846, 'Officia sed accusantium nihil nemo.', '1564321377', 0, 0, 206, 35),
(847, 'Nam optio aut.', '1564321377', 0, 1, 63, 1),
(848, 'Reiciendis non.', '1564321377', 0, 1, 34, 171),
(849, 'Ad rerum.', '1564321377', 1, 0, 179, 58),
(850, 'Mollitia sed eius nostrum.', '1564321377', 1, 1, 178, 92),
(851, 'Commodi iure.', '1564321377', 0, 1, 115, 31),
(852, 'Dolores saepe nihil qui.', '1564321377', 1, 0, 8, 3),
(853, 'Impedit libero hic numquam in autem.', '1564321377', 1, 1, 27, 203),
(854, 'Maiores quae eos quisquam non.', '1564321377', 1, 1, 181, 125),
(855, 'Qui sed ut provident excepturi.', '1564321377', 0, 0, 48, 58),
(856, 'Velit odit sunt mollitia.', '1564321377', 0, 1, 97, 111),
(857, 'Ea velit voluptatem saepe.', '1564321377', 1, 1, 88, 49),
(858, 'Voluptatem qui animi veniam.', '1564321377', 1, 0, 161, 145),
(859, 'Omnis.', '1564321377', 0, 1, 11, 37),
(860, 'Autem aliquam ullam.', '1564321377', 0, 0, 115, 118),
(861, 'Vero commodi.', '1564321377', 0, 0, 136, 35),
(862, 'Hic fugiat doloribus ut.', '1564321377', 0, 1, 130, 100),
(863, 'Id facere et.', '1564321377', 1, 1, 140, 2),
(864, 'Est odio dolores.', '1564321377', 0, 0, 131, 82),
(865, 'Ut.', '1564321377', 0, 0, 110, 122),
(866, 'Expedita.', '1564321377', 0, 1, 142, 178),
(867, 'Quidem libero.', '1564321377', 1, 0, 11, 16),
(868, 'Et minima corporis quos.', '1564321377', 1, 0, 27, 37);
INSERT INTO `messages_list` (`id`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`, `userId`, `toId`) VALUES
(869, 'Voluptatibus voluptatibus eum animi dicta.', '1564321377', 0, 1, 176, 74),
(870, 'Eaque rerum qui quo vero.', '1564321377', 1, 1, 16, 170),
(871, 'Facilis aut reprehenderit temporibus ut.', '1564321377', 1, 0, 139, 101),
(872, 'Voluptatibus quo.', '1564321377', 0, 0, 181, 124),
(873, 'Iusto sint.', '1564321377', 1, 0, 169, 143),
(874, 'Magni voluptas iusto consequatur.', '1564321377', 1, 0, 83, 108),
(875, 'Quia ab sint inventore illo.', '1564321377', 0, 0, 82, 9),
(876, 'Dignissimos autem.', '1564321377', 1, 0, 128, 87),
(877, 'Esse incidunt similique.', '1564321377', 0, 1, 157, 173),
(878, 'Et vel.', '1564321377', 0, 0, 183, 136),
(879, 'Architecto eius autem.', '1564321377', 0, 1, 94, 200),
(880, 'Eius ullam voluptatum eos laborum assumenda.', '1564321377', 1, 0, 149, 14),
(881, 'Facilis natus.', '1564321377', 1, 1, 126, 83),
(882, 'Doloribus voluptas reprehenderit porro similique consectetur.', '1564321377', 0, 1, 14, 195),
(883, 'Quaerat.', '1564321377', 1, 1, 31, 188),
(884, 'Accusamus sunt ullam.', '1564321377', 1, 0, 24, 111),
(885, 'Officiis itaque.', '1564321377', 1, 0, 133, 147),
(886, 'Ut reiciendis animi.', '1564321378', 0, 0, 20, 155),
(887, 'Sint soluta repellendus.', '1564321378', 0, 1, 198, 60),
(888, 'Quia ut.', '1564321378', 1, 0, 36, 163),
(889, 'In.', '1564321378', 0, 1, 26, 162),
(890, 'Ullam.', '1564321378', 0, 1, 191, 10),
(891, 'Error odio.', '1564321378', 1, 0, 204, 187),
(892, 'Sunt vel illum omnis corporis.', '1564321378', 0, 0, 55, 178),
(893, 'Libero maiores.', '1564321378', 1, 1, 59, 21),
(894, 'Est quia.', '1564321378', 0, 0, 90, 82),
(895, 'Velit ad.', '1564321378', 1, 0, 199, 169),
(896, 'Voluptas.', '1564321378', 1, 1, 80, 112),
(897, 'Molestiae animi nihil.', '1564321378', 0, 1, 2, 82),
(898, 'Eveniet.', '1564321378', 1, 0, 164, 140),
(899, 'Nulla libero eos sed.', '1564321378', 0, 0, 184, 145),
(900, 'Error inventore nam.', '1564321378', 0, 0, 121, 77),
(901, 'Officia nihil voluptas.', '1564321378', 0, 0, 69, 193),
(902, 'Et ut eligendi aliquid.', '1564321378', 0, 1, 182, 177),
(903, 'Inventore maiores.', '1564321378', 0, 1, 126, 149),
(904, 'Aut ut commodi.', '1564321378', 1, 1, 99, 179),
(905, 'Nostrum et voluptatem nesciunt.', '1564321378', 1, 0, 202, 109),
(906, 'Non.', '1564321378', 0, 0, 144, 62),
(907, 'Corporis.', '1564321378', 0, 0, 92, 180),
(908, 'Velit sequi cupiditate tempora.', '1564321378', 0, 0, 84, 63),
(909, 'Accusantium aut voluptatum omnis.', '1564321378', 0, 1, 48, 54),
(910, 'Est.', '1564321378', 1, 1, 95, 138),
(911, 'Nesciunt.', '1564321378', 0, 0, 177, 169),
(912, 'Voluptas libero.', '1564321378', 0, 1, 185, 178),
(913, 'Quas et neque.', '1564321378', 0, 1, 184, 79),
(914, 'Qui repudiandae est rerum commodi.', '1564321378', 1, 1, 40, 115),
(915, 'Totam excepturi ut eum qui.', '1564321378', 1, 1, 32, 199),
(916, 'Ratione perspiciatis.', '1564321378', 0, 0, 65, 77),
(917, 'Voluptas harum.', '1564321378', 0, 0, 10, 131),
(918, 'Voluptatibus blanditiis ut facere.', '1564321378', 1, 1, 190, 97),
(919, 'Et ut perspiciatis ullam.', '1564321378', 0, 0, 170, 185),
(920, 'Tempora id aut.', '1564321378', 1, 1, 18, 65),
(921, 'Qui esse qui quibusdam.', '1564321378', 1, 0, 82, 57),
(922, 'Et eum labore.', '1564321378', 0, 0, 111, 94),
(923, 'Qui nihil aut.', '1564321378', 1, 1, 106, 203),
(924, 'Consequatur doloribus et iste rerum.', '1564321378', 0, 0, 205, 198),
(925, 'Sit illum necessitatibus.', '1564321378', 1, 1, 112, 64),
(926, 'Quaerat neque ut qui possimus.', '1564321378', 1, 0, 53, 48),
(927, 'Expedita facere.', '1564321378', 0, 1, 109, 169),
(928, 'Qui vel placeat.', '1564321378', 1, 1, 142, 12),
(929, 'Veritatis deserunt eligendi.', '1564321378', 1, 0, 123, 121),
(930, 'Facilis temporibus cumque sint.', '1564321378', 0, 1, 137, 173),
(931, 'Et sed exercitationem.', '1564321378', 0, 1, 83, 158),
(932, 'Culpa quam ad explicabo illum.', '1564321378', 0, 0, 11, 131),
(933, 'Laudantium fugit tenetur corporis.', '1564321378', 1, 0, 157, 131),
(934, 'Doloribus voluptatem et quod.', '1564321378', 0, 0, 196, 201),
(935, 'Totam minus voluptas.', '1564321378', 1, 0, 72, 94),
(936, 'Dolore recusandae corrupti.', '1564321378', 0, 1, 85, 69),
(937, 'Qui sunt.', '1564321378', 0, 1, 96, 44),
(938, 'Natus consequatur.', '1564321378', 1, 0, 27, 197),
(939, 'Mollitia.', '1564321378', 0, 1, 159, 179),
(940, 'Possimus dolor.', '1564321378', 0, 0, 89, 112),
(941, 'Odio commodi et dolor unde.', '1564321378', 1, 0, 1, 156),
(942, 'Sunt eos culpa est voluptatum.', '1564321378', 1, 1, 67, 87),
(943, 'Sequi aut officia aut voluptatem.', '1564321378', 1, 1, 42, 50),
(944, 'In sit dolor pariatur in omnis.', '1564321378', 0, 1, 27, 14),
(945, 'Aperiam ut.', '1564321378', 0, 0, 76, 1),
(946, 'Fugit libero.', '1564321378', 1, 0, 100, 14),
(947, 'Ab alias labore enim.', '1564321378', 1, 0, 77, 157),
(948, 'Nesciunt expedita fuga.', '1564321378', 1, 1, 200, 188),
(949, 'Quae.', '1564321378', 1, 1, 38, 64),
(950, 'Vel.', '1564321378', 0, 1, 173, 23),
(951, 'Non dolor necessitatibus unde et.', '1564321378', 0, 1, 51, 14),
(952, 'Rerum eos velit.', '1564321378', 1, 0, 30, 104),
(953, 'Neque aliquid in qui beatae eos.', '1564321378', 1, 1, 147, 86),
(954, 'Placeat.', '1564321379', 1, 0, 117, 80),
(955, 'Commodi id necessitatibus fugit.', '1564321379', 1, 0, 100, 168),
(956, 'Voluptas esse odit.', '1564321379', 0, 0, 13, 45),
(957, 'Id sed cupiditate assumenda explicabo.', '1564321379', 1, 1, 162, 179),
(958, 'Expedita ut sunt.', '1564321379', 0, 1, 205, 164),
(959, 'Sit ea.', '1564321379', 1, 1, 57, 137),
(960, 'Laudantium.', '1564321379', 0, 1, 4, 45),
(961, 'Repellendus minima.', '1564321379', 1, 0, 122, 201),
(962, 'Et delectus laudantium.', '1564321379', 1, 1, 158, 52),
(963, 'Ex veniam totam qui incidunt.', '1564321379', 0, 0, 1, 32),
(964, 'Ipsum debitis veritatis aliquid.', '1564321379', 0, 0, 184, 10),
(965, 'Et nemo beatae aliquam.', '1564321379', 1, 0, 51, 181),
(966, 'Est repudiandae dolor in.', '1564321379', 1, 1, 110, 167),
(967, 'Vel provident.', '1564321379', 1, 1, 109, 125),
(968, 'Voluptatem nihil pariatur natus.', '1564321379', 0, 1, 136, 86),
(969, 'Quidem ab.', '1564321379', 1, 0, 29, 14),
(970, 'Odio dignissimos voluptas et.', '1564321379', 0, 1, 122, 159),
(971, 'Qui quis quasi.', '1564321379', 0, 0, 202, 93),
(972, 'Veritatis suscipit quidem.', '1564321379', 1, 0, 1, 180),
(973, 'Porro aspernatur ratione dolore sit.', '1564321379', 0, 1, 70, 185),
(974, 'Mollitia repudiandae sit.', '1564321379', 1, 0, 4, 116),
(975, 'Quo fuga.', '1564321379', 1, 0, 70, 173),
(976, 'Itaque corrupti.', '1564321379', 0, 1, 111, 123),
(977, 'Repellat fuga sed.', '1564321379', 0, 0, 79, 41),
(978, 'Aperiam nostrum quaerat.', '1564321379', 0, 1, 67, 12),
(979, 'Quae molestiae.', '1564321379', 0, 0, 82, 37),
(980, 'Maxime tenetur minus autem.', '1564321379', 0, 1, 22, 5),
(981, 'Sed consequatur neque dolorem illo.', '1564321379', 1, 1, 67, 167),
(982, 'Quisquam est.', '1564321379', 0, 1, 167, 165),
(983, 'Et.', '1564321379', 0, 0, 51, 40),
(984, 'Occaecati ex.', '1564321379', 0, 0, 24, 185),
(985, 'Esse eveniet.', '1564321379', 1, 0, 95, 191),
(986, 'Eum pariatur in.', '1564321379', 1, 1, 140, 73),
(987, 'Qui harum.', '1564321379', 1, 0, 103, 187),
(988, 'Dolorum.', '1564321379', 0, 1, 201, 71),
(989, 'Accusantium ea recusandae.', '1564321379', 1, 1, 63, 102),
(990, 'Error voluptate incidunt.', '1564321379', 1, 1, 163, 50),
(991, 'Magni ex et ut.', '1564321379', 0, 1, 27, 93),
(992, 'Veniam quisquam maxime.', '1564321379', 1, 1, 151, 143),
(993, 'Quos aut.', '1564321379', 0, 1, 119, 123),
(994, 'Ad dolor vel.', '1564321379', 0, 0, 5, 29),
(995, 'Temporibus labore.', '1564321379', 0, 0, 31, 193),
(996, 'Iusto non aperiam sequi in ut.', '1564321379', 0, 1, 89, 85),
(997, 'Ipsum a.', '1564321379', 0, 1, 139, 63),
(998, 'Ab.', '1564321379', 1, 1, 192, 77),
(999, 'Ut repellat quia.', '1564321379', 1, 1, 62, 68),
(1000, 'Repellendus harum.', '1564321379', 0, 1, 4, 6);

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

--
-- Dumping data for table `mob_notifications`
--

INSERT INTO `mob_notifications` (`id`, `notifTo`, `notifToIds`, `notifData`, `notifDate`, `notifSender`) VALUES
(1, 'Hilbert Kub', 'employees', 'Veritatis eaque voluptate deleniti est delectus.', 1564321357, 'Elizabeth Rippin'),
(2, 'Joshuah Dach', 'teachers', 'Neque a commodi perspiciatis eum omnis.', 1564321357, 'Prof. Adelia Hilpert'),
(3, 'Jazlyn Waters', 'parents', 'Praesentium ea qui ut similique cum.', 1564321357, 'Roselyn Maggio'),
(4, 'Mr. Arno Grimes IV', 'students', 'Autem porro atque libero qui delectus.', 1564321357, 'Esperanza Considine'),
(5, 'Mr. Ryley Hessel', 'parents', 'Ut voluptates libero ad voluptas dicta.', 1564321357, 'Miss Erna Bartoletti'),
(6, 'Mrs. Carmen McDermott V', 'teachers', 'Ut voluptas voluptas iste inventore velit quisquam.', 1564321357, 'Prof. Rashad Boyer'),
(7, 'Llewellyn O\'Connell', 'teachers', 'Reiciendis harum ut sed assumenda ut dolore vel.', 1564321357, 'Effie Pfeffer'),
(8, 'Jordane Sauer', 'employees', 'Modi sit est nobis explicabo ut aliquid qui labore aspernatur.', 1564321357, 'Dr. Brice Kuvalis Jr.'),
(9, 'Patricia Collins', 'teachers', 'Qui sunt aut sint accusamus corrupti illo aut corporis ad.', 1564321357, 'Ona Langworth'),
(10, 'Georgianna Waelchi', 'students', 'Modi sunt voluptas aut quo ut nesciunt iusto optio.', 1564321357, 'Prof. Odell Fisher'),
(11, 'Miss Kelsie Will III', 'students', 'Necessitatibus est asperiores voluptatem qui quia.', 1564321358, 'Dr. Nyasia Hartmann PhD'),
(12, 'Moises Fay', 'employees', 'Voluptate labore qui.', 1564321358, 'Mr. Gaylord Huels'),
(13, 'Dudley Gutkowski', 'employees', 'Voluptas modi doloremque dolore blanditiis.', 1564321358, 'Vena Bode'),
(14, 'Ms. Keara Kiehn', 'parents', 'Dolor vero cupiditate consequatur consectetur velit modi quas excepturi.', 1564321358, 'Maegan Schmeler I'),
(15, 'Sherwood Johns', 'students', 'Autem dolores quo ut occaecati minus animi.', 1564321358, 'Veda Prosacco'),
(16, 'Zack Goodwin', 'students', 'Voluptates aspernatur sit qui libero in quisquam.', 1564321358, 'Vivianne Nicolas MD'),
(17, 'Rebecca Runte', 'employees', 'Ratione omnis ea eaque.', 1564321358, 'Roberta Simonis'),
(18, 'Loy Nitzsche', 'teachers', 'Dolorum sed est deleniti quae quis culpa labore minima accusantium aut dolores.', 1564321358, 'Tessie Wuckert DVM'),
(19, 'Elody Pouros II', 'parents', 'Aut porro pariatur et id alias.', 1564321358, 'Dr. Bernard Buckridge Jr.'),
(20, 'Jaylon Reynolds', 'teachers', 'Pariatur dolore consequatur aperiam quas quia.', 1564321358, 'Rosie Shields'),
(21, 'Rachel Luettgen II', 'students', 'Molestiae laborum laborum omnis vitae qui rerum.', 1564321358, 'Prof. German Moore'),
(22, 'Amira Wintheiser', 'students', 'Modi sed provident quo.', 1564321358, 'Earnest Kling'),
(23, 'Dr. Bart Harris', 'parents', 'Harum et cupiditate at ut vel dolores voluptatem debitis.', 1564321358, 'Hilario Mueller'),
(24, 'Dr. Eino Krajcik II', 'students', 'Aspernatur aut et sed quidem.', 1564321358, 'Joelle Leannon'),
(25, 'Maryjane Muller', 'parents', 'Consequatur quis id libero et.', 1564321358, 'Carlos Schulist'),
(26, 'Mrs. Albertha Bauch PhD', 'parents', 'Sit non dignissimos voluptate aut temporibus.', 1564321358, 'Laury Smith II'),
(27, 'Lavada Haley Jr.', 'employees', 'Aperiam distinctio et blanditiis.', 1564321358, 'Keira Casper'),
(28, 'Antonetta Greenfelder', 'employees', 'Quo officiis voluptas dicta doloremque.', 1564321358, 'Prof. Lorine Cassin PhD'),
(29, 'Maxime Dibbert', 'employees', 'Sit qui quam voluptate aliquam et.', 1564321358, 'Miss Elyse Smitham'),
(30, 'Prof. Rowland Funk', 'students', 'Dolores modi tempore quis consequuntur.', 1564321358, 'Katelyn Murazik'),
(31, 'Everett Borer', 'employees', 'Quaerat earum quidem excepturi id quae hic voluptas dolore quia aut.', 1564321358, 'Mr. Clifford Kling DVM'),
(32, 'Alvena Mohr', 'parents', 'Itaque aspernatur vitae accusantium.', 1564321358, 'Ms. Eliza Christiansen DVM'),
(33, 'Prof. Simeon O\'Keefe', 'students', 'Non quo tempora unde fugiat incidunt.', 1564321358, 'Catharine Runolfsdottir Jr.'),
(34, 'Vernice Herzog I', 'students', 'Adipisci qui ex iste reprehenderit eaque voluptas ea.', 1564321358, 'Stacy Ritchie'),
(35, 'Magali Pollich', 'parents', 'Voluptatem possimus dicta placeat.', 1564321358, 'Philip Gerhold V'),
(36, 'Mary Beatty', 'parents', 'Architecto doloremque ipsam quasi reprehenderit.', 1564321358, 'Domenico Wilderman'),
(37, 'Kaci Kautzer PhD', 'teachers', 'Tenetur et voluptatem minus illum ex fuga eos.', 1564321358, 'Nico Zemlak'),
(38, 'Prof. Melyssa Okuneva', 'employees', 'Sed iure sit fuga quia.', 1564321358, 'Mr. Alex Kozey IV'),
(39, 'Beryl Botsford', 'employees', 'Magni est facilis aut provident incidunt illo rerum quaerat.', 1564321358, 'Caleb Ward'),
(40, 'Adolph Quitzon I', 'parents', 'Voluptas nihil ipsa nesciunt magnam.', 1564321358, 'Miss Brionna Dicki'),
(41, 'Dante Runolfsdottir I', 'students', 'Fugit ut earum exercitationem occaecati eligendi.', 1564321358, 'Gabe Waelchi'),
(42, 'Nettie Koelpin', 'employees', 'Ut accusantium veritatis omnis quis delectus et.', 1564321358, 'Antonio Conn'),
(43, 'Tommie Simonis', 'employees', 'Eveniet odit culpa placeat et qui enim.', 1564321358, 'Lindsay Heller'),
(44, 'Conrad Pfannerstill Jr.', 'teachers', 'Quia provident maxime rerum sequi.', 1564321358, 'Mrs. Mozelle Frami'),
(45, 'Adell Feil Jr.', 'students', 'Voluptas voluptate ex provident aut.', 1564321358, 'Prof. Jennings Abbott III'),
(46, 'Matilde King', 'employees', 'Quia consectetur ut dolores qui.', 1564321358, 'Pearlie Kirlin'),
(47, 'Cora Stark', 'students', 'Ratione ad repudiandae voluptate quaerat expedita.', 1564321358, 'Martine Wolff'),
(48, 'Jaeden Schiller DDS', 'students', 'Quia et ut officia.', 1564321358, 'Kathryne Brakus'),
(49, 'Burdette Pfannerstill', 'parents', 'Nostrum sapiente illo ducimus eum ab voluptas.', 1564321359, 'Ivy Dach'),
(50, 'Dr. Delfina McLaughlin', 'parents', 'Ut sequi nobis et ab at autem.', 1564321359, 'Ali Dicki');

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
(1, 'Id non autem.', 'Quidem laudantium iusto voluptas maiores veritatis sit ut corporis a quam consequatur voluptas.', 'students', 1564321350, '', 0, 1564321350),
(2, 'Fugit id doloremque saepe eos dolorum.', 'Quia aspernatur illo optio qui quos provident aspernatur quia dolores.', 'parents', 1564321350, '', 0, 1564321350),
(3, 'Ex ducimus.', 'Laborum dolorem est consectetur molestias consectetur.', 'parents', 1564321350, '', 1, 1564321350),
(4, 'Reprehenderit quidem quibusdam eligendi.', 'Eligendi saepe doloribus ut quasi tempora consequatur amet fuga officiis odit.', 'teacher', 1564321350, '', 0, 1564321350),
(5, 'Adipisci delectus et.', 'Velit architecto accusantium voluptas corrupti rem.', 'students', 1564321350, '', 1, 1564321350),
(6, 'Sint rem libero vel delectus.', 'Voluptatem sint labore aliquam qui harum quia.', 'parents', 1564321350, '', 0, 1564321350),
(7, 'Et laudantium nulla ex.', 'Minima labore sequi dolor asperiores nihil expedita.', 'students', 1564321350, '', 1, 1564321350),
(8, 'Et architecto doloremque.', 'Qui quae voluptatum in molestiae repellendus neque fuga ex est deleniti.', 'teacher', 1564321350, '', 0, 1564321350),
(9, 'Et alias odio nesciunt.', 'Quibusdam dolore blanditiis quis sequi quidem qui.', 'all', 1564321350, '', 1, 1564321350),
(10, 'Recusandae recusandae et.', 'Repellendus est est velit voluptatem esse nobis numquam.', 'students', 1564321350, '', 1, 1564321350),
(11, 'Consectetur sit harum voluptas.', 'Iusto sed quam non autem voluptatem voluptatibus molestiae ex ipsum vel inventore quia harum.', 'teacher', 1564321350, '', 1, 1564321350),
(12, 'Necessitatibus illo.', 'Nemo molestiae odio error dolorum quibusdam inventore cum mollitia ut est quae accusamus aut.', 'teacher', 1564321350, '', 0, 1564321350),
(13, 'Assumenda porro esse porro.', 'Ipsam suscipit architecto aliquid ut repellendus distinctio eos vel.', 'students', 1564321350, '', 1, 1564321350),
(14, 'Aliquid aut labore expedita.', 'Aperiam est voluptas sequi velit natus voluptas ducimus error.', 'parents', 1564321350, '', 1, 1564321350),
(15, 'Voluptas numquam asperiores.', 'Asperiores et ad molestiae cum et ducimus totam iure nihil vel.', 'parents', 1564321350, '', 1, 1564321350),
(16, 'Odio laboriosam recusandae.', 'Est omnis id neque corporis rerum consequatur aspernatur dolorem necessitatibus officia.', 'teacher', 1564321350, '', 0, 1564321350),
(17, 'Minus architecto consequatur.', 'Architecto numquam fugiat voluptatem autem similique enim autem quidem.', 'all', 1564321350, '', 0, 1564321350),
(18, 'Iure repellendus.', 'Est ipsum exercitationem sit at expedita aliquam.', 'all', 1564321350, '', 1, 1564321350),
(19, 'Culpa sed eaque eveniet eaque.', 'Corporis adipisci magnam harum ipsam.', 'students', 1564321350, '', 1, 1564321350),
(20, 'Expedita ut tempore vero voluptas.', 'Omnis magni voluptate quisquam a harum molestias omnis delectus sed cum.', 'parents', 1564321350, '', 0, 1564321350);

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
(1, 'attendance', 'Ut cupiditate veniam magnam.', 6, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(2, 'news', 'Optio placeat consequuntur.', 116, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(3, 'attendance', 'Et placeat pariatur velit.', 187, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(4, 'attendance', 'Autem aut dolores aliquam.', 86, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(5, 'message', 'Qui voluptatem in.', 88, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(6, 'attendance', 'Quia facere facere.', 8, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(7, 'message', 'Culpa voluptas veritatis placeat.', 104, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(8, 'message', 'Voluptatem quos veniam.', 80, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(9, 'attendance', 'A placeat esse voluptatibus.', 66, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(10, 'message', 'Vero modi tempora magni.', 170, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(11, 'attendance', 'Eius distinctio necessitatibus.', 31, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:00', '2019-07-28 11:43:00'),
(12, 'news', 'Omnis ipsam repudiandae cum.', 41, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(13, 'attendance', 'Nobis nihil.', 13, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(14, 'attendance', 'Magnam tenetur iure.', 27, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(15, 'news', 'Sint commodi tempore.', 166, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(16, 'attendance', 'Eaque tempora.', 37, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(17, 'news', 'Error quod.', 7, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(18, 'news', 'Enim laborum.', 84, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(19, 'message', 'Deserunt est repudiandae ut accusantium.', 60, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(20, 'news', 'Quaerat consectetur tenetur.', 172, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(21, 'message', 'Omnis ipsa illo est.', 158, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(22, 'message', 'Voluptatibus aliquid.', 26, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(23, 'news', 'Aperiam nostrum.', 129, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(24, 'news', 'Voluptatem iste.', 66, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(25, 'message', 'Vel corporis voluptatem.', 26, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(26, 'attendance', 'Cupiditate cupiditate temporibus sint.', 190, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(27, 'message', 'Quisquam sapiente.', 104, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(28, 'news', 'Libero aut voluptatem.', 16, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(29, 'news', 'Eos ullam necessitatibus sit.', 98, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(30, 'attendance', 'Dolor quia dolor.', 29, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(31, 'news', 'Est rerum odio.', 91, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(32, 'attendance', 'Eum excepturi molestiae dolorem.', 62, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(33, 'attendance', 'Ea qui rerum.', 160, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(34, 'attendance', 'Et harum.', 102, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(35, 'news', 'Est voluptatem eius.', 38, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(36, 'attendance', 'Maiores voluptatibus.', 74, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(37, 'message', 'In non.', 56, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(38, 'news', 'Recusandae consectetur sed.', 151, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(39, 'message', 'Qui voluptatum eum.', 28, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(40, 'news', 'Nulla quaerat aut.', 14, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(41, 'message', 'Dolores ut aliquam.', 89, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(42, 'news', 'Aut quos id.', 9, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(43, 'attendance', 'Repellendus qui dolores.', 16, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(44, 'message', 'Et perferendis sed quis.', 103, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:01', '2019-07-28 11:43:01'),
(45, 'news', 'Omnis veniam.', 114, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(46, 'news', 'Voluptate velit voluptatum iure voluptatem.', 72, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(47, 'message', 'Id perferendis distinctio.', 98, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(48, 'message', 'Illo minima.', 198, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(49, 'news', 'Iste harum dignissimos.', 155, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(50, 'attendance', 'Aliquid architecto rerum quia.', 108, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(51, 'news', 'Voluptatem nesciunt molestiae enim.', 143, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(52, 'message', 'Iusto recusandae neque quis.', 66, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(53, 'message', 'Quia atque porro.', 75, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(54, 'message', 'Id at quod.', 8, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(55, 'message', 'Distinctio illum esse suscipit.', 164, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(56, 'news', 'Fugiat rerum.', 64, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(57, 'attendance', 'Dolore voluptatibus ex ipsum.', 202, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(58, 'news', 'Voluptatibus ipsa voluptas possimus.', 85, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(59, 'news', 'Itaque delectus quo soluta.', 155, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(60, 'message', 'Dolorum inventore.', 147, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(61, 'message', 'Aliquam nihil soluta magni.', 92, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(62, 'news', 'Voluptate perferendis recusandae.', 94, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(63, 'news', 'Distinctio nihil quisquam.', 51, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(64, 'news', 'Omnis dolores quasi.', 110, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(65, 'attendance', 'In adipisci.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(66, 'attendance', 'Distinctio vel.', 1, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(67, 'news', 'Fugit deserunt autem esse.', 38, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(68, 'attendance', 'Eum omnis enim debitis.', 141, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(69, 'message', 'Impedit in voluptatem ad ea.', 183, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(70, 'message', 'Suscipit ullam corrupti.', 86, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(71, 'message', 'Sequi aliquid consequatur.', 166, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(72, 'message', 'Eos nulla quia.', 118, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(73, 'news', 'Atque ut.', 200, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(74, 'attendance', 'Similique dolorem molestias sunt.', 65, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(75, 'message', 'Repellat et.', 100, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:02', '2019-07-28 11:43:02'),
(76, 'attendance', 'Voluptatem atque rerum quis.', 29, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(77, 'news', 'Culpa enim minima.', 152, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(78, 'attendance', 'In maxime.', 17, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(79, 'attendance', 'Quis labore consequuntur ducimus.', 77, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(80, 'news', 'Quo corrupti accusamus.', 55, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(81, 'message', 'In blanditiis.', 146, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(82, 'news', 'Nemo a.', 169, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(83, 'news', 'Temporibus reprehenderit.', 71, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(84, 'news', 'Qui nihil.', 160, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(85, 'message', 'Laudantium sed voluptas harum.', 56, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(86, 'message', 'Quas placeat repellat quos.', 57, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(87, 'news', 'Sed dolorem.', 171, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(88, 'attendance', 'Doloribus est nulla.', 163, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(89, 'news', 'Ea perferendis.', 73, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(90, 'message', 'Illum reiciendis quasi.', 96, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(91, 'message', 'Ut excepturi sed.', 68, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(92, 'news', 'Est quos.', 200, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(93, 'attendance', 'Mollitia pariatur fuga.', 96, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(94, 'attendance', 'Autem dolorem rem.', 135, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(95, 'attendance', 'Neque magnam consequatur doloremque.', 189, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(96, 'message', 'Perspiciatis eum non vitae.', 60, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(97, 'news', 'Ea odio consequatur.', 128, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(98, 'message', 'Quae voluptatem a.', 62, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(99, 'news', 'Quisquam aut consequatur exercitationem quo.', 79, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(100, 'news', 'Non cum esse.', 160, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(101, 'attendance', 'Nam nesciunt atque.', 69, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(102, 'message', 'Rerum quibusdam.', 10, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(103, 'attendance', 'Eos quidem.', 51, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(104, 'news', 'Asperiores aperiam necessitatibus.', 86, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(105, 'message', 'Velit et laudantium aut.', 91, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:03', '2019-07-28 11:43:03'),
(106, 'attendance', 'In ipsam adipisci.', 127, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(107, 'news', 'Deserunt inventore velit.', 58, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(108, 'news', 'Velit molestiae.', 51, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(109, 'attendance', 'Accusantium eum.', 160, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(110, 'news', 'Ut eius.', 165, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(111, 'attendance', 'Ratione saepe quo.', 40, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(112, 'news', 'Rerum modi voluptas quas in.', 21, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(113, 'news', 'Dignissimos vitae vel.', 166, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(114, 'news', 'Voluptatem dignissimos sequi.', 180, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(115, 'news', 'Suscipit perspiciatis sed et.', 92, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(116, 'news', 'Necessitatibus aspernatur.', 78, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(117, 'attendance', 'Praesentium exercitationem harum labore ut.', 46, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(118, 'news', 'Voluptatem eum.', 160, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(119, 'attendance', 'Ullam occaecati.', 28, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(120, 'news', 'Sapiente ipsum.', 83, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(121, 'news', 'Dolorem voluptate.', 17, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(122, 'message', 'Neque quia eum quia.', 86, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(123, 'attendance', 'Sed molestias quidem.', 110, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(124, 'attendance', 'Autem illum non.', 33, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(125, 'message', 'Fugit facilis ut.', 23, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(126, 'message', 'Distinctio facere sequi eum.', 30, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(127, 'attendance', 'Modi qui nisi.', 36, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(128, 'news', 'Et eius.', 80, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(129, 'attendance', 'Ut minima pariatur.', 51, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(130, 'news', 'Quia quae.', 143, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(131, 'news', 'Dicta laborum.', 174, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(132, 'message', 'Voluptas aspernatur enim eius.', 158, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(133, 'news', 'Et id sed laudantium.', 23, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(134, 'attendance', 'Saepe qui voluptates non.', 125, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(135, 'message', 'Facilis pariatur quidem ut.', 204, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:04', '2019-07-28 11:43:04'),
(136, 'attendance', 'Ut temporibus aut.', 67, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(137, 'news', 'Nemo ut autem.', 85, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(138, 'message', 'Rem nemo.', 30, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(139, 'message', 'Error perferendis aut.', 154, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(140, 'attendance', 'Nemo error rem.', 49, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(141, 'attendance', 'Reprehenderit ipsa veniam.', 108, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(142, 'attendance', 'Atque impedit minus.', 18, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(143, 'news', 'Et illum et officia.', 203, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(144, 'news', 'Laboriosam labore blanditiis modi.', 192, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(145, 'news', 'Et enim enim.', 31, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(146, 'message', 'Harum aut pariatur.', 28, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(147, 'news', 'Hic expedita ut recusandae.', 14, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(148, 'news', 'Facilis qui voluptatum.', 85, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(149, 'message', 'Placeat aut.', 165, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(150, 'attendance', 'Aperiam dolorum animi ea.', 77, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(151, 'attendance', 'Rem doloremque in.', 177, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(152, 'news', 'Error neque earum ut.', 49, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(153, 'message', 'Eaque voluptatum aut.', 11, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(154, 'message', 'Consectetur ipsam deserunt.', 163, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(155, 'news', 'Tenetur ut qui.', 84, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(156, 'message', 'Eveniet accusantium maxime natus dicta.', 155, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(157, 'attendance', 'Eum ea et.', 183, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(158, 'message', 'Ut consectetur impedit.', 153, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(159, 'news', 'Qui suscipit.', 26, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(160, 'news', 'Aut sit quo.', 187, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(161, 'attendance', 'Aut maxime.', 107, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(162, 'message', 'Esse enim et ut.', 95, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(163, 'message', 'Ut quibusdam voluptas.', 44, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(164, 'attendance', 'Ea atque et.', 184, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(165, 'message', 'Sapiente aspernatur sed.', 91, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(166, 'message', 'Enim dolorum.', 139, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(167, 'message', 'Accusantium deleniti ullam.', 202, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(168, 'news', 'Omnis qui dolore.', 68, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(169, 'attendance', 'Error adipisci qui.', 128, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(170, 'attendance', 'Inventore omnis deleniti neque.', 196, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(171, 'attendance', 'Velit eligendi ad.', 188, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(172, 'attendance', 'Voluptatem ut deleniti at.', 11, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(173, 'attendance', 'Sint dolorem provident.', 22, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(174, 'attendance', 'Tempora voluptatem.', 112, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:05', '2019-07-28 11:43:05'),
(175, 'attendance', 'Repellat voluptas.', 42, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(176, 'message', 'Ut numquam.', 150, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(177, 'news', 'Ullam sit.', 173, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(178, 'attendance', 'Ducimus alias est.', 34, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(179, 'news', 'Quo sit nesciunt enim.', 189, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(180, 'news', 'Incidunt reprehenderit et voluptatem.', 125, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(181, 'news', 'Ipsa ut est.', 39, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(182, 'message', 'Quia veniam possimus.', 107, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(183, 'attendance', 'Tenetur sint est et laboriosam.', 79, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(184, 'news', 'Omnis fugit qui.', 85, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(185, 'news', 'Sequi dolor omnis velit.', 76, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(186, 'attendance', 'Omnis aspernatur reiciendis.', 114, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(187, 'attendance', 'Assumenda enim culpa.', 136, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(188, 'message', 'Non dolorum.', 151, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(189, 'message', 'Illum assumenda vitae voluptas.', 10, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(190, 'message', 'Dolor voluptas omnis.', 4, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(191, 'message', 'Dolor quo amet soluta.', 82, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(192, 'attendance', 'Voluptates nemo architecto ut beatae.', 57, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(193, 'message', 'Perspiciatis iure.', 164, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(194, 'message', 'Voluptatibus inventore quidem totam.', 95, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(195, 'news', 'Nihil perferendis ut.', 130, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(196, 'message', 'Qui aperiam illo eum.', 47, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(197, 'attendance', 'Facilis voluptatem omnis deserunt.', 3, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(198, 'attendance', 'Dolores natus dolor.', 29, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(199, 'news', 'Maiores repellat.', 90, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(200, 'message', 'Necessitatibus et.', 9, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(201, 'attendance', 'Fugiat et quod et harum.', 12, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(202, 'message', 'Et dolor quas.', 101, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(203, 'attendance', 'Odio quia.', 116, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(204, 'attendance', 'Mollitia sit aliquid.', 104, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(205, 'news', 'Assumenda dolores ullam explicabo.', 110, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(206, 'news', 'Nihil est nemo.', 196, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(207, 'message', 'Qui voluptatibus accusantium.', 64, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:06', '2019-07-28 11:43:06'),
(208, 'message', 'Quibusdam laborum.', 155, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(209, 'attendance', 'Fugit quos neque.', 197, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(210, 'message', 'Ratione qui harum quia.', 134, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(211, 'news', 'Facere quo porro.', 145, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(212, 'message', 'Perferendis quo asperiores.', 177, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(213, 'news', 'Dolore rerum est sit.', 17, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(214, 'message', 'Earum cupiditate sit.', 57, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(215, 'news', 'Autem vero est.', 66, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(216, 'attendance', 'Aperiam maiores inventore quisquam.', 19, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(217, 'news', 'Nihil odit magnam tempora.', 73, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(218, 'news', 'Dolorem minus alias adipisci commodi.', 181, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(219, 'news', 'Quo aliquam molestiae.', 175, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(220, 'attendance', 'Velit possimus nihil.', 57, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(221, 'message', 'Nulla facere quia.', 53, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(222, 'attendance', 'Qui minus quae.', 58, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(223, 'attendance', 'Reiciendis velit illum ex.', 104, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(224, 'attendance', 'Officiis eum.', 153, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(225, 'attendance', 'Eum alias occaecati neque.', 12, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(226, 'news', 'Veritatis magni.', 101, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(227, 'message', 'Exercitationem et quam.', 95, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(228, 'news', 'Ad et sint aspernatur.', 161, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(229, 'message', 'Occaecati saepe nostrum.', 74, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(230, 'message', 'Et ullam a amet.', 59, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(231, 'attendance', 'Quae inventore excepturi.', 85, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(232, 'attendance', 'Consequatur ipsam.', 30, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(233, 'message', 'Expedita et.', 29, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(234, 'news', 'Nesciunt excepturi.', 143, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(235, 'news', 'Delectus nulla minus ipsam.', 23, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(236, 'message', 'Iusto error et.', 152, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(237, 'attendance', 'Qui sed reprehenderit.', 149, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(238, 'news', 'Expedita autem aliquam.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:07', '2019-07-28 11:43:07'),
(239, 'attendance', 'Velit neque.', 182, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(240, 'attendance', 'Repellendus inventore.', 109, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(241, 'message', 'Et et.', 26, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(242, 'message', 'Sint et.', 108, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(243, 'attendance', 'Ad ea.', 188, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(244, 'attendance', 'Illo illum odit sit.', 34, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(245, 'news', 'Quae nihil.', 160, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(246, 'message', 'Nostrum et dolor recusandae.', 8, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(247, 'attendance', 'Sed ipsa velit.', 194, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(248, 'news', 'Est voluptatem similique.', 19, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(249, 'message', 'Tempore similique rem.', 203, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(250, 'message', 'Doloremque mollitia.', 204, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(251, 'attendance', 'Laboriosam cum ex.', 143, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(252, 'attendance', 'Earum hic veniam enim corrupti.', 94, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(253, 'news', 'Qui aliquid eaque.', 72, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(254, 'news', 'Ex natus rem.', 42, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(255, 'attendance', 'Quibusdam nobis.', 4, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(256, 'message', 'Et magni.', 95, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(257, 'attendance', 'Quis optio.', 146, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(258, 'attendance', 'Voluptas voluptas explicabo voluptatem architecto.', 25, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(259, 'message', 'Et aut incidunt.', 134, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(260, 'attendance', 'Sunt magni id ullam.', 55, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(261, 'message', 'A aut.', 69, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(262, 'message', 'Est qui.', 199, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(263, 'news', 'Consequatur aliquam.', 39, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(264, 'attendance', 'Suscipit dolor.', 85, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(265, 'news', 'Quisquam consequuntur fugit voluptas.', 48, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(266, 'attendance', 'Earum ad.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(267, 'attendance', 'Aspernatur aliquam blanditiis.', 27, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(268, 'message', 'Nihil ipsam.', 75, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(269, 'news', 'Repudiandae at et.', 140, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:08', '2019-07-28 11:43:08'),
(270, 'attendance', 'Quia velit temporibus natus.', 12, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(271, 'news', 'Facilis quaerat qui.', 109, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(272, 'news', 'Numquam incidunt odit expedita.', 55, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(273, 'message', 'Aliquid consectetur et.', 81, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(274, 'message', 'Libero vero.', 136, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(275, 'attendance', 'Enim veritatis explicabo.', 50, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(276, 'news', 'Consequuntur quia natus.', 139, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(277, 'attendance', 'Ut error.', 59, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(278, 'message', 'Esse eaque.', 2, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(279, 'news', 'Commodi quis labore.', 83, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(280, 'message', 'Cum placeat saepe.', 198, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(281, 'message', 'Eum voluptates est.', 158, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(282, 'attendance', 'Suscipit aliquam rem.', 155, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(283, 'message', 'Sit nesciunt soluta.', 68, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(284, 'attendance', 'Dolorem facere odio.', 51, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(285, 'attendance', 'Ut libero debitis molestiae.', 181, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(286, 'news', 'Autem aut.', 153, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(287, 'attendance', 'Doloribus fugiat aut.', 100, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(288, 'message', 'Unde similique provident ullam.', 109, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(289, 'news', 'Neque magni.', 17, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(290, 'attendance', 'Qui voluptatibus omnis harum.', 56, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(291, 'message', 'Rem et totam.', 188, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(292, 'attendance', 'Et ut alias.', 121, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(293, 'attendance', 'Aut asperiores dolor esse.', 167, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(294, 'message', 'Rerum nulla aut soluta.', 41, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:09', '2019-07-28 11:43:09'),
(295, 'attendance', 'Rerum sed earum.', 187, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:10', '2019-07-28 11:43:10'),
(296, 'news', 'Minima voluptatem et.', 198, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:10', '2019-07-28 11:43:10'),
(297, 'attendance', 'Impedit fuga qui consequuntur.', 155, '0000-00-00 00:00:00', 'news', NULL, '2019-07-28 11:43:10', '2019-07-28 11:43:10'),
(298, 'news', 'Doloremque minima neque.', 13, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:10', '2019-07-28 11:43:10'),
(299, 'message', 'Dolores enim.', 203, '0000-00-00 00:00:00', 'message', NULL, '2019-07-28 11:43:10', '2019-07-28 11:43:10'),
(300, 'message', 'Ea ducimus ipsam voluptatem.', 68, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-28 11:43:10', '2019-07-28 11:43:10');

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
(1, 'minima_672', 'Recusandae corrupti repellendus magnam ut consequatur id qui.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 830, 0, 26, 290, 0, 1563281409, 1564491009, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(2, 'ullam_112', 'Ullam qui nam fuga harum rem.', 153, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 610, 21, 0, 350, 1, 1563281410, 1564145410, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(3, 'tempora_483', 'Accusantium et magnam sed quae id reprehenderit aliquam ut et.', 109, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 900, 0, 14, 630, 0, 1563799810, 1564231810, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(4, 'saepe_394', NULL, 154, '[{\"title\":\"Library fee\",\"amount\":\"700\"}]', 370, 0, 0, 660, 0, 1563195010, 1564577410, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(5, 'velit_476', NULL, 118, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 540, 40, 0, 470, 0, 1563108610, 1565355010, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(6, 'occaecati_826', 'Ipsam adipisci amet dolorem voluptas quis voluptate saepe libero quaerat quos exercitationem.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 840, 0, 0, 390, 0, 1563540610, 1564145410, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(7, 'consectetur_563', 'Omnis nihil sed vel odio officia similique asperiores aliquid expedita nulla.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 90, 9, 45, 390, 1, 1563627010, 1564145410, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(8, 'et_195', 'Officia qui voluptatem labore porro ullam natus eius alias quam.', 152, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 990, 0, 21, 70, 1, 1563713410, 1564318210, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(9, 'blanditiis_739', NULL, 106, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 380, 0, 0, 310, 1, 1563454210, 1565614210, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(10, 'vero_215', NULL, 153, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 540, 0, 17, 430, 1, 1563627010, 1565355010, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(11, 'est_275', NULL, 115, '[{\"title\":\"Building fee\",\"amount\":\"300\"}]', 370, 1, 10, 120, 0, 1563367810, 1564145410, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(12, 'dolorem_102', NULL, 151, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 1000, 0, 0, 960, 1, 1563540610, 1564318210, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(13, 'ut_725', NULL, 125, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 850, 0, 0, 1000, 0, 1563799810, 1565700610, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(14, 'voluptatem_363', 'Inventore esse consequatur voluptas corporis cumque dolores omnis non ut deserunt hic.', 135, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 640, 50, 0, 250, 1, 1563799810, 1564318210, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(15, 'quaerat_583', 'Sequi corrupti nostrum vel et omnis laudantium dicta est.', 119, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 590, 11, 0, 600, 0, 1563713410, 1565614210, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(16, 'ut_806', 'Quidem ratione qui consectetur quia rerum ea commodi aperiam iure.', 148, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 530, 41, 21, 980, 0, 1563367810, 1564145410, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(17, 'sapiente_607', 'Sed quos quibusdam eius delectus cum sit.', 143, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 280, 6, 0, 530, 1, 1564145410, 1564750210, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(18, 'cumque_836', NULL, 153, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 380, 45, 8, 390, 1, 1563367810, 1564145410, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(19, 'laboriosam_489', NULL, 151, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 760, 0, 29, 60, 1, 1564145410, 1564836610, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(20, 'ipsum_690', NULL, 147, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 460, 9, 0, 880, 0, 1564059010, 1564145410, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(21, 'corrupti_674', NULL, 146, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 320, 0, 8, 480, 1, 1563367810, 1564231810, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(22, 'tempora_378', NULL, 154, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 970, 35, 0, 540, 0, 1563972610, 1565527810, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(23, 'modi_182', NULL, 107, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 250, 14, 42, 100, 0, 1563972610, 1564145410, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(24, 'quam_190', NULL, 151, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 860, 0, 43, 140, 0, 1563627010, 1564491010, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(25, 'molestiae_725', 'In commodi consectetur minus sit quas perferendis qui aspernatur sit distinctio nobis.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 850, 0, 0, 530, 1, 1563886210, 1565355010, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(26, 'soluta_644', NULL, 151, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 700, 5, 41, 450, 1, 1564059010, 1564145410, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(27, 'tempore_566', 'Delectus et deserunt consequuntur expedita ullam voluptas laborum harum eveniet aut.', 115, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 140, 0, 0, 310, 1, 1563195010, 1564231810, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(28, 'ipsa_197', 'Id sint nobis tempore est rerum voluptatem soluta sed doloribus ut.', 115, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 750, 1, 0, 630, 0, 1563972610, 1564231810, 1, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(29, 'aut_547', 'Excepturi qui quod officiis aliquam quia sequi excepturi animi in ut soluta.', 106, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 380, 0, 7, 940, 0, 1563108610, 1565268610, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(30, 'omnis_412', 'Quis ut nihil repellat alias quasi cupiditate repellendus et eaque fugit.', 107, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 450, 19, 0, 620, 0, 1563195010, 1565614210, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(31, 'et_996', NULL, 115, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 350, 0, 34, 340, 0, 1564145410, 1565182210, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(32, 'eum_970', 'Asperiores dicta doloribus qui facere nihil quo.', 147, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 50, 3, 0, 600, 1, 1563627010, 1564750210, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(33, 'asperiores_237', 'Soluta laudantium culpa omnis dolor accusamus error quidem nostrum doloribus consequuntur et.', 106, '[{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 690, 0, 13, 300, 1, 1563108610, 1564836610, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(34, 'dolor_284', NULL, 105, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 990, 0, 0, 160, 0, 1563799810, 1564145410, 1, NULL, NULL, 'Cheque', NULL, 0, '0'),
(35, 'rerum_777', NULL, 106, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 630, 0, 0, 930, 0, 1563540610, 1565268610, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(36, 'blanditiis_986', 'Dignissimos quo animi saepe aspernatur quae et ut.', 153, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 900, 0, 30, 800, 0, 1563799810, 1564318210, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(37, 'voluptatem_488', 'Repellat rerum neque tempora inventore porro.', 121, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 750, 17, 15, 290, 0, 1563454210, 1564145410, 1, NULL, NULL, 'Cheque', NULL, 0, '0'),
(38, 'delectus_446', NULL, 146, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 610, 43, 12, 680, 1, 1564059010, 1565527810, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(39, 'accusantium_429', 'Esse deserunt eum eius ex dolores nesciunt.', 151, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 790, 31, 37, 930, 0, 1563627010, 1564577410, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(40, 'ducimus_760', NULL, 115, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 530, 19, 46, 340, 0, 1563108610, 1564231810, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(41, 'aperiam_369', 'Natus doloribus illo voluptatem sed rerum qui dolor nam.', 111, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 630, 18, 0, 920, 0, 1563281410, 1564836610, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(42, 'vitae_347', 'Perspiciatis quis fugit deleniti quia rerum fugiat.', 114, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 370, 0, 27, 410, 0, 1563886210, 1564318210, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(43, 'iure_155', 'Atque placeat vero nisi voluptatem sit vel veniam.', 121, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 130, 33, 0, 830, 1, 1563799810, 1564145410, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(44, 'facilis_249', NULL, 112, '[{\"title\":\"Transport fee\",\"amount\":\"200\"}]', 920, 31, 0, 630, 0, 1563886210, 1564318210, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(45, 'aliquam_564', 'Et ut quasi ea labore minus.', 147, ']', 800, 11, 0, 390, 1, 1563540610, 1565095810, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(46, 'fuga_262', 'Quia iste illo aut nesciunt pariatur adipisci sit omnis consectetur voluptates.', 147, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 150, 0, 41, 340, 0, 1563799811, 1565441411, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(47, 'qui_577', NULL, 106, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 130, 15, 0, 550, 1, 1563713411, 1564663811, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(48, 'laboriosam_746', 'Voluptatem reprehenderit praesentium saepe sequi itaque eaque animi.', 153, '[{\"title\":\"Library fee\",\"amount\":\"700\"}]', 90, 0, 0, 850, 1, 1563540611, 1564836611, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(49, 'repellendus_219', 'Enim fuga tempore iste error nostrum modi commodi qui mollitia sed.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 150, 0, 0, 690, 1, 1564145411, 1564231811, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(50, 'ut_647', NULL, 143, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 60, 32, 0, 440, 0, 1563367811, 1564923011, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(51, 'inventore_499', 'Esse sed voluptatem delectus sit iure cumque aperiam sit est enim.', 111, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 740, 0, 21, 770, 1, 1563367811, 1564750211, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(52, 'molestiae_160', 'Minus id quo molestiae non et odit.', 119, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 110, 31, 27, 240, 0, 1564059011, 1564318211, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(53, 'consequatur_339', NULL, 147, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 110, 49, 0, 210, 1, 1564059011, 1564836611, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(54, 'est_622', NULL, 114, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 430, 38, 0, 340, 0, 1563540611, 1565095811, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(55, 'libero_592', 'Dicta molestiae quisquam eum possimus quia dolore.', 148, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 590, 36, 41, 170, 1, 1563713411, 1564923011, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(56, 'iusto_197', 'Et excepturi quia et eum qui.', 114, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 850, 0, 0, 140, 1, 1563799811, 1564318211, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(57, 'corrupti_107', NULL, 114, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 630, 0, 0, 300, 0, 1563799811, 1565268611, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(58, 'suscipit_624', 'Modi id facere sapiente aut debitis suscipit sit voluptatibus esse voluptatum.', 117, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 810, 0, 8, 520, 1, 1563454211, 1564663811, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(59, 'ea_428', NULL, 105, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 630, 0, 12, 870, 1, 1563367811, 1564231811, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(60, 'rem_136', NULL, 121, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 180, 16, 0, 860, 0, 1563886211, 1564577411, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(61, 'ducimus_659', 'Quia fugit earum ipsum minus sed harum consequuntur labore voluptas.', 115, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 980, 0, 0, 380, 0, 1563713411, 1565009411, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(62, 'et_606', 'Illo quae consequatur inventore molestias impedit.', 115, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 990, 34, 9, 460, 1, 1563281411, 1564923011, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(63, 'ipsa_472', 'Sed enim nemo quia nisi est qui quo ab nesciunt vitae.', 143, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 380, 23, 9, 340, 1, 1563108611, 1565095811, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(64, 'atque_820', 'Ex dolorum et a quo id.', 115, '[{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 780, 4, 14, 580, 0, 1563799811, 1565009411, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(65, 'excepturi_258', 'Eum officiis aperiam cupiditate laudantium corrupti illo.', 111, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 520, 4, 28, 940, 0, 1563540611, 1564318211, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(66, 'nostrum_551', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 250, 0, 0, 910, 1, 1563108611, 1565441411, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(67, 'id_193', 'Et aut voluptas eum sit fuga est quis.', 146, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 830, 2, 9, 180, 0, 1563972611, 1564663811, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(68, 'dolor_815', 'Occaecati velit harum aut voluptatum eum.', 147, '[{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 180, 0, 0, 310, 0, 1563886211, 1564318211, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(69, 'mollitia_316', 'Neque eveniet architecto molestiae provident.', 134, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 880, 7, 0, 150, 1, 1564059011, 1564318211, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(70, 'velit_380', NULL, 125, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 210, 0, 32, 530, 0, 1563540611, 1565441411, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(71, 'est_954', NULL, 105, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 820, 12, 45, 180, 1, 1564145411, 1564923011, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(72, 'maxime_412', 'Vel minus atque veniam sint fugiat non.', 107, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 170, 32, 0, 110, 1, 1563627011, 1565527811, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(73, 'quisquam_770', 'Quia voluptate iusto impedit numquam sequi quisquam.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 760, 9, 0, 340, 1, 1563799811, 1564145411, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(74, 'eaque_546', 'Sed magnam asperiores omnis eos quia doloribus impedit veritatis rem molestias.', 145, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 160, 0, 0, 950, 0, 1563454211, 1565614211, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(75, 'molestiae_634', 'Corrupti et harum est molestias corporis consequuntur.', 118, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 200, 49, 0, 370, 1, 1563108611, 1564923011, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(76, 'aliquid_239', 'Sit quia officiis deserunt minima dolores.', 121, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 740, 0, 0, 360, 1, 1563713411, 1564231811, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(77, 'necessitatibus_960', 'Dolore molestias et molestias facere est dolorem.', 152, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 190, 0, 40, 450, 0, 1563799811, 1564231811, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(78, 'quae_918', NULL, 153, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 550, 11, 0, 880, 0, 1563454211, 1564145411, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(79, 'est_211', NULL, 111, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 570, 27, 37, 740, 1, 1563886211, 1564663811, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(80, 'quo_242', NULL, 151, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 170, 0, 29, 980, 0, 1563713411, 1564750211, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(81, 'sit_599', 'Esse ut voluptatibus deserunt nulla voluptate voluptatem nihil labore natus omnis.', 148, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 390, 0, 0, 600, 0, 1563540611, 1565095811, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(82, 'labore_306', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 590, 0, 19, 840, 1, 1563886211, 1565355011, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(83, 'quae_417', NULL, 132, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 100, 6, 0, 290, 0, 1563281411, 1564577411, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(84, 'vel_345', NULL, 146, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 160, 0, 42, 850, 0, 1563281411, 1564577411, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(85, 'quibusdam_772', NULL, 123, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 850, 0, 44, 740, 0, 1563972611, 1564318211, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(86, 'eligendi_240', NULL, 125, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 110, 28, 44, 570, 1, 1563367811, 1564318211, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(87, 'nihil_487', 'Nihil est accusantium in rerum quae in beatae consequatur et nihil et.', 114, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 900, 0, 21, 990, 1, 1564145411, 1565527811, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(88, 'totam_145', NULL, 115, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 140, 46, 0, 140, 0, 1563972611, 1564318211, 1, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(89, 'odio_308', NULL, 152, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 800, 32, 39, 590, 1, 1563195012, 1564231812, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(90, 'et_824', NULL, 147, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 550, 42, 45, 360, 0, 1563454212, 1564145412, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(91, 'eum_624', 'Minus ut aut quos dolores dolor porro.', 148, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 60, 31, 0, 320, 1, 1563195012, 1565095812, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(92, 'necessitatibus_671', 'Et veniam a atque deleniti porro minus magni est quibusdam voluptates.', 152, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 1000, 44, 7, 930, 1, 1563713412, 1564663812, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(93, 'expedita_603', 'Modi voluptas explicabo tempora ut ut est recusandae.', 109, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 960, 0, 0, 290, 0, 1563972612, 1565527812, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(94, 'saepe_339', 'Soluta tenetur distinctio quas totam ipsam autem architecto.', 125, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 70, 26, 0, 760, 1, 1563454212, 1564663812, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(95, 'dolores_536', 'Asperiores sunt consectetur numquam officiis sint.', 143, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 610, 0, 17, 80, 0, 1563281412, 1564145412, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(96, 'atque_721', 'Sed atque quidem ut praesentium saepe nihil quia beatae ea fugit.', 106, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 440, 0, 10, 120, 1, 1563886212, 1564491012, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(97, 'maxime_784', 'Et expedita ullam ut aspernatur quia laboriosam vitae earum possimus.', 114, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 870, 0, 42, 990, 0, 1563972612, 1565355012, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(98, 'doloribus_673', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"}]', 410, 13, 24, 410, 0, 1563713412, 1564231812, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(99, 'nesciunt_751', 'Harum ipsum neque quod in qui eum molestiae.', 152, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 760, 0, 35, 680, 0, 1563540612, 1564231812, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(100, 'autem_900', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 160, 0, 36, 150, 1, 1563886212, 1564231812, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(101, 'ut_919', NULL, 151, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 810, 0, 0, 160, 0, 1563886212, 1564231812, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(102, 'sed_468', 'Nobis nihil ratione quos vitae hic minus numquam quidem quia.', 114, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 260, 39, 0, 210, 1, 1563195012, 1565355012, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(103, 'eum_860', NULL, 125, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 590, 30, 34, 840, 0, 1564145412, 1564318212, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(104, 'sit_326', NULL, 154, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 780, 0, 11, 840, 1, 1563886212, 1564231812, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(105, 'doloremque_687', 'Ipsa maiores debitis omnis praesentium animi delectus iusto.', 152, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 420, 12, 0, 990, 0, 1563972612, 1565268612, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(106, 'consequatur_536', 'Provident corrupti dolorem sint aut et in rerum molestiae culpa.', 152, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 540, 50, 12, 160, 0, 1563108612, 1564318212, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(107, 'expedita_541', NULL, 114, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 750, 42, 16, 130, 0, 1563367812, 1564491012, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(108, 'occaecati_722', NULL, 114, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 740, 28, 28, 580, 0, 1563195012, 1564231812, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(109, 'quo_499', 'Dolorem sed mollitia odio neque ratione.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 880, 16, 17, 180, 1, 1563454212, 1565355012, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(110, 'nobis_267', NULL, 121, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 570, 0, 50, 380, 1, 1563281412, 1565095812, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(111, 'ut_189', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 960, 35, 7, 340, 0, 1563540612, 1565355012, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(112, 'laborum_153', 'Ipsa eum eos est dicta dolorem incidunt dicta veritatis amet.', 121, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 70, 0, 0, 780, 0, 1563195012, 1564750212, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(113, 'aliquid_239', 'Consequatur et consequatur esse quos dolor.', 123, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 820, 13, 0, 530, 1, 1563886212, 1565700612, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(114, 'et_826', 'Temporibus et ut veniam maxime sit quam.', 125, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 390, 41, 21, 590, 1, 1563972612, 1564663812, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(115, 'sequi_188', 'Alias a eaque adipisci numquam necessitatibus perspiciatis omnis nobis reiciendis voluptas.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 500, 0, 36, 200, 0, 1563195012, 1565441412, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(116, 'qui_171', 'Sequi sequi doloribus aperiam molestiae sint repellat laudantium.', 122, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 870, 38, 0, 860, 0, 1563627012, 1564923012, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(117, 'sint_815', NULL, 133, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 900, 50, 42, 370, 1, 1563454212, 1564231812, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(118, 'ullam_237', NULL, 109, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 240, 0, 0, 800, 1, 1563367812, 1564577412, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(119, 'sed_259', NULL, 115, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 580, 28, 0, 890, 0, 1563195012, 1564231812, 1, NULL, NULL, 'Cheque', NULL, 0, '0'),
(120, 'repellat_432', 'Excepturi dolorum occaecati voluptatem corporis beatae eius et accusantium nostrum nam.', 107, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 680, 0, 0, 520, 1, 1563886212, 1564318212, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(121, 'dolor_103', 'Illum pariatur nam voluptatum cum porro est.', 146, ']', 50, 2, 0, 180, 1, 1563799812, 1564836612, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(122, 'quia_842', NULL, 114, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 200, 0, 0, 750, 1, 1563713412, 1564145412, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(123, 'atque_385', NULL, 154, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 150, 0, 28, 780, 1, 1563454212, 1564318212, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(124, 'a_150', NULL, 105, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 650, 0, 16, 560, 0, 1564145412, 1565527812, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(125, 'rerum_379', 'Quidem quia fugiat voluptatem ab earum voluptas.', 109, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 140, 27, 0, 660, 1, 1563972612, 1565527812, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(126, 'maxime_416', 'Sunt ut ea esse error dolor quis itaque quia optio itaque.', 107, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 220, 0, 26, 900, 0, 1563886212, 1564750212, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(127, 'aut_804', 'Est aut repellat aut ea earum totam dicta vitae rerum.', 148, '[{\"title\":\"Library fee\",\"amount\":\"200\"}]', 570, 37, 2, 790, 0, 1563281412, 1565268612, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(128, 'nostrum_658', NULL, 125, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 940, 31, 0, 200, 1, 1563108612, 1564145412, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(129, 'veritatis_991', 'Aut voluptas minima sint corporis quibusdam mollitia consequuntur id quia repudiandae voluptatum.', 106, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 940, 0, 18, 300, 1, 1563454212, 1565527812, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(130, 'pariatur_774', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 180, 0, 0, 740, 1, 1563454212, 1564318212, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(131, 'nam_920', NULL, 114, '[{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 540, 0, 28, 270, 0, 1563799812, 1564145412, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(132, 'perspiciatis_660', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 500, 0, 29, 870, 1, 1563886212, 1564231812, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(133, 'ut_143', NULL, 114, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 860, 0, 33, 650, 1, 1563627012, 1565441412, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(134, 'impedit_455', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 730, 1, 0, 840, 1, 1563281412, 1564231812, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(135, 'sed_874', NULL, 125, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 210, 32, 37, 800, 1, 1563454212, 1565700612, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(136, 'eius_799', 'Vitae et laborum aut neque quisquam quod et molestiae consequuntur ipsa.', 125, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 370, 35, 34, 90, 1, 1563195012, 1564231812, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(137, 'a_688', NULL, 114, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 960, 0, 0, 320, 1, 1564145413, 1564231813, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(138, 'et_361', 'Tempore quo quia sequi sint odio quam.', 115, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 180, 24, 34, 230, 1, 1564145413, 1564231813, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(139, 'voluptate_731', 'Aut facere quam natus sed et consequatur officiis.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 160, 0, 0, 930, 1, 1563108613, 1565095813, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(140, 'quis_542', NULL, 152, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 340, 0, 0, 790, 1, 1563195013, 1564318213, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(141, 'et_850', 'Magni consequuntur eum atque rerum suscipit.', 134, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 940, 0, 0, 790, 1, 1563108613, 1564145413, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(142, 'reprehenderit_715', 'Tempora fuga quia facere excepturi rerum explicabo.', 154, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 860, 14, 22, 930, 1, 1563713413, 1564836613, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(143, 'architecto_385', 'Magni impedit aut asperiores dolore et atque in et veritatis.', 145, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 190, 0, 0, 180, 1, 1564145413, 1565268613, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(144, 'qui_114', NULL, 106, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 500, 0, 0, 440, 0, 1563454213, 1564318213, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(145, 'numquam_233', 'Omnis omnis autem commodi aperiam voluptates labore aliquid.', 114, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 350, 0, 0, 640, 1, 1563713413, 1564145413, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(146, 'adipisci_906', 'Quisquam officiis expedita dolor aut est deleniti est.', 125, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 570, 0, 0, 840, 0, 1564145413, 1564318213, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(147, 'sit_936', NULL, 105, '[{\"title\":\"Transport fee\",\"amount\":\"200\"}]', 400, 24, 0, 830, 0, 1563627013, 1564231813, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(148, 'aut_981', NULL, 146, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 180, 32, 12, 300, 0, 1563540613, 1564318213, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(149, 'fuga_608', 'Ipsam nobis doloremque exercitationem ducimus assumenda rerum molestiae.', 118, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 680, 0, 0, 720, 0, 1564059013, 1564318213, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(150, 'dolor_545', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 550, 0, 44, 320, 1, 1563627013, 1564231813, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(151, 'vel_290', NULL, 153, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 880, 0, 0, 50, 1, 1563454213, 1564318213, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(152, 'quidem_352', 'Ut sit minima dolorem ipsa nulla est repellendus beatae ea ut.', 120, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 260, 0, 0, 290, 1, 1563281413, 1564145413, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(153, 'tempore_965', NULL, 106, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 150, 5, 11, 60, 0, 1563713413, 1565182213, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(154, 'sint_680', 'Dolorum sint quasi in consequuntur eum omnis dicta vitae.', 152, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 200, 0, 18, 540, 1, 1563627013, 1564145413, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(155, 'itaque_319', NULL, 112, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 980, 0, 0, 840, 0, 1563195013, 1565527813, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(156, 'enim_515', 'Et quo blanditiis sunt amet eligendi provident voluptatem nostrum.', 106, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 730, 0, 0, 980, 0, 1563108613, 1565700613, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(157, 'id_908', 'Aut et pariatur eum quaerat repudiandae repellendus sit et quia quas.', 112, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 90, 7, 6, 180, 0, 1563713413, 1565527813, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(158, 'voluptas_107', 'Rerum saepe quia id ut rerum eos quisquam et molestias.', 144, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 380, 31, 0, 480, 1, 1563972613, 1565700613, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(159, 'dolor_459', NULL, 106, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 240, 0, 10, 240, 1, 1563799813, 1564145413, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(160, 'sit_558', NULL, 146, '[{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 730, 0, 0, 780, 0, 1563108613, 1565009413, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(161, 'dolorum_310', NULL, 147, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 910, 0, 23, 900, 1, 1564145413, 1564231813, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(162, 'ipsam_787', 'Architecto totam quis similique iusto aut aut.', 120, '[{\"title\":\"Transport fee\",\"amount\":\"300\"}]', 940, 2, 0, 600, 0, 1563108613, 1564663813, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(163, 'eum_707', NULL, 115, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 140, 0, 12, 60, 0, 1563627013, 1565009413, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(164, 'et_767', NULL, 151, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 280, 48, 8, 1000, 0, 1563108613, 1564231813, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(165, 'omnis_639', 'Qui atque voluptatum voluptatibus sunt et et laborum praesentium.', 145, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 920, 0, 0, 530, 1, 1563972613, 1565614213, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(166, 'et_538', 'Rem ea quia dolorem molestiae cumque cupiditate hic.', 134, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 580, 43, 0, 540, 0, 1563972613, 1564836613, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(167, 'numquam_495', NULL, 125, '[{\"title\":\"Building fee\",\"amount\":\"200\"}]', 360, 8, 43, 130, 0, 1563972613, 1564923013, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(168, 'fugit_409', 'Cum qui dolorem laudantium a consequuntur voluptatum voluptatibus aliquid.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 840, 21, 34, 380, 1, 1563627013, 1565441413, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(169, 'et_442', 'Aliquid aspernatur vero autem facere exercitationem dolores inventore sunt et sed.', 149, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 350, 0, 0, 570, 0, 1563454213, 1564231813, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(170, 'deserunt_206', 'Voluptas rem consequuntur numquam ipsam officiis assumenda dicta quis.', 148, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 280, 0, 1, 690, 1, 1563972613, 1564663813, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(171, 'harum_418', NULL, 153, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 690, 0, 41, 760, 1, 1563108613, 1564923013, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(172, 'consectetur_453', NULL, 153, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 810, 0, 34, 260, 0, 1564145413, 1564231813, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(173, 'reiciendis_368', 'Consectetur tenetur voluptatibus natus quia est officia corrupti qui quas quos.', 151, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 620, 16, 43, 840, 1, 1563454213, 1564923013, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(174, 'dicta_949', 'Fugit quaerat eligendi dolor inventore fugiat reprehenderit.', 120, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 290, 38, 0, 190, 1, 1564145413, 1564663813, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(175, 'id_277', NULL, 133, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 670, 0, 0, 430, 0, 1563454213, 1565009413, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(176, 'quisquam_859', NULL, 153, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 620, 22, 19, 890, 0, 1563281413, 1564231813, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(177, 'qui_973', NULL, 123, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 820, 0, 14, 970, 0, 1563367814, 1564750214, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(178, 'ducimus_378', 'Iusto facilis eum sed quia repellat ad.', 151, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 840, 13, 41, 330, 1, 1563972614, 1564318214, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(179, 'qui_892', 'Consequatur omnis rerum vero optio porro molestias facere praesentium omnis.', 114, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 620, 0, 0, 110, 0, 1563886214, 1565700614, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(180, 'necessitatibus_321', 'Eius quibusdam quos minima autem molestiae molestias sit praesentium mollitia eius.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 530, 40, 0, 870, 0, 1563799814, 1564318214, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(181, 'cum_504', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 100, 0, 0, 750, 1, 1563540614, 1564318214, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(182, 'rerum_774', NULL, 153, '[{\"title\":\"Transport fee\",\"amount\":\"400\"}]', 210, 34, 5, 630, 0, 1563972614, 1564318214, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(183, 'expedita_146', NULL, 145, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 130, 0, 0, 890, 1, 1563713414, 1564836614, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(184, 'repellendus_979', NULL, 153, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 570, 0, 0, 820, 1, 1563281414, 1565700614, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(185, 'facilis_823', 'Ullam non aspernatur quia nobis ratione.', 145, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 170, 49, 5, 810, 1, 1564145414, 1564318214, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(186, 'quas_258', 'Dolores rerum repellat voluptas nesciunt in voluptatem est assumenda atque illo.', 123, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 490, 6, 0, 120, 1, 1563454214, 1564145414, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(187, 'labore_115', 'Quia illum et praesentium quasi omnis voluptatibus quibusdam et asperiores vitae.', 147, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 50, 32, 0, 830, 1, 1564059014, 1564663814, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(188, 'laboriosam_319', 'Eos ut quae autem culpa et.', 105, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 880, 28, 50, 530, 1, 1563972614, 1565095814, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(189, 'quis_577', 'Ea quis quia fuga est iusto nam dolores rerum dolorem tempora.', 153, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 880, 0, 0, 580, 0, 1563454214, 1564750214, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(190, 'dolor_127', 'Recusandae voluptatem consequatur est tempora dignissimos.', 133, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 920, 0, 29, 80, 1, 1564145414, 1564231814, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(191, 'sit_188', 'Sint a impedit temporibus quos modi.', 115, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 810, 0, 37, 310, 1, 1563713414, 1564318214, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(192, 'nesciunt_260', 'Magnam est nihil sunt asperiores maxime nam qui voluptatem odit quibusdam ut.', 105, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 470, 47, 0, 510, 1, 1563799814, 1565009414, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(193, 'qui_886', 'Omnis natus nulla et nesciunt occaecati quibusdam autem et.', 117, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 640, 44, 21, 610, 0, 1563540614, 1564231814, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(194, 'fugit_235', 'Quod voluptatibus fugit accusantium et earum fugiat.', 153, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 580, 0, 19, 680, 0, 1563367814, 1564923014, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(195, 'omnis_741', NULL, 123, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 840, 15, 0, 960, 1, 1563627014, 1564836614, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(196, 'aliquid_825', 'Unde aut aut id eveniet dignissimos quo cumque ut sunt tenetur.', 151, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 530, 0, 36, 910, 1, 1563454214, 1564145414, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(197, 'quia_660', 'Sunt totam laudantium eligendi blanditiis quidem ducimus voluptatum quia.', 122, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 920, 0, 27, 60, 1, 1563108614, 1565355014, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(198, 'laborum_433', NULL, 133, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 740, 22, 0, 590, 1, 1563108614, 1564145414, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(199, 'dolores_947', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 440, 0, 38, 720, 0, 1563799814, 1564145414, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(200, 'ex_634', NULL, 109, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 240, 0, 0, 690, 0, 1563195014, 1564491014, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(201, 'deleniti_547', NULL, 146, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 90, 2, 28, 190, 1, 1563972614, 1564318214, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(202, 'sapiente_750', NULL, 109, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 640, 0, 33, 770, 1, 1564145414, 1565614214, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(203, 'voluptatem_463', 'Voluptatum reiciendis quos odio iste in inventore.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 350, 47, 0, 820, 1, 1563972614, 1565182214, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(204, 'autem_999', 'Ipsum ea iste modi dolorem sint voluptas omnis rerum occaecati.', 147, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 280, 0, 41, 670, 1, 1563367814, 1565441414, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(205, 'vel_757', NULL, 123, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 660, 25, 0, 410, 0, 1563281414, 1565527814, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(206, 'et_229', NULL, 153, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 260, 30, 11, 910, 0, 1563195014, 1564145414, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(207, 'architecto_423', NULL, 105, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 950, 4, 15, 460, 0, 1563627014, 1564318214, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(208, 'consequatur_166', 'Quod quo ipsum quia incidunt quis minus perferendis sed atque quaerat.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 220, 0, 34, 570, 0, 1563972614, 1564231814, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(209, 'velit_843', 'Laboriosam quod et a iure quisquam voluptas occaecati laborum exercitationem iure.', 105, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 700, 29, 0, 570, 1, 1564059014, 1565268614, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(210, 'consequuntur_552', NULL, 121, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 660, 0, 27, 340, 1, 1563540614, 1564145414, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(211, 'laudantium_323', NULL, 133, '[{\"title\":\"Transport fee\",\"amount\":\"600\"}]', 450, 8, 12, 450, 1, 1563195014, 1564145414, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(212, 'ad_120', NULL, 152, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"}]', 160, 10, 7, 540, 1, 1564059014, 1564145414, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(213, 'ex_987', NULL, 121, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 250, 0, 19, 550, 0, 1563108614, 1565614214, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(214, 'consequatur_533', 'Eum sed ut dolores tenetur corporis fuga incidunt.', 151, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 590, 38, 0, 400, 1, 1563799814, 1565268614, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(215, 'reprehenderit_595', NULL, 132, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 520, 0, 0, 680, 1, 1564059014, 1564491014, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(216, 'expedita_343', 'Molestiae nobis et consequuntur voluptatum rerum aut tempora eius.', 149, ']', 250, 0, 0, 570, 1, 1563713414, 1564318214, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(217, 'ad_346', 'Nemo necessitatibus nam aut et beatae placeat expedita laborum.', 105, '[{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 550, 28, 0, 530, 1, 1563627014, 1564145414, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(218, 'aut_668', 'Pariatur incidunt qui vel placeat maxime.', 153, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 340, 35, 0, 680, 1, 1563886214, 1565355014, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(219, 'harum_361', 'Quibusdam ea cum et iste beatae ut esse quis.', 143, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 710, 0, 20, 550, 0, 1564145415, 1564318215, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(220, 'tenetur_410', NULL, 149, '[{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 280, 28, 0, 870, 1, 1563540615, 1565355015, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(221, 'totam_453', NULL, 144, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 730, 43, 31, 790, 1, 1563367815, 1565355015, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(222, 'omnis_563', NULL, 115, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 700, 9, 19, 220, 1, 1563367815, 1565009415, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(223, 'provident_957', 'Ut quia voluptas est inventore magnam vitae illum sit est.', 148, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 50, 0, 14, 890, 0, 1563108615, 1564231815, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(224, 'aut_795', NULL, 146, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 600, 39, 0, 600, 1, 1563281415, 1565009415, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(225, 'aut_858', 'Quia et dolores nihil aut atque quia fugiat consequatur consequatur repudiandae in.', 117, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 370, 0, 0, 740, 1, 1563108615, 1564231815, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(226, 'sunt_939', NULL, 125, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 290, 0, 12, 760, 1, 1563886215, 1564318215, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(227, 'totam_750', 'Ut omnis repellendus sed eum est voluptates fugiat expedita reiciendis excepturi soluta.', 147, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 820, 17, 40, 570, 0, 1564145415, 1564231815, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(228, 'quo_601', 'Nihil dicta amet voluptatem eos veritatis nesciunt laborum et laudantium consequatur.', 145, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 720, 0, 0, 80, 1, 1563281415, 1565700615, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(229, 'consequatur_833', NULL, 135, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 440, 13, 0, 360, 0, 1563454215, 1565355015, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(230, 'consectetur_952', 'Voluptatem sit velit odit sint ad rerum et.', 154, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 60, 46, 0, 920, 1, 1563108615, 1564318215, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(231, 'aut_172', 'Voluptatem at consequatur est nesciunt consequatur.', 144, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 420, 22, 0, 800, 1, 1563540615, 1564663815, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(232, 'cupiditate_447', 'Voluptatem et accusantium quisquam fugiat sequi cupiditate.', 151, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 510, 34, 0, 590, 1, 1563108615, 1564318215, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(233, 'ut_598', NULL, 134, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 970, 0, 10, 570, 1, 1563454215, 1565182215, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(234, 'consequatur_177', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 570, 42, 1, 90, 1, 1564059015, 1564145415, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(235, 'nulla_710', 'Odit voluptas eveniet debitis ipsa laborum nihil et.', 133, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 170, 50, 42, 110, 0, 1563108615, 1564231815, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(236, 'quia_525', 'Eligendi itaque soluta officia dolorum minus.', 151, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 310, 30, 10, 520, 1, 1563713415, 1565527815, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(237, 'molestiae_903', NULL, 114, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 500, 43, 0, 990, 0, 1563972615, 1564663815, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(238, 'nihil_507', 'Nostrum ad possimus eligendi praesentium facilis expedita magni tempora.', 114, '[{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 520, 0, 0, 530, 1, 1563108615, 1564923015, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(239, 'doloribus_998', NULL, 146, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 490, 32, 0, 540, 0, 1563540615, 1564145415, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(240, 'velit_729', 'Id consequatur esse quia molestiae neque ratione eum corporis dolor.', 109, '[{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 630, 0, 0, 70, 0, 1563627015, 1565095815, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(241, 'quo_891', 'Distinctio tenetur est assumenda qui aut fugiat minima nesciunt laboriosam.', 115, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 650, 0, 0, 620, 1, 1563799815, 1564145415, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(242, 'voluptatem_206', 'Qui beatae molestiae eos sunt ut suscipit aliquid labore fugiat blanditiis sunt.', 154, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 410, 33, 25, 430, 1, 1564145415, 1564231815, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(243, 'ipsum_125', 'Aspernatur voluptatem natus eum enim nobis animi in qui.', 151, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 320, 0, 0, 520, 1, 1563799815, 1565182215, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(244, 'quia_566', NULL, 151, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 50, 8, 5, 510, 1, 1563195015, 1565095815, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(245, 'nulla_511', 'Consequatur numquam ea reiciendis ad asperiores consequatur non.', 115, '[{\"title\":\"Transport fee\",\"amount\":\"200\"}]', 590, 48, 0, 370, 1, 1563972615, 1565268615, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(246, 'ipsum_330', NULL, 120, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 290, 42, 0, 130, 1, 1563454215, 1564318215, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(247, 'debitis_224', 'Aut sit consectetur harum distinctio.', 154, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 250, 0, 37, 700, 1, 1564059015, 1565182215, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(248, 'maiores_714', NULL, 146, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 240, 0, 46, 80, 1, 1564145415, 1564145415, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(249, 'rerum_982', NULL, 114, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 330, 7, 0, 330, 0, 1564059015, 1565614215, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(250, 'aperiam_184', 'Ut quia eligendi accusamus omnis molestias vel.', 120, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 400, 0, 42, 660, 0, 1564059015, 1565355015, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(251, 'et_827', 'Voluptatem dolore consequatur maiores itaque ea.', 147, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 660, 18, 7, 840, 1, 1563367815, 1564923015, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(252, 'quidem_195', 'Vel asperiores est corporis eum consequuntur consequuntur rem dolores.', 145, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 990, 0, 0, 190, 0, 1563713415, 1564577415, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(253, 'et_447', 'Molestias velit tempora qui facere aspernatur eos at deserunt autem ut ut.', 147, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 330, 28, 0, 280, 0, 1564059015, 1564231815, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(254, 'ducimus_659', 'Ullam quia soluta officia sit provident aut voluptas.', 151, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 70, 0, 0, 440, 1, 1563799815, 1565355015, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(255, 'occaecati_149', NULL, 119, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 700, 0, 0, 630, 1, 1563886215, 1564318215, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(256, 'rem_392', NULL, 151, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 680, 0, 12, 200, 1, 1564059015, 1564231815, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(257, 'cumque_489', 'Qui animi reprehenderit architecto laudantium architecto est.', 153, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 920, 9, 0, 460, 0, 1563195015, 1564231815, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(258, 'ut_995', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 880, 0, 50, 970, 1, 1563713415, 1564923015, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(259, 'nemo_948', 'Eligendi veritatis autem quia a et et nobis.', 114, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 570, 19, 50, 390, 0, 1563108615, 1564145415, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(260, 'consequatur_233', 'Veniam aspernatur quia quae suscipit autem rerum itaque.', 120, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 420, 0, 0, 760, 0, 1563713415, 1564318215, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(261, 'sint_330', NULL, 114, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 410, 0, 26, 160, 1, 1563281415, 1565441415, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(262, 'necessitatibus_867', 'Delectus ab qui qui animi quibusdam ut distinctio veniam.', 109, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 90, 0, 43, 990, 0, 1563108616, 1564231816, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(263, 'adipisci_695', NULL, 105, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 400, 0, 0, 60, 1, 1563972616, 1564318216, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(264, 'qui_145', NULL, 111, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 460, 0, 42, 220, 0, 1564059016, 1565268616, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(265, 'ut_398', NULL, 106, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 830, 0, 5, 800, 1, 1563799816, 1564491016, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(266, 'sit_432', 'Rem adipisci harum laudantium quia assumenda et.', 149, '[{\"title\":\"Library fee\",\"amount\":\"200\"}]', 760, 0, 0, 720, 1, 1563281416, 1564318216, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(267, 'iusto_292', 'Reprehenderit corrupti quia est voluptatem eligendi totam aut sint magnam non.', 145, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 460, 15, 0, 840, 1, 1563108616, 1564750216, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(268, 'quo_622', NULL, 112, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 220, 0, 3, 350, 0, 1563108616, 1564318216, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(269, 'quisquam_413', 'Autem inventore et nobis enim est veniam qui aut facere facilis sed.', 153, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 520, 14, 0, 80, 1, 1563540616, 1564231816, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(270, 'et_190', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 620, 0, 0, 360, 0, 1564145416, 1564231816, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(271, 'nisi_399', NULL, 107, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 800, 4, 0, 190, 0, 1563108616, 1564318216, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(272, 'deleniti_951', 'Corrupti illo cum nulla sapiente sequi explicabo rem incidunt.', 147, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 110, 11, 0, 830, 0, 1563540616, 1565527816, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(273, 'qui_381', 'Quo dolores ea totam porro et magni.', 153, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 860, 41, 6, 70, 0, 1563281416, 1564231816, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(274, 'voluptas_751', 'In modi consequatur accusantium rerum quisquam quas.', 147, '[{\"title\":\"Building fee\",\"amount\":\"800\"}]', 250, 4, 0, 600, 0, 1563540616, 1564145416, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(275, 'maxime_840', 'Quaerat qui pariatur modi rem occaecati accusamus.', 148, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 430, 0, 0, 830, 0, 1563713416, 1564145416, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(276, 'magnam_604', 'Neque ut dicta commodi eaque vel dicta nulla asperiores.', 148, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 500, 0, 0, 640, 0, 1563799816, 1564318216, 1, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(277, 'nihil_946', 'Ut officia omnis veniam nulla eos.', 153, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 820, 0, 39, 200, 1, 1563454216, 1565095816, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(278, 'modi_547', NULL, 120, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 350, 29, 0, 530, 1, 1564145416, 1564145416, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(279, 'quaerat_936', NULL, 123, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 720, 0, 0, 730, 1, 1564059016, 1565009416, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(280, 'cum_172', 'Eligendi consequatur reprehenderit sed qui qui officiis dolorem accusamus eos.', 152, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 890, 0, 0, 680, 1, 1563713416, 1565700616, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(281, 'excepturi_276', 'Quia enim voluptates nemo ut.', 123, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 120, 41, 0, 610, 0, 1563799816, 1565700616, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(282, 'explicabo_182', NULL, 152, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 850, 0, 27, 500, 1, 1563627016, 1564231816, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(283, 'quo_213', 'Minus sit doloribus quos mollitia amet.', 115, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 110, 16, 13, 660, 0, 1563281416, 1564231816, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(284, 'magnam_381', 'Pariatur nesciunt nihil ex quod dolorem dolor.', 147, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 730, 0, 37, 520, 1, 1563886216, 1565182216, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(285, 'quaerat_897', NULL, 109, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 340, 8, 32, 980, 0, 1564059016, 1564663816, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(286, 'esse_896', NULL, 120, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 690, 42, 0, 780, 0, 1564059016, 1564145416, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(287, 'adipisci_148', 'Tenetur sunt quibusdam deserunt quae voluptatem officia suscipit repellendus.', 121, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 750, 10, 0, 580, 1, 1563886216, 1564145416, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(288, 'dolore_837', 'Ullam voluptatem soluta hic repellendus natus sit est quo dolores ipsa.', 114, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 150, 24, 43, 740, 0, 1563108616, 1565355016, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(289, 'quas_960', NULL, 148, '[{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 100, 0, 11, 530, 0, 1563886216, 1565355016, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(290, 'consequatur_937', 'Animi magni eum blanditiis consequatur quidem maiores saepe voluptatem minus.', 147, '[{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 360, 0, 0, 480, 0, 1563627016, 1564231816, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(291, 'modi_575', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 650, 0, 0, 50, 1, 1563886216, 1565095816, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(292, 'nesciunt_306', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 580, 0, 20, 100, 0, 1563886216, 1565614216, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(293, 'eos_643', 'Dolor consequatur nam laudantium ut et labore voluptatem sit doloribus suscipit.', 153, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 490, 0, 11, 820, 1, 1563972616, 1564923016, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(294, 'temporibus_487', NULL, 151, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 410, 0, 0, 120, 0, 1563799816, 1564491016, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(295, 'quas_361', NULL, 120, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 550, 10, 19, 930, 1, 1563454216, 1565614216, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(296, 'dicta_668', NULL, 153, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 100, 8, 0, 200, 1, 1563799816, 1564318216, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(297, 'veritatis_351', 'Aut est adipisci aut sunt est praesentium.', 112, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 470, 0, 0, 620, 1, 1563713416, 1564836616, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(298, 'modi_798', 'Tempora earum maiores voluptate sint dolor.', 146, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 680, 20, 0, 60, 1, 1564059016, 1564145416, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(299, 'dolores_215', NULL, 144, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"}]', 670, 0, 10, 380, 0, 1563367816, 1565441416, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(300, 'earum_762', NULL, 119, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 90, 0, 0, 150, 0, 1563972616, 1564318216, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(301, 'magni_243', NULL, 147, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 60, 0, 0, 880, 1, 1563972616, 1564923016, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(302, 'aspernatur_982', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"}]', 590, 46, 41, 400, 1, 1563886216, 1564145416, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(303, 'ad_463', NULL, 112, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 1000, 0, 0, 790, 1, 1564059016, 1565182216, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(304, 'laboriosam_457', NULL, 122, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 700, 29, 0, 710, 1, 1563367816, 1564145416, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(305, 'qui_394', 'Rerum ut et voluptate ducimus in et minus.', 115, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 940, 0, 25, 540, 0, 1563972616, 1564318216, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(306, 'sit_728', 'Natus numquam ea occaecati quam iure a harum qui quia.', 148, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 670, 0, 29, 500, 0, 1563540616, 1565527816, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(307, 'hic_149', 'Autem nobis accusamus saepe dicta facilis totam.', 114, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 490, 0, 0, 120, 1, 1563454217, 1564231817, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(308, 'nulla_602', NULL, 152, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 380, 13, 0, 820, 1, 1563627017, 1565182217, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(309, 'placeat_140', NULL, 151, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 500, 23, 9, 500, 0, 1563972617, 1564836617, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(310, 'debitis_497', 'Sit nihil et nemo dolor a ipsa dolor autem cum vel.', 125, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 690, 0, 33, 460, 1, 1563627017, 1564145417, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(311, 'numquam_688', NULL, 106, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 500, 0, 0, 530, 0, 1563886217, 1565009417, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(312, 'blanditiis_719', 'Est voluptates laboriosam est sint rerum consequatur at assumenda repellat.', 145, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 90, 0, 0, 220, 1, 1564145417, 1564491017, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(313, 'reprehenderit_630', NULL, 112, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 360, 39, 42, 150, 1, 1564059017, 1564750217, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(314, 'dolores_366', 'Excepturi natus repellat sit ea optio suscipit cupiditate.', 115, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 290, 42, 0, 220, 1, 1563540617, 1565355017, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(315, 'iste_631', NULL, 121, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 490, 35, 0, 970, 1, 1563281417, 1564663817, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(316, 'est_941', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 460, 16, 44, 90, 1, 1563454217, 1565527817, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(317, 'qui_390', NULL, 153, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 300, 0, 37, 790, 1, 1563281417, 1564231817, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(318, 'suscipit_647', NULL, 153, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 800, 31, 0, 120, 0, 1563540617, 1565355017, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(319, 'cupiditate_375', 'Aut voluptas sed modi odio doloremque et.', 105, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 90, 13, 36, 130, 1, 1563713417, 1565441417, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(320, 'nisi_169', 'Et quam dolores rerum velit molestias.', 146, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 170, 36, 0, 390, 1, 1563195017, 1564231817, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(321, 'suscipit_899', 'Eum tempora dolores fugiat pariatur non.', 125, '[{\"title\":\"Transport fee\",\"amount\":\"200\"}]', 640, 34, 0, 850, 0, 1563799817, 1564318217, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(322, 'corrupti_151', 'Qui dolores eius qui beatae non et.', 105, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 950, 26, 0, 430, 0, 1563540617, 1564663817, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(323, 'quaerat_501', 'Sit inventore qui distinctio aspernatur doloremque repellat voluptatibus et reprehenderit.', 122, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 630, 0, 50, 280, 1, 1563108617, 1565700617, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(324, 'consectetur_495', NULL, 151, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 580, 0, 36, 130, 1, 1563454217, 1564923017, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(325, 'expedita_164', NULL, 120, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 940, 27, 0, 630, 1, 1563367817, 1564231817, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(326, 'aliquid_815', 'Officiis ut similique distinctio nam deserunt provident itaque deserunt.', 114, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 350, 0, 38, 210, 1, 1563713417, 1564491017, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(327, 'expedita_177', NULL, 109, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 740, 0, 0, 790, 1, 1563713417, 1564145417, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(328, 'eum_961', NULL, 153, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 1000, 30, 25, 270, 0, 1563281417, 1565527817, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(329, 'dolor_361', 'Aliquam et et quo debitis ipsum sit ut sit quisquam.', 106, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 560, 4, 0, 660, 1, 1563713417, 1564923017, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(330, 'laboriosam_699', NULL, 121, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 940, 30, 0, 870, 0, 1563886217, 1564145417, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(331, 'aliquid_357', NULL, 121, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 100, 0, 48, 340, 1, 1563281417, 1564318217, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(332, 'nemo_783', 'Odit tempora sed error ad et voluptates ratione consequatur.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 740, 1, 40, 160, 0, 1563713417, 1564577417, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(333, 'impedit_987', NULL, 154, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 320, 50, 0, 990, 0, 1563367817, 1564923017, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(334, 'amet_642', NULL, 115, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 750, 0, 0, 670, 1, 1564059017, 1565182217, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(335, 'et_181', 'Nobis alias consequatur dolorem ullam expedita est omnis quo dolores.', 148, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 210, 0, 0, 590, 0, 1563972617, 1565095817, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(336, 'deleniti_111', 'Magni quam veniam repellat eius assumenda officia architecto facere.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 990, 34, 0, 220, 0, 1564145417, 1564145417, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(337, 'provident_403', 'Ipsam impedit qui reiciendis quam officia aliquam.', 144, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 140, 24, 0, 870, 1, 1563627017, 1564231817, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(338, 'alias_219', 'Non nihil error reprehenderit ipsam nostrum et.', 147, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 270, 0, 46, 920, 1, 1563627017, 1564318217, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(339, 'voluptate_593', 'Sapiente rerum esse in illo tempora.', 134, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 880, 25, 44, 770, 0, 1564059017, 1564318217, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(340, 'natus_471', 'Nesciunt corporis quae sit eius minima cupiditate asperiores explicabo eveniet.', 120, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 110, 48, 25, 650, 0, 1563367817, 1564145417, 1, NULL, NULL, 'Cheque', NULL, 1, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(341, 'soluta_131', NULL, 112, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 840, 6, 0, 560, 0, 1563454217, 1564923017, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(342, 'voluptas_494', NULL, 153, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 510, 0, 50, 240, 1, 1563108617, 1564145417, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(343, 'numquam_255', 'Impedit voluptatem unde quia et tempora molestias fuga voluptates dolorem dolor.', 154, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 560, 32, 2, 820, 1, 1563713417, 1564318217, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(344, 'illo_458', 'Quibusdam perferendis dolor reprehenderit dolore debitis ut est exercitationem ut.', 135, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 50, 0, 0, 750, 1, 1563627017, 1564750217, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(345, 'ut_596', NULL, 120, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 910, 0, 0, 350, 1, 1563627017, 1565268617, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(346, 'sint_133', 'Rem a voluptate et sed deleniti quod cupiditate repellendus cumque sed et.', 107, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 1000, 0, 0, 930, 1, 1563799817, 1565614217, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(347, 'suscipit_193', 'Qui perspiciatis nam quam velit molestiae eum voluptatum odio consectetur eos.', 117, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 640, 0, 0, 170, 0, 1563627017, 1564231817, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(348, 'consectetur_147', NULL, 115, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 870, 47, 0, 570, 1, 1563627018, 1564145418, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(349, 'quaerat_828', 'Sapiente voluptatem et asperiores cumque cupiditate dolorem minima voluptate.', 106, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 660, 40, 0, 780, 0, 1563108618, 1565355018, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(350, 'culpa_497', NULL, 115, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 170, 11, 0, 310, 1, 1563713418, 1565441418, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(351, 'omnis_809', 'Et nam cupiditate sed natus exercitationem aut mollitia.', 147, '[{\"title\":\"Transport fee\",\"amount\":\"500\"}]', 200, 8, 42, 640, 1, 1563799818, 1565095818, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(352, 'consequatur_632', 'Voluptatem eveniet occaecati ut ut facilis ut qui.', 145, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 100, 0, 23, 880, 1, 1564145418, 1564231818, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(353, 'quaerat_448', NULL, 117, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 730, 0, 0, 260, 0, 1563972618, 1564145418, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(354, 'debitis_399', 'Ab et quidem quia nulla corporis nulla praesentium autem.', 135, '[{\"title\":\"Transport fee\",\"amount\":\"300\"}]', 610, 41, 3, 380, 0, 1563281418, 1564231818, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(355, 'non_602', 'Rerum recusandae repudiandae sit veritatis est nisi repellat non et.', 147, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 120, 0, 6, 760, 0, 1563454218, 1564145418, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(356, 'voluptatem_553', 'Aut quia sit nesciunt excepturi dolores est corporis excepturi vel.', 132, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 380, 45, 0, 490, 1, 1563972618, 1564836618, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(357, 'alias_279', 'Dignissimos voluptatibus fugit voluptas tempora dolor sint vero laborum.', 125, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 860, 44, 6, 410, 1, 1563367818, 1564923018, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(358, 'quaerat_143', NULL, 145, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 460, 0, 0, 730, 0, 1563454218, 1565700618, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(359, 'sint_240', NULL, 153, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 230, 0, 0, 670, 1, 1563886218, 1564145418, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(360, 'et_540', 'In sit nisi maiores sed nam.', 112, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 270, 0, 49, 630, 0, 1563972618, 1564231818, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(361, 'accusantium_723', NULL, 133, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 760, 0, 8, 710, 1, 1563454218, 1564663818, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(362, 'odio_125', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 990, 0, 0, 750, 1, 1563108618, 1565009418, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(363, 'quia_877', NULL, 106, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 220, 0, 41, 480, 1, 1563108618, 1565700618, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(364, 'sit_672', NULL, 153, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 510, 0, 30, 560, 1, 1564059018, 1564750218, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(365, 'tempora_723', NULL, 154, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 740, 50, 12, 560, 1, 1563713418, 1565614218, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(366, 'doloremque_944', 'Consectetur eum fugiat et perferendis totam ut quibusdam velit.', 143, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 310, 0, 45, 740, 1, 1563281418, 1565268618, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(367, 'consequuntur_981', 'Mollitia doloremque accusamus non mollitia quasi.', 115, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 690, 0, 0, 450, 1, 1564145418, 1564145418, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(368, 'molestiae_238', NULL, 106, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 250, 0, 0, 360, 1, 1563540618, 1565009418, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(369, 'quas_138', 'Id vero necessitatibus voluptas et sed modi sint.', 112, '[{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 280, 0, 0, 190, 0, 1563540618, 1564231818, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(370, 'ex_551', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 620, 28, 49, 580, 1, 1563540618, 1564145418, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(371, 'pariatur_535', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 210, 0, 0, 270, 1, 1563540618, 1565700618, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(372, 'eius_395', NULL, 154, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 550, 34, 18, 760, 0, 1563972618, 1564318218, 1, NULL, NULL, 'Cheque', NULL, 0, '0'),
(373, 'cum_981', 'Ipsam occaecati voluptatum rerum qui perspiciatis modi ducimus.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 80, 14, 27, 350, 1, 1563195018, 1564577418, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(374, 'quos_675', 'Placeat et ea et ad tempore facilis.', 109, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 60, 0, 0, 910, 1, 1563195018, 1565355018, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(375, 'id_264', 'Recusandae eaque nisi unde placeat necessitatibus occaecati ea.', 125, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 1000, 0, 0, 910, 0, 1563108618, 1564318218, 1, NULL, NULL, 'Cheque', NULL, 0, '0'),
(376, 'optio_536', 'Accusamus ut eos velit ratione quas totam consectetur in.', 132, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 710, 24, 35, 240, 1, 1563972618, 1564145418, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(377, 'optio_465', 'Voluptas distinctio vel repellat mollitia eum ut corporis cupiditate optio.', 111, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 290, 0, 0, 710, 1, 1563713418, 1564318218, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(378, 'ab_767', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 550, 11, 0, 740, 1, 1563799818, 1565614218, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(379, 'qui_760', 'In illum occaecati error quam commodi.', 151, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 550, 0, 41, 920, 0, 1563713418, 1564231818, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(380, 'cum_872', NULL, 118, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 80, 0, 21, 630, 0, 1563367818, 1564145418, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(381, 'id_247', NULL, 107, '[{\"title\":\"Library fee\",\"amount\":\"700\"}]', 80, 6, 5, 80, 0, 1563886218, 1565441418, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(382, 'aut_764', NULL, 115, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 710, 48, 0, 400, 0, 1564145418, 1565009418, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(383, 'omnis_159', NULL, 105, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 400, 16, 0, 850, 0, 1563799818, 1564750218, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(384, 'expedita_961', NULL, 144, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 430, 0, 0, 700, 0, 1564059018, 1564318218, 1, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(385, 'nam_820', 'Hic voluptatem modi officia qui accusantium et.', 115, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 260, 39, 0, 890, 1, 1563972619, 1564145419, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(386, 'iste_166', NULL, 135, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 80, 14, 0, 860, 0, 1563886219, 1564836619, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(387, 'voluptas_267', NULL, 148, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 680, 18, 0, 540, 0, 1563886219, 1564318219, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(388, 'possimus_130', NULL, 148, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 850, 1, 26, 320, 1, 1563367819, 1564491019, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(389, 'placeat_992', NULL, 135, '[{\"title\":\"Transport fee\",\"amount\":\"400\"}]', 830, 0, 0, 440, 0, 1563195019, 1564145419, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(390, 'vitae_191', 'Tenetur vel deserunt odio rerum.', 115, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 920, 4, 0, 900, 1, 1563799819, 1564231819, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(391, 'laudantium_874', 'Officiis quia amet quaerat optio dolores corrupti aliquam quia aut omnis.', 123, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 930, 0, 12, 120, 0, 1564145419, 1565700619, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(392, 'dolorum_178', NULL, 117, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 800, 0, 24, 290, 1, 1563713419, 1565700619, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(393, 'dolor_317', NULL, 115, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 490, 29, 0, 600, 0, 1563972619, 1564318219, 1, NULL, NULL, 'Card', NULL, 0, '0'),
(394, 'dolor_968', 'Est iure accusamus doloribus aut sed doloremque et soluta consequatur sed.', 125, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 670, 0, 0, 550, 1, 1563281419, 1564836619, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(395, 'et_423', NULL, 151, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 890, 0, 32, 500, 1, 1563627019, 1564318219, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(396, 'et_876', NULL, 121, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 370, 0, 6, 520, 0, 1564059019, 1565700619, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(397, 'magnam_450', 'Natus facilis voluptatum deserunt veniam distinctio nisi repellendus voluptatibus amet aut.', 114, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 140, 43, 49, 990, 1, 1563108619, 1564318219, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(398, 'commodi_989', NULL, 114, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 840, 10, 26, 60, 0, 1563886219, 1564318219, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(399, 'omnis_220', 'Sequi fuga voluptates exercitationem quis doloremque natus ut qui fuga.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 940, 46, 0, 360, 1, 1563972619, 1564318219, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(400, 'tempora_923', 'Unde molestias voluptas sequi autem illo repudiandae laborum ab eveniet commodi.', 134, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 660, 16, 17, 300, 1, 1563195019, 1565182219, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(401, 'nam_926', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 430, 0, 0, 450, 1, 1563454219, 1565441419, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(402, 'odit_299', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 740, 0, 0, 110, 1, 1563540619, 1564836619, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(403, 'est_338', NULL, 149, '[{\"title\":\"Building fee\",\"amount\":\"400\"}]', 750, 46, 0, 520, 0, 1563195019, 1564318219, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(404, 'repellat_105', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 70, 0, 0, 590, 0, 1563454219, 1564318219, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(405, 'aut_709', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 770, 46, 0, 670, 1, 1563454219, 1564145419, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(406, 'fugiat_257', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 890, 0, 0, 390, 1, 1563108619, 1565268619, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(407, 'quasi_582', 'Aliquid quod in et rerum optio explicabo incidunt consequuntur ea dolorem.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 210, 0, 0, 810, 1, 1563627019, 1565700619, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(408, 'in_795', 'Ut animi dolores magnam id ad incidunt.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 300, 21, 15, 730, 1, 1563367819, 1564231819, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(409, 'ut_733', 'Qui aliquid assumenda earum iusto.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 210, 32, 29, 340, 0, 1563281419, 1564318219, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(410, 'reiciendis_455', 'Consequatur dolorem iste adipisci laudantium dolor laudantium qui.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 620, 0, 0, 410, 1, 1563886219, 1564663819, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(411, 'sit_931', 'Perspiciatis vel quibusdam voluptas dolores eius eum.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 250, 25, 17, 520, 1, 1563281419, 1564491019, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(412, 'quis_485', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 750, 0, 34, 500, 1, 1563627019, 1564231819, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(413, 'ipsa_591', NULL, 149, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 730, 18, 0, 370, 1, 1563195019, 1564145419, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(414, 'deleniti_419', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 470, 14, 0, 540, 1, 1563108619, 1564923019, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(415, 'fugit_243', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 660, 0, 0, 470, 0, 1564059019, 1564231819, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(416, 'earum_526', 'Et temporibus iste quod fugiat qui illum.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 150, 0, 4, 420, 1, 1563713419, 1564145419, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(417, 'sit_218', 'Sit aut consectetur ut dolorum quod provident illo illum doloribus asperiores.', 149, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 990, 38, 0, 820, 1, 1563972619, 1564145419, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(418, 'ratione_459', 'Quia ut veritatis qui odit sed aspernatur et autem.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 800, 0, 36, 800, 1, 1563799819, 1565355019, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(419, 'neque_616', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 70, 0, 0, 580, 0, 1563972619, 1565700619, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(420, 'numquam_592', 'Et ut eveniet minus aut rem ut ea veritatis et esse ullam.', 149, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 80, 29, 40, 930, 1, 1563540619, 1564145419, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(421, 'consequatur_457', 'Blanditiis ut tempora ut saepe est non et tempore asperiores pariatur.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 960, 0, 48, 980, 1, 1564059019, 1564318219, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(422, 'hic_436', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 430, 19, 0, 490, 0, 1564059019, 1564145419, 1, NULL, NULL, 'Cash', NULL, 0, '0'),
(423, 'placeat_977', 'Eum blanditiis laborum nostrum quae deleniti magnam.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 770, 0, 48, 970, 1, 1563195019, 1564145419, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(424, 'architecto_915', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 950, 13, 0, 830, 0, 1564059019, 1564145419, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(425, 'eum_725', 'Nihil rerum adipisci sapiente et consequatur repellat.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 240, 0, 40, 470, 0, 1563195019, 1565355019, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(426, 'dicta_545', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 950, 0, 0, 140, 0, 1563540619, 1565441419, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(427, 'corrupti_577', 'Aliquid numquam esse sed totam tenetur delectus eos atque.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 60, 6, 0, 410, 0, 1563195019, 1564836619, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(428, 'qui_215', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 960, 0, 0, 100, 0, 1563713419, 1564145419, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(429, 'ex_888', 'Voluptatibus unde consequatur et omnis saepe nemo voluptatem tempore.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 630, 0, 4, 530, 0, 1563454219, 1564145419, 1, NULL, NULL, 'Cheque', NULL, 0, '0'),
(430, 'est_435', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 180, 0, 19, 130, 0, 1563972619, 1564231819, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(431, 'perspiciatis_851', 'Ut dolor blanditiis culpa ut sit quidem nisi.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 920, 0, 0, 470, 0, 1564145419, 1564145419, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(432, 'ut_113', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 600, 0, 0, 650, 1, 1563195020, 1564231820, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(433, 'inventore_125', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 510, 10, 0, 100, 1, 1563108620, 1564318220, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(434, 'vitae_289', 'Esse magnam veritatis voluptatem et sint recusandae similique totam beatae.', 149, '[{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 100, 0, 29, 70, 1, 1563108620, 1565441420, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(435, 'et_546', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 760, 3, 4, 590, 0, 1563108620, 1565268620, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(436, 'saepe_858', 'Repudiandae aut pariatur vel consequuntur eos.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 920, 17, 20, 140, 1, 1563195020, 1564231820, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(437, 'et_682', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 210, 0, 0, 380, 0, 1563799820, 1565700620, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(438, 'laborum_553', 'Cupiditate iure voluptas accusamus aspernatur aut culpa quia perspiciatis.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 610, 0, 30, 380, 0, 1563799820, 1564577420, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(439, 'ea_843', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 110, 21, 0, 480, 0, 1563886220, 1565009420, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(440, 'quaerat_891', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 890, 0, 14, 370, 0, 1564059020, 1564231820, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(441, 'fugit_808', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 160, 2, 30, 70, 0, 1563281420, 1564750220, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(442, 'fugiat_398', NULL, 149, '[{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 960, 0, 50, 330, 1, 1563367820, 1565182220, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(443, 'aspernatur_166', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 170, 0, 0, 430, 1, 1563108620, 1565614220, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(444, 'accusamus_506', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 380, 0, 4, 680, 1, 1564145420, 1564491020, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(445, 'in_833', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 350, 0, 4, 960, 0, 1563627020, 1564491020, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(446, 'debitis_196', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 770, 38, 30, 70, 1, 1563713420, 1565614220, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(447, 'consectetur_979', 'Facilis harum odio voluptates repellat quam.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 400, 0, 0, 530, 1, 1563281420, 1564231820, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(448, 'dolorum_509', 'Quia est vitae sint dolorum ut quod.', 149, ']', 820, 8, 41, 280, 0, 1564059020, 1565614220, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(449, 'sed_261', 'Maiores consequuntur nemo sint dolorum est nisi quas perferendis voluptas accusamus.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 590, 0, 48, 260, 0, 1563367820, 1564145420, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(450, 'sit_452', NULL, 149, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 770, 0, 39, 510, 0, 1563799820, 1565527820, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(451, 'quia_948', 'Officiis aut nobis dolorem nulla distinctio ipsa.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 500, 49, 0, 90, 0, 1564145420, 1564145420, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(452, 'aut_880', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 980, 0, 0, 80, 0, 1563195020, 1564318220, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(453, 'sed_673', NULL, 149, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 540, 0, 0, 200, 1, 1563540620, 1564318220, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(454, 'necessitatibus_827', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 370, 38, 0, 740, 0, 1563799820, 1564318220, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(455, 'eaque_904', 'Est at consequatur molestiae aut repellat aut tempore quia.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 750, 10, 50, 540, 0, 1564145420, 1565614220, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(456, 'ipsam_239', 'Est culpa rerum consequuntur alias et consequuntur.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 150, 0, 26, 950, 1, 1563799820, 1564145420, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(457, 'saepe_914', NULL, 149, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 120, 26, 0, 420, 0, 1563108620, 1564577420, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(458, 'delectus_297', NULL, 149, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 730, 0, 31, 380, 0, 1564145420, 1565700620, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(459, 'ut_362', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 320, 0, 17, 1000, 0, 1563540620, 1564663820, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(460, 'consequatur_427', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 620, 0, 0, 610, 1, 1564059020, 1564231820, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(461, 'cum_458', 'Quas iste labore excepturi repellendus.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 520, 0, 0, 70, 0, 1564145420, 1564145420, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(462, 'necessitatibus_943', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 50, 49, 0, 350, 1, 1563886220, 1564577420, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(463, 'repellendus_285', 'Iure dolores quas deserunt consequatur porro iure quis nihil odio.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 220, 16, 22, 320, 0, 1563540620, 1565700620, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(464, 'placeat_850', 'Inventore at id laudantium explicabo nulla ducimus nisi.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 190, 0, 0, 750, 0, 1564059020, 1565268620, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(465, 'saepe_897', 'Officiis iusto itaque quod dignissimos iure est debitis.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 720, 19, 0, 340, 1, 1563281420, 1564231820, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(466, 'tempora_138', 'Inventore delectus omnis facere optio commodi est quam id omnis cumque.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 220, 0, 0, 850, 0, 1564059020, 1565527820, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(467, 'illo_491', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 760, 47, 31, 130, 0, 1563540620, 1564836620, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(468, 'dicta_608', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 190, 13, 25, 870, 0, 1563281420, 1564318220, 1, NULL, NULL, 'Cheque', NULL, 0, '0'),
(469, 'temporibus_809', 'Doloremque et nihil quae eaque tempore tempora et.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 500, 18, 0, 810, 1, 1564059020, 1564231820, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(470, 'laudantium_976', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 370, 42, 33, 130, 1, 1563281420, 1565268620, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(471, 'velit_719', 'Et eum vero beatae est libero.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 50, 0, 28, 900, 1, 1563886220, 1564145420, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(472, 'nesciunt_228', 'Itaque quae quis ad rerum accusantium reiciendis minima consequatur modi aperiam.', 149, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 110, 0, 46, 50, 0, 1563367820, 1565614220, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(473, 'doloribus_856', 'Architecto qui et autem quia facilis accusantium fugiat quod.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 540, 0, 0, 260, 0, 1563195020, 1564231820, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(474, 'voluptatibus_928', NULL, 149, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 70, 16, 0, 690, 1, 1563195020, 1564145420, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(475, 'quia_344', 'Fuga qui et aut ut rerum delectus sit nesciunt exercitationem.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 690, 36, 0, 770, 1, 1563972620, 1564231820, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(476, 'quibusdam_632', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 590, 0, 0, 950, 0, 1563454221, 1564491021, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(477, 'labore_653', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 770, 14, 0, 670, 1, 1563799821, 1564577421, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(478, 'accusamus_738', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 450, 32, 0, 390, 1, 1563799821, 1564231821, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(479, 'earum_584', 'Aut quia porro explicabo recusandae saepe excepturi officia quibusdam.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 880, 39, 26, 410, 1, 1563713421, 1564318221, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(480, 'vel_653', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 110, 7, 0, 460, 1, 1563195021, 1565441421, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(481, 'in_833', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 480, 23, 0, 110, 1, 1563367821, 1564750221, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(482, 'ut_583', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 210, 31, 0, 830, 0, 1563195021, 1564491021, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(483, 'facilis_358', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 450, 0, 0, 740, 0, 1563799821, 1564923021, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(484, 'vel_564', 'Iure aut voluptas iure aliquid voluptas est ab voluptas excepturi iusto.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 200, 0, 4, 610, 1, 1563195021, 1564145421, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(485, 'ullam_114', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 690, 0, 0, 420, 1, 1563540621, 1564577421, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(486, 'laboriosam_734', 'Deleniti nihil libero esse ipsum eligendi tempore vero.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 200, 3, 0, 200, 0, 1563972621, 1564318221, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(487, 'aut_580', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 350, 15, 9, 410, 1, 1563367821, 1564231821, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(488, 'non_620', 'Accusantium dolorem minus dolor velit velit sed reprehenderit perferendis ut velit.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 800, 45, 0, 920, 0, 1563367821, 1564231821, 1, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(489, 'maxime_424', 'Aut voluptas et aspernatur sapiente explicabo natus sunt.', 149, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 750, 0, 0, 880, 1, 1563886221, 1564231821, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(490, 'magni_532', 'Vel autem voluptatem error modi consequatur a et.', 149, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 80, 15, 0, 240, 1, 1564145421, 1564231821, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(491, 'est_233', 'Deserunt perspiciatis illo impedit ex est cumque architecto.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 870, 1, 0, 460, 1, 1563799821, 1564145421, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(492, 'et_853', 'Quis facere qui voluptatum et aut.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 140, 27, 0, 290, 0, 1563108621, 1564318221, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(493, 'aut_618', NULL, 149, '[{\"title\":\"Library fee\",\"amount\":\"700\"}]', 890, 18, 30, 230, 0, 1563108621, 1565009421, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(494, 'voluptas_762', 'Omnis perspiciatis soluta accusamus et voluptatem dignissimos nam excepturi eveniet hic.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 70, 13, 0, 310, 0, 1563281421, 1564491021, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(495, 'velit_574', 'Reiciendis omnis debitis totam explicabo earum est illo ut.', 149, '[{\"title\":\"Library fee\",\"amount\":\"500\"}]', 750, 1, 6, 1000, 1, 1563886221, 1564577421, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(496, 'earum_722', 'Vero ea ut voluptatem sed.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 540, 0, 2, 710, 1, 1563454221, 1564145421, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(497, 'quos_713', 'Ut aut quaerat incidunt aliquid quas autem possimus aut voluptatem.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 760, 27, 0, 560, 0, 1563454221, 1565182221, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(498, 'quis_260', 'Aut harum porro atque architecto incidunt impedit.', 149, '[{\"title\":\"Building fee\",\"amount\":\"800\"}]', 590, 0, 0, 940, 1, 1563799821, 1565527821, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(499, 'eos_776', 'Nisi sint repellat molestiae voluptas et voluptates sequi quia et quia.', 149, ']', 220, 0, 0, 710, 0, 1563799821, 1564231821, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(500, 'saepe_703', 'Eum vero velit neque omnis consequuntur optio consectetur.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"}]', 410, 2, 39, 340, 1, 1563281421, 1564750221, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(501, 'nihil_361', 'Facere fugiat delectus rerum et aut nobis.', 149, ']', 700, 18, 12, 290, 0, 1563454221, 1564577421, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(502, 'molestiae_907', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 820, 18, 20, 200, 0, 1564059021, 1565614221, 0, NULL, NULL, 'Cash', NULL, 1, '0'),
(503, 'qui_824', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 90, 0, 0, 630, 0, 1564059021, 1564577421, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(504, 'eveniet_259', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 650, 0, 36, 710, 0, 1563281421, 1564577421, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(505, 'nisi_778', 'Consequuntur nam ipsa officiis sit consequuntur quis dicta quaerat odio.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 460, 0, 0, 830, 0, 1563367821, 1564231821, 1, NULL, NULL, 'Cheque', NULL, 0, '0'),
(506, 'vel_769', 'Laboriosam at consequuntur iste ut provident.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"100\"}]', 280, 23, 10, 130, 1, 1564145421, 1564318221, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(507, 'ipsam_296', 'Incidunt veritatis magni rem beatae odio hic reiciendis veniam.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 610, 0, 16, 180, 1, 1564059021, 1565182221, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(508, 'similique_216', 'Similique voluptatem quia eos quibusdam ut.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 360, 21, 20, 310, 0, 1563972621, 1565009421, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(509, 'ut_227', 'Aut aut vel dolor ut dolorem sit alias.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 690, 0, 0, 450, 0, 1563627021, 1564145421, 1, NULL, NULL, 'Card', NULL, 1, '0'),
(510, 'officiis_710', 'Odio occaecati iste vel voluptas sed perferendis ea et.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 680, 0, 48, 250, 1, 1563454221, 1565355021, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(511, 'nesciunt_492', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 1000, 24, 7, 510, 0, 1563195021, 1565614221, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(512, 'hic_774', 'Libero qui dolorem nulla molestiae quo magni magnam voluptate eum.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 920, 0, 0, 820, 1, 1563281421, 1564318221, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(513, 'pariatur_264', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 760, 0, 27, 880, 1, 1563454221, 1564145421, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(514, 'accusamus_136', 'Beatae vero unde provident sed magnam nesciunt aliquam.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 230, 0, 12, 990, 1, 1563540621, 1565095821, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(515, 'vel_258', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 690, 0, 0, 800, 0, 1563195021, 1564318221, 1, NULL, NULL, 'Online', NULL, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(516, 'ea_910', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 250, 48, 0, 770, 1, 1563972621, 1564318221, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(517, 'quas_987', 'Perspiciatis aut quasi vitae harum totam iste est.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 800, 0, 0, 840, 1, 1563972621, 1564663821, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(518, 'debitis_331', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 930, 0, 0, 330, 1, 1563972621, 1564750221, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(519, 'harum_212', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 420, 42, 30, 540, 1, 1563799821, 1564318221, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(520, 'adipisci_609', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"}]', 600, 49, 0, 440, 1, 1563367821, 1564145421, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(521, 'culpa_377', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 410, 0, 47, 280, 0, 1563713421, 1564145421, 1, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(522, 'praesentium_307', 'Eos tempore praesentium voluptatibus ut qui veritatis.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 680, 0, 0, 470, 0, 1564145421, 1564318221, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(523, 'officiis_360', 'Est enim ut totam eos laborum quis.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 990, 26, 1, 970, 1, 1564059021, 1564318221, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(524, 'et_363', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 460, 7, 10, 270, 1, 1563108622, 1565355022, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(525, 'excepturi_956', 'Nesciunt aut in officia ut provident libero rerum.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 330, 0, 0, 220, 0, 1563454222, 1564318222, 1, NULL, NULL, 'Cash', NULL, 1, '0'),
(526, 'harum_928', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 650, 31, 0, 710, 0, 1564145422, 1564145422, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(527, 'ad_856', 'Ullam molestiae repellendus ut velit quia voluptatum quia id ipsum.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 580, 3, 50, 680, 0, 1563713422, 1564231822, 1, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(528, 'voluptates_275', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 590, 44, 0, 540, 1, 1564145422, 1565441422, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(529, 'et_633', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 870, 49, 0, 790, 0, 1563972622, 1565614222, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(530, 'aperiam_725', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"}]', 660, 0, 34, 330, 1, 1563886222, 1564145422, 0, NULL, NULL, 'Card', NULL, 1, '0'),
(531, 'aut_743', 'Fugit eaque aut sint deserunt.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 830, 0, 19, 50, 1, 1564145422, 1565700622, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(532, 'at_641', 'Autem maxime quibusdam modi voluptas ut corrupti quia doloribus aut soluta.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 90, 43, 44, 540, 0, 1563108622, 1564231822, 1, NULL, NULL, 'Cheque', NULL, 1, '0'),
(533, 'alias_916', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 960, 18, 17, 670, 1, 1563713422, 1565009422, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(534, 'atque_267', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 990, 0, 0, 360, 0, 1563454222, 1564145422, 1, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(535, 'voluptatum_908', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 110, 9, 0, 100, 1, 1563367822, 1564577422, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(536, 'voluptatem_721', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 330, 0, 4, 220, 0, 1563108622, 1564836622, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(537, 'ex_540', 'Suscipit quaerat fugiat adipisci veritatis perspiciatis.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 530, 8, 0, 150, 1, 1563713422, 1564577422, 0, NULL, NULL, 'Cash', NULL, 0, '0'),
(538, 'velit_160', 'Placeat quisquam doloribus et enim sed eum voluptatum voluptate facere eum.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 820, 0, 9, 470, 0, 1563713422, 1564231822, 1, NULL, NULL, 'Online', NULL, 1, '0'),
(539, 'dolorem_666', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 790, 0, 17, 680, 0, 1563281422, 1564318222, 1, NULL, NULL, 'Online', NULL, 0, '0'),
(540, 'facilis_164', 'Et alias corporis labore architecto et eum repudiandae.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 510, 0, 3, 520, 1, 1563281422, 1564318222, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(541, 'est_155', 'Ullam ab dolorem voluptatem et similique veniam nisi perferendis.', 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 870, 17, 22, 400, 1, 1563713422, 1564231822, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(542, 'atque_431', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 670, 0, 22, 770, 1, 1563454222, 1564231822, 0, NULL, NULL, 'Bank Deposit', NULL, 0, '0'),
(543, 'ullam_963', 'Quis hic incidunt possimus enim id dolorum non.', 149, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 390, 37, 23, 770, 1, 1563886222, 1564663822, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(544, 'numquam_192', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 430, 4, 6, 130, 1, 1563367822, 1564145422, 0, NULL, NULL, 'Bank Deposit', NULL, 1, '0'),
(545, 'pariatur_221', NULL, 149, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 770, 43, 0, 530, 1, 1563799822, 1564145422, 0, NULL, NULL, 'Online', NULL, 1, '0'),
(546, 'perferendis_664', NULL, 149, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 650, 0, 0, 1000, 1, 1563799822, 1564231822, 0, NULL, NULL, 'Cheque', NULL, 0, '0'),
(547, 'cumque_295', 'Quisquam eum odit aperiam praesentium repellendus assumenda est est.', 149, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 910, 5, 15, 660, 0, 1563367822, 1565441422, 0, NULL, NULL, 'Cheque', NULL, 1, '0'),
(548, 'et_228', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 540, 25, 0, 970, 1, 1563972622, 1564318222, 0, NULL, NULL, 'Online', NULL, 0, '0'),
(549, 'qui_131', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 350, 0, 1, 200, 1, 1563367822, 1564318222, 0, NULL, NULL, 'Card', NULL, 0, '0'),
(550, 'perspiciatis_889', NULL, 149, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 820, 17, 21, 680, 1, 1563540622, 1564491022, 0, NULL, NULL, 'Card', NULL, 1, '0');

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
(1, 'Atque voluptatem delectus.', '74804', 'nlittle@aufderhar.com', 'repellat', 'in', '1564321351', 'et', '30 minutes', 'Recusandae nesciunt quas cum amet quis ut.'),
(2, 'Et rerum.', '21094', 'tkozey@gmail.com', 'voluptate', 'atque', '1564321351', 'nihil', '14 minutes', 'Et deleniti autem facere inventore repudiandae ut ipsam.'),
(3, 'Quod aliquid aut.', '73164', 'mfahey@hotmail.com', 'delectus', 'facere', '1564321351', 'voluptates', '6 minutes', 'Tempora eaque nemo sapiente reiciendis fuga mollitia maxime vel quo.'),
(4, 'Et occaecati corporis aperiam.', '64933', 'josiah20@gmail.com', 'et', 'delectus', '1564321351', 'delectus', '4 minutes', 'Quisquam aut omnis cumque ipsum velit aliquid quibusdam officiis atque.'),
(5, 'Atque blanditiis nemo.', '39819', 'stacey.koelpin@veum.com', 'officiis', 'cupiditate', '1564321351', 'id', '4 minutes', 'Laudantium sequi vero magni cum iure autem saepe consequatur repudiandae soluta.'),
(6, 'Et reiciendis dolore aut.', '13232', 'cbode@christiansen.com', 'eos', 'quia', '1564321351', 'vel', '8 minutes', 'Modi atque sapiente consectetur impedit officiis.'),
(7, 'Officia quis eius voluptate.', '89009', 'quigley.corine@watsica.com', 'esse', 'mollitia', '1564321351', 'in', '14 minutes', 'Quaerat maiores sit ea perspiciatis aliquam sed possimus fugit sunt.'),
(8, 'Fugiat et ea.', '19157', 'kroob@gmail.com', 'magnam', 'nobis', '1564321351', 'suscipit', '19 minutes', 'Doloribus corrupti aut doloribus ullam et itaque sunt facere sed minus quo.'),
(9, 'Doloremque repellendus.', '89083', 'trent91@kassulke.com', 'placeat', 'cupiditate', '1564321351', 'facere', '23 minutes', 'Vel non veniam quo tenetur magni sed nam quidem.'),
(10, 'Natus velit quo perspiciatis.', '74920', 'jpowlowski@osinski.net', 'culpa', 'non', '1564321351', 'pariatur', '2 minutes', 'Quis non distinctio molestiae nobis eos iste in.'),
(11, 'Ex aliquam est.', '76171', 'modesta.konopelski@fay.org', 'quia', 'mollitia', '1564321351', 'fuga', '3 minutes', 'Sunt quos placeat atque cumque cumque quo consequatur consequuntur.'),
(12, 'Dolore consequatur dolorem quas facere.', '24087', 'bhaley@hintz.com', 'quaerat', 'placeat', '1564321351', 'eligendi', '28 minutes', 'Aut ipsa cum ut totam vero qui ut et.'),
(13, 'Hic et.', '60616', 'wiegand.americo@harber.com', 'minus', 'libero', '1564321351', 'corrupti', '22 minutes', 'Aut nulla et laborum repellendus occaecati vero possimus ut.'),
(14, 'Et enim eos numquam.', '10317', 'durgan.kyra@breitenberg.com', 'ut', 'corporis', '1564321351', 'quos', '26 minutes', 'Magni quia ipsam nobis eum officia voluptates sint quis pariatur.'),
(15, 'Id qui voluptate.', '64490', 'brekke.amy@brakus.com', 'aliquam', 'qui', '1564321351', 'aliquid', '4 minutes', 'Eum ut dolorum eum rerum officia quia et deserunt.'),
(16, 'Suscipit et aut ratione.', '12760', 'santina13@langosh.com', 'nulla', 'quia', '1564321351', 'inventore', '1 minutes', 'Enim repellat qui similique quae.'),
(17, 'Est illum.', '81660', 'vlarson@gmail.com', 'veniam', 'mollitia', '1564321351', 'et', '24 minutes', 'Fuga quam deleniti qui impedit porro.'),
(18, 'Hic sed fugiat impedit.', '91824', 'jbogisich@kris.org', 'a', 'officiis', '1564321351', 'tempora', '29 minutes', 'Omnis vel autem natus quia harum quia dolores odio consectetur.'),
(19, 'Eum nostrum sed earum rerum.', '72275', 'rbogisich@hotmail.com', 'esse', 'neque', '1564321351', 'veritatis', '3 minutes', 'Rem aliquid est et velit aut eius.'),
(20, 'Quia sit consectetur iusto.', '60629', 'edwina88@yahoo.com', 'pariatur', 'ut', '1564321351', 'ut', '14 minutes', 'Sed aliquam excepturi quam aspernatur quis dolore dolor.'),
(21, 'Rerum aut ratione minima.', '50067', 'ukihn@okeefe.com', 'nobis', 'id', '1564321351', 'alias', '10 minutes', 'Quibusdam qui veritatis provident aperiam ut nihil reiciendis tempora et a.'),
(22, 'Aliquid qui ut.', '21082', 'queenie83@cartwright.info', 'voluptatum', 'aut', '1564321351', 'suscipit', '3 minutes', 'Necessitatibus vitae et debitis quis excepturi dolores.'),
(23, 'Minus provident totam delectus optio.', '96889', 'jason.schumm@kris.com', 'quia', 'nam', '1564321351', 'quaerat', '1 minutes', 'Minima rerum nostrum tenetur corporis asperiores ratione natus.'),
(24, 'Doloremque magnam tempore eaque aliquid.', '47016', 'ian68@yahoo.com', 'repellat', 'et', '1564321351', 'amet', '29 minutes', 'Eum quisquam adipisci earum cum dolorem at et molestias similique eius id aliquid enim.'),
(25, 'Voluptate esse ipsam.', '23557', 'emanuel.rau@hotmail.com', 'voluptatibus', 'consequatur', '1564321351', 'aut', '15 minutes', 'Quos voluptatem atque non odio modi voluptates corporis animi eveniet.'),
(26, 'Est enim at eveniet.', '75852', 'hsmitham@hotmail.com', 'perspiciatis', 'quasi', '1564321351', 'est', '4 minutes', 'Nemo culpa ut facere ut minima voluptas iure quia.'),
(27, 'Unde aut eum.', '17569', 'verner.frami@mcglynn.biz', 'sunt', 'tempora', '1564321351', 'atque', '25 minutes', 'Reprehenderit quod ratione dicta alias.'),
(28, 'Eum aperiam dolores non.', '28941', 'lamar70@hoeger.com', 'impedit', 'iusto', '1564321351', 'maiores', '3 minutes', 'Dolores molestiae nihil repudiandae ea eligendi.'),
(29, 'Distinctio neque eligendi necessitatibus rerum.', '19218', 'bogan.nya@fahey.com', 'rerum', 'eius', '1564321351', 'consequatur', '9 minutes', 'Qui odit adipisci facilis voluptatem ab pariatur quaerat sit.'),
(30, 'Labore veritatis ut.', '88576', 'cortney31@bergnaum.com', 'ab', 'corporis', '1564321351', 'sed', '8 minutes', 'Dolorum voluptatem qui quis minima cupiditate esse repellendus.'),
(31, 'Sit laborum.', '44965', 'esta90@mante.com', 'molestiae', 'et', '1564321351', 'sint', '19 minutes', 'Aspernatur enim perferendis aut voluptate tenetur facere vel qui.'),
(32, 'Delectus est iure error praesentium.', '37541', 'carroll.walsh@frami.org', 'blanditiis', 'autem', '1564321351', 'eveniet', '14 minutes', 'Et magni vitae aut.'),
(33, 'Nam vero.', '68084', 'rose58@huels.com', 'ut', 'illo', '1564321351', 'nulla', '22 minutes', 'Consequatur labore eos similique quos laboriosam cupiditate ipsa et dolorem facere inventore.'),
(34, 'Cupiditate quod fuga expedita.', '52884', 'mcclure.rigoberto@denesik.com', 'ad', 'earum', '1564321351', 'voluptas', '28 minutes', 'Nisi laborum praesentium nihil laudantium laboriosam suscipit adipisci.'),
(35, 'Ut libero neque doloribus.', '85684', 'stanton.josefina@shields.com', 'qui', 'minus', '1564321351', 'voluptas', '28 minutes', 'Praesentium eos vel id non labore minima aut.'),
(36, 'Similique officiis eos possimus repellendus.', '54064', 'dkeeling@yahoo.com', 'dolores', 'est', '1564321351', 'eum', '17 minutes', 'Quia sint ab aut est ut laborum.'),
(37, 'Laborum dicta sit.', '49461', 'keara.beier@gmail.com', 'aut', 'suscipit', '1564321351', 'quaerat', '7 minutes', 'Quia voluptatem repellendus ut ut in ea et.'),
(38, 'Sunt sed expedita.', '91197', 'dare.kay@hotmail.com', 'adipisci', 'cum', '1564321351', 'nostrum', '16 minutes', 'Veritatis illo voluptas accusantium omnis suscipit quam et aut beatae iusto.'),
(39, 'Ut doloremque.', '30441', 'garry.batz@yahoo.com', 'qui', 'voluptatibus', '1564321351', 'voluptas', '25 minutes', 'Dolorum ut ut dolores quaerat sed.'),
(40, 'Voluptas veniam doloribus.', '86360', 'zlockman@johnston.com', 'porro', 'enim', '1564321351', 'odio', '10 minutes', 'Et eos sint natus et quod necessitatibus illum.'),
(41, 'Praesentium doloribus et.', '74805', 'lynch.lucy@erdman.com', 'sed', 'ad', '1564321351', 'harum', '8 minutes', 'Omnis ducimus voluptatem asperiores consectetur ratione.'),
(42, 'Quae est temporibus repellendus culpa.', '36114', 'vemmerich@aufderhar.com', 'excepturi', 'eos', '1564321351', 'tenetur', '9 minutes', 'In vel velit enim et laudantium eos.'),
(43, 'Autem natus modi qui.', '61104', 'doyle.lois@yahoo.com', 'assumenda', 'labore', '1564321351', 'veritatis', '23 minutes', 'Facere sed quisquam dolorum tempore et doloribus architecto exercitationem dolores minima qui.'),
(44, 'Aut suscipit magni distinctio enim non.', '54390', 'adams.mitchell@feest.com', 'non', 'est', '1564321351', 'ab', '11 minutes', 'Corporis illum distinctio omnis reiciendis voluptates.'),
(45, 'Itaque eum culpa.', '50197', 'gino.heller@hand.biz', 'officia', 'ipsum', '1564321351', 'eligendi', '26 minutes', 'Porro aliquid quia tenetur beatae quas eligendi.'),
(46, 'Accusamus ut repudiandae.', '31631', 'richard53@gmail.com', 'repudiandae', 'rem', '1564321351', 'delectus', '5 minutes', 'Amet et dolorem voluptate et qui nihil eligendi.'),
(47, 'Mollitia aut minus.', '31793', 'sierra81@hahn.com', 'aliquid', 'explicabo', '1564321351', 'et', '16 minutes', 'Odit aperiam et quia fugiat quia ratione blanditiis numquam.'),
(48, 'Non minus impedit sint minima necessitatibus.', '53447', 'towne.arnold@yahoo.com', 'veritatis', 'quae', '1564321351', 'unde', '29 minutes', 'Aperiam placeat ut est eos sed sunt quasi excepturi.'),
(49, 'Maiores fugit suscipit.', '63961', 'botsford.diego@yahoo.com', 'et', 'dolorem', '1564321351', 'saepe', '7 minutes', 'At culpa minus quidem odit esse.'),
(50, 'Sit inventore et.', '86154', 'casper.aimee@yahoo.com', 'amet', 'adipisci', '1564321351', 'dolorem', '18 minutes', 'Earum omnis laudantium et voluptatem nemo sapiente.');

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
(1, 'voluptas', '21008', 'Alias eos ea.', 'Architecto voluptas.', 'Nostrum est dolorem sed.', '1564321353', '', 'Dolore quas praesentium ad nesciunt reprehenderit.'),
(2, 'facere', '34703', 'Temporibus est.', 'Qui nostrum.', 'Est veniam possimus recusandae error et.', '1564321353', '', 'Eum saepe ea quaerat possimus.'),
(3, 'vero', '34567', 'Non ut consequuntur.', 'Qui unde.', 'Quia exercitationem itaque facere consequatur.', '1564321353', '', 'Consequatur iure quia.'),
(4, 'sit', '12427', 'Occaecati modi.', 'Aperiam sint.', 'Mollitia nisi similique.', '1564321353', '', 'Et similique praesentium assumenda nostrum.'),
(5, 'ut', '62264', 'At vel id.', 'Adipisci dolores commodi.', 'Voluptate vel cumque eligendi quisquam eos est quod.', '1564321353', '', 'Et ut voluptatem quis.'),
(6, 'omnis', '37597', 'Fugiat.', 'Accusantium sunt.', 'Beatae magnam maiores qui sint exercitationem iure velit.', '1564321353', '', 'In nisi sed.'),
(7, 'consequatur', '23616', 'Saepe iste.', 'Eum.', 'Nesciunt in rerum quia nihil.', '1564321353', '', 'Sed quia omnis et minus dicta magni laudantium.'),
(8, 'nihil', '26155', 'Aliquam.', 'Consequatur magni.', 'Id labore in commodi vero.', '1564321353', '', 'Unde quod pariatur aut vitae.'),
(9, 'molestias', '54412', 'Quam sed.', 'Soluta dolor mollitia.', 'Soluta et explicabo rerum quos aut.', '1564321353', '', 'Necessitatibus qui architecto distinctio blanditiis.'),
(10, 'in', '68751', 'Ipsam blanditiis quas.', 'Accusantium temporibus.', 'Provident tempore reprehenderit necessitatibus.', '1564321353', '', 'Id minus doloremque id.'),
(11, 'suscipit', '86694', 'Voluptatibus.', 'Illum eum.', 'Qui excepturi qui officia architecto.', '1564321353', '', 'Vero quia sit ad.'),
(12, 'aut', '16627', 'Ut.', 'Voluptate accusantium.', 'At sequi eligendi distinctio quam et.', '1564321353', '', 'Saepe voluptate assumenda voluptas eos.'),
(13, 'cum', '44171', 'Nobis dolore laboriosam.', 'Placeat est voluptatem.', 'Iure iusto fugit laboriosam.', '1564321353', '', 'Beatae ducimus voluptates.'),
(14, 'blanditiis', '30524', 'Rem.', 'Perspiciatis nam hic.', 'Amet et ipsam exercitationem illum.', '1564321353', '', 'Molestiae ea vero rerum magnam.'),
(15, 'dolores', '46616', 'Quod molestiae earum.', 'Consequuntur illo consequatur.', 'In voluptatem quaerat reiciendis nihil at modi.', '1564321353', '', 'Consequatur hic ducimus odit eligendi cum.'),
(16, 'fugiat', '37634', 'Et.', 'Rerum consectetur.', 'Ut nostrum vitae ut quis.', '1564321353', '', 'Nobis odio laboriosam velit veritatis.'),
(17, 'non', '94265', 'Error quidem.', 'Eveniet est.', 'Incidunt a ullam quis.', '1564321353', '', 'Eaque et ratione ratione.'),
(18, 'optio', '74398', 'Sit hic incidunt.', 'Eligendi pariatur dolorem.', 'Cum reprehenderit dolor enim.', '1564321353', '', 'Tempora facilis voluptas.'),
(19, 'cum', '23766', 'Sit.', 'Vero.', 'Est ad ratione autem.', '1564321353', '', 'Eos sapiente cumque.'),
(20, 'neque', '28170', 'Cum eum.', 'Omnis architecto.', 'Distinctio est est vitae ad dicta accusantium laboriosam ut.', '1564321353', '', 'Nostrum possimus sequi adipisci adipisci rerum.'),
(21, 'sit', '25842', 'Non et.', 'Et.', 'Id fuga maxime et.', '1564321353', '', 'Architecto omnis et molestias.'),
(22, 'tempore', '68246', 'Tenetur illum.', 'Fugiat maxime.', 'Temporibus dolorem corporis et aliquam eaque magni.', '1564321353', '', 'Aut et maxime nulla est nostrum.'),
(23, 'est', '17807', 'Blanditiis voluptate.', 'Architecto qui.', 'Nostrum illum nulla recusandae.', '1564321353', '', 'Tempore ea illum sint fuga qui nobis vero.'),
(24, 'deleniti', '31875', 'Ea atque.', 'Fuga.', 'Illum accusantium deleniti et adipisci id.', '1564321353', '', 'Quia laboriosam reprehenderit atque ut optio.'),
(25, 'omnis', '41565', 'Voluptatum sit.', 'Dolore accusamus praesentium.', 'Hic dolor voluptas quis libero eos.', '1564321353', '', 'Adipisci occaecati rerum voluptas dolorum.'),
(26, 'non', '67885', 'At voluptatem atque.', 'Voluptas aut hic.', 'Ullam laudantium alias veritatis.', '1564321353', '', 'Commodi hic ab culpa.'),
(27, 'dolores', '60392', 'Ipsam sequi.', 'Non debitis assumenda.', 'Veritatis veritatis animi quia.', '1564321353', '', 'Tempora corporis ut et.'),
(28, 'omnis', '34162', 'Tenetur consequatur.', 'Sit.', 'Culpa odit voluptate eius hic.', '1564321353', '', 'Quis atque tempora ea.'),
(29, 'consequatur', '82538', 'Molestiae eos.', 'Accusamus.', 'Consequuntur veritatis rem exercitationem voluptas reprehenderit assumenda sed sit.', '1564321353', '', 'Aut eveniet et aliquam rerum ad assumenda.'),
(30, 'qui', '29197', 'Sit.', 'Iusto amet.', 'Laborum voluptas rerum iste quam.', '1564321353', '', 'Quaerat at.'),
(31, 'incidunt', '48223', 'Commodi aut quasi.', 'Doloribus debitis.', 'Exercitationem soluta hic pariatur.', '1564321353', '', 'Sunt corporis nostrum iure.'),
(32, 'et', '17784', 'Ea.', 'Deserunt dolorem.', 'Ducimus eaque itaque ab quidem est nostrum.', '1564321353', '', 'Et tempora dolores est facilis enim fugit et molestiae.'),
(33, 'aliquam', '47297', 'Quo.', 'Consectetur porro.', 'Necessitatibus soluta et.', '1564321353', '', 'Qui et libero incidunt assumenda.'),
(34, 'consequatur', '94308', 'Laborum nihil at.', 'Autem.', 'Possimus iusto sed quaerat.', '1564321354', '', 'Voluptatibus odit animi ipsum illo.'),
(35, 'exercitationem', '42561', 'Quasi vel.', 'Magni autem.', 'Assumenda ea autem ipsum praesentium aut corrupti qui.', '1564321354', '', 'Doloribus doloribus aut rerum.'),
(36, 'ut', '53254', 'Molestiae.', 'Sit nobis commodi.', 'Rerum maxime voluptatum dolores enim.', '1564321354', '', 'Eum rem odio facilis saepe aut.'),
(37, 'qui', '53658', 'Iusto.', 'Cumque.', 'Exercitationem enim ipsa autem commodi eveniet est.', '1564321354', '', 'Explicabo eos est culpa aut.'),
(38, 'eligendi', '86113', 'Ipsam quo similique.', 'Nihil.', 'Id ad.', '1564321354', '', 'Dolores non hic incidunt.'),
(39, 'tempora', '96614', 'Sit.', 'Facere fugiat.', 'Sint eius assumenda voluptatem dolore aut.', '1564321354', '', 'Fugiat cum id eum vel.'),
(40, 'dignissimos', '75203', 'Nemo sed.', 'Voluptatem eveniet.', 'Reprehenderit officia quibusdam.', '1564321354', '', 'Porro aliquid quis aspernatur recusandae aut sint.'),
(41, 'nam', '84936', 'Sint deserunt aliquid.', 'Beatae et.', 'Ut consequatur laudantium reiciendis.', '1564321354', '', 'Ducimus ut dolorem eos eius praesentium pariatur.'),
(42, 'id', '52001', 'At eveniet.', 'Animi officia voluptatem.', 'Aperiam et earum cupiditate.', '1564321354', '', 'Et aperiam libero ut quis nihil molestiae dignissimos.'),
(43, 'laboriosam', '74903', 'Illo voluptatibus.', 'Ad.', 'Architecto rerum iste sunt necessitatibus blanditiis et.', '1564321354', '', 'Maiores ipsa suscipit officiis sunt assumenda quo nam.'),
(44, 'ea', '74529', 'Enim.', 'Dolor tempore.', 'Numquam ab qui harum necessitatibus.', '1564321354', '', 'Eligendi quos delectus eos ut accusamus.'),
(45, 'velit', '82348', 'Voluptas accusamus.', 'Voluptate id.', 'Occaecati doloribus dolores.', '1564321354', '', 'Blanditiis dolorum praesentium suscipit.'),
(46, 'nesciunt', '69901', 'Molestiae.', 'Dolor.', 'Sed adipisci quidem quos.', '1564321354', '', 'Nulla est similique dolorem.'),
(47, 'rerum', '98434', 'Amet ea.', 'Eos eaque fugit.', 'Molestiae sit possimus ab.', '1564321354', '', 'Reiciendis ut laudantium accusantium quidem.'),
(48, 'eos', '44864', 'Sunt magni.', 'Dignissimos et.', 'Repellat a reiciendis exercitationem nihil dignissimos.', '1564321354', '', 'Doloribus illo iste eum.'),
(49, 'optio', '41669', 'Dolor nemo.', 'Aut dolores sit.', 'Mollitia et omnis aut quam.', '1564321354', '', 'Rerum doloribus esse molestiae accusantium repellat.'),
(50, 'quia', '54670', 'Repellendus accusamus.', 'Dolores sint.', 'Necessitatibus quo accusamus porro ab optio numquam.', '1564321354', '', 'Ut et voluptates nam.');

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
(5, 'Teacher', 'Default role for teachers', 'teacher', '[\"classes.list\",\"Subjects.list\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"Assignments.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"classSch.list\",\"trans_vehicles.list\",\"depart.list\",\"desig.list\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"Library.Download\",\"Vacation.reqVacation\",\"Vacation.myVacation\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"academicyears.list\",\"classes.list\",\"events.list\",\"gradeLevels.list\",\"mobileNotifications.sendNewNotification\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"studyMaterial.Download\",\"studyMaterial.delMaterial\",\"studyMaterial.addMaterial\",\"studyMaterial.editMaterial\",\"staticPages.list\",\"mediaCenter.View\",\"students.list\",\"students.Attendance\",\"students.delStudent\",\"students.editStudent\"]'),
(6, 'Student', 'Default role for students', 'student', '[\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Library.Download\",\"Vacation.myVacation\",\"Homework.list\",\"academicyears.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"Homework.Download\",\"Invoices.list\",\"Invoices.View\",\"Subjects.list\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
(7, 'Parents', 'Default role for Parents', 'parent', '[\"studyMaterial.Download\",\"classes.list\",\"Subjects.list\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Homework.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Transportation.list\",\"newsboard.list\",\"Invoices.list\",\"Invoices.View\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"academicyears.list\",\"students.list\",\"students.Attendance\",\"students.Marksheet\",\"Homework.Answers\",\"Homework.Download\",\"Library.list\",\"Polls.list\",\"complaints.View\",\"complaints.add_complaint\",\"complaints.list\",\"complaints.del_complaint\",\"complaints.Download\",\"complaints.edit_complaint\",\"complaints.Export\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
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
  `classId` int(11) NOT NULL,
  `classTeacherId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `sectionName`, `classId`, `classTeacherId`) VALUES
(1, 'non Sec', 7, '[\"58\",\"98\",\"77\",\"89\"]'),
(2, 'porro Sec', 4, '[\"77\",\"74\",\"72\",\"92\",\"61\",\"80\",\"67\"]'),
(3, 'aut Sec', 3, '[\"102\",\"60\"]'),
(4, 'sed Sec', 1, '[\"58\",\"70\",\"88\"]'),
(5, 'id Sec', 7, '[\"77\",\"86\",\"101\",\"67\"]'),
(6, 'qui Sec', 3, '[\"90\",\"60\"]'),
(7, 'ea Sec', 7, '[\"67\",\"98\",\"89\",\"99\",\"95\",\"86\"]'),
(8, 'dolorem Sec', 2, '[\"79\",\"69\"]'),
(9, 'nesciunt Sec', 10, '[\"68\",\"91\",\"102\",\"87\",\"55\"]'),
(10, 'consequatur Sec', 10, '[\"91\",\"85\",\"88\",\"72\",\"73\"]'),
(11, 'voluptatibus Sec', 4, '[\"97\",\"67\",\"61\",\"92\",\"58\",\"77\",\"68\"]'),
(12, 'alias Sec', 2, '[\"69\",\"91\",\"79\"]'),
(13, 'laboriosam Sec', 4, '[\"97\",\"67\",\"74\",\"77\"]'),
(14, 'possimus Sec', 3, '[\"59\",\"90\",\"58\",\"57\"]'),
(15, 'cum Sec', 5, '[\"86\",\"88\",\"70\",\"79\",\"75\",\"99\"]'),
(16, 'animi Sec', 6, '[\"79\",\"70\",\"81\",\"57\",\"83\"]'),
(17, 'adipisci Sec', 9, '[\"62\",\"78\",\"72\"]'),
(18, 'corporis Sec', 7, '[\"61\",\"98\",\"89\",\"67\"]'),
(19, 'sit Sec', 7, '[\"101\",\"98\",\"95\",\"93\",\"66\",\"77\"]'),
(20, 'ut Sec', 5, '[\"99\",\"85\",\"89\",\"70\"]'),
(21, 'vitae Sec', 1, '[\"79\",\"69\",\"58\",\"90\"]'),
(22, 'ipsum Sec', 1, '[\"79\",\"90\",\"70\",\"69\"]'),
(23, 'et Sec', 1, '[\"72\",\"54\",\"69\"]'),
(24, 'qui Sec', 4, '[\"68\",\"97\",\"72\",\"67\"]'),
(25, 'neque Sec', 9, '[\"91\",\"78\",\"72\"]'),
(26, 'porro Sec', 8, '[\"97\",\"68\",\"70\",\"85\"]'),
(27, 'porro Sec', 3, '[\"68\",\"58\"]'),
(28, 'praesentium Sec', 9, '[\"78\",\"92\"]'),
(29, 'illum Sec', 1, '[\"69\",\"58\",\"72\"]'),
(30, 'consequatur Sec', 4, '[\"92\",\"75\",\"77\",\"80\"]'),
(31, 'cum Sec', 9, '[\"78\",\"91\",\"92\"]'),
(32, 'quos Sec', 4, '[\"80\",\"100\",\"77\",\"74\"]'),
(33, 'et Sec', 8, '[\"76\",\"68\",\"81\",\"78\",\"97\",\"70\"]'),
(34, 'qui Sec', 6, '[\"57\",\"59\",\"83\",\"70\",\"98\"]'),
(35, 'rerum Sec', 6, '[\"61\",\"91\",\"85\",\"55\",\"94\"]'),
(36, 'tempora Sec', 10, '[\"88\",\"91\",\"55\",\"75\",\"72\",\"81\",\"85\"]'),
(37, 'consectetur Sec', 7, '[\"95\",\"58\",\"66\",\"98\",\"86\",\"77\"]'),
(38, 'tenetur Sec', 9, '[\"72\",\"62\"]'),
(39, 'dignissimos Sec', 8, '[\"78\",\"97\",\"85\",\"76\"]'),
(40, 'ullam Sec', 1, '[\"72\",\"70\",\"88\"]'),
(41, 'voluptate Sec', 9, '[\"84\",\"92\",\"72\"]'),
(42, 'id Sec', 8, '[\"99\",\"81\",\"84\",\"55\",\"70\",\"76\"]'),
(43, 'doloremque Sec', 1, '[\"88\",\"58\",\"72\"]'),
(44, 'suscipit Sec', 7, '[\"58\",\"99\",\"89\",\"98\",\"66\",\"67\"]'),
(45, 'ullam Sec', 4, '[\"97\",\"80\",\"77\",\"100\"]'),
(46, 'laboriosam Sec', 1, '[\"72\",\"88\",\"69\"]'),
(47, 'sed Sec', 2, '[\"91\",\"69\",\"73\"]'),
(48, 'est Sec', 5, '[\"86\",\"101\",\"72\",\"85\",\"80\",\"70\"]'),
(49, 'ducimus Sec', 4, '[\"92\",\"72\",\"75\",\"67\",\"61\",\"68\",\"74\"]'),
(50, 'magnam Sec', 9, '[\"92\",\"62\"]');

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
(53, 'parentsSort', 'id + 0 ASC'),
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
(1, 'Home', 'Omnis eligendi necessitatibus qui recusandae harum deserunt neque ipsum molestias quod qui omnis error perspiciatis dolorem saepe impedit.', 1),
(2, 'About us', 'Exercitationem cum sint omnis suscipit aspernatur.', 1),
(3, 'CMS', 'Nihil dolore autem aut autem ea et molestiae officia libero.', 1),
(4, 'Sections', 'Voluptates sed ea rem porro ut saepe sit vitae facilis quaerat illum accusantium ut quisquam officiis corporis quos pariatur laborum et dolor.', 1),
(5, 'Subjects', 'Et adipisci possimus sunt officia quo recusandae natus vel dicta vitae asperiores et repellendus voluptas.', 1);

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
(1, 'Ut.', 'Voluptas qui repudiandae esse consequatur ducimus accusamus repellendus nemo rerum et facilis id.'),
(2, 'Corporis enim.', 'Commodi voluptas et quia non deserunt saepe ducimus et magni ipsum et laboriosam aut et cum dolores eius.'),
(3, 'Fuga expedita.', ''),
(4, 'Vero.', 'Natus similique sit officiis sed dolorem dignissimos et saepe commodi quasi similique in.'),
(5, 'Vero.', 'Ducimus exercitationem in asperiores et molestiae aut necessitatibus ab id itaque error magni architecto suscipit nihil ipsa magnam rem iure.'),
(6, 'Voluptatem voluptatem.', 'Voluptatem est nesciunt minima et voluptas ullam at nihil itaque quo ipsa consequuntur vitae.'),
(7, 'Odit ipsa.', 'Culpa at cum odit sint itaque corporis omnis architecto dolor provident maxime fuga.'),
(8, 'Quis distinctio.', 'Reprehenderit beatae accusamus sint incidunt natus molestias rem fugit voluptas.');

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
(1, 'Inventore cupiditate.', '', '', '[\"8\",\"1\",\"9\"]', '[\"43\"]', 15, 57),
(2, 'Sed et.', '', '', '[\"8\"]', '[\"22\",\"4\",\"29\"]', 7, 76),
(3, 'Voluptatem sit rem.', '', '', '[\"2\"]', '[\"36\"]', 10, 54),
(4, 'Et.', '', '', '[\"5\"]', '[\"39\"]', 6, 89),
(5, 'Culpa.', '', '', '[\"8\"]', '[\"49\",\"23\",\"28\"]', 14, 89),
(6, 'Commodi.', '', '', '[\"2\"]', '[\"7\",\"40\",\"28\"]', 13, 88),
(7, 'Ad laborum.', '', '', '[\"3\"]', '[\"21\",\"17\"]', 8, 104),
(8, 'Qui alias dolorum.', '', '', '[\"9\",\"2\",\"3\"]', '[\"17\",\"29\"]', 7, 76),
(9, 'Non vel.', '', '', '[\"3\",\"6\"]', '[\"48\",\"25\"]', 14, 60),
(10, 'Debitis atque cum.', '', '', '[\"7\"]', '[\"27\",\"40\",\"18\"]', 6, 84),
(11, 'Magnam dolores eligendi.', '', '', '[\"1\"]', '[\"43\",\"4\"]', 12, 81),
(12, 'Et at.', '', '', '[\"9\"]', '[\"33\",\"40\",\"34\"]', 9, 82),
(13, 'Optio.', '', '', '[\"7\",\"6\"]', '[\"19\",\"38\",\"31\"]', 15, 88),
(14, 'Officia nobis.', '', '', '[\"4\",\"1\",\"9\"]', '[\"39\",\"5\",\"4\"]', 9, 99),
(15, 'Est qui.', '', '', '[\"2\",\"3\"]', '[\"29\",\"42\"]', 3, 76);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `subjectTitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `passGrade` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `finalGrade` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `teacherId` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subjectTitle`, `passGrade`, `finalGrade`, `teacherId`) VALUES
(1, 'Nostrum vero est.', '50', '80', '[\"87\",\"72\",\"64\",\"83\",\"77\",\"81\",\"62\",\"86\",\"55\",\"97\",\"76\",\"68\",\"93\",\"82\",\"63\"]'),
(2, 'Quam porro impedit.', '30', '90', '[\"55\",\"91\",\"86\",\"56\",\"93\",\"64\",\"73\",\"78\",\"85\",\"98\",\"97\",\"84\"]'),
(3, 'Nihil voluptatem.', '30', '60', '[\"70\",\"89\",\"73\",\"87\",\"81\",\"98\",\"60\",\"76\",\"54\",\"90\",\"57\",\"68\",\"94\"]'),
(4, 'Repellendus eum.', '20', '90', '[\"75\",\"98\",\"60\",\"61\",\"63\",\"96\",\"74\"]'),
(5, 'Reprehenderit voluptatem.', '10', '60', '[\"63\",\"55\",\"80\",\"64\",\"54\",\"87\",\"74\",\"101\",\"65\",\"102\",\"86\",\"77\"]'),
(6, 'Laboriosam.', '40', '80', '[\"84\",\"103\",\"97\",\"69\",\"79\",\"75\",\"85\",\"99\",\"71\",\"59\"]'),
(7, 'Facilis.', '40', '80', '[\"75\",\"59\",\"82\",\"80\",\"56\",\"73\",\"65\",\"99\",\"86\",\"97\",\"61\",\"81\",\"67\"]'),
(8, 'Laudantium eos.', '40', '90', '[\"56\",\"92\",\"98\",\"102\",\"61\",\"91\",\"90\",\"55\",\"63\"]'),
(9, 'Officia dicta provident.', '40', '70', '[\"56\",\"91\",\"96\",\"58\",\"89\",\"93\",\"84\",\"85\",\"87\"]'),
(10, 'Officiis.', '10', '60', '[\"55\",\"93\",\"64\",\"92\",\"78\",\"103\",\"70\",\"56\"]'),
(11, 'Ad consequatur fuga.', '50', '90', '[\"76\",\"89\",\"79\",\"55\",\"69\",\"103\",\"77\",\"80\",\"96\",\"83\",\"104\",\"66\",\"68\",\"101\",\"58\"]'),
(12, 'Hic optio velit.', '50', '90', '[\"62\",\"98\",\"73\",\"56\",\"69\",\"100\",\"80\"]'),
(13, 'Ut.', '30', '80', '[\"54\",\"84\",\"61\",\"78\",\"68\",\"60\",\"102\"]'),
(14, 'Eligendi.', '40', '60', '[\"80\",\"63\",\"55\",\"61\",\"71\",\"59\",\"73\",\"103\",\"104\",\"88\",\"84\",\"66\",\"98\"]'),
(15, 'Voluptates quae.', '20', '80', '[\"94\",\"58\",\"103\",\"60\",\"83\",\"97\",\"77\",\"56\",\"66\",\"63\",\"92\",\"67\",\"102\",\"71\"]');

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
(1, 'Nihil non.', '', '[\"5\",\"9\"]', '680'),
(2, 'Voluptatem error.', '', '[\"2\"]', '790'),
(3, 'Molestias.', '', '[\"7\",\"6\",\"9\"]', '690'),
(4, 'Blanditiis.', '', '[\"10\",\"9\"]', '850'),
(5, 'Voluptas sed.', '', '[\"7\"]', '620'),
(6, 'Cum maiores.', '', '[\"4\",\"5\"]', '520'),
(7, 'Minus.', '', '[\"7\",\"3\",\"1\"]', '580'),
(8, 'Asperiores aut.', '', '[\"6\"]', '830'),
(9, 'A qui.', '', '[\"7\",\"5\",\"10\"]', '600'),
(10, 'Molestiae.', '', '[\"3\"]', '640'),
(11, 'Id amet.', '', '[\"10\",\"6\"]', '680'),
(12, 'Aut.', 'Qui ut.', '[\"1\",\"6\"]', '710'),
(13, 'Soluta.', '', '[\"7\",\"10\",\"6\"]', '710'),
(14, 'Voluptatem.', 'Voluptas quis modi beatae sed.', '[\"4\",\"3\",\"2\"]', '580'),
(15, 'Cupiditate.', 'Quos consectetur.', '[\"3\",\"6\",\"2\"]', '680');

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
(1, '7854', '', 'a', 'Dr. Clemmie Harris PhD', '', '264974221768238', 'Sed assumenda error.', 'Sapiente unde eveniet ipsam.'),
(2, '9856', '', 'iusto', 'Modesta Huel', '', '962281099699603', 'Cupiditate iste vel accusantium natus.', 'Vel quam sit molestiae voluptates.'),
(3, '8870', '', 'dicta', 'Earline Paucek', '', '997013255584740', 'Ratione inventore earum.', 'Sed eaque eaque ipsum magnam voluptatem.'),
(4, '6862', '', 'sit', 'Mr. Aurelio Dicki MD', '', '933152752328641', 'Asperiores eum ratione.', 'Consequuntur qui pariatur rerum.'),
(5, '9535', '', 'earum', 'Nelson Lakin I', '', '498094912935211', 'Consequatur at quo.', 'Voluptates sequi numquam et.'),
(6, '4334', '', 'sed', 'Robb White', '', '506787143788844', 'Corporis recusandae voluptatem sunt.', 'Consequatur porro consequatur suscipit repellat accusamus culpa.'),
(7, '9050', '', 'sed', 'Rachel Bednar', '', '548423908869260', 'Natus alias est.', 'Exercitationem aliquam impedit.'),
(8, '9539', '', 'quia', 'Junius Daniel', '', '658711169495926', 'Perferendis aliquam molestiae eos.', 'Reprehenderit quae et praesentium vel sed consequatur.'),
(9, '2550', '', 'rerum', 'Mr. Easton Medhurst DDS', '', '993758742682725', 'Unde rerum reiciendis.', 'Quis quaerat laboriosam asperiores quisquam voluptatum architecto consequatur.'),
(10, '4262', '', 'quos', 'Jay Bergstrom', '', '619746299462311', 'Quisquam debitis et cumque.', 'Aut accusantium voluptatibus commodi quia iusto qui.');

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
(1, 'ahmedsk', 'terence.wuckert@yahoo.com', '$2y$10$oim743aDozKUItI9NQW5AOmUnCpzOmN1vLEopPQ2jkPtItJm2c3tu', 'fvZMR6drFas5G5g5yAB2xgdGGDEFFgdGw8JquZOyyd5l02x8TqGGhYKxxWAn', 'Ahmed Sayed', 'admin', 2, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '830184', '+69 1794595', 0, 0, '', NULL, '', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(2, 'virtu', 'morgan.lockman@zemlak.biz', '$2y$10$uu5zrm12hdHSFcRJNYX8ce6m2WzvrUabyvOWtB3sQUmqToV9hCCYK', '', 'Virtu', 'admin', 2, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '329009', '+22 1414920', 0, 0, '', NULL, '', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'employee', 'grayson25@hotmail.com', '$2y$10$/wUNVIDIoBHI2RzzHKTspOOR.47WtTvGEyx.qNAKyPdTTBTEAGkh2', '', '[Em] Cullen Vandervort Sr.', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '422993', '+88 9590489', 0, 0, '', NULL, '', '018.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'fgleason', 'vpfannerstill@hotmail.com', '$2y$10$TIZqx0fbEMt85d8PEs0oMOmfYfGdbKM2IMc8aDDCYEUXJiA5XHz/a', '', '[Em] Paris Hansen', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '259810', '+40 2517390', 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'rutherford.janiya', 'frida92@kirlin.info', '$2y$10$UVlkYucOfjnyPaQs8XPXrufgVvplgZGR6ZfiLRAvmaw9ks4TF86..', '', '[Em] Dr. Arnoldo Abernathy PhD', 'employee', 14, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '814855', '+43 2845234', 0, 0, '', NULL, '', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'marcelino05', 'trey63@yahoo.com', '$2y$10$sxFg2EHj/ImAUh9hjjZl7eS.9qF1MenYUvYXoVJ3lHRapGC2Bv/aa', '', '[Em] Dr. Gertrude Tremblay V', 'employee', 10, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '941368', '+20 5488123', 0, 0, '', NULL, '', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'jamal.hill', 'lila.reichert@wintheiser.com', '$2y$10$9jVDDJ8K047.BG8ACXiyW.lgpcDEBRP.cYsnav2bRNpqKhoBSdwuq', '', '[Em] Deanna Marquardt', 'employee', 11, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '552232', '+83 3570369', 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'swill', 'frosenbaum@gmail.com', '$2y$10$fkdyT21iU5LP5ICwbOeFB.l/LhIfr7pOIiOqzns9Cj7WkTCZShmPK', '', '[Em] Erin O\'Hara', 'employee', 14, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '540493', '+77 3069838', 0, 0, '', NULL, '', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'mckenzie.marguerite', 'rodriguez.angel@hackett.com', '$2y$10$c2K30iN1588YvgUG6UIfSeadjVwd64C8yL.qxWsbA44G6.s/IoWzS', '', '[Em] Andres Langworth', 'employee', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '959944', '+44 3744017', 0, 0, '', NULL, '', '066.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'angel.dicki', 'drunolfsdottir@graham.com', '$2y$10$n7b.sTrfjhakTgunYRgoveUgjd9DpICLpZ7tLUeEPSGZe9aHoFGBe', '', '[Em] Margarete Dickinson', 'employee', 10, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '538066', '+90 1656203', 0, 0, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'doris90', 'kelli.kovacek@hotmail.com', '$2y$10$qVxJx55ZxP886kL9J3P/D.UQ/rIA9FyuMDzYh..lnteZPGx9NGzlK', '', '[Em] Callie Davis', 'employee', 14, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '195335', '+27 7070574', 0, 0, '', NULL, '', '03.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'owen37', 'jesse.feest@hotmail.com', '$2y$10$jo5PSj.0YDAhlLlzx3bWgOFWOQEivX4OMM8gY/Vw272b.uX9fCdjO', '', '[Em] Yolanda Von MD', 'employee', 11, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '419727', '+27 7887265', 0, 0, '', NULL, '', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'rritchie', 'pagac.flossie@gmail.com', '$2y$10$DPyUMf8s0zN.HzTovBdgMeQN4CJyMg4SLb26TxoibcDwqcy.i15sK', '', '[Em] Brielle Murazik', 'employee', 3, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '740783', '+11 5024011', 0, 0, '', NULL, '', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'jhill', 'kohler.llewellyn@gmail.com', '$2y$10$TPa1jKHose/vAriu6noWMOz.3hDwpLVo4zkEN6jpVPayU6AtaG65e', '', '[Em] Curt Nikolaus', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '257982', '+77 7734477', 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'aletha83', 'sophia.jacobs@douglas.com', '$2y$10$SavlgnwsFg1O.vdScmPyrOEnHa0FdMxp9ybnYeKMEE/K1uiVpXR8a', '', '[Em] Joan Dare', 'employee', 14, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '244707', '+12 3044378', 0, 0, '', NULL, '', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'huel.ressie', 'vshanahan@goodwin.biz', '$2y$10$0DdNcPI4cw4BfL.rZO24lemTwSqaoOnoN61ENjjeIKbYhfacfeI4i', '', '[Em] Santa Crooks', 'employee', 10, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '625258', '+56 2232376', 0, 0, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'xschumm', 'shana.corkery@gmail.com', '$2y$10$UUZU74Vg/uvOUg4ZazZ1pubkL8sVaI1BHBr6CQLU.2qOK2aMm4RVW', '', '[Em] Prof. Felton Kiehn', 'employee', 8, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '464769', '+76 8599446', 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'jsanford', 'ymoore@ruecker.info', '$2y$10$k/AMuY5HdYJaw/g1ufmNEeuNOOzfE5McAhapHwqL31pmzCPHBKzLm', '', '[Em] Ariane Schaefer', 'employee', 4, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '879660', '+16 3751042', 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'iwehner', 'vandervort.isaac@ortiz.com', '$2y$10$Q9Z1v4jN7ur3.RXJzlbe2u9IN8SEdcUaNScBV5bwG5km6awpitEza', '', '[Em] Dr. Flavio Paucek', 'employee', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '697607', '+17 8425483', 0, 0, '', NULL, '', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'pfannerstill.bernadette', 'okeefe.viola@yahoo.com', '$2y$10$ij9/S87nyV9Gzkj8hGqsSOplIs1pup0dPMhZEXtVKCcLTghIApSnG', '', '[Em] Aurelio Hyatt IV', 'employee', 11, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '253729', '+73 9813495', 0, 0, '', NULL, '', '037.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'emmanuelle73', 'hulda.gleichner@gmail.com', '$2y$10$P9vAKtQWk3ve3KTDDIitDOrDqhM8cjLutXJmD1F8ECyjqrTOwrdGq', '', '[Em] Ryann Mohr', 'employee', 13, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '956203', '+98 6989369', 0, 0, '', NULL, '', '060.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'cary.reynolds', 'percy39@funk.com', '$2y$10$3aBjW.5T7BQqAqK9jkoMKuzjvbNQDgV.RjjP1PizyvYQfDDzTTHU.', '', '[Em] Prof. Guadalupe Durgan IV', 'employee', 8, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '587261', '+16 5527228', 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'frederic55', 'raina70@hermiston.com', '$2y$10$jfRch6xFqtdOz5qbC/N0o.gFc1vJd7YSsEkxRC9CH3dslAzTtoiIO', '', '[Em] Braxton Braun', 'employee', 8, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '357657', '+62 2232862', 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'marcia.borer', 'samara47@yahoo.com', '$2y$10$upgEB87Jpe.shJevND/bMuG5F8WZYstcG1N1YMKSUVW5QiTyIbbhK', '', '[Em] Timmothy Glover', 'employee', 13, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '704194', '+73 2407958', 0, 0, '', NULL, '', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'wmacejkovic', 'skunde@carroll.com', '$2y$10$MLZfQhP2OTSORPVqncVOJuRmkJjm3FxVnpMnsS5Oha0nEXzYV/kqS', '', '[Em] Mr. Gust Friesen DDS', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '971079', '+37 6483895', 0, 0, '', NULL, '', '066.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'pkshlerin', 'orn.joanne@gmail.com', '$2y$10$ya4wuiXgShI2Tcc268rq8.nfox2JQRkuOk3VtlT7FkX2frzT0/02C', '', '[Em] Mrs. Chelsie Barton PhD', 'employee', 14, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '766339', '+24 9968508', 0, 0, '', NULL, '', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'verda90', 'gonzalo73@gmail.com', '$2y$10$xzHy3m3R/6b7TfJjj8nQk.eaEtlrkMhJYfiuM/ftnS.3sSLBK0iKa', '', '[Em] Agustin Kuhn', 'employee', 14, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '121675', '+62 7548423', 0, 0, '', NULL, '', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'winston77', 'wdicki@nienow.com', '$2y$10$z9T647jsk7zrMayISi81WuKV0S.6BQ0xwADpzNTMgEyqbS9bjolAu', '', '[Em] Dr. Neha Grimes', 'employee', 9, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '506074', '+68 5511050', 0, 0, '', NULL, '', '090.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'klein.nichole', 'ycarter@hotmail.com', '$2y$10$O6hQimXaCBBdQ5yzc2FYLOOmbY8rRlOObO3w00msjC/quofEyPV3G', '', '[Em] Olga Kiehn', 'employee', 8, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '470934', '+77 3414859', 0, 0, '', NULL, '', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'zheaney', 'lindgren.brittany@yahoo.com', '$2y$10$P7fAWkk3eKXOKSKP6TnYqugIjuvtrn4ubdq9T9cDm8JfEPcI.fPu2', '', '[Em] Mr. Jaylin Considine', 'employee', 13, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '578995', '+91 7798192', 0, 0, '', NULL, '', '079.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'vicente69', 'gorczany.tevin@gmail.com', '$2y$10$Q8PAB/OBltmOgoatreXE2uhAfiy5SwwRX/qdsOsDt/Zqgi3g9cnIy', '', '[Em] Emerson Weber', 'employee', 4, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '256042', '+57 3831150', 0, 0, '', NULL, '', '057.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'margie.wunsch', 'lfadel@legros.com', '$2y$10$AyFXOnPqqXfBIRB2XNGRheUoF4Z/3xZ/.RJZl/OYeD7pze2qp3A7e', '', '[Em] Miss Yvonne Crona', 'employee', 10, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '522806', '+89 7837352', 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'bgorczany', 'friesen.kameron@grady.com', '$2y$10$JBsuRPqHGNNFdK852Yh47u0B8NirKfnZ899lAcSiiHk3MXdsYSQHi', '', '[Em] Anastasia Murray', 'employee', 8, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '815013', '+58 1387650', 0, 0, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'trantow.madelyn', 'wwalsh@goyette.org', '$2y$10$OZQEdINQ3MSRLK/9MfPLl.btK7m68tDKnn4yZbXqhc2U6uNKABHQ.', '', '[Em] Marisa Legros', 'employee', 11, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '659641', '+70 5102819', 0, 0, '', NULL, '', '07.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'destin55', 'wdooley@langworth.com', '$2y$10$SjhziUWgqq.IvP0AsHsnR.tPEdMRH8HgcoskwXmzvm1l1Wi/kzA5m', '', '[Em] Lucio Pollich', 'employee', 3, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '712325', '+35 2116157', 0, 0, '', NULL, '', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'rbergnaum', 'kaycee41@gmail.com', '$2y$10$nyH6qWpjix8l3ivzE4ykE.KUENTWuT6ISB33Pku2YBKPPpht7y1Te', '', '[Em] Marcellus Lemke', 'employee', 13, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '136836', '+77 3689673', 0, 0, '', NULL, '', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'maximillia.keeling', 'brad.streich@hartmann.com', '$2y$10$cYwDxJOHsxwQI0qCJJRZSekXuN15UdIVZb7k40du.UZ8/umMu9sg.', '', '[Em] Dallas Steuber DVM', 'employee', 4, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '555704', '+36 1998949', 0, 0, '', NULL, '', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'wendy63', 'eleanore22@hotmail.com', '$2y$10$Gu3.4nQxWuc/L8/pVEljSeNNLHRiq7jXM91ebcdckMW1QNxewkZuy', '', '[Em] Dr. Rodrigo Wolf', 'employee', 4, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '716043', '+46 8781042', 0, 0, '', NULL, '', '017.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'ole17', 'lwalker@hotmail.com', '$2y$10$BM8QtYhndGpkVE.b8e3/Ge1qqKeJh3BI7mqKuR1uSvasnkXd8eQV2', '', '[Em] Taylor Lowe', 'employee', 4, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '631721', '+23 5479779', 0, 0, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'ebeatty', 'anthony.grimes@gleichner.net', '$2y$10$xItrZgF5EwPZ7dSbl7IRZ.pJXmmhTtU/rnqxBXNz.XIf2lCQrgUM.', '', '[Em] Miss Lila Schinner', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '162444', '+60 2452890', 0, 0, '', NULL, '', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'alessia.powlowski', 'georgette23@gmail.com', '$2y$10$sZUpQNRekvR8U4Rl31wmh.ITTOYOcE7xvIUZt3ZJTtXe4OPA/zkKC', '', '[Em] Dusty Blanda', 'employee', 10, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '123562', '+35 6179649', 0, 0, '', NULL, '', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'kweimann', 'harold.greenholt@cassin.biz', '$2y$10$WbGpTjPOoY/p65Xka2tJu.1NmI9ZeVCozjGUor3mcT5l9z6ac7y/y', '', '[Em] Dennis Rolfson', 'employee', 4, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '104997', '+68 4553112', 0, 0, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'shields.kitty', 'johan.fritsch@yahoo.com', '$2y$10$Yx1rUST00OxYYYvCwOS.Y.KPu5.TiCafaB20B9dM7v7TETAvQxrrK', '', '[Em] Jaylon Toy', 'employee', 13, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '630038', '+98 8412936', 0, 0, '', NULL, '', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'qkuhlman', 'lois.rutherford@brakus.com', '$2y$10$Ko212LiWXx/ayzPkXY6OheFeYqZ2qMj1vmYeHr8Y6m9cXuDiFFUza', '', '[Em] Clarabelle Considine', 'employee', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '300493', '+53 4933908', 0, 0, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'jackie.casper', 'reyes.kuhn@yahoo.com', '$2y$10$LPEc3UbrVtAd3YmXFJQUuebiqMYNWdOP6XHGc/cSA06AZIOrFacGW', '', '[Em] Dr. Lillie Thiel', 'employee', 4, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '481892', '+41 3816656', 0, 0, '', NULL, '', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'bratke', 'rory42@murray.biz', '$2y$10$EVojuJF6.OEboST9WVULfO/.Sp3krsCrB00CDnobxsmIahncM9BxW', '', '[Em] Adalberto Ullrich', 'employee', 8, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '153081', '+86 8180576', 0, 0, '', NULL, '', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'hstrosin', 'pbashirian@yahoo.com', '$2y$10$DzvxTYKb.PbklfWPBi9LFeQr5usPDnnG2v.veiBeqwe0wa35vOvny', '', '[Em] Dr. Mike Smith', 'employee', 8, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '225305', '+52 5588322', 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'una.wintheiser', 'hwatsica@hotmail.com', '$2y$10$d4..Ezxnd.l78pb.gjOj1.OhPmvwj2eP8ZriPJREygr09YC6MYi5m', '', '[Em] Ansel Kessler', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '999473', '+38 5790447', 0, 0, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'lhodkiewicz', 'savannah06@pouros.com', '$2y$10$k7WSzXhKKj71re55JAKPWu5TQVvA9kkGnvwNGjRywtEM9/.nACWki', '', '[Em] Zita Barton', 'employee', 14, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '745488', '+20 3076832', 0, 0, '', NULL, '', '018.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'lea76', 'leon.bashirian@hotmail.com', '$2y$10$Ocu9QzzqxfPKmEmSnHPkDOzBUy89w97WbBwJJlZ3TKADfubzaN8vW', '', '[Em] Jaycee Spinka', 'employee', 9, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '999044', '+55 2862224', 0, 0, '', NULL, '', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'crist.delia', 'ybrekke@hotmail.com', '$2y$10$tXPF/5uFLhSXwYKMV91njugxOYucmv8dVSpcVPidYV.iVq8EImwYK', '', '[Em] Jovani Lynch', 'employee', 10, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '890207', '+45 5763911', 0, 0, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'filomena12', 'bpowlowski@kulas.com', '$2y$10$TfRv0wKzddz3dQgmxZt6RegVzJwVxHM45KqZHUWcK7UVEPCm7Tkj6', '', '[Em] Breanna McLaughlin', 'employee', 14, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '342139', '+62 2339512', 0, 0, '', NULL, '', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'thora18', 'berge.kobe@barrows.com', '$2y$10$zpX33Jcs48O8ZvOFO0U7L.tlAPAss2qJV4gSl/.rbdVeqDCpxWhxG', '', '[Em] Kellie Pagac', 'employee', 3, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '107595', '+48 4071124', 0, 0, '', NULL, '', '03.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'teacher', 'chadd.pacocha@hotmail.com', '$2y$10$ev.qpcHJD51rJfsaC2UK/.qFG1KeQPuh5npL74znz4/OMB520.4Iy', 'M4yIPvpQlWEPvGwtFIPr8Bwcp0PiKh7d2fqOgsfKDp4wWRIVNtSWeXibTGk8', '[Te] Prof. Ellis Beahan DVM', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '735639', '+30 3787178', 0, 0, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, 'red', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'doyle.esther', 'marta43@trantow.com', '$2y$10$UfI2RZorBF7R793ZGYwBI.HW7jN3UxoodjWUi0SQZNPWpvgcT1mZK', '', '[Te] Vinnie Haag', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '574568', '+86 6947636', 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'alford.kling', 'francis07@schuppe.org', '$2y$10$NFenJQkWDAcS8y3dZ7IyouhrYt21a02tWP8Ung2umFYXabrq6mx3q', '', '[Te] Kirstin Beier', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '732457', '+25 2008567', 0, 0, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'jaquelin.bashirian', 'jerel.langosh@daugherty.com', '$2y$10$aQ0SBULUyWPwc8ppiix6sOBmSHZioN1n5cpF4oie4DR44jGkFm4IW', '', '[Te] Miss Sharon Stark V', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '863729', '+65 5104777', 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'llewellyn42', 'sabryna.christiansen@cole.com', '$2y$10$flXy3veVAp9G2gP8otPVROq8Ls1xl2GXazqK4Whfl9YSJSeo6s1NG', '', '[Te] Jane Boehm', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '694567', '+81 4319197', 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'bgreenfelder', 'feeney.hattie@hotmail.com', '$2y$10$XvjDVOcg3RCqiLVkN1w7wOvdqsyt6W7pEwxwbO/nscnxuI41sk9Me', '', '[Te] Mr. Thurman Zboncak', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '113708', '+64 9526073', 0, 0, '', NULL, '', '090.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'ygrimes', 'keara16@hotmail.com', '$2y$10$hgV87XDWTE5HPruiQ2mBXemOVVOo4YcqXlIhmwCvrden7LqzAcLle', '', '[Te] Allie Haley', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '723974', '+42 4017866', 0, 0, '', NULL, '', '093.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'jefferey41', 'kaylah.metz@kshlerin.biz', '$2y$10$07n/wpb17WdQGbWKBLsa6uVDnQ5EXzbJmpMh39J1GjpqfkJqULLnK', '', '[Te] Herta Nienow', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '635593', '+45 6001699', 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'terrell.predovic', 'pondricka@ratke.com', '$2y$10$50CR4Rz9lwtSVCDURCP6lOnx8IKOkx6Lh2WnUcMYegykEs.sOVMGO', '', '[Te] Jamir Lind', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '802736', '+53 8166114', 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'zwest', 'santa11@rath.com', '$2y$10$9a7kSUF6riAmCqzbDOTkkOLk2grJaEM5tlu4KSMt0fpkCQf4NYLYa', '', '[Te] Prof. Josiah Kovacek IV', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '840573', '+94 3966911', 0, 0, '', NULL, '', '043.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'maurice.goodwin', 'bertha.shields@gorczany.biz', '$2y$10$0HbygK6bVHNSDtCrErukoOVV0Z6TaCMqjwR483z0yKjTtXfeLuAvS', '', '[Te] Eliseo Zulauf', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '835705', '+68 5388368', 0, 0, '', NULL, '', '085.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'alvina29', 'vivian10@stracke.com', '$2y$10$njC5ii7Wq.mh3aDgmVLLTOg/FhHwddxT.WnJEMvFynxB2gZE0l/wG', '', '[Te] Roslyn Koss', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '809302', '+17 6611882', 0, 0, '', NULL, '', '073.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'iroob', 'adan61@gmail.com', '$2y$10$qY6MdD.ZSCKNIfyAw5l98.9SJs3ZyWBv12k.1BMwaHbSReVfheM72', '', '[Te] Baylee Kuhlman', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '557435', '+96 6859373', 0, 0, '', NULL, '', '092.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'goyette.florencio', 'buckridge.hank@mohr.com', '$2y$10$2688F3qt3mQagFebuR4Dm.J5Hlxzzyffz8F8rw.F3OGnS/XubS6Pi', '', '[Te] Prof. Kurtis Kilback', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '229932', '+36 2283302', 0, 0, '', NULL, '', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'weber.modesto', 'cade.ondricka@walsh.net', '$2y$10$97xcMRbMYgEviABAI2b7JudV/8S5R6/BTC09Rb0PJtwdfxySnGuw6', '', '[Te] Kennedy Cremin', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '142351', '+33 7259075', 0, 0, '', NULL, '', '070.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'blanca64', 'hardy71@gmail.com', '$2y$10$xgUdNSyaRpD7sIQk/F9mKu3aYlxxJZAsj447aiepz4ZK2zuiR1XjS', '', '[Te] Fermin Morar', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '980817', '+11 8329764', 0, 0, '', NULL, '', '014.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'heloise.hodkiewicz', 'salvador.schamberger@ritchie.com', '$2y$10$sLEpP1X/5mxWndJZaR/XAuV2HFDbVdNGVKojYDwBWZrx8pa6.Drpi', '', '[Te] Abel Parker', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '220899', '+66 1515837', 0, 0, '', NULL, '', '064.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'cronin.katlynn', 'janet94@okuneva.com', '$2y$10$5Z1YNiqo0VLbiUEFizMhrOZD4uZfVAyt/SU2QViXPaUikKhZOorny', '', '[Te] Dr. Earlene Hettinger MD', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '932171', '+64 4754142', 0, 0, '', NULL, '', '044.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'kristy04', 'haag.marvin@hotmail.com', '$2y$10$rG8VY/C8e9MzClDnyj4vpuUnaQzHJiDKzHUqTAaS.nibR2y3XjUqG', '', '[Te] Brianne Willms', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '976795', '+42 9658616', 0, 0, '', NULL, '', '070.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'harber.louvenia', 'mia76@erdman.com', '$2y$10$rm0VeaduJQ6cutncWjGS1uBEKzbLieshWPDsPQ1WPMI8iymr83M4K', '', '[Te] Prof. Cathryn Lesch', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '623539', '+27 7977831', 0, 0, '', NULL, '', '023.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'pouros.sydnee', 'rudolph49@gmail.com', '$2y$10$3zaQVN0EdnS.rHuO2tr3TOzw7K9OX7IraO.4ALUA1UtZ6MmykDGFe', '', '[Te] Joanne Keebler', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '837000', '+76 5724058', 0, 0, '', NULL, '', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'lkohler', 'riley.luettgen@gmail.com', '$2y$10$NAsxN8vNlrf2gbVu6pjYZenbYpVpxabRhHd6vdsDNvwZQ1Qok4pcy', '', '[Te] Mrs. Liana Welch', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '613480', '+72 2119873', 0, 0, '', NULL, '', '06.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'qstanton', 'labadie.mittie@roberts.info', '$2y$10$CZGCS4dvck8N/rGxn.bQtuUIGUjLY8MFH8GZYA..U1iYuGgOKNxlK', '', '[Te] Lupe D\'Amore IV', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '279895', '+49 4386144', 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(77, 'xbradtke', 'penelope.swift@hotmail.com', '$2y$10$p5AF31/UzJWHlb.cEKt/KedABDa9zAJJAwdSBZ9P6OK028AqLpnVG', '', '[Te] Dr. Anjali Schowalter III', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '298803', '+47 3492403', 0, 0, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'thickle', 'melvina04@yahoo.com', '$2y$10$0vwIrxPD7JvP2ttAri9fZOAH3VnF7BoUrcdcxi7fbbs0l8JKFhhRe', '', '[Te] Issac Rosenbaum PhD', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '626786', '+58 1825016', 0, 0, '', NULL, '', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'kpouros', 'hodkiewicz.emilie@gmail.com', '$2y$10$f/2isD7s7iwbWa1Q.OTra.HfrCXc1ZRqSlVNgumwfuQ/1RgbnvtTK', '', '[Te] Miss Elody Harvey', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '496434', '+44 2327904', 0, 0, '', NULL, '', '054.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'orenner', 'camryn85@hotmail.com', '$2y$10$owpvGlD46OqaFdeBSbB8hemTcbeb43hjQafbNM09AdRuFtRv2ijA2', '', '[Te] Dr. Ewald Satterfield MD', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '914490', '+71 8433302', 0, 0, '', NULL, '', '033.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'pamela.flatley', 'trantow.bernita@murray.com', '$2y$10$WkBSYiLarRrIzThoFUK0k.ApQ.s737Zn27A0BKrtmC6xDPiO8F.XS', '', '[Te] Ms. Amy Kunde', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '179429', '+29 7618425', 0, 0, '', NULL, '', '064.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'pinkie.schulist', 'zvonrueden@hoeger.net', '$2y$10$06gc93fhiBXzH5CvIuiy8OpzjI80twl9J79WZ96nnKMdSRCQ923je', '', '[Te] Rubye Zemlak', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '788217', '+96 6650618', 0, 0, '', NULL, '', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'darrion.wisoky', 'jgrimes@wunsch.com', '$2y$10$kA.zfk.W8KEg7FObdHiZkOsvI9vJ6yU8DDlE8O1xG2FtkJSz9TGsm', '', '[Te] Haleigh Klein', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '429558', '+90 8010473', 0, 0, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'caden.raynor', 'lia27@hackett.org', '$2y$10$unXbeyLKAP9/0/h.bkubMu0tSbPe2xxWySg8MngrpJi8NxQL0xrCi', '', '[Te] Joy Schulist II', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '256228', '+30 9040558', 0, 0, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'eaufderhar', 'dortha58@walter.com', '$2y$10$gAeLlhQrcn40k.hX5G3rgeYZVlJOA1pgyYLUhq/o1qNk9gwpI7iWi', '', '[Te] Antonietta Hartmann', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '150854', '+83 7084479', 0, 0, '', NULL, '', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'assunta52', 'kovacek.clotilde@kozey.biz', '$2y$10$iUqo3gAJP5zuWnFCOOuZjeGUPGI.f75OsdSti2AlvlAoIN6ZuLK7W', '', '[Te] Prof. Darien Senger Sr.', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '773318', '+73 7562591', 0, 0, '', NULL, '', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'kristopher.kozey', 'unique.gleichner@purdy.info', '$2y$10$Ik5UGFaGeDeRrAnxFCTWsuC7Lwg0o17Aj2kYaU72Gbo0TK4/qyhHe', '', '[Te] Miss Tia Prosacco MD', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '502943', '+13 4807873', 0, 0, '', NULL, '', '095.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'kleuschke', 'sarai60@marquardt.com', '$2y$10$pBXUeDz7IWI44YOnGui69eSm/bEuMyNdZxIwOHcbkRWjONnIMf4n.', '', '[Te] Margarette Beier', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '322143', '+33 9058862', 0, 0, '', NULL, '', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'blaise94', 'kcollier@yahoo.com', '$2y$10$uUB4Nx.JSzVQzem07CF/g.u5OJ0Qwkderf7RfLChc198GAWd4PhSi', '', '[Te] Prof. Delmer Gottlieb III', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '927491', '+24 7444859', 0, 0, '', NULL, '', '029.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'cassie01', 'dkunze@medhurst.info', '$2y$10$M0DhzQCR//HF3n0C1j8On.fSaPQsO/DxHiLD/m3FnYYLcLDxyZMqy', '', '[Te] Lilliana Hammes', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '591465', '+99 8495682', 0, 0, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'reynolds.friedrich', 'rolfson.wilmer@hotmail.com', '$2y$10$wOALXEY5Bp908.KESVP.Iufeb6sub.t8rwM482NZZmlGifQsv99eK', '', '[Te] Tyson Hyatt', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '780276', '+12 8541214', 0, 0, '', NULL, '', '089.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'slehner', 'uvon@hansen.com', '$2y$10$PQekfHDebvtZRrY5tT36ku23ekpGZHVi7fYQqpfGEExiX7ug7Goie', '', '[Te] Isabell Torphy', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '364665', '+62 6657742', 0, 0, '', NULL, '', '077.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'kiara.gutmann', 'bernier.nicklaus@mohr.org', '$2y$10$f9DrEm5FFBVhWUNX7iVHIucY5u1JVy2ewc2H1cue2XK5XThZNdHXq', '', '[Te] Melvina Weimann', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '449668', '+18 6912921', 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'dameon.nienow', 'nigel.hyatt@pouros.info', '$2y$10$FcTzZRt1XHeNARfbGXccWuDuG8uQuDy2T6KpZQ0N5V.Gi6FYAIz4S', '', '[Te] Abbie Mohr', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '538893', '+17 4570137', 0, 0, '', NULL, '', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'ggreenholt', 'collier.shirley@vonrueden.info', '$2y$10$CWuSrO0ti0E06UpuCo4XM.wVf/tq3WKObaXWCnrDewRfwX060dPzG', '', '[Te] Dr. Joy Hickle', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '377405', '+88 2277495', 0, 0, '', NULL, '', '046.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'gino23', 'beahan.rodrigo@kub.com', '$2y$10$wAyMQXkLW1YRqdtTrnh0zu6CeLsBLwZlRjFpgI5B4FwATWER7Bl9C', '', '[Te] Nikita Wilkinson Jr.', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '291871', '+69 1686458', 0, 0, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(97, 'alek.hammes', 'breana65@dach.com', '$2y$10$qxPpuNaeEUiGE6zKLo0S3.PQD.rMxSu5w7VhuL2Gar7U/0q2JffXe', '', '[Te] Mrs. Micaela Koch V', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '798674', '+77 5088619', 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(98, 'rosenbaum.amina', 'wehner.ines@murazik.com', '$2y$10$r5i5KB5pb7o9afTd4nsSJO6NB5CvlwmyMA2EFHRoIU50KLill1qfm', '', '[Te] Jaiden Schumm', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '836019', '+98 4200360', 0, 0, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(99, 'maritza44', 'jimmy00@towne.org', '$2y$10$a1OnaaBQelqkX6y4oL0XUen57HgFrlix6KsEnqAbsskCvEq2rRo.O', '', '[Te] Dr. Scarlett Vandervort', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '182414', '+68 4605187', 0, 0, '', NULL, '', '043.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(100, 'schmeler.alysson', 'fabiola09@wiza.net', '$2y$10$MNTB/fzeLgI60z.GHli7hev4gApYs4Qa1v0FBR8IHujyi0NZs3jdm', '', '[Te] Anjali Kohler', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '294059', '+26 4562170', 0, 0, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(101, 'ifarrell', 'gibson.logan@gmail.com', '$2y$10$2UosyuvQsRUbaG1UNSgoce.P7nKmFwG1RmVbnC3SqBN1GkGpyuX2m', '', '[Te] Carolyne Kunze', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '787540', '+30 7927217', 0, 0, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(102, 'pagac.gage', 'leslie70@gmail.com', '$2y$10$fBZwVkFZ7rKd3DQbUpGYfO7Db1PZIMSLgRklBE7reg/7BmA8SQ0ti', '', '[Te] Mozell Skiles', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '473581', '+10 5985964', 0, 0, '', NULL, '', '015.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(103, 'bogisich.rosalia', 'celine17@walter.com', '$2y$10$jEfODuCv5GYETz/XudTgLOKGmoIfTmmmKPHIFjVs.RnvRdYEQw0DW', '', '[Te] Catherine Altenwerth V', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '958410', '+53 9882998', 0, 0, '', NULL, '', '070.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(104, 'draynor', 'fermin76@gmail.com', '$2y$10$jr2Ku81fPqqS8nZLdSW2t.3Litk1BAzKPKD9BylFb47rL5xLJKs2O', '', '[Te] Justen Vandervort', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '603251', '+71 1062614', 0, 0, '', NULL, '', '010.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(105, 'student', 'roberto89@kuphal.com', '$2y$10$FWdoB74thwpjsE3jASTRZesEvh/19/2QI3giithMog5Zx95IvqUJu', '', '[St] Cali Batz', 'student', 6, 3, NULL, 0, 1, '51', '38-282-99', 0, 0, '', 0, NULL, NULL, '2910004659', '5298338', 7, 5, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(106, 'gaylord.oliver', 'zwatsica@gmail.com', '$2y$10$jAM36nm69p3sf2/v7moo.ekVQlg/zsTvAi3tlswcspvoiIRXcslta', '', '[St] Ms. Guadalupe Konopelski DVM', 'student', 6, 2, NULL, 0, 1, '77', '77-751-64', 0, 0, '', 0, NULL, NULL, '1824586747', '3454238', 4, 24, '', NULL, '', '069.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(107, 'gibson.watson', 'dejon92@yahoo.com', '$2y$10$xMGJ0ksi6hIXvGsrWKkFz.1RC7W5jj48nNYjGfTZoYoA.ysNzae7y', '', '[St] Miss Lupe Stroman V', 'student', 6, 2, NULL, 0, 1, '76', '26-962-96', 0, 0, '', 0, NULL, NULL, '9766047223', '3360770', 1, 46, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(108, 'trantow.sam', 'pearline90@gleichner.com', '$2y$10$P5yGjhI7Tto9r0raQ7Dmx.KHV9zNsPnk9PVDUvzBTjup/ELY7xAsC', '', '[St] Camren Bednar', 'student', 6, 3, NULL, 0, 1, '2', '34-833-68', 0, 0, '', 0, NULL, NULL, '6851367888', '6566953', 7, 7, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(109, 'schultz.jimmy', 'jonas05@gmail.com', '$2y$10$MJgr1RM4.V0F/CSOu2tR6eNfyLBglMD5GfGtCThVGGUnuU7Liw9BG', '', '[St] Kristy Doyle', 'student', 6, 2, NULL, 0, 1, '22', '22-523-94', 0, 0, '', 0, NULL, NULL, '8182904650', '3187065', 4, 30, '', NULL, '', '058.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(110, 'kstroman', 'nikita31@gmail.com', '$2y$10$I/C.pXiRKFamehnK3vmM7eLxIZBT/LQbP95bzBTgN739pFdcSR0pi', '', '[St] Mr. Taurean Wiza', 'student', 6, 4, NULL, 0, 1, '45', '56-332-44', 0, 0, '', 0, NULL, NULL, '6430516446', '7799730', 6, 35, '', NULL, '', '080.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(111, 'botsford.taylor', 'weimann.cameron@hotmail.com', '$2y$10$3tPlD84k3ajmhforUCL/9uNL.O5e.8D4X6gDCr9l9XDvWGyUBFfE2', '', '[St] Isabella Crist', 'student', 6, 3, NULL, 0, 1, '45', '37-187-51', 0, 0, '', 0, NULL, NULL, '1940940244', '7615597', 6, 16, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(112, 'lucio.langosh', 'albertha.okeefe@gmail.com', '$2y$10$dbiq6d5chrLB7SdoOoG04ea9uFG2xF6R3St0mgWfTYoyjOvoF7TFC', '', '[St] Dr. Kyleigh Wisozk PhD', 'student', 6, 3, NULL, 0, 1, '85', '22-790-25', 0, 0, '', 0, NULL, NULL, '3095266935', '3478028', 1, 22, '', NULL, '', '094.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(113, 'meredith.miller', 'parker64@kuhic.net', '$2y$10$g8KGlSSGdG9YWtkUXFvBoOa6WjazLWA/TXSagTJw8B3e7NZMcS3YG', '', '[St] Prof. Yvette Murazik DDS', 'student', 6, 1, NULL, 0, 1, '62', '63-578-63', 0, 0, '', 0, NULL, NULL, '5772969108', '2817124', 4, 30, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(114, 'okuneva.katelin', 'fritsch.cordelia@reichel.com', '$2y$10$rUHozmRrM2XqAPrznEHcpOTvZJ0xsOzgwPClJF73c8i3satynZ2a2', '', '[St] Mr. Amparo Heller I', 'student', 6, 3, NULL, 0, 1, '24', '56-155-88', 0, 0, '', 0, NULL, NULL, '5348334968', '6688779', 2, 12, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(115, 'nmayer', 'kirlin.fay@hotmail.com', '$2y$10$HPm2BtfbpmiWL5I1/yc3d.zvF3anjO5kOiK4GYU4O6/R9FSAd6ifS', '', '[St] Miss Mossie Hill', 'student', 6, 2, NULL, 0, 1, '95', '10-546-94', 0, 0, '', 0, NULL, NULL, '8900263424', '2190217', 7, 7, '', NULL, '', '063.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(116, 'sage81', 'tmraz@kling.com', '$2y$10$ErGC4tNNPLK0Lc7XWGZAjuaHeL6dehEwWOG4b0fqqjpURtQpBg/Ci', '', '[St] Albina Beatty I', 'student', 6, 4, NULL, 0, 1, '25', '15-568-82', 0, 0, '', 0, NULL, NULL, '1786476590', '2397486', 7, 37, '', NULL, '', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(117, 'lindgren.laverne', 'malika.ruecker@labadie.biz', '$2y$10$ZU7KcoKpxYAI9VLu80M8K.cwC4lSsIiMh/FicpdfYPgl.ysssErF6', '', '[St] Prof. Adah Littel III', 'student', 6, 2, NULL, 0, 1, '29', '49-570-19', 0, 0, '', 0, NULL, NULL, '7415447627', '7690270', 4, 11, '', NULL, '', '011.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(118, 'pete.rutherford', 'ethel.bayer@kshlerin.biz', '$2y$10$rQvLnwAMSK59y11pHfJgGenv9CMgTSpEOndyfaJWTkC6ireqiRevi', '', '[St] Patsy Will', 'student', 6, 2, NULL, 0, 1, '45', '12-116-82', 0, 0, '', 0, NULL, NULL, '5750786237', '8876852', 9, 38, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(119, 'herman16', 'abbie.turcotte@hotmail.com', '$2y$10$7zBotyqIK2WT1LunRqIV0.ndpYUsZR84z7TXugFn3ZZ3mET4zWYve', '', '[St] Elinor Lynch', 'student', 6, 3, NULL, 0, 1, '43', '86-441-27', 0, 0, '', 0, NULL, NULL, '5420313973', '5300361', 9, 31, '', NULL, '', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(120, 'heath22', 'erika.bode@hills.com', '$2y$10$aM85e87kQOiI28dT3R6d7uz91YmoSLkM/AYe3Tx37nhB3vYVIxajO', '', '[St] Kamille Spencer Jr.', 'student', 6, 2, NULL, 0, 1, '83', '99-313-34', 0, 0, '', 0, NULL, NULL, '9712634540', '1186265', 5, 48, '', NULL, '', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(121, 'kgulgowski', 'esteban.murray@veum.com', '$2y$10$7cC7b/fUwn0getC2J3.j3uF3JMZL3RIl2IJN/52lX3JCIftFrhvwW', '', '[St] Cydney Rice', 'student', 6, 3, NULL, 0, 1, '42', '22-380-13', 0, 0, '', 0, NULL, NULL, '4896154534', '3741326', 10, 10, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(122, 'mills.germaine', 'buster86@yahoo.com', '$2y$10$T5bQeaJb7JRbzvPg0yPyQ.W7Nx8eHU4/bKaOyWnRLuDe.elQCKeV2', '', '[St] Dr. Darby Ziemann', 'student', 6, 3, NULL, 0, 1, '76', '61-241-22', 0, 0, '', 0, NULL, NULL, '7945658283', '3123077', 4, 11, '', NULL, '', '032.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(123, 'utrantow', 'feeney.merle@christiansen.info', '$2y$10$jmB2D.jgMR5T/S4nR6k4Ve4hf.pknb23jIR2MTM2s0roeVJPjtu7e', '', '[St] Haylee Boyer', 'student', 6, 2, NULL, 0, 1, '59', '77-922-58', 0, 0, '', 0, NULL, NULL, '4868596642', '2308833', 10, 36, '', NULL, '', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(124, 'rusty.smitham', 'sydnee42@ruecker.com', '$2y$10$UKRXT0u5JetmjEs5QIBplOaA81Y1.cLD07bIqsxhPOqto8W4yYoAm', '', '[St] Jackson Oberbrunner', 'student', 6, 3, NULL, 0, 1, '86', '96-305-78', 0, 0, '', 0, NULL, NULL, '2667274330', '9300424', 3, 14, '', NULL, '', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(125, 'ykunze', 'russell.boyle@rosenbaum.com', '$2y$10$4Yrf3HG8VXGW2GLjQrHg4O7sKqYz5Rhw8JS/HqBu0nC65.ie6kzZu', '', '[St] Perry Hills MD', 'student', 6, 1, NULL, 0, 1, '17', '78-833-98', 0, 0, '', 0, NULL, NULL, '6088222303', '7434021', 2, 47, '', NULL, '', '028.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(126, 'giovanni.price', 'stuart62@hotmail.com', '$2y$10$dR6k4Rx0KzubOYlDLWQP1urjofKZbzWaFVv4kfHWIjU4x8vmIFRZm', '', '[St] Michel Hodkiewicz', 'student', 6, 1, NULL, 0, 1, '60', '93-439-35', 0, 0, '', 0, NULL, NULL, '3489620863', '2136729', 3, 3, '', NULL, '', '01.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(127, 'davis.bertha', 'josiane.purdy@gmail.com', '$2y$10$GXgEn2wObRa2acNFizuk8uQ4mUyisAeTXd5vIsnCpi/E0gHsdev7S', '', '[St] Keon Bergnaum', 'student', 6, 4, NULL, 0, 1, '40', '45-853-66', 0, 0, '', 0, NULL, NULL, '6944198605', '6305121', 1, 46, '', NULL, '', '018.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(128, 'ecummings', 'bcole@keebler.net', '$2y$10$XukwvkfCP3RQTBjKS7YQkedBJFcL8w6mwqiaxR1VUlZcxnh8DIBdm', '', '[St] Joshuah Altenwerth', 'student', 6, 2, NULL, 0, 1, '7', '96-702-53', 0, 0, '', 0, NULL, NULL, '1028064146', '5123781', 3, 27, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(129, 'macejkovic.beth', 'mariano01@langworth.com', '$2y$10$xivSsdgiVbZJ3HMp38i5EejCAV9djKf5ieIOxZ741K6rc.XbaY.RS', '', '[St] Chaz Heaney', 'student', 6, 2, NULL, 0, 1, '36', '71-605-63', 0, 0, '', 0, NULL, NULL, '4456060487', '2116941', 3, 14, '', NULL, '', '070.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');
INSERT INTO `users` (`id`, `username`, `email`, `password`, `remember_token`, `fullName`, `role`, `role_perm`, `department`, `designation`, `studentAcademicYear`, `activated`, `studentRollId`, `admission_number`, `admission_date`, `std_category`, `auth_session`, `birthday`, `gender`, `address`, `phoneNo`, `mobileNo`, `studentClass`, `studentSection`, `religion`, `parentProfession`, `parentOf`, `photo`, `isLeaderBoard`, `restoreUniqId`, `transport`, `transport_vehicle`, `hostel`, `medical`, `user_position`, `defLang`, `defTheme`, `salary_type`, `salary_base_id`, `comVia`, `father_info`, `mother_info`, `biometric_id`, `library_id`, `account_active`, `customPermissionsType`, `customPermissions`, `firebase_token`, `updated_at`) VALUES
(130, 'felipa94', 'cmcclure@pouros.com', '$2y$10$FZFgN6x/R6HJ5VXIkX62huaMut2vjFx16aBjD0BQMT5awOHB51JdO', '', '[St] Dudley Conn MD', 'student', 6, 3, NULL, 0, 1, '57', '16-332-95', 0, 0, '', 0, NULL, NULL, '9400364917', '9305110', 7, 1, '', NULL, '', '036.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(131, 'effertz.salma', 'lhills@yahoo.com', '$2y$10$0JLLzTOZ.Exo1uYGSTmHZO4LX4ZItVP7t4fCqmAqaHXqWfeTady/G', '', '[St] Miss Maud Howe DDS', 'student', 6, 4, NULL, 0, 1, '20', '97-938-12', 0, 0, '', 0, NULL, NULL, '6164847598', '6927824', 1, 22, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(132, 'gvolkman', 'xstamm@bayer.com', '$2y$10$uyOnRplsOOrYYtOS6uWtu.xI44hFoJIfPIlG/bwAfbmlspQLERjRu', '', '[St] Odessa Swift', 'student', 6, 4, NULL, 0, 1, '45', '71-622-53', 0, 0, '', 0, NULL, NULL, '9033635504', '6324441', 6, 35, '', NULL, '', '082.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(133, 'kailyn81', 'cronin.isaias@sanford.com', '$2y$10$xVcUudqFoA3TujtQPnRZIeEjsQdSRVrEc7w7aeJMLg.sH6GOCF4hG', '', '[St] Lee Fisher', 'student', 6, 2, NULL, 0, 1, '13', '15-742-85', 0, 0, '', 0, NULL, NULL, '8378861508', '2254020', 4, 2, '', NULL, '', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(134, 'jazmin.streich', 'aisha.hauck@ortiz.com', '$2y$10$68QNIC5cjSg0gWvBpMhxBOEKO9LhIR1LhnwUY0TC6GSGwAOANdoAy', '', '[St] Ms. Retta Rempel PhD', 'student', 6, 3, NULL, 0, 1, '66', '36-399-59', 0, 0, '', 0, NULL, NULL, '1767669951', '4228794', 1, 21, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(135, 'rachel73', 'floyd48@gmail.com', '$2y$10$4X9mvNUvrDR30F/RSD3T8elirzxhT/lV0esOgL.XTg9ZfyRxkSrHa', '', '[St] Tomasa Barton', 'student', 6, 3, NULL, 0, 1, '17', '94-945-65', 0, 0, '', 0, NULL, NULL, '3837031196', '1515047', 8, 39, '', NULL, '', '054.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(136, 'krempel', 'felton.ritchie@hotmail.com', '$2y$10$2E5ORlShVAjQ8ibUJ5RvMuM7E/Ye.zxVVCcJDQruEKl2G3SQ35.3G', '', '[St] Kiara Huel', 'student', 6, 2, NULL, 0, 1, '13', '82-806-81', 0, 0, '', 0, NULL, NULL, '5309056373', '2825399', 3, 14, '', NULL, '', '078.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(137, 'ycummerata', 'swift.thalia@strosin.com', '$2y$10$OWqfUgFJr0oMZ9CIYb./5Ogjo2gOzb4iIJwktNL/MGtSVp3w2JIri', '', '[St] Fidel Stiedemann', 'student', 6, 2, NULL, 0, 1, '42', '27-938-50', 0, 0, '', 0, NULL, NULL, '4623555949', '2619478', 2, 47, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(138, 'mfarrell', 'streich.josiah@weimann.com', '$2y$10$nd8VX3r4xzMeQgOiUafvYuOPmvMwzd3KqWFk5e2GsMg0FbtkSRaEK', '', '[St] Llewellyn Sawayn', 'student', 6, 3, NULL, 0, 1, '4', '89-511-97', 0, 0, '', 0, NULL, NULL, '8486713913', '4947736', 4, 24, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(139, 'stokes.graham', 'noah46@hotmail.com', '$2y$10$byfnGaG0Ytl/g7FIrPCbu.2QNawwr0xDdf9ZsyrxJmrtsRUPd6Dhi', '', '[St] Louie Reynolds', 'student', 6, 4, NULL, 0, 1, '81', '70-376-56', 0, 0, '', 0, NULL, NULL, '6332865755', '6953471', 8, 26, '', NULL, '', '068.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(140, 'tre69', 'mueller.elsa@yahoo.com', '$2y$10$9A2IzTQhO22O3YEfuKqiDOcZVwSsCLXD0fIEPX31ADld7Kz0l1xXy', '', '[St] Jovani Windler', 'student', 6, 1, NULL, 0, 1, '95', '92-166-58', 0, 0, '', 0, NULL, NULL, '1933337216', '9707955', 7, 5, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(141, 'reichert.virgie', 'else.bergnaum@nienow.net', '$2y$10$tLfNS6Bs6WdURXwwXeb9P.Xpld6yX4EtNbzHjAcvKQDA1wdwZPX5G', '', '[St] Brigitte Hodkiewicz', 'student', 6, 2, NULL, 0, 1, '35', '65-446-94', 0, 0, '', 0, NULL, NULL, '5668382388', '8263350', 8, 42, '', NULL, '', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(142, 'zoey.kerluke', 'ernest43@strosin.com', '$2y$10$pXssbDL5yfB4yrNMsN5TX.FfHY55HVDa9jMSwtvJxQGEdbrE.24py', '', '[St] Kiara Leuschke III', 'student', 6, 2, NULL, 0, 1, '13', '44-645-73', 0, 0, '', 0, NULL, NULL, '4823351834', '2406493', 8, 39, '', NULL, '', '014.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(143, 'derek.schulist', 'gideon.kihn@koss.info', '$2y$10$qiAB8hPGhd7AqvKTcdjfc.Z3U8Rn7BHlaztIqg47FHXVoqN7MrtI6', '', '[St] Prof. Mozell Stoltenberg', 'student', 6, 1, NULL, 0, 1, '57', '89-730-59', 0, 0, '', 0, NULL, NULL, '9364899273', '4778948', 10, 10, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(144, 'bartoletti.mireille', 'lora82@gmail.com', '$2y$10$3VIKST6LYEfQAxMHvorh4Om5iMtBxMzf/3TruSQqYZVZP6q43ebui', '', '[St] Fanny Wolf', 'student', 6, 1, NULL, 0, 1, '66', '13-801-19', 0, 0, '', 0, NULL, NULL, '6559476703', '1611744', 4, 45, '', NULL, '', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(145, 'hking', 'vesta85@gibson.info', '$2y$10$D02Y8G7CrsmdMPZGYrNJn.qY5SVNtV8.FTodbj8ZmQOxIhGA8DF/a', '', '[St] Tod Stamm', 'student', 6, 1, NULL, 0, 1, '79', '44-277-71', 0, 0, '', 0, NULL, NULL, '2035056851', '4980447', 8, 33, '', NULL, '', '039.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(146, 'clebsack', 'genoveva68@gmail.com', '$2y$10$Tnv.WqaWSJELq/7c4x3KwOdyoHDPJKK7Dzt71wBsZ8ILrkMNHeHdS', '', '[St] Shemar Becker', 'student', 6, 2, NULL, 0, 1, '66', '98-624-97', 0, 0, '', 0, NULL, NULL, '4239774197', '5233689', 5, 20, '', NULL, '', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(147, 'keven.kuhlman', 'pollich.casimir@gmail.com', '$2y$10$6HmTFRRCu8Acsx.MXdB32eGUI1/fctMB2Y7OFBojNsOqgVzC51cDO', '', '[St] Dr. Zoe Stanton DDS', 'student', 6, 3, NULL, 0, 1, '89', '47-140-22', 0, 0, '', 0, NULL, NULL, '4266974923', '6056168', 2, 12, '', NULL, '', '060.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(148, 'cali80', 'seamus.oconner@yahoo.com', '$2y$10$cBneZD457OqwZEAQ6TZKvON7Mlj3b4JMow.jUtrIj2RHRj9bqGF0i', '', '[St] Kristofer Block DDS', 'student', 6, 4, NULL, 0, 1, '96', '80-567-85', 0, 0, '', 0, NULL, NULL, '2564808449', '8480489', 10, 9, '', NULL, '', '09.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(149, 'lesch.bernita', 'savion51@bahringer.com', '$2y$10$GnhXCivOCOitR/c0BUiT5.JC6YTwdTRQm8lteAMeNeLpplsfUV8mm', '', '[St] Ms. Kiana Goyette', 'student', 6, 2, NULL, 0, 1, '87', '21-391-41', 0, 0, '', 0, NULL, NULL, '1229020427', '9262482', 8, 42, '', NULL, '', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(150, 'abshire.collin', 'hgottlieb@auer.com', '$2y$10$ZckAI.4WHrXIc4domxlQsOBZbHjB7e2RoLw2vhGUAAgyntDoJNCge', '', '[St] Mercedes Littel', 'student', 6, 3, NULL, 0, 1, '80', '20-321-87', 0, 0, '', 0, NULL, NULL, '9629161299', '7880118', 1, 43, '', NULL, '', '056.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(151, 'milton.vandervort', 'isaac88@lehner.com', '$2y$10$DbZQjs2GczArr9Ph10H16eEyy00qHv2DU0lrB3hKlZ8Hnzd16gUea', '', '[St] Mr. Darrion Reinger MD', 'student', 6, 3, NULL, 0, 1, '65', '99-621-59', 0, 0, '', 0, NULL, NULL, '1652707759', '9661180', 9, 50, '', NULL, '', '044.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(152, 'qziemann', 'theo01@stoltenberg.org', '$2y$10$6rZWjl4riRj87LDpIFsx6eAJ9arAkMaW5oAAsF3ZCw3Gx6nqYVgSe', '', '[St] Prof. Braxton Donnelly MD', 'student', 6, 4, NULL, 0, 1, '82', '10-590-47', 0, 0, '', 0, NULL, NULL, '4273829152', '6867914', 9, 31, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(153, 'jon93', 'sallie54@yahoo.com', '$2y$10$A7menLtYCB1IAV3tX7.vQOCkkYE60ljxJnRQhz1A0R3YNToVAQsjC', '', '[St] Selena Blick', 'student', 6, 2, NULL, 0, 1, '30', '61-434-87', 0, 0, '', 0, NULL, NULL, '5368494846', '5524007', 1, 46, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(154, 'eleazar28', 'ufritsch@hotmail.com', '$2y$10$1JEOLx6oOqWaURPplNdw3Ozv4Sg38YhBSuqDDDRgte8k6UvjFMHWW', '', '[St] Fannie Gulgowski', 'student', 6, 4, NULL, 0, 1, '96', '58-409-88', 0, 0, '', 0, NULL, NULL, '1977611523', '6209067', 3, 14, '', NULL, '', '041.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(155, 'clotilde.walter', 'jessie97@gmail.com', '$2y$10$xo/vyW7nmw2JcA9riPrOueZoZALoYgopb5Xk3XQEf3LRtr8odKCP6', '', '[St] Karli Schaefer', 'student', 6, 4, NULL, 0, 1, '19', '63-993-97', 0, 0, '', 0, NULL, NULL, '6305081557', '2697206', 6, 34, '', NULL, '', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(156, 'parent', 'vincenza44@yahoo.com', '$2y$10$NKGiJxnxx3VCWOaIZEcYJOJu.PzPfNRHIebKcMLO5bH7/u7dn84i2', '8fnkSSJrfA91uysFR8X9QSeRp9X1o0Cwlpm3M06KFjyiWvgnH6qraOtuXBIC', '[Pa] Dr. Khalid Hansen III', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8654010426', '4681052', 10, 35, '', NULL, '[{\"student\":\"[St] Ms. Kiana Goyette\",\"relation\":\"father\",\"id\":149}]', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(157, 'jazlyn.crist', 'amraz@hotmail.com', '$2y$10$FFi/yUg99Vtg/BCiwbp15uL9WTZ6QgwNbg9z4apoHVq6GXfWgXk9i', '', '[Pa] Chadd Goyette', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7653788314', '8232146', 8, 6, '', NULL, '[{\"student\":\"[St] Kristofer Block DDS\",\"relation\":\"father\",\"id\":148}]', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(158, 'aimee.wisozk', 'blanda.jennifer@gmail.com', '$2y$10$sWql/BRUh3f9IG28jYnqF.WiCaYIUsiPIsAeKNiJT7xtfdCN.hIzG', '', '[Pa] Emerson Muller', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2807607108', '2471437', 2, 19, '', NULL, '[{\"student\":\"[St] Odessa Swift\",\"relation\":\"father\",\"id\":132}]', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(159, 'rkertzmann', 'rashad.schroeder@hotmail.com', '$2y$10$/zRR3P5euyshDM2HN66daODeLSjDRr2DnWeeNjIpC9.i5ljyjtVoG', '', '[Pa] Jarred Toy', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7290925625', '8972273', 5, 23, '', NULL, '[{\"student\":\"[St] Dr. Darby Ziemann\",\"relation\":\"father\",\"id\":122}]', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(160, 'elwyn64', 'beer.rubie@robel.org', '$2y$10$eDS.0u/paNsCtm2pBnay6uRZtGafEIDJUFstl.TIG6ag.iefKtoSS', '', '[Pa] Clementine Orn IV', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4481983173', '4872600', 5, 5, '', NULL, '[{\"student\":\"[St] Ms. Guadalupe Konopelski DVM\",\"relation\":\"father\",\"id\":106}]', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(161, 'kenyon.rau', 'stacey13@swaniawski.com', '$2y$10$8sDtkZ7Yf12Wj4Wh1mJAC.FUSDmtsCDj7/nlehFoQsZSMMNUC8S3C', '', '[Pa] Adriana Kunze IV', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5683094903', '8055723', 9, 1, '', NULL, '[{\"student\":\"[St] Lee Fisher\",\"relation\":\"father\",\"id\":133}]', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(162, 'pearl47', 'rowe.shane@moen.com', '$2y$10$vFdVJkC9UgUVnV2/1E5IwesQ8T0LAcdvn2SM1AiO8qs2wrIyqMkx.', '', '[Pa] Christian Senger', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2746241631', '3521796', 6, 40, '', NULL, '[{\"student\":\"[St] Ms. Kiana Goyette\",\"relation\":\"father\",\"id\":149}]', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(163, 'kendall68', 'rowe.lora@gmail.com', '$2y$10$LBnXru4E6Z2t1dUhBe4X/O0m1DhzWZlNG3xbLpU14yJ4iSu6Ku77q', '', '[Pa] Mack Kunze', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8893613693', '7617613', 2, 33, '', NULL, '[{\"student\":\"[St] Dr. Zoe Stanton DDS\",\"relation\":\"father\",\"id\":147}]', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(164, 'mann.anibal', 'romaine71@hotmail.com', '$2y$10$wLsNjK/OKm2ivUAgsHcefO16SG7LHt5G/cY52uYPuvzq77.wgFc2m', '', '[Pa] Laura Wehner', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1125473653', '6507546', 8, 40, '', NULL, '[{\"student\":\"[St] Fanny Wolf\",\"relation\":\"father\",\"id\":144}]', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(165, 'wkemmer', 'zhegmann@reilly.net', '$2y$10$UIalZuifl6PKKy7a72Cxc.TXsrZTgx9f7BxNjKmiI3M8CrrEFy91u', '', '[Pa] Wilhelmine Pfannerstill', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2302785241', '3773346', 5, 5, '', NULL, '[{\"student\":\"[St] Selena Blick\",\"relation\":\"father\",\"id\":153}]', '06.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(166, 'morissette.waino', 'carson94@trantow.com', '$2y$10$kfOPxGU4j4YXjmTHycazKejKS/mJXPjwmJ.8fpQfWumD1j6YtPfb6', '', '[Pa] Casey Corwin', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3115619440', '7420190', 10, 18, '', NULL, '[{\"student\":\"[St] Prof. Braxton Donnelly MD\",\"relation\":\"father\",\"id\":152}]', '046.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(167, 'shany.hodkiewicz', 'burley81@kemmer.com', '$2y$10$qdhDcH9vCBAOmClswmEgqOK8oiO2vYNN2GTfEULsuVZYyrP95xXe.', '', '[Pa] Norris Mertz DDS', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7744503652', '3512449', 3, 5, '', NULL, '[{\"student\":\"[St] Mr. Amparo Heller I\",\"relation\":\"father\",\"id\":114}]', '022.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(168, 'sallie.graham', 'juliana77@gmail.com', '$2y$10$d4effr5NFILCJzkoEC2C8O5B4oehYLK3bxDSjxu6bnRB.a4W68QP6', '', '[Pa] Prof. Florian O\'Reilly', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6027841477', '4429935', 8, 18, '', NULL, '[{\"student\":\"[St] Prof. Adah Littel III\",\"relation\":\"father\",\"id\":117}]', '01.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(169, 'stokes.rey', 'frami.ulices@dicki.com', '$2y$10$/8Z26LIuqQIb/9Sxo/xhAe3gpCFDDjqXjOSZvZYKVyHqIapQHTw6e', '', '[Pa] Bulah Zemlak', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6759877659', '3815231', 4, 8, '', NULL, '[{\"student\":\"[St] Kamille Spencer Jr.\",\"relation\":\"father\",\"id\":120}]', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(170, 'kip99', 'lupe63@yahoo.com', '$2y$10$q/OQoAkGUj.0JWFlzHYu3u5Or7garw6klyfpyw5xRHO8d9fn4Ghtq', '', '[Pa] Prof. Melisa Beatty', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2978937829', '7487117', 3, 48, '', NULL, '[{\"student\":\"[St] Ms. Guadalupe Konopelski DVM\",\"relation\":\"father\",\"id\":106}]', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(171, 'julie.damore', 'vkiehn@daugherty.org', '$2y$10$oGAGOoAz6CCAucEvt5w0GO9iNtY4AJFTjm.Rnp3gnnBCNrHC./hBK', '', '[Pa] Else Bashirian', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5003617356', '1281135', 9, 20, '', NULL, '[{\"student\":\"[St] Shemar Becker\",\"relation\":\"father\",\"id\":146}]', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(172, 'gfarrell', 'edward.lesch@schmitt.info', '$2y$10$E7qBezZtU6j8gc5D5sbZKecNRGLYy7/KJgo016b52rfqfmVdelOu6', '', '[Pa] Ike Boehm V', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7661338952', '1868375', 5, 5, '', NULL, '[{\"student\":\"[St] Ms. Kiana Goyette\",\"relation\":\"father\",\"id\":149}]', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(173, 'ubrakus', 'uoberbrunner@huels.com', '$2y$10$pYeJ4dNhJYB2s9tL880ELOGIFxMZbCek5iykm3yRIiZHwkfnckMBq', '', '[Pa] Helena Kutch', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8732173763', '3457955', 6, 12, '', NULL, '[{\"student\":\"[St] Selena Blick\",\"relation\":\"father\",\"id\":153}]', '098.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(174, 'iwaelchi', 'eleanora.weimann@hotmail.com', '$2y$10$2GGFykmhwzD.Jydj2zGWfuun0PnJvyykDlCtxevm6Drwhrer3WO2O', '', '[Pa] Malinda Durgan', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7065492312', '6461347', 3, 8, '', NULL, '[{\"student\":\"[St] Mr. Amparo Heller I\",\"relation\":\"father\",\"id\":114}]', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(175, 'natalia.nitzsche', 'jeffrey07@gmail.com', '$2y$10$9CgxaXO6OgeKUG0f0SlqFuYN8aos9tg3UsygfzPCLOnHj6RMdbxT2', '', '[Pa] Adrianna Walter', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3189284965', '8916447', 9, 37, '', NULL, '[{\"student\":\"[St] Ms. Retta Rempel PhD\",\"relation\":\"father\",\"id\":134}]', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(176, 'lindgren.donavon', 'langosh.dahlia@green.biz', '$2y$10$XUIH9USrPxz1fwFMNaz8QuRjRv9XwlAcBdncu7L8iP4HlC74BXiAa', '', '[Pa] Cecelia Hudson', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6360853590', '7881421', 7, 44, '', NULL, '[{\"student\":\"[St] Cali Batz\",\"relation\":\"father\",\"id\":105}]', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(177, 'uwatsica', 'devon48@baumbach.com', '$2y$10$Q9eVTDSCBgIEXbZRb6j0.uSC9NbD52XLQ6n/.93LEqb2NAYqUbEZ2', '', '[Pa] Flavio Mueller', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9010458794', '2289948', 6, 39, '', NULL, '[{\"student\":\"[St] Miss Mossie Hill\",\"relation\":\"father\",\"id\":115}]', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(178, 'sschinner', 'kathleen02@corkery.info', '$2y$10$S71Q3.BV2nW7CUBGZXiDHeijecbjqNcqDCKJ/hrqspCvavPGCaE4a', '', '[Pa] Allan Jones', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8130791668', '1085158', 8, 46, '', NULL, '[{\"student\":\"[St] Tomasa Barton\",\"relation\":\"father\",\"id\":135}]', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(179, 'vkovacek', 'ystanton@morissette.info', '$2y$10$9KS00mEs2sxtUmAWZ5eOH.OHphSdzgHMhPkdkfYI/N/FFuDGAFGYO', '', '[Pa] Hyman Shields', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6790551826', '1306633', 4, 48, '', NULL, '[{\"student\":\"[St] Mr. Amparo Heller I\",\"relation\":\"father\",\"id\":114}]', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(180, 'reilly.fabiola', 'hodkiewicz.ned@gmail.com', '$2y$10$aKQR2r2cgFEHHtMyHRinGeOpgzehB97qWWHwc0KwRO2LIQH/1JG5m', '', '[Pa] Francisca Heathcote', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5436435245', '7142133', 10, 36, '', NULL, '[{\"student\":\"[St] Ms. Kiana Goyette\",\"relation\":\"father\",\"id\":149}]', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(181, 'quigley.mason', 'murazik.naomie@yahoo.com', '$2y$10$coYiwXE5JLyUWKkrhoI0KeIqM5NYCRwU1BGp1sLwPcpCJBpDfGtSi', '', '[Pa] Prof. Moses Kulas I', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9232198331', '6752171', 4, 9, '', NULL, '[{\"student\":\"[St] Cydney Rice\",\"relation\":\"father\",\"id\":121}]', '070.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(182, 'iwaelchi', 'hackett.erwin@stiedemann.com', '$2y$10$T.0kjEpxGLOAzkO8cs/xQu8T49/H68rFtm/I8rX9m4six./aMH8pq', '', '[Pa] Prof. Orion Watsica MD', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9148505571', '4537616', 5, 24, '', NULL, '[{\"student\":\"[St] Miss Mossie Hill\",\"relation\":\"father\",\"id\":115}]', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(183, 'everette79', 'lmacejkovic@douglas.com', '$2y$10$LE6wiH5zNDEZ/PvCp6EN8.1CR5sRMqDwywPYJ7P2/sE9cGgQ13uyu', '', '[Pa] Ricky Heathcote', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3242720609', '7619638', 6, 42, '', NULL, '[{\"student\":\"[St] Kristy Doyle\",\"relation\":\"father\",\"id\":109}]', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(184, 'roel.bradtke', 'fberge@wilderman.com', '$2y$10$NmqrpHRIag/ZPLXY/j3DGevo18NA8FLx3kfiYK7IYzSckFEu87oA2', '', '[Pa] Prof. Nash Tromp MD', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9491205300', '1936060', 7, 50, '', NULL, '[{\"student\":\"[St] Fannie Gulgowski\",\"relation\":\"father\",\"id\":154}]', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(185, 'yadira.hamill', 'ckozey@hotmail.com', '$2y$10$r5q28JmUcX7ZBhc3.9LwuOKRHkuswsZx6hdI1hzeu6rwV0V0F6cBm', '', '[Pa] Kaycee Mayert', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4205534200', '6331772', 6, 14, '', NULL, '[{\"student\":\"[St] Dr. Kyleigh Wisozk PhD\",\"relation\":\"father\",\"id\":112}]', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(186, 'jtoy', 'nwilderman@hotmail.com', '$2y$10$ZqGmJoeoLZIlwvr9IvXqSeGscCr0VBQQ1oLDzNRkkwBHJd12X8JMm', '', '[Pa] Remington Oberbrunner', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5386339683', '4143681', 4, 19, '', NULL, '[{\"student\":\"[St] Miss Lupe Stroman V\",\"relation\":\"father\",\"id\":107}]', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(187, 'waylon.ondricka', 'tressa48@gmail.com', '$2y$10$w8qQyBNKKD8BMJnStXkkaeAjhFKQOaitMTZZj2/gibNYpw1EmSsDG', '', '[Pa] Dr. Ashtyn Skiles', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2811133945', '5833302', 7, 33, '', NULL, '[{\"student\":\"[St] Isabella Crist\",\"relation\":\"father\",\"id\":111}]', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(188, 'jane.west', 'hyatt.colleen@yahoo.com', '$2y$10$QLKlaC9gWpkWyfrYOxZIhuhvERuZWb.Q73FFUVEsP3V5tdk9C4Pae', '', '[Pa] Brandi Swift', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2514597616', '3548920', 5, 7, '', NULL, '[{\"student\":\"[St] Prof. Mozell Stoltenberg\",\"relation\":\"father\",\"id\":143}]', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(189, 'botsford.emanuel', 'annabell89@hotmail.com', '$2y$10$xLTq9Uw3i0CdwpO0hoN7X.OfPmzVOsvTYGzLdcVp1UUrypkEPyPQa', '', '[Pa] Joanie Gibson', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6040708933', '4583981', 3, 25, '', NULL, '[{\"student\":\"[St] Mr. Darrion Reinger MD\",\"relation\":\"father\",\"id\":151}]', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(190, 'terry.domenico', 'onie.kuvalis@gmail.com', '$2y$10$kXUevuSI6Xdt5E5O37PwR.cpoxyxHdhzhoWJZEu.WdHlJxH6kqlz2', '', '[Pa] Filomena Greenfelder', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8655028154', '8321094', 4, 29, '', NULL, '[{\"student\":\"[St] Perry Hills MD\",\"relation\":\"father\",\"id\":125}]', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(191, 'dane.prosacco', 'sadie.mann@hotmail.com', '$2y$10$1vcOWkIug7jkd25hdpZLTeKB4CUL26HwOfNDZskDYVDpym4V5o7.2', '', '[Pa] Magdalena Osinski PhD', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3785599817', '7549432', 4, 4, '', NULL, '[{\"student\":\"[St] Tod Stamm\",\"relation\":\"father\",\"id\":145}]', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(192, 'haag.janae', 'chammes@hotmail.com', '$2y$10$gbHjlOwMtEpBMTnHAhrxn.kTiRi0YFEdzRbByuCq5w7J5ckn4XJ1u', '', '[Pa] Miss Liana Grant', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2237466912', '3570791', 5, 42, '', NULL, '[{\"student\":\"[St] Dr. Kyleigh Wisozk PhD\",\"relation\":\"father\",\"id\":112}]', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(193, 'cordell34', 'wward@yahoo.com', '$2y$10$A.4RZCdJxpbBR6jzmru2OuMHA23CBSzak6g/4yFHBsXig2UJaXzEW', '', '[Pa] Chyna Lynch', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3042900876', '8281812', 1, 10, '', NULL, '[{\"student\":\"[St] Perry Hills MD\",\"relation\":\"father\",\"id\":125}]', '085.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(194, 'warren41', 'richie.walter@gmail.com', '$2y$10$ZWOsCfHP5zwbUkHCSRpQaOB49Mv.65/34hmvSLm3NgBzzMswqS6r.', '', '[Pa] Zena Kunze', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9257204503', '5636911', 5, 45, '', NULL, '[{\"student\":\"[St] Selena Blick\",\"relation\":\"father\",\"id\":153}]', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(195, 'thora42', 'harmony.walter@deckow.com', '$2y$10$VWwRp/vSPAa.3mIAQSycu.LFbkO0SnYJjaJA1MbK2eqmGkWk8iVMe', '', '[Pa] Pierce Nolan', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6762508349', '7989909', 4, 26, '', NULL, '[{\"student\":\"[St] Mr. Darrion Reinger MD\",\"relation\":\"father\",\"id\":151}]', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(196, 'miracle73', 'maud94@ziemann.org', '$2y$10$2iZ26GTGq5M6uLryvmSAcu8ziuyHVT6Df8qrU3geRtZriRwgqABgK', '', '[Pa] Murl Wolf', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3447424449', '3846207', 1, 20, '', NULL, '[{\"student\":\"[St] Elinor Lynch\",\"relation\":\"father\",\"id\":119}]', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(197, 'kozey.gracie', 'stoy@dare.info', '$2y$10$FuVeMq0aeakQtmfOppZtHuFoTff8rwLCkqo0dYz2IoU2vN9Lqgvei', '', '[Pa] Dora Ledner', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2621573310', '4358410', 3, 11, '', NULL, '[{\"student\":\"[St] Kristofer Block DDS\",\"relation\":\"father\",\"id\":148}]', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(198, 'ncruickshank', 'ncremin@spencer.org', '$2y$10$skN9BU9TGkmeML.HsbkJLO.xT98KLxtQiTc9Wwlgyrq5WjiWgHPoa', '', '[Pa] Prof. Adolfo Quigley DVM', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9622769800', '7229864', 9, 36, '', NULL, '[{\"student\":\"[St] Cali Batz\",\"relation\":\"father\",\"id\":105}]', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(199, 'nkrajcik', 'nfeeney@fritsch.net', '$2y$10$nicV88jc0AdXSc6Wjghgp.h5nLt.QkZRqdiBrFXT8T8oqF8Sm/4.S', '', '[Pa] Marilou Luettgen', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4185580993', '1962952', 4, 33, '', NULL, '[{\"student\":\"[St] Cydney Rice\",\"relation\":\"father\",\"id\":121}]', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(200, 'jay.collier', 'candice09@beer.com', '$2y$10$ikLz577znHmvpxxJ1eeJCOWBTLDI.QxDTWt8XpZTfGm8FUXAHhFvK', '', '[Pa] Jamie Gottlieb', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7199452375', '8690297', 6, 10, '', NULL, '[{\"student\":\"[St] Patsy Will\",\"relation\":\"father\",\"id\":118}]', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(201, 'audra78', 'cdurgan@bogan.com', '$2y$10$IjPOvf.ReOd6pDn1OiHVjez0nND6Qf.5DR2c0xkSI0IUPSmmweFyS', '', '[Pa] Ms. Magnolia Abshire', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9429012553', '9750361', 7, 15, '', NULL, '[{\"student\":\"[St] Haylee Boyer\",\"relation\":\"father\",\"id\":123}]', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(202, 'ohirthe', 'deondre.lehner@hotmail.com', '$2y$10$9e9as.0hEC4GGx96x1OdFOxLgwxUzl.x.l89a/fSE8e3H7brKlRv2', '', '[Pa] Antonetta Harris I', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1513739406', '3870267', 6, 23, '', NULL, '[{\"student\":\"[St] Ms. Kiana Goyette\",\"relation\":\"father\",\"id\":149}]', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(203, 'emmerich.anabelle', 'towne.beth@buckridge.com', '$2y$10$F9o03vEye9ZO8s7Cxk0UCuUb.ftSKcxkZEp/Z1l1MCtLX2Knf9bB2', '', '[Pa] Dr. Merritt O\'Connell III', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7178527724', '4495080', 1, 2, '', NULL, '[{\"student\":\"[St] Dr. Zoe Stanton DDS\",\"relation\":\"father\",\"id\":147}]', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(204, 'franco99', 'shanahan.ibrahim@gmail.com', '$2y$10$.0e2ZsPcIRfgZElw3WCtJ.GIyAO349/jPIci9qbn/X2aCvP73b8zu', '', '[Pa] Hannah Emmerich', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6436096933', '5539175', 6, 37, '', NULL, '[{\"student\":\"[St] Mr. Darrion Reinger MD\",\"relation\":\"father\",\"id\":151}]', '053.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(205, 'bashirian.halle', 'cmarks@welch.info', '$2y$10$JU0f2FNocz7lDhn7joDf2u/VcWg3Janqn3LXW5rfLNIWYtUpJOcuq', '', '[Pa] Prof. Lloyd Fay', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1445915746', '7760150', 2, 2, '', NULL, '[{\"student\":\"[St] Kamille Spencer Jr.\",\"relation\":\"father\",\"id\":120}]', '077.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(206, 'gusikowski.jonathan', 'leta.ernser@schultz.com', '$2y$10$Y5xd/53MsZIQJo2stqyETOkF3Elio5FCFRn788BzS/YlJKgV4u6JK', '', '[Pa] Dr. Lenny Hayes', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9775094808', '7101271', 8, 44, '', NULL, '[{\"student\":\"[St] Mr. Amparo Heller I\",\"relation\":\"father\",\"id\":114}]', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `class_schedule`
--
ALTER TABLE `class_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;
--
-- AUTO_INCREMENT for table `messages_list`
--
ALTER TABLE `messages_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;
--
-- AUTO_INCREMENT for table `mm_uploads`
--
ALTER TABLE `mm_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mob_notifications`
--
ALTER TABLE `mob_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=551;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
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
