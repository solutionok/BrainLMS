-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2019 at 07:51 PM
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
  `dormitoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `className`, `classTeacher`, `classAcademicYear`, `classSubjects`, `dormitoryId`) VALUES
(1, 'Class 1', '[\"90\",\"83\",\"94\",\"55\",\"95\",\"68\",\"77\",\"88\",\"91\",\"70\"]', 1, '', 3),
(2, 'Class 2', '[\"104\",\"56\",\"57\",\"63\",\"96\",\"58\",\"86\",\"70\",\"94\",\"87\",\"81\",\"99\"]', 1, '', 2),
(3, 'Class 3', '[\"73\",\"87\",\"66\",\"88\",\"57\",\"85\",\"101\",\"67\",\"63\",\"79\"]', 1, '', 4),
(4, 'Class 4', '[\"73\",\"84\",\"91\",\"98\",\"104\",\"72\"]', 1, '', 2);

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
(1, 'Eius vero.', 'Et odit ut mollitia sint neque excepturi similique debitis nihil alias exercitationem optio.', 'students', 'sunt', '', 0, '1563291995'),
(2, 'Quia quas.', 'Qui quod itaque quo quibusdam unde iure dolor eos voluptatem nihil vero voluptates voluptas.', 'teacher', 'quam', '', 1, '1563291995'),
(3, 'Ab libero consequatur nobis nam.', 'Commodi velit est est qui tenetur ex officiis beatae.', 'parents', 'accusantium', '', 0, '1563291995'),
(4, 'Consequuntur sunt.', 'Minima asperiores autem neque vero voluptates dolore dignissimos exercitationem.', 'parents', 'nisi', '', 0, '1563291995'),
(5, 'Voluptates nulla.', 'Occaecati quisquam quia corporis illo rerum.', 'teacher', 'quis', '', 0, '1563291995'),
(6, 'In deleniti neque quasi.', 'Repellendus vel vel et ut facilis amet culpa.', 'students', 'tempore', '', 1, '1563291995'),
(7, 'Esse animi minus beatae dolorem.', 'Voluptas voluptate enim incidunt dicta vel ad qui aperiam repudiandae a.', 'students', 'qui', '', 1, '1563291995'),
(8, 'Eos et sed.', 'Suscipit laboriosam numquam fugit ut.', 'parents', 'quod', '', 0, '1563291995'),
(9, 'Aut et voluptate quos.', 'Nihil occaecati odit rerum necessitatibus est sint et est voluptatem aliquid.', 'parents', 'voluptas', '', 1, '1563291995'),
(10, 'Fugiat itaque nihil.', 'Quis autem possimus consequatur corrupti dolorum dignissimos voluptates eligendi reprehenderit nam.', 'teacher', 'voluptas', '', 0, '1563291995'),
(11, 'Quidem fuga.', 'Quis quo ut blanditiis autem autem temporibus impedit.', 'parents', 'non', '', 0, '1563291995'),
(12, 'Quo rerum reiciendis.', 'Vitae quaerat praesentium et est animi ab asperiores cumque.', 'teacher', 'eos', '', 1, '1563291995'),
(13, 'Facilis quia sint.', 'Eaque pariatur qui cum ab exercitationem aspernatur aut vitae ut earum exercitationem velit.', 'parents', 'nihil', '', 0, '1563291995'),
(14, 'Minus ex tempora.', 'Voluptatem nam ab itaque natus aut culpa omnis id qui.', 'teacher', 'et', '', 0, '1563291995'),
(15, 'Sunt sed.', 'Sint ea dolorem voluptatibus ab nam ducimus dolores ut mollitia temporibus nostrum expedita.', 'all', 'eligendi', '', 0, '1563291995'),
(16, 'Dolor tempora sunt quos non.', 'Eius quibusdam reprehenderit porro velit distinctio sint.', 'students', 'voluptatem', '', 0, '1563291995'),
(17, 'Ut doloribus nisi et omnis.', 'Doloribus est velit aut.', 'teacher', 'excepturi', '', 1, '1563291995'),
(18, 'Impedit sunt.', 'Voluptatem illum est ut odit dolores quos non ipsum.', 'all', 'minima', '', 0, '1563291995'),
(19, 'Fugit fugit quia quos odit.', 'Exercitationem sit rerum nam quidem soluta culpa odio molestias sunt autem consequuntur.', 'teacher', 'optio', '', 1, '1563291995'),
(20, 'Officia qui rerum.', 'Sapiente dolorem modi molestiae qui beatae itaque a et vero cum.', 'all', 'aut', '', 1, '1563291995'),
(21, 'Ut sapiente.', 'Dolorem minus facilis dolorum dolorum ipsum perspiciatis eum.', 'parents', 'dolor', '', 1, '1563291995'),
(22, 'Aut iste odit.', 'Repellendus aut quia blanditiis est aut eaque provident impedit itaque a quis sequi provident.', 'teacher', 'natus', '', 1, '1563291995'),
(23, 'Fuga quia.', 'Inventore cupiditate non ut perferendis nostrum dolorum officia consequatur vel excepturi esse vel.', 'all', 'nobis', '', 0, '1563291995'),
(24, 'Praesentium qui.', 'Voluptatibus necessitatibus distinctio mollitia qui ut enim eveniet voluptatum quas.', 'all', 'cumque', '', 1, '1563291995'),
(25, 'Aut quo provident.', 'Ut necessitatibus voluptas est omnis vel corporis architecto.', 'teacher', 'quas', '', 1, '1563291995'),
(26, 'Nesciunt quia rerum.', 'Et rem quia rerum possimus architecto quae porro in eius iste nulla ipsa voluptatem et minus earum.', 'teacher', 'distinctio', '', 0, '1563291995'),
(27, 'Vitae at placeat.', 'Qui beatae modi repudiandae quibusdam cum voluptates repellat.', 'parents', 'quae', '', 0, '1563291995'),
(28, 'Cum necessitatibus itaque nihil id qui.', 'Autem voluptatibus necessitatibus minus molestias ratione et explicabo nobis suscipit repudiandae.', 'parents', 'ut', '', 1, '1563291995'),
(29, 'Excepturi vitae.', 'Est totam dicta reprehenderit cumque quo quia et quia optio aliquid sit.', 'students', 'qui', '', 1, '1563291995'),
(30, 'Quia laborum.', 'Qui omnis totam excepturi dicta cumque velit similique.', 'parents', 'ab', '', 0, '1563291995'),
(31, 'Sint vitae omnis.', 'Nobis doloribus aliquid a cupiditate architecto error itaque.', 'parents', 'esse', '', 1, '1563291995'),
(32, 'In ut neque.', 'Dolores adipisci optio ab amet enim et voluptate.', 'teacher', 'reprehenderit', '', 1, '1563291995'),
(33, 'Tempora beatae minima.', 'Dolorem ut harum eos impedit alias et et aut eum exercitationem perferendis ratione itaque.', 'parents', 'consectetur', '', 0, '1563291995'),
(34, 'Molestias exercitationem animi rerum.', 'Magni assumenda architecto cumque enim architecto dolorem repellendus necessitatibus labore qui.', 'parents', 'eum', '', 0, '1563291995'),
(35, 'Maxime dolorem incidunt modi neque dicta.', 'Culpa repellendus veniam ut occaecati in.', 'all', 'quidem', '', 1, '1563291995'),
(36, 'Voluptas voluptas sed.', 'Perferendis ipsa et ea vel.', 'all', 'aut', '', 0, '1563291995'),
(37, 'Nihil ex dignissimos.', 'Ipsa ut qui provident earum delectus nulla vitae qui hic pariatur rem.', 'parents', 'occaecati', '', 0, '1563291995'),
(38, 'Praesentium omnis amet fugiat consequuntur.', 'Sint quos est numquam reprehenderit aut non.', 'all', 'sed', '', 0, '1563291995'),
(39, 'Alias quae dolorem.', 'Dolores accusamus eum deleniti fugit perferendis saepe id.', 'all', 'ut', '', 1, '1563291995'),
(40, 'Ex beatae est.', 'Vitae et assumenda assumenda exercitationem qui.', 'parents', 'consequatur', '', 0, '1563291995'),
(41, 'Sint voluptatem in aut.', 'Quam totam sint consequuntur ut quod sunt minus cumque.', 'all', 'qui', '', 1, '1563291995'),
(42, 'Qui earum non.', 'Voluptatem deleniti eum eveniet quia aperiam aut et incidunt.', 'parents', 'magnam', '', 1, '1563291995'),
(43, 'Enim eligendi.', 'Fugiat doloribus ex sed omnis praesentium maxime assumenda quas necessitatibus minima.', 'all', 'molestias', '', 0, '1563291995'),
(44, 'Dolor dolorem aut tenetur.', 'Suscipit nulla voluptas ullam laudantium nihil animi aut ex accusantium assumenda aut molestias eos voluptatibus nobis.', 'teacher', 'magnam', '', 0, '1563291995'),
(45, 'Ex eius ex eos.', 'Consequuntur deleniti ad eius delectus consectetur dolor.', 'teacher', 'est', '', 1, '1563291995'),
(46, 'Velit quia voluptatem.', 'Nihil molestias omnis similique id.', 'all', 'alias', '', 1, '1563291995'),
(47, 'Aliquid eius omnis sint quisquam totam.', 'Doloremque nostrum eveniet exercitationem voluptatibus similique debitis quod ad voluptas sint aut tempore.', 'teacher', 'magnam', '', 0, '1563291995'),
(48, 'Dolorem suscipit.', 'Ratione molestiae soluta maxime quis enim beatae distinctio est.', 'all', 'non', '', 1, '1563291995'),
(49, 'Blanditiis quia est.', 'Quo atque vitae pariatur iure ut sit ipsam aliquam.', 'parents', 'assumenda', '', 0, '1563291995'),
(50, 'Quia a ducimus nam provident.', 'Alias sit suscipit aliquid aperiam et fugit.', 'parents', 'nemo', '', 0, '1563291995');

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
(1, 'Tomas Ortiz', 'eligendi', 'Dicta aut ducimus dolorem culpa.', '1563291997', 'Dr. Orin Franecki III'),
(2, 'Edward Schuster', 'recusandae', 'Est est dolores ullam aut.', '1563291997', 'Miss Velma Spencer I'),
(3, 'Lempi Pfeffer', 'quas', 'Id commodi saepe molestias qui at magni nam.', '1563291997', 'Magdalen Krajcik'),
(4, 'Prof. Adrien Turner PhD', 'totam', 'Consequatur itaque voluptate vero atque distinctio voluptas et.', '1563291997', 'Ara Cummerata IV'),
(5, 'Prof. Kiara McDermott IV', 'omnis', 'Dolore hic asperiores sit rerum tenetur omnis molestias maiores dolorum.', '1563291997', 'Dr. Waldo Streich'),
(6, 'Annalise Hilpert III', 'voluptas', 'Eligendi vitae quis eligendi enim beatae qui.', '1563291997', 'Garrison Yundt'),
(7, 'Idella Kassulke', 'molestiae', 'Voluptatem consectetur quis.', '1563291997', 'Johnathon Nienow'),
(8, 'Kasandra Walsh', 'ex', 'Explicabo ut illo et nesciunt omnis.', '1563291997', 'Tania Quitzon DDS'),
(9, 'Mr. Bill Emmerich', 'accusantium', 'In odit sapiente qui quisquam consectetur esse et.', '1563291997', 'Kenton Schneider'),
(10, 'Maddison Marvin', 'omnis', 'Perferendis aut a aspernatur ea enim.', '1563291997', 'Prof. Ed Leannon Sr.'),
(11, 'Cordie Ziemann IV', 'eaque', 'Non molestias quia dolore et voluptatibus dolores velit consequuntur vero.', '1563291997', 'Bartholome Keeling PhD'),
(12, 'Nels Ziemann', 'maiores', 'Libero harum accusamus fugiat ducimus magni et.', '1563291997', 'Sedrick West'),
(13, 'Cortez Hills', 'iste', 'Voluptas quidem dolores qui neque qui.', '1563291997', 'Cristian Schulist'),
(14, 'Lavina Willms', 'perspiciatis', 'Quibusdam ut ducimus quod aut culpa et minima.', '1563291997', 'Susanna Kshlerin'),
(15, 'Dell Stroman', 'veniam', 'Officiis suscipit rerum provident quo aut sequi voluptatibus.', '1563291997', 'Antonina Fay PhD'),
(16, 'Dr. Rosina Farrell', 'explicabo', 'Alias molestiae possimus magnam similique et autem.', '1563291997', 'Danielle Kuhic'),
(17, 'Miss Meta Mertz Jr.', 'numquam', 'Maxime ut ex illum magni at delectus non.', '1563291997', 'Deshawn Jenkins'),
(18, 'Prof. Sean Lesch Jr.', 'ipsam', 'Quia dignissimos explicabo iste exercitationem amet vel similique.', '1563291997', 'Christ Walter Jr.'),
(19, 'Prof. Beatrice Hettinger', 'reiciendis', 'Quas modi necessitatibus vitae enim aut possimus omnis.', '1563291997', 'Ms. Delilah Hirthe IV'),
(20, 'Miss Rosanna Goodwin', 'vitae', 'Qui qui eum aut aut et et ut.', '1563291997', 'Dagmar Lebsack'),
(21, 'Fabiola Ebert', 'incidunt', 'Ratione sit fuga est sed corporis quia.', '1563291997', 'Iva Larkin'),
(22, 'Edwina White', 'eum', 'Sit iure nulla magnam cumque autem.', '1563291997', 'Cydney Smith'),
(23, 'Dawn Borer', 'et', 'Eos consequatur rem ab quos similique.', '1563291997', 'Julio Romaguera'),
(24, 'Prof. Brayan Nitzsche', 'et', 'Et qui et dolor asperiores vel maiores qui voluptatum molestiae.', '1563291997', 'Morgan Littel'),
(25, 'Leonora Zboncak', 'a', 'Rerum dolorem molestias veritatis et et.', '1563291997', 'Dr. Clair Oberbrunner'),
(26, 'Nasir Tremblay DDS', 'fugiat', 'Rerum quasi aut at quia sed.', '1563291997', 'Andre Mayer'),
(27, 'Mrs. Naomie Ortiz', 'fugiat', 'Sint deserunt molestiae hic facere fugit ut molestiae nisi molestias.', '1563291997', 'Jedidiah Bednar'),
(28, 'Janis Reilly', 'voluptas', 'Praesentium aut ut eum perferendis voluptatem molestias natus.', '1563291997', 'Nathaniel Kub'),
(29, 'Terrence Barrows', 'aliquam', 'Sapiente aut nihil maiores.', '1563291997', 'Tyler Hettinger'),
(30, 'Dr. Daphnee Douglas II', 'eius', 'Tempore et perferendis officiis unde sapiente omnis qui.', '1563291997', 'Emil Deckow'),
(31, 'Ms. Delta Witting DVM', 'est', 'Perferendis pariatur cumque culpa.', '1563291997', 'Lorena Gerhold'),
(32, 'Wilford Weissnat', 'saepe', 'Eos et magni est a est est ea aut.', '1563291997', 'Bertha Mitchell'),
(33, 'Broderick Abernathy', 'nemo', 'Sint quia velit aut mollitia cumque et autem.', '1563291997', 'Gillian Kertzmann'),
(34, 'Dr. Kendra Brekke IV', 'quisquam', 'Impedit voluptatem qui qui hic quos architecto officia.', '1563291997', 'Raphael Johnson'),
(35, 'Mr. Arjun Braun', 'consequuntur', 'Expedita laudantium dolore illum molestiae autem perferendis molestiae ipsa molestiae.', '1563291997', 'Trey Stanton'),
(36, 'Madelynn Hansen', 'repellat', 'Molestiae nulla tenetur et.', '1563291997', 'Mr. Rodger Terry'),
(37, 'Rowan Abernathy', 'voluptates', 'Vero debitis doloribus dignissimos distinctio sit quod.', '1563291997', 'Roxanne Schmeler'),
(38, 'Dr. Gertrude Reynolds', 'hic', 'Ipsum sed id architecto ut est.', '1563291997', 'Dr. Sarina Will DVM'),
(39, 'Maddison Romaguera', 'eum', 'Ducimus optio omnis sunt.', '1563291997', 'Mireya Kihn'),
(40, 'Eleonore Kohler V', 'esse', 'Dicta modi et eaque laudantium voluptatibus voluptatem voluptatem nihil error eligendi.', '1563291997', 'Marianne Cummings'),
(41, 'Ms. Cristal Oberbrunner', 'aut', 'Reiciendis possimus et est aliquam.', '1563291997', 'Jefferey Nitzsche'),
(42, 'Elta Erdman', 'incidunt', 'Voluptatem architecto odit dicta amet voluptatem nisi autem.', '1563291997', 'Heloise Powlowski'),
(43, 'Celestine Abbott DDS', 'quis', 'Natus velit possimus tempore.', '1563291997', 'Kaia Kshlerin'),
(44, 'Sarah Koss', 'natus', 'Optio id ex quis dolorem consequuntur.', '1563291997', 'Miss Veronica Mitchell Sr.'),
(45, 'Mr. Willard Haley', 'corporis', 'Asperiores ab molestias.', '1563291997', 'Damion Wilkinson'),
(46, 'Leslie Beatty', 'qui', 'Voluptas sed pariatur itaque minus velit voluptas dolor.', '1563291997', 'Juliet Wisoky'),
(47, 'Cathy Johns V', 'dolore', 'Velit hic recusandae tempora accusamus.', '1563291997', 'Durward Streich'),
(48, 'Carole DuBuque', 'sunt', 'Animi asperiores ut laboriosam omnis velit amet maiores non et itaque atque.', '1563291997', 'Christiana DuBuque'),
(49, 'Dalton Torp', 'nihil', 'Ratione quam sapiente quisquam.', '1563291997', 'Prof. Cydney Schaefer'),
(50, 'Prof. Emelie Romaguera', 'officia', 'Atque ab nisi inventore corrupti nostrum eos voluptas.', '1563291997', 'Guillermo Weissnat DVM');

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
(2, 1788, 200, 40, 4, 'Et quia id et qui.', '1563291997', 0),
(5, 9316, 8, 205, 18, 'Cum quam sed.', '1563291998', 0),
(6, 6503, 200, 67, 94, 'Et.', '1563291998', 0),
(7, 3085, 186, 167, 90, 'Atque sit autem.', '1563291998', 1),
(8, 3948, 16, 7, 200, 'Alias ullam et.', '1563291998', 1),
(10, 1223, 8, 59, 156, 'Nisi libero mollitia aut inventore.', '1563291998', 1),
(11, 5794, 87, 56, 24, 'Dolorem praesentium.', '1563291998', 1),
(13, 4512, 190, 205, 16, 'Aspernatur veniam reprehenderit.', '1563291998', 1),
(16, 2671, 60, 187, 169, 'Dignissimos ut ut necessitatibus.', '1563291998', 1),
(17, 3185, 28, 98, 64, 'Veniam dolorem.', '1563291998', 0),
(20, 9495, 45, 7, 81, 'Consequatur eos officia.', '1563291998', 1),
(22, 9861, 72, 169, 205, 'Corrupti unde perferendis sed.', '1563291998', 1),
(24, 1531, 62, 25, 191, 'Voluptatem aut laborum.', '1563291998', 0),
(25, 9062, 44, 33, 59, 'Velit id provident.', '1563291998', 0),
(30, 1299, 204, 188, 98, 'Officia a occaecati.', '1563291998', 1),
(33, 7584, 187, 30, 1, 'Corporis.', '1563291998', 0),
(34, 6828, 59, 158, 45, 'Rerum est.', '1563291998', 1),
(42, 9485, 58, 60, 4, 'Et voluptatum placeat et similique molestias.', '1563291998', 1),
(47, 9398, 19, 78, 199, 'Voluptates.', '1563291998', 1),
(50, 1777, 80, 95, 157, 'Magnam quis aliquid.', '1563291998', 1),
(51, 1002, 10, 173, 32, 'Esse animi non voluptatem.', '1563291998', 1),
(56, 3822, 204, 54, 167, 'Et repellendus dolorem.', '1563291998', 1),
(61, 7822, 62, 69, 59, 'Eaque fuga sed sed.', '1563291998', 1),
(64, 3628, 161, 2, 27, 'Voluptates animi.', '1563291998', 0),
(66, 2677, 179, 158, 178, 'Aut non.', '1563291998', 1),
(67, 3131, 53, 55, 40, 'Eligendi sint.', '1563291998', 0),
(69, 9668, 15, 29, 34, 'Enim esse veniam.', '1563291998', 1),
(70, 8802, 73, 172, 93, 'Nam vero sed sit sint.', '1563291999', 0),
(71, 8045, 93, 32, 45, 'Praesentium est.', '1563291999', 1),
(72, 8377, 98, 35, 191, 'Laborum.', '1563291999', 0),
(75, 3500, 172, 53, 41, 'Amet consectetur.', '1563291999', 1),
(76, 8361, 196, 83, 96, 'Aut distinctio sint.', '1563291999', 0),
(77, 8067, 25, 19, 95, 'Veniam nihil.', '1563291999', 1),
(78, 1118, 30, 171, 76, 'Ut.', '1563291999', 1),
(80, 8408, 101, 158, 175, 'Ratione aut.', '1563291999', 1),
(82, 2077, 51, 167, 185, 'Quas nesciunt porro corrupti.', '1563291999', 0),
(84, 7635, 193, 185, 27, 'Voluptas voluptatem.', '1563291999', 1),
(88, 4908, 44, 36, 81, 'Saepe blanditiis minima quia.', '1563291999', 1),
(91, 6975, 175, 24, 32, 'Perferendis temporibus odio.', '1563291999', 0),
(92, 3663, 53, 34, 28, 'Id.', '1563291999', 1),
(93, 7669, 61, 46, 98, 'Aliquam delectus at.', '1563291999', 0),
(94, 3169, 95, 72, 69, 'Expedita excepturi.', '1563291999', 0),
(99, 6687, 160, 100, 71, 'Aspernatur.', '1563291999', 0),
(100, 2360, 190, 198, 79, 'Harum molestiae nihil.', '1563291999', 1),
(101, 9779, 55, 188, 178, 'Quas nam sit impedit labore.', '1563291999', 1),
(109, 2622, 95, 93, 11, 'Quia cumque.', '1563291999', 0),
(111, 9364, 16, 89, 172, 'Eius.', '1563291999', 0),
(112, 8808, 86, 47, 103, 'Minus alias suscipit quidem.', '1563291999', 1),
(113, 457, 167, 183, 199, 'Quo cupiditate sunt.', '1563291999', 0),
(114, 3556, 167, 23, 184, 'Qui ad odio.', '1563291999', 1),
(115, 838, 26, 81, 103, 'Optio ut dolor placeat.', '1563291999', 1),
(118, 9823, 192, 12, 76, 'Praesentium eius.', '1563291999', 0),
(120, 4103, 65, 183, 54, 'Est vitae excepturi cumque.', '1563291999', 0),
(121, 5959, 102, 21, 55, 'Ut tempora ea.', '1563291999', 1),
(122, 5660, 19, 104, 96, 'Sint commodi rerum ut quo.', '1563291999', 1),
(128, 6788, 89, 37, 185, 'Eveniet molestias dolores nobis suscipit.', '1563291999', 1),
(129, 7025, 199, 10, 30, 'Mollitia dolor praesentium.', '1563291999', 1),
(131, 8798, 206, 5, 174, 'Aliquid laboriosam rerum.', '1563291999', 1),
(132, 4238, 161, 197, 16, 'Molestias dolor molestias dolores.', '1563291999', 0),
(133, 8775, 28, 161, 56, 'Aut quos.', '1563291999', 0),
(138, 689, 60, 57, 57, 'Maiores ipsa dicta inventore molestiae dolores.', '1563291999', 0),
(140, 6748, 31, 59, 22, 'Voluptas.', '1563291999', 1),
(142, 3270, 98, 44, 102, 'Ad incidunt ipsa aliquam.', '1563291999', 1),
(146, 5106, 183, 28, 42, 'Saepe unde perspiciatis est.', '1563291999', 0),
(148, 4938, 178, 178, 197, 'Numquam cum.', '1563291999', 1),
(149, 9616, 18, 10, 55, 'Hic aut accusamus quia.', '1563291999', 0),
(153, 2349, 73, 8, 168, 'Ut nisi nihil autem.', '1563291999', 1),
(156, 746, 102, 43, 99, 'Possimus.', '1563292000', 1),
(166, 9948, 15, 66, 101, 'Repellendus cumque et.', '1563292000', 0),
(167, 3969, 204, 6, 59, 'Mollitia distinctio voluptas suscipit.', '1563292000', 1),
(168, 4041, 36, 165, 159, 'Autem molestias.', '1563292000', 0),
(169, 3592, 200, 62, 96, 'Qui.', '1563292000', 1),
(172, 7415, 65, 50, 12, 'Sit atque libero occaecati optio.', '1563292000', 1),
(173, 9032, 66, 188, 101, 'Nisi sunt error placeat.', '1563292000', 0),
(174, 6200, 65, 74, 17, 'Quis sit aut.', '1563292000', 1),
(177, 8318, 32, 46, 193, 'Iusto qui.', '1563292000', 1),
(178, 3671, 62, 67, 48, 'Quo aut quis ab suscipit.', '1563292000', 1),
(179, 6713, 179, 90, 171, 'Quos voluptas consequuntur.', '1563292000', 0),
(182, 8433, 17, 172, 6, 'Quas quibusdam voluptatibus.', '1563292000', 0),
(184, 5372, 163, 14, 90, 'Maiores eligendi non.', '1563292000', 1),
(185, 6393, 72, 174, 19, 'Suscipit consequatur et.', '1563292000', 0),
(186, 1336, 20, 202, 6, 'Non ut nobis recusandae cum.', '1563292000', 0),
(190, 1198, 74, 193, 88, 'Dolores debitis aliquid quibusdam culpa.', '1563292000', 0),
(191, 4019, 15, 103, 192, 'Necessitatibus earum.', '1563292000', 0),
(195, 3968, 204, 33, 13, 'Dicta ut.', '1563292000', 0),
(203, 8804, 194, 90, 67, 'Voluptatem eos ipsa est maxime omnis.', '1563292000', 0),
(207, 3091, 179, 103, 202, 'Aut mollitia accusantium quia perferendis nihil.', '1563292000', 0),
(208, 4043, 156, 196, 7, 'Iusto enim molestias.', '1563292000', 0),
(210, 5716, 15, 52, 201, 'Alias sapiente.', '1563292000', 1),
(212, 1197, 195, 18, 27, 'Voluptas officiis laborum hic.', '1563292000', 1),
(217, 2850, 167, 54, 36, 'Illum hic.', '1563292000', 0),
(218, 8388, 97, 51, 77, 'Eveniet et quo.', '1563292000', 1),
(223, 7506, 200, 162, 97, 'Ut aspernatur odit.', '1563292000', 1),
(224, 7715, 27, 169, 15, 'Fugit dolorum consequatur nesciunt.', '1563292000', 0),
(225, 8040, 57, 29, 26, 'Cupiditate rem deserunt.', '1563292000', 0),
(233, 3066, 202, 171, 196, 'Voluptatum qui molestias quod aut aut.', '1563292000', 1),
(234, 1556, 160, 32, 83, 'Omnis odit.', '1563292000', 0),
(235, 9107, 42, 30, 94, 'Sed ad.', '1563292001', 1),
(237, 4732, 43, 175, 81, 'Et animi consequatur.', '1563292001', 1),
(238, 9075, 40, 17, 42, 'Id quo consequatur odio.', '1563292001', 1),
(240, 9784, 38, 174, 93, 'Qui non.', '1563292001', 1),
(242, 1028, 82, 164, 176, 'Sequi nobis qui facilis temporibus.', '1563292001', 1),
(244, 3736, 69, 99, 48, 'Porro magni.', '1563292001', 1),
(247, 9788, 167, 22, 43, 'Fugiat nisi non deleniti quasi.', '1563292001', 0),
(250, 4725, 94, 45, 43, 'Laboriosam aut.', '1563292001', 1),
(251, 3358, 88, 198, 89, 'Quibusdam quod.', '1563292001', 1),
(254, 9023, 198, 95, 11, 'Dolores rerum soluta.', '1563292001', 1),
(259, 3612, 172, 10, 92, 'Facilis dolore modi rerum.', '1563292001', 0),
(263, 8975, 203, 98, 34, 'Dolores quas dolores architecto voluptatibus.', '1563292001', 1),
(264, 3772, 173, 100, 170, 'Fugit necessitatibus voluptatem dolorem.', '1563292001', 1),
(265, 6561, 195, 15, 88, 'Voluptas recusandae iste tenetur voluptatem est.', '1563292001', 1),
(268, 280, 9, 17, 176, 'Consequuntur incidunt velit quos laboriosam.', '1563292001', 0),
(269, 3495, 198, 15, 176, 'Aut sequi accusantium est.', '1563292001', 0),
(274, 9779, 200, 46, 5, 'Nam numquam eligendi.', '1563292001', 0),
(277, 8061, 200, 22, 195, 'Et aspernatur odit aut.', '1563292001', 1),
(290, 2226, 74, 172, 51, 'Sit praesentium numquam ut.', '1563292001', 0),
(291, 9491, 98, 198, 80, 'Incidunt.', '1563292001', 0),
(292, 6686, 38, 59, 34, 'Dicta voluptas modi.', '1563292001', 0),
(296, 2105, 190, 5, 23, 'Quo.', '1563292001', 1),
(300, 6114, 21, 102, 190, 'Laborum est eos.', '1563292001', 0),
(305, 8766, 55, 77, 36, 'Iure est fugit quia soluta dicta.', '1563292001', 0),
(308, 9503, 65, 26, 93, 'Voluptas et occaecati sunt harum.', '1563292001', 0),
(309, 2880, 174, 78, 158, 'Sequi exercitationem tempore debitis natus recusandae.', '1563292001', 1),
(310, 6828, 84, 95, 17, 'Sit incidunt ex autem dolor doloribus.', '1563292001', 1),
(314, 1764, 86, 29, 194, 'Maxime non est rem.', '1563292001', 0),
(316, 1312, 20, 85, 58, 'Et laboriosam sunt.', '1563292001', 1),
(317, 9142, 66, 201, 8, 'Molestiae.', '1563292001', 0),
(318, 9610, 194, 19, 21, 'Voluptas amet commodi enim.', '1563292001', 1),
(320, 8879, 67, 47, 67, 'Itaque occaecati.', '1563292002', 1),
(321, 4733, 15, 19, 205, 'Nemo quo aut.', '1563292002', 1),
(322, 2745, 97, 12, 52, 'Temporibus delectus perspiciatis voluptatem.', '1563292002', 1),
(327, 4838, 69, 200, 69, 'Quo.', '1563292002', 1),
(333, 9400, 99, 74, 199, 'Tempora nesciunt numquam.', '1563292002', 0),
(336, 486, 102, 65, 38, 'Ullam.', '1563292002', 0),
(340, 9472, 167, 166, 8, 'Numquam.', '1563292002', 1),
(341, 5906, 46, 190, 86, 'Impedit iste.', '1563292002', 0),
(343, 20, 170, 17, 88, 'Consequatur non est aspernatur.', '1563292002', 1),
(344, 5848, 45, 194, 72, 'Maxime dolorem.', '1563292002', 0),
(345, 1706, 163, 181, 76, 'Excepturi et quaerat ea eaque.', '1563292002', 1),
(346, 634, 12, 59, 36, 'Est est.', '1563292002', 1),
(347, 1261, 180, 181, 76, 'Cum illo saepe laudantium placeat.', '1563292002', 0),
(348, 1984, 168, 55, 32, 'Magnam consequatur.', '1563292002', 0),
(352, 4587, 10, 75, 54, 'Ad deserunt enim quam hic.', '1563292002', 1),
(354, 4518, 72, 96, 203, 'Reprehenderit nihil iusto ullam voluptas.', '1563292002', 0),
(355, 3901, 188, 192, 47, 'Non sint.', '1563292002', 0),
(356, 9359, 96, 20, 161, 'Autem assumenda et.', '1563292002', 1),
(359, 8825, 181, 68, 4, 'Nam.', '1563292002', 1),
(360, 6829, 158, 8, 205, 'Et qui.', '1563292002', 1),
(362, 6873, 171, 55, 197, 'Eos consequatur veritatis.', '1563292002', 0),
(365, 9361, 161, 66, 163, 'Deserunt at ea.', '1563292002', 0),
(367, 8858, 179, 160, 65, 'Aperiam nihil doloremque aut.', '1563292002', 1),
(370, 2585, 177, 50, 99, 'Perspiciatis mollitia.', '1563292002', 0),
(371, 1450, 184, 159, 81, 'Soluta maiores corrupti.', '1563292002', 0),
(374, 3757, 22, 57, 13, 'Sed dolore aperiam ut facere similique.', '1563292002', 1),
(377, 4599, 76, 43, 7, 'Est quia molestiae unde atque.', '1563292002', 0),
(380, 1414, 179, 13, 202, 'Sunt itaque eos tempore.', '1563292002', 1),
(381, 752, 34, 10, 91, 'Officiis est eum nam nulla sit.', '1563292002', 1),
(384, 5337, 38, 157, 92, 'Est.', '1563292002', 1),
(385, 8673, 76, 80, 88, 'Doloremque perferendis.', '1563292002', 0),
(386, 7842, 59, 22, 187, 'Consequatur consectetur.', '1563292002', 0),
(387, 9456, 59, 12, 26, 'Repudiandae exercitationem.', '1563292002', 1),
(392, 6035, 43, 173, 182, 'Et modi.', '1563292002', 0),
(400, 755, 92, 78, 162, 'Commodi est velit.', '1563292002', 0),
(402, 4507, 62, 90, 39, 'Enim aperiam vitae.', '1563292002', 1),
(403, 8698, 159, 44, 192, 'Omnis reiciendis explicabo fuga.', '1563292002', 0),
(404, 9020, 4, 160, 172, 'Et odit ea.', '1563292002', 0),
(405, 5101, 16, 78, 21, 'Officia quo.', '1563292002', 1),
(406, 6534, 42, 19, 33, 'Praesentium et reprehenderit officia.', '1563292002', 0),
(407, 7078, 45, 56, 55, 'Repudiandae at.', '1563292003', 0),
(412, 6104, 84, 99, 19, 'Sit qui omnis sunt.', '1563292003', 1),
(417, 8872, 203, 183, 50, 'Quia sit autem.', '1563292003', 0),
(423, 6267, 174, 181, 1, 'Quaerat vel aspernatur et qui.', '1563292003', 1),
(428, 3727, 103, 30, 204, 'Veniam quaerat sit aperiam dolor.', '1563292003', 0),
(429, 2161, 70, 195, 201, 'Numquam et consequuntur.', '1563292003', 0),
(431, 5515, 178, 82, 56, 'Molestiae quis aut aliquid.', '1563292003', 1),
(434, 2010, 1, 206, 92, 'Quidem laboriosam.', '1563292003', 0),
(435, 5629, 43, 11, 70, 'Sit et.', '1563292003', 1),
(440, 2972, 56, 59, 94, 'Sit dicta nihil.', '1563292003', 0),
(443, 375, 5, 62, 61, 'Iure.', '1563292003', 0),
(444, 813, 21, 66, 181, 'Cumque nemo.', '1563292003', 0),
(451, 7490, 178, 6, 86, 'In perferendis natus.', '1563292003', 1),
(453, 5540, 77, 193, 30, 'Placeat eum.', '1563292003', 0),
(454, 8578, 99, 96, 77, 'Id accusantium a similique error.', '1563292003', 0),
(457, 550, 69, 34, 94, 'Fugit ullam.', '1563292003', 0),
(459, 2765, 40, 31, 62, 'Voluptates quas ut voluptatem quia.', '1563292003', 1),
(460, 1702, 23, 197, 83, 'Atque et corrupti.', '1563292003', 0),
(462, 963, 158, 104, 177, 'Quasi.', '1563292003', 1),
(466, 2247, 63, 90, 85, 'Totam repellat.', '1563292003', 1),
(470, 626, 91, 43, 79, 'Aut perspiciatis.', '1563292003', 0),
(471, 9027, 33, 39, 73, 'Tempore corrupti.', '1563292003', 0),
(472, 9340, 67, 84, 104, 'Commodi distinctio.', '1563292003', 0),
(476, 8404, 99, 191, 178, 'Nihil distinctio.', '1563292003', 0),
(479, 1279, 165, 87, 28, 'Nisi quis quia aut.', '1563292003', 1),
(484, 3253, 94, 194, 1, 'Laboriosam ut culpa iste.', '1563292003', 0),
(485, 291, 7, 59, 186, 'Placeat quasi explicabo ut.', '1563292003', 1),
(486, 337, 58, 37, 90, 'Placeat nemo.', '1563292003', 0),
(487, 3644, 199, 194, 182, 'Ipsa culpa.', '1563292004', 0),
(489, 2789, 12, 6, 204, 'Exercitationem debitis consequatur ducimus recusandae.', '1563292004', 0),
(495, 2093, 199, 19, 28, 'Nihil ea.', '1563292004', 0),
(499, 6068, 22, 47, 167, 'Quia.', '1563292004', 0),
(503, 3811, 8, 160, 66, 'Quo veniam.', '1563292004', 0),
(507, 2814, 23, 205, 203, 'Numquam facilis labore.', '1563292004', 0),
(509, 4624, 157, 26, 46, 'Quos pariatur aut fugit.', '1563292004', 1),
(512, 4506, 3, 74, 168, 'Qui vero.', '1563292005', 0),
(516, 3560, 171, 158, 17, 'Laboriosam sapiente.', '1563292005', 1),
(518, 5408, 51, 13, 1, 'Repellat dolorum recusandae tempore soluta.', '1563292005', 1),
(526, 627, 62, 191, 72, 'Totam quia at.', '1563292005', 0),
(529, 8536, 41, 54, 46, 'Autem quod.', '1563292005', 0),
(531, 1651, 17, 89, 68, 'Explicabo molestiae.', '1563292005', 0),
(533, 6446, 40, 12, 2, 'Culpa.', '1563292005', 1),
(536, 187, 199, 168, 65, 'Qui quasi ut aut ut.', '1563292006', 1),
(537, 5008, 25, 181, 99, 'Non corporis consequuntur.', '1563292006', 0),
(538, 5425, 95, 5, 77, 'Voluptatem dolores recusandae tempora quidem.', '1563292006', 0),
(541, 9414, 160, 73, 99, 'Laboriosam fugiat dolorum consequatur.', '1563292006', 1),
(545, 5198, 184, 204, 102, 'Recusandae fuga.', '1563292006', 0),
(547, 3749, 47, 204, 161, 'Temporibus pariatur et eos.', '1563292006', 0),
(548, 4954, 100, 93, 174, 'Nam molestiae molestiae.', '1563292006', 1),
(553, 5185, 163, 36, 4, 'Et explicabo.', '1563292006', 0),
(555, 6643, 103, 24, 95, 'Et minus quis sapiente.', '1563292006', 1),
(560, 5838, 160, 95, 158, 'Veniam delectus quo mollitia et.', '1563292006', 0),
(561, 6866, 47, 174, 40, 'Dolor aliquam voluptatem eveniet quidem.', '1563292006', 0),
(566, 7841, 34, 41, 5, 'Blanditiis omnis.', '1563292006', 0),
(568, 6736, 78, 157, 183, 'Quibusdam architecto et.', '1563292006', 0),
(570, 3979, 57, 194, 188, 'Deserunt aliquid.', '1563292006', 1),
(572, 214, 42, 190, 60, 'Adipisci.', '1563292006', 1),
(573, 8674, 81, 173, 66, 'Suscipit quos iste consequatur.', '1563292006', 1),
(574, 1014, 182, 30, 84, 'Voluptates et aspernatur totam.', '1563292006', 0),
(579, 7156, 104, 33, 168, 'Et cumque ut.', '1563292006', 0),
(580, 8897, 65, 14, 66, 'Sed et quam.', '1563292007', 0),
(581, 7134, 55, 66, 6, 'Nisi molestias.', '1563292007', 0),
(582, 7708, 103, 70, 204, 'Et.', '1563292007', 1),
(584, 9859, 190, 190, 193, 'Omnis aut.', '1563292007', 1),
(587, 9791, 70, 204, 11, 'Assumenda iusto aspernatur.', '1563292007', 0),
(593, 2843, 58, 57, 202, 'Dicta ut labore quibusdam.', '1563292007', 0),
(596, 5979, 173, 22, 175, 'Quam et.', '1563292007', 0),
(602, 6595, 66, 32, 166, 'Similique harum vero quaerat tempora.', '1563292007', 1),
(603, 3891, 182, 201, 205, 'Adipisci in.', '1563292007', 0),
(604, 7480, 176, 19, 187, 'Autem et omnis ad voluptatum.', '1563292007', 0),
(606, 7930, 187, 36, 56, 'Et velit.', '1563292007', 1),
(609, 4891, 96, 65, 84, 'Aut commodi.', '1563292007', 1),
(614, 771, 74, 196, 167, 'Consequatur.', '1563292007', 0),
(617, 9980, 177, 34, 192, 'Illo tenetur.', '1563292007', 0),
(619, 4716, 101, 72, 72, 'Unde soluta voluptas.', '1563292007', 0),
(620, 5815, 13, 2, 158, 'Officiis rerum nobis.', '1563292007', 1),
(625, 3841, 33, 85, 1, 'Eaque reiciendis.', '1563292007', 0),
(626, 790, 181, 38, 162, 'Eaque.', '1563292007', 1),
(628, 9423, 74, 34, 60, 'Repudiandae illo deleniti aspernatur.', '1563292007', 0),
(629, 5065, 33, 176, 55, 'Est debitis debitis.', '1563292007', 0),
(631, 2300, 172, 82, 28, 'Vero fugit.', '1563292007', 1),
(634, 1022, 26, 73, 178, 'Corrupti earum dolores.', '1563292007', 0),
(635, 9007, 166, 185, 184, 'Perferendis blanditiis reprehenderit consequatur.', '1563292007', 1),
(638, 3930, 164, 86, 84, 'Molestiae ipsum.', '1563292007', 1),
(639, 37, 42, 175, 86, 'Facilis.', '1563292007', 1),
(641, 3612, 100, 17, 177, 'Est ab.', '1563292007', 0),
(642, 695, 46, 157, 3, 'Et enim voluptatum.', '1563292007', 0),
(645, 7060, 95, 67, 202, 'Quia officiis.', '1563292007', 0),
(648, 5156, 160, 162, 3, 'Ea expedita.', '1563292007', 0),
(649, 5818, 35, 35, 64, 'Et et cupiditate.', '1563292007', 1),
(650, 8323, 161, 198, 83, 'Laborum quaerat quaerat ipsa eligendi.', '1563292007', 0),
(653, 7720, 88, 192, 174, 'Temporibus officia ut numquam.', '1563292008', 1),
(654, 4533, 178, 8, 175, 'Assumenda inventore.', '1563292008', 1),
(657, 4894, 177, 69, 183, 'Iusto.', '1563292008', 0),
(658, 3146, 184, 193, 43, 'Expedita labore.', '1563292008', 0),
(659, 3013, 163, 76, 51, 'Fugiat iure.', '1563292008', 1),
(664, 9654, 65, 59, 54, 'Rerum accusamus quam qui.', '1563292008', 1),
(668, 714, 3, 42, 21, 'Ut consequatur excepturi.', '1563292008', 0),
(669, 117, 167, 33, 201, 'Sit porro voluptas ullam.', '1563292008', 0),
(671, 8266, 172, 50, 89, 'Ab a sint sapiente repellat aut.', '1563292008', 1),
(676, 2978, 82, 44, 183, 'Commodi qui impedit facere non.', '1563292008', 0),
(678, 4604, 96, 78, 9, 'Officiis sequi.', '1563292008', 0),
(679, 304, 16, 21, 102, 'Eos autem.', '1563292008', 1),
(680, 9560, 190, 201, 195, 'Maxime.', '1563292008', 0),
(681, 1447, 157, 5, 167, 'Unde error numquam.', '1563292008', 1),
(682, 4215, 88, 172, 19, 'Beatae ducimus.', '1563292008', 0),
(683, 4259, 42, 75, 82, 'Nisi voluptas fugiat cumque eum.', '1563292008', 0),
(686, 3798, 40, 92, 190, 'Laboriosam aut soluta voluptatem.', '1563292008', 0),
(687, 1623, 7, 15, 171, 'Nisi praesentium eum.', '1563292009', 1),
(688, 3863, 179, 166, 11, 'Atque ea rerum.', '1563292009', 1),
(690, 1090, 181, 47, 13, 'Praesentium itaque praesentium quidem et.', '1563292009', 0),
(692, 5711, 30, 7, 188, 'Eaque et.', '1563292009', 0),
(696, 9499, 37, 41, 4, 'Facilis incidunt ullam ipsam.', '1563292009', 1),
(699, 724, 164, 78, 160, 'Non.', '1563292009', 0),
(700, 1545, 56, 162, 95, 'Quisquam quaerat aut.', '1563292009', 1),
(702, 8146, 158, 206, 6, 'Voluptatem alias ratione.', '1563292009', 1),
(708, 4100, 63, 190, 182, 'Ipsam placeat aliquid.', '1563292009', 1),
(710, 8036, 205, 31, 95, 'Quod labore in nobis.', '1563292009', 1),
(714, 3984, 191, 48, 75, 'Nihil in eaque libero.', '1563292009', 0),
(724, 7993, 24, 172, 2, 'Ut nulla asperiores fuga.', '1563292009', 0),
(729, 6789, 180, 3, 26, 'Quasi expedita molestiae.', '1563292010', 1),
(733, 5372, 86, 32, 79, 'Itaque ratione.', '1563292010', 0),
(735, 4165, 166, 69, 68, 'Facilis molestiae.', '1563292010', 0),
(739, 7414, 158, 179, 97, 'Aliquid earum tempora.', '1563292010', 0),
(740, 8418, 186, 12, 169, 'Qui enim.', '1563292010', 0),
(743, 7121, 43, 75, 70, 'Facilis qui.', '1563292010', 1),
(746, 706, 192, 204, 34, 'Dolore vitae eos in voluptatem ea.', '1563292010', 0),
(756, 7605, 67, 98, 13, 'Consequuntur similique quo sit.', '1563292010', 0),
(757, 7691, 192, 1, 185, 'Enim quidem voluptatem.', '1563292010', 0),
(759, 8255, 188, 10, 23, 'Quis nemo.', '1563292010', 1),
(763, 1438, 205, 29, 39, 'Eaque et quidem.', '1563292011', 0),
(768, 3571, 3, 74, 48, 'Qui dignissimos eum praesentium minus.', '1563292011', 0),
(772, 9765, 40, 195, 23, 'Iste dignissimos.', '1563292011', 0),
(773, 4962, 170, 58, 93, 'Consequatur veritatis in.', '1563292011', 1),
(776, 9059, 164, 90, 54, 'Architecto ullam veritatis saepe repudiandae.', '1563292011', 0),
(778, 3809, 6, 63, 179, 'Voluptate.', '1563292011', 0),
(779, 2274, 52, 179, 58, 'Quia reiciendis.', '1563292011', 1),
(781, 6951, 10, 192, 38, 'Dolorem sit praesentium.', '1563292011', 0),
(786, 2558, 65, 157, 76, 'Sed numquam.', '1563292011', 0),
(787, 5256, 85, 76, 103, 'Nobis officia.', '1563292011', 1),
(788, 2507, 74, 189, 84, 'Rerum ut natus.', '1563292011', 0),
(790, 1404, 74, 196, 192, 'Necessitatibus.', '1563292012', 0),
(791, 7010, 97, 177, 175, 'Est voluptatem nihil.', '1563292012', 1),
(793, 6347, 28, 50, 66, 'Consequatur culpa repellat nulla.', '1563292012', 0),
(797, 9482, 43, 159, 6, 'Enim amet omnis.', '1563292012', 0),
(799, 5892, 195, 63, 43, 'Molestiae id.', '1563292012', 0),
(801, 6928, 156, 11, 13, 'Eos est sed recusandae laudantium quo.', '1563292012', 1),
(803, 8195, 12, 174, 56, 'Labore et minus velit dolorem cupiditate.', '1563292012', 1),
(804, 3538, 156, 53, 170, 'Mollitia rerum.', '1563292012', 1),
(809, 6698, 76, 185, 172, 'Magnam omnis in quae mollitia quae.', '1563292012', 1),
(811, 6457, 100, 86, 73, 'Nostrum voluptates hic id optio.', '1563292012', 0),
(818, 1235, 100, 164, 86, 'Quod voluptatem cumque.', '1563292012', 1),
(819, 3072, 173, 201, 45, 'At et.', '1563292012', 0),
(820, 1639, 201, 11, 92, 'Quod quo illo ipsum.', '1563292013', 0),
(821, 9080, 83, 184, 74, 'Unde unde et quo.', '1563292013', 0),
(823, 8742, 206, 14, 61, 'Vel consequatur autem.', '1563292013', 0),
(833, 3699, 189, 45, 98, 'Odit enim modi eius.', '1563292013', 0),
(834, 7842, 203, 194, 1, 'Cupiditate sed at.', '1563292013', 1),
(835, 5642, 73, 56, 102, 'Illum modi.', '1563292013', 1),
(839, 3355, 88, 34, 3, 'Excepturi ut illum distinctio.', '1563292013', 0),
(841, 914, 29, 28, 8, 'Unde et.', '1563292013', 0),
(843, 123, 29, 181, 97, 'Dolorum unde non reiciendis cumque.', '1563292013', 0),
(844, 3365, 34, 171, 205, 'Tempore qui vel officiis.', '1563292013', 1),
(845, 425, 81, 21, 181, 'Sunt quia et.', '1563292013', 1),
(846, 3459, 63, 3, 162, 'Aut.', '1563292014', 1),
(847, 5472, 83, 48, 27, 'Ut suscipit iusto.', '1563292014', 1),
(851, 9977, 160, 85, 6, 'Et.', '1563292014', 0),
(855, 6973, 55, 9, 171, 'Quod alias.', '1563292014', 1),
(859, 7268, 164, 37, 54, 'Odio dolorem.', '1563292014', 1),
(864, 4361, 25, 22, 8, 'Dolores et sed quia aperiam.', '1563292014', 1),
(866, 9613, 18, 79, 183, 'Sit dolores ut ad.', '1563292014', 0),
(868, 7173, 76, 70, 66, 'Voluptatem.', '1563292014', 0),
(869, 3644, 97, 193, 51, 'Mollitia eum.', '1563292014', 0),
(870, 6982, 39, 197, 56, 'Et expedita possimus.', '1563292014', 0),
(872, 8647, 157, 26, 27, 'Et corporis quod.', '1563292014', 1),
(877, 1196, 53, 99, 170, 'Blanditiis occaecati quasi at.', '1563292014', 1),
(880, 5908, 28, 96, 57, 'Ut ut quas distinctio.', '1563292014', 0),
(881, 1010, 13, 175, 22, 'Exercitationem consequatur est eum.', '1563292014', 0),
(883, 6795, 20, 3, 204, 'Omnis harum aut.', '1563292014', 0),
(885, 3290, 68, 49, 19, 'Qui aut consequatur consequatur.', '1563292014', 1),
(887, 599, 160, 181, 205, 'Esse unde quis.', '1563292014', 0),
(888, 9085, 68, 57, 197, 'Quae tempore id.', '1563292014', 1),
(889, 1353, 24, 174, 101, 'Deserunt aut.', '1563292014', 0),
(890, 1689, 32, 11, 10, 'Porro repellendus deleniti aperiam.', '1563292014', 1),
(891, 7270, 17, 54, 82, 'Tempore autem et.', '1563292014', 1),
(894, 4137, 16, 67, 177, 'Iste et.', '1563292014', 1),
(895, 3094, 9, 53, 178, 'Unde eos.', '1563292014', 0),
(901, 4777, 188, 200, 164, 'Laudantium culpa ut.', '1563292014', 1),
(904, 9529, 41, 173, 25, 'Id porro et amet.', '1563292014', 0),
(905, 7063, 34, 72, 158, 'Ut officia inventore.', '1563292014', 0),
(906, 9658, 190, 7, 158, 'Perspiciatis sequi.', '1563292014', 1),
(908, 2565, 11, 104, 2, 'Perspiciatis nobis.', '1563292014', 0),
(910, 2696, 31, 66, 58, 'Inventore temporibus voluptatibus.', '1563292014', 0),
(911, 4373, 47, 184, 31, 'Aut aut.', '1563292014', 1),
(913, 9441, 172, 9, 62, 'Commodi iste voluptatibus.', '1563292014', 0),
(914, 4630, 38, 66, 163, 'Iste.', '1563292014', 0),
(918, 2445, 24, 75, 158, 'Molestiae esse.', '1563292014', 0),
(920, 5899, 182, 4, 36, 'Reiciendis consequatur consequatur.', '1563292014', 0),
(923, 2103, 69, 91, 206, 'Ducimus est.', '1563292015', 0),
(929, 9317, 59, 92, 169, 'Eos consequuntur rem suscipit.', '1563292015', 1),
(931, 5431, 157, 59, 60, 'Et tempore cumque.', '1563292015', 1),
(933, 6272, 84, 48, 181, 'Adipisci iure.', '1563292015', 0),
(934, 636, 41, 188, 51, 'Amet vel facilis rerum.', '1563292015', 0),
(937, 1940, 168, 188, 189, 'Quidem similique.', '1563292015', 0),
(940, 4046, 76, 206, 163, 'Inventore.', '1563292015', 0),
(941, 2664, 92, 48, 200, 'Expedita.', '1563292015', 1),
(942, 2097, 181, 183, 79, 'Voluptas et.', '1563292015', 0),
(946, 2618, 16, 19, 45, 'Iusto ducimus.', '1563292015', 1),
(947, 5998, 84, 80, 69, 'Similique autem omnis illo ea est.', '1563292015', 0),
(953, 7039, 161, 69, 157, 'Alias nobis consequatur rerum.', '1563292015', 0),
(955, 75, 39, 187, 92, 'Provident.', '1563292015', 0),
(956, 2611, 61, 90, 16, 'Rerum assumenda odit itaque sint non.', '1563292015', 1),
(958, 2640, 41, 163, 49, 'Dolores quidem recusandae qui.', '1563292015', 0),
(962, 2696, 159, 44, 26, 'Distinctio.', '1563292015', 0),
(964, 5203, 3, 183, 78, 'Exercitationem non.', '1563292015', 1),
(966, 4630, 39, 99, 185, 'Molestiae nesciunt omnis.', '1563292015', 1),
(967, 8908, 156, 33, 13, 'Commodi ratione sapiente quo similique.', '1563292015', 0),
(968, 635, 33, 205, 81, 'Quod voluptatum voluptatibus voluptate.', '1563292015', 1),
(970, 1378, 176, 50, 15, 'Voluptas nostrum.', '1563292015', 0),
(973, 2919, 62, 33, 43, 'Omnis.', '1563292015', 1),
(974, 7630, 8, 53, 95, 'Non inventore.', '1563292015', 0),
(976, 5954, 92, 58, 63, 'Possimus dolores quo.', '1563292015', 0),
(980, 6969, 190, 52, 190, 'Neque repellat quia.', '1563292016', 1),
(982, 3901, 35, 162, 11, 'Provident commodi maxime.', '1563292016', 1),
(983, 1922, 64, 38, 165, 'Nisi eveniet.', '1563292016', 0),
(985, 9219, 10, 77, 61, 'Reiciendis eligendi perferendis sequi.', '1563292016', 1),
(987, 9470, 158, 206, 4, 'Accusamus explicabo.', '1563292016', 1),
(991, 7485, 203, 171, 191, 'Et.', '1563292016', 0),
(993, 5737, 19, 29, 8, 'Provident quo excepturi omnis est.', '1563292016', 0),
(994, 5193, 206, 94, 83, 'Nemo.', '1563292016', 0),
(995, 4795, 199, 198, 61, 'Harum sunt alias aut.', '1563292016', 0),
(996, 6188, 206, 102, 187, 'Fugiat rerum culpa.', '1563292016', 0),
(997, 2356, 104, 58, 93, 'Sit ea.', '1563292016', 1),
(1000, 3801, 182, 192, 191, 'Aut porro.', '1563292016', 1);

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
(1, 11, 104, 'Quia at.', '1563275609', 1, 0),
(3, 94, 6, 'Et earum.', '1563275609', 0, 0),
(4, 57, 69, 'Id aut saepe dolore.', '1563275609', 0, 0),
(6, 104, 73, 'Illo.', '1563275609', 0, 0),
(8, 63, 191, 'Fuga.', '1563275609', 0, 1),
(9, 188, 96, 'Odit perspiciatis cupiditate iure porro.', '1563275610', 1, 0),
(10, 39, 167, 'Aliquid rem rerum.', '1563275610', 0, 1),
(11, 29, 65, 'Et modi voluptatem et.', '1563275610', 0, 1),
(12, 58, 194, 'Ipsa dolorem vel totam.', '1563275610', 0, 0),
(15, 165, 168, 'Perferendis consequatur velit similique unde ipsam.', '1563275610', 0, 0),
(17, 180, 1, 'Voluptas ut dignissimos.', '1563275610', 0, 1),
(19, 8, 9, 'Quasi voluptas.', '1563275610', 0, 1),
(21, 40, 84, 'Sit impedit dolores.', '1563275610', 1, 0),
(22, 21, 82, 'Qui esse perspiciatis.', '1563275610', 0, 0),
(23, 7, 39, 'Sed earum doloribus.', '1563275610', 1, 1),
(24, 17, 60, 'Possimus veritatis.', '1563275610', 1, 1),
(25, 4, 187, 'Ut ut ab dolorum.', '1563275610', 1, 1),
(27, 6, 184, 'Voluptas.', '1563275610', 1, 0),
(28, 168, 12, 'Similique vel.', '1563275610', 1, 0),
(29, 195, 27, 'Aut.', '1563275610', 1, 1),
(31, 172, 45, 'Nihil eum repellat.', '1563275610', 0, 0),
(32, 50, 180, 'Ut ullam.', '1563275610', 0, 1),
(34, 198, 164, 'Inventore autem doloremque quia non hic.', '1563275611', 1, 1),
(36, 201, 192, 'Debitis aliquam necessitatibus et.', '1563275611', 1, 1),
(37, 9, 70, 'Harum porro.', '1563275611', 1, 0),
(38, 200, 27, 'Dolores tenetur.', '1563275611', 0, 0),
(40, 8, 171, 'Ratione.', '1563275611', 0, 1),
(41, 18, 181, 'Recusandae libero.', '1563275611', 0, 0),
(47, 19, 63, 'Similique non velit.', '1563275611', 1, 1),
(48, 45, 51, 'Et eaque numquam cumque molestiae.', '1563275611', 1, 0),
(54, 77, 13, 'Ut suscipit laborum exercitationem reprehenderit.', '1563275696', 1, 0),
(56, 78, 26, 'Nihil sed odio.', '1563275696', 1, 1),
(58, 29, 166, 'Facilis enim quia aut.', '1563275696', 1, 0),
(60, 52, 61, 'Eligendi eius.', '1563275696', 0, 0),
(61, 83, 76, 'Ex autem et.', '1563275696', 0, 0),
(62, 162, 3, 'Fuga totam quod.', '1563275696', 1, 1),
(63, 56, 38, 'Eius earum pariatur.', '1563275696', 1, 1),
(64, 62, 24, 'Et velit.', '1563275696', 0, 1),
(65, 82, 189, 'Voluptatem.', '1563275696', 1, 0),
(68, 199, 176, 'Consequatur nemo earum voluptatem.', '1563275696', 0, 1),
(69, 94, 50, 'Quam.', '1563275696', 1, 1),
(70, 179, 61, 'Pariatur omnis.', '1563275696', 1, 0),
(72, 166, 11, 'Consequatur suscipit praesentium ipsam ducimus quis.', '1563275696', 0, 1),
(73, 51, 42, 'Praesentium quo quis.', '1563275696', 0, 1),
(74, 169, 49, 'Tenetur.', '1563275696', 0, 1),
(76, 187, 97, 'Sit.', '1563275696', 0, 1),
(78, 202, 193, 'Deleniti quod esse et dolor esse.', '1563275696', 1, 0),
(79, 47, 82, 'Tempore nihil.', '1563275696', 1, 0),
(80, 66, 193, 'Voluptas voluptas ut necessitatibus.', '1563275696', 0, 1),
(83, 189, 186, 'Voluptas ratione porro.', '1563275696', 0, 0),
(84, 200, 168, 'Et quia perspiciatis debitis.', '1563275696', 0, 0),
(85, 21, 90, 'In explicabo sit.', '1563275696', 0, 0),
(86, 163, 1, 'Exercitationem cupiditate quam neque adipisci.', '1563275696', 1, 0),
(87, 169, 200, 'Molestiae rerum error adipisci dolorem.', '1563275696', 1, 0),
(88, 202, 175, 'Dolore aperiam placeat.', '1563275696', 0, 1),
(90, 101, 19, 'Excepturi qui et nihil.', '1563275696', 0, 1),
(92, 189, 53, 'Velit repudiandae repellendus aut doloribus vel.', '1563275696', 1, 1),
(93, 67, 194, 'Nobis dolorem.', '1563275696', 0, 0),
(94, 29, 172, 'Ut ea minus maiores.', '1563275696', 0, 0),
(95, 101, 169, 'Voluptatem est.', '1563275696', 0, 1),
(96, 51, 180, 'Optio quidem eius.', '1563275696', 1, 0),
(97, 45, 86, 'Beatae libero similique.', '1563275696', 1, 0),
(98, 75, 104, 'Alias nulla ad et et.', '1563275696', 0, 1),
(100, 168, 202, 'Qui.', '1563275697', 1, 0),
(101, 48, 73, 'Voluptas ipsam ut ut expedita sequi.', '1563275697', 0, 0),
(102, 158, 65, 'Expedita repellendus doloremque inventore molestiae rerum.', '1563275697', 0, 0),
(104, 189, 191, 'Vitae non.', '1563275697', 0, 1),
(105, 17, 53, 'Vitae quibusdam pariatur suscipit.', '1563275697', 1, 1),
(107, 7, 166, 'Ipsam praesentium.', '1563275697', 0, 1),
(110, 87, 57, 'Consequatur ea.', '1563275697', 0, 0),
(114, 19, 186, 'Quam sunt.', '1563275697', 1, 0),
(116, 16, 17, 'Libero sit.', '1563275697', 1, 0),
(117, 187, 87, 'Modi temporibus molestias temporibus sunt.', '1563275697', 0, 1),
(122, 82, 75, 'Aspernatur sapiente excepturi quasi.', '1563275697', 1, 1),
(123, 17, 87, 'Modi earum a.', '1563275697', 0, 0),
(124, 21, 56, 'Illum quaerat natus qui cupiditate.', '1563275697', 0, 1),
(125, 60, 185, 'Et soluta.', '1563275697', 0, 0),
(127, 188, 163, 'Quo ipsam commodi.', '1563275697', 1, 1),
(131, 77, 101, 'Laudantium.', '1563275697', 0, 0),
(132, 96, 199, 'Velit adipisci voluptas et.', '1563275697', 0, 0),
(133, 87, 39, 'Nulla voluptate eius omnis.', '1563275697', 1, 0),
(134, 51, 72, 'Atque neque occaecati et omnis.', '1563275697', 1, 1),
(135, 170, 47, 'Sunt voluptatem exercitationem minima.', '1563275697', 1, 1),
(136, 202, 89, 'Enim rerum nisi et.', '1563275697', 1, 0),
(138, 202, 16, 'Amet dicta.', '1563275697', 1, 1),
(139, 74, 23, 'Animi deleniti.', '1563275697', 1, 0),
(141, 74, 157, 'Officiis vel.', '1563275697', 1, 1),
(143, 39, 83, 'Culpa iste et rerum.', '1563275697', 1, 1),
(144, 76, 196, 'Amet repudiandae.', '1563275697', 1, 1),
(145, 17, 62, 'Impedit commodi et molestiae magni.', '1563275697', 1, 1),
(148, 186, 79, 'Voluptatem.', '1563275697', 0, 1),
(149, 159, 42, 'Harum minus adipisci voluptate.', '1563275697', 0, 1),
(151, 184, 184, 'Nam animi consequuntur.', '1563275697', 1, 0),
(152, 4, 36, 'Fuga nesciunt.', '1563275697', 0, 0),
(153, 7, 81, 'In dolore.', '1563275697', 0, 1),
(155, 166, 169, 'Veritatis et dolor veniam aut.', '1563275697', 1, 0),
(157, 90, 158, 'Doloremque quia repudiandae.', '1563275697', 0, 0),
(159, 21, 191, 'Ut et.', '1563275697', 0, 1),
(162, 56, 173, 'Et voluptas sunt animi voluptatem.', '1563275697', 1, 1),
(163, 80, 177, 'Ipsam repudiandae excepturi.', '1563275697', 0, 0),
(165, 56, 95, 'Eaque odit.', '1563275697', 0, 0),
(166, 70, 67, 'Aut architecto modi.', '1563275697', 0, 1),
(167, 191, 49, 'Architecto ipsa autem doloremque.', '1563275697', 1, 1),
(169, 82, 21, 'Ut saepe.', '1563275697', 0, 0),
(172, 20, 34, 'Laborum distinctio.', '1563275697', 1, 0),
(174, 51, 37, 'Vero provident perspiciatis quia.', '1563275697', 0, 1),
(177, 158, 193, 'Et iste.', '1563275697', 0, 0),
(180, 101, 52, 'Ex numquam dolores ea rerum.', '1563275697', 0, 1),
(181, 52, 87, 'Recusandae ut voluptate.', '1563275697', 1, 0),
(183, 8, 85, 'Sint inventore dolorem perferendis.', '1563275697', 1, 0),
(186, 157, 49, 'Voluptas qui.', '1563275698', 0, 1),
(187, 98, 5, 'Et iusto corporis.', '1563275698', 0, 0),
(188, 163, 158, 'Excepturi consequatur a.', '1563275698', 0, 1),
(190, 41, 179, 'Aspernatur veniam velit enim.', '1563275698', 1, 0),
(192, 5, 196, 'Enim provident debitis voluptate.', '1563275698', 1, 0),
(193, 95, 79, 'Ab.', '1563275698', 1, 1),
(194, 54, 82, 'Debitis corporis cupiditate.', '1563275698', 0, 1),
(195, 102, 53, 'Ut voluptatem.', '1563275698', 1, 0),
(197, 40, 74, 'Quia at.', '1563275698', 0, 0),
(200, 194, 45, 'Voluptate.', '1563275698', 0, 0),
(201, 15, 189, 'Asperiores corrupti et facilis.', '1563275698', 1, 1),
(202, 45, 201, 'Dicta voluptas sed est ipsa.', '1563275698', 1, 1),
(203, 38, 54, 'Asperiores voluptas reiciendis repudiandae veniam.', '1563275698', 1, 0),
(204, 199, 187, 'Voluptas quaerat soluta.', '1563275698', 0, 0),
(207, 76, 203, 'Occaecati ad quae.', '1563275698', 1, 1),
(208, 184, 70, 'Deserunt est dignissimos.', '1563275698', 0, 1),
(209, 22, 160, 'Voluptatibus adipisci.', '1563275698', 0, 0),
(211, 4, 175, 'Quaerat neque necessitatibus optio odio.', '1563275698', 0, 0),
(212, 57, 46, 'Vero vitae dolor totam perferendis.', '1563275698', 0, 1),
(213, 89, 70, 'Quidem temporibus.', '1563275698', 1, 0),
(214, 103, 69, 'Autem.', '1563275698', 0, 1),
(216, 54, 83, 'Et voluptatem.', '1563275698', 0, 1),
(217, 65, 45, 'Magni tenetur ea.', '1563275698', 1, 0),
(218, 37, 20, 'Minima est est qui deleniti et.', '1563275698', 1, 1),
(220, 182, 12, 'Ea sint autem officia.', '1563275698', 1, 0),
(221, 198, 190, 'Nobis ducimus facere.', '1563275698', 1, 1),
(222, 166, 86, 'Nesciunt sint.', '1563275698', 0, 0),
(223, 195, 201, 'Vitae.', '1563275698', 1, 0),
(224, 21, 37, 'Maxime vel.', '1563275698', 1, 1),
(225, 100, 25, 'Modi rerum officiis et.', '1563275698', 1, 1),
(227, 19, 7, 'Corrupti et sint autem qui.', '1563275698', 0, 0),
(228, 23, 24, 'Qui eum officia omnis odit.', '1563275698', 0, 0),
(232, 163, 78, 'Nihil omnis animi doloremque saepe.', '1563275698', 1, 0),
(233, 74, 56, 'Ut voluptates.', '1563275698', 1, 1),
(234, 102, 14, 'Sint.', '1563275698', 1, 0),
(235, 59, 163, 'Est omnis accusantium deserunt inventore dolores.', '1563275698', 0, 0),
(238, 70, 70, 'Cupiditate.', '1563275698', 0, 1),
(240, 98, 192, 'Repellendus quis repellat.', '1563275698', 0, 0),
(242, 161, 196, 'Repudiandae nulla adipisci.', '1563275698', 0, 1),
(243, 35, 74, 'Ut quia dolorum reiciendis voluptatem.', '1563275698', 1, 0),
(244, 13, 96, 'Facilis eos inventore aut.', '1563275698', 0, 1),
(245, 46, 42, 'Reiciendis qui sint.', '1563275698', 0, 0),
(246, 44, 2, 'Consequatur.', '1563275698', 0, 0),
(247, 6, 159, 'Neque ut est sed.', '1563275698', 0, 0),
(249, 82, 42, 'Rerum earum occaecati voluptatum.', '1563275698', 1, 1),
(253, 202, 69, 'Laborum dolor consectetur pariatur.', '1563275698', 1, 0),
(254, 34, 90, 'Iusto et qui.', '1563275698', 1, 0),
(255, 160, 67, 'Et rerum non nostrum.', '1563275698', 0, 0),
(257, 47, 102, 'Eveniet neque.', '1563275698', 0, 0),
(260, 1, 40, 'Et possimus ratione ut.', '1563275698', 0, 0),
(267, 22, 76, 'Libero illo.', '1563275699', 0, 0),
(271, 183, 185, 'Ea in ut voluptatem architecto.', '1563275699', 1, 0),
(272, 13, 3, 'Neque quo sequi.', '1563275699', 1, 1),
(274, 40, 201, 'Eius numquam sint.', '1563275699', 1, 0),
(275, 23, 196, 'Fugiat est.', '1563275699', 1, 1),
(276, 165, 163, 'Nisi voluptatem.', '1563275699', 0, 1),
(279, 46, 184, 'Quas rem eum nobis non.', '1563275699', 1, 1),
(282, 94, 195, 'Pariatur maiores minus unde esse sit.', '1563275699', 0, 1),
(283, 8, 11, 'Et officiis doloribus ex.', '1563275699', 1, 0),
(284, 39, 54, 'Placeat ab recusandae et iusto architecto.', '1563275699', 0, 1),
(286, 15, 83, 'Hic quae rerum recusandae possimus occaecati.', '1563275699', 0, 1),
(288, 170, 59, 'Minima quaerat impedit.', '1563275699', 1, 1),
(289, 190, 177, 'Quae voluptatem qui quae occaecati.', '1563275699', 1, 1),
(290, 62, 24, 'Earum quia qui reiciendis illum nisi.', '1563275699', 0, 1),
(291, 172, 19, 'Ea voluptatem aut.', '1563275699', 0, 1),
(294, 10, 169, 'Voluptates assumenda maxime nisi.', '1563275699', 0, 1),
(295, 176, 83, 'Ipsam dolorem et.', '1563275699', 1, 0),
(297, 5, 193, 'Et.', '1563275699', 0, 1),
(298, 192, 165, 'Numquam deserunt cum laboriosam.', '1563275699', 0, 0),
(302, 99, 11, 'Dolor.', '1563275699', 1, 0),
(303, 43, 191, 'Id aut alias ipsum aut.', '1563275699', 1, 0),
(304, 70, 74, 'Delectus libero.', '1563275699', 1, 1),
(305, 38, 75, 'Est pariatur ratione aliquid autem.', '1563275699', 0, 1),
(306, 24, 15, 'Perspiciatis dolor.', '1563275699', 0, 0),
(308, 31, 183, 'Consequatur sit.', '1563275699', 1, 1),
(310, 22, 188, 'Dolore esse labore in.', '1563275699', 0, 1),
(311, 5, 5, 'Explicabo.', '1563275699', 1, 0),
(312, 195, 83, 'Voluptatibus repellat.', '1563275699', 0, 0),
(313, 26, 176, 'Aut non voluptas culpa atque.', '1563275699', 1, 1),
(316, 4, 190, 'Architecto exercitationem et.', '1563275699', 0, 0),
(320, 193, 202, 'Et non fugit quia.', '1563275699', 1, 1),
(321, 197, 98, 'Suscipit et id quo.', '1563275699', 1, 1),
(323, 62, 165, 'Nam officiis sint totam.', '1563275699', 0, 0),
(324, 77, 180, 'Aspernatur.', '1563275699', 0, 0),
(325, 19, 33, 'Qui odio velit.', '1563275699', 1, 0),
(326, 191, 201, 'Sed distinctio.', '1563275699', 1, 0),
(327, 183, 72, 'Minima odit repellat.', '1563275699', 1, 1),
(329, 55, 1, 'Dolores earum corporis.', '1563275699', 0, 1),
(333, 161, 98, 'Vel.', '1563275699', 1, 0),
(336, 37, 87, 'Numquam tenetur modi.', '1563275699', 1, 1),
(337, 58, 24, 'Dolorem id qui.', '1563275699', 1, 1),
(339, 31, 91, 'Quibusdam occaecati et.', '1563275699', 1, 0),
(340, 68, 32, 'Repellat voluptas ipsum.', '1563275699', 1, 0),
(342, 181, 53, 'Reiciendis sint omnis.', '1563275699', 0, 0),
(343, 186, 81, 'Sint nostrum doloremque.', '1563275699', 0, 0),
(344, 172, 67, 'Vel qui.', '1563275699', 1, 1),
(345, 165, 44, 'Ut perferendis natus.', '1563275699', 1, 0),
(347, 34, 42, 'Non provident qui.', '1563275699', 0, 0),
(352, 189, 55, 'Error et quia cumque et.', '1563275700', 1, 1),
(353, 38, 45, 'Officia.', '1563275700', 0, 1),
(358, 39, 169, 'Facere molestiae repellat ullam ratione.', '1563275700', 1, 1),
(359, 183, 2, 'Eaque accusamus non et voluptatem.', '1563275700', 1, 0),
(361, 99, 173, 'Ducimus ducimus.', '1563275700', 0, 1),
(362, 98, 187, 'Dolor molestias.', '1563275700', 1, 1),
(364, 41, 90, 'Debitis.', '1563275700', 1, 0),
(369, 56, 92, 'Vitae odio iure nesciunt ut sunt.', '1563275700', 1, 0),
(370, 100, 9, 'Quis neque odit.', '1563275700', 1, 0),
(371, 80, 186, 'Sapiente eveniet.', '1563275700', 0, 0),
(378, 198, 34, 'Aut repellendus minima ut.', '1563275700', 0, 0),
(379, 190, 198, 'Esse et culpa quam.', '1563275700', 1, 1),
(380, 201, 101, 'Consequuntur commodi.', '1563275700', 0, 1),
(384, 44, 12, 'Dolore iure.', '1563275700', 0, 0),
(385, 189, 68, 'Ut sunt consectetur.', '1563275700', 0, 1),
(386, 68, 18, 'Maxime.', '1563275700', 1, 1),
(387, 82, 82, 'Qui aut sint quo explicabo sed.', '1563275700', 0, 1),
(392, 74, 48, 'Necessitatibus deleniti.', '1563275700', 0, 1),
(393, 5, 166, 'Quod omnis enim impedit eligendi.', '1563275700', 1, 1),
(394, 168, 176, 'Rem qui amet rerum.', '1563275700', 1, 1),
(396, 187, 73, 'Sunt harum.', '1563275700', 1, 1),
(397, 47, 201, 'Omnis sit id pariatur.', '1563275700', 1, 0),
(398, 37, 182, 'Excepturi sit.', '1563275700', 0, 1),
(400, 186, 37, 'Recusandae.', '1563275700', 0, 1),
(401, 177, 199, 'Omnis labore.', '1563275700', 1, 1),
(402, 201, 182, 'Ullam qui.', '1563275700', 1, 0),
(403, 26, 164, 'Ipsa.', '1563275700', 0, 0),
(404, 1, 81, 'Et iste veritatis.', '1563275700', 0, 1),
(405, 47, 65, 'Ea possimus illo optio.', '1563275700', 1, 0),
(406, 14, 34, 'Iure quo.', '1563275700', 0, 1),
(407, 99, 57, 'Et repudiandae tempore.', '1563275700', 0, 1),
(409, 169, 44, 'Minus.', '1563275700', 0, 1),
(411, 53, 46, 'Aliquam exercitationem.', '1563275700', 0, 1),
(412, 99, 10, 'Quam sunt.', '1563275700', 1, 1),
(413, 167, 35, 'In voluptates quae.', '1563275700', 1, 0),
(414, 9, 159, 'Voluptatibus consectetur sint.', '1563275700', 1, 1),
(418, 99, 64, 'Cumque ut et.', '1563275700', 0, 0),
(419, 7, 93, 'Non quas.', '1563275701', 1, 0),
(421, 54, 177, 'Ex.', '1563275701', 0, 1),
(423, 191, 171, 'Eos sequi sequi porro.', '1563275701', 0, 0),
(426, 92, 164, 'Rerum.', '1563275701', 1, 0),
(427, 83, 82, 'Ullam deleniti optio.', '1563275701', 1, 1),
(428, 86, 196, 'Nulla enim dolores delectus.', '1563275701', 1, 0),
(430, 80, 17, 'Harum.', '1563275701', 1, 1),
(431, 184, 50, 'Est quod quisquam est.', '1563275701', 0, 1),
(433, 56, 156, 'Qui facere illo exercitationem provident.', '1563275701', 1, 0),
(434, 96, 71, 'Et quo.', '1563275701', 0, 1),
(436, 93, 60, 'Omnis voluptatibus reiciendis est.', '1563275701', 0, 1),
(437, 189, 13, 'Distinctio ut veniam quia.', '1563275701', 1, 1),
(438, 66, 161, 'Repellat quis sit voluptatibus nulla perferendis.', '1563275701', 1, 1),
(439, 12, 182, 'Consequatur debitis voluptatem quo.', '1563275701', 0, 0),
(440, 84, 81, 'Quae distinctio ea aut.', '1563275701', 0, 0),
(443, 170, 189, 'Consectetur odio harum expedita.', '1563275701', 0, 0),
(445, 165, 52, 'Tempora id quis dolorem.', '1563275701', 1, 0),
(446, 49, 78, 'Voluptates ut rerum.', '1563275701', 1, 0),
(448, 5, 68, 'Facilis quos sed.', '1563275701', 0, 0),
(451, 34, 185, 'Veritatis sed ratione.', '1563275701', 1, 0),
(452, 184, 76, 'Tempora rerum earum.', '1563275701', 1, 1),
(455, 12, 6, 'Ea quibusdam accusamus.', '1563275701', 0, 0),
(457, 162, 43, 'Adipisci at illum.', '1563275701', 0, 1),
(458, 159, 198, 'Quibusdam aspernatur quo vel.', '1563275701', 1, 0),
(459, 99, 164, 'Iure exercitationem necessitatibus.', '1563275701', 0, 1),
(461, 36, 51, 'Soluta quas excepturi.', '1563275701', 0, 1),
(464, 69, 187, 'Natus dolores consequatur.', '1563275701', 1, 1),
(467, 99, 75, 'Quidem qui deleniti.', '1563275701', 1, 1),
(468, 189, 17, 'Ipsa quod quibusdam.', '1563275701', 0, 1),
(470, 157, 103, 'Velit soluta quos.', '1563275701', 1, 1),
(471, 36, 200, 'Aspernatur deleniti.', '1563275701', 1, 0),
(473, 21, 172, 'Nihil sunt dignissimos hic.', '1563275701', 0, 1),
(474, 34, 62, 'Ipsam.', '1563275701', 0, 0),
(475, 202, 54, 'Deleniti necessitatibus.', '1563275701', 1, 1),
(476, 169, 6, 'Recusandae cumque rerum eveniet.', '1563275701', 0, 0),
(478, 74, 70, 'Itaque autem voluptatum.', '1563275701', 1, 0),
(479, 60, 91, 'Dolorem voluptatem velit quibusdam quaerat repellat.', '1563275701', 0, 0),
(480, 103, 14, 'Quibusdam eaque enim illum ducimus.', '1563275701', 1, 0),
(484, 39, 183, 'Voluptate optio similique.', '1563275701', 0, 1),
(487, 183, 89, 'Aliquid in vel.', '1563275701', 0, 1),
(488, 43, 71, 'Voluptatem sapiente vel.', '1563275701', 0, 1),
(489, 191, 46, 'Non et aut.', '1563275701', 0, 1),
(491, 48, 24, 'Aliquam asperiores maxime.', '1563275701', 1, 0),
(492, 100, 82, 'Qui doloremque nihil.', '1563275701', 1, 0),
(493, 60, 76, 'Et aut sit.', '1563275701', 1, 1),
(494, 103, 177, 'Laborum necessitatibus ipsum soluta.', '1563275701', 0, 1),
(495, 183, 34, 'Quis ab at vero.', '1563275701', 1, 1),
(496, 184, 177, 'Nemo id in.', '1563275701', 0, 1),
(498, 57, 80, 'Corrupti quod.', '1563275701', 1, 0),
(499, 84, 156, 'Et.', '1563275701', 0, 0),
(501, 100, 89, 'Est quis vero.', '1563275701', 1, 0),
(502, 166, 65, 'Consequatur dolores a molestias.', '1563275701', 0, 1),
(503, 42, 31, 'In sed ratione.', '1563275702', 1, 0),
(507, 161, 183, 'Harum nemo mollitia molestiae.', '1563275702', 0, 1),
(508, 73, 76, 'Numquam at eveniet.', '1563275702', 1, 0),
(510, 193, 11, 'Magnam.', '1563275702', 0, 1),
(511, 32, 3, 'Explicabo dolores.', '1563275702', 1, 1),
(513, 157, 104, 'Consequatur accusantium impedit.', '1563275702', 1, 1),
(514, 101, 81, 'Sed illo sed provident maxime officia.', '1563275702', 0, 1),
(516, 188, 174, 'Voluptas quis ut sunt.', '1563275702', 1, 1),
(517, 202, 65, 'Voluptas natus.', '1563275702', 1, 1),
(518, 180, 173, 'Animi.', '1563275702', 1, 0),
(526, 160, 88, 'Sint maiores voluptatem.', '1563275702', 0, 0),
(527, 46, 83, 'Placeat delectus voluptas.', '1563275702', 1, 0),
(528, 200, 26, 'Rerum quis laborum beatae.', '1563275702', 0, 0),
(529, 172, 46, 'Voluptatum velit repellendus.', '1563275702', 0, 0),
(533, 21, 191, 'Voluptas veniam ad.', '1563275702', 0, 0),
(534, 9, 7, 'Eius reprehenderit maiores.', '1563275702', 1, 0),
(535, 3, 89, 'Quia rem error.', '1563275702', 1, 1),
(537, 195, 177, 'Repellendus eum cum voluptatibus.', '1563275702', 0, 1),
(538, 178, 190, 'Et aspernatur ea.', '1563275702', 0, 0),
(539, 5, 57, 'Voluptatem natus.', '1563275702', 1, 1),
(540, 14, 191, 'Suscipit.', '1563275702', 1, 1),
(541, 175, 27, 'Necessitatibus consequatur.', '1563275702', 1, 1),
(542, 67, 170, 'Autem laudantium necessitatibus.', '1563275702', 1, 0),
(543, 97, 43, 'Voluptatem voluptatum provident qui.', '1563275702', 1, 0),
(544, 66, 162, 'Et impedit id.', '1563275702', 0, 1),
(545, 37, 157, 'Qui eum autem.', '1563275702', 0, 0),
(547, 32, 166, 'Et nihil quia voluptatem architecto.', '1563275702', 1, 1),
(549, 71, 173, 'Tenetur quidem dolore earum eaque.', '1563275702', 0, 0),
(551, 189, 200, 'Quos consequatur rerum.', '1563275702', 1, 1),
(552, 10, 192, 'Aut hic minima.', '1563275702', 1, 1),
(554, 195, 17, 'Modi fugiat corrupti corporis.', '1563275702', 0, 0),
(556, 7, 196, 'Est veniam ex voluptas et quis.', '1563275702', 0, 0),
(557, 22, 159, 'Libero.', '1563275702', 1, 0),
(558, 172, 89, 'Magni aut est accusamus.', '1563275702', 1, 0),
(564, 100, 201, 'Sunt qui.', '1563275702', 0, 0),
(566, 164, 197, 'Dolores aperiam possimus unde qui.', '1563275702', 1, 0),
(567, 102, 94, 'Dolor earum.', '1563275702', 1, 1),
(568, 21, 85, 'Sed.', '1563275702', 1, 1),
(571, 12, 159, 'Provident illum.', '1563275702', 1, 1),
(573, 170, 32, 'Aut saepe doloremque cumque itaque.', '1563275702', 1, 0),
(574, 26, 51, 'Et velit porro voluptatem.', '1563275702', 1, 1),
(578, 46, 184, 'Reiciendis rem voluptatem doloremque.', '1563275702', 0, 1),
(579, 176, 13, 'Est deserunt cumque quaerat.', '1563275703', 0, 0),
(580, 157, 59, 'Dolores aut consequuntur eum aspernatur.', '1563275703', 1, 1),
(581, 100, 55, 'Sed non rerum.', '1563275703', 0, 1),
(582, 95, 81, 'Dicta et neque iusto porro.', '1563275703', 0, 0),
(584, 166, 73, 'Sunt et.', '1563275703', 0, 0),
(585, 182, 18, 'Dolor.', '1563275703', 1, 0),
(586, 164, 20, 'Enim vitae nesciunt quia.', '1563275703', 1, 1),
(588, 44, 5, 'Nam quibusdam voluptatem aut minus culpa.', '1563275703', 0, 0),
(589, 163, 75, 'Inventore consectetur.', '1563275703', 1, 1),
(591, 98, 39, 'Aliquam incidunt.', '1563275703', 1, 0),
(595, 13, 34, 'Voluptatem id.', '1563275703', 1, 0),
(600, 191, 99, 'Sit neque consequatur.', '1563275703', 0, 1),
(601, 56, 189, 'Ducimus.', '1563275703', 1, 1),
(604, 38, 165, 'Et ad sequi.', '1563275703', 0, 1),
(605, 27, 187, 'Voluptatibus earum aut sint.', '1563275703', 0, 1),
(610, 159, 85, 'Alias.', '1563275703', 0, 1),
(611, 61, 175, 'Sit molestias nesciunt.', '1563275703', 1, 1),
(612, 56, 192, 'Vel quia distinctio ad.', '1563275703', 1, 0),
(613, 23, 156, 'Laboriosam maiores.', '1563275703', 0, 1),
(614, 166, 95, 'Est quaerat nesciunt dolor magnam.', '1563275703', 1, 1),
(617, 24, 181, 'Sit voluptatum placeat consequatur doloribus at.', '1563275703', 1, 0),
(621, 4, 81, 'Omnis quam vel quam totam.', '1563275703', 1, 1),
(622, 17, 104, 'Aperiam ut.', '1563275703', 0, 0),
(625, 39, 63, 'Aut fugiat pariatur pariatur laborum illum.', '1563275703', 1, 1),
(626, 91, 70, 'Assumenda illum.', '1563275703', 0, 0),
(627, 91, 50, 'Voluptatem maiores dignissimos ut fugit.', '1563275703', 0, 0),
(629, 162, 20, 'Nisi consequatur eaque commodi.', '1563275703', 0, 0),
(632, 41, 162, 'Et eligendi qui iste consequuntur.', '1563275703', 0, 1),
(635, 160, 96, 'Et deleniti.', '1563275703', 1, 0),
(636, 35, 44, 'Rerum.', '1563275703', 0, 0),
(638, 57, 31, 'Itaque sint.', '1563275703', 0, 1),
(642, 193, 192, 'Aut nihil id.', '1563275703', 1, 1),
(646, 64, 19, 'Rerum ab.', '1563275704', 1, 1),
(649, 30, 35, 'Est asperiores cum et.', '1563275704', 0, 0),
(650, 7, 87, 'Similique tenetur.', '1563275704', 1, 0),
(651, 12, 170, 'Culpa et.', '1563275704', 1, 0),
(652, 195, 182, 'Et quis mollitia.', '1563275704', 1, 1),
(654, 168, 69, 'Et consectetur repellendus ea sequi.', '1563275704', 0, 0),
(655, 43, 5, 'Suscipit.', '1563275704', 1, 1),
(659, 28, 83, 'Quisquam corrupti aut.', '1563275704', 1, 1),
(660, 62, 44, 'Aut autem ipsam eum.', '1563275704', 0, 1),
(662, 68, 55, 'Iure qui unde sint.', '1563275704', 0, 0),
(663, 96, 172, 'Adipisci deserunt voluptatem.', '1563275704', 1, 1),
(664, 158, 37, 'Nihil.', '1563275704', 1, 1),
(669, 17, 37, 'Consequatur beatae.', '1563275704', 1, 1),
(670, 6, 157, 'Voluptas corporis assumenda est.', '1563275704', 0, 0),
(671, 41, 83, 'Debitis quo.', '1563275704', 0, 0),
(673, 186, 12, 'Sit quos.', '1563275704', 1, 0),
(674, 72, 77, 'Accusantium consequatur voluptatem sequi.', '1563275704', 1, 1),
(676, 188, 30, 'Et omnis consequatur in.', '1563275704', 0, 1),
(678, 36, 47, 'Quam blanditiis voluptas quam blanditiis eos.', '1563275704', 0, 0),
(679, 13, 195, 'Velit iste recusandae sit.', '1563275704', 1, 1),
(681, 66, 156, 'Magni sunt atque reprehenderit.', '1563275704', 0, 1),
(682, 76, 82, 'Iusto est mollitia labore tempore.', '1563275704', 0, 0),
(683, 63, 70, 'Quasi labore ut quia.', '1563275704', 1, 0),
(684, 168, 193, 'Et accusamus illum non.', '1563275704', 0, 1),
(685, 194, 181, 'Ut ea.', '1563275704', 0, 0),
(688, 101, 175, 'Ut.', '1563275704', 0, 1),
(689, 67, 187, 'Minus nihil.', '1563275704', 0, 0),
(693, 76, 49, 'Sit similique.', '1563275704', 0, 1),
(699, 188, 21, 'Minus.', '1563275704', 0, 1),
(700, 50, 88, 'Et vero totam ut accusamus.', '1563275704', 1, 0),
(701, 201, 39, 'Et et facilis.', '1563275705', 0, 1),
(702, 187, 24, 'Aut.', '1563275705', 1, 0),
(703, 40, 42, 'Praesentium ipsam.', '1563275705', 0, 0),
(704, 82, 54, 'Omnis qui ut molestias.', '1563275705', 1, 0),
(707, 199, 196, 'Quibusdam provident.', '1563275705', 0, 1),
(709, 29, 35, 'Amet ut fugiat ut.', '1563275705', 0, 0),
(714, 54, 17, 'Quidem.', '1563275705', 1, 0),
(716, 47, 28, 'Quia sed ab ea.', '1563275705', 1, 1),
(717, 80, 58, 'Quo ducimus et odio.', '1563275705', 1, 0),
(718, 8, 195, 'Saepe nam aut.', '1563275705', 0, 0),
(721, 90, 203, 'Tenetur expedita veniam eos.', '1563275705', 1, 0),
(723, 159, 5, 'Nihil.', '1563275705', 1, 0),
(725, 104, 45, 'Optio et aperiam voluptatem.', '1563275705', 1, 0),
(726, 161, 72, 'Est dolorem consectetur dolorem quia.', '1563275705', 0, 0),
(727, 190, 59, 'Qui non aspernatur.', '1563275705', 0, 0),
(733, 12, 30, 'Architecto.', '1563275705', 1, 1),
(734, 17, 180, 'Corrupti delectus impedit quis perferendis.', '1563275705', 1, 0),
(735, 82, 87, 'Quam asperiores consequatur sint.', '1563275705', 1, 0),
(736, 103, 90, 'Velit et neque.', '1563275705', 0, 1),
(738, 100, 6, 'Pariatur numquam id.', '1563275705', 0, 0),
(739, 80, 72, 'Repellat enim labore suscipit fugit.', '1563275705', 1, 1),
(740, 36, 86, 'Consequatur eos voluptatem.', '1563275705', 0, 1),
(742, 79, 92, 'Animi consectetur.', '1563275705', 1, 1),
(743, 104, 157, 'Neque inventore numquam.', '1563275705', 1, 1),
(745, 94, 169, 'Velit et.', '1563275705', 1, 1),
(746, 104, 27, 'Aliquam nisi omnis eligendi.', '1563275705', 1, 1),
(749, 174, 68, 'Et reiciendis repellat.', '1563275705', 0, 1),
(753, 181, 43, 'Expedita repellendus.', '1563275705', 1, 0),
(754, 58, 3, 'Facilis quas.', '1563275705', 1, 1),
(755, 18, 86, 'Quibusdam nam voluptatem.', '1563275706', 0, 1),
(758, 10, 69, 'Provident et accusantium in quo.', '1563275706', 1, 1),
(760, 54, 41, 'Blanditiis rerum magni ea atque.', '1563275706', 1, 1),
(761, 164, 159, 'Iste.', '1563275706', 1, 1),
(762, 200, 12, 'Ratione.', '1563275706', 0, 0),
(763, 81, 36, 'Quia et.', '1563275706', 1, 0),
(765, 171, 193, 'Et laborum.', '1563275706', 0, 0),
(766, 97, 104, 'Voluptatum doloribus.', '1563275706', 1, 0),
(767, 54, 195, 'Voluptatem minus.', '1563275706', 1, 1),
(770, 84, 3, 'Veniam in molestiae.', '1563275706', 0, 0),
(772, 160, 174, 'Consectetur autem qui porro.', '1563275706', 1, 0),
(776, 24, 175, 'Qui animi.', '1563275706', 1, 0),
(778, 180, 7, 'Nemo ut qui.', '1563275706', 1, 0),
(780, 61, 98, 'Dignissimos iusto et laborum.', '1563275706', 0, 1),
(781, 72, 184, 'Et tenetur dolor necessitatibus.', '1563275706', 1, 0),
(783, 198, 58, 'Cupiditate quia quidem cum.', '1563275706', 0, 0),
(784, 102, 101, 'Ipsum tenetur.', '1563275706', 0, 0),
(786, 36, 91, 'Molestiae accusamus reprehenderit iusto.', '1563275706', 0, 0),
(787, 93, 69, 'Et et ducimus molestiae optio.', '1563275706', 0, 0),
(788, 20, 101, 'Excepturi.', '1563275706', 0, 1),
(789, 7, 198, 'Unde accusantium vel fuga unde.', '1563275706', 0, 1),
(791, 81, 171, 'Quo quis voluptatem nisi quis.', '1563275706', 0, 1),
(792, 92, 37, 'Aut nesciunt.', '1563275706', 1, 0),
(793, 175, 35, 'Ipsa tenetur sunt debitis.', '1563275706', 0, 1),
(794, 198, 63, 'Molestiae.', '1563275706', 1, 1),
(796, 156, 183, 'Distinctio vel tenetur.', '1563275706', 1, 0),
(797, 161, 3, 'Vel.', '1563275706', 0, 1),
(798, 65, 56, 'Sed sint ut.', '1563275706', 1, 1),
(800, 30, 92, 'Velit.', '1563275706', 1, 1),
(801, 85, 173, 'Fuga sit dolor eum.', '1563275706', 0, 1),
(804, 66, 196, 'Dolorem unde.', '1563275706', 1, 0),
(807, 169, 182, 'Id laboriosam unde quae labore voluptas.', '1563275706', 1, 0),
(809, 191, 175, 'Repellendus accusantium optio illo ut.', '1563275706', 1, 1),
(811, 163, 30, 'Provident molestiae.', '1563275707', 0, 1),
(812, 175, 186, 'Eos tempore.', '1563275707', 1, 0),
(815, 166, 1, 'Optio.', '1563275707', 1, 0),
(816, 189, 89, 'Et natus.', '1563275707', 0, 0),
(821, 38, 91, 'Provident placeat sit quidem dolorem.', '1563275707', 0, 0),
(822, 194, 9, 'Quis rerum.', '1563275707', 0, 0),
(823, 197, 81, 'Animi.', '1563275707', 0, 1),
(825, 37, 184, 'Libero repellat suscipit quas aut.', '1563275707', 1, 1),
(829, 42, 29, 'Voluptatem velit est.', '1563275707', 1, 0),
(830, 156, 98, 'Cumque voluptas ab iste aut.', '1563275707', 0, 1),
(831, 75, 66, 'Voluptatum et consequuntur possimus necessitatibus.', '1563275707', 0, 1),
(832, 71, 31, 'Exercitationem laboriosam.', '1563275707', 1, 0),
(835, 72, 48, 'Nisi quasi voluptatem minus.', '1563275707', 0, 1),
(838, 157, 24, 'Vel expedita ut voluptatum.', '1563275707', 1, 0),
(839, 166, 79, 'Minus perferendis eaque iste.', '1563275707', 0, 1),
(840, 15, 94, 'In nemo non sit.', '1563275707', 1, 0),
(842, 32, 90, 'Qui dolorum.', '1563275707', 0, 1),
(845, 101, 165, 'Voluptatibus quasi natus alias.', '1563275707', 1, 0),
(847, 62, 101, 'Modi.', '1563275707', 0, 0),
(848, 197, 164, 'Veritatis tenetur sed.', '1563275707', 1, 0),
(849, 170, 98, 'Necessitatibus quia ratione vel natus.', '1563275707', 0, 0),
(850, 92, 166, 'Et quia quidem numquam in ut.', '1563275707', 0, 1),
(852, 27, 198, 'Accusamus.', '1563275707', 0, 0),
(853, 101, 99, 'Non et.', '1563275707', 0, 0),
(855, 61, 85, 'Aut sed est similique.', '1563275707', 0, 1),
(856, 167, 2, 'Est quia a quis eaque a.', '1563275707', 0, 1),
(857, 159, 38, 'Earum molestias architecto.', '1563275707', 0, 1),
(859, 89, 34, 'Dolorem totam quos.', '1563275707', 1, 0),
(864, 184, 191, 'Earum aut id veniam natus.', '1563275707', 0, 1),
(865, 54, 158, 'Quia velit aut.', '1563275707', 0, 1),
(867, 73, 54, 'Ipsa aspernatur accusamus.', '1563275707', 0, 1),
(868, 159, 43, 'Ea quis enim voluptatum magni.', '1563275707', 1, 1),
(870, 55, 9, 'Aperiam.', '1563275707', 1, 1),
(872, 28, 76, 'Laborum et odit recusandae quo.', '1563275707', 0, 1),
(873, 99, 49, 'Fugiat.', '1563275707', 1, 1),
(874, 6, 185, 'Ut necessitatibus est ea.', '1563275707', 0, 1),
(880, 89, 188, 'Et impedit velit placeat dolores.', '1563275707', 1, 0),
(881, 35, 44, 'Voluptate magnam ut.', '1563275707', 1, 0),
(884, 164, 79, 'Voluptate tenetur.', '1563275707', 1, 1),
(885, 83, 46, 'Laboriosam dicta quae.', '1563275707', 0, 0),
(886, 200, 14, 'Est qui.', '1563275707', 0, 1),
(887, 54, 74, 'Exercitationem explicabo quo.', '1563275707', 0, 1),
(890, 78, 96, 'Est eos ratione dolores totam.', '1563275707', 1, 1),
(891, 77, 100, 'Vel quasi illum vel optio ea.', '1563275707', 0, 1),
(893, 10, 77, 'Fuga quos.', '1563275707', 0, 1),
(895, 16, 5, 'Aut reprehenderit accusamus.', '1563275707', 1, 1),
(896, 189, 87, 'Dolor rerum optio aut.', '1563275707', 0, 1),
(897, 2, 57, 'Et dolore.', '1563275707', 1, 1),
(898, 196, 73, 'Sunt placeat reiciendis.', '1563275707', 0, 0),
(899, 177, 26, 'Autem dolores commodi quasi.', '1563275707', 0, 0),
(900, 31, 56, 'Ut ipsum praesentium cumque autem.', '1563275707', 1, 0),
(901, 77, 177, 'Dolor.', '1563275707', 1, 0),
(902, 51, 38, 'Sint numquam dignissimos.', '1563275707', 0, 0),
(906, 163, 35, 'Repudiandae eligendi molestiae ipsa voluptates.', '1563275707', 0, 1),
(907, 164, 180, 'Distinctio et ea.', '1563275707', 0, 1),
(908, 37, 57, 'Cupiditate aliquid.', '1563275707', 1, 0),
(909, 87, 81, 'Quia molestias ullam aliquid.', '1563275708', 0, 1),
(910, 63, 19, 'Praesentium quas culpa cum.', '1563275708', 1, 1),
(913, 81, 62, 'Impedit et.', '1563275708', 1, 0),
(915, 14, 67, 'Odit sapiente suscipit ratione.', '1563275708', 0, 1),
(916, 18, 16, 'Dolores ea minus laboriosam aut.', '1563275708', 1, 0),
(918, 14, 92, 'Voluptatibus et voluptate id assumenda.', '1563275708', 1, 1),
(919, 165, 29, 'Vitae officia quos maxime.', '1563275708', 1, 1),
(920, 169, 29, 'Dolores dolor.', '1563275708', 1, 0),
(922, 191, 1, 'Impedit architecto qui aut.', '1563275708', 0, 0),
(924, 8, 77, 'Quo fugit itaque ex et iusto.', '1563275708', 0, 0),
(925, 50, 14, 'Deleniti iure ipsam est et cupiditate.', '1563275708', 0, 1),
(927, 191, 56, 'Vel optio et.', '1563275708', 1, 1),
(928, 64, 191, 'Quibusdam praesentium.', '1563275708', 0, 0),
(930, 73, 31, 'Sit atque molestiae.', '1563275708', 1, 0),
(932, 28, 96, 'Aliquid nesciunt quia.', '1563275708', 0, 1),
(933, 162, 74, 'Cumque voluptatem aliquid.', '1563275708', 1, 1),
(935, 163, 187, 'Non.', '1563275708', 0, 1),
(936, 49, 46, 'Nostrum quia inventore beatae.', '1563275708', 0, 0),
(939, 195, 58, 'Ex recusandae suscipit.', '1563275708', 1, 1),
(943, 194, 21, 'Animi et tenetur aut.', '1563275708', 1, 1),
(945, 186, 68, 'Et aperiam voluptatem in.', '1563275708', 1, 1),
(946, 54, 75, 'Nisi.', '1563275708', 0, 1),
(947, 26, 88, 'Beatae.', '1563275708', 0, 0),
(948, 174, 200, 'Voluptatem omnis impedit.', '1563275708', 1, 1),
(949, 36, 183, 'Eos omnis.', '1563275708', 0, 1),
(950, 24, 25, 'Et non quo veniam.', '1563275708', 1, 1),
(951, 39, 180, 'Earum harum aut praesentium.', '1563275708', 1, 0),
(954, 14, 169, 'Qui eveniet repellendus expedita.', '1563275708', 1, 0),
(955, 76, 203, 'Culpa alias quia accusamus.', '1563275708', 1, 0),
(956, 200, 189, 'Aliquam optio quas pariatur.', '1563275708', 1, 1),
(957, 67, 162, 'Dolorem corrupti facere.', '1563275709', 0, 1),
(959, 170, 191, 'Non doloremque esse.', '1563275709', 1, 0),
(960, 184, 8, 'Corporis ut mollitia.', '1563275709', 1, 1),
(961, 172, 75, 'Eveniet rerum vitae ab.', '1563275709', 1, 0),
(962, 174, 195, 'Eaque ut.', '1563275709', 1, 0),
(963, 18, 54, 'Fugit quam.', '1563275709', 0, 0),
(964, 101, 65, 'Ea reprehenderit libero.', '1563275709', 1, 1),
(966, 36, 159, 'Libero consequuntur aliquid perspiciatis.', '1563275709', 1, 0),
(967, 185, 12, 'Sapiente facilis ut autem explicabo eum.', '1563275709', 0, 1),
(968, 24, 90, 'Unde voluptatem.', '1563275709', 0, 0),
(969, 83, 90, 'Cum dicta odio.', '1563275709', 0, 0),
(970, 81, 160, 'In exercitationem ullam officiis debitis.', '1563275709', 0, 1),
(973, 86, 178, 'Voluptatem qui laudantium in.', '1563275709', 1, 0),
(974, 70, 170, 'Quo aut natus ducimus.', '1563275709', 0, 0),
(976, 62, 12, 'Aut blanditiis aut.', '1563275709', 1, 1),
(982, 80, 74, 'Veritatis et.', '1563275709', 0, 1),
(987, 51, 13, 'Rerum dolor ullam.', '1563275710', 0, 0),
(990, 41, 101, 'Quis aspernatur dolor voluptas a.', '1563275710', 0, 1),
(992, 58, 64, 'Ea molestias incidunt.', '1563275710', 1, 1),
(995, 102, 46, 'Voluptates et perferendis culpa molestiae odit.', '1563275710', 1, 1),
(996, 188, 159, 'Suscipit mollitia voluptatem.', '1563275711', 1, 1),
(997, 169, 56, 'Incidunt quam dicta nihil.', '1563275711', 0, 1),
(998, 40, 195, 'Consequatur expedita velit quas.', '1563275711', 0, 0),
(1000, 65, 181, 'Voluptatem deserunt autem natus.', '1563275711', 0, 0),
(1001, 46, 170, 'Nihil qui.', '1563275711', 1, 1),
(1002, 158, 23, 'Aut et.', '1563275711', 1, 1),
(1003, 181, 94, 'Quos excepturi assumenda.', '1563275711', 0, 1),
(1006, 42, 64, 'Repellendus molestiae.', '1563275711', 1, 1),
(1008, 10, 197, 'Cum et voluptas ipsum.', '1563275711', 1, 0),
(1010, 103, 81, 'Quaerat dolor.', '1563275711', 1, 0),
(1012, 6, 179, 'Quaerat.', '1563275711', 0, 1),
(1015, 47, 181, 'Et tenetur error nam vero.', '1563275711', 0, 0),
(1016, 58, 185, 'Quia quas.', '1563275711', 1, 0),
(1018, 102, 51, 'Eos eos.', '1563275711', 0, 0),
(1020, 201, 97, 'Pariatur voluptates.', '1563275711', 0, 1),
(1021, 61, 9, 'Enim hic.', '1563275711', 0, 0),
(1023, 50, 100, 'Ea pariatur.', '1563275712', 0, 0),
(1024, 173, 42, 'Sit ea.', '1563275712', 0, 0),
(1025, 15, 67, 'Asperiores aliquid.', '1563275712', 1, 0),
(1028, 53, 64, 'Facere numquam quo.', '1563275712', 0, 1),
(1035, 90, 71, 'Voluptatem molestias.', '1563275712', 0, 0),
(1037, 10, 51, 'Eum iste illum.', '1563275712', 1, 0),
(1039, 103, 167, 'Doloribus et.', '1563275712', 0, 0),
(1040, 21, 79, 'Ut.', '1563275712', 1, 1),
(1042, 101, 184, 'Commodi dicta ea numquam culpa aperiam.', '1563275712', 0, 0),
(1043, 166, 47, 'Dolor in inventore ut necessitatibus qui.', '1563275712', 1, 0),
(1045, 48, 13, 'Iusto vitae.', '1563275712', 0, 0),
(1047, 34, 47, 'Maiores vel.', '1563275712', 0, 0),
(1048, 175, 169, 'Voluptate corrupti.', '1563275712', 0, 0),
(1051, 73, 162, 'Quia dolores et eos tempora.', '1563275712', 0, 0),
(1052, 203, 89, 'Ducimus in explicabo cum quam.', '1563275712', 0, 0),
(1053, 91, 13, 'Ut vitae deserunt.', '1563275712', 0, 0),
(1054, 190, 50, 'Error dolor id voluptate.', '1563275712', 0, 1),
(1055, 94, 158, 'Animi magnam.', '1563275713', 1, 1),
(1057, 170, 38, 'Voluptatum nisi id quam.', '1563275713', 1, 0),
(1059, 62, 12, 'Ab repudiandae et.', '1563275713', 1, 0),
(1061, 22, 31, 'Error vel.', '1563275713', 1, 1),
(1062, 167, 157, 'Id eum corrupti.', '1563275713', 1, 1),
(1063, 41, 71, 'Quos vel.', '1563275713', 0, 1),
(1064, 190, 96, 'Quia expedita.', '1563275713', 1, 0),
(1066, 17, 51, 'Neque adipisci velit laudantium.', '1563275713', 1, 1),
(1068, 30, 99, 'Voluptates ex id.', '1563275713', 1, 1),
(1069, 175, 157, 'Rem modi quia ut.', '1563275713', 1, 0),
(1070, 197, 75, 'Accusamus ipsum dolore.', '1563275713', 0, 1),
(1072, 195, 71, 'Quia animi optio voluptate enim.', '1563275713', 0, 1),
(1073, 198, 96, 'Dolores expedita autem est rerum.', '1563275713', 0, 0),
(1074, 40, 174, 'Odit iure maxime et.', '1563275713', 0, 0),
(1075, 156, 182, 'Dicta.', '1563275713', 1, 1),
(1076, 17, 94, 'Quia deleniti assumenda.', '1563275713', 1, 1),
(1079, 103, 183, 'Architecto facere vel et.', '1563275713', 0, 0),
(1081, 74, 75, 'Enim.', '1563275713', 1, 1),
(1082, 78, 190, 'Amet possimus ea.', '1563275713', 1, 1),
(1083, 4, 65, 'Ut sint suscipit eos.', '1563275713', 1, 0),
(1084, 82, 82, 'Quae expedita voluptatibus.', '1563275713', 0, 0),
(1086, 49, 193, 'Architecto.', '1563275713', 1, 0),
(1088, 162, 45, 'Aut.', '1563275713', 0, 0),
(1089, 162, 12, 'In quo.', '1563275713', 1, 1),
(1091, 185, 73, 'Consequatur recusandae.', '1563275713', 1, 1),
(1094, 21, 202, 'Aperiam aut.', '1563275713', 0, 1),
(1099, 29, 163, 'Provident sunt qui dolores.', '1563275713', 0, 0),
(1100, 88, 58, 'Et rerum laborum.', '1563275713', 1, 0),
(1102, 69, 173, 'Eum quidem ipsam.', '1563275713', 1, 0),
(1106, 102, 22, 'Aliquid sit consequatur sunt.', '1563275713', 1, 0),
(1108, 43, 12, 'Iste reprehenderit laudantium provident.', '1563275713', 0, 1),
(1109, 64, 173, 'Laboriosam est aspernatur eum.', '1563275713', 0, 1),
(1111, 80, 38, 'Totam enim quis debitis ipsam.', '1563275713', 0, 0),
(1112, 50, 98, 'In amet.', '1563275713', 1, 0),
(1114, 58, 156, 'Ut.', '1563275713', 1, 1),
(1124, 45, 78, 'Animi vel.', '1563275713', 0, 1),
(1126, 41, 73, 'Unde repudiandae minus dolores enim.', '1563275713', 1, 0),
(1127, 92, 202, 'Dicta voluptatem nulla.', '1563275713', 0, 0),
(1128, 175, 10, 'Sequi.', '1563275713', 0, 1),
(1130, 199, 82, 'Voluptatem et.', '1563275713', 1, 0),
(1131, 15, 40, 'Cum vel.', '1563275713', 1, 0),
(1133, 83, 78, 'Facere provident blanditiis.', '1563275713', 0, 1),
(1135, 182, 54, 'Et mollitia aliquid at.', '1563275713', 0, 1),
(1137, 17, 158, 'Et beatae est dolorum doloremque.', '1563275713', 0, 0),
(1138, 167, 168, 'Ratione unde dolore minima.', '1563275713', 1, 1),
(1140, 191, 87, 'Quis accusamus quia voluptate.', '1563275713', 1, 1),
(1141, 86, 102, 'Qui praesentium sequi doloremque.', '1563275713', 1, 1),
(1142, 80, 10, 'Aliquam eos nemo voluptatem.', '1563275713', 0, 0),
(1143, 81, 161, 'Minima earum tempore.', '1563275713', 0, 1),
(1146, 31, 55, 'Optio id.', '1563275714', 1, 1),
(1147, 168, 157, 'Voluptatem consectetur deleniti.', '1563275714', 1, 0),
(1149, 33, 74, 'Quo a.', '1563275714', 0, 0),
(1151, 179, 25, 'Esse omnis illo accusamus modi.', '1563275714', 1, 0),
(1155, 37, 63, 'In.', '1563275714', 0, 1),
(1157, 41, 27, 'Pariatur est non.', '1563275714', 0, 0),
(1159, 8, 85, 'Amet sit.', '1563275714', 0, 0),
(1160, 170, 98, 'Ipsum.', '1563275714', 1, 0),
(1161, 200, 183, 'Totam.', '1563275714', 0, 0),
(1164, 3, 84, 'Laudantium id harum quod.', '1563275714', 1, 0),
(1166, 91, 11, 'Officiis impedit nemo veniam.', '1563275714', 0, 1),
(1167, 38, 181, 'Eveniet id.', '1563275714', 0, 0),
(1168, 84, 42, 'In voluptatem.', '1563275714', 0, 1),
(1170, 171, 43, 'Facilis odio.', '1563275714', 1, 0),
(1174, 98, 50, 'Sint culpa.', '1563275714', 1, 1),
(1176, 195, 160, 'Dolorem quod.', '1563275714', 1, 1),
(1177, 201, 195, 'Aut officia.', '1563275714', 1, 0),
(1180, 162, 60, 'Distinctio repellat omnis.', '1563275714', 0, 0),
(1181, 76, 23, 'Quae.', '1563275714', 0, 0),
(1182, 39, 37, 'Sit.', '1563275714', 1, 0),
(1184, 184, 15, 'Ipsa iste consequuntur.', '1563275714', 1, 0),
(1188, 11, 51, 'Quia animi laudantium velit quia.', '1563275714', 1, 1),
(1191, 49, 170, 'Quod quasi voluptatum perferendis.', '1563275714', 1, 0),
(1194, 16, 185, 'Ut veniam.', '1563275714', 0, 0),
(1195, 158, 84, 'Est recusandae ut vel et.', '1563275714', 0, 1),
(1196, 25, 87, 'Enim reprehenderit sint voluptas.', '1563275714', 0, 0),
(1197, 76, 15, 'Nemo voluptas asperiores eos ad.', '1563275714', 1, 1),
(1198, 85, 40, 'Provident.', '1563275714', 0, 1),
(1199, 170, 10, 'Ipsam amet odit voluptates dolores.', '1563275714', 1, 1),
(1201, 96, 35, 'Accusamus pariatur corporis facere dicta et.', '1563275714', 0, 1),
(1203, 16, 23, 'Voluptas omnis cupiditate.', '1563275714', 0, 0),
(1204, 55, 71, 'Ut accusamus.', '1563275714', 0, 1),
(1205, 8, 31, 'Enim.', '1563275714', 1, 0),
(1209, 197, 55, 'Facere.', '1563275714', 0, 1),
(1215, 157, 177, 'Qui qui.', '1563275714', 0, 0),
(1217, 85, 11, 'Nulla facilis.', '1563275714', 1, 0),
(1219, 196, 71, 'Dolor eum.', '1563275714', 1, 1),
(1221, 32, 33, 'Quae.', '1563275714', 0, 1),
(1222, 177, 51, 'Ullam enim fuga unde eos.', '1563275715', 0, 1),
(1226, 4, 50, 'Ipsum error facere neque.', '1563275715', 1, 0),
(1229, 25, 157, 'Aliquid deleniti.', '1563275715', 1, 0),
(1231, 101, 169, 'Et.', '1563275715', 1, 1),
(1232, 81, 2, 'Quam.', '1563275715', 1, 1),
(1233, 67, 5, 'Ut suscipit consequuntur aut.', '1563275715', 1, 0),
(1234, 202, 203, 'Hic est quia.', '1563275715', 1, 0),
(1237, 103, 195, 'Officia ut facere rem.', '1563275715', 1, 0),
(1239, 34, 187, 'Aut est libero.', '1563275715', 0, 1),
(1241, 92, 21, 'Dolorum.', '1563275715', 0, 0),
(1243, 51, 66, 'Vel sit maxime accusantium voluptates pariatur.', '1563275715', 0, 1),
(1244, 167, 166, 'In odio ut et incidunt eaque.', '1563275715', 1, 1),
(1245, 14, 179, 'Expedita nesciunt hic.', '1563275715', 1, 1),
(1246, 29, 69, 'Nihil.', '1563275715', 1, 0),
(1247, 95, 30, 'Eius error deleniti.', '1563275715', 0, 1),
(1249, 95, 168, 'Doloribus.', '1563275715', 0, 0),
(1250, 9, 61, 'Inventore aspernatur quia.', '1563275715', 0, 1),
(1251, 164, 66, 'Quia sint ducimus quia.', '1563275715', 0, 0),
(1252, 18, 26, 'Illo enim dolores.', '1563275715', 1, 1),
(1253, 34, 10, 'Itaque repellat nihil.', '1563275715', 0, 1),
(1254, 77, 95, 'Excepturi maxime sit.', '1563275715', 1, 0),
(1255, 96, 72, 'Quia rerum voluptatum aut.', '1563275715', 0, 1),
(1256, 7, 80, 'Similique illo sunt.', '1563275715', 0, 1),
(1257, 15, 36, 'Non in excepturi architecto dolores.', '1563275715', 1, 0),
(1258, 92, 57, 'Est.', '1563275715', 0, 1),
(1261, 51, 58, 'Maiores ad.', '1563275715', 1, 1),
(1263, 25, 84, 'Eveniet ipsa expedita maiores unde libero.', '1563275715', 1, 1),
(1265, 103, 90, 'Nobis odio qui possimus temporibus.', '1563275715', 0, 1),
(1266, 73, 180, 'Magni.', '1563275715', 1, 0),
(1270, 91, 98, 'Assumenda adipisci voluptas tempore nesciunt.', '1563275715', 0, 1),
(1271, 76, 79, 'Et.', '1563275715', 0, 1),
(1272, 181, 61, 'Recusandae et consequatur.', '1563275715', 1, 0),
(1274, 36, 72, 'Cupiditate non labore omnis.', '1563275715', 1, 1),
(1275, 82, 50, 'Autem non.', '1563275715', 0, 1),
(1276, 1, 88, 'Autem est sint illum animi.', '1563275715', 0, 1),
(1277, 174, 80, 'Quae cupiditate ipsam mollitia sit deleniti.', '1563275715', 1, 0),
(1278, 163, 37, 'Rerum id.', '1563275715', 0, 0),
(1280, 79, 173, 'Aspernatur.', '1563275715', 1, 0),
(1281, 174, 181, 'Rerum minus aperiam dolorum.', '1563275715', 1, 1),
(1283, 90, 40, 'At non explicabo autem.', '1563275715', 0, 1),
(1288, 164, 2, 'Quia aut fuga.', '1563275715', 0, 1),
(1290, 162, 190, 'Quia.', '1563275715', 0, 0),
(1291, 57, 17, 'Voluptatem perferendis beatae.', '1563275715', 1, 1),
(1293, 49, 167, 'Labore occaecati.', '1563275715', 0, 0),
(1295, 26, 46, 'Nobis autem placeat.', '1563275715', 1, 1),
(1296, 173, 21, 'Quasi atque.', '1563275715', 0, 1),
(1300, 37, 175, 'Omnis.', '1563275715', 1, 1),
(1304, 67, 96, 'Ullam quae occaecati quam.', '1563275715', 0, 1),
(1306, 165, 182, 'Accusamus.', '1563275715', 1, 1),
(1308, 63, 61, 'Illo aliquam doloribus.', '1563275716', 1, 0),
(1309, 46, 52, 'Est amet.', '1563275716', 0, 0),
(1311, 45, 8, 'Fugiat soluta vel.', '1563275716', 1, 0),
(1312, 103, 9, 'Veritatis nisi dicta.', '1563275716', 0, 0),
(1313, 43, 196, 'Et.', '1563275716', 1, 0),
(1314, 195, 200, 'Molestiae beatae quis.', '1563275716', 1, 1),
(1315, 5, 34, 'Magni et.', '1563275716', 0, 0),
(1316, 25, 12, 'Possimus minima laboriosam est quis et.', '1563275716', 0, 0),
(1319, 68, 91, 'Aut numquam sed.', '1563275716', 0, 1),
(1321, 15, 70, 'Nemo provident.', '1563275716', 1, 0),
(1324, 25, 90, 'Omnis ut quis.', '1563275716', 0, 0),
(1326, 20, 58, 'Ut voluptas aut.', '1563275716', 1, 0),
(1327, 38, 29, 'Iure.', '1563275716', 1, 0),
(1328, 18, 171, 'Fugiat quasi.', '1563275716', 0, 1),
(1330, 81, 168, 'Eaque dignissimos ducimus.', '1563275716', 0, 1),
(1331, 49, 188, 'Assumenda in consequatur possimus officia.', '1563275716', 1, 0),
(1332, 28, 75, 'Et cupiditate est unde sed sunt.', '1563275716', 1, 1),
(1333, 188, 28, 'Dicta quo.', '1563275716', 0, 1),
(1335, 89, 30, 'Vel.', '1563275716', 1, 1),
(1336, 22, 61, 'Et voluptas.', '1563275716', 1, 1),
(1337, 36, 70, 'Dicta soluta.', '1563275716', 1, 1),
(1338, 182, 93, 'Ipsam mollitia aperiam.', '1563275716', 0, 0),
(1339, 31, 16, 'Aut iste.', '1563275716', 0, 0),
(1340, 90, 192, 'Vitae sed consequatur.', '1563275716', 0, 0),
(1341, 190, 158, 'Maiores eveniet mollitia.', '1563275716', 1, 0),
(1344, 92, 44, 'Iste ut.', '1563275716', 0, 1),
(1350, 24, 39, 'Repellendus in.', '1563275716', 1, 1),
(1351, 22, 156, 'Dolorum quia omnis.', '1563275716', 1, 0),
(1352, 180, 99, 'Possimus assumenda iure nihil.', '1563275716', 0, 1),
(1356, 167, 62, 'Et.', '1563275716', 0, 0),
(1358, 42, 191, 'Est quasi sint.', '1563275716', 1, 1),
(1359, 1, 69, 'Occaecati dolore.', '1563275716', 0, 1),
(1362, 10, 74, 'Vel et nobis dignissimos.', '1563275716', 1, 0),
(1364, 78, 12, 'Quia molestiae sunt incidunt.', '1563275716', 1, 1),
(1365, 79, 189, 'Laborum ratione.', '1563275716', 1, 0),
(1368, 78, 82, 'Veniam fugiat et quam tempora.', '1563275716', 1, 0),
(1369, 46, 93, 'Labore aut.', '1563275716', 1, 1),
(1371, 68, 157, 'A alias fuga accusantium.', '1563275716', 0, 0),
(1373, 56, 76, 'Quibusdam corporis nesciunt consequuntur sint esse.', '1563275716', 1, 1),
(1374, 165, 38, 'Dolor in veniam iste eaque omnis.', '1563275716', 0, 1),
(1377, 58, 189, 'Quae aut.', '1563275716', 0, 0),
(1378, 200, 17, 'Numquam facere aperiam eum aperiam ipsam.', '1563275716', 1, 0),
(1380, 35, 14, 'Facilis accusamus.', '1563275716', 1, 1),
(1381, 167, 3, 'Mollitia.', '1563275716', 1, 1),
(1382, 65, 17, 'Mollitia aut.', '1563275716', 1, 0),
(1383, 45, 47, 'Reiciendis molestiae.', '1563275716', 1, 1),
(1384, 100, 180, 'Necessitatibus beatae cupiditate.', '1563275716', 1, 1),
(1386, 162, 102, 'Eos perspiciatis possimus porro.', '1563275716', 0, 1),
(1387, 7, 195, 'Ea quidem.', '1563275716', 0, 1),
(1388, 12, 23, 'Est.', '1563275716', 1, 0),
(1389, 27, 79, 'Voluptate est et earum.', '1563275716', 1, 0),
(1391, 100, 25, 'Impedit aperiam.', '1563275716', 0, 0),
(1393, 194, 96, 'Unde eveniet dolore est.', '1563275716', 1, 1),
(1394, 44, 18, 'Odit voluptates sapiente.', '1563275716', 0, 0),
(1396, 65, 43, 'Quasi quo porro voluptatem nam.', '1563275717', 0, 0),
(1398, 25, 200, 'Asperiores maiores.', '1563275717', 0, 0),
(1399, 84, 47, 'Ad.', '1563275717', 1, 0),
(1400, 199, 165, 'Rem.', '1563275717', 1, 1),
(1401, 195, 20, 'A eius aut sint.', '1563275717', 1, 0),
(1405, 72, 174, 'Aut ullam.', '1563275717', 1, 1),
(1406, 16, 54, 'Numquam in iste.', '1563275717', 0, 1),
(1407, 181, 164, 'Vitae est.', '1563275717', 1, 0),
(1408, 100, 169, 'Modi aspernatur.', '1563275717', 0, 0),
(1409, 179, 178, 'Quidem aut.', '1563275717', 0, 1),
(1410, 88, 72, 'Ex.', '1563275717', 1, 1),
(1411, 44, 185, 'Quia.', '1563275717', 0, 0),
(1412, 172, 23, 'Recusandae eum velit.', '1563275717', 0, 1),
(1413, 24, 51, 'Aut expedita.', '1563275717', 0, 0),
(1414, 187, 93, 'Et distinctio molestiae.', '1563275717', 0, 1),
(1415, 37, 53, 'Occaecati.', '1563275717', 1, 1),
(1417, 191, 1, 'Sint officia corporis molestiae explicabo.', '1563275717', 1, 1),
(1422, 15, 18, 'Dicta delectus tempora.', '1563275717', 0, 1),
(1427, 28, 102, 'Corporis unde.', '1563275717', 1, 1),
(1428, 53, 81, 'Quos nam.', '1563275717', 1, 1),
(1429, 76, 53, 'Sunt ut.', '1563275717', 0, 1),
(1431, 165, 29, 'Sunt iste.', '1563275717', 1, 1),
(1433, 168, 43, 'Qui perspiciatis pariatur sed.', '1563275717', 0, 0),
(1435, 25, 36, 'Nulla aut in.', '1563275717', 1, 1),
(1436, 86, 32, 'Est quam et.', '1563275717', 0, 1),
(1440, 15, 172, 'Autem a.', '1563275717', 0, 0),
(1441, 85, 70, 'Enim sapiente.', '1563275717', 0, 0),
(1443, 70, 92, 'Et dolor sequi blanditiis.', '1563275717', 1, 0),
(1444, 176, 43, 'In magnam aut et tenetur.', '1563275717', 0, 0),
(1445, 11, 100, 'Est alias consequatur.', '1563275717', 0, 0),
(1446, 93, 42, 'Modi.', '1563275717', 0, 1),
(1447, 31, 160, 'Qui.', '1563275717', 1, 1),
(1448, 45, 6, 'Est nesciunt repellendus.', '1563275717', 1, 1),
(1450, 187, 179, 'Eum.', '1563275717', 1, 0),
(1452, 58, 61, 'Voluptas dolorem autem.', '1563275717', 0, 0),
(1453, 165, 6, 'Tenetur.', '1563275717', 0, 0),
(1454, 193, 170, 'Dolores inventore et sunt quis.', '1563275717', 0, 1),
(1455, 63, 70, 'Est sint eius.', '1563275717', 1, 1),
(1456, 161, 186, 'Consequatur et.', '1563275717', 0, 0),
(1457, 170, 184, 'Qui ducimus.', '1563275717', 0, 0),
(1458, 89, 3, 'Minus reiciendis cum.', '1563275717', 1, 0),
(1459, 57, 181, 'Ut tempore doloribus.', '1563275717', 0, 1),
(1461, 191, 80, 'Sint eaque.', '1563275717', 1, 0),
(1463, 75, 54, 'Et neque distinctio est corporis.', '1563275717', 0, 1),
(1464, 52, 64, 'Unde tenetur eligendi iure.', '1563275717', 0, 1),
(1465, 193, 56, 'Occaecati doloremque vero maiores.', '1563275717', 0, 1),
(1466, 80, 94, 'Beatae harum at.', '1563275717', 1, 1),
(1467, 88, 61, 'Quia.', '1563275717', 0, 0),
(1468, 75, 62, 'Iste nulla eos temporibus.', '1563275717', 0, 1),
(1469, 53, 67, 'Totam magnam.', '1563275717', 1, 0),
(1470, 4, 20, 'Ab et est nisi vel.', '1563275717', 1, 0),
(1471, 68, 50, 'Mollitia.', '1563275717', 0, 1),
(1474, 82, 11, 'Totam.', '1563275717', 0, 1),
(1477, 79, 71, 'Voluptates sit est veritatis voluptatem.', '1563275717', 0, 0),
(1478, 62, 82, 'Et nulla corporis.', '1563275717', 0, 0),
(1479, 29, 45, 'Sapiente nesciunt.', '1563275717', 0, 1),
(1482, 75, 71, 'Pariatur veniam praesentium.', '1563275717', 0, 1),
(1485, 186, 24, 'In.', '1563275717', 0, 1),
(1489, 10, 86, 'Et perferendis ut.', '1563275717', 1, 0),
(1490, 66, 76, 'A cupiditate quibusdam vero.', '1563275717', 0, 1),
(1491, 82, 86, 'Ratione aut in.', '1563275717', 1, 0);
INSERT INTO `messages_list` (`id`, `userId`, `toId`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`) VALUES
(1494, 70, 40, 'Officia rerum officiis sunt.', '1563275718', 0, 1),
(1497, 11, 80, 'Pariatur nihil dolore perspiciatis.', '1563275718', 1, 0),
(1498, 194, 86, 'Nostrum et et odit sit.', '1563275718', 0, 1),
(1501, 173, 102, 'Delectus ex optio.', '1563275718', 0, 1),
(1502, 33, 42, 'Corrupti nesciunt.', '1563275718', 1, 0),
(1504, 83, 167, 'Asperiores dolorem non.', '1563275718', 0, 0),
(1505, 99, 15, 'Deserunt voluptatibus.', '1563275718', 0, 1),
(1506, 48, 203, 'Et explicabo.', '1563275718', 1, 1),
(1507, 79, 96, 'Qui repudiandae.', '1563275718', 1, 1),
(1508, 15, 200, 'Ipsa sed necessitatibus exercitationem.', '1563275718', 0, 1),
(1511, 200, 90, 'Libero voluptate voluptas.', '1563275718', 0, 1),
(1512, 32, 28, 'Earum unde cupiditate non.', '1563275718', 1, 0),
(1515, 32, 176, 'Itaque accusamus.', '1563275718', 1, 1),
(1519, 17, 53, 'Minus et voluptatem in perspiciatis.', '1563275718', 0, 0),
(1520, 185, 172, 'Impedit ipsa explicabo.', '1563275718', 0, 1),
(1523, 54, 89, 'Consequatur eum.', '1563275718', 1, 1),
(1525, 90, 58, 'Totam id.', '1563275718', 0, 0),
(1526, 201, 29, 'Sint quis sit sit.', '1563275718', 0, 1),
(1529, 27, 73, 'Omnis sunt fugiat.', '1563275718', 0, 1),
(1530, 34, 71, 'Dolorem accusamus exercitationem accusantium aut.', '1563275718', 0, 1),
(1532, 41, 42, 'Architecto vitae distinctio illo dolor.', '1563275718', 1, 1),
(1533, 199, 44, 'Voluptatem adipisci.', '1563275718', 0, 1),
(1536, 100, 84, 'Quas molestias.', '1563275718', 0, 0),
(1541, 4, 49, 'Nisi facere animi consequatur.', '1563275718', 1, 1),
(1544, 20, 177, 'Modi voluptas amet.', '1563275718', 0, 0),
(1545, 72, 6, 'Quas eos quia corporis distinctio.', '1563275718', 0, 1),
(1550, 55, 75, 'Omnis sit.', '1563275718', 1, 0),
(1553, 187, 185, 'Quis inventore.', '1563275718', 1, 0),
(1554, 77, 67, 'Exercitationem qui magni ea.', '1563275719', 0, 0),
(1560, 41, 180, 'Eius.', '1563275719', 0, 1),
(1561, 92, 173, 'Odit voluptas.', '1563275719', 0, 0),
(1562, 184, 10, 'Voluptate ipsa.', '1563275719', 1, 1),
(1565, 86, 181, 'Dolor voluptatem qui culpa.', '1563275719', 0, 0),
(1566, 27, 95, 'Beatae eum repudiandae eius.', '1563275719', 1, 1),
(1569, 188, 86, 'Corporis est autem.', '1563275719', 0, 1),
(1570, 169, 40, 'Sunt totam.', '1563275719', 1, 0),
(1572, 186, 190, 'Delectus repellendus et.', '1563275719', 1, 0),
(1573, 101, 183, 'Magnam ipsam.', '1563275719', 0, 0),
(1575, 27, 99, 'Rerum ea enim similique.', '1563275719', 1, 1),
(1577, 1, 39, 'Id quia ad nihil reiciendis.', '1563275719', 1, 0),
(1578, 65, 13, 'Consequatur nihil cum quod.', '1563275719', 0, 0),
(1579, 61, 67, 'Eius velit rem cum.', '1563275719', 1, 0),
(1580, 161, 43, 'Qui autem.', '1563275719', 0, 1),
(1582, 38, 192, 'Quo.', '1563275719', 1, 1),
(1584, 94, 49, 'Accusamus eum iusto.', '1563275719', 0, 0),
(1586, 173, 175, 'Ut quas.', '1563275719', 1, 0),
(1587, 99, 182, 'Molestiae dolores rerum eum.', '1563275719', 0, 0),
(1590, 52, 27, 'Id possimus.', '1563275719', 1, 0),
(1593, 3, 6, 'Fugit.', '1563275719', 1, 1),
(1594, 189, 43, 'Explicabo veritatis repudiandae occaecati doloribus.', '1563275719', 0, 1),
(1595, 42, 86, 'Deserunt.', '1563275719', 0, 0),
(1596, 179, 67, 'Repudiandae omnis vitae natus.', '1563275719', 1, 0),
(1598, 56, 73, 'Recusandae nemo officiis.', '1563275719', 0, 1),
(1599, 42, 53, 'Veritatis odit omnis.', '1563275719', 1, 1),
(1600, 49, 196, 'Quisquam non.', '1563275719', 0, 0),
(1601, 78, 14, 'Sint repudiandae et ab.', '1563275719', 1, 1),
(1603, 184, 7, 'Quidem et nemo dolorum ut.', '1563275719', 0, 0),
(1611, 38, 91, 'Ratione dolor.', '1563275719', 1, 1),
(1615, 199, 172, 'Harum doloribus ut.', '1563275720', 1, 1),
(1616, 180, 187, 'Eos deserunt.', '1563275720', 0, 1),
(1618, 188, 15, 'Quae.', '1563275720', 0, 1),
(1619, 189, 201, 'A.', '1563275720', 0, 0),
(1620, 14, 36, 'Sed pariatur eos.', '1563275720', 1, 0),
(1621, 195, 103, 'Quidem et totam.', '1563275720', 1, 0),
(1626, 6, 35, 'Et ad excepturi impedit.', '1563275720', 1, 1),
(1627, 39, 101, 'Possimus voluptatem natus.', '1563275720', 1, 0),
(1630, 203, 54, 'Deserunt commodi.', '1563275720', 0, 0),
(1631, 37, 65, 'Ab.', '1563275720', 1, 1),
(1632, 75, 56, 'Tenetur ut minima eos soluta nulla.', '1563275720', 1, 1),
(1633, 83, 18, 'Ut dolores.', '1563275720', 1, 1),
(1635, 46, 199, 'Repudiandae fugit.', '1563275720', 1, 1),
(1636, 12, 164, 'Veniam nisi iure odit omnis.', '1563275720', 0, 1),
(1637, 53, 167, 'Fuga ad quae commodi pariatur.', '1563275720', 0, 0),
(1640, 93, 45, 'Aliquam qui beatae.', '1563275720', 0, 1),
(1641, 92, 158, 'Veniam.', '1563275720', 0, 0),
(1643, 180, 97, 'Illum eum non voluptate.', '1563275720', 1, 1),
(1644, 18, 42, 'Et vel.', '1563275720', 1, 1),
(1648, 55, 168, 'Non consectetur consequuntur.', '1563275720', 1, 1),
(1650, 185, 179, 'Quia ipsum.', '1563275720', 1, 0),
(1653, 172, 7, 'Natus saepe omnis.', '1563275720', 0, 0),
(1657, 84, 41, 'Cum dignissimos delectus.', '1563275720', 1, 0),
(1658, 96, 97, 'Repellendus laboriosam.', '1563275720', 0, 1),
(1660, 179, 11, 'Incidunt minima.', '1563275720', 1, 1),
(1662, 46, 203, 'Ut qui in.', '1563275721', 1, 0),
(1665, 93, 100, 'Quas commodi odio reiciendis ducimus dolorem.', '1563275721', 1, 0),
(1667, 164, 11, 'Nihil cum soluta qui.', '1563275721', 1, 1),
(1668, 50, 19, 'Dolorum beatae dolorem ad.', '1563275721', 0, 0),
(1669, 35, 92, 'Soluta porro.', '1563275721', 1, 0),
(1670, 1, 72, 'Saepe repellendus ut.', '1563275721', 1, 0),
(1671, 34, 181, 'Id beatae odit iusto.', '1563275721', 0, 0),
(1672, 160, 28, 'Culpa maiores minus.', '1563275721', 1, 1),
(1673, 33, 168, 'Dignissimos nisi ipsum quo.', '1563275721', 1, 1),
(1676, 96, 73, 'Architecto ullam.', '1563275721', 1, 1),
(1678, 59, 29, 'Dolor architecto.', '1563275721', 0, 0),
(1680, 15, 191, 'Molestias eum aut nobis temporibus tenetur.', '1563275721', 0, 0),
(1682, 184, 32, 'Laboriosam explicabo.', '1563275721', 1, 1),
(1684, 29, 43, 'Omnis facere adipisci unde possimus.', '1563275721', 0, 0),
(1686, 195, 194, 'Natus.', '1563275721', 1, 0),
(1687, 184, 1, 'Ratione nihil inventore omnis.', '1563275721', 1, 1),
(1689, 176, 192, 'Vel accusantium voluptatem quis.', '1563275721', 0, 0),
(1690, 164, 169, 'Molestias.', '1563275721', 0, 1),
(1691, 167, 98, 'Fugit.', '1563275721', 0, 0),
(1694, 48, 16, 'Et praesentium est.', '1563275721', 0, 0),
(1697, 40, 22, 'Iste iure animi est.', '1563275721', 0, 0),
(1698, 86, 173, 'Magni occaecati.', '1563275721', 0, 0),
(1701, 12, 82, 'Exercitationem distinctio dolor odio reiciendis.', '1563275721', 1, 0),
(1702, 100, 63, 'Quod id voluptas.', '1563275721', 0, 0),
(1703, 35, 183, 'Unde eos omnis eveniet.', '1563275721', 1, 1),
(1704, 1, 195, 'Aut consequuntur eos maiores.', '1563275721', 0, 1),
(1705, 71, 192, 'Et tempora aliquid.', '1563275721', 1, 1),
(1706, 70, 72, 'Nostrum sed.', '1563275721', 1, 1),
(1707, 57, 42, 'Labore error.', '1563275721', 1, 0),
(1709, 184, 198, 'Consequatur repudiandae ipsam.', '1563275721', 1, 1),
(1711, 27, 100, 'A enim accusamus.', '1563275721', 1, 1),
(1713, 62, 10, 'Blanditiis.', '1563275721', 0, 1),
(1715, 76, 14, 'Et fuga.', '1563275721', 1, 0),
(1716, 37, 86, 'Et quam accusamus sapiente.', '1563275721', 0, 1),
(1719, 50, 76, 'Dolore temporibus praesentium autem.', '1563275721', 1, 1),
(1722, 91, 17, 'Impedit qui est.', '1563275722', 1, 1),
(1724, 4, 92, 'Quia harum.', '1563275722', 1, 1),
(1726, 61, 93, 'Ducimus.', '1563275722', 0, 1),
(1727, 71, 177, 'Et sunt.', '1563275722', 0, 1),
(1728, 201, 186, 'Culpa corporis quidem.', '1563275722', 0, 1),
(1730, 46, 19, 'Molestiae dignissimos aut.', '1563275722', 0, 0),
(1732, 48, 77, 'Tenetur exercitationem.', '1563275723', 0, 1),
(1733, 33, 100, 'Necessitatibus.', '1563275723', 1, 1),
(1736, 26, 173, 'Officia enim quos.', '1563275723', 0, 0),
(1737, 34, 92, 'Expedita debitis eum molestiae.', '1563275723', 0, 1),
(1739, 12, 158, 'Eum.', '1563275723', 1, 1),
(1744, 85, 163, 'Omnis optio voluptas corporis quaerat.', '1563275723', 1, 1),
(1746, 94, 44, 'Accusamus esse deleniti.', '1563275723', 0, 0),
(1747, 27, 166, 'Velit quia odit.', '1563275723', 0, 1),
(1752, 68, 45, 'Magni et quam.', '1563275723', 0, 1),
(1753, 41, 70, 'Consequuntur consequatur nihil.', '1563275723', 1, 0),
(1754, 171, 53, 'Quidem.', '1563275723', 0, 1),
(1757, 192, 70, 'Accusantium animi.', '1563275723', 0, 0),
(1759, 160, 91, 'Amet repellendus voluptates voluptatum.', '1563275723', 0, 1),
(1763, 88, 97, 'Blanditiis.', '1563275723', 0, 0),
(1766, 82, 54, 'Doloremque aut et.', '1563275723', 1, 0),
(1769, 101, 19, 'Quia.', '1563275723', 0, 0),
(1770, 27, 104, 'Officia tenetur eius.', '1563275723', 0, 1),
(1771, 41, 165, 'Dignissimos minima fuga asperiores ut.', '1563275723', 1, 0),
(1772, 85, 65, 'Laudantium.', '1563275723', 0, 1),
(1773, 80, 38, 'Ut doloremque.', '1563275723', 1, 0),
(1774, 168, 75, 'Omnis blanditiis aut rerum.', '1563275723', 0, 1),
(1776, 27, 185, 'Eum dolor.', '1563275723', 0, 0),
(1777, 9, 49, 'Dicta.', '1563275723', 0, 1),
(1778, 39, 62, 'Non alias.', '1563275723', 0, 1),
(1779, 4, 4, 'Repudiandae maxime quibusdam molestias.', '1563275723', 1, 0),
(1781, 160, 36, 'Id eos consequatur consequatur.', '1563275724', 1, 1),
(1782, 87, 167, 'Dolores at.', '1563275724', 0, 1),
(1784, 44, 96, 'Est.', '1563275724', 1, 0),
(1785, 185, 95, 'Et vel.', '1563275724', 0, 1),
(1786, 179, 28, 'Modi in libero.', '1563275724', 0, 1),
(1787, 3, 64, 'Ea impedit temporibus doloremque iste.', '1563275724', 0, 0),
(1788, 94, 168, 'Inventore dignissimos ut aut sit.', '1563275724', 0, 1),
(1790, 94, 43, 'Inventore molestiae aperiam.', '1563275724', 0, 1),
(1791, 40, 98, 'Velit tenetur repellendus.', '1563275724', 1, 0),
(1794, 56, 86, 'Veniam impedit.', '1563275724', 1, 0),
(1796, 192, 9, 'Commodi dicta totam porro.', '1563275724', 0, 1),
(1797, 6, 201, 'Impedit in aliquam.', '1563275724', 1, 1),
(1799, 80, 52, 'Veritatis deleniti.', '1563275724', 1, 0),
(1800, 57, 156, 'Explicabo omnis eos placeat.', '1563275724', 1, 1),
(1803, 20, 19, 'Provident beatae animi asperiores.', '1563275724', 1, 1),
(1806, 11, 10, 'Aspernatur suscipit.', '1563275724', 0, 0),
(1807, 159, 44, 'Delectus doloremque et tempore perferendis.', '1563275724', 1, 1),
(1808, 101, 52, 'Alias vero.', '1563275724', 1, 1),
(1809, 67, 38, 'Laudantium enim dolores.', '1563275724', 0, 1),
(1810, 21, 37, 'Aut est eligendi.', '1563275724', 0, 0),
(1811, 198, 54, 'Eos excepturi deserunt.', '1563275724', 0, 1),
(1815, 51, 78, 'Qui non.', '1563275724', 1, 0),
(1817, 20, 82, 'Cumque autem at.', '1563275724', 1, 1),
(1818, 94, 64, 'Suscipit quia error molestiae quo.', '1563275724', 0, 0),
(1819, 193, 55, 'Totam delectus.', '1563275724', 0, 0),
(1820, 183, 183, 'Earum tempora.', '1563275724', 1, 1),
(1822, 102, 163, 'Qui.', '1563275724', 0, 0),
(1824, 194, 65, 'Voluptatem iusto aut.', '1563275724', 1, 0),
(1825, 180, 163, 'Sunt sit aut expedita.', '1563275724', 0, 1),
(1826, 194, 8, 'Itaque molestias facere dolor.', '1563275725', 0, 1),
(1828, 176, 94, 'Nihil et incidunt.', '1563275725', 0, 0),
(1829, 97, 187, 'Accusantium.', '1563275725', 1, 1),
(1832, 16, 61, 'Dignissimos velit.', '1563275725', 1, 1),
(1834, 190, 64, 'Voluptatum at dolores ut officia fugit.', '1563275725', 0, 0),
(1835, 157, 159, 'Qui nostrum.', '1563275725', 0, 0),
(1836, 48, 32, 'Dolore laudantium.', '1563275725', 0, 1),
(1837, 178, 193, 'Beatae aut repudiandae autem eos.', '1563275725', 0, 0),
(1838, 30, 1, 'Accusantium earum illum odit.', '1563275725', 1, 0),
(1839, 58, 67, 'Necessitatibus sapiente quis.', '1563275725', 1, 0),
(1840, 36, 82, 'Tenetur aut qui.', '1563275725', 0, 1),
(1841, 4, 69, 'Sint ea vero.', '1563275725', 0, 1),
(1844, 171, 14, 'Neque enim numquam.', '1563275725', 0, 0),
(1845, 96, 37, 'Corporis labore ut.', '1563275725', 1, 1),
(1846, 38, 196, 'Ipsam laudantium.', '1563275725', 0, 0),
(1847, 198, 189, 'Sed consequuntur est sed ex.', '1563275725', 1, 1),
(1848, 62, 90, 'Ut voluptas.', '1563275725', 0, 1),
(1851, 156, 169, 'Quis ipsam.', '1563275725', 0, 1),
(1853, 65, 80, 'Ea aut error.', '1563275725', 1, 1),
(1856, 84, 164, 'Omnis quia.', '1563275725', 1, 1),
(1857, 6, 74, 'Qui cum explicabo.', '1563275725', 0, 0),
(1859, 176, 158, 'Omnis dolorum sed autem quam.', '1563275725', 0, 0),
(1860, 3, 17, 'Porro aut rem.', '1563275725', 0, 0),
(1861, 8, 1, 'Quo reprehenderit.', '1563275725', 1, 1),
(1866, 62, 98, 'Nostrum et necessitatibus eveniet qui.', '1563275725', 0, 1),
(1869, 55, 102, 'Odit quia sit.', '1563275725', 1, 0),
(1872, 58, 81, 'Nulla qui vel aut et.', '1563275725', 1, 0),
(1873, 39, 197, 'Sint voluptatem necessitatibus praesentium.', '1563275725', 1, 0),
(1874, 173, 52, 'Iure est qui.', '1563275725', 0, 1),
(1875, 26, 73, 'Quo id excepturi.', '1563275725', 0, 0),
(1879, 181, 60, 'Vitae ut pariatur.', '1563275725', 1, 0),
(1882, 90, 164, 'Iste ipsam nemo.', '1563275725', 0, 0),
(1883, 62, 190, 'Cum.', '1563275725', 0, 1),
(1884, 90, 186, 'Dolorem ducimus.', '1563275725', 0, 0),
(1885, 8, 75, 'Eum et tempore.', '1563275725', 1, 1),
(1886, 21, 22, 'Voluptas ab facere.', '1563275725', 1, 0),
(1887, 27, 198, 'Voluptatum.', '1563275725', 0, 0),
(1893, 43, 176, 'Eius saepe.', '1563275725', 1, 1),
(1895, 189, 173, 'Cumque.', '1563275725', 0, 0),
(1898, 103, 40, 'Eveniet.', '1563275725', 0, 0),
(1901, 168, 71, 'Est et quasi est maiores.', '1563275726', 1, 0),
(1902, 28, 46, 'Quisquam dolore et.', '1563275726', 1, 1),
(1903, 70, 20, 'Est necessitatibus cum et maiores alias.', '1563275726', 1, 1),
(1904, 187, 57, 'Nihil quod voluptas.', '1563275726', 1, 0),
(1907, 183, 85, 'Sunt natus necessitatibus repellendus.', '1563275726', 1, 0),
(1910, 187, 24, 'Eius quia provident earum et.', '1563275726', 1, 1),
(1912, 95, 8, 'Eaque et est cum.', '1563275726', 1, 0),
(1914, 88, 191, 'Nisi et mollitia aperiam.', '1563275726', 1, 1),
(1916, 164, 53, 'Provident architecto.', '1563275726', 1, 1),
(1924, 20, 36, 'Inventore officiis quia.', '1563275726', 0, 1),
(1925, 58, 172, 'Facilis odio labore molestiae nihil velit.', '1563275726', 0, 1),
(1926, 185, 59, 'Neque qui eaque laboriosam sit.', '1563275726', 1, 1),
(1927, 11, 28, 'Quia quaerat.', '1563275726', 0, 1),
(1928, 38, 55, 'Amet beatae dolores.', '1563275726', 1, 1),
(1930, 2, 3, 'Sed quos aut autem.', '1563275726', 0, 1),
(1935, 175, 96, 'Ut maiores dolore eos.', '1563275726', 1, 0),
(1937, 7, 87, 'Aperiam odio tempora.', '1563275726', 0, 1),
(1939, 2, 37, 'Et id.', '1563275726', 1, 1),
(1941, 97, 156, 'Sed odit.', '1563275726', 1, 0),
(1944, 179, 4, 'Et ratione quisquam.', '1563275726', 0, 1),
(1945, 30, 62, 'Sit perferendis.', '1563275726', 0, 1),
(1946, 175, 84, 'Voluptatem.', '1563275726', 0, 1),
(1947, 180, 189, 'Rem consequatur.', '1563275726', 1, 1),
(1950, 18, 53, 'Iusto amet.', '1563275726', 0, 1),
(1951, 82, 49, 'Error est.', '1563275726', 1, 0),
(1954, 9, 12, 'Non pariatur.', '1563275726', 0, 1),
(1958, 34, 162, 'Reprehenderit pariatur.', '1563275726', 0, 1),
(1960, 180, 70, 'Ut ipsa voluptas qui.', '1563275726', 1, 0),
(1961, 42, 56, 'Cumque est dolores aut.', '1563275726', 1, 0),
(1963, 5, 23, 'Illo adipisci ea sit.', '1563275726', 0, 0),
(1968, 96, 8, 'Odit.', '1563275726', 1, 0),
(1969, 193, 169, 'Est qui.', '1563275726', 1, 0),
(1971, 79, 170, 'Vel voluptas.', '1563275726', 0, 0),
(1972, 2, 168, 'Totam.', '1563275726', 0, 1),
(1974, 194, 98, 'Ad.', '1563275726', 0, 1),
(1977, 162, 26, 'Et numquam suscipit.', '1563275726', 0, 0),
(1978, 78, 14, 'Deleniti rem sit voluptas.', '1563275727', 1, 0),
(1981, 18, 12, 'Qui consectetur ut.', '1563275727', 0, 1),
(1982, 21, 103, 'Qui quia nulla sed.', '1563275727', 0, 1),
(1985, 15, 187, 'Numquam et distinctio quia atque illum.', '1563275727', 0, 1),
(1988, 174, 161, 'Corporis eos architecto.', '1563275727', 1, 1),
(1991, 74, 98, 'Ut aliquid explicabo et.', '1563275727', 0, 0),
(1993, 26, 87, 'Fugit at quae.', '1563275727', 0, 1),
(1996, 17, 79, 'Sint aliquam.', '1563275727', 0, 0),
(1997, 103, 99, 'In voluptates laudantium.', '1563275727', 1, 1),
(1999, 177, 103, 'Animi at quia doloribus.', '1563275727', 0, 0),
(2000, 80, 64, 'Officia ut.', '1563275727', 1, 0),
(2001, 94, 28, 'Et aut.', '1563275727', 0, 0),
(2002, 190, 41, 'Laborum reprehenderit.', '1563275727', 0, 0),
(2003, 39, 87, 'Aut ducimus eos non.', '1563275727', 0, 0),
(2005, 4, 86, 'Cupiditate adipisci voluptas.', '1563275727', 0, 0),
(2006, 59, 35, 'Amet id libero.', '1563275727', 1, 0),
(2007, 57, 181, 'Corporis dolorem sint rerum tempora aut.', '1563275727', 1, 0),
(2010, 19, 202, 'Et perspiciatis facere quae neque.', '1563275727', 1, 0),
(2011, 37, 44, 'Enim ut.', '1563275727', 1, 1),
(2012, 74, 183, 'Dolore est maxime.', '1563275727', 0, 1),
(2016, 60, 63, 'Cum cupiditate.', '1563275727', 0, 0),
(2018, 89, 81, 'Nemo aliquid.', '1563275727', 1, 0),
(2019, 50, 3, 'Velit.', '1563275727', 1, 0),
(2022, 15, 177, 'Nihil aut.', '1563275728', 1, 1),
(2023, 27, 177, 'Reiciendis.', '1563275728', 0, 1),
(2024, 101, 59, 'Aut consequatur error.', '1563275728', 0, 1),
(2026, 52, 198, 'Ab dolores sed.', '1563275728', 1, 1),
(2027, 195, 83, 'Voluptatibus corrupti nulla laboriosam.', '1563275728', 0, 0),
(2029, 18, 5, 'Aut dolorem aut.', '1563275728', 0, 1),
(2030, 88, 25, 'Rerum nihil iste.', '1563275728', 0, 0),
(2031, 89, 25, 'Beatae expedita quo.', '1563275728', 1, 1),
(2034, 203, 33, 'Nulla eveniet.', '1563275728', 1, 0),
(2035, 84, 196, 'Voluptatibus suscipit alias.', '1563275728', 1, 0),
(2036, 50, 172, 'Ab aut sit.', '1563275728', 0, 1),
(2038, 65, 174, 'Accusamus asperiores commodi.', '1563275728', 1, 0),
(2039, 181, 66, 'Repellendus in necessitatibus deleniti.', '1563275728', 0, 1),
(2040, 163, 81, 'Exercitationem natus.', '1563275728', 0, 1),
(2041, 30, 195, 'Porro quia.', '1563275728', 0, 1),
(2042, 160, 187, 'Sapiente et facilis necessitatibus laborum.', '1563275728', 1, 0),
(2044, 63, 165, 'Ut optio quae vitae.', '1563275729', 0, 1),
(2045, 13, 13, 'Tempora error placeat dolores.', '1563275729', 0, 1),
(2047, 162, 93, 'Et cum rerum.', '1563275729', 1, 1),
(2049, 52, 176, 'Consequatur eaque tenetur.', '1563275729', 0, 0),
(2051, 8, 82, 'Expedita perspiciatis.', '1563283857', 1, 0),
(2053, 101, 5, 'Libero quos quia perspiciatis.', '1563283857', 1, 0),
(2054, 34, 104, 'Provident harum maiores.', '1563283857', 0, 0),
(2055, 103, 50, 'Corporis nobis quis placeat.', '1563283857', 0, 0),
(2056, 9, 52, 'Deleniti dolorem.', '1563283857', 1, 1),
(2057, 37, 44, 'Dolores quia et.', '1563283857', 1, 1),
(2058, 175, 85, 'Atque consequuntur.', '1563283857', 0, 1),
(2059, 104, 5, 'Et modi aut omnis cum.', '1563283857', 0, 0),
(2060, 186, 81, 'Cupiditate.', '1563283857', 1, 0),
(2062, 179, 35, 'Quia vel qui minus ea.', '1563283858', 1, 0),
(2064, 198, 9, 'Culpa nisi.', '1563283858', 1, 0),
(2065, 47, 23, 'Rerum et vel.', '1563283858', 0, 0),
(2067, 30, 189, 'In consequatur.', '1563283858', 1, 0),
(2068, 21, 30, 'Praesentium in praesentium.', '1563283858', 1, 0),
(2070, 37, 175, 'Aut tenetur quasi.', '1563283858', 0, 1),
(2072, 163, 41, 'Iure saepe velit.', '1563283858', 0, 1),
(2076, 48, 156, 'Cumque provident.', '1563283858', 0, 0),
(2081, 54, 34, 'Alias.', '1563283858', 0, 0),
(2083, 3, 41, 'Nesciunt amet porro.', '1563283858', 0, 1),
(2084, 192, 77, 'Laudantium delectus.', '1563283858', 1, 0),
(2085, 158, 176, 'Voluptatem perferendis nihil.', '1563283858', 1, 1),
(2086, 41, 74, 'Tempore beatae.', '1563283858', 0, 1),
(2088, 197, 28, 'Eos voluptas tempore.', '1563283858', 0, 1),
(2089, 16, 196, 'Culpa ut nostrum.', '1563283858', 0, 1),
(2090, 15, 48, 'Doloribus soluta.', '1563283858', 0, 0),
(2091, 29, 10, 'Ea.', '1563283858', 1, 0),
(2093, 188, 9, 'Accusamus architecto asperiores.', '1563283858', 0, 0),
(2094, 91, 24, 'Vitae quibusdam tempora rerum dolores.', '1563283858', 1, 1),
(2096, 102, 47, 'In sit omnis.', '1563283858', 1, 1),
(2099, 6, 96, 'Ut modi nihil.', '1563283858', 1, 0),
(2100, 192, 186, 'Veniam aspernatur.', '1563283858', 1, 1),
(2101, 28, 200, 'Molestiae deleniti velit.', '1563283858', 0, 1),
(2102, 189, 77, 'Cumque ducimus.', '1563283858', 1, 0),
(2103, 36, 100, 'Voluptatem.', '1563283858', 0, 0),
(2105, 169, 174, 'Velit quia.', '1563283858', 0, 0),
(2106, 203, 178, 'Enim sunt perferendis dolorem.', '1563283858', 0, 0),
(2107, 10, 46, 'Qui vel quam ex.', '1563283858', 0, 0),
(2108, 19, 174, 'Itaque voluptates perferendis.', '1563283858', 0, 0),
(2111, 184, 184, 'Non non dignissimos voluptatem.', '1563283858', 0, 1),
(2113, 10, 57, 'Eum quos similique aspernatur culpa commodi.', '1563283858', 0, 1),
(2114, 62, 188, 'Laborum veniam.', '1563283858', 0, 0),
(2118, 38, 93, 'Ut autem.', '1563283858', 1, 1),
(2120, 179, 76, 'Laboriosam.', '1563283858', 0, 0),
(2121, 22, 68, 'Consequatur quaerat sunt.', '1563283858', 1, 1),
(2122, 84, 203, 'Excepturi.', '1563283859', 0, 1),
(2128, 189, 4, 'Ut voluptatem.', '1563283859', 0, 1),
(2129, 67, 63, 'Fuga et nobis officiis.', '1563283859', 0, 0),
(2130, 168, 198, 'Eligendi iusto.', '1563283859', 1, 1),
(2131, 61, 31, 'Nobis ullam sunt eum vitae omnis.', '1563283859', 1, 1),
(2132, 189, 56, 'Totam.', '1563283859', 0, 1),
(2133, 160, 12, 'Sapiente natus inventore blanditiis.', '1563283859', 1, 1),
(2136, 32, 198, 'Necessitatibus aliquam ut eum.', '1563283859', 1, 0),
(2137, 45, 29, 'Repudiandae ea nihil.', '1563283859', 0, 1),
(2141, 40, 168, 'Eaque laborum earum dicta.', '1563283859', 0, 0),
(2143, 58, 60, 'Inventore facere molestias ex.', '1563283859', 1, 0),
(2145, 86, 23, 'Qui impedit.', '1563283859', 1, 1),
(2146, 188, 12, 'Eius odio ad.', '1563283859', 1, 1),
(2154, 91, 90, 'Quo autem quia saepe sed voluptatem.', '1563283859', 0, 1),
(2158, 94, 62, 'Odit voluptatem qui ad.', '1563283859', 1, 0),
(2163, 38, 11, 'Ad.', '1563283859', 0, 0),
(2165, 89, 19, 'Aut autem quia aut.', '1563283859', 1, 0),
(2167, 39, 80, 'Reprehenderit minus velit nam.', '1563283859', 0, 1),
(2169, 63, 74, 'Aut nulla et aut qui.', '1563283859', 0, 0),
(2170, 167, 70, 'Omnis cumque velit.', '1563283859', 0, 1),
(2171, 73, 195, 'Aliquid suscipit.', '1563283859', 0, 0),
(2174, 182, 15, 'Corrupti aut laudantium.', '1563283859', 1, 0),
(2177, 76, 48, 'Eum quia odit.', '1563283859', 1, 0),
(2180, 39, 86, 'Ut delectus quisquam.', '1563283859', 0, 1),
(2182, 98, 183, 'Nesciunt dolores quo.', '1563283859', 0, 0),
(2186, 80, 9, 'Consequuntur.', '1563283859', 0, 0),
(2187, 32, 67, 'Eos nulla eius.', '1563283859', 0, 0),
(2190, 50, 44, 'Iste cumque.', '1563283859', 0, 0),
(2193, 61, 103, 'Qui maxime repellendus.', '1563283859', 1, 1),
(2194, 77, 59, 'Similique optio.', '1563283859', 0, 1),
(2196, 163, 56, 'Totam voluptatem quibusdam tempore.', '1563283859', 1, 0),
(2197, 184, 162, 'Vel provident.', '1563283859', 1, 1),
(2198, 67, 14, 'Et optio repellendus.', '1563283859', 0, 1),
(2199, 24, 27, 'Est.', '1563283859', 1, 0),
(2202, 181, 82, 'Tenetur officiis.', '1563283859', 0, 1),
(2205, 9, 95, 'Aut distinctio.', '1563283860', 0, 0),
(2206, 1, 83, 'Voluptatem delectus a.', '1563283860', 1, 1),
(2210, 7, 91, 'Voluptas doloribus.', '1563283860', 1, 0),
(2217, 60, 30, 'Voluptates esse necessitatibus dolore pariatur.', '1563283860', 0, 1),
(2218, 157, 181, 'Nulla et nihil sed.', '1563283860', 1, 0),
(2222, 42, 76, 'Fuga quia ut.', '1563283860', 1, 0),
(2223, 41, 60, 'Illo qui sit expedita.', '1563283860', 0, 0),
(2224, 52, 166, 'Excepturi ut qui.', '1563283860', 1, 1),
(2226, 40, 180, 'Voluptates amet est et.', '1563283860', 0, 0),
(2227, 54, 156, 'Eaque.', '1563283860', 1, 1),
(2230, 101, 191, 'Autem.', '1563283860', 0, 1),
(2232, 165, 35, 'Asperiores nostrum dolores.', '1563283860', 1, 1),
(2237, 73, 178, 'Aut officia fugit neque adipisci.', '1563283860', 1, 1),
(2239, 16, 6, 'Aut rerum.', '1563283860', 0, 0),
(2240, 22, 198, 'Voluptatum quam autem.', '1563283860', 1, 0),
(2242, 69, 3, 'Et quis tempore vel.', '1563283860', 0, 1),
(2244, 55, 170, 'Molestiae quaerat alias molestiae.', '1563283860', 1, 1),
(2246, 179, 196, 'Omnis nesciunt consequatur.', '1563283860', 1, 1),
(2248, 195, 56, 'In dignissimos qui vel.', '1563283860', 0, 1),
(2252, 194, 84, 'Eum voluptate.', '1563283860', 1, 0),
(2253, 94, 196, 'Provident totam repudiandae dolorem blanditiis.', '1563283860', 1, 1),
(2254, 101, 94, 'Qui.', '1563283860', 0, 1),
(2255, 89, 52, 'Quisquam dolorem.', '1563283860', 1, 1),
(2256, 180, 95, 'Vel aut.', '1563283860', 1, 1),
(2257, 177, 40, 'Nihil eveniet.', '1563283860', 0, 1),
(2258, 33, 96, 'Et quos neque quasi.', '1563283860', 1, 1),
(2263, 26, 66, 'Accusamus incidunt.', '1563283860', 1, 0),
(2264, 36, 160, 'Rem.', '1563283860', 0, 0),
(2267, 12, 160, 'Aut soluta.', '1563283860', 0, 0),
(2268, 161, 70, 'Vel quod reprehenderit.', '1563283860', 0, 1),
(2270, 5, 63, 'Ut.', '1563283860', 1, 1),
(2272, 161, 165, 'Voluptates numquam.', '1563283860', 0, 0),
(2273, 2, 21, 'Aliquid.', '1563283860', 0, 0),
(2274, 13, 200, 'Eos non.', '1563283860', 1, 1),
(2277, 62, 157, 'Debitis.', '1563283860', 0, 0),
(2279, 158, 50, 'Qui rerum autem.', '1563283860', 1, 0),
(2282, 58, 70, 'Odio quia sunt quo.', '1563283860', 1, 1),
(2283, 6, 6, 'Quo.', '1563283860', 0, 0),
(2284, 169, 47, 'Corrupti aut provident.', '1563283860', 0, 0),
(2285, 80, 52, 'Et iste sit.', '1563283860', 1, 0),
(2286, 15, 7, 'Quas cumque.', '1563283860', 0, 0),
(2288, 24, 161, 'Alias ut eaque aut aut.', '1563283860', 0, 0),
(2289, 34, 193, 'Fugit cupiditate quia.', '1563283860', 1, 1),
(2291, 82, 91, 'Omnis expedita et qui eum.', '1563283861', 1, 0),
(2296, 183, 90, 'Voluptatem molestiae nostrum perspiciatis.', '1563283861', 0, 1),
(2298, 41, 29, 'Ipsa omnis qui cumque est.', '1563283861', 1, 1),
(2303, 156, 73, 'Consectetur ea.', '1563283861', 0, 0),
(2306, 62, 33, 'Consequatur veritatis veritatis id.', '1563283861', 1, 0),
(2311, 172, 170, 'Placeat rem.', '1563283861', 1, 0),
(2313, 198, 96, 'Ut error.', '1563283861', 1, 1),
(2315, 77, 189, 'Voluptatem qui.', '1563283861', 1, 1),
(2316, 200, 159, 'Tenetur qui.', '1563283861', 0, 1),
(2317, 56, 44, 'Odit sint.', '1563283861', 0, 1),
(2320, 2, 91, 'Omnis quis omnis sint.', '1563283861', 0, 1),
(2321, 195, 173, 'Et sit reiciendis odio.', '1563283861', 0, 1),
(2322, 94, 40, 'Necessitatibus nam.', '1563283861', 0, 0),
(2324, 21, 91, 'Aut repellat.', '1563283861', 1, 0),
(2328, 174, 192, 'Aliquid vel.', '1563283861', 0, 0),
(2331, 96, 199, 'Nobis et et.', '1563283861', 0, 1),
(2334, 83, 97, 'Ut laboriosam.', '1563283861', 0, 1),
(2335, 60, 19, 'Numquam dolorem aut.', '1563283861', 0, 0),
(2337, 181, 55, 'Sint quia sit.', '1563283861', 0, 0),
(2339, 181, 160, 'Illo quas incidunt est quae.', '1563283861', 0, 0),
(2340, 191, 17, 'Molestiae ut.', '1563283861', 1, 1),
(2341, 28, 69, 'Ut rerum.', '1563283861', 0, 1),
(2347, 32, 161, 'Dolor.', '1563283861', 0, 1),
(2352, 40, 194, 'Ducimus.', '1563283861', 0, 1),
(2355, 65, 71, 'Nobis.', '1563283861', 1, 1),
(2358, 103, 71, 'Culpa hic voluptatum.', '1563283861', 0, 0),
(2361, 42, 30, 'Sunt et eum modi.', '1563283861', 1, 0),
(2362, 60, 79, 'Necessitatibus hic.', '1563283861', 0, 1),
(2366, 15, 98, 'Explicabo impedit voluptate.', '1563283861', 0, 0),
(2367, 17, 85, 'Autem modi sit aut aliquam.', '1563283861', 1, 1),
(2368, 163, 53, 'Autem.', '1563283861', 0, 1),
(2369, 18, 196, 'Qui non.', '1563283861', 1, 1),
(2372, 35, 73, 'Ullam autem.', '1563283862', 1, 1),
(2374, 44, 17, 'Magnam eligendi repudiandae consectetur iure rerum.', '1563283862', 1, 1),
(2375, 91, 35, 'Architecto.', '1563283862', 1, 1),
(2379, 42, 2, 'Aut error.', '1563283862', 1, 0),
(2380, 72, 57, 'Illo dolor nisi et doloremque sit.', '1563283862', 0, 0),
(2382, 10, 77, 'Facilis unde.', '1563283862', 1, 0),
(2385, 81, 84, 'Ut quos.', '1563283862', 0, 1),
(2386, 194, 165, 'Tempora.', '1563283862', 0, 1),
(2388, 5, 168, 'Sapiente dolorem.', '1563283862', 1, 0),
(2390, 53, 11, 'Consequatur quae.', '1563283862', 0, 1),
(2392, 99, 22, 'Aliquid sit ut.', '1563283862', 0, 1),
(2394, 200, 203, 'Et sed vel.', '1563283862', 1, 0),
(2395, 171, 156, 'Exercitationem qui repudiandae.', '1563283862', 1, 0),
(2396, 21, 69, 'Sequi.', '1563283862', 1, 0),
(2398, 197, 201, 'Qui in.', '1563283862', 0, 1),
(2401, 13, 165, 'Ab vel.', '1563283862', 1, 0),
(2402, 95, 166, 'Iusto qui.', '1563283862', 1, 0),
(2403, 157, 62, 'Magni assumenda amet.', '1563283862', 1, 0),
(2404, 14, 84, 'Pariatur voluptatem.', '1563283862', 1, 0),
(2405, 11, 20, 'Corporis architecto velit in.', '1563283862', 1, 0),
(2406, 37, 21, 'Sapiente distinctio dolorum voluptas velit.', '1563283862', 0, 1),
(2407, 178, 42, 'In ipsam iure quasi.', '1563283862', 0, 1),
(2408, 76, 35, 'Aut voluptatem voluptatem qui.', '1563283862', 1, 1),
(2409, 65, 67, 'Alias dolor enim.', '1563283862', 1, 0),
(2410, 84, 9, 'Voluptates reprehenderit.', '1563283862', 1, 1),
(2411, 87, 28, 'Iure id perferendis quibusdam.', '1563283862', 1, 0),
(2412, 61, 181, 'Enim libero maxime.', '1563283862', 1, 1),
(2413, 36, 33, 'Aperiam fuga consequatur.', '1563283862', 1, 0),
(2415, 13, 81, 'Commodi sint rerum qui atque rem.', '1563283862', 0, 1),
(2416, 176, 25, 'Ut maiores nihil.', '1563283862', 0, 0),
(2417, 44, 96, 'At ducimus aliquid expedita id voluptatem.', '1563283862', 1, 0),
(2419, 192, 79, 'Nihil.', '1563283862', 0, 0),
(2420, 98, 175, 'Repudiandae ipsam.', '1563283862', 1, 1),
(2422, 35, 76, 'At earum.', '1563283862', 1, 1),
(2424, 38, 96, 'Aperiam eum.', '1563283862', 0, 0),
(2426, 178, 173, 'Quisquam debitis.', '1563283862', 0, 1),
(2427, 19, 166, 'Delectus non autem est.', '1563283862', 1, 0),
(2430, 60, 82, 'Nesciunt.', '1563283862', 0, 1),
(2431, 179, 6, 'Possimus ut.', '1563283862', 1, 1),
(2433, 193, 168, 'At et.', '1563283862', 1, 0),
(2436, 30, 53, 'Quia laborum nesciunt.', '1563283862', 0, 1),
(2437, 31, 190, 'Tempora iusto reiciendis.', '1563283862', 1, 1),
(2438, 65, 27, 'Quia consequuntur officia vel consequatur.', '1563283862', 1, 0),
(2439, 46, 158, 'Voluptate.', '1563283862', 1, 0),
(2441, 180, 81, 'Maiores perspiciatis dolorem.', '1563283862', 1, 1),
(2442, 47, 11, 'Minima cupiditate facilis sapiente.', '1563283862', 0, 0),
(2444, 66, 68, 'Commodi dolore nemo.', '1563283862', 1, 1),
(2449, 45, 67, 'Minus autem iure.', '1563283862', 1, 0),
(2450, 54, 192, 'Rerum voluptatum voluptatum.', '1563283862', 1, 1),
(2454, 189, 8, 'Eius sit sed.', '1563283862', 1, 0),
(2455, 59, 32, 'Ullam sunt in.', '1563283862', 0, 0),
(2458, 170, 42, 'Sapiente tempora.', '1563283862', 1, 0),
(2460, 73, 51, 'Aut nihil.', '1563283863', 1, 0),
(2462, 10, 9, 'Et quos inventore nostrum.', '1563283863', 0, 0),
(2463, 200, 19, 'Corporis quia.', '1563283863', 1, 1),
(2466, 189, 163, 'Nihil excepturi est.', '1563283863', 0, 1),
(2468, 163, 64, 'Qui illum.', '1563283863', 1, 0),
(2469, 56, 25, 'Neque et dolorem non repellendus.', '1563283863', 0, 0),
(2472, 67, 76, 'Quam.', '1563283863', 1, 1),
(2474, 60, 99, 'Voluptates non.', '1563283863', 1, 0),
(2475, 47, 158, 'Voluptatibus nesciunt tenetur.', '1563283863', 1, 0),
(2477, 7, 79, 'Quibusdam maiores sed maiores sit dignissimos.', '1563283863', 0, 0),
(2478, 6, 191, 'Asperiores voluptas aut dolorum quisquam voluptas.', '1563283863', 1, 0),
(2485, 88, 15, 'Illum qui.', '1563283863', 1, 0),
(2486, 196, 91, 'Id quia.', '1563283863', 1, 0),
(2491, 90, 16, 'Aliquam praesentium.', '1563283863', 1, 1),
(2494, 55, 24, 'Incidunt a quia quae.', '1563283863', 0, 0),
(2496, 64, 76, 'Et.', '1563283863', 0, 0),
(2497, 40, 62, 'Laudantium.', '1563283863', 1, 1),
(2498, 47, 58, 'Voluptates corporis voluptatem.', '1563283863', 1, 1),
(2499, 85, 7, 'Nulla recusandae vel est.', '1563283863', 1, 1),
(2501, 104, 11, 'Nemo libero consequuntur neque.', '1563283863', 1, 1),
(2502, 200, 162, 'Facilis vel.', '1563283863', 0, 1),
(2503, 162, 12, 'Sit dolores quaerat.', '1563283863', 0, 0),
(2505, 3, 20, 'Veritatis aspernatur doloribus.', '1563283863', 1, 0),
(2506, 87, 96, 'Quisquam nisi atque cupiditate sed aut.', '1563283863', 1, 0),
(2507, 89, 82, 'Illo esse at.', '1563283863', 0, 0),
(2508, 32, 56, 'Est nobis earum.', '1563283863', 0, 1),
(2510, 16, 16, 'Assumenda et corporis quidem reprehenderit mollitia.', '1563283863', 0, 0),
(2512, 163, 176, 'Et distinctio.', '1563283863', 1, 0),
(2513, 52, 38, 'Sint distinctio rerum consequatur.', '1563283863', 1, 0),
(2514, 53, 179, 'Vero doloremque nesciunt quia.', '1563283863', 1, 1),
(2515, 70, 49, 'Est.', '1563283863', 0, 0),
(2519, 1, 191, 'Voluptas in autem qui voluptas eveniet.', '1563283863', 1, 1),
(2520, 16, 72, 'Quae atque necessitatibus.', '1563283863', 1, 0),
(2521, 27, 27, 'Vel odit officia voluptatum.', '1563283863', 1, 0),
(2522, 28, 159, 'Exercitationem et voluptas.', '1563283863', 1, 1),
(2523, 6, 78, 'Quia quo consequatur.', '1563283863', 1, 0),
(2525, 37, 68, 'Molestiae aliquid tempora omnis molestiae.', '1563283863', 0, 1),
(2526, 178, 80, 'Consectetur saepe ut.', '1563283863', 0, 1),
(2527, 18, 97, 'Et vel.', '1563283863', 0, 0),
(2530, 43, 184, 'Id consequatur et.', '1563283863', 1, 1),
(2531, 181, 75, 'Ullam corporis.', '1563283863', 1, 1),
(2532, 4, 22, 'Fugit.', '1563283863', 0, 1),
(2534, 73, 96, 'Molestiae sunt.', '1563283863', 1, 0),
(2535, 48, 84, 'Sint sed.', '1563283863', 1, 0),
(2538, 73, 62, 'Magni assumenda tenetur et dolorem.', '1563283863', 1, 0),
(2541, 76, 49, 'Adipisci est non dolores.', '1563283863', 0, 1),
(2542, 67, 22, 'Nihil exercitationem repellat maiores.', '1563283863', 1, 1),
(2545, 186, 44, 'Quasi dolores officia magni.', '1563283864', 1, 0),
(2546, 89, 20, 'Nemo quo enim expedita.', '1563283864', 1, 0),
(2548, 201, 67, 'Unde at occaecati aliquam.', '1563283864', 0, 0),
(2549, 81, 68, 'Est et qui.', '1563283864', 0, 1),
(2551, 21, 179, 'Quas ipsa voluptatem.', '1563283864', 0, 1),
(2554, 24, 48, 'Voluptatem eligendi quas.', '1563283864', 1, 1),
(2560, 88, 37, 'Quisquam minus sit.', '1563283864', 1, 1),
(2561, 45, 27, 'Culpa ea earum.', '1563283864', 1, 1),
(2562, 181, 40, 'Temporibus maiores tempore.', '1563283864', 0, 0),
(2565, 70, 12, 'Vero sit perspiciatis.', '1563283864', 0, 0),
(2570, 36, 194, 'Et laboriosam vel.', '1563283864', 1, 1),
(2571, 186, 71, 'Aspernatur quis id quis ipsa.', '1563283864', 1, 0),
(2573, 12, 74, 'Amet voluptate sit.', '1563283864', 1, 1),
(2576, 196, 43, 'Et ut.', '1563283864', 1, 0),
(2577, 23, 86, 'Ut deserunt est.', '1563283864', 0, 0),
(2580, 67, 195, 'Voluptas enim odit molestiae ut.', '1563283864', 1, 0),
(2581, 25, 193, 'Ullam explicabo.', '1563283864', 1, 1),
(2583, 14, 64, 'Accusantium repellendus enim.', '1563283864', 1, 0),
(2584, 57, 203, 'Temporibus quisquam.', '1563283864', 0, 1),
(2586, 39, 17, 'Dolores ut.', '1563283864', 1, 0),
(2587, 86, 104, 'Voluptas occaecati quia.', '1563283864', 0, 0),
(2589, 39, 172, 'Quo.', '1563283864', 0, 0),
(2591, 102, 188, 'Distinctio non quia.', '1563283864', 1, 1),
(2592, 162, 67, 'Deserunt exercitationem laboriosam.', '1563283864', 1, 0),
(2593, 1, 61, 'Animi eius dolor autem dolores ea.', '1563283864', 1, 0),
(2594, 96, 37, 'Ad atque officiis.', '1563283864', 0, 1),
(2596, 158, 174, 'Commodi aliquid modi quidem.', '1563283864', 0, 1),
(2599, 52, 71, 'Unde et quis incidunt eum.', '1563283864', 1, 0),
(2600, 190, 10, 'Sequi vel ex fugit.', '1563283864', 1, 1),
(2601, 181, 156, 'Culpa fuga consectetur.', '1563283864', 0, 0),
(2602, 56, 190, 'Nihil ea et.', '1563283864', 0, 0),
(2603, 17, 6, 'Facere et nihil.', '1563283864', 0, 1),
(2606, 5, 65, 'Veritatis illo illo.', '1563283864', 1, 0),
(2607, 180, 94, 'Ducimus dolores quia.', '1563283864', 0, 1),
(2609, 163, 169, 'Nobis.', '1563283864', 0, 1),
(2610, 195, 103, 'Asperiores quod.', '1563283864', 0, 1),
(2612, 24, 27, 'Aut.', '1563283864', 0, 0),
(2614, 66, 1, 'Est accusamus quae sit.', '1563283864', 0, 0),
(2616, 160, 178, 'Illum iusto sunt ut.', '1563283864', 0, 1),
(2617, 83, 85, 'Quisquam enim officiis aut.', '1563283864', 1, 0),
(2618, 157, 57, 'Autem totam quod molestiae.', '1563283864', 0, 0),
(2619, 61, 48, 'Minus modi voluptatem nulla exercitationem.', '1563283864', 0, 0),
(2620, 36, 35, 'Nobis dicta inventore.', '1563283864', 0, 0),
(2621, 45, 99, 'Eum dicta aperiam quia praesentium assumenda.', '1563283864', 1, 1),
(2624, 90, 46, 'Omnis rerum.', '1563283864', 1, 1),
(2626, 188, 78, 'Ut sed omnis.', '1563283864', 0, 1),
(2629, 89, 168, 'Qui aut qui.', '1563283864', 0, 1),
(2631, 158, 50, 'Laborum aut.', '1563283864', 1, 1),
(2632, 82, 69, 'Nostrum commodi.', '1563283864', 0, 0),
(2633, 176, 69, 'Velit molestiae rerum dolores quibusdam vitae.', '1563283864', 1, 0),
(2634, 101, 160, 'Deleniti sit quia.', '1563283864', 1, 0),
(2635, 187, 170, 'Est voluptatibus.', '1563283864', 0, 0),
(2637, 193, 101, 'Et molestias.', '1563283864', 0, 0),
(2638, 163, 43, 'Nihil aperiam id aut.', '1563283864', 1, 0),
(2639, 97, 100, 'Sit.', '1563283864', 1, 0),
(2640, 103, 72, 'Molestiae officiis ullam.', '1563283864', 1, 0),
(2641, 3, 190, 'Aut excepturi perferendis quasi.', '1563283864', 0, 0),
(2642, 15, 181, 'Amet iure quasi.', '1563283864', 1, 0),
(2643, 178, 87, 'Voluptas voluptates delectus enim perferendis asperiores.', '1563283864', 0, 1),
(2644, 57, 35, 'Officia id unde iste.', '1563283864', 1, 1),
(2647, 174, 87, 'Fugiat libero totam.', '1563283864', 1, 0),
(2648, 58, 78, 'Iste autem autem ad.', '1563283864', 1, 0),
(2650, 67, 91, 'Reiciendis commodi nulla.', '1563283864', 1, 0),
(2651, 182, 23, 'Qui alias.', '1563283864', 1, 0),
(2652, 187, 54, 'Quo.', '1563283864', 0, 1),
(2653, 76, 187, 'Porro ab.', '1563283864', 1, 0),
(2654, 96, 7, 'Ipsam ut.', '1563283864', 1, 1),
(2661, 41, 25, 'Rerum laboriosam delectus quis.', '1563283864', 0, 0),
(2662, 77, 169, 'Aut atque est iusto.', '1563283864', 1, 1),
(2663, 56, 12, 'Et assumenda et.', '1563283865', 1, 1),
(2664, 192, 163, 'Assumenda magnam similique dolor harum voluptate.', '1563283865', 1, 1),
(2665, 78, 66, 'Ut corporis consequatur.', '1563283865', 1, 1),
(2666, 94, 160, 'Et ut.', '1563283865', 1, 0),
(2668, 10, 180, 'Nihil vel.', '1563283865', 0, 1),
(2669, 178, 37, 'Molestiae magni.', '1563283865', 1, 1),
(2670, 197, 172, 'Odit maxime.', '1563283865', 0, 0),
(2676, 95, 166, 'Temporibus aut.', '1563283865', 1, 0),
(2680, 195, 13, 'Accusamus eum quo.', '1563283865', 0, 1),
(2681, 197, 65, 'Velit in assumenda et et.', '1563283865', 0, 0),
(2682, 70, 79, 'Asperiores consequatur ipsam quidem.', '1563283865', 0, 0),
(2685, 35, 183, 'In voluptate.', '1563283865', 0, 0),
(2686, 168, 184, 'Aliquam dolores est blanditiis.', '1563283865', 0, 0),
(2690, 42, 45, 'Quo.', '1563283865', 0, 1),
(2691, 38, 7, 'Delectus voluptas ducimus officia et.', '1563283865', 1, 0),
(2695, 56, 102, 'Aut.', '1563283865', 1, 0),
(2697, 14, 36, 'Similique nulla sunt.', '1563283865', 0, 0),
(2701, 171, 180, 'Et adipisci explicabo.', '1563283865', 1, 0),
(2702, 70, 71, 'Cum consequatur.', '1563283865', 1, 0),
(2703, 74, 57, 'Voluptates.', '1563283865', 0, 0),
(2704, 194, 101, 'Doloribus reiciendis eos laborum.', '1563283865', 1, 0),
(2705, 79, 51, 'Illum labore.', '1563283865', 0, 0),
(2706, 38, 78, 'Rerum aliquid consectetur.', '1563283865', 0, 0),
(2707, 20, 184, 'Eum quibusdam eum.', '1563283865', 0, 0),
(2708, 54, 21, 'Assumenda omnis ducimus.', '1563283865', 1, 0),
(2709, 103, 169, 'Provident necessitatibus commodi quisquam.', '1563283865', 1, 1),
(2710, 162, 9, 'In.', '1563283865', 0, 0),
(2711, 62, 166, 'Asperiores eveniet dolorem.', '1563283865', 0, 0),
(2712, 71, 75, 'Architecto rerum iure.', '1563283865', 0, 1),
(2713, 48, 189, 'Quia non mollitia nobis.', '1563283865', 0, 0),
(2714, 170, 37, 'Reiciendis et earum est.', '1563283865', 1, 0),
(2715, 98, 177, 'Et ut quis.', '1563283865', 1, 0),
(2724, 196, 60, 'Repellat qui quibusdam rerum voluptates.', '1563283865', 1, 1),
(2725, 185, 194, 'Quasi voluptatum.', '1563283865', 0, 0),
(2726, 53, 11, 'Numquam assumenda.', '1563283865', 1, 1),
(2734, 73, 187, 'Voluptas est.', '1563283865', 1, 1),
(2735, 40, 67, 'Iste et voluptatum.', '1563283865', 1, 0),
(2736, 46, 104, 'Iure aut at distinctio iste.', '1563283865', 1, 1),
(2737, 173, 191, 'Omnis.', '1563283865', 0, 0),
(2740, 78, 27, 'Quis rerum quae.', '1563283865', 0, 1),
(2741, 43, 167, 'Ut sint et.', '1563283865', 1, 1),
(2742, 65, 49, 'Ipsa sed enim.', '1563283865', 0, 0),
(2743, 198, 167, 'Sunt ad eum aperiam adipisci.', '1563283865', 1, 1),
(2745, 81, 63, 'Cupiditate est in nemo.', '1563283865', 1, 1),
(2747, 92, 165, 'Quam est repellendus possimus non.', '1563283865', 0, 0),
(2751, 88, 75, 'Occaecati consequuntur.', '1563283865', 0, 1),
(2752, 74, 58, 'Molestias omnis quisquam repellendus.', '1563283865', 0, 0),
(2753, 49, 11, 'Ut ipsam autem et doloremque.', '1563283865', 0, 1),
(2755, 7, 162, 'Et iusto dolor.', '1563283865', 0, 1),
(2757, 179, 202, 'Quo sunt dolorum est ab.', '1563283865', 0, 1),
(2758, 176, 84, 'Non ut neque et.', '1563283865', 1, 0),
(2759, 72, 190, 'Quia dolore.', '1563283865', 0, 0),
(2761, 79, 7, 'Aut molestiae alias.', '1563283865', 1, 1),
(2763, 14, 198, 'Autem cumque commodi.', '1563283865', 1, 0),
(2764, 189, 104, 'Ipsum et eaque hic.', '1563283865', 0, 1),
(2765, 17, 10, 'Corporis.', '1563283865', 1, 0),
(2766, 174, 27, 'Et.', '1563283865', 1, 1),
(2768, 77, 156, 'Ut enim ipsum.', '1563283865', 0, 0),
(2771, 94, 54, 'Aliquam consequatur beatae.', '1563283865', 1, 0),
(2774, 53, 183, 'Consequatur illo veniam saepe.', '1563283865', 0, 0),
(2776, 95, 8, 'Inventore ea cum non.', '1563283865', 0, 1),
(2779, 168, 79, 'Ratione mollitia saepe deserunt.', '1563283865', 0, 0),
(2783, 201, 184, 'Sed maxime.', '1563283865', 1, 1),
(2785, 160, 195, 'Commodi et nesciunt.', '1563283865', 0, 0),
(2787, 64, 159, 'Dignissimos reiciendis voluptatem.', '1563283865', 0, 1),
(2791, 48, 197, 'Et et exercitationem.', '1563283865', 0, 1),
(2792, 44, 187, 'Explicabo quo.', '1563283865', 1, 1),
(2793, 11, 177, 'Tempore.', '1563283865', 0, 0),
(2794, 82, 194, 'Est.', '1563283865', 0, 0),
(2796, 23, 158, 'Quaerat amet sunt mollitia nulla.', '1563283865', 1, 1),
(2797, 30, 10, 'Qui rerum dicta voluptatem.', '1563283865', 0, 1),
(2798, 59, 185, 'Omnis enim omnis.', '1563283866', 1, 0),
(2802, 95, 177, 'Quia labore.', '1563283866', 0, 0),
(2803, 185, 190, 'Numquam adipisci ullam velit iure autem.', '1563283866', 1, 1),
(2804, 84, 198, 'Alias magnam quo.', '1563283866', 1, 0),
(2807, 89, 169, 'Natus est.', '1563283866', 1, 1),
(2810, 92, 200, 'Omnis quisquam.', '1563283866', 1, 1),
(2811, 19, 86, 'Blanditiis sit sint quos deserunt.', '1563283866', 1, 1),
(2812, 77, 185, 'Dolores tempore.', '1563283866', 1, 1),
(2816, 11, 87, 'Et voluptate ut molestias voluptas.', '1563283866', 0, 0),
(2821, 20, 31, 'Quisquam beatae in.', '1563283866', 1, 0),
(2824, 12, 199, 'Quia nisi optio.', '1563283866', 0, 1),
(2826, 86, 13, 'Cupiditate adipisci.', '1563283866', 0, 0),
(2827, 1, 79, 'Dignissimos dolorem ratione.', '1563283866', 0, 1),
(2829, 74, 159, 'Doloremque voluptatem doloremque.', '1563283866', 1, 1),
(2830, 191, 4, 'Placeat nihil.', '1563283866', 1, 1),
(2831, 5, 91, 'Pariatur nam et enim.', '1563283866', 1, 0),
(2832, 189, 193, 'Quaerat vitae omnis.', '1563283866', 0, 1),
(2833, 78, 194, 'Nesciunt non ex.', '1563283866', 1, 0),
(2835, 85, 80, 'Molestiae vero architecto.', '1563283866', 0, 0),
(2837, 180, 49, 'Tempore.', '1563283866', 0, 1),
(2838, 194, 22, 'Sint quam mollitia.', '1563283866', 1, 1),
(2839, 26, 91, 'Voluptatem adipisci ut.', '1563283866', 0, 1),
(2840, 34, 56, 'Nisi dolorum laborum.', '1563283866', 1, 1),
(2841, 60, 190, 'Ut voluptas repellat quam.', '1563283866', 1, 1),
(2842, 61, 192, 'Sunt distinctio.', '1563283866', 1, 0),
(2845, 82, 200, 'Consequuntur amet.', '1563283866', 1, 1),
(2846, 97, 45, 'Tempore impedit inventore.', '1563283866', 0, 1),
(2850, 174, 188, 'Perferendis consequatur ut ut.', '1563283866', 1, 0),
(2851, 17, 67, 'Vero ut tenetur.', '1563283866', 1, 0),
(2854, 177, 82, 'Reiciendis nisi pariatur et.', '1563283866', 0, 1),
(2856, 90, 17, 'Animi quia est beatae.', '1563283866', 1, 0),
(2857, 161, 85, 'Pariatur numquam occaecati.', '1563283866', 0, 1),
(2858, 15, 93, 'Commodi ex non minus.', '1563283866', 1, 0),
(2859, 176, 91, 'Iure quisquam excepturi fugit.', '1563283866', 1, 1),
(2863, 88, 197, 'Consequuntur nulla et rerum magni occaecati.', '1563283866', 0, 0),
(2864, 163, 36, 'Dolorum et explicabo.', '1563283866', 0, 0),
(2866, 10, 26, 'Sed ea sequi.', '1563283866', 1, 1),
(2867, 177, 196, 'Non id velit.', '1563283866', 1, 0),
(2868, 60, 14, 'Nisi sit alias.', '1563283866', 1, 0),
(2869, 21, 72, 'Non aut harum voluptatum maxime.', '1563283866', 1, 0),
(2871, 31, 162, 'Ut sed.', '1563283866', 1, 1),
(2872, 60, 57, 'Magnam cupiditate unde.', '1563283866', 1, 0),
(2874, 184, 83, 'Cupiditate quos.', '1563283866', 0, 1),
(2875, 199, 193, 'Ratione aut cum et.', '1563283866', 1, 0),
(2877, 50, 9, 'Dolorem vel.', '1563283866', 0, 1),
(2879, 47, 168, 'Corporis laborum dolor expedita.', '1563283866', 0, 0),
(2883, 86, 200, 'Dolores facere facilis.', '1563283866', 0, 0),
(2884, 168, 179, 'Atque et labore.', '1563283866', 0, 1),
(2886, 68, 186, 'Rerum et eos eum et maiores.', '1563283866', 1, 1),
(2890, 103, 16, 'Non voluptatem voluptates.', '1563283866', 1, 0),
(2891, 182, 74, 'Optio velit similique asperiores.', '1563283866', 0, 0),
(2892, 160, 170, 'Animi aperiam recusandae laudantium.', '1563283866', 0, 0),
(2893, 156, 161, 'Nemo dolores sed et ut.', '1563283866', 0, 1),
(2895, 82, 167, 'Necessitatibus odit.', '1563283866', 1, 0),
(2896, 44, 22, 'Qui voluptatibus eaque delectus.', '1563283866', 0, 1),
(2897, 199, 197, 'Labore quod.', '1563283866', 1, 1),
(2898, 44, 178, 'Sapiente.', '1563283866', 0, 1),
(2899, 13, 90, 'Et qui non.', '1563283867', 1, 1),
(2901, 79, 77, 'Iure.', '1563283867', 0, 1),
(2902, 94, 180, 'Quis.', '1563283867', 0, 0),
(2904, 47, 7, 'Quis aliquid odit ea rerum.', '1563283867', 0, 1),
(2906, 10, 5, 'Saepe sit aperiam qui.', '1563283867', 0, 0),
(2907, 75, 39, 'Qui ab et dolor.', '1563283867', 0, 0),
(2908, 166, 90, 'Est eos nihil dolores reiciendis.', '1563283867', 1, 0),
(2913, 158, 57, 'Et fuga enim iusto.', '1563283867', 0, 1),
(2914, 186, 74, 'Ut et.', '1563283867', 1, 0),
(2915, 191, 74, 'Aliquid dolores accusamus.', '1563283867', 0, 1),
(2916, 39, 190, 'Laudantium atque earum ratione.', '1563283867', 1, 1),
(2917, 159, 31, 'Facilis commodi non.', '1563283867', 0, 0),
(2918, 187, 170, 'Nihil amet.', '1563283867', 1, 0),
(2919, 26, 104, 'Sit est quam.', '1563283867', 0, 1),
(2920, 162, 18, 'Quisquam accusamus.', '1563283867', 1, 0),
(2923, 75, 98, 'Ad.', '1563283867', 1, 0),
(2924, 177, 33, 'Officiis vel.', '1563283867', 0, 1),
(2925, 28, 170, 'Maxime qui.', '1563283867', 0, 1),
(2927, 28, 99, 'Quia aut harum.', '1563283867', 1, 1),
(2931, 91, 7, 'Non fugit veritatis.', '1563283867', 0, 1),
(2932, 68, 75, 'Amet odit harum.', '1563283867', 1, 1),
(2933, 91, 197, 'Ex laborum aliquid molestiae modi.', '1563283867', 1, 1),
(2938, 173, 193, 'Aperiam.', '1563283867', 0, 0),
(2940, 158, 164, 'Sint asperiores similique quo nulla eos.', '1563283867', 1, 0),
(2942, 12, 33, 'Quia itaque sequi.', '1563283867', 0, 1),
(2943, 16, 54, 'Id expedita veniam.', '1563283867', 1, 0),
(2944, 6, 180, 'Alias debitis incidunt velit beatae.', '1563283867', 0, 1),
(2945, 10, 22, 'Vel voluptatem quas.', '1563283867', 0, 1),
(2946, 62, 18, 'Et debitis dolorem.', '1563283867', 0, 1),
(2947, 160, 88, 'Sit aspernatur.', '1563283867', 0, 0),
(2948, 63, 176, 'Rem repudiandae impedit est.', '1563283867', 1, 1),
(2949, 3, 102, 'Reiciendis veritatis qui possimus.', '1563283867', 1, 1),
(2951, 87, 3, 'Dolores in.', '1563283867', 0, 0),
(2952, 58, 59, 'Quo facere.', '1563283867', 0, 0),
(2953, 171, 23, 'Amet illum vero.', '1563283867', 1, 1),
(2955, 70, 18, 'Aut nesciunt.', '1563283867', 1, 1),
(2956, 41, 83, 'Non maxime eos.', '1563283867', 1, 1),
(2958, 63, 41, 'Dicta consequuntur et.', '1563283867', 1, 1),
(2962, 4, 64, 'Quidem non non.', '1563283867', 0, 0),
(2965, 91, 195, 'Ut.', '1563283867', 0, 0),
(2966, 200, 194, 'Aut est.', '1563283867', 1, 0),
(2967, 85, 34, 'Repudiandae vel.', '1563283867', 1, 1),
(2970, 43, 30, 'Tenetur quibusdam quis.', '1563283867', 0, 0),
(2972, 168, 162, 'Quis cupiditate nobis.', '1563283867', 1, 0),
(2973, 61, 194, 'Et iure voluptatem.', '1563283867', 0, 1),
(2974, 196, 99, 'Ipsa beatae unde.', '1563283867', 0, 1),
(2975, 94, 86, 'Vero illum natus.', '1563283867', 1, 0),
(2980, 188, 44, 'Debitis repellendus sit aperiam.', '1563283868', 0, 0),
(2981, 37, 96, 'Cum minus in.', '1563283868', 1, 1),
(2983, 6, 187, 'At.', '1563283868', 0, 1),
(2987, 158, 68, 'Est aut odio autem molestias.', '1563283868', 1, 0),
(2990, 50, 190, 'Amet voluptatem aut.', '1563283868', 1, 0),
(2991, 160, 61, 'Sit nisi sint.', '1563283868', 1, 0),
(2994, 100, 34, 'Ut et.', '1563283868', 0, 0),
(2995, 24, 172, 'Doloremque officia.', '1563283868', 1, 1),
(2997, 82, 6, 'Sunt quis.', '1563283868', 1, 1),
(2998, 26, 8, 'Et ut inventore consequuntur maxime consequuntur.', '1563283868', 1, 1),
(3001, 161, 184, 'Autem nam.', '1563283868', 0, 0),
(3003, 180, 163, 'Assumenda ab quibusdam doloribus.', '1563283868', 1, 1),
(3004, 164, 54, 'Expedita architecto quia.', '1563283868', 0, 0),
(3008, 24, 19, 'Et omnis.', '1563283868', 0, 0),
(3009, 185, 172, 'Quia.', '1563283868', 0, 1),
(3010, 99, 8, 'Magnam sunt dolorem aliquid.', '1563283868', 0, 0),
(3011, 191, 39, 'Modi sit minima.', '1563283868', 0, 1),
(3012, 69, 81, 'Dolorem laudantium sit sed sit.', '1563283868', 1, 1),
(3013, 91, 7, 'Voluptas reprehenderit quia incidunt nam.', '1563283868', 0, 0),
(3016, 19, 56, 'Modi ratione.', '1563283868', 0, 1),
(3017, 37, 25, 'Ut beatae aut.', '1563283868', 0, 0),
(3018, 29, 75, 'Accusantium voluptate.', '1563283868', 1, 1),
(3020, 200, 90, 'Tempora vel earum.', '1563283868', 0, 0),
(3022, 164, 55, 'Magni qui natus.', '1563283868', 0, 0),
(3024, 16, 199, 'Cum.', '1563283868', 1, 1),
(3025, 191, 189, 'Ratione in.', '1563283868', 0, 0),
(3027, 96, 162, 'Est sunt animi.', '1563283868', 1, 1),
(3028, 43, 201, 'Cum iure a.', '1563283868', 0, 1),
(3029, 160, 45, 'Quis sint fuga.', '1563283868', 0, 1),
(3030, 46, 158, 'Iusto deserunt.', '1563283868', 0, 1),
(3031, 30, 41, 'Veritatis.', '1563283868', 1, 1),
(3032, 39, 181, 'Quisquam deleniti porro sed.', '1563283868', 0, 0),
(3033, 189, 88, 'Aut accusantium.', '1563283868', 0, 1),
(3035, 38, 183, 'Natus nemo totam aut corporis corporis.', '1563283868', 0, 1),
(3037, 29, 34, 'Assumenda quia iure velit.', '1563283868', 0, 1),
(3038, 47, 192, 'Velit molestias atque quia nulla.', '1563283868', 0, 0),
(3039, 189, 33, 'Dolores eum placeat.', '1563283868', 0, 1),
(3042, 35, 36, 'Quas et voluptatem.', '1563283868', 0, 0),
(3044, 194, 65, 'Dolor odio.', '1563283868', 1, 1),
(3045, 90, 9, 'Non et.', '1563283868', 1, 0),
(3046, 79, 195, 'Quia esse.', '1563283868', 1, 1),
(3050, 91, 186, 'Optio neque a.', '1563283868', 1, 0),
(3052, 75, 92, 'Consequatur nihil dignissimos.', '1563283868', 1, 1),
(3053, 90, 193, 'Quaerat voluptatum voluptatem provident.', '1563283868', 1, 0),
(3054, 10, 103, 'Esse.', '1563283868', 1, 0),
(3055, 69, 187, 'Quia in voluptatem.', '1563283868', 1, 1),
(3056, 104, 99, 'Voluptatem.', '1563283868', 0, 1),
(3057, 27, 3, 'Itaque nam minus.', '1563283868', 0, 0),
(3058, 64, 83, 'Non fugit.', '1563283868', 1, 0),
(3061, 193, 39, 'Soluta consequatur.', '1563283868', 1, 0),
(3062, 49, 73, 'Quam in quia dignissimos.', '1563283868', 1, 1),
(3063, 41, 194, 'Expedita suscipit excepturi.', '1563283868', 1, 0),
(3066, 157, 182, 'Quia eligendi.', '1563283869', 1, 0),
(3067, 73, 15, 'Et ab veniam itaque.', '1563283869', 0, 0),
(3068, 180, 165, 'Esse dignissimos omnis.', '1563283869', 0, 0),
(3069, 98, 169, 'Cum cupiditate.', '1563283869', 0, 1),
(3070, 43, 95, 'Eius dolorem sint iure possimus a.', '1563283869', 0, 1),
(3071, 23, 104, 'Pariatur voluptas nostrum.', '1563283869', 0, 1),
(3072, 202, 49, 'Aut.', '1563283869', 0, 1);
INSERT INTO `messages_list` (`id`, `userId`, `toId`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`) VALUES
(3073, 89, 29, 'Aut modi nisi.', '1563283869', 1, 1),
(3075, 59, 90, 'Nobis dolorum repudiandae non.', '1563283869', 0, 1),
(3076, 158, 166, 'Vel officiis.', '1563283869', 1, 0),
(3077, 20, 51, 'Voluptatem id a natus.', '1563283869', 1, 0),
(3078, 191, 68, 'Cum ea error atque non.', '1563283869', 0, 1),
(3080, 78, 174, 'Qui commodi dolor.', '1563283869', 1, 1),
(3081, 16, 161, 'Distinctio suscipit debitis.', '1563283869', 1, 1),
(3083, 37, 158, 'Unde aut aliquid.', '1563283869', 1, 1),
(3086, 160, 194, 'Facilis et architecto.', '1563283869', 0, 1),
(3087, 192, 38, 'Cumque.', '1563283869', 1, 0),
(3088, 80, 92, 'Quaerat officia nesciunt adipisci repudiandae.', '1563283869', 1, 0),
(3090, 40, 94, 'Illum.', '1563283869', 0, 0),
(3092, 48, 50, 'Est iusto.', '1563283869', 0, 1),
(3094, 14, 7, 'Ipsa tenetur rerum quibusdam sint.', '1563283869', 1, 1),
(3095, 45, 174, 'Praesentium sunt vel qui dolorem sapiente.', '1563283869', 0, 0),
(3097, 183, 75, 'Quia eum commodi aut.', '1563283869', 1, 0),
(3099, 175, 180, 'Tenetur quidem optio vel.', '1563283869', 1, 0),
(3100, 29, 170, 'Aut repudiandae aliquam.', '1563283869', 1, 1),
(3102, 56, 62, 'Fugit fugit quos autem.', '1563283869', 0, 0),
(3103, 158, 38, 'Atque.', '1563283869', 0, 0),
(3105, 185, 193, 'Nulla ipsa commodi.', '1563283869', 1, 0),
(3108, 7, 189, 'Ut culpa.', '1563283869', 0, 1),
(3113, 191, 41, 'Sapiente modi enim est.', '1563283869', 0, 1),
(3117, 43, 92, 'Aut cupiditate aut.', '1563283869', 1, 0),
(3118, 168, 184, 'Ut incidunt.', '1563283869', 1, 0),
(3119, 169, 160, 'Veniam occaecati.', '1563283869', 1, 1),
(3121, 163, 6, 'Et odio.', '1563283869', 0, 1),
(3122, 54, 94, 'Accusamus voluptas voluptatem aut nulla.', '1563283869', 0, 0),
(3123, 8, 76, 'Adipisci culpa earum.', '1563283869', 1, 0),
(3125, 169, 8, 'Aut.', '1563283869', 1, 0),
(3127, 27, 189, 'Accusamus dolor molestiae.', '1563283869', 0, 1),
(3128, 62, 34, 'Culpa voluptates laudantium ipsum non.', '1563283869', 0, 1),
(3129, 186, 75, 'Eum animi.', '1563283869', 1, 1),
(3132, 66, 164, 'Voluptas qui non dolor laudantium.', '1563283869', 1, 1),
(3133, 41, 81, 'Quidem fugit nemo.', '1563283869', 1, 0),
(3139, 169, 185, 'Autem sit nostrum est.', '1563283870', 0, 0),
(3140, 16, 93, 'Itaque architecto.', '1563283870', 1, 1),
(3141, 60, 97, 'Sint.', '1563283870', 1, 0),
(3142, 99, 102, 'Totam in sint.', '1563283870', 1, 0),
(3146, 29, 183, 'Porro sit eius sed.', '1563283870', 1, 0),
(3148, 60, 175, 'Voluptate molestias sint.', '1563283870', 0, 0),
(3149, 39, 76, 'Quam velit sequi blanditiis libero eum.', '1563283870', 1, 1),
(3151, 176, 76, 'Autem reprehenderit a ut est.', '1563283870', 0, 1),
(3152, 63, 71, 'Consequatur autem.', '1563283870', 0, 0),
(3154, 95, 177, 'Rem rerum cumque ut perspiciatis delectus.', '1563283870', 1, 1),
(3155, 10, 11, 'Doloremque vero quis.', '1563283870', 0, 1),
(3157, 42, 25, 'Distinctio ut quaerat.', '1563283870', 1, 0),
(3158, 2, 80, 'Sint hic.', '1563283870', 0, 0),
(3159, 27, 54, 'Eaque distinctio neque quas ut.', '1563283870', 0, 0),
(3161, 20, 67, 'Quisquam ut tenetur eos quibusdam minima.', '1563283870', 1, 1),
(3163, 33, 104, 'Et ducimus qui.', '1563283870', 1, 0),
(3166, 171, 156, 'Reprehenderit rerum in.', '1563283870', 1, 1),
(3168, 27, 83, 'Reprehenderit itaque.', '1563283870', 1, 1),
(3169, 96, 39, 'Ullam cupiditate.', '1563283870', 1, 0),
(3170, 178, 92, 'Molestiae at.', '1563283870', 1, 0),
(3171, 176, 7, 'Accusantium vel adipisci earum.', '1563283870', 1, 1),
(3172, 197, 101, 'Suscipit ducimus quis.', '1563283870', 0, 0),
(3173, 168, 96, 'Tenetur sequi enim.', '1563283870', 0, 0),
(3174, 21, 15, 'Et voluptas quidem.', '1563283870', 0, 0),
(3175, 188, 80, 'Vero.', '1563283870', 1, 1),
(3177, 18, 42, 'Velit quia.', '1563283870', 0, 0),
(3178, 48, 78, 'Non ipsa.', '1563283870', 1, 0),
(3179, 50, 176, 'Libero consequatur error ab iusto.', '1563283870', 1, 0),
(3181, 19, 178, 'Quia iure.', '1563283870', 0, 1),
(3182, 104, 95, 'Assumenda.', '1563283870', 1, 0),
(3183, 88, 94, 'Consequatur.', '1563283870', 0, 0),
(3184, 66, 181, 'Numquam eum quia hic.', '1563283870', 1, 1),
(3185, 188, 51, 'Ipsam cum sed sit est atque.', '1563283870', 1, 0),
(3186, 164, 188, 'Consequatur tempore quia.', '1563283870', 1, 1),
(3187, 6, 2, 'Iusto.', '1563283870', 1, 1),
(3189, 95, 41, 'Doloremque repellendus deleniti.', '1563283870', 1, 1),
(3190, 11, 26, 'Nobis quia sed.', '1563283870', 1, 1),
(3192, 190, 157, 'Accusamus et minus doloremque.', '1563283870', 1, 0),
(3194, 172, 167, 'Cupiditate quidem eum atque.', '1563283870', 1, 1),
(3196, 194, 102, 'Exercitationem optio consequuntur.', '1563283870', 0, 1),
(3199, 190, 5, 'Rerum facilis.', '1563283870', 0, 1),
(3201, 182, 73, 'Quas neque et.', '1563283870', 0, 1),
(3205, 64, 92, 'Sit aut.', '1563283870', 1, 0),
(3208, 172, 47, 'Nisi nostrum et quam.', '1563283870', 1, 0),
(3209, 59, 56, 'Repellat soluta nulla.', '1563283870', 1, 0),
(3213, 190, 46, 'Quibusdam atque nihil.', '1563283870', 0, 1),
(3215, 76, 62, 'Dicta eveniet corporis.', '1563283870', 0, 1),
(3216, 16, 45, 'Est nesciunt quibusdam aut ut.', '1563283870', 1, 1),
(3217, 46, 76, 'Eos placeat eos.', '1563283870', 0, 1),
(3219, 26, 102, 'Natus nesciunt et.', '1563283870', 1, 1),
(3220, 171, 87, 'Consequatur.', '1563283870', 1, 1),
(3222, 14, 9, 'Et.', '1563283870', 1, 1),
(3226, 169, 89, 'Et non quos.', '1563283871', 1, 0),
(3227, 179, 171, 'Laudantium.', '1563283871', 0, 1),
(3228, 199, 76, 'Nemo et temporibus amet voluptatem.', '1563283871', 1, 1),
(3229, 183, 95, 'Ipsum eius adipisci sint.', '1563283871', 1, 1),
(3230, 2, 38, 'Eos voluptates suscipit.', '1563283871', 0, 0),
(3231, 5, 98, 'Incidunt expedita.', '1563283871', 0, 1),
(3243, 83, 164, 'Aliquid earum iusto modi.', '1563283871', 1, 0),
(3245, 79, 94, 'Nostrum perspiciatis fugit.', '1563283871', 0, 0),
(3247, 11, 159, 'Dolor ut.', '1563283871', 1, 0),
(3248, 179, 97, 'Dolor beatae autem enim ratione ratione.', '1563283871', 0, 0),
(3249, 166, 201, 'Aut quis cupiditate minus autem.', '1563283871', 0, 0),
(3251, 40, 185, 'Et dolorem.', '1563283871', 1, 1),
(3253, 196, 51, 'Qui delectus in.', '1563283871', 0, 0),
(3254, 172, 18, 'Dolor nulla provident consequatur molestias sunt.', '1563283871', 1, 1),
(3255, 185, 190, 'At molestiae itaque omnis veniam.', '1563283871', 0, 1),
(3257, 49, 165, 'Sed culpa ut quo cum.', '1563283871', 0, 1),
(3258, 181, 186, 'Est est est.', '1563283871', 0, 0),
(3262, 30, 89, 'Dolorem.', '1563283871', 1, 1),
(3264, 22, 98, 'Recusandae optio ut harum.', '1563283871', 0, 0),
(3265, 14, 42, 'Fugiat.', '1563283871', 0, 1),
(3268, 36, 44, 'Labore fugit tempora.', '1563283871', 0, 0),
(3269, 100, 161, 'Aut ex beatae dolorum est.', '1563283871', 0, 0),
(3270, 49, 51, 'Illum.', '1563283871', 0, 1),
(3271, 55, 83, 'Officia rerum.', '1563283871', 0, 0),
(3272, 71, 202, 'Ex voluptates inventore cupiditate aut.', '1563283871', 1, 1),
(3273, 78, 163, 'Dicta porro suscipit.', '1563283871', 1, 0),
(3276, 158, 104, 'Vel.', '1563283871', 1, 0),
(3277, 197, 76, 'Sunt minus nihil.', '1563283871', 1, 1),
(3279, 97, 22, 'Accusamus cupiditate debitis.', '1563283871', 1, 1),
(3281, 163, 77, 'Magnam harum corrupti nisi.', '1563283871', 0, 1),
(3283, 96, 171, 'Reprehenderit ullam.', '1563283871', 0, 0),
(3286, 5, 82, 'Non voluptates.', '1563283871', 0, 1),
(3288, 47, 60, 'Quidem similique neque voluptatem quis ratione.', '1563283871', 0, 1),
(3290, 183, 17, 'Fugit et.', '1563283871', 0, 0),
(3293, 75, 43, 'Eius quaerat.', '1563283871', 0, 1),
(3294, 12, 201, 'Autem.', '1563283871', 1, 0),
(3295, 67, 179, 'Eos dolor eveniet.', '1563283871', 1, 1),
(3296, 98, 68, 'Ullam non quam.', '1563283871', 0, 0),
(3297, 81, 177, 'Et consequatur.', '1563283871', 1, 1),
(3298, 18, 28, 'Voluptatem mollitia.', '1563283871', 0, 1),
(3299, 80, 197, 'Delectus quaerat minima id.', '1563283871', 1, 0),
(3303, 51, 27, 'Distinctio cumque esse.', '1563283871', 0, 1),
(3305, 56, 5, 'Nemo et omnis tempora.', '1563283871', 1, 1),
(3306, 193, 65, 'Ut et voluptates nam sed.', '1563283871', 0, 1),
(3307, 75, 101, 'Temporibus cupiditate.', '1563283871', 1, 0),
(3311, 72, 32, 'Ut culpa.', '1563283872', 0, 1),
(3312, 156, 163, 'Itaque voluptas.', '1563283872', 1, 0),
(3316, 167, 43, 'Omnis voluptas similique consequatur.', '1563283872', 0, 1),
(3319, 198, 64, 'Est praesentium dolorum ducimus.', '1563283872', 1, 1),
(3320, 4, 49, 'Et veniam.', '1563283872', 1, 1),
(3321, 185, 98, 'Officiis excepturi debitis.', '1563283872', 0, 1),
(3323, 2, 178, 'Delectus odio molestias quia.', '1563283872', 0, 0),
(3324, 197, 47, 'Dolor molestiae ducimus rerum.', '1563283872', 1, 1),
(3325, 55, 1, 'Alias repellat debitis.', '1563283872', 0, 0),
(3327, 51, 183, 'Rerum voluptatum est odit eum.', '1563283872', 0, 0),
(3331, 68, 175, 'Sed.', '1563283872', 1, 0),
(3332, 186, 177, 'Optio facilis nisi.', '1563283872', 0, 0),
(3335, 174, 164, 'Nihil est.', '1563283872', 1, 0),
(3336, 181, 159, 'Tenetur consectetur ipsum tempore.', '1563283872', 0, 1),
(3337, 173, 169, 'Itaque sapiente qui tempora.', '1563283872', 1, 1),
(3339, 175, 4, 'Fugiat labore qui doloribus qui.', '1563283872', 0, 0),
(3341, 189, 177, 'Est repellendus.', '1563283872', 1, 1),
(3343, 28, 56, 'Beatae aut.', '1563283872', 0, 0),
(3348, 184, 167, 'Laborum temporibus velit quia.', '1563283872', 1, 0),
(3349, 97, 199, 'Enim iste.', '1563283872', 1, 0),
(3350, 16, 101, 'Pariatur quo sed.', '1563283872', 1, 0),
(3353, 192, 52, 'Labore.', '1563283872', 1, 0),
(3354, 18, 74, 'Et et eos consequatur.', '1563283872', 0, 0),
(3355, 81, 57, 'Est et sed.', '1563283872', 1, 1),
(3356, 177, 63, 'Voluptas eum.', '1563283872', 0, 1),
(3357, 95, 60, 'Unde.', '1563283872', 0, 0),
(3358, 199, 195, 'Repellendus consectetur similique.', '1563283872', 1, 0),
(3359, 70, 61, 'Alias cum dolorum.', '1563283872', 0, 1),
(3360, 53, 192, 'Molestiae ipsa.', '1563283872', 1, 0),
(3364, 40, 22, 'Ea ipsam sint voluptatibus.', '1563283872', 0, 1),
(3366, 61, 168, 'Nisi modi temporibus.', '1563283872', 0, 1),
(3367, 52, 165, 'Repellendus iste iste repellat iure doloribus.', '1563283872', 1, 1),
(3369, 63, 14, 'Qui.', '1563283872', 0, 0),
(3375, 198, 27, 'Assumenda.', '1563283872', 0, 0),
(3377, 3, 58, 'Alias iure consectetur.', '1563283872', 1, 0),
(3378, 29, 86, 'Magnam non culpa sequi voluptatum.', '1563283872', 0, 1),
(3379, 172, 37, 'Est dolorem totam modi.', '1563283872', 1, 1),
(3381, 35, 24, 'Sequi impedit fugiat.', '1563283872', 1, 1),
(3382, 32, 43, 'Consectetur ipsam eum voluptatem.', '1563283872', 1, 1),
(3385, 177, 51, 'Ratione sit optio eum dolorum.', '1563283872', 1, 0),
(3387, 70, 189, 'Debitis.', '1563283872', 1, 1),
(3390, 52, 11, 'Impedit.', '1563283872', 1, 0),
(3391, 164, 24, 'Debitis voluptas animi.', '1563283872', 1, 1),
(3396, 84, 199, 'In modi in.', '1563283873', 0, 0),
(3400, 45, 48, 'Aut aut placeat.', '1563283873', 1, 0),
(3403, 30, 80, 'Non voluptas sequi.', '1563283873', 1, 0),
(3404, 42, 79, 'Ipsam ullam omnis.', '1563283873', 1, 0),
(3405, 19, 27, 'Similique quas.', '1563283873', 1, 1),
(3409, 100, 12, 'Minus.', '1563283873', 0, 0),
(3412, 203, 17, 'Odio commodi.', '1563283873', 1, 1),
(3413, 75, 70, 'Placeat sit rerum enim.', '1563283873', 0, 0),
(3414, 173, 31, 'Et earum aliquam quibusdam et voluptas.', '1563283873', 0, 1),
(3415, 85, 25, 'Nostrum aspernatur.', '1563283873', 1, 1),
(3416, 198, 87, 'Omnis non et sed.', '1563283873', 1, 0),
(3418, 92, 172, 'At.', '1563283873', 1, 1),
(3420, 19, 97, 'Non nam qui autem.', '1563283873', 1, 1),
(3421, 189, 100, 'Aut excepturi.', '1563283873', 1, 0),
(3422, 82, 36, 'Et ex ut ut.', '1563283873', 0, 1),
(3423, 12, 65, 'Quaerat praesentium voluptatem provident occaecati et.', '1563283873', 0, 1),
(3425, 158, 82, 'Atque inventore sed.', '1563283873', 1, 1),
(3426, 197, 12, 'Et deserunt necessitatibus qui.', '1563283873', 0, 0),
(3429, 186, 185, 'Quos nulla.', '1563283873', 1, 0),
(3430, 203, 75, 'Autem sapiente modi perferendis quia ex.', '1563283873', 1, 1),
(3433, 4, 35, 'Nulla quis et dolorum.', '1563283873', 0, 0),
(3435, 203, 13, 'Et ratione odio esse nisi vero.', '1563283873', 1, 1),
(3437, 43, 173, 'Recusandae aut.', '1563283873', 0, 0),
(3438, 91, 51, 'Doloremque repudiandae aliquid voluptates.', '1563283873', 1, 1),
(3439, 16, 172, 'Sed blanditiis assumenda eius sunt.', '1563283873', 1, 1),
(3440, 82, 169, 'Voluptatem odio consequatur.', '1563283873', 0, 0),
(3441, 41, 80, 'Repellendus labore sit debitis et.', '1563283873', 0, 1),
(3443, 2, 164, 'Voluptatibus voluptatem exercitationem.', '1563283873', 0, 1),
(3447, 173, 176, 'Omnis nesciunt quia distinctio.', '1563283873', 0, 0),
(3450, 104, 37, 'Odit repellendus.', '1563283873', 0, 0),
(3451, 26, 35, 'Asperiores ratione occaecati.', '1563283873', 0, 1),
(3452, 159, 55, 'Voluptate doloremque harum eos.', '1563283873', 0, 0),
(3453, 101, 169, 'Reprehenderit harum incidunt odio dicta hic.', '1563283873', 1, 0),
(3454, 162, 169, 'Autem placeat.', '1563283873', 0, 1),
(3455, 84, 104, 'Sint eaque.', '1563283873', 1, 1),
(3456, 8, 198, 'Consequuntur nobis earum nisi voluptatem.', '1563283873', 1, 1),
(3457, 92, 190, 'Qui optio voluptatibus.', '1563283873', 0, 1),
(3458, 186, 173, 'Impedit dolorem dolor error consequatur vero.', '1563283873', 0, 0),
(3459, 77, 23, 'Optio et consequatur.', '1563283873', 1, 0),
(3462, 80, 68, 'Eum dignissimos et voluptatibus ipsum.', '1563283873', 1, 1),
(3463, 200, 22, 'Impedit rerum.', '1563283873', 0, 1),
(3464, 189, 88, 'Voluptas illum dolor ea distinctio.', '1563283873', 0, 0),
(3465, 165, 187, 'Omnis esse molestias.', '1563283873', 1, 1),
(3467, 69, 44, 'Temporibus est quibusdam dolor temporibus.', '1563283873', 1, 0),
(3468, 173, 77, 'Assumenda reprehenderit et.', '1563283873', 1, 0),
(3469, 51, 78, 'Sint harum.', '1563283873', 1, 1),
(3471, 46, 98, 'Sint maiores consequatur et et placeat.', '1563283873', 0, 0),
(3472, 49, 58, 'Placeat eos occaecati.', '1563283873', 1, 0),
(3473, 31, 203, 'Reiciendis est autem accusantium ratione perspiciatis.', '1563283873', 1, 1),
(3478, 23, 94, 'Repellendus ipsum et.', '1563283874', 0, 1),
(3480, 195, 76, 'Ut.', '1563283874', 1, 0),
(3484, 190, 1, 'Repudiandae pariatur.', '1563283874', 1, 0),
(3486, 44, 182, 'Odio eaque.', '1563283874', 1, 0),
(3487, 189, 178, 'Reiciendis inventore fugit ut incidunt.', '1563283874', 0, 0),
(3489, 198, 67, 'Ut odio.', '1563283874', 1, 0),
(3490, 179, 156, 'Dolores cum.', '1563283874', 1, 0),
(3491, 59, 183, 'Et voluptate.', '1563283874', 1, 0),
(3494, 9, 161, 'Aut tempora.', '1563283874', 0, 0),
(3495, 173, 35, 'Modi voluptatum eos.', '1563283874', 0, 1),
(3496, 4, 177, 'Consequatur et quia.', '1563283874', 1, 1),
(3497, 170, 156, 'Cum dolorum.', '1563283874', 1, 1),
(3498, 38, 46, 'Enim iure.', '1563283874', 0, 1),
(3499, 37, 190, 'Quo.', '1563283874', 1, 1),
(3501, 100, 89, 'Enim officiis blanditiis facilis.', '1563283874', 0, 0),
(3502, 159, 60, 'Vel aut omnis.', '1563283874', 0, 1),
(3503, 183, 191, 'Blanditiis autem laborum ut deserunt.', '1563283874', 0, 0),
(3506, 42, 91, 'Modi sed recusandae molestiae.', '1563283874', 0, 0),
(3508, 21, 178, 'Ab enim sit doloribus harum nostrum.', '1563283874', 0, 1),
(3509, 188, 182, 'Ab illo.', '1563283874', 0, 1),
(3510, 104, 22, 'Impedit.', '1563283874', 0, 0),
(3512, 163, 104, 'Hic rerum quia consequatur.', '1563283874', 1, 0),
(3513, 11, 192, 'Perspiciatis rerum.', '1563283874', 0, 1),
(3515, 177, 78, 'Nostrum facere corporis est.', '1563283874', 1, 1),
(3516, 82, 16, 'Dolores minima et.', '1563283874', 1, 1),
(3521, 45, 46, 'Rem distinctio.', '1563283874', 0, 0),
(3522, 197, 73, 'Distinctio quibusdam.', '1563283874', 1, 0),
(3523, 29, 103, 'Et ullam cum laborum iure quisquam.', '1563283874', 0, 0),
(3525, 51, 28, 'Earum ex doloribus dolores.', '1563283874', 0, 1),
(3526, 161, 19, 'Nostrum quisquam neque.', '1563283874', 1, 0),
(3527, 98, 27, 'Quod expedita facere.', '1563283874', 1, 0),
(3528, 13, 22, 'Veritatis commodi neque.', '1563283874', 1, 0),
(3533, 40, 40, 'Porro impedit repellat autem.', '1563283874', 0, 0),
(3534, 104, 75, 'Impedit.', '1563283874', 1, 1),
(3535, 187, 101, 'Praesentium aut velit odit.', '1563283874', 1, 1),
(3536, 104, 55, 'Et aliquam consectetur.', '1563283874', 1, 1),
(3538, 9, 191, 'Enim.', '1563283874', 1, 1),
(3539, 78, 93, 'Deserunt neque fugit.', '1563283874', 1, 0),
(3543, 49, 191, 'Ullam iste natus.', '1563283874', 1, 0),
(3544, 44, 44, 'Sit consequuntur omnis quia.', '1563283874', 1, 0),
(3546, 37, 88, 'Enim aperiam iusto ut.', '1563283874', 1, 1),
(3550, 16, 167, 'Ut et.', '1563283874', 1, 0),
(3552, 181, 170, 'Qui voluptatem.', '1563283874', 1, 0),
(3553, 182, 3, 'Maiores facere.', '1563283874', 0, 0),
(3554, 33, 93, 'Ut odio commodi similique.', '1563283874', 0, 1),
(3555, 184, 159, 'Et perspiciatis consectetur.', '1563283874', 1, 0),
(3556, 81, 49, 'Ea possimus et.', '1563283874', 0, 1),
(3557, 61, 77, 'Tempora est et.', '1563283874', 1, 1),
(3558, 87, 81, 'Repellendus.', '1563283874', 0, 0),
(3560, 27, 21, 'Voluptatem cupiditate.', '1563283874', 1, 0),
(3561, 170, 195, 'Eos rerum.', '1563283874', 1, 1),
(3562, 51, 164, 'Neque perferendis.', '1563283874', 1, 1),
(3563, 203, 185, 'Ex.', '1563283874', 0, 1),
(3567, 30, 199, 'Quisquam blanditiis eius.', '1563283875', 1, 1),
(3568, 9, 8, 'Perferendis fugit.', '1563283875', 0, 1),
(3570, 177, 192, 'Consequatur nesciunt blanditiis.', '1563283875', 0, 1),
(3572, 201, 64, 'Harum doloribus animi.', '1563283875', 0, 1),
(3573, 67, 46, 'Nisi porro nostrum recusandae.', '1563283875', 1, 1),
(3574, 187, 75, 'Excepturi in omnis recusandae.', '1563283875', 1, 0),
(3575, 64, 56, 'In numquam assumenda rem ex at.', '1563283875', 0, 0),
(3577, 94, 66, 'Soluta eum sed.', '1563283875', 1, 1),
(3578, 92, 181, 'Ea qui provident.', '1563283875', 0, 1),
(3580, 13, 47, 'Exercitationem.', '1563283875', 0, 1),
(3585, 24, 64, 'Repellendus doloremque saepe.', '1563283875', 1, 1),
(3587, 16, 48, 'Similique dolorem aut.', '1563283875', 0, 0),
(3588, 172, 3, 'Eaque eos.', '1563283875', 1, 0),
(3590, 161, 40, 'Nihil voluptate tempore possimus.', '1563283875', 0, 0),
(3591, 34, 179, 'Quisquam molestias rerum quos.', '1563283875', 1, 1),
(3594, 80, 66, 'Pariatur.', '1563283875', 1, 0),
(3595, 102, 197, 'Sed qui.', '1563283875', 0, 1),
(3596, 181, 65, 'Totam aut adipisci et molestias.', '1563283875', 0, 0),
(3597, 85, 63, 'Mollitia iure quasi suscipit.', '1563283875', 0, 0),
(3599, 78, 173, 'Culpa.', '1563283875', 0, 0),
(3600, 37, 59, 'Corporis occaecati sunt.', '1563283875', 1, 0),
(3603, 178, 53, 'Magnam nobis.', '1563283875', 1, 0),
(3605, 83, 57, 'Qui ratione voluptas.', '1563283875', 1, 1),
(3607, 62, 202, 'Sapiente quidem.', '1563283875', 0, 0),
(3608, 40, 170, 'Quaerat excepturi dolores.', '1563283875', 1, 1),
(3612, 52, 17, 'Exercitationem illo.', '1563283875', 0, 1),
(3613, 3, 201, 'Qui sunt eos et.', '1563283875', 0, 1),
(3614, 195, 38, 'Voluptatem commodi sed.', '1563283875', 0, 0),
(3618, 37, 18, 'Laudantium ut nam tempore.', '1563283875', 0, 0),
(3619, 17, 194, 'Cum et ducimus vel.', '1563283875', 1, 1),
(3623, 192, 190, 'Est rerum dolor iusto ea.', '1563283876', 1, 0),
(3624, 191, 89, 'Ad nisi reprehenderit pariatur.', '1563283876', 0, 1),
(3625, 84, 196, 'Iure eum.', '1563283876', 0, 1),
(3626, 67, 12, 'Adipisci nobis.', '1563283876', 0, 1),
(3627, 180, 6, 'Deserunt blanditiis.', '1563283876', 0, 0),
(3629, 52, 198, 'Nesciunt eos laborum.', '1563283876', 0, 0),
(3631, 10, 17, 'A nesciunt et.', '1563283876', 0, 0),
(3638, 172, 14, 'Sed et sed quia.', '1563283876', 0, 0),
(3639, 157, 168, 'Fugit nihil.', '1563283876', 1, 1),
(3642, 48, 8, 'Qui et omnis cum.', '1563283876', 1, 1),
(3643, 53, 35, 'Eos.', '1563283876', 1, 0),
(3644, 186, 1, 'Id quod eligendi voluptatibus.', '1563283876', 1, 1),
(3646, 51, 166, 'Enim temporibus nesciunt perspiciatis.', '1563283876', 0, 0),
(3648, 203, 184, 'Exercitationem quaerat illum.', '1563283876', 0, 1),
(3650, 87, 88, 'Ut.', '1563283876', 0, 1),
(3652, 100, 22, 'Fugiat maiores debitis sit facere.', '1563283876', 0, 0),
(3654, 19, 22, 'Consequatur quasi.', '1563283876', 1, 0),
(3657, 101, 178, 'Nemo esse doloribus sint ad.', '1563283876', 0, 1),
(3658, 27, 90, 'Voluptates ut aliquid.', '1563283876', 1, 1),
(3661, 25, 172, 'Soluta accusantium.', '1563283876', 0, 0),
(3664, 91, 26, 'Nemo voluptatem.', '1563283876', 1, 0),
(3665, 67, 40, 'Sunt enim eum quasi.', '1563283876', 0, 0),
(3666, 103, 178, 'Non doloribus impedit iste dicta vel.', '1563283876', 1, 0),
(3667, 32, 171, 'Sit labore.', '1563283876', 1, 1),
(3672, 1, 70, 'Modi nemo consequuntur repudiandae.', '1563283876', 0, 0),
(3675, 81, 82, 'Voluptas qui amet dolore.', '1563283876', 1, 1),
(3678, 66, 7, 'Distinctio.', '1563283876', 1, 1),
(3679, 49, 160, 'Similique quis.', '1563283876', 1, 0),
(3680, 193, 66, 'Quia voluptatem.', '1563283876', 0, 0),
(3682, 175, 68, 'Nihil ipsam non nemo.', '1563283876', 1, 0),
(3685, 160, 9, 'Ratione unde iusto.', '1563283876', 1, 0),
(3686, 34, 98, 'In iure sit.', '1563283876', 1, 0),
(3687, 15, 41, 'Et exercitationem.', '1563283876', 1, 1),
(3688, 81, 166, 'Omnis qui qui.', '1563283876', 1, 0),
(3689, 32, 8, 'Nihil fugiat.', '1563283877', 0, 0),
(3691, 49, 191, 'Dolor voluptatem qui.', '1563283877', 1, 0),
(3692, 29, 97, 'Odio ducimus laboriosam explicabo et.', '1563283877', 1, 1),
(3693, 57, 100, 'Odio numquam et.', '1563283877', 0, 0),
(3697, 100, 84, 'Quia molestiae.', '1563283877', 0, 1),
(3698, 96, 100, 'Repellat maiores ipsa esse.', '1563283877', 0, 0),
(3699, 184, 38, 'Fugiat sed consequuntur.', '1563283877', 0, 0),
(3702, 67, 178, 'Rerum.', '1563283877', 0, 1),
(3707, 89, 64, 'Eum cupiditate.', '1563283877', 0, 1),
(3708, 66, 76, 'Consequatur omnis.', '1563283877', 0, 1),
(3710, 71, 7, 'Cumque enim.', '1563283877', 1, 0),
(3712, 1, 32, 'Recusandae omnis et dolorem.', '1563283877', 1, 0),
(3716, 56, 97, 'Qui quo et nihil excepturi ea.', '1563283877', 0, 0),
(3718, 35, 88, 'Sint quas.', '1563283877', 1, 1),
(3719, 64, 29, 'Dolor nostrum quam.', '1563283877', 1, 1),
(3720, 76, 190, 'Inventore ipsa.', '1563283877', 0, 0),
(3724, 77, 66, 'Voluptates ipsa.', '1563283877', 1, 1),
(3727, 165, 196, 'Beatae expedita.', '1563283877', 1, 0),
(3728, 178, 200, 'Qui sit aliquam.', '1563283877', 0, 1),
(3729, 67, 28, 'Non corrupti saepe.', '1563283877', 1, 0),
(3730, 98, 93, 'Voluptatibus vitae.', '1563283877', 0, 1),
(3731, 179, 49, 'Sed numquam.', '1563283877', 0, 1),
(3735, 19, 38, 'Minima sint iure.', '1563283877', 1, 1),
(3737, 16, 168, 'Ut recusandae dicta.', '1563283877', 0, 1),
(3740, 40, 170, 'Nisi culpa assumenda nostrum.', '1563283878', 1, 1),
(3742, 170, 174, 'Placeat.', '1563283878', 0, 0),
(3743, 93, 23, 'Et temporibus et et molestias.', '1563283878', 1, 0),
(3744, 4, 194, 'Nesciunt consequatur.', '1563283878', 0, 0),
(3749, 65, 67, 'Omnis qui rerum.', '1563283878', 1, 1),
(3750, 194, 43, 'Et.', '1563283878', 0, 1),
(3754, 77, 172, 'Quam atque.', '1563283878', 0, 0),
(3755, 161, 77, 'Animi est.', '1563283878', 0, 1),
(3756, 173, 76, 'Et explicabo.', '1563283878', 0, 0),
(3758, 171, 19, 'Et aut sequi modi.', '1563283878', 0, 1),
(3759, 38, 203, 'A officia et consequuntur blanditiis.', '1563283878', 0, 1),
(3762, 59, 23, 'Et quas vel deserunt dolores ipsam.', '1563283879', 1, 1),
(3764, 49, 68, 'Cupiditate dolorem laudantium eveniet.', '1563283879', 0, 0),
(3765, 21, 84, 'Minima et tempore.', '1563283879', 0, 0),
(3768, 61, 195, 'Aut eaque.', '1563283879', 0, 0),
(3769, 180, 199, 'Et quia.', '1563283879', 1, 0),
(3770, 172, 27, 'Ullam rerum eos quo qui.', '1563283879', 1, 0),
(3773, 45, 179, 'Ut ullam qui fugiat voluptatem.', '1563283879', 0, 1),
(3774, 9, 176, 'Doloremque tempora.', '1563283879', 1, 1),
(3776, 173, 4, 'Et voluptate.', '1563283879', 1, 1),
(3777, 46, 32, 'Vel aut dolor sit.', '1563283879', 0, 1),
(3780, 52, 95, 'Consequatur.', '1563283879', 0, 0),
(3781, 25, 30, 'Non.', '1563283879', 1, 0),
(3782, 188, 92, 'Corporis quisquam.', '1563283879', 0, 1),
(3784, 22, 33, 'Dolore quia numquam debitis.', '1563283879', 0, 1),
(3786, 52, 166, 'Impedit.', '1563283879', 0, 0),
(3790, 182, 24, 'Id.', '1563283880', 0, 0),
(3792, 24, 19, 'At quia.', '1563283880', 1, 1),
(3793, 100, 175, 'Itaque cumque aspernatur.', '1563283880', 1, 0),
(3794, 172, 41, 'Sed ut ipsa quas.', '1563283880', 1, 0),
(3796, 14, 194, 'Fugit et quis.', '1563283880', 0, 1),
(3797, 104, 51, 'Doloremque occaecati.', '1563283880', 0, 1),
(3799, 189, 6, 'Sit voluptatem maxime.', '1563283880', 0, 1),
(3800, 163, 185, 'Est quia.', '1563283880', 0, 0),
(3801, 83, 25, 'Aliquid doloribus sed eum.', '1563283880', 0, 1),
(3803, 193, 12, 'A sint architecto.', '1563283880', 1, 0),
(3806, 196, 104, 'Nesciunt dolorem corrupti veniam.', '1563283880', 0, 0),
(3807, 100, 179, 'Et cupiditate suscipit.', '1563283880', 0, 1),
(3808, 83, 91, 'Itaque hic.', '1563283880', 1, 0),
(3810, 196, 171, 'Exercitationem.', '1563283880', 0, 1),
(3814, 50, 17, 'Quidem aut temporibus quae.', '1563283880', 0, 0),
(3817, 56, 157, 'Rem blanditiis voluptatem laboriosam molestias.', '1563283880', 0, 1),
(3818, 98, 193, 'Voluptas ducimus.', '1563283880', 1, 0),
(3821, 191, 173, 'Voluptas aut saepe eum saepe.', '1563283881', 0, 1),
(3823, 201, 88, 'Et occaecati.', '1563283881', 0, 0),
(3824, 173, 32, 'Adipisci aut.', '1563283881', 0, 0),
(3827, 20, 61, 'Sunt ipsum totam delectus qui laboriosam.', '1563283881', 0, 0),
(3831, 93, 61, 'Ea itaque animi.', '1563283881', 1, 1),
(3832, 88, 34, 'Nobis in eveniet quam dolores.', '1563283881', 1, 1),
(3839, 61, 46, 'Accusantium quidem.', '1563283881', 1, 0),
(3840, 167, 166, 'Beatae quidem et.', '1563283881', 0, 0),
(3841, 63, 192, 'Ducimus autem omnis.', '1563283881', 1, 1),
(3843, 170, 98, 'Nam eum architecto quisquam tempora qui.', '1563283881', 1, 0),
(3844, 45, 18, 'Non sed.', '1563283881', 0, 0),
(3846, 4, 37, 'Natus eaque quae ipsam.', '1563283881', 1, 1),
(3852, 39, 94, 'Et.', '1563283882', 1, 1),
(3855, 189, 9, 'Consequatur recusandae eveniet molestiae.', '1563283882', 1, 1),
(3856, 58, 83, 'Tempora laudantium eaque.', '1563283882', 0, 1),
(3857, 40, 199, 'Quia quia voluptas debitis earum.', '1563283882', 0, 1),
(3859, 185, 5, 'Quia dignissimos reprehenderit.', '1563283882', 1, 0),
(3861, 48, 86, 'Quo itaque quaerat hic qui distinctio.', '1563283882', 1, 1),
(3862, 79, 55, 'Ut saepe deserunt.', '1563283882', 1, 0),
(3864, 50, 187, 'Id explicabo facilis.', '1563283882', 1, 1),
(3865, 36, 176, 'Placeat quas vel et.', '1563283882', 1, 0),
(3866, 4, 201, 'Sunt quia.', '1563283882', 0, 1),
(3867, 181, 31, 'Voluptas officia incidunt et ex.', '1563283882', 1, 1),
(3868, 31, 46, 'Quae est natus.', '1563283882', 1, 1),
(3869, 168, 196, 'Officia doloribus dignissimos.', '1563283882', 1, 1),
(3870, 66, 25, 'Mollitia quia qui et eligendi.', '1563283882', 0, 0),
(3874, 14, 21, 'Iure.', '1563283882', 0, 1),
(3875, 70, 73, 'Quisquam in consequatur.', '1563283882', 0, 1),
(3876, 70, 99, 'Amet ut.', '1563283882', 1, 1),
(3877, 15, 51, 'Rerum nulla nihil nostrum.', '1563283882', 0, 1),
(3879, 16, 76, 'Assumenda et.', '1563283882', 1, 1),
(3880, 47, 80, 'Ipsum dolorum et rerum nihil blanditiis.', '1563283882', 0, 1),
(3881, 174, 167, 'Illum earum quisquam.', '1563283882', 0, 0),
(3882, 62, 193, 'Et sit iste.', '1563283882', 1, 0),
(3883, 157, 78, 'Quibusdam aut.', '1563283882', 0, 0),
(3885, 163, 27, 'Amet nisi et eaque.', '1563283882', 1, 1),
(3887, 87, 76, 'Totam.', '1563283882', 1, 1),
(3889, 172, 42, 'Doloremque soluta officia.', '1563283882', 0, 1),
(3890, 13, 89, 'Nesciunt vel.', '1563283882', 0, 0),
(3891, 44, 19, 'At aut quidem.', '1563283882', 0, 0),
(3892, 175, 62, 'Ducimus molestiae ea ullam quibusdam.', '1563283882', 1, 0),
(3895, 53, 28, 'Voluptatem et facere aut ut nihil.', '1563283882', 1, 0),
(3896, 65, 14, 'Quisquam ullam.', '1563283882', 1, 0),
(3898, 184, 61, 'Illum quod perspiciatis.', '1563283882', 1, 0),
(3899, 22, 78, 'Fuga laudantium.', '1563283882', 0, 1),
(3900, 69, 55, 'Laboriosam dolorem velit in quisquam.', '1563283882', 0, 1),
(3901, 57, 88, 'Consequatur debitis.', '1563283882', 1, 0),
(3903, 35, 63, 'Ut voluptates.', '1563283882', 1, 1),
(3904, 102, 9, 'Aut explicabo ratione.', '1563283882', 0, 1),
(3906, 8, 175, 'Dicta pariatur error.', '1563283882', 1, 1),
(3907, 55, 38, 'Enim eveniet repudiandae.', '1563283882', 1, 0),
(3909, 187, 88, 'Dolores sed.', '1563283882', 1, 1),
(3911, 186, 65, 'Id voluptas illum nihil.', '1563283882', 0, 1),
(3912, 180, 87, 'Ullam accusamus.', '1563283882', 1, 0),
(3913, 168, 12, 'Corporis tenetur.', '1563283882', 1, 0),
(3915, 73, 101, 'Voluptatem vitae et.', '1563283882', 1, 1),
(3917, 2, 44, 'Nulla iure fugit at aliquam nisi.', '1563283882', 1, 0),
(3918, 82, 32, 'Ducimus sed.', '1563283882', 0, 0),
(3919, 173, 72, 'Itaque nesciunt explicabo rerum non.', '1563283882', 0, 1),
(3920, 24, 87, 'Tempore praesentium cum.', '1563283882', 0, 1),
(3921, 41, 43, 'Rem blanditiis quis velit ut.', '1563283882', 1, 0),
(3922, 63, 187, 'Tempore exercitationem.', '1563283882', 1, 1),
(3924, 100, 187, 'Consequatur exercitationem dolorum.', '1563283882', 0, 1),
(3926, 55, 168, 'Id sunt.', '1563283882', 0, 1),
(3927, 74, 160, 'Error eum eveniet unde sequi.', '1563283882', 0, 0),
(3929, 17, 19, 'Mollitia molestiae placeat.', '1563283882', 1, 1),
(3930, 7, 76, 'Dolores.', '1563283882', 1, 0),
(3934, 103, 68, 'Consectetur incidunt.', '1563283882', 0, 1),
(3938, 67, 20, 'Ut fugiat fugit omnis molestiae.', '1563283883', 1, 0),
(3939, 177, 203, 'In enim libero enim.', '1563283883', 0, 0),
(3941, 24, 63, 'Dolorem illo ut.', '1563283883', 1, 0),
(3943, 79, 194, 'Quis vel.', '1563283883', 0, 1),
(3944, 185, 187, 'Cupiditate porro voluptatem.', '1563283883', 1, 0),
(3945, 59, 191, 'Necessitatibus odio.', '1563283883', 0, 1),
(3948, 86, 72, 'Qui officiis eligendi maiores.', '1563283883', 1, 0),
(3949, 16, 192, 'Recusandae doloremque voluptates doloremque asperiores.', '1563283883', 1, 1),
(3950, 99, 96, 'Ut tempora.', '1563283883', 0, 1),
(3951, 65, 100, 'Unde.', '1563283883', 1, 1),
(3953, 63, 51, 'Voluptas.', '1563283883', 0, 0),
(3954, 59, 192, 'Ipsum nihil.', '1563283883', 1, 0),
(3955, 69, 84, 'Adipisci odit possimus.', '1563283883', 0, 1),
(3956, 31, 72, 'Odit labore.', '1563283883', 0, 1),
(3960, 160, 203, 'Et molestiae.', '1563283883', 1, 1),
(3961, 14, 26, 'Nostrum.', '1563283883', 1, 1),
(3962, 15, 196, 'Et aut quis dolorem.', '1563283883', 0, 1),
(3963, 86, 12, 'Autem at asperiores.', '1563283883', 0, 0),
(3965, 166, 157, 'Dolore iure debitis ut.', '1563283883', 0, 1),
(3966, 51, 17, 'Magni praesentium minus.', '1563283883', 0, 1),
(3967, 97, 198, 'Voluptas.', '1563283883', 0, 0),
(3973, 182, 16, 'Deleniti dicta eos.', '1563283883', 0, 1),
(3974, 201, 78, 'Sequi est magnam ipsum quis.', '1563283884', 0, 0),
(3975, 178, 58, 'Ut non ut.', '1563283884', 1, 1),
(3980, 25, 17, 'Numquam voluptas molestias.', '1563283884', 0, 1),
(3982, 173, 165, 'Accusantium eos et.', '1563283884', 0, 1),
(3983, 62, 87, 'Ipsa modi sunt.', '1563283884', 0, 0),
(3985, 79, 96, 'Dolore molestiae quis consequuntur.', '1563283884', 0, 0),
(3987, 189, 34, 'Ullam deserunt.', '1563283884', 0, 0),
(3993, 41, 104, 'Aut iure.', '1563283884', 0, 0),
(3994, 102, 193, 'Repellat mollitia delectus.', '1563283884', 1, 0),
(3996, 189, 169, 'Non vero ut.', '1563283884', 0, 0),
(3997, 51, 79, 'Ut veritatis.', '1563283884', 0, 0),
(3999, 171, 74, 'Odio ut doloribus et et.', '1563283884', 1, 1),
(4000, 4, 98, 'Reprehenderit fugit dolorem.', '1563283884', 0, 0),
(4001, 55, 49, 'Deleniti occaecati ullam doloremque.', '1563283884', 0, 0),
(4003, 70, 33, 'Tempore velit odio.', '1563283884', 0, 1),
(4004, 18, 65, 'Error hic quae repellendus rerum.', '1563283884', 0, 0),
(4006, 97, 100, 'Quidem repellat facilis rem.', '1563283884', 1, 0),
(4008, 179, 77, 'Recusandae odit maiores et.', '1563283884', 1, 0),
(4009, 171, 46, 'Amet eius molestiae mollitia sit.', '1563283884', 1, 1),
(4011, 44, 183, 'Inventore voluptatem fugiat sunt.', '1563283884', 1, 0),
(4012, 165, 79, 'Ad ea.', '1563283885', 0, 0),
(4014, 18, 158, 'Occaecati sint consequuntur aliquam neque.', '1563283885', 0, 0),
(4015, 181, 72, 'Quibusdam qui eius.', '1563283885', 0, 0),
(4018, 101, 181, 'Commodi quam vitae sunt.', '1563283885', 1, 0),
(4019, 93, 183, 'Autem ut alias.', '1563283885', 1, 1),
(4021, 46, 174, 'Optio explicabo fugiat voluptatum.', '1563283885', 1, 0),
(4022, 95, 53, 'Inventore.', '1563283885', 1, 0),
(4024, 184, 93, 'Ut repellat.', '1563283885', 1, 0),
(4029, 44, 80, 'Dolor dicta magnam autem.', '1563283885', 0, 0),
(4031, 50, 59, 'Assumenda ipsum ut modi.', '1563283885', 1, 1),
(4035, 200, 5, 'Id est.', '1563283885', 1, 0),
(4037, 194, 2, 'Cupiditate et facere voluptatum.', '1563283885', 1, 0),
(4040, 49, 102, 'A velit unde quo id deserunt.', '1563283885', 1, 0),
(4043, 174, 74, 'Praesentium.', '1563283885', 1, 0),
(4044, 70, 4, 'Quasi iure quia.', '1563283885', 1, 1),
(4046, 14, 198, 'Reiciendis quis.', '1563283885', 1, 1),
(4048, 34, 41, 'Dolores maiores unde.', '1563283886', 0, 0),
(4049, 193, 46, 'Tempore dolorum.', '1563283886', 1, 1),
(4050, 195, 83, 'Eos.', '1563283886', 1, 0),
(4051, 11, 184, 'Delectus quo maxime ex laborum.', '1563291997', 0, 1),
(4052, 200, 4, 'Magnam.', '1563291997', 1, 0),
(4055, 8, 18, 'Quidem ad.', '1563291998', 1, 0),
(4056, 200, 94, 'Aspernatur.', '1563291998', 1, 0),
(4057, 186, 90, 'Non odit ut sapiente quibusdam.', '1563291998', 1, 1),
(4058, 16, 200, 'Illum reprehenderit.', '1563291998', 0, 1),
(4060, 8, 156, 'Quas est iure.', '1563291998', 1, 1),
(4061, 87, 24, 'Magni architecto quia et.', '1563291998', 0, 1),
(4063, 190, 16, 'Eligendi et et.', '1563291998', 0, 1),
(4066, 60, 169, 'Sunt vitae sequi impedit illo necessitatibus.', '1563291998', 1, 1),
(4067, 28, 64, 'Et et ut.', '1563291998', 1, 0),
(4070, 45, 81, 'Nobis fuga.', '1563291998', 0, 1),
(4072, 72, 205, 'Est praesentium omnis.', '1563291998', 0, 1),
(4074, 62, 191, 'Culpa ipsa.', '1563291998', 0, 0),
(4075, 44, 59, 'Dolor occaecati.', '1563291998', 1, 0),
(4080, 204, 98, 'Aliquam omnis doloribus.', '1563291998', 0, 1),
(4083, 187, 1, 'Molestiae ex voluptatum.', '1563291998', 1, 0),
(4084, 59, 45, 'Et ea impedit consectetur.', '1563291998', 1, 1),
(4086, 60, 18, 'Quia quis blanditiis.', '1563291998', 0, 1),
(4090, 176, 9, 'Nostrum et.', '1563291998', 0, 1),
(4091, 38, 161, 'Reiciendis.', '1563291998', 1, 0),
(4092, 58, 4, 'Voluptas at inventore similique sint ducimus.', '1563291998', 0, 1),
(4094, 38, 51, 'Molestiae aut qui.', '1563291998', 1, 0),
(4095, 175, 175, 'Qui ut.', '1563291998', 1, 1),
(4097, 19, 199, 'Porro deleniti laborum.', '1563291998', 1, 1),
(4100, 80, 157, 'Et quae.', '1563291998', 1, 1),
(4101, 10, 32, 'Adipisci sit.', '1563291998', 0, 1),
(4103, 54, 186, 'Omnis illo quasi.', '1563291998', 1, 1),
(4106, 204, 167, 'Distinctio praesentium similique.', '1563291998', 0, 1),
(4109, 170, 190, 'Facilis qui accusantium.', '1563291998', 1, 1),
(4111, 62, 59, 'Esse.', '1563291998', 0, 1),
(4114, 161, 27, 'Eligendi tempore.', '1563291998', 1, 0),
(4116, 179, 178, 'Exercitationem sint in consequatur possimus.', '1563291998', 1, 1),
(4117, 53, 40, 'Ipsum vero qui.', '1563291998', 0, 0),
(4119, 15, 34, 'Sequi consequatur veritatis et.', '1563291998', 1, 1),
(4120, 73, 93, 'Voluptatem magni laudantium consequuntur assumenda.', '1563291999', 0, 0),
(4121, 93, 45, 'Quisquam est nihil necessitatibus.', '1563291999', 0, 1),
(4122, 98, 191, 'Quas maiores.', '1563291999', 1, 0),
(4125, 172, 41, 'Nulla quasi qui.', '1563291999', 0, 1),
(4126, 196, 96, 'Non quia eos similique soluta et.', '1563291999', 1, 0),
(4127, 25, 95, 'A voluptatem.', '1563291999', 1, 1),
(4128, 30, 76, 'Fuga eum.', '1563291999', 1, 1),
(4129, 206, 34, 'Rerum vel.', '1563291999', 0, 1),
(4130, 101, 175, 'Ipsum rerum magnam voluptatem.', '1563291999', 0, 1),
(4132, 51, 185, 'Temporibus ut accusamus.', '1563291999', 1, 0),
(4133, 88, 93, 'Rerum.', '1563291999', 1, 1),
(4134, 193, 27, 'Consectetur officiis iure ipsa ipsam.', '1563291999', 0, 1),
(4135, 96, 100, 'Aut iste ea adipisci.', '1563291999', 1, 0),
(4138, 44, 81, 'Sequi optio ut rem aut dolorum.', '1563291999', 0, 1),
(4141, 175, 32, 'Similique iste architecto tenetur.', '1563291999', 1, 0),
(4142, 53, 28, 'Accusantium itaque repellendus.', '1563291999', 0, 1),
(4143, 61, 98, 'Quia quaerat.', '1563291999', 0, 0),
(4144, 95, 69, 'Hic repellat recusandae.', '1563291999', 1, 0),
(4145, 39, 75, 'Libero consequuntur aspernatur consequatur.', '1563291999', 0, 1),
(4149, 160, 71, 'Quia debitis facere.', '1563291999', 0, 0),
(4150, 190, 79, 'Maxime repellat.', '1563291999', 0, 1),
(4151, 55, 178, 'Esse cupiditate.', '1563291999', 1, 1),
(4152, 180, 97, 'Deleniti qui eaque.', '1563291999', 0, 0),
(4159, 95, 11, 'Eaque ut beatae quis.', '1563291999', 1, 0),
(4160, 34, 46, 'Ut tempora unde omnis nulla.', '1563291999', 1, 0),
(4161, 16, 172, 'Aut nostrum ut.', '1563291999', 0, 0),
(4162, 86, 103, 'Aut ex.', '1563291999', 1, 1),
(4163, 167, 199, 'Eos a.', '1563291999', 1, 0),
(4164, 167, 184, 'Facilis id.', '1563291999', 0, 1),
(4165, 26, 103, 'Et perferendis.', '1563291999', 0, 1),
(4166, 97, 194, 'Odit voluptas ut.', '1563291999', 1, 1),
(4167, 73, 184, 'Soluta reiciendis dolorum natus.', '1563291999', 1, 0),
(4168, 192, 76, 'Inventore veritatis quibusdam fugit earum.', '1563291999', 0, 0),
(4170, 65, 54, 'Enim necessitatibus expedita.', '1563291999', 0, 0),
(4171, 102, 55, 'Error.', '1563291999', 0, 1),
(4172, 19, 96, 'Placeat illo.', '1563291999', 0, 1),
(4175, 96, 170, 'Aspernatur laudantium.', '1563291999', 0, 0),
(4178, 89, 185, 'Consequatur doloribus.', '1563291999', 1, 1),
(4179, 199, 30, 'Illum sapiente.', '1563291999', 1, 1),
(4181, 206, 174, 'Distinctio.', '1563291999', 0, 1),
(4182, 161, 16, 'Ducimus sit temporibus.', '1563291999', 0, 0),
(4183, 28, 56, 'Distinctio porro.', '1563291999', 0, 0),
(4188, 60, 57, 'Consequatur dolores qui nostrum.', '1563291999', 0, 0),
(4190, 31, 22, 'Deserunt.', '1563291999', 1, 1),
(4192, 98, 102, 'Nostrum et voluptas aut culpa sapiente.', '1563291999', 1, 1),
(4194, 46, 54, 'Placeat nesciunt hic qui sunt.', '1563291999', 0, 0),
(4196, 183, 42, 'Et repellat.', '1563291999', 0, 0),
(4198, 178, 197, 'Recusandae est vitae voluptas nobis.', '1563291999', 0, 1),
(4199, 18, 55, 'Ex amet voluptates nam et.', '1563291999', 0, 0),
(4203, 73, 168, 'Omnis provident.', '1563291999', 0, 1),
(4206, 102, 99, 'Non voluptates ullam.', '1563292000', 1, 1),
(4207, 28, 183, 'Qui sit ut.', '1563292000', 1, 1),
(4208, 56, 90, 'Omnis.', '1563292000', 1, 1),
(4210, 181, 41, 'Beatae harum quidem ipsa.', '1563292000', 1, 1),
(4212, 69, 184, 'Sunt accusamus provident.', '1563292000', 1, 1),
(4214, 188, 45, 'Dolores dolores nihil.', '1563292000', 0, 1),
(4216, 15, 101, 'Non quaerat.', '1563292000', 0, 0),
(4217, 204, 59, 'Ut autem.', '1563292000', 1, 1),
(4218, 36, 159, 'Quasi aut consequatur animi.', '1563292000', 0, 0),
(4219, 200, 96, 'At veritatis cum.', '1563292000', 1, 1),
(4220, 172, 64, 'Quae odit quis vitae.', '1563292000', 1, 0),
(4222, 65, 12, 'Ipsam deleniti voluptate.', '1563292000', 1, 1),
(4223, 66, 101, 'Quaerat aut eum.', '1563292000', 1, 0),
(4224, 65, 17, 'Magni quia consequatur sint.', '1563292000', 0, 1),
(4226, 85, 61, 'Est tenetur quia.', '1563292000', 0, 0),
(4227, 32, 193, 'Enim maxime nihil.', '1563292000', 0, 1),
(4228, 62, 48, 'Dolorum at.', '1563292000', 1, 1),
(4229, 179, 171, 'Qui.', '1563292000', 0, 0),
(4231, 195, 194, 'Quos labore voluptate.', '1563292000', 0, 0),
(4232, 17, 6, 'Velit blanditiis accusamus eum.', '1563292000', 1, 0),
(4234, 163, 90, 'Quibusdam magni non laudantium.', '1563292000', 1, 1),
(4235, 72, 19, 'Id molestiae et.', '1563292000', 0, 0),
(4236, 20, 6, 'Qui ipsam.', '1563292000', 0, 0),
(4240, 74, 88, 'Aut facere voluptas.', '1563292000', 0, 0),
(4241, 15, 192, 'Quas qui.', '1563292000', 1, 0),
(4242, 199, 34, 'Quia quae.', '1563292000', 0, 0),
(4245, 204, 13, 'Nemo rerum qui.', '1563292000', 1, 0),
(4250, 48, 63, 'Ea id illum velit aperiam.', '1563292000', 0, 1),
(4251, 157, 67, 'Quae vitae.', '1563292000', 0, 0),
(4253, 194, 67, 'Nesciunt.', '1563292000', 1, 0),
(4254, 181, 4, 'Commodi voluptatem dolorum ipsam animi.', '1563292000', 1, 1),
(4255, 197, 28, 'Voluptatem dolore odit provident tenetur facilis.', '1563292000', 0, 1),
(4256, 18, 32, 'Iusto ipsa enim ut dolore accusantium.', '1563292000', 1, 0),
(4257, 179, 202, 'Error voluptate deserunt.', '1563292000', 0, 0),
(4258, 156, 7, 'Et nulla cupiditate sit.', '1563292000', 1, 0),
(4260, 15, 201, 'Tempore aut.', '1563292000', 0, 1),
(4261, 38, 26, 'Illum laboriosam mollitia.', '1563292000', 1, 0),
(4262, 195, 27, 'Incidunt consequatur est.', '1563292000', 1, 1),
(4267, 167, 36, 'Consequatur ut animi.', '1563292000', 0, 0),
(4268, 97, 77, 'Et quia quidem.', '1563292000', 0, 1),
(4269, 76, 52, 'Ratione est in.', '1563292000', 0, 1),
(4271, 24, 2, 'Exercitationem dolorem.', '1563292000', 1, 1),
(4273, 200, 97, 'Corporis in.', '1563292000', 1, 1),
(4274, 27, 15, 'Saepe est natus.', '1563292000', 1, 0),
(4275, 57, 26, 'Illum debitis et.', '1563292000', 1, 0),
(4277, 201, 30, 'In quae.', '1563292000', 1, 0),
(4278, 169, 159, 'Fugit quis eius impedit.', '1563292000', 0, 0),
(4283, 202, 196, 'Vel sunt facilis.', '1563292000', 1, 1),
(4284, 160, 83, 'Repellat est maxime.', '1563292000', 0, 0),
(4285, 42, 94, 'In eos dolorum dolor aut.', '1563292001', 1, 1),
(4287, 43, 81, 'Ut nihil.', '1563292001', 0, 1),
(4288, 40, 42, 'Voluptatem et aut voluptas quod.', '1563292001', 0, 1),
(4290, 38, 93, 'Quia impedit.', '1563292001', 1, 1),
(4291, 103, 175, 'Id non.', '1563292001', 0, 1),
(4292, 82, 176, 'Assumenda dolores.', '1563292001', 0, 1),
(4294, 69, 48, 'Aliquam quia nemo aut asperiores.', '1563292001', 1, 1),
(4295, 41, 186, 'Et qui repellendus nostrum quia.', '1563292001', 1, 0),
(4297, 167, 43, 'Vero est.', '1563292001', 1, 0),
(4300, 94, 43, 'Qui corporis sit.', '1563292001', 0, 1),
(4301, 88, 89, 'Magni.', '1563292001', 0, 1),
(4304, 198, 11, 'Ut.', '1563292001', 1, 1),
(4309, 172, 92, 'Nemo molestiae numquam.', '1563292001', 1, 0),
(4313, 203, 34, 'Dicta molestias autem.', '1563292001', 1, 1),
(4314, 173, 170, 'Fugiat optio vel quis unde.', '1563292001', 1, 1),
(4315, 195, 88, 'Voluptatem facilis praesentium ut.', '1563292001', 1, 1),
(4317, 163, 197, 'Hic a.', '1563292001', 0, 1),
(4318, 9, 176, 'Eius molestiae.', '1563292001', 0, 0),
(4319, 198, 176, 'Beatae quibusdam magni et.', '1563292001', 0, 0),
(4323, 100, 75, 'Reprehenderit fuga iure eum minus.', '1563292001', 0, 0),
(4324, 200, 5, 'Hic et eos.', '1563292001', 0, 0),
(4327, 200, 195, 'Voluptatem blanditiis adipisci aut modi.', '1563292001', 0, 1),
(4330, 79, 22, 'Facere sit esse rem et beatae.', '1563292001', 1, 1),
(4340, 74, 51, 'Velit vel.', '1563292001', 1, 0),
(4341, 98, 80, 'Quo quaerat qui ut.', '1563292001', 0, 0),
(4342, 38, 34, 'Voluptatibus ullam.', '1563292001', 0, 0),
(4346, 190, 23, 'Id reiciendis ut.', '1563292001', 0, 1),
(4347, 66, 101, 'Libero sapiente et earum.', '1563292001', 0, 0),
(4350, 21, 190, 'Perferendis voluptatem fuga.', '1563292001', 0, 0),
(4351, 169, 204, 'Sequi qui pariatur accusamus.', '1563292001', 0, 0),
(4355, 55, 36, 'Amet aperiam.', '1563292001', 1, 0),
(4358, 65, 93, 'Quidem ullam harum.', '1563292001', 0, 0),
(4359, 174, 158, 'Voluptas rem consectetur.', '1563292001', 1, 1),
(4360, 84, 17, 'Quod minima iste non sequi.', '1563292001', 0, 1),
(4361, 87, 167, 'Est odit.', '1563292001', 0, 1),
(4362, 186, 187, 'Voluptas ducimus deserunt.', '1563292001', 0, 1),
(4364, 86, 194, 'Quis ipsam.', '1563292001', 0, 0),
(4366, 20, 58, 'Suscipit rem.', '1563292001', 0, 1),
(4367, 66, 8, 'Tempora ducimus repellat ut.', '1563292001', 0, 0),
(4368, 194, 21, 'Laudantium minima.', '1563292001', 1, 1),
(4369, 197, 88, 'Laboriosam.', '1563292002', 0, 1),
(4370, 67, 67, 'Ea aut voluptatem quisquam.', '1563292002', 1, 1),
(4371, 15, 205, 'Odit enim dolor molestias repudiandae.', '1563292002', 1, 1),
(4372, 97, 52, 'Aut et maiores.', '1563292002', 0, 1),
(4374, 5, 100, 'Accusamus et.', '1563292002', 0, 0),
(4377, 69, 69, 'Corporis quia eos voluptas.', '1563292002', 0, 1),
(4381, 5, 179, 'Neque omnis voluptate asperiores qui.', '1563292002', 1, 1),
(4383, 99, 199, 'Dolor quaerat explicabo voluptas excepturi accusantium.', '1563292002', 0, 0),
(4386, 102, 38, 'Nemo aut rerum delectus.', '1563292002', 0, 0),
(4389, 57, 55, 'Qui architecto velit.', '1563292002', 0, 0),
(4390, 167, 8, 'Delectus.', '1563292002', 1, 1),
(4391, 46, 86, 'Tempora eos non.', '1563292002', 0, 0),
(4393, 170, 88, 'At.', '1563292002', 0, 1),
(4394, 45, 72, 'Aspernatur nemo.', '1563292002', 0, 0),
(4395, 163, 76, 'Fuga.', '1563292002', 0, 1),
(4396, 12, 36, 'Alias quia omnis quasi.', '1563292002', 1, 1),
(4397, 180, 76, 'Quasi.', '1563292002', 1, 0),
(4398, 168, 32, 'Aspernatur est consectetur repudiandae.', '1563292002', 1, 0),
(4402, 10, 54, 'Adipisci ex.', '1563292002', 1, 1),
(4404, 72, 203, 'Atque.', '1563292002', 0, 0),
(4405, 188, 47, 'Non eaque quaerat vero molestiae sunt.', '1563292002', 0, 0),
(4406, 96, 161, 'Vero aut est ut.', '1563292002', 1, 1),
(4409, 181, 4, 'Quia et aliquid blanditiis.', '1563292002', 1, 1),
(4410, 158, 205, 'Nulla vel error eveniet.', '1563292002', 0, 1),
(4412, 171, 197, 'Non delectus.', '1563292002', 1, 0),
(4415, 161, 163, 'Cupiditate dolor similique architecto deleniti architecto.', '1563292002', 0, 0),
(4417, 179, 65, 'Placeat.', '1563292002', 0, 1),
(4418, 5, 90, 'Quos qui impedit beatae.', '1563292002', 1, 0),
(4420, 177, 99, 'Fugiat non.', '1563292002', 0, 0),
(4421, 184, 81, 'Aut distinctio ex dolor.', '1563292002', 0, 0),
(4424, 22, 13, 'Nihil possimus consequatur tempore.', '1563292002', 0, 1),
(4426, 102, 172, 'Dicta culpa placeat aliquam.', '1563292002', 1, 0),
(4427, 76, 7, 'Possimus.', '1563292002', 1, 0),
(4428, 180, 59, 'Qui provident saepe architecto ipsum nostrum.', '1563292002', 1, 0),
(4430, 179, 202, 'Saepe dolor.', '1563292002', 1, 1),
(4431, 34, 91, 'Numquam culpa sint sed.', '1563292002', 1, 1),
(4434, 38, 92, 'Reiciendis nihil ullam qui.', '1563292002', 1, 1),
(4435, 76, 88, 'Maxime corporis.', '1563292002', 1, 0),
(4436, 59, 187, 'Ea voluptas.', '1563292002', 0, 0),
(4437, 59, 26, 'Fuga dolorem vitae fuga.', '1563292002', 1, 1),
(4441, 161, 194, 'Dolorem praesentium repudiandae sint.', '1563292002', 0, 1),
(4442, 43, 182, 'Fuga eius repudiandae sed amet.', '1563292002', 0, 0),
(4444, 24, 191, 'Voluptas.', '1563292002', 0, 1),
(4446, 179, 13, 'Voluptate veritatis.', '1563292002', 0, 1),
(4450, 92, 162, 'Explicabo sit.', '1563292002', 0, 0),
(4451, 34, 162, 'Nobis quasi provident blanditiis.', '1563292002', 1, 0),
(4452, 62, 39, 'Minus modi.', '1563292002', 0, 1),
(4453, 159, 192, 'Maxime unde sapiente.', '1563292002', 0, 0),
(4454, 4, 172, 'Quis voluptatem asperiores.', '1563292002', 1, 0),
(4455, 16, 21, 'Alias.', '1563292002', 0, 1),
(4456, 42, 33, 'Occaecati amet laboriosam explicabo ut.', '1563292002', 1, 0),
(4457, 45, 55, 'Impedit.', '1563292003', 0, 0),
(4462, 84, 19, 'Quidem temporibus ab.', '1563292003', 0, 1),
(4464, 198, 37, 'Dolores quo tempore iusto itaque.', '1563292003', 1, 0),
(4467, 203, 50, 'Itaque et non ad.', '1563292003', 0, 0),
(4470, 171, 23, 'Eum ex vero.', '1563292003', 0, 1),
(4473, 174, 1, 'Quia quo laboriosam ut.', '1563292003', 1, 1),
(4475, 15, 23, 'Recusandae id odio.', '1563292003', 1, 0),
(4478, 103, 204, 'Dolorem itaque reiciendis quisquam qui.', '1563292003', 1, 0),
(4479, 70, 201, 'Consequatur similique ea id veniam.', '1563292003', 0, 0),
(4481, 178, 56, 'Velit consequuntur eaque quibusdam.', '1563292003', 1, 1),
(4482, 82, 103, 'Omnis suscipit natus.', '1563292003', 0, 0),
(4484, 1, 92, 'Necessitatibus autem animi molestias.', '1563292003', 0, 0),
(4485, 43, 70, 'Dignissimos eos voluptates quia.', '1563292003', 0, 1),
(4488, 157, 79, 'Aspernatur quas nihil.', '1563292003', 0, 1),
(4490, 56, 94, 'Libero eveniet.', '1563292003', 1, 0),
(4492, 23, 78, 'In illo.', '1563292003', 0, 0),
(4493, 5, 61, 'Est pariatur eum.', '1563292003', 1, 0),
(4494, 21, 181, 'Qui.', '1563292003', 0, 0),
(4495, 189, 62, 'Cumque nisi dolor voluptas.', '1563292003', 1, 0),
(4497, 98, 13, 'Veniam officiis.', '1563292003', 1, 0),
(4499, 185, 193, 'Eligendi inventore harum consequuntur.', '1563292003', 1, 0),
(4501, 178, 86, 'Necessitatibus veniam.', '1563292003', 0, 1),
(4502, 189, 35, 'At magnam.', '1563292003', 1, 0),
(4503, 77, 30, 'Tempore dignissimos et.', '1563292003', 1, 0),
(4504, 99, 77, 'Beatae nihil consequuntur molestiae.', '1563292003', 0, 0),
(4507, 69, 94, 'Voluptatibus iusto voluptates.', '1563292003', 0, 0),
(4509, 40, 62, 'Sed est sit.', '1563292003', 0, 1),
(4510, 23, 83, 'Dolores nemo recusandae.', '1563292003', 0, 0),
(4512, 158, 177, 'Laborum architecto.', '1563292003', 0, 1),
(4513, 55, 78, 'Qui velit natus.', '1563292003', 1, 0),
(4515, 194, 188, 'Maiores.', '1563292003', 0, 0),
(4516, 63, 85, 'Repellendus asperiores dolorem saepe.', '1563292003', 1, 1),
(4517, 23, 201, 'At dolorem.', '1563292003', 1, 1),
(4520, 91, 79, 'Laborum repellat.', '1563292003', 0, 0),
(4521, 33, 73, 'Quidem aut maxime.', '1563292003', 1, 0),
(4522, 67, 104, 'Et provident incidunt delectus voluptas.', '1563292003', 0, 0),
(4524, 160, 181, 'Numquam accusamus sequi tempore.', '1563292003', 0, 1),
(4526, 99, 178, 'Distinctio aliquam temporibus fugit.', '1563292003', 0, 0),
(4529, 165, 28, 'Ea ut dolorem laborum quo sunt.', '1563292003', 0, 1),
(4531, 28, 170, 'Perspiciatis nihil qui.', '1563292003', 0, 1),
(4534, 94, 1, 'Veritatis quasi asperiores ab explicabo molestiae.', '1563292003', 1, 0),
(4535, 7, 186, 'Quis placeat necessitatibus.', '1563292003', 1, 1),
(4536, 58, 90, 'Eum nihil.', '1563292003', 1, 0),
(4537, 199, 182, 'Praesentium.', '1563292004', 1, 0),
(4539, 12, 204, 'Sed animi laudantium reiciendis et.', '1563292004', 0, 0),
(4545, 199, 28, 'Quo.', '1563292004', 0, 0),
(4546, 193, 31, 'Corrupti incidunt.', '1563292004', 1, 1),
(4549, 22, 167, 'Exercitationem aut.', '1563292004', 0, 0),
(4553, 8, 66, 'Quas provident natus.', '1563292004', 0, 0),
(4556, 187, 96, 'Rem.', '1563292004', 0, 0),
(4557, 23, 203, 'Blanditiis ducimus.', '1563292004', 1, 0),
(4558, 31, 65, 'Dolor a.', '1563292004', 0, 1),
(4559, 157, 46, 'Qui iure.', '1563292004', 1, 1),
(4560, 201, 99, 'Aut.', '1563292005', 1, 1),
(4561, 163, 37, 'Id fuga sed necessitatibus ut.', '1563292005', 1, 0),
(4562, 3, 168, 'Similique qui id.', '1563292005', 0, 0),
(4563, 202, 165, 'At atque velit.', '1563292005', 1, 0),
(4566, 171, 17, 'Nihil et ex at.', '1563292005', 0, 1),
(4567, 29, 168, 'Et consequatur.', '1563292005', 0, 1),
(4568, 51, 1, 'Dolores omnis voluptatem ut quidem.', '1563292005', 0, 1),
(4574, 24, 157, 'Et placeat et molestias.', '1563292005', 1, 1),
(4575, 177, 46, 'Quia at exercitationem.', '1563292005', 1, 0),
(4576, 62, 72, 'Qui nihil in.', '1563292005', 1, 0),
(4579, 41, 46, 'Reprehenderit et sit reprehenderit eum sed.', '1563292005', 1, 0),
(4581, 17, 68, 'Sed vitae.', '1563292005', 0, 0),
(4583, 40, 2, 'Iste aspernatur corrupti.', '1563292006', 1, 1),
(4586, 199, 65, 'Alias tempore aperiam.', '1563292006', 1, 1),
(4587, 25, 99, 'Nesciunt voluptas velit quod.', '1563292006', 0, 0),
(4588, 95, 77, 'Esse ipsum.', '1563292006', 0, 0),
(4591, 160, 99, 'Sint doloremque perspiciatis laborum.', '1563292006', 1, 1),
(4595, 184, 102, 'Rem perspiciatis harum hic cum.', '1563292006', 1, 0),
(4597, 47, 161, 'Commodi non.', '1563292006', 1, 0),
(4598, 100, 174, 'Corrupti harum.', '1563292006', 1, 1),
(4599, 54, 104, 'Cupiditate.', '1563292006', 1, 0),
(4602, 48, 102, 'Ducimus nihil labore.', '1563292006', 1, 1);
INSERT INTO `messages_list` (`id`, `userId`, `toId`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`) VALUES
(4603, 163, 4, 'Sint corrupti consequatur perferendis.', '1563292006', 0, 0),
(4605, 103, 95, 'Voluptatibus rerum quia.', '1563292006', 0, 1),
(4607, 59, 44, 'Velit et excepturi.', '1563292006', 1, 0),
(4610, 160, 158, 'Ipsum.', '1563292006', 0, 0),
(4611, 47, 40, 'Quam voluptatem.', '1563292006', 0, 0),
(4612, 6, 49, 'Ut ea ipsa.', '1563292006', 0, 1),
(4613, 156, 18, 'Alias odit id voluptas et nihil.', '1563292006', 1, 1),
(4616, 34, 5, 'Velit.', '1563292006', 0, 0),
(4618, 78, 183, 'Doloribus id vitae.', '1563292006', 1, 0),
(4620, 57, 188, 'Ullam et eligendi aut animi tempore.', '1563292006', 0, 1),
(4622, 42, 60, 'Dolor hic odit veniam et.', '1563292006', 1, 1),
(4623, 81, 66, 'Dicta.', '1563292006', 0, 1),
(4624, 182, 84, 'Tempora dolor aut.', '1563292006', 1, 0),
(4629, 104, 168, 'Et ipsum perferendis.', '1563292006', 0, 0),
(4630, 65, 66, 'Ab aut voluptas sunt est voluptatum.', '1563292007', 0, 0),
(4631, 55, 6, 'Deserunt et.', '1563292007', 0, 0),
(4632, 103, 204, 'Occaecati ipsa labore.', '1563292007', 1, 1),
(4634, 190, 193, 'Voluptate minus odio odit.', '1563292007', 0, 1),
(4637, 70, 11, 'Et unde.', '1563292007', 0, 0),
(4640, 15, 100, 'Cupiditate voluptatem magni.', '1563292007', 0, 0),
(4643, 58, 202, 'Modi enim enim corrupti voluptate.', '1563292007', 0, 0),
(4645, 160, 204, 'Libero dolorum accusantium sed.', '1563292007', 1, 0),
(4646, 173, 175, 'Magni non.', '1563292007', 1, 0),
(4648, 167, 84, 'Nobis suscipit nihil.', '1563292007', 1, 1),
(4652, 66, 166, 'Quia.', '1563292007', 1, 1),
(4653, 182, 205, 'Excepturi maxime.', '1563292007', 0, 0),
(4654, 176, 187, 'Quidem.', '1563292007', 1, 0),
(4656, 187, 56, 'Dolorum odit omnis ut voluptate.', '1563292007', 1, 1),
(4659, 96, 84, 'Praesentium assumenda est quam.', '1563292007', 0, 1),
(4664, 74, 167, 'Et consequatur et.', '1563292007', 0, 0),
(4666, 193, 188, 'Distinctio nostrum.', '1563292007', 1, 0),
(4667, 177, 192, 'Quam at vitae numquam nisi deserunt.', '1563292007', 1, 0),
(4668, 37, 183, 'Et officiis repellendus aperiam doloremque nesciunt.', '1563292007', 1, 0),
(4669, 101, 72, 'Ut quisquam ipsum possimus numquam.', '1563292007', 1, 0),
(4670, 13, 158, 'Voluptas officiis cum.', '1563292007', 0, 1),
(4672, 174, 17, 'Ipsum est est et.', '1563292007', 1, 0),
(4675, 33, 1, 'Esse reiciendis nihil.', '1563292007', 1, 0),
(4676, 181, 162, 'Inventore quibusdam porro pariatur laboriosam.', '1563292007', 1, 1),
(4678, 74, 60, 'Sed culpa.', '1563292007', 0, 0),
(4679, 33, 55, 'Maxime illo in nihil.', '1563292007', 1, 0),
(4680, 96, 96, 'Fuga.', '1563292007', 1, 1),
(4681, 172, 28, 'Ducimus quod delectus.', '1563292007', 1, 1),
(4684, 26, 178, 'Ut magni dolor sunt iusto.', '1563292007', 1, 0),
(4685, 166, 184, 'Et rerum.', '1563292007', 1, 1),
(4688, 164, 84, 'Rerum eligendi.', '1563292007', 1, 1),
(4689, 42, 86, 'Voluptatem.', '1563292007', 0, 1),
(4691, 100, 177, 'Incidunt impedit.', '1563292007', 0, 0),
(4692, 46, 3, 'Vel porro iste autem.', '1563292007', 1, 0),
(4695, 95, 202, 'Quo harum tempore delectus repudiandae earum.', '1563292007', 0, 0),
(4698, 160, 3, 'Ipsa aut.', '1563292007', 0, 0),
(4699, 35, 64, 'Voluptas nemo.', '1563292007', 0, 1),
(4700, 161, 83, 'Sunt.', '1563292007', 0, 0),
(4701, 4, 8, 'Eius totam expedita ea.', '1563292007', 0, 0),
(4702, 206, 67, 'Qui sapiente asperiores sed.', '1563292007', 0, 1),
(4703, 88, 174, 'Consequatur quae a.', '1563292008', 1, 1),
(4704, 178, 175, 'Et praesentium facere.', '1563292008', 0, 1),
(4706, 156, 205, 'Provident nobis.', '1563292008', 0, 0),
(4707, 177, 183, 'Sint aliquid iste eveniet quasi doloremque.', '1563292008', 1, 0),
(4708, 184, 43, 'Officiis minus sunt.', '1563292008', 0, 0),
(4709, 163, 51, 'Reiciendis et tempore at.', '1563292008', 0, 1),
(4713, 180, 73, 'Nihil.', '1563292008', 1, 0),
(4714, 65, 54, 'Iure id officiis molestiae.', '1563292008', 1, 1),
(4716, 99, 30, 'Quibusdam velit atque.', '1563292008', 0, 0),
(4718, 3, 21, 'Ratione aut sed id.', '1563292008', 1, 0),
(4719, 167, 201, 'In perspiciatis minima.', '1563292008', 0, 0),
(4721, 172, 89, 'Doloribus natus natus.', '1563292008', 0, 1),
(4725, 188, 193, 'In enim est aut aliquam.', '1563292008', 0, 0),
(4726, 82, 183, 'At.', '1563292008', 1, 0),
(4728, 96, 9, 'Consectetur eum unde suscipit.', '1563292008', 0, 0),
(4729, 16, 102, 'Nisi ut.', '1563292008', 1, 1),
(4730, 190, 195, 'Dolores provident quia impedit.', '1563292008', 1, 0),
(4731, 157, 167, 'Sapiente sunt aut.', '1563292008', 0, 1),
(4732, 88, 19, 'Error.', '1563292008', 0, 0),
(4733, 42, 82, 'Assumenda amet odio.', '1563292008', 1, 0),
(4734, 41, 84, 'Vel occaecati.', '1563292008', 1, 0),
(4736, 40, 190, 'Doloribus id voluptas.', '1563292009', 1, 0),
(4737, 7, 171, 'Cumque laborum.', '1563292009', 1, 1),
(4738, 179, 11, 'Rem est.', '1563292009', 1, 1),
(4740, 181, 13, 'Libero consequuntur dicta aut reprehenderit.', '1563292009', 0, 0),
(4742, 30, 188, 'Aut ex illo dolorem tempore.', '1563292009', 1, 0),
(4746, 37, 4, 'Inventore.', '1563292009', 0, 1),
(4749, 164, 160, 'Occaecati quisquam sint facere dolorem porro.', '1563292009', 0, 0),
(4750, 56, 95, 'Quaerat voluptatum reiciendis.', '1563292009', 1, 1),
(4752, 158, 6, 'Facere dolorem libero.', '1563292009', 0, 1),
(4758, 63, 182, 'Nam enim unde ut.', '1563292009', 1, 1),
(4760, 205, 95, 'Beatae laudantium vero aliquam modi.', '1563292009', 0, 1),
(4763, 49, 86, 'Qui aspernatur eaque voluptate impedit.', '1563292009', 0, 0),
(4764, 191, 75, 'Sunt.', '1563292009', 1, 0),
(4766, 203, 88, 'Reiciendis qui voluptas eius provident est.', '1563292009', 1, 0),
(4768, 69, 89, 'Aut delectus ratione adipisci.', '1563292009', 0, 0),
(4774, 24, 2, 'Magni amet.', '1563292009', 0, 0),
(4775, 200, 202, 'Soluta blanditiis enim.', '1563292010', 1, 1),
(4778, 88, 195, 'Minus dolor modi voluptates voluptatem.', '1563292010', 0, 1),
(4779, 180, 26, 'Dolores numquam.', '1563292010', 1, 1),
(4781, 68, 93, 'Animi ea facilis.', '1563292010', 0, 0),
(4782, 83, 69, 'Adipisci qui.', '1563292010', 0, 1),
(4783, 86, 79, 'Qui saepe nemo voluptate dolorem.', '1563292010', 1, 0),
(4785, 166, 68, 'Porro dolor.', '1563292010', 1, 0),
(4789, 158, 97, 'Error.', '1563292010', 1, 0),
(4790, 186, 169, 'Vel sapiente tempora.', '1563292010', 0, 0),
(4793, 43, 70, 'Unde.', '1563292010', 0, 1),
(4796, 192, 34, 'Magnam quia.', '1563292010', 1, 0),
(4801, 7, 55, 'Perspiciatis nihil.', '1563292010', 1, 0),
(4805, 93, 48, 'Vel quae.', '1563292010', 1, 1),
(4806, 67, 13, 'Culpa ut.', '1563292010', 1, 0),
(4807, 192, 185, 'Et consequatur in asperiores nihil id.', '1563292010', 1, 0),
(4809, 188, 23, 'Id quia similique.', '1563292010', 0, 1),
(4811, 163, 17, 'Cupiditate velit et aliquam.', '1563292010', 1, 0),
(4813, 205, 39, 'Voluptas qui.', '1563292011', 1, 0),
(4818, 3, 48, 'Quisquam fuga eum.', '1563292011', 1, 0),
(4819, 90, 91, 'Quaerat quia recusandae.', '1563292011', 0, 0),
(4822, 40, 23, 'Dolores rerum fuga corrupti.', '1563292011', 0, 0),
(4823, 170, 93, 'Iusto ratione.', '1563292011', 0, 1),
(4824, 82, 11, 'Aut omnis officia.', '1563292011', 1, 1),
(4826, 164, 54, 'Qui laborum aut.', '1563292011', 1, 0),
(4827, 195, 20, 'Deleniti sed eligendi.', '1563292011', 1, 1),
(4828, 6, 179, 'Dolorem eaque unde.', '1563292011', 0, 0),
(4829, 52, 58, 'Perspiciatis officia.', '1563292011', 0, 1),
(4830, 33, 180, 'Iure aspernatur.', '1563292011', 1, 0),
(4831, 10, 38, 'Rem quia dolorem.', '1563292011', 0, 0),
(4832, 196, 171, 'Doloremque libero pariatur.', '1563292011', 1, 0),
(4833, 5, 160, 'Ullam.', '1563292011', 0, 1),
(4836, 65, 76, 'Doloremque non deleniti.', '1563292011', 0, 0),
(4837, 85, 103, 'Odit beatae.', '1563292011', 1, 1),
(4838, 74, 84, 'Autem in optio voluptas.', '1563292011', 0, 0),
(4840, 74, 192, 'Laborum recusandae officiis.', '1563292012', 1, 0),
(4841, 97, 175, 'Tempore blanditiis nostrum.', '1563292012', 0, 1),
(4843, 28, 66, 'Eum illum similique.', '1563292012', 1, 0),
(4847, 43, 6, 'Incidunt est quia.', '1563292012', 1, 0),
(4849, 195, 43, 'Est et consequuntur velit quaerat.', '1563292012', 1, 0),
(4851, 156, 13, 'Dolor et.', '1563292012', 1, 1),
(4853, 12, 56, 'Labore quo porro.', '1563292012', 0, 1),
(4854, 156, 170, 'Qui ut dolor.', '1563292012', 1, 1),
(4858, 33, 187, 'Repudiandae.', '1563292012', 0, 1),
(4859, 76, 172, 'Qui velit at fugit et.', '1563292012', 0, 1),
(4861, 100, 73, 'Error tenetur.', '1563292012', 0, 0),
(4867, 29, 58, 'Quo aut dolorum animi dolorum.', '1563292012', 0, 0),
(4868, 100, 86, 'Ut distinctio aut.', '1563292012', 0, 1),
(4869, 173, 45, 'Perspiciatis.', '1563292013', 1, 0),
(4870, 201, 92, 'Architecto pariatur voluptatem soluta.', '1563292013', 0, 0),
(4871, 83, 74, 'At dolore dolore exercitationem.', '1563292013', 0, 0),
(4873, 206, 61, 'Sit ullam.', '1563292013', 0, 0),
(4883, 189, 98, 'Necessitatibus neque nesciunt officia.', '1563292013', 1, 0),
(4884, 203, 1, 'Non inventore quae.', '1563292013', 0, 1),
(4885, 73, 102, 'Id sed dignissimos facilis asperiores.', '1563292013', 1, 1),
(4886, 15, 26, 'Cumque harum quo.', '1563292013', 1, 0),
(4889, 88, 3, 'Aut occaecati quis.', '1563292013', 1, 0),
(4891, 29, 8, 'Mollitia beatae fugiat.', '1563292013', 1, 0),
(4893, 29, 97, 'Qui omnis quia.', '1563292013', 1, 0),
(4894, 34, 205, 'Ab rem voluptate ut.', '1563292013', 1, 1),
(4895, 81, 181, 'Non impedit.', '1563292014', 0, 1),
(4896, 63, 162, 'Tenetur asperiores optio.', '1563292014', 0, 1),
(4897, 83, 27, 'Iure.', '1563292014', 1, 1),
(4898, 12, 24, 'Ut totam magnam facere iure.', '1563292014', 1, 0),
(4901, 160, 6, 'Maxime facilis.', '1563292014', 0, 0),
(4904, 205, 95, 'Quam delectus porro.', '1563292014', 0, 1),
(4905, 55, 171, 'Ipsam mollitia.', '1563292014', 1, 1),
(4906, 102, 12, 'Labore fugit ipsum.', '1563292014', 1, 0),
(4909, 164, 54, 'Voluptatem nihil dolores.', '1563292014', 0, 1),
(4910, 187, 62, 'At distinctio quia impedit.', '1563292014', 0, 0),
(4914, 25, 8, 'Quos reprehenderit.', '1563292014', 1, 1),
(4916, 18, 183, 'Quod quod minima.', '1563292014', 0, 0),
(4918, 76, 66, 'Fuga rerum veritatis nam consequatur.', '1563292014', 0, 0),
(4919, 97, 51, 'Qui nihil.', '1563292014', 0, 0),
(4920, 39, 56, 'Doloribus et corrupti.', '1563292014', 1, 0),
(4922, 157, 27, 'Est quibusdam.', '1563292014', 0, 1),
(4923, 2, 49, 'Velit doloremque minus quibusdam non.', '1563292014', 1, 1),
(4925, 38, 198, 'Accusantium quos enim dolorem.', '1563292014', 1, 1),
(4927, 53, 170, 'Distinctio quia consequatur nostrum.', '1563292014', 0, 1),
(4929, 173, 34, 'Consequatur qui.', '1563292014', 1, 0),
(4930, 28, 57, 'Magni voluptatibus.', '1563292014', 1, 0),
(4931, 13, 22, 'Et.', '1563292014', 1, 0),
(4933, 20, 204, 'Est iste doloremque.', '1563292014', 0, 0),
(4934, 17, 54, 'Eum laboriosam nemo omnis eligendi consectetur.', '1563292014', 1, 0),
(4935, 68, 19, 'At omnis reprehenderit.', '1563292014', 0, 1),
(4937, 160, 205, 'Et ratione veniam praesentium.', '1563292014', 1, 0),
(4938, 68, 197, 'Distinctio est non quod quia.', '1563292014', 1, 1),
(4939, 24, 101, 'Praesentium dolore.', '1563292014', 0, 0),
(4940, 32, 10, 'Blanditiis itaque.', '1563292014', 1, 1),
(4941, 17, 82, 'Dolorem provident sit.', '1563292014', 0, 1),
(4944, 16, 177, 'Nesciunt vel illo sit.', '1563292014', 0, 1),
(4945, 9, 178, 'Sit et.', '1563292014', 0, 0),
(4951, 188, 164, 'Debitis eligendi et.', '1563292014', 0, 1),
(4954, 41, 25, 'Quas est.', '1563292014', 1, 0),
(4955, 34, 158, 'Autem mollitia autem.', '1563292014', 1, 0),
(4956, 190, 158, 'Quia iusto sapiente voluptatem omnis.', '1563292014', 1, 1),
(4958, 11, 2, 'Quos sed quo eum.', '1563292014', 1, 0),
(4960, 31, 58, 'Sit iste.', '1563292014', 1, 0),
(4961, 47, 31, 'Saepe eaque.', '1563292014', 0, 1),
(4962, 35, 23, 'Aliquid tempore aperiam.', '1563292014', 1, 1),
(4963, 172, 62, 'Suscipit incidunt quibusdam.', '1563292014', 1, 0),
(4964, 38, 163, 'Dignissimos ipsum.', '1563292014', 1, 0),
(4968, 24, 158, 'Nostrum quos cupiditate.', '1563292014', 0, 0),
(4970, 182, 36, 'Architecto beatae.', '1563292014', 1, 0),
(4973, 69, 206, 'In non aut.', '1563292015', 0, 0),
(4979, 59, 169, 'Qui illum sed ratione magni voluptatem.', '1563292015', 1, 1),
(4981, 157, 60, 'Quibusdam et harum.', '1563292015', 1, 1),
(4983, 84, 181, 'Eos quibusdam.', '1563292015', 0, 0),
(4984, 41, 51, 'Molestiae dolor.', '1563292015', 0, 0),
(4987, 168, 189, 'Impedit.', '1563292015', 0, 0),
(4990, 76, 163, 'Eaque debitis eligendi minima et.', '1563292015', 0, 0),
(4991, 92, 200, 'Necessitatibus error corrupti voluptas totam consequatur.', '1563292015', 0, 1),
(4992, 181, 79, 'Sunt qui quam.', '1563292015', 0, 0),
(4994, 171, 38, 'Eaque voluptatum aut id.', '1563292015', 0, 1),
(4995, 200, 1, 'Sint.', '1563292015', 1, 1),
(4996, 16, 45, 'Pariatur in aut.', '1563292015', 1, 1),
(4997, 84, 69, 'Non molestiae.', '1563292015', 0, 0),
(5001, 161, 78, 'Non.', '1563292015', 0, 0),
(5002, 78, 162, 'Ut et ipsam.', '1563292015', 1, 1),
(5003, 161, 157, 'Asperiores aperiam optio beatae.', '1563292015', 0, 0),
(5005, 39, 92, 'Saepe neque dignissimos nam saepe.', '1563292015', 0, 0),
(5006, 61, 16, 'Vel saepe quia.', '1563292015', 0, 1),
(5008, 41, 49, 'Et.', '1563292015', 1, 0),
(5012, 159, 26, 'Enim quia deserunt et quia consectetur.', '1563292015', 1, 0),
(5014, 3, 78, 'Commodi.', '1563292015', 1, 1),
(5016, 39, 185, 'Optio soluta sunt.', '1563292015', 0, 1),
(5017, 156, 13, 'Doloremque nihil ut.', '1563292015', 1, 0),
(5018, 33, 81, 'Est vel laudantium deleniti.', '1563292015', 1, 1),
(5020, 176, 15, 'Aut dolorem vel eligendi.', '1563292015', 1, 0),
(5023, 62, 43, 'Possimus tempora.', '1563292015', 0, 1),
(5024, 8, 95, 'Consectetur quas.', '1563292015', 0, 0),
(5026, 92, 63, 'Assumenda fugiat fuga.', '1563292015', 1, 0),
(5027, 29, 52, 'Tempora ea quia.', '1563292016', 0, 0),
(5028, 69, 89, 'Qui molestiae debitis qui.', '1563292016', 0, 0),
(5030, 190, 190, 'Quod labore.', '1563292016', 1, 1),
(5032, 35, 11, 'Exercitationem consectetur enim.', '1563292016', 1, 1),
(5033, 64, 165, 'Nesciunt animi debitis.', '1563292016', 1, 0),
(5035, 10, 61, 'Facere veritatis.', '1563292016', 0, 1),
(5036, 54, 163, 'Quia deserunt rerum.', '1563292016', 0, 1),
(5037, 158, 4, 'Laboriosam voluptatem quos.', '1563292016', 1, 1),
(5041, 203, 191, 'Ipsa molestiae.', '1563292016', 0, 0),
(5042, 102, 206, 'Est numquam molestiae molestiae fugit qui.', '1563292016', 0, 0),
(5043, 19, 8, 'Error.', '1563292016', 0, 0),
(5044, 206, 83, 'Magnam laudantium aspernatur.', '1563292016', 0, 0),
(5045, 199, 61, 'Id.', '1563292016', 1, 0),
(5046, 206, 187, 'Corrupti aperiam reiciendis.', '1563292016', 0, 0),
(5047, 104, 93, 'Consequatur fugiat impedit qui.', '1563292016', 0, 1),
(5048, 36, 71, 'Assumenda et iste commodi.', '1563292016', 0, 0),
(5050, 182, 191, 'Earum eos est.', '1563292016', 1, 1);

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
(1, 'Cassandre Anderson', 'parents', 'Quasi et autem est enim voluptate hic quidem fugit nostrum explicabo et.', 1563291997, 'Rhett Predovic'),
(2, 'Prof. Keyon Kassulke MD', 'students', 'Doloremque maxime qui molestiae ut.', 1563291997, 'Giuseppe Welch'),
(3, 'Mr. Ken Hartmann II', 'employees', 'Veniam odio aut rem.', 1563291997, 'Gus Douglas'),
(4, 'Ole Mosciski', 'teachers', 'Ad molestiae impedit est ratione.', 1563291997, 'Mrs. Antoinette Koch DDS'),
(5, 'Mr. Florencio Volkman Sr.', 'students', 'Minus odio saepe veritatis aut qui.', 1563291997, 'Susanna McDermott'),
(6, 'Blake Dietrich', 'teachers', 'Nihil blanditiis quibusdam labore iure ullam.', 1563291997, 'Chauncey Jacobs'),
(7, 'Raheem Morissette', 'employees', 'Minima quibusdam pariatur dignissimos laborum sit veritatis.', 1563291997, 'Sierra Ortiz'),
(8, 'Wilfred Gaylord', 'students', 'Dolorum earum incidunt voluptatibus dignissimos.', 1563291997, 'Elda Gulgowski'),
(9, 'Ethyl Purdy', 'parents', 'At dolorum quos aut est officiis et sit odio mollitia nemo aut.', 1563291997, 'Miss Annabell Sauer'),
(10, 'Creola Prohaska', 'students', 'Blanditiis non vitae deleniti officiis et quia ullam.', 1563291997, 'Keenan Stanton'),
(11, 'Wilmer Tillman PhD', 'students', 'Sit facere et corrupti.', 1563291997, 'Ari Labadie II'),
(12, 'Ivah Jenkins', 'parents', 'Aut ex eos eos animi velit.', 1563291997, 'Nathanael McLaughlin I'),
(13, 'Burley Schmitt DDS', 'employees', 'Occaecati qui repellat saepe saepe.', 1563291997, 'Buford Ortiz'),
(14, 'Dariana Bechtelar', 'employees', 'Veniam vero molestiae quam corporis consequatur libero.', 1563291997, 'Heather Veum Jr.'),
(15, 'Dr. Jasper Breitenberg DVM', 'students', 'Numquam corporis consequatur.', 1563291997, 'Itzel Spinka'),
(16, 'Mrs. Burnice Kohler Jr.', 'parents', 'Reiciendis pariatur in quam reprehenderit commodi quae sed amet eum.', 1563291997, 'Faye Bayer'),
(17, 'Rick Veum IV', 'employees', 'Natus voluptatibus possimus delectus dolor et.', 1563291997, 'Mr. Kristoffer Herzog III'),
(18, 'April Dietrich', 'parents', 'Suscipit eveniet sit debitis delectus consectetur.', 1563291997, 'Prof. Addison Fadel MD'),
(19, 'Berneice Von', 'students', 'Incidunt animi exercitationem velit non id deleniti asperiores.', 1563291997, 'Camden Stehr'),
(20, 'Lexi Rolfson', 'students', 'In illo odit magni labore.', 1563291997, 'Ellis Nicolas'),
(21, 'Thea Runte III', 'students', 'Ad architecto nihil reprehenderit unde.', 1563291997, 'Prof. Noemy McKenzie V'),
(22, 'Mr. Otto Kunze', 'parents', 'In et dolorem commodi.', 1563291997, 'Jeanette Howell'),
(23, 'Thea Abbott', 'employees', 'Dolore qui ut ipsa.', 1563291997, 'Magdalen Farrell PhD'),
(24, 'Bud Nienow', 'students', 'Qui quidem fugiat qui quos impedit quasi maiores soluta.', 1563291997, 'Wellington Huels DDS'),
(25, 'Selina Conroy', 'parents', 'Optio repellendus non nemo ut ut est.', 1563291997, 'Prof. Charley Bernier PhD'),
(26, 'Leif Labadie MD', 'students', 'Facere recusandae itaque molestiae omnis magni.', 1563291997, 'Nathanial Collier'),
(27, 'Erin Russel III', 'teachers', 'Laboriosam saepe eaque adipisci quidem.', 1563291997, 'Miss Emily Kilback'),
(28, 'Mr. Gage Jacobi', 'employees', 'Voluptate cupiditate omnis deleniti adipisci ut quasi hic voluptatibus vel.', 1563291997, 'Pasquale Altenwerth I'),
(29, 'Dr. Etha Langworth', 'students', 'Aut vero molestiae tenetur.', 1563291997, 'Nickolas Hodkiewicz II'),
(30, 'Alessandra Corwin', 'students', 'Delectus consequuntur hic omnis dicta illo asperiores alias.', 1563291997, 'Mrs. Maurine Watsica'),
(31, 'Hillary Carroll', 'parents', 'Sapiente praesentium magni et.', 1563291997, 'Prof. Bennett Kreiger'),
(32, 'Rebeka O\'Hara', 'parents', 'Rerum ut necessitatibus voluptatum rerum qui ut autem et sapiente deserunt.', 1563291997, 'Ms. Shemar Johnston Jr.'),
(33, 'Brenna Fahey', 'employees', 'In est reiciendis.', 1563291997, 'Brandon Yundt'),
(34, 'Marta Lang', 'parents', 'Ea adipisci voluptatem quia accusamus blanditiis quo commodi.', 1563291997, 'Willard Terry'),
(35, 'Abelardo Lubowitz', 'students', 'Quia aut explicabo blanditiis earum numquam et.', 1563291997, 'Lisa Wyman'),
(36, 'Amir Rempel', 'employees', 'Explicabo non quia modi omnis.', 1563291997, 'Jordan Greenfelder'),
(37, 'Adan Dooley', 'employees', 'Rerum dolorum nobis a et vel.', 1563291997, 'Taryn Orn'),
(38, 'Nyasia Schaden', 'teachers', 'Delectus ipsam voluptatem maiores maxime est aspernatur accusantium ipsum.', 1563291997, 'Carmella Satterfield'),
(39, 'Lane Douglas', 'teachers', 'Quia ut est dolor dicta illum.', 1563291997, 'Camille Jaskolski V'),
(40, 'Dennis Haley', 'parents', 'Vitae placeat sunt qui rerum quo est qui.', 1563291997, 'Jovanny Goyette'),
(41, 'Roxane Tillman', 'teachers', 'Rem eos accusantium officia numquam voluptas.', 1563291997, 'Mertie Mayert Jr.'),
(42, 'Ms. Lisette D\'Amore MD', 'students', 'Culpa cumque est ad nisi nulla at vero qui assumenda.', 1563291997, 'Eloisa Lemke'),
(43, 'Reilly Leffler', 'teachers', 'Sed vel in nam ea.', 1563291997, 'Nicola Nader'),
(44, 'Jayce Nolan', 'students', 'Iusto in earum autem.', 1563291997, 'Kane Dooley'),
(45, 'Mr. Arnaldo Erdman', 'teachers', 'Ea blanditiis amet labore unde non.', 1563291997, 'Tierra Braun'),
(46, 'Conner Doyle Jr.', 'employees', 'Aut fugit maiores vero optio corrupti eaque illum qui nam.', 1563291997, 'Prof. Ryder Lesch I'),
(47, 'Lance Dach', 'students', 'Doloremque eum quo quidem aliquam ut vel.', 1563291997, 'Willy Kreiger'),
(48, 'Elta Tremblay Sr.', 'students', 'Sit qui harum.', 1563291997, 'Mrs. Leta Stehr'),
(49, 'Maiya Waelchi', 'parents', 'Accusantium repellat ratione vero qui.', 1563291997, 'Freeda Lynch'),
(50, 'Mrs. Darlene Corkery II', 'parents', 'Est fugiat ipsum sit neque.', 1563291997, 'Samir Williamson');

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
(1, 'Quis repellat molestias.', 'Non asperiores est vel aliquam illum.', 'parents', 1563291995, '', 1, 1563291995),
(2, 'Vel aspernatur.', 'Alias quas ratione distinctio nobis qui vel dicta.', 'teacher', 1563291995, '', 0, 1563291995),
(3, 'Consequatur eaque at.', 'Vel non ut voluptatem porro fugit aut eveniet dolorem aut.', 'all', 1563291995, '', 0, 1563291995),
(4, 'Voluptatum itaque incidunt.', 'Dolorum aut reiciendis corrupti ut aut ea.', 'parents', 1563291995, '', 0, 1563291995),
(5, 'Nemo sunt eligendi.', 'Assumenda aut quas vel qui expedita modi qui quas doloremque.', 'teacher', 1563291995, '', 0, 1563291995),
(6, 'Minima minus nihil incidunt.', 'Enim nostrum qui dignissimos voluptatem id eligendi tenetur qui et aspernatur rerum laboriosam.', 'all', 1563291995, '', 1, 1563291995),
(7, 'Aperiam provident accusamus.', 'Omnis ut ea occaecati corporis similique dolore rem.', 'students', 1563291995, '', 1, 1563291995),
(8, 'Animi ut dolorum.', 'Qui quae neque explicabo dolorum voluptas ad.', 'all', 1563291995, '', 1, 1563291995),
(9, 'Iste quasi.', 'Sint eligendi libero modi qui.', 'teacher', 1563291995, '', 0, 1563291995),
(10, 'Vero nam quidem.', 'Est eos tempora veritatis omnis occaecati ullam accusamus id.', 'parents', 1563291995, '', 1, 1563291995),
(11, 'Adipisci sint.', 'Ducimus eligendi ut totam dolore consequatur est deserunt voluptates quo debitis.', 'students', 1563291995, '', 0, 1563291995),
(12, 'Aut qui.', 'Similique qui dolorem ut error animi.', 'all', 1563291995, '', 0, 1563291995),
(13, 'Aut dolorem quaerat fugit.', 'Ut et dicta iste reiciendis aut nostrum atque et nihil libero saepe omnis.', 'students', 1563291995, '', 0, 1563291995),
(14, 'Sed eum nihil voluptatum.', 'Voluptatum nobis consequatur commodi mollitia a dolor totam eligendi quo quia.', 'all', 1563291995, '', 0, 1563291995),
(15, 'Illum vitae quos.', 'Rerum reiciendis debitis ea placeat qui sed.', 'parents', 1563291995, '', 0, 1563291995),
(16, 'Inventore nihil velit nulla.', 'Et velit asperiores vero est nihil dolor dolores ducimus laborum ut tempore dolores.', 'parents', 1563291995, '', 1, 1563291995),
(17, 'Accusantium quasi doloribus qui.', 'Distinctio esse eos vero odio recusandae numquam sapiente.', 'teacher', 1563291995, '', 0, 1563291995),
(18, 'Voluptas eius aspernatur.', 'Necessitatibus sed fugit quaerat ut et corrupti sunt velit rerum enim sed.', 'all', 1563291995, '', 1, 1563291995),
(19, 'Sit quos in.', 'Ipsam fugit facere sed qui excepturi pariatur suscipit odio in facere.', 'teacher', 1563291995, '', 1, 1563291995),
(20, 'Rem quia dolorem iusto dolor dignissimos.', 'Et unde sint dolores quia modi asperiores consectetur ut illum.', 'students', 1563291995, '', 1, 1563291995);

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
(1, 'hic_343', 'Et dolores eveniet voluptate culpa dolores impedit.', 115, 'Repellat qui modi laboriosam ipsam quia voluptatibus neque.', 100, 0, 0, 990, 1, 1563299015, 1563777313, 0, NULL, NULL, NULL, NULL, 0, '0'),
(2, 'velit_132', NULL, 121, 'Totam officiis deserunt omnis ad sed molestiae vel.', 420, 44, 0, 680, 0, 1563299015, 1563599244, 0, NULL, NULL, NULL, NULL, 0, '0'),
(3, 'ratione_198', NULL, 112, 'Sapiente quis error in aut nisi perferendis.', 570, 24, 0, 210, 1, 1563299015, 1564276664, 0, NULL, NULL, NULL, NULL, 0, '0'),
(4, 'ut_377', 'Optio odit enim aut repellendus mollitia quis qui aut.', 122, 'Labore voluptatem doloribus et quas ab amet.', 890, 15, 17, 80, 1, 1563299015, 1564109476, 0, NULL, NULL, NULL, NULL, 0, '0'),
(5, 'beatae_361', NULL, 110, 'Illum est est error sit.', 280, 13, 0, 450, 0, 1563299015, 1564140243, 0, NULL, NULL, NULL, NULL, 0, '0'),
(6, 'rerum_990', NULL, 125, 'Accusantium cumque autem possimus aliquam.', 610, 28, 14, 620, 1, 1563299015, 1564067376, 0, NULL, NULL, NULL, NULL, 1, '0'),
(7, 'earum_420', 'Est non debitis rerum dolorem dolorum neque.', 105, 'Quo ea rerum numquam corporis autem expedita rerum.', 860, 32, 0, 640, 0, 1563299015, 1563680679, 0, NULL, NULL, NULL, NULL, 0, '0'),
(8, 'aperiam_815', NULL, 119, 'Ea debitis omnis aliquid.', 920, 0, 15, 110, 1, 1563299015, 1563662347, 0, NULL, NULL, NULL, NULL, 1, '0'),
(9, 'eos_864', 'Molestiae reiciendis omnis veniam sunt id expedita ad.', 105, 'Dolores voluptate nostrum voluptatibus unde quis.', 830, 28, 8, 710, 1, 1563299015, 1563674649, 0, NULL, NULL, NULL, NULL, 0, '0'),
(10, 'aliquam_700', 'Tempore quia earum sunt reiciendis unde id error voluptatibus omnis vel asperiores.', 118, 'Doloremque nisi magnam sint dolore quos esse.', 620, 26, 44, 100, 0, 1563299015, 1563616332, 0, NULL, NULL, NULL, NULL, 0, '0'),
(11, 'rem_788', 'Sint dolorem illo pariatur neque praesentium sed adipisci est.', 115, 'Ut dolorum id omnis voluptatibus suscipit corrupti delectus.', 420, 0, 0, 770, 0, 1563299015, 1564164921, 0, NULL, NULL, NULL, NULL, 0, '0'),
(12, 'reprehenderit_812', NULL, 121, 'Et repellendus natus placeat ut voluptates neque.', 600, 15, 35, 450, 0, 1563299015, 1563915280, 0, NULL, NULL, NULL, NULL, 1, '0'),
(13, 'eos_410', 'Et tempore debitis dolor est officia sapiente distinctio vitae quia excepturi.', 120, 'Id corrupti totam et minus voluptate nobis.', 480, 0, 40, 660, 1, 1563299015, 1563896694, 0, NULL, NULL, NULL, NULL, 1, '0'),
(14, 'temporibus_646', 'Nihil voluptas totam laudantium enim quia doloribus nihil distinctio rem et non.', 123, 'Voluptatum voluptas cum ipsa natus.', 380, 0, 0, 950, 0, 1563299015, 1563578369, 0, NULL, NULL, NULL, NULL, 1, '0'),
(15, 'impedit_135', 'In dolores sit aliquid ducimus iure rerum.', 122, 'Illum accusamus fuga voluptas hic qui molestiae architecto.', 520, 0, 0, 440, 0, 1563299015, 1563785000, 0, NULL, NULL, NULL, NULL, 1, '0'),
(16, 'earum_884', NULL, 105, 'Possimus quia officiis beatae omnis omnis.', 310, 31, 17, 490, 0, 1563299015, 1563900487, 0, NULL, NULL, NULL, NULL, 1, '0'),
(17, 'consequuntur_139', 'Tempore voluptatem repudiandae et eligendi quis vitae eos in.', 113, 'Dolorum optio est et numquam nihil officiis.', 100, 0, 0, 330, 0, 1563299015, 1563895372, 0, NULL, NULL, NULL, NULL, 0, '0'),
(18, 'in_557', NULL, 112, 'Quas odit labore consequuntur sunt.', 620, 4, 21, 90, 0, 1563299015, 1563709544, 0, NULL, NULL, NULL, NULL, 0, '0'),
(19, 'sed_449', NULL, 116, 'Ad ad aliquam autem sunt quos.', 770, 32, 0, 790, 0, 1563299015, 1564144284, 0, NULL, NULL, NULL, NULL, 0, '0'),
(20, 'omnis_457', 'Ut in tempore dolores et consectetur corporis perspiciatis ratione possimus molestias.', 121, 'Occaecati distinctio quae eligendi sed quia provident rerum.', 900, 0, 0, 110, 1, 1563299015, 1563460562, 0, NULL, NULL, NULL, NULL, 0, '0'),
(21, 'est_182', NULL, 116, 'Est quisquam optio id cumque maxime et.', 450, 9, 0, 100, 0, 1563299015, 1563543080, 0, NULL, NULL, NULL, NULL, 0, '0'),
(22, 'sit_711', 'Voluptatibus asperiores quisquam ut reprehenderit quam dolorem molestiae.', 121, 'Illo debitis tempore est totam ea culpa nemo.', 140, 49, 7, 530, 1, 1563299015, 1564253949, 0, NULL, NULL, NULL, NULL, 1, '0'),
(23, 'sed_382', 'Est harum omnis quis deleniti est commodi similique.', 108, 'Enim pariatur molestias ut voluptatem esse.', 200, 11, 0, 420, 1, 1563299015, 1563473835, 0, NULL, NULL, NULL, NULL, 0, '0'),
(24, 'voluptas_338', 'Quas quos atque id nostrum in quas architecto soluta.', 113, 'Et aut sunt non unde illum cupiditate.', 990, 2, 2, 210, 1, 1563299015, 1563856192, 0, NULL, NULL, NULL, NULL, 1, '0'),
(25, 'odio_619', 'Id neque animi dicta possimus dicta.', 122, 'Praesentium quis necessitatibus veritatis vel.', 370, 0, 45, 230, 0, 1563299015, 1564139615, 0, NULL, NULL, NULL, NULL, 1, '0'),
(26, 'facilis_859', NULL, 121, 'Voluptas non ipsa incidunt velit.', 990, 0, 18, 820, 1, 1563299015, 1563930751, 0, NULL, NULL, NULL, NULL, 0, '0'),
(27, 'magni_486', NULL, 121, 'Aut voluptatem molestiae minima ipsam voluptas.', 310, 0, 49, 800, 1, 1563299015, 1563572589, 0, NULL, NULL, NULL, NULL, 0, '0'),
(28, 'deleniti_970', 'Illum doloribus illum error ut cupiditate quas.', 112, 'Esse pariatur dolores et ut omnis sit nisi.', 720, 22, 0, 60, 1, 1563299015, 1564244179, 0, NULL, NULL, NULL, NULL, 1, '0'),
(29, 'qui_353', NULL, 112, 'Reprehenderit tempore nam nesciunt.', 190, 33, 21, 90, 0, 1563299015, 1563493954, 0, NULL, NULL, NULL, NULL, 0, '0'),
(30, 'nostrum_630', 'Quis facilis iste necessitatibus adipisci dolores.', 112, 'Quia rerum aut ut perspiciatis.', 300, 9, 0, 660, 0, 1563299015, 1563755369, 0, NULL, NULL, NULL, NULL, 0, '0'),
(31, 'ratione_959', 'Consequatur et cupiditate ex reprehenderit ut.', 110, 'Deleniti temporibus rerum consectetur voluptate minima.', 540, 1, 0, 820, 1, 1563299015, 1563967059, 0, NULL, NULL, NULL, NULL, 1, '0'),
(32, 'ut_498', NULL, 107, 'Fugit eum inventore tempore unde libero.', 650, 49, 48, 870, 1, 1563299015, 1563555508, 0, NULL, NULL, NULL, NULL, 1, '0'),
(33, 'magni_378', NULL, 119, 'Voluptatem voluptates numquam consequatur ut debitis.', 600, 5, 28, 980, 1, 1563299015, 1564252634, 0, NULL, NULL, NULL, NULL, 1, '0'),
(34, 'quam_348', 'Temporibus ratione ratione error est id quae.', 116, 'Blanditiis aut odit vel molestiae amet.', 930, 16, 0, 70, 1, 1563299015, 1563741698, 0, NULL, NULL, NULL, NULL, 1, '0'),
(35, 'aspernatur_526', NULL, 117, 'Placeat minima sapiente omnis.', 710, 45, 0, 370, 1, 1563299015, 1563431480, 0, NULL, NULL, NULL, NULL, 1, '0'),
(36, 'id_825', 'Officia similique dicta quaerat qui voluptatibus totam hic aspernatur est similique.', 107, 'Consequuntur molestiae est culpa a.', 220, 4, 42, 930, 1, 1563299015, 1563585329, 0, NULL, NULL, NULL, NULL, 1, '0'),
(37, 'omnis_137', 'Totam qui magnam sapiente doloremque est.', 114, 'Cupiditate amet nesciunt eius ullam iure.', 800, 0, 0, 640, 0, 1563299015, 1563628378, 0, NULL, NULL, NULL, NULL, 1, '0'),
(38, 'ea_712', NULL, 121, 'Quam sit amet voluptatem voluptatem magni tempora.', 890, 21, 0, 350, 1, 1563299015, 1564082032, 0, NULL, NULL, NULL, NULL, 1, '0'),
(39, 'quas_684', 'Enim molestias eligendi qui voluptatum hic.', 108, 'Dolorem doloribus ut ab beatae.', 690, 36, 0, 700, 1, 1563299015, 1563539946, 0, NULL, NULL, NULL, NULL, 1, '0'),
(40, 'eos_542', NULL, 113, 'Cumque perferendis amet dignissimos eius numquam sit et quasi.', 340, 8, 28, 240, 1, 1563299015, 1564173986, 0, NULL, NULL, NULL, NULL, 0, '0'),
(41, 'corporis_221', 'Itaque id velit necessitatibus et unde.', 106, 'Tempora cupiditate eum mollitia nihil est.', 600, 22, 0, 620, 0, 1563299015, 1563739390, 0, NULL, NULL, NULL, NULL, 1, '0'),
(42, 'ut_537', 'Unde et nisi aut rerum dolor architecto repudiandae animi ea incidunt.', 113, 'Accusantium corrupti ex deleniti nisi sint animi.', 740, 0, 5, 1000, 0, 1563299016, 1563694432, 0, NULL, NULL, NULL, NULL, 0, '0'),
(43, 'pariatur_425', NULL, 121, 'Voluptas sed iure qui et.', 310, 0, 15, 340, 0, 1563299016, 1563833821, 0, NULL, NULL, NULL, NULL, 0, '0'),
(44, 'facilis_813', 'Rerum omnis sit sint veniam voluptates voluptatibus sit officia nam id.', 116, 'Asperiores soluta quasi ea necessitatibus expedita dolore accusantium.', 480, 0, 30, 60, 1, 1563299016, 1564260922, 0, NULL, NULL, NULL, NULL, 1, '0'),
(45, 'omnis_491', NULL, 107, 'Voluptatum est doloribus est porro voluptatum maxime tempore.', 320, 15, 0, 880, 0, 1563299016, 1563935335, 0, NULL, NULL, NULL, NULL, 1, '0'),
(46, 'necessitatibus_635', NULL, 112, 'Natus aut sunt doloremque.', 210, 6, 0, 630, 0, 1563299016, 1563665954, 0, NULL, NULL, NULL, NULL, 0, '0'),
(47, 'accusantium_293', 'Dolores adipisci et sed reprehenderit et eligendi id.', 110, 'Id commodi dicta quo ut.', 780, 0, 7, 920, 1, 1563299016, 1564041942, 0, NULL, NULL, NULL, NULL, 1, '0'),
(48, 'voluptatem_671', NULL, 123, 'Voluptatem quisquam rerum voluptatibus laudantium similique mollitia.', 670, 20, 0, 220, 0, 1563299016, 1563904533, 0, NULL, NULL, NULL, NULL, 0, '0'),
(49, 'aliquam_931', NULL, 118, 'Odio veniam voluptatem magni hic debitis quia quae aut.', 580, 0, 0, 520, 0, 1563299016, 1564200553, 0, NULL, NULL, NULL, NULL, 0, '0'),
(50, 'debitis_354', NULL, 121, 'Numquam impedit sed enim accusamus necessitatibus explicabo quidem.', 410, 0, 0, 870, 0, 1563299016, 1563961696, 0, NULL, NULL, NULL, NULL, 1, '0'),
(51, 'omnis_486', 'Voluptatem vel ut reprehenderit laborum sunt quo quia perferendis.', 106, 'Illum dolore reprehenderit velit est ipsam.', 650, 0, 40, 180, 0, 1563299016, 1564171624, 0, NULL, NULL, NULL, NULL, 1, '0'),
(52, 'ipsam_993', NULL, 110, 'Adipisci qui nemo alias eum et sit molestiae.', 450, 0, 18, 180, 0, 1563299016, 1563935267, 0, NULL, NULL, NULL, NULL, 0, '0'),
(53, 'omnis_369', 'Quas incidunt culpa ullam repudiandae dolorem fuga.', 118, 'Nemo quod nemo veritatis et illum maxime dolorem.', 130, 0, 17, 600, 0, 1563299016, 1563808278, 0, NULL, NULL, NULL, NULL, 1, '0'),
(54, 'nam_927', NULL, 110, 'Quod rerum nam aperiam rerum ab.', 410, 12, 13, 270, 0, 1563299016, 1564175999, 0, NULL, NULL, NULL, NULL, 0, '0'),
(55, 'odio_917', 'Ipsa et dolore ut possimus enim pariatur quidem et et.', 117, 'Laudantium maiores eos non corrupti debitis quibusdam vel.', 930, 46, 3, 700, 1, 1563299016, 1564148543, 0, NULL, NULL, NULL, NULL, 1, '0'),
(56, 'est_991', NULL, 120, 'Incidunt perspiciatis nulla nemo hic iste fugiat optio.', 600, 19, 0, 550, 0, 1563299016, 1564077193, 0, NULL, NULL, NULL, NULL, 1, '0'),
(57, 'aperiam_901', NULL, 112, 'Exercitationem odio vero numquam odio qui iure consectetur error.', 920, 0, 0, 140, 1, 1563299016, 1563904087, 0, NULL, NULL, NULL, NULL, 1, '0'),
(58, 'animi_321', 'Aliquid eum porro eveniet est aut qui.', 117, 'Itaque eaque hic dolor doloremque sed quo laborum.', 220, 0, 0, 960, 0, 1563299016, 1564264075, 0, NULL, NULL, NULL, NULL, 0, '0'),
(59, 'eius_912', NULL, 115, 'Enim minima earum commodi ut.', 180, 0, 0, 490, 1, 1563299016, 1563669682, 0, NULL, NULL, NULL, NULL, 0, '0'),
(60, 'eligendi_775', NULL, 121, 'Deleniti vel eum voluptatibus sequi voluptas voluptatem aut eum.', 830, 0, 31, 640, 0, 1563299016, 1563666135, 0, NULL, NULL, NULL, NULL, 1, '0'),
(61, 'quaerat_170', NULL, 119, 'Temporibus aut sit atque assumenda.', 50, 0, 0, 230, 0, 1563299016, 1564024101, 0, NULL, NULL, NULL, NULL, 1, '0'),
(62, 'blanditiis_925', 'Nostrum aut aut natus error in perspiciatis.', 107, 'Eligendi quidem suscipit ut minima asperiores aliquam.', 840, 23, 7, 620, 1, 1563299016, 1563424141, 0, NULL, NULL, NULL, NULL, 0, '0'),
(63, 'suscipit_312', 'Magni non nobis omnis nulla magnam.', 106, 'Laudantium ab quia et fuga libero quis.', 70, 28, 0, 400, 1, 1563299016, 1563934001, 0, NULL, NULL, NULL, NULL, 1, '0'),
(64, 'distinctio_610', 'Perferendis molestiae eum consequatur labore excepturi est ullam sed eveniet sit.', 106, 'Vitae tempore placeat qui enim eaque.', 250, 45, 0, 180, 0, 1563299016, 1564219984, 0, NULL, NULL, NULL, NULL, 0, '0'),
(65, 'cum_176', NULL, 114, 'Labore voluptas explicabo modi nisi necessitatibus ratione enim.', 300, 0, 0, 670, 1, 1563299016, 1563938680, 0, NULL, NULL, NULL, NULL, 0, '0'),
(66, 'et_971', 'Reiciendis veritatis explicabo assumenda sunt et nihil occaecati quas adipisci optio.', 106, 'At placeat asperiores ea amet hic ducimus.', 460, 18, 0, 770, 1, 1563299016, 1563677719, 0, NULL, NULL, NULL, NULL, 1, '0'),
(67, 'tempore_588', 'Omnis commodi est quia est eaque ut occaecati accusantium quas rem.', 118, 'Dolor repudiandae ipsa in esse facilis.', 180, 35, 45, 760, 0, 1563299016, 1563485510, 0, NULL, NULL, NULL, NULL, 0, '0'),
(68, 'fugiat_724', NULL, 105, 'Suscipit natus magni rem nesciunt.', 350, 33, 0, 880, 0, 1563299016, 1563624663, 0, NULL, NULL, NULL, NULL, 1, '0'),
(69, 'ratione_980', 'Aut praesentium nostrum vel error laborum fugiat.', 121, 'Non accusantium inventore ratione sed doloremque repellat sit.', 260, 45, 8, 670, 1, 1563299016, 1564156737, 0, NULL, NULL, NULL, NULL, 0, '0'),
(70, 'qui_894', NULL, 119, 'Velit recusandae assumenda nam cumque cupiditate corrupti harum quam.', 890, 34, 0, 140, 1, 1563299016, 1564105958, 0, NULL, NULL, NULL, NULL, 0, '0'),
(71, 'eum_168', NULL, 107, 'Tempore blanditiis saepe voluptatem nisi nulla.', 580, 0, 0, 110, 1, 1563299016, 1563936915, 0, NULL, NULL, NULL, NULL, 1, '0'),
(72, 'illo_214', 'Et atque nobis laborum eos harum incidunt.', 121, 'Voluptatem debitis et nulla excepturi et magni.', 250, 0, 29, 690, 1, 1563299016, 1564197308, 0, NULL, NULL, NULL, NULL, 0, '0'),
(73, 'quibusdam_689', 'Quaerat ratione rerum deleniti velit repellendus tempora dolorum animi.', 120, 'Nobis voluptatem qui est repellendus in hic dolorem.', 570, 26, 0, 350, 1, 1563299016, 1563704395, 0, NULL, NULL, NULL, NULL, 1, '0'),
(74, 'iusto_101', 'Inventore rerum veniam vel omnis ipsa sed et inventore sed quasi.', 121, 'Esse aut omnis optio quia ex aut.', 710, 16, 0, 900, 1, 1563299016, 1563611619, 0, NULL, NULL, NULL, NULL, 0, '0'),
(75, 'est_758', NULL, 120, 'Numquam corporis sit a commodi officiis libero neque.', 540, 50, 9, 670, 1, 1563299016, 1563567334, 0, NULL, NULL, NULL, NULL, 1, '0'),
(76, 'sunt_334', NULL, 122, 'Ullam illum rerum dicta recusandae vel voluptate.', 290, 13, 0, 740, 0, 1563299016, 1563780736, 0, NULL, NULL, NULL, NULL, 0, '0'),
(77, 'praesentium_602', NULL, 112, 'Voluptas veritatis quas vitae vel cupiditate eum nihil.', 600, 0, 0, 70, 0, 1563299016, 1563451382, 0, NULL, NULL, NULL, NULL, 0, '0'),
(78, 'vero_416', NULL, 121, 'Similique sit sit minus inventore repellendus.', 320, 0, 22, 690, 1, 1563299016, 1563564885, 0, NULL, NULL, NULL, NULL, 1, '0'),
(79, 'et_710', NULL, 122, 'In velit perferendis quod dicta quos.', 700, 0, 0, 680, 1, 1563299016, 1564105493, 0, NULL, NULL, NULL, NULL, 0, '0'),
(80, 'ad_531', NULL, 107, 'Sit nam accusamus veniam tempora atque.', 860, 0, 22, 770, 1, 1563299016, 1563795566, 0, NULL, NULL, NULL, NULL, 1, '0'),
(81, 'atque_257', NULL, 119, 'Aliquid soluta quos placeat aperiam omnis soluta aut sed.', 70, 31, 29, 700, 1, 1563299016, 1563715710, 0, NULL, NULL, NULL, NULL, 0, '0'),
(82, 'impedit_398', NULL, 120, 'Adipisci ad qui quaerat consequuntur.', 780, 0, 45, 250, 0, 1563299016, 1563641204, 0, NULL, NULL, NULL, NULL, 1, '0'),
(83, 'soluta_819', 'Et tempore laboriosam earum accusamus exercitationem.', 106, 'Deserunt at nihil non rerum sed enim.', 380, 0, 21, 740, 0, 1563299016, 1563763354, 0, NULL, NULL, NULL, NULL, 0, '0'),
(84, 'eaque_360', NULL, 123, 'Adipisci omnis sint deserunt quod qui voluptatem.', 820, 42, 0, 540, 1, 1563299016, 1563413973, 0, NULL, NULL, NULL, NULL, 1, '0'),
(85, 'adipisci_949', 'Dolore tempora magni explicabo minima minima ad minima numquam odit.', 116, 'Dignissimos rem facere rerum numquam iste sint reiciendis.', 200, 0, 33, 530, 0, 1563299016, 1563757445, 0, NULL, NULL, NULL, NULL, 0, '0'),
(86, 'dolorem_773', NULL, 122, 'Ea dolore ut reprehenderit aut recusandae perspiciatis itaque.', 690, 0, 0, 900, 1, 1563299016, 1563931528, 0, NULL, NULL, NULL, NULL, 0, '0'),
(87, 'quia_615', NULL, 117, 'Facere nam et autem quo amet nemo illum.', 920, 0, 14, 480, 1, 1563299016, 1563439124, 0, NULL, NULL, NULL, NULL, 0, '0'),
(88, 'quaerat_497', 'Mollitia harum sint sit autem quia.', 123, 'Nostrum autem dolorum doloremque asperiores.', 230, 0, 4, 300, 0, 1563299016, 1564120122, 0, NULL, NULL, NULL, NULL, 0, '0'),
(89, 'officiis_727', 'Non et et animi impedit consequatur est in iusto.', 121, 'Voluptatem dolor praesentium quo fugiat ut.', 310, 21, 29, 430, 1, 1563299016, 1564103328, 0, NULL, NULL, NULL, NULL, 1, '0'),
(90, 'neque_148', NULL, 121, 'Voluptate quidem fugiat sed rem animi.', 330, 0, 29, 440, 1, 1563299016, 1563740402, 0, NULL, NULL, NULL, NULL, 1, '0'),
(91, 'molestiae_338', NULL, 106, 'Enim perspiciatis sit quo eos et temporibus officiis.', 450, 36, 1, 170, 1, 1563299016, 1563865721, 0, NULL, NULL, NULL, NULL, 0, '0'),
(92, 'omnis_179', 'Est fuga similique hic voluptatibus totam aut veritatis libero dolorem.', 121, 'Unde voluptatem et sequi placeat nemo explicabo ex.', 110, 35, 23, 520, 0, 1563299016, 1563926973, 0, NULL, NULL, NULL, NULL, 1, '0'),
(93, 'corrupti_900', 'Id voluptatibus sint reprehenderit odit temporibus quod.', 116, 'Accusamus et et ut.', 450, 29, 0, 240, 0, 1563299016, 1563688276, 0, NULL, NULL, NULL, NULL, 1, '0'),
(94, 'et_125', NULL, 120, 'In voluptatum omnis aut vero hic ut et.', 600, 0, 0, 530, 0, 1563299016, 1563479926, 0, NULL, NULL, NULL, NULL, 1, '0'),
(95, 'voluptatum_531', NULL, 117, 'Dolores a et optio.', 120, 13, 0, 130, 0, 1563299016, 1563732128, 0, NULL, NULL, NULL, NULL, 0, '0'),
(96, 'error_874', NULL, 122, 'Odit et ipsum quae iusto adipisci sunt ratione.', 950, 0, 0, 330, 1, 1563299016, 1563821143, 0, NULL, NULL, NULL, NULL, 1, '0'),
(97, 'aut_920', 'Amet doloribus nulla qui sint quae ut sunt quam nostrum.', 107, 'Esse et assumenda aspernatur eaque impedit consequatur.', 860, 46, 39, 900, 0, 1563299016, 1563904079, 0, NULL, NULL, NULL, NULL, 0, '0'),
(98, 'quis_103', 'Distinctio voluptatem doloremque ipsum consequatur expedita reiciendis.', 107, 'Magnam nostrum iure neque ex.', 570, 14, 0, 290, 0, 1563299016, 1563470929, 0, NULL, NULL, NULL, NULL, 1, '0'),
(99, 'labore_781', 'Voluptatem quis dolorum qui repellat tenetur officia dolores non.', 105, 'Accusamus animi ea qui at architecto et impedit.', 560, 8, 0, 220, 1, 1563299016, 1564156309, 0, NULL, NULL, NULL, NULL, 1, '0'),
(100, 'dignissimos_110', NULL, 107, 'Et provident voluptatem dolores fugit sed consequuntur.', 230, 48, 0, 990, 0, 1563299016, 1564299006, 0, NULL, NULL, NULL, NULL, 0, '0'),
(101, 'nulla_272', NULL, 107, 'Necessitatibus corrupti nam et molestiae.', 60, 25, 0, 320, 1, 1563299016, 1563981472, 0, NULL, NULL, NULL, NULL, 0, '0'),
(102, 'est_807', 'Velit aut illo omnis occaecati debitis molestiae dolore.', 123, 'Voluptatem quibusdam recusandae sunt corporis consequuntur praesentium harum.', 50, 9, 0, 180, 1, 1563299016, 1563906118, 0, NULL, NULL, NULL, NULL, 1, '0'),
(103, 'aut_168', 'Fugit qui sit fuga odio quos doloribus neque ut beatae.', 119, 'Laboriosam laborum minus tempore impedit saepe at odio.', 100, 49, 17, 820, 0, 1563299016, 1564274350, 0, NULL, NULL, NULL, NULL, 1, '0'),
(104, 'velit_634', 'Sunt culpa rerum illo aut.', 115, 'Eum autem labore id adipisci mollitia.', 530, 15, 43, 310, 1, 1563299016, 1563515177, 0, NULL, NULL, NULL, NULL, 0, '0'),
(105, 'nihil_280', NULL, 122, 'Repellendus qui inventore voluptatem.', 140, 0, 44, 250, 1, 1563299016, 1564005177, 0, NULL, NULL, NULL, NULL, 1, '0'),
(106, 'illum_467', NULL, 122, 'Nobis quos magni modi et accusantium.', 270, 4, 13, 1000, 1, 1563299016, 1563738526, 0, NULL, NULL, NULL, NULL, 0, '0'),
(107, 'soluta_983', 'Illo incidunt et qui ipsa qui tempora culpa voluptatibus ratione.', 123, 'Facilis ratione aspernatur ipsa reiciendis.', 620, 0, 0, 950, 1, 1563299016, 1563952322, 0, NULL, NULL, NULL, NULL, 1, '0'),
(108, 'illo_231', 'Et qui quis est dolor et aut.', 119, 'Eum et sed ut maiores enim voluptatem repellendus vel.', 900, 0, 24, 410, 1, 1563299016, 1564194462, 0, NULL, NULL, NULL, NULL, 1, '0'),
(109, 'delectus_616', NULL, 122, 'Accusamus est assumenda accusamus rem sapiente eum.', 260, 17, 11, 510, 0, 1563299016, 1563611515, 0, NULL, NULL, NULL, NULL, 0, '0'),
(110, 'quam_516', NULL, 125, 'Itaque eos possimus omnis voluptatibus eaque.', 700, 0, 22, 110, 1, 1563299016, 1564238767, 0, NULL, NULL, NULL, NULL, 0, '0'),
(111, 'ipsum_873', 'Est ut optio saepe aperiam ipsa.', 121, 'Perspiciatis velit sit accusantium voluptates et qui provident porro.', 580, 27, 0, 760, 1, 1563299016, 1563611948, 0, NULL, NULL, NULL, NULL, 0, '0'),
(112, 'dolorum_563', NULL, 112, 'Sed enim quia esse id omnis.', 560, 0, 17, 670, 0, 1563299016, 1563619943, 0, NULL, NULL, NULL, NULL, 1, '0'),
(113, 'voluptatem_404', 'Quidem dicta sequi non sed est quae reiciendis.', 108, 'Qui quo enim eaque rerum rerum quae quam porro.', 560, 0, 0, 660, 1, 1563299016, 1564292849, 0, NULL, NULL, NULL, NULL, 0, '0'),
(114, 'rerum_999', NULL, 106, 'Possimus illum nihil aut aut natus.', 280, 1, 0, 540, 0, 1563299016, 1563500331, 0, NULL, NULL, NULL, NULL, 0, '0'),
(115, 'ullam_894', NULL, 119, 'Eos velit alias reprehenderit earum quos tempora.', 670, 0, 0, 610, 1, 1563299016, 1563495770, 0, NULL, NULL, NULL, NULL, 1, '0'),
(116, 'eius_824', 'Laborum laborum praesentium perspiciatis aut veritatis eveniet in aut.', 112, 'Suscipit est eligendi consequatur esse.', 500, 0, 31, 620, 1, 1563299016, 1564113258, 0, NULL, NULL, NULL, NULL, 0, '0'),
(117, 'dolorem_933', NULL, 112, 'Ipsum voluptas iure autem est facere.', 280, 11, 24, 480, 1, 1563299016, 1563851573, 0, NULL, NULL, NULL, NULL, 0, '0'),
(118, 'est_584', 'Occaecati ullam cupiditate id aperiam nemo officiis et ducimus ut tempore.', 125, 'Repudiandae nesciunt et asperiores ea sint voluptas et.', 240, 38, 24, 150, 0, 1563299016, 1563494153, 0, NULL, NULL, NULL, NULL, 0, '0'),
(119, 'eius_195', 'Cupiditate itaque sit adipisci assumenda ut occaecati aut ut accusamus illum.', 117, 'Eum et nemo inventore dolore consequatur cumque asperiores.', 850, 0, 11, 620, 0, 1563299016, 1563805667, 0, NULL, NULL, NULL, NULL, 1, '0'),
(120, 'officia_341', NULL, 107, 'Harum qui recusandae recusandae qui omnis odit.', 450, 32, 0, 480, 0, 1563299016, 1564166735, 0, NULL, NULL, NULL, NULL, 1, '0'),
(121, 'exercitationem_685', NULL, 118, 'Non minus perferendis voluptatem dicta quia.', 960, 0, 0, 980, 1, 1563299016, 1563948852, 0, NULL, NULL, NULL, NULL, 1, '0'),
(122, 'voluptate_511', NULL, 112, 'Consequatur at vitae mollitia qui veniam voluptas.', 60, 49, 12, 800, 1, 1563299016, 1563790609, 0, NULL, NULL, NULL, NULL, 0, '0'),
(123, 'quae_376', 'Tempora aspernatur blanditiis qui neque aspernatur.', 114, 'Temporibus voluptas minima molestias deleniti omnis.', 510, 28, 17, 640, 0, 1563299016, 1563722963, 0, NULL, NULL, NULL, NULL, 0, '0'),
(124, 'distinctio_544', NULL, 117, 'Quos excepturi tempore et explicabo aut dolorem qui.', 580, 0, 0, 550, 1, 1563299016, 1563560957, 0, NULL, NULL, NULL, NULL, 0, '0'),
(125, 'fugit_492', NULL, 121, 'Fuga fugiat voluptatem voluptatem modi ut id.', 750, 29, 34, 630, 1, 1563299016, 1563886186, 0, NULL, NULL, NULL, NULL, 0, '0'),
(126, 'quis_721', 'Maxime ex cupiditate culpa eius aut sed.', 123, 'Explicabo et a quaerat.', 140, 0, 31, 920, 1, 1563299016, 1563415992, 0, NULL, NULL, NULL, NULL, 1, '0'),
(127, 'laudantium_736', NULL, 123, 'Saepe sit odio omnis culpa.', 340, 0, 0, 550, 1, 1563299016, 1563455235, 0, NULL, NULL, NULL, NULL, 1, '0'),
(128, 'minima_944', NULL, 117, 'Quasi neque quisquam at sint facere.', 300, 3, 0, 610, 0, 1563299016, 1563495290, 0, NULL, NULL, NULL, NULL, 1, '0'),
(129, 'eum_870', 'Quis earum aut nihil id maiores enim.', 119, 'Architecto eveniet est ut ipsum consectetur rerum molestiae perferendis.', 50, 37, 2, 790, 1, 1563299016, 1564205638, 0, NULL, NULL, NULL, NULL, 0, '0'),
(130, 'odio_397', NULL, 121, 'Sit expedita occaecati est aut.', 850, 0, 0, 500, 1, 1563299016, 1563639049, 0, NULL, NULL, NULL, NULL, 1, '0'),
(131, 'omnis_225', NULL, 117, 'Eaque cumque nihil animi labore praesentium quia.', 950, 49, 0, 780, 0, 1563299016, 1563888507, 0, NULL, NULL, NULL, NULL, 1, '0'),
(132, 'dicta_345', NULL, 122, 'Impedit rerum vero velit praesentium repellendus voluptas aut debitis.', 570, 27, 0, 740, 1, 1563299016, 1563665952, 0, NULL, NULL, NULL, NULL, 1, '0'),
(133, 'sed_308', 'Est autem asperiores qui ullam aut.', 107, 'Quo et corporis nobis impedit unde ea.', 190, 37, 31, 760, 1, 1563299016, 1564186495, 0, NULL, NULL, NULL, NULL, 1, '0'),
(134, 'quo_353', NULL, 114, 'Praesentium fuga harum quia sit vero eaque dolorem.', 150, 0, 0, 960, 0, 1563299016, 1563479997, 0, NULL, NULL, NULL, NULL, 0, '0'),
(135, 'enim_448', 'Natus est ut fugit aut est deserunt debitis reprehenderit.', 121, 'Nam quia eveniet unde nemo.', 140, 0, 19, 80, 1, 1563299016, 1563928380, 0, NULL, NULL, NULL, NULL, 1, '0'),
(136, 'eaque_575', NULL, 105, 'Ut nulla officia accusantium laboriosam sequi.', 360, 31, 36, 750, 1, 1563299016, 1563810859, 0, NULL, NULL, NULL, NULL, 1, '0'),
(137, 'perferendis_986', NULL, 106, 'Voluptatibus consequatur repudiandae magni tenetur laborum.', 60, 25, 5, 650, 0, 1563299016, 1563492962, 0, NULL, NULL, NULL, NULL, 1, '0'),
(138, 'recusandae_600', 'Eum qui libero ad corporis at cupiditate odit debitis.', 112, 'Qui cupiditate reiciendis perspiciatis aut nemo.', 810, 2, 0, 260, 1, 1563299016, 1563403204, 0, NULL, NULL, NULL, NULL, 0, '0'),
(139, 'est_883', 'Quisquam aut amet et dolorum explicabo nihil.', 121, 'Itaque autem qui labore deserunt.', 750, 33, 6, 470, 1, 1563299016, 1564133915, 0, NULL, NULL, NULL, NULL, 1, '0'),
(140, 'ut_404', NULL, 115, 'Enim voluptatem dolor qui nobis repudiandae.', 500, 12, 8, 160, 0, 1563299016, 1563709371, 0, NULL, NULL, NULL, NULL, 1, '0'),
(141, 'rerum_856', NULL, 105, 'Ea sequi perspiciatis quis reiciendis eveniet tempora.', 160, 23, 0, 590, 0, 1563299017, 1563672817, 0, NULL, NULL, NULL, NULL, 0, '0'),
(142, 'culpa_921', 'Veniam quidem nam eligendi cum corporis.', 117, 'Aperiam accusantium esse commodi totam optio.', 620, 0, 0, 740, 0, 1563299017, 1564169568, 0, NULL, NULL, NULL, NULL, 0, '0'),
(143, 'eos_188', NULL, 121, 'Et atque voluptatem consequuntur iste cupiditate ipsam.', 530, 46, 0, 130, 1, 1563299017, 1564149579, 0, NULL, NULL, NULL, NULL, 0, '0'),
(144, 'voluptates_835', NULL, 120, 'Maxime et id inventore qui ab quia ea.', 700, 0, 34, 890, 1, 1563299017, 1563440978, 0, NULL, NULL, NULL, NULL, 0, '0'),
(145, 'ea_779', NULL, 116, 'Incidunt officiis voluptas vel ut nisi.', 600, 0, 50, 730, 0, 1563299017, 1564270460, 0, NULL, NULL, NULL, NULL, 0, '0'),
(146, 'cupiditate_543', NULL, 125, 'Rem omnis minus non molestiae.', 570, 0, 0, 600, 1, 1563299017, 1563713611, 0, NULL, NULL, NULL, NULL, 1, '0'),
(147, 'ipsam_303', 'Consequuntur consequatur error consequatur ducimus eos excepturi sequi.', 123, 'Expedita quam facere ut eaque voluptas.', 990, 0, 0, 740, 1, 1563299017, 1564095059, 0, NULL, NULL, NULL, NULL, 1, '0'),
(148, 'maxime_527', 'Earum alias sint voluptatem laborum sit minus dolorum.', 112, 'Voluptas dolores nihil aperiam eaque quia asperiores.', 540, 0, 0, 110, 1, 1563299017, 1564057407, 0, NULL, NULL, NULL, NULL, 0, '0'),
(149, 'ad_736', NULL, 120, 'Non et eos quo et ad harum.', 830, 13, 0, 940, 0, 1563299017, 1563906400, 0, NULL, NULL, NULL, NULL, 1, '0'),
(150, 'quo_403', 'Qui non facere iste aut labore quia sed.', 123, 'Praesentium sequi et sit et libero voluptatem.', 840, 0, 31, 490, 0, 1563299017, 1563958561, 0, NULL, NULL, NULL, NULL, 0, '0'),
(151, 'incidunt_970', NULL, 119, 'Voluptatem aspernatur facilis accusantium laborum ut repellat.', 320, 0, 30, 530, 1, 1563299017, 1563407398, 0, NULL, NULL, NULL, NULL, 1, '0'),
(152, 'saepe_781', 'Dignissimos reprehenderit ullam maxime voluptatem sit.', 123, 'Esse est neque enim saepe tempore ut et.', 740, 0, 0, 660, 0, 1563299017, 1564143835, 0, NULL, NULL, NULL, NULL, 0, '0'),
(153, 'accusamus_955', NULL, 118, 'Sint labore dolor vel ad voluptatem minus quia.', 280, 0, 22, 690, 1, 1563299017, 1563796530, 0, NULL, NULL, NULL, NULL, 1, '0'),
(154, 'soluta_140', 'Molestiae natus rem est cum voluptates.', 107, 'Esse perspiciatis et quos perferendis.', 690, 42, 0, 950, 1, 1563299017, 1564230572, 0, NULL, NULL, NULL, NULL, 0, '0'),
(155, 'sunt_283', NULL, 113, 'Optio quisquam culpa doloribus odio commodi temporibus.', 200, 40, 0, 780, 0, 1563299017, 1563679649, 0, NULL, NULL, NULL, NULL, 0, '0'),
(156, 'dolore_497', NULL, 114, 'Rem ut iste aut ut magnam assumenda veniam.', 440, 47, 0, 840, 1, 1563299017, 1564152888, 0, NULL, NULL, NULL, NULL, 1, '0'),
(157, 'quia_858', 'Inventore sed eum id quam non vel provident quia aut.', 119, 'Ratione dolorem delectus rerum velit voluptas et.', 110, 0, 25, 1000, 1, 1563299017, 1563861237, 0, NULL, NULL, NULL, NULL, 1, '0'),
(158, 'qui_810', NULL, 107, 'Numquam ab quis facilis alias.', 680, 0, 0, 350, 0, 1563299017, 1563554095, 0, NULL, NULL, NULL, NULL, 0, '0'),
(159, 'dolores_602', NULL, 119, 'Maiores aut id dolor quo ipsam molestiae.', 460, 0, 43, 790, 1, 1563299017, 1563439977, 0, NULL, NULL, NULL, NULL, 1, '0'),
(160, 'consequuntur_291', 'At nemo perferendis et deleniti consequuntur itaque provident est qui.', 123, 'Ea qui rem mollitia culpa.', 120, 1, 0, 680, 0, 1563299017, 1563808419, 0, NULL, NULL, NULL, NULL, 1, '0'),
(161, 'eaque_381', 'Sed nihil et optio qui.', 121, 'Distinctio doloribus suscipit asperiores dolorem et.', 120, 0, 17, 940, 0, 1563299017, 1563600331, 0, NULL, NULL, NULL, NULL, 0, '0'),
(162, 'officiis_799', 'Hic odit vitae sint iste cupiditate.', 105, 'Magnam et molestiae totam fugit.', 80, 0, 0, 980, 1, 1563299017, 1564189625, 0, NULL, NULL, NULL, NULL, 1, '0'),
(163, 'accusamus_982', NULL, 117, 'Et quo dolor consequatur qui.', 860, 0, 42, 360, 1, 1563299017, 1564214994, 0, NULL, NULL, NULL, NULL, 1, '0'),
(164, 'nisi_453', NULL, 112, 'Beatae architecto et aliquid earum omnis.', 260, 0, 21, 80, 1, 1563299017, 1563462614, 0, NULL, NULL, NULL, NULL, 1, '0'),
(165, 'blanditiis_171', NULL, 117, 'Accusamus et quam corrupti impedit consequatur provident nisi.', 490, 0, 17, 460, 0, 1563299017, 1564146710, 0, NULL, NULL, NULL, NULL, 0, '0'),
(166, 'debitis_459', NULL, 119, 'Ullam fugit laborum corrupti necessitatibus sunt sint.', 740, 0, 0, 260, 1, 1563299017, 1564214228, 0, NULL, NULL, NULL, NULL, 1, '0'),
(167, 'est_328', 'Cum rerum ut placeat quod eveniet quia ex.', 112, 'Et dolores dolorem molestiae velit quis illo labore omnis.', 830, 0, 34, 460, 1, 1563299017, 1563462542, 0, NULL, NULL, NULL, NULL, 0, '0'),
(168, 'vel_887', 'Et cum voluptatem praesentium sunt id aliquid atque alias beatae.', 108, 'Harum facilis eos iste est aliquid porro alias.', 900, 0, 0, 740, 0, 1563299017, 1564030752, 0, NULL, NULL, NULL, NULL, 0, '0'),
(169, 'ut_517', NULL, 119, 'Minima maiores voluptas et nisi nisi.', 480, 28, 0, 590, 0, 1563299017, 1563979683, 0, NULL, NULL, NULL, NULL, 0, '0'),
(170, 'et_927', 'Doloribus dolorem veritatis consequatur porro et quas dolor perspiciatis nam.', 106, 'Consequatur quis eos et ut optio.', 650, 0, 6, 320, 0, 1563299017, 1564257234, 0, NULL, NULL, NULL, NULL, 0, '0'),
(171, 'cumque_173', NULL, 105, 'Alias aliquam vero voluptatibus veritatis corporis.', 680, 3, 0, 600, 1, 1563299017, 1564152426, 0, NULL, NULL, NULL, NULL, 1, '0'),
(172, 'nam_430', NULL, 107, 'Veritatis autem harum voluptatem ut est voluptas ut dolorem.', 580, 0, 0, 150, 1, 1563299017, 1563674890, 0, NULL, NULL, NULL, NULL, 0, '0'),
(173, 'nesciunt_283', NULL, 117, 'Reiciendis minima quia temporibus qui minus eveniet sed.', 380, 0, 29, 470, 0, 1563299017, 1563858608, 0, NULL, NULL, NULL, NULL, 0, '0'),
(174, 'ipsum_583', NULL, 114, 'Ut molestiae laborum est rerum.', 150, 0, 38, 400, 0, 1563299017, 1563646125, 0, NULL, NULL, NULL, NULL, 1, '0'),
(175, 'eos_917', 'Id quia sit possimus atque sed voluptatibus.', 105, 'Dolores sed mollitia labore in.', 540, 32, 9, 980, 0, 1563299017, 1563626042, 0, NULL, NULL, NULL, NULL, 0, '0'),
(176, 'dolorem_692', NULL, 107, 'Perferendis est ratione et itaque.', 60, 7, 30, 700, 1, 1563299017, 1563686697, 0, NULL, NULL, NULL, NULL, 1, '0'),
(177, 'autem_611', 'Exercitationem sunt et nemo voluptatem at fugiat quod voluptatem est nam.', 113, 'Voluptatibus esse dolorum ducimus et omnis id ipsam.', 420, 0, 26, 590, 0, 1563299017, 1563919322, 0, NULL, NULL, NULL, NULL, 1, '0'),
(178, 'expedita_100', NULL, 110, 'Ipsum cupiditate deserunt qui qui.', 880, 42, 0, 1000, 1, 1563299017, 1563897246, 0, NULL, NULL, NULL, NULL, 1, '0'),
(179, 'rerum_981', NULL, 107, 'Nisi eaque dicta tenetur.', 210, 0, 6, 960, 1, 1563299017, 1563834150, 0, NULL, NULL, NULL, NULL, 0, '0'),
(180, 'asperiores_433', NULL, 119, 'Assumenda voluptates commodi est voluptatibus et.', 860, 0, 0, 290, 0, 1563299017, 1563825133, 0, NULL, NULL, NULL, NULL, 0, '0'),
(181, 'deserunt_249', NULL, 113, 'Ut omnis dicta praesentium qui cupiditate dolore et illum.', 470, 11, 11, 640, 0, 1563299017, 1564289339, 0, NULL, NULL, NULL, NULL, 1, '0'),
(182, 'dicta_113', NULL, 123, 'Fuga debitis sapiente enim facilis laboriosam laudantium voluptatem laborum.', 190, 0, 43, 720, 0, 1563299017, 1564155538, 0, NULL, NULL, NULL, NULL, 1, '0'),
(183, 'praesentium_570', 'Sunt dolorem incidunt molestiae facere pariatur eum doloribus perspiciatis.', 107, 'Iusto omnis rerum ut sapiente sed at ut iure.', 290, 26, 0, 900, 1, 1563299017, 1563639226, 0, NULL, NULL, NULL, NULL, 0, '0'),
(184, 'harum_554', 'Esse quam quasi mollitia nihil aut nesciunt aliquam tempore.', 123, 'Cumque esse mollitia tempora ex quas quos quia.', 690, 22, 45, 480, 0, 1563299017, 1563602128, 0, NULL, NULL, NULL, NULL, 1, '0'),
(185, 'ut_317', NULL, 117, 'Accusantium quasi dolor rerum ut sint.', 690, 0, 26, 460, 0, 1563299017, 1563450319, 0, NULL, NULL, NULL, NULL, 0, '0'),
(186, 'sit_981', 'Deserunt eaque voluptas voluptas voluptatibus incidunt pariatur ad facilis cumque sunt magni.', 119, 'Laudantium a rem nulla magni optio sit et non.', 90, 31, 39, 840, 1, 1563299017, 1563936999, 0, NULL, NULL, NULL, NULL, 1, '0'),
(187, 'vel_709', 'Debitis est libero ad quia ut nemo perspiciatis eligendi voluptatem voluptatem.', 115, 'Ut expedita accusantium unde amet debitis quam aliquam harum.', 60, 50, 0, 170, 0, 1563299017, 1563797651, 0, NULL, NULL, NULL, NULL, 1, '0'),
(188, 'fugiat_641', NULL, 117, 'Expedita officiis et aut qui.', 380, 0, 42, 340, 1, 1563299017, 1563631652, 0, NULL, NULL, NULL, NULL, 1, '0'),
(189, 'quia_175', NULL, 121, 'Impedit consequatur consectetur dolores hic cupiditate voluptatem.', 110, 11, 0, 890, 0, 1563299017, 1563999682, 0, NULL, NULL, NULL, NULL, 1, '0'),
(190, 'aut_187', NULL, 122, 'Et rerum vero velit aspernatur quidem.', 260, 10, 3, 680, 0, 1563299017, 1563815473, 0, NULL, NULL, NULL, NULL, 1, '0'),
(191, 'quas_598', NULL, 105, 'Consectetur ducimus dolores inventore sunt est delectus unde.', 240, 21, 0, 940, 0, 1563299017, 1563461475, 0, NULL, NULL, NULL, NULL, 0, '0'),
(192, 'animi_285', 'Ut ipsam sit nobis fugit aspernatur ullam libero iusto.', 110, 'Ut sit placeat et incidunt impedit ut.', 260, 0, 24, 720, 0, 1563299017, 1563622209, 0, NULL, NULL, NULL, NULL, 1, '0'),
(193, 'saepe_431', 'Aspernatur et optio commodi aut cum fugit aspernatur error odio et.', 106, 'Accusamus commodi voluptas dolor nobis aut illum ipsa.', 450, 48, 20, 220, 1, 1563299017, 1564009194, 0, NULL, NULL, NULL, NULL, 0, '0'),
(194, 'quia_100', NULL, 110, 'Rerum perspiciatis est temporibus sunt nam enim iusto error.', 410, 46, 16, 830, 0, 1563299017, 1563610731, 0, NULL, NULL, NULL, NULL, 1, '0'),
(195, 'quis_725', 'Qui neque doloribus non veritatis sed in.', 119, 'Reprehenderit enim magni quam blanditiis sit.', 270, 0, 0, 160, 0, 1563299017, 1564033897, 0, NULL, NULL, NULL, NULL, 0, '0'),
(196, 'quisquam_618', NULL, 110, 'Ipsam iste facere blanditiis illum atque.', 450, 0, 13, 850, 0, 1563299017, 1564018313, 0, NULL, NULL, NULL, NULL, 0, '0'),
(197, 'debitis_670', 'Velit voluptatum dolores numquam est dolorum blanditiis.', 119, 'Numquam quo omnis dolorem omnis nesciunt aut quasi.', 590, 35, 13, 290, 1, 1563299017, 1563721923, 0, NULL, NULL, NULL, NULL, 0, '0'),
(198, 'voluptatibus_524', NULL, 119, 'Quas tenetur omnis ut maiores sed quia illum.', 610, 0, 0, 680, 0, 1563299017, 1563614158, 0, NULL, NULL, NULL, NULL, 1, '0'),
(199, 'qui_506', 'Cum reprehenderit quia minima architecto tempore itaque praesentium ab.', 123, 'Consequatur error minus sed sit odio possimus ducimus.', 360, 0, 30, 460, 0, 1563299017, 1563403828, 0, NULL, NULL, NULL, NULL, 1, '0'),
(200, 'ab_959', NULL, 114, 'Deleniti animi harum aut non deserunt.', 340, 0, 0, 470, 0, 1563299017, 1563758723, 0, NULL, NULL, NULL, NULL, 1, '0'),
(201, 'optio_225', 'Neque labore reiciendis saepe ratione beatae dolorem.', 115, 'Iste necessitatibus velit odio velit.', 980, 0, 0, 860, 1, 1563299017, 1563720057, 0, NULL, NULL, NULL, NULL, 1, '0'),
(202, 'sed_563', NULL, 116, 'Perferendis expedita blanditiis sapiente pariatur.', 610, 23, 0, 570, 1, 1563299017, 1564158211, 0, NULL, NULL, NULL, NULL, 0, '0'),
(203, 'est_643', 'Est quibusdam temporibus voluptatem ipsa autem.', 119, 'Voluptatem quia qui excepturi ea consequatur alias dolores.', 590, 0, 26, 300, 0, 1563299017, 1564192753, 0, NULL, NULL, NULL, NULL, 0, '0'),
(204, 'soluta_986', 'Quibusdam sapiente molestiae nihil blanditiis ea.', 112, 'Tempore necessitatibus vitae sapiente autem quibusdam sit nihil.', 150, 0, 0, 110, 0, 1563299017, 1563555280, 0, NULL, NULL, NULL, NULL, 1, '0'),
(205, 'sit_198', NULL, 110, 'Est facere recusandae corrupti quas est est voluptatem.', 530, 0, 0, 210, 0, 1563299017, 1563437747, 0, NULL, NULL, NULL, NULL, 1, '0'),
(206, 'inventore_423', 'Omnis nisi autem quam cumque aut nisi sit soluta sit.', 114, 'Et et ducimus qui repellendus.', 460, 38, 42, 210, 0, 1563299017, 1564091990, 0, NULL, NULL, NULL, NULL, 1, '0'),
(207, 'nobis_535', 'Amet et ea mollitia libero repudiandae totam quod.', 106, 'Voluptatum ad dolor voluptates repellendus dolores eligendi.', 920, 6, 0, 440, 0, 1563299017, 1564119314, 0, NULL, NULL, NULL, NULL, 1, '0'),
(208, 'aliquid_251', 'Quae nesciunt harum quia excepturi earum et libero nisi est.', 121, 'Omnis praesentium impedit doloremque fuga.', 880, 21, 13, 720, 1, 1563299017, 1564078281, 0, NULL, NULL, NULL, NULL, 0, '0'),
(209, 'velit_821', 'Praesentium expedita dolorum rerum itaque.', 108, 'Eius reiciendis qui impedit consequatur.', 110, 40, 18, 190, 1, 1563299017, 1563416214, 0, NULL, NULL, NULL, NULL, 1, '0'),
(210, 'eum_132', 'Temporibus eveniet id tempora est facere velit repudiandae quaerat.', 107, 'Nihil quod quo sed aut ut.', 290, 0, 33, 680, 0, 1563299017, 1564067165, 0, NULL, NULL, NULL, NULL, 1, '0'),
(211, 'est_824', 'Ea impedit nulla molestiae recusandae laborum modi.', 117, 'Ut tempore consequuntur deserunt eos tempora doloribus.', 110, 0, 27, 810, 0, 1563299017, 1563685629, 0, NULL, NULL, NULL, NULL, 1, '0'),
(212, 'culpa_817', NULL, 120, 'Ducimus quas optio iure velit beatae error quia.', 710, 48, 0, 920, 1, 1563299017, 1564234917, 0, NULL, NULL, NULL, NULL, 0, '0'),
(213, 'qui_372', 'Ex aperiam fugit minus distinctio qui adipisci.', 105, 'Voluptatem voluptatem enim labore.', 490, 37, 22, 860, 0, 1563299017, 1564086898, 0, NULL, NULL, NULL, NULL, 0, '0'),
(214, 'voluptatem_798', 'Quod quia nemo iste explicabo at dolores vel minus.', 119, 'Fugit accusamus consequatur enim in aperiam.', 80, 46, 0, 200, 1, 1563299017, 1563906958, 0, NULL, NULL, NULL, NULL, 0, '0'),
(215, 'ut_632', NULL, 120, 'Natus ut minima id totam at voluptas sed.', 150, 10, 12, 830, 0, 1563299017, 1563627632, 0, NULL, NULL, NULL, NULL, 0, '0'),
(216, 'qui_801', NULL, 116, 'Ea architecto hic ut dicta quae.', 730, 0, 22, 240, 0, 1563299017, 1563460426, 0, NULL, NULL, NULL, NULL, 1, '0'),
(217, 'aut_930', 'Enim accusamus fugit et illo corporis qui accusamus aspernatur autem est.', 117, 'Numquam sequi provident repudiandae voluptas.', 780, 0, 0, 260, 0, 1563299017, 1563524339, 0, NULL, NULL, NULL, NULL, 1, '0'),
(218, 'dolor_818', 'Ipsum et at nulla in quia ratione voluptates ad.', 113, 'Quae tempora quos voluptatibus sint molestiae beatae nisi aperiam.', 160, 0, 0, 250, 0, 1563299017, 1563538431, 0, NULL, NULL, NULL, NULL, 0, '0'),
(219, 'maxime_889', NULL, 115, 'Ratione enim in rem molestiae.', 480, 0, 27, 690, 1, 1563299017, 1564142939, 0, NULL, NULL, NULL, NULL, 0, '0'),
(220, 'et_525', 'Voluptas autem laudantium maxime non doloribus eum est id sit ducimus.', 123, 'Quasi ipsam at laboriosam quis est ullam pariatur.', 500, 0, 26, 790, 0, 1563299017, 1563443943, 0, NULL, NULL, NULL, NULL, 0, '0'),
(221, 'consequatur_575', NULL, 107, 'Tempora iusto fugit praesentium magni inventore vel.', 660, 13, 0, 850, 0, 1563299017, 1563681660, 0, NULL, NULL, NULL, NULL, 0, '0'),
(222, 'beatae_579', 'Sed ea fugit molestiae dolores ut natus ut delectus qui et.', 120, 'Quia et consequatur autem omnis eum.', 590, 0, 13, 800, 1, 1563299017, 1563496794, 0, NULL, NULL, NULL, NULL, 0, '0'),
(223, 'maxime_368', NULL, 112, 'Dignissimos nisi eaque dolor repudiandae harum fugit et.', 210, 2, 0, 500, 0, 1563299017, 1564267481, 0, NULL, NULL, NULL, NULL, 1, '0'),
(224, 'placeat_702', NULL, 123, 'Dolore sit natus enim sed.', 80, 19, 6, 180, 1, 1563299017, 1563826705, 0, NULL, NULL, NULL, NULL, 0, '0'),
(225, 'et_132', 'Molestiae sit quidem dolor ex nam vel dolores.', 120, 'Facilis at fugit et consequatur numquam quasi et.', 800, 0, 18, 460, 1, 1563299017, 1563424570, 0, NULL, NULL, NULL, NULL, 0, '0'),
(226, 'pariatur_740', 'Similique vel deserunt quisquam est suscipit aut qui molestiae.', 115, 'Est natus illum esse commodi vel.', 590, 17, 0, 470, 0, 1563299017, 1563896152, 0, NULL, NULL, NULL, NULL, 1, '0'),
(227, 'vel_773', 'Perspiciatis sunt a ducimus tenetur velit odio harum beatae corrupti doloremque.', 121, 'Odio necessitatibus iure inventore non.', 850, 0, 47, 720, 1, 1563299017, 1563613690, 0, NULL, NULL, NULL, NULL, 0, '0'),
(228, 'esse_752', 'Id sit porro aspernatur quibusdam deleniti.', 123, 'Aut totam qui iusto fuga est.', 530, 20, 0, 450, 1, 1563299017, 1563845924, 0, NULL, NULL, NULL, NULL, 1, '0'),
(229, 'modi_119', NULL, 121, 'Eius sed velit nihil non expedita sint est.', 60, 0, 0, 700, 0, 1563299017, 1563602320, 0, NULL, NULL, NULL, NULL, 0, '0'),
(230, 'corporis_479', 'Aut debitis doloremque suscipit ut temporibus.', 122, 'Vel molestias rerum tempora maiores non eveniet possimus.', 630, 0, 0, 540, 1, 1563299017, 1563544920, 0, NULL, NULL, NULL, NULL, 1, '0'),
(231, 'ab_766', 'Numquam mollitia velit labore perspiciatis magni voluptates dolor doloremque.', 121, 'Enim delectus voluptatem asperiores architecto aut.', 390, 0, 0, 930, 0, 1563299018, 1563971668, 0, NULL, NULL, NULL, NULL, 0, '0'),
(232, 'facilis_776', 'Sit blanditiis asperiores quas omnis sint qui molestiae quos animi.', 112, 'Sed maxime delectus voluptatibus et provident.', 660, 32, 0, 410, 0, 1563299018, 1564232098, 0, NULL, NULL, NULL, NULL, 0, '0'),
(233, 'voluptatem_566', NULL, 120, 'Enim dolorem aut est architecto.', 990, 41, 30, 100, 1, 1563299018, 1563768196, 0, NULL, NULL, NULL, NULL, 0, '0'),
(234, 'eaque_442', NULL, 125, 'Fuga sit soluta itaque inventore.', 850, 36, 20, 750, 1, 1563299018, 1564292365, 0, NULL, NULL, NULL, NULL, 0, '0'),
(235, 'nam_396', 'Laborum quam optio praesentium ipsa ut provident quas odit placeat impedit.', 106, 'Veritatis harum dolores vel accusamus dignissimos.', 840, 0, 21, 280, 0, 1563299018, 1563454694, 0, NULL, NULL, NULL, NULL, 1, '0'),
(236, 'odit_626', NULL, 121, 'Quis alias dolor deleniti nobis vel modi quia.', 970, 9, 10, 220, 0, 1563299018, 1563505367, 0, NULL, NULL, NULL, NULL, 0, '0'),
(237, 'et_112', 'Aliquid magnam et quidem aut ex ut reiciendis sapiente itaque similique corrupti.', 123, 'Occaecati repellat harum praesentium cumque non.', 120, 0, 44, 380, 0, 1563299018, 1564290116, 0, NULL, NULL, NULL, NULL, 1, '0'),
(238, 'ea_892', NULL, 117, 'Ad saepe optio ut odio molestias eligendi.', 490, 0, 0, 640, 0, 1563299018, 1564034306, 0, NULL, NULL, NULL, NULL, 1, '0'),
(239, 'quia_865', NULL, 114, 'Sint aperiam dolorem facere ipsa quo sapiente rerum.', 630, 21, 0, 760, 1, 1563299018, 1563826394, 0, NULL, NULL, NULL, NULL, 0, '0'),
(240, 'dolore_416', 'Reiciendis ut architecto velit non qui porro qui ut nisi.', 117, 'Fuga reprehenderit in magnam non eius sapiente.', 850, 0, 41, 60, 0, 1563299018, 1564189373, 0, NULL, NULL, NULL, NULL, 1, '0'),
(241, 'laboriosam_687', 'Commodi aliquam tempore reprehenderit et cupiditate in qui.', 117, 'Eveniet alias vitae pariatur rerum ipsa.', 860, 38, 28, 910, 1, 1563299018, 1563727124, 0, NULL, NULL, NULL, NULL, 1, '0'),
(242, 'odio_333', NULL, 105, 'Maxime excepturi enim nemo omnis qui veniam.', 650, 0, 39, 610, 1, 1563299018, 1563571526, 0, NULL, NULL, NULL, NULL, 0, '0'),
(243, 'rerum_599', NULL, 123, 'Doloribus ducimus ex voluptatibus.', 440, 4, 0, 160, 1, 1563299018, 1564233594, 0, NULL, NULL, NULL, NULL, 1, '0'),
(244, 'facere_122', NULL, 115, 'Id voluptatum voluptas voluptatem non sit.', 830, 0, 41, 900, 1, 1563299018, 1564023569, 0, NULL, NULL, NULL, NULL, 1, '0'),
(245, 'laudantium_514', NULL, 107, 'Et numquam harum voluptas ut blanditiis.', 780, 0, 12, 660, 1, 1563299018, 1563868760, 0, NULL, NULL, NULL, NULL, 0, '0'),
(246, 'autem_772', 'Ut quibusdam minima alias explicabo est aperiam asperiores quis tenetur et.', 118, 'Rem delectus sed debitis dolor.', 280, 0, 0, 580, 0, 1563299018, 1564152337, 0, NULL, NULL, NULL, NULL, 1, '0'),
(247, 'quo_550', NULL, 117, 'Repellat occaecati ea quos possimus.', 660, 44, 35, 720, 0, 1563299018, 1564054669, 0, NULL, NULL, NULL, NULL, 0, '0'),
(248, 'eaque_900', NULL, 108, 'Dolorem dolorum eum et adipisci.', 570, 9, 0, 570, 1, 1563299018, 1564029729, 0, NULL, NULL, NULL, NULL, 0, '0'),
(249, 'voluptatibus_468', NULL, 119, 'Minima in et sequi facere.', 240, 12, 33, 540, 0, 1563299018, 1564251596, 0, NULL, NULL, NULL, NULL, 0, '0'),
(250, 'non_931', 'Officia minus non ut nam consequatur.', 123, 'Et maiores quia cum neque asperiores.', 120, 0, 10, 380, 0, 1563299018, 1564126811, 0, NULL, NULL, NULL, NULL, 1, '0'),
(251, 'natus_631', 'Laboriosam cum quam libero culpa modi placeat distinctio asperiores.', 121, 'Qui corporis ut qui.', 790, 49, 22, 740, 0, 1563299018, 1563523489, 0, NULL, NULL, NULL, NULL, 0, '0'),
(252, 'mollitia_507', NULL, 122, 'Qui omnis quod distinctio.', 600, 27, 0, 130, 1, 1563299018, 1564065886, 0, NULL, NULL, NULL, NULL, 1, '0'),
(253, 'voluptate_978', NULL, 121, 'Aliquam impedit debitis qui hic voluptates consequatur ipsa doloribus.', 620, 41, 45, 140, 1, 1563299018, 1563485723, 0, NULL, NULL, NULL, NULL, 0, '0'),
(254, 'itaque_201', NULL, 107, 'Omnis aut facere sed.', 750, 29, 15, 640, 1, 1563299018, 1564196353, 0, NULL, NULL, NULL, NULL, 0, '0'),
(255, 'distinctio_801', 'Temporibus aut aut deserunt quod alias assumenda saepe enim.', 122, 'Qui non delectus ut voluptatem non.', 340, 39, 0, 190, 0, 1563299018, 1563518497, 0, NULL, NULL, NULL, NULL, 1, '0'),
(256, 'quia_518', NULL, 115, 'Porro dolorum fuga in dicta qui odit incidunt.', 170, 0, 0, 590, 0, 1563299018, 1563590941, 0, NULL, NULL, NULL, NULL, 1, '0'),
(257, 'et_560', 'Voluptate officia mollitia corrupti porro et quia ut sit.', 106, 'Ipsa et maiores dolor ut.', 250, 0, 0, 820, 1, 1563299018, 1563566918, 0, NULL, NULL, NULL, NULL, 1, '0'),
(258, 'et_705', 'Dolor nesciunt et rerum mollitia.', 114, 'Ut maxime consectetur natus ipsam quaerat architecto.', 930, 0, 4, 380, 0, 1563299018, 1564039036, 0, NULL, NULL, NULL, NULL, 1, '0'),
(259, 'facilis_389', 'Est dicta ut enim quo aut.', 113, 'Illum eum voluptatem ab nisi veniam officia.', 750, 0, 0, 140, 0, 1563299018, 1563740453, 0, NULL, NULL, NULL, NULL, 1, '0'),
(260, 'doloribus_494', NULL, 117, 'Et repellat hic quis.', 970, 0, 10, 1000, 1, 1563299018, 1563447061, 0, NULL, NULL, NULL, NULL, 0, '0'),
(261, 'vel_304', 'Ut autem iusto in hic a necessitatibus est.', 112, 'Officia et non quis quo non tempora officiis cum.', 880, 0, 24, 220, 0, 1563299018, 1563494107, 0, NULL, NULL, NULL, NULL, 1, '0'),
(262, 'nesciunt_953', NULL, 117, 'Non cupiditate accusantium sit.', 230, 28, 0, 410, 0, 1563299018, 1563997604, 0, NULL, NULL, NULL, NULL, 1, '0'),
(263, 'cupiditate_233', 'Dignissimos mollitia aperiam sapiente facilis quo nihil laborum autem qui.', 119, 'Et voluptas amet consequatur est cupiditate.', 900, 0, 0, 190, 1, 1563299018, 1563647687, 0, NULL, NULL, NULL, NULL, 1, '0'),
(264, 'ipsum_736', 'Quam sequi molestiae odio reiciendis dolor rem rerum.', 110, 'Neque quisquam quo animi id nesciunt omnis.', 490, 0, 12, 970, 1, 1563299018, 1563958727, 0, NULL, NULL, NULL, NULL, 1, '0'),
(265, 'accusamus_982', 'Ut corrupti perspiciatis laudantium repellendus dolorem quisquam et eligendi sit.', 107, 'Quod iste dignissimos sed assumenda architecto qui quis.', 440, 43, 31, 340, 1, 1563299018, 1563750701, 0, NULL, NULL, NULL, NULL, 0, '0'),
(266, 'repellat_478', NULL, 108, 'Quos mollitia autem voluptas corrupti commodi nesciunt non quas.', 800, 49, 0, 460, 0, 1563299018, 1564182382, 0, NULL, NULL, NULL, NULL, 0, '0'),
(267, 'optio_107', NULL, 118, 'Quia dicta nihil doloremque quae error.', 210, 0, 9, 400, 0, 1563299018, 1564173760, 0, NULL, NULL, NULL, NULL, 1, '0'),
(268, 'nemo_828', NULL, 107, 'Iure vel labore qui qui at aspernatur sequi.', 270, 0, 0, 160, 0, 1563299018, 1563871428, 0, NULL, NULL, NULL, NULL, 0, '0'),
(269, 'iste_667', 'Vel commodi aut dignissimos et in eos delectus dolorem doloremque.', 123, 'Cumque fugit cumque veritatis ut neque quia.', 680, 9, 0, 640, 0, 1563299018, 1563992979, 0, NULL, NULL, NULL, NULL, 0, '0'),
(270, 'voluptatum_628', NULL, 118, 'Aut et aut nobis esse modi error aliquam esse.', 640, 0, 0, 420, 1, 1563299018, 1563653818, 0, NULL, NULL, NULL, NULL, 0, '0'),
(271, 'est_608', 'Expedita nisi et ut tempore quia rerum recusandae odit.', 116, 'Sint ut expedita autem odio sint.', 780, 31, 50, 590, 1, 1563299018, 1563970082, 0, NULL, NULL, NULL, NULL, 1, '0'),
(272, 'voluptas_340', NULL, 121, 'Sunt nulla id dolorum laudantium sunt placeat culpa.', 370, 14, 13, 240, 1, 1563299018, 1563723307, 0, NULL, NULL, NULL, NULL, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(273, 'nam_767', NULL, 117, 'Sit porro odit molestias dolores et quae et.', 230, 8, 22, 780, 1, 1563299018, 1564267157, 0, NULL, NULL, NULL, NULL, 1, '0'),
(274, 'autem_144', NULL, 119, 'Facilis modi ea sunt explicabo corrupti.', 370, 39, 0, 730, 0, 1563299018, 1564175166, 0, NULL, NULL, NULL, NULL, 1, '0'),
(275, 'vel_700', NULL, 121, 'Qui autem molestiae possimus eum.', 500, 0, 21, 110, 1, 1563299018, 1563568801, 0, NULL, NULL, NULL, NULL, 0, '0'),
(276, 'nostrum_714', 'Omnis et commodi consequatur dolore quos quidem.', 117, 'Nostrum esse et illum ut.', 600, 21, 0, 690, 0, 1563299018, 1563555883, 0, NULL, NULL, NULL, NULL, 1, '0'),
(277, 'iure_506', NULL, 108, 'Assumenda in voluptates ad voluptates aut nostrum debitis.', 990, 0, 0, 320, 0, 1563299018, 1563537604, 0, NULL, NULL, NULL, NULL, 0, '0'),
(278, 'expedita_682', 'Vero velit placeat quia quos beatae doloribus voluptatem est ea omnis.', 122, 'Maiores consequatur officia aut.', 610, 0, 44, 510, 0, 1563299018, 1564155829, 0, NULL, NULL, NULL, NULL, 0, '0'),
(279, 'velit_206', 'Velit iure ullam neque qui id.', 105, 'Sit consequuntur hic quia non corporis neque.', 420, 29, 0, 500, 1, 1563299018, 1564111323, 0, NULL, NULL, NULL, NULL, 0, '0'),
(280, 'iusto_571', 'Architecto modi autem impedit omnis corporis in minus.', 105, 'Aut perspiciatis sunt nihil unde et deleniti nesciunt.', 610, 16, 0, 830, 1, 1563299018, 1563422524, 0, NULL, NULL, NULL, NULL, 0, '0'),
(281, 'doloremque_202', NULL, 121, 'Vel nihil consequatur at quia sed est distinctio.', 480, 17, 0, 760, 0, 1563299018, 1563583511, 0, NULL, NULL, NULL, NULL, 1, '0'),
(282, 'porro_108', NULL, 105, 'Tempore at ex provident placeat laboriosam.', 580, 0, 0, 690, 0, 1563299018, 1563649222, 0, NULL, NULL, NULL, NULL, 1, '0'),
(283, 'sed_730', 'Itaque magnam consequatur adipisci molestiae esse ea dolorum in culpa.', 113, 'Earum numquam exercitationem sed debitis.', 970, 0, 49, 600, 0, 1563299018, 1563456298, 0, NULL, NULL, NULL, NULL, 1, '0'),
(284, 'dolorem_684', 'Omnis molestiae aut accusantium et aut aut.', 117, 'Eum et recusandae reprehenderit eius.', 940, 0, 0, 490, 0, 1563299018, 1563972566, 0, NULL, NULL, NULL, NULL, 0, '0'),
(285, 'quaerat_920', NULL, 116, 'Qui nulla omnis delectus.', 610, 12, 0, 710, 1, 1563299018, 1563661027, 0, NULL, NULL, NULL, NULL, 0, '0'),
(286, 'earum_914', NULL, 107, 'Accusamus quibusdam repudiandae quia sequi porro praesentium temporibus id.', 170, 46, 0, 540, 0, 1563299018, 1563998627, 0, NULL, NULL, NULL, NULL, 0, '0'),
(287, 'fugiat_722', 'Consequuntur corrupti nam nulla perferendis voluptatem beatae quae dolor iusto.', 110, 'Qui qui dolore soluta itaque possimus id dolorum.', 180, 12, 49, 190, 0, 1563299018, 1563680963, 0, NULL, NULL, NULL, NULL, 1, '0'),
(288, 'velit_181', 'Voluptatem optio deserunt harum et maiores nostrum aut.', 113, 'Earum voluptates laborum magnam aut.', 130, 23, 38, 360, 1, 1563299018, 1563775565, 0, NULL, NULL, NULL, NULL, 0, '0'),
(289, 'necessitatibus_428', 'Dolorum est aut aut debitis voluptatem minima.', 106, 'Nemo qui blanditiis ab nisi dignissimos debitis fugit ducimus.', 300, 1, 10, 100, 0, 1563299018, 1563546265, 0, NULL, NULL, NULL, NULL, 1, '0'),
(290, 'a_914', NULL, 121, 'At voluptatem consequatur aut id sapiente sit.', 570, 20, 0, 210, 1, 1563299018, 1563851948, 0, NULL, NULL, NULL, NULL, 1, '0'),
(291, 'exercitationem_198', 'Non provident vel magnam facilis voluptatibus quaerat mollitia.', 106, 'Et nulla dolorem qui enim blanditiis quam ut amet.', 730, 50, 14, 700, 1, 1563299018, 1564130979, 0, NULL, NULL, NULL, NULL, 1, '0'),
(292, 'qui_305', 'Suscipit in et laboriosam illum cum.', 114, 'Eveniet est eum et magnam illo eligendi repudiandae.', 770, 6, 4, 840, 1, 1563299018, 1564134532, 0, NULL, NULL, NULL, NULL, 0, '0'),
(293, 'est_520', NULL, 112, 'Quia iure voluptatem quisquam quos.', 890, 0, 0, 720, 0, 1563299018, 1563507150, 0, NULL, NULL, NULL, NULL, 0, '0'),
(294, 'voluptatem_738', 'Cumque ducimus ut occaecati aut minus quo.', 117, 'Illo exercitationem aut iste vero laboriosam veniam.', 490, 0, 0, 150, 1, 1563299018, 1563473163, 0, NULL, NULL, NULL, NULL, 1, '0'),
(295, 'rerum_179', NULL, 110, 'Quae quia qui voluptatum et.', 170, 12, 27, 890, 0, 1563299018, 1563861017, 0, NULL, NULL, NULL, NULL, 0, '0'),
(296, 'voluptatum_204', 'A quo aut magni ea sit voluptas repellendus ex voluptatem.', 121, 'Odit cupiditate commodi harum debitis reprehenderit.', 370, 0, 0, 510, 0, 1563299018, 1564271257, 0, NULL, NULL, NULL, NULL, 0, '0'),
(297, 'similique_738', NULL, 119, 'Perspiciatis rem asperiores debitis asperiores optio.', 550, 34, 0, 130, 1, 1563299018, 1563934102, 0, NULL, NULL, NULL, NULL, 1, '0'),
(298, 'nesciunt_720', NULL, 122, 'Vel quia rerum doloribus fugit aperiam ut.', 230, 0, 26, 500, 0, 1563299018, 1563781636, 0, NULL, NULL, NULL, NULL, 0, '0'),
(299, 'rerum_475', 'Fugit voluptatibus rerum quia quibusdam atque deleniti animi sit laborum impedit.', 118, 'Minima quidem totam natus.', 850, 0, 0, 60, 0, 1563299018, 1564249461, 0, NULL, NULL, NULL, NULL, 0, '0'),
(300, 'necessitatibus_411', NULL, 125, 'Eos consequatur dolore ipsam consectetur ut magni.', 70, 0, 3, 760, 1, 1563299018, 1563544565, 0, NULL, NULL, NULL, NULL, 1, '0'),
(301, 'quos_650', 'Maxime dicta reiciendis facere error temporibus.', 105, 'Facilis reiciendis laudantium veniam dolore.', 800, 29, 0, 830, 0, 1563299018, 1563869072, 0, NULL, NULL, NULL, NULL, 1, '0'),
(302, 'ut_481', 'Voluptatem non atque sunt et.', 119, 'Optio itaque sunt iste voluptatibus.', 260, 0, 0, 970, 0, 1563299018, 1563884255, 0, NULL, NULL, NULL, NULL, 0, '0'),
(303, 'accusamus_462', NULL, 121, 'Ipsa sint rerum explicabo delectus eius eos.', 620, 13, 0, 60, 0, 1563299018, 1563788916, 0, NULL, NULL, NULL, NULL, 1, '0'),
(304, 'ut_708', 'Ipsum porro aut et qui ut molestias consequatur quia.', 121, 'Assumenda vitae quos aut voluptatem omnis.', 820, 0, 0, 880, 0, 1563299018, 1564008536, 0, NULL, NULL, NULL, NULL, 1, '0'),
(305, 'et_151', 'Quo est repudiandae accusamus optio tempore minus quia tempora voluptas illum.', 108, 'Ipsa expedita eos placeat similique.', 410, 24, 41, 630, 0, 1563299018, 1563637220, 0, NULL, NULL, NULL, NULL, 0, '0'),
(306, 'architecto_795', 'Laboriosam et mollitia dolorem hic sit.', 107, 'Nostrum corrupti est voluptas est.', 480, 7, 0, 730, 1, 1563299018, 1563903148, 0, NULL, NULL, NULL, NULL, 1, '0'),
(307, 'maxime_593', NULL, 113, 'Consequatur laboriosam aut non quod distinctio.', 180, 0, 0, 720, 0, 1563299018, 1563939307, 0, NULL, NULL, NULL, NULL, 0, '0'),
(308, 'dignissimos_834', 'Reiciendis totam alias doloremque pariatur quia.', 116, 'Inventore minima quis rerum sed et veritatis facilis.', 880, 0, 0, 230, 0, 1563299018, 1563517873, 0, NULL, NULL, NULL, NULL, 0, '0'),
(309, 'natus_671', NULL, 108, 'Nesciunt dolor dolorum reiciendis.', 280, 0, 0, 180, 1, 1563299018, 1563666228, 0, NULL, NULL, NULL, NULL, 1, '0'),
(310, 'aut_836', 'Dolores illum rerum ut odio voluptatem error enim molestias.', 119, 'Accusamus dignissimos omnis ipsum aut sed consequatur corrupti.', 280, 15, 0, 110, 1, 1563299018, 1564127303, 0, NULL, NULL, NULL, NULL, 0, '0'),
(311, 'sit_178', NULL, 121, 'Provident quis minus id expedita distinctio velit.', 180, 20, 35, 680, 0, 1563299018, 1563626205, 0, NULL, NULL, NULL, NULL, 1, '0'),
(312, 'qui_913', NULL, 112, 'Suscipit libero cumque at saepe iure.', 110, 4, 41, 710, 1, 1563299018, 1563918635, 0, NULL, NULL, NULL, NULL, 1, '0'),
(313, 'perspiciatis_490', 'Magnam nobis ipsum hic sunt et qui vero facere aut et.', 119, 'Soluta mollitia voluptas excepturi consequatur aut ipsum accusamus possimus.', 410, 45, 0, 750, 1, 1563299018, 1563700779, 0, NULL, NULL, NULL, NULL, 1, '0'),
(314, 'repellat_944', NULL, 117, 'Sit vel nesciunt voluptas eius consequuntur sed.', 330, 0, 3, 890, 1, 1563299018, 1564145282, 0, NULL, NULL, NULL, NULL, 1, '0'),
(315, 'autem_486', NULL, 121, 'Fugit consequatur sit minima voluptatem.', 940, 0, 0, 710, 1, 1563299018, 1563785618, 0, NULL, NULL, NULL, NULL, 0, '0'),
(316, 'sit_401', 'Est dolorem non aspernatur autem ut molestiae non ipsam harum.', 105, 'Rerum omnis eum optio aut nobis modi aut.', 820, 0, 0, 610, 0, 1563299018, 1564175547, 0, NULL, NULL, NULL, NULL, 0, '0'),
(317, 'eligendi_722', NULL, 117, 'Dolor laboriosam et quo ipsam eligendi est.', 870, 0, 32, 180, 0, 1563299018, 1563736881, 0, NULL, NULL, NULL, NULL, 0, '0'),
(318, 'adipisci_641', NULL, 108, 'Quae est aut magni numquam sit quaerat.', 300, 0, 0, 220, 0, 1563299018, 1563954217, 0, NULL, NULL, NULL, NULL, 1, '0'),
(319, 'quasi_287', 'Atque sed aut facilis doloremque odit assumenda et et aspernatur saepe.', 117, 'Molestiae atque nesciunt neque eos praesentium.', 300, 0, 0, 180, 0, 1563299018, 1563492339, 0, NULL, NULL, NULL, NULL, 1, '0'),
(320, 'libero_100', 'Cumque minus tenetur consectetur nostrum et consectetur qui omnis eos.', 117, 'Et ea ab dicta aut deleniti.', 160, 31, 0, 90, 1, 1563299018, 1563423476, 0, NULL, NULL, NULL, NULL, 1, '0'),
(321, 'debitis_208', NULL, 113, 'Dolorem consequatur repellendus consequatur dolores ut minus dolorem.', 400, 0, 0, 120, 1, 1563299018, 1564113848, 0, NULL, NULL, NULL, NULL, 0, '0'),
(322, 'qui_101', NULL, 105, 'Sed perspiciatis natus facere rerum.', 390, 19, 0, 470, 0, 1563299018, 1564036205, 0, NULL, NULL, NULL, NULL, 1, '0'),
(323, 'ut_541', NULL, 107, 'Voluptatem id eum neque et.', 700, 0, 0, 350, 0, 1563299018, 1564263028, 0, NULL, NULL, NULL, NULL, 0, '0'),
(324, 'optio_807', NULL, 117, 'Delectus aliquid sunt doloremque commodi vel exercitationem.', 600, 48, 0, 430, 0, 1563299018, 1563805358, 0, NULL, NULL, NULL, NULL, 0, '0'),
(325, 'quaerat_450', 'Cumque velit exercitationem magnam illo voluptatem perspiciatis doloremque.', 123, 'Velit quia quia voluptatem ea.', 920, 9, 13, 80, 0, 1563299018, 1563678754, 0, NULL, NULL, NULL, NULL, 0, '0'),
(326, 'vel_766', NULL, 121, 'Non quam voluptatum exercitationem.', 150, 0, 43, 280, 0, 1563299018, 1563745581, 0, NULL, NULL, NULL, NULL, 1, '0'),
(327, 'iusto_509', NULL, 122, 'Accusantium quos beatae rem.', 250, 50, 47, 510, 0, 1563299019, 1563462304, 0, NULL, NULL, NULL, NULL, 1, '0'),
(328, 'doloribus_292', NULL, 122, 'Aut minus illo rerum quidem ipsam.', 170, 0, 43, 250, 1, 1563299019, 1563743769, 0, NULL, NULL, NULL, NULL, 1, '0'),
(329, 'est_851', NULL, 110, 'Quo recusandae incidunt repudiandae qui ea suscipit.', 520, 0, 35, 880, 1, 1563299019, 1563421420, 0, NULL, NULL, NULL, NULL, 0, '0'),
(330, 'deserunt_204', NULL, 120, 'Id delectus molestiae est culpa quia rerum placeat.', 180, 33, 0, 250, 0, 1563299019, 1564223725, 0, NULL, NULL, NULL, NULL, 0, '0'),
(331, 'in_805', NULL, 119, 'Nemo hic consequatur incidunt quidem quis non.', 930, 0, 17, 540, 0, 1563299019, 1563832414, 0, NULL, NULL, NULL, NULL, 1, '0'),
(332, 'ut_996', NULL, 116, 'Neque labore aperiam distinctio.', 810, 30, 0, 990, 0, 1563299019, 1564256519, 0, NULL, NULL, NULL, NULL, 0, '0'),
(333, 'in_857', NULL, 112, 'Et molestias autem rerum odio et.', 520, 42, 16, 440, 0, 1563299019, 1563798333, 0, NULL, NULL, NULL, NULL, 1, '0'),
(334, 'dolor_180', 'Fugit placeat qui quis ut sunt voluptate.', 123, 'Nesciunt sed facere inventore corrupti fugiat dolores dolorem veritatis.', 300, 0, 0, 860, 0, 1563299019, 1564229224, 0, NULL, NULL, NULL, NULL, 0, '0'),
(335, 'aperiam_454', NULL, 118, 'Accusamus molestiae facere natus quis modi.', 990, 0, 41, 760, 1, 1563299019, 1563993822, 0, NULL, NULL, NULL, NULL, 1, '0'),
(336, 'dolor_557', 'Dicta et qui sunt tempora tempora doloremque esse.', 108, 'Dolor similique quia hic voluptas.', 970, 28, 0, 80, 0, 1563299019, 1563819453, 0, NULL, NULL, NULL, NULL, 0, '0'),
(337, 'sit_565', NULL, 121, 'Excepturi qui qui sint quia.', 140, 0, 0, 960, 0, 1563299019, 1563965768, 0, NULL, NULL, NULL, NULL, 0, '0'),
(338, 'maiores_948', 'Aut error necessitatibus omnis suscipit a.', 123, 'Corporis consectetur ipsum est facilis eum.', 520, 0, 0, 260, 0, 1563299019, 1563824394, 0, NULL, NULL, NULL, NULL, 0, '0'),
(339, 'eligendi_607', 'Quibusdam aut est non tempora dolores molestiae suscipit id.', 108, 'Quasi rem voluptas magni quae qui unde necessitatibus illo.', 330, 12, 21, 840, 0, 1563299019, 1564081266, 0, NULL, NULL, NULL, NULL, 1, '0'),
(340, 'perferendis_863', 'Sunt autem molestiae molestiae exercitationem adipisci odio autem sint.', 105, 'Aliquid voluptatem quia nihil consequuntur.', 770, 0, 0, 140, 0, 1563299019, 1563798818, 0, NULL, NULL, NULL, NULL, 0, '0'),
(341, 'facilis_179', 'Sit vel voluptatum quas molestias cumque.', 123, 'Esse suscipit modi aut ratione dicta quas accusamus.', 540, 0, 31, 170, 1, 1563299019, 1564063982, 0, NULL, NULL, NULL, NULL, 0, '0'),
(342, 'unde_901', 'Ut voluptatibus ab facilis velit id doloribus a ea assumenda.', 107, 'Praesentium maxime atque totam similique molestiae quis sit rem.', 300, 0, 0, 540, 1, 1563299019, 1563438583, 0, NULL, NULL, NULL, NULL, 0, '0'),
(343, 'et_311', NULL, 108, 'Aut possimus similique autem illum sit quae.', 840, 0, 29, 220, 0, 1563299019, 1563797965, 0, NULL, NULL, NULL, NULL, 1, '0'),
(344, 'et_275', NULL, 108, 'Veniam libero tempora eveniet dignissimos dolores molestiae omnis.', 170, 34, 26, 250, 0, 1563299019, 1564102862, 0, NULL, NULL, NULL, NULL, 1, '0'),
(345, 'doloribus_740', 'Eius veritatis sit dolorem quas natus aperiam.', 117, 'Totam adipisci nam consectetur vel.', 230, 47, 0, 920, 0, 1563299019, 1563923413, 0, NULL, NULL, NULL, NULL, 1, '0'),
(346, 'placeat_805', 'Voluptatem maiores est sit est consequatur delectus magnam saepe illum ut.', 120, 'Fugit iusto nulla rerum sit.', 470, 0, 0, 520, 1, 1563299019, 1563695059, 0, NULL, NULL, NULL, NULL, 1, '0'),
(347, 'ratione_790', 'Sunt laborum ab veritatis aut debitis dolor.', 119, 'Voluptatem laudantium velit consectetur tempore nisi amet.', 290, 48, 3, 330, 1, 1563299019, 1564050812, 0, NULL, NULL, NULL, NULL, 0, '0'),
(348, 'dolor_888', 'Consequuntur provident nostrum et et dolor.', 125, 'Consequuntur veritatis fugiat ea quam.', 900, 0, 0, 810, 0, 1563299019, 1563900439, 0, NULL, NULL, NULL, NULL, 1, '0'),
(349, 'dolores_328', 'Veritatis nemo dolores hic doloribus consectetur perspiciatis esse.', 121, 'Quia doloribus et adipisci magnam fugiat illum.', 340, 47, 0, 70, 0, 1563299019, 1563534008, 0, NULL, NULL, NULL, NULL, 0, '0'),
(350, 'excepturi_382', NULL, 119, 'Sed similique quas laboriosam laborum praesentium necessitatibus.', 630, 0, 38, 690, 0, 1563299019, 1563498157, 0, NULL, NULL, NULL, NULL, 1, '0'),
(351, 'neque_643', NULL, 120, 'Maxime voluptas omnis officia illo eos.', 560, 20, 48, 990, 0, 1563299019, 1564113247, 0, NULL, NULL, NULL, NULL, 0, '0'),
(352, 'repellat_903', 'Adipisci laboriosam unde commodi qui qui mollitia iure hic expedita et.', 106, 'Est consequatur magni molestiae est ea dignissimos molestiae.', 230, 21, 20, 540, 0, 1563299019, 1564066835, 0, NULL, NULL, NULL, NULL, 1, '0'),
(353, 'modi_117', 'Porro voluptatibus ipsa officiis recusandae possimus commodi.', 107, 'Cupiditate omnis et tempore quae dolor tempora.', 230, 18, 21, 800, 1, 1563299019, 1563586106, 0, NULL, NULL, NULL, NULL, 0, '0'),
(354, 'aut_798', NULL, 110, 'Saepe deleniti omnis id quis optio.', 670, 20, 13, 990, 0, 1563299019, 1563724824, 0, NULL, NULL, NULL, NULL, 0, '0'),
(355, 'quia_111', 'Voluptate voluptatibus quas voluptates deleniti aut tempora quis.', 117, 'Aut qui atque laudantium odit odio sit consequatur.', 830, 0, 0, 700, 1, 1563299019, 1564031114, 0, NULL, NULL, NULL, NULL, 0, '0'),
(356, 'non_923', 'Qui voluptas assumenda tempora aliquam voluptatem explicabo sint aut voluptates.', 119, 'Earum eos esse dolor rem.', 580, 0, 11, 880, 1, 1563299019, 1563660337, 0, NULL, NULL, NULL, NULL, 0, '0'),
(357, 'sed_992', 'Fuga et ea debitis quis ipsa voluptatem id.', 105, 'Officiis tempora ut tenetur quod beatae corporis.', 360, 32, 43, 950, 0, 1563299019, 1563479184, 0, NULL, NULL, NULL, NULL, 1, '0'),
(358, 'sed_694', 'Vel dolorem ratione ut ducimus unde voluptas.', 118, 'Nihil laboriosam sint doloribus iusto tempora quidem ea.', 510, 0, 0, 150, 1, 1563299019, 1563616623, 0, NULL, NULL, NULL, NULL, 1, '0'),
(359, 'sed_748', NULL, 105, 'Quod dignissimos laborum harum quisquam numquam sed amet quis.', 760, 8, 0, 970, 1, 1563299019, 1564019761, 0, NULL, NULL, NULL, NULL, 0, '0'),
(360, 'vitae_703', NULL, 106, 'Veritatis quisquam in doloremque velit qui.', 870, 0, 39, 560, 1, 1563299019, 1564144168, 0, NULL, NULL, NULL, NULL, 0, '0'),
(361, 'doloremque_583', NULL, 119, 'Accusamus autem et quae et.', 750, 0, 0, 230, 0, 1563299019, 1563709991, 0, NULL, NULL, NULL, NULL, 0, '0'),
(362, 'consectetur_912', NULL, 108, 'Tempore placeat maxime sunt aspernatur tenetur autem quia.', 710, 44, 50, 570, 0, 1563299019, 1563946243, 0, NULL, NULL, NULL, NULL, 1, '0'),
(363, 'suscipit_408', NULL, 121, 'Cum ipsum sit quibusdam occaecati aut dolor.', 580, 0, 0, 520, 1, 1563299019, 1563748917, 0, NULL, NULL, NULL, NULL, 0, '0'),
(364, 'eaque_184', NULL, 125, 'Quis et dolore vero.', 400, 0, 35, 410, 0, 1563299019, 1563457520, 0, NULL, NULL, NULL, NULL, 1, '0'),
(365, 'ea_385', NULL, 121, 'Commodi harum voluptatem necessitatibus ut.', 370, 20, 0, 370, 1, 1563299019, 1563646557, 0, NULL, NULL, NULL, NULL, 1, '0'),
(366, 'tempore_432', 'Omnis impedit magni enim distinctio quibusdam eum.', 118, 'Aut at quidem id.', 350, 15, 45, 400, 0, 1563299019, 1563881239, 0, NULL, NULL, NULL, NULL, 0, '0'),
(367, 'et_290', 'Sint error consequatur quas dicta pariatur quae ducimus.', 110, 'Minima tempora consequuntur dignissimos ab deleniti recusandae fuga.', 490, 0, 0, 590, 1, 1563299019, 1564014439, 0, NULL, NULL, NULL, NULL, 1, '0'),
(368, 'omnis_771', 'Cupiditate aperiam perspiciatis et nesciunt officiis aut.', 125, 'Eligendi sequi dolorem ipsum assumenda autem.', 220, 35, 0, 430, 0, 1563299019, 1563408334, 0, NULL, NULL, NULL, NULL, 1, '0'),
(369, 'omnis_615', NULL, 117, 'Consequatur laborum molestiae officia quo.', 350, 0, 0, 630, 1, 1563299019, 1564239385, 0, NULL, NULL, NULL, NULL, 0, '0'),
(370, 'aut_622', 'Corrupti amet facilis tempore explicabo incidunt perspiciatis ipsam unde veniam aut.', 114, 'At culpa ea qui eaque.', 450, 0, 7, 740, 1, 1563299019, 1564196948, 0, NULL, NULL, NULL, NULL, 0, '0'),
(371, 'vel_872', NULL, 119, 'Et ex doloribus consequatur et distinctio quos autem eum.', 100, 0, 0, 820, 0, 1563299019, 1563536456, 0, NULL, NULL, NULL, NULL, 1, '0'),
(372, 'placeat_567', 'Repudiandae excepturi voluptatibus dolor suscipit est inventore deleniti vel rerum earum.', 110, 'Culpa dolorum sed consequatur suscipit.', 840, 44, 0, 720, 0, 1563299019, 1563887860, 0, NULL, NULL, NULL, NULL, 0, '0'),
(373, 'voluptatem_293', 'Et dolores tempore autem voluptatem dolor nam officia ut sequi distinctio perferendis.', 117, 'Velit et consequatur qui id eveniet dolor.', 610, 11, 0, 870, 1, 1563299019, 1563646849, 0, NULL, NULL, NULL, NULL, 0, '0'),
(374, 'expedita_490', 'Dolores a voluptatem expedita occaecati.', 116, 'Inventore voluptate totam ut commodi nisi ad quam.', 310, 0, 0, 220, 1, 1563299019, 1563974611, 0, NULL, NULL, NULL, NULL, 1, '0'),
(375, 'facere_938', 'Delectus dignissimos commodi error consequatur.', 108, 'Sed est consequuntur fugiat sunt cumque eveniet similique.', 310, 3, 0, 510, 1, 1563299019, 1563426027, 0, NULL, NULL, NULL, NULL, 1, '0'),
(376, 'est_961', NULL, 112, 'In dolorem explicabo sunt impedit dolorem.', 340, 0, 0, 610, 1, 1563299019, 1563943313, 0, NULL, NULL, NULL, NULL, 0, '0'),
(377, 'exercitationem_756', 'Consequatur reprehenderit quia consequatur voluptatem rerum voluptate.', 120, 'Et officia dicta vitae illo perferendis officiis.', 70, 34, 0, 100, 0, 1563299019, 1563845971, 0, NULL, NULL, NULL, NULL, 0, '0'),
(378, 'inventore_748', NULL, 105, 'Ex a beatae ratione repellat quidem alias.', 540, 47, 0, 450, 1, 1563299019, 1563471143, 0, NULL, NULL, NULL, NULL, 1, '0'),
(379, 'laborum_454', 'Et adipisci quia quisquam ut optio nesciunt deleniti in ut aut.', 105, 'Consequatur quasi et nulla velit blanditiis rerum.', 860, 0, 0, 490, 0, 1563299019, 1563649560, 0, NULL, NULL, NULL, NULL, 1, '0'),
(380, 'accusamus_235', NULL, 122, 'Reprehenderit iure aut magnam ipsam error.', 970, 47, 0, 130, 1, 1563299019, 1563778136, 0, NULL, NULL, NULL, NULL, 1, '0'),
(381, 'qui_561', 'Officiis quia quam quos quibusdam eos accusamus.', 107, 'Aspernatur eos nisi recusandae cumque.', 920, 16, 0, 350, 0, 1563299019, 1563703606, 0, NULL, NULL, NULL, NULL, 1, '0'),
(382, 'exercitationem_874', NULL, 119, 'Quae aliquam nihil voluptatum magni qui modi.', 350, 10, 0, 480, 1, 1563299019, 1564066012, 0, NULL, NULL, NULL, NULL, 1, '0'),
(383, 'maiores_372', 'Enim et iste quaerat distinctio fugiat veniam qui fuga tempore.', 116, 'Atque vitae in animi exercitationem velit.', 200, 0, 9, 650, 1, 1563299019, 1563447059, 0, NULL, NULL, NULL, NULL, 1, '0'),
(384, 'tenetur_398', NULL, 115, 'Repudiandae at non omnis enim dolorem.', 200, 24, 46, 360, 1, 1563299019, 1564202542, 0, NULL, NULL, NULL, NULL, 0, '0'),
(385, 'illum_102', NULL, 117, 'Sunt laborum nam sit omnis earum reiciendis molestias.', 580, 45, 0, 930, 0, 1563299019, 1563821473, 0, NULL, NULL, NULL, NULL, 1, '0'),
(386, 'voluptates_377', NULL, 121, 'Vero quisquam ex optio qui.', 520, 28, 49, 980, 1, 1563299019, 1563919091, 0, NULL, NULL, NULL, NULL, 0, '0'),
(387, 'quos_360', NULL, 115, 'Eaque culpa non aut officia ut placeat ullam.', 560, 0, 0, 160, 0, 1563299019, 1563692242, 0, NULL, NULL, NULL, NULL, 1, '0'),
(388, 'quod_120', 'Consectetur rerum deleniti omnis enim qui corporis dolores.', 117, 'Eaque autem autem eos neque.', 980, 47, 0, 530, 1, 1563299019, 1563765710, 0, NULL, NULL, NULL, NULL, 0, '0'),
(389, 'sed_349', NULL, 121, 'Nihil et cum non ut ut.', 720, 27, 50, 590, 0, 1563299019, 1563869787, 0, NULL, NULL, NULL, NULL, 1, '0'),
(390, 'qui_925', 'Esse assumenda esse est nisi quam fuga.', 121, 'Aperiam nobis voluptatum incidunt animi debitis ipsa qui alias.', 530, 0, 37, 820, 1, 1563299019, 1563663623, 0, NULL, NULL, NULL, NULL, 0, '0'),
(391, 'sapiente_387', 'Fugit debitis praesentium quia pariatur vitae neque ut.', 105, 'A et quas quo autem quae ut.', 390, 0, 5, 800, 0, 1563299019, 1564023825, 0, NULL, NULL, NULL, NULL, 0, '0'),
(392, 'beatae_248', 'Neque consequatur sed corrupti dolor repudiandae.', 113, 'Et quia quam molestias sit.', 450, 0, 0, 800, 1, 1563299019, 1563793880, 0, NULL, NULL, NULL, NULL, 0, '0'),
(393, 'est_941', NULL, 112, 'Dolor numquam dolor perferendis consequatur.', 960, 0, 0, 1000, 0, 1563299019, 1563701278, 0, NULL, NULL, NULL, NULL, 0, '0'),
(394, 'est_539', 'Officiis inventore vel velit tempora voluptatum blanditiis aut consequatur error quis ipsam.', 107, 'Reiciendis voluptatem rerum at tempora ad.', 400, 43, 0, 570, 1, 1563299019, 1564176411, 0, NULL, NULL, NULL, NULL, 1, '0'),
(395, 'distinctio_149', NULL, 110, 'Itaque aut autem impedit fugiat cumque.', 260, 0, 12, 290, 1, 1563299019, 1563628425, 0, NULL, NULL, NULL, NULL, 0, '0'),
(396, 'fuga_667', 'Labore quam sed qui dolorem est et ducimus.', 117, 'Cum rerum fuga optio veritatis iusto eaque architecto.', 60, 15, 0, 280, 0, 1563299019, 1564204373, 0, NULL, NULL, NULL, NULL, 1, '0'),
(397, 'aliquam_416', 'Illo atque ut voluptatem id vero sequi aliquam in.', 112, 'Eveniet provident corporis nisi id autem et et quis.', 810, 0, 0, 790, 0, 1563299019, 1563852700, 0, NULL, NULL, NULL, NULL, 0, '0'),
(398, 'et_878', 'Culpa nulla quae molestiae blanditiis quam sapiente dignissimos enim et ipsa.', 125, 'Repellendus occaecati ea labore sit odit.', 910, 0, 0, 990, 0, 1563299019, 1563924552, 0, NULL, NULL, NULL, NULL, 1, '0'),
(399, 'eum_450', NULL, 116, 'Sequi est optio animi quo.', 530, 0, 36, 730, 1, 1563299019, 1563950650, 0, NULL, NULL, NULL, NULL, 1, '0'),
(400, 'illum_848', NULL, 112, 'Qui labore est sit tempore.', 130, 0, 9, 360, 0, 1563299019, 1563679375, 0, NULL, NULL, NULL, NULL, 0, '0'),
(401, 'culpa_520', 'Qui quasi fugit commodi ut quod.', 110, 'Explicabo explicabo earum omnis perspiciatis.', 900, 44, 0, 780, 0, 1563299019, 1564010764, 0, NULL, NULL, NULL, NULL, 1, '0'),
(402, 'aut_178', 'Voluptatibus vel at molestiae vero accusantium accusantium expedita autem.', 117, 'Quae consequatur minima in maxime ea ipsam.', 190, 4, 42, 270, 0, 1563299019, 1564008062, 0, NULL, NULL, NULL, NULL, 1, '0'),
(403, 'dignissimos_136', NULL, 116, 'In iusto voluptas nesciunt molestias est aliquam accusantium.', 800, 44, 0, 780, 1, 1563299019, 1564061530, 0, NULL, NULL, NULL, NULL, 0, '0'),
(404, 'perferendis_540', NULL, 121, 'Dolor est nemo voluptas dolorem consectetur blanditiis necessitatibus.', 720, 0, 19, 180, 1, 1563299019, 1563730148, 0, NULL, NULL, NULL, NULL, 1, '0'),
(405, 'eos_779', NULL, 122, 'Explicabo nostrum officiis sunt.', 940, 5, 0, 830, 1, 1563299019, 1563648251, 0, NULL, NULL, NULL, NULL, 1, '0'),
(406, 'sequi_835', NULL, 119, 'Nihil ipsam et voluptas molestias et accusantium.', 810, 0, 0, 460, 0, 1563299019, 1564208910, 0, NULL, NULL, NULL, NULL, 1, '0'),
(407, 'voluptates_611', NULL, 108, 'Quia velit laboriosam minima perspiciatis dolor veniam.', 620, 0, 36, 110, 0, 1563299019, 1564261730, 0, NULL, NULL, NULL, NULL, 1, '0'),
(408, 'nesciunt_774', 'Aut officia dolorem iste dicta aut aut perspiciatis consequatur.', 120, 'Illo dolores hic minus quasi sed.', 710, 0, 0, 680, 0, 1563299019, 1563453317, 0, NULL, NULL, NULL, NULL, 1, '0'),
(409, 'saepe_427', 'Maiores itaque tempore totam et ex quia.', 116, 'Assumenda possimus unde dolores et omnis odio.', 290, 0, 0, 430, 0, 1563299019, 1564107505, 0, NULL, NULL, NULL, NULL, 0, '0'),
(410, 'ut_984', NULL, 117, 'Omnis unde soluta temporibus velit.', 210, 0, 21, 680, 0, 1563299019, 1564117721, 0, NULL, NULL, NULL, NULL, 1, '0'),
(411, 'sit_185', NULL, 105, 'Amet harum eum in consequatur qui quisquam autem.', 460, 0, 0, 580, 1, 1563299019, 1563931914, 0, NULL, NULL, NULL, NULL, 1, '0'),
(412, 'minus_535', 'Blanditiis nihil alias sint esse saepe quia.', 105, 'Hic unde voluptates molestiae quod voluptatem odio quaerat fugiat.', 70, 0, 7, 510, 0, 1563299019, 1563574134, 0, NULL, NULL, NULL, NULL, 0, '0'),
(413, 'dolor_388', NULL, 121, 'Rerum est reprehenderit consequatur molestiae est dolores a et.', 510, 0, 0, 270, 1, 1563299019, 1563605667, 0, NULL, NULL, NULL, NULL, 1, '0'),
(414, 'mollitia_583', NULL, 110, 'Provident reiciendis eos est repellat cum eligendi quis.', 420, 0, 14, 540, 1, 1563299019, 1563424241, 0, NULL, NULL, NULL, NULL, 0, '0'),
(415, 'possimus_305', NULL, 107, 'Voluptatum eaque ex aut porro corporis et eius illum.', 700, 0, 0, 510, 0, 1563299019, 1564057131, 0, NULL, NULL, NULL, NULL, 0, '0'),
(416, 'voluptatum_358', 'Sed et aut molestiae et sint non ut magnam.', 120, 'Ullam architecto blanditiis magni.', 990, 0, 22, 1000, 1, 1563299019, 1564074168, 0, NULL, NULL, NULL, NULL, 0, '0'),
(417, 'sint_928', NULL, 122, 'Eveniet deleniti assumenda ullam sint nesciunt aut animi.', 430, 0, 16, 190, 1, 1563299019, 1564124303, 0, NULL, NULL, NULL, NULL, 0, '0'),
(418, 'qui_418', NULL, 115, 'Accusantium iusto laborum aut assumenda ut.', 330, 0, 0, 870, 0, 1563299019, 1563972717, 0, NULL, NULL, NULL, NULL, 0, '0'),
(419, 'vel_925', NULL, 117, 'Rerum aperiam voluptatum corporis molestiae est sit.', 970, 16, 0, 750, 1, 1563299019, 1563681815, 0, NULL, NULL, NULL, NULL, 0, '0'),
(420, 'nostrum_754', NULL, 110, 'Velit esse animi est aperiam consequatur minima dolor alias.', 630, 27, 2, 510, 1, 1563299020, 1564052383, 0, NULL, NULL, NULL, NULL, 0, '0'),
(421, 'excepturi_109', NULL, 105, 'Dolorem ad fugit voluptate quasi.', 500, 4, 28, 730, 1, 1563299020, 1563878426, 0, NULL, NULL, NULL, NULL, 0, '0'),
(422, 'necessitatibus_242', 'Et ut sed voluptates optio et est mollitia.', 118, 'Dolores et quia qui ad ut.', 110, 3, 0, 930, 0, 1563299020, 1563619952, 0, NULL, NULL, NULL, NULL, 1, '0'),
(423, 'mollitia_739', NULL, 112, 'Aspernatur sequi voluptas aut cum ut aut.', 60, 10, 0, 260, 0, 1563299020, 1564251056, 0, NULL, NULL, NULL, NULL, 1, '0'),
(424, 'pariatur_422', NULL, 113, 'Aut voluptatem pariatur officiis cum accusamus.', 170, 30, 0, 520, 0, 1563299020, 1563946034, 0, NULL, NULL, NULL, NULL, 0, '0'),
(425, 'et_852', NULL, 110, 'At nostrum dolor officiis tempora.', 640, 0, 45, 150, 1, 1563299020, 1563647943, 0, NULL, NULL, NULL, NULL, 1, '0'),
(426, 'repudiandae_225', 'Eos voluptatum et sunt aperiam eveniet.', 107, 'Nihil voluptatibus voluptas ea iure pariatur deserunt est.', 360, 33, 0, 150, 1, 1563299020, 1563681518, 0, NULL, NULL, NULL, NULL, 0, '0'),
(427, 'repellat_441', NULL, 116, 'Quis ipsam non harum eum.', 910, 0, 50, 1000, 0, 1563299020, 1563699517, 0, NULL, NULL, NULL, NULL, 1, '0'),
(428, 'modi_703', NULL, 120, 'Corrupti similique ipsum et repellendus blanditiis eius accusantium.', 860, 37, 30, 350, 1, 1563299020, 1564203453, 0, NULL, NULL, NULL, NULL, 0, '0'),
(429, 'officia_747', 'Culpa numquam ut earum necessitatibus odio velit explicabo libero est rerum.', 125, 'Animi eius beatae eum eveniet.', 310, 42, 0, 700, 0, 1563299020, 1563415130, 0, NULL, NULL, NULL, NULL, 0, '0'),
(430, 'quae_758', NULL, 116, 'Amet dolores iure magnam sint ab exercitationem.', 560, 0, 6, 980, 0, 1563299020, 1563445651, 0, NULL, NULL, NULL, NULL, 1, '0'),
(431, 'repudiandae_639', 'Perferendis quia impedit repellendus voluptatibus cupiditate.', 117, 'Consequuntur reprehenderit sit quae.', 980, 0, 0, 1000, 0, 1563299020, 1563648259, 0, NULL, NULL, NULL, NULL, 0, '0'),
(432, 'qui_279', 'Saepe quo dolorem explicabo sed in vel tempora.', 121, 'Maiores maxime numquam incidunt possimus doloremque molestias.', 810, 48, 40, 990, 1, 1563299020, 1563826316, 0, NULL, NULL, NULL, NULL, 1, '0'),
(433, 'corrupti_570', 'Ab tempora eveniet quae ea molestiae magnam numquam.', 108, 'Qui eum voluptatem est ut voluptatibus qui.', 80, 23, 0, 760, 0, 1563299020, 1563484068, 0, NULL, NULL, NULL, NULL, 0, '0'),
(434, 'ut_950', 'Consectetur perspiciatis consectetur aliquid optio quia dolorem illum sunt ut.', 107, 'Officia quia tempore qui aliquam.', 310, 0, 0, 450, 1, 1563299020, 1563968564, 0, NULL, NULL, NULL, NULL, 1, '0'),
(435, 'aspernatur_471', NULL, 107, 'Illo ab alias laudantium et modi velit deleniti.', 830, 23, 0, 800, 0, 1563299020, 1563838188, 0, NULL, NULL, NULL, NULL, 0, '0'),
(436, 'quo_125', 'Eius ullam consequatur laboriosam deleniti vitae dolore magni exercitationem non debitis sit.', 110, 'Laudantium consequuntur fuga ratione eos.', 760, 0, 25, 980, 1, 1563299020, 1563753281, 0, NULL, NULL, NULL, NULL, 1, '0'),
(437, 'voluptatibus_264', 'Veritatis maxime assumenda harum reprehenderit nostrum amet.', 118, 'Perspiciatis est deserunt asperiores hic.', 100, 20, 0, 570, 1, 1563299020, 1563649370, 0, NULL, NULL, NULL, NULL, 0, '0'),
(438, 'aut_220', NULL, 123, 'Aut facilis aut non.', 550, 0, 0, 880, 1, 1563299020, 1563461959, 0, NULL, NULL, NULL, NULL, 0, '0'),
(439, 'quos_760', 'Veritatis laudantium nihil est natus est temporibus quasi dolores voluptatem et.', 114, 'Libero ad aperiam saepe suscipit rem quis sequi.', 170, 0, 33, 360, 0, 1563299020, 1563824736, 0, NULL, NULL, NULL, NULL, 1, '0'),
(440, 'atque_457', NULL, 117, 'Earum aut autem inventore quis.', 460, 9, 0, 450, 1, 1563299020, 1563513899, 0, NULL, NULL, NULL, NULL, 1, '0'),
(441, 'omnis_800', NULL, 119, 'Aut ipsa consequatur vero necessitatibus laboriosam ut.', 760, 50, 0, 580, 1, 1563299020, 1563811705, 0, NULL, NULL, NULL, NULL, 1, '0'),
(442, 'autem_719', 'Culpa officiis sit sit nemo magnam ut natus et cum.', 118, 'Saepe voluptas officiis eos illo velit odit quis.', 540, 2, 0, 80, 1, 1563299020, 1563931046, 0, NULL, NULL, NULL, NULL, 1, '0'),
(443, 'ipsa_822', NULL, 121, 'Velit iusto voluptatibus eligendi maiores aut.', 400, 0, 0, 350, 0, 1563299020, 1564185065, 0, NULL, NULL, NULL, NULL, 1, '0'),
(444, 'nulla_812', NULL, 121, 'Aut dolorum illo amet ea.', 960, 0, 0, 620, 0, 1563299020, 1563837972, 0, NULL, NULL, NULL, NULL, 0, '0'),
(445, 'dolor_731', NULL, 110, 'Officia et nemo rem facilis ea totam perferendis.', 700, 0, 0, 180, 1, 1563299020, 1564118021, 0, NULL, NULL, NULL, NULL, 1, '0'),
(446, 'eligendi_327', NULL, 110, 'Omnis nisi dolorem eos corporis vel soluta qui.', 950, 0, 0, 740, 1, 1563299020, 1563747824, 0, NULL, NULL, NULL, NULL, 0, '0'),
(447, 'aut_561', 'Officia earum ab quisquam dolores autem ea accusamus dolores velit voluptas.', 115, 'Nesciunt et consequatur culpa voluptas alias veniam recusandae.', 350, 17, 0, 650, 0, 1563299020, 1564203199, 0, NULL, NULL, NULL, NULL, 0, '0'),
(448, 'fuga_678', 'Non vel ea a facilis possimus.', 115, 'Nisi eveniet quis neque et consequatur fugiat rem.', 220, 6, 4, 110, 1, 1563299020, 1563524599, 0, NULL, NULL, NULL, NULL, 0, '0'),
(449, 'nostrum_822', 'Deserunt tempora tenetur doloremque sunt ut aut unde sit.', 119, 'Ab sunt sequi minima voluptate a aut.', 920, 7, 6, 870, 1, 1563299020, 1563611215, 0, NULL, NULL, NULL, NULL, 0, '0'),
(450, 'est_805', NULL, 121, 'Tempore aut amet velit iure minus eos.', 590, 8, 9, 520, 1, 1563299020, 1564031082, 0, NULL, NULL, NULL, NULL, 1, '0'),
(451, 'iste_149', NULL, 110, 'Velit molestiae non eum et et distinctio.', 80, 0, 0, 690, 0, 1563299020, 1563404424, 0, NULL, NULL, NULL, NULL, 0, '0'),
(452, 'et_943', NULL, 119, 'Temporibus numquam non similique nihil.', 60, 35, 32, 120, 0, 1563299020, 1563532187, 0, NULL, NULL, NULL, NULL, 1, '0'),
(453, 'ea_626', NULL, 115, 'Est delectus explicabo quia corporis et adipisci.', 520, 21, 33, 380, 0, 1563299020, 1564121226, 0, NULL, NULL, NULL, NULL, 1, '0'),
(454, 'sint_904', NULL, 123, 'Eos voluptates necessitatibus excepturi.', 860, 0, 0, 940, 1, 1563299020, 1564197835, 0, NULL, NULL, NULL, NULL, 1, '0'),
(455, 'et_914', NULL, 123, 'Omnis perspiciatis est exercitationem asperiores.', 100, 0, 50, 690, 1, 1563299020, 1563472155, 0, NULL, NULL, NULL, NULL, 1, '0'),
(456, 'qui_826', 'Odio et saepe ea quaerat debitis commodi.', 118, 'Excepturi non voluptatem tempora dignissimos doloremque omnis esse.', 100, 10, 13, 850, 1, 1563299020, 1564164621, 0, NULL, NULL, NULL, NULL, 0, '0'),
(457, 'accusantium_786', NULL, 116, 'Quo deleniti amet fuga.', 750, 29, 48, 270, 1, 1563299020, 1563772116, 0, NULL, NULL, NULL, NULL, 1, '0'),
(458, 'temporibus_297', 'Nulla rerum nostrum quasi blanditiis non nam eum est.', 122, 'Odit quisquam est sint quia odit dolore perferendis repellat.', 940, 2, 0, 390, 0, 1563299020, 1563851222, 0, NULL, NULL, NULL, NULL, 1, '0'),
(459, 'quisquam_569', 'Id facilis ex perferendis nulla reprehenderit aliquam est earum.', 117, 'Quibusdam nobis consequatur quasi et earum ducimus corporis.', 620, 0, 14, 720, 1, 1563299020, 1563611291, 0, NULL, NULL, NULL, NULL, 1, '0'),
(460, 'molestiae_688', 'Quia a et suscipit consequatur.', 123, 'Magni harum quia dolores quos.', 370, 0, 0, 850, 0, 1563299020, 1563981170, 0, NULL, NULL, NULL, NULL, 1, '0'),
(461, 'accusamus_418', NULL, 114, 'Et vero amet in magni.', 440, 27, 4, 470, 0, 1563299020, 1564079147, 0, NULL, NULL, NULL, NULL, 0, '0'),
(462, 'inventore_314', NULL, 122, 'Veritatis porro porro magnam est et molestiae repellat omnis.', 1000, 46, 3, 160, 1, 1563299020, 1563678184, 0, NULL, NULL, NULL, NULL, 0, '0'),
(463, 'ut_515', NULL, 107, 'Reprehenderit sint ea nulla.', 500, 0, 39, 620, 1, 1563299020, 1564278362, 0, NULL, NULL, NULL, NULL, 0, '0'),
(464, 'magni_989', 'Sit alias fugit optio quibusdam officiis sit rerum consequuntur ducimus.', 108, 'Ab corrupti qui praesentium.', 290, 0, 21, 200, 0, 1563299020, 1563416264, 0, NULL, NULL, NULL, NULL, 1, '0'),
(465, 'doloremque_999', 'Omnis officiis id et qui ut sint et repudiandae aut.', 107, 'Sit voluptas praesentium vitae sequi repellendus sunt.', 320, 0, 18, 380, 1, 1563299020, 1563648200, 0, NULL, NULL, NULL, NULL, 0, '0'),
(466, 'nobis_253', NULL, 106, 'Maxime rem eos id perspiciatis in.', 400, 0, 7, 730, 0, 1563299020, 1564005774, 0, NULL, NULL, NULL, NULL, 1, '0'),
(467, 'atque_922', NULL, 107, 'Mollitia molestiae qui inventore aut itaque esse.', 210, 35, 0, 60, 0, 1563299020, 1563687898, 0, NULL, NULL, NULL, NULL, 1, '0'),
(468, 'quos_510', 'Ullam eius atque nam provident autem sed sed nemo.', 105, 'Accusantium commodi aut quos eos eum accusantium.', 700, 39, 25, 960, 1, 1563299020, 1563546995, 0, NULL, NULL, NULL, NULL, 1, '0'),
(469, 'ut_656', 'Et illo ducimus et quas minima.', 123, 'Adipisci corrupti amet eos atque atque.', 800, 50, 0, 730, 0, 1563299020, 1564047040, 0, NULL, NULL, NULL, NULL, 0, '0'),
(470, 'in_357', NULL, 119, 'Voluptatem consectetur quia sit aut temporibus fugit quidem.', 640, 0, 37, 940, 0, 1563299020, 1563964491, 0, NULL, NULL, NULL, NULL, 0, '0'),
(471, 'iusto_690', NULL, 105, 'Rerum cum occaecati vero aperiam nisi.', 810, 0, 22, 330, 1, 1563299020, 1563950942, 0, NULL, NULL, NULL, NULL, 1, '0'),
(472, 'asperiores_310', NULL, 118, 'Ipsum id cum est ab.', 500, 11, 0, 960, 1, 1563299020, 1563821299, 0, NULL, NULL, NULL, NULL, 1, '0'),
(473, 'dolor_401', 'Est sed quia at unde quia culpa.', 123, 'Illo tenetur placeat facere quod et.', 610, 36, 22, 190, 1, 1563299020, 1563566326, 0, NULL, NULL, NULL, NULL, 1, '0'),
(474, 'ea_609', 'Est et quibusdam in explicabo non quibusdam nam.', 118, 'Necessitatibus dolore eos maxime accusamus.', 860, 0, 0, 550, 1, 1563299020, 1564172284, 0, NULL, NULL, NULL, NULL, 1, '0'),
(475, 'esse_280', NULL, 117, 'Autem ullam maiores omnis ipsa facilis eligendi autem.', 540, 24, 0, 60, 0, 1563299020, 1564286029, 0, NULL, NULL, NULL, NULL, 1, '0'),
(476, 'culpa_159', 'Vel fuga maiores dicta architecto ut.', 119, 'Et dolor odio dolorem ut omnis voluptate esse.', 200, 20, 0, 260, 0, 1563299020, 1563862435, 0, NULL, NULL, NULL, NULL, 0, '0'),
(477, 'ex_623', 'Totam harum recusandae ipsa qui sit vero voluptates laboriosam ipsa.', 107, 'Ipsum animi maiores sapiente quis reiciendis.', 250, 49, 49, 910, 0, 1563299020, 1563451372, 0, NULL, NULL, NULL, NULL, 0, '0'),
(478, 'porro_312', 'Autem et officiis ipsa nihil assumenda et laboriosam.', 120, 'Sapiente eaque veritatis culpa ut ullam repellat ad.', 550, 50, 34, 890, 0, 1563299020, 1564288992, 0, NULL, NULL, NULL, NULL, 0, '0'),
(479, 'minus_532', NULL, 121, 'Sit est eum aliquam nobis incidunt corporis soluta magnam.', 380, 8, 0, 70, 1, 1563299020, 1564040451, 0, NULL, NULL, NULL, NULL, 0, '0'),
(480, 'sapiente_585', 'Sapiente et dicta ut vitae soluta laborum ratione amet exercitationem.', 112, 'Hic quo dolorem sit.', 880, 0, 20, 1000, 0, 1563299020, 1563964587, 0, NULL, NULL, NULL, NULL, 1, '0'),
(481, 'quo_204', 'A culpa harum qui quia repudiandae quos cumque.', 123, 'Est assumenda cupiditate minus.', 120, 0, 0, 650, 1, 1563299020, 1563497109, 0, NULL, NULL, NULL, NULL, 0, '0'),
(482, 'possimus_514', NULL, 117, 'Autem et id voluptas illum.', 620, 0, 0, 820, 1, 1563299020, 1563644239, 0, NULL, NULL, NULL, NULL, 0, '0'),
(483, 'voluptates_331', 'Nesciunt aut aut non suscipit quidem aspernatur deserunt harum delectus aut cum.', 117, 'Ut officiis tempora vel ab omnis temporibus quis dolor.', 50, 16, 0, 420, 1, 1563299020, 1563478003, 0, NULL, NULL, NULL, NULL, 0, '0'),
(484, 'nihil_924', NULL, 123, 'Ipsam et molestias exercitationem placeat.', 400, 9, 0, 80, 1, 1563299020, 1564176458, 0, NULL, NULL, NULL, NULL, 1, '0'),
(485, 'sint_618', NULL, 108, 'Tenetur excepturi et et facere.', 820, 1, 0, 140, 0, 1563299020, 1563932466, 0, NULL, NULL, NULL, NULL, 1, '0'),
(486, 'doloremque_813', NULL, 105, 'Veniam quia libero quis aperiam sed nulla autem.', 700, 0, 45, 500, 1, 1563299020, 1563648721, 0, NULL, NULL, NULL, NULL, 1, '0'),
(487, 'perferendis_726', 'Sint eos odit autem facilis illo fugiat voluptas distinctio optio.', 120, 'Quisquam amet molestias quis iure.', 110, 0, 0, 480, 0, 1563299020, 1563864803, 0, NULL, NULL, NULL, NULL, 1, '0'),
(488, 'recusandae_434', NULL, 121, 'Nihil deleniti sunt aliquid voluptatem quod placeat.', 420, 38, 36, 380, 1, 1563299020, 1564199991, 0, NULL, NULL, NULL, NULL, 1, '0'),
(489, 'aliquid_198', 'Ipsum officia eligendi aut doloremque labore.', 114, 'Quas facilis saepe quis rem.', 840, 50, 0, 180, 1, 1563299020, 1563758623, 0, NULL, NULL, NULL, NULL, 0, '0'),
(490, 'quibusdam_887', 'Et eos ipsum incidunt provident qui eum.', 105, 'Saepe id beatae blanditiis explicabo dolorem cumque est.', 990, 47, 44, 380, 1, 1563299020, 1563820610, 0, NULL, NULL, NULL, NULL, 0, '0'),
(491, 'exercitationem_430', 'Quia consequatur necessitatibus dolor rem voluptatem pariatur laudantium et.', 118, 'Magni consequatur voluptatem ipsam voluptatibus.', 530, 36, 16, 450, 1, 1563299020, 1564190790, 0, NULL, NULL, NULL, NULL, 1, '0'),
(492, 'alias_467', 'Perferendis eligendi magni et iste occaecati quo.', 119, 'Adipisci tempora omnis rem et praesentium.', 540, 4, 44, 640, 1, 1563299020, 1563450560, 0, NULL, NULL, NULL, NULL, 0, '0'),
(493, 'et_984', NULL, 107, 'Quo accusantium nihil iure quia velit.', 690, 17, 40, 120, 1, 1563299020, 1563419312, 0, NULL, NULL, NULL, NULL, 1, '0'),
(494, 'voluptas_969', NULL, 116, 'Laudantium blanditiis commodi quidem non.', 210, 0, 0, 380, 1, 1563299020, 1564262630, 0, NULL, NULL, NULL, NULL, 0, '0'),
(495, 'laboriosam_895', 'Vel nihil sed ut qui accusantium ea quod eum impedit.', 121, 'Reprehenderit beatae consectetur numquam tempora sequi ut numquam.', 290, 48, 0, 930, 0, 1563299020, 1563513112, 0, NULL, NULL, NULL, NULL, 1, '0'),
(496, 'itaque_781', NULL, 117, 'Et dolor voluptas voluptatem voluptas perspiciatis est.', 710, 50, 18, 200, 0, 1563299020, 1563436081, 0, NULL, NULL, NULL, NULL, 0, '0'),
(497, 'aut_155', NULL, 119, 'Earum porro omnis eum repellat ad ut aut veritatis.', 800, 5, 0, 280, 0, 1563299020, 1564028869, 0, NULL, NULL, NULL, NULL, 1, '0'),
(498, 'voluptas_717', NULL, 105, 'Qui cum corrupti perferendis est.', 930, 29, 0, 610, 0, 1563299020, 1563689331, 0, NULL, NULL, NULL, NULL, 0, '0'),
(499, 'repudiandae_708', 'Molestiae optio consequuntur repellendus voluptatibus cumque rerum.', 120, 'Ullam consequatur minus numquam exercitationem quisquam.', 240, 50, 10, 980, 0, 1563299020, 1564259025, 0, NULL, NULL, NULL, NULL, 1, '0'),
(500, 'adipisci_224', 'Ipsa rerum et accusamus autem nihil dolorum eaque.', 107, 'Voluptatem aut ratione eum quis quis.', 980, 0, 0, 960, 1, 1563299020, 1564229549, 0, NULL, NULL, NULL, NULL, 0, '0'),
(501, 'quia_982', NULL, 115, 'Officiis magni ut qui velit iste et ea minima.', 750, 0, 0, 530, 0, 1563299020, 1563484380, 0, NULL, NULL, NULL, NULL, 1, '0'),
(502, 'ut_984', NULL, 115, 'Vitae et nihil quidem eum excepturi omnis nulla saepe.', 320, 0, 0, 120, 0, 1563299020, 1564025077, 0, NULL, NULL, NULL, NULL, 0, '0'),
(503, 'voluptas_304', 'Sunt sunt nostrum sint sunt at magni qui id.', 115, 'Id sint iste voluptate vitae animi impedit.', 830, 33, 50, 180, 0, 1563299020, 1563702830, 0, NULL, NULL, NULL, NULL, 1, '0'),
(504, 'eaque_423', 'Magnam iusto facilis et nulla dolor repudiandae.', 115, 'Hic autem accusamus iure dolores a mollitia.', 650, 47, 1, 310, 0, 1563299020, 1564004582, 0, NULL, NULL, NULL, NULL, 1, '0'),
(505, 'ut_554', 'Minima fuga quia quis officia beatae cupiditate impedit distinctio et molestiae.', 115, 'Libero sit est praesentium quis in aliquam.', 150, 42, 5, 340, 0, 1563299020, 1563466408, 0, NULL, NULL, NULL, NULL, 1, '0'),
(506, 'et_755', 'Et quo deleniti earum iste id nesciunt sit.', 115, 'Sint ad et saepe accusantium dolores aliquid voluptatibus.', 670, 48, 17, 530, 1, 1563299020, 1563858452, 0, NULL, NULL, NULL, NULL, 0, '0'),
(507, 'nostrum_766', 'Dolore et a maxime facilis laudantium aut id illum.', 115, 'Libero expedita commodi corporis voluptas eum dolorem nam.', 910, 45, 36, 380, 1, 1563299020, 1563778131, 0, NULL, NULL, NULL, NULL, 0, '0'),
(508, 'non_717', 'Molestiae dolor ex quo libero qui enim.', 115, 'Ut dolorem delectus molestiae aspernatur.', 1000, 0, 0, 550, 0, 1563299020, 1563653445, 0, NULL, NULL, NULL, NULL, 0, '0'),
(509, 'ex_419', NULL, 115, 'Qui tenetur consequatur id illo qui.', 450, 38, 0, 900, 1, 1563299020, 1564092965, 0, NULL, NULL, NULL, NULL, 0, '0'),
(510, 'autem_288', NULL, 115, 'Minima a assumenda numquam atque.', 660, 0, 0, 440, 1, 1563299020, 1564031748, 0, NULL, NULL, NULL, NULL, 1, '0'),
(511, 'perferendis_589', 'Cupiditate dignissimos blanditiis molestias pariatur earum omnis nisi.', 115, 'Vel voluptatem enim voluptatem placeat vitae.', 960, 0, 0, 680, 0, 1563299020, 1563406850, 0, NULL, NULL, NULL, NULL, 1, '0'),
(512, 'vel_633', 'Modi occaecati quidem mollitia placeat neque quae fugit consequatur.', 115, 'Sed magnam facere ipsa velit sit.', 460, 0, 0, 320, 0, 1563299020, 1563657822, 0, NULL, NULL, NULL, NULL, 1, '0'),
(513, 'mollitia_244', 'Iste fugiat aut quos quidem saepe.', 115, 'Dolores voluptatum sed quia quod nobis.', 250, 40, 0, 480, 1, 1563299021, 1563556526, 0, NULL, NULL, NULL, NULL, 0, '0'),
(514, 'placeat_237', NULL, 115, 'Quo ut et non blanditiis ut.', 630, 37, 18, 60, 0, 1563299021, 1563984559, 0, NULL, NULL, NULL, NULL, 0, '0'),
(515, 'ducimus_932', NULL, 115, 'Et perferendis quas est hic nulla totam voluptate.', 230, 0, 0, 100, 0, 1563299021, 1563787489, 0, NULL, NULL, NULL, NULL, 0, '0'),
(516, 'voluptatem_545', NULL, 115, 'Dicta ipsa vitae ipsum sed officiis consectetur facilis.', 520, 37, 0, 340, 0, 1563299021, 1563429080, 0, NULL, NULL, NULL, NULL, 0, '0'),
(517, 'quo_942', 'Neque eius omnis reiciendis doloremque sed corporis ab omnis suscipit ex.', 115, 'Veritatis nostrum rerum nihil aut.', 390, 48, 0, 1000, 0, 1563299021, 1563537312, 0, NULL, NULL, NULL, NULL, 1, '0'),
(518, 'hic_914', NULL, 115, 'Temporibus numquam et numquam eos ipsa.', 190, 33, 24, 230, 1, 1563299021, 1563809831, 0, NULL, NULL, NULL, NULL, 0, '0'),
(519, 'accusantium_900', 'Blanditiis sit ut ut officia dolore quia quis.', 115, 'Explicabo iste aperiam debitis.', 140, 0, 13, 50, 0, 1563299021, 1563462003, 0, NULL, NULL, NULL, NULL, 0, '0'),
(520, 'cum_942', NULL, 115, 'Corporis quia natus ducimus et molestiae voluptatem reprehenderit.', 830, 38, 0, 380, 1, 1563299021, 1563920621, 0, NULL, NULL, NULL, NULL, 0, '0'),
(521, 'sed_468', 'Debitis et temporibus veritatis natus eos cupiditate quam ab necessitatibus.', 115, 'Aut consequatur totam fuga ipsam quae dolor ut.', 290, 0, 0, 680, 1, 1563299021, 1563443312, 0, NULL, NULL, NULL, NULL, 0, '0'),
(522, 'nesciunt_996', 'Voluptates quod ea aut porro ex delectus.', 115, 'Quaerat ut maiores voluptate repellendus amet occaecati.', 830, 0, 10, 460, 0, 1563299021, 1563749481, 0, NULL, NULL, NULL, NULL, 1, '0'),
(523, 'perferendis_237', 'Sed et dicta non est officiis a repellat temporibus.', 115, 'A est odio ea qui incidunt.', 180, 27, 0, 600, 0, 1563299021, 1563943387, 0, NULL, NULL, NULL, NULL, 0, '0'),
(524, 'consequatur_996', 'Earum molestiae porro odio dicta nostrum ab aut voluptas sed aut molestiae.', 115, 'Dolor dolores voluptas quia sit non ducimus suscipit pariatur.', 530, 0, 18, 320, 0, 1563299021, 1564114319, 0, NULL, NULL, NULL, NULL, 0, '0'),
(525, 'placeat_335', NULL, 115, 'Ab ea distinctio et consequuntur.', 650, 48, 46, 160, 1, 1563299021, 1563497138, 0, NULL, NULL, NULL, NULL, 0, '0'),
(526, 'et_981', 'Sunt nulla voluptatem labore quis aut assumenda dolores illo.', 115, 'Veritatis reiciendis assumenda ut praesentium consectetur aspernatur porro neque.', 990, 36, 40, 300, 0, 1563299021, 1563556800, 0, NULL, NULL, NULL, NULL, 0, '0'),
(527, 'asperiores_622', NULL, 115, 'Et ipsam ut velit et quos.', 830, 27, 0, 770, 1, 1563299021, 1563967792, 0, NULL, NULL, NULL, NULL, 0, '0'),
(528, 'deserunt_806', NULL, 115, 'Magnam aperiam facere iure quas odio nisi.', 520, 0, 0, 520, 1, 1563299021, 1563867378, 0, NULL, NULL, NULL, NULL, 0, '0'),
(529, 'ex_735', NULL, 115, 'Numquam corrupti repellat necessitatibus aut eum labore.', 900, 0, 5, 140, 0, 1563299021, 1564087534, 0, NULL, NULL, NULL, NULL, 1, '0'),
(530, 'mollitia_921', NULL, 115, 'Accusantium rerum velit voluptates voluptatem est et.', 710, 39, 33, 570, 1, 1563299021, 1564130685, 0, NULL, NULL, NULL, NULL, 1, '0'),
(531, 'velit_460', NULL, 115, 'Occaecati voluptatum provident ipsa in.', 360, 0, 10, 600, 0, 1563299021, 1564217168, 0, NULL, NULL, NULL, NULL, 0, '0'),
(532, 'aut_982', 'Eum quibusdam et nostrum reprehenderit sit voluptatem perspiciatis corrupti.', 115, 'Laboriosam et enim dolorem et.', 50, 0, 0, 620, 1, 1563299021, 1564232420, 0, NULL, NULL, NULL, NULL, 1, '0'),
(533, 'vel_748', NULL, 115, 'Assumenda quae dolorem asperiores a.', 230, 0, 4, 380, 0, 1563299021, 1563547381, 0, NULL, NULL, NULL, NULL, 0, '0'),
(534, 'illum_469', 'Atque velit ex qui est iure nisi suscipit.', 115, 'Et et aut itaque alias sunt quos.', 310, 0, 0, 760, 0, 1563299021, 1563618276, 0, NULL, NULL, NULL, NULL, 1, '0'),
(535, 'ipsam_953', 'Ipsa expedita quos quibusdam ut ducimus ipsum accusamus quis harum.', 115, 'Dolores voluptatem hic cum vel corrupti.', 650, 0, 0, 300, 1, 1563299021, 1564207456, 0, NULL, NULL, NULL, NULL, 0, '0'),
(536, 'rerum_403', NULL, 115, 'Molestiae odit est sunt neque occaecati consequatur.', 930, 45, 33, 120, 1, 1563299021, 1563636796, 0, NULL, NULL, NULL, NULL, 1, '0'),
(537, 'fugiat_848', NULL, 115, 'Sed sint blanditiis officia ut at.', 510, 40, 49, 590, 1, 1563299021, 1564260178, 0, NULL, NULL, NULL, NULL, 1, '0'),
(538, 'dolores_770', NULL, 115, 'Est aut rerum voluptates explicabo et.', 360, 29, 1, 70, 1, 1563299021, 1563535164, 0, NULL, NULL, NULL, NULL, 1, '0'),
(539, 'quasi_266', 'Excepturi illo sit facere quisquam doloremque et et qui.', 115, 'Est deleniti molestiae qui voluptas iusto sunt consequuntur nihil.', 780, 47, 47, 820, 1, 1563299021, 1563963253, 0, NULL, NULL, NULL, NULL, 0, '0'),
(540, 'adipisci_113', NULL, 115, 'Autem nihil quaerat deleniti aut eaque iste eveniet.', 430, 47, 0, 570, 0, 1563299021, 1563439696, 0, NULL, NULL, NULL, NULL, 0, '0'),
(541, 'magnam_462', NULL, 115, 'Laudantium deserunt deleniti sint sed reprehenderit omnis officiis.', 870, 43, 0, 940, 0, 1563299021, 1563559791, 0, NULL, NULL, NULL, NULL, 0, '0'),
(542, 'rerum_770', 'Aspernatur vero qui expedita repellat natus voluptatem aut sunt aspernatur.', 115, 'Et corrupti rerum reprehenderit laborum voluptatem in.', 800, 17, 0, 100, 1, 1563299021, 1563564696, 0, NULL, NULL, NULL, NULL, 0, '0'),
(543, 'provident_697', 'Atque dicta quaerat placeat tempora eveniet dolor sequi blanditiis a aperiam.', 115, 'Iure iste eum nostrum optio rerum suscipit libero.', 970, 17, 0, 70, 0, 1563299021, 1564273867, 0, NULL, NULL, NULL, NULL, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(544, 'non_872', 'Et et quod voluptas alias et.', 115, 'Voluptas ipsa nemo qui blanditiis dolor alias repudiandae.', 330, 34, 49, 100, 1, 1563299021, 1563916237, 0, NULL, NULL, NULL, NULL, 1, '0'),
(545, 'iure_896', 'Iste est hic molestias accusantium enim explicabo nihil.', 115, 'Laudantium aut in porro non iusto ipsam.', 360, 0, 12, 170, 1, 1563299021, 1563827786, 0, NULL, NULL, NULL, NULL, 0, '0'),
(546, 'laboriosam_211', 'Eius quod earum labore qui aut ducimus aut et.', 115, 'Molestiae sed aliquid nulla sint iusto.', 820, 16, 23, 410, 0, 1563299021, 1563786573, 0, NULL, NULL, NULL, NULL, 1, '0'),
(547, 'mollitia_435', 'Aut id reprehenderit consequatur voluptates voluptatem assumenda eos.', 115, 'Fuga et quo sit consequuntur fuga.', 520, 0, 0, 740, 1, 1563299021, 1563690630, 0, NULL, NULL, NULL, NULL, 1, '0'),
(548, 'et_204', 'Laboriosam vitae omnis aliquid quia sunt consectetur.', 115, 'Ex temporibus nihil veritatis a.', 70, 0, 0, 660, 1, 1563299021, 1563651352, 0, NULL, NULL, NULL, NULL, 1, '0'),
(549, 'est_948', 'Ut corporis quia est laudantium neque incidunt ut sint sapiente.', 115, 'Eum voluptatem iure saepe consequatur ratione sint.', 850, 19, 24, 120, 1, 1563299021, 1564135293, 0, NULL, NULL, NULL, NULL, 1, '0'),
(550, 'ut_183', 'Sapiente soluta eum tempora explicabo officia eaque asperiores quisquam tempore deserunt.', 115, 'Velit consequatur exercitationem error dolorem.', 140, 0, 0, 710, 1, 1563299021, 1564042687, 0, NULL, NULL, NULL, NULL, 0, '0'),
(551, 'ea_329', 'Asperiores ut corporis voluptatem eum doloribus debitis ad nemo.', 115, 'Ut reprehenderit eos soluta quos.', 410, 24, 47, 50, 1, 1563299021, 1563969059, 0, NULL, NULL, NULL, NULL, 0, '0'),
(552, 'dolorem_444', 'Facere aut dicta est et ea.', 115, 'Qui rem laborum rerum tempora neque.', 60, 0, 0, 910, 0, 1563299021, 1563617254, 0, NULL, NULL, NULL, NULL, 1, '0'),
(553, 'aut_158', 'Commodi dignissimos eaque sit consequatur totam laboriosam.', 115, 'Ut est velit suscipit provident qui ut fugit.', 480, 0, 0, 250, 0, 1563299021, 1563643831, 0, NULL, NULL, NULL, NULL, 1, '0'),
(554, 'aliquam_973', 'Ut est quis esse quas sequi facilis dolores quo.', 115, 'Nam quia minima adipisci deserunt vel autem.', 470, 38, 29, 50, 1, 1563299021, 1564284079, 0, NULL, NULL, NULL, NULL, 1, '0'),
(555, 'tempora_104', 'Aperiam sit ea qui eligendi ex.', 115, 'Aspernatur maxime et nulla et.', 620, 18, 0, 570, 1, 1563299021, 1564187188, 0, NULL, NULL, NULL, NULL, 1, '0'),
(556, 'molestiae_280', 'Voluptatem ut et aut ducimus.', 115, 'Enim qui non occaecati.', 900, 36, 27, 390, 1, 1563299021, 1563860469, 0, NULL, NULL, NULL, NULL, 1, '0'),
(557, 'sequi_781', NULL, 115, 'Omnis vero illo et.', 750, 30, 0, 900, 1, 1563299021, 1564193283, 0, NULL, NULL, NULL, NULL, 1, '0'),
(558, 'dolor_244', NULL, 115, 'Ut sunt aut voluptatem vitae praesentium voluptatem quae exercitationem.', 150, 16, 0, 190, 1, 1563299021, 1563664605, 0, NULL, NULL, NULL, NULL, 1, '0'),
(559, 'occaecati_139', 'Officia facere earum molestias non commodi qui blanditiis accusantium labore et.', 115, 'Ad maiores officiis non optio.', 630, 41, 0, 360, 1, 1563299021, 1564037349, 0, NULL, NULL, NULL, NULL, 1, '0'),
(560, 'aut_250', NULL, 115, 'Voluptatibus dolorem corrupti excepturi voluptates delectus.', 670, 0, 0, 340, 1, 1563299021, 1563755926, 0, NULL, NULL, NULL, NULL, 0, '0'),
(561, 'minus_933', NULL, 115, 'Non sed consectetur quia qui neque sunt.', 640, 40, 15, 980, 0, 1563299021, 1563400712, 0, NULL, NULL, NULL, NULL, 0, '0'),
(562, 'aliquam_387', NULL, 115, 'Necessitatibus est quia itaque et sed.', 60, 0, 6, 820, 0, 1563299021, 1564110252, 0, NULL, NULL, NULL, NULL, 1, '0'),
(563, 'necessitatibus_707', 'Nihil et accusantium ut dolor quo non.', 115, 'Magni quasi est vitae beatae aut est at libero.', 400, 49, 0, 810, 0, 1563299021, 1563974875, 0, NULL, NULL, NULL, NULL, 0, '0'),
(564, 'nesciunt_806', 'Aut quae blanditiis sapiente et modi voluptas.', 115, 'Soluta et aut unde amet officia sed.', 970, 0, 18, 190, 1, 1563299021, 1564127156, 0, NULL, NULL, NULL, NULL, 0, '0'),
(565, 'ut_810', NULL, 115, 'Voluptatibus ea sunt doloremque omnis doloribus voluptas.', 940, 0, 29, 760, 0, 1563299021, 1563691386, 0, NULL, NULL, NULL, NULL, 0, '0'),
(566, 'error_417', NULL, 115, 'Aut omnis expedita perspiciatis dicta vel.', 250, 0, 25, 930, 0, 1563299021, 1564218209, 0, NULL, NULL, NULL, NULL, 0, '0'),
(567, 'et_442', 'Sit voluptate laboriosam fugit fuga corrupti.', 115, 'In pariatur ut eos nihil recusandae enim.', 700, 0, 0, 730, 1, 1563299021, 1564229695, 0, NULL, NULL, NULL, NULL, 1, '0'),
(568, 'dolorum_776', NULL, 115, 'Praesentium nihil et eligendi ut.', 480, 26, 49, 780, 0, 1563299021, 1563894296, 0, NULL, NULL, NULL, NULL, 1, '0'),
(569, 'asperiores_341', 'Eaque voluptas impedit eaque repellat assumenda dolor quis a consequatur dolore.', 115, 'Incidunt quam ducimus et in.', 50, 0, 23, 810, 1, 1563299021, 1563643587, 0, NULL, NULL, NULL, NULL, 0, '0'),
(570, 'illum_558', NULL, 115, 'Quas ipsa ipsum qui amet.', 690, 0, 0, 310, 0, 1563299021, 1563822749, 0, NULL, NULL, NULL, NULL, 0, '0'),
(571, 'eligendi_169', 'Totam voluptatem quia et quia expedita odio quibusdam alias consectetur iusto.', 115, 'Et dolorum ullam dolor quia quis ducimus blanditiis.', 700, 0, 0, 470, 0, 1563299021, 1563915205, 0, NULL, NULL, NULL, NULL, 0, '0'),
(572, 'animi_156', NULL, 115, 'Nemo voluptas saepe adipisci fugiat.', 340, 0, 0, 680, 0, 1563299021, 1564109516, 0, NULL, NULL, NULL, NULL, 1, '0'),
(573, 'ut_116', NULL, 115, 'Dolor eos expedita velit.', 450, 0, 0, 680, 1, 1563299021, 1563576983, 0, NULL, NULL, NULL, NULL, 0, '0'),
(574, 'id_271', 'Beatae in ad dolores recusandae vitae nisi.', 115, 'Est occaecati doloremque laboriosam voluptatem.', 770, 19, 49, 800, 0, 1563299021, 1563962239, 0, NULL, NULL, NULL, NULL, 0, '0'),
(575, 'quo_359', 'Ut dolorem excepturi quia alias tempore dicta at ullam fuga commodi rerum.', 115, 'Autem eius iusto corrupti non praesentium eum cupiditate.', 720, 1, 0, 560, 0, 1563299021, 1563974776, 0, NULL, NULL, NULL, NULL, 0, '0'),
(576, 'officiis_469', NULL, 115, 'Eum nihil quasi dolorem ut ipsum non unde.', 320, 43, 10, 940, 0, 1563299021, 1563954419, 0, NULL, NULL, NULL, NULL, 0, '0'),
(577, 'eveniet_145', NULL, 115, 'Ut nulla et aut illum sunt.', 590, 0, 0, 690, 1, 1563299021, 1564015966, 0, NULL, NULL, NULL, NULL, 1, '0'),
(578, 'impedit_983', NULL, 115, 'Quod soluta aspernatur odio ut.', 60, 0, 0, 790, 1, 1563299021, 1563460826, 0, NULL, NULL, NULL, NULL, 1, '0'),
(579, 'rem_752', NULL, 115, 'Non perspiciatis sed provident nihil consectetur et.', 960, 0, 0, 330, 0, 1563299021, 1563988168, 0, NULL, NULL, NULL, NULL, 1, '0'),
(580, 'enim_954', 'Totam et tempora accusantium cumque sit quo debitis at consequatur tempore.', 115, 'Quam non nulla rerum eveniet.', 70, 0, 0, 810, 1, 1563299021, 1563596125, 0, NULL, NULL, NULL, NULL, 1, '0'),
(581, 'praesentium_985', NULL, 115, 'Temporibus rerum accusamus molestiae voluptatem.', 170, 8, 7, 920, 1, 1563299021, 1564260878, 0, NULL, NULL, NULL, NULL, 1, '0'),
(582, 'quia_874', 'Dolore sit laborum doloribus explicabo aut quis.', 115, 'Rerum molestiae qui omnis et saepe recusandae et.', 360, 0, 40, 890, 1, 1563299021, 1564047773, 0, NULL, NULL, NULL, NULL, 1, '0'),
(583, 'rerum_754', 'Enim quis eos dolorem consequatur qui modi eveniet.', 115, 'Quos veniam unde consequatur similique voluptatem enim expedita.', 510, 19, 0, 70, 1, 1563299021, 1564009672, 0, NULL, NULL, NULL, NULL, 1, '0'),
(584, 'totam_691', 'Maxime placeat sint ratione error ex voluptas suscipit voluptas et.', 115, 'Sed labore qui et ipsum vero assumenda.', 600, 0, 46, 200, 0, 1563299021, 1563782342, 0, NULL, NULL, NULL, NULL, 0, '0'),
(585, 'porro_910', NULL, 115, 'Rerum iste saepe voluptas nihil.', 250, 48, 0, 60, 1, 1563299021, 1563993359, 0, NULL, NULL, NULL, NULL, 0, '0'),
(586, 'numquam_927', NULL, 115, 'Natus officia nulla ut nemo est eligendi ut eligendi.', 990, 2, 0, 560, 0, 1563299021, 1564121826, 0, NULL, NULL, NULL, NULL, 1, '0'),
(587, 'iste_726', NULL, 115, 'Cupiditate sed qui voluptates porro.', 890, 16, 28, 840, 1, 1563299021, 1563873338, 0, NULL, NULL, NULL, NULL, 0, '0'),
(588, 'sit_142', 'Iusto est quae delectus aspernatur et.', 115, 'Veniam quia error expedita odio ipsum dolorem optio.', 250, 25, 0, 270, 1, 1563299021, 1564071184, 0, NULL, NULL, NULL, NULL, 0, '0'),
(589, 'error_268', NULL, 115, 'Et reiciendis enim sed ipsum nulla veniam ea blanditiis.', 650, 0, 37, 300, 1, 1563299021, 1563960219, 0, NULL, NULL, NULL, NULL, 0, '0'),
(590, 'eius_158', NULL, 115, 'Et vitae repellat consequatur sint quia qui optio.', 80, 28, 0, 80, 1, 1563299021, 1563957377, 0, NULL, NULL, NULL, NULL, 0, '0'),
(591, 'autem_281', NULL, 115, 'Optio veritatis possimus et sit.', 670, 0, 18, 120, 1, 1563299021, 1563625492, 0, NULL, NULL, NULL, NULL, 1, '0'),
(592, 'reiciendis_420', 'Laborum voluptas repellendus nam laboriosam earum.', 115, 'Repellendus molestiae reiciendis repellendus et id ullam quis ex.', 120, 0, 0, 690, 0, 1563299021, 1564213208, 0, NULL, NULL, NULL, NULL, 1, '0'),
(593, 'et_477', 'Sapiente quia sit nesciunt nihil error sit quia qui aut qui.', 115, 'Velit ex velit eum unde optio similique facilis.', 490, 44, 7, 860, 1, 1563299021, 1564286422, 0, NULL, NULL, NULL, NULL, 1, '0'),
(594, 'tempore_249', NULL, 115, 'Vitae id possimus reiciendis aut qui qui.', 570, 12, 0, 900, 1, 1563299021, 1563624576, 0, NULL, NULL, NULL, NULL, 1, '0'),
(595, 'blanditiis_448', NULL, 115, 'Corporis quaerat veritatis natus officiis aut incidunt.', 970, 38, 46, 140, 1, 1563299021, 1563660370, 0, NULL, NULL, NULL, NULL, 1, '0'),
(596, 'cum_674', 'Quis soluta suscipit facilis odio itaque soluta.', 115, 'Ut sunt molestiae enim quis ex voluptatem itaque.', 370, 49, 44, 980, 1, 1563299021, 1563989410, 0, NULL, NULL, NULL, NULL, 1, '0'),
(597, 'quia_155', NULL, 115, 'Animi tempora totam occaecati quisquam dolores.', 160, 5, 49, 590, 0, 1563299021, 1563600824, 0, NULL, NULL, NULL, NULL, 1, '0'),
(598, 'sit_907', 'Maxime sit maxime quis rerum numquam optio est.', 115, 'Sed expedita eum atque unde quia enim.', 500, 1, 0, 780, 1, 1563299021, 1563916130, 0, NULL, NULL, NULL, NULL, 1, '0'),
(599, 'quae_383', 'Cumque non dolore minima blanditiis autem et omnis.', 115, 'Voluptatum qui odit voluptate quia ex quis.', 180, 17, 9, 770, 0, 1563299021, 1564147587, 0, NULL, NULL, NULL, NULL, 0, '0'),
(600, 'voluptatem_463', NULL, 115, 'Eligendi possimus quia ratione velit quo dolorum odio.', 260, 24, 0, 730, 1, 1563299021, 1564112144, 0, NULL, NULL, NULL, NULL, 0, '0'),
(601, 'at_783', 'Ratione quia ut ad hic quia eligendi nesciunt qui pariatur.', 115, 'Laborum hic id illum soluta nihil deleniti.', 430, 10, 48, 570, 0, 1563299021, 1563776795, 0, NULL, NULL, NULL, NULL, 1, '0'),
(602, 'aperiam_603', 'Vero quis illo deleniti est in qui sed ut quod eligendi.', 115, 'Illum sapiente est sed quae.', 670, 0, 6, 760, 1, 1563299021, 1563731950, 0, NULL, NULL, NULL, NULL, 0, '0'),
(603, 'est_284', NULL, 115, 'Et dolorum necessitatibus sed animi est amet culpa.', 780, 0, 50, 230, 1, 1563299022, 1563631586, 0, NULL, NULL, NULL, NULL, 0, '0'),
(604, 'dolorum_915', NULL, 115, 'Enim deserunt occaecati quo natus molestiae.', 260, 0, 44, 980, 0, 1563299022, 1564123539, 0, NULL, NULL, NULL, NULL, 1, '0'),
(605, 'corporis_983', NULL, 115, 'Et fugiat ipsum asperiores ipsam.', 990, 0, 47, 490, 0, 1563299022, 1564086481, 0, NULL, NULL, NULL, NULL, 1, '0'),
(606, 'consectetur_879', NULL, 115, 'Vel est aut et et eius consectetur.', 730, 27, 2, 950, 0, 1563299022, 1563646812, 0, NULL, NULL, NULL, NULL, 0, '0'),
(607, 'qui_233', 'Amet illum dolorem veniam quisquam est ipsa.', 115, 'Esse provident dolorem dolores non quas nihil distinctio at.', 120, 0, 0, 690, 0, 1563299022, 1563404133, 0, NULL, NULL, NULL, NULL, 0, '0'),
(608, 'quibusdam_294', 'Repellat quod veritatis odit voluptates et ab sed est occaecati.', 115, 'Veniam quas id quis occaecati nam.', 960, 0, 18, 370, 0, 1563299022, 1563992809, 0, NULL, NULL, NULL, NULL, 0, '0'),
(609, 'distinctio_993', 'Fugit rerum voluptatem aut ipsam quam reiciendis enim dolore dolores.', 115, 'Animi aperiam magnam rerum debitis omnis deserunt dolores accusantium.', 520, 39, 0, 470, 1, 1563299022, 1564122604, 0, NULL, NULL, NULL, NULL, 0, '0'),
(610, 'alias_964', NULL, 115, 'Et molestiae ea mollitia rem.', 970, 22, 12, 200, 0, 1563299022, 1563731302, 0, NULL, NULL, NULL, NULL, 0, '0'),
(611, 'itaque_915', NULL, 115, 'Officiis soluta et eveniet quasi nihil aliquam.', 390, 16, 35, 910, 1, 1563299022, 1563679851, 0, NULL, NULL, NULL, NULL, 1, '0'),
(612, 'quas_610', NULL, 115, 'Nihil id quibusdam aut cum quia repellendus minus hic.', 320, 0, 0, 890, 0, 1563299022, 1564032145, 0, NULL, NULL, NULL, NULL, 1, '0'),
(613, 'suscipit_520', NULL, 115, 'Dolorem ut qui facilis in culpa qui aperiam.', 110, 16, 46, 910, 1, 1563299022, 1564156382, 0, NULL, NULL, NULL, NULL, 0, '0'),
(614, 'harum_895', 'Et error laborum nostrum incidunt qui sed.', 115, 'Est sapiente non voluptas tenetur a.', 750, 36, 0, 500, 1, 1563299022, 1563462858, 0, NULL, NULL, NULL, NULL, 0, '0'),
(615, 'aliquid_740', 'Voluptatum omnis aut est rem.', 115, 'Eum et sed similique nam.', 930, 0, 16, 880, 0, 1563299022, 1564034463, 0, NULL, NULL, NULL, NULL, 1, '0'),
(616, 'assumenda_792', 'Suscipit debitis ut provident est placeat.', 115, 'Et est officia nemo reprehenderit libero.', 480, 0, 0, 180, 1, 1563299022, 1563542087, 0, NULL, NULL, NULL, NULL, 1, '0'),
(617, 'vitae_238', 'Qui ipsam commodi id perferendis sequi quod asperiores voluptatem.', 115, 'Non sit sed ullam voluptatem quis ea exercitationem.', 260, 0, 0, 830, 0, 1563299022, 1564094260, 0, NULL, NULL, NULL, NULL, 0, '0'),
(618, 'facilis_986', 'Voluptas est labore illo eum voluptates harum et consequatur quidem aliquam.', 115, 'Dolore odio illum aliquid ut.', 1000, 0, 22, 190, 0, 1563299022, 1563531879, 0, NULL, NULL, NULL, NULL, 0, '0'),
(619, 'quaerat_452', NULL, 115, 'Vel dolorum ad eos quos distinctio.', 660, 44, 3, 70, 1, 1563299022, 1563822677, 0, NULL, NULL, NULL, NULL, 1, '0'),
(620, 'ut_893', NULL, 115, 'Recusandae eum rem aut officia veniam consequatur est.', 1000, 0, 6, 340, 1, 1563299022, 1563909136, 0, NULL, NULL, NULL, NULL, 1, '0'),
(621, 'eos_621', NULL, 115, 'Vitae nostrum quo incidunt harum dolorem.', 240, 26, 0, 170, 1, 1563299022, 1563754049, 0, NULL, NULL, NULL, NULL, 0, '0'),
(622, 'repudiandae_875', NULL, 115, 'Vitae iste sit sequi quos.', 530, 0, 21, 940, 1, 1563299022, 1563864062, 0, NULL, NULL, NULL, NULL, 1, '0'),
(623, 'dolor_408', 'Sequi necessitatibus nihil ducimus repellendus adipisci pariatur fuga quo.', 115, 'Ipsum perferendis facere voluptas aspernatur ut qui ut.', 710, 8, 0, 540, 0, 1563299022, 1563954043, 0, NULL, NULL, NULL, NULL, 1, '0'),
(624, 'repellendus_803', NULL, 115, 'Sit veniam cum expedita reprehenderit quia ea omnis.', 670, 7, 43, 910, 1, 1563299022, 1563655219, 0, NULL, NULL, NULL, NULL, 1, '0'),
(625, 'quisquam_910', 'Enim sit aut itaque voluptatem cupiditate ut aut.', 115, 'Ratione et deleniti aliquid voluptatem velit quis iure.', 160, 31, 36, 250, 0, 1563299022, 1563805193, 0, NULL, NULL, NULL, NULL, 1, '0'),
(626, 'culpa_318', NULL, 115, 'Sapiente sit nobis natus ut.', 80, 0, 0, 780, 0, 1563299022, 1564275470, 0, NULL, NULL, NULL, NULL, 0, '0'),
(627, 'rerum_236', 'Omnis nesciunt ipsa modi maxime provident qui quaerat dolores magnam.', 115, 'Corrupti nesciunt expedita velit et numquam nihil quos.', 90, 46, 7, 960, 1, 1563299022, 1564278483, 0, NULL, NULL, NULL, NULL, 1, '0'),
(628, 'fuga_665', NULL, 115, 'Voluptas qui dicta ut quia consectetur.', 780, 10, 0, 640, 0, 1563299022, 1564081464, 0, NULL, NULL, NULL, NULL, 1, '0'),
(629, 'optio_241', NULL, 115, 'Sequi voluptates inventore ipsa deleniti sit qui aliquid animi.', 820, 41, 3, 160, 0, 1563299022, 1563991981, 0, NULL, NULL, NULL, NULL, 0, '0'),
(630, 'aut_410', NULL, 115, 'Officia minus praesentium provident quo.', 1000, 0, 45, 60, 0, 1563299022, 1563584779, 0, NULL, NULL, NULL, NULL, 0, '0'),
(631, 'hic_106', NULL, 115, 'Optio eum quia eum repellat incidunt eum aut.', 210, 0, 30, 170, 0, 1563299022, 1563486877, 0, NULL, NULL, NULL, NULL, 0, '0'),
(632, 'veniam_288', NULL, 115, 'Hic et natus doloribus ea voluptatem excepturi.', 900, 18, 0, 880, 1, 1563299022, 1564100879, 0, NULL, NULL, NULL, NULL, 0, '0'),
(633, 'culpa_490', 'Eum accusantium sit quisquam error consequatur vel sunt totam.', 115, 'Iste architecto rerum fugiat quas quam.', 680, 48, 24, 980, 1, 1563299022, 1564183462, 0, NULL, NULL, NULL, NULL, 1, '0'),
(634, 'quis_945', NULL, 115, 'Sit dignissimos ab iusto consequuntur nobis doloremque dolor iure.', 320, 43, 0, 770, 0, 1563299022, 1564260639, 0, NULL, NULL, NULL, NULL, 1, '0'),
(635, 'modi_593', NULL, 115, 'Et architecto repudiandae alias velit quisquam.', 760, 45, 0, 370, 1, 1563299022, 1563737538, 0, NULL, NULL, NULL, NULL, 0, '0'),
(636, 'qui_226', 'Porro incidunt expedita ex dolorum suscipit quis est sit repellendus temporibus.', 115, 'A atque et beatae facere aliquid velit.', 160, 0, 0, 410, 1, 1563299022, 1563724298, 0, NULL, NULL, NULL, NULL, 1, '0'),
(637, 'mollitia_228', NULL, 115, 'Illum eligendi maiores velit maxime delectus beatae qui.', 620, 0, 0, 610, 1, 1563299022, 1564085480, 0, NULL, NULL, NULL, NULL, 0, '0'),
(638, 'deleniti_480', 'Quia hic repellat consequatur quo asperiores iure perspiciatis qui ut nesciunt.', 115, 'Exercitationem nobis et labore omnis aliquid.', 90, 6, 0, 410, 1, 1563299022, 1563570495, 0, NULL, NULL, NULL, NULL, 0, '0'),
(639, 'veritatis_362', NULL, 115, 'Omnis iure voluptates iure.', 140, 0, 0, 940, 0, 1563299022, 1563491971, 0, NULL, NULL, NULL, NULL, 1, '0'),
(640, 'expedita_856', 'Optio labore beatae nihil distinctio quod omnis ut voluptatem ab molestiae.', 115, 'Suscipit animi repudiandae iure at in nihil blanditiis.', 570, 27, 0, 290, 1, 1563299022, 1564271171, 0, NULL, NULL, NULL, NULL, 1, '0'),
(641, 'pariatur_429', NULL, 115, 'Cupiditate dolores sit quia qui.', 670, 0, 42, 980, 0, 1563299022, 1563573109, 0, NULL, NULL, NULL, NULL, 0, '0'),
(642, 'quas_922', 'Voluptate corporis assumenda aliquam ut voluptas ipsum sapiente nam alias.', 115, 'Blanditiis sed qui non qui similique nihil consequatur.', 770, 0, 0, 530, 0, 1563299022, 1563635541, 0, NULL, NULL, NULL, NULL, 1, '0'),
(643, 'tempora_474', 'Explicabo commodi quis voluptas esse dicta iusto quia sit quia.', 115, 'Ab tempore exercitationem eum optio esse voluptas excepturi.', 590, 7, 11, 810, 0, 1563299022, 1564279046, 0, NULL, NULL, NULL, NULL, 0, '0'),
(644, 'odio_701', 'Ut similique ab dolores iusto enim vitae minima.', 115, 'Perferendis consectetur itaque sint qui et nihil mollitia.', 360, 0, 50, 110, 1, 1563299022, 1563807864, 0, NULL, NULL, NULL, NULL, 0, '0'),
(645, 'pariatur_493', NULL, 115, 'Dicta voluptatibus et exercitationem blanditiis animi.', 760, 0, 38, 530, 0, 1563299022, 1563838595, 0, NULL, NULL, NULL, NULL, 1, '0'),
(646, 'non_445', NULL, 115, 'Sunt qui omnis harum ut natus libero dicta quidem.', 600, 25, 0, 410, 1, 1563299022, 1564199680, 0, NULL, NULL, NULL, NULL, 1, '0'),
(647, 'nemo_513', NULL, 115, 'Et dolorum ratione corrupti omnis voluptatibus facilis.', 180, 36, 7, 200, 1, 1563299022, 1563893082, 0, NULL, NULL, NULL, NULL, 1, '0'),
(648, 'accusantium_310', 'Quis quasi cumque dolores qui earum rerum facere.', 115, 'Eum repellendus qui sed quisquam ipsum sit facilis ipsum.', 660, 32, 38, 870, 0, 1563299022, 1563504676, 0, NULL, NULL, NULL, NULL, 0, '0'),
(649, 'porro_300', 'Qui eaque ipsam velit alias sit.', 115, 'Rerum in ea vel adipisci.', 850, 0, 0, 650, 0, 1563299022, 1564107416, 0, NULL, NULL, NULL, NULL, 1, '0'),
(650, 'quos_952', 'Cupiditate quisquam libero quia minima maiores hic asperiores.', 115, 'Accusamus libero aut consequatur nesciunt nulla dolores voluptatem.', 760, 5, 31, 460, 0, 1563299022, 1564135591, 0, NULL, NULL, NULL, NULL, 0, '0');

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
(1, 'Sunt sed ab iusto voluptatem.', '57971', 'roob.benjamin@turcotte.com', 'facere', 'repudiandae', '1563291996', 'nemo', '7 minutes', 'Libero accusamus enim quia et et cumque possimus ducimus.'),
(2, 'Unde quos dicta dignissimos.', '84842', 'turner.trevion@hotmail.com', 'maiores', 'animi', '1563291996', 'incidunt', '6 minutes', 'Repellendus qui dolorum dolore voluptatem.'),
(3, 'Sunt dolorem minus minima.', '39964', 'rkiehn@yahoo.com', 'perferendis', 'nesciunt', '1563291996', 'cupiditate', '16 minutes', 'Cupiditate provident sit error cumque eligendi voluptatem autem.'),
(4, 'Beatae consequatur voluptatem quasi alias nemo.', '53805', 'barton.lulu@collins.biz', 'expedita', 'at', '1563291996', 'ab', '1 minutes', 'Dolores minus numquam qui aut vel praesentium quibusdam non.'),
(5, 'Et rerum quaerat.', '97189', 'hmclaughlin@green.net', 'minus', 'quidem', '1563291996', 'rerum', '20 minutes', 'Libero qui inventore sunt enim repellat laboriosam vel et iste accusamus quae.'),
(6, 'Magnam quisquam.', '55123', 'rosella.mayert@yahoo.com', 'illum', 'tempore', '1563291996', 'sit', '17 minutes', 'Culpa nam et iste rerum est repellendus molestiae sint amet.'),
(7, 'Autem iste animi iure dolorem ducimus.', '34848', 'otilia44@collier.com', 'voluptatum', 'commodi', '1563291996', 'quis', '18 minutes', 'Aperiam magnam suscipit quis dolorum.'),
(8, 'Molestiae magnam non.', '84080', 'turcotte.eula@gmail.com', 'est', 'aut', '1563291996', 'est', '13 minutes', 'Delectus eveniet est eaque libero dolorem omnis repellat.'),
(9, 'Sit veritatis nihil error.', '77228', 'ottilie.reynolds@gmail.com', 'voluptas', 'optio', '1563291996', 'et', '26 minutes', 'Molestias unde optio minima nobis possimus vel quae eligendi quis consequatur.'),
(10, 'Itaque ut eum voluptas.', '50137', 'wolff.timmy@leffler.com', 'consequatur', 'unde', '1563291996', 'magni', '15 minutes', 'Nesciunt iusto sint iure iure consectetur.'),
(11, 'Ea aut doloremque.', '80537', 'paxton.schmeler@white.com', 'esse', 'asperiores', '1563291996', 'expedita', '7 minutes', 'Explicabo qui assumenda et qui esse iste dolores sunt voluptatem culpa ea ab.'),
(12, 'Earum illo deleniti.', '52358', 'wilderman.tyrel@gmail.com', 'sunt', 'est', '1563291996', 'ipsam', '16 minutes', 'Porro officiis vel laborum mollitia animi nesciunt qui animi vitae magnam.'),
(13, 'Et perferendis fuga saepe animi.', '63897', 'kelsie53@schuster.biz', 'rem', 'sint', '1563291996', 'molestiae', '14 minutes', 'Unde dolores adipisci quo sit ea maxime aut officiis.'),
(14, 'Quaerat voluptates harum quasi.', '78146', 'imani01@hotmail.com', 'ipsum', 'nesciunt', '1563291996', 'aut', '11 minutes', 'Praesentium facilis libero eveniet exercitationem provident sed aut illo.'),
(15, 'Error sunt in.', '56540', 'emiliano16@larkin.com', 'similique', 'officiis', '1563291996', 'iure', '17 minutes', 'Pariatur a eum ea nesciunt magnam rerum non voluptas architecto.'),
(16, 'Et quia.', '41938', 'muller.kieran@gmail.com', 'adipisci', 'et', '1563291996', 'fugit', '16 minutes', 'Natus dignissimos sunt sunt eos est sequi et rem animi.'),
(17, 'Et hic praesentium eos.', '48152', 'ward.adaline@yahoo.com', 'vel', 'impedit', '1563291996', 'architecto', '26 minutes', 'Et quis accusantium in vel necessitatibus ipsum perferendis explicabo quia dolorum.'),
(18, 'Eos odio a.', '98597', 'zabbott@kulas.com', 'dignissimos', 'dolorem', '1563291996', 'exercitationem', '2 minutes', 'Rerum aperiam sint velit ipsum incidunt quos ut omnis soluta eos.'),
(19, 'Incidunt numquam delectus.', '70557', 'kadin.considine@hotmail.com', 'voluptas', 'quo', '1563291996', 'officiis', '15 minutes', 'Consectetur autem repellendus tenetur enim ea cumque aut.'),
(20, 'Soluta quis quia fugiat.', '68206', 'kari33@hotmail.com', 'sunt', 'voluptates', '1563291996', 'amet', '14 minutes', 'Et sapiente autem non enim iure ratione maiores minus.'),
(21, 'Amet odit ut nulla.', '40631', 'therese95@fisher.net', 'id', 'at', '1563291996', 'ducimus', '10 minutes', 'Aut occaecati quia aperiam veritatis.'),
(22, 'Alias libero praesentium eum.', '22240', 'ernser.joan@yahoo.com', 'architecto', 'at', '1563291996', 'est', '29 minutes', 'Sint qui praesentium minima eum.'),
(23, 'Fuga temporibus et nihil.', '95197', 'ayana27@yahoo.com', 'odit', 'dolore', '1563291996', 'molestiae', '15 minutes', 'Dolor cum ut necessitatibus et dolore quisquam ipsa.'),
(24, 'Animi possimus.', '97548', 'ebert.dudley@yahoo.com', 'sunt', 'aliquam', '1563291996', 'non', '7 minutes', 'Architecto eum quo tempore doloremque qui nostrum ut voluptas.'),
(25, 'Et iste quis neque quia.', '77262', 'dell.ohara@gmail.com', 'qui', 'adipisci', '1563291996', 'voluptatibus', '18 minutes', 'Aliquid reiciendis quis ut ut sapiente qui numquam soluta.'),
(26, 'Iste reprehenderit dignissimos laudantium.', '42059', 'cristobal55@hotmail.com', 'ipsa', 'eos', '1563291996', 'velit', '2 minutes', 'Illum praesentium consequuntur error qui ab autem accusantium amet.'),
(27, 'Sequi non illo fugit.', '20598', 'margarete.cartwright@gmail.com', 'nesciunt', 'rerum', '1563291996', 'placeat', '23 minutes', 'Vitae sed tempore distinctio debitis similique.'),
(28, 'Tempora molestias debitis.', '16467', 'jabernathy@gmail.com', 'repellat', 'nostrum', '1563291996', 'voluptatem', '12 minutes', 'Et fugiat rerum nihil voluptatem sunt voluptatibus provident.'),
(29, 'Eos quas similique.', '57055', 'jacobson.raleigh@hills.net', 'in', 'fugiat', '1563291996', 'totam', '29 minutes', 'Quaerat dolor nobis ratione hic accusantium.'),
(30, 'Velit itaque.', '25702', 'amira31@yahoo.com', 'aperiam', 'numquam', '1563291996', 'assumenda', '29 minutes', 'Quisquam inventore necessitatibus modi aut voluptas deleniti aut.'),
(31, 'Dolores illum non non et.', '24412', 'qlarson@mclaughlin.com', 'qui', 'rem', '1563291996', 'numquam', '10 minutes', 'Quasi unde qui saepe omnis voluptatem reprehenderit voluptas voluptatem et.'),
(32, 'Saepe quae et.', '35155', 'alayna.swaniawski@gmail.com', 'enim', 'nulla', '1563291996', 'reiciendis', '17 minutes', 'Voluptas quisquam error consequatur commodi odio.'),
(33, 'Et omnis maxime voluptatem ratione officiis.', '16695', 'mosciski.darryl@hotmail.com', 'sequi', 'illo', '1563291996', 'impedit', '20 minutes', 'Recusandae voluptatem est accusantium libero deleniti assumenda necessitatibus et nostrum.'),
(34, 'Eveniet animi ut rerum.', '72420', 'mercedes.kuphal@gmail.com', 'enim', 'est', '1563291996', 'ipsam', '20 minutes', 'Sequi minus consequatur quidem fugiat veritatis consectetur assumenda optio est.'),
(35, 'Id commodi ratione.', '94992', 'ncormier@mclaughlin.com', 'id', 'minus', '1563291996', 'similique', '12 minutes', 'Mollitia vel dicta voluptates dicta ea nihil suscipit quidem accusamus.'),
(36, 'Quo architecto iure.', '74164', 'norris.kirlin@willms.net', 'aperiam', 'dolorem', '1563291996', 'quas', '16 minutes', 'Reiciendis eveniet enim dolor iusto id sint soluta labore earum non doloremque.'),
(37, 'Dolores odio nesciunt ut voluptatibus.', '46609', 'hodkiewicz.madison@yahoo.com', 'omnis', 'rem', '1563291996', 'quasi', '25 minutes', 'Molestiae non beatae aut et veritatis.'),
(38, 'Mollitia error consectetur.', '32528', 'howell.jackeline@gmail.com', 'consequatur', 'possimus', '1563291996', 'quia', '30 minutes', 'Id recusandae necessitatibus excepturi nulla harum maxime eum.'),
(39, 'Assumenda et.', '64256', 'lucas.miller@gmail.com', 'quae', 'voluptas', '1563291996', 'mollitia', '7 minutes', 'Reiciendis accusantium sint est sed.'),
(40, 'Cupiditate doloremque suscipit.', '38506', 'charity77@gmail.com', 'accusantium', 'iste', '1563291996', 'minus', '21 minutes', 'Occaecati nihil dolorem ut id quia sit sit.'),
(41, 'Voluptatem ipsa voluptatem.', '70820', 'vflatley@kassulke.com', 'blanditiis', 'voluptas', '1563291996', 'illum', '16 minutes', 'Magnam est optio dolorem animi ratione mollitia quo.'),
(42, 'Et voluptate.', '13157', 'bashirian.naomie@gmail.com', 'unde', 'placeat', '1563291996', 'dolore', '7 minutes', 'Non nulla animi similique alias id nemo.'),
(43, 'Ut est quaerat qui.', '61599', 'zola43@gmail.com', 'fugiat', 'et', '1563291996', 'et', '7 minutes', 'Harum in dolorem rerum accusantium accusantium magnam sit fugiat.'),
(44, 'Itaque illo illum.', '68188', 'qrussel@heller.com', 'ab', 'ipsa', '1563291996', 'aut', '22 minutes', 'Numquam molestiae ipsa nemo qui.'),
(45, 'Est dolore adipisci.', '34897', 'muller.petra@hotmail.com', 'aut', 'animi', '1563291996', 'explicabo', '19 minutes', 'Voluptas ut corrupti cum facere id vel.'),
(46, 'Autem assumenda dolorum corrupti optio repellat.', '44860', 'eddie34@mraz.biz', 'eos', 'velit', '1563291996', 'quisquam', '4 minutes', 'Quia optio in sunt aut vero animi vel.'),
(47, 'Et et provident.', '23417', 'belle.boyer@gmail.com', 'facilis', 'nisi', '1563291996', 'tempora', '29 minutes', 'Ut necessitatibus blanditiis enim nesciunt facere aut in voluptas doloremque magni.'),
(48, 'Enim consequatur omnis voluptatem nulla.', '84414', 'wiegand.piper@bahringer.biz', 'placeat', 'debitis', '1563291996', 'eos', '12 minutes', 'Voluptate totam esse excepturi et cupiditate dolores fuga cupiditate quis et maiores.'),
(49, 'Et illo omnis perspiciatis.', '64098', 'alycia05@stark.info', 'sed', 'ea', '1563291996', 'quo', '4 minutes', 'Quod laborum cumque dolorem quod asperiores similique.'),
(50, 'Praesentium itaque.', '96247', 'breitenberg.alfonso@herzog.org', 'commodi', 'dolores', '1563291996', 'necessitatibus', '15 minutes', 'Aut saepe labore dolorem sapiente doloremque omnis.');

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
(1, 'ut', '86188', 'Dolores.', 'Omnis quam.', 'Non quos enim sequi iste et ducimus.', '1563291996', '', 'Quia et et explicabo.'),
(2, 'saepe', '21334', 'Sed molestias.', 'Placeat in.', 'Accusantium minima ut.', '1563291996', '', 'Quidem ab voluptatum facilis sit et.'),
(3, 'sit', '10430', 'Placeat laborum.', 'Commodi.', 'Sint reprehenderit rerum non.', '1563291996', '', 'Et id tenetur molestias consequatur.'),
(4, 'laborum', '70778', 'Et aut.', 'Non mollitia.', 'Consectetur rerum animi nam hic.', '1563291996', '', 'Sed suscipit eos qui sint vitae officia.'),
(5, 'cum', '40318', 'Aperiam.', 'Officia.', 'Itaque provident pariatur rerum minus est nam.', '1563291996', '', 'Quia repellendus enim assumenda.'),
(6, 'fuga', '50248', 'Nihil tempora.', 'Ab.', 'Corrupti velit labore quibusdam enim.', '1563291996', '', 'Dignissimos itaque a nesciunt eligendi ad sed.'),
(7, 'repudiandae', '49864', 'Aut nemo porro.', 'Ea sit.', 'Est dolores in laboriosam quis quam ut.', '1563291996', '', 'Nobis qui nostrum est.'),
(8, 'molestiae', '41662', 'Rerum.', 'Voluptatem sit.', 'Tempore et voluptatem quam accusamus dolorem qui ex.', '1563291996', '', 'Harum hic quia accusamus magni molestias.'),
(9, 'alias', '17984', 'Eum.', 'Corrupti laudantium odit.', 'Distinctio ad dignissimos magni corporis et ea.', '1563291996', '', 'Sunt autem velit dolores beatae adipisci veritatis.'),
(10, 'non', '35913', 'Atque.', 'Aliquam deleniti.', 'Atque aut facilis tenetur.', '1563291996', '', 'Perspiciatis ea dicta rem.'),
(11, 'illo', '11039', 'Sunt similique.', 'Doloribus.', 'Quos magni voluptate quia dignissimos qui illo.', '1563291996', '', 'Et odio sed provident.'),
(12, 'mollitia', '72440', 'Enim hic.', 'Incidunt blanditiis.', 'Porro alias aut illum.', '1563291996', '', 'Enim et delectus nemo quidem in doloremque.'),
(13, 'cupiditate', '21248', 'Fugit in.', 'Eum.', 'Molestias ut temporibus fuga.', '1563291996', '', 'Quasi quam placeat nisi aut ducimus dicta et.'),
(14, 'similique', '60711', 'Odio tenetur.', 'Laudantium.', 'Perspiciatis rerum voluptatum officia impedit.', '1563291996', '', 'Odit quis ut labore ab enim.'),
(15, 'non', '95835', 'Sint id magnam.', 'Commodi aut.', 'Veritatis qui tempore rerum necessitatibus est perspiciatis.', '1563291996', '', 'Voluptatem molestiae ut eum.'),
(16, 'est', '76127', 'Nemo consequuntur veniam.', 'Dolorum.', 'Eligendi doloremque eligendi aut.', '1563291996', '', 'Consequatur vel dolorem laboriosam est nam quis.'),
(17, 'maxime', '41101', 'Aut et.', 'Nemo expedita adipisci.', 'Necessitatibus iste modi.', '1563291996', '', 'Illo libero deleniti expedita delectus non sed.'),
(18, 'in', '71228', 'Sed aut.', 'Delectus earum.', 'Facilis repellat vel eos.', '1563291996', '', 'Consectetur quos voluptas consequuntur.'),
(19, 'blanditiis', '75994', 'Enim optio.', 'Maiores et.', 'Vel qui repudiandae hic non.', '1563291996', '', 'Unde aut saepe veritatis harum.'),
(20, 'sint', '15589', 'Quas officia.', 'Excepturi tempora assumenda.', 'Quo tenetur et aut.', '1563291996', '', 'Nulla consequuntur quia minus eum quod porro sint enim.'),
(21, 'laborum', '74432', 'Tenetur illo et.', 'Tenetur maxime.', 'Amet velit enim qui in ut.', '1563291996', '', 'Labore consequatur quis qui et qui.'),
(22, 'nisi', '68272', 'Et porro.', 'Porro mollitia.', 'Eaque inventore porro eaque.', '1563291996', '', 'Asperiores quod aut natus odit.'),
(23, 'et', '65523', 'Quia asperiores.', 'Itaque esse.', 'Aut minima recusandae fugit.', '1563291996', '', 'Unde dolorem voluptatem alias tempora porro voluptatem.'),
(24, 'et', '19469', 'Sit occaecati.', 'Est qui.', 'Repudiandae ut sequi enim.', '1563291996', '', 'Quibusdam consequatur et culpa.'),
(25, 'distinctio', '69746', 'Dolorem fuga facilis.', 'Ea sequi.', 'Impedit dolorum eveniet ea.', '1563291996', '', 'Consequatur quia sint.'),
(26, 'consectetur', '87397', 'Illo.', 'Et.', 'Dolore et optio.', '1563291996', '', 'Qui voluptatum voluptates et ad.'),
(27, 'molestiae', '66779', 'Saepe.', 'Officiis consequuntur.', 'Et culpa enim aut.', '1563291996', '', 'Nemo praesentium perspiciatis reiciendis ratione ut in.'),
(28, 'assumenda', '41062', 'Totam cumque.', 'Sed.', 'Laudantium non quis placeat corrupti magni ad.', '1563291996', '', 'Recusandae recusandae dolorem sunt enim pariatur.'),
(29, 'inventore', '60315', 'Et neque.', 'Doloribus qui ex.', 'Ut explicabo eius totam voluptatem.', '1563291996', '', 'Dolorem possimus eveniet fugit adipisci.'),
(30, 'veniam', '85379', 'Enim eius.', 'Sunt incidunt.', 'Corporis minus quo enim ut fugiat.', '1563291996', '', 'Occaecati ut aliquam.'),
(31, 'et', '79237', 'Minus pariatur.', 'Et dignissimos iure.', 'Vel quis ipsam assumenda et impedit.', '1563291996', '', 'Perspiciatis in blanditiis optio.'),
(32, 'velit', '53766', 'Quis cum.', 'Laboriosam.', 'Cumque dolores sed ratione dolorem assumenda itaque est.', '1563291996', '', 'Minima possimus velit odio.'),
(33, 'omnis', '51128', 'Eos ea officia.', 'Saepe porro.', 'Modi pariatur aut doloremque dolorem et ut aut.', '1563291996', '', 'Illum placeat in saepe quo.'),
(34, 'eum', '78934', 'Alias magnam.', 'Perferendis ipsa.', 'Mollitia et dolore delectus nesciunt similique et.', '1563291996', '', 'Reprehenderit voluptas hic incidunt enim officia est.'),
(35, 'sunt', '62035', 'Possimus dolorem.', 'Cumque eveniet.', 'Explicabo odio est.', '1563291996', '', 'Dolores adipisci ad non rerum cumque voluptatem.'),
(36, 'magnam', '89457', 'Atque provident.', 'Deserunt id laborum.', 'Ea eaque hic optio.', '1563291996', '', 'Ipsum quaerat dignissimos architecto omnis officia rerum.'),
(37, 'est', '51535', 'Minus eligendi.', 'Error culpa dolor.', 'Aut mollitia omnis perferendis et quo.', '1563291996', '', 'Laboriosam delectus at blanditiis earum voluptas maiores.'),
(38, 'rerum', '90584', 'Labore deleniti.', 'Neque aut provident.', 'Ex debitis ratione omnis at.', '1563291996', '', 'Quis dolores expedita praesentium iste dicta inventore.'),
(39, 'quisquam', '78064', 'Cupiditate illo.', 'Sed mollitia magnam.', 'Tenetur sapiente accusamus totam ipsa.', '1563291996', '', 'Rerum possimus tempore asperiores aliquid ea.'),
(40, 'distinctio', '72632', 'Facere culpa.', 'Minus magni.', 'Et officia et cum veniam ut ipsam.', '1563291996', '', 'Quisquam nostrum labore aut nisi ad qui est.'),
(41, 'dolore', '58168', 'Commodi ut ut.', 'Eaque.', 'Consectetur ex sint nobis.', '1563291996', '', 'Quia reprehenderit ut iusto.'),
(42, 'aut', '19325', 'Eligendi excepturi.', 'Ab.', 'Sunt voluptatem quo itaque.', '1563291996', '', 'Labore numquam iste.'),
(43, 'exercitationem', '75779', 'Dolor.', 'Aut et.', 'Tenetur consequatur distinctio sit sed blanditiis magnam quaerat commodi.', '1563291996', '', 'Nemo tempora rerum.'),
(44, 'omnis', '64078', 'Esse laborum.', 'Ea aspernatur.', 'Harum neque eos quis ab.', '1563291996', '', 'Odit et voluptates ducimus cupiditate.'),
(45, 'vitae', '37468', 'Non.', 'Vel iure.', 'Eum beatae aut accusamus.', '1563291996', '', 'Labore voluptatem aut.'),
(46, 'nesciunt', '79242', 'Assumenda ducimus omnis.', 'Qui totam.', 'Voluptatum libero quo.', '1563291996', '', 'Similique dolor aperiam consequatur eos.'),
(47, 'magnam', '76903', 'Sit quia.', 'Voluptas omnis.', 'Voluptatem voluptates explicabo velit cum quod doloribus.', '1563291996', '', 'Eum quo consequuntur libero dolores est reprehenderit recusandae.'),
(48, 'nihil', '43920', 'Repudiandae.', 'Sint veritatis.', 'A laudantium possimus aliquid.', '1563291996', '', 'Ducimus qui sed aut nesciunt eveniet.'),
(49, 'accusamus', '11744', 'Pariatur quis.', 'Doloribus voluptate.', 'Quisquam qui consequatur accusamus porro assumenda.', '1563291996', '', 'Enim asperiores porro asperiores officiis quia.'),
(50, 'ut', '23874', 'Et consequatur suscipit.', 'Quo pariatur.', 'Qui minus et consequatur in molestiae voluptas expedita est.', '1563291996', '', 'Consequatur non facilis.');

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
(5, 'Teacher', 'Default role for teachers', 'teacher', '[\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"Assignments.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"classSch.list\",\"trans_vehicles.list\",\"depart.list\",\"desig.list\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"Library.Download\",\"Vacation.reqVacation\",\"Vacation.myVacation\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"academicyears.list\",\"classes.list\",\"events.list\",\"gradeLevels.list\",\"mobileNotifications.sendNewNotification\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"studyMaterial.Download\",\"studyMaterial.delMaterial\",\"studyMaterial.addMaterial\",\"studyMaterial.editMaterial\",\"staticPages.list\",\"mediaCenter.View\",\"students.list\",\"students.Attendance\",\"students.delStudent\",\"students.editStudent\"]'),
(6, 'Student', 'Default role for students', 'student', '[\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Library.Download\",\"Vacation.myVacation\",\"Homework.list\",\"academicyears.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"studyMaterial.Download\",\"Homework.Download\",\"Invoices.list\",\"Invoices.View\",\"Subjects.list\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
(7, 'Parents', 'Default role for Parents', 'parent', '[\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Homework.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Transportation.list\",\"newsboard.list\",\"Invoices.list\",\"Invoices.View\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"academicyears.list\",\"students.list\",\"students.Attendance\",\"students.Marksheet\",\"Homework.Answers\",\"Homework.Download\",\"Library.list\",\"Polls.list\",\"complaints.View\",\"complaints.add_complaint\",\"complaints.list\",\"complaints.del_complaint\",\"complaints.Download\",\"complaints.edit_complaint\",\"complaints.Export\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
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
(1, 'veniam', 'nam', 1, '61', ''),
(2, 'ab', 'excepturi', 2, '64', ''),
(3, 'velit', 'similique', 4, '56', ''),
(4, 'in', 'odio', 1, '95', ''),
(5, 'quam', 'tempora', 3, '78', ''),
(6, 'neque', 'recusandae', 2, '84', ''),
(7, 'quia', 'id', 1, '68', ''),
(8, 'sed', 'a', 4, '90', ''),
(9, 'exercitationem', 'ut', 1, '78', ''),
(10, 'minima', 'exercitationem', 4, '70', ''),
(11, 'ea', 'nulla', 2, '93', ''),
(12, 'ex', 'omnis', 1, '58', ''),
(13, 'earum', 'reiciendis', 3, '86', ''),
(14, 'illo', 'ad', 1, '78', ''),
(15, 'ut', 'molestiae', 3, '66', ''),
(16, 'ducimus', 'minima', 3, '70', ''),
(17, 'distinctio', 'corporis', 2, '93', ''),
(18, 'rerum', 'laborum', 4, '55', ''),
(19, 'temporibus', 'est', 4, '90', ''),
(20, 'et', 'sapiente', 2, '55', ''),
(21, 'est', 'et', 1, '96', ''),
(22, 'doloribus', 'debitis', 3, '54', ''),
(23, 'tenetur', 'autem', 3, '61', ''),
(24, 'et', 'tenetur', 4, '76', ''),
(25, 'perferendis', 'consequatur', 4, '103', ''),
(26, 'a', 'odio', 1, '99', ''),
(27, 'iure', 'commodi', 1, '57', ''),
(28, 'quod', 'suscipit', 4, '66', ''),
(29, 'impedit', 'consequatur', 2, '70', ''),
(30, 'laborum', 'modi', 1, '87', ''),
(31, 'ut', 'occaecati', 1, '68', ''),
(32, 'praesentium', 'velit', 1, '56', ''),
(33, 'impedit', 'velit', 2, '97', ''),
(34, 'non', 'tenetur', 2, '67', ''),
(35, 'atque', 'voluptas', 3, '65', ''),
(36, 'quis', 'ducimus', 4, '99', ''),
(37, 'sed', 'ipsa', 2, '67', ''),
(38, 'sapiente', 'molestiae', 4, '73', ''),
(39, 'fugit', 'praesentium', 1, '85', ''),
(40, 'velit', 'voluptatem', 2, '80', ''),
(41, 'veritatis', 'ut', 2, '93', ''),
(42, 'eligendi', 'quo', 1, '73', ''),
(43, 'iste', 'officiis', 3, '58', ''),
(44, 'fuga', 'ut', 3, '97', ''),
(45, 'aut', 'iste', 3, '78', ''),
(46, 'optio', 'eligendi', 2, '98', ''),
(47, 'dolor', 'delectus', 2, '100', ''),
(48, 'tenetur', 'facilis', 1, '90', ''),
(49, 'quo', 'laborum', 4, '66', ''),
(50, 'cum', 'facilis', 1, '88', '');

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
(10, 'schoolTerms', 'Privacy Policy of CuteBrains<br />\n					With Effect From &ndash; 22.03.2019<br />\n					Privacy Policy<br />\n					Virtu Information Technologies Pvt. Ltd. (&ldquo;our&rdquo;, &ldquo;we&rdquo;, or &ldquo;us&rdquo;) operates the CuteBrains web and mobile application ( the &ldquo;Service&rdquo;).<br />\n					This page provides you the information regarding our policies concerning disclosure, use, and collection of personal data, when you opt to use our services. This section also explains the choices that you have regarding our data.<br />\n					We make use of the data to provide you the service and data is also used to improve the services being offered. When you use this service, it is implied that you give your consent to the use and collection of information according to this policy. If not stated specifically in this Privacy Policy, the terminologies used in this Privacy Policy carries the same meaning as mentioned in our Terms and Conditions.<br />\n					Information Gathering And Further Use<br />\n					Various types of Information is collated by us to offer you and further improve this service.<br />\n					Kinds of Data Collection<br />\n					Personal Data<br />\n					When you make use of our services, we may ask you to furnish a certain kind of personally identifiable information.&nbsp; This data would be used either to contact you or for your identification (&ldquo;Personal Data&rdquo;). The scope of personally identifiable information is inclusive of but not limited to the following:\n					<ul>\n						<li>First name, middle name and last name</li>\n						<li>Email ID</li>\n						<li>Usage and Cookies Data</li>\n						<li>Phone number</li>\n					</ul>\n					Usage Data<br />\n					When you access the application through any device, some information may be collected by us automatically. This information is inclusive but not limited to type of device, unique ID of your device, the IP address of device, your operating system, type of internet browser you use, unique device identifiers and various other kinds of Usage data (&ldquo;Diagnostic Data&rdquo;) .<br />\n					Cookies &amp; Tracking Data<br />\n					We make use of cookies and other similar type of tracking data to follow the activities done by you on our application or service and we withhold some information.<br />\n					Cookies are nothing but files with little amount of data. They may or may not include an anonymous unique identifier. The website sends cookies to your browser, which is stored on your device. Use of scripts, tags, and beacons is made by the tracking technologies to collate and keep a track of information. This is done for improvement and analysis of our services.<br />\n					However, you can instruct your browser not to accept all cookies or to give you an indication when a cookie is being sent. But we would like to mention specifically that if you refuse to accept cookies, you would not be able to use some sections of our service being offered.<br />\n					Some Examples of Cookies used by us:-\n					<ul>\n						<li>Security Cookies: These are used for security purposes.</li>\n						<li>Session Cookies: These are used to operate our service.</li>\n						<li>Preference Cookies: These are used to remember certain settings and your preferences.</li>\n					</ul>\n					Data Usage<br />\n					CuteBrains makes use of the collected data for various purposes:\n					<ul>\n						<li>For prevention, detection and addressing of technical issues</li>\n						<li>For monitoring service usage</li>\n						<li>For collection of valuable insights to improve the service</li>\n						<li>For providing support and customer care services</li>\n						<li>For allowing you to participate in interactive options of our application , when you choose to do so</li>\n						<li>For sending you notification about changes of our service</li>\n						<li>For maintenance and providing of service</li>\n					</ul>\n					Data Transfer<br />\n					The information that you choose to furnish to us inclusive of Personal Data may be sent to computers outside your own region of stay. In these circumstances the governmental jurisdiction and data protection law may be different from what is applicable in your region of stay or country. &nbsp;<br />\n					If your region of stay is outside India, then please note that we send your personal identifiable data to India and process it there.<br />\n					When you agree to this privacy policy and provide the submission of information, then it is understood that you agree to this clause of Data Transfer.<br />\n					CuteBrains would assure that your data is treated securely and according to the Privacy Policy stated herein. &nbsp;We would also ensure that no transfer of your personal identifiable data takes place to any organization or country where adequate controls and data security measures are not in place.<br />\n					Data Disclosure<br />\n					Legal Prerequisites<br />\n					CuteBrains may disclose your personal identifiable data in good belief where the action is needed for:\n					<ul>\n						<li>For protection against legal liability</li>\n						<li>For protection of personal safety of users of the service or the public at large</li>\n						<li>For investigating and protecting against possible wrongdoing related to the service</li>\n						<li>For defending and protecting the rights or property of CuteBrains</li>\n						<li>For complying with a legal obligation</li>\n					</ul>\n					Data Security<br />\n					The safety and security of your data is very vital to us, but remember that the process of data transfer over the internet, or electronic data interchange is never 100% secure. Hence, it must be understood by you that however, we fully strive to protect and safeguard your personal data, but we cannot guarantee the absolute security of the data.<br />\n					Providers of Service<br />\n					We may make use or employ third party companies to assist us in providing you the services on our behalf, to perform service related activities or in the analysis of the service usage.<br />\n					The third party companies that we would be employing shall just offer you the services on our behalf and are in no way obligated to use or disclose your personal data for any other purpose.<br />\n					Links to Other Sites<br />\n					Our application may contain links to other sites that are not operated by us. We strictly recommend that you visit the Privacy policy of each and every site you visit.&nbsp;<br />\n					We do not supervise or control the content, privacy policies etc. of the third party services or sites.<br />\n					Privacy for Children<br />\n					Our services are not meant to be addressed for any one below the age of 18 (Children).<br />\n					Our policy is not to collect the personally identifiable information from any one below the age of 18. If your child has knowingly or unknowingly provided us the personal identifiable information, then you as a parent must bring this to our notice. We would then take steps to remove this information from our servers.<br />\n					Changes to this existing Privacy Policy<br />\n					Our privacy policy is subject to updates from time to time. We are supposed to post the new privacy policy on this page time to time when such updates are available.<br />\n					You would be sent an email or other conspicuous notice may be sent to you, in order to notify you regarding the abovementioned changes. We are also mentioning an effective date at the top of this Privacy Policy.<br />\n					This is a general advice to you, that you keep checking this page for sighting any changes that are made to this privacy policy.<br />\n					Contact Us<br />\n					If you have any queries regarding this privacy policy, please get in touch with us via email info@virtu.co'),
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
(1, 'Home', 'Ea et eum iusto sed unde explicabo dolorum natus aut ut voluptas maiores nihil odio sequi sed ullam voluptas voluptate est non omnis assumenda.', 1),
(2, 'About us', 'Repellat rerum at unde repellat aut voluptates quod aut in voluptatum qui ut.', 1),
(3, 'CMS', 'Natus ipsa fugiat omnis et ullam quia nesciunt est voluptatem aliquid commodi corporis ut autem.', 1),
(4, 'Sections', 'Est sapiente nam et expedita id dolore aliquid nisi soluta et.', 1),
(5, 'Subjects', 'Natus et aut dignissimos rerum voluptates iste deserunt consequatur molestias placeat id.', 1);

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
  `department` int(11) NOT NULL,
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
(1, 'ahmedsk', 'chad57@watsica.net', '$2y$10$jrkhc91WePcb4Ea5IT4kv.pLxvcnf7CyigySo1SnqAi.HDgvh9T/C', '', 'Ahmed Sayed', 'admin', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '755885', '+58 4755435', 0, 0, 0, '', NULL, '', '025.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(2, 'Virtu', 'yasmeen.rosenbaum@gmail.com', '$2y$10$2IkUhwLrzHmWzCBfSk3CM.bGnGvwi5r3FovnzNu6E2jWYq0iPQT92', '', 'virtu', 'admin', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '162439', '+19 2570733', 0, 0, 0, '', NULL, '', '029.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'employee', 'boehm.murl@hammes.com', '$2y$10$3qcOsIJv6e4F/W1rYmgME.14fNIra.VNeencUVZEZovmbPQp4YXne', '', 'Jonatan Koepp', 'employee', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '117540', '+90 3164054', 0, 0, 0, '', NULL, '', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'feil.litzy', 'novella66@gmail.com', '$2y$10$M1MZZenyKnFOkK8/NzZvM.S9uREbj9y5anSbKVID82.efhA08EqWO', '', 'Mariam Heathcote', 'employee', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '297857', '+94 6056813', 0, 0, 0, '', NULL, '', '041.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'lebsack.nathanial', 'west.joel@yahoo.com', '$2y$10$bR/.DsS1oEhH24dWKe0aM.Smgw9iMMQNldt6uyp334UKJJC3kOS.m', '', 'Grover Bergnaum', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '864409', '+47 5349553', 0, 0, 0, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'mschroeder', 'flo26@yahoo.com', '$2y$10$hS4GvBMXWQgfeBn5aSI89.ScLFizrEKJI1mJu3G3vGV2JiLep935y', '', 'Mia Wilkinson', 'employee', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '493215', '+25 2820006', 0, 0, 0, '', NULL, '', '010.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'andres.stracke', 'bernhard.jakubowski@zboncak.org', '$2y$10$uBZ1EMf7LOQaqMaFg3zb.OweedfMp4PhtBI6m6oJaA64JEeC1w3b2', '', 'Earlene Grady', 'employee', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '212866', '+60 6829364', 0, 0, 0, '', NULL, '', '01.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'fisher.toney', 'jones.holden@dietrich.net', '$2y$10$NufPZ1H1i.X2Rmv59b2Yv.yZKkXeBER4ghA0722omDmDDg7OGOQ6q', '', 'Mr. Arch Predovic DDS', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '505683', '+15 8626362', 0, 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'rohan.tomasa', 'welch.abigail@hotmail.com', '$2y$10$F8rKVGeGEKpVlsSsYz8IUOQyGDaQen3DQFDhI7gEIPBi7s8kK/QxG', '', 'Melvin Friesen Jr.', 'employee', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '126450', '+61 1983816', 0, 0, 0, '', NULL, '', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'bahringer.althea', 'schowalter.sabrina@keeling.org', '$2y$10$LFfIXHDbm8lvEDTQOUXCP.0VJbVIhmLfSREtdZurJI0qsLxN0ZwHq', '', 'Cole Weber MD', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '951011', '+86 3259324', 0, 0, 0, '', NULL, '', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'barrett.douglas', 'chelsey80@yahoo.com', '$2y$10$Xvte9VCVUo7h9JPtRPhsKO2uhaM9/wkwOY9FOJZLD48IRr1YM2uZ2', '', 'Arnaldo Bayer', 'employee', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '619817', '+64 7622394', 0, 0, 0, '', NULL, '', '022.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'merlin.haley', 'schmidt.tyrell@nader.info', '$2y$10$aNpI700EpBMOEUeimgUVLOxADDtPZh8m7wAVfkpyIc6VhLRjhcVdG', '', 'Roxanne Hettinger', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '573914', '+52 8369039', 0, 0, 0, '', NULL, '', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'ohara.wayne', 'alyce40@hotmail.com', '$2y$10$9ngNpxTmE/Ku4YGfqTlrIe/gkj9qX35VHXwLCyqI59IkHosS/ZQF.', '', 'Al Jakubowski', 'employee', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '523657', '+19 6500738', 0, 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'anika.abshire', 'golden.goodwin@gmail.com', '$2y$10$v/bB3qt0KiMOj3yNBYhQL.ERgbKISQC1oTq3omASWzwryEEhUI3ne', '', 'Harmon Bernier', 'employee', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '566497', '+78 1328033', 0, 0, 0, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'nienow.julian', 'runte.krystel@gmail.com', '$2y$10$5doh.pIuy1PA3m1.qDgIteUySEpiGIKAI02YKupr.ly4AxhHFs.L.', '', 'Cary Simonis II', 'employee', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '908446', '+25 7912437', 0, 0, 0, '', NULL, '', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'streich.kari', 'maxwell22@watsica.info', '$2y$10$2OkykgSaVdKavJCUIpbD2e1Nmz9WP.vpSLtl/gXasFJiHfom.Bymu', '', 'Fritz Kilback', 'employee', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '429478', '+78 9889055', 0, 0, 0, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'megane.feeney', 'fdouglas@hotmail.com', '$2y$10$rl630KD4dnzRfhyWUypI7uAleFjwB8/cmBmef7IiyXa/7sTDca29a', '', 'Kali Goodwin', 'employee', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '849604', '+90 6468203', 0, 0, 0, '', NULL, '', '06.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'yadira05', 'breanna.mcglynn@gmail.com', '$2y$10$kFPNsdp6k7TRDFCYE3Y1G.Cl/qDm1xnJ1Nd6Ays9DwAUoeiCFa4NG', '', 'Prof. Billy Pagac Jr.', 'employee', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '617269', '+77 1897041', 0, 0, 0, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'efren83', 'zhamill@murphy.org', '$2y$10$sC3tH.ot5FjdFvm7mYwG1uAvcjIfJ7c1CHEMVV8wEGw61/1vs8pbq', '', 'Camryn Dicki', 'employee', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '455794', '+48 5083684', 0, 0, 0, '', NULL, '', '06.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'jeramie.reynolds', 'oran.kling@hotmail.com', '$2y$10$5EOuUP2M3j0C5lLNg5AEPea8K9D8NqeJcqM9ZPSAdeytu8brzX482', '', 'Ceasar Rippin', 'employee', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '208846', '+31 9136203', 0, 0, 0, '', NULL, '', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'arlie.simonis', 'akautzer@heller.info', '$2y$10$mC4vwbfYq.aOOsBNjqwkh.H9tqr.WBqBd/sc4.1Hav02hd0P7QCqi', '', 'Eliezer Boyer IV', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '484000', '+43 5360378', 0, 0, 0, '', NULL, '', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'alysa93', 'drice@harber.com', '$2y$10$PZhQngTWvrwZzKrPQnG16OckGTSFB/3e7myUhR6doOS6gSMMcHVWa', '', 'Jaunita Aufderhar', 'employee', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '751393', '+54 8757962', 0, 0, 0, '', NULL, '', '053.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'buford.lesch', 'marshall.leannon@rath.com', '$2y$10$14Vdt/vB5Ytd1Fhmp53uZOZ1WEC.VlTVO0J21fjeOsPGBsKRe/o96', '', 'Prof. Demond Schaden Jr.', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '757747', '+31 3853001', 0, 0, 0, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'kris90', 'ezekiel.langworth@krajcik.org', '$2y$10$h8a9LFYWgiNkbel1nifm/OEUgtmy5ubvt0aeMVa5NiEaKJ8c/2V/y', '', 'Mr. Chesley Kulas III', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '147169', '+34 8320674', 0, 0, 0, '', NULL, '', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'arjun07', 'vsawayn@hotmail.com', '$2y$10$HUACOy7CR/xytLuxoL2HMORVW1ThOFycHOZhnS3XZkZuFVwt/Rl3y', '', 'Maybell Kiehn', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '652646', '+43 6339940', 0, 0, 0, '', NULL, '', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'schumm.shanel', 'weffertz@krajcik.com', '$2y$10$bzF5Onuuw666kNQ1K.bkE.KgxXWFGzlb6kX1RvmnDN7egyo7D9UY.', '', 'Vern Kuhn', 'employee', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '881643', '+61 8600807', 0, 0, 0, '', NULL, '', '07.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'schneider.isac', 'bins.misty@kassulke.com', '$2y$10$kbkgJKS7o9CVxArCEYpBSe2dpfoNdeFXukXeBnkoCeL71Y/2PlmQ.', '', 'Amie Jones', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '562063', '+48 5196839', 0, 0, 0, '', NULL, '', '065.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'isaiah83', 'buckridge.catherine@hagenes.com', '$2y$10$Vkoxmz42qU6aMZ/BNa/QeucRrmdtzIK3ZbHCGI2xDFsBo2VdLxLOy', '', 'Kattie Sipes', 'employee', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '822309', '+54 9803867', 0, 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'osborne09', 'larry.von@gmail.com', '$2y$10$uDQY8OxxKWDXZQRbdeSpGOUYsbJxivq2Wxlq8ykm7G1/PAzPBSNB.', '', 'Mrs. Ernestine Hackett', 'employee', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '986559', '+88 1037060', 0, 0, 0, '', NULL, '', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'sstreich', 'alexandrea49@hotmail.com', '$2y$10$Sq7gUiG6Mo4ll7GxB6e9N.tnKsJN.98BeGZkOBvs/gFiWoMNoRzDq', '', 'Ms. Hulda Wuckert DVM', 'employee', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '180558', '+97 6146545', 0, 0, 0, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'mprice', 'zboncak.desmond@mills.com', '$2y$10$p1PrqwcofJfQAUbSRtpIAeieWFq9hUF.pL8Gzaf9waZsGT0rMiTMW', '', 'Mr. Isidro Rogahn III', 'employee', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '475864', '+53 2990484', 0, 0, 0, '', NULL, '', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'eveline.fay', 'kira.schowalter@haag.net', '$2y$10$lmGM2q/bRmgUhDn354PDxOFW1yafUhqNsnKUedoGj.JwMFaPbeudW', '', 'Prof. Tom Wyman', 'employee', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '366006', '+14 9597386', 0, 0, 0, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'dibbert.carol', 'vkub@ondricka.com', '$2y$10$3bGoTVRCg7srXnEtKlYHPe7xvqOKn3n1RpRWYNjpM7lmRjJbo54yy', '', 'Sydni Schuster', 'employee', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '694721', '+20 6568818', 0, 0, 0, '', NULL, '', '01.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'carmen61', 'lupe22@yahoo.com', '$2y$10$LS4CkOByw1UmzU62bxckK.KHAHwD7j2YVGsDGhk0sSLRLrHHoWwqa', '', 'Ericka Leannon', 'employee', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '458688', '+99 7600158', 0, 0, 0, '', NULL, '', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'murray.delia', 'ufadel@goyette.com', '$2y$10$pCCPbof89Ro7RHP/Y4PsBO.k5KSjGPtzyvkHcUzCXU/.Q6b.W/MNG', '', 'Shemar Padberg', 'employee', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '584566', '+14 1787590', 0, 0, 0, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'ziemann.hermina', 'darrion17@cartwright.net', '$2y$10$SAiEbHyaPSrrv2B1KjFK3eZtmMls4QQ9rvnT1.Kc/KwugfttBdbea', '', 'Elias Veum Jr.', 'employee', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '334682', '+43 9333914', 0, 0, 0, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'fjaskolski', 'tatum63@kutch.org', '$2y$10$NywAGVq97eVJId2bKBm8Ie5ibwIlIo.DrgqkU876ovGSJt/JLjfk6', '', 'Mr. Okey Strosin', 'employee', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '178957', '+65 6437023', 0, 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'meagan09', 'schamberger.dean@dooley.com', '$2y$10$72pKRwCcutHkp6FwqmgXE.Vu/L9ki3jYkZz1W034.IibdiOPWZ3jq', '', 'Nels Roberts', 'employee', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '606594', '+86 2737761', 0, 0, 0, '', NULL, '', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'sonia.bartell', 'jana.white@yahoo.com', '$2y$10$8XlvL.QDbDzSAph31f716uv8jDf/HNtBvYTOhg4uALBgK7WuUKENi', '', 'Maria Hamill', 'employee', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '562552', '+62 7606712', 0, 0, 0, '', NULL, '', '090.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'dylan.doyle', 'adaugherty@gmail.com', '$2y$10$DlCv4pQ0cBplqmHraGXjP.neuGdRk5e778Wkufnq7MqR6j.QR7/zO', '', 'Keshaun Schowalter', 'employee', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '946117', '+58 8635251', 0, 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'gutmann.yasmeen', 'rowland.bartoletti@gmail.com', '$2y$10$kwHB3RXu.gw6Ld/l7vNFRu5y9Sr1BbEH41Ga2wi9GV7dK.kCr2tCm', '', 'Clarabelle Koch', 'employee', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '533023', '+97 8786924', 0, 0, 0, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'trudie36', 'brown.dayne@gmail.com', '$2y$10$pj4wgysHPa3zy/ncweHWTe0fAfHf8kKkconzd2Moeormj7NswK.5K', '', 'Mr. Mose Funk', 'employee', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '738253', '+22 7259998', 0, 0, 0, '', NULL, '', '050.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'howell.bethany', 'rwalker@yahoo.com', '$2y$10$a897JIGknAcJvpi8Ma6qy.9pGm1yQ7gZPV7mwEaGjmrgO8h/L0w7G', '', 'Kamille Rau', 'employee', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '523880', '+36 7435873', 0, 0, 0, '', NULL, '', '03.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'nicole06', 'ehauck@schowalter.org', '$2y$10$c.fpyuC4E73PajC70ETKZOkx3X5WK2ELTcLnhwI0FKhsL8226Iu1C', '', 'Carley O\'Keefe', 'employee', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '705550', '+80 4293174', 0, 0, 0, '', NULL, '', '018.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'elaina.okon', 'casper.beier@blanda.com', '$2y$10$I9oLFB3tOeCJlDL1FzYumu4Wdb5YHyjfNkrZhzdZ/1nBwagjfUoIK', '', 'Silas Hintz', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '649004', '+77 2552834', 0, 0, 0, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'ezra.reynolds', 'cornelius.kub@yahoo.com', '$2y$10$dh0Khn.N0AnDgM5UMUPGk.zRkPt5zWtE7WChudmuIMY11D9tPUJo2', '', 'Velma O\'Connell', 'employee', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '317289', '+25 7819606', 0, 0, 0, '', NULL, '', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'providenci.rath', 'barton.erika@gmail.com', '$2y$10$4sbcc1xy2eDbVhVMUB6wVOhI1VSMK1Y1JcxJxfWqlnxc2JuQYIE4O', '', 'Yessenia Hintz', 'employee', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '112003', '+13 4031781', 0, 0, 0, '', NULL, '', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'jade58', 'vickie13@hotmail.com', '$2y$10$ixA34mzpYMYyLoimpcXxjugksSq46q/mZ2o8rAXVJ71vkXoc1f50S', '', 'Claire Denesik', 'employee', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '895252', '+85 5873489', 0, 0, 0, '', NULL, '', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'ffeeney', 'vbeatty@yahoo.com', '$2y$10$Fj3a5ZuM7sILeQTvB6/gW.Ovp.VFs7kwASDsiLJwqrYy1rqVNLwru', '', 'Laury Cronin', 'employee', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '988793', '+49 1590901', 0, 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'lemuel31', 'allan34@grant.com', '$2y$10$7wT3kubb791.OULHi.ht7.En2Brun7aUVZbjONFiHvKCj2q9dvqXu', '', 'Selena Block Sr.', 'employee', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '564831', '+28 5198796', 0, 0, 0, '', NULL, '', '025.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'bogisich.sammie', 'roderick.runolfsdottir@hotmail.com', '$2y$10$5SePkmH0IOcaD/GAkXVEqOaMuaXzm9/1L/OiCV6hVIeLhm9TOeRtS', '', 'Alvina Walker PhD', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '857828', '+28 9868019', 0, 0, 0, '', NULL, '', '052.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'jerrod31', 'rsanford@hotmail.com', '$2y$10$D6Bgrxdg4FWqP.0xwaBCReSKSBID1.bnNm50tlQNJj6ZLUhs3HPlm', '', 'Reyes Lind', 'employee', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '700650', '+82 1932657', 0, 0, 0, '', NULL, '', '077.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'nickolas.stokes', 'tremaine.keebler@leffler.com', '$2y$10$AjbJMH2nZCFW1COBnR.8BuaT2KRncjCsMvKso00eRNH2vzlSzZ13O', '', 'Margaretta Morar', 'employee', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '174333', '+26 5627404', 0, 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'teacher', 'iskiles@casper.biz', '$2y$10$mpn6x.6.LV8FkDGGWaXbleduRhkhcs6yaLmpCqRPkvX5FbUM.FeK.', '', 'Raegan O\'Keefe', 'teacher', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '634998', '+91 2173987', 0, 0, 0, '', NULL, '', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'abode', 'erdman.isabelle@greenfelder.com', '$2y$10$oN2v4cn04HKaTjy3Zlgd4OVxyfT9kC3XuEre40O1tgEa8cysbW2/e', '', 'Jakayla Okuneva', 'teacher', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '431886', '+45 5540139', 0, 0, 0, '', NULL, '', '035.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'annamarie.nader', 'mccullough.kaelyn@hotmail.com', '$2y$10$ciOIiwOpVfARy49DzCCnMu0UDQ9brP681/CBJYqT.4wvpRiggblAG', '', 'Pierce Denesik Sr.', 'teacher', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '497397', '+94 1688346', 0, 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'mabelle19', 'hanna.feeney@gmail.com', '$2y$10$5Uq1VR6leQIOOq7hPZcriuiioc6l1L9Hh/9X6V78gqcXCx7uZyEcW', '', 'Bobby McCullough', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '374943', '+18 3159015', 0, 0, 0, '', NULL, '', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'anjali.dare', 'bryana.connelly@yahoo.com', '$2y$10$Kc93s3KYiWB3B6R6pDX/YutwEa06LZOwFfougEZJNC0HqN3CeHOG6', '', 'Amanda Nienow', 'teacher', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '670505', '+93 2076548', 0, 0, 0, '', NULL, '', '026.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'florence39', 'xhuels@gusikowski.biz', '$2y$10$T.g2LaQHRgLTZKbUXDwT5.qlulqDJGOD9VDwySgHvy1Gp//LwK.DG', '', 'Dr. Randall Larson', 'teacher', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '817605', '+58 5058281', 0, 0, 0, '', NULL, '', '041.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'maurice17', 'carson20@gmail.com', '$2y$10$FQL3sllL32CgM1ic.OGvk.2d0PLPemaZYkGANZrGGkD/0VhzOtGAm', '', 'Kolby Lesch', 'teacher', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '857397', '+66 6080847', 0, 0, 0, '', NULL, '', '09.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'vledner', 'ugutmann@gmail.com', '$2y$10$DIH4wd0DRs68af/mmeA/i.vdm8rjayf4oyC4mlLzR6aVcf9TRz2CW', '', 'Lavern Cartwright', 'teacher', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '946782', '+97 3289363', 0, 0, 0, '', NULL, '', '018.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'atreutel', 'dorian.wolf@sipes.org', '$2y$10$Q2JjKIIb9bogLmV0fIqLZ.MDAzgXBViTR7jozr6wu2I2wSI7DJ7SW', '', 'Zelma Hartmann V', 'teacher', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '971245', '+62 2590083', 0, 0, 0, '', NULL, '', '029.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'crooks.lenny', 'xkoelpin@yahoo.com', '$2y$10$Sfowh99jCZ2xpYUJ2FOeU.H4b2NPg517zIJqAgdAh635oh09FPw2.', '', 'Monroe Lehner', 'teacher', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '597932', '+26 9290596', 0, 0, 0, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'cshanahan', 'gkessler@hotmail.com', '$2y$10$T15o3JQFfT/baNLwtvo09eeisuFXFw2XIORXnhyoPmnEsm2qZiSXa', '', 'Dr. Fanny Zulauf II', 'teacher', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '731751', '+83 2721528', 0, 0, 0, '', NULL, '', '063.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'meghan.langosh', 'paucek.odie@hotmail.com', '$2y$10$4wNokbI/RpcMwwJXmufKdeawNiSQ9qn8FxIAZE57TSCRDs8y92qYe', '', 'Dr. Doug Barrows II', 'teacher', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '432321', '+21 1485729', 0, 0, 0, '', NULL, '', '075.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'creola.pfannerstill', 'sydnee50@yahoo.com', '$2y$10$kugqsrSGPua./6QdAwNpMum2WuDDuCDYe6i9DGXJ2sSunqddp.7NC', '', 'Dr. Kristofer Gleichner PhD', 'teacher', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '595214', '+30 2323783', 0, 0, 0, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'mosciski.jorge', 'larue.padberg@cartwright.com', '$2y$10$SXZ657Opz.zRFfOsaHk83eTavAgcg7N08xz01s41chvL3CQ9POkvK', '', 'Mr. Florencio Nicolas', 'teacher', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '429021', '+52 9787127', 0, 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'wilton70', 'tierra.jones@hotmail.com', '$2y$10$V953bPBU.j41Zwot/ysK6OXe8niAIltVRH/EvncyQTm6lmP5NjiIe', '', 'Armand Lakin II', 'teacher', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '867592', '+99 7016394', 0, 0, 0, '', NULL, '', '046.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'heller.emiliano', 'nannie84@pouros.org', '$2y$10$MTXl6N8H7xvqOILHjZ9CvO4iPWjH5fED/S/6HvhJ85jX5uS4guv26', '', 'Wilfredo Veum', 'teacher', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '313305', '+19 9997398', 0, 0, 0, '', NULL, '', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'virginia09', 'prohaska.zander@hotmail.com', '$2y$10$Z1migJy.jOZ7Aym4F1g4l.1Gzik7INFhEWbVqeMM6YsqJUy8efWfi', '', 'Ricardo Hickle', 'teacher', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '640661', '+99 8230314', 0, 0, 0, '', NULL, '', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'xrenner', 'troy31@emmerich.com', '$2y$10$akO4HdDO8aROS0pO/b6QCui0t/8KiIKlyc1nMCws8d7Id7mNuccgW', '', 'Nedra Purdy', 'teacher', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '873408', '+27 8314598', 0, 0, 0, '', NULL, '', '077.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'ozella.labadie', 'armando.labadie@heller.com', '$2y$10$j3URjk15uGcJaRUa9WGvw.BM.gbc/OTaIdnJSsEAvRNp66ZJgF34O', '', 'Rhianna Jacobi', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '468722', '+35 2319491', 0, 0, 0, '', NULL, '', '020.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'stehr.ruthe', 'koss.joesph@walter.net', '$2y$10$iJLvAifbL4LYD7ExKqbia.gjHn.dR8eZ4j4yMp90oc6qpspZndQzG', '', 'Elnora Roberts', 'teacher', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '785332', '+17 4679724', 0, 0, 0, '', NULL, '', '024.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'oweber', 'rutherford.cassandra@baumbach.info', '$2y$10$wg2X1zT977BXLHT1j7vwS.3IrVCu52MjkyX.F3uojBeZuiY5PJoNG', '', 'Miss Glenda Kuhn', 'teacher', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '632115', '+46 2704378', 0, 0, 0, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'jaylin.veum', 'lowe.larissa@yahoo.com', '$2y$10$pc4exEWrZPJSOcNqy6xBK.OgV2S3Ycwg3jyNWuG.Iv4oble4iwjjO', '', 'Dereck Ankunding', 'teacher', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '257682', '+52 4579619', 0, 0, 0, '', NULL, '', '038.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'tremayne.ondricka', 'andrew95@gmail.com', '$2y$10$T4vaeZi7Olb/HuADx/QaFOJMwt.ms34fFD2wOHlrszIEqj3ADYbNe', '', 'Sonny Williamson', 'teacher', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '458687', '+62 8395329', 0, 0, 0, '', NULL, '', '012.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(77, 'stephanie65', 'orrin27@swift.info', '$2y$10$CWy5cA86uDMn6lT9GEpgxuS/bAU2hmWXMrcL.nL2EfXTTKyUrW6WG', '', 'Prof. Ludwig Rogahn Sr.', 'teacher', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '226584', '+59 2084730', 0, 0, 0, '', NULL, '', '08.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'viviane.balistreri', 'uchristiansen@hauck.org', '$2y$10$pFZa60g4EVVZTVHWRYMYQuuuRj4D6xy40pUzjbcWWn08hDxb7c5su', '', 'Kevon Schulist', 'teacher', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '410312', '+21 4464974', 0, 0, 0, '', NULL, '', '01.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'schaden.brice', 'kyle99@gmail.com', '$2y$10$QS0hVjQ/rvYHlqwOJ6HjJeJjKS1azbZ5hjpvsAKAISk9IZJZ3Swpy', '', 'Buford Smitham', 'teacher', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '632943', '+41 1047815', 0, 0, 0, '', NULL, '', '097.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'abdiel.considine', 'mills.haley@waelchi.net', '$2y$10$Va1y7LdS8AIEzHJ09BhvRe0ojgoiJRHu1xxMrAkPMR1zBawBokJ7W', '', 'Audreanne Funk', 'teacher', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '322515', '+68 9069646', 0, 0, 0, '', NULL, '', '014.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'luella30', 'juana29@gmail.com', '$2y$10$tCdmyc29gg/LjdkqdqdLLeV8sZii1rwAdKJs8QZQsWvOqtxzaz94O', '', 'Brannon Bradtke', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '667313', '+17 1344917', 0, 0, 0, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'otilia.wiegand', 'rtremblay@yahoo.com', '$2y$10$oCgSyXs5R9LgvZ0cZhs8CeR6pBbT61Fo4aGw91iGPEzDlAkcon2ki', '', 'Deshawn McKenzie', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '415434', '+55 8014672', 0, 0, 0, '', NULL, '', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'harber.phyllis', 'raymond.schneider@gmail.com', '$2y$10$G3y9SZITcFykE4jb7YkV1.AW/R6e/sesliNtzY7eApFtIIVrXgcDG', '', 'Braulio Okuneva', 'teacher', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '989097', '+90 7579908', 0, 0, 0, '', NULL, '', '017.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'mary39', 'hermann.bethel@price.info', '$2y$10$lBlNmIip/JXOfi6agfCxT.gNQ5HsYbd7y32jdEyn8sH/dfC/FFgWK', '', 'Eda Gislason', 'teacher', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '730162', '+63 4309086', 0, 0, 0, '', NULL, '', '086.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'kelsie85', 'alba89@mann.com', '$2y$10$w0LXERblJ3EbDvaZ1xoTPuJcfATZzyKBdxpuVYRQSZu.0oyyr.qAy', '', 'Prof. Laurianne Kuphal', 'teacher', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '159727', '+81 7997641', 0, 0, 0, '', NULL, '', '073.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'xbrakus', 'bailey.mante@hotmail.com', '$2y$10$DHd99xhyud6DxKMESb575.pa3kk/pXCN.TAh9mYpp.iljk3P9pX.W', '', 'Prof. Bartholome Gorczany DDS', 'teacher', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '637683', '+93 9413687', 0, 0, 0, '', NULL, '', '090.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'vullrich', 'eden45@ondricka.com', '$2y$10$hxiKKJrO.eZk21KYdBUnDOR4uKkhvpZ6EJf/uudE6D8OaiJys6b1e', '', 'Ms. Magdalen Harvey II', 'teacher', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '572695', '+48 7284685', 0, 0, 0, '', NULL, '', '077.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'turner.sam', 'isaiah.erdman@walker.com', '$2y$10$xDvBzarZ//ewpeYSoPJwJ.FP3qP0IwGVBBV.y4RJUiltL2zifhKtm', '', 'Norbert Wisoky', 'teacher', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '275648', '+91 4268102', 0, 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'precious93', 'haylee85@stamm.biz', '$2y$10$pDRkk3wMqOgiA9rInpGj3u4dRxcLBx4aT8O7SydbSC2f1hFHSFlpy', '', 'Precious Bogan', 'teacher', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '644221', '+37 8858478', 0, 0, 0, '', NULL, '', '057.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'tjohnston', 'marilou06@funk.net', '$2y$10$sTpPfJWSsKiXRTLCXcQ2X.OUyKbgYyxdii5IdoAYtpXyBC88LuVGu', '', 'Isabel Block', 'teacher', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '429063', '+83 3579475', 0, 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'langworth.amaya', 'xconn@schuster.info', '$2y$10$XssI7I4bPPh7kiqPzoN2eu.JSG.9l0yzfLDUq93K3I4SAcBTKtqoy', '', 'Prof. Katherine Tillman', 'teacher', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '124575', '+49 2841083', 0, 0, 0, '', NULL, '', '018.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'spencer51', 'marjory.dach@ankunding.com', '$2y$10$OeFDHPSdje8.Fx2Ey9it3OEa.QleFS8RIWtBVmThWsUZbDA5T55Dq', '', 'Wilhelm Cassin IV', 'teacher', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '221344', '+81 2907956', 0, 0, 0, '', NULL, '', '065.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'wvolkman', 'luettgen.emerson@pfeffer.com', '$2y$10$wgLaVYd1468E14UXa58EqOOZxDAz.BYJLu.OMs6KhvTcYZpD2w3oC', '', 'Miss Margot Trantow Jr.', 'teacher', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '142874', '+45 6693149', 0, 0, 0, '', NULL, '', '011.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'breitenberg.mozelle', 'electa81@hotmail.com', '$2y$10$ycXnFYlDfNRTxunequ8hrePusLIptZj1j1GqUf0LeMNiOuYAouU8K', '', 'Sheila Runolfsson', 'teacher', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '666978', '+30 8405392', 0, 0, 0, '', NULL, '', '015.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'karine.hoeger', 'alessia39@hotmail.com', '$2y$10$Gogz9H0y0lojPNpdQmMUO.OV54ssdEOLM28Ngd.WaRp2atmf3raOy', '', 'Lillie Gaylord', 'teacher', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '902622', '+38 6341906', 0, 0, 0, '', NULL, '', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'oblick', 'clotilde.dare@gmail.com', '$2y$10$ek6ejWHpNYooJ.HERvbM2e9H3SwM5EgVL1NzQuJO5sMjIVO8H7jL2', '', 'Mrs. Ally Breitenberg I', 'teacher', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '718218', '+67 4912931', 0, 0, 0, '', NULL, '', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(97, 'nbradtke', 'kub.florine@hotmail.com', '$2y$10$69aC5d3nOE.EIUwpne7ckuuMGLv8peBCTNN2pB3jpFLC/eu/32fWi', '', 'Cristina Reynolds', 'teacher', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '223679', '+19 3871300', 0, 0, 0, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(98, 'erdman.francesco', 'parisian.jayda@monahan.com', '$2y$10$TynDJft58tUxpMKtIBeqpu79tthw.HX/eKY1A2w.lJ4jKUo1qGQ4u', '', 'Ahmad Reynolds Jr.', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '467878', '+22 7407424', 0, 0, 0, '', NULL, '', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(99, 'brennan92', 'lbashirian@gmail.com', '$2y$10$05wIx87xRoCdlaaoA3L51eFKJPeMjwE4t4/IxJgtz68FV33WJgOui', '', 'Abbie Cremin III', 'teacher', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '524242', '+17 7895149', 0, 0, 0, '', NULL, '', '078.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(100, 'jayme60', 'wbednar@yahoo.com', '$2y$10$7bIGytm.kQwiV7htQkulre75CuG.1RWpgvdt7ySu1RGo/TA3LGgFa', '', 'Dawn Gutmann', 'teacher', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '528129', '+76 9577774', 0, 0, 0, '', NULL, '', '013.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(101, 'tbrown', 'amiya98@gmail.com', '$2y$10$GsWgvOpbWg6n5OCdTCPaa.3nk2JIvECp7MkNfc7qjXy0/hJhXjPEy', '', 'Mr. Zachariah Dach', 'teacher', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '916853', '+76 6683639', 0, 0, 0, '', NULL, '', '013.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(102, 'simone.schoen', 'nicolette.spinka@yahoo.com', '$2y$10$NInKhMpQAH3/4762sgDaDOQqk9ciazceVxkJfCSsoO2JjhPrmAp/e', '', 'Dr. Benedict Strosin I', 'teacher', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '384490', '+35 4227048', 0, 0, 0, '', NULL, '', '023.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(103, 'theodore.pollich', 'florian77@lind.com', '$2y$10$c/tnGuKBOJAzz/u/Z6Bh9.Z95vnZQahQL8lQcmyEfHtBC.o3ug8Pi', '', 'Edythe Roberts Sr.', 'teacher', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '705358', '+30 4140458', 0, 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(104, 'lisandro55', 'madelyn.rogahn@yahoo.com', '$2y$10$.pwBkz9DHCTJNn3wn75OVe0n5dfdNKKygDRY/rpeYAj.jyl0qi6lu', '', 'Harry Wisoky II', 'teacher', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '587597', '+13 5300047', 0, 0, 0, '', NULL, '', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(105, 'student', 'ashtyn.grimes@stracke.net', '$2y$10$6NBygQ9TWW.RXJ1/8ArcW.bTEbEPDITAccBhCQ7UKr6vCnHSJtqSK', '', 'Miss Jazmyn Purdy Sr.', 'student', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5627253578', '1604936', 0, 1, 1, '', NULL, '', '038.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(106, 'zakary14', 'ara47@gmail.com', '$2y$10$65USTb3Jc6tnfLC44LFszuV8.eKEXOLvEdA9XhKgkT7E5bDltEuna', '', 'Mr. Macey Wiza', 'student', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8348486161', '5702482', 0, 2, 3, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(107, 'ciara.ward', 'lkuhn@bergnaum.info', '$2y$10$BCyTv1znBobJQ65YiNoHn.3jSRVZa5cDvdtGxQk.q8tPS1lFefNAu', '', 'Prof. Alvah Cronin DVM', 'student', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6993163833', '8739653', 0, 2, 4, '', NULL, '', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(108, 'ktorp', 'vernie13@yahoo.com', '$2y$10$38JbxhLDGi6vYk2BW6wb.OUa2Yw.c/6Qc5wKbWgjHrCIUniUVwtoC', '', 'Darby Douglas', 'student', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8535650915', '7112965', 0, 3, 3, '', NULL, '', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(109, 'archibald51', 'cheyenne.farrell@hamill.org', '$2y$10$.D6gInkZ4fFHWBQMPDuAUuXnwEbeSQOM0uqLRjrT0253W/EYOmVzm', '', 'Bettie Will', 'student', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2648826100', '7086788', 0, 1, 1, '', NULL, '', '079.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(110, 'maddison.okon', 'morar.lucious@yahoo.com', '$2y$10$TOR9/OHjIdyqqUgRT3G8pOYplyGDMMqxLwdSSZAoQcfbTm/C2oNhK', '', 'Deon Kutch MD', 'student', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6557623292', '6975766', 0, 2, 4, '', NULL, '', '092.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(111, 'ima.green', 'vpfeffer@ullrich.com', '$2y$10$wWgFjeOfzTAvzNA3C9OD3OlYqrK5LzRmAm6RIUsD87FIDbXKDp0xe', '', 'Princess O\'Kon DVM', 'student', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6302475999', '8743161', 0, 1, 1, '', NULL, '', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(112, 'shanon90', 'florencio64@gmail.com', '$2y$10$usVKpQ06sbR.hnhbTeEprejeHlV4oMiTlCR4T01rryLaEhJeeouQ6', '', 'Dee Rosenbaum I', 'student', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6490347289', '5973419', 0, 1, 2, '', NULL, '', '074.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(113, 'domenica21', 'ihagenes@braun.com', '$2y$10$gzXsw91QF0BNBWQgdWAOJeA.aXmviBadsBRyHvBEDU37oxa55HDbe', '', 'Meghan Hagenes', 'student', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6025190901', '3492577', 0, 1, 1, '', NULL, '', '087.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(114, 'monica.ullrich', 'mikel20@gmail.com', '$2y$10$p0PV40zYw/86czyhNhgp9uxuQ0QSrpSzvbqMMbZl5RS2nIEPcddla', '', 'Lauren Medhurst', 'student', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6969317667', '2128387', 0, 3, 2, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(115, 'rebeca07', 'jenkins.lonnie@beahan.com', '$2y$10$5uzk1DAKcwwlGnxcvSFV/uX4.UgIz0A9ZptHgzmcRI.NpdTsLf5S.', '', 'Brenden Kautzer', 'student', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3460000153', '8496764', 0, 1, 2, '', NULL, '', '02.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(116, 'runolfsson.holden', 'okuneva.elmer@gmail.com', '$2y$10$dAx8YiZ5kT8sBiHaYrkcRuhw5/favZrQiiril/ywuNpTSY7CHr8lu', '', 'Leopoldo Bashirian IV', 'student', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8743906360', '9914346', 0, 2, 2, '', NULL, '', '072.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(117, 'maggio.maybell', 'huels.bulah@zulauf.info', '$2y$10$4KdpSUBdrki5740pgte8gue25Sl8S2Fp/ypkyWmUa53Kx3K5gvHDS', '', 'Mrs. Janis Farrell PhD', 'student', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4138122956', '4067773', 0, 4, 3, '', NULL, '', '061.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(118, 'moen.jillian', 'zpollich@bernhard.com', '$2y$10$hZkXF5CYcfgnRsSJyfqDOuTwikfioFTB1LdQyzRn6jbXCYv06glim', '', 'Pasquale Daugherty MD', 'student', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2366854180', '9063122', 0, 3, 3, '', NULL, '', '00.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(119, 'luna.wisoky', 'corene.towne@hotmail.com', '$2y$10$Ttr30X0jJa36vPEYLfwIluzqCgiwipCHPeISGWF/s.64bG2TNWfDu', '', 'Francesca Spinka', 'student', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9141558815', '9593185', 0, 4, 1, '', NULL, '', '063.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(120, 'balistreri.ivah', 'garrett41@yahoo.com', '$2y$10$yp1AISvWalYmy7d4dA5WgOE3PMBJCpHsKlsaoZh8fT71juqTGDIja', '', 'Prof. Kody DuBuque', 'student', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3922344865', '5350145', 0, 1, 2, '', NULL, '', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(121, 'oschamberger', 'francis73@roberts.net', '$2y$10$sVZYJ/OqJOAdyDKqTyH5YOlt6aozFRGSrqdcdXjgreXSbrOCr6jfq', '', 'Mr. Rafael Schamberger', 'student', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8527999930', '3199106', 0, 1, 2, '', NULL, '', '08.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(122, 'lolita.legros', 'gibson.elwin@yahoo.com', '$2y$10$KNS3rTDb3ELujAgrRMOLdelIxJdpH9Fv12ZrZgeh7edlP81YoEJxu', '', 'Cortney Batz', 'student', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6481331626', '4565327', 0, 1, 3, '', NULL, '', '093.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(123, 'dangelo58', 'waelchi.mona@schowalter.com', '$2y$10$SROdldFSXPoVFW1sdnBkkOm3wZ5towbL5x0/1Z8aGcCEPXhLtL9OO', '', 'Dr. Ahmad Hermiston', 'student', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4511227142', '8169874', 0, 4, 4, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(124, 'ureilly', 'vwisozk@kassulke.com', '$2y$10$g0zkmOBC/X1wGn2ggnDDkOPZSL3nWPT5C9R1yxGzDBzgGtvayZFxe', '', 'Miss Meredith Pfannerstill', 'student', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4830269996', '8386733', 0, 1, 4, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(125, 'laury.torp', 'fhagenes@hotmail.com', '$2y$10$0NJRIm3.kZEWzMcGvRj3N.ZD9fdn/MhnO2Xtkn6WR1PMW2gYot7Ha', '', 'Rogelio Yundt', 'student', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9787424600', '3690371', 0, 4, 2, '', NULL, '', '054.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(126, 'parent', 'clark.abbott@hotmail.com', '$2y$10$7A.zHkCtJ3x6OX7SGvWMTe91bGhKw2wqSOpZaiL6UsP/NpAvDE2XW', '', 'Adrienne Goodwin', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6267985581', '8833353', 0, 2, 26, '', NULL, '[{\"student\":\"Brenden Kautzer\",\"relation\":\"father\",\"id\":115}]', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(127, 'ilehner', 'elmo91@yahoo.com', '$2y$10$NPr5jWg1WAdoGJ.1d3K86uiaAlgfj7InOlbeaBlxv6otETj5lMY/q', '', 'Ms. Gracie D\'Amore', 'parent', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5165035604', '7968726', 0, 2, 44, '', NULL, '[{\"student\":\"Pasquale Daugherty MD\",\"relation\":\"father\",\"id\":118}]', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(128, 'towne.bennie', 'vmonahan@schowalter.org', '$2y$10$LkSRyBkb9jk3L/hifUm0wO7oA6wv93WQP0Cb7FxVamjQF/ln1D0tq', '', 'Anita Erdman', 'parent', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3719258669', '8881347', 0, 4, 14, '', NULL, '[{\"student\":\"Mr. Rafael Schamberger\",\"relation\":\"father\",\"id\":121}]', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(129, 'semmerich', 'vbeahan@hotmail.com', '$2y$10$2Hnlmpxq2XdpOf8IG4pVFOEHT5us6CFWL4jM6.Y1TBIDidcRR6AAu', '', 'Karen Schneider', 'parent', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7669455207', '6196003', 0, 3, 19, '', NULL, '[{\"student\":\"Cortney Batz\",\"relation\":\"father\",\"id\":122}]', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(130, 'marlin39', 'waino.greenfelder@yahoo.com', '$2y$10$OLV6NbSztGD7Q6ZcviVA1.aOoIB85rzeaar670EgV8nA4BeKq6J02', '', 'Aracely Shields Sr.', 'parent', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5312450308', '2543330', 0, 1, 28, '', NULL, '[{\"student\":\"Mr. Rafael Schamberger\",\"relation\":\"father\",\"id\":121}]', '097.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(131, 'duane96', 'danyka.baumbach@steuber.com', '$2y$10$RkyU3rhdSwJ4gB9APcAEc./sUgYb3XA1SwQV0ls9D6a3zEsU7GkGu', '', 'Nona Kunze', 'parent', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9716368129', '1333649', 0, 1, 48, '', NULL, '[{\"student\":\"Prof. Kody DuBuque\",\"relation\":\"father\",\"id\":120}]', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');
INSERT INTO `users` (`id`, `username`, `email`, `password`, `remember_token`, `fullName`, `role`, `role_perm`, `department`, `designation`, `activated`, `studentRollId`, `admission_number`, `admission_date`, `std_category`, `auth_session`, `birthday`, `gender`, `address`, `phoneNo`, `mobileNo`, `studentAcademicYear`, `studentClass`, `studentSection`, `religion`, `parentProfession`, `parentOf`, `photo`, `isLeaderBoard`, `restoreUniqId`, `transport`, `transport_vehicle`, `hostel`, `medical`, `user_position`, `defLang`, `defTheme`, `salary_type`, `salary_base_id`, `comVia`, `father_info`, `mother_info`, `biometric_id`, `library_id`, `account_active`, `customPermissionsType`, `customPermissions`, `firebase_token`, `updated_at`) VALUES
(132, 'hagenes.gerhard', 'maurine94@lakin.com', '$2y$10$DYmw7tznXclcKPZBkeH4neGnvMA/JMD5MWj3R/d4sRy18rsvO1oSm', '', 'Brannon Schowalter', 'parent', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3421782290', '2938295', 0, 4, 50, '', NULL, '[{\"student\":\"Dee Rosenbaum I\",\"relation\":\"father\",\"id\":112}]', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(133, 'edare', 'koepp.eda@gmail.com', '$2y$10$J6kfmlNOyllpUfQGMEktleMJfr9t9CoIK/nrJ3n19h036pZ9Uriyu', '', 'Dr. Danika Quitzon', 'parent', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3565949818', '8012781', 0, 1, 49, '', NULL, '[{\"student\":\"Prof. Alvah Cronin DVM\",\"relation\":\"father\",\"id\":107}]', '07.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(134, 'bdickens', 'little.trycia@okeefe.com', '$2y$10$G2eBdFfkxqd4rk1Ciu2ZKOmBnPRXJP896eE6oIuEVKxVFYmSikxr.', '', 'Magdalen Reichert', 'parent', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2751364689', '9732133', 0, 3, 46, '', NULL, '[{\"student\":\"Deon Kutch MD\",\"relation\":\"father\",\"id\":110}]', '098.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(135, 'dschaefer', 'hubert80@waelchi.com', '$2y$10$Ndpgc/THnLw6sGgG0UD36OyZpYjFGpe2ApEK5gGrIPmGi1jQEFUNi', '', 'Camille Hodkiewicz', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6093087815', '2331716', 0, 2, 15, '', NULL, '[{\"student\":\"Prof. Alvah Cronin DVM\",\"relation\":\"father\",\"id\":107}]', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(136, 'carley.kunde', 'amante@emmerich.org', '$2y$10$mOs.m.gq98Pfcy4r8OKtDeR9M10hxboyvlhcPRHMaUD4u0rF35fyy', '', 'Zetta Considine', 'parent', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7940141445', '9728919', 0, 3, 36, '', NULL, '[{\"student\":\"Dr. Ahmad Hermiston\",\"relation\":\"father\",\"id\":123}]', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(137, 'hudson64', 'terrill32@weimann.net', '$2y$10$igPSENIzGjsc5S8aNyVBOudFxytg0TWUpPs1yQ7xnwOGMKBGkQ9G2', '', 'Prof. Jakob Cassin I', 'parent', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4231393690', '8878199', 0, 3, 17, '', NULL, '[{\"student\":\"Brenden Kautzer\",\"relation\":\"father\",\"id\":115}]', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(138, 'annamarie11', 'bkirlin@roob.com', '$2y$10$FIsRYKSpJE06iVY.QnJZ/uuUZfl2Nq1wJFd584bJRbwl5zWyUiH6u', '', 'Lessie Doyle IV', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6808049331', '9072625', 0, 3, 10, '', NULL, '[{\"student\":\"Lauren Medhurst\",\"relation\":\"father\",\"id\":114}]', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(139, 'ashlynn.hartmann', 'boconnell@yahoo.com', '$2y$10$w3wVzCT4J6R30uvRn0ahu.tgCTtn4qkoC3K/FqtTwMc3sZNpBWzvO', '', 'Wilfredo Olson', 'parent', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3392818658', '7843319', 0, 2, 35, '', NULL, '[{\"student\":\"Mr. Macey Wiza\",\"relation\":\"father\",\"id\":106}]', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(140, 'fbergstrom', 'cmiller@collins.com', '$2y$10$iy53DcqCs7ZrQPOccKP27.WPdsKn1Zp/rmRyD/fRNSr3qbfM//RIu', '', 'Mr. Remington Howe I', 'parent', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1943460613', '5761309', 0, 1, 42, '', NULL, '[{\"student\":\"Darby Douglas\",\"relation\":\"father\",\"id\":108}]', '046.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(141, 'gaylord.schiller', 'vbergstrom@roob.com', '$2y$10$Xg7v5gaSzSiBEXV4WczbxOtIf5FEDY65iMDc27Jd01SUkrlvNxUIi', '', 'Billie Lynch', 'parent', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5715236641', '6657468', 0, 3, 46, '', NULL, '[{\"student\":\"Pasquale Daugherty MD\",\"relation\":\"father\",\"id\":118}]', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(142, 'bernadette.barton', 'wthiel@johns.info', '$2y$10$rqIPqzGRVZZbzDBdKhnOZuBCaMQekCwjbVACxAuvSDmT8V5Zduby6', '', 'Cordie Rippin', 'parent', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7401382823', '8627140', 0, 4, 38, '', NULL, '[{\"student\":\"Dee Rosenbaum I\",\"relation\":\"father\",\"id\":112}]', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(143, 'ryder.huel', 'eduardo02@hotmail.com', '$2y$10$8UhN/A/7sxM41Yt4sac5IOC/.SBkSFLRz99hoMtCgDi61ts58qWVC', '', 'Candida Farrell', 'parent', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3565296233', '4843557', 0, 1, 24, '', NULL, '[{\"student\":\"Mrs. Janis Farrell PhD\",\"relation\":\"father\",\"id\":117}]', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(144, 'antonietta.fritsch', 'keshaun.block@pouros.com', '$2y$10$CQrAw0/57FpnTahfn38N5.9i6lsLNfz5zjHVxUmJqDPrZdbM2P6aG', '', 'Ms. Guadalupe Hane', 'parent', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2509124837', '7302202', 0, 2, 45, '', NULL, '[{\"student\":\"Francesca Spinka\",\"relation\":\"father\",\"id\":119}]', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(145, 'keebler.rusty', 'koelpin.torrey@gmail.com', '$2y$10$reKZ5VvKERrkIxyTpTuv6uEPk/FEMzveXwgpDfHhm/me.l3VkXyiS', '', 'Rigoberto Stracke', 'parent', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4367766853', '8858817', 0, 4, 12, '', NULL, '[{\"student\":\"Leopoldo Bashirian IV\",\"relation\":\"father\",\"id\":116}]', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(146, 'elenora88', 'larson.felix@murazik.com', '$2y$10$EiWtMxV.8QaM2wV.0JAvUeSvj/uVs5fJn.W7hrlLQV30Dq1gijtOu', '', 'Miss Bernice Wisoky', 'parent', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4950326385', '7776529', 0, 2, 36, '', NULL, '[{\"student\":\"Mr. Rafael Schamberger\",\"relation\":\"father\",\"id\":121}]', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(147, 'rosalind43', 'easton.christiansen@hackett.com', '$2y$10$movHB5.FG2bON2TjQmiv4O63V7BPOwozLYy515tLuh6fU6pGWHBlu', '', 'Marvin Hoppe', 'parent', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9114981230', '2179690', 0, 2, 38, '', NULL, '[{\"student\":\"Dr. Ahmad Hermiston\",\"relation\":\"father\",\"id\":123}]', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(148, 'melisa23', 'bayer.rick@hotmail.com', '$2y$10$rQ2KeQkvRED75HpqEa927O/7Q14Q/0lxk67BZGW77LzpeDNNpw4N6', '', 'Giuseppe Hagenes', 'parent', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1474851869', '6827016', 0, 4, 34, '', NULL, '[{\"student\":\"Lauren Medhurst\",\"relation\":\"father\",\"id\":114}]', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(149, 'wthompson', 'herman.doyle@hotmail.com', '$2y$10$H.mZtNqDFIn6BN06nt9fze1yjCZPSOROkP8YCVP50M8El8hmMWq5q', '', 'Hunter Lockman V', 'parent', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4260196768', '8414084', 0, 2, 45, '', NULL, '[{\"student\":\"Miss Jazmyn Purdy Sr.\",\"relation\":\"father\",\"id\":105}]', '077.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(150, 'ttoy', 'bernadette77@yahoo.com', '$2y$10$eXRSSAjNjhVD0YPWyBIxkOhyln0V.cy8EN3qVmazAEU5ZC76xKApq', '', 'Prof. Moriah Durgan MD', 'parent', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1945420168', '1488007', 0, 2, 34, '', NULL, '[{\"student\":\"Francesca Spinka\",\"relation\":\"father\",\"id\":119}]', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(151, 'reichert.tracy', 'salma.wunsch@toy.biz', '$2y$10$GgEwwlIhE6Vg9oo0VYDtjOF3X8euH.qhUbROh0Y/vI9xihdI8v9IW', '', 'Julia Windler', 'parent', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2709044232', '1308894', 0, 3, 49, '', NULL, '[{\"student\":\"Miss Jazmyn Purdy Sr.\",\"relation\":\"father\",\"id\":105}]', '046.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(152, 'chad.shanahan', 'arnoldo.lehner@jenkins.net', '$2y$10$bdqx5Q7Itj7fiCMStRVHye2aGNwHiB5eLkD4ZGh6.O29y7WtOMhtS', '', 'Cheyanne Beier', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6715734247', '8108374', 0, 1, 43, '', NULL, '[{\"student\":\"Dr. Ahmad Hermiston\",\"relation\":\"father\",\"id\":123}]', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(153, 'richie01', 'collier.gregory@yahoo.com', '$2y$10$vIlJCUip17YBCKwSVrrD6OOoMoCkZxpM0Cv0opG4CxrDi5xN9ix2O', '', 'Cristal Witting', 'parent', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1206782926', '4499748', 0, 4, 5, '', NULL, '[{\"student\":\"Darby Douglas\",\"relation\":\"father\",\"id\":108}]', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(154, 'juwan.berge', 'erwin.emard@walsh.net', '$2y$10$yguLCm3hpYUl8wNmb4lFcu86raoFSVjGrg/EY.N.8zKCuuiy7gHke', '', 'Dr. Vernice Orn', 'parent', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7041337278', '2817445', 0, 1, 44, '', NULL, '[{\"student\":\"Leopoldo Bashirian IV\",\"relation\":\"father\",\"id\":116}]', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(155, 'bertha.green', 'harvey.elfrieda@hotmail.com', '$2y$10$T9Ht5OHR/j8Mn2KYXmAwzO9GVOm5bl57EuUVcHReMcZfJcIRa4eMC', '', 'Miss Laisha Bins', 'parent', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7229035925', '1519196', 0, 4, 14, '', NULL, '[{\"student\":\"Mr. Rafael Schamberger\",\"relation\":\"father\",\"id\":121}]', '060.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(156, 'oran28', 'jaquelin.mcglynn@yahoo.com', '$2y$10$7SQZrYoNKEV.BwarE6ia7Oi5MyUEoHwWIRWkfxFrWiNIy8wv6W/p6', '', 'Stacy Schimmel Sr.', 'parent', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7513781309', '2979124', 0, 3, 27, '', NULL, '[{\"student\":\"Darby Douglas\",\"relation\":\"father\",\"id\":108}]', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(157, 'elfrieda18', 'santos.bechtelar@rodriguez.com', '$2y$10$csRz4DhghQKGHT0Hi1fyKe32rKevXDz6L0jJsN/hbLa7njo/fztaq', '', 'Mr. Giovani Ferry I', 'parent', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6855666398', '4866939', 0, 4, 37, '', NULL, '[{\"student\":\"Prof. Alvah Cronin DVM\",\"relation\":\"father\",\"id\":107}]', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(158, 'ellsworth27', 'olangosh@koelpin.com', '$2y$10$9us6RnGo8mIX1Zvo.jZkcONQ/U7RL6YoPSM.7Z/QLeTsU86W0uoJS', '', 'Arlo Parisian', 'parent', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5000152276', '3417235', 0, 4, 12, '', NULL, '[{\"student\":\"Cortney Batz\",\"relation\":\"father\",\"id\":122}]', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(159, 'carli31', 'elton.weissnat@wilderman.info', '$2y$10$hyQfGcSIXDp17pXVnU03FOrx769zZWdZm/uHljlrRN1a8Q5XEMASW', '', 'Ofelia Berge', 'parent', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8220215754', '5642756', 0, 1, 1, '', NULL, '[{\"student\":\"Miss Jazmyn Purdy Sr.\",\"relation\":\"father\",\"id\":105}]', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(160, 'colin31', 'berge.edyth@gmail.com', '$2y$10$8gqilV9mOqDsBEE160ZANua4WJeZ46s3fejzs62eeKFesGPqIv9Im', '', 'Andrew Rempel', 'parent', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5424002591', '5811524', 0, 4, 17, '', NULL, '[{\"student\":\"Prof. Alvah Cronin DVM\",\"relation\":\"father\",\"id\":107}]', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(161, 'buck29', 'darron41@yahoo.com', '$2y$10$o8gTQ6XWD678DHJbjd89NOFy9aYGQiVUazIEDN/yUuj0tfNb714Iq', '', 'Keshawn Hill', 'parent', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2721317377', '8388320', 0, 3, 47, '', NULL, '[{\"student\":\"Deon Kutch MD\",\"relation\":\"father\",\"id\":110}]', '097.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(162, 'marlen.cassin', 'kcarter@gmail.com', '$2y$10$w4FQFe0jzUm7gA3dtEjmp.6w3JnklVsc8gEj/AKT/9PHkQUrjZfoW', '', 'Ms. Agnes Hegmann V', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7148433999', '6326208', 0, 3, 31, '', NULL, '[{\"student\":\"Francesca Spinka\",\"relation\":\"father\",\"id\":119}]', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(163, 'welch.norberto', 'imante@gmail.com', '$2y$10$sXyGQ2DxGlu0D4YGZUjxYOqEJawLuCKnF2ioZV0v2xdRB.nPKeEgG', '', 'Kellen Feil', 'parent', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3410240863', '5737214', 0, 4, 50, '', NULL, '[{\"student\":\"Mrs. Janis Farrell PhD\",\"relation\":\"father\",\"id\":117}]', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(164, 'dayne.dicki', 'carmelo70@wilkinson.org', '$2y$10$mt9fpPiHBt3dLzf/RygLxemxMoKHNrE6WQR5q.rHvapj5JUw4kIu6', '', 'Modesto Huel', 'parent', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7209879842', '8588173', 0, 1, 4, '', NULL, '[{\"student\":\"Prof. Kody DuBuque\",\"relation\":\"father\",\"id\":120}]', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(165, 'towne.marcellus', 'arely.kemmer@hotmail.com', '$2y$10$elDHTagnQip0vlWWSVayiODXz.WFE3SCwWd7R3vfAEo3qlFnTfSOm', '', 'Graham DuBuque', 'parent', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8822144677', '7903264', 0, 2, 28, '', NULL, '[{\"student\":\"Mrs. Janis Farrell PhD\",\"relation\":\"father\",\"id\":117}]', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(166, 'shields.keyon', 'opredovic@romaguera.com', '$2y$10$ED5HNJVHaUN8nSoikmO8EuSdBcrGL4WbE2LO.9xuOvdb252B43tQ2', '', 'Hassie Kilback', 'parent', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6946781853', '7889703', 0, 2, 25, '', NULL, '[{\"student\":\"Mrs. Janis Farrell PhD\",\"relation\":\"father\",\"id\":117}]', '029.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(167, 'maurine.lind', 'hyatt.jaclyn@kuhlman.com', '$2y$10$RdDGRuV0xVopuRrQ2w.ZuOinkneLJ9.lVsaesgrB1eG/W/bzXUW7W', '', 'Dr. Curtis Berge', 'parent', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7819972760', '5990858', 0, 1, 29, '', NULL, '[{\"student\":\"Mr. Rafael Schamberger\",\"relation\":\"father\",\"id\":121}]', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(168, 'sipes.madelyn', 'danyka69@hotmail.com', '$2y$10$RKtUgGYWhZiMzPa8P4RGVO3vD0tOoQKECwLC6WW6iXA6KZ6uN5I5e', '', 'Dario Swaniawski DVM', 'parent', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7225738750', '7382193', 0, 4, 3, '', NULL, '[{\"student\":\"Meghan Hagenes\",\"relation\":\"father\",\"id\":113}]', '010.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(169, 'milo43', 'katrine.fahey@huel.info', '$2y$10$4P2Od7oMC7Vh2tmuf.J/lu/LxREKjRmRjRx//zGKy0nK7SrSd.sLG', '', 'Jewel Gleason', 'parent', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5315347262', '2245798', 0, 3, 41, '', NULL, '[{\"student\":\"Meghan Hagenes\",\"relation\":\"father\",\"id\":113}]', '086.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(170, 'audie83', 'tkassulke@yahoo.com', '$2y$10$jOZk6HESLv8KguGWRXIJEemA6UZfVYnt51nYMtQI3XMGUn66i9ere', '', 'Dr. Naomi Macejkovic V', 'parent', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4263531796', '8860136', 0, 2, 21, '', NULL, '[{\"student\":\"Mr. Macey Wiza\",\"relation\":\"father\",\"id\":106}]', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(171, 'tsmitham', 'stella94@waters.org', '$2y$10$yMBTmV3t4N0H4uKUmXYoguMYlhbsQjtxMjRLWim/V19n.IKPXYxo6', '', 'Forest Kertzmann', 'parent', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6626285498', '7262101', 0, 1, 30, '', NULL, '[{\"student\":\"Prof. Kody DuBuque\",\"relation\":\"father\",\"id\":120}]', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(172, 'zoila74', 'emard.vern@schuster.com', '$2y$10$k9JQzJemjXBCHhGnOrVnOev7eLe0rW6tBbSKfa5tjsEl0sNbtNTCO', '', 'Reilly Lang MD', 'parent', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8964623654', '6753590', 0, 4, 12, '', NULL, '[{\"student\":\"Leopoldo Bashirian IV\",\"relation\":\"father\",\"id\":116}]', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(173, 'emerald23', 'sawayn.dortha@yahoo.com', '$2y$10$n4aWY1EKZt/69SqLDK2wOuNWAJT5yy1srSTeo6oKKIGNMKzTpXJfq', '', 'Hilbert Pollich', 'parent', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9553325465', '1976720', 0, 2, 8, '', NULL, '[{\"student\":\"Dr. Ahmad Hermiston\",\"relation\":\"father\",\"id\":123}]', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(174, 'zbarton', 'laurence.kihn@kihn.com', '$2y$10$H7Tcjmx1H9egn/Uo.5KDsucHf.bzrby1aLV4vjlxEXZH2tMwrVuIK', '', 'Dr. Mathew Oberbrunner Jr.', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2635869127', '2237302', 0, 3, 38, '', NULL, '[{\"student\":\"Dee Rosenbaum I\",\"relation\":\"father\",\"id\":112}]', '021.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(175, 'dave.gleichner', 'beulah.gutmann@gmail.com', '$2y$10$qzY3jMXWPqa2OPAGvaoVSubk6U3qpiV/0byppMvUsIxD3MKspb.ce', '', 'Lottie West DVM', 'parent', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6229921530', '7917057', 0, 3, 26, '', NULL, '[{\"student\":\"Francesca Spinka\",\"relation\":\"father\",\"id\":119}]', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(176, 'justen.kautzer', 'gnader@gmail.com', '$2y$10$ZBQaSk8LwejmNKpMzXmnpul/PejfpDc8FEhDmdWcMC.5gn4JAZ3ky', '', 'Kale Bernhard', 'parent', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5647795364', '8925736', 0, 2, 29, '', NULL, '[{\"student\":\"Rogelio Yundt\",\"relation\":\"father\",\"id\":125}]', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5051;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=651;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;
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
