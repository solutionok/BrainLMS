-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2019 at 02:08 PM
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
(1, 'Ut. Class', 1, 1, '[\"82\",\"73\",\"89\",\"65\",\"58\",\"97\",\"78\",\"64\",\"63\",\"76\",\"57\"]', ''),
(2, 'Non error. Class', 2, 3, '[\"59\",\"93\",\"62\",\"79\",\"69\",\"80\"]', '[\"9\",\"12\"]'),
(3, 'Porro nobis. Class', 2, 2, '[\"72\",\"92\",\"74\",\"57\",\"87\",\"96\",\"103\",\"71\",\"55\",\"76\"]', '[\"9\",\"14\",\"1\",\"2\",\"11\",\"4\"]'),
(4, 'Suscipit est. Class', 1, 4, '[\"70\",\"88\",\"87\",\"103\",\"67\",\"94\",\"89\",\"59\",\"73\",\"68\",\"97\",\"83\",\"63\",\"72\",\"96\"]', ''),
(5, 'Ipsum. Class', 2, 1, '[\"82\",\"83\",\"61\",\"62\",\"66\",\"63\",\"80\",\"84\",\"55\",\"101\",\"59\"]', ''),
(6, 'Tempore voluptas. Class', 2, 2, '[\"57\",\"67\",\"60\",\"76\",\"64\",\"63\",\"85\",\"83\",\"94\",\"99\",\"56\"]', '[\"13\",\"10\",\"4\"]'),
(7, 'Ut. Class', 2, 3, '[\"100\",\"65\",\"90\",\"103\",\"82\",\"79\",\"85\",\"102\",\"92\",\"104\"]', '[\"3\",\"5\",\"12\",\"8\"]'),
(8, 'Et enim. Class', 2, 2, '[\"67\",\"101\",\"66\",\"65\",\"75\",\"56\"]', '[\"6\",\"8\",\"12\"]'),
(9, 'Nobis. Class', 2, 3, '[\"84\",\"62\",\"102\",\"72\",\"73\",\"75\",\"58\",\"82\",\"66\",\"104\",\"61\",\"64\",\"74\",\"90\"]', ''),
(10, 'Similique doloremque. Class', 1, 4, '[\"94\",\"92\",\"88\",\"100\",\"57\",\"96\",\"76\",\"79\",\"81\",\"82\"]', '[\"15\",\"14\",\"9\"]');

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
(1, 'Atque laborum non.', 'Nemo consequatur labore hic eligendi dolorem sunt veniam corrupti quia tempora vero consectetur beatae consequatur totam cum.', 'students', 'ut', '', 0, '1564226740'),
(2, 'Mollitia tenetur atque harum.', 'Est qui voluptate dignissimos voluptatibus excepturi aut.', 'students', 'commodi', '', 1, '1564226740'),
(3, 'Accusamus cumque perferendis eaque.', 'Eius voluptatibus eius similique saepe unde quisquam dolores.', 'parents', 'sit', '', 1, '1564226740'),
(4, 'Tempora nostrum nemo doloribus sint ut.', 'Id corporis incidunt cum provident vero fugiat vitae sit iusto enim.', 'teacher', 'fugit', '', 0, '1564226740'),
(5, 'Labore voluptatibus.', 'Praesentium eum sunt deleniti maxime adipisci doloribus consequatur.', 'students', 'corporis', '', 1, '1564226740'),
(6, 'Quo aliquam culpa tempore laborum.', 'Dolores sed adipisci quia sequi cum et.', 'parents', 'eius', '', 0, '1564226740'),
(7, 'Quia quibusdam dolores ullam.', 'Similique dignissimos quibusdam voluptatem dicta iste id.', 'all', 'distinctio', '', 1, '1564226740'),
(8, 'Inventore et nihil.', 'Aut ut est voluptates impedit repellendus blanditiis distinctio molestiae vitae similique tempore maiores similique consectetur provident.', 'students', 'corporis', '', 1, '1564226740'),
(9, 'Eligendi voluptates sunt.', 'Nemo aut impedit et est accusamus.', 'parents', 'adipisci', '', 0, '1564226740'),
(10, 'Adipisci vitae.', 'Quis impedit saepe ipsam voluptate illo id sed magni.', 'teacher', 'natus', '', 1, '1564226740'),
(11, 'Ut qui explicabo qui.', 'Alias iste quam excepturi eligendi laudantium facilis fugiat.', 'parents', 'omnis', '', 1, '1564226740'),
(12, 'Fuga veritatis et.', 'Corporis eligendi nemo corporis ut ad eum ipsum ut voluptatem reprehenderit omnis.', 'parents', 'voluptas', '', 1, '1564226740'),
(13, 'Quidem dolorum id illum.', 'Aut illum consequatur sunt voluptatem odit molestiae voluptatibus dolorum est atque.', 'teacher', 'tempora', '', 1, '1564226740'),
(14, 'Non eveniet maxime.', 'Doloribus totam dolorem nesciunt aut mollitia repudiandae voluptatem.', 'parents', 'quibusdam', '', 1, '1564226740'),
(15, 'Expedita alias molestiae.', 'Debitis labore cum accusamus eius consequuntur iure ut.', 'students', 'at', '', 0, '1564226740'),
(16, 'Iusto dolorum repellat non.', 'Fuga odio id cupiditate praesentium aspernatur in sit.', 'teacher', 'veritatis', '', 0, '1564226740'),
(17, 'Ex ullam culpa.', 'Veniam nostrum eos eaque et omnis dignissimos ut qui expedita enim illo quos aut.', 'teacher', 'quae', '', 0, '1564226740'),
(18, 'Pariatur quia.', 'Officia est adipisci similique nemo placeat ratione.', 'all', 'rerum', '', 1, '1564226740'),
(19, 'Soluta iste quaerat.', 'Pariatur sit porro eligendi debitis aut adipisci expedita reprehenderit quis reiciendis nihil esse.', 'parents', 'eaque', '', 0, '1564226740'),
(20, 'Culpa impedit labore voluptatem eos.', 'Debitis voluptates reiciendis labore neque voluptas eum.', 'students', 'id', '', 1, '1564226740'),
(21, 'Et quia ut.', 'Ea omnis consectetur vero quidem earum unde autem minus.', 'parents', 'temporibus', '', 1, '1564226740'),
(22, 'Culpa tenetur incidunt necessitatibus.', 'Qui ad amet repudiandae consequatur aut nesciunt eos eum.', 'all', 'rerum', '', 0, '1564226740'),
(23, 'Et asperiores cum.', 'Nihil voluptatibus recusandae cumque est omnis et deleniti dolorem non rerum autem esse rerum consequuntur consequuntur.', 'students', 'maxime', '', 0, '1564226740'),
(24, 'Dolorem eius voluptates.', 'Minima ea repellendus omnis et possimus amet nulla eos culpa ut deserunt asperiores ea in.', 'all', 'quia', '', 0, '1564226740'),
(25, 'Omnis fugiat dolorem vel.', 'Tenetur voluptatem culpa reiciendis animi corporis doloribus suscipit.', 'students', 'unde', '', 0, '1564226740'),
(26, 'Magni laboriosam.', 'Sunt cupiditate illo id et et.', 'all', 'unde', '', 1, '1564226740'),
(27, 'Incidunt molestiae et natus ex.', 'Quia maxime fugiat sit et deleniti eos fugit ut quidem magnam laudantium.', 'students', 'sit', '', 0, '1564226740'),
(28, 'Reprehenderit ut similique.', 'Et qui magni non nostrum perspiciatis.', 'teacher', 'consequatur', '', 1, '1564226740'),
(29, 'Iste quia veniam sunt.', 'Reprehenderit tempora itaque non dolores molestiae facilis at illo.', 'teacher', 'distinctio', '', 0, '1564226740'),
(30, 'Totam beatae id quidem sed.', 'Aut voluptas expedita ut reprehenderit est molestias deserunt odio omnis ut.', 'parents', 'praesentium', '', 0, '1564226740'),
(31, 'Voluptatem esse similique ullam labore necessitatibus.', 'Vitae similique voluptas voluptates soluta ut at quis non neque earum.', 'parents', 'ad', '', 1, '1564226740'),
(32, 'Quis quia accusamus dolorem voluptatem.', 'Aliquid vel commodi voluptas aliquam et totam.', 'students', 'possimus', '', 0, '1564226740'),
(33, 'Quia doloremque aut voluptas qui.', 'Beatae consequuntur assumenda laboriosam et voluptatum rem repudiandae et consequatur ut veritatis quam ut aliquid.', 'parents', 'est', '', 0, '1564226740'),
(34, 'Et quia.', 'Quos qui impedit in reiciendis praesentium.', 'all', 'et', '', 1, '1564226740'),
(35, 'Vel quaerat quasi incidunt.', 'Beatae facere similique deleniti veniam odit nostrum ipsum molestias.', 'teacher', 'ab', '', 1, '1564226740'),
(36, 'Porro eius.', 'Est deserunt quia sed pariatur inventore qui necessitatibus corporis accusantium error.', 'parents', 'aut', '', 1, '1564226740'),
(37, 'Sit consequatur.', 'Numquam et quam minima libero ab et sint ipsa aperiam quod pariatur.', 'all', 'qui', '', 1, '1564226740'),
(38, 'Veniam quis dicta aliquid.', 'In non corrupti quas ab sit quia nemo porro sit et similique quia.', 'students', 'qui', '', 0, '1564226740'),
(39, 'Vitae mollitia accusantium.', 'Libero ut voluptas magnam enim iusto sunt dolorem nostrum praesentium aut et.', 'all', 'rem', '', 1, '1564226740'),
(40, 'Optio inventore enim minus.', 'Neque expedita a doloremque accusantium nobis tempora perspiciatis est perspiciatis laborum nihil odit.', 'students', 'exercitationem', '', 0, '1564226740'),
(41, 'Dolorem rerum sit.', 'Est commodi non voluptatibus reprehenderit omnis.', 'students', 'quos', '', 0, '1564226740'),
(42, 'Quis non.', 'Ullam in nulla ducimus sed.', 'all', 'inventore', '', 1, '1564226740'),
(43, 'Pariatur omnis fugiat.', 'Perspiciatis voluptas enim quaerat dignissimos laborum omnis ab dolorem itaque laborum itaque.', 'teacher', 'est', '', 1, '1564226740'),
(44, 'Quis dicta.', 'Et maiores sed excepturi dolores excepturi tenetur est quia similique et.', 'teacher', 'rerum', '', 1, '1564226740'),
(45, 'Explicabo et enim nihil.', 'Et excepturi a quia iure nostrum quam perspiciatis et delectus odit qui et beatae.', 'all', 'quam', '', 0, '1564226740'),
(46, 'Non ratione quia beatae.', 'Quaerat dolore itaque consectetur tempore debitis vel qui nisi assumenda quis est doloribus.', 'all', 'voluptas', '', 0, '1564226740'),
(47, 'Deleniti qui consequatur.', 'Praesentium blanditiis quam corporis id vero magnam.', 'parents', 'ut', '', 0, '1564226740'),
(48, 'Ut quia ullam aut.', 'Inventore aut voluptatem consequatur quisquam omnis vel suscipit perspiciatis assumenda maxime id repellat in.', 'parents', 'ut', '', 1, '1564226740'),
(49, 'Et perspiciatis molestiae sit.', 'Iusto at mollitia atque ad praesentium suscipit in.', 'parents', 'saepe', '', 1, '1564226740'),
(50, 'Dolores est.', 'Aspernatur velit voluptas vel et voluptas quos aut repellat molestias.', 'students', 'recusandae', '', 1, '1564226740');

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
(1, 'Et vel.', '', '', '1564226770', 1564226770, 0, '[\"2\",\"7\"]', '[\"31\",\"34\"]', '', 15, 70),
(2, 'Sit dolor.', '', '', '1564226771', 1564226771, 0, '[\"8\",\"5\"]', '[\"12\",\"40\",\"13\"]', '', 9, 60),
(3, 'Nisi porro illo.', '', '', '1564226771', 1564226771, 0, '[\"7\",\"2\",\"1\"]', '[\"40\",\"33\",\"35\"]', '', 1, 85),
(4, 'Eligendi nesciunt ea.', '', '', '1564226771', 1564226771, 0, '[\"8\",\"9\",\"7\"]', '[\"42\",\"11\"]', '', 9, 92),
(5, 'Voluptatem quo.', '', '', '1564226771', 1564226771, 0, '[\"1\",\"3\",\"9\"]', '[\"4\",\"31\"]', '', 8, 96),
(6, 'Quia aut.', '', '', '1564226771', 1564226771, 0, '[\"2\"]', '[\"29\",\"42\",\"46\"]', '', 1, 99),
(7, 'Quas.', '', '', '1564226771', 1564226771, 0, '[\"7\"]', '[\"40\",\"5\"]', '', 11, 58),
(8, 'Vel fugiat.', '', '', '1564226771', 1564226771, 0, '[\"5\",\"4\",\"6\"]', '[\"17\",\"6\"]', '', 1, 85),
(9, 'Quia.', '', '', '1564226771', 1564226771, 0, '[\"10\",\"6\",\"5\"]', '[\"18\"]', '', 12, 103),
(10, 'Sit omnis.', '', '', '1564226771', 1564226771, 0, '[\"6\",\"10\"]', '[\"36\",\"4\"]', '', 5, 60),
(11, 'Id eaque.', '', '', '1564226771', 1564226771, 0, '[\"5\",\"3\",\"1\"]', '[\"43\"]', '', 2, 75),
(12, 'Non sed.', '', '', '1564226771', 1564226771, 0, '[\"3\",\"5\",\"8\"]', '[\"25\",\"3\",\"31\"]', '', 3, 59),
(13, 'Aut illo maxime.', '', '', '1564226771', 1564226771, 0, '[\"7\",\"10\",\"9\"]', '[\"30\",\"8\",\"44\"]', '', 13, 101),
(14, 'Similique aperiam.', '', '', '1564226771', 1564226771, 0, '[\"10\"]', '[\"14\"]', '', 8, 70),
(15, 'Ut maxime.', '', '', '1564226771', 1564226771, 0, '[\"1\",\"5\",\"9\"]', '[\"35\",\"45\"]', '', 5, 93);

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
(1, 'Zoey Rau MD', 'eos', 'Atque placeat repellat tempore rem maiores.', '1564226741', 'Dr. Petra Lynch DVM'),
(2, 'Arturo Nolan', 'eius', 'Suscipit labore non consequuntur dignissimos.', '1564226741', 'Corine Sporer'),
(3, 'Tremayne Jones', 'qui', 'Adipisci nesciunt facilis quod labore consequatur.', '1564226741', 'Jaleel Witting'),
(4, 'Kayden Rice', 'qui', 'Quia voluptas ducimus consequuntur aliquid cupiditate voluptatem.', '1564226741', 'Ola Harris DDS'),
(5, 'Vickie Watsica', 'quam', 'Dolore ex omnis dolor et inventore atque ducimus aut quam.', '1564226741', 'Luis Price'),
(6, 'Theodore Fay', 'non', 'Quisquam dolorum dicta et occaecati repudiandae omnis reprehenderit fugit ab.', '1564226741', 'Zakary Corwin'),
(7, 'Mrs. Tressie Moore DDS', 'quo', 'Ut omnis qui autem molestiae consequuntur.', '1564226741', 'Prof. Jordyn Koss'),
(8, 'Mr. Don Wunsch Sr.', 'enim', 'Vel sint repellat ad pariatur tempora.', '1564226741', 'Mr. Jerod Goldner Jr.'),
(9, 'Abdiel Koelpin', 'qui', 'Inventore consequatur sint culpa similique.', '1564226741', 'Dr. Taya Huel Sr.'),
(10, 'Myrtis Goyette MD', 'optio', 'Ea consequatur est qui est natus est dicta et.', '1564226741', 'Jalyn Rutherford'),
(11, 'Tyreek D\'Amore', 'exercitationem', 'Facere molestiae neque nam.', '1564226741', 'Alexane Thompson'),
(12, 'Miss Antonia Feil IV', 'sit', 'Voluptatem qui consequatur est velit.', '1564226741', 'Lauryn Rippin III'),
(13, 'Deron Luettgen', 'ad', 'Sed consequatur aut non placeat ea sapiente.', '1564226741', 'Nestor Schmidt'),
(14, 'Prof. Brando Dach II', 'ullam', 'Minus esse autem non.', '1564226741', 'Dr. Rafaela Trantow'),
(15, 'Mr. Olaf Lebsack', 'ullam', 'Omnis est iure sint ab non autem.', '1564226741', 'Estell Grimes'),
(16, 'Prof. Selmer Dare', 'id', 'Et qui vel et ea doloribus.', '1564226741', 'Fritz Stehr'),
(17, 'Prof. Daren Fritsch Sr.', 'numquam', 'Aliquid quia odio assumenda accusantium qui aliquam.', '1564226741', 'Ms. Theresia Lynch Jr.'),
(18, 'Bernadine Muller', 'ipsam', 'Consectetur ut iure voluptatem eos assumenda.', '1564226741', 'Gracie Cronin'),
(19, 'Broderick Effertz', 'eum', 'Quis fuga est molestias animi.', '1564226741', 'Miss Marcelle Hettinger IV'),
(20, 'Miss Therese Strosin', 'occaecati', 'Quo et veniam iste harum molestiae dolores.', '1564226741', 'Eulalia Champlin'),
(21, 'Mr. Drake Rippin', 'omnis', 'Voluptate dolor aut consequatur.', '1564226741', 'Prof. Nayeli Keeling'),
(22, 'Ms. Taryn Homenick', 'ut', 'Quasi praesentium numquam et quis autem reprehenderit.', '1564226741', 'Elyssa D\'Amore'),
(23, 'Antonetta Mitchell', 'sapiente', 'Nostrum natus sequi et iure aut pariatur quidem.', '1564226741', 'Adell Zemlak'),
(24, 'Mrs. Margot Hand I', 'et', 'Labore et dolor nemo aut.', '1564226741', 'Devyn Medhurst MD'),
(25, 'Mr. Okey Runolfsson', 'iusto', 'Pariatur eum est repudiandae hic non quasi et.', '1564226741', 'Mrs. Ethyl Rice I'),
(26, 'Dr. Johnny Herman DVM', 'fugit', 'Nesciunt nobis officiis corporis dolore dolorem tempore odit.', '1564226741', 'Prof. Marlin Kulas'),
(27, 'Carmelo Kuhn', 'mollitia', 'At voluptatem velit harum fugit atque quam veritatis.', '1564226741', 'Maud Rogahn'),
(28, 'Celia McGlynn MD', 'deserunt', 'Non sit accusantium possimus voluptatem.', '1564226741', 'Kamille Gleichner'),
(29, 'Devan Bahringer', 'ipsam', 'Sint dolore eligendi eos.', '1564226741', 'Prof. Keyon Hermiston'),
(30, 'Lorna Abernathy MD', 'asperiores', 'Nisi possimus laborum vitae qui voluptatem.', '1564226741', 'Trudie Murazik I'),
(31, 'Prof. Gideon Mayer', 'commodi', 'Sequi quo libero consequatur voluptas consectetur ex.', '1564226741', 'Clara Toy'),
(32, 'Prof. Zula Mann MD', 'deserunt', 'Quaerat ex consequatur eligendi occaecati.', '1564226741', 'Alisha McDermott DDS'),
(33, 'Darryl Dare I', 'vitae', 'Voluptatum veritatis eligendi quidem incidunt dolorum eos.', '1564226741', 'Dr. Fritz Gaylord DDS'),
(34, 'Mrs. Kristy Wolff', 'sint', 'Temporibus ut et explicabo sequi sint sed aut expedita occaecati beatae.', '1564226741', 'Stephan Dickens Sr.'),
(35, 'Jarret Towne DDS', 'sint', 'Quis non dolore delectus impedit.', '1564226741', 'Prof. Tierra Nikolaus'),
(36, 'Dr. Orion Schultz V', 'perspiciatis', 'Dolorem voluptatem est enim odit neque.', '1564226741', 'Mr. Damon Roberts DDS'),
(37, 'Prof. Dino Harvey', 'sunt', 'Et fuga sed dolores velit illo repellat aut molestias consequatur.', '1564226741', 'Efrain Keeling IV'),
(38, 'Eliseo Bogan', 'voluptate', 'Dicta recusandae esse architecto veniam sint ex quo.', '1564226741', 'Alvena Funk'),
(39, 'Ms. Linda Schmitt II', 'quisquam', 'Voluptatum odit necessitatibus labore qui labore aut.', '1564226741', 'Cornelius Hintz'),
(40, 'Sylvester Bradtke', 'delectus', 'Assumenda placeat consequatur animi odit.', '1564226741', 'Miss Pauline Friesen'),
(41, 'Gilda Collier', 'voluptates', 'Quod sunt explicabo enim nulla.', '1564226741', 'Johnathan Carter'),
(42, 'Dr. Halie Schiller', 'qui', 'Nostrum dolorum non aliquam.', '1564226741', 'Hardy Zieme DVM'),
(43, 'Chanelle Keeling', 'ut', 'Debitis quo reprehenderit consequatur omnis dolorem rerum dolorum.', '1564226741', 'Nora Schoen'),
(44, 'Mrs. Cheyanne Windler', 'quia', 'Nobis labore sequi pariatur sit molestiae saepe beatae.', '1564226741', 'Dr. Colleen Smitham V'),
(45, 'Ashlynn Zulauf', 'nihil', 'Illum quasi harum maxime.', '1564226741', 'Jaylon Gusikowski'),
(46, 'Prof. Natalie Roob', 'omnis', 'Quam eveniet aut perspiciatis ullam sit ut saepe et et.', '1564226741', 'Zetta Shields'),
(47, 'Katelin Ankunding', 'officia', 'Nulla dignissimos quod.', '1564226741', 'Shea Tremblay'),
(48, 'Santa Conn', 'ut', 'Neque in repellat similique itaque aut nihil temporibus.', '1564226741', 'Colten Reilly'),
(49, 'Dr. Silas Bayer', 'ratione', 'A aut quo.', '1564226741', 'Prof. Paris Deckow PhD'),
(50, 'Kristin Christiansen', 'non', 'Nulla nemo perspiciatis doloremque quo dolorum.', '1564226741', 'Alan O\'Reilly');

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
(1, 'Neque commodi impedit.', '1564226742', 1, 1, 7, 144, 25),
(2, 'Fuga consectetur iste nihil.', '1564226742', 0, 2, 76, 146, 24),
(3, 'Eaque aliquid quasi rerum quae quia.', '1564226742', 0, 3, 163, 182, 202),
(4, 'Nemo qui repellat quia.', '1564226742', 1, 4, 79, 130, 161),
(5, 'Excepturi temporibus ut doloribus ut fuga.', '1564226742', 1, 5, 206, 155, 142),
(6, 'Beatae fugiat qui fugit.', '1564226742', 0, 6, 47, 39, 60),
(7, 'Et eum sunt quisquam.', '1564226742', 0, 7, 77, 104, 146),
(8, 'Aperiam est a.', '1564226742', 0, 8, 28, 9, 199),
(9, 'Omnis sit non quae fugiat unde.', '1564226742', 1, 9, 98, 11, 12),
(10, 'Et omnis ea nisi.', '1564226742', 0, 10, 146, 123, 106),
(11, 'Quam voluptas quae.', '1564226742', 1, 11, 7, 133, 4),
(12, 'Maxime.', '1564226742', 1, 12, 154, 58, 38),
(13, 'Dolorum aut rerum.', '1564226742', 1, 13, 168, 35, 137),
(14, 'Odio facere quasi vel.', '1564226742', 1, 14, 198, 155, 176),
(15, 'Voluptates dolorem ad provident.', '1564226742', 0, 15, 118, 54, 86),
(16, 'Sit aspernatur delectus earum.', '1564226742', 1, 16, 24, 143, 9),
(17, 'Iste eius sit.', '1564226742', 0, 17, 137, 110, 82),
(18, 'Iste quidem quas dolore optio dolor.', '1564226742', 0, 18, 116, 24, 188),
(19, 'Natus.', '1564226742', 1, 19, 91, 149, 119),
(20, 'Unde sit quod modi.', '1564226742', 0, 20, 155, 15, 66),
(21, 'Quisquam sunt.', '1564226742', 1, 21, 159, 168, 4),
(22, 'Fuga error ut.', '1564226742', 1, 22, 108, 150, 160),
(23, 'Nihil ut aspernatur nulla esse.', '1564226742', 1, 23, 71, 105, 140),
(24, 'Fugiat enim vero eos et.', '1564226742', 0, 24, 192, 158, 160),
(25, 'Et dolores possimus.', '1564226742', 0, 25, 199, 109, 97),
(26, 'Est provident minima voluptas laboriosam repellat.', '1564226742', 1, 26, 196, 77, 113),
(27, 'Quo dolorem voluptates.', '1564226742', 1, 27, 123, 203, 99),
(28, 'Sit est.', '1564226742', 1, 28, 123, 141, 30),
(29, 'Iusto ad.', '1564226742', 1, 29, 154, 7, 97),
(30, 'Facilis ut.', '1564226742', 1, 30, 154, 35, 176),
(31, 'Consequatur est quas.', '1564226742', 0, 31, 34, 47, 202),
(32, 'Eveniet adipisci.', '1564226742', 1, 32, 57, 145, 102),
(33, 'Enim.', '1564226742', 0, 33, 29, 102, 171),
(34, 'Quia rem.', '1564226742', 0, 34, 49, 137, 57),
(35, 'Rerum autem.', '1564226742', 0, 35, 137, 84, 75),
(36, 'Excepturi.', '1564226742', 0, 36, 69, 72, 95),
(37, 'Qui.', '1564226742', 1, 37, 194, 11, 149),
(38, 'Debitis repellendus.', '1564226742', 0, 38, 88, 167, 204),
(39, 'Qui et.', '1564226742', 0, 39, 59, 138, 52),
(40, 'Architecto aut voluptates.', '1564226742', 0, 40, 3, 49, 97),
(41, 'Laudantium eaque incidunt odio.', '1564226742', 0, 41, 17, 135, 94),
(42, 'Vel.', '1564226742', 1, 42, 192, 59, 133),
(43, 'Eaque qui blanditiis aperiam.', '1564226742', 0, 43, 140, 72, 200),
(44, 'Sit quam.', '1564226742', 0, 44, 23, 20, 41),
(45, 'At consequatur.', '1564226742', 1, 45, 145, 91, 184),
(46, 'Consequatur fuga itaque.', '1564226742', 0, 46, 22, 79, 189),
(47, 'Neque et rerum architecto.', '1564226742', 0, 47, 206, 188, 27),
(48, 'Quae.', '1564226742', 1, 48, 131, 74, 130),
(49, 'Ut.', '1564226742', 0, 49, 194, 34, 178),
(50, 'Iure non.', '1564226742', 1, 50, 161, 164, 200),
(51, 'Corporis assumenda officiis.', '1564226742', 1, 51, 104, 123, 56),
(52, 'Repudiandae.', '1564226742', 0, 52, 58, 21, 87),
(53, 'Tempora perspiciatis.', '1564226742', 1, 53, 128, 22, 162),
(54, 'Excepturi suscipit.', '1564226742', 1, 54, 83, 106, 133),
(55, 'Minima maxime perferendis.', '1564226742', 0, 55, 124, 80, 149),
(56, 'Quae.', '1564226742', 0, 56, 133, 68, 60),
(57, 'Consequuntur corporis.', '1564226742', 0, 57, 87, 18, 101),
(58, 'Ipsa quis.', '1564226742', 1, 58, 203, 114, 99),
(59, 'Optio optio nihil sint quia perspiciatis.', '1564226742', 0, 59, 13, 15, 164),
(60, 'Et quia.', '1564226742', 1, 60, 189, 37, 94),
(61, 'Reiciendis fugiat at.', '1564226742', 1, 61, 156, 40, 59),
(62, 'Animi.', '1564226742', 0, 62, 191, 185, 82),
(63, 'Et magnam mollitia.', '1564226742', 0, 63, 20, 120, 99),
(64, 'Alias.', '1564226742', 0, 64, 6, 107, 186),
(65, 'Autem enim.', '1564226742', 0, 65, 200, 83, 178),
(66, 'Voluptatem labore voluptatum.', '1564226742', 1, 66, 182, 76, 194),
(67, 'Voluptatibus consequatur.', '1564226742', 0, 67, 197, 64, 126),
(68, 'Exercitationem dolorem.', '1564226742', 0, 68, 21, 189, 181),
(69, 'Possimus debitis.', '1564226742', 0, 69, 21, 96, 167),
(70, 'Natus.', '1564226742', 0, 70, 94, 126, 9),
(71, 'Repellat et.', '1564226743', 1, 71, 80, 73, 98),
(72, 'Consequuntur rem.', '1564226743', 0, 72, 81, 76, 78),
(73, 'Saepe consectetur voluptatem.', '1564226743', 1, 73, 119, 154, 97),
(74, 'Doloremque quia et.', '1564226743', 1, 74, 2, 177, 65),
(75, 'Quo deserunt pariatur culpa.', '1564226743', 1, 75, 189, 195, 11),
(76, 'Debitis nihil qui.', '1564226743', 1, 76, 204, 116, 182),
(77, 'Voluptatibus perspiciatis molestiae.', '1564226743', 1, 77, 82, 103, 144),
(78, 'Omnis nesciunt aut.', '1564226743', 1, 78, 55, 149, 49),
(79, 'Veniam.', '1564226743', 0, 79, 91, 24, 193),
(80, 'Nisi sed.', '1564226743', 0, 80, 42, 60, 203),
(81, 'Labore ut vitae quaerat.', '1564226743', 0, 81, 96, 113, 111),
(82, 'Enim.', '1564226743', 0, 82, 138, 44, 97),
(83, 'Est sit at ut rerum et.', '1564226743', 0, 83, 138, 89, 145),
(84, 'Quia reiciendis.', '1564226743', 0, 84, 133, 139, 184),
(85, 'Eum voluptates eos minima qui.', '1564226743', 0, 85, 123, 35, 148),
(86, 'Labore.', '1564226743', 0, 86, 164, 78, 49),
(87, 'Modi est ut.', '1564226743', 1, 87, 87, 164, 191),
(88, 'Et aperiam aperiam nisi similique.', '1564226743', 0, 88, 6, 153, 169),
(89, 'Officiis praesentium.', '1564226743', 0, 89, 26, 112, 160),
(90, 'Soluta.', '1564226743', 0, 90, 181, 110, 66),
(91, 'Amet ut eum.', '1564226743', 0, 91, 179, 36, 204),
(92, 'Odio ut.', '1564226743', 1, 92, 203, 122, 72),
(93, 'Magni hic.', '1564226743', 0, 93, 77, 168, 67),
(94, 'Quia consequatur corporis pariatur voluptas.', '1564226743', 0, 94, 156, 42, 47),
(95, 'Cupiditate eum.', '1564226743', 1, 95, 78, 124, 121),
(96, 'Saepe voluptatem.', '1564226743', 1, 96, 203, 104, 50),
(97, 'Et magni.', '1564226743', 1, 97, 153, 18, 194),
(98, 'Beatae aut nihil.', '1564226743', 0, 98, 86, 130, 8),
(99, 'Dicta odio dolor voluptatem dolores.', '1564226743', 0, 99, 175, 34, 89),
(100, 'Minima neque aliquid.', '1564226743', 1, 100, 13, 143, 35),
(101, 'Esse doloremque voluptas consectetur quisquam possimus.', '1564226743', 1, 101, 126, 18, 56),
(102, 'Pariatur commodi porro.', '1564226743', 1, 102, 170, 114, 104),
(103, 'Dicta incidunt ea distinctio.', '1564226743', 0, 103, 69, 127, 114),
(104, 'Earum consequatur cum.', '1564226743', 1, 104, 72, 52, 64),
(105, 'Id aut neque.', '1564226743', 0, 105, 54, 122, 195),
(106, 'Odio assumenda odio.', '1564226743', 1, 106, 69, 45, 116),
(107, 'Tempora quisquam.', '1564226743', 1, 107, 170, 143, 10),
(108, 'Quos eaque voluptas necessitatibus asperiores exercitationem.', '1564226743', 0, 108, 69, 114, 162),
(109, 'Nihil est dicta sit.', '1564226743', 0, 109, 140, 102, 104),
(110, 'Sint et deleniti id atque velit.', '1564226743', 0, 110, 98, 130, 201),
(111, 'Consequuntur eos est.', '1564226743', 1, 111, 178, 182, 126),
(112, 'Est voluptatibus.', '1564226743', 0, 112, 113, 155, 133),
(113, 'A.', '1564226743', 1, 113, 182, 100, 191),
(114, 'Aut rerum excepturi vitae.', '1564226743', 1, 114, 92, 56, 77),
(115, 'Rerum libero rerum blanditiis illo.', '1564226743', 1, 115, 56, 161, 1),
(116, 'Delectus fugiat.', '1564226743', 0, 116, 102, 167, 171),
(117, 'Sunt possimus in velit.', '1564226743', 0, 117, 172, 9, 31),
(118, 'Ipsa.', '1564226743', 1, 118, 188, 30, 112),
(119, 'Omnis modi.', '1564226743', 1, 119, 162, 61, 64),
(120, 'Voluptatem ut aliquam.', '1564226743', 0, 120, 36, 78, 15),
(121, 'Tempore saepe.', '1564226743', 0, 121, 100, 16, 62),
(122, 'Corporis eum officia laboriosam ea.', '1564226743', 1, 122, 1, 41, 6),
(123, 'Tempore tempore fuga.', '1564226743', 0, 123, 1, 199, 147),
(124, 'Culpa exercitationem est labore.', '1564226743', 0, 124, 88, 25, 164),
(125, 'Quia.', '1564226743', 0, 125, 37, 21, 189),
(126, 'Magni sunt repellat quasi.', '1564226743', 0, 126, 107, 91, 103),
(127, 'Nihil nobis.', '1564226743', 1, 127, 6, 179, 103),
(128, 'Dolor.', '1564226743', 0, 128, 21, 140, 91),
(129, 'Distinctio magnam exercitationem.', '1564226743', 0, 129, 46, 100, 128),
(130, 'Fugiat rerum sint placeat.', '1564226743', 1, 130, 18, 77, 126),
(131, 'Fugiat sed.', '1564226743', 1, 131, 109, 79, 185),
(132, 'Sit eius praesentium.', '1564226743', 1, 132, 114, 24, 163),
(133, 'Error.', '1564226743', 1, 133, 197, 54, 108),
(134, 'Unde et suscipit odio.', '1564226743', 0, 134, 21, 42, 55),
(135, 'Voluptates praesentium.', '1564226743', 0, 135, 154, 48, 7),
(136, 'Eligendi sed ut enim.', '1564226743', 0, 136, 10, 151, 147),
(137, 'Eveniet et.', '1564226743', 0, 137, 198, 96, 116),
(138, 'Consequatur atque quos laborum quia.', '1564226743', 1, 138, 11, 149, 140),
(139, 'In voluptatem omnis enim quis et.', '1564226743', 1, 139, 138, 49, 140),
(140, 'Omnis repudiandae ut qui assumenda iure.', '1564226743', 1, 140, 185, 19, 142),
(141, 'Tenetur asperiores repudiandae.', '1564226743', 0, 141, 124, 197, 164),
(142, 'Et sunt quis explicabo est.', '1564226743', 1, 142, 108, 84, 155),
(143, 'Velit voluptatem.', '1564226743', 1, 143, 205, 184, 150),
(144, 'Porro.', '1564226744', 1, 144, 144, 103, 129),
(145, 'Aut dolorum.', '1564226744', 0, 145, 109, 189, 57),
(146, 'Dolores est.', '1564226744', 0, 146, 29, 134, 142),
(147, 'Est quia.', '1564226744', 0, 147, 195, 174, 54),
(148, 'Eligendi dolor.', '1564226744', 0, 148, 84, 179, 190),
(149, 'Saepe dolorem culpa eius.', '1564226744', 0, 149, 63, 114, 182),
(150, 'Dolorem similique.', '1564226744', 1, 150, 199, 17, 127),
(151, 'Distinctio eos hic.', '1564226744', 0, 151, 81, 84, 55),
(152, 'Inventore doloremque hic ut.', '1564226744', 1, 152, 200, 202, 105),
(153, 'Et aliquid.', '1564226744', 1, 153, 9, 60, 149),
(154, 'Voluptatibus animi est veritatis.', '1564226744', 0, 154, 108, 68, 43),
(155, 'Quidem iusto alias.', '1564226744', 1, 155, 71, 11, 125),
(156, 'Non ut eum laboriosam voluptatibus.', '1564226744', 0, 156, 18, 64, 26),
(157, 'Ab qui error et fuga sint.', '1564226744', 0, 157, 133, 145, 158),
(158, 'Minus non qui quae.', '1564226744', 0, 158, 115, 140, 199),
(159, 'Officiis.', '1564226744', 1, 159, 73, 116, 111),
(160, 'Eos distinctio.', '1564226744', 1, 160, 180, 2, 175),
(161, 'Qui aut blanditiis.', '1564226744', 0, 161, 195, 5, 96),
(162, 'Esse ad aspernatur fuga.', '1564226744', 1, 162, 21, 28, 48),
(163, 'Amet eligendi.', '1564226744', 0, 163, 6, 20, 77),
(164, 'Voluptas ad beatae velit.', '1564226744', 1, 164, 133, 99, 70),
(165, 'Ducimus omnis.', '1564226744', 0, 165, 11, 56, 206),
(166, 'Nostrum omnis possimus est.', '1564226744', 1, 166, 109, 39, 190),
(167, 'Inventore qui error commodi.', '1564226744', 1, 167, 137, 122, 60),
(168, 'Qui eum vel.', '1564226744', 0, 168, 161, 60, 25),
(169, 'Sint earum.', '1564226744', 1, 169, 114, 109, 197),
(170, 'Et.', '1564226744', 0, 170, 75, 106, 162),
(171, 'Deleniti quaerat est quisquam.', '1564226744', 1, 171, 81, 71, 205),
(172, 'Voluptatum odio aspernatur.', '1564226744', 0, 172, 113, 170, 107),
(173, 'Iusto ab quidem quaerat.', '1564226744', 1, 173, 121, 72, 131),
(174, 'Impedit corrupti.', '1564226744', 0, 174, 117, 52, 126),
(175, 'Et autem commodi mollitia.', '1564226744', 1, 175, 96, 187, 6),
(176, 'Omnis et voluptatem et iure.', '1564226744', 0, 176, 5, 68, 11),
(177, 'Optio fuga.', '1564226744', 0, 177, 87, 191, 87),
(178, 'Quaerat qui autem ratione.', '1564226744', 1, 178, 12, 59, 72),
(179, 'Et et qui.', '1564226744', 0, 179, 4, 141, 114),
(180, 'Et optio nam et.', '1564226744', 0, 180, 51, 129, 166),
(181, 'Libero rem fugiat soluta.', '1564226744', 0, 181, 26, 200, 12),
(182, 'Molestiae et.', '1564226744', 0, 182, 27, 93, 53),
(183, 'Culpa.', '1564226744', 1, 183, 3, 85, 148),
(184, 'Vel provident quasi.', '1564226744', 1, 184, 48, 143, 119),
(185, 'Illo alias nobis.', '1564226744', 1, 185, 105, 13, 57),
(186, 'Et impedit consequuntur sed.', '1564226744', 1, 186, 188, 108, 205),
(187, 'Nemo.', '1564226744', 0, 187, 179, 178, 164),
(188, 'Quae possimus nemo sunt nulla non.', '1564226744', 1, 188, 22, 60, 178),
(189, 'Labore molestiae tenetur et itaque.', '1564226744', 0, 189, 74, 64, 68),
(190, 'Voluptatibus placeat voluptatem.', '1564226744', 1, 190, 87, 166, 18),
(191, 'Voluptas ullam ab ab sunt.', '1564226744', 0, 191, 162, 23, 60),
(192, 'Quia omnis animi.', '1564226744', 0, 192, 182, 40, 182),
(193, 'Pariatur expedita numquam possimus deserunt est.', '1564226744', 1, 193, 142, 69, 30),
(194, 'Quod qui aut et.', '1564226744', 0, 194, 18, 12, 12),
(195, 'Ipsa qui voluptatem.', '1564226744', 1, 195, 131, 203, 87),
(196, 'Aspernatur perferendis amet.', '1564226744', 0, 196, 130, 52, 132),
(197, 'Facere facere eveniet illum ut.', '1564226744', 1, 197, 25, 115, 79),
(198, 'Delectus et dolore quia quo.', '1564226744', 1, 198, 205, 115, 123),
(199, 'Voluptatibus quia impedit.', '1564226744', 0, 199, 95, 130, 160),
(200, 'Quis qui.', '1564226744', 0, 200, 108, 206, 38),
(201, 'Ad molestiae.', '1564226744', 1, 201, 117, 187, 62),
(202, 'Sunt voluptate dolor praesentium.', '1564226744', 1, 202, 157, 108, 164),
(203, 'At nihil ut.', '1564226744', 1, 203, 69, 91, 178),
(204, 'Quibusdam consequatur nihil.', '1564226744', 1, 204, 72, 69, 192),
(205, 'Eos quia ut.', '1564226744', 1, 205, 61, 193, 41),
(206, 'Voluptatem quas.', '1564226744', 0, 206, 9, 6, 107),
(207, 'Quidem laborum.', '1564226744', 1, 207, 112, 138, 97),
(208, 'Enim eligendi doloremque.', '1564226744', 0, 208, 48, 26, 3),
(209, 'Saepe et dolore.', '1564226744', 1, 209, 204, 126, 84),
(210, 'Reprehenderit.', '1564226744', 0, 210, 141, 159, 11),
(211, 'Veniam vero beatae sapiente.', '1564226745', 1, 211, 22, 188, 16),
(212, 'Maiores.', '1564226745', 1, 212, 53, 35, 93),
(213, 'Distinctio quia.', '1564226745', 0, 213, 78, 18, 28),
(214, 'Dolorem at.', '1564226745', 1, 214, 79, 97, 46),
(215, 'A doloribus asperiores consequatur.', '1564226745', 1, 215, 1, 168, 107),
(216, 'Qui ad reiciendis totam.', '1564226745', 1, 216, 77, 130, 139),
(217, 'Ducimus dolor repudiandae.', '1564226745', 0, 217, 168, 14, 33),
(218, 'Est.', '1564226745', 0, 218, 53, 171, 47),
(219, 'Dolores aut distinctio.', '1564226745', 0, 219, 162, 2, 104),
(220, 'Accusamus.', '1564226745', 1, 220, 37, 87, 144),
(221, 'Aliquam veniam soluta.', '1564226745', 0, 221, 109, 28, 65),
(222, 'Fugit accusantium reiciendis facilis dolor.', '1564226745', 0, 222, 163, 199, 29),
(223, 'Magnam est veniam unde.', '1564226745', 0, 223, 34, 26, 96),
(224, 'Voluptates.', '1564226745', 1, 224, 10, 55, 70),
(225, 'Aut cupiditate et.', '1564226745', 1, 225, 171, 179, 78),
(226, 'Doloribus temporibus dolorem.', '1564226745', 0, 226, 94, 156, 195),
(227, 'Provident illo id amet.', '1564226745', 1, 227, 11, 87, 101),
(228, 'Omnis consequatur.', '1564226745', 0, 228, 166, 110, 67),
(229, 'Est ut sit animi.', '1564226745', 0, 229, 50, 147, 143),
(230, 'Quia.', '1564226745', 1, 230, 99, 102, 70),
(231, 'Iure provident incidunt et.', '1564226745', 1, 231, 168, 157, 155),
(232, 'Reiciendis reiciendis.', '1564226745', 0, 232, 116, 180, 192),
(233, 'Distinctio itaque voluptas.', '1564226745', 1, 233, 157, 168, 143),
(234, 'Sapiente ut architecto exercitationem quaerat.', '1564226745', 0, 234, 183, 164, 181),
(235, 'Temporibus voluptatem.', '1564226745', 1, 235, 40, 66, 87),
(236, 'Voluptatum aut.', '1564226745', 0, 236, 134, 28, 178),
(237, 'Sit velit.', '1564226745', 1, 237, 51, 116, 188),
(238, 'Exercitationem.', '1564226745', 1, 238, 33, 186, 143),
(239, 'Qui qui cumque quas magni rerum.', '1564226745', 1, 239, 52, 40, 55),
(240, 'Dolores aut aut omnis.', '1564226745', 0, 240, 13, 1, 67),
(241, 'Labore.', '1564226745', 1, 241, 66, 201, 177),
(242, 'Numquam unde.', '1564226745', 0, 242, 70, 205, 22),
(243, 'Voluptatem id.', '1564226745', 1, 243, 31, 135, 90),
(244, 'Modi architecto.', '1564226745', 1, 244, 141, 174, 8),
(245, 'Dolor quo.', '1564226745', 1, 245, 7, 148, 143),
(246, 'Officia ad vel.', '1564226745', 0, 246, 39, 111, 198),
(247, 'Provident dolores labore ex voluptatem.', '1564226745', 0, 247, 136, 64, 112),
(248, 'Ullam et.', '1564226745', 0, 248, 117, 68, 136),
(249, 'Ut quia occaecati qui voluptatum.', '1564226745', 1, 249, 34, 103, 199),
(250, 'Similique et.', '1564226745', 1, 250, 192, 162, 90),
(251, 'Eos ipsa ut atque aliquid voluptas.', '1564226745', 0, 251, 91, 96, 157),
(252, 'Placeat eligendi eos.', '1564226745', 1, 252, 83, 56, 87),
(253, 'Quae nulla at.', '1564226745', 1, 253, 194, 19, 58),
(254, 'Soluta ad vitae et nobis.', '1564226745', 0, 254, 101, 201, 177),
(255, 'Possimus et maiores.', '1564226745', 0, 255, 165, 121, 154),
(256, 'Voluptatem dolores.', '1564226745', 0, 256, 133, 177, 175),
(257, 'Corporis velit sit minima.', '1564226745', 1, 257, 107, 184, 116),
(258, 'Quod debitis velit.', '1564226745', 1, 258, 160, 188, 84),
(259, 'Aut perspiciatis dolore deserunt cumque et.', '1564226745', 0, 259, 150, 99, 63),
(260, 'Voluptatum ipsum.', '1564226745', 1, 260, 115, 188, 191),
(261, 'Ratione deleniti quis sit.', '1564226745', 0, 261, 137, 71, 192),
(262, 'In ad aperiam deleniti.', '1564226745', 1, 262, 18, 55, 158),
(263, 'Laborum minima.', '1564226745', 0, 263, 103, 193, 94),
(264, 'Rerum nostrum fugiat saepe perspiciatis.', '1564226745', 1, 264, 44, 108, 7),
(265, 'Suscipit.', '1564226745', 0, 265, 129, 123, 171),
(266, 'Cupiditate qui sunt voluptatem.', '1564226745', 1, 266, 76, 181, 1),
(267, 'Possimus aut qui.', '1564226745', 1, 267, 84, 66, 117),
(268, 'Rem nisi quae.', '1564226745', 0, 268, 137, 27, 156),
(269, 'Voluptatem iusto ullam dicta incidunt.', '1564226745', 1, 269, 100, 153, 195),
(270, 'Aut sunt omnis facere enim.', '1564226745', 0, 270, 197, 102, 64),
(271, 'Qui aut.', '1564226745', 1, 271, 166, 176, 110),
(272, 'Aut culpa.', '1564226745', 0, 272, 163, 89, 201),
(273, 'Aliquam sed.', '1564226745', 0, 273, 108, 161, 203),
(274, 'Quos est molestiae blanditiis.', '1564226745', 1, 274, 154, 115, 81),
(275, 'Nam quidem nihil.', '1564226745', 1, 275, 180, 72, 111),
(276, 'Praesentium quo.', '1564226745', 1, 276, 23, 117, 44),
(277, 'Officia sunt accusamus.', '1564226745', 0, 277, 41, 39, 54),
(278, 'Quia assumenda inventore.', '1564226745', 0, 278, 61, 118, 206),
(279, 'Facere sunt et.', '1564226745', 0, 279, 124, 3, 74),
(280, 'Culpa laborum.', '1564226745', 1, 280, 128, 84, 168),
(281, 'Modi iure earum ea.', '1564226745', 1, 281, 133, 96, 49),
(282, 'Quas voluptas quidem eveniet aperiam.', '1564226745', 1, 282, 105, 126, 7),
(283, 'Itaque ex ratione.', '1564226746', 1, 283, 121, 97, 46),
(284, 'Laboriosam dolor vel mollitia ut.', '1564226746', 0, 284, 110, 30, 87),
(285, 'Occaecati aperiam voluptate.', '1564226746', 0, 285, 161, 142, 32),
(286, 'Aliquid voluptas quidem iusto neque.', '1564226746', 1, 286, 160, 96, 167),
(287, 'Dignissimos iste.', '1564226746', 1, 287, 158, 79, 202),
(288, 'Est corporis voluptatem.', '1564226746', 0, 288, 127, 33, 22),
(289, 'Quos enim ipsum voluptate.', '1564226746', 1, 289, 20, 32, 120),
(290, 'Cupiditate cumque ad dolorum.', '1564226746', 1, 290, 148, 41, 14),
(291, 'Perferendis officia alias.', '1564226746', 1, 291, 29, 126, 115),
(292, 'Et sunt doloremque.', '1564226746', 1, 292, 78, 130, 174),
(293, 'Placeat corporis.', '1564226746', 0, 293, 154, 69, 83),
(294, 'Aliquid iusto.', '1564226746', 1, 294, 177, 70, 139),
(295, 'Unde sapiente.', '1564226746', 0, 295, 161, 111, 66),
(296, 'Dolorem voluptate sapiente officia.', '1564226746', 0, 296, 63, 35, 8),
(297, 'Ex dolorum sed ut.', '1564226746', 0, 297, 3, 130, 193),
(298, 'Ipsa tenetur vel.', '1564226746', 1, 298, 154, 14, 22),
(299, 'Adipisci rem maxime dolorem.', '1564226746', 0, 299, 59, 139, 48),
(300, 'Illum at vel aut.', '1564226746', 0, 300, 92, 74, 40),
(301, 'Corporis qui atque.', '1564226746', 1, 301, 34, 124, 56),
(302, 'Quis ab.', '1564226746', 0, 302, 117, 65, 71),
(303, 'Consequuntur consequatur officia vel distinctio.', '1564226746', 1, 303, 119, 127, 19),
(304, 'Ut velit.', '1564226746', 1, 304, 93, 100, 143),
(305, 'Laborum consectetur vero.', '1564226746', 0, 305, 176, 98, 75),
(306, 'Deserunt beatae sapiente sit.', '1564226746', 0, 306, 64, 200, 1),
(307, 'Suscipit aut illo sed.', '1564226746', 1, 307, 173, 109, 121),
(308, 'Et id.', '1564226746', 0, 308, 121, 49, 88),
(309, 'Voluptas maiores enim et.', '1564226746', 1, 309, 29, 48, 122),
(310, 'Et quos.', '1564226746', 0, 310, 51, 45, 55),
(311, 'Perferendis.', '1564226746', 1, 311, 192, 76, 81),
(312, 'Error quia.', '1564226746', 1, 312, 115, 148, 181),
(313, 'Tempora unde esse ratione.', '1564226746', 0, 313, 133, 121, 51),
(314, 'Neque.', '1564226746', 0, 314, 132, 37, 35),
(315, 'Voluptate et.', '1564226746', 1, 315, 14, 84, 174),
(316, 'Porro velit sint.', '1564226746', 1, 316, 84, 152, 9),
(317, 'Enim reiciendis.', '1564226746', 0, 317, 16, 44, 76),
(318, 'Odit soluta.', '1564226746', 1, 318, 66, 101, 128),
(319, 'Veniam.', '1564226746', 0, 319, 24, 137, 185),
(320, 'Eos fuga.', '1564226746', 0, 320, 164, 16, 113),
(321, 'Magnam voluptatem sapiente.', '1564226746', 1, 321, 39, 172, 203),
(322, 'Temporibus.', '1564226746', 0, 322, 9, 158, 170),
(323, 'Quis.', '1564226746', 0, 323, 144, 52, 128),
(324, 'Repudiandae similique quam.', '1564226746', 0, 324, 151, 93, 136),
(325, 'Error est eum voluptatem rerum.', '1564226746', 1, 325, 55, 137, 142),
(326, 'Qui voluptatibus minus est nihil.', '1564226746', 0, 326, 198, 132, 161),
(327, 'Numquam voluptatum.', '1564226746', 1, 327, 71, 83, 107),
(328, 'Quia voluptas impedit non.', '1564226746', 1, 328, 205, 69, 115),
(329, 'Occaecati at.', '1564226746', 0, 329, 145, 169, 22),
(330, 'Esse itaque.', '1564226746', 0, 330, 9, 129, 25),
(331, 'Expedita et.', '1564226746', 0, 331, 78, 111, 129),
(332, 'Consequatur enim temporibus eius laudantium ad.', '1564226746', 1, 332, 139, 36, 154),
(333, 'Impedit accusantium.', '1564226746', 1, 333, 195, 27, 73),
(334, 'Nulla ipsam.', '1564226746', 0, 334, 130, 14, 43),
(335, 'Delectus quam corporis.', '1564226746', 1, 335, 14, 205, 113),
(336, 'Maxime quo vel.', '1564226746', 0, 336, 12, 74, 31),
(337, 'Odio qui quia corrupti quis.', '1564226746', 1, 337, 59, 8, 191),
(338, 'Quasi vero.', '1564226746', 0, 338, 147, 21, 30),
(339, 'At blanditiis saepe.', '1564226746', 1, 339, 149, 103, 108),
(340, 'Et in est.', '1564226746', 0, 340, 38, 27, 115),
(341, 'Accusantium debitis.', '1564226746', 1, 341, 34, 189, 169),
(342, 'Beatae nobis.', '1564226746', 0, 342, 167, 41, 82),
(343, 'Velit occaecati id.', '1564226746', 0, 343, 154, 143, 7),
(344, 'Cumque.', '1564226747', 0, 344, 28, 14, 89),
(345, 'Magni vitae aut minus vel.', '1564226747', 0, 345, 19, 163, 31),
(346, 'Non soluta error.', '1564226747', 1, 346, 135, 34, 182),
(347, 'Numquam.', '1564226747', 1, 347, 181, 154, 141),
(348, 'Blanditiis voluptate temporibus.', '1564226747', 0, 348, 176, 148, 194),
(349, 'Et et illum hic unde.', '1564226747', 0, 349, 87, 206, 174),
(350, 'Sapiente dolorem.', '1564226747', 0, 350, 205, 128, 123),
(351, 'Consequatur accusamus.', '1564226747', 0, 351, 173, 189, 104),
(352, 'Delectus.', '1564226747', 0, 352, 161, 105, 65),
(353, 'Quos expedita nam.', '1564226747', 0, 353, 153, 37, 113),
(354, 'Quas et sint.', '1564226747', 0, 354, 2, 150, 66),
(355, 'Doloribus molestias eius.', '1564226747', 0, 355, 165, 107, 11),
(356, 'Fugit consequatur.', '1564226747', 1, 356, 64, 12, 39),
(357, 'Saepe repellat.', '1564226747', 0, 357, 108, 65, 196),
(358, 'Laboriosam molestiae.', '1564226747', 0, 358, 95, 121, 55),
(359, 'Et ut ullam.', '1564226747', 1, 359, 5, 189, 86),
(360, 'Enim sunt nihil.', '1564226747', 1, 360, 87, 81, 119),
(361, 'Quis quis minima quo iusto.', '1564226747', 0, 361, 70, 41, 184),
(362, 'Incidunt ut sed error.', '1564226747', 1, 362, 134, 11, 105),
(363, 'Saepe quasi necessitatibus.', '1564226747', 1, 363, 164, 64, 111),
(364, 'Eaque et tenetur vel voluptates.', '1564226747', 0, 364, 31, 53, 54),
(365, 'At placeat impedit.', '1564226747', 1, 365, 44, 64, 48),
(366, 'Qui pariatur sed omnis aut.', '1564226747', 0, 366, 171, 46, 89),
(367, 'Repellendus placeat sapiente.', '1564226747', 1, 367, 33, 63, 94),
(368, 'Ullam numquam assumenda non.', '1564226747', 1, 368, 14, 129, 134),
(369, 'Possimus ea.', '1564226747', 1, 369, 12, 134, 85),
(370, 'Aut delectus.', '1564226747', 0, 370, 65, 134, 50),
(371, 'Nobis.', '1564226747', 0, 371, 21, 82, 148),
(372, 'Reprehenderit.', '1564226747', 1, 372, 161, 202, 86),
(373, 'Dolor perspiciatis nisi nihil.', '1564226747', 1, 373, 151, 158, 90),
(374, 'Qui molestiae neque facilis.', '1564226747', 0, 374, 165, 165, 136),
(375, 'Reprehenderit iusto sit.', '1564226747', 1, 375, 128, 16, 124),
(376, 'Ullam sint sed.', '1564226747', 0, 376, 37, 176, 37),
(377, 'Numquam eaque.', '1564226747', 0, 377, 193, 33, 77),
(378, 'Libero sunt cupiditate quis.', '1564226747', 1, 378, 41, 35, 190),
(379, 'Quia recusandae ut sint.', '1564226747', 1, 379, 79, 102, 119),
(380, 'Eum voluptas aut.', '1564226747', 1, 380, 107, 103, 157),
(381, 'At sed voluptatem.', '1564226747', 0, 381, 176, 198, 81),
(382, 'Quod et.', '1564226747', 1, 382, 201, 139, 31),
(383, 'Nemo quia.', '1564226747', 0, 383, 60, 7, 108),
(384, 'Aut aspernatur autem porro omnis.', '1564226747', 1, 384, 58, 159, 99),
(385, 'Ut tenetur assumenda.', '1564226747', 1, 385, 204, 193, 21),
(386, 'Nostrum consequuntur dolorem.', '1564226747', 1, 386, 105, 194, 184),
(387, 'Quisquam maiores sapiente omnis.', '1564226747', 1, 387, 86, 105, 22),
(388, 'Repudiandae voluptas inventore nihil asperiores.', '1564226747', 0, 388, 190, 95, 65),
(389, 'Nostrum libero sequi illum.', '1564226747', 0, 389, 73, 21, 193),
(390, 'Laudantium.', '1564226747', 1, 390, 162, 82, 149),
(391, 'Sunt esse.', '1564226747', 1, 391, 71, 27, 117),
(392, 'Unde impedit assumenda sunt dolorem.', '1564226747', 0, 392, 145, 48, 171),
(393, 'Corrupti fuga.', '1564226747', 1, 393, 200, 154, 85),
(394, 'Et adipisci.', '1564226747', 0, 394, 176, 150, 113),
(395, 'Voluptatem qui est amet.', '1564226747', 1, 395, 110, 189, 170),
(396, 'Alias.', '1564226747', 1, 396, 51, 88, 83),
(397, 'Neque illo et.', '1564226747', 0, 397, 87, 80, 151),
(398, 'Nam minima consequatur asperiores porro.', '1564226747', 1, 398, 84, 24, 44),
(399, 'Autem esse dolor.', '1564226747', 1, 399, 5, 14, 28),
(400, 'Velit.', '1564226747', 1, 400, 115, 30, 102),
(401, 'Unde unde esse.', '1564226747', 0, 401, 40, 181, 89),
(402, 'Asperiores repudiandae cumque.', '1564226747', 0, 402, 62, 186, 166),
(403, 'Error quisquam et est.', '1564226747', 1, 403, 160, 1, 143),
(404, 'Modi ullam amet omnis voluptatem.', '1564226747', 1, 404, 102, 47, 193),
(405, 'Eum repellendus.', '1564226747', 1, 405, 162, 198, 99),
(406, 'Sint enim inventore.', '1564226747', 0, 406, 113, 107, 64),
(407, 'Consequatur illo velit architecto.', '1564226748', 1, 407, 38, 196, 159),
(408, 'Reprehenderit est sint.', '1564226748', 0, 408, 130, 26, 43),
(409, 'Quasi quia quia.', '1564226748', 1, 409, 156, 47, 182),
(410, 'Ipsum voluptas eaque.', '1564226748', 1, 410, 84, 206, 191),
(411, 'Fugit fugiat.', '1564226748', 0, 411, 22, 137, 31),
(412, 'Eaque.', '1564226748', 1, 412, 180, 91, 143),
(413, 'Reprehenderit sit aut.', '1564226748', 1, 413, 89, 29, 43),
(414, 'Consequatur perspiciatis sed.', '1564226748', 1, 414, 146, 47, 75),
(415, 'Optio rem tempore.', '1564226748', 1, 415, 57, 12, 38),
(416, 'Laboriosam qui cupiditate.', '1564226748', 0, 416, 63, 153, 48),
(417, 'Illum unde adipisci eum.', '1564226748', 0, 417, 114, 184, 163),
(418, 'Ullam et eum.', '1564226748', 0, 418, 172, 109, 8),
(419, 'Quod.', '1564226748', 1, 419, 28, 170, 152),
(420, 'Atque quas eos.', '1564226748', 0, 420, 168, 98, 101),
(421, 'Qui nulla et.', '1564226748', 1, 421, 53, 118, 69),
(422, 'Odit.', '1564226748', 0, 422, 59, 29, 180),
(423, 'Dolor labore.', '1564226748', 0, 423, 28, 111, 183),
(424, 'Voluptas illo dolorem.', '1564226748', 1, 424, 121, 121, 133),
(425, 'Aperiam est maiores.', '1564226748', 0, 425, 127, 15, 4),
(426, 'Recusandae ipsam quo.', '1564226748', 1, 426, 154, 172, 188),
(427, 'A.', '1564226748', 1, 427, 185, 117, 196),
(428, 'Aut nisi officiis ipsa inventore iste.', '1564226748', 1, 428, 105, 45, 62),
(429, 'Magnam veniam nihil veritatis.', '1564226748', 0, 429, 99, 203, 66),
(430, 'Iure quia id aut.', '1564226748', 0, 430, 21, 202, 180),
(431, 'Voluptatibus non.', '1564226748', 1, 431, 128, 66, 197),
(432, 'Deserunt nesciunt iusto.', '1564226748', 0, 432, 106, 1, 48),
(433, 'Voluptatem tempora pariatur.', '1564226748', 0, 433, 186, 155, 190),
(434, 'Qui ut repudiandae similique perspiciatis repellat.', '1564226748', 0, 434, 141, 29, 153),
(435, 'Assumenda tenetur eaque.', '1564226748', 0, 435, 26, 119, 146),
(436, 'Ducimus non assumenda dolore corrupti suscipit.', '1564226748', 1, 436, 117, 122, 193),
(437, 'Quis voluptas.', '1564226748', 1, 437, 96, 34, 2),
(438, 'Quia repellendus sed itaque.', '1564226748', 1, 438, 175, 17, 37),
(439, 'Sint sed.', '1564226748', 1, 439, 97, 126, 132),
(440, 'Doloribus praesentium.', '1564226748', 1, 440, 136, 203, 94),
(441, 'Deleniti enim.', '1564226748', 0, 441, 186, 204, 46),
(442, 'Quibusdam corrupti maiores sunt sed.', '1564226748', 0, 442, 154, 18, 118),
(443, 'Sint ut.', '1564226748', 0, 443, 172, 175, 1),
(444, 'Nemo.', '1564226748', 0, 444, 138, 33, 51),
(445, 'Consequatur.', '1564226748', 0, 445, 74, 56, 148),
(446, 'Eveniet ut.', '1564226748', 1, 446, 182, 176, 41),
(447, 'Repudiandae dignissimos atque.', '1564226748', 0, 447, 196, 168, 111),
(448, 'Sapiente et neque.', '1564226748', 0, 448, 103, 165, 12),
(449, 'Quia atque.', '1564226748', 1, 449, 191, 59, 173),
(450, 'Consequatur et natus vitae rerum exercitationem.', '1564226748', 0, 450, 15, 189, 51),
(451, 'Consequatur.', '1564226748', 1, 451, 102, 187, 60),
(452, 'Cumque.', '1564226748', 0, 452, 125, 79, 184),
(453, 'Eveniet placeat quia.', '1564226748', 1, 453, 26, 65, 7),
(454, 'Veritatis commodi aliquam.', '1564226748', 0, 454, 55, 2, 97),
(455, 'Sunt.', '1564226748', 0, 455, 46, 26, 60),
(456, 'Tempora rerum facilis.', '1564226748', 0, 456, 109, 160, 162),
(457, 'Facilis optio et sed.', '1564226748', 0, 457, 56, 128, 72),
(458, 'Voluptates ipsum quo voluptatibus dolores et.', '1564226748', 1, 458, 43, 115, 152),
(459, 'Beatae quia asperiores.', '1564226748', 1, 459, 9, 61, 69),
(460, 'Vel distinctio placeat occaecati.', '1564226748', 0, 460, 184, 162, 196),
(461, 'Quos quam rem.', '1564226748', 1, 461, 28, 189, 54),
(462, 'Facilis unde.', '1564226748', 1, 462, 136, 15, 89),
(463, 'Enim qui.', '1564226748', 1, 463, 92, 71, 148),
(464, 'Voluptas dicta.', '1564226748', 1, 464, 34, 3, 51),
(465, 'Delectus deleniti qui.', '1564226748', 0, 465, 32, 38, 200),
(466, 'Neque blanditiis et inventore.', '1564226748', 1, 466, 183, 131, 50),
(467, 'Placeat aut delectus.', '1564226748', 1, 467, 172, 28, 95),
(468, 'Eos sunt unde explicabo quod.', '1564226748', 0, 468, 38, 100, 189),
(469, 'Voluptatem sapiente.', '1564226748', 1, 469, 45, 168, 112),
(470, 'Aut nihil.', '1564226748', 1, 470, 143, 91, 162),
(471, 'Ut est.', '1564226748', 1, 471, 8, 115, 77),
(472, 'Vel.', '1564226748', 0, 472, 31, 145, 150),
(473, 'Fugiat dolorum consequatur.', '1564226748', 1, 473, 159, 98, 70),
(474, 'Molestiae.', '1564226748', 1, 474, 112, 48, 198),
(475, 'Et vel velit quia maxime.', '1564226748', 0, 475, 35, 56, 60),
(476, 'Beatae non eaque.', '1564226748', 1, 476, 135, 185, 196),
(477, 'Ad in dolor.', '1564226748', 0, 477, 117, 129, 156),
(478, 'Animi.', '1564226748', 0, 478, 123, 59, 107),
(479, 'Sunt illo corporis.', '1564226749', 0, 479, 131, 17, 21),
(480, 'Voluptatem aut beatae repellat aut.', '1564226749', 1, 480, 140, 63, 110),
(481, 'Et ad fuga quia.', '1564226749', 1, 481, 64, 27, 152),
(482, 'Provident nihil rem.', '1564226749', 1, 482, 96, 75, 52),
(483, 'Sint corporis.', '1564226749', 1, 483, 157, 109, 5),
(484, 'Voluptatem optio quia.', '1564226749', 1, 484, 105, 23, 105),
(485, 'Mollitia nemo.', '1564226749', 1, 485, 80, 151, 45),
(486, 'Temporibus optio cupiditate ut.', '1564226749', 1, 486, 64, 133, 180),
(487, 'Quod.', '1564226749', 1, 487, 179, 68, 202),
(488, 'Explicabo ut natus.', '1564226749', 1, 488, 63, 51, 102),
(489, 'Possimus.', '1564226749', 0, 489, 34, 32, 15),
(490, 'Repudiandae magni culpa.', '1564226749', 0, 490, 47, 107, 66),
(491, 'Voluptate magnam.', '1564226749', 0, 491, 130, 162, 142),
(492, 'Aspernatur aut quod ut fuga.', '1564226749', 0, 492, 131, 87, 104),
(493, 'Excepturi amet et aliquid ullam.', '1564226749', 1, 493, 101, 139, 4),
(494, 'Incidunt.', '1564226749', 0, 494, 135, 10, 58),
(495, 'Nihil placeat aut repellat eaque.', '1564226749', 0, 495, 164, 195, 43),
(496, 'Dolore.', '1564226749', 1, 496, 188, 191, 20),
(497, 'Ut facere laudantium.', '1564226749', 1, 497, 40, 8, 70),
(498, 'Iure necessitatibus et dolore.', '1564226749', 0, 498, 183, 71, 34),
(499, 'Saepe sed.', '1564226749', 1, 499, 127, 192, 65),
(500, 'Sit qui.', '1564226749', 1, 500, 119, 10, 31),
(501, 'Cum mollitia pariatur qui.', '1564226749', 1, 501, 6, 195, 44),
(502, 'Odit porro repellat ut.', '1564226749', 0, 502, 29, 180, 178),
(503, 'Ea iste.', '1564226749', 1, 503, 3, 93, 139),
(504, 'Itaque dolorem.', '1564226749', 0, 504, 91, 33, 199),
(505, 'Nesciunt deserunt amet.', '1564226749', 0, 505, 89, 129, 150),
(506, 'Nemo eius.', '1564226749', 1, 506, 94, 181, 182),
(507, 'Numquam dolores.', '1564226749', 0, 507, 206, 144, 51),
(508, 'Pariatur porro.', '1564226749', 0, 508, 170, 99, 49),
(509, 'Rerum molestias consequatur sint.', '1564226749', 0, 509, 160, 20, 19),
(510, 'Aut officia.', '1564226749', 1, 510, 26, 41, 84),
(511, 'Repudiandae facilis expedita illo.', '1564226749', 1, 511, 48, 12, 202),
(512, 'Repudiandae.', '1564226749', 0, 512, 107, 158, 176),
(513, 'Nesciunt voluptatum dolores.', '1564226749', 0, 513, 27, 113, 178),
(514, 'Culpa optio.', '1564226749', 1, 514, 5, 2, 3),
(515, 'Sed est error quaerat.', '1564226749', 1, 515, 87, 126, 88),
(516, 'Ab aut perspiciatis.', '1564226749', 1, 516, 5, 81, 107),
(517, 'Necessitatibus.', '1564226749', 0, 517, 193, 93, 4),
(518, 'Quis neque.', '1564226749', 1, 518, 150, 170, 57),
(519, 'Ab quidem.', '1564226749', 1, 519, 89, 150, 157),
(520, 'Sit temporibus sunt.', '1564226749', 0, 520, 63, 35, 122),
(521, 'Voluptatibus amet atque nesciunt autem.', '1564226749', 1, 521, 163, 36, 69),
(522, 'Ab est.', '1564226749', 1, 522, 61, 185, 67),
(523, 'Repellat deleniti.', '1564226749', 1, 523, 47, 10, 74),
(524, 'Ea iusto nesciunt odio.', '1564226749', 1, 524, 98, 97, 114),
(525, 'Distinctio sit distinctio.', '1564226749', 0, 525, 66, 31, 62),
(526, 'Quibusdam ipsa quia.', '1564226749', 1, 526, 167, 127, 204),
(527, 'Nulla molestiae.', '1564226749', 1, 527, 164, 126, 132),
(528, 'Dicta id animi eligendi.', '1564226749', 0, 528, 128, 19, 125),
(529, 'Ut corporis dolorem sit quia minima.', '1564226749', 0, 529, 15, 122, 20),
(530, 'Asperiores ea.', '1564226749', 0, 530, 103, 129, 64),
(531, 'Ut voluptates debitis.', '1564226749', 0, 531, 18, 59, 7),
(532, 'Reiciendis ea corrupti.', '1564226750', 0, 532, 203, 29, 82),
(533, 'Tempore deserunt rerum.', '1564226750', 0, 533, 2, 111, 55),
(534, 'Asperiores quae.', '1564226750', 0, 534, 71, 69, 135),
(535, 'Dolor autem esse provident.', '1564226750', 1, 535, 189, 5, 62),
(536, 'Reprehenderit quaerat quidem fuga aut.', '1564226750', 1, 536, 133, 77, 57),
(537, 'Dolorem ut vero praesentium reiciendis quis.', '1564226750', 1, 537, 113, 3, 104),
(538, 'Quia tempore voluptatem aut impedit.', '1564226750', 1, 538, 127, 53, 61),
(539, 'Sunt.', '1564226750', 1, 539, 72, 191, 55),
(540, 'Recusandae magnam architecto.', '1564226750', 1, 540, 81, 165, 119),
(541, 'Et aperiam.', '1564226750', 0, 541, 168, 5, 56),
(542, 'Ut.', '1564226750', 0, 542, 160, 136, 161),
(543, 'Non provident facilis hic.', '1564226750', 1, 543, 120, 9, 150),
(544, 'Aspernatur laborum adipisci.', '1564226750', 1, 544, 37, 71, 41),
(545, 'Quod minus deserunt dolorem.', '1564226750', 1, 545, 125, 5, 82),
(546, 'Nemo ratione necessitatibus ab et.', '1564226750', 1, 546, 19, 112, 32),
(547, 'Aliquid velit iste.', '1564226750', 1, 547, 143, 67, 18),
(548, 'Harum nostrum dolores.', '1564226750', 1, 548, 103, 101, 97),
(549, 'Voluptas alias.', '1564226750', 0, 549, 173, 27, 92),
(550, 'Sed quis totam ipsum.', '1564226750', 0, 550, 46, 137, 86),
(551, 'Reiciendis.', '1564226750', 0, 551, 101, 83, 141),
(552, 'Voluptates occaecati placeat.', '1564226750', 0, 552, 52, 200, 170),
(553, 'Quo magnam.', '1564226751', 0, 553, 3, 48, 174),
(554, 'Dolor nesciunt explicabo.', '1564226751', 0, 554, 45, 189, 19),
(555, 'Eos possimus odit.', '1564226751', 1, 555, 195, 12, 3),
(556, 'Voluptatum.', '1564226751', 1, 556, 95, 106, 178),
(557, 'Enim voluptatibus sit.', '1564226751', 1, 557, 104, 25, 49),
(558, 'Hic qui perspiciatis.', '1564226751', 1, 558, 64, 98, 144),
(559, 'Sit laudantium.', '1564226751', 0, 559, 143, 24, 77),
(560, 'Et quis sapiente.', '1564226751', 1, 560, 170, 73, 98),
(561, 'Libero fugiat nobis ea consectetur sed.', '1564226751', 1, 561, 43, 7, 120),
(562, 'In porro delectus autem.', '1564226751', 1, 562, 20, 78, 85),
(563, 'Fugiat accusamus dicta.', '1564226751', 1, 563, 52, 133, 116),
(564, 'Ullam est modi consequuntur eos.', '1564226751', 1, 564, 102, 174, 121),
(565, 'Voluptas amet tenetur.', '1564226751', 1, 565, 155, 137, 30),
(566, 'Quam rerum.', '1564226751', 1, 566, 39, 40, 158),
(567, 'Consequuntur quae.', '1564226751', 0, 567, 155, 141, 188),
(568, 'Quo.', '1564226751', 1, 568, 104, 88, 194),
(569, 'Sit quia sint.', '1564226751', 1, 569, 70, 149, 72),
(570, 'Ut.', '1564226751', 1, 570, 131, 17, 118),
(571, 'Quia quo enim accusamus consectetur.', '1564226751', 1, 571, 42, 61, 38),
(572, 'Eum corporis.', '1564226751', 1, 572, 41, 31, 20),
(573, 'Molestiae eaque fuga mollitia.', '1564226751', 1, 573, 68, 72, 120),
(574, 'Quasi soluta minus.', '1564226751', 0, 574, 144, 118, 61),
(575, 'Qui officiis provident nam aut.', '1564226751', 0, 575, 137, 94, 125),
(576, 'Aut culpa nulla.', '1564226751', 0, 576, 201, 38, 70),
(577, 'Nesciunt quibusdam non tempore aliquam.', '1564226751', 1, 577, 13, 134, 22),
(578, 'Repellat omnis.', '1564226751', 0, 578, 106, 135, 87),
(579, 'Sunt vero ut.', '1564226751', 0, 579, 58, 74, 7),
(580, 'Quam omnis.', '1564226751', 1, 580, 62, 26, 202),
(581, 'Qui ut.', '1564226751', 1, 581, 37, 32, 107),
(582, 'Facilis illo aliquid maxime alias.', '1564226751', 1, 582, 21, 114, 124),
(583, 'Assumenda tempora.', '1564226751', 0, 583, 94, 123, 76),
(584, 'Quaerat perspiciatis dolorem.', '1564226751', 0, 584, 43, 8, 97),
(585, 'Dolorem velit enim ut.', '1564226751', 1, 585, 159, 75, 177),
(586, 'Debitis pariatur reprehenderit reprehenderit aliquam.', '1564226752', 1, 586, 136, 171, 97),
(587, 'Facilis.', '1564226752', 1, 587, 189, 64, 163),
(588, 'Odio ut.', '1564226752', 0, 588, 121, 18, 84),
(589, 'Sapiente eum.', '1564226752', 0, 589, 101, 171, 176),
(590, 'Omnis illum.', '1564226752', 0, 590, 140, 32, 119),
(591, 'Voluptatum in nihil nisi.', '1564226752', 1, 591, 9, 88, 194),
(592, 'Sit omnis.', '1564226752', 1, 592, 165, 189, 61),
(593, 'Molestias aut.', '1564226752', 1, 593, 45, 109, 134),
(594, 'Magnam excepturi.', '1564226752', 1, 594, 116, 31, 53),
(595, 'Qui quisquam nesciunt qui.', '1564226752', 1, 595, 44, 76, 106),
(596, 'Exercitationem qui beatae.', '1564226752', 1, 596, 161, 21, 7),
(597, 'Recusandae.', '1564226752', 1, 597, 132, 21, 172),
(598, 'Tempore aut ab enim.', '1564226752', 1, 598, 56, 28, 54),
(599, 'Pariatur cum debitis rerum aut.', '1564226752', 1, 599, 48, 54, 19),
(600, 'Nostrum quia sit suscipit porro.', '1564226752', 0, 600, 43, 60, 184),
(601, 'Et ipsam.', '1564226752', 0, 601, 43, 113, 205),
(602, 'Aperiam.', '1564226752', 1, 602, 75, 142, 149),
(603, 'Aut.', '1564226752', 0, 603, 63, 32, 165),
(604, 'Eum pariatur.', '1564226752', 0, 604, 198, 90, 187),
(605, 'Et accusantium non ratione dolorum.', '1564226752', 1, 605, 48, 86, 188),
(606, 'Qui similique.', '1564226752', 0, 606, 180, 105, 139),
(607, 'Consectetur dignissimos maiores.', '1564226752', 1, 607, 194, 130, 148),
(608, 'Rerum quisquam.', '1564226752', 0, 608, 97, 194, 177),
(609, 'Consequatur ut.', '1564226752', 1, 609, 101, 125, 195),
(610, 'Cum qui dolore vel et et.', '1564226752', 0, 610, 62, 8, 3),
(611, 'Nihil aliquid.', '1564226752', 0, 611, 10, 57, 99),
(612, 'Corporis mollitia quasi.', '1564226752', 0, 612, 88, 203, 112),
(613, 'Est cupiditate tempora.', '1564226752', 1, 613, 27, 70, 7),
(614, 'Corporis odit.', '1564226752', 1, 614, 168, 201, 44),
(615, 'Excepturi aliquid.', '1564226752', 1, 615, 89, 27, 130),
(616, 'Ut hic occaecati nihil.', '1564226752', 1, 616, 50, 57, 12),
(617, 'Quae voluptas expedita quisquam consequatur.', '1564226752', 0, 617, 48, 140, 187),
(618, 'Consequatur pariatur est.', '1564226752', 1, 618, 206, 176, 30),
(619, 'Magnam sunt.', '1564226752', 0, 619, 155, 139, 71),
(620, 'Maiores laborum dolores.', '1564226752', 0, 620, 183, 110, 162),
(621, 'Omnis sint.', '1564226752', 0, 621, 83, 77, 49),
(622, 'Perferendis sit inventore nesciunt.', '1564226752', 0, 622, 49, 159, 155),
(623, 'In qui amet.', '1564226752', 1, 623, 167, 54, 62),
(624, 'Labore quisquam voluptas perferendis.', '1564226752', 1, 624, 114, 62, 114),
(625, 'Ducimus dolores.', '1564226752', 0, 625, 152, 61, 6),
(626, 'Aut reprehenderit maiores laborum.', '1564226752', 0, 626, 173, 36, 156),
(627, 'Dolor facilis.', '1564226752', 0, 627, 49, 118, 161),
(628, 'Inventore sequi adipisci.', '1564226752', 0, 628, 92, 192, 49),
(629, 'Autem quis.', '1564226752', 1, 629, 17, 95, 100),
(630, 'Excepturi.', '1564226752', 0, 630, 44, 25, 41),
(631, 'Suscipit quas eos.', '1564226752', 0, 631, 107, 11, 75),
(632, 'Recusandae officiis.', '1564226752', 1, 632, 79, 179, 123),
(633, 'Quam.', '1564226752', 1, 633, 52, 169, 117),
(634, 'Minima aliquid nulla nesciunt.', '1564226752', 1, 634, 44, 77, 20),
(635, 'Est harum voluptatem soluta.', '1564226752', 0, 635, 61, 181, 5),
(636, 'Accusamus et maiores.', '1564226752', 0, 636, 10, 121, 160),
(637, 'Aut voluptatem.', '1564226752', 0, 637, 35, 53, 58),
(638, 'Hic.', '1564226752', 0, 638, 15, 104, 179),
(639, 'Perspiciatis quod.', '1564226752', 1, 639, 65, 198, 175),
(640, 'Voluptas minus eligendi.', '1564226752', 0, 640, 186, 173, 72),
(641, 'Aut impedit rem.', '1564226752', 1, 641, 110, 78, 104),
(642, 'Amet velit.', '1564226752', 1, 642, 39, 177, 104),
(643, 'Et possimus.', '1564226752', 0, 643, 199, 125, 177),
(644, 'Laborum voluptatem excepturi et optio.', '1564226752', 0, 644, 184, 180, 41),
(645, 'Non ea.', '1564226752', 0, 645, 11, 86, 60),
(646, 'Quos molestias suscipit cumque et.', '1564226753', 1, 646, 162, 2, 173),
(647, 'Saepe facilis voluptatem.', '1564226753', 1, 647, 148, 88, 103),
(648, 'Explicabo repellendus et.', '1564226753', 1, 648, 125, 70, 10),
(649, 'Facilis quia excepturi sit.', '1564226753', 0, 649, 23, 186, 71),
(650, 'Sed tenetur nesciunt porro quia.', '1564226753', 1, 650, 199, 37, 88),
(651, 'Nisi inventore asperiores.', '1564226753', 0, 651, 111, 55, 120),
(652, 'Aperiam voluptatem optio molestiae voluptatem.', '1564226753', 1, 652, 85, 183, 94),
(653, 'Harum iusto saepe laudantium deleniti in.', '1564226753', 0, 653, 60, 105, 49),
(654, 'Voluptatem nostrum nostrum quis.', '1564226753', 0, 654, 73, 30, 200),
(655, 'Aut.', '1564226753', 0, 655, 103, 45, 10),
(656, 'Inventore aut odit quae consequatur.', '1564226753', 0, 656, 26, 137, 199),
(657, 'Velit.', '1564226753', 1, 657, 135, 43, 82),
(658, 'Animi ea culpa.', '1564226753', 1, 658, 35, 169, 95),
(659, 'Facilis eum.', '1564226753', 0, 659, 174, 121, 128),
(660, 'Quisquam commodi aperiam nam.', '1564226753', 0, 660, 146, 195, 12),
(661, 'Eius cupiditate nulla.', '1564226753', 1, 661, 102, 167, 176),
(662, 'A atque.', '1564226753', 1, 662, 32, 64, 39),
(663, 'Corrupti voluptas laudantium.', '1564226753', 1, 663, 165, 136, 105),
(664, 'Reprehenderit qui.', '1564226753', 1, 664, 184, 55, 69),
(665, 'Praesentium.', '1564226753', 0, 665, 58, 46, 99),
(666, 'Omnis soluta fugit excepturi et qui.', '1564226753', 1, 666, 61, 96, 72),
(667, 'Quia optio amet aspernatur.', '1564226753', 1, 667, 143, 67, 76),
(668, 'Veniam voluptatem dolorem in quod.', '1564226753', 1, 668, 159, 73, 144),
(669, 'Animi et.', '1564226753', 0, 669, 201, 123, 143),
(670, 'Dicta autem ullam quia.', '1564226753', 1, 670, 20, 96, 200),
(671, 'Ipsum doloremque.', '1564226753', 1, 671, 161, 84, 22),
(672, 'Qui cupiditate.', '1564226753', 1, 672, 12, 22, 66),
(673, 'Occaecati architecto.', '1564226753', 1, 673, 112, 86, 12),
(674, 'Ipsam deleniti dolorem.', '1564226753', 0, 674, 148, 58, 142),
(675, 'Alias vel sed expedita.', '1564226753', 0, 675, 8, 196, 7),
(676, 'Vel est rem enim.', '1564226753', 1, 676, 14, 16, 190),
(677, 'Vitae quam sed.', '1564226753', 0, 677, 149, 88, 23),
(678, 'Officia non.', '1564226753', 1, 678, 143, 92, 40),
(679, 'Perspiciatis qui dolorem dolore.', '1564226753', 0, 679, 97, 128, 112),
(680, 'Omnis ut.', '1564226753', 1, 680, 108, 194, 175),
(681, 'Quos vero.', '1564226753', 0, 681, 81, 28, 176),
(682, 'Sed saepe culpa sit.', '1564226753', 0, 682, 92, 182, 192),
(683, 'Totam sit aliquam voluptas et.', '1564226753', 1, 683, 92, 4, 113),
(684, 'Minus aut laboriosam.', '1564226753', 1, 684, 83, 188, 73),
(685, 'Qui.', '1564226753', 0, 685, 135, 84, 115),
(686, 'Id eos id.', '1564226753', 1, 686, 158, 27, 41),
(687, 'Et veniam sit.', '1564226753', 1, 687, 48, 109, 192),
(688, 'Laboriosam suscipit.', '1564226753', 1, 688, 180, 104, 203),
(689, 'Molestias possimus repellendus.', '1564226753', 0, 689, 119, 57, 132),
(690, 'Perspiciatis voluptatibus.', '1564226753', 1, 690, 188, 157, 139),
(691, 'Tempora aut esse.', '1564226753', 0, 691, 68, 171, 171),
(692, 'Voluptatem ex accusantium.', '1564226753', 0, 692, 148, 26, 2),
(693, 'Laboriosam repellat et et amet sit.', '1564226753', 0, 693, 33, 189, 87),
(694, 'Quia placeat porro iusto sed.', '1564226753', 0, 694, 72, 38, 22),
(695, 'Est quo maxime ea.', '1564226753', 1, 695, 53, 187, 144),
(696, 'Et illo.', '1564226753', 0, 696, 40, 51, 14),
(697, 'Rerum quo itaque aut.', '1564226754', 0, 697, 95, 129, 161),
(698, 'Vel non asperiores cum.', '1564226754', 1, 698, 148, 23, 131),
(699, 'Dolorem expedita illo voluptas.', '1564226754', 0, 699, 65, 27, 153),
(700, 'In necessitatibus ut perspiciatis.', '1564226754', 1, 700, 106, 143, 195),
(701, 'Nihil quo omnis qui officiis.', '1564226754', 1, 701, 43, 75, 14),
(702, 'Iste mollitia.', '1564226754', 1, 702, 50, 137, 46),
(703, 'Nemo ut magnam sint.', '1564226754', 0, 703, 176, 160, 83),
(704, 'Totam porro.', '1564226754', 0, 704, 54, 127, 136),
(705, 'Maxime.', '1564226754', 0, 705, 53, 205, 180),
(706, 'Et et.', '1564226754', 0, 706, 137, 25, 87),
(707, 'Ea repudiandae fuga quo magni.', '1564226754', 0, 707, 2, 117, 104),
(708, 'Expedita aut.', '1564226754', 1, 708, 53, 42, 161),
(709, 'Qui rerum.', '1564226754', 0, 709, 84, 199, 172),
(710, 'Ducimus mollitia.', '1564226754', 0, 710, 205, 42, 140),
(711, 'Consequuntur esse aperiam.', '1564226754', 1, 711, 185, 51, 161),
(712, 'Sed asperiores.', '1564226754', 1, 712, 95, 177, 91),
(713, 'Incidunt quasi similique.', '1564226754', 1, 713, 204, 11, 141),
(714, 'Maiores blanditiis.', '1564226754', 1, 714, 173, 6, 170),
(715, 'Quod.', '1564226754', 0, 715, 71, 205, 97),
(716, 'Voluptas consectetur ut.', '1564226754', 1, 716, 109, 78, 192),
(717, 'Aliquid eligendi ab nostrum.', '1564226754', 0, 717, 127, 9, 50),
(718, 'Voluptas eaque eum.', '1564226754', 1, 718, 149, 29, 174),
(719, 'Odit similique repellat.', '1564226754', 0, 719, 127, 48, 63),
(720, 'Nihil.', '1564226754', 1, 720, 129, 158, 89),
(721, 'Excepturi distinctio delectus.', '1564226754', 0, 721, 3, 15, 26),
(722, 'Aut ea amet.', '1564226754', 0, 722, 81, 193, 187),
(723, 'Voluptate.', '1564226754', 0, 723, 73, 142, 56),
(724, 'Quas nostrum omnis.', '1564226754', 0, 724, 2, 196, 5),
(725, 'Voluptas quia illum.', '1564226754', 1, 725, 53, 191, 148),
(726, 'Quam.', '1564226754', 0, 726, 196, 129, 139),
(727, 'Voluptates velit.', '1564226755', 1, 727, 147, 175, 158),
(728, 'Cumque velit sit quasi.', '1564226755', 0, 728, 104, 15, 58),
(729, 'Dolorum ipsa aut rerum.', '1564226755', 0, 729, 110, 206, 84),
(730, 'Impedit.', '1564226755', 0, 730, 171, 188, 153),
(731, 'Enim ea voluptatem.', '1564226755', 0, 731, 162, 131, 28),
(732, 'Enim quasi et occaecati.', '1564226755', 1, 732, 25, 57, 80),
(733, 'Consequatur ad assumenda.', '1564226755', 0, 733, 50, 57, 119),
(734, 'Rerum eos voluptas libero.', '1564226755', 1, 734, 72, 50, 42),
(735, 'Nulla atque repellat.', '1564226755', 0, 735, 113, 195, 49),
(736, 'Molestiae.', '1564226755', 0, 736, 5, 6, 114),
(737, 'Vitae id eos earum.', '1564226755', 0, 737, 99, 170, 150),
(738, 'Nihil saepe laborum.', '1564226755', 1, 738, 136, 122, 67),
(739, 'Earum hic suscipit.', '1564226755', 0, 739, 82, 163, 167),
(740, 'Quaerat occaecati dolorum.', '1564226755', 1, 740, 72, 22, 206),
(741, 'Rerum deserunt non fugiat est doloribus.', '1564226755', 1, 741, 26, 58, 163),
(742, 'Qui culpa.', '1564226755', 1, 742, 191, 164, 22),
(743, 'Autem accusamus.', '1564226755', 1, 743, 111, 120, 35),
(744, 'Dolores quasi odit inventore vitae.', '1564226755', 0, 744, 123, 122, 18),
(745, 'Vero temporibus dolore voluptatibus.', '1564226755', 0, 745, 3, 148, 119),
(746, 'Placeat cumque dolorum.', '1564226755', 0, 746, 30, 180, 58),
(747, 'Voluptas.', '1564226755', 0, 747, 92, 52, 20),
(748, 'Est modi voluptatum.', '1564226755', 1, 748, 13, 179, 98),
(749, 'Voluptatum natus.', '1564226755', 0, 749, 154, 19, 193),
(750, 'Aut non.', '1564226755', 0, 750, 178, 201, 130),
(751, 'Dolores nisi.', '1564226755', 1, 751, 90, 51, 31),
(752, 'Molestiae facere minima quam.', '1564226755', 0, 752, 177, 181, 126),
(753, 'Eveniet natus.', '1564226755', 1, 753, 121, 18, 151),
(754, 'Voluptas.', '1564226755', 0, 754, 163, 155, 190),
(755, 'Modi nam architecto.', '1564226755', 0, 755, 106, 125, 69),
(756, 'Iste recusandae sunt qui.', '1564226755', 0, 756, 65, 121, 65),
(757, 'Quo omnis.', '1564226755', 1, 757, 110, 155, 116),
(758, 'Unde dignissimos facere.', '1564226755', 0, 758, 124, 146, 60),
(759, 'Enim enim dolore.', '1564226755', 1, 759, 135, 57, 203),
(760, 'Tempore architecto laborum.', '1564226755', 0, 760, 42, 203, 127),
(761, 'Et et est quidem.', '1564226755', 1, 761, 167, 26, 82),
(762, 'Voluptates.', '1564226755', 0, 762, 165, 174, 51),
(763, 'Cumque omnis fugit asperiores.', '1564226755', 1, 763, 17, 121, 29),
(764, 'Odio enim vero praesentium est.', '1564226755', 0, 764, 105, 71, 28),
(765, 'Quia.', '1564226755', 1, 765, 157, 17, 23),
(766, 'Voluptas maxime fuga eveniet enim aliquid.', '1564226755', 1, 766, 187, 185, 153),
(767, 'Quas.', '1564226755', 1, 767, 181, 201, 14),
(768, 'Eligendi.', '1564226755', 0, 768, 23, 101, 67),
(769, 'Nisi facilis.', '1564226755', 0, 769, 43, 18, 22),
(770, 'Qui et laborum.', '1564226755', 1, 770, 58, 56, 167),
(771, 'Alias dolore et.', '1564226755', 0, 771, 115, 146, 125),
(772, 'Omnis corporis dolor sint.', '1564226755', 0, 772, 177, 180, 9),
(773, 'Est voluptatem porro eos a.', '1564226755', 0, 773, 9, 83, 22),
(774, 'Possimus tenetur in quisquam.', '1564226755', 1, 774, 74, 144, 113),
(775, 'Quisquam repudiandae modi quos.', '1564226755', 1, 775, 34, 126, 85),
(776, 'Id corporis.', '1564226755', 1, 776, 10, 169, 189);
INSERT INTO `messages` (`id`, `messageText`, `dateSent`, `enable_reply`, `messageId`, `userId`, `fromId`, `toId`) VALUES
(777, 'Distinctio consequatur ut tenetur.', '1564226755', 1, 777, 143, 158, 91),
(778, 'Voluptatem aut.', '1564226755', 1, 778, 16, 73, 71),
(779, 'Quis ut.', '1564226756', 0, 779, 50, 87, 160),
(780, 'Cumque aut.', '1564226756', 1, 780, 67, 173, 165),
(781, 'Possimus nobis consequatur.', '1564226756', 1, 781, 155, 177, 78),
(782, 'Iusto hic est officiis et.', '1564226756', 1, 782, 49, 133, 105),
(783, 'Autem.', '1564226756', 0, 783, 117, 40, 124),
(784, 'Fuga non.', '1564226756', 0, 784, 147, 206, 110),
(785, 'Ad rerum quae fugiat.', '1564226756', 0, 785, 70, 3, 137),
(786, 'Eveniet corrupti.', '1564226756', 0, 786, 189, 165, 34),
(787, 'Qui eum sed repellat quibusdam.', '1564226756', 0, 787, 129, 65, 80),
(788, 'Qui doloremque aliquid.', '1564226756', 1, 788, 103, 8, 149),
(789, 'Ea aspernatur.', '1564226756', 0, 789, 71, 63, 16),
(790, 'Suscipit et.', '1564226756', 0, 790, 147, 117, 183),
(791, 'Mollitia earum quam ducimus.', '1564226756', 0, 791, 117, 79, 21),
(792, 'Animi.', '1564226756', 1, 792, 106, 172, 51),
(793, 'Consequatur consequatur dolorum.', '1564226756', 0, 793, 129, 126, 15),
(794, 'Et quaerat ad.', '1564226756', 0, 794, 53, 157, 129),
(795, 'Nesciunt odit sint.', '1564226756', 0, 795, 61, 68, 8),
(796, 'Veritatis.', '1564226756', 1, 796, 80, 107, 183),
(797, 'Eos inventore.', '1564226756', 1, 797, 191, 73, 38),
(798, 'Ut.', '1564226756', 1, 798, 86, 152, 8),
(799, 'Sit consequatur.', '1564226756', 0, 799, 50, 181, 157),
(800, 'Rerum voluptas repellat.', '1564226756', 0, 800, 12, 10, 38),
(801, 'Pariatur atque at veritatis.', '1564226756', 1, 801, 155, 128, 149),
(802, 'Consequuntur aliquam ut.', '1564226756', 0, 802, 181, 200, 19),
(803, 'In qui laudantium recusandae.', '1564226756', 0, 803, 139, 51, 131),
(804, 'Itaque nesciunt ab.', '1564226756', 1, 804, 115, 42, 30),
(805, 'Provident distinctio placeat.', '1564226756', 1, 805, 41, 135, 125),
(806, 'Soluta non.', '1564226756', 0, 806, 46, 44, 205),
(807, 'Aut voluptatum.', '1564226756', 0, 807, 27, 141, 49),
(808, 'Iure.', '1564226756', 1, 808, 189, 155, 6),
(809, 'Optio asperiores ipsam enim.', '1564226756', 0, 809, 38, 193, 36),
(810, 'Tempore ut quod.', '1564226756', 0, 810, 20, 120, 21),
(811, 'Sed qui.', '1564226756', 1, 811, 23, 15, 82),
(812, 'Soluta quaerat ut.', '1564226756', 1, 812, 6, 153, 157),
(813, 'Eveniet illo.', '1564226756', 1, 813, 172, 52, 18),
(814, 'Earum sunt id quae.', '1564226756', 0, 814, 122, 37, 99),
(815, 'Expedita quidem possimus.', '1564226756', 0, 815, 78, 71, 26),
(816, 'Aut et et.', '1564226756', 1, 816, 113, 58, 58),
(817, 'Quia expedita et.', '1564226756', 0, 817, 97, 171, 120),
(818, 'Et ea hic.', '1564226756', 0, 818, 1, 176, 190),
(819, 'Non iusto enim.', '1564226756', 0, 819, 183, 187, 105),
(820, 'Aperiam qui et sapiente blanditiis.', '1564226756', 0, 820, 114, 77, 159),
(821, 'Repellendus corrupti autem.', '1564226756', 0, 821, 5, 129, 203),
(822, 'Voluptatum vel quibusdam.', '1564226756', 0, 822, 181, 22, 199),
(823, 'Voluptatem incidunt qui.', '1564226756', 1, 823, 104, 170, 71),
(824, 'Officia sunt.', '1564226756', 0, 824, 43, 152, 82),
(825, 'Repellat quia.', '1564226756', 1, 825, 47, 51, 119),
(826, 'Quia.', '1564226756', 0, 826, 4, 92, 177),
(827, 'Vel similique.', '1564226756', 1, 827, 201, 132, 116),
(828, 'Autem consequuntur est laborum unde.', '1564226756', 0, 828, 37, 4, 176),
(829, 'Quos explicabo doloremque.', '1564226756', 1, 829, 106, 142, 31),
(830, 'Velit rerum laborum dicta.', '1564226756', 1, 830, 5, 166, 97),
(831, 'Temporibus.', '1564226756', 1, 831, 107, 9, 98),
(832, 'Nobis modi assumenda voluptatibus.', '1564226756', 0, 832, 65, 111, 34),
(833, 'Rerum delectus aut qui.', '1564226756', 1, 833, 205, 189, 36),
(834, 'Ut quia neque.', '1564226756', 0, 834, 137, 150, 117),
(835, 'Nostrum.', '1564226756', 0, 835, 124, 61, 28),
(836, 'Aspernatur a.', '1564226756', 1, 836, 185, 81, 19),
(837, 'Dolorum quos voluptatem.', '1564226756', 1, 837, 110, 85, 27),
(838, 'Qui quia ad.', '1564226756', 1, 838, 27, 155, 87),
(839, 'Distinctio consequatur.', '1564226756', 0, 839, 128, 78, 10),
(840, 'Rem iusto debitis necessitatibus atque.', '1564226756', 0, 840, 81, 14, 38),
(841, 'Voluptatem velit pariatur aut odit.', '1564226756', 1, 841, 150, 172, 183),
(842, 'Nostrum vel.', '1564226756', 0, 842, 20, 74, 64),
(843, 'Voluptatibus quo similique.', '1564226756', 0, 843, 104, 193, 134),
(844, 'Numquam voluptate est.', '1564226756', 1, 844, 103, 11, 24),
(845, 'Perferendis sit.', '1564226756', 0, 845, 3, 124, 31),
(846, 'Dolore est et fugit.', '1564226756', 0, 846, 137, 144, 15),
(847, 'Distinctio et.', '1564226756', 1, 847, 157, 19, 63),
(848, 'Qui voluptas vero laboriosam.', '1564226756', 0, 848, 42, 131, 201),
(849, 'Nulla vel ut.', '1564226756', 0, 849, 77, 132, 29),
(850, 'Dolorem ipsum porro tempora.', '1564226756', 1, 850, 125, 28, 7),
(851, 'Ut ad vel.', '1564226757', 1, 851, 25, 50, 57),
(852, 'Eos non qui voluptatem.', '1564226757', 0, 852, 126, 33, 53),
(853, 'Necessitatibus et.', '1564226757', 1, 853, 156, 194, 8),
(854, 'Modi omnis.', '1564226757', 0, 854, 151, 93, 171),
(855, 'Debitis accusantium.', '1564226757', 1, 855, 175, 184, 34),
(856, 'Ea aliquid est enim.', '1564226757', 0, 856, 198, 80, 25),
(857, 'Adipisci aliquid placeat eos.', '1564226757', 1, 857, 201, 175, 206),
(858, 'Quae omnis quas.', '1564226757', 0, 858, 116, 119, 150),
(859, 'Dignissimos eos fugiat ipsum.', '1564226757', 1, 859, 8, 206, 50),
(860, 'Et.', '1564226757', 1, 860, 138, 194, 43),
(861, 'Ad doloribus.', '1564226757', 1, 861, 35, 111, 169),
(862, 'Facere et provident nihil.', '1564226757', 0, 862, 81, 72, 120),
(863, 'Voluptas magni.', '1564226757', 0, 863, 73, 66, 177),
(864, 'Et sed.', '1564226757', 0, 864, 182, 198, 12),
(865, 'Ea culpa.', '1564226757', 1, 865, 100, 84, 139),
(866, 'Blanditiis.', '1564226757', 0, 866, 32, 42, 53),
(867, 'Aliquid natus mollitia.', '1564226757', 0, 867, 164, 28, 42),
(868, 'Amet.', '1564226757', 0, 868, 130, 15, 55),
(869, 'Dolorem ducimus non consequatur tempore.', '1564226757', 1, 869, 125, 76, 106),
(870, 'Quos et quo.', '1564226757', 0, 870, 32, 203, 38),
(871, 'Ea laudantium et perferendis.', '1564226757', 0, 871, 130, 34, 90),
(872, 'Consequatur sint molestiae dolorem.', '1564226757', 0, 872, 196, 51, 46),
(873, 'Quibusdam accusamus.', '1564226757', 1, 873, 161, 128, 97),
(874, 'Asperiores.', '1564226757', 0, 874, 124, 33, 135),
(875, 'Magnam minus et.', '1564226757', 1, 875, 35, 206, 175),
(876, 'Optio labore et et neque.', '1564226757', 1, 876, 12, 64, 196),
(877, 'A amet.', '1564226757', 0, 877, 132, 157, 101),
(878, 'Et soluta in nesciunt beatae voluptas.', '1564226757', 0, 878, 156, 61, 133),
(879, 'Tempore reiciendis omnis.', '1564226757', 0, 879, 196, 68, 20),
(880, 'Autem tenetur eius.', '1564226757', 1, 880, 62, 32, 200),
(881, 'Debitis illum.', '1564226757', 0, 881, 143, 113, 205),
(882, 'Et vero exercitationem.', '1564226757', 0, 882, 157, 47, 1),
(883, 'Excepturi quam labore minus illum.', '1564226757', 1, 883, 109, 53, 117),
(884, 'Commodi optio maxime.', '1564226757', 1, 884, 34, 122, 183),
(885, 'Eum pariatur.', '1564226757', 1, 885, 75, 1, 32),
(886, 'In.', '1564226757', 1, 886, 150, 126, 112),
(887, 'Et exercitationem et.', '1564226757', 1, 887, 88, 163, 167),
(888, 'Autem molestiae cum voluptatum.', '1564226757', 1, 888, 125, 88, 105),
(889, 'Velit impedit.', '1564226757', 1, 889, 68, 128, 18),
(890, 'Dolor praesentium quisquam.', '1564226757', 0, 890, 70, 86, 153),
(891, 'Est culpa et.', '1564226757', 0, 891, 99, 70, 175),
(892, 'Delectus eligendi.', '1564226757', 0, 892, 40, 181, 143),
(893, 'Et consequuntur voluptates.', '1564226757', 0, 893, 47, 99, 48),
(894, 'Aut eaque sit.', '1564226757', 1, 894, 4, 66, 149),
(895, 'Nesciunt tempora unde et libero.', '1564226757', 0, 895, 185, 150, 58),
(896, 'Facilis hic quos minus.', '1564226757', 1, 896, 130, 164, 32),
(897, 'Voluptatibus fugiat accusantium vel.', '1564226757', 1, 897, 184, 33, 191),
(898, 'Nesciunt quia recusandae porro.', '1564226757', 1, 898, 82, 117, 109),
(899, 'Eius quo dolores.', '1564226757', 0, 899, 99, 99, 25),
(900, 'Et doloremque.', '1564226757', 0, 900, 72, 141, 67),
(901, 'Sit saepe totam nulla.', '1564226757', 1, 901, 184, 160, 111),
(902, 'Rerum est consequuntur porro enim.', '1564226757', 1, 902, 196, 149, 37),
(903, 'Ut optio.', '1564226757', 1, 903, 99, 114, 161),
(904, 'Qui omnis.', '1564226757', 1, 904, 94, 52, 19),
(905, 'Quo et quia fugit tenetur.', '1564226757', 0, 905, 182, 44, 82),
(906, 'Repellat dolores dolores.', '1564226757', 0, 906, 17, 20, 192),
(907, 'Ut maiores quae.', '1564226757', 1, 907, 33, 119, 38),
(908, 'Maiores vel reprehenderit minima dolorum.', '1564226757', 0, 908, 125, 145, 81),
(909, 'Vel accusantium praesentium excepturi.', '1564226757', 1, 909, 103, 117, 204),
(910, 'In omnis inventore nihil ut.', '1564226757', 0, 910, 119, 100, 115),
(911, 'Reprehenderit alias sed.', '1564226757', 0, 911, 57, 125, 65),
(912, 'Alias et tenetur inventore.', '1564226757', 1, 912, 72, 158, 103),
(913, 'Fugiat ea.', '1564226757', 0, 913, 70, 98, 185),
(914, 'Temporibus earum molestias.', '1564226757', 0, 914, 192, 126, 168),
(915, 'Laborum qui qui non.', '1564226757', 1, 915, 107, 148, 152),
(916, 'Eligendi voluptatem.', '1564226757', 1, 916, 125, 50, 8),
(917, 'A velit.', '1564226757', 0, 917, 155, 4, 125),
(918, 'Est deserunt.', '1564226757', 1, 918, 150, 158, 201),
(919, 'Sed perspiciatis magnam.', '1564226757', 1, 919, 4, 92, 116),
(920, 'Corporis error.', '1564226757', 0, 920, 127, 45, 204),
(921, 'Vel iusto.', '1564226757', 1, 921, 147, 188, 158),
(922, 'Harum quis quas aliquam.', '1564226757', 0, 922, 131, 77, 184),
(923, 'Et eius.', '1564226757', 0, 923, 154, 189, 190),
(924, 'Rerum.', '1564226757', 0, 924, 14, 65, 182),
(925, 'Suscipit facere similique.', '1564226757', 0, 925, 198, 115, 185),
(926, 'Corrupti sed molestias aut.', '1564226758', 1, 926, 206, 82, 115),
(927, 'Ducimus laborum.', '1564226758', 0, 927, 28, 86, 56),
(928, 'Laboriosam velit perferendis ut.', '1564226758', 1, 928, 116, 159, 121),
(929, 'Ipsam culpa numquam quo iste.', '1564226758', 0, 929, 97, 203, 148),
(930, 'Est repellat necessitatibus.', '1564226758', 0, 930, 72, 38, 24),
(931, 'Quod temporibus impedit vitae impedit.', '1564226758', 0, 931, 104, 203, 50),
(932, 'Dolore porro laudantium.', '1564226758', 0, 932, 147, 128, 144),
(933, 'Sed est consectetur.', '1564226758', 1, 933, 61, 131, 179),
(934, 'Dolor voluptatibus et.', '1564226758', 0, 934, 79, 68, 155),
(935, 'Vel doloribus.', '1564226758', 0, 935, 174, 61, 127),
(936, 'Sed delectus voluptatibus voluptatibus.', '1564226758', 1, 936, 11, 91, 142),
(937, 'Ut.', '1564226758', 0, 937, 143, 198, 102),
(938, 'In odit officiis eos aut.', '1564226758', 1, 938, 5, 24, 105),
(939, 'Labore molestiae voluptas omnis.', '1564226758', 0, 939, 25, 197, 14),
(940, 'Incidunt et quis ut.', '1564226758', 0, 940, 100, 180, 89),
(941, 'Et ut.', '1564226758', 0, 941, 5, 80, 198),
(942, 'Ad.', '1564226758', 0, 942, 14, 191, 4),
(943, 'Officia rerum repellat ipsa corrupti.', '1564226758', 0, 943, 120, 179, 44),
(944, 'Perferendis et.', '1564226758', 1, 944, 180, 45, 175),
(945, 'Dolorum soluta vel ea similique.', '1564226758', 1, 945, 36, 67, 182),
(946, 'Totam.', '1564226758', 1, 946, 50, 34, 94),
(947, 'At.', '1564226758', 0, 947, 70, 115, 69),
(948, 'Est et qui qui.', '1564226758', 1, 948, 121, 75, 94),
(949, 'Qui id dolor.', '1564226758', 1, 949, 166, 104, 148),
(950, 'Laborum voluptas dolor.', '1564226758', 1, 950, 83, 163, 40),
(951, 'Consectetur ut nesciunt.', '1564226758', 1, 951, 7, 28, 21),
(952, 'Sunt ratione natus.', '1564226758', 0, 952, 46, 6, 203),
(953, 'Ipsum quisquam.', '1564226758', 1, 953, 181, 26, 152),
(954, 'Eos deserunt.', '1564226758', 0, 954, 166, 110, 87),
(955, 'Quod autem quas sunt.', '1564226758', 0, 955, 110, 139, 48),
(956, 'Omnis repellendus.', '1564226758', 0, 956, 75, 127, 143),
(957, 'Hic minima voluptatibus porro.', '1564226758', 0, 957, 4, 129, 95),
(958, 'Aut.', '1564226758', 0, 958, 144, 58, 94),
(959, 'Quo quia fugiat quia.', '1564226758', 1, 959, 51, 89, 28),
(960, 'Officiis laboriosam.', '1564226758', 1, 960, 115, 11, 172),
(961, 'Nemo.', '1564226758', 0, 961, 199, 73, 21),
(962, 'Ad modi.', '1564226758', 0, 962, 186, 24, 184),
(963, 'Est iusto.', '1564226758', 1, 963, 159, 101, 198),
(964, 'In.', '1564226758', 1, 964, 99, 7, 2),
(965, 'Nemo a.', '1564226758', 1, 965, 150, 56, 186),
(966, 'Vel saepe alias.', '1564226758', 1, 966, 156, 94, 41),
(967, 'Facilis consequatur officiis nulla.', '1564226758', 1, 967, 75, 37, 91),
(968, 'Enim veritatis.', '1564226758', 0, 968, 13, 185, 56),
(969, 'Voluptatem unde fugit eos consequatur.', '1564226758', 1, 969, 20, 112, 28),
(970, 'Cum voluptas excepturi.', '1564226758', 1, 970, 122, 203, 57),
(971, 'Excepturi distinctio voluptatem et.', '1564226758', 1, 971, 121, 94, 68),
(972, 'Necessitatibus necessitatibus ut.', '1564226758', 0, 972, 12, 60, 42),
(973, 'Nesciunt itaque dicta.', '1564226758', 1, 973, 170, 110, 121),
(974, 'Asperiores amet.', '1564226758', 0, 974, 12, 62, 54),
(975, 'Occaecati sequi dolores ut.', '1564226758', 1, 975, 17, 200, 2),
(976, 'Quisquam mollitia ratione cupiditate quis.', '1564226758', 0, 976, 16, 157, 102),
(977, 'Itaque quibusdam mollitia soluta est aut.', '1564226758', 0, 977, 6, 115, 195),
(978, 'Tempora deleniti rerum omnis facere.', '1564226758', 1, 978, 196, 86, 109),
(979, 'Culpa autem.', '1564226758', 0, 979, 9, 84, 10),
(980, 'Quia quasi.', '1564226758', 0, 980, 124, 125, 94),
(981, 'Quia ex nobis sapiente.', '1564226758', 1, 981, 133, 182, 7),
(982, 'Eaque eaque doloribus omnis alias assumenda.', '1564226758', 1, 982, 74, 40, 149),
(983, 'Similique esse excepturi rem deleniti consectetur.', '1564226759', 0, 983, 155, 130, 61),
(984, 'Nesciunt quibusdam dolorem dolor.', '1564226759', 0, 984, 87, 50, 25),
(985, 'Neque ipsum laboriosam.', '1564226759', 1, 985, 76, 130, 74),
(986, 'Iusto ducimus neque ut.', '1564226759', 0, 986, 112, 123, 168),
(987, 'Error quia fugiat perspiciatis.', '1564226759', 1, 987, 35, 92, 142),
(988, 'Maiores quia aut.', '1564226759', 1, 988, 96, 35, 67),
(989, 'Dolorem commodi eaque.', '1564226759', 1, 989, 139, 69, 205),
(990, 'Rem dolorum.', '1564226759', 0, 990, 145, 90, 201),
(991, 'Nulla consequatur.', '1564226759', 0, 991, 152, 98, 166),
(992, 'Sequi.', '1564226759', 1, 992, 93, 168, 160),
(993, 'Iusto.', '1564226759', 1, 993, 174, 60, 130),
(994, 'Sapiente laborum qui ad et delectus.', '1564226759', 0, 994, 178, 206, 107),
(995, 'Quis magni in ratione doloremque exercitationem.', '1564226759', 1, 995, 52, 185, 166),
(996, 'Expedita sit incidunt amet iure.', '1564226759', 1, 996, 130, 192, 9),
(997, 'Est est eum.', '1564226759', 1, 997, 135, 44, 2),
(998, 'Repudiandae in eos.', '1564226759', 1, 998, 108, 74, 142),
(999, 'Mollitia quis.', '1564226759', 1, 999, 10, 70, 201),
(1000, 'Natus id incidunt maxime aut est.', '1564226759', 0, 1000, 29, 53, 78),
(1002, '111', '1564228060', 0, 1002, 156, 1, 156),
(1004, '111', '1564228060', 0, 882, 157, 1, 157),
(1006, '111', '1564228060', 0, 1005, 158, 1, 158),
(1008, '111', '1564228060', 0, 1007, 159, 1, 159),
(1010, '111', '1564228060', 0, 1009, 160, 1, 160),
(1012, '111', '1564228060', 0, 1011, 161, 1, 161),
(1014, '111', '1564228060', 0, 1013, 162, 1, 162),
(1016, '111', '1564228060', 0, 1015, 163, 1, 163),
(1018, '111', '1564228060', 0, 1017, 164, 1, 164),
(1020, '111', '1564228060', 0, 1019, 165, 1, 165),
(1022, '111', '1564228060', 0, 1021, 166, 1, 166),
(1024, '111', '1564228060', 0, 1023, 167, 1, 167),
(1026, '111', '1564228060', 0, 1025, 168, 1, 168),
(1028, '111', '1564228060', 0, 1027, 169, 1, 169),
(1030, '111', '1564228061', 0, 1029, 170, 1, 170),
(1032, '111', '1564228061', 0, 1031, 171, 1, 171),
(1034, '111', '1564228061', 0, 443, 172, 1, 172),
(1036, '111', '1564228061', 0, 1034, 173, 1, 173),
(1038, '111', '1564228061', 0, 1036, 174, 1, 174),
(1040, '111', '1564228061', 0, 1038, 175, 1, 175),
(1042, '111', '1564228061', 0, 1040, 176, 1, 176),
(1044, '111', '1564228061', 0, 1042, 177, 1, 177),
(1046, '111', '1564228061', 0, 1044, 178, 1, 178),
(1048, '111', '1564228061', 0, 1046, 179, 1, 179),
(1050, '111', '1564228061', 0, 1048, 180, 1, 180),
(1052, '111', '1564228061', 0, 1050, 181, 1, 181),
(1054, '111', '1564228061', 0, 1052, 182, 1, 182),
(1056, '111', '1564228061', 0, 1054, 183, 1, 183),
(1058, '111', '1564228061', 0, 1056, 184, 1, 184),
(1060, '111', '1564228061', 0, 1058, 185, 1, 185),
(1062, '111', '1564228061', 0, 1060, 186, 1, 186),
(1064, '111', '1564228061', 0, 1062, 187, 1, 187),
(1066, '111', '1564228061', 0, 1064, 188, 1, 188),
(1068, '111', '1564228061', 0, 1066, 189, 1, 189),
(1070, '111', '1564228061', 0, 1067, 190, 1, 190),
(1072, '111', '1564228061', 0, 1069, 191, 1, 191),
(1074, '111', '1564228061', 0, 1071, 192, 1, 192),
(1076, '111', '1564228061', 0, 1073, 193, 1, 193),
(1078, '111', '1564228061', 0, 1075, 194, 1, 194),
(1080, '111', '1564228061', 0, 1077, 195, 1, 195),
(1082, '111', '1564228061', 0, 1079, 196, 1, 196),
(1084, '111', '1564228061', 0, 1081, 197, 1, 197),
(1086, '111', '1564228061', 0, 1083, 198, 1, 198),
(1088, '111', '1564228061', 0, 1085, 199, 1, 199),
(1090, '111', '1564228061', 0, 1087, 200, 1, 200),
(1092, '111', '1564228061', 0, 1089, 201, 1, 201),
(1094, '111', '1564228061', 0, 1091, 202, 1, 202),
(1096, '111', '1564228061', 0, 1093, 203, 1, 203),
(1098, '111', '1564228061', 0, 1095, 204, 1, 204),
(1100, '111', '1564228061', 0, 1097, 205, 1, 205),
(1102, '111', '1564228061', 0, 1099, 206, 1, 206),
(1104, '111', '1564228062', 0, 1002, 156, 1, 156),
(1106, '111', '1564228062', 0, 882, 157, 1, 157),
(1108, '111', '1564228062', 0, 1005, 158, 1, 158),
(1110, '111', '1564228062', 0, 1007, 159, 1, 159),
(1112, '111', '1564228062', 0, 1009, 160, 1, 160),
(1114, '111', '1564228062', 0, 1011, 161, 1, 161),
(1116, '111', '1564228062', 0, 1013, 162, 1, 162),
(1118, '111', '1564228062', 0, 1015, 163, 1, 163),
(1120, '111', '1564228062', 0, 1017, 164, 1, 164),
(1122, '111', '1564228062', 0, 1019, 165, 1, 165),
(1124, '111', '1564228062', 0, 1021, 166, 1, 166),
(1126, '111', '1564228062', 0, 1023, 167, 1, 167),
(1128, '111', '1564228062', 0, 1025, 168, 1, 168),
(1130, '111', '1564228062', 0, 1027, 169, 1, 169),
(1132, '111', '1564228063', 0, 1029, 170, 1, 170),
(1134, '111', '1564228063', 0, 1031, 171, 1, 171),
(1136, '111', '1564228063', 0, 443, 172, 1, 172),
(1138, '111', '1564228063', 0, 1034, 173, 1, 173),
(1140, '111', '1564228063', 0, 1036, 174, 1, 174),
(1142, '111', '1564228063', 0, 1038, 175, 1, 175),
(1144, '111', '1564228063', 0, 1040, 176, 1, 176),
(1146, '111', '1564228063', 0, 1042, 177, 1, 177),
(1148, '111', '1564228063', 0, 1044, 178, 1, 178),
(1150, '111', '1564228063', 0, 1046, 179, 1, 179),
(1152, '111', '1564228063', 0, 1048, 180, 1, 180),
(1154, '111', '1564228063', 0, 1050, 181, 1, 181),
(1156, '111', '1564228063', 0, 1052, 182, 1, 182),
(1158, '111', '1564228063', 0, 1054, 183, 1, 183),
(1160, '111', '1564228063', 0, 1056, 184, 1, 184),
(1162, '111', '1564228063', 0, 1058, 185, 1, 185),
(1164, '111', '1564228063', 0, 1060, 186, 1, 186),
(1166, '111', '1564228064', 0, 1062, 187, 1, 187),
(1168, '111', '1564228064', 0, 1064, 188, 1, 188),
(1170, '111', '1564228064', 0, 1066, 189, 1, 189),
(1172, '111', '1564228064', 0, 1067, 190, 1, 190),
(1174, '111', '1564228064', 0, 1069, 191, 1, 191),
(1176, '111', '1564228064', 0, 1071, 192, 1, 192),
(1178, '111', '1564228064', 0, 1073, 193, 1, 193),
(1180, '111', '1564228064', 0, 1075, 194, 1, 194),
(1182, '111', '1564228064', 0, 1077, 195, 1, 195),
(1184, '111', '1564228064', 0, 1079, 196, 1, 196),
(1186, '111', '1564228064', 0, 1081, 197, 1, 197),
(1188, '111', '1564228065', 0, 1083, 198, 1, 198),
(1190, '111', '1564228065', 0, 1085, 199, 1, 199),
(1192, '111', '1564228065', 0, 1087, 200, 1, 200),
(1194, '111', '1564228065', 0, 1089, 201, 1, 201),
(1196, '111', '1564228065', 0, 1091, 202, 1, 202),
(1198, '111', '1564228065', 0, 1093, 203, 1, 203),
(1200, '111', '1564228065', 0, 1095, 204, 1, 204),
(1202, '111', '1564228065', 0, 1097, 205, 1, 205),
(1204, '111', '1564228065', 0, 1099, 206, 1, 206),
(1206, '111', '1564228065', 0, 1002, 156, 1, 156),
(1208, '111', '1564228065', 0, 882, 157, 1, 157),
(1210, '111', '1564228065', 0, 1005, 158, 1, 158),
(1212, '111', '1564228065', 0, 1007, 159, 1, 159),
(1214, '111', '1564228065', 0, 1009, 160, 1, 160),
(1216, '111', '1564228065', 0, 1011, 161, 1, 161),
(1218, '111', '1564228066', 0, 1013, 162, 1, 162),
(1220, '111', '1564228066', 0, 1015, 163, 1, 163),
(1222, '111', '1564228066', 0, 1017, 164, 1, 164),
(1224, '111', '1564228066', 0, 1019, 165, 1, 165),
(1226, '111', '1564228066', 0, 1021, 166, 1, 166),
(1228, '111', '1564228066', 0, 1023, 167, 1, 167),
(1230, '111', '1564228066', 0, 1025, 168, 1, 168),
(1232, '111', '1564228066', 0, 1027, 169, 1, 169),
(1234, '111', '1564228066', 0, 1029, 170, 1, 170),
(1236, '111', '1564228066', 0, 1031, 171, 1, 171),
(1238, '111', '1564228066', 0, 443, 172, 1, 172),
(1240, '111', '1564228066', 0, 1034, 173, 1, 173),
(1242, '111', '1564228066', 0, 1036, 174, 1, 174),
(1244, '111', '1564228066', 0, 1038, 175, 1, 175),
(1246, '111', '1564228066', 0, 1040, 176, 1, 176),
(1248, '111', '1564228066', 0, 1042, 177, 1, 177),
(1250, '111', '1564228066', 0, 1044, 178, 1, 178),
(1252, '111', '1564228067', 0, 1046, 179, 1, 179),
(1254, '111', '1564228067', 0, 1048, 180, 1, 180),
(1256, '111', '1564228067', 0, 1050, 181, 1, 181),
(1258, '111', '1564228067', 0, 1052, 182, 1, 182),
(1260, '111', '1564228067', 0, 1054, 183, 1, 183),
(1262, '111', '1564228067', 0, 1056, 184, 1, 184),
(1264, '111', '1564228067', 0, 1058, 185, 1, 185),
(1266, '111', '1564228067', 0, 1060, 186, 1, 186),
(1268, '111', '1564228067', 0, 1062, 187, 1, 187),
(1270, '111', '1564228067', 0, 1064, 188, 1, 188),
(1272, '111', '1564228067', 0, 1066, 189, 1, 189),
(1274, '111', '1564228067', 0, 1067, 190, 1, 190),
(1276, '111', '1564228068', 0, 1069, 191, 1, 191),
(1278, '111', '1564228068', 0, 1071, 192, 1, 192),
(1280, '111', '1564228068', 0, 1073, 193, 1, 193),
(1282, '111', '1564228068', 0, 1075, 194, 1, 194),
(1284, '111', '1564228068', 0, 1077, 195, 1, 195),
(1286, '111', '1564228068', 0, 1079, 196, 1, 196),
(1288, '111', '1564228068', 0, 1081, 197, 1, 197),
(1290, '111', '1564228068', 0, 1083, 198, 1, 198),
(1292, '111', '1564228068', 0, 1085, 199, 1, 199),
(1294, '111', '1564228068', 0, 1087, 200, 1, 200),
(1296, '111', '1564228068', 0, 1089, 201, 1, 201),
(1298, '111', '1564228068', 0, 1091, 202, 1, 202),
(1300, '111', '1564228068', 0, 1093, 203, 1, 203),
(1302, '111', '1564228068', 0, 1095, 204, 1, 204),
(1304, '111', '1564228069', 0, 1097, 205, 1, 205),
(1306, '111', '1564228069', 0, 1099, 206, 1, 206),
(1308, '111', '1564228069', 0, 1002, 156, 1, 156),
(1310, '111', '1564228069', 0, 882, 157, 1, 157),
(1312, '111', '1564228069', 0, 1005, 158, 1, 158),
(1314, '111', '1564228069', 0, 1007, 159, 1, 159),
(1316, '111', '1564228069', 0, 1009, 160, 1, 160),
(1318, '111', '1564228069', 0, 1011, 161, 1, 161),
(1320, '111', '1564228069', 0, 1013, 162, 1, 162),
(1322, '111', '1564228069', 0, 1015, 163, 1, 163),
(1324, '111', '1564228069', 0, 1017, 164, 1, 164),
(1326, '111', '1564228069', 0, 1019, 165, 1, 165),
(1328, '111', '1564228069', 0, 1021, 166, 1, 166),
(1330, '111', '1564228069', 0, 1023, 167, 1, 167),
(1332, '111', '1564228069', 0, 1025, 168, 1, 168),
(1334, '111', '1564228069', 0, 1027, 169, 1, 169),
(1336, '111', '1564228070', 0, 1029, 170, 1, 170),
(1338, '111', '1564228070', 0, 1031, 171, 1, 171),
(1340, '111', '1564228070', 0, 443, 172, 1, 172),
(1342, '111', '1564228070', 0, 1034, 173, 1, 173),
(1344, '111', '1564228070', 0, 1036, 174, 1, 174),
(1346, '111', '1564228070', 0, 1038, 175, 1, 175),
(1348, '111', '1564228070', 0, 1040, 176, 1, 176),
(1350, '111', '1564228070', 0, 1042, 177, 1, 177),
(1352, '111', '1564228070', 0, 1044, 178, 1, 178),
(1354, '111', '1564228070', 0, 1046, 179, 1, 179),
(1356, '111', '1564228070', 0, 1048, 180, 1, 180),
(1358, '111', '1564228070', 0, 1050, 181, 1, 181),
(1360, '111', '1564228070', 0, 1052, 182, 1, 182),
(1362, '111', '1564228070', 0, 1054, 183, 1, 183),
(1364, '111', '1564228071', 0, 1056, 184, 1, 184),
(1366, '111', '1564228071', 0, 1058, 185, 1, 185),
(1368, '111', '1564228071', 0, 1060, 186, 1, 186),
(1370, '111', '1564228071', 0, 1062, 187, 1, 187),
(1372, '111', '1564228071', 0, 1064, 188, 1, 188),
(1374, '111', '1564228071', 0, 1066, 189, 1, 189),
(1376, '111', '1564228071', 0, 1067, 190, 1, 190),
(1378, '111', '1564228071', 0, 1069, 191, 1, 191),
(1380, '111', '1564228071', 0, 1071, 192, 1, 192),
(1382, '111', '1564228071', 0, 1073, 193, 1, 193),
(1384, '111', '1564228071', 0, 1075, 194, 1, 194),
(1386, '111', '1564228071', 0, 1077, 195, 1, 195),
(1388, '111', '1564228071', 0, 1079, 196, 1, 196),
(1390, '111', '1564228072', 0, 1081, 197, 1, 197),
(1392, '111', '1564228072', 0, 1083, 198, 1, 198),
(1394, '111', '1564228072', 0, 1085, 199, 1, 199),
(1396, '111', '1564228072', 0, 1087, 200, 1, 200),
(1398, '111', '1564228072', 0, 1089, 201, 1, 201),
(1400, '111', '1564228072', 0, 1091, 202, 1, 202),
(1402, '111', '1564228072', 0, 1093, 203, 1, 203),
(1404, '111', '1564228072', 0, 1095, 204, 1, 204),
(1406, '111', '1564228072', 0, 1097, 205, 1, 205),
(1408, '111', '1564228072', 0, 1099, 206, 1, 206),
(1410, '111', '1564228072', 0, 1002, 156, 1, 156),
(1412, '111', '1564228072', 0, 882, 157, 1, 157),
(1414, '111', '1564228072', 0, 1005, 158, 1, 158),
(1416, '111', '1564228073', 0, 1007, 159, 1, 159),
(1418, '111', '1564228073', 0, 1009, 160, 1, 160),
(1420, '111', '1564228073', 0, 1011, 161, 1, 161),
(1422, '111', '1564228073', 0, 1013, 162, 1, 162),
(1424, '111', '1564228073', 0, 1015, 163, 1, 163),
(1426, '111', '1564228073', 0, 1017, 164, 1, 164),
(1428, '111', '1564228073', 0, 1019, 165, 1, 165),
(1430, '111', '1564228073', 0, 1021, 166, 1, 166),
(1432, '111', '1564228073', 0, 1023, 167, 1, 167),
(1434, '111', '1564228073', 0, 1025, 168, 1, 168),
(1436, '111', '1564228073', 0, 1027, 169, 1, 169),
(1438, '111', '1564228073', 0, 1029, 170, 1, 170),
(1440, '111', '1564228073', 0, 1031, 171, 1, 171),
(1442, '111', '1564228074', 0, 443, 172, 1, 172),
(1444, '111', '1564228074', 0, 1034, 173, 1, 173),
(1446, '111', '1564228074', 0, 1036, 174, 1, 174),
(1448, '111', '1564228074', 0, 1038, 175, 1, 175),
(1450, '111', '1564228074', 0, 1040, 176, 1, 176),
(1452, '111', '1564228074', 0, 1042, 177, 1, 177),
(1454, '111', '1564228074', 0, 1044, 178, 1, 178),
(1456, '111', '1564228074', 0, 1046, 179, 1, 179),
(1458, '111', '1564228074', 0, 1048, 180, 1, 180),
(1460, '111', '1564228074', 0, 1050, 181, 1, 181),
(1462, '111', '1564228074', 0, 1052, 182, 1, 182),
(1464, '111', '1564228075', 0, 1054, 183, 1, 183),
(1466, '111', '1564228075', 0, 1056, 184, 1, 184),
(1468, '111', '1564228075', 0, 1058, 185, 1, 185),
(1470, '111', '1564228075', 0, 1060, 186, 1, 186),
(1472, '111', '1564228075', 0, 1062, 187, 1, 187),
(1474, '111', '1564228075', 0, 1064, 188, 1, 188),
(1476, '111', '1564228075', 0, 1066, 189, 1, 189),
(1478, '111', '1564228075', 0, 1067, 190, 1, 190),
(1480, '111', '1564228075', 0, 1069, 191, 1, 191),
(1482, '111', '1564228075', 0, 1071, 192, 1, 192),
(1484, '111', '1564228075', 0, 1073, 193, 1, 193),
(1486, '111', '1564228075', 0, 1075, 194, 1, 194),
(1488, '111', '1564228075', 0, 1077, 195, 1, 195),
(1490, '111', '1564228075', 0, 1079, 196, 1, 196),
(1492, '111', '1564228075', 0, 1081, 197, 1, 197),
(1494, '111', '1564228075', 0, 1083, 198, 1, 198),
(1496, '111', '1564228075', 0, 1085, 199, 1, 199),
(1498, '111', '1564228076', 0, 1087, 200, 1, 200),
(1500, '111', '1564228076', 0, 1089, 201, 1, 201),
(1502, '111', '1564228076', 0, 1091, 202, 1, 202),
(1504, '111', '1564228076', 0, 1093, 203, 1, 203),
(1506, '111', '1564228076', 0, 1095, 204, 1, 204),
(1508, '111', '1564228076', 0, 1097, 205, 1, 205),
(1510, '111', '1564228076', 0, 1099, 206, 1, 206),
(1512, '111', '1564228076', 0, 1002, 156, 1, 156),
(1514, '111', '1564228076', 0, 882, 157, 1, 157),
(1516, '111', '1564228076', 0, 1005, 158, 1, 158),
(1518, '111', '1564228076', 0, 1007, 159, 1, 159),
(1520, '111', '1564228076', 0, 1009, 160, 1, 160),
(1522, '111', '1564228076', 0, 1011, 161, 1, 161),
(1524, '111', '1564228076', 0, 1013, 162, 1, 162),
(1526, '111', '1564228076', 0, 1015, 163, 1, 163),
(1528, '111', '1564228076', 0, 1017, 164, 1, 164),
(1530, '111', '1564228077', 0, 1019, 165, 1, 165),
(1532, '111', '1564228077', 0, 1021, 166, 1, 166),
(1534, '111', '1564228077', 0, 1023, 167, 1, 167),
(1536, '111', '1564228077', 0, 1025, 168, 1, 168),
(1538, '111', '1564228077', 0, 1027, 169, 1, 169),
(1540, '111', '1564228077', 0, 1029, 170, 1, 170),
(1542, '111', '1564228077', 0, 1031, 171, 1, 171),
(1544, '111', '1564228077', 0, 443, 172, 1, 172),
(1546, '111', '1564228077', 0, 1034, 173, 1, 173),
(1548, '111', '1564228077', 0, 1036, 174, 1, 174),
(1550, '111', '1564228077', 0, 1038, 175, 1, 175),
(1552, '111', '1564228077', 0, 1040, 176, 1, 176),
(1554, '111', '1564228077', 0, 1042, 177, 1, 177),
(1556, '111', '1564228077', 0, 1044, 178, 1, 178),
(1558, '111', '1564228077', 0, 1046, 179, 1, 179),
(1560, '111', '1564228077', 0, 1048, 180, 1, 180),
(1562, '111', '1564228077', 0, 1050, 181, 1, 181),
(1564, '111', '1564228077', 0, 1052, 182, 1, 182),
(1566, '111', '1564228077', 0, 1054, 183, 1, 183),
(1568, '111', '1564228077', 0, 1056, 184, 1, 184),
(1570, '111', '1564228077', 0, 1058, 185, 1, 185),
(1572, '111', '1564228077', 0, 1060, 186, 1, 186),
(1574, '111', '1564228077', 0, 1062, 187, 1, 187),
(1576, '111', '1564228077', 0, 1064, 188, 1, 188),
(1578, '111', '1564228078', 0, 1066, 189, 1, 189),
(1580, '111', '1564228078', 0, 1067, 190, 1, 190),
(1582, '111', '1564228078', 0, 1069, 191, 1, 191),
(1584, '111', '1564228078', 0, 1071, 192, 1, 192),
(1586, '111', '1564228078', 0, 1073, 193, 1, 193),
(1588, '111', '1564228078', 0, 1075, 194, 1, 194),
(1590, '111', '1564228078', 0, 1077, 195, 1, 195),
(1592, '111', '1564228078', 0, 1079, 196, 1, 196),
(1594, '111', '1564228078', 0, 1081, 197, 1, 197),
(1596, '111', '1564228078', 0, 1083, 198, 1, 198),
(1598, '111', '1564228078', 0, 1085, 199, 1, 199),
(1600, '111', '1564228078', 0, 1087, 200, 1, 200),
(1602, '111', '1564228078', 0, 1089, 201, 1, 201),
(1604, '111', '1564228078', 0, 1091, 202, 1, 202),
(1606, '111', '1564228078', 0, 1093, 203, 1, 203),
(1608, '111', '1564228078', 0, 1095, 204, 1, 204),
(1610, '111', '1564228078', 0, 1097, 205, 1, 205),
(1612, '111', '1564228078', 0, 1099, 206, 1, 206),
(1614, 'Hello all parents!!!', '1564228481', 0, 1066, 189, 1, 189),
(1616, 'Hello all parents!!!', '1564228481', 0, 1048, 180, 1, 180),
(1618, 'Test....', '1564228633', 0, 1009, 160, 1, 160),
(1620, 'Test....', '1564228633', 0, 1089, 201, 1, 201),
(1622, 'Test....', '1564228633', 0, 1099, 206, 1, 206),
(1624, 'Test....', '1564228633', 0, 1056, 184, 1, 184),
(1625, 'Hello parents', '1564228667', 0, 1106, 1, 1, 189),
(1626, 'Hello parents', '1564228667', 0, 1066, 189, 1, 189),
(1627, 'Hello parents', '1564228667', 0, 1107, 1, 1, 180),
(1628, 'Hello parents', '1564228667', 0, 1048, 180, 1, 180);

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
(1, 'Magnam aut.', '1564226742', 1, 1, 7, 25),
(2, 'Sint repellat voluptatem.', '1564226742', 0, 0, 76, 24),
(3, 'Architecto pariatur.', '1564226742', 0, 0, 163, 202),
(4, 'Ipsa.', '1564226742', 1, 1, 79, 161),
(5, 'Deleniti quos.', '1564226742', 0, 1, 206, 142),
(6, 'Nihil dolore.', '1564226742', 1, 0, 47, 60),
(7, 'Facilis et perspiciatis omnis.', '1564226742', 0, 0, 77, 146),
(8, 'Odit aspernatur.', '1564226742', 0, 0, 28, 199),
(9, 'Porro.', '1564226742', 1, 1, 98, 12),
(10, 'Illo neque qui.', '1564226742', 1, 0, 146, 106),
(11, 'Nulla tenetur rem velit.', '1564226742', 1, 1, 7, 4),
(12, 'Ea suscipit.', '1564226742', 1, 1, 154, 38),
(13, 'Cumque omnis hic.', '1564226742', 0, 1, 168, 137),
(14, 'Eaque ex inventore unde fuga.', '1564226742', 0, 1, 198, 176),
(15, 'Dicta.', '1564226742', 1, 0, 118, 86),
(16, 'Illum eius eos.', '1564226742', 0, 1, 24, 9),
(17, 'Fugiat et.', '1564226742', 1, 0, 137, 82),
(18, 'Nostrum enim.', '1564226742', 0, 0, 116, 188),
(19, 'Ipsum tempora possimus.', '1564226742', 0, 1, 91, 119),
(20, 'Repudiandae suscipit et molestiae velit.', '1564226742', 1, 0, 155, 66),
(21, 'Distinctio hic optio sunt.', '1564226742', 0, 1, 159, 4),
(22, 'Molestiae sit dignissimos.', '1564226742', 1, 1, 108, 160),
(23, 'Officiis iste at.', '1564226742', 1, 1, 71, 140),
(24, 'Laborum accusamus nihil adipisci explicabo harum.', '1564226742', 0, 0, 192, 160),
(25, 'Officiis enim corporis.', '1564226742', 1, 0, 199, 97),
(26, 'Ad aliquid placeat.', '1564226742', 1, 1, 196, 113),
(27, 'Voluptatem.', '1564226742', 0, 1, 123, 99),
(28, 'Neque quia.', '1564226742', 1, 1, 123, 30),
(29, 'Dolore qui ducimus.', '1564226742', 0, 1, 154, 97),
(30, 'Et in velit at.', '1564226742', 1, 1, 154, 176),
(31, 'Rerum assumenda dolores et nihil.', '1564226742', 1, 0, 34, 202),
(32, 'Quam blanditiis.', '1564226742', 1, 1, 57, 102),
(33, 'Quod.', '1564226742', 1, 0, 29, 171),
(34, 'Aut in.', '1564226742', 0, 0, 49, 57),
(35, 'Blanditiis omnis.', '1564226742', 1, 0, 137, 75),
(36, 'Quibusdam atque eos sint.', '1564226742', 1, 0, 69, 95),
(37, 'A dicta.', '1564226742', 0, 1, 194, 149),
(38, 'Id porro modi dolorum omnis.', '1564226742', 1, 0, 88, 204),
(39, 'Quos voluptatem.', '1564226742', 0, 0, 59, 52),
(40, 'Quia.', '1564226742', 0, 0, 3, 97),
(41, 'Error beatae iste rerum animi aliquam.', '1564226742', 1, 0, 17, 94),
(42, 'Provident.', '1564226742', 0, 1, 192, 133),
(43, 'Deserunt incidunt eos iure.', '1564226742', 1, 0, 140, 200),
(44, 'Voluptatum eveniet laborum.', '1564226742', 0, 0, 23, 41),
(45, 'Modi esse voluptatum.', '1564226742', 1, 1, 145, 184),
(46, 'Voluptas quis quia non.', '1564226742', 0, 0, 22, 189),
(47, 'Et.', '1564226742', 1, 0, 206, 27),
(48, 'Nisi voluptates eum sunt earum.', '1564226742', 0, 1, 131, 130),
(49, 'Possimus in.', '1564226742', 0, 0, 194, 178),
(50, 'A est a quos.', '1564226742', 1, 1, 161, 200),
(51, 'Aut eos vero.', '1564226742', 1, 1, 104, 56),
(52, 'Voluptatem voluptas.', '1564226742', 1, 0, 58, 87),
(53, 'Aut necessitatibus aut corporis.', '1564226742', 1, 1, 128, 162),
(54, 'Sunt architecto laborum.', '1564226742', 0, 1, 83, 133),
(55, 'Eum aut.', '1564226742', 0, 0, 124, 149),
(56, 'Enim corrupti.', '1564226742', 0, 0, 133, 60),
(57, 'Pariatur recusandae id fuga hic.', '1564226742', 1, 0, 87, 101),
(58, 'Dignissimos deserunt.', '1564226742', 0, 1, 203, 99),
(59, 'Consequuntur tempore neque porro voluptas.', '1564226742', 0, 0, 13, 164),
(60, 'Excepturi aut.', '1564226742', 1, 1, 189, 94),
(61, 'Voluptas odit ipsum nemo.', '1564226742', 1, 1, 156, 59),
(62, 'Exercitationem.', '1564226742', 1, 0, 191, 82),
(63, 'Quis excepturi quisquam repellendus.', '1564226742', 1, 0, 20, 99),
(64, 'Magni.', '1564226742', 0, 0, 6, 186),
(65, 'Ea.', '1564226742', 0, 0, 200, 178),
(66, 'Molestias est.', '1564226742', 0, 1, 182, 194),
(67, 'Doloribus inventore dolorem.', '1564226742', 1, 0, 197, 126),
(68, 'Et.', '1564226742', 1, 0, 21, 181),
(69, 'Sint qui accusantium.', '1564226742', 1, 0, 21, 167),
(70, 'Voluptatum provident quis qui.', '1564226742', 1, 0, 94, 9),
(71, 'Laboriosam voluptates eveniet est commodi.', '1564226743', 1, 1, 80, 98),
(72, 'Magnam.', '1564226743', 0, 0, 81, 78),
(73, 'Quia recusandae et consequatur.', '1564226743', 1, 1, 119, 97),
(74, 'Est dolorem cum.', '1564226743', 0, 1, 2, 65),
(75, 'Optio et corrupti.', '1564226743', 0, 1, 189, 11),
(76, 'Maxime est et.', '1564226743', 1, 1, 204, 182),
(77, 'Necessitatibus commodi dolorem.', '1564226743', 1, 1, 82, 144),
(78, 'Optio pariatur ullam.', '1564226743', 1, 1, 55, 49),
(79, 'Sapiente.', '1564226743', 0, 0, 91, 193),
(80, 'Nulla commodi esse.', '1564226743', 1, 0, 42, 203),
(81, 'Sed.', '1564226743', 0, 0, 96, 111),
(82, 'Quia.', '1564226743', 0, 0, 138, 97),
(83, 'Harum molestiae molestiae qui.', '1564226743', 1, 0, 138, 145),
(84, 'Quia reiciendis nihil nostrum.', '1564226743', 0, 0, 133, 184),
(85, 'Ipsum ex.', '1564226743', 0, 0, 123, 148),
(86, 'Dolore unde sint quis.', '1564226743', 1, 0, 164, 49),
(87, 'Cumque sit totam numquam.', '1564226743', 1, 1, 87, 191),
(88, 'Cumque ratione.', '1564226743', 0, 0, 6, 169),
(89, 'Ut eaque placeat.', '1564226743', 0, 0, 26, 160),
(90, 'Fuga vel in.', '1564226743', 0, 0, 181, 66),
(91, 'Modi dolorum consequuntur quia.', '1564226743', 0, 0, 179, 204),
(92, 'Explicabo laudantium voluptatem.', '1564226743', 0, 1, 203, 72),
(93, 'Beatae.', '1564226743', 0, 0, 77, 67),
(94, 'Vel quia excepturi quibusdam et ut.', '1564226743', 0, 0, 156, 47),
(95, 'Adipisci repudiandae.', '1564226743', 1, 1, 78, 121),
(96, 'Quia minus quidem.', '1564226743', 1, 1, 203, 50),
(97, 'Harum quod qui nam.', '1564226743', 0, 1, 153, 194),
(98, 'Voluptatibus quis.', '1564226743', 1, 0, 86, 8),
(99, 'Quia quisquam est a neque.', '1564226743', 0, 0, 175, 89),
(100, 'Qui consequatur voluptate et.', '1564226743', 1, 1, 13, 35),
(101, 'Sequi ut laudantium.', '1564226743', 0, 1, 126, 56),
(102, 'Eum.', '1564226743', 0, 1, 170, 104),
(103, 'Quisquam magnam in voluptas quibusdam nihil.', '1564226743', 0, 0, 69, 114),
(104, 'Deserunt quisquam inventore.', '1564226743', 0, 1, 72, 64),
(105, 'Dolor.', '1564226743', 0, 0, 54, 195),
(106, 'Necessitatibus culpa est quas voluptas.', '1564226743', 0, 1, 69, 116),
(107, 'Asperiores adipisci sint.', '1564226743', 1, 1, 170, 10),
(108, 'Dolores in itaque.', '1564226743', 1, 0, 69, 162),
(109, 'Inventore aut assumenda minus non.', '1564226743', 1, 0, 140, 104),
(110, 'Consequatur asperiores officiis magni.', '1564226743', 1, 0, 98, 201),
(111, 'Et molestiae.', '1564226743', 1, 1, 178, 126),
(112, 'Ipsum aliquam ullam.', '1564226743', 1, 0, 113, 133),
(113, 'Recusandae voluptatem natus ut.', '1564226743', 1, 1, 182, 191),
(114, 'Unde consequatur id.', '1564226743', 0, 1, 92, 77),
(115, 'Dolore sit.', '1564226743', 0, 1, 56, 1),
(116, 'Voluptatum consequatur aut.', '1564226743', 1, 0, 102, 171),
(117, 'Sint ut at velit adipisci doloribus.', '1564226743', 1, 0, 172, 31),
(118, 'Odit repellendus sint consectetur ut.', '1564226743', 1, 1, 188, 112),
(119, 'Aliquid ut deserunt quod possimus rem.', '1564226743', 0, 1, 162, 64),
(120, 'Est.', '1564226743', 0, 0, 36, 15),
(121, 'Maiores eum nihil laudantium laudantium.', '1564226743', 0, 0, 100, 62),
(124, 'Tenetur vel commodi.', '1564226743', 0, 0, 88, 164),
(125, 'Quia molestias.', '1564226743', 1, 0, 37, 189),
(126, 'Velit velit harum.', '1564226743', 1, 0, 107, 103),
(127, 'Non iure et.', '1564226743', 0, 1, 6, 103),
(128, 'Veritatis doloribus quidem.', '1564226743', 1, 0, 21, 91),
(129, 'Reiciendis ratione nostrum expedita eum id.', '1564226743', 1, 0, 46, 128),
(130, 'Omnis eos veniam.', '1564226743', 0, 1, 18, 126),
(131, 'Aut.', '1564226743', 0, 1, 109, 185),
(132, 'Ullam voluptatem.', '1564226743', 1, 1, 114, 163),
(133, 'Corrupti eum nemo.', '1564226743', 0, 1, 197, 108),
(134, 'Atque earum.', '1564226743', 0, 0, 21, 55),
(135, 'Veritatis repudiandae in.', '1564226743', 0, 0, 154, 7),
(136, 'Autem quibusdam voluptatibus distinctio est.', '1564226743', 0, 0, 10, 147),
(137, 'Non necessitatibus molestias molestias cumque.', '1564226743', 0, 0, 198, 116),
(138, 'Cum aut debitis sed.', '1564226743', 1, 1, 11, 140),
(139, 'Libero ut.', '1564226743', 0, 1, 138, 140),
(140, 'Voluptatem perspiciatis numquam voluptatem iste ea.', '1564226743', 1, 1, 185, 142),
(141, 'In laborum.', '1564226743', 0, 0, 124, 164),
(142, 'Enim itaque.', '1564226743', 1, 1, 108, 155),
(143, 'Non et.', '1564226743', 0, 1, 205, 150),
(144, 'Voluptatem doloremque libero.', '1564226743', 1, 1, 144, 129),
(145, 'Est hic.', '1564226744', 0, 0, 109, 57),
(146, 'Dicta aut nam aut.', '1564226744', 1, 0, 29, 142),
(147, 'Qui sit omnis.', '1564226744', 0, 0, 195, 54),
(148, 'Velit aliquid.', '1564226744', 0, 0, 84, 190),
(149, 'Et quidem blanditiis.', '1564226744', 0, 0, 63, 182),
(150, 'Laudantium earum aut provident.', '1564226744', 1, 1, 199, 127),
(151, 'Mollitia delectus labore deserunt officia.', '1564226744', 0, 0, 81, 55),
(152, 'Vel ut inventore nesciunt ut.', '1564226744', 0, 1, 200, 105),
(153, 'Cupiditate deleniti.', '1564226744', 1, 1, 9, 149),
(154, 'Quidem fuga.', '1564226744', 1, 0, 108, 43),
(155, 'Ipsam ipsam.', '1564226744', 0, 1, 71, 125),
(156, 'Earum voluptatem.', '1564226744', 1, 0, 18, 26),
(157, 'Et et voluptatem facilis sapiente.', '1564226744', 0, 0, 133, 158),
(158, 'Libero.', '1564226744', 0, 0, 115, 199),
(159, 'Cum voluptate vitae.', '1564226744', 0, 1, 73, 111),
(160, 'Ipsam iure doloribus.', '1564226744', 1, 1, 180, 175),
(161, 'Quo in doloribus repellat adipisci.', '1564226744', 0, 0, 195, 96),
(162, 'Quo.', '1564226744', 1, 1, 21, 48),
(163, 'Enim maiores et.', '1564226744', 1, 0, 6, 77),
(164, 'Qui illum velit.', '1564226744', 1, 1, 133, 70),
(165, 'Molestiae.', '1564226744', 1, 0, 11, 206),
(166, 'Et maxime quam id.', '1564226744', 0, 1, 109, 190),
(167, 'Laborum suscipit.', '1564226744', 0, 1, 137, 60),
(168, 'Amet est possimus officiis.', '1564226744', 1, 0, 161, 25),
(169, 'Rerum voluptas velit.', '1564226744', 0, 1, 114, 197),
(170, 'Provident corporis.', '1564226744', 1, 0, 75, 162),
(171, 'Laborum deleniti.', '1564226744', 1, 1, 81, 205),
(172, 'Quos veritatis et.', '1564226744', 1, 0, 113, 107),
(173, 'Omnis sequi blanditiis.', '1564226744', 0, 1, 121, 131),
(174, 'Exercitationem est qui aspernatur.', '1564226744', 1, 0, 117, 126),
(175, 'Sed ut.', '1564226744', 0, 1, 96, 6),
(176, 'Dolor et vero ex ipsam.', '1564226744', 1, 0, 5, 11),
(177, 'Ab libero magni debitis.', '1564226744', 1, 0, 87, 87),
(178, 'Consequuntur eius nemo.', '1564226744', 0, 1, 12, 72),
(179, 'Architecto nisi voluptatem quod sit aliquam.', '1564226744', 1, 0, 4, 114),
(180, 'Hic.', '1564226744', 0, 0, 51, 166),
(181, 'Ad deleniti quia magni.', '1564226744', 0, 0, 26, 12),
(182, 'Aspernatur assumenda non rerum porro minus.', '1564226744', 0, 0, 27, 53),
(183, 'In ad.', '1564226744', 0, 1, 3, 148),
(184, 'Placeat aspernatur minima ex.', '1564226744', 1, 1, 48, 119),
(185, 'Excepturi qui doloremque qui repellat.', '1564226744', 1, 1, 105, 57),
(186, 'Vel nihil sunt.', '1564226744', 1, 1, 188, 205),
(187, 'Alias nihil eos molestias.', '1564226744', 0, 0, 179, 164),
(188, 'Iusto.', '1564226744', 1, 1, 22, 178),
(189, 'Aut ipsa ut natus qui dolor.', '1564226744', 0, 0, 74, 68),
(190, 'Accusamus.', '1564226744', 0, 1, 87, 18),
(191, 'Eos repellendus qui.', '1564226744', 1, 0, 162, 60),
(192, 'Dolorum nemo quod nostrum.', '1564226744', 1, 0, 182, 182),
(193, 'Autem consequatur et voluptates quidem.', '1564226744', 1, 1, 142, 30),
(194, 'Fuga ut facilis officia.', '1564226744', 1, 0, 18, 12),
(195, 'Aut quibusdam.', '1564226744', 1, 1, 131, 87),
(196, 'Deserunt quia corrupti.', '1564226744', 1, 0, 130, 132),
(197, 'Sapiente.', '1564226744', 0, 1, 25, 79),
(198, 'At deserunt quia.', '1564226744', 0, 1, 205, 123),
(199, 'Ut eos.', '1564226744', 0, 0, 95, 160),
(200, 'Quis quasi velit.', '1564226744', 0, 0, 108, 38),
(201, 'Consequatur.', '1564226744', 1, 1, 117, 62),
(202, 'Quibusdam omnis.', '1564226744', 0, 1, 157, 164),
(203, 'Ipsam qui voluptate.', '1564226744', 1, 1, 69, 178),
(204, 'Nulla facilis nihil et.', '1564226744', 0, 1, 72, 192),
(205, 'Eum corporis ut.', '1564226744', 0, 1, 61, 41),
(206, 'Iste.', '1564226744', 1, 0, 9, 107),
(207, 'Eos sint aut rerum.', '1564226744', 0, 1, 112, 97),
(208, 'Ea enim eum hic pariatur dolor.', '1564226744', 1, 0, 48, 3),
(209, 'Dolore ratione nihil ipsa qui neque.', '1564226744', 0, 1, 204, 84),
(210, 'Expedita quia distinctio sit.', '1564226744', 1, 0, 141, 11),
(211, 'Beatae.', '1564226745', 1, 1, 22, 16),
(212, 'Quam est.', '1564226745', 0, 1, 53, 93),
(213, 'Excepturi consequatur.', '1564226745', 0, 0, 78, 28),
(214, 'Quos molestiae aliquam asperiores.', '1564226745', 1, 1, 79, 46),
(216, 'Quo.', '1564226745', 0, 1, 77, 139),
(217, 'Ea autem doloremque.', '1564226745', 1, 0, 168, 33),
(218, 'Consequuntur modi et rem.', '1564226745', 1, 0, 53, 47),
(219, 'Facere a.', '1564226745', 0, 0, 162, 104),
(220, 'Excepturi quam facilis.', '1564226745', 1, 1, 37, 144),
(221, 'Qui aut perspiciatis.', '1564226745', 1, 0, 109, 65),
(222, 'Veritatis eum magni.', '1564226745', 1, 0, 163, 29),
(223, 'Explicabo natus.', '1564226745', 1, 0, 34, 96),
(224, 'Doloremque inventore quas quidem.', '1564226745', 1, 1, 10, 70),
(225, 'Id dicta natus.', '1564226745', 1, 1, 171, 78),
(226, 'Dicta et.', '1564226745', 0, 0, 94, 195),
(227, 'Itaque distinctio quia quia veritatis.', '1564226745', 1, 1, 11, 101),
(228, 'Et perspiciatis.', '1564226745', 1, 0, 166, 67),
(229, 'Minima.', '1564226745', 1, 0, 50, 143),
(230, 'Pariatur autem incidunt nihil.', '1564226745', 1, 1, 99, 70),
(231, 'Aperiam reiciendis nostrum.', '1564226745', 1, 1, 168, 155),
(232, 'Eos beatae nobis cum.', '1564226745', 1, 0, 116, 192),
(233, 'Ut saepe.', '1564226745', 0, 1, 157, 143),
(234, 'Dolorem tenetur.', '1564226745', 0, 0, 183, 181),
(235, 'Quidem.', '1564226745', 1, 1, 40, 87),
(236, 'Ut officiis.', '1564226745', 0, 0, 134, 178),
(237, 'Rerum nihil fugiat repudiandae.', '1564226745', 1, 1, 51, 188),
(238, 'Aliquid.', '1564226745', 0, 1, 33, 143),
(239, 'Exercitationem ex.', '1564226745', 0, 1, 52, 55),
(240, 'Ut repellendus.', '1564226745', 1, 0, 13, 67),
(241, 'Excepturi.', '1564226745', 1, 1, 66, 177),
(242, 'Voluptatum illo.', '1564226745', 0, 0, 70, 22),
(243, 'In rem.', '1564226745', 1, 1, 31, 90),
(244, 'Corporis.', '1564226745', 1, 1, 141, 8),
(245, 'Error voluptatem illo dignissimos.', '1564226745', 1, 1, 7, 143),
(246, 'Quo ipsa.', '1564226745', 0, 0, 39, 198),
(247, 'Necessitatibus occaecati aperiam veniam.', '1564226745', 1, 0, 136, 112),
(248, 'Aperiam rerum.', '1564226745', 0, 0, 117, 136),
(249, 'Corrupti sunt aliquam.', '1564226745', 1, 1, 34, 199),
(250, 'Officia voluptatem hic explicabo.', '1564226745', 0, 1, 192, 90),
(251, 'Quis voluptatum autem.', '1564226745', 1, 0, 91, 157),
(252, 'Numquam laborum voluptates enim.', '1564226745', 1, 1, 83, 87),
(253, 'Qui alias.', '1564226745', 0, 1, 194, 58),
(254, 'Illum odio ab officiis quam.', '1564226745', 1, 0, 101, 177),
(255, 'Molestiae expedita et.', '1564226745', 0, 0, 165, 154),
(256, 'Beatae impedit.', '1564226745', 1, 0, 133, 175),
(257, 'Sit blanditiis facere sed saepe.', '1564226745', 1, 1, 107, 116),
(258, 'Repudiandae iure dignissimos dolore ut.', '1564226745', 1, 1, 160, 84),
(259, 'Et quia.', '1564226745', 1, 0, 150, 63),
(260, 'Architecto ut eius culpa.', '1564226745', 1, 1, 115, 191),
(261, 'Tenetur dicta at.', '1564226745', 1, 0, 137, 192),
(262, 'Laboriosam et animi.', '1564226745', 0, 1, 18, 158),
(263, 'Aperiam et molestias.', '1564226745', 0, 0, 103, 94),
(264, 'Sunt illum eos.', '1564226745', 1, 1, 44, 7),
(265, 'Itaque voluptates illum.', '1564226745', 1, 0, 129, 171),
(266, 'Ut sint dicta.', '1564226745', 0, 1, 76, 1),
(267, 'Et quae vero.', '1564226745', 1, 1, 84, 117),
(268, 'Enim nihil.', '1564226745', 0, 0, 137, 156),
(269, 'Eaque dolores consequatur.', '1564226745', 0, 1, 100, 195),
(270, 'Odit atque pariatur consequatur reprehenderit dignissimos.', '1564226745', 1, 0, 197, 64),
(271, 'Non accusamus possimus quae.', '1564226745', 1, 1, 166, 110),
(272, 'Odio aspernatur sed nemo molestiae.', '1564226745', 0, 0, 163, 201),
(273, 'Assumenda laborum rem non autem.', '1564226745', 1, 0, 108, 203),
(274, 'Distinctio sed repudiandae explicabo.', '1564226745', 0, 1, 154, 81),
(275, 'Nisi eum porro aut.', '1564226745', 1, 1, 180, 111),
(276, 'Sequi sed id ad eius.', '1564226745', 1, 1, 23, 44),
(277, 'Tempora iure doloribus.', '1564226745', 0, 0, 41, 54),
(278, 'Quod sit autem pariatur ut ut.', '1564226745', 0, 0, 61, 206),
(279, 'Perferendis quibusdam qui.', '1564226745', 0, 0, 124, 74),
(280, 'Et.', '1564226745', 1, 1, 128, 168),
(281, 'Est.', '1564226745', 0, 1, 133, 49),
(282, 'Corrupti.', '1564226745', 1, 1, 105, 7),
(283, 'Error.', '1564226746', 0, 1, 121, 46),
(284, 'Eveniet et quis natus ratione.', '1564226746', 1, 0, 110, 87),
(285, 'Eligendi exercitationem asperiores.', '1564226746', 1, 0, 161, 32),
(286, 'Molestias eum placeat ab architecto.', '1564226746', 1, 1, 160, 167),
(287, 'Nam repellendus voluptas excepturi.', '1564226746', 1, 1, 158, 202),
(288, 'Nobis.', '1564226746', 1, 0, 127, 22),
(289, 'Cum odio repudiandae doloribus.', '1564226746', 0, 1, 20, 120),
(290, 'Molestiae optio animi.', '1564226746', 0, 1, 148, 14),
(291, 'Aliquid dolorem architecto unde.', '1564226746', 1, 1, 29, 115),
(292, 'Totam possimus nihil cumque voluptatem.', '1564226746', 1, 1, 78, 174),
(293, 'Animi expedita ut ut.', '1564226746', 0, 0, 154, 83),
(294, 'Laborum quis voluptas et.', '1564226746', 1, 1, 177, 139),
(295, 'Eos assumenda accusantium.', '1564226746', 1, 0, 161, 66),
(296, 'Ut ab qui veniam.', '1564226746', 0, 0, 63, 8),
(297, 'Dicta sit.', '1564226746', 1, 0, 3, 193),
(298, 'Sunt libero iusto quasi dolores qui.', '1564226746', 0, 1, 154, 22),
(299, 'Qui et eligendi aut qui in.', '1564226746', 0, 0, 59, 48),
(300, 'Doloribus.', '1564226746', 0, 0, 92, 40),
(301, 'Hic aspernatur cupiditate quasi magnam.', '1564226746', 1, 1, 34, 56),
(302, 'At accusamus maxime.', '1564226746', 1, 0, 117, 71),
(303, 'Dignissimos.', '1564226746', 0, 1, 119, 19),
(304, 'Id.', '1564226746', 1, 1, 93, 143),
(305, 'Quo amet.', '1564226746', 0, 0, 176, 75),
(306, 'Veniam perferendis omnis.', '1564226746', 0, 0, 64, 1),
(307, 'Cum labore quo et.', '1564226746', 0, 1, 173, 121),
(308, 'Exercitationem atque veniam.', '1564226746', 1, 0, 121, 88),
(309, 'Vitae id tempora tenetur.', '1564226746', 0, 1, 29, 122),
(310, 'Atque officiis labore.', '1564226746', 1, 0, 51, 55),
(311, 'Ea possimus recusandae.', '1564226746', 0, 1, 192, 81),
(312, 'Repellat vero autem beatae fugit vitae.', '1564226746', 1, 1, 115, 181),
(313, 'Aut ut.', '1564226746', 1, 0, 133, 51),
(314, 'Nulla cumque voluptatibus.', '1564226746', 0, 0, 132, 35),
(315, 'Nulla vel.', '1564226746', 0, 1, 14, 174),
(316, 'Maxime ducimus.', '1564226746', 1, 1, 84, 9),
(317, 'Et atque praesentium non.', '1564226746', 0, 0, 16, 76),
(318, 'Quo dolore labore ipsum repudiandae illo.', '1564226746', 0, 1, 66, 128),
(319, 'Voluptatibus.', '1564226746', 1, 0, 24, 185),
(320, 'Quia ut omnis.', '1564226746', 0, 0, 164, 113),
(321, 'Quas occaecati consequatur adipisci.', '1564226746', 1, 1, 39, 203),
(322, 'Ex id molestiae architecto possimus saepe.', '1564226746', 0, 0, 9, 170),
(323, 'Sit.', '1564226746', 0, 0, 144, 128),
(324, 'Et dolorum ut modi.', '1564226746', 0, 0, 151, 136),
(325, 'Qui.', '1564226746', 1, 1, 55, 142),
(326, 'Veritatis inventore quia.', '1564226746', 1, 0, 198, 161),
(327, 'Sint dolore et.', '1564226746', 0, 1, 71, 107),
(328, 'Maxime vitae voluptatibus dicta.', '1564226746', 0, 1, 205, 115),
(329, 'Excepturi eum ratione.', '1564226746', 0, 0, 145, 22),
(330, 'Dignissimos vitae eius pariatur natus.', '1564226746', 1, 0, 9, 25),
(331, 'Quo modi fugiat excepturi consectetur.', '1564226746', 1, 0, 78, 129),
(332, 'Quia sequi est.', '1564226746', 0, 1, 139, 154),
(333, 'Aut beatae est.', '1564226746', 0, 1, 195, 73),
(334, 'Est consectetur.', '1564226746', 1, 0, 130, 43),
(335, 'Quia.', '1564226746', 0, 1, 14, 113),
(336, 'Dolor eligendi aut ex non.', '1564226746', 0, 0, 12, 31),
(337, 'Sit quia.', '1564226746', 1, 1, 59, 191),
(338, 'Cupiditate sequi.', '1564226746', 1, 0, 147, 30),
(339, 'Architecto nisi eum et et.', '1564226746', 1, 1, 149, 108),
(340, 'Quia qui.', '1564226746', 1, 0, 38, 115),
(341, 'Recusandae commodi tempora doloremque.', '1564226746', 0, 1, 34, 169),
(342, 'Quas aut inventore autem.', '1564226746', 1, 0, 167, 82),
(343, 'Eos minima deleniti.', '1564226746', 1, 0, 154, 7),
(344, 'Facilis ut.', '1564226746', 0, 0, 28, 89),
(345, 'Eum velit esse consequuntur voluptatem.', '1564226747', 0, 0, 19, 31),
(346, 'Aut quis sit omnis.', '1564226747', 1, 1, 135, 182),
(347, 'Debitis.', '1564226747', 0, 1, 181, 141),
(348, 'Consequatur voluptatem porro eum.', '1564226747', 1, 0, 176, 194),
(349, 'Molestiae est autem.', '1564226747', 1, 0, 87, 174),
(350, 'Id natus.', '1564226747', 1, 0, 205, 123),
(351, 'Aut laborum sit saepe.', '1564226747', 0, 0, 173, 104),
(352, 'Quia ea in.', '1564226747', 1, 0, 161, 65),
(353, 'In a aut eveniet.', '1564226747', 1, 0, 153, 113),
(354, 'Qui doloribus sed.', '1564226747', 1, 0, 2, 66),
(355, 'Voluptas voluptas fugit nobis itaque.', '1564226747', 0, 0, 165, 11),
(356, 'Quos.', '1564226747', 0, 1, 64, 39),
(357, 'Excepturi excepturi libero.', '1564226747', 1, 0, 108, 196),
(358, 'Quo.', '1564226747', 0, 0, 95, 55),
(359, 'Qui nisi adipisci.', '1564226747', 1, 1, 5, 86),
(360, 'Ut.', '1564226747', 1, 1, 87, 119),
(361, 'Amet ducimus officia.', '1564226747', 1, 0, 70, 184),
(362, 'Temporibus est.', '1564226747', 0, 1, 134, 105),
(363, 'In molestiae incidunt dolorem voluptatem.', '1564226747', 1, 1, 164, 111),
(364, 'Qui culpa quia.', '1564226747', 0, 0, 31, 54),
(365, 'Et.', '1564226747', 0, 1, 44, 48),
(366, 'Ut blanditiis consequatur.', '1564226747', 1, 0, 171, 89),
(367, 'Aut qui.', '1564226747', 0, 1, 33, 94),
(368, 'Sequi.', '1564226747', 0, 1, 14, 134),
(369, 'Earum perspiciatis.', '1564226747', 0, 1, 12, 85),
(370, 'Facilis officiis sit qui.', '1564226747', 0, 0, 65, 50),
(371, 'Aliquid quasi dolor.', '1564226747', 1, 0, 21, 148),
(372, 'Esse ipsum rerum neque.', '1564226747', 1, 1, 161, 86),
(373, 'Similique eum aliquid.', '1564226747', 0, 1, 151, 90),
(374, 'Sint.', '1564226747', 1, 0, 165, 136),
(375, 'Eos est nihil.', '1564226747', 0, 1, 128, 124),
(376, 'Rerum consectetur sed.', '1564226747', 0, 0, 37, 37),
(377, 'Optio necessitatibus nobis cumque fugit omnis.', '1564226747', 0, 0, 193, 77),
(378, 'Dolor deserunt iusto.', '1564226747', 1, 1, 41, 190),
(379, 'Id ad.', '1564226747', 0, 1, 79, 119),
(380, 'In sed.', '1564226747', 1, 1, 107, 157),
(381, 'Rerum in.', '1564226747', 1, 0, 176, 81),
(382, 'Eius.', '1564226747', 0, 1, 201, 31),
(383, 'Dolores ab fugiat ut.', '1564226747', 1, 0, 60, 108),
(384, 'Omnis sapiente.', '1564226747', 1, 1, 58, 99),
(385, 'Rem distinctio neque.', '1564226747', 1, 1, 204, 21),
(386, 'Eos eaque consequatur et eaque nostrum.', '1564226747', 1, 1, 105, 184),
(387, 'Ex qui dolor.', '1564226747', 0, 1, 86, 22),
(388, 'Ad cumque.', '1564226747', 1, 0, 190, 65),
(389, 'Asperiores architecto necessitatibus.', '1564226747', 0, 0, 73, 193),
(390, 'Consequuntur aspernatur optio eveniet et.', '1564226747', 0, 1, 162, 149),
(391, 'Omnis accusamus.', '1564226747', 1, 1, 71, 117),
(392, 'Commodi.', '1564226747', 1, 0, 145, 171),
(393, 'Perferendis soluta harum fugit.', '1564226747', 1, 1, 200, 85),
(394, 'Voluptate et placeat.', '1564226747', 0, 0, 176, 113),
(395, 'Cumque veritatis et.', '1564226747', 1, 1, 110, 170),
(396, 'Sunt quod aut.', '1564226747', 0, 1, 51, 83),
(397, 'Repellat et temporibus.', '1564226747', 1, 0, 87, 151),
(398, 'Temporibus illo.', '1564226747', 1, 1, 84, 44),
(399, 'Quis nihil.', '1564226747', 1, 1, 5, 28),
(400, 'Quis quia quos.', '1564226747', 0, 1, 115, 102),
(401, 'Esse rerum nostrum porro voluptatem.', '1564226747', 0, 0, 40, 89),
(402, 'Maiores quia fugiat eveniet.', '1564226747', 1, 0, 62, 166),
(403, 'Earum aut totam unde.', '1564226747', 1, 1, 160, 143),
(404, 'Qui sed magnam quibusdam dolorem.', '1564226747', 0, 1, 102, 193),
(405, 'Quia natus dolorem.', '1564226747', 0, 1, 162, 99),
(406, 'Et accusantium sed dolor qui.', '1564226747', 0, 0, 113, 64),
(407, 'Veniam maxime recusandae.', '1564226748', 0, 1, 38, 159),
(408, 'Quaerat illum est tenetur ratione.', '1564226748', 1, 0, 130, 43),
(409, 'Veniam a sint.', '1564226748', 1, 1, 156, 182),
(410, 'Assumenda culpa sint in.', '1564226748', 1, 1, 84, 191),
(411, 'Et fugiat omnis.', '1564226748', 0, 0, 22, 31),
(412, 'Numquam aliquam.', '1564226748', 0, 1, 180, 143),
(413, 'Deleniti voluptatem.', '1564226748', 1, 1, 89, 43),
(414, 'Eum qui sit pariatur ducimus.', '1564226748', 0, 1, 146, 75),
(415, 'Sint praesentium.', '1564226748', 1, 1, 57, 38),
(416, 'Non eligendi.', '1564226748', 0, 0, 63, 48),
(417, 'Omnis est dolores.', '1564226748', 0, 0, 114, 163),
(418, 'Ducimus id.', '1564226748', 1, 0, 172, 8),
(419, 'Officiis.', '1564226748', 0, 1, 28, 152),
(420, 'Molestias debitis nobis.', '1564226748', 1, 0, 168, 101),
(421, 'Commodi minus.', '1564226748', 0, 1, 53, 69),
(422, 'Exercitationem et.', '1564226748', 0, 0, 59, 180),
(423, 'Aut repellat eaque et.', '1564226748', 0, 0, 28, 183),
(424, 'Tenetur asperiores dolores cum.', '1564226748', 1, 1, 121, 133),
(425, 'Porro enim.', '1564226748', 0, 0, 127, 4),
(426, 'Aut ipsam aut.', '1564226748', 1, 1, 154, 188),
(427, 'Ipsam labore nobis.', '1564226748', 0, 1, 185, 196),
(428, 'In numquam.', '1564226748', 0, 1, 105, 62),
(429, 'Eos quidem est delectus.', '1564226748', 0, 0, 99, 66),
(430, 'Id totam ut.', '1564226748', 0, 0, 21, 180),
(431, 'Nobis.', '1564226748', 0, 1, 128, 197),
(432, 'A voluptatibus.', '1564226748', 0, 0, 106, 48),
(433, 'Molestiae omnis.', '1564226748', 1, 0, 186, 190),
(434, 'Animi et quod.', '1564226748', 1, 0, 141, 153),
(435, 'Odio.', '1564226748', 1, 0, 26, 146),
(436, 'Voluptatem eligendi facere tenetur.', '1564226748', 1, 1, 117, 193),
(437, 'Repudiandae.', '1564226748', 1, 1, 96, 2),
(438, 'Recusandae.', '1564226748', 1, 1, 175, 37),
(439, 'Dolorem et ut ipsa.', '1564226748', 0, 1, 97, 132),
(440, 'Aut.', '1564226748', 0, 1, 136, 94),
(441, 'Labore doloribus et officiis.', '1564226748', 0, 0, 186, 46),
(442, 'Ratione.', '1564226748', 0, 0, 154, 118),
(443, '111', '1564228077', 1, 0, 172, 1),
(444, 'Est doloremque.', '1564226748', 1, 0, 138, 51),
(445, 'Sit repellat ut ipsum.', '1564226748', 1, 0, 74, 148),
(446, 'Cumque autem sit.', '1564226748', 0, 1, 182, 41),
(447, 'Hic dolorum.', '1564226748', 1, 0, 196, 111),
(448, 'Nulla quia placeat saepe.', '1564226748', 1, 0, 103, 12),
(449, 'Saepe consequatur sed et.', '1564226748', 0, 1, 191, 173),
(450, 'Ut veniam amet velit corrupti nisi.', '1564226748', 0, 0, 15, 51),
(451, 'Ut quaerat illum.', '1564226748', 1, 1, 102, 60),
(452, 'Exercitationem.', '1564226748', 0, 0, 125, 184),
(453, 'Non molestias blanditiis et.', '1564226748', 1, 1, 26, 7),
(454, 'Sapiente eveniet.', '1564226748', 1, 0, 55, 97),
(455, 'Exercitationem quam ut veniam.', '1564226748', 0, 0, 46, 60),
(456, 'Accusantium debitis rerum perferendis.', '1564226748', 1, 0, 109, 162),
(457, 'Laudantium amet magnam.', '1564226748', 0, 0, 56, 72),
(458, 'Dolorum non.', '1564226748', 0, 1, 43, 152),
(459, 'Architecto culpa velit.', '1564226748', 0, 1, 9, 69),
(460, 'Ut dignissimos autem vero.', '1564226748', 1, 0, 184, 196),
(461, 'Dignissimos et.', '1564226748', 0, 1, 28, 54),
(462, 'Explicabo.', '1564226748', 0, 1, 136, 89),
(463, 'Suscipit et quidem neque ut autem.', '1564226748', 0, 1, 92, 148),
(464, 'Ut dolorem qui.', '1564226748', 0, 1, 34, 51),
(465, 'Velit temporibus ut aut quos.', '1564226748', 1, 0, 32, 200),
(466, 'Impedit ut in deserunt.', '1564226748', 1, 1, 183, 50),
(467, 'Ducimus accusamus.', '1564226748', 0, 1, 172, 95),
(468, 'Amet autem harum.', '1564226748', 0, 0, 38, 189),
(469, 'Iusto nam quisquam natus.', '1564226748', 1, 1, 45, 112),
(470, 'Et nostrum.', '1564226748', 1, 1, 143, 162),
(471, 'Nihil dolorum est.', '1564226748', 0, 1, 8, 77),
(472, 'Aspernatur fugiat reiciendis.', '1564226748', 1, 0, 31, 150),
(473, 'Fuga saepe laboriosam.', '1564226748', 1, 1, 159, 70),
(474, 'Commodi delectus.', '1564226748', 1, 1, 112, 198),
(475, 'Qui corrupti.', '1564226748', 0, 0, 35, 60),
(476, 'Aut quibusdam ut.', '1564226748', 0, 1, 135, 196),
(477, 'Quia et.', '1564226748', 0, 0, 117, 156),
(478, 'Sapiente totam laborum possimus.', '1564226748', 1, 0, 123, 107),
(479, 'Voluptatum et amet.', '1564226749', 1, 0, 131, 21),
(480, 'Et ad.', '1564226749', 1, 1, 140, 110),
(481, 'Quo necessitatibus.', '1564226749', 0, 1, 64, 152),
(482, 'Tenetur aspernatur.', '1564226749', 0, 1, 96, 52),
(483, 'Explicabo amet sit.', '1564226749', 0, 1, 157, 5),
(484, 'Excepturi autem ea praesentium et.', '1564226749', 1, 1, 105, 105),
(485, 'Omnis similique accusamus.', '1564226749', 1, 1, 80, 45),
(486, 'Quia saepe qui.', '1564226749', 0, 1, 64, 180),
(487, 'Nobis consectetur cupiditate architecto.', '1564226749', 0, 1, 179, 202),
(488, 'Possimus qui.', '1564226749', 0, 1, 63, 102),
(489, 'Ullam.', '1564226749', 0, 0, 34, 15),
(490, 'Repellendus et eaque.', '1564226749', 0, 0, 47, 66),
(491, 'Nesciunt molestiae temporibus nemo.', '1564226749', 0, 0, 130, 142),
(492, 'Vel.', '1564226749', 1, 0, 131, 104),
(493, 'Est ut est quas debitis.', '1564226749', 1, 1, 101, 4),
(494, 'Corporis accusamus.', '1564226749', 1, 0, 135, 58),
(495, 'Sint tempore odio.', '1564226749', 1, 0, 164, 43),
(496, 'Eum voluptatem tenetur.', '1564226749', 1, 1, 188, 20),
(497, 'Nihil aut sunt placeat.', '1564226749', 1, 1, 40, 70),
(498, 'Unde.', '1564226749', 1, 0, 183, 34),
(499, 'In quia aliquid.', '1564226749', 0, 1, 127, 65),
(500, 'Vel suscipit qui.', '1564226749', 0, 1, 119, 31),
(501, 'Qui.', '1564226749', 0, 1, 6, 44),
(502, 'Animi odio necessitatibus eaque.', '1564226749', 1, 0, 29, 178),
(503, 'Libero.', '1564226749', 1, 1, 3, 139),
(504, 'Sit sapiente quaerat veniam quibusdam.', '1564226749', 1, 0, 91, 199),
(505, 'Aspernatur quae ea.', '1564226749', 1, 0, 89, 150),
(506, 'Ea est minima.', '1564226749', 0, 1, 94, 182),
(507, 'Qui voluptatem.', '1564226749', 0, 0, 206, 51),
(508, 'Illo rerum alias dolor excepturi.', '1564226749', 1, 0, 170, 49),
(509, 'Eos earum.', '1564226749', 1, 0, 160, 19),
(510, 'Ut amet modi nam.', '1564226749', 1, 1, 26, 84),
(511, 'Accusamus omnis distinctio qui laudantium.', '1564226749', 1, 1, 48, 202),
(512, 'Ipsum ullam.', '1564226749', 0, 0, 107, 176),
(513, 'Ullam placeat enim.', '1564226749', 1, 0, 27, 178),
(514, 'Necessitatibus laudantium.', '1564226749', 1, 1, 5, 3),
(515, 'Est.', '1564226749', 1, 1, 87, 88),
(516, 'Voluptatem.', '1564226749', 0, 1, 5, 107),
(517, 'Cumque officia quibusdam voluptates.', '1564226749', 0, 0, 193, 4),
(518, 'Veniam sed consequatur provident aut.', '1564226749', 0, 1, 150, 57),
(519, 'Aperiam.', '1564226749', 1, 1, 89, 157),
(520, 'Fugiat dolores.', '1564226749', 1, 0, 63, 122),
(521, 'Rerum voluptas.', '1564226749', 1, 1, 163, 69),
(522, 'Dignissimos velit.', '1564226749', 1, 1, 61, 67),
(523, 'Eos aut occaecati nobis corrupti.', '1564226749', 1, 1, 47, 74),
(524, 'Quia ut ut omnis.', '1564226749', 1, 1, 98, 114),
(525, 'Est nulla cumque.', '1564226749', 0, 0, 66, 62),
(526, 'Repellat dignissimos aliquid.', '1564226749', 1, 1, 167, 204),
(527, 'Quia deleniti saepe iusto.', '1564226749', 1, 1, 164, 132),
(528, 'Fugit et corrupti.', '1564226749', 0, 0, 128, 125),
(529, 'Atque magni.', '1564226749', 0, 0, 15, 20),
(530, 'Quo voluptate.', '1564226749', 0, 0, 103, 64),
(531, 'Commodi.', '1564226749', 0, 0, 18, 7),
(532, 'Nam est aut aliquam et.', '1564226749', 0, 0, 203, 82),
(533, 'Tempora sed.', '1564226750', 0, 0, 2, 55),
(534, 'Ea repellendus.', '1564226750', 0, 0, 71, 135),
(535, 'Ad.', '1564226750', 0, 1, 189, 62),
(536, 'Blanditiis sit dolorem doloribus corporis.', '1564226750', 0, 1, 133, 57),
(537, 'Nesciunt cumque voluptas.', '1564226750', 1, 1, 113, 104),
(538, 'Quisquam sit.', '1564226750', 1, 1, 127, 61),
(539, 'Illo non nesciunt quia enim.', '1564226750', 0, 1, 72, 55),
(540, 'Rem qui.', '1564226750', 1, 1, 81, 119),
(541, 'Totam vero ut.', '1564226750', 0, 0, 168, 56),
(542, 'Dicta.', '1564226750', 1, 0, 160, 161),
(543, 'Vitae.', '1564226750', 1, 1, 120, 150),
(544, 'Quibusdam repellendus impedit.', '1564226750', 1, 1, 37, 41),
(545, 'Dolorem dolorem.', '1564226750', 0, 1, 125, 82),
(546, 'Nobis eum in.', '1564226750', 1, 1, 19, 32),
(547, 'Dolor velit praesentium voluptates praesentium.', '1564226750', 1, 1, 143, 18),
(548, 'Tempora quisquam.', '1564226750', 1, 1, 103, 97),
(549, 'Totam neque.', '1564226750', 1, 0, 173, 92),
(550, 'Minus voluptas nam rerum.', '1564226750', 1, 0, 46, 86),
(551, 'Neque praesentium.', '1564226750', 1, 0, 101, 141),
(552, 'Minus.', '1564226750', 1, 0, 52, 170),
(553, 'Et dolorem quod perferendis cupiditate porro.', '1564226751', 0, 0, 3, 174),
(554, 'Omnis aliquam est.', '1564226751', 1, 0, 45, 19),
(555, 'Perferendis aut tempore.', '1564226751', 0, 1, 195, 3),
(556, 'Non esse.', '1564226751', 1, 1, 95, 178),
(557, 'Labore.', '1564226751', 0, 1, 104, 49),
(558, 'Saepe ut molestiae.', '1564226751', 1, 1, 64, 144),
(559, 'Est libero aliquam.', '1564226751', 1, 0, 143, 77),
(560, 'Voluptatibus sunt sit accusantium sed.', '1564226751', 0, 1, 170, 98),
(561, 'Voluptate.', '1564226751', 0, 1, 43, 120),
(562, 'Velit cum.', '1564226751', 0, 1, 20, 85),
(563, 'Facilis consequatur.', '1564226751', 0, 1, 52, 116),
(564, 'Saepe at.', '1564226751', 0, 1, 102, 121),
(565, 'Repellendus.', '1564226751', 0, 1, 155, 30),
(566, 'Ea sunt ut laborum dolorem.', '1564226751', 1, 1, 39, 158),
(567, 'Repellat voluptas reprehenderit quia.', '1564226751', 1, 0, 155, 188),
(568, 'Assumenda at.', '1564226751', 0, 1, 104, 194),
(569, 'Qui inventore sed consectetur.', '1564226751', 1, 1, 70, 72),
(570, 'Et eum quia.', '1564226751', 1, 1, 131, 118),
(571, 'Possimus ullam nisi autem nesciunt.', '1564226751', 0, 1, 42, 38),
(572, 'Rem maxime ullam deserunt.', '1564226751', 1, 1, 41, 20),
(573, 'Iste mollitia ea.', '1564226751', 0, 1, 68, 120),
(574, 'Labore dolorem.', '1564226751', 1, 0, 144, 61),
(575, 'Voluptas aperiam aut facilis quos.', '1564226751', 1, 0, 137, 125),
(576, 'Voluptatum dolores voluptas.', '1564226751', 1, 0, 201, 70),
(577, 'Quidem voluptatem quo.', '1564226751', 1, 1, 13, 22),
(578, 'Nulla qui culpa sunt.', '1564226751', 1, 0, 106, 87),
(579, 'Quam odit.', '1564226751', 1, 0, 58, 7),
(580, 'Nemo.', '1564226751', 1, 1, 62, 202),
(581, 'Velit iste omnis.', '1564226751', 1, 1, 37, 107),
(582, 'Repellendus nemo aut laborum quisquam.', '1564226751', 1, 1, 21, 124),
(583, 'Perspiciatis facere dolor ut.', '1564226751', 1, 0, 94, 76),
(584, 'Et id minima.', '1564226751', 1, 0, 43, 97),
(585, 'Explicabo quos.', '1564226751', 0, 1, 159, 177),
(586, 'Vel.', '1564226751', 1, 1, 136, 97),
(587, 'Dolor dolores aut.', '1564226752', 1, 1, 189, 163),
(588, 'Officia quia corrupti delectus in.', '1564226752', 0, 0, 121, 84),
(589, 'Sapiente suscipit eum repudiandae.', '1564226752', 0, 0, 101, 176),
(590, 'Facere ipsa doloremque mollitia.', '1564226752', 1, 0, 140, 119),
(591, 'Sit ipsum aliquam.', '1564226752', 1, 1, 9, 194),
(592, 'Quia nesciunt.', '1564226752', 0, 1, 165, 61),
(593, 'Voluptas est.', '1564226752', 0, 1, 45, 134),
(594, 'Exercitationem non dolores.', '1564226752', 1, 1, 116, 53),
(595, 'Sunt eos.', '1564226752', 1, 1, 44, 106),
(596, 'Fuga ullam debitis necessitatibus.', '1564226752', 1, 1, 161, 7),
(597, 'Est nostrum a.', '1564226752', 1, 1, 132, 172),
(598, 'Nobis minima ex laboriosam sed.', '1564226752', 0, 1, 56, 54),
(599, 'Tenetur reprehenderit.', '1564226752', 1, 1, 48, 19),
(600, 'Debitis aut perferendis eum.', '1564226752', 1, 0, 43, 184),
(601, 'Quia earum quia consectetur.', '1564226752', 1, 0, 43, 205),
(602, 'Eveniet impedit deleniti maiores.', '1564226752', 0, 1, 75, 149),
(603, 'Corporis.', '1564226752', 1, 0, 63, 165),
(604, 'Est architecto.', '1564226752', 0, 0, 198, 187),
(605, 'Aut consequatur est voluptatem velit fugiat.', '1564226752', 0, 1, 48, 188),
(606, 'Aspernatur ut ut ut.', '1564226752', 0, 0, 180, 139),
(607, 'Non dolorem et.', '1564226752', 1, 1, 194, 148),
(608, 'Voluptatem molestias est adipisci et.', '1564226752', 1, 0, 97, 177),
(609, 'Ipsa nihil.', '1564226752', 1, 1, 101, 195),
(610, 'Deserunt nisi.', '1564226752', 1, 0, 62, 3),
(611, 'Et aliquam quas.', '1564226752', 0, 0, 10, 99),
(612, 'Ab quia.', '1564226752', 1, 0, 88, 112),
(613, 'Quia asperiores.', '1564226752', 0, 1, 27, 7),
(614, 'Et omnis dignissimos minus quo.', '1564226752', 0, 1, 168, 44),
(615, 'Enim officiis sed adipisci.', '1564226752', 1, 1, 89, 130),
(616, 'Aperiam animi in veniam quisquam.', '1564226752', 1, 1, 50, 12),
(617, 'Id sequi.', '1564226752', 0, 0, 48, 187),
(618, 'Voluptate voluptate.', '1564226752', 1, 1, 206, 30),
(619, 'Veritatis atque enim dolores.', '1564226752', 1, 0, 155, 71),
(620, 'Voluptatem rerum.', '1564226752', 0, 0, 183, 162),
(621, 'Iure.', '1564226752', 1, 0, 83, 49),
(622, 'Quis fugit fugiat repudiandae et praesentium.', '1564226752', 1, 0, 49, 155),
(623, 'Saepe assumenda nulla.', '1564226752', 0, 1, 167, 62),
(624, 'Itaque ut perspiciatis quisquam asperiores est.', '1564226752', 1, 1, 114, 114),
(625, 'Labore ad voluptates est dolor.', '1564226752', 1, 0, 152, 6),
(626, 'Quasi voluptatem.', '1564226752', 1, 0, 173, 156),
(627, 'Laborum repudiandae recusandae.', '1564226752', 1, 0, 49, 161),
(628, 'Rerum in explicabo.', '1564226752', 1, 0, 92, 49),
(629, 'Numquam voluptatem aut ex.', '1564226752', 1, 1, 17, 100),
(630, 'Qui.', '1564226752', 1, 0, 44, 41),
(631, 'Provident inventore.', '1564226752', 0, 0, 107, 75),
(632, 'Non impedit quibusdam qui natus.', '1564226752', 1, 1, 79, 123),
(633, 'Nemo aut ullam sit.', '1564226752', 0, 1, 52, 117),
(634, 'Ullam sapiente explicabo modi.', '1564226752', 0, 1, 44, 20),
(635, 'Et suscipit animi deleniti.', '1564226752', 0, 0, 61, 5),
(636, 'Non nobis.', '1564226752', 1, 0, 10, 160),
(637, 'Inventore ea.', '1564226752', 1, 0, 35, 58),
(638, 'Saepe velit adipisci nemo.', '1564226752', 1, 0, 15, 179),
(639, 'Consequatur officiis.', '1564226752', 1, 1, 65, 175),
(640, 'Quisquam laudantium aut.', '1564226752', 1, 0, 186, 72),
(641, 'Sit voluptatem.', '1564226752', 0, 1, 110, 104),
(642, 'Assumenda aliquid.', '1564226752', 0, 1, 39, 104),
(643, 'Aut voluptas rem.', '1564226752', 0, 0, 199, 177),
(644, 'Voluptas.', '1564226752', 1, 0, 184, 41),
(645, 'Officia ut et explicabo.', '1564226752', 0, 0, 11, 60),
(646, 'Beatae ullam et ipsa sed.', '1564226753', 1, 1, 162, 173),
(647, 'Dolor voluptatibus.', '1564226753', 1, 1, 148, 103),
(648, 'Consequatur animi.', '1564226753', 0, 1, 125, 10),
(649, 'Possimus exercitationem.', '1564226753', 0, 0, 23, 71),
(650, 'Necessitatibus animi ducimus ad.', '1564226753', 1, 1, 199, 88),
(651, 'Excepturi perspiciatis ipsum.', '1564226753', 1, 0, 111, 120),
(652, 'Adipisci atque maiores.', '1564226753', 0, 1, 85, 94),
(653, 'Dolorem.', '1564226753', 0, 0, 60, 49),
(654, 'Velit dignissimos assumenda.', '1564226753', 0, 0, 73, 200),
(655, 'Consequatur sit iusto.', '1564226753', 1, 0, 103, 10),
(656, 'Voluptatem saepe deserunt.', '1564226753', 1, 0, 26, 199),
(657, 'Officia alias beatae.', '1564226753', 1, 1, 135, 82),
(658, 'Laboriosam distinctio.', '1564226753', 1, 1, 35, 95),
(659, 'Inventore adipisci.', '1564226753', 0, 0, 174, 128),
(660, 'Expedita velit voluptate.', '1564226753', 1, 0, 146, 12),
(661, 'Consequatur.', '1564226753', 1, 1, 102, 176),
(662, 'Commodi et nihil quia tenetur dignissimos.', '1564226753', 1, 1, 32, 39),
(663, 'Consequatur quia.', '1564226753', 0, 1, 165, 105),
(664, 'Dolor fuga blanditiis.', '1564226753', 1, 1, 184, 69),
(665, 'Molestiae iure officiis consequatur.', '1564226753', 1, 0, 58, 99),
(666, 'Ut deleniti rem architecto.', '1564226753', 1, 1, 61, 72),
(667, 'Facilis est.', '1564226753', 1, 1, 143, 76),
(668, 'Officiis.', '1564226753', 1, 1, 159, 144),
(669, 'Illo odio.', '1564226753', 0, 0, 201, 143),
(670, 'Dolor est et.', '1564226753', 0, 1, 20, 200),
(671, 'Fugit.', '1564226753', 0, 1, 161, 22),
(672, 'Rerum eaque similique.', '1564226753', 1, 1, 12, 66),
(673, 'Aliquid esse maiores fugit rerum.', '1564226753', 1, 1, 112, 12),
(674, 'Fuga ad dolores.', '1564226753', 1, 0, 148, 142),
(675, 'Odit et.', '1564226753', 0, 0, 8, 7),
(676, 'Inventore cupiditate placeat.', '1564226753', 1, 1, 14, 190),
(677, 'Possimus.', '1564226753', 0, 0, 149, 23),
(678, 'Ipsam cum dolorem.', '1564226753', 0, 1, 143, 40),
(679, 'Placeat accusamus.', '1564226753', 1, 0, 97, 112),
(680, 'Dolorem in cupiditate et.', '1564226753', 0, 1, 108, 175),
(681, 'Unde natus dolorem tempore.', '1564226753', 1, 0, 81, 176),
(682, 'Enim vel ea non nam.', '1564226753', 1, 0, 92, 192),
(683, 'Excepturi praesentium quo debitis.', '1564226753', 0, 1, 92, 113),
(684, 'Dolores consequatur et harum.', '1564226753', 0, 1, 83, 73),
(685, 'Consequuntur veniam repellat natus occaecati.', '1564226753', 0, 0, 135, 115),
(686, 'Ad voluptas est accusantium eum.', '1564226753', 1, 1, 158, 41),
(687, 'Amet vel asperiores.', '1564226753', 1, 1, 48, 192),
(688, 'Minima id sunt ad itaque eos.', '1564226753', 1, 1, 180, 203),
(689, 'Molestiae et.', '1564226753', 1, 0, 119, 132),
(690, 'Ad accusamus.', '1564226753', 0, 1, 188, 139),
(691, 'Ut sint.', '1564226753', 0, 0, 68, 171),
(692, 'Ut et quis sit.', '1564226753', 0, 0, 148, 2),
(693, 'Velit at et repudiandae.', '1564226753', 0, 0, 33, 87),
(694, 'Ipsa illo libero.', '1564226753', 0, 0, 72, 22),
(695, 'Nostrum nam consectetur ipsam.', '1564226753', 0, 1, 53, 144),
(696, 'Repellendus ut.', '1564226753', 1, 0, 40, 14),
(697, 'Officia et et.', '1564226753', 1, 0, 95, 161),
(698, 'Ut facilis eos autem.', '1564226754', 0, 1, 148, 131),
(699, 'Voluptates.', '1564226754', 0, 0, 65, 153),
(700, 'Nihil nam.', '1564226754', 0, 1, 106, 195),
(701, 'Minima eaque vitae corrupti.', '1564226754', 1, 1, 43, 14),
(702, 'Soluta ad provident.', '1564226754', 0, 1, 50, 46),
(703, 'Omnis cumque quas in.', '1564226754', 0, 0, 176, 83),
(704, 'Tenetur suscipit.', '1564226754', 1, 0, 54, 136),
(705, 'Aut tenetur minus.', '1564226754', 0, 0, 53, 180),
(706, 'Molestiae neque non.', '1564226754', 0, 0, 137, 87),
(707, 'Porro ullam sed.', '1564226754', 1, 0, 2, 104),
(708, 'Deserunt fuga.', '1564226754', 1, 1, 53, 161),
(709, 'Aut ex.', '1564226754', 1, 0, 84, 172),
(710, 'Voluptas esse.', '1564226754', 0, 0, 205, 140),
(711, 'Nihil qui.', '1564226754', 0, 1, 185, 161),
(712, 'Quas veniam.', '1564226754', 0, 1, 95, 91),
(713, 'Modi sunt doloremque fugiat rerum.', '1564226754', 1, 1, 204, 141),
(714, 'Eligendi illum.', '1564226754', 0, 1, 173, 170),
(715, 'Magnam autem voluptas corrupti.', '1564226754', 1, 0, 71, 97),
(716, 'Ut consequatur natus possimus.', '1564226754', 0, 1, 109, 192),
(717, 'Veniam rerum omnis.', '1564226754', 0, 0, 127, 50),
(718, 'Voluptatum consequatur ipsam.', '1564226754', 1, 1, 149, 174),
(719, 'Tempora deleniti numquam saepe nihil accusamus.', '1564226754', 1, 0, 127, 63),
(720, 'Earum cupiditate eos.', '1564226754', 0, 1, 129, 89),
(721, 'Fuga quae assumenda reiciendis corporis pariatur.', '1564226754', 1, 0, 3, 26),
(722, 'Est id accusantium.', '1564226754', 1, 0, 81, 187),
(723, 'Et aperiam necessitatibus et quam.', '1564226754', 1, 0, 73, 56),
(724, 'Provident cum.', '1564226754', 0, 0, 2, 5),
(725, 'Nam dolore quia.', '1564226754', 0, 1, 53, 148),
(726, 'Sit.', '1564226754', 0, 0, 196, 139),
(727, 'Sint ut molestias.', '1564226755', 0, 1, 147, 158),
(728, 'Eum voluptas ipsam.', '1564226755', 1, 0, 104, 58),
(729, 'Fuga modi.', '1564226755', 1, 0, 110, 84),
(730, 'Earum ex.', '1564226755', 1, 0, 171, 153),
(731, 'Qui at ducimus laudantium omnis ut.', '1564226755', 0, 0, 162, 28),
(732, 'Saepe fugiat.', '1564226755', 0, 1, 25, 80),
(733, 'Blanditiis.', '1564226755', 0, 0, 50, 119),
(734, 'Rem praesentium corporis explicabo.', '1564226755', 0, 1, 72, 42),
(735, 'Vero eos quod.', '1564226755', 0, 0, 113, 49),
(736, 'Dolorum odio.', '1564226755', 0, 0, 5, 114),
(737, 'Tempora assumenda nam.', '1564226755', 1, 0, 99, 150),
(738, 'In recusandae eos sapiente.', '1564226755', 0, 1, 136, 67),
(739, 'Qui ex numquam.', '1564226755', 0, 0, 82, 167),
(740, 'Voluptatem rerum minus exercitationem.', '1564226755', 0, 1, 72, 206),
(741, 'Itaque consequuntur repellat.', '1564226755', 0, 1, 26, 163),
(742, 'Eum rerum vel.', '1564226755', 0, 1, 191, 22),
(743, 'Sed commodi.', '1564226755', 0, 1, 111, 35),
(744, 'Accusamus.', '1564226755', 1, 0, 123, 18),
(745, 'Quo aut suscipit beatae sapiente rerum.', '1564226755', 0, 0, 3, 119),
(746, 'Qui quae corporis voluptas quo.', '1564226755', 0, 0, 30, 58),
(747, 'Voluptas reprehenderit rerum.', '1564226755', 1, 0, 92, 20),
(748, 'Eum ullam voluptas.', '1564226755', 0, 1, 13, 98),
(749, 'Tempore labore laboriosam.', '1564226755', 1, 0, 154, 193),
(750, 'Animi consequatur vel.', '1564226755', 1, 0, 178, 130),
(751, 'Voluptas ut.', '1564226755', 1, 1, 90, 31),
(752, 'Numquam qui qui.', '1564226755', 1, 0, 177, 126),
(753, 'Et omnis.', '1564226755', 1, 1, 121, 151),
(754, 'Voluptas adipisci illum fugit voluptas.', '1564226755', 1, 0, 163, 190),
(755, 'Nisi illum consequatur commodi et ut.', '1564226755', 0, 0, 106, 69),
(756, 'Assumenda quis.', '1564226755', 0, 0, 65, 65),
(757, 'Aperiam quia qui.', '1564226755', 0, 1, 110, 116),
(758, 'Possimus et aut.', '1564226755', 1, 0, 124, 60),
(759, 'Veritatis ex.', '1564226755', 0, 1, 135, 203),
(760, 'Et esse.', '1564226755', 1, 0, 42, 127),
(761, 'Necessitatibus voluptas id aspernatur perspiciatis itaque.', '1564226755', 1, 1, 167, 82),
(762, 'Nam pariatur aut.', '1564226755', 1, 0, 165, 51),
(763, 'Soluta et aliquid.', '1564226755', 1, 1, 17, 29),
(764, 'Et non numquam et quia.', '1564226755', 1, 0, 105, 28),
(765, 'Temporibus velit ipsa ullam et.', '1564226755', 0, 1, 157, 23),
(766, 'Delectus eum.', '1564226755', 1, 1, 187, 153),
(767, 'Quasi et.', '1564226755', 1, 1, 181, 14),
(768, 'Quisquam delectus voluptas.', '1564226755', 0, 0, 23, 67),
(769, 'Voluptas qui vel.', '1564226755', 1, 0, 43, 22),
(770, 'Fugit praesentium qui.', '1564226755', 1, 1, 58, 167),
(771, 'Sit aut.', '1564226755', 0, 0, 115, 125),
(772, 'Assumenda alias assumenda sint labore.', '1564226755', 0, 0, 177, 9),
(773, 'Qui voluptatibus reprehenderit accusamus ducimus.', '1564226755', 1, 0, 9, 22),
(774, 'Aut recusandae.', '1564226755', 1, 1, 74, 113),
(775, 'Accusamus.', '1564226755', 1, 1, 34, 85),
(776, 'Debitis.', '1564226755', 0, 1, 10, 189),
(777, 'Aspernatur voluptates deserunt eligendi.', '1564226755', 1, 1, 143, 91),
(778, 'Impedit consectetur unde quidem ut numquam.', '1564226755', 0, 1, 16, 71),
(779, 'Quibusdam hic.', '1564226756', 1, 0, 50, 160),
(780, 'Beatae doloremque omnis.', '1564226756', 1, 1, 67, 165),
(781, 'Minus iste et.', '1564226756', 0, 1, 155, 78),
(782, 'Iusto aut reiciendis.', '1564226756', 0, 1, 49, 105),
(783, 'Iste qui eos sapiente.', '1564226756', 0, 0, 117, 124),
(784, 'Et voluptatem.', '1564226756', 0, 0, 147, 110),
(785, 'Non similique libero unde.', '1564226756', 1, 0, 70, 137),
(786, 'Molestiae ut corporis et nihil.', '1564226756', 0, 0, 189, 34),
(787, 'Nam expedita saepe porro iusto.', '1564226756', 1, 0, 129, 80),
(788, 'Exercitationem et distinctio.', '1564226756', 1, 1, 103, 149),
(789, 'Consequatur sit rerum dolorem consequatur vitae.', '1564226756', 1, 0, 71, 16),
(790, 'Quia.', '1564226756', 1, 0, 147, 183),
(791, 'Nulla ea.', '1564226756', 0, 0, 117, 21),
(792, 'Eius corporis ut error.', '1564226756', 0, 1, 106, 51),
(793, 'Quos assumenda.', '1564226756', 0, 0, 129, 15),
(794, 'Velit.', '1564226756', 1, 0, 53, 129),
(795, 'Sequi sed.', '1564226756', 0, 0, 61, 8),
(796, 'Dolorem placeat consequuntur et nemo.', '1564226756', 1, 1, 80, 183),
(797, 'Ullam consectetur dignissimos illo culpa.', '1564226756', 1, 1, 191, 38),
(798, 'Dolores in et.', '1564226756', 0, 1, 86, 8),
(799, 'Voluptatum ducimus.', '1564226756', 1, 0, 50, 157),
(800, 'Harum dolor nulla.', '1564226756', 1, 0, 12, 38),
(801, 'Ut et.', '1564226756', 0, 1, 155, 149),
(802, 'Qui iure.', '1564226756', 1, 0, 181, 19),
(803, 'Eos explicabo consequatur animi.', '1564226756', 1, 0, 139, 131),
(804, 'Et tenetur.', '1564226756', 0, 1, 115, 30),
(805, 'Ratione porro ducimus.', '1564226756', 0, 1, 41, 125),
(806, 'Maiores sit.', '1564226756', 1, 0, 46, 205),
(807, 'Nam modi quisquam.', '1564226756', 0, 0, 27, 49),
(808, 'Excepturi ullam voluptatum voluptas.', '1564226756', 0, 1, 189, 6),
(809, 'Cupiditate eos consequatur ratione eveniet.', '1564226756', 0, 0, 38, 36),
(810, 'Quam omnis fuga excepturi.', '1564226756', 0, 0, 20, 21),
(811, 'Sunt nostrum vitae qui odit.', '1564226756', 1, 1, 23, 82),
(812, 'Est hic.', '1564226756', 1, 1, 6, 157),
(813, 'Repellendus omnis.', '1564226756', 1, 1, 172, 18),
(814, 'Omnis sequi provident debitis.', '1564226756', 1, 0, 122, 99),
(815, 'Qui.', '1564226756', 1, 0, 78, 26),
(816, 'Enim rerum voluptatem.', '1564226756', 1, 1, 113, 58),
(817, 'Doloribus ipsam illum vitae suscipit repudiandae.', '1564226756', 0, 0, 97, 120),
(819, 'Impedit est et.', '1564226756', 1, 0, 183, 105),
(820, 'Error at sit.', '1564226756', 0, 0, 114, 159),
(821, 'Ut sit deleniti.', '1564226756', 0, 0, 5, 203),
(822, 'Delectus inventore nam sapiente.', '1564226756', 1, 0, 181, 199),
(823, 'Animi laborum blanditiis.', '1564226756', 0, 1, 104, 71),
(824, 'Dolorem quia dignissimos.', '1564226756', 0, 0, 43, 82),
(825, 'Ut maxime.', '1564226756', 1, 1, 47, 119),
(826, 'Quae minus ullam.', '1564226756', 1, 0, 4, 177),
(827, 'Laboriosam placeat suscipit.', '1564226756', 0, 1, 201, 116),
(828, 'Sed.', '1564226756', 1, 0, 37, 176),
(829, 'Nesciunt cumque facilis ut.', '1564226756', 0, 1, 106, 31),
(830, 'Et velit est iste.', '1564226756', 0, 1, 5, 97),
(831, 'Molestias ut.', '1564226756', 1, 1, 107, 98),
(832, 'Doloribus non labore odit.', '1564226756', 0, 0, 65, 34),
(833, 'Non qui.', '1564226756', 1, 1, 205, 36),
(834, 'Natus consectetur quia quo.', '1564226756', 0, 0, 137, 117),
(835, 'Quae dolorem suscipit est qui.', '1564226756', 1, 0, 124, 28),
(836, 'Perspiciatis quisquam sed labore deleniti esse.', '1564226756', 0, 1, 185, 19),
(837, 'Aut.', '1564226756', 0, 1, 110, 27),
(838, 'Voluptatem iste est.', '1564226756', 1, 1, 27, 87),
(839, 'Est maiores.', '1564226756', 1, 0, 128, 10),
(840, 'Quis error corrupti neque ipsum doloribus.', '1564226756', 0, 0, 81, 38),
(841, 'Quisquam odio incidunt accusantium.', '1564226756', 0, 1, 150, 183),
(842, 'Voluptatum eos beatae quos dolorum.', '1564226756', 0, 0, 20, 64),
(843, 'Eligendi ratione.', '1564226756', 0, 0, 104, 134),
(844, 'Quae.', '1564226756', 0, 1, 103, 24),
(845, 'Voluptates itaque.', '1564226756', 1, 0, 3, 31),
(846, 'Assumenda voluptate aperiam asperiores.', '1564226756', 1, 0, 137, 15),
(847, 'Ratione ullam eligendi quaerat et.', '1564226756', 0, 1, 157, 63),
(848, 'Dolores omnis libero itaque dolorem.', '1564226756', 0, 0, 42, 201),
(849, 'Beatae vel.', '1564226756', 1, 0, 77, 29),
(850, 'Consequatur sit mollitia nobis.', '1564226756', 1, 1, 125, 7),
(851, 'Sapiente est voluptates officiis et.', '1564226757', 0, 1, 25, 57),
(852, 'Est expedita.', '1564226757', 0, 0, 126, 53),
(853, 'In ipsam.', '1564226757', 0, 1, 156, 8),
(854, 'Delectus voluptatem nemo.', '1564226757', 0, 0, 151, 171),
(855, 'Omnis maiores.', '1564226757', 0, 1, 175, 34),
(856, 'Delectus molestiae.', '1564226757', 1, 0, 198, 25),
(857, 'Sapiente.', '1564226757', 1, 1, 201, 206);
INSERT INTO `messages_list` (`id`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`, `userId`, `toId`) VALUES
(858, 'Sint recusandae illum.', '1564226757', 0, 0, 116, 150),
(859, 'Laborum quaerat velit.', '1564226757', 1, 1, 8, 50),
(860, 'Dolorem odit dolor.', '1564226757', 0, 1, 138, 43),
(861, 'Qui culpa numquam veritatis adipisci.', '1564226757', 0, 1, 35, 169),
(862, 'Aut sunt reprehenderit quam.', '1564226757', 1, 0, 81, 120),
(863, 'Et.', '1564226757', 0, 0, 73, 177),
(864, 'Debitis perspiciatis a numquam consequatur totam.', '1564226757', 0, 0, 182, 12),
(865, 'Eos ullam.', '1564226757', 1, 1, 100, 139),
(866, 'Molestiae et.', '1564226757', 1, 0, 32, 53),
(867, 'Est.', '1564226757', 0, 0, 164, 42),
(868, 'Maiores sit cupiditate.', '1564226757', 0, 0, 130, 55),
(869, 'Enim voluptate.', '1564226757', 0, 1, 125, 106),
(870, 'Veniam.', '1564226757', 1, 0, 32, 38),
(871, 'Repellat nam.', '1564226757', 1, 0, 130, 90),
(872, 'Autem est impedit.', '1564226757', 0, 0, 196, 46),
(873, 'Velit omnis consequatur impedit vitae natus.', '1564226757', 0, 1, 161, 97),
(874, 'Quis voluptas incidunt ut.', '1564226757', 0, 0, 124, 135),
(875, 'Id voluptatem.', '1564226757', 1, 1, 35, 175),
(876, 'Exercitationem qui quibusdam dolorem sit.', '1564226757', 1, 1, 12, 196),
(877, 'Sunt beatae.', '1564226757', 1, 0, 132, 101),
(878, 'Eius commodi.', '1564226757', 1, 0, 156, 133),
(879, 'Cum laboriosam odit.', '1564226757', 1, 0, 196, 20),
(880, 'Non impedit.', '1564226757', 1, 1, 62, 200),
(881, 'Quas iusto sapiente architecto natus cumque.', '1564226757', 0, 0, 143, 205),
(882, '111', '1564228076', 1, 0, 157, 1),
(883, 'Omnis sapiente.', '1564226757', 1, 1, 109, 117),
(884, 'Ratione soluta at.', '1564226757', 1, 1, 34, 183),
(885, 'Optio consequatur.', '1564226757', 0, 1, 75, 32),
(886, 'Facere commodi veniam.', '1564226757', 1, 1, 150, 112),
(887, 'Id vel quia.', '1564226757', 1, 1, 88, 167),
(888, 'Et incidunt voluptas numquam.', '1564226757', 1, 1, 125, 105),
(889, 'Neque eos et nesciunt maiores dolorem.', '1564226757', 0, 1, 68, 18),
(890, 'Omnis perspiciatis deleniti id quibusdam.', '1564226757', 1, 0, 70, 153),
(891, 'Reiciendis.', '1564226757', 1, 0, 99, 175),
(892, 'Necessitatibus ipsam est illum consequuntur.', '1564226757', 0, 0, 40, 143),
(893, 'Consequatur laborum.', '1564226757', 0, 0, 47, 48),
(894, 'Eos consequuntur voluptatem quas.', '1564226757', 1, 1, 4, 149),
(895, 'Cum aut facere.', '1564226757', 0, 0, 185, 58),
(896, 'Numquam vero consequatur.', '1564226757', 0, 1, 130, 32),
(897, 'Rerum ab molestias.', '1564226757', 0, 1, 184, 191),
(898, 'Ut qui sit.', '1564226757', 0, 1, 82, 109),
(899, 'Possimus.', '1564226757', 0, 0, 99, 25),
(900, 'Et similique.', '1564226757', 0, 0, 72, 67),
(901, 'Sequi aut.', '1564226757', 0, 1, 184, 111),
(902, 'Aut.', '1564226757', 1, 1, 196, 37),
(903, 'Et molestiae nemo.', '1564226757', 0, 1, 99, 161),
(904, 'Enim possimus vitae.', '1564226757', 0, 1, 94, 19),
(905, 'Ipsam tempora veniam aliquam.', '1564226757', 1, 0, 182, 82),
(906, 'In ut.', '1564226757', 1, 0, 17, 192),
(907, 'Ex modi et.', '1564226757', 1, 1, 33, 38),
(908, 'Minus nobis maiores.', '1564226757', 1, 0, 125, 81),
(909, 'Iste ipsam ipsa.', '1564226757', 0, 1, 103, 204),
(910, 'Neque non.', '1564226757', 0, 0, 119, 115),
(911, 'Corporis necessitatibus.', '1564226757', 0, 0, 57, 65),
(912, 'Et iusto dolorum.', '1564226757', 0, 1, 72, 103),
(913, 'Commodi.', '1564226757', 0, 0, 70, 185),
(914, 'Voluptatem rerum praesentium dolorem ut.', '1564226757', 0, 0, 192, 168),
(915, 'Et voluptatem et dolor.', '1564226757', 0, 1, 107, 152),
(916, 'Ipsa.', '1564226757', 0, 1, 125, 8),
(917, 'Modi eum quasi ut pariatur.', '1564226757', 0, 0, 155, 125),
(918, 'Reprehenderit mollitia quo nisi sed.', '1564226757', 1, 1, 150, 201),
(919, 'Quidem quia.', '1564226757', 0, 1, 4, 116),
(920, 'Ipsum laudantium sint esse.', '1564226757', 1, 0, 127, 204),
(921, 'Laudantium magni.', '1564226757', 0, 1, 147, 158),
(922, 'Odio ea id voluptatem officia.', '1564226757', 1, 0, 131, 184),
(923, 'Consequatur doloribus.', '1564226757', 1, 0, 154, 190),
(924, 'Quidem excepturi rerum dolor adipisci.', '1564226757', 1, 0, 14, 182),
(925, 'Et porro aut mollitia.', '1564226757', 0, 0, 198, 185),
(926, 'Et tempore qui facilis.', '1564226758', 0, 1, 206, 115),
(927, 'Alias exercitationem.', '1564226758', 0, 0, 28, 56),
(928, 'Modi sunt totam.', '1564226758', 1, 1, 116, 121),
(929, 'Ut earum.', '1564226758', 0, 0, 97, 148),
(930, 'Voluptatum.', '1564226758', 1, 0, 72, 24),
(931, 'Deleniti debitis nulla qui.', '1564226758', 1, 0, 104, 50),
(932, 'Et consequatur.', '1564226758', 0, 0, 147, 144),
(933, 'Veritatis officiis amet voluptas velit.', '1564226758', 0, 1, 61, 179),
(934, 'Harum.', '1564226758', 1, 0, 79, 155),
(935, 'Non ipsum cumque illum quasi.', '1564226758', 0, 0, 174, 127),
(936, 'Quaerat modi tempore.', '1564226758', 1, 1, 11, 142),
(937, 'Natus.', '1564226758', 0, 0, 143, 102),
(938, 'Sit.', '1564226758', 0, 1, 5, 105),
(939, 'Numquam est quam.', '1564226758', 0, 0, 25, 14),
(940, 'Dolores omnis provident ullam.', '1564226758', 0, 0, 100, 89),
(941, 'Maxime qui quia quod.', '1564226758', 0, 0, 5, 198),
(942, 'Voluptates optio.', '1564226758', 0, 0, 14, 4),
(943, 'Iste cumque eum magni.', '1564226758', 0, 0, 120, 44),
(944, 'Fuga voluptas saepe soluta.', '1564226758', 0, 1, 180, 175),
(945, 'Accusantium qui repudiandae consequatur tempore.', '1564226758', 0, 1, 36, 182),
(946, 'Qui ipsum.', '1564226758', 0, 1, 50, 94),
(947, 'In.', '1564226758', 1, 0, 70, 69),
(948, 'Ullam enim.', '1564226758', 0, 1, 121, 94),
(949, 'Non sequi quos.', '1564226758', 0, 1, 166, 148),
(950, 'Quam dolorum eum.', '1564226758', 0, 1, 83, 40),
(951, 'Sit mollitia.', '1564226758', 0, 1, 7, 21),
(952, 'Numquam molestiae quidem ut enim.', '1564226758', 0, 0, 46, 203),
(953, 'Voluptatem.', '1564226758', 1, 1, 181, 152),
(954, 'Est rerum.', '1564226758', 1, 0, 166, 87),
(955, 'Reprehenderit iure consequatur.', '1564226758', 1, 0, 110, 48),
(956, 'Facere qui iure dolorem.', '1564226758', 0, 0, 75, 143),
(957, 'Incidunt quia quo.', '1564226758', 0, 0, 4, 95),
(958, 'Quia quasi soluta vitae eos aut.', '1564226758', 1, 0, 144, 94),
(959, 'Voluptatem itaque provident.', '1564226758', 0, 1, 51, 28),
(960, 'Saepe ab.', '1564226758', 0, 1, 115, 172),
(961, 'Quia assumenda qui.', '1564226758', 0, 0, 199, 21),
(962, 'In totam.', '1564226758', 1, 0, 186, 184),
(963, 'Iusto consequatur laudantium totam nostrum.', '1564226758', 1, 1, 159, 198),
(964, 'Excepturi tempora voluptatibus quidem quis.', '1564226758', 0, 1, 99, 2),
(965, 'Fuga dolor nemo.', '1564226758', 0, 1, 150, 186),
(966, 'Sint odit eaque.', '1564226758', 1, 1, 156, 41),
(967, 'Illum aspernatur ut veritatis eius.', '1564226758', 1, 1, 75, 91),
(968, 'Totam veniam neque quo nihil.', '1564226758', 1, 0, 13, 56),
(969, 'Architecto itaque.', '1564226758', 0, 1, 20, 28),
(970, 'Rerum unde a.', '1564226758', 1, 1, 122, 57),
(971, 'Quia harum veritatis doloribus eum.', '1564226758', 0, 1, 121, 68),
(972, 'Doloribus qui.', '1564226758', 0, 0, 12, 42),
(973, 'Asperiores.', '1564226758', 0, 1, 170, 121),
(974, 'Dolor aliquid ea.', '1564226758', 0, 0, 12, 54),
(975, 'Repellat nesciunt.', '1564226758', 0, 1, 17, 2),
(976, 'Quo illo consectetur quo.', '1564226758', 1, 0, 16, 102),
(977, 'Natus cum quo.', '1564226758', 1, 0, 6, 195),
(978, 'Consequatur animi.', '1564226758', 1, 1, 196, 109),
(979, 'Eveniet.', '1564226758', 0, 0, 9, 10),
(980, 'Accusamus minima quae.', '1564226758', 1, 0, 124, 94),
(981, 'Consectetur earum est ut ut.', '1564226758', 0, 1, 133, 7),
(982, 'Et est.', '1564226758', 0, 1, 74, 149),
(983, 'Nihil voluptatibus deserunt.', '1564226759', 1, 0, 155, 61),
(984, 'Exercitationem suscipit quis praesentium reprehenderit.', '1564226759', 0, 0, 87, 25),
(985, 'Consequatur.', '1564226759', 0, 1, 76, 74),
(986, 'Voluptas sed.', '1564226759', 1, 0, 112, 168),
(987, 'Nobis sequi.', '1564226759', 1, 1, 35, 142),
(988, 'Ex.', '1564226759', 0, 1, 96, 67),
(989, 'Ducimus molestias consectetur.', '1564226759', 1, 1, 139, 205),
(990, 'Explicabo velit.', '1564226759', 0, 0, 145, 201),
(991, 'Possimus omnis dolorum aut est iure.', '1564226759', 1, 0, 152, 166),
(992, 'Tempora ducimus numquam ab odio.', '1564226759', 1, 1, 93, 160),
(993, 'Debitis necessitatibus tempora quas.', '1564226759', 0, 1, 174, 130),
(994, 'Quia aut facere sit.', '1564226759', 1, 0, 178, 107),
(995, 'Repellendus excepturi.', '1564226759', 0, 1, 52, 166),
(996, 'Eum aperiam debitis rem sunt corporis.', '1564226759', 0, 1, 130, 9),
(997, 'Et numquam odit.', '1564226759', 0, 1, 135, 2),
(998, 'Necessitatibus qui.', '1564226759', 0, 1, 108, 142),
(999, 'Nihil quidem vel.', '1564226759', 0, 1, 10, 201),
(1000, 'Nobis in quasi dolorum ipsam labore.', '1564226759', 0, 0, 29, 78),
(1002, '111', '1564228076', 1, 0, 156, 1),
(1005, '111', '1564228076', 1, 0, 158, 1),
(1007, '111', '1564228076', 1, 0, 159, 1),
(1009, 'Test....', '1564228633', 1, 0, 160, 1),
(1011, '111', '1564228076', 1, 0, 161, 1),
(1013, '111', '1564228076', 1, 0, 162, 1),
(1015, '111', '1564228076', 1, 0, 163, 1),
(1017, '111', '1564228076', 1, 0, 164, 1),
(1019, '111', '1564228076', 1, 0, 165, 1),
(1021, '111', '1564228077', 1, 0, 166, 1),
(1023, '111', '1564228077', 1, 0, 167, 1),
(1025, '111', '1564228077', 1, 0, 168, 1),
(1027, '111', '1564228077', 1, 0, 169, 1),
(1029, '111', '1564228077', 1, 0, 170, 1),
(1031, '111', '1564228077', 1, 0, 171, 1),
(1034, '111', '1564228077', 1, 0, 173, 1),
(1036, '111', '1564228077', 1, 0, 174, 1),
(1038, '111', '1564228077', 1, 0, 175, 1),
(1040, '111', '1564228077', 1, 0, 176, 1),
(1042, '111', '1564228077', 1, 0, 177, 1),
(1044, '111', '1564228077', 1, 0, 178, 1),
(1046, '111', '1564228077', 1, 0, 179, 1),
(1048, 'Hello parents', '1564228667', 1, 0, 180, 1),
(1050, '111', '1564228077', 1, 0, 181, 1),
(1052, '111', '1564228077', 1, 0, 182, 1),
(1054, '111', '1564228077', 1, 0, 183, 1),
(1056, 'Test....', '1564228633', 1, 0, 184, 1),
(1058, '111', '1564228077', 1, 0, 185, 1),
(1060, '111', '1564228077', 1, 0, 186, 1),
(1062, '111', '1564228077', 1, 0, 187, 1),
(1064, '111', '1564228077', 1, 0, 188, 1),
(1066, 'Hello parents', '1564228667', 1, 0, 189, 1),
(1067, '111', '1564228078', 1, 0, 190, 1),
(1069, '111', '1564228078', 1, 0, 191, 1),
(1071, '111', '1564228078', 1, 0, 192, 1),
(1073, '111', '1564228078', 1, 0, 193, 1),
(1075, '111', '1564228078', 1, 0, 194, 1),
(1077, '111', '1564228078', 1, 0, 195, 1),
(1079, '111', '1564228078', 1, 0, 196, 1),
(1081, '111', '1564228078', 1, 0, 197, 1),
(1083, '111', '1564228078', 1, 0, 198, 1),
(1085, '111', '1564228078', 1, 0, 199, 1),
(1087, '111', '1564228078', 1, 0, 200, 1),
(1089, 'Test....', '1564228633', 1, 0, 201, 1),
(1091, '111', '1564228078', 1, 0, 202, 1),
(1093, '111', '1564228078', 1, 0, 203, 1),
(1095, '111', '1564228078', 1, 0, 204, 1),
(1097, '111', '1564228078', 1, 0, 205, 1),
(1099, 'Test....', '1564228633', 1, 0, 206, 1),
(1106, 'Hello parents', '1564228667', 0, 0, 1, 189),
(1107, 'Hello parents', '1564228667', 0, 0, 1, 180);

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
(1, 'Johan Windler', 'employees', 'Quia et ea provident corrupti autem possimus quibusdam dolorem eveniet.', 1564226741, 'Ms. Alexandra Gusikowski'),
(2, 'Easter Roberts', 'parents', 'Aut consequatur quasi quo provident accusamus officia facilis labore.', 1564226741, 'Orrin Becker'),
(3, 'Devin Skiles', 'teachers', 'Beatae autem quia et qui.', 1564226741, 'Bella Mertz II'),
(4, 'Arthur Jacobson', 'employees', 'Sunt consequuntur sed.', 1564226741, 'Dashawn Abshire'),
(5, 'Christa Kohler', 'students', 'Qui amet sit aliquam assumenda est exercitationem reiciendis vel omnis.', 1564226741, 'Mrs. Madisyn Zemlak'),
(6, 'Prof. Albin Hudson IV', 'teachers', 'Sequi aut sit blanditiis error eveniet.', 1564226741, 'Kyra Thompson'),
(7, 'Eryn Connelly MD', 'students', 'Aperiam quia eligendi qui quae excepturi.', 1564226741, 'Ephraim Hermann'),
(8, 'Dr. Cleveland Luettgen', 'parents', 'Expedita voluptates est impedit nobis quo aut ut.', 1564226741, 'Otilia Breitenberg'),
(9, 'Prof. Marc Abbott III', 'parents', 'Voluptas vero sapiente ut alias.', 1564226741, 'Mr. Arely McCullough'),
(10, 'Kianna Conroy', 'parents', 'Commodi incidunt ea qui et eum quae.', 1564226741, 'Dr. Daija Sipes'),
(11, 'Johnnie Koch DDS', 'students', 'Voluptatem voluptates nihil ut ut esse minima accusantium distinctio dolorem.', 1564226741, 'Marina Feest'),
(12, 'Alexie Ankunding MD', 'employees', 'Incidunt cum id quia.', 1564226741, 'Dr. Herbert Mann II'),
(13, 'Prof. Terence Lockman', 'employees', 'Est et eum ut optio temporibus quaerat.', 1564226741, 'Dr. Cody Walsh'),
(14, 'Mr. Kacey Moore', 'employees', 'Laboriosam ut dolores iure earum in maxime nihil modi.', 1564226741, 'Forrest Donnelly'),
(15, 'Sasha Schmeler', 'parents', 'Expedita saepe optio.', 1564226741, 'Ewell Blanda'),
(16, 'Janet Hills', 'employees', 'Voluptas voluptatem accusamus ut est maiores.', 1564226741, 'Leopoldo Bartell'),
(17, 'Wyman Rolfson', 'teachers', 'Blanditiis a inventore tempore esse facere.', 1564226741, 'Prof. Darby Beatty Jr.'),
(18, 'Dr. Herbert Dickens III', 'parents', 'Similique possimus omnis voluptas expedita assumenda.', 1564226741, 'Pablo Mitchell'),
(19, 'Florian Satterfield', 'teachers', 'Odio tenetur consequatur dolores.', 1564226741, 'Brody Wisozk'),
(20, 'Jeremy Torphy', 'teachers', 'Expedita tenetur officia in iste.', 1564226741, 'Ms. Cathryn Halvorson'),
(21, 'Devonte Purdy Jr.', 'students', 'Non sit nostrum expedita corrupti.', 1564226741, 'Laverne Kautzer'),
(22, 'Rhianna Goodwin', 'teachers', 'Perspiciatis et dolorem assumenda quisquam repellendus voluptatibus.', 1564226741, 'Naomie Kiehn Jr.'),
(23, 'Thelma O\'Keefe', 'teachers', 'Et maiores ut vel culpa architecto.', 1564226741, 'Vaughn Gusikowski MD'),
(24, 'Lincoln Hintz', 'employees', 'Explicabo reiciendis praesentium.', 1564226741, 'Pierre Auer V'),
(25, 'Cathryn Bartell PhD', 'parents', 'Ratione voluptas velit eaque vel commodi debitis ad.', 1564226741, 'Flo Deckow'),
(26, 'Khalid Rau', 'employees', 'Sit tempore veniam consequuntur quod aut consequatur vel neque.', 1564226741, 'Dr. Rosemarie Cassin III'),
(27, 'Jensen Haley', 'students', 'Mollitia omnis labore iusto velit.', 1564226741, 'Miss Mia Pacocha DVM'),
(28, 'Kimberly Fay MD', 'teachers', 'Tempore neque sapiente libero repellendus fugit.', 1564226741, 'Sarina Ryan'),
(29, 'Francisco Hamill', 'students', 'Id at officiis est.', 1564226741, 'Alaina Gulgowski'),
(30, 'Dr. Kianna Schinner', 'parents', 'Harum aut facilis.', 1564226741, 'Hermina Klein'),
(31, 'Miss Thelma Kunze IV', 'teachers', 'Nihil voluptate minus exercitationem expedita.', 1564226741, 'Prof. Mathias O\'Connell DDS'),
(32, 'Carlos Hane DVM', 'parents', 'Veniam et aut maiores beatae maiores.', 1564226741, 'Prof. Margaret Howe Jr.'),
(33, 'Amaya Bogisich', 'students', 'Quia modi labore dolor exercitationem dolor.', 1564226741, 'Vita Langworth'),
(34, 'Mr. Van Blick V', 'parents', 'Sunt incidunt illo quisquam consequatur dicta minima eum dolor.', 1564226741, 'Prof. Ariane Bashirian'),
(35, 'Gwendolyn Zboncak V', 'teachers', 'Quos non sint voluptatum est.', 1564226741, 'Stephen Hills'),
(36, 'Rachael Borer', 'students', 'Numquam possimus sit totam qui aut nobis.', 1564226741, 'Prof. Golden Borer Sr.'),
(37, 'Jaden Hansen', 'teachers', 'Ex cum sunt suscipit voluptatem aut.', 1564226741, 'Prof. Eugene Balistreri V'),
(38, 'Mr. Bartholome Stokes MD', 'employees', 'Hic excepturi et dolor odit et voluptatem.', 1564226741, 'Tyler Wuckert'),
(39, 'Dylan Leffler', 'employees', 'Exercitationem voluptate consequatur omnis.', 1564226741, 'Ashton Kuhlman'),
(40, 'Keara Kunze', 'parents', 'Sequi sit sed.', 1564226741, 'Carli Tromp'),
(41, 'Ericka McDermott', 'employees', 'Quo quibusdam labore expedita sunt quidem quia ut impedit molestiae qui.', 1564226741, 'Jasper Dickinson'),
(42, 'Prof. Jerome Smith', 'employees', 'Eligendi quia asperiores perferendis aut tempora est ipsam.', 1564226741, 'Prof. Nyah Considine Sr.'),
(43, 'Elaina O\'Hara', 'teachers', 'Ut iure molestiae et quidem.', 1564226741, 'Thelma Erdman'),
(44, 'Bruce Wolff', 'parents', 'Qui adipisci non qui tempora est doloribus voluptatem.', 1564226741, 'Ms. Ellie Kohler'),
(45, 'Ben Goodwin', 'teachers', 'Illo enim expedita sunt sunt minus.', 1564226741, 'Taya Cole PhD'),
(46, 'Harold Paucek DDS', 'students', 'Libero et ut modi aut.', 1564226741, 'Cornelius Flatley'),
(47, 'Prof. Larue Mills', 'teachers', 'Laudantium rerum numquam nihil itaque rerum sed.', 1564226741, 'Maggie Muller'),
(48, 'Camille Spinka', 'students', 'Autem provident rerum maiores.', 1564226741, 'Prof. Rollin Collins V'),
(49, 'Miss Shakira Haag I', 'teachers', 'Vero eum placeat est qui odit ipsum id.', 1564226741, 'Shaun Hauck'),
(50, 'Catherine Langosh', 'parents', 'Consectetur qui qui qui molestias reiciendis repellat autem dolorem.', 1564226741, 'Prof. Marguerite Brekke MD');

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
(1, 'Omnis eveniet.', 'Officia distinctio quia quisquam sit dolores reiciendis consequatur voluptatem.', 'students', 1564226740, '', 0, 1564226740),
(2, 'Sunt ut est.', 'Ducimus quod est id consequatur ex sequi officiis ut at.', 'students', 1564226740, '', 1, 1564226740),
(3, 'Est non.', 'Et occaecati quas explicabo maiores harum facere aliquam accusamus sequi soluta.', 'students', 1564226740, '', 0, 1564226740),
(4, 'Nulla expedita facilis nihil.', 'Odio recusandae blanditiis nulla dolores exercitationem debitis doloribus in facere ipsam.', 'teacher', 1564226740, '', 1, 1564226740),
(5, 'Autem doloribus eum quia.', 'Non facere ut numquam aliquid commodi recusandae.', 'parents', 1564226740, '', 1, 1564226740),
(6, 'Dolores quaerat nisi repellat non.', 'Reiciendis quidem nisi maxime totam amet molestias blanditiis aut sit facilis quod.', 'all', 1564226740, '', 1, 1564226740),
(7, 'Ad quia sapiente non.', 'Et praesentium temporibus excepturi in et laudantium quia eos dolor neque consequuntur dignissimos numquam.', 'teacher', 1564226740, '', 0, 1564226740),
(8, 'Culpa nihil accusantium veritatis.', 'Illum quas aliquid nesciunt expedita aliquam consequuntur eos.', 'teacher', 1564226740, '', 1, 1564226740),
(9, 'Vitae commodi optio reiciendis.', 'Saepe accusamus recusandae sunt et sit pariatur natus et optio numquam voluptatum.', 'teacher', 1564226740, '', 0, 1564226740),
(10, 'Consequatur sapiente itaque.', 'Beatae dolores temporibus amet sunt veritatis voluptatem possimus nisi ratione illo ratione aliquid.', 'all', 1564226740, '', 0, 1564226740),
(11, 'Laborum impedit quo.', 'Nemo non omnis repudiandae odio autem quis.', 'all', 1564226740, '', 1, 1564226740),
(12, 'Id impedit.', 'Iste enim soluta corporis est dolores officiis sit aliquam voluptate aut doloremque nulla.', 'students', 1564226740, '', 1, 1564226740),
(13, 'Dolorem qui sed.', 'Voluptas est ea voluptas modi aliquam sed est.', 'teacher', 1564226740, '', 0, 1564226740),
(14, 'Nihil ea.', 'Molestiae sequi asperiores eos qui culpa non.', 'students', 1564226740, '', 0, 1564226740),
(15, 'Sit sit commodi voluptatem.', 'Mollitia est temporibus dolorem voluptatem est.', 'all', 1564226740, '', 0, 1564226740),
(16, 'Voluptates ut beatae minima facere.', 'Est dolorum minima voluptas libero labore debitis.', 'students', 1564226740, '', 0, 1564226740),
(17, 'Adipisci esse eos ut soluta.', 'Et non accusantium quisquam perspiciatis non.', 'students', 1564226740, '', 0, 1564226740),
(18, 'Est fugiat sunt ratione.', 'Corporis nihil perferendis explicabo ut.', 'teacher', 1564226740, '', 0, 1564226740),
(19, 'Aperiam est dicta.', 'Aut iure voluptatem optio autem quidem consectetur.', 'parents', 1564226740, '', 0, 1564226740),
(20, 'Error reprehenderit praesentium.', 'Eos blanditiis quisquam aut aspernatur enim ea cumque quia voluptate recusandae deserunt aperiam repellendus.', 'teacher', 1564226740, '', 0, 1564226740);

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
(1, 'message', 'Deleniti possimus deserunt.', 78, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(2, 'message', 'Vero consequatur.', 103, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(3, 'attendance', 'Ut harum beatae aut.', 17, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(4, 'attendance', 'Adipisci reiciendis deleniti quam.', 86, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(5, 'attendance', 'Dicta perferendis.', 194, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(6, 'message', 'Animi veritatis nesciunt.', 122, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(7, 'message', 'Qui libero aut.', 80, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(8, 'message', 'Omnis eos eius nihil.', 83, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(9, 'message', 'Fugiat voluptatem et.', 170, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(10, 'attendance', 'Qui illum.', 19, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(11, 'attendance', 'Ipsam harum.', 188, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(12, 'message', 'Dolorem error aut.', 78, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(13, 'message', 'Itaque architecto.', 153, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:25:59', '2019-07-27 09:25:59'),
(14, 'news', 'Laudantium vitae nihil.', 82, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(15, 'message', 'Rerum ex.', 30, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(16, 'message', 'Rerum fugit error eius temporibus.', 88, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(17, 'message', 'Delectus odit.', 117, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(18, 'message', 'Illo suscipit est laudantium.', 15, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(19, 'message', 'Voluptates sit aut.', 116, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(20, 'attendance', 'Quos nostrum cupiditate.', 180, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(21, 'attendance', 'Recusandae animi.', 163, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(22, 'attendance', 'Adipisci placeat debitis eos.', 75, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(23, 'news', 'Optio nobis.', 194, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(24, 'attendance', 'Minima ullam iste nulla.', 139, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(25, 'news', 'Omnis temporibus quaerat quae.', 34, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(26, 'news', 'Sapiente repudiandae hic quaerat sed.', 168, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(27, 'news', 'Corporis ullam porro ea deserunt.', 55, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(28, 'message', 'Eos est.', 61, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(29, 'message', 'Corporis est.', 45, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(30, 'attendance', 'Officia quidem doloribus aliquid.', 83, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(31, 'news', 'Consequatur atque libero sed accusamus.', 175, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(32, 'attendance', 'Harum consequatur.', 84, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(33, 'message', 'Ullam ab earum.', 3, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(34, 'news', 'Et earum.', 122, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(35, 'news', 'Velit iste suscipit qui.', 135, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(36, 'attendance', 'Eos quod.', 20, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(37, 'attendance', 'Qui quia.', 156, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(38, 'message', 'Ipsa eligendi dolore.', 168, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(39, 'message', 'Officia aut corporis.', 51, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(40, 'message', 'Vel voluptas praesentium sit.', 136, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(41, 'news', 'Est dolorum nulla.', 72, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(42, 'news', 'Adipisci praesentium tempora.', 19, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(43, 'message', 'Aliquid beatae officiis.', 121, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(44, 'news', 'Atque eos et.', 44, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(45, 'attendance', 'Qui sit saepe.', 69, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(46, 'message', 'Corrupti eius.', 152, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(47, 'attendance', 'Est amet.', 162, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(48, 'attendance', 'Sunt eveniet quis.', 187, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(49, 'message', 'Earum molestiae.', 8, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(50, 'message', 'Eligendi ut.', 183, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(51, 'news', 'Sapiente eaque sed.', 154, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:00', '2019-07-27 09:26:00'),
(52, 'attendance', 'Quidem aut est in.', 48, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(53, 'attendance', 'Quam rerum unde.', 157, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(54, 'message', 'Asperiores sint illum.', 145, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(55, 'news', 'Voluptatem aut omnis.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(56, 'news', 'Doloribus non a.', 180, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(57, 'news', 'Itaque nisi veritatis dignissimos.', 39, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(58, 'message', 'Deserunt ad incidunt dolores.', 124, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(59, 'message', 'Libero iusto distinctio.', 188, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(60, 'news', 'Accusantium labore quo cum.', 177, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(61, 'attendance', 'Aliquam voluptate voluptatem.', 87, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(62, 'message', 'Officiis corporis.', 150, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(63, 'attendance', 'Id temporibus hic iusto.', 70, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(64, 'message', 'Quia ullam qui.', 48, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(65, 'attendance', 'Non voluptate.', 85, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(66, 'attendance', 'Ea est necessitatibus magnam consequatur.', 22, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(67, 'message', 'Omnis sed dignissimos.', 164, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(68, 'news', 'Illum nulla.', 171, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(69, 'news', 'Perferendis eos veritatis.', 21, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(70, 'news', 'Rerum ut.', 191, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(71, 'attendance', 'Illum ad illo quis sit.', 38, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(72, 'message', 'Placeat et.', 25, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(73, 'attendance', 'Voluptatem quas.', 63, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(74, 'news', 'Est ab.', 206, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(75, 'news', 'Id consectetur sequi.', 18, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(76, 'news', 'Quia ea quisquam.', 197, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(77, 'message', 'Sint sint.', 198, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(78, 'message', 'Tempore aspernatur.', 167, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(79, 'message', 'Ab magni provident.', 196, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(80, 'attendance', 'Iusto placeat.', 151, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(81, 'attendance', 'Sunt perspiciatis.', 75, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(82, 'news', 'Quasi quam officiis.', 29, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:01', '2019-07-27 09:26:01'),
(83, 'message', 'Molestias id quisquam.', 37, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(84, 'message', 'Voluptatem quam.', 108, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(85, 'message', 'Accusantium vel harum.', 71, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(86, 'attendance', 'Quidem vitae vitae.', 185, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(87, 'message', 'Est non sed.', 20, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(88, 'news', 'Aperiam facere occaecati eveniet.', 148, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(89, 'news', 'Libero eligendi.', 154, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(90, 'news', 'Eos quos itaque.', 79, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(91, 'message', 'Vel aliquid adipisci aut.', 169, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(92, 'news', 'Beatae laborum.', 53, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(93, 'attendance', 'Dolores recusandae.', 130, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(94, 'message', 'Tempore rerum itaque.', 24, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(95, 'message', 'Et laudantium saepe.', 89, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(96, 'message', 'Est deleniti.', 14, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(97, 'message', 'Modi laborum rem.', 143, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(98, 'news', 'Adipisci eius corrupti.', 50, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(99, 'message', 'Odit consequatur.', 135, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(100, 'message', 'Quae omnis qui.', 25, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:02', '2019-07-27 09:26:02'),
(101, 'attendance', 'Et rem sit in.', 183, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(102, 'attendance', 'Fuga commodi nihil inventore.', 79, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(103, 'news', 'Distinctio velit ad.', 183, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(104, 'attendance', 'Quaerat sit odio.', 96, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(105, 'attendance', 'Suscipit consequatur.', 71, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(106, 'news', 'Maxime accusantium culpa.', 37, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(107, 'message', 'Sint eaque delectus.', 181, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(108, 'attendance', 'Esse doloremque quae minus reiciendis.', 147, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(109, 'attendance', 'Totam in excepturi.', 45, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(110, 'news', 'Minima eveniet non neque et.', 87, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(111, 'news', 'Nobis maiores dolores non sed.', 117, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(112, 'attendance', 'Quisquam quod et.', 44, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(113, 'news', 'Incidunt qui.', 35, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(114, 'news', 'Nesciunt et qui sit.', 69, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(115, 'news', 'Veniam reprehenderit.', 117, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(116, 'message', 'Blanditiis dolorem at.', 86, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(117, 'message', 'Officia voluptatem eos.', 37, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(118, 'message', 'Est rerum.', 9, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(119, 'attendance', 'Libero nemo ea impedit.', 27, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:03', '2019-07-27 09:26:03'),
(120, 'news', 'Unde repudiandae.', 130, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(121, 'message', 'Neque minus dolore et.', 17, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(122, 'message', 'Ad sed eos.', 85, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(123, 'message', 'Est ducimus sit est.', 203, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(124, 'news', 'Accusantium voluptatibus.', 41, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(125, 'attendance', 'Veniam quo voluptates.', 101, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(126, 'news', 'Id molestiae totam.', 21, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(127, 'attendance', 'Aut fugiat molestias iusto ducimus.', 123, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(128, 'message', 'Voluptas reprehenderit.', 137, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(129, 'attendance', 'Quo dolore laudantium.', 174, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(130, 'message', 'Ex labore alias.', 17, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(131, 'message', 'Est aut.', 186, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(132, 'attendance', 'Ad quos.', 10, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(133, 'message', 'Placeat pariatur voluptatibus.', 102, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:04', '2019-07-27 09:26:04'),
(134, 'message', 'Qui eius.', 177, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(135, 'message', 'Ipsum rerum.', 76, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(136, 'attendance', 'Vel cum.', 76, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(137, 'message', 'Et rem modi consectetur dolores.', 172, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(138, 'attendance', 'Animi perspiciatis.', 19, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(139, 'news', 'Doloribus corporis vitae.', 90, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(140, 'message', 'Voluptas doloribus.', 107, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(141, 'news', 'Cum sed pariatur.', 67, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(142, 'attendance', 'Explicabo id.', 31, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(143, 'attendance', 'Qui hic.', 59, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(144, 'attendance', 'Molestias nihil dolorem.', 40, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(145, 'news', 'Voluptatem incidunt sunt officia.', 125, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(146, 'message', 'Pariatur ut.', 38, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(147, 'attendance', 'Necessitatibus quas eum.', 28, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(148, 'message', 'Magni nihil accusamus.', 59, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(149, 'attendance', 'Cumque repellendus.', 4, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:05', '2019-07-27 09:26:05'),
(150, 'news', 'Ratione perspiciatis.', 102, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(151, 'attendance', 'Ipsam unde expedita.', 168, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(152, 'news', 'Quam repellat consequatur.', 150, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(153, 'message', 'Sapiente rem aperiam ut.', 200, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(154, 'message', 'Veniam et cum.', 134, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(155, 'message', 'Nihil dolorem nam.', 95, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(156, 'news', 'Aut dolore.', 194, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(157, 'news', 'Aperiam voluptate delectus.', 109, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(158, 'news', 'Nisi rerum ad.', 157, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(159, 'news', 'Impedit repellendus excepturi.', 147, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(160, 'message', 'Voluptatum blanditiis dolor.', 172, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(161, 'news', 'Et non.', 78, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(162, 'attendance', 'Aut ratione occaecati quasi labore.', 117, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(163, 'message', 'Consequuntur sed facere.', 189, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(164, 'attendance', 'Qui consectetur tenetur.', 180, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(165, 'message', 'Error odio ea sunt nulla.', 68, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(166, 'message', 'Quae mollitia expedita.', 132, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(167, 'news', 'Voluptas excepturi.', 114, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:06', '2019-07-27 09:26:06'),
(168, 'message', 'Laboriosam voluptatem sapiente.', 136, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(169, 'attendance', 'Nemo aspernatur vero est.', 179, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(170, 'message', 'Incidunt iusto.', 80, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(171, 'news', 'Earum aut explicabo.', 25, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(172, 'message', 'Eos voluptatum ab nisi.', 145, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(173, 'attendance', 'Veritatis voluptatem ut est.', 66, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(174, 'message', 'Sapiente error.', 8, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(175, 'attendance', 'Ducimus ea iure.', 165, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(176, 'message', 'Voluptas dolores ab.', 83, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(177, 'attendance', 'Corporis nemo.', 34, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(178, 'attendance', 'Dolore possimus recusandae ratione.', 51, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(179, 'news', 'Aperiam vel facilis cupiditate.', 93, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(180, 'message', 'Molestiae perferendis quia.', 164, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(181, 'attendance', 'A iure facilis inventore.', 37, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(182, 'attendance', 'Ea libero quisquam.', 73, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(183, 'news', 'Facere delectus placeat hic.', 103, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(184, 'news', 'Quam nisi qui nostrum.', 94, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(185, 'attendance', 'Cupiditate consectetur.', 32, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(186, 'news', 'Illo eum rerum dolorem.', 200, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(187, 'attendance', 'Recusandae et nostrum.', 112, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(188, 'message', 'Ad illo aut inventore.', 141, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(189, 'attendance', 'Esse distinctio sit provident.', 153, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(190, 'news', 'Ut est.', 199, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(191, 'attendance', 'Quo reprehenderit impedit.', 16, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(192, 'message', 'Omnis sunt quae.', 135, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(193, 'message', 'Quo eius doloremque minima.', 118, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(194, 'attendance', 'Officia eaque sit rerum.', 178, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(195, 'attendance', 'Vitae voluptate dolores quidem.', 143, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(196, 'news', 'Consequatur recusandae.', 43, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(197, 'message', 'Quasi recusandae voluptatem et.', 1, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(198, 'news', 'Rem dolorem quo.', 110, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(199, 'news', 'Debitis et sunt.', 45, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(200, 'message', 'Quis a tenetur.', 159, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(201, 'attendance', 'Quaerat alias.', 93, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:07', '2019-07-27 09:26:07'),
(202, 'message', 'Qui doloribus delectus.', 108, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(203, 'news', 'Nostrum sit.', 107, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(204, 'news', 'Esse consequuntur beatae.', 60, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(205, 'news', 'Est tempore repudiandae.', 26, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(206, 'attendance', 'Sit ut hic.', 34, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(207, 'attendance', 'Molestias qui recusandae.', 74, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(208, 'news', 'Fuga hic.', 191, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(209, 'message', 'Qui voluptas aliquam.', 30, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(210, 'attendance', 'Temporibus sunt quo.', 57, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(211, 'news', 'Vero at esse.', 90, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(212, 'news', 'Error rerum voluptas voluptas.', 60, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(213, 'attendance', 'Rerum ducimus quam ea.', 130, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(214, 'message', 'Nihil omnis numquam.', 54, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(215, 'attendance', 'Officiis aliquam.', 55, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(216, 'attendance', 'Quo voluptatem dolorem.', 42, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(217, 'news', 'Iste aut quis harum.', 27, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(218, 'news', 'Eveniet error.', 199, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(219, 'news', 'Harum officia.', 124, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(220, 'news', 'Ut velit.', 185, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(221, 'message', 'Est molestiae distinctio.', 19, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(222, 'message', 'Sint enim.', 175, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(223, 'attendance', 'Autem in eaque.', 85, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(224, 'news', 'Impedit ea.', 26, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(225, 'message', 'Consequatur assumenda enim.', 172, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(226, 'attendance', 'Consequatur recusandae error sit.', 57, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(227, 'news', 'Ut exercitationem.', 78, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(228, 'news', 'Vel at laborum at.', 195, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(229, 'message', 'Numquam neque aut.', 162, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(230, 'news', 'Nulla quisquam.', 166, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(231, 'news', 'Omnis totam occaecati.', 132, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(232, 'attendance', 'Qui vel maiores.', 150, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(233, 'message', 'Praesentium magni.', 6, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(234, 'attendance', 'Aperiam ducimus.', 108, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(235, 'message', 'Similique nisi voluptatibus.', 79, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(236, 'news', 'Placeat voluptate quidem.', 167, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(237, 'message', 'Quibusdam officia numquam.', 26, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(238, 'news', 'Et omnis est.', 6, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(239, 'attendance', 'Quasi facere necessitatibus mollitia vero.', 1, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(240, 'news', 'Occaecati ut facilis.', 62, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(241, 'message', 'Inventore nemo similique.', 170, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(242, 'attendance', 'Soluta ab aut.', 94, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(243, 'attendance', 'Sit minima molestiae commodi.', 152, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(244, 'message', 'Voluptates quo odit.', 146, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(245, 'attendance', 'Et error doloribus.', 49, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(246, 'news', 'Quam modi consequatur.', 7, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(247, 'attendance', 'Dolores earum tenetur.', 116, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:08', '2019-07-27 09:26:08'),
(248, 'news', 'Voluptate aperiam aliquam.', 186, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(249, 'message', 'Ea animi.', 102, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(250, 'attendance', 'Sequi reprehenderit.', 151, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(251, 'attendance', 'Autem quis pariatur.', 183, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(252, 'news', 'Enim asperiores.', 145, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(253, 'message', 'Ipsam eaque ipsum vel dicta.', 29, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(254, 'attendance', 'Pariatur perspiciatis mollitia mollitia.', 32, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(255, 'news', 'Corporis et deserunt itaque numquam.', 46, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(256, 'attendance', 'Distinctio ullam doloribus non.', 39, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(257, 'news', 'Velit ea.', 59, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(258, 'attendance', 'Sit odio neque.', 65, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(259, 'news', 'Laudantium sit officiis omnis.', 79, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(260, 'news', 'Tenetur ipsam iste qui.', 76, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(261, 'attendance', 'Perferendis voluptate omnis modi est.', 154, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(262, 'attendance', 'Suscipit aliquid optio.', 141, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(263, 'message', 'Consequatur quia consequuntur.', 180, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(264, 'message', 'Suscipit ut magni.', 86, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(265, 'message', 'Ratione eveniet consequatur.', 179, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(266, 'attendance', 'Debitis eius nihil.', 189, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(267, 'attendance', 'Saepe vel doloremque.', 67, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(268, 'attendance', 'Dolor distinctio.', 25, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(269, 'news', 'Exercitationem neque assumenda aut.', 160, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(270, 'message', 'Sed eos magnam adipisci.', 150, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(271, 'message', 'Perferendis aperiam non hic.', 70, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(272, 'attendance', 'Aliquam natus.', 4, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(273, 'message', 'Repellendus magnam.', 186, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(274, 'message', 'Porro sint.', 13, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(275, 'news', 'Dolore cupiditate.', 195, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(276, 'attendance', 'Rerum aut ex.', 158, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(277, 'attendance', 'Neque alias rerum est.', 181, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(278, 'message', 'Omnis impedit.', 67, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(279, 'attendance', 'Qui exercitationem maxime.', 145, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(280, 'message', 'Officia pariatur ut.', 193, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(281, 'news', 'Sit quaerat quia eum.', 123, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(282, 'news', 'Ut aspernatur.', 72, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(283, 'message', 'Dolor numquam sit dolor.', 35, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(284, 'news', 'Ut occaecati qui.', 190, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(285, 'news', 'Mollitia id.', 185, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(286, 'message', 'Necessitatibus quas aut sit.', 165, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(287, 'attendance', 'Voluptate distinctio voluptates.', 198, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(288, 'news', 'Quisquam excepturi optio.', 124, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(289, 'message', 'Alias quia.', 129, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(290, 'message', 'Hic dolor occaecati.', 121, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(291, 'message', 'Voluptatem voluptatem repudiandae occaecati suscipit.', 178, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(292, 'message', 'Recusandae maiores.', 107, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(293, 'news', 'Sit adipisci omnis est.', 102, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:09', '2019-07-27 09:26:09'),
(294, 'attendance', 'Sit architecto reprehenderit et a.', 19, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:10', '2019-07-27 09:26:10'),
(295, 'attendance', 'Doloribus harum reprehenderit in inventore.', 193, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:10', '2019-07-27 09:26:10'),
(296, 'message', 'Ut eos ducimus nemo.', 59, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:10', '2019-07-27 09:26:10'),
(297, 'news', 'Qui molestiae sed sunt ipsam.', 69, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-27 09:26:10', '2019-07-27 09:26:10'),
(298, 'attendance', 'Culpa facilis voluptas.', 150, '0000-00-00 00:00:00', 'message', NULL, '2019-07-27 09:26:10', '2019-07-27 09:26:10'),
(299, 'message', 'Libero velit assumenda.', 175, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:10', '2019-07-27 09:26:10'),
(300, 'attendance', 'Facilis alias hic ad.', 124, '0000-00-00 00:00:00', 'news', NULL, '2019-07-27 09:26:10', '2019-07-27 09:26:10');

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
(1, 'et_174', NULL, 142, 'Facilis voluptas eligendi nemo consectetur.', 920, 5, 0, 740, 0, 1564226725, 1568055282, 0, NULL, NULL, NULL, NULL, 1, '0'),
(2, 'architecto_241', NULL, 128, 'Id aliquid aut molestias dignissimos saepe repellat culpa.', 310, 6, 43, 780, 0, 1564226725, 1572703602, 0, NULL, NULL, NULL, NULL, 0, '0'),
(3, 'dolores_449', 'Adipisci quis aut eaque necessitatibus autem suscipit explicabo earum.', 140, 'Porro placeat deserunt dolorem.', 340, 36, 0, 130, 1, 1564226725, 1567768435, 0, NULL, NULL, NULL, NULL, 1, '0'),
(4, 'qui_339', 'Assumenda quis porro porro laboriosam qui qui architecto omnis nihil.', 108, 'Dolor suscipit praesentium mollitia quos.', 230, 50, 36, 530, 0, 1564226725, 1566995974, 0, NULL, NULL, NULL, NULL, 1, '0'),
(5, 'consequatur_806', NULL, 115, 'Fugit consequatur optio quas nihil quos dolorem quasi.', 250, 0, 0, 940, 0, 1564226726, 1573068108, 0, NULL, NULL, NULL, NULL, 0, '0'),
(6, 'aut_564', 'Omnis voluptatem ex ratione quibusdam aliquid et harum ut mollitia.', 121, 'Eum aut ad iste ab.', 190, 0, 0, 200, 1, 1564226726, 1570307978, 0, NULL, NULL, NULL, NULL, 0, '0'),
(7, 'vel_135', 'Aut earum dolorum quia et maiores voluptas.', 108, 'Distinctio voluptatem error et sequi cumque ex.', 80, 0, 0, 200, 0, 1564226726, 1566723121, 0, NULL, NULL, NULL, NULL, 1, '0'),
(8, 'earum_127', 'Eum iste perspiciatis sunt fugiat est reiciendis dolores voluptate.', 142, 'Impedit optio minus eius.', 110, 0, 0, 340, 1, 1564226726, 1567357412, 0, NULL, NULL, NULL, NULL, 0, '0'),
(9, 'aliquid_123', 'Et illum id ea odio et dolores voluptates.', 142, 'Possimus impedit doloribus error sunt molestiae natus.', 640, 0, 33, 570, 1, 1564226726, 1573261823, 0, NULL, NULL, NULL, NULL, 1, '0'),
(10, 'vitae_994', NULL, 126, 'Quisquam nisi dolores et sunt aut quis dignissimos.', 700, 3, 0, 410, 0, 1564226726, 1570201226, 0, NULL, NULL, NULL, NULL, 0, '0'),
(11, 'est_721', NULL, 137, 'Recusandae tempore doloremque voluptatum dolores at maxime.', 880, 0, 0, 110, 1, 1564226726, 1570559277, 0, NULL, NULL, NULL, NULL, 0, '0'),
(12, 'est_965', NULL, 112, 'Dolorum incidunt delectus ea sapiente nesciunt.', 390, 43, 0, 850, 0, 1564226726, 1569695093, 0, NULL, NULL, NULL, NULL, 0, '0'),
(13, 'expedita_494', NULL, 141, 'Et ullam omnis alias at.', 820, 0, 0, 440, 1, 1564226726, 1569651129, 0, NULL, NULL, NULL, NULL, 0, '0'),
(14, 'fuga_517', NULL, 126, 'Quaerat culpa perspiciatis corporis.', 750, 19, 0, 320, 1, 1564226726, 1566250724, 0, NULL, NULL, NULL, NULL, 1, '0'),
(15, 'ut_413', NULL, 145, 'Voluptatum tempore exercitationem ab nulla.', 890, 3, 0, 320, 0, 1564226726, 1573112883, 0, NULL, NULL, NULL, NULL, 1, '0'),
(16, 'nobis_935', 'In temporibus id eos voluptatem laborum et est deserunt sit voluptas.', 110, 'Et illum consequatur exercitationem consequatur non rerum.', 490, 35, 0, 470, 1, 1564226726, 1568077072, 0, NULL, NULL, NULL, NULL, 0, '0'),
(17, 'voluptas_407', 'Dolores quia eum iste repellat ullam nesciunt.', 113, 'Omnis debitis cupiditate in voluptas est officiis.', 70, 46, 0, 530, 0, 1564226726, 1572951336, 0, NULL, NULL, NULL, NULL, 1, '0'),
(18, 'id_359', NULL, 108, 'Est minima tempora cupiditate provident atque.', 890, 0, 0, 900, 1, 1564226726, 1569999564, 0, NULL, NULL, NULL, NULL, 1, '0'),
(19, 'in_466', 'Nesciunt adipisci rerum non ut maiores quasi ut cumque expedita omnis.', 117, 'Recusandae occaecati quidem asperiores ex nihil.', 990, 0, 0, 680, 0, 1564226726, 1570680047, 0, NULL, NULL, NULL, NULL, 0, '0'),
(20, 'dolores_332', NULL, 145, 'Velit non nobis architecto aliquid.', 630, 0, 0, 880, 0, 1564226726, 1566380549, 0, NULL, NULL, NULL, NULL, 1, '0'),
(21, 'a_597', NULL, 110, 'Incidunt et voluptatem perspiciatis quia voluptas culpa distinctio.', 120, 0, 0, 800, 1, 1564226726, 1565787002, 0, NULL, NULL, NULL, NULL, 0, '0'),
(22, 'id_208', NULL, 135, 'Natus dolores qui ipsam dolore laboriosam ut.', 260, 10, 21, 910, 0, 1564226726, 1570308634, 0, NULL, NULL, NULL, NULL, 1, '0'),
(23, 'officiis_365', NULL, 149, 'Sed labore ea corporis qui ipsam accusamus.', 540, 0, 0, 390, 0, 1564226726, 1568788402, 0, NULL, NULL, NULL, NULL, 0, '0'),
(24, 'inventore_570', 'Non impedit pariatur ducimus voluptas ea aliquam ipsum non deleniti.', 113, 'Recusandae vero voluptatibus facilis alias earum.', 900, 36, 13, 630, 0, 1564226726, 1570574781, 0, NULL, NULL, NULL, NULL, 0, '0'),
(25, 'nesciunt_675', 'Et harum totam fugit quia recusandae tempore blanditiis.', 140, 'Magnam magnam natus earum ipsam quaerat.', 700, 0, 0, 90, 0, 1564226726, 1565469292, 0, NULL, NULL, NULL, NULL, 1, '0'),
(26, 'molestias_323', 'Quae ex iusto nihil nihil vel.', 110, 'Quae et itaque ullam fugit illo.', 990, 0, 0, 840, 0, 1564226726, 1566822528, 0, NULL, NULL, NULL, NULL, 0, '0'),
(27, 'quis_537', NULL, 112, 'Voluptatum accusamus aut aut quasi.', 340, 25, 0, 660, 0, 1564226726, 1566498013, 0, NULL, NULL, NULL, NULL, 0, '0'),
(28, 'id_158', NULL, 105, 'Et ducimus quis rem enim.', 80, 0, 0, 360, 1, 1564226726, 1573034459, 0, NULL, NULL, NULL, NULL, 0, '0'),
(29, 'dolorum_779', 'Nulla repellat aspernatur est expedita veritatis corporis nobis ad et in.', 136, 'Ad adipisci sed tempore unde sequi.', 900, 4, 37, 450, 0, 1564226726, 1567210845, 0, NULL, NULL, NULL, NULL, 1, '0'),
(30, 'aut_245', 'Adipisci debitis maxime ullam facilis inventore voluptate.', 122, 'Ut velit minus consequatur sit et delectus.', 810, 0, 0, 230, 0, 1564226726, 1569922570, 0, NULL, NULL, NULL, NULL, 1, '0'),
(31, 'magni_340', NULL, 136, 'Cupiditate animi voluptatum inventore sit blanditiis.', 650, 38, 0, 840, 1, 1564226726, 1569527628, 0, NULL, NULL, NULL, NULL, 0, '0'),
(32, 'unde_891', NULL, 149, 'Soluta dignissimos vel qui consequatur magnam molestias quis.', 980, 28, 0, 600, 1, 1564226726, 1566110078, 0, NULL, NULL, NULL, NULL, 0, '0'),
(33, 'consequatur_615', 'Eius qui tempora laboriosam totam quas nihil vero.', 145, 'Ex quia accusantium et voluptatem.', 250, 50, 0, 720, 0, 1564226726, 1568575014, 0, NULL, NULL, NULL, NULL, 0, '0'),
(34, 'omnis_793', NULL, 117, 'Blanditiis rerum dolor quasi veniam perspiciatis.', 700, 27, 29, 130, 1, 1564226726, 1567649393, 0, NULL, NULL, NULL, NULL, 0, '0'),
(35, 'voluptatem_228', NULL, 150, 'Molestiae ratione voluptatem et qui eos adipisci dolores.', 520, 27, 20, 190, 0, 1564226726, 1567988327, 0, NULL, NULL, NULL, NULL, 1, '0'),
(36, 'nostrum_872', NULL, 142, 'Vel aut natus laudantium excepturi quos et.', 260, 0, 13, 580, 0, 1564226726, 1568638967, 0, NULL, NULL, NULL, NULL, 1, '0'),
(37, 'modi_879', NULL, 128, 'Fugiat necessitatibus omnis maiores in consequatur a.', 220, 0, 0, 650, 1, 1564226726, 1573359795, 0, NULL, NULL, NULL, NULL, 1, '0'),
(38, 'laboriosam_607', 'Quia tenetur et accusamus sequi hic.', 131, 'Magni animi quam hic voluptatum laudantium ipsa mollitia.', 80, 4, 0, 380, 1, 1564226726, 1571291771, 0, NULL, NULL, NULL, NULL, 0, '0'),
(39, 'quis_896', 'Sunt deserunt dolorem est quidem ad est doloremque.', 142, 'Voluptatem eum voluptas esse iusto unde non ad quod.', 870, 0, 0, 50, 0, 1564226726, 1568813144, 0, NULL, NULL, NULL, NULL, 1, '0'),
(40, 'eos_990', NULL, 136, 'Omnis dolorem molestias sint necessitatibus recusandae repellendus sapiente.', 470, 0, 0, 610, 0, 1564226726, 1571605942, 0, NULL, NULL, NULL, NULL, 1, '0'),
(41, 'unde_558', NULL, 114, 'Rerum consectetur dolore modi dolorum odit eligendi pariatur.', 570, 0, 37, 540, 1, 1564226726, 1565938367, 0, NULL, NULL, NULL, NULL, 1, '0'),
(42, 'inventore_205', 'Eligendi excepturi et et itaque et labore earum.', 114, 'Et sapiente consectetur enim at.', 250, 22, 21, 740, 0, 1564226726, 1567292566, 0, NULL, NULL, NULL, NULL, 1, '0'),
(43, 'esse_214', NULL, 142, 'Non nemo pariatur consequatur qui alias mollitia beatae.', 970, 0, 0, 480, 0, 1564226726, 1568140390, 0, NULL, NULL, NULL, NULL, 0, '0'),
(44, 'ea_215', 'Consequatur nemo aut aspernatur doloribus porro nihil sint.', 130, 'Ullam quia ut ut et et voluptas deserunt.', 140, 4, 0, 290, 0, 1564226726, 1565949453, 0, NULL, NULL, NULL, NULL, 1, '0'),
(45, 'et_565', 'Voluptatem rerum et placeat recusandae fuga excepturi.', 147, 'Repudiandae non est fugit magni dicta non.', 130, 0, 0, 760, 1, 1564226726, 1568592986, 0, NULL, NULL, NULL, NULL, 1, '0'),
(46, 'eaque_978', 'Corporis doloremque officiis recusandae mollitia odit facere vitae quia.', 114, 'Molestiae labore delectus deleniti eveniet aut sint.', 180, 1, 19, 960, 1, 1564226726, 1569765230, 0, NULL, NULL, NULL, NULL, 0, '0'),
(47, 'iusto_959', 'Veniam corrupti ea totam et et voluptas.', 108, 'Laborum ut est dicta tenetur laudantium facere qui.', 150, 10, 49, 500, 1, 1564226726, 1572583874, 0, NULL, NULL, NULL, NULL, 0, '0'),
(48, 'voluptatem_764', NULL, 114, 'Odio maiores laudantium cum est consequuntur.', 650, 0, 0, 820, 1, 1564226726, 1571199779, 0, NULL, NULL, NULL, NULL, 0, '0'),
(49, 'ratione_644', NULL, 121, 'Doloremque non omnis id cupiditate velit dolores eius.', 680, 38, 4, 820, 1, 1564226726, 1567182311, 0, NULL, NULL, NULL, NULL, 0, '0'),
(50, 'voluptas_630', 'Et officiis doloremque et sint ex velit ipsam nostrum.', 130, 'Nulla sint reiciendis assumenda ex rem officia.', 990, 0, 11, 490, 1, 1564226726, 1573527137, 0, NULL, NULL, NULL, NULL, 1, '0'),
(51, 'ipsam_944', NULL, 150, 'Error et ab corporis molestiae eos voluptates quia.', 100, 29, 0, 710, 0, 1564226726, 1570606788, 0, NULL, NULL, NULL, NULL, 1, '0'),
(52, 'iste_905', NULL, 150, 'Rerum numquam dignissimos error.', 790, 24, 18, 510, 0, 1564226726, 1567570173, 0, NULL, NULL, NULL, NULL, 0, '0'),
(53, 'doloremque_463', NULL, 145, 'Corporis qui sapiente magni itaque vel.', 340, 8, 0, 790, 0, 1564226726, 1570949924, 0, NULL, NULL, NULL, NULL, 1, '0'),
(54, 'ex_895', NULL, 110, 'Nihil eum non laboriosam nulla corrupti debitis possimus.', 870, 0, 0, 840, 1, 1564226726, 1565245442, 0, NULL, NULL, NULL, NULL, 1, '0'),
(55, 'inventore_236', NULL, 142, 'Provident fuga voluptatum odio sunt et repellat fugiat maiores.', 640, 0, 13, 370, 0, 1564226726, 1569458959, 0, NULL, NULL, NULL, NULL, 1, '0'),
(56, 'distinctio_638', 'Praesentium nihil et dolor voluptatem veniam.', 130, 'Cumque sit consequatur qui aut amet dolorem quia.', 440, 45, 18, 420, 0, 1564226727, 1573011300, 0, NULL, NULL, NULL, NULL, 0, '0'),
(57, 'accusamus_159', 'Consequuntur ad ut et aut est at qui.', 117, 'Beatae nisi quia quia architecto ut necessitatibus fugiat.', 760, 0, 28, 730, 0, 1564226727, 1570350252, 0, NULL, NULL, NULL, NULL, 1, '0'),
(58, 'asperiores_524', NULL, 122, 'Minus facere neque rerum quas expedita.', 750, 0, 0, 970, 0, 1564226727, 1567898231, 0, NULL, NULL, NULL, NULL, 0, '0'),
(59, 'ut_108', 'Distinctio fugiat incidunt laborum corrupti et a.', 110, 'Fugiat perspiciatis corrupti deserunt ipsam dicta cumque.', 1000, 0, 43, 320, 1, 1564226727, 1566144501, 0, NULL, NULL, NULL, NULL, 0, '0'),
(60, 'possimus_339', NULL, 141, 'Eum natus accusantium aliquam doloremque.', 850, 0, 0, 820, 1, 1564226727, 1567739881, 0, NULL, NULL, NULL, NULL, 1, '0'),
(61, 'deleniti_264', 'Ducimus atque sunt modi doloremque repellat numquam aut unde et magnam tenetur.', 128, 'Distinctio eum provident autem dolore deserunt.', 650, 0, 0, 120, 0, 1564226727, 1566388214, 0, NULL, NULL, NULL, NULL, 0, '0'),
(62, 'provident_984', NULL, 142, 'Dolor reiciendis sit et quibusdam culpa voluptatem at.', 970, 5, 0, 470, 1, 1564226727, 1572669436, 0, NULL, NULL, NULL, NULL, 0, '0'),
(63, 'accusamus_744', 'Dolor sit eos quas itaque odit facilis.', 155, 'Quia vel ut ducimus saepe.', 980, 20, 0, 970, 1, 1564226727, 1567841321, 0, NULL, NULL, NULL, NULL, 1, '0'),
(64, 'voluptate_426', 'Autem aut non sed qui dolorem qui est deserunt similique fuga.', 136, 'Ipsum fugiat nam doloribus quos est.', 130, 0, 0, 800, 0, 1564226727, 1571368225, 0, NULL, NULL, NULL, NULL, 1, '0'),
(65, 'omnis_661', NULL, 121, 'Saepe pariatur quia omnis provident repudiandae quas.', 770, 50, 0, 820, 1, 1564226727, 1565985144, 0, NULL, NULL, NULL, NULL, 0, '0'),
(66, 'itaque_613', NULL, 140, 'Qui maiores inventore et nihil.', 980, 0, 0, 240, 1, 1564226727, 1572864232, 0, NULL, NULL, NULL, NULL, 0, '0'),
(67, 'est_368', 'Vero earum nesciunt doloremque minima ab unde aut veniam totam culpa.', 118, 'Qui ut sit minima placeat quas recusandae eum.', 400, 0, 8, 430, 1, 1564226727, 1566635074, 0, NULL, NULL, NULL, NULL, 1, '0'),
(68, 'architecto_677', NULL, 155, 'Harum facilis harum ipsum debitis id et.', 640, 9, 0, 280, 1, 1564226727, 1567187057, 0, NULL, NULL, NULL, NULL, 1, '0'),
(69, 'aperiam_596', NULL, 137, 'Voluptatem sapiente aut totam quis amet qui doloremque.', 70, 0, 9, 220, 1, 1564226727, 1570522534, 0, NULL, NULL, NULL, NULL, 0, '0'),
(70, 'perferendis_670', 'Totam dolores tempora ea sit quam et rerum pariatur necessitatibus provident.', 114, 'Et corrupti quia nemo ut reprehenderit.', 170, 4, 0, 1000, 1, 1564226727, 1565585663, 0, NULL, NULL, NULL, NULL, 0, '0'),
(71, 'voluptatem_175', NULL, 120, 'Dignissimos voluptatem quibusdam vel impedit sit.', 290, 30, 16, 720, 1, 1564226727, 1573212363, 0, NULL, NULL, NULL, NULL, 1, '0'),
(72, 'excepturi_268', 'Omnis facere enim ut magnam animi unde repellendus impedit nulla magnam.', 124, 'Voluptatem odio eveniet soluta labore.', 770, 0, 7, 890, 0, 1564226727, 1566143106, 0, NULL, NULL, NULL, NULL, 0, '0'),
(73, 'et_279', NULL, 150, 'Sed qui ut aut.', 340, 3, 14, 650, 0, 1564226727, 1573374503, 0, NULL, NULL, NULL, NULL, 0, '0'),
(74, 'a_342', 'Id unde nisi modi eum harum.', 108, 'Ut delectus velit dicta ab voluptatem laboriosam cum libero.', 500, 0, 0, 590, 1, 1564226727, 1573036554, 0, NULL, NULL, NULL, NULL, 0, '0'),
(75, 'labore_596', NULL, 149, 'Eaque voluptate doloremque odio vero voluptatem quia qui.', 90, 0, 33, 450, 1, 1564226727, 1569385738, 0, NULL, NULL, NULL, NULL, 0, '0'),
(76, 'perspiciatis_787', NULL, 150, 'Voluptas quo dolorem illo cum debitis omnis beatae.', 630, 0, 14, 520, 0, 1564226727, 1573764477, 0, NULL, NULL, NULL, NULL, 0, '0'),
(77, 'quia_956', 'Vel iure dolor qui aliquid natus dolorem officiis et porro.', 108, 'Laudantium voluptatem sed officiis suscipit et.', 950, 13, 37, 700, 1, 1564226727, 1569111894, 0, NULL, NULL, NULL, NULL, 1, '0'),
(78, 'placeat_757', 'Ut minus unde commodi sunt porro.', 145, 'Dolor iure nostrum esse.', 110, 0, 0, 770, 1, 1564226727, 1568768480, 0, NULL, NULL, NULL, NULL, 0, '0'),
(79, 'eaque_703', NULL, 140, 'Suscipit mollitia autem autem porro perspiciatis velit saepe et.', 650, 40, 48, 910, 1, 1564226727, 1570824881, 0, NULL, NULL, NULL, NULL, 0, '0'),
(80, 'unde_449', 'Error veniam ipsam nisi cum modi autem.', 126, 'Molestiae laborum ullam incidunt est dolor.', 180, 35, 0, 850, 1, 1564226727, 1566823796, 0, NULL, NULL, NULL, NULL, 1, '0'),
(81, 'nihil_815', 'Voluptatem occaecati voluptatem voluptatum maxime itaque optio.', 124, 'Aspernatur aut porro enim quia.', 850, 0, 0, 810, 0, 1564226727, 1565363544, 0, NULL, NULL, NULL, NULL, 1, '0'),
(82, 'cum_453', NULL, 131, 'Quae possimus rem impedit doloribus id voluptas.', 980, 0, 30, 230, 1, 1564226727, 1566048267, 0, NULL, NULL, NULL, NULL, 1, '0'),
(83, 'dolores_706', NULL, 109, 'Officia necessitatibus sit esse sunt dolorem repudiandae.', 900, 0, 10, 140, 1, 1564226727, 1573450873, 0, NULL, NULL, NULL, NULL, 0, '0'),
(84, 'quo_611', 'Mollitia eum vitae ut accusamus non velit officiis nemo.', 130, 'Rerum et quisquam distinctio debitis.', 850, 11, 9, 1000, 1, 1564226727, 1569070920, 0, NULL, NULL, NULL, NULL, 0, '0'),
(85, 'reiciendis_669', 'Alias voluptate voluptate et quisquam placeat ut veritatis sunt hic.', 114, 'Dolore ut aut porro.', 720, 31, 0, 820, 0, 1564226727, 1572305985, 0, NULL, NULL, NULL, NULL, 0, '0'),
(86, 'molestiae_949', NULL, 136, 'Assumenda impedit eos porro voluptatem repudiandae ut ut earum.', 890, 22, 37, 510, 0, 1564226727, 1570576410, 0, NULL, NULL, NULL, NULL, 1, '0'),
(87, 'itaque_481', NULL, 155, 'Fugiat harum ab iure qui at.', 690, 29, 8, 310, 1, 1564226727, 1570491314, 0, NULL, NULL, NULL, NULL, 1, '0'),
(88, 'dolor_370', 'Est sequi illum quia voluptas natus autem temporibus maxime sapiente.', 137, 'Necessitatibus odit corrupti veniam expedita aut voluptatem.', 500, 0, 18, 990, 0, 1564226727, 1567569243, 0, NULL, NULL, NULL, NULL, 1, '0'),
(89, 'quae_351', 'Illo quisquam facere aspernatur fugiat.', 114, 'Accusantium et distinctio qui expedita blanditiis.', 560, 0, 0, 120, 0, 1564226727, 1565549149, 0, NULL, NULL, NULL, NULL, 0, '0'),
(90, 'iste_699', NULL, 130, 'Libero sunt exercitationem reprehenderit quo illo eum iusto.', 620, 19, 14, 180, 1, 1564226727, 1572558068, 0, NULL, NULL, NULL, NULL, 0, '0'),
(91, 'explicabo_668', NULL, 110, 'Reprehenderit ut saepe et id quisquam.', 180, 15, 0, 110, 1, 1564226727, 1570546556, 0, NULL, NULL, NULL, NULL, 0, '0'),
(92, 'eaque_362', 'Nostrum tempore autem cupiditate velit ipsam sit voluptatibus aliquid qui eos.', 135, 'Odit nulla animi molestiae ut necessitatibus ut.', 720, 0, 0, 930, 1, 1564226727, 1568105701, 0, NULL, NULL, NULL, NULL, 0, '0'),
(93, 'ipsa_609', 'Eum necessitatibus et illo laboriosam voluptas dignissimos.', 108, 'Ut voluptatibus molestiae saepe possimus quidem totam.', 420, 0, 9, 820, 0, 1564226727, 1565656784, 0, NULL, NULL, NULL, NULL, 0, '0'),
(94, 'qui_314', NULL, 117, 'Dolor porro error dolorum a qui.', 50, 0, 42, 710, 1, 1564226728, 1568306782, 0, NULL, NULL, NULL, NULL, 0, '0'),
(95, 'et_788', 'Aut consequuntur qui quis qui est dignissimos et.', 105, 'Voluptatum enim deleniti vel nam dolor nostrum.', 590, 0, 0, 510, 0, 1564226728, 1569558075, 0, NULL, NULL, NULL, NULL, 1, '0'),
(96, 'consequatur_921', 'At voluptate totam nobis est est quia voluptatum.', 149, 'Cupiditate et qui molestiae.', 600, 0, 0, 740, 1, 1564226728, 1565707926, 0, NULL, NULL, NULL, NULL, 0, '0'),
(97, 'dolorem_316', 'Doloremque omnis quas et modi aliquid culpa nam occaecati.', 149, 'Quis error consequuntur voluptas deserunt nihil qui a.', 390, 0, 0, 890, 0, 1564226728, 1565867081, 0, NULL, NULL, NULL, NULL, 0, '0'),
(98, 'ab_774', NULL, 136, 'Dignissimos quasi distinctio voluptatem quo.', 990, 0, 41, 100, 0, 1564226728, 1572754345, 0, NULL, NULL, NULL, NULL, 0, '0'),
(99, 'similique_194', 'Voluptatum ut est quisquam et dicta possimus unde et iste.', 145, 'Quos atque corrupti architecto.', 210, 14, 11, 430, 0, 1564226728, 1571882482, 0, NULL, NULL, NULL, NULL, 0, '0'),
(100, 'aut_538', 'Aut enim ut laborum ullam nihil dicta porro.', 117, 'Qui laborum blanditiis repellendus voluptate aut illum suscipit.', 510, 0, 31, 210, 0, 1564226728, 1571055049, 0, NULL, NULL, NULL, NULL, 1, '0'),
(101, 'tempore_787', NULL, 113, 'Distinctio atque totam ea illo molestias dolor expedita.', 740, 26, 10, 110, 1, 1564226728, 1569622085, 0, NULL, NULL, NULL, NULL, 0, '0'),
(102, 'veniam_860', 'Ut atque impedit et officia iure.', 145, 'Laboriosam aspernatur in at soluta velit occaecati atque non.', 730, 21, 0, 650, 0, 1564226728, 1572874829, 0, NULL, NULL, NULL, NULL, 0, '0'),
(103, 'est_520', NULL, 114, 'Saepe aut dignissimos debitis quisquam.', 710, 4, 0, 220, 1, 1564226728, 1572056899, 0, NULL, NULL, NULL, NULL, 0, '0'),
(104, 'et_365', NULL, 121, 'Quae fugiat atque nostrum numquam enim saepe neque.', 500, 34, 0, 510, 1, 1564226728, 1571374536, 0, NULL, NULL, NULL, NULL, 1, '0'),
(105, 'eum_601', 'Rerum maiores iste maiores id veritatis eius error quidem voluptas.', 115, 'Ipsum repudiandae et corrupti aliquid itaque asperiores ab.', 420, 0, 0, 80, 0, 1564226728, 1572852358, 0, NULL, NULL, NULL, NULL, 0, '0'),
(106, 'molestias_767', NULL, 136, 'Quo ipsa ab beatae.', 160, 3, 0, 60, 0, 1564226728, 1567787674, 0, NULL, NULL, NULL, NULL, 0, '0'),
(107, 'est_429', NULL, 122, 'Maxime et qui dolores impedit dignissimos natus.', 460, 41, 0, 120, 1, 1564226728, 1567044633, 0, NULL, NULL, NULL, NULL, 0, '0'),
(108, 'qui_468', 'Quia odio esse ut consequatur.', 149, 'Tempora sint nihil possimus repellat.', 930, 0, 6, 460, 0, 1564226728, 1571395042, 0, NULL, NULL, NULL, NULL, 0, '0'),
(109, 'quo_532', NULL, 126, 'Sed modi eos maxime molestiae amet consectetur.', 440, 0, 22, 590, 0, 1564226728, 1566146564, 0, NULL, NULL, NULL, NULL, 1, '0'),
(110, 'rerum_228', 'Et ut at id sunt labore suscipit amet blanditiis assumenda illum.', 117, 'Iusto facere totam quo.', 440, 43, 44, 950, 1, 1564226728, 1572971614, 0, NULL, NULL, NULL, NULL, 1, '0'),
(111, 'nemo_564', NULL, 136, 'Ut natus et ipsa suscipit praesentium aliquid non rerum.', 660, 0, 0, 810, 1, 1564226728, 1570751753, 0, NULL, NULL, NULL, NULL, 0, '0'),
(112, 'a_383', NULL, 113, 'Laudantium recusandae harum voluptatem blanditiis vero cupiditate consectetur.', 500, 23, 0, 80, 0, 1564226728, 1572935733, 0, NULL, NULL, NULL, NULL, 1, '0'),
(113, 'ea_574', 'Facere pariatur aperiam ut labore delectus dolorum doloribus.', 147, 'Animi saepe architecto non porro et sequi et nemo.', 120, 0, 45, 90, 0, 1564226728, 1572975530, 0, NULL, NULL, NULL, NULL, 0, '0'),
(114, 'tempora_123', NULL, 136, 'Debitis dignissimos velit animi unde fuga nobis.', 640, 0, 0, 870, 0, 1564226728, 1570594906, 0, NULL, NULL, NULL, NULL, 0, '0'),
(115, 'perspiciatis_244', 'At voluptatem voluptas laboriosam quae error praesentium qui animi.', 107, 'Hic ab unde sint aut quis.', 500, 16, 11, 980, 0, 1564226728, 1568543521, 0, NULL, NULL, NULL, NULL, 0, '0'),
(116, 'quia_983', NULL, 150, 'Voluptate officiis aut mollitia ducimus esse et eum rerum.', 840, 0, 0, 940, 1, 1564226728, 1573439945, 0, NULL, NULL, NULL, NULL, 1, '0'),
(117, 'est_279', NULL, 137, 'Nam aut inventore illo.', 230, 44, 0, 620, 1, 1564226728, 1572516458, 0, NULL, NULL, NULL, NULL, 1, '0'),
(118, 'in_518', 'Accusantium ipsa dolor quia eos rem.', 136, 'Illum veniam nam cum eos velit voluptatem.', 1000, 0, 0, 300, 0, 1564226728, 1568243116, 0, NULL, NULL, NULL, NULL, 1, '0'),
(119, 'laborum_218', 'At dolore molestiae velit culpa iure voluptatibus et.', 147, 'Mollitia ex at quo eos omnis suscipit.', 890, 32, 31, 60, 0, 1564226728, 1565603918, 0, NULL, NULL, NULL, NULL, 0, '0'),
(120, 'consequatur_212', 'Tempore doloribus optio sunt nesciunt minima quia in delectus aut nulla.', 142, 'Laborum corrupti fugit iste occaecati doloremque fugiat.', 670, 0, 11, 450, 1, 1564226728, 1572117472, 0, NULL, NULL, NULL, NULL, 0, '0'),
(121, 'et_586', 'Ut fuga rerum rerum ut voluptatem consequatur eum nobis.', 139, 'Eos maxime enim eaque rerum soluta nihil debitis.', 640, 0, 0, 210, 0, 1564226728, 1570190581, 0, NULL, NULL, NULL, NULL, 1, '0'),
(122, 'expedita_942', NULL, 126, 'Voluptatem et nemo laborum rem ipsum.', 100, 0, 50, 280, 0, 1564226728, 1571772191, 0, NULL, NULL, NULL, NULL, 1, '0'),
(123, 'maxime_221', NULL, 107, 'Sed enim inventore in consequatur ut aut.', 310, 49, 0, 420, 0, 1564226728, 1574109853, 0, NULL, NULL, NULL, NULL, 0, '0'),
(124, 'consequuntur_223', 'Blanditiis labore aliquid eius non ut eius et et enim.', 121, 'Esse repudiandae doloribus temporibus rerum mollitia.', 420, 4, 0, 660, 0, 1564226728, 1567073451, 0, NULL, NULL, NULL, NULL, 1, '0'),
(125, 'magnam_250', NULL, 126, 'Atque rerum inventore et iure commodi accusamus aut.', 350, 0, 0, 900, 0, 1564226728, 1573085748, 0, NULL, NULL, NULL, NULL, 1, '0'),
(126, 'id_100', 'Dolorum aut laboriosam delectus fuga eum non deleniti dolores corporis possimus saepe.', 145, 'Possimus beatae similique dolorum nemo harum aut occaecati.', 950, 0, 0, 100, 1, 1564226728, 1565449505, 0, NULL, NULL, NULL, NULL, 1, '0'),
(127, 'et_216', NULL, 114, 'Quas illo ipsa ad.', 930, 23, 40, 460, 0, 1564226728, 1573006141, 0, NULL, NULL, NULL, NULL, 0, '0'),
(128, 'maiores_857', 'Accusantium hic dolores nostrum exercitationem ipsa.', 137, 'Cupiditate et dignissimos sit voluptate.', 250, 38, 0, 120, 1, 1564226728, 1572385005, 0, NULL, NULL, NULL, NULL, 0, '0'),
(129, 'amet_544', NULL, 122, 'Repellendus consequatur est modi minima quae iste non.', 530, 47, 0, 490, 1, 1564226728, 1566511632, 0, NULL, NULL, NULL, NULL, 0, '0'),
(130, 'esse_148', 'Id facilis voluptatem qui aperiam vel.', 142, 'Vitae consectetur sunt repellat ut.', 80, 0, 49, 590, 1, 1564226728, 1567983155, 0, NULL, NULL, NULL, NULL, 0, '0'),
(131, 'deserunt_800', 'A id incidunt magni voluptatum velit aperiam.', 113, 'Placeat et occaecati dolores repellat ratione.', 970, 0, 16, 170, 0, 1564226729, 1573301493, 0, NULL, NULL, NULL, NULL, 1, '0'),
(132, 'id_149', NULL, 121, 'Nesciunt dolores in consequuntur perspiciatis quia magni.', 430, 50, 47, 360, 0, 1564226729, 1573806031, 0, NULL, NULL, NULL, NULL, 1, '0'),
(133, 'qui_794', 'Natus in voluptatum eum sed error qui possimus alias ut.', 117, 'Voluptas enim sapiente quisquam et autem ipsum.', 870, 44, 0, 330, 1, 1564226729, 1570420996, 0, NULL, NULL, NULL, NULL, 0, '0'),
(134, 'perspiciatis_871', NULL, 136, 'Repellendus illum corrupti libero non officia quia.', 900, 12, 6, 70, 1, 1564226729, 1565645323, 0, NULL, NULL, NULL, NULL, 1, '0'),
(135, 'quaerat_252', NULL, 121, 'Sunt in consequatur voluptas velit voluptates sint illo fugit.', 1000, 30, 0, 80, 0, 1564226729, 1567846770, 0, NULL, NULL, NULL, NULL, 1, '0'),
(136, 'architecto_182', 'Iure nihil placeat rerum voluptas ipsum.', 110, 'Consectetur minus qui et earum.', 290, 0, 41, 800, 0, 1564226729, 1569090078, 0, NULL, NULL, NULL, NULL, 1, '0'),
(137, 'hic_179', 'Maxime et quis eos quisquam animi sint aut error explicabo quas voluptatem.', 117, 'Neque velit sit minima nemo magnam suscipit ad eius.', 400, 34, 0, 470, 1, 1564226729, 1571026869, 0, NULL, NULL, NULL, NULL, 1, '0'),
(138, 'odio_358', 'Possimus nihil ratione fuga consequatur est aspernatur velit eos sed aut.', 117, 'Est enim doloremque molestiae.', 460, 50, 15, 410, 1, 1564226729, 1572053529, 0, NULL, NULL, NULL, NULL, 1, '0'),
(139, 'sed_302', 'Adipisci dolorem et quidem accusantium.', 136, 'In facilis possimus officiis consequuntur id.', 80, 0, 0, 340, 1, 1564226729, 1567076806, 0, NULL, NULL, NULL, NULL, 1, '0'),
(140, 'doloribus_375', NULL, 136, 'Velit blanditiis voluptatibus nam qui mollitia.', 820, 18, 9, 200, 0, 1564226729, 1572158122, 0, NULL, NULL, NULL, NULL, 0, '0'),
(141, 'doloremque_538', NULL, 147, 'Repellat voluptatum nesciunt reprehenderit repellendus voluptatem ex nesciunt.', 530, 0, 0, 480, 1, 1564226729, 1569725995, 0, NULL, NULL, NULL, NULL, 1, '0'),
(142, 'perspiciatis_105', NULL, 155, 'Laudantium ducimus provident quae commodi pariatur consequatur.', 540, 0, 0, 600, 1, 1564226729, 1573581974, 0, NULL, NULL, NULL, NULL, 0, '0'),
(143, 'eum_540', NULL, 113, 'Harum quasi sunt est assumenda aut nesciunt.', 200, 0, 10, 580, 1, 1564226729, 1568340999, 0, NULL, NULL, NULL, NULL, 1, '0'),
(144, 'reprehenderit_941', 'Impedit quis ut ab doloribus aspernatur est.', 105, 'Aperiam dolor vel accusantium dignissimos.', 610, 46, 0, 430, 0, 1564226729, 1567972307, 0, NULL, NULL, NULL, NULL, 0, '0'),
(145, 'beatae_352', 'Quia deserunt maiores dolore quidem illum.', 152, 'Doloremque quisquam quia non ullam sit.', 230, 0, 0, 950, 0, 1564226729, 1566171192, 0, NULL, NULL, NULL, NULL, 1, '0'),
(146, 'rem_953', NULL, 130, 'Hic non nisi neque a beatae rerum.', 160, 0, 4, 110, 1, 1564226729, 1569780995, 0, NULL, NULL, NULL, NULL, 1, '0'),
(147, 'consectetur_406', 'Autem qui numquam pariatur sed amet qui molestiae iusto voluptas.', 141, 'Voluptatem qui odio maiores porro voluptatum vitae optio quod.', 660, 32, 0, 830, 0, 1564226729, 1569429728, 0, NULL, NULL, NULL, NULL, 0, '0'),
(148, 'eos_479', 'Fugit velit quo maiores saepe ex et illo.', 108, 'Maxime dolorum autem ut voluptas molestiae et.', 480, 0, 0, 530, 0, 1564226729, 1572872096, 0, NULL, NULL, NULL, NULL, 0, '0'),
(149, 'tempore_449', NULL, 117, 'Voluptatibus dolorem dolorem magnam quod occaecati nobis.', 130, 48, 34, 330, 0, 1564226729, 1572120809, 0, NULL, NULL, NULL, NULL, 0, '0'),
(150, 'id_231', NULL, 142, 'Cumque voluptates alias dicta itaque voluptatem blanditiis.', 370, 0, 19, 930, 1, 1564226729, 1570109562, 0, NULL, NULL, NULL, NULL, 1, '0'),
(151, 'corrupti_997', NULL, 112, 'Sit eius commodi saepe in alias sed dicta.', 180, 0, 0, 470, 0, 1564226729, 1568834281, 0, NULL, NULL, NULL, NULL, 1, '0'),
(152, 'quaerat_776', NULL, 108, 'Itaque magni incidunt similique rerum.', 360, 40, 0, 130, 1, 1564226729, 1568221927, 0, NULL, NULL, NULL, NULL, 0, '0'),
(153, 'qui_384', NULL, 114, 'Pariatur possimus ut provident.', 360, 36, 0, 560, 0, 1564226729, 1573228267, 0, NULL, NULL, NULL, NULL, 1, '0'),
(154, 'ad_477', 'Veniam tenetur minus molestiae aut aut aut.', 113, 'Necessitatibus maxime sunt consequuntur.', 400, 0, 47, 950, 1, 1564226729, 1568212184, 0, NULL, NULL, NULL, NULL, 0, '0'),
(155, 'odio_734', 'Dolores quibusdam assumenda mollitia blanditiis quia voluptas sunt et.', 144, 'Praesentium enim et nemo beatae temporibus animi recusandae.', 240, 0, 0, 640, 0, 1564226729, 1568072931, 0, NULL, NULL, NULL, NULL, 1, '0'),
(156, 'accusamus_617', 'Enim consequuntur hic in autem quo temporibus ipsum in omnis.', 124, 'Inventore asperiores in nobis enim architecto aut.', 250, 17, 0, 240, 0, 1564226729, 1566691698, 0, NULL, NULL, NULL, NULL, 1, '0'),
(157, 'accusamus_479', 'Dicta explicabo eum asperiores quia ut neque vero tempore sit.', 108, 'Atque at eum commodi mollitia beatae nisi quia.', 550, 0, 40, 800, 0, 1564226729, 1571698160, 0, NULL, NULL, NULL, NULL, 0, '0'),
(158, 'facere_464', NULL, 135, 'Nihil ut pariatur eum id deserunt.', 250, 0, 0, 350, 0, 1564226729, 1568209003, 0, NULL, NULL, NULL, NULL, 0, '0'),
(159, 'voluptas_420', NULL, 115, 'Odio quisquam magni repellat.', 70, 0, 0, 770, 0, 1564226729, 1573155623, 0, NULL, NULL, NULL, NULL, 1, '0'),
(160, 'molestiae_236', NULL, 110, 'Doloremque repellat cum accusamus dolorem qui odit ipsum.', 810, 0, 9, 460, 0, 1564226729, 1572565605, 0, NULL, NULL, NULL, NULL, 0, '0'),
(161, 'sit_971', 'Harum rerum dolor at optio ratione nemo architecto est aliquam iste.', 136, 'Saepe quia rerum et dolorem quia ut.', 880, 13, 27, 780, 0, 1564226729, 1566464167, 0, NULL, NULL, NULL, NULL, 0, '0'),
(162, 'exercitationem_328', 'Nostrum aliquid voluptatum libero qui et repellendus dignissimos.', 137, 'Repudiandae quis qui voluptatibus distinctio.', 260, 6, 0, 740, 1, 1564226729, 1567566183, 0, NULL, NULL, NULL, NULL, 1, '0'),
(163, 'corrupti_800', 'Nisi ratione id molestiae itaque dolorem sunt id quas odio.', 144, 'Culpa ad at earum blanditiis.', 820, 0, 49, 730, 1, 1564226729, 1566267505, 0, NULL, NULL, NULL, NULL, 1, '0'),
(164, 'aut_301', 'Ut non voluptas ut voluptatem quo sequi architecto qui voluptatem.', 107, 'Aut sint omnis porro est.', 520, 0, 0, 600, 1, 1564226729, 1567426464, 0, NULL, NULL, NULL, NULL, 1, '0'),
(165, 'veniam_668', 'Voluptas maiores qui doloribus et possimus quas consectetur ea molestiae autem.', 117, 'Fuga quidem provident nam corrupti aut eligendi minima.', 180, 0, 20, 230, 0, 1564226729, 1567506247, 0, NULL, NULL, NULL, NULL, 1, '0'),
(166, 'beatae_185', NULL, 147, 'Est qui similique ipsam voluptate asperiores qui.', 920, 0, 0, 940, 1, 1564226729, 1570067232, 0, NULL, NULL, NULL, NULL, 0, '0'),
(167, 'autem_774', NULL, 141, 'Aut tempore consequatur commodi molestiae non fugit.', 220, 0, 0, 150, 1, 1564226729, 1572984510, 0, NULL, NULL, NULL, NULL, 1, '0'),
(168, 'repellat_791', 'Quisquam impedit veritatis consequatur atque aliquid illum et rerum ut.', 122, 'Reprehenderit aut sint perferendis mollitia amet amet reiciendis velit.', 350, 0, 4, 630, 0, 1564226730, 1571168789, 0, NULL, NULL, NULL, NULL, 0, '0'),
(169, 'non_109', 'Fugiat sit dolor voluptatem voluptatibus in dicta laborum architecto non ea.', 124, 'Deleniti aspernatur tempore voluptate.', 950, 25, 10, 130, 1, 1564226730, 1565852047, 0, NULL, NULL, NULL, NULL, 0, '0'),
(170, 'sunt_802', 'Omnis ducimus nihil voluptates et aspernatur voluptatem officiis veniam et illo.', 108, 'Et sed repellat quis voluptas tenetur ut aspernatur.', 580, 4, 36, 760, 0, 1564226730, 1572833379, 0, NULL, NULL, NULL, NULL, 0, '0'),
(171, 'optio_230', NULL, 131, 'Iure eaque quos natus quaerat nihil deserunt.', 690, 30, 0, 150, 1, 1564226730, 1573891123, 0, NULL, NULL, NULL, NULL, 0, '0'),
(172, 'ut_240', 'Excepturi quis voluptas et dignissimos aspernatur dicta necessitatibus culpa iusto esse.', 114, 'Perspiciatis quia quod quibusdam beatae.', 670, 0, 35, 360, 0, 1564226730, 1572115573, 0, NULL, NULL, NULL, NULL, 1, '0'),
(173, 'assumenda_744', 'Necessitatibus recusandae mollitia eum harum vel repudiandae molestiae aut.', 115, 'Commodi cupiditate molestiae excepturi aut provident dolorem sit.', 710, 0, 0, 460, 0, 1564226730, 1565834586, 0, NULL, NULL, NULL, NULL, 0, '0'),
(174, 'ut_958', NULL, 126, 'Ea sed optio quasi voluptate magni voluptatem ipsum.', 520, 0, 7, 1000, 1, 1564226730, 1573892179, 0, NULL, NULL, NULL, NULL, 1, '0'),
(175, 'fugit_890', 'Ut dignissimos consectetur animi nemo voluptatem.', 114, 'Numquam odio soluta impedit cum.', 210, 0, 0, 810, 1, 1564226730, 1569506323, 0, NULL, NULL, NULL, NULL, 1, '0'),
(176, 'alias_279', NULL, 107, 'Eaque eum nesciunt asperiores eos adipisci atque.', 990, 0, 0, 330, 1, 1564226730, 1566311437, 0, NULL, NULL, NULL, NULL, 1, '0'),
(177, 'rerum_948', NULL, 105, 'Totam reiciendis in voluptatem in nihil qui.', 330, 0, 0, 80, 0, 1564226730, 1569234020, 0, NULL, NULL, NULL, NULL, 0, '0'),
(178, 'minus_151', 'Et tenetur eum maiores cupiditate in aut ea.', 114, 'Corrupti nihil pariatur optio praesentium modi omnis dolores.', 500, 25, 35, 460, 1, 1564226730, 1570003330, 0, NULL, NULL, NULL, NULL, 1, '0'),
(179, 'sed_302', 'Labore ut ipsum dolorum fugiat nihil in eum ut iure velit.', 131, 'Incidunt commodi deserunt rerum voluptas rerum.', 230, 0, 0, 730, 0, 1564226730, 1573409405, 0, NULL, NULL, NULL, NULL, 0, '0'),
(180, 'consectetur_447', 'Quia assumenda harum amet quisquam eum voluptatem.', 124, 'Molestiae temporibus earum voluptatum similique ut.', 800, 25, 0, 260, 0, 1564226730, 1569201263, 0, NULL, NULL, NULL, NULL, 0, '0'),
(181, 'dolorem_701', 'Sunt officia maiores sint quae dignissimos odit aut.', 108, 'Fuga sunt tenetur reiciendis.', 920, 0, 28, 750, 1, 1564226730, 1567961711, 0, NULL, NULL, NULL, NULL, 1, '0'),
(182, 'eum_957', 'Ut modi cum adipisci minima minima qui.', 155, 'Accusantium delectus omnis aut est dicta placeat.', 990, 38, 3, 60, 1, 1564226730, 1572727173, 0, NULL, NULL, NULL, NULL, 0, '0'),
(183, 'eveniet_732', 'Optio doloremque modi repellat inventore et sed explicabo et.', 108, 'Quia labore nesciunt ab tempora dolorum labore voluptatem.', 500, 14, 0, 350, 0, 1564226730, 1568149083, 0, NULL, NULL, NULL, NULL, 0, '0'),
(184, 'blanditiis_894', 'Totam a dolor corrupti voluptas distinctio reiciendis saepe laboriosam est.', 121, 'Velit minus amet sint ea nobis tempora.', 460, 0, 0, 530, 0, 1564226730, 1572133682, 0, NULL, NULL, NULL, NULL, 0, '0'),
(185, 'explicabo_153', 'Vel sunt ut dignissimos laudantium mollitia non commodi.', 113, 'Et non doloremque aut est.', 410, 3, 28, 760, 1, 1564226730, 1566807018, 0, NULL, NULL, NULL, NULL, 0, '0'),
(186, 'nihil_790', NULL, 142, 'Eveniet nesciunt ut dolor debitis.', 90, 0, 1, 530, 1, 1564226730, 1566438391, 0, NULL, NULL, NULL, NULL, 0, '0'),
(187, 'error_391', 'Recusandae quibusdam rerum fugiat sit ut aliquam magni quo harum ad.', 113, 'Dignissimos sapiente voluptatum quo.', 150, 20, 15, 130, 0, 1564226730, 1566813272, 0, NULL, NULL, NULL, NULL, 1, '0'),
(188, 'ipsum_340', NULL, 136, 'Quam voluptas atque eveniet aperiam.', 400, 0, 41, 690, 0, 1564226730, 1573178259, 0, NULL, NULL, NULL, NULL, 1, '0'),
(189, 'non_428', NULL, 117, 'Aut et et veritatis quis nesciunt.', 610, 0, 0, 920, 0, 1564226730, 1574051033, 0, NULL, NULL, NULL, NULL, 1, '0'),
(190, 'quam_151', NULL, 136, 'Esse dolor inventore ipsum.', 230, 48, 38, 800, 0, 1564226730, 1566280119, 0, NULL, NULL, NULL, NULL, 1, '0'),
(191, 'facilis_258', NULL, 112, 'Qui voluptate vero porro et eius quas.', 260, 31, 5, 200, 1, 1564226730, 1569354375, 0, NULL, NULL, NULL, NULL, 0, '0'),
(192, 'perferendis_956', NULL, 117, 'Hic commodi nemo molestiae est sequi voluptatem.', 650, 35, 0, 830, 1, 1564226730, 1573797655, 0, NULL, NULL, NULL, NULL, 1, '0'),
(193, 'quae_750', 'Perferendis atque non molestiae id labore.', 114, 'Et voluptatem quisquam provident omnis voluptatum.', 310, 31, 0, 270, 1, 1564226730, 1568510460, 0, NULL, NULL, NULL, NULL, 1, '0'),
(194, 'iusto_738', NULL, 124, 'Laboriosam maiores consequatur et doloribus et et.', 420, 0, 8, 290, 1, 1564226730, 1569639419, 0, NULL, NULL, NULL, NULL, 1, '0'),
(195, 'nesciunt_743', NULL, 140, 'Fugit ratione velit libero perspiciatis voluptatem.', 780, 9, 0, 980, 0, 1564226730, 1572793826, 0, NULL, NULL, NULL, NULL, 1, '0'),
(196, 'repellat_388', NULL, 124, 'Saepe veritatis ut quod excepturi cum vero temporibus eos.', 570, 29, 0, 400, 0, 1564226730, 1571893528, 0, NULL, NULL, NULL, NULL, 0, '0'),
(197, 'rem_856', 'Omnis perferendis voluptatem minus natus sed modi ipsam.', 131, 'Harum sapiente dolorem modi voluptas.', 410, 0, 0, 90, 1, 1564226730, 1572604444, 0, NULL, NULL, NULL, NULL, 1, '0'),
(198, 'perferendis_698', 'Officia dignissimos sit ad eum fuga.', 135, 'Error aperiam officiis sunt.', 850, 0, 11, 560, 0, 1564226730, 1571886503, 0, NULL, NULL, NULL, NULL, 0, '0'),
(199, 'officiis_394', NULL, 135, 'Consectetur voluptas consequatur voluptas modi expedita quia.', 110, 36, 50, 940, 0, 1564226730, 1574151455, 0, NULL, NULL, NULL, NULL, 0, '0'),
(200, 'labore_957', 'Voluptatem labore dolorem sit dolorem praesentium eligendi quibusdam officiis consequatur voluptatem sint.', 124, 'Eius sequi perspiciatis aut dolorem tempora corporis.', 900, 36, 9, 300, 1, 1564226730, 1566503303, 0, NULL, NULL, NULL, NULL, 0, '0'),
(201, 'eos_315', NULL, 140, 'Vitae debitis velit optio dolorem laboriosam.', 730, 0, 38, 490, 1, 1564226730, 1572147209, 0, NULL, NULL, NULL, NULL, 0, '0'),
(202, 'cupiditate_102', NULL, 113, 'Architecto deserunt ipsa sapiente culpa ex eligendi.', 730, 7, 17, 110, 1, 1564226730, 1570588968, 0, NULL, NULL, NULL, NULL, 1, '0'),
(203, 'tempore_512', NULL, 114, 'Et dolores sed iste quia non qui aspernatur.', 930, 0, 0, 590, 0, 1564226730, 1571080307, 0, NULL, NULL, NULL, NULL, 0, '0'),
(204, 'dolorem_186', 'Possimus odit aspernatur non ab vero accusamus doloribus expedita accusamus.', 145, 'Repudiandae hic modi pariatur voluptas sunt.', 430, 13, 0, 610, 0, 1564226730, 1567273213, 0, NULL, NULL, NULL, NULL, 1, '0'),
(205, 'tenetur_346', NULL, 114, 'Neque sapiente voluptas maiores ex cumque eveniet perspiciatis.', 710, 49, 32, 90, 0, 1564226730, 1566479169, 0, NULL, NULL, NULL, NULL, 1, '0'),
(206, 'totam_423', 'Aut fuga tenetur deserunt est quo quod occaecati.', 144, 'Reprehenderit at praesentium nostrum non ut alias ducimus.', 230, 0, 16, 410, 1, 1564226730, 1574022208, 0, NULL, NULL, NULL, NULL, 0, '0'),
(207, 'aut_170', NULL, 152, 'Aperiam earum ipsa magnam at reiciendis.', 630, 0, 46, 650, 0, 1564226730, 1566798962, 0, NULL, NULL, NULL, NULL, 1, '0'),
(208, 'id_565', NULL, 109, 'Est soluta nesciunt corporis quidem nihil doloremque.', 870, 2, 45, 90, 0, 1564226731, 1571989173, 0, NULL, NULL, NULL, NULL, 1, '0'),
(209, 'hic_199', NULL, 114, 'Ea id sed dignissimos consectetur iusto cupiditate cumque.', 220, 22, 50, 640, 1, 1564226731, 1569983203, 0, NULL, NULL, NULL, NULL, 1, '0'),
(210, 'rerum_836', 'Dolor laborum sequi perferendis nulla adipisci modi sed velit laborum.', 112, 'Soluta ut voluptatum quidem dolorum inventore qui.', 180, 0, 41, 720, 0, 1564226731, 1567611113, 0, NULL, NULL, NULL, NULL, 0, '0'),
(211, 'tempore_176', 'Dolores numquam et consequuntur eius repellat voluptatem.', 136, 'Aperiam omnis nobis ullam totam.', 320, 39, 16, 440, 1, 1564226731, 1567287027, 0, NULL, NULL, NULL, NULL, 1, '0'),
(212, 'reiciendis_103', 'Quam omnis et et facere nulla.', 122, 'Delectus est est est consectetur quia recusandae debitis blanditiis.', 180, 0, 0, 410, 1, 1564226731, 1571118710, 0, NULL, NULL, NULL, NULL, 1, '0'),
(213, 'soluta_851', 'Temporibus quisquam qui inventore dolore voluptatem temporibus.', 117, 'Molestias id repudiandae dolores rerum eos nulla.', 490, 45, 0, 420, 1, 1564226731, 1572428138, 0, NULL, NULL, NULL, NULL, 1, '0'),
(214, 'est_200', 'Cum repudiandae excepturi officia quaerat sit.', 122, 'Officia voluptate incidunt qui quia suscipit.', 710, 0, 0, 270, 0, 1564226731, 1570778951, 0, NULL, NULL, NULL, NULL, 1, '0'),
(215, 'incidunt_950', NULL, 109, 'Aut ipsa accusantium ipsam eaque blanditiis voluptatem.', 850, 30, 0, 140, 1, 1564226731, 1572076160, 0, NULL, NULL, NULL, NULL, 0, '0'),
(216, 'eius_199', NULL, 145, 'Rerum in magni illo error.', 400, 7, 0, 980, 1, 1564226731, 1572406003, 0, NULL, NULL, NULL, NULL, 0, '0'),
(217, 'facilis_375', 'Ut iste occaecati est mollitia illum sint sint qui inventore.', 131, 'Cumque asperiores aspernatur maiores enim.', 780, 35, 35, 950, 0, 1564226731, 1572245241, 0, NULL, NULL, NULL, NULL, 1, '0'),
(218, 'illum_123', 'Sed id sit mollitia voluptatem recusandae laudantium suscipit cupiditate.', 126, 'Voluptatem sint et aliquid voluptatum dicta ipsa.', 920, 0, 0, 630, 0, 1564226731, 1567604721, 0, NULL, NULL, NULL, NULL, 1, '0'),
(219, 'ratione_877', NULL, 136, 'Esse et ab ipsum laudantium.', 950, 0, 0, 150, 0, 1564226731, 1568834003, 0, NULL, NULL, NULL, NULL, 1, '0'),
(220, 'itaque_856', 'Deleniti placeat alias consequatur debitis voluptas.', 131, 'Aut temporibus illum modi neque fugit et.', 110, 0, 17, 930, 0, 1564226731, 1568181294, 0, NULL, NULL, NULL, NULL, 1, '0'),
(221, 'qui_201', NULL, 128, 'Asperiores qui est quas.', 980, 23, 0, 800, 0, 1564226731, 1569537601, 0, NULL, NULL, NULL, NULL, 0, '0'),
(222, 'modi_616', 'Ipsa nulla minus est dolores et nisi est ut.', 150, 'Sunt molestiae consequatur ea pariatur.', 190, 8, 0, 700, 0, 1564226731, 1569775259, 0, NULL, NULL, NULL, NULL, 1, '0'),
(223, 'eligendi_707', NULL, 107, 'Possimus molestiae culpa itaque ratione quasi aspernatur nihil odio.', 500, 0, 0, 310, 0, 1564226731, 1572477233, 0, NULL, NULL, NULL, NULL, 1, '0'),
(224, 'unde_164', NULL, 144, 'Aliquam vel qui nemo dolorem et rerum.', 840, 0, 0, 1000, 0, 1564226731, 1573782591, 0, NULL, NULL, NULL, NULL, 0, '0'),
(225, 'consequatur_514', NULL, 114, 'Ut accusamus voluptas voluptatum deserunt velit.', 750, 23, 22, 840, 0, 1564226731, 1570082174, 0, NULL, NULL, NULL, NULL, 0, '0'),
(226, 'at_463', NULL, 141, 'Earum voluptates consequatur repudiandae voluptas dolor soluta animi.', 850, 12, 0, 90, 1, 1564226731, 1569459074, 0, NULL, NULL, NULL, NULL, 1, '0'),
(227, 'reprehenderit_683', 'Vel aut temporibus omnis eaque at excepturi voluptas est aut.', 137, 'Mollitia iste cum et consequuntur.', 850, 0, 0, 290, 0, 1564226731, 1573976912, 0, NULL, NULL, NULL, NULL, 0, '0'),
(228, 'fuga_692', NULL, 113, 'Dolores nihil labore adipisci ea.', 530, 11, 0, 170, 1, 1564226731, 1566670761, 0, NULL, NULL, NULL, NULL, 0, '0'),
(229, 'est_803', 'Voluptatem quia nostrum molestias voluptates laudantium atque ut esse officiis et.', 114, 'Ut omnis voluptates est facere cum id omnis dolores.', 90, 16, 20, 90, 0, 1564226731, 1569677731, 0, NULL, NULL, NULL, NULL, 1, '0'),
(230, 'non_458', NULL, 139, 'Voluptatem consequatur eveniet qui harum consequatur consequatur fugit.', 790, 36, 41, 850, 1, 1564226731, 1567816154, 0, NULL, NULL, NULL, NULL, 0, '0'),
(231, 'dolor_452', NULL, 114, 'Nisi aspernatur esse et sunt aliquam similique.', 930, 32, 0, 390, 1, 1564226731, 1570980320, 0, NULL, NULL, NULL, NULL, 0, '0'),
(232, 'perspiciatis_306', NULL, 136, 'Dolore ex nulla maiores totam.', 450, 0, 33, 420, 0, 1564226731, 1566352508, 0, NULL, NULL, NULL, NULL, 0, '0'),
(233, 'molestias_863', 'Ut aut natus earum exercitationem qui officia nam.', 118, 'Aliquid molestiae nihil ut voluptas.', 70, 13, 5, 540, 0, 1564226731, 1567847455, 0, NULL, NULL, NULL, NULL, 1, '0'),
(234, 'in_893', 'Odit corporis et necessitatibus et velit aut necessitatibus ea ullam doloremque.', 147, 'Similique vel commodi et nobis.', 750, 14, 30, 640, 1, 1564226731, 1565783372, 0, NULL, NULL, NULL, NULL, 0, '0'),
(235, 'delectus_408', 'Molestiae quia facere occaecati nobis et molestiae est.', 137, 'Necessitatibus quo inventore temporibus non consequuntur atque vel.', 320, 6, 0, 890, 0, 1564226731, 1568526408, 0, NULL, NULL, NULL, NULL, 1, '0'),
(236, 'rem_134', 'Voluptatem quod dolor ut modi dolor tenetur architecto deserunt est.', 152, 'Sint et voluptate quia nihil velit vitae.', 880, 0, 30, 280, 0, 1564226731, 1566167193, 0, NULL, NULL, NULL, NULL, 0, '0'),
(237, 'ut_449', 'Nihil consectetur architecto veritatis dicta at accusamus.', 120, 'Vitae suscipit et debitis dolorum reiciendis et pariatur nam.', 660, 0, 0, 150, 0, 1564226731, 1572624652, 0, NULL, NULL, NULL, NULL, 0, '0'),
(238, 'ut_397', 'Pariatur a qui qui repellat facilis.', 150, 'Cum quisquam voluptas similique optio.', 70, 26, 48, 70, 0, 1564226731, 1571015817, 0, NULL, NULL, NULL, NULL, 1, '0'),
(239, 'deserunt_451', NULL, 136, 'Quo minus minus accusamus velit dolorum dolore.', 240, 11, 40, 810, 0, 1564226731, 1571375903, 0, NULL, NULL, NULL, NULL, 0, '0'),
(240, 'consequuntur_355', NULL, 124, 'Quia qui repellendus dolorem id voluptatem magnam ut.', 570, 24, 0, 60, 0, 1564226731, 1574134205, 0, NULL, NULL, NULL, NULL, 0, '0'),
(241, 'eaque_511', NULL, 147, 'Atque earum rerum dolores rem quod.', 930, 0, 0, 430, 0, 1564226731, 1570452810, 0, NULL, NULL, NULL, NULL, 0, '0'),
(242, 'et_827', 'Cum et voluptas odit ea esse excepturi veritatis dolor.', 124, 'Iste dignissimos iste placeat.', 130, 0, 44, 900, 1, 1564226731, 1572008724, 0, NULL, NULL, NULL, NULL, 1, '0'),
(243, 'est_153', 'Iste praesentium dolore et dolor perferendis ut.', 110, 'Ullam et quasi voluptas vero est distinctio.', 270, 38, 29, 820, 0, 1564226731, 1572104702, 0, NULL, NULL, NULL, NULL, 1, '0'),
(244, 'quia_109', NULL, 109, 'Neque iure ut nesciunt non.', 240, 0, 44, 490, 1, 1564226731, 1572043200, 0, NULL, NULL, NULL, NULL, 0, '0'),
(245, 'nobis_350', NULL, 136, 'Praesentium quas et et.', 510, 0, 45, 280, 1, 1564226731, 1567048346, 0, NULL, NULL, NULL, NULL, 1, '0'),
(246, 'perferendis_610', NULL, 113, 'Id quibusdam corporis impedit sit sit.', 810, 0, 18, 80, 0, 1564226731, 1573810516, 0, NULL, NULL, NULL, NULL, 1, '0'),
(247, 'aut_239', 'Est autem numquam animi qui est voluptatum.', 137, 'Nam et voluptatem fugiat dicta quia est.', 910, 0, 0, 80, 0, 1564226732, 1566616607, 0, NULL, NULL, NULL, NULL, 0, '0'),
(248, 'est_229', NULL, 117, 'Qui soluta qui eum laudantium ipsa dicta.', 250, 44, 0, 750, 1, 1564226732, 1568258648, 0, NULL, NULL, NULL, NULL, 0, '0'),
(249, 'quia_423', NULL, 122, 'Fugiat quod ipsa autem voluptatem fugiat necessitatibus est voluptatem.', 340, 8, 41, 710, 0, 1564226732, 1567201088, 0, NULL, NULL, NULL, NULL, 0, '0'),
(250, 'amet_730', NULL, 131, 'Aut perspiciatis ratione consequuntur quo officiis veritatis.', 920, 45, 43, 310, 1, 1564226732, 1566756213, 0, NULL, NULL, NULL, NULL, 1, '0'),
(251, 'incidunt_817', NULL, 141, 'Eaque explicabo repellendus ex nihil quas recusandae rem.', 210, 4, 0, 320, 1, 1564226732, 1566096534, 0, NULL, NULL, NULL, NULL, 1, '0'),
(252, 'et_197', NULL, 120, 'Ipsa natus qui sit at ducimus.', 790, 0, 0, 540, 0, 1564226732, 1572944271, 0, NULL, NULL, NULL, NULL, 0, '0'),
(253, 'voluptatem_895', NULL, 135, 'Rerum velit officiis officiis fugiat.', 790, 20, 7, 480, 1, 1564226732, 1567067648, 0, NULL, NULL, NULL, NULL, 1, '0'),
(254, 'similique_648', 'Minus enim ea quo velit similique aspernatur rerum ut autem.', 136, 'Consequuntur delectus repellendus omnis eligendi ipsum.', 670, 14, 41, 820, 1, 1564226732, 1567571012, 0, NULL, NULL, NULL, NULL, 1, '0'),
(255, 'tempora_810', 'Reprehenderit sint expedita in sapiente ut facere facere.', 142, 'Voluptatum iusto iure et.', 400, 0, 3, 520, 0, 1564226732, 1570461369, 0, NULL, NULL, NULL, NULL, 1, '0'),
(256, 'et_639', 'Voluptatum et aut sit atque aspernatur at ex.', 136, 'Fuga alias vero quasi impedit ut dignissimos.', 500, 0, 48, 220, 0, 1564226732, 1567753621, 0, NULL, NULL, NULL, NULL, 0, '0'),
(257, 'consectetur_985', NULL, 114, 'Nam et aut est aut ipsa tenetur quidem.', 140, 0, 0, 920, 0, 1564226732, 1572625546, 0, NULL, NULL, NULL, NULL, 1, '0'),
(258, 'tempora_812', NULL, 108, 'Exercitationem eaque ad et.', 100, 9, 0, 800, 1, 1564226732, 1573872489, 0, NULL, NULL, NULL, NULL, 1, '0'),
(259, 'accusantium_697', 'Id dolores suscipit quo rerum et.', 131, 'Delectus ut et similique odio.', 70, 26, 16, 920, 1, 1564226732, 1572537418, 0, NULL, NULL, NULL, NULL, 0, '0'),
(260, 'aut_252', NULL, 112, 'Quam qui non dolorum soluta libero.', 240, 35, 11, 580, 1, 1564226732, 1566099259, 0, NULL, NULL, NULL, NULL, 0, '0'),
(261, 'nesciunt_631', 'Dolor facilis non quam exercitationem sit tenetur nemo impedit ea.', 117, 'Voluptatem nisi nam ad architecto consequatur.', 720, 46, 18, 530, 1, 1564226732, 1572830631, 0, NULL, NULL, NULL, NULL, 0, '0'),
(262, 'ducimus_420', NULL, 139, 'Et occaecati veritatis vel nihil corrupti itaque a.', 910, 25, 29, 630, 1, 1564226732, 1572897744, 0, NULL, NULL, NULL, NULL, 1, '0'),
(263, 'et_364', 'Minus ratione et minus id quam tempora repellendus.', 114, 'Voluptatibus sapiente autem quos.', 120, 0, 0, 930, 1, 1564226732, 1570338544, 0, NULL, NULL, NULL, NULL, 1, '0'),
(264, 'occaecati_255', 'Placeat est quaerat ducimus omnis et reiciendis ut.', 128, 'Ut voluptate sit nihil laudantium repellendus.', 230, 0, 24, 930, 0, 1564226732, 1569651547, 0, NULL, NULL, NULL, NULL, 1, '0'),
(265, 'autem_248', 'Sit sint temporibus minima et quisquam tempore enim.', 109, 'Dolor ex atque ut eum perspiciatis aut.', 730, 37, 0, 660, 1, 1564226732, 1570022203, 0, NULL, NULL, NULL, NULL, 1, '0'),
(266, 'voluptate_705', NULL, 109, 'Eveniet dicta ullam eum magnam omnis quas nesciunt ullam.', 790, 8, 35, 490, 0, 1564226732, 1567321489, 0, NULL, NULL, NULL, NULL, 0, '0'),
(267, 'corrupti_271', 'Libero vel nostrum sunt voluptates beatae libero eos voluptas incidunt corporis.', 131, 'Vero placeat autem aperiam nobis dolores ut velit unde.', 780, 0, 34, 630, 0, 1564226732, 1566786399, 0, NULL, NULL, NULL, NULL, 0, '0'),
(268, 'quaerat_692', NULL, 124, 'Tempore quidem illo sequi ea officiis expedita id sed.', 940, 45, 45, 190, 1, 1564226732, 1566108585, 0, NULL, NULL, NULL, NULL, 1, '0'),
(269, 'officia_410', 'Doloremque doloribus ab ab aut quia non error atque.', 105, 'Nihil nulla eos odio magni.', 360, 22, 0, 310, 1, 1564226732, 1566191787, 0, NULL, NULL, NULL, NULL, 1, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(270, 'ex_558', 'Enim est dolor enim ut neque est.', 142, 'Accusantium sunt corrupti non et nostrum placeat.', 890, 0, 0, 510, 1, 1564226732, 1569151251, 0, NULL, NULL, NULL, NULL, 1, '0'),
(271, 'incidunt_385', 'Ea et quis voluptas porro aut tempore maiores sit libero id et.', 147, 'In dolor esse et voluptas.', 230, 12, 0, 230, 1, 1564226732, 1566563738, 0, NULL, NULL, NULL, NULL, 0, '0'),
(272, 'nemo_302', 'Est aut molestiae in sed non soluta est.', 120, 'Totam consequatur ducimus et in officia eveniet.', 660, 0, 24, 400, 1, 1564226732, 1567602125, 0, NULL, NULL, NULL, NULL, 0, '0'),
(273, 'quis_535', NULL, 136, 'Qui et qui possimus sit ipsam error tempora adipisci.', 530, 0, 15, 900, 0, 1564226732, 1571095285, 0, NULL, NULL, NULL, NULL, 1, '0'),
(274, 'est_153', 'Tenetur nemo rerum consequatur ducimus quis fuga.', 107, 'Ducimus quia saepe ut et sed autem.', 460, 39, 0, 600, 0, 1564226732, 1573143399, 0, NULL, NULL, NULL, NULL, 1, '0'),
(275, 'quidem_600', 'Voluptatem et sint provident nobis et expedita occaecati magni magni.', 122, 'Ipsa sint omnis perspiciatis repellat qui nisi ea.', 400, 49, 0, 610, 0, 1564226732, 1570424414, 0, NULL, NULL, NULL, NULL, 0, '0'),
(276, 'adipisci_927', 'Est nesciunt mollitia enim quaerat nihil tempore.', 108, 'Reiciendis qui rerum ut quaerat.', 730, 0, 49, 840, 0, 1564226732, 1570696638, 0, NULL, NULL, NULL, NULL, 0, '0'),
(277, 'id_219', NULL, 137, 'Consequatur eum doloremque sit quidem harum est praesentium.', 660, 0, 0, 490, 1, 1564226732, 1570974470, 0, NULL, NULL, NULL, NULL, 0, '0'),
(278, 'maiores_542', NULL, 136, 'Et quasi assumenda magnam.', 260, 2, 37, 980, 0, 1564226732, 1567908848, 0, NULL, NULL, NULL, NULL, 0, '0'),
(279, 'quibusdam_394', 'Consequatur tenetur alias qui quos tempore totam soluta.', 141, 'Odio omnis nisi harum unde rem harum explicabo.', 60, 0, 0, 980, 0, 1564226732, 1573374910, 0, NULL, NULL, NULL, NULL, 0, '0'),
(280, 'ea_686', NULL, 112, 'Odio sapiente delectus doloremque omnis nulla suscipit reiciendis.', 700, 0, 0, 420, 1, 1564226732, 1569070499, 0, NULL, NULL, NULL, NULL, 0, '0'),
(281, 'id_853', 'Nemo et voluptate voluptatem et qui qui quae.', 140, 'Et qui aut quibusdam ratione aspernatur ut et.', 120, 24, 0, 710, 0, 1564226732, 1565941992, 0, NULL, NULL, NULL, NULL, 0, '0'),
(282, 'tempora_727', NULL, 135, 'Velit voluptas ipsam libero.', 430, 48, 0, 340, 0, 1564226732, 1565329378, 0, NULL, NULL, NULL, NULL, 1, '0'),
(283, 'modi_423', NULL, 131, 'Aliquam quam architecto similique id.', 760, 0, 0, 530, 0, 1564226733, 1566669033, 0, NULL, NULL, NULL, NULL, 1, '0'),
(284, 'et_236', 'Eum tenetur ratione et velit nisi voluptatibus ad.', 114, 'Vel dignissimos maiores similique voluptatum et.', 610, 0, 0, 190, 0, 1564226733, 1566064233, 0, NULL, NULL, NULL, NULL, 0, '0'),
(285, 'a_604', NULL, 121, 'Blanditiis ex quia autem aut voluptate dicta impedit.', 810, 20, 0, 780, 1, 1564226733, 1572009064, 0, NULL, NULL, NULL, NULL, 1, '0'),
(286, 'beatae_250', NULL, 136, 'Voluptates voluptas expedita natus et aut facilis.', 740, 5, 28, 60, 0, 1564226733, 1571670033, 0, NULL, NULL, NULL, NULL, 1, '0'),
(287, 'animi_576', NULL, 113, 'Velit omnis porro recusandae qui quam et.', 270, 0, 0, 600, 0, 1564226733, 1573701381, 0, NULL, NULL, NULL, NULL, 0, '0'),
(288, 'itaque_483', 'Possimus animi perferendis quia quibusdam repellendus aut inventore consequatur aliquid.', 139, 'Soluta sint dolor labore aperiam voluptate eos.', 760, 9, 0, 950, 0, 1564226733, 1573289060, 0, NULL, NULL, NULL, NULL, 0, '0'),
(289, 'alias_438', NULL, 131, 'Voluptatem ab et eum fugiat sit harum et nisi.', 270, 4, 0, 450, 0, 1564226733, 1573529438, 0, NULL, NULL, NULL, NULL, 0, '0'),
(290, 'ut_657', NULL, 144, 'Assumenda odio et qui.', 480, 44, 0, 450, 0, 1564226733, 1569898637, 0, NULL, NULL, NULL, NULL, 1, '0'),
(291, 'voluptates_122', 'Est harum eius cumque est est et et error quaerat.', 137, 'Porro occaecati vero et eum animi aut in.', 410, 16, 12, 530, 0, 1564226733, 1567586523, 0, NULL, NULL, NULL, NULL, 0, '0'),
(292, 'illo_811', 'Ducimus ipsum dolore tenetur quibusdam voluptate aut a dignissimos sint.', 120, 'Occaecati ut dignissimos porro fugiat.', 160, 0, 11, 950, 1, 1564226733, 1569306849, 0, NULL, NULL, NULL, NULL, 0, '0'),
(293, 'assumenda_623', NULL, 107, 'Qui et ipsum voluptatem ut qui recusandae sit.', 250, 7, 43, 810, 0, 1564226733, 1569991093, 0, NULL, NULL, NULL, NULL, 0, '0'),
(294, 'accusamus_507', NULL, 149, 'Voluptate molestias sint nobis iste rem nobis.', 540, 3, 0, 400, 0, 1564226733, 1569221444, 0, NULL, NULL, NULL, NULL, 0, '0'),
(295, 'voluptatem_529', NULL, 108, 'Qui quaerat aspernatur porro quia et.', 670, 31, 5, 620, 1, 1564226733, 1573738853, 0, NULL, NULL, NULL, NULL, 1, '0'),
(296, 'ratione_117', NULL, 142, 'Sint quibusdam voluptas temporibus repellendus cumque quis maxime.', 770, 49, 0, 620, 0, 1564226733, 1566465926, 0, NULL, NULL, NULL, NULL, 0, '0'),
(297, 'quis_789', NULL, 147, 'Eius sint magnam neque aliquam ipsum accusamus quia.', 630, 24, 0, 870, 0, 1564226733, 1571537488, 0, NULL, NULL, NULL, NULL, 1, '0'),
(298, 'debitis_712', 'Ratione ex vel non excepturi cum aperiam et itaque.', 145, 'Cumque quo odio asperiores consequatur.', 860, 0, 0, 50, 1, 1564226733, 1572718100, 0, NULL, NULL, NULL, NULL, 0, '0'),
(299, 'possimus_775', NULL, 114, 'Odit error iusto qui sit maiores magnam.', 90, 0, 31, 650, 1, 1564226733, 1565992712, 0, NULL, NULL, NULL, NULL, 1, '0'),
(300, 'at_181', NULL, 114, 'Ut incidunt rem nostrum.', 680, 41, 0, 420, 0, 1564226733, 1568335917, 0, NULL, NULL, NULL, NULL, 0, '0'),
(301, 'earum_698', NULL, 115, 'Possimus quasi ipsa quidem at et.', 670, 0, 0, 740, 0, 1564226733, 1570366782, 0, NULL, NULL, NULL, NULL, 0, '0'),
(302, 'magnam_654', NULL, 117, 'Necessitatibus vitae excepturi odio qui amet consequatur.', 970, 42, 20, 930, 1, 1564226733, 1568834848, 0, NULL, NULL, NULL, NULL, 1, '0'),
(303, 'sed_719', NULL, 144, 'Eligendi voluptates aut alias.', 850, 0, 21, 730, 0, 1564226733, 1572560580, 0, NULL, NULL, NULL, NULL, 0, '0'),
(304, 'ea_204', NULL, 152, 'Quisquam consequatur perspiciatis rerum in nemo.', 230, 43, 33, 680, 1, 1564226733, 1572441098, 0, NULL, NULL, NULL, NULL, 0, '0'),
(305, 'ut_726', NULL, 126, 'Molestiae ea voluptatum sequi ipsa voluptatem quia.', 710, 0, 47, 590, 1, 1564226733, 1565408915, 0, NULL, NULL, NULL, NULL, 1, '0'),
(306, 'et_843', 'Est sint sunt voluptate dicta molestiae quibusdam eos sapiente incidunt omnis.', 135, 'Provident nobis ut dolores architecto occaecati rerum.', 830, 0, 0, 900, 0, 1564226733, 1571127843, 0, NULL, NULL, NULL, NULL, 0, '0'),
(307, 'temporibus_885', NULL, 118, 'Quibusdam nihil culpa quas doloribus magnam.', 550, 0, 0, 310, 1, 1564226733, 1567068800, 0, NULL, NULL, NULL, NULL, 0, '0'),
(308, 'quae_370', 'Voluptatem velit ea aut voluptatem sint.', 136, 'Id ex ullam animi qui autem possimus.', 800, 0, 0, 800, 0, 1564226733, 1567169919, 0, NULL, NULL, NULL, NULL, 1, '0'),
(309, 'non_379', NULL, 117, 'Dolor et reprehenderit quaerat incidunt suscipit illo.', 980, 28, 47, 370, 0, 1564226733, 1565803631, 0, NULL, NULL, NULL, NULL, 0, '0'),
(310, 'ipsam_534', NULL, 139, 'Adipisci aut et et veniam nemo culpa voluptatem.', 770, 40, 0, 330, 0, 1564226733, 1572440056, 0, NULL, NULL, NULL, NULL, 1, '0'),
(311, 'tempore_760', NULL, 113, 'Magnam minima doloremque ex voluptates.', 610, 9, 0, 400, 1, 1564226733, 1567261247, 0, NULL, NULL, NULL, NULL, 1, '0'),
(312, 'voluptatem_978', NULL, 124, 'Est nam laboriosam eum.', 530, 0, 0, 580, 0, 1564226733, 1569761581, 0, NULL, NULL, NULL, NULL, 0, '0'),
(313, 'molestiae_181', NULL, 135, 'Similique cumque et saepe nesciunt consectetur eaque aut.', 990, 32, 0, 110, 0, 1564226733, 1573780060, 0, NULL, NULL, NULL, NULL, 1, '0'),
(314, 'voluptate_191', NULL, 114, 'Et et fugiat odio nesciunt repellendus voluptatem est.', 560, 28, 0, 690, 0, 1564226733, 1572515073, 0, NULL, NULL, NULL, NULL, 0, '0'),
(315, 'perferendis_538', 'Atque provident tempora omnis sequi corrupti deserunt deleniti a dolorum.', 114, 'Eos enim eveniet tenetur saepe.', 130, 0, 0, 680, 1, 1564226733, 1569590012, 0, NULL, NULL, NULL, NULL, 1, '0'),
(316, 'consequuntur_506', NULL, 139, 'Quo rerum commodi sint modi quia iusto.', 890, 0, 0, 410, 1, 1564226733, 1573222025, 0, NULL, NULL, NULL, NULL, 1, '0'),
(317, 'in_960', 'Excepturi ab exercitationem quo voluptatem.', 121, 'Qui deserunt est et rerum et officia at.', 480, 0, 0, 50, 1, 1564226733, 1571789715, 0, NULL, NULL, NULL, NULL, 1, '0'),
(318, 'esse_484', NULL, 137, 'Unde fuga facere hic quo occaecati sit fugiat.', 330, 0, 0, 750, 0, 1564226733, 1570619776, 0, NULL, NULL, NULL, NULL, 0, '0'),
(319, 'nisi_203', NULL, 147, 'Laborum dolor minus libero velit sint consectetur dicta et.', 980, 46, 0, 60, 1, 1564226733, 1569974940, 0, NULL, NULL, NULL, NULL, 0, '0'),
(320, 'dolores_432', NULL, 107, 'Dolores eligendi veniam odio et libero illo distinctio.', 160, 0, 35, 210, 0, 1564226734, 1568446080, 0, NULL, NULL, NULL, NULL, 0, '0'),
(321, 'fugit_735', NULL, 114, 'Ipsa voluptas culpa non architecto dolorum.', 120, 0, 38, 950, 0, 1564226734, 1573449282, 0, NULL, NULL, NULL, NULL, 1, '0'),
(322, 'ad_832', 'Voluptatem qui reiciendis corporis ut eum qui et doloremque rem veritatis.', 126, 'Aspernatur deserunt illo neque officia voluptas quaerat nisi.', 820, 42, 0, 490, 0, 1564226734, 1567803831, 0, NULL, NULL, NULL, NULL, 1, '0'),
(323, 'laborum_724', NULL, 113, 'Quos accusamus sit qui veritatis.', 390, 10, 0, 400, 0, 1564226734, 1570468361, 0, NULL, NULL, NULL, NULL, 1, '0'),
(324, 'est_310', NULL, 120, 'Qui optio consequatur non ut.', 810, 42, 24, 530, 0, 1564226734, 1565751529, 0, NULL, NULL, NULL, NULL, 1, '0'),
(325, 'aliquam_649', NULL, 137, 'Qui alias nihil dolorum ullam animi natus et.', 50, 0, 0, 500, 0, 1564226734, 1565873790, 0, NULL, NULL, NULL, NULL, 1, '0'),
(326, 'adipisci_690', NULL, 108, 'Numquam laudantium eum perferendis sit consequatur.', 800, 0, 39, 930, 1, 1564226734, 1569965216, 0, NULL, NULL, NULL, NULL, 1, '0'),
(327, 'non_764', 'Est et explicabo quos placeat esse sapiente.', 107, 'Excepturi nisi reprehenderit soluta modi aut.', 410, 0, 0, 170, 1, 1564226734, 1573055290, 0, NULL, NULL, NULL, NULL, 1, '0'),
(328, 'soluta_549', 'Soluta perspiciatis architecto quidem alias nostrum quo quia.', 108, 'Eveniet consequatur doloribus alias nam.', 840, 47, 34, 840, 1, 1564226734, 1566814500, 0, NULL, NULL, NULL, NULL, 0, '0'),
(329, 'voluptas_625', NULL, 147, 'Veritatis consectetur rerum et quas facere nihil dolorum.', 510, 26, 28, 510, 1, 1564226734, 1573700314, 0, NULL, NULL, NULL, NULL, 0, '0'),
(330, 'quos_309', 'Tenetur iure dolorem repudiandae odit et.', 124, 'Tempore accusamus alias illum et ullam consequuntur ea quam.', 850, 29, 0, 630, 0, 1564226734, 1573038113, 0, NULL, NULL, NULL, NULL, 1, '0'),
(331, 'vel_490', NULL, 114, 'Blanditiis dolorum doloremque ex non sint.', 470, 0, 12, 460, 0, 1564226734, 1565740597, 0, NULL, NULL, NULL, NULL, 1, '0'),
(332, 'est_455', NULL, 121, 'Corporis possimus facilis incidunt aliquid non reprehenderit molestiae.', 880, 0, 21, 630, 1, 1564226734, 1569221808, 0, NULL, NULL, NULL, NULL, 1, '0'),
(333, 'qui_192', NULL, 149, 'Quia quia doloremque sunt earum aperiam provident et ullam.', 230, 0, 0, 770, 1, 1564226734, 1569661257, 0, NULL, NULL, NULL, NULL, 0, '0'),
(334, 'laborum_655', NULL, 118, 'Vitae dolores a dicta.', 820, 39, 45, 330, 1, 1564226734, 1573491766, 0, NULL, NULL, NULL, NULL, 1, '0'),
(335, 'assumenda_697', NULL, 136, 'Adipisci similique molestiae saepe corrupti minus voluptate.', 850, 0, 0, 720, 1, 1564226734, 1570879948, 0, NULL, NULL, NULL, NULL, 1, '0'),
(336, 'sunt_875', 'Cupiditate excepturi fuga hic non molestias tempora voluptas atque.', 149, 'Sit sapiente fuga et.', 820, 0, 0, 260, 1, 1564226734, 1572467486, 0, NULL, NULL, NULL, NULL, 1, '0'),
(337, 'unde_884', NULL, 112, 'Nemo modi nobis consequatur recusandae facilis.', 930, 0, 0, 990, 1, 1564226734, 1565613891, 0, NULL, NULL, NULL, NULL, 0, '0'),
(338, 'a_404', NULL, 145, 'Dolor necessitatibus et pariatur aspernatur ea quasi est quo.', 220, 0, 0, 230, 0, 1564226734, 1567594081, 0, NULL, NULL, NULL, NULL, 1, '0'),
(339, 'quia_648', NULL, 130, 'Voluptas eos sequi quae non sunt quam quas.', 240, 37, 0, 360, 1, 1564226734, 1570948295, 0, NULL, NULL, NULL, NULL, 1, '0'),
(340, 'consequatur_417', 'Eligendi soluta eius natus aut laboriosam sint sunt qui fugiat nobis.', 109, 'Officiis est natus aspernatur quis adipisci sunt similique.', 490, 28, 0, 280, 0, 1564226734, 1570360752, 0, NULL, NULL, NULL, NULL, 0, '0'),
(341, 'et_945', 'Labore odit accusamus qui praesentium ut placeat sed cupiditate minus.', 124, 'Nihil quidem officiis reiciendis perferendis inventore itaque.', 130, 0, 0, 210, 0, 1564226734, 1566438107, 0, NULL, NULL, NULL, NULL, 0, '0'),
(342, 'nostrum_903', 'Fugit accusantium aut hic facere quidem quia tenetur at animi excepturi rem.', 145, 'Enim corporis quis nulla facilis asperiores ducimus quidem.', 490, 0, 16, 880, 0, 1564226734, 1567729081, 0, NULL, NULL, NULL, NULL, 0, '0'),
(343, 'rerum_157', 'Est consequatur iure ipsum ut repellendus nam.', 124, 'Omnis qui est unde velit ea id ex.', 520, 41, 29, 750, 0, 1564226734, 1570332032, 0, NULL, NULL, NULL, NULL, 1, '0'),
(344, 'ut_260', NULL, 137, 'Dolores culpa numquam minus cum.', 480, 45, 22, 530, 0, 1564226734, 1568988511, 0, NULL, NULL, NULL, NULL, 1, '0'),
(345, 'asperiores_956', NULL, 115, 'Tempora ipsa nobis est quas unde.', 870, 46, 12, 560, 0, 1564226734, 1572735959, 0, NULL, NULL, NULL, NULL, 0, '0'),
(346, 'eligendi_128', NULL, 152, 'Repellendus in rerum qui eos eligendi.', 80, 0, 0, 500, 0, 1564226734, 1568411527, 0, NULL, NULL, NULL, NULL, 0, '0'),
(347, 'modi_407', 'Sint id occaecati numquam non doloribus quo voluptas temporibus.', 131, 'Deserunt qui provident dolor accusamus recusandae iste odio.', 100, 0, 47, 700, 0, 1564226734, 1567248311, 0, NULL, NULL, NULL, NULL, 1, '0'),
(348, 'consequatur_364', NULL, 124, 'Iure sequi qui et natus qui.', 410, 34, 19, 970, 1, 1564226734, 1568932668, 0, NULL, NULL, NULL, NULL, 0, '0'),
(349, 'aut_139', NULL, 124, 'Non rem enim vel laboriosam deleniti ut earum.', 610, 0, 23, 640, 1, 1564226734, 1572185793, 0, NULL, NULL, NULL, NULL, 1, '0'),
(350, 'et_978', 'Asperiores est consequatur numquam et laboriosam aut excepturi doloremque eum maiores deleniti.', 142, 'Provident dolor omnis qui sed commodi vel repellat.', 640, 44, 0, 710, 1, 1564226734, 1566360892, 0, NULL, NULL, NULL, NULL, 0, '0'),
(351, 'quidem_983', NULL, 130, 'Voluptatem ex quia voluptas rem ut aliquid possimus.', 870, 42, 0, 550, 0, 1564226734, 1569498765, 0, NULL, NULL, NULL, NULL, 0, '0'),
(352, 'nesciunt_537', NULL, 105, 'Minus nihil cupiditate nisi nam et voluptatem.', 170, 18, 0, 90, 1, 1564226734, 1572070881, 0, NULL, NULL, NULL, NULL, 1, '0'),
(353, 'at_375', 'Et aut quisquam qui voluptatem aut veniam sint.', 114, 'Saepe veniam debitis fugiat quaerat.', 940, 0, 29, 240, 1, 1564226734, 1571626190, 0, NULL, NULL, NULL, NULL, 1, '0'),
(354, 'et_988', 'Ut ipsum aperiam sed sequi nihil deleniti tempora eos quis quis voluptatem.', 131, 'Voluptatem sunt soluta quia ut dolorum dolor.', 760, 0, 10, 190, 1, 1564226734, 1565570209, 0, NULL, NULL, NULL, NULL, 1, '0'),
(355, 'velit_342', NULL, 105, 'Reiciendis reprehenderit temporibus accusantium.', 570, 32, 9, 520, 0, 1564226734, 1574083108, 0, NULL, NULL, NULL, NULL, 1, '0'),
(356, 'quibusdam_669', NULL, 136, 'Sint ab iste consequatur quisquam fugit quia.', 410, 0, 5, 580, 0, 1564226734, 1571212686, 0, NULL, NULL, NULL, NULL, 1, '0'),
(357, 'deserunt_478', NULL, 124, 'Non excepturi omnis omnis fuga totam qui voluptatem.', 920, 45, 27, 110, 0, 1564226734, 1568750188, 0, NULL, NULL, NULL, NULL, 0, '0'),
(358, 'nihil_337', NULL, 147, 'Quia perferendis at id exercitationem provident rerum numquam.', 800, 27, 23, 440, 1, 1564226734, 1567064987, 0, NULL, NULL, NULL, NULL, 0, '0'),
(359, 'eum_808', NULL, 142, 'Dolores dolorum corporis molestiae adipisci a occaecati.', 300, 0, 0, 220, 0, 1564226735, 1569926341, 0, NULL, NULL, NULL, NULL, 0, '0'),
(360, 'incidunt_610', NULL, 152, 'Fugiat necessitatibus quis quis dolores reprehenderit consequuntur odit.', 250, 0, 0, 390, 1, 1564226735, 1574113152, 0, NULL, NULL, NULL, NULL, 1, '0'),
(361, 'pariatur_925', NULL, 135, 'Quaerat neque nobis est occaecati.', 980, 30, 0, 550, 0, 1564226735, 1565407101, 0, NULL, NULL, NULL, NULL, 0, '0'),
(362, 'ut_676', 'Qui quidem quo et sed dolorum quas.', 105, 'Beatae temporibus numquam repellat sunt dicta doloribus soluta.', 920, 0, 34, 60, 1, 1564226735, 1573923187, 0, NULL, NULL, NULL, NULL, 1, '0'),
(363, 'harum_426', 'Molestiae ut rerum repellat iure nesciunt eligendi error aut laborum quae.', 117, 'Quidem cumque qui eum ipsa quaerat illo eligendi.', 80, 0, 8, 450, 0, 1564226735, 1570420114, 0, NULL, NULL, NULL, NULL, 0, '0'),
(364, 'sint_268', NULL, 147, 'Corrupti possimus quo tempora nesciunt.', 280, 1, 0, 880, 1, 1564226735, 1565612488, 0, NULL, NULL, NULL, NULL, 1, '0'),
(365, 'velit_587', 'Deleniti fugiat maxime itaque et reprehenderit sit officiis dignissimos.', 117, 'Eaque ipsam atque vel nobis ab ratione.', 110, 40, 23, 230, 0, 1564226735, 1570956235, 0, NULL, NULL, NULL, NULL, 0, '0'),
(366, 'enim_508', 'Et vel perferendis voluptas aspernatur quo fugit qui similique pariatur corporis.', 126, 'Dolorem rerum deleniti itaque aut.', 60, 0, 42, 310, 0, 1564226735, 1574121277, 0, NULL, NULL, NULL, NULL, 1, '0'),
(367, 'voluptatem_900', 'Earum tempora laudantium quis est rem amet.', 142, 'Ut vero fugiat est est ut quia debitis.', 790, 0, 26, 820, 0, 1564226735, 1566931420, 0, NULL, NULL, NULL, NULL, 1, '0'),
(368, 'doloremque_958', NULL, 114, 'Vel perferendis velit inventore inventore hic sit.', 600, 13, 46, 130, 1, 1564226735, 1573568759, 0, NULL, NULL, NULL, NULL, 0, '0'),
(369, 'voluptatem_236', NULL, 112, 'Eligendi qui quia soluta in architecto autem illo.', 70, 30, 9, 810, 1, 1564226735, 1567895109, 0, NULL, NULL, NULL, NULL, 1, '0'),
(370, 'explicabo_146', NULL, 137, 'Dolor atque quam deserunt laudantium labore.', 880, 0, 0, 300, 1, 1564226735, 1572917412, 0, NULL, NULL, NULL, NULL, 0, '0'),
(371, 'quaerat_825', 'Quasi deserunt et distinctio eligendi sunt.', 114, 'Enim labore porro officiis sed quia alias.', 430, 0, 0, 310, 1, 1564226735, 1566941479, 0, NULL, NULL, NULL, NULL, 0, '0'),
(372, 'omnis_360', 'Natus non aspernatur consequatur magni odio quia quidem.', 147, 'Fuga inventore omnis non molestiae sint.', 890, 0, 12, 100, 1, 1564226735, 1569006311, 0, NULL, NULL, NULL, NULL, 1, '0'),
(373, 'voluptatem_530', 'Dolorem nulla perferendis quae fugit vero accusantium vel.', 131, 'Sint sequi dolorum pariatur quis expedita assumenda.', 640, 0, 0, 530, 0, 1564226735, 1570060406, 0, NULL, NULL, NULL, NULL, 1, '0'),
(374, 'ad_181', NULL, 130, 'Rerum unde dolore error eaque excepturi explicabo occaecati.', 140, 21, 0, 520, 0, 1564226735, 1571034177, 0, NULL, NULL, NULL, NULL, 1, '0'),
(375, 'repellat_399', NULL, 135, 'Cum tempora incidunt labore nemo esse.', 850, 0, 30, 910, 1, 1564226735, 1569491663, 0, NULL, NULL, NULL, NULL, 0, '0'),
(376, 'asperiores_312', NULL, 136, 'Neque illum occaecati ipsa et perspiciatis neque.', 990, 0, 0, 980, 0, 1564226735, 1570819181, 0, NULL, NULL, NULL, NULL, 0, '0'),
(377, 'dolor_918', 'Quia repellat praesentium eos velit sed ut.', 136, 'Necessitatibus dolor qui vel aspernatur assumenda.', 130, 28, 0, 760, 1, 1564226735, 1573275685, 0, NULL, NULL, NULL, NULL, 0, '0'),
(378, 'labore_891', NULL, 145, 'Quo quaerat molestias et accusamus consequuntur explicabo omnis.', 890, 0, 0, 490, 0, 1564226735, 1570487787, 0, NULL, NULL, NULL, NULL, 0, '0'),
(379, 'ea_754', NULL, 110, 'Numquam et omnis et ullam dolor.', 780, 2, 30, 670, 0, 1564226735, 1565467227, 0, NULL, NULL, NULL, NULL, 0, '0'),
(380, 'at_680', 'Iste ex id nihil voluptates voluptatem quo nam.', 145, 'Laudantium odio unde dignissimos nobis.', 890, 0, 0, 900, 1, 1564226735, 1568328821, 0, NULL, NULL, NULL, NULL, 1, '0'),
(381, 'occaecati_741', 'Vitae ut unde error ut sed earum non laudantium ex porro.', 115, 'Ea temporibus quibusdam officia qui quis.', 950, 41, 0, 790, 1, 1564226735, 1572163675, 0, NULL, NULL, NULL, NULL, 0, '0'),
(382, 'voluptatibus_209', 'Quo est est assumenda temporibus pariatur excepturi sit.', 110, 'Quod consectetur non perspiciatis enim omnis.', 640, 26, 42, 290, 1, 1564226735, 1570799316, 0, NULL, NULL, NULL, NULL, 0, '0'),
(383, 'aperiam_485', 'Soluta consequatur quia dolorum eos rerum aliquid velit et ea dolore.', 124, 'Alias aut culpa sed culpa.', 650, 0, 22, 530, 1, 1564226735, 1568275122, 0, NULL, NULL, NULL, NULL, 1, '0'),
(384, 'dolores_764', 'Quia unde nemo similique quia reiciendis iste.', 145, 'Non et voluptas deleniti sunt et molestiae ipsa eum.', 100, 9, 0, 250, 0, 1564226735, 1568486941, 0, NULL, NULL, NULL, NULL, 0, '0'),
(385, 'quidem_429', 'Aut sapiente non inventore dolor quia consequatur beatae iure.', 118, 'Id quos eos eos dolor et.', 430, 35, 0, 300, 0, 1564226735, 1572786359, 0, NULL, NULL, NULL, NULL, 0, '0'),
(386, 'officiis_973', 'Deserunt architecto deserunt voluptas quo animi debitis recusandae maiores.', 140, 'Maxime facilis quidem ratione ipsa architecto veritatis nisi.', 80, 48, 0, 470, 1, 1564226735, 1567794083, 0, NULL, NULL, NULL, NULL, 1, '0'),
(387, 'exercitationem_283', NULL, 135, 'Voluptatem ea fugiat qui esse quis optio recusandae.', 490, 0, 39, 350, 0, 1564226735, 1573889035, 0, NULL, NULL, NULL, NULL, 0, '0'),
(388, 'illum_950', 'Qui cumque quaerat et nihil omnis voluptatem illum minima qui voluptate.', 131, 'Maxime qui et voluptas voluptas aliquid quidem.', 610, 0, 0, 390, 1, 1564226735, 1570835589, 0, NULL, NULL, NULL, NULL, 0, '0'),
(389, 'ut_622', 'Debitis sint explicabo natus a quia.', 113, 'Perspiciatis mollitia at ut voluptas facilis animi.', 280, 4, 0, 690, 1, 1564226735, 1574091852, 0, NULL, NULL, NULL, NULL, 0, '0'),
(390, 'quae_415', NULL, 135, 'Dolorum laudantium illo qui omnis cumque.', 690, 11, 15, 800, 1, 1564226735, 1566366098, 0, NULL, NULL, NULL, NULL, 0, '0'),
(391, 'ut_685', 'Nostrum optio consequatur itaque iste recusandae fugiat molestiae quo explicabo mollitia.', 149, 'Tempora et reiciendis odio sequi.', 960, 0, 27, 230, 1, 1564226735, 1567608296, 0, NULL, NULL, NULL, NULL, 0, '0'),
(392, 'nulla_227', NULL, 112, 'Dolor aut velit dolorem libero suscipit rerum mollitia.', 820, 0, 0, 430, 0, 1564226735, 1565301613, 0, NULL, NULL, NULL, NULL, 1, '0'),
(393, 'dolor_425', NULL, 124, 'Occaecati magni odit distinctio officiis et vitae illum.', 190, 30, 0, 550, 0, 1564226735, 1566964880, 0, NULL, NULL, NULL, NULL, 1, '0'),
(394, 'quaerat_791', 'Pariatur deserunt voluptatem et id id ea ut.', 121, 'Est distinctio amet ducimus omnis eius natus dignissimos.', 220, 0, 0, 560, 0, 1564226735, 1572782227, 0, NULL, NULL, NULL, NULL, 0, '0'),
(395, 'aut_230', NULL, 117, 'Quibusdam iusto dolores saepe officiis et magnam tempore perspiciatis.', 290, 23, 0, 250, 1, 1564226735, 1571571775, 0, NULL, NULL, NULL, NULL, 0, '0'),
(396, 'labore_341', 'Quis unde nihil possimus sed et sit tenetur ut omnis beatae.', 144, 'Quaerat aspernatur et quas.', 440, 0, 19, 430, 0, 1564226735, 1565938457, 0, NULL, NULL, NULL, NULL, 1, '0'),
(397, 'et_156', NULL, 105, 'Voluptas qui omnis numquam maiores sunt.', 960, 1, 4, 780, 1, 1564226735, 1569816039, 0, NULL, NULL, NULL, NULL, 1, '0'),
(398, 'quae_969', NULL, 135, 'Eum voluptas voluptatem dolor omnis facilis nihil.', 710, 19, 0, 620, 1, 1564226736, 1570639753, 0, NULL, NULL, NULL, NULL, 0, '0'),
(399, 'dolore_304', 'Accusamus impedit voluptate quia inventore qui rerum.', 150, 'Ex debitis ut sint ad ad sit fugit.', 490, 0, 41, 440, 0, 1564226736, 1571268671, 0, NULL, NULL, NULL, NULL, 1, '0'),
(400, 'libero_927', 'Dolore ut eos voluptatibus est tempora perferendis tempora autem est tenetur minus.', 135, 'Dolores perferendis quis aliquid aut eveniet nemo maxime id.', 910, 0, 47, 490, 1, 1564226736, 1572800493, 0, NULL, NULL, NULL, NULL, 0, '0'),
(401, 'maiores_862', 'Nostrum provident voluptates commodi esse repellendus sunt.', 126, 'Saepe est quis amet eveniet velit repudiandae eaque officiis.', 490, 0, 0, 690, 0, 1564226736, 1569203089, 0, NULL, NULL, NULL, NULL, 0, '0'),
(402, 'eius_487', 'Voluptate maxime est vitae est quod.', 126, 'Nisi et cumque repellendus vel odit.', 900, 0, 0, 620, 0, 1564226736, 1565760005, 0, NULL, NULL, NULL, NULL, 0, '0'),
(403, 'inventore_374', 'Cupiditate iusto architecto sint quidem rerum qui odit corporis.', 126, 'Ut molestiae impedit eum non.', 450, 19, 0, 170, 1, 1564226736, 1569498208, 0, NULL, NULL, NULL, NULL, 1, '0'),
(404, 'eum_564', 'Quis iure perspiciatis voluptatem voluptatem sint libero voluptatem.', 126, 'Quod necessitatibus quasi voluptates est.', 930, 0, 0, 280, 1, 1564226736, 1565248198, 0, NULL, NULL, NULL, NULL, 1, '0'),
(405, 'eos_825', 'Nostrum sapiente illo suscipit quae autem fuga.', 126, 'Et quia et repudiandae quo est eligendi sunt dolor.', 770, 0, 0, 330, 0, 1564226736, 1565684992, 0, NULL, NULL, NULL, NULL, 1, '0'),
(406, 'dolorem_743', NULL, 126, 'Fugiat veritatis aliquid explicabo sed.', 600, 47, 0, 530, 0, 1564226736, 1568299549, 0, NULL, NULL, NULL, NULL, 0, '0'),
(407, 'nam_796', NULL, 126, 'Cumque in quo esse maxime.', 580, 0, 0, 210, 0, 1564226736, 1569973856, 0, NULL, NULL, NULL, NULL, 1, '0'),
(408, 'distinctio_818', 'Ut sed eveniet minus debitis est.', 126, 'Quos et nisi et eveniet rem qui.', 960, 0, 0, 610, 1, 1564226736, 1571299084, 0, NULL, NULL, NULL, NULL, 0, '0'),
(409, 'sunt_535', 'Eligendi earum et et maxime iure ut.', 126, 'Reiciendis odio voluptate voluptatem ea eos dolorem aliquid.', 530, 0, 0, 110, 1, 1564226736, 1573908159, 0, NULL, NULL, NULL, NULL, 0, '0'),
(410, 'provident_576', 'Sint tempore aut quis nisi commodi corporis facilis dolores odit odit.', 126, 'Qui ut natus eum est aut sit.', 240, 6, 0, 100, 0, 1564226736, 1571119791, 0, NULL, NULL, NULL, NULL, 1, '0'),
(411, 'aut_710', 'Ratione minus reprehenderit incidunt iure quasi distinctio rem aperiam ipsa libero.', 126, 'Quos commodi itaque non itaque ipsa et quam voluptatum.', 90, 34, 32, 620, 1, 1564226736, 1565831725, 0, NULL, NULL, NULL, NULL, 0, '0'),
(412, 'voluptas_645', NULL, 126, 'Repellat est et ea voluptas.', 900, 14, 0, 820, 1, 1564226736, 1567960925, 0, NULL, NULL, NULL, NULL, 1, '0'),
(413, 'assumenda_435', NULL, 126, 'Sunt et enim aspernatur sapiente eum.', 520, 25, 0, 380, 0, 1564226736, 1571904313, 0, NULL, NULL, NULL, NULL, 1, '0'),
(414, 'distinctio_400', NULL, 126, 'Dolores dolores iusto corporis inventore ea deleniti non.', 880, 11, 32, 480, 0, 1564226736, 1571521405, 0, NULL, NULL, NULL, NULL, 0, '0'),
(415, 'cumque_931', NULL, 126, 'Quam enim voluptatibus illum corrupti quis.', 60, 1, 48, 130, 1, 1564226736, 1572541344, 0, NULL, NULL, NULL, NULL, 1, '0'),
(416, 'voluptatem_973', 'Quo pariatur beatae distinctio repudiandae laboriosam.', 126, 'At omnis dolor ipsum nihil esse dignissimos ex.', 830, 40, 30, 470, 1, 1564226736, 1566878909, 0, NULL, NULL, NULL, NULL, 1, '0'),
(417, 'aliquid_890', NULL, 126, 'Quidem repellendus illum quis maiores deleniti quibusdam eaque repudiandae.', 830, 34, 0, 350, 0, 1564226736, 1573088258, 0, NULL, NULL, NULL, NULL, 0, '0'),
(418, 'magnam_726', NULL, 126, 'Mollitia minima quisquam itaque sapiente consequatur atque.', 100, 5, 45, 550, 1, 1564226736, 1570755605, 0, NULL, NULL, NULL, NULL, 1, '0'),
(419, 'unde_758', NULL, 126, 'Fuga autem eius tenetur voluptas.', 970, 0, 0, 530, 1, 1564226736, 1568201418, 0, NULL, NULL, NULL, NULL, 0, '0'),
(420, 'dicta_906', 'Ut nemo eum laborum et sequi quasi harum tempora.', 126, 'Deleniti ratione placeat qui voluptatem et.', 570, 0, 0, 560, 0, 1564226736, 1572550701, 0, NULL, NULL, NULL, NULL, 0, '0'),
(421, 'aut_300', NULL, 126, 'Ea mollitia ipsam inventore aut.', 240, 13, 42, 110, 1, 1564226736, 1571090005, 0, NULL, NULL, NULL, NULL, 0, '0'),
(422, 'nam_303', NULL, 126, 'Sit modi harum commodi quis odio beatae et.', 930, 0, 50, 50, 0, 1564226736, 1565674694, 0, NULL, NULL, NULL, NULL, 1, '0'),
(423, 'autem_983', 'Quam aut aut fugiat iusto hic.', 126, 'Quo odio soluta recusandae autem.', 700, 0, 10, 780, 0, 1564226736, 1567833015, 0, NULL, NULL, NULL, NULL, 0, '0'),
(424, 'ut_823', 'Saepe eius cum alias nemo autem rerum inventore odit officiis saepe.', 126, 'Amet saepe sunt et est quod non.', 980, 50, 0, 400, 1, 1564226736, 1574000504, 0, NULL, NULL, NULL, NULL, 1, '0'),
(425, 'aliquid_128', 'Unde sit fugit sit itaque quia explicabo mollitia.', 126, 'Rerum vitae vel omnis sint aut maxime.', 280, 0, 49, 890, 1, 1564226736, 1573728147, 0, NULL, NULL, NULL, NULL, 0, '0'),
(426, 'voluptatibus_729', 'Beatae et ipsam ratione neque illo est quas sit.', 126, 'Enim fugiat doloribus enim illo quo voluptatum voluptatem.', 360, 0, 0, 120, 1, 1564226736, 1569049202, 0, NULL, NULL, NULL, NULL, 0, '0'),
(427, 'consectetur_496', NULL, 126, 'Dicta quaerat illum necessitatibus magnam vel.', 690, 26, 3, 630, 0, 1564226736, 1566116171, 0, NULL, NULL, NULL, NULL, 1, '0'),
(428, 'aut_599', 'Beatae odio molestiae voluptates eaque tempora ea architecto magni tempora.', 126, 'Quos animi voluptatum at illo rem.', 950, 25, 18, 560, 1, 1564226736, 1568402909, 0, NULL, NULL, NULL, NULL, 0, '0'),
(429, 'atque_504', NULL, 126, 'Nam voluptate qui voluptas amet.', 50, 0, 0, 360, 0, 1564226736, 1573927650, 0, NULL, NULL, NULL, NULL, 1, '0'),
(430, 'et_527', NULL, 126, 'Dolorem aut cumque ducimus blanditiis molestiae neque nostrum.', 880, 33, 0, 820, 1, 1564226736, 1573515927, 0, NULL, NULL, NULL, NULL, 0, '0'),
(431, 'reiciendis_371', 'Amet dolores ipsum sint est sed.', 126, 'Non sequi explicabo vel vel.', 340, 0, 0, 980, 0, 1564226737, 1570289863, 0, NULL, NULL, NULL, NULL, 0, '0'),
(432, 'vero_586', NULL, 126, 'Adipisci sint nam quas ad voluptates deleniti atque accusamus.', 810, 16, 0, 520, 1, 1564226737, 1569754783, 0, NULL, NULL, NULL, NULL, 0, '0'),
(433, 'quo_273', NULL, 126, 'Tenetur non autem sed necessitatibus alias.', 230, 47, 0, 910, 0, 1564226737, 1565604878, 0, NULL, NULL, NULL, NULL, 0, '0'),
(434, 'quia_541', 'Hic incidunt ut dolor dolor id praesentium maiores blanditiis omnis nobis.', 126, 'Dolor id facere explicabo perspiciatis hic suscipit animi.', 590, 46, 14, 50, 1, 1564226737, 1566784681, 0, NULL, NULL, NULL, NULL, 1, '0'),
(435, 'beatae_364', 'Inventore vitae suscipit quis nulla porro error iure sequi qui quis.', 126, 'Repellendus alias est voluptatum nihil quod recusandae facilis magnam.', 790, 15, 0, 280, 1, 1564226737, 1570404982, 0, NULL, NULL, NULL, NULL, 1, '0'),
(436, 'non_679', NULL, 126, 'Est facere sequi autem voluptatem consequatur delectus consectetur.', 710, 0, 0, 460, 1, 1564226737, 1569381788, 0, NULL, NULL, NULL, NULL, 1, '0'),
(437, 'maxime_908', 'Voluptas quam quis laborum debitis deserunt tenetur et voluptatum.', 126, 'Vel sed sint assumenda voluptas libero harum.', 470, 0, 45, 260, 1, 1564226737, 1568330488, 0, NULL, NULL, NULL, NULL, 1, '0'),
(438, 'nisi_880', 'Sapiente eos est odit odio amet sint in consequatur quia.', 126, 'Eveniet autem qui vel culpa neque fugiat.', 390, 0, 0, 650, 0, 1564226737, 1567892160, 0, NULL, NULL, NULL, NULL, 0, '0'),
(439, 'recusandae_865', 'Quis quo eos qui doloribus consequatur eos.', 126, 'Quis doloremque impedit doloremque sed et magni.', 160, 0, 0, 180, 1, 1564226737, 1568013145, 0, NULL, NULL, NULL, NULL, 1, '0'),
(440, 'nulla_232', NULL, 126, 'Sed ab et vero voluptate.', 480, 0, 0, 260, 1, 1564226737, 1567331302, 0, NULL, NULL, NULL, NULL, 1, '0'),
(441, 'quo_783', 'Eaque quia dolorum error accusamus dignissimos voluptatem et quia nam nam.', 126, 'Sed cumque voluptatem veniam itaque aut dolorem placeat et.', 650, 26, 0, 960, 0, 1564226737, 1573599808, 0, NULL, NULL, NULL, NULL, 0, '0'),
(442, 'quasi_977', NULL, 126, 'Quae error fugiat corporis animi labore non repudiandae.', 600, 0, 0, 210, 0, 1564226737, 1569914699, 0, NULL, NULL, NULL, NULL, 1, '0'),
(443, 'dolores_827', NULL, 126, 'Ipsum iure enim eos est dolor.', 260, 4, 26, 490, 0, 1564226737, 1571040917, 0, NULL, NULL, NULL, NULL, 0, '0'),
(444, 'possimus_482', 'Ab iure eum tempora dicta nam.', 126, 'Molestiae nihil architecto tempore sint provident iste voluptas.', 260, 37, 13, 270, 0, 1564226737, 1569500240, 0, NULL, NULL, NULL, NULL, 0, '0'),
(445, 'omnis_198', NULL, 126, 'Nemo eveniet autem consequuntur consectetur error atque.', 150, 30, 3, 810, 1, 1564226737, 1571768814, 0, NULL, NULL, NULL, NULL, 0, '0'),
(446, 'voluptatem_551', 'Quibusdam perspiciatis et vel quod enim molestiae.', 126, 'Omnis illum nesciunt architecto ut cum et eos natus.', 1000, 0, 8, 210, 1, 1564226737, 1565285752, 0, NULL, NULL, NULL, NULL, 1, '0'),
(447, 'reiciendis_582', NULL, 126, 'Eos eveniet rerum totam doloremque eum.', 60, 0, 36, 370, 1, 1564226737, 1573543684, 0, NULL, NULL, NULL, NULL, 0, '0'),
(448, 'ipsa_848', NULL, 126, 'Esse tempore laborum ut labore vel tenetur.', 960, 0, 0, 880, 1, 1564226737, 1573375515, 0, NULL, NULL, NULL, NULL, 1, '0'),
(449, 'eveniet_172', 'Perferendis est qui qui consequatur fugit molestias voluptatem voluptate rerum.', 126, 'Eum occaecati ut maiores quae nesciunt qui eaque.', 730, 7, 0, 940, 0, 1564226737, 1571909792, 0, NULL, NULL, NULL, NULL, 0, '0'),
(450, 'reiciendis_653', NULL, 126, 'Quae et eveniet repellendus sit et aspernatur reiciendis.', 730, 0, 0, 160, 1, 1564226737, 1571619797, 0, NULL, NULL, NULL, NULL, 1, '0'),
(451, 'soluta_510', 'Ut a eos architecto laboriosam adipisci.', 126, 'Eum corrupti nihil natus quia repellendus sed.', 270, 3, 19, 620, 0, 1564226737, 1569238877, 0, NULL, NULL, NULL, NULL, 1, '0'),
(452, 'quisquam_970', 'Cum esse voluptas itaque dolor dolores.', 126, 'Maxime id ut voluptatem consequatur.', 570, 30, 0, 280, 1, 1564226737, 1570863708, 0, NULL, NULL, NULL, NULL, 0, '0'),
(453, 'et_266', 'Eligendi quod quia eaque sed voluptas.', 126, 'Quia sint debitis dolorum cupiditate rem unde pariatur perspiciatis.', 240, 45, 31, 630, 1, 1564226737, 1572616607, 0, NULL, NULL, NULL, NULL, 1, '0'),
(454, 'omnis_683', 'Ut sint perferendis omnis aut mollitia et magni.', 126, 'Doloribus ullam ut similique dolore.', 610, 2, 22, 960, 0, 1564226737, 1568635477, 0, NULL, NULL, NULL, NULL, 1, '0'),
(455, 'minima_542', 'Qui perspiciatis sequi nesciunt cum vitae.', 126, 'Velit voluptatum non ratione molestiae.', 380, 0, 43, 870, 0, 1564226737, 1572087959, 0, NULL, NULL, NULL, NULL, 0, '0'),
(456, 'tenetur_767', NULL, 126, 'Qui fuga praesentium nesciunt consequuntur magni omnis.', 480, 0, 8, 610, 1, 1564226737, 1569144721, 0, NULL, NULL, NULL, NULL, 1, '0'),
(457, 'et_445', 'Dolores tempore esse et nemo voluptatem.', 126, 'Quidem nihil facere in maxime reiciendis sunt nobis.', 770, 28, 37, 810, 1, 1564226737, 1573935386, 0, NULL, NULL, NULL, NULL, 1, '0'),
(458, 'debitis_394', 'Recusandae a rerum facere unde voluptas omnis libero possimus.', 126, 'Nobis voluptatem et dolores omnis in enim.', 660, 0, 0, 250, 0, 1564226737, 1573572533, 0, NULL, NULL, NULL, NULL, 1, '0'),
(459, 'quam_452', 'Similique qui assumenda beatae eum saepe quidem quam.', 126, 'Quaerat amet qui laboriosam fugit ad.', 150, 40, 31, 480, 1, 1564226737, 1565544526, 0, NULL, NULL, NULL, NULL, 1, '0'),
(460, 'voluptatum_571', NULL, 126, 'Ut ipsa dolorem molestiae ducimus fuga.', 850, 16, 0, 50, 0, 1564226737, 1572640965, 0, NULL, NULL, NULL, NULL, 1, '0'),
(461, 'consequatur_766', 'Cupiditate sed inventore tenetur modi non dolores aliquam.', 126, 'Quisquam impedit sapiente illo tempore amet eum.', 590, 48, 6, 550, 1, 1564226737, 1566890112, 0, NULL, NULL, NULL, NULL, 0, '0'),
(462, 'molestias_341', 'Tempora quaerat excepturi et possimus et odio harum est.', 126, 'Et autem commodi dolores praesentium molestias.', 200, 0, 29, 200, 0, 1564226737, 1568877913, 0, NULL, NULL, NULL, NULL, 1, '0'),
(463, 'consequatur_748', 'Tenetur sed autem vitae ut.', 126, 'Quasi cum fugit ducimus optio sit cumque voluptas.', 120, 1, 0, 720, 0, 1564226737, 1573104976, 0, NULL, NULL, NULL, NULL, 0, '0'),
(464, 'est_850', 'Est nobis dolores consequatur sit aliquam earum facilis.', 126, 'Consectetur saepe dolorum itaque ullam et autem ex.', 760, 38, 0, 400, 0, 1564226737, 1565440770, 0, NULL, NULL, NULL, NULL, 1, '0'),
(465, 'consequatur_926', 'Voluptas velit eveniet molestiae blanditiis quo.', 126, 'Explicabo sit ea quibusdam qui iure eum.', 670, 0, 0, 820, 0, 1564226737, 1565862768, 0, NULL, NULL, NULL, NULL, 1, '0'),
(466, 'nihil_166', 'Ea natus temporibus voluptatum numquam ullam.', 126, 'Sint reprehenderit laboriosam hic quibusdam dolor.', 520, 0, 17, 280, 1, 1564226738, 1571573258, 0, NULL, NULL, NULL, NULL, 0, '0'),
(467, 'voluptas_804', NULL, 126, 'Est sint velit autem.', 770, 0, 0, 750, 0, 1564226738, 1573613963, 0, NULL, NULL, NULL, NULL, 1, '0'),
(468, 'pariatur_266', 'Ea vitae quibusdam blanditiis rerum cum qui iusto voluptatibus veniam deleniti.', 126, 'Ipsum neque aperiam reiciendis molestiae voluptatum sed omnis quam.', 570, 0, 18, 300, 1, 1564226738, 1568110578, 0, NULL, NULL, NULL, NULL, 0, '0'),
(469, 'doloribus_798', 'Omnis asperiores possimus ad soluta eos iste sapiente perferendis fugiat.', 126, 'Nesciunt repellendus eum inventore ad.', 230, 17, 0, 350, 1, 1564226738, 1569029914, 0, NULL, NULL, NULL, NULL, 1, '0'),
(470, 'omnis_283', NULL, 126, 'Doloremque voluptatibus maxime maiores quae enim.', 800, 33, 0, 870, 1, 1564226738, 1571204551, 0, NULL, NULL, NULL, NULL, 0, '0'),
(471, 'dignissimos_885', 'Asperiores nam voluptatem dolorem sequi ipsam exercitationem molestias ut rerum.', 126, 'Non minima voluptas est.', 470, 0, 0, 220, 1, 1564226738, 1568716778, 0, NULL, NULL, NULL, NULL, 0, '0'),
(472, 'suscipit_675', NULL, 126, 'Reprehenderit maiores enim qui et.', 380, 29, 28, 840, 1, 1564226738, 1568503811, 0, NULL, NULL, NULL, NULL, 1, '0'),
(473, 'voluptatem_574', NULL, 126, 'Ut nostrum deleniti et porro laudantium tenetur consequatur nam.', 720, 0, 0, 370, 0, 1564226738, 1568556651, 0, NULL, NULL, NULL, NULL, 0, '0'),
(474, 'eveniet_358', NULL, 126, 'In vel minima magni exercitationem consequatur.', 330, 14, 0, 310, 1, 1564226738, 1569845548, 0, NULL, NULL, NULL, NULL, 1, '0'),
(475, 'sed_144', NULL, 126, 'Eligendi sapiente tempora quae et deserunt occaecati id.', 450, 0, 45, 1000, 0, 1564226738, 1571067213, 0, NULL, NULL, NULL, NULL, 1, '0'),
(476, 'quis_215', NULL, 126, 'Aliquid possimus autem provident odio consequuntur autem nesciunt explicabo.', 750, 0, 0, 210, 0, 1564226738, 1565337844, 0, NULL, NULL, NULL, NULL, 1, '0'),
(477, 'perferendis_410', 'Eligendi soluta inventore praesentium magni cum.', 126, 'Provident consequatur aut distinctio illo nostrum.', 750, 21, 25, 50, 0, 1564226738, 1572639749, 0, NULL, NULL, NULL, NULL, 1, '0'),
(478, 'quia_684', NULL, 126, 'Labore suscipit laborum veritatis neque fuga consequatur.', 720, 13, 47, 450, 0, 1564226738, 1565619012, 0, NULL, NULL, NULL, NULL, 1, '0'),
(479, 'voluptas_711', 'Eum pariatur corporis voluptatem earum ratione.', 126, 'Necessitatibus reiciendis nemo minus sint perspiciatis.', 90, 13, 6, 360, 0, 1564226738, 1570792274, 0, NULL, NULL, NULL, NULL, 0, '0'),
(480, 'impedit_409', 'Voluptatem animi esse dicta expedita ut aspernatur consequatur voluptatibus vel.', 126, 'Quis aut et blanditiis alias doloribus.', 250, 0, 0, 330, 0, 1564226738, 1572229110, 0, NULL, NULL, NULL, NULL, 0, '0'),
(481, 'debitis_571', 'Sit pariatur dolor pariatur eos excepturi iusto.', 126, 'Quo porro in modi blanditiis laborum.', 530, 3, 31, 700, 0, 1564226738, 1572739533, 0, NULL, NULL, NULL, NULL, 0, '0'),
(482, 'excepturi_575', 'Mollitia deserunt ullam et non aut praesentium repudiandae qui.', 126, 'Deleniti maiores optio consequatur ut non voluptas.', 480, 0, 0, 790, 1, 1564226738, 1573141218, 0, NULL, NULL, NULL, NULL, 1, '0'),
(483, 'unde_466', 'Rerum consequatur libero itaque ut enim beatae tempore vel impedit.', 126, 'Non laudantium illum dolores corrupti soluta velit repellendus.', 120, 11, 1, 460, 1, 1564226738, 1572972212, 0, NULL, NULL, NULL, NULL, 1, '0'),
(484, 'architecto_944', NULL, 126, 'Quos dolores nihil placeat.', 330, 40, 0, 810, 1, 1564226738, 1565985661, 0, NULL, NULL, NULL, NULL, 0, '0'),
(485, 'et_266', 'Aut libero laboriosam quae incidunt qui assumenda modi numquam fuga.', 126, 'Perspiciatis numquam nisi et.', 320, 0, 0, 600, 1, 1564226738, 1572538548, 0, NULL, NULL, NULL, NULL, 0, '0'),
(486, 'voluptatibus_346', NULL, 126, 'Ratione quae similique eligendi reprehenderit nam.', 380, 0, 31, 980, 1, 1564226738, 1573769686, 0, NULL, NULL, NULL, NULL, 1, '0'),
(487, 'ipsum_539', 'Optio ducimus quos nihil impedit esse eum praesentium.', 126, 'Molestias voluptatem recusandae qui ad voluptas est dolorem.', 970, 0, 0, 900, 0, 1564226738, 1574186577, 0, NULL, NULL, NULL, NULL, 1, '0'),
(488, 'esse_834', NULL, 126, 'Dolorem asperiores molestiae expedita dolor laboriosam.', 450, 0, 0, 1000, 1, 1564226738, 1571317794, 0, NULL, NULL, NULL, NULL, 0, '0'),
(489, 'aut_956', 'Praesentium dolore voluptatem at rem voluptas rem molestiae illum voluptas.', 126, 'Aut neque et soluta fugiat.', 510, 0, 17, 830, 0, 1564226738, 1573798625, 0, NULL, NULL, NULL, NULL, 0, '0'),
(490, 'sed_164', NULL, 126, 'Et ut nesciunt reprehenderit et numquam vero et.', 430, 0, 0, 540, 0, 1564226738, 1566681357, 0, NULL, NULL, NULL, NULL, 0, '0'),
(491, 'eligendi_623', NULL, 126, 'Ex aut voluptatum voluptatum excepturi fugit.', 920, 0, 37, 740, 1, 1564226738, 1565681809, 0, NULL, NULL, NULL, NULL, 1, '0'),
(492, 'perspiciatis_411', 'Asperiores facilis necessitatibus dolores delectus soluta aut nesciunt nisi.', 126, 'Eligendi non culpa nihil aliquam.', 90, 0, 30, 400, 1, 1564226738, 1574081102, 0, NULL, NULL, NULL, NULL, 0, '0'),
(493, 'voluptatum_794', 'Veritatis similique sit suscipit maiores dolore impedit adipisci rerum placeat tenetur qui.', 126, 'Eligendi placeat distinctio ab facilis quidem.', 910, 8, 0, 270, 0, 1564226738, 1568408504, 0, NULL, NULL, NULL, NULL, 0, '0'),
(494, 'repellat_887', NULL, 126, 'Cupiditate inventore aut quis aut est eius dolores et.', 180, 0, 0, 650, 0, 1564226738, 1569002314, 0, NULL, NULL, NULL, NULL, 1, '0'),
(495, 'error_108', 'Ut quibusdam vel eum laudantium adipisci fugiat voluptatem nihil.', 126, 'Esse eveniet sint minus aut consequuntur.', 450, 0, 27, 630, 1, 1564226738, 1570056148, 0, NULL, NULL, NULL, NULL, 0, '0'),
(496, 'ea_166', NULL, 126, 'Quod dicta commodi atque quo minus.', 140, 0, 36, 380, 1, 1564226738, 1566806697, 0, NULL, NULL, NULL, NULL, 0, '0'),
(497, 'est_205', 'Illo est corporis sint numquam ea mollitia quia perferendis facere eius libero.', 126, 'Placeat voluptatibus tempora quidem qui.', 990, 27, 31, 890, 0, 1564226739, 1566985744, 0, NULL, NULL, NULL, NULL, 1, '0'),
(498, 'qui_117', 'Vel neque sit sint atque maiores placeat dolores vel.', 126, 'Voluptas sit occaecati amet.', 490, 50, 24, 440, 1, 1564226739, 1572802012, 0, NULL, NULL, NULL, NULL, 0, '0'),
(499, 'omnis_310', 'Occaecati recusandae quas sapiente expedita laboriosam ducimus consequatur voluptate aliquam.', 126, 'Odit blanditiis culpa non omnis illo exercitationem.', 350, 14, 0, 80, 1, 1564226739, 1572802037, 0, NULL, NULL, NULL, NULL, 1, '0'),
(500, 'qui_267', 'Assumenda pariatur reprehenderit dolorem alias omnis quibusdam hic quia quaerat quasi laborum.', 126, 'Doloribus ad neque ullam quibusdam sit delectus culpa officiis.', 50, 0, 0, 510, 0, 1564226739, 1568912852, 0, NULL, NULL, NULL, NULL, 0, '0'),
(501, 'sint_707', 'Nihil eum rerum qui est ea atque.', 126, 'Et aliquid suscipit iusto modi voluptatem sed.', 1000, 0, 0, 90, 0, 1564226739, 1565613892, 0, NULL, NULL, NULL, NULL, 0, '0'),
(502, 'voluptatem_923', NULL, 126, 'Quos consequuntur porro quod accusamus vero voluptate.', 570, 37, 7, 210, 0, 1564226739, 1572509868, 0, NULL, NULL, NULL, NULL, 0, '0'),
(503, 'hic_487', 'Dicta odit dignissimos et voluptatem quasi debitis hic praesentium quaerat qui.', 126, 'Aut quia at quod sunt.', 910, 9, 0, 520, 0, 1564226739, 1571341611, 0, NULL, NULL, NULL, NULL, 0, '0'),
(504, 'aut_944', 'Aut consequatur accusamus ut sit dolore possimus rerum qui odio aliquid.', 126, 'Optio aspernatur architecto et.', 1000, 0, 0, 160, 1, 1564226739, 1570575195, 0, NULL, NULL, NULL, NULL, 0, '0'),
(505, 'consectetur_151', 'Qui eum quibusdam delectus sunt blanditiis delectus quo.', 126, 'Asperiores ab qui ut id.', 750, 9, 0, 90, 1, 1564226739, 1569374540, 0, NULL, NULL, NULL, NULL, 1, '0'),
(506, 'voluptas_502', NULL, 126, 'Est architecto minima veritatis sed aut.', 640, 39, 24, 980, 0, 1564226739, 1566448139, 0, NULL, NULL, NULL, NULL, 1, '0'),
(507, 'error_579', 'Qui aut vitae et iusto ducimus sapiente ut quidem cupiditate quam.', 126, 'Voluptatem error dolore qui magni.', 870, 0, 26, 630, 1, 1564226739, 1566607730, 0, NULL, NULL, NULL, NULL, 0, '0'),
(508, 'laudantium_541', 'Quo minima esse rem quo ullam eos earum neque.', 126, 'Molestiae exercitationem neque enim cupiditate unde dolorem qui.', 310, 41, 6, 140, 1, 1564226739, 1567063185, 0, NULL, NULL, NULL, NULL, 1, '0'),
(509, 'et_852', 'Enim et voluptatem maiores et fugiat nostrum vitae vel maiores esse.', 126, 'Saepe aspernatur qui voluptatem dolorum maiores totam nobis.', 890, 50, 0, 730, 0, 1564226739, 1566788962, 0, NULL, NULL, NULL, NULL, 0, '0'),
(510, 'beatae_890', 'Praesentium est sit eum nemo perferendis optio culpa et.', 126, 'Aliquid voluptatem mollitia molestias tempora non et architecto.', 440, 2, 0, 410, 0, 1564226739, 1566115343, 0, NULL, NULL, NULL, NULL, 1, '0'),
(511, 'porro_429', NULL, 126, 'Dicta ipsa voluptates officia vel.', 610, 0, 2, 420, 1, 1564226739, 1569561326, 0, NULL, NULL, NULL, NULL, 1, '0'),
(512, 'distinctio_979', 'Hic qui excepturi accusamus officia doloremque autem ut.', 126, 'Eum recusandae quia sit ut molestiae ut quo qui.', 940, 0, 1, 480, 0, 1564226739, 1567871474, 0, NULL, NULL, NULL, NULL, 1, '0'),
(513, 'aspernatur_205', NULL, 126, 'Eveniet ad molestiae est odit ratione et.', 600, 10, 0, 750, 1, 1564226739, 1569144737, 0, NULL, NULL, NULL, NULL, 1, '0'),
(514, 'id_969', 'Voluptatem quisquam accusantium eos qui iste.', 126, 'Quis qui similique accusamus ut vitae quis sed voluptate.', 640, 0, 42, 740, 1, 1564226739, 1572365084, 0, NULL, NULL, NULL, NULL, 0, '0'),
(515, 'explicabo_656', 'Architecto praesentium sit aut cumque porro ut dolores dolores quibusdam.', 126, 'Neque officiis et minus perferendis qui id.', 230, 0, 0, 720, 0, 1564226739, 1573202851, 0, NULL, NULL, NULL, NULL, 0, '0'),
(516, 'nemo_863', NULL, 126, 'Nihil vel nisi rerum et nobis.', 120, 8, 0, 930, 1, 1564226739, 1572257031, 0, NULL, NULL, NULL, NULL, 0, '0'),
(517, 'unde_622', 'Consequuntur voluptas distinctio placeat consequatur odit commodi.', 126, 'Totam et quasi optio vitae deleniti nihil debitis.', 1000, 25, 0, 160, 1, 1564226739, 1572723063, 0, NULL, NULL, NULL, NULL, 1, '0'),
(518, 'voluptatem_220', NULL, 126, 'Beatae quisquam quis sed aut enim.', 980, 0, 0, 440, 1, 1564226739, 1568504640, 0, NULL, NULL, NULL, NULL, 1, '0'),
(519, 'qui_267', NULL, 126, 'Aut veniam soluta in laudantium.', 360, 0, 0, 200, 0, 1564226739, 1569054671, 0, NULL, NULL, NULL, NULL, 1, '0'),
(520, 'provident_850', 'Et dolorum iste aspernatur adipisci eaque et alias earum odit id.', 126, 'Aliquam dolor labore est autem dolore.', 500, 0, 15, 520, 0, 1564226739, 1565413814, 0, NULL, NULL, NULL, NULL, 0, '0'),
(521, 'et_832', 'Fuga illo quis qui non temporibus.', 126, 'Officiis soluta et a nisi pariatur laborum molestiae.', 610, 0, 0, 420, 1, 1564226739, 1568047950, 0, NULL, NULL, NULL, NULL, 0, '0'),
(522, 'dolorem_810', 'Mollitia asperiores nam qui aut eos rem quia non quia.', 126, 'Sequi laboriosam consequuntur id nisi facere.', 290, 0, 36, 660, 0, 1564226739, 1569128042, 0, NULL, NULL, NULL, NULL, 1, '0'),
(523, 'quia_656', NULL, 126, 'Modi sit sed nulla reiciendis est aut.', 440, 45, 7, 530, 0, 1564226739, 1571180200, 0, NULL, NULL, NULL, NULL, 1, '0'),
(524, 'voluptatem_126', NULL, 126, 'Odit necessitatibus consequatur deleniti in doloribus.', 800, 24, 13, 570, 1, 1564226739, 1566084123, 0, NULL, NULL, NULL, NULL, 1, '0'),
(525, 'eum_447', NULL, 126, 'Modi quas itaque magnam odio exercitationem.', 110, 0, 10, 600, 1, 1564226739, 1572380337, 0, NULL, NULL, NULL, NULL, 0, '0'),
(526, 'doloremque_497', 'Non dolorem omnis impedit cum est amet recusandae quia.', 126, 'Beatae nobis rem enim qui et sed repellendus.', 680, 0, 0, 730, 1, 1564226739, 1566931648, 0, NULL, NULL, NULL, NULL, 1, '0'),
(527, 'reprehenderit_283', NULL, 126, 'Optio quis blanditiis eaque unde commodi qui repellat iste.', 330, 0, 0, 710, 0, 1564226739, 1568561123, 0, NULL, NULL, NULL, NULL, 1, '0'),
(528, 'dicta_756', NULL, 126, 'Non repudiandae aut voluptatem dolorem tempora omnis.', 500, 5, 0, 490, 1, 1564226739, 1573036176, 0, NULL, NULL, NULL, NULL, 1, '0'),
(529, 'et_471', 'Est est et magni sit odio molestiae veritatis omnis quos ut rerum.', 126, 'Soluta quo neque dolore eos enim.', 760, 19, 5, 320, 0, 1564226739, 1566970124, 0, NULL, NULL, NULL, NULL, 1, '0'),
(530, 'dolorem_569', NULL, 126, 'Voluptatem mollitia animi dolorum esse qui.', 620, 0, 0, 280, 0, 1564226740, 1568676334, 0, NULL, NULL, NULL, NULL, 0, '0'),
(531, 'voluptate_501', 'Voluptatem voluptatem velit iusto maiores velit vero quasi laudantium optio.', 126, 'Modi officiis dicta dignissimos voluptatem dolor est consequatur.', 250, 44, 0, 350, 0, 1564226740, 1573301702, 0, NULL, NULL, NULL, NULL, 0, '0'),
(532, 'qui_761', 'Ipsam quibusdam earum commodi maxime ea quod placeat rerum incidunt voluptas.', 126, 'Vero ipsum ipsum quia et.', 220, 44, 13, 960, 0, 1564226740, 1566382736, 0, NULL, NULL, NULL, NULL, 1, '0'),
(533, 'nostrum_371', 'Saepe aut sint quia beatae enim beatae praesentium qui commodi voluptatum.', 126, 'Officia repellat non perspiciatis culpa enim.', 990, 17, 19, 460, 1, 1564226740, 1567704427, 0, NULL, NULL, NULL, NULL, 0, '0'),
(534, 'ab_973', 'Nostrum veritatis veniam expedita consectetur et quidem.', 126, 'Impedit qui nam distinctio necessitatibus sapiente.', 240, 17, 12, 580, 0, 1564226740, 1570020816, 0, NULL, NULL, NULL, NULL, 1, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(535, 'similique_331', 'Vero reprehenderit autem consectetur et odio voluptas minima omnis.', 126, 'Quo delectus qui voluptatem enim.', 100, 46, 46, 320, 1, 1564226740, 1569362878, 0, NULL, NULL, NULL, NULL, 0, '0'),
(536, 'voluptatibus_218', 'Eveniet recusandae sapiente nemo totam inventore.', 126, 'Suscipit praesentium repudiandae ad tempore.', 620, 0, 0, 260, 0, 1564226740, 1572189381, 0, NULL, NULL, NULL, NULL, 1, '0'),
(537, 'modi_177', 'Officia qui voluptatem omnis ut sint et voluptatem sit accusantium.', 126, 'Sed et aut in.', 490, 0, 0, 760, 0, 1564226740, 1566945631, 0, NULL, NULL, NULL, NULL, 1, '0'),
(538, 'sapiente_773', 'Maiores debitis perferendis explicabo et minima maxime hic eveniet.', 126, 'Voluptatum qui maiores est quos incidunt sint enim.', 120, 0, 37, 90, 0, 1564226740, 1565768236, 0, NULL, NULL, NULL, NULL, 0, '0'),
(539, 'veniam_639', NULL, 126, 'Autem ut omnis dolor corporis illo eveniet.', 640, 37, 0, 150, 1, 1564226740, 1571197861, 0, NULL, NULL, NULL, NULL, 1, '0'),
(540, 'illum_638', 'Unde et ratione qui quam reiciendis libero.', 126, 'Officia unde consequuntur tempore delectus sequi est et molestias.', 590, 26, 18, 640, 0, 1564226740, 1569430844, 0, NULL, NULL, NULL, NULL, 1, '0'),
(541, 'sed_350', NULL, 126, 'Minus voluptatem fugit voluptas ex.', 90, 0, 0, 870, 0, 1564226740, 1571468655, 0, NULL, NULL, NULL, NULL, 1, '0'),
(542, 'dolor_793', 'Sit dolor quas quam molestiae possimus architecto voluptas eum.', 126, 'Doloremque nobis ut similique et molestias.', 790, 19, 25, 450, 1, 1564226740, 1570813389, 0, NULL, NULL, NULL, NULL, 1, '0'),
(543, 'eos_987', NULL, 126, 'Accusamus aperiam reiciendis corrupti.', 420, 23, 0, 600, 1, 1564226740, 1569646061, 0, NULL, NULL, NULL, NULL, 1, '0'),
(544, 'doloremque_202', 'Porro iure qui et blanditiis qui at qui.', 126, 'Quas laudantium iusto fugit possimus laborum omnis.', 950, 12, 0, 890, 1, 1564226740, 1567210186, 0, NULL, NULL, NULL, NULL, 1, '0'),
(545, 'facere_844', NULL, 126, 'Ipsam recusandae asperiores qui culpa dolore iure iure.', 770, 0, 0, 320, 0, 1564226740, 1565834325, 0, NULL, NULL, NULL, NULL, 0, '0'),
(546, 'eius_496', NULL, 126, 'Nesciunt esse quo possimus ut molestias.', 340, 19, 0, 730, 0, 1564226740, 1570622953, 0, NULL, NULL, NULL, NULL, 0, '0'),
(547, 'tempore_165', NULL, 126, 'Commodi consectetur sit dicta quidem.', 590, 9, 0, 950, 1, 1564226740, 1568126900, 0, NULL, NULL, NULL, NULL, 0, '0'),
(548, 'facere_538', NULL, 126, 'Earum blanditiis ducimus eveniet id cumque.', 520, 0, 0, 470, 1, 1564226740, 1566627298, 0, NULL, NULL, NULL, NULL, 0, '0'),
(549, 'repellendus_697', NULL, 126, 'Esse nam itaque dolor omnis eos.', 380, 6, 20, 150, 0, 1564226740, 1571166806, 0, NULL, NULL, NULL, NULL, 0, '0'),
(550, 'non_393', NULL, 126, 'Id beatae omnis earum rerum enim eos.', 770, 6, 0, 560, 0, 1564226740, 1570497357, 0, NULL, NULL, NULL, NULL, 0, '0');

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
(1, 'Eligendi id.', '88385', 'alice.romaguera@mitchell.com', 'et', 'sequi', '1564226740', 'sint', '5 minutes', 'Optio dolor ut asperiores placeat numquam quod.'),
(2, 'Et numquam iure.', '36110', 'catharine.bergnaum@gmail.com', 'dolorem', 'sed', '1564226740', 'fugit', '12 minutes', 'Ipsa neque aut sunt ratione velit est qui recusandae facilis magnam.'),
(3, 'Molestiae assumenda.', '11220', 'giovanna.brakus@yahoo.com', 'aut', 'velit', '1564226740', 'beatae', '6 minutes', 'Rerum nihil numquam rem animi error veniam quam.'),
(4, 'Voluptatum eveniet fugit.', '84690', 'franecki.jared@medhurst.info', 'modi', 'facilis', '1564226740', 'tempora', '22 minutes', 'Eligendi quis est libero ad.'),
(5, 'Est consequuntur.', '97497', 'crystel.wunsch@cruickshank.com', 'et', 'omnis', '1564226740', 'cumque', '22 minutes', 'Consectetur hic quas aut ratione aut.'),
(6, 'Sapiente vitae accusamus perspiciatis inventore.', '97521', 'jnikolaus@denesik.net', 'soluta', 'tempore', '1564226740', 'qui', '18 minutes', 'Sed vero consectetur quis laudantium omnis perspiciatis et voluptatem eligendi maiores ut.'),
(7, 'Et repudiandae soluta nostrum velit.', '33013', 'jerald.veum@watsica.info', 'et', 'ullam', '1564226740', 'consequatur', '23 minutes', 'Dolore qui dolores tempore quia delectus.'),
(8, 'Perferendis cumque.', '91205', 'bashirian.lenore@flatley.org', 'dolorum', 'quod', '1564226740', 'magnam', '24 minutes', 'Magnam voluptatem explicabo accusamus voluptatum.'),
(9, 'Et quaerat nam ipsum consequatur.', '51400', 'spinka.kiarra@yahoo.com', 'nobis', 'dignissimos', '1564226740', 'dignissimos', '3 minutes', 'Libero eveniet inventore enim ut ipsa rerum tempora recusandae.'),
(10, 'Assumenda perferendis sunt sed.', '35349', 'feil.scarlett@gmail.com', 'quia', 'beatae', '1564226740', 'tempore', '20 minutes', 'Est magni aut voluptate est magni et consectetur quo aliquam quam saepe hic eligendi.'),
(11, 'Cum dolor.', '90126', 'leila.king@erdman.info', 'voluptatem', 'quis', '1564226740', 'enim', '11 minutes', 'Dolorem consequatur id vel et ut mollitia quia sunt laboriosam ex.'),
(12, 'Pariatur eos aut in.', '44938', 'schneider.lew@towne.org', 'et', 'dolores', '1564226740', 'fuga', '14 minutes', 'Nihil voluptatum doloremque nam repellendus dolores quis veniam asperiores quae.'),
(13, 'Consequatur eos aut ut.', '36008', 'marion98@hotmail.com', 'accusamus', 'occaecati', '1564226740', 'eum', '25 minutes', 'Qui et in a sed.'),
(14, 'Odio sunt repudiandae.', '38496', 'jordon.schroeder@yahoo.com', 'voluptatem', 'voluptas', '1564226740', 'dolores', '21 minutes', 'Fuga est placeat vel aliquid ab vel.'),
(15, 'Suscipit in ut assumenda.', '85227', 'urice@gleichner.com', 'ducimus', 'dolore', '1564226740', 'temporibus', '22 minutes', 'Rem atque voluptatum illum voluptatem quod sit quam vel.'),
(16, 'Quia nobis numquam cumque.', '31876', 'ugerhold@yahoo.com', 'autem', 'eos', '1564226740', 'enim', '5 minutes', 'Iste voluptas dignissimos ad consequatur cupiditate non quasi.'),
(17, 'Nobis ab cumque.', '71596', 'breanne74@vonrueden.com', 'blanditiis', 'quia', '1564226740', 'at', '15 minutes', 'Et dolorem cum voluptas quas dolorum dolorem dignissimos qui quisquam nihil illo.'),
(18, 'Autem facere.', '96840', 'hosea86@gmail.com', 'qui', 'aut', '1564226740', 'nisi', '24 minutes', 'Aspernatur reiciendis sed vero et cumque magnam a laudantium quia.'),
(19, 'Similique est eum.', '57604', 'rherzog@weissnat.net', 'praesentium', 'deleniti', '1564226740', 'illum', '24 minutes', 'Maiores eum consequatur qui animi quibusdam perspiciatis hic non ea reiciendis hic.'),
(20, 'In harum iure dignissimos labore.', '92330', 'bessie.stracke@pagac.com', 'sit', 'quos', '1564226740', 'autem', '28 minutes', 'Inventore unde eius aut voluptates.'),
(21, 'Et sunt ullam suscipit dolore.', '39357', 'scremin@gaylord.com', 'ab', 'numquam', '1564226740', 'cupiditate', '10 minutes', 'Qui animi itaque aperiam aut excepturi quae doloremque veritatis.'),
(22, 'Sit voluptate et consectetur.', '86194', 'howe.dejon@hotmail.com', 'in', 'quo', '1564226740', 'perspiciatis', '4 minutes', 'Earum totam et esse temporibus et totam minima.'),
(23, 'Consequatur rerum dolorem libero.', '51603', 'estella65@rath.info', 'magni', 'et', '1564226741', 'sunt', '27 minutes', 'Officia repellendus tempore et doloremque dolor et molestiae.'),
(24, 'Maiores ea similique enim.', '72421', 'xleannon@yahoo.com', 'totam', 'asperiores', '1564226741', 'voluptate', '3 minutes', 'Pariatur veniam hic totam eum et assumenda ipsum laborum iusto.'),
(25, 'Omnis deleniti et at.', '34699', 'wilkinson.idella@beahan.com', 'asperiores', 'voluptates', '1564226741', 'hic', '11 minutes', 'Voluptas eos explicabo repellat in quaerat non.'),
(26, 'Quasi est assumenda.', '88356', 'elna80@ruecker.com', 'velit', 'et', '1564226741', 'nihil', '28 minutes', 'Quasi dolorum minus quod aliquid rerum eum libero itaque quia libero est.'),
(27, 'Quia sunt numquam.', '97800', 'boyle.betsy@hartmann.info', 'dolor', 'veniam', '1564226741', 'voluptas', '13 minutes', 'Dolore culpa est ut mollitia non doloremque dolor eos aut.'),
(28, 'Sunt voluptas nihil.', '24588', 'icummerata@gmail.com', 'repudiandae', 'inventore', '1564226741', 'laudantium', '27 minutes', 'Odio iure incidunt a rerum explicabo.'),
(29, 'Non atque.', '72740', 'odie.kling@veum.com', 'ea', 'odit', '1564226741', 'rerum', '7 minutes', 'Vel ratione animi consequatur labore et ea alias.'),
(30, 'Necessitatibus odit.', '10892', 'jaren.beer@yahoo.com', 'repellat', 'quasi', '1564226741', 'voluptas', '7 minutes', 'In quia quis odit sapiente deleniti qui sapiente provident aliquid.'),
(31, 'Voluptate necessitatibus ipsum vero pariatur.', '50627', 'fmueller@gmail.com', 'provident', 'molestias', '1564226741', 'quidem', '17 minutes', 'Consequatur natus et quam nobis ut occaecati voluptate omnis libero in repellat perspiciatis.'),
(32, 'Laborum consequatur voluptas omnis.', '39443', 'maximillia39@kemmer.com', 'odio', 'quos', '1564226741', 'ut', '6 minutes', 'Quia distinctio laborum nobis corrupti excepturi nam nobis sequi quia.'),
(33, 'Quasi possimus.', '79245', 'margarita36@kuvalis.com', 'similique', 'velit', '1564226741', 'ut', '22 minutes', 'Et perspiciatis distinctio quod rerum odit beatae.'),
(34, 'Culpa sequi et at.', '84626', 'rudy01@prohaska.com', 'perferendis', 'non', '1564226741', 'consequatur', '12 minutes', 'Temporibus porro nesciunt explicabo sed incidunt sunt itaque ipsam sapiente.'),
(35, 'Molestiae consequatur eveniet unde necessitatibus.', '83461', 'lauryn19@gmail.com', 'nemo', 'recusandae', '1564226741', 'omnis', '23 minutes', 'Et recusandae et et aut autem recusandae.'),
(36, 'Neque sit quia.', '34071', 'einar.yundt@hudson.com', 'sit', 'ullam', '1564226741', 'nostrum', '1 minutes', 'Voluptas ad odit occaecati odit.'),
(37, 'Sit eligendi alias.', '13103', 'jazlyn.mann@kuphal.com', 'eligendi', 'voluptatem', '1564226741', 'velit', '15 minutes', 'Cupiditate atque tempora repudiandae dolorum.'),
(38, 'Cupiditate vel doloremque et.', '55838', 'jzboncak@damore.biz', 'officia', 'ipsam', '1564226741', 'ut', '9 minutes', 'In ut nihil doloribus.'),
(39, 'Minima perferendis adipisci harum.', '29453', 'flavie86@kunze.biz', 'dolor', 'et', '1564226741', 'quia', '8 minutes', 'Neque optio amet repudiandae recusandae dolor.'),
(40, 'Eos et molestiae molestiae quidem.', '73766', 'rcrooks@gmail.com', 'qui', 'non', '1564226741', 'vero', '30 minutes', 'Voluptatem animi quis enim aliquid quia blanditiis doloremque reiciendis voluptas quia.'),
(41, 'Ratione cum.', '18402', 'jerde.nia@runte.com', 'et', 'quam', '1564226741', 'ut', '30 minutes', 'Mollitia ut numquam id natus animi ea.'),
(42, 'Est ipsum voluptatibus et.', '45193', 'mervin61@kutch.info', 'repudiandae', 'consequuntur', '1564226741', 'consectetur', '2 minutes', 'Recusandae illo iure est necessitatibus fugiat vitae consequatur atque.'),
(43, 'Dolorum voluptatem facere sapiente.', '30984', 'philip90@white.com', 'dolores', 'laboriosam', '1564226741', 'quisquam', '19 minutes', 'Et libero labore nihil dolor voluptatem incidunt tempora aut laudantium.'),
(44, 'Aut quis.', '57797', 'sawayn.roma@hotmail.com', 'voluptatibus', 'modi', '1564226741', 'veniam', '18 minutes', 'Quod occaecati rem unde et sunt ratione earum.'),
(45, 'Eveniet quasi voluptas.', '96829', 'rbotsford@emmerich.com', 'occaecati', 'placeat', '1564226741', 'aut', '25 minutes', 'In cumque minus corrupti accusamus ratione eveniet officiis quo id voluptates.'),
(46, 'Nihil ut ut.', '26729', 'margret.murazik@yahoo.com', 'temporibus', 'ipsum', '1564226741', 'aut', '12 minutes', 'Quae est sit sed expedita eligendi vero.'),
(47, 'Temporibus quibusdam eveniet.', '84232', 'flynch@hotmail.com', 'cum', 'nihil', '1564226741', 'sit', '15 minutes', 'Quia dignissimos blanditiis voluptatem id facere eos explicabo.'),
(48, 'Perspiciatis sunt.', '56829', 'ubailey@anderson.com', 'animi', 'sequi', '1564226741', 'nisi', '22 minutes', 'Distinctio ratione incidunt nobis rem dolores occaecati accusamus nobis sunt deserunt.'),
(49, 'Quaerat autem impedit.', '64869', 'vpagac@jacobi.com', 'alias', 'est', '1564226741', 'quos', '23 minutes', 'Tenetur et laudantium nobis velit et facilis ipsum natus adipisci tenetur.'),
(50, 'Culpa dolorem sit nobis quis quam.', '27467', 'annabelle.champlin@okeefe.info', 'architecto', 'inventore', '1564226741', 'sint', '22 minutes', 'Recusandae omnis dolor totam vel dolorem voluptas soluta ut molestias reiciendis.');

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
(1, 'doloribus', '22311', 'Natus deleniti.', 'Sunt quidem voluptate.', 'Omnis sed enim occaecati repudiandae.', '1564226741', '', 'Aperiam odio voluptas quasi.'),
(2, 'natus', '92376', 'Possimus et.', 'Possimus numquam.', 'Soluta eum aut aut autem sapiente.', '1564226741', '', 'Eos itaque assumenda magnam sed enim.'),
(3, 'enim', '55025', 'Ipsum eum.', 'Assumenda ut consectetur.', 'Illum eligendi autem provident iusto.', '1564226741', '', 'Enim ad fugit et reprehenderit.'),
(4, 'accusamus', '45584', 'Et eius aut.', 'Delectus explicabo.', 'Exercitationem occaecati ab nulla.', '1564226741', '', 'Natus qui beatae perferendis ipsum.'),
(5, 'dolores', '26817', 'Et magnam.', 'Labore facere.', 'Harum soluta explicabo totam voluptatem ab qui.', '1564226741', '', 'Quis quaerat quo sit vel.'),
(6, 'omnis', '10254', 'Labore iure.', 'Sed.', 'Aliquam consequatur necessitatibus rem et vero nisi.', '1564226741', '', 'Quia eos corrupti eius rerum.'),
(7, 'soluta', '26229', 'Id non eius.', 'Et illo.', 'Suscipit deserunt ut repellendus.', '1564226741', '', 'Animi ducimus expedita commodi.'),
(8, 'voluptates', '47296', 'Ad laborum sunt.', 'Aut et.', 'Et eos praesentium sunt placeat.', '1564226741', '', 'Commodi omnis quis placeat.'),
(9, 'deleniti', '63046', 'At esse.', 'Veritatis.', 'Voluptatem omnis accusamus ratione et illum.', '1564226741', '', 'Ex itaque nulla nam doloribus iure.'),
(10, 'distinctio', '99305', 'Minus ducimus repellat.', 'Quae cum.', 'Libero quisquam placeat ut quia ea.', '1564226741', '', 'Quis repellendus sint sit.'),
(11, 'deserunt', '81676', 'Molestiae qui dolorem.', 'Vitae.', 'Earum pariatur eius nihil.', '1564226741', '', 'Voluptatem nam mollitia aut molestiae.'),
(12, 'tempora', '71093', 'Rerum voluptas.', 'Ullam.', 'Ipsam sed alias voluptatem.', '1564226741', '', 'Qui consequatur et ut.'),
(13, 'saepe', '22893', 'Officia.', 'Exercitationem velit.', 'Perspiciatis necessitatibus atque perspiciatis.', '1564226741', '', 'Alias corporis ut non tenetur.'),
(14, 'qui', '79962', 'Ut facere sed.', 'Eos cupiditate.', 'Vitae aliquid quo in deserunt.', '1564226741', '', 'Voluptatem numquam quos reiciendis.'),
(15, 'qui', '49647', 'Illo quia.', 'Consequatur velit doloribus.', 'Temporibus similique assumenda iure.', '1564226741', '', 'Sequi eum facilis vel.'),
(16, 'et', '84443', 'Illum.', 'Veniam sit.', 'Totam qui veniam veniam sunt.', '1564226741', '', 'Qui eos quos accusamus quas consequatur fugit.'),
(17, 'architecto', '20482', 'Consequatur magnam.', 'Reprehenderit tempore.', 'Qui et aut.', '1564226741', '', 'Nesciunt iste vel veritatis illum quas.'),
(18, 'qui', '41055', 'Sed corrupti.', 'Consequatur odit.', 'Non veniam inventore at aperiam vero.', '1564226741', '', 'Officia dicta error voluptas eligendi minima.'),
(19, 'illo', '98114', 'Est laboriosam consequatur.', 'Est.', 'Qui eos quis commodi odio.', '1564226741', '', 'Corrupti et dolor commodi.'),
(20, 'et', '15386', 'Est placeat.', 'Nihil illo.', 'Eveniet error facere.', '1564226741', '', 'Maiores ullam nostrum unde quaerat vitae quae autem.'),
(21, 'dolorum', '93868', 'Quis sit.', 'Repudiandae quae delectus.', 'Ullam quisquam nostrum dolore aut.', '1564226741', '', 'Blanditiis quisquam quis fuga.'),
(22, 'libero', '55666', 'Saepe at.', 'Quia quidem.', 'Ullam officia natus perferendis.', '1564226741', '', 'Dicta et ad libero.'),
(23, 'sint', '58792', 'Velit.', 'Et.', 'Doloribus non iure ut rerum.', '1564226741', '', 'Est delectus nobis recusandae.'),
(24, 'suscipit', '22368', 'Dolore eum.', 'Qui eius.', 'Libero veritatis impedit.', '1564226741', '', 'Ex consequatur nobis veniam perferendis deleniti.'),
(25, 'adipisci', '38393', 'Et porro et.', 'Libero consequatur fugit.', 'Omnis reprehenderit sit consectetur.', '1564226741', '', 'Nihil veniam totam.'),
(26, 'ex', '26439', 'Modi ipsum molestiae.', 'Assumenda quas.', 'At voluptas vel error minima necessitatibus.', '1564226741', '', 'Quibusdam omnis vel quo magni consequatur ipsum laborum fugiat.'),
(27, 'dicta', '82153', 'Doloremque laborum.', 'Harum inventore.', 'Ea ea nam ut.', '1564226741', '', 'Unde molestias excepturi.'),
(28, 'commodi', '77534', 'Quas ipsam.', 'Dignissimos atque earum.', 'Autem voluptas esse.', '1564226741', '', 'Qui eveniet cumque.'),
(29, 'dolore', '34591', 'Fuga.', 'Veritatis vel.', 'Et aut explicabo quaerat velit aut sapiente officia recusandae.', '1564226741', '', 'Cum id sunt nisi.'),
(30, 'quo', '40274', 'Non.', 'Enim id.', 'Ipsa sit officia recusandae corporis ea.', '1564226741', '', 'Dicta aliquam at.'),
(31, 'molestias', '50814', 'Beatae.', 'Laudantium alias.', 'Est corporis dolorum ea.', '1564226741', '', 'Dolores aut voluptas suscipit ea consequatur omnis consequatur.'),
(32, 'veritatis', '90030', 'Nisi ducimus.', 'Facere reprehenderit.', 'Qui dicta reprehenderit enim.', '1564226741', '', 'Repellat iusto qui cumque veniam.'),
(33, 'harum', '70225', 'Explicabo necessitatibus.', 'Voluptate tempore quo.', 'Est est provident natus.', '1564226741', '', 'Laudantium vitae labore non minus.'),
(34, 'et', '19105', 'Nisi.', 'Hic in.', 'Est a harum at eos autem perferendis.', '1564226741', '', 'Sunt et illo officia nostrum velit.'),
(35, 'numquam', '30400', 'Totam dicta quia.', 'Temporibus culpa.', 'Voluptatibus rerum voluptatem sunt tenetur.', '1564226741', '', 'Aut voluptas quia non dolorum facere.'),
(36, 'odit', '63313', 'Deleniti laborum deleniti.', 'Sed quia.', 'Quisquam quo ducimus ad.', '1564226741', '', 'Dolores dignissimos quaerat assumenda rerum maiores quibusdam.'),
(37, 'at', '58845', 'Nisi qui tempora.', 'Eligendi porro.', 'Sint officia quam et deleniti eos.', '1564226741', '', 'Est qui error aut vel aliquam.'),
(38, 'sunt', '12517', 'Ullam ipsam.', 'Ipsum fugit.', 'Molestiae similique eos quos aliquid.', '1564226741', '', 'Neque sit laboriosam reprehenderit est doloremque aut consequuntur.'),
(39, 'assumenda', '43292', 'Eos.', 'Corporis.', 'Laboriosam dolor.', '1564226741', '', 'Perferendis laudantium debitis nam.'),
(40, 'omnis', '61644', 'Unde accusantium.', 'Consectetur laborum.', 'Praesentium a doloremque dignissimos.', '1564226741', '', 'Qui ea sit quidem et.'),
(41, 'magni', '15015', 'Est molestiae.', 'Sunt repellat.', 'Asperiores in perspiciatis vel qui voluptatibus doloribus maxime.', '1564226741', '', 'Illo eos velit non iste.'),
(42, 'dolor', '45191', 'Rerum.', 'Vitae similique.', 'Deserunt a voluptatem.', '1564226741', '', 'Reiciendis dolorem id odio provident.'),
(43, 'laborum', '65645', 'Mollitia iusto adipisci.', 'Molestiae modi.', 'Quibusdam vel non neque.', '1564226741', '', 'In commodi reprehenderit accusamus tenetur nesciunt commodi.'),
(44, 'et', '79323', 'Quod ea.', 'Facilis magni.', 'Delectus a et libero dolore velit porro.', '1564226741', '', 'Ea non et consequatur quas.'),
(45, 'nemo', '71558', 'Iure voluptas.', 'Est reprehenderit.', 'Est quae error non.', '1564226741', '', 'Et ut deleniti illum harum.'),
(46, 'deleniti', '40316', 'Quis ad dolorum.', 'Ipsum ipsa expedita.', 'Vitae sit culpa corrupti nostrum.', '1564226741', '', 'Est ratione et.'),
(47, 'optio', '95711', 'Necessitatibus in.', 'Et.', 'Dignissimos tenetur veritatis molestiae.', '1564226741', '', 'Pariatur tempora commodi quis alias debitis et incidunt.'),
(48, 'eos', '76641', 'A tenetur.', 'Numquam et ullam.', 'Non aut sint voluptatum.', '1564226741', '', 'Quia ratione molestiae voluptate itaque.'),
(49, 'dolorem', '46093', 'Rerum animi.', 'Consequatur ullam itaque.', 'Explicabo inventore laborum illo alias.', '1564226741', '', 'Sed sit provident voluptas non quisquam asperiores blanditiis enim.'),
(50, 'eius', '95863', 'Enim quisquam.', 'Autem assumenda.', 'Odit eos cum molestias.', '1564226741', '', 'Est consequatur voluptatibus.');

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
(1, 'quaerat Sec', 4, '[\"70\",\"89\",\"103\",\"72\",\"96\"]'),
(2, 'rerum Sec', 5, '[\"59\",\"55\",\"101\",\"63\",\"61\",\"62\"]'),
(3, 'distinctio Sec', 8, '[\"101\",\"56\"]'),
(4, 'sit Sec', 9, '[\"61\",\"74\",\"72\",\"90\",\"66\",\"73\",\"58\"]'),
(5, 'recusandae Sec', 8, '[\"65\",\"56\",\"101\"]'),
(6, 'voluptas Sec', 6, '[\"56\",\"83\",\"67\",\"85\",\"63\",\"76\"]'),
(7, 'veniam Sec', 9, '[\"64\",\"58\",\"72\",\"66\",\"84\"]'),
(8, 'eius Sec', 3, '[\"87\",\"103\",\"72\"]'),
(9, 'facilis Sec', 1, '[\"78\",\"63\",\"64\",\"65\"]'),
(10, 'laudantium Sec', 8, '[\"65\",\"75\"]'),
(11, 'cum Sec', 1, '[\"78\",\"89\",\"65\",\"57\"]'),
(12, 'veniam Sec', 7, '[\"92\",\"90\",\"82\",\"65\",\"85\"]'),
(13, 'dolorem Sec', 1, '[\"76\",\"63\",\"58\",\"89\"]'),
(14, 'omnis Sec', 9, '[\"90\",\"58\",\"102\",\"74\",\"84\",\"73\",\"64\"]'),
(15, 'natus Sec', 5, '[\"55\",\"62\",\"59\",\"80\"]'),
(16, 'voluptate Sec', 4, '[\"72\",\"68\",\"83\",\"67\",\"59\"]'),
(17, 'a Sec', 5, '[\"62\",\"59\",\"83\",\"66\"]'),
(18, 'nihil Sec', 8, '[\"65\",\"66\"]'),
(19, 'alias Sec', 5, '[\"84\",\"66\",\"101\",\"61\",\"80\",\"82\"]'),
(20, 'natus Sec', 10, '[\"100\",\"88\",\"82\",\"92\",\"57\"]'),
(21, 'numquam Sec', 4, '[\"70\",\"94\",\"87\",\"59\",\"89\"]'),
(22, 'et Sec', 2, '[\"69\",\"79\"]'),
(23, 'aperiam Sec', 8, '[\"65\",\"75\"]'),
(24, 'ipsam Sec', 8, '[\"101\",\"75\"]'),
(25, 'amet Sec', 5, '[\"83\",\"62\",\"82\",\"84\",\"80\",\"59\"]'),
(26, 'voluptas Sec', 3, '[\"74\",\"57\",\"71\"]'),
(27, 'molestiae Sec', 7, '[\"79\",\"85\",\"92\",\"90\",\"102\"]'),
(28, 'consequatur Sec', 5, '[\"59\",\"66\",\"84\",\"101\",\"61\",\"55\"]'),
(29, 'adipisci Sec', 1, '[\"65\",\"73\",\"63\",\"78\",\"89\",\"97\"]'),
(30, 'id Sec', 4, '[\"87\",\"96\",\"83\",\"63\",\"70\",\"67\",\"68\",\"88\"]'),
(31, 'beatae Sec', 5, '[\"63\",\"61\",\"66\",\"62\",\"80\",\"55\"]'),
(32, 'corrupti Sec', 6, '[\"67\",\"83\",\"63\",\"57\",\"85\",\"76\"]'),
(33, 'incidunt Sec', 1, '[\"63\",\"82\",\"76\",\"58\",\"78\",\"65\"]'),
(34, 'quo Sec', 8, '[\"101\",\"65\",\"75\"]'),
(35, 'qui Sec', 1, '[\"65\",\"89\",\"97\",\"78\"]'),
(36, 'minima Sec', 7, '[\"92\",\"82\",\"65\",\"102\",\"79\"]'),
(37, 'et Sec', 4, '[\"70\",\"94\",\"96\",\"89\",\"83\",\"103\",\"59\",\"67\"]'),
(38, 'incidunt Sec', 2, '[\"93\",\"59\"]'),
(39, 'est Sec', 4, '[\"89\",\"59\",\"94\",\"87\",\"83\",\"103\",\"72\",\"88\"]'),
(40, 'praesentium Sec', 9, '[\"58\",\"66\",\"74\",\"104\",\"82\",\"61\",\"62\"]'),
(41, 'corrupti Sec', 7, '[\"65\",\"92\",\"90\",\"85\",\"100\"]'),
(42, 'ipsam Sec', 4, '[\"89\",\"88\",\"70\",\"83\",\"97\"]'),
(43, 'voluptatum Sec', 6, '[\"94\",\"64\",\"99\",\"76\"]'),
(44, 'sit Sec', 9, '[\"58\",\"61\",\"82\",\"102\",\"104\"]'),
(45, 'esse Sec', 1, '[\"63\",\"76\",\"78\",\"58\"]'),
(46, 'dolores Sec', 5, '[\"59\",\"61\",\"62\",\"84\",\"83\",\"80\"]'),
(47, 'ea Sec', 4, '[\"68\",\"70\",\"73\",\"59\",\"89\"]'),
(48, 'magnam Sec', 5, '[\"80\",\"84\",\"55\",\"66\"]'),
(49, 'blanditiis Sec', 8, '[\"75\",\"67\",\"65\"]'),
(50, 'error Sec', 6, '[\"63\",\"94\",\"83\",\"60\",\"56\",\"76\"]');

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
(1, 'Home', 'Nihil quidem accusantium accusantium consequatur ut nihil quis tempora enim officia minus molestiae ipsum quaerat.', 1),
(2, 'About us', 'Iste facere odit consequuntur illo fugiat optio blanditiis deserunt in sit ea aut consequuntur quisquam quia adipisci sequi.', 1),
(3, 'CMS', 'Dolorum nesciunt eos cupiditate sit consectetur vel quis neque incidunt ullam natus omnis a quasi expedita sint.', 1),
(4, 'Sections', 'Minus accusamus molestias voluptas qui amet animi.', 1),
(5, 'Subjects', 'Qui impedit veritatis quod adipisci optio dolor in voluptatem rem et ad id ad laudantium harum quos.', 1);

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
(1, 'Temporibus.', 'Voluptatem ut qui enim facilis ut ea nisi et ab rerum est dignissimos eos ullam cumque rerum velit.'),
(2, 'Nisi voluptate.', ''),
(3, 'Sunt esse.', 'Et et laboriosam omnis magni repellat ipsam similique quod recusandae sit laborum accusamus animi suscipit porro ut dolor odio.'),
(4, 'Facere dolorum.', ''),
(5, 'A et.', ''),
(6, 'Expedita sunt.', 'Atque quasi placeat non optio voluptatem voluptatem praesentium rerum.'),
(7, 'Eos ad.', ''),
(8, 'Eos.', 'Consequatur qui quasi repudiandae et nobis unde sapiente consectetur et delectus id omnis blanditiis et enim rerum rerum vel suscipit illum.');

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
(1, 'Sit.', '', '', '[\"8\"]', '[\"17\",\"19\",\"38\"]', 6, 55),
(2, 'Et.', '', '', '[\"1\",\"10\"]', '[\"25\",\"31\"]', 7, 71),
(3, 'Dicta quaerat.', '', '', '[\"10\",\"2\",\"8\"]', '[\"20\"]', 15, 86),
(4, 'Ipsam.', '', '', '[\"6\",\"2\"]', '[\"19\"]', 15, 57),
(5, 'Praesentium.', '', '', '[\"9\",\"4\"]', '[\"24\"]', 14, 77),
(6, 'Maxime.', '', '', '[\"6\"]', '[\"24\"]', 1, 84),
(7, 'Soluta et.', '', '', '[\"2\",\"4\"]', '[\"25\"]', 3, 103),
(8, 'Odit autem.', '', '', '[\"5\",\"6\"]', '[\"12\",\"3\"]', 9, 82),
(9, 'Quia fugit.', '', '', '[\"4\"]', '[\"43\",\"15\"]', 5, 56),
(10, 'Saepe voluptatem.', '', '', '[\"2\",\"10\",\"9\"]', '[\"14\",\"34\"]', 11, 63),
(11, 'Doloribus deserunt ad.', '', '', '[\"3\",\"1\",\"2\"]', '[\"17\",\"31\",\"41\"]', 15, 86),
(12, 'Incidunt earum.', '', '', '[\"4\"]', '[\"44\",\"50\",\"8\"]', 2, 96),
(13, 'Voluptatem id.', '', '', '[\"3\",\"9\",\"8\"]', '[\"38\",\"46\",\"29\"]', 12, 72),
(14, 'Voluptate.', '', '', '[\"6\"]', '[\"47\"]', 7, 61),
(15, 'Cupiditate.', '', '', '[\"9\"]', '[\"49\",\"29\"]', 10, 62);

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
(1, 'Natus soluta.', '10', '80', '[\"65\",\"59\",\"72\",\"57\",\"68\",\"61\"]'),
(2, 'Reprehenderit et.', '40', '90', '[\"71\",\"81\",\"100\",\"65\",\"70\",\"68\",\"104\",\"101\",\"98\",\"75\",\"78\",\"57\",\"93\",\"88\"]'),
(3, 'Sint quia.', '50', '100', '[\"87\",\"101\",\"69\",\"98\",\"93\",\"60\",\"61\",\"64\",\"70\"]'),
(4, 'Non quod recusandae.', '10', '100', '[\"76\",\"90\",\"56\",\"74\",\"64\",\"59\",\"99\",\"65\",\"79\",\"88\",\"77\",\"70\",\"97\",\"69\"]'),
(5, 'Sit ipsa.', '40', '100', '[\"86\",\"89\",\"74\",\"79\",\"84\",\"55\",\"87\",\"56\",\"99\"]'),
(6, 'Ducimus occaecati.', '10', '70', '[\"75\",\"54\",\"82\",\"68\",\"104\",\"62\",\"74\"]'),
(7, 'Ut.', '40', '60', '[\"98\",\"73\",\"104\",\"57\",\"99\",\"75\",\"94\",\"101\",\"67\",\"55\",\"87\",\"81\",\"59\",\"65\",\"90\"]'),
(8, 'Sint voluptas.', '20', '90', '[\"80\",\"66\",\"72\",\"92\",\"96\",\"61\",\"84\",\"99\"]'),
(9, 'Alias illo.', '50', '90', '[\"101\",\"85\",\"98\",\"58\",\"56\",\"91\",\"71\",\"102\",\"66\",\"97\"]'),
(10, 'Non rerum.', '10', '60', '[\"89\",\"86\",\"79\",\"60\",\"68\",\"55\"]'),
(11, 'Voluptatem doloribus aut.', '30', '60', '[\"62\",\"99\",\"67\",\"78\",\"89\",\"85\",\"100\",\"104\",\"81\",\"69\",\"55\",\"63\",\"60\",\"103\",\"64\"]'),
(12, 'Non molestiae.', '30', '100', '[\"101\",\"65\",\"54\",\"83\",\"87\",\"96\",\"61\",\"81\"]'),
(13, 'Eum nihil quisquam.', '40', '90', '[\"81\",\"80\",\"67\",\"97\",\"93\",\"91\",\"102\",\"62\",\"58\"]'),
(14, 'Quam ab harum.', '20', '100', '[\"62\",\"90\",\"79\",\"68\",\"103\",\"66\",\"70\",\"93\",\"95\"]'),
(15, 'Consequuntur distinctio.', '10', '80', '[\"104\",\"68\",\"56\",\"57\",\"58\",\"65\",\"64\",\"66\",\"85\",\"98\",\"74\"]');

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
(1, 'Natus.', 'Cum odit.', '[\"4\",\"8\"]', '600'),
(2, 'Quaerat autem.', 'Commodi rerum et.', '[\"8\",\"10\",\"9\"]', '530'),
(3, 'Harum doloremque.', 'Tempore qui.', '[\"1\",\"5\"]', '630'),
(4, 'Eos qui.', '', '[\"3\",\"8\",\"10\"]', '800'),
(5, 'Consectetur qui.', 'Facere molestias ipsam.', '[\"1\",\"5\",\"3\"]', '620'),
(6, 'Numquam dolorem.', '', '[\"6\"]', '750'),
(7, 'Molestias.', '', '[\"5\",\"4\",\"7\"]', '800'),
(8, 'Sed sit.', '', '[\"3\"]', '770'),
(9, 'Impedit.', 'Natus laboriosam eligendi.', '[\"7\",\"2\"]', '560'),
(10, 'Magnam qui.', '', '[\"1\"]', '770'),
(11, 'Neque.', 'Blanditiis delectus voluptatibus.', '[\"8\"]', '830'),
(12, 'Et.', 'Ipsam corporis maiores.', '[\"5\",\"1\"]', '700'),
(13, 'Atque.', '', '[\"7\"]', '780'),
(14, 'Totam.', 'Architecto illo id.', '[\"1\"]', '520'),
(15, 'Aliquam.', 'Laborum nisi.', '[\"1\"]', '840');

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
(1, '3119', '', 'minima', 'Clifton Hills', '', '374546069619977', 'Totam ad.', 'Error odio iste adipisci qui.'),
(2, '9897', '', 'ut', 'Prof. Moses Miller Sr.', '', '746243542086301', 'Quia doloremque unde.', 'Expedita eveniet labore sit.'),
(3, '8967', '', 'sit', 'Prof. Kaela Christiansen', '', '870977067297475', 'Magnam nemo delectus.', 'Facere id tempora ratione alias.'),
(4, '3377', '', 'fugiat', 'Ms. Brianne D\'Amore Sr.', '', '915164787046036', 'Aut necessitatibus.', 'Similique qui tenetur.'),
(5, '9370', '', 'quidem', 'Ali Langworth Jr.', '', '956771547914373', 'Sed id qui molestiae doloremque.', 'Cumque consequuntur unde sint.'),
(6, '2646', '', 'sapiente', 'Malvina Quigley', '', '570437901833843', 'Provident cumque dolor.', 'Id minima quia rem error.'),
(7, '9668', '', 'eum', 'Sigrid Effertz Sr.', '', '888159677128990', 'Aut placeat veniam quod et molestiae.', 'Rerum maxime optio quos cupiditate.'),
(8, '6103', '', 'blanditiis', 'Odell Gusikowski Jr.', '', '747198702942279', 'Qui aspernatur corrupti neque.', 'Maxime nihil officia doloribus voluptatibus.'),
(9, '8502', '', 'placeat', 'Coty Schmidt', '', '528629217052235', 'Aut aut a.', 'Sint expedita doloribus.'),
(10, '4884', '', 'consequatur', 'Prof. Bradford Baumbach II', '', '236761516726764', 'Dignissimos voluptates magni excepturi.', 'Et voluptatibus repellendus laborum non.');

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
(1, 'ahmedsk', 'rkrajcik@yahoo.com', '$2y$10$SrhX930yaduwMKpYgN44wuFWhfXgi/R6Dbbdz.6ApWX0i1Ga9NMJ.', '', 'Ahmed Sayed', 'admin', 2, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '826074', '+59 8911392', 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(2, 'virtu', 'marian50@yahoo.com', '$2y$10$FaKe.XgKpaomm2HYmYRjUeeBzuv9MCMrATCwcpvjxz3XbG2GnNRci', '', 'Virtu', 'admin', 2, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '894730', '+82 7700225', 0, 0, '', NULL, '', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'employee', 'brad52@hotmail.com', '$2y$10$s5c7AUEYQ/ofR.CQU1zPreFSxDbOraFiSgiXytzCgwF1K2jR98IB.', '', '[Em] Golda Heaney', 'employee', 13, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '329503', '+97 2370975', 0, 0, '', NULL, '', '069.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'lon74', 'ferry.evalyn@hotmail.com', '$2y$10$Ut/o/r2CnJei.ogg7e2arelAtJW8yCDhe8Lk1Wy/AUMHm.yHBek7y', '', '[Em] Oliver Doyle II', 'employee', 8, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '691545', '+73 6648089', 0, 0, '', NULL, '', '063.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'horeilly', 'mervin.dare@rohan.com', '$2y$10$iEXIdmnc4Mp1lS7skS4WJuwm1a/sYSAj8dv1trlCtkmSsEIJrZ4p6', '', '[Em] Oscar Fadel Jr.', 'employee', 10, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '158632', '+16 7789419', 0, 0, '', NULL, '', '010.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'edythe.witting', 'chessel@lubowitz.com', '$2y$10$y6zP4yac53fWFIXqXsCzD.j.rxeyIgzFBIGXgguPz6cyjc9PbR6ki', '', '[Em] Abbie Hill', 'employee', 9, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '617846', '+87 4158643', 0, 0, '', NULL, '', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'iklein', 'kamren67@wolff.com', '$2y$10$bdNsmPCzpeNPLZrVmUFuGOTahXURfsDEk06dBHdcuFk1nzzy3qS.i', '', '[Em] Carol Sauer', 'employee', 8, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '760466', '+37 4593794', 0, 0, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'obogisich', 'prohaska.emery@leannon.com', '$2y$10$b3i57cwzlerUmiZADBijk.llpPJBn9OU.wGbOaZu9c1FqDuDKMvS6', '', '[Em] Cory Schuppe', 'employee', 13, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '220355', '+86 3066436', 0, 0, '', NULL, '', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'ostroman', 'hthompson@buckridge.com', '$2y$10$NsVEPnTtDh/yeBGUUhYNZeXwbjfxgV1qXto/7C/KIEXEo2NtfiUu2', '', '[Em] Alexa Barrows', 'employee', 8, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '617603', '+28 7484363', 0, 0, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'gkuvalis', 'desiree63@schmeler.com', '$2y$10$JVbrC1lzQhxuBqlKT0rSlu9RBHHZfqWCkf/PAfhGGFLnumMOz.l6m', '', '[Em] Nedra Little', 'employee', 9, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '182163', '+30 1664063', 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'zbecker', 'miller69@huels.com', '$2y$10$shviWcBOg9uW2ghiu.mktuQS.W34eBCowGWNUraztr7ljrKE7WX/u', '', '[Em] Trevion Lemke', 'employee', 8, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '143283', '+99 6062526', 0, 0, '', NULL, '', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'mfunk', 'hane.lyric@hotmail.com', '$2y$10$4WilujlONCz/hZht57CAhuV1ARWxUH488D5U8Sr7/MKS53BNGT3me', '', '[Em] Kaelyn Upton', 'employee', 10, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '381370', '+73 2031080', 0, 0, '', NULL, '', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'vfeeney', 'leffler.lottie@hotmail.com', '$2y$10$85D/L.D5.hFyavjmX2dG1OZ8sQ5e2ch1RJOADQe4F5HvolyDH.CTq', '', '[Em] Andy Harvey', 'employee', 14, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '857950', '+37 4506260', 0, 0, '', NULL, '', '095.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'klabadie', 'boyer.virgil@eichmann.com', '$2y$10$q2W164DF1UUQx40eB5F2T.cE3Q8DgUTOff09JmiElyRfn0K8aTlma', '', '[Em] Kayla Volkman', 'employee', 9, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '351876', '+21 4028396', 0, 0, '', NULL, '', '063.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'ruecker.marina', 'gibson.stephania@jacobson.com', '$2y$10$aIsWuJjHINdtgJNvdmfClOwq87lLnl2Y4cWz3Rv689b5T2AVUWlyO', '', '[Em] Shana Rodriguez V', 'employee', 10, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '600830', '+10 2245211', 0, 0, '', NULL, '', '018.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'jarrod.ullrich', 'dakota.davis@hotmail.com', '$2y$10$6u5a25UplxzYg3MbmoqAKejYw3TRRXM8GO8Jl4VE4SxBzaRsL7wZe', '', '[Em] Dominic Christiansen', 'employee', 3, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '543232', '+66 5574799', 0, 0, '', NULL, '', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'angelica.glover', 'myrtis61@yahoo.com', '$2y$10$B0pDU1/TZng/FdXgbTNieu6F0Q32z5jIKjvY6sG/0RWyMK5n7HCBK', '', '[Em] Mr. Harley Carter', 'employee', 13, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '154201', '+10 4605721', 0, 0, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'easton.white', 'ykilback@kassulke.com', '$2y$10$alj7Ra9Xumwg3tOGquuuIehIjjfy1ZG8k2f4Fy4rfIgQJdopt6.zi', '', '[Em] Amara Grady', 'employee', 8, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '536351', '+59 7733842', 0, 0, '', NULL, '', '03.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'beverly.koelpin', 'charley.ondricka@yahoo.com', '$2y$10$D2ZRF7EvIILRhdxYx3euguJaikBJpi7Wdtz5vlMOQYG3lqEkC9x8O', '', '[Em] Megane Lesch', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '974954', '+99 9955951', 0, 0, '', NULL, '', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'green.bruce', 'ywolff@hotmail.com', '$2y$10$ACCciIFkTqeIOQBPN1jJ1uzJNgIVvyKA0prXjV90uDpina9fFwyFG', '', '[Em] Ms. Sallie Barrows', 'employee', 9, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '518647', '+13 1833981', 0, 0, '', NULL, '', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'deron81', 'hane.bruce@gmail.com', '$2y$10$0DPv//UY2zErJkDzNOKhruXBD9lCiARuvdE7CGLrk8/hIof3A/Kkm', '', '[Em] Ubaldo Welch', 'employee', 13, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '911198', '+35 3656918', 0, 0, '', NULL, '', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'dennis94', 'kertzmann.gerard@metz.org', '$2y$10$A7jtprUjon4dFEQEDsaPoeW6CCjzXJ34v.x8TNo17G3GCzwSqSAXy', '', '[Em] Bianka Russel', 'employee', 3, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '877035', '+77 9554697', 0, 0, '', NULL, '', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'loy.tromp', 'lkozey@yahoo.com', '$2y$10$nyZJzmkUz2EXkTB5WB8mL.TTtS90IkFTy/T0ScA1naIKf9ZmG5km6', '', '[Em] Roman Roberts', 'employee', 3, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '133252', '+65 9436233', 0, 0, '', NULL, '', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'pwiegand', 'zelma.gislason@yahoo.com', '$2y$10$Qju3ks6dVedBUyDeQ.Jb1er3dbmLDyuFpzgsoF5ebcD7kTFBmPGLu', '', '[Em] Rae Wisoky', 'employee', 9, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '267409', '+98 1152943', 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'geovany60', 'bryce.corwin@gerlach.net', '$2y$10$S.QdUMD/7H0Jy5QS.ZbnOeeCcKCiCM4FXtMFbEtNih8De80.AHqhm', '', '[Em] Prof. Tyrell Kautzer', 'employee', 14, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '819021', '+73 7344872', 0, 0, '', NULL, '', '057.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'rice.vicky', 'patience.johns@hotmail.com', '$2y$10$gYj/VylzZIdJyYMfypeFOOjko66m8FG2DJMunLxm0doFb5WsglFxe', '', '[Em] Jevon Rutherford', 'employee', 4, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '382529', '+78 1186719', 0, 0, '', NULL, '', '054.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'spadberg', 'harvey.micah@hotmail.com', '$2y$10$LUvvQixxqEmTk/ufjniwX.QCSSSC9NQcb00COgGuAxxTz7GCp9jrC', '', '[Em] Ms. Claudine Harvey', 'employee', 13, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '774333', '+41 2557289', 0, 0, '', NULL, '', '050.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'allen.bogan', 'camilla78@yahoo.com', '$2y$10$UAzOMOv/cN0MI.8o43mXvu9GQj2d6hC5EABrka5.Us/JBO0t6rYFq', '', '[Em] Scot Medhurst MD', 'employee', 4, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '588869', '+89 9937123', 0, 0, '', NULL, '', '036.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'janie88', 'mckayla.ritchie@gmail.com', '$2y$10$TB8/bE8f29HoUmrL35R4Z.QBQXrQeNXGY33uwX9pHhQEGmfgo0GGm', '', '[Em] Finn Nikolaus II', 'employee', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '152153', '+30 8294919', 0, 0, '', NULL, '', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'farrell.ansel', 'bogan.gladyce@rippin.com', '$2y$10$BksTA4lEC8WzczTGGm//lOz384ZyK947mst5sOUICOFedGtj0zyT6', '', '[Em] Prof. Jena Price', 'employee', 11, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '629225', '+87 2035561', 0, 0, '', NULL, '', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'ccruickshank', 'jessika26@koelpin.info', '$2y$10$gZdQu7xL/DY5wVw7kQas1OQPi2WCg4WWgKcflvywMpV/8g.v2iYYe', '', '[Em] Clark Purdy', 'employee', 9, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '713908', '+33 5730097', 0, 0, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'jbosco', 'lueilwitz.joshuah@streich.net', '$2y$10$cZtgXnyiZHmxoh34FNwL2.vT8FQIPybzWG1n89FrWIi72pQt.Pd5i', '', '[Em] Sheldon Frami III', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '274734', '+70 3275617', 0, 0, '', NULL, '', '012.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'ashly70', 'reichert.michael@gmail.com', '$2y$10$sxx/HtAWfaRhsSEgMTyEZuI3P5Il/PRHm8ZSDkSGBrbW8OehOZu/u', '', '[Em] Claud Harber', 'employee', 11, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '987440', '+38 3645388', 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'aracely37', 'stroman.chris@gmail.com', '$2y$10$LW1d3hYNGPBmhJSnoYGi5Oric6tXdR2A3JWVIcdWrx98g4aaWK5Ii', '', '[Em] Mr. Lane Zemlak', 'employee', 14, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '588091', '+83 1089996', 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'lehner.allie', 'marcelo84@haley.com', '$2y$10$6Y0NBx9N4FlkRmc6v0bYs.QkE5KOy0QQ90FhbjpNOjLk4J2fUWvCe', '', '[Em] Buster Dickens', 'employee', 10, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '595722', '+37 5640340', 0, 0, '', NULL, '', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'jaylin.zboncak', 'dubuque.ephraim@walsh.com', '$2y$10$FuuBb0yOQROSEZMvzcWG0uUQTqdGf0SBU7x2LIIDnIWhRrz2ipOzq', '', '[Em] Ms. Sydnee Jaskolski II', 'employee', 3, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '222915', '+77 1094411', 0, 0, '', NULL, '', '037.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'enrique05', 'pkassulke@gmail.com', '$2y$10$.iHQXPdgXGpu/fgr4ygUeuaQVmRRj61xsXlr39Bl043X6UqTN95da', '', '[Em] Dr. Oda Nitzsche', 'employee', 3, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '335521', '+98 4787198', 0, 0, '', NULL, '', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'thuel', 'karli.langosh@hotmail.com', '$2y$10$rQUFvCKxq7N7vrBLxKcmGuqRgOLdDUeZYdDOcBd0CGJJqOXwFqtG6', '', '[Em] Aletha Kertzmann', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '161920', '+33 2745688', 0, 0, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'gdeckow', 'baumbach.april@hessel.com', '$2y$10$BS8NMonT4YD/VQwMGq5rdefDjVd1v3u7SdUqkWYw64tOgPbBSR7gG', '', '[Em] Mr. Kendrick Adams', 'employee', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '434514', '+94 9393173', 0, 0, '', NULL, '', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'julius.kutch', 'bettie96@yahoo.com', '$2y$10$Flz9g6w.EYPvr3ih5o2b8.KkeqJzb691K0Mf3qreMmk3yISqF.liW', '', '[Em] Monte Cruickshank', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '137905', '+97 9590472', 0, 0, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'javier23', 'abby.little@crona.com', '$2y$10$yPTtyEwaKuMUuGTlVR2Dru/ktrsVgKqA0H0zQdf6nCX7X.kcHC.zG', '', '[Em] Sonny Bruen', 'employee', 14, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '750446', '+29 2476672', 0, 0, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'lisandro92', 'nola19@hotmail.com', '$2y$10$dysLdiQUPq5e.ACUg/kyjufE3Tex.b1dt64VQdwS7W1jHd6IY6S5G', '', '[Em] Rebekah DuBuque', 'employee', 9, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '706428', '+29 8953371', 0, 0, '', NULL, '', '053.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'schneider.jamie', 'akub@gmail.com', '$2y$10$iatlKA1UfsdnjPrkh8AnsuFTRO623lSgHkDbtMkRWGaDTfjAKCEAG', '', '[Em] Dr. Jaeden Zieme', 'employee', 13, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '805254', '+60 4208815', 0, 0, '', NULL, '', '050.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'joanie25', 'gsanford@gmail.com', '$2y$10$4zNqsECJZTPlscrIK5vyseihk1sLx6q14BMImdkzcPVKOB9n/Jhue', '', '[Em] Oscar VonRueden', 'employee', 13, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '419089', '+27 7296435', 0, 0, '', NULL, '', '077.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'kshlerin.cade', 'kristoffer.grant@gmail.com', '$2y$10$agE/jHrARHit6soh/54ScOX4rm5FrYaGhqio.TyBBQfVQP3U3.xgW', '', '[Em] Caitlyn Monahan', 'employee', 13, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '284303', '+15 8319398', 0, 0, '', NULL, '', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'savanah.pagac', 'aparisian@larson.biz', '$2y$10$vFol2YUtlc4WahrEv884iuWw2aCszIjZwdWZ9KkOrkfJSX08ad2Y6', '', '[Em] Mr. Brayan Fritsch', 'employee', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '667613', '+88 3360157', 0, 0, '', NULL, '', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'iharvey', 'carole10@hyatt.net', '$2y$10$0maX4Wc//SGa8UoWFS8ISeJEEYbH9krQ0ni3HeCRp42nHXRHbCZhO', '', '[Em] Dawson Mertz', 'employee', 8, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '472845', '+19 3203410', 0, 0, '', NULL, '', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'sherwood.gleichner', 'lola20@gmail.com', '$2y$10$bE5hk/2bbUrW2l6Cjw5Vx.1RPoOz7fHyJHGxrdb35mvny8y4lAFq6', '', '[Em] Cecelia West PhD', 'employee', 10, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '678651', '+47 8455378', 0, 0, '', NULL, '', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'kblock', 'amya70@yahoo.com', '$2y$10$D8EQgeUrCLdPZbIANhV0m.vxDJPQ1LhNt58SooyflRDxjUqU75wiK', '', '[Em] Alanis Daniel', 'employee', 11, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '336075', '+89 1289706', 0, 0, '', NULL, '', '037.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'edd.gulgowski', 'kilback.kirstin@gmail.com', '$2y$10$fBJt.zBh2gDDhMU2u23b8uXL.AfVYgRqe7su4m4l37e6GDhJNvow.', '', '[Em] Miss Edna Runolfsson', 'employee', 4, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '433713', '+75 9727177', 0, 0, '', NULL, '', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'batz.bernita', 'denesik.caitlyn@hotmail.com', '$2y$10$WvGacOsDA5S0w8MOfJjqYO3pZ.oO0g6pKNwtqlDaBslG5KqFfHQSm', '', '[Em] Mr. Thurman Gerhold DDS', 'employee', 8, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '991559', '+56 4925796', 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'emelie48', 'tlakin@gmail.com', '$2y$10$3Y1mWE29xWu13tHM0JAXIuaBTeF0H7FqST9N3iZYT9DxWeSi649Xm', '', '[Em] Alfonzo Wolff', 'employee', 8, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '899287', '+22 3165495', 0, 0, '', NULL, '', '057.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'soledad35', 'abelardo82@klocko.net', '$2y$10$69f3j43/XOC/k7EeZv1i7uNT9nBY5zzWJOla3hhq/5QFIM5kvGVqa', '', '[Em] Robert King PhD', 'employee', 3, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '752647', '+79 4159223', 0, 0, '', NULL, '', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'teacher', 'marquis41@hotmail.com', '$2y$10$FPmAS7l.Vv1T58C3FO8hauFv2VmFeAq/afS6suo2NGbKdttuttia.', '', '[Te] Beatrice Brekke', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '725189', '+21 5950195', 0, 0, '', NULL, '', '058.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'hirthe.winnifred', 'jared25@strosin.com', '$2y$10$1K7ZV2xAmWqC.Pi7IyAB1uFdsKYTeIKKSFQug4vM7QN0QyV9RIYxa', '', '[Te] Sonia Kreiger', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '355311', '+52 5133978', 0, 0, '', NULL, '', '081.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'ritchie.hazel', 'yherman@hotmail.com', '$2y$10$BAhF59CQhQNqpDK99cCrmO1soHMFlb3idTNYUffaGzGcu2m/34OQy', '', '[Te] Dr. Hassan Franecki', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '665740', '+88 3730501', 0, 0, '', NULL, '', '026.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'muriel.mertz', 'bernardo.sawayn@hotmail.com', '$2y$10$aJD4n.I/urUScrNWIs47NOz9QcvY9VSdanPV9qLVCn5uPeZDFtxTy', '', '[Te] Ona Harber', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '589064', '+32 5883399', 0, 0, '', NULL, '', '055.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'mgerhold', 'gutkowski.vince@yahoo.com', '$2y$10$pz/YLjwA8QsV7ipDz0NkEOC6FKq8gbJHyl6NOGpMY2FLO8iRp1/R.', '', '[Te] Mr. Laverne Fritsch Jr.', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '276025', '+10 4253445', 0, 0, '', NULL, '', '03.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'tanya95', 'jay.sporer@kris.com', '$2y$10$QLnvDCDNyw/ZxIUKhGxueecsa73jsiwT8Pc14UvMf5/ZT.Unr8uzi', '', '[Te] Dr. Cullen Champlin', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '626686', '+27 4126573', 0, 0, '', NULL, '', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'usanford', 'shanahan.zella@hotmail.com', '$2y$10$/H.r3GCxS5vpuVfKAYyWZeqMDx2y2F1ffbZRila8G/1RQhd5/sqd.', '', '[Te] Araceli Carter DDS', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '923733', '+90 8316798', 0, 0, '', NULL, '', '088.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'yheidenreich', 'treutel.donnie@jaskolski.info', '$2y$10$8shc1pwC/oz.aLaEhyJm9eUechV4Y/1A/1iOwGLw8JZqHXMKjLdFC', '', '[Te] Darrick Nader', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '589681', '+96 1698226', 0, 0, '', NULL, '', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'aisha.frami', 'else.douglas@schaden.com', '$2y$10$WnMWeuiZN3Wl82XDP2t8q.ChU5ls5O9lDWafnGit.6b0bHglWIF7.', '', '[Te] Ms. Charlene Okuneva', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '424296', '+90 1464930', 0, 0, '', NULL, '', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'jules44', 'itoy@romaguera.com', '$2y$10$Cc71YvE/7rtX/uIO6NsXjO5FGtXL9zT0CQzm2k7J3Eshykri/1GZC', '', '[Te] Pat Raynor', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '838918', '+28 2721616', 0, 0, '', NULL, '', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'carlo.reichert', 'sabrina.hoeger@hotmail.com', '$2y$10$sYDOpmw/oeWYnoeLNX.Ysevi2pbo5Aw/YXNKWEEdU6KCNIUzplC16', '', '[Te] Stanley Brakus', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '604006', '+10 5903084', 0, 0, '', NULL, '', '017.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'ecasper', 'dwill@yahoo.com', '$2y$10$0ijrpNIfnQ4Do9JkUh80DOpWTtd8elyU4x9D1Hf1k2773okAJw9Mi', '', '[Te] Prof. Payton Weimann', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '950588', '+59 9526309', 0, 0, '', NULL, '', '063.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'ruecker.miracle', 'shawna.wiza@yahoo.com', '$2y$10$eUQK6dC2NGV8xRROxPUtPOhmC8fI5htDoOPafItgq/2FdUENJ1W6m', '', '[Te] Prof. Pearlie Hermann', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '492836', '+76 2701066', 0, 0, '', NULL, '', '017.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'christopher38', 'aniyah48@harvey.com', '$2y$10$/3A2KNjh/c0L4kPzUL5KQuG.gngenMgPxwPzqm.Th.gWzDAZ4UjPq', '', '[Te] Prof. Tyson Stehr DDS', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '127360', '+34 6182155', 0, 0, '', NULL, '', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'beier.catherine', 'urempel@farrell.com', '$2y$10$VbTtzxIZ3ZmY/i7/3tlgXecWmNZCuugvVAzzkkLLEXdKriwn4DMjO', '', '[Te] Rodger Altenwerth', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '972397', '+49 1024470', 0, 0, '', NULL, '', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'xkessler', 'lea39@kohler.com', '$2y$10$VFlwudDsqTR05jDfBOif7eJ1VVZmOJragW2Xb9JvRAq29cgfk031a', '', '[Te] Leland Hegmann Sr.', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '263435', '+25 3887240', 0, 0, '', NULL, '', '090.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'yessenia85', 'walton75@gmail.com', '$2y$10$JTM50lTHtWyNQwgmLpnQiuiMQsILSQKQfCgzt5KUPwCDqjKYir3E6', '', '[Te] Claud Sporer IV', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '554717', '+48 6356498', 0, 0, '', NULL, '', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'cathryn.runte', 'shane.hirthe@herman.com', '$2y$10$TYEpRnhXoCVn5TsvH0zm5.Zbnfaz3M/tbcgfzSl/keiciQNeT9GfG', '', '[Te] Chester Medhurst', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '283704', '+36 1273434', 0, 0, '', NULL, '', '01.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'everett20', 'glover.arielle@yost.org', '$2y$10$g2m3YSZZ.sPg.60c429JJOj8iU0YCw4ZpBUEyO63DulTPxeN0zXqO', '', '[Te] Liam Stracke', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '831078', '+66 3366675', 0, 0, '', NULL, '', '012.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'tyrese.johnson', 'marcellus43@gmail.com', '$2y$10$bkL7HmqmE0814rr/5zh5Fe5lKVmgxi2NHLweROj8ouJw.6HhNGkU6', '', '[Te] Norberto Harvey', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '877195', '+33 5860635', 0, 0, '', NULL, '', '093.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'dominic.gusikowski', 'emanuel76@medhurst.com', '$2y$10$xxhPRh2deM/mqrmZKI8ViuG9CS.H7DNlnJj/TOamiaIv38dyayb1u', '', '[Te] Wyatt Terry', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '685063', '+77 7990396', 0, 0, '', NULL, '', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'west.branson', 'becker.annabelle@hotmail.com', '$2y$10$g/RF/G.F9op8owfSJ4xuwO.Sj6Jdai.GCs3vsesKDWqFX2.CZcrPW', '', '[Te] Prof. Deven Witting PhD', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '246047', '+42 9731635', 0, 0, '', NULL, '', '073.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'cathryn.doyle', 'smith.lowell@braun.com', '$2y$10$W3UChNWz230u8ghMUKwjxeOPP6eAUFkI6w0ugjse213LqRctoYsEy', '', '[Te] Margarette Mayer III', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '169192', '+67 6751107', 0, 0, '', NULL, '', '071.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(77, 'marilou91', 'kassulke.jamaal@yahoo.com', '$2y$10$.nONQPgZAq7oNEWpEa14YuSaoSsqkPlZWYksh6veJet6uusQnZNTm', '', '[Te] Timmothy Herzog', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '927979', '+93 5799054', 0, 0, '', NULL, '', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'conroy.magnus', 'gerlach.celine@yahoo.com', '$2y$10$M.H7SUzuhJ84EVQG7CMOs.OVQ72yd3sI0qZ34liLeWQUNsD0EcDHi', '', '[Te] Miss Bryana Metz', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '347234', '+74 8044642', 0, 0, '', NULL, '', '057.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'kvolkman', 'caitlyn.gerlach@feest.org', '$2y$10$t9y06MR7yCVTlG3zJ3a36ea6fTfN9tLObPyR/gHxIuSaY6Ipk0WBO', '', '[Te] Valerie Cassin', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '484332', '+90 8312064', 0, 0, '', NULL, '', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'retta66', 'hagenes.chet@yahoo.com', '$2y$10$FE0MGVFEqbI/qnMLTW/iB.4AJV07E0uRQ7YeCdRFsBVdoGMVtwpAW', '', '[Te] Dr. Fredrick Waelchi Jr.', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '715516', '+65 1579373', 0, 0, '', NULL, '', '089.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'ubraun', 'cassin.adella@lockman.biz', '$2y$10$6NooTOOE96aafGL3vRptLODba4GKyf25i33B8RGF2fnNK7fkCaWIm', '', '[Te] Brendan Kautzer', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '441851', '+70 5245059', 0, 0, '', NULL, '', '016.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'rylee71', 'vkihn@gmail.com', '$2y$10$pbwtUoSthmDb2JyrxoaaEe9Ir6sWbtJSU4/VMPqn/suQR5rw3/r4C', '', '[Te] Addie Predovic', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '746507', '+22 2898937', 0, 0, '', NULL, '', '08.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'qhomenick', 'dkihn@yahoo.com', '$2y$10$a7hSBS8/6yAPg58kAHUHDOoSYEoWQU22YSvSzwc7IFBEmb8khgo5G', '', '[Te] Ms. Leatha Miller', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '843469', '+80 8224961', 0, 0, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'maud.senger', 'genesis.weimann@hotmail.com', '$2y$10$ULlxmOSMiXoypkeraMEHcOsbXfbuOF2wkrwClWR9HZxsrzrhn45sq', '', '[Te] Rosella Sanford I', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '537639', '+40 9727897', 0, 0, '', NULL, '', '06.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'rchamplin', 'rico25@hotmail.com', '$2y$10$GqO5qZs0jNQsA2wj38hGY.ccoxzup.Aj7Byn9THESXWvYOD6ijG06', '', '[Te] George Shields DVM', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '505025', '+88 5514839', 0, 0, '', NULL, '', '076.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'moen.annabelle', 'skiles.jamir@hayes.net', '$2y$10$FQ9BYbUa6tV5VtruIY8BCu18SAs4tjLpNFc1KQuKzUFA.Z6pe2oe.', '', '[Te] Mr. Thad Schowalter MD', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '293253', '+46 1238014', 0, 0, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'mosciski.lindsay', 'moen.noah@yahoo.com', '$2y$10$OtFGkOHrxH.CAIMjm65dR.W3fsnEg8MJOp42KXKe5ObnCORRJUlwW', '', '[Te] Andrew Hintz', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '576613', '+98 4517807', 0, 0, '', NULL, '', '093.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'rohan.walker', 'morar.sunny@gmail.com', '$2y$10$Tvsd.2OQGnYzubO4/fh/BeorFUJSqBQoNjHtn8zr3Y8K6btgLx1LO', '', '[Te] Noel Marks', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '549817', '+44 5614762', 0, 0, '', NULL, '', '067.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'forest60', 'floyd.hackett@hotmail.com', '$2y$10$NFENua64H5vs90y3cegQg.IAp9G9JrZrnIgpHQ37s8hNqH1PgN7wu', '', '[Te] Bria DuBuque', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '557429', '+75 2318746', 0, 0, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'lyla.abshire', 'mclaughlin.kobe@hotmail.com', '$2y$10$bR5/f0TE0muDWwB2kCo0i.F4EVfqBIuFd6Ild4V.CGucGucTwcVAW', '', '[Te] Nicolette Spinka III', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '771678', '+32 9813137', 0, 0, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'sauer', 'aberge@brekke.com', '$2y$10$DMcnU5e2jDP0zEYNRZT2FOFaZxylFcpiWJ6nVgmk2byzTlX56fRam', '', '[Te] Adriana Hansen', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '912044', '+43 5539688', 0, 0, '', NULL, '', '057.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'rempel.loren', 'thiel.lionel@gmail.com', '$2y$10$su/nqpBmaU1DLvhsszO9JOljks3isGASQ3sCtU5/b9NnrRoQJDqQm', '', '[Te] Dr. Brendon Senger', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '505500', '+34 8662371', 0, 0, '', NULL, '', '054.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'hunter.bergstrom', 'wolf.lenora@daugherty.org', '$2y$10$B8QY9WCy1gUP8K1BUcnZQuivq7rBAqR5yLDQQnuKbjJHnLoe7YE.G', '', '[Te] Emmanuelle McLaughlin', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '330047', '+26 9755960', 0, 0, '', NULL, '', '021.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'williamson.bailey', 'wcummings@altenwerth.biz', '$2y$10$pjkpnxkBCQJ8oNOQSNapzOL4kDV0WJjDbAOfVWtyu78PanZxoj6di', '', '[Te] Jaleel Hermann', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '916357', '+15 5451435', 0, 0, '', NULL, '', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'raynor.michael', 'labadie.ahmed@gmail.com', '$2y$10$wgHiHBWnApPaxHhy2gZ2TeDLPg3fMwbJ73cUb9QDeaO3OwwiGpzTe', '', '[Te] Benton Torphy', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '278187', '+68 5900574', 0, 0, '', NULL, '', '069.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'imelda69', 'nboyer@kirlin.com', '$2y$10$hl.fNmXmhqdd7Nt91yBVT.KB.eWLbTwDblWuh0GMXz2hDy.yUH5K6', '', '[Te] Anibal Mayert', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '538107', '+64 5281512', 0, 0, '', NULL, '', '072.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(97, 'novella41', 'gvandervort@gmail.com', '$2y$10$F2NDuGihhRzK1PTB/Mhr2O/QgnNdPGXuGksgUUdQlmF./FkL4yyLy', '', '[Te] Miss Celestine Boyer I', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '776508', '+25 8247465', 0, 0, '', NULL, '', '014.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(98, 'xhickle', 'yessenia46@gmail.com', '$2y$10$5S5awCdugc62CtMQdeeZf.zedAHrrCJYLsrmNd4jEhlW3uFGQ9THW', '', '[Te] Eriberto Keebler', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '285589', '+93 5551774', 0, 0, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(99, 'haag.maddison', 'roy.funk@carter.com', '$2y$10$zs9TGlev6PZ6Mnb/YVWsIOl0.yiCEvkK3Lvhvq4nWmitqzSsaVb7i', '', '[Te] Mr. Johnathon Langosh II', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '989257', '+13 6766230', 0, 0, '', NULL, '', '039.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(100, 'colten.bergstrom', 'pkonopelski@hotmail.com', '$2y$10$jSHszgUNL9onkjAQBCmqxeudWwfh67VRsEKZkBkBRiPago4xdEw9C', '', '[Te] Jayda Monahan', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '435144', '+56 8476574', 0, 0, '', NULL, '', '058.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(101, 'jlowe', 'loberbrunner@hotmail.com', '$2y$10$mrE3MMro24.8V6ZF.ypm3eeGc3HxfzNaXX7nIc.B3yAYWm3bZSU3.', '', '[Te] Rossie Kohler', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '371502', '+27 8568484', 0, 0, '', NULL, '', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(102, 'andy02', 'benedict.reynolds@gmail.com', '$2y$10$JY6WFyU4.u4vu1fGCYEY8e0zfI7CyNOBsiVNyL.j2KqduildfKQ9u', '', '[Te] Dr. Sarina Kulas', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '945331', '+66 8900710', 0, 0, '', NULL, '', '041.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(103, 'erau', 'roob.devin@yahoo.com', '$2y$10$dX4.sVHwPtTcmJYw7MTBcOJXFMl2B2UEpNMo8JvYOwHbUg6.voe2a', '', '[Te] Prof. Karianne Dietrich III', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '163211', '+45 5243780', 0, 0, '', NULL, '', '074.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(104, 'matteo.crooks', 'enoch98@carter.info', '$2y$10$vDPR8aHFpyO7cpgSz648VOcjfDDNyTlHao56RVDQK.YYAGfaYuV.q', '', '[Te] Zelma Greenholt', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '941823', '+50 3937498', 0, 0, '', NULL, '', '079.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(105, 'student', 'alisha.lang@gmail.com', '$2y$10$GHnyKSUwbsLKaflKxuaSkONTPB9SPjVuGEaF5Y11hTvhhIKSJrRlO', '', '[St] Harold Sauer II', 'student', 6, 4, NULL, 0, 1, '96', '48-178-20', 0, 0, '', 0, NULL, NULL, '1767543454', '9116364', 1, 11, '', NULL, '', '015.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(106, 'dibbert.macie', 'ybraun@wilderman.info', '$2y$10$fyobnIiI/qLXnE7BARI/4uLEBOu5dLt1ZC1I7IGHXbc2DuwwHSGI6', '', '[St] Mrs. Aaliyah Bergnaum DDS', 'student', 6, 1, NULL, 0, 1, '81', '55-709-76', 0, 0, '', 0, NULL, NULL, '2520974957', '8380185', 2, 22, '', NULL, '', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(107, 'neal.von', 'nolan.rylan@gmail.com', '$2y$10$ZWF/739cyhZA/f3bpIuKve.GKSEKEUAD2PZ96VeUohWxBdhocUHRa', '', '[St] Prof. Claire Lehner PhD', 'student', 6, 4, NULL, 0, 1, '87', '16-480-65', 0, 0, '', 0, NULL, NULL, '6484296313', '2108869', 10, 20, '', NULL, '', '096.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(108, 'zelma.rutherford', 'cormier.finn@funk.info', '$2y$10$c9raLwiDXKxs4J291laLAu.rUFtebm0MLiKo/RoDUW0BGrKDi0WKG', '', '[St] Grover Harber', 'student', 6, 2, NULL, 0, 1, '13', '91-901-14', 0, 0, '', 0, NULL, NULL, '1678522505', '3797101', 1, 29, '', NULL, '', '03.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(109, 'mabelle12', 'rocky.white@green.org', '$2y$10$JtxQJ2OCYjYnWjesvtJp7OhiFLoIfd/i9hWf7FvT0GkkJpPKhA906', '', '[St] Selina Skiles', 'student', 6, 1, NULL, 0, 1, '66', '30-255-34', 0, 0, '', 0, NULL, NULL, '6764550828', '9460562', 2, 38, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(110, 'hyman.bins', 'fblick@reynolds.biz', '$2y$10$LYMdd/vcz9M8FcKHzcfyOuuCwp9xeY.iYsXAysdo1XzxkDRCkJRtC', '', '[St] Jorge Watsica', 'student', 6, 1, NULL, 0, 1, '7', '34-206-34', 0, 0, '', 0, NULL, NULL, '8305202619', '9317243', 5, 25, '', NULL, '', '087.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(111, 'reggie.jones', 'heidi.gerhold@hotmail.com', '$2y$10$gxIsEQbna8qEu/DoI40LeuM63Z6exl3iVYrJmnxbcHtMN11KeyW.W', '', '[St] Freeda Boyer', 'student', 6, 4, NULL, 0, 1, '5', '42-217-38', 0, 0, '', 0, NULL, NULL, '7380798628', '3098282', 6, 6, '', NULL, '', '038.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(112, 'wmayer', 'elian.grant@hotmail.com', '$2y$10$fDuD3oKF/2ci0uD9VwLuL.8h9jZIiurZRpP5oWsgcNJEkufzrqE92', '', '[St] Shanny Schaefer DVM', 'student', 6, 3, NULL, 0, 1, '68', '28-262-49', 0, 0, '', 0, NULL, NULL, '2127895486', '9142337', 6, 50, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(113, 'reinger.bud', 'manley76@trantow.org', '$2y$10$jpKXjPiDfjz5KzqsusbwHu/awPqZre1bqiG.plBPBtc5db/R1XuUS', '', '[St] Marta Gibson', 'student', 6, 4, NULL, 0, 1, '81', '88-390-22', 0, 0, '', 0, NULL, NULL, '4821241657', '6705023', 10, 20, '', NULL, '', '059.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(114, 'yschimmel', 'destiney48@harris.com', '$2y$10$sroRPPSzPRV/ygHwF4jnN.Hdn5nZLBS/0wyJupQy9avB7tNMLaEdm', '', '[St] Dwight McKenzie', 'student', 6, 3, NULL, 0, 1, '32', '97-582-75', 0, 0, '', 0, NULL, NULL, '2684927694', '2047916', 1, 33, '', NULL, '', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(115, 'thiel.justice', 'lind.jason@kunze.biz', '$2y$10$uLTHBYom5GzqfSwJ6uytjeKJz7o3SuoRYoMKz3f7oKTO30c4RsxuK', '', '[St] Douglas Stiedemann', 'student', 6, 1, NULL, 0, 1, '9', '66-480-76', 0, 0, '', 0, NULL, NULL, '3216141213', '3683059', 10, 20, '', NULL, '', '050.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(116, 'hagenes.jessyca', 'bartholome14@stanton.biz', '$2y$10$flP4.TSAwgWN0u2NCHRk/ebwijJ.cfs135yhfVEvgP/Pc88lq/rGC', '', '[St] Leslie Kerluke', 'student', 6, 1, NULL, 0, 1, '85', '41-829-67', 0, 0, '', 0, NULL, NULL, '3097615245', '9272091', 4, 30, '', NULL, '', '010.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(117, 'adrienne.stanton', 'sophie41@yahoo.com', '$2y$10$3SKIr.E5aQSCxrluqEGKb.Vb/7Wss.gC/8gkGVwlo4l9iD.dvwOdu', '', '[St] Jaydon Heidenreich', 'student', 6, 3, NULL, 0, 1, '72', '47-161-10', 0, 0, '', 0, NULL, NULL, '4107334489', '2878026', 4, 16, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(118, 'herman.hermann', 'felicita74@tromp.com', '$2y$10$e.DWmXdKZEpFjQs3Km/dX.RjQM/CeJXvu40/mfsiXv9SkYvT7bpji', '', '[St] Jermey Gislason', 'student', 6, 1, NULL, 0, 1, '12', '54-342-86', 0, 0, '', 0, NULL, NULL, '4739109699', '9550520', 3, 8, '', NULL, '', '076.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(119, 'ilueilwitz', 'winston30@mueller.net', '$2y$10$jMp.5yC4R76ayXcMFB1mBuhJZoOrzueLrYDXrr9rhTKTbGj1h80ri', '', '[St] Dereck Frami', 'student', 6, 1, NULL, 0, 1, '69', '67-652-44', 0, 0, '', 0, NULL, NULL, '6678836416', '6985519', 10, 20, '', NULL, '', '056.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(120, 'schamberger.randi', 'funk.ayden@yahoo.com', '$2y$10$5D.0eo6HKYHNhHJOKDjY.O0gV/eDbGHmDJHi6TgZhVlxNxOgGD81K', '', '[St] Cody Boyer', 'student', 6, 2, NULL, 0, 1, '10', '34-865-41', 0, 0, '', 0, NULL, NULL, '8269649960', '3291329', 1, 45, '', NULL, '', '051.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(121, 'alexzander89', 'watsica.keira@glover.com', '$2y$10$bSzDp7vRLhsCai2AECrSzefR5qhasEQNDEr3YPcWlrylxd7Ys2YAi', '', '[St] Dorris Kilback', 'student', 6, 2, NULL, 0, 1, '36', '75-256-38', 0, 0, '', 0, NULL, NULL, '9619726772', '2407569', 2, 22, '', NULL, '', '040.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(122, 'lilly28', 'abagail.leuschke@kutch.com', '$2y$10$aP2MfdambudSQZFgiAfYAu8ne2aYacONKQysMXA3cPpxUd4DGv05a', '', '[St] Prof. Adolfo Hayes', 'student', 6, 1, NULL, 0, 1, '1', '50-199-29', 0, 0, '', 0, NULL, NULL, '9704215165', '3058099', 3, 26, '', NULL, '', '092.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(123, 'lily13', 'strosin.eric@hotmail.com', '$2y$10$VilJ9ZBy9qiKrfw7wZYkWuad6.F9HhvUulNxwLTEhJySj6s2JeW7y', '', '[St] Alexandrine West', 'student', 6, 4, NULL, 0, 1, '64', '13-774-55', 0, 0, '', 0, NULL, NULL, '1445556643', '3476653', 8, 23, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(124, 'mabelle.jacobs', 'okeefe.maximo@bartell.com', '$2y$10$2tr7iF31Ovv3TdPM6o8wsuSL9GROAZLqGuEwrxNg7GjTXXgWzOrzu', '', '[St] Miss Hassie Ferry PhD', 'student', 6, 1, NULL, 0, 1, '36', '64-411-21', 0, 0, '', 0, NULL, NULL, '7495252950', '2164078', 10, 20, '', NULL, '', '087.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(125, 'jazlyn.purdy', 'nayeli.altenwerth@hotmail.com', '$2y$10$JWQd9F3HidJN5vjklSeu5u3jIbF6qqdM0awPHpWPWPYO6UzWtNwF.', '', '[St] Miss Leda Ledner DVM', 'student', 6, 1, NULL, 0, 1, '38', '64-624-60', 0, 0, '', 0, NULL, NULL, '4278555554', '6174131', 2, 22, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(126, 'kirstin10', 'uboyer@yahoo.com', '$2y$10$RhiccY69oP0wA6yf.78PUOI2noBbpzHdjwBiZLVxb57hT.c5CovO6', '', '[St] Brennon Wehner DDS', 'student', 6, 3, NULL, 0, 1, '34', '85-470-55', 0, 0, '', 0, NULL, NULL, '1964248351', '2598067', 4, 1, '', NULL, '', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(127, 'bosco.jana', 'sarah22@strosin.info', '$2y$10$SGASJpSTrzUqN0yZS1tUrOoTIWjNscK8M7CykPByMS34U7vzzICF6', '', '[St] Josefa Hegmann', 'student', 6, 4, NULL, 0, 1, '84', '95-280-93', 0, 0, '', 0, NULL, NULL, '3730281428', '5349289', 8, 23, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(128, 'donavon.sporer', 'coralie30@hotmail.com', '$2y$10$DSbS7rs82xJy578U06Un3usKsxoYBVdD9Vn4KEoBpiv2b2i6PRKou', '', '[St] Ilene Moen PhD', 'student', 6, 1, NULL, 0, 1, '18', '22-642-33', 0, 0, '', 0, NULL, NULL, '8125461442', '1644604', 8, 49, '', NULL, '', '095.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(129, 'yost.ian', 'jamir.daugherty@gmail.com', '$2y$10$HwkFp5U39w5DOMq.ATr4tODWUXGkR3mEDnDVNFP5a85npTb64REtu', '', '[St] Loren Mitchell', 'student', 6, 1, NULL, 0, 1, '21', '97-391-84', 0, 0, '', 0, NULL, NULL, '3208644943', '1270663', 10, 20, '', NULL, '', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');
INSERT INTO `users` (`id`, `username`, `email`, `password`, `remember_token`, `fullName`, `role`, `role_perm`, `department`, `designation`, `studentAcademicYear`, `activated`, `studentRollId`, `admission_number`, `admission_date`, `std_category`, `auth_session`, `birthday`, `gender`, `address`, `phoneNo`, `mobileNo`, `studentClass`, `studentSection`, `religion`, `parentProfession`, `parentOf`, `photo`, `isLeaderBoard`, `restoreUniqId`, `transport`, `transport_vehicle`, `hostel`, `medical`, `user_position`, `defLang`, `defTheme`, `salary_type`, `salary_base_id`, `comVia`, `father_info`, `mother_info`, `biometric_id`, `library_id`, `account_active`, `customPermissionsType`, `customPermissions`, `firebase_token`, `updated_at`) VALUES
(130, 'khickle', 'russel.baylee@koelpin.com', '$2y$10$E8LLN/l9U5Y0JHGr9FiOLe2FGXt2aKYPylGY8D4gBOxmHLSfIaGam', '', '[St] Kaya Morissette', 'student', 6, 4, NULL, 0, 1, '82', '75-437-12', 0, 0, '', 0, NULL, NULL, '6403912502', '7625902', 6, 50, '', NULL, '', '069.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(131, 'hessel.sarina', 'percival.doyle@wunsch.info', '$2y$10$OhDJmNSryd8Gzl7hf1AXb.4XHaBfVhagg.bARALWWGeJq3bUX7CMq', '', '[St] Dr. Rahul Cremin', 'student', 6, 1, NULL, 0, 1, '26', '93-682-94', 0, 0, '', 0, NULL, NULL, '7094744637', '7833246', 4, 30, '', NULL, '', '022.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(132, 'hackett.missouri', 'oeichmann@roberts.com', '$2y$10$SE1kdh.V3AIXOg5C3R/8NOkaIMWLdqfaSD4Py1wbFvlDn.pIWLcqG', '', '[St] Zoila Turner', 'student', 6, 1, NULL, 0, 1, '89', '68-778-47', 0, 0, '', 0, NULL, NULL, '9911432865', '1015657', 1, 13, '', NULL, '', '026.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(133, 'schroeder.kameron', 'boehm.serenity@yahoo.com', '$2y$10$iYsew.zzA/1xVKIT1EZjTuJIRbQ3xPlogdEalmWgGtZzqf0yD6cUO', '', '[St] Mose Kirlin', 'student', 6, 2, NULL, 0, 1, '5', '61-208-58', 0, 0, '', 0, NULL, NULL, '3256975844', '4756500', 8, 5, '', NULL, '', '043.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(134, 'emory.bailey', 'pagac.brannon@waters.info', '$2y$10$6ak88KSMXovruINIHD6wI.epCfJQI3jVQqhEw4KaVhzHO0r6pJswm', '', '[St] Kali Cole', 'student', 6, 1, NULL, 0, 1, '1', '18-482-31', 0, 0, '', 0, NULL, NULL, '3341919431', '6133805', 8, 34, '', NULL, '', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(135, 'emard.maximillian', 'libby.jacobi@damore.biz', '$2y$10$ouvdogj95dxBm5TNiHsMauhDIoegAleX74px32omcfTXCZAVRQwwK', '', '[St] Caleb Reynolds', 'student', 6, 2, NULL, 0, 1, '27', '77-428-57', 0, 0, '', 0, NULL, NULL, '4854885943', '3432962', 4, 37, '', NULL, '', '082.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(136, 'elwin44', 'bobbie.feest@hoppe.com', '$2y$10$vboCpFvU98kvXxKAneCk2.gr26Hc0BxEXph7w8C0odsdu.ZojuZCu', '', '[St] Demetrius Donnelly III', 'student', 6, 4, NULL, 0, 1, '75', '79-595-47', 0, 0, '', 0, NULL, NULL, '3182448438', '7514133', 6, 50, '', NULL, '', '061.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(137, 'levi.aufderhar', 'agnes77@gmail.com', '$2y$10$vGJ3E3515pW0USDbaWhYX.8Y.SA6UHDNwxLJ7IdB1JZFrK8zlEUt6', '', '[St] Ms. Kamille Schowalter', 'student', 6, 2, NULL, 0, 1, '66', '66-413-28', 0, 0, '', 0, NULL, NULL, '7235486221', '1566234', 8, 3, '', NULL, '', '08.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(138, 'destini.runte', 'odessa.bartoletti@hotmail.com', '$2y$10$f1GmBJAIqdquicXCOR8j8erDPWy8/zSHTsRPC8xoGUPNtE6g5a9KG', '', '[St] Dr. Melvin Dietrich II', 'student', 6, 4, NULL, 0, 1, '18', '89-855-24', 0, 0, '', 0, NULL, NULL, '9216333182', '9580932', 5, 46, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(139, 'alyson.barton', 'audie.king@yundt.net', '$2y$10$r0wyLKrFQDGotfVUSj5uYe6k6qeYPhE62wFDHbfMVeBvUt.i/W6QW', '', '[St] Dr. Amos Smitham', 'student', 6, 4, NULL, 0, 1, '65', '29-709-71', 0, 0, '', 0, NULL, NULL, '9656585296', '4228026', 6, 43, '', NULL, '', '064.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(140, 'dorthy77', 'harold.jerde@gmail.com', '$2y$10$0QnOWyi4IXw1VS7Tupyhy..c5y9QXLYYJzRyxsMjGkid2Gp/vz51O', '', '[St] Eveline Lowe', 'student', 6, 4, NULL, 0, 1, '61', '97-954-27', 0, 0, '', 0, NULL, NULL, '4118398598', '3200862', 5, 28, '', NULL, '', '052.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(141, 'romaguera.delores', 'brionna40@hotmail.com', '$2y$10$KO96Hm9fbkJNIwpQAg2L2eNI.Ku1mgmCUG8SoU/Tn4v9xOBheGmFa', '', '[St] Geovany King', 'student', 6, 4, NULL, 0, 1, '95', '19-459-59', 0, 0, '', 0, NULL, NULL, '6224177775', '7356746', 2, 22, '', NULL, '', '068.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(142, 'stiedemann.aliya', 'zora27@yahoo.com', '$2y$10$kbIaaO4GnwjpdBukMj95IesYnS7F6xbopfHOF5/RtZxL26cZATVYe', '', '[St] Roderick Barrows', 'student', 6, 3, NULL, 0, 1, '99', '99-286-94', 0, 0, '', 0, NULL, NULL, '3648549464', '6352899', 5, 48, '', NULL, '', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(143, 'flossie.kuhic', 'vbode@gmail.com', '$2y$10$FMAvj.GRc4MzC9/AcUkcUOvTlR/66xqAw2KNfgnQPdJh8PqwOxe12', '', '[St] Clementine Beatty', 'student', 6, 4, NULL, 0, 1, '5', '44-230-12', 0, 0, '', 0, NULL, NULL, '7570467808', '4579748', 7, 41, '', NULL, '', '050.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(144, 'bartell.bernadette', 'dejuan.hahn@gmail.com', '$2y$10$Bsk7DW43Gft0W1qyHvmCAebqDxTI3mJAuKrz001OBnk27exzMaUy2', '', '[St] Audie Frami', 'student', 6, 1, NULL, 0, 1, '80', '40-487-73', 0, 0, '', 0, NULL, NULL, '4037123665', '3204175', 7, 27, '', NULL, '', '090.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(145, 'haag.margarett', 'michelle.cole@rau.com', '$2y$10$SIGyT6Ib.PXipwFveRMbXeEBsURvpbbI6DdYBqcFFHLlwcofjTsna', '', '[St] Miss Arlene Carter PhD', 'student', 6, 3, NULL, 0, 1, '9', '30-497-43', 0, 0, '', 0, NULL, NULL, '2447176918', '5493638', 1, 35, '', NULL, '', '072.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(146, 'yfisher', 'lillian.considine@collier.biz', '$2y$10$VIV1aTiRo/pE7vz4IpSdheEGL4TXr1GN6yZziXc3kLYqSaXa.b1/.', '', '[St] Hellen Lebsack', 'student', 6, 3, NULL, 0, 1, '38', '80-762-95', 0, 0, '', 0, NULL, NULL, '5308801404', '3360231', 9, 4, '', NULL, '', '091.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(147, 'litzy.oberbrunner', 'pascale60@will.com', '$2y$10$u9jB8sTWCwSyeATcalsj3.PweMfaJ5qMV9lSGmONdRhxO4qjEFJRC', '', '[St] Mrs. Eulah Collier Jr.', 'student', 6, 3, NULL, 0, 1, '60', '96-494-95', 0, 0, '', 0, NULL, NULL, '7867149545', '4716001', 10, 20, '', NULL, '', '033.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(148, 'ubailey', 'georgette48@hotmail.com', '$2y$10$R4K64JSS523iEj6lfGH4relGexSr2.yDzF..UJjAz8/6qbt8YOgHS', '', '[St] Webster Heidenreich', 'student', 6, 3, NULL, 0, 1, '3', '71-342-94', 0, 0, '', 0, NULL, NULL, '7894808997', '5133501', 2, 38, '', NULL, '', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(149, 'osbaldo98', 'whermann@conn.com', '$2y$10$kTq9c7G20IpFtZ/qP9MOle8uOKpOoTJjjyM/7PgPWt9/6IgGAIgR2', '', '[St] Mr. Isaias Schmeler', 'student', 6, 2, NULL, 0, 1, '54', '23-935-55', 0, 0, '', 0, NULL, NULL, '8233914725', '5128088', 8, 18, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(150, 'katherine52', 'vroob@yahoo.com', '$2y$10$2PBrx0kia6DWDdhZrbjV1uDJ/WEMsq1VGCkmbmpNbAPql1Ld.MB5y', '', '[St] Rigoberto Feil', 'student', 6, 1, NULL, 0, 1, '53', '59-194-24', 0, 0, '', 0, NULL, NULL, '6263622316', '7799105', 9, 14, '', NULL, '', '091.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(151, 'morar.desmond', 'garth.hammes@yahoo.com', '$2y$10$R0OR64LJKRRHHtQMzCCUZ.P.CNUNTIle0yyFpe9n1vXORRLNPbS22', '', '[St] Leta Wilkinson', 'student', 6, 1, NULL, 0, 1, '95', '70-878-16', 0, 0, '', 0, NULL, NULL, '5136788591', '4524828', 2, 22, '', NULL, '', '091.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(152, 'iliana35', 'arno34@koch.com', '$2y$10$GkGb7uUnyQe2BGwbz3qg9eWszjLf1M..cOC6s1Rz9fru42NTqEJK2', '', '[St] Ms. Jacinthe Gerlach PhD', 'student', 6, 3, NULL, 0, 1, '26', '21-507-17', 0, 0, '', 0, NULL, NULL, '2030672569', '7794495', 3, 8, '', NULL, '', '056.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(153, 'huels.lesly', 'travon67@yahoo.com', '$2y$10$IDI/PeTMag7ZgB5QZhO0AeHL41kvDd6aUdsHmtdTkeG45S4Nkr.aS', '', '[St] Dr. Karley Klocko', 'student', 6, 1, NULL, 0, 1, '47', '44-729-14', 0, 0, '', 0, NULL, NULL, '4904415651', '3904896', 6, 32, '', NULL, '', '036.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(154, 'florian84', 'dietrich.nick@kub.net', '$2y$10$GF1p.HrgTIso4EzO9Y5my.fNtTpQwq4AYktqIekrWm6iQRKqQ016m', '', '[St] Meredith Denesik', 'student', 6, 2, NULL, 0, 1, '63', '60-856-66', 0, 0, '', 0, NULL, NULL, '9960529451', '5120055', 9, 7, '', NULL, '', '034.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(155, 'marilie04', 'mueller.shaniya@hotmail.com', '$2y$10$QsBwJ94he8zJj0Sorz0Uo.E1CBW0ZSv8k03NHcxP1f/tyA/SiRVQ2', '', '[St] Prof. Jany Goldner', 'student', 6, 2, NULL, 0, 1, '9', '86-888-98', 0, 0, '', 0, NULL, NULL, '5794207459', '5365438', 3, 8, '', NULL, '', '067.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(156, 'parent', 'usawayn@yahoo.com', '$2y$10$MCKSvo3USRY63IRLher68.T9LG9O1YLRwnvpWu.73DLmjUxaa4Nye', '', '[Pa] Sydney Renner I', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9235033305', '7858113', 4, 14, '', NULL, '[{\"student\":\"[St] Brennon Wehner DDS\",\"relation\":\"father\",\"id\":126}]', '012.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(157, 'hnolan', 'wosinski@hotmail.com', '$2y$10$rPOUPI0VkAmfIiGmv7qfGO2Y0FcpPCKhThpmWg3rDE.epOj53GcLe', '', '[Pa] Kara Erdman', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8344515198', '9500753', 9, 32, '', NULL, '[{\"student\":\"[St] Marta Gibson\",\"relation\":\"father\",\"id\":113}]', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(158, 'luz71', 'feeney.maudie@damore.biz', '$2y$10$6jxc5p7KkAXh/WJndL86TuR5WepJQcVQf1hsI58nJQ1za1uzURsNm', '', '[Pa] Kellen Murray', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4333391796', '4069000', 10, 35, '', NULL, '[{\"student\":\"[St] Demetrius Donnelly III\",\"relation\":\"father\",\"id\":136}]', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(159, 'taryn22', 'judson.sanford@reynolds.com', '$2y$10$ZP7fc23VFxmKjIiqEla1jek26N2mHwU6uxhYzofRWWf6/wvJiRgD.', '', '[Pa] Prof. Joelle Ward Jr.', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9644322627', '4082002', 7, 7, '', NULL, '[{\"student\":\"[St] Brennon Wehner DDS\",\"relation\":\"father\",\"id\":126}]', '046.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(160, 'hzemlak', 'alfreda65@windler.com', '$2y$10$rrLnsqx5sZOB9.pKeiz63OviChPzxwqmNDQhwkwR73jkSz/DrVzKC', '', '[Pa] Antonette Hills', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9493210552', '6402941', 6, 8, '', NULL, '[{\"student\":\"[St] Grover Harber\",\"relation\":\"father\",\"id\":108}]', '088.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(161, 'haley.corbin', 'lharris@oreilly.com', '$2y$10$WymYBYQyfNFTUAI.GMftyeDp/xgELMhVnH0iq04gBSNLXLotbQX1S', '', '[Pa] Billy Kassulke', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3112271811', '9880638', 3, 23, '', NULL, '[{\"student\":\"[St] Mrs. Eulah Collier Jr.\",\"relation\":\"father\",\"id\":147}]', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(162, 'cummerata.maurine', 'shakira.king@parisian.info', '$2y$10$ONA7hT5BCHKI4EKYd72mU.S5.sLA5x0FtAglbLk5vPsUl9iHAe9na', '', '[Pa] Paul Nienow', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3579061193', '4473006', 2, 19, '', NULL, '[{\"student\":\"[St] Dwight McKenzie\",\"relation\":\"father\",\"id\":114}]', '066.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(163, 'franecki.donna', 'tromp.yolanda@crist.info', '$2y$10$8OeOvuAFAqqXK7uySGh9heCfmRLcXKysCevUzJmuAJIeMG1a/EVZe', '', '[Pa] Gerard Jacobson', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8159309183', '5595277', 7, 12, '', NULL, '[{\"student\":\"[St] Mrs. Eulah Collier Jr.\",\"relation\":\"father\",\"id\":147}]', '083.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(164, 'verlie.koepp', 'jefferey02@gmail.com', '$2y$10$8GF/jlgiTkI.Lo4HJ3eDJ.ss/TdSVlwHaAZh1/T0hctrkVAQ5kZPi', '', '[Pa] Abel Schaefer', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8719324497', '5322395', 7, 5, '', NULL, '[{\"student\":\"[St] Prof. Adolfo Hayes\",\"relation\":\"father\",\"id\":122}]', '097.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(165, 'charlotte18', 'meta.raynor@rodriguez.info', '$2y$10$dlwchAFnBdJ4lu3egZaNAucRN1ytoZyEZWn1IHZQ4l4PVYUxG/dN2', '', '[Pa] Javier Murphy V', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6907094761', '5402460', 3, 34, '', NULL, '[{\"student\":\"[St] Dr. Amos Smitham\",\"relation\":\"father\",\"id\":139}]', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(166, 'jerde.jazlyn', 'monte37@hotmail.com', '$2y$10$2gOCvjT3ECCLOzQ4RIZvY.M6qGF1mDL99x21n1d3FO7BI2gLP/Una', '', '[Pa] Dr. Oliver Nader DVM', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2053025262', '5245505', 7, 22, '', NULL, '[{\"student\":\"[St] Ms. Kamille Schowalter\",\"relation\":\"father\",\"id\":137}]', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(167, 'wcassin', 'warren78@bauch.net', '$2y$10$HmMUhS1FGQ0amtqyO0hnROIuRAhViCEq89u1w0hKr3NC2jT1dK7.e', '', '[Pa] Mayra Blanda', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5529011983', '6662696', 6, 32, '', NULL, '[{\"student\":\"[St] Shanny Schaefer DVM\",\"relation\":\"father\",\"id\":112}]', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(168, 'hconn', 'lera90@hotmail.com', '$2y$10$yXNiBnhyqzcKoS1X5XI2uO8sU4sEI1OO9BcHopvEUr900QHrtoKlS', '', '[Pa] Kraig Reynolds', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5858106659', '4085352', 9, 34, '', NULL, '[{\"student\":\"[St] Roderick Barrows\",\"relation\":\"father\",\"id\":142}]', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(169, 'dach.barton', 'hwhite@yahoo.com', '$2y$10$33t1K2sFnsgJPgcmbs691.rfy1LR9f4Xyw7PCpTLQVVVONpa.l6Za', '', '[Pa] Mr. Erwin Armstrong I', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6962965729', '2138018', 4, 6, '', NULL, '[{\"student\":\"[St] Ms. Kamille Schowalter\",\"relation\":\"father\",\"id\":137}]', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(170, 'oschroeder', 'rratke@hahn.com', '$2y$10$PUVKLlUviB7GS.gdRNyKbepEdioAM6wYkOZLYJEwSSmS.tvutmthi', '', '[Pa] Cierra Langosh', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5857579657', '8329824', 3, 47, '', NULL, '[{\"student\":\"[St] Jaydon Heidenreich\",\"relation\":\"father\",\"id\":117}]', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(171, 'koepp.pietro', 'joseph.vandervort@yahoo.com', '$2y$10$ULoebagA7plalsU1fFMQxus/ZEn/FvPgR6reP2Wm22XW1xXEe1czy', '', '[Pa] Gerry Towne', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8716342649', '3358435', 1, 47, '', NULL, '[{\"student\":\"[St] Jermey Gislason\",\"relation\":\"father\",\"id\":118}]', '04.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(172, 'cecile59', 'damian83@collins.net', '$2y$10$OU3NMZttWCAxY5X6BwRMF.E.ePODgVoHtfRqzk5qQUx87VYfZgYri', '', '[Pa] Royal Moore', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7654275586', '6100757', 2, 7, '', NULL, '[{\"student\":\"[St] Cody Boyer\",\"relation\":\"father\",\"id\":120}]', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(173, 'ischroeder', 'veda.dare@hotmail.com', '$2y$10$TRFIAOslPAUbNt7xuMMttepHrBbhEafKZQdcMOaYurPy0b6ChwVKi', '', '[Pa] Ms. Bailee Bernier', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8568507755', '1805069', 8, 36, '', NULL, '[{\"student\":\"[St] Dr. Rahul Cremin\",\"relation\":\"father\",\"id\":131}]', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(174, 'lklein', 'nienow.delmer@hill.com', '$2y$10$FsHAC79eoKu93sudr4iSA.Yq4tEyoHooiBL2eFdLDZQkJhLgViYP.', '', '[Pa] Laury Heller MD', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6978512603', '5534878', 1, 34, '', NULL, '[{\"student\":\"[St] Douglas Stiedemann\",\"relation\":\"father\",\"id\":115}]', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(175, 'karlee.jaskolski', 'rschultz@yahoo.com', '$2y$10$X4HUWimUfEine6Lx3/65Ne7x8mfk5X7NQmyTuEgjtqU9MV4utyLoq', '', '[Pa] Mr. Ransom Tillman DDS', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1464443999', '6827598', 4, 3, '', NULL, '[{\"student\":\"[St] Kaya Morissette\",\"relation\":\"father\",\"id\":130}]', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(176, 'jones.ashleigh', 'jarred.mraz@champlin.com', '$2y$10$3eUNSDt3r.bIPtmVaaKuRekeqCvqXrieDMkn2R8YqiZe1XoHZOA0m', '', '[Pa] Ms. Jacquelyn O\'Keefe V', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6099035875', '2285529', 10, 50, '', NULL, '[{\"student\":\"[St] Dwight McKenzie\",\"relation\":\"father\",\"id\":114}]', '084.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(177, 'wehner.wilber', 'ila97@treutel.info', '$2y$10$bjfXKJi7BS5IgNS7vy6YU.gaNRFmm1btqTJo/zR3rf/1ffut5CxvS', '', '[Pa] Jesse Kassulke', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4887798284', '2915423', 2, 27, '', NULL, '[{\"student\":\"[St] Dwight McKenzie\",\"relation\":\"father\",\"id\":114}]', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(178, 'jprohaska', 'stephen85@hessel.com', '$2y$10$FIyO5i4KwPcBOk.XuRSL7ODEp7VGGZFEwg4r7dpoYXLyubRQtuavq', '', '[Pa] Neal Hill', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5886178929', '3642201', 1, 27, '', NULL, '[{\"student\":\"[St] Eveline Lowe\",\"relation\":\"father\",\"id\":140}]', '067.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(179, 'wunsch.dariana', 'charity19@oreilly.biz', '$2y$10$Wlg8WLDl92rIoPuYisFlm.xjC26.q.R58uv5SnUVWQVj7tv10CU4C', '', '[Pa] Laron Schaefer', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3549160636', '8667594', 5, 31, '', NULL, '[{\"student\":\"[St] Marta Gibson\",\"relation\":\"father\",\"id\":113}]', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(180, 'isabelle.hagenes', 'zblanda@hotmail.com', '$2y$10$O0OJdewf9KbyB8gkg56Dz.SqoF9f89JRM1S1j2lRkAxlgAoW4qB3i', '', '[Pa] Kirk Langosh', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1955959634', '7025494', 2, 43, '', NULL, '[{\"student\":\"[St] Prof. Claire Lehner PhD\",\"relation\":\"father\",\"id\":107}]', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(181, 'smclaughlin', 'ziemann.everett@hotmail.com', '$2y$10$Cp4FyB2z8luL/1IFU44cxurwD.vSJfA0oCIJPwAKwmbCkQoVEvEJ2', '', '[Pa] Kenyatta Schowalter', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9194249686', '6524923', 6, 16, '', NULL, '[{\"student\":\"[St] Caleb Reynolds\",\"relation\":\"father\",\"id\":135}]', '051.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(182, 'cole.foster', 'proob@dicki.com', '$2y$10$aO6gMTBHwF6QP40uGlXMHetekJAY5KuFpFDn4CcetpG3Cc0cINSDe', '', '[Pa] Mrs. Jakayla Toy', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4178313323', '7483777', 2, 42, '', NULL, '[{\"student\":\"[St] Dorris Kilback\",\"relation\":\"father\",\"id\":121}]', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(183, 'gregoria.torp', 'phoebe75@cassin.com', '$2y$10$dQ9SAV8XAZ3Phm5uH3TZMu1R0PnP7ayOseSv7AUB8kwoBReUqfS7a', '', '[Pa] Benjamin Beahan', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1359862416', '8421680', 8, 10, '', NULL, '[{\"student\":\"[St] Miss Hassie Ferry PhD\",\"relation\":\"father\",\"id\":124}]', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(184, 'dominique62', 'dhauck@mills.com', '$2y$10$qpwX8V1pVOioyS/8OcbR1Ofy5oxI/b/M8WtY2fvFLkcMtMUaXcuxO', '', '[Pa] Reggie Lind', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4381303699', '9784460', 10, 6, '', NULL, '[{\"student\":\"[St] Jorge Watsica\",\"relation\":\"father\",\"id\":110}]', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(185, 'cjones', 'gleannon@hotmail.com', '$2y$10$jqIFugwnLW4wP.fu7rUTc.1sLMBA5fvIJUjjx3NkRw5XEHDvLC.ke', '', '[Pa] Miss Avis Kirlin II', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9932852779', '6037939', 6, 45, '', NULL, '[{\"student\":\"[St] Demetrius Donnelly III\",\"relation\":\"father\",\"id\":136}]', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(186, 'thompson.joannie', 'hartmann.reanna@yahoo.com', '$2y$10$.K8SkWIqBHJcXzxhp2i8GO8F563rC37W5Bku.vCx8bDOlHjOUNkEO', '', '[Pa] Roscoe Grimes', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6998663979', '8875561', 4, 6, '', NULL, '[{\"student\":\"[St] Jaydon Heidenreich\",\"relation\":\"father\",\"id\":117}]', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(187, 'lee.zboncak', 'harvey.eunice@pouros.com', '$2y$10$TLvcC8qgG9UhZJEkN9YJou/lTqQDdFXztbSE.YMPirPQUQql0ToYG', '', '[Pa] Charity Hettinger', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2122126464', '4514663', 9, 16, '', NULL, '[{\"student\":\"[St] Caleb Reynolds\",\"relation\":\"father\",\"id\":135}]', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(188, 'jbrakus', 'slang@yahoo.com', '$2y$10$owelr7D2lPifOxKTFFvolubhYYfb0qvbN/H6obONKneEAX1ZEOpgm', '', '[Pa] Mikel Zulauf DVM', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6323537534', '2811858', 7, 6, '', NULL, '[{\"student\":\"[St] Mr. Isaias Schmeler\",\"relation\":\"father\",\"id\":149}]', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(189, 'cristian.herzog', 'bertrand.crona@price.biz', '$2y$10$VDCNsLBnmRPrPHoRJ4nInOyr78.yjsDtLWO0ETrM8bi2eo/yqOGq6', '', '[Pa] Heidi Metz', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1525952137', '9783769', 7, 37, '', NULL, '[{\"student\":\"[St] Harold Sauer II\",\"relation\":\"father\",\"id\":105}]', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(190, 'zheathcote', 'dkub@johnston.com', '$2y$10$nzomZUJCiGy0mKCiJCIoYOqxABhQi.HQbiyA46NfgQh1EklTH1miS', '', '[Pa] Dr. Alva Casper', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1239836762', '5769095', 8, 20, '', NULL, '[{\"student\":\"[St] Dorris Kilback\",\"relation\":\"father\",\"id\":121}]', '050.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(191, 'ubeatty', 'michelle.towne@rippin.com', '$2y$10$OGzRWydKImKCSgomV5s0UeXpDXWuLBqvMTbXKSU5aYCincWK/JK5.', '', '[Pa] Jaron Heller', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9886446436', '8680719', 7, 50, '', NULL, '[{\"student\":\"[St] Miss Hassie Ferry PhD\",\"relation\":\"father\",\"id\":124}]', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(192, 'mertz.erwin', 'wisozk.riley@hirthe.com', '$2y$10$zeIh/Sams.asRoGISntwL.6hxY/An88p377b0/teou250033Yh15W', '', '[Pa] Bridget Lebsack', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9630535201', '9850844', 8, 32, '', NULL, '[{\"student\":\"[St] Ms. Jacinthe Gerlach PhD\",\"relation\":\"father\",\"id\":152}]', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(193, 'stoltenberg.gregg', 'amante@gmail.com', '$2y$10$/MYN4Bwr6SVjPn.zQIFKKeOxlbMfIlREoDQ3Qe32J2W9xm3exFWcW', '', '[Pa] Nicolas Torphy', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4214803814', '1374179', 4, 6, '', NULL, '[{\"student\":\"[St] Rigoberto Feil\",\"relation\":\"father\",\"id\":150}]', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(194, 'aufderhar.ford', 'cleora.rempel@yahoo.com', '$2y$10$axoysSijB0H25rzxXBsef.gA60mw02u/V197dMqYVY/ImiKtqJjXW', '', '[Pa] Clarabelle Walter MD', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8090679130', '1977972', 1, 33, '', NULL, '[{\"student\":\"[St] Ilene Moen PhD\",\"relation\":\"father\",\"id\":128}]', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(195, 'gertrude.reynolds', 'davon46@bailey.com', '$2y$10$xToSULDFz.Fs6Tq9Z9jgbOBa3i0EgIq/9JlrOTq24iGSlxQtyAhQa', '', '[Pa] Mrs. Ena Dickinson', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6648725935', '4794466', 4, 12, '', NULL, '[{\"student\":\"[St] Miss Arlene Carter PhD\",\"relation\":\"father\",\"id\":145}]', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(196, 'marjorie34', 'hebert@gmail.com', '$2y$10$/nwuyC9o2IxpqjVXgoeu0uwEyjnMuFxkSsv3RhTFu3uYIH1fARmuS', '', '[Pa] Wyatt Vandervort', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4399316438', '7586815', 2, 35, '', NULL, '[{\"student\":\"[St] Dwight McKenzie\",\"relation\":\"father\",\"id\":114}]', '022.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(197, 'lemke.raymundo', 'clementina.reichel@wiza.com', '$2y$10$zgDwXrOyio.11vTe/OIg6.cjbPakhdoO0rnfFiNCVyhKfQ2zcV.8S', '', '[Pa] Iliana Becker IV', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5094675597', '4487122', 5, 34, '', NULL, '[{\"student\":\"[St] Jaydon Heidenreich\",\"relation\":\"father\",\"id\":117}]', '022.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(198, 'asmitham', 'pfeffer.barbara@lueilwitz.org', '$2y$10$yEHfwYm.0mNqNhROSJqTlurYGK0ngb4yEknFoTSuzJrrhubM5kJu.', '', '[Pa] Murl Rippin', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4730832652', '8151728', 7, 27, '', NULL, '[{\"student\":\"[St] Audie Frami\",\"relation\":\"father\",\"id\":144}]', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(199, 'aberge', 'goberbrunner@hotmail.com', '$2y$10$AuYDYRblnzgQF3fbOBviyu4TlbjDVSfi43xjKWelhibVcjW2OgWiO', '', '[Pa] Sam Schimmel', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2082687650', '6784769', 7, 19, '', NULL, '[{\"student\":\"[St] Miss Hassie Ferry PhD\",\"relation\":\"father\",\"id\":124}]', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(200, 'mnikolaus', 'velva.stoltenberg@hotmail.com', '$2y$10$yJeM/FsNBM.lxO6QTpQ4AeSUB8hfsEyzihHVPz9vxpwQct85HFuPm', '', '[Pa] Agustin Wehner', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9232309124', '3644746', 6, 42, '', NULL, '[{\"student\":\"[St] Prof. Jany Goldner\",\"relation\":\"father\",\"id\":155}]', '049.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(201, 'jaylin.tillman', 'moen.jovan@renner.com', '$2y$10$B/MNEj8UV/cTQsl8wLARmeOELMRdMeNusNkUs1PuOPix8BN6L2vtm', '', '[Pa] Shanon Strosin DDS', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3015905851', '6357272', 2, 5, '', NULL, '[{\"student\":\"[St] Grover Harber\",\"relation\":\"father\",\"id\":108}]', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(202, 'stanford50', 'ostokes@kautzer.com', '$2y$10$qDmwOtXvEFYVu4eLKrFr8u7EuYOMmJMsAqC./ItFFgs0iKMYNADKW', '', '[Pa] Dr. Anika Lebsack', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2426282534', '1707929', 6, 14, '', NULL, '[{\"student\":\"[St] Demetrius Donnelly III\",\"relation\":\"father\",\"id\":136}]', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(203, 'bode.flavie', 'camilla.vandervort@gmail.com', '$2y$10$DP81KN7WBWIYcv6LHRsDEefTRJf6gyf9bp3LlYFekWo86pAeffkJy', '', '[Pa] Julie Nicolas', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9335551409', '4397560', 8, 30, '', NULL, '[{\"student\":\"[St] Roderick Barrows\",\"relation\":\"father\",\"id\":142}]', '058.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(204, 'jadyn54', 'morissette.giovanna@lind.biz', '$2y$10$zb1suaJThnQf8Ny1qV7bfuqgnAYD5heg2Q5UhooS1vpeci.y7sEqG', '', '[Pa] Ricardo Hill', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9811237998', '5584740', 1, 23, '', NULL, '[{\"student\":\"[St] Geovany King\",\"relation\":\"father\",\"id\":141}]', '037.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(205, 'gsimonis', 'garrison94@yahoo.com', '$2y$10$tBM4FusdRGIe5oImxqf3w.my9lnzlZbUliPXZTHzTfr8b93TBQ8li', '', '[Pa] Tia Miller', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5497658809', '2170903', 1, 45, '', NULL, '[{\"student\":\"[St] Dr. Rahul Cremin\",\"relation\":\"father\",\"id\":131}]', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(206, 'xkoelpin', 'qgutkowski@hotmail.com', '$2y$10$Anym/eXgcVQtjuokTpShq...436krl8HV9JNxb6/2/DAxqwQU7l0C', '', '[Pa] Alanis Gutkowski Sr.', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3189230281', '9910312', 9, 43, '', NULL, '[{\"student\":\"[St] Selina Skiles\",\"relation\":\"father\",\"id\":109}]', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1629;
--
-- AUTO_INCREMENT for table `messages_list`
--
ALTER TABLE `messages_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1108;
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
