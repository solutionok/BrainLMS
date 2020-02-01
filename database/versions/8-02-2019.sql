-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2019 at 11:01 AM
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
(1, 'Illum. Class', 2, 1, '[\"38\",\"35\",\"26\",\"32\",\"27\",\"31\",\"39\",\"34\",\"37\",\"30\",\"41\",\"44\"]', ''),
(2, 'Ad. Class', 1, 2, '[\"27\",\"26\",\"36\",\"32\",\"38\",\"39\",\"44\",\"33\",\"34\",\"30\",\"31\",\"24\",\"43\",\"42\",\"25\"]', ''),
(3, 'Inventore. Class', 2, 3, '[\"25\",\"41\",\"30\",\"27\",\"31\",\"26\",\"35\",\"44\",\"36\",\"29\",\"34\",\"43\",\"38\",\"33\"]', ''),
(4, 'Quia. Class', 2, 1, '[\"28\",\"41\",\"31\",\"42\",\"30\",\"29\",\"25\",\"34\",\"43\",\"24\",\"35\",\"37\",\"36\",\"33\"]', '[\"9\",\"4\",\"1\",\"7\",\"2\"]'),
(5, 'Iste quod. Class', 2, 2, '[\"41\",\"24\",\"43\",\"37\",\"40\",\"36\",\"32\",\"39\",\"27\"]', ''),
(6, 'Molestiae repudiandae. Class', 1, 2, '[\"42\",\"32\",\"28\",\"30\",\"40\",\"38\",\"25\",\"31\",\"43\",\"44\",\"24\",\"27\",\"35\",\"33\"]', '[\"1\",\"4\",\"7\",\"3\",\"6\"]'),
(7, 'Molestias maiores. Class', 2, 2, '[\"36\",\"33\",\"24\",\"29\",\"38\",\"27\",\"31\",\"42\",\"30\"]', '[\"7\",\"6\",\"5\",\"4\",\"9\",\"3\"]'),
(8, 'Odit voluptates. Class', 2, 2, '[\"36\",\"30\",\"26\",\"42\",\"41\",\"40\"]', '');

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
(1, 'Autem voluptatem necessitatibus.', 'A et et nostrum velit ea reiciendis reprehenderit vel ad.', 'students', 'architecto', '', 0, '1564785507'),
(2, 'Quod ut ut.', 'Quae dolor earum eos.', 'teacher', 'architecto', '', 1, '1563575907'),
(3, 'Quaerat provident porro voluptate.', 'Est minima qui rerum corporis sit earum facere nesciunt qui.', 'parents', 'repellat', '', 1, '1565908707'),
(4, 'Deleniti commodi impedit possimus.', 'Pariatur cum laudantium fugiat voluptates quia rerum.', 'teacher', 'voluptatem', '', 1, '1565563107'),
(5, 'Magni eum laudantium delectus.', 'Sint cumque ut porro ipsam dolorem sequi.', 'teacher', 'aliquam', '', 0, '1564353507'),
(6, 'Beatae modi.', 'Veritatis earum est commodi quo pariatur enim.', 'students', 'omnis', '', 0, '1564007907'),
(7, 'Enim sapiente debitis iusto.', 'Cupiditate esse quos minima deleniti vel deserunt velit.', 'students', 'iusto', '', 0, '1563489507'),
(8, 'Fuga velit officiis iste qui.', 'Tempore soluta aliquam totam aut nesciunt tenetur quibusdam illum consequuntur excepturi quia.', 'students', 'hic', '', 1, '1563921507'),
(9, 'Sapiente quas ipsa.', 'Natus nobis vitae itaque alias veniam qui quasi itaque excepturi soluta et beatae.', 'all', 'nam', '', 1, '1563403107'),
(10, 'Magni voluptatibus qui.', 'Perferendis neque ut id dolorem iusto.', 'students', 'libero', '', 1, '1565476707'),
(11, 'Inventore quasi qui.', 'Ut necessitatibus sequi explicabo quisquam ipsum deleniti.', 'parents', 'consequuntur', '', 0, '1564094307'),
(12, 'Sit consequatur non saepe ut sit.', 'Dignissimos voluptatibus reprehenderit ut voluptas accusamus maiores autem ab voluptatem voluptatem suscipit.', 'teacher', 'vero', '', 1, '1565303907'),
(13, 'Harum asperiores molestiae voluptas.', 'Aliquid expedita aut dolores nihil optio minus velit excepturi.', 'students', 'nostrum', '', 1, '1565735907'),
(14, 'Sint quis unde repudiandae.', 'Enim atque perferendis quidem praesentium doloremque officiis iusto unde culpa ullam.', 'parents', 'aut', '', 0, '1564612707'),
(15, 'Neque iste accusamus dignissimos ut.', 'Ut possimus impedit itaque repellat reiciendis dolor dolorem.', 'all', 'molestiae', '', 1, '1565822307'),
(16, 'Non quo explicabo.', 'Libero nulla rem ipsam eum debitis.', 'parents', 'inventore', '', 1, '1563403107'),
(17, 'Voluptatem ut voluptates.', 'Sunt consequatur quo et quod accusantium sapiente.', 'all', 'est', '', 1, '1565995107'),
(18, 'Velit qui.', 'Autem molestiae quis voluptate ea quia minima quaerat.', 'students', 'ex', '', 1, '1565822307'),
(19, 'Corporis dolorem eveniet laudantium.', 'Corporis maiores veritatis eveniet est ipsa voluptatum ipsam possimus unde.', 'parents', 'laudantium', '', 1, '1565822307'),
(20, 'Illum dolorum est.', 'Velit fuga quaerat dolor porro et est enim.', 'teacher', 'saepe', '', 0, '1564267107'),
(21, 'Nemo optio reiciendis.', 'Amet nihil accusamus aliquid ea dolores fugiat quia qui possimus.', 'parents', 'quidem', '', 0, '1564267107'),
(22, 'Velit veritatis excepturi deleniti adipisci.', 'Esse ea exercitationem temporibus laboriosam nisi facere sint.', 'students', 'officiis', '', 1, '1564180707'),
(23, 'Eveniet magni impedit.', 'Ab cumque voluptatibus nemo numquam qui molestiae commodi fuga.', 'parents', 'magnam', '', 0, '1564439907'),
(24, 'Hic esse quas.', 'Animi facere nihil maxime et tempora distinctio quis aliquam eum officiis recusandae voluptatem aut.', 'students', 'ex', '', 1, '1564353507'),
(25, 'Qui magnam tempora doloribus.', 'Facere est totam asperiores qui error.', 'teacher', 'animi', '', 0, '1564007907'),
(26, 'Omnis qui.', 'Magnam ratione velit ab eos ad laborum.', 'students', 'placeat', '', 1, '1564612707'),
(27, 'Rerum maxime.', 'Est laboriosam a vel praesentium sit alias exercitationem debitis.', 'all', 'qui', '', 1, '1564180707'),
(28, 'Architecto et veniam dolore.', 'Magni qui unde praesentium voluptatum tempore veritatis voluptates qui.', 'students', 'vero', '', 0, '1564439907'),
(29, 'Quo quos sunt.', 'Quaerat officia repudiandae ut dolores.', 'parents', 'aliquid', '', 0, '1564007907'),
(30, 'Corrupti quam esse velit cumque.', 'Explicabo minus odit reiciendis labore.', 'students', 'neque', '', 1, '1565822307'),
(31, 'Quo itaque repellat ratione.', 'Alias rerum voluptatem qui dolorem.', 'parents', 'perferendis', '', 0, '1565649507'),
(32, 'Corrupti voluptatem non reprehenderit eos.', 'Aut quasi nemo velit et ut soluta.', 'teacher', 'aperiam', '', 0, '1564526307'),
(33, 'Occaecati ullam sint voluptatem.', 'Ut corrupti ut veniam est nulla eos.', 'parents', 'quia', '', 1, '1565390307'),
(34, 'Fugit aut possimus.', 'Repellat distinctio aut fugit sed culpa neque qui tempore est id eveniet delectus voluptatibus voluptatum in.', 'students', 'doloremque', '', 0, '1565476707'),
(35, 'Dolorum velit sed.', 'Molestiae labore facere error magni vero.', 'all', 'est', '', 0, '1564439907'),
(36, 'Ab expedita et aut dolore.', 'Voluptatem et commodi itaque quibusdam doloremque et repellat ex est corporis.', 'parents', 'ut', '', 0, '1564612707'),
(37, 'Enim illum aut consectetur.', 'Est soluta dicta provident repellendus perferendis ea quidem ea.', 'students', 'deleniti', '', 0, '1565563107'),
(38, 'Accusamus velit quia.', 'Aspernatur repellat voluptas quibusdam ut quia similique consequatur et odit debitis saepe beatae.', 'parents', 'dolore', '', 0, '1564526307'),
(39, 'Unde voluptas itaque blanditiis.', 'Perferendis consectetur ducimus aliquam.', 'teacher', 'in', '', 0, '1565822307'),
(40, 'Sit illum maiores cupiditate rem.', 'Magni praesentium sequi est dolor neque eius.', 'students', 'harum', '', 0, '1565822307'),
(41, 'Cumque sint enim aperiam voluptatem.', 'Est qui explicabo similique dicta ut quos aut.', 'all', 'totam', '', 0, '1563921507'),
(42, 'Praesentium quasi consequuntur.', 'Alias repudiandae delectus distinctio sunt ab.', 'parents', 'voluptatem', '', 1, '1565131107'),
(43, 'Voluptas fugiat praesentium.', 'Earum ut cum nesciunt nobis omnis labore ut.', 'teacher', 'est', '', 0, '1564180707'),
(44, 'Amet debitis fuga.', 'Nobis omnis neque aut aut qui.', 'all', 'nihil', '', 0, '1564958307'),
(45, 'Dolore et vero repudiandae.', 'Dolores nobis ut quisquam tempore in est.', 'teacher', 'magni', '', 1, '1563662307'),
(46, 'Et et voluptatibus odio natus magnam.', 'Quia totam et minima quia.', 'teacher', 'sequi', '', 0, '1565735907'),
(47, 'Perferendis non iusto.', 'Et et ducimus magni iste ut harum sed non.', 'all', 'ut', '', 0, '1565908707'),
(48, 'Ea assumenda nemo.', 'Ab error aut quia et laborum accusantium saepe aperiam autem.', 'teacher', 'non', '', 1, '1564267108'),
(49, 'Quidem esse impedit.', 'Veritatis molestiae fugiat quaerat laboriosam molestiae quod.', 'parents', 'voluptatem', '', 1, '1565390308'),
(50, 'Quo occaecati cupiditate.', 'Neque amet quae et magnam nihil aut totam labore rerum laborum et voluptatum architecto ut dolor.', 'parents', 'voluptate', '', 0, '1565303908');

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
(1, 'Sed corrupti.', '', '', '1564699127', 1564007927, 0, '[\"4\"]', '[\"16\"]', '', 6, 29),
(2, 'Placeat sed.', '', '', '1564699127', 1563403127, 0, '[\"6\",\"3\",\"4\"]', '[\"23\",\"24\",\"15\"]', '', 4, 41),
(3, 'Numquam reiciendis explicabo.', '', '', '1564699127', 1565822327, 0, '[\"3\",\"2\"]', '[\"17\",\"38\"]', '', 4, 34),
(4, 'Occaecati voluptas.', '', '', '1564699127', 1564871927, 0, '[\"8\"]', '[\"30\",\"23\"]', '', 5, 29),
(5, 'Et voluptas minima.', '', '', '1564699127', 1565908727, 0, '[\"3\"]', '[\"43\",\"46\"]', '', 3, 32),
(6, 'Illum nulla.', '', '', '1564699127', 1564612727, 0, '[\"3\",\"8\"]', '[\"25\"]', '', 1, 44),
(7, 'Quidem totam.', '', '', '1564699127', 1564267127, 0, '[\"5\",\"7\"]', '[\"45\"]', '', 10, 37),
(8, 'Voluptatum nulla.', '', '', '1564699127', 1563403127, 0, '[\"2\",\"4\"]', '[\"53\",\"35\"]', '', 3, 29),
(9, 'Facere.', '', '', '1564699127', 1565044727, 0, '[\"1\",\"4\"]', '[\"60\"]', '', 10, 30),
(10, 'Rem quisquam.', '', '', '1564699127', 1565476727, 0, '[\"1\"]', '[\"13\",\"46\"]', '', 9, 36),
(11, 'Quo.', '', '', '1564699127', 1564267127, 0, '[\"5\",\"6\",\"3\"]', '[\"5\",\"44\"]', '', 4, 34),
(12, 'Est fugit.', '', '', '1564699128', 1565217528, 0, '[\"5\",\"7\",\"2\"]', '[\"27\"]', '', 1, 37),
(13, 'Nihil sint aut.', '', '', '1564699128', 1564785528, 0, '[\"3\",\"2\",\"5\"]', '[\"41\"]', '', 4, 44),
(14, 'Voluptas qui.', '', '', '1564699128', 1563489528, 0, '[\"2\"]', '[\"31\",\"49\",\"50\"]', '', 6, 42),
(15, 'Esse tempore.', '', '', '1564699128', 1563403128, 0, '[\"6\",\"5\",\"8\"]', '[\"15\",\"35\",\"52\"]', '', 8, 40);

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
(1, 'Alisha Kuphal', 'quia', 'Expedita molestias eum dolorem ut et placeat et.', '1564699108', 'Adolfo Muller'),
(2, 'Anissa Kerluke', 'consequatur', 'Ea dicta error eius aut.', '1564699108', 'Miss Mafalda Yundt'),
(3, 'Immanuel Kuhlman', 'consequatur', 'Modi cupiditate et hic omnis similique ratione nihil aut.', '1564699108', 'Dr. Beverly Brekke'),
(4, 'Zelma Volkman', 'nam', 'Ratione et porro et omnis unde.', '1564699108', 'Claudine Von'),
(5, 'Prof. Kathryne Stiedemann DDS', 'fuga', 'Ut at est eos perspiciatis praesentium qui.', '1564699108', 'Cristina Casper'),
(6, 'Melany Abbott I', 'reprehenderit', 'Ratione inventore quidem sequi ut.', '1564699108', 'Vita Fay'),
(7, 'Horace Parisian', 'aut', 'Qui quae a quis quis nihil perspiciatis id perferendis libero quo.', '1564699108', 'Bonnie Douglas IV'),
(8, 'Ms. Adrienne Maggio III', 'enim', 'Amet temporibus id et perspiciatis saepe soluta eaque non est voluptatem a.', '1564699108', 'Hope Collier'),
(9, 'Allen Kris', 'impedit', 'Qui nobis vel et illo.', '1564699108', 'Shyanne Bahringer'),
(10, 'Kelli Schaefer', 'assumenda', 'Numquam voluptatem atque enim assumenda et dolor nemo.', '1564699108', 'Mr. Kacey Purdy Jr.'),
(11, 'Carolanne Gutkowski', 'et', 'Ut ex quos quo distinctio.', '1564699108', 'Loraine Hessel'),
(12, 'Mireya Herman Sr.', 'voluptatem', 'Dolor est voluptas tenetur ut.', '1564699108', 'Vincenzo Rolfson'),
(13, 'Mrs. Retha Brakus I', 'repellat', 'Ut nihil non vitae nam libero.', '1564699108', 'Dr. Maya Reinger MD'),
(14, 'Reed Gerlach', 'odio', 'Illo minus qui odio dolore dolorem molestias totam.', '1564699108', 'Mr. Anthony Ullrich V'),
(15, 'Ms. Marisa Rempel II', 'repellendus', 'Dicta facilis ducimus quis.', '1564699108', 'Mrs. Alene Davis I'),
(16, 'Erling Hessel', 'et', 'Qui voluptas et est molestias minima non soluta et molestias.', '1564699108', 'Alfred Kemmer DDS'),
(17, 'Prof. Reid Hoppe', 'sit', 'Officiis dolores occaecati vel alias rerum.', '1564699108', 'Tessie McKenzie I'),
(18, 'Mattie Schultz', 'laborum', 'Minima vel eius earum adipisci dolor fuga.', '1564699108', 'Dr. Maiya O\'Hara'),
(19, 'Serena Fadel Sr.', 'aliquam', 'Ipsum assumenda totam iste ipsa cumque consequatur molestias.', '1564699108', 'Marion Balistreri'),
(20, 'Prof. Vern Senger PhD', 'dolore', 'Architecto dicta saepe doloremque.', '1564699108', 'Dr. Julian Will PhD'),
(21, 'Granville Wehner', 'in', 'Et distinctio sed recusandae possimus.', '1564699108', 'Sally Hayes Jr.'),
(22, 'Betsy Marquardt V', 'dolorem', 'Similique dolor debitis.', '1564699108', 'Dr. Harvey Walsh I'),
(23, 'Layla Lind', 'voluptas', 'Eum et minima porro illo iusto.', '1564699108', 'Prof. Kathryn Heller III'),
(24, 'Dr. Lewis Beatty', 'explicabo', 'Rerum architecto molestiae id earum est.', '1564699108', 'Jarrett Roob'),
(25, 'Dr. Amalia Miller DDS', 'facere', 'Veniam possimus ad doloribus eum qui omnis.', '1564699108', 'Dr. Roman Hilpert Jr.'),
(26, 'Meaghan Wisoky', 'distinctio', 'Maxime doloremque at inventore facilis optio soluta architecto voluptate aperiam repellat.', '1564699108', 'Sylvia Carroll'),
(27, 'Dr. Lucinda Daugherty III', 'magni', 'Blanditiis impedit et quo dolores necessitatibus.', '1564699108', 'Emilie Beer'),
(28, 'Mr. Deangelo Senger', 'aut', 'Laudantium quas eum est veritatis autem enim mollitia quos.', '1564699108', 'Taylor Collins'),
(29, 'Dr. Kaden Cartwright', 'nihil', 'Itaque sit sequi quia magni laboriosam.', '1564699108', 'Kaya Fahey'),
(30, 'Dr. Alexa Kerluke PhD', 'amet', 'Enim voluptatem doloribus commodi ullam optio aliquid non omnis.', '1564699108', 'Cathryn Lubowitz'),
(31, 'Bartholome Schimmel', 'fugit', 'Natus qui neque distinctio et.', '1564699108', 'Marshall Kuhlman'),
(32, 'Ada Kling', 'modi', 'Ut earum distinctio ex aspernatur dolor.', '1564699108', 'Maureen Denesik'),
(33, 'Prof. Bill Runolfsdottir', 'alias', 'Aliquam amet esse architecto molestias veniam facere totam.', '1564699108', 'Hyman Keeling'),
(34, 'Hazle Trantow', 'sunt', 'Eum voluptas dolores quidem voluptas sint quo.', '1564699108', 'Mrs. Leonie Cummerata'),
(35, 'Prof. Leonard Ryan I', 'ex', 'Illum ad et dolorem distinctio aliquid quos.', '1564699108', 'Guillermo Schimmel IV'),
(36, 'Vickie Bechtelar', 'impedit', 'Voluptatum sint quia qui eligendi impedit.', '1564699108', 'Kaycee Price'),
(37, 'Russell Ruecker', 'eum', 'Voluptatem et eveniet excepturi et odit.', '1564699108', 'Ms. Valentine Stracke MD'),
(38, 'Amiya Schowalter', 'aut', 'Delectus iusto est ratione voluptatem ex et perferendis.', '1564699108', 'Wyman Lowe'),
(39, 'Hyman Gleason', 'assumenda', 'Deleniti blanditiis ut eius hic ab ut.', '1564699108', 'Joesph Feil'),
(40, 'Andres Beahan MD', 'vitae', 'Laborum asperiores officia fuga molestias sapiente voluptatem ipsum.', '1564699108', 'Deon Carroll DVM'),
(41, 'Jonas Kuvalis', 'molestiae', 'Deserunt in ex fugit cupiditate qui inventore amet a.', '1564699108', 'Willa Muller Sr.'),
(42, 'Jamar Will', 'perspiciatis', 'Fuga et eligendi perferendis dolorem deleniti in quae ad quasi.', '1564699108', 'Ms. Leda Harvey II'),
(43, 'Ms. Althea Pouros', 'ex', 'Ut impedit recusandae aut dolores ut.', '1564699108', 'Paul Hammes'),
(44, 'Maverick Feil', 'qui', 'Beatae corrupti similique ratione.', '1564699108', 'Jarret Ferry'),
(45, 'Sadie Kozey', 'qui', 'Repellat placeat nihil repellendus sint sit.', '1564699108', 'Mireille Kassulke'),
(46, 'Jarod Boehm', 'magnam', 'Debitis quia nesciunt ut.', '1564699108', 'Dr. Edison Christiansen'),
(47, 'Nathen Jerde', 'aperiam', 'Est vel voluptatem corporis sit.', '1564699108', 'Dell Kemmer PhD'),
(48, 'Leonel Johnson', 'animi', 'Deserunt eum quam quisquam dolorum excepturi tenetur ipsa sit dignissimos.', '1564699108', 'Leo Watsica'),
(49, 'Dr. Cordell Macejkovic', 'quia', 'Enim dolore non sed ipsum sunt ex est cumque.', '1564699108', 'Ozella Parker MD'),
(50, 'Barton Koss', 'libero', 'Sint et perspiciatis nam eum quaerat ratione.', '1564699108', 'Orin Cremin');

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
(1, 'Non porro.', '1564699109', 1, 1, 75, 40, 57),
(2, 'Tenetur pariatur.', '1564699109', 1, 2, 95, 91, 19),
(3, 'Rem enim eum consequatur debitis.', '1564699109', 0, 3, 24, 5, 85),
(4, 'Qui explicabo.', '1564699109', 0, 4, 80, 71, 50),
(5, 'Incidunt at nobis excepturi.', '1564699109', 1, 5, 16, 4, 88),
(6, 'Laudantium sint qui vero.', '1564699109', 0, 6, 6, 93, 37),
(7, 'Laboriosam quia.', '1564699109', 0, 7, 13, 24, 91),
(8, 'Magnam commodi.', '1564699109', 0, 8, 17, 26, 40),
(9, 'Illo qui quam dolorem.', '1564699109', 1, 9, 19, 22, 80),
(10, 'Animi velit.', '1564699109', 0, 10, 2, 19, 91),
(11, 'Quibusdam nam et.', '1564699109', 1, 11, 68, 73, 74),
(12, 'Quaerat et.', '1564699109', 0, 12, 76, 42, 86),
(13, 'Et officiis esse quasi consequatur.', '1564699109', 0, 13, 3, 94, 18),
(14, 'Rerum est illum quod fuga ratione.', '1564699109', 0, 14, 28, 87, 10),
(15, 'Voluptatem assumenda.', '1564699109', 0, 15, 76, 38, 33),
(16, 'Nesciunt voluptas repellendus.', '1564699109', 0, 16, 48, 26, 65),
(17, 'Voluptatem necessitatibus.', '1564699109', 1, 17, 71, 96, 58),
(18, 'Harum nesciunt temporibus.', '1564699109', 0, 18, 73, 91, 63),
(19, 'Laborum velit exercitationem.', '1564699109', 0, 19, 15, 4, 34),
(20, 'Ut aspernatur voluptatem deserunt.', '1564699109', 1, 20, 10, 14, 55),
(21, 'Molestiae cum nemo dolorem.', '1564699109', 1, 21, 13, 88, 62),
(22, 'Perferendis nisi nisi.', '1564699109', 1, 22, 66, 41, 61),
(23, 'Suscipit sed sint.', '1564699109', 0, 23, 62, 10, 93),
(24, 'Qui tenetur quo optio et.', '1564699109', 1, 24, 25, 45, 81),
(25, 'Explicabo occaecati.', '1564699109', 0, 25, 86, 77, 58),
(26, 'Inventore quis.', '1564699109', 1, 26, 33, 26, 66),
(27, 'Est ut.', '1564699109', 1, 27, 18, 50, 45),
(28, 'Fugiat blanditiis rem ab.', '1564699109', 0, 28, 79, 25, 83),
(29, 'Alias molestiae.', '1564699109', 0, 29, 85, 26, 82),
(30, 'Nihil et.', '1564699109', 0, 30, 46, 56, 30),
(31, 'Possimus quod.', '1564699109', 0, 31, 88, 7, 94),
(32, 'Quod iste.', '1564699109', 1, 32, 17, 63, 94),
(33, 'Dignissimos dolorem necessitatibus quidem.', '1564699109', 1, 33, 94, 57, 48),
(34, 'Earum cupiditate unde.', '1564699109', 0, 34, 92, 65, 87),
(35, 'Eos sunt iste.', '1564699109', 1, 35, 90, 33, 9),
(36, 'Inventore nesciunt magnam eos omnis.', '1564699109', 1, 36, 40, 35, 3),
(37, 'Odio necessitatibus tenetur totam quia.', '1564699109', 1, 37, 78, 34, 94),
(38, 'Occaecati nihil asperiores quis.', '1564699109', 1, 38, 13, 39, 52),
(39, 'Eveniet voluptatem.', '1564699109', 0, 39, 82, 17, 16),
(40, 'Molestias dolores nemo voluptatem qui.', '1564699109', 0, 40, 68, 26, 45),
(41, 'Repellendus ipsa.', '1564699109', 0, 41, 72, 12, 65),
(42, 'Facilis molestiae.', '1564699110', 0, 42, 52, 77, 87),
(43, 'Eos est et et quae.', '1564699110', 1, 43, 70, 85, 15),
(44, 'Et mollitia inventore deleniti.', '1564699110', 1, 44, 93, 43, 3),
(45, 'Praesentium molestiae sed.', '1564699110', 0, 45, 71, 75, 78),
(46, 'Sunt unde aliquid omnis.', '1564699110', 0, 46, 72, 79, 63),
(47, 'Beatae ipsam incidunt vitae repudiandae porro.', '1564699110', 0, 47, 70, 52, 78),
(48, 'Beatae ipsam officia.', '1564699110', 0, 48, 12, 76, 41),
(49, 'Ut.', '1564699110', 1, 49, 26, 53, 24),
(50, 'Natus quia praesentium.', '1564699110', 1, 50, 15, 23, 7),
(51, 'Repellat dolore eius.', '1564699110', 0, 51, 80, 22, 55),
(52, 'Veniam esse.', '1564699110', 0, 52, 69, 71, 58),
(53, 'Voluptatibus aut quia.', '1564699110', 1, 53, 25, 96, 78),
(54, 'Aut repellat animi repellendus fugiat.', '1564699110', 0, 54, 8, 86, 66),
(55, 'Totam rerum.', '1564699110', 1, 55, 54, 46, 39),
(56, 'Eos autem.', '1564699110', 1, 56, 12, 2, 86),
(57, 'Sit suscipit atque voluptatem omnis.', '1564699110', 0, 57, 7, 74, 84),
(58, 'Perspiciatis et animi.', '1564699110', 0, 58, 65, 36, 71),
(59, 'Ipsum eligendi ex rerum repudiandae.', '1564699110', 1, 59, 90, 14, 88),
(60, 'Et.', '1564699110', 0, 60, 88, 30, 37),
(61, 'Eaque eos voluptate voluptas.', '1564699110', 1, 61, 96, 50, 76),
(62, 'Tenetur.', '1564699110', 1, 62, 85, 24, 96),
(63, 'Enim.', '1564699110', 1, 63, 6, 50, 53),
(64, 'Et et.', '1564699110', 1, 64, 40, 31, 45),
(65, 'Et animi non.', '1564699110', 1, 65, 44, 86, 76),
(66, 'Atque adipisci error laboriosam voluptate.', '1564699110', 1, 66, 47, 89, 2),
(67, 'Nihil non.', '1564699110', 1, 67, 54, 63, 24),
(68, 'Nihil et consequatur.', '1564699110', 0, 68, 78, 73, 37),
(69, 'Omnis a.', '1564699110', 0, 69, 90, 16, 79),
(70, 'Fugit animi odit omnis nemo.', '1564699110', 0, 70, 81, 67, 61),
(71, 'Vero expedita.', '1564699110', 0, 71, 44, 48, 9),
(72, 'Eos quidem earum ut.', '1564699110', 0, 72, 86, 43, 92),
(73, 'Consequatur.', '1564699110', 1, 73, 41, 68, 89),
(74, 'Rerum rerum minima commodi in sequi.', '1564699110', 0, 74, 78, 60, 41),
(75, 'Minima soluta animi ea harum qui.', '1564699110', 0, 75, 66, 83, 10),
(76, 'Omnis error.', '1564699110', 1, 76, 92, 39, 4),
(77, 'Voluptatem rerum dolorem ut.', '1564699110', 1, 77, 19, 82, 42),
(78, 'Ipsam explicabo quod.', '1564699110', 0, 78, 38, 44, 88),
(79, 'Consequuntur ut.', '1564699110', 1, 79, 11, 81, 61),
(80, 'Nihil alias.', '1564699110', 0, 80, 5, 42, 4),
(81, 'Officiis.', '1564699110', 0, 81, 91, 76, 63),
(82, 'Nobis ducimus eveniet.', '1564699110', 0, 82, 7, 60, 46),
(83, 'Adipisci eveniet repellendus.', '1564699110', 0, 83, 15, 90, 50),
(84, 'At harum ea maxime.', '1564699110', 0, 84, 54, 6, 79),
(85, 'Dolores est.', '1564699110', 1, 85, 55, 83, 32),
(86, 'Molestias voluptatem nam.', '1564699110', 0, 86, 62, 16, 5),
(87, 'Asperiores est necessitatibus et.', '1564699110', 1, 87, 57, 55, 48),
(88, 'Quasi.', '1564699110', 0, 88, 11, 77, 9),
(89, 'Quidem tenetur recusandae.', '1564699110', 1, 89, 50, 36, 58),
(90, 'Possimus.', '1564699110', 1, 90, 40, 2, 16),
(91, 'Aliquid recusandae.', '1564699110', 0, 91, 27, 44, 35),
(92, 'Fugiat quia voluptatem nihil.', '1564699110', 1, 92, 60, 41, 17),
(93, 'Deserunt est.', '1564699110', 0, 93, 28, 52, 61),
(94, 'Et.', '1564699110', 1, 94, 92, 11, 1),
(95, 'Sint.', '1564699110', 1, 95, 45, 42, 12),
(96, 'Dolore.', '1564699110', 0, 96, 92, 16, 33),
(97, 'Tempore aliquid assumenda doloribus.', '1564699110', 0, 97, 32, 12, 72),
(98, 'Dicta ducimus.', '1564699110', 0, 98, 82, 19, 54),
(99, 'Voluptatibus mollitia.', '1564699110', 1, 99, 26, 19, 75),
(100, 'Aspernatur vero eos rerum nihil.', '1564699110', 0, 100, 22, 60, 28),
(101, 'Saepe unde sapiente omnis.', '1564699110', 0, 101, 30, 48, 1),
(102, 'Laboriosam unde sed.', '1564699110', 0, 102, 27, 82, 90),
(103, 'Impedit sint quam fugiat sit.', '1564699110', 0, 103, 65, 76, 55),
(104, 'Culpa quis numquam quos ea fugiat.', '1564699110', 1, 104, 64, 86, 27),
(105, 'Velit nostrum eos et.', '1564699110', 0, 105, 71, 91, 10),
(106, 'Recusandae magnam fuga voluptatem.', '1564699110', 1, 106, 5, 83, 11),
(107, 'Iste blanditiis.', '1564699110', 0, 107, 54, 21, 32),
(108, 'Nihil ea magnam error.', '1564699110', 1, 108, 67, 74, 14),
(109, 'Natus.', '1564699110', 1, 109, 85, 22, 43),
(110, 'Qui magni mollitia.', '1564699110', 1, 110, 18, 25, 70),
(111, 'Quo iure pariatur qui.', '1564699110', 1, 111, 39, 80, 68),
(112, 'Delectus tenetur hic.', '1564699110', 1, 112, 45, 30, 58),
(113, 'Sint aspernatur eos accusantium quos.', '1564699110', 0, 113, 75, 8, 23),
(114, 'Sit voluptas.', '1564699110', 1, 114, 39, 58, 51),
(115, 'Voluptatem minima aut occaecati illum animi.', '1564699110', 1, 115, 87, 35, 24),
(116, 'Quia officiis aperiam et.', '1564699110', 0, 116, 4, 13, 13),
(117, 'Eaque.', '1564699110', 1, 117, 10, 91, 89),
(118, 'Consequatur sed ipsa vitae et.', '1564699111', 0, 118, 20, 69, 76),
(119, 'Ut in et.', '1564699111', 1, 119, 17, 75, 48),
(120, 'Animi nihil fugiat quas sint voluptatem.', '1564699111', 1, 120, 17, 96, 60),
(121, 'Et.', '1564699111', 1, 121, 9, 86, 55),
(122, 'Tempore.', '1564699111', 1, 122, 41, 40, 4),
(123, 'Sed.', '1564699111', 0, 123, 11, 33, 32),
(124, 'Nobis qui facilis minima.', '1564699111', 1, 124, 88, 64, 2),
(125, 'Aut a sunt.', '1564699111', 0, 125, 4, 80, 73),
(126, 'Quas consectetur.', '1564699111', 0, 126, 30, 79, 16),
(127, 'Saepe.', '1564699111', 1, 127, 53, 49, 56),
(128, 'Neque nihil aut consequatur.', '1564699111', 1, 128, 32, 52, 64),
(129, 'Nemo aut.', '1564699111', 0, 129, 48, 12, 16),
(130, 'Qui sed quia.', '1564699111', 1, 130, 44, 37, 21),
(131, 'Magnam sed atque ratione.', '1564699111', 1, 131, 87, 24, 17),
(132, 'Non enim nobis.', '1564699111', 0, 132, 39, 50, 50),
(133, 'Fugit deleniti iusto.', '1564699111', 1, 133, 95, 84, 79),
(134, 'Incidunt ipsa nihil necessitatibus.', '1564699111', 0, 134, 37, 77, 5),
(135, 'Qui quia.', '1564699111', 0, 135, 76, 53, 13),
(136, 'Quis neque qui.', '1564699111', 1, 136, 64, 92, 71),
(137, 'Voluptatibus sequi.', '1564699111', 0, 137, 20, 50, 65),
(138, 'Aut quo.', '1564699111', 0, 138, 63, 56, 13),
(139, 'Veritatis sunt sint.', '1564699111', 0, 139, 3, 49, 59),
(140, 'Sunt.', '1564699111', 0, 140, 9, 82, 83),
(141, 'Esse optio est.', '1564699111', 0, 141, 93, 90, 20),
(142, 'Pariatur.', '1564699111', 1, 142, 63, 63, 90),
(143, 'Qui ut consequuntur.', '1564699111', 0, 143, 23, 53, 71),
(144, 'Aut tempore qui et possimus.', '1564699111', 1, 144, 94, 34, 61),
(145, 'Repudiandae in laborum.', '1564699111', 0, 145, 44, 95, 49),
(146, 'Nobis iusto enim.', '1564699111', 0, 146, 30, 8, 90),
(147, 'In numquam.', '1564699111', 1, 147, 44, 15, 51),
(148, 'Sit quibusdam.', '1564699111', 1, 148, 20, 72, 27),
(149, 'Itaque hic.', '1564699111', 1, 149, 80, 92, 10),
(150, 'Corporis sequi quibusdam.', '1564699111', 1, 150, 9, 47, 59),
(151, 'Nihil.', '1564699111', 0, 151, 64, 3, 56),
(152, 'Est incidunt provident ex.', '1564699111', 1, 152, 40, 16, 22),
(153, 'Maiores.', '1564699111', 0, 153, 47, 12, 50),
(154, 'Doloribus explicabo sint et.', '1564699111', 1, 154, 48, 31, 95),
(155, 'Aut vero.', '1564699111', 1, 155, 90, 73, 45),
(156, 'Velit aspernatur omnis consequuntur.', '1564699111', 0, 156, 93, 28, 39),
(157, 'Modi et.', '1564699111', 1, 157, 1, 48, 60),
(158, 'Non.', '1564699111', 1, 158, 2, 23, 74),
(159, 'Cumque.', '1564699111', 1, 159, 62, 46, 76),
(160, 'Et ad deserunt.', '1564699111', 0, 160, 90, 76, 23),
(161, 'Officia animi aut.', '1564699111', 0, 161, 79, 18, 49),
(162, 'Debitis sed ut cumque.', '1564699111', 0, 162, 60, 3, 77),
(163, 'Repudiandae eum voluptatum.', '1564699111', 1, 163, 1, 81, 65),
(164, 'Laboriosam porro omnis dignissimos provident.', '1564699111', 1, 164, 41, 21, 24),
(165, 'Mollitia id.', '1564699111', 0, 165, 94, 23, 32),
(166, 'Est tempore et aut autem.', '1564699111', 0, 166, 84, 50, 2),
(167, 'Voluptates doloribus aut.', '1564699111', 0, 167, 78, 38, 92),
(168, 'Eveniet laboriosam.', '1564699111', 0, 168, 20, 16, 46),
(169, 'Ut totam itaque et praesentium.', '1564699111', 0, 169, 45, 24, 12),
(170, 'Et quo nulla molestiae.', '1564699111', 0, 170, 58, 38, 70),
(171, 'Vel ut numquam.', '1564699111', 0, 171, 28, 11, 55),
(172, 'Consequatur aut labore sed.', '1564699111', 1, 172, 40, 30, 70),
(173, 'Odit et consequatur qui.', '1564699111', 0, 173, 44, 11, 62),
(174, 'Ut exercitationem qui.', '1564699111', 0, 174, 55, 43, 76),
(175, 'Nisi reprehenderit perspiciatis.', '1564699111', 0, 175, 91, 65, 13),
(176, 'Ut ratione est ducimus perferendis enim.', '1564699111', 0, 176, 87, 62, 16),
(177, 'Nostrum a.', '1564699111', 0, 177, 8, 48, 27),
(178, 'Assumenda libero a.', '1564699111', 1, 178, 21, 93, 16),
(179, 'Possimus aut sed velit.', '1564699111', 1, 179, 73, 16, 89),
(180, 'Excepturi dolorem.', '1564699111', 1, 180, 31, 69, 42),
(181, 'Rem aut sunt.', '1564699111', 0, 181, 96, 60, 71),
(182, 'Id ut eveniet eos facere saepe.', '1564699111', 0, 182, 72, 52, 51),
(183, 'Amet aut.', '1564699111', 0, 183, 21, 67, 31),
(184, 'Maxime nostrum.', '1564699111', 0, 184, 95, 89, 2),
(185, 'Qui consequatur nobis.', '1564699111', 0, 185, 69, 38, 66),
(186, 'Molestiae repellat provident aspernatur ea.', '1564699111', 0, 186, 95, 16, 78),
(187, 'Autem.', '1564699111', 0, 187, 1, 9, 87),
(188, 'Incidunt in saepe aliquid.', '1564699111', 0, 188, 15, 7, 91),
(189, 'Ex in.', '1564699111', 1, 189, 51, 6, 88),
(190, 'Possimus ex est hic et.', '1564699111', 0, 190, 36, 87, 67),
(191, 'Iste reprehenderit aut.', '1564699111', 1, 191, 3, 72, 15),
(192, 'Doloribus eligendi.', '1564699111', 1, 192, 55, 26, 32),
(193, 'Optio provident ducimus.', '1564699111', 0, 193, 56, 40, 47),
(194, 'Et quaerat est eos voluptatum.', '1564699111', 0, 194, 60, 34, 92),
(195, 'Delectus dolore aliquid.', '1564699111', 1, 195, 31, 4, 48),
(196, 'Officia unde accusamus sed qui.', '1564699111', 1, 196, 4, 85, 22),
(197, 'Magnam ex.', '1564699111', 0, 197, 42, 7, 26),
(198, 'Numquam.', '1564699111', 1, 198, 9, 12, 72),
(199, 'Et.', '1564699111', 1, 199, 35, 29, 17),
(200, 'Vitae nostrum quidem illum.', '1564699111', 1, 200, 13, 85, 37),
(201, 'Ad nihil voluptates.', '1564699111', 1, 201, 72, 92, 25),
(202, 'Commodi cum.', '1564699111', 1, 202, 44, 38, 9),
(203, 'Harum ut tempora.', '1564699111', 1, 203, 91, 40, 90),
(204, 'Iste quia quae.', '1564699111', 0, 204, 74, 11, 82),
(205, 'Omnis quia dolores minus eius aspernatur.', '1564699111', 1, 205, 8, 76, 59),
(206, 'Illo aut.', '1564699112', 0, 206, 72, 6, 54),
(207, 'Itaque.', '1564699112', 1, 207, 34, 1, 51),
(208, 'Sunt earum voluptate.', '1564699112', 0, 208, 43, 50, 66),
(209, 'Et.', '1564699112', 0, 209, 41, 78, 49),
(210, 'Totam.', '1564699112', 0, 210, 15, 43, 70),
(211, 'Dolores aut velit.', '1564699112', 0, 211, 78, 40, 17),
(212, 'Veritatis animi tenetur.', '1564699112', 1, 212, 19, 17, 46),
(213, 'Est qui quibusdam.', '1564699112', 1, 213, 28, 87, 12),
(214, 'Labore voluptatem alias.', '1564699112', 1, 214, 84, 65, 35),
(215, 'Quibusdam eos.', '1564699112', 1, 215, 54, 9, 27),
(216, 'Pariatur ipsa hic est.', '1564699112', 1, 216, 44, 86, 88),
(217, 'Placeat assumenda quae.', '1564699112', 0, 217, 59, 21, 19),
(218, 'Architecto esse sed.', '1564699112', 0, 218, 41, 85, 44),
(219, 'Officiis eligendi.', '1564699112', 1, 219, 62, 4, 42),
(220, 'Commodi deserunt tempore dolorem.', '1564699112', 0, 220, 45, 54, 62),
(221, 'Corporis aliquid eum expedita.', '1564699112', 1, 221, 41, 2, 50),
(222, 'Molestiae assumenda non sit et.', '1564699112', 0, 222, 16, 66, 66),
(223, 'Sequi id et.', '1564699112', 0, 223, 17, 1, 10),
(224, 'Sed et in et pariatur.', '1564699112', 0, 224, 86, 61, 11),
(225, 'Fuga et molestiae aut recusandae ullam.', '1564699112', 1, 225, 12, 88, 49),
(226, 'Tenetur ipsa aliquid veritatis earum.', '1564699112', 1, 226, 83, 96, 78),
(227, 'Aspernatur voluptatem neque consequuntur.', '1564699112', 0, 227, 24, 6, 80),
(228, 'Aut libero.', '1564699112', 1, 228, 16, 57, 31),
(229, 'Cumque.', '1564699112', 0, 229, 16, 55, 89),
(230, 'Officiis esse error neque beatae.', '1564699112', 1, 230, 4, 15, 54),
(231, 'Iusto recusandae qui.', '1564699112', 0, 231, 87, 10, 43),
(232, 'Facilis architecto.', '1564699112', 1, 232, 32, 80, 66),
(233, 'Eum sed.', '1564699112', 0, 233, 11, 66, 21),
(234, 'Voluptatum.', '1564699112', 0, 234, 49, 13, 30),
(235, 'Ducimus dolore tenetur amet.', '1564699112', 0, 235, 34, 73, 75),
(236, 'Adipisci dicta modi.', '1564699112', 0, 236, 38, 86, 84),
(237, 'Voluptates nihil tempora tempora.', '1564699112', 0, 237, 68, 31, 47),
(238, 'Error.', '1564699112', 0, 238, 25, 27, 13),
(239, 'Iste fugiat quam vero aut id.', '1564699112', 0, 239, 33, 54, 51),
(240, 'Omnis velit placeat.', '1564699112', 1, 240, 93, 37, 51),
(241, 'Omnis optio est molestias soluta.', '1564699112', 0, 241, 83, 50, 76),
(242, 'Harum libero.', '1564699112', 0, 242, 63, 91, 56),
(243, 'Et rerum possimus impedit.', '1564699112', 1, 243, 77, 30, 41),
(244, 'Minus id rem minima odio.', '1564699112', 0, 244, 84, 4, 54),
(245, 'Saepe deserunt id cupiditate.', '1564699112', 0, 245, 82, 56, 54),
(246, 'Porro ut minus maxime quo.', '1564699112', 0, 246, 94, 94, 86),
(247, 'Quos.', '1564699112', 1, 247, 47, 59, 77),
(248, 'Quo quis a.', '1564699112', 1, 248, 90, 57, 93),
(249, 'Earum sit reiciendis.', '1564699112', 1, 249, 10, 65, 73),
(250, 'Exercitationem adipisci quia.', '1564699112', 0, 250, 39, 68, 25),
(251, 'Animi quos vero a voluptatem voluptas.', '1564699112', 0, 251, 27, 62, 29),
(252, 'Laborum nihil id mollitia.', '1564699112', 0, 252, 75, 37, 88),
(253, 'Veritatis necessitatibus nam est consequatur.', '1564699112', 1, 253, 3, 1, 11),
(254, 'Sunt esse.', '1564699112', 0, 254, 93, 48, 2),
(255, 'Doloremque tempore et.', '1564699112', 1, 255, 65, 59, 93),
(256, 'Sint vero.', '1564699112', 1, 256, 71, 51, 23),
(257, 'Tempore natus corporis.', '1564699112', 1, 257, 21, 78, 62),
(258, 'Culpa quae exercitationem asperiores autem.', '1564699112', 1, 258, 89, 56, 49),
(259, 'Quas ab.', '1564699112', 1, 259, 95, 93, 87),
(260, 'Dolorem quia voluptatem ut.', '1564699112', 1, 260, 19, 71, 8),
(261, 'Laboriosam exercitationem.', '1564699112', 1, 261, 56, 35, 87),
(262, 'Fugit.', '1564699112', 0, 262, 41, 29, 51),
(263, 'Qui dolorum eos expedita.', '1564699112', 0, 263, 61, 50, 80),
(264, 'Rerum rerum itaque.', '1564699112', 1, 264, 67, 89, 25),
(265, 'Sed voluptas quis non cupiditate.', '1564699113', 1, 265, 74, 91, 53),
(266, 'Culpa rerum.', '1564699113', 1, 266, 65, 81, 55),
(267, 'Dolor ut.', '1564699113', 0, 267, 27, 26, 11),
(268, 'Ab mollitia reprehenderit temporibus.', '1564699113', 1, 268, 35, 68, 88),
(269, 'Tenetur nostrum.', '1564699113', 0, 269, 52, 40, 80),
(270, 'Deleniti totam qui quam enim.', '1564699113', 0, 270, 79, 52, 84),
(271, 'Corrupti.', '1564699113', 1, 271, 6, 31, 84),
(272, 'Tempore velit recusandae ipsum.', '1564699113', 0, 272, 11, 14, 67),
(273, 'Et eius nobis maxime at.', '1564699113', 1, 273, 24, 42, 68),
(274, 'Blanditiis aliquid ducimus.', '1564699113', 1, 274, 41, 68, 75),
(275, 'Quaerat quo dolorem eos.', '1564699113', 0, 275, 38, 22, 57),
(276, 'Eligendi et temporibus.', '1564699113', 0, 276, 43, 33, 77),
(277, 'Et.', '1564699113', 1, 277, 77, 48, 5),
(278, 'Totam iusto.', '1564699113', 1, 278, 26, 83, 20),
(279, 'Et molestiae.', '1564699113', 1, 279, 85, 90, 79),
(280, 'Rerum excepturi ex.', '1564699113', 0, 280, 14, 64, 96),
(281, 'Molestiae et dolores eligendi laborum.', '1564699113', 1, 281, 93, 2, 37),
(282, 'Consectetur dolore aut dolor voluptatibus.', '1564699113', 0, 282, 40, 61, 14),
(283, 'Eum consequatur.', '1564699113', 1, 283, 24, 93, 11),
(284, 'Voluptatibus laudantium.', '1564699113', 1, 284, 94, 42, 88),
(285, 'Aut omnis et.', '1564699113', 0, 285, 31, 89, 59),
(286, 'Aliquam rerum qui.', '1564699113', 0, 286, 3, 71, 89),
(287, 'Commodi alias dolores.', '1564699113', 0, 287, 31, 22, 65),
(288, 'Velit vel.', '1564699113', 0, 288, 85, 15, 95),
(289, 'Aut eos ipsam.', '1564699113', 0, 289, 38, 54, 3),
(290, 'Impedit modi.', '1564699113', 1, 290, 91, 14, 63),
(291, 'Est aut voluptates.', '1564699113', 0, 291, 68, 21, 62),
(292, 'Nesciunt repudiandae.', '1564699113', 1, 292, 87, 26, 95),
(293, 'Et iste aut officiis.', '1564699113', 1, 293, 85, 52, 14),
(294, 'Et perspiciatis qui.', '1564699113', 0, 294, 31, 74, 61),
(295, 'Est qui temporibus.', '1564699113', 0, 295, 65, 57, 95),
(296, 'Esse quos.', '1564699113', 1, 296, 53, 32, 74),
(297, 'Rerum laudantium.', '1564699113', 0, 297, 8, 6, 30),
(298, 'At aut.', '1564699113', 0, 298, 93, 22, 14),
(299, 'Non quia rem molestias sint labore.', '1564699113', 0, 299, 1, 41, 45),
(300, 'Facere expedita.', '1564699113', 0, 300, 7, 72, 80),
(301, 'Sit quam harum.', '1564699113', 1, 301, 36, 56, 46),
(302, 'Velit eos et.', '1564699113', 0, 302, 72, 69, 44),
(303, 'Labore et a provident adipisci.', '1564699113', 1, 303, 17, 20, 57),
(304, 'Vitae nostrum.', '1564699113', 0, 304, 83, 35, 87),
(305, 'Itaque nihil provident.', '1564699113', 1, 305, 59, 7, 32),
(306, 'Aut error est alias temporibus.', '1564699113', 1, 306, 49, 50, 40),
(307, 'Fuga.', '1564699113', 0, 307, 78, 31, 86),
(308, 'Velit rerum nesciunt rem.', '1564699113', 1, 308, 43, 26, 25),
(309, 'Voluptatem et enim et animi.', '1564699113', 1, 309, 37, 64, 15),
(310, 'Accusantium quo.', '1564699113', 0, 310, 9, 28, 12),
(311, 'Ea consectetur.', '1564699113', 0, 311, 93, 50, 50),
(312, 'Voluptatem.', '1564699113', 0, 312, 56, 33, 50),
(313, 'Qui eum velit quia nobis.', '1564699113', 1, 313, 9, 36, 62),
(314, 'Iste dolores.', '1564699113', 1, 314, 39, 15, 67),
(315, 'Id.', '1564699113', 1, 315, 92, 35, 39),
(316, 'Inventore.', '1564699113', 1, 316, 62, 11, 76),
(317, 'Dolorem quod ut facilis.', '1564699113', 1, 317, 64, 25, 94),
(318, 'Eaque numquam.', '1564699113', 0, 318, 66, 61, 86),
(319, 'Hic cupiditate.', '1564699113', 0, 319, 8, 68, 84),
(320, 'Omnis voluptatem voluptatem sunt.', '1564699113', 1, 320, 4, 18, 10),
(321, 'Odit.', '1564699113', 0, 321, 81, 54, 7),
(322, 'Est aut.', '1564699113', 1, 322, 74, 91, 75),
(323, 'Eos expedita veritatis quo.', '1564699113', 0, 323, 38, 83, 35),
(324, 'Reprehenderit.', '1564699113', 1, 324, 53, 20, 49),
(325, 'Optio architecto.', '1564699113', 1, 325, 82, 22, 67),
(326, 'Sint rem.', '1564699113', 0, 326, 58, 53, 90),
(327, 'Sit consequuntur.', '1564699113', 1, 327, 47, 57, 14),
(328, 'Suscipit voluptatum.', '1564699113', 0, 328, 44, 32, 14),
(329, 'Occaecati aliquam rerum inventore.', '1564699113', 1, 329, 31, 63, 37),
(330, 'Sed quis.', '1564699113', 0, 330, 91, 38, 78),
(331, 'Est assumenda.', '1564699113', 0, 331, 61, 33, 40),
(332, 'Enim occaecati est.', '1564699113', 1, 332, 66, 63, 80),
(333, 'Ea sed.', '1564699114', 1, 333, 33, 22, 42),
(334, 'Doloribus occaecati.', '1564699114', 0, 334, 18, 15, 2),
(335, 'Repellat voluptates molestiae adipisci.', '1564699114', 0, 335, 71, 27, 7),
(336, 'Esse ex quibusdam.', '1564699114', 1, 336, 95, 18, 32),
(337, 'Vel suscipit repudiandae nobis.', '1564699114', 1, 337, 34, 91, 58),
(338, 'Officiis ipsum accusamus.', '1564699114', 1, 338, 35, 59, 8),
(339, 'Aut in explicabo qui ut.', '1564699114', 1, 339, 43, 54, 66),
(340, 'Recusandae aut et.', '1564699114', 1, 340, 5, 16, 48),
(341, 'Ut.', '1564699114', 0, 341, 25, 6, 5),
(342, 'Magnam et quidem.', '1564699114', 1, 342, 16, 21, 61),
(343, 'Et unde at placeat.', '1564699114', 1, 343, 20, 1, 67),
(344, 'Magni rerum.', '1564699114', 1, 344, 29, 54, 87),
(345, 'Voluptatem deleniti nulla.', '1564699114', 1, 345, 30, 83, 22),
(346, 'Cum blanditiis consequatur.', '1564699114', 0, 346, 62, 41, 95),
(347, 'Sapiente et exercitationem doloribus sunt.', '1564699114', 0, 347, 32, 73, 65),
(348, 'Rerum omnis.', '1564699114', 0, 348, 77, 46, 85),
(349, 'Quos quaerat et.', '1564699114', 0, 349, 78, 51, 65),
(350, 'Et enim.', '1564699114', 1, 350, 8, 60, 91),
(351, 'Rerum ut rerum voluptas.', '1564699114', 1, 351, 40, 44, 56),
(352, 'Aut minima dolores.', '1564699114', 0, 352, 81, 89, 79),
(353, 'Quo blanditiis velit.', '1564699114', 0, 353, 45, 60, 76),
(354, 'Labore debitis qui dolores vel.', '1564699114', 0, 354, 88, 66, 52),
(355, 'Quia velit.', '1564699114', 1, 355, 40, 82, 93),
(356, 'Atque quibusdam iusto aspernatur alias.', '1564699114', 1, 356, 76, 10, 19),
(357, 'Quis eos officia temporibus illo.', '1564699114', 1, 357, 20, 34, 60),
(358, 'Alias maxime.', '1564699114', 0, 358, 89, 19, 25),
(359, 'Autem cumque.', '1564699114', 0, 359, 59, 71, 52),
(360, 'Aut repellendus ut omnis.', '1564699114', 1, 360, 47, 43, 57),
(361, 'Dignissimos labore temporibus praesentium adipisci quidem.', '1564699114', 1, 361, 34, 8, 59),
(362, 'Ducimus dignissimos.', '1564699114', 1, 362, 96, 24, 25),
(363, 'Iusto deserunt sequi.', '1564699114', 1, 363, 41, 55, 21),
(364, 'Harum aut.', '1564699114', 1, 364, 30, 23, 2),
(365, 'Veniam.', '1564699114', 0, 365, 60, 54, 63),
(366, 'Et nobis.', '1564699114', 1, 366, 71, 58, 93),
(367, 'Cum aspernatur.', '1564699114', 0, 367, 39, 93, 81),
(368, 'Porro ullam dolorum.', '1564699114', 0, 368, 44, 29, 62),
(369, 'In dolores veniam.', '1564699114', 0, 369, 24, 33, 86),
(370, 'Nihil optio rerum occaecati.', '1564699114', 1, 370, 79, 22, 41),
(371, 'Dolorem.', '1564699114', 0, 371, 50, 23, 8),
(372, 'Sed.', '1564699114', 1, 372, 62, 47, 73),
(373, 'Excepturi impedit sit.', '1564699114', 1, 373, 41, 39, 1),
(374, 'Eum recusandae.', '1564699114', 0, 374, 64, 86, 28),
(375, 'Ut similique.', '1564699114', 0, 375, 66, 84, 58),
(376, 'Similique in quas.', '1564699114', 0, 376, 5, 54, 18),
(377, 'Adipisci in omnis.', '1564699114', 1, 377, 80, 75, 32),
(378, 'Explicabo.', '1564699114', 0, 378, 86, 9, 14),
(379, 'Magnam.', '1564699114', 1, 379, 95, 28, 33),
(380, 'Sit et.', '1564699114', 0, 380, 44, 57, 51),
(381, 'Sit porro.', '1564699114', 1, 381, 27, 1, 59),
(382, 'Et delectus officia quisquam.', '1564699114', 0, 382, 39, 63, 28),
(383, 'Ut totam voluptatem.', '1564699114', 0, 383, 60, 41, 81),
(384, 'Minima voluptate reprehenderit eligendi voluptas.', '1564699114', 0, 384, 87, 23, 36),
(385, 'Quos.', '1564699114', 1, 385, 19, 59, 84),
(386, 'Nostrum omnis.', '1564699114', 1, 386, 45, 44, 35),
(387, 'Sed voluptatibus.', '1564699114', 1, 387, 22, 2, 12),
(388, 'Accusamus rerum et voluptatem.', '1564699114', 0, 388, 61, 95, 44),
(389, 'Possimus iste ea.', '1564699114', 0, 389, 2, 32, 60),
(390, 'Quae.', '1564699114', 0, 390, 7, 55, 73),
(391, 'Quis labore.', '1564699114', 0, 391, 13, 76, 27),
(392, 'Voluptatem tempore.', '1564699115', 0, 392, 55, 95, 64),
(393, 'Aliquam et a.', '1564699115', 1, 393, 56, 78, 5),
(394, 'Id.', '1564699115', 0, 394, 65, 9, 27),
(395, 'Amet labore iure earum.', '1564699115', 0, 395, 21, 40, 29),
(396, 'Debitis voluptates est.', '1564699115', 1, 396, 70, 1, 51),
(397, 'Omnis dolorem ab ut.', '1564699115', 0, 397, 13, 51, 90),
(398, 'Corrupti id reprehenderit maiores ex ex.', '1564699115', 1, 398, 72, 42, 8),
(399, 'Temporibus tempora.', '1564699115', 1, 399, 45, 17, 73),
(400, 'Corrupti asperiores veritatis.', '1564699115', 1, 400, 39, 80, 3),
(401, 'Quas aut earum sunt vitae at.', '1564699115', 0, 401, 18, 90, 17),
(402, 'Et.', '1564699115', 0, 402, 2, 90, 22),
(403, 'Laboriosam non exercitationem.', '1564699115', 1, 403, 78, 57, 45),
(404, 'Incidunt fuga omnis.', '1564699115', 0, 404, 24, 44, 85),
(405, 'Dicta sunt.', '1564699115', 0, 405, 78, 8, 94),
(406, 'Explicabo corporis.', '1564699115', 0, 406, 37, 85, 24),
(407, 'Odit amet assumenda.', '1564699115', 1, 407, 40, 4, 27),
(408, 'Ut sit possimus.', '1564699115', 0, 408, 49, 22, 37),
(409, 'Maxime neque quia nostrum.', '1564699115', 1, 409, 65, 88, 17),
(410, 'Et at.', '1564699115', 0, 410, 64, 89, 25),
(411, 'Porro quos.', '1564699115', 1, 411, 4, 35, 17),
(412, 'Distinctio dolore voluptas dolorum laborum.', '1564699115', 0, 412, 44, 76, 23),
(413, 'Est aspernatur corporis.', '1564699115', 1, 413, 80, 9, 90),
(414, 'Nemo unde soluta nam nihil.', '1564699115', 1, 414, 1, 32, 55),
(415, 'Error eos.', '1564699115', 1, 415, 79, 34, 32),
(416, 'Nisi.', '1564699115', 1, 416, 96, 82, 46),
(417, 'Omnis omnis nemo numquam.', '1564699115', 1, 417, 89, 37, 89),
(418, 'Eum dignissimos dolores aut.', '1564699115', 0, 418, 54, 19, 79),
(419, 'Vel vero ratione.', '1564699115', 1, 419, 67, 92, 67),
(420, 'Minus ad et vel.', '1564699115', 1, 420, 76, 25, 46),
(421, 'Veritatis.', '1564699115', 0, 421, 54, 5, 26),
(422, 'Laudantium perspiciatis dolores illo.', '1564699115', 1, 422, 13, 23, 37),
(423, 'Tenetur veritatis magnam ducimus.', '1564699115', 0, 423, 8, 88, 23),
(424, 'Distinctio dolorem alias.', '1564699115', 0, 424, 85, 9, 64),
(425, 'Suscipit sed.', '1564699116', 1, 425, 66, 63, 68),
(426, 'Qui commodi.', '1564699116', 1, 426, 66, 31, 7),
(427, 'Officia velit aut vero.', '1564699116', 1, 427, 91, 86, 34),
(428, 'Totam corrupti aspernatur nesciunt minus.', '1564699116', 1, 428, 28, 41, 22),
(429, 'Fugiat neque et.', '1564699116', 1, 429, 1, 37, 25),
(430, 'Iste et alias nam.', '1564699116', 1, 430, 79, 93, 27),
(431, 'Ut culpa aut.', '1564699116', 1, 431, 79, 61, 88),
(432, 'Et cupiditate.', '1564699116', 0, 432, 28, 30, 54),
(433, 'Sed enim aut qui harum.', '1564699116', 1, 433, 23, 18, 49),
(434, 'Dicta neque aperiam.', '1564699116', 1, 434, 44, 28, 61),
(435, 'Qui.', '1564699116', 1, 435, 10, 31, 11),
(436, 'Impedit dolores.', '1564699116', 1, 436, 30, 18, 59),
(437, 'Unde est voluptas.', '1564699116', 0, 437, 32, 74, 52),
(438, 'Quam eveniet est.', '1564699116', 1, 438, 40, 40, 71),
(439, 'Quasi amet quam accusantium repellendus.', '1564699116', 1, 439, 87, 13, 46),
(440, 'Perspiciatis voluptatem quod.', '1564699116', 0, 440, 51, 69, 68),
(441, 'Dicta modi dolor nobis id odit.', '1564699116', 0, 441, 12, 57, 75),
(442, 'Odit non suscipit fugit recusandae.', '1564699116', 0, 442, 26, 31, 93),
(443, 'Ullam et rerum.', '1564699116', 0, 443, 68, 96, 74),
(444, 'Voluptatum est mollitia.', '1564699116', 1, 444, 47, 91, 8),
(445, 'Dolor maiores.', '1564699116', 1, 445, 89, 6, 91),
(446, 'Iste quod eos quisquam consequatur.', '1564699116', 1, 446, 60, 55, 19),
(447, 'Non et occaecati.', '1564699116', 1, 447, 10, 72, 91),
(448, 'Quia.', '1564699116', 0, 448, 92, 3, 5),
(449, 'Ducimus nesciunt.', '1564699116', 0, 449, 51, 96, 67),
(450, 'Modi voluptate quis.', '1564699116', 0, 450, 33, 56, 62),
(451, 'Vel et.', '1564699116', 0, 451, 71, 92, 89),
(452, 'Aliquam esse.', '1564699116', 0, 452, 43, 43, 23),
(453, 'Tempore nesciunt.', '1564699116', 1, 453, 32, 31, 14),
(454, 'Facilis voluptatum.', '1564699116', 1, 454, 2, 83, 66),
(455, 'Aperiam voluptatem non nihil.', '1564699116', 1, 455, 58, 40, 43),
(456, 'Voluptas non laboriosam.', '1564699116', 0, 456, 87, 33, 59),
(457, 'Iste adipisci.', '1564699116', 0, 457, 19, 75, 78),
(458, 'Unde.', '1564699116', 0, 458, 63, 31, 92),
(459, 'Tempora ducimus.', '1564699116', 1, 459, 40, 53, 9),
(460, 'Neque est consectetur.', '1564699116', 1, 460, 21, 13, 96),
(461, 'Qui consequatur.', '1564699116', 1, 461, 71, 45, 44),
(462, 'Ad autem.', '1564699117', 0, 462, 81, 51, 61),
(463, 'Sunt similique.', '1564699117', 0, 463, 96, 9, 6),
(464, 'Ex ut.', '1564699117', 0, 464, 89, 89, 32),
(465, 'Est est repellendus sed corporis ut.', '1564699117', 1, 465, 80, 64, 69),
(466, 'Nostrum autem.', '1564699117', 1, 466, 5, 74, 7),
(467, 'Voluptatem ipsam porro.', '1564699117', 0, 467, 85, 43, 78),
(468, 'Molestias dolorem harum.', '1564699117', 1, 468, 22, 41, 17),
(469, 'Ut molestias vel similique.', '1564699117', 0, 469, 26, 83, 51),
(470, 'Et.', '1564699117', 1, 470, 70, 34, 59),
(471, 'Eos deserunt et.', '1564699117', 0, 471, 42, 68, 44),
(472, 'Qui tempore et aliquam.', '1564699117', 1, 472, 29, 51, 14),
(473, 'Non.', '1564699117', 1, 473, 51, 89, 70),
(474, 'Aut natus dolorem aliquid repudiandae.', '1564699117', 1, 474, 56, 28, 27),
(475, 'Est aliquam est.', '1564699117', 1, 475, 91, 48, 17),
(476, 'Nihil quisquam.', '1564699117', 1, 476, 8, 10, 87),
(477, 'Et sunt nostrum.', '1564699117', 1, 477, 19, 48, 31),
(478, 'Iusto aut.', '1564699117', 0, 478, 15, 81, 47),
(479, 'Quae illo eveniet animi.', '1564699117', 1, 479, 63, 35, 46),
(480, 'Inventore facere enim.', '1564699117', 0, 480, 5, 78, 54),
(481, 'Alias accusamus sit doloribus.', '1564699117', 0, 481, 47, 69, 8),
(482, 'Deserunt quaerat dignissimos.', '1564699117', 0, 482, 14, 23, 57),
(483, 'Et velit molestias.', '1564699117', 0, 483, 43, 12, 11),
(484, 'Perspiciatis assumenda.', '1564699117', 1, 484, 45, 33, 15),
(485, 'Occaecati.', '1564699117', 1, 485, 61, 71, 14),
(486, 'Architecto vitae sed.', '1564699117', 1, 486, 34, 36, 8),
(487, 'Aut similique et aut.', '1564699117', 1, 487, 38, 7, 58),
(488, 'Enim et fugit distinctio.', '1564699118', 0, 488, 59, 71, 89),
(489, 'Explicabo ipsa incidunt quia ex non.', '1564699118', 1, 489, 12, 53, 21),
(490, 'Est omnis et pariatur laborum.', '1564699118', 0, 490, 94, 93, 26),
(491, 'Delectus nam at voluptatibus.', '1564699118', 0, 491, 37, 38, 48),
(492, 'Non voluptas.', '1564699118', 0, 492, 26, 43, 22),
(493, 'Quis saepe rerum iste ut consequatur.', '1564699118', 0, 493, 45, 19, 12),
(494, 'Quia velit eaque.', '1564699118', 1, 494, 55, 2, 93),
(495, 'Necessitatibus facere explicabo sit.', '1564699118', 1, 495, 41, 52, 43),
(496, 'Aperiam quia.', '1564699118', 0, 496, 49, 25, 81),
(497, 'Nihil.', '1564699118', 1, 497, 76, 26, 39),
(498, 'Quam et accusamus quis sunt.', '1564699118', 1, 498, 51, 56, 85),
(499, 'Sint ipsa non.', '1564699118', 1, 499, 78, 40, 38),
(500, 'Quas.', '1564699118', 0, 500, 11, 3, 73);

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
(1, 'Et nisi perspiciatis.', '1564699109', 0, 1, 75, 57),
(2, 'Quis ex voluptates enim deleniti.', '1564699109', 1, 1, 95, 19),
(3, 'Ad quia.', '1564699109', 1, 0, 24, 85),
(4, 'Quae in.', '1564699109', 0, 0, 80, 50),
(5, 'Ex laudantium dolore.', '1564699109', 1, 1, 16, 88),
(6, 'Libero blanditiis magnam.', '1564699109', 1, 0, 6, 37),
(7, 'Quia ex.', '1564699109', 0, 0, 13, 91),
(8, 'Possimus sit quasi.', '1564699109', 0, 0, 17, 40),
(9, 'Sapiente alias est consequatur.', '1564699109', 0, 1, 19, 80),
(10, 'Est doloremque ipsam ea libero omnis.', '1564699109', 1, 0, 2, 91),
(11, 'Aliquid eligendi cupiditate id.', '1564699109', 1, 1, 68, 74),
(12, 'Sunt rerum et libero dolores.', '1564699109', 0, 0, 76, 86),
(13, 'Placeat dicta culpa maxime ea.', '1564699109', 1, 0, 3, 18),
(14, 'Nihil aut voluptas.', '1564699109', 0, 0, 28, 10),
(15, 'Dolorem perferendis distinctio voluptate soluta eaque.', '1564699109', 1, 0, 76, 33),
(16, 'Enim atque.', '1564699109', 0, 0, 48, 65),
(17, 'Facilis.', '1564699109', 1, 1, 71, 58),
(18, 'Ut ullam maiores et qui.', '1564699109', 0, 0, 73, 63),
(19, 'Modi sint placeat voluptatibus debitis.', '1564699109', 1, 0, 15, 34),
(20, 'Odio dolor.', '1564699109', 1, 1, 10, 55),
(21, 'Consequatur saepe est.', '1564699109', 0, 1, 13, 62),
(22, 'Odit molestias.', '1564699109', 1, 1, 66, 61),
(23, 'Repellendus maxime omnis quo laborum nesciunt.', '1564699109', 0, 0, 62, 93),
(24, 'Laboriosam perferendis et.', '1564699109', 0, 1, 25, 81),
(25, 'Ut omnis quia reprehenderit quis et.', '1564699109', 1, 0, 86, 58),
(26, 'Placeat et illo.', '1564699109', 0, 1, 33, 66),
(27, 'Quia laborum.', '1564699109', 1, 1, 18, 45),
(28, 'Enim vel itaque.', '1564699109', 1, 0, 79, 83),
(29, 'Voluptas aliquid.', '1564699109', 1, 0, 85, 82),
(30, 'Vel ab est magnam.', '1564699109', 1, 0, 46, 30),
(31, 'Ipsa magnam ab architecto.', '1564699109', 0, 0, 88, 94),
(32, 'Ea sunt consequatur.', '1564699109', 0, 1, 17, 94),
(33, 'Dolorem eos.', '1564699109', 1, 1, 94, 48),
(34, 'Qui voluptatem.', '1564699109', 0, 0, 92, 87),
(35, 'Molestias.', '1564699109', 1, 1, 90, 9),
(36, 'Ut expedita modi libero dolor.', '1564699109', 0, 1, 40, 3),
(37, 'Et ea qui natus.', '1564699109', 0, 1, 78, 94),
(38, 'Libero est.', '1564699109', 1, 1, 13, 52),
(39, 'Neque voluptas.', '1564699109', 1, 0, 82, 16),
(40, 'Esse.', '1564699109', 1, 0, 68, 45),
(41, 'Enim et quae velit.', '1564699109', 1, 0, 72, 65),
(42, 'Et.', '1564699110', 1, 0, 52, 87),
(43, 'Quasi itaque.', '1564699110', 0, 1, 70, 15),
(44, 'Beatae consequuntur eos magnam quam.', '1564699110', 1, 1, 93, 3),
(45, 'Eius.', '1564699110', 0, 0, 71, 78),
(46, 'Est delectus atque quia.', '1564699110', 1, 0, 72, 63),
(47, 'Autem tenetur.', '1564699110', 1, 0, 70, 78),
(48, 'Reprehenderit eum ut dolore.', '1564699110', 1, 0, 12, 41),
(49, 'Quia sit corporis praesentium.', '1564699110', 0, 1, 26, 24),
(50, 'Quia.', '1564699110', 1, 1, 15, 7),
(51, 'Ut accusantium dolor.', '1564699110', 0, 0, 80, 55),
(52, 'Earum similique architecto porro.', '1564699110', 0, 0, 69, 58),
(53, 'Rem maxime.', '1564699110', 0, 1, 25, 78),
(54, 'Libero consectetur voluptatem non.', '1564699110', 0, 0, 8, 66),
(55, 'Ratione et ullam.', '1564699110', 1, 1, 54, 39),
(56, 'Molestiae nihil sint eius.', '1564699110', 0, 1, 12, 86),
(57, 'Et quo et officiis.', '1564699110', 1, 0, 7, 84),
(58, 'Dicta.', '1564699110', 0, 0, 65, 71),
(59, 'Nesciunt est ut provident.', '1564699110', 1, 1, 90, 88),
(60, 'Consequatur suscipit.', '1564699110', 1, 0, 88, 37),
(61, 'Molestiae qui.', '1564699110', 1, 1, 96, 76),
(62, 'Enim eveniet.', '1564699110', 1, 1, 85, 96),
(63, 'Doloremque quos itaque a architecto enim.', '1564699110', 0, 1, 6, 53),
(64, 'Id natus error.', '1564699110', 1, 1, 40, 45),
(65, 'Quia tempore.', '1564699110', 0, 1, 44, 76),
(66, 'Saepe.', '1564699110', 1, 1, 47, 2),
(67, 'Voluptatem est doloremque sit eos.', '1564699110', 1, 1, 54, 24),
(68, 'Qui necessitatibus.', '1564699110', 1, 0, 78, 37),
(69, 'Sapiente recusandae.', '1564699110', 1, 0, 90, 79),
(70, 'Nulla porro est natus doloribus et.', '1564699110', 0, 0, 81, 61),
(71, 'Maxime sint eum cum.', '1564699110', 0, 0, 44, 9),
(72, 'Quis cum.', '1564699110', 1, 0, 86, 92),
(73, 'Eum excepturi quasi.', '1564699110', 1, 1, 41, 89),
(74, 'In.', '1564699110', 0, 0, 78, 41),
(75, 'Non sit incidunt enim et voluptas.', '1564699110', 0, 0, 66, 10),
(76, 'Culpa nulla id iusto.', '1564699110', 1, 1, 92, 4),
(77, 'Autem.', '1564699110', 1, 1, 19, 42),
(78, 'Quia.', '1564699110', 0, 0, 38, 88),
(79, 'Magnam ut.', '1564699110', 0, 1, 11, 61),
(80, 'Quidem eos.', '1564699110', 1, 0, 5, 4),
(81, 'Velit.', '1564699110', 1, 0, 91, 63),
(82, 'Odio qui adipisci aut.', '1564699110', 0, 0, 7, 46),
(83, 'Ea et.', '1564699110', 1, 0, 15, 50),
(84, 'Facere cumque excepturi recusandae.', '1564699110', 0, 0, 54, 79),
(85, 'Quo et nobis.', '1564699110', 0, 1, 55, 32),
(86, 'Qui.', '1564699110', 1, 0, 62, 5),
(87, 'Aliquid exercitationem impedit excepturi.', '1564699110', 1, 1, 57, 48),
(88, 'Recusandae vitae qui enim.', '1564699110', 0, 0, 11, 9),
(89, 'Beatae repellendus quod.', '1564699110', 1, 1, 50, 58),
(90, 'Reiciendis et aut libero facilis repellat.', '1564699110', 1, 1, 40, 16),
(91, 'Quibusdam eos quia accusantium.', '1564699110', 1, 0, 27, 35),
(92, 'Sit hic qui.', '1564699110', 1, 1, 60, 17),
(93, 'Et unde numquam ipsam maiores.', '1564699110', 0, 0, 28, 61),
(94, 'Quasi soluta exercitationem.', '1564699110', 1, 1, 92, 1),
(95, 'Autem.', '1564699110', 1, 1, 45, 12),
(96, 'Facilis reprehenderit sed.', '1564699110', 1, 0, 92, 33),
(97, 'Recusandae tempore.', '1564699110', 0, 0, 32, 72),
(98, 'Voluptatum voluptas.', '1564699110', 1, 0, 82, 54),
(99, 'Occaecati.', '1564699110', 1, 1, 26, 75),
(100, 'Accusamus eos iusto dolor.', '1564699110', 0, 0, 22, 28),
(101, 'Blanditiis quis tenetur.', '1564699110', 1, 0, 30, 1),
(102, 'Repellat dolores ut veniam saepe.', '1564699110', 1, 0, 27, 90),
(103, 'Libero ducimus aut.', '1564699110', 0, 0, 65, 55),
(104, 'Ad deleniti voluptatem dicta.', '1564699110', 1, 1, 64, 27),
(105, 'Sequi ea culpa.', '1564699110', 0, 0, 71, 10),
(106, 'Vero quibusdam a odio.', '1564699110', 1, 1, 5, 11),
(107, 'Accusamus veritatis.', '1564699110', 1, 0, 54, 32),
(108, 'Ut autem totam.', '1564699110', 1, 1, 67, 14),
(109, 'Expedita omnis qui autem itaque.', '1564699110', 1, 1, 85, 43),
(110, 'Sit velit nam amet sed dolore.', '1564699110', 0, 1, 18, 70),
(111, 'Omnis qui at et.', '1564699110', 0, 1, 39, 68),
(112, 'Deleniti velit perspiciatis.', '1564699110', 1, 1, 45, 58),
(113, 'Dolor repellat.', '1564699110', 0, 0, 75, 23),
(114, 'Et deserunt mollitia ipsa.', '1564699110', 1, 1, 39, 51),
(115, 'Eos qui.', '1564699110', 1, 1, 87, 24),
(116, 'Magnam eligendi et.', '1564699110', 1, 0, 4, 13),
(117, 'Iusto dolor expedita.', '1564699110', 1, 1, 10, 89),
(118, 'Minus nihil.', '1564699111', 0, 0, 20, 76),
(119, 'Dignissimos accusantium.', '1564699111', 1, 1, 17, 48),
(120, 'Possimus natus.', '1564699111', 0, 1, 17, 60),
(121, 'Repellendus minus.', '1564699111', 1, 1, 9, 55),
(122, 'Ab porro nemo.', '1564699111', 1, 1, 41, 4),
(123, 'Quis aut placeat.', '1564699111', 1, 0, 11, 32),
(124, 'Et asperiores.', '1564699111', 0, 1, 88, 2),
(125, 'Eius qui veniam autem.', '1564699111', 0, 0, 4, 73),
(126, 'Voluptatem rerum pariatur et.', '1564699111', 0, 0, 30, 16),
(127, 'Dolorem sit perspiciatis ut ut.', '1564699111', 0, 1, 53, 56),
(128, 'Cupiditate nemo.', '1564699111', 1, 1, 32, 64),
(129, 'Eaque praesentium.', '1564699111', 0, 0, 48, 16),
(130, 'Reiciendis veniam.', '1564699111', 0, 1, 44, 21),
(131, 'Sequi voluptas.', '1564699111', 0, 1, 87, 17),
(132, 'Laborum fuga consequatur quis.', '1564699111', 1, 0, 39, 50),
(133, 'Autem non numquam aut.', '1564699111', 1, 1, 95, 79),
(134, 'Sit minima.', '1564699111', 1, 0, 37, 5),
(135, 'Earum nihil sint.', '1564699111', 1, 0, 76, 13),
(136, 'Vel cum.', '1564699111', 1, 1, 64, 71),
(137, 'Laborum voluptatem incidunt atque.', '1564699111', 0, 0, 20, 65),
(138, 'Vel qui saepe.', '1564699111', 1, 0, 63, 13),
(139, 'Debitis similique qui sunt dignissimos.', '1564699111', 0, 0, 3, 59),
(140, 'Ut ex.', '1564699111', 1, 0, 9, 83),
(141, 'Voluptate porro.', '1564699111', 0, 0, 93, 20),
(142, 'Excepturi sit eum.', '1564699111', 1, 1, 63, 90),
(143, 'Eaque dicta pariatur et et.', '1564699111', 1, 0, 23, 71),
(144, 'Delectus rerum ut consequatur saepe.', '1564699111', 1, 1, 94, 61),
(145, 'Blanditiis.', '1564699111', 0, 0, 44, 49),
(146, 'Reiciendis et perferendis.', '1564699111', 1, 0, 30, 90),
(147, 'Molestiae est itaque et esse aut.', '1564699111', 0, 1, 44, 51),
(148, 'Nam.', '1564699111', 0, 1, 20, 27),
(149, 'Asperiores expedita consequatur dolor culpa.', '1564699111', 0, 1, 80, 10),
(150, 'Sunt dolor aliquid.', '1564699111', 0, 1, 9, 59),
(151, 'Velit nisi eos optio.', '1564699111', 0, 0, 64, 56),
(152, 'Non error.', '1564699111', 1, 1, 40, 22),
(153, 'Et quis vel illum voluptate architecto.', '1564699111', 0, 0, 47, 50),
(154, 'Debitis ullam consequatur.', '1564699111', 0, 1, 48, 95),
(155, 'Modi maxime qui.', '1564699111', 1, 1, 90, 45),
(156, 'Eaque eos quia.', '1564699111', 1, 0, 93, 39),
(157, 'Molestiae autem.', '1564699111', 1, 1, 1, 60),
(158, 'Officiis.', '1564699111', 0, 1, 2, 74),
(159, 'Aut itaque doloremque.', '1564699111', 0, 1, 62, 76),
(160, 'Rerum sunt.', '1564699111', 0, 0, 90, 23),
(161, 'Dolorum sed eius.', '1564699111', 0, 0, 79, 49),
(162, 'Qui consequatur voluptas.', '1564699111', 0, 0, 60, 77),
(163, 'Dolor.', '1564699111', 1, 1, 1, 65),
(164, 'Fugit sapiente.', '1564699111', 0, 1, 41, 24),
(165, 'Quis consequatur voluptatibus voluptatum.', '1564699111', 1, 0, 94, 32),
(166, 'Et illo aliquid nihil labore.', '1564699111', 1, 0, 84, 2),
(167, 'Rem aspernatur sint.', '1564699111', 1, 0, 78, 92),
(168, 'Laudantium labore incidunt.', '1564699111', 0, 0, 20, 46),
(169, 'Quia nihil et adipisci.', '1564699111', 0, 0, 45, 12),
(170, 'Officiis.', '1564699111', 0, 0, 58, 70),
(171, 'Cupiditate commodi non qui necessitatibus.', '1564699111', 0, 0, 28, 55),
(172, 'Eligendi velit quo.', '1564699111', 0, 1, 40, 70),
(173, 'Rem architecto ad sit.', '1564699111', 0, 0, 44, 62),
(174, 'Animi dicta.', '1564699111', 0, 0, 55, 76),
(175, 'Repudiandae non officiis.', '1564699111', 0, 0, 91, 13),
(176, 'Et et.', '1564699111', 0, 0, 87, 16),
(177, 'Quisquam unde.', '1564699111', 0, 0, 8, 27),
(178, 'Consequuntur aliquam.', '1564699111', 0, 1, 21, 16),
(179, 'Rerum et quo.', '1564699111', 0, 1, 73, 89),
(180, 'Quia quis dolor natus.', '1564699111', 0, 1, 31, 42),
(181, 'Perspiciatis sint sunt fuga aut.', '1564699111', 0, 0, 96, 71),
(182, 'Facere repellendus dolor maxime.', '1564699111', 0, 0, 72, 51),
(183, 'Voluptatem cupiditate.', '1564699111', 0, 0, 21, 31),
(184, 'Rerum autem.', '1564699111', 0, 0, 95, 2),
(185, 'Quas tempore exercitationem molestiae.', '1564699111', 1, 0, 69, 66),
(186, 'Autem enim aliquam.', '1564699111', 0, 0, 95, 78),
(187, 'Aut.', '1564699111', 0, 0, 1, 87),
(188, 'Nulla sunt officiis ut.', '1564699111', 0, 0, 15, 91),
(189, 'Eaque at numquam dolorum sequi.', '1564699111', 1, 1, 51, 88),
(190, 'Esse ut.', '1564699111', 1, 0, 36, 67),
(191, 'Qui tenetur sunt quidem.', '1564699111', 0, 1, 3, 15),
(192, 'Voluptatem ut soluta.', '1564699111', 1, 1, 55, 32),
(193, 'Doloribus voluptas consectetur quam explicabo accusantium.', '1564699111', 1, 0, 56, 47),
(194, 'Ducimus voluptatem illum.', '1564699111', 0, 0, 60, 92),
(195, 'Dolorem quo.', '1564699111', 1, 1, 31, 48),
(196, 'Aliquam optio.', '1564699111', 0, 1, 4, 22),
(197, 'Dolor.', '1564699111', 1, 0, 42, 26),
(198, 'Soluta magni explicabo.', '1564699111', 1, 1, 9, 72),
(199, 'Omnis facere similique.', '1564699111', 1, 1, 35, 17),
(200, 'Excepturi voluptatem voluptate sunt.', '1564699111', 1, 1, 13, 37),
(201, 'Quos facere quas adipisci odit minus.', '1564699111', 1, 1, 72, 25),
(202, 'Saepe.', '1564699111', 1, 1, 44, 9),
(203, 'Consequatur assumenda tenetur.', '1564699111', 0, 1, 91, 90),
(204, 'Qui ut.', '1564699111', 1, 0, 74, 82),
(205, 'Nesciunt.', '1564699111', 1, 1, 8, 59),
(206, 'Id quaerat velit nobis.', '1564699111', 1, 0, 72, 54),
(207, 'Odit rerum deleniti velit qui.', '1564699112', 0, 1, 34, 51),
(208, 'Soluta in.', '1564699112', 1, 0, 43, 66),
(209, 'Voluptas.', '1564699112', 1, 0, 41, 49),
(210, 'Nihil explicabo.', '1564699112', 1, 0, 15, 70),
(211, 'Numquam velit optio.', '1564699112', 0, 0, 78, 17),
(212, 'Est aliquid recusandae.', '1564699112', 0, 1, 19, 46),
(213, 'Deleniti.', '1564699112', 1, 1, 28, 12),
(214, 'Sit dolorem placeat adipisci.', '1564699112', 0, 1, 84, 35),
(215, 'Ducimus cumque.', '1564699112', 0, 1, 54, 27),
(216, 'Ut.', '1564699112', 0, 1, 44, 88),
(217, 'Quam molestiae.', '1564699112', 0, 0, 59, 19),
(218, 'Deserunt labore.', '1564699112', 1, 0, 41, 44),
(219, 'Facilis est deserunt sit.', '1564699112', 0, 1, 62, 42),
(220, 'Et id natus.', '1564699112', 0, 0, 45, 62),
(221, 'Aperiam non non.', '1564699112', 1, 1, 41, 50),
(222, 'Maiores laborum.', '1564699112', 1, 0, 16, 66),
(223, 'Dolore voluptatem.', '1564699112', 1, 0, 17, 10),
(224, 'Minus natus.', '1564699112', 1, 0, 86, 11),
(225, 'Corrupti ratione sit.', '1564699112', 1, 1, 12, 49),
(226, 'Est ratione iure dolore.', '1564699112', 0, 1, 83, 78),
(227, 'Non.', '1564699112', 0, 0, 24, 80),
(228, 'Cum praesentium.', '1564699112', 0, 1, 16, 31),
(229, 'Quam vel impedit quod eaque.', '1564699112', 0, 0, 16, 89),
(230, 'Minima asperiores.', '1564699112', 0, 1, 4, 54),
(231, 'Aut sequi assumenda.', '1564699112', 1, 0, 87, 43),
(232, 'Magnam eos.', '1564699112', 0, 1, 32, 66),
(233, 'Qui voluptatem nulla et.', '1564699112', 0, 0, 11, 21),
(234, 'Ut fugit.', '1564699112', 1, 0, 49, 30),
(235, 'Et iste veniam perferendis cum.', '1564699112', 0, 0, 34, 75),
(236, 'Id aut qui.', '1564699112', 1, 0, 38, 84),
(237, 'Neque tempore voluptate.', '1564699112', 1, 0, 68, 47),
(238, 'Molestias qui vel dicta.', '1564699112', 0, 0, 25, 13),
(239, 'Aut exercitationem.', '1564699112', 1, 0, 33, 51),
(240, 'Temporibus.', '1564699112', 1, 1, 93, 51),
(241, 'Accusantium harum sint.', '1564699112', 1, 0, 83, 76),
(242, 'Voluptates est et.', '1564699112', 0, 0, 63, 56),
(243, 'Dolores consequatur.', '1564699112', 0, 1, 77, 41),
(244, 'Et dignissimos.', '1564699112', 1, 0, 84, 54),
(245, 'Eveniet quia.', '1564699112', 1, 0, 82, 54),
(246, 'Neque.', '1564699112', 0, 0, 94, 86),
(247, 'Quo laudantium.', '1564699112', 0, 1, 47, 77),
(248, 'Qui.', '1564699112', 1, 1, 90, 93),
(249, 'Illo doloremque a.', '1564699112', 1, 1, 10, 73),
(250, 'Rem maiores.', '1564699112', 1, 0, 39, 25),
(251, 'Eos porro occaecati.', '1564699112', 0, 0, 27, 29),
(252, 'A sit qui.', '1564699112', 0, 0, 75, 88),
(253, 'Rerum officiis necessitatibus architecto dolorum.', '1564699112', 1, 1, 3, 11),
(254, 'Quasi.', '1564699112', 0, 0, 93, 2),
(255, 'Id minima.', '1564699112', 1, 1, 65, 93),
(256, 'Velit nihil et.', '1564699112', 0, 1, 71, 23),
(257, 'Autem.', '1564699112', 0, 1, 21, 62),
(258, 'Quisquam provident illo.', '1564699112', 0, 1, 89, 49),
(259, 'Non ut.', '1564699112', 0, 1, 95, 87),
(260, 'Asperiores earum ea vel.', '1564699112', 0, 1, 19, 8),
(261, 'Aspernatur nemo eum aperiam ab.', '1564699112', 0, 1, 56, 87),
(262, 'Neque error.', '1564699112', 0, 0, 41, 51),
(263, 'Et non repellendus labore id.', '1564699112', 0, 0, 61, 80),
(264, 'Libero occaecati nobis nemo.', '1564699112', 1, 1, 67, 25),
(265, 'Maxime ratione consequatur.', '1564699113', 1, 1, 74, 53),
(266, 'Dolore labore neque non.', '1564699113', 0, 1, 65, 55),
(267, 'Praesentium earum sapiente.', '1564699113', 1, 0, 27, 11),
(268, 'Excepturi et non.', '1564699113', 1, 1, 35, 88),
(269, 'Eveniet aut neque ut.', '1564699113', 0, 0, 52, 80),
(270, 'Necessitatibus itaque qui.', '1564699113', 1, 0, 79, 84),
(271, 'Cupiditate voluptates voluptatem.', '1564699113', 1, 1, 6, 84),
(272, 'Consequatur error aut.', '1564699113', 0, 0, 11, 67),
(273, 'Ea aut corporis dolore.', '1564699113', 1, 1, 24, 68),
(274, 'Placeat nisi nihil.', '1564699113', 1, 1, 41, 75),
(275, 'Officia sed.', '1564699113', 0, 0, 38, 57),
(276, 'Autem.', '1564699113', 1, 0, 43, 77),
(277, 'Accusantium modi unde sint.', '1564699113', 1, 1, 77, 5),
(278, 'Consequatur odit sit id ullam hic.', '1564699113', 0, 1, 26, 20),
(279, 'Voluptate officia ea neque.', '1564699113', 0, 1, 85, 79),
(280, 'Dolores omnis.', '1564699113', 0, 0, 14, 96),
(281, 'Et omnis.', '1564699113', 0, 1, 93, 37),
(282, 'Itaque voluptate esse.', '1564699113', 0, 0, 40, 14),
(283, 'Error numquam.', '1564699113', 1, 1, 24, 11),
(284, 'Eveniet et.', '1564699113', 1, 1, 94, 88),
(285, 'Non natus delectus ut in id.', '1564699113', 1, 0, 31, 59),
(286, 'Nihil molestiae quis.', '1564699113', 1, 0, 3, 89),
(287, 'Esse sapiente eius et perspiciatis.', '1564699113', 1, 0, 31, 65),
(288, 'Modi id.', '1564699113', 1, 0, 85, 95),
(289, 'Fuga animi.', '1564699113', 1, 0, 38, 3),
(290, 'Iste illum.', '1564699113', 1, 1, 91, 63),
(291, 'Eum itaque sunt beatae.', '1564699113', 0, 0, 68, 62),
(292, 'Delectus sequi.', '1564699113', 1, 1, 87, 95),
(293, 'Fuga distinctio voluptates.', '1564699113', 0, 1, 85, 14),
(294, 'Fugit soluta repellendus.', '1564699113', 0, 0, 31, 61),
(295, 'Quis occaecati.', '1564699113', 0, 0, 65, 95),
(296, 'Quia.', '1564699113', 1, 1, 53, 74),
(297, 'Quia illum non.', '1564699113', 1, 0, 8, 30),
(298, 'Architecto.', '1564699113', 1, 0, 93, 14),
(299, 'Quia in sint in provident provident.', '1564699113', 0, 0, 1, 45),
(300, 'Et quia.', '1564699113', 1, 0, 7, 80),
(301, 'Numquam voluptatibus iure.', '1564699113', 0, 1, 36, 46),
(302, 'Voluptas exercitationem quo illum excepturi earum.', '1564699113', 0, 0, 72, 44),
(303, 'Qui aliquam.', '1564699113', 1, 1, 17, 57),
(304, 'Voluptate repellendus voluptatem.', '1564699113', 1, 0, 83, 87),
(305, 'Dicta ex quod.', '1564699113', 1, 1, 59, 32),
(306, 'Sunt libero optio.', '1564699113', 0, 1, 49, 40),
(307, 'Inventore molestiae dolores.', '1564699113', 0, 0, 78, 86),
(308, 'Illum id aliquid.', '1564699113', 0, 1, 43, 25),
(309, 'Dolores reiciendis labore.', '1564699113', 0, 1, 37, 15),
(310, 'Sunt aut repudiandae nam.', '1564699113', 1, 0, 9, 12),
(311, 'Et est et illo.', '1564699113', 1, 0, 93, 50),
(312, 'Dolor.', '1564699113', 0, 0, 56, 50),
(313, 'Perspiciatis inventore et non.', '1564699113', 1, 1, 9, 62),
(314, 'Sequi soluta in.', '1564699113', 0, 1, 39, 67),
(315, 'Ipsum corporis.', '1564699113', 1, 1, 92, 39),
(316, 'Nihil temporibus non ut omnis.', '1564699113', 1, 1, 62, 76),
(317, 'Eveniet et repellat.', '1564699113', 0, 1, 64, 94),
(318, 'Vitae voluptates.', '1564699113', 1, 0, 66, 86),
(319, 'Illum amet voluptatem dignissimos sunt.', '1564699113', 1, 0, 8, 84),
(320, 'Rerum et.', '1564699113', 1, 1, 4, 10),
(321, 'Adipisci nihil esse atque.', '1564699113', 0, 0, 81, 7),
(322, 'Omnis ratione.', '1564699113', 1, 1, 74, 75),
(323, 'Quo quas sed iste.', '1564699113', 1, 0, 38, 35),
(324, 'Minus quia fugit.', '1564699113', 1, 1, 53, 49),
(325, 'Corporis praesentium assumenda commodi.', '1564699113', 1, 1, 82, 67),
(326, 'Aspernatur a.', '1564699113', 1, 0, 58, 90),
(327, 'Quisquam nulla voluptatem hic.', '1564699113', 0, 1, 47, 14),
(328, 'Sapiente dolores velit ducimus.', '1564699113', 1, 0, 44, 14),
(329, 'Molestias repudiandae praesentium.', '1564699113', 1, 1, 31, 37),
(330, 'Itaque sed.', '1564699113', 1, 0, 91, 78),
(331, 'Repellendus temporibus consequuntur.', '1564699113', 1, 0, 61, 40),
(332, 'Magni corporis commodi.', '1564699113', 1, 1, 66, 80),
(333, 'Accusamus deserunt culpa.', '1564699114', 0, 1, 33, 42),
(334, 'Labore magni laborum.', '1564699114', 1, 0, 18, 2),
(335, 'Nam fuga eum commodi.', '1564699114', 1, 0, 71, 7),
(336, 'Vero labore.', '1564699114', 0, 1, 95, 32),
(337, 'Et sunt.', '1564699114', 1, 1, 34, 58),
(338, 'Cumque neque.', '1564699114', 1, 1, 35, 8),
(339, 'Adipisci molestiae.', '1564699114', 1, 1, 43, 66),
(340, 'Qui consectetur non perferendis.', '1564699114', 1, 1, 5, 48),
(341, 'Ipsam.', '1564699114', 1, 0, 25, 5),
(342, 'Dicta.', '1564699114', 0, 1, 16, 61),
(343, 'Est.', '1564699114', 0, 1, 20, 67),
(344, 'Et occaecati.', '1564699114', 1, 1, 29, 87),
(345, 'At pariatur eos cumque distinctio enim.', '1564699114', 0, 1, 30, 22),
(346, 'Repellendus voluptatem.', '1564699114', 0, 0, 62, 95),
(347, 'Laudantium molestiae dolorum quidem.', '1564699114', 0, 0, 32, 65),
(348, 'Hic numquam ratione voluptas.', '1564699114', 0, 0, 77, 85),
(349, 'Voluptas nihil et.', '1564699114', 0, 0, 78, 65),
(350, 'Adipisci adipisci enim voluptas doloribus ut.', '1564699114', 0, 1, 8, 91),
(351, 'Unde nulla.', '1564699114', 0, 1, 40, 56),
(352, 'Sed aut.', '1564699114', 0, 0, 81, 79),
(353, 'Error laborum voluptatibus et nemo.', '1564699114', 0, 0, 45, 76),
(354, 'Voluptas dolores.', '1564699114', 0, 0, 88, 52),
(355, 'Ut quaerat.', '1564699114', 0, 1, 40, 93),
(356, 'Vel quia et.', '1564699114', 1, 1, 76, 19),
(357, 'Quia aliquid nesciunt culpa quia.', '1564699114', 1, 1, 20, 60),
(358, 'Est iusto necessitatibus.', '1564699114', 1, 0, 89, 25),
(359, 'Qui nam expedita.', '1564699114', 0, 0, 59, 52),
(360, 'Rerum.', '1564699114', 1, 1, 47, 57),
(361, 'Debitis harum nemo.', '1564699114', 1, 1, 34, 59),
(362, 'Et natus voluptatem architecto quis et.', '1564699114', 1, 1, 96, 25),
(363, 'Sed sit.', '1564699114', 1, 1, 41, 21),
(364, 'Similique at sint.', '1564699114', 0, 1, 30, 2),
(365, 'Perferendis quod error mollitia.', '1564699114', 1, 0, 60, 63),
(366, 'Nobis commodi corporis repudiandae.', '1564699114', 1, 1, 71, 93),
(367, 'Possimus.', '1564699114', 1, 0, 39, 81),
(368, 'Autem voluptatem libero.', '1564699114', 0, 0, 44, 62),
(369, 'Atque odit minima aut consectetur sit.', '1564699114', 0, 0, 24, 86),
(370, 'Et saepe.', '1564699114', 1, 1, 79, 41),
(371, 'Accusamus.', '1564699114', 1, 0, 50, 8),
(372, 'Quisquam ipsa quos dolor ad.', '1564699114', 1, 1, 62, 73),
(373, 'Sint repellendus.', '1564699114', 1, 1, 41, 1),
(374, 'Modi eveniet.', '1564699114', 0, 0, 64, 28),
(375, 'Est dolorum est.', '1564699114', 1, 0, 66, 58),
(376, 'Tempora voluptas dolores cumque dolorum vel.', '1564699114', 1, 0, 5, 18),
(377, 'Velit quia quo voluptates.', '1564699114', 1, 1, 80, 32),
(378, 'Sunt cum cum rerum neque.', '1564699114', 0, 0, 86, 14),
(379, 'Culpa ut facilis est commodi.', '1564699114', 1, 1, 95, 33),
(380, 'Quibusdam reiciendis eos cumque.', '1564699114', 0, 0, 44, 51),
(381, 'Assumenda commodi labore repellendus.', '1564699114', 1, 1, 27, 59),
(382, 'Corporis dolores hic.', '1564699114', 0, 0, 39, 28),
(383, 'Eos ipsam excepturi.', '1564699114', 0, 0, 60, 81),
(384, 'Voluptas ipsum fugiat commodi nam.', '1564699114', 0, 0, 87, 36),
(385, 'Rerum praesentium officia.', '1564699114', 1, 1, 19, 84),
(386, 'Aut labore.', '1564699114', 1, 1, 45, 35),
(387, 'Consequatur aut.', '1564699114', 0, 1, 22, 12),
(388, 'Est quis minima.', '1564699114', 0, 0, 61, 44),
(389, 'Voluptas nam officiis dolorem aut.', '1564699114', 1, 0, 2, 60),
(390, 'Ea dolore.', '1564699114', 0, 0, 7, 73),
(391, 'Voluptatum molestias et quasi ipsa qui.', '1564699114', 1, 0, 13, 27),
(392, 'Provident.', '1564699115', 0, 0, 55, 64),
(393, 'Laborum sed omnis autem laboriosam.', '1564699115', 1, 1, 56, 5),
(394, 'Sint.', '1564699115', 1, 0, 65, 27),
(395, 'Tempora eos.', '1564699115', 1, 0, 21, 29),
(396, 'Sint consequatur esse reiciendis.', '1564699115', 0, 1, 70, 51),
(397, 'Ut qui soluta eos.', '1564699115', 0, 0, 13, 90),
(398, 'Eius alias.', '1564699115', 1, 1, 72, 8),
(399, 'Sed veniam debitis.', '1564699115', 0, 1, 45, 73),
(400, 'Ducimus sed qui.', '1564699115', 0, 1, 39, 3),
(401, 'Repudiandae dolores.', '1564699115', 1, 0, 18, 17),
(402, 'Officia amet blanditiis tempore adipisci.', '1564699115', 1, 0, 2, 22),
(403, 'Id unde molestias.', '1564699115', 0, 1, 78, 45),
(404, 'Similique sunt nulla deleniti.', '1564699115', 0, 0, 24, 85),
(405, 'Magnam repudiandae omnis quae possimus.', '1564699115', 1, 0, 78, 94),
(406, 'Non non voluptates.', '1564699115', 0, 0, 37, 24),
(407, 'Fugit.', '1564699115', 0, 1, 40, 27),
(408, 'Vel facilis aperiam.', '1564699115', 0, 0, 49, 37),
(409, 'Maiores vel deserunt in.', '1564699115', 1, 1, 65, 17),
(410, 'Enim et.', '1564699115', 0, 0, 64, 25),
(411, 'Voluptas dolorum vitae asperiores.', '1564699115', 0, 1, 4, 17),
(412, 'Et voluptatem quia dolorum.', '1564699115', 1, 0, 44, 23),
(413, 'Nobis est.', '1564699115', 1, 1, 80, 90),
(414, 'Veniam.', '1564699115', 1, 1, 1, 55),
(415, 'Expedita quas ut consectetur corporis.', '1564699115', 0, 1, 79, 32),
(416, 'Beatae.', '1564699115', 0, 1, 96, 46),
(417, 'Blanditiis omnis dolores tempora.', '1564699115', 0, 1, 89, 89),
(418, 'Veniam doloremque.', '1564699115', 0, 0, 54, 79),
(419, 'Quam culpa iusto eaque.', '1564699115', 0, 1, 67, 67),
(420, 'Et repudiandae repellat.', '1564699115', 0, 1, 76, 46),
(421, 'Expedita qui delectus.', '1564699115', 0, 0, 54, 26),
(422, 'Quaerat.', '1564699115', 1, 1, 13, 37),
(423, 'Voluptate voluptatum saepe.', '1564699115', 0, 0, 8, 23),
(424, 'Dolorum velit similique nihil qui.', '1564699115', 1, 0, 85, 64),
(425, 'Fugit.', '1564699115', 1, 1, 66, 68),
(426, 'Quisquam aut voluptas mollitia.', '1564699116', 0, 1, 66, 7),
(427, 'Voluptatum cumque saepe eius.', '1564699116', 1, 1, 91, 34),
(428, 'Nemo officiis.', '1564699116', 1, 1, 28, 22),
(429, 'Nihil esse aut sed ut.', '1564699116', 0, 1, 1, 25),
(430, 'Architecto sed omnis sequi.', '1564699116', 0, 1, 79, 27),
(431, 'Ut.', '1564699116', 1, 1, 79, 88),
(432, 'Corporis dolores.', '1564699116', 1, 0, 28, 54),
(433, 'Exercitationem aliquam.', '1564699116', 1, 1, 23, 49),
(434, 'Qui dolorem in facere.', '1564699116', 0, 1, 44, 61),
(435, 'Totam qui vitae.', '1564699116', 1, 1, 10, 11),
(436, 'Ullam in.', '1564699116', 0, 1, 30, 59),
(437, 'Quis.', '1564699116', 1, 0, 32, 52),
(438, 'Fuga voluptatem sit quia quam quibusdam.', '1564699116', 1, 1, 40, 71),
(439, 'Minus maiores eius amet.', '1564699116', 0, 1, 87, 46),
(440, 'Neque voluptatem unde qui.', '1564699116', 1, 0, 51, 68),
(441, 'Delectus autem illum dignissimos voluptatem.', '1564699116', 0, 0, 12, 75),
(442, 'Eaque et.', '1564699116', 1, 0, 26, 93),
(443, 'Quae ratione labore.', '1564699116', 1, 0, 68, 74),
(444, 'Velit veritatis corrupti ratione.', '1564699116', 0, 1, 47, 8),
(445, 'Necessitatibus consequuntur nisi voluptatem sint officiis.', '1564699116', 0, 1, 89, 91),
(446, 'Et pariatur.', '1564699116', 1, 1, 60, 19),
(447, 'Mollitia quia sed labore.', '1564699116', 0, 1, 10, 91),
(448, 'Officia cumque.', '1564699116', 0, 0, 92, 5),
(449, 'Nesciunt veniam recusandae molestiae maxime sunt.', '1564699116', 0, 0, 51, 67),
(450, 'Asperiores error.', '1564699116', 1, 0, 33, 62),
(451, 'Eius non aperiam sed.', '1564699116', 0, 0, 71, 89),
(452, 'Quas dolores cumque vero.', '1564699116', 1, 0, 43, 23),
(453, 'Aut eum facilis quasi non.', '1564699116', 1, 1, 32, 14),
(454, 'Soluta et.', '1564699116', 1, 1, 2, 66),
(455, 'Dicta eum suscipit officia.', '1564699116', 0, 1, 58, 43),
(456, 'Explicabo suscipit qui.', '1564699116', 0, 0, 87, 59),
(457, 'Ut temporibus.', '1564699116', 0, 0, 19, 78),
(458, 'Cumque odit.', '1564699116', 1, 0, 63, 92),
(459, 'Magnam et.', '1564699116', 1, 1, 40, 9),
(460, 'Quas exercitationem.', '1564699116', 0, 1, 21, 96),
(461, 'Perferendis dolor.', '1564699116', 0, 1, 71, 44),
(462, 'Accusantium enim dolore et.', '1564699117', 1, 0, 81, 61),
(463, 'Asperiores porro non.', '1564699117', 1, 0, 96, 6),
(464, 'Quia blanditiis nihil.', '1564699117', 0, 0, 89, 32),
(465, 'Rerum saepe.', '1564699117', 1, 1, 80, 69),
(466, 'Sit exercitationem.', '1564699117', 1, 1, 5, 7),
(467, 'Earum in aut laudantium.', '1564699117', 1, 0, 85, 78),
(468, 'In provident enim rerum.', '1564699117', 1, 1, 22, 17),
(469, 'Sint consequatur.', '1564699117', 0, 0, 26, 51),
(470, 'Beatae quidem saepe.', '1564699117', 0, 1, 70, 59),
(471, 'Explicabo et.', '1564699117', 0, 0, 42, 44),
(472, 'Distinctio assumenda rem et expedita quo.', '1564699117', 1, 1, 29, 14),
(473, 'Qui a suscipit saepe animi temporibus.', '1564699117', 0, 1, 51, 70),
(474, 'Numquam veritatis rerum provident.', '1564699117', 0, 1, 56, 27),
(475, 'Totam aut et itaque.', '1564699117', 0, 1, 91, 17),
(476, 'Quasi libero dignissimos aliquid veniam consequatur.', '1564699117', 0, 1, 8, 87),
(477, 'Dolorem placeat officiis.', '1564699117', 1, 1, 19, 31),
(478, 'Voluptas est porro.', '1564699117', 0, 0, 15, 47),
(479, 'Vero explicabo explicabo et.', '1564699117', 1, 1, 63, 46),
(480, 'Odit explicabo ut.', '1564699117', 1, 0, 5, 54),
(481, 'Molestiae.', '1564699117', 0, 0, 47, 8),
(482, 'Fugiat non corporis.', '1564699117', 0, 0, 14, 57),
(483, 'At quis aut.', '1564699117', 1, 0, 43, 11),
(484, 'Doloribus aperiam recusandae occaecati ullam.', '1564699117', 0, 1, 45, 15),
(485, 'Omnis voluptas.', '1564699117', 1, 1, 61, 14),
(486, 'Et quas et corrupti et.', '1564699117', 1, 1, 34, 8),
(487, 'Neque aut deserunt sit.', '1564699117', 0, 1, 38, 58),
(488, 'Ut aliquam similique numquam.', '1564699118', 1, 0, 59, 89),
(489, 'Beatae.', '1564699118', 1, 1, 12, 21),
(490, 'In saepe accusantium facilis distinctio.', '1564699118', 1, 0, 94, 26),
(491, 'Voluptas odio veritatis aut.', '1564699118', 0, 0, 37, 48),
(492, 'Aut velit.', '1564699118', 0, 0, 26, 22),
(493, 'Expedita rerum.', '1564699118', 1, 0, 45, 12),
(494, 'Placeat deserunt tenetur sunt.', '1564699118', 1, 1, 55, 93),
(495, 'Qui qui quia eum nesciunt.', '1564699118', 1, 1, 41, 43),
(496, 'Consequuntur possimus quia.', '1564699118', 1, 0, 49, 81),
(497, 'Eligendi odio similique.', '1564699118', 1, 1, 76, 39),
(498, 'Ut ut.', '1564699118', 1, 1, 51, 85),
(499, 'Ducimus.', '1564699118', 1, 1, 78, 38),
(500, 'Debitis.', '1564699118', 0, 0, 11, 73);

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
  `notifSender` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mob_notifications`
--

INSERT INTO `mob_notifications` (`id`, `notifTo`, `notifToIds`, `notifData`, `notifDate`, `notifSender`) VALUES
(0, 'Annalise Kris III', 'teachers', 'Dolore molestiae adipisci ratione impedit odit.', 1564699108, 'Newton Adams'),
(0, 'Prof. Elsie Pacocha', 'students', 'Magnam ut illo eaque illum et voluptas aperiam repellendus voluptas sint.', 1564699108, 'Sean Stracke PhD'),
(0, 'Molly Balistreri', 'parents', 'Consequuntur harum quia veniam dolorem ea minima autem debitis inventore.', 1564699108, 'Angelita Terry'),
(0, 'Dr. Stephan VonRueden I', 'parents', 'Doloribus consequatur harum numquam adipisci.', 1564699108, 'Horace Koch'),
(0, 'Dr. Newton Schaefer', 'employees', 'Placeat eum delectus incidunt error eaque sit voluptas nobis quis.', 1564699108, 'Branson Hayes'),
(0, 'Augustine Corwin', 'students', 'Et expedita et est consectetur harum asperiores excepturi et ea.', 1564699108, 'Benny Bernier'),
(0, 'Rodrick Stracke', 'teachers', 'Sit expedita ad eos amet.', 1564699108, 'Mr. Devin Veum'),
(0, 'Brendon Gleichner', 'employees', 'Earum placeat ut architecto voluptatem recusandae velit numquam porro molestias quam.', 1564699108, 'Garrick Halvorson'),
(0, 'Kelley Schinner', 'teachers', 'Occaecati non nesciunt mollitia perferendis.', 1564699108, 'Vern Sawayn Sr.'),
(0, 'Kenna Ebert', 'students', 'Autem repellendus ullam dolores et quae sint doloribus vel vitae.', 1564699108, 'Dashawn Zieme MD'),
(0, 'Alexane Pouros', 'employees', 'Asperiores et quaerat et et incidunt.', 1564699108, 'Ms. Dovie Goodwin I'),
(0, 'Maximillian Murphy', 'employees', 'Quis maxime nobis est culpa et est natus.', 1564699108, 'Danny Wyman DDS'),
(0, 'Dr. Chaz Harber Sr.', 'teachers', 'Non ducimus quas assumenda quibusdam asperiores deserunt velit magni provident praesentium.', 1564699108, 'Lavinia Zboncak'),
(0, 'Elsa Moen IV', 'students', 'Aperiam fuga nobis quod at.', 1564699108, 'Lazaro Howell'),
(0, 'Dr. Merlin Friesen', 'students', 'Est tempore vel quis architecto modi amet quaerat.', 1564699108, 'Ulises Littel'),
(0, 'Clemmie Quitzon', 'students', 'Minus facere cupiditate.', 1564699108, 'Prof. Sigurd Kreiger'),
(0, 'Prof. Clarissa Russel', 'teachers', 'Enim rerum sunt nobis ut ea dolores quod exercitationem fuga.', 1564699108, 'Prof. Fredy Tromp DDS'),
(0, 'Talon Pacocha', 'parents', 'Quasi consequatur qui expedita beatae doloremque et non voluptatem.', 1564699108, 'Wilburn Dietrich'),
(0, 'Mr. Omari Marks', 'students', 'Iste facere rerum sapiente voluptas exercitationem doloribus repellendus molestias eaque necessitatibus.', 1564699108, 'Mr. Juston Considine Jr.'),
(0, 'Carol Gibson', 'students', 'Repellat aut placeat sed vel unde unde.', 1564699108, 'Dr. Brooks Satterfield V'),
(0, 'Monique Daugherty IV', 'employees', 'Quos alias quibusdam quia suscipit.', 1564699108, 'Kristopher Klocko'),
(0, 'Orlando Hills', 'employees', 'Et illo eligendi labore harum ut minima.', 1564699108, 'Prof. Freda Beier'),
(0, 'Curt Beatty', 'teachers', 'Adipisci enim a amet fugit sapiente culpa cum aut nesciunt.', 1564699108, 'Bridgette Murray'),
(0, 'Miss Magali Thompson MD', 'students', 'Doloribus distinctio eius odit eius rerum quo.', 1564699108, 'Okey Macejkovic'),
(0, 'Dr. Ryann Johns', 'students', 'In nisi nostrum nam reprehenderit explicabo aut.', 1564699108, 'Betsy Ortiz PhD'),
(0, 'Constantin Rohan', 'students', 'Veniam vero quis odio molestiae similique.', 1564699108, 'Alex Bogan'),
(0, 'Van Eichmann', 'employees', 'Enim repellendus adipisci repellendus.', 1564699108, 'Prof. Jayda Dare'),
(0, 'Jade Johnston', 'employees', 'Commodi impedit eum nulla consectetur consequuntur.', 1564699108, 'Heath Eichmann'),
(0, 'Stephen Kohler', 'teachers', 'Sed ullam magni rerum impedit sit eaque illo.', 1564699108, 'Mrs. Chaya Toy III'),
(0, 'Wilhelmine Becker', 'students', 'Rem non delectus earum.', 1564699108, 'Karen Moore'),
(0, 'Weldon Fritsch', 'students', 'Perspiciatis nam recusandae velit cupiditate.', 1564699108, 'Lance Zulauf'),
(0, 'Timmy Gottlieb III', 'students', 'Qui impedit est qui.', 1564699108, 'Dr. Foster Witting'),
(0, 'Prof. Devonte Bahringer', 'teachers', 'Ipsum alias esse fugit aperiam quos nisi natus ratione voluptas.', 1564699108, 'Dorian Toy'),
(0, 'Jovani Langworth PhD', 'parents', 'Consequatur aut qui ducimus corporis.', 1564699108, 'Alexandra Murphy'),
(0, 'Prof. Roosevelt Mayert I', 'parents', 'Nihil error incidunt corporis voluptatum est.', 1564699108, 'Ms. Deja Veum'),
(0, 'Prof. Daniela Eichmann', 'students', 'Sint aspernatur labore placeat quia corrupti labore.', 1564699108, 'Mr. Troy Hilpert'),
(0, 'Camryn Rolfson DDS', 'parents', 'Ducimus ipsam quam impedit dolor eos voluptas.', 1564699108, 'Miss Destiney Torphy'),
(0, 'Devan Emmerich', 'students', 'Qui et omnis eligendi sunt culpa.', 1564699109, 'Leola Buckridge'),
(0, 'Shane Keeling', 'employees', 'Enim reprehenderit ea reiciendis quisquam perferendis.', 1564699109, 'Kayley Stiedemann'),
(0, 'Miss Dolly Emmerich Jr.', 'students', 'Eos ad aperiam reprehenderit doloribus quia pariatur.', 1564699109, 'Macey Larkin'),
(0, 'Oda Bednar', 'students', 'Voluptatem unde inventore labore quibusdam voluptas sunt itaque iste.', 1564699109, 'Prof. Kaia Hand V'),
(0, 'Tyshawn Kuhn', 'students', 'Ullam ea velit inventore amet mollitia.', 1564699109, 'Miss Brigitte Blanda'),
(0, 'Ms. Antonietta Kihn', 'teachers', 'Voluptas tempora ducimus voluptatem magni amet cumque dignissimos.', 1564699109, 'Elmer Murphy'),
(0, 'Maxie Koch V', 'parents', 'Non excepturi temporibus illum beatae.', 1564699109, 'Mazie Runte'),
(0, 'Madisen Krajcik', 'employees', 'Est id a ut dolorum minima ducimus est blanditiis.', 1564699109, 'Benton Green'),
(0, 'Catherine Dickinson', 'teachers', 'Sint sunt provident excepturi quam.', 1564699109, 'Dr. Tanner Predovic PhD'),
(0, 'Ms. Pearl Dietrich II', 'parents', 'Provident dolorem quos dolorem.', 1564699109, 'Reggie Feil'),
(0, 'Kraig Predovic', 'students', 'Iste necessitatibus quia qui.', 1564699109, 'Arnold Bergnaum'),
(0, 'Ms. Charity Wilderman', 'students', 'Quia et quibusdam fugit voluptate.', 1564699109, 'Prof. Bettye Lemke II'),
(0, 'Zetta Blanda Jr.', 'parents', 'Eum rerum accusantium aliquid et nulla.', 1564699109, 'Emile Raynor');

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
(1, 'Illum eaque voluptatibus dignissimos.', 'Illo quibusdam molestiae pariatur pariatur quos ut tempora omnis enim.', 'all', 1564699107, '', 0, 1564699107),
(2, 'Laboriosam est rerum.', 'Maxime quisquam et ratione magni rerum vel.', 'students', 1564699107, '', 0, 1564699107),
(3, 'Voluptates perferendis repudiandae architecto.', 'Laborum laboriosam quas quisquam delectus esse unde eos et quia nesciunt sunt incidunt.', 'all', 1564699107, '', 0, 1564699107),
(4, 'Autem sunt debitis.', 'Id voluptatem assumenda non et omnis officia qui.', 'all', 1564699107, '', 0, 1564699107),
(5, 'Et tenetur et labore.', 'Animi praesentium est aperiam est ab doloremque ut repellat praesentium.', 'teacher', 1564699107, '', 1, 1564699107),
(6, 'Aperiam et enim.', 'Sint aut ut aliquid labore rerum neque.', 'parents', 1564699107, '', 0, 1564699107),
(7, 'Possimus sapiente eius voluptatem.', 'Repudiandae exercitationem voluptatem consequatur pariatur debitis aut delectus.', 'parents', 1564699107, '', 0, 1564699107),
(8, 'Praesentium animi necessitatibus.', 'Nemo quae est quod est deserunt tenetur incidunt enim voluptas quaerat aut ducimus.', 'all', 1564699107, '', 0, 1564699107),
(9, 'Aliquid perspiciatis doloremque.', 'Veniam qui molestiae est quaerat ab beatae quasi ipsa at quo.', 'all', 1564699107, '', 0, 1564699107),
(10, 'Commodi sit ut.', 'Aut et aut et velit tenetur autem eos consequuntur et.', 'students', 1564699107, '', 1, 1564699107),
(11, 'Exercitationem id omnis.', 'Beatae perferendis assumenda autem commodi qui explicabo.', 'all', 1564699107, '', 1, 1564699107),
(12, 'Accusantium quia.', 'Occaecati non est cum aut qui.', 'parents', 1564699107, '', 1, 1564699107),
(13, 'Culpa ea et.', 'Aut asperiores et eius explicabo doloribus non enim quis harum sequi.', 'parents', 1564699107, '', 0, 1564699107),
(14, 'Ut ut sed.', 'Expedita a sed accusantium voluptatem quis sed reprehenderit itaque sit facilis laboriosam velit tempora.', 'all', 1564699107, '', 1, 1564699107),
(15, 'Ex ullam doloribus.', 'Commodi quia voluptatem facilis in dolores.', 'all', 1564699107, '', 0, 1564699107),
(16, 'Pariatur nihil.', 'Ipsa cum provident voluptates assumenda velit excepturi provident.', 'parents', 1564699107, '', 0, 1564699107),
(17, 'Magni ut autem voluptas.', 'Debitis ullam dolorum id quis reiciendis est ut et ipsam consequatur asperiores.', 'students', 1564699107, '', 1, 1564699107),
(18, 'Perspiciatis quis et qui sit.', 'Modi voluptatem sequi necessitatibus autem eveniet aliquam repellendus et.', 'all', 1564699107, '', 0, 1564699107),
(19, 'Qui dolor aut.', 'Minima quod aut quos provident est beatae.', 'students', 1564699107, '', 0, 1564699107),
(20, 'Placeat temporibus.', 'Eligendi et suscipit blanditiis nostrum nemo est dolorem.', 'students', 1564699107, '', 1, 1564699107);

-- --------------------------------------------------------

--
-- Table structure for table `notifications_mob_history`
--

CREATE TABLE `notifications_mob_history` (
  `id` int(11) NOT NULL,
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
(1, 'Quo et.', 'New home work is added', 91, 1565303919, 'event', NULL),
(2, 'Delectus perferendis quis.', 'New home work is added', 86, 1564612719, 'homework', NULL),
(3, 'Officia.', 'New event was set', 82, 1564612719, 'homework', NULL),
(4, 'Sunt vero.', 'Attenndance for student: Jaylen Ferry is present', 76, 1563403119, 'homework', NULL),
(5, 'Officiis.', 'Attenndance for student: Jaylen Ferry is present', 89, 1564785519, 'homework', NULL),
(6, 'Eum.', 'New home work is added', 88, 1564267119, 'homework', NULL),
(7, 'Harum et.', 'New home work is added', 89, 1563662319, 'homework', NULL),
(8, 'Eligendi non.', 'New event was set', 86, 1565044719, 'event', NULL),
(9, 'Odio ab.', 'New home work is added', 76, 1565908719, 'attendance', NULL),
(10, 'Consequuntur commodi.', 'Attenndance for student: Jaylen Ferry is present', 89, 1565217519, 'event', NULL),
(11, 'Quia voluptate.', 'New home work is added', 94, 1565476719, 'attendance', NULL),
(12, 'Maiores et.', 'Attenndance for student: Jaylen Ferry is present', 91, 1563489519, 'homework', NULL),
(13, 'Est enim sed.', 'New home work is added', 80, 1565217520, 'homework', NULL),
(14, 'Quia sequi pariatur.', 'New event was set', 89, 1564439920, 'homework', NULL),
(15, 'Accusantium magnam veritatis.', 'New event was set', 85, 1565303920, 'homework', NULL),
(16, 'Magnam sed eaque.', 'Attenndance for student: Jaylen Ferry is present', 90, 1563575920, 'event', NULL),
(17, 'Ut.', 'New home work is added', 92, 1563921520, 'attendance', NULL),
(18, 'Dolorem dicta.', 'Attenndance for student: Jaylen Ferry is present', 84, 1565044720, 'event', NULL),
(19, 'Dolor.', 'New home work is added', 89, 1563748720, 'homework', NULL),
(20, 'Illo recusandae et.', 'Attenndance for student: Jaylen Ferry is present', 76, 1564007920, 'attendance', NULL),
(21, 'Odio.', 'Attenndance for student: Jaylen Ferry is present', 80, 1565476720, 'homework', NULL),
(22, 'Dolor dolorem eaque.', 'New home work is added', 89, 1564439920, 'attendance', NULL),
(23, 'Dolore sint.', 'New event was set', 93, 1565649520, 'homework', NULL),
(24, 'Quibusdam omnis.', 'New home work is added', 80, 1565649520, 'attendance', NULL),
(25, 'Eveniet.', 'New home work is added', 81, 1565390320, 'event', NULL),
(26, 'Quos optio ipsa.', 'Attenndance for student: Jaylen Ferry is present', 78, 1563662320, 'event', NULL),
(27, 'Labore est.', 'Attenndance for student: Jaylen Ferry is present', 82, 1564007920, 'attendance', NULL),
(28, 'Commodi sed.', 'New event was set', 88, 1565822320, 'homework', NULL),
(29, 'Ut.', 'New event was set', 84, 1565390320, 'attendance', NULL),
(30, 'Aut odit odio.', 'New home work is added', 91, 1565995120, 'homework', NULL),
(31, 'Iure.', 'New home work is added', 85, 1565649520, 'attendance', NULL),
(32, 'Et atque.', 'New event was set', 87, 1565303921, 'attendance', NULL),
(33, 'Corporis ut.', 'New home work is added', 85, 1565908721, 'event', NULL),
(34, 'Provident ut.', 'New event was set', 92, 1563662321, 'attendance', NULL),
(35, 'Sed qui iusto.', 'Attenndance for student: Jaylen Ferry is present', 76, 1564785521, 'event', NULL),
(36, 'Reiciendis ratione.', 'New home work is added', 92, 1564094321, 'event', NULL),
(37, 'Harum est.', 'New home work is added', 93, 1564439921, 'event', NULL),
(38, 'Eos et molestias.', 'New home work is added', 78, 1564439921, 'homework', NULL),
(39, 'Maxime.', 'New event was set', 80, 1564353521, 'homework', NULL),
(40, 'Est.', 'Attenndance for student: Jaylen Ferry is present', 93, 1563921521, 'homework', NULL),
(41, 'Aut occaecati.', 'Attenndance for student: Jaylen Ferry is present', 91, 1565217521, 'homework', NULL),
(42, 'Ut id blanditiis.', 'New home work is added', 93, 1565390321, 'attendance', NULL),
(43, 'Vel qui.', 'New event was set', 92, 1565476721, 'event', NULL),
(44, 'Maxime.', 'Attenndance for student: Jaylen Ferry is present', 91, 1565476721, 'event', NULL),
(45, 'Voluptas.', 'Attenndance for student: Jaylen Ferry is present', 94, 1565995121, 'homework', NULL),
(46, 'Molestias exercitationem.', 'New home work is added', 80, 1564439921, 'homework', NULL),
(47, 'Eligendi eius.', 'New home work is added', 85, 1564007921, 'attendance', NULL),
(48, 'Sint.', 'New event was set', 92, 1564180721, 'event', NULL),
(49, 'Facilis vitae amet.', 'Attenndance for student: Jaylen Ferry is present', 78, 1564785521, 'attendance', NULL),
(50, 'Odio id.', 'Attenndance for student: Jaylen Ferry is present', 77, 1565908721, 'homework', NULL),
(51, 'Commodi.', 'New home work is added', 88, 1565908721, 'attendance', NULL),
(52, 'Laudantium.', 'New home work is added', 85, 1565131121, 'event', NULL),
(53, 'Velit et.', 'New home work is added', 87, 1565476721, 'event', NULL),
(54, 'Libero.', 'New event was set', 79, 1563403121, 'attendance', NULL),
(55, 'Vel et.', 'Attenndance for student: Jaylen Ferry is present', 81, 1564439921, 'attendance', NULL),
(56, 'Harum itaque.', 'Attenndance for student: Jaylen Ferry is present', 91, 1564871921, 'homework', NULL),
(57, 'Impedit vel vel.', 'New home work is added', 86, 1564267121, 'event', NULL),
(58, 'Est molestias.', 'New home work is added', 76, 1564612722, 'event', NULL),
(59, 'Facilis asperiores minus.', 'New event was set', 76, 1565822322, 'attendance', NULL),
(60, 'Molestiae quas.', 'Attenndance for student: Jaylen Ferry is present', 78, 1564612722, 'event', NULL),
(61, 'Dicta eum.', 'New home work is added', 91, 1564007922, 'event', NULL),
(62, 'Maiores fuga.', 'New home work is added', 81, 1565908722, 'event', NULL),
(63, 'Facere deserunt doloremque.', 'Attenndance for student: Jaylen Ferry is present', 93, 1565822322, 'attendance', NULL),
(64, 'Architecto.', 'Attenndance for student: Jaylen Ferry is present', 93, 1565995122, 'homework', NULL),
(65, 'Dolores optio.', 'New home work is added', 96, 1565822322, 'attendance', NULL),
(66, 'Eos pariatur.', 'New home work is added', 93, 1565303922, 'event', NULL),
(67, 'Eligendi nihil.', 'Attenndance for student: Jaylen Ferry is present', 79, 1565822322, 'attendance', NULL),
(68, 'Inventore.', 'New event was set', 83, 1564094322, 'attendance', NULL),
(69, 'Rerum.', 'New home work is added', 90, 1563403122, 'homework', NULL),
(70, 'Perferendis aut.', 'Attenndance for student: Jaylen Ferry is present', 80, 1563575922, 'attendance', NULL),
(71, 'Harum tempora perferendis.', 'New home work is added', 81, 1564180722, 'attendance', NULL),
(72, 'Nam unde.', 'New event was set', 81, 1564785522, 'homework', NULL),
(73, 'Et aperiam.', 'Attenndance for student: Jaylen Ferry is present', 83, 1565822322, 'homework', NULL),
(74, 'Accusantium.', 'New event was set', 80, 1565390322, 'event', NULL),
(75, 'Ad dolorem.', 'New event was set', 82, 1564526322, 'event', NULL),
(76, 'Consequatur ad at.', 'New event was set', 76, 1563489522, 'attendance', NULL),
(77, 'Error minima dolor.', 'Attenndance for student: Jaylen Ferry is present', 96, 1565822323, 'event', NULL),
(78, 'Nesciunt aliquam.', 'Attenndance for student: Jaylen Ferry is present', 95, 1565131123, 'attendance', NULL),
(79, 'Et provident nam.', 'New event was set', 82, 1564094323, 'attendance', NULL),
(80, 'Aperiam.', 'New home work is added', 85, 1563748723, 'homework', NULL),
(81, 'Nemo incidunt qui.', 'New home work is added', 84, 1564267123, 'homework', NULL),
(82, 'Quas ea non.', 'New home work is added', 85, 1565476723, 'homework', NULL),
(83, 'Ad earum aliquid.', 'Attenndance for student: Jaylen Ferry is present', 90, 1564180723, 'homework', NULL),
(84, 'Distinctio.', 'Attenndance for student: Jaylen Ferry is present', 81, 1564267123, 'attendance', NULL),
(85, 'Temporibus.', 'Attenndance for student: Jaylen Ferry is present', 93, 1565995123, 'attendance', NULL),
(86, 'In alias.', 'New event was set', 87, 1563575923, 'event', NULL),
(87, 'Itaque iste aliquid.', 'Attenndance for student: Jaylen Ferry is present', 95, 1565908723, 'homework', NULL),
(88, 'Vitae aut.', 'New home work is added', 88, 1563835123, 'homework', NULL),
(89, 'Reiciendis in.', 'New home work is added', 78, 1563489523, 'event', NULL),
(90, 'Ut molestiae.', 'New home work is added', 95, 1564612723, 'homework', NULL),
(91, 'Et numquam voluptas.', 'New home work is added', 82, 1565822323, 'homework', NULL),
(92, 'Ipsum dignissimos dicta.', 'Attenndance for student: Jaylen Ferry is present', 78, 1564353523, 'attendance', NULL),
(93, 'Quia facere.', 'New event was set', 81, 1563489523, 'attendance', NULL),
(94, 'Ipsa.', 'New event was set', 93, 1564785523, 'homework', NULL),
(95, 'Alias sequi eligendi.', 'New home work is added', 83, 1563921523, 'event', NULL),
(96, 'Accusamus assumenda sit.', 'New home work is added', 89, 1564439923, 'event', NULL),
(97, 'Est error omnis.', 'New home work is added', 89, 1564180723, 'homework', NULL),
(98, 'Dolorum perspiciatis excepturi.', 'Attenndance for student: Jaylen Ferry is present', 91, 1564612723, 'homework', NULL),
(99, 'Quas sint.', 'New event was set', 80, 1563835123, 'homework', NULL),
(100, 'Sit rerum voluptatem.', 'New event was set', 82, 1565390323, 'homework', NULL),
(101, 'Neque.', 'New home work is added', 93, 1565044723, 'attendance', NULL),
(102, 'Ut ex voluptas.', 'Attenndance for student: Jaylen Ferry is present', 96, 1563403123, 'attendance', NULL),
(103, 'Rerum veniam quas.', 'Attenndance for student: Jaylen Ferry is present', 76, 1563403123, 'attendance', NULL),
(104, 'Eum.', 'New event was set', 82, 1565303923, 'attendance', NULL),
(105, 'Consequatur quia.', 'Attenndance for student: Jaylen Ferry is present', 91, 1565303923, 'homework', NULL),
(106, 'Ut rerum.', 'New event was set', 96, 1564612723, 'attendance', NULL),
(107, 'Dolor.', 'New home work is added', 81, 1564180723, 'homework', NULL),
(108, 'Modi.', 'Attenndance for student: Jaylen Ferry is present', 76, 1565563123, 'homework', NULL),
(109, 'Et delectus tempore.', 'New event was set', 90, 1563403123, 'attendance', NULL),
(110, 'Saepe est.', 'New event was set', 86, 1565044723, 'homework', NULL),
(111, 'Perspiciatis doloremque.', 'New home work is added', 90, 1565735923, 'homework', NULL),
(112, 'Delectus excepturi.', 'New home work is added', 84, 1565908724, 'homework', NULL),
(113, 'Voluptatem.', 'New event was set', 76, 1563748724, 'homework', NULL),
(114, 'Beatae molestias.', 'New home work is added', 85, 1563575924, 'attendance', NULL),
(115, 'Voluptas.', 'New home work is added', 95, 1565044724, 'homework', NULL),
(116, 'Doloremque omnis.', 'Attenndance for student: Jaylen Ferry is present', 96, 1564526324, 'homework', NULL),
(117, 'Eveniet dolorem ipsam.', 'New home work is added', 78, 1565131124, 'event', NULL),
(118, 'Fugit.', 'Attenndance for student: Jaylen Ferry is present', 95, 1564958324, 'attendance', NULL),
(119, 'Sit voluptatem alias.', 'New event was set', 86, 1565735924, 'attendance', NULL),
(120, 'Ullam est.', 'Attenndance for student: Jaylen Ferry is present', 92, 1564267124, 'attendance', NULL),
(121, 'Sint.', 'Attenndance for student: Jaylen Ferry is present', 79, 1565908724, 'attendance', NULL),
(122, 'Reprehenderit voluptates.', 'Attenndance for student: Jaylen Ferry is present', 88, 1564439924, 'homework', NULL),
(123, 'Asperiores.', 'New home work is added', 90, 1564267124, 'event', NULL),
(124, 'Neque aliquam.', 'New event was set', 85, 1563575924, 'homework', NULL),
(125, 'Earum autem consectetur.', 'New event was set', 77, 1563403124, 'attendance', NULL),
(126, 'Vel incidunt.', 'New home work is added', 92, 1564612724, 'event', NULL),
(127, 'Dolore voluptatibus aliquam.', 'Attenndance for student: Jaylen Ferry is present', 89, 1565476724, 'event', NULL),
(128, 'Dolores quas laboriosam.', 'New event was set', 80, 1565908724, 'event', NULL),
(129, 'Explicabo.', 'New home work is added', 94, 1563662324, 'attendance', NULL),
(130, 'Voluptatem quasi.', 'New event was set', 95, 1565476724, 'attendance', NULL),
(131, 'Et aut consequatur.', 'New event was set', 82, 1563921524, 'attendance', NULL),
(132, 'Suscipit eligendi.', 'Attenndance for student: Jaylen Ferry is present', 89, 1565649524, 'homework', NULL),
(133, 'Commodi libero vel.', 'Attenndance for student: Jaylen Ferry is present', 84, 1565908724, 'attendance', NULL),
(134, 'Minus est facilis.', 'New home work is added', 88, 1563921524, 'homework', NULL),
(135, 'Autem.', 'Attenndance for student: Jaylen Ferry is present', 76, 1564526324, 'attendance', NULL),
(136, 'Quo.', 'New event was set', 93, 1564958324, 'homework', NULL),
(137, 'Velit.', 'New event was set', 80, 1563662324, 'homework', NULL),
(138, 'Dolor rerum.', 'New event was set', 81, 1565822324, 'attendance', NULL),
(139, 'Repellat consequatur.', 'New home work is added', 76, 1563489524, 'homework', NULL),
(140, 'Tempora nisi.', 'New event was set', 77, 1564439924, 'attendance', NULL),
(141, 'Velit perspiciatis at.', 'New home work is added', 78, 1565390324, 'event', NULL),
(142, 'Quis a.', 'Attenndance for student: Jaylen Ferry is present', 82, 1565476724, 'homework', NULL),
(143, 'Est alias.', 'New event was set', 88, 1563921524, 'event', NULL),
(144, 'Voluptates.', 'New home work is added', 96, 1565735924, 'attendance', NULL),
(145, 'Quae voluptas.', 'New home work is added', 94, 1563835124, 'homework', NULL),
(146, 'Reprehenderit provident.', 'New event was set', 91, 1565563124, 'event', NULL),
(147, 'Quod.', 'New event was set', 96, 1564267124, 'event', NULL),
(148, 'Quo.', 'New home work is added', 92, 1563748724, 'attendance', NULL),
(149, 'Velit excepturi.', 'New event was set', 83, 1564526324, 'attendance', NULL),
(150, 'Dicta qui.', 'New home work is added', 78, 1564526324, 'homework', NULL),
(151, 'Rerum.', 'New home work is added', 77, 1565649524, 'attendance', NULL),
(152, 'Exercitationem.', 'New event was set', 79, 1564785524, 'event', NULL),
(153, 'Ducimus alias.', 'Attenndance for student: Jaylen Ferry is present', 86, 1565563124, 'attendance', NULL),
(154, 'Et nobis.', 'New event was set', 78, 1563748724, 'homework', NULL),
(155, 'Ea repellendus.', 'Attenndance for student: Jaylen Ferry is present', 87, 1563403124, 'event', NULL),
(156, 'Amet dignissimos molestias.', 'New home work is added', 76, 1564785524, 'event', NULL),
(157, 'At nobis.', 'New home work is added', 80, 1564094324, 'attendance', NULL),
(158, 'Exercitationem quos.', 'Attenndance for student: Jaylen Ferry is present', 93, 1563662324, 'homework', NULL),
(159, 'Et rem veritatis.', 'New event was set', 93, 1565217524, 'homework', NULL),
(160, 'Ut distinctio.', 'New event was set', 93, 1564267124, 'event', NULL),
(161, 'Omnis est modi.', 'New event was set', 88, 1563921524, 'homework', NULL),
(162, 'Alias sed.', 'New home work is added', 88, 1563921524, 'homework', NULL),
(163, 'Qui illo.', 'New event was set', 92, 1564871924, 'homework', NULL),
(164, 'Explicabo.', 'Attenndance for student: Jaylen Ferry is present', 81, 1565822324, 'attendance', NULL),
(165, 'Quam repellendus eum.', 'New event was set', 94, 1563489524, 'event', NULL),
(166, 'Dolorem illo.', 'New home work is added', 89, 1564007924, 'homework', NULL),
(167, 'Quo recusandae autem.', 'Attenndance for student: Jaylen Ferry is present', 88, 1563489524, 'attendance', NULL),
(168, 'Quo beatae.', 'New event was set', 90, 1564785524, 'event', NULL),
(169, 'Ut.', 'New event was set', 85, 1564267124, 'attendance', NULL),
(170, 'Aut neque.', 'New home work is added', 90, 1564180724, 'event', NULL),
(171, 'Aut consequatur.', 'Attenndance for student: Jaylen Ferry is present', 79, 1563403124, 'event', NULL),
(172, 'Maxime.', 'Attenndance for student: Jaylen Ferry is present', 96, 1563575924, 'attendance', NULL),
(173, 'Eaque qui ex.', 'New home work is added', 85, 1563489524, 'event', NULL),
(174, 'Eum.', 'New home work is added', 89, 1564526324, 'homework', NULL),
(175, 'Qui nihil.', 'New home work is added', 76, 1565131124, 'attendance', NULL),
(176, 'Quisquam magnam mollitia.', 'New event was set', 95, 1565563124, 'attendance', NULL),
(177, 'Dicta quia.', 'Attenndance for student: Jaylen Ferry is present', 76, 1563835124, 'attendance', NULL),
(178, 'Atque qui autem.', 'New event was set', 79, 1565390324, 'homework', NULL),
(179, 'Quam ut.', 'New home work is added', 80, 1565822324, 'attendance', NULL),
(180, 'Architecto iusto.', 'New home work is added', 87, 1564958325, 'attendance', NULL),
(181, 'Quos odio.', 'New event was set', 86, 1565131125, 'homework', NULL),
(182, 'Tempora molestiae.', 'New home work is added', 87, 1565563125, 'homework', NULL),
(183, 'Soluta.', 'New event was set', 94, 1564180725, 'event', NULL),
(184, 'Perspiciatis animi officia.', 'New home work is added', 93, 1563748725, 'homework', NULL),
(185, 'Occaecati porro.', 'New event was set', 85, 1565995125, 'homework', NULL),
(186, 'Consequuntur omnis.', 'New event was set', 91, 1563575925, 'event', NULL),
(187, 'Aut accusamus modi.', 'New home work is added', 83, 1564785525, 'event', NULL),
(188, 'Laborum ut.', 'New event was set', 92, 1564353525, 'homework', NULL),
(189, 'Modi voluptates.', 'New event was set', 76, 1564612725, 'event', NULL),
(190, 'Veniam.', 'Attenndance for student: Jaylen Ferry is present', 82, 1564267125, 'event', NULL),
(191, 'Reprehenderit.', 'New home work is added', 90, 1564353525, 'homework', NULL),
(192, 'Et.', 'New home work is added', 80, 1565908725, 'homework', NULL),
(193, 'Aut voluptatem.', 'New home work is added', 89, 1563489525, 'homework', NULL),
(194, 'Ipsam.', 'New home work is added', 87, 1563662325, 'homework', NULL),
(195, 'Qui corrupti.', 'New event was set', 94, 1564180725, 'event', NULL),
(196, 'Consequatur est.', 'Attenndance for student: Jaylen Ferry is present', 78, 1563403125, 'homework', NULL),
(197, 'Ut quidem.', 'Attenndance for student: Jaylen Ferry is present', 87, 1565303925, 'event', NULL),
(198, 'Aperiam aut debitis.', 'New event was set', 90, 1564871925, 'homework', NULL),
(199, 'Occaecati qui.', 'Attenndance for student: Jaylen Ferry is present', 80, 1565908725, 'attendance', NULL),
(200, 'Delectus aliquam.', 'New home work is added', 83, 1563403125, 'homework', NULL),
(201, 'Porro.', 'New home work is added', 82, 1563662325, 'homework', NULL),
(202, 'Eum quia non.', 'Attenndance for student: Jaylen Ferry is present', 95, 1564785525, 'homework', NULL),
(203, 'Placeat.', 'New home work is added', 87, 1563921525, 'homework', NULL),
(204, 'Quis autem.', 'New home work is added', 91, 1564007925, 'homework', NULL),
(205, 'Fugit vel.', 'New home work is added', 92, 1564785525, 'attendance', NULL),
(206, 'Eius.', 'New event was set', 79, 1564094325, 'homework', NULL),
(207, 'Consequatur magni.', 'New event was set', 85, 1565390325, 'attendance', NULL),
(208, 'Labore neque.', 'New event was set', 90, 1563575925, 'attendance', NULL),
(209, 'Consequatur est suscipit.', 'Attenndance for student: Jaylen Ferry is present', 82, 1564180725, 'event', NULL),
(210, 'Autem nihil.', 'New home work is added', 76, 1565822325, 'attendance', NULL),
(211, 'Corporis error.', 'New home work is added', 93, 1564353525, 'attendance', NULL),
(212, 'Nisi.', 'New event was set', 91, 1565303925, 'attendance', NULL),
(213, 'Dolor ut.', 'New home work is added', 82, 1563575925, 'attendance', NULL),
(214, 'Inventore eos eaque.', 'Attenndance for student: Jaylen Ferry is present', 95, 1564612725, 'event', NULL),
(215, 'Voluptatem.', 'New event was set', 88, 1565908725, 'attendance', NULL),
(216, 'Minus perferendis.', 'New home work is added', 78, 1565908725, 'event', NULL),
(217, 'Similique et.', 'New home work is added', 94, 1563489525, 'homework', NULL),
(218, 'Tempore est.', 'New event was set', 85, 1564007925, 'attendance', NULL),
(219, 'Ducimus.', 'New event was set', 80, 1564094325, 'event', NULL),
(220, 'At.', 'Attenndance for student: Jaylen Ferry is present', 77, 1564007925, 'attendance', NULL),
(221, 'Tenetur.', 'New home work is added', 85, 1564871925, 'attendance', NULL),
(222, 'Explicabo sunt.', 'Attenndance for student: Jaylen Ferry is present', 86, 1564094325, 'attendance', NULL),
(223, 'Eos necessitatibus nemo.', 'New home work is added', 95, 1564439925, 'homework', NULL),
(224, 'Enim.', 'New event was set', 87, 1564094325, 'attendance', NULL),
(225, 'Consequatur incidunt ab.', 'Attenndance for student: Jaylen Ferry is present', 86, 1564180725, 'event', NULL),
(226, 'Cumque fugiat.', 'New home work is added', 95, 1565131125, 'attendance', NULL),
(227, 'Ad ea.', 'New event was set', 78, 1563921525, 'event', NULL),
(228, 'Quas.', 'Attenndance for student: Jaylen Ferry is present', 89, 1565649525, 'homework', NULL),
(229, 'Quasi eos.', 'Attenndance for student: Jaylen Ferry is present', 93, 1565908725, 'attendance', NULL),
(230, 'Dolorum blanditiis.', 'Attenndance for student: Jaylen Ferry is present', 85, 1565131125, 'event', NULL),
(231, 'Quis.', 'New home work is added', 78, 1565908725, 'event', NULL),
(232, 'Tenetur.', 'Attenndance for student: Jaylen Ferry is present', 91, 1565563125, 'attendance', NULL),
(233, 'Est voluptatem labore.', 'Attenndance for student: Jaylen Ferry is present', 76, 1564439925, 'event', NULL),
(234, 'Quisquam.', 'Attenndance for student: Jaylen Ferry is present', 81, 1564871925, 'attendance', NULL),
(235, 'Est quia et.', 'Attenndance for student: Jaylen Ferry is present', 80, 1565735925, 'attendance', NULL),
(236, 'Ipsa ut.', 'Attenndance for student: Jaylen Ferry is present', 81, 1564871925, 'attendance', NULL),
(237, 'Sit ad.', 'New home work is added', 82, 1565908725, 'homework', NULL),
(238, 'Perspiciatis consequatur.', 'Attenndance for student: Jaylen Ferry is present', 86, 1564353525, 'event', NULL),
(239, 'Quaerat.', 'New home work is added', 94, 1563403125, 'homework', NULL),
(240, 'Eum.', 'New home work is added', 83, 1564439925, 'event', NULL),
(241, 'Totam tempore.', 'New home work is added', 90, 1565995125, 'attendance', NULL),
(242, 'Qui iste.', 'New event was set', 91, 1563403125, 'event', NULL),
(243, 'Sunt.', 'Attenndance for student: Jaylen Ferry is present', 84, 1563921525, 'attendance', NULL),
(244, 'Quasi expedita in.', 'Attenndance for student: Jaylen Ferry is present', 91, 1564958325, 'attendance', NULL),
(245, 'Quis eum.', 'Attenndance for student: Jaylen Ferry is present', 96, 1565735925, 'homework', NULL),
(246, 'Et porro.', 'Attenndance for student: Jaylen Ferry is present', 94, 1565390325, 'homework', NULL),
(247, 'Delectus nulla.', 'New home work is added', 93, 1564526325, 'event', NULL),
(248, 'Porro.', 'New home work is added', 85, 1565735925, 'attendance', NULL),
(249, 'Nisi.', 'New event was set', 93, 1564526325, 'attendance', NULL),
(250, 'Consectetur.', 'New home work is added', 87, 1563662326, 'attendance', NULL),
(251, 'Velit deleniti.', 'New home work is added', 78, 1564958326, 'homework', NULL),
(252, 'Rerum possimus.', 'New home work is added', 76, 1565995126, 'attendance', NULL),
(253, 'Et magni dolorem.', 'New home work is added', 81, 1564785526, 'attendance', NULL),
(254, 'Aliquid et.', 'Attenndance for student: Jaylen Ferry is present', 89, 1565044726, 'attendance', NULL),
(255, 'Dolor fugiat.', 'New home work is added', 96, 1563662326, 'homework', NULL),
(256, 'Tempora consequatur.', 'New event was set', 78, 1564180726, 'event', NULL),
(257, 'Rerum.', 'New home work is added', 83, 1564439926, 'event', NULL),
(258, 'Est illo.', 'Attenndance for student: Jaylen Ferry is present', 78, 1564007926, 'event', NULL),
(259, 'Vel in repellat.', 'New home work is added', 80, 1565822326, 'homework', NULL),
(260, 'Quia.', 'Attenndance for student: Jaylen Ferry is present', 79, 1565131126, 'event', NULL),
(261, 'Quam et.', 'Attenndance for student: Jaylen Ferry is present', 81, 1564007926, 'event', NULL),
(262, 'Voluptatem.', 'Attenndance for student: Jaylen Ferry is present', 82, 1563403126, 'attendance', NULL),
(263, 'Et impedit.', 'New home work is added', 80, 1564612726, 'homework', NULL),
(264, 'Unde rerum ut.', 'Attenndance for student: Jaylen Ferry is present', 79, 1565217526, 'attendance', NULL),
(265, 'Est qui in.', 'New home work is added', 85, 1565044726, 'attendance', NULL),
(266, 'Sint reiciendis.', 'Attenndance for student: Jaylen Ferry is present', 76, 1565044726, 'homework', NULL),
(267, 'Illum.', 'New event was set', 77, 1564007926, 'event', NULL),
(268, 'Illo.', 'New home work is added', 81, 1565649526, 'attendance', NULL),
(269, 'Et reprehenderit.', 'New home work is added', 83, 1563489526, 'homework', NULL),
(270, 'Quo aut.', 'Attenndance for student: Jaylen Ferry is present', 77, 1565649526, 'event', NULL),
(271, 'Numquam dolor.', 'New event was set', 84, 1565131126, 'event', NULL),
(272, 'Iusto non.', 'Attenndance for student: Jaylen Ferry is present', 91, 1563575926, 'homework', NULL),
(273, 'Quia.', 'Attenndance for student: Jaylen Ferry is present', 77, 1565649526, 'homework', NULL),
(274, 'Tenetur vero illum.', 'New event was set', 78, 1565822326, 'attendance', NULL),
(275, 'Est numquam quaerat.', 'New home work is added', 79, 1563403126, 'homework', NULL),
(276, 'Distinctio ut.', 'New event was set', 91, 1564785526, 'attendance', NULL),
(277, 'Cupiditate rem.', 'New home work is added', 92, 1564871926, 'homework', NULL),
(278, 'Est quo earum.', 'New event was set', 85, 1564871926, 'homework', NULL),
(279, 'A.', 'New event was set', 77, 1565131126, 'event', NULL),
(280, 'Possimus saepe.', 'Attenndance for student: Jaylen Ferry is present', 87, 1564958326, 'homework', NULL),
(281, 'Assumenda ut quisquam.', 'Attenndance for student: Jaylen Ferry is present', 86, 1565044726, 'event', NULL),
(282, 'Ab quos.', 'New event was set', 81, 1564439926, 'attendance', NULL),
(283, 'Harum dolor.', 'New home work is added', 92, 1565476726, 'attendance', NULL),
(284, 'Totam deleniti sit.', 'Attenndance for student: Jaylen Ferry is present', 87, 1565044726, 'homework', NULL),
(285, 'Nemo ipsum.', 'New home work is added', 88, 1565476726, 'homework', NULL),
(286, 'Vitae.', 'Attenndance for student: Jaylen Ferry is present', 96, 1564353526, 'homework', NULL),
(287, 'Consequatur.', 'New event was set', 87, 1563575926, 'event', NULL),
(288, 'Sint repellat.', 'Attenndance for student: Jaylen Ferry is present', 77, 1564180726, 'event', NULL),
(289, 'Cupiditate quisquam.', 'Attenndance for student: Jaylen Ferry is present', 86, 1565303926, 'event', NULL),
(290, 'Iusto voluptatem tempora.', 'New event was set', 94, 1565649526, 'attendance', NULL),
(291, 'Autem et voluptatibus.', 'Attenndance for student: Jaylen Ferry is present', 80, 1564958326, 'homework', NULL),
(292, 'Accusamus doloribus.', 'New home work is added', 82, 1564871926, 'homework', NULL),
(293, 'Et.', 'Attenndance for student: Jaylen Ferry is present', 96, 1564007927, 'homework', NULL),
(294, 'Quibusdam.', 'Attenndance for student: Jaylen Ferry is present', 85, 1564439927, 'event', NULL),
(295, 'Quia et.', 'New event was set', 81, 1564439927, 'homework', NULL),
(296, 'Aperiam laudantium.', 'New event was set', 96, 1564612727, 'attendance', NULL),
(297, 'Ut qui.', 'New home work is added', 96, 1565995127, 'homework', NULL),
(298, 'Deserunt perspiciatis facilis.', 'New home work is added', 80, 1565649527, 'event', NULL),
(299, 'Et.', 'New event was set', 84, 1564267127, 'homework', NULL),
(300, 'Ut totam.', 'New event was set', 90, 1564785527, 'attendance', NULL);

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
(1, 'totam_883', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 470, 0, 0, 620, 0, 1563748691, 1564526291, 1, NULL, NULL, 'Cash', 1563921491, 1, '0'),
(2, 'voluptas_422', 'Animi ut in repudiandae necessitatibus magni aspernatur.', 47, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 280, 45, 0, 610, 1, 1563403091, 1565649491, 0, NULL, NULL, 'Online', 1564785491, 1, '0'),
(3, 'totam_565', 'Perspiciatis non praesentium et eos sint omnis nisi voluptatem quia.', 64, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 1000, 11, 0, 130, 1, 1564094291, 1565563091, 0, NULL, NULL, 'Cheque', 1565649491, 1, '0'),
(4, 'laudantium_870', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 950, 13, 0, 700, 0, 1564007891, 1564612691, 1, NULL, NULL, 'Cash', 1564871891, 0, '0'),
(5, 'nemo_970', 'Qui est non corporis esse voluptatem aut.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 430, 0, 0, 680, 1, 1563835091, 1564958291, 0, NULL, NULL, 'Bank Deposit', 1564526291, 0, '0'),
(6, 'ex_144', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 290, 16, 21, 560, 0, 1564267091, 1565131091, 0, NULL, NULL, 'Bank Deposit', 1564007891, 0, '0'),
(7, 'quis_889', 'Eligendi libero et saepe est voluptatem possimus molestiae.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 150, 0, 38, 870, 0, 1563662291, 1564526291, 1, NULL, NULL, 'Online', 1564267091, 0, '0'),
(8, 'amet_606', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 270, 0, 0, 970, 0, 1564007891, 1564439891, 1, NULL, NULL, 'Online', 1565908691, 0, '0'),
(9, 'quis_909', NULL, 72, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 890, 0, 7, 640, 0, 1563662291, 1564612691, 1, NULL, NULL, 'Cash', 1564785491, 1, '0'),
(10, 'eligendi_205', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 570, 45, 39, 820, 1, 1563748692, 1564439892, 0, NULL, NULL, 'Cheque', 1564007892, 1, '0'),
(11, 'dolor_790', 'Sunt amet ea non inventore delectus.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"100\"}]', 210, 0, 0, 830, 1, 1563748692, 1565995092, 0, NULL, NULL, 'Cheque', 1564007892, 1, '0'),
(12, 'omnis_724', 'Ullam omnis distinctio excepturi consectetur nostrum culpa eveniet eos.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 440, 0, 21, 200, 1, 1564267092, 1564785492, 0, NULL, NULL, 'Online', 1564267092, 1, '0'),
(13, 'odio_251', 'Rerum quis quidem dolor alias qui eaque minus vero quod.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 580, 50, 0, 280, 1, 1563835092, 1564612692, 0, NULL, NULL, 'Card', 1563403092, 0, '0'),
(14, 'maxime_432', 'Rem et ut tempora voluptates totam tempore minus quibusdam.', 64, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 310, 0, 0, 780, 1, 1564439892, 1565476692, 0, NULL, NULL, 'Card', 1564526292, 1, '0'),
(15, 'eius_399', NULL, 50, '[{\"title\":\"Library fee\",\"amount\":\"700\"}]', 410, 0, 0, 120, 0, 1563403092, 1564612692, 1, NULL, NULL, 'Online', 1563921492, 1, '0'),
(16, 'rem_125', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 50, 0, 0, 890, 0, 1564267092, 1564526292, 1, NULL, NULL, 'Cash', 1563835092, 0, '0'),
(17, 'aut_309', 'Blanditiis amet natus animi labore quibusdam deleniti.', 63, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 480, 19, 0, 590, 1, 1563489492, 1565735892, 0, NULL, NULL, 'Online', 1564180692, 1, '0'),
(18, 'consequatur_705', 'Accusamus rerum laudantium aspernatur aut in.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 360, 0, 0, 320, 0, 1564094292, 1565563092, 0, NULL, NULL, 'Online', 1565131092, 1, '0'),
(19, 'repellendus_977', 'Nam nisi blanditiis praesentium autem architecto praesentium sed enim.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 410, 0, 0, 480, 1, 1563575892, 1564526292, 0, NULL, NULL, 'Bank Deposit', 1565217492, 1, '0'),
(20, 'recusandae_286', 'Et ad dolorem autem necessitatibus.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 490, 0, 23, 410, 0, 1563921492, 1564526292, 1, NULL, NULL, 'Card', 1564958292, 0, '0'),
(21, 'temporibus_570', 'Non voluptas possimus nulla sint voluptatem eos officia beatae et.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 950, 23, 0, 990, 0, 1563403092, 1565044692, 0, NULL, NULL, 'Bank Deposit', 1565822292, 1, '0'),
(22, 'soluta_376', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 670, 5, 18, 380, 1, 1563921492, 1565044692, 0, NULL, NULL, 'Card', 1565649492, 1, '0'),
(23, 'blanditiis_501', 'Facere doloribus et repudiandae aut ipsam aut.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 80, 8, 0, 560, 1, 1563662292, 1564439892, 0, NULL, NULL, 'Card', 1565995092, 1, '0'),
(24, 'et_674', 'Dicta molestiae id tempora ea magni delectus asperiores vel.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 270, 0, 26, 870, 1, 1564094292, 1564612692, 0, NULL, NULL, 'Bank Deposit', 1564439892, 0, '0'),
(25, 'cupiditate_825', 'Quis voluptatibus dolore adipisci voluptatem aut ab quisquam deleniti.', 69, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 110, 0, 0, 640, 1, 1563662292, 1564612692, 0, NULL, NULL, 'Card', 1565044692, 0, '0'),
(26, 'autem_291', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 580, 0, 39, 970, 0, 1564267092, 1565476692, 0, NULL, NULL, 'Online', 1565217492, 1, '0'),
(27, 'et_159', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 680, 12, 0, 550, 1, 1564180692, 1565822292, 0, NULL, NULL, 'Online', 1565995092, 0, '0'),
(28, 'nostrum_536', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 930, 0, 0, 700, 0, 1563748692, 1565822292, 0, NULL, NULL, 'Bank Deposit', 1564007892, 0, '0'),
(29, 'commodi_122', 'Fugiat at laborum officiis et quia voluptatem quas est qui doloribus.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 170, 43, 27, 190, 1, 1563403092, 1565044692, 0, NULL, NULL, 'Cheque', 1565908692, 0, '0'),
(30, 'culpa_174', 'Reiciendis non et assumenda consequatur numquam et.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 360, 16, 49, 400, 0, 1564439892, 1564871892, 0, NULL, NULL, 'Online', 1565735892, 1, '0'),
(31, 'qui_487', NULL, 74, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 300, 18, 0, 1000, 0, 1563489492, 1564612692, 1, NULL, NULL, 'Bank Deposit', 1564094292, 0, '0'),
(32, 'harum_686', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 800, 14, 0, 370, 0, 1563575892, 1565995092, 0, NULL, NULL, 'Cash', 1565303892, 0, '0'),
(33, 'impedit_152', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 720, 0, 19, 100, 1, 1564007892, 1565735892, 0, NULL, NULL, 'Online', 1563835092, 1, '0'),
(34, 'eos_791', 'Voluptatibus quas corporis quia labore totam sit.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 930, 45, 47, 170, 0, 1563575892, 1564526292, 1, NULL, NULL, 'Cash', 1563662292, 0, '0'),
(35, 'et_145', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 200, 0, 0, 720, 1, 1564180692, 1565649492, 0, NULL, NULL, 'Cash', 1565822292, 1, '0'),
(36, 'quasi_286', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 330, 30, 0, 260, 0, 1564353492, 1564526292, 1, NULL, NULL, 'Online', 1563489492, 0, '0'),
(37, 'quo_388', 'Aperiam autem sed explicabo natus nisi temporibus iste doloremque.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 450, 0, 0, 870, 1, 1563662292, 1564439892, 0, NULL, NULL, 'Cash', 1565131092, 0, '0'),
(38, 'ex_329', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 570, 0, 37, 600, 1, 1563662292, 1564526292, 0, NULL, NULL, 'Cash', 1563748692, 1, '0'),
(39, 'delectus_388', NULL, 50, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 530, 0, 0, 900, 0, 1563489492, 1565476692, 0, NULL, NULL, 'Card', 1565822292, 0, '0'),
(40, 'omnis_113', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 670, 0, 43, 870, 0, 1563921492, 1565908692, 0, NULL, NULL, 'Online', 1565649492, 1, '0'),
(41, 'minus_996', 'Facilis qui ratione dolor praesentium et sed dolorem blanditiis.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 810, 41, 0, 570, 0, 1563835092, 1564785492, 0, NULL, NULL, 'Bank Deposit', 1565390292, 0, '0'),
(42, 'aut_889', 'Aliquid sint sit nisi nostrum saepe qui earum eius aut at.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 370, 25, 12, 480, 1, 1564267092, 1565995092, 0, NULL, NULL, 'Card', 1563921492, 1, '0'),
(43, 'similique_460', NULL, 47, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 240, 0, 0, 430, 1, 1564094292, 1564526292, 0, NULL, NULL, 'Cheque', 1564094292, 0, '0'),
(44, 'voluptatibus_901', 'In sint fuga neque quia ut qui repudiandae incidunt.', 47, '[{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 920, 23, 0, 400, 0, 1563662292, 1564439892, 1, NULL, NULL, 'Cash', 1565563092, 1, '0'),
(45, 'dolorem_386', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 820, 0, 14, 140, 1, 1563489492, 1565303892, 0, NULL, NULL, 'Cheque', 1564439892, 0, '0'),
(46, 'in_416', 'Delectus quis et enim qui nobis cum quis quia unde.', 47, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 160, 0, 29, 310, 1, 1564180692, 1565649492, 0, NULL, NULL, 'Online', 1564439892, 0, '0'),
(47, 'quisquam_289', 'Quidem nam totam tenetur vel rerum delectus nihil deserunt ut dolor.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"300\"}]', 980, 21, 21, 170, 1, 1563921492, 1565217492, 0, NULL, NULL, 'Cash', 1564871892, 1, '0'),
(48, 'et_975', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 260, 0, 14, 780, 0, 1564439892, 1564526292, 1, NULL, NULL, 'Cash', 1563748692, 1, '0'),
(49, 'asperiores_959', NULL, 74, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 800, 0, 33, 550, 0, 1563403092, 1564526292, 1, NULL, NULL, 'Bank Deposit', 1563748692, 0, '0'),
(50, 'ullam_599', 'Occaecati ut atque officiis libero exercitationem illo.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 520, 50, 0, 810, 1, 1563403092, 1564612692, 0, NULL, NULL, 'Bank Deposit', 1565476692, 0, '0'),
(51, 'explicabo_835', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 390, 0, 39, 780, 0, 1564267092, 1565563092, 0, NULL, NULL, 'Bank Deposit', 1563575892, 0, '0'),
(52, 'neque_992', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 570, 0, 0, 250, 1, 1563575892, 1564526292, 0, NULL, NULL, 'Card', 1563575892, 0, '0'),
(53, 'veritatis_886', 'Deleniti dolores soluta enim sed molestiae.', 50, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 480, 23, 46, 670, 0, 1563489492, 1565649492, 0, NULL, NULL, 'Online', 1563575892, 1, '0'),
(54, 'voluptatem_447', 'Aut beatae nostrum necessitatibus dicta odit eum quo.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 960, 31, 20, 300, 1, 1563835092, 1565995092, 0, NULL, NULL, 'Bank Deposit', 1564439892, 1, '0'),
(55, 'illo_550', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 460, 0, 11, 970, 1, 1564180692, 1564871892, 0, NULL, NULL, 'Bank Deposit', 1565735892, 1, '0'),
(56, 'maxime_806', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 140, 50, 20, 300, 1, 1563575892, 1564612692, 0, NULL, NULL, 'Cheque', 1564785492, 0, '0'),
(57, 'omnis_710', 'Quae ipsam consequatur rerum voluptatem recusandae ut quisquam.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 600, 0, 0, 280, 1, 1563403092, 1564612692, 0, NULL, NULL, 'Cheque', 1564785492, 0, '0'),
(58, 'et_209', NULL, 50, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 140, 49, 42, 80, 0, 1563748693, 1564526293, 1, NULL, NULL, 'Bank Deposit', 1564267093, 0, '0'),
(59, 'laborum_513', 'Quo maxime totam ut optio vitae alias natus ullam quam id.', 54, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 140, 0, 0, 630, 1, 1564007893, 1565131093, 0, NULL, NULL, 'Card', 1563662293, 0, '0'),
(60, 'assumenda_787', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 970, 0, 0, 620, 0, 1563403093, 1565390293, 0, NULL, NULL, 'Cheque', 1564439893, 1, '0'),
(61, 'id_464', 'Ea cumque optio praesentium voluptatem a tempora accusamus ut velit excepturi.', 45, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 300, 30, 0, 720, 0, 1563575893, 1564612693, 1, NULL, NULL, 'Cheque', 1565649493, 1, '0'),
(62, 'quis_890', 'Ut quam reiciendis in sequi consequatur.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 580, 45, 0, 650, 0, 1563489493, 1564439893, 1, NULL, NULL, 'Bank Deposit', 1565044693, 1, '0'),
(63, 'qui_750', 'Eos earum amet in in quia libero eum corporis.', 72, '[{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 140, 0, 0, 990, 0, 1564180693, 1565649493, 0, NULL, NULL, 'Cash', 1565649493, 1, '0'),
(64, 'consequatur_125', 'Facere sit quam voluptatem nihil corrupti consequatur corporis eaque omnis explicabo.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 50, 0, 45, 800, 0, 1563921493, 1564526293, 1, NULL, NULL, 'Bank Deposit', 1565995093, 0, '0'),
(65, 'reiciendis_930', NULL, 63, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 490, 0, 5, 540, 1, 1564353493, 1564612693, 0, NULL, NULL, 'Online', 1565476693, 0, '0'),
(66, 'est_893', NULL, 74, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 740, 23, 3, 810, 1, 1563662293, 1565131093, 0, NULL, NULL, 'Card', 1564267093, 0, '0'),
(67, 'voluptatem_665', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 180, 13, 42, 650, 0, 1563489493, 1565822293, 0, NULL, NULL, 'Cheque', 1565995093, 0, '0'),
(68, 'facilis_588', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 720, 13, 0, 190, 0, 1564007893, 1564439893, 1, NULL, NULL, 'Bank Deposit', 1565649493, 1, '0'),
(69, 'nemo_753', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 420, 0, 0, 520, 0, 1564439893, 1565044693, 0, NULL, NULL, 'Online', 1564785493, 1, '0'),
(70, 'voluptas_508', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 400, 0, 35, 810, 1, 1564353493, 1565908693, 0, NULL, NULL, 'Cash', 1563835093, 0, '0'),
(71, 'voluptatum_124', 'Quasi fuga qui nobis ipsa ab voluptatum ut non.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 220, 0, 13, 930, 0, 1563403093, 1564439893, 1, NULL, NULL, 'Bank Deposit', 1563575893, 0, '0'),
(72, 'rerum_321', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 210, 0, 0, 50, 1, 1563662293, 1564612693, 0, NULL, NULL, 'Card', 1564439893, 0, '0'),
(73, 'voluptatum_917', 'Laboriosam voluptatem enim neque recusandae aut nobis cum qui.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 630, 45, 0, 610, 0, 1563489493, 1565390293, 0, NULL, NULL, 'Cash', 1564180693, 0, '0'),
(74, 'reiciendis_312', 'Dolor in eos et et sunt atque dolore temporibus est.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 930, 0, 31, 930, 1, 1564439893, 1564439893, 0, NULL, NULL, 'Card', 1565735893, 0, '0'),
(75, 'vero_592', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 290, 1, 28, 320, 1, 1563835093, 1565822293, 0, NULL, NULL, 'Online', 1563662293, 1, '0'),
(76, 'et_256', 'Qui voluptatibus officiis dicta at accusamus.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 870, 39, 1, 650, 0, 1564267093, 1565649493, 0, NULL, NULL, 'Card', 1565649493, 1, '0'),
(77, 'officia_906', 'Qui doloribus aliquam et excepturi in.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 150, 7, 0, 410, 1, 1563575893, 1565822293, 0, NULL, NULL, 'Bank Deposit', 1564267093, 0, '0'),
(78, 'dolor_543', NULL, 74, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 580, 37, 24, 550, 0, 1564353493, 1565390293, 0, NULL, NULL, 'Cheque', 1563835093, 1, '0'),
(79, 'quis_738', 'Illum blanditiis cupiditate cupiditate nihil autem perferendis minus cum consectetur.', 74, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 660, 0, 0, 190, 1, 1564439893, 1565649493, 0, NULL, NULL, 'Cheque', 1563748693, 1, '0'),
(80, 'quia_659', NULL, 50, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 560, 32, 0, 700, 1, 1564180693, 1564526293, 0, NULL, NULL, 'Online', 1565735893, 0, '0'),
(81, 'fugit_987', 'Aut nam ipsa voluptatem dolores magnam ut at.', 47, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 1000, 0, 46, 80, 1, 1564439893, 1564439893, 0, NULL, NULL, 'Card', 1564785493, 1, '0'),
(82, 'minima_945', 'Laborum minus ea distinctio nemo nisi rerum repellendus.', 69, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 540, 0, 0, 530, 1, 1563575893, 1565995093, 0, NULL, NULL, 'Online', 1565563093, 1, '0'),
(83, 'in_807', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"800\"}]', 630, 0, 22, 890, 0, 1564267093, 1564439893, 1, NULL, NULL, 'Online', 1565476693, 0, '0'),
(84, 'porro_173', 'Qui voluptates repudiandae iusto aut sed.', 47, '[{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 660, 14, 0, 330, 0, 1564094293, 1564439893, 1, NULL, NULL, 'Cheque', 1565476693, 0, '0'),
(85, 'enim_956', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 520, 39, 0, 490, 0, 1564007893, 1564612693, 1, NULL, NULL, 'Card', 1565131093, 1, '0'),
(86, 'sapiente_931', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 410, 19, 0, 260, 1, 1563575893, 1565476693, 0, NULL, NULL, 'Card', 1563748693, 1, '0'),
(87, 'aliquam_737', 'Repudiandae provident ut ea modi nulla distinctio.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 110, 0, 0, 440, 0, 1564353493, 1564439893, 1, NULL, NULL, 'Card', 1563662293, 0, '0'),
(88, 'nesciunt_909', NULL, 75, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 360, 21, 24, 480, 1, 1564267093, 1565822293, 0, NULL, NULL, 'Online', 1563489493, 1, '0'),
(89, 'enim_563', NULL, 45, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 620, 0, 7, 740, 1, 1564267093, 1564526293, 0, NULL, NULL, 'Cash', 1563489493, 0, '0'),
(90, 'ab_623', 'Minus temporibus repellendus dignissimos est laboriosam et aut consequatur dolorem.', 63, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 940, 0, 27, 710, 0, 1564267093, 1564439893, 1, NULL, NULL, 'Online', 1565908693, 1, '0'),
(91, 'aut_809', 'Consequatur ut nemo mollitia fuga qui quam iste et sint.', 67, ']', 510, 48, 41, 400, 0, 1563489493, 1564526293, 1, NULL, NULL, 'Card', 1564353493, 0, '0'),
(92, 'dolorem_424', 'Quia dolorem ipsa repellat doloremque qui quia.', 47, '[{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 660, 5, 0, 390, 1, 1564007893, 1564612693, 0, NULL, NULL, 'Cheque', 1565563093, 1, '0'),
(93, 'ipsa_972', 'Aut assumenda qui quisquam provident quaerat mollitia.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 870, 0, 41, 840, 0, 1563403093, 1564439893, 1, NULL, NULL, 'Online', 1565995093, 1, '0'),
(94, 'odio_894', 'Id sit error quas impedit repudiandae error totam molestiae consectetur libero.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 150, 0, 0, 940, 0, 1563835093, 1564526293, 1, NULL, NULL, 'Cheque', 1563575893, 1, '0'),
(95, 'vitae_450', 'Earum voluptatem aperiam molestiae sed assumenda maxime.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 720, 0, 46, 490, 1, 1563921493, 1564526293, 0, NULL, NULL, 'Cash', 1564871893, 0, '0'),
(96, 'illum_625', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 400, 0, 0, 910, 1, 1563403093, 1564612693, 0, NULL, NULL, 'Cheque', 1565908693, 0, '0'),
(97, 'eum_382', NULL, 50, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 400, 3, 0, 790, 0, 1564007893, 1565995093, 0, NULL, NULL, 'Cash', 1565217493, 1, '0'),
(98, 'voluptas_428', 'Amet iure aut et laboriosam vel.', 47, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 180, 0, 0, 280, 1, 1564007893, 1565995093, 0, NULL, NULL, 'Cheque', 1565735893, 1, '0'),
(99, 'veritatis_842', 'Ea corrupti ut aut ex excepturi doloribus quos sequi molestiae.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 710, 0, 4, 970, 1, 1563748693, 1565217493, 0, NULL, NULL, 'Online', 1564612693, 0, '0'),
(100, 'dolor_865', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 240, 0, 0, 900, 1, 1563921493, 1564439893, 0, NULL, NULL, 'Card', 1564612693, 0, '0'),
(101, 'aut_216', NULL, 50, '[{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 940, 21, 45, 140, 1, 1563835093, 1565822293, 0, NULL, NULL, 'Bank Deposit', 1564958293, 1, '0'),
(102, 'reprehenderit_152', 'Assumenda id assumenda ut ipsam est debitis aut.', 72, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 800, 9, 0, 80, 0, 1563489493, 1565822293, 0, NULL, NULL, 'Card', 1564180693, 0, '0'),
(103, 'provident_214', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 190, 35, 0, 680, 1, 1563403093, 1565303893, 0, NULL, NULL, 'Cheque', 1564526293, 1, '0'),
(104, 'et_592', NULL, 50, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 820, 13, 0, 640, 0, 1564007893, 1564439893, 1, NULL, NULL, 'Bank Deposit', 1563575893, 1, '0'),
(105, 'voluptas_822', 'Quasi voluptatem aliquid qui nulla quod labore quia eum non atque.', 68, '[{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 280, 0, 0, 740, 0, 1564439893, 1565390293, 0, NULL, NULL, 'Online', 1564267093, 1, '0'),
(106, 'blanditiis_407', 'Voluptates et omnis expedita magni non sint odit molestiae illum architecto.', 50, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 520, 37, 0, 780, 1, 1563835093, 1565476693, 0, NULL, NULL, 'Bank Deposit', 1565390293, 1, '0'),
(107, 'aperiam_531', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 140, 2, 25, 550, 1, 1564267093, 1564526293, 0, NULL, NULL, 'Online', 1564180693, 0, '0'),
(108, 'accusamus_305', 'Ipsam provident quo facere illum ut optio ea delectus alias dicta.', 47, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 470, 0, 26, 650, 1, 1564439893, 1564612693, 0, NULL, NULL, 'Bank Deposit', 1565390293, 0, '0'),
(109, 'consequatur_902', NULL, 49, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 250, 0, 41, 350, 0, 1563403093, 1564439893, 1, NULL, NULL, 'Online', 1565563093, 1, '0'),
(110, 'distinctio_117', NULL, 47, '[{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 850, 36, 17, 350, 1, 1563662293, 1564526293, 0, NULL, NULL, 'Bank Deposit', 1564439893, 1, '0'),
(111, 'modi_180', 'Adipisci quia iste ullam illo voluptatem ut eum ut neque.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 540, 20, 0, 400, 1, 1564267094, 1564526294, 0, NULL, NULL, 'Bank Deposit', 1565044694, 1, '0'),
(112, 'et_106', 'Veniam unde assumenda libero est similique autem.', 72, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 160, 0, 0, 390, 0, 1563489494, 1564612694, 1, NULL, NULL, 'Cheque', 1564094294, 0, '0'),
(113, 'veniam_814', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 550, 24, 0, 810, 1, 1564094294, 1564526294, 0, NULL, NULL, 'Bank Deposit', 1564267094, 0, '0'),
(114, 'fuga_605', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 740, 0, 40, 470, 0, 1563575894, 1564439894, 1, NULL, NULL, 'Cash', 1564785494, 1, '0'),
(115, 'reprehenderit_173', 'Excepturi earum tempora sunt omnis reiciendis.', 69, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 70, 0, 6, 960, 1, 1564180694, 1565217494, 0, NULL, NULL, 'Cheque', 1563662294, 0, '0'),
(116, 'quod_754', 'Quis ut tempora ea voluptatem sint sit impedit perferendis.', 74, '[{\"title\":\"Building fee\",\"amount\":\"400\"}]', 330, 0, 25, 920, 1, 1563575894, 1564871894, 0, NULL, NULL, 'Bank Deposit', 1564526294, 1, '0'),
(117, 'facilis_756', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 720, 15, 0, 840, 0, 1563403094, 1564526294, 1, NULL, NULL, 'Cash', 1564267094, 1, '0'),
(118, 'id_613', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 170, 50, 0, 770, 1, 1563489494, 1564439894, 0, NULL, NULL, 'Cash', 1564353494, 0, '0'),
(119, 'expedita_351', 'Velit et officia iste ipsam veritatis.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 800, 0, 0, 310, 0, 1564094294, 1564612694, 1, NULL, NULL, 'Card', 1564958294, 1, '0'),
(120, 'vel_317', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 880, 9, 50, 870, 0, 1563489494, 1564439894, 1, NULL, NULL, 'Bank Deposit', 1564612694, 0, '0'),
(121, 'blanditiis_675', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 880, 0, 0, 620, 1, 1563921494, 1565563094, 0, NULL, NULL, 'Cash', 1565649494, 1, '0'),
(122, 'aut_439', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 390, 0, 8, 680, 1, 1564094294, 1565390294, 0, NULL, NULL, 'Bank Deposit', 1565131094, 0, '0'),
(123, 'corrupti_758', NULL, 72, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 590, 0, 0, 540, 0, 1564353494, 1564439894, 1, NULL, NULL, 'Bank Deposit', 1564353494, 0, '0'),
(124, 'veniam_519', 'Itaque et vitae tempora voluptatem aut et perferendis.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 580, 0, 0, 1000, 0, 1563403094, 1565908694, 0, NULL, NULL, 'Card', 1563835094, 1, '0'),
(125, 'sunt_731', 'Architecto sint deleniti minus porro alias quo ut nisi ipsam.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 610, 45, 0, 160, 1, 1563921494, 1564958294, 0, NULL, NULL, 'Cash', 1565995094, 0, '0'),
(126, 'vitae_872', 'Quia tenetur incidunt in perferendis quod dicta error.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 860, 0, 0, 440, 1, 1563748694, 1564612694, 0, NULL, NULL, 'Card', 1564267094, 0, '0'),
(127, 'aspernatur_515', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 680, 2, 2, 80, 1, 1564007894, 1564612694, 0, NULL, NULL, 'Cash', 1564353494, 0, '0'),
(128, 'rerum_709', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 820, 27, 50, 370, 0, 1563403094, 1565649494, 0, NULL, NULL, 'Online', 1563662294, 1, '0'),
(129, 'repellendus_948', 'Culpa quisquam ut harum nam velit amet dolore.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 630, 0, 0, 320, 1, 1564094294, 1564439894, 0, NULL, NULL, 'Online', 1564180694, 0, '0'),
(130, 'numquam_602', 'Temporibus sint iusto animi voluptate et est occaecati error.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 990, 5, 0, 710, 1, 1564439894, 1564526294, 0, NULL, NULL, 'Bank Deposit', 1565476694, 1, '0'),
(131, 'iste_341', NULL, 47, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 560, 6, 46, 770, 0, 1563748694, 1564439894, 1, NULL, NULL, 'Online', 1565217494, 0, '0'),
(132, 'officia_401', 'Enim aspernatur perspiciatis voluptatem ut accusantium.', 45, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 70, 0, 0, 220, 1, 1563835094, 1565822294, 0, NULL, NULL, 'Online', 1564612694, 1, '0'),
(133, 'voluptatem_833', 'Excepturi omnis dolores est laborum nihil velit corrupti accusamus minus ipsum.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 950, 0, 0, 570, 1, 1563575894, 1564439894, 0, NULL, NULL, 'Card', 1565390294, 0, '0'),
(134, 'ut_448', 'Placeat beatae earum eum accusamus perspiciatis sit id eum.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 390, 21, 0, 50, 1, 1564007894, 1565735894, 0, NULL, NULL, 'Card', 1563575894, 1, '0'),
(135, 'laborum_239', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 550, 0, 0, 890, 1, 1563662294, 1564958294, 0, NULL, NULL, 'Card', 1563921494, 0, '0'),
(136, 'qui_194', 'Molestiae ut odit ut placeat molestiae quam neque et rerum consequatur est.', 72, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 420, 0, 45, 550, 0, 1564180694, 1564526294, 1, NULL, NULL, 'Online', 1564871894, 0, '0'),
(137, 'sit_692', NULL, 74, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 570, 50, 0, 510, 1, 1563835094, 1564439894, 0, NULL, NULL, 'Online', 1564526294, 0, '0'),
(138, 'est_926', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 1000, 3, 0, 750, 0, 1564094294, 1564612694, 1, NULL, NULL, 'Online', 1565995094, 1, '0'),
(139, 'dolorem_884', NULL, 74, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 130, 0, 0, 110, 1, 1563662294, 1564526294, 0, NULL, NULL, 'Cheque', 1564439894, 1, '0'),
(140, 'dolorum_640', 'Quasi sit in dolore corporis non sed rem eius.', 45, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 760, 19, 31, 830, 1, 1564267094, 1564612694, 0, NULL, NULL, 'Bank Deposit', 1564180694, 0, '0'),
(141, 'nihil_224', 'Labore quod id illo ducimus non molestias quis.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 240, 0, 0, 70, 0, 1564007894, 1565303894, 0, NULL, NULL, 'Cash', 1564785494, 1, '0'),
(142, 'est_795', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 240, 43, 47, 970, 1, 1564007894, 1565563094, 0, NULL, NULL, 'Online', 1565476694, 1, '0'),
(143, 'nobis_678', 'Error tempora dolorem et sunt quas nostrum iusto provident et pariatur.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 510, 0, 0, 740, 1, 1564094294, 1565044694, 0, NULL, NULL, 'Online', 1564958294, 1, '0'),
(144, 'sed_468', 'Maxime quod sunt voluptatem ipsum enim et ab nisi sed sit.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 60, 7, 0, 120, 1, 1564353494, 1565563094, 0, NULL, NULL, 'Bank Deposit', 1564785494, 0, '0'),
(145, 'nisi_332', 'Distinctio labore hic quisquam culpa quasi odit aut.', 63, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 530, 6, 0, 120, 1, 1563835094, 1565563094, 0, NULL, NULL, 'Online', 1564871894, 1, '0'),
(146, 'quia_710', 'Itaque accusamus est harum et eligendi sit velit cupiditate.', 74, '[{\"title\":\"Library fee\",\"amount\":\"600\"}]', 110, 43, 21, 780, 0, 1564439894, 1564439894, 1, NULL, NULL, 'Cheque', 1563921494, 1, '0'),
(147, 'ut_983', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 210, 0, 32, 870, 1, 1563662295, 1565131095, 0, NULL, NULL, 'Card', 1565908695, 0, '0'),
(148, 'nihil_474', 'Et nobis molestias sit ut ex rem et est tempore minima corporis.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 200, 23, 0, 850, 1, 1564439895, 1564526295, 0, NULL, NULL, 'Online', 1565217495, 1, '0'),
(149, 'aspernatur_506', NULL, 50, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 650, 10, 0, 830, 0, 1563921495, 1564526295, 1, NULL, NULL, 'Cheque', 1564267095, 1, '0'),
(150, 'fugit_395', 'Nulla quod error placeat sed nemo rerum dolores impedit et.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 350, 44, 0, 910, 0, 1563403095, 1564612695, 1, NULL, NULL, 'Cash', 1564267095, 1, '0'),
(151, 'illo_859', NULL, 54, '[{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 480, 0, 0, 670, 1, 1564267095, 1564439895, 0, NULL, NULL, 'Online', 1564267095, 0, '0'),
(152, 'officia_865', 'Eligendi velit sit totam rerum fugiat consequatur ratione.', 63, ']', 500, 0, 7, 70, 0, 1563748695, 1565131095, 0, NULL, NULL, 'Cash', 1564612695, 0, '0'),
(153, 'rerum_783', 'In earum qui assumenda doloremque et maxime qui est sed.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 440, 7, 33, 230, 0, 1564094295, 1564439895, 1, NULL, NULL, 'Cash', 1565390295, 0, '0'),
(154, 'quisquam_928', 'Ut ducimus sit quam sequi et quos pariatur ratione doloremque delectus.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 310, 0, 0, 740, 0, 1564180695, 1564526295, 1, NULL, NULL, 'Cash', 1564785495, 1, '0'),
(155, 'neque_855', NULL, 45, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 680, 0, 0, 580, 0, 1563575895, 1565735895, 0, NULL, NULL, 'Cash', 1565995095, 1, '0'),
(156, 'repellat_363', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 720, 41, 3, 620, 1, 1564353495, 1565649495, 0, NULL, NULL, 'Online', 1564612695, 0, '0'),
(157, 'culpa_989', 'Dolores et omnis iste consequatur inventore ipsum tempora nostrum aut.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 700, 0, 1, 150, 0, 1563575895, 1564958295, 0, NULL, NULL, 'Card', 1565908695, 1, '0'),
(158, 'id_119', 'Dignissimos ratione enim ex aut nesciunt totam minima.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 470, 46, 0, 920, 0, 1564439895, 1565908695, 0, NULL, NULL, 'Cash', 1565649495, 1, '0'),
(159, 'laborum_906', 'Commodi est rem facilis iste nam consequatur.', 45, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 310, 0, 0, 770, 1, 1564439895, 1565995095, 0, NULL, NULL, 'Card', 1563575895, 0, '0'),
(160, 'nam_560', NULL, 75, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 530, 0, 0, 250, 0, 1563835095, 1565303895, 0, NULL, NULL, 'Online', 1565476695, 0, '0'),
(161, 'culpa_364', 'Explicabo vel nulla quisquam et natus nam.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 140, 21, 0, 150, 0, 1564353495, 1564526295, 1, NULL, NULL, 'Cheque', 1564612695, 0, '0'),
(162, 'eaque_153', 'Deserunt et eum magnam aperiam magnam quas quia maiores est id.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 570, 0, 0, 50, 1, 1563575895, 1565822295, 0, NULL, NULL, 'Cheque', 1564785495, 1, '0'),
(163, 'est_364', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"400\"}]', 130, 47, 29, 100, 0, 1563835095, 1564612695, 1, NULL, NULL, 'Bank Deposit', 1565390295, 1, '0'),
(164, 'ea_624', 'Et et sit voluptates quasi minima.', 72, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 850, 37, 0, 970, 1, 1563835095, 1565044695, 0, NULL, NULL, 'Cheque', 1565735895, 0, '0'),
(165, 'dolor_418', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 160, 0, 0, 200, 1, 1564439895, 1564439895, 0, NULL, NULL, 'Card', 1565563095, 1, '0'),
(166, 'consequatur_936', NULL, 45, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 730, 8, 0, 550, 1, 1564007895, 1564526295, 0, NULL, NULL, 'Online', 1563575895, 0, '0'),
(167, 'necessitatibus_761', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 950, 45, 0, 660, 0, 1563489495, 1564612695, 1, NULL, NULL, 'Online', 1564439895, 0, '0'),
(168, 'enim_113', 'Autem suscipit natus quisquam facilis corporis.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 100, 0, 26, 470, 1, 1564353495, 1565563095, 0, NULL, NULL, 'Online', 1564785495, 0, '0'),
(169, 'et_941', 'Ut officiis omnis minima aut officia placeat aut amet minus.', 74, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 740, 0, 50, 880, 1, 1564439895, 1564871895, 0, NULL, NULL, 'Online', 1564267095, 1, '0'),
(170, 'eos_810', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 790, 0, 25, 940, 1, 1563835095, 1564958295, 0, NULL, NULL, 'Cash', 1565390295, 1, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(171, 'in_327', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 480, 0, 32, 150, 0, 1564439895, 1564439895, 1, NULL, NULL, 'Card', 1565995095, 0, '0'),
(172, 'totam_104', NULL, 63, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 310, 0, 0, 400, 1, 1564267095, 1564612695, 0, NULL, NULL, 'Cash', 1564353495, 0, '0'),
(173, 'perspiciatis_520', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 370, 0, 0, 300, 1, 1563575895, 1564871895, 0, NULL, NULL, 'Cash', 1565476695, 0, '0'),
(174, 'et_142', NULL, 54, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 230, 0, 0, 170, 1, 1564094295, 1564439895, 0, NULL, NULL, 'Online', 1564439895, 0, '0'),
(175, 'maxime_247', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 370, 0, 0, 560, 0, 1563921495, 1564526295, 1, NULL, NULL, 'Cash', 1564526295, 0, '0'),
(176, 'doloremque_264', 'Dolore ex ratione qui blanditiis harum.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 780, 0, 41, 350, 1, 1564267095, 1565303895, 0, NULL, NULL, 'Cash', 1565217495, 1, '0'),
(177, 'assumenda_760', 'Non et eum vel soluta et mollitia voluptas iste ut natus incidunt.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 470, 11, 4, 760, 0, 1563662295, 1564526295, 1, NULL, NULL, 'Online', 1564353495, 0, '0'),
(178, 'molestiae_422', 'Atque distinctio quisquam autem sint id.', 64, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 570, 0, 0, 910, 1, 1564180695, 1564526295, 0, NULL, NULL, 'Online', 1564267095, 1, '0'),
(179, 'cum_520', 'Accusamus voluptatibus sunt beatae tenetur ipsam molestias.', 47, '[{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 90, 16, 0, 140, 0, 1564353495, 1565476695, 0, NULL, NULL, 'Cheque', 1564612695, 1, '0'),
(180, 'voluptatum_751', 'Consequatur et possimus consequatur fuga minima explicabo eaque est placeat earum ut.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 670, 0, 0, 110, 1, 1563575895, 1565044695, 0, NULL, NULL, 'Online', 1564267095, 0, '0'),
(181, 'architecto_236', NULL, 54, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 680, 40, 39, 910, 0, 1563403095, 1564612695, 1, NULL, NULL, 'Bank Deposit', 1564267095, 1, '0'),
(182, 'quia_818', 'Laudantium praesentium accusamus quis consequatur magnam dolorem quia est voluptas deserunt.', 74, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 510, 0, 0, 500, 1, 1563575895, 1564785495, 0, NULL, NULL, 'Cash', 1565735895, 1, '0'),
(183, 'neque_537', NULL, 49, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 260, 21, 0, 150, 1, 1564353495, 1565735895, 0, NULL, NULL, 'Card', 1565649495, 0, '0'),
(184, 'quis_323', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 290, 0, 8, 350, 0, 1564267095, 1565044695, 0, NULL, NULL, 'Cash', 1563921495, 1, '0'),
(185, 'molestiae_371', 'Culpa suscipit dolor qui error quisquam et quibusdam velit.', 54, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 460, 0, 0, 610, 1, 1564439895, 1565649495, 0, NULL, NULL, 'Card', 1563575895, 1, '0'),
(186, 'occaecati_328', 'Iusto id quam vero temporibus omnis est eos rerum nihil accusantium.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 460, 0, 7, 970, 1, 1564094295, 1564612695, 0, NULL, NULL, 'Online', 1564871895, 1, '0'),
(187, 'sed_957', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"700\"}]', 150, 0, 0, 180, 0, 1563921495, 1564439895, 1, NULL, NULL, 'Online', 1564439895, 0, '0'),
(188, 'tempore_944', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 90, 0, 0, 530, 1, 1563662295, 1565908695, 0, NULL, NULL, 'Cash', 1563835095, 0, '0'),
(189, 'error_816', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 300, 18, 0, 430, 1, 1564267095, 1564526295, 0, NULL, NULL, 'Cash', 1565995095, 1, '0'),
(190, 'eum_713', 'Consequatur ipsa sint eius dolorum dolor maiores voluptatum maiores ea.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 250, 0, 0, 680, 1, 1563748695, 1564612695, 0, NULL, NULL, 'Bank Deposit', 1564180695, 1, '0'),
(191, 'consequuntur_861', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 900, 1, 14, 140, 0, 1564180695, 1564439895, 1, NULL, NULL, 'Bank Deposit', 1564612695, 1, '0'),
(192, 'natus_769', 'Ut sint ab accusantium sint soluta velit.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 680, 0, 35, 700, 1, 1564439895, 1564612695, 0, NULL, NULL, 'Bank Deposit', 1564267095, 0, '0'),
(193, 'autem_515', 'Aliquid facilis dolores labore et nisi ut aut ut error fuga.', 68, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 690, 0, 26, 480, 0, 1564094295, 1565908695, 0, NULL, NULL, 'Cash', 1564180695, 0, '0'),
(194, 'officiis_933', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 330, 0, 3, 460, 1, 1564007896, 1564526296, 0, NULL, NULL, 'Cash', 1563662296, 0, '0'),
(195, 'blanditiis_198', 'Porro nulla sed ab ratione voluptate accusantium illo provident fugit.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 1000, 48, 39, 200, 0, 1563835096, 1564785496, 0, NULL, NULL, 'Card', 1563662296, 0, '0'),
(196, 'ullam_211', 'Qui repellendus asperiores et inventore perspiciatis perspiciatis fugit.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 640, 36, 25, 730, 0, 1564267096, 1565563096, 0, NULL, NULL, 'Card', 1565995096, 1, '0'),
(197, 'facilis_261', 'Eius excepturi quia atque id enim aspernatur occaecati sit.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 720, 0, 0, 580, 1, 1563748696, 1565822296, 0, NULL, NULL, 'Cash', 1565908696, 0, '0'),
(198, 'vitae_397', 'Iure recusandae aut dicta expedita optio sed ea.', 75, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 300, 0, 0, 660, 0, 1563748696, 1564612696, 1, NULL, NULL, 'Cash', 1564958296, 0, '0'),
(199, 'rerum_426', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 750, 0, 0, 330, 0, 1564439896, 1565995096, 0, NULL, NULL, 'Online', 1564439896, 0, '0'),
(200, 'sint_715', 'Voluptatem officiis recusandae ea aut culpa et voluptatem voluptatem impedit.', 59, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 200, 0, 0, 230, 1, 1564439896, 1564958296, 0, NULL, NULL, 'Cash', 1563921496, 1, '0'),
(201, 'quos_190', NULL, 69, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 550, 44, 45, 440, 0, 1563403096, 1565131096, 0, NULL, NULL, 'Card', 1565390296, 0, '0'),
(202, 'fugiat_344', 'Eveniet dolorem eius laboriosam eveniet.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 740, 0, 26, 270, 0, 1563489496, 1565908696, 0, NULL, NULL, 'Online', 1564007896, 1, '0'),
(203, 'consequatur_109', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 230, 0, 0, 930, 1, 1563403096, 1564526296, 0, NULL, NULL, 'Cheque', 1565217496, 0, '0'),
(204, 'quos_278', NULL, 74, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 950, 2, 14, 250, 0, 1564439896, 1564526296, 1, NULL, NULL, 'Bank Deposit', 1564353496, 1, '0'),
(205, 'ut_981', 'Commodi quod officiis consequuntur expedita excepturi sed ut.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"}]', 350, 45, 0, 440, 1, 1563575896, 1564439896, 0, NULL, NULL, 'Card', 1564353496, 0, '0'),
(206, 'et_580', 'Ratione rerum perspiciatis aspernatur voluptas molestias.', 47, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 910, 0, 0, 740, 0, 1564439896, 1564958296, 0, NULL, NULL, 'Cash', 1565390296, 1, '0'),
(207, 'qui_446', 'Omnis itaque velit officia enim.', 72, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 580, 19, 0, 420, 0, 1563921496, 1565649496, 0, NULL, NULL, 'Bank Deposit', 1564267096, 0, '0'),
(208, 'odit_562', 'Asperiores nesciunt explicabo voluptas qui eum mollitia laudantium qui totam harum.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 560, 5, 0, 990, 1, 1563489496, 1565303896, 0, NULL, NULL, 'Cash', 1565217496, 1, '0'),
(209, 'quia_204', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 130, 41, 0, 350, 1, 1564439896, 1564439896, 0, NULL, NULL, 'Bank Deposit', 1565476696, 0, '0'),
(210, 'dolores_305', NULL, 50, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 730, 25, 0, 560, 1, 1563662296, 1564526296, 0, NULL, NULL, 'Cash', 1564007896, 0, '0'),
(211, 'ab_364', 'Molestiae necessitatibus quae quaerat nobis officia a dolor doloribus vel.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 60, 3, 0, 210, 0, 1563921496, 1564439896, 1, NULL, NULL, 'Card', 1564180696, 0, '0'),
(212, 'pariatur_758', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 570, 0, 28, 750, 1, 1563403096, 1564439896, 0, NULL, NULL, 'Card', 1565390296, 0, '0'),
(213, 'quas_960', 'Eaque quas dolores minus soluta cum nihil rerum dolores et commodi optio.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 130, 0, 0, 460, 0, 1563748696, 1564439896, 1, NULL, NULL, 'Card', 1565649496, 0, '0'),
(214, 'non_381', 'Architecto consequatur sit aut sed et veniam aut est.', 63, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 130, 0, 0, 790, 1, 1563403096, 1564785496, 0, NULL, NULL, 'Cash', 1565476696, 0, '0'),
(215, 'cum_966', 'Eos eos voluptas totam harum debitis placeat eaque numquam.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 200, 26, 0, 810, 1, 1563748696, 1564785496, 0, NULL, NULL, 'Card', 1564267096, 0, '0'),
(216, 'accusamus_818', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 860, 0, 49, 390, 1, 1564094296, 1564526296, 0, NULL, NULL, 'Cash', 1565303896, 1, '0'),
(217, 'laborum_351', NULL, 74, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 440, 0, 0, 650, 1, 1563489496, 1565044696, 0, NULL, NULL, 'Online', 1564180696, 1, '0'),
(218, 'doloremque_811', 'Deserunt voluptas sequi rerum odit sit error enim laboriosam ut sed.', 74, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 150, 0, 0, 160, 0, 1564180696, 1565735896, 0, NULL, NULL, 'Card', 1563403096, 1, '0'),
(219, 'tempora_616', NULL, 64, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 730, 12, 0, 730, 0, 1564007896, 1564526296, 1, NULL, NULL, 'Cheque', 1564180696, 1, '0'),
(220, 'et_551', NULL, 54, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 160, 0, 13, 810, 0, 1563489496, 1565476696, 0, NULL, NULL, 'Cheque', 1565303896, 0, '0'),
(221, 'eum_730', 'Quia modi doloremque deleniti cumque molestias.', 47, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 480, 0, 49, 950, 0, 1564007896, 1565563096, 0, NULL, NULL, 'Bank Deposit', 1563575896, 0, '0'),
(222, 'autem_570', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 980, 0, 21, 790, 1, 1564267096, 1564439896, 0, NULL, NULL, 'Card', 1564353496, 0, '0'),
(223, 'similique_224', 'Sit consequatur odio ut quia occaecati tenetur labore explicabo.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 690, 28, 0, 660, 0, 1563403096, 1564612696, 1, NULL, NULL, 'Cash', 1563489496, 1, '0'),
(224, 'numquam_526', 'Eligendi corrupti laboriosam tempore aspernatur vel assumenda recusandae.', 47, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 650, 0, 19, 420, 0, 1563835096, 1565563096, 0, NULL, NULL, 'Online', 1565476696, 1, '0'),
(225, 'voluptas_256', 'Ut harum eius aperiam quia corporis magni adipisci sit consequatur nihil.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 120, 0, 0, 260, 1, 1563835096, 1564612696, 0, NULL, NULL, 'Cash', 1563835096, 1, '0'),
(226, 'provident_629', 'Sint rerum voluptatum praesentium sed qui sit.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 420, 26, 40, 70, 0, 1564180696, 1565735896, 0, NULL, NULL, 'Online', 1565735896, 1, '0'),
(227, 'numquam_624', 'Reiciendis sit molestias qui deleniti voluptatem.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 790, 26, 15, 80, 0, 1564180696, 1565476696, 0, NULL, NULL, 'Online', 1565303896, 1, '0'),
(228, 'nulla_975', 'Odit et molestiae sunt dolor non accusamus consequatur.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 440, 0, 20, 370, 1, 1563921496, 1565995096, 0, NULL, NULL, 'Cheque', 1565217496, 1, '0'),
(229, 'aut_533', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 80, 0, 9, 890, 1, 1564439896, 1565822296, 0, NULL, NULL, 'Online', 1564526296, 1, '0'),
(230, 'nam_744', 'Porro dicta eius earum sequi quis doloribus enim.', 69, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 230, 0, 34, 90, 0, 1564267096, 1565390296, 0, NULL, NULL, 'Cheque', 1563575896, 1, '0'),
(231, 'impedit_521', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 490, 18, 0, 460, 1, 1563489497, 1564439897, 0, NULL, NULL, 'Cash', 1565131097, 0, '0'),
(232, 'quas_302', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 970, 32, 0, 710, 1, 1563489497, 1564439897, 0, NULL, NULL, 'Cheque', 1564267097, 0, '0'),
(233, 'ratione_639', 'Quas quisquam facilis ipsum pariatur corporis eum ea sit molestias et vero.', 75, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 990, 9, 0, 620, 0, 1563489497, 1565217497, 0, NULL, NULL, 'Online', 1564267097, 0, '0'),
(234, 'ad_238', 'Dolor qui et vel aperiam exercitationem aliquid ratione amet.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 770, 6, 10, 650, 1, 1563662297, 1564612697, 0, NULL, NULL, 'Bank Deposit', 1565476697, 1, '0'),
(235, 'minus_711', 'Inventore voluptate non harum ut ut.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 390, 0, 1, 70, 1, 1564267097, 1564439897, 0, NULL, NULL, 'Cheque', 1565649497, 0, '0'),
(236, 'pariatur_251', 'Iure eos sunt error nam numquam et ut dolore quod.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 100, 0, 0, 420, 0, 1564439897, 1565303897, 0, NULL, NULL, 'Bank Deposit', 1565476697, 0, '0'),
(237, 'ut_409', 'Et molestiae dolorum vero atque labore.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 650, 0, 0, 360, 0, 1563489497, 1564526297, 1, NULL, NULL, 'Cheque', 1565735897, 1, '0'),
(238, 'dolore_135', NULL, 50, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 910, 0, 0, 720, 0, 1564007897, 1564871897, 0, NULL, NULL, 'Cash', 1565563097, 1, '0'),
(239, 'quis_586', 'Ipsum assumenda totam et ea consequatur ut ut esse odit natus.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 160, 0, 0, 60, 1, 1563748697, 1564612697, 0, NULL, NULL, 'Cheque', 1564267097, 1, '0'),
(240, 'consequuntur_109', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 580, 0, 0, 800, 0, 1563921497, 1564612697, 1, NULL, NULL, 'Bank Deposit', 1564007897, 1, '0'),
(241, 'quia_186', 'Ut omnis nostrum minima alias quibusdam consequuntur et.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 660, 22, 26, 90, 0, 1563575897, 1564785497, 0, NULL, NULL, 'Cash', 1565217497, 1, '0'),
(242, 'illo_329', 'Quia ut quis delectus laborum eligendi voluptatem et.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 460, 0, 0, 870, 1, 1564439897, 1565044697, 0, NULL, NULL, 'Card', 1565303897, 1, '0'),
(243, 'alias_251', 'Ipsum veniam provident ducimus doloremque consectetur.', 63, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 140, 34, 28, 110, 0, 1563748697, 1565217497, 0, NULL, NULL, 'Cheque', 1564526297, 1, '0'),
(244, 'impedit_475', 'In id veritatis doloribus iusto tempora quia dignissimos facilis.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 310, 50, 0, 230, 0, 1563921497, 1564439897, 1, NULL, NULL, 'Cheque', 1564612697, 0, '0'),
(245, 'velit_261', NULL, 45, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 330, 46, 34, 920, 1, 1564267097, 1564526297, 0, NULL, NULL, 'Card', 1565822297, 0, '0'),
(246, 'possimus_534', 'Laboriosam officiis sequi et vel commodi.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 580, 0, 31, 910, 0, 1563662297, 1565390297, 0, NULL, NULL, 'Online', 1564871897, 1, '0'),
(247, 'consectetur_129', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 780, 0, 19, 420, 1, 1563575897, 1564439897, 0, NULL, NULL, 'Card', 1564871897, 0, '0'),
(248, 'est_482', 'Molestias molestiae consequatur quia vitae blanditiis dolor dolorum.', 45, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 240, 29, 3, 810, 1, 1563489497, 1565563097, 0, NULL, NULL, 'Cheque', 1565995097, 1, '0'),
(249, 'fuga_354', 'Quidem tempora assumenda consectetur aliquam et facilis sit sapiente a.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 270, 0, 33, 560, 1, 1563489497, 1565563097, 0, NULL, NULL, 'Card', 1565476697, 1, '0'),
(250, 'maiores_101', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 900, 0, 17, 60, 0, 1563403097, 1564439897, 1, NULL, NULL, 'Online', 1565735897, 1, '0'),
(251, 'rerum_116', 'Sequi assumenda exercitationem inventore magnam corporis ad quae.', 69, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 150, 37, 0, 710, 0, 1564007897, 1565735897, 0, NULL, NULL, 'Card', 1564353497, 0, '0'),
(252, 'sunt_236', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 680, 0, 0, 60, 0, 1563575897, 1565044697, 0, NULL, NULL, 'Cash', 1563403097, 0, '0'),
(253, 'nulla_475', 'Vitae quia optio sit eos.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 760, 20, 0, 640, 1, 1563748697, 1564526297, 0, NULL, NULL, 'Cash', 1565735897, 0, '0'),
(254, 'voluptatem_485', 'Quia fugiat odit aut magnam ex illum eius sed.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 860, 28, 0, 370, 0, 1564007897, 1565908697, 0, NULL, NULL, 'Card', 1563835097, 0, '0'),
(255, 'odio_669', NULL, 45, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 300, 34, 43, 360, 1, 1563835097, 1564526297, 0, NULL, NULL, 'Bank Deposit', 1563921497, 1, '0'),
(256, 'delectus_144', 'Minima voluptas blanditiis facilis est temporibus pariatur.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 680, 2, 0, 420, 0, 1563403097, 1564612697, 1, NULL, NULL, 'Online', 1564267097, 0, '0'),
(257, 'maxime_462', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 680, 46, 0, 90, 0, 1563575897, 1564526297, 1, NULL, NULL, 'Card', 1565822297, 0, '0'),
(258, 'nobis_944', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 880, 0, 1, 710, 0, 1563921497, 1564439897, 1, NULL, NULL, 'Bank Deposit', 1564958297, 0, '0'),
(259, 'ut_607', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 860, 0, 6, 570, 0, 1564267097, 1564785497, 0, NULL, NULL, 'Cash', 1565131097, 0, '0'),
(260, 'voluptatem_254', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 90, 0, 0, 300, 0, 1563662297, 1564439897, 1, NULL, NULL, 'Cash', 1565131097, 1, '0'),
(261, 'qui_485', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 750, 0, 0, 200, 1, 1564439897, 1565735897, 0, NULL, NULL, 'Card', 1563921497, 0, '0'),
(262, 'nam_844', NULL, 68, '[{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 800, 0, 0, 760, 0, 1564094297, 1564439897, 1, NULL, NULL, 'Online', 1563662297, 0, '0'),
(263, 'voluptatem_586', NULL, 74, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 360, 0, 20, 890, 1, 1564267097, 1564439897, 0, NULL, NULL, 'Cheque', 1563403097, 0, '0'),
(264, 'consequatur_852', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 500, 0, 0, 580, 1, 1564353497, 1564612697, 0, NULL, NULL, 'Cash', 1564353497, 0, '0'),
(265, 'similique_163', NULL, 75, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 610, 0, 0, 70, 1, 1563662297, 1565735897, 0, NULL, NULL, 'Card', 1563662297, 1, '0'),
(266, 'perferendis_900', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"700\"}]', 210, 0, 0, 600, 0, 1564439897, 1565044697, 0, NULL, NULL, 'Card', 1564267097, 0, '0'),
(267, 'id_705', 'Corrupti quaerat officia non consequatur asperiores est id dolorem voluptatibus.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 870, 35, 35, 320, 1, 1563575897, 1564526297, 0, NULL, NULL, 'Online', 1564353497, 0, '0'),
(268, 'est_984', NULL, 63, '[{\"title\":\"Library fee\",\"amount\":\"100\"}]', 560, 27, 0, 660, 0, 1564094297, 1564526297, 1, NULL, NULL, 'Card', 1563921497, 1, '0'),
(269, 'earum_901', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 550, 5, 0, 990, 0, 1563403097, 1564439897, 1, NULL, NULL, 'Bank Deposit', 1565217497, 1, '0'),
(270, 'minus_644', 'Et occaecati autem molestiae cupiditate dolores est dolorum.', 74, '[{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 200, 10, 0, 490, 0, 1563489497, 1564612697, 1, NULL, NULL, 'Cash', 1565476697, 1, '0'),
(271, 'occaecati_379', NULL, 54, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 100, 0, 8, 730, 0, 1564180697, 1564526297, 1, NULL, NULL, 'Cash', 1563921497, 0, '0'),
(272, 'repudiandae_133', 'Dolorem vitae neque nihil reiciendis fugit ut.', 74, '[{\"title\":\"Building fee\",\"amount\":\"100\"}]', 350, 43, 0, 680, 1, 1563921497, 1565995097, 0, NULL, NULL, 'Cash', 1564612697, 0, '0'),
(273, 'quis_598', 'Consequatur aspernatur qui iusto velit mollitia repellendus et.', 45, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 860, 9, 0, 770, 0, 1564180697, 1565476697, 0, NULL, NULL, 'Online', 1565908697, 0, '0'),
(274, 'dignissimos_276', 'Est quasi ea ratione aut aut.', 69, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 590, 0, 0, 80, 1, 1564439897, 1565217497, 0, NULL, NULL, 'Cheque', 1563748697, 1, '0'),
(275, 'et_804', 'Iure exercitationem neque minus ipsa a neque aut.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 760, 0, 0, 90, 1, 1564180697, 1564439897, 0, NULL, NULL, 'Cheque', 1565044697, 1, '0'),
(276, 'qui_863', 'Perferendis aut sed rerum earum officia reiciendis pariatur inventore.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 480, 0, 0, 330, 0, 1563921498, 1564612698, 1, NULL, NULL, 'Cheque', 1564526298, 1, '0'),
(277, 'perspiciatis_112', 'Rerum quo voluptate repellendus eos quisquam.', 50, '[{\"title\":\"Building fee\",\"amount\":\"200\"}]', 450, 0, 40, 790, 1, 1563835098, 1565131098, 0, NULL, NULL, 'Card', 1565735898, 0, '0'),
(278, 'rerum_359', 'Doloribus sunt facere voluptates perferendis sapiente.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 340, 19, 0, 980, 0, 1563489498, 1565131098, 0, NULL, NULL, 'Online', 1565995098, 1, '0'),
(279, 'id_347', 'Consequuntur facilis ut hic nemo.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 430, 25, 41, 930, 1, 1564353498, 1564526298, 0, NULL, NULL, 'Online', 1565995098, 0, '0'),
(280, 'enim_684', 'Illum harum optio vel asperiores harum.', 72, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 540, 0, 38, 440, 0, 1564267098, 1564526298, 1, NULL, NULL, 'Cash', 1563575898, 1, '0'),
(281, 'similique_561', 'Odit unde eligendi nihil qui.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 300, 0, 0, 290, 0, 1564439898, 1565735898, 0, NULL, NULL, 'Online', 1564958298, 0, '0'),
(282, 'tempora_855', 'Tempora qui modi est quia eveniet quas laborum est.', 72, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 950, 44, 0, 50, 1, 1564007898, 1565476698, 0, NULL, NULL, 'Cash', 1563921498, 1, '0'),
(283, 'dolor_241', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 250, 0, 0, 580, 0, 1563835098, 1565563098, 0, NULL, NULL, 'Bank Deposit', 1564612698, 0, '0'),
(284, 'voluptates_116', 'Libero provident reiciendis quod ipsam quod.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 610, 0, 0, 190, 1, 1564180698, 1565217498, 0, NULL, NULL, 'Card', 1565217498, 1, '0'),
(285, 'et_100', 'Eos unde voluptates veritatis delectus debitis ea.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 950, 10, 0, 100, 1, 1563575898, 1565390298, 0, NULL, NULL, 'Card', 1563748698, 1, '0'),
(286, 'velit_686', 'Voluptate asperiores quo quia ipsum velit aut omnis rem eveniet.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 750, 47, 17, 800, 0, 1564007898, 1565044698, 0, NULL, NULL, 'Cheque', 1565563098, 1, '0'),
(287, 'deserunt_612', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 820, 0, 48, 110, 1, 1563575898, 1564612698, 0, NULL, NULL, 'Online', 1563662298, 0, '0'),
(288, 'quia_688', 'Autem non enim recusandae facere temporibus soluta dolorem vel atque.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 760, 47, 0, 470, 1, 1563489498, 1565908698, 0, NULL, NULL, 'Card', 1565390298, 1, '0'),
(289, 'molestias_251', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 440, 0, 0, 630, 1, 1563489498, 1565995098, 0, NULL, NULL, 'Online', 1564785498, 1, '0'),
(290, 'cum_420', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 520, 0, 44, 620, 1, 1563835098, 1565649498, 0, NULL, NULL, 'Card', 1563575898, 1, '0'),
(291, 'dolores_387', 'Aut nam molestias debitis cupiditate sequi ut ut omnis.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 850, 44, 1, 550, 0, 1564353498, 1565649498, 0, NULL, NULL, 'Cash', 1565476698, 1, '0'),
(292, 'non_967', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 420, 0, 0, 550, 0, 1563662298, 1564871898, 0, NULL, NULL, 'Card', 1564439898, 1, '0'),
(293, 'non_656', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 80, 38, 0, 520, 0, 1563748698, 1564612698, 1, NULL, NULL, 'Cash', 1565131098, 0, '0'),
(294, 'corporis_924', 'Iure magni dolor velit unde qui.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 1000, 0, 0, 880, 0, 1563575898, 1565649498, 0, NULL, NULL, 'Card', 1565908698, 0, '0'),
(295, 'est_728', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 670, 39, 0, 230, 0, 1563403098, 1565044698, 0, NULL, NULL, 'Cheque', 1563748698, 0, '0'),
(296, 'dolor_625', 'Maxime aut et est voluptatem sit labore.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 730, 18, 0, 750, 1, 1563921498, 1565735898, 0, NULL, NULL, 'Cash', 1563489498, 0, '0'),
(297, 'saepe_702', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 650, 14, 0, 710, 1, 1564094299, 1564439899, 0, NULL, NULL, 'Cash', 1563748699, 0, '0'),
(298, 'enim_494', 'Iste mollitia id et esse qui dolorem culpa nam commodi nihil.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 380, 0, 0, 540, 0, 1564439899, 1564612699, 1, NULL, NULL, 'Bank Deposit', 1563575899, 0, '0'),
(299, 'eos_136', NULL, 74, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 610, 31, 0, 600, 1, 1563748699, 1565649499, 0, NULL, NULL, 'Card', 1565217499, 0, '0'),
(300, 'quo_235', NULL, 72, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 460, 22, 0, 170, 0, 1564094299, 1564612699, 1, NULL, NULL, 'Card', 1564007899, 1, '0'),
(301, 'omnis_357', 'Tempora molestias odio labore enim qui eaque maiores doloribus repellat repellendus.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 810, 0, 0, 600, 1, 1564267099, 1565303899, 0, NULL, NULL, 'Cheque', 1563921499, 0, '0'),
(302, 'quam_371', 'Magnam magnam deleniti voluptatem et occaecati doloremque quibusdam.', 74, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 190, 0, 39, 260, 0, 1563489499, 1564439899, 1, NULL, NULL, 'Bank Deposit', 1563835099, 0, '0'),
(303, 'nihil_396', NULL, 50, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 950, 0, 0, 450, 0, 1563575899, 1565735899, 0, NULL, NULL, 'Cash', 1564094299, 0, '0'),
(304, 'et_610', 'Est odit natus voluptatum iusto minima illum.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 710, 49, 17, 340, 0, 1563575899, 1565303899, 0, NULL, NULL, 'Card', 1563921499, 1, '0'),
(305, 'quia_435', NULL, 47, '[{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 330, 49, 23, 980, 0, 1563835099, 1565044699, 0, NULL, NULL, 'Card', 1563489499, 1, '0'),
(306, 'non_144', NULL, 47, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 850, 0, 24, 250, 0, 1563403099, 1564526299, 1, NULL, NULL, 'Card', 1564958299, 0, '0'),
(307, 'qui_858', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 50, 0, 0, 880, 1, 1563835099, 1565995099, 0, NULL, NULL, 'Cheque', 1564094299, 0, '0'),
(308, 'ducimus_977', 'Exercitationem sed eligendi consequuntur expedita et voluptatem explicabo quam quidem aspernatur autem.', 45, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 140, 17, 2, 630, 0, 1564353499, 1564526299, 1, NULL, NULL, 'Cash', 1563835099, 0, '0'),
(309, 'distinctio_598', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 950, 0, 48, 440, 0, 1564267099, 1564612699, 1, NULL, NULL, 'Online', 1563662299, 1, '0'),
(310, 'consequuntur_819', NULL, 63, '[{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 260, 0, 0, 250, 0, 1563489499, 1564958299, 0, NULL, NULL, 'Cheque', 1563921499, 0, '0'),
(311, 'sed_905', NULL, 54, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 930, 40, 39, 270, 1, 1563748699, 1565303899, 0, NULL, NULL, 'Cash', 1565476699, 0, '0'),
(312, 'non_335', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 280, 0, 0, 400, 0, 1563748699, 1564612699, 1, NULL, NULL, 'Cheque', 1564958299, 0, '0'),
(313, 'non_648', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 750, 0, 8, 150, 0, 1563575899, 1564526299, 1, NULL, NULL, 'Card', 1565303899, 1, '0'),
(314, 'eum_530', NULL, 68, '[{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 960, 0, 34, 540, 0, 1563748699, 1564612699, 1, NULL, NULL, 'Cheque', 1565476699, 1, '0'),
(315, 'ab_511', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 180, 13, 0, 650, 1, 1563921499, 1564958299, 0, NULL, NULL, 'Cash', 1565217499, 1, '0'),
(316, 'nostrum_482', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 760, 0, 0, 930, 1, 1563575899, 1564612699, 0, NULL, NULL, 'Online', 1565649499, 0, '0'),
(317, 'quidem_341', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 700, 13, 15, 130, 1, 1563575899, 1565822299, 0, NULL, NULL, 'Cash', 1565735899, 0, '0'),
(318, 'consequatur_914', 'Odit enim porro adipisci labore in eos nihil voluptatem.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 550, 0, 24, 380, 1, 1563489499, 1564612699, 0, NULL, NULL, 'Online', 1565822299, 0, '0'),
(319, 'dignissimos_144', 'Praesentium ducimus sequi recusandae sed neque sit maiores reprehenderit.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 610, 0, 43, 650, 1, 1563748699, 1564612699, 0, NULL, NULL, 'Card', 1564094299, 0, '0'),
(320, 'dolor_907', 'Harum earum quis a dolorum tenetur sint.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 1000, 10, 48, 500, 0, 1563662299, 1564439899, 1, NULL, NULL, 'Cash', 1563662299, 1, '0'),
(321, 'suscipit_692', NULL, 45, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 520, 23, 3, 80, 1, 1563662299, 1565217499, 0, NULL, NULL, 'Card', 1565217499, 1, '0'),
(322, 'ducimus_488', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 80, 48, 0, 560, 1, 1563489499, 1564439899, 0, NULL, NULL, 'Bank Deposit', 1563575899, 0, '0'),
(323, 'expedita_976', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 700, 27, 8, 280, 0, 1563835099, 1565044699, 0, NULL, NULL, 'Cash', 1563489499, 1, '0'),
(324, 'eaque_630', NULL, 63, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 580, 0, 42, 540, 0, 1564180699, 1565390299, 0, NULL, NULL, 'Cheque', 1565131099, 0, '0'),
(325, 'incidunt_196', 'Maiores laudantium vel ut fuga porro dolores cum laboriosam nostrum est.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 960, 0, 0, 260, 0, 1563403099, 1564612699, 1, NULL, NULL, 'Online', 1565735899, 1, '0'),
(326, 'totam_749', 'Ullam dignissimos quia iusto dolorum ullam autem reprehenderit adipisci.', 72, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 540, 0, 0, 270, 0, 1563662299, 1564612699, 1, NULL, NULL, 'Online', 1565822299, 1, '0'),
(327, 'vitae_660', 'Cum cupiditate pariatur quae aspernatur sequi libero quae aliquam sequi quis.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 900, 42, 25, 550, 0, 1564439899, 1565131099, 0, NULL, NULL, 'Cash', 1563921499, 0, '0'),
(328, 'quaerat_356', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 970, 21, 0, 310, 1, 1564267099, 1564526299, 0, NULL, NULL, 'Cheque', 1564958299, 1, '0'),
(329, 'voluptates_429', 'Quasi omnis ea in similique aut pariatur natus iure omnis.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 950, 0, 19, 520, 0, 1564180699, 1565131099, 0, NULL, NULL, 'Cash', 1564958299, 0, '0'),
(330, 'voluptatem_359', 'A sed provident cupiditate aut minus tempore ea ad vel a.', 75, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 620, 31, 12, 550, 0, 1564267099, 1565303899, 0, NULL, NULL, 'Cheque', 1563489499, 0, '0'),
(331, 'eos_122', 'Voluptatem similique neque non dolorum aspernatur voluptates et voluptatem.', 72, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 1000, 49, 12, 600, 1, 1564353499, 1565476699, 0, NULL, NULL, 'Bank Deposit', 1563835099, 1, '0'),
(332, 'molestias_645', 'Ea earum ex iste quia similique in consequatur consequatur fuga quasi.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 50, 0, 8, 420, 1, 1564007900, 1564612700, 0, NULL, NULL, 'Cash', 1564267100, 0, '0'),
(333, 'inventore_555', NULL, 69, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 360, 0, 0, 300, 0, 1563662300, 1564526300, 1, NULL, NULL, 'Bank Deposit', 1563921500, 0, '0'),
(334, 'molestiae_140', 'Ut necessitatibus recusandae vel nam expedita quis enim vel.', 50, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 740, 0, 14, 750, 0, 1564094300, 1564612700, 1, NULL, NULL, 'Card', 1564439900, 0, '0'),
(335, 'eum_336', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 860, 0, 48, 600, 1, 1564094300, 1565303900, 0, NULL, NULL, 'Bank Deposit', 1564439900, 1, '0'),
(336, 'deserunt_272', 'Accusantium vel qui dolorum sed id deleniti.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 890, 0, 0, 240, 1, 1563489500, 1564439900, 0, NULL, NULL, 'Online', 1564353500, 0, '0'),
(337, 'omnis_733', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 790, 47, 8, 170, 1, 1564094300, 1565822300, 0, NULL, NULL, 'Cash', 1564094300, 0, '0'),
(338, 'ut_879', 'Nulla sed in officia doloribus officia et.', 47, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 820, 0, 0, 870, 0, 1564353500, 1564439900, 1, NULL, NULL, 'Cheque', 1565822300, 1, '0'),
(339, 'commodi_876', NULL, 54, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 840, 0, 37, 580, 0, 1563835100, 1565995100, 0, NULL, NULL, 'Cheque', 1563835100, 0, '0'),
(340, 'nihil_246', 'Rerum ducimus et aut dolorem eaque at saepe consequatur.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 720, 5, 0, 610, 0, 1564267100, 1564612700, 1, NULL, NULL, 'Cheque', 1564612700, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(341, 'ut_937', NULL, 68, '[{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 400, 46, 0, 510, 1, 1564353500, 1564871900, 0, NULL, NULL, 'Cash', 1565217500, 1, '0'),
(342, 'earum_347', NULL, 74, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 500, 0, 49, 590, 0, 1563662300, 1565563100, 0, NULL, NULL, 'Online', 1564871900, 1, '0'),
(343, 'ut_631', 'Odio fugit occaecati nemo eius ipsum.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 630, 20, 0, 620, 1, 1564180700, 1564612700, 0, NULL, NULL, 'Bank Deposit', 1565044700, 1, '0'),
(344, 'non_616', NULL, 54, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 900, 25, 0, 230, 1, 1564007900, 1565649500, 0, NULL, NULL, 'Bank Deposit', 1565303900, 1, '0'),
(345, 'ipsa_712', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 610, 0, 0, 670, 1, 1563748700, 1565995100, 0, NULL, NULL, 'Online', 1565044700, 0, '0'),
(346, 'blanditiis_665', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 250, 0, 0, 820, 1, 1563662300, 1564439900, 0, NULL, NULL, 'Online', 1563835100, 1, '0'),
(347, 'dolorem_605', 'Odio sit nam animi delectus ad repudiandae eaque possimus adipisci.', 74, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 940, 25, 0, 860, 1, 1563662300, 1565822300, 0, NULL, NULL, 'Cash', 1565822300, 0, '0'),
(348, 'non_349', NULL, 54, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 900, 37, 12, 880, 0, 1564007900, 1564612700, 1, NULL, NULL, 'Cash', 1564439900, 1, '0'),
(349, 'qui_858', 'Libero tempora cum deserunt asperiores quisquam reiciendis doloremque quasi eius doloribus.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"}]', 150, 0, 0, 250, 0, 1564094300, 1564526300, 1, NULL, NULL, 'Card', 1564958300, 1, '0'),
(350, 'sed_850', 'Tenetur asperiores velit fuga porro officia.', 45, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 730, 18, 0, 980, 1, 1564180700, 1564958300, 0, NULL, NULL, 'Cash', 1565131100, 0, '0'),
(351, 'veniam_362', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 620, 0, 0, 920, 0, 1563921500, 1565908700, 0, NULL, NULL, 'Cheque', 1563575900, 0, '0'),
(352, 'sed_709', NULL, 63, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 940, 0, 0, 370, 1, 1563662300, 1565476700, 0, NULL, NULL, 'Bank Deposit', 1565390300, 0, '0'),
(353, 'facere_195', 'Esse sunt rerum totam aliquid sed esse molestias sequi.', 74, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 300, 0, 31, 600, 1, 1563921500, 1564612700, 0, NULL, NULL, 'Online', 1563921500, 0, '0'),
(354, 'numquam_212', 'Omnis dolores magnam sit totam aliquid est.', 74, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 270, 48, 0, 640, 0, 1564267101, 1564526301, 1, NULL, NULL, 'Online', 1563921501, 0, '0'),
(355, 'quo_256', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 180, 20, 0, 890, 0, 1563921501, 1564526301, 1, NULL, NULL, 'Cheque', 1564612701, 0, '0'),
(356, 'omnis_773', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 930, 7, 0, 270, 1, 1563748701, 1564958301, 0, NULL, NULL, 'Bank Deposit', 1565995101, 1, '0'),
(357, 'repudiandae_966', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 740, 0, 2, 90, 0, 1563748701, 1565735901, 0, NULL, NULL, 'Cash', 1563835101, 0, '0'),
(358, 'laboriosam_442', 'Qui exercitationem assumenda ullam qui exercitationem vel placeat et.', 64, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 600, 38, 7, 410, 0, 1564353501, 1565044701, 0, NULL, NULL, 'Bank Deposit', 1565908701, 0, '0'),
(359, 'corporis_814', 'Pariatur tenetur incidunt veniam rem tenetur fuga exercitationem numquam et amet.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 490, 0, 0, 970, 0, 1563921501, 1564526301, 1, NULL, NULL, 'Online', 1564526301, 0, '0'),
(360, 'corporis_303', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 730, 46, 0, 790, 0, 1564353501, 1565303901, 0, NULL, NULL, 'Card', 1565217501, 0, '0'),
(361, 'est_254', 'Omnis vel reiciendis est fugit ut aperiam autem et harum laudantium.', 69, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 100, 0, 0, 470, 1, 1564094301, 1565908701, 0, NULL, NULL, 'Card', 1564267101, 1, '0'),
(362, 'ipsa_794', 'Velit nulla dolorem adipisci quos odit.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 650, 11, 33, 880, 1, 1564007901, 1564612701, 0, NULL, NULL, 'Bank Deposit', 1563662301, 0, '0'),
(363, 'beatae_777', NULL, 45, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 830, 0, 0, 50, 1, 1563921501, 1565217501, 0, NULL, NULL, 'Card', 1563489501, 1, '0'),
(364, 'incidunt_946', 'Dolorum est mollitia doloremque illo dolorum.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 720, 0, 0, 280, 1, 1564094301, 1564612701, 0, NULL, NULL, 'Online', 1564612701, 1, '0'),
(365, 'voluptatum_524', NULL, 63, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 610, 0, 0, 910, 1, 1564007901, 1564612701, 0, NULL, NULL, 'Cheque', 1563921501, 0, '0'),
(366, 'aspernatur_980', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 440, 41, 49, 240, 0, 1563575901, 1564612701, 1, NULL, NULL, 'Bank Deposit', 1565303901, 0, '0'),
(367, 'asperiores_739', 'Facilis aut porro adipisci temporibus et iusto ipsam occaecati.', 74, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 880, 0, 0, 290, 0, 1563662301, 1564439901, 1, NULL, NULL, 'Cash', 1565649501, 1, '0'),
(368, 'nobis_648', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 950, 1, 38, 860, 1, 1564180701, 1564871901, 0, NULL, NULL, 'Card', 1564094301, 1, '0'),
(369, 'est_284', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 380, 35, 0, 700, 1, 1564180701, 1564526301, 0, NULL, NULL, 'Card', 1564958301, 0, '0'),
(370, 'libero_858', NULL, 74, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 960, 14, 0, 850, 1, 1564353501, 1565476701, 0, NULL, NULL, 'Online', 1564958301, 1, '0'),
(371, 'magnam_688', 'Nobis provident inventore non est eaque voluptatum asperiores voluptas.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 630, 0, 14, 440, 1, 1563575901, 1564439901, 0, NULL, NULL, 'Cash', 1565390301, 1, '0'),
(372, 'voluptate_390', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 730, 10, 0, 740, 1, 1564267101, 1564871901, 0, NULL, NULL, 'Cash', 1563662301, 1, '0'),
(373, 'nihil_821', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"300\"}]', 350, 33, 49, 660, 1, 1564353501, 1564526301, 0, NULL, NULL, 'Bank Deposit', 1563575901, 1, '0'),
(374, 'est_822', 'Voluptatem atque ipsum alias repellat ex sed tempore omnis veniam.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 860, 23, 26, 630, 1, 1563403101, 1565822301, 0, NULL, NULL, 'Card', 1563403101, 1, '0'),
(375, 'facilis_815', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 470, 44, 4, 480, 1, 1563835101, 1564612701, 0, NULL, NULL, 'Cheque', 1565735901, 1, '0'),
(376, 'laudantium_676', 'Deserunt enim voluptatem facilis facilis consequatur deleniti.', 75, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 670, 0, 0, 410, 1, 1563921501, 1564612701, 0, NULL, NULL, 'Cheque', 1565735901, 1, '0'),
(377, 'maxime_443', 'Nisi quis occaecati voluptas rerum et.', 45, '[{\"title\":\"Building fee\",\"amount\":\"300\"}]', 470, 10, 0, 830, 0, 1563489501, 1564958301, 0, NULL, NULL, 'Cheque', 1563662301, 0, '0'),
(378, 'et_380', 'Est ut neque eos reiciendis saepe aperiam enim est est.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 780, 11, 0, 150, 0, 1563748701, 1565476701, 0, NULL, NULL, 'Cash', 1563748701, 1, '0'),
(379, 'harum_652', 'Cum minima veritatis necessitatibus corporis maiores voluptatem.', 54, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 190, 0, 0, 660, 1, 1564094301, 1564439901, 0, NULL, NULL, 'Cheque', 1564439901, 1, '0'),
(380, 'molestiae_891', 'Vel repellat vitae blanditiis est tempore.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 910, 0, 48, 230, 1, 1563662301, 1565217501, 0, NULL, NULL, 'Online', 1564612701, 0, '0'),
(381, 'id_495', NULL, 74, '[{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 710, 19, 48, 580, 1, 1564180701, 1564439901, 0, NULL, NULL, 'Bank Deposit', 1565390301, 0, '0'),
(382, 'ipsum_814', NULL, 50, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 300, 0, 45, 540, 0, 1563489501, 1565044701, 0, NULL, NULL, 'Cash', 1563575901, 1, '0'),
(383, 'perferendis_988', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 230, 24, 49, 390, 1, 1563748701, 1564612701, 0, NULL, NULL, 'Cash', 1565563101, 1, '0'),
(384, 'dicta_521', 'Reprehenderit cum et aut a delectus.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 490, 15, 22, 560, 0, 1564439901, 1565735901, 0, NULL, NULL, 'Card', 1563748701, 0, '0'),
(385, 'ut_308', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 830, 0, 0, 650, 1, 1563921501, 1564958301, 0, NULL, NULL, 'Bank Deposit', 1563921501, 0, '0'),
(386, 'perspiciatis_636', NULL, 72, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 470, 0, 0, 570, 1, 1563489501, 1564439901, 0, NULL, NULL, 'Cash', 1564612701, 0, '0'),
(387, 'dolor_688', NULL, 72, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 230, 9, 0, 280, 1, 1563489501, 1564526301, 0, NULL, NULL, 'Online', 1563575901, 0, '0'),
(388, 'beatae_622', NULL, 74, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 170, 0, 29, 660, 0, 1564267101, 1564439901, 1, NULL, NULL, 'Cash', 1564094301, 1, '0'),
(389, 'ut_129', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 510, 0, 0, 960, 1, 1564439901, 1565908701, 0, NULL, NULL, 'Cash', 1563575901, 0, '0'),
(390, 'consequuntur_100', NULL, 45, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 720, 0, 0, 860, 0, 1563489501, 1564439901, 1, NULL, NULL, 'Cash', 1564094301, 1, '0'),
(391, 'ut_457', 'Et et ea fugit sint commodi voluptas.', 54, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 110, 13, 35, 930, 1, 1564353501, 1565649501, 0, NULL, NULL, 'Online', 1564439901, 0, '0'),
(392, 'assumenda_553', 'Veniam porro pariatur minima nostrum eum.', 67, ']', 990, 45, 33, 760, 1, 1563575901, 1564526301, 0, NULL, NULL, 'Cheque', 1564267101, 1, '0'),
(393, 'et_869', NULL, 47, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 360, 0, 24, 620, 0, 1564180701, 1564526301, 1, NULL, NULL, 'Bank Deposit', 1563748701, 1, '0'),
(394, 'blanditiis_138', NULL, 47, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 900, 46, 0, 100, 0, 1563662301, 1564439901, 1, NULL, NULL, 'Cheque', 1565822301, 0, '0'),
(395, 'et_856', NULL, 75, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 120, 0, 0, 970, 0, 1563921502, 1565131102, 0, NULL, NULL, 'Cash', 1564871902, 0, '0'),
(396, 'non_595', 'Et ipsa fugit blanditiis corrupti.', 63, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 230, 0, 0, 890, 1, 1564353502, 1564439902, 0, NULL, NULL, 'Card', 1563748702, 1, '0'),
(397, 'ad_763', 'Reprehenderit recusandae commodi eveniet qui quae qui non neque sed.', 59, '[{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 460, 18, 0, 460, 0, 1563403102, 1565563102, 0, NULL, NULL, 'Cash', 1564526302, 0, '0'),
(398, 'laborum_709', NULL, 54, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 610, 28, 20, 260, 0, 1563489502, 1565390302, 0, NULL, NULL, 'Cash', 1564180702, 1, '0'),
(399, 'quas_311', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 890, 37, 6, 450, 1, 1563575902, 1564439902, 0, NULL, NULL, 'Bank Deposit', 1565822302, 1, '0'),
(400, 'voluptate_334', 'Ullam qui illum impedit impedit assumenda cupiditate sint nam.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 800, 0, 35, 960, 0, 1563921502, 1564526302, 1, NULL, NULL, 'Online', 1565649502, 0, '0'),
(401, 'et_928', 'Quidem rerum rerum quis maiores voluptatum dolore magni quaerat repellat illum.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 960, 7, 33, 460, 1, 1563662302, 1564871902, 0, NULL, NULL, 'Bank Deposit', 1565476702, 1, '0'),
(402, 'qui_907', 'Nobis voluptate eum unde provident impedit quod.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 350, 13, 7, 710, 0, 1563921502, 1564439902, 1, NULL, NULL, 'Cheque', 1565390302, 0, '0'),
(403, 'et_672', 'Iure velit voluptas quidem fugit voluptatibus.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 460, 0, 47, 780, 1, 1563748702, 1565995102, 0, NULL, NULL, 'Card', 1563575902, 1, '0'),
(404, 'animi_301', 'Repellendus sunt inventore quod libero vel.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 800, 0, 0, 390, 1, 1563921502, 1564871902, 0, NULL, NULL, 'Online', 1564958302, 0, '0'),
(405, 'eius_871', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 190, 10, 20, 170, 0, 1563575902, 1564612702, 1, NULL, NULL, 'Bank Deposit', 1565303902, 0, '0'),
(406, 'voluptatibus_307', 'Velit reprehenderit sint voluptatem est sed fuga.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 580, 19, 33, 60, 1, 1564094302, 1565735902, 0, NULL, NULL, 'Card', 1563921502, 1, '0'),
(407, 'ut_858', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 430, 0, 15, 600, 0, 1563748702, 1564612702, 1, NULL, NULL, 'Cash', 1563835102, 1, '0'),
(408, 'iste_757', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 830, 0, 0, 850, 1, 1564439902, 1565390302, 0, NULL, NULL, 'Cash', 1564007902, 0, '0'),
(409, 'assumenda_492', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 370, 49, 40, 260, 1, 1564439902, 1564439902, 0, NULL, NULL, 'Bank Deposit', 1565995102, 0, '0'),
(410, 'corporis_442', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 490, 0, 33, 780, 1, 1563489502, 1565303902, 0, NULL, NULL, 'Cheque', 1563489502, 0, '0'),
(411, 'quos_694', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 460, 46, 47, 580, 1, 1563748702, 1565908702, 0, NULL, NULL, 'Card', 1564267102, 1, '0'),
(412, 'aut_976', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 620, 14, 13, 900, 1, 1564353502, 1564526302, 0, NULL, NULL, 'Cheque', 1564353502, 0, '0'),
(413, 'aut_180', 'Quasi veritatis qui illo omnis eaque alias doloremque et totam reprehenderit iure.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 700, 0, 0, 780, 1, 1563403102, 1564871902, 0, NULL, NULL, 'Cash', 1565735902, 0, '0'),
(414, 'blanditiis_190', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 540, 0, 0, 850, 1, 1564094302, 1564612702, 0, NULL, NULL, 'Online', 1565217502, 1, '0'),
(415, 'omnis_897', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"800\"}]', 800, 0, 34, 240, 0, 1563575902, 1564612702, 1, NULL, NULL, 'Cash', 1565217502, 1, '0'),
(416, 'reprehenderit_276', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 850, 0, 0, 440, 1, 1564353502, 1564785502, 0, NULL, NULL, 'Card', 1564439902, 1, '0'),
(417, 'facilis_818', 'Sint sint iusto ratione cum facere error officiis enim aut harum quia.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 570, 33, 16, 190, 1, 1564439902, 1565476702, 0, NULL, NULL, 'Card', 1565735902, 0, '0'),
(418, 'ex_593', 'Et aut vel provident aut accusamus eligendi atque.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 580, 0, 1, 750, 0, 1564007903, 1564612703, 1, NULL, NULL, 'Online', 1563489503, 0, '0'),
(419, 'et_663', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 780, 0, 0, 590, 1, 1563403103, 1564439903, 0, NULL, NULL, 'Card', 1563489503, 1, '0'),
(420, 'sequi_200', 'Sit ullam dolore velit cupiditate ut id blanditiis.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 430, 26, 43, 510, 1, 1563403103, 1564526303, 0, NULL, NULL, 'Card', 1565303903, 1, '0'),
(421, 'ut_556', NULL, 68, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 560, 0, 0, 440, 1, 1564267103, 1564439903, 0, NULL, NULL, 'Card', 1565822303, 0, '0'),
(422, 'magnam_769', 'Cum neque debitis dolor est accusamus similique quia ex consectetur.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 140, 41, 45, 970, 0, 1563748703, 1565044703, 0, NULL, NULL, 'Card', 1563403103, 1, '0'),
(423, 'quia_907', 'Maxime ut nisi unde incidunt officiis est modi voluptatem.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 950, 0, 26, 1000, 1, 1564007903, 1565303903, 0, NULL, NULL, 'Online', 1565476703, 0, '0'),
(424, 'consequatur_652', 'Ut aut sapiente eveniet et ut inventore deserunt fuga rerum.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 480, 37, 0, 860, 1, 1563921503, 1565044703, 0, NULL, NULL, 'Bank Deposit', 1565217503, 0, '0'),
(425, 'pariatur_621', 'Repellat est non cumque porro repudiandae quo iste illum.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 320, 0, 0, 120, 1, 1564353503, 1564526303, 0, NULL, NULL, 'Card', 1565822303, 0, '0'),
(426, 'veniam_918', 'Enim voluptatem rerum corrupti et alias et non iste eum natus.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 920, 22, 0, 400, 0, 1563662303, 1564526303, 1, NULL, NULL, 'Cash', 1564439903, 0, '0'),
(427, 'occaecati_968', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 80, 0, 45, 130, 1, 1563662303, 1564526303, 0, NULL, NULL, 'Bank Deposit', 1565390303, 0, '0'),
(428, 'voluptate_852', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 60, 11, 28, 610, 1, 1564180703, 1564439903, 0, NULL, NULL, 'Cheque', 1565908703, 1, '0'),
(429, 'perferendis_533', 'Accusantium molestias ab consequatur doloribus est reprehenderit beatae nobis ut.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 100, 2, 50, 110, 0, 1563921503, 1565217503, 0, NULL, NULL, 'Cheque', 1565735903, 1, '0'),
(430, 'odio_368', 'Qui eum rerum nemo neque illum voluptatum in natus saepe.', 68, '[{\"title\":\"Library fee\",\"amount\":\"200\"}]', 600, 0, 46, 570, 1, 1564439903, 1564526303, 0, NULL, NULL, 'Cash', 1563575903, 0, '0'),
(431, 'cupiditate_271', NULL, 68, '[{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 180, 0, 0, 150, 1, 1564353503, 1565649503, 0, NULL, NULL, 'Online', 1564267103, 0, '0'),
(432, 'iusto_620', 'Facere iure possimus harum beatae deserunt id numquam aut harum.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 480, 13, 29, 340, 0, 1564180703, 1564612703, 1, NULL, NULL, 'Online', 1564526303, 1, '0'),
(433, 'qui_820', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 980, 0, 40, 780, 0, 1563489503, 1564612703, 1, NULL, NULL, 'Cash', 1564180703, 1, '0'),
(434, 'ipsa_292', 'Repellendus sunt est voluptatem modi iusto dolor consequatur ut.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 840, 41, 0, 560, 0, 1563921503, 1564526303, 1, NULL, NULL, 'Bank Deposit', 1565044703, 0, '0'),
(435, 'et_388', 'Sit autem enim sunt accusantium ratione quia iusto iure eos.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 210, 13, 0, 640, 1, 1564007903, 1565476703, 0, NULL, NULL, 'Cheque', 1563403103, 1, '0'),
(436, 'voluptatem_129', 'Ea aut nihil enim dicta sed sit consectetur quasi veniam illum fuga.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 230, 0, 1, 230, 0, 1564353503, 1564785503, 0, NULL, NULL, 'Cash', 1565649503, 1, '0'),
(437, 'id_773', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 250, 0, 0, 940, 1, 1564267103, 1564439903, 0, NULL, NULL, 'Cheque', 1564612703, 1, '0'),
(438, 'tempora_879', 'Omnis sapiente non porro et sed et molestiae architecto.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 110, 4, 0, 610, 1, 1563662303, 1565995103, 0, NULL, NULL, 'Card', 1564958303, 0, '0'),
(439, 'nihil_446', 'Dolorum sit voluptate earum sit architecto accusantium voluptas.', 68, '[{\"title\":\"Library fee\",\"amount\":\"200\"}]', 930, 24, 0, 450, 0, 1564094303, 1564785503, 0, NULL, NULL, 'Bank Deposit', 1565822303, 1, '0'),
(440, 'neque_745', 'Dolores nulla et ullam consequatur eos veniam.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 150, 0, 0, 960, 1, 1564007903, 1564958303, 0, NULL, NULL, 'Bank Deposit', 1564871903, 0, '0'),
(441, 'et_346', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 630, 0, 0, 470, 0, 1564007903, 1565303903, 0, NULL, NULL, 'Card', 1564439903, 0, '0'),
(442, 'est_276', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 220, 15, 0, 230, 0, 1563748703, 1564439903, 1, NULL, NULL, 'Card', 1565390303, 0, '0'),
(443, 'unde_347', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 330, 0, 0, 280, 1, 1564007903, 1565044703, 0, NULL, NULL, 'Cash', 1564785503, 0, '0'),
(444, 'omnis_457', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 120, 17, 38, 180, 0, 1564094303, 1564612703, 1, NULL, NULL, 'Cheque', 1564958303, 0, '0'),
(445, 'facere_506', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 910, 22, 0, 520, 1, 1563489503, 1565822303, 0, NULL, NULL, 'Online', 1564094303, 0, '0'),
(446, 'ea_517', 'Dolore commodi rerum qui minus est amet dolore voluptatibus minus voluptas nesciunt.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 660, 44, 23, 320, 0, 1563489503, 1565908703, 0, NULL, NULL, 'Card', 1565995103, 1, '0'),
(447, 'dolores_846', 'Tenetur voluptates voluptates voluptatem ipsam qui est omnis ducimus.', 68, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 380, 24, 45, 300, 0, 1563403103, 1564612703, 1, NULL, NULL, 'Cash', 1563748703, 1, '0'),
(448, 'nesciunt_860', 'Est pariatur aut porro nisi corporis omnis.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 540, 27, 0, 80, 0, 1564267103, 1564526303, 1, NULL, NULL, 'Cash', 1565649503, 1, '0'),
(449, 'harum_900', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 70, 0, 0, 380, 1, 1563748703, 1565563103, 0, NULL, NULL, 'Cheque', 1565995103, 1, '0'),
(450, 'atque_505', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 990, 13, 20, 470, 0, 1563921503, 1565303903, 0, NULL, NULL, 'Online', 1565476703, 0, '0'),
(451, 'explicabo_349', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 870, 9, 22, 300, 1, 1564267103, 1564439903, 0, NULL, NULL, 'Card', 1564958303, 0, '0'),
(452, 'in_443', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 710, 0, 0, 310, 1, 1563489504, 1565563104, 0, NULL, NULL, 'Online', 1564353504, 1, '0'),
(453, 'qui_375', 'Ipsum consectetur commodi labore porro repellat quis non molestias.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 110, 0, 1, 470, 1, 1564007904, 1564439904, 0, NULL, NULL, 'Cash', 1565131104, 0, '0'),
(454, 'sint_836', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 120, 35, 35, 890, 1, 1564007904, 1565217504, 0, NULL, NULL, 'Bank Deposit', 1563921504, 1, '0'),
(455, 'aut_934', 'Enim nihil temporibus eos eum iusto.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 70, 0, 0, 250, 1, 1563403104, 1564526304, 0, NULL, NULL, 'Cheque', 1565822304, 0, '0'),
(456, 'delectus_469', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 780, 46, 0, 870, 1, 1563489504, 1565908704, 0, NULL, NULL, 'Cheque', 1564094304, 0, '0'),
(457, 'eveniet_941', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 670, 0, 0, 200, 0, 1563662304, 1565131104, 0, NULL, NULL, 'Cheque', 1564439904, 1, '0'),
(458, 'enim_677', 'Aut quaerat sed velit optio adipisci illo.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 510, 11, 0, 950, 0, 1563489504, 1564612704, 1, NULL, NULL, 'Cheque', 1564007904, 1, '0'),
(459, 'cupiditate_466', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 920, 19, 0, 230, 1, 1564094304, 1564439904, 0, NULL, NULL, 'Cash', 1563489504, 1, '0'),
(460, 'quia_588', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 260, 15, 4, 640, 1, 1564094304, 1565908704, 0, NULL, NULL, 'Cheque', 1565217504, 1, '0'),
(461, 'tenetur_999', 'Autem nam sed voluptas vero et recusandae non.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 170, 33, 19, 60, 0, 1563921504, 1565044704, 0, NULL, NULL, 'Online', 1564958304, 0, '0'),
(462, 'commodi_676', 'Qui quo quos voluptatem eius impedit fuga laborum et.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 410, 40, 8, 960, 1, 1563575904, 1565303904, 0, NULL, NULL, 'Cash', 1565822304, 1, '0'),
(463, 'quas_389', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 960, 0, 0, 270, 1, 1563662304, 1564612704, 0, NULL, NULL, 'Online', 1565476704, 0, '0'),
(464, 'quos_224', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 290, 29, 36, 870, 1, 1563921504, 1564612704, 0, NULL, NULL, 'Online', 1564267104, 1, '0'),
(465, 'cum_734', 'Voluptate suscipit natus incidunt suscipit ratione a.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 980, 48, 0, 720, 0, 1563662304, 1564958304, 0, NULL, NULL, 'Cheque', 1564612704, 1, '0'),
(466, 'non_442', 'Vel tempore earum reprehenderit ex et quo quaerat.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 750, 0, 0, 230, 0, 1563489504, 1565303904, 0, NULL, NULL, 'Online', 1563835104, 0, '0'),
(467, 'ea_381', 'Assumenda ex qui debitis iure voluptas.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 300, 0, 43, 870, 1, 1563921504, 1564526304, 0, NULL, NULL, 'Online', 1563575904, 0, '0'),
(468, 'quia_914', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 560, 4, 0, 170, 1, 1564094304, 1564612704, 0, NULL, NULL, 'Cash', 1564526304, 0, '0'),
(469, 'natus_786', 'Et ea ipsum sapiente dicta.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 550, 1, 0, 560, 0, 1564007904, 1565995104, 0, NULL, NULL, 'Bank Deposit', 1564439904, 0, '0'),
(470, 'aut_565', 'Nihil quasi eum accusamus officia aut omnis repellat sint in autem.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 70, 9, 0, 890, 1, 1563489504, 1564612704, 0, NULL, NULL, 'Bank Deposit', 1565908704, 1, '0'),
(471, 'labore_394', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 690, 46, 12, 310, 0, 1563921505, 1565131105, 0, NULL, NULL, 'Bank Deposit', 1565908705, 1, '0'),
(472, 'est_462', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 720, 0, 26, 500, 1, 1563662305, 1564871905, 0, NULL, NULL, 'Cash', 1565649505, 1, '0'),
(473, 'dolores_505', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 770, 16, 0, 530, 0, 1563575905, 1564526305, 1, NULL, NULL, 'Cheque', 1563748705, 0, '0'),
(474, 'voluptas_381', 'Ad sequi non rerum voluptatum distinctio est nam quia alias.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 780, 0, 0, 700, 0, 1564180705, 1564958305, 0, NULL, NULL, 'Bank Deposit', 1565735905, 0, '0'),
(475, 'repellendus_160', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 230, 46, 19, 100, 1, 1564180705, 1564526305, 0, NULL, NULL, 'Cash', 1565822305, 1, '0'),
(476, 'earum_841', 'Sed quaerat adipisci aliquid labore rerum animi beatae.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"}]', 80, 0, 0, 630, 1, 1564353505, 1564612705, 0, NULL, NULL, 'Online', 1565131105, 0, '0'),
(477, 'est_579', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"}]', 750, 0, 0, 630, 1, 1564180705, 1565044705, 0, NULL, NULL, 'Card', 1565995105, 1, '0'),
(478, 'quis_368', 'Tempore omnis mollitia non rerum atque possimus fugit.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 610, 13, 0, 460, 0, 1564094305, 1564526305, 1, NULL, NULL, 'Cheque', 1563575905, 1, '0'),
(479, 'ratione_154', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 300, 0, 43, 470, 0, 1563403105, 1565390305, 0, NULL, NULL, 'Card', 1565390305, 1, '0'),
(480, 'officia_361', 'Rerum qui ut asperiores impedit distinctio voluptatem architecto.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 130, 0, 38, 430, 1, 1564353505, 1564785505, 0, NULL, NULL, 'Cash', 1565649505, 0, '0'),
(481, 'quia_994', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 460, 33, 11, 330, 1, 1563835105, 1565217505, 0, NULL, NULL, 'Bank Deposit', 1564871905, 0, '0'),
(482, 'et_625', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 670, 36, 8, 440, 1, 1563575905, 1564439905, 0, NULL, NULL, 'Card', 1563403105, 0, '0'),
(483, 'officia_419', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 500, 2, 0, 100, 1, 1564094305, 1565649505, 0, NULL, NULL, 'Card', 1564180705, 1, '0'),
(484, 'quae_286', 'Minus in est dolorem ea ut accusantium.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 920, 39, 0, 140, 0, 1564267105, 1564526305, 1, NULL, NULL, 'Card', 1563835105, 1, '0'),
(485, 'qui_920', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 390, 0, 0, 140, 1, 1564267105, 1565476705, 0, NULL, NULL, 'Bank Deposit', 1563748705, 0, '0'),
(486, 'rem_200', 'Exercitationem saepe sapiente occaecati cumque aspernatur illo et.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 700, 24, 0, 150, 1, 1564094305, 1565390305, 0, NULL, NULL, 'Bank Deposit', 1564785505, 1, '0'),
(487, 'provident_687', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 470, 13, 41, 620, 1, 1563662305, 1564439905, 0, NULL, NULL, 'Cash', 1563575905, 1, '0'),
(488, 'consequatur_800', 'Minus omnis officia aperiam beatae eveniet modi saepe ut rem reprehenderit dolorem.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 440, 0, 0, 870, 0, 1564094305, 1564871905, 0, NULL, NULL, 'Online', 1563489505, 1, '0'),
(489, 'error_372', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 310, 0, 0, 580, 1, 1563921505, 1564526305, 0, NULL, NULL, 'Cash', 1563489505, 0, '0'),
(490, 'sit_956', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 440, 0, 0, 980, 1, 1564007905, 1565563105, 0, NULL, NULL, 'Cash', 1564007905, 0, '0'),
(491, 'modi_671', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 90, 47, 1, 270, 1, 1564353505, 1564612705, 0, NULL, NULL, 'Online', 1565303905, 0, '0'),
(492, 'dolorum_383', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 390, 3, 26, 300, 0, 1563921505, 1564526305, 1, NULL, NULL, 'Cheque', 1565649505, 1, '0'),
(493, 'molestiae_439', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 860, 30, 0, 970, 0, 1563662305, 1564612705, 1, NULL, NULL, 'Cheque', 1564267105, 0, '0'),
(494, 'repellat_854', 'Veniam ut id dolor consequatur beatae non minus rem sed ea laudantium.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 440, 0, 0, 640, 1, 1564007905, 1565131105, 0, NULL, NULL, 'Online', 1564785505, 0, '0'),
(495, 'odit_904', 'Mollitia mollitia in provident nemo non soluta occaecati inventore illo recusandae.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 80, 45, 11, 970, 0, 1564007905, 1565563105, 0, NULL, NULL, 'Online', 1564267105, 0, '0'),
(496, 'voluptatibus_287', 'Ea eum nesciunt non incidunt provident et labore corporis.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 170, 2, 19, 140, 0, 1564439905, 1565131105, 0, NULL, NULL, 'Cheque', 1563662305, 1, '0'),
(497, 'est_254', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 290, 27, 0, 200, 1, 1563748705, 1564439905, 0, NULL, NULL, 'Card', 1564267105, 1, '0'),
(498, 'dignissimos_774', 'Quisquam et ut autem laudantium unde eligendi architecto dicta.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 200, 26, 0, 810, 1, 1564007905, 1564871905, 0, NULL, NULL, 'Bank Deposit', 1565735905, 0, '0'),
(499, 'et_847', 'Voluptatem at est omnis natus cum dignissimos fugiat.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 730, 0, 1, 60, 0, 1564007905, 1565563105, 0, NULL, NULL, 'Cash', 1564612705, 1, '0'),
(500, 'esse_946', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 90, 7, 0, 790, 0, 1563662305, 1564612705, 1, NULL, NULL, 'Cash', 1564094305, 1, '0'),
(501, 'voluptates_694', 'Quis error amet reiciendis qui eius.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 810, 24, 0, 920, 1, 1563835105, 1565131105, 0, NULL, NULL, 'Cash', 1565908705, 0, '0'),
(502, 'rem_311', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 100, 16, 39, 920, 0, 1563921505, 1565131105, 0, NULL, NULL, 'Cash', 1565303905, 1, '0'),
(503, 'aliquid_421', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 680, 0, 0, 1000, 0, 1563662305, 1564526305, 1, NULL, NULL, 'Card', 1565303905, 1, '0'),
(504, 'libero_226', 'Omnis odio eligendi eaque est quasi id accusantium veniam.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 110, 26, 26, 640, 1, 1563748706, 1564958306, 0, NULL, NULL, 'Bank Deposit', 1565822306, 0, '0'),
(505, 'vero_897', 'Veniam recusandae placeat quos aut sed veritatis ex sunt quo.', 68, '[{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 380, 0, 0, 260, 1, 1564267106, 1565390306, 0, NULL, NULL, 'Cheque', 1565822306, 1, '0'),
(506, 'repudiandae_399', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 910, 44, 0, 470, 0, 1564353506, 1564526306, 1, NULL, NULL, 'Bank Deposit', 1563403106, 0, '0'),
(507, 'illum_344', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 510, 0, 0, 940, 0, 1564007906, 1564612706, 1, NULL, NULL, 'Cheque', 1563835106, 0, '0'),
(508, 'sint_298', 'Corrupti eius ipsum ut odit quam nihil aut non eligendi.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 240, 42, 13, 270, 0, 1563835106, 1565131106, 0, NULL, NULL, 'Card', 1564871906, 1, '0'),
(509, 'libero_881', 'Nemo aliquid consequatur architecto dolores vitae.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 910, 33, 0, 250, 0, 1563403106, 1565649506, 0, NULL, NULL, 'Cheque', 1565303906, 1, '0'),
(510, 'at_400', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 790, 0, 0, 320, 0, 1563662306, 1564612706, 1, NULL, NULL, 'Cash', 1564007906, 1, '0'),
(511, 'omnis_108', NULL, 68, '[{\"title\":\"Library fee\",\"amount\":\"500\"}]', 690, 3, 0, 170, 0, 1564267106, 1565649506, 0, NULL, NULL, 'Cheque', 1565044706, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(512, 'ut_893', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 220, 0, 0, 820, 1, 1564267106, 1565131106, 0, NULL, NULL, 'Cash', 1563403106, 0, '0'),
(513, 'rerum_149', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 210, 43, 47, 50, 0, 1563489506, 1564439906, 1, NULL, NULL, 'Cash', 1565908706, 1, '0'),
(514, 'repellendus_293', 'Quia nobis sit minus quasi numquam beatae et consequatur et.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 610, 0, 0, 510, 1, 1564353506, 1564785506, 0, NULL, NULL, 'Card', 1565217506, 1, '0'),
(515, 'et_818', 'Consequatur et nesciunt consequatur qui asperiores placeat numquam.', 68, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 290, 0, 5, 170, 0, 1564353506, 1564439906, 1, NULL, NULL, 'Card', 1563662306, 0, '0'),
(516, 'non_608', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 960, 0, 43, 600, 1, 1563575906, 1564612706, 0, NULL, NULL, 'Online', 1564007906, 0, '0'),
(517, 'voluptates_100', 'Est ratione qui perspiciatis enim molestias et ea ratione accusantium.', 68, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 280, 49, 0, 730, 0, 1563403106, 1565044706, 0, NULL, NULL, 'Cash', 1564353506, 0, '0'),
(518, 'eius_636', NULL, 68, ']', 90, 0, 27, 640, 0, 1563748706, 1564439906, 1, NULL, NULL, 'Card', 1564785506, 0, '0'),
(519, 'aliquid_687', 'Id rem sint consequuntur fugiat qui similique odio omnis non.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"}]', 170, 24, 41, 310, 1, 1563575906, 1564785506, 0, NULL, NULL, 'Cheque', 1564871906, 0, '0'),
(520, 'minima_357', 'Quidem qui et id hic eligendi.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 680, 0, 15, 990, 0, 1564439906, 1565390306, 0, NULL, NULL, 'Cheque', 1563662306, 0, '0'),
(521, 'atque_441', 'Eveniet est optio inventore et similique ducimus autem libero qui.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 350, 44, 19, 270, 1, 1564007906, 1564612706, 0, NULL, NULL, 'Card', 1564871906, 0, '0'),
(522, 'veniam_223', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 500, 0, 4, 900, 1, 1563575906, 1564871906, 0, NULL, NULL, 'Cheque', 1565390306, 0, '0'),
(523, 'velit_467', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 200, 40, 7, 260, 0, 1564094307, 1564526307, 1, NULL, NULL, 'Online', 1564353507, 1, '0'),
(524, 'id_180', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 250, 0, 15, 610, 0, 1564094307, 1565563107, 0, NULL, NULL, 'Online', 1565476707, 0, '0'),
(525, 'autem_700', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 580, 18, 10, 250, 1, 1564439907, 1564439907, 0, NULL, NULL, 'Bank Deposit', 1564353507, 1, '0'),
(526, 'rerum_110', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 110, 21, 46, 100, 1, 1564094307, 1564612707, 0, NULL, NULL, 'Cash', 1564526307, 0, '0'),
(527, 'vitae_558', 'Dolore ab beatae sequi perferendis nisi.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 300, 0, 23, 260, 1, 1564439907, 1565044707, 0, NULL, NULL, 'Card', 1565563107, 1, '0'),
(528, 'quia_939', 'Dolores qui animi vitae occaecati consequatur quos et delectus suscipit assumenda.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 440, 0, 0, 360, 1, 1564007907, 1565303907, 0, NULL, NULL, 'Online', 1565735907, 1, '0'),
(529, 'aperiam_212', 'Delectus necessitatibus optio voluptatem porro soluta hic autem qui.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 750, 0, 50, 100, 1, 1563662307, 1565217507, 0, NULL, NULL, 'Cash', 1564353507, 1, '0'),
(530, 'ex_517', 'Ut nemo necessitatibus eius qui reprehenderit consequuntur.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 480, 48, 0, 900, 0, 1563575907, 1565390307, 0, NULL, NULL, 'Bank Deposit', 1565995107, 0, '0'),
(531, 'rem_926', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 520, 0, 0, 150, 1, 1564007907, 1564526307, 0, NULL, NULL, 'Card', 1565563107, 1, '0'),
(532, 'doloremque_658', 'Ad sed ad quae dolore sint similique quibusdam ratione quia.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 490, 0, 0, 480, 0, 1564439907, 1564526307, 1, NULL, NULL, 'Cheque', 1565563107, 1, '0'),
(533, 'sed_103', NULL, 68, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 810, 44, 17, 380, 1, 1563748707, 1564526307, 0, NULL, NULL, 'Cheque', 1565649507, 0, '0'),
(534, 'ab_599', NULL, 68, '[{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 510, 0, 0, 750, 0, 1563921507, 1565563107, 0, NULL, NULL, 'Bank Deposit', 1564871907, 1, '0'),
(535, 'id_335', NULL, 68, '[{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 480, 44, 0, 230, 1, 1564094307, 1564612707, 0, NULL, NULL, 'Card', 1563835107, 0, '0'),
(536, 'corrupti_555', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 500, 0, 0, 830, 1, 1564180707, 1565563107, 0, NULL, NULL, 'Cheque', 1565217507, 0, '0'),
(537, 'dolor_897', NULL, 68, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 200, 23, 11, 400, 1, 1564094307, 1564526307, 0, NULL, NULL, 'Card', 1564526307, 1, '0'),
(538, 'et_983', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 70, 0, 0, 420, 0, 1564180707, 1565217507, 0, NULL, NULL, 'Card', 1565735907, 1, '0'),
(539, 'deserunt_939', 'Quidem dolor voluptas ut voluptatem eligendi.', 68, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 440, 0, 0, 510, 0, 1564439907, 1565044707, 0, NULL, NULL, 'Online', 1564958307, 0, '0'),
(540, 'aliquid_448', 'Et nobis nostrum ut voluptas et recusandae quo dolorum molestiae hic eligendi.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"}]', 550, 6, 10, 250, 0, 1564439907, 1564526307, 1, NULL, NULL, 'Card', 1563835107, 1, '0'),
(541, 'in_478', NULL, 68, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 500, 0, 0, 490, 0, 1564007907, 1564439907, 1, NULL, NULL, 'Online', 1563489507, 1, '0'),
(542, 'est_577', 'Est enim placeat officia eaque enim et laboriosam perferendis facere hic magnam.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 760, 24, 0, 480, 1, 1564007907, 1564526307, 0, NULL, NULL, 'Card', 1564526307, 1, '0'),
(543, 'delectus_340', 'Est non ducimus aut veniam distinctio.', 68, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 720, 0, 0, 50, 1, 1564353507, 1565563107, 0, NULL, NULL, 'Cheque', 1564526307, 0, '0'),
(544, 'eaque_290', 'Praesentium incidunt incidunt quis quam voluptate alias dolorem aut enim eum.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 770, 35, 43, 320, 1, 1564439907, 1564612707, 0, NULL, NULL, 'Cash', 1565044707, 0, '0'),
(545, 'non_669', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 210, 0, 0, 190, 1, 1564353507, 1565649507, 0, NULL, NULL, 'Cheque', 1565649507, 0, '0'),
(546, 'voluptatum_606', 'Ea sed officiis ea mollitia doloribus ea.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 170, 49, 15, 840, 0, 1563662307, 1564526307, 1, NULL, NULL, 'Card', 1565217507, 1, '0'),
(547, 'molestiae_121', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 80, 0, 10, 970, 0, 1563662307, 1564439907, 1, NULL, NULL, 'Bank Deposit', 1563921507, 1, '0'),
(548, 'qui_388', 'Et debitis non quasi asperiores sit.', 68, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 510, 38, 31, 810, 1, 1564180707, 1565822307, 0, NULL, NULL, 'Cheque', 1565649507, 0, '0'),
(549, 'voluptates_645', NULL, 68, '[{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 510, 12, 23, 440, 0, 1564007907, 1564612707, 1, NULL, NULL, 'Bank Deposit', 1563921507, 1, '0'),
(550, 'sapiente_131', NULL, 68, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 630, 0, 20, 570, 0, 1564007907, 1564526307, 1, NULL, NULL, 'Card', 1563921507, 0, '0');

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
(1, 'Voluptate molestiae nulla.', '69404', 'zwisozk@goldner.com', 'commodi', 'libero', '1564699108', 'repellendus', '22 minutes', 'Dolores vitae repudiandae et et quidem.'),
(2, 'Odio id quae.', '71481', 'wiegand.deion@shields.com', 'aut', 'repudiandae', '1564699108', 'delectus', '16 minutes', 'Quia qui exercitationem veniam dolorem qui enim at dolorum.'),
(3, 'Quasi accusamus placeat eum nihil nam.', '10712', 'denesik.randal@bruen.com', 'consequatur', 'qui', '1564699108', 'et', '20 minutes', 'Autem reprehenderit qui magnam distinctio sed fugit.'),
(4, 'Veniam aut eos esse.', '68365', 'kenneth.cormier@yahoo.com', 'et', 'hic', '1564699108', 'nulla', '17 minutes', 'Magni aut id et modi rerum.'),
(5, 'Laborum officia voluptatem numquam sunt rerum.', '31547', 'rlegros@hotmail.com', 'in', 'eligendi', '1564699108', 'optio', '27 minutes', 'Deserunt alias id quos veniam consequatur nesciunt.'),
(6, 'Aperiam molestiae.', '20135', 'yost.harold@luettgen.com', 'id', 'consequuntur', '1564699108', 'sunt', '10 minutes', 'Sed et id debitis vel deserunt.'),
(7, 'Laborum et.', '65629', 'uanderson@yahoo.com', 'dolor', 'id', '1564699108', 'iusto', '15 minutes', 'Vel sapiente assumenda non quam qui porro eum accusamus omnis voluptate voluptatem.'),
(8, 'Ab fugiat.', '94696', 'allen44@labadie.biz', 'labore', 'aut', '1564699108', 'qui', '19 minutes', 'Inventore laudantium qui voluptate qui at.'),
(9, 'Nihil dolor vero.', '76036', 'hirthe.alysson@halvorson.biz', 'sunt', 'sed', '1564699108', 'qui', '18 minutes', 'Labore saepe sunt tenetur dolore ut.'),
(10, 'Et quae aut fuga expedita.', '55948', 'arturo01@yahoo.com', 'molestiae', 'eum', '1564699108', 'in', '2 minutes', 'Vel debitis ut quam maiores voluptates eveniet.'),
(11, 'Est at.', '71102', 'estefania84@baumbach.com', 'suscipit', 'enim', '1564699108', 'qui', '4 minutes', 'Sit commodi repudiandae dolorum quia natus.'),
(12, 'Saepe ipsum suscipit.', '45128', 'sauer.jules@bruen.biz', 'et', 'quidem', '1564699108', 'sint', '29 minutes', 'Doloremque necessitatibus exercitationem et quia odio debitis id mollitia.'),
(13, 'Totam suscipit odio.', '14672', 'kerluke.giles@hotmail.com', 'eaque', 'facilis', '1564699108', 'earum', '14 minutes', 'Dolore laboriosam omnis architecto perspiciatis id velit minima ipsa.'),
(14, 'Ex sint alias.', '73268', 'ksporer@pouros.info', 'eos', 'accusamus', '1564699108', 'ullam', '20 minutes', 'Velit ullam a harum animi laborum non.'),
(15, 'Sed deleniti.', '39150', 'ron.hodkiewicz@gmail.com', 'vel', 'facere', '1564699108', 'ab', '16 minutes', 'Totam ut optio suscipit fugiat pariatur nostrum eligendi ad quia.'),
(16, 'Est assumenda eum dolore nostrum.', '62715', 'greta21@yahoo.com', 'qui', 'voluptatem', '1564699108', 'consequuntur', '27 minutes', 'Incidunt aperiam repellat et dolore et laudantium explicabo corporis corrupti porro ratione veritatis.'),
(17, 'Occaecati in architecto veritatis.', '89755', 'dianna.dubuque@gmail.com', 'odio', 'illo', '1564699108', 'quas', '9 minutes', 'Quas quia est nemo consequatur.'),
(18, 'Ut est quo incidunt.', '60070', 'roman.schroeder@erdman.com', 'cumque', 'at', '1564699108', 'labore', '19 minutes', 'Harum dolorem recusandae neque id iure.'),
(19, 'Temporibus qui.', '19026', 'mariah.sawayn@gmail.com', 'iure', 'inventore', '1564699108', 'quas', '8 minutes', 'Sint beatae et quisquam voluptas iste repudiandae assumenda.'),
(20, 'At dolores consequatur culpa qui.', '58626', 'anderson.carrie@langosh.org', 'modi', 'omnis', '1564699108', 'magni', '9 minutes', 'Est unde optio aut praesentium iste voluptas nemo et debitis dolor sequi.'),
(21, 'Et quo illo fugit.', '75209', 'vena68@hotmail.com', 'et', 'maiores', '1564699108', 'aut', '24 minutes', 'In vero incidunt est nam in nihil aut.'),
(22, 'Placeat eligendi excepturi doloremque.', '36140', 'ora01@mueller.org', 'magni', 'quod', '1564699108', 'eum', '1 minutes', 'Libero animi nostrum beatae tempora perferendis dolore assumenda.'),
(23, 'Quasi placeat deserunt.', '41333', 'kkassulke@douglas.com', 'et', 'rerum', '1564699108', 'odio', '2 minutes', 'Et nemo aut dolores voluptatem asperiores.'),
(24, 'Rerum excepturi qui doloremque.', '65132', 'enola09@yahoo.com', 'aliquid', 'quae', '1564699108', 'eos', '5 minutes', 'Deleniti voluptas possimus necessitatibus sit repellendus et fuga.'),
(25, 'In magni et.', '95263', 'jarvis.russel@terry.com', 'quae', 'consequuntur', '1564699108', 'aperiam', '10 minutes', 'Sapiente ut ipsum quisquam dolorum rerum rerum corporis delectus.'),
(26, 'Necessitatibus repellendus minus aut est.', '15247', 'marquardt.maude@jerde.com', 'numquam', 'sapiente', '1564699108', 'odio', '26 minutes', 'Dolorum officiis voluptatem aut consequatur.'),
(27, 'Ut et libero.', '26417', 'ward.camren@koelpin.com', 'temporibus', 'voluptates', '1564699108', 'sint', '17 minutes', 'Consequatur quam perferendis perspiciatis quos sed odit exercitationem ipsum quisquam sed qui animi.'),
(28, 'Minus quia non.', '79041', 'melba46@gmail.com', 'et', 'quis', '1564699108', 'voluptatum', '26 minutes', 'Eligendi et explicabo earum voluptatum fugiat illo repudiandae autem doloribus quaerat temporibus.'),
(29, 'Ut repellat consequuntur.', '63543', 'leola53@johns.info', 'odit', 'et', '1564699108', 'rem', '13 minutes', 'Quia impedit aliquam libero veniam eum.'),
(30, 'In alias ab.', '70212', 'gail89@gmail.com', 'minus', 'explicabo', '1564699108', 'quaerat', '14 minutes', 'Dignissimos qui ut laborum expedita nam delectus assumenda sit corporis.'),
(31, 'Culpa quia.', '57863', 'larkin.tre@schmeler.info', 'enim', 'mollitia', '1564699108', 'in', '10 minutes', 'Est hic hic excepturi mollitia eligendi ut ab necessitatibus.'),
(32, 'Inventore ut.', '39299', 'oemard@feest.org', 'omnis', 'ipsa', '1564699108', 'qui', '5 minutes', 'Quo animi non officiis dolorem.'),
(33, 'Et quia dolorum.', '66964', 'vance04@yahoo.com', 'ut', 'sunt', '1564699108', 'iure', '18 minutes', 'Nostrum ut veniam facilis nihil inventore delectus.'),
(34, 'Quia similique et rerum maiores.', '37125', 'ybailey@hotmail.com', 'sequi', 'voluptas', '1564699108', 'ratione', '21 minutes', 'Qui voluptatem iste optio non vitae delectus repudiandae nisi.'),
(35, 'Architecto accusantium assumenda.', '43157', 'benton.block@yahoo.com', 'pariatur', 'dolor', '1564699108', 'sit', '27 minutes', 'Cum omnis est molestiae cupiditate velit possimus doloremque molestias tenetur doloribus.'),
(36, 'Nihil consequatur accusantium.', '22049', 'marielle.bauch@bosco.com', 'qui', 'et', '1564699108', 'et', '22 minutes', 'Enim qui maiores sunt architecto placeat consequatur.'),
(37, 'Iure rerum veniam voluptatum assumenda.', '43262', 'janick58@yahoo.com', 'reprehenderit', 'et', '1564699108', 'rerum', '6 minutes', 'Dolor hic neque voluptatem qui repudiandae voluptatibus consequatur illum.'),
(38, 'Ea tempora.', '87589', 'myrtie.zulauf@gmail.com', 'ipsam', 'facilis', '1564699108', 'et', '20 minutes', 'Qui voluptatem voluptas vero et ut eveniet.'),
(39, 'Sed ratione placeat.', '85499', 'beatty.kade@dare.biz', 'architecto', 'est', '1564699108', 'quia', '30 minutes', 'Architecto aut impedit quisquam id consequuntur nihil.'),
(40, 'Sit aliquid.', '63800', 'crutherford@yahoo.com', 'dolorem', 'officia', '1564699108', 'voluptatum', '11 minutes', 'Eligendi ipsum ut et adipisci aliquid aut ad quo libero et occaecati.'),
(41, 'Rerum quis maiores quod.', '67006', 'zjohnson@hotmail.com', 'vitae', 'velit', '1564699108', 'quibusdam', '2 minutes', 'Corporis in sunt consequatur dicta odit architecto expedita asperiores.'),
(42, 'Repellat ad porro vitae delectus.', '93970', 'alayna83@gulgowski.com', 'laboriosam', 'voluptas', '1564699108', 'voluptatem', '16 minutes', 'Similique et inventore culpa dolor non nihil tempore placeat quam.'),
(43, 'Sit repellendus dolor.', '67052', 'mstehr@yahoo.com', 'possimus', 'nesciunt', '1564699108', 'eos', '10 minutes', 'Architecto alias quidem voluptas eaque ea totam quod.'),
(44, 'Doloribus maxime cum.', '91996', 'welch.mariano@schinner.com', 'amet', 'sunt', '1564699108', 'eos', '15 minutes', 'Fuga quaerat cumque omnis rerum ducimus in recusandae rerum.'),
(45, 'Asperiores exercitationem qui sunt.', '96042', 'owest@yahoo.com', 'molestias', 'rerum', '1564699108', 'eum', '3 minutes', 'Et et sint similique nostrum ducimus enim veniam.'),
(46, 'Itaque amet in.', '10271', 'jodie81@hotmail.com', 'iure', 'aut', '1564699108', 'vitae', '23 minutes', 'Quisquam magni nesciunt nobis laboriosam est.'),
(47, 'Quia rerum et quidem.', '39831', 'harvey.owen@hotmail.com', 'odio', 'beatae', '1564699108', 'praesentium', '22 minutes', 'Officiis natus nostrum velit magni ut voluptatum.'),
(48, 'Facere est.', '46649', 'kjacobson@pfeffer.info', 'molestiae', 'atque', '1564699108', 'nobis', '12 minutes', 'Cupiditate voluptatem deleniti reiciendis dolorem velit non qui.'),
(49, 'Tempore itaque soluta quia.', '25484', 'domenico.hammes@fay.com', 'officia', 'praesentium', '1564699108', 'molestias', '6 minutes', 'Qui impedit doloremque id hic nobis inventore inventore.'),
(50, 'Aut facere blanditiis est eaque numquam.', '93014', 'tillman64@hessel.com', 'repudiandae', 'doloremque', '1564699108', 'a', '30 minutes', 'Pariatur aut et perspiciatis harum aliquam qui ad fuga est saepe.');

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
(1, 'nesciunt', '40166', 'Id dolorem et.', 'Qui.', 'Fugiat dolorem minus.', '1564699108', '', 'Veritatis itaque ut laboriosam.'),
(2, 'dignissimos', '97325', 'Odit perspiciatis iusto.', 'Repellat ut.', 'Voluptas dolore.', '1564699108', '', 'Minima amet sed sit natus aliquam.'),
(3, 'aliquam', '78853', 'Quis culpa.', 'At ea.', 'Temporibus est atque et consequatur omnis temporibus.', '1564699108', '', 'Blanditiis veniam distinctio quae voluptas est aut.'),
(4, 'quod', '34563', 'Distinctio quia.', 'Nostrum.', 'Veniam quia ut.', '1564699108', '', 'Temporibus quasi quisquam.'),
(5, 'sint', '21840', 'Alias sint.', 'Voluptas similique.', 'Laborum sit in rerum.', '1564699108', '', 'Delectus aliquam porro dolorem ut.'),
(6, 'placeat', '73069', 'Sed magnam.', 'Sed ut.', 'Atque doloribus pariatur eligendi ullam dolorem velit.', '1564699108', '', 'Facilis et non.'),
(7, 'quisquam', '53879', 'Maxime ab.', 'Est saepe.', 'Asperiores ut dicta.', '1564699108', '', 'Rem necessitatibus debitis est exercitationem repellat.'),
(8, 'necessitatibus', '37021', 'Odio et.', 'Hic corrupti.', 'Ut quisquam dolores et officia.', '1564699108', '', 'In et id.'),
(9, 'commodi', '56427', 'Voluptate quis.', 'Illum unde.', 'Repellendus voluptatem velit itaque aliquam.', '1564699108', '', 'Id sit et est illum.'),
(10, 'rem', '58178', 'Dolor dolorem.', 'Nam dolor.', 'Sit aperiam suscipit.', '1564699108', '', 'Sunt eos in nobis.'),
(11, 'sit', '86457', 'Qui facilis.', 'Fuga et.', 'Ipsum quis dolores dolore eaque omnis delectus.', '1564699108', '', 'Nam dolorem ipsum aliquid enim nihil.'),
(12, 'iste', '29967', 'Vitae.', 'Et vitae.', 'Voluptatem molestiae tenetur voluptatem ratione.', '1564699108', '', 'Non eaque sunt error.'),
(13, 'qui', '88471', 'Ex sequi.', 'Asperiores accusamus.', 'Mollitia a quasi est neque quis.', '1564699108', '', 'Placeat dignissimos qui eligendi facere.'),
(14, 'illum', '96158', 'Inventore aut.', 'Fuga asperiores.', 'Similique rerum rem impedit.', '1564699108', '', 'Et aspernatur quaerat non consectetur.'),
(15, 'aliquam', '16219', 'Necessitatibus.', 'Et voluptatum.', 'Omnis possimus dolorem.', '1564699108', '', 'Unde laboriosam porro exercitationem.'),
(16, 'numquam', '95155', 'Voluptatibus.', 'Excepturi.', 'Distinctio et labore exercitationem quaerat qui itaque.', '1564699108', '', 'Minima quis culpa omnis repellat unde ad.'),
(17, 'qui', '38376', 'Vel aliquid.', 'Necessitatibus quisquam.', 'Ex esse maxime tenetur.', '1564699108', '', 'Est illo nemo amet.'),
(18, 'sequi', '26823', 'Repellendus eos.', 'Recusandae ut.', 'Dolore in aut.', '1564699108', '', 'Ipsam libero veritatis nam possimus aut fugit.'),
(19, 'autem', '30749', 'Animi et.', 'Dolor cumque harum.', 'Sit est molestiae dolorem iste corporis aspernatur.', '1564699108', '', 'Sit reiciendis nihil similique.'),
(20, 'numquam', '39870', 'Sunt.', 'Tenetur.', 'Possimus deleniti aliquam cumque est saepe nesciunt.', '1564699108', '', 'Enim eaque impedit atque ut quidem et.'),
(21, 'vitae', '91259', 'Soluta.', 'Quidem odit.', 'Quos explicabo nihil aliquid.', '1564699108', '', 'Qui dolores eos ex.'),
(22, 'temporibus', '11649', 'Unde dolorum.', 'Nihil quasi.', 'Aut ipsam accusamus.', '1564699108', '', 'Voluptas vel tempore et non.'),
(23, 'sit', '58019', 'Eum.', 'Quod unde.', 'Quam sint vero commodi.', '1564699108', '', 'Eius distinctio consequatur asperiores molestiae.'),
(24, 'perferendis', '91432', 'Praesentium et.', 'Sed voluptatem.', 'Eveniet aliquid ipsum sapiente.', '1564699108', '', 'In hic quae architecto minima.'),
(25, 'itaque', '42700', 'Facere.', 'Facere.', 'Aut officia beatae.', '1564699108', '', 'Ex sequi assumenda voluptatum culpa.'),
(26, 'molestias', '27334', 'Est fugit.', 'Omnis.', 'Ut labore illo deleniti pariatur.', '1564699108', '', 'Et quae inventore dolores commodi.'),
(27, 'totam', '21164', 'Eveniet est possimus.', 'Rerum nam.', 'Expedita expedita aut ipsa quisquam.', '1564699108', '', 'Saepe fugit repellat.'),
(28, 'distinctio', '66074', 'Sint.', 'Suscipit et.', 'Dolore minus voluptatem voluptatem sint.', '1564699108', '', 'Vel suscipit voluptatem consequatur.'),
(29, 'est', '91036', 'Minima totam.', 'Eaque eligendi.', 'Et facere at ducimus id.', '1564699108', '', 'Et non et eius voluptates voluptatum.'),
(30, 'quam', '92116', 'Corrupti vero.', 'Consectetur temporibus provident.', 'Quia cum suscipit ea.', '1564699108', '', 'Perferendis sit repudiandae accusamus.'),
(31, 'rerum', '95493', 'Vel.', 'Rerum.', 'Quidem ad consequatur similique accusantium voluptas.', '1564699108', '', 'Esse ea quo dicta distinctio harum vel.'),
(32, 'nemo', '94132', 'Odio.', 'Fugit enim voluptatem.', 'Possimus mollitia sit rerum vel.', '1564699108', '', 'Amet corrupti ipsa quia odit.'),
(33, 'eos', '49894', 'Quia repellendus.', 'Ea ex vel.', 'Qui suscipit est qui.', '1564699108', '', 'Temporibus sequi ipsam.'),
(34, 'qui', '29231', 'Aut vel.', 'Qui.', 'Excepturi provident architecto illo voluptas.', '1564699108', '', 'Et eaque qui quos neque expedita.'),
(35, 'illo', '45697', 'Quae.', 'Magni enim.', 'Facilis temporibus quo.', '1564699108', '', 'Sapiente nulla perspiciatis ut.'),
(36, 'ex', '20099', 'Voluptatem fugiat.', 'Incidunt.', 'Ducimus eligendi qui asperiores modi aut qui sit.', '1564699108', '', 'Est sed illo et.'),
(37, 'aliquid', '57722', 'Ut pariatur.', 'Qui.', 'Minus libero accusamus sint ipsa.', '1564699108', '', 'Iusto quaerat iure quos sed.'),
(38, 'repellendus', '38347', 'Cum et.', 'Facere nam.', 'Autem optio ratione et ut qui ducimus.', '1564699108', '', 'Et aut dolores fuga ut.'),
(39, 'vel', '13159', 'Sint quisquam et.', 'Accusantium voluptas consequatur.', 'Iure qui minima voluptatum.', '1564699108', '', 'Ut qui ab soluta fugit.'),
(40, 'facilis', '48417', 'Temporibus quis.', 'Optio autem.', 'Reprehenderit magni doloremque distinctio.', '1564699108', '', 'Corrupti velit ut.'),
(41, 'corporis', '73719', 'Quos atque ea.', 'Eos harum.', 'Sed consequatur totam blanditiis.', '1564699108', '', 'Ut dolor et quia.'),
(42, 'ea', '85076', 'Assumenda.', 'Iure aut.', 'Omnis mollitia aut nostrum cupiditate iste.', '1564699108', '', 'Quasi aspernatur.'),
(43, 'optio', '36919', 'Libero laboriosam non.', 'Sed reiciendis.', 'Itaque excepturi consequuntur et natus.', '1564699108', '', 'Beatae numquam.'),
(44, 'consequuntur', '28928', 'Maxime totam.', 'Quae.', 'Molestiae rerum maxime et aut at.', '1564699108', '', 'Nihil architecto laborum illo doloribus eos.'),
(45, 'distinctio', '46983', 'Sint.', 'Reprehenderit consectetur at.', 'Illo quae deleniti quas sunt ipsam.', '1564699108', '', 'Corporis provident aut excepturi.'),
(46, 'sed', '60580', 'Quidem odit.', 'Nam voluptas.', 'Nisi non ratione ea rem sunt ducimus.', '1564699108', '', 'Ipsam et minima.'),
(47, 'voluptatibus', '47403', 'Enim saepe eum.', 'Eius similique.', 'Sed facere quo possimus.', '1564699108', '', 'Consequatur recusandae nobis pariatur.'),
(48, 'officia', '67221', 'Magni.', 'Perferendis.', 'Tempore dolorum quae et eos dolores velit quas.', '1564699108', '', 'Est possimus quia iusto magni dicta autem.'),
(49, 'ipsum', '66719', 'Aperiam.', 'Ut magni.', 'Aspernatur sed et incidunt non.', '1564699108', '', 'Non asperiores maiores.'),
(50, 'voluptas', '52641', 'Deleniti exercitationem.', 'Omnis inventore et.', 'Modi est corporis nisi.', '1564699108', '', 'Id eius in libero quasi.');

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
  `id` int(11) NOT NULL,
  `sectionName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `classId` int(11) NOT NULL,
  `classTeacherId` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `sectionName`, `classId`, `classTeacherId`) VALUES
(1, 'dolorum Sec', 8, '[\"42\",\"36\",\"41\"]'),
(2, 'eius Sec', 4, '[\"43\",\"42\",\"30\",\"36\",\"41\",\"24\",\"28\"]'),
(3, 'consequatur Sec', 6, '[\"32\",\"40\",\"44\",\"24\",\"25\",\"38\",\"42\"]'),
(4, 'esse Sec', 4, '[\"33\",\"35\",\"24\",\"37\",\"29\"]'),
(5, 'soluta Sec', 3, '[\"26\",\"43\",\"36\",\"34\",\"29\",\"35\",\"44\"]'),
(6, 'facere Sec', 1, '[\"27\",\"44\",\"26\",\"34\",\"30\",\"37\"]'),
(7, 'exercitationem Sec', 3, '[\"30\",\"35\",\"41\",\"38\",\"29\",\"36\",\"31\"]'),
(8, 'tenetur Sec', 1, '[\"32\",\"31\",\"27\",\"41\",\"26\",\"30\"]'),
(9, 'quis Sec', 3, '[\"41\",\"33\",\"35\",\"38\",\"30\",\"25\",\"26\"]'),
(10, 'qui Sec', 7, '[\"33\",\"24\",\"27\",\"30\",\"31\"]'),
(11, 'aut Sec', 6, '[\"42\",\"43\",\"32\",\"27\",\"30\"]'),
(12, 'natus Sec', 2, '[\"43\",\"42\",\"44\",\"26\",\"31\"]'),
(13, 'quas Sec', 4, '[\"34\",\"31\",\"42\",\"37\",\"28\",\"41\",\"25\"]'),
(14, 'iure Sec', 2, '[\"27\",\"38\",\"25\",\"30\",\"33\",\"36\",\"39\",\"24\"]'),
(15, 'architecto Sec', 1, '[\"39\",\"38\",\"26\",\"32\"]'),
(16, 'sint Sec', 7, '[\"29\",\"27\",\"31\"]'),
(17, 'et Sec', 2, '[\"36\",\"31\",\"26\",\"42\",\"38\"]'),
(18, 'accusamus Sec', 7, '[\"33\",\"42\",\"31\"]'),
(19, 'doloremque Sec', 2, '[\"25\",\"31\",\"42\",\"26\",\"44\",\"36\",\"32\",\"27\"]'),
(20, 'vel Sec', 8, '[\"30\",\"42\"]'),
(21, 'soluta Sec', 7, '[\"31\",\"30\",\"38\"]'),
(22, 'non Sec', 7, '[\"30\",\"29\",\"27\",\"42\",\"31\"]'),
(23, 'nemo Sec', 4, '[\"25\",\"43\",\"29\",\"37\",\"41\"]'),
(24, 'aut Sec', 6, '[\"28\",\"30\",\"24\",\"33\",\"25\",\"42\",\"40\"]'),
(25, 'alias Sec', 7, '[\"31\",\"36\",\"33\",\"30\",\"27\"]'),
(26, 'aut Sec', 3, '[\"41\",\"31\",\"35\",\"29\",\"38\",\"44\",\"36\"]'),
(27, 'molestiae Sec', 6, '[\"38\",\"28\",\"27\",\"44\",\"42\",\"35\",\"25\"]'),
(28, 'libero Sec', 4, '[\"31\",\"28\",\"41\",\"43\",\"25\",\"34\",\"36\"]'),
(29, 'veritatis Sec', 3, '[\"31\",\"26\",\"27\",\"35\",\"29\"]'),
(30, 'a Sec', 3, '[\"33\",\"36\",\"35\",\"29\",\"34\",\"44\",\"43\"]'),
(31, 'dolorem Sec', 6, '[\"35\",\"32\",\"25\",\"38\",\"28\",\"44\",\"42\"]'),
(32, 'ab Sec', 4, '[\"35\",\"30\",\"34\",\"29\",\"33\"]'),
(33, 'voluptatem Sec', 7, '[\"42\",\"27\",\"24\",\"36\",\"33\"]'),
(34, 'velit Sec', 5, '[\"43\",\"39\",\"36\",\"24\",\"41\"]'),
(35, 'non Sec', 3, '[\"25\",\"35\",\"26\",\"44\",\"41\"]'),
(36, 'expedita Sec', 2, '[\"25\",\"33\",\"31\",\"44\",\"36\",\"30\",\"26\",\"38\"]'),
(37, 'vitae Sec', 1, '[\"37\",\"30\",\"35\",\"34\"]'),
(38, 'magni Sec', 3, '[\"36\",\"29\",\"34\",\"30\",\"25\"]'),
(39, 'dolor Sec', 8, '[\"36\",\"30\",\"41\"]'),
(40, 'doloribus Sec', 7, '[\"24\",\"27\",\"36\"]'),
(41, 'aut Sec', 1, '[\"38\",\"31\",\"39\",\"35\"]'),
(42, 'cumque Sec', 6, '[\"38\",\"44\",\"35\",\"30\",\"33\",\"42\",\"40\"]'),
(43, 'at Sec', 2, '[\"26\",\"27\",\"42\",\"25\",\"39\",\"43\",\"30\",\"36\"]'),
(44, 'asperiores Sec', 1, '[\"39\",\"32\",\"44\",\"41\",\"35\",\"30\"]'),
(45, 'rem Sec', 8, '[\"40\",\"41\"]'),
(46, 'dicta Sec', 2, '[\"30\",\"43\",\"32\",\"34\",\"44\"]'),
(47, 'saepe Sec', 1, '[\"27\",\"39\",\"32\",\"41\",\"35\",\"38\"]'),
(48, 'nemo Sec', 5, '[\"41\",\"32\",\"43\",\"37\",\"36\"]'),
(49, 'beatae Sec', 1, '[\"26\",\"32\",\"31\",\"27\",\"34\",\"38\"]'),
(50, 'et Sec', 6, '[\"35\",\"38\",\"28\",\"33\",\"42\",\"32\",\"24\"]'),
(51, 'maxime Sec', 7, '[\"24\",\"29\",\"30\",\"27\",\"42\"]'),
(52, 'optio Sec', 6, '[\"35\",\"42\",\"27\",\"38\",\"32\",\"40\",\"24\"]'),
(53, 'sunt Sec', 6, '[\"44\",\"32\",\"30\",\"38\",\"27\",\"24\",\"42\"]'),
(54, 'ipsum Sec', 3, '[\"38\",\"26\",\"33\",\"41\",\"27\",\"25\",\"29\"]'),
(55, 'corrupti Sec', 6, '[\"25\",\"42\",\"40\",\"44\",\"30\"]'),
(56, 'id Sec', 1, '[\"35\",\"41\",\"32\",\"37\",\"26\",\"38\"]'),
(57, 'ea Sec', 5, '[\"32\",\"40\",\"37\",\"39\",\"43\"]'),
(58, 'quae Sec', 5, '[\"39\",\"36\",\"27\",\"43\",\"32\"]'),
(59, 'ut Sec', 8, '[\"42\",\"41\"]'),
(60, 'earum Sec', 3, '[\"33\",\"38\",\"27\",\"43\",\"31\"]');

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
(1, 'Home', 'Molestiae tenetur id sit at tempore officiis deleniti tempore at sed laborum ut aliquam et quos sapiente et harum.', 1),
(2, 'About us', 'Sint aliquam repellendus ab dolores doloribus laborum eum sed voluptatum qui inventore.', 1),
(3, 'CMS', 'Quae et eos iusto excepturi velit ea soluta dolore quidem quo ab.', 1),
(4, 'Sections', 'Quia cupiditate totam magni atque et possimus harum eius at doloremque rem enim et ullam qui voluptate.', 1),
(5, 'Subjects', 'Tempore aut nostrum tempore dolor cum ipsam et sunt ut officia quas.', 1);

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
(1, 'Odit.', 'Ullam repellendus quasi dolor voluptatum harum recusandae vel ipsa facilis et nostrum quia quas quas.'),
(2, 'Fugit.', ''),
(3, 'Natus.', 'Minus ad aliquam laborum aliquid laudantium officiis sed consequuntur maiores est veniam voluptatibus repudiandae consequatur.'),
(4, 'Ab.', 'Dolore aut eum neque facere unde deserunt odit velit porro qui aut earum quia cupiditate qui voluptatum animi et necessitatibus veniam ipsam perspiciatis eligendi reiciendis.'),
(5, 'Maxime qui.', 'Culpa et voluptas laudantium est voluptatem possimus ratione harum illo excepturi consequatur fugiat.'),
(6, 'Voluptatem.', 'Corrupti asperiores quod vel officia repellendus ipsa necessitatibus doloribus.'),
(7, 'Provident.', 'In reprehenderit placeat porro odio eum labore consectetur sunt non autem doloribus.'),
(8, 'Quae voluptatum.', '');

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
(1, 'Repellat.', '', '', '[\"1\"]', '[\"44\",\"14\"]', 10, 32),
(2, 'Iste autem.', '', '', '[\"4\",\"3\",\"1\"]', '[\"5\",\"46\",\"36\"]', 7, 28),
(3, 'Consectetur voluptatem.', '', '', '[\"6\"]', '[\"38\",\"37\"]', 2, 29),
(4, 'Ipsam.', '', '', '[\"7\",\"6\"]', '[\"46\",\"58\"]', 7, 43),
(5, 'Et unde nam.', '', '', '[\"3\",\"7\",\"5\"]', '[\"52\",\"26\",\"60\"]', 2, 37),
(6, 'Consequuntur.', '', '', '[\"6\"]', '[\"7\",\"46\",\"19\"]', 7, 32),
(7, 'Totam minima eius.', '', '', '[\"5\",\"7\",\"3\"]', '[\"18\",\"28\"]', 1, 30),
(8, 'Saepe est.', '', '', '[\"8\",\"5\",\"4\"]', '[\"9\"]', 6, 43),
(9, 'Quia consequuntur natus.', '', '', '[\"2\",\"1\",\"7\"]', '[\"28\",\"30\",\"40\"]', 4, 27),
(10, 'Qui possimus.', '', '', '[\"8\"]', '[\"4\"]', 8, 33),
(11, 'Molestias recusandae.', '', '', '[\"7\",\"1\"]', '[\"48\",\"50\",\"29\"]', 8, 31),
(12, 'Id.', '', '', '[\"7\",\"1\"]', '[\"58\",\"38\"]', 9, 44),
(13, 'Est eaque.', '', '', '[\"6\",\"1\"]', '[\"30\"]', 6, 42),
(14, 'Nobis ullam.', '', '', '[\"1\",\"6\"]', '[\"3\",\"38\",\"49\"]', 10, 25),
(15, 'Laudantium quia facere.', '', '', '[\"6\",\"1\"]', '[\"46\"]', 8, 35);

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
(1, 'Reiciendis excepturi iste.', '30', '80', '[\"43\",\"35\",\"40\",\"28\",\"39\",\"30\",\"26\",\"25\"]'),
(2, 'Facere quo nihil.', '20', '70', '[\"38\",\"26\",\"41\",\"33\",\"40\",\"27\",\"36\",\"35\",\"39\",\"32\",\"43\",\"28\",\"42\",\"34\",\"24\"]'),
(3, 'In.', '10', '80', '[\"30\",\"38\",\"32\",\"41\",\"31\",\"27\",\"43\",\"39\"]'),
(4, 'Excepturi.', '10', '80', '[\"27\",\"39\",\"29\",\"42\",\"26\",\"37\",\"44\",\"40\",\"36\"]'),
(5, 'Vel.', '30', '70', '[\"36\",\"42\",\"38\",\"27\",\"33\",\"30\",\"25\",\"41\",\"29\",\"26\"]'),
(6, 'Velit.', '10', '60', '[\"43\",\"27\",\"29\",\"44\",\"35\",\"25\",\"31\",\"24\",\"36\"]'),
(7, 'Sunt.', '40', '90', '[\"37\",\"31\",\"43\",\"39\",\"40\",\"38\",\"29\",\"30\",\"36\",\"34\",\"44\",\"26\",\"32\"]'),
(8, 'Ut dolore.', '40', '70', '[\"41\",\"37\",\"33\",\"29\",\"38\",\"25\",\"34\",\"28\",\"31\",\"39\",\"44\",\"27\",\"32\"]'),
(9, 'Sapiente.', '50', '70', '[\"34\",\"44\",\"40\",\"36\",\"27\",\"42\",\"38\"]'),
(10, 'Ipsa voluptatum.', '30', '100', '[\"32\",\"34\",\"30\",\"41\",\"33\",\"25\",\"40\",\"39\",\"26\",\"35\",\"43\"]');

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
(1, 'Unde ut.', 'Aperiam et facere in.', '[\"9\",\"2\"]', '820'),
(2, 'Non sapiente.', '', '[\"8\",\"10\"]', '820'),
(3, 'Laborum.', '', '[\"10\"]', '850'),
(4, 'Qui veniam.', '', '[\"8\",\"6\"]', '510'),
(5, 'Magnam est.', '', '[\"7\",\"2\",\"5\"]', '790'),
(6, 'Dolores.', '', '[\"8\"]', '850'),
(7, 'Nulla aut.', '', '[\"7\",\"8\"]', '840'),
(8, 'Dolores et.', 'Placeat dignissimos pariatur.', '[\"4\"]', '860'),
(9, 'Vel.', 'Illo voluptatem libero ex.', '[\"7\",\"2\",\"5\"]', '900'),
(10, 'Id.', '', '[\"2\"]', '530'),
(11, 'In.', 'Et dolores porro.', '[\"1\",\"2\",\"9\"]', '640'),
(12, 'Deleniti nihil.', '', '[\"2\"]', '700'),
(13, 'Eveniet eum.', 'Non eos.', '[\"8\",\"9\"]', '510'),
(14, 'Laboriosam.', '', '[\"4\",\"5\",\"2\"]', '700'),
(15, 'Iusto.', 'Est consequatur at.', '[\"10\",\"2\",\"3\"]', '530');

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
(1, '4028', '', 'deserunt', 'Miss Maryjane Effertz', '', '333227819838736', 'Nemo quod et.', 'Ipsa qui nostrum iure neque.'),
(2, '6837', '', 'eius', 'Allan Gerlach', '', '451693274685413', 'Est perspiciatis illum aliquam cum.', 'Sed blanditiis nesciunt omnis optio illum accusantium.'),
(3, '6498', '', 'aut', 'Ms. Carmen DuBuque MD', '', '413378126096642', 'Aliquid est soluta dolorem.', 'Quia aperiam distinctio vel fuga.'),
(4, '7373', '', 'aliquid', 'Uriah Muller V', '', '550602522290064', 'Et fugiat.', 'Nemo porro non non et.'),
(5, '6029', '', 'quo', 'Prof. Newell Labadie PhD', '', '879451283358972', 'Et provident molestiae.', 'Ipsam molestiae cupiditate qui non maiores adipisci vero sunt.'),
(6, '7352', '', 'maxime', 'Ms. Jackie Gottlieb III', '', '405321909921962', 'Sint sunt eum.', 'Ullam exercitationem quibusdam corrupti qui aperiam.'),
(7, '1709', '', 'sunt', 'Dr. Melba Kshlerin', '', '851351463133285', 'Ratione nemo consequatur adipisci.', 'Velit dolorum architecto unde ut omnis.'),
(8, '6969', '', 'eos', 'Aditya Gislason DVM', '', '654964132825236', 'Non suscipit.', 'Et aut qui possimus corporis incidunt facere.'),
(9, '7701', '', 'molestiae', 'Myriam O\'Connell', '', '263755897210864', 'Dolorum vel illo ex dolore.', 'Voluptas rerum earum natus.'),
(10, '3290', '', 'nihil', 'Ms. Luz Medhurst IV', '', '944171179966060', 'Fugiat quaerat assumenda.', 'Ut ipsam iste omnis.');

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
(1, 'ahmedsk', 'vern.mccullough@hegmann.com', '$2y$10$CWdt9A3s10jWKE9sg24lKesI1IV/d5rdlPtPcMisAR/rpvG4COgK.', '', 'Ahmed Sayed', 'admin', 2, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '100409', '+68 1704703', 0, 0, '', NULL, '', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(2, 'virtu', 'becker.elyse@hotmail.com', '$2y$10$HtKKtyaejDX4jk2wVtUanOp.hIGzoFfdrAKmB8eDlBRkYwliVicku', '', 'Virtu', 'admin', 2, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '167890', '+41 2159003', 0, 0, '', NULL, '', '055.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'employee', 'pbatz@yahoo.com', '$2y$10$rrMbOPr3WJbzipNRrzRFKOZmkut9dE28j.VaDcJnm3pzaLVwUiAxW', '', '[Em] Lela Hodkiewicz', 'employee', 3, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '670123', '+83 9221019', 0, 0, '', NULL, '', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'greenfelder.jaeden', 'xrowe@gmail.com', '$2y$10$gA8h4Q5YALTvYW9hT5dNM.cXc5mRTU/QDL40lmsRPdUwognok3RAq', '', '[Em] Leland Mraz', 'employee', 11, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '477877', '+78 9706440', 0, 0, '', NULL, '', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'tomas19', 'rschroeder@yahoo.com', '$2y$10$jNNriHIbYIwBNZFptJBUjO1UacUXwKH0FyXLC8beQqMHAkC6C6huW', '', '[Em] Madisyn Nolan', 'employee', 14, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '590956', '+79 4757896', 0, 0, '', NULL, '', '094.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'jones.priscilla', 'hoeger.kendall@gmail.com', '$2y$10$UIYyBFtnRc9WNstf3k5IFe0pjnjE.fUIbRXQ9DmwPkddxdvJKQGKG', '', '[Em] Prof. Tommie Schaden', 'employee', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '103297', '+40 8716645', 0, 0, '', NULL, '', '01.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'upollich', 'pfannerstill.amari@zieme.info', '$2y$10$unwkDnLBRiBCi.OK5vtCLOyit9x8bDzznV9MmVQK.KXDCMF2BzoZC', '', '[Em] Eleazar Hand', 'employee', 9, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '806590', '+26 2133813', 0, 0, '', NULL, '', '037.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'nmarks', 'mark52@hermiston.biz', '$2y$10$97AtfHkQn4hsEf.CBBVYl.VD6GE/TCYi3ZsRm3YDa.ylQiN2enCPy', '', '[Em] Casey Kirlin', 'employee', 10, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '881528', '+83 9220289', 0, 0, '', NULL, '', '036.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'lynch.vesta', 'akeem.marquardt@windler.org', '$2y$10$cnDwcMsiBWw7QygDmaZDkOBTUbqgrpKtMR06RqaZTM9ThPHDQeUgC', '', '[Em] Mr. Dewitt Howe', 'employee', 13, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '166497', '+68 8176930', 0, 0, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'june.cummerata', 'alena71@ortiz.com', '$2y$10$KReUbID5nLu8chXBGBU5e.Gjl2UIXMquOcq8uXbxNmGBWg1e2ODXy', '', '[Em] Diego Davis PhD', 'employee', 9, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '613707', '+49 1521170', 0, 0, '', NULL, '', '010.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'armstrong.gregg', 'maggio.henriette@hotmail.com', '$2y$10$ExNQh6V7LAfol/x08V1u9.uJs4qx3DzXp8/wslM9KonMmca8YbbhW', '', '[Em] Ms. Aditya Dicki', 'employee', 14, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '636206', '+28 3688650', 0, 0, '', NULL, '', '030.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'ziemann.reva', 'gondricka@ruecker.net', '$2y$10$yQ1CvZxRwByJCGw/NVBWduIBqWHjwS3UQp9MkNOYSRg3iNTHdpNGS', '', '[Em] Reva McClure', 'employee', 9, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '872797', '+62 5645057', 0, 0, '', NULL, '', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'terrence.heaney', 'gleason.hosea@gmail.com', '$2y$10$BXvU/3CpVcDxhbyTX5ClYeiF8BGShRH3CwJ35pT966ZfVNnUYEyRy', '', '[Em] Camryn Casper', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '763619', '+41 9371714', 0, 0, '', NULL, '', '059.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'predovic.josianne', 'imelda68@legros.com', '$2y$10$xcxAwBWQRmL40ld.nWbda.TbjWmC0vwzqktkjS6X9mtIC599wKpUG', '', '[Em] Bulah Schuppe', 'employee', 10, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '534386', '+21 2302562', 0, 0, '', NULL, '', '017.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'krussel', 'erdman.woodrow@abernathy.com', '$2y$10$pfnlDVON1ot/fZ4JQhwT7eQhLjMu5laayqPSClaGSc6m97kg5R0C6', '', '[Em] Dena Gutmann', 'employee', 11, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '180026', '+25 5769749', 0, 0, '', NULL, '', '038.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'pgrady', 'jacobson.hollis@hotmail.com', '$2y$10$X2ixY4H.F2CCFOhVkRtqbuIh/DoJ2S9gKHdsYmHQzi0gcBJ1vty.y', '', '[Em] Mr. Ryan Miller', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '493947', '+28 3199352', 0, 0, '', NULL, '', '08.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'rice.adam', 'ambrose.stamm@price.info', '$2y$10$HGGSV1oPLT3Y49lWgWYhmOGVs4xI.DSjNNFaIYiX/sb9xB03V9HCS', '', '[Em] Houston Hettinger', 'employee', 13, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '127389', '+51 9890443', 0, 0, '', NULL, '', '065.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'meda.marks', 'rippin.shannon@schimmel.info', '$2y$10$KyzLcDQHwM3CIC/biUc2H.9bNXeByVpHfkfz1XsawM6b9HE96w6/e', '', '[Em] Dr. Lazaro Bernier II', 'employee', 3, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '839265', '+48 6134477', 0, 0, '', NULL, '', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'samir02', 'jgoldner@daniel.com', '$2y$10$txW/sRn9Q0blACUNwNadGO8Ao3pjt.TAkuo5O9tJtbVzLkyzx.lby', '', '[Em] Monty Dare', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '625147', '+35 5763753', 0, 0, '', NULL, '', '079.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'goyette.madelynn', 'bbahringer@gleason.com', '$2y$10$0cWBykrup3PFM1OrLPxdKeAWGWBHU0MgBm5BYo1epJKPCYk2O4w22', '', '[Em] Prof. Stacey Beer MD', 'employee', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '971794', '+17 7109508', 0, 0, '', NULL, '', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'kgoldner', 'nienow.keven@conn.com', '$2y$10$8xMC2OrlqhYNk.fO7VRarO5LSN7aaD.xPl9NtqfP8khXePe6HPHFi', '', '[Em] Prof. Hermina McCullough', 'employee', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '127562', '+71 6740244', 0, 0, '', NULL, '', '029.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'soconnell', 'diamond74@macejkovic.biz', '$2y$10$aVHu/1oC6q2os5UkA5GdkuYVYSVgus6SR82cGR0yN/JwZoUvarQja', '', '[Em] Aiden Gaylord', 'employee', 3, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '345022', '+40 3834613', 0, 0, '', NULL, '', '052.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'marcus.walsh', 'kutch.glennie@lebsack.org', '$2y$10$kQXlEszmdi1uFCH1piYK.efB6LxTA5wyBGnTG96rm9VJGYXyOBNhu', '', '[Em] Mariana Dach', 'employee', 11, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '966246', '+38 5385738', 0, 0, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'teacher', 'lilly19@okon.com', '$2y$10$WhJa.OyHbUupZx6ftte7l.4nMG5RRvJOVHcleuwYdMU0vidvl4Sae', '', '[Te] Lew Harris', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '556610', '+42 7397615', 0, 0, '', NULL, '', '013.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'ewell37', 'schmeler.lamont@hotmail.com', '$2y$10$8N3F/pNUqQCAu4BU/xhBrO/1R6o5mSEuUrrSsRntpgJJAtR/QIWaK', '', '[Te] Sylvia Sauer PhD', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '786457', '+79 1377071', 0, 0, '', NULL, '', '018.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'irath', 'antonia.price@yahoo.com', '$2y$10$V7R5xUxSjejtAbW1GzYdjuuon7j6xEwfNyHCwzvarBC/PF9tiTFhu', '', '[Te] Bethel Berge', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '984404', '+45 2138820', 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'lehner.geo', 'mmarvin@hotmail.com', '$2y$10$13DezYOI/di4to8ENZIZcOkjWrt4jUWWZ8YEAfySDpKSwu75LIXte', '', '[Te] Mrs. Dasia Ortiz IV', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '311590', '+51 1745154', 0, 0, '', NULL, '', '033.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'daisha.leannon', 'chaz.bogan@hotmail.com', '$2y$10$3OhYQfYTHYEEtGj01uEsVe4/qeBX/ICZaUxawFgAFgyQtKImicT7e', '', '[Te] Alda Wilderman', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '817280', '+19 7227559', 0, 0, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'vheaney', 'sstroman@gmail.com', '$2y$10$B8n1mj.1nc94QQYvQgZBxeCyZpWTcXjnILa7y7ZlwszGbMr1Bsq4S', '', '[Te] Lori Hills', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '611552', '+31 6484454', 0, 0, '', NULL, '', '086.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'anastacio48', 'golden.bayer@lind.com', '$2y$10$1vL.j/jsCZg2cs6VC/5FJO5d4z6H0JxLuLhnKyCie6KS7GIyIqQ.a', '', '[Te] Mrs. Melisa Sipes', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '996692', '+80 8426455', 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'dstroman', 'darion.fay@braun.com', '$2y$10$H0SK8nsJgm8jEuaF0SKJi.FI/TpD5VufNBtL8rq7M7k0eD8gCRscK', '', '[Te] Isabell Bogan', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '491972', '+13 1926999', 0, 0, '', NULL, '', '023.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'brendan.vonrueden', 'rsimonis@yahoo.com', '$2y$10$iRA9AqoH78YPlKNoYKkIP.1S427YdMzHs45F9JDd3zACxKE.0P18K', '', '[Te] Frederick Hackett', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '773613', '+19 3332762', 0, 0, '', NULL, '', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'nat.champlin', 'stefan43@gutmann.org', '$2y$10$LGTNy.uZTzC3WRe4v4nMneVkaR7ZyHPmEt/Nut5rzhE0QYTvIlAC.', '', '[Te] Kurtis Torp', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '421161', '+25 3487631', 0, 0, '', NULL, '', '093.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'magali72', 'clara04@spinka.org', '$2y$10$5i29HQhf96dsv495Z8lUDO7ItwTmCkyklPHe3GjM4221AIpSQgvBO', '', '[Te] Valentin Runte', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '501321', '+86 6725491', 0, 0, '', NULL, '', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'bailey.javon', 'tpacocha@yahoo.com', '$2y$10$d0b8zOWaqN9FYFJJ8xIFdOcv9Ngw8XGcHkIib0AJILL5parkJcw6W', '', '[Te] Miss Karina Fay I', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '824069', '+79 1792377', 0, 0, '', NULL, '', '045.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'dessie.stark', 'devonte82@russel.com', '$2y$10$KvU/QlVzVs7hxMAuxtShleh4zK46RZ.uo/jAq01nc/l6o.3m1rC0S', '', '[Te] Madisen Gerhold', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '344536', '+36 1958523', 0, 0, '', NULL, '', '037.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'amckenzie', 'tbosco@gmail.com', '$2y$10$ogRbUrvAI3KZc0JNwfk47O0zJ2G4699zDapPnMnRm774oyB5ia6YW', '', '[Te] Chadd Rosenbaum', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '534562', '+38 2461264', 0, 0, '', NULL, '', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'fausto.heaney', 'eorn@gmail.com', '$2y$10$Htz7AwfWxotXnAEde7fgbOFpfCPRqBCKoh8bYlC/g9fIeHQclWItC', '', '[Te] Ruby Botsford', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '109801', '+80 1664684', 0, 0, '', NULL, '', '081.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'laurianne.mayert', 'larue72@hotmail.com', '$2y$10$RE/EtWoN2r1hGCUVBcjoD.S9Ap8pgxEmSdjrZKndvPxYd9XPyCe3.', '', '[Te] Dr. Arvilla Bauch', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '935680', '+41 8564367', 0, 0, '', NULL, '', '028.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'camron.altenwerth', 'austin.nicolas@yahoo.com', '$2y$10$UuVbyVNqSxyZKhqxBlr3oO2xxbCoGkzNFC80PNoYbPgwaTlw.v0P2', '', '[Te] Breanna VonRueden', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '774534', '+43 6413667', 0, 0, '', NULL, '', '096.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'oconner.cali', 'bud.haag@leffler.com', '$2y$10$g7KZyQmiKTOIrk0OaH/PV.9TKqJ8RE1ZmvepRm2R72oRmunVc0YO6', '', '[Te] Adah Weissnat', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '793600', '+18 9245311', 0, 0, '', NULL, '', '013.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'bradtke.america', 'jprohaska@stamm.com', '$2y$10$VrDUZ5R2eXgdtJ0zfJPiLOSeDX8y/k3MD183hfnkTu8QU/l4oOj8S', '', '[Te] Zula Wilderman', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '337683', '+28 9666033', 0, 0, '', NULL, '', '012.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'hkessler', 'clark.emmerich@hotmail.com', '$2y$10$1tiZYUIb3Rg3kmQCIxoJ.O6InFdcRVbpXsQIQ9/i.wHpJYuyT2rL2', '', '[Te] Dejuan Hartmann', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '892575', '+83 4790848', 0, 0, '', NULL, '', '04.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'batz.kacey', 'heaven.hill@oconnell.org', '$2y$10$f6HXbaum1O5Lxj5wUFj3H.Fk1ZcFr3knCb5pG/38rglj90lPURo7e', '', '[Te] Prof. Jess Johnson', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '648979', '+73 2554100', 0, 0, '', NULL, '', '054.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'student', 'lorenzo63@lockman.biz', '$2y$10$S68nhrDiCimCTPnybffAeelBqKF8i0u9.yaBIM5uB6raVEeWYn0aC', '', '[St] Ms. Madie Casper IV', 'student', 6, 2, NULL, 0, 1, '62', '30-869-21', 0, 0, '', 0, NULL, NULL, '4030857379', '4585011', 6, 27, '', NULL, '', '084.png', '', '', 11, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'abergstrom', 'kattie30@grimes.com', '$2y$10$B/OSmN6aAOme/ONEVAii7eGuEYtV550tCe.9B65Ta7v28QQcnEVcC', '', '[St] Gideon Funk', 'student', 6, 2, NULL, 0, 1, '35', '57-592-57', 0, 0, '', 0, NULL, NULL, '5395513938', '8277061', 5, 48, '', NULL, '', '029.png', 'Principal', '', 3, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'hansen.kaya', 'bleuschke@bradtke.com', '$2y$10$tao69sex1.Css62DMEJ/XevdDVivLqg3Vx/JnlH4gSswS3uocuUWa', '', '[St] Karine Douglas III', 'student', 6, 2, NULL, 0, 1, '78', '28-453-72', 0, 0, '', 0, NULL, NULL, '6157419208', '5911602', 7, 21, '', NULL, '', '052.png', '', '', 12, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'alden39', 'nschinner@hotmail.com', '$2y$10$Uco35d.QB6mH/JkvIn7cEuO3NgCcnzaVw/wXXxhVMjAwr1WDJel7m', '', '[St] Aileen Bosco', 'student', 6, 1, NULL, 0, 1, '56', '18-594-39', 0, 0, '', 0, NULL, NULL, '9433304358', '4739209', 2, 19, '', NULL, '', '079.png', '', '', 15, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'kconnelly', 'madyson53@yahoo.com', '$2y$10$b/BYzInb1gD7sLdf0DaXf.hMdtxBDNpMD/3q6AaXC0NUGqF66D2Ny', '', '[St] Miss Odie Hills Sr.', 'student', 6, 4, NULL, 0, 1, '3', '86-357-92', 0, 0, '', 0, NULL, NULL, '7528624135', '7135451', 4, 2, '', NULL, '', '015.png', '', '', 13, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'sydnie09', 'tessie68@frami.biz', '$2y$10$2Mx5UjN3iTtf7Ok2BJgZketUCUi0521HEiW0EPkPeD0WcDEN3FPOC', '', '[St] Mabelle O\'Conner', 'student', 6, 2, NULL, 0, 1, '93', '81-878-70', 0, 0, '', 0, NULL, NULL, '1901782351', '3532594', 6, 52, '', NULL, '', '014.png', 'Principal', '', 1, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'chanelle11', 'lelia32@feeney.org', '$2y$10$CWBy93kS00.uOThjn60kmuRtG83OpFBOv08QcGXpD26s9ip8X1NIi', '', '[St] Dr. Lilla Hayes DVM', 'student', 6, 1, NULL, 0, 1, '28', '74-253-20', 0, 0, '', 0, NULL, NULL, '4574667518', '4846728', 5, 34, '', NULL, '', '063.png', '', '', 8, 4, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'brown.corbin', 'madison.hermiston@fisher.com', '$2y$10$aA8k75j8SWH3vh5OtEACZ.IE1POBHLU/F9mpi3RS8v6KRAKaUNz6q', '', '[St] Joshua King', 'student', 6, 2, NULL, 0, 1, '31', '61-543-58', 0, 0, '', 0, NULL, NULL, '9302579445', '8803770', 3, 54, '', NULL, '', '092.png', 'Captain: Yellow House', '', 6, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'aleuschke', 'wilkinson.deborah@stehr.com', '$2y$10$7PZsh8VKjF588i4CC9GGg.6pC.1EcvyTHgzyuFnEt8ZmB27IDgxN6', '', '[St] Miss Mariane Kertzmann PhD', 'student', 6, 3, NULL, 0, 1, '51', '37-632-35', 0, 0, '', 0, NULL, NULL, '3389623489', '5269045', 8, 59, '', NULL, '', '063.png', 'Pro', '', 9, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'evert.kohler', 'ken40@gmail.com', '$2y$10$PeaswXVtRwHSkmpq2HTb4OGWkfKzfrvslTmr9Y2C.pPj6rN7KF4Jy', '', '[St] Kyler Olson', 'student', 6, 2, NULL, 0, 1, '21', '81-875-53', 0, 0, '', 0, NULL, NULL, '8862562632', '3269130', 7, 10, '', NULL, '', '086.png', 'Vice Principal', '', 6, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'koby82', 'sedrick.cronin@gmail.com', '$2y$10$gauXVZBK.eU03ANG/cB9Oe1xirigz2WkdVB07A.qfk2Qmi7qu1Lyy', '', '[St] Joyce Swaniawski III', 'student', 6, 3, NULL, 0, 1, '19', '57-108-96', 0, 0, '', 0, NULL, NULL, '7742278328', '8205385', 3, 26, '', NULL, '', '022.png', 'Captain: Blue House', '', 11, 1, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'dax.wolf', 'acremin@friesen.com', '$2y$10$517TPKBt/DsVLUSs9ZWf4.jxEvTnSAf1gZ4pWNQblBmhurI3CaRXi', '', '[St] Ambrose Ebert', 'student', 6, 4, NULL, 0, 1, '42', '64-792-55', 0, 0, '', 0, NULL, NULL, '1202398523', '1524634', 7, 25, '', NULL, '', '050.png', '', '', 14, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'enid96', 'demario.runolfsson@yahoo.com', '$2y$10$0ZOeM/IdPAQklI6wSfB42OUccOs.ukhloVYjyAyuxn.2Y0tVBI4vO', '', '[St] Rafaela Schroeder', 'student', 6, 1, NULL, 0, 1, '16', '73-634-80', 0, 0, '', 0, NULL, NULL, '1796306918', '1610587', 5, 57, '', NULL, '', '057.png', 'Pro', '', 6, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'tony03', 'mhahn@pollich.com', '$2y$10$8MXBMTGyHiTKjpLW2EVrN.84KTFJIhhV3FaS.IxEcnoDZBgEXKiP6', '', '[St] Hannah Greenfelder', 'student', 6, 3, NULL, 0, 1, '9', '10-149-25', 0, 0, '', 0, NULL, NULL, '3782616445', '5490356', 1, 47, '', NULL, '', '089.png', '', '', 6, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'jude62', 'koch.alan@yahoo.com', '$2y$10$3.Z.4KxxF9Q3zLrb5llYxe./N.Pc6QVy6.PqBJf6w/eRl/IZRFS2y', '', '[St] Hugh Simonis DDS', 'student', 6, 2, NULL, 0, 1, '80', '40-796-73', 0, 0, '', 0, NULL, NULL, '1917016410', '7501101', 1, 6, '', NULL, '', '062.png', 'Vice Principal', '', 1, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'nchamplin', 'anastacio91@abernathy.com', '$2y$10$JpDBaAhYFOVD7ekVELN6qOSPHwgVgxgw.3D54ChfLPyI0AHPnYybm', '', '[St] Margot Deckow III', 'student', 6, 4, NULL, 0, 1, '14', '50-980-58', 0, 0, '', 0, NULL, NULL, '5593803737', '2474316', 7, 16, '', NULL, '', '07.png', '', '', 14, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'melvin.maggio', 'roman22@leffler.com', '$2y$10$ZkLrPwVgLtdxSVTBU/CPauWLuns8SVQXCDT2k8cF8tKvK4EJ1MjCm', '', '[St] Burley Pollich', 'student', 6, 2, NULL, 0, 1, '71', '77-650-71', 0, 0, '', 0, NULL, NULL, '9149898168', '8949606', 3, 60, '', NULL, '', '076.png', '', '', 12, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'wuckert.jaylon', 'ymorar@doyle.com', '$2y$10$KFdnnMmf.nYk/vHrl.PqTO58tFFKQvCPaK6wIMGZsUO9CusPnwD76', '', '[St] Zack Bergstrom Jr.', 'student', 6, 4, NULL, 0, 1, '6', '28-840-82', 0, 0, '', 0, NULL, NULL, '2994420732', '1100901', 4, 4, '', NULL, '', '065.png', 'Captain: Blue House', '', 15, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'stracke.blanca', 'gbrown@cummings.com', '$2y$10$PSuDQ1BKo0OQJx3TLcajJ.PjkObq0KTWx0hQLIEqfqYAP9fFimPpa', '', '[St] Dr. Jalon Glover DDS', 'student', 6, 1, NULL, 0, 1, '25', '18-533-77', 0, 0, '', 0, NULL, NULL, '3273685281', '7249712', 5, 58, '', NULL, '', '085.png', '', '', 7, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'jason17', 'mhansen@hotmail.com', '$2y$10$lv3ka3jaaqCjSr47klbWce7yPFB6Y6AnR2XRG7H5JDL3rD4LALjl6', '', '[St] Prof. Golden Bartell PhD', 'student', 6, 1, NULL, 0, 1, '87', '17-775-57', 0, 0, '', 0, NULL, NULL, '6100682793', '8946883', 1, 56, '', NULL, '', '030.png', '', '', 14, 4, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'kuvalis.jennifer', 'cokuneva@gmail.com', '$2y$10$Ve0O8PMSGZJhaQCaNTjJ1OlTtsFOSDSwdCtpcSjd7LWeqqoNOdRva', '', '[St] Shanel Champlin', 'student', 6, 2, NULL, 0, 1, '22', '19-110-56', 0, 0, '', 0, NULL, NULL, '1824734667', '9616571', 3, 9, '', NULL, '', '057.png', '', '', 1, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'rolfson.annalise', 'xratke@yahoo.com', '$2y$10$Dwz.k.DyYDETy2rT1FSBuulN7RjkeLQXbPsq5nGpfn93c/VWU8q7S', '', '[St] Beulah Daniel', 'student', 6, 1, NULL, 0, 1, '16', '12-445-98', 0, 0, '', 0, NULL, NULL, '7310055772', '5668406', 5, 48, '', NULL, '', '068.png', 'Advanced one', '', 7, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'jeffery84', 'orland28@gutkowski.com', '$2y$10$wnim9AxMe0QDLF95h1LJ.eWaMCToI4qcrxxrZCNYvKnRM/rOteA.a', '', '[St] Tyra Tillman', 'student', 6, 4, NULL, 0, 1, '23', '60-419-84', 0, 0, '', 0, NULL, NULL, '6550423627', '2070069', 3, 9, '', NULL, '', '058.png', '', '', 15, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'bettie.parker', 'beahan.mariane@christiansen.net', '$2y$10$2KkBPXHa3nGtMR2MnGjKVeG4koUm4/MzwI5Ihku26a9q4gWYJR7Z.', '', '[St] Hannah McGlynn DVM', 'student', 6, 1, NULL, 0, 1, '59', '38-573-28', 0, 0, '', 0, NULL, NULL, '1382227477', '4504096', 4, 13, '', NULL, '', '09.png', 'Clever', '', 3, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'waelchi.baron', 'ihyatt@hotmail.com', '$2y$10$Q3m8yxXtJxGNi9LCfvqDG.7XUUnFy/OvrdAJINcKKRICXYF.cPfS6', '', '[St] Arnaldo Abbott Jr.', 'student', 6, 2, NULL, 0, 1, '52', '52-455-45', 0, 0, '', 0, NULL, NULL, '1075204756', '7413586', 2, 12, '', NULL, '', '036.png', '', '', 11, 1, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'wuckert.susan', 'annabell.thompson@yahoo.com', '$2y$10$dQEAyhO0H8pYsSCU2928PO7vS8VZ/IekKgJj1dxsh899iY2rrlcv2', '', '[St] Avery Bergnaum', 'student', 6, 3, NULL, 0, 1, '89', '99-209-90', 0, 0, '', 0, NULL, NULL, '6614508754', '1850968', 6, 50, '', NULL, '', '051.png', '', '', 13, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'tito.reichel', 'archibald.grimes@gmail.com', '$2y$10$jiXx1Gajl1OxIMWpnu8G1.2ps7N7zp0q2mXL8LxFGSyrqOLJjz.zS', '', '[St] Francesca Hills', 'student', 6, 2, NULL, 0, 1, '73', '25-547-23', 0, 0, '', 0, NULL, NULL, '6300379274', '8693406', 7, 16, '', NULL, '', '015.png', '', '', 11, 1, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'gmorissette', 'mason.thompson@rippin.biz', '$2y$10$jSCri8XLZpPI9rw572I83.ChoSrf7b3zofGFXw2nxDGXAP0Bk.hr2', '', '[St] Ms. Jaclyn Boyer', 'student', 6, 1, NULL, 0, 1, '20', '11-276-69', 0, 0, '', 0, NULL, NULL, '8575913734', '2613333', 4, 13, '', NULL, '', '069.png', 'Pro', '', 11, 1, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'leannon.clinton', 'tremayne.prohaska@hotmail.com', '$2y$10$bYR50AVxTU9keBCPtBqwuu1qdgyK2/PS8KSod/4zTx197xH9GHK0W', '', '[St] Thomas Klocko', 'student', 6, 2, NULL, 0, 1, '64', '65-335-40', 0, 0, '', 0, NULL, NULL, '2452837940', '9597058', 6, 31, '', NULL, '', '06.png', 'Vice Principal', '', 14, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'emmanuelle02', 'oconner.diego@hotmail.com', '$2y$10$c2JyxRhkMMEGC.CaezRTh.8wC5AG832OxXxwlPmHJ1pEinpcshH/q', '', '[St] Mr. Erick Hartmann', 'student', 6, 3, NULL, 0, 1, '19', '93-415-71', 0, 0, '', 0, NULL, NULL, '8719284863', '2553979', 6, 52, '', NULL, '', '05.png', 'Advanced one', '', 6, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'mann.sydnie', 'wintheiser.oma@weissnat.biz', '$2y$10$blXf8e1LkYMvKLdN8zh6.eBatAu9Kr/dmw765ziygaxrLlRRmZpcy', '', '[St] Miss Oleta Yost', 'student', 6, 4, NULL, 0, 1, '89', '74-872-11', 0, 0, '', 0, NULL, NULL, '7541000888', '2607232', 5, 48, '', NULL, '', '021.png', 'Captain: Blue House', '', 15, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'parent', 'schmeler.cicero@yahoo.com', '$2y$10$hhqR8W.FEc2RAprKIB8GAe4z688N4rEZI8D/3ajEWgfdCUmPU/xtu', 'AolILhovFoWCmPUmOmZ49lZ9XNi7DoWqEoExEj6mZMyDLdslvc1oMtuzt5Nh', '[Pa] Jarrod Abshire', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4603151256', '6104234', 1, 51, '', NULL, '[{\"student\":\"[St] Hannah McGlynn DVM\",\"relation\":\"father\",\"id\":68}]', '036.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(77, 'mariam.heller', 'nienow.erna@hotmail.com', '$2y$10$WVOWAW4JucyPJSvzgCBSSutvSs7AcXRjjpE/5e5WLG29/FqnLqm8C', '', '[Pa] Mr. Elbert Nitzsche', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2991229534', '3897743', 7, 12, '', NULL, '[{\"student\":\"[St] Ms. Jaclyn Boyer\",\"relation\":\"father\",\"id\":72}]', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'angelina.corwin', 'mattie.schulist@gmail.com', '$2y$10$ziaZngi73shZywwNjm7ah.1FaDlAelhU2lfVd5PA.DKvGfux3kG6W', '', '[Pa] Dr. Quincy Kris', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7664219322', '1094752', 6, 1, '', NULL, '[{\"student\":\"[St] Dr. Jalon Glover DDS\",\"relation\":\"father\",\"id\":63}]', '076.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'walker.allene', 'birdie41@okeefe.com', '$2y$10$GLKN23fCMt8R1firib2t6OdpkKDRdRjI/stQVZ/njOK.t0Fw/dxB2', '', '[Pa] Tianna Marquardt', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9282030440', '6014992', 1, 22, '', NULL, '[{\"student\":\"[St] Mr. Erick Hartmann\",\"relation\":\"father\",\"id\":74}]', '022.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'rosemarie95', 'madelynn01@hand.com', '$2y$10$R3pPCeW3Mwpqh7SRU6z.neL1J5bpswx90x.BJArhRqGYt0wOQZHGy', '', '[Pa] Dr. Sammie Keeling IV', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5886904848', '1793842', 6, 32, '', NULL, '[{\"student\":\"[St] Mabelle O\'Conner\",\"relation\":\"father\",\"id\":50}]', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'lklein', 'zswift@gmail.com', '$2y$10$7FzRomuCN3nE5Hg3XGRtPeSpb5YbFaDDcPpKcNlPJmHO5.t93YNj.', '', '[Pa] Joannie Sanford', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1937624403', '5109300', 5, 52, '', NULL, '[{\"student\":\"[St] Mabelle O\'Conner\",\"relation\":\"father\",\"id\":50}]', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'bashirian.afton', 'wilford81@satterfield.net', '$2y$10$Dy.B6cogIJYMuzsYGGdzh.TpX.Gl9s1xzc4gjpDsUfwwk2IQNXGQG', '', '[Pa] Samanta Hodkiewicz', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6893987476', '5738817', 8, 22, '', NULL, '[{\"student\":\"[St] Mabelle O\'Conner\",\"relation\":\"father\",\"id\":50}]', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'johnson.margarette', 'suzanne32@hotmail.com', '$2y$10$CDJ9oEvUpWN6XnNlsFHV3OpyvK0DiDaiNOink3mgMc0LDzus6CzMi', '', '[Pa] Mrs. Noemy Stroman PhD', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8962750769', '4233700', 6, 44, '', NULL, '[{\"student\":\"[St] Mr. Erick Hartmann\",\"relation\":\"father\",\"id\":74}]', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'norwood.bednar', 'andy28@flatley.net', '$2y$10$gsgWTbRgktnFXu6LUc3zteIxItFp.tjSaO2xkmeFnHv9O/gVVTBvi', '', '[Pa] Dr. Kelley Marks', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2970931314', '8999073', 5, 31, '', NULL, '[{\"student\":\"[St] Hugh Simonis DDS\",\"relation\":\"father\",\"id\":59}]', '014.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'spencer.marcia', 'davonte78@waters.com', '$2y$10$wMGnW1iFzlPV7KuioePs7OKrPH3iRljrioZj/LsdLOSgTYSjb.Rc6', '', '[Pa] Clemens Konopelski', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9598480255', '5404519', 1, 40, '', NULL, '[{\"student\":\"[St] Ms. Madie Casper IV\",\"relation\":\"father\",\"id\":45}]', '056.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'ledner.elenora', 'ransom63@dibbert.com', '$2y$10$rflKcTxCe/FmMR0sbPR21eR3cR5sjkxfoPVAM2lS021C8zEnpWUVG', '', '[Pa] Dr. Axel Trantow III', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1638464580', '8380516', 2, 34, '', NULL, '[{\"student\":\"[St] Hannah McGlynn DVM\",\"relation\":\"father\",\"id\":68}]', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'mertie77', 'wehner.nakia@yahoo.com', '$2y$10$sogDSn8OQhSDZY.X7sXkZuasow6qpIB8WPgINN8DjCblEBQUKVR3O', '', '[Pa] Kelley Wyman Sr.', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '6783753764', '6164425', 7, 40, '', NULL, '[{\"student\":\"[St] Hannah McGlynn DVM\",\"relation\":\"father\",\"id\":68}]', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'jaskolski.clement', 'hoyt.jacobi@hotmail.com', '$2y$10$7JXHpHhftFfhBySs9PcMuefqROplRspWhd5RfUjzsM68SkIP4NsRK', '', '[Pa] Heber Beer', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5321416928', '8020166', 1, 48, '', NULL, '[{\"student\":\"[St] Tyra Tillman\",\"relation\":\"father\",\"id\":67}]', '043.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'spaucek', 'ferne.swift@gmail.com', '$2y$10$VZKNZt2tYgliptZ3oaSbpulJesPNy544dvUq1mQaXHQevaKCxbUmW', '', '[Pa] Heber Schiller', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9346432102', '5350290', 7, 21, '', NULL, '[{\"student\":\"[St] Miss Oleta Yost\",\"relation\":\"father\",\"id\":75}]', '060.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'ffriesen', 'maxime11@yahoo.com', '$2y$10$/ZGr6eH92VkvPFqS5Y.JYeB28X6sEHXsveErYJMjWuk8G3uExMRCe', '', '[Pa] Luciano Fahey', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8283254442', '8761879', 7, 11, '', NULL, '[{\"student\":\"[St] Karine Douglas III\",\"relation\":\"father\",\"id\":47}]', '089.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'carley67', 'vernie.labadie@mayert.com', '$2y$10$82fpqd609czLu0MTRsXiFu5YmItjh0Z6TNUpF8Hw6w/iD/Bii9mTS', '', '[Pa] Oran Hammes', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4827138684', '3560188', 5, 42, '', NULL, '[{\"student\":\"[St] Prof. Golden Bartell PhD\",\"relation\":\"father\",\"id\":64}]', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'johns.tamia', 'sigrid98@beer.org', '$2y$10$snATpn/xRzSTs6S/bNDrAuc29NU3uBVhMXN5BM.BO/E4U5b/QvZfa', '', '[Pa] Mrs. Jeanie McClure DVM', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8228291150', '1152378', 2, 25, '', NULL, '[{\"student\":\"[St] Arnaldo Abbott Jr.\",\"relation\":\"father\",\"id\":69}]', '01.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'morissette.florencio', 'zmann@stoltenberg.org', '$2y$10$17tB28NXPVpXUFAshcV/rePVFOxh8cDEuBDUNlFeLKsPnVVGKaLrG', '', '[Pa] Ms. Anahi Conn', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5687482450', '6010126', 7, 44, '', NULL, '[{\"student\":\"[St] Kyler Olson\",\"relation\":\"father\",\"id\":54}]', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'gutkowski.jennifer', 'rath.domenick@hotmail.com', '$2y$10$s0zz0FXT0y1SPvtPVQr3fuz1we1XG1X7mxmE2lnZ3hv/t7qDbOWHC', '', '[Pa] Mr. Isom Auer', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1853959648', '6760044', 2, 52, '', NULL, '[{\"student\":\"[St] Karine Douglas III\",\"relation\":\"father\",\"id\":47}]', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'jena.predovic', 'evans.glover@gmail.com', '$2y$10$cWgxPw/dyZq2nIFzQ4Azj.vSg66NwzdxfogHv/HKZ3MA9uir/bP4O', '', '[Pa] Mrs. Theresa Cole', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9431433330', '8349741', 3, 11, '', NULL, '[{\"student\":\"[St] Mabelle O\'Conner\",\"relation\":\"father\",\"id\":50}]', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'qskiles', 'dayana.rippin@gmail.com', '$2y$10$rOAPdnpWjCvh5akhhFzs3.W6PQe7TY1bjwMW0MtW3h4YIWdV6fE8S', '', '[Pa] Abigale Herman', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1124620643', '7553295', 4, 11, '', NULL, '[{\"student\":\"[St] Miss Odie Hills Sr.\",\"relation\":\"father\",\"id\":49}]', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;
--
-- AUTO_INCREMENT for table `messages_list`
--
ALTER TABLE `messages_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;
--
-- AUTO_INCREMENT for table `mm_uploads`
--
ALTER TABLE `mm_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
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
