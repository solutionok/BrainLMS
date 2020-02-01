-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2019 at 10:21 AM
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
(1, 'Class 1', 'Dr. Angela Dickinson', 1, '', 1),
(2, 'Class 2', 'Ms. Karen Hoppe II', 2, '', 1),
(3, 'Class 3', 'Alfred Moore', 1, '', 4),
(4, 'Class 4', 'Pascale Kuphal', 2, '', 2);

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
(1, 'Distinctio ad autem.', 'Consequatur velit est enim quia dicta ut itaque magnam est et voluptas recusandae sapiente.', 'students', 'omnis', '', 0, '1563265193'),
(2, 'Nihil quas culpa.', 'Rerum ipsam suscipit quam.', 'teacher', 'vero', '', 0, '1563265193'),
(3, 'Qui animi illo animi.', 'Provident provident quo culpa similique recusandae soluta.', 'teacher', 'officiis', '', 1, '1563265193'),
(4, 'Quam voluptates voluptate.', 'Dolorem cupiditate placeat quas eaque ullam rerum non.', 'all', 'doloribus', '', 0, '1563265193'),
(5, 'Nostrum quo.', 'Repudiandae aliquid qui aspernatur dolor eius omnis nostrum eius dolorum et modi.', 'students', 'ipsum', '', 1, '1563265193'),
(6, 'Et quisquam assumenda sunt.', 'Enim omnis vel quia qui omnis ducimus ut dolor maxime.', 'all', 'doloribus', '', 1, '1563265193'),
(7, 'Harum optio odio dignissimos.', 'Rerum est rerum atque nemo quo ipsum ut fugiat quos ratione est et aut molestiae est distinctio.', 'parents', 'rem', '', 0, '1563265193'),
(8, 'Aut neque.', 'Et similique atque nobis ratione non enim quis aut.', 'parents', 'ut', '', 1, '1563265193'),
(9, 'Sit culpa molestias.', 'Blanditiis nemo sed odio quam error et sit quasi esse dolores.', 'parents', 'aut', '', 0, '1563265193'),
(10, 'Laborum soluta sequi voluptas fugit eaque.', 'Sint consequuntur et quia vero perferendis sit.', 'all', 'enim', '', 0, '1563265193'),
(11, 'Rerum eius architecto iste expedita.', 'Illum magnam odio cum laborum ullam et.', 'all', 'officia', '', 0, '1563265193'),
(12, 'Illum aut perspiciatis.', 'Laboriosam aut itaque exercitationem ut aut deleniti animi laborum quasi.', 'students', 'odit', '', 0, '1563265193'),
(13, 'Officia aut qui aliquam magnam.', 'Deserunt cum rerum facere et pariatur perspiciatis natus vitae.', 'all', 'quasi', '', 1, '1563265193'),
(14, 'Numquam quibusdam quam rerum.', 'Saepe quibusdam illo perspiciatis iure assumenda iste iure reiciendis assumenda.', 'all', 'laboriosam', '', 1, '1563265193'),
(15, 'Corporis est rerum.', 'Quaerat a deserunt sint minus.', 'all', 'dolorum', '', 1, '1563265193'),
(16, 'Nihil natus hic.', 'Doloribus consequatur non et ut qui exercitationem.', 'parents', 'quo', '', 0, '1563265193'),
(17, 'Cumque natus voluptate.', 'Quidem in cum non expedita dolor explicabo voluptates iste.', 'teacher', 'ipsum', '', 0, '1563265193'),
(18, 'Amet et velit.', 'Exercitationem maxime dolor neque beatae dignissimos possimus reiciendis quo veritatis qui quo voluptatem similique.', 'all', 'voluptatem', '', 1, '1563265193'),
(19, 'Culpa facere ea enim.', 'Neque voluptatem voluptatem aut qui rerum et.', 'students', 'accusamus', '', 0, '1563265193'),
(20, 'Cupiditate qui autem saepe repellendus.', 'Et aut maxime tenetur quia voluptate non qui qui.', 'students', 'tenetur', '', 1, '1563265193'),
(21, 'Dolorem omnis aut quis.', 'Rerum blanditiis sapiente exercitationem consequatur molestiae optio sunt qui.', 'parents', 'blanditiis', '', 0, '1563265193'),
(22, 'Cupiditate odit molestiae.', 'Sed placeat veritatis nesciunt quibusdam reiciendis tempore.', 'all', 'vel', '', 0, '1563265193'),
(23, 'Sit id.', 'Id debitis atque pariatur modi consequatur aut.', 'parents', 'ea', '', 1, '1563265193'),
(24, 'Sit eos dolor explicabo nesciunt nihil.', 'Et aspernatur nihil voluptas ad eligendi natus.', 'parents', 'quibusdam', '', 1, '1563265193'),
(25, 'Quaerat eum qui.', 'Tenetur qui eius sed nulla.', 'students', 'officia', '', 0, '1563265193'),
(26, 'Magnam cum molestiae.', 'Quas sed velit laborum minus ipsam cumque odit fugiat quia enim quia consequatur minus officia.', 'teacher', 'quidem', '', 0, '1563265193'),
(27, 'Pariatur consectetur ad.', 'Voluptatem debitis non et modi.', 'students', 'explicabo', '', 0, '1563265193'),
(28, 'Sunt ut voluptas impedit doloribus voluptatum.', 'Iste reprehenderit nisi similique aut ut est.', 'parents', 'non', '', 0, '1563265193'),
(29, 'Quia cupiditate voluptate expedita veniam eligendi.', 'Commodi rerum maxime sit praesentium mollitia.', 'all', 'cumque', '', 0, '1563265193'),
(30, 'Est eius molestias.', 'Necessitatibus alias nisi ab praesentium.', 'all', 'dolorem', '', 0, '1563265193'),
(31, 'Quidem necessitatibus.', 'Quia cupiditate maiores et sed maxime in sit expedita doloribus quas natus et ipsum quod.', 'students', 'facilis', '', 1, '1563265193'),
(32, 'Qui laborum nulla.', 'Suscipit et qui aut excepturi quod saepe quasi voluptas tenetur facilis.', 'teacher', 'ipsum', '', 0, '1563265193'),
(33, 'Aut quisquam voluptatem omnis quae.', 'Quos voluptate in recusandae exercitationem sed accusantium dolor sapiente.', 'parents', 'non', '', 1, '1563265193'),
(34, 'Iure aut nihil.', 'Eum repellendus possimus magni quidem commodi.', 'parents', 'dolore', '', 1, '1563265193'),
(35, 'Quasi et et temporibus itaque.', 'Molestiae molestiae vitae similique doloribus voluptate eveniet a voluptatibus.', 'parents', 'voluptas', '', 0, '1563265193'),
(36, 'Rerum voluptate.', 'Maxime repudiandae corrupti ratione quisquam repellendus sint ea illum impedit aut quod.', 'all', 'ratione', '', 0, '1563265193'),
(37, 'Expedita fugit.', 'Omnis tempore doloribus enim repudiandae esse omnis quia error officia qui itaque reiciendis temporibus ullam.', 'all', 'praesentium', '', 1, '1563265193'),
(38, 'Voluptate consequuntur est et.', 'Voluptatem aut sed autem laudantium minima qui nisi molestias velit atque suscipit nisi enim.', 'all', 'impedit', '', 0, '1563265193'),
(39, 'Fugit cupiditate qui.', 'Eos est aut beatae enim atque eos et.', 'all', 'nemo', '', 0, '1563265193'),
(40, 'Harum aspernatur.', 'Libero est sunt corrupti quo eos veritatis velit cupiditate architecto.', 'parents', 'odit', '', 1, '1563265193'),
(41, 'Asperiores nemo id.', 'Harum et architecto ducimus similique commodi facilis.', 'parents', 'quibusdam', '', 1, '1563265193'),
(42, 'Eius quo fugiat molestiae et.', 'Tempore distinctio animi quasi aut libero dolorum rem ea esse.', 'teacher', 'cumque', '', 1, '1563265193'),
(43, 'Qui quia eveniet et.', 'Veritatis voluptatibus impedit qui nemo sed sit dolorem impedit.', 'parents', 'eum', '', 0, '1563265193'),
(44, 'Dolorem soluta nihil est aut.', 'Voluptates consequatur assumenda magnam ratione ea eligendi rerum magnam id.', 'students', 'beatae', '', 1, '1563265193'),
(45, 'Occaecati aspernatur.', 'Quo maxime consequatur itaque quae pariatur nam occaecati ipsum alias.', 'parents', 'incidunt', '', 0, '1563265193'),
(46, 'Officiis aperiam maiores asperiores.', 'Saepe maxime doloribus sint qui architecto voluptas sed omnis consequatur qui magni sint et sit.', 'teacher', 'atque', '', 0, '1563265193'),
(47, 'Possimus sunt dolores dignissimos deleniti.', 'Possimus id temporibus vel omnis repellat voluptatum eaque.', 'parents', 'deleniti', '', 1, '1563265193'),
(48, 'Quia aliquid facilis in id.', 'Esse deleniti inventore maiores voluptate veniam vel.', 'students', 'aliquid', '', 1, '1563265193'),
(49, 'Sit autem ut maxime.', 'Quia sit est cumque cumque corporis quaerat modi.', 'students', 'similique', '', 0, '1563265193'),
(50, 'Excepturi tempora laudantium aut veritatis deserunt.', 'Molestiae necessitatibus et vel est qui ex asperiores magnam voluptates vitae porro est autem.', 'all', 'voluptatibus', '', 1, '1563265193');

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
(1, 'Prof. Lukas Hettinger', 'cumque', 'Et in repellendus rerum aut.', '1563265194', 'Catalina McCullough'),
(2, 'Jonathon Rice', 'velit', 'Cumque modi libero.', '1563265194', 'Jeanne Lakin'),
(3, 'Jerry Runolfsdottir', 'aliquid', 'Rem sequi consequatur nesciunt nesciunt placeat magnam.', '1563265194', 'Johnpaul Langworth'),
(4, 'Cassandra D\'Amore', 'placeat', 'Natus magni tempora esse adipisci quas iste voluptas.', '1563265194', 'Mrs. Catherine Herman'),
(5, 'Letha Anderson MD', 'consequatur', 'Delectus est adipisci modi cupiditate sit minus quisquam.', '1563265194', 'Keyshawn Zieme'),
(6, 'Eunice Predovic', 'enim', 'Vel non unde quibusdam qui.', '1563265194', 'Roberto Dickinson'),
(7, 'Elinore Hamill', 'ducimus', 'Molestias aliquid perspiciatis dicta voluptatem expedita minus fugit et.', '1563265194', 'Trystan Cronin'),
(8, 'Hollis Marquardt', 'ea', 'Omnis sit labore ut qui expedita.', '1563265194', 'Prof. Annie Streich Sr.'),
(9, 'Sandra Denesik', 'ullam', 'Sequi quia quas.', '1563265194', 'Kolby Kunde'),
(10, 'Macy Koch', 'illo', 'Ad at est autem molestiae.', '1563265194', 'Dr. Clarissa O\'Conner'),
(11, 'Presley Nienow', 'sint', 'Voluptatem et excepturi aperiam minima ut et.', '1563265194', 'Prof. Shad O\'Keefe'),
(12, 'Marlen Stehr', 'qui', 'Est mollitia nesciunt reiciendis neque.', '1563265194', 'Cathrine Bogisich'),
(13, 'Prof. Glenna Harber PhD', 'quod', 'Iste ab asperiores saepe vel vitae.', '1563265194', 'Gustave Thompson'),
(14, 'Kelly Kunde', 'est', 'Sit sit animi aut consectetur quod non et ipsam odio.', '1563265194', 'Tomas Crist'),
(15, 'Antonina Ondricka', 'magni', 'Sint consequatur ea omnis doloribus.', '1563265194', 'Dr. Aurelio Swaniawski DVM'),
(16, 'Dewayne Emard', 'quod', 'Provident labore rerum aut voluptate.', '1563265194', 'Rick Gleichner'),
(17, 'Mathilde Reichel', 'ex', 'Eum labore et non et optio quas.', '1563265194', 'Margarette Sawayn'),
(18, 'Larry Predovic III', 'quis', 'Ut nihil consectetur eos illum.', '1563265194', 'Garret Mohr'),
(19, 'Prof. Mattie Kuvalis', 'nihil', 'Numquam non voluptatem et atque rerum aut eum blanditiis eaque.', '1563265194', 'Lauryn Brown'),
(20, 'Mustafa Schroeder MD', 'modi', 'Impedit deleniti aut quia qui ratione quis minima veritatis quos velit.', '1563265194', 'Noemie Gusikowski'),
(21, 'Janessa Fadel', 'illum', 'Voluptas minima et vel cumque necessitatibus et.', '1563265194', 'Shane Zulauf'),
(22, 'Hermina Wisoky', 'omnis', 'Laborum aut rerum et.', '1563265194', 'Reba Kshlerin'),
(23, 'Pat Becker', 'et', 'Quis voluptatem voluptas dolores consequuntur omnis.', '1563265194', 'Jana Mueller II'),
(24, 'Prof. Hazle Donnelly', 'eveniet', 'Error rem in soluta nostrum aspernatur labore qui dolorem.', '1563265194', 'Gabrielle Frami'),
(25, 'Jean Marks I', 'quasi', 'Beatae hic rerum quia officiis quis ipsum molestias ut.', '1563265194', 'Rosalind Schowalter'),
(26, 'Kenny Bruen', 'est', 'Aliquid aut exercitationem delectus aliquam dicta id magni ut.', '1563265194', 'Cooper Graham'),
(27, 'Clinton Reilly', 'sed', 'Quae occaecati omnis quo ut sint in.', '1563265194', 'Karianne Gorczany'),
(28, 'Archibald Muller', 'consequuntur', 'Commodi provident quis iusto molestiae ullam quo aliquid.', '1563265194', 'Emelia Swift PhD'),
(29, 'Cody Torphy', 'esse', 'Accusantium at officiis ducimus.', '1563265194', 'Mrs. Kallie Kulas'),
(30, 'Brooks Vandervort', 'consequatur', 'Sit natus quaerat aut eius dolores.', '1563265194', 'Izaiah Jast'),
(31, 'Mr. Kayden Schimmel', 'amet', 'Cum asperiores nam assumenda vel aut rem.', '1563265194', 'Justina Torphy'),
(32, 'Zakary Harvey', 'et', 'Esse ea est magnam iusto exercitationem minus.', '1563265194', 'Lexus Dooley'),
(33, 'Brenna Fritsch', 'esse', 'Aut voluptatum accusamus quam modi veritatis omnis impedit.', '1563265194', 'Prof. Enoch Balistreri'),
(34, 'Grover Mayert', 'ea', 'Sint quo in sit ipsum delectus.', '1563265194', 'Abdiel Pagac'),
(35, 'Birdie Ratke', 'aut', 'Dolorem aperiam est eos eaque mollitia.', '1563265194', 'Norberto Sawayn'),
(36, 'Edyth Weissnat V', 'quaerat', 'Nihil sunt vero perspiciatis exercitationem.', '1563265194', 'Damaris Streich'),
(37, 'May Rogahn', 'nobis', 'Itaque ut similique accusamus modi accusantium autem fugit.', '1563265194', 'Eva Bradtke'),
(38, 'Lucas Grant', 'quam', 'Est doloribus blanditiis esse voluptatem unde adipisci.', '1563265194', 'Mr. Roel Tillman PhD'),
(39, 'Corbin Schultz', 'a', 'Quia ut quibusdam est.', '1563265194', 'Dr. Lempi Macejkovic'),
(40, 'Vidal Klocko', 'eos', 'Est non adipisci.', '1563265194', 'Rubie Johns IV'),
(41, 'Reese Wintheiser', 'eaque', 'Et ullam sapiente nemo.', '1563265194', 'Ubaldo Rodriguez'),
(42, 'Toney Upton', 'repellendus', 'Nisi aliquid voluptas quibusdam fuga vel et.', '1563265194', 'Sienna Cassin'),
(43, 'Gilda Balistreri Sr.', 'quo', 'Esse veritatis aperiam cumque quidem et.', '1563265194', 'Sally Ullrich'),
(44, 'Adolf Nikolaus I', 'iste', 'Eius voluptatem autem amet rerum ducimus et dolor eius ut distinctio.', '1563265194', 'Mrs. Annabell West I'),
(45, 'Violette Koepp', 'consequatur', 'Nam sunt magni minima ex minus consequatur hic quis.', '1563265194', 'Beulah Stark'),
(46, 'Lew Pollich II', 'expedita', 'Est qui nisi tenetur aut.', '1563265194', 'Dr. Enos Tillman'),
(47, 'Carmen Williamson DVM', 'dolorem', 'Rerum sunt voluptas.', '1563265194', 'Delpha Corkery'),
(48, 'Mr. Simeon White', 'mollitia', 'Aliquam recusandae beatae deleniti corrupti sed.', '1563265194', 'Golden Weissnat V'),
(49, 'Chad Osinski', 'facere', 'Modi consequatur pariatur doloribus qui nobis quasi.', '1563265194', 'Jade Stanton DVM'),
(50, 'Damian Schimmel', 'harum', 'Ea dignissimos non labore iusto ut.', '1563265194', 'Marcelle Little');

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
(1, 4779, 184, 4, 152, 'Doloribus architecto deleniti.', '1563265195', 0),
(2, 4574, 57, 47, 132, 'Quia facere quibusdam quos.', '1563265195', 1),
(3, 1707, 92, 195, 64, 'Est vitae rerum.', '1563265195', 0),
(4, 7300, 26, 112, 72, 'Ut incidunt corrupti.', '1563265195', 1),
(5, 4984, 26, 130, 51, 'Impedit repellendus.', '1563265195', 0),
(6, 3518, 149, 181, 188, 'Saepe.', '1563265195', 0),
(7, 1378, 157, 146, 104, 'Est officiis facilis.', '1563265195', 0),
(8, 8227, 140, 98, 92, 'Cumque rerum.', '1563265195', 0),
(9, 4755, 175, 151, 123, 'Sequi fugiat.', '1563265195', 1),
(10, 336, 170, 139, 145, 'Quo ab placeat porro doloribus.', '1563265195', 1),
(11, 5928, 126, 152, 65, 'Illum nam ab numquam.', '1563265195', 1),
(12, 2010, 16, 144, 4, 'Debitis corporis doloremque distinctio.', '1563265195', 1),
(13, 2579, 73, 95, 57, 'Nobis ipsum.', '1563265195', 0),
(14, 8031, 193, 165, 34, 'Et eum soluta voluptate.', '1563265195', 1),
(15, 1225, 88, 83, 66, 'Est.', '1563265195', 0),
(16, 6535, 186, 90, 183, 'Ut eligendi animi est enim.', '1563265195', 0),
(17, 1843, 153, 181, 92, 'Ipsa iusto et.', '1563265195', 0),
(18, 4474, 83, 14, 28, 'Rem.', '1563265195', 1),
(19, 5405, 32, 16, 71, 'Molestiae voluptas.', '1563265195', 1),
(20, 63, 151, 60, 132, 'Distinctio autem laboriosam.', '1563265195', 1),
(21, 7526, 75, 145, 14, 'Earum odio minima saepe.', '1563265195', 0),
(22, 5683, 12, 130, 169, 'Ratione atque quo.', '1563265195', 0),
(23, 9234, 66, 137, 95, 'Dolor id culpa.', '1563265195', 0),
(24, 5021, 120, 190, 148, 'Dolores recusandae.', '1563265195', 1),
(25, 2309, 21, 150, 174, 'Asperiores architecto harum.', '1563265195', 0),
(26, 7610, 13, 156, 140, 'Laboriosam.', '1563265195', 1),
(27, 3608, 43, 163, 172, 'Voluptatem suscipit nisi enim.', '1563265195', 1),
(28, 5972, 62, 152, 192, 'Nostrum aut.', '1563265195', 0),
(29, 4196, 35, 176, 111, 'Animi quia nostrum.', '1563265195', 1),
(30, 971, 149, 95, 56, 'Dolores dolorem.', '1563265195', 1),
(31, 5660, 155, 155, 56, 'Molestiae fugiat quos est.', '1563265195', 1),
(32, 3992, 114, 104, 185, 'Dignissimos labore.', '1563265195', 0),
(33, 5705, 85, 177, 148, 'Enim excepturi.', '1563265195', 0),
(34, 4029, 186, 16, 161, 'Repellat in voluptatem architecto.', '1563265195', 0),
(35, 4960, 87, 13, 62, 'Distinctio quia itaque.', '1563265195', 0),
(36, 534, 7, 88, 14, 'Tempora aut sint aut ut.', '1563265195', 1),
(37, 9505, 201, 141, 199, 'Ut fugit.', '1563265195', 0),
(38, 3852, 140, 21, 155, 'Quas porro sunt error aut eaque.', '1563265195', 1),
(39, 8582, 137, 31, 56, 'Est ipsam sequi.', '1563265195', 0),
(40, 7646, 95, 96, 25, 'Saepe dolorem aliquid.', '1563265195', 1),
(41, 1013, 5, 177, 49, 'Exercitationem delectus.', '1563265195', 0),
(42, 5564, 91, 182, 114, 'Illum delectus odio maxime.', '1563265195', 0),
(43, 1057, 108, 167, 57, 'Mollitia eos dolores odio.', '1563265195', 1),
(44, 5639, 191, 156, 41, 'Totam quia.', '1563265195', 0),
(45, 9452, 117, 61, 177, 'Animi sit.', '1563265195', 1),
(46, 9763, 194, 85, 187, 'Porro doloremque et et.', '1563265195', 1),
(47, 3393, 163, 7, 56, 'Praesentium aut.', '1563265195', 1),
(48, 3074, 63, 161, 94, 'Et laborum non nihil.', '1563265195', 1),
(49, 2770, 48, 9, 91, 'Amet et voluptas qui.', '1563265195', 0),
(50, 1908, 46, 115, 24, 'Id et consequatur.', '1563265195', 0),
(51, 647, 72, 94, 158, 'Id.', '1563265195', 1),
(52, 1594, 40, 79, 200, 'Similique rerum.', '1563265195', 1),
(53, 5826, 135, 86, 175, 'Occaecati quis ratione voluptates.', '1563265195', 1),
(54, 8023, 45, 144, 19, 'Nemo eum.', '1563265195', 1),
(55, 5608, 52, 151, 133, 'Magnam enim consequuntur.', '1563265195', 1),
(56, 807, 12, 139, 186, 'Nemo eum veritatis.', '1563265195', 0),
(57, 7757, 79, 4, 106, 'Repudiandae illum adipisci.', '1563265195', 1),
(58, 1307, 93, 110, 45, 'Nisi magnam placeat.', '1563265195', 0),
(59, 478, 185, 153, 7, 'Voluptatum ipsum dolores quo nisi.', '1563265195', 0),
(60, 3504, 198, 50, 59, 'Et officiis occaecati eligendi.', '1563265195', 1),
(61, 7220, 84, 87, 21, 'Autem autem quam dolore.', '1563265195', 1),
(62, 9186, 155, 119, 184, 'Aliquam ullam explicabo.', '1563265195', 1),
(63, 8586, 95, 17, 47, 'Eos odit earum.', '1563265195', 0),
(64, 4792, 34, 148, 162, 'Amet ex rem veniam.', '1563265195', 0),
(65, 7722, 87, 148, 37, 'Sint neque officiis non.', '1563265195', 1),
(66, 326, 160, 92, 110, 'Nihil cum.', '1563265195', 1),
(67, 1220, 145, 122, 108, 'Est cupiditate voluptatem fugiat.', '1563265195', 1),
(68, 5397, 120, 88, 185, 'Vel rerum odit.', '1563265195', 0),
(69, 4965, 153, 181, 194, 'Et sequi aperiam blanditiis illum.', '1563265195', 0),
(70, 9210, 102, 80, 158, 'Quod unde.', '1563265195', 1),
(71, 2163, 168, 163, 158, 'Autem rerum.', '1563265195', 0),
(72, 457, 175, 196, 200, 'Perferendis eum facilis id officia ut.', '1563265195', 0),
(73, 3833, 8, 10, 20, 'Veritatis quo.', '1563265195', 0),
(74, 8215, 158, 76, 11, 'Earum et aut.', '1563265195', 0),
(75, 3698, 156, 6, 29, 'Et veritatis velit.', '1563265195', 0),
(76, 6442, 183, 36, 36, 'Nihil.', '1563265195', 0),
(77, 4994, 67, 39, 148, 'Qui odit.', '1563265195', 1),
(78, 4583, 115, 8, 150, 'Possimus.', '1563265195', 1),
(79, 8251, 165, 93, 119, 'Ad quibusdam.', '1563265195', 1),
(80, 7, 61, 56, 201, 'Est sit nisi.', '1563265196', 1),
(81, 3239, 145, 51, 3, 'Nemo qui qui.', '1563265196', 1),
(82, 5882, 15, 20, 189, 'Ad et.', '1563265196', 0),
(83, 5018, 146, 86, 203, 'Sequi.', '1563265196', 1),
(84, 9455, 72, 149, 49, 'Ut fugiat.', '1563265196', 1),
(85, 6348, 6, 32, 43, 'Error laboriosam nulla.', '1563265196', 1),
(86, 2397, 73, 187, 107, 'Sequi aliquam ipsa quidem.', '1563265196', 0),
(87, 1031, 203, 125, 57, 'Quidem.', '1563265196', 1),
(88, 4131, 122, 99, 76, 'Nostrum quam est.', '1563265196', 1),
(89, 4035, 49, 20, 69, 'Iure aut.', '1563265196', 0),
(90, 1048, 148, 15, 75, 'Dolore ipsa.', '1563265196', 1),
(91, 3173, 96, 87, 21, 'Non culpa id.', '1563265196', 1),
(92, 1191, 26, 83, 87, 'Dolorem.', '1563265196', 1),
(93, 4011, 106, 174, 147, 'Et repellat atque nulla.', '1563265196', 0),
(94, 4543, 57, 170, 5, 'Cum.', '1563265196', 1),
(95, 8679, 72, 129, 166, 'Ut consequatur dolores ut qui.', '1563265196', 0),
(96, 1203, 117, 61, 71, 'Nesciunt.', '1563265196', 1),
(97, 3901, 48, 61, 143, 'Iste et ut.', '1563265196', 0),
(98, 2591, 145, 125, 127, 'Quam consequuntur optio.', '1563265196', 0),
(99, 8897, 37, 67, 102, 'Fugiat quis laborum reiciendis perspiciatis.', '1563265196', 0),
(100, 8970, 198, 128, 7, 'Quod praesentium.', '1563265196', 1),
(101, 1528, 33, 6, 188, 'Ipsum.', '1563265196', 0),
(102, 4685, 61, 117, 80, 'Dolorem quidem sit quia.', '1563265196', 1),
(103, 3657, 185, 90, 134, 'Sequi quasi officiis.', '1563265196', 1),
(104, 9458, 6, 55, 81, 'Sint voluptas.', '1563265196', 1),
(105, 8373, 75, 157, 42, 'Laboriosam ut.', '1563265196', 0),
(106, 7573, 46, 146, 23, 'Animi unde ipsum.', '1563265196', 1),
(107, 2005, 183, 152, 99, 'Temporibus aut.', '1563265196', 1),
(108, 7704, 62, 152, 89, 'Sequi.', '1563265196', 0),
(109, 3629, 33, 170, 118, 'Repellendus maiores.', '1563265196', 0),
(110, 7224, 71, 164, 199, 'Et minima.', '1563265196', 0),
(111, 2490, 104, 44, 50, 'Quia sunt dolor.', '1563265196', 1),
(112, 3034, 63, 2, 54, 'Mollitia.', '1563265196', 0),
(113, 9278, 43, 194, 110, 'Voluptates aut animi perspiciatis.', '1563265196', 0),
(114, 2573, 131, 203, 188, 'Odio distinctio totam.', '1563265196', 0),
(115, 1588, 3, 84, 149, 'Aut beatae.', '1563265196', 1),
(116, 9590, 158, 14, 44, 'Occaecati.', '1563265196', 1),
(117, 9999, 65, 190, 99, 'Nemo rem vero aut quia commodi.', '1563265196', 0),
(118, 9273, 43, 162, 68, 'Natus iusto est quae aut.', '1563265196', 1),
(119, 4122, 195, 54, 161, 'Ea est et.', '1563265196', 0),
(120, 5010, 182, 169, 47, 'Autem vel.', '1563265196', 1),
(121, 685, 137, 120, 69, 'Ipsam illum.', '1563265196', 1),
(122, 2064, 78, 25, 141, 'Doloribus quas hic maxime.', '1563265196', 1),
(123, 3943, 92, 9, 29, 'Consequatur quia quos quae.', '1563265196', 1),
(124, 4897, 120, 79, 102, 'Aliquam et quia.', '1563265196', 1),
(125, 2494, 25, 78, 133, 'Et non.', '1563265196', 0),
(126, 7580, 7, 184, 62, 'Voluptas delectus error.', '1563265196', 1),
(127, 6044, 188, 58, 171, 'Rerum vel nisi.', '1563265196', 1),
(128, 2615, 78, 60, 116, 'Non magni et.', '1563265196', 0),
(129, 1698, 105, 95, 69, 'Placeat officiis.', '1563265196', 0),
(130, 3790, 198, 84, 27, 'Nam aperiam possimus.', '1563265196', 1),
(131, 2638, 49, 8, 32, 'Accusantium ipsa.', '1563265196', 0),
(132, 2995, 68, 185, 142, 'Architecto aperiam tempore.', '1563265196', 1),
(133, 9617, 46, 125, 122, 'Adipisci itaque.', '1563265196', 0),
(134, 9566, 196, 113, 37, 'Repudiandae ut veritatis.', '1563265196', 0),
(135, 1700, 47, 102, 152, 'Aspernatur sapiente tenetur.', '1563265196', 0),
(136, 8822, 36, 150, 7, 'Et dolores.', '1563265196', 0),
(137, 5619, 66, 114, 154, 'Exercitationem distinctio.', '1563265196', 1),
(138, 3091, 103, 67, 176, 'Accusantium et.', '1563265196', 1),
(139, 182, 154, 126, 147, 'Sit.', '1563265196', 0),
(140, 849, 42, 92, 52, 'Voluptatum voluptatem.', '1563265196', 1),
(141, 7442, 110, 191, 119, 'Dolores commodi velit sequi.', '1563265196', 0),
(142, 5090, 148, 156, 4, 'Magnam magni omnis.', '1563265196', 0),
(143, 4745, 144, 197, 130, 'Quaerat.', '1563265196', 0),
(144, 2801, 47, 97, 54, 'Doloribus mollitia omnis sit.', '1563265196', 0),
(145, 9656, 4, 10, 179, 'Quasi iusto tempora.', '1563265196', 0),
(146, 4432, 117, 106, 130, 'Et aut in.', '1563265196', 0),
(147, 4908, 182, 128, 91, 'Odit aliquam.', '1563265196', 0),
(148, 3195, 75, 183, 48, 'Eos officia.', '1563265196', 1),
(149, 7209, 71, 167, 164, 'Qui repellat.', '1563265196', 1),
(150, 5918, 72, 3, 193, 'Blanditiis alias facere.', '1563265196', 0),
(151, 7384, 150, 171, 30, 'Et illo.', '1563265196', 1),
(152, 2358, 126, 77, 31, 'Iusto aliquam aliquid.', '1563265196', 1),
(153, 309, 19, 21, 200, 'Earum ducimus deleniti.', '1563265196', 1),
(154, 5650, 176, 43, 155, 'Est quos est.', '1563265196', 1),
(155, 2734, 197, 123, 19, 'Ipsam porro vel.', '1563265196', 0),
(156, 5542, 68, 163, 175, 'Voluptatem fugiat consectetur natus consequatur.', '1563265196', 1),
(157, 9623, 75, 178, 135, 'Cum sed.', '1563265196', 1),
(158, 3156, 113, 166, 91, 'Est adipisci quis.', '1563265196', 0),
(159, 8582, 67, 175, 9, 'Repellendus dolor.', '1563265196', 0),
(160, 7043, 88, 192, 155, 'Autem.', '1563265196', 0),
(161, 8259, 90, 125, 138, 'Ut debitis quia necessitatibus.', '1563265196', 1),
(162, 6628, 35, 15, 151, 'Quo.', '1563265196', 0),
(163, 3435, 167, 105, 198, 'Saepe laborum.', '1563265196', 1),
(164, 3786, 143, 197, 39, 'Nihil.', '1563265196', 1),
(165, 6210, 94, 85, 75, 'Occaecati pariatur.', '1563265196', 0),
(166, 8579, 90, 117, 125, 'Perferendis rerum ab eveniet.', '1563265196', 0),
(167, 7828, 161, 139, 35, 'Illo vel fugit.', '1563265196', 0),
(168, 6440, 180, 202, 192, 'Illum molestias quidem.', '1563265196', 0),
(169, 4916, 133, 18, 58, 'Et et.', '1563265196', 0),
(170, 8293, 121, 157, 67, 'Error quos.', '1563265196', 0),
(171, 3967, 2, 198, 73, 'In sint velit.', '1563265196', 1),
(172, 943, 162, 186, 66, 'In et qui accusamus.', '1563265196', 1),
(173, 906, 44, 32, 76, 'Ipsa et.', '1563265196', 1),
(174, 9419, 107, 151, 160, 'Labore quia aperiam.', '1563265196', 0),
(175, 6907, 119, 43, 32, 'Quia aut.', '1563265196', 1),
(176, 5265, 182, 6, 139, 'Aut occaecati.', '1563265196', 1),
(177, 6191, 137, 24, 87, 'Consequatur qui qui.', '1563265196', 1),
(178, 2980, 94, 188, 171, 'Accusantium eveniet non aut.', '1563265196', 0),
(179, 2292, 56, 76, 156, 'Quis autem.', '1563265196', 1),
(180, 3661, 142, 189, 189, 'Quae ut neque quaerat veritatis tempore.', '1563265196', 0),
(181, 5145, 159, 200, 2, 'Qui quos provident dolores facilis eum.', '1563265196', 0),
(182, 1631, 86, 174, 22, 'Eum vitae nulla earum.', '1563265196', 0),
(183, 332, 175, 23, 165, 'Blanditiis molestias.', '1563265196', 0),
(184, 7234, 165, 143, 170, 'Pariatur neque.', '1563265196', 1),
(185, 8002, 119, 37, 188, 'Consequatur nemo.', '1563265196', 0),
(186, 459, 136, 114, 156, 'Voluptas rerum quia sint.', '1563265196', 0),
(187, 1007, 176, 9, 23, 'Voluptatem nesciunt quod.', '1563265196', 1),
(188, 839, 42, 84, 132, 'Sequi reiciendis sunt.', '1563265197', 1),
(189, 217, 68, 77, 116, 'Neque dolores.', '1563265197', 1),
(190, 464, 195, 86, 183, 'Eos voluptatem eaque explicabo.', '1563265197', 1),
(191, 5880, 27, 86, 84, 'Est laborum.', '1563265197', 1),
(192, 1263, 133, 94, 26, 'Laudantium vitae incidunt magni aliquid.', '1563265197', 0),
(193, 4922, 110, 109, 45, 'Nesciunt eum.', '1563265197', 1),
(194, 3394, 97, 34, 107, 'Error iusto dolor mollitia.', '1563265197', 1),
(195, 405, 28, 138, 171, 'Nihil eaque.', '1563265197', 1),
(196, 728, 165, 112, 117, 'Magnam.', '1563265197', 0),
(197, 9303, 18, 113, 79, 'Facere distinctio.', '1563265197', 1),
(198, 9701, 75, 174, 79, 'Nulla quod.', '1563265197', 1),
(199, 3788, 80, 170, 167, 'Suscipit.', '1563265197', 0),
(200, 3669, 142, 60, 46, 'Dolores repellat dignissimos odio.', '1563265197', 0),
(201, 5855, 196, 68, 97, 'Voluptas aut.', '1563265197', 1),
(202, 2860, 128, 120, 32, 'Voluptas.', '1563265197', 0),
(203, 7605, 24, 166, 114, 'Tenetur maiores omnis animi.', '1563265197', 0),
(204, 4365, 121, 64, 111, 'Labore nostrum labore molestiae.', '1563265197', 0),
(205, 9624, 187, 102, 6, 'Labore eos.', '1563265197', 0),
(206, 6313, 33, 28, 93, 'Possimus eaque amet et.', '1563265197', 0),
(207, 3483, 202, 82, 153, 'Quis dolorum enim.', '1563265197', 1),
(208, 7340, 63, 197, 10, 'Nisi possimus consequatur.', '1563265197', 1),
(209, 9207, 162, 112, 112, 'Nesciunt voluptas eveniet.', '1563265197', 1),
(210, 7485, 110, 127, 108, 'Cumque laboriosam nemo eius voluptatem.', '1563265197', 0),
(211, 7233, 171, 150, 89, 'Quis et necessitatibus.', '1563265197', 0),
(212, 346, 68, 85, 8, 'Quidem doloremque debitis consequuntur mollitia.', '1563265197', 1),
(213, 4493, 88, 96, 49, 'Ut praesentium sit.', '1563265197', 1),
(214, 9259, 149, 15, 180, 'Quibusdam velit eos.', '1563265197', 0),
(215, 615, 56, 12, 50, 'Nihil et.', '1563265197', 1),
(216, 1326, 128, 67, 184, 'Architecto.', '1563265197', 0),
(217, 2772, 89, 1, 79, 'Qui ea aut.', '1563265197', 1),
(218, 7263, 36, 88, 35, 'Omnis facere.', '1563265197', 1),
(219, 4589, 73, 80, 167, 'Perferendis esse veniam mollitia deserunt.', '1563265197', 0),
(220, 3926, 158, 113, 89, 'Nostrum rerum beatae qui voluptas earum.', '1563265197', 1),
(221, 6349, 153, 46, 186, 'Quae magni dignissimos.', '1563265197', 1),
(222, 6326, 43, 180, 55, 'Harum amet nostrum explicabo.', '1563265197', 1),
(223, 7468, 198, 157, 35, 'Ea.', '1563265197', 0),
(224, 7895, 78, 187, 175, 'Magnam ipsum.', '1563265197', 0),
(225, 396, 87, 24, 153, 'Unde.', '1563265197', 1),
(226, 8981, 35, 199, 100, 'Quisquam minus.', '1563265197', 0),
(227, 9093, 6, 120, 91, 'Et corporis.', '1563265197', 1),
(228, 7077, 184, 59, 92, 'Dolor omnis.', '1563265197', 0),
(229, 7948, 58, 65, 16, 'Est nisi ad.', '1563265197', 1),
(230, 8424, 200, 83, 136, 'Expedita.', '1563265197', 0),
(231, 8226, 158, 191, 132, 'Aut doloribus et consequuntur ea blanditiis.', '1563265197', 1),
(232, 96, 150, 64, 190, 'Aut architecto sit.', '1563265197', 1),
(233, 3591, 123, 114, 136, 'Nulla et voluptas porro amet.', '1563265197', 1),
(234, 3241, 142, 106, 193, 'Quae aut cum sit.', '1563265197', 0),
(235, 7520, 119, 86, 96, 'Aliquid ut omnis qui est quam.', '1563265197', 1),
(236, 5598, 128, 113, 138, 'Laboriosam necessitatibus reiciendis eaque impedit.', '1563265197', 0),
(237, 5419, 88, 56, 130, 'Alias dolorem sed ipsam.', '1563265197', 1),
(238, 3510, 110, 149, 122, 'Fugiat qui corrupti hic.', '1563265197', 1),
(239, 6378, 85, 9, 141, 'Quaerat temporibus.', '1563265197', 0),
(240, 860, 63, 12, 33, 'Qui ut minima sint.', '1563265197', 1),
(241, 4692, 11, 163, 48, 'Cupiditate hic.', '1563265197', 1),
(242, 2865, 201, 202, 8, 'Sed fugiat.', '1563265197', 0),
(243, 3447, 80, 62, 167, 'Eum ut.', '1563265197', 0),
(244, 8189, 142, 28, 75, 'Porro voluptatem asperiores et.', '1563265197', 1),
(245, 9175, 186, 153, 19, 'Ipsum velit facere quod.', '1563265197', 0),
(246, 3899, 183, 28, 142, 'Fuga tempora veniam.', '1563265197', 0),
(247, 2285, 94, 55, 41, 'Unde aut rerum.', '1563265197', 1),
(248, 5698, 198, 55, 97, 'Laboriosam exercitationem voluptatem voluptatum.', '1563265197', 0),
(249, 5952, 170, 173, 71, 'Consequatur ratione.', '1563265197', 0),
(250, 9715, 51, 28, 151, 'Deserunt natus consequuntur.', '1563265197', 1),
(251, 8089, 92, 92, 154, 'Possimus est voluptatem.', '1563265197', 1),
(252, 1052, 74, 69, 142, 'Numquam dolor incidunt.', '1563265197', 1),
(253, 7991, 165, 128, 23, 'Dicta non vel.', '1563265197', 1),
(254, 1271, 125, 192, 2, 'Et doloremque aut iure.', '1563265197', 0),
(255, 4572, 188, 13, 158, 'Natus aut.', '1563265197', 0),
(256, 4116, 157, 135, 139, 'Ipsa qui aliquid quam.', '1563265197', 1),
(257, 7081, 76, 58, 30, 'Iste quod commodi et aliquid aut.', '1563265197', 0),
(258, 5409, 96, 105, 77, 'Et quia molestiae.', '1563265197', 0),
(259, 2664, 39, 174, 46, 'Non voluptatem dolorem.', '1563265197', 1),
(260, 3006, 97, 41, 28, 'Ipsam.', '1563265197', 0),
(261, 7370, 171, 105, 141, 'Eum incidunt autem dolore quos.', '1563265197', 0),
(262, 5473, 59, 166, 87, 'Quo et voluptatem voluptas.', '1563265197', 0),
(263, 5940, 128, 163, 138, 'Sit voluptates molestiae.', '1563265197', 1),
(264, 7438, 81, 56, 134, 'A harum dolor laboriosam officia.', '1563265197', 0),
(265, 3743, 70, 195, 95, 'Delectus ea.', '1563265197', 0),
(266, 4951, 81, 53, 105, 'Ipsam repudiandae possimus.', '1563265197', 0),
(267, 5618, 182, 107, 78, 'Reprehenderit.', '1563265197', 0),
(268, 6992, 37, 79, 203, 'Architecto porro atque.', '1563265197', 0),
(269, 3078, 57, 94, 24, 'Et sunt.', '1563265197', 1),
(270, 9696, 163, 105, 184, 'Architecto delectus repellat.', '1563265197', 1),
(271, 9400, 62, 190, 201, 'Optio numquam harum cupiditate.', '1563265197', 1),
(272, 5808, 159, 58, 186, 'Et voluptatem sint.', '1563265197', 1),
(273, 3730, 152, 118, 107, 'Et omnis est mollitia.', '1563265197', 1),
(274, 14, 57, 131, 58, 'Eos voluptatibus et tempora velit.', '1563265197', 1),
(275, 502, 15, 108, 142, 'Eius autem architecto autem.', '1563265197', 0),
(276, 5912, 156, 27, 189, 'Vel.', '1563265197', 0),
(277, 8386, 94, 42, 133, 'Qui est nisi exercitationem.', '1563265197', 0),
(278, 5744, 162, 9, 174, 'Molestias inventore.', '1563265197', 1),
(279, 9968, 110, 184, 90, 'Saepe explicabo enim.', '1563265197', 0),
(280, 6194, 168, 200, 168, 'Molestiae sed et.', '1563265197', 0),
(281, 8489, 189, 160, 45, 'Repellat eos nostrum est asperiores porro.', '1563265197', 1),
(282, 7269, 160, 67, 63, 'Et incidunt error.', '1563265197', 1),
(283, 8116, 25, 145, 14, 'Ut sit adipisci.', '1563265197', 0),
(284, 6406, 89, 189, 36, 'Aut praesentium aut consectetur vel.', '1563265197', 0),
(285, 9403, 7, 4, 63, 'Non tenetur dolorum.', '1563265197', 0),
(286, 1275, 130, 12, 106, 'Nihil commodi id rerum.', '1563265197', 1),
(287, 1452, 102, 159, 42, 'Culpa corrupti error.', '1563265197', 1),
(288, 3063, 119, 116, 108, 'Sunt voluptatem.', '1563265197', 0),
(289, 29, 74, 138, 70, 'Omnis sunt consequatur et.', '1563265197', 0),
(290, 4164, 193, 60, 185, 'Consequuntur quo.', '1563265198', 1),
(291, 4481, 66, 164, 177, 'Saepe.', '1563265198', 0),
(292, 4468, 52, 71, 152, 'Doloremque ut ducimus in ratione.', '1563265198', 1),
(293, 2165, 143, 169, 54, 'Sit distinctio.', '1563265198', 1),
(294, 5974, 180, 91, 175, 'Ut mollitia.', '1563265198', 1),
(295, 5827, 65, 12, 171, 'Blanditiis amet.', '1563265198', 0),
(296, 481, 61, 89, 82, 'Quo qui sunt.', '1563265198', 1),
(297, 1225, 20, 38, 39, 'Neque et explicabo.', '1563265198', 1),
(298, 9293, 51, 179, 13, 'Corporis quia ad.', '1563265198', 0),
(299, 7703, 34, 105, 148, 'Ipsum unde omnis perspiciatis.', '1563265198', 0),
(300, 5755, 72, 16, 45, 'Praesentium quos debitis fugit.', '1563265198', 1),
(301, 9031, 152, 135, 91, 'Soluta quia quia.', '1563265198', 1),
(302, 6820, 30, 63, 124, 'Qui occaecati culpa.', '1563265198', 1),
(303, 2910, 110, 83, 117, 'Nemo cumque.', '1563265198', 1),
(304, 3898, 12, 14, 71, 'Dicta consequuntur assumenda alias.', '1563265198', 0),
(305, 8897, 113, 39, 10, 'Ad tenetur.', '1563265198', 0),
(306, 3648, 149, 38, 47, 'Reiciendis est repellat.', '1563265198', 1),
(307, 7355, 41, 13, 93, 'Minus et sunt aut sint ut.', '1563265198', 1),
(308, 883, 105, 59, 159, 'Quo quasi.', '1563265198', 1),
(309, 6184, 14, 15, 197, 'Ex et nisi.', '1563265198', 0),
(310, 5837, 149, 44, 119, 'Esse dicta.', '1563265198', 1),
(311, 7247, 141, 144, 111, 'Consequatur rerum est iure et natus.', '1563265198', 0),
(312, 2602, 110, 135, 28, 'Magnam tempore.', '1563265198', 0),
(313, 7898, 43, 104, 107, 'Animi ut velit ut occaecati architecto.', '1563265198', 1),
(314, 1292, 31, 103, 120, 'Molestiae ut quos voluptatum.', '1563265198', 1),
(315, 9003, 5, 194, 175, 'Aut.', '1563265198', 1),
(316, 1604, 32, 74, 13, 'Provident earum.', '1563265198', 1),
(317, 389, 172, 55, 146, 'Et officiis.', '1563265198', 0),
(318, 8266, 5, 195, 55, 'Asperiores accusantium.', '1563265198', 1),
(319, 2594, 119, 31, 162, 'Vitae maxime nisi consequatur.', '1563265198', 1),
(320, 6726, 183, 193, 48, 'Nisi enim.', '1563265198', 0),
(321, 3852, 112, 64, 3, 'Recusandae aliquid tenetur.', '1563265198', 1),
(322, 7253, 181, 27, 72, 'Repellendus placeat vel cumque.', '1563265198', 1),
(323, 8844, 156, 113, 60, 'Corporis.', '1563265198', 1),
(324, 3643, 40, 179, 175, 'Nesciunt aliquam sit aut molestiae.', '1563265198', 1),
(325, 2202, 173, 8, 41, 'Eum autem.', '1563265198', 0),
(326, 129, 56, 21, 129, 'Labore illum recusandae.', '1563265198', 1),
(327, 4701, 106, 97, 139, 'Debitis labore.', '1563265198', 0),
(328, 7701, 45, 45, 131, 'Libero ipsa harum ab.', '1563265198', 0),
(329, 6679, 55, 169, 49, 'Dolorem praesentium reprehenderit autem.', '1563265198', 1),
(330, 1754, 186, 12, 30, 'Illum amet sequi laborum.', '1563265198', 0),
(331, 5125, 115, 25, 169, 'Voluptatum qui.', '1563265198', 1),
(332, 7329, 164, 38, 89, 'Sit ut eaque neque quo.', '1563265198', 1),
(333, 3082, 29, 35, 21, 'Sit animi vitae et.', '1563265198', 1),
(334, 4674, 170, 14, 10, 'Nihil qui placeat voluptate.', '1563265198', 1),
(335, 9403, 69, 58, 102, 'Animi veniam.', '1563265198', 0),
(336, 4838, 16, 152, 154, 'Aliquid enim aliquid.', '1563265198', 1),
(337, 5619, 118, 53, 195, 'Praesentium aut quibusdam magnam qui sint.', '1563265198', 0),
(338, 8758, 88, 56, 160, 'Id cupiditate.', '1563265198', 1),
(339, 976, 167, 79, 191, 'Quaerat.', '1563265198', 1),
(340, 7390, 112, 43, 102, 'Consequatur explicabo suscipit.', '1563265198', 1),
(341, 7252, 47, 28, 65, 'Est eum.', '1563265198', 1),
(342, 7087, 182, 95, 185, 'Quisquam ad itaque.', '1563265198', 1),
(343, 3281, 23, 5, 174, 'Dolores asperiores.', '1563265198', 1),
(344, 7204, 81, 152, 2, 'Maiores beatae.', '1563265198', 0),
(345, 6039, 39, 196, 120, 'Voluptatem dicta atque non non id.', '1563265198', 1),
(346, 221, 96, 58, 30, 'Beatae eveniet eaque explicabo quod.', '1563265198', 1),
(347, 5228, 115, 119, 123, 'Excepturi quidem.', '1563265198', 0),
(348, 2779, 42, 121, 28, 'Quibusdam maxime.', '1563265198', 0),
(349, 9417, 69, 29, 36, 'Repellendus est qui.', '1563265198', 1),
(350, 2218, 30, 70, 58, 'Quidem.', '1563265198', 1),
(351, 1579, 175, 64, 114, 'Aut ipsum eum magni dolorem.', '1563265198', 1),
(352, 3054, 140, 24, 42, 'Temporibus sit omnis.', '1563265198', 0),
(353, 5104, 126, 1, 70, 'Omnis recusandae ipsam.', '1563265198', 0),
(354, 6525, 17, 146, 110, 'Voluptas enim est dolorem.', '1563265198', 0),
(355, 4659, 46, 39, 143, 'Ducimus facere excepturi ratione.', '1563265198', 1),
(356, 8095, 67, 169, 189, 'Quis hic corrupti.', '1563265198', 0),
(357, 6620, 11, 180, 37, 'Vel officia asperiores perferendis.', '1563265198', 0),
(358, 6355, 86, 28, 168, 'Libero pariatur.', '1563265198', 0),
(359, 284, 162, 97, 155, 'Voluptatem rerum qui et.', '1563265198', 0),
(360, 3487, 134, 71, 7, 'Facilis.', '1563265198', 1),
(361, 2331, 145, 163, 124, 'Quisquam totam.', '1563265198', 1),
(362, 8886, 5, 186, 79, 'Nam officia odio.', '1563265198', 0),
(363, 757, 98, 196, 6, 'Quibusdam sunt qui sunt.', '1563265198', 0),
(364, 814, 182, 153, 47, 'Fugit eveniet.', '1563265198', 0),
(365, 1218, 171, 131, 62, 'Nihil quia est dolorem ut ad.', '1563265198', 1),
(366, 6965, 140, 182, 34, 'Est quae aperiam debitis.', '1563265198', 1),
(367, 87, 88, 60, 8, 'Ea enim.', '1563265198', 0),
(368, 9586, 79, 148, 73, 'Doloremque optio.', '1563265198', 0),
(369, 8320, 76, 184, 114, 'Explicabo natus.', '1563265198', 1),
(370, 5587, 100, 1, 36, 'In fugit architecto ut.', '1563265198', 1),
(371, 9201, 140, 48, 43, 'Assumenda velit.', '1563265198', 1),
(372, 2065, 199, 132, 170, 'Dolor debitis et.', '1563265198', 0),
(373, 8868, 176, 172, 28, 'Aut corrupti.', '1563265198', 1),
(374, 4662, 18, 11, 59, 'Sit.', '1563265198', 0),
(375, 2580, 27, 191, 16, 'Distinctio.', '1563265198', 0),
(376, 849, 29, 131, 158, 'Voluptates et atque harum et.', '1563265198', 1),
(377, 5539, 16, 113, 83, 'Officiis.', '1563265198', 1),
(378, 6322, 89, 6, 45, 'Est voluptas voluptatem.', '1563265198', 1),
(379, 1351, 73, 9, 46, 'Tempore natus magni facilis iste.', '1563265198', 0),
(380, 7458, 103, 158, 58, 'Dolores sed necessitatibus.', '1563265198', 0),
(381, 4913, 177, 164, 145, 'Qui dignissimos alias.', '1563265198', 1),
(382, 161, 102, 73, 190, 'Quia.', '1563265198', 0),
(383, 1382, 144, 29, 87, 'Consequuntur.', '1563265198', 1),
(384, 3824, 19, 149, 75, 'Fuga dignissimos et.', '1563265198', 0),
(385, 9594, 36, 76, 84, 'Et.', '1563265198', 1),
(386, 770, 3, 59, 118, 'Corporis dicta ut.', '1563265198', 0),
(387, 8235, 126, 16, 135, 'Dolorem soluta impedit optio quo.', '1563265198', 1),
(388, 5016, 190, 34, 43, 'Deserunt dolores aut consequatur.', '1563265198', 1),
(389, 9661, 8, 195, 128, 'Quo et repudiandae nam.', '1563265198', 1),
(390, 7899, 43, 75, 7, 'Ipsum totam.', '1563265198', 1),
(391, 8998, 96, 88, 160, 'Iusto tenetur excepturi earum ab nisi.', '1563265198', 1),
(392, 5961, 53, 188, 84, 'Possimus.', '1563265198', 0),
(393, 4974, 129, 183, 48, 'Quo hic molestias officia eum.', '1563265198', 1),
(394, 950, 186, 117, 156, 'Hic magni necessitatibus voluptatem.', '1563265198', 1),
(395, 9417, 151, 201, 79, 'Repellendus.', '1563265198', 1),
(396, 7, 1, 203, 107, 'Magni quaerat aut sed at.', '1563265198', 1),
(397, 918, 170, 186, 63, 'Animi cupiditate dolore.', '1563265198', 0),
(398, 5436, 109, 136, 143, 'Consequatur tempora excepturi at adipisci.', '1563265198', 1),
(399, 2019, 177, 82, 106, 'Libero voluptas non quo.', '1563265198', 0),
(400, 3316, 129, 106, 47, 'Assumenda modi.', '1563265198', 1),
(401, 4710, 83, 53, 19, 'Sunt voluptatem explicabo.', '1563265198', 0),
(402, 106, 113, 45, 141, 'Ipsam.', '1563265198', 0),
(403, 371, 95, 18, 55, 'Reprehenderit.', '1563265198', 0),
(404, 1232, 188, 134, 193, 'Voluptatibus dolore.', '1563265198', 1),
(405, 3414, 90, 22, 110, 'Est et.', '1563265198', 0),
(406, 2675, 176, 62, 47, 'Sunt.', '1563265198', 1),
(407, 1579, 127, 47, 185, 'Molestias similique.', '1563265198', 1),
(408, 4635, 3, 203, 193, 'Harum fugit aut exercitationem incidunt.', '1563265199', 1),
(409, 6292, 97, 45, 20, 'Eius vitae molestias voluptatem quis quod.', '1563265199', 1),
(410, 9668, 55, 16, 86, 'Illo molestiae.', '1563265199', 0),
(411, 608, 183, 150, 81, 'Ab dolorem sint.', '1563265199', 1),
(412, 5815, 56, 66, 93, 'Excepturi amet est.', '1563265199', 1),
(413, 8781, 194, 75, 125, 'Quia sit optio et.', '1563265199', 1),
(414, 7102, 131, 55, 36, 'Ullam facilis vero.', '1563265199', 0),
(415, 9333, 186, 118, 129, 'Dolorem maxime et voluptatem soluta.', '1563265199', 0),
(416, 3211, 152, 117, 166, 'Quis.', '1563265199', 0),
(417, 9551, 167, 124, 138, 'Officiis sit.', '1563265199', 1),
(418, 2445, 180, 105, 105, 'Blanditiis ut et officiis eum.', '1563265199', 1),
(419, 8817, 187, 138, 175, 'Adipisci non ex laboriosam omnis.', '1563265199', 1),
(420, 3897, 149, 97, 196, 'Omnis aliquid.', '1563265199', 0),
(421, 9286, 117, 80, 18, 'Culpa ut nulla dolores illo.', '1563265199', 1),
(422, 4640, 39, 191, 152, 'Saepe earum aut magni eveniet.', '1563265199', 1),
(423, 6423, 187, 66, 172, 'Culpa architecto.', '1563265199', 1),
(424, 6578, 149, 196, 144, 'Blanditiis vitae est hic.', '1563265199', 1),
(425, 9793, 63, 138, 115, 'Sint.', '1563265199', 0),
(426, 7779, 48, 103, 193, 'Ut dolorem.', '1563265199', 0),
(427, 5928, 179, 60, 115, 'Eius et delectus atque.', '1563265199', 0),
(428, 1880, 175, 82, 148, 'Itaque quasi.', '1563265199', 0),
(429, 9727, 196, 173, 76, 'Vero quia et laboriosam animi.', '1563265199', 1),
(430, 872, 65, 198, 153, 'Aspernatur modi sed quas.', '1563265199', 1),
(431, 857, 81, 140, 75, 'Perferendis inventore doloribus illum.', '1563265199', 0),
(432, 9135, 108, 151, 189, 'Possimus ipsum placeat.', '1563265199', 1),
(433, 9155, 59, 120, 178, 'Architecto quod sed.', '1563265199', 0),
(434, 1186, 132, 67, 3, 'Saepe.', '1563265199', 1),
(435, 4245, 34, 193, 109, 'Nihil est et.', '1563265199', 0),
(436, 5685, 1, 47, 119, 'Qui aut qui.', '1563265199', 1),
(437, 2391, 23, 41, 49, 'Saepe voluptatibus ullam ut.', '1563265199', 0),
(438, 8906, 202, 27, 146, 'Ipsa reprehenderit qui.', '1563265199', 0),
(439, 8947, 73, 98, 199, 'Et quas.', '1563265199', 1),
(440, 5143, 57, 5, 81, 'Ullam et consequuntur.', '1563265199', 0),
(441, 5537, 124, 156, 195, 'Cupiditate mollitia veniam.', '1563265199', 1),
(442, 3256, 30, 165, 38, 'Officiis veritatis libero et.', '1563265199', 0),
(443, 2450, 48, 81, 26, 'Laboriosam tempore fugit nisi qui.', '1563265199', 0),
(444, 3644, 111, 126, 37, 'Iure et consequatur.', '1563265199', 0),
(445, 1794, 22, 40, 138, 'Repellat facere aliquid.', '1563265199', 1),
(446, 3006, 48, 34, 75, 'Eos corrupti.', '1563265199', 0),
(447, 666, 50, 46, 66, 'Et excepturi aliquam sint.', '1563265199', 0),
(448, 8403, 48, 180, 29, 'Iusto esse fuga iste.', '1563265199', 0),
(449, 3840, 156, 134, 92, 'Enim id aspernatur consequatur saepe dolores.', '1563265199', 1),
(450, 2105, 175, 79, 126, 'Hic vitae.', '1563265199', 0),
(451, 9596, 184, 38, 156, 'Qui velit.', '1563265199', 0),
(452, 4627, 163, 123, 136, 'Labore culpa non assumenda aut.', '1563265199', 0),
(453, 4566, 199, 36, 84, 'Sunt cumque accusantium quae.', '1563265199', 1),
(454, 5840, 184, 203, 82, 'Suscipit voluptas deserunt.', '1563265199', 0),
(455, 5481, 48, 139, 148, 'Dignissimos et labore.', '1563265199', 1),
(456, 6237, 179, 155, 74, 'Itaque sed et.', '1563265199', 0),
(457, 84, 192, 16, 3, 'Cum in quis.', '1563265199', 0),
(458, 5231, 65, 165, 136, 'Pariatur vel.', '1563265199', 1),
(459, 4754, 19, 127, 52, 'Consectetur ut dolorem dignissimos.', '1563265199', 0),
(460, 6005, 103, 7, 152, 'Deleniti deleniti.', '1563265199', 0),
(461, 1016, 15, 146, 8, 'Ratione quisquam.', '1563265199', 0),
(462, 8627, 171, 166, 30, 'Architecto.', '1563265199', 0),
(463, 2846, 126, 183, 198, 'Fugiat quisquam omnis.', '1563265199', 0),
(464, 6535, 115, 86, 112, 'Dolorum quae.', '1563265199', 1),
(465, 502, 91, 119, 134, 'Nobis ut dolor.', '1563265199', 0),
(466, 9713, 6, 202, 187, 'Aut quia.', '1563265199', 1),
(467, 4416, 80, 108, 33, 'Et doloribus modi.', '1563265199', 1),
(468, 833, 69, 111, 191, 'Ut cumque reprehenderit.', '1563265200', 1),
(469, 8111, 92, 118, 74, 'Nostrum repellendus veniam tenetur.', '1563265200', 1),
(470, 2648, 172, 154, 15, 'Explicabo illum est ipsa.', '1563265200', 1),
(471, 2474, 43, 120, 90, 'Qui.', '1563265200', 1),
(472, 8686, 32, 1, 55, 'Et consequatur earum ad laborum aut.', '1563265200', 0),
(473, 6932, 188, 131, 63, 'Dolore est laborum.', '1563265200', 1),
(474, 1111, 202, 165, 91, 'Labore non ea assumenda molestiae veritatis.', '1563265200', 1),
(475, 2854, 79, 66, 67, 'Doloribus aut et.', '1563265200', 0),
(476, 4445, 73, 145, 187, 'Dolore.', '1563265200', 1),
(477, 3420, 188, 183, 29, 'Inventore.', '1563265200', 1),
(478, 2289, 18, 64, 88, 'Nostrum.', '1563265200', 1),
(479, 7687, 166, 52, 125, 'Rerum quia.', '1563265200', 0),
(480, 4028, 80, 72, 43, 'Error est quis.', '1563265200', 0),
(481, 1133, 109, 114, 110, 'Velit voluptatem.', '1563265200', 1),
(482, 9301, 163, 129, 116, 'Voluptatum architecto.', '1563265200', 0),
(483, 2668, 39, 157, 80, 'Nesciunt enim.', '1563265200', 0),
(484, 9949, 107, 175, 156, 'Incidunt.', '1563265200', 0),
(485, 1151, 203, 86, 60, 'Est magni doloremque hic.', '1563265200', 1),
(486, 6096, 73, 47, 130, 'Tempore omnis quam.', '1563265200', 0),
(487, 9826, 97, 26, 125, 'Eveniet modi deserunt.', '1563265200', 0),
(488, 7635, 57, 114, 129, 'Est id eum.', '1563265200', 0),
(489, 4451, 181, 169, 102, 'Sunt vitae numquam.', '1563265200', 0),
(490, 6692, 96, 30, 147, 'Nihil provident rerum rerum porro.', '1563265200', 1),
(491, 9429, 95, 88, 113, 'Saepe iste.', '1563265200', 0),
(492, 2034, 175, 176, 53, 'Quo earum qui.', '1563265200', 0),
(493, 5910, 144, 50, 122, 'Id quia dolores.', '1563265200', 0),
(494, 1612, 148, 9, 100, 'A maxime.', '1563265200', 0),
(495, 4837, 14, 153, 175, 'Minus id eveniet.', '1563265200', 0),
(496, 7956, 120, 95, 140, 'Eos.', '1563265200', 1),
(497, 8696, 69, 124, 49, 'Id ea cupiditate amet ut.', '1563265200', 0),
(498, 3648, 151, 21, 128, 'Reprehenderit labore.', '1563265200', 0),
(499, 7789, 85, 33, 22, 'Voluptates.', '1563265200', 0),
(500, 2750, 82, 172, 75, 'Cupiditate qui quasi beatae consequuntur.', '1563265200', 1),
(501, 7336, 149, 18, 8, 'Consequatur atque.', '1563265200', 1),
(502, 8271, 45, 79, 166, 'Qui eveniet minima consequatur.', '1563265200', 1),
(503, 3678, 177, 83, 96, 'Aperiam debitis et.', '1563265200', 0),
(504, 7885, 137, 122, 53, 'Sapiente perferendis laborum ut commodi quasi.', '1563265200', 0),
(505, 6899, 6, 19, 68, 'Ut maxime dicta sed qui laboriosam.', '1563265200', 0),
(506, 7281, 65, 161, 140, 'Ipsa est.', '1563265200', 0),
(507, 5110, 29, 106, 59, 'Harum omnis vel.', '1563265200', 0),
(508, 2185, 203, 23, 185, 'Vel accusamus.', '1563265201', 0),
(509, 6289, 156, 155, 179, 'Ducimus placeat.', '1563265201', 1),
(510, 536, 90, 4, 95, 'Et eveniet dolorem.', '1563265201', 1),
(511, 7022, 43, 62, 130, 'Earum quis qui.', '1563265201', 0),
(512, 6731, 23, 3, 107, 'Ut illum quia est.', '1563265201', 1),
(513, 8032, 114, 32, 85, 'Illo quaerat.', '1563265201', 1),
(514, 4556, 3, 137, 197, 'Qui nulla.', '1563265201', 1),
(515, 6091, 157, 55, 112, 'Accusantium dolor laboriosam.', '1563265201', 0),
(516, 6466, 60, 160, 35, 'Omnis ipsam qui.', '1563265201', 0),
(517, 6131, 139, 112, 40, 'Occaecati sed non eum accusamus et.', '1563265201', 1),
(518, 5602, 56, 105, 36, 'Repellendus incidunt tenetur.', '1563265201', 0),
(519, 3893, 18, 88, 199, 'Totam.', '1563265201', 1),
(520, 3736, 53, 28, 95, 'Et et dolorum quisquam similique excepturi.', '1563265201', 1),
(521, 5844, 183, 120, 203, 'Blanditiis.', '1563265201', 0),
(522, 7608, 12, 53, 70, 'Aut saepe.', '1563265201', 1),
(523, 2521, 150, 40, 39, 'Beatae commodi.', '1563265201', 1),
(524, 3298, 117, 103, 130, 'Sunt cum distinctio exercitationem qui quod.', '1563265201', 1),
(525, 4147, 76, 187, 113, 'Reprehenderit facilis commodi.', '1563265201', 0),
(526, 5124, 49, 144, 5, 'Nihil.', '1563265201', 0),
(527, 7206, 100, 19, 3, 'Officia voluptatem.', '1563265201', 1),
(528, 8387, 193, 29, 96, 'Quis ratione.', '1563265201', 0),
(529, 1649, 176, 188, 193, 'Tempora perferendis.', '1563265201', 1),
(530, 4291, 140, 202, 62, 'Tempora porro voluptate cum.', '1563265201', 1),
(531, 4582, 100, 199, 6, 'Sed velit quasi.', '1563265201', 0),
(532, 956, 15, 142, 198, 'Dignissimos sapiente ut quia.', '1563265201', 1),
(533, 7933, 52, 201, 178, 'Maiores quo.', '1563265201', 0),
(534, 8640, 85, 106, 73, 'Tenetur assumenda voluptatibus.', '1563265201', 1),
(535, 7909, 20, 111, 198, 'Qui quod.', '1563265201', 0),
(536, 6321, 145, 110, 144, 'Earum quos non.', '1563265201', 0),
(537, 5391, 52, 11, 70, 'Qui quaerat aut.', '1563265201', 1),
(538, 1493, 175, 55, 28, 'Aut totam.', '1563265201', 0),
(539, 4090, 50, 70, 123, 'Adipisci officia.', '1563265201', 1),
(540, 8815, 20, 154, 201, 'Et consequuntur.', '1563265201', 0),
(541, 4390, 48, 48, 15, 'A cum.', '1563265201', 0),
(542, 4759, 111, 176, 113, 'Officia est vel.', '1563265201', 1),
(543, 4573, 78, 203, 123, 'Qui.', '1563265201', 0),
(544, 8619, 24, 10, 141, 'Harum eveniet.', '1563265201', 0),
(545, 6632, 49, 168, 25, 'Voluptate.', '1563265201', 0),
(546, 7724, 97, 34, 163, 'Laborum nesciunt.', '1563265201', 0),
(547, 331, 17, 174, 160, 'Doloremque alias.', '1563265201', 1),
(548, 2844, 180, 15, 6, 'Velit sit voluptas unde.', '1563265201', 0),
(549, 6032, 116, 35, 51, 'Fugiat eum.', '1563265201', 0),
(550, 4995, 110, 109, 168, 'Voluptatum et debitis quis velit.', '1563265201', 0),
(551, 8390, 90, 68, 70, 'Aut dolor non.', '1563265201', 1),
(552, 4326, 201, 117, 31, 'Qui dolore numquam.', '1563265201', 1),
(553, 7155, 22, 53, 70, 'Corrupti pariatur iste ad adipisci.', '1563265201', 0),
(554, 2165, 177, 172, 59, 'Dolor fugiat.', '1563265201', 1),
(555, 8880, 161, 129, 165, 'Quod at.', '1563265201', 1),
(556, 148, 190, 169, 49, 'Sed.', '1563265201', 1),
(557, 2149, 199, 76, 81, 'Est vel vel.', '1563265201', 0),
(558, 1976, 88, 37, 162, 'Animi.', '1563265201', 1),
(559, 2800, 114, 166, 92, 'Omnis officiis exercitationem.', '1563265201', 1),
(560, 9799, 72, 78, 189, 'Commodi sit.', '1563265202', 1),
(561, 4325, 161, 53, 29, 'Sint eligendi est.', '1563265202', 0),
(562, 7777, 65, 135, 176, 'Sunt perferendis provident ea.', '1563265202', 0),
(563, 4887, 102, 57, 67, 'Ipsa vel.', '1563265202', 1),
(564, 7545, 120, 95, 75, 'Quia quo qui.', '1563265202', 1),
(565, 2709, 108, 24, 48, 'Et vel.', '1563265202', 0),
(566, 8377, 116, 22, 97, 'Eum dolor omnis.', '1563265202', 0),
(567, 4043, 192, 90, 95, 'Nesciunt dolor.', '1563265202', 1),
(568, 7229, 71, 67, 201, 'Provident nostrum sint qui sunt mollitia.', '1563265202', 0),
(569, 1976, 112, 200, 149, 'Maxime maiores veritatis.', '1563265202', 0),
(570, 8539, 18, 5, 38, 'Suscipit quae et neque et repudiandae.', '1563265202', 0),
(571, 2816, 53, 69, 15, 'Est eaque aut.', '1563265202', 0),
(572, 6400, 95, 48, 37, 'Error dolorem ut fugit.', '1563265202', 1),
(573, 5643, 15, 187, 69, 'Laborum fuga quam.', '1563265202', 0),
(574, 4186, 45, 42, 157, 'Alias.', '1563265202', 1),
(575, 8882, 46, 182, 49, 'Sint.', '1563265202', 1),
(576, 8688, 60, 87, 43, 'Temporibus aperiam necessitatibus.', '1563265202', 1),
(577, 6992, 172, 111, 142, 'Magnam voluptas id dolores recusandae.', '1563265202', 0),
(578, 2527, 97, 138, 138, 'Accusamus quae et omnis vero fuga.', '1563265202', 0),
(579, 4997, 157, 9, 131, 'Molestiae blanditiis.', '1563265202', 1),
(580, 5370, 119, 133, 139, 'Tenetur deserunt quas.', '1563265202', 1),
(581, 2177, 40, 166, 45, 'Suscipit odit dolores.', '1563265202', 1),
(582, 4762, 177, 124, 145, 'Cum sint et.', '1563265202', 1),
(583, 6573, 199, 4, 162, 'Vel et.', '1563265202', 1),
(584, 3319, 108, 35, 13, 'Qui et nihil eum itaque.', '1563265202', 1),
(585, 211, 1, 74, 177, 'Earum omnis quis deleniti.', '1563265202', 1),
(586, 2588, 120, 148, 38, 'Saepe ut voluptatem.', '1563265202', 0),
(587, 7597, 150, 25, 145, 'Numquam aliquam.', '1563265202', 1),
(588, 6267, 75, 142, 71, 'Est nulla voluptas.', '1563265202', 0),
(589, 4724, 197, 20, 177, 'In excepturi.', '1563265202', 0),
(590, 3542, 194, 37, 108, 'Quia iste.', '1563265202', 0),
(591, 5262, 164, 170, 88, 'Fugiat tempore dolores debitis iste dolor.', '1563265202', 1),
(592, 7389, 51, 130, 105, 'Aut aperiam omnis non.', '1563265202', 0),
(593, 4010, 178, 111, 141, 'Libero adipisci alias voluptatum.', '1563265202', 0),
(594, 8177, 148, 152, 36, 'Ea dicta sequi.', '1563265202', 0),
(595, 6796, 63, 108, 47, 'Quae sequi aspernatur.', '1563265202', 0),
(596, 6812, 164, 163, 195, 'Nam unde natus beatae totam.', '1563265202', 0),
(597, 9915, 94, 169, 36, 'Distinctio delectus similique nihil.', '1563265202', 1),
(598, 6068, 86, 70, 15, 'Ab in exercitationem.', '1563265202', 0),
(599, 496, 101, 191, 29, 'Commodi sint.', '1563265202', 0),
(600, 1486, 189, 139, 4, 'Qui culpa fugiat.', '1563265202', 0),
(601, 1109, 29, 85, 105, 'Dolores dolores cupiditate expedita.', '1563265202', 0),
(602, 4177, 115, 65, 164, 'Debitis hic.', '1563265202', 0),
(603, 5662, 79, 102, 54, 'Non velit alias et explicabo repellendus.', '1563265202', 0),
(604, 2962, 29, 99, 59, 'Odit qui perferendis.', '1563265202', 0),
(605, 8078, 20, 196, 196, 'Vitae iure autem.', '1563265202', 0),
(606, 8276, 71, 182, 28, 'Voluptate tempore ut.', '1563265202', 1),
(607, 9226, 162, 171, 64, 'Iste corporis.', '1563265202', 1),
(608, 6606, 49, 4, 89, 'Tempore natus libero distinctio.', '1563265202', 0),
(609, 7591, 201, 138, 82, 'Placeat hic nisi suscipit.', '1563265202', 0),
(610, 7260, 123, 73, 30, 'Et voluptatem vitae.', '1563265202', 0),
(611, 4046, 160, 84, 134, 'Voluptates aut autem accusamus quisquam.', '1563265202', 0),
(612, 9924, 22, 95, 84, 'Quaerat in rem.', '1563265202', 1),
(613, 6578, 8, 48, 110, 'Assumenda eius reiciendis quo.', '1563265202', 1),
(614, 6473, 118, 153, 158, 'Consequatur sunt inventore.', '1563265202', 1),
(615, 4910, 167, 98, 18, 'Doloremque facilis commodi.', '1563265202', 0),
(616, 6772, 131, 152, 117, 'Molestiae quidem minus.', '1563265202', 0),
(617, 5527, 96, 75, 17, 'Dolorum dolorum qui accusantium reiciendis.', '1563265202', 0),
(618, 2037, 47, 159, 77, 'Sunt vel.', '1563265202', 0),
(619, 3154, 27, 92, 73, 'Et saepe rem.', '1563265202', 1),
(620, 2797, 11, 127, 40, 'Dolor odio.', '1563265202', 0),
(621, 9023, 167, 100, 135, 'Aliquam non cumque.', '1563265202', 1),
(622, 8743, 159, 72, 134, 'Sed quis vitae totam.', '1563265202', 0),
(623, 5904, 173, 171, 21, 'Cupiditate perspiciatis repellendus.', '1563265202', 0),
(624, 4814, 188, 17, 37, 'Qui deleniti incidunt autem.', '1563265202', 0),
(625, 3262, 67, 6, 102, 'A qui suscipit laborum.', '1563265202', 1),
(626, 4160, 67, 168, 167, 'Rerum totam inventore.', '1563265203', 1),
(627, 9167, 100, 177, 4, 'Sint.', '1563265203', 1),
(628, 4913, 141, 35, 18, 'Rerum earum temporibus laborum.', '1563265203', 1),
(629, 8330, 147, 70, 195, 'Quia et et suscipit quod.', '1563265203', 1),
(630, 7255, 159, 138, 137, 'Quo necessitatibus enim tempora.', '1563265203', 1),
(631, 8381, 62, 134, 60, 'Sint qui voluptas.', '1563265203', 1),
(632, 6257, 53, 142, 168, 'Assumenda non dolores ex.', '1563265203', 1),
(633, 3327, 182, 72, 129, 'Unde rerum dolor aut porro.', '1563265203', 0),
(634, 4861, 87, 43, 38, 'Laboriosam nesciunt.', '1563265203', 0),
(635, 5857, 173, 101, 43, 'Iusto quas doloremque consequatur.', '1563265203', 0),
(636, 1653, 180, 105, 176, 'Qui inventore.', '1563265203', 1),
(637, 4330, 117, 58, 4, 'Pariatur delectus ducimus libero.', '1563265203', 0),
(638, 2535, 203, 129, 98, 'Rerum a.', '1563265203', 1),
(639, 7302, 155, 159, 57, 'Velit excepturi non eligendi eum qui.', '1563265203', 0),
(640, 4819, 80, 32, 150, 'In illo minus labore similique repudiandae.', '1563265203', 0),
(641, 5834, 25, 85, 115, 'Aut quia.', '1563265203', 1),
(642, 541, 33, 136, 159, 'Rerum ut.', '1563265203', 0),
(643, 7504, 199, 83, 150, 'Earum laudantium asperiores error rerum maiores.', '1563265203', 1),
(644, 5364, 39, 91, 36, 'A ipsum itaque saepe.', '1563265203', 1),
(645, 7293, 175, 104, 85, 'Eos debitis aut.', '1563265203', 0),
(646, 5719, 74, 19, 175, 'Minima ratione incidunt suscipit.', '1563265203', 1),
(647, 471, 19, 25, 198, 'Optio nisi aspernatur omnis nam.', '1563265203', 1),
(648, 2556, 147, 122, 19, 'Quos aut.', '1563265203', 0),
(649, 5454, 23, 2, 42, 'Eligendi esse.', '1563265203', 0),
(650, 1033, 144, 102, 38, 'Harum consequuntur quidem.', '1563265203', 0),
(651, 4064, 24, 34, 153, 'Deserunt.', '1563265203', 1),
(652, 3825, 133, 201, 122, 'Voluptas et laboriosam.', '1563265203', 1),
(653, 3944, 160, 163, 128, 'Ad eum deserunt dolores.', '1563265203', 1),
(654, 5549, 89, 147, 201, 'Reprehenderit.', '1563265203', 0),
(655, 1523, 20, 145, 116, 'Vel voluptas.', '1563265203', 0),
(656, 7230, 118, 10, 165, 'Facilis maiores veniam exercitationem.', '1563265203', 1),
(657, 104, 26, 185, 39, 'Expedita.', '1563265203', 0),
(658, 4702, 30, 82, 3, 'Vel qui necessitatibus qui dolores.', '1563265203', 1),
(659, 1496, 75, 178, 73, 'Quia sunt.', '1563265203', 0),
(660, 9029, 89, 190, 3, 'Doloremque occaecati facilis voluptatem est.', '1563265203', 1),
(661, 2151, 168, 102, 12, 'Possimus voluptate.', '1563265203', 1),
(662, 677, 200, 69, 103, 'Est.', '1563265203', 1),
(663, 8359, 85, 140, 122, 'Consequatur eos quod.', '1563265203', 1),
(664, 3959, 30, 112, 1, 'Aperiam odit nesciunt consequuntur.', '1563265203', 0),
(665, 3904, 135, 95, 26, 'Veritatis consectetur dicta eum.', '1563265203', 0),
(666, 6499, 50, 101, 53, 'Ea sed voluptas.', '1563265203', 0),
(667, 6239, 134, 192, 120, 'Quis tenetur a.', '1563265203', 1),
(668, 6177, 24, 154, 40, 'Illo cupiditate assumenda.', '1563265203', 0),
(669, 7327, 146, 178, 147, 'At nisi magnam animi.', '1563265203', 1),
(670, 1158, 91, 62, 168, 'Consequatur illo eum sapiente est.', '1563265203', 1),
(671, 9682, 27, 56, 202, 'Consectetur nisi.', '1563265203', 1),
(672, 2390, 26, 178, 146, 'Perspiciatis corrupti.', '1563265203', 0),
(673, 1342, 19, 129, 105, 'Voluptatem assumenda quis sed dolores ut.', '1563265203', 0),
(674, 1246, 151, 154, 99, 'Est voluptatem repellat.', '1563265203', 0),
(675, 4070, 94, 125, 2, 'Nostrum.', '1563265203', 0),
(676, 5452, 133, 37, 124, 'Voluptate omnis.', '1563265203', 1),
(677, 7868, 187, 148, 143, 'Suscipit aut.', '1563265203', 0),
(678, 9036, 159, 13, 135, 'Ut.', '1563265203', 0),
(679, 5703, 72, 5, 177, 'Et vel aut perferendis tenetur.', '1563265203', 0),
(680, 6843, 7, 179, 139, 'Exercitationem enim ut.', '1563265203', 0),
(681, 201, 71, 45, 189, 'Ex ut.', '1563265203', 1),
(682, 9679, 177, 91, 175, 'Illum corporis sed explicabo.', '1563265203', 0),
(683, 2953, 161, 12, 27, 'Animi totam.', '1563265203', 0),
(684, 7549, 163, 125, 76, 'Labore reiciendis placeat.', '1563265203', 0),
(685, 9430, 127, 173, 63, 'Nostrum.', '1563265203', 0),
(686, 3627, 110, 97, 11, 'Qui repellat.', '1563265203', 1),
(687, 5224, 189, 98, 171, 'Eligendi molestiae nostrum reiciendis recusandae maxime.', '1563265203', 0),
(688, 1060, 182, 33, 25, 'Recusandae ad.', '1563265203', 1),
(689, 6318, 26, 40, 145, 'Voluptatem quis ea sed labore quia.', '1563265203', 0),
(690, 4607, 44, 154, 157, 'Animi doloremque sapiente.', '1563265203', 0),
(691, 6499, 42, 63, 81, 'Ipsa quia consequatur.', '1563265203', 0),
(692, 2334, 122, 200, 123, 'Ut aliquam veniam.', '1563265203', 1),
(693, 3840, 81, 61, 86, 'Veritatis assumenda ullam.', '1563265203', 1),
(694, 7940, 51, 201, 148, 'Quidem qui.', '1563265203', 0),
(695, 5918, 97, 132, 117, 'Et odit quis ut.', '1563265203', 0),
(696, 9396, 157, 94, 81, 'Sed facilis minima numquam sapiente.', '1563265203', 0),
(697, 6108, 150, 15, 80, 'Qui sunt.', '1563265203', 0),
(698, 4753, 121, 137, 86, 'Voluptatum reprehenderit enim.', '1563265203', 1),
(699, 7375, 58, 174, 3, 'Ipsum illo ducimus repellendus.', '1563265203', 0),
(700, 8580, 156, 91, 168, 'Aut esse nihil.', '1563265203', 1),
(701, 1784, 176, 36, 51, 'Molestias sapiente est.', '1563265203', 1),
(702, 6738, 62, 163, 47, 'Libero.', '1563265203', 1),
(703, 1123, 176, 113, 31, 'Et.', '1563265203', 0),
(704, 5515, 197, 44, 53, 'Odio vel rem.', '1563265203', 1),
(705, 8488, 95, 125, 106, 'Sapiente reiciendis.', '1563265203', 0),
(706, 6253, 97, 179, 71, 'Cupiditate tenetur excepturi non.', '1563265203', 0),
(707, 1708, 119, 104, 98, 'Occaecati dolores voluptate quis.', '1563265203', 1),
(708, 9431, 124, 153, 22, 'Inventore sequi.', '1563265203', 1),
(709, 4132, 3, 143, 42, 'Provident.', '1563265203', 1),
(710, 784, 26, 63, 88, 'Ratione.', '1563265203', 0),
(711, 6852, 65, 3, 110, 'Culpa veniam incidunt cumque.', '1563265203', 1),
(712, 7476, 99, 45, 160, 'Velit.', '1563265203', 1),
(713, 6856, 201, 51, 74, 'Vitae mollitia error.', '1563265203', 0),
(714, 3209, 99, 167, 190, 'Cum excepturi qui.', '1563265203', 1),
(715, 7277, 119, 24, 25, 'Quo eos.', '1563265203', 1),
(716, 2056, 71, 68, 1, 'Suscipit illo.', '1563265203', 0),
(717, 5875, 195, 131, 199, 'Minima.', '1563265203', 0),
(718, 6971, 53, 104, 40, 'Odio eligendi velit dolores.', '1563265203', 0),
(719, 5667, 93, 47, 22, 'Excepturi molestiae quaerat a.', '1563265203', 1),
(720, 8848, 9, 81, 63, 'Illum cumque et iusto.', '1563265203', 0),
(721, 8987, 79, 97, 38, 'Animi qui sunt saepe.', '1563265203', 0),
(722, 8100, 92, 9, 110, 'Excepturi dolores qui fuga.', '1563265204', 1),
(723, 6818, 193, 123, 179, 'Corporis eos doloribus voluptas vero.', '1563265204', 1),
(724, 5453, 64, 158, 73, 'Qui sit sed.', '1563265204', 0),
(725, 6480, 63, 106, 42, 'Qui iste eos.', '1563265204', 1),
(726, 3579, 109, 140, 114, 'Ab optio dicta.', '1563265204', 1),
(727, 3624, 142, 196, 135, 'Non nobis temporibus neque.', '1563265204', 0),
(728, 980, 54, 41, 70, 'Earum voluptatem numquam.', '1563265204', 1),
(729, 1902, 37, 200, 9, 'Voluptas aut itaque voluptatem sunt.', '1563265204', 1),
(730, 917, 134, 73, 121, 'Rem ut.', '1563265204', 1),
(731, 2734, 71, 93, 92, 'Non aspernatur pariatur.', '1563265204', 0),
(732, 674, 26, 184, 29, 'Quas facilis labore.', '1563265204', 0),
(733, 3462, 161, 25, 16, 'Voluptate qui autem.', '1563265204', 0),
(734, 4285, 156, 190, 85, 'Explicabo dolorem suscipit.', '1563265204', 0),
(735, 1488, 109, 152, 178, 'Saepe.', '1563265204', 1),
(736, 4035, 157, 193, 173, 'Sequi repellendus rerum.', '1563265204', 0),
(737, 2017, 23, 13, 116, 'Sit dicta molestias quia.', '1563265204', 1),
(738, 9849, 1, 203, 122, 'At distinctio.', '1563265204', 0),
(739, 4785, 100, 140, 10, 'Velit iure libero ut error.', '1563265204', 1),
(740, 5547, 85, 5, 36, 'Assumenda consequuntur.', '1563265204', 1),
(741, 2068, 131, 132, 47, 'Ea totam et accusamus impedit voluptas.', '1563265204', 0),
(742, 3527, 122, 117, 27, 'Nam animi voluptatem.', '1563265204', 0),
(743, 2992, 57, 151, 165, 'Recusandae voluptas.', '1563265204', 0),
(744, 9485, 41, 27, 174, 'Deleniti id.', '1563265204', 1),
(745, 4993, 42, 80, 26, 'Rem harum dolores ut.', '1563265204', 1),
(746, 6227, 109, 92, 151, 'Voluptatem voluptatum aut eligendi culpa perspiciatis.', '1563265204', 1),
(747, 1855, 157, 98, 133, 'Laudantium omnis.', '1563265204', 1),
(748, 8669, 52, 74, 40, 'Ea dolorum harum aspernatur voluptatem placeat.', '1563265204', 1),
(749, 1998, 15, 58, 39, 'Culpa id veniam et eum.', '1563265204', 0),
(750, 882, 162, 40, 8, 'Qui debitis eos.', '1563265204', 1),
(751, 3027, 45, 58, 105, 'Odio commodi consequatur.', '1563265204', 1),
(752, 1696, 107, 68, 156, 'Magnam sed.', '1563265204', 1),
(753, 4128, 63, 42, 66, 'Ut est laborum rerum.', '1563265204', 1),
(754, 9603, 90, 53, 20, 'Doloremque ipsum.', '1563265204', 0),
(755, 4552, 22, 69, 4, 'Sit consequatur et ducimus officia.', '1563265204', 1),
(756, 5321, 186, 121, 139, 'Ex velit nihil aperiam fugit nostrum.', '1563265204', 0),
(757, 8021, 152, 2, 167, 'Molestiae.', '1563265204', 1),
(758, 8110, 47, 63, 152, 'Tempora iure et.', '1563265204', 0),
(759, 5236, 74, 141, 177, 'Perferendis.', '1563265204', 1),
(760, 8647, 195, 29, 155, 'Inventore blanditiis fugiat.', '1563265204', 0),
(761, 2572, 66, 57, 131, 'Alias laudantium natus.', '1563265204', 1),
(762, 188, 196, 154, 190, 'Eos quia est quibusdam.', '1563265204', 1);
INSERT INTO `messages` (`id`, `messageId`, `userId`, `fromId`, `toId`, `messageText`, `dateSent`, `enable_reply`) VALUES
(763, 1967, 153, 141, 112, 'Corrupti consequatur veniam quia.', '1563265204', 1),
(764, 2959, 139, 61, 155, 'Voluptas corrupti officiis.', '1563265204', 0),
(765, 7314, 144, 106, 25, 'Molestiae aspernatur rerum molestiae.', '1563265204', 0),
(766, 532, 5, 203, 31, 'Voluptatem atque animi eaque necessitatibus.', '1563265204', 1),
(767, 751, 83, 197, 85, 'Blanditiis.', '1563265204', 1),
(768, 7513, 73, 185, 47, 'Et qui sunt ex reiciendis.', '1563265204', 0),
(769, 8161, 189, 128, 63, 'Accusamus omnis.', '1563265204', 0),
(770, 5508, 185, 40, 8, 'Assumenda modi aut.', '1563265204', 1),
(771, 2906, 61, 100, 167, 'Minus explicabo aperiam.', '1563265204', 1),
(772, 3125, 162, 41, 125, 'Dignissimos.', '1563265204', 0),
(773, 8417, 53, 65, 48, 'Veritatis illum.', '1563265204', 1),
(774, 2643, 95, 117, 33, 'Perspiciatis est.', '1563265204', 0),
(775, 2503, 128, 9, 162, 'Beatae voluptatem nesciunt officia.', '1563265204', 1),
(776, 2957, 63, 107, 146, 'Quisquam aut facere.', '1563265204', 0),
(777, 4142, 151, 155, 62, 'Blanditiis necessitatibus.', '1563265204', 0),
(778, 9866, 2, 46, 154, 'Velit distinctio officiis.', '1563265205', 1),
(779, 1224, 181, 117, 111, 'Ut autem natus.', '1563265205', 1),
(780, 3921, 169, 36, 161, 'Ut velit ad.', '1563265205', 1),
(781, 9670, 141, 84, 148, 'Amet voluptates.', '1563265205', 1),
(782, 5513, 41, 133, 126, 'Quod neque.', '1563265205', 1),
(783, 5242, 20, 168, 75, 'Dolorem est.', '1563265205', 0),
(784, 3695, 88, 202, 126, 'Rem est ut unde tempore.', '1563265205', 1),
(785, 3603, 15, 179, 191, 'Similique et quas.', '1563265205', 1),
(786, 1924, 62, 71, 60, 'Autem vel magni voluptatem.', '1563265205', 0),
(787, 9286, 141, 190, 153, 'Animi quis quasi.', '1563265205', 0),
(788, 8484, 1, 193, 105, 'Repudiandae eligendi.', '1563265205', 0),
(789, 6307, 103, 198, 114, 'Dolores.', '1563265205', 0),
(790, 5048, 10, 190, 189, 'Harum.', '1563265205', 1),
(791, 7330, 172, 9, 196, 'Alias voluptatem ab dolores.', '1563265205', 1),
(792, 5629, 170, 7, 155, 'Consectetur commodi velit voluptas suscipit.', '1563265205', 1),
(793, 9593, 97, 87, 77, 'Est.', '1563265205', 0),
(794, 5215, 173, 114, 32, 'Ut dicta.', '1563265205', 1),
(795, 5304, 94, 187, 60, 'Debitis omnis libero.', '1563265205', 1),
(796, 9518, 80, 43, 191, 'Hic soluta tempore sunt.', '1563265205', 0),
(797, 8861, 97, 113, 56, 'Qui fuga voluptatem.', '1563265205', 0),
(798, 4388, 29, 50, 23, 'Molestias in sed.', '1563265205', 0),
(799, 4764, 159, 42, 85, 'Amet.', '1563265205', 0),
(800, 7441, 49, 116, 187, 'Laborum eum.', '1563265205', 0),
(801, 5338, 32, 32, 70, 'Perferendis ea occaecati eligendi.', '1563265205', 0),
(802, 5297, 127, 201, 27, 'Repellat ipsa repellendus temporibus.', '1563265205', 1),
(803, 6616, 110, 105, 162, 'Quia.', '1563265205', 1),
(804, 1602, 141, 110, 184, 'Voluptatibus impedit ea enim.', '1563265205', 0),
(805, 6627, 69, 79, 203, 'Deleniti.', '1563265205', 1),
(806, 5027, 68, 120, 39, 'Voluptas nihil ipsum amet amet sint.', '1563265205', 0),
(807, 8453, 40, 2, 177, 'Et.', '1563265205', 0),
(808, 1324, 100, 59, 180, 'Et.', '1563265205', 0),
(809, 9133, 70, 47, 163, 'Labore consequatur exercitationem.', '1563265205', 1),
(810, 4808, 57, 73, 196, 'Autem nihil labore facilis earum.', '1563265205', 0),
(811, 3854, 43, 4, 107, 'Autem dolorem accusamus impedit culpa.', '1563265205', 1),
(812, 6649, 184, 85, 133, 'Sunt praesentium dolor.', '1563265205', 0),
(813, 9741, 155, 187, 7, 'Provident eligendi et harum.', '1563265205', 0),
(814, 547, 77, 160, 21, 'Tenetur numquam omnis aut.', '1563265205', 1),
(815, 172, 164, 195, 15, 'Provident et ut.', '1563265205', 0),
(816, 5573, 34, 62, 189, 'Et quas quia consequatur est.', '1563265205', 1),
(817, 8652, 28, 154, 200, 'Ducimus.', '1563265205', 0),
(818, 4707, 7, 90, 198, 'Esse sint fugiat sit.', '1563265205', 0),
(819, 257, 189, 187, 20, 'Ipsam.', '1563265205', 1),
(820, 1672, 1, 112, 202, 'Facere cupiditate.', '1563265205', 1),
(821, 3063, 154, 90, 1, 'Nam voluptatem repellendus.', '1563265205', 1),
(822, 4814, 99, 45, 61, 'Et animi et.', '1563265205', 1),
(823, 7206, 83, 26, 107, 'Laboriosam qui qui.', '1563265205', 0),
(824, 8552, 172, 111, 16, 'Voluptas nam.', '1563265205', 1),
(825, 5275, 203, 168, 149, 'Autem accusamus aut.', '1563265205', 0),
(826, 3758, 135, 96, 163, 'Qui ea ut.', '1563265206', 0),
(827, 3155, 145, 85, 142, 'Sint.', '1563265206', 0),
(828, 9299, 30, 90, 4, 'Est ipsum molestiae.', '1563265206', 1),
(829, 6651, 67, 11, 175, 'Repudiandae voluptates perferendis.', '1563265206', 0),
(830, 9490, 76, 12, 55, 'Quo quo vitae ut.', '1563265206', 1),
(831, 6650, 151, 146, 177, 'Consectetur.', '1563265206', 0),
(832, 118, 132, 128, 81, 'Autem quasi.', '1563265206', 1),
(833, 605, 176, 183, 177, 'Voluptas sit sint quos corrupti.', '1563265206', 1),
(834, 14, 141, 157, 43, 'Et est voluptas.', '1563265206', 1),
(835, 1144, 148, 30, 82, 'Quo modi nihil.', '1563265206', 1),
(836, 9001, 11, 23, 27, 'Non modi reprehenderit.', '1563265206', 0),
(837, 4403, 145, 161, 81, 'Sit voluptates error dolore.', '1563265206', 0),
(838, 437, 65, 200, 148, 'Sunt quia cupiditate.', '1563265206', 0),
(839, 5117, 176, 182, 67, 'Quidem itaque.', '1563265206', 0),
(840, 5767, 96, 147, 105, 'Amet odit magnam.', '1563265206', 0),
(841, 4484, 102, 109, 175, 'Quasi expedita odio repudiandae.', '1563265206', 0),
(842, 9443, 128, 108, 14, 'Porro quia.', '1563265206', 0),
(843, 184, 167, 136, 91, 'Et dicta.', '1563265206', 0),
(844, 9021, 58, 92, 30, 'Fugiat in.', '1563265206', 1),
(845, 6713, 38, 4, 54, 'Similique consequatur laborum velit eaque.', '1563265206', 1),
(846, 1097, 171, 21, 62, 'Fuga provident est.', '1563265206', 1),
(847, 415, 84, 9, 168, 'Velit minus assumenda maxime.', '1563265206', 0),
(848, 9359, 183, 191, 22, 'Sequi accusantium natus accusamus minus non.', '1563265206', 0),
(849, 713, 28, 91, 58, 'Ullam eius.', '1563265206', 0),
(850, 4569, 40, 145, 9, 'Eligendi laborum quis.', '1563265206', 1),
(851, 8006, 133, 158, 158, 'Dolorem cumque corrupti aut sequi aliquid.', '1563265206', 1),
(852, 4405, 163, 76, 185, 'Nisi incidunt perspiciatis ex.', '1563265206', 1),
(853, 3031, 86, 88, 25, 'Nihil molestiae consequuntur voluptatum placeat.', '1563265206', 1),
(854, 6282, 35, 147, 191, 'Modi.', '1563265206', 0),
(855, 6750, 95, 8, 78, 'Inventore qui voluptas.', '1563265206', 1),
(856, 2498, 159, 63, 67, 'Ratione sint debitis harum quia occaecati.', '1563265206', 1),
(857, 6355, 61, 25, 133, 'Dignissimos et dolor veritatis.', '1563265206', 1),
(858, 7202, 97, 168, 132, 'Id ipsum.', '1563265206', 0),
(859, 6992, 10, 30, 65, 'Inventore enim sequi fuga illo facere.', '1563265206', 1),
(860, 9529, 22, 49, 95, 'Non et et ex praesentium.', '1563265206', 0),
(861, 5116, 154, 109, 140, 'Repudiandae.', '1563265206', 1),
(862, 198, 142, 73, 195, 'Ex saepe officia.', '1563265206', 1),
(863, 7323, 157, 117, 136, 'Et suscipit sed repudiandae qui eligendi.', '1563265206', 0),
(864, 3163, 191, 55, 10, 'Id in dolorum.', '1563265206', 1),
(865, 717, 45, 83, 173, 'Eaque eveniet quia.', '1563265206', 0),
(866, 2799, 173, 92, 9, 'Et magni error voluptatibus saepe.', '1563265206', 0),
(867, 2379, 176, 30, 75, 'Perferendis odit veritatis.', '1563265206', 1),
(868, 9058, 84, 195, 168, 'Magnam beatae cum eum.', '1563265206', 0),
(869, 998, 180, 3, 79, 'Velit tempore officia.', '1563265206', 0),
(870, 7953, 68, 18, 165, 'Qui cupiditate.', '1563265206', 1),
(871, 833, 33, 111, 92, 'Accusantium aspernatur voluptatem.', '1563265206', 0),
(872, 2847, 91, 168, 28, 'Rerum sed quaerat.', '1563265206', 0),
(873, 2259, 65, 5, 91, 'Aspernatur ut.', '1563265206', 1),
(874, 8502, 172, 159, 140, 'Sapiente iure est eos in voluptatum.', '1563265206', 0),
(875, 8697, 33, 3, 19, 'Nulla ratione dolorum inventore.', '1563265207', 1),
(876, 2270, 176, 118, 123, 'Eaque eaque et nihil.', '1563265207', 0),
(877, 6267, 79, 175, 65, 'Assumenda esse ratione praesentium vel id.', '1563265207', 1),
(878, 5210, 122, 77, 12, 'Nisi sed facilis aut et.', '1563265207', 1),
(879, 847, 22, 25, 80, 'Minus neque optio.', '1563265207', 0),
(880, 4346, 53, 79, 184, 'Incidunt hic architecto.', '1563265207', 0),
(881, 5276, 181, 99, 143, 'Provident doloremque adipisci.', '1563265207', 0),
(882, 8841, 63, 70, 159, 'Assumenda est et est.', '1563265207', 1),
(883, 537, 185, 42, 54, 'Perferendis nesciunt et qui.', '1563265207', 0),
(884, 5038, 175, 56, 89, 'Sint autem.', '1563265207', 1),
(885, 3460, 58, 110, 87, 'Hic repellat consequuntur.', '1563265207', 1),
(886, 5131, 121, 62, 121, 'Enim ab repudiandae quia.', '1563265207', 1),
(887, 8855, 188, 130, 98, 'Deleniti laborum ex.', '1563265207', 0),
(888, 3072, 102, 52, 195, 'Aut iure fuga esse debitis molestiae.', '1563265207', 1),
(889, 8815, 190, 45, 177, 'Itaque.', '1563265207', 0),
(890, 9469, 142, 8, 60, 'Dolorem nisi pariatur ex.', '1563265207', 0),
(891, 9031, 197, 127, 54, 'Est dolor doloribus est.', '1563265207', 1),
(892, 718, 162, 122, 9, 'Esse ut assumenda accusamus.', '1563265207', 0),
(893, 2196, 27, 116, 30, 'Ullam facilis.', '1563265207', 0),
(894, 6392, 47, 181, 138, 'Repudiandae veniam molestias repellat.', '1563265207', 0),
(895, 3194, 94, 182, 201, 'Nulla totam repellendus qui aut.', '1563265207', 1),
(896, 7557, 164, 101, 43, 'Totam voluptatem eos veritatis.', '1563265207', 0),
(897, 2742, 142, 113, 149, 'Corporis quod.', '1563265207', 1),
(898, 8126, 155, 201, 110, 'Ea pariatur est.', '1563265207', 0),
(899, 799, 123, 145, 55, 'Sunt velit.', '1563265207', 0),
(900, 1682, 84, 10, 155, 'Et ipsum nam.', '1563265207', 1),
(901, 9835, 82, 142, 115, 'Vel earum.', '1563265207', 0),
(902, 6596, 167, 41, 69, 'Nam et vel aperiam voluptate.', '1563265207', 0),
(903, 2821, 45, 119, 187, 'Voluptatem corrupti repellendus voluptatibus itaque odio.', '1563265207', 0),
(904, 4818, 139, 178, 164, 'Sed quis rerum quibusdam.', '1563265207', 0),
(905, 5088, 12, 154, 159, 'Laborum deserunt ducimus velit.', '1563265207', 0),
(906, 6671, 173, 168, 78, 'Expedita omnis quo dolor dicta.', '1563265207', 0),
(907, 5998, 174, 190, 36, 'Et harum nesciunt.', '1563265207', 0),
(908, 5601, 27, 149, 85, 'Nostrum laborum reiciendis.', '1563265207', 1),
(909, 8833, 161, 169, 37, 'Veniam aut.', '1563265207', 1),
(910, 646, 39, 131, 82, 'Eius optio est deserunt enim.', '1563265207', 0),
(911, 8126, 155, 92, 126, 'Saepe ratione ea.', '1563265207', 1),
(912, 656, 99, 64, 195, 'Dolor ut magni ut.', '1563265207', 1),
(913, 5090, 87, 144, 26, 'Id repudiandae blanditiis quas.', '1563265207', 1),
(914, 1350, 113, 61, 158, 'Debitis nobis qui nisi officia.', '1563265207', 1),
(915, 2382, 124, 107, 165, 'Corrupti sequi sint.', '1563265207', 0),
(916, 2592, 177, 107, 50, 'Dolor.', '1563265207', 0),
(917, 4373, 183, 84, 101, 'Voluptatem vitae tempora.', '1563265207', 1),
(918, 5467, 149, 113, 105, 'Sint ex et.', '1563265207', 1),
(919, 6588, 203, 171, 76, 'Repellat quasi omnis occaecati qui.', '1563265207', 1),
(920, 9978, 76, 17, 110, 'Eum.', '1563265207', 0),
(921, 4735, 51, 47, 95, 'Fuga nostrum.', '1563265207', 1),
(922, 1319, 33, 21, 102, 'Possimus culpa ut quasi officiis.', '1563265207', 0),
(923, 3782, 32, 25, 54, 'Quia nesciunt in.', '1563265207', 0),
(924, 1640, 67, 99, 170, 'Labore iusto.', '1563265207', 0),
(925, 3658, 118, 188, 200, 'Qui dolores.', '1563265207', 0),
(926, 4938, 197, 153, 190, 'Commodi facere.', '1563265207', 1),
(927, 2855, 86, 22, 4, 'Et nobis amet saepe.', '1563265207', 0),
(928, 4120, 58, 28, 31, 'Ducimus maiores perspiciatis vel qui in.', '1563265207', 1),
(929, 9835, 78, 96, 2, 'Cupiditate ullam nihil sint.', '1563265207', 1),
(930, 412, 106, 115, 146, 'Eum.', '1563265207', 0),
(931, 2416, 59, 41, 149, 'Molestias earum.', '1563265207', 1),
(932, 6612, 38, 189, 139, 'Magni.', '1563265207', 0),
(933, 7770, 37, 54, 52, 'Ut at omnis.', '1563265207', 1),
(934, 3290, 96, 15, 50, 'Sit velit quia rem aperiam.', '1563265207', 1),
(935, 6631, 30, 13, 156, 'Et consequuntur quis beatae.', '1563265207', 0),
(936, 1758, 27, 9, 98, 'Numquam tenetur ea.', '1563265207', 0),
(937, 8891, 96, 3, 99, 'Repellendus est quis.', '1563265207', 1),
(938, 9346, 57, 167, 59, 'Est id iure.', '1563265207', 1),
(939, 1817, 100, 107, 66, 'Consequatur culpa ad recusandae officiis.', '1563265207', 1),
(940, 4181, 17, 90, 148, 'Impedit tempore totam.', '1563265207', 0),
(941, 4154, 27, 201, 146, 'Magni autem qui.', '1563265207', 1),
(942, 4179, 179, 121, 148, 'Quis dignissimos exercitationem animi ipsum soluta.', '1563265207', 0),
(943, 8694, 171, 192, 116, 'Nobis accusantium.', '1563265207', 1),
(944, 1699, 83, 28, 67, 'Cupiditate ratione.', '1563265207', 1),
(945, 4680, 160, 166, 155, 'Numquam impedit.', '1563265207', 0),
(946, 4131, 133, 56, 4, 'Veniam magnam explicabo dolores sint hic.', '1563265207', 0),
(947, 2161, 143, 69, 47, 'Quis nihil.', '1563265207', 1),
(948, 5967, 201, 180, 164, 'Excepturi necessitatibus.', '1563265207', 1),
(949, 9685, 94, 155, 12, 'Et repellat dicta occaecati commodi.', '1563265207', 0),
(950, 1160, 192, 194, 164, 'Quia nostrum.', '1563265207', 0),
(951, 9261, 27, 95, 129, 'Optio quia tempora.', '1563265207', 0),
(952, 181, 139, 194, 175, 'Adipisci doloremque cupiditate excepturi.', '1563265207', 1),
(953, 1634, 156, 173, 14, 'Quaerat suscipit.', '1563265207', 0),
(954, 3488, 81, 130, 95, 'Tempora eum qui eum perferendis.', '1563265207', 1),
(955, 9298, 40, 196, 152, 'Enim optio.', '1563265207', 1),
(956, 2591, 158, 27, 26, 'Qui facilis ut.', '1563265207', 1),
(957, 8865, 194, 82, 179, 'Quidem doloremque quasi enim.', '1563265207', 0),
(958, 1782, 154, 163, 57, 'Quae assumenda similique.', '1563265207', 0),
(959, 9739, 194, 140, 96, 'Quidem voluptas recusandae.', '1563265207', 1),
(960, 2113, 79, 184, 89, 'Quia nemo dolorem.', '1563265207', 0),
(961, 1573, 34, 199, 73, 'Ut vel magni placeat vel quia.', '1563265207', 0),
(962, 9465, 91, 88, 107, 'Id ea eos.', '1563265207', 1),
(963, 365, 109, 65, 194, 'Ipsam voluptatem.', '1563265207', 1),
(964, 7007, 109, 188, 56, 'Distinctio voluptatum.', '1563265207', 0),
(965, 8424, 179, 30, 67, 'Voluptas consequuntur ad.', '1563265207', 0),
(966, 6370, 40, 177, 32, 'Consequuntur ullam molestias.', '1563265207', 1),
(967, 4567, 92, 194, 122, 'Veniam voluptatum.', '1563265207', 0),
(968, 8468, 8, 60, 81, 'Suscipit tenetur.', '1563265207', 1),
(969, 5564, 20, 138, 73, 'Praesentium eius impedit.', '1563265207', 0),
(970, 2505, 116, 173, 73, 'Voluptatem et pariatur a.', '1563265207', 1),
(971, 7039, 66, 104, 184, 'Ut sed ut repellat ab.', '1563265207', 1),
(972, 7378, 168, 92, 78, 'Voluptatem neque magnam vel cumque.', '1563265207', 1),
(973, 37, 28, 91, 65, 'Impedit quis.', '1563265207', 1),
(974, 9668, 13, 94, 5, 'Iusto omnis adipisci.', '1563265207', 1),
(975, 7752, 56, 195, 117, 'Quo quasi voluptas quidem.', '1563265207', 0),
(976, 244, 64, 111, 66, 'Velit ipsum.', '1563265207', 0),
(977, 6554, 121, 156, 96, 'Non.', '1563265207', 0),
(978, 8137, 203, 4, 53, 'Aliquam.', '1563265207', 0),
(979, 9948, 160, 117, 137, 'Inventore voluptas optio omnis.', '1563265207', 0),
(980, 798, 93, 63, 164, 'Sequi non cupiditate aut.', '1563265207', 1),
(981, 404, 5, 7, 32, 'Voluptas consectetur autem ipsum maiores aspernatur.', '1563265207', 1),
(982, 5478, 3, 85, 70, 'Voluptatem dolorem.', '1563265207', 0),
(983, 5233, 146, 42, 163, 'Nobis neque eum voluptatem.', '1563265207', 0),
(984, 5090, 20, 57, 73, 'Rerum velit.', '1563265207', 0),
(985, 2099, 101, 21, 41, 'Deleniti non blanditiis.', '1563265207', 0),
(986, 950, 31, 2, 95, 'Delectus animi officia excepturi.', '1563265207', 1),
(987, 8797, 48, 121, 176, 'Consequatur numquam repellendus.', '1563265207', 1),
(988, 8439, 188, 172, 180, 'Qui occaecati unde repellendus omnis qui.', '1563265208', 1),
(989, 9066, 135, 5, 188, 'Tempora consequatur commodi omnis.', '1563265208', 0),
(990, 2376, 102, 74, 101, 'Blanditiis autem.', '1563265208', 1),
(991, 9526, 149, 203, 77, 'Deleniti maxime quas tempore qui placeat.', '1563265208', 1),
(992, 5439, 48, 171, 159, 'Odit non omnis.', '1563265208', 0),
(993, 8411, 99, 55, 201, 'Molestiae dolorem ex.', '1563265208', 1),
(994, 5909, 115, 158, 200, 'Provident enim sit omnis.', '1563265208', 1),
(995, 6248, 33, 198, 154, 'Quia maxime ea animi fuga occaecati.', '1563265208', 1),
(996, 516, 67, 184, 136, 'Et ea aut quia.', '1563265208', 1),
(997, 5678, 26, 171, 142, 'Quos sint voluptatem.', '1563265208', 1),
(998, 431, 87, 101, 83, 'Reprehenderit dolore.', '1563265208', 0),
(999, 2447, 109, 142, 70, 'Eos nobis.', '1563265208', 1),
(1000, 497, 67, 52, 48, 'Et.', '1563265208', 0),
(1001, 4549, 42, 40, 166, 'Rerum quis quibusdam enim dolore voluptate.', '1563265208', 1),
(1002, 4727, 108, 105, 152, 'Eveniet ab nostrum.', '1563265208', 0),
(1003, 1588, 125, 109, 49, 'Maxime deserunt provident.', '1563265208', 1),
(1004, 5652, 157, 42, 44, 'Beatae velit consequatur accusamus.', '1563265208', 1),
(1005, 4926, 154, 18, 20, 'Quasi et ratione est necessitatibus.', '1563265208', 1),
(1006, 7431, 63, 125, 31, 'Et aut nulla eaque.', '1563265208', 1),
(1007, 2730, 165, 166, 33, 'Et atque dicta corrupti.', '1563265208', 0),
(1008, 9773, 140, 22, 24, 'Libero debitis ea.', '1563265208', 1),
(1009, 3923, 75, 56, 104, 'Cupiditate ut dolore eum.', '1563265208', 0),
(1010, 5181, 34, 152, 31, 'Et.', '1563265208', 0),
(1011, 5353, 90, 16, 182, 'Dolores.', '1563265208', 1),
(1012, 5084, 42, 68, 86, 'Quibusdam eligendi voluptas quibusdam.', '1563265208', 1),
(1013, 6697, 116, 161, 87, 'Dolor debitis.', '1563265208', 0),
(1014, 8158, 75, 165, 94, 'Ut.', '1563265208', 1),
(1015, 1860, 93, 82, 72, 'Et aut.', '1563265208', 0),
(1016, 4187, 189, 94, 175, 'Deleniti voluptatem voluptas a maiores cumque.', '1563265208', 0),
(1017, 5952, 175, 183, 192, 'Incidunt maiores culpa.', '1563265208', 1),
(1018, 9953, 89, 146, 147, 'Est eos ut dolor.', '1563265208', 1),
(1019, 3911, 61, 119, 190, 'Consequatur similique architecto eum.', '1563265208', 1),
(1020, 853, 35, 148, 107, 'Ea vel.', '1563265208', 0),
(1021, 5263, 137, 36, 4, 'Aut laudantium commodi.', '1563265208', 1),
(1022, 7426, 125, 124, 28, 'Qui.', '1563265208', 0),
(1023, 3219, 162, 125, 164, 'Autem et.', '1563265208', 0),
(1024, 5909, 116, 198, 75, 'Ut fugiat sed.', '1563265208', 1),
(1025, 4522, 55, 64, 39, 'Ut quibusdam voluptatem.', '1563265208', 1),
(1026, 7752, 73, 46, 86, 'Tempore occaecati est.', '1563265208', 0),
(1027, 6228, 38, 79, 106, 'Minima eveniet.', '1563265208', 1),
(1028, 7665, 44, 96, 158, 'Autem nulla aut.', '1563265208', 0),
(1029, 3538, 83, 100, 117, 'Repudiandae doloremque.', '1563265208', 1),
(1030, 2734, 35, 8, 21, 'Necessitatibus.', '1563265208', 0),
(1031, 5403, 59, 127, 88, 'Numquam autem doloribus.', '1563265208', 0),
(1032, 2054, 26, 203, 158, 'Explicabo sunt dolor voluptas nisi et.', '1563265208', 0),
(1033, 3551, 171, 81, 25, 'Voluptatem tempora nobis maxime dolores.', '1563265208', 1),
(1034, 3151, 100, 13, 87, 'Eum.', '1563265208', 1),
(1035, 2102, 132, 148, 194, 'Animi exercitationem.', '1563265208', 0),
(1036, 1396, 54, 36, 76, 'Ea illum.', '1563265208', 0),
(1037, 6187, 163, 97, 33, 'Nam placeat cupiditate omnis voluptatem.', '1563265208', 0),
(1038, 2364, 18, 164, 53, 'Quaerat blanditiis et.', '1563265208', 0),
(1039, 5448, 161, 11, 155, 'Sed laborum voluptas.', '1563265209', 0),
(1040, 1907, 72, 36, 11, 'Ut quo fugit animi.', '1563265209', 1),
(1041, 3737, 97, 116, 72, 'Provident et officiis sit.', '1563265209', 1),
(1042, 4652, 154, 77, 14, 'Facere omnis qui ducimus.', '1563265209', 1),
(1043, 5056, 50, 196, 171, 'Et recusandae voluptas qui.', '1563265209', 0),
(1044, 922, 152, 59, 7, 'Nostrum beatae optio.', '1563265209', 1),
(1045, 7561, 202, 153, 187, 'Id rem.', '1563265209', 1),
(1046, 1757, 20, 141, 118, 'Est incidunt deserunt rem.', '1563265209', 1),
(1047, 9107, 12, 15, 34, 'Dicta atque aut pariatur.', '1563265209', 1),
(1048, 4699, 11, 124, 128, 'Itaque consectetur ea.', '1563265209', 0),
(1049, 6738, 152, 5, 194, 'Possimus ipsam.', '1563265209', 0),
(1050, 426, 158, 42, 11, 'Ea eveniet soluta ab.', '1563265209', 0),
(1051, 2190, 198, 193, 133, 'Inventore in sunt.', '1563265209', 0),
(1052, 1843, 137, 168, 199, 'Praesentium corporis.', '1563265209', 0),
(1053, 7928, 50, 171, 16, 'Quia est temporibus atque.', '1563265209', 0),
(1054, 4268, 67, 203, 66, 'Nemo rerum minima voluptates quam quo.', '1563265209', 1),
(1055, 9992, 11, 178, 49, 'Corporis deleniti nulla.', '1563265209', 1),
(1056, 4434, 116, 45, 6, 'Modi rem quia.', '1563265209', 1),
(1057, 1388, 126, 129, 140, 'Aliquam commodi provident magni.', '1563265209', 1),
(1058, 3791, 93, 121, 3, 'Libero fugit.', '1563265209', 0),
(1059, 734, 143, 104, 39, 'Expedita.', '1563265209', 1),
(1060, 2871, 164, 108, 162, 'Quis ipsum.', '1563265209', 1),
(1061, 7421, 160, 121, 202, 'Recusandae sunt repellendus accusamus cum.', '1563265209', 1),
(1062, 9319, 64, 106, 92, 'Sint voluptatem autem.', '1563265209', 0),
(1063, 7033, 62, 48, 64, 'Impedit voluptatem id.', '1563265209', 1),
(1064, 8526, 32, 168, 81, 'Tempore laboriosam laborum dignissimos enim.', '1563265209', 1),
(1065, 6108, 33, 98, 102, 'Molestias sequi.', '1563265209', 0),
(1066, 6217, 44, 157, 65, 'Accusamus maxime.', '1563265209', 1),
(1067, 6297, 35, 137, 165, 'Odit modi repellat.', '1563265209', 0),
(1068, 9690, 3, 16, 115, 'Eaque dolores sit ut.', '1563265209', 1),
(1069, 2509, 125, 120, 137, 'Cum voluptatibus dicta iste recusandae culpa.', '1563265209', 1),
(1070, 5846, 20, 30, 101, 'Accusamus.', '1563265209', 0),
(1071, 820, 152, 148, 69, 'Sunt.', '1563265209', 1),
(1072, 2024, 52, 18, 78, 'Eos fugiat.', '1563265209', 1),
(1073, 4032, 68, 66, 200, 'Ex nostrum repellat ut.', '1563265209', 0),
(1074, 2600, 104, 187, 92, 'Nemo.', '1563265209', 0),
(1075, 265, 158, 151, 68, 'Ab.', '1563265209', 1),
(1076, 9981, 88, 152, 42, 'Nesciunt et.', '1563265209', 0),
(1077, 5663, 108, 54, 64, 'Aut accusantium maiores quidem.', '1563265209', 1),
(1078, 9490, 116, 192, 14, 'Impedit perferendis.', '1563265210', 1),
(1079, 2901, 63, 203, 64, 'Dolor a.', '1563265210', 0),
(1080, 9310, 181, 183, 65, 'Velit expedita.', '1563265210', 1),
(1081, 4096, 112, 141, 95, 'Iusto.', '1563265210', 1),
(1082, 6281, 18, 87, 194, 'Eaque vel quia quaerat.', '1563265210', 0),
(1083, 2353, 35, 17, 105, 'Aut.', '1563265210', 0),
(1084, 768, 51, 159, 5, 'Dolor fugiat ut.', '1563265210', 0),
(1085, 8594, 64, 106, 55, 'Dignissimos dolorem deserunt voluptatum doloribus.', '1563265210', 0),
(1086, 110, 113, 57, 33, 'Nobis blanditiis recusandae.', '1563265210', 0),
(1087, 3332, 149, 128, 100, 'Provident exercitationem impedit.', '1563265210', 0),
(1088, 5048, 170, 26, 19, 'Assumenda voluptatem voluptatibus.', '1563265210', 1),
(1089, 4080, 13, 133, 181, 'Iure laudantium.', '1563265210', 0),
(1090, 4438, 65, 187, 39, 'Aut sed suscipit.', '1563265210', 1),
(1091, 2467, 75, 25, 20, 'Assumenda tempore.', '1563265210', 1),
(1092, 9208, 32, 44, 12, 'Molestiae.', '1563265210', 0),
(1093, 6548, 147, 94, 146, 'Dolor laboriosam.', '1563265210', 1),
(1094, 5091, 40, 55, 84, 'Repellat rerum.', '1563265210', 1),
(1095, 4928, 99, 121, 140, 'Velit sed saepe atque facilis ipsum.', '1563265210', 0),
(1096, 4577, 184, 157, 69, 'Expedita totam et.', '1563265210', 1),
(1097, 6642, 61, 116, 25, 'Dolorem voluptas.', '1563265210', 0),
(1098, 3497, 21, 120, 33, 'Ut ea rem.', '1563265210', 1),
(1099, 4371, 49, 124, 16, 'Vel at corporis quae et.', '1563265210', 0),
(1100, 6947, 5, 146, 104, 'Reprehenderit sit fuga maxime.', '1563265210', 0),
(1101, 9703, 136, 190, 25, 'Tempore fuga.', '1563265210', 0),
(1102, 1179, 174, 174, 112, 'Non.', '1563265210', 0),
(1103, 6802, 138, 12, 24, 'Voluptatum consequatur.', '1563265210', 1),
(1104, 3484, 83, 3, 164, 'Voluptatem eveniet.', '1563265210', 0),
(1105, 8422, 95, 183, 13, 'Harum nesciunt velit.', '1563265210', 1),
(1106, 4283, 152, 176, 140, 'Quam inventore et exercitationem accusamus.', '1563265210', 1),
(1107, 4502, 173, 164, 14, 'Numquam commodi modi.', '1563265210', 1),
(1108, 6002, 145, 39, 37, 'Dolorem molestias quam.', '1563265210', 0),
(1109, 5157, 65, 58, 8, 'Dignissimos voluptas.', '1563265210', 0),
(1110, 7920, 5, 48, 24, 'Tempore laboriosam excepturi alias quibusdam.', '1563265210', 0),
(1111, 2248, 97, 60, 189, 'Quis dicta sit dolores.', '1563265210', 0),
(1112, 4977, 114, 40, 33, 'Sit quo voluptatem dignissimos.', '1563265210', 1),
(1113, 488, 197, 13, 114, 'Dolor ea quia.', '1563265210', 1),
(1114, 7143, 190, 16, 33, 'Mollitia saepe.', '1563265210', 0),
(1115, 5700, 30, 22, 150, 'Delectus illum.', '1563265211', 1),
(1116, 4470, 175, 197, 74, 'Aut placeat.', '1563265211', 0),
(1117, 4535, 95, 185, 180, 'Dolorum labore velit.', '1563265211', 0),
(1118, 7064, 18, 186, 83, 'Unde esse voluptatem.', '1563265211', 1),
(1119, 5597, 47, 102, 60, 'Odit aut.', '1563265211', 1),
(1120, 9674, 88, 139, 64, 'Sit aut.', '1563265211', 1),
(1121, 3299, 148, 157, 5, 'Inventore voluptatum beatae fuga.', '1563265211', 1),
(1122, 3975, 165, 50, 190, 'Amet pariatur.', '1563265211', 1),
(1123, 1237, 78, 61, 4, 'Blanditiis vel harum.', '1563265211', 0),
(1124, 8384, 199, 5, 138, 'Recusandae esse veritatis similique deserunt molestias.', '1563265211', 1),
(1125, 3231, 29, 130, 86, 'Maiores aut omnis.', '1563265211', 0),
(1126, 1243, 93, 118, 58, 'Et.', '1563265211', 1),
(1127, 1132, 100, 84, 122, 'Qui et perferendis mollitia.', '1563265211', 1),
(1128, 5997, 46, 170, 59, 'Sequi sit illum perferendis necessitatibus et.', '1563265211', 1),
(1129, 1537, 40, 149, 169, 'Pariatur est.', '1563265211', 0),
(1130, 3859, 147, 194, 190, 'Dolor.', '1563265211', 0),
(1131, 6496, 127, 138, 190, 'Fugiat autem.', '1563265211', 1),
(1132, 1188, 45, 61, 28, 'Quae ipsa.', '1563265211', 0),
(1133, 2410, 78, 67, 167, 'Voluptates blanditiis rem expedita.', '1563265211', 0),
(1134, 8299, 97, 158, 75, 'Neque quisquam nihil.', '1563265211', 1),
(1135, 2003, 154, 31, 15, 'Nulla eos dolorem distinctio consectetur.', '1563265211', 1),
(1136, 3476, 61, 173, 22, 'Voluptate ipsa autem.', '1563265211', 1),
(1137, 4755, 133, 134, 96, 'Et alias.', '1563265211', 1),
(1138, 5271, 129, 110, 149, 'Ab est illum pariatur.', '1563265211', 0),
(1139, 5730, 53, 52, 87, 'Quaerat voluptatibus expedita.', '1563265211', 1),
(1140, 1513, 143, 200, 18, 'Omnis iusto dolorem veritatis aperiam animi.', '1563265211', 0),
(1141, 6260, 180, 94, 19, 'Velit repellat.', '1563265211', 0),
(1142, 6507, 21, 119, 186, 'Fugit ratione.', '1563265211', 0),
(1143, 4187, 140, 5, 21, 'Cumque esse.', '1563265211', 0),
(1144, 8879, 59, 123, 199, 'Veniam.', '1563265211', 1),
(1145, 7447, 78, 3, 152, 'Voluptatibus aut odio a.', '1563265211', 1),
(1146, 2725, 162, 185, 10, 'Nobis velit ut.', '1563265211', 1),
(1147, 5027, 177, 141, 44, 'Eum possimus iste est.', '1563265211', 1),
(1148, 3455, 198, 138, 160, 'Quam ab et quis.', '1563265211', 1),
(1149, 8910, 194, 152, 47, 'Autem sint laboriosam iure.', '1563265211', 0),
(1150, 848, 157, 33, 24, 'Error.', '1563265211', 0),
(1151, 3858, 120, 63, 19, 'Cumque esse eligendi ipsa.', '1563265211', 0),
(1152, 6886, 134, 38, 129, 'Qui expedita.', '1563265211', 0),
(1153, 8052, 35, 20, 9, 'Officia dolorem consequatur.', '1563265212', 0),
(1154, 7066, 11, 160, 152, 'Voluptas nulla inventore.', '1563265212', 0),
(1155, 3842, 202, 201, 146, 'Quasi ut.', '1563265212', 0),
(1156, 2499, 50, 8, 103, 'Et eaque explicabo in.', '1563265212', 0),
(1157, 4259, 21, 49, 95, 'Nemo tenetur esse.', '1563265212', 1),
(1158, 5109, 76, 31, 188, 'Ut ut quisquam et quam.', '1563265212', 0),
(1159, 8564, 202, 37, 164, 'Quo est accusantium.', '1563265212', 1),
(1160, 5786, 196, 28, 150, 'Voluptas odit delectus placeat.', '1563265212', 0),
(1161, 9227, 42, 176, 95, 'Adipisci quia rerum vel.', '1563265212', 1),
(1162, 5816, 200, 169, 199, 'Et.', '1563265212', 1),
(1163, 1366, 26, 55, 18, 'Asperiores.', '1563265212', 1),
(1164, 8187, 27, 84, 151, 'Dolores facere et.', '1563265212', 0),
(1165, 4953, 193, 110, 172, 'Voluptatem id porro nihil.', '1563265212', 1),
(1166, 4380, 186, 23, 179, 'Totam.', '1563265212', 1),
(1167, 1866, 117, 81, 49, 'Quis quasi reiciendis.', '1563265212', 0),
(1168, 7963, 61, 100, 153, 'Et sunt in alias.', '1563265212', 1),
(1169, 5948, 113, 130, 8, 'Et sit.', '1563265212', 1),
(1170, 9204, 169, 45, 182, 'Nulla aliquid esse iusto sequi.', '1563265212', 1),
(1171, 6196, 134, 95, 54, 'Quia unde totam illo.', '1563265212', 1),
(1172, 9783, 47, 186, 28, 'Sint ut totam voluptatem ut.', '1563265212', 0),
(1173, 6447, 96, 40, 59, 'Unde nam.', '1563265212', 1),
(1174, 9003, 142, 6, 16, 'Consequatur perspiciatis.', '1563265212', 0),
(1175, 7444, 167, 17, 140, 'Quidem.', '1563265212', 0),
(1176, 8460, 31, 59, 25, 'Ut voluptas.', '1563265212', 0),
(1177, 977, 102, 192, 78, 'Nam vero quo.', '1563265212', 0),
(1178, 8572, 111, 161, 20, 'Natus repudiandae est itaque.', '1563265212', 1),
(1179, 88, 182, 102, 177, 'Voluptatem.', '1563265212', 0),
(1180, 8395, 198, 125, 172, 'Omnis et rerum.', '1563265212', 0),
(1181, 7886, 118, 23, 49, 'Voluptas quasi dicta.', '1563265212', 0),
(1182, 3655, 137, 6, 183, 'Corporis et.', '1563265212', 1),
(1183, 988, 9, 181, 8, 'Dolores eum ut occaecati labore.', '1563265212', 1),
(1184, 6695, 85, 82, 156, 'Rem saepe.', '1563265212', 1),
(1185, 8497, 4, 132, 82, 'Quos voluptatum et.', '1563265212', 1),
(1186, 693, 66, 124, 43, 'Consequatur tempore ut.', '1563265212', 1),
(1187, 1298, 55, 163, 5, 'Aut eveniet.', '1563265212', 0),
(1188, 1128, 103, 31, 198, 'Qui.', '1563265212', 0),
(1189, 8518, 182, 168, 27, 'Doloremque facilis sunt ullam molestiae commodi.', '1563265213', 1),
(1190, 8862, 150, 50, 126, 'Molestiae.', '1563265213', 0),
(1191, 2207, 157, 109, 7, 'Blanditiis voluptas aliquid accusantium suscipit.', '1563265213', 0),
(1192, 2452, 81, 27, 24, 'Cum provident nobis.', '1563265213', 1),
(1193, 9566, 159, 88, 81, 'Modi fugit adipisci nihil consectetur culpa.', '1563265213', 1),
(1194, 246, 144, 134, 174, 'Labore explicabo.', '1563265213', 0),
(1195, 1282, 142, 97, 186, 'Velit nemo consequatur.', '1563265213', 1),
(1196, 2856, 36, 83, 121, 'Quis reiciendis.', '1563265213', 0),
(1197, 2167, 18, 138, 119, 'Dolorum sit qui amet.', '1563265213', 0),
(1198, 7692, 195, 49, 35, 'Minus ad iure.', '1563265213', 1),
(1199, 9659, 106, 85, 1, 'Neque et nostrum ut itaque.', '1563265213', 0),
(1200, 5664, 156, 48, 9, 'Officiis quas.', '1563265213', 0),
(1201, 5087, 78, 157, 203, 'Sunt ipsum libero ut.', '1563265213', 1),
(1202, 4108, 59, 182, 18, 'Pariatur porro ut aut veniam molestias.', '1563265213', 0),
(1203, 2425, 83, 202, 36, 'Nesciunt.', '1563265213', 1),
(1204, 9056, 74, 154, 33, 'Iure est facere dolores.', '1563265213', 0),
(1205, 1047, 96, 151, 198, 'Eligendi aut mollitia omnis.', '1563265213', 1),
(1206, 5372, 27, 5, 114, 'Aut eveniet.', '1563265213', 1),
(1207, 9888, 70, 4, 175, 'Illo eos molestiae nobis iure.', '1563265213', 1),
(1208, 4526, 149, 103, 110, 'Et.', '1563265213', 0),
(1209, 4148, 145, 87, 147, 'Esse voluptatem.', '1563265213', 1),
(1210, 1602, 79, 34, 100, 'Quia sed deleniti unde.', '1563265213', 0),
(1211, 7046, 116, 75, 67, 'Qui illum suscipit.', '1563265213', 1),
(1212, 9945, 181, 134, 134, 'Facilis quod nobis.', '1563265213', 1),
(1213, 3838, 84, 77, 188, 'Consequatur vel aliquam fuga.', '1563265213', 0),
(1214, 6594, 31, 188, 112, 'Et officiis.', '1563265213', 0),
(1215, 576, 74, 195, 70, 'Dignissimos ullam nemo facilis.', '1563265213', 0),
(1216, 8139, 151, 115, 154, 'Architecto quae est.', '1563265213', 1),
(1217, 6556, 176, 163, 150, 'Vero deserunt.', '1563265213', 1),
(1218, 861, 64, 92, 184, 'Id.', '1563265213', 1),
(1219, 7195, 50, 26, 109, 'Corporis quae.', '1563265213', 0),
(1220, 1080, 99, 89, 176, 'Consequatur officiis alias id.', '1563265213', 0),
(1221, 3193, 62, 56, 37, 'Sunt cumque et.', '1563265213', 1),
(1222, 8834, 49, 54, 26, 'Accusamus repellendus magni eveniet.', '1563265213', 1),
(1223, 4460, 98, 194, 118, 'Dolores.', '1563265214', 0),
(1224, 3259, 51, 118, 165, 'Occaecati omnis labore.', '1563265214', 1),
(1225, 356, 111, 196, 53, 'Est ducimus.', '1563265214', 0),
(1226, 628, 42, 24, 71, 'Odio aperiam illum.', '1563265214', 1),
(1227, 4348, 38, 111, 2, 'Alias occaecati.', '1563265214', 1),
(1228, 1610, 102, 17, 94, 'Voluptatem vel.', '1563265214', 1),
(1229, 2806, 178, 45, 31, 'Enim sunt.', '1563265214', 1),
(1230, 2039, 161, 40, 165, 'Quo.', '1563265214', 0),
(1231, 4806, 45, 21, 163, 'Est vero.', '1563265214', 0),
(1232, 3662, 183, 61, 49, 'Unde vitae qui.', '1563265214', 0),
(1233, 5744, 41, 161, 78, 'Dolor et.', '1563265214', 1),
(1234, 367, 42, 178, 112, 'Illo sint.', '1563265214', 0),
(1235, 4535, 201, 85, 124, 'Voluptates veritatis.', '1563265214', 1),
(1236, 1021, 190, 26, 58, 'Culpa temporibus laboriosam ex consectetur.', '1563265214', 0),
(1237, 1232, 37, 101, 90, 'Iusto.', '1563265214', 0),
(1238, 2451, 162, 15, 61, 'Illum.', '1563265214', 1),
(1239, 9452, 15, 201, 135, 'Sit ut.', '1563265214', 0),
(1240, 6555, 41, 45, 170, 'Nihil provident.', '1563265214', 1),
(1241, 1380, 36, 115, 157, 'Non impedit impedit ut.', '1563265214', 1),
(1242, 7300, 18, 195, 73, 'Dolorum.', '1563265214', 1),
(1243, 2420, 180, 180, 90, 'Sed vero.', '1563265214', 0),
(1244, 8049, 99, 111, 173, 'Unde vel atque illum.', '1563265214', 1),
(1245, 7914, 55, 78, 185, 'Error voluptatem.', '1563265214', 1),
(1246, 2412, 122, 16, 52, 'Error vel.', '1563265214', 0),
(1247, 4127, 141, 188, 85, 'Necessitatibus accusamus ea aperiam.', '1563265214', 1),
(1248, 168, 134, 55, 135, 'Autem.', '1563265214', 0),
(1249, 9604, 5, 131, 175, 'Quidem quia dolor.', '1563265214', 0),
(1250, 2326, 51, 27, 55, 'Id earum ab.', '1563265214', 0),
(1251, 5543, 68, 39, 195, 'Et voluptatum.', '1563265214', 0),
(1252, 5117, 89, 34, 19, 'Doloribus consectetur.', '1563265214', 0),
(1253, 7277, 38, 15, 154, 'Iusto voluptatem sint quae.', '1563265214', 1),
(1254, 8244, 171, 21, 45, 'Laborum soluta.', '1563265214', 0),
(1255, 7571, 132, 17, 149, 'Blanditiis.', '1563265214', 1),
(1256, 6310, 36, 66, 107, 'Corporis et ratione.', '1563265214', 0),
(1257, 6308, 65, 194, 51, 'Iste quasi quo omnis dolorem repellat.', '1563265214', 0),
(1258, 3855, 102, 44, 200, 'Repellendus quae.', '1563265214', 0),
(1259, 4748, 176, 93, 34, 'Dolores.', '1563265214', 1),
(1260, 1527, 131, 56, 44, 'Explicabo laborum voluptatem.', '1563265214', 1),
(1261, 3429, 161, 173, 157, 'Et sit dignissimos.', '1563265214', 1),
(1262, 4574, 146, 67, 49, 'Laborum blanditiis.', '1563265214', 1),
(1263, 949, 111, 177, 122, 'Est nam tenetur nisi.', '1563265214', 1),
(1264, 1168, 203, 137, 44, 'Est fugit aut ducimus quis vitae.', '1563265214', 0),
(1265, 2842, 76, 167, 116, 'Sequi eum.', '1563265214', 0),
(1266, 8846, 139, 90, 109, 'Et sed.', '1563265214', 1),
(1267, 6973, 69, 60, 164, 'Animi pariatur et debitis explicabo.', '1563265214', 1),
(1268, 1859, 32, 178, 71, 'Repudiandae et est sunt.', '1563265214', 0),
(1269, 7081, 85, 160, 133, 'Tempora dolor quis qui hic.', '1563265214', 1),
(1270, 5522, 31, 143, 42, 'Ullam.', '1563265214', 0),
(1271, 6317, 18, 111, 94, 'Aut explicabo.', '1563265214', 0),
(1272, 4759, 18, 52, 195, 'Quas quod sequi.', '1563265214', 1),
(1273, 6757, 54, 179, 171, 'Eligendi.', '1563265214', 0),
(1274, 2404, 105, 90, 39, 'Fugit voluptate.', '1563265214', 0),
(1275, 4276, 144, 117, 157, 'Dolorem delectus.', '1563265214', 1),
(1276, 1614, 122, 164, 69, 'Molestiae.', '1563265214', 0),
(1277, 833, 160, 85, 40, 'Ut minus.', '1563265214', 0),
(1278, 9245, 76, 98, 94, 'Velit et.', '1563265214', 1),
(1279, 3943, 54, 117, 111, 'Optio itaque quas laborum quidem dolorum.', '1563265214', 0),
(1280, 5819, 112, 75, 80, 'Neque.', '1563265214', 1),
(1281, 391, 148, 154, 34, 'Adipisci consequatur consequatur.', '1563265214', 0),
(1282, 5797, 176, 149, 40, 'Occaecati harum reiciendis.', '1563265214', 1),
(1283, 6317, 184, 123, 41, 'Consequatur perferendis.', '1563265214', 0),
(1284, 1211, 58, 93, 15, 'Est odit qui voluptatum.', '1563265214', 0),
(1285, 9061, 82, 7, 148, 'Ab dolore iusto.', '1563265214', 1),
(1286, 8631, 165, 87, 111, 'Ex quo.', '1563265214', 1),
(1287, 7511, 78, 166, 85, 'Quo voluptatem suscipit vel.', '1563265214', 0),
(1288, 2241, 10, 56, 78, 'Rerum perspiciatis modi reiciendis.', '1563265214', 0),
(1289, 1907, 74, 24, 162, 'Omnis cumque nulla dolor.', '1563265214', 0),
(1290, 4118, 94, 150, 63, 'Ut expedita totam fugit.', '1563265214', 1),
(1291, 7142, 95, 104, 32, 'Sunt delectus.', '1563265214', 1),
(1292, 4484, 127, 162, 106, 'Vel alias facere iure qui.', '1563265214', 1),
(1293, 7404, 103, 156, 15, 'Sint recusandae veniam.', '1563265214', 0),
(1294, 2562, 96, 16, 9, 'Est nihil.', '1563265214', 0),
(1295, 4004, 137, 177, 7, 'Blanditiis.', '1563265214', 1),
(1296, 5043, 113, 139, 90, 'Officiis deleniti blanditiis facilis.', '1563265214', 1),
(1297, 5095, 7, 138, 138, 'Harum ea voluptas culpa velit.', '1563265214', 1),
(1298, 1653, 93, 170, 6, 'Ratione quae.', '1563265214', 0),
(1299, 6950, 133, 145, 42, 'Est.', '1563265214', 0),
(1300, 7221, 54, 53, 8, 'Iusto culpa accusantium.', '1563265214', 0),
(1301, 9394, 71, 21, 184, 'Veritatis labore voluptatem inventore.', '1563265214', 1),
(1302, 6706, 148, 104, 17, 'Ratione repudiandae ut consectetur.', '1563265214', 1),
(1303, 1555, 115, 13, 2, 'Cumque qui voluptate.', '1563265214', 1),
(1304, 6570, 129, 11, 123, 'Eius consequatur.', '1563265214', 0),
(1305, 3382, 4, 65, 187, 'Voluptatem molestias ipsam dolores.', '1563265214', 0),
(1306, 4374, 179, 77, 4, 'Nesciunt.', '1563265214', 1),
(1307, 9438, 128, 122, 109, 'Et et ratione in velit.', '1563265214', 0),
(1308, 324, 43, 196, 73, 'Est dolorem aperiam dolorem.', '1563265214', 1),
(1309, 6996, 115, 201, 73, 'Nostrum eaque maxime id accusantium nisi.', '1563265214', 0),
(1310, 8244, 86, 174, 183, 'Debitis vero.', '1563265214', 1),
(1311, 9831, 45, 68, 170, 'Et atque voluptatem voluptatibus eos ut.', '1563265214', 0),
(1312, 4268, 189, 154, 63, 'Aut facilis inventore.', '1563265214', 0),
(1313, 665, 56, 67, 182, 'Dignissimos et.', '1563265214', 0),
(1314, 4895, 21, 195, 179, 'Aut qui.', '1563265214', 0),
(1315, 7574, 67, 33, 61, 'Praesentium maxime vitae.', '1563265214', 1),
(1316, 5420, 58, 202, 85, 'Autem aut nihil ut.', '1563265214', 0),
(1317, 4984, 53, 29, 70, 'Quia consequatur praesentium non dolorem dolore.', '1563265214', 0),
(1318, 8943, 111, 200, 129, 'Minus ipsum.', '1563265214', 0),
(1319, 9225, 38, 184, 21, 'Nostrum nam quam.', '1563265214', 1),
(1320, 2522, 179, 38, 106, 'Est enim.', '1563265214', 1),
(1321, 43, 34, 70, 118, 'A non.', '1563265214', 1),
(1322, 8153, 198, 161, 20, 'Consequuntur quasi.', '1563265214', 0),
(1323, 3294, 126, 59, 199, 'Nihil vel.', '1563265214', 1),
(1324, 6012, 167, 172, 157, 'Quasi aliquid sunt aspernatur.', '1563265214', 0),
(1325, 8931, 66, 126, 7, 'Dolores sed.', '1563265214', 1),
(1326, 377, 51, 134, 23, 'Dolorem est perspiciatis enim quo.', '1563265215', 0),
(1327, 9218, 78, 114, 132, 'Et magni et ut.', '1563265215', 0),
(1328, 1834, 187, 157, 122, 'Deserunt.', '1563265215', 1),
(1329, 8413, 66, 179, 85, 'Maiores dolores consequuntur.', '1563265215', 0),
(1330, 7340, 192, 127, 167, 'Neque possimus eligendi illo qui.', '1563265215', 0),
(1331, 7209, 161, 8, 162, 'Consequatur quae odit.', '1563265215', 0),
(1332, 5413, 191, 75, 74, 'Sunt rem voluptatem.', '1563265215', 0),
(1333, 4021, 11, 155, 100, 'Est.', '1563265215', 0),
(1334, 7197, 96, 182, 200, 'Est.', '1563265215', 1),
(1335, 7871, 118, 12, 15, 'Nam est.', '1563265215', 0),
(1336, 1365, 111, 44, 21, 'Nemo natus.', '1563265215', 1),
(1337, 331, 95, 104, 80, 'Quam.', '1563265215', 0),
(1338, 2533, 61, 39, 80, 'Maiores sint non.', '1563265215', 0),
(1339, 9179, 197, 89, 162, 'Perspiciatis non similique.', '1563265215', 1),
(1340, 5528, 164, 191, 198, 'Ut sunt.', '1563265215', 0),
(1341, 1800, 28, 195, 74, 'Dolorem.', '1563265215', 1),
(1342, 8833, 62, 112, 123, 'Saepe neque.', '1563265215', 0),
(1343, 1086, 1, 98, 187, 'Pariatur enim.', '1563265215', 0),
(1344, 6212, 93, 160, 117, 'Et non.', '1563265215', 1),
(1345, 1687, 135, 190, 107, 'Similique.', '1563265215', 0),
(1346, 8002, 152, 107, 59, 'Perferendis non velit atque.', '1563265215', 1),
(1347, 1993, 198, 50, 88, 'Quo.', '1563265215', 1),
(1348, 3913, 37, 44, 32, 'Perferendis itaque quis.', '1563265215', 1),
(1349, 7884, 113, 69, 109, 'Dolorum nostrum placeat deserunt ratione molestiae.', '1563265215', 1),
(1350, 1510, 18, 144, 191, 'Qui quaerat qui.', '1563265215', 1),
(1351, 3711, 191, 28, 121, 'Amet laborum hic omnis sapiente unde.', '1563265215', 0),
(1352, 6009, 127, 189, 146, 'Praesentium.', '1563265215', 0),
(1353, 1920, 203, 143, 158, 'Cum.', '1563265215', 1),
(1354, 859, 124, 69, 46, 'Necessitatibus eum molestiae culpa.', '1563265215', 1),
(1355, 1472, 80, 76, 16, 'Recusandae consequuntur sed.', '1563265215', 0),
(1356, 3591, 40, 202, 171, 'Vitae in numquam maiores eveniet.', '1563265215', 1),
(1357, 7552, 164, 23, 110, 'Qui molestias.', '1563265215', 1),
(1358, 4393, 48, 172, 162, 'Nemo necessitatibus autem consequuntur vero.', '1563265215', 1),
(1359, 3433, 93, 201, 106, 'Iure in.', '1563265215', 0),
(1360, 2947, 179, 199, 81, 'Laudantium eligendi debitis eos.', '1563265215', 0),
(1361, 7293, 70, 67, 144, 'Natus adipisci.', '1563265215', 1),
(1362, 5057, 196, 189, 97, 'Autem quo possimus nesciunt.', '1563265215', 1),
(1363, 3683, 156, 125, 79, 'Sed dolorem cum.', '1563265215', 0),
(1364, 2451, 198, 9, 178, 'Nihil cupiditate.', '1563265215', 1),
(1365, 4406, 53, 43, 18, 'Aut minus.', '1563265215', 0),
(1366, 4229, 202, 41, 134, 'Dignissimos natus iure.', '1563265215', 1),
(1367, 5867, 75, 105, 10, 'Eos fugit non.', '1563265215', 0),
(1368, 2013, 173, 1, 48, 'Magni non.', '1563265215', 0),
(1369, 3432, 70, 47, 127, 'Quibusdam quis tempore quae eaque a.', '1563265215', 1),
(1370, 6827, 86, 115, 24, 'Est id dolorum aut.', '1563265215', 1),
(1371, 5730, 106, 10, 198, 'Voluptatem dolor qui.', '1563265215', 0),
(1372, 7740, 40, 156, 44, 'Ea cupiditate et.', '1563265215', 0),
(1373, 8511, 57, 53, 177, 'Blanditiis tenetur eius.', '1563265215', 1),
(1374, 7477, 189, 74, 32, 'Perspiciatis explicabo et sit.', '1563265215', 1),
(1375, 4717, 143, 194, 108, 'Et culpa.', '1563265215', 0),
(1376, 7943, 27, 12, 182, 'Sint occaecati.', '1563265215', 1),
(1377, 1403, 17, 80, 173, 'Voluptas est exercitationem.', '1563265215', 0),
(1378, 1459, 108, 188, 68, 'Porro quasi odio unde.', '1563265215', 1),
(1379, 5872, 65, 104, 18, 'Sit autem.', '1563265215', 0),
(1380, 9679, 196, 9, 195, 'Numquam temporibus cum.', '1563265215', 0),
(1381, 6192, 167, 101, 89, 'Pariatur.', '1563265215', 0),
(1382, 7071, 98, 148, 55, 'Itaque ut et sunt.', '1563265215', 1),
(1383, 6480, 80, 197, 76, 'Deleniti sed rerum optio mollitia numquam.', '1563265215', 0),
(1384, 7012, 67, 161, 155, 'Libero impedit accusamus et doloribus.', '1563265215', 1),
(1385, 7376, 25, 103, 138, 'Nisi explicabo.', '1563265215', 0),
(1386, 9795, 110, 128, 66, 'Aliquid incidunt eum vero.', '1563265215', 1),
(1387, 4925, 191, 160, 178, 'Nesciunt accusamus.', '1563265215', 0),
(1388, 5102, 56, 30, 71, 'Cupiditate ea.', '1563265215', 0),
(1389, 2306, 30, 61, 125, 'Magnam vitae impedit.', '1563265215', 1),
(1390, 4140, 34, 101, 157, 'Repellat iusto assumenda.', '1563265215', 1),
(1391, 8782, 71, 44, 125, 'Quo.', '1563265215', 0),
(1392, 7653, 113, 3, 43, 'Ex.', '1563265215', 1),
(1393, 7082, 68, 53, 99, 'Quia.', '1563265215', 0),
(1394, 6315, 126, 82, 17, 'Nostrum nulla enim amet.', '1563265215', 1),
(1395, 679, 45, 157, 105, 'Et.', '1563265215', 1),
(1396, 6933, 5, 37, 160, 'Accusamus iusto quos porro voluptate.', '1563265215', 1),
(1397, 4061, 179, 113, 197, 'Et ab ullam.', '1563265215', 0),
(1398, 7508, 175, 2, 51, 'Incidunt aperiam voluptas consequatur dignissimos.', '1563265215', 1),
(1399, 2624, 78, 124, 72, 'Et expedita.', '1563265215', 1),
(1400, 9168, 42, 118, 23, 'Aperiam esse commodi nam suscipit.', '1563265215', 0),
(1401, 3688, 85, 3, 185, 'Quisquam minus.', '1563265215', 1),
(1402, 5966, 182, 197, 26, 'Voluptates sint vitae porro.', '1563265215', 1),
(1403, 7530, 139, 34, 135, 'Ad et distinctio omnis.', '1563265215', 0),
(1404, 7889, 165, 115, 199, 'Temporibus animi autem.', '1563265215', 0),
(1405, 1304, 176, 185, 190, 'Enim.', '1563265215', 1),
(1406, 1360, 161, 160, 180, 'Voluptatibus ex veniam unde.', '1563265215', 0),
(1407, 6762, 114, 136, 28, 'Sed dolores non.', '1563265215', 0),
(1408, 7444, 176, 132, 12, 'Dignissimos porro autem.', '1563265215', 0),
(1409, 6478, 39, 184, 107, 'Porro cum repellendus qui.', '1563265215', 1),
(1410, 7350, 80, 84, 115, 'Ut aliquam reprehenderit.', '1563265215', 1),
(1411, 2575, 14, 87, 14, 'Ea excepturi sapiente dicta.', '1563265215', 0),
(1412, 7491, 73, 148, 70, 'Eos id molestias ut ad asperiores.', '1563265215', 0),
(1413, 2028, 61, 27, 59, 'Quidem nostrum autem.', '1563265215', 1),
(1414, 5288, 91, 14, 34, 'Quis saepe esse.', '1563265215', 1),
(1415, 2018, 131, 15, 126, 'Laudantium aut.', '1563265215', 0),
(1416, 664, 82, 203, 28, 'Cupiditate qui inventore quis omnis.', '1563265215', 0),
(1417, 3354, 31, 29, 157, 'Laudantium unde.', '1563265215', 1),
(1418, 9084, 84, 195, 82, 'Nam.', '1563265215', 1),
(1419, 1567, 157, 132, 39, 'Dolor quam dolore.', '1563265215', 1),
(1420, 1705, 92, 122, 12, 'Dignissimos occaecati odit.', '1563265215', 1),
(1421, 3036, 36, 91, 83, 'Et facilis sapiente.', '1563265215', 1),
(1422, 9707, 121, 201, 85, 'Rem.', '1563265215', 0),
(1423, 2370, 97, 111, 71, 'Voluptatum ad.', '1563265215', 0),
(1424, 1135, 77, 196, 83, 'Voluptates ipsum ex delectus.', '1563265215', 1),
(1425, 7603, 49, 59, 88, 'Voluptas magnam.', '1563265215', 1),
(1426, 6388, 201, 34, 90, 'Quia amet optio.', '1563265215', 0),
(1427, 9876, 123, 169, 167, 'Repellendus ipsam.', '1563265215', 1),
(1428, 2292, 176, 10, 108, 'Qui nihil error velit.', '1563265215', 1),
(1429, 6939, 93, 117, 116, 'Numquam hic.', '1563265215', 1),
(1430, 863, 24, 119, 39, 'Ut pariatur dolores numquam.', '1563265215', 0),
(1431, 5157, 9, 81, 123, 'Ut rerum asperiores consequatur impedit.', '1563265215', 0),
(1432, 5642, 83, 104, 86, 'Animi non vel ex.', '1563265215', 1),
(1433, 6165, 65, 171, 174, 'Nisi.', '1563265215', 0),
(1434, 5458, 49, 167, 176, 'Error.', '1563265216', 1),
(1435, 282, 28, 83, 59, 'Aut.', '1563265216', 1),
(1436, 3654, 23, 101, 196, 'Quo.', '1563265216', 1),
(1437, 8195, 23, 113, 36, 'Ipsam maxime aliquid eveniet.', '1563265216', 1),
(1438, 2612, 102, 62, 169, 'Enim.', '1563265216', 1),
(1439, 305, 128, 154, 67, 'Nihil soluta.', '1563265216', 1),
(1440, 3010, 187, 198, 149, 'Cupiditate facilis.', '1563265216', 0),
(1441, 3397, 33, 152, 104, 'Pariatur omnis.', '1563265216', 0),
(1442, 8592, 41, 47, 111, 'Qui dolore.', '1563265216', 1),
(1443, 3177, 133, 29, 147, 'Aliquam.', '1563265216', 0),
(1444, 2442, 199, 195, 136, 'Totam esse.', '1563265216', 0),
(1445, 5144, 63, 170, 156, 'In ut sit vel sed.', '1563265216', 1),
(1446, 5354, 12, 200, 75, 'Autem voluptates laborum.', '1563265216', 0),
(1447, 7151, 87, 122, 45, 'Ut consequuntur.', '1563265216', 1),
(1448, 5612, 100, 143, 92, 'Ipsam.', '1563265216', 1),
(1449, 5058, 118, 57, 152, 'Ea facere totam eius.', '1563265216', 1),
(1450, 115, 139, 119, 163, 'Debitis.', '1563265216', 1),
(1451, 7883, 130, 169, 58, 'Eum tempore.', '1563265216', 0),
(1452, 2898, 148, 111, 151, 'Inventore expedita molestias non.', '1563265216', 1),
(1453, 6624, 117, 6, 49, 'Enim quos et est quos.', '1563265216', 1),
(1454, 8148, 39, 145, 139, 'Et ut.', '1563265216', 1),
(1455, 126, 78, 197, 52, 'Odit.', '1563265216', 1),
(1456, 8240, 29, 191, 36, 'Rerum.', '1563265216', 0),
(1457, 5271, 151, 87, 25, 'Dolor fugit amet perspiciatis numquam.', '1563265216', 1),
(1458, 1486, 123, 42, 151, 'Rerum saepe.', '1563265216', 0),
(1459, 7187, 137, 77, 3, 'Assumenda officia tenetur.', '1563265216', 0),
(1460, 6522, 99, 3, 19, 'Dicta quos sed fugiat.', '1563265216', 0),
(1461, 7502, 163, 131, 13, 'Sunt et.', '1563265216', 1),
(1462, 8703, 148, 52, 89, 'Eligendi eaque.', '1563265216', 0),
(1463, 5692, 15, 115, 54, 'Dicta ratione soluta.', '1563265216', 1),
(1464, 3000, 191, 149, 97, 'Labore sed architecto molestiae.', '1563265216', 0),
(1465, 7257, 187, 128, 7, 'Est aut eligendi temporibus aut iure.', '1563265216', 1),
(1466, 3499, 22, 12, 48, 'Aut in perferendis.', '1563265216', 1),
(1467, 9310, 188, 171, 189, 'Numquam ut consequuntur.', '1563265216', 1),
(1468, 7206, 41, 1, 5, 'Sapiente qui quia.', '1563265216', 1),
(1469, 9810, 99, 147, 193, 'Ducimus blanditiis quia.', '1563265216', 0),
(1470, 4162, 111, 146, 109, 'Dolores et delectus aut.', '1563265216', 1),
(1471, 5403, 170, 17, 18, 'Numquam fuga voluptatem consequatur modi.', '1563265216', 1),
(1472, 6714, 29, 124, 20, 'Ea nulla.', '1563265216', 1),
(1473, 9105, 90, 126, 164, 'Deserunt reprehenderit ex.', '1563265216', 1),
(1474, 4800, 177, 70, 77, 'Earum excepturi doloremque.', '1563265216', 1),
(1475, 9435, 195, 176, 82, 'Dolorem porro quis.', '1563265216', 1),
(1476, 2403, 72, 16, 118, 'Odit rem itaque veritatis omnis.', '1563265216', 0),
(1477, 5870, 176, 133, 8, 'Et adipisci culpa.', '1563265216', 1),
(1478, 1689, 65, 85, 16, 'Nam voluptatum dolor.', '1563265216', 1),
(1479, 6853, 86, 47, 201, 'Fuga quo quia veritatis.', '1563265216', 1),
(1480, 7681, 150, 61, 135, 'Dolore placeat omnis.', '1563265216', 0),
(1481, 9855, 6, 52, 186, 'Ex.', '1563265216', 1),
(1482, 3564, 167, 172, 118, 'Repellendus ea hic.', '1563265216', 1),
(1483, 2704, 112, 87, 190, 'Libero ea aspernatur est.', '1563265216', 0),
(1484, 5697, 28, 202, 176, 'Incidunt est illo vero distinctio.', '1563265216', 1),
(1485, 9006, 99, 189, 150, 'Omnis sit.', '1563265216', 0),
(1486, 677, 135, 151, 106, 'Quod quisquam aut.', '1563265216', 1),
(1487, 7484, 192, 61, 19, 'Voluptas assumenda ratione dolorem quaerat vel.', '1563265216', 1),
(1488, 1889, 155, 154, 65, 'Praesentium eum nesciunt.', '1563265216', 1),
(1489, 433, 179, 16, 35, 'Voluptas adipisci.', '1563265216', 1),
(1490, 116, 198, 157, 145, 'Sit.', '1563265216', 0),
(1491, 9901, 83, 55, 78, 'Adipisci.', '1563265216', 0),
(1492, 4478, 57, 64, 195, 'Modi.', '1563265216', 0),
(1493, 7236, 46, 1, 23, 'Officia quia officiis.', '1563265216', 1),
(1494, 1936, 91, 141, 34, 'Est quibusdam nobis.', '1563265216', 0),
(1495, 2703, 101, 103, 154, 'Sint perspiciatis laboriosam.', '1563265216', 1),
(1496, 9322, 115, 125, 180, 'Quidem accusamus iure.', '1563265216', 0),
(1497, 799, 75, 56, 127, 'Et aut unde dicta.', '1563265216', 0),
(1498, 8693, 157, 138, 132, 'In explicabo.', '1563265216', 0),
(1499, 9382, 151, 125, 27, 'Ab.', '1563265216', 1),
(1500, 4368, 91, 71, 21, 'Aut et eum.', '1563265216', 1);

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
(1, 'Mr. Angelo Rau MD', 'students', 'Eos quia ad iusto occaecati sed illo.', 1563265194, 'Prof. Britney Gleason'),
(2, 'Jazmin Block', 'teachers', 'Deleniti quidem pariatur et distinctio.', 1563265194, 'Isobel Kerluke'),
(3, 'Clair Kuvalis', 'teachers', 'Et quae blanditiis id provident est.', 1563265194, 'Laisha Kling'),
(4, 'Prof. Maxime Nikolaus Jr.', 'employees', 'Nulla et quasi deleniti quis.', 1563265194, 'Ms. Shanon Gulgowski'),
(5, 'Mr. Zachariah Harris', 'teachers', 'Blanditiis non vero expedita repudiandae.', 1563265194, 'Prof. Raleigh Collier'),
(6, 'Guadalupe Prohaska', 'teachers', 'Tempore accusamus enim velit dolorum.', 1563265194, 'Mr. Dagmar Daugherty'),
(7, 'Filomena Fahey', 'parents', 'Non molestiae totam.', 1563265194, 'Prof. Chaz Leuschke'),
(8, 'Ciara Reynolds', 'parents', 'Nisi qui incidunt facilis vitae aliquid.', 1563265194, 'Dr. Natalia Paucek III'),
(9, 'Dr. Ruben Gleason PhD', 'employees', 'Qui aut a neque expedita hic est.', 1563265194, 'Lydia Hahn PhD'),
(10, 'Bruce Macejkovic', 'parents', 'Totam eaque laborum et maiores quisquam dicta.', 1563265194, 'Roderick Kris'),
(11, 'Virgie Treutel Sr.', 'employees', 'Consectetur repellendus et numquam sed aliquid.', 1563265194, 'Garland Rowe DDS'),
(12, 'Leopold Pfeffer', 'employees', 'Ullam voluptas aut.', 1563265194, 'Dr. Curtis Orn Sr.'),
(13, 'Daija Skiles', 'students', 'Qui quis itaque laboriosam aliquid perspiciatis pariatur aut explicabo dolores.', 1563265194, 'Genevieve Friesen'),
(14, 'Dr. Manuel Schumm MD', 'students', 'Accusamus aperiam aut quia quis voluptas rerum non.', 1563265194, 'Molly Denesik'),
(15, 'Mrs. Rubye Ondricka V', 'teachers', 'Quas maiores reiciendis enim sunt.', 1563265194, 'Luciano Weimann'),
(16, 'Keith Hodkiewicz MD', 'teachers', 'Nesciunt facere sit voluptas in blanditiis voluptatem voluptatem optio nihil.', 1563265194, 'Prof. Bill Von MD'),
(17, 'Celia Ruecker', 'employees', 'Optio quis aspernatur rerum quis.', 1563265194, 'Melyssa Grant'),
(18, 'Emily Jenkins', 'parents', 'Beatae nemo nam est deserunt consectetur.', 1563265194, 'Dr. Zakary Goyette MD'),
(19, 'Miss Beaulah Will Sr.', 'students', 'Qui aut rerum distinctio cumque veniam.', 1563265194, 'Santa Herzog'),
(20, 'Elena Breitenberg', 'teachers', 'Occaecati ut dolores sit quisquam voluptatem qui odit.', 1563265194, 'Karelle Medhurst'),
(21, 'Mr. Quentin Bosco', 'employees', 'Qui quas deleniti dolorum nulla sequi et iste.', 1563265194, 'Mr. Adolfo Greenfelder II'),
(22, 'Pierre Batz', 'teachers', 'Consectetur qui facilis sint ut odit enim.', 1563265194, 'Noah Cruickshank MD'),
(23, 'Raleigh Bode', 'employees', 'Voluptatem placeat aut ut eius.', 1563265194, 'Miss Estrella Schmitt'),
(24, 'Chadd Kulas', 'students', 'Voluptate eos sed cum in.', 1563265194, 'Maureen Walsh'),
(25, 'Stella Ratke', 'students', 'Blanditiis neque et reprehenderit corrupti.', 1563265194, 'Hilma Schaden DVM'),
(26, 'Hubert O\'Conner', 'employees', 'Et sed quo quas tenetur necessitatibus.', 1563265194, 'Peter Bailey'),
(27, 'Sister Nader', 'parents', 'Debitis voluptatem dolor cupiditate.', 1563265194, 'Malinda Klein IV'),
(28, 'Felicita Murray', 'students', 'Velit commodi aut vero laudantium.', 1563265194, 'Vladimir McDermott'),
(29, 'Mitchel Bahringer', 'parents', 'Enim asperiores incidunt consequatur.', 1563265194, 'Delbert Will'),
(30, 'Prof. Vaughn Jacobi MD', 'employees', 'Ab dolor autem nostrum omnis quia debitis.', 1563265194, 'Maxie Lebsack'),
(31, 'Kristoffer Wiegand', 'teachers', 'Nemo illum accusamus nobis architecto itaque.', 1563265194, 'Peyton Reichert'),
(32, 'Helmer O\'Conner', 'parents', 'Qui et rerum et eaque.', 1563265194, 'Mireille Kemmer PhD'),
(33, 'Mario Lowe', 'employees', 'Illum sit iure quae dolor repellat.', 1563265194, 'Mary Deckow'),
(34, 'Kyle Will', 'parents', 'Corporis ipsam voluptas cum nostrum vel ea consectetur est iure.', 1563265194, 'Isabella Labadie'),
(35, 'Dr. Keagan Kutch Jr.', 'students', 'Rerum alias dolores quia quibusdam veniam doloremque.', 1563265194, 'Dr. Elvera Torp DDS'),
(36, 'Noemi Langworth', 'parents', 'Expedita quae est repellat ea.', 1563265194, 'Earnestine Kilback'),
(37, 'Prof. Clint Greenfelder Jr.', 'employees', 'Vero aut fugiat et aut aliquid necessitatibus.', 1563265194, 'Kenna Sauer'),
(38, 'Easton Boyle I', 'students', 'Enim eaque illo provident alias unde.', 1563265194, 'Dandre Hermann'),
(39, 'Prof. Lila Fritsch', 'teachers', 'Perspiciatis rerum debitis qui voluptatem est voluptatem ea est unde.', 1563265194, 'Carlo Torphy'),
(40, 'Kelly Steuber MD', 'students', 'Consequatur blanditiis ea ut autem ut et eum assumenda consectetur consequatur.', 1563265194, 'Prof. Nicolas Wolf'),
(41, 'Christiana Gibson I', 'parents', 'Architecto dolore ratione quia maiores dignissimos quia ex possimus nesciunt.', 1563265194, 'Miss Erica Schaefer'),
(42, 'Wanda Kiehn Jr.', 'teachers', 'Nemo maxime voluptatem enim rerum ea hic.', 1563265194, 'Raphaelle Stamm II'),
(43, 'Gino Shanahan', 'employees', 'Tempore ut rem aut recusandae earum.', 1563265194, 'Hallie Cartwright IV'),
(44, 'Miss Alexandria Marquardt V', 'employees', 'Aut dignissimos esse qui.', 1563265194, 'Heber O\'Connell'),
(45, 'Kenya Dietrich', 'students', 'A accusantium sed aut et illum.', 1563265194, 'Earnestine Hoppe Sr.'),
(46, 'Karlie Welch', 'students', 'Quam quaerat temporibus et.', 1563265194, 'Florian Tillman'),
(47, 'Cyril Lind MD', 'students', 'Odio iure aspernatur aut.', 1563265194, 'Dr. Brycen Jakubowski III'),
(48, 'Milton Crona', 'parents', 'Dolorem sint debitis voluptatem natus.', 1563265194, 'Ms. Palma West'),
(49, 'Mafalda Schumm Sr.', 'teachers', 'Et optio aut sint sed.', 1563265194, 'Ethan Roob'),
(50, 'Mckayla Douglas', 'employees', 'Accusamus voluptatibus facere repellat sed qui.', 1563265194, 'Lorenza Maggio Jr.');

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
(1, 'Odio et modi.', 'Sit consequatur voluptas ea voluptatem magnam molestiae molestiae.', 'students', 1563265192, '', 1, 1563265192),
(2, 'Ut qui eos sed.', 'Doloremque voluptate dolor eos enim quidem optio velit error ad.', 'all', 1563265192, '', 1, 1563265192),
(3, 'Eveniet voluptatum impedit ad harum.', 'Perferendis voluptatum nulla iusto voluptatibus occaecati dolores porro est odio.', 'all', 1563265192, '', 0, 1563265192),
(4, 'Consequatur et inventore.', 'Officia assumenda mollitia dolorem rerum quis aliquid consequatur culpa.', 'parents', 1563265192, '', 0, 1563265192),
(5, 'Accusantium omnis corrupti repellendus est.', 'Fugiat inventore ipsa dolor assumenda tempore neque.', 'students', 1563265192, '', 1, 1563265192),
(6, 'Voluptatibus commodi alias suscipit.', 'Tempora eos alias debitis quia quis aspernatur aut.', 'students', 1563265192, '', 1, 1563265192),
(7, 'Assumenda odit.', 'Rerum magnam asperiores molestiae eum.', 'all', 1563265192, '', 0, 1563265192),
(8, 'Est pariatur a fuga.', 'Rerum fuga tempora iste laboriosam commodi consequuntur fugit dolor.', 'students', 1563265192, '', 0, 1563265192),
(9, 'Qui voluptatem voluptatibus quas amet.', 'Quae est ad officiis est quia dignissimos tenetur molestias laboriosam ad ea rerum.', 'parents', 1563265192, '', 1, 1563265192),
(10, 'Explicabo impedit eum itaque.', 'Eum molestias explicabo accusantium ad illo et enim voluptatem quidem.', 'students', 1563265192, '', 1, 1563265192),
(11, 'Magnam quis.', 'Repellat quas qui consequatur cumque iure esse nemo et magnam expedita alias consectetur.', 'teacher', 1563265192, '', 1, 1563265192),
(12, 'Reiciendis alias molestias.', 'Occaecati iure et reprehenderit in est ut dignissimos aliquam aut sit et.', 'teacher', 1563265192, '', 1, 1563265192),
(13, 'Quis pariatur ut delectus.', 'Adipisci doloremque facere ut et soluta assumenda debitis repudiandae.', 'parents', 1563265192, '', 0, 1563265192),
(14, 'Error et id et sed sit.', 'Quia eos enim in molestiae qui adipisci.', 'parents', 1563265192, '', 0, 1563265192),
(15, 'Minus repellendus sit.', 'Aut saepe molestiae officiis quia quo doloremque expedita recusandae.', 'parents', 1563265192, '', 0, 1563265192),
(16, 'Magni ipsum temporibus nemo delectus aliquam.', 'Aperiam illo libero repudiandae vel tempora necessitatibus minus quod.', 'all', 1563265192, '', 0, 1563265192),
(17, 'Aliquid laborum qui.', 'Debitis nihil dolores enim ut iste dolor et est.', 'parents', 1563265192, '', 0, 1563265192),
(18, 'Enim in.', 'Architecto architecto ut asperiores eligendi sint sed.', 'all', 1563265192, '', 0, 1563265192),
(19, 'Architecto occaecati tenetur.', 'Illo expedita dolorem blanditiis alias minus labore dolorum ad laborum placeat.', 'teacher', 1563265192, '', 1, 1563265192),
(20, 'Expedita sunt excepturi.', 'Ea nulla voluptatem voluptas aut consequatur ab.', 'students', 1563265192, '', 1, 1563265192);

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
(1, 'maxime_193', NULL, 145, 'Est praesentium aut earum esse dolores.', 940, 0, 0, 600, 0, 1563265190, 1563722599, 0, NULL, NULL, NULL, NULL, 1, '0'),
(2, 'error_481', 'Similique accusantium voluptas officia fugit voluptatem qui.', 133, 'Atque et officiis nesciunt illo laborum.', 150, 0, 29, 740, 0, 1563265190, 1563577211, 0, NULL, NULL, NULL, NULL, 0, '0'),
(3, 'ea_807', NULL, 143, 'Sit quisquam at illo corrupti ea consequatur rerum necessitatibus.', 580, 16, 0, 90, 1, 1563265190, 1563755440, 0, NULL, NULL, NULL, NULL, 0, '0'),
(4, 'culpa_269', NULL, 119, 'Inventore consequatur sit harum sunt quaerat eum.', 720, 0, 0, 170, 1, 1563265190, 1563484363, 0, NULL, NULL, NULL, NULL, 1, '0'),
(5, 'fugit_302', 'Alias architecto dolor eum debitis molestiae modi.', 113, 'Qui odit omnis alias.', 420, 0, 0, 350, 1, 1563265190, 1563856268, 0, NULL, NULL, NULL, NULL, 0, '0'),
(6, 'dicta_870', NULL, 145, 'Excepturi suscipit asperiores molestias est.', 300, 0, 0, 90, 1, 1563265190, 1563400978, 0, NULL, NULL, NULL, NULL, 1, '0'),
(7, 'optio_867', 'Labore aliquam velit rerum ut maxime.', 112, 'Sit quidem et voluptates qui doloribus consequatur necessitatibus laudantium.', 180, 0, 0, 770, 0, 1563265190, 1563740449, 0, NULL, NULL, NULL, NULL, 0, '0'),
(8, 'et_292', NULL, 126, 'Facilis id reprehenderit accusantium ea iste magni corporis.', 260, 48, 11, 200, 0, 1563265190, 1564123764, 0, NULL, NULL, NULL, NULL, 0, '0'),
(9, 'itaque_750', NULL, 118, 'Sit sed ut ducimus repellendus atque.', 620, 23, 0, 790, 0, 1563265190, 1563887872, 0, NULL, NULL, NULL, NULL, 1, '0'),
(10, 'delectus_610', NULL, 128, 'In asperiores repudiandae tenetur est unde et et quasi.', 310, 0, 26, 60, 0, 1563265190, 1563929185, 0, NULL, NULL, NULL, NULL, 1, '0'),
(11, 'perferendis_584', 'Quisquam alias sit dolor officia voluptate tenetur hic minima saepe.', 142, 'Beatae dolorem ut ut sed exercitationem eligendi id.', 830, 9, 0, 540, 0, 1563265190, 1563544520, 0, NULL, NULL, NULL, NULL, 0, '0'),
(12, 'animi_299', NULL, 147, 'Neque deleniti perspiciatis repellat voluptatem blanditiis harum.', 700, 0, 0, 170, 0, 1563265190, 1564168638, 0, NULL, NULL, NULL, NULL, 0, '0'),
(13, 'repudiandae_399', NULL, 126, 'Quod et voluptas aut asperiores.', 60, 0, 0, 980, 0, 1563265190, 1563618473, 0, NULL, NULL, NULL, NULL, 1, '0'),
(14, 'rerum_348', NULL, 113, 'Et pariatur consequatur nemo similique explicabo odio eos alias.', 480, 0, 0, 270, 0, 1563265190, 1563871941, 0, NULL, NULL, NULL, NULL, 0, '0'),
(15, 'non_957', 'Rerum voluptas consequatur officiis ipsa nobis voluptas vel in quos.', 138, 'Consectetur enim nihil consequuntur minus ea sint.', 630, 38, 5, 750, 1, 1563265190, 1564043219, 0, NULL, NULL, NULL, NULL, 1, '0'),
(16, 'veniam_530', 'Voluptatem quisquam quibusdam dolor autem voluptates veniam et.', 149, 'Pariatur et dolorum laborum voluptatem.', 690, 25, 3, 350, 0, 1563265190, 1563590628, 0, NULL, NULL, NULL, NULL, 1, '0'),
(17, 'eum_967', 'Quam exercitationem tempora dolores expedita dolorem voluptatum.', 108, 'Sunt totam doloremque dolores aliquam quaerat.', 200, 0, 0, 500, 1, 1563265190, 1563693166, 0, NULL, NULL, NULL, NULL, 1, '0'),
(18, 'sed_702', NULL, 148, 'At maiores inventore nemo voluptatum consectetur suscipit.', 420, 1, 34, 190, 0, 1563265190, 1563732035, 0, NULL, NULL, NULL, NULL, 1, '0'),
(19, 'reprehenderit_128', NULL, 123, 'Exercitationem optio est ea.', 330, 0, 11, 940, 1, 1563265190, 1563952814, 0, NULL, NULL, NULL, NULL, 0, '0'),
(20, 'est_603', NULL, 151, 'Quibusdam ut et eum tempora.', 500, 0, 0, 750, 1, 1563265190, 1564107375, 0, NULL, NULL, NULL, NULL, 1, '0'),
(21, 'eum_303', NULL, 151, 'Ipsam sunt eaque possimus consectetur.', 820, 0, 8, 50, 1, 1563265190, 1563382557, 0, NULL, NULL, NULL, NULL, 1, '0'),
(22, 'provident_278', NULL, 142, 'Doloremque corporis reiciendis harum mollitia dolores saepe impedit.', 200, 6, 0, 700, 0, 1563265190, 1564243549, 0, NULL, NULL, NULL, NULL, 1, '0'),
(23, 'dolores_160', NULL, 143, 'Est voluptatem assumenda dolorem porro.', 840, 23, 47, 190, 0, 1563265190, 1563759095, 0, NULL, NULL, NULL, NULL, 0, '0'),
(24, 'culpa_453', 'Quaerat necessitatibus vel quidem molestiae velit aut sit nisi et et.', 132, 'Aut deserunt amet rerum quia quaerat.', 550, 16, 0, 670, 0, 1563265190, 1563668510, 0, NULL, NULL, NULL, NULL, 0, '0'),
(25, 'laboriosam_997', NULL, 148, 'Quos officia qui vero.', 170, 0, 36, 710, 1, 1563265190, 1563922543, 0, NULL, NULL, NULL, NULL, 1, '0'),
(26, 'tenetur_753', 'Sunt omnis cupiditate ut fuga rerum doloribus.', 132, 'Tempore eos culpa alias.', 430, 21, 39, 510, 0, 1563265191, 1563539531, 0, NULL, NULL, NULL, NULL, 0, '0'),
(27, 'qui_375', NULL, 149, 'Veritatis ducimus quia reprehenderit.', 220, 0, 0, 450, 0, 1563265191, 1564154125, 0, NULL, NULL, NULL, NULL, 0, '0'),
(28, 'rerum_786', NULL, 113, 'Cum qui consequatur ratione excepturi ut nam.', 60, 10, 1, 580, 1, 1563265191, 1563708194, 0, NULL, NULL, NULL, NULL, 0, '0'),
(29, 'quis_943', NULL, 147, 'Dolores quo eius doloremque id et optio quam.', 320, 0, 26, 110, 1, 1563265191, 1563948668, 0, NULL, NULL, NULL, NULL, 1, '0'),
(30, 'ut_887', 'Sequi nisi iusto delectus dignissimos dolor sequi.', 130, 'Ad tempora quo commodi temporibus qui.', 280, 7, 0, 690, 1, 1563265191, 1563843319, 0, NULL, NULL, NULL, NULL, 1, '0'),
(31, 'culpa_368', NULL, 149, 'Nihil est magni sed rerum rerum cumque eius.', 740, 0, 0, 930, 1, 1563265191, 1563616280, 0, NULL, NULL, NULL, NULL, 0, '0'),
(32, 'dolorum_818', NULL, 131, 'Omnis labore soluta sed quae eaque ea.', 410, 44, 48, 690, 0, 1563265191, 1563602873, 0, NULL, NULL, NULL, NULL, 1, '0'),
(33, 'occaecati_302', NULL, 132, 'Facilis quas illo corrupti quibusdam neque perferendis atque.', 660, 0, 50, 280, 0, 1563265191, 1563822913, 0, NULL, NULL, NULL, NULL, 1, '0'),
(34, 'quisquam_248', NULL, 113, 'Non tenetur dolor voluptatem quod.', 830, 35, 0, 160, 0, 1563265191, 1563578235, 0, NULL, NULL, NULL, NULL, 1, '0'),
(35, 'quo_827', NULL, 113, 'Architecto culpa vel minima maiores et.', 80, 0, 0, 180, 1, 1563265191, 1564185433, 0, NULL, NULL, NULL, NULL, 1, '0'),
(36, 'fuga_540', 'Quidem officiis vitae est eius voluptatibus.', 123, 'Et voluptatem explicabo consequatur iure error voluptas.', 630, 28, 0, 610, 1, 1563265191, 1564128238, 0, NULL, NULL, NULL, NULL, 1, '0'),
(37, 'nam_976', 'Molestiae qui nihil eveniet officia enim rerum illo.', 151, 'Assumenda quia ut nemo voluptas amet sint eaque.', 410, 1, 3, 640, 1, 1563265191, 1563400386, 0, NULL, NULL, NULL, NULL, 1, '0'),
(38, 'aut_173', 'Cupiditate amet quia enim laudantium est vel.', 106, 'Molestiae quia sed laboriosam corporis.', 500, 14, 30, 270, 0, 1563265191, 1563981075, 0, NULL, NULL, NULL, NULL, 0, '0'),
(39, 'veritatis_241', 'Dolor qui eligendi ut optio sit fugit impedit.', 112, 'Culpa repellendus sed sed iste.', 670, 0, 0, 840, 0, 1563265191, 1564062580, 0, NULL, NULL, NULL, NULL, 0, '0'),
(40, 'vel_497', 'Cumque accusamus dolor voluptas atque sequi delectus repellat sunt.', 126, 'Modi quos fugit dolorem cumque hic.', 50, 0, 49, 370, 1, 1563265191, 1563984953, 0, NULL, NULL, NULL, NULL, 1, '0'),
(41, 'cupiditate_250', 'Nihil unde excepturi porro quis officia voluptas et.', 149, 'Ducimus magni aut ut eaque.', 910, 0, 0, 250, 0, 1563265191, 1564201624, 0, NULL, NULL, NULL, NULL, 0, '0'),
(42, 'ipsam_675', NULL, 128, 'Voluptatem repudiandae qui aliquam voluptas.', 640, 30, 23, 430, 1, 1563265191, 1563807741, 0, NULL, NULL, NULL, NULL, 0, '0'),
(43, 'dolor_342', 'Quas voluptates laborum tempora accusantium voluptas laudantium maiores numquam quae.', 148, 'Sunt eos dolores autem quis.', 700, 0, 0, 730, 1, 1563265191, 1564125169, 0, NULL, NULL, NULL, NULL, 0, '0'),
(44, 'voluptatem_402', NULL, 132, 'Inventore eos nihil sit et qui suscipit nostrum voluptatem.', 720, 40, 33, 400, 1, 1563265191, 1563709215, 0, NULL, NULL, NULL, NULL, 0, '0'),
(45, 'quas_515', NULL, 123, 'Consequatur rerum deleniti sit.', 250, 0, 0, 210, 0, 1563265191, 1563964494, 0, NULL, NULL, NULL, NULL, 1, '0'),
(46, 'similique_452', 'Voluptatem aperiam saepe consequatur quia qui et qui nostrum consequatur.', 106, 'Voluptatem ea dignissimos et voluptas vitae quia itaque.', 940, 0, 34, 100, 0, 1563265191, 1563924830, 0, NULL, NULL, NULL, NULL, 1, '0'),
(47, 'quia_986', NULL, 118, 'Pariatur a voluptas dolor et.', 700, 0, 39, 590, 0, 1563265191, 1563621302, 0, NULL, NULL, NULL, NULL, 0, '0'),
(48, 'voluptas_824', 'Ut sunt nulla exercitationem reprehenderit expedita repudiandae aut adipisci ea.', 141, 'Enim natus quasi eaque cupiditate autem libero delectus.', 660, 2, 0, 470, 0, 1563265191, 1564046726, 0, NULL, NULL, NULL, NULL, 0, '0'),
(49, 'tenetur_951', NULL, 113, 'Sunt ut magnam ipsa ducimus.', 960, 0, 0, 570, 1, 1563265191, 1564031734, 0, NULL, NULL, NULL, NULL, 0, '0'),
(50, 'inventore_666', NULL, 128, 'Repellendus magnam quis ut sed eum.', 820, 22, 34, 550, 0, 1563265191, 1563477238, 0, NULL, NULL, NULL, NULL, 0, '0'),
(51, 'repellat_382', 'Quis voluptas sapiente et sapiente dolore sunt.', 112, 'Quaerat officiis odit doloremque eveniet velit qui temporibus.', 520, 0, 39, 950, 1, 1563265191, 1563739036, 0, NULL, NULL, NULL, NULL, 0, '0'),
(52, 'omnis_201', 'Accusamus earum modi accusantium maiores enim voluptas mollitia.', 126, 'Quo et inventore ipsum saepe consequatur enim maiores.', 370, 39, 0, 650, 0, 1563265191, 1563504465, 0, NULL, NULL, NULL, NULL, 0, '0'),
(53, 'consectetur_868', NULL, 126, 'Inventore veritatis deserunt mollitia inventore iusto illum.', 780, 0, 42, 90, 1, 1563265191, 1563987782, 0, NULL, NULL, NULL, NULL, 0, '0'),
(54, 'corrupti_930', 'Perspiciatis nemo modi neque ad quis natus aut.', 151, 'Et ea molestiae molestias minima tenetur rerum qui.', 770, 6, 22, 490, 1, 1563265191, 1563787367, 0, NULL, NULL, NULL, NULL, 1, '0'),
(55, 'iure_535', NULL, 139, 'Quos perferendis alias aperiam.', 820, 40, 0, 680, 0, 1563265191, 1564153029, 0, NULL, NULL, NULL, NULL, 1, '0'),
(56, 'dolorem_917', 'Hic nihil eum sint a culpa ducimus nam dignissimos sit dolore.', 131, 'Animi sint qui et.', 120, 0, 0, 500, 0, 1563265191, 1563865829, 0, NULL, NULL, NULL, NULL, 1, '0'),
(57, 'debitis_997', NULL, 137, 'Autem libero nulla fugit ut a at ut.', 180, 15, 0, 890, 1, 1563265191, 1563498017, 0, NULL, NULL, NULL, NULL, 1, '0'),
(58, 'in_409', 'Error unde aut amet nisi beatae quasi vero eos consequatur sed maxime.', 142, 'Ut sed recusandae ipsum minima in distinctio reprehenderit.', 940, 0, 22, 330, 0, 1563265191, 1563495782, 0, NULL, NULL, NULL, NULL, 1, '0'),
(59, 'facere_451', 'Perferendis omnis voluptatem doloribus dolores mollitia.', 141, 'Molestiae voluptates mollitia cupiditate laboriosam nostrum voluptatem non.', 260, 0, 0, 980, 1, 1563265191, 1564138185, 0, NULL, NULL, NULL, NULL, 0, '0'),
(60, 'eveniet_977', NULL, 139, 'Cum corporis doloribus hic et mollitia eaque.', 240, 0, 49, 360, 1, 1563265191, 1564100272, 0, NULL, NULL, NULL, NULL, 0, '0'),
(61, 'quibusdam_388', 'Sint aut repellendus eveniet non ut cum est nobis enim sit.', 123, 'Numquam unde molestiae id occaecati.', 350, 0, 0, 940, 0, 1563265191, 1563912775, 0, NULL, NULL, NULL, NULL, 0, '0'),
(62, 'hic_978', 'Maiores eaque voluptatum sint iusto consequatur natus unde.', 137, 'A velit explicabo dolor omnis quos inventore temporibus eius.', 860, 0, 0, 530, 0, 1563265191, 1563944291, 0, NULL, NULL, NULL, NULL, 1, '0'),
(63, 'neque_698', 'Distinctio consequuntur eos vel vel ea aspernatur sunt.', 142, 'Et est et occaecati similique nihil repellendus.', 200, 0, 30, 190, 0, 1563265191, 1563774362, 0, NULL, NULL, NULL, NULL, 0, '0'),
(64, 'inventore_259', NULL, 130, 'Eligendi est ducimus praesentium distinctio.', 370, 36, 7, 420, 0, 1563265191, 1563751108, 0, NULL, NULL, NULL, NULL, 0, '0'),
(65, 'vel_517', 'Nemo dolorum veritatis ea sint ipsam voluptas voluptas quidem.', 113, 'Distinctio nemo est amet sint.', 700, 0, 23, 570, 0, 1563265191, 1564141238, 0, NULL, NULL, NULL, NULL, 1, '0'),
(66, 'repellat_846', 'Natus consequuntur assumenda et aut qui repellendus saepe.', 123, 'Autem et placeat sint ut eius commodi architecto et.', 690, 15, 23, 640, 0, 1563265191, 1563377221, 0, NULL, NULL, NULL, NULL, 0, '0'),
(67, 'dolorum_241', 'Quam qui consequatur sint omnis omnis autem repudiandae porro vel magnam.', 108, 'Saepe reiciendis quia distinctio ex asperiores alias voluptatem.', 900, 0, 3, 290, 0, 1563265191, 1563697813, 0, NULL, NULL, NULL, NULL, 1, '0'),
(68, 'et_727', NULL, 122, 'Optio eveniet ad fugit dolorem.', 660, 0, 2, 130, 0, 1563265191, 1563854802, 0, NULL, NULL, NULL, NULL, 0, '0'),
(69, 'hic_968', NULL, 112, 'Laborum nulla velit fuga laboriosam aperiam doloribus.', 340, 46, 0, 270, 1, 1563265191, 1563749263, 0, NULL, NULL, NULL, NULL, 0, '0'),
(70, 'sed_711', NULL, 113, 'Sint tenetur non in vero.', 490, 0, 0, 320, 1, 1563265192, 1564150392, 0, NULL, NULL, NULL, NULL, 0, '0'),
(71, 'eum_786', NULL, 128, 'Quae suscipit voluptate quia corrupti esse.', 760, 0, 0, 230, 0, 1563265192, 1563779812, 0, NULL, NULL, NULL, NULL, 1, '0'),
(72, 'rerum_367', 'Sed sit et dignissimos qui vel quibusdam aut.', 129, 'Dignissimos quaerat corporis doloremque.', 280, 0, 0, 550, 0, 1563265192, 1563549911, 0, NULL, NULL, NULL, NULL, 1, '0'),
(73, 'modi_809', NULL, 145, 'Exercitationem sit nesciunt laboriosam impedit ex ipsam est eos.', 390, 0, 15, 200, 1, 1563265192, 1563427848, 0, NULL, NULL, NULL, NULL, 0, '0'),
(74, 'et_959', 'Dignissimos repellendus quia quos alias omnis et asperiores et qui.', 128, 'Sequi possimus occaecati veritatis sed eaque illo minima.', 820, 0, 42, 490, 1, 1563265192, 1564079620, 0, NULL, NULL, NULL, NULL, 1, '0'),
(75, 'facere_775', NULL, 142, 'Impedit qui quasi impedit harum voluptatem tenetur.', 80, 0, 0, 70, 1, 1563265192, 1564112668, 0, NULL, NULL, NULL, NULL, 0, '0'),
(76, 'non_938', NULL, 152, 'Nesciunt architecto soluta corrupti et quaerat quos.', 610, 0, 36, 450, 1, 1563265192, 1563393610, 0, NULL, NULL, NULL, NULL, 0, '0'),
(77, 'velit_241', NULL, 128, 'Et repellat voluptas nam ut.', 60, 0, 0, 560, 1, 1563265192, 1563839753, 0, NULL, NULL, NULL, NULL, 0, '0'),
(78, 'soluta_868', 'Sequi omnis sit voluptas aliquam placeat molestiae nobis error.', 109, 'Error ratione est reiciendis quo quia.', 780, 26, 31, 490, 0, 1563265192, 1563412951, 0, NULL, NULL, NULL, NULL, 1, '0'),
(79, 'consequatur_159', NULL, 142, 'Nihil eum esse ipsa laboriosam soluta suscipit.', 200, 0, 0, 620, 0, 1563265192, 1563727686, 0, NULL, NULL, NULL, NULL, 0, '0'),
(80, 'tempore_451', NULL, 124, 'Voluptate magnam vel quia soluta eveniet beatae qui.', 540, 30, 0, 800, 0, 1563265192, 1563888969, 0, NULL, NULL, NULL, NULL, 0, '0'),
(81, 'laborum_190', 'At pariatur id quaerat voluptas architecto.', 152, 'Exercitationem nobis beatae doloremque.', 310, 0, 0, 950, 1, 1563265192, 1563506703, 0, NULL, NULL, NULL, NULL, 0, '0'),
(82, 'doloribus_218', NULL, 152, 'In eum qui voluptate.', 800, 46, 0, 650, 0, 1563265192, 1563565703, 0, NULL, NULL, NULL, NULL, 1, '0'),
(83, 'ad_981', NULL, 152, 'Non suscipit sit dolor tenetur facilis.', 300, 6, 0, 860, 1, 1563265192, 1563391613, 0, NULL, NULL, NULL, NULL, 1, '0'),
(84, 'dignissimos_390', 'Aut corporis distinctio facilis molestias distinctio delectus.', 152, 'Nisi deleniti totam soluta.', 830, 0, 10, 740, 0, 1563265192, 1563805419, 0, NULL, NULL, NULL, NULL, 1, '0'),
(85, 'quod_657', NULL, 152, 'Est dicta optio soluta veritatis corrupti ut quia.', 490, 4, 43, 330, 0, 1563265192, 1563610837, 0, NULL, NULL, NULL, NULL, 1, '0'),
(86, 'molestias_660', NULL, 152, 'Sed dolore iure voluptas incidunt qui qui.', 70, 37, 9, 530, 0, 1563265192, 1563958259, 0, NULL, NULL, NULL, NULL, 0, '0'),
(87, 'aut_187', NULL, 152, 'Nam ut non eos harum eum aspernatur ducimus.', 510, 0, 0, 530, 0, 1563265192, 1563826288, 0, NULL, NULL, NULL, NULL, 0, '0'),
(88, 'nobis_217', NULL, 152, 'Pariatur quia similique inventore dolor eum quia quae.', 300, 0, 23, 970, 1, 1563265192, 1564216350, 0, NULL, NULL, NULL, NULL, 1, '0'),
(89, 'nam_257', 'A soluta officia sit similique quia deleniti doloribus et.', 152, 'Alias magnam aliquid ipsa et quibusdam.', 350, 0, 45, 890, 1, 1563265192, 1564178441, 0, NULL, NULL, NULL, NULL, 1, '0'),
(90, 'autem_239', NULL, 152, 'Labore necessitatibus accusamus nemo numquam quis.', 60, 5, 0, 320, 0, 1563265192, 1563751212, 0, NULL, NULL, NULL, NULL, 0, '0'),
(91, 'voluptatem_431', 'Libero nostrum accusantium expedita est possimus ut ut consequatur qui.', 152, 'Autem qui voluptas voluptatibus doloribus nesciunt illum laudantium.', 210, 0, 0, 890, 1, 1563265192, 1563943845, 0, NULL, NULL, NULL, NULL, 0, '0'),
(92, 'aut_109', 'Similique consequatur quaerat quod ea est eos qui explicabo voluptatem et delectus.', 152, 'Ea pariatur magnam quasi illo quaerat magnam repellat eius.', 900, 0, 0, 160, 1, 1563265192, 1564080603, 0, NULL, NULL, NULL, NULL, 0, '0'),
(93, 'voluptas_746', NULL, 152, 'Dolores rerum magnam asperiores molestias ut provident rerum.', 630, 0, 1, 940, 0, 1563265192, 1564058888, 0, NULL, NULL, NULL, NULL, 0, '0'),
(94, 'fugiat_459', NULL, 152, 'Dolorem magnam eum excepturi aliquam.', 660, 46, 43, 220, 1, 1563265192, 1563926580, 0, NULL, NULL, NULL, NULL, 0, '0'),
(95, 'incidunt_151', 'Voluptas odit delectus molestiae vel debitis ut voluptates nihil voluptatem sed.', 152, 'Reprehenderit dolorem incidunt harum illo eligendi.', 310, 0, 8, 610, 1, 1563265192, 1563865467, 0, NULL, NULL, NULL, NULL, 1, '0'),
(96, 'eos_381', 'Qui eveniet iusto blanditiis totam quaerat ab delectus.', 152, 'Quas id est illo voluptates quo voluptates provident qui.', 430, 0, 29, 90, 0, 1563265192, 1563673721, 0, NULL, NULL, NULL, NULL, 0, '0'),
(97, 'voluptas_723', 'Ea quia nulla quod quam sapiente ut quam ducimus quia.', 152, 'Ipsa voluptate reiciendis aut error est cupiditate.', 350, 0, 14, 390, 1, 1563265192, 1563703333, 0, NULL, NULL, NULL, NULL, 0, '0'),
(98, 'cumque_743', 'Accusantium minus sed qui quis beatae vel tempora ipsam.', 152, 'Aut eos non neque atque maxime.', 210, 34, 14, 510, 1, 1563265192, 1563367590, 0, NULL, NULL, NULL, NULL, 0, '0'),
(99, 'doloribus_545', 'Vel vel omnis cupiditate qui optio.', 152, 'Recusandae rerum culpa dolor quidem a et.', 240, 13, 18, 450, 0, 1563265192, 1563584713, 0, NULL, NULL, NULL, NULL, 1, '0'),
(100, 'esse_414', 'Accusantium dolor praesentium laboriosam consectetur eaque dolorum optio delectus.', 152, 'Voluptatibus delectus ut pariatur occaecati.', 630, 35, 0, 870, 0, 1563265192, 1563827587, 0, NULL, NULL, NULL, NULL, 0, '0');

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
(1, 'Molestiae omnis quia laudantium.', '59523', 'xmayert@yahoo.com', 'in', 'illum', '1563265193', 'rem', '28 minutes', 'Autem reiciendis eaque inventore aperiam.'),
(2, 'Officia dolor tenetur nisi.', '21248', 'effertz.estelle@murazik.com', 'sint', 'iste', '1563265193', 'aliquid', '4 minutes', 'Ut et provident non repellendus cum qui veritatis ea.'),
(3, 'Autem rem dicta.', '86941', 'hvolkman@yahoo.com', 'omnis', 'eum', '1563265193', 'velit', '18 minutes', 'Non unde ducimus illum itaque.'),
(4, 'Inventore quia nihil ab eos.', '28956', 'hettinger.roxanne@gmail.com', 'enim', 'harum', '1563265193', 'quisquam', '16 minutes', 'Dolorem eum saepe vel fuga beatae.'),
(5, 'Et odio iusto non quisquam.', '24941', 'harvey.arthur@yahoo.com', 'aut', 'enim', '1563265193', 'eos', '7 minutes', 'Dolores unde sed ullam earum fugiat velit ad.'),
(6, 'Nobis error quia delectus voluptatem.', '80530', 'lela52@yahoo.com', 'suscipit', 'fuga', '1563265193', 'neque', '3 minutes', 'Rem totam velit aut a nostrum quam itaque explicabo.'),
(7, 'Ipsam adipisci aut.', '96229', 'iankunding@nikolaus.com', 'corrupti', 'velit', '1563265193', 'ea', '3 minutes', 'Quaerat alias deleniti sit provident repellendus.'),
(8, 'Harum dolorum nihil dolores voluptatem.', '59743', 'gloria67@kemmer.com', 'a', 'quod', '1563265193', 'sit', '4 minutes', 'Placeat atque cupiditate soluta est iste recusandae illo officiis eum.'),
(9, 'Asperiores aut.', '36073', 'deanna30@kihn.com', 'optio', 'perferendis', '1563265193', 'est', '7 minutes', 'Natus vero quidem et.'),
(10, 'Rerum quisquam sunt.', '72365', 'king.braden@gmail.com', 'tempore', 'expedita', '1563265193', 'consequuntur', '12 minutes', 'Perferendis vel architecto quam assumenda at eos et quasi similique perferendis molestiae facilis.'),
(11, 'A perspiciatis voluptas laboriosam.', '11876', 'jhermann@hotmail.com', 'qui', 'necessitatibus', '1563265193', 'voluptatem', '19 minutes', 'Dolor rem blanditiis laboriosam magnam nostrum quo aut.'),
(12, 'Veniam adipisci harum illum.', '65308', 'berneice83@ziemann.com', 'dolor', 'qui', '1563265193', 'perspiciatis', '29 minutes', 'Et sequi aut maiores nesciunt consequatur qui sint vitae.'),
(13, 'Blanditiis pariatur quia.', '96096', 'zweissnat@gmail.com', 'assumenda', 'commodi', '1563265193', 'praesentium', '3 minutes', 'Voluptatem magnam soluta deserunt vitae expedita cum.'),
(14, 'Ea est.', '13808', 'llegros@gerhold.net', 'necessitatibus', 'quia', '1563265193', 'atque', '26 minutes', 'Debitis quis sit corporis quis vel aut inventore.'),
(15, 'Harum a expedita ut quia quasi.', '81400', 'leffler.rosalinda@little.com', 'qui', 'nulla', '1563265193', 'sit', '16 minutes', 'Qui magnam sint est architecto nihil commodi pariatur est aut praesentium.'),
(16, 'Officiis harum ut dolore.', '28034', 'evan26@gmail.com', 'quo', 'porro', '1563265193', 'nisi', '13 minutes', 'Ea voluptate repellat aut possimus nihil.'),
(17, 'Error et.', '92105', 'wlueilwitz@bergstrom.net', 'voluptatem', 'ut', '1563265193', 'libero', '27 minutes', 'Rerum commodi sapiente aut eligendi iure neque quidem nesciunt eius animi.'),
(18, 'Repellendus expedita voluptas sunt atque.', '21155', 'quitzon.kyler@gmail.com', 'earum', 'recusandae', '1563265193', 'ut', '28 minutes', 'Tenetur fugit eligendi harum veniam et voluptas id.'),
(19, 'Consequatur dolore.', '28788', 'howell.addison@hotmail.com', 'soluta', 'id', '1563265193', 'atque', '22 minutes', 'Consequatur sunt voluptatem provident rem rerum optio ipsa quasi numquam iste numquam.'),
(20, 'Rerum voluptatum.', '98567', 'schroeder.johan@trantow.com', 'possimus', 'et', '1563265193', 'suscipit', '5 minutes', 'Dolore quia sint quos et aspernatur omnis modi pariatur aut tempora expedita cupiditate.'),
(21, 'In eius corrupti mollitia.', '87344', 'qgrady@hotmail.com', 'nobis', 'voluptatibus', '1563265193', 'labore', '25 minutes', 'Esse et ex voluptatibus facilis iusto.'),
(22, 'Exercitationem quo commodi.', '47663', 'xshanahan@jaskolski.com', 'est', 'sunt', '1563265193', 'officia', '8 minutes', 'Nam maxime ab temporibus repellendus sint sed aut sunt.'),
(23, 'Ex ratione doloribus tempora.', '93630', 'anabelle76@miller.com', 'vero', 'autem', '1563265193', 'a', '27 minutes', 'Voluptas accusamus blanditiis aliquid eos autem quo aut cum.'),
(24, 'Quasi architecto sequi fugiat.', '92914', 'narciso81@yahoo.com', 'omnis', 'fugit', '1563265193', 'expedita', '6 minutes', 'Omnis nemo accusamus expedita est reiciendis.'),
(25, 'Consectetur explicabo dolores.', '52958', 'jovany80@baumbach.com', 'veniam', 'eos', '1563265193', 'voluptatem', '16 minutes', 'Nulla laudantium voluptates ipsa unde debitis vero adipisci iure dolor.'),
(26, 'Totam ratione recusandae voluptate.', '69135', 'reese37@gmail.com', 'autem', 'aut', '1563265193', 'voluptas', '30 minutes', 'Amet fuga qui a magnam ullam velit quos iusto placeat ratione fuga sit.'),
(27, 'Et occaecati odio doloremque.', '82231', 'stephen.yost@krajcik.biz', 'cum', 'praesentium', '1563265193', 'quia', '24 minutes', 'Animi voluptate assumenda occaecati laborum culpa ut est hic harum illum.'),
(28, 'In sapiente id quia qui.', '81315', 'yveum@white.com', 'mollitia', 'sequi', '1563265193', 'ipsum', '9 minutes', 'Dolorem rerum pariatur aut in.'),
(29, 'Sit doloremque voluptatem qui perspiciatis.', '99860', 'chad94@gmail.com', 'sit', 'consequuntur', '1563265193', 'dolorum', '26 minutes', 'Incidunt incidunt consectetur nihil dolor blanditiis autem iste impedit distinctio quidem.'),
(30, 'Consequatur sint vel.', '10117', 'koepp.regan@gmail.com', 'minus', 'itaque', '1563265193', 'est', '25 minutes', 'Et quo voluptate laborum recusandae eius qui voluptatem incidunt ipsum sequi.'),
(31, 'Ut explicabo.', '37699', 'ciara96@yahoo.com', 'placeat', 'culpa', '1563265193', 'dolor', '23 minutes', 'Sed dolor qui voluptates nulla cumque earum dolores.'),
(32, 'Et ullam omnis.', '51918', 'neoma.mayer@yahoo.com', 'dolorem', 'est', '1563265193', 'ipsa', '19 minutes', 'Necessitatibus qui quia dignissimos natus facere ratione totam quod ullam.'),
(33, 'Et reprehenderit deleniti.', '43769', 'pacocha.will@stokes.com', 'aperiam', 'quaerat', '1563265193', 'ea', '16 minutes', 'Provident laborum similique nulla delectus modi.'),
(34, 'Est voluptas perspiciatis.', '22005', 'cnitzsche@hotmail.com', 'maxime', 'iure', '1563265193', 'enim', '13 minutes', 'Consequatur dolores quod debitis sunt quia est nesciunt distinctio fuga porro.'),
(35, 'Et molestiae commodi.', '66022', 'littel.tyler@moen.com', 'alias', 'assumenda', '1563265193', 'rerum', '6 minutes', 'Non nihil officia error ipsa ea aut distinctio rem rem.'),
(36, 'Quis cupiditate.', '73969', 'rupton@mayert.net', 'incidunt', 'sit', '1563265193', 'et', '21 minutes', 'Earum ipsa ab a enim.'),
(37, 'Dolore dolor aut voluptas.', '76172', 'ludie96@treutel.net', 'dolor', 'nulla', '1563265193', 'suscipit', '14 minutes', 'Nisi est non molestiae quibusdam voluptas alias.'),
(38, 'Quos facere non.', '23882', 'antwon.kassulke@steuber.info', 'non', 'ut', '1563265193', 'aut', '2 minutes', 'Neque quod modi beatae tempore.'),
(39, 'Fugiat rerum amet nostrum nesciunt.', '78041', 'hodkiewicz.arch@yahoo.com', 'rerum', 'ut', '1563265193', 'eos', '28 minutes', 'Quia omnis reiciendis ut iste distinctio.'),
(40, 'Autem praesentium molestias velit.', '65189', 'ramona.kutch@hotmail.com', 'pariatur', 'eligendi', '1563265193', 'sint', '14 minutes', 'Voluptatem consequatur est assumenda cumque ea iste minima et.'),
(41, 'Qui iusto nihil rem temporibus occaecati.', '97118', 'carmel.metz@heidenreich.info', 'sunt', 'ut', '1563265193', 'labore', '7 minutes', 'Odit asperiores odio enim blanditiis perferendis asperiores quibusdam repellat voluptatem.'),
(42, 'Et magnam voluptatem ut nemo tenetur.', '38421', 'haven.monahan@hotmail.com', 'cumque', 'voluptatem', '1563265193', 'perspiciatis', '6 minutes', 'Occaecati eaque explicabo nulla est consequatur veritatis.'),
(43, 'Odio occaecati adipisci.', '42745', 'chaley@gleason.com', 'sint', 'quos', '1563265193', 'voluptatem', '29 minutes', 'Consequuntur alias necessitatibus porro velit rem et.'),
(44, 'Et eveniet sit.', '23302', 'rbechtelar@willms.com', 'eius', 'possimus', '1563265193', 'voluptatem', '4 minutes', 'Sit totam nihil dolores totam ratione qui qui optio.'),
(45, 'Nobis voluptatem impedit pariatur.', '38389', 'giles.herzog@yahoo.com', 'voluptatibus', 'eligendi', '1563265193', 'molestiae', '6 minutes', 'Non quia quidem dolores cum omnis autem.'),
(46, 'Sit impedit tempore occaecati laborum.', '83198', 'jacobi.alexandria@yahoo.com', 'eaque', 'cum', '1563265193', 'hic', '12 minutes', 'Velit architecto rem amet illum debitis tenetur quod aut ut et.'),
(47, 'Laborum enim fuga.', '22734', 'adrianna.boyle@gulgowski.info', 'cupiditate', 'optio', '1563265193', 'voluptatem', '30 minutes', 'Labore nesciunt voluptatem vel eum molestiae recusandae provident.'),
(48, 'Totam et expedita ratione dicta.', '21706', 'susana.casper@hessel.biz', 'non', 'sit', '1563265193', 'temporibus', '29 minutes', 'Et ad nemo voluptate harum ipsa vitae voluptatem dolorem est.'),
(49, 'Nostrum culpa aliquid.', '45859', 'tromp.cordell@hotmail.com', 'libero', 'consequatur', '1563265193', 'aspernatur', '25 minutes', 'Nihil deserunt tempora excepturi suscipit necessitatibus tempora.'),
(50, 'Recusandae eveniet ut.', '27395', 'sebastian.tremblay@conn.org', 'aliquam', 'corporis', '1563265193', 'vel', '23 minutes', 'Voluptatum magni earum dolor voluptatem est ea ut.');

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
(1, 'deserunt', '73111', 'Non iste.', 'Non nulla.', 'Vel voluptatem non necessitatibus laboriosam nisi.', '1563265193', '', 'Laboriosam totam quia nostrum sunt velit eum illum.'),
(2, 'magnam', '19306', 'Deserunt natus.', 'Et omnis.', 'Aperiam quo natus inventore dolore qui delectus error hic.', '1563265193', '', 'Earum ut possimus ratione.'),
(3, 'et', '66834', 'Eaque.', 'Ipsam repellendus aperiam.', 'Voluptatibus dolorum perferendis eveniet amet et nulla minus dignissimos.', '1563265193', '', 'Deleniti illum nihil inventore debitis.'),
(4, 'repudiandae', '56261', 'Enim est qui.', 'Voluptatem delectus.', 'In vel aliquid velit omnis sit.', '1563265193', '', 'Enim qui sit aliquam ex perspiciatis id.'),
(5, 'et', '25639', 'In pariatur.', 'Vel voluptatem aut.', 'Voluptatem qui fuga enim quaerat optio et.', '1563265193', '', 'Porro illo voluptatum dolores aliquid sit maxime.'),
(6, 'praesentium', '53476', 'Ab.', 'Aut et.', 'Sit qui quo non quidem eos voluptatem.', '1563265193', '', 'Magnam omnis et et saepe quas.'),
(7, 'soluta', '31107', 'Adipisci facere.', 'Id aperiam.', 'Unde nihil et.', '1563265193', '', 'Quis officiis autem nihil sit maxime impedit.'),
(8, 'possimus', '54064', 'Et commodi.', 'Sit atque.', 'Rerum harum quas enim.', '1563265193', '', 'Delectus est eos veniam.'),
(9, 'ipsa', '37825', 'Saepe.', 'Et iure.', 'Provident eaque officiis omnis quis.', '1563265193', '', 'Aut ipsa itaque cupiditate.'),
(10, 'sapiente', '11188', 'Amet.', 'Similique.', 'At sunt sed dicta.', '1563265193', '', 'Odio aut accusantium ad.'),
(11, 'beatae', '54325', 'Possimus qui quaerat.', 'Nam.', 'Nihil sed cum molestias laudantium.', '1563265193', '', 'Molestiae voluptatem veniam odit.'),
(12, 'blanditiis', '80652', 'Quae blanditiis.', 'Natus atque neque.', 'Qui et beatae tempore.', '1563265194', '', 'Doloremque quis quisquam et.'),
(13, 'eveniet', '55054', 'Magni omnis nihil.', 'Voluptate quia.', 'Nesciunt voluptate sunt voluptate neque inventore.', '1563265194', '', 'Tenetur vel voluptas et.'),
(14, 'qui', '74499', 'Ullam sed.', 'Recusandae consequatur.', 'Qui distinctio voluptates laboriosam.', '1563265194', '', 'Laboriosam molestias aut eos.'),
(15, 'totam', '98578', 'Ex eos.', 'Qui illum.', 'Nobis enim quibusdam ut praesentium rem aliquam.', '1563265194', '', 'Qui aut dolores culpa.'),
(16, 'in', '49595', 'Illum sit.', 'Laudantium.', 'Et sunt et autem odit.', '1563265194', '', 'Occaecati omnis soluta voluptatum sapiente dolores ea tempore.'),
(17, 'sint', '10349', 'Repellat esse est.', 'Vero.', 'Debitis expedita porro est et quis nihil.', '1563265194', '', 'Animi accusantium voluptatum a labore.'),
(18, 'aut', '99656', 'Quia.', 'Delectus explicabo ut.', 'Quos sed velit commodi.', '1563265194', '', 'Ratione natus ex.'),
(19, 'dolor', '93973', 'Rerum incidunt officiis.', 'Natus similique.', 'Laudantium qui non iure rerum exercitationem autem qui repellat.', '1563265194', '', 'Officiis accusamus sit consequatur vitae facilis qui.'),
(20, 'totam', '21258', 'Soluta quo.', 'Odio.', 'Non dolore accusantium qui id veniam.', '1563265194', '', 'At aspernatur ut vel.'),
(21, 'est', '37487', 'Maiores velit voluptatem.', 'Iusto vero eveniet.', 'Culpa nemo accusantium asperiores qui earum.', '1563265194', '', 'Iste blanditiis odit.'),
(22, 'iure', '62219', 'Vel nisi itaque.', 'Dolorem molestias.', 'Provident eum est quis perferendis iusto voluptas.', '1563265194', '', 'Occaecati debitis sint quia dignissimos.'),
(23, 'esse', '80712', 'Ipsa nulla.', 'Et sed.', 'Earum expedita impedit quas amet.', '1563265194', '', 'Eum minus assumenda non officiis.'),
(24, 'sunt', '44945', 'Eum ex error.', 'Qui dolorem.', 'Quasi sequi qui dicta.', '1563265194', '', 'Modi qui quisquam veniam repellat.'),
(25, 'aut', '55277', 'Id non.', 'Laborum error.', 'Corporis vel tempora.', '1563265194', '', 'Quisquam nobis voluptas ad rerum consequatur.'),
(26, 'architecto', '56528', 'Numquam voluptates omnis.', 'Dolores voluptates.', 'Perferendis eum corporis vel.', '1563265194', '', 'Natus expedita nobis ducimus voluptatem dolorum vitae.'),
(27, 'cumque', '63762', 'Et.', 'Occaecati dolor.', 'Voluptas quo similique quisquam ducimus aliquid deleniti nihil.', '1563265194', '', 'Quia ratione amet necessitatibus inventore.'),
(28, 'illo', '43805', 'Doloribus vitae.', 'Et consequatur rerum.', 'Voluptatem veritatis quo.', '1563265194', '', 'Odit aliquam consequuntur rerum.'),
(29, 'quisquam', '18444', 'Asperiores natus.', 'Corporis quis.', 'Mollitia consequatur dolores voluptas beatae natus.', '1563265194', '', 'Id eum eligendi esse.'),
(30, 'maiores', '47508', 'Dolor fugit.', 'Est.', 'Eligendi et doloribus maiores harum.', '1563265194', '', 'Molestiae odio voluptatem.'),
(31, 'aut', '14518', 'Cum.', 'Est tenetur.', 'Illo unde quam.', '1563265194', '', 'Architecto est sunt deserunt.'),
(32, 'laborum', '77281', 'Nisi repellendus aut.', 'Quisquam culpa.', 'Quo ut neque maxime id architecto commodi.', '1563265194', '', 'Veritatis sed dolorem.'),
(33, 'voluptatem', '71609', 'Illum sit.', 'Pariatur fugit.', 'Ab est repudiandae assumenda animi aut.', '1563265194', '', 'Quidem omnis iste saepe veritatis qui corporis.'),
(34, 'nostrum', '41901', 'Aut non.', 'Laboriosam est itaque.', 'Vel voluptatem temporibus recusandae quis sequi rem quas maiores.', '1563265194', '', 'Et asperiores quibusdam dolorem illo.'),
(35, 'animi', '26149', 'Hic itaque.', 'Non nihil.', 'Id quam doloribus voluptatem consequuntur est harum.', '1563265194', '', 'Numquam laudantium velit sed autem.'),
(36, 'provident', '47533', 'Itaque ut.', 'Recusandae eius.', 'Eligendi cumque unde illo.', '1563265194', '', 'Ut ut quis voluptate explicabo est facere.'),
(37, 'voluptas', '19118', 'Eveniet error sapiente.', 'Non recusandae.', 'Explicabo porro sit quaerat officiis.', '1563265194', '', 'Et adipisci saepe aut magnam perferendis explicabo amet.'),
(38, 'et', '39126', 'Velit.', 'Ut ut.', 'Enim rerum odit veniam et eveniet.', '1563265194', '', 'Pariatur reprehenderit dignissimos distinctio expedita aut velit quia.'),
(39, 'voluptas', '79573', 'Soluta sapiente.', 'Et aspernatur.', 'Ut officia sed dolores atque.', '1563265194', '', 'Dolorem quos natus qui voluptates.'),
(40, 'aut', '67431', 'Aut.', 'Accusantium.', 'Rem ab laborum fugit voluptatibus.', '1563265194', '', 'Tempora qui consectetur ut sit dolorem magnam.'),
(41, 'numquam', '66227', 'Omnis minus.', 'Nihil alias.', 'Commodi perferendis eveniet blanditiis qui.', '1563265194', '', 'Dolor eius rerum quidem eum voluptatum.'),
(42, 'ex', '96298', 'Magnam maxime.', 'Provident iure.', 'Nam et aut.', '1563265194', '', 'Provident aut consequatur.'),
(43, 'est', '33348', 'Nihil.', 'Dolores.', 'Iure neque molestias eum.', '1563265194', '', 'Optio id a.'),
(44, 'consequuntur', '17439', 'Voluptas molestiae.', 'Consequatur a.', 'Impedit molestiae laudantium molestiae saepe magnam.', '1563265194', '', 'Assumenda sit doloremque et blanditiis esse quo.'),
(45, 'enim', '67606', 'Iure molestias.', 'Voluptatem ut.', 'Nesciunt reiciendis qui inventore voluptas nihil iste placeat.', '1563265194', '', 'Quis est voluptatum sunt quis fugit aut.'),
(46, 'quae', '64141', 'Accusamus.', 'Animi.', 'Accusantium rerum ut eius porro.', '1563265194', '', 'Maxime et voluptatem nemo.'),
(47, 'minima', '31723', 'Quia omnis.', 'Suscipit perspiciatis.', 'Enim at quaerat similique.', '1563265194', '', 'Itaque blanditiis quod repellat eum eligendi quasi saepe eos.'),
(48, 'libero', '21959', 'Tenetur commodi corporis.', 'Nihil omnis.', 'Omnis occaecati sequi quibusdam.', '1563265194', '', 'Repudiandae perspiciatis et quisquam molestias unde aliquam.'),
(49, 'non', '19761', 'Sit.', 'Laudantium perspiciatis.', 'Consectetur vitae rerum.', '1563265194', '', 'Repellendus hic quis aut est.'),
(50, 'ratione', '73377', 'Et.', 'Sunt ipsum enim.', 'Et aut quaerat aut quia soluta.', '1563265194', '', 'Distinctio culpa quaerat minima dicta.');

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
(1, 'dicta', 'autem', 3, '102', ''),
(2, 'rerum', 'harum', 4, '59', ''),
(3, 'dolorum', 'qui', 1, '61', ''),
(4, 'aut', 'in', 3, '62', ''),
(5, 'quis', 'qui', 1, '100', ''),
(6, 'quas', 'ab', 3, '78', ''),
(7, 'sit', 'modi', 3, '70', ''),
(8, 'minus', 'et', 2, '77', ''),
(9, 'vero', 'non', 4, '92', ''),
(10, 'veniam', 'laborum', 3, '99', ''),
(11, 'eligendi', 'eum', 4, '81', ''),
(12, 'est', 'esse', 1, '84', ''),
(13, 'natus', 'molestiae', 4, '66', ''),
(14, 'laboriosam', 'at', 3, '96', ''),
(15, 'ea', 'molestiae', 4, '94', ''),
(16, 'cupiditate', 'rerum', 1, '91', ''),
(17, 'et', 'voluptatem', 1, '71', ''),
(18, 'ut', 'consequuntur', 1, '101', ''),
(19, 'natus', 'est', 2, '87', ''),
(20, 'eum', 'fuga', 1, '101', ''),
(21, 'voluptatibus', 'facilis', 2, '53', ''),
(22, 'rem', 'recusandae', 2, '88', ''),
(23, 'quia', 'autem', 4, '92', ''),
(24, 'aut', 'quibusdam', 3, '64', ''),
(25, 'et', 'ut', 2, '97', ''),
(26, 'quasi', 'illo', 2, '63', ''),
(27, 'veritatis', 'qui', 3, '64', ''),
(28, 'dicta', 'voluptas', 2, '83', ''),
(29, 'voluptatem', 'cumque', 2, '58', ''),
(30, 'id', 'magnam', 1, '60', ''),
(31, 'maxime', 'facere', 4, '64', ''),
(32, 'eius', 'omnis', 1, '79', ''),
(33, 'saepe', 'dolorem', 1, '77', ''),
(34, 'consequatur', 'et', 4, '96', ''),
(35, 'ut', 'nisi', 1, '101', ''),
(36, 'velit', 'est', 3, '90', ''),
(37, 'sed', 'ullam', 2, '78', ''),
(38, 'in', 'inventore', 2, '61', ''),
(39, 'et', 'quisquam', 1, '85', ''),
(40, 'aspernatur', 'illo', 1, '83', ''),
(41, 'ipsam', 'et', 4, '90', ''),
(42, 'similique', 'sint', 1, '56', ''),
(43, 'quae', 'culpa', 2, '71', ''),
(44, 'numquam', 'nulla', 3, '68', ''),
(45, 'in', 'et', 2, '72', ''),
(46, 'tempore', 'rem', 3, '98', ''),
(47, 'fugiat', 'cumque', 2, '71', ''),
(48, 'corporis', 'totam', 1, '91', ''),
(49, 'laborum', 'aut', 3, '100', ''),
(50, 'ratione', 'minus', 1, '95', '');

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
(1, 'ahmedsk', 'sherman.berge@considine.com', '$2y$10$f6OVCt9TyUMElTLgC.a5Wuc6Fo9eu01fB5rCg.bfja7GRyr.Ih3zS', '', 'Ahmed Sayed', 'admin', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '968676', '+74 3867986', 0, 0, 0, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(2, 'Virtu', 'everette.king@gmail.com', '$2y$10$zCzBzJ3W/gc4Od10xRAtg.A7uLDt6pCfByri1ZU1OI2X2d39riIiC', '', 'virtu', 'admin', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '795460', '+99 3723064', 0, 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'willis.daugherty', 'rzieme@howe.net', '$2y$10$ffRBhRY.3GTWkG2d4arpHu8widwwqNwqPLoXT9prSxEyjBFkCvWwG', '', 'Ms. Raegan Ferry', 'employee', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '979028', '+20 7621285', 0, 0, 0, '', NULL, '', '06.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'desmond36', 'izabella65@oberbrunner.net', '$2y$10$yBm2EAzY0WCGQpTrImTG..rvE1Br.bja9je0DFhrytEhZhkiYS/XO', '', 'Rex Moore', 'employee', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '272368', '+52 1734546', 0, 0, 0, '', NULL, '', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'marlee.rosenbaum', 'crooks.dorris@luettgen.biz', '$2y$10$L4TByFlKlZ0zJGrkzr3UaOlD2.7LGJM85pLgw2yz7yehI539G8jSq', '', 'Ezekiel Bosco DVM', 'employee', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '182557', '+54 4315157', 0, 0, 0, '', NULL, '', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'reichert.palma', 'nash.bauch@yahoo.com', '$2y$10$CdwNV4AFoXUhShc.oswUneS3.lCnpoT6i/zs9pjkehb/OotMLij.C', '', 'Immanuel Daniel III', 'employee', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '584834', '+35 1403042', 0, 0, 0, '', NULL, '', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'dickens.whitney', 'hauck.ardella@heaney.com', '$2y$10$jJIc7Yy/e5XXQcKk6TL4Ees34fp5U676DhROz1RhA1kOEaak8wf1m', '', 'Miss Adrienne Roob Sr.', 'employee', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '377563', '+73 3650988', 0, 0, 0, '', NULL, '', '085.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'iwunsch', 'savanna.gaylord@nader.com', '$2y$10$5gufH8lP6I9MtREMg.Spn.oawVHW3Q9H7U7ejqi/v0FQUcjTBakrO', '', 'Eddie Mertz', 'employee', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '881212', '+52 7896998', 0, 0, 0, '', NULL, '', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'jacey.sporer', 'willow.leuschke@rowe.net', '$2y$10$DuAhOnK1AVwAk0ds5b4kGOgiYPCYpJvHcJ19G8C5k.ixB/WSvfLse', '', 'Enid O\'Keefe', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '365261', '+15 6974568', 0, 0, 0, '', NULL, '', '012.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'metz.candida', 'enrique48@wolf.org', '$2y$10$N35RpNfERvzA9VtxKAxWguUQZ2vm5U4dEqed2tSvaCTrQXjQg2Le2', '', 'Mr. Emiliano Walter', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '897351', '+29 3062982', 0, 0, 0, '', NULL, '', '066.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'oroberts', 'schamberger.michale@hotmail.com', '$2y$10$f0Ih1wDhi8ms0C16m4r/puxv.kBdHgc4KYxmRreJLuLsOy0sFhV6O', '', 'Delpha Champlin', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '859640', '+48 2320389', 0, 0, 0, '', NULL, '', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'velda08', 'schowalter.lucile@yahoo.com', '$2y$10$MD12AVsOHwlHgaD8v3sw4.dCwNT9TIxrFOLJZye.cOTyhXb9ohjYe', '', 'Garrison Hill II', 'employee', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '116681', '+85 2401946', 0, 0, 0, '', NULL, '', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'madaline.walker', 'rose.considine@dicki.com', '$2y$10$JbDG3Htz5jpdhlE36IFEwuFcBZjRYW6H6x9UBanCYqsMvBDrdPL7C', '', 'Randall Pagac', 'employee', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '314401', '+65 3626704', 0, 0, 0, '', NULL, '', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'susie55', 'kschinner@gmail.com', '$2y$10$V1o.ExwH6VrTi6cKYhvZHeNU4i30SiD.s5j4vEc49QPr2NLqxnKbq', '', 'Rahul Batz', 'employee', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '292405', '+57 9892055', 0, 0, 0, '', NULL, '', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'kupton', 'josefina.treutel@gmail.com', '$2y$10$Vnl/2u1rodaeX/oI7eY8z.cpzywqm/Nr6gaPG9rlwgCS7a3fbXzBq', '', 'Ms. Aliya Mohr', 'employee', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '715593', '+70 4623269', 0, 0, 0, '', NULL, '', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'jdickens', 'brice62@gmail.com', '$2y$10$C0blQTjcLdWyO7rn5CAWG.X37sFtxEBfbrggPTq/0vs7RHANrXj6G', '', 'Rosalyn Cummerata', 'employee', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '604615', '+28 7606105', 0, 0, 0, '', NULL, '', '057.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'keagan.shields', 'littel.edgar@schuppe.com', '$2y$10$o/u5I.lPhAxBi9Zj2yfOVeZz8YkHEMNcxoi3kn/qgrnaVdXObZmZa', '', 'Mozelle Spencer', 'employee', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '169270', '+52 7735897', 0, 0, 0, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'wendell.ziemann', 'mueller.ariane@hotmail.com', '$2y$10$NVb6CemdjXiA96keJrKp1e7Ome8rw5DAPNHjOr.Sob7VghEMO03Y6', '', 'Brandi Wiegand', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '551453', '+37 9701681', 0, 0, 0, '', NULL, '', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'brian36', 'pmayer@yahoo.com', '$2y$10$2amWxmyMR0gu41fF8z3VduntCIBHJjXpKdNlwcHasumgxUejwVzMe', '', 'Monroe Hudson', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '773845', '+95 7743652', 0, 0, 0, '', NULL, '', '060.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'preston12', 'hubert21@denesik.net', '$2y$10$HOL.qDLJdud/qKXPJ8L6Ruz4nuvMJ/bAWtqH6592jVYnuBFYUW1A2', '', 'Gaylord Klein', 'employee', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '613493', '+13 5938564', 0, 0, 0, '', NULL, '', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'madyson.wiegand', 'htreutel@hotmail.com', '$2y$10$Bp7VWZ5HOQaZU1mrxsbAdO6JDsZuWJtOvZ.hRZtgwMmOmw0WNcls6', '', 'Davion Senger II', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '372289', '+99 6203064', 0, 0, 0, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'knienow', 'alexie51@harris.com', '$2y$10$Iqz1LtaUrl7uXHvSpz9qM.LRgXsmFd6YkXsXhf3r5R//wIu2SflR6', '', 'Katarina Ebert', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '239638', '+87 2645999', 0, 0, 0, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'otha91', 'phamill@gmail.com', '$2y$10$UBavtcu3JAFpnjzEsOI92exy1C5rh0xpvgW6oI0.4Dj6IoOz/T7xS', '', 'Jude Mosciski', 'employee', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '748967', '+30 6267877', 0, 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'alice.predovic', 'frederik47@gmail.com', '$2y$10$xdKAM9YZ5Zv3i.HEKgYzGeKMkOdgnDOFT5guhjaTUUNyH/VibGuzy', '', 'Valentina Batz I', 'employee', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '934004', '+85 2763759', 0, 0, 0, '', NULL, '', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'germaine.feil', 'amparo.schulist@hotmail.com', '$2y$10$KbymviTafOnjSJVAhG7fyeJL81/Ogj3dMRVmntlCZBeuX4aifxSjK', '', 'Magdalen Davis', 'employee', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '652661', '+64 3086176', 0, 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'zlehner', 'sophie.strosin@rohan.com', '$2y$10$DupXB3RYo90A/zJQD7rQNeQJldcqCYgRLqUnd3logTNPFqE2vG6Hi', '', 'Roma Swaniawski', 'employee', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '211948', '+74 4393568', 0, 0, 0, '', NULL, '', '090.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'hardy07', 'oberbrunner.amani@gmail.com', '$2y$10$fSV.RBq5Qyc8uMeZdmZA1ux9ep6JCzvAEg0Mqgy88PrOQeBcqoGKa', '', 'Rusty Kirlin', 'employee', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '774241', '+55 6938658', 0, 0, 0, '', NULL, '', '063.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'hodkiewicz.berneice', 'nicolas.kemmer@krajcik.com', '$2y$10$A0Tl6dBGCKOOOYU0CclA7e8mFePKqli9SEjbhEqz9we8hPJVuc0ma', '', 'Cristobal Wunsch', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '871921', '+87 3328386', 0, 0, 0, '', NULL, '', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'fgusikowski', 'ernser.kiarra@hilpert.info', '$2y$10$mQ7Pvv1L3ARMNqpcGLRLa.vrOE/Grz6JahMitt5tFXbpK8ViIrRTG', '', 'Rod Witting', 'employee', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '957129', '+32 9134665', 0, 0, 0, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'ankunding.samanta', 'rupert30@gmail.com', '$2y$10$CjaLNGdnWYplPJ3JFadPr.V3rHkgQoIeWRyg5USjjv1A6PdySFoFu', '', 'Dr. Justice Tremblay III', 'employee', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '954884', '+80 8775627', 0, 0, 0, '', NULL, '', '073.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'konopelski.griffin', 'hoppe.uriel@moore.com', '$2y$10$k1ZYCIte/4FPys2aetoceOwMhaPe6AqOfxPWQLVF5RJtp0jQzeqD2', '', 'Sherman Ward Jr.', 'employee', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '848942', '+93 9241831', 0, 0, 0, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'hgoyette', 'beer.javonte@lang.com', '$2y$10$nRojJAVigTHS/W5Am478uuSejz2ne1fCYxCIy/J0I8FJ031QX0jea', '', 'Prof. Miguel Ruecker', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '567120', '+95 1802743', 0, 0, 0, '', NULL, '', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'monte.nader', 'elvis.wolff@feest.org', '$2y$10$/B2Q/vK9.Ok1ZA1VkucHUe4EE2KA4U5WP5nFnLhdduLHbrONJHzoa', '', 'Krystina Toy', 'employee', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '807015', '+27 7443559', 0, 0, 0, '', NULL, '', '041.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'wparker', 'hilario91@trantow.com', '$2y$10$xREjAGkpjfBcYpvTpFrlG.zuQGR0R7h2TdmOkeTtjNjbSyKyIRd.G', '', 'Gaylord Fadel', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '352266', '+78 2299882', 0, 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'manley03', 'shayna49@kunde.biz', '$2y$10$kp/OHPFWRO7/fpR8hAD7N.GHt7LcX1PNoOx/nT7Hdv3g7OXIkix5.', '', 'Lionel Jakubowski', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '253806', '+78 6347459', 0, 0, 0, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'lisette.mertz', 'berge.bud@hotmail.com', '$2y$10$FnQJCMfs4x.P6VxRl/aBMehj9LPFx4oq5yHvqIGj0a21jSA1JkU46', '', 'Royce Steuber IV', 'employee', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '469702', '+17 5812416', 0, 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'qdamore', 'egreenholt@kuhn.net', '$2y$10$7J9qeC31CW6hEjazUoQGtu3L7pwQFYhnIy1ZyEQxwXL/VugYG0Vo6', '', 'Alize Wyman DDS', 'employee', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '842189', '+20 8225805', 0, 0, 0, '', NULL, '', '017.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'qspencer', 'rice.helen@olson.com', '$2y$10$C3RE.LgQMwK1cKAizjNBW.6kG9sh/bW.KX/im6QYxoWrxGKwMbo6W', '', 'Beryl Blanda', 'employee', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '239394', '+62 2086748', 0, 0, 0, '', NULL, '', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'tmayer', 'haag.roderick@hotmail.com', '$2y$10$4AiPB9dpSafd3QxiCYCRVeIeq0hUIzJv0ygPwSFH5WP2lh.qnU1TO', '', 'Idella McDermott', 'employee', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '396142', '+46 8246266', 0, 0, 0, '', NULL, '', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'octavia.homenick', 'tskiles@pouros.com', '$2y$10$MVCxJlw0dkoamSCs.reToe4w9xr/gVZYjtZqxfBJRlD/cDR6sulhy', '', 'Mozell Barrows', 'employee', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '630546', '+92 6021028', 0, 0, 0, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'goconnell', 'wolff.rico@mcglynn.net', '$2y$10$q49gjxzUC.LBhPnP2nOS4uPf7lwChW1J0PJqSdCQ7/LXq3jZNnUb2', '', 'Miss Catalina Torphy', 'employee', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '904965', '+79 8590879', 0, 0, 0, '', NULL, '', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'griffin51', 'toy.kendall@volkman.com', '$2y$10$6DocCgIeG.xVuRzYjzTKnuQd78fKScocvtOeR4yOaeyCzL5LTXbia', '', 'Aubree Hahn', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '481150', '+47 3645954', 0, 0, 0, '', NULL, '', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'schaden.erick', 'xcrist@yahoo.com', '$2y$10$i.PlyFxJE6ozcSWB9.ShCOL.u0ZqQ..nx/XE7nLqdDzdVbLt3eKUm', '', 'Cynthia Jakubowski', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '998794', '+31 1666766', 0, 0, 0, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'ryan.kobe', 'wilhelmine.berge@hotmail.com', '$2y$10$hxdbAeF4dc9Z/3G/HpSJ1O9F.wlvz0Nx.xDpH1Mc8PP5greZnznU6', '', 'Brayan Krajcik', 'employee', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '958513', '+34 1136922', 0, 0, 0, '', NULL, '', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'lavon71', 'curt65@hotmail.com', '$2y$10$.KftWQQnsGKnHpynUw3RkemgLQe3ZsZzeFHuy9Fwzu7yVDEj6V3p6', '', 'Jillian Kling', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '414767', '+39 5069039', 0, 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'jortiz', 'beatty.else@gmail.com', '$2y$10$f55jzAm7BBtRnQ16YeSLPujZip33ECTz4.gcbhRK0Tcvblpjy33nm', '', 'Layne Lebsack PhD', 'employee', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '932498', '+19 8977870', 0, 0, 0, '', NULL, '', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'hschamberger', 'marks.lucienne@collins.com', '$2y$10$Y8naVKDGEQlA.6cEYBKqV.8ZYv1YOcqkQovhW.XGCyX5VeTl.BkOa', '', 'Prof. Burdette Klein V', 'employee', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '117231', '+67 2091162', 0, 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'hassie.rohan', 'ekris@hotmail.com', '$2y$10$3asPzBfI/nEXbkZpsGRLq.5e162A9aNTAyLssykwtBxhRO/Kq8bI2', '', 'Stanford Konopelski', 'employee', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '234125', '+57 2324532', 0, 0, 0, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'nikolaus.moshe', 'king.vidal@casper.biz', '$2y$10$DOPcHFAHmA8to7FWtP2LfehQKChDorLXCIG8iA30/IvoVbliM.WAO', '', 'Hardy Reichert', 'employee', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '138028', '+27 1954880', 0, 0, 0, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'mschuppe', 'rosendo67@hotmail.com', '$2y$10$FNgW5P14Kz4l57tRwcH.IuK/F9MR6E0pxSrjj0YbPhl98PjHzAJri', '', 'Virginie Donnelly', 'employee', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '756181', '+83 3823052', 0, 0, 0, '', NULL, '', '088.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'tierra67', 'bergnaum.betty@bailey.com', '$2y$10$3DvSMzXQ8UTDUydzVip3ieAdVMKaYFWUfkvjTKCftqe9UW1hQU9ye', '', 'Prof. Florence Hauck', 'employee', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '492090', '+30 4585387', 0, 0, 0, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'carmen.crooks', 'auer.cornelius@satterfield.com', '$2y$10$33TS6WQLETu8g1Yuhv4Zd.kct0nMxFgKzkEOf2NHAtRfwu29Y4pky', '', 'Gloria Tremblay', 'employee', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '896493', '+18 1358862', 0, 0, 0, '', NULL, '', '052.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'mariana34', 'will.cristina@keebler.info', '$2y$10$uxB67uPkT8Q9u59FaAga/.07NcW5iqfxwEEa2MbPq/AJVC1RVrGoG', '', 'Orin Von', 'teacher', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '949387', '+63 6788223', 0, 0, 0, '', NULL, '', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'ali01', 'rstrosin@hotmail.com', '$2y$10$NXWXHSxkcI34kD9e9blGx.be1zP2.b1AV7A33zJyISbW42WKzWHXO', '', 'Reece Lockman', 'teacher', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '738291', '+16 7224588', 0, 0, 0, '', NULL, '', '079.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'qrowe', 'veum.marcelino@bode.com', '$2y$10$pVCF03WuUGfRE3Ep98vqZew.15Ue5atOjRCCWlyiP0Irhcs9PXyZm', '', 'Maribel Ortiz', 'teacher', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '301879', '+61 5136918', 0, 0, 0, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'brent.vonrueden', 'ismael.little@yahoo.com', '$2y$10$p/KkipPCSWBxV9fceSCeQ.KXZgho2j29MJBNqXDYkoSFNlKtFFOcS', '', 'Nick Swift IV', 'teacher', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '562870', '+37 3941518', 0, 0, 0, '', NULL, '', '09.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'ankunding.cali', 'donna.smitham@yahoo.com', '$2y$10$Y3YF2OJW15nH2pjrM8W7duZQ/KJBugF0vg659yTq3FMk0otB5ec0G', '', 'Lauren Upton', 'teacher', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '221592', '+89 8958114', 0, 0, 0, '', NULL, '', '02.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'mbernhard', 'yhessel@barton.com', '$2y$10$kjZC06a4Ue0X.UxBCCULieRvMlD4iHhGCfopawt2p/uz4iamPbxdK', '', 'Emelie Hoeger', 'teacher', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '373191', '+36 3601693', 0, 0, 0, '', NULL, '', '047.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'derek07', 'georgianna.bartell@gmail.com', '$2y$10$gSYE.07j1/hkMNCEdv8VI.QmL/8j8d/3LFkbihmGp.p6v6c1bHrKe', '', 'Ms. Clarissa Purdy III', 'teacher', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '596420', '+45 6247036', 0, 0, 0, '', NULL, '', '053.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'rebeka80', 'kulas.darrel@maggio.com', '$2y$10$gakNbUy5nDMBvfPEpxYDguxMzc91PG5vq1X85ARXFrEoZaujuM0ke', '', 'Joanne Murphy', 'teacher', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '489599', '+99 9605296', 0, 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'newell45', 'hsipes@yahoo.com', '$2y$10$ZC8fqwcgPQRCB4EMn8m8xuiYtz80DT1BD4DouvrdOmxFJtkSpjv9G', '', 'Dr. Amparo Keeling', 'teacher', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '106513', '+83 5037450', 0, 0, 0, '', NULL, '', '027.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'mariah.beatty', 'damon69@yahoo.com', '$2y$10$Zbxm.hBEL7SHZmXOG7jjCOSUvoq0GS/26vlnh7h8WbXHM3bQeXcD.', '', 'Genoveva O\'Kon', 'teacher', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '801206', '+60 9726661', 0, 0, 0, '', NULL, '', '015.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'jayne.leannon', 'olson.madalyn@mueller.biz', '$2y$10$AT3ASxojUKCsnR4i6dj1v.FcQAuyuKPNLmV.mtsWBTKzzt5TDnzBq', '', 'Helga Johns', 'teacher', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '435395', '+45 2498909', 0, 0, 0, '', NULL, '', '012.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'annamarie.schaden', 'tnicolas@schiller.biz', '$2y$10$Ow.P3qBGa7HgYVmfJTA6MuQyHvookNqRC5VxuqiQJSQY1sZpPS4dG', '', 'Dr. Paula Rosenbaum', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '834974', '+39 5797080', 0, 0, 0, '', NULL, '', '061.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'name.cronin', 'edmond92@frami.com', '$2y$10$drov3tnzVVlbhkHUY8K6mu8hbc09rC/VKDGokTGqMn0/oGsCIMSbO', '', 'Mr. Dillon Gleason', 'teacher', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '846032', '+76 1321760', 0, 0, 0, '', NULL, '', '073.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'marguerite63', 'olen87@kunze.org', '$2y$10$7OiWZa.wOaCwJhUMEjKMMOpFeKbk04wl0Pzs7r5e3ar4rDyOR12P.', '', 'Maurice Prohaska MD', 'teacher', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '109804', '+43 4702432', 0, 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'monroe.wisoky', 'darryl93@hotmail.com', '$2y$10$UDNlDM/TJVfSuS7KMS5nruNh7a1PkJTA2fk9GuTxAbQIUO9OyD4Ra', '', 'Cordell Green', 'teacher', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '464243', '+94 7880998', 0, 0, 0, '', NULL, '', '017.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'vandervort.wilford', 'okon.payton@yahoo.com', '$2y$10$Y9S.vX4gpKUUqrri7P8BI.cmeXWPuQVHmQCXpM7fRhJdjQPmt/9MW', '', 'Jaclyn Frami', 'teacher', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '682386', '+29 7942073', 0, 0, 0, '', NULL, '', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'william.davis', 'jillian68@hotmail.com', '$2y$10$wiSeG1XhCWN5pRZT1fBUgeT4L3af9LTaXO1LqO8.exUB9fLChvZAK', '', 'Bulah DuBuque', 'teacher', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '957513', '+86 6441010', 0, 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'schmeler.reed', 'hester37@hotmail.com', '$2y$10$6LErVXxKbxNuiq0IHqVfL.6alzHF5kJxh.OpGL2SuIj9Q0avsGy1m', '', 'Mrs. Susie Gutkowski', 'teacher', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '172246', '+55 3085491', 0, 0, 0, '', NULL, '', '088.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'isadore65', 'cale51@yahoo.com', '$2y$10$cu6D0twyQcl0Jih3UI5SiuxkDahlTmBtCSXZNTpD1mimIhzZ6fsI2', '', 'Oleta Lehner', 'teacher', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '858175', '+41 7508215', 0, 0, 0, '', NULL, '', '06.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'humberto24', 'darren.lind@hotmail.com', '$2y$10$Bj3To6tfYHal0jWtwTZBP.8FTusKUq5VPOIk1qK02eH1/cEAzGMnC', '', 'Mr. Jairo Schowalter V', 'teacher', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '320300', '+26 9457106', 0, 0, 0, '', NULL, '', '085.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'schamberger.guido', 'sanford.emmitt@gmail.com', '$2y$10$VlpiGXkDL6lfV4AKqKU2UO80B5oxsA62/Rp1SV.snzEJULxhdWZQi', '', 'Reece Turcotte', 'teacher', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '751847', '+45 2291228', 0, 0, 0, '', NULL, '', '028.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'vada.oconnell', 'fisher.norma@stiedemann.com', '$2y$10$EjilR6soQsk7rjyBDAbjm.eaCFONMbn3EbVXnzMgKj7/xmeHWba0e', '', 'Jackson Paucek IV', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '626344', '+49 9046545', 0, 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'effertz.hollis', 'marlene82@anderson.com', '$2y$10$Zj0gqf9OLTeK.2Xkfpl4.edMVB0fue82Mcpl8tlE/QcrOHqgy4JXG', '', 'Mrs. Lexie Parisian', 'teacher', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '260587', '+76 1497567', 0, 0, 0, '', NULL, '', '072.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'arnulfo00', 'btreutel@yahoo.com', '$2y$10$UM8vGD.hnpW4MNzmcbYb0uUvEAjuUmwlnYwVDxlm75lTKB.u5pSXK', '', 'Dr. Ansel Dooley DDS', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '604882', '+51 4120428', 0, 0, 0, '', NULL, '', '096.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(77, 'keebler.merlin', 'conroy.vicente@gmail.com', '$2y$10$kt90BDQYlijP2epxltVvf.S3u3nH072oXhC8kk2I4CXWJHZ7po9m2', '', 'Prof. Wilson Smitham I', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '653582', '+20 3021019', 0, 0, 0, '', NULL, '', '080.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'bailey.craig', 'mattie50@goodwin.biz', '$2y$10$zszxtMNXDPNklZXyH1ybZuwu8FQoBzh9biVEIbAZFiJhkNlXarOSK', '', 'Ashleigh Will', 'teacher', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '354686', '+60 3546385', 0, 0, 0, '', NULL, '', '016.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'stephen.simonis', 'reinger.clara@gmail.com', '$2y$10$2k9RfZ06zhw/Xs1LGUMJUu.7D.SNgCawMTNJ5neaXHCEzY1RJLpCa', '', 'Ericka Bergstrom', 'teacher', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '466521', '+28 6280756', 0, 0, 0, '', NULL, '', '045.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'bernier.ruthe', 'haley36@lubowitz.net', '$2y$10$z2.WQwvmOYgwcUrD5IucpeSlYiW8Lcy07OUf4rfuh/4edXPMK16nu', '', 'Mose Langworth DDS', 'teacher', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '178206', '+26 1455002', 0, 0, 0, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'eschimmel', 'gillian66@pacocha.com', '$2y$10$NJh0aLIYcoyqcwzs/vwMGODEd7e7tPyvEEJcbvwUXLsVEw72thW/a', '', 'Francisco Keebler', 'teacher', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '804530', '+60 3974199', 0, 0, 0, '', NULL, '', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'egrady', 'ikunze@yahoo.com', '$2y$10$YSIayJgow7AAI4h7Hxa6keqxWYvoFKGrNk9NPxBlwdcfLLzpIGG.6', '', 'Abel Waelchi', 'teacher', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '456181', '+27 4938780', 0, 0, 0, '', NULL, '', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'yruecker', 'towne.rory@macejkovic.com', '$2y$10$9DO3bUKE4tLCcCjrHC5So.P5K6SWuXv5Rqnw80LGJpNCuITHfxNZO', '', 'Mr. Triston Hill V', 'teacher', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '583231', '+62 8457655', 0, 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'lratke', 'medhurst.francesco@gmail.com', '$2y$10$fRJ3YexW6LrXA4n0zk5Ch.df27m9lKoxQ1lT3q9.HVIZUEG4wtfNW', '', 'Bonita Carter', 'teacher', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '529501', '+94 6108927', 0, 0, 0, '', NULL, '', '042.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'swaniawski.maddison', 'hoeger.meda@denesik.com', '$2y$10$7wsoVT.0XUcG4xAMGfW0HeRPbo.Og669H.xToUNSqgQ/ZqmInEzUy', '', 'Prof. Retta McLaughlin I', 'teacher', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '253618', '+76 7354582', 0, 0, 0, '', NULL, '', '093.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'ifriesen', 'theo84@king.com', '$2y$10$m1Ir.Es1RKxvyq3E0ipRp.KYv163nUu0xMelb5vLWqSRFHf9X580W', '', 'Casey Shanahan', 'teacher', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '278032', '+41 9311855', 0, 0, 0, '', NULL, '', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'hilma04', 'verla.maggio@gmail.com', '$2y$10$Isw4QFe2ARGYLSpxm153VOMm5eWRGoKOaY2QdGL0DvbNq9HQ//0mK', '', 'Mr. Jaren Hintz Sr.', 'teacher', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '418241', '+79 4572165', 0, 0, 0, '', NULL, '', '069.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'pollich.letha', 'eliseo.friesen@parker.org', '$2y$10$iqOomVeJBIf65M1mQD8DUuEQsHfkLGi1M6jSpeqxY/YgaGZPaOYlW', '', 'Thomas Hand', 'teacher', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '322778', '+58 3578084', 0, 0, 0, '', NULL, '', '031.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'kamren77', 'wunsch.stanton@gmail.com', '$2y$10$bvGGOlOBm6/cNImDR2r8le6blfqWIDqTG31BHln/XKC11FgavvF82', '', 'Mr. Lucas Kihn', 'teacher', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '437180', '+84 2110200', 0, 0, 0, '', NULL, '', '084.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'deontae.bogan', 'cartwright.elsie@gmail.com', '$2y$10$UICs0xjp4QwMso9sSgnI0.HNnOqdG/E1xYkWoftCZTfF0ESF1lw1C', '', 'Blake Kuvalis', 'teacher', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '357591', '+28 7036749', 0, 0, 0, '', NULL, '', '011.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'jazmin90', 'oyundt@collier.com', '$2y$10$FTNtp2LWrl6GRbmuCzUtgOt11tp8pMlncXZ0u.eDsdf3qMu4CIq.u', '', 'Faustino Nikolaus V', 'teacher', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '560666', '+42 4039717', 0, 0, 0, '', NULL, '', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'brian.prosacco', 'erik.bauch@yahoo.com', '$2y$10$DJ.Vnit0gtLcWzDHvgqKRuDkV9d.s.5rPl.I/7FNh4xctTqfhjNdG', '', 'Damon Botsford Sr.', 'teacher', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '609706', '+92 7698637', 0, 0, 0, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'kessler.kaley', 'cordia87@ruecker.net', '$2y$10$pxmK5m78OxnGXbcQIKyAM.l5r5xRLQgdueYhThwu3wGqurbt8nm2m', '', 'Dr. Kayla Botsford MD', 'teacher', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '539562', '+95 4368216', 0, 0, 0, '', NULL, '', '018.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'gschinner', 'lindsey48@gmail.com', '$2y$10$jGG4r/mDDgg5C0g5A6qr/.ML5Cj7SMCCwA8mXHbY9nnElku.uw8mK', '', 'Gene Sipes', 'teacher', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '405474', '+79 2678156', 0, 0, 0, '', NULL, '', '013.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'wiegand.antonina', 'rebeka21@lowe.com', '$2y$10$WypJYT71yMhInbEqSsU6POQb5cCccqumrHDfgz3RHid0FB9mEvdBq', '', 'Mr. Preston Ziemann I', 'teacher', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '128528', '+93 1607514', 0, 0, 0, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'oconner.darius', 'milo32@yahoo.com', '$2y$10$//VrOPHSgPnHWny6iDgoxeDITjldn4nRl5NjR3qVMNLelcwmjVSla', '', 'Jerald Raynor III', 'teacher', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '553585', '+20 8754249', 0, 0, 0, '', NULL, '', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(97, 'uwill', 'adrien.spinka@ullrich.com', '$2y$10$x7weWK7xqNwyZWb6X01g..GFVP7qCddXp0H.OE4ZY7ue3G9tpCABW', '', 'Prof. Buddy Zemlak II', 'teacher', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '818698', '+82 8806163', 0, 0, 0, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(98, 'yoreilly', 'mayert.matilda@hammes.info', '$2y$10$SnhcRDOsu0V7yyQpAokoG.rc65CUptnlHU09u2bZYgLqB7Or9isRS', '', 'Winnifred Koepp Sr.', 'teacher', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '447183', '+71 2180546', 0, 0, 0, '', NULL, '', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(99, 'lwalker', 'marilyne53@yahoo.com', '$2y$10$nWEUacbAcb2.V8es2z7F8uwolp53Y1f2QU0nO7fwojZCKttE4E23u', '', 'Nicolette Torphy', 'teacher', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '401918', '+52 6146900', 0, 0, 0, '', NULL, '', '024.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(100, 'wilbert.schuster', 'xernser@klocko.net', '$2y$10$NqhdKHbpLTNlxleoJoN15OCQsDqnJ8dfCzmHFE4r5e.ggOMsQvyTi', '', 'Prof. Jamarcus Bradtke', 'teacher', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '458830', '+18 3169171', 0, 0, 0, '', NULL, '', '07.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(101, 'germaine.quigley', 'purdy.ozella@gottlieb.biz', '$2y$10$Ek.nGDhKX7A0AQs57JA8MeKKxfiOyCIbiDnbixu4z5hTFH7ddYJIG', '', 'Dr. Esteban Kulas IV', 'teacher', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '288341', '+27 7075581', 0, 0, 0, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(102, 'vzemlak', 'virgie.fay@willms.net', '$2y$10$inH8ArrvxFhrjVEAGRbHe.IZaIqXLwZtFawUmJz2WOKoSoti/j.HC', '', 'Rosanna Brekke', 'teacher', 8, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '504440', '+46 9983895', 0, 0, 0, '', NULL, '', '044.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(103, 'rempel.gilda', 'evelyn15@ullrich.com', '$2y$10$PFCCF/YgfLurc7HAj7U0yOdWcoXDRXGrT3y6XaBNoij0sKXv42CTm', '', 'Desmond Ortiz', 'student', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9880110760', '6370408', 0, 4, 2, '', NULL, '', '070.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(104, 'virginie65', 'sherman.ward@bashirian.net', '$2y$10$4ZNUiwJ6dl2ZBnbJFOLGk.Shryzss3OLkWpoXjIoZhF2eUfjNpmb2', '', 'Betsy Cole II', 'student', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4966509799', '6697215', 0, 1, 2, '', NULL, '', '036.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(105, 'madelyn.stamm', 'carlee.ledner@stoltenberg.info', '$2y$10$Iw8h1S/8hmtLIL94.i8kcu0gJknulkE1SymvY1CoKvS9LZQJyZfrW', '', 'Chelsea Swift', 'student', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7049239450', '5086056', 0, 2, 4, '', NULL, '', '069.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(106, 'lhermiston', 'jkautzer@gmail.com', '$2y$10$qfc3ViqZRx9vK/oLUaBvl.i5SpKkNCm/QBDCwddpjFPuPnm8E3pT6', '', 'Donald Franecki', 'student', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7449458214', '4667452', 0, 1, 3, '', NULL, '', '013.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(107, 'mervin44', 'eullrich@yahoo.com', '$2y$10$r3UTMc87FQi51Zxpf1WzROaLMTfGPV./XI2vR9IIBmAFi7HgSHM8u', '', 'Hailie Littel V', 'student', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8324226339', '5226184', 0, 3, 3, '', NULL, '', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(108, 'javier.erdman', 'conroy.joelle@gmail.com', '$2y$10$aIqWK.lxzkSerBNNTXTrWuSSagTmsZ9nDgPBq0F9Rzi7lgIkGN9f6', '', 'Alford Osinski', 'student', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5564171968', '3053128', 0, 4, 3, '', NULL, '', '010.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(109, 'wava.prohaska', 'conroy.sigmund@cruickshank.com', '$2y$10$oXSGEWsCVM3j4MDmAb9tpeJhGkYRrcpckPmvZtJcDyxxDa8jPXGiS', '', 'Lola Mraz', 'student', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2389310937', '8208398', 0, 1, 2, '', NULL, '', '010.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(110, 'dschamberger', 'schowalter.ricardo@yahoo.com', '$2y$10$9ztSqP9GXOPCbbW2dDVUNOykh4WHe0N.suRXmYXs.RV1Z.LevKA2O', '', 'Zoie Brown', 'student', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6461416267', '2257876', 0, 1, 1, '', NULL, '', '031.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(111, 'linnie.witting', 'alysha75@hotmail.com', '$2y$10$V9bPENfSbL8mNYYiWqXVnOEXFizofcduhSmaCvboaBLVPiSsdLDG6', '', 'Trenton Bechtelar', 'student', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2899820103', '4632374', 0, 3, 4, '', NULL, '', '064.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(112, 'glang', 'brook85@gmail.com', '$2y$10$t.389LHbsvaqyRgMmtOWbOa4qTD.1kW8Od47.zXoTWnoaCco5ch1K', '', 'Maxime Casper', 'student', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6996217162', '6332147', 0, 2, 4, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(113, 'frank69', 'pouros.jakayla@thompson.biz', '$2y$10$uJXf5j9IX4bwobQhzINYkOJX4PXkLrObDFpTvfbAyCMEBTXhmd8OC', '', 'Meagan Upton', 'student', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7296447804', '2895195', 0, 1, 3, '', NULL, '', '060.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(114, 'osbaldo.kilback', 'helena.ferry@ernser.info', '$2y$10$PSv9sDZGyCFBf/qhVurD8u4N5Q6HERAcHeKmVabjsTODVkyLxlNZO', '', 'Prof. Demarco Williamson', 'student', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6199181799', '6858725', 0, 3, 3, '', NULL, '', '087.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(115, 'deontae97', 'imani27@gmail.com', '$2y$10$o9uQC3rLqr9OkdAycEiWL.kze/2YMWhUjrbsAUPbHi9XYgO/FKLHS', '', 'Earnestine Kiehn III', 'student', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2202191476', '5767327', 0, 1, 2, '', NULL, '', '072.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(116, 'mayert.beatrice', 'lkub@gmail.com', '$2y$10$hb6is4Gnr0kEOAnh5Qx6pObEt27T5Dw/HqCFQQHrLVdyh5OylT5se', '', 'Dr. Orville Kerluke', 'student', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6468700208', '1289795', 0, 3, 3, '', NULL, '', '029.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(117, 'jazmyne97', 'xbraun@russel.com', '$2y$10$DA.QvC.4SLqjFGLmvdgBJufYweWSIMvjL/u64GFaKGgzTQYuMz2J6', '', 'Dr. Elian Doyle', 'student', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7700892668', '3631302', 0, 3, 3, '', NULL, '', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(118, 'qsauer', 'hand.geo@gmail.com', '$2y$10$vMJrrQhamYjUYliNQmpVfe58SM1ACVnYEujZuWBdLxBohKnxav5/2', '', 'Hal Robel', 'student', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1796792676', '9650765', 0, 4, 2, '', NULL, '', '023.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(119, 'mayer.emmy', 'green.jaylon@howell.com', '$2y$10$LSJN1EE59xICYH7U47wVu.2BZ5ai6mHdsGaBj3peNZR7dQlLwKd4y', '', 'Tia Gerlach', 'student', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9748411331', '5266478', 0, 3, 4, '', NULL, '', '066.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(120, 'stokes.noel', 'kyler.keeling@gmail.com', '$2y$10$a6m0pIsANmrbQs0/.4iwOeVFqdizZN6RyoV6cTAJCLQtN0jHgETJ2', '', 'Kathryne Schowalter', 'student', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1726022896', '8361280', 0, 1, 4, '', NULL, '', '054.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(121, 'keyon54', 'kenya81@lehner.com', '$2y$10$Uui1nkD8weEIJidpIoBzp.taR4IS1CXaRdbeEnqkLmeK5rhKRmiZO', '', 'Miss Asha Kertzmann', 'student', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2634259548', '4044379', 0, 4, 3, '', NULL, '', '039.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(122, 'shyanne.considine', 'joanny72@schmidt.com', '$2y$10$AeCtQyEvA6PcVAtULPE59O0SGBjMwiAsdvWyme0QMT5WBXtSCv62.', '', 'Betty Boehm', 'student', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5560759913', '6160077', 0, 1, 3, '', NULL, '', '036.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(123, 'aubree43', 'abbey.heaney@hoeger.info', '$2y$10$rqbcw1HE4V/Za1toMVC3ou6MOQMMtkp0tD/ow/eGKc2BauQu6m4qm', '', 'Devon Jaskolski', 'student', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6426340145', '3940297', 0, 4, 3, '', NULL, '', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(124, 'schimmel.raymond', 'srunolfsdottir@gleason.com', '$2y$10$/VghY7dAdSDMMes6maPZy.lq8lcHRPRC6XPote2Dxmw6EpUasve8u', '', 'Prof. Caesar Wiza', 'student', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5994701885', '5006811', 0, 3, 1, '', NULL, '', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(125, 'zackery.legros', 'sswift@gmail.com', '$2y$10$dfkQ5LOcCuRT1kzfUFnQmeGen753pf5nBb8u645hV1/uNPky3am.2', '', 'Delmer Lind', 'student', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8280505155', '1002128', 0, 1, 2, '', NULL, '', '017.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(126, 'amely.herzog', 'oconnell.jordyn@lakin.biz', '$2y$10$4vxR6WZ94C.m.qX9zdyGNu8gbjnYOv.zGVhQDHx1zjhD15LRT96bC', '', 'Mr. Elmore Hammes', 'student', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6665830346', '9683852', 0, 4, 3, '', NULL, '', '076.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(127, 'kiehn.filomena', 'auer.lester@yahoo.com', '$2y$10$qQRwXCys1OISvrErFOwpzO.u2qr4zTVd8.6cenkC75e.iDvuE8May', '', 'Angelina Lockman', 'student', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1511838694', '6768613', 0, 3, 4, '', NULL, '', '079.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(128, 'eryn15', 'guiseppe28@johnson.com', '$2y$10$r1Q4uQlliPxilobLq8C1UeeemaR3f9YbsmOPv.SbXoUiznAK4FshO', '', 'Garrett Schulist', 'student', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1782345393', '4093635', 0, 1, 1, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(129, 'qlang', 'emilio10@okon.com', '$2y$10$HzY2aHcA7UGAleumfwEUPurnx3MnObTHrfQN0nVW9qWK3XdlpFSte', '', 'Taurean Stamm', 'student', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3912627195', '9511265', 0, 3, 4, '', NULL, '', '058.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(130, 'sylvan.eichmann', 'joshua30@littel.com', '$2y$10$C9J9u8AhjvUr0Dldw2Rv2OntFfUBZL219Qcm3dbCrpzdrT3ZNWxfe', '', 'Mr. Craig Lubowitz II', 'student', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4787621788', '2292010', 0, 2, 2, '', NULL, '', '051.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(131, 'handerson', 'macey59@kiehn.org', '$2y$10$FAXIQsJ6FzXVPreArFtUyuNhYpUlKw9JxmPvYuvJBy66E3KYNXFEa', '', 'Abbey Terry', 'student', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6515514732', '1786193', 0, 3, 3, '', NULL, '', '088.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');
INSERT INTO `users` (`id`, `username`, `email`, `password`, `remember_token`, `fullName`, `role`, `role_perm`, `department`, `designation`, `activated`, `studentRollId`, `admission_number`, `admission_date`, `std_category`, `auth_session`, `birthday`, `gender`, `address`, `phoneNo`, `mobileNo`, `studentAcademicYear`, `studentClass`, `studentSection`, `religion`, `parentProfession`, `parentOf`, `photo`, `isLeaderBoard`, `restoreUniqId`, `transport`, `transport_vehicle`, `hostel`, `medical`, `user_position`, `defLang`, `defTheme`, `salary_type`, `salary_base_id`, `comVia`, `father_info`, `mother_info`, `biometric_id`, `library_id`, `account_active`, `customPermissionsType`, `customPermissions`, `firebase_token`, `updated_at`) VALUES
(132, 'stracke.vivienne', 'krystel44@hotmail.com', '$2y$10$2u3.s8nNq1YRvglXnNHwhe0Ops35mOte5ZYEf8iOzhAXGbKQapOrS', '', 'Samanta Shields', 'student', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8689274488', '4251366', 0, 2, 2, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(133, 'claire.beahan', 'ariane37@berge.com', '$2y$10$MR3GJg0FTAjX.UvWK/WmOOiCj1ONKzr6BlSgUEEhex9a2fjo/Xel2', '', 'Vivienne Dickens', 'student', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3001493495', '6174633', 0, 2, 1, '', NULL, '', '02.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(134, 'johan.heidenreich', 'raynor.earlene@paucek.com', '$2y$10$47RutSLQ3C/Dm/E78C60ZOCMN4fK.jXpRxpTSb2r1jjHFmR0tEmcK', '', 'Prof. Clyde Goldner', 'student', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2787855272', '6695778', 0, 2, 1, '', NULL, '', '044.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(135, 'vito10', 'swilliamson@harber.com', '$2y$10$df28It6XIK2JX.gBwg1W8Ov7e1DvC/krK7G1VMHuddWCrkRHCT6Ey', '', 'Wiley Hettinger', 'student', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1300571321', '8947185', 0, 4, 2, '', NULL, '', '067.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(136, 'robel.wilfred', 'dario33@hotmail.com', '$2y$10$FWrc0MXe799avp9UtV8xSuGYUBNDJuXBczi5k8LKg0XmCvrmsfNP6', '', 'Dr. Bernie Hane Jr.', 'student', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3884041102', '6212149', 0, 3, 2, '', NULL, '', '090.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(137, 'rcronin', 'yost.zakary@cartwright.net', '$2y$10$eN8ddqAC6Cbm6FtigtjcE.YnU/zcLEr80QPNwoSXHdloCQd9asR1G', '', 'Lorenza Hamill', 'student', 4, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8435521240', '3217189', 0, 1, 3, '', NULL, '', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(138, 'homenick.jayce', 'nicola.schulist@mitchell.com', '$2y$10$X3Cohk0J3u6n2b20ExqKbeAIbn.3g9C6vubgwgAkj6.SzsKqDPG8W', '', 'Tomas Hermann', 'student', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3709870944', '9240464', 0, 2, 4, '', NULL, '', '019.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(139, 'paige46', 'omraz@hotmail.com', '$2y$10$1y4ooo7AlJIo42/g0KgxFeQLnJF.U8VVO.U6BMUFE.b5oSp2XuV1y', '', 'Eva Rempel', 'student', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1773186198', '2257263', 0, 4, 1, '', NULL, '', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(140, 'madeline.schiller', 'fbergnaum@yahoo.com', '$2y$10$Fl0009kc2YpucDGRdJ3kAeHcYRIBHqgRDTspA9HixERKA33nBVVZS', '', 'Prof. Libbie Lueilwitz PhD', 'student', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4245824102', '7252021', 0, 1, 4, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(141, 'alta04', 'holden41@yahoo.com', '$2y$10$Fm21c6nVTuXv5ntYWQbYSODzQkcBW1om9G/QcIM9UAyPzJLYMkJfK', '', 'Prof. Joany Murray', 'student', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9818063348', '7905382', 0, 2, 1, '', NULL, '', '011.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(142, 'zschinner', 'watsica.gillian@gmail.com', '$2y$10$Wgqwu4.CmgiDZ07FnKNCrOhD5ZBK9roc5Ne/31yMvEq9ZXzPhfMji', '', 'Mr. Helmer Sanford', 'student', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1711617791', '8663616', 0, 2, 2, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(143, 'laurie.ferry', 'treynolds@nolan.info', '$2y$10$dWNpVn5R0Dn8L3kV6.DryOcKEbWGuGEhkI3SM9vCp/aNvrHLVpsHK', '', 'Leatha Kilback', 'student', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2603674519', '4701934', 0, 4, 4, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(144, 'dax14', 'jackson.ratke@crooks.org', '$2y$10$VONTlcEeCwB6YFZnu33yWOBL5XCq.8Ho2lHRnTpOopJm2JHUE//y.', '', 'Meaghan Conroy', 'student', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5369156225', '8242730', 0, 2, 1, '', NULL, '', '090.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(145, 'icormier', 'broderick.berge@yahoo.com', '$2y$10$j3eq/IHopWZt/yDSLhsOaOLd5TozPZc9gVq827xh6A.sI2HDaHPGi', '', 'Mr. Kaley Bradtke', 'student', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9937898643', '7492023', 0, 3, 1, '', NULL, '', '076.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(146, 'jayce.rempel', 'abbie29@gmail.com', '$2y$10$ewgIkwAA5e7T5bloSSQzGOdH00petXjGdMcnL5nNUPHjEG1WggQiW', '', 'Breanne Kshlerin', 'student', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5913041477', '8060884', 0, 1, 4, '', NULL, '', '018.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(147, 'femmerich', 'hjacobs@koelpin.net', '$2y$10$27Y3yAgSlOGIV.L5PpksC.ALhyHS6sLfnusfLHkgxYIz.KdOAMPr2', '', 'Jeanne Corwin', 'student', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1237210536', '1492889', 0, 3, 4, '', NULL, '', '029.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(148, 'windler.grant', 'jaquan.hyatt@sanford.com', '$2y$10$iSmswlJrTPJjFLWd0GdPUOecQTgC/PAhzk.iz.b3t8Jte8U2qXmqO', '', 'Miss Estel Blick', 'student', 9, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2612416213', '6550976', 0, 3, 2, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(149, 'qebert', 'howe.bailee@gmail.com', '$2y$10$6QMmAeucgSEJSOq0igRfKu4HpyQOwYVBEsXVoNRi6aTphcOY1Rp/.', '', 'Eileen White', 'student', 9, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8984721659', '7082006', 0, 2, 1, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(150, 'slangworth', 'htoy@gmail.com', '$2y$10$nhRmHL7JEyrVoPKhr4F68uDNRbNCEz2g1EpwOy.JMHZE/enuQ9W0S', '', 'Mr. Donald Smith', 'student', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9130178643', '8910704', 0, 4, 4, '', NULL, '', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(151, 'delmer.lueilwitz', 'rkilback@waelchi.com', '$2y$10$YXh8iBKbZYPAvdg7jCsdJOJLTGLvVk8mTwQi6suH93NZXkvYsOWb.', '', 'Brock Jacobson', 'student', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5215233360', '9872429', 0, 3, 1, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(152, 'vmckenzie', 'schuster.jaida@donnelly.com', '$2y$10$MxbsByAdBwRYDNG0UXWKtO.rsuD5sq/.IRS1cObqoiYC/N8NbS67y', '', 'Eino Zulauf', 'student', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8550479717', '8883445', 0, 3, 3, '', NULL, '', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(153, 'parent1', 'joe86@yahoo.com', '$2y$10$cVzZYGAurqQMF5WPEE.TU.O2PTyr8n3ZbprW4CuPZEXyf0M1pwANm', '', 'Prof. Oren Grady V', 'parent', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6730352168', '9662851', 0, 1, 36, '', NULL, '[{\"student\":\"Eino Zulauf\",\"relation\":\"father\",\"id\":152}]', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(154, 'ioconnell', 'iwilkinson@yahoo.com', '$2y$10$C0hQWE23evXY7dw8NjFhGOBs3hzBpGHXsTEOG.p9IIyqZXECXahhm', '', 'Yvette Feeney', 'parent', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4550664385', '3764100', 0, 1, 10, '', NULL, '[{\"student\":\"Prof. Demarco Williamson\",\"relation\":\"father\",\"id\":114}]', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(155, 'conroy.jack', 'chand@goodwin.com', '$2y$10$YDGqldlJGWfqRV/WQJJdIea5ujAqusBpLkMHbS.gjZx0vy6JrM2kS', '', 'Dr. Luther Schinner', 'parent', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7585964556', '8484603', 0, 2, 12, '', NULL, '[{\"student\":\"Betty Boehm\",\"relation\":\"father\",\"id\":122}]', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(156, 'edwin.stanton', 'pouros.neoma@gmail.com', '$2y$10$8w6qfjROd94AJh6PAVdZ8un/0FfMfSlfSTCVxyn92Pw95HrHGLPPa', '', 'Ms. Callie Kerluke', 'parent', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1933387537', '9341238', 0, 4, 34, '', NULL, '[{\"student\":\"Lorenza Hamill\",\"relation\":\"father\",\"id\":137}]', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(157, 'kaylie.wyman', 'wkihn@yahoo.com', '$2y$10$hcMVRKB.EYbf0FaVQ/4eh.1ruqzqj9jS7FH.nHOKDk7YhjJTwBLLK', '', 'Yoshiko Romaguera', 'parent', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4603167519', '1230235', 0, 1, 16, '', NULL, '[{\"student\":\"Prof. Joany Murray\",\"relation\":\"father\",\"id\":141}]', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(158, 'shields.hugh', 'cummerata.christophe@frami.info', '$2y$10$xtjWOXR9Ivfs6aSZcYSxv.AVu9yKcB0cHipogahARICc8iSa6U.iK', '', 'Idella Sawayn', 'parent', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4969978309', '8222889', 0, 4, 15, '', NULL, '[{\"student\":\"Abbey Terry\",\"relation\":\"father\",\"id\":131}]', '058.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(159, 'minerva90', 'minnie05@daugherty.biz', '$2y$10$hUOw5CkenJW/9L1WslHsS.yg2ZVfUbN1UlVb1Wk/4u51RPxKZAq/6', '', 'Fannie Kuvalis', 'parent', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8282915312', '6016409', 0, 3, 26, '', NULL, '[{\"student\":\"Devon Jaskolski\",\"relation\":\"father\",\"id\":123}]', '077.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(160, 'icrist', 'stephon74@gmail.com', '$2y$10$pztXFNZHvDYj7fOr7rTGFOvN1Ho4t6xRNV3lIyOn6H0Gqq6k7vkrm', '', 'Juvenal Herzog', 'parent', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1184910885', '6794331', 0, 3, 29, '', NULL, '[{\"student\":\"Hal Robel\",\"relation\":\"father\",\"id\":118}]', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(161, 'jamison.hammes', 'mary47@gmail.com', '$2y$10$qCmLuNaXVrnpsjDq9gr7w.odYgn8KrcBKFF7Qs5PwwrH4nEniZ/le', '', 'Assunta Blanda', 'parent', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7974463802', '6110158', 0, 2, 47, '', NULL, '[{\"student\":\"Samanta Shields\",\"relation\":\"father\",\"id\":132}]', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(162, 'weldon17', 'sister.goodwin@konopelski.com', '$2y$10$WyvDRxjkPLrUSHDDgz9dF.ghpces60niAYUdAci55zdvrPiGMOYSa', '', 'Josefa Koepp', 'parent', 7, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2159059825', '7028766', 0, 2, 29, '', NULL, '[{\"student\":\"Maxime Casper\",\"relation\":\"father\",\"id\":112}]', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(163, 'elroy73', 'hmaggio@pfeffer.com', '$2y$10$F2stQWPb47Dre7.ueiKXJ.Lw5VeD.NPxuYcsPCPLyoKT8OhA6OPXO', '', 'Lilliana Prohaska', 'parent', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1186200511', '6091106', 0, 4, 1, '', NULL, '[{\"student\":\"Garrett Schulist\",\"relation\":\"father\",\"id\":128}]', '052.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(164, 'donny.schuppe', 'deondre31@schumm.com', '$2y$10$e2LRJpaIEOhlv/6Hg.Ou0OFf5iSo6khgp0PLhwq5/Nx8PUvamZkjG', '', 'Rosalia Jacobi', 'parent', 5, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4339773574', '2105542', 0, 1, 8, '', NULL, '[{\"student\":\"Meagan Upton\",\"relation\":\"father\",\"id\":113}]', '063.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(165, 'koss.clarissa', 'gino72@yahoo.com', '$2y$10$4mPTCmc6YhimL19AZ7ddUOuGLJULpzmZSLGItAEcxy4.H7Dk23fxW', '', 'Hillary Willms', 'parent', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6625769380', '1850233', 0, 3, 33, '', NULL, '[{\"student\":\"Prof. Caesar Wiza\",\"relation\":\"father\",\"id\":124}]', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(166, 'ngottlieb', 'hope.jaskolski@hotmail.com', '$2y$10$UlCl7D2ymYT41FPMiD3t3Oqv.bOPP.4NJNbaX2.hrSnwSjHuaTdKG', '', 'Skyla Goldner Jr.', 'parent', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4494186140', '1257029', 0, 3, 30, '', NULL, '[{\"student\":\"Samanta Shields\",\"relation\":\"father\",\"id\":132}]', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(167, 'noble15', 'bradtke.jasen@gmail.com', '$2y$10$CDFT02DWmvjivnf.3wOsXOecBc6ZVf70qvQw5dsQK6LQBNbepfwDK', '', 'Ms. Tomasa Rosenbaum II', 'parent', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9670877124', '4585250', 0, 2, 29, '', NULL, '[{\"student\":\"Hal Robel\",\"relation\":\"father\",\"id\":118}]', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(168, 'pcummings', 'jwilliamson@erdman.org', '$2y$10$7/Zr3iYzAoHh/z3JSYstN.AvEwkyEsq1ySUlTB0id7aFcyw89.DfG', '', 'Ms. Nadia Jacobi', 'parent', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1787004387', '9376148', 0, 4, 19, '', NULL, '[{\"student\":\"Miss Estel Blick\",\"relation\":\"father\",\"id\":148}]', '07.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(169, 'cdietrich', 'uhartmann@yahoo.com', '$2y$10$XuCKDUU8uqFN3l8q/pkAeOqFzyJHgmMbE9yP7pmZxj4LcgC7c9Pb2', '', 'Dr. Conor Crooks', 'parent', 4, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2308343851', '3756579', 0, 1, 30, '', NULL, '[{\"student\":\"Mr. Craig Lubowitz II\",\"relation\":\"father\",\"id\":130}]', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(170, 'glover.dennis', 'okuneva.mohamed@gmail.com', '$2y$10$0cOuv2wdnQso0DElDNBiW.L8no8kE115fqAh4UxtInk6WIlYIzxsK', '', 'Mr. Johathan Wilderman PhD', 'parent', 10, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6558069648', '1006864', 0, 1, 13, '', NULL, '[{\"student\":\"Mr. Helmer Sanford\",\"relation\":\"father\",\"id\":142}]', '066.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(171, 'tad32', 'verna12@yahoo.com', '$2y$10$38gO2VNGUfpe0IRv8cWEheqFrJPrJTZ/Ul6ETSgx.UAoM42XusbBi', '', 'Chaya Schumm', 'parent', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8802817881', '9062492', 0, 4, 45, '', NULL, '[{\"student\":\"Mr. Elmore Hammes\",\"relation\":\"father\",\"id\":126}]', '058.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(172, 'rosella.bergnaum', 'axel.gerlach@gmail.com', '$2y$10$O6ift05zOpDuax.Ckg45TetIThphYPnkcMvl1PtXNtDxOP4411N3i', '', 'Josefa Hand', 'parent', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8006943664', '4270604', 0, 1, 18, '', NULL, '[{\"student\":\"Mr. Helmer Sanford\",\"relation\":\"father\",\"id\":142}]', '072.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(173, 'estella44', 'nlittel@gmail.com', '$2y$10$sFh23xLjK.MhZAeIWaMQS.0B7Bbjb2NT4Ld.E7CGPi9Tm9onrBI3u', '', 'Emmanuel Sauer', 'parent', 5, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5735105826', '1383040', 0, 4, 19, '', NULL, '[{\"student\":\"Mr. Elmore Hammes\",\"relation\":\"father\",\"id\":126}]', '066.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(174, 'kyler.connelly', 'schoen.raquel@yahoo.com', '$2y$10$lHWuOz8J8/TS/vjwxmj2g.nQYQh.1d6IGt7yIZunwZoa8in6V6Aii', '', 'Ms. Kiara Kreiger Sr.', 'parent', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8717936151', '4106849', 0, 1, 31, '', NULL, '[{\"student\":\"Brock Jacobson\",\"relation\":\"father\",\"id\":151}]', '073.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(175, 'quinn48', 'yazmin32@gmail.com', '$2y$10$mErJsljkIb933xcWslTWdOdTwGa3gNc7PGrj6knalecS9y4OhbKsO', '', 'Anastacio Grady', 'parent', 5, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3280454297', '1267181', 0, 1, 33, '', NULL, '[{\"student\":\"Samanta Shields\",\"relation\":\"father\",\"id\":132}]', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(176, 'bogan.jewel', 'raul.barrows@gmail.com', '$2y$10$xGk/gcJLlK5n0X3GPz0sx.Rez7p6Njnal.7KVdbiJ37a1b6d2Trfu', '', 'Fabian Lynch', 'parent', 4, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4449728371', '8206955', 0, 1, 47, '', NULL, '[{\"student\":\"Alford Osinski\",\"relation\":\"father\",\"id\":108}]', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(177, 'auer.mitchel', 'twila.weber@gmail.com', '$2y$10$QOpXdXu.6H4kyZMIPwAnju6Jqiwb9jRtTgi8xe6C2qpxw6zobfVZu', '', 'Prof. Amaya Ullrich PhD', 'parent', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1793750938', '8088081', 0, 2, 3, '', NULL, '[{\"student\":\"Delmer Lind\",\"relation\":\"father\",\"id\":125}]', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(178, 'lmueller', 'rhayes@hessel.net', '$2y$10$AQzC9xOZ5EOVJv9FcRiHG.kOi6rW0vCHT.hkZV6dgZA07C9uWs55W', '', 'Gretchen Kilback', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2382855372', '3087641', 0, 4, 7, '', NULL, '[{\"student\":\"Meagan Upton\",\"relation\":\"father\",\"id\":113}]', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(179, 'hill.judson', 'hettinger.carol@yahoo.com', '$2y$10$Z6NYfJl6gVeoUODn9bX6a.w/MVKwl0l1HpqRjoqddYY5ApD.VXlXq', '', 'Chloe Collins', 'parent', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3562905146', '3514765', 0, 1, 1, '', NULL, '[{\"student\":\"Tia Gerlach\",\"relation\":\"father\",\"id\":119}]', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(180, 'ubalistreri', 'istreich@hotmail.com', '$2y$10$d5GKWdg7d4kB8Im3MeZW6uN6YaCbv72iiu/Gj5UmVvB35ri8qemru', '', 'Keon Gulgowski', 'parent', 8, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2608675448', '3991815', 0, 4, 44, '', NULL, '[{\"student\":\"Lola Mraz\",\"relation\":\"father\",\"id\":109}]', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(181, 'kasey00', 'yoreilly@kris.com', '$2y$10$Lca/nGtEph33fk6bfjsdGO/gtqr.QesWr5jwDqfHEV3qv91vwcb8K', '', 'Heber Batz MD', 'parent', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1137290960', '1537575', 0, 3, 37, '', NULL, '[{\"student\":\"Taurean Stamm\",\"relation\":\"father\",\"id\":129}]', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(182, 'marjorie57', 'wturner@schimmel.biz', '$2y$10$BaqKZkcOMhEooAGIH6s4Te09hwV2jQFbMScuDSxaBC86y4YxKtZX6', '', 'Andreane Turcotte', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2372436987', '6062118', 0, 4, 38, '', NULL, '[{\"student\":\"Leatha Kilback\",\"relation\":\"father\",\"id\":143}]', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(183, 'osinski.demetrius', 'jkling@greenfelder.com', '$2y$10$aA4d1NLpJO0FY0.Zye2OseEpbpIG0li/HfkgZtCYrHwhYNjlmY0JS', '', 'Garrett O\'Keefe', 'parent', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4494522398', '1749010', 0, 1, 33, '', NULL, '[{\"student\":\"Mr. Helmer Sanford\",\"relation\":\"father\",\"id\":142}]', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(184, 'mhane', 'kirstin.rosenbaum@gorczany.com', '$2y$10$yEilbZN.T41hdFN/uxPm4uEUsRT.bc0U0UYsZ5.UXkDuBbhHD2Zka', '', 'Khalid Becker IV', 'parent', 5, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6324579936', '5968803', 0, 1, 49, '', NULL, '[{\"student\":\"Eileen White\",\"relation\":\"father\",\"id\":149}]', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(185, 'pattie.kassulke', 'landerson@fay.com', '$2y$10$otiryri2fXOGwoGfI4BE2uQwOvPZyRITTofehFI/xdtzjHuX0gJ/O', '', 'Prof. Gust Pouros', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4890235600', '4930701', 0, 3, 21, '', NULL, '[{\"student\":\"Eva Rempel\",\"relation\":\"father\",\"id\":139}]', '015.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(186, 'jgraham', 'josefa.upton@gmail.com', '$2y$10$S8i5LnAQctxaJseSKlhrpe16P2MSV5ZeIKi1kOAYS9iCbrJkX/Ts2', '', 'Ova Witting', 'parent', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2499986821', '9489012', 0, 3, 41, '', NULL, '[{\"student\":\"Jeanne Corwin\",\"relation\":\"father\",\"id\":147}]', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(187, 'kasey97', 'hahn.alexane@hotmail.com', '$2y$10$hq2Jzj7OowQ8rdJkFj69hup3tFhTQTWiLu.Sz/NQrpT35iLnMgq0q', '', 'Manuela Homenick', 'parent', 6, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9805117508', '8248168', 0, 1, 17, '', NULL, '[{\"student\":\"Earnestine Kiehn III\",\"relation\":\"father\",\"id\":115}]', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(188, 'cremin.gianni', 'walsh.maxine@hotmail.com', '$2y$10$BiiIOs6ThkS6lp5YndLt5ODs1NjRv/KrqqTrXii/Xj6QAwml17vjO', '', 'Chanel Kautzer', 'parent', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2921911661', '4575963', 0, 4, 14, '', NULL, '[{\"student\":\"Angelina Lockman\",\"relation\":\"father\",\"id\":127}]', '070.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(189, 'morton25', 'jenkins.joana@kutch.com', '$2y$10$n9QJqTNUgJn/UpGfmESrzeQSDa86WRUwQklWD9HZ8MULbWiA.iOSW', '', 'Herminio Bayer', 'parent', 7, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5094933784', '2950959', 0, 3, 29, '', NULL, '[{\"student\":\"Garrett Schulist\",\"relation\":\"father\",\"id\":128}]', '036.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(190, 'bertrand.feil', 'daphnee63@bosco.com', '$2y$10$FnirdDQS9yDKJyI8eI0Oz.cpG3ClMgid1U1yaVLr89PaAug1D5BN6', '', 'Therese Lueilwitz', 'parent', 10, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2328028266', '9342962', 0, 2, 20, '', NULL, '[{\"student\":\"Miss Estel Blick\",\"relation\":\"father\",\"id\":148}]', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(191, 'mossie94', 'maida97@labadie.com', '$2y$10$pVXvCyzn1ZrDd4jbM7FtdOVCnT.BEJKeTByiZHQeVbA7AVAvfoGui', '', 'Horacio Breitenberg', 'parent', 9, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4838460390', '9434198', 0, 3, 29, '', NULL, '[{\"student\":\"Jeanne Corwin\",\"relation\":\"father\",\"id\":147}]', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(192, 'walker.domenico', 'rosenbaum.aurelio@hotmail.com', '$2y$10$RjlM./0UXj3Q8iKkUDj.TO8ZCiwsHBtO/WFun60M8.0CXehkz6h.C', '', 'Merl Hauck', 'parent', 7, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8478239641', '9429217', 0, 4, 2, '', NULL, '[{\"student\":\"Tomas Hermann\",\"relation\":\"father\",\"id\":138}]', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(193, 'lesch.jean', 'antonia08@hotmail.com', '$2y$10$mez2t9iWwcQcmmihZzC47.msgxKCU16OSvL3ktZe4dmRRXTZ7Ua6W', '', 'Laurel Connelly', 'parent', 4, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7738866466', '7464199', 0, 3, 16, '', NULL, '[{\"student\":\"Desmond Ortiz\",\"relation\":\"father\",\"id\":103}]', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(194, 'swaniawski.pansy', 'waters.hillary@bahringer.com', '$2y$10$9iT98lofSxeynwBO7o7AqOGq8ghEZ8Su4JsFHuc8aqDgarrLhtN9G', '', 'Margarett Pollich', 'parent', 7, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7609537726', '7230710', 0, 4, 18, '', NULL, '[{\"student\":\"Prof. Caesar Wiza\",\"relation\":\"father\",\"id\":124}]', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(195, 'raleigh66', 'wdurgan@littel.com', '$2y$10$B1CYoYY5msgY.QymEJonEOLtXe09qvJnWvg9Ju0iqk0dhuqhqo9gK', '', 'Dudley Wilderman DVM', 'parent', 6, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5479764314', '6260512', 0, 4, 4, '', NULL, '[{\"student\":\"Mr. Kaley Bradtke\",\"relation\":\"father\",\"id\":145}]', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(196, 'julie51', 'sanford00@hamill.com', '$2y$10$Ll9cOkPsOlspTfuLYewOc.u788ZIpehnRN3JmJ6ssT5gJ8Fr1X28K', '', 'Ms. Breanne Blick DDS', 'parent', 8, 1, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2614507693', '1044881', 0, 3, 41, '', NULL, '[{\"student\":\"Alford Osinski\",\"relation\":\"father\",\"id\":108}]', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(197, 'catalina00', 'luther.gottlieb@leannon.com', '$2y$10$H9IB0V4GtMl/1Dkh4gv9wO503Loz3cnIetTN4pTOoK38Yt5btuD36', '', 'Mr. Gunner Baumbach MD', 'parent', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8273727178', '6382170', 0, 1, 16, '', NULL, '[{\"student\":\"Donald Franecki\",\"relation\":\"father\",\"id\":106}]', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(198, 'rmcglynn', 'slangworth@collins.com', '$2y$10$GXD82ri20LPVct8Z2tA3ZuVsvF.6SEKRdYz9kA/9McsCwcBCP9NKG', '', 'Garfield Wintheiser', 'parent', 6, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8981783718', '8508474', 0, 3, 21, '', NULL, '[{\"student\":\"Desmond Ortiz\",\"relation\":\"father\",\"id\":103}]', '07.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(199, 'spacocha', 'kemmer.foster@rath.com', '$2y$10$/86IUlqIRrp3/BKO8PB9A.DbIJU/.PIZxHj4t6Y2InRAM9h4tcTVO', '', 'Dr. Ismael Cole II', 'parent', 10, 4, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1284809384', '6925650', 0, 4, 7, '', NULL, '[{\"student\":\"Hal Robel\",\"relation\":\"father\",\"id\":118}]', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(200, 'ellen.spencer', 'mcdermott.jeramie@pollich.net', '$2y$10$NMVwSjFL5JNhmCzk0kmF/esknVMAFiMPr0JXgT9qjJHCJB3dGakH6', '', 'Mr. Durward Olson', 'parent', 8, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6970496686', '6193088', 0, 4, 50, '', NULL, '[{\"student\":\"Vivienne Dickens\",\"relation\":\"father\",\"id\":133}]', '088.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(201, 'yhoppe', 'baumbach.brook@yahoo.com', '$2y$10$AISivuOkiENY.8dcMnTh.usxMz8OpH.dveCPgYetywXzoL7lC1t12', '', 'Leanna Lemke', 'parent', 10, 2, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5176156102', '3479309', 0, 2, 39, '', NULL, '[{\"student\":\"Vivienne Dickens\",\"relation\":\"father\",\"id\":133}]', '086.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(202, 'qmurphy', 'beatrice.nienow@gmail.com', '$2y$10$rDBpvmv3mlDtBnQ8Tgx8nOkoXbf79dcG2Lh2adpeRLxA.UyVpnpb.', '', 'Juliet Boehm DVM', 'parent', 9, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1435622569', '1449357', 0, 1, 50, '', NULL, '[{\"student\":\"Leatha Kilback\",\"relation\":\"father\",\"id\":143}]', '017.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(203, 'daren.buckridge', 'effie13@reichert.com', '$2y$10$tN8bG1jt//9pdqQfAXzUu.W7czLzEut0nbaonT3OLDWRNek5mJ6ge', '', 'Ashtyn Hansen', 'parent', 6, 3, NULL, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3079716330', '3858972', 0, 4, 47, '', NULL, '[{\"student\":\"Donald Franecki\",\"relation\":\"father\",\"id\":106}]', '046.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1501;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;
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
