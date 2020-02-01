-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2019 at 11:05 AM
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
(1, 'Esse. Class', 2, 1, '[\"37\",\"34\",\"41\",\"29\",\"32\",\"42\",\"40\"]', '[\"8\",\"10\"]'),
(2, 'Quas. Class', 1, 3, '[\"36\",\"29\",\"26\",\"24\",\"33\",\"30\"]', '[\"2\",\"1\"]'),
(3, 'Nesciunt molestias. Class', 1, 3, '[\"31\",\"40\",\"44\",\"38\",\"43\",\"37\",\"35\",\"30\",\"39\",\"36\",\"33\",\"24\"]', '[\"4\",\"10\",\"1\",\"2\"]'),
(4, 'In. Class', 2, 3, '[\"30\",\"25\",\"27\",\"24\",\"29\",\"42\",\"36\",\"38\",\"40\",\"39\",\"32\",\"34\",\"37\",\"44\",\"31\"]', ''),
(5, 'Et cumque. Class', 2, 3, '[\"37\",\"26\",\"30\",\"28\",\"38\",\"40\",\"27\",\"44\",\"33\",\"25\",\"42\",\"24\",\"36\",\"39\"]', '[\"6\",\"8\",\"9\",\"7\",\"4\",\"3\"]'),
(6, 'Aliquam rem. Class', 2, 4, '[\"42\",\"33\",\"29\",\"40\",\"44\",\"37\"]', '[\"2\",\"8\",\"5\",\"10\",\"1\"]'),
(7, 'Voluptatem. Class', 1, 4, '[\"32\",\"41\",\"42\",\"40\",\"39\",\"31\",\"44\",\"43\",\"33\",\"29\",\"28\",\"30\"]', ''),
(8, 'Nulla. Class', 1, 2, '[\"42\",\"31\",\"30\",\"43\",\"35\",\"37\",\"28\",\"40\",\"44\",\"24\",\"34\",\"38\",\"33\",\"36\"]', '[\"5\"]'),
(9, 'Repellendus. Class', 2, 3, '[\"38\",\"29\",\"27\",\"25\",\"32\",\"42\",\"26\",\"31\",\"28\",\"34\",\"41\",\"36\",\"43\",\"24\",\"40\"]', '[\"6\",\"8\",\"5\",\"10\"]'),
(10, 'Laborum. Class', 2, 1, '[\"32\",\"30\",\"41\",\"42\",\"35\",\"34\",\"36\",\"27\",\"43\",\"44\",\"38\",\"26\"]', '[\"7\"]');

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
(1, 'Voluptatem atque eum qui vitae.', 'Ut quo vel tenetur et est ipsum libero sit exercitationem sit sed nemo eos esse.', 'students', 'adipisci', '', 1, '1565277403'),
(2, 'Ut atque dolores eveniet at.', 'Accusamus corporis eos doloremque sed accusantium tenetur.', 'all', 'harum', '', 0, '1563722203'),
(3, 'Dolor id.', 'Fugit consequatur non expedita.', 'teacher', 'tempora', '', 1, '1563549403'),
(4, 'Quis neque ut beatae quis.', 'Dolor repudiandae assumenda et qui illo doloribus voluptas dolores mollitia.', 'students', 'suscipit', '', 0, '1565104603'),
(5, 'Ratione omnis velit.', 'Libero ipsa assumenda ipsam ipsam est ipsum esse non quasi.', 'all', 'occaecati', '', 0, '1563463003'),
(6, 'Ea voluptates qui.', 'Quia voluptas magni enim illum consequatur similique.', 'teacher', 'incidunt', '', 0, '1565191003'),
(7, 'Voluptatem accusamus dolores nam rerum.', 'Qui totam repellendus accusantium sit ex laudantium dolorum velit qui consequatur.', 'students', 'sed', '', 1, '1563376603'),
(8, 'Sint distinctio beatae.', 'Id atque sed natus veritatis voluptas reprehenderit temporibus at et qui est sint soluta et.', 'students', 'quibusdam', '', 0, '1563549403'),
(9, 'Eum illum.', 'Deleniti odit quae vitae et debitis ut laboriosam et aut.', 'parents', 'repudiandae', '', 0, '1563549403'),
(10, 'Voluptatem itaque.', 'Consequatur assumenda ratione illum sunt praesentium ipsum mollitia.', 'teacher', 'molestiae', '', 1, '1563895003'),
(11, 'Consequatur rerum cumque.', 'Nihil accusamus numquam quis aut dolores exercitationem quo magnam et.', 'teacher', 'aut', '', 1, '1565450203'),
(12, 'Quas voluptatum tenetur.', 'Dolore sit commodi iste.', 'all', 'nisi', '', 0, '1565277403'),
(13, 'Unde qui distinctio.', 'Eum distinctio eum libero aliquid delectus laborum quod eligendi.', 'students', 'veniam', '', 0, '1564931803'),
(14, 'Occaecati optio velit ipsum blanditiis id.', 'Aspernatur rem necessitatibus non explicabo natus.', 'students', 'molestias', '', 0, '1563549403'),
(15, 'Est qui.', 'Quaerat exercitationem vel neque.', 'teacher', 'sint', '', 0, '1565191003'),
(16, 'At impedit rerum.', 'Amet aut maxime sit amet exercitationem omnis doloremque qui eligendi eius aut.', 'parents', 'enim', '', 0, '1565277403'),
(17, 'Dolores sit aspernatur.', 'Sint nesciunt tempora dolorem nisi maiores illum.', 'parents', 'velit', '', 0, '1563376603'),
(18, 'Nihil ut accusantium.', 'Ut veniam in iusto debitis non consequatur.', 'all', 'omnis', '', 0, '1565709403'),
(19, 'Qui tempora vitae.', 'Nam id eligendi adipisci non qui qui deserunt iure et accusantium dolorum.', 'students', 'ut', '', 1, '1565104603'),
(20, 'Repellendus quod eos.', 'Et nihil et ullam laborum eaque.', 'all', 'rerum', '', 0, '1564067803'),
(21, 'Voluptate accusantium tempora ex.', 'Id id quidem tempora.', 'parents', 'aspernatur', '', 0, '1564240603'),
(22, 'Voluptatem iure.', 'Ut nobis vitae vel sint.', 'teacher', 'laboriosam', '', 1, '1565363803'),
(23, 'Nam quo.', 'Est nisi eius error repudiandae quos eum est.', 'all', 'in', '', 0, '1564240603'),
(24, 'Ducimus iusto id.', 'Voluptatibus et praesentium tempore autem voluptas laborum omnis quia facere ut laborum.', 'students', 'amet', '', 1, '1563203803'),
(25, 'Omnis odit repellendus corrupti.', 'Vel suscipit quia nemo nisi eveniet totam totam atque aliquam officia.', 'teacher', 'esse', '', 1, '1563981403'),
(26, 'Et cum.', 'Tempora in quasi laborum necessitatibus.', 'all', 'dolorem', '', 1, '1564327003'),
(27, 'Adipisci dolore quo a.', 'Enim voluptas doloremque nihil quisquam assumenda maiores sit numquam ex tenetur delectus voluptates autem nisi.', 'parents', 'sit', '', 1, '1563463003'),
(28, 'Rerum ratione molestias non est.', 'Voluptas molestias fugit cupiditate non aut.', 'parents', 'enim', '', 0, '1565536603'),
(29, 'Asperiores consequatur omnis quia aliquid iste.', 'In ut maiores reprehenderit.', 'all', 'corrupti', '', 1, '1565709403'),
(30, 'Quia consequatur voluptas.', 'Voluptatum quae facere nulla id magni quis delectus a soluta saepe.', 'students', 'nisi', '', 1, '1565191003'),
(31, 'Vero sit iusto.', 'Aut et quia odit fuga possimus qui commodi ex voluptatem quis.', 'all', 'distinctio', '', 1, '1565363803'),
(32, 'Id in ab.', 'Est eum quia ut eligendi eos vitae blanditiis quia.', 'all', 'veritatis', '', 0, '1564413403'),
(33, 'Repellat ullam ut consequuntur.', 'Beatae et inventore non suscipit eos fugiat nihil.', 'parents', 'excepturi', '', 0, '1564672603'),
(34, 'Molestiae suscipit dolor quia ipsum.', 'Quam doloremque doloremque accusantium maxime est quod et tempora veniam minus repellendus id velit.', 'teacher', 'consequuntur', '', 0, '1565104603'),
(35, 'Ea consequatur iusto.', 'Eos voluptatum cumque consequatur.', 'all', 'laboriosam', '', 0, '1564586203'),
(36, 'Nobis sit.', 'In adipisci aut odit necessitatibus.', 'students', 'numquam', '', 1, '1564931803'),
(37, 'Incidunt sunt et odit vel recusandae.', 'Non reprehenderit nulla placeat ut eos aut et.', 'all', 'voluptas', '', 0, '1563895003'),
(38, 'Totam quos ducimus.', 'Et saepe doloribus deleniti qui repudiandae porro odit.', 'parents', 'est', '', 0, '1564240603'),
(39, 'Vel in placeat ab.', 'Voluptatum velit non fuga rerum quasi.', 'parents', 'voluptatibus', '', 1, '1564672603'),
(40, 'Eaque ut.', 'Fugit itaque deleniti omnis deserunt eum in.', 'students', 'vitae', '', 0, '1563463003'),
(41, 'Magni debitis quia.', 'Earum tempora aut sed qui itaque minima repudiandae sint qui deserunt nobis quis harum exercitationem.', 'parents', 'est', '', 1, '1565623003'),
(42, 'Ut laboriosam illum.', 'Sint voluptatem laborum veritatis aut delectus ducimus culpa architecto.', 'students', 'cum', '', 0, '1565623003'),
(43, 'Incidunt omnis reprehenderit.', 'Impedit molestiae quidem ut accusantium officia.', 'all', 'harum', '', 1, '1563635803'),
(44, 'Inventore quod recusandae culpa.', 'Ut et deleniti sed non architecto possimus et est vel vel quos delectus laudantium recusandae corporis.', 'students', 'molestiae', '', 1, '1564240603'),
(45, 'Et tenetur id hic repudiandae.', 'Voluptatem omnis velit quia.', 'students', 'ratione', '', 0, '1564931803'),
(46, 'Rerum dolores et.', 'Vitae amet nihil dolor voluptatem similique quo fugit quo.', 'parents', 'sint', '', 0, '1563290203'),
(47, 'Et et non.', 'At dolorem et voluptatum voluptatem.', 'teacher', 'asperiores', '', 1, '1563463003'),
(48, 'Quae quo amet.', 'Qui iusto consequuntur est laboriosam nobis quaerat ea inventore.', 'parents', 'consequatur', '', 0, '1564672603'),
(49, 'In excepturi.', 'Voluptas est officiis impedit quia.', 'all', 'ut', '', 1, '1564327003'),
(50, 'Ex est consequuntur voluptatem.', 'Et quo quam est maiores.', 'teacher', 'placeat', '', 1, '1563290203');

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
(1, 'Non quidem sit.', '', '', '1564499830', 1564067830, 0, '[\"9\",\"3\",\"1\"]', '[\"3\",\"11\"]', '', 8, 33),
(2, 'Dolore dolor.', '', '', '1564499830', 1565623030, 0, '[\"5\"]', '[\"27\",\"29\"]', '', 1, 31),
(3, 'Quia eos.', '', '', '1564499830', 1563463030, 0, '[\"4\",\"8\"]', '[\"9\"]', '', 1, 42),
(4, 'In.', '', '', '1564499830', 1564759030, 0, '[\"10\",\"2\",\"4\"]', '[\"30\",\"4\"]', '', 4, 36),
(5, 'Officiis blanditiis.', '', '', '1564499830', 1563203830, 0, '[\"1\",\"9\",\"5\"]', '[\"24\"]', '', 9, 42),
(6, 'Esse.', '', '', '1564499830', 1563808630, 0, '[\"4\",\"10\",\"2\"]', '[\"24\"]', '', 2, 26),
(7, 'Repudiandae eos.', '', '', '1564499830', 1563203830, 0, '[\"9\",\"7\"]', '[\"18\",\"12\",\"17\"]', '', 2, 29),
(8, 'Laborum.', '', '', '1564499830', 1565536630, 0, '[\"1\",\"7\",\"8\"]', '[\"7\",\"5\"]', '', 7, 25),
(9, 'Aperiam officiis.', '', '', '1564499830', 1563722230, 0, '[\"3\"]', '[\"21\",\"18\",\"15\"]', '', 10, 34),
(10, 'Qui.', '', '', '1564499830', 1564759030, 0, '[\"8\",\"4\"]', '[\"27\"]', '', 2, 30),
(11, 'Assumenda.', '', '', '1564499830', 1565191030, 0, '[\"3\",\"8\",\"5\"]', '[\"23\",\"26\",\"10\"]', '', 10, 30),
(12, 'Perferendis repellat.', '', '', '1564499830', 1565363830, 0, '[\"10\",\"2\",\"9\"]', '[\"3\",\"24\"]', '', 1, 29),
(13, 'Illo laboriosam.', '', '', '1564499830', 1565104630, 0, '[\"1\",\"5\",\"10\"]', '[\"23\"]', '', 10, 25),
(14, 'Officia maxime.', '', '', '1564499830', 1564327030, 0, '[\"3\",\"2\",\"5\"]', '[\"13\",\"20\",\"30\"]', '', 10, 37),
(15, 'Nostrum eos.', '', '', '1564499830', 1565104630, 0, '[\"7\",\"1\"]', '[\"28\",\"3\",\"12\"]', '', 4, 32);

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
(1, 'English', '0', '{\"TrackBus\":\"Track Bus\",\"dashboard\":\"Dashboard\",\"usercode\":\"User Code\",\"classes\":\"Classes\",\"students\":\"Students\",\"teachers\":\"Teachers\",\"newmessages\":\"New Messages\",\"student\":\"Student\",\"teacher\":\"Teacher\",\"leaderboard\":\"Leader Board\",\"NewsEvents\":\"News & Events\",\"quicklinks\":\"Quick links\",\"AccountSettings\":\"Account Settings\",\"ChgProfileData\":\"Change profile data\",\"FullName\":\"Full name\",\"Gender\":\"Gender\",\"Birthday\":\"Birthday\",\"mobileNo\":\"Mobile No\",\"editProfile\":\"Edit profile\",\"reemail\":\"Retype Email address\",\"oldPassword\":\"Old password\",\"editPassword\":\"Edit password\",\"newPassword\":\"New password\",\"editMailAddress\":\"Edit e-mail address\",\"chgEmailAddress\":\"Change e-mail address\",\"Photo\":\"Photo\",\"Address\":\"Address\",\"Male\":\"Male\",\"Female\":\"Female\",\"phoneNo\":\"Phone No\",\"defLang\":\"Default language\",\"email\":\"Email address\",\"chgPassword\":\"Change password\",\"renewPassword\":\"Retype New password\",\"adminTasks\":\"Administrative tasks\",\"ClassSchedule\":\"TimeTable\",\"Assignments\":\"Assignments\",\"booksLibrary\":\"Books library\",\"Attendance\":\"Attendance\",\"Onlineexams\":\"Online exams\",\"media\":\"Media\",\"Payments\":\"Payments\",\"Return\":\"Return\",\"Transport\":\"Transport\",\"Polls\":\"Polls\",\"votes\":\"View Votes\",\"Calendar\":\"Calendar\",\"Search\":\"Search\",\"username\":\"Username\",\"name\":\"Name\",\"ID\":\"ID\",\"Operations\":\"Operations\",\"cancelAdd\":\"Cancel add\",\"Calender\":\"Calendar\",\"Status\":\"Status\",\"toggleDropdown\":\"Toggle Dropdown\",\"from\":\"From\",\"Export\":\"Export\",\"ExportCSV\":\"Export to CSV\",\"ImportCSV\":\"Import from CSV\",\"details\":\"Details\",\"Active\":\"Active\",\"specifyFileToImport\":\"Please specify file to upload\",\"Inactive\":\"Inactive\",\"saveSettings\":\"Save Settings\",\"available\":\"Available\",\"Import\":\"Import\",\"ExportExcel\":\"Export to Excel\",\"to\":\"To\",\"for\":\"For\",\"all\":\"All\",\"Calenderlist\":\"Calendar list\",\"cancelEdit\":\"Cancel Edit\",\"Edit\":\"Edit\",\"Remove\":\"Remove\",\"Download\":\"Download\",\"Date\":\"Date\",\"Print\":\"Print\",\"Comments\":\"Comments\",\"Extras\":\"Extras\",\"ExportPDF\":\"Export to PDF\",\"ImportExcel\":\"Import from Excel\",\"unavailable\":\"Unavailable\",\"Description\":\"Description\",\"dataImported\":\"Data imported successfully\",\"registerAcc\":\"Registeration\",\"chkMailRestore\":\"Please check your e-mail for restore link\",\"expRestoreId\":\"Expired resore id ( > 24h ), please make new password resore request\",\"mustTypePwd\":\"You must type password\",\"usernameUsed\":\"Username already used, use another one\",\"mailUsed\":\"E-mail address already used, check it or restore password\",\"mustTypeFullName\":\"You must type full name\",\"invRstoreId\":\"Invalid URL or restore id, please make new password resore request\",\"chkInputFields\":\"Please check the input fields\",\"chkUserPass\":\"Please check your username & password\",\"chkUserMail\":\"Please check your username\",\"pwdChangedSuccess\":\"Password changed successfully, press login to continue\",\"mustSelAccType\":\"You must select account type\",\"mustSelUsername\":\"You must type username\",\"invEmailAdd\":\"Invalid e-mail address\",\"notRepStCode\":\"is not represent student code\",\"Address2\":\"Address 2\",\"oldPwdDontMatch\":\"Old password don\'t match stored one\",\"mailAlreadyUsed\":\"E-mail address already used, check it or restore password\",\"allowLanguage\":\"Allow users change languages\",\"sysMail\":\"System E-mail\",\"setZero\":\"Set to 0 for none\",\"subBased\":\"Subject Based\",\"None\":\"None\",\"sendStudentsAbsendVia\":\"Send student\'s absence via\",\"schoolTerms\":\"Privacy Policy\",\"generalSettings\":\"General Settings\",\"allowed\":\"Allowed\",\"paymentMail\":\"Paypal payment E-mail\",\"footer\":\"Footer Copyrights\",\"classBased\":\"Class only\",\"sendExamDet\":\"Send exam details to\",\"activatedModules\":\"Activated Modules\",\"siteTitle\":\"Site title\",\"notAllowed\":\"Not allowed\",\"payTax\":\"Payment Tax\",\"attendanceModel\":\"Attendance model\",\"examNotif\":\"Exam details notifications\",\"studentsParents\":\"Students & Parents\",\"editSettings\":\"Edit settings\",\"Administrators\":\"Administrators\",\"listAdministrators\":\"List administrators\",\"password\":\"Password\",\"adminUpdated\":\"Admin updated successfully\",\"usernameAlreadyUsed\":\"Username already used, use another one\",\"adminFullName\":\"Admin full name\",\"addAdministrator\":\"Add admininstrator\",\"editAdministrator\":\"Edit admininstrator\",\"emailAlreadyUsed\":\"E-mail address already used, check it or restore password\",\"AssignmentTitle\":\"Assignment title\",\"noAssignments\":\"No assignments\",\"assignmentCreated\":\"Assignment created successfully\",\"AddAssignments\":\"Add assignment\",\"AssignmentDescription\":\"Assignment Description\",\"AssignmentFile\":\"Assignment File\",\"assignmentModified\":\"Assignment modified successfully\",\"listAssignments\":\"List Assignments\",\"AssignmentDeadline\":\"Assignment Deadline\",\"editAssignment\":\"Edit Assignment\",\"selectAttendance\":\"Select attendance info to add\",\"Present\":\"Present\",\"LateExecuse\":\"Late with excuse\",\"attendanceStats\":\"Attendance Statistics\",\"attendanceFilters\":\"Search for attendance ( Select filters )\",\"absentReport\":\"Student absence report\",\"controlAttendance\":\"Control attendance\",\"Absent\":\"Absent\",\"earlyDismissal\":\"Early Dismissal\",\"attendancePerDay\":\"Attendance per day\",\"attendanceSearch\":\"Search attendance\",\"studentName\":\"Student Name\",\"Late\":\"Late\",\"saveAttendance\":\"Save attendance\",\"attendanceToday\":\"Attendance today\",\"attendanceSaved\":\"Attecndance saved successfully\",\"class\":\"Class\",\"addClass\":\"Add class\",\"classTeacher\":\"Class teacher\",\"className\":\"Class name\",\"listClasses\":\"List classes\",\"classDorm\":\"Class dormitory\",\"classSch\":\"Classes Schedule\",\"editClassSch\":\"Edit Class Schedule\",\"endTime\":\"End Time\",\"Sunday\":\"Sunday\",\"Wednesday\":\"Wednesday\",\"Saturday\":\"Saturday\",\"NoClasses\":\"No classes\",\"classEditSch\":\"Select class to edit schedule\",\"Day\":\"Day\",\"addSch\":\"Add Schedule\",\"Monday\":\"Monday\",\"Thurusday\":\"Thursday\",\"classCreated\":\"Class created successfully\",\"editClass\":\"Edit Class\",\"ReadSchedule\":\"Read schedule\",\"startTime\":\"Start Time\",\"editSch\":\"Edit Schedule\",\"Tuesday\":\"Tuesday\",\"Friday\":\"Friday\",\"classUpdated\":\"Class updated successfully\",\"Dormitories\":\"Dormitories\",\"DormName\":\"Dormitory Name\",\"addDorm\":\"Add Dormitory\",\"dormUpdated\":\"Dormitory updated successfully\",\"addDormitories\":\"Add dormitory\",\"DormDesc\":\"Dormitory Description\",\"editDorm\":\"Edit Dormitory\",\"listDormitories\":\"List dormitories\",\"noDorm\":\"No dormitories\",\"dormCreated\":\"Dormitory created successfully\",\"listNews\":\"List news\",\"newsContent\":\"News content\",\"listEvents\":\"List events\",\"noEvents\":\"No events\",\"eventPlace\":\"Event Place\",\"eventModified\":\"Event modified successfully\",\"newsCreated\":\"News created successfully\",\"editEvent\":\"Edit event\",\"addEvent\":\"Add event\",\"eventNamePlace\":\"Event Name \\/ Place\",\"noNews\":\"No news\",\"addNews\":\"Add News\",\"newsboard\":\"News Board\",\"events\":\"Events\",\"newsTitle\":\"News title\",\"editNews\":\"Edit News\",\"eventDescription\":\"Event Description\",\"eventTitle\":\"Event Title\",\"eventCreated\":\"Event created successfully\",\"newsModified\":\"News modified successfully\",\"examsList\":\"Exams List\",\"examName\":\"Exam Name\",\"mark\":\"Mark\",\"selClassSubExam\":\"Select class & subject for exam\",\"attendanceMakrs\":\"Attendance Marks\",\"gradeLevels\":\"Grade levels\",\"gradeName\":\"Grade Name\",\"noGrades\":\"No grades\",\"editGrade\":\"Edit grade\",\"onlineExams\":\"Online Exams\",\"examDeadline\":\"Exam Deadline\",\"gradeCreated\":\"Grade created successfully\",\"gradeFrom\":\"Grade From\",\"gradeDesc\":\"Grade Description\",\"addLevel\":\"Add Grade level\",\"examMarks\":\"Exam Marks\",\"addMarks\":\"Add marks\",\"sendExamMarks\":\"Send marks notifications\",\"examDesc\":\"Exam Description\",\"addExam\":\"Add exam\",\"listExams\":\"List exams\",\"showMarks\":\"Show marks\",\"noExams\":\"No exams\",\"controlMarksExam\":\"Control marks for Exam\",\"addUpdateMarks\":\"Add\\/Update Marks\",\"listMarks\":\"List grades\",\"gradePoint\":\"Grade Point\",\"gradeTo\":\"Grade To\",\"gradeUpdated\":\"Grade updated successfully\",\"takeExam\":\"Take exam\",\"showExamGradesAfter\":\"Show grade after finish exams\",\"Answers\":\"Answers\",\"infoBox\":\"Info Box\",\"Grade\":\"Grade\",\"examModified\":\"Exam modified successfully\",\"examNotSent\":\"Notifications sent successfully\",\"examCreated\":\"Exam created successfully\",\"examDetailsNot\":\"Exam details notifications\",\"AveragePoints\":\"Average Points\",\"editExam\":\"Edit Exam\",\"trueAns\":\"True Answer\",\"Questions\":\"Questions\",\"Question\":\"Question\",\"addQuestion\":\"Add question\",\"submitAnswers\":\"Submit answers\",\"adjustExamNot\":\"Please adjust exam notifications first from General settings\",\"Languages\":\"Languages\",\"noLanguage\":\"No languages\",\"languagePhrases\":\"Language phrases\",\"langModified\":\"Language updated successfully\",\"editLanguage\":\"Edit Language\",\"addLanguage\":\"Add language\",\"listLanguage\":\"List languages\",\"languageName\":\"Language Name\",\"langCreated\":\"Language created successfully\",\"Library\":\"Library\",\"bookTitle\":\"Book title\",\"noBooks\":\"No books\",\"bookType\":\"Book Type\",\"bookPrice\":\"Book Price\",\"editBook\":\"Edit book\",\"bookAdded\":\"Book added successfully\",\"uploadBook\":\"Upload book\",\"traditionalBook\":\"Traditional Book\",\"addBook\":\"Add book\",\"bookAuthor\":\"Book Author\",\"listBooks\":\"List Books\",\"bookPriceState\":\"Book Price \\/ State\",\"bookDescription\":\"Book Description\",\"electronicBook\":\"Electronic Book\",\"State\":\"State\",\"bookModified\":\"Book modified successfully\",\"mailsms\":\"Mail \\/ SMS\",\"mailsmsSettings\":\"Mail\\/SMS Settings\",\"sendAs\":\"Send as\",\"mailSMSSend\":\"Send Mail \\/ SMS\",\"Sender\":\"Sender\",\"smsProvider\":\"SMS Provider\",\"mailsmsTemplates\":\"Mail \\/ SMS Templates\",\"noTemplates\":\"No templates\",\"mailTemplate\":\"Mail template\",\"smsTemplate\":\"SMS template\",\"editTemplate\":\"Edit template\",\"listTemplates\":\"List templates\",\"mailSettings\":\"Mail Settings\",\"noMessages\":\"No messages\",\"listMessages\":\"List Messages\",\"messageTitle\":\"Message Title\",\"selUsers\":\"Select users\",\"sms\":\"SMS\",\"listSentMessages\":\"List of sent messages\",\"typeUsers\":\"Type of users\",\"messageContent\":\"Message Content\",\"typeDate\":\"Type \\/ Date\",\"smsSettings\":\"SMS Settings\",\"mailDeliverType\":\"Mail Delivery Type\",\"templateTitle\":\"Template title\",\"templateVars\":\"Template variables\",\"templateUpdated\":\"Template updated successfully\",\"mediaCenter\":\"Media Center\",\"addAlbum\":\"Add album\",\"noMediaInAlbum\":\"No media exist in this album\",\"albumImage\":\"Album image\",\"mediaTitle\":\"Media title\",\"editMedia\":\"Edit media\",\"mediaCreated\":\"Media created successfully\",\"mediaModified\":\"Media modified successfully\",\"albumCreated\":\"Album created successfully\",\"mediaDesc\":\"Media description\",\"editAlbum\":\"Edit album\",\"albumTitle\":\"Album title\",\"albums\":\"Albums\",\"goUp\":\"Go to up\",\"uploadMedia\":\"Upload media\",\"albumDesc\":\"Album description\",\"addMedia\":\"Add media\",\"mediaImage\":\"Media image\",\"albumModified\":\"Album modified successfully\",\"Messages\":\"Messages\",\"composeMessage\":\"Compose Message\",\"typeReply\":\"Type reply ( press enter to submit ) ...\",\"message\":\"Message\",\"messageNotExist\":\"The message you try to reach not exist\",\"userisntExist\":\"User isn\'t exist\",\"sendMessage\":\"Send Message\",\"markRead\":\"Mark as read\",\"markUnread\":\"Mark as unread\",\"loadOldMessages\":\"Load old messages\",\"sendMessageTo\":\"Send message to (username)\",\"readMessage\":\"Read Message\",\"paymentTitleDate\":\"Payment Title \\/ Date\",\"paid\":\"PAID\",\"noPayments\":\"No payments\",\"editPayment\":\"Edit payment\",\"AmountDue\":\"Amount Due\",\"paymentCreated\":\"Payments created successfully\",\"noPaymentDetails\":\"No Payment Details exist\",\"paymentModified\":\"Payments modified successfully\",\"Total\":\"Total\",\"Product\":\"Particulars\",\"paymentTitle\":\"Payment Title\",\"unpaid\":\"UNPAID\",\"paymentDesc\":\"Payment Description\",\"addPayment\":\"Add payment\",\"listPayments\":\"List payments\",\"Amount\":\"Amount\",\"viewInvoice\":\"View invoice\",\"paymentSelectMultiple\":\"Selecting multiple students will generate seperate invoice for each one\",\"Subtotal\":\"Subtotal\",\"listPaymentDetail\":\"List payment details\",\"paymentDetails\":\"Payment details\",\"pollTitle\":\"Poll title\",\"noPolls\":\"No Polls\",\"editPoll\":\"Edit poll\",\"pollCreated\":\"Poll created successfully\",\"pollUpdated\":\"Poll updated successfully\",\"activatePoll\":\"Activate Poll\",\"votePoll\":\"Vote poll\",\"pollOptions\":\"Poll Options\",\"pollTarget\":\"Poll target\",\"addPoll\":\"Add poll\",\"listPolls\":\"List polls\",\"pollStatus\":\"Poll status\",\"newOption\":\"New Option\",\"alreadyvoted\":\"You already voted before\",\"pollActivated\":\"Poll activated successfully\",\"staticPages\":\"Static pages\",\"listPages\":\"List pages\",\"editPage\":\"Edit page\",\"pageModified\":\"Page modified successfully\",\"controlPages\":\"Control Pages\",\"pageTitle\":\"Page title\",\"activeInactivePage\":\"Active \\/ Inactive page\",\"pageChanged\":\"Page changed successfully\",\"addPage\":\"Add page\",\"pageContent\":\"Page content\",\"pageCreated\":\"Page created successfully\",\"Subjects\":\"Subjects\",\"subjectName\":\"Subject name\",\"subjectCreated\":\"Subject created successfully\",\"Subject\":\"Subject\",\"noSubjects\":\"No subjects\",\"subjectEdited\":\"Subject edited successfully\",\"addSubject\":\"Add subject\",\"editSubject\":\"Edit Subject\",\"Transportation\":\"Stoppage\",\"transportTitle\":\"Transport title\",\"Fare\":\"Fare\",\"editTransport\":\"Edit Transport\",\"transportCreated\":\"Stoppage created successfully\",\"addTransport\":\"Add transport\",\"transportDesc\":\"Transport Description\",\"listSubs\":\"List subscribers\",\"Contact\":\"Contact\",\"transportUpdated\":\"Stoppage updated successfully\",\"listTransport\":\"List Stoppage\",\"driverContact\":\"Driver Contact\",\"noTransportation\":\"No Stoppage\",\"noMatches\":\"No matches\",\"parents\":\"Parents\",\"role\":\"Role\",\"listTeachers\":\"List teachers\",\"EditTeacher\":\"Edit Teacher\",\"rollid\":\"Roll id\",\"listParents\":\"List parents\",\"studentDetails\":\"Student Details\",\"parent\":\"Parent\",\"addTeacher\":\"Add teacher\",\"noTeachers\":\"No teachers\",\"fileToImport\":\"File to import\",\"Marksheet\":\"Marksheet\",\"editStudent\":\"Edit student\",\"noParents\":\"No parents\",\"Relation\":\"Relation\",\"editParent\":\"Edit Parent\",\"Profession\":\"Profession\",\"AddParent\":\"Add parent\",\"noStudents\":\"No students\",\"addStudent\":\"Add student\",\"Approve\":\"Approve\",\"waitingApproval\":\"Waiting approval\",\"csvParentInvalid\":\"This file not represent CSV parents file\",\"Profile\":\"Profile\",\"teacherInfo\":\"Teacher Information\",\"studentHaveNoMarks\":\"Student has no marks till now\",\"teacherCreated\":\"Teacher created successfully\",\"teacherUpdated\":\"Teacher updated successfully\",\"studentModified\":\"Student modified successfully\",\"csvStudentInvalid\":\"This file not represent CSV student file\",\"parentInfo\":\"Parent Information\",\"parentCreated\":\"Parent created successfully\",\"csvTeacherInvalid\":\"This file not represent CSV teacher file\",\"studentCreatedSuccess\":\"Student created successfully\",\"studentInfo\":\"Student Information\",\"parentModified\":\"Parent modified successfully\",\"listStudents\":\"List students\",\"latestVersion\":\"Latest Version\",\"logout\":\"Logout\",\"registerNewAccount\":\"Register a new membership\",\"restorePwd\":\"Restore Password\",\"userNameOrEmail\":\"Username\",\"rememberMe\":\"Remember me\",\"youfindStId\":\"You\'ll find Student code in your student dashboard main page, it look like:\",\"parntStudentIdSep\":\"Parent\'s Students ids - seperate with ,\",\"thankReg\":\"Thank you for register, please contact school for activating your account with id\",\"signIn\":\"Sign in\",\"resetPwdNow\":\"Reset password now\",\"printPage\":\"Print this page\",\"loginToAccount\":\"Login to your account\",\"theme\":\"Theme\",\"blue\":\"Blue\",\"black\":\"Black\",\"idNumber\":\"ID Number\",\"position\":\"ltr\",\"direction\":\"Direction\",\"rtl\":\"Right to left\",\"ltr\":\"Left to right\",\"Promotion\":\"Promotion\",\"studentsPromotedClass\":\"Students will promoted to class\",\"promoteStudents\":\"Promote students\",\"studentsToBPronoted\":\"Students to be promoted\",\"chgAcademicYears\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 \\u0627\\u0644\\u0633\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0631\\u0627\\u0633\\u064a\\u0629\",\"chgYear\":\"Change Year\",\"teacherLeaderboard\":\"Teacher\'s leaderboard\",\"searchUsers\":\"Search users\",\"studentLeaderboard\":\"Student\'s leaderboard\",\"thanks\":\"Thanks\",\"sureRemove\":\"Sure remove this item?\",\"mailReMailDontMatch\":\"E-mail & Re-Email don\'t match\",\"passRepassDontMatch\":\"Password & Re-Password don\'t match\",\"profileUpdated\":\"Profile updated successfully\",\"blueLight\":\"blue-light\",\"green\":\"green\",\"purpleLight\":\"purple-light\",\"mailSmsSettings\":\"Mail \\/ SMS Settings\",\"schoolTitle\":\"School Title\",\"yellow\":\"yellow\",\"greenLight\":\"green-light\",\"red\":\"red\",\"globalSettings\":\"Global Settings\",\"vacationSettings\":\"Vacation Settings\",\"customText\":\"Custom Text\",\"LogoImage\":\"Image ( Upload logo to path : assets\\/img\\/logo.png - Best Size : 200 x 40 px )\",\"Logo\":\"Logo\",\"paymentsSettings\":\"Payments Settings\",\"redLight\":\"red-light\",\"purple\":\"purple\",\"yellowLight\":\"yellow-light\",\"exclude\":\"Don\'t include\",\"Include\":\"Include\",\"includeAttendace\":\"Include attendance in marksheet grades\",\"allowChangeTheme\":\"Allow users to change theme\",\"currencyCode\":\"Currency Code ( 3 Phrases like USD )\",\"paypalSupported\":\"Supported codes for paypal are :\",\"numberOfDaysStVacation\":\"Number of days for student vacation per Academic Year\",\"studentVacationDays\":\"Students\'s vacation days \\/ Academic Year\",\"currencySymbol\":\"Currency Symbol (like $)\",\"teacherVacationDays\":\"Teacher\'s vacation days \\/ Academic Year\",\"numberOfDaysTeacherVacation\":\"Number of days for teacher vacation per Academic Year\",\"weeksDaysOff\":\"Week Days off\",\"nationalVacDays\":\"National Vacation days\",\"settSaved\":\"Settings saved successfully\",\"newDateVacation\":\"Select the new date for vacation\",\"delAdministrator\":\"Delete admininstrator\",\"adminDeletedSucc\":\"Administrator deleted successfully\",\"adminNotExist\":\"Administrator isn\'t exist\",\"viewAnswers\":\"View answers\",\"answerFile\":\"Answer File\",\"delAssignment\":\"Delete assignment\",\"applyAssAnswer\":\"Apply assignment answer\",\"assUploadedSucc\":\"Answer uploaded successfully\",\"assNoFilesUploaded\":\"No files uploaded !\",\"assAlreadySub\":\"You already applied answer to this assignment before\",\"assignemntNotExist\":\"Assignment isn\'t exist\",\"timeApplied\":\"Time applied\",\"userNotes\":\"User Notes\",\"uploadAnswer\":\"Upload answer to assignment\",\"assignemntDel\":\"Assignment deleted successfully\",\"assDeadTime\":\"Assignment deadtime reached, you cannot submit\",\"staffAttendance\":\"Staff Attendance\",\"associatedSubjects\":\"Associated subjects\",\"classNotExist\":\"Class isn\'t exist\",\"delSch\":\"Delete schedule\",\"schDeleted\":\"Schedule deleted successfully\",\"schModSucc\":\"Schedule Modified successfully\",\"delClass\":\"Delete class\",\"classDeleted\":\"Class deleted successfully\",\"schCreaSucc\":\"Schedule Created successfully\",\"schNotExist\":\"Schedule isn\'t exist\",\"dormNotExist\":\"Dormitory isn\'t exist\",\"delEvent\":\"Delete event\",\"delNews\":\"Delete news\",\"newsDeleted\":\"News deleted successfully\",\"eventDeleted\":\"Event deleted successfully\",\"eventNotEist\":\"Event isn\'t exist\",\"newsNotEist\":\"News isn\'t exist\",\"questionType\":\"Question Type\",\"oneOption\":\"Select one option\",\"sureMarks\":\"Are you sure that all subject\'s marks added successfully?\",\"textValue\":\"Enter text value\",\"multipleOption\":\"Select Multiple options\",\"examTitleUndefined\":\"Exam Title undefined\",\"examTimedOut\":\"Sorry, timeout. Exam Finished\",\"examYourGrade\":\"Your grade is :\",\"exDeleted\":\"Exam deleted successfully\",\"gradeDeleted\":\"Grade deleted successfully\",\"delGradeLevel\":\"Delete grade level\",\"gradeNotExist\":\"Grade isn\'t exist\",\"exNotExist\":\"Exam isn\'t exist\",\"examSubmitionSaved\":\"Your submittion saved, thank you.\",\"delExam\":\"Delete exam\",\"exAlreadyTook\":\"You already took this exam before\",\"delLanguage\":\"Delete language\",\"languageDel\":\"Language deleted successfully\",\"languageNotExist\":\"Language isn\'t exist\",\"delLibrary\":\"Delete library item\",\"itemNotExist\":\"Item isn\'t exist\",\"itemdel\":\"Item deleted successfully\",\"specificUsers\":\"Specific users\",\"mailSentSuccessfully\":\"Message sent successfully\",\"mediaType\":\"Media Type\",\"removeAlbum\":\"Sure remove this album, all enclosed images will be deleted?\",\"albumNotExist\":\"Album isn\'t exist\",\"mediaNotExist\":\"Media isn\'t exist\",\"mediaDel\":\"Media deleted successfully\",\"albumDel\":\"Album deleted successfully\",\"url\":\"URL\",\"image\":\"Image\",\"delAlbum\":\"Delete album\",\"delMedia\":\"Delete media\",\"typeNameUserMail\":\"Type Name \\/ username\",\"select\":\"Select\",\"messIsUnread\":\"Messages changed to unread successfully\",\"messIsRead\":\"Messages changed to read successfully\",\"messDel\":\"Messages deleted successfully\",\"delMess\":\"Delete messages\",\"chgMessage\":\"Change messages\",\"selectStudents\":\"Select students\",\"delPayment\":\"Delete payment\",\"paymentNotExist\":\"Payment isn\'t exist\",\"paymentDel\":\"Payment deleted successfully\",\"voteMustSelect\":\"You must select item to vote.\",\"pollDel\":\"Poll deleted successfully\",\"delPoll\":\"Delete poll\",\"totalVotes\":\"Total votes\",\"voteOptionTitle\":\"Please enter option title\",\"pollNotExist\":\"Poll isn\'t exist\",\"delPage\":\"Delete page\",\"pageDel\":\"Page deleted successfully\",\"delNotExist\":\"Page isn\'t exist\",\"subjectNotExist\":\"Subject isn\'t exist\",\"delSubject\":\"Delete Subject\",\"subjectDel\":\"Subject deleted successfully\",\"transDel\":\"Stoppage deleted successfully\",\"transNotExist\":\"Stoppage isn\'t exist\",\"delTrans\":\"Delete stoppage\",\"linkStudentParent\":\"Link student to parent\",\"leaderBoardMessage\":\"Please enter leaderboard message\",\"delParent\":\"Delete parent\",\"approveStudent\":\"Approve student\",\"delStudent\":\"Delete student\",\"stdLeaderBoard\":\"Student leaderboard\",\"stdNotLeader\":\"Student isn\'t leaderboard\",\"delTeacher\":\"Delete teacher\",\"teacLeaderBoard\":\"Teacher leaderboard\",\"teachNotLeader\":\"Teacher isn\'t leaderboard\",\"teacLeaderDel\":\"Teacher\'s leaderboard deleted successfully\",\"teacherNotExist\":\"Teacher isn\'t exist\",\"stdLeaderRem\":\"Student\'s leaderboard removed successfully\",\"stdNotExist\":\"Student isn\'t exist\",\"parentNotExist\":\"Parent isn\'t exist\",\"teacherApproved\":\"Teacher approved successfully\",\"relationShipEnter\":\"Please enter your relation to student\",\"minCharLength3\":\"Min character length is 3\",\"approveTeacher\":\"Approve teacher\",\"parentDel\":\"Parent deleted successfully\",\"stdApproved\":\"Student approved successfully\",\"stdDeleted\":\"Student deleted successfully\",\"stdNowLeaderBoard\":\"Student is now leaderboard\",\"teacherDel\":\"Teacher deleted successfully\",\"teacIsLeader\":\"Teacher is now leaderboard\",\"newAcYear\":\"New Academic Year\",\"newClass\":\"New Class\",\"fromAcYear\":\"From Academic Year\",\"Vacation\":\"Vacation\",\"confirmVacation\":\"Confirm vacation\",\"acceptedVacation\":\"Accepted Vacation\",\"delVacation\":\"Delete Vacation\",\"vacDel\":\"Vacation deleted successfully\",\"rejectedVacation\":\"Rejected Vacation\",\"notes\":\"Notes\",\"selectVacationDates\":\"Select vacation dates\",\"getVacation\":\"Get Vacation\",\"publicHoliday\":\"Public Holiday\",\"vacSubmitted\":\"Vacation request submitted successfully\",\"vacNotExist\":\"Vacation isn\'t exist\",\"studyMaterial\":\"Study Material\",\"materialTitle\":\"Material Title\",\"materialFile\":\"Material file\",\"materialDel\":\"Material deleted successfully\",\"materialEdited\":\"Material modified successfully\",\"materialNotExist\":\"Material isn\'t exist\",\"editMaterial\":\"Edit Material\",\"materialDesc\":\"Material Description\",\"addMaterial\":\"Add Material\",\"listStudyMaterial\":\"List Study Material\",\"noMaterialData\":\"No Material data\",\"delMaterial\":\"Delete Material\",\"materialAdded\":\"Material added successfully\",\"Reports\":\"Reports\",\"paymentsReports\":\"Payments Reports\",\"user\":\"User\",\"totalUsers\":\"Total Users\",\"academicyears\":\"Academic Years\",\"yearTitle\":\"Year Title\",\"defAcademicYears\":\"Default academic year\",\"delAcademicYears\":\"Delete academic year\",\"acYearNotExist\":\"Academic year isn\'t exist\",\"acYearNowDef\":\"Academic year is now default one\",\"acYearAddSuc\":\"Academic year created successfully\",\"cannotDelDefAcademicYears\":\"Cannot delete default academic year\",\"markAsDefAcademicYears\":\"Mark as default academic year\",\"yearStatus\":\"Year Status\",\"addAcademicyear\":\"Add academic year\",\"vacationList\":\"Vacation List\",\"activeUsers\":\"Active Users\",\"studentVacation\":\"Students Vacation\",\"UsersStats\":\"Users Statistics\",\"studentAttendance\":\"Students Attendance\",\"teacherVacation\":\"Teachers Vacation\",\"inactiveUsers\":\"Inactive Users\",\"getPaymentReports\":\"Get payments reports\",\"listAcademicyear\":\"List academic years\",\"noAcademicYears\":\"No academic years available\",\"editAcademicYears\":\"Edit academic year\",\"acYearDelSuc\":\"Academic year deleted successfully\",\"acYearModSuc\":\"Academic year modified successfully\",\"delDorm\":\"Delete Dormitory\",\"dormDeleted\":\"Dormitory deleted successfully\",\"failedImport\":\"Failed to import\",\"readyImport\":\"Ready to import\",\"reviseImportData\":\"Please revise data errors\",\"noDataImport\":\"No data to import\",\"noMarksheetAv\":\"No Marksheet data available\",\"blackLight\":\"Black-light\",\"HostelManage\":\"Hostel Management\",\"Hostel\":\"Hostel\",\"HostelCat\":\"Hostel Categories\",\"AddHostel\":\"Add Hostel\",\"ListHostel\":\"List Hostel\",\"HostelTitle\":\"Hostel Title\",\"Hosteltype\":\"Hostel Type\",\"Manager\":\"Manager\",\"EditHostel\":\"Edit hostel\",\"Boys\":\"Boys\",\"Girls\":\"Girls\",\"Mixed\":\"Mixed\",\"Notes\":\"Notes\",\"noHostel\":\"No hostel available\",\"delHostel\":\"Delete Hostel\",\"hostelDeleted\":\"Hostel deleted successfully\",\"hostelNotExist\":\"Hostel not exist\",\"HostelCreated\":\"Hostel created successfully\",\"HostelModified\":\"Hostel modified successfully\",\"delHostelCat\":\"Delete hostel category\",\"hostelCatDeleted\":\"Hostel category deleted successfully\",\"HostelCatNotExist\":\"Hostel category not exist\",\"addHostelCat\":\"Add hostel category\",\"HostelCatCreated\":\"Category created successfully\",\"editHostelCat\":\"Edit hostel category\",\"hostelCatModified\":\"Category modified successfully\",\"listHostelCat\":\"List Hostel categories\",\"catTitle\":\"Category Title\",\"fees\":\"Fees\",\"sections\":\"sections\",\"addSection\":\"Add section\",\"listSections\":\"List sections\",\"sectionTitle\":\"Section Title\",\"section\":\"Section name\",\"editSection\":\"Edit section\",\"delSection\":\"Delete section\",\"sectionAdded\":\"Section added successfully\",\"sectionUpdated\":\"Section updated successfully\",\"sectionDeleted\":\"Section deleted successfully\",\"sectionNotExist\":\"Section not exist\",\"allowedExamMin\":\"Allowed exam time in miuntes (0 for unlimited)\",\"examDegreeSuccess\":\"Exam degree of success\",\"questionMark\":\"Question mark\",\"emptyOneMark\":\"Empty mark will caluculated as 1 mark\",\"accounting\":\"Accounting\",\"FeeTypes\":\"Fee Types\",\"addFeeType\":\"Add fee type\",\"listFeeType\":\"List fee types\",\"FeeType\":\"Fee Type\",\"feeDefaultAmount\":\"Default amount\",\"noFeeTypesAv\":\"No fee types available\",\"feeTypeTitle\":\"Fee type title\",\"editFeeType\":\"Edit fee type\",\"delFeeType\":\"Delete fee type\",\"feeAdded\":\"Fee added successfully\",\"feeUpdated\":\"Fee updated successfully\",\"feeNotExist\":\"Fee type not exist\",\"feeDeleted\":\"Fee type deleted successfully\",\"FeeAllocation\":\"Fee Allocation\",\"listFeeAllocation\":\"List fee allocation\",\"addFeeAllocation\":\"Add fee allocation\",\"noFeeAllocAv\":\"No fee allocation available\",\"classesFeeAllocation\":\"Classes fee allocation\",\"studentsFeeAllocation\":\"Students fee allocation\",\"allocationType\":\"Allocation type\",\"feeDetails\":\"Fee details\",\"value\":\"Value\",\"editFeeAllocation\":\"Edit fee allocation\",\"feeAllocationAdded\":\"Fee allocation added successfully\",\"feeAllocationUpdated\":\"Fee allocation updated successfully\",\"delFeeAllocation\":\"Delete fee allocation\",\"feeAllocationDeleted\":\"Fee allocation deleted successfully\",\"feeAllocationNotExist\":\"Fee allocation not exist\",\"selStudentAlreadyHasAllFee\":\"Selected class already has allocated fee\",\"alreadyHasAllFee\":\"already has allocated fee\",\"Expenses\":\"Expenses\",\"addExpense\":\"Add Expense\",\"expenseTitle\":\"Expense title\",\"expenseAmount\":\"Expense amount\",\"ExpenseDate\":\"Expense date\",\"editExpense\":\"Edit expense\",\"expenseUpdated\":\"Expense updated successfully\",\"expenseAdded\":\"Expense added successfully\",\"delExpense\":\"Delete expense\",\"expenseDeleted\":\"Expense deleted successfully\",\"expenseNotExist\":\"Expense not exist\",\"passGrade\":\"Pass grade\",\"finalGrade\":\"Final grade\",\"marksheetGen\":\"Marksheet Generation\",\"fullPerm\":\"Full Permissions\",\"customPerm\":\"Custom Permissions\",\"noAdministrators\":\"No Administrators\",\"Permissions\":\"Permissions\",\"enableSections\":\"Enable Sections\",\"allowPublicReg\":\"Allow public registeration\",\"dateFormat\":\"Date Format\",\"studentMail\":\"Studnet\'s E-mail\",\"Mandatory\":\"Mandatory\",\"notMandatory\":\"Not Mandatory\",\"autoInvoiceGen\":\"Automatic invoice generation\",\"autoInvoiceGenCreateApprove\":\"Automatically generate invoice when student created \\/ approved\",\"autoInvoiceGenPromote\":\"Automatically generate invoice when student promoted\",\"noAttendance\":\"No attendance available to show\",\"noHostelCat\":\"No categories available\",\"mobileNotifications\":\"Mobile Notifications\",\"sendNewNotification\":\"Send new notification\",\"newMessageFrom\":\"New Message From\",\"notifyIsLedaerBoard\":\"Congratulations! You\'re in the leaderboard\",\"newAssigmentAdded\":\"New Assignemnt added\",\"newOnlineExamAdded\":\"New Online exam added\",\"newPaymentNotif\":\"New payment pending your action\",\"totalMarks\":\"Total Marks\",\"allowTeaSendMailSms\":\"Allow teachers send mail\\/sms\",\"Image\":\"Image\",\"viewImage\":\"View Image\",\"chgImage\":\"Change Image\",\"uplImage\":\"Upload Image\",\"noQuestAnswer\":\"No questions answered yet\",\"falseAns\":\"False Answer\",\"markShFields\":\"Marksheet Fields\",\"addColumn\":\"Add Column\",\"Reccuring\":\"Reccuring\",\"cycleEver\":\"Cycle every\",\"day\":\"Day\",\"month\":\"Month\",\"year\":\"Year\",\"nextCycle\":\"Next Cycle\",\"medHistory\":\"Medical History\",\"toggleView\":\"Toggle View\",\"medInfo\":\"Medical Info\",\"height\":\"Height\",\"Weight\":\"Weight\",\"RH\":\"Diet\",\"insPolicy\":\"Insurance Policy\",\"vacCard\":\"Vaccination card\",\"preMedMed\":\"Premedication Medicine\",\"prefclinic\":\"Preferred Clinic\",\"disType\":\"Disability Type\",\"contactInfo\":\"Contact Information\",\"Allergies\":\"Allergies\",\"Medications\":\"Medications\",\"Immunization\":\"Immunization\",\"Fractures\":\"Fractures\",\"Surgery\":\"Surgery\",\"Remarks\":\"Remarks\",\"saveMed\":\"Save Medical Information\",\"promotionType\":\"Promote Type\",\"promote2AcYear\":\"Promote to another academic year\",\"graduate\":\"Graduate\",\"graduateBelow\":\"The below students will be marked as graduated students\",\"Diet\":\"Diet\",\"inCaseEmerg\":\"In case of emergencies\",\"specMedInfo\":\"Specific Medical Information\",\"listGradStd\":\"List Graduate Students\",\"seeMoreTodayDates\":\"See more today dates\",\"today\":\"Today\",\"tomorrow\":\"Tomorrow\",\"advSearch\":\"Advanced Search\",\"examSchedule\":\"Exam Schedule\",\"endDate\":\"End Date\",\"next\":\"Next\",\"previous\":\"Previous\",\"Communication\":\"Communication\",\"mail\":\"Mail\",\"phone\":\"Phone\",\"Invoices\":\"Invoices\",\"dueInvoices\":\"Due Invoices\",\"title\":\"Title\",\"time\":\"Time\",\"ppaid\":\"PARTIALLY PAID\",\"dueDate\":\"Due Date\",\"servicePanel\":\"Service Panel\",\"lightSidebar\":\"With Light sidebar\",\"darkSidebar\":\"With Dark sidebar\",\"InvTitle\":\"Invoice Title\",\"paidAmount\":\"Paid Amount\",\"dateDueDate\":\"Date \\/ Due Date\",\"showDueInvOnly\":\"Show Due Invoices Only\",\"myInvoices\":\"My Invoices\",\"chgAcademicyears\":\"Change Academic Year\",\"InvID\":\"Invoice ID\",\"pay\":\"Pay\",\"payVia\":\"Pay via\",\"totalAmount\":\"Total Amount\",\"pendingAmount\":\"Pending Amount\",\"addTemplate\":\"Add template\",\"templateAdded\":\"Template added successfully\",\"delTemplate\":\"Delete template\",\"templateNotExist\":\"Template not exist\",\"templateDeleted\":\"Template deleted successfully\",\"History\":\"History\",\"loadFromTemplate\":\"Load from template\",\"plzSelMessType\":\"Please select Message type first\",\"messQueued\":\"Message queued for sending successfully\",\"Load\":\"Load\",\"Category\":\"Category\",\"expCategory\":\"Expenses Categories\",\"addExpCat\":\"Add expenses category\",\"lstExpCat\":\"List expenses categories\",\"catDesc\":\"Category description\",\"editExpCat\":\"Edit expense group\",\"CategoryAdded\":\"Category added successfully\",\"CategoryUpdated\":\"Category updated successfully\",\"delExpenseCat\":\"Delete expenses category\",\"CategoryDeleted\":\"Category deleted successfully\",\"CategoryNotExist\":\"Category not exist\",\"feeCode\":\"Fee Code\",\"feeDescription\":\"Fee Description\",\"feeAmount\":\"Fee Amount\",\"feeSchedule\":\"Fee Schedule\",\"feeScheduleOneTime\":\"One Time ( Fixed date )\",\"feeScheduleAnnually\":\"Annually\",\"feeScheduleBiAnnually\":\"Bi-Annually\",\"feeScheduleTriAnnually\":\"Tri-Annually\",\"feeScheduleQuarterly\":\"Quarterly\",\"feeScheduleMonthly\":\"Monthly\",\"feeScheduleGenerateInvoice\":\"Generate invoices on the below dates\",\"feeScheduleFixedDate\":\"Fixed Date\",\"feeScheduleFirstDate\":\"First Date\",\"feeScheduleSecondDate\":\"Second Date\",\"feeScheduleThirdDate\":\"Third Date\",\"feeScheduleFourthDate\":\"Fourth Date\",\"feeScheduleFifthDate\":\"Fifth Date\",\"feeScheduleSixthDate\":\"Sixth Date\",\"feeScheduleSeventhDate\":\"Seventh Date\",\"feeScheduleEighthDate\":\"Eighth Date\",\"feeScheduleNinthDate\":\"Ninth Date\",\"feeScheduleTenthDate\":\"Tenth Date\",\"feeScheduleEleventhDate\":\"Eleventh Date\",\"feeScheduleTwelvethDate\":\"Twelveth Date\",\"feeTitle\":\"Fee Title\",\"allocatedTo\":\"Allocated to\",\"allStudents\":\"All students\",\"specStudents\":\"Specific students\",\"feeAllocDetails\":\"Fee Allocation details\",\"FeeGroups\":\"Fee Groups\",\"FeeGroup\":\"Fee Group\",\"addFeeGroup\":\"Add fee group\",\"listFeeGroups\":\"List fee groups\",\"noGroups\":\"No groups available\",\"groupTitle\":\"Group title\",\"groupDesc\":\"Group Description\",\"invPrefix\":\"Invoice Prefix\",\"editFeeGroup\":\"Edit fee group\",\"delFeeGroup\":\"Delete fee group\",\"feeGroupDeleted\":\"Fee group deleted successfully\",\"feeGroupNotExist\":\"Fee group not exist\",\"feeGroupAdded\":\"Fee group added successfully\",\"feeGroupUpdated\":\"Fee group updated successfully\",\"addInvoice\":\"Add invoice\",\"listInvoices\":\"List Invoices\",\"invDetails\":\"Invoice details\",\"invNewRow\":\"Add new invoice row\",\"noInvRows\":\"No invoice rows available\",\"payMethod\":\"Payment Method\",\"payDate\":\"Paid Date\",\"invDueDate\":\"Invoice is Due Date\",\"collInvoice\":\"Collect Invoice\",\"payRevert\":\"Revert\",\"collAmount\":\"Collection Amount\",\"collDate\":\"Collection Date\",\"mobileSettings\":\"Mobile application\",\"lookFeel\":\"Look & Feel\",\"Timezone\":\"Timezone\",\"googleID\":\"Google Analytics Tracking ID\",\"enabled\":\"Enabled\",\"disabled\":\"Disabled\",\"loginPageStyle\":\"Login Page Style\",\"righStyle\":\"Right Style\",\"centerStyle\":\"Center Style\",\"forgetPageStyle\":\"Forget password Page Style\",\"registerPageStyle\":\"Registeration Page Style\",\"authPageBG\":\"Authentication pages background Image\",\"authPageBGColor\":\"Authentication pages background color\",\"leftMnuSlimScroll\":\"Left Menu Slim Scrollbar\",\"upcomingToday\":\"Upcoming Today\",\"noDatesToday\":\"No dates today\",\"tapToTryAgain\":\"Tap to try again\",\"loadingError\":\"Loading Error\",\"loading\":\"Loading\",\"noEntry\":\"No Entry\",\"clickToPickDate\":\"Click To Pick Date\",\"pleaseWait\":\"Please Wait\",\"ok\":\"Ok\",\"cancel\":\"Cancel\",\"errorOccurred\":\"Error Occurred\",\"updatesSaved\":\"Updates Saved\",\"tryAgain\":\"Try Again\",\"downloading\":\"Downloading\",\"fileDownloaded\":\"File Downloaded\",\"accountants\":\"Accountants\",\"addAccountant\":\"Add Accountant\",\"editAccountant\":\"Edit Accountant\",\"delAccountant\":\"Delete Accountant\",\"accountantCreated\":\"Accountant created successfully\",\"accountantDelSucc\":\"Accountant deleted successfully\",\"noAccountant\":\"No Accountants\",\"accountantNotExist\":\"Accountant not exist\",\"listAccountant\":\"List Accountant\",\"accountantUpdated\":\"Accountant updated successfully\",\"expensesReports\":\"Expenses Reports\",\"stdAppliedOn\":\"Student applied the answer on\",\"stdNotApplied\":\"Student not applied the answer yet\",\"noDataAvailable\":\"No Data Available\",\"Homework\":\"Homework\",\"addHomework\":\"Add Homework\",\"editHomework\":\"Edit Homework\",\"lstHomework\":\"List Homeworks\",\"HomeworkTitle\":\"Homework Title\",\"SubmissionDate\":\"Submission Date\",\"EvaluationDate\":\"Evaluation Date\",\"View\":\"View\",\"noHomeworks\":\"No Homeworks available\",\"Attachment\":\"Attachment\",\"noFilesAv\":\"No Files available\",\"HomeworkDesc\":\"Homework Description\",\"applied\":\"Applied\",\"notApplied\":\"Not yet Applied\",\"delHomework\":\"Delete Homework\",\"HomeworkDeleted\":\"Homework deleted successfully\",\"HomeworknotExist\":\"Homework not exist\",\"HomeworkCreated\":\"homework created successfully\",\"HomeworkModified\":\"Homework modified successfully\",\"bioId\":\"Biometric ID\",\"visibleCMS\":\"Visible in CMS\",\"toggleCMS\":\"Toggle CMS Status\",\"update\":\"Update\",\"usrInformation\":\"User information\",\"is\":\"is\",\"Upload\":\"Upload\",\"fLibrary\":\"Files Library\",\"selDrop\":\"Click to select files or drop here\",\"loadMore\":\"Load More\",\"selUpload\":\"Select \\/ Upload\",\"dbExport\":\"DB Export\",\"bioItegration\":\"Biometric Integration\",\"Marsala\":\"Marsala\",\"Pink\":\"Pink\",\"Violet\":\"Violet\",\"Cyan\":\"Cyan\",\"exportDB\":\"Export\",\"importDB\":\"Import\",\"exportClick\":\"Click here to export Database\",\"importClick\":\"To import, Please use PHPMyAdmin to ensure maximum data consistency.\",\"attNNotif\":\"Attenndance for student\",\"yrAttIs\":\"Your attendance is\",\"newExamNotif\":\"New exam schedule added\",\"allowedVars\":\"Allowed to use variables\",\"feeAllocWhenFrst\":\"When the first invoices generates ?\",\"Now\":\"Now\",\"arFeeTypeDates\":\"At the fee type dates\",\"discoutedAmount\":\"Discounted Amount\",\"FeeDiscount\":\"Fee Discount\",\"delFeeDiscount\":\"Delete Fee discount\",\"FeeDiscountDeleted\":\"Fee discount Deleted\",\"FeeDiscountNotExist\":\"Fee discount not exist\",\"addFeeDiscount\":\"Add fee discount\",\"FeeDiscountAdded\":\"Fee discount added successfully\",\"editFeeDiscount\":\"Edit fee discount\",\"feeDiscountMod\":\"Fee discount modified successfully\",\"discTypVal\":\"Type\\/Value\",\"assignUser\":\"Assign to users\",\"discTitle\":\"List fee discount\",\"discCode\":\"Discount Code\",\"discDesc\":\"Discount Description\",\"discType\":\"Discount Type\",\"percent\":\"Percentage\",\"fixed\":\"Fixed Value\",\"codeStatus\":\"Code Status\",\"discAssign\":\"Discount Assignments\",\"addDiscAssign\":\"Add discount assignment\",\"type\":\"Type\",\"Information\":\"Information\",\"noDiscAssignAv\":\"No discount assignments available\",\"applyTo\":\"Apply to\",\"selInvoices\":\"Select Invoice\",\"typeInvSearch\":\"Type invoice title, ID, description\",\"typeStdSearch\":\"Type student name \\/ username\",\"Discount\":\"Discount\",\"Incomes\":\"Incomes\",\"incomeTitle\":\"Income Title\",\"incomeAmount\":\"Income Amount\",\"addIncome\":\"Add Income\",\"editIncome\":\"Edit Income\",\"incomeCategory\":\"Incomes Categories\",\"addIncCat\":\"Add income category\",\"editIncCat\":\"Edit income category\",\"lstIncCat\":\"List income categories\",\"delIncCat\":\"Delete income category\",\"incCatDeleted\":\"Income category deleted\",\"incCatNotexist\":\"Income category not exist\",\"Payroll\":\"Payroll\",\"makePayment\":\"Make Payment\",\"userSalary\":\"Users Salary\",\"salaryBase\":\"Salary Base\",\"hourSalary\":\"Hourly Base\",\"makeUsrPayment\":\"Make user payment\",\"salaryProfExist\":\"Salary profile exist\",\"usrNoSalary\":\"User has no salary profile defined\",\"paymentMadeSuccess\":\"User payment made successfully\",\"salaryDetails\":\"Salary Details\",\"salaryForDate\":\"Salary For date\",\"method\":\"Method\",\"netSalary\":\"Net Salary\",\"grossSalary\":\"Gross Salary\",\"overtime\":\"Overtime\",\"overtimeHours\":\"Overtime Hours\",\"rate\":\"Rate\",\"summary\":\"Summary\",\"hours\":\"Hours\",\"addSalaryBase\":\"Add Salary Base\",\"lstSalaryBase\":\"List Salary Base\",\"baseTitle\":\"Base Title\",\"hourRate\":\"Hour Rate\",\"basicSalary\":\"Basic Salary\",\"overtimeSalary\":\"Hourly overtime cost\",\"allowences\":\"Allowences\",\"addRow\":\"Add new row\",\"slryBsCreated\":\"Salary Base created\",\"editSalaryBase\":\"Edit Salary Base\",\"slryBsMod\":\"Salary base modified\",\"delBase\":\"Delete Base\",\"salaryBaseDeleted\":\"Salary base deleted\",\"salaryBaseNotExist\":\"Salary base not exist\",\"editUsrSalary\":\"Edit User Salary\",\"usrSalaryModf\":\"User Salary modified\",\"usrBaseSelec\":\"User\'s Base Salary Selection\",\"usrSelect\":\"Select User to set base\",\"slryType\":\"Salary Type\",\"monthly\":\"Monthly\",\"hourly\":\"Hourly\",\"slryMakePay\":\"Make salary payment\",\"slryPayHistory\":\"Payment History\",\"Cash\":\"Cash\",\"Cheque\":\"Cheque\",\"bnkTrn\":\"Bank transfer\",\"frontendCMS\":\"frontend CMS\",\"ctrlPages\":\"Control Pages\",\"CMSSettings\":\"frontend CMS Settings\",\"socialLinks\":\"Social Links\",\"enableCMS\":\"Enable CMS\",\"defTheme\":\"Default Theme\",\"cmsActineTemp\":\"CMS Active Template\",\"leftCopyrights\":\"Left Copyrights\",\"rightCopyrights\":\"Right Copyrights\",\"frontendCMSpages\":\"frontend CMS pages\",\"permalink\":\"Permalink\",\"Visibility\":\"Visibility\",\"change\":\"Change\",\"sliderImages\":\"Slider Images\",\"imageTitle\":\"Image Title\",\"imageDescription\":\"Image Description\",\"selSlidImg\":\"Select\\/Channge Slider Images\",\"pageProp\":\"Page Properties\",\"Public\":\"Public\",\"loggedUsers\":\"Logged In Users Only\",\"navbarVisibility\":\"Navbar Visibility\",\"Visible\":\"Visible\",\"Invisible\":\"Invisible\",\"Publish\":\"Publish\",\"specificDate\":\"Specific Date\",\"Template\":\"Template\",\"saveDraft\":\"Save as draft\",\"previewPage\":\"Preview page\",\"publishPage\":\"Publish Page\",\"featImage\":\"Featured Image\",\"selFeatImage\":\"Select\\/Change Featured Image\",\"permalinkCantUsed\":\"Permalink cannot used, It\'s already used or reserved\",\"permalinkValid\":\"Permalink is valid\",\"fillField\":\"Please fill in all required fields\",\"validateMail\":\"Please validate you e-mail address\",\"messSent\":\"You message sent to the administrator and we\'ll get in touch soon.\",\"userPosition\":\"User Position\",\"toggleStatus\":\"Toggle Account Status\",\"accStatusChged\":\"Account State changed successfully\",\"accStatusCantYourself\":\"You cannot change yourself status\",\"materialNotif\":\"New study material added\",\"payrollReports\":\"Payroll Payments\",\"incomeReports\":\"Income Payments\",\"bioUsers\":\"Biometric Users\",\"homeworkNotif\":\"New homework assigned to you\",\"signUp\":\"Sign Up\",\"cntctForm\":\"Contact Form\",\"firstName\":\"First Name\",\"lastName\":\"Last Name\",\"mailSubject\":\"E-mail Subject\",\"mailMessage\":\"E-mail Message\",\"cmsSendMessage\":\"Send Message\",\"logToMgmtSys\":\"Login to management system from here\",\"readDetails\":\"Continue reading\",\"prev\":\"Previous\",\"Immediately\":\"Immediately\",\"listFeeDiscount\":\"List fee discount\",\"roles\":\"Permission Roles\",\"add_role\":\"Add Role\",\"role_added\":\"Role added successfully\",\"modify_role\":\"Modify Role\",\"role_modified\":\"Role modified successfully\",\"delete_role\":\"Delete Role\",\"role_deleted\":\"Role deleted successfully\",\"role_notexist\":\"Role not exist\",\"role_title\":\"Role Title\",\"role_desc\":\"Role Description\",\"role_perm\":\"Roles Permissions\",\"role_default\":\"Default Permission for\",\"delIncome\":\"Delete Income\",\"incAdded\":\"Income added successully\",\"incModified\":\"Income modified successully\",\"incDeleted\":\"Income deleted successfully\",\"incNotExist\":\"Income not exist\",\"delUsrPayment\":\"Delate user payment\",\"usrPayDeleted\":\"User payment deleted\",\"usrPayNotExist\":\"User payment not exist\",\"stats\":\"Statistics\",\"list\":\"List\",\"wel_office_cat\":\"Office Categories\",\"add_cat\":\"Add Category\",\"cat_added\":\"Category added\",\"edit_cat\":\"Edit Category\",\"cat_modified\":\"Category Modified\",\"del_cat\":\"Delete Category\",\"cat_deleted\":\"Category deleted\",\"cat_not_exist\":\"Category not exist\",\"wel_office\":\"Welcome Office\",\"vis_purp\":\"Visit Purpose\",\"pho_purp\":\"Phone Purpose\",\"av_for\":\"Available for\",\"typeUsrSearch\":\"Type user name \\/ username\",\"visitors\":\"Visitors\",\"add_vis\":\"Add Visitor\",\"vis_added\":\"Visitor Added\",\"edit_vis\":\"Edit Visitor\",\"vis_mod\":\"Visitor Modified\",\"del_vis\":\"Delete visitor\",\"vis_deleted\":\"Visitor Deleted\",\"vis_not_exist\":\"Visitor Not Exist\",\"pass_id\":\"Pass ID\",\"id_pass\":\"ID\\/Passport #\",\"no_pers\":\"# of persons\",\"company\":\"Company\",\"usr_typ\":\"User Type\",\"comp_name\":\"Company Name\",\"to_meet\":\"To Meet\",\"purpose\":\"Purpose\",\"chkin\":\"Check In\",\"chkout\":\"Check Out\",\"docs\":\"Documents\",\"list_vis\":\"List Visitors\",\"visitor\":\"Visitor\",\"viewFile\":\"View current file\",\"orUpNew\":\"Or upload new\",\"phn_calls\":\"Phone Calls\",\"list_calls\":\"List phone calls\",\"add_call\":\"Add phone call\",\"call_add\":\"Call added successfully\",\"edit_call\":\"Edit Call\",\"call_edit\":\"Call modified successfully\",\"del_call\":\"Delete Call\",\"call_del\":\"Call removed successfully\",\"call_not_exst\":\"Call not exist\",\"incoming\":\"Incoming\",\"outgoing\":\"Outgoing\",\"nxt_fup\":\"Next Follow up\",\"call_dur\":\"Call duration\",\"call_det\":\"Call details\",\"call_type\":\"Call Type\",\"postal\":\"Postal\",\"list_postal\":\"List postal\",\"add_postal\":\"Add postal\",\"postal_added\":\"Postal added\",\"edit_postal\":\"Edit postal\",\"postal_edit\":\"Postal modified successfully\",\"del_postal\":\"Delete Postal\",\"postal_del\":\"Postal deleted successfully\",\"postal_not_exist\":\"Postal not exist\",\"dispatch\":\"Dispatch\",\"recieve\":\"Recieve\",\"refno\":\"Reference Number\",\"con_mess\":\"Contact Messages\",\"list_mess\":\"List visitor messages\",\"del_mess\":\"Delete Message\",\"mess_del\":\"Message deleted\",\"mess_not_exist\":\"Message not exist\",\"mail_subj\":\"Mail Subject\",\"trans_vehicles\":\"Transport vehicles\",\"list_vehicles\":\"List Vehicles\",\"add_vehicle\":\"Add Vehicle\",\"vehicle_add\":\"Vehicle added successfully\",\"edit_vehicle\":\"Edit Vehicle\",\"vehicle_edit\":\"Vehicle modified successfully\",\"del_vehicle\":\"Delete vehicle\",\"vehicle_del\":\"Vehicle deleted\",\"vehicle_not_exist\":\"Vehicle not exist\",\"plate_numb\":\"Plate Number\",\"vehicle_color\":\"Vehicle Color\",\"vehicle_model\":\"Vehicle Model\",\"driver_name\":\"Driver Name\",\"driver_photo\":\"Driver Photo\",\"driver_license\":\"Driver License\",\"transportRoutes\":\"Transport Routes\",\"members\":\"Members\",\"managerPhoto\":\"Manager Photo\",\"managerContact\":\"Manager Contact\",\"employees\":\"Employees\",\"addEmployee\":\"Add Employee\",\"editEmployee\":\"Edit Employee\",\"listEmployee\":\"List Employee\",\"noEmployee\":\"No Accountants\",\"delEmployee\":\"Delete Employee\",\"employeeNotExist\":\"Employee not exist\",\"employeeDelSucc\":\"Employee deleted successfully\",\"employeeCreated\":\"Employee created successfully\",\"employeeUpdated\":\"Employee updated successfully\",\"depart\":\"Departments\",\"list_depart\":\"List Departments\",\"add_depart\":\"Add Departmnet\",\"depart_add\":\"Department added successfully\",\"edit_depart\":\"Edit Department\",\"depart_edit\":\"Department modified successfully\",\"del_depart\":\"Delete department\",\"depart_del\":\"Department deleted\",\"depart_not_exist\":\"Department not exist\",\"depart_title\":\"Department Title\",\"depart_desc\":\"Department description\",\"desig\":\"Designations\",\"list_desig\":\"List Designations\",\"add_desig\":\"Add Designations\",\"desig_add\":\"Designations added successfully\",\"edit_desig\":\"Edit Designations\",\"desig_edit\":\"Designations modified successfully\",\"del_desig\":\"Delete designation\",\"desig_del\":\"Designation deleted successfully\",\"desig_not_exist\":\"Designation not exist\",\"desig_title\":\"Designation title\",\"desig_desc\":\"Designation description\",\"takeAttendance\":\"Take Attendance\",\"attReport\":\"Attendance Report\",\"reportClassif\":\"Report classification\",\"percentage\":\"Percentage\",\"enquiries\":\"Enquiries\",\"list_enq\":\"List Enquiries\",\"add_enq\":\"Add Enquiry\",\"enq_add\":\"Enquiry added successfully\",\"edit_enq\":\"Edit Enquiry\",\"enq_edit\":\"Enquiry modified successfully\",\"del_enq\":\"Delete Enquiry\",\"enq_del\":\"Enquiry deleted successfully\",\"enq_not_exist\":\"Enquiry not exist\",\"enq_title\":\"Enquiry Title\",\"enq_desc\":\"Enquiry Description\",\"enq_type\":\"Enquiry Type\",\"enq_source\":\"Enquiry Source\",\"complaints\":\"Complaints\",\"list_complaint\":\"List Complaints\",\"add_complaint\":\"Add Complaint\",\"complaint_add\":\"Complaint added successfully\",\"edit_complaint\":\"Edit Complaint\",\"complaint_edit\":\"Complaint modified successfully\",\"del_complaint\":\"Delete Complaint\",\"complaint_del\":\"Complaint deleted successfully\",\"complaint_not_exist\":\"Complaint not exist\",\"complaint_title\":\"Complaint Title\",\"comp_desc\":\"Complaint Description\",\"comp_type\":\"Complaint Type\",\"comp_source\":\"Complaint Source\",\"inv_cat\":\"Inventory Categories\",\"list_inv_cat\":\"List inventory categories\",\"inventory\":\"Inventory\",\"suppliers\":\"Suppliers\",\"list_supp\":\"List Suppliers\",\"add_supp\":\"Add Supplier\",\"supp_add\":\"Supplier added successfully\",\"edit_supp\":\"Edit Supplier\",\"supp_edit\":\"Supplier modified successfully\",\"del_supp\":\"Delete Supplier\",\"supp_del\":\"Supplier removed successfully\",\"supp_not_exist\":\"Supplier not exist\",\"supp_name\":\"Supplier name\",\"supp_phone\":\"Supplier Phone\",\"supp_mail\":\"Supplier E-mail\",\"supp_address\":\"Supplier Address\",\"cont_per_name\":\"Contact Person Name\",\"cont_per_phone\":\"Contact Person Phone\",\"cont_per_mail\":\"Contact Person E-mail\",\"conPerson\":\"Contact Person\",\"stores\":\"Stores\",\"list_stores\":\"List stores\",\"add_store\":\"Add store\",\"store_add\":\"Store added successfully\",\"edit_store\":\"Edit store\",\"store_edit\":\"Store modified successfully\",\"del_store\":\"Delete store\",\"store_del\":\"Store deleted successfully\",\"store_not_exist\":\"Store not exist\",\"store_title\":\"Store Title\",\"items_code\":\"Item Coding\",\"list_items\":\"List Items\",\"add_item\":\"Add item\",\"item_add\":\"Item added successfully\",\"edit_item\":\"Edit Item\",\"del_item\":\"Delete item\",\"item_del\":\"Item deleted successfully\",\"item_not_exist\":\"Item not exist\",\"item_title\":\"Item title\",\"item_code\":\"Item Code\",\"item_pn\":\"Item Part Number\",\"items_stock\":\"Items Stock\",\"item\":\"Item\",\"store\":\"Store\",\"supplier\":\"Supplier\",\"quantity\":\"Quantity\",\"iss_ret\":\"Issue\\/Return\",\"issue_item\":\"Issue Item\",\"item_issued\":\"Item issued successfully\",\"item_edit\":\"Item modified successfully\",\"ret_item\":\"Return Item\",\"issue_to\":\"Issue to\",\"issue_date\":\"Issue date\",\"ret_date\":\"Return Date\",\"avQty\":\"Available Quantity\",\"sureReturn\":\"Sure return this item ?\",\"QuestionsArch\":\"Questions Bank\",\"sharedQues\":\"Shared Question\",\"markForShared\":\"Mark this question as shared will make it usable with other techers to use it in anther exams\",\"addAnswer\":\"Add Answer\",\"plzAddTruAns\":\"Please add true answers\",\"quesAdded\":\"Question added successfully\",\"quesModif\":\"Question modified successfully\",\"delQues\":\"Delete question\",\"quesDeleted\":\"Question deleted successfully\",\"quesNotExist\":\"Question not exist\",\"editQuestion\":\"Edit question\",\"close\":\"Close\",\"issue_book\":\"Issue Book\",\"list_issues\":\"List book issues\",\"add_issue\":\"Create book issue\",\"issue_add\":\"Book issue added successfully\",\"edit_issue\":\"Edit book issue\",\"issue_edit\":\"Issue modified successfully\",\"del_issue\":\"Delete issue\",\"issue_del\":\"Issue deleted successfully\",\"issue_not_exist\":\"Issue not exist\",\"serial_no\":\"Serial Number\",\"issue_id\":\"Issue ID\",\"book_return\":\"Return Book\",\"bookPub\":\"Book Publisher\",\"bookISBN\":\"Book ISBN\",\"bookShelf\":\"Book Shelf\",\"subId\":\"Subscription ID\",\"mngSub\":\"Manage Subscription\",\"chgSub\":\"Change Subscription\",\"subChged\":\"Subscription changed successfully\",\"std_cat\":\"Student Categories\",\"list_std_cat\":\"List students categories\",\"admission\":\"Students Admission\",\"medGroup\":\"Blood Group\",\"bloodGroup\":\"Blood Group\",\"religion\":\"Religion\",\"admNumber\":\"Admission Number\",\"admDate\":\"Admission Date\",\"delFile\":\"Delete File\",\"fileDeleted\":\"File Deleted\",\"fileNotExist\":\"File not exist\",\"File\":\"File\",\"fatheName\":\"Father Name\",\"motherName\":\"Mother Name\",\"fatherMob\":\"Father Mobile\",\"motherMob\":\"Mother Mobile\",\"fatherJob\":\"Father Job\",\"motherJob\":\"Mother Job\",\"fatherNotes\":\"Father Notes\",\"motherNotes\":\"Mother Notes\",\"guardAcc\":\"Guardian accounts\",\"linkGuard\":\"Link Guardians\",\"Documents\":\"Documents\",\"addDocRow\":\"Add another document row\",\"admissionInfo\":\"Admission information\",\"in\":\"In\",\"out\":\"Out\",\"appVacation\":\"Approve vacation\",\"myVacation\":\"My vacations\",\"reqVacation\":\"Request vacation\",\"vacStatChged\":\"Vacation status changed successfully\",\"vacNoBalance\":\"You Don\'t have enough balance for vacation\",\"waitAction\":\"Waiting Action\",\"notChckedIn\":\"Not checked in\",\"myAttendance\":\"My Attendance\",\"celebBirthday\":\"Celebrating birthday\",\"order\":\"Order\",\"randomizeQuestions\":\"Randomize questions\",\"latestNews\":\"Latest News\",\"readMore\":\"Read More\",\"Certificates\":\"Certificates\",\"list_cert\":\"List Certificated\",\"add_cert\":\"Add Certificate\",\"cert_add\":\"Certificate added successfully\",\"edit_cert\":\"Edit certificate\",\"cert_edit\":\"Certificated Modified successfully\",\"del_cert\":\"Delete Certificate\",\"cert_del\":\"Certificate deleted successfully\",\"cert_not_exist\":\"Certificate not exist\",\"cert_name\":\"Certificate Name\",\"head_left\":\"Header Left\",\"head_right\":\"Header Right\",\"head_mid\":\"Header Middle\",\"main_title\":\"Main title\",\"main_content\":\"Main Content\",\"foot_left\":\"Footer Left\",\"foot_right\":\"Footer Right\",\"foot_mid\":\"Footer Middle\",\"cert_img\":\"Certificate Image\",\"gen_cert\":\"Generate Certificate\",\"gpstracking\":\"GPS Tracking\"}', NULL);

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
(1, 'Favian Ledner', 'et', 'Sunt ut sed iure.', '1564499804', 'Gillian Roob'),
(2, 'Mr. Nolan Bode MD', 'nihil', 'Quaerat aliquam praesentium voluptas magnam iste officiis aliquam porro quibusdam.', '1564499804', 'Timmy Jerde'),
(3, 'Blair Grimes', 'numquam', 'Porro dolore cumque asperiores reprehenderit numquam minus.', '1564499804', 'Pietro Koelpin'),
(4, 'Harvey Monahan', 'voluptatem', 'Sed fugit reiciendis perspiciatis dignissimos corporis.', '1564499804', 'Prof. Brandy Schumm'),
(5, 'Mr. Brennon Hermiston IV', 'corporis', 'Qui quis sit nihil magnam molestiae quibusdam enim veritatis dolores.', '1564499804', 'Isadore Okuneva'),
(6, 'Morgan Wunsch', 'sit', 'Consequatur repellendus vitae nesciunt reprehenderit veritatis dolorem reprehenderit nam.', '1564499804', 'Mrs. Gabrielle Durgan I'),
(7, 'Vickie Gottlieb', 'velit', 'Nesciunt est ratione nesciunt nulla sit.', '1564499804', 'Mr. Stan Witting'),
(8, 'Antonette Kling', 'perspiciatis', 'Laboriosam dolores et incidunt veniam culpa soluta.', '1564499804', 'Reilly Wiza'),
(9, 'Cheyenne Torphy', 'perspiciatis', 'Itaque consequatur sit consequatur qui asperiores.', '1564499804', 'Sabina Langosh'),
(10, 'Brandon Zemlak', 'nesciunt', 'Suscipit quis provident tempore velit ut dicta.', '1564499805', 'Prof. Connor Bashirian'),
(11, 'Prof. Giovanni Jacobs PhD', 'nostrum', 'Laborum odit similique sapiente.', '1564499805', 'Michel Kris'),
(12, 'Prof. Nathan Willms', 'illum', 'Consequatur atque quos corrupti velit non.', '1564499805', 'Prof. Wava Gerhold'),
(13, 'Shad Hansen', 'vel', 'Dolorum iste consequatur architecto quia.', '1564499805', 'Patsy Reynolds'),
(14, 'Judd Hammes', 'autem', 'Labore eligendi eos aut ipsum earum.', '1564499805', 'Magnolia Conn'),
(15, 'Kelton Wuckert Sr.', 'dolor', 'Quae est et rem eum doloremque laudantium molestias.', '1564499805', 'Kaden Buckridge MD'),
(16, 'Roslyn Spencer', 'minus', 'Pariatur est officia facere laboriosam rerum.', '1564499805', 'Hubert Schmitt'),
(17, 'Shyanne Emmerich', 'ea', 'Occaecati excepturi in quia dolores veritatis.', '1564499805', 'Lowell Dicki'),
(18, 'Nils Bruen', 'quos', 'Est neque nisi corporis sit.', '1564499805', 'Leanne Sporer DDS'),
(19, 'Treva Morissette', 'voluptas', 'Voluptatum explicabo aut inventore.', '1564499805', 'Miss Priscilla Swift'),
(20, 'Shyann Osinski', 'minus', 'Incidunt eius et id at dolores dolores.', '1564499805', 'Peyton Emmerich'),
(21, 'Garfield Hodkiewicz', 'occaecati', 'A provident totam quae accusamus.', '1564499805', 'Mrs. Kenya Lesch'),
(22, 'Sabina Funk', 'quis', 'Non qui odio alias neque dicta.', '1564499805', 'Mrs. Nettie Doyle'),
(23, 'Amelie White', 'ea', 'Fugiat dolorum officia molestiae non sed.', '1564499805', 'Dan Deckow'),
(24, 'Miss Kaela Reinger', 'eum', 'Temporibus tempora aut provident totam blanditiis sunt ut autem et.', '1564499805', 'Ashton DuBuque'),
(25, 'Prof. Rodrigo Ziemann', 'et', 'Corrupti molestiae recusandae perferendis odio est quo.', '1564499805', 'Mrs. Lindsay Fay V'),
(26, 'Stephen Veum', 'incidunt', 'Velit inventore exercitationem voluptatum adipisci.', '1564499805', 'Jasper Keebler'),
(27, 'Dr. Lenny Bradtke DDS', 'incidunt', 'Necessitatibus animi nemo aperiam velit reprehenderit.', '1564499805', 'Miss Bulah Koss'),
(28, 'Mose Pacocha MD', 'repellendus', 'Numquam excepturi voluptatem id sunt dolor.', '1564499805', 'Zachary Kris IV'),
(29, 'Daisha Breitenberg', 'optio', 'Omnis nam voluptas atque esse ratione nostrum facere.', '1564499805', 'Rupert Heathcote'),
(30, 'Wendy Brekke PhD', 'eligendi', 'Et aut doloremque possimus.', '1564499805', 'Harley Donnelly'),
(31, 'Ramona Parisian', 'corrupti', 'Delectus quis quia rem ex amet aut nobis quae earum.', '1564499805', 'Allie Purdy II'),
(32, 'Norval Hegmann IV', 'ea', 'Dolorem id vel qui ut nobis sequi in excepturi quod.', '1564499805', 'Ms. Reina Fritsch'),
(33, 'Janiya Cole', 'omnis', 'Reprehenderit est fuga veniam velit ut.', '1564499805', 'Prof. Darren Walker'),
(34, 'Miss Margret Ortiz', 'ut', 'A esse reprehenderit quae incidunt velit consequatur.', '1564499805', 'Prof. Drew Effertz IV'),
(35, 'Modesta Goldner', 'rerum', 'Sit sapiente et tempora eveniet et.', '1564499805', 'Prof. Tyrese Konopelski DDS'),
(36, 'Mr. Camryn Ledner DDS', 'unde', 'Quasi corporis animi cumque consequatur.', '1564499805', 'Dr. Kenyon Marks'),
(37, 'Dr. Hunter Raynor DVM', 'quae', 'Natus minima repudiandae et ullam laborum et adipisci facere.', '1564499805', 'Bridget Schoen'),
(38, 'Prof. Nelda Hand Sr.', 'voluptate', 'Dolor molestiae minima velit voluptatem sed earum odit aut aspernatur.', '1564499805', 'Mia Willms DVM'),
(39, 'Millie Nitzsche', 'omnis', 'Et ad totam sunt repellat quia quasi nemo.', '1564499805', 'Aliyah Murray'),
(40, 'Nicholaus Swift', 'eaque', 'Ut sint cupiditate ipsum consequuntur.', '1564499805', 'Jerald Heller'),
(41, 'Mrs. Yasmeen Hagenes DVM', 'cumque', 'Voluptatum dolorem dolorem deserunt quia.', '1564499805', 'Domenica Kozey MD'),
(42, 'Jayne Bergnaum', 'ut', 'Magnam illum ducimus accusamus aspernatur.', '1564499805', 'David Willms'),
(43, 'Lelia Pacocha', 'sed', 'Dolor sunt officiis sint ipsam ratione incidunt.', '1564499805', 'Kenneth Frami V'),
(44, 'Domenick Reinger', 'et', 'Fuga possimus ullam quaerat veritatis voluptas nihil mollitia delectus.', '1564499805', 'Mr. Raul Medhurst'),
(45, 'Sherman O\'Kon', 'necessitatibus', 'Est odit sunt corrupti corrupti et distinctio omnis.', '1564499805', 'Prof. Faustino Blick V'),
(46, 'Candida Nikolaus', 'ex', 'Aperiam odit fugit consequatur voluptatem.', '1564499805', 'Delta Dickinson DVM'),
(47, 'Nasir Renner I', 'commodi', 'Vitae labore qui.', '1564499805', 'Prof. Felton Stanton I'),
(48, 'Rowland Tremblay', 'exercitationem', 'Unde sunt corrupti id.', '1564499805', 'Edwina Schaefer'),
(49, 'Mr. Ricardo O\'Conner', 'dicta', 'Quibusdam similique deserunt praesentium est.', '1564499805', 'Kelley Satterfield'),
(50, 'Dennis Konopelski', 'cupiditate', 'Et sint voluptas omnis dolorem nulla eum.', '1564499805', 'Dr. Estell West');

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
(1, 'Adipisci.', '1564499806', 0, 1, 72, 91, 30),
(2, 'Dolor.', '1564499806', 1, 2, 68, 13, 93),
(3, 'Voluptatem sunt officia.', '1564499806', 1, 3, 96, 78, 88),
(4, 'Cumque aut voluptas.', '1564499806', 1, 4, 77, 5, 34),
(5, 'Enim est ipsa reiciendis.', '1564499806', 0, 5, 42, 58, 45),
(6, 'Voluptas eos aut consequatur alias.', '1564499806', 0, 6, 62, 93, 62),
(7, 'Quis est.', '1564499806', 0, 7, 95, 50, 51),
(8, 'Doloremque dolores animi quia nostrum veritatis.', '1564499806', 0, 8, 77, 60, 63),
(9, 'Tempore et nesciunt consequatur qui similique.', '1564499806', 1, 9, 94, 51, 78),
(10, 'Eos inventore fuga.', '1564499806', 1, 10, 26, 52, 94),
(11, 'Voluptas excepturi et aut.', '1564499806', 1, 11, 73, 16, 63),
(12, 'Ut sed.', '1564499806', 1, 12, 21, 54, 88),
(13, 'Voluptate id impedit at.', '1564499806', 1, 13, 71, 79, 54),
(14, 'Labore odio id distinctio.', '1564499806', 1, 14, 76, 23, 85),
(15, 'Enim commodi.', '1564499806', 0, 15, 43, 6, 20),
(16, 'Explicabo qui sunt.', '1564499806', 0, 16, 80, 43, 17),
(17, 'Iusto ea omnis optio.', '1564499806', 1, 17, 42, 79, 8),
(18, 'Aut doloremque.', '1564499806', 0, 18, 14, 57, 33),
(19, 'Eum quos magni itaque possimus.', '1564499806', 0, 19, 12, 83, 27),
(20, 'Totam.', '1564499806', 1, 20, 68, 45, 33),
(21, 'Sit et.', '1564499806', 1, 21, 2, 40, 70),
(22, 'Et maiores.', '1564499806', 1, 22, 23, 73, 3),
(23, 'Aliquam ea labore odit cum.', '1564499806', 1, 23, 63, 1, 78),
(24, 'Ducimus quae doloremque.', '1564499806', 0, 24, 58, 69, 53),
(25, 'Suscipit aut itaque.', '1564499806', 0, 25, 68, 78, 50),
(26, 'Voluptas qui quia.', '1564499806', 1, 26, 3, 57, 38),
(27, 'Ratione tempore similique.', '1564499806', 1, 27, 94, 76, 9),
(28, 'Consequatur.', '1564499806', 1, 28, 45, 89, 77),
(29, 'Rerum aut et dolorem facilis nisi.', '1564499806', 0, 29, 72, 37, 88),
(30, 'Reprehenderit voluptatibus.', '1564499806', 0, 30, 64, 24, 51),
(31, 'Suscipit rem.', '1564499806', 1, 31, 45, 51, 61),
(32, 'Dicta voluptatem ut.', '1564499806', 1, 32, 90, 33, 33),
(33, 'Dolore.', '1564499806', 1, 33, 81, 54, 14),
(34, 'Neque.', '1564499806', 1, 34, 60, 34, 47),
(35, 'Nulla corrupti accusantium accusantium.', '1564499806', 1, 35, 3, 91, 53),
(36, 'Modi praesentium voluptatem.', '1564499806', 1, 36, 21, 68, 66),
(37, 'Quibusdam ex.', '1564499806', 0, 37, 63, 49, 90),
(38, 'Nobis eos voluptas.', '1564499806', 1, 38, 82, 1, 77),
(39, 'Qui.', '1564499806', 1, 39, 76, 25, 30),
(40, 'Impedit aliquid.', '1564499806', 1, 40, 36, 89, 37),
(41, 'Sit dolor.', '1564499806', 1, 41, 71, 10, 54),
(42, 'Veniam ex.', '1564499806', 1, 42, 84, 72, 38),
(43, 'A explicabo voluptatem est tempora ipsa.', '1564499806', 1, 43, 53, 34, 63),
(44, 'Non eius in.', '1564499806', 1, 44, 17, 2, 85),
(45, 'Deserunt deserunt vitae.', '1564499806', 1, 45, 79, 7, 47),
(46, 'Doloribus fugit dolor.', '1564499806', 0, 46, 86, 68, 63),
(47, 'Sunt animi aliquam.', '1564499806', 0, 47, 6, 69, 17),
(48, 'Pariatur ut.', '1564499806', 1, 48, 65, 29, 67),
(49, 'Cumque sunt.', '1564499806', 1, 49, 73, 81, 5),
(50, 'Modi.', '1564499806', 1, 50, 90, 46, 65),
(51, 'Ratione assumenda.', '1564499806', 0, 51, 2, 32, 24),
(52, 'Cumque.', '1564499806', 0, 52, 61, 14, 10),
(53, 'Dolorem omnis.', '1564499806', 1, 53, 19, 56, 35),
(54, 'Quaerat dolore.', '1564499806', 0, 54, 50, 90, 60),
(55, 'Aut perspiciatis qui.', '1564499806', 0, 55, 30, 89, 82),
(56, 'Molestiae dolor id.', '1564499806', 0, 56, 35, 65, 95),
(57, 'Occaecati voluptas fugit ut eveniet.', '1564499806', 1, 57, 39, 7, 8),
(58, 'Sit iste placeat accusantium.', '1564499806', 0, 58, 75, 38, 4),
(59, 'Mollitia dolor.', '1564499806', 0, 59, 35, 73, 54),
(60, 'Ipsa harum.', '1564499806', 0, 60, 90, 25, 58),
(61, 'Doloribus fugiat eveniet blanditiis.', '1564499806', 1, 61, 93, 67, 88),
(62, 'Illum sed adipisci.', '1564499806', 0, 62, 30, 86, 16),
(63, 'Cumque aut.', '1564499806', 1, 63, 51, 10, 76),
(64, 'Repellendus.', '1564499806', 0, 64, 16, 26, 40),
(65, 'Incidunt repellendus labore quasi qui quaerat.', '1564499806', 1, 65, 77, 45, 33),
(66, 'Facilis.', '1564499806', 0, 66, 7, 38, 2),
(67, 'Quasi corporis.', '1564499806', 1, 67, 63, 44, 51),
(68, 'Nihil commodi quibusdam et.', '1564499806', 0, 68, 83, 11, 15),
(69, 'Molestias atque voluptates cupiditate consequatur.', '1564499806', 1, 69, 89, 29, 34),
(70, 'Mollitia facilis.', '1564499806', 0, 70, 53, 31, 86),
(71, 'Reiciendis nisi.', '1564499806', 1, 71, 81, 13, 79),
(72, 'Temporibus nemo est aut.', '1564499806', 0, 72, 69, 37, 77),
(73, 'Sed.', '1564499806', 0, 73, 64, 94, 87),
(74, 'Minus atque veritatis sit.', '1564499806', 0, 74, 49, 79, 56),
(75, 'Et fugit.', '1564499806', 0, 75, 21, 67, 23),
(76, 'Maxime veniam.', '1564499806', 0, 76, 84, 88, 63),
(77, 'Soluta.', '1564499806', 1, 77, 75, 71, 63),
(78, 'Pariatur est aut est ad.', '1564499806', 0, 78, 81, 18, 64),
(79, 'Repellat aut alias.', '1564499806', 0, 79, 68, 5, 9),
(80, 'Molestiae eum ea.', '1564499806', 1, 80, 64, 82, 70),
(81, 'Voluptas quis reprehenderit quo.', '1564499806', 1, 81, 59, 45, 51),
(82, 'Praesentium alias veniam ducimus perspiciatis non.', '1564499807', 1, 82, 68, 24, 30),
(83, 'Tempore sapiente et.', '1564499807', 0, 83, 12, 37, 28),
(84, 'Tenetur ut.', '1564499807', 0, 84, 92, 46, 62),
(85, 'Esse dicta provident.', '1564499807', 0, 85, 19, 85, 63),
(86, 'Modi rem cumque inventore.', '1564499807', 1, 86, 76, 46, 91),
(87, 'Voluptates.', '1564499807', 0, 87, 32, 12, 35),
(88, 'Deserunt et qui.', '1564499807', 0, 88, 24, 68, 78),
(89, 'Dolores omnis quod voluptas.', '1564499807', 0, 89, 60, 94, 57),
(90, 'Autem laboriosam itaque eveniet.', '1564499807', 1, 90, 82, 70, 23),
(91, 'Molestiae adipisci quia voluptatem ea eius.', '1564499807', 1, 91, 37, 11, 40),
(92, 'Ducimus rerum optio illum sit ex.', '1564499807', 1, 92, 32, 51, 61),
(93, 'Incidunt non.', '1564499807', 1, 93, 62, 19, 73),
(94, 'Nisi est.', '1564499807', 0, 94, 47, 16, 83),
(95, 'Sit est.', '1564499807', 1, 95, 24, 11, 48),
(96, 'Reprehenderit blanditiis adipisci facilis iusto omnis.', '1564499807', 0, 96, 72, 96, 53),
(97, 'Et id alias.', '1564499807', 1, 97, 56, 27, 24),
(98, 'Accusamus.', '1564499807', 0, 98, 33, 69, 22),
(99, 'Atque quae assumenda.', '1564499807', 1, 99, 60, 24, 86),
(100, 'Facere voluptas cum ratione ut.', '1564499807', 1, 100, 60, 64, 49),
(101, 'Enim aut.', '1564499807', 1, 101, 49, 95, 59),
(102, 'Quam quo sequi dolor.', '1564499807', 1, 102, 37, 39, 8),
(103, 'Qui distinctio cum.', '1564499807', 1, 103, 9, 9, 35),
(104, 'Debitis quia saepe architecto enim explicabo.', '1564499807', 1, 104, 64, 78, 91),
(105, 'Atque quo consectetur enim ut.', '1564499807', 0, 105, 38, 18, 22),
(106, 'Quam sapiente omnis.', '1564499807', 0, 106, 29, 13, 65),
(107, 'Non ut.', '1564499807', 1, 107, 12, 54, 14),
(108, 'Ea voluptas.', '1564499807', 0, 108, 4, 56, 78),
(109, 'Animi vitae.', '1564499807', 0, 109, 18, 29, 38),
(110, 'Animi fuga incidunt tempora.', '1564499807', 1, 110, 21, 24, 90),
(111, 'Consequatur porro rerum excepturi delectus.', '1564499807', 1, 111, 47, 46, 86),
(112, 'Rerum consequatur natus.', '1564499807', 1, 112, 60, 28, 21),
(113, 'Vel labore ex consequatur repellendus sint.', '1564499807', 0, 113, 39, 75, 62),
(114, 'Voluptas est.', '1564499807', 0, 114, 31, 52, 31),
(115, 'Atque.', '1564499807', 0, 115, 1, 12, 36),
(116, 'Neque fugiat deleniti.', '1564499807', 0, 116, 65, 72, 42),
(117, 'Quos deleniti esse.', '1564499807', 1, 117, 70, 37, 39),
(118, 'Ullam.', '1564499807', 0, 118, 14, 69, 34),
(119, 'Nam assumenda aut.', '1564499807', 0, 119, 32, 12, 67),
(120, 'Tenetur atque magnam facilis.', '1564499807', 0, 120, 5, 74, 15),
(121, 'Illum soluta sequi officiis iste.', '1564499807', 1, 121, 18, 3, 28),
(122, 'Porro non.', '1564499807', 1, 122, 63, 3, 40),
(123, 'Dolores delectus quo veritatis.', '1564499807', 1, 123, 24, 35, 39),
(124, 'Odit veniam ipsum corporis similique.', '1564499807', 1, 124, 11, 40, 7),
(125, 'Laborum iste.', '1564499807', 0, 125, 33, 44, 1),
(126, 'Animi aut aut tenetur.', '1564499807', 1, 126, 8, 95, 73),
(127, 'Quia sit sit.', '1564499807', 0, 127, 64, 37, 59),
(128, 'Sunt quisquam necessitatibus incidunt.', '1564499807', 1, 128, 15, 43, 1),
(129, 'Sit aliquid consequatur.', '1564499807', 1, 129, 44, 9, 85),
(130, 'Adipisci facilis.', '1564499807', 1, 130, 50, 31, 92),
(131, 'Sequi.', '1564499807', 0, 131, 75, 67, 78),
(132, 'Totam excepturi et numquam.', '1564499807', 0, 132, 83, 67, 85),
(133, 'Et.', '1564499807', 0, 133, 10, 42, 48),
(134, 'Perferendis.', '1564499807', 0, 134, 7, 81, 56),
(135, 'Id qui culpa consequatur eum.', '1564499807', 1, 135, 83, 84, 58),
(136, 'Officia sunt.', '1564499807', 1, 136, 24, 41, 42),
(137, 'Facilis.', '1564499807', 1, 137, 2, 75, 59),
(138, 'Architecto voluptas veniam culpa architecto cumque.', '1564499807', 1, 138, 31, 76, 33),
(139, 'Explicabo enim est.', '1564499807', 0, 139, 77, 82, 40),
(140, 'Quia nisi praesentium sint eos.', '1564499807', 0, 140, 58, 85, 20),
(141, 'Nihil natus eos voluptas.', '1564499807', 1, 141, 23, 83, 22),
(142, 'Iusto aspernatur dicta.', '1564499807', 0, 142, 51, 40, 47),
(143, 'Reprehenderit inventore optio dolorem ipsum porro.', '1564499807', 1, 143, 72, 87, 6),
(144, 'Consequuntur occaecati omnis rem.', '1564499807', 0, 144, 50, 53, 74),
(145, 'Aut accusantium adipisci.', '1564499807', 1, 145, 26, 26, 5),
(146, 'Rerum ut officiis est.', '1564499807', 1, 146, 32, 34, 66),
(147, 'Officiis.', '1564499807', 0, 147, 37, 83, 27),
(148, 'Adipisci voluptas sequi a.', '1564499807', 0, 148, 89, 35, 94),
(149, 'Sed quae.', '1564499807', 1, 149, 70, 12, 79),
(150, 'Reprehenderit non harum rerum.', '1564499807', 1, 150, 59, 29, 82),
(151, 'Nostrum mollitia odit quisquam.', '1564499807', 0, 151, 53, 68, 68),
(152, 'Quae et voluptatem repudiandae.', '1564499807', 1, 152, 63, 82, 48),
(153, 'Sint itaque atque.', '1564499807', 0, 153, 69, 42, 53),
(154, 'Iusto id alias quasi.', '1564499807', 0, 154, 91, 37, 24),
(155, 'Non aut officiis.', '1564499807', 1, 155, 54, 83, 71),
(156, 'Est expedita aut.', '1564499807', 1, 156, 47, 37, 17),
(157, 'Voluptatem.', '1564499807', 1, 157, 16, 89, 7),
(158, 'Quia autem in.', '1564499807', 1, 158, 93, 65, 81),
(159, 'Consequatur nam.', '1564499807', 1, 159, 27, 32, 41),
(160, 'Quia voluptas.', '1564499808', 0, 160, 38, 87, 95),
(161, 'Et beatae voluptates.', '1564499808', 0, 161, 83, 17, 68),
(162, 'Aliquid quisquam et at aperiam.', '1564499808', 0, 162, 85, 36, 69),
(163, 'Alias dicta voluptatem ut sint.', '1564499808', 0, 163, 91, 39, 65),
(164, 'Ipsa id.', '1564499808', 0, 164, 42, 82, 6),
(165, 'Tempore.', '1564499808', 1, 165, 38, 74, 91),
(166, 'Vel autem id et.', '1564499808', 1, 166, 16, 90, 96),
(167, 'Unde id.', '1564499808', 0, 167, 74, 40, 78),
(168, 'Perspiciatis eius ea est est laboriosam.', '1564499808', 1, 168, 35, 51, 90),
(169, 'Voluptas molestias et eos cupiditate.', '1564499808', 1, 169, 84, 20, 49),
(170, 'Magni commodi qui.', '1564499808', 1, 170, 85, 6, 38),
(171, 'Asperiores pariatur esse voluptas quibusdam.', '1564499808', 0, 171, 65, 70, 67),
(172, 'Fugit tenetur et.', '1564499808', 0, 172, 65, 96, 33),
(173, 'Blanditiis quae quae est.', '1564499808', 0, 173, 94, 63, 82),
(174, 'Est ab possimus.', '1564499808', 0, 174, 61, 32, 50),
(175, 'Qui sit sunt minima.', '1564499808', 0, 175, 85, 71, 40),
(176, 'Possimus.', '1564499808', 1, 176, 32, 15, 79),
(177, 'Rerum exercitationem expedita est ducimus.', '1564499808', 0, 177, 85, 44, 19),
(178, 'Animi voluptatem eveniet maxime.', '1564499808', 1, 178, 49, 83, 44),
(179, 'Dicta placeat.', '1564499808', 1, 179, 63, 9, 80),
(180, 'In minus similique.', '1564499808', 0, 180, 13, 80, 38),
(181, 'Non odio.', '1564499808', 0, 181, 88, 14, 92),
(182, 'Tenetur ut.', '1564499808', 0, 182, 4, 93, 57),
(183, 'Sit aut.', '1564499808', 0, 183, 90, 46, 50),
(184, 'Aut facilis.', '1564499808', 1, 184, 86, 38, 86),
(185, 'Architecto esse mollitia.', '1564499808', 1, 185, 29, 50, 60),
(186, 'Consequatur nulla laudantium quisquam.', '1564499808', 0, 186, 42, 32, 52),
(187, 'Accusantium repudiandae quasi ut.', '1564499808', 1, 187, 13, 72, 16),
(188, 'Ut iure.', '1564499808', 0, 188, 67, 40, 49),
(189, 'Maxime doloremque facilis.', '1564499808', 0, 189, 26, 91, 3),
(190, 'Accusamus ea inventore quo.', '1564499808', 1, 190, 50, 79, 35),
(191, 'Autem cupiditate eligendi.', '1564499808', 1, 191, 9, 74, 10),
(192, 'Officia reprehenderit amet nemo sint.', '1564499808', 0, 192, 22, 69, 61),
(193, 'Amet officia ullam doloribus.', '1564499808', 0, 193, 16, 23, 60),
(194, 'Veritatis.', '1564499808', 0, 194, 56, 89, 81),
(195, 'Veritatis sit voluptatem doloribus.', '1564499808', 1, 195, 37, 80, 36),
(196, 'Dignissimos quas.', '1564499808', 0, 196, 25, 2, 11),
(197, 'Modi.', '1564499808', 0, 197, 12, 39, 92),
(198, 'Magni accusamus ex aut.', '1564499808', 1, 198, 65, 67, 15),
(199, 'Consectetur libero.', '1564499808', 1, 199, 88, 1, 12),
(200, 'Sit velit non in.', '1564499808', 0, 200, 78, 93, 64),
(201, 'Maiores est cupiditate.', '1564499808', 0, 201, 78, 58, 37),
(202, 'Corporis tempora dolores.', '1564499808', 0, 202, 75, 62, 13),
(203, 'Reprehenderit molestias ea.', '1564499808', 0, 203, 52, 15, 91),
(204, 'Harum exercitationem voluptates non.', '1564499808', 1, 204, 18, 20, 77),
(205, 'A est dolor adipisci.', '1564499808', 0, 205, 52, 72, 23),
(206, 'Et iusto.', '1564499808', 0, 206, 95, 48, 73),
(207, 'Ad.', '1564499808', 0, 207, 24, 68, 4),
(208, 'Rem commodi.', '1564499808', 1, 208, 81, 49, 31),
(209, 'Consequatur illum nemo.', '1564499808', 1, 209, 92, 90, 39),
(210, 'Consectetur consequatur accusamus dolorem.', '1564499808', 0, 210, 16, 27, 11),
(211, 'Vel alias.', '1564499808', 0, 211, 88, 11, 58),
(212, 'Qui eligendi veritatis ratione soluta.', '1564499808', 0, 212, 49, 42, 56),
(213, 'Ab quasi explicabo qui autem tempora.', '1564499808', 1, 213, 64, 89, 64),
(214, 'Et excepturi.', '1564499808', 1, 214, 62, 50, 52),
(215, 'Sed enim praesentium est recusandae.', '1564499808', 1, 215, 43, 85, 36),
(216, 'Est culpa.', '1564499808', 0, 216, 95, 31, 9),
(217, 'Est quidem aspernatur in voluptates.', '1564499808', 0, 217, 60, 82, 64),
(218, 'Voluptates iste saepe.', '1564499808', 1, 218, 38, 73, 91),
(219, 'Recusandae aut et rerum.', '1564499808', 0, 219, 94, 31, 30),
(220, 'Eligendi quia ea.', '1564499808', 1, 220, 30, 19, 68),
(221, 'Temporibus in et saepe nisi.', '1564499808', 1, 221, 30, 93, 26),
(222, 'Illo.', '1564499808', 0, 222, 16, 25, 41),
(223, 'Molestias quam harum et explicabo.', '1564499808', 1, 223, 62, 94, 75),
(224, 'Debitis.', '1564499808', 1, 224, 13, 66, 42),
(225, 'Cupiditate rerum.', '1564499808', 1, 225, 70, 43, 66),
(226, 'Illum eum voluptatum voluptatem.', '1564499808', 1, 226, 73, 96, 23),
(227, 'Omnis mollitia.', '1564499808', 1, 227, 74, 82, 40),
(228, 'Magni rerum facilis qui perspiciatis.', '1564499808', 1, 228, 40, 96, 94),
(229, 'Ipsa.', '1564499808', 1, 229, 7, 41, 2),
(230, 'Neque corporis occaecati facere quia.', '1564499808', 1, 230, 3, 39, 23),
(231, 'Recusandae illo sed.', '1564499808', 0, 231, 41, 85, 69),
(232, 'Perspiciatis rem vitae.', '1564499808', 1, 232, 48, 49, 79),
(233, 'Beatae delectus.', '1564499808', 1, 233, 36, 21, 43),
(234, 'Ab consequatur cupiditate.', '1564499808', 1, 234, 50, 15, 31),
(235, 'Culpa laudantium eum dolores.', '1564499808', 0, 235, 49, 63, 7),
(236, 'Facilis cupiditate sit ipsam corrupti.', '1564499809', 1, 236, 30, 3, 68),
(237, 'Minima perferendis.', '1564499809', 0, 237, 17, 21, 5),
(238, 'Ullam ipsam voluptates.', '1564499809', 1, 238, 9, 42, 62),
(239, 'Quaerat.', '1564499809', 1, 239, 56, 83, 26),
(240, 'Error fugiat excepturi.', '1564499809', 1, 240, 39, 55, 20),
(241, 'Suscipit voluptatem dolor.', '1564499809', 0, 241, 90, 15, 21),
(242, 'Quidem excepturi.', '1564499809', 0, 242, 9, 54, 41),
(243, 'Quod aut.', '1564499809', 1, 243, 28, 96, 3),
(244, 'Aut quisquam quis sapiente saepe est.', '1564499809', 1, 244, 88, 81, 44),
(245, 'Nobis.', '1564499809', 1, 245, 42, 52, 46),
(246, 'Enim qui.', '1564499809', 1, 246, 1, 83, 33),
(247, 'Tempore facilis sapiente.', '1564499809', 0, 247, 7, 26, 68),
(248, 'Qui necessitatibus quibusdam.', '1564499809', 0, 248, 29, 42, 91),
(249, 'Quod beatae.', '1564499809', 0, 249, 1, 8, 92),
(250, 'Ut recusandae tempora vero deserunt recusandae.', '1564499809', 0, 250, 28, 62, 79),
(251, 'Molestiae.', '1564499809', 0, 251, 75, 28, 92),
(252, 'Eos nostrum praesentium qui voluptas.', '1564499809', 1, 252, 80, 14, 67),
(253, 'Possimus qui quidem consectetur vel.', '1564499809', 1, 253, 1, 91, 14),
(254, 'Porro repellat mollitia illum.', '1564499809', 1, 254, 28, 27, 48),
(255, 'Id ea maiores omnis.', '1564499809', 0, 255, 8, 5, 64),
(256, 'Inventore excepturi velit.', '1564499809', 0, 256, 3, 75, 36),
(257, 'Quaerat eos sit.', '1564499809', 0, 257, 26, 13, 40),
(258, 'Reprehenderit.', '1564499809', 0, 258, 55, 71, 86),
(259, 'Sint soluta.', '1564499809', 1, 259, 30, 87, 24),
(260, 'Assumenda consectetur voluptatibus quos.', '1564499809', 1, 260, 41, 14, 30),
(261, 'Quia delectus necessitatibus.', '1564499809', 1, 261, 14, 28, 60),
(262, 'Unde qui.', '1564499809', 0, 262, 8, 67, 42),
(263, 'Ut praesentium praesentium voluptas.', '1564499809', 0, 263, 92, 40, 56),
(264, 'Excepturi aut labore distinctio consequuntur.', '1564499809', 1, 264, 32, 65, 8),
(265, 'Sed quidem ea.', '1564499809', 1, 265, 54, 62, 79),
(266, 'Deserunt culpa quisquam.', '1564499809', 0, 266, 75, 72, 41),
(267, 'Accusamus explicabo.', '1564499809', 0, 267, 4, 25, 49),
(268, 'Consequatur rerum.', '1564499809', 1, 268, 66, 51, 39),
(269, 'Ad repudiandae.', '1564499809', 0, 269, 11, 36, 57),
(270, 'Nisi molestiae nisi repellendus itaque delectus.', '1564499809', 1, 270, 7, 10, 39),
(271, 'Rerum nesciunt laudantium dolorum id.', '1564499809', 0, 271, 45, 85, 16),
(272, 'Eos nesciunt tenetur.', '1564499809', 0, 272, 81, 74, 91),
(273, 'Animi.', '1564499809', 0, 273, 56, 73, 19),
(274, 'Veniam fugiat quos.', '1564499809', 1, 274, 57, 68, 75),
(275, 'Aspernatur et.', '1564499809', 1, 275, 17, 19, 55),
(276, 'Voluptatem ex rerum.', '1564499809', 1, 276, 71, 87, 41),
(277, 'Sunt tempora dolorem voluptatem voluptatum nostrum.', '1564499809', 1, 277, 85, 36, 30),
(278, 'Quam est distinctio qui.', '1564499809', 1, 278, 80, 87, 21),
(279, 'Aut ipsum fugit dignissimos.', '1564499809', 0, 279, 89, 88, 49),
(280, 'Illo amet pariatur dignissimos molestiae excepturi.', '1564499809', 0, 280, 78, 76, 69),
(281, 'Id quo accusamus.', '1564499809', 0, 281, 93, 35, 60),
(282, 'Veritatis quia.', '1564499809', 1, 282, 6, 56, 39),
(283, 'Ut vitae.', '1564499809', 1, 283, 21, 67, 50),
(284, 'Voluptatem dolorem officia hic cum quis.', '1564499809', 0, 284, 38, 46, 84),
(285, 'Excepturi molestiae neque ipsum.', '1564499809', 1, 285, 82, 17, 39),
(286, 'Aut excepturi repellat.', '1564499809', 0, 286, 93, 51, 55),
(287, 'Officiis rem quo repudiandae doloremque animi.', '1564499809', 1, 287, 74, 95, 75),
(288, 'Nihil dolore suscipit.', '1564499809', 0, 288, 93, 7, 46),
(289, 'Ut.', '1564499810', 0, 289, 56, 58, 52),
(290, 'Natus molestias eligendi.', '1564499810', 1, 290, 26, 50, 5),
(291, 'Eius eum tempora.', '1564499810', 1, 291, 57, 66, 64),
(292, 'Dicta adipisci.', '1564499810', 0, 292, 91, 19, 37),
(293, 'Itaque earum eos molestias.', '1564499810', 1, 293, 77, 84, 47),
(294, 'Culpa consequuntur molestiae.', '1564499810', 1, 294, 58, 6, 18),
(295, 'Sequi.', '1564499810', 1, 295, 56, 78, 31),
(296, 'Vitae ut.', '1564499810', 0, 296, 69, 73, 78),
(297, 'Hic totam.', '1564499810', 1, 297, 20, 78, 89),
(298, 'Consectetur quia dolor.', '1564499810', 0, 298, 40, 61, 18),
(299, 'Odio ea velit facere ex.', '1564499810', 1, 299, 89, 11, 86),
(300, 'Nemo et ut autem.', '1564499810', 0, 300, 85, 25, 96),
(301, 'Voluptas ut.', '1564499810', 0, 301, 80, 44, 24),
(302, 'Exercitationem enim.', '1564499810', 1, 302, 54, 89, 30),
(303, 'Voluptatem non.', '1564499810', 0, 303, 91, 37, 21),
(304, 'Pariatur officia commodi eum.', '1564499810', 1, 304, 64, 83, 92),
(305, 'Dolor distinctio et.', '1564499810', 1, 305, 75, 66, 72),
(306, 'Sint magni iusto nihil maxime.', '1564499810', 1, 306, 19, 2, 51),
(307, 'Nemo qui.', '1564499810', 0, 307, 2, 14, 89),
(308, 'Recusandae voluptas labore.', '1564499810', 1, 308, 22, 60, 33),
(309, 'Quidem explicabo.', '1564499810', 1, 309, 54, 65, 2),
(310, 'Rerum cumque repellendus reprehenderit.', '1564499810', 0, 310, 37, 16, 15),
(311, 'Ea occaecati.', '1564499810', 1, 311, 76, 79, 83),
(312, 'Neque natus reprehenderit odio enim labore.', '1564499810', 1, 312, 42, 6, 53),
(313, 'Temporibus molestiae voluptatem vel.', '1564499810', 1, 313, 53, 16, 65),
(314, 'Fugit cum et consectetur.', '1564499810', 1, 314, 40, 69, 36),
(315, 'Esse voluptas.', '1564499810', 0, 315, 71, 14, 70),
(316, 'Velit velit et a.', '1564499810', 0, 316, 53, 34, 10),
(317, 'Quis vitae saepe.', '1564499810', 1, 317, 96, 6, 57),
(318, 'Ipsam quasi quaerat error.', '1564499810', 1, 318, 4, 22, 66),
(319, 'Reprehenderit.', '1564499810', 0, 319, 15, 41, 9),
(320, 'Atque.', '1564499810', 1, 320, 21, 83, 16),
(321, 'Ut consequatur ut beatae eaque ipsa.', '1564499810', 1, 321, 31, 40, 55),
(322, 'Nemo commodi unde.', '1564499810', 0, 322, 53, 68, 92),
(323, 'Fugit sed at.', '1564499810', 1, 323, 8, 68, 32),
(324, 'Molestias provident.', '1564499810', 1, 324, 42, 21, 9),
(325, 'Dolorem accusantium.', '1564499810', 0, 325, 56, 76, 88),
(326, 'Vel soluta qui laborum.', '1564499810', 0, 326, 13, 20, 23),
(327, 'Inventore aut accusamus molestiae quia.', '1564499810', 0, 327, 3, 92, 42),
(328, 'Ab necessitatibus perspiciatis saepe reiciendis.', '1564499810', 1, 328, 87, 92, 13),
(329, 'Quia porro natus eos.', '1564499810', 1, 329, 4, 84, 16),
(330, 'Quis possimus.', '1564499810', 0, 330, 93, 20, 91),
(331, 'Neque in.', '1564499810', 0, 331, 65, 61, 16),
(332, 'Dolorum suscipit.', '1564499810', 0, 332, 50, 79, 58),
(333, 'Blanditiis.', '1564499810', 1, 333, 41, 96, 29),
(334, 'Occaecati.', '1564499810', 1, 334, 59, 33, 51),
(335, 'Et.', '1564499810', 1, 335, 59, 44, 88),
(336, 'Voluptatem.', '1564499810', 1, 336, 53, 43, 14),
(337, 'Ut eius laborum quia.', '1564499810', 0, 337, 53, 9, 63),
(338, 'Voluptates suscipit quod.', '1564499810', 1, 338, 17, 34, 70),
(339, 'Fugit eum eligendi debitis delectus.', '1564499810', 1, 339, 46, 52, 71),
(340, 'Ab quisquam facere sint voluptatem.', '1564499810', 0, 340, 59, 96, 27),
(341, 'Laudantium delectus eos.', '1564499810', 1, 341, 20, 57, 57),
(342, 'Fugiat incidunt quia adipisci cumque.', '1564499810', 0, 342, 29, 32, 65),
(343, 'Quam aut ut nulla dolorem.', '1564499811', 1, 343, 64, 69, 12),
(344, 'Amet maxime ad.', '1564499811', 1, 344, 27, 40, 44),
(345, 'Non consequatur maiores sapiente.', '1564499811', 1, 345, 3, 20, 12),
(346, 'Ea amet laborum sequi.', '1564499811', 0, 346, 61, 54, 90),
(347, 'Et architecto autem.', '1564499811', 1, 347, 49, 31, 19),
(348, 'Maiores amet repellat et qui.', '1564499811', 1, 348, 87, 68, 3),
(349, 'Illum.', '1564499811', 1, 349, 93, 81, 64),
(350, 'Consequuntur voluptas.', '1564499811', 1, 350, 9, 62, 82),
(351, 'Facilis neque.', '1564499811', 0, 351, 36, 21, 71),
(352, 'Animi voluptas id.', '1564499811', 0, 352, 27, 14, 13),
(353, 'Qui labore suscipit odit.', '1564499811', 1, 353, 17, 13, 61),
(354, 'Dolorum libero dolores voluptate est corrupti.', '1564499811', 0, 354, 28, 84, 59),
(355, 'Similique dolores repudiandae itaque adipisci.', '1564499811', 1, 355, 62, 62, 32),
(356, 'In consectetur rem.', '1564499811', 1, 356, 16, 17, 13),
(357, 'Magnam laborum assumenda.', '1564499811', 1, 357, 35, 89, 13),
(358, 'Consequatur soluta.', '1564499811', 1, 358, 75, 86, 60),
(359, 'Sed nulla quaerat.', '1564499811', 0, 359, 26, 59, 89),
(360, 'Est earum blanditiis.', '1564499811', 0, 360, 38, 94, 88),
(361, 'Dolores hic.', '1564499811', 0, 361, 1, 12, 96),
(362, 'Tempora dolorum et adipisci sit.', '1564499811', 1, 362, 22, 28, 41),
(363, 'Laboriosam laboriosam nam.', '1564499811', 0, 363, 42, 7, 8),
(364, 'Reprehenderit voluptas iure impedit.', '1564499811', 0, 364, 76, 35, 54),
(365, 'Omnis corrupti.', '1564499811', 1, 365, 63, 57, 22),
(366, 'Tempora.', '1564499811', 1, 366, 9, 6, 69),
(367, 'Ea.', '1564499811', 1, 367, 20, 75, 44),
(368, 'Dolores quam.', '1564499811', 1, 368, 71, 56, 24),
(369, 'Recusandae.', '1564499811', 1, 369, 69, 8, 82),
(370, 'Perferendis ad cumque officiis.', '1564499811', 0, 370, 11, 75, 20),
(371, 'Rem minus ipsam non dolores dolores.', '1564499811', 1, 371, 50, 30, 13),
(372, 'Aliquid fuga odio non.', '1564499811', 1, 372, 10, 63, 27),
(373, 'Eveniet et.', '1564499811', 0, 373, 87, 60, 95),
(374, 'Deserunt rerum iure.', '1564499811', 1, 374, 44, 65, 94),
(375, 'Animi tenetur.', '1564499811', 0, 375, 94, 17, 8),
(376, 'Necessitatibus aut qui.', '1564499811', 0, 376, 76, 50, 31),
(377, 'Voluptatem consequuntur.', '1564499811', 0, 377, 51, 21, 24),
(378, 'In beatae.', '1564499811', 0, 378, 26, 74, 14),
(379, 'Rerum.', '1564499811', 1, 379, 8, 71, 75),
(380, 'Sit molestiae.', '1564499812', 1, 380, 38, 52, 85),
(381, 'Cupiditate tempora id.', '1564499812', 1, 381, 90, 43, 50),
(382, 'Est ab voluptates.', '1564499812', 0, 382, 28, 70, 3),
(383, 'Quibusdam qui provident sit natus.', '1564499812', 1, 383, 44, 88, 53),
(384, 'Veritatis aliquid corrupti quia.', '1564499812', 1, 384, 9, 63, 2),
(385, 'Tenetur nesciunt laborum.', '1564499812', 0, 385, 93, 12, 68),
(386, 'Doloremque quis qui aut quasi.', '1564499812', 1, 386, 19, 35, 95),
(387, 'Qui sequi dignissimos suscipit temporibus.', '1564499812', 1, 387, 14, 51, 59),
(388, 'Aut minus dolore.', '1564499812', 0, 388, 82, 70, 24),
(389, 'Dolores.', '1564499812', 1, 389, 29, 39, 77),
(390, 'Aut dolores possimus.', '1564499812', 1, 390, 58, 21, 95),
(391, 'In.', '1564499812', 0, 391, 89, 74, 34),
(392, 'Reprehenderit et qui quis repellendus.', '1564499812', 1, 392, 34, 92, 17),
(393, 'Ut modi consectetur nam at.', '1564499812', 1, 393, 20, 56, 38),
(394, 'Voluptatem voluptatum debitis explicabo voluptatem.', '1564499812', 0, 394, 1, 26, 33),
(395, 'Sint ipsa.', '1564499812', 0, 395, 6, 75, 23),
(396, 'Aut maxime reiciendis dolorem.', '1564499812', 1, 396, 94, 15, 28),
(397, 'Esse.', '1564499812', 1, 397, 66, 16, 50),
(398, 'Soluta minus tenetur iusto.', '1564499812', 0, 398, 81, 78, 45),
(399, 'Quia maxime deserunt.', '1564499812', 1, 399, 73, 95, 73),
(400, 'Quos architecto.', '1564499812', 0, 400, 91, 89, 95),
(401, 'Ut non voluptatem.', '1564499812', 0, 401, 34, 75, 74),
(402, 'Aut vero.', '1564499812', 1, 402, 8, 28, 38),
(403, 'Laboriosam possimus est.', '1564499812', 0, 403, 3, 55, 14),
(404, 'Quidem aut expedita eius.', '1564499812', 0, 404, 49, 72, 55),
(405, 'Qui vitae provident magnam repellendus.', '1564499812', 1, 405, 27, 94, 22),
(406, 'Et aperiam.', '1564499812', 0, 406, 12, 16, 50),
(407, 'Molestiae sed rerum.', '1564499812', 0, 407, 3, 39, 91),
(408, 'Itaque.', '1564499812', 0, 408, 34, 49, 13),
(409, 'Aliquid minus.', '1564499812', 1, 409, 87, 84, 68),
(410, 'Odio quia.', '1564499812', 1, 410, 29, 42, 53),
(411, 'Laudantium est deleniti.', '1564499812', 0, 411, 94, 27, 67),
(412, 'Est illum incidunt sint.', '1564499812', 1, 412, 85, 53, 14),
(413, 'Sunt hic mollitia.', '1564499812', 0, 413, 65, 40, 74),
(414, 'Odit distinctio.', '1564499812', 1, 414, 24, 76, 19),
(415, 'Facilis impedit reiciendis dolores.', '1564499812', 0, 415, 18, 80, 74),
(416, 'Odio fugit facere eos quaerat dolores.', '1564499812', 1, 416, 7, 75, 65),
(417, 'Repellat dolor sit.', '1564499812', 0, 417, 6, 22, 90),
(418, 'Ipsa non consequuntur.', '1564499812', 1, 418, 68, 8, 35),
(419, 'Quaerat perspiciatis rerum.', '1564499812', 0, 419, 9, 89, 92),
(420, 'Fugit id beatae voluptatem.', '1564499813', 1, 420, 82, 86, 74),
(421, 'Quidem nam voluptatem.', '1564499813', 0, 421, 19, 16, 44),
(422, 'Est libero et temporibus.', '1564499813', 0, 422, 10, 88, 6),
(423, 'Ipsam possimus commodi.', '1564499813', 1, 423, 7, 40, 93),
(424, 'At.', '1564499813', 1, 424, 41, 58, 28),
(425, 'Provident odio dicta architecto quisquam.', '1564499813', 1, 425, 69, 96, 26),
(426, 'Quos possimus dicta repellendus excepturi.', '1564499813', 0, 426, 56, 63, 12),
(427, 'Aliquam suscipit veritatis neque reiciendis pariatur.', '1564499813', 1, 427, 90, 18, 54),
(428, 'Voluptas et qui ut.', '1564499813', 1, 428, 14, 27, 21),
(429, 'Enim qui.', '1564499813', 0, 429, 81, 17, 80),
(430, 'Voluptatum repudiandae ea.', '1564499813', 0, 430, 57, 73, 89),
(431, 'Occaecati harum similique voluptatem quod optio.', '1564499813', 1, 431, 26, 15, 4),
(432, 'Occaecati voluptas omnis.', '1564499813', 0, 432, 72, 70, 16),
(433, 'Et saepe omnis incidunt.', '1564499813', 0, 433, 79, 12, 16),
(434, 'Doloremque.', '1564499813', 0, 434, 25, 96, 54),
(435, 'Nemo eum voluptatem consectetur.', '1564499813', 0, 435, 76, 55, 64),
(436, 'Et maxime qui quasi.', '1564499813', 1, 436, 67, 52, 18),
(437, 'Aut accusamus et ut tempora et.', '1564499813', 1, 437, 53, 66, 17),
(438, 'Eligendi cupiditate ullam numquam et.', '1564499813', 1, 438, 10, 93, 67),
(439, 'Et accusamus iusto error.', '1564499813', 1, 439, 63, 71, 61),
(440, 'Vel perferendis corporis eius ut.', '1564499813', 0, 440, 16, 26, 75),
(441, 'Repudiandae et repellendus officia.', '1564499813', 1, 441, 69, 1, 90),
(442, 'Labore sit illum.', '1564499813', 0, 442, 87, 54, 86),
(443, 'Facere cumque fugit nihil illo harum.', '1564499813', 0, 443, 36, 77, 67),
(444, 'Cupiditate.', '1564499813', 1, 444, 69, 18, 51),
(445, 'Mollitia architecto.', '1564499813', 0, 445, 53, 30, 44),
(446, 'Deserunt ratione voluptas dolorum.', '1564499813', 0, 446, 31, 8, 27),
(447, 'Ratione molestias nam qui nihil exercitationem.', '1564499813', 1, 447, 78, 46, 68),
(448, 'Veniam ut enim quibusdam.', '1564499813', 1, 448, 3, 5, 27),
(449, 'Nemo.', '1564499813', 1, 449, 6, 61, 34),
(450, 'Et cupiditate alias.', '1564499813', 1, 450, 8, 92, 45),
(451, 'In sunt molestias et.', '1564499813', 1, 451, 64, 67, 23),
(452, 'In hic et qui est consequatur.', '1564499813', 1, 452, 3, 63, 51),
(453, 'Labore dolor.', '1564499813', 1, 453, 27, 6, 17),
(454, 'Reiciendis perferendis est.', '1564499814', 1, 454, 95, 39, 73),
(455, 'Fuga atque aut et.', '1564499814', 0, 455, 25, 70, 67),
(456, 'Iure et.', '1564499814', 1, 456, 72, 79, 35),
(457, 'Dignissimos fugiat quia.', '1564499814', 1, 457, 82, 83, 96),
(458, 'Qui et facilis voluptate enim.', '1564499814', 1, 458, 59, 48, 5),
(459, 'Reiciendis et et iste.', '1564499814', 1, 459, 10, 40, 83),
(460, 'Voluptatibus quae possimus.', '1564499814', 1, 460, 61, 23, 76),
(461, 'Velit ut.', '1564499814', 0, 461, 17, 6, 18),
(462, 'Nulla et.', '1564499814', 1, 462, 56, 19, 81),
(463, 'Illum quisquam nemo magni.', '1564499814', 0, 463, 94, 60, 18),
(464, 'Qui autem est.', '1564499814', 0, 464, 3, 64, 64),
(465, 'Ab eius aperiam saepe corporis.', '1564499814', 0, 465, 23, 7, 31),
(466, 'Maiores omnis quos sunt.', '1564499814', 1, 466, 1, 1, 61),
(467, 'Impedit aut nisi ex quisquam.', '1564499814', 0, 467, 39, 80, 7),
(468, 'Aperiam.', '1564499814', 1, 468, 47, 65, 82),
(469, 'Rerum in natus dolorum quaerat.', '1564499814', 1, 469, 35, 36, 35),
(470, 'Occaecati velit inventore qui.', '1564499814', 0, 470, 93, 78, 42),
(471, 'Quia sit velit molestias.', '1564499814', 1, 471, 18, 27, 10),
(472, 'Nostrum quidem.', '1564499814', 1, 472, 75, 70, 22),
(473, 'At et distinctio alias necessitatibus.', '1564499814', 1, 473, 67, 50, 88),
(474, 'Rerum sunt ea rerum.', '1564499814', 0, 474, 69, 55, 20),
(475, 'Aperiam quibusdam.', '1564499814', 0, 475, 56, 29, 68),
(476, 'Corrupti magnam consequatur dolore.', '1564499814', 1, 476, 82, 91, 59),
(477, 'Quia hic.', '1564499814', 1, 477, 58, 26, 92),
(478, 'A dolore eaque non quis asperiores.', '1564499814', 1, 478, 7, 4, 1),
(479, 'Quibusdam impedit nobis.', '1564499814', 0, 479, 45, 78, 50),
(480, 'A.', '1564499814', 0, 480, 6, 56, 39),
(481, 'Id vel tempora.', '1564499814', 1, 481, 76, 46, 22),
(482, 'Quis est quis.', '1564499814', 1, 482, 71, 8, 72),
(483, 'Reprehenderit odit.', '1564499814', 0, 483, 47, 26, 30),
(484, 'Magni non neque facere.', '1564499814', 0, 484, 4, 42, 93),
(485, 'Et molestiae ut tempore.', '1564499814', 0, 485, 44, 16, 89),
(486, 'Nostrum.', '1564499814', 0, 486, 86, 30, 40),
(487, 'Dicta.', '1564499814', 0, 487, 72, 20, 48),
(488, 'Est sed voluptates adipisci.', '1564499814', 1, 488, 41, 57, 84),
(489, 'Delectus impedit perspiciatis.', '1564499815', 1, 489, 21, 1, 9),
(490, 'Error numquam id.', '1564499815', 0, 490, 21, 81, 43),
(491, 'Eius qui sit ut.', '1564499815', 1, 491, 85, 59, 88),
(492, 'Incidunt maxime nihil.', '1564499815', 1, 492, 76, 78, 55),
(493, 'Sint.', '1564499815', 1, 493, 78, 77, 6),
(494, 'Accusantium officiis.', '1564499815', 1, 494, 30, 62, 17),
(495, 'Deserunt voluptas accusantium.', '1564499815', 0, 495, 66, 19, 88),
(496, 'Et sit exercitationem.', '1564499815', 1, 496, 1, 60, 13),
(497, 'Repellat qui.', '1564499815', 0, 497, 43, 24, 88),
(498, 'Similique doloremque autem.', '1564499815', 1, 498, 63, 70, 32),
(499, 'Sit nobis deserunt nemo.', '1564499815', 0, 499, 18, 63, 33),
(500, 'Vitae.', '1564499815', 0, 500, 9, 28, 81),
(501, 'Error occaecati soluta qui.', '1564499815', 1, 501, 72, 64, 67),
(502, 'Et quaerat id nesciunt.', '1564499815', 0, 502, 76, 48, 6),
(503, 'Suscipit numquam aut.', '1564499815', 1, 503, 59, 90, 20),
(504, 'Illo vel est delectus.', '1564499815', 1, 504, 36, 95, 9),
(505, 'Necessitatibus sed quo quasi.', '1564499815', 1, 505, 69, 40, 41),
(506, 'Sint in quia consequatur reprehenderit.', '1564499815', 1, 506, 95, 21, 57),
(507, 'Rem fugit.', '1564499815', 0, 507, 36, 85, 17),
(508, 'Incidunt incidunt.', '1564499815', 1, 508, 90, 78, 10),
(509, 'Eligendi corporis recusandae.', '1564499815', 1, 509, 73, 58, 22),
(510, 'Est totam voluptatum.', '1564499815', 0, 510, 44, 55, 30),
(511, 'Id.', '1564499815', 1, 511, 48, 32, 65),
(512, 'Et vitae explicabo.', '1564499815', 1, 512, 66, 61, 68),
(513, 'Debitis nobis possimus.', '1564499815', 0, 513, 5, 63, 65),
(514, 'Et illum eum.', '1564499815', 1, 514, 70, 87, 41),
(515, 'Et odit.', '1564499815', 1, 515, 6, 4, 22),
(516, 'Alias reprehenderit adipisci aut.', '1564499815', 1, 516, 6, 40, 79),
(517, 'Perspiciatis vero dicta repudiandae in.', '1564499815', 1, 517, 77, 23, 76),
(518, 'Aut voluptatem omnis doloribus molestiae provident.', '1564499815', 0, 518, 23, 13, 63),
(519, 'Eius quia perspiciatis facere.', '1564499815', 0, 519, 72, 53, 96),
(520, 'Optio reprehenderit.', '1564499815', 0, 520, 87, 59, 52),
(521, 'Tempore voluptate aliquam.', '1564499815', 0, 521, 74, 38, 55),
(522, 'Odio doloribus quia.', '1564499815', 0, 522, 35, 11, 37),
(523, 'Sit ad.', '1564499816', 0, 523, 80, 76, 66),
(524, 'Et non.', '1564499816', 1, 524, 91, 3, 13),
(525, 'Aut sint commodi eum ipsa.', '1564499816', 0, 525, 37, 31, 34),
(526, 'Vero architecto.', '1564499816', 0, 526, 1, 50, 9),
(527, 'Alias blanditiis aut esse.', '1564499816', 1, 527, 95, 65, 62),
(528, 'Architecto quia accusamus.', '1564499816', 0, 528, 1, 42, 52),
(529, 'Nam ducimus unde vel sapiente et.', '1564499816', 0, 529, 78, 66, 76),
(530, 'Molestiae pariatur eaque ut et in.', '1564499816', 1, 530, 34, 94, 15),
(531, 'Ut soluta.', '1564499816', 1, 531, 46, 20, 48),
(532, 'Et repudiandae consectetur.', '1564499816', 1, 532, 60, 15, 6),
(533, 'Repellendus veritatis maiores vero.', '1564499816', 0, 533, 61, 57, 46),
(534, 'Accusamus nostrum est nostrum at.', '1564499816', 1, 534, 55, 73, 44),
(535, 'Cum dolores.', '1564499816', 1, 535, 36, 25, 13),
(536, 'Voluptate eius.', '1564499816', 0, 536, 91, 23, 70),
(537, 'Iure aliquid eius.', '1564499816', 0, 537, 28, 59, 59),
(538, 'Est eos.', '1564499816', 1, 538, 52, 91, 85),
(539, 'Perferendis.', '1564499816', 0, 539, 3, 20, 48),
(540, 'Officia deleniti quo recusandae omnis.', '1564499816', 0, 540, 63, 90, 47),
(541, 'Eligendi iste numquam.', '1564499816', 1, 541, 20, 91, 88),
(542, 'Voluptas nisi.', '1564499816', 1, 542, 7, 36, 69),
(543, 'Maxime at maiores.', '1564499816', 1, 543, 30, 21, 21),
(544, 'Velit amet nihil.', '1564499816', 1, 544, 22, 39, 24),
(545, 'Commodi magni.', '1564499816', 0, 545, 94, 76, 58),
(546, 'Earum illum explicabo est.', '1564499816', 1, 546, 2, 14, 43),
(547, 'Quam magni.', '1564499816', 0, 547, 72, 75, 18),
(548, 'Repellat deleniti.', '1564499816', 0, 548, 38, 10, 11),
(549, 'Quas optio qui ut.', '1564499816', 1, 549, 46, 17, 60),
(550, 'Mollitia.', '1564499816', 0, 550, 90, 25, 95),
(551, 'Rem voluptatem.', '1564499816', 0, 551, 70, 91, 15),
(552, 'Qui qui voluptatum dolorem molestiae.', '1564499816', 1, 552, 17, 3, 21),
(553, 'Ea perferendis.', '1564499816', 1, 553, 50, 64, 87),
(554, 'Eum adipisci vero.', '1564499816', 1, 554, 85, 23, 24),
(555, 'Aperiam voluptatibus.', '1564499816', 0, 555, 60, 96, 23),
(556, 'Adipisci assumenda dolore facilis aut rerum.', '1564499816', 0, 556, 44, 37, 53),
(557, 'Nisi explicabo aut.', '1564499816', 1, 557, 76, 38, 63),
(558, 'Aspernatur autem.', '1564499816', 1, 558, 70, 53, 40),
(559, 'Magnam maxime modi.', '1564499816', 1, 559, 85, 83, 42),
(560, 'Nobis.', '1564499817', 1, 560, 70, 34, 44),
(561, 'Unde dolorem alias.', '1564499817', 0, 561, 69, 71, 40),
(562, 'Facilis sed.', '1564499817', 1, 562, 11, 63, 66),
(563, 'Esse accusamus occaecati.', '1564499817', 1, 563, 58, 84, 50),
(564, 'Ut voluptas omnis aspernatur asperiores.', '1564499817', 0, 564, 58, 25, 44),
(565, 'Quia neque et.', '1564499817', 1, 565, 86, 54, 82),
(566, 'Amet maxime eveniet suscipit voluptatum enim.', '1564499817', 1, 566, 49, 10, 56),
(567, 'Excepturi similique.', '1564499817', 0, 567, 84, 75, 17),
(568, 'Nam eveniet.', '1564499817', 0, 568, 80, 56, 15),
(569, 'Eum ipsa labore quidem nam.', '1564499817', 0, 569, 86, 93, 90),
(570, 'Iusto voluptas quo nihil est.', '1564499817', 0, 570, 17, 41, 22),
(571, 'Id quaerat mollitia.', '1564499817', 0, 571, 74, 24, 78),
(572, 'Sint est est.', '1564499817', 0, 572, 76, 73, 21),
(573, 'Reprehenderit quia in rem aut.', '1564499817', 1, 573, 41, 16, 87),
(574, 'Culpa fuga.', '1564499817', 0, 574, 69, 46, 80),
(575, 'Ut earum quis.', '1564499817', 0, 575, 40, 93, 90),
(576, 'Vel et.', '1564499817', 0, 576, 94, 85, 67),
(577, 'Aspernatur qui.', '1564499817', 0, 577, 38, 77, 64),
(578, 'Repellendus quos eveniet.', '1564499817', 0, 578, 93, 56, 47),
(579, 'Suscipit nulla unde.', '1564499817', 0, 579, 36, 10, 21),
(580, 'Vitae eos.', '1564499817', 1, 580, 37, 30, 96),
(581, 'Nisi odio et non.', '1564499817', 0, 581, 4, 44, 38),
(582, 'Illum aliquid quia quidem.', '1564499817', 1, 582, 91, 63, 50),
(583, 'Et repudiandae excepturi et.', '1564499817', 0, 583, 13, 75, 31),
(584, 'Adipisci vel fuga eos consequatur voluptas.', '1564499817', 1, 584, 94, 83, 23),
(585, 'At sit.', '1564499817', 1, 585, 86, 15, 63),
(586, 'Deserunt et quia necessitatibus.', '1564499817', 0, 586, 74, 32, 62),
(587, 'Adipisci ea.', '1564499817', 0, 587, 30, 76, 80),
(588, 'Sed amet ab.', '1564499817', 1, 588, 34, 38, 79),
(589, 'Dolorem et odio tempore rerum.', '1564499817', 1, 589, 22, 43, 59),
(590, 'Ad dolorum ut et facilis cum.', '1564499817', 0, 590, 54, 91, 70),
(591, 'Dolore dolor consequuntur unde aspernatur.', '1564499817', 1, 591, 5, 96, 91),
(592, 'Voluptatem non.', '1564499817', 0, 592, 31, 40, 33),
(593, 'Sequi.', '1564499817', 0, 593, 50, 44, 91),
(594, 'Dicta reiciendis.', '1564499817', 1, 594, 88, 22, 13),
(595, 'Ullam quis.', '1564499817', 0, 595, 52, 50, 70),
(596, 'Quod aperiam sit.', '1564499817', 1, 596, 90, 94, 96),
(597, 'Alias.', '1564499817', 1, 597, 21, 63, 86),
(598, 'Minima est deserunt.', '1564499817', 0, 598, 6, 72, 69),
(599, 'Illo vel.', '1564499817', 1, 599, 47, 18, 32),
(600, 'Nulla officiis nulla.', '1564499817', 0, 600, 10, 60, 33),
(601, 'Nam voluptatem error.', '1564499817', 1, 601, 6, 49, 23),
(602, 'Omnis quam.', '1564499817', 1, 602, 95, 3, 6),
(603, 'Id earum.', '1564499817', 0, 603, 52, 37, 79),
(604, 'Vel aspernatur magni.', '1564499817', 1, 604, 5, 60, 86),
(605, 'Voluptate.', '1564499817', 1, 605, 45, 22, 89),
(606, 'Aut eos ea eos qui.', '1564499817', 0, 606, 12, 96, 68),
(607, 'Est.', '1564499817', 1, 607, 38, 58, 92),
(608, 'Dolore itaque.', '1564499817', 1, 608, 9, 34, 7),
(609, 'Neque.', '1564499817', 1, 609, 80, 5, 81),
(610, 'Excepturi molestias magnam quos.', '1564499817', 1, 610, 94, 40, 25),
(611, 'Voluptatem modi quibusdam.', '1564499817', 0, 611, 17, 47, 52),
(612, 'Dolor architecto est rem.', '1564499818', 0, 612, 56, 68, 93),
(613, 'Laboriosam porro nulla a.', '1564499818', 1, 613, 74, 56, 28),
(614, 'Quia fugiat et.', '1564499818', 0, 614, 96, 69, 29),
(615, 'Maiores quod.', '1564499818', 0, 615, 29, 70, 15),
(616, 'Autem officiis sit molestiae.', '1564499818', 1, 616, 78, 92, 27),
(617, 'Modi.', '1564499818', 1, 617, 85, 48, 12),
(618, 'Qui hic beatae ut.', '1564499818', 0, 618, 76, 44, 4),
(619, 'Voluptatem omnis.', '1564499818', 0, 619, 80, 51, 37),
(620, 'Et eos est non quidem.', '1564499818', 0, 620, 49, 18, 26),
(621, 'Aut.', '1564499818', 0, 621, 20, 69, 8),
(622, 'Magni tempore non qui est.', '1564499818', 0, 622, 4, 57, 12),
(623, 'Voluptatem suscipit.', '1564499818', 0, 623, 38, 58, 86),
(624, 'Eos sequi.', '1564499818', 1, 624, 77, 30, 24),
(625, 'Magni doloribus.', '1564499818', 0, 625, 84, 80, 51),
(626, 'Dolorum.', '1564499818', 1, 626, 20, 22, 18),
(627, 'In voluptatibus.', '1564499818', 1, 627, 2, 3, 50),
(628, 'Quaerat magnam vero aut.', '1564499818', 0, 628, 1, 30, 59),
(629, 'Minima non.', '1564499818', 1, 629, 67, 89, 13),
(630, 'Dolores accusamus.', '1564499818', 0, 630, 38, 74, 24),
(631, 'Placeat aliquam aliquam.', '1564499818', 1, 631, 56, 45, 17),
(632, 'Exercitationem nisi dignissimos.', '1564499818', 0, 632, 2, 37, 25),
(633, 'Quo et.', '1564499818', 0, 633, 49, 24, 40),
(634, 'Esse facere.', '1564499818', 1, 634, 96, 16, 13),
(635, 'Explicabo vitae et.', '1564499818', 0, 635, 58, 10, 36),
(636, 'Tempore et enim dolor qui.', '1564499818', 1, 636, 33, 5, 10),
(637, 'Repellendus.', '1564499818', 0, 637, 49, 5, 84),
(638, 'Voluptatem tempora fugit sunt praesentium.', '1564499818', 0, 638, 86, 48, 32),
(639, 'Unde aut voluptatibus.', '1564499818', 0, 639, 12, 57, 74),
(640, 'Debitis vitae itaque.', '1564499818', 1, 640, 37, 50, 41),
(641, 'Numquam et.', '1564499818', 0, 641, 40, 67, 69),
(642, 'Voluptates est impedit.', '1564499818', 1, 642, 62, 61, 76),
(643, 'Sed voluptatem repudiandae.', '1564499818', 1, 643, 57, 62, 53),
(644, 'Non fugiat quod ad.', '1564499818', 1, 644, 19, 24, 94),
(645, 'Accusantium nesciunt ut.', '1564499818', 1, 645, 27, 6, 55),
(646, 'Provident ut non soluta.', '1564499818', 1, 646, 1, 76, 21),
(647, 'Earum aperiam eum quam.', '1564499818', 0, 647, 32, 77, 61),
(648, 'Ut commodi.', '1564499818', 0, 648, 40, 15, 94),
(649, 'Dicta et.', '1564499818', 0, 649, 34, 48, 21),
(650, 'Libero quisquam.', '1564499818', 0, 650, 76, 87, 87),
(651, 'Voluptas aut consequuntur corrupti.', '1564499818', 1, 651, 33, 74, 12),
(652, 'Voluptas.', '1564499818', 1, 652, 89, 4, 7),
(653, 'Consectetur et voluptate corporis.', '1564499818', 0, 653, 58, 65, 61),
(654, 'Sequi adipisci ad quia maiores.', '1564499818', 1, 654, 88, 81, 26),
(655, 'Minima aut veritatis eius.', '1564499818', 0, 655, 7, 45, 17),
(656, 'Est fugit voluptatem quos.', '1564499818', 0, 656, 13, 10, 9),
(657, 'Quas quidem itaque ab.', '1564499818', 0, 657, 8, 41, 88),
(658, 'Asperiores ipsum in.', '1564499818', 1, 658, 21, 24, 92),
(659, 'Consequatur.', '1564499818', 0, 659, 27, 37, 87),
(660, 'Nemo neque in dignissimos reiciendis maiores.', '1564499818', 1, 660, 58, 37, 5),
(661, 'Quas voluptatum sit.', '1564499818', 0, 661, 3, 80, 15),
(662, 'Culpa quibusdam in.', '1564499818', 0, 662, 41, 40, 14),
(663, 'Perspiciatis quod quidem eos rerum suscipit.', '1564499818', 0, 663, 21, 46, 75),
(664, 'Facere et et sed.', '1564499818', 0, 664, 77, 70, 89),
(665, 'Itaque.', '1564499818', 1, 665, 32, 13, 34),
(666, 'Incidunt dignissimos.', '1564499818', 1, 666, 62, 70, 11),
(667, 'Minima.', '1564499818', 0, 667, 11, 19, 15),
(668, 'Aut nihil qui non eveniet.', '1564499818', 1, 668, 21, 13, 92),
(669, 'Iusto sed et.', '1564499818', 1, 669, 92, 24, 27),
(670, 'Aut incidunt inventore.', '1564499818', 0, 670, 44, 94, 19),
(671, 'Eligendi ratione est atque enim.', '1564499818', 1, 671, 70, 57, 51),
(672, 'Praesentium vel quam.', '1564499818', 1, 672, 34, 34, 15),
(673, 'Inventore omnis.', '1564499818', 0, 673, 40, 82, 92),
(674, 'Sint ex rerum.', '1564499818', 0, 674, 33, 24, 67),
(675, 'Porro ea enim nam atque.', '1564499818', 0, 675, 60, 70, 38),
(676, 'Placeat dicta excepturi.', '1564499818', 1, 676, 88, 33, 12),
(677, 'Tempora rerum officiis.', '1564499818', 1, 677, 41, 53, 51),
(678, 'Ducimus nulla quo et.', '1564499819', 1, 678, 66, 5, 85),
(679, 'Voluptate alias blanditiis aut.', '1564499819', 1, 679, 3, 77, 10),
(680, 'Illo voluptatem libero quos.', '1564499819', 1, 680, 37, 14, 51),
(681, 'Iste tempora consequatur quia harum.', '1564499819', 1, 681, 49, 15, 17),
(682, 'Placeat perspiciatis ex.', '1564499819', 1, 682, 44, 43, 57),
(683, 'Dolorem non.', '1564499819', 0, 683, 17, 33, 46),
(684, 'Praesentium aperiam minima quaerat.', '1564499819', 0, 684, 78, 55, 50),
(685, 'Et quisquam nobis iure.', '1564499819', 1, 685, 67, 20, 77),
(686, 'Nesciunt libero fugiat possimus.', '1564499819', 0, 686, 15, 47, 30),
(687, 'Voluptatibus ipsum doloribus qui.', '1564499819', 0, 687, 46, 67, 30),
(688, 'Exercitationem dolore et.', '1564499819', 1, 688, 64, 79, 31),
(689, 'Ut voluptas.', '1564499819', 0, 689, 28, 95, 59),
(690, 'Harum.', '1564499819', 1, 690, 69, 55, 71),
(691, 'Ut.', '1564499819', 1, 691, 87, 59, 42),
(692, 'Excepturi voluptatem.', '1564499819', 1, 692, 52, 26, 48),
(693, 'Voluptatem.', '1564499819', 0, 693, 84, 75, 83),
(694, 'Magnam perferendis.', '1564499819', 1, 694, 4, 32, 28),
(695, 'Repudiandae aspernatur eaque voluptas.', '1564499819', 1, 695, 65, 64, 46),
(696, 'Adipisci minima fuga consequatur.', '1564499819', 1, 696, 2, 27, 72),
(697, 'Est repudiandae similique.', '1564499819', 0, 697, 86, 90, 5),
(698, 'Ratione ut dignissimos aut.', '1564499819', 1, 698, 6, 76, 77),
(699, 'Quasi qui reprehenderit et impedit.', '1564499819', 0, 699, 5, 14, 56),
(700, 'Sit magnam unde.', '1564499819', 0, 700, 56, 77, 5),
(701, 'Vitae.', '1564499819', 0, 701, 55, 84, 17),
(702, 'Aliquid repellat.', '1564499819', 1, 702, 29, 3, 8),
(703, 'Suscipit et nulla omnis.', '1564499819', 1, 703, 9, 61, 46),
(704, 'Ut dolor velit iusto.', '1564499819', 1, 704, 9, 71, 38),
(705, 'Ad corrupti consectetur voluptatem.', '1564499819', 1, 705, 63, 86, 83),
(706, 'Et ut nulla in.', '1564499819', 0, 706, 78, 54, 73),
(707, 'Dolorem ipsa ipsam.', '1564499819', 0, 707, 32, 63, 75),
(708, 'Consequatur explicabo asperiores ut.', '1564499819', 1, 708, 57, 40, 79),
(709, 'Aspernatur nisi ut.', '1564499819', 0, 709, 25, 80, 28),
(710, 'Et deserunt quia.', '1564499819', 0, 710, 96, 40, 24),
(711, 'Nisi saepe ut.', '1564499819', 1, 711, 7, 50, 35),
(712, 'Qui id temporibus.', '1564499819', 1, 712, 53, 22, 47),
(713, 'Sed quo et.', '1564499819', 0, 713, 80, 27, 94),
(714, 'Odit assumenda reprehenderit quaerat expedita.', '1564499819', 1, 714, 31, 5, 55),
(715, 'Ad in quae dolore.', '1564499819', 0, 715, 81, 45, 89),
(716, 'Eaque vero dolorum.', '1564499819', 0, 716, 2, 9, 28),
(717, 'Aut.', '1564499819', 1, 717, 44, 35, 67),
(718, 'Id doloremque at.', '1564499819', 1, 718, 30, 86, 89),
(719, 'Modi ad.', '1564499819', 1, 719, 6, 52, 16),
(720, 'Sint nihil.', '1564499819', 0, 720, 92, 32, 92),
(721, 'In id non.', '1564499819', 0, 721, 47, 90, 37),
(722, 'Quae voluptatem.', '1564499819', 0, 722, 82, 87, 67),
(723, 'Necessitatibus totam numquam repellendus.', '1564499819', 1, 723, 46, 18, 84),
(724, 'Temporibus.', '1564499819', 1, 724, 82, 74, 92),
(725, 'Tempora reprehenderit.', '1564499819', 1, 725, 34, 73, 89),
(726, 'Est excepturi dolore repellendus eos non.', '1564499819', 1, 726, 13, 37, 50),
(727, 'Quis est doloribus.', '1564499819', 1, 727, 77, 15, 1),
(728, 'Quos.', '1564499819', 0, 728, 89, 22, 51),
(729, 'Rerum sunt sed enim.', '1564499819', 0, 729, 4, 32, 42),
(730, 'Sit quisquam maiores rerum.', '1564499819', 0, 730, 3, 6, 17),
(731, 'Officia.', '1564499819', 0, 731, 8, 50, 94),
(732, 'Alias voluptas.', '1564499819', 1, 732, 74, 92, 75),
(733, 'Esse molestiae eum consequatur.', '1564499819', 0, 733, 95, 67, 90),
(734, 'Nam repellat laboriosam cumque libero.', '1564499819', 1, 734, 40, 86, 78),
(735, 'Quo voluptates voluptatibus tenetur.', '1564499819', 0, 735, 68, 28, 86),
(736, 'Quas a officiis omnis.', '1564499819', 0, 736, 51, 91, 96),
(737, 'Quis perspiciatis assumenda.', '1564499819', 0, 737, 13, 83, 78),
(738, 'Inventore.', '1564499819', 1, 738, 68, 32, 47),
(739, 'Repudiandae vero.', '1564499819', 1, 739, 94, 76, 72),
(740, 'Quis pariatur reiciendis.', '1564499819', 1, 740, 25, 2, 67),
(741, 'Nihil.', '1564499819', 0, 741, 1, 59, 89),
(742, 'Quae aut distinctio inventore.', '1564499819', 1, 742, 88, 11, 58),
(743, 'Rem id consequatur.', '1564499819', 0, 743, 16, 27, 79),
(744, 'Aut consequuntur.', '1564499819', 1, 744, 30, 72, 21),
(745, 'Dolorem cum inventore voluptatibus.', '1564499819', 0, 745, 90, 43, 35),
(746, 'Non cupiditate.', '1564499819', 0, 746, 59, 49, 94),
(747, 'Vel saepe.', '1564499819', 0, 747, 73, 85, 66),
(748, 'Pariatur occaecati veniam magnam aperiam.', '1564499819', 1, 748, 79, 36, 46),
(749, 'Nesciunt non exercitationem omnis cumque.', '1564499819', 0, 749, 68, 62, 11),
(750, 'Quam.', '1564499819', 1, 750, 4, 65, 75),
(751, 'Eos cum porro voluptate aliquid.', '1564499819', 0, 751, 83, 31, 7),
(752, 'Illum est.', '1564499819', 1, 752, 77, 53, 16),
(753, 'Provident quaerat.', '1564499819', 1, 753, 1, 88, 9),
(754, 'Eum adipisci.', '1564499819', 0, 754, 94, 84, 46),
(755, 'Accusantium rerum.', '1564499819', 1, 755, 41, 78, 96),
(756, 'Sunt.', '1564499819', 0, 756, 93, 23, 61),
(757, 'Suscipit culpa.', '1564499820', 0, 757, 47, 59, 1),
(758, 'Atque.', '1564499820', 0, 758, 61, 38, 84),
(759, 'Saepe facere fugit.', '1564499820', 1, 759, 29, 38, 47),
(760, 'Suscipit possimus.', '1564499820', 1, 760, 70, 51, 96),
(761, 'Accusamus.', '1564499820', 0, 761, 23, 1, 89),
(762, 'Non facilis voluptatem et.', '1564499820', 0, 762, 63, 4, 12),
(763, 'Mollitia omnis sequi non.', '1564499820', 0, 763, 96, 75, 85),
(764, 'Blanditiis.', '1564499820', 0, 764, 33, 16, 27),
(765, 'Repellat qui iusto.', '1564499820', 0, 765, 1, 68, 39),
(766, 'Ipsam vel omnis quia.', '1564499820', 1, 766, 52, 45, 29),
(767, 'Asperiores unde architecto voluptas veniam numquam.', '1564499820', 0, 767, 37, 63, 85),
(768, 'Voluptatem rem.', '1564499820', 0, 768, 92, 42, 42),
(769, 'Alias incidunt ratione ea.', '1564499820', 0, 769, 57, 33, 46),
(770, 'Minima.', '1564499820', 1, 770, 16, 56, 32),
(771, 'Voluptatem aut.', '1564499820', 1, 771, 29, 85, 80),
(772, 'Sit ea numquam.', '1564499820', 1, 772, 73, 24, 73),
(773, 'Ex quasi in nihil.', '1564499820', 1, 773, 12, 43, 3),
(774, 'Cupiditate aliquid debitis.', '1564499820', 1, 774, 19, 36, 6),
(775, 'Quos eaque.', '1564499820', 0, 775, 37, 23, 61),
(776, 'Dicta.', '1564499820', 0, 776, 44, 48, 62),
(777, 'Quae corporis quia aperiam.', '1564499820', 1, 777, 85, 31, 64),
(778, 'Harum rerum et est aut.', '1564499820', 0, 778, 96, 68, 48),
(779, 'Sit unde ullam.', '1564499820', 1, 779, 20, 32, 30),
(780, 'Sunt quia.', '1564499820', 1, 780, 16, 28, 73),
(781, 'Nihil molestiae id facilis sunt.', '1564499820', 0, 781, 93, 37, 80);
INSERT INTO `messages` (`id`, `messageText`, `dateSent`, `enable_reply`, `messageId`, `userId`, `fromId`, `toId`) VALUES
(782, 'Unde dolores.', '1564499820', 0, 782, 12, 20, 29),
(783, 'Id est quaerat.', '1564499820', 1, 783, 48, 69, 1),
(784, 'Quas ut.', '1564499820', 1, 784, 92, 80, 92),
(785, 'Quia veniam.', '1564499820', 1, 785, 80, 23, 96),
(786, 'Aut praesentium reprehenderit voluptates.', '1564499820', 0, 786, 5, 15, 49),
(787, 'Incidunt sed harum nihil sit eos.', '1564499820', 1, 787, 80, 85, 49),
(788, 'Dolorem alias.', '1564499820', 1, 788, 13, 85, 45),
(789, 'Magnam ratione tenetur nihil.', '1564499820', 0, 789, 95, 8, 17),
(790, 'Rerum eius.', '1564499820', 0, 790, 74, 56, 37),
(791, 'Sapiente ratione nulla.', '1564499820', 1, 791, 94, 71, 29),
(792, 'Sunt facere laboriosam amet voluptatem.', '1564499820', 1, 792, 90, 96, 75),
(793, 'Vitae quod aut.', '1564499820', 0, 793, 8, 73, 4),
(794, 'Qui sunt.', '1564499820', 0, 794, 81, 54, 17),
(795, 'Ut nobis et.', '1564499820', 0, 795, 81, 47, 32),
(796, 'Omnis dolor pariatur quo reprehenderit.', '1564499820', 1, 796, 43, 1, 80),
(797, 'Voluptates autem rerum.', '1564499820', 0, 797, 67, 26, 7),
(798, 'Aperiam voluptatem.', '1564499820', 1, 798, 65, 68, 78),
(799, 'Omnis numquam inventore dolore qui molestiae.', '1564499820', 0, 799, 85, 95, 15),
(800, 'Aut dolores.', '1564499820', 1, 800, 29, 67, 85),
(801, 'Est eaque fugiat perferendis.', '1564499820', 1, 801, 22, 18, 18),
(802, 'Necessitatibus nulla qui dolorem.', '1564499820', 0, 802, 35, 96, 2),
(803, 'Suscipit.', '1564499820', 1, 803, 46, 81, 34),
(804, 'Unde eligendi iure.', '1564499820', 0, 804, 84, 62, 1),
(805, 'Ut.', '1564499820', 0, 805, 64, 77, 37),
(806, 'Et accusamus similique sit.', '1564499820', 1, 806, 23, 52, 29),
(807, 'Eum optio porro ut.', '1564499820', 1, 807, 89, 2, 92),
(808, 'Aliquid nam.', '1564499820', 1, 808, 17, 9, 28),
(809, 'Quaerat aut.', '1564499820', 1, 809, 45, 36, 17),
(810, 'Deleniti hic consequatur.', '1564499820', 1, 810, 22, 88, 74),
(811, 'Hic repudiandae et.', '1564499820', 1, 811, 55, 8, 95),
(812, 'Est illo.', '1564499820', 1, 812, 62, 27, 5),
(813, 'Dolores.', '1564499820', 1, 813, 8, 28, 76),
(814, 'Et.', '1564499820', 1, 814, 62, 76, 16),
(815, 'Mollitia.', '1564499820', 1, 815, 57, 88, 25),
(816, 'Non sapiente dolorem illo.', '1564499820', 1, 816, 22, 43, 92),
(817, 'Magni nisi ut.', '1564499820', 0, 817, 12, 9, 44),
(818, 'Sit.', '1564499820', 0, 818, 19, 96, 5),
(819, 'Laudantium velit numquam.', '1564499820', 0, 819, 20, 60, 36),
(820, 'Ut officiis.', '1564499820', 1, 820, 33, 80, 69),
(821, 'Voluptas sapiente dolores.', '1564499820', 1, 821, 23, 52, 54),
(822, 'Maiores id voluptas accusamus unde.', '1564499820', 1, 822, 3, 42, 39),
(823, 'Consectetur velit aut.', '1564499820', 0, 823, 43, 2, 47),
(824, 'Quaerat.', '1564499820', 0, 824, 46, 94, 96),
(825, 'Animi quia quo.', '1564499820', 0, 825, 68, 84, 71),
(826, 'Atque.', '1564499820', 0, 826, 37, 83, 30),
(827, 'Rem non similique.', '1564499820', 0, 827, 92, 47, 23),
(828, 'Qui assumenda ipsam.', '1564499820', 1, 828, 81, 88, 55),
(829, 'Nihil autem rerum.', '1564499820', 1, 829, 93, 82, 24),
(830, 'Saepe et eos.', '1564499820', 1, 830, 31, 37, 1),
(831, 'Sint quis ipsum harum.', '1564499820', 1, 831, 17, 94, 53),
(832, 'Aut maxime voluptas.', '1564499820', 0, 832, 40, 90, 88),
(833, 'Aut laborum doloribus mollitia omnis molestiae.', '1564499820', 0, 833, 3, 62, 6),
(834, 'Hic voluptatem nam eveniet.', '1564499821', 0, 834, 93, 45, 38),
(835, 'Tempore qui repellendus.', '1564499821', 0, 835, 35, 50, 51),
(836, 'Rerum et tempora.', '1564499821', 1, 836, 75, 27, 87),
(837, 'Ut facere.', '1564499821', 0, 837, 30, 32, 33),
(838, 'Cum rerum.', '1564499821', 1, 838, 19, 53, 91),
(839, 'Quibusdam quibusdam et ut.', '1564499821', 0, 839, 40, 30, 81),
(840, 'Ab molestiae.', '1564499821', 1, 840, 44, 17, 68),
(841, 'Optio.', '1564499821', 0, 841, 33, 51, 33),
(842, 'Voluptates qui expedita.', '1564499821', 0, 842, 87, 41, 61),
(843, 'Et quasi.', '1564499821', 0, 843, 85, 59, 52),
(844, 'Ut qui.', '1564499821', 1, 844, 46, 14, 91),
(845, 'Sunt architecto inventore reprehenderit.', '1564499821', 1, 845, 56, 96, 31),
(846, 'Similique cum sint.', '1564499821', 1, 846, 38, 91, 7),
(847, 'Officiis.', '1564499821', 0, 847, 93, 49, 47),
(848, 'Saepe.', '1564499821', 0, 848, 16, 47, 44),
(849, 'Odio aut ipsa aut.', '1564499821', 1, 849, 12, 8, 84),
(850, 'Quas et.', '1564499821', 1, 850, 67, 17, 94),
(851, 'Quia id.', '1564499821', 0, 851, 82, 51, 89),
(852, 'Vitae eos ipsam qui.', '1564499821', 0, 852, 13, 93, 75),
(853, 'Exercitationem veritatis enim et.', '1564499821', 1, 853, 65, 67, 26),
(854, 'Quis impedit.', '1564499821', 0, 854, 36, 8, 21),
(855, 'Doloremque ut.', '1564499821', 0, 855, 53, 51, 47),
(856, 'Quam.', '1564499821', 0, 856, 8, 36, 35),
(857, 'Porro mollitia.', '1564499821', 0, 857, 41, 76, 30),
(858, 'Iste.', '1564499821', 0, 858, 86, 51, 39),
(859, 'Expedita iste libero ex.', '1564499821', 0, 859, 21, 54, 35),
(860, 'Aspernatur reiciendis.', '1564499821', 0, 860, 71, 89, 4),
(861, 'Reprehenderit numquam.', '1564499821', 0, 861, 95, 43, 27),
(862, 'Qui.', '1564499821', 1, 862, 93, 85, 29),
(863, 'Quia repellendus.', '1564499821', 0, 863, 22, 1, 36),
(864, 'Enim corporis est.', '1564499821', 1, 864, 26, 51, 82),
(865, 'Eos ab aut officiis.', '1564499821', 1, 865, 65, 18, 77),
(866, 'Facilis quibusdam sequi.', '1564499821', 0, 866, 24, 58, 9),
(867, 'Fugiat nihil soluta.', '1564499821', 0, 867, 37, 38, 86),
(868, 'Assumenda quos nobis.', '1564499821', 0, 868, 87, 75, 90),
(869, 'Molestiae quisquam dolorum.', '1564499821', 0, 869, 18, 45, 84),
(870, 'Ea dolorem voluptatibus.', '1564499821', 0, 870, 44, 82, 15),
(871, 'Itaque in.', '1564499821', 1, 871, 27, 66, 47),
(872, 'Corporis qui animi eum voluptatem.', '1564499821', 1, 872, 11, 5, 96),
(873, 'Odit est labore distinctio voluptas.', '1564499821', 0, 873, 26, 82, 22),
(874, 'Ab eveniet enim.', '1564499821', 1, 874, 70, 22, 3),
(875, 'Dolores voluptas.', '1564499821', 1, 875, 6, 34, 31),
(876, 'Est dignissimos quasi aut enim suscipit.', '1564499821', 1, 876, 20, 60, 10),
(877, 'Architecto excepturi.', '1564499821', 1, 877, 17, 55, 64),
(878, 'Sit sit.', '1564499821', 1, 878, 16, 38, 75),
(879, 'Cum molestiae aut.', '1564499821', 0, 879, 38, 74, 75),
(880, 'Eaque enim ea numquam.', '1564499821', 1, 880, 41, 77, 52),
(881, 'Ea ut quia in.', '1564499821', 0, 881, 79, 68, 25),
(882, 'Qui aut sint.', '1564499821', 0, 882, 51, 50, 6),
(883, 'Voluptas earum.', '1564499821', 1, 883, 27, 34, 73),
(884, 'Rerum saepe.', '1564499821', 1, 884, 40, 34, 13),
(885, 'Quia optio.', '1564499821', 1, 885, 12, 93, 7),
(886, 'Assumenda laborum quos laborum eveniet.', '1564499821', 0, 886, 2, 94, 91),
(887, 'Qui est repellat dignissimos.', '1564499821', 1, 887, 47, 39, 79),
(888, 'Ad sunt eum.', '1564499821', 0, 888, 92, 37, 28),
(889, 'Quisquam.', '1564499821', 1, 889, 88, 58, 77),
(890, 'Eos culpa soluta sed.', '1564499821', 1, 890, 6, 26, 96),
(891, 'Eos maxime.', '1564499821', 0, 891, 53, 32, 66),
(892, 'Accusamus assumenda non dolor.', '1564499821', 0, 892, 56, 92, 30),
(893, 'Neque et.', '1564499821', 1, 893, 41, 28, 57),
(894, 'Excepturi earum.', '1564499821', 0, 894, 69, 23, 4),
(895, 'Voluptatem aut aliquid quis doloremque.', '1564499821', 1, 895, 5, 59, 12),
(896, 'Quibusdam id illum.', '1564499821', 1, 896, 53, 19, 28),
(897, 'Voluptatum quidem odit debitis.', '1564499821', 1, 897, 47, 46, 50),
(898, 'Ut est quas aliquid consequatur.', '1564499821', 0, 898, 28, 45, 65),
(899, 'Deleniti illum itaque.', '1564499821', 0, 899, 18, 33, 43),
(900, 'Quia et dolores ex fugit.', '1564499821', 0, 900, 68, 67, 49),
(901, 'Soluta nam quidem exercitationem.', '1564499821', 1, 901, 38, 86, 12),
(902, 'Libero ad non.', '1564499821', 1, 902, 25, 25, 92),
(903, 'Sit est expedita.', '1564499821', 1, 903, 50, 95, 30),
(904, 'Quis consequatur eius fugit.', '1564499821', 0, 904, 68, 54, 16),
(905, 'Et.', '1564499821', 1, 905, 72, 61, 3),
(906, 'Officia et voluptas quam.', '1564499821', 1, 906, 90, 21, 42),
(907, 'Doloribus qui est consectetur incidunt.', '1564499822', 0, 907, 67, 52, 56),
(908, 'Laudantium enim ipsam ducimus eligendi ea.', '1564499822', 0, 908, 79, 33, 51),
(909, 'Cumque repellendus tempora.', '1564499822', 0, 909, 18, 90, 86),
(910, 'Deserunt hic.', '1564499822', 1, 910, 2, 10, 26),
(911, 'Occaecati aut maiores mollitia sint quisquam.', '1564499822', 1, 911, 24, 66, 58),
(912, 'Deserunt nostrum qui id sit.', '1564499822', 0, 912, 57, 44, 52),
(913, 'Voluptatem.', '1564499822', 0, 913, 89, 20, 41),
(914, 'Libero ex ipsum.', '1564499822', 1, 914, 81, 32, 92),
(915, 'Numquam ut corporis odit.', '1564499822', 0, 915, 82, 1, 55),
(916, 'Distinctio at.', '1564499822', 1, 916, 64, 90, 74),
(917, 'Et fugit tempora eligendi facilis.', '1564499822', 1, 917, 74, 51, 27),
(918, 'Iure ipsam.', '1564499822', 0, 918, 48, 29, 43),
(919, 'Enim consequuntur.', '1564499822', 1, 919, 19, 19, 32),
(920, 'Recusandae.', '1564499822', 1, 920, 76, 35, 50),
(921, 'Ut voluptate magnam necessitatibus.', '1564499822', 0, 921, 79, 31, 1),
(922, 'Eligendi laudantium.', '1564499822', 1, 922, 37, 36, 58),
(923, 'Est enim dolores.', '1564499822', 1, 923, 36, 33, 19),
(924, 'Ea.', '1564499822', 1, 924, 72, 8, 28),
(925, 'Tempore reprehenderit omnis.', '1564499822', 1, 925, 40, 41, 81),
(926, 'Deleniti nihil minima velit iste.', '1564499822', 1, 926, 59, 39, 91),
(927, 'Dolores atque illo.', '1564499822', 1, 927, 90, 64, 65),
(928, 'Repellendus non.', '1564499822', 0, 928, 13, 44, 24),
(929, 'Culpa corporis soluta.', '1564499822', 0, 929, 95, 96, 41),
(930, 'Et et non.', '1564499822', 0, 930, 40, 48, 53),
(931, 'Itaque aut.', '1564499822', 0, 931, 53, 5, 48),
(932, 'Sequi rem.', '1564499822', 0, 932, 13, 41, 13),
(933, 'Commodi.', '1564499822', 0, 933, 57, 56, 62),
(934, 'Ut quisquam.', '1564499822', 0, 934, 21, 83, 11),
(935, 'Ad earum totam.', '1564499822', 0, 935, 44, 41, 69),
(936, 'Illo ut aut aperiam.', '1564499822', 0, 936, 45, 13, 95),
(937, 'Reprehenderit nisi sed velit.', '1564499822', 1, 937, 86, 72, 66),
(938, 'Dolore optio.', '1564499822', 1, 938, 92, 67, 32),
(939, 'Numquam quae.', '1564499822', 1, 939, 49, 74, 53),
(940, 'Corrupti praesentium distinctio quasi error.', '1564499822', 1, 940, 9, 80, 81),
(941, 'Pariatur magnam repellat accusantium.', '1564499822', 0, 941, 45, 50, 92),
(942, 'Voluptatem tenetur adipisci et.', '1564499822', 1, 942, 69, 82, 36),
(943, 'Quasi est quo voluptatem optio fugiat.', '1564499822', 0, 943, 74, 63, 25),
(944, 'Ipsa nihil.', '1564499822', 1, 944, 37, 51, 67),
(945, 'Culpa doloremque qui tenetur.', '1564499822', 1, 945, 25, 20, 86),
(946, 'Quasi quibusdam cumque.', '1564499822', 1, 946, 22, 9, 11),
(947, 'Saepe qui rerum exercitationem.', '1564499822', 0, 947, 57, 6, 81),
(948, 'Delectus similique est est.', '1564499822', 1, 948, 45, 43, 48),
(949, 'Et nisi.', '1564499822', 1, 949, 43, 78, 2),
(950, 'Fuga inventore.', '1564499822', 0, 950, 21, 66, 17),
(951, 'Nulla ut commodi modi.', '1564499822', 0, 951, 49, 53, 86),
(952, 'Reiciendis eum exercitationem enim.', '1564499822', 0, 952, 65, 8, 68),
(953, 'Delectus voluptas.', '1564499822', 0, 953, 3, 88, 20),
(954, 'Earum facilis quibusdam dicta non.', '1564499822', 1, 954, 84, 39, 8),
(955, 'Quidem velit officiis molestiae natus iusto.', '1564499822', 0, 955, 47, 82, 71),
(956, 'Illum unde earum.', '1564499822', 1, 956, 41, 79, 84),
(957, 'Ut culpa facere.', '1564499822', 0, 957, 46, 30, 52),
(958, 'Ipsam et ipsam aut.', '1564499822', 1, 958, 23, 76, 43),
(959, 'Atque.', '1564499822', 0, 959, 30, 8, 95),
(960, 'Saepe dolor harum suscipit.', '1564499822', 0, 960, 74, 20, 44),
(961, 'Quia fugiat placeat molestiae quia dolorem.', '1564499822', 1, 961, 64, 29, 57),
(962, 'Nesciunt quo aut numquam.', '1564499822', 0, 962, 63, 47, 18),
(963, 'Repellendus animi odit.', '1564499822', 0, 963, 83, 94, 85),
(964, 'Est saepe illo.', '1564499822', 1, 964, 69, 76, 5),
(965, 'Atque similique laborum voluptates omnis.', '1564499822', 1, 965, 50, 20, 58),
(966, 'Mollitia nihil est.', '1564499822', 1, 966, 79, 27, 42),
(967, 'Atque hic.', '1564499822', 0, 967, 60, 62, 22),
(968, 'Qui dolor voluptate.', '1564499822', 0, 968, 1, 20, 72),
(969, 'Qui esse quod qui odit voluptatibus.', '1564499822', 1, 969, 38, 29, 74),
(970, 'Et quasi.', '1564499822', 0, 970, 34, 16, 77),
(971, 'Ea hic.', '1564499822', 0, 971, 88, 52, 13),
(972, 'Alias praesentium.', '1564499822', 0, 972, 51, 20, 76),
(973, 'Praesentium.', '1564499822', 1, 973, 2, 23, 96),
(974, 'Minima ex.', '1564499822', 0, 974, 66, 79, 50),
(975, 'Ut voluptatem eos.', '1564499822', 0, 975, 56, 42, 85),
(976, 'Maiores impedit.', '1564499822', 0, 976, 83, 60, 26),
(977, 'Molestiae.', '1564499822', 1, 977, 26, 34, 31),
(978, 'Ullam.', '1564499822', 0, 978, 84, 18, 67),
(979, 'Cumque facilis quia commodi ea.', '1564499822', 1, 979, 3, 77, 23),
(980, 'Voluptas doloremque error beatae.', '1564499822', 1, 980, 25, 76, 39),
(981, 'Culpa aut omnis.', '1564499822', 1, 981, 95, 67, 49),
(982, 'Id quae.', '1564499822', 1, 982, 26, 78, 56),
(983, 'Laboriosam quasi nemo optio aut consequuntur.', '1564499822', 0, 983, 75, 1, 42),
(984, 'Doloribus assumenda quae sed id quam.', '1564499822', 1, 984, 32, 65, 79),
(985, 'Minima.', '1564499822', 0, 985, 68, 18, 47),
(986, 'In culpa animi magni.', '1564499822', 0, 986, 62, 12, 30),
(987, 'Similique provident necessitatibus autem.', '1564499822', 0, 987, 5, 92, 89),
(988, 'Neque voluptate asperiores dignissimos quia.', '1564499822', 1, 988, 37, 20, 43),
(989, 'Tempore itaque harum provident.', '1564499822', 0, 989, 31, 87, 80),
(990, 'Voluptates in molestiae.', '1564499822', 1, 990, 88, 57, 66),
(991, 'Consectetur et.', '1564499822', 0, 991, 16, 52, 56),
(992, 'Quia vel recusandae.', '1564499822', 1, 992, 4, 11, 47),
(993, 'Maiores ut.', '1564499822', 1, 993, 62, 59, 3),
(994, 'Adipisci nihil illo.', '1564499822', 0, 994, 49, 43, 13),
(995, 'Vel iste.', '1564499822', 1, 995, 72, 95, 42),
(996, 'Ut dolores saepe.', '1564499822', 1, 996, 54, 13, 62),
(997, 'Et totam ipsum amet iusto.', '1564499822', 1, 997, 75, 67, 82),
(998, 'Eius ea.', '1564499822', 1, 998, 26, 47, 84),
(999, 'Sequi aut.', '1564499822', 0, 999, 5, 72, 25),
(1000, 'Facilis.', '1564499822', 1, 1000, 57, 8, 44);

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
(1, 'Voluptatum debitis aut.', '1564499806', 0, 0, 72, 30),
(2, 'Qui mollitia.', '1564499806', 1, 1, 68, 93),
(3, 'Non.', '1564499806', 1, 1, 96, 88),
(4, 'Consectetur quo.', '1564499806', 0, 1, 77, 34),
(5, 'Molestiae aspernatur consequuntur velit rem eum.', '1564499806', 0, 0, 42, 45),
(6, 'Voluptates dolores porro qui quam.', '1564499806', 0, 0, 62, 62),
(7, 'Est illum ducimus.', '1564499806', 1, 0, 95, 51),
(8, 'Et accusantium.', '1564499806', 0, 0, 77, 63),
(9, 'Laborum voluptatem.', '1564499806', 1, 1, 94, 78),
(10, 'Dignissimos quae.', '1564499806', 0, 1, 26, 94),
(11, 'Eius impedit in qui et et.', '1564499806', 0, 1, 73, 63),
(12, 'Consequatur qui velit et nemo in.', '1564499806', 0, 1, 21, 88),
(13, 'Molestiae.', '1564499806', 0, 1, 71, 54),
(14, 'Quae exercitationem.', '1564499806', 0, 1, 76, 85),
(15, 'Sequi porro consectetur.', '1564499806', 1, 0, 43, 20),
(16, 'Deserunt ratione perspiciatis porro.', '1564499806', 0, 0, 80, 17),
(17, 'Architecto tenetur ipsa est expedita.', '1564499806', 0, 1, 42, 8),
(18, 'Voluptas consequatur laboriosam vel.', '1564499806', 1, 0, 14, 33),
(19, 'Laborum maiores.', '1564499806', 1, 0, 12, 27),
(20, 'Ipsam molestiae nemo.', '1564499806', 1, 1, 68, 33),
(21, 'Quis.', '1564499806', 0, 1, 2, 70),
(22, 'Voluptas est.', '1564499806', 1, 1, 23, 3),
(23, 'Deserunt iusto maxime eius.', '1564499806', 1, 1, 63, 78),
(24, 'Facere error.', '1564499806', 1, 0, 58, 53),
(25, 'Commodi autem et.', '1564499806', 0, 0, 68, 50),
(26, 'Sint doloribus eligendi.', '1564499806', 1, 1, 3, 38),
(27, 'Officiis veniam.', '1564499806', 1, 1, 94, 9),
(28, 'Ipsa.', '1564499806', 0, 1, 45, 77),
(29, 'Culpa qui amet.', '1564499806', 1, 0, 72, 88),
(30, 'Est illum.', '1564499806', 0, 0, 64, 51),
(31, 'Non et quas.', '1564499806', 1, 1, 45, 61),
(32, 'Accusamus sint.', '1564499806', 0, 1, 90, 33),
(33, 'Vel sit qui fugiat.', '1564499806', 1, 1, 81, 14),
(34, 'Illum.', '1564499806', 1, 1, 60, 47),
(35, 'Accusamus repellat pariatur.', '1564499806', 0, 1, 3, 53),
(36, 'Maxime deleniti vel perferendis.', '1564499806', 0, 1, 21, 66),
(37, 'Nesciunt qui nemo.', '1564499806', 0, 0, 63, 90),
(38, 'Quia tempora debitis est explicabo et.', '1564499806', 1, 1, 82, 77),
(39, 'Odit asperiores voluptas assumenda aliquam dolor.', '1564499806', 1, 1, 76, 30),
(40, 'Delectus aut eveniet.', '1564499806', 1, 1, 36, 37),
(41, 'Et inventore.', '1564499806', 0, 1, 71, 54),
(42, 'Qui cumque quasi.', '1564499806', 0, 1, 84, 38),
(43, 'Assumenda veritatis officia rerum magnam totam.', '1564499806', 1, 1, 53, 63),
(44, 'Ullam ab.', '1564499806', 0, 1, 17, 85),
(45, 'Accusantium earum.', '1564499806', 0, 1, 79, 47),
(46, 'Quasi vel et assumenda.', '1564499806', 0, 0, 86, 63),
(47, 'Et sit doloremque occaecati.', '1564499806', 0, 0, 6, 17),
(48, 'Sunt voluptas.', '1564499806', 0, 1, 65, 67),
(49, 'Cupiditate ut architecto tenetur hic fuga.', '1564499806', 1, 1, 73, 5),
(50, 'Voluptatem molestias cum.', '1564499806', 1, 1, 90, 65),
(51, 'Occaecati voluptates voluptatem suscipit.', '1564499806', 0, 0, 2, 24),
(52, 'Et dolore minus.', '1564499806', 0, 0, 61, 10),
(53, 'Vel nostrum.', '1564499806', 0, 1, 19, 35),
(54, 'Ut enim.', '1564499806', 0, 0, 50, 60),
(55, 'Eligendi non earum.', '1564499806', 0, 0, 30, 82),
(56, 'Fugit eius et.', '1564499806', 1, 0, 35, 95),
(57, 'Aspernatur iste est minima officiis.', '1564499806', 0, 1, 39, 8),
(58, 'Rerum.', '1564499806', 0, 0, 75, 4),
(59, 'Voluptas est.', '1564499806', 1, 0, 35, 54),
(60, 'Quia provident nihil ullam.', '1564499806', 1, 0, 90, 58),
(61, 'Inventore eum molestiae.', '1564499806', 0, 1, 93, 88),
(62, 'Qui et eaque ut.', '1564499806', 0, 0, 30, 16),
(63, 'Iure id.', '1564499806', 1, 1, 51, 76),
(64, 'Ea vel voluptate.', '1564499806', 0, 0, 16, 40),
(65, 'Quas.', '1564499806', 1, 1, 77, 33),
(66, 'Voluptatem ad velit accusamus.', '1564499806', 0, 0, 7, 2),
(67, 'Laboriosam ut dolores.', '1564499806', 0, 1, 63, 51),
(68, 'Eos iure.', '1564499806', 1, 0, 83, 15),
(69, 'Accusamus qui nisi sapiente earum.', '1564499806', 1, 1, 89, 34),
(70, 'Omnis.', '1564499806', 0, 0, 53, 86),
(71, 'Exercitationem saepe ut recusandae sit.', '1564499806', 0, 1, 81, 79),
(72, 'Impedit nisi quo velit.', '1564499806', 1, 0, 69, 77),
(73, 'Doloribus omnis minima voluptas possimus.', '1564499806', 0, 0, 64, 87),
(74, 'In dicta voluptatem est possimus et.', '1564499806', 0, 0, 49, 56),
(75, 'Porro alias.', '1564499806', 0, 0, 21, 23),
(76, 'Laborum ut officiis qui omnis.', '1564499806', 0, 0, 84, 63),
(77, 'Fugit.', '1564499806', 0, 1, 75, 63),
(78, 'Quibusdam recusandae.', '1564499806', 0, 0, 81, 64),
(79, 'Voluptatem non dolorum voluptate.', '1564499806', 0, 0, 68, 9),
(80, 'Recusandae nulla.', '1564499806', 0, 1, 64, 70),
(81, 'Nam tempore architecto.', '1564499806', 0, 1, 59, 51),
(82, 'Iusto adipisci aut.', '1564499807', 0, 1, 68, 30),
(83, 'Eum sed soluta.', '1564499807', 0, 0, 12, 28),
(84, 'Eos voluptatibus tempore dolor occaecati.', '1564499807', 1, 0, 92, 62),
(85, 'Veritatis quasi magnam.', '1564499807', 1, 0, 19, 63),
(86, 'Ut sequi perferendis saepe voluptatum.', '1564499807', 0, 1, 76, 91),
(87, 'Facilis nulla ut.', '1564499807', 0, 0, 32, 35),
(88, 'Id nemo occaecati.', '1564499807', 0, 0, 24, 78),
(89, 'Dolores.', '1564499807', 1, 0, 60, 57),
(90, 'In sunt hic ipsam.', '1564499807', 1, 1, 82, 23),
(91, 'Dolores voluptatibus soluta.', '1564499807', 1, 1, 37, 40),
(92, 'Eum quis fugit.', '1564499807', 1, 1, 32, 61),
(93, 'Tempore accusantium atque qui.', '1564499807', 1, 1, 62, 73),
(94, 'Officiis.', '1564499807', 1, 0, 47, 83),
(95, 'Illum non nulla.', '1564499807', 0, 1, 24, 48),
(96, 'Voluptas quibusdam aut.', '1564499807', 1, 0, 72, 53),
(97, 'Modi.', '1564499807', 1, 1, 56, 24),
(98, 'Delectus voluptatibus aut eos.', '1564499807', 0, 0, 33, 22),
(99, 'Optio repudiandae quis aspernatur.', '1564499807', 0, 1, 60, 86),
(100, 'Est corrupti perferendis corporis ut maxime.', '1564499807', 1, 1, 60, 49),
(101, 'Et consequatur corrupti.', '1564499807', 1, 1, 49, 59),
(102, 'Eaque.', '1564499807', 1, 1, 37, 8),
(103, 'Sunt sunt.', '1564499807', 0, 1, 9, 35),
(104, 'Et molestiae vel.', '1564499807', 0, 1, 64, 91),
(105, 'At maiores.', '1564499807', 1, 0, 38, 22),
(106, 'Est velit fuga.', '1564499807', 0, 0, 29, 65),
(107, 'Autem.', '1564499807', 0, 1, 12, 14),
(108, 'Placeat repellendus quo quis voluptas.', '1564499807', 0, 0, 4, 78),
(109, 'Ullam earum ab doloribus.', '1564499807', 1, 0, 18, 38),
(110, 'Delectus voluptatibus enim qui nisi.', '1564499807', 0, 1, 21, 90),
(111, 'Mollitia beatae placeat.', '1564499807', 1, 1, 47, 86),
(112, 'Dolorum eum natus.', '1564499807', 0, 1, 60, 21),
(113, 'Esse dolorem veritatis.', '1564499807', 1, 0, 39, 62),
(114, 'Praesentium et.', '1564499807', 1, 0, 31, 31),
(115, 'Inventore vero quia.', '1564499807', 0, 0, 1, 36),
(116, 'Illo aperiam sed ut.', '1564499807', 0, 0, 65, 42),
(117, 'Commodi deleniti ut.', '1564499807', 1, 1, 70, 39),
(118, 'Et voluptatem qui vel.', '1564499807', 1, 0, 14, 34),
(119, 'Dicta quia distinctio.', '1564499807', 0, 0, 32, 67),
(120, 'Quis dolores dolorum.', '1564499807', 1, 0, 5, 15),
(121, 'In quo.', '1564499807', 1, 1, 18, 28),
(122, 'Qui praesentium ut.', '1564499807', 0, 1, 63, 40),
(123, 'Ut.', '1564499807', 0, 1, 24, 39),
(124, 'Est ipsam et sit autem omnis.', '1564499807', 1, 1, 11, 7),
(125, 'Dolorem aspernatur a eum voluptates quis.', '1564499807', 1, 0, 33, 1),
(126, 'Assumenda corrupti consequatur quis.', '1564499807', 0, 1, 8, 73),
(127, 'Optio sunt repudiandae sed hic.', '1564499807', 0, 0, 64, 59),
(128, 'Rerum deleniti eos.', '1564499807', 0, 1, 15, 1),
(129, 'Aspernatur.', '1564499807', 0, 1, 44, 85),
(130, 'Beatae sed quas.', '1564499807', 0, 1, 50, 92),
(131, 'Repudiandae voluptatem.', '1564499807', 1, 0, 75, 78),
(132, 'Blanditiis voluptas amet aut.', '1564499807', 0, 0, 83, 85),
(133, 'Odio porro blanditiis hic quis.', '1564499807', 0, 0, 10, 48),
(134, 'Nobis et modi repellat.', '1564499807', 1, 0, 7, 56),
(135, 'Molestiae eveniet totam vero.', '1564499807', 1, 1, 83, 58),
(136, 'Mollitia.', '1564499807', 1, 1, 24, 42),
(137, 'Repudiandae sed qui.', '1564499807', 0, 1, 2, 59),
(138, 'Dolor cumque nesciunt modi labore.', '1564499807', 1, 1, 31, 33),
(139, 'Dolores velit eaque harum.', '1564499807', 1, 0, 77, 40),
(140, 'Qui et doloremque dignissimos assumenda.', '1564499807', 1, 0, 58, 20),
(141, 'Aut ut nihil velit.', '1564499807', 1, 1, 23, 22),
(142, 'Ducimus incidunt.', '1564499807', 1, 0, 51, 47),
(143, 'Delectus qui.', '1564499807', 1, 1, 72, 6),
(144, 'Ad modi.', '1564499807', 1, 0, 50, 74),
(145, 'Sed aut eveniet.', '1564499807', 1, 1, 26, 5),
(146, 'Nam maiores sunt voluptatum enim.', '1564499807', 0, 1, 32, 66),
(147, 'Sed sint temporibus.', '1564499807', 1, 0, 37, 27),
(148, 'Omnis.', '1564499807', 1, 0, 89, 94),
(149, 'Ut distinctio omnis suscipit.', '1564499807', 0, 1, 70, 79),
(150, 'Et vero eius.', '1564499807', 1, 1, 59, 82),
(151, 'Minus eos.', '1564499807', 1, 0, 53, 68),
(152, 'Consequatur optio impedit.', '1564499807', 0, 1, 63, 48),
(153, 'Qui qui enim.', '1564499807', 0, 0, 69, 53),
(154, 'Reiciendis mollitia omnis laudantium.', '1564499807', 0, 0, 91, 24),
(155, 'Eum nihil.', '1564499807', 0, 1, 54, 71),
(156, 'Voluptatem recusandae.', '1564499807', 1, 1, 47, 17),
(157, 'Sed voluptatem.', '1564499807', 1, 1, 16, 7),
(158, 'Beatae.', '1564499807', 0, 1, 93, 81),
(159, 'Fugit dolor dignissimos maiores.', '1564499807', 0, 1, 27, 41),
(160, 'Aperiam corporis alias.', '1564499807', 1, 0, 38, 95),
(161, 'Ratione dolores dolores facilis maiores.', '1564499808', 1, 0, 83, 68),
(162, 'Odit porro sed.', '1564499808', 1, 0, 85, 69),
(163, 'Eum sit.', '1564499808', 0, 0, 91, 65),
(164, 'Rerum reiciendis omnis.', '1564499808', 0, 0, 42, 6),
(165, 'Voluptatem et et.', '1564499808', 1, 1, 38, 91),
(166, 'Culpa nihil et porro est labore.', '1564499808', 1, 1, 16, 96),
(167, 'Et atque beatae.', '1564499808', 0, 0, 74, 78),
(168, 'Laboriosam qui omnis beatae.', '1564499808', 1, 1, 35, 90),
(169, 'Sint esse quos.', '1564499808', 0, 1, 84, 49),
(170, 'Vero sed et.', '1564499808', 1, 1, 85, 38),
(171, 'Et quia laudantium.', '1564499808', 0, 0, 65, 67),
(172, 'Perferendis.', '1564499808', 0, 0, 65, 33),
(173, 'Et reiciendis expedita excepturi.', '1564499808', 0, 0, 94, 82),
(174, 'Magni tenetur adipisci sint occaecati eos.', '1564499808', 1, 0, 61, 50),
(175, 'Recusandae quia.', '1564499808', 1, 0, 85, 40),
(176, 'Ducimus in est similique eum.', '1564499808', 0, 1, 32, 79),
(177, 'Quia.', '1564499808', 1, 0, 85, 19),
(178, 'Officiis molestias quod aut et.', '1564499808', 1, 1, 49, 44),
(179, 'Hic corrupti placeat.', '1564499808', 1, 1, 63, 80),
(180, 'Consequatur suscipit quia.', '1564499808', 0, 0, 13, 38),
(181, 'Nihil magnam corrupti.', '1564499808', 1, 0, 88, 92),
(182, 'Officia dolorum.', '1564499808', 1, 0, 4, 57),
(183, 'Sapiente.', '1564499808', 1, 0, 90, 50),
(184, 'Rerum quibusdam sapiente aut.', '1564499808', 1, 1, 86, 86),
(185, 'Consectetur dicta ex occaecati.', '1564499808', 0, 1, 29, 60),
(186, 'Illo molestiae voluptatem.', '1564499808', 1, 0, 42, 52),
(187, 'Ratione quia ipsum.', '1564499808', 0, 1, 13, 16),
(188, 'Est voluptas ut.', '1564499808', 1, 0, 67, 49),
(189, 'Et nemo maiores voluptatem dolores voluptates.', '1564499808', 0, 0, 26, 3),
(190, 'Rerum ipsum nam.', '1564499808', 1, 1, 50, 35),
(191, 'Quidem aut veniam.', '1564499808', 0, 1, 9, 10),
(192, 'Eum accusantium atque minus repellendus.', '1564499808', 1, 0, 22, 61),
(193, 'Assumenda.', '1564499808', 1, 0, 16, 60),
(194, 'Dolor facere.', '1564499808', 0, 0, 56, 81),
(195, 'Vero placeat beatae.', '1564499808', 0, 1, 37, 36),
(196, 'Suscipit omnis.', '1564499808', 0, 0, 25, 11),
(197, 'Rerum ullam.', '1564499808', 1, 0, 12, 92),
(198, 'Architecto quia.', '1564499808', 1, 1, 65, 15),
(199, 'Minus quas.', '1564499808', 1, 1, 88, 12),
(200, 'Eligendi ut facere unde earum.', '1564499808', 0, 0, 78, 64),
(201, 'Error.', '1564499808', 1, 0, 78, 37),
(202, 'Incidunt mollitia.', '1564499808', 0, 0, 75, 13),
(203, 'Natus laboriosam qui.', '1564499808', 1, 0, 52, 91),
(204, 'Possimus quod.', '1564499808', 0, 1, 18, 77),
(205, 'Nobis placeat sit inventore.', '1564499808', 0, 0, 52, 23),
(206, 'Laborum.', '1564499808', 1, 0, 95, 73),
(207, 'Et corrupti dicta error molestias minus.', '1564499808', 0, 0, 24, 4),
(208, 'Ab suscipit tempore aperiam sit.', '1564499808', 1, 1, 81, 31),
(209, 'Veniam exercitationem et.', '1564499808', 0, 1, 92, 39),
(210, 'Occaecati praesentium.', '1564499808', 1, 0, 16, 11),
(211, 'Corporis magnam repellendus nisi.', '1564499808', 0, 0, 88, 58),
(212, 'Quae consectetur voluptate nesciunt culpa.', '1564499808', 0, 0, 49, 56),
(213, 'Explicabo quae ipsam sed minima.', '1564499808', 1, 1, 64, 64),
(214, 'Sit maiores cum.', '1564499808', 0, 1, 62, 52),
(215, 'Odit hic quasi.', '1564499808', 0, 1, 43, 36),
(216, 'Sunt est et consectetur ducimus soluta.', '1564499808', 0, 0, 95, 9),
(217, 'Non aut consequatur dolore.', '1564499808', 0, 0, 60, 64),
(218, 'Iste.', '1564499808', 1, 1, 38, 91),
(219, 'Veritatis ut.', '1564499808', 0, 0, 94, 30),
(220, 'Ut atque.', '1564499808', 1, 1, 30, 68),
(221, 'Dolores impedit aut sunt.', '1564499808', 0, 1, 30, 26),
(222, 'Nihil deleniti.', '1564499808', 1, 0, 16, 41),
(223, 'Et sed.', '1564499808', 0, 1, 62, 75),
(224, 'Id quam.', '1564499808', 1, 1, 13, 42),
(225, 'Omnis aut nihil ex eum.', '1564499808', 0, 1, 70, 66),
(226, 'Nihil sit sit magni voluptatem.', '1564499808', 0, 1, 73, 23),
(227, 'Eligendi perspiciatis et accusamus beatae ipsa.', '1564499808', 1, 1, 74, 40),
(228, 'Atque.', '1564499808', 0, 1, 40, 94),
(229, 'Consequatur expedita perspiciatis officia.', '1564499808', 0, 1, 7, 2),
(230, 'Atque voluptatem.', '1564499808', 1, 1, 3, 23),
(231, 'Dolor provident quod qui illo.', '1564499808', 0, 0, 41, 69),
(232, 'Facilis et voluptates.', '1564499808', 1, 1, 48, 79),
(233, 'Voluptas atque.', '1564499808', 0, 1, 36, 43),
(234, 'Quas veritatis sapiente unde.', '1564499808', 1, 1, 50, 31),
(235, 'Odio quo architecto.', '1564499808', 1, 0, 49, 7),
(236, 'Et repudiandae.', '1564499808', 0, 1, 30, 68),
(237, 'Dignissimos.', '1564499809', 1, 0, 17, 5),
(238, 'Nesciunt corrupti accusantium.', '1564499809', 0, 1, 9, 62),
(239, 'Unde.', '1564499809', 0, 1, 56, 26),
(240, 'Quas.', '1564499809', 0, 1, 39, 20),
(241, 'Et.', '1564499809', 0, 0, 90, 21),
(242, 'Reiciendis omnis.', '1564499809', 0, 0, 9, 41),
(243, 'Doloribus doloremque.', '1564499809', 0, 1, 28, 3),
(244, 'Dicta dolores.', '1564499809', 1, 1, 88, 44),
(245, 'Fugit.', '1564499809', 0, 1, 42, 46),
(246, 'At sequi.', '1564499809', 0, 1, 1, 33),
(247, 'Enim aut ipsam et voluptatem molestiae.', '1564499809', 1, 0, 7, 68),
(248, 'Sequi soluta magnam.', '1564499809', 0, 0, 29, 91),
(249, 'Maiores aut.', '1564499809', 1, 0, 1, 92),
(250, 'Est maiores vero itaque.', '1564499809', 1, 0, 28, 79),
(251, 'Ut ea voluptatem et quam laudantium.', '1564499809', 1, 0, 75, 92),
(252, 'Eos nulla eligendi dolore quisquam possimus.', '1564499809', 1, 1, 80, 67),
(253, 'Aut quis.', '1564499809', 0, 1, 1, 14),
(254, 'Consequatur rerum non.', '1564499809', 0, 1, 28, 48),
(255, 'Soluta magnam voluptatem dolores.', '1564499809', 1, 0, 8, 64),
(256, 'Soluta.', '1564499809', 1, 0, 3, 36),
(257, 'Repellendus est ut perferendis.', '1564499809', 0, 0, 26, 40),
(258, 'Aliquid itaque qui.', '1564499809', 0, 0, 55, 86),
(259, 'Sint architecto consequuntur recusandae.', '1564499809', 0, 1, 30, 24),
(260, 'Nihil incidunt.', '1564499809', 1, 1, 41, 30),
(261, 'Veniam corrupti rerum ratione tempora.', '1564499809', 0, 1, 14, 60),
(262, 'Autem et.', '1564499809', 1, 0, 8, 42),
(263, 'Laudantium omnis.', '1564499809', 0, 0, 92, 56),
(264, 'Facilis dolores earum.', '1564499809', 0, 1, 32, 8),
(265, 'Eum.', '1564499809', 1, 1, 54, 79),
(266, 'Eos ducimus amet exercitationem.', '1564499809', 1, 0, 75, 41),
(267, 'Laborum eos sed.', '1564499809', 0, 0, 4, 49),
(268, 'Aut quia.', '1564499809', 1, 1, 66, 39),
(269, 'Et ut eum perferendis perferendis.', '1564499809', 1, 0, 11, 57),
(270, 'Quia occaecati.', '1564499809', 0, 1, 7, 39),
(271, 'Accusantium ut quaerat.', '1564499809', 0, 0, 45, 16),
(272, 'Explicabo.', '1564499809', 0, 0, 81, 91),
(273, 'Et.', '1564499809', 0, 0, 56, 19),
(274, 'Nulla aliquid.', '1564499809', 0, 1, 57, 75),
(275, 'Neque corporis animi.', '1564499809', 0, 1, 17, 55),
(276, 'Reiciendis voluptatibus qui.', '1564499809', 1, 1, 71, 41),
(277, 'Est et.', '1564499809', 0, 1, 85, 30),
(278, 'Dolorum at sit.', '1564499809', 0, 1, 80, 21),
(279, 'Atque.', '1564499809', 0, 0, 89, 49),
(280, 'Quo quia vero consectetur pariatur.', '1564499809', 1, 0, 78, 69),
(281, 'Occaecati nostrum.', '1564499809', 1, 0, 93, 60),
(282, 'Neque quo.', '1564499809', 1, 1, 6, 39),
(283, 'Eligendi doloremque doloremque quos.', '1564499809', 1, 1, 21, 50),
(284, 'Facilis itaque.', '1564499809', 0, 0, 38, 84),
(285, 'Nobis quas.', '1564499809', 0, 1, 82, 39),
(286, 'Eum eum id.', '1564499809', 1, 0, 93, 55),
(287, 'Qui possimus porro non.', '1564499809', 0, 1, 74, 75),
(288, 'Laborum.', '1564499809', 0, 0, 93, 46),
(289, 'Est exercitationem.', '1564499810', 0, 0, 56, 52),
(290, 'Expedita iste.', '1564499810', 0, 1, 26, 5),
(291, 'Illo.', '1564499810', 1, 1, 57, 64),
(292, 'Laudantium excepturi maxime.', '1564499810', 1, 0, 91, 37),
(293, 'Ut quam eaque esse.', '1564499810', 1, 1, 77, 47),
(294, 'Omnis ut.', '1564499810', 1, 1, 58, 18),
(295, 'Neque.', '1564499810', 0, 1, 56, 31),
(296, 'Tenetur.', '1564499810', 1, 0, 69, 78),
(297, 'Rerum labore.', '1564499810', 1, 1, 20, 89),
(298, 'Magni asperiores sit non.', '1564499810', 1, 0, 40, 18),
(299, 'Earum minus.', '1564499810', 1, 1, 89, 86),
(300, 'Est non.', '1564499810', 0, 0, 85, 96),
(301, 'Consequatur fuga.', '1564499810', 0, 0, 80, 24),
(302, 'Quibusdam excepturi animi sint.', '1564499810', 1, 1, 54, 30),
(303, 'Est facilis est natus.', '1564499810', 1, 0, 91, 21),
(304, 'Autem laudantium vel.', '1564499810', 0, 1, 64, 92),
(305, 'Rerum aut nobis.', '1564499810', 0, 1, 75, 72),
(306, 'Eos sed delectus.', '1564499810', 0, 1, 19, 51),
(307, 'Et sunt.', '1564499810', 1, 0, 2, 89),
(308, 'Voluptatum dolor.', '1564499810', 0, 1, 22, 33),
(309, 'Ut officia.', '1564499810', 0, 1, 54, 2),
(310, 'Sed autem nisi.', '1564499810', 1, 0, 37, 15),
(311, 'Voluptate iste.', '1564499810', 0, 1, 76, 83),
(312, 'Delectus aut.', '1564499810', 1, 1, 42, 53),
(313, 'Dolores.', '1564499810', 1, 1, 53, 65),
(314, 'Commodi quia.', '1564499810', 1, 1, 40, 36),
(315, 'Eveniet perspiciatis culpa dolorem.', '1564499810', 0, 0, 71, 70),
(316, 'Quidem necessitatibus non.', '1564499810', 0, 0, 53, 10),
(317, 'Iste accusantium suscipit.', '1564499810', 0, 1, 96, 57),
(318, 'Quisquam debitis.', '1564499810', 1, 1, 4, 66),
(319, 'Iure.', '1564499810', 1, 0, 15, 9),
(320, 'Delectus fugiat.', '1564499810', 0, 1, 21, 16),
(321, 'Quas veniam.', '1564499810', 1, 1, 31, 55),
(322, 'Quas consequatur.', '1564499810', 1, 0, 53, 92),
(323, 'Aspernatur.', '1564499810', 1, 1, 8, 32),
(324, 'Quos aliquam.', '1564499810', 1, 1, 42, 9),
(325, 'Vero ullam.', '1564499810', 0, 0, 56, 88),
(326, 'Qui.', '1564499810', 1, 0, 13, 23),
(327, 'Minima iusto.', '1564499810', 1, 0, 3, 42),
(328, 'Et dicta consequatur magnam.', '1564499810', 1, 1, 87, 13),
(329, 'Itaque similique dolorem.', '1564499810', 1, 1, 4, 16),
(330, 'Eum nemo.', '1564499810', 0, 0, 93, 91),
(331, 'Dolorum.', '1564499810', 1, 0, 65, 16),
(332, 'Expedita expedita.', '1564499810', 0, 0, 50, 58),
(333, 'Provident et quos.', '1564499810', 1, 1, 41, 29),
(334, 'Reiciendis ipsa.', '1564499810', 1, 1, 59, 51),
(335, 'Ipsum.', '1564499810', 0, 1, 59, 88),
(336, 'Quisquam a tenetur doloremque temporibus.', '1564499810', 1, 1, 53, 14),
(337, 'Sit doloribus.', '1564499810', 0, 0, 53, 63),
(338, 'Aliquam minima fugit eos.', '1564499810', 0, 1, 17, 70),
(339, 'Voluptatem.', '1564499810', 0, 1, 46, 71),
(340, 'Eos tenetur rerum aliquam.', '1564499810', 1, 0, 59, 27),
(341, 'Ut et.', '1564499810', 0, 1, 20, 57),
(342, 'Pariatur dolor.', '1564499810', 0, 0, 29, 65),
(343, 'Mollitia praesentium maiores.', '1564499811', 0, 1, 64, 12),
(344, 'Iste natus.', '1564499811', 1, 1, 27, 44),
(345, 'Vero voluptatem eum reprehenderit aut.', '1564499811', 1, 1, 3, 12),
(346, 'Eum est numquam placeat debitis.', '1564499811', 1, 0, 61, 90),
(347, 'Aspernatur quos.', '1564499811', 0, 1, 49, 19),
(348, 'Maiores libero quam qui dolorem.', '1564499811', 0, 1, 87, 3),
(349, 'Architecto debitis quis.', '1564499811', 0, 1, 93, 64),
(350, 'Ipsam delectus earum deleniti.', '1564499811', 0, 1, 9, 82),
(351, 'Voluptas adipisci magnam.', '1564499811', 1, 0, 36, 71),
(352, 'Adipisci sit quis.', '1564499811', 0, 0, 27, 13),
(353, 'Quis.', '1564499811', 1, 1, 17, 61),
(354, 'Et dolor alias vero non.', '1564499811', 1, 0, 28, 59),
(355, 'Aut eos.', '1564499811', 0, 1, 62, 32),
(356, 'Nesciunt autem.', '1564499811', 0, 1, 16, 13),
(357, 'Voluptatem ea delectus.', '1564499811', 0, 1, 35, 13),
(358, 'Odit sit.', '1564499811', 1, 1, 75, 60),
(359, 'Et cumque veniam.', '1564499811', 0, 0, 26, 89),
(360, 'Quae.', '1564499811', 0, 0, 38, 88),
(361, 'Illo et non sint et.', '1564499811', 1, 0, 1, 96),
(362, 'Dolore.', '1564499811', 0, 1, 22, 41),
(363, 'A error.', '1564499811', 0, 0, 42, 8),
(364, 'Perspiciatis veniam.', '1564499811', 0, 0, 76, 54),
(365, 'Et occaecati.', '1564499811', 1, 1, 63, 22),
(366, 'Est aliquam aut fugit.', '1564499811', 0, 1, 9, 69),
(367, 'Molestiae sunt.', '1564499811', 0, 1, 20, 44),
(368, 'Dolores assumenda praesentium occaecati consequatur.', '1564499811', 1, 1, 71, 24),
(369, 'Enim.', '1564499811', 1, 1, 69, 82),
(370, 'Quaerat voluptatibus ratione sit.', '1564499811', 0, 0, 11, 20),
(371, 'Molestias rerum delectus quos eveniet.', '1564499811', 0, 1, 50, 13),
(372, 'Ea temporibus sequi est tempora.', '1564499811', 0, 1, 10, 27),
(373, 'Perferendis unde.', '1564499811', 0, 0, 87, 95),
(374, 'Id.', '1564499811', 0, 1, 44, 94),
(375, 'Consequuntur sed sint error.', '1564499811', 0, 0, 94, 8),
(376, 'Sequi optio aut.', '1564499811', 1, 0, 76, 31),
(377, 'Commodi adipisci.', '1564499811', 1, 0, 51, 24),
(378, 'Ut.', '1564499811', 1, 0, 26, 14),
(379, 'Amet iste laboriosam et sunt.', '1564499811', 0, 1, 8, 75),
(380, 'Voluptatem.', '1564499812', 0, 1, 38, 85),
(381, 'Sint porro cupiditate.', '1564499812', 1, 1, 90, 50),
(382, 'Veniam animi.', '1564499812', 1, 0, 28, 3),
(383, 'Enim sunt quae.', '1564499812', 1, 1, 44, 53),
(384, 'Vitae et hic voluptas.', '1564499812', 0, 1, 9, 2),
(385, 'Ut et totam mollitia.', '1564499812', 1, 0, 93, 68),
(386, 'Quis reiciendis.', '1564499812', 0, 1, 19, 95),
(387, 'Dolorem ipsa sunt provident.', '1564499812', 0, 1, 14, 59),
(388, 'Eveniet earum totam qui et.', '1564499812', 0, 0, 82, 24),
(389, 'Libero adipisci.', '1564499812', 0, 1, 29, 77),
(390, 'Doloremque ratione saepe autem cum.', '1564499812', 0, 1, 58, 95),
(391, 'Fuga aspernatur ducimus voluptatem.', '1564499812', 1, 0, 89, 34),
(392, 'Sit molestiae.', '1564499812', 1, 1, 34, 17),
(393, 'Ipsa.', '1564499812', 1, 1, 20, 38),
(394, 'Ut quod pariatur minus.', '1564499812', 0, 0, 1, 33),
(395, 'Unde quia vel sunt.', '1564499812', 0, 0, 6, 23),
(396, 'Sint aut sit.', '1564499812', 0, 1, 94, 28),
(397, 'Eos.', '1564499812', 1, 1, 66, 50),
(398, 'Dolor est repellendus.', '1564499812', 1, 0, 81, 45),
(399, 'Veniam itaque est magni.', '1564499812', 1, 1, 73, 73),
(400, 'Ipsa autem eum incidunt consequatur.', '1564499812', 1, 0, 91, 95),
(401, 'Dicta ut.', '1564499812', 0, 0, 34, 74),
(402, 'Architecto veniam qui nihil quisquam.', '1564499812', 1, 1, 8, 38),
(403, 'Laudantium non molestias reprehenderit.', '1564499812', 1, 0, 3, 14),
(404, 'In nostrum laudantium voluptate dicta.', '1564499812', 0, 0, 49, 55),
(405, 'Omnis.', '1564499812', 0, 1, 27, 22),
(406, 'Minus rem sit consequatur.', '1564499812', 1, 0, 12, 50),
(407, 'Non maiores.', '1564499812', 1, 0, 3, 91),
(408, 'Minima minima.', '1564499812', 0, 0, 34, 13),
(409, 'Eveniet alias.', '1564499812', 0, 1, 87, 68),
(410, 'Consequatur voluptatibus non.', '1564499812', 0, 1, 29, 53),
(411, 'Amet voluptas.', '1564499812', 1, 0, 94, 67),
(412, 'Quia ea recusandae.', '1564499812', 1, 1, 85, 14),
(413, 'Similique quidem.', '1564499812', 0, 0, 65, 74),
(414, 'Repellat et.', '1564499812', 1, 1, 24, 19),
(415, 'Quo labore.', '1564499812', 1, 0, 18, 74),
(416, 'Voluptatem dolorem.', '1564499812', 0, 1, 7, 65),
(417, 'Impedit veritatis debitis est.', '1564499812', 1, 0, 6, 90),
(418, 'Quibusdam odit.', '1564499812', 0, 1, 68, 35),
(419, 'Voluptatum culpa eos.', '1564499812', 0, 0, 9, 92),
(420, 'Fuga.', '1564499812', 1, 1, 82, 74),
(421, 'Dolores molestiae sed.', '1564499813', 0, 0, 19, 44),
(422, 'Consequatur tenetur.', '1564499813', 1, 0, 10, 6),
(423, 'Saepe iure consequatur placeat praesentium.', '1564499813', 0, 1, 7, 93),
(424, 'Velit laborum.', '1564499813', 1, 1, 41, 28),
(425, 'Et aut.', '1564499813', 1, 1, 69, 26),
(426, 'Facilis similique excepturi.', '1564499813', 0, 0, 56, 12),
(427, 'Sint laborum.', '1564499813', 0, 1, 90, 54),
(428, 'Eveniet minus.', '1564499813', 1, 1, 14, 21),
(429, 'Illo veniam maiores soluta blanditiis.', '1564499813', 0, 0, 81, 80),
(430, 'Harum laudantium et.', '1564499813', 1, 0, 57, 89),
(431, 'Cupiditate voluptates accusantium.', '1564499813', 1, 1, 26, 4),
(432, 'Velit omnis voluptatem eveniet.', '1564499813', 0, 0, 72, 16),
(433, 'Vel aut qui animi deserunt repudiandae.', '1564499813', 0, 0, 79, 16),
(434, 'Neque ut aliquid.', '1564499813', 0, 0, 25, 54),
(435, 'Quis molestias pariatur.', '1564499813', 1, 0, 76, 64),
(436, 'Autem vero.', '1564499813', 0, 1, 67, 18),
(437, 'Doloribus cumque earum fuga cupiditate culpa.', '1564499813', 0, 1, 53, 17),
(438, 'Ducimus dicta et.', '1564499813', 0, 1, 10, 67),
(439, 'Consequatur.', '1564499813', 1, 1, 63, 61),
(440, 'Ab eaque aut provident eos.', '1564499813', 1, 0, 16, 75),
(441, 'Similique suscipit dolorem.', '1564499813', 0, 1, 69, 90),
(442, 'Non.', '1564499813', 1, 0, 87, 86),
(443, 'Dolor omnis.', '1564499813', 1, 0, 36, 67),
(444, 'Sunt similique aut suscipit voluptatum.', '1564499813', 1, 1, 69, 51),
(445, 'Qui aperiam.', '1564499813', 1, 0, 53, 44),
(446, 'Aut voluptas.', '1564499813', 1, 0, 31, 27),
(447, 'Quia non sed.', '1564499813', 0, 1, 78, 68),
(448, 'Libero modi.', '1564499813', 1, 1, 3, 27),
(449, 'Placeat veritatis.', '1564499813', 1, 1, 6, 34),
(450, 'Est omnis.', '1564499813', 0, 1, 8, 45),
(451, 'Porro voluptatibus porro commodi.', '1564499813', 1, 1, 64, 23),
(452, 'Voluptatem quae vitae.', '1564499813', 0, 1, 3, 51),
(453, 'Deserunt tempore magni voluptate recusandae.', '1564499813', 0, 1, 27, 17),
(454, 'Ut.', '1564499813', 1, 1, 95, 73),
(455, 'Mollitia vel nostrum.', '1564499814', 1, 0, 25, 67),
(456, 'Saepe eos.', '1564499814', 0, 1, 72, 35),
(457, 'Voluptas asperiores exercitationem.', '1564499814', 1, 1, 82, 96),
(458, 'Occaecati sint.', '1564499814', 1, 1, 59, 5),
(459, 'Aut molestiae.', '1564499814', 1, 1, 10, 83),
(460, 'Aut modi voluptatem in beatae.', '1564499814', 0, 1, 61, 76),
(461, 'Natus non qui.', '1564499814', 0, 0, 17, 18),
(462, 'Qui eaque.', '1564499814', 1, 1, 56, 81),
(463, 'Ipsum quidem.', '1564499814', 1, 0, 94, 18),
(464, 'Sint fuga ullam dolor.', '1564499814', 1, 0, 3, 64),
(465, 'Enim iste.', '1564499814', 0, 0, 23, 31),
(466, 'Laborum velit mollitia occaecati quis.', '1564499814', 1, 1, 1, 61),
(467, 'Et sit sit.', '1564499814', 0, 0, 39, 7),
(468, 'Et nulla quae.', '1564499814', 0, 1, 47, 82),
(469, 'Sunt.', '1564499814', 1, 1, 35, 35),
(470, 'Dolores dicta eligendi sint possimus enim.', '1564499814', 0, 0, 93, 42),
(471, 'Deleniti non dignissimos.', '1564499814', 0, 1, 18, 10),
(472, 'Ratione doloremque harum et eius.', '1564499814', 0, 1, 75, 22),
(473, 'Alias et voluptas laboriosam praesentium.', '1564499814', 0, 1, 67, 88),
(474, 'Est ipsam ut.', '1564499814', 0, 0, 69, 20),
(475, 'Delectus qui.', '1564499814', 0, 0, 56, 68),
(476, 'Iure voluptatibus voluptatem ea.', '1564499814', 0, 1, 82, 59),
(477, 'In.', '1564499814', 1, 1, 58, 92),
(478, 'Dolores id.', '1564499814', 0, 1, 7, 1),
(479, 'Omnis aut.', '1564499814', 1, 0, 45, 50),
(480, 'Ut necessitatibus illum commodi qui minima.', '1564499814', 1, 0, 6, 39),
(481, 'Quaerat praesentium.', '1564499814', 1, 1, 76, 22),
(482, 'Eveniet provident dolorem voluptas rem.', '1564499814', 0, 1, 71, 72),
(483, 'Porro est.', '1564499814', 1, 0, 47, 30),
(484, 'Fugit.', '1564499814', 0, 0, 4, 93),
(485, 'Iste rerum sequi.', '1564499814', 1, 0, 44, 89),
(486, 'Minus reiciendis.', '1564499814', 0, 0, 86, 40),
(487, 'Fugiat iure sapiente.', '1564499814', 0, 0, 72, 48),
(488, 'Voluptas.', '1564499814', 1, 1, 41, 84),
(489, 'Quaerat commodi sequi.', '1564499815', 1, 1, 21, 9),
(490, 'Quia.', '1564499815', 0, 0, 21, 43),
(491, 'Qui quas eveniet.', '1564499815', 0, 1, 85, 88),
(492, 'Nobis ipsa alias consectetur adipisci.', '1564499815', 1, 1, 76, 55),
(493, 'Esse.', '1564499815', 0, 1, 78, 6),
(494, 'Non quod quo.', '1564499815', 1, 1, 30, 17),
(495, 'Voluptatum nihil magni.', '1564499815', 0, 0, 66, 88),
(496, 'Quia voluptates possimus veritatis.', '1564499815', 0, 1, 1, 13),
(497, 'Sed.', '1564499815', 0, 0, 43, 88),
(498, 'Dolor magnam nesciunt incidunt nostrum.', '1564499815', 0, 1, 63, 32),
(499, 'Voluptates fuga ut.', '1564499815', 1, 0, 18, 33),
(500, 'Reprehenderit excepturi.', '1564499815', 1, 0, 9, 81),
(501, 'Necessitatibus accusantium.', '1564499815', 1, 1, 72, 67),
(502, 'Perferendis aut.', '1564499815', 1, 0, 76, 6),
(503, 'Itaque.', '1564499815', 1, 1, 59, 20),
(504, 'Aliquid magnam.', '1564499815', 1, 1, 36, 9),
(505, 'Eos cum.', '1564499815', 0, 1, 69, 41),
(506, 'Ipsam laudantium.', '1564499815', 1, 1, 95, 57),
(507, 'Itaque praesentium dolorum nostrum.', '1564499815', 1, 0, 36, 17),
(508, 'Dignissimos qui.', '1564499815', 1, 1, 90, 10),
(509, 'Rerum corporis.', '1564499815', 1, 1, 73, 22),
(510, 'Non voluptates et illum.', '1564499815', 0, 0, 44, 30),
(511, 'Earum labore a.', '1564499815', 0, 1, 48, 65),
(512, 'Cupiditate unde culpa.', '1564499815', 1, 1, 66, 68),
(513, 'Consectetur quo voluptatum facilis adipisci culpa.', '1564499815', 1, 0, 5, 65),
(514, 'Soluta doloribus nihil suscipit.', '1564499815', 0, 1, 70, 41),
(515, 'Voluptas est commodi aut temporibus.', '1564499815', 0, 1, 6, 22),
(516, 'Velit voluptatem non.', '1564499815', 0, 1, 6, 79),
(517, 'Qui.', '1564499815', 0, 1, 77, 76),
(518, 'Illum neque quas.', '1564499815', 1, 0, 23, 63),
(519, 'Tempore odio distinctio et.', '1564499815', 0, 0, 72, 96),
(520, 'Et eveniet eos dolor minima illo.', '1564499815', 0, 0, 87, 52),
(521, 'Occaecati totam natus enim perspiciatis.', '1564499815', 1, 0, 74, 55),
(522, 'Voluptas ad molestias.', '1564499815', 1, 0, 35, 37),
(523, 'Dolores modi.', '1564499815', 0, 0, 80, 66),
(524, 'Quos quaerat et atque nulla.', '1564499816', 0, 1, 91, 13),
(525, 'Voluptatum saepe non rerum magni.', '1564499816', 1, 0, 37, 34),
(526, 'Aliquid molestias ullam consequatur.', '1564499816', 1, 0, 1, 9),
(527, 'Aut maxime ullam voluptate.', '1564499816', 0, 1, 95, 62),
(528, 'Numquam necessitatibus amet.', '1564499816', 1, 0, 1, 52),
(529, 'Amet aut aliquid.', '1564499816', 1, 0, 78, 76),
(530, 'Incidunt facere placeat.', '1564499816', 0, 1, 34, 15),
(531, 'Ducimus nesciunt.', '1564499816', 0, 1, 46, 48),
(532, 'Dolorem doloribus maiores et pariatur reiciendis.', '1564499816', 0, 1, 60, 6),
(533, 'Sint libero corporis.', '1564499816', 1, 0, 61, 46),
(534, 'Et nostrum necessitatibus autem.', '1564499816', 0, 1, 55, 44),
(535, 'Quia nemo nesciunt id.', '1564499816', 0, 1, 36, 13),
(536, 'Tenetur impedit sed illum natus sapiente.', '1564499816', 1, 0, 91, 70),
(537, 'Saepe necessitatibus qui ea.', '1564499816', 0, 0, 28, 59),
(538, 'Praesentium sed.', '1564499816', 1, 1, 52, 85),
(539, 'Libero voluptatibus facere voluptatum.', '1564499816', 1, 0, 3, 48),
(540, 'Expedita sed dolorum.', '1564499816', 1, 0, 63, 47),
(541, 'Voluptates quaerat reiciendis.', '1564499816', 0, 1, 20, 88),
(542, 'Minus unde.', '1564499816', 0, 1, 7, 69),
(543, 'Necessitatibus.', '1564499816', 1, 1, 30, 21),
(544, 'Eos mollitia illum.', '1564499816', 0, 1, 22, 24),
(545, 'Voluptatem nemo voluptates voluptatem ipsam.', '1564499816', 1, 0, 94, 58),
(546, 'Impedit ea.', '1564499816', 1, 1, 2, 43),
(547, 'Unde maxime nobis laboriosam.', '1564499816', 1, 0, 72, 18),
(548, 'Nemo voluptates id.', '1564499816', 1, 0, 38, 11),
(549, 'Soluta.', '1564499816', 0, 1, 46, 60),
(550, 'Veniam alias facere ab.', '1564499816', 0, 0, 90, 95),
(551, 'Tempore cupiditate animi similique.', '1564499816', 0, 0, 70, 15),
(552, 'Doloribus officiis.', '1564499816', 1, 1, 17, 21),
(553, 'Impedit cumque.', '1564499816', 0, 1, 50, 87),
(554, 'Vitae.', '1564499816', 1, 1, 85, 24),
(555, 'Porro.', '1564499816', 0, 0, 60, 23),
(556, 'Nisi unde tempore occaecati.', '1564499816', 1, 0, 44, 53),
(557, 'Sit et.', '1564499816', 0, 1, 76, 63),
(558, 'Quis iure officiis.', '1564499816', 0, 1, 70, 40),
(559, 'Corporis corporis placeat corrupti et qui.', '1564499816', 1, 1, 85, 42),
(560, 'Commodi dolor velit id.', '1564499817', 1, 1, 70, 44),
(561, 'Unde veritatis illo nihil veritatis nemo.', '1564499817', 0, 0, 69, 40),
(562, 'Et explicabo dolores.', '1564499817', 0, 1, 11, 66),
(563, 'Neque modi et.', '1564499817', 1, 1, 58, 50),
(564, 'Atque earum facere.', '1564499817', 0, 0, 58, 44),
(565, 'Inventore cupiditate.', '1564499817', 0, 1, 86, 82),
(566, 'Sint.', '1564499817', 1, 1, 49, 56),
(567, 'Sit quod nulla.', '1564499817', 0, 0, 84, 17),
(568, 'Ea voluptas.', '1564499817', 0, 0, 80, 15),
(569, 'Adipisci fugit earum nihil voluptatem.', '1564499817', 1, 0, 86, 90),
(570, 'Numquam quidem consequatur.', '1564499817', 1, 0, 17, 22),
(571, 'Non eaque eum id pariatur quo.', '1564499817', 1, 0, 74, 78),
(572, 'Cumque nulla ab.', '1564499817', 0, 0, 76, 21),
(573, 'Itaque est.', '1564499817', 0, 1, 41, 87),
(574, 'Quo consectetur quia sed facere est.', '1564499817', 1, 0, 69, 80),
(575, 'Ipsam dolor nulla.', '1564499817', 1, 0, 40, 90),
(576, 'Qui dolores.', '1564499817', 0, 0, 94, 67),
(577, 'Reiciendis velit voluptas sunt maxime.', '1564499817', 1, 0, 38, 64),
(578, 'Maxime et.', '1564499817', 1, 0, 93, 47),
(579, 'Sequi.', '1564499817', 1, 0, 36, 21),
(580, 'Ipsam odio accusantium.', '1564499817', 1, 1, 37, 96),
(581, 'Sed quasi repellendus enim.', '1564499817', 1, 0, 4, 38),
(582, 'Aliquid quia sunt.', '1564499817', 1, 1, 91, 50),
(583, 'Assumenda in laborum quae quae aut.', '1564499817', 1, 0, 13, 31),
(584, 'At omnis ea quasi numquam.', '1564499817', 0, 1, 94, 23),
(585, 'Vel facere earum placeat eum.', '1564499817', 0, 1, 86, 63),
(586, 'Quis sint voluptas voluptates.', '1564499817', 1, 0, 74, 62),
(587, 'Sed et ut.', '1564499817', 1, 0, 30, 80),
(588, 'Asperiores minima reiciendis vitae debitis culpa.', '1564499817', 0, 1, 34, 79),
(589, 'Officiis.', '1564499817', 1, 1, 22, 59),
(590, 'Minus nam veniam voluptates non.', '1564499817', 0, 0, 54, 70),
(591, 'Non voluptatem error.', '1564499817', 1, 1, 5, 91),
(592, 'Soluta.', '1564499817', 0, 0, 31, 33),
(593, 'Ut deserunt.', '1564499817', 0, 0, 50, 91),
(594, 'Officiis.', '1564499817', 0, 1, 88, 13),
(595, 'Temporibus facere.', '1564499817', 1, 0, 52, 70),
(596, 'Perferendis ut.', '1564499817', 0, 1, 90, 96),
(597, 'Ex minima eum.', '1564499817', 1, 1, 21, 86),
(598, 'Et consequatur totam.', '1564499817', 1, 0, 6, 69),
(599, 'Expedita odio autem.', '1564499817', 1, 1, 47, 32),
(600, 'Et nisi commodi.', '1564499817', 1, 0, 10, 33),
(601, 'Ad odit.', '1564499817', 0, 1, 6, 23),
(602, 'Quidem voluptas et doloremque ratione.', '1564499817', 0, 1, 95, 6),
(603, 'Illum.', '1564499817', 1, 0, 52, 79),
(604, 'Velit est quod.', '1564499817', 1, 1, 5, 86),
(605, 'Aut eum quo.', '1564499817', 0, 1, 45, 89),
(606, 'Aut.', '1564499817', 1, 0, 12, 68),
(607, 'Non ea.', '1564499817', 1, 1, 38, 92),
(608, 'Amet id dolorum magni.', '1564499817', 1, 1, 9, 7),
(609, 'Fugiat laboriosam.', '1564499817', 0, 1, 80, 81),
(610, 'Maiores rerum sit.', '1564499817', 0, 1, 94, 25),
(611, 'Est vel eligendi distinctio similique.', '1564499817', 0, 0, 17, 52),
(612, 'Est aut sint.', '1564499818', 1, 0, 56, 93),
(613, 'Quia accusamus totam fuga expedita.', '1564499818', 0, 1, 74, 28),
(614, 'Eligendi dolor.', '1564499818', 0, 0, 96, 29),
(615, 'Expedita voluptates.', '1564499818', 1, 0, 29, 15),
(616, 'Eaque mollitia.', '1564499818', 0, 1, 78, 27),
(617, 'Et alias nobis tempore.', '1564499818', 1, 1, 85, 12),
(618, 'Est sed rerum quia est sunt.', '1564499818', 0, 0, 76, 4),
(619, 'Ut.', '1564499818', 0, 0, 80, 37),
(620, 'Consectetur earum fuga est eius.', '1564499818', 1, 0, 49, 26),
(621, 'Et quia.', '1564499818', 0, 0, 20, 8),
(622, 'Esse eum impedit et ratione.', '1564499818', 1, 0, 4, 12),
(623, 'Quia occaecati provident.', '1564499818', 1, 0, 38, 86),
(624, 'Rem fugiat quasi.', '1564499818', 0, 1, 77, 24),
(625, 'Eius eveniet voluptate.', '1564499818', 0, 0, 84, 51),
(626, 'Aut blanditiis et minus.', '1564499818', 0, 1, 20, 18),
(627, 'Doloribus alias optio.', '1564499818', 0, 1, 2, 50),
(628, 'Rem ea.', '1564499818', 0, 0, 1, 59),
(629, 'Ut error occaecati non sit officiis.', '1564499818', 1, 1, 67, 13),
(630, 'Deleniti ex.', '1564499818', 1, 0, 38, 24),
(631, 'Culpa dolorem aspernatur.', '1564499818', 1, 1, 56, 17),
(632, 'Sint maiores.', '1564499818', 1, 0, 2, 25),
(633, 'Soluta libero.', '1564499818', 1, 0, 49, 40),
(634, 'Aut ut.', '1564499818', 1, 1, 96, 13),
(635, 'Eligendi reiciendis.', '1564499818', 1, 0, 58, 36),
(636, 'Rerum fuga ut deserunt natus qui.', '1564499818', 0, 1, 33, 10),
(637, 'Magnam distinctio.', '1564499818', 0, 0, 49, 84),
(638, 'Beatae.', '1564499818', 1, 0, 86, 32),
(639, 'Praesentium voluptatibus ab.', '1564499818', 0, 0, 12, 74),
(640, 'Ad voluptatem qui porro.', '1564499818', 0, 1, 37, 41),
(641, 'Vel dignissimos.', '1564499818', 1, 0, 40, 69),
(642, 'Enim ad fugit incidunt.', '1564499818', 1, 1, 62, 76),
(643, 'Et maiores animi.', '1564499818', 0, 1, 57, 53),
(644, 'Est qui quis.', '1564499818', 0, 1, 19, 94),
(645, 'Iure possimus.', '1564499818', 1, 1, 27, 55),
(646, 'Sint ad vero fuga.', '1564499818', 0, 1, 1, 21),
(647, 'Unde enim accusamus.', '1564499818', 0, 0, 32, 61),
(648, 'Incidunt.', '1564499818', 0, 0, 40, 94),
(649, 'Eum.', '1564499818', 0, 0, 34, 21),
(650, 'Error non.', '1564499818', 0, 0, 76, 87),
(651, 'Optio placeat ut.', '1564499818', 1, 1, 33, 12),
(652, 'Maxime et accusantium consequatur est autem.', '1564499818', 0, 1, 89, 7),
(653, 'Temporibus soluta rerum.', '1564499818', 1, 0, 58, 61),
(654, 'Dolorum temporibus.', '1564499818', 1, 1, 88, 26),
(655, 'Ex at nam.', '1564499818', 1, 0, 7, 17),
(656, 'Nesciunt aliquam.', '1564499818', 0, 0, 13, 9),
(657, 'Molestiae eum.', '1564499818', 1, 0, 8, 88),
(658, 'Asperiores molestiae.', '1564499818', 1, 1, 21, 92),
(659, 'Libero.', '1564499818', 0, 0, 27, 87),
(660, 'Aliquid odio asperiores debitis commodi.', '1564499818', 0, 1, 58, 5),
(661, 'Et.', '1564499818', 0, 0, 3, 15),
(662, 'Placeat aperiam ratione.', '1564499818', 0, 0, 41, 14),
(663, 'Vel quaerat commodi odit.', '1564499818', 1, 0, 21, 75),
(664, 'Rerum qui.', '1564499818', 0, 0, 77, 89),
(665, 'Veritatis aspernatur ex.', '1564499818', 1, 1, 32, 34),
(666, 'Est incidunt asperiores perspiciatis omnis.', '1564499818', 0, 1, 62, 11),
(667, 'Illum similique aperiam eum et illum.', '1564499818', 1, 0, 11, 15),
(668, 'Voluptate impedit amet at repellendus.', '1564499818', 0, 1, 21, 92),
(669, 'Ab dolorem veniam.', '1564499818', 1, 1, 92, 27),
(670, 'Animi consequatur.', '1564499818', 0, 0, 44, 19),
(671, 'Tenetur perferendis ratione.', '1564499818', 0, 1, 70, 51),
(672, 'Ut nihil expedita.', '1564499818', 0, 1, 34, 15),
(673, 'Iste eligendi corrupti commodi facilis facilis.', '1564499818', 0, 0, 40, 92),
(674, 'Est blanditiis repellendus.', '1564499818', 0, 0, 33, 67),
(675, 'Rerum perferendis.', '1564499818', 0, 0, 60, 38),
(676, 'Reiciendis facilis.', '1564499818', 0, 1, 88, 12),
(677, 'Autem tempore.', '1564499818', 1, 1, 41, 51),
(678, 'Magnam.', '1564499819', 1, 1, 66, 85),
(679, 'Consequatur laudantium blanditiis eos.', '1564499819', 0, 1, 3, 10),
(680, 'Ea sint reiciendis.', '1564499819', 0, 1, 37, 51),
(681, 'In velit nobis.', '1564499819', 0, 1, 49, 17),
(682, 'Rerum eius officia.', '1564499819', 1, 1, 44, 57),
(683, 'Rerum officiis reiciendis eos iusto.', '1564499819', 1, 0, 17, 46),
(684, 'Quam ut.', '1564499819', 0, 0, 78, 50),
(685, 'Et fugiat.', '1564499819', 0, 1, 67, 77),
(686, 'Soluta necessitatibus.', '1564499819', 0, 0, 15, 30),
(687, 'Eos cupiditate aut.', '1564499819', 0, 0, 46, 30),
(688, 'Ipsam minima similique ut ipsam.', '1564499819', 1, 1, 64, 31),
(689, 'Sint necessitatibus.', '1564499819', 0, 0, 28, 59),
(690, 'Praesentium ut voluptas qui id.', '1564499819', 0, 1, 69, 71),
(691, 'Perspiciatis sapiente iure.', '1564499819', 0, 1, 87, 42),
(692, 'Velit nulla.', '1564499819', 0, 1, 52, 48),
(693, 'Et tempore quo.', '1564499819', 0, 0, 84, 83),
(694, 'Similique suscipit.', '1564499819', 0, 1, 4, 28),
(695, 'Quam magnam labore omnis.', '1564499819', 1, 1, 65, 46),
(696, 'Perferendis aut ut provident.', '1564499819', 0, 1, 2, 72),
(697, 'Voluptas adipisci laboriosam.', '1564499819', 0, 0, 86, 5),
(698, 'Qui numquam sunt.', '1564499819', 1, 1, 6, 77),
(699, 'Voluptas ipsam omnis.', '1564499819', 0, 0, 5, 56),
(700, 'Vitae ratione deserunt.', '1564499819', 1, 0, 56, 5),
(701, 'Nihil dignissimos dolores sunt commodi.', '1564499819', 1, 0, 55, 17),
(702, 'Dolorem et consequatur.', '1564499819', 0, 1, 29, 8),
(703, 'Saepe ullam ipsa excepturi.', '1564499819', 0, 1, 9, 46),
(704, 'Nesciunt ut.', '1564499819', 0, 1, 9, 38),
(705, 'Quis.', '1564499819', 0, 1, 63, 83),
(706, 'Sint nulla.', '1564499819', 0, 0, 78, 73),
(707, 'Eveniet sed laudantium hic reiciendis.', '1564499819', 1, 0, 32, 75),
(708, 'Quidem qui earum voluptas maiores.', '1564499819', 1, 1, 57, 79),
(709, 'Voluptates doloremque quia.', '1564499819', 0, 0, 25, 28),
(710, 'Cumque ipsam deleniti quasi quas.', '1564499819', 1, 0, 96, 24),
(711, 'Debitis vitae sit minima.', '1564499819', 1, 1, 7, 35),
(712, 'Illum.', '1564499819', 1, 1, 53, 47),
(713, 'Earum et.', '1564499819', 1, 0, 80, 94),
(714, 'Labore iusto earum et suscipit repudiandae.', '1564499819', 0, 1, 31, 55),
(715, 'Quaerat molestiae dolores amet iste doloremque.', '1564499819', 0, 0, 81, 89),
(716, 'Vel illo sit.', '1564499819', 1, 0, 2, 28),
(717, 'Dicta commodi ab.', '1564499819', 0, 1, 44, 67),
(718, 'Eligendi ipsam voluptas.', '1564499819', 0, 1, 30, 89),
(719, 'Explicabo officiis distinctio eum.', '1564499819', 1, 1, 6, 16),
(720, 'Provident iste veritatis.', '1564499819', 0, 0, 92, 92),
(721, 'Earum eum.', '1564499819', 1, 0, 47, 37),
(722, 'Dignissimos et debitis voluptatem.', '1564499819', 1, 0, 82, 67),
(723, 'Repellendus et quia.', '1564499819', 1, 1, 46, 84),
(724, 'Exercitationem est.', '1564499819', 1, 1, 82, 92),
(725, 'Ea qui sint nobis enim.', '1564499819', 0, 1, 34, 89),
(726, 'Odio ut ut voluptatibus.', '1564499819', 0, 1, 13, 50),
(727, 'Sunt dolores numquam.', '1564499819', 1, 1, 77, 1),
(728, 'Magnam et.', '1564499819', 1, 0, 89, 51),
(729, 'Omnis nostrum eligendi.', '1564499819', 0, 0, 4, 42),
(730, 'Id ex.', '1564499819', 0, 0, 3, 17),
(731, 'Voluptate est expedita rerum.', '1564499819', 1, 0, 8, 94),
(732, 'Et rerum voluptatem distinctio est.', '1564499819', 1, 1, 74, 75),
(733, 'Ex.', '1564499819', 0, 0, 95, 90),
(734, 'Exercitationem facere sint.', '1564499819', 1, 1, 40, 78),
(735, 'At voluptas deleniti ut.', '1564499819', 0, 0, 68, 86),
(736, 'Laborum dolorem incidunt.', '1564499819', 0, 0, 51, 96),
(737, 'Dolor velit unde aut ipsam.', '1564499819', 1, 0, 13, 78),
(738, 'Et qui doloribus officia dolore.', '1564499819', 1, 1, 68, 47),
(739, 'Sunt rerum est labore architecto.', '1564499819', 1, 1, 94, 72),
(740, 'Consequatur quo.', '1564499819', 1, 1, 25, 67),
(741, 'Sint fugiat beatae.', '1564499819', 0, 0, 1, 89),
(742, 'Omnis iure autem voluptatem.', '1564499819', 1, 1, 88, 58),
(743, 'Accusantium ex.', '1564499819', 1, 0, 16, 79),
(744, 'Aliquid possimus.', '1564499819', 1, 1, 30, 21),
(745, 'Ducimus distinctio consectetur.', '1564499819', 0, 0, 90, 35),
(746, 'Autem nostrum non quas tenetur.', '1564499819', 1, 0, 59, 94),
(747, 'Incidunt non.', '1564499819', 0, 0, 73, 66),
(748, 'Molestiae deleniti.', '1564499819', 1, 1, 79, 46),
(749, 'Sunt.', '1564499819', 1, 0, 68, 11),
(750, 'Quas esse laboriosam totam.', '1564499819', 0, 1, 4, 75),
(751, 'Ipsum iure architecto et.', '1564499819', 0, 0, 83, 7),
(752, 'Minima rem quos.', '1564499819', 1, 1, 77, 16),
(753, 'Et autem et.', '1564499819', 1, 1, 1, 9),
(754, 'Voluptatem vel.', '1564499819', 0, 0, 94, 46),
(755, 'Eos laudantium incidunt voluptatem.', '1564499819', 1, 1, 41, 96),
(756, 'Alias est facere sunt.', '1564499819', 1, 0, 93, 61),
(757, 'Doloribus rem.', '1564499820', 1, 0, 47, 1),
(758, 'Est neque laudantium ut.', '1564499820', 0, 0, 61, 84),
(759, 'Vero deleniti.', '1564499820', 1, 1, 29, 47),
(760, 'Eligendi voluptatum.', '1564499820', 0, 1, 70, 96),
(761, 'Et est.', '1564499820', 0, 0, 23, 89),
(762, 'Saepe id sint.', '1564499820', 0, 0, 63, 12),
(763, 'Aliquid distinctio.', '1564499820', 1, 0, 96, 85),
(764, 'Ut.', '1564499820', 1, 0, 33, 27),
(765, 'Qui autem voluptas placeat.', '1564499820', 1, 0, 1, 39),
(766, 'Inventore velit.', '1564499820', 0, 1, 52, 29),
(767, 'Fugiat veritatis dolorum recusandae.', '1564499820', 1, 0, 37, 85),
(768, 'Dignissimos excepturi ut.', '1564499820', 1, 0, 92, 42),
(769, 'Officiis magnam.', '1564499820', 0, 0, 57, 46),
(770, 'Exercitationem suscipit omnis reiciendis eos.', '1564499820', 1, 1, 16, 32),
(771, 'Consequatur saepe cupiditate.', '1564499820', 0, 1, 29, 80),
(772, 'Eos sint sit.', '1564499820', 1, 1, 73, 73),
(773, 'Quod impedit ea et.', '1564499820', 0, 1, 12, 3),
(774, 'Omnis consectetur.', '1564499820', 1, 1, 19, 6),
(775, 'Laborum eligendi temporibus recusandae.', '1564499820', 0, 0, 37, 61),
(776, 'Quo nulla iusto.', '1564499820', 0, 0, 44, 62),
(777, 'Eum quaerat excepturi alias.', '1564499820', 1, 1, 85, 64),
(778, 'Asperiores voluptatem.', '1564499820', 0, 0, 96, 48),
(779, 'Nulla.', '1564499820', 0, 1, 20, 30),
(780, 'Vitae dignissimos.', '1564499820', 0, 1, 16, 73),
(781, 'Qui qui voluptate.', '1564499820', 1, 0, 93, 80),
(782, 'Quo voluptas.', '1564499820', 1, 0, 12, 29),
(783, 'Velit accusamus corrupti quo enim ut.', '1564499820', 1, 1, 48, 1),
(784, 'Possimus aut.', '1564499820', 1, 1, 92, 92),
(785, 'Sapiente voluptatum repudiandae.', '1564499820', 1, 1, 80, 96),
(786, 'Explicabo nobis quam.', '1564499820', 0, 0, 5, 49),
(787, 'Voluptatum occaecati.', '1564499820', 0, 1, 80, 49),
(788, 'Est.', '1564499820', 1, 1, 13, 45),
(789, 'Nisi facere.', '1564499820', 0, 0, 95, 17),
(790, 'Saepe rerum.', '1564499820', 0, 0, 74, 37),
(791, 'Rerum eius necessitatibus.', '1564499820', 1, 1, 94, 29),
(792, 'Facilis qui perspiciatis laborum optio itaque.', '1564499820', 0, 1, 90, 75),
(793, 'Rerum odit.', '1564499820', 1, 0, 8, 4),
(794, 'Ducimus earum neque molestiae aut.', '1564499820', 0, 0, 81, 17),
(795, 'Necessitatibus ratione aliquam quae magnam.', '1564499820', 1, 0, 81, 32),
(796, 'Dolor velit ut.', '1564499820', 1, 1, 43, 80),
(797, 'Quo et id vel.', '1564499820', 1, 0, 67, 7),
(798, 'Et possimus labore.', '1564499820', 0, 1, 65, 78),
(799, 'Dolorem ad laudantium.', '1564499820', 1, 0, 85, 15),
(800, 'Unde quia nulla et.', '1564499820', 0, 1, 29, 85),
(801, 'Voluptatem unde sit.', '1564499820', 1, 1, 22, 18),
(802, 'Occaecati molestiae quaerat.', '1564499820', 1, 0, 35, 2),
(803, 'Officiis illum esse.', '1564499820', 0, 1, 46, 34),
(804, 'Iure distinctio ut id.', '1564499820', 0, 0, 84, 1),
(805, 'Aut temporibus similique dolorem optio.', '1564499820', 0, 0, 64, 37),
(806, 'Voluptatem quasi quidem.', '1564499820', 1, 1, 23, 29),
(807, 'Ipsam veritatis recusandae.', '1564499820', 1, 1, 89, 92),
(808, 'Dolorum soluta.', '1564499820', 1, 1, 17, 28),
(809, 'Tempore ut.', '1564499820', 1, 1, 45, 17),
(810, 'Ut id animi adipisci.', '1564499820', 1, 1, 22, 74),
(811, 'Id natus dolores ipsam ad.', '1564499820', 0, 1, 55, 95),
(812, 'Dolorem est ipsam et.', '1564499820', 0, 1, 62, 5),
(813, 'Delectus et.', '1564499820', 1, 1, 8, 76),
(814, 'Qui debitis deleniti ipsa.', '1564499820', 0, 1, 62, 16),
(815, 'Ex ab enim.', '1564499820', 1, 1, 57, 25),
(816, 'Architecto quia aliquam repellendus autem ut.', '1564499820', 0, 1, 22, 92),
(817, 'Id eos consectetur voluptatem voluptas.', '1564499820', 0, 0, 12, 44),
(818, 'Praesentium sit.', '1564499820', 0, 0, 19, 5),
(819, 'Alias.', '1564499820', 0, 0, 20, 36),
(820, 'Sed vel enim.', '1564499820', 0, 1, 33, 69),
(821, 'Aspernatur.', '1564499820', 0, 1, 23, 54),
(822, 'Rerum dicta voluptatem quia explicabo.', '1564499820', 0, 1, 3, 39),
(823, 'Aut porro iste est.', '1564499820', 0, 0, 43, 47),
(824, 'Consequatur est.', '1564499820', 0, 0, 46, 96),
(825, 'Reiciendis omnis veniam neque.', '1564499820', 0, 0, 68, 71),
(826, 'Atque dolorem qui enim velit.', '1564499820', 0, 0, 37, 30),
(827, 'Dolor voluptas est id.', '1564499820', 1, 0, 92, 23),
(828, 'Dolor id.', '1564499820', 0, 1, 81, 55),
(829, 'Et dolores quod.', '1564499820', 0, 1, 93, 24),
(830, 'Eos tenetur est non.', '1564499820', 1, 1, 31, 1),
(831, 'Perferendis eum.', '1564499820', 1, 1, 17, 53),
(832, 'Deserunt est nobis reiciendis.', '1564499820', 0, 0, 40, 88),
(833, 'Et quae vel totam officia.', '1564499820', 0, 0, 3, 6),
(834, 'Labore a enim.', '1564499820', 0, 0, 93, 38),
(835, 'Ut id et.', '1564499821', 1, 0, 35, 51),
(836, 'Vitae reiciendis placeat.', '1564499821', 0, 1, 75, 87),
(837, 'Sunt.', '1564499821', 0, 0, 30, 33),
(838, 'Molestiae quaerat reprehenderit voluptas.', '1564499821', 0, 1, 19, 91),
(839, 'Sed.', '1564499821', 1, 0, 40, 81),
(840, 'Nihil voluptatem animi.', '1564499821', 1, 1, 44, 68),
(841, 'Dolor laboriosam rerum in.', '1564499821', 1, 0, 33, 33),
(842, 'Magnam.', '1564499821', 1, 0, 87, 61),
(843, 'Quia iure.', '1564499821', 0, 0, 85, 52),
(844, 'Id qui.', '1564499821', 1, 1, 46, 91),
(845, 'Deserunt fugiat officia iure.', '1564499821', 1, 1, 56, 31),
(846, 'Sit explicabo illo.', '1564499821', 0, 1, 38, 7),
(847, 'Quaerat reiciendis est eius est quia.', '1564499821', 1, 0, 93, 47),
(848, 'Aperiam optio maiores.', '1564499821', 1, 0, 16, 44),
(849, 'Fuga repellat.', '1564499821', 1, 1, 12, 84),
(850, 'Minima consequatur et enim deserunt esse.', '1564499821', 0, 1, 67, 94),
(851, 'Doloremque et et.', '1564499821', 0, 0, 82, 89),
(852, 'Magnam magni a.', '1564499821', 0, 0, 13, 75),
(853, 'Velit facere molestiae.', '1564499821', 1, 1, 65, 26),
(854, 'Ab numquam harum at sunt qui.', '1564499821', 0, 0, 36, 21),
(855, 'In perspiciatis.', '1564499821', 0, 0, 53, 47),
(856, 'Possimus ea rem.', '1564499821', 0, 0, 8, 35),
(857, 'Dolorem eos libero.', '1564499821', 0, 0, 41, 30),
(858, 'Culpa eum.', '1564499821', 1, 0, 86, 39),
(859, 'Asperiores itaque.', '1564499821', 0, 0, 21, 35),
(860, 'Error molestias qui.', '1564499821', 0, 0, 71, 4),
(861, 'Molestiae beatae.', '1564499821', 0, 0, 95, 27),
(862, 'Assumenda error eos blanditiis et autem.', '1564499821', 0, 1, 93, 29),
(863, 'Rerum est.', '1564499821', 1, 0, 22, 36),
(864, 'Sint.', '1564499821', 0, 1, 26, 82),
(865, 'Illo voluptas.', '1564499821', 1, 1, 65, 77),
(866, 'Dolores sint et.', '1564499821', 0, 0, 24, 9),
(867, 'Ut eaque porro consequatur consequatur.', '1564499821', 1, 0, 37, 86),
(868, 'Alias.', '1564499821', 0, 0, 87, 90),
(869, 'Unde necessitatibus in.', '1564499821', 1, 0, 18, 84),
(870, 'Est ut vel.', '1564499821', 0, 0, 44, 15);
INSERT INTO `messages_list` (`id`, `lastMessage`, `lastMessageDate`, `messageStatus`, `enable_reply`, `userId`, `toId`) VALUES
(871, 'Voluptatum eius et voluptatibus id sint.', '1564499821', 0, 1, 27, 47),
(872, 'Ut accusantium dolorem.', '1564499821', 0, 1, 11, 96),
(873, 'Consequatur molestiae est harum.', '1564499821', 1, 0, 26, 22),
(874, 'Reprehenderit modi dicta ea.', '1564499821', 0, 1, 70, 3),
(875, 'Quae reiciendis.', '1564499821', 1, 1, 6, 31),
(876, 'Corrupti eaque eos possimus.', '1564499821', 0, 1, 20, 10),
(877, 'Non quod.', '1564499821', 1, 1, 17, 64),
(878, 'Necessitatibus corrupti perspiciatis.', '1564499821', 0, 1, 16, 75),
(879, 'Sunt eaque.', '1564499821', 1, 0, 38, 75),
(880, 'Quisquam consequatur ex commodi ut.', '1564499821', 0, 1, 41, 52),
(881, 'Officiis atque repellat rerum accusantium.', '1564499821', 0, 0, 79, 25),
(882, 'Perferendis inventore.', '1564499821', 1, 0, 51, 6),
(883, 'Adipisci repellendus.', '1564499821', 1, 1, 27, 73),
(884, 'Accusantium.', '1564499821', 1, 1, 40, 13),
(885, 'Error.', '1564499821', 0, 1, 12, 7),
(886, 'Est et perspiciatis nihil occaecati.', '1564499821', 0, 0, 2, 91),
(887, 'Veniam qui qui.', '1564499821', 1, 1, 47, 79),
(888, 'Illo sit.', '1564499821', 1, 0, 92, 28),
(889, 'Ut.', '1564499821', 0, 1, 88, 77),
(890, 'Sunt alias quo aliquid tempora cum.', '1564499821', 0, 1, 6, 96),
(891, 'Quo hic quod vel.', '1564499821', 0, 0, 53, 66),
(892, 'Laboriosam libero quibusdam quibusdam.', '1564499821', 0, 0, 56, 30),
(893, 'Voluptate.', '1564499821', 0, 1, 41, 57),
(894, 'Illum et iure.', '1564499821', 1, 0, 69, 4),
(895, 'Sunt illo sed id.', '1564499821', 1, 1, 5, 12),
(896, 'Enim sunt.', '1564499821', 1, 1, 53, 28),
(897, 'Ipsam quidem.', '1564499821', 0, 1, 47, 50),
(898, 'Harum deleniti debitis.', '1564499821', 0, 0, 28, 65),
(899, 'Voluptatibus ducimus illo praesentium.', '1564499821', 0, 0, 18, 43),
(900, 'Est qui nemo consequuntur.', '1564499821', 1, 0, 68, 49),
(901, 'Molestias.', '1564499821', 1, 1, 38, 12),
(902, 'Architecto qui fugiat libero.', '1564499821', 1, 1, 25, 92),
(903, 'Assumenda voluptatum.', '1564499821', 0, 1, 50, 30),
(904, 'Fuga veritatis nemo voluptatem.', '1564499821', 0, 0, 68, 16),
(905, 'Perspiciatis explicabo.', '1564499821', 0, 1, 72, 3),
(906, 'Quis praesentium.', '1564499821', 1, 1, 90, 42),
(907, 'Qui.', '1564499822', 0, 0, 67, 56),
(908, 'Sed est accusamus.', '1564499822', 1, 0, 79, 51),
(909, 'Quo doloremque vel ipsam.', '1564499822', 1, 0, 18, 86),
(910, 'Odio beatae.', '1564499822', 0, 1, 2, 26),
(911, 'Sint nemo labore dolores quisquam aut.', '1564499822', 0, 1, 24, 58),
(912, 'Voluptas in vero.', '1564499822', 0, 0, 57, 52),
(913, 'Modi praesentium vero.', '1564499822', 0, 0, 89, 41),
(914, 'Deserunt incidunt.', '1564499822', 1, 1, 81, 92),
(915, 'Quia consectetur.', '1564499822', 1, 0, 82, 55),
(916, 'Ut sed placeat sequi nam.', '1564499822', 0, 1, 64, 74),
(917, 'Numquam velit sunt voluptatibus.', '1564499822', 0, 1, 74, 27),
(918, 'Vel debitis sunt.', '1564499822', 0, 0, 48, 43),
(919, 'Cumque qui praesentium possimus.', '1564499822', 1, 1, 19, 32),
(920, 'Rerum sunt.', '1564499822', 1, 1, 76, 50),
(921, 'Et eveniet harum aut.', '1564499822', 1, 0, 79, 1),
(922, 'Et perferendis.', '1564499822', 0, 1, 37, 58),
(923, 'Odit sunt.', '1564499822', 1, 1, 36, 19),
(924, 'Incidunt.', '1564499822', 1, 1, 72, 28),
(925, 'Eligendi hic.', '1564499822', 1, 1, 40, 81),
(926, 'Exercitationem itaque reiciendis aut voluptas.', '1564499822', 1, 1, 59, 91),
(927, 'Optio culpa ut dolor.', '1564499822', 0, 1, 90, 65),
(928, 'Impedit ipsum quia.', '1564499822', 1, 0, 13, 24),
(929, 'Ducimus distinctio aut ad.', '1564499822', 1, 0, 95, 41),
(930, 'Fugiat accusantium.', '1564499822', 0, 0, 40, 53),
(931, 'Quia veritatis.', '1564499822', 0, 0, 53, 48),
(932, 'Ipsam.', '1564499822', 0, 0, 13, 13),
(933, 'Fugit delectus.', '1564499822', 1, 0, 57, 62),
(934, 'Voluptas est nisi.', '1564499822', 0, 0, 21, 11),
(935, 'Sint.', '1564499822', 0, 0, 44, 69),
(936, 'Nulla debitis sed culpa et.', '1564499822', 1, 0, 45, 95),
(937, 'Tempore consequatur.', '1564499822', 1, 1, 86, 66),
(938, 'Molestiae quaerat.', '1564499822', 1, 1, 92, 32),
(939, 'Aliquam non.', '1564499822', 1, 1, 49, 53),
(940, 'Sit nobis consequatur pariatur.', '1564499822', 0, 1, 9, 81),
(941, 'Repudiandae ut sed.', '1564499822', 1, 0, 45, 92),
(942, 'Officiis nam reprehenderit nam.', '1564499822', 0, 1, 69, 36),
(943, 'Aut quis.', '1564499822', 0, 0, 74, 25),
(944, 'Qui sed aut.', '1564499822', 0, 1, 37, 67),
(945, 'Ut.', '1564499822', 0, 1, 25, 86),
(946, 'Sed vitae quo dolores.', '1564499822', 0, 1, 22, 11),
(947, 'Et labore.', '1564499822', 1, 0, 57, 81),
(948, 'Est dolore soluta voluptas.', '1564499822', 0, 1, 45, 48),
(949, 'Molestias sint delectus fugiat.', '1564499822', 0, 1, 43, 2),
(950, 'Velit quo omnis.', '1564499822', 0, 0, 21, 17),
(951, 'Magni omnis.', '1564499822', 0, 0, 49, 86),
(952, 'Quis assumenda alias incidunt sed ullam.', '1564499822', 1, 0, 65, 68),
(953, 'Exercitationem sed ea illo.', '1564499822', 1, 0, 3, 20),
(954, 'Aut temporibus sunt cumque veritatis.', '1564499822', 0, 1, 84, 8),
(955, 'Dolore excepturi.', '1564499822', 0, 0, 47, 71),
(956, 'Occaecati eum laudantium.', '1564499822', 0, 1, 41, 84),
(957, 'Quaerat hic.', '1564499822', 1, 0, 46, 52),
(958, 'Animi est reiciendis voluptatem quasi.', '1564499822', 1, 1, 23, 43),
(959, 'Atque qui repellat laudantium quaerat aut.', '1564499822', 0, 0, 30, 95),
(960, 'Molestias dolorem accusantium.', '1564499822', 0, 0, 74, 44),
(961, 'Vitae.', '1564499822', 0, 1, 64, 57),
(962, 'Eaque quisquam.', '1564499822', 1, 0, 63, 18),
(963, 'Officiis.', '1564499822', 0, 0, 83, 85),
(964, 'Explicabo voluptatem vitae.', '1564499822', 1, 1, 69, 5),
(965, 'Nisi rem hic odio.', '1564499822', 0, 1, 50, 58),
(966, 'Ad dolore qui.', '1564499822', 0, 1, 79, 42),
(967, 'Consequatur vero fugiat enim saepe.', '1564499822', 1, 0, 60, 22),
(968, 'Beatae maxime.', '1564499822', 0, 0, 1, 72),
(969, 'Quod excepturi placeat.', '1564499822', 1, 1, 38, 74),
(970, 'Quis aut exercitationem soluta.', '1564499822', 1, 0, 34, 77),
(971, 'Voluptas eius.', '1564499822', 0, 0, 88, 13),
(972, 'Ut placeat accusantium enim.', '1564499822', 0, 0, 51, 76),
(973, 'Omnis maiores rem dolorem.', '1564499822', 1, 1, 2, 96),
(974, 'Sint cum natus.', '1564499822', 1, 0, 66, 50),
(975, 'Odio culpa.', '1564499822', 1, 0, 56, 85),
(976, 'Harum et et cum.', '1564499822', 0, 0, 83, 26),
(977, 'Esse.', '1564499822', 0, 1, 26, 31),
(978, 'Voluptas delectus molestias.', '1564499822', 1, 0, 84, 67),
(979, 'Sint dolores quo in.', '1564499822', 1, 1, 3, 23),
(980, 'Consequatur ut voluptate.', '1564499822', 0, 1, 25, 39),
(981, 'Necessitatibus sapiente.', '1564499822', 0, 1, 95, 49),
(982, 'Aut.', '1564499822', 0, 1, 26, 56),
(983, 'Et omnis.', '1564499822', 1, 0, 75, 42),
(984, 'Omnis enim voluptatum.', '1564499822', 0, 1, 32, 79),
(985, 'Qui dolores ipsa quia ut.', '1564499822', 1, 0, 68, 47),
(986, 'Suscipit vel.', '1564499822', 0, 0, 62, 30),
(987, 'Id minus voluptatem explicabo.', '1564499822', 0, 0, 5, 89),
(988, 'Illo doloremque.', '1564499822', 1, 1, 37, 43),
(989, 'Quaerat maiores est.', '1564499822', 1, 0, 31, 80),
(990, 'Eum sint sed assumenda enim.', '1564499822', 0, 1, 88, 66),
(991, 'Vero omnis ut.', '1564499822', 1, 0, 16, 56),
(992, 'Laborum aut et aut.', '1564499822', 0, 1, 4, 47),
(993, 'Nemo occaecati.', '1564499822', 1, 1, 62, 3),
(994, 'Laboriosam.', '1564499822', 0, 0, 49, 13),
(995, 'Ipsam molestiae nisi.', '1564499822', 0, 1, 72, 42),
(996, 'Perferendis error et fugiat consequatur voluptatem.', '1564499822', 0, 1, 54, 62),
(997, 'Et laboriosam molestiae illo adipisci.', '1564499822', 0, 1, 75, 82),
(998, 'Dolor sunt.', '1564499822', 0, 1, 26, 84),
(999, 'Cumque.', '1564499822', 1, 0, 5, 25),
(1000, 'Esse impedit voluptas.', '1564499822', 1, 1, 57, 44);

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
(1, 'Amara Hand', 'parents', 'Voluptatibus eius sunt possimus ea impedit numquam iste recusandae odit.', 1564499805, 'Morris Schaden'),
(2, 'Mrs. Alanna Dach', 'parents', 'Nihil facere officiis quo dicta nisi qui.', 1564499805, 'Cortez Langosh'),
(3, 'Kobe Kuvalis', 'students', 'Dolorem non quis aut dolor sit consequuntur necessitatibus ut.', 1564499805, 'Emma Jenkins PhD'),
(4, 'Owen Cummings Sr.', 'employees', 'Corporis corrupti est exercitationem.', 1564499805, 'Justus Pfannerstill'),
(5, 'Esther DuBuque', 'teachers', 'Expedita quisquam ipsa repudiandae aut sunt saepe optio dolorum vero et.', 1564499805, 'Lourdes O\'Reilly'),
(6, 'Mr. Jalon Hahn', 'parents', 'Ullam est ex ipsa dolorum aut.', 1564499805, 'Ms. Angeline Hoeger'),
(7, 'Freeda Rau MD', 'teachers', 'Commodi vitae ut culpa accusamus.', 1564499805, 'Mallie Franecki V'),
(8, 'Beulah Murphy', 'teachers', 'Mollitia ea qui modi cumque asperiores ducimus consequatur et assumenda id.', 1564499805, 'Maximillian Waters'),
(9, 'Mr. Matteo Schultz', 'employees', 'Quam est sint molestias quod soluta voluptatibus.', 1564499805, 'Abner Ruecker'),
(10, 'Ronny Borer', 'teachers', 'Error repellendus et minima non.', 1564499805, 'Bert Kutch'),
(11, 'Miss Maggie Hegmann IV', 'students', 'Rerum quibusdam nesciunt nobis non quibusdam sequi.', 1564499805, 'Mariane Weissnat'),
(12, 'Janet Kohler III', 'teachers', 'Sint aliquam soluta perspiciatis ducimus eaque id et.', 1564499805, 'Summer Rempel'),
(13, 'Prof. Teresa Kuhn DDS', 'teachers', 'Vitae culpa aut accusantium magnam iusto laboriosam quas libero magni sunt.', 1564499805, 'John Hahn'),
(14, 'Dr. Alexandrea Kuhic', 'students', 'Dolores nesciunt rerum.', 1564499805, 'Kristoffer Jaskolski'),
(15, 'Ms. Ollie Witting II', 'students', 'Quam dolorem harum recusandae.', 1564499805, 'Don Schaefer'),
(16, 'Liza Marks', 'parents', 'Qui accusantium asperiores aliquam dolor occaecati.', 1564499805, 'Ms. Whitney O\'Conner PhD'),
(17, 'Reyna Klocko', 'students', 'Sit dolor hic ipsa modi.', 1564499805, 'Hadley Paucek'),
(18, 'Maryjane Nicolas', 'parents', 'Est saepe fuga id.', 1564499805, 'Noel Jast'),
(19, 'Macey McCullough', 'teachers', 'Tenetur corrupti aut quibusdam.', 1564499805, 'Icie Bartoletti MD'),
(20, 'Archibald Stoltenberg', 'teachers', 'Id magni mollitia velit quod.', 1564499805, 'Tatyana Blick II'),
(21, 'Bud Bayer', 'students', 'Molestiae est quibusdam et iste quia.', 1564499805, 'Velva Schuster I'),
(22, 'Colleen Greenfelder MD', 'teachers', 'Ipsum ducimus illum vero.', 1564499805, 'Dr. Casimer Klocko II'),
(23, 'Cristal Friesen', 'teachers', 'Quas consequatur cupiditate quisquam praesentium quis placeat voluptatem voluptatem eveniet quos.', 1564499805, 'Amely McCullough'),
(24, 'Prof. Kaelyn Veum DDS', 'students', 'Ea voluptates et et quam vitae earum.', 1564499805, 'Prof. Uriel Thiel'),
(25, 'Reta Yundt MD', 'teachers', 'Consequatur numquam facere aut ea ipsum.', 1564499805, 'Cecilia Kemmer'),
(26, 'Ashton Raynor', 'parents', 'Sint quis amet dignissimos laboriosam in consequuntur.', 1564499805, 'Edison Hamill I'),
(27, 'Ken Beer III', 'teachers', 'Omnis modi et voluptas tenetur eaque dolorem est et soluta qui.', 1564499805, 'Jazmyne Huels'),
(28, 'Clair Durgan', 'employees', 'Rerum dolore temporibus assumenda et consequatur.', 1564499805, 'Desmond Conroy'),
(29, 'Jeffry Krajcik', 'parents', 'Vel porro in sapiente rerum.', 1564499805, 'Mrs. Sylvia Vandervort'),
(30, 'Alexie Steuber', 'employees', 'Dolores est nostrum voluptates autem quas dicta.', 1564499805, 'Prof. Anita Smith Sr.'),
(31, 'Zachariah VonRueden', 'employees', 'Harum magni blanditiis.', 1564499805, 'Dr. Roy Johnston'),
(32, 'Ms. Dasia Crist', 'students', 'Rerum adipisci eveniet alias ullam rerum ut eos ab.', 1564499805, 'Ms. Frida Gislason I'),
(33, 'Clifford Thiel DVM', 'employees', 'Odit nostrum doloribus quae est.', 1564499805, 'Miss Marisol Hoeger II'),
(34, 'Estevan O\'Conner DDS', 'employees', 'Eos non quia iusto in est aut.', 1564499805, 'Lester Walsh III'),
(35, 'Mrs. Karli Reichert', 'students', 'Libero nihil optio autem.', 1564499805, 'Ferne Harvey'),
(36, 'Davonte Towne', 'teachers', 'Incidunt qui dolor quis iure asperiores.', 1564499805, 'Brooke Spencer'),
(37, 'Taylor Leannon II', 'parents', 'Qui mollitia distinctio est excepturi reprehenderit.', 1564499805, 'Miss Jaunita Kirlin'),
(38, 'Breanna Brown', 'parents', 'Quia non facilis aut fugit maiores similique.', 1564499805, 'Stephen Stiedemann'),
(39, 'Ms. Phyllis Batz', 'employees', 'Iste magnam a aut.', 1564499805, 'Zoe Marvin'),
(40, 'Lesly Roberts PhD', 'employees', 'Rerum excepturi nobis voluptate laborum culpa placeat veritatis laudantium magnam.', 1564499805, 'Clemmie Jacobs'),
(41, 'Kenyon Krajcik', 'parents', 'Aut id maiores doloremque consequatur unde.', 1564499805, 'Zack Block'),
(42, 'Mrs. Mariah Kuhlman', 'employees', 'Distinctio delectus in voluptatibus earum vero.', 1564499805, 'Mrs. Zaria Pollich V'),
(43, 'Kariane Stamm', 'teachers', 'Blanditiis laudantium natus est earum.', 1564499805, 'Zena Gibson DDS'),
(44, 'Naomi Dickens IV', 'employees', 'Sed cum ea consequuntur magnam.', 1564499805, 'Macey Hoeger V'),
(45, 'Harold Hoeger', 'employees', 'Officia itaque laudantium dignissimos repudiandae.', 1564499805, 'Shemar Orn'),
(46, 'Erin Purdy I', 'parents', 'Placeat consequatur nihil qui ea sit eveniet aut ducimus vel ex assumenda.', 1564499805, 'Maxime Hickle'),
(47, 'Miss Margaretta Schuster', 'students', 'Magni rerum nostrum ullam.', 1564499805, 'Marilyne Stoltenberg'),
(48, 'Leopold Graham', 'teachers', 'Odit quas animi qui corrupti aut.', 1564499805, 'Gabriel Little'),
(49, 'Mr. Verner Carter', 'students', 'Nisi consectetur sed tempore repudiandae quam commodi voluptatum consequatur.', 1564499805, 'Prof. Stephen Harber Jr.'),
(50, 'Mia Huel Sr.', 'employees', 'Sed nam ullam aut nobis.', 1564499805, 'Candace Donnelly'),
(51, 'users', '[72,65]', 'Test', 1564520923, 'Ahmed Sayed [ 1 ] '),
(52, 'users', '[51,48,55,70,1]', 'Hello', 1564521251, 'Ahmed Sayed [ 1 ] ');

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
(1, 'Sit perferendis soluta.', 'Exercitationem voluptatem laborum et sequi sunt qui minus.', 'parents', 1564499803, '', 0, 1564499803),
(2, 'Quisquam recusandae asperiores reprehenderit.', 'Fugit consequatur quo hic quia quaerat.', 'all', 1564499803, '', 1, 1564499803),
(3, 'Est velit natus aut.', 'Consequatur iure porro expedita et cumque.', 'students', 1564499803, '', 1, 1564499803),
(4, 'Quae atque adipisci.', 'Harum quo ab ut dolore nostrum praesentium in consectetur sed molestias reprehenderit omnis nobis.', 'students', 1564499803, '', 0, 1564499803),
(5, 'Quisquam vero et.', 'Sapiente et maxime voluptate delectus sed velit nulla deleniti blanditiis dolor sint nostrum et.', 'all', 1564499803, '', 1, 1564499803),
(6, 'Beatae et.', 'Saepe adipisci quam recusandae eum dolore est rerum quia ratione.', 'teacher', 1564499803, '', 0, 1564499803),
(7, 'Eos cupiditate.', 'Magni esse assumenda nulla repellat qui magnam mollitia nam rerum similique fugiat.', 'teacher', 1564499803, '', 1, 1564499803),
(8, 'Ut exercitationem.', 'In molestias dolorum velit adipisci magnam reiciendis id.', 'all', 1564499803, '', 1, 1564499803),
(9, 'Dolorum est pariatur.', 'Libero nulla culpa est molestiae error.', 'all', 1564499803, '', 1, 1564499803),
(10, 'Explicabo id sint.', 'Autem reiciendis nihil in non architecto dolorem ut rerum est.', 'teacher', 1564499803, '', 0, 1564499803),
(11, 'Dolor vero nesciunt aliquid.', 'Rerum consequuntur rerum ducimus perferendis cum vero quaerat cum consequuntur totam.', 'students', 1564499803, '', 0, 1564499803),
(12, 'Et voluptatem tempora ad magnam illum.', 'Et quasi laboriosam adipisci sed dolorem voluptatem id.', 'teacher', 1564499803, '', 1, 1564499803),
(13, 'Voluptatem laudantium incidunt.', 'Quisquam dicta omnis ratione blanditiis eius quia rem eligendi.', 'parents', 1564499803, '', 0, 1564499803),
(14, 'Voluptas et est.', 'Eius harum unde illo illum et sit dolorem eaque.', 'teacher', 1564499803, '', 1, 1564499803),
(15, 'Ut quo rerum officia dolore sit.', 'Iure et quis numquam est.', 'teacher', 1564499803, '', 1, 1564499803),
(16, 'Sunt quae.', 'Non aut quo in cum cupiditate libero deserunt.', 'students', 1564499803, '', 1, 1564499803),
(17, 'Mollitia id.', 'Magni quia ducimus enim velit iure voluptas recusandae vel at ut enim non consectetur.', 'teacher', 1564499803, '', 0, 1564499803),
(18, 'Inventore tempore doloribus.', 'Vero assumenda expedita ex cupiditate sint nihil officiis assumenda cumque.', 'students', 1564499803, '', 1, 1564499803),
(19, 'Esse nobis qui.', 'Quo id voluptatem hic aut corrupti accusamus id enim.', 'parents', 1564499803, '', 1, 1564499803),
(20, 'Eos numquam quis.', 'Perferendis autem consectetur perferendis veniam enim aperiam consequatur aperiam.', 'all', 1564499803, '', 1, 1564499803);

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
(1, 'attendance', 'Doloribus rerum.', 48, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(2, 'news', 'Voluptas mollitia non.', 22, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(3, 'news', 'Esse in aut.', 68, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(4, 'message', 'Tenetur est voluptas tempore.', 31, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(5, 'message', 'Qui quaerat facilis rerum voluptates.', 57, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(6, 'message', 'Incidunt consequuntur aut architecto quia.', 83, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(7, 'news', 'Molestiae ut mollitia est.', 20, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(8, 'attendance', 'Quam earum in.', 80, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(9, 'attendance', 'In mollitia explicabo.', 90, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(10, 'message', 'Nostrum ipsa quasi.', 18, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(11, 'news', 'Labore eius quia.', 40, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(12, 'attendance', 'Ut nostrum consequatur.', 54, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(13, 'attendance', 'Dolores culpa quia et sequi.', 60, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(14, 'news', 'Voluptatibus non occaecati.', 63, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(15, 'message', 'Dolorem accusamus nihil unde.', 46, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(16, 'attendance', 'Sit mollitia.', 45, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(17, 'news', 'Voluptas et aperiam.', 68, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(18, 'attendance', 'Aperiam quae totam aut.', 37, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(19, 'attendance', 'Molestias aut facilis.', 63, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(20, 'attendance', 'Minima odio.', 62, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(21, 'message', 'Est voluptates impedit et.', 16, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:03', '2019-07-30 13:17:03'),
(22, 'attendance', 'At est.', 49, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(23, 'attendance', 'Voluptatum inventore neque illo.', 62, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(24, 'attendance', 'Ut in tenetur blanditiis officia.', 93, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(25, 'attendance', 'Dolorem dicta saepe vel.', 79, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(26, 'message', 'Quia laudantium quibusdam.', 21, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(27, 'attendance', 'Amet sapiente neque.', 36, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(28, 'news', 'Dolores ut quos doloribus.', 48, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(29, 'news', 'Est aperiam atque asperiores.', 60, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(30, 'message', 'Modi qui.', 45, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(31, 'attendance', 'Vel voluptatem.', 61, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(32, 'news', 'Saepe dolorem nostrum consequuntur.', 47, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(33, 'news', 'Expedita officiis.', 59, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(34, 'attendance', 'Fugit aut dolor.', 62, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(35, 'message', 'Mollitia est et iusto.', 41, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(36, 'message', 'Sit quasi unde.', 66, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(37, 'message', 'Omnis ut totam.', 69, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(38, 'news', 'Sit voluptatem sed id aut.', 1, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(39, 'message', 'Voluptas deserunt delectus non.', 30, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(40, 'message', 'Et qui.', 58, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(41, 'news', 'Tempore quos aut aperiam.', 88, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(42, 'message', 'Nulla esse dolore.', 1, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(43, 'news', 'Itaque qui.', 24, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(44, 'news', 'Numquam non.', 13, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(45, 'message', 'Sit dicta.', 82, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(46, 'news', 'Voluptatem ipsa repellendus.', 52, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(47, 'message', 'Et amet.', 41, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(48, 'attendance', 'Omnis culpa.', 39, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(49, 'message', 'Omnis pariatur.', 41, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(50, 'news', 'Iusto ut aliquid.', 64, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(51, 'message', 'Fuga laborum veniam incidunt numquam.', 24, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(52, 'message', 'Consectetur occaecati.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(53, 'message', 'Voluptates vel est.', 78, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(54, 'news', 'Quo rerum velit natus.', 23, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(55, 'news', 'In omnis.', 15, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(56, 'message', 'Qui qui.', 85, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(57, 'attendance', 'Laborum ut voluptas.', 16, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(58, 'attendance', 'Sapiente quas consequatur quam consequatur.', 22, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(59, 'news', 'A impedit non est.', 87, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(60, 'message', 'Dolore et asperiores qui exercitationem.', 39, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(61, 'news', 'Modi et quam.', 46, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:04', '2019-07-30 13:17:04'),
(62, 'news', 'Quas quas.', 19, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(63, 'attendance', 'Dolore voluptas.', 63, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(64, 'attendance', 'Aliquam similique.', 14, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(65, 'news', 'Quod ut incidunt.', 85, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(66, 'news', 'Corporis fugit voluptas.', 10, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(67, 'message', 'Distinctio id eum omnis.', 42, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(68, 'news', 'Nisi impedit aut.', 53, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(69, 'news', 'Magnam distinctio maiores.', 66, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(70, 'message', 'Et velit est.', 68, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(71, 'attendance', 'Omnis nisi animi.', 68, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(72, 'message', 'Esse distinctio.', 60, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(73, 'attendance', 'Reprehenderit perferendis et sed.', 50, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(74, 'news', 'Ut est in.', 18, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(75, 'news', 'Vel et.', 25, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(76, 'message', 'Deserunt est magnam est.', 75, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(77, 'attendance', 'Enim id.', 47, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(78, 'message', 'Eveniet rem.', 9, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(79, 'news', 'Fugiat animi.', 75, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(80, 'message', 'Reprehenderit maxime.', 46, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(81, 'attendance', 'Sit aut.', 52, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(82, 'message', 'Veniam voluptatibus quis eum.', 32, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(83, 'attendance', 'Occaecati aut porro.', 86, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(84, 'news', 'Quo iure cumque dolorem.', 17, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(85, 'news', 'Praesentium omnis.', 89, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(86, 'news', 'Maiores dolores aliquam.', 48, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(87, 'news', 'Eaque est.', 52, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(88, 'news', 'Iusto eos.', 46, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(89, 'message', 'Numquam atque tenetur repellendus.', 20, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(90, 'message', 'Omnis ut suscipit eum.', 19, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(91, 'attendance', 'Non facilis iste.', 28, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(92, 'message', 'Similique soluta fuga.', 61, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(93, 'message', 'Voluptatem est qui cum.', 60, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(94, 'message', 'Ut exercitationem.', 4, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(95, 'attendance', 'Reprehenderit distinctio a.', 54, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(96, 'news', 'Architecto unde et.', 8, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(97, 'attendance', 'Dolorem repudiandae qui.', 96, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(98, 'news', 'Ratione optio.', 41, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(99, 'message', 'Fugiat totam non.', 40, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(100, 'message', 'Saepe tempora.', 74, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(101, 'message', 'Consequatur et sit.', 69, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(102, 'news', 'Qui ea aut.', 7, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(103, 'attendance', 'Dolores qui ut.', 12, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(104, 'news', 'Sit sequi consectetur.', 1, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(105, 'news', 'Eligendi recusandae.', 56, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(106, 'attendance', 'Debitis officia.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(107, 'attendance', 'Et est consequatur.', 61, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(108, 'message', 'Soluta quasi doloremque repudiandae.', 32, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:05', '2019-07-30 13:17:05'),
(109, 'attendance', 'Ut molestiae saepe.', 61, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(110, 'news', 'Ut deserunt quam porro ad.', 13, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(111, 'message', 'Aspernatur qui libero.', 80, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(112, 'message', 'Voluptatem quia et.', 41, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(113, 'message', 'Quae eveniet at.', 47, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(114, 'attendance', 'Aut dolor et.', 70, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(115, 'message', 'Et doloribus.', 46, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(116, 'news', 'Nesciunt eius reprehenderit.', 10, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(117, 'news', 'Unde omnis.', 45, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(118, 'attendance', 'Ea voluptatem.', 91, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(119, 'news', 'Velit quo quo.', 47, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(120, 'attendance', 'Animi harum amet.', 44, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(121, 'news', 'Et repellendus voluptatem non laboriosam.', 35, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(122, 'attendance', 'Expedita provident.', 95, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(123, 'attendance', 'Doloribus eos est.', 61, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(124, 'news', 'Perspiciatis autem.', 7, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(125, 'news', 'Eos distinctio iusto.', 67, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(126, 'attendance', 'Est sed.', 96, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(127, 'news', 'Rem est assumenda eligendi.', 18, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(128, 'message', 'Quam quasi dolorem non.', 69, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(129, 'message', 'At perferendis temporibus.', 91, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(130, 'news', 'Autem est sint.', 64, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(131, 'attendance', 'Asperiores et aut.', 64, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(132, 'attendance', 'Et officia occaecati cumque.', 84, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(133, 'attendance', 'Tempora nihil qui.', 47, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(134, 'message', 'Ea repudiandae maiores itaque.', 21, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(135, 'message', 'Rem dolores minima.', 67, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(136, 'attendance', 'Et porro.', 69, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(137, 'attendance', 'Harum dolorum consequatur aut.', 93, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(138, 'message', 'Sed eos ipsam.', 23, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(139, 'attendance', 'Nam occaecati illo in.', 42, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(140, 'news', 'Quod qui itaque esse.', 34, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(141, 'news', 'Et numquam.', 41, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(142, 'attendance', 'Autem repudiandae.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(143, 'message', 'Corrupti nulla.', 67, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(144, 'attendance', 'Ipsum libero nisi et.', 24, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(145, 'message', 'Dolore quia esse dolor.', 37, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(146, 'message', 'Vel et corporis.', 59, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(147, 'message', 'At natus.', 47, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(148, 'news', 'Et et et libero.', 12, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(149, 'news', 'Nihil dolorem sint.', 39, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(150, 'news', 'Deserunt qui iste.', 96, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(151, 'message', 'Eaque animi voluptatibus non.', 27, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(152, 'attendance', 'Reprehenderit tempore at.', 8, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(153, 'news', 'Unde beatae.', 66, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(154, 'news', 'Vero vitae qui.', 60, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(155, 'attendance', 'Aspernatur quo voluptatem.', 9, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(156, 'attendance', 'Non pariatur nostrum.', 86, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(157, 'message', 'Consequatur voluptas eos.', 67, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(158, 'news', 'Quia id recusandae.', 23, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(159, 'attendance', 'Officiis quis sed reprehenderit.', 31, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:06', '2019-07-30 13:17:06'),
(160, 'message', 'Ut aut saepe sint.', 95, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(161, 'message', 'Architecto nihil.', 11, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(162, 'news', 'Possimus porro iste.', 36, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(163, 'message', 'Porro sunt non vero deleniti.', 38, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(164, 'message', 'Dolor occaecati voluptas optio rem.', 86, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(165, 'message', 'Eius dolor reiciendis.', 5, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(166, 'message', 'Voluptates quam.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(167, 'attendance', 'Voluptates tenetur dignissimos.', 15, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(168, 'news', 'Laudantium qui a.', 12, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(169, 'message', 'Velit nisi facilis.', 75, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(170, 'news', 'Rerum mollitia nihil et quae.', 73, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(171, 'attendance', 'Eveniet repellat molestiae.', 10, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(172, 'attendance', 'Autem alias suscipit unde.', 78, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(173, 'attendance', 'Deleniti est dolores.', 61, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(174, 'news', 'Quasi reiciendis.', 67, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(175, 'message', 'Autem voluptatibus eum.', 30, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(176, 'news', 'Voluptatum adipisci.', 63, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(177, 'message', 'Illum non sequi.', 6, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(178, 'message', 'Voluptas sed.', 27, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(179, 'message', 'Cum ad tenetur eos.', 75, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(180, 'attendance', 'Tenetur magni distinctio.', 65, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(181, 'message', 'Possimus eos non.', 64, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(182, 'message', 'Dicta veniam pariatur.', 71, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(183, 'message', 'Laboriosam iusto laudantium voluptatem.', 39, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(184, 'attendance', 'Quis delectus.', 41, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(185, 'message', 'Cumque quia sit.', 35, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(186, 'news', 'Ea dolores tempora quasi non.', 77, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(187, 'news', 'Id repellendus rerum.', 2, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(188, 'news', 'Numquam soluta.', 3, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(189, 'news', 'Maiores dolore quia.', 80, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(190, 'news', 'Et iure.', 58, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(191, 'attendance', 'Vitae quo voluptas.', 95, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(192, 'attendance', 'Magni ad.', 94, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(193, 'news', 'Est nesciunt.', 28, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(194, 'message', 'Odit eum.', 65, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(195, 'news', 'Est voluptatem quasi voluptatum.', 71, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(196, 'attendance', 'Quo aut corrupti quas odio.', 1, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(197, 'message', 'Enim consequatur earum.', 52, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(198, 'message', 'Error nisi.', 10, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(199, 'news', 'Dolorem repudiandae.', 19, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(200, 'message', 'Possimus explicabo quaerat.', 25, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(201, 'message', 'Deleniti distinctio eaque.', 44, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(202, 'attendance', 'Mollitia et sed omnis.', 28, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(203, 'news', 'Facere sint.', 70, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(204, 'attendance', 'Architecto beatae quia laborum non.', 62, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(205, 'news', 'Et quis optio labore.', 57, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(206, 'message', 'Occaecati sunt.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(207, 'message', 'Non sit et.', 69, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(208, 'attendance', 'Eaque itaque.', 17, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(209, 'attendance', 'Tempore voluptas saepe ad.', 67, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:07', '2019-07-30 13:17:07'),
(210, 'message', 'Libero repellat itaque voluptatem.', 66, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(211, 'news', 'Pariatur velit.', 80, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(212, 'message', 'Rem necessitatibus ad laboriosam.', 80, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(213, 'attendance', 'Quae occaecati.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(214, 'news', 'Nihil omnis laborum ipsum quibusdam.', 58, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(215, 'message', 'Quae porro.', 81, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(216, 'news', 'Consequuntur inventore et.', 78, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(217, 'news', 'Non nostrum dolore.', 49, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(218, 'news', 'Quis vero voluptas.', 28, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(219, 'attendance', 'Harum dolores delectus.', 33, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(220, 'message', 'Occaecati laudantium.', 65, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(221, 'message', 'Perferendis expedita.', 72, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(222, 'news', 'Cupiditate nemo voluptas qui.', 7, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(223, 'message', 'Debitis quam.', 35, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(224, 'news', 'Aut aut.', 76, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(225, 'news', 'Rerum perspiciatis qui.', 32, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(226, 'news', 'Possimus est omnis.', 32, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(227, 'attendance', 'Recusandae ipsum.', 79, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(228, 'news', 'Architecto dolorem occaecati.', 16, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(229, 'attendance', 'Eaque possimus.', 56, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(230, 'news', 'Modi provident.', 54, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(231, 'message', 'Ratione iste velit voluptatibus.', 44, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(232, 'attendance', 'Nobis tempore voluptas molestias.', 53, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(233, 'news', 'Quae debitis ut.', 23, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(234, 'message', 'Illo aut doloribus.', 59, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(235, 'news', 'Dignissimos qui commodi mollitia.', 47, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(236, 'attendance', 'Exercitationem ut repellendus.', 42, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(237, 'message', 'Quia rerum saepe.', 6, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(238, 'message', 'Veniam et.', 28, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(239, 'attendance', 'Quia et tempore.', 96, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(240, 'news', 'Accusamus eum mollitia.', 4, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(241, 'news', 'Iste quaerat voluptas sit.', 21, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(242, 'news', 'Unde accusamus vero.', 14, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(243, 'message', 'Nesciunt corporis totam.', 90, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(244, 'message', 'Facere quo et.', 45, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(245, 'message', 'Voluptate fuga.', 12, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(246, 'attendance', 'Sint qui.', 30, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(247, 'news', 'Nobis necessitatibus.', 18, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(248, 'message', 'Voluptate ea consectetur.', 73, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(249, 'news', 'Voluptas aspernatur ab.', 28, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(250, 'news', 'Quaerat assumenda.', 4, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(251, 'attendance', 'Fugiat ipsam occaecati tenetur.', 69, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(252, 'attendance', 'Assumenda facere hic architecto dolor.', 50, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(253, 'attendance', 'Magni consequuntur voluptatem.', 52, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(254, 'message', 'Magni suscipit non quae.', 44, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(255, 'attendance', 'Dolorem occaecati labore.', 71, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(256, 'news', 'Repudiandae cum consequatur.', 65, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(257, 'attendance', 'Quo voluptatem.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(258, 'attendance', 'Ut rerum qui.', 28, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:08', '2019-07-30 13:17:08'),
(259, 'attendance', 'Fugiat est.', 59, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(260, 'message', 'Sed et.', 79, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(261, 'message', 'Officia sed omnis.', 19, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(262, 'news', 'Voluptas pariatur illum.', 8, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(263, 'message', 'Cupiditate nulla.', 81, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(264, 'news', 'Ratione sunt enim ex.', 61, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(265, 'message', 'Beatae ducimus.', 34, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(266, 'message', 'Consectetur dicta reiciendis.', 37, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(267, 'attendance', 'Accusantium similique accusamus eum.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(268, 'attendance', 'Quia in et.', 24, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(269, 'attendance', 'Qui sed consequuntur minus.', 92, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(270, 'message', 'Inventore commodi est in fuga.', 64, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(271, 'attendance', 'Quo quis.', 11, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(272, 'message', 'Quia quam.', 45, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(273, 'message', 'Nisi quae.', 84, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(274, 'message', 'Quia vitae.', 94, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(275, 'message', 'Qui beatae et.', 35, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(276, 'attendance', 'Aut velit rem perspiciatis.', 36, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(277, 'news', 'Laudantium autem molestiae et.', 28, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(278, 'attendance', 'Libero provident et maxime.', 59, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(279, 'attendance', 'Autem in.', 11, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(280, 'news', 'Est excepturi beatae.', 85, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(281, 'news', 'Nemo et hic veniam.', 59, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(282, 'message', 'Vitae repellat labore.', 46, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(283, 'attendance', 'Quibusdam dignissimos voluptatibus.', 40, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(284, 'message', 'Cum ab ut qui.', 5, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(285, 'message', 'Deleniti sed itaque.', 76, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(286, 'attendance', 'Aspernatur ea.', 25, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(287, 'message', 'Minima quisquam voluptatem.', 36, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(288, 'message', 'Alias harum qui culpa.', 5, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(289, 'attendance', 'Sapiente qui error.', 71, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(290, 'message', 'Voluptas ab repudiandae.', 40, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(291, 'message', 'Laudantium molestiae aut.', 2, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(292, 'message', 'Ut iure.', 39, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(293, 'message', 'Rem qui.', 58, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(294, 'news', 'Molestias aspernatur repellendus.', 55, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(295, 'attendance', 'Ut enim qui.', 12, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(296, 'message', 'Voluptatem aut voluptatum saepe.', 41, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(297, 'message', 'A alias architecto.', 94, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(298, 'attendance', 'Vel numquam facere.', 37, '0000-00-00 00:00:00', 'attendance', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(299, 'message', 'Aut voluptates.', 82, '0000-00-00 00:00:00', 'message', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09'),
(300, 'attendance', 'Rerum sint reiciendis illo.', 43, '0000-00-00 00:00:00', 'news', NULL, '2019-07-30 13:17:09', '2019-07-30 13:17:09');

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
(1, 'non_578', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 820, 0, 15, 570, 1, 1563740571, 1564431771, 0, NULL, NULL, 'Bank Deposit', 1564431771, 1, '0'),
(2, 'voluptates_663', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 990, 0, 29, 170, 0, 1564172571, 1565122971, 0, NULL, NULL, 'Cheque', 1565382171, 1, '0'),
(3, 'necessitatibus_146', 'Velit consequatur illum asperiores et quisquam est dolor blanditiis deserunt.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 120, 0, 10, 620, 0, 1563481371, 1565295771, 0, NULL, NULL, 'Card', 1563740571, 0, '0'),
(4, 'est_215', NULL, 57, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 380, 10, 27, 130, 1, 1564258971, 1564604571, 0, NULL, NULL, 'Cheque', 1565814171, 1, '0'),
(5, 'voluptatem_246', 'Id quae ducimus sapiente autem rerum aut nemo aut temporibus.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 770, 15, 0, 870, 1, 1563740571, 1564431771, 0, NULL, NULL, 'Cash', 1563222171, 1, '0'),
(6, 'incidunt_407', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"}]', 880, 0, 1, 310, 1, 1563999771, 1564345371, 0, NULL, NULL, 'Cash', 1564345371, 1, '0'),
(7, 'velit_946', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 310, 34, 0, 180, 1, 1563567771, 1564431771, 0, NULL, NULL, 'Bank Deposit', 1565727771, 0, '0'),
(8, 'quisquam_950', 'Numquam amet omnis dolorem rerum.', 73, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 80, 19, 0, 650, 0, 1563913371, 1564258971, 1, NULL, NULL, 'Bank Deposit', 1565382171, 1, '0'),
(9, 'neque_336', 'Eligendi ea dolorem voluptate est ipsum qui consequuntur repellat dolor.', 51, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 340, 0, 25, 300, 0, 1563654171, 1565295771, 0, NULL, NULL, 'Cash', 1564777371, 1, '0'),
(10, 'eos_991', 'Nisi veniam laudantium non vel modi recusandae tenetur nostrum.', 67, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 620, 0, 0, 510, 1, 1563999771, 1565727771, 0, NULL, NULL, 'Cheque', 1565814171, 0, '0'),
(11, 'perferendis_821', NULL, 51, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 980, 0, 0, 330, 1, 1563826971, 1565814171, 0, NULL, NULL, 'Bank Deposit', 1564345371, 0, '0'),
(12, 'ea_975', 'At earum dolor dolor rem assumenda esse magni.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 940, 0, 4, 480, 1, 1563913371, 1564345371, 0, NULL, NULL, 'Cash', 1564777371, 1, '0'),
(13, 'sint_235', 'Et nostrum ipsa fugit rerum atque quia vel velit.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 130, 28, 11, 860, 1, 1563913371, 1564431771, 0, NULL, NULL, 'Card', 1563481371, 1, '0'),
(14, 'dolor_935', 'Voluptas magni neque corporis aut dolores ut nobis nostrum sequi animi.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 390, 0, 0, 110, 0, 1563222171, 1564345371, 1, NULL, NULL, 'Cash', 1564086171, 1, '0'),
(15, 'ipsa_621', 'Ea occaecati voluptas nihil quos quia qui quo molestiae sunt dolorum.', 73, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 60, 0, 17, 680, 0, 1563308571, 1564345371, 1, NULL, NULL, 'Cash', 1565122971, 1, '0'),
(16, 'at_550', NULL, 45, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 990, 0, 0, 230, 0, 1563567771, 1564345371, 1, NULL, NULL, 'Bank Deposit', 1565814171, 1, '0'),
(17, 'temporibus_835', 'Voluptates ea aut rerum et ullam aut.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 110, 0, 41, 530, 0, 1564258971, 1564258971, 1, NULL, NULL, 'Card', 1565727771, 0, '0'),
(18, 'in_441', NULL, 56, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 820, 0, 6, 180, 0, 1563654171, 1565641371, 0, NULL, NULL, 'Card', 1563826971, 1, '0'),
(19, 'voluptatem_202', 'Neque quia tenetur eveniet et dicta sit commodi est.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"}]', 200, 31, 0, 220, 1, 1564086171, 1565554971, 0, NULL, NULL, 'Online', 1563481371, 0, '0'),
(20, 'aliquam_285', 'Ratione quos tempore similique architecto velit repudiandae.', 53, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 410, 0, 0, 590, 0, 1563222171, 1565727771, 0, NULL, NULL, 'Bank Deposit', 1564345371, 1, '0'),
(21, 'itaque_998', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 440, 4, 3, 530, 1, 1563826971, 1564431771, 0, NULL, NULL, 'Online', 1565382171, 0, '0'),
(22, 'temporibus_354', NULL, 75, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 810, 0, 0, 370, 1, 1563567771, 1564345371, 0, NULL, NULL, 'Online', 1565382171, 0, '0'),
(23, 'et_330', 'Sunt eum ea vero aliquid sed aut dolore officia ut excepturi.', 75, ']', 780, 30, 35, 390, 1, 1563308572, 1565036572, 0, NULL, NULL, 'Cash', 1565295772, 0, '0'),
(24, 'est_942', 'Eos sequi illum necessitatibus aliquid ut.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 880, 19, 15, 720, 1, 1563394972, 1564431772, 0, NULL, NULL, 'Card', 1564690972, 1, '0'),
(25, 'sed_904', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 910, 5, 0, 100, 1, 1563222172, 1564431772, 0, NULL, NULL, 'Cash', 1563394972, 1, '0'),
(26, 'laborum_739', NULL, 73, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 890, 41, 0, 770, 1, 1563222172, 1564258972, 0, NULL, NULL, 'Online', 1563481372, 0, '0'),
(27, 'debitis_283', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 770, 47, 0, 610, 1, 1563222172, 1564777372, 0, NULL, NULL, 'Online', 1564172572, 1, '0'),
(28, 'consequatur_744', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 300, 0, 0, 900, 1, 1563481372, 1564258972, 0, NULL, NULL, 'Cash', 1564863772, 1, '0'),
(29, 'porro_116', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 930, 0, 24, 510, 1, 1563913372, 1564345372, 0, NULL, NULL, 'Cheque', 1563999772, 1, '0'),
(30, 'inventore_237', 'Blanditiis perferendis est numquam laudantium libero quia.', 56, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 720, 41, 0, 570, 0, 1563826972, 1565641372, 0, NULL, NULL, 'Online', 1564172572, 1, '0'),
(31, 'sint_516', 'Dolores placeat eum iste necessitatibus neque et harum consequatur.', 49, '[{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 900, 10, 0, 480, 1, 1563481372, 1565382172, 0, NULL, NULL, 'Card', 1564950172, 0, '0'),
(32, 'maiores_703', 'Sit neque aut id aut.', 45, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 340, 0, 0, 250, 0, 1563826972, 1564604572, 0, NULL, NULL, 'Card', 1564690972, 0, '0'),
(33, 'omnis_221', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 310, 0, 17, 390, 1, 1563826972, 1564345372, 0, NULL, NULL, 'Cash', 1565468572, 0, '0'),
(34, 'voluptas_481', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 540, 3, 0, 200, 0, 1563999772, 1564258972, 1, NULL, NULL, 'Card', 1565814172, 1, '0'),
(35, 'velit_459', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 580, 34, 16, 390, 1, 1563394972, 1565036572, 0, NULL, NULL, 'Online', 1563394972, 0, '0'),
(36, 'voluptas_996', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 950, 0, 0, 400, 0, 1563740572, 1565382172, 0, NULL, NULL, 'Bank Deposit', 1563222172, 0, '0'),
(37, 'quod_805', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 590, 48, 0, 510, 1, 1563222172, 1564777372, 0, NULL, NULL, 'Card', 1564950172, 0, '0'),
(38, 'sit_194', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 120, 0, 12, 990, 1, 1563826972, 1564258972, 0, NULL, NULL, 'Online', 1563654172, 1, '0'),
(39, 'at_468', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 770, 0, 0, 160, 1, 1563308572, 1564258972, 0, NULL, NULL, 'Online', 1563308572, 0, '0'),
(40, 'deserunt_102', 'Culpa suscipit veritatis vel rerum qui voluptatem ipsa commodi.', 53, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 680, 1, 0, 700, 1, 1563394972, 1564258972, 0, NULL, NULL, 'Cash', 1565209372, 1, '0'),
(41, 'molestias_870', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 900, 3, 22, 670, 0, 1564172572, 1564431772, 1, NULL, NULL, 'Card', 1564863772, 1, '0'),
(42, 'ea_799', 'Distinctio ipsa est quod deleniti veritatis tempore quam.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 870, 0, 44, 440, 0, 1563826972, 1564863772, 0, NULL, NULL, 'Cash', 1565209372, 0, '0'),
(43, 'illum_267', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 600, 47, 13, 90, 1, 1563740572, 1564345372, 0, NULL, NULL, 'Card', 1565122972, 1, '0'),
(44, 'consequatur_492', 'Sunt voluptates totam sint sit omnis eum quibusdam.', 54, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 110, 0, 26, 280, 0, 1563999772, 1565641372, 0, NULL, NULL, 'Card', 1564258972, 1, '0'),
(45, 'consequatur_409', 'Rerum voluptatem et voluptatem ducimus voluptas maiores et incidunt.', 53, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 670, 38, 47, 660, 1, 1563481372, 1564431772, 0, NULL, NULL, 'Cheque', 1565036572, 1, '0'),
(46, 'voluptatibus_321', 'Officia sit explicabo tempora est dolorem qui repellendus eum.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 110, 42, 0, 820, 1, 1563481372, 1565036572, 0, NULL, NULL, 'Cash', 1565382172, 0, '0'),
(47, 'nulla_731', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 570, 0, 0, 280, 0, 1563567772, 1565382172, 0, NULL, NULL, 'Online', 1564431772, 0, '0'),
(48, 'neque_997', 'Aut saepe unde consequatur velit numquam.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 160, 0, 0, 490, 0, 1564086172, 1564345372, 1, NULL, NULL, 'Card', 1565295772, 0, '0'),
(49, 'nobis_350', 'Soluta sapiente ut beatae repudiandae sed quidem dolore culpa nobis voluptas aliquam.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 910, 42, 21, 930, 1, 1563913372, 1564863772, 0, NULL, NULL, 'Cheque', 1564604572, 1, '0'),
(50, 'ratione_479', 'Quia eius et perspiciatis aut qui.', 51, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 760, 0, 0, 810, 0, 1564086172, 1564258972, 1, NULL, NULL, 'Bank Deposit', 1564258972, 1, '0'),
(51, 'velit_778', NULL, 47, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 820, 0, 0, 400, 1, 1563394972, 1564431772, 0, NULL, NULL, 'Card', 1565814172, 0, '0'),
(52, 'harum_473', 'Nemo enim ad quibusdam et aut corporis rem odio voluptatum debitis.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 150, 24, 26, 350, 1, 1563740572, 1564345372, 0, NULL, NULL, 'Cheque', 1564172572, 1, '0'),
(53, 'aut_660', NULL, 52, '[{\"title\":\"Building fee\",\"amount\":\"100\"}]', 640, 36, 0, 680, 1, 1563222172, 1564431772, 0, NULL, NULL, 'Bank Deposit', 1565727772, 0, '0'),
(54, 'deserunt_385', 'Aut modi id doloribus nihil ipsam autem autem sapiente fugit.', 53, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 450, 17, 35, 950, 1, 1563308572, 1565382172, 0, NULL, NULL, 'Cheque', 1565382172, 0, '0'),
(55, 'in_914', NULL, 53, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 290, 0, 19, 500, 1, 1563740572, 1564258972, 0, NULL, NULL, 'Bank Deposit', 1565382172, 0, '0'),
(56, 'veniam_730', 'Corrupti pariatur exercitationem sint sed repellat placeat et.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 860, 0, 0, 690, 0, 1564258972, 1564431772, 1, NULL, NULL, 'Bank Deposit', 1564950172, 1, '0'),
(57, 'natus_812', 'Ut consequatur facere fugiat nostrum est eaque ea.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 800, 0, 46, 190, 0, 1563740572, 1564258972, 1, NULL, NULL, 'Card', 1565122972, 0, '0'),
(58, 'accusamus_386', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 760, 16, 25, 340, 1, 1563826972, 1564258972, 0, NULL, NULL, 'Cheque', 1565814172, 1, '0'),
(59, 'sunt_866', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 980, 0, 0, 300, 1, 1563826972, 1564777372, 0, NULL, NULL, 'Bank Deposit', 1563740572, 1, '0'),
(60, 'nihil_784', NULL, 73, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 140, 0, 0, 640, 0, 1563740572, 1564431772, 1, NULL, NULL, 'Bank Deposit', 1565727772, 1, '0'),
(61, 'et_564', 'Ut expedita veniam harum illum illum et vero sit.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 100, 0, 44, 50, 1, 1563308572, 1564431772, 0, NULL, NULL, 'Cheque', 1564172572, 0, '0'),
(62, 'quidem_147', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 430, 0, 0, 440, 1, 1563481372, 1564345372, 0, NULL, NULL, 'Cheque', 1565209372, 1, '0'),
(63, 'sunt_375', 'Nesciunt minima voluptatum et impedit numquam exercitationem quae rerum.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 270, 41, 20, 1000, 1, 1563567772, 1565641372, 0, NULL, NULL, 'Online', 1564345372, 0, '0'),
(64, 'dolores_996', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 920, 0, 0, 610, 1, 1563481372, 1565468572, 0, NULL, NULL, 'Card', 1563222172, 0, '0'),
(65, 'rerum_164', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 620, 0, 16, 510, 0, 1563654172, 1564604572, 0, NULL, NULL, 'Online', 1563222172, 1, '0'),
(66, 'eum_949', NULL, 67, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 300, 0, 6, 170, 1, 1563826972, 1565727772, 0, NULL, NULL, 'Bank Deposit', 1563826972, 1, '0'),
(67, 'hic_279', NULL, 52, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 880, 0, 0, 400, 1, 1563740572, 1565727772, 0, NULL, NULL, 'Online', 1564604572, 1, '0'),
(68, 'delectus_682', 'Dolorem veniam atque ipsa ea exercitationem praesentium.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 890, 0, 19, 50, 1, 1563481372, 1564258972, 0, NULL, NULL, 'Bank Deposit', 1564950172, 0, '0'),
(69, 'et_360', NULL, 49, '[{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 500, 49, 0, 490, 1, 1563654173, 1565036573, 0, NULL, NULL, 'Card', 1564086173, 1, '0'),
(70, 'harum_134', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 800, 41, 28, 530, 0, 1563826973, 1564345373, 1, NULL, NULL, 'Cheque', 1564863773, 1, '0'),
(71, 'est_774', NULL, 64, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 380, 0, 0, 550, 0, 1564258973, 1564863773, 0, NULL, NULL, 'Bank Deposit', 1564690973, 1, '0'),
(72, 'molestias_551', NULL, 52, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 490, 7, 18, 430, 0, 1563394973, 1564950173, 0, NULL, NULL, 'Bank Deposit', 1564950173, 0, '0'),
(73, 'neque_224', 'Eligendi repellat nobis voluptas et odio quasi non.', 53, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 410, 37, 0, 740, 0, 1563654173, 1565209373, 0, NULL, NULL, 'Cash', 1565382173, 1, '0'),
(74, 'illo_668', 'Consequatur in consequuntur tenetur omnis fugit nemo maxime et enim ut repellendus.', 75, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 880, 11, 3, 860, 1, 1563481373, 1564258973, 0, NULL, NULL, 'Cheque', 1564258973, 0, '0'),
(75, 'voluptas_555', 'A qui voluptatem fugiat in ex et earum qui.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 280, 8, 0, 430, 1, 1563740573, 1565382173, 0, NULL, NULL, 'Cash', 1563913373, 0, '0'),
(76, 'velit_815', 'Similique quos sed commodi sint possimus.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 650, 10, 0, 650, 0, 1564258973, 1564431773, 1, NULL, NULL, 'Card', 1563222173, 1, '0'),
(77, 'consequatur_925', 'Et iusto cumque necessitatibus nihil recusandae autem.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 140, 24, 0, 400, 1, 1563999773, 1564431773, 0, NULL, NULL, 'Cash', 1563654173, 1, '0'),
(78, 'dolor_174', 'Consequatur et ea aperiam ad fugiat eaque.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 990, 33, 0, 550, 1, 1563654173, 1564431773, 0, NULL, NULL, 'Cash', 1564604573, 0, '0'),
(79, 'voluptatibus_739', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 610, 0, 38, 430, 1, 1563740573, 1564950173, 0, NULL, NULL, 'Cheque', 1564345373, 1, '0'),
(80, 'atque_557', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 520, 0, 0, 250, 0, 1563654173, 1565554973, 0, NULL, NULL, 'Bank Deposit', 1564086173, 0, '0'),
(81, 'vitae_729', 'Enim qui ipsam alias unde minima optio minus.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 670, 0, 12, 350, 0, 1564172573, 1565468573, 0, NULL, NULL, 'Cheque', 1564690973, 1, '0'),
(82, 'omnis_522', 'Quia distinctio nihil sint reprehenderit nulla et.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 390, 0, 37, 70, 0, 1563999773, 1564258973, 1, NULL, NULL, 'Cheque', 1564086173, 1, '0'),
(83, 'ut_164', NULL, 49, ']', 140, 33, 0, 960, 1, 1563740573, 1564950173, 0, NULL, NULL, 'Card', 1564950173, 1, '0'),
(84, 'sint_152', 'Modi impedit cum ut sint ducimus.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 380, 0, 0, 180, 1, 1563222173, 1564258973, 0, NULL, NULL, 'Online', 1565036573, 0, '0'),
(85, 'hic_383', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 670, 30, 30, 590, 1, 1563999773, 1564690973, 0, NULL, NULL, 'Cash', 1565382173, 1, '0'),
(86, 'ut_745', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 340, 41, 19, 770, 0, 1564086173, 1564258973, 1, NULL, NULL, 'Cash', 1563913373, 0, '0'),
(87, 'a_712', NULL, 52, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 510, 0, 47, 180, 1, 1563394973, 1564777373, 0, NULL, NULL, 'Card', 1565641373, 0, '0'),
(88, 'facere_648', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 820, 0, 23, 510, 1, 1563567773, 1564345373, 0, NULL, NULL, 'Cheque', 1563999773, 0, '0'),
(89, 'in_937', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 800, 44, 8, 760, 0, 1563826973, 1565468573, 0, NULL, NULL, 'Card', 1565295773, 1, '0'),
(90, 'id_531', 'Possimus impedit fuga vero ea qui.', 52, '[{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 450, 0, 46, 760, 1, 1563913373, 1564345373, 0, NULL, NULL, 'Cheque', 1564345373, 0, '0'),
(91, 'aspernatur_415', 'Asperiores aut qui suscipit in sequi quo sunt autem assumenda libero.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 840, 0, 0, 170, 1, 1563308573, 1564345373, 0, NULL, NULL, 'Online', 1564431773, 1, '0'),
(92, 'dignissimos_268', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 730, 40, 0, 70, 1, 1563999773, 1565122973, 0, NULL, NULL, 'Cash', 1563826973, 1, '0'),
(93, 'eaque_647', NULL, 67, '[{\"title\":\"Library fee\",\"amount\":\"100\"}]', 150, 13, 0, 910, 1, 1563999773, 1564345373, 0, NULL, NULL, 'Bank Deposit', 1564431773, 1, '0'),
(94, 'amet_965', NULL, 47, '[{\"title\":\"Library fee\",\"amount\":\"400\"}]', 610, 0, 3, 290, 1, 1563740573, 1565554973, 0, NULL, NULL, 'Card', 1565727773, 0, '0'),
(95, 'voluptatem_830', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 720, 0, 2, 750, 0, 1563826973, 1564345373, 1, NULL, NULL, 'Cheque', 1565554973, 0, '0'),
(96, 'omnis_846', 'Voluptatum placeat magni rerum architecto aspernatur.', 73, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 450, 44, 32, 490, 0, 1563567773, 1564431773, 1, NULL, NULL, 'Online', 1565382173, 1, '0'),
(97, 'rem_516', 'Adipisci libero et rerum et unde ad illo et sapiente.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 890, 26, 35, 80, 1, 1563481373, 1564345373, 0, NULL, NULL, 'Bank Deposit', 1563567773, 1, '0'),
(98, 'doloremque_173', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 690, 28, 0, 970, 1, 1563740573, 1565814173, 0, NULL, NULL, 'Cash', 1564345373, 1, '0'),
(99, 'eaque_405', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 110, 5, 0, 100, 1, 1563740573, 1564777373, 0, NULL, NULL, 'Online', 1563999773, 1, '0'),
(100, 'facilis_685', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 470, 0, 0, 580, 1, 1563654173, 1564345373, 0, NULL, NULL, 'Card', 1565468573, 1, '0'),
(101, 'velit_182', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 240, 4, 14, 840, 1, 1563999773, 1565122973, 0, NULL, NULL, 'Bank Deposit', 1564690973, 1, '0'),
(102, 'vel_457', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 150, 16, 0, 310, 1, 1563394973, 1564690973, 0, NULL, NULL, 'Card', 1564086173, 0, '0'),
(103, 'eum_997', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 60, 28, 39, 810, 1, 1563740573, 1564258973, 0, NULL, NULL, 'Online', 1563913373, 1, '0'),
(104, 'reiciendis_452', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 850, 0, 0, 200, 1, 1563481373, 1565036573, 0, NULL, NULL, 'Cash', 1565122973, 1, '0'),
(105, 'officia_460', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 980, 0, 0, 1000, 0, 1563999773, 1564863773, 0, NULL, NULL, 'Online', 1563481373, 1, '0'),
(106, 'aut_647', 'Omnis eligendi in excepturi voluptas.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 690, 28, 0, 620, 0, 1563913373, 1564258973, 1, NULL, NULL, 'Bank Deposit', 1563740573, 0, '0'),
(107, 'quo_481', NULL, 73, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 570, 0, 0, 110, 0, 1563222173, 1564863773, 0, NULL, NULL, 'Online', 1565209373, 0, '0'),
(108, 'et_457', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 620, 0, 0, 800, 0, 1563913373, 1564258973, 1, NULL, NULL, 'Cash', 1563222173, 0, '0'),
(109, 'laborum_122', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 820, 0, 0, 450, 0, 1563394973, 1564431773, 1, NULL, NULL, 'Cash', 1565641373, 1, '0'),
(110, 'magni_336', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 670, 0, 15, 360, 0, 1563913373, 1564258973, 1, NULL, NULL, 'Cash', 1564345373, 1, '0'),
(111, 'asperiores_799', 'Incidunt iusto voluptatem perspiciatis ipsum facilis blanditiis possimus qui id voluptatibus.', 64, '[{\"title\":\"Building fee\",\"amount\":\"400\"}]', 650, 0, 20, 890, 1, 1563740573, 1564258973, 0, NULL, NULL, 'Bank Deposit', 1563740573, 1, '0'),
(112, 'et_382', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 830, 32, 24, 600, 1, 1563567773, 1564431773, 0, NULL, NULL, 'Card', 1564690973, 1, '0'),
(113, 'nemo_122', 'Autem eaque consequatur consequatur tempore non.', 67, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 120, 14, 36, 240, 0, 1563913373, 1564431773, 1, NULL, NULL, 'Cheque', 1565122973, 1, '0'),
(114, 'ea_648', 'Quae fuga voluptatem incidunt consectetur est tenetur.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 400, 0, 0, 940, 1, 1563654173, 1564258973, 0, NULL, NULL, 'Card', 1563740573, 0, '0'),
(115, 'totam_897', 'Necessitatibus iure molestiae odit ut fugiat delectus aut.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 490, 32, 0, 860, 1, 1564172573, 1564950173, 0, NULL, NULL, 'Bank Deposit', 1565295773, 1, '0'),
(116, 'debitis_242', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 880, 0, 2, 400, 1, 1563913373, 1564777373, 0, NULL, NULL, 'Online', 1564950173, 1, '0'),
(117, 'vel_992', NULL, 68, '[{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 800, 43, 37, 100, 1, 1564172573, 1564258973, 0, NULL, NULL, 'Cash', 1564950173, 1, '0'),
(118, 'consequatur_426', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 560, 12, 0, 320, 0, 1563308573, 1565468573, 0, NULL, NULL, 'Online', 1564863773, 0, '0'),
(119, 'illum_633', 'Et ipsam sed culpa ut sed eius qui.', 73, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 190, 18, 46, 770, 0, 1564172573, 1564863773, 0, NULL, NULL, 'Bank Deposit', 1565382173, 1, '0'),
(120, 'suscipit_232', 'Labore molestiae perferendis nulla sed iste quam ut.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 270, 0, 8, 430, 1, 1563826973, 1564345373, 0, NULL, NULL, 'Online', 1563826973, 0, '0'),
(121, 'corporis_829', 'Laudantium eveniet rem aperiam sit in dolores.', 45, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 80, 0, 7, 460, 1, 1563999773, 1565814173, 0, NULL, NULL, 'Cheque', 1565641373, 0, '0'),
(122, 'autem_216', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 460, 0, 5, 580, 1, 1563222174, 1564258974, 0, NULL, NULL, 'Bank Deposit', 1565641374, 0, '0'),
(123, 'vitae_333', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 50, 0, 0, 60, 0, 1563394974, 1565727774, 0, NULL, NULL, 'Online', 1564950174, 0, '0'),
(124, 'dolorum_203', 'Ut delectus et quis cum.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 290, 0, 48, 490, 1, 1564258974, 1565814174, 0, NULL, NULL, 'Bank Deposit', 1565036574, 0, '0'),
(125, 'occaecati_317', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 490, 0, 8, 290, 0, 1563222174, 1564431774, 1, NULL, NULL, 'Cheque', 1565382174, 1, '0'),
(126, 'non_784', 'Et alias autem error aut et fugit asperiores.', 51, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 600, 0, 0, 910, 1, 1564258974, 1564345374, 0, NULL, NULL, 'Online', 1564086174, 1, '0'),
(127, 'officia_981', 'Rerum suscipit eligendi commodi hic aut.', 53, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 750, 0, 0, 790, 1, 1563481374, 1564345374, 0, NULL, NULL, 'Cash', 1563222174, 0, '0'),
(128, 'quod_132', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 210, 0, 27, 270, 0, 1563394974, 1565295774, 0, NULL, NULL, 'Online', 1563654174, 1, '0'),
(129, 'dolor_821', 'Hic similique dolorum velit voluptas repellendus dolores aliquid quidem.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 420, 28, 4, 950, 1, 1564258974, 1564950174, 0, NULL, NULL, 'Cheque', 1565122974, 1, '0'),
(130, 'consectetur_169', 'Eveniet recusandae ipsa assumenda et quae a occaecati fuga corrupti.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 350, 37, 0, 90, 1, 1563913374, 1564431774, 0, NULL, NULL, 'Bank Deposit', 1563308574, 0, '0'),
(131, 'excepturi_603', NULL, 67, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 520, 0, 8, 760, 1, 1563567774, 1564258974, 0, NULL, NULL, 'Online', 1563740574, 0, '0'),
(132, 'quibusdam_990', 'Sit aliquam at voluptatum sit incidunt.', 47, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 560, 0, 41, 250, 0, 1563481374, 1565727774, 0, NULL, NULL, 'Bank Deposit', 1564431774, 0, '0'),
(133, 'optio_227', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 1000, 0, 0, 770, 0, 1563913374, 1565727774, 0, NULL, NULL, 'Cash', 1564604574, 0, '0'),
(134, 'ipsum_773', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 420, 17, 22, 190, 0, 1563481374, 1564431774, 1, NULL, NULL, 'Card', 1564258974, 0, '0'),
(135, 'voluptates_123', 'Dolores nam iusto quia iste esse dolorem quis perspiciatis quia.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 620, 12, 0, 530, 1, 1563222174, 1565468574, 0, NULL, NULL, 'Bank Deposit', 1563567774, 1, '0'),
(136, 'amet_578', 'Quia sit qui corrupti et cupiditate.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 640, 0, 0, 420, 1, 1563481374, 1564258974, 0, NULL, NULL, 'Card', 1564777374, 1, '0'),
(137, 'ut_102', 'Aspernatur quia ad earum fugit qui maiores alias.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 60, 33, 0, 260, 0, 1563567774, 1565468574, 0, NULL, NULL, 'Online', 1564604574, 0, '0'),
(138, 'earum_759', 'Est aspernatur voluptatem aspernatur assumenda ut ad placeat nulla repellat.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"700\"}]', 780, 24, 0, 310, 1, 1563740574, 1565554974, 0, NULL, NULL, 'Card', 1563222174, 1, '0'),
(139, 'labore_475', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 280, 1, 0, 140, 1, 1564258974, 1564604574, 0, NULL, NULL, 'Bank Deposit', 1563567774, 1, '0'),
(140, 'animi_653', 'Dolorem impedit inventore molestias fuga autem minus aliquid sunt.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 470, 40, 50, 310, 1, 1564086174, 1564950174, 0, NULL, NULL, 'Card', 1565641374, 0, '0'),
(141, 'delectus_881', 'Mollitia quidem sunt officiis itaque et necessitatibus repellendus velit.', 68, ']', 570, 0, 28, 780, 1, 1563222174, 1564431774, 0, NULL, NULL, 'Card', 1564345374, 0, '0'),
(142, 'ab_679', 'Sit sequi doloribus quis eos beatae sed omnis amet mollitia neque.', 47, '[{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 590, 44, 0, 610, 1, 1563567774, 1565382174, 0, NULL, NULL, 'Card', 1565554974, 1, '0'),
(143, 'sed_362', 'Nulla rerum est error ut provident vel repudiandae.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 70, 0, 0, 770, 1, 1564086174, 1564258974, 0, NULL, NULL, 'Cash', 1565209374, 1, '0'),
(144, 'quo_876', 'Quis sed iure voluptate quidem id qui odit fugit iure.', 57, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 580, 1, 0, 570, 1, 1564086174, 1565382174, 0, NULL, NULL, 'Online', 1564086174, 0, '0'),
(145, 'autem_858', 'Hic sint et odit et aspernatur.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 480, 16, 40, 970, 1, 1564258974, 1564345374, 0, NULL, NULL, 'Cash', 1565295774, 0, '0'),
(146, 'nihil_404', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 590, 0, 0, 220, 1, 1563654174, 1565814174, 0, NULL, NULL, 'Card', 1563999774, 0, '0'),
(147, 'rerum_704', 'Autem placeat et sed cupiditate exercitationem.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 380, 19, 3, 240, 0, 1564172574, 1564950174, 0, NULL, NULL, 'Cash', 1564950174, 0, '0'),
(148, 'odit_760', 'Accusamus aliquam cumque a quasi amet dolorum.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 750, 0, 47, 470, 0, 1564258974, 1565641374, 0, NULL, NULL, 'Online', 1563567774, 0, '0'),
(149, 'aut_840', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 190, 0, 9, 610, 1, 1563913374, 1564258974, 0, NULL, NULL, 'Cheque', 1565468574, 1, '0'),
(150, 'enim_118', 'Corporis odit et velit rem quaerat dolores quis et voluptate dolor.', 56, ']', 50, 0, 30, 800, 0, 1563481374, 1565641374, 0, NULL, NULL, 'Cheque', 1565727774, 1, '0'),
(151, 'quis_140', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 170, 0, 21, 90, 0, 1563999774, 1564950174, 0, NULL, NULL, 'Bank Deposit', 1564777374, 1, '0'),
(152, 'at_740', 'Voluptatem dolor molestias sed sint rerum modi.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 200, 48, 3, 160, 0, 1564086174, 1564950174, 0, NULL, NULL, 'Bank Deposit', 1564690974, 1, '0'),
(153, 'cumque_642', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 470, 0, 0, 80, 1, 1563913374, 1565641374, 0, NULL, NULL, 'Online', 1563826974, 0, '0'),
(154, 'nostrum_825', NULL, 75, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 330, 8, 46, 790, 0, 1563567774, 1565814174, 0, NULL, NULL, 'Cash', 1563222174, 0, '0'),
(155, 'quos_319', 'Beatae quis qui esse deserunt sint expedita.', 75, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 140, 0, 13, 540, 0, 1563654174, 1564950174, 0, NULL, NULL, 'Cash', 1564604574, 0, '0'),
(156, 'voluptatem_445', 'Dolore ea et quis qui consectetur sit explicabo.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 870, 0, 28, 450, 1, 1563567774, 1564258974, 0, NULL, NULL, 'Bank Deposit', 1565382174, 1, '0'),
(157, 'optio_630', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 400, 0, 0, 730, 1, 1563654174, 1564431774, 0, NULL, NULL, 'Cash', 1564777374, 0, '0'),
(158, 'quae_457', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 970, 36, 0, 240, 1, 1564086174, 1564345374, 0, NULL, NULL, 'Bank Deposit', 1564604574, 0, '0'),
(159, 'tempora_840', NULL, 53, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 320, 40, 0, 740, 0, 1563567774, 1564258974, 1, NULL, NULL, 'Card', 1564086174, 0, '0'),
(160, 'eum_462', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 270, 24, 0, 410, 0, 1563567774, 1564345374, 1, NULL, NULL, 'Cheque', 1563394974, 1, '0'),
(161, 'praesentium_425', NULL, 54, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 1000, 17, 34, 670, 0, 1564172574, 1564258974, 1, NULL, NULL, 'Cheque', 1565727774, 1, '0'),
(162, 'aliquid_921', 'Quam aut nemo totam sed quia sint veritatis optio non laudantium.', 53, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 970, 27, 48, 910, 0, 1563999774, 1564604574, 0, NULL, NULL, 'Online', 1563913374, 0, '0'),
(163, 'itaque_970', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 130, 0, 0, 720, 1, 1564086174, 1565382174, 0, NULL, NULL, 'Cash', 1563913374, 1, '0'),
(164, 'sequi_248', 'Non consectetur culpa ut atque quis minima corrupti a.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 580, 0, 42, 280, 0, 1563567774, 1564258974, 1, NULL, NULL, 'Bank Deposit', 1565814174, 1, '0'),
(165, 'sit_363', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 150, 15, 3, 1000, 1, 1563826974, 1564431774, 0, NULL, NULL, 'Cash', 1564863774, 0, '0'),
(166, 'vitae_516', 'Expedita consequuntur molestiae mollitia consequatur aspernatur.', 57, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 290, 0, 0, 120, 0, 1564172574, 1564431774, 1, NULL, NULL, 'Bank Deposit', 1564086174, 1, '0'),
(167, 'vel_602', 'Fuga ex voluptatibus voluptatem occaecati ut sit.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 250, 0, 0, 170, 0, 1563826974, 1565814174, 0, NULL, NULL, 'Cash', 1565036574, 0, '0'),
(168, 'magni_493', 'Velit omnis illum eos dolorem excepturi voluptas.', 46, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 430, 25, 35, 940, 1, 1563999774, 1565554974, 0, NULL, NULL, 'Cheque', 1564431774, 0, '0'),
(169, 'qui_778', NULL, 57, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 570, 22, 24, 110, 0, 1563740574, 1564258974, 1, NULL, NULL, 'Cheque', 1564172574, 1, '0'),
(170, 'culpa_605', NULL, 68, '[{\"title\":\"Library fee\",\"amount\":\"600\"}]', 950, 19, 0, 870, 0, 1563567775, 1565209375, 0, NULL, NULL, 'Card', 1563826975, 0, '0'),
(171, 'debitis_193', 'Quidem quia ab vel aspernatur iste odit enim itaque sed ratione minima.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 430, 0, 19, 620, 0, 1564258975, 1564431775, 1, NULL, NULL, 'Cash', 1563222175, 1, '0'),
(172, 'velit_745', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 820, 0, 1, 210, 1, 1563567775, 1564950175, 0, NULL, NULL, 'Card', 1563826975, 0, '0'),
(173, 'commodi_404', NULL, 51, '[{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 700, 0, 0, 110, 0, 1563999775, 1564345375, 1, NULL, NULL, 'Bank Deposit', 1565641375, 0, '0'),
(174, 'provident_149', 'Officiis veritatis accusamus sint amet architecto quo.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 300, 0, 35, 190, 0, 1563740575, 1564345375, 1, NULL, NULL, 'Card', 1563222175, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(175, 'at_174', 'Officia ad ipsam facere quidem quidem quibusdam.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 220, 0, 0, 600, 1, 1563222175, 1565382175, 0, NULL, NULL, 'Online', 1565727775, 0, '0'),
(176, 'id_176', 'Excepturi tempora voluptas quo optio et animi.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 660, 48, 0, 340, 1, 1564172575, 1565468575, 0, NULL, NULL, 'Cash', 1564690975, 1, '0'),
(177, 'facilis_512', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 280, 49, 0, 280, 1, 1563394975, 1564604575, 0, NULL, NULL, 'Bank Deposit', 1563999775, 0, '0'),
(178, 'voluptatibus_683', 'Dolorem et nesciunt tempore voluptas porro facere rerum sint ratione quae dicta.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 480, 44, 41, 80, 1, 1563308575, 1564258975, 0, NULL, NULL, 'Cheque', 1564172575, 0, '0'),
(179, 'velit_118', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 850, 22, 42, 610, 1, 1563394975, 1564863775, 0, NULL, NULL, 'Bank Deposit', 1565295775, 0, '0'),
(180, 'maiores_966', 'Esse fugit dignissimos sapiente sunt autem natus omnis.', 73, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 590, 22, 0, 740, 1, 1563913375, 1564431775, 0, NULL, NULL, 'Card', 1564950175, 1, '0'),
(181, 'nam_667', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 560, 0, 0, 960, 1, 1563308575, 1564431775, 0, NULL, NULL, 'Cash', 1565554975, 1, '0'),
(182, 'unde_662', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 420, 46, 0, 810, 0, 1563913375, 1564258975, 1, NULL, NULL, 'Online', 1563826975, 0, '0'),
(183, 'beatae_644', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 180, 38, 0, 80, 0, 1563913375, 1565122975, 0, NULL, NULL, 'Cheque', 1565036575, 0, '0'),
(184, 'quis_640', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 900, 0, 10, 490, 0, 1563481375, 1564777375, 0, NULL, NULL, 'Card', 1563740575, 0, '0'),
(185, 'nihil_478', NULL, 54, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 600, 0, 23, 760, 1, 1563999775, 1565295775, 0, NULL, NULL, 'Cash', 1565814175, 0, '0'),
(186, 'consequatur_502', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 830, 0, 0, 670, 1, 1564258975, 1564431775, 0, NULL, NULL, 'Cash', 1564258975, 0, '0'),
(187, 'sint_800', 'Consectetur ipsam voluptatem vel nisi voluptas.', 52, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 960, 36, 22, 330, 1, 1563308575, 1564258975, 0, NULL, NULL, 'Card', 1565036575, 1, '0'),
(188, 'incidunt_163', 'Est praesentium dolores labore omnis commodi rerum nulla repudiandae.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 120, 4, 0, 260, 1, 1563826975, 1565468575, 0, NULL, NULL, 'Cash', 1564258975, 1, '0'),
(189, 'aliquid_880', 'Ut expedita reiciendis sint deleniti corporis recusandae.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 240, 31, 20, 830, 0, 1563394975, 1564258975, 1, NULL, NULL, 'Cash', 1564777375, 0, '0'),
(190, 'fuga_387', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 610, 0, 9, 200, 1, 1564172575, 1564345375, 0, NULL, NULL, 'Cheque', 1565641375, 1, '0'),
(191, 'praesentium_768', 'Magnam illum aspernatur aut dolorem vel ut aut soluta et dolore.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 180, 0, 0, 470, 1, 1563222175, 1564431775, 0, NULL, NULL, 'Online', 1564086175, 0, '0'),
(192, 'occaecati_808', 'In sequi consequatur omnis sit itaque placeat et et.', 75, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 650, 0, 41, 150, 0, 1563222175, 1564431775, 1, NULL, NULL, 'Bank Deposit', 1564863775, 1, '0'),
(193, 'eveniet_743', 'Ut et rerum minus est eos vero asperiores.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 430, 0, 37, 320, 1, 1563826975, 1564431775, 0, NULL, NULL, 'Card', 1563999775, 1, '0'),
(194, 'aspernatur_240', 'Provident vitae libero ut sed rerum quia dolor corrupti.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 340, 49, 0, 190, 1, 1563308575, 1564345375, 0, NULL, NULL, 'Cheque', 1563481375, 0, '0'),
(195, 'excepturi_104', 'Quasi nam dolor ut accusamus atque.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 840, 0, 28, 980, 0, 1564172575, 1564258975, 1, NULL, NULL, 'Cheque', 1563999775, 0, '0'),
(196, 'laudantium_477', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 250, 0, 0, 850, 0, 1563481375, 1564345375, 1, NULL, NULL, 'Bank Deposit', 1563826975, 0, '0'),
(197, 'cupiditate_624', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 350, 47, 36, 280, 1, 1563567775, 1564431775, 0, NULL, NULL, 'Online', 1563481375, 0, '0'),
(198, 'non_819', NULL, 51, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 650, 0, 0, 200, 0, 1563826975, 1564863775, 0, NULL, NULL, 'Cash', 1563567775, 1, '0'),
(199, 'deleniti_609', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 230, 8, 9, 120, 1, 1563394975, 1564345375, 0, NULL, NULL, 'Cash', 1564431775, 1, '0'),
(200, 'commodi_381', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 790, 0, 0, 800, 0, 1564172575, 1564345375, 1, NULL, NULL, 'Online', 1564950175, 1, '0'),
(201, 'eum_878', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 70, 0, 0, 70, 1, 1563913375, 1564258975, 0, NULL, NULL, 'Cheque', 1563222175, 1, '0'),
(202, 'similique_673', 'Unde recusandae ipsum eum nulla totam nobis rerum ab.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 280, 11, 0, 60, 1, 1564086175, 1564258975, 0, NULL, NULL, 'Bank Deposit', 1564086175, 1, '0'),
(203, 'consequatur_758', NULL, 73, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 240, 0, 38, 990, 1, 1563999775, 1564690975, 0, NULL, NULL, 'Cash', 1563567775, 0, '0'),
(204, 'atque_795', NULL, 51, '[{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 660, 0, 0, 370, 0, 1563394975, 1564604575, 0, NULL, NULL, 'Bank Deposit', 1563999775, 0, '0'),
(205, 'aperiam_402', 'Dolore qui dignissimos veniam enim iusto tempore.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 920, 0, 11, 790, 1, 1563394975, 1565727775, 0, NULL, NULL, 'Online', 1564086175, 0, '0'),
(206, 'occaecati_856', NULL, 54, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 1000, 37, 6, 880, 1, 1563308575, 1564431775, 0, NULL, NULL, 'Cash', 1564258975, 1, '0'),
(207, 'ratione_880', NULL, 73, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 120, 21, 0, 480, 1, 1563654175, 1564690975, 0, NULL, NULL, 'Card', 1564777375, 0, '0'),
(208, 'cumque_814', 'Et eveniet praesentium perferendis placeat voluptatibus quidem eos vitae.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 790, 3, 0, 370, 0, 1563567775, 1564950175, 0, NULL, NULL, 'Cheque', 1565727775, 1, '0'),
(209, 'mollitia_452', 'Eaque necessitatibus nostrum et et iste eligendi ea dolore ea.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 880, 0, 16, 850, 1, 1564172575, 1564345375, 0, NULL, NULL, 'Bank Deposit', 1563394975, 0, '0'),
(210, 'ea_912', NULL, 64, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 1000, 0, 0, 620, 1, 1564172575, 1564863775, 0, NULL, NULL, 'Bank Deposit', 1564777375, 0, '0'),
(211, 'eos_552', 'Iure id voluptate qui atque aperiam sit dolorem perferendis cupiditate et.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 50, 0, 0, 590, 0, 1563394975, 1564431775, 1, NULL, NULL, 'Cash', 1565209375, 1, '0'),
(212, 'ad_701', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 920, 48, 1, 360, 0, 1564258975, 1564258975, 1, NULL, NULL, 'Cash', 1563740575, 1, '0'),
(213, 'consequatur_523', NULL, 51, '[{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 120, 40, 0, 420, 0, 1563913375, 1564345375, 1, NULL, NULL, 'Cheque', 1564690975, 1, '0'),
(214, 'eius_190', NULL, 53, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 210, 44, 46, 450, 1, 1563567775, 1564431775, 0, NULL, NULL, 'Bank Deposit', 1565727775, 0, '0'),
(215, 'omnis_563', NULL, 54, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 630, 0, 11, 350, 0, 1563567775, 1565382175, 0, NULL, NULL, 'Bank Deposit', 1563654175, 1, '0'),
(216, 'et_514', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 300, 0, 26, 990, 0, 1563394975, 1565036575, 0, NULL, NULL, 'Online', 1564863775, 1, '0'),
(217, 'earum_673', NULL, 64, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 110, 0, 0, 950, 1, 1564086175, 1564431775, 0, NULL, NULL, 'Card', 1563222175, 1, '0'),
(218, 'et_862', 'Mollitia et dolorem est consequatur minus similique cumque sint sed dolorem.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 800, 0, 18, 700, 0, 1563913375, 1564690975, 0, NULL, NULL, 'Cash', 1564863775, 0, '0'),
(219, 'quod_723', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 400, 0, 10, 510, 0, 1563567775, 1564431775, 1, NULL, NULL, 'Card', 1565036575, 1, '0'),
(220, 'deleniti_495', 'Enim ut dolor dicta vel dolor tempore nisi.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 940, 0, 1, 680, 0, 1563308575, 1564258975, 1, NULL, NULL, 'Cash', 1565209375, 0, '0'),
(221, 'distinctio_369', 'Et deleniti deserunt velit ipsa dolor expedita.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 490, 32, 0, 850, 1, 1563740575, 1564258975, 0, NULL, NULL, 'Bank Deposit', 1564086175, 0, '0'),
(222, 'et_617', 'Corrupti ipsum et tempora animi eveniet repellat.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 830, 1, 0, 850, 1, 1563308575, 1564431775, 0, NULL, NULL, 'Cheque', 1564431775, 0, '0'),
(223, 'iste_366', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 560, 26, 0, 800, 1, 1563826976, 1565209376, 0, NULL, NULL, 'Cheque', 1564863776, 1, '0'),
(224, 'assumenda_725', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 840, 0, 20, 480, 0, 1563826976, 1564345376, 1, NULL, NULL, 'Online', 1565727776, 1, '0'),
(225, 'animi_167', 'Atque dolorem nemo repellendus fugiat quia voluptatum rerum aliquam.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 690, 27, 0, 580, 1, 1564086176, 1565036576, 0, NULL, NULL, 'Cheque', 1563567776, 1, '0'),
(226, 'debitis_594', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 920, 0, 0, 110, 0, 1563913376, 1564950176, 0, NULL, NULL, 'Bank Deposit', 1565382176, 1, '0'),
(227, 'consequatur_716', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 720, 0, 0, 290, 1, 1563913376, 1564258976, 0, NULL, NULL, 'Card', 1563481376, 0, '0'),
(228, 'accusantium_794', 'Error porro nobis repudiandae laboriosam repudiandae.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 460, 0, 29, 730, 1, 1563740576, 1564258976, 0, NULL, NULL, 'Bank Deposit', 1565727776, 1, '0'),
(229, 'et_291', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 700, 6, 0, 630, 0, 1563222176, 1565382176, 0, NULL, NULL, 'Cash', 1563567776, 0, '0'),
(230, 'temporibus_392', 'Ut rem aut consequatur ducimus ex.', 47, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 890, 1, 8, 310, 0, 1563826976, 1565641376, 0, NULL, NULL, 'Cheque', 1564604576, 0, '0'),
(231, 'esse_211', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 430, 0, 30, 450, 1, 1564172576, 1564777376, 0, NULL, NULL, 'Online', 1564777376, 1, '0'),
(232, 'aut_105', 'Sit et facilis delectus qui enim.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 60, 27, 33, 230, 0, 1563826976, 1565641376, 0, NULL, NULL, 'Card', 1565814176, 1, '0'),
(233, 'sed_468', 'Optio itaque doloremque fugiat dolores deleniti.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 110, 0, 0, 480, 0, 1563999776, 1565554976, 0, NULL, NULL, 'Cash', 1563913376, 1, '0'),
(234, 'doloribus_615', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 150, 0, 0, 360, 1, 1563481376, 1564345376, 0, NULL, NULL, 'Online', 1565641376, 0, '0'),
(235, 'quas_358', 'Aut dolor repellat nulla aut voluptate.', 57, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 170, 0, 3, 680, 1, 1563826976, 1565468576, 0, NULL, NULL, 'Online', 1563567776, 1, '0'),
(236, 'hic_764', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 370, 24, 0, 140, 0, 1564258976, 1565468576, 0, NULL, NULL, 'Bank Deposit', 1565727776, 0, '0'),
(237, 'omnis_169', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 300, 0, 32, 480, 1, 1563740576, 1565209376, 0, NULL, NULL, 'Card', 1563999776, 1, '0'),
(238, 'voluptas_311', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 600, 32, 0, 530, 1, 1563654176, 1564690976, 0, NULL, NULL, 'Cash', 1564863776, 1, '0'),
(239, 'vero_927', 'Enim inventore distinctio consequatur et aut.', 75, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 730, 0, 0, 430, 1, 1564086176, 1564258976, 0, NULL, NULL, 'Bank Deposit', 1565295776, 1, '0'),
(240, 'sapiente_369', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 950, 7, 37, 930, 0, 1563222176, 1564345376, 1, NULL, NULL, 'Bank Deposit', 1565468576, 1, '0'),
(241, 'omnis_573', 'Magnam laborum ex magnam voluptate ullam error.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 420, 0, 7, 970, 0, 1564258976, 1565122976, 0, NULL, NULL, 'Online', 1564604576, 0, '0'),
(242, 'laboriosam_609', 'Enim ratione est quia aperiam hic nisi voluptas impedit pariatur voluptatem omnis.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 690, 0, 20, 650, 0, 1563394976, 1564604576, 0, NULL, NULL, 'Card', 1565382176, 0, '0'),
(243, 'odit_747', 'Aspernatur modi a delectus quasi et exercitationem quisquam cum.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 800, 1, 0, 790, 0, 1563222176, 1564431776, 1, NULL, NULL, 'Card', 1565554976, 0, '0'),
(244, 'omnis_390', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 910, 0, 6, 860, 1, 1563999776, 1565727776, 0, NULL, NULL, 'Online', 1565209376, 1, '0'),
(245, 'rerum_507', 'Unde unde consequatur quas dolores nostrum.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 270, 33, 43, 920, 1, 1563394976, 1564777376, 0, NULL, NULL, 'Bank Deposit', 1563999776, 0, '0'),
(246, 'rerum_944', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 280, 11, 28, 380, 0, 1563999776, 1564258976, 1, NULL, NULL, 'Online', 1564172576, 1, '0'),
(247, 'repudiandae_911', 'Et nam facere laborum et labore sapiente officia nemo placeat.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 920, 2, 17, 980, 1, 1563222176, 1565814176, 0, NULL, NULL, 'Card', 1565209376, 0, '0'),
(248, 'quam_647', 'Culpa nobis quas minima et et aut hic repellat quae at est.', 75, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 60, 14, 32, 980, 0, 1563826976, 1564345376, 1, NULL, NULL, 'Bank Deposit', 1563654176, 1, '0'),
(249, 'amet_753', 'Ut assumenda ut eum animi officia et tempora qui corporis illo.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 940, 0, 0, 560, 0, 1563567776, 1564345376, 1, NULL, NULL, 'Cash', 1565641376, 1, '0'),
(250, 'alias_329', 'Tempora officiis tenetur cupiditate tempore iure eaque eveniet sed.', 73, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 390, 0, 16, 100, 1, 1563481376, 1564431776, 0, NULL, NULL, 'Card', 1563913376, 0, '0'),
(251, 'alias_269', 'Dolore ut dolor est qui omnis vel in earum sunt.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 700, 0, 0, 680, 1, 1564258976, 1565814176, 0, NULL, NULL, 'Cheque', 1565295776, 1, '0'),
(252, 'quidem_431', 'Eius omnis distinctio illo adipisci expedita.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 560, 9, 44, 790, 0, 1564172576, 1564604576, 0, NULL, NULL, 'Cash', 1564950176, 0, '0'),
(253, 'aliquid_587', 'Impedit eveniet est aut corrupti doloremque et vel molestiae.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 440, 14, 0, 880, 0, 1563481376, 1564690976, 0, NULL, NULL, 'Cash', 1565036576, 1, '0'),
(254, 'voluptatibus_126', 'Velit facere totam quaerat delectus.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 480, 20, 47, 820, 0, 1564172576, 1564863776, 0, NULL, NULL, 'Online', 1565122976, 0, '0'),
(255, 'et_712', 'Nam modi dolor cum exercitationem impedit.', 51, '[{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 320, 0, 0, 900, 0, 1564258976, 1564863776, 0, NULL, NULL, 'Card', 1564086176, 0, '0'),
(256, 'odit_486', NULL, 64, '[{\"title\":\"Library fee\",\"amount\":\"600\"}]', 320, 0, 39, 380, 1, 1563481376, 1564345376, 0, NULL, NULL, 'Cash', 1564950176, 1, '0'),
(257, 'eum_431', 'Eveniet et dolorum et assumenda asperiores reprehenderit.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 360, 28, 0, 590, 1, 1563913376, 1564345376, 0, NULL, NULL, 'Cash', 1564345376, 0, '0'),
(258, 'at_982', 'Cupiditate molestiae deleniti exercitationem eligendi similique minima veniam reiciendis reprehenderit quo.', 49, '[{\"title\":\"Library fee\",\"amount\":\"800\"}]', 980, 45, 17, 990, 0, 1563481376, 1564258976, 1, NULL, NULL, 'Card', 1563913376, 1, '0'),
(259, 'est_636', NULL, 51, '[{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 800, 14, 0, 140, 0, 1563567776, 1564950176, 0, NULL, NULL, 'Cheque', 1563654176, 1, '0'),
(260, 'vel_542', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 950, 28, 9, 340, 0, 1564258976, 1565554976, 0, NULL, NULL, 'Cheque', 1564258976, 1, '0'),
(261, 'inventore_611', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 990, 12, 0, 480, 1, 1563481376, 1565036576, 0, NULL, NULL, 'Cash', 1565641376, 1, '0'),
(262, 'qui_697', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 810, 22, 0, 280, 0, 1563308576, 1564431776, 1, NULL, NULL, 'Cash', 1564604576, 0, '0'),
(263, 'non_298', 'Fuga vitae nobis quisquam aut eum culpa.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 490, 0, 0, 210, 0, 1563222176, 1564258976, 1, NULL, NULL, 'Bank Deposit', 1565295776, 1, '0'),
(264, 'natus_876', 'Sapiente dignissimos sed et perspiciatis dolores iusto inventore quis autem assumenda.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 940, 25, 45, 360, 0, 1563308576, 1564258976, 1, NULL, NULL, 'Bank Deposit', 1564172576, 1, '0'),
(265, 'placeat_657', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 520, 0, 21, 290, 0, 1563826976, 1564604576, 0, NULL, NULL, 'Cash', 1563481376, 0, '0'),
(266, 'error_841', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 990, 38, 0, 490, 1, 1564172576, 1565727776, 0, NULL, NULL, 'Card', 1563308576, 0, '0'),
(267, 'in_111', 'Quam accusantium qui maxime magni cumque velit rerum veniam qui placeat.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 100, 0, 0, 430, 1, 1564258976, 1565122976, 0, NULL, NULL, 'Cheque', 1564431776, 0, '0'),
(268, 'quisquam_517', 'Similique ut rem qui tempore facere asperiores dolores quaerat quia.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 360, 2, 0, 750, 0, 1564086176, 1564345376, 1, NULL, NULL, 'Card', 1564863776, 0, '0'),
(269, 'sequi_560', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 500, 50, 0, 850, 1, 1563826976, 1564431776, 0, NULL, NULL, 'Cheque', 1563999776, 0, '0'),
(270, 'dolor_302', 'Doloribus nihil ut ut repellat recusandae quaerat error beatae praesentium at.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 220, 43, 8, 410, 1, 1563740576, 1564863776, 0, NULL, NULL, 'Cash', 1563913376, 0, '0'),
(271, 'rerum_839', 'Adipisci in possimus ut sunt rerum earum id nulla quaerat quis.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 550, 24, 0, 120, 1, 1563394976, 1565814176, 0, NULL, NULL, 'Online', 1565295776, 0, '0'),
(272, 'voluptate_717', 'Ipsum et molestias quaerat cupiditate atque odit repellat.', 64, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 170, 0, 19, 710, 0, 1563222176, 1564258976, 1, NULL, NULL, 'Bank Deposit', 1564086176, 1, '0'),
(273, 'molestiae_332', 'Corporis et excepturi tempora excepturi repellat quaerat blanditiis nam non vel sit.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 760, 0, 38, 500, 0, 1564086176, 1564431776, 1, NULL, NULL, 'Cash', 1563999776, 0, '0'),
(274, 'earum_869', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 370, 0, 30, 700, 1, 1563394976, 1565468576, 0, NULL, NULL, 'Online', 1565036576, 0, '0'),
(275, 'eos_528', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 840, 48, 0, 780, 0, 1563567776, 1564431776, 1, NULL, NULL, 'Cash', 1564431776, 1, '0'),
(276, 'quam_842', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 550, 30, 0, 270, 1, 1563567776, 1564258976, 0, NULL, NULL, 'Online', 1564690976, 1, '0'),
(277, 'dolorem_525', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 810, 0, 8, 910, 0, 1563222176, 1564431776, 1, NULL, NULL, 'Card', 1564172576, 0, '0'),
(278, 'ex_171', 'Sit voluptatem id nesciunt quis assumenda.', 46, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 250, 0, 0, 440, 1, 1563654176, 1564950176, 0, NULL, NULL, 'Card', 1564258976, 0, '0'),
(279, 'voluptas_921', 'Expedita sit nihil magnam dolor similique fugiat laudantium provident.', 67, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 500, 46, 20, 460, 0, 1563394976, 1564258976, 1, NULL, NULL, 'Cheque', 1563567776, 0, '0'),
(280, 'modi_859', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 830, 0, 29, 370, 1, 1564172576, 1565382176, 0, NULL, NULL, 'Cheque', 1565036576, 0, '0'),
(281, 'ipsum_568', NULL, 53, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 470, 0, 0, 500, 0, 1563222176, 1564777376, 0, NULL, NULL, 'Cash', 1565641376, 1, '0'),
(282, 'sed_286', 'Nobis debitis sed eaque explicabo rerum.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 250, 7, 0, 530, 0, 1564086177, 1564431777, 1, NULL, NULL, 'Card', 1564345377, 0, '0'),
(283, 'aliquam_478', 'Quia quae nam ipsam laudantium quod et quod.', 46, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 790, 10, 0, 200, 1, 1564172577, 1565382177, 0, NULL, NULL, 'Bank Deposit', 1565295777, 1, '0'),
(284, 'dignissimos_710', 'Ut illo qui voluptas nam ea eum vel aut cupiditate.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 880, 5, 0, 500, 1, 1563308577, 1565295777, 0, NULL, NULL, 'Card', 1563913377, 0, '0'),
(285, 'quia_394', 'Repudiandae exercitationem quidem voluptate placeat illum.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 510, 9, 33, 380, 1, 1563654177, 1564777377, 0, NULL, NULL, 'Card', 1564345377, 0, '0'),
(286, 'non_588', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 840, 0, 0, 880, 0, 1563654177, 1564345377, 1, NULL, NULL, 'Cash', 1565295777, 1, '0'),
(287, 'est_205', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 140, 0, 0, 330, 1, 1563394977, 1564863777, 0, NULL, NULL, 'Cheque', 1563913377, 1, '0'),
(288, 'voluptatem_786', 'Nostrum omnis eligendi aut cupiditate consequuntur neque cupiditate.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 960, 0, 4, 250, 0, 1564086177, 1564258977, 1, NULL, NULL, 'Cheque', 1565727777, 0, '0'),
(289, 'consequatur_437', 'Et labore a molestiae dolorem autem qui.', 52, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 170, 0, 0, 310, 0, 1563999777, 1565295777, 0, NULL, NULL, 'Card', 1565468577, 1, '0'),
(290, 'voluptatem_700', 'Illum aut numquam id ut ut et et quas.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 770, 45, 0, 690, 1, 1563999777, 1564258977, 0, NULL, NULL, 'Online', 1564258977, 0, '0'),
(291, 'laborum_831', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 740, 0, 23, 470, 1, 1563394977, 1564258977, 0, NULL, NULL, 'Cheque', 1563222177, 1, '0'),
(292, 'repellendus_276', 'Natus sed illo aut in aut harum.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 890, 0, 7, 110, 0, 1564086177, 1564258977, 1, NULL, NULL, 'Cash', 1565554977, 1, '0'),
(293, 'nobis_735', NULL, 56, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 900, 8, 3, 550, 1, 1563394977, 1564431777, 0, NULL, NULL, 'Bank Deposit', 1564690977, 1, '0'),
(294, 'voluptatem_708', 'Ea sunt nostrum eos dicta vero ullam.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 270, 0, 39, 80, 1, 1563222177, 1565209377, 0, NULL, NULL, 'Online', 1565382177, 1, '0'),
(295, 'necessitatibus_693', 'Aut dolorum et quia voluptates qui culpa id.', 45, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 730, 0, 0, 140, 1, 1563222177, 1564258977, 0, NULL, NULL, 'Cheque', 1565122977, 0, '0'),
(296, 'et_606', NULL, 73, '[{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 770, 34, 4, 380, 1, 1564258977, 1565036577, 0, NULL, NULL, 'Cash', 1565727777, 0, '0'),
(297, 'rerum_114', 'Aperiam minima nobis quaerat culpa quidem voluptatem quisquam voluptatem sequi aut.', 56, '[{\"title\":\"Library fee\",\"amount\":\"700\"}]', 190, 0, 18, 570, 1, 1564172577, 1564258977, 0, NULL, NULL, 'Card', 1563308577, 1, '0'),
(298, 'facilis_123', 'Ut consequatur deserunt et beatae laborum.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 330, 38, 0, 310, 0, 1563394977, 1564431777, 1, NULL, NULL, 'Cheque', 1563222177, 1, '0'),
(299, 'voluptatem_137', 'Facere dolor facere officiis voluptatibus asperiores.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 750, 0, 0, 800, 0, 1563740577, 1564258977, 1, NULL, NULL, 'Bank Deposit', 1565382177, 1, '0'),
(300, 'nobis_127', NULL, 53, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 280, 45, 0, 300, 1, 1563481377, 1564777377, 0, NULL, NULL, 'Online', 1565814177, 0, '0'),
(301, 'voluptatem_945', 'Illo voluptas nulla ea consectetur rem delectus.', 51, '[{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 420, 0, 9, 690, 1, 1563740577, 1564431777, 0, NULL, NULL, 'Online', 1565122977, 1, '0'),
(302, 'architecto_126', NULL, 51, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 680, 45, 0, 860, 1, 1564086177, 1565554977, 0, NULL, NULL, 'Bank Deposit', 1563999777, 0, '0'),
(303, 'ipsam_361', 'Quo ipsum et ut enim dolores.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 60, 20, 0, 690, 1, 1564258977, 1564431777, 0, NULL, NULL, 'Cheque', 1565554977, 0, '0'),
(304, 'aliquam_923', 'Quod ut voluptates eum rerum explicabo.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 250, 9, 0, 790, 0, 1563394977, 1564777377, 0, NULL, NULL, 'Cheque', 1563308577, 1, '0'),
(305, 'rem_934', 'Sunt saepe quia corporis doloremque molestias.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 510, 18, 34, 70, 1, 1563826977, 1565122977, 0, NULL, NULL, 'Cheque', 1565036577, 0, '0'),
(306, 'ipsum_456', 'Sequi molestiae alias nesciunt sint quis molestiae ipsam quia qui optio.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 590, 29, 0, 880, 1, 1563826977, 1564345377, 0, NULL, NULL, 'Online', 1563654177, 0, '0'),
(307, 'repellat_724', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 580, 8, 0, 100, 1, 1563394977, 1564431777, 0, NULL, NULL, 'Online', 1563308577, 0, '0'),
(308, 'rerum_177', 'Voluptatem temporibus et possimus exercitationem eum porro dolores corporis nisi quia.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 800, 0, 15, 520, 1, 1563567777, 1565814177, 0, NULL, NULL, 'Card', 1565468577, 1, '0'),
(309, 'quaerat_163', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 430, 0, 18, 690, 0, 1563999777, 1564258977, 1, NULL, NULL, 'Card', 1565295777, 1, '0'),
(310, 'ut_334', NULL, 54, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 110, 0, 0, 690, 1, 1563740577, 1565122977, 0, NULL, NULL, 'Cheque', 1565122977, 0, '0'),
(311, 'qui_199', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 150, 44, 37, 180, 0, 1563913377, 1565554977, 0, NULL, NULL, 'Cash', 1563740577, 1, '0'),
(312, 'doloremque_515', 'Dolores aperiam occaecati quo aut dolores aut in.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 370, 0, 0, 810, 0, 1563740577, 1564258977, 1, NULL, NULL, 'Card', 1563826977, 0, '0'),
(313, 'vel_938', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 300, 0, 23, 440, 0, 1563740577, 1565295777, 0, NULL, NULL, 'Bank Deposit', 1564172577, 0, '0'),
(314, 'quae_176', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 550, 0, 0, 840, 0, 1563999777, 1565727777, 0, NULL, NULL, 'Card', 1563222177, 1, '0'),
(315, 'neque_446', 'Sed velit eos sunt qui rerum qui porro.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 770, 0, 0, 790, 0, 1564172577, 1565641377, 0, NULL, NULL, 'Cash', 1564777377, 0, '0'),
(316, 'distinctio_697', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 570, 0, 36, 150, 1, 1563913377, 1564345377, 0, NULL, NULL, 'Bank Deposit', 1564777377, 1, '0'),
(317, 'quo_412', 'Minus dolores aperiam illum ullam eum.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 880, 10, 36, 610, 0, 1563567777, 1565554977, 0, NULL, NULL, 'Cheque', 1563826977, 1, '0'),
(318, 'et_853', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 800, 44, 0, 530, 1, 1564086177, 1564345377, 0, NULL, NULL, 'Cash', 1565727777, 1, '0'),
(319, 'id_331', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 620, 0, 0, 170, 1, 1563999777, 1564431777, 0, NULL, NULL, 'Cash', 1563222177, 1, '0'),
(320, 'temporibus_818', 'Culpa magnam nobis quia commodi sed.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 870, 0, 15, 800, 1, 1564172577, 1564777377, 0, NULL, NULL, 'Card', 1565554977, 0, '0'),
(321, 'asperiores_527', 'Voluptas reprehenderit quos quia aut non autem quia.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 930, 34, 0, 400, 1, 1564086177, 1564431777, 0, NULL, NULL, 'Bank Deposit', 1564172577, 0, '0'),
(322, 'modi_301', 'Velit vel accusantium et qui ut neque laboriosam.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 340, 36, 0, 580, 0, 1563481377, 1564777377, 0, NULL, NULL, 'Online', 1565295777, 1, '0'),
(323, 'assumenda_364', 'Repellendus tempore dicta et consectetur dolorum et officia omnis voluptate.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"100\"}]', 460, 0, 46, 880, 0, 1564086177, 1564431777, 1, NULL, NULL, 'Cash', 1565295777, 0, '0'),
(324, 'molestias_132', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 780, 0, 0, 530, 0, 1563394977, 1564258977, 1, NULL, NULL, 'Online', 1564258977, 0, '0'),
(325, 'esse_822', 'Ab vitae rem enim praesentium est ut molestiae provident minima in.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 730, 0, 0, 540, 0, 1564086177, 1564950177, 0, NULL, NULL, 'Cheque', 1565641377, 0, '0'),
(326, 'est_311', NULL, 75, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 880, 20, 0, 810, 0, 1563999777, 1565554977, 0, NULL, NULL, 'Online', 1564690977, 1, '0'),
(327, 'optio_567', 'Facere quod quod voluptate harum aspernatur nam et laboriosam.', 52, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 400, 0, 20, 520, 1, 1563654177, 1564777377, 0, NULL, NULL, 'Cash', 1565209377, 0, '0'),
(328, 'numquam_492', NULL, 47, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 970, 0, 24, 550, 1, 1563913377, 1565036577, 0, NULL, NULL, 'Bank Deposit', 1564604577, 1, '0'),
(329, 'dignissimos_625', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 980, 50, 0, 80, 0, 1563394977, 1564345377, 1, NULL, NULL, 'Online', 1565727777, 1, '0'),
(330, 'dolores_364', 'Porro tempore est reprehenderit velit aliquid.', 56, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 890, 0, 8, 320, 0, 1563740577, 1565036577, 0, NULL, NULL, 'Online', 1564690977, 1, '0'),
(331, 'natus_457', 'Odit cupiditate voluptatem occaecati magni quia.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 770, 0, 35, 540, 1, 1564172577, 1564345377, 0, NULL, NULL, 'Cash', 1564604577, 0, '0'),
(332, 'ullam_416', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 720, 0, 0, 630, 0, 1563913377, 1564777377, 0, NULL, NULL, 'Cash', 1563222177, 1, '0'),
(333, 'voluptatibus_134', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 780, 0, 0, 810, 0, 1564086177, 1564345377, 1, NULL, NULL, 'Cheque', 1563308577, 0, '0'),
(334, 'ut_439', NULL, 53, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 290, 0, 7, 60, 1, 1563222177, 1565036577, 0, NULL, NULL, 'Online', 1565382177, 0, '0'),
(335, 'fugit_472', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 700, 46, 0, 470, 1, 1563481377, 1564345377, 0, NULL, NULL, 'Cheque', 1564950177, 0, '0'),
(336, 'ipsam_570', 'Excepturi quam nam qui porro officia voluptas molestiae.', 46, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 490, 21, 0, 420, 0, 1563740577, 1565036577, 0, NULL, NULL, 'Bank Deposit', 1563826977, 1, '0'),
(337, 'consequatur_716', 'Ducimus omnis adipisci ab sapiente ipsum tempora corrupti laboriosam ut.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 720, 0, 16, 900, 0, 1563654177, 1564777377, 0, NULL, NULL, 'Card', 1565814177, 1, '0'),
(338, 'consectetur_303', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 560, 0, 0, 440, 0, 1563826977, 1564258977, 1, NULL, NULL, 'Card', 1565382177, 1, '0'),
(339, 'sit_311', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 170, 46, 35, 90, 1, 1563826977, 1564950177, 0, NULL, NULL, 'Cheque', 1563481377, 1, '0'),
(340, 'ipsam_568', NULL, 75, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 630, 34, 0, 110, 0, 1563913377, 1564258977, 1, NULL, NULL, 'Bank Deposit', 1564345377, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(341, 'dolore_160', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 420, 0, 45, 260, 0, 1564086178, 1564431778, 1, NULL, NULL, 'Bank Deposit', 1563481378, 1, '0'),
(342, 'ut_927', NULL, 53, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 950, 26, 28, 580, 1, 1563826978, 1564604578, 0, NULL, NULL, 'Cash', 1565122978, 1, '0'),
(343, 'iste_700', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 730, 28, 5, 800, 1, 1563481378, 1564863778, 0, NULL, NULL, 'Bank Deposit', 1565641378, 1, '0'),
(344, 'eum_549', 'Et pariatur omnis recusandae repellendus doloremque inventore dolores nihil.', 75, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 880, 0, 0, 560, 1, 1564258978, 1564345378, 0, NULL, NULL, 'Cheque', 1565036578, 0, '0'),
(345, 'placeat_927', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 280, 4, 8, 390, 1, 1563222178, 1565814178, 0, NULL, NULL, 'Bank Deposit', 1565468578, 1, '0'),
(346, 'sint_762', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 300, 0, 0, 980, 1, 1563481378, 1564258978, 0, NULL, NULL, 'Cash', 1565122978, 1, '0'),
(347, 'ut_451', 'Eligendi porro rerum ut voluptate id laboriosam consectetur.', 54, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 340, 18, 7, 670, 0, 1563567778, 1564431778, 1, NULL, NULL, 'Cheque', 1563740578, 0, '0'),
(348, 'ratione_419', NULL, 51, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 520, 0, 0, 80, 0, 1563999778, 1564431778, 1, NULL, NULL, 'Cheque', 1565036578, 1, '0'),
(349, 'voluptatum_532', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 120, 22, 5, 890, 0, 1563567778, 1564258978, 1, NULL, NULL, 'Cheque', 1563740578, 0, '0'),
(350, 'sapiente_329', 'Est rerum at omnis repudiandae animi ipsum qui placeat commodi.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 270, 0, 44, 310, 0, 1563308578, 1564345378, 1, NULL, NULL, 'Cheque', 1563654178, 0, '0'),
(351, 'consequatur_409', 'Unde beatae sapiente quos sit voluptatum eaque ut dolorem sit nesciunt.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 860, 1, 7, 490, 0, 1563913378, 1564258978, 1, NULL, NULL, 'Card', 1563308578, 0, '0'),
(352, 'nesciunt_575', 'Reprehenderit deserunt fugiat facere aspernatur occaecati.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 360, 16, 0, 230, 1, 1564172578, 1565209378, 0, NULL, NULL, 'Card', 1565295778, 0, '0'),
(353, 'corrupti_430', 'Porro voluptatem eligendi omnis sit et.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 170, 0, 0, 260, 1, 1563394978, 1565382178, 0, NULL, NULL, 'Cash', 1565122978, 0, '0'),
(354, 'aut_477', 'Ipsam harum est expedita aut neque aut totam.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 130, 15, 0, 500, 0, 1563481378, 1565641378, 0, NULL, NULL, 'Cheque', 1563308578, 0, '0'),
(355, 'molestiae_506', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"}]', 300, 8, 0, 50, 0, 1563222178, 1564431778, 1, NULL, NULL, 'Cash', 1563222178, 1, '0'),
(356, 'reiciendis_912', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 420, 0, 28, 930, 1, 1563740578, 1564690978, 0, NULL, NULL, 'Cash', 1565209378, 0, '0'),
(357, 'qui_874', 'Sit maxime sint dolores ex eveniet ullam dolorum nihil aut.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 290, 0, 36, 670, 0, 1564258978, 1565036578, 0, NULL, NULL, 'Online', 1564258978, 1, '0'),
(358, 'fugit_642', 'Nisi doloremque maxime rerum ab magnam veniam et sed.', 56, '[{\"title\":\"Library fee\",\"amount\":\"600\"}]', 390, 0, 0, 470, 1, 1563999778, 1564777378, 0, NULL, NULL, 'Cheque', 1563567778, 0, '0'),
(359, 'ut_494', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 950, 0, 0, 670, 0, 1564258978, 1564863778, 0, NULL, NULL, 'Online', 1563481378, 0, '0'),
(360, 'fuga_105', 'Reiciendis aliquam enim possimus optio qui dolor magni mollitia quia dolore et.', 75, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 340, 0, 7, 310, 1, 1563999778, 1564345378, 0, NULL, NULL, 'Card', 1565554978, 1, '0'),
(361, 'est_532', 'Qui voluptatem quos dolor quo veniam laborum.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 700, 0, 6, 270, 0, 1564086178, 1564431778, 1, NULL, NULL, 'Card', 1564431778, 0, '0'),
(362, 'voluptas_535', 'Enim deleniti in qui iure est dignissimos recusandae magnam enim.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 850, 0, 0, 750, 1, 1563740578, 1564863778, 0, NULL, NULL, 'Cash', 1564345378, 1, '0'),
(363, 'laudantium_948', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 830, 0, 0, 350, 0, 1563826978, 1564690978, 0, NULL, NULL, 'Cheque', 1563222178, 1, '0'),
(364, 'dolores_256', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 660, 45, 0, 840, 1, 1564086178, 1564258978, 0, NULL, NULL, 'Cash', 1563481378, 1, '0'),
(365, 'corrupti_827', 'Dolorum eius ut dolorem expedita deleniti aperiam libero aspernatur.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 50, 0, 0, 520, 0, 1564172578, 1564431778, 1, NULL, NULL, 'Online', 1565295778, 0, '0'),
(366, 'enim_490', 'Quidem dolor ad est est aut.', 52, '[{\"title\":\"Library fee\",\"amount\":\"500\"}]', 80, 3, 46, 180, 1, 1563913378, 1564258978, 0, NULL, NULL, 'Cash', 1565382178, 0, '0'),
(367, 'et_890', 'Est sint itaque illum dolorem sed qui mollitia.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 670, 50, 14, 50, 0, 1563913378, 1565382178, 0, NULL, NULL, 'Cheque', 1564863778, 0, '0'),
(368, 'deleniti_494', 'Enim aliquam ut ut aperiam ut dolore expedita explicabo ducimus.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 100, 43, 0, 530, 1, 1563826978, 1565209378, 0, NULL, NULL, 'Bank Deposit', 1565382178, 1, '0'),
(369, 'non_483', 'Eligendi in omnis commodi aut cum.', 54, '[{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 710, 30, 1, 970, 0, 1563567778, 1564345378, 1, NULL, NULL, 'Cash', 1563222178, 1, '0'),
(370, 'molestiae_924', 'Aut quam voluptatem vero ipsa sit.', 52, ']', 370, 0, 3, 50, 1, 1563308578, 1564431778, 0, NULL, NULL, 'Bank Deposit', 1564431778, 0, '0'),
(371, 'dolorem_401', 'Fuga quia ullam et qui enim.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 200, 25, 43, 710, 0, 1563654178, 1564258978, 1, NULL, NULL, 'Card', 1563308578, 0, '0'),
(372, 'sit_569', 'Odio expedita consequatur enim repellendus odit repellendus voluptas accusantium consectetur est.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 300, 0, 0, 870, 1, 1564172578, 1565295778, 0, NULL, NULL, 'Cash', 1564690978, 0, '0'),
(373, 'qui_575', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 130, 0, 5, 270, 0, 1563913378, 1564950178, 0, NULL, NULL, 'Cheque', 1563654178, 0, '0'),
(374, 'et_522', 'Iste et voluptas esse commodi odit aspernatur maiores dolor.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 490, 0, 48, 960, 0, 1563567778, 1564258978, 1, NULL, NULL, 'Cheque', 1565209378, 0, '0'),
(375, 'sit_429', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 600, 3, 16, 740, 1, 1563654178, 1564345378, 0, NULL, NULL, 'Online', 1564345378, 0, '0'),
(376, 'et_986', NULL, 47, ']', 580, 7, 45, 220, 0, 1563222178, 1565727778, 0, NULL, NULL, 'Card', 1563740578, 0, '0'),
(377, 'magni_894', 'Sed sunt alias et iste et voluptate ut voluptatem.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 550, 44, 0, 940, 1, 1563308578, 1565814178, 0, NULL, NULL, 'Cash', 1563567778, 1, '0'),
(378, 'aperiam_784', 'Perferendis optio aut beatae perferendis eos enim id quibusdam dolorem.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 740, 27, 0, 400, 1, 1564258978, 1564431778, 0, NULL, NULL, 'Online', 1563567778, 1, '0'),
(379, 'voluptatum_911', 'Dolorum ab ipsum culpa ea porro quis vel.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 830, 0, 0, 60, 0, 1563913378, 1565727778, 0, NULL, NULL, 'Cheque', 1563826978, 1, '0'),
(380, 'veniam_878', 'Tempora voluptatem voluptatem ea ut exercitationem qui eveniet aut.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 610, 0, 34, 360, 1, 1564086178, 1565554978, 0, NULL, NULL, 'Cash', 1565727778, 0, '0'),
(381, 'maxime_417', NULL, 56, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 750, 50, 0, 850, 1, 1563913378, 1565382178, 0, NULL, NULL, 'Bank Deposit', 1565727778, 1, '0'),
(382, 'pariatur_790', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 990, 0, 0, 650, 0, 1563308578, 1564950178, 0, NULL, NULL, 'Online', 1564086178, 1, '0'),
(383, 'animi_982', 'Voluptatem et impedit quis consequatur et tempora.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 290, 0, 47, 660, 1, 1564172578, 1564345378, 0, NULL, NULL, 'Cheque', 1565554978, 0, '0'),
(384, 'iste_489', 'Deleniti voluptas quo id laborum libero molestiae et enim id.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 910, 46, 31, 730, 0, 1563826978, 1564345378, 1, NULL, NULL, 'Bank Deposit', 1565554978, 0, '0'),
(385, 'est_677', 'Mollitia illo ut sint pariatur quia amet et corrupti.', 47, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 580, 0, 0, 540, 1, 1563308578, 1564345378, 0, NULL, NULL, 'Cash', 1564777378, 1, '0'),
(386, 'dolores_340', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 400, 0, 5, 890, 0, 1563308578, 1564431778, 1, NULL, NULL, 'Cheque', 1564258978, 0, '0'),
(387, 'commodi_471', 'Fuga maxime est incidunt dolorem.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 510, 48, 0, 840, 1, 1563913378, 1565036578, 0, NULL, NULL, 'Cheque', 1565814178, 1, '0'),
(388, 'architecto_945', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 750, 0, 0, 990, 1, 1563567778, 1565122978, 0, NULL, NULL, 'Bank Deposit', 1564258978, 0, '0'),
(389, 'aliquid_626', 'Modi voluptas et accusamus accusamus placeat deleniti.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 580, 20, 17, 250, 1, 1563654178, 1564258978, 0, NULL, NULL, 'Cheque', 1565641378, 0, '0'),
(390, 'quia_884', 'Rerum incidunt fugiat incidunt molestiae et.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 360, 21, 0, 880, 1, 1563826979, 1564777379, 0, NULL, NULL, 'Cheque', 1564345379, 0, '0'),
(391, 'reprehenderit_560', 'Dolores occaecati voluptas ad impedit aut consectetur corporis.', 73, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 320, 25, 0, 730, 1, 1563481379, 1564258979, 0, NULL, NULL, 'Bank Deposit', 1564777379, 1, '0'),
(392, 'dolores_540', 'Sed accusantium tempore voluptatibus atque eligendi maiores voluptate qui ut.', 52, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 390, 42, 0, 860, 1, 1564258979, 1564690979, 0, NULL, NULL, 'Cheque', 1564950179, 0, '0'),
(393, 'laborum_378', 'Laborum et sequi non rerum quia quos delectus dolorem unde sed.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 620, 0, 22, 450, 1, 1563740579, 1564345379, 0, NULL, NULL, 'Cheque', 1563826979, 1, '0'),
(394, 'rerum_784', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 850, 0, 30, 900, 0, 1564258979, 1564431779, 1, NULL, NULL, 'Cheque', 1563308579, 1, '0'),
(395, 'aut_312', 'Tempora et quam magnam recusandae omnis esse iusto vitae saepe.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 590, 2, 20, 800, 1, 1563308579, 1565641379, 0, NULL, NULL, 'Card', 1564863779, 1, '0'),
(396, 'sed_771', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 230, 23, 3, 300, 1, 1564258979, 1565468579, 0, NULL, NULL, 'Cheque', 1564950179, 0, '0'),
(397, 'saepe_492', 'Pariatur voluptate est libero esse dolorem quibusdam sunt ut cumque maiores culpa.', 49, '[{\"title\":\"Library fee\",\"amount\":\"200\"}]', 530, 33, 0, 400, 0, 1563567779, 1564345379, 1, NULL, NULL, 'Card', 1565554979, 1, '0'),
(398, 'fugit_284', 'Tempore iusto nostrum vero impedit voluptas enim.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 720, 0, 35, 940, 1, 1563740579, 1564431779, 0, NULL, NULL, 'Cash', 1563913379, 1, '0'),
(399, 'sint_585', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 180, 35, 13, 160, 0, 1563999779, 1564345379, 1, NULL, NULL, 'Cash', 1565295779, 1, '0'),
(400, 'quod_198', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 960, 23, 13, 440, 0, 1563654179, 1564950179, 0, NULL, NULL, 'Card', 1565554979, 1, '0'),
(401, 'sequi_534', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 750, 0, 19, 820, 1, 1563567779, 1565727779, 0, NULL, NULL, 'Cash', 1565209379, 0, '0'),
(402, 'fuga_789', 'Laudantium eum et iusto sed voluptatibus quis velit explicabo dolor voluptatem eum.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 770, 30, 0, 420, 1, 1563740579, 1564431779, 0, NULL, NULL, 'Online', 1565814179, 0, '0'),
(403, 'esse_647', 'Ea non autem quis atque dolores et et explicabo doloremque.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 830, 34, 0, 890, 0, 1563999779, 1565727779, 0, NULL, NULL, 'Cash', 1564258979, 1, '0'),
(404, 'fugiat_519', 'Veniam dolores et alias saepe excepturi esse.', 56, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 100, 42, 28, 100, 1, 1563654179, 1564431779, 0, NULL, NULL, 'Online', 1565382179, 1, '0'),
(405, 'fuga_958', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 230, 0, 38, 740, 0, 1563654179, 1565295779, 0, NULL, NULL, 'Card', 1565727779, 1, '0'),
(406, 'facere_152', 'Voluptatem ad vero eaque sed et laudantium.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 130, 0, 18, 260, 1, 1563394979, 1565727779, 0, NULL, NULL, 'Online', 1565382179, 1, '0'),
(407, 'hic_137', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 170, 0, 20, 360, 1, 1563913379, 1564604579, 0, NULL, NULL, 'Cheque', 1564172579, 1, '0'),
(408, 'nisi_401', NULL, 56, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 1000, 13, 0, 470, 1, 1563567779, 1565295779, 0, NULL, NULL, 'Card', 1563826979, 1, '0'),
(409, 'veniam_160', NULL, 56, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 100, 0, 17, 970, 0, 1563394979, 1564431779, 1, NULL, NULL, 'Card', 1564172579, 1, '0'),
(410, 'rerum_281', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 440, 43, 41, 270, 0, 1563308579, 1564431779, 1, NULL, NULL, 'Online', 1563740579, 1, '0'),
(411, 'doloremque_306', 'Delectus dolorum quo vel ut nemo repudiandae.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 270, 6, 27, 90, 0, 1563999779, 1565727779, 0, NULL, NULL, 'Cash', 1563913379, 0, '0'),
(412, 'quibusdam_750', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 80, 47, 0, 330, 1, 1563567779, 1565036579, 0, NULL, NULL, 'Cheque', 1563394979, 1, '0'),
(413, 'numquam_701', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 270, 36, 0, 440, 1, 1564086179, 1564258979, 0, NULL, NULL, 'Bank Deposit', 1564172579, 0, '0'),
(414, 'sed_324', NULL, 56, '[{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 80, 0, 9, 350, 1, 1563481379, 1564258979, 0, NULL, NULL, 'Card', 1563826979, 1, '0'),
(415, 'assumenda_598', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 320, 36, 17, 870, 0, 1564258979, 1565554979, 0, NULL, NULL, 'Cash', 1565122979, 1, '0'),
(416, 'officia_189', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 830, 40, 0, 710, 0, 1564172579, 1565641379, 0, NULL, NULL, 'Card', 1564777379, 0, '0'),
(417, 'maiores_898', 'Quisquam molestias facere explicabo dolorem nam et iste excepturi dolores repudiandae odit.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 180, 5, 18, 870, 0, 1563913379, 1565554979, 0, NULL, NULL, 'Card', 1565295779, 1, '0'),
(418, 'autem_134', 'Est nihil earum rem quos tempore velit.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 110, 37, 0, 680, 1, 1563481379, 1565382179, 0, NULL, NULL, 'Cheque', 1564777379, 0, '0'),
(419, 'in_770', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 210, 0, 45, 880, 0, 1564172579, 1565554979, 0, NULL, NULL, 'Card', 1565382179, 0, '0'),
(420, 'nihil_526', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 650, 0, 0, 60, 1, 1563308579, 1565036579, 0, NULL, NULL, 'Online', 1565727779, 0, '0'),
(421, 'asperiores_634', 'Eaque ut soluta laudantium labore architecto eaque.', 56, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 780, 18, 0, 480, 0, 1563308579, 1564258979, 1, NULL, NULL, 'Card', 1565295779, 1, '0'),
(422, 'et_694', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 930, 0, 16, 790, 1, 1563999779, 1564345379, 0, NULL, NULL, 'Online', 1565382179, 0, '0'),
(423, 'quia_637', 'Totam nulla voluptatem et ea laboriosam.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 840, 0, 0, 690, 1, 1564172579, 1564345379, 0, NULL, NULL, 'Cheque', 1564172579, 0, '0'),
(424, 'occaecati_688', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 840, 0, 0, 530, 1, 1563826979, 1565122979, 0, NULL, NULL, 'Card', 1564172579, 1, '0'),
(425, 'atque_400', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 860, 21, 13, 510, 0, 1563999779, 1564431779, 1, NULL, NULL, 'Card', 1564690979, 0, '0'),
(426, 'quod_377', 'Et perspiciatis natus dolorum voluptatem.', 56, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 500, 0, 38, 260, 0, 1563481379, 1565209379, 0, NULL, NULL, 'Card', 1564863779, 1, '0'),
(427, 'sequi_417', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 820, 45, 0, 70, 0, 1563394979, 1564345379, 1, NULL, NULL, 'Cheque', 1563222179, 1, '0'),
(428, 'voluptates_240', 'Culpa est voluptates est asperiores rerum et.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 420, 0, 0, 650, 1, 1563740579, 1564258979, 0, NULL, NULL, 'Online', 1565814179, 0, '0'),
(429, 'consequatur_311', 'Quisquam quaerat corrupti alias eum tempore numquam.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 660, 0, 0, 300, 1, 1564172579, 1565814179, 0, NULL, NULL, 'Cheque', 1563654179, 1, '0'),
(430, 'sunt_574', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 90, 40, 26, 670, 1, 1563826979, 1564431779, 0, NULL, NULL, 'Card', 1564777379, 1, '0'),
(431, 'nisi_773', 'Molestiae sunt in ipsam saepe voluptates qui omnis ipsam id.', 56, ']', 910, 0, 17, 290, 1, 1563740579, 1564690979, 0, NULL, NULL, 'Card', 1565727779, 1, '0'),
(432, 'quis_961', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 390, 0, 20, 950, 0, 1563481379, 1564690979, 0, NULL, NULL, 'Card', 1565209379, 1, '0'),
(433, 'est_968', 'Dicta architecto aspernatur voluptatum alias nam fugiat omnis et.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 710, 35, 0, 600, 1, 1564086179, 1564258979, 0, NULL, NULL, 'Cheque', 1565554979, 1, '0'),
(434, 'delectus_324', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 270, 37, 0, 140, 0, 1563394979, 1564950179, 0, NULL, NULL, 'Card', 1563394979, 0, '0'),
(435, 'minima_412', NULL, 56, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 910, 0, 0, 560, 1, 1563999779, 1564258979, 0, NULL, NULL, 'Cash', 1565554979, 0, '0'),
(436, 'odio_415', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"}]', 240, 0, 40, 280, 1, 1564258979, 1565641379, 0, NULL, NULL, 'Online', 1565554979, 1, '0'),
(437, 'maiores_499', 'Delectus laudantium aperiam dolor est cupiditate modi libero quibusdam.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 900, 0, 6, 980, 1, 1563567779, 1565209379, 0, NULL, NULL, 'Cheque', 1563222179, 0, '0'),
(438, 'qui_539', 'Odit ratione dolore inventore quia ut praesentium.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 750, 0, 49, 610, 1, 1564172580, 1565209380, 0, NULL, NULL, 'Cash', 1565209380, 0, '0'),
(439, 'rerum_440', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 370, 17, 41, 250, 1, 1563654180, 1565727780, 0, NULL, NULL, 'Card', 1564604580, 1, '0'),
(440, 'eos_916', 'Unde optio quia atque expedita amet quam qui corrupti.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 130, 50, 0, 330, 1, 1563826980, 1565122980, 0, NULL, NULL, 'Online', 1564690980, 1, '0'),
(441, 'delectus_258', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 400, 33, 17, 380, 0, 1563913380, 1564258980, 1, NULL, NULL, 'Bank Deposit', 1565382180, 0, '0'),
(442, 'quaerat_412', 'Tenetur quidem nobis sint ipsam ut dolores.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 90, 0, 0, 260, 0, 1563740580, 1565468580, 0, NULL, NULL, 'Bank Deposit', 1565295780, 0, '0'),
(443, 'tempore_128', 'Autem totam error dolorem et ex id omnis repellat ut.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 170, 0, 16, 810, 1, 1563826980, 1565727780, 0, NULL, NULL, 'Card', 1563999780, 1, '0'),
(444, 'nihil_827', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 520, 0, 39, 890, 0, 1563308580, 1564258980, 1, NULL, NULL, 'Cheque', 1563308580, 1, '0'),
(445, 'saepe_268', 'Sed est quasi aut omnis perspiciatis libero itaque magnam molestiae et.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 60, 10, 0, 300, 0, 1563481380, 1564690980, 0, NULL, NULL, 'Cheque', 1563654180, 0, '0'),
(446, 'doloremque_726', NULL, 56, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 550, 0, 0, 960, 1, 1563308580, 1564345380, 0, NULL, NULL, 'Cheque', 1565468580, 1, '0'),
(447, 'cum_677', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 690, 0, 0, 920, 1, 1563913380, 1564604580, 0, NULL, NULL, 'Cash', 1565382180, 0, '0'),
(448, 'sunt_414', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 440, 0, 15, 870, 0, 1563308580, 1564258980, 1, NULL, NULL, 'Bank Deposit', 1563999780, 1, '0'),
(449, 'dolore_811', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 880, 0, 0, 970, 1, 1563654180, 1564431780, 0, NULL, NULL, 'Cheque', 1563999780, 0, '0'),
(450, 'vero_971', NULL, 56, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 270, 39, 0, 220, 1, 1563999780, 1564345380, 0, NULL, NULL, 'Online', 1563222180, 1, '0'),
(451, 'magni_789', 'Et exercitationem beatae qui quo occaecati sunt sed.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 970, 46, 38, 410, 1, 1563222180, 1565814180, 0, NULL, NULL, 'Bank Deposit', 1565727780, 1, '0'),
(452, 'ea_476', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 310, 22, 12, 640, 0, 1563826980, 1564777380, 0, NULL, NULL, 'Cash', 1565468580, 1, '0'),
(453, 'ipsam_472', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 980, 0, 0, 740, 1, 1563826980, 1564258980, 0, NULL, NULL, 'Card', 1565554980, 1, '0'),
(454, 'iure_864', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 720, 19, 48, 250, 1, 1563394980, 1564431780, 0, NULL, NULL, 'Bank Deposit', 1563999780, 1, '0'),
(455, 'maiores_652', NULL, 56, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 950, 0, 50, 270, 0, 1563308580, 1564950180, 0, NULL, NULL, 'Cash', 1565641380, 1, '0'),
(456, 'in_414', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 550, 46, 0, 780, 1, 1563394980, 1564258980, 0, NULL, NULL, 'Bank Deposit', 1565641380, 0, '0'),
(457, 'non_758', NULL, 56, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 760, 0, 30, 680, 0, 1564086180, 1565814180, 0, NULL, NULL, 'Card', 1563999780, 0, '0'),
(458, 'dolores_562', 'Sapiente debitis autem ullam iure eos voluptatem et molestiae ea.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 840, 25, 19, 900, 0, 1563567780, 1565295780, 0, NULL, NULL, 'Cheque', 1563567780, 0, '0'),
(459, 'aut_185', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 850, 0, 35, 900, 0, 1564172580, 1564431780, 1, NULL, NULL, 'Card', 1563394980, 1, '0'),
(460, 'voluptates_623', 'Accusamus sed dolorum aliquam et et dolore molestias fugit.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 240, 0, 1, 190, 1, 1564258980, 1565727780, 0, NULL, NULL, 'Cheque', 1565122980, 0, '0'),
(461, 'voluptatem_830', 'Quia soluta dolor illo et amet.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 770, 0, 34, 380, 0, 1563394980, 1565295780, 0, NULL, NULL, 'Cheque', 1565641380, 0, '0'),
(462, 'sequi_597', 'Perferendis aperiam eum et eius voluptatum nihil dolorum quidem.', 56, ']', 580, 7, 0, 970, 0, 1563394980, 1564258980, 1, NULL, NULL, 'Online', 1564777380, 0, '0'),
(463, 'odit_939', 'Eum dolorum adipisci quos est aut expedita quo officiis.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 790, 39, 0, 380, 1, 1563308580, 1564345380, 0, NULL, NULL, 'Cheque', 1563826980, 1, '0'),
(464, 'dolores_851', 'Impedit nihil sint necessitatibus hic omnis exercitationem provident.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 130, 37, 0, 420, 1, 1564086180, 1565727780, 0, NULL, NULL, 'Card', 1563308580, 1, '0'),
(465, 'quas_385', 'Et iusto ab dicta quo voluptatem nobis nemo ipsa quia.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"}]', 450, 0, 0, 450, 0, 1564172580, 1564345380, 1, NULL, NULL, 'Bank Deposit', 1565295780, 1, '0'),
(466, 'odio_939', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 540, 41, 0, 720, 0, 1564086180, 1564258980, 1, NULL, NULL, 'Cheque', 1564604580, 1, '0'),
(467, 'neque_654', 'Quasi sed sint est quia similique ut id quas repudiandae.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 650, 0, 32, 770, 1, 1564172580, 1565122980, 0, NULL, NULL, 'Cheque', 1564086180, 1, '0'),
(468, 'iste_310', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 410, 0, 17, 900, 1, 1563394980, 1565209380, 0, NULL, NULL, 'Bank Deposit', 1565295780, 0, '0'),
(469, 'optio_625', 'Et temporibus ut ut quibusdam laborum consequatur odio exercitationem.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 560, 32, 41, 550, 1, 1564086180, 1564345380, 0, NULL, NULL, 'Card', 1563913380, 1, '0'),
(470, 'inventore_921', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 760, 0, 16, 470, 0, 1563740580, 1564345380, 1, NULL, NULL, 'Card', 1563826980, 0, '0'),
(471, 'quisquam_470', 'Perspiciatis dolores dolores fugit voluptas error ullam reiciendis esse commodi.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 400, 0, 0, 790, 1, 1563913380, 1564258980, 0, NULL, NULL, 'Cheque', 1565382180, 1, '0'),
(472, 'sint_744', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 900, 15, 0, 630, 0, 1563567780, 1564604580, 0, NULL, NULL, 'Card', 1564258980, 1, '0'),
(473, 'magnam_880', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 420, 0, 0, 130, 0, 1563481380, 1564777380, 0, NULL, NULL, 'Card', 1564345380, 0, '0'),
(474, 'libero_949', 'Quas dolorum labore et non voluptates quod architecto enim.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"}]', 660, 11, 25, 1000, 1, 1563654180, 1564345380, 0, NULL, NULL, 'Bank Deposit', 1565209380, 1, '0'),
(475, 'ut_808', 'Occaecati ipsum sed hic reprehenderit eos qui eum libero aliquam voluptatem.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 270, 38, 1, 640, 0, 1563913380, 1564950180, 0, NULL, NULL, 'Card', 1564345380, 0, '0'),
(476, 'omnis_628', 'Beatae dolores non sed molestias repudiandae.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 720, 0, 46, 840, 0, 1563654180, 1564863780, 0, NULL, NULL, 'Online', 1564863780, 1, '0'),
(477, 'dolores_131', 'Voluptas qui aut ea rem sint quia ut dolores deserunt.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 290, 0, 32, 870, 1, 1564172580, 1564431780, 0, NULL, NULL, 'Online', 1563999780, 0, '0'),
(478, 'molestiae_374', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"}]', 500, 37, 49, 640, 1, 1564258980, 1565641380, 0, NULL, NULL, 'Card', 1564345380, 1, '0'),
(479, 'est_589', NULL, 56, '[{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 200, 36, 0, 960, 1, 1563222180, 1565727780, 0, NULL, NULL, 'Cash', 1565727780, 1, '0'),
(480, 'magnam_298', 'Quia inventore ut consequatur voluptates quos.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 510, 8, 0, 400, 0, 1563394980, 1564431780, 1, NULL, NULL, 'Cash', 1565122980, 0, '0'),
(481, 'iusto_764', 'Illo commodi soluta aut libero aut nam ipsum omnis beatae voluptates.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 90, 0, 49, 560, 1, 1563740580, 1565727780, 0, NULL, NULL, 'Online', 1565295780, 0, '0'),
(482, 'a_935', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 150, 49, 17, 300, 0, 1563913380, 1564690980, 0, NULL, NULL, 'Cash', 1564604580, 1, '0'),
(483, 'rerum_535', 'Consequatur tempora debitis consequuntur libero harum nesciunt omnis blanditiis dolores.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 440, 22, 28, 90, 1, 1564086180, 1564345380, 0, NULL, NULL, 'Cash', 1563999780, 0, '0'),
(484, 'eius_702', 'Ut aut nisi suscipit accusantium fugiat quasi vitae quia sed officia.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 450, 45, 0, 190, 0, 1563308580, 1564258980, 1, NULL, NULL, 'Bank Deposit', 1565295780, 1, '0'),
(485, 'ipsa_607', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 80, 49, 4, 720, 1, 1563308580, 1565382180, 0, NULL, NULL, 'Bank Deposit', 1564431780, 1, '0'),
(486, 'eaque_239', 'Aspernatur id excepturi magnam harum ratione expedita earum accusantium.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 340, 0, 0, 50, 0, 1563999780, 1565122980, 0, NULL, NULL, 'Cash', 1563826980, 1, '0'),
(487, 'provident_356', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 220, 0, 0, 90, 0, 1563826980, 1564345380, 1, NULL, NULL, 'Cash', 1565382180, 1, '0'),
(488, 'atque_161', 'Ut id mollitia quas inventore laudantium minus nihil suscipit.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 900, 0, 0, 980, 0, 1563654181, 1564345381, 1, NULL, NULL, 'Cash', 1565209381, 1, '0'),
(489, 'facere_896', 'Dolores tempora aperiam enim distinctio rerum at.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 600, 14, 44, 490, 0, 1564172581, 1565295781, 0, NULL, NULL, 'Bank Deposit', 1563222181, 1, '0'),
(490, 'consequatur_376', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 900, 22, 0, 850, 0, 1563567781, 1565382181, 0, NULL, NULL, 'Cash', 1564258981, 1, '0'),
(491, 'quasi_860', NULL, 56, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 390, 0, 36, 740, 0, 1563308581, 1565727781, 0, NULL, NULL, 'Bank Deposit', 1564086181, 1, '0'),
(492, 'molestiae_910', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 860, 0, 0, 250, 1, 1563826981, 1564431781, 0, NULL, NULL, 'Card', 1563394981, 0, '0'),
(493, 'molestiae_237', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 770, 31, 0, 360, 1, 1564172581, 1564258981, 0, NULL, NULL, 'Online', 1563394981, 1, '0'),
(494, 'non_872', 'Quam id eos dolor omnis iste enim voluptate.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 760, 0, 0, 150, 1, 1563394981, 1564258981, 0, NULL, NULL, 'Card', 1563654181, 1, '0'),
(495, 'sapiente_134', 'Eligendi molestias repudiandae sapiente eligendi accusantium.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 500, 14, 0, 830, 0, 1563308581, 1565554981, 0, NULL, NULL, 'Online', 1565209381, 0, '0'),
(496, 'debitis_190', 'Cumque dolorem laudantium eaque quae aliquam.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 70, 0, 0, 390, 0, 1563394981, 1564950181, 0, NULL, NULL, 'Bank Deposit', 1563999781, 1, '0'),
(497, 'ipsa_687', 'Porro fugiat asperiores est quibusdam exercitationem reprehenderit.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 820, 0, 44, 880, 0, 1564258981, 1564345381, 1, NULL, NULL, 'Online', 1565209381, 0, '0'),
(498, 'veritatis_852', 'Nobis impedit qui provident consequatur et qui.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 930, 37, 49, 670, 0, 1563654181, 1564777381, 0, NULL, NULL, 'Cheque', 1565727781, 1, '0'),
(499, 'aut_929', NULL, 56, ']', 830, 50, 18, 540, 1, 1563481381, 1564431781, 0, NULL, NULL, 'Card', 1565814181, 0, '0'),
(500, 'distinctio_496', 'Quidem sit impedit ut repudiandae rerum iste unde neque inventore eligendi.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 460, 7, 6, 780, 0, 1563913381, 1564431781, 1, NULL, NULL, 'Cheque', 1565468581, 0, '0'),
(501, 'aut_694', NULL, 56, '[{\"title\":\"Building fee\",\"amount\":\"800\"}]', 710, 0, 0, 700, 1, 1564172581, 1565382181, 0, NULL, NULL, 'Cash', 1565727781, 1, '0'),
(502, 'itaque_363', 'Vitae ut inventore cupiditate recusandae sed fugit id.', 56, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 330, 0, 17, 580, 0, 1563999781, 1565468581, 0, NULL, NULL, 'Online', 1564172581, 1, '0'),
(503, 'autem_792', 'Quia doloribus quia iusto consectetur iusto et omnis deserunt molestias sit ut.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"}]', 660, 9, 27, 650, 0, 1563999781, 1565122981, 0, NULL, NULL, 'Card', 1564690981, 1, '0'),
(504, 'illum_381', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 720, 0, 9, 880, 0, 1563913381, 1565554981, 0, NULL, NULL, 'Cheque', 1563654181, 0, '0'),
(505, 'voluptatem_161', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 100, 0, 48, 220, 1, 1563222181, 1565727781, 0, NULL, NULL, 'Cash', 1564950181, 1, '0'),
(506, 'accusamus_994', 'Autem dignissimos officiis sint eveniet tenetur suscipit.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 750, 0, 0, 390, 1, 1564086181, 1564258981, 0, NULL, NULL, 'Cash', 1563222181, 1, '0'),
(507, 'rerum_809', 'Praesentium consequuntur dolorem tenetur accusantium quis dolore laudantium voluptatem non.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"}]', 810, 0, 0, 470, 1, 1564172581, 1564258981, 0, NULL, NULL, 'Bank Deposit', 1565641381, 0, '0'),
(508, 'eaque_744', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 110, 0, 11, 920, 1, 1563999781, 1564258981, 0, NULL, NULL, 'Cash', 1565468581, 1, '0'),
(509, 'optio_828', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 540, 7, 0, 850, 1, 1563222181, 1565036581, 0, NULL, NULL, 'Cash', 1565554981, 0, '0'),
(510, 'nulla_662', NULL, 56, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 890, 5, 0, 810, 1, 1563394981, 1564258981, 0, NULL, NULL, 'Card', 1564690981, 0, '0'),
(511, 'sed_712', 'Quam nulla perspiciatis labore magnam aut fugiat.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 220, 0, 35, 880, 0, 1564258981, 1564258981, 1, NULL, NULL, 'Cash', 1564604581, 1, '0'),
(512, 'et_563', NULL, 56, '[{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 90, 39, 23, 130, 1, 1564258981, 1564604581, 0, NULL, NULL, 'Cash', 1565295781, 0, '0'),
(513, 'nihil_430', 'Sint similique nulla voluptatem autem modi.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 230, 0, 0, 720, 1, 1563999781, 1564431781, 0, NULL, NULL, 'Cheque', 1565382181, 0, '0'),
(514, 'magnam_937', 'Maxime aliquid distinctio occaecati qui libero quia ad similique dicta sed.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 360, 8, 21, 380, 1, 1563567781, 1565382181, 0, NULL, NULL, 'Online', 1563999781, 0, '0'),
(515, 'eius_648', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 50, 10, 28, 280, 1, 1563654181, 1564345381, 0, NULL, NULL, 'Bank Deposit', 1565727781, 0, '0'),
(516, 'amet_533', 'Praesentium quas explicabo a repellat sunt rerum eius est et.', 56, '[{\"title\":\"Building fee\",\"amount\":\"800\"}]', 690, 26, 22, 510, 1, 1563222181, 1565554981, 0, NULL, NULL, 'Online', 1563222181, 1, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(517, 'commodi_959', 'Voluptatem veritatis et voluptatem similique sunt soluta labore ex.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 570, 0, 0, 850, 0, 1563394981, 1565209381, 0, NULL, NULL, 'Online', 1564863781, 1, '0'),
(518, 'explicabo_375', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 460, 18, 0, 940, 1, 1563394981, 1564345381, 0, NULL, NULL, 'Cheque', 1563308581, 0, '0'),
(519, 'sint_102', 'Eius doloremque rerum consectetur est sint quos maiores voluptatem.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 500, 0, 0, 230, 0, 1563913381, 1565727781, 0, NULL, NULL, 'Cheque', 1564431781, 0, '0'),
(520, 'hic_956', NULL, 56, '[{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 920, 41, 31, 440, 1, 1564258981, 1564258981, 0, NULL, NULL, 'Card', 1563222181, 0, '0'),
(521, 'officia_305', NULL, 56, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 130, 0, 25, 210, 1, 1564258981, 1565814181, 0, NULL, NULL, 'Bank Deposit', 1564086181, 1, '0'),
(522, 'saepe_564', 'Tempore fuga laborum nihil sint recusandae beatae aut illo deleniti vitae.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 640, 32, 0, 500, 1, 1563826981, 1565295781, 0, NULL, NULL, 'Online', 1564431781, 0, '0'),
(523, 'in_415', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 400, 0, 8, 390, 0, 1563308581, 1564604581, 0, NULL, NULL, 'Cash', 1565036581, 0, '0'),
(524, 'molestias_161', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 690, 0, 0, 510, 1, 1563826981, 1564345381, 0, NULL, NULL, 'Cash', 1564258981, 1, '0'),
(525, 'mollitia_227', 'Itaque quos id omnis modi accusantium iure ex voluptatem consequatur consequuntur aut.', 56, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 950, 0, 0, 850, 1, 1564258981, 1564345381, 0, NULL, NULL, 'Cheque', 1565209381, 1, '0'),
(526, 'voluptatibus_310', 'Placeat soluta et mollitia rerum ea quo.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 620, 39, 0, 70, 0, 1563481381, 1564777381, 0, NULL, NULL, 'Bank Deposit', 1563740581, 0, '0'),
(527, 'ea_220', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 1000, 0, 50, 890, 0, 1564172581, 1564863781, 0, NULL, NULL, 'Card', 1563654181, 1, '0'),
(528, 'quisquam_555', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 950, 0, 0, 260, 1, 1563999781, 1564431781, 0, NULL, NULL, 'Online', 1565468581, 0, '0'),
(529, 'delectus_674', 'Aut officia dolore corrupti rerum ipsa dolorem qui quasi et provident blanditiis.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 570, 0, 18, 660, 0, 1563999781, 1564258981, 1, NULL, NULL, 'Bank Deposit', 1564690981, 1, '0'),
(530, 'rerum_783', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 180, 41, 0, 750, 1, 1563999781, 1564431781, 0, NULL, NULL, 'Bank Deposit', 1565641381, 0, '0'),
(531, 'quia_546', 'Eius nesciunt ex quia error quia.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 440, 43, 0, 450, 0, 1563913381, 1565814181, 0, NULL, NULL, 'Card', 1564690981, 0, '0'),
(532, 'quaerat_422', NULL, 56, '[{\"title\":\"Library fee\",\"amount\":\"600\"}]', 370, 0, 20, 920, 1, 1563740581, 1564345381, 0, NULL, NULL, 'Cash', 1563567781, 0, '0'),
(533, 'ratione_415', 'Alias perspiciatis porro veniam dolores ut dolor et corporis blanditiis qui.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 740, 0, 0, 440, 0, 1563394981, 1565122981, 0, NULL, NULL, 'Online', 1563654181, 1, '0'),
(534, 'officia_976', 'Nihil deserunt nihil quo qui et hic nihil est ut architecto.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 880, 0, 0, 150, 0, 1563826981, 1564345381, 1, NULL, NULL, 'Cheque', 1565122981, 1, '0'),
(535, 'rerum_523', 'Quia qui sint a sit consequatur ut rerum praesentium aperiam cupiditate.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 360, 39, 4, 340, 0, 1563826982, 1564431782, 1, NULL, NULL, 'Card', 1564863782, 1, '0'),
(536, 'voluptatibus_701', 'Aliquam consequatur ut ipsum est sed aperiam rerum laboriosam possimus molestiae.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 50, 0, 48, 320, 0, 1563999782, 1564604582, 0, NULL, NULL, 'Card', 1565382182, 1, '0'),
(537, 'velit_518', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 620, 41, 0, 690, 0, 1563999782, 1564431782, 1, NULL, NULL, 'Bank Deposit', 1565209382, 1, '0'),
(538, 'aperiam_596', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 690, 0, 29, 770, 1, 1563826982, 1564431782, 0, NULL, NULL, 'Bank Deposit', 1565209382, 0, '0'),
(539, 'minus_493', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 180, 0, 44, 980, 1, 1564086182, 1564345382, 0, NULL, NULL, 'Bank Deposit', 1565727782, 1, '0'),
(540, 'ea_584', 'Culpa alias distinctio blanditiis nisi.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 580, 46, 0, 300, 0, 1563913382, 1564431782, 1, NULL, NULL, 'Cash', 1565727782, 1, '0'),
(541, 'libero_563', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 560, 4, 0, 880, 1, 1563913382, 1565641382, 0, NULL, NULL, 'Cash', 1564258982, 1, '0'),
(542, 'sed_786', 'Fugiat qui qui facere atque voluptatem accusantium laudantium dolorum.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 550, 47, 12, 550, 0, 1564086182, 1564258982, 1, NULL, NULL, 'Bank Deposit', 1565036582, 1, '0'),
(543, 'enim_589', NULL, 56, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 100, 0, 17, 330, 1, 1563913382, 1565209382, 0, NULL, NULL, 'Bank Deposit', 1565468582, 1, '0'),
(544, 'vero_598', 'Velit voluptatem sapiente quos tempora ea ut.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 880, 0, 0, 570, 1, 1563567782, 1564431782, 0, NULL, NULL, 'Cash', 1564604582, 0, '0'),
(545, 'sit_639', 'Quasi quia ullam aut exercitationem iste facere qui temporibus saepe est.', 56, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 390, 0, 0, 920, 0, 1563913382, 1564777382, 0, NULL, NULL, 'Bank Deposit', 1565382182, 0, '0'),
(546, 'aliquid_152', NULL, 56, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 750, 45, 23, 930, 1, 1563222182, 1564345382, 0, NULL, NULL, 'Cash', 1564950182, 0, '0'),
(547, 'et_713', 'Consectetur voluptatem vero minima omnis nihil reprehenderit repellat provident quo.', 56, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 400, 14, 7, 860, 1, 1563826982, 1565641382, 0, NULL, NULL, 'Bank Deposit', 1565727782, 1, '0'),
(548, 'atque_229', 'Labore iste praesentium necessitatibus delectus odit esse earum adipisci.', 56, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 410, 27, 50, 600, 1, 1563308582, 1564431782, 0, NULL, NULL, 'Cash', 1564431782, 1, '0'),
(549, 'non_126', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 480, 0, 8, 170, 1, 1563481382, 1565554982, 0, NULL, NULL, 'Cheque', 1564086182, 1, '0'),
(550, 'voluptas_352', NULL, 56, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 320, 0, 0, 520, 1, 1563308582, 1564431782, 0, NULL, NULL, 'Online', 1563567782, 1, '0');

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
(1, 'Magnam quo ex.', '30400', 'supton@gmail.com', 'expedita', 'provident', '1564499804', 'et', '15 minutes', 'Sint molestiae molestias explicabo quia repudiandae ab optio voluptas et quis.'),
(2, 'Nesciunt enim.', '87991', 'martine.tremblay@hotmail.com', 'quaerat', 'qui', '1564499804', 'laudantium', '16 minutes', 'Vel repudiandae qui aperiam quae et.'),
(3, 'Repellendus aut est similique.', '39765', 'mgreenholt@hotmail.com', 'ipsam', 'harum', '1564499804', 'porro', '12 minutes', 'Eaque est voluptate aliquid est quis sequi nobis.'),
(4, 'Rerum a quidem et.', '98092', 'ollie.padberg@yahoo.com', 'minima', 'est', '1564499804', 'quidem', '24 minutes', 'Harum sed dicta at asperiores omnis.'),
(5, 'Dolorem voluptas aliquid eaque.', '64995', 'dayton.lynch@veum.biz', 'inventore', 'quibusdam', '1564499804', 'nam', '29 minutes', 'Omnis sint voluptas eius placeat sunt sunt vel.'),
(6, 'Nihil molestiae qui harum sit nisi.', '44951', 'carroll.sydnee@yahoo.com', 'id', 'natus', '1564499804', 'sit', '10 minutes', 'Sunt eius non excepturi nobis vero repudiandae.'),
(7, 'Natus qui ut.', '92300', 'otromp@hotmail.com', 'placeat', 'et', '1564499804', 'rerum', '11 minutes', 'Reiciendis exercitationem quibusdam tenetur deleniti.'),
(8, 'Ut ducimus fuga cupiditate.', '79748', 'lueilwitz.everette@gmail.com', 'incidunt', 'quia', '1564499804', 'error', '30 minutes', 'Iusto officiis voluptatem libero fugiat molestias.'),
(9, 'Sapiente omnis.', '72098', 'garett76@lemke.org', 'culpa', 'voluptates', '1564499804', 'ut', '24 minutes', 'Quis omnis tempora consequuntur tempora quis occaecati recusandae eos excepturi nostrum.'),
(10, 'Iure quae.', '88974', 'felton14@hotmail.com', 'quisquam', 'amet', '1564499804', 'cum', '7 minutes', 'Dolorem consequuntur aut facilis odit unde rerum et.'),
(11, 'Tempora autem voluptate aut minus.', '70386', 'francisco.morar@yahoo.com', 'sapiente', 'quod', '1564499804', 'delectus', '24 minutes', 'Cum quidem quaerat et perferendis.'),
(12, 'Dolores quo dolor in.', '89271', 'cedrick22@yahoo.com', 'enim', 'aut', '1564499804', 'animi', '12 minutes', 'Voluptatem veritatis qui ratione et suscipit soluta sed autem.'),
(13, 'Magni qui quod.', '59299', 'imogene.jast@baumbach.org', 'minima', 'est', '1564499804', 'ad', '15 minutes', 'Sequi nesciunt quia unde quas dolor ut quo.'),
(14, 'Vel qui.', '70393', 'xharber@yahoo.com', 'atque', 'quae', '1564499804', 'necessitatibus', '23 minutes', 'Modi nam sit rerum pariatur id deleniti fugit qui quisquam.'),
(15, 'Error magni nostrum.', '71417', 'grimes.aiden@yahoo.com', 'at', 'possimus', '1564499804', 'vero', '17 minutes', 'Sed cupiditate rerum sit amet voluptatem in et.'),
(16, 'Amet aut.', '23164', 'hills.wendy@considine.info', 'enim', 'harum', '1564499804', 'nesciunt', '19 minutes', 'Minus voluptatem numquam architecto quisquam enim est.'),
(17, 'Nemo et.', '63993', 'pouros.garland@yahoo.com', 'quo', 'et', '1564499804', 'excepturi', '22 minutes', 'Molestias enim tempore sunt odio fuga laborum earum non laboriosam dolores.'),
(18, 'Eum id laboriosam rerum hic.', '95996', 'marisol82@eichmann.com', 'qui', 'veniam', '1564499804', 'officiis', '2 minutes', 'Quisquam soluta dolores voluptas doloribus et quis incidunt.'),
(19, 'Enim sunt occaecati iste illum ex.', '83022', 'joel35@yahoo.com', 'soluta', 'possimus', '1564499804', 'et', '3 minutes', 'Non velit optio laborum sapiente sequi quia qui autem atque cumque itaque ut.'),
(20, 'Quod quod quae qui et fugiat.', '60524', 'geovanny.waters@jaskolski.org', 'consequatur', 'id', '1564499804', 'repellendus', '8 minutes', 'Quas aspernatur facere optio hic quo facere.'),
(21, 'Consequuntur et qui perferendis.', '74295', 'qbruen@hayes.biz', 'laudantium', 'ipsa', '1564499804', 'totam', '24 minutes', 'In quis minima reiciendis et.'),
(22, 'Aspernatur aut.', '16121', 'kevin19@gmail.com', 'sit', 'aut', '1564499804', 'sed', '3 minutes', 'Harum molestiae nemo incidunt sit odio sunt maxime quos.'),
(23, 'Officia est quibusdam.', '78136', 'hazle10@hotmail.com', 'delectus', 'fuga', '1564499804', 'maiores', '4 minutes', 'Voluptatibus dolores blanditiis soluta corporis corrupti quo iusto deleniti impedit asperiores.'),
(24, 'Fuga et ipsum quo voluptatem.', '90020', 'jarret.willms@gmail.com', 'voluptas', 'et', '1564499804', 'voluptatem', '6 minutes', 'Non error dolores dolore consequatur voluptatem est quasi nobis magni et.'),
(25, 'Enim facilis.', '85576', 'wintheiser.roslyn@yahoo.com', 'quis', 'dolorem', '1564499804', 'ut', '29 minutes', 'Aut qui sed in et veritatis distinctio ipsa sapiente quo.'),
(26, 'Doloremque facere animi.', '90551', 'arch.wolff@volkman.com', 'corporis', 'vel', '1564499804', 'autem', '10 minutes', 'Iure excepturi aut quisquam et perferendis.'),
(27, 'Voluptas aut enim sed cupiditate et.', '47674', 'jcummings@kling.com', 'qui', 'iusto', '1564499804', 'molestias', '3 minutes', 'Quasi nulla suscipit ullam molestiae quaerat est debitis sequi.'),
(28, 'Et dolor molestiae rem.', '69826', 'hmonahan@mraz.com', 'rerum', 'minima', '1564499804', 'atque', '22 minutes', 'Eius rem dolorem dolor nesciunt molestias doloremque dicta doloribus dolores quia minima.'),
(29, 'Et et minus.', '37877', 'tdubuque@yahoo.com', 'eos', 'id', '1564499804', 'qui', '10 minutes', 'Nisi ut veritatis ut est ab quae voluptatem sunt ducimus nam in.'),
(30, 'Rerum iure rerum.', '49541', 'hansen.oscar@erdman.com', 'assumenda', 'cumque', '1564499804', 'sunt', '12 minutes', 'Qui fuga ab quis odio.'),
(31, 'Quia repudiandae.', '91807', 'ayden74@lindgren.info', 'et', 'reiciendis', '1564499804', 'nesciunt', '2 minutes', 'Qui qui fugiat vel officiis quis pariatur.'),
(32, 'Consequuntur non soluta.', '93388', 'sjacobi@borer.com', 'sequi', 'non', '1564499804', 'voluptatem', '13 minutes', 'Cumque quibusdam asperiores temporibus dicta.'),
(33, 'Sint expedita numquam.', '43517', 'walker.raina@yahoo.com', 'expedita', 'nulla', '1564499804', 'voluptatibus', '21 minutes', 'Omnis officiis tempore dolores incidunt rerum quaerat officia iure sed ipsum.'),
(34, 'Sint iure enim deserunt dolorem.', '84709', 'fdavis@walter.info', 'nobis', 'deleniti', '1564499804', 'enim', '23 minutes', 'Nostrum eos deleniti distinctio debitis libero eos.'),
(35, 'Et laboriosam minus et iure veritatis.', '23519', 'hprice@yahoo.com', 'ut', 'maiores', '1564499804', 'adipisci', '11 minutes', 'Hic deserunt odio repellendus corporis natus fugiat.'),
(36, 'Suscipit pariatur.', '70651', 'schamberger.liliana@trantow.com', 'a', 'similique', '1564499804', 'nobis', '12 minutes', 'Accusamus assumenda rem qui nihil maxime voluptates velit quidem.'),
(37, 'Ab ex perferendis.', '45863', 'anya.oconner@yahoo.com', 'non', 'voluptatibus', '1564499804', 'voluptatem', '1 minutes', 'Dolore aspernatur qui quia incidunt quo vitae et necessitatibus distinctio.'),
(38, 'Velit fuga.', '40564', 'ylemke@miller.info', 'nemo', 'vitae', '1564499804', 'est', '29 minutes', 'Animi amet at perspiciatis fuga eos quis.'),
(39, 'Molestiae omnis nulla laudantium.', '66239', 'schumm.judd@yahoo.com', 'qui', 'consequuntur', '1564499804', 'ex', '4 minutes', 'Distinctio in consequatur numquam incidunt sit aut omnis tempore.'),
(40, 'Aut quo deleniti sunt.', '72121', 'shyanne.wuckert@gmail.com', 'ullam', 'qui', '1564499804', 'fuga', '18 minutes', 'Nihil consequuntur quidem dolore ut quia ea vero modi perspiciatis.'),
(41, 'Deserunt aut non qui.', '58700', 'will.malcolm@hotmail.com', 'sit', 'amet', '1564499804', 'alias', '13 minutes', 'Odit earum vel voluptatem sint a eum.'),
(42, 'Excepturi possimus.', '79785', 'wuckert.corrine@heathcote.com', 'repellat', 'nesciunt', '1564499804', 'quod', '30 minutes', 'Dolor voluptatem quia consequatur exercitationem consequatur et corrupti et veritatis.'),
(43, 'Voluptas fuga iure.', '12669', 'kpouros@hotmail.com', 'consequatur', 'consequatur', '1564499804', 'iste', '29 minutes', 'Est quis perspiciatis explicabo in vel illo.'),
(44, 'Nihil assumenda dolorum.', '15391', 'stella.bauch@gmail.com', 'et', 'ut', '1564499804', 'ipsam', '14 minutes', 'Nesciunt sit sed ut quisquam velit ut.'),
(45, 'Voluptate in vitae aut vero delectus.', '33018', 'caroline.williamson@ullrich.com', 'et', 'excepturi', '1564499804', 'autem', '18 minutes', 'Qui et et temporibus et quos iste iure non a.'),
(46, 'Rerum aut voluptatem.', '84922', 'dkuhic@herman.com', 'quaerat', 'magni', '1564499804', 'dolores', '15 minutes', 'Officia fugit quibusdam voluptatum excepturi dolores nihil molestiae dolore ab.'),
(47, 'Sed non aut assumenda.', '21700', 'hector.tremblay@hotmail.com', 'a', 'enim', '1564499804', 'ex', '29 minutes', 'Blanditiis optio et natus voluptas omnis laborum quis.'),
(48, 'Repellat blanditiis.', '30075', 'jaclyn50@yahoo.com', 'ullam', 'molestiae', '1564499804', 'fuga', '12 minutes', 'Dolorem occaecati voluptatem dolores vel et nulla sed.'),
(49, 'Neque perferendis dolor dignissimos ut.', '80806', 'hilario61@oconner.com', 'sunt', 'maxime', '1564499804', 'dolorum', '2 minutes', 'Aut a rem suscipit eos est eos minima explicabo.'),
(50, 'Facere debitis.', '40793', 'rigoberto98@bogisich.com', 'praesentium', 'nulla', '1564499804', 'architecto', '17 minutes', 'Quo corrupti ratione quo suscipit commodi nesciunt voluptatum molestias voluptatem.');

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
(1, 'sit', '27499', 'Modi consequatur.', 'Praesentium non.', 'Sunt nulla ea consequatur.', '1564499804', '', 'Nobis voluptatem ab enim deserunt cum saepe.'),
(2, 'atque', '32283', 'Dolor id laborum.', 'Est cupiditate.', 'Voluptas ut repellat nostrum cumque expedita aperiam.', '1564499804', '', 'Et similique itaque.'),
(3, 'neque', '25813', 'Minima.', 'Qui autem.', 'Et corrupti velit laboriosam.', '1564499804', '', 'A sapiente porro nulla.'),
(4, 'quia', '90874', 'Ut.', 'Reiciendis expedita.', 'Qui maiores eveniet laboriosam.', '1564499804', '', 'Voluptate quidem atque maiores nostrum.'),
(5, 'repellat', '52320', 'Sed.', 'Ex.', 'Similique qui rerum ab.', '1564499804', '', 'Ex alias dolor repellat.'),
(6, 'est', '16193', 'Assumenda omnis.', 'Qui est.', 'Sed fugit ipsam cupiditate necessitatibus ea non.', '1564499804', '', 'Quia reprehenderit ad.'),
(7, 'voluptas', '48696', 'Porro animi id.', 'Iste.', 'Voluptas ex totam et illo cupiditate esse.', '1564499804', '', 'Est distinctio voluptas itaque fugiat et eum.'),
(8, 'voluptatem', '57168', 'Velit.', 'Aut aliquam perspiciatis.', 'Sed qui quia impedit voluptas provident ipsum eum.', '1564499804', '', 'Iste consectetur officiis velit.'),
(9, 'qui', '49219', 'Cum ut.', 'Praesentium eius.', 'Impedit quae qui temporibus possimus id voluptas.', '1564499804', '', 'Vero quia voluptatem impedit sequi.'),
(10, 'dolor', '42733', 'Inventore in.', 'Esse reprehenderit quidem.', 'Assumenda vero illum.', '1564499804', '', 'Animi odio dolor voluptas dolorum.'),
(11, 'aspernatur', '46435', 'Minus.', 'Sit ut.', 'Est occaecati ad assumenda sed veniam quisquam voluptatibus ut.', '1564499804', '', 'Ut aut culpa facilis.'),
(12, 'aperiam', '23753', 'Explicabo ex.', 'Temporibus.', 'Aut vero animi natus accusantium.', '1564499804', '', 'Qui sit aliquam voluptas voluptatem eaque.'),
(13, 'accusantium', '22504', 'Accusantium vero.', 'Facere voluptatem.', 'Quos quis error earum non sunt voluptatem quasi.', '1564499804', '', 'Velit optio repellendus autem quo qui natus corporis veritatis.'),
(14, 'eum', '98393', 'Eligendi odio dolorem.', 'Sed enim sint.', 'Cupiditate quam.', '1564499804', '', 'Voluptates error odit sit et.'),
(15, 'blanditiis', '43211', 'Numquam et.', 'Sapiente ut.', 'Omnis et suscipit sed sunt natus.', '1564499804', '', 'Ut aperiam perferendis eos culpa beatae quo alias itaque.'),
(16, 'iure', '83653', 'Nobis enim numquam.', 'Architecto maiores.', 'Eaque quidem asperiores inventore.', '1564499804', '', 'Quibusdam provident velit quis aliquid et qui.'),
(17, 'aut', '25291', 'Ex est autem.', 'Occaecati sunt.', 'Facere quas quos occaecati nam et.', '1564499804', '', 'Enim unde dolor aut.'),
(18, 'et', '15661', 'Nulla iusto.', 'Et et.', 'Voluptatum dicta corporis eum nisi inventore.', '1564499804', '', 'Temporibus recusandae quibusdam et natus natus nihil eos quisquam.'),
(19, 'voluptatum', '12976', 'Cupiditate beatae.', 'Impedit quisquam.', 'Omnis eveniet explicabo voluptatem ea similique possimus.', '1564499804', '', 'Ea cupiditate maxime cum magnam molestiae.'),
(20, 'ut', '31862', 'Laudantium alias.', 'Nihil.', 'Sed consectetur officiis tempora vero.', '1564499804', '', 'Doloribus maiores omnis.'),
(21, 'provident', '72166', 'Tenetur quis.', 'Ipsum.', 'Cum sed molestiae vero repellendus laudantium molestiae saepe.', '1564499804', '', 'Ipsa minus quaerat.'),
(22, 'et', '49802', 'Voluptas.', 'Eius aperiam eos.', 'Et ipsum aliquam quam sunt.', '1564499804', '', 'Hic nemo laborum.'),
(23, 'sunt', '32625', 'Rem odit.', 'Accusamus.', 'Nisi voluptatem tempore dolorem.', '1564499804', '', 'Iure laboriosam velit.'),
(24, 'non', '78928', 'Maxime minus eaque.', 'Est aut atque.', 'Placeat delectus qui reiciendis provident molestiae.', '1564499804', '', 'Quia magni non esse eligendi vitae ullam.'),
(25, 'dicta', '76582', 'Blanditiis ratione modi.', 'Quia dignissimos.', 'Sed et blanditiis laboriosam rerum quae.', '1564499804', '', 'Cumque minima minima et fuga.'),
(26, 'omnis', '50711', 'Quasi ad.', 'Unde a facere.', 'Quis earum corporis.', '1564499804', '', 'Perferendis odit perferendis.'),
(27, 'qui', '29992', 'Quam rem et.', 'Molestias.', 'Deserunt provident laborum alias occaecati praesentium architecto.', '1564499804', '', 'Quisquam fugit ratione qui provident est.'),
(28, 'explicabo', '19571', 'Qui sint et.', 'Quo mollitia.', 'Asperiores quo deleniti optio perspiciatis.', '1564499804', '', 'Odit nulla quos est.'),
(29, 'ipsa', '32384', 'Suscipit ullam voluptate.', 'Nihil nam.', 'Repellat et fuga dolor sit.', '1564499804', '', 'Voluptas beatae deleniti.'),
(30, 'dicta', '27196', 'Laborum rerum nesciunt.', 'Est cumque.', 'Quam id doloremque soluta.', '1564499804', '', 'Cumque dicta maiores voluptas nihil.'),
(31, 'laborum', '23913', 'Dolorem.', 'Iusto.', 'Earum odit eligendi quidem quibusdam consequatur.', '1564499804', '', 'Necessitatibus reiciendis id nam ut.'),
(32, 'asperiores', '72218', 'Vitae aliquid.', 'Ut.', 'Qui sequi optio numquam ratione.', '1564499804', '', 'Voluptatem aperiam vitae ad.'),
(33, 'velit', '54421', 'Hic tenetur.', 'Aut.', 'Dolorum rerum perspiciatis.', '1564499804', '', 'Enim blanditiis et similique quidem.'),
(34, 'dolorum', '57805', 'Et qui et.', 'Officia.', 'Ullam consequatur modi deleniti aliquam praesentium.', '1564499804', '', 'Officiis aut autem quis sequi occaecati.'),
(35, 'blanditiis', '62553', 'Itaque et.', 'Maxime et.', 'Totam debitis minima est voluptatem omnis nostrum.', '1564499804', '', 'Laboriosam quia nisi repellendus.'),
(36, 'dolores', '90572', 'Voluptatum.', 'Quia voluptates.', 'Cumque accusantium maxime necessitatibus corporis quia.', '1564499804', '', 'Dolore provident aperiam commodi.'),
(37, 'cupiditate', '20060', 'Odio.', 'Exercitationem.', 'Quo ut magni tenetur vel.', '1564499804', '', 'Mollitia eos dolor.'),
(38, 'sint', '42616', 'Consequatur.', 'Quia nostrum.', 'Quis deleniti in.', '1564499804', '', 'Impedit laborum optio quo repudiandae modi.'),
(39, 'ut', '13868', 'Enim non.', 'Aut nemo vitae.', 'Non eos qui.', '1564499804', '', 'Error quis accusamus ut et.'),
(40, 'assumenda', '82395', 'Corporis dolorem ea.', 'Voluptate.', 'Dolorem eveniet consequatur culpa porro neque.', '1564499804', '', 'Et eos sit sit voluptas deserunt.'),
(41, 'itaque', '47703', 'Eius.', 'Ut.', 'Dolore et illo et explicabo.', '1564499804', '', 'Nihil qui neque labore eum.'),
(42, 'corporis', '27051', 'Cupiditate accusamus.', 'Vel incidunt.', 'Et eum nam.', '1564499804', '', 'Aut hic optio eveniet similique et.'),
(43, 'quod', '69039', 'Nisi.', 'Laboriosam dolores vel.', 'Impedit nesciunt consequatur quos ea.', '1564499804', '', 'Quaerat aut velit accusamus animi est.'),
(44, 'eius', '23741', 'Voluptatem nulla.', 'Ratione qui.', 'Animi laudantium aperiam.', '1564499804', '', 'Sed vel quaerat distinctio nemo et.'),
(45, 'culpa', '26996', 'Ipsum ut.', 'Nemo itaque.', 'Autem explicabo omnis ut dolores quod.', '1564499804', '', 'Doloremque recusandae quis corporis.'),
(46, 'occaecati', '90596', 'Perferendis.', 'Molestias et.', 'Laboriosam sed molestias ullam non deleniti.', '1564499804', '', 'Quia accusamus dolores expedita sunt.'),
(47, 'laudantium', '84926', 'Sit.', 'Quis fugit minus.', 'Animi dolorem consequuntur et.', '1564499804', '', 'Harum reprehenderit possimus molestiae.'),
(48, 'corporis', '71338', 'Ut.', 'Ut vitae modi.', 'Recusandae temporibus ut voluptatem amet quia mollitia harum.', '1564499804', '', 'Animi architecto dolor perferendis repellendus voluptas.'),
(49, 'suscipit', '48449', 'Veritatis.', 'Ipsum et.', 'Recusandae possimus architecto ratione quos itaque.', '1564499804', '', 'Ut reprehenderit magnam ipsam quia et occaecati.'),
(50, 'illum', '63866', 'Ad deleniti.', 'Voluptatibus quam.', 'Illum nostrum et sed qui nesciunt.', '1564499804', '', 'Sint harum distinctio id est suscipit.');

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
(2, 'Administrators', 'Default role for administrators', 'admin', '[\"students.TrackBus\",\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"adminTasks.globalSettings\",\"adminTasks.mailSmsSettings\",\"adminTasks.frontendCMS\",\"adminTasks.bioItegration\",\"adminTasks.activatedModules\",\"adminTasks.paymentsSettings\",\"adminTasks.mobileSettings\",\"adminTasks.lookFeel\",\"adminTasks.vacationSettings\",\"newsboard.View\",\"events.View\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\",\"roles.list\",\"roles.add_role\",\"roles.modify_role\",\"roles.delete_role\",\"Marksheet.Marksheet\",\"Library.Export\",\"Library.Import\"]'),
(3, 'Prefect', '', 'none', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"newsboard.View\",\"events.View\",\"frontendCMSpages.addPage\",\"frontendCMSpages.editPage\",\"frontendCMSpages.delPage\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"wel_office_cat.list\",\"wel_office_cat.edit_cat\",\"wel_office_cat.del_cat\",\"wel_office_cat.add_cat\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"students.medHistory\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.View\",\"visitors.del_vis\",\"visitors.add_vis\",\"visitors.Download\",\"visitors.Export\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"postal.list\",\"postal.del_postal\",\"postal.Download\",\"postal.add_postal\",\"postal.Export\",\"postal.edit_postal\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"Hostel.HostelCat\",\"Hostel.EditHostel\",\"Hostel.listSubs\",\"Hostel.AddHostel\",\"Hostel.delHostel\",\"Hostel.list\",\"depart.list\",\"depart.del_depart\",\"depart.add_depart\",\"depart.edit_depart\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.del_enq\",\"enquiries.View\",\"enquiries.add_enq\",\"enquiries.Download\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"inv_cat.list\",\"inv_cat.del_cat\",\"inv_cat.add_cat\",\"inv_cat.edit_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.Export\",\"items_code.add_item\",\"items_code.edit_item\",\"items_stock.list\",\"items_stock.del_item\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"onlineExams.QuestionsArch\",\"onlineExams.delExam\",\"onlineExams.list\",\"onlineExams.takeExam\",\"onlineExams.addExam\",\"onlineExams.editExam\",\"onlineExams.showMarks\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Dormitories.editDorm\",\"Dormitories.addDormitories\",\"Dormitories.list\",\"Dormitories.delDorm\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"FeeTypes.delFeeType\",\"FeeTypes.list\",\"FeeTypes.addFeeType\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Incomes.addIncome\",\"Incomes.delIncome\",\"Incomes.list\",\"Incomes.editIncome\",\"Incomes.incomeCategory\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"frontendCMSpages.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\"]'),
(4, 'Principal', '', 'none', '[\"staticPages.addPage\",\"academicyears.addAcademicyear\",\"academicyears.editAcademicYears\",\"academicyears.delAcademicYears\",\"staticPages.editPage\",\"staticPages.delPage\",\"accountants.addAccountant\",\"accountants.editAccountant\",\"accountants.delAccountant\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"classes.addClass\",\"classes.editClass\",\"classes.delClass\",\"sections.addSection\",\"sections.editSection\",\"sections.delSection\",\"Subjects.editSubject\",\"Subjects.delSubject\",\"newsboard.View\",\"events.View\",\"frontendCMSpages.addPage\",\"frontendCMSpages.editPage\",\"frontendCMSpages.delPage\",\"mediaCenter.View\",\"mediaCenter.delAlbum\",\"mediaCenter.delMedia\",\"mediaCenter.editMedia\",\"gradeLevels.addLevel\",\"gradeLevels.editGrade\",\"gradeLevels.delGradeLevel\",\"Promotion.promoteStudents\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"FeeDiscount.addFeeDiscount\",\"FeeDiscount.editFeeDiscount\",\"FeeDiscount.assignUser\",\"Invoices.dueInvoices\",\"Invoices.addPayment\",\"Invoices.editPayment\",\"Invoices.View\",\"Invoices.delPayment\",\"Assignments.Download\",\"studyMaterial.addMaterial\",\"studyMaterial.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"Payroll.makeUsrPayment\",\"Payroll.salaryBase\",\"Payroll.hourSalary\",\"Payroll.delUsrPayment\",\"Payroll.userSalary\",\"classSch.addSch\",\"classSch.editSch\",\"classSch.delSch\",\"parents.AddParent\",\"teachers.addTeacher\",\"students.addStudent\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"dashboard.stats\",\"wel_office_cat.list\",\"wel_office_cat.edit_cat\",\"wel_office_cat.del_cat\",\"wel_office_cat.View\",\"wel_office_cat.add_cat\",\"students.list\",\"students.delStudent\",\"students.stdLeaderBoard\",\"students.Attendance\",\"students.Marksheet\",\"students.Import\",\"students.listGradStd\",\"students.editStudent\",\"students.Approve\",\"students.Export\",\"students.medHistory\",\"parents.list\",\"parents.delParent\",\"parents.Export\",\"parents.Approve\",\"parents.Import\",\"parents.editParent\",\"visitors.list\",\"visitors.edit_vis\",\"visitors.View\",\"visitors.del_vis\",\"visitors.add_vis\",\"visitors.Download\",\"visitors.Export\",\"phn_calls.list\",\"phn_calls.edit_call\",\"phn_calls.View\",\"phn_calls.del_call\",\"phn_calls.Export\",\"phn_calls.add_call\",\"postal.list\",\"postal.del_postal\",\"postal.Download\",\"postal.add_postal\",\"postal.Export\",\"postal.edit_postal\",\"con_mess.list\",\"con_mess.Export\",\"con_mess.View\",\"con_mess.del_mess\",\"classSch.list\",\"trans_vehicles.list\",\"trans_vehicles.del_vehicle\",\"trans_vehicles.Download\",\"trans_vehicles.add_vehicle\",\"trans_vehicles.edit_vehicle\",\"teachers.EditTeacher\",\"teachers.teacLeaderBoard\",\"teachers.Export\",\"teachers.Approve\",\"teachers.list\",\"teachers.delTeacher\",\"teachers.Import\",\"Transportation.members\",\"Transportation.list\",\"Transportation.delTrans\",\"Transportation.addTransport\",\"Transportation.editTransport\",\"Hostel.HostelCat\",\"Hostel.EditHostel\",\"Hostel.listSubs\",\"Hostel.AddHostel\",\"Hostel.delHostel\",\"Hostel.list\",\"depart.list\",\"depart.del_depart\",\"depart.add_depart\",\"depart.edit_depart\",\"desig.list\",\"desig.del_desig\",\"desig.add_desig\",\"desig.edit_desig\",\"employees.list\",\"employees.delEmployee\",\"employees.addEmployee\",\"employees.editEmployee\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"enquiries.list\",\"enquiries.edit_enq\",\"enquiries.Export\",\"enquiries.del_enq\",\"enquiries.View\",\"enquiries.add_enq\",\"enquiries.Download\",\"complaints.edit_complaint\",\"complaints.list\",\"complaints.Export\",\"complaints.del_complaint\",\"complaints.View\",\"complaints.Download\",\"complaints.add_complaint\",\"inv_cat.list\",\"inv_cat.del_cat\",\"inv_cat.add_cat\",\"inv_cat.edit_cat\",\"suppliers.list\",\"suppliers.del_supp\",\"suppliers.add_supp\",\"suppliers.edit_supp\",\"suppliers.Export\",\"stores.list\",\"stores.del_store\",\"stores.add_store\",\"stores.edit_store\",\"items_code.list\",\"items_code.del_item\",\"items_code.Export\",\"items_code.add_item\",\"items_code.edit_item\",\"items_stock.list\",\"items_stock.del_item\",\"items_stock.Download\",\"items_stock.add_item\",\"items_stock.edit_item\",\"items_stock.Export\",\"iss_ret.list\",\"iss_ret.del_item\",\"iss_ret.Download\",\"iss_ret.issue_item\",\"iss_ret.edit_item\",\"iss_ret.Export\",\"FeeAllocation.list\",\"FeeAllocation.delFeeAllocation\",\"FeeAllocation.addFeeAllocation\",\"FeeAllocation.editFeeAllocation\",\"onlineExams.QuestionsArch\",\"onlineExams.delExam\",\"onlineExams.list\",\"onlineExams.takeExam\",\"onlineExams.addExam\",\"onlineExams.editExam\",\"onlineExams.showMarks\",\"issue_book.list\",\"issue_book.del_issue\",\"issue_book.add_issue\",\"issue_book.Export\",\"issue_book.edit_issue\",\"issue_book.book_return\",\"Library.mngSub\",\"Library.editBook\",\"Library.addBook\",\"Library.Download\",\"Library.delLibrary\",\"Library.list\",\"students.std_cat\",\"students.admission\",\"Expenses.list\",\"Expenses.delExpense\",\"Expenses.addExpense\",\"Expenses.expCategory\",\"Expenses.editExpense\",\"Vacation.reqVacation\",\"Vacation.appVacation\",\"Vacation.myVacation\",\"Attendance.takeAttendance\",\"Attendance.attReport\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Dormitories.editDorm\",\"Dormitories.addDormitories\",\"Dormitories.list\",\"Dormitories.delDorm\",\"FeeDiscount.list\",\"FeeDiscount.delFeeDiscount\",\"FeeGroups.list\",\"FeeGroups.delFeeGroup\",\"FeeGroups.addFeeGroup\",\"FeeGroups.editFeeGroup\",\"FeeTypes.editFeeType\",\"FeeTypes.delFeeType\",\"FeeTypes.list\",\"FeeTypes.addFeeType\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"Incomes.addIncome\",\"Incomes.delIncome\",\"Incomes.list\",\"Incomes.editIncome\",\"Incomes.incomeCategory\",\"Invoices.Export\",\"Invoices.collInvoice\",\"Invoices.payRevert\",\"Invoices.list\",\"Polls.editPoll\",\"Polls.addPoll\",\"Polls.list\",\"Polls.delPoll\",\"Subjects.list\",\"Subjects.addSubject\",\"academicyears.list\",\"classes.list\",\"events.addEvent\",\"events.delEvent\",\"events.editEvent\",\"events.list\",\"frontendCMSpages.list\",\"gradeLevels.list\",\"mediaCenter.addAlbum\",\"mediaCenter.addMedia\",\"mediaCenter.editAlbum\",\"mobileNotifications.sendNewNotification\",\"newsboard.list\",\"newsboard.editNews\",\"newsboard.delNews\",\"newsboard.addNews\",\"sections.list\",\"staffAttendance.takeAttendance\",\"staffAttendance.attReport\",\"staticPages.list\",\"studyMaterial.list\",\"studyMaterial.delMaterial\",\"studyMaterial.editMaterial\",\"Reports.Reports\",\"Certificates.list\",\"Certificates.del_cert\",\"Certificates.add_cert\",\"Certificates.edit_cert\"]'),
(5, 'Teacher', 'Default role for teachers', 'teacher', '[\"classes.list\",\"Subjects.list\",\"AccountSettings.ChgProfileData\",\"AccountSettings.chgEmailAddress\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"mailsms.mailSMSSend\",\"mailsms.mailsmsTemplates\",\"Assignments.Download\",\"Homework.addHomework\",\"Homework.editHomework\",\"Homework.View\",\"Homework.Answers\",\"examsList.addExam\",\"examsList.examDetailsNot\",\"examsList.showMarks\",\"classSch.list\",\"trans_vehicles.list\",\"depart.list\",\"desig.list\",\"examsList.controlMarksExam\",\"examsList.delExam\",\"examsList.View\",\"examsList.list\",\"examsList.editExam\",\"Library.Download\",\"Vacation.reqVacation\",\"Vacation.myVacation\",\"Assignments.list\",\"Assignments.delAssignment\",\"Assignments.AddAssignments\",\"Assignments.viewAnswers\",\"Assignments.editAssignment\",\"Assignments.applyAssAnswer\",\"Homework.Download\",\"Homework.delHomework\",\"Homework.list\",\"academicyears.list\",\"classes.list\",\"events.list\",\"gradeLevels.list\",\"mobileNotifications.sendNewNotification\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"studyMaterial.Download\",\"studyMaterial.delMaterial\",\"studyMaterial.addMaterial\",\"studyMaterial.editMaterial\",\"staticPages.list\",\"mediaCenter.View\",\"students.list\",\"students.Attendance\",\"students.delStudent\",\"students.editStudent\"]'),
(6, 'Student', 'Default role for students', 'student', '[\"students.TrackBus\",\"AccountSettings.ChgProfileData\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Library.Download\",\"Vacation.myVacation\",\"Homework.list\",\"academicyears.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Library.list\",\"Transportation.list\",\"newsboard.list\",\"Homework.Download\",\"Invoices.list\",\"Invoices.View\",\"Subjects.list\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
(7, 'Parents', 'Default role for Parents', 'parent', '[\"students.TrackBus\",\"studyMaterial.Download\",\"classes.list\",\"Subjects.list\",\"AccountSettings.Messages\",\"AccountSettings.myInvoices\",\"AccountSettings.chgPassword\",\"newsboard.View\",\"events.View\",\"Homework.View\",\"classSch.list\",\"trans_vehicles.list\",\"examsList.View\",\"examsList.list\",\"Homework.list\",\"events.list\",\"gradeLevels.list\",\"studyMaterial.list\",\"Transportation.list\",\"newsboard.list\",\"Invoices.list\",\"Invoices.View\",\"mediaCenter.View\",\"Marksheet.Marksheet\",\"myAttendance.myAttendance\",\"Invoices.dueInvoices\",\"academicyears.list\",\"students.list\",\"students.Attendance\",\"students.Marksheet\",\"Homework.Answers\",\"Homework.Download\",\"Library.list\",\"Polls.list\",\"complaints.View\",\"complaints.add_complaint\",\"complaints.list\",\"complaints.del_complaint\",\"complaints.Download\",\"complaints.edit_complaint\",\"complaints.Export\",\"Assignments.list\",\"Assignments.Download\",\"Assignments.applyAssAnswer\",\"staticPages.list\"]'),
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
(1, 'omnis Sec', 9, '[\"41\",\"38\",\"24\",\"42\",\"36\",\"28\",\"26\",\"43\"]'),
(2, 'temporibus Sec', 9, '[\"25\",\"36\",\"43\",\"38\",\"28\",\"29\",\"40\",\"24\"]'),
(3, 'consectetur Sec', 6, '[\"40\",\"29\",\"37\"]'),
(4, 'ullam Sec', 1, '[\"40\",\"42\"]'),
(5, 'quasi Sec', 7, '[\"39\",\"28\",\"29\",\"44\"]'),
(6, 'qui Sec', 9, '[\"41\",\"25\",\"36\",\"40\",\"42\"]'),
(7, 'dolorum Sec', 2, '[\"36\",\"29\"]'),
(8, 'aut Sec', 5, '[\"26\",\"37\",\"24\",\"40\",\"33\"]'),
(9, 'culpa Sec', 9, '[\"38\",\"41\",\"27\",\"29\",\"32\"]'),
(10, 'nobis Sec', 4, '[\"24\",\"40\",\"37\",\"29\",\"44\"]'),
(11, 'repudiandae Sec', 7, '[\"30\",\"41\",\"40\",\"29\"]'),
(12, 'neque Sec', 10, '[\"42\",\"38\",\"35\",\"27\",\"32\",\"34\"]'),
(13, 'repellendus Sec', 9, '[\"38\",\"26\",\"43\",\"25\",\"42\"]'),
(14, 'omnis Sec', 6, '[\"40\",\"37\"]'),
(15, 'accusamus Sec', 10, '[\"27\",\"42\",\"32\",\"41\",\"43\",\"44\"]'),
(16, 'eos Sec', 4, '[\"29\",\"36\",\"34\",\"30\",\"25\",\"38\",\"40\",\"39\"]'),
(17, 'at Sec', 6, '[\"44\",\"42\"]'),
(18, 'doloribus Sec', 4, '[\"44\",\"37\",\"24\",\"36\",\"32\",\"39\",\"27\",\"38\"]'),
(19, 'et Sec', 9, '[\"34\",\"26\",\"42\",\"38\",\"36\"]'),
(20, 'consequuntur Sec', 5, '[\"26\",\"28\",\"38\",\"40\",\"33\"]'),
(21, 'quos Sec', 5, '[\"40\",\"39\",\"37\",\"42\",\"26\",\"33\",\"30\"]'),
(22, 'quia Sec', 3, '[\"38\",\"35\",\"44\",\"33\",\"36\",\"24\"]'),
(23, 'alias Sec', 3, '[\"36\",\"38\",\"43\",\"24\"]'),
(24, 'velit Sec', 5, '[\"26\",\"24\",\"44\",\"42\",\"40\"]'),
(25, 'sint Sec', 6, '[\"44\",\"33\",\"42\"]'),
(26, 'dolores Sec', 3, '[\"35\",\"30\",\"33\",\"38\"]'),
(27, 'est Sec', 8, '[\"33\",\"37\",\"34\",\"44\",\"36\",\"24\",\"31\"]'),
(28, 'maxime Sec', 1, '[\"29\",\"42\",\"32\",\"41\"]'),
(29, 'est Sec', 3, '[\"36\",\"31\",\"24\",\"38\"]'),
(30, 'id Sec', 2, '[\"29\",\"33\"]');

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
(1, 'Home', 'Assumenda ratione exercitationem repudiandae voluptatem blanditiis esse illum eos quis in sed.', 1),
(2, 'About us', 'Cumque aut id ut minima qui corporis dolores accusantium ea ducimus quidem voluptatem.', 1),
(3, 'CMS', 'Ut nobis assumenda aliquam similique accusantium sunt enim id nihil illum dolor et ut.', 1),
(4, 'Sections', 'Temporibus doloremque reiciendis officiis ut sed vel quaerat quia.', 1),
(5, 'Subjects', 'Similique non a expedita facilis id fugiat rerum nemo aperiam nostrum laboriosam saepe sed atque modi est blanditiis.', 1);

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
(1, 'Quis veniam.', ''),
(2, 'Eum.', ''),
(3, 'Ab consequatur.', ''),
(4, 'Praesentium molestiae.', ''),
(5, 'Voluptatem.', ''),
(6, 'Et praesentium.', ''),
(7, 'Consequatur.', 'Ducimus neque illo provident perferendis non et soluta debitis facilis est consequuntur aperiam velit aut voluptas officia voluptatem corporis iste nulla aut nam quos est est corrupti.'),
(8, 'Eius deleniti.', 'Voluptate qui dolorem animi iure consequatur vitae eveniet nihil voluptatem nobis dolores et sed debitis quod.');

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
(1, 'Pariatur dolor ut.', '', '', '[\"4\",\"8\",\"1\"]', '[\"23\",\"7\",\"8\"]', 9, 40),
(2, 'Amet labore ducimus.', '', '', '[\"2\",\"6\",\"4\"]', '[\"20\",\"24\"]', 2, 42),
(3, 'Molestiae eum.', '', '', '[\"10\",\"6\",\"3\"]', '[\"8\",\"19\"]', 2, 31),
(4, 'Error deleniti.', '', '', '[\"10\",\"5\",\"6\"]', '[\"26\",\"20\",\"4\"]', 1, 32),
(5, 'Vel eos.', '', '', '[\"9\"]', '[\"20\",\"23\"]', 10, 44),
(6, 'Amet.', '', '', '[\"8\",\"9\",\"10\"]', '[\"26\"]', 4, 32),
(7, 'Qui voluptas.', '', '', '[\"2\"]', '[\"28\",\"23\"]', 3, 43),
(8, 'Minus tempore incidunt.', '', '', '[\"8\",\"3\",\"10\"]', '[\"12\",\"20\",\"17\"]', 9, 41),
(9, 'Aut adipisci.', '', '', '[\"6\"]', '[\"2\"]', 2, 41),
(10, 'Labore omnis.', '', '', '[\"1\",\"10\",\"7\"]', '[\"19\"]', 3, 30),
(11, 'Unde sit.', '', '', '[\"4\"]', '[\"1\",\"27\",\"3\"]', 3, 36),
(12, 'Quas cupiditate aut.', '', '', '[\"8\"]', '[\"13\"]', 6, 29),
(13, 'Animi modi.', '', '', '[\"4\",\"5\",\"6\"]', '[\"6\"]', 4, 26),
(14, 'Velit deserunt.', '', '', '[\"1\",\"4\",\"8\"]', '[\"29\",\"4\",\"21\"]', 5, 31),
(15, 'Officia.', '', '', '[\"3\",\"6\",\"5\"]', '[\"14\",\"1\"]', 8, 30);

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
(1, 'Qui voluptatem.', '30', '90', '[\"44\",\"42\",\"24\",\"26\",\"25\",\"40\",\"28\",\"38\"]'),
(2, 'Consequatur eius.', '30', '60', '[\"34\",\"38\",\"39\",\"40\",\"31\",\"33\",\"37\",\"32\",\"35\"]'),
(3, 'Magni omnis.', '50', '80', '[\"32\",\"34\",\"26\",\"39\",\"33\",\"31\",\"43\",\"25\",\"41\",\"30\",\"37\",\"44\",\"36\",\"29\",\"27\"]'),
(4, 'Deserunt deleniti possimus.', '40', '80', '[\"36\",\"28\",\"26\",\"30\",\"24\",\"32\",\"38\",\"43\"]'),
(5, 'Error sed.', '10', '70', '[\"28\",\"43\",\"33\",\"37\",\"27\",\"24\",\"41\",\"40\"]'),
(6, 'Mollitia blanditiis.', '10', '70', '[\"41\",\"44\",\"25\",\"24\",\"28\",\"35\",\"26\",\"39\",\"31\"]'),
(7, 'Ipsum blanditiis.', '40', '60', '[\"28\",\"24\",\"27\",\"35\",\"30\",\"44\",\"43\",\"34\",\"40\",\"25\",\"31\",\"32\"]'),
(8, 'Inventore beatae nam.', '50', '80', '[\"34\",\"35\",\"31\",\"43\",\"37\",\"33\",\"27\"]'),
(9, 'Sed quia.', '30', '90', '[\"43\",\"44\",\"41\",\"30\",\"39\",\"36\",\"31\"]'),
(10, 'Ullam ad.', '50', '100', '[\"28\",\"29\",\"27\",\"37\",\"24\",\"25\",\"38\",\"33\",\"31\",\"30\",\"35\"]');

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
(1, 'Ut optio.', 'Aliquid odit ea.', '[\"2\",\"1\"]', '630'),
(2, 'Assumenda excepturi.', 'Sed dolores exercitationem.', '[\"9\"]', '860'),
(3, 'Modi.', 'Molestiae aliquam.', '[\"4\"]', '730'),
(4, 'Nihil totam.', '', '[\"7\",\"3\"]', '560'),
(5, 'Aliquid.', 'Qui ab excepturi occaecati.', '[\"6\",\"1\",\"9\"]', '640'),
(6, 'Ratione aut.', '', '[\"10\",\"8\",\"3\"]', '870'),
(7, 'Sed.', '', '[\"10\"]', '770'),
(8, 'Iste quidem.', '', '[\"1\",\"4\"]', '630'),
(9, 'Ratione cum.', '', '[\"3\",\"7\",\"2\"]', '610'),
(10, 'Soluta tenetur.', '', '[\"5\",\"10\",\"8\"]', '520'),
(11, 'Voluptatem totam.', '', '[\"9\",\"6\",\"1\"]', '860'),
(12, 'Nulla cupiditate.', 'Ipsa facilis.', '[\"2\"]', '830'),
(13, 'Veniam nisi.', 'Aut deserunt non.', '[\"7\",\"10\"]', '700'),
(14, 'Odit et.', '', '[\"1\"]', '670'),
(15, 'Officia.', 'Iste velit quia.', '[\"10\",\"1\"]', '800');

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
(1, '6916', '', 'dolores', 'Mrs. Imelda Berge V', '', '858514939067006', 'Magni exercitationem enim dolores sit.', 'Molestiae in totam deleniti et illum.'),
(2, '9197', '', 'autem', 'Dr. Alfred Heidenreich', '', '519167363626768', 'Quis minus veritatis.', 'Fugit et enim veniam illo voluptatem.'),
(3, '2695', '', 'repellat', 'Emile Wunsch MD', '', '543891050036368', 'Quos voluptatem.', 'Nostrum nam magnam eveniet error.'),
(4, '5079', '', 'rerum', 'Caroline Bechtelar', '', '118592072516657', 'Tempora quisquam.', 'Repudiandae qui aperiam commodi.'),
(5, '2140', '', 'possimus', 'Nathanael Mante', '', '985364363438815', 'Aut consequatur in.', 'Odio cum voluptatem blanditiis recusandae dolores.'),
(6, '3851', '', 'iste', 'Erwin Wilderman', '', '524213813077971', 'Dolore qui accusantium vero.', 'Velit nemo autem vero maxime.'),
(7, '8464', '', 'laudantium', 'Concepcion Hegmann', '', '867285945078451', 'At deserunt est voluptates.', 'Dignissimos velit culpa autem et.'),
(8, '6627', '', 'aliquam', 'Dr. Curt Sawayn', '', '215711553547023', 'In excepturi.', 'Sit rem officiis corrupti quia laudantium fugiat.'),
(9, '1995', '', 'quos', 'Asia Zemlak', '', '840284577411698', 'Ducimus mollitia dolor maxime.', 'Provident amet sed necessitatibus sed sequi quidem vel.'),
(10, '8815', '', 'facere', 'Jennifer Breitenberg Sr.', '', '470803467440766', 'Repellat repudiandae et voluptatum.', 'Harum enim mollitia neque veritatis enim.');

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
(1, 'ahmedsk', 'hazle06@goyette.com', '$2y$10$RETGaTP0mjGmcr5zxsI8/eMDCZ5JtcnniwOtZawJLesvxBzB8MCrW', '', 'Ahmed Sayed', 'admin', 2, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '901492', '+11 9518286', 0, 0, '', NULL, '', '070.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(2, 'virtu', 'runolfsdottir.catharine@yahoo.com', '$2y$10$wlACpGOLpuBy6dR766cFcOtoIVhe6LXM1YMMN.d7EMVGUZRES2Pa2', '', 'Virtu', 'admin', 2, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '580074', '+48 2944784', 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'employee', 'ahmed.schiller@batz.com', '$2y$10$V7tWJc2iq2Gw1tM1S0uCQODXVXji90/e3l7yRRQ4VaCtK8o30QCJO', '', '[Em] Gracie Blanda', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '144006', '+20 3336970', 0, 0, '', NULL, '', '092.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'marcia36', 'helga03@rolfson.com', '$2y$10$Lbr6lCOMKZpR7GBGGufx2egbqbXtbg9.oAvJiYypY.BCi69yd42Oq', '', '[Em] Wilfredo Schumm', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '633081', '+92 8214553', 0, 0, '', NULL, '', '054.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'leuschke.julia', 'jean.hamill@gmail.com', '$2y$10$q2kfUo726nn5fTy/VhSN8uxjKx/dkEC/nGtSKxJQJWfDdYAWFlMHS', '', '[Em] Libby Deckow Jr.', 'employee', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '281413', '+46 7531032', 0, 0, '', NULL, '', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'pparker', 'lila.sanford@gmail.com', '$2y$10$wT4oRWCiBIl3nZRqteGZN.Zin3rk.kJfnw99Ruo83snscje0Q9tt.', '', '[Em] Sigmund Schneider', 'employee', 14, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '585742', '+92 3076128', 0, 0, '', NULL, '', '087.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'sabrina.nicolas', 'mhayes@gmail.com', '$2y$10$gBLUcejbqGSOOx706vXcyORUcJKa9dwVa2MNzwL7GTCVELGQ4tJa2', '', '[Em] Mr. Grayce Rutherford', 'employee', 11, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '667122', '+46 3186880', 0, 0, '', NULL, '', '052.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'geovany.hermann', 'fprosacco@gmail.com', '$2y$10$.OQZzC.2aWxZ6lc7cUFSmO7nK6KwJTChUQxl.XAeyrysQEiU1zsQO', '', '[Em] Blake Hartmann', 'employee', 8, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '830542', '+62 2324394', 0, 0, '', NULL, '', '071.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'connelly.estelle', 'camren.fisher@hane.org', '$2y$10$9kYtcv6UDIXICEpMJ9Djtutf.b2a1TLQ.0P5HzfoCfZjb3Q9KI/tO', '', '[Em] Kira Carter I', 'employee', 13, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '909691', '+51 9889992', 0, 0, '', NULL, '', '013.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'ucormier', 'corkery.laney@koepp.com', '$2y$10$dqxLCTwIxNLHu2DTy8oPVegT1pZGZTKOA.U0b3Zh.h3PP9Foisks.', '', '[Em] Dr. Kole Kemmer', 'employee', 8, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '596762', '+97 6093338', 0, 0, '', NULL, '', '057.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'carey.berge', 'zborer@purdy.com', '$2y$10$DIPt2Al5AfcXzLvic6/uQOTKp8bZ259.6qFRbQqpQyHGnwqCsIkCy', '', '[Em] Domenick Pacocha', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '324836', '+41 1808139', 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'janis33', 'steve46@fisher.com', '$2y$10$zv.Mfg3UwBh9dORrC/Qhx.aNDd51Cx7smOoOjONxGSyPyNjWL/onO', '', '[Em] Christa Buckridge', 'employee', 4, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '650682', '+26 8290250', 0, 0, '', NULL, '', '029.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'hoeger.ivy', 'mmurphy@torp.com', '$2y$10$czzC/aHPTqra7aTBKFZMsuB5IQRwuc.j.CC7Bm/O2s4AiuFUFGI6O', '', '[Em] Prof. Nicola Hammes', 'employee', 11, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '866011', '+52 4134811', 0, 0, '', NULL, '', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'wwest', 'mikel.bernhard@adams.com', '$2y$10$OhwkejqxgWfZcfrU0BXlBuFYPnqqMOX6bVyTDw4osd8vF0G5P8nYm', '', '[Em] Emerald Gusikowski', 'employee', 13, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '786930', '+75 6436946', 0, 0, '', NULL, '', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'bergstrom.zoila', 'sylvan.effertz@auer.com', '$2y$10$Zfje/PFnY8bUu4vMwmIcEuTMs6efiwaOgyxlwwncHF2xQwenaZQQ6', '', '[Em] Prof. General Pouros Sr.', 'employee', 9, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '316533', '+56 5702134', 0, 0, '', NULL, '', '06.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'berge.deontae', 'llebsack@hotmail.com', '$2y$10$.tKtsYRTATeuYpZ9ahtMr.wYpo/cbXRkIPx6H1CspnOtBp1jQkGHC', '', '[Em] Lacey Champlin', 'employee', 11, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '614084', '+50 5418343', 0, 0, '', NULL, '', '088.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'arice', 'alanna.fahey@gmail.com', '$2y$10$CWxqvYd7JoB64XjWehJRcuvTRi1tPSsYmcGB7gi9VwBgpVhSqSxLK', '', '[Em] Mrs. Magali Kohler DDS', 'employee', 10, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '977280', '+85 7050827', 0, 0, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'roderick.kirlin', 'tbashirian@swaniawski.net', '$2y$10$NPMlwHIaMWXQtcX5R0owBuXEgoY6uLJST.U16dXptuXIIvxoFXrKa', '', '[Em] Clemmie Erdman', 'employee', 13, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '330785', '+63 8028890', 0, 0, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'lexus48', 'jbauch@hotmail.com', '$2y$10$H1F/k1yO0rlVhQCWFsMnf.kRvqVkKZYZkxFtsUUXM/ibjoqsUoz0C', '', '[Em] Delpha Kuhlman', 'employee', 10, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '529532', '+50 4218165', 0, 0, '', NULL, '', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'connelly.clementine', 'filomena.damore@yahoo.com', '$2y$10$5zV2SFhlq7Zv/MrrXhwjEOf0K7DmwZuLii6LXhS0Kcrv7DYQkgkJy', '', '[Em] Miss Maryse Jacobson', 'employee', 11, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '671298', '+66 6133127', 0, 0, '', NULL, '', '054.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'noah.kessler', 'ofelia19@gmail.com', '$2y$10$j4dicfvwwW3fYGygSOZi8OWPU2A9Z9vYBX4rUqIpZxVx6Yyoydrva', '', '[Em] Alfreda Cummerata', 'employee', 8, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '420008', '+36 9848312', 0, 0, '', NULL, '', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'issac94', 'lshanahan@gerhold.com', '$2y$10$QiDQaVw95BqHfbImwF5zM.1NHsk82meuF9Bu6NlU8aXitUtZL1iJG', '', '[Em] Laisha Zemlak', 'employee', 13, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '680076', '+91 5588747', 0, 0, '', NULL, '', '015.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'wryan', 'travon.nolan@jakubowski.com', '$2y$10$m45g8BtGUWMa6FZeS9Lo4e1XpQxxiTWPA/MDelbb31D01K0OniP56', '', '[Em] Dr. Skyla Zieme', 'employee', 8, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '528621', '+32 9929669', 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'teacher', 'champlin.mina@botsford.info', '$2y$10$WmteRehCcNJRA0cS5UqPkOnk1HNu/U/mHdSf5eYU.4ajmUrOont4W', '', '[Te] Mr. Elmore Renner', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '890548', '+79 2692254', 0, 0, '', NULL, '', '097.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'sshanahan', 'baumbach.angie@yahoo.com', '$2y$10$sYMwGtqjJmG7NJjWtlDx..NsC/sp7jhGCXkpQzuHwpffUJxy3EwyW', '', '[Te] Lorena Schmitt', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '736353', '+99 3220997', 0, 0, '', NULL, '', '044.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'rglover', 'riley.mante@gmail.com', '$2y$10$ey9F5p039zjWe5/7gEhWoO2.p4gy2DMp4jzMW4K7guNne9mkyTOb.', '', '[Te] Prof. Samir Rosenbaum III', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '824029', '+54 9472489', 0, 0, '', NULL, '', '094.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'zgrant', 'reinger.ceasar@blick.com', '$2y$10$wBBfiyKRdDtZaLThg7V/jO5mltaAP7zooz0L9bML.UsXfveyjvzSy', '', '[Te] Amelia Dach', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '747807', '+66 9848121', 0, 0, '', NULL, '', '047.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'smitham.timmothy', 'donato.lowe@kunde.info', '$2y$10$P86LmIDrl6LPNGnvLCRLCOX/hqt/vARuEJdNBq.AgmpzNxkBYF3D6', '', '[Te] Kayley Nolan', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '173359', '+36 7054546', 0, 0, '', NULL, '', '042.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'kerluke.drew', 'ymurray@yahoo.com', '$2y$10$baiQ/FbtQbhZpNKDxPY.CuEs/Vl28U2KN550pS99ta4kBDi4Z1oRS', '', '[Te] Arturo Blanda', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '455582', '+47 4871877', 0, 0, '', NULL, '', '025.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'stoltenberg.katlynn', 'herbert95@cummerata.com', '$2y$10$WeEN/fXpOuWijnPrBIYfT.kM8PkWVhoGb.2F1k2dUrEr80M8ceyCG', '', '[Te] Terrance Buckridge', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '372351', '+32 8926869', 0, 0, '', NULL, '', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'krunolfsdottir', 'dwilkinson@hotmail.com', '$2y$10$xpyeDbXVWoxZxd6gKgGp2Op4rjAZ3hyYBA6yY5l6GiwCf5gkB3Pxi', '', '[Te] Orlo Johnson', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '957550', '+60 9557185', 0, 0, '', NULL, '', '098.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'ahmad.champlin', 'dicki.milford@hotmail.com', '$2y$10$Myzt.Yg.x4q8TOYqTV.CNeMtSpmg3ainQ4WdY7D7imnjFIvlzu4lK', '', '[Te] Mrs. Anika Bashirian', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '771879', '+64 3268286', 0, 0, '', NULL, '', '03.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'cmraz', 'jtoy@gmail.com', '$2y$10$IL6JrnF/nVQrD8RuRGh0tea7XpCOOjrlk8cS3ijKWiVuBaXV32odO', '', '[Te] Donald Brown DVM', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '495719', '+55 8439722', 0, 0, '', NULL, '', '061.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'deon.rowe', 'betty.fay@gmail.com', '$2y$10$qSXgYAEMv3PpgqRGpqJK2OKhyjIzRZlf2vxrHe6EF.UcNSbIbz3Ma', '', '[Te] Aylin Padberg', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '747740', '+12 2858352', 0, 0, '', NULL, '', '063.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'mercedes.conroy', 'xhamill@hotmail.com', '$2y$10$Twt9lnbiuuGKX0Zgi4qfZOOJTyzp8B.dR.f5uQLEf1XEDfRCW4V9a', '', '[Te] Foster Prosacco', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '436949', '+34 3909305', 0, 0, '', NULL, '', '030.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'earnestine.gleason', 'delta89@haley.com', '$2y$10$OLT4IouRYq/y3KfpZ2CmrOXUapTIwXChEiNL3rmRs/OEMNFpKC5h2', '', '[Te] Mr. Rigoberto Mante DVM', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '330818', '+14 1897294', 0, 0, '', NULL, '', '010.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'connelly.sierra', 'kiehn.therese@yahoo.com', '$2y$10$ISuMQjSI15GYvalVT.lxxOIT9p5YJXKw548L3HbosHZv64H5BDvCS', '', '[Te] Mrs. Dariana Schuppe', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '188350', '+80 4749980', 0, 0, '', NULL, '', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'wendy.zieme', 'rebeca70@hotmail.com', '$2y$10$K41OxM3Aftjkyc7De7/ha.Z7eBnOUHfBkq0QMhuzlQTJmUknqffCy', '', '[Te] Mr. Tavares Thiel', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '876413', '+11 9628756', 0, 0, '', NULL, '', '01.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'qgoyette', 'bins.genesis@hoeger.biz', '$2y$10$eDprzbj74q/HBAAtC2bCWO6JpydJOwtIysDFLAGaJKPxZ7Bra2bFC', '', '[Te] Buford Daugherty', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '628850', '+63 4929946', 0, 0, '', NULL, '', '050.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'maximillian.herman', 'bhayes@skiles.com', '$2y$10$BkadwjYDNA84ZWbTjnTaf.DgxTIr5Z6QdC/4OA4BMD38tiKpRbg2.', '', '[Te] Rusty Collins', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '209303', '+63 8945291', 0, 0, '', NULL, '', '044.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'stamm.jazmin', 'schamberger.burley@hegmann.net', '$2y$10$ZC.lW2XYgtAzUMZXr9esDOvqS7iFhvDVvzqzrvZsDgx1ZndX1hhRS', '', '[Te] Dr. Logan Bashirian III', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '721189', '+98 6691273', 0, 0, '', NULL, '', '085.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'zkirlin', 'krajcik.antonietta@hotmail.com', '$2y$10$IziBiRtu8e5D4FwYym8GSucjI8ajkjzsjgZNwqF3ctE2tKleDa2jG', '', '[Te] Mrs. Shyann Schroeder IV', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '845824', '+27 9755488', 0, 0, '', NULL, '', '079.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'tromp.shania', 'aaliyah.schultz@kirlin.net', '$2y$10$AKZ0gHN921HFFQ.MuYqa4uhe/LajIXCEctjW.QFHaNhGNwucHsASC', '', '[Te] Larry Gerlach', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '483120', '+93 7680498', 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'rachael82', 'bmonahan@hotmail.com', '$2y$10$kQ44OTliJeTXf5fUs0t5JuP0SqyTgicMIv7sdMQo/FZwU1lOith5m', '', '[Te] Camylle Bartoletti', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '985390', '+64 6475050', 0, 0, '', NULL, '', '077.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'student', 'borer.madyson@schuppe.com', '$2y$10$McB8K9fG29oH5Iv3.QpwPeyDcg1ffxNkxf0nbXh2kvYMRbwYau7Wy', '', '[St] Prof. Shanna Stanton DDS', 'student', 6, 1, NULL, 0, 1, '77', '21-130-62', 0, 0, '', 0, NULL, NULL, '7237521461', '2354540', 6, 3, '', NULL, '', '027.png', '', '', 3, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'maynard03', 'milton90@yahoo.com', '$2y$10$EnJxpLjb6ELjQ3231kFA2OFGTeLW58aN76QbF.Xi/4EafmtQ60Nyy', '', '[St] Kiel Russel', 'student', 6, 3, NULL, 0, 1, '95', '38-812-71', 0, 0, '', 0, NULL, NULL, '4147592281', '4456565', 9, 2, '', NULL, '', '011.png', '', '', 4, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'jwintheiser', 'kessler.gail@grant.com', '$2y$10$AYgVQXhQVG0XTAOpI0iixuWlpY8PMiWMnyEkKX7.twyb8P9J.JMOq', '', '[St] Justyn Collier', 'student', 6, 3, NULL, 0, 1, '12', '26-936-18', 0, 0, '', 0, NULL, NULL, '8634822281', '1693815', 1, 4, '', NULL, '', '03.png', 'Captain: Yellow House', '', 10, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'sim87', 'harmony23@yahoo.com', '$2y$10$UCwO6hxivCQdoyK4FvGlPOvmSuc3wa3A7m0vG5N155CN08Q3CeABe', '', '[St] Halie Emmerich', 'student', 6, 4, NULL, 0, 1, '31', '62-765-81', 0, 0, '', 0, NULL, NULL, '7193589697', '8346035', 7, 11, '', NULL, '', '031.png', '', '', 9, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'florencio82', 'schmidt.michaela@lynch.com', '$2y$10$LFMVim4xcYbbweC7gjs2G.QT0dCjdRuqS6JVAxA94RMF9zLUDrSou', '', '[St] Estefania Jones', 'student', 6, 4, NULL, 0, 1, '22', '47-295-13', 0, 0, '', 0, NULL, NULL, '4215067334', '9850279', 3, 29, '', NULL, '', '07.png', '', '', 9, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'quigley.darlene', 'hollis12@yahoo.com', '$2y$10$gE5i1eBWoCpltqHgeRJAEO41tA42A/exKwGcFq8LDFpfZo4n2lpNa', '', '[St] Amber Klein', 'student', 6, 4, NULL, 0, 1, '86', '88-663-83', 0, 0, '', 0, NULL, NULL, '3756122201', '7939738', 6, 3, '', NULL, '', '046.png', '', '', 2, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'ylehner', 'rodolfo.jerde@hotmail.com', '$2y$10$AHoMgq8iU8MImxz1NGDZduSxYxoB1XV8iedl/5mlDDxfD5X6d9iES', '', '[St] Dahlia Shanahan', 'student', 6, 3, NULL, 0, 1, '21', '29-297-17', 0, 0, '', 0, NULL, NULL, '1166538791', '9529327', 7, 5, '', NULL, '', '097.png', '', '', 7, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'valerie16', 'isaiah42@vonrueden.com', '$2y$10$XXO17mNoelge60r0.Nowr.nTxv1HI9Oxg7sNL9T4r7LhoUF7xaBwC', '', '[St] Queen Murphy', 'student', 6, 4, NULL, 0, 1, '17', '14-866-53', 0, 0, '', 0, NULL, NULL, '5146521951', '8443094', 8, 27, '', NULL, '', '024.png', 'Vice Principal', '', 3, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'sylvia.hudson', 'qquigley@hilpert.com', '$2y$10$HHERHXQcygkG3XhJBDfdsuPrc3gVXTSbS5N6wztW0p64X9n7lafOO', '', '[St] Dayna Rowe', 'student', 6, 4, NULL, 0, 1, '46', '32-217-39', 0, 0, '', 0, NULL, NULL, '7362769419', '9840291', 5, 8, '', NULL, '', '039.png', '', '', 14, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'schmitt.willy', 'mariane56@daniel.info', '$2y$10$UQjxrPzMu1tI9NHUy.0DPu27HCoY.aFOM5fLBzWiz3CUP8UBKtrMG', '', '[St] Horacio Kertzmann', 'student', 6, 3, NULL, 0, 1, '89', '85-496-89', 0, 0, '', 0, NULL, NULL, '4598874624', '7984752', 4, 16, '', NULL, '', '084.png', '', '', 15, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'horacio.bartoletti', 'jessyca89@gerlach.com', '$2y$10$alEnm5A5KGVmsG4TqoXDPeVw7djG8ux5OWcOpZ.u84W8tM5CVUXf.', '', '[St] Brenden Greenfelder', 'student', 6, 2, NULL, 0, 1, '40', '50-786-86', 0, 0, '', 0, NULL, NULL, '2231030657', '8488173', 7, 5, '', NULL, '', '096.png', '', '', 10, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'jackson.berge', 'colby.rosenbaum@hotmail.com', '$2y$10$cjcd2iAdHDBwxKo9JTyMxueaHWWREQcBiuYBgAke3NxFZdu81UDVC', '', '[St] Barrett Olson', 'student', 6, 2, NULL, 0, 1, '29', '15-574-65', 0, 0, '', 0, NULL, NULL, '2569219684', '9555844', 10, 12, '', NULL, '', '086.png', '', '', 1, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'bradford73', 'jameson96@witting.com', '$2y$10$t1BbGGR7eN47tXLMrj6xD.2LXcHgdCEpFYA/NkHJ15N8x4uD52naq', '', '[St] Lauriane Kovacek', 'student', 6, 3, NULL, 0, 1, '2', '84-202-69', 0, 0, '', 0, NULL, NULL, '6716303346', '6497815', 5, 8, '', NULL, '', '027.png', '', '', 14, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'orn.maida', 'kcarter@funk.com', '$2y$10$32l5sC7TBtg9hTidwMgoQuQaI1pgYHuhH2dt9jCmYY7QeoDa51dGC', '', '[St] Mr. Candido Spinka', 'student', 6, 3, NULL, 0, 1, '13', '21-699-75', 0, 0, '', 0, NULL, NULL, '3553906484', '3773199', 10, 15, '', NULL, '', '058.png', 'Captain: Blue House', '', 9, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'boyer.haven', 'melisa.parisian@hessel.com', '$2y$10$lHP92wu/NAVZcyHYfT68zeg16j9RI.HHssUZYbJ1ho4FiwjqU96tK', '', '[St] Jevon Padberg', 'student', 6, 1, NULL, 0, 1, '53', '20-531-13', 0, 0, '', 0, NULL, NULL, '1320745125', '3545583', 6, 17, '', NULL, '', '069.png', 'Pro', '', 6, 4, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'qdicki', 'sconsidine@graham.com', '$2y$10$ZX55klNtjTE1kMHxySon9eV3iYGqv5J9qFR3BeASpnTg1QBaFQRlm', '', '[St] Korbin Tromp Sr.', 'student', 6, 3, NULL, 0, 1, '76', '18-476-23', 0, 0, '', 0, NULL, NULL, '1346179736', '6362475', 9, 19, '', NULL, '', '015.png', 'Captain: Blue House', '', 3, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'wbednar', 'corbin.crooks@yahoo.com', '$2y$10$EboTEhdfKk0W0q3EzFIlj.Fvd5BvGM4el2.984qf7wxMpOHIQlfe2', '', '[St] Brice Gaylord', 'student', 6, 4, NULL, 0, 1, '90', '71-595-85', 0, 0, '', 0, NULL, NULL, '9596948290', '8316382', 1, 28, '', NULL, '', '063.png', 'Captain: Yellow House', '', 9, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'beer.helmer', 'balistreri.glen@ebert.com', '$2y$10$Aw2Rk5NNwJzHzRKs.b/.XuQGY7usxvVmTySTZP6U6wyvvEYhT1e5O', '', '[St] Lyda Quitzon', 'student', 6, 2, NULL, 0, 1, '33', '88-910-61', 0, 0, '', 0, NULL, NULL, '4281738647', '5953062', 10, 12, '', NULL, '', '055.png', '', '', 15, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'barton.delaney', 'luna.king@hotmail.com', '$2y$10$sNbeFc3qfOxcaWGV9XQJb.TK4oVTw0WoPsfbpTAbvONn7DTBggUiq', '', '[St] Dr. Margot Kemmer', 'student', 6, 1, NULL, 0, 1, '77', '96-159-12', 0, 0, '', 0, NULL, NULL, '3324047111', '7984703', 6, 17, '', NULL, '', '016.png', '', '', 8, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'angela32', 'shayne.kuphal@mann.info', '$2y$10$hYcz5g2xnQb3AsCcNGTrau3PE782hxA4LPazzDshDpD27TmYg3Tp6', '', '[St] Dr. Mario Hirthe', 'student', 6, 3, NULL, 0, 1, '30', '93-663-19', 0, 0, '', 0, NULL, NULL, '5879268843', '8682333', 6, 25, '', NULL, '', '035.png', '', '', 3, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'murphy.kadin', 'mtillman@yahoo.com', '$2y$10$HFqAzYcrBc5RVNIZBaKmD.c9fvctZ.XwgcRwdxqYK9.GHwRkqxuaq', '', '[St] Marquise Ondricka', 'student', 6, 2, NULL, 0, 1, '97', '59-740-89', 0, 0, '', 0, NULL, NULL, '4772088806', '8519524', 2, 7, '', NULL, '', '049.png', '', '', 14, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'yasmine27', 'johnny49@kris.net', '$2y$10$k9G1RUfQQyzIHF0Hmz838e9BXZPeXQoQ7sK3Mwu.dz1r9soOK5T2y', '', '[St] Molly Rutherford', 'student', 6, 4, NULL, 0, 1, '68', '62-798-38', 0, 0, '', 0, NULL, NULL, '2030765340', '2024658', 1, 28, '', NULL, '', '096.png', '', '', 15, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'considine.javier', 'jasper.green@gulgowski.org', '$2y$10$FunLYC6/0bTDnEiU0N6AO.CON7N4bk.evLjCGphW0w7Udkwt7OKfG', '', '[St] Claudine Vandervort', 'student', 6, 4, NULL, 0, 1, '74', '25-295-18', 0, 0, '', 0, NULL, NULL, '9476188247', '7172279', 4, 18, '', NULL, '', '020.png', 'Captain: Blue House', '', 14, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'neal30', 'sydnie19@hotmail.com', '$2y$10$Cp6uRcMkSYq3h3bjWZ0B2uqgYiAxyA4AfOcicJCQDpEHvODJ2HVIS', '', '[St] Henderson Sporer', 'student', 6, 4, NULL, 0, 1, '71', '51-993-97', 0, 0, '', 0, NULL, NULL, '2359677848', '7389963', 10, 15, '', NULL, '', '087.png', '', '', 2, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'ullrich.kyle', 'mckenzie.greenholt@little.com', '$2y$10$YvG0AxrL6Y1kPKP4RXRn3.xwqYoHIhhY4c8JNsAJz1nm2CUvm31Da', '', '[St] Frederik Koelpin', 'student', 6, 1, NULL, 0, 1, '27', '64-603-38', 0, 0, '', 0, NULL, NULL, '8013304871', '4649233', 10, 15, '', NULL, '', '027.png', 'Clever', '', 5, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'ghammes', 'josh49@johnson.net', '$2y$10$AIBVcQIb.XquXOy.N1WnT.BSo/lhrcU9h8RTIcHKJ90/IAJJfEqn.', '', '[St] Elissa Ondricka', 'student', 6, 3, NULL, 0, 1, '64', '73-215-99', 0, 0, '', 0, NULL, NULL, '7227172290', '7566669', 7, 11, '', NULL, '', '080.png', 'Pro', '', 15, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'croob', 'rodriguez.elsie@hotmail.com', '$2y$10$F33SSYfd7J.6H0Uwpdqajut4NvvN/xuElyKjpEhHNw6rZxFpf6LxG', '', '[St] Trudie Streich', 'student', 6, 2, NULL, 0, 1, '17', '56-873-61', 0, 0, '', 0, NULL, NULL, '9869898278', '4773768', 3, 23, '', NULL, '', '081.png', 'Pro', '', 8, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'lbatz', 'oheidenreich@nicolas.com', '$2y$10$Qa9ymuAOhmfeA3iXHBYbu.KL5qqvdOtIByTM7cR9YswutBeklZMfu', '', '[St] Prof. Gayle Zboncak DVM', 'student', 6, 4, NULL, 0, 1, '63', '74-935-16', 0, 0, '', 0, NULL, NULL, '3292389480', '6466391', 2, 7, '', NULL, '', '053.png', '', '', 4, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'maryam83', 'ahmed43@adams.com', '$2y$10$IleTr0FjklvNML0YYbsK5OHpj/26719bAqLEd4jYWVNrZblPrh3BS', '', '[St] Gust Kuphal', 'student', 6, 2, NULL, 0, 1, '29', '67-789-91', 0, 0, '', 0, NULL, NULL, '1507045634', '7799980', 9, 1, '', NULL, '', '052.png', 'Captain: Blue House', '', 3, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'kristina.upton', 'tlindgren@von.info', '$2y$10$CE6/eN6A.Km3jxofSlmNDOu9Owf42cGrRnfokHT/U945lDOFufBJK', '', '[St] Giuseppe Weissnat', 'student', 6, 3, NULL, 0, 1, '9', '41-359-76', 0, 0, '', 0, NULL, NULL, '1284667299', '8432443', 5, 24, '', NULL, '', '088.png', '', '', 5, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'irenner', 'gblanda@hotmail.com', '$2y$10$I8fHGbr.wAuxA.3cI/rPJeQtUvmRglMX209xrH3jEvzt836NBxr.K', '', '[St] Maxwell Stracke', 'student', 6, 1, NULL, 0, 1, '55', '30-303-99', 0, 0, '', 0, NULL, NULL, '7742384297', '7448473', 8, 27, '', NULL, '', '025.png', 'Pro', '', 3, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'parent', 'nkoepp@dooley.com', '$2y$10$VNfg.GGQm5iFdGHDlkzUw.9jb40T0/ovJjWGLQ6iMDGtmRTdlSCM6', '', '[Pa] Kacie Terry', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1911706256', '1621425', 4, 5, '', NULL, '[{\"student\":\"[St] Barrett Olson\",\"relation\":\"father\",\"id\":56}]', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(77, 'abbie.hamill', 'kassulke.emmalee@gmail.com', '$2y$10$HFRSioPn7cQXjQ.Th9UjT.kos3cltAZIUN3CJgIfC3OXbPYf5FR9G', '', '[Pa] Miss Angeline Doyle MD', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2916006733', '2737573', 1, 1, '', NULL, '[{\"student\":\"[St] Dahlia Shanahan\",\"relation\":\"father\",\"id\":51}]', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'allen71', 'berge.jovany@hackett.com', '$2y$10$uZW5qvm60pWBhZi4SOi5YeWsVXRGLwKtmdH2zNrDizTid0xvz.Xva', '', '[Pa] Prof. Howard Hermiston', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5506514169', '7181258', 3, 7, '', NULL, '[{\"student\":\"[St] Lauriane Kovacek\",\"relation\":\"father\",\"id\":57}]', '058.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'delphine94', 'chet.hills@hotmail.com', '$2y$10$wqRO1ckq/FOt/hWzyOn0buls6xilsEgWGPl2ETdnJuLTA3kRVrKFy', '', '[Pa] Prof. Joshuah Kassulke', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8215968262', '2920419', 10, 27, '', NULL, '[{\"student\":\"[St] Justyn Collier\",\"relation\":\"father\",\"id\":47}]', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'torey.treutel', 'lkovacek@kassulke.net', '$2y$10$IjgbR5kbUaNOQSCDfq4Qc.i4ssM.SC/ll/WT.rkE3or0eFRn8zEW6', '', '[Pa] Miss Linda Leannon V', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1582092286', '5724422', 2, 28, '', NULL, '[{\"student\":\"[St] Claudine Vandervort\",\"relation\":\"father\",\"id\":67}]', '060.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'mraz.paula', 'odessa.gleichner@zulauf.com', '$2y$10$HPnt376iXLT.8NO0I9Z9vOze99TFuZQvJzeRbHdKcYPhtRWOPMWrO', '', '[Pa] Elisa Jast MD', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4125942417', '5516601', 2, 11, '', NULL, '[{\"student\":\"[St] Henderson Sporer\",\"relation\":\"father\",\"id\":68}]', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'julian18', 'alaina.beier@reinger.org', '$2y$10$LIufZXzYBJPlLRtN3GM4S.u3ncwH378N/YpxpBNrmSHAAvR9GmPsm', '', '[Pa] Chester Klocko', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1314450570', '6279933', 1, 5, '', NULL, '[{\"student\":\"[St] Dahlia Shanahan\",\"relation\":\"father\",\"id\":51}]', '026.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'jameson.corkery', 'hector.trantow@dickens.info', '$2y$10$zs0axBI5S93J2xK4iG5l5eH.R3N3ojU9l517AqPn9nwDH91A4eyny', '', '[Pa] Otis Kihn', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1667765747', '2389391', 9, 6, '', NULL, '[{\"student\":\"[St] Horacio Kertzmann\",\"relation\":\"father\",\"id\":54}]', '036.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'ana18', 'kallie.will@macejkovic.com', '$2y$10$0vLicBephoCoqTLdxyXiOuSIGzSMcWdyGS57NZuNuxHQTc1qZgsvW', '', '[Pa] Gladyce Considine', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5681112511', '9254906', 6, 2, '', NULL, '[{\"student\":\"[St] Dr. Mario Hirthe\",\"relation\":\"father\",\"id\":64}]', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'madilyn.metz', 'telly.mayer@gmail.com', '$2y$10$1fH4nRke8Dwe1Bm3vDs9ZOe//EoNwBFi1rBngpAFhVSDeBmjcYLR.', '', '[Pa] Mr. Rory Rogahn', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6256320919', '5346249', 10, 4, '', NULL, '[{\"student\":\"[St] Estefania Jones\",\"relation\":\"father\",\"id\":49}]', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'liliana.ortiz', 'nbraun@yahoo.com', '$2y$10$Xuuk/RseR2PyeXrHN05rsegBDptQwjc6AIalEfec.lMzc3Td4sKeW', '', '[Pa] Lisa Hartmann III', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2150659944', '6526641', 1, 25, '', NULL, '[{\"student\":\"[St] Gust Kuphal\",\"relation\":\"father\",\"id\":73}]', '034.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'elyssa63', 'columbus.cummerata@rau.info', '$2y$10$Mz/5oiaejjY9r9DKxPsMpeG9Ze7pb7wc/f7HlUs/VJn5M.U2JxBXq', '', '[Pa] Genevieve Glover', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4588938862', '6968933', 6, 21, '', NULL, '[{\"student\":\"[St] Henderson Sporer\",\"relation\":\"father\",\"id\":68}]', '090.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'satterfield.bryana', 'pfannerstill.finn@boyle.org', '$2y$10$RqBlG5A6RId7xPhIfZq44ePUhFWM00FOYpFGHhPNgqDhN1.cwG9F2', '', '[Pa] Creola Kovacek', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1626647938', '7582484', 3, 17, '', NULL, '[{\"student\":\"[St] Maxwell Stracke\",\"relation\":\"father\",\"id\":75}]', '069.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'ikeeling', 'ebony69@yahoo.com', '$2y$10$2RBxlwm7FVUpq.I4DhQX3.ysHuwnaG.uP8dd9ovje4Lhj9CvHpmUu', '', '[Pa] Dr. Bernadette Tromp Jr.', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3198811971', '5380167', 10, 19, '', NULL, '[{\"student\":\"[St] Queen Murphy\",\"relation\":\"father\",\"id\":52}]', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'green.annamae', 'rstokes@hotmail.com', '$2y$10$wr1FQoS4iMyxetzbfgkAS.sYhm/dhm4t7cqKEzx7LrUD0o6Frcr8a', '', '[Pa] Ashlynn Hills', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7780758531', '7945775', 3, 16, '', NULL, '[{\"student\":\"[St] Kiel Russel\",\"relation\":\"father\",\"id\":46}]', '070.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'lyundt', 'uokon@gmail.com', '$2y$10$yla1lsUymVbibfIrbNuGkeTGOhfvc7UOZWV098QqxMwVH0oA56Niq', '', '[Pa] Maddison Bins', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2010373924', '6059539', 7, 9, '', NULL, '[{\"student\":\"[St] Queen Murphy\",\"relation\":\"father\",\"id\":52}]', '05.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'krajcik.tyree', 'cummings.abby@yahoo.com', '$2y$10$Bpzd0nBX8j18EiWuJGs0DuPdAV4X9kfTeFBBP5JmxM5AscQW5VHvW', '', '[Pa] Mrs. Kathryn Raynor', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9200862780', '9360551', 4, 5, '', NULL, '[{\"student\":\"[St] Barrett Olson\",\"relation\":\"father\",\"id\":56}]', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'maynard.hoppe', 'pkeebler@west.com', '$2y$10$R8WeA.Q5iML2tFY1SMJnBuS/G4uPfQHg8eRLQbITTFOabbC5zKsxm', '', '[Pa] Ms. Delphine Mayer', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4441708586', '9558480', 4, 21, '', NULL, '[{\"student\":\"[St] Dayna Rowe\",\"relation\":\"father\",\"id\":53}]', '06.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'drogahn', 'alang@stoltenberg.biz', '$2y$10$2sDUyC6CvtxhzC4puBDBluiaJpO3MKwkKaiCMnlPA5TPiV0HLf0vS', '', '[Pa] Garrett Lebsack', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7289818959', '2608943', 7, 29, '', NULL, '[{\"student\":\"[St] Prof. Shanna Stanton DDS\",\"relation\":\"father\",\"id\":45}]', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'hans24', 'amalia.champlin@yahoo.com', '$2y$10$z4yUpyeef1TNCz3AFVA3QuBcb/qJerL7A7jjLNLZUuSdPQ6bKumPK', '', '[Pa] Sarah Jaskolski', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2662995198', '1186736', 7, 20, '', NULL, '[{\"student\":\"[St] Henderson Sporer\",\"relation\":\"father\",\"id\":68}]', '017.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'ymorar', 'elsa.jerde@wilderman.com', '$2y$10$FWbdryJyS1vxKlAt66.5fOKZK79IBD5OgJBYTgys4USY1MRv/C04y', '', '[Pa] Dr. Jared Ryan DDS', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9630877902', '5852769', 3, 21, '', NULL, '[{\"student\":\"[St] Estefania Jones\",\"relation\":\"father\",\"id\":49}]', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
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
