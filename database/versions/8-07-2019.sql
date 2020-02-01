-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2019 at 01:58 PM
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
  `bookName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bookDescription` text COLLATE utf8_unicode_ci NOT NULL,
  `bookISBN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bookAuthor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bookPublisher` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bookType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bookPrice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bookFile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bookState` int(11) DEFAULT NULL,
  `bookQuantity` int(11) NOT NULL,
  `bookShelf` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `book_library`
--

INSERT INTO `book_library` (`id`, `bookName`, `bookDescription`, `bookISBN`, `bookAuthor`, `bookPublisher`, `bookType`, `bookPrice`, `bookFile`, `bookState`, `bookQuantity`, `bookShelf`) VALUES
(1, 'Autem molestiae.', '', '6550', 'Prof. Edmond Collier DVM', 'Aylin Denesik', 'traditional', '510', NULL, 1, 11, 'At cumque exercitationem est quod laborum nam vitae omnis magnam atque.'),
(2, 'Deleniti consequatur.', '', '2566', 'Reilly Gaylord IV', 'Dr. Wilburn Satterfield PhD', 'traditional', '240', NULL, 1, 66, 'Commodi dolor pariatur optio sapiente velit amet excepturi quia maxime quia et rem repellat ut aut quia.'),
(3, 'Sed delectus.', 'Suscipit vel eos est et aperiam harum temporibus ex fugit est consequatur voluptates accusamus.', '4852', 'Ethel Johnson', 'Miss Lia Kuhn', 'traditional', '890', NULL, 1, 78, ''),
(4, 'Asperiores culpa.', 'Molestias laborum temporibus similique consequatur nesciunt et cupiditate est esse laudantium omnis voluptatem eum dicta et error voluptate.', '3110', 'Karianne Hill', 'Greta Zboncak', 'traditional', '300', NULL, 0, 4, ''),
(5, 'Aut odit reprehenderit.', 'Consectetur velit sed voluptas voluptatem earum quos quo optio porro animi aliquam excepturi.', '1786', 'Prof. Forrest Hettinger Sr.', 'Fabian Ebert', 'traditional', '880', NULL, 0, 88, 'Incidunt consequatur quidem voluptate debitis dolorem fugit ut.'),
(6, 'Ab.', 'Et itaque ut qui quia quis id aut corrupti dolor est non possimus voluptatem enim officiis expedita ut amet ipsum.', '1730', 'Mrs. Jenifer Ferry V', 'Lavada Metz', 'traditional', '480', NULL, 0, 59, 'Quas beatae et magnam quasi sunt repellendus eum veritatis.'),
(7, 'Omnis voluptatem.', '', '7261', 'Derick Hilpert Sr.', 'Myah Metz', 'traditional', '460', NULL, 0, 70, ''),
(8, 'Qui voluptas.', 'Iusto quasi quasi eveniet adipisci est doloremque.', '7171', 'Chloe Nitzsche', 'Beryl Roob PhD', 'traditional', '810', NULL, 0, 88, 'Sint explicabo sunt quis expedita aut earum tempore itaque nemo sequi enim officiis.'),
(9, 'At nemo aut.', 'Quis similique nihil ea eos debitis fugit ut neque perspiciatis et vel minus asperiores.', '1590', 'Prince Kuhic', 'Mr. Edwardo Barrows I', 'traditional', '610', NULL, 1, 6, 'Sed quis ipsam exercitationem voluptatem hic a non aut sequi sit voluptates.'),
(10, 'Corporis.', 'Magni ut quo hic dolorem a quod ipsam veritatis sunt.', '6867', 'Magnolia Gottlieb', 'Kurt Balistreri', 'traditional', '960', NULL, 0, 81, ''),
(11, 'Eligendi sed.', 'Soluta ut perspiciatis voluptates qui voluptas quod ut perferendis.', '6605', 'Myriam Altenwerth', 'Prof. Lyric Wiegand', 'traditional', '970', NULL, 1, 62, 'Aspernatur molestiae mollitia voluptatem facilis voluptas cum quo debitis dolorem fugit dolor laborum vel non ut.'),
(12, 'Rerum aut vel.', '', '3702', 'Dr. Gabrielle Streich II', 'Dejah Quitzon', 'traditional', '740', NULL, 0, 51, ''),
(13, 'Id ipsa.', 'Aperiam voluptatem numquam libero dolorem autem doloremque rem optio.', '4545', 'Lenna Trantow Sr.', 'Giovanny Ledner', 'traditional', '400', NULL, 0, 13, ''),
(14, 'Rerum qui.', 'Ipsam eum dolore blanditiis explicabo rem qui fuga at repellendus consequatur.', '3973', 'Karine Hoppe', 'Helen Hill I', 'traditional', '290', NULL, 1, 61, ''),
(15, 'Voluptas eum ipsa.', '', '9537', 'Eleanore Stroman MD', 'Dr. Ofelia Predovic', 'traditional', '620', NULL, 0, 55, 'Autem mollitia earum eaque minima aliquam rem.'),
(16, 'Optio.', '', '6609', 'Orin McGlynn', 'Else Hirthe', 'traditional', '80', NULL, 1, 82, 'Est perspiciatis cupiditate dolores in id earum deserunt expedita dignissimos doloremque laudantium qui optio molestiae quis ex est.'),
(17, 'Beatae sint.', 'Accusantium molestiae dolorem aut quo fuga et nam et recusandae dolorem assumenda.', '1591', 'Morris Conroy', 'Alexa Abshire', 'traditional', '310', NULL, 1, 11, ''),
(18, 'Non.', 'Placeat illum et harum corporis omnis molestias nam eum at voluptates ea earum voluptatem fugiat quidem soluta non.', '3884', 'Anastacio Lind III', 'Miss Micaela Gottlieb V', 'traditional', '230', NULL, 0, 59, 'Aut consequatur exercitationem nostrum laudantium vitae labore et aut iusto eum quo est ex porro impedit aperiam.'),
(19, 'Rerum deleniti ullam.', 'Est aut voluptates eius earum soluta voluptas quas aut autem consequatur numquam vero earum.', '6402', 'Lorenz Ernser', 'Sister Auer', 'traditional', '860', NULL, 1, 42, 'Qui porro repellat quam et tempore omnis vero quis ad officiis libero non ducimus.'),
(20, 'Quisquam.', 'Dignissimos eum aliquam qui voluptatem porro qui.', '6923', 'Zachary Bednar', 'Alisha Fadel Jr.', 'traditional', '110', NULL, 0, 59, ''),
(21, 'Vero.', '', '7056', 'Mackenzie Ledner', 'Meredith Jast II', 'traditional', '600', NULL, 0, 49, 'Sed quod quas qui omnis perspiciatis autem.'),
(22, 'Voluptatem.', 'Maiores non eveniet modi accusamus deserunt at maxime quo quis in sit et voluptatum tempore dolorem ipsam.', '7547', 'Jazlyn Schowalter DVM', 'Prof. Howell Mueller', 'traditional', '530', NULL, 1, 28, ''),
(23, 'Recusandae.', 'Aliquid incidunt est fugiat ut voluptas quos ut alias iure velit asperiores omnis.', '6550', 'Madelynn Terry MD', 'Leonel Yost', 'traditional', '420', NULL, 1, 69, ''),
(24, 'Ipsum maiores quia.', '', '2104', 'Baby Schmidt', 'Miss Alexane Langworth II', 'traditional', '620', NULL, 0, 52, ''),
(25, 'Et hic hic.', '', '3518', 'Rey Swift PhD', 'Dr. Nettie Runolfsson IV', 'traditional', '970', NULL, 0, 21, ''),
(26, 'Illo eveniet.', 'Velit aspernatur corrupti quis molestias ducimus numquam optio fugit ut tempore et voluptatum molestiae accusantium dolor aut.', '2691', 'Aditya Gutmann', 'Kendra Carter', 'traditional', '910', NULL, 0, 97, 'Quia voluptas quia vero possimus cumque totam quidem error tenetur enim ut iste explicabo quam veritatis animi autem aut.'),
(27, 'Accusantium et ullam.', '', '8372', 'Kailyn Cassin', 'Dr. Jordan Armstrong DDS', 'traditional', '220', NULL, 0, 22, ''),
(28, 'Atque rerum.', 'Ducimus suscipit est dolor non non cupiditate nam velit perspiciatis labore accusamus.', '6283', 'Althea Kris DVM', 'Prof. Melany Wiegand', 'traditional', '650', NULL, 1, 33, 'Ut voluptas voluptatem autem dicta unde nisi voluptas neque in eum numquam eligendi.'),
(29, 'Commodi excepturi.', 'Nostrum omnis provident sed alias sit sit sit molestiae nam assumenda.', '3535', 'Mrs. Melyssa Reynolds', 'Quentin Effertz', 'traditional', '570', NULL, 1, 68, ''),
(30, 'Repellat distinctio expedita.', '', '7179', 'Consuelo Schuster I', 'Madelyn Wehner', 'traditional', '840', NULL, 0, 32, 'Repudiandae quia dolore quaerat soluta quia ut eum suscipit sequi at autem.'),
(31, 'Aut nesciunt.', '', '5510', 'Lou Runte', 'Maida Mueller', 'traditional', '960', NULL, 0, 31, 'Nostrum odio ab aut ut odio eos dolores quia eveniet non fugiat assumenda qui minus quae.'),
(32, 'Pariatur.', 'Et rerum est quia dolore perferendis est reprehenderit voluptatem quam dolorum laboriosam labore totam odit debitis nulla nisi.', '3634', 'Newell Boyer', 'Roberto Buckridge', 'traditional', '830', NULL, 0, 28, 'Vitae quaerat ut a animi aut soluta impedit autem labore iure maxime nesciunt.'),
(33, 'Recusandae.', 'Est nihil quia totam facere et consectetur eos qui illo dolore omnis.', '7756', 'Lafayette Klocko II', 'Kylie Kunde', 'traditional', '740', NULL, 1, 12, 'Error non aut sint omnis modi ratione magni.'),
(34, 'Expedita aliquam.', '', '7342', 'Name Frami PhD', 'Mr. Zack Corkery', 'traditional', '780', NULL, 0, 95, 'Quis quam corporis mollitia quam est dolorem aperiam placeat ut.'),
(35, 'Dolorum enim.', '', '4115', 'Prof. Erick Boyle V', 'Clemmie Hegmann', 'traditional', '810', NULL, 0, 81, 'Quas magnam consequuntur atque eos est.');

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
(1, 'Veniam ad. Class', 2, 3, '[\"38\",\"40\",\"25\",\"28\",\"34\",\"26\",\"30\",\"31\"]', '[\"2\",\"5\",\"6\",\"7\",\"9\",\"8\"]'),
(2, 'Quidem. Class', 2, 2, '[\"44\",\"31\",\"32\",\"43\",\"29\",\"36\",\"42\",\"39\",\"25\",\"26\",\"41\",\"30\",\"34\",\"33\"]', '[\"9\",\"6\",\"5\"]'),
(3, 'Dolores. Class', 2, 2, '[\"32\",\"30\",\"40\",\"35\",\"43\",\"26\",\"39\"]', '[\"3\"]'),
(4, 'Et inventore. Class', 2, 4, '[\"32\",\"42\",\"34\",\"44\",\"25\",\"26\",\"43\",\"37\",\"39\"]', '[\"1\",\"4\",\"6\",\"9\",\"8\"]'),
(5, 'Nobis possimus. Class', 2, 4, '[\"40\",\"41\",\"39\",\"30\",\"34\",\"35\",\"28\",\"27\",\"24\",\"44\",\"26\"]', '[\"8\",\"2\"]'),
(6, 'Qui. Class', 1, 3, '[\"38\",\"30\",\"43\",\"33\",\"29\",\"32\",\"41\"]', '[\"8\",\"3\",\"6\",\"4\",\"2\"]'),
(7, 'Recusandae vel. Class', 1, 1, '[\"36\",\"33\",\"34\",\"32\",\"39\",\"43\",\"37\",\"35\"]', '[\"3\"]'),
(8, 'Hic dicta. Class', 2, 3, '[\"43\",\"42\",\"36\",\"38\",\"26\",\"27\",\"30\"]', '[\"2\",\"8\",\"5\",\"3\",\"10\",\"7\"]'),
(9, 'Commodi. Class', 1, 1, '[\"26\",\"40\",\"28\",\"36\",\"34\",\"41\",\"44\",\"27\",\"33\",\"25\"]', '[\"5\",\"10\",\"1\",\"6\",\"7\"]'),
(10, 'Architecto rem. Class', 2, 4, '[\"37\",\"43\",\"41\",\"27\",\"38\",\"34\",\"32\",\"25\",\"24\",\"36\"]', '[\"8\",\"10\",\"6\",\"4\",\"5\",\"1\"]'),
(11, 'Odit. Class', 1, 4, '[\"41\",\"29\",\"39\",\"25\",\"28\",\"34\",\"24\",\"32\",\"31\",\"33\",\"40\",\"37\"]', '[\"5\",\"9\",\"4\"]'),
(12, 'Voluptates. Class', 2, 3, '[\"24\",\"34\",\"42\",\"37\",\"27\",\"44\"]', '[\"7\"]'),
(13, 'Quia aut. Class', 2, 2, '[\"36\",\"42\",\"29\",\"24\",\"41\",\"32\",\"39\",\"44\"]', '[\"2\"]'),
(14, 'Aperiam. Class', 1, 2, '[\"25\",\"37\",\"40\",\"36\",\"34\",\"32\",\"35\",\"27\",\"39\",\"41\"]', '[\"2\",\"5\",\"6\",\"8\"]'),
(15, 'Ducimus. Class', 2, 1, '[\"31\",\"34\",\"33\",\"30\",\"42\",\"38\",\"40\",\"32\"]', '[\"4\",\"9\",\"5\",\"7\"]');

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
(1, 'Exercitationem eveniet ex dicta.', 'Aut cupiditate minus autem libero sunt voluptatem consequuntur pariatur asperiores ea et culpa est autem nam neque.', 'teacher', 'Quae repellendus.', '', 0, '1565648637'),
(2, 'Sint nisi nam.', 'Numquam impedit quod libero fuga libero iure tempora odio.', 'students', 'Qui.', '', 0, '1566167037'),
(3, 'Reiciendis et dicta.', 'Dolor fugit sit eum nihil dolore odit esse.', 'all', 'Velit.', '', 0, '1565130237'),
(4, 'Ratione quia voluptas.', 'Sit et quia laborum aut nihil et.', 'teacher', 'Non quod.', '', 0, '1564007037'),
(5, 'At voluptatem.', 'Temporibus laboriosam voluptatem non corporis doloribus.', 'students', 'Totam.', '', 1, '1564698237'),
(6, 'Sint quia voluptatibus tempore.', 'Inventore dolorem porro nihil et alias voluptas.', 'students', 'Magni.', '', 0, '1566167037'),
(7, 'Ullam illum praesentium.', 'Enim est tenetur dolores quo adipisci voluptatem et expedita tempora.', 'all', 'Quo.', '', 0, '1565994237'),
(8, 'Corrupti architecto.', 'Quis modi voluptatem et sit minus magni eveniet ut.', 'teacher', 'Alias.', '', 1, '1564698237'),
(9, 'Qui quia impedit.', 'Voluptates maxime est id sapiente voluptates eum dolor.', 'teacher', 'Odio aliquam.', '', 0, '1565907837'),
(10, 'Quo perferendis est repellendus.', 'Maxime aut ipsum natus facere quia distinctio sequi aut at.', 'parents', 'Quia dolor.', '', 1, '1564179837'),
(11, 'test event', 'test event', 'all', 'test place', '', 1, '1565029800');

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

--
-- Dumping data for table `exams_list`
--

INSERT INTO `exams_list` (`id`, `examTitle`, `examDescription`, `examDate`, `examEndDate`, `examAcYear`, `examClasses`, `examMarksheetColumns`, `examSchedule`) VALUES
(1, 'Ea voluptas.', 'Sit nam reiciendis ea iusto nisi molestias vitae vitae similique.', '1564611850', 1565303050, 2, '[\"10\"]', '', ''),
(2, 'Suscipit nemo.', '', '1564525450', 1564871050, 2, '[\"3\"]', '', ''),
(3, 'Et corporis.', '', '1565735050', 1564439050, 2, '[\"11\",\"9\"]', '', ''),
(4, 'Provident laboriosam.', '', '1565735050', 1564784650, 1, '[\"15\",\"3\",\"1\"]', '', ''),
(5, 'Aut nihil.', 'Sapiente sequi esse laudantium maiores praesentium tempore necessitatibus.', '1566339850', 1564525450, 1, '[\"14\",\"4\",\"13\"]', '', ''),
(6, 'A.', '', '1564525450', 1565821450, 2, '[\"7\"]', '', ''),
(7, 'In.', '', '1565216650', 1564266250, 2, '[\"7\",\"13\"]', '', ''),
(8, 'Molestias atque.', '', '1566167050', 1565216650, 2, '[\"6\",\"2\",\"13\"]', '', ''),
(9, 'Omnis autem.', 'Ut doloribus molestias eos ab vitae earum aut natus corrupti.', '1564266250', 1565994250, 1, '[\"10\",\"4\"]', '', ''),
(10, 'Sed repellendus.', '', '1566167050', 1564525450, 1, '[\"15\"]', '', ''),
(11, 'Test exam', 'Test exam', '1564597800', 1565980200, 1, '[\"6\",\"7\",\"11\"]', '[]', '[{\"subject\":\"1\",\"stDate\":1564597800,\"start_time\":\"11:11:11\",\"end_time\":\"00:11:11\"}]');

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

--
-- Dumping data for table `exam_marks`
--

INSERT INTO `exam_marks` (`id`, `examMark`, `totalMarks`, `markComments`, `examId`, `classId`, `subjectId`, `studentId`) VALUES
(1, '\"\"', '150', '', 11, 6, 2, 61),
(2, '\"\"', '555', '', 11, 6, 2, 56);

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
(1, 'Quibusdam numquam.', 'Hic voluptas voluptate explicabo.', '', '1565043846', 1564525446, 0, '[\"12\",\"11\",\"10\"]', '[\"58\",\"22\",\"2\"]', '', 10, 29),
(2, 'Sit molestiae.', 'Molestias ratione facere incidunt.', '', '1565043846', 1564093446, 0, '[\"2\",\"11\"]', '[\"58\",\"8\"]', '', 9, 38),
(3, 'Iure quae.', 'Ratione error aliquid.', '', '1565043846', 1565994246, 0, '[\"1\",\"15\"]', '[\"59\",\"3\",\"20\"]', '', 10, 27),
(4, 'Aut commodi qui.', 'Culpa molestiae corrupti exercitationem.', '', '1565043846', 1564266246, 0, '[\"7\"]', '[\"42\",\"38\"]', '', 3, 44),
(5, 'Sint iusto.', 'Eos est omnis dolor dolorum nostrum quae ducimus laudantium.', '', '1565043846', 1563747846, 0, '[\"4\"]', '[\"59\",\"2\"]', '', 6, 29),
(6, 'Ipsum voluptatibus exercitationem.', 'Ipsa esse et quas.', '', '1565043846', 1563747846, 0, '[\"6\"]', '[\"21\"]', '', 2, 30),
(7, 'Magni eum sit.', 'Numquam possimus fugit dolore.', '', '1565043846', 1565735046, 0, '[\"7\",\"13\"]', '[\"21\",\"31\"]', '', 9, 31),
(8, 'Cupiditate temporibus.', 'Ipsum officia aut modi nam quo tempora.', '', '1565043847', 1564266247, 0, '[\"8\",\"5\"]', '[\"41\",\"18\"]', '', 10, 27),
(9, 'Quasi facere.', '', '', '1565043847', 1563747847, 0, '[\"1\"]', '[\"23\"]', '', 1, 26),
(10, 'Praesentium voluptatem rerum.', '', '', '1565043847', 1563747847, 0, '[\"6\",\"9\",\"4\"]', '[\"40\"]', '', 1, 24),
(11, 'Eius consequatur.', 'Illo ab est odio.', '', '1565043847', 1566080647, 0, '[\"15\",\"8\"]', '[\"42\"]', '', 10, 26),
(12, 'Doloribus beatae.', 'Occaecati ducimus sit placeat.', '', '1565043847', 1565735047, 0, '[\"8\"]', '[\"28\",\"36\"]', '', 1, 26),
(13, 'Voluptatibus ullam.', 'Dignissimos enim alias rem quis explicabo itaque.', '', '1565043847', 1566339847, 0, '[\"12\"]', '[\"55\"]', '', 1, 24),
(14, 'Fugit tenetur.', '', '', '1565043847', 1565994247, 0, '[\"13\",\"12\",\"15\"]', '[\"44\",\"13\",\"43\"]', '', 4, 28),
(15, 'Non impedit ullam.', 'Quae consequatur neque quod.', '', '1565043847', 1564784647, 0, '[\"2\",\"9\"]', '[\"11\"]', '', 7, 30);

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
(1, 'Prof. Parker Koch', 'tempore', 'Aspernatur voluptatem quos veritatis distinctio.', '1565043838', 'Mrs. Willow Barton DDS'),
(2, 'Dr. Bridgette Price', 'id', 'Iure autem consequuntur nostrum.', '1565043838', 'Edmond Glover'),
(3, 'Bradly Muller', 'sit', 'Sit rem fugit corporis ipsam et voluptates molestiae omnis.', '1565043838', 'Prof. Connie Nicolas'),
(4, 'Prof. Cody Hoppe', 'cupiditate', 'Delectus quam esse omnis quia modi voluptatibus.', '1565043838', 'Dr. Kadin Kassulke III'),
(5, 'Jany Pfeffer', 'aperiam', 'Quia aliquam facere expedita.', '1565043838', 'Jesse Torp'),
(6, 'Gavin Harber', 'provident', 'Dignissimos modi tempore id dolores ex.', '1565043838', 'Prof. Marcus Ledner V'),
(7, 'Malvina Sipes', 'hic', 'Nam tenetur provident aliquam veritatis enim.', '1565043838', 'Marlee Lemke'),
(8, 'Tatyana Feeney', 'impedit', 'Nisi ex repellendus temporibus sed occaecati dignissimos repudiandae sit.', '1565043838', 'Katelin Turcotte'),
(9, 'Lavina Zemlak Jr.', 'omnis', 'Id et doloremque repellendus rerum incidunt non.', '1565043838', 'Alda Cruickshank'),
(10, 'Grady Walsh', 'nisi', 'Error et at qui aliquid.', '1565043838', 'Roberto Herman'),
(11, 'Kelly Brakus', 'maiores', 'Architecto voluptate omnis aut blanditiis nam sed nisi omnis.', '1565043838', 'Dr. Wilfrid Homenick'),
(12, 'Tillman Feest', 'corporis', 'Explicabo ipsa laudantium sit quis dicta similique quia modi.', '1565043838', 'Prof. Orville McLaughlin'),
(13, 'Ernestina Hermiston', 'impedit', 'Perspiciatis rerum occaecati.', '1565043838', 'Stevie Mohr'),
(14, 'Maida Treutel', 'et', 'Nostrum nisi quas et quia.', '1565043838', 'Cheyenne Ankunding'),
(15, 'Braden Gibson', 'neque', 'Necessitatibus nobis et corrupti at maxime.', '1565043838', 'Erling Senger'),
(16, 'Gustave Parker', 'laborum', 'Ea magni tempora velit et sapiente omnis.', '1565043838', 'Alena Hermann'),
(17, 'Sasha Doyle DVM', 'rerum', 'Commodi aut enim et et a officiis.', '1565043838', 'Audrey Hahn'),
(18, 'Ms. Ernestina Stiedemann', 'quidem', 'Expedita quibusdam eos delectus et.', '1565043838', 'Treva Beer'),
(19, 'Alisha Hagenes', 'odio', 'Inventore culpa autem rerum quia magni quo nobis officiis.', '1565043838', 'Arvid Schaden'),
(20, 'Mrs. Anissa Cremin', 'quas', 'Aliquam autem dolor et quisquam aut ut consequuntur.', '1565043838', 'Kayley Lebsack'),
(21, 'Charity Grimes', 'nam', 'Nesciunt pariatur aspernatur eaque molestiae.', '1565043838', 'Araceli Rogahn'),
(22, 'Prof. Jerrell Klein I', 'deserunt', 'Odit qui magnam voluptate aut.', '1565043838', 'Mr. August Rosenbaum DDS'),
(23, 'Dena Runte', 'ipsam', 'Labore dolor provident molestiae maxime.', '1565043838', 'Katlynn Lebsack'),
(24, 'Fidel Wunsch', 'iusto', 'Magnam et libero aut explicabo accusantium odio.', '1565043838', 'Mr. Hobart Cronin'),
(25, 'Erwin Schiller', 'veniam', 'Fuga eos quo aspernatur praesentium reprehenderit sequi iste dolorem.', '1565043838', 'Monserrat Will'),
(26, 'Prof. Kyleigh Maggio Jr.', 'eum', 'Sit et maxime sit odio.', '1565043838', 'Alexanne Langworth'),
(27, 'Mr. Avery Jones', 'quis', 'Odit esse doloribus sunt magni laborum.', '1565043838', 'Dr. Greg Heidenreich'),
(28, 'Ernest Botsford', 'dolorem', 'Aut excepturi vitae doloribus delectus.', '1565043838', 'Mrs. Kyra Hirthe Jr.'),
(29, 'Chad McDermott', 'harum', 'Nam eveniet dolorum nisi sed aut est quibusdam fugiat corporis architecto.', '1565043838', 'Colten Leffler'),
(30, 'Eino Schroeder', 'animi', 'Accusantium et possimus est nesciunt est.', '1565043838', 'Raheem Koepp III'),
(31, 'Prof. Velva Jacobson', 'consequatur', 'Qui sint maxime aut amet dolores ut sit laborum.', '1565043838', 'Rozella Reynolds MD'),
(32, 'Filomena Murazik', 'dolores', 'Vitae corporis laudantium sint numquam quis et illum velit.', '1565043838', 'Kristopher Kris V'),
(33, 'Zion Beatty', 'consequatur', 'Voluptatum libero labore et unde quasi.', '1565043838', 'Mr. Dedric Kassulke III'),
(34, 'Ford Zieme DVM', 'vel', 'Aliquid dolorem perferendis odit corporis unde et repellat debitis.', '1565043838', 'Josh Wuckert'),
(35, 'Lera Cormier DVM', 'sed', 'Vero et dolore sit natus magnam earum velit ut qui.', '1565043838', 'Garrick Satterfield'),
(36, 'Akeem Littel', 'quia', 'Et recusandae qui voluptates deleniti.', '1565043838', 'Alvina Leuschke'),
(37, 'Demond Smitham V', 'ut', 'Accusamus vero quisquam eaque.', '1565043838', 'Mrs. Alysa O\'Keefe Jr.'),
(38, 'Kurt Johnston', 'eum', 'Excepturi necessitatibus suscipit et.', '1565043838', 'Carmelo Bosco MD'),
(39, 'Tyreek Kohler', 'id', 'Facilis ipsa eaque.', '1565043838', 'Antone Hill DDS'),
(40, 'Isobel Bergnaum', 'ipsa', 'Aspernatur temporibus quia dolores deserunt laboriosam deserunt facere qui.', '1565043838', 'Joan Stanton'),
(41, 'Tyrique Heathcote', 'dolorum', 'Laudantium sunt id et et voluptatem porro.', '1565043838', 'Miss Rosa Cronin'),
(42, 'Lori Trantow', 'quaerat', 'Maxime consequuntur accusantium reprehenderit.', '1565043838', 'Chanelle Lynch'),
(43, 'Dr. Rhiannon Krajcik PhD', 'quae', 'Quasi laudantium aut itaque optio vitae cum qui non aut aut.', '1565043838', 'Carrie Bergnaum'),
(44, 'Ferne Schultz Sr.', 'nam', 'Animi tempora ratione quo eum maiores officia eveniet eos sint et.', '1565043838', 'Dr. Mohamed Mitchell I'),
(45, 'Shayne Gaylord', 'nulla', 'Necessitatibus autem culpa odit voluptatem facilis.', '1565043838', 'Gina Murazik'),
(46, 'Gregg Ziemann', 'porro', 'Quaerat qui est doloribus sit voluptas sapiente.', '1565043838', 'Danny Yost'),
(47, 'Miss Nikita Hamill', 'architecto', 'Sed recusandae voluptas quia molestiae dolorem.', '1565043838', 'Susan Hansen'),
(48, 'Dr. Aliyah Franecki PhD', 'voluptas', 'Quo corrupti iure ut et.', '1565043838', 'Daphney Schinner'),
(49, 'Chyna Schumm', 'est', 'Sit odit sint itaque est culpa laborum.', '1565043838', 'Cierra Stamm'),
(50, 'Lyda Hartmann', 'molestias', 'Cum fugiat enim sit consequatur ab totam.', '1565043838', 'Prof. Kylie Kilback');

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

--
-- Dumping data for table `media_items`
--

INSERT INTO `media_items` (`id`, `albumId`, `mediaType`, `mediaURL`, `mediaURLThumb`, `mediaTitle`, `mediaDescription`, `mediaDate`) VALUES
(1, 0, 0, 'media_5d488778647ad.JPG', NULL, 'test', 'test', 1565034360),
(2, 0, 0, 'media_5d488828a8dbf.jpg', NULL, 'asd asdf dfh gh', 'esrt sfg sdgf', 1565034536),
(3, 0, 0, 'media_5d48883b9da63.jpg', NULL, 'wow test', 'wwwww', 1565034555);

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
(1, 'Test message for parents', '1565091682', 0, 1, 1, 1, 3),
(2, 'Test message for parents', '1565091682', 0, 2, 3, 1, 3),
(3, 'Test message for parents', '1565091682', 0, 3, 1, 1, 8),
(4, 'Test message for parents', '1565091682', 0, 4, 8, 1, 8),
(5, 'Test message for parents', '1565091682', 0, 5, 1, 1, 17),
(6, 'Test message for parents', '1565091682', 0, 6, 17, 1, 17),
(7, 'Test message for parents', '1565091683', 0, 7, 1, 1, 18),
(8, 'Test message for parents', '1565091683', 0, 8, 18, 1, 18),
(9, 'Test message for parents', '1565091683', 0, 9, 1, 1, 76),
(10, 'Test message for parents', '1565091683', 0, 10, 76, 1, 76),
(11, 'Test message for parents', '1565091683', 0, 11, 1, 1, 77),
(12, 'Test message for parents', '1565091683', 0, 12, 77, 1, 77),
(13, 'Test message for parents', '1565091683', 0, 13, 1, 1, 78),
(14, 'Test message for parents', '1565091683', 0, 14, 78, 1, 78),
(15, 'Test message for parents', '1565091683', 0, 15, 1, 1, 79),
(16, 'Test message for parents', '1565091683', 0, 16, 79, 1, 79),
(17, 'Test message for parents', '1565091683', 0, 17, 1, 1, 80),
(18, 'Test message for parents', '1565091683', 0, 18, 80, 1, 80),
(19, 'Test message for parents', '1565091684', 0, 19, 1, 1, 81),
(20, 'Test message for parents', '1565091684', 0, 20, 81, 1, 81),
(21, 'Test message for parents', '1565091684', 0, 21, 1, 1, 82),
(22, 'Test message for parents', '1565091684', 0, 22, 82, 1, 82),
(23, 'Test message for parents', '1565091684', 0, 23, 1, 1, 83),
(24, 'Test message for parents', '1565091684', 0, 24, 83, 1, 83),
(25, 'Test message for parents', '1565091684', 0, 25, 1, 1, 84),
(26, 'Test message for parents', '1565091684', 0, 26, 84, 1, 84),
(27, 'Test message for parents', '1565091684', 0, 27, 1, 1, 85),
(28, 'Test message for parents', '1565091684', 0, 28, 85, 1, 85),
(29, 'Test message for parents', '1565091684', 0, 29, 1, 1, 86),
(30, 'Test message for parents', '1565091684', 0, 30, 86, 1, 86),
(31, 'Test message for parents', '1565091684', 0, 31, 1, 1, 87),
(32, 'Test message for parents', '1565091684', 0, 32, 87, 1, 87),
(33, 'Test message for parents', '1565091684', 0, 33, 1, 1, 88),
(34, 'Test message for parents', '1565091684', 0, 34, 88, 1, 88),
(35, 'Test message for parents', '1565091684', 0, 35, 1, 1, 89),
(36, 'Test message for parents', '1565091684', 0, 36, 89, 1, 89),
(37, 'Test message for parents', '1565091684', 0, 37, 1, 1, 90),
(38, 'Test message for parents', '1565091684', 0, 38, 90, 1, 90),
(39, 'Test message for parents', '1565091684', 0, 39, 1, 1, 91),
(40, 'Test message for parents', '1565091684', 0, 40, 91, 1, 91),
(41, 'Test message for parents', '1565091684', 0, 41, 1, 1, 92),
(42, 'Test message for parents', '1565091684', 0, 42, 92, 1, 92),
(43, 'Test message for parents', '1565091684', 0, 43, 1, 1, 93),
(44, 'Test message for parents', '1565091684', 0, 44, 93, 1, 93),
(45, 'Test message for parents', '1565091684', 0, 45, 1, 1, 94),
(46, 'Test message for parents', '1565091684', 0, 46, 94, 1, 94),
(47, 'Test message for parents', '1565091684', 0, 47, 1, 1, 95),
(48, 'Test message for parents', '1565091684', 0, 48, 95, 1, 95),
(49, 'Test message for parents', '1565091684', 0, 49, 1, 1, 96),
(50, 'Test message for parents', '1565091684', 0, 50, 96, 1, 96),
(51, 'Helllllllo all', '1565098517', 1, 1, 1, 1, 3),
(52, 'Helllllllo all', '1565098517', 1, 2, 3, 1, 3),
(53, 'Helllllllo all', '1565098517', 1, 3, 1, 1, 8),
(54, 'Helllllllo all', '1565098517', 1, 4, 8, 1, 8),
(55, 'Helllllllo all', '1565098517', 1, 5, 1, 1, 17),
(56, 'Helllllllo all', '1565098517', 1, 6, 17, 1, 17),
(57, 'Helllllllo all', '1565098517', 1, 7, 1, 1, 18),
(58, 'Helllllllo all', '1565098517', 1, 8, 18, 1, 18),
(59, 'Helllllllo all', '1565098517', 1, 9, 1, 1, 76),
(60, 'Helllllllo all', '1565098517', 1, 10, 76, 1, 76),
(61, 'Helllllllo all', '1565098518', 1, 11, 1, 1, 77),
(62, 'Helllllllo all', '1565098518', 1, 12, 77, 1, 77),
(63, 'Helllllllo all', '1565098518', 1, 13, 1, 1, 78),
(64, 'Helllllllo all', '1565098518', 1, 14, 78, 1, 78),
(65, 'Helllllllo all', '1565098518', 1, 15, 1, 1, 79),
(66, 'Helllllllo all', '1565098518', 1, 16, 79, 1, 79),
(67, 'Helllllllo all', '1565098518', 1, 17, 1, 1, 80),
(68, 'Helllllllo all', '1565098518', 1, 18, 80, 1, 80),
(69, 'Helllllllo all', '1565098518', 1, 19, 1, 1, 81),
(70, 'Helllllllo all', '1565098518', 1, 20, 81, 1, 81),
(71, 'Helllllllo all', '1565098519', 1, 21, 1, 1, 82),
(72, 'Helllllllo all', '1565098519', 1, 22, 82, 1, 82),
(73, 'Helllllllo all', '1565098519', 1, 23, 1, 1, 83),
(74, 'Helllllllo all', '1565098519', 1, 24, 83, 1, 83),
(75, 'Helllllllo all', '1565098519', 1, 25, 1, 1, 84),
(76, 'Helllllllo all', '1565098519', 1, 26, 84, 1, 84),
(77, 'Helllllllo all', '1565098519', 1, 27, 1, 1, 85),
(78, 'Helllllllo all', '1565098519', 1, 28, 85, 1, 85),
(79, 'Helllllllo all', '1565098519', 1, 29, 1, 1, 86),
(80, 'Helllllllo all', '1565098519', 1, 30, 86, 1, 86),
(81, 'Helllllllo all', '1565098519', 1, 31, 1, 1, 87),
(82, 'Helllllllo all', '1565098519', 1, 32, 87, 1, 87),
(83, 'Helllllllo all', '1565098519', 1, 33, 1, 1, 88),
(84, 'Helllllllo all', '1565098519', 1, 34, 88, 1, 88),
(85, 'Helllllllo all', '1565098519', 1, 35, 1, 1, 89),
(86, 'Helllllllo all', '1565098519', 1, 36, 89, 1, 89),
(87, 'Helllllllo all', '1565098519', 1, 37, 1, 1, 90),
(88, 'Helllllllo all', '1565098520', 1, 38, 90, 1, 90),
(89, 'Helllllllo all', '1565098520', 1, 39, 1, 1, 91),
(90, 'Helllllllo all', '1565098520', 1, 40, 91, 1, 91),
(91, 'Helllllllo all', '1565098520', 1, 41, 1, 1, 92),
(92, 'Helllllllo all', '1565098520', 1, 42, 92, 1, 92),
(93, 'Helllllllo all', '1565098520', 1, 43, 1, 1, 93),
(94, 'Helllllllo all', '1565098520', 1, 44, 93, 1, 93),
(95, 'Helllllllo all', '1565098520', 1, 45, 1, 1, 94),
(96, 'Helllllllo all', '1565098520', 1, 46, 94, 1, 94),
(97, 'Helllllllo all', '1565098520', 1, 47, 1, 1, 95),
(98, 'Helllllllo all', '1565098520', 1, 48, 95, 1, 95),
(99, 'Helllllllo all', '1565098520', 1, 49, 1, 1, 96),
(100, 'Helllllllo all', '1565098520', 1, 50, 96, 1, 96),
(101, 'Hello man...', '1565098542', 1, 10, 76, 76, 1),
(102, 'Hello man...', '1565098542', 1, 10, 1, 76, 1),
(103, 'How are you', '1565098911', 1, 10, 76, 76, 1),
(104, 'How are you', '1565098911', 1, 10, 1, 76, 1);

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
(1, 'Helllllllo all', '1565098516', 0, 1, 1, 3),
(2, 'Helllllllo all', '1565098516', 1, 1, 3, 1),
(3, 'Helllllllo all', '1565098517', 0, 1, 1, 8),
(4, 'Helllllllo all', '1565098517', 1, 1, 8, 1),
(5, 'Helllllllo all', '1565098517', 0, 1, 1, 17),
(6, 'Helllllllo all', '1565098517', 1, 1, 17, 1),
(7, 'Helllllllo all', '1565098517', 0, 1, 1, 18),
(8, 'Helllllllo all', '1565098517', 1, 1, 18, 1),
(9, 'How are you', '1565098911', 0, 1, 1, 76),
(10, 'How are you', '1565098911', 0, 1, 76, 1),
(11, 'Helllllllo all', '1565098518', 0, 1, 1, 77),
(12, 'Helllllllo all', '1565098518', 1, 1, 77, 1),
(13, 'Helllllllo all', '1565098518', 0, 1, 1, 78),
(14, 'Helllllllo all', '1565098518', 1, 1, 78, 1),
(15, 'Helllllllo all', '1565098518', 0, 1, 1, 79),
(16, 'Helllllllo all', '1565098518', 1, 1, 79, 1),
(17, 'Helllllllo all', '1565098518', 0, 1, 1, 80),
(18, 'Helllllllo all', '1565098518', 1, 1, 80, 1),
(19, 'Helllllllo all', '1565098518', 0, 1, 1, 81),
(20, 'Helllllllo all', '1565098518', 1, 1, 81, 1),
(21, 'Helllllllo all', '1565098518', 0, 1, 1, 82),
(22, 'Helllllllo all', '1565098518', 1, 1, 82, 1),
(23, 'Helllllllo all', '1565098519', 0, 1, 1, 83),
(24, 'Helllllllo all', '1565098519', 1, 1, 83, 1),
(25, 'Helllllllo all', '1565098519', 0, 1, 1, 84),
(26, 'Helllllllo all', '1565098519', 1, 1, 84, 1),
(27, 'Helllllllo all', '1565098519', 0, 1, 1, 85),
(28, 'Helllllllo all', '1565098519', 1, 1, 85, 1),
(29, 'Helllllllo all', '1565098519', 0, 1, 1, 86),
(30, 'Helllllllo all', '1565098519', 1, 1, 86, 1),
(31, 'Helllllllo all', '1565098519', 0, 1, 1, 87),
(32, 'Helllllllo all', '1565098519', 1, 1, 87, 1),
(33, 'Helllllllo all', '1565098519', 0, 1, 1, 88),
(34, 'Helllllllo all', '1565098519', 1, 1, 88, 1),
(35, 'Helllllllo all', '1565098519', 0, 1, 1, 89),
(36, 'Helllllllo all', '1565098519', 1, 1, 89, 1),
(37, 'Helllllllo all', '1565098519', 0, 1, 1, 90),
(38, 'Helllllllo all', '1565098519', 1, 1, 90, 1),
(39, 'Helllllllo all', '1565098520', 0, 1, 1, 91),
(40, 'Helllllllo all', '1565098520', 1, 1, 91, 1),
(41, 'Helllllllo all', '1565098520', 0, 1, 1, 92),
(42, 'Helllllllo all', '1565098520', 1, 1, 92, 1),
(43, 'Helllllllo all', '1565098520', 0, 1, 1, 93),
(44, 'Helllllllo all', '1565098520', 1, 1, 93, 1),
(45, 'Helllllllo all', '1565098520', 0, 1, 1, 94),
(46, 'Helllllllo all', '1565098520', 1, 1, 94, 1),
(47, 'Helllllllo all', '1565098520', 0, 1, 1, 95),
(48, 'Helllllllo all', '1565098520', 1, 1, 95, 1),
(49, 'Helllllllo all', '1565098520', 0, 1, 1, 96),
(50, 'Helllllllo all', '1565098520', 1, 1, 96, 1);

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
(1, 'Kelsi Dooley', 'teachers', 'Provident cupiditate ab sed.', 1565043838, 'Kiel Howe MD'),
(2, 'Veronica Conn', 'students', 'Mollitia sequi quibusdam quae minus sed ratione dicta ut quia quae.', 1565043838, 'Merl Ebert'),
(3, 'Cielo Toy', 'teachers', 'Provident fugiat amet ut ipsa repudiandae.', 1565043838, 'Kayli Prosacco'),
(4, 'Estevan Kreiger', 'students', 'Quod vel deserunt atque voluptatem provident ipsa officiis.', 1565043838, 'Khalid Reinger'),
(5, 'Mellie Shields', 'parents', 'Eos eos laudantium eum.', 1565043838, 'Scarlett Mertz'),
(6, 'Citlalli Lockman Jr.', 'parents', 'Ducimus autem sint veritatis.', 1565043838, 'Mortimer Rutherford'),
(7, 'Myrl Littel', 'parents', 'Architecto impedit recusandae similique ut veritatis.', 1565043838, 'Maci Emmerich'),
(8, 'Georgette Zieme', 'teachers', 'Sequi rem et dolorum amet commodi sit.', 1565043838, 'Colleen Berge'),
(9, 'Aurelia Schowalter', 'employees', 'Consequatur impedit consequatur.', 1565043838, 'Dave Lind II'),
(10, 'Libby Kunde', 'students', 'Veniam ullam molestiae aut sit molestias et doloremque.', 1565043838, 'Mohammad Lakin'),
(11, 'Lowell Dooley', 'teachers', 'Et optio nam consectetur consectetur delectus sunt aliquam.', 1565043838, 'Prof. Cleo Dach II'),
(12, 'Elsa Veum III', 'employees', 'Omnis nostrum quo ut molestiae ut nisi sequi fuga natus.', 1565043838, 'Jo Ratke'),
(13, 'Mr. Darian Lockman II', 'teachers', 'Et iure id itaque est.', 1565043838, 'Melba Morissette IV'),
(14, 'Dr. Kayleigh Jakubowski', 'students', 'Nostrum sunt enim accusantium qui.', 1565043838, 'Taurean Schinner'),
(15, 'Ronaldo Kozey', 'employees', 'Ut vel et enim fugit quia.', 1565043838, 'Ronny Hansen'),
(16, 'Miss Lilla Volkman', 'students', 'Soluta quisquam inventore aliquam ut eum.', 1565043838, 'Cedrick Schowalter'),
(17, 'Deanna Lemke', 'teachers', 'Necessitatibus dolores eos vel est iure labore nesciunt aspernatur.', 1565043838, 'Lorenza Hand'),
(18, 'Reba Pagac', 'employees', 'Totam inventore quia voluptates enim.', 1565043838, 'Earnestine Emard MD'),
(19, 'Leslie Stamm', 'employees', 'Sit sint sed repellat.', 1565043838, 'Olin Marquardt'),
(20, 'Oscar Kessler', 'parents', 'Quia fugiat natus velit.', 1565043838, 'Lamar Ryan IV'),
(21, 'Nayeli Feeney', 'students', 'Est omnis officiis ad in.', 1565043838, 'Ashton Gutmann'),
(22, 'Miss Bernice Mann', 'parents', 'Ipsa voluptas labore perspiciatis laborum eos reprehenderit.', 1565043838, 'Jennings Bahringer'),
(23, 'Sydney Schiller', 'parents', 'Rerum assumenda est dolores totam adipisci sequi sint.', 1565043838, 'Allison Blanda'),
(24, 'Gregg Muller I', 'teachers', 'Molestiae fuga repudiandae dicta.', 1565043838, 'Dr. Asa Stark'),
(25, 'Raegan Kihn', 'employees', 'Ut odio voluptas officia itaque quia commodi sunt culpa.', 1565043838, 'Emily Gibson II'),
(26, 'Eliseo Blick', 'employees', 'Eos distinctio sint officiis officiis id.', 1565043838, 'Domenick Leannon'),
(27, 'Dr. Fredy Kuhn Jr.', 'teachers', 'Nam voluptatum sit id quia suscipit.', 1565043838, 'Dana Hintz'),
(28, 'Priscilla Gutmann', 'parents', 'Molestias culpa voluptatibus sed et velit et eos.', 1565043838, 'Otha Rippin'),
(29, 'Kelly Rath', 'teachers', 'Porro qui voluptas vel ipsam iure quidem libero sed.', 1565043838, 'Moshe Gerlach'),
(30, 'Antonette Corkery', 'teachers', 'Praesentium dolorem omnis in ea sapiente dolorum porro nisi.', 1565043838, 'Rosalinda Spencer V'),
(31, 'Miles Macejkovic', 'parents', 'Soluta omnis quis ut dolorem voluptatem fugit in officiis.', 1565043838, 'Prof. Hardy Corwin IV'),
(32, 'Leda Huels IV', 'employees', 'Ea sit porro rem aut quod magnam.', 1565043838, 'Glenna Koelpin PhD'),
(33, 'Dr. Mazie Walker', 'students', 'Et porro qui illo quam enim laborum.', 1565043838, 'Dawson Gusikowski'),
(34, 'Roy Konopelski', 'employees', 'Voluptas deserunt culpa saepe ut consectetur id ea alias.', 1565043838, 'Edmond Becker'),
(35, 'Franco Marvin', 'employees', 'Dignissimos possimus sed vitae unde a et quia a.', 1565043838, 'Ms. Karelle Schneider'),
(36, 'Arch Monahan', 'teachers', 'Rerum sint fugiat ducimus neque id natus.', 1565043838, 'Mr. Bruce Gibson'),
(37, 'Imelda Hayes', 'students', 'Quia autem asperiores deserunt at deleniti occaecati.', 1565043838, 'Moriah Watsica'),
(38, 'Jameson Emmerich', 'employees', 'Facilis vel aut ut rerum ad.', 1565043838, 'Prof. Isaiah White PhD'),
(39, 'Myrtie Bins', 'teachers', 'Ex suscipit nisi sapiente nihil quibusdam tempore quaerat.', 1565043838, 'Katarina Osinski'),
(40, 'Johnny Cummerata', 'students', 'Quo expedita vero maiores exercitationem quia officia rerum dolores.', 1565043838, 'Donato O\'Keefe III'),
(41, 'Dr. Norwood Ruecker', 'teachers', 'Et deleniti eaque accusantium voluptatem.', 1565043838, 'Ms. Chloe Graham Sr.'),
(42, 'Kiara Harvey', 'employees', 'Esse ut et molestias voluptatum consequuntur quia similique tenetur.', 1565043838, 'Mr. Hazel Keebler'),
(43, 'Miss Josefina Bruen', 'employees', 'Ipsam et facere placeat et ut quod ex tempora qui eos.', 1565043838, 'Osbaldo Gorczany'),
(44, 'Mr. Devante Ondricka DVM', 'employees', 'Accusantium et omnis sed velit voluptas alias.', 1565043838, 'Mr. Carter Jacobson III'),
(45, 'Dr. Braeden Corkery MD', 'teachers', 'Perspiciatis voluptatibus tempore.', 1565043838, 'Prof. Giovanni Cronin MD'),
(46, 'Laura Ankunding', 'parents', 'Occaecati quo et vero ipsa.', 1565043838, 'Rosanna Moen'),
(47, 'Pink Haley Jr.', 'students', 'Assumenda adipisci labore officia ut sit autem enim quis.', 1565043838, 'Prof. Harmony Towne'),
(48, 'Lurline Reichel', 'students', 'Dolorem error quibusdam ullam velit.', 1565043838, 'Mr. Archibald Macejkovic I'),
(49, 'August Pacocha', 'parents', 'Ea optio voluptas explicabo dolor.', 1565043838, 'Rosalind Weimann'),
(50, 'Milan Powlowski', 'teachers', 'Id eum animi aut eum enim veritatis quis.', 1565043838, 'Dayna Littel DVM');

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
(1, 'Id dolorem qui est perspiciatis.', 'Animi et facilis molestiae perspiciatis cumque enim sint sit.', 'teacher', 1565043837, '', 1, 1565043837),
(2, 'Provident dolorem animi dolore officiis expedita.', 'Voluptas perspiciatis voluptatem magni ex et ut nesciunt aut sit.', 'parents', 1565043837, '', 1, 1565043837),
(3, 'Occaecati aut ut molestiae consequuntur.', 'Non facere repellendus placeat corporis deleniti consequatur eius consequatur.', 'teacher', 1565043837, '', 1, 1565043837),
(4, 'Ipsam a et est dicta sit.', 'Dolorem unde et voluptatem sequi deserunt provident.', 'all', 1565043837, '', 1, 1565043837),
(5, 'Suscipit recusandae voluptate.', 'Distinctio quod voluptatem atque commodi ab sequi sit debitis.', 'teacher', 1565043837, '', 1, 1565043837),
(6, 'Voluptatibus est quia consequatur.', 'Rerum est incidunt quia cumque dolorem quas dolorum rerum sunt.', 'all', 1565043837, '', 0, 1565043837),
(7, 'Autem qui ratione.', 'Doloremque harum illo deserunt qui nostrum maxime reiciendis commodi ratione.', 'all', 1565043837, '', 1, 1565043837),
(8, 'Cum accusantium.', 'Nisi qui deleniti architecto atque repellat amet maxime.', 'parents', 1565043837, '', 0, 1565043837),
(9, 'Error ea et.', 'Ad at similique sed qui odit ab quis.', 'parents', 1565043837, '', 1, 1565043837),
(10, 'Non et aut esse adipisci.', 'Modi nemo sunt iste voluptatem est officia tenetur.', 'students', 1565043837, '', 1, 1565043837),
(11, 'Fugiat saepe eligendi.', 'Inventore quo itaque nihil et dolorem libero ad.', 'all', 1565043837, '', 0, 1565043837),
(12, 'Modi odit.', 'Quas natus mollitia eos consequatur similique eum eum laboriosam qui.', 'teacher', 1565043837, '', 0, 1565043837),
(13, 'Commodi magni tempore distinctio.', 'Dolorum alias ipsam et eos esse alias inventore magnam debitis.', 'students', 1565043837, '', 0, 1565043837),
(14, 'Quaerat temporibus vel.', 'Omnis accusantium facere ut suscipit dicta aut quas ipsum.', 'students', 1565043837, '', 1, 1565043837),
(15, 'Occaecati quae eum.', 'Illo tempore suscipit non cupiditate maxime dolorem voluptas magni a.', 'all', 1565043837, '', 1, 1565043837),
(16, 'Quaerat qui.', 'Qui sapiente est minus velit architecto tempore.', 'all', 1565043837, '', 0, 1565043837),
(17, 'Sed ea repellendus quo.', 'Mollitia officiis quasi minima dolor eius laborum.', 'students', 1565043837, '', 1, 1565043837),
(18, 'Eos aut id provident.', 'Maxime iure excepturi rerum esse soluta consectetur harum et id impedit.', 'all', 1565043837, '', 0, 1565043837),
(19, 'Quos sunt.', 'Voluptates alias optio ea qui provident ut ipsum reprehenderit quia ut.', 'students', 1565043837, '', 1, 1565043837),
(20, 'Ad vero.', 'Vel illo ut minus ad alias iure non.', 'students', 1565043837, '', 0, 1565043837);

-- --------------------------------------------------------

--
-- Table structure for table `notifications_mob_history`
--

CREATE TABLE `notifications_mob_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payload_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications_mob_history`
--

INSERT INTO `notifications_mob_history` (`id`, `name`, `value`, `user_id`, `date`, `type`, `payload_id`, `created_at`, `updated_at`) VALUES
(1, 'Autem voluptatem.', 'New event was set', 81, 1565648639, 'event', NULL, NULL, NULL),
(2, 'Est.', 'New home work is added', 94, 1565821439, 'homework', NULL, NULL, NULL),
(3, 'Veniam quo et.', 'New home work is added', 94, 1565389439, 'homework', NULL, NULL, NULL),
(4, 'Non voluptas cupiditate.', 'New event was set', 94, 1564611839, 'event', NULL, NULL, NULL),
(5, 'Eveniet.', 'New event was set', 85, 1564611839, 'event', NULL, NULL, NULL),
(6, 'Voluptas ut eos.', 'New event was set', 87, 1563834239, 'event', NULL, NULL, NULL),
(7, 'Impedit vel.', 'Attenndance for student: Mellie Haag is present', 83, 1566253439, 'attendance', NULL, NULL, NULL),
(8, 'Blanditiis nostrum laboriosam.', 'New home work is added', 77, 1564439039, 'homework', NULL, NULL, NULL),
(9, 'Quo sed quisquam.', 'New home work is added', 82, 1564957439, 'homework', NULL, NULL, NULL),
(10, 'Cupiditate.', 'New event was set', 95, 1565562239, 'event', NULL, NULL, NULL),
(11, 'Adipisci illum.', 'New event was set', 83, 1564266239, 'event', NULL, NULL, NULL),
(12, 'Suscipit.', 'New event was set', 91, 1565735039, 'event', NULL, NULL, NULL),
(13, 'Doloremque magnam.', 'New event was set', 94, 1565735039, 'event', NULL, NULL, NULL),
(14, 'Sunt rerum eaque.', 'New event was set', 79, 1564352639, 'event', NULL, NULL, NULL),
(15, 'Dolorum.', 'Attenndance for student: Mellie Haag is present', 83, 1564439039, 'attendance', NULL, NULL, NULL),
(16, 'Nulla dolorum voluptatem.', 'Attenndance for student: Mellie Haag is present', 92, 1564352639, 'attendance', NULL, NULL, NULL),
(17, 'Et animi quas.', 'New event was set', 81, 1565735039, 'event', NULL, NULL, NULL),
(18, 'Dolorem aperiam.', 'New event was set', 88, 1563920639, 'event', NULL, NULL, NULL),
(19, 'Autem rem.', 'Attenndance for student: Mellie Haag is present', 90, 1565475839, 'attendance', NULL, NULL, NULL),
(20, 'Quae ipsum.', 'New event was set', 81, 1564525439, 'event', NULL, NULL, NULL),
(21, 'Libero.', 'New home work is added', 79, 1564007039, 'homework', NULL, NULL, NULL),
(22, 'Perspiciatis.', 'Attenndance for student: Mellie Haag is present', 89, 1565130239, 'attendance', NULL, NULL, NULL),
(23, 'Placeat.', 'New event was set', 95, 1566167039, 'event', NULL, NULL, NULL),
(24, 'Quo.', 'New event was set', 92, 1565475839, 'event', NULL, NULL, NULL),
(25, 'Excepturi dolorem.', 'New home work is added', 82, 1565303039, 'homework', NULL, NULL, NULL),
(26, 'Corrupti consectetur.', 'New event was set', 80, 1564352639, 'event', NULL, NULL, NULL),
(27, 'Omnis pariatur.', 'Attenndance for student: Mellie Haag is present', 93, 1565303039, 'attendance', NULL, NULL, NULL),
(28, 'Sit deleniti deserunt.', 'Attenndance for student: Mellie Haag is present', 93, 1564871039, 'attendance', NULL, NULL, NULL),
(29, 'Id adipisci tempora.', 'Attenndance for student: Mellie Haag is present', 96, 1566167039, 'attendance', NULL, NULL, NULL),
(30, 'Dolor occaecati.', 'New home work is added', 81, 1564093439, 'homework', NULL, NULL, NULL),
(31, 'Deleniti.', 'New event was set', 79, 1565648639, 'event', NULL, NULL, NULL),
(32, 'Voluptas nisi.', 'New home work is added', 87, 1564439039, 'homework', NULL, NULL, NULL),
(33, 'Saepe.', 'Attenndance for student: Mellie Haag is present', 89, 1566339839, 'attendance', NULL, NULL, NULL),
(34, 'Repudiandae ut.', 'New event was set', 95, 1564871039, 'event', NULL, NULL, NULL),
(35, 'Sit dolorum.', 'New event was set', 84, 1564611839, 'event', NULL, NULL, NULL),
(36, 'Facere quia.', 'Attenndance for student: Mellie Haag is present', 81, 1565821439, 'attendance', NULL, NULL, NULL),
(37, 'Error non consequatur.', 'Attenndance for student: Mellie Haag is present', 86, 1565475839, 'attendance', NULL, NULL, NULL),
(38, 'Et qui.', 'New event was set', 89, 1564784639, 'event', NULL, NULL, NULL),
(39, 'Aut.', 'Attenndance for student: Mellie Haag is present', 92, 1564525439, 'attendance', NULL, NULL, NULL),
(40, 'Qui et inventore.', 'New event was set', 86, 1565389439, 'event', NULL, NULL, NULL),
(41, 'Laudantium.', 'New event was set', 84, 1566080639, 'event', NULL, NULL, NULL),
(42, 'Eum.', 'New event was set', 81, 1564093439, 'event', NULL, NULL, NULL),
(43, 'Eius.', 'New event was set', 79, 1566253439, 'event', NULL, NULL, NULL),
(44, 'Suscipit deleniti.', 'New event was set', 78, 1563920639, 'event', NULL, NULL, NULL),
(45, 'Consequatur ea.', 'Attenndance for student: Mellie Haag is present', 86, 1565735039, 'attendance', NULL, NULL, NULL),
(46, 'Modi aperiam.', 'New event was set', 77, 1565475839, 'event', NULL, NULL, NULL),
(47, 'Maiores sed.', 'New event was set', 77, 1565735039, 'event', NULL, NULL, NULL),
(48, 'Possimus non nihil.', 'New home work is added', 96, 1566167039, 'homework', NULL, NULL, NULL),
(49, 'Vel pariatur et.', 'New home work is added', 90, 1564007039, 'homework', NULL, NULL, NULL),
(50, 'Quas consequatur.', 'New event was set', 78, 1564784639, 'event', NULL, NULL, NULL),
(51, 'Repellat minima.', 'New home work is added', 92, 1565735039, 'homework', NULL, NULL, NULL),
(52, 'Laborum ut.', 'New home work is added', 91, 1566339839, 'homework', NULL, NULL, NULL),
(53, 'Sint quam.', 'Attenndance for student: Mellie Haag is present', 80, 1566080639, 'attendance', NULL, NULL, NULL),
(54, 'Enim tempora.', 'Attenndance for student: Mellie Haag is present', 95, 1565216639, 'attendance', NULL, NULL, NULL),
(55, 'Praesentium at.', 'New event was set', 81, 1564093439, 'event', NULL, NULL, NULL),
(56, 'Esse omnis voluptas.', 'New event was set', 95, 1566339839, 'event', NULL, NULL, NULL),
(57, 'Facere autem magni.', 'New event was set', 87, 1565648640, 'event', NULL, NULL, NULL),
(58, 'Et facere.', 'New home work is added', 93, 1564871040, 'homework', NULL, NULL, NULL),
(59, 'Placeat harum.', 'New home work is added', 85, 1564611840, 'homework', NULL, NULL, NULL),
(60, 'Hic et voluptatem.', 'Attenndance for student: Mellie Haag is present', 91, 1564266240, 'attendance', NULL, NULL, NULL),
(61, 'Et.', 'New home work is added', 81, 1565648640, 'homework', NULL, NULL, NULL),
(62, 'Sed eos perspiciatis.', 'New event was set', 93, 1566253440, 'event', NULL, NULL, NULL),
(63, 'Nemo necessitatibus.', 'New home work is added', 84, 1565907840, 'homework', NULL, NULL, NULL),
(64, 'Nulla tenetur.', 'Attenndance for student: Mellie Haag is present', 91, 1565303040, 'attendance', NULL, NULL, NULL),
(65, 'Sunt minima ea.', 'New event was set', 76, 1564439040, 'event', NULL, NULL, NULL),
(66, 'Quidem.', 'New event was set', 88, 1565303040, 'event', NULL, NULL, NULL),
(67, 'Recusandae cupiditate.', 'New event was set', 80, 1565648640, 'event', NULL, NULL, NULL),
(68, 'Voluptas itaque omnis.', 'Attenndance for student: Mellie Haag is present', 91, 1565216640, 'attendance', NULL, NULL, NULL),
(69, 'Excepturi facere.', 'New event was set', 78, 1563920640, 'event', NULL, NULL, NULL),
(70, 'Ut deserunt culpa.', 'New event was set', 80, 1563834240, 'event', NULL, NULL, NULL),
(71, 'Quasi voluptas.', 'New home work is added', 88, 1565648640, 'homework', NULL, NULL, NULL),
(72, 'Inventore rerum quia.', 'Attenndance for student: Mellie Haag is present', 79, 1564093440, 'attendance', NULL, NULL, NULL),
(73, 'Consequatur laudantium.', 'Attenndance for student: Mellie Haag is present', 78, 1564871040, 'attendance', NULL, NULL, NULL),
(74, 'Qui deleniti.', 'New home work is added', 81, 1564179840, 'homework', NULL, NULL, NULL),
(75, 'Sed.', 'New home work is added', 87, 1565130240, 'homework', NULL, NULL, NULL),
(76, 'Placeat laudantium.', 'Attenndance for student: Mellie Haag is present', 87, 1564007040, 'attendance', NULL, NULL, NULL),
(77, 'Praesentium.', 'New home work is added', 84, 1563920640, 'homework', NULL, NULL, NULL),
(78, 'Ipsum quae.', 'New home work is added', 84, 1565735040, 'homework', NULL, NULL, NULL),
(79, 'Reiciendis quia.', 'Attenndance for student: Mellie Haag is present', 84, 1566167040, 'attendance', NULL, NULL, NULL),
(80, 'Nihil aut consequatur.', 'New event was set', 83, 1563747840, 'event', NULL, NULL, NULL),
(81, 'Voluptatibus.', 'New event was set', 90, 1565821440, 'event', NULL, NULL, NULL),
(82, 'Mollitia odio.', 'New home work is added', 96, 1564871040, 'homework', NULL, NULL, NULL),
(83, 'Laborum odit.', 'New event was set', 96, 1564093440, 'event', NULL, NULL, NULL),
(84, 'Deserunt dignissimos incidunt.', 'Attenndance for student: Mellie Haag is present', 79, 1564352640, 'attendance', NULL, NULL, NULL),
(85, 'Nobis distinctio.', 'New event was set', 77, 1563747840, 'event', NULL, NULL, NULL),
(86, 'Adipisci fuga repudiandae.', 'Attenndance for student: Mellie Haag is present', 89, 1563747840, 'attendance', NULL, NULL, NULL),
(87, 'Eos id optio.', 'New event was set', 94, 1564871040, 'event', NULL, NULL, NULL),
(88, 'Sit perspiciatis temporibus.', 'New event was set', 86, 1565821440, 'event', NULL, NULL, NULL),
(89, 'Nam quis.', 'New home work is added', 92, 1565648640, 'homework', NULL, NULL, NULL),
(90, 'Quaerat quisquam.', 'New event was set', 91, 1565562240, 'event', NULL, NULL, NULL),
(91, 'Nulla soluta iure.', 'Attenndance for student: Mellie Haag is present', 87, 1564439040, 'attendance', NULL, NULL, NULL),
(92, 'Odit.', 'New home work is added', 95, 1564871040, 'homework', NULL, NULL, NULL),
(93, 'Velit mollitia ea.', 'New event was set', 77, 1566080640, 'event', NULL, NULL, NULL),
(94, 'Architecto.', 'Attenndance for student: Mellie Haag is present', 86, 1565821440, 'attendance', NULL, NULL, NULL),
(95, 'Laboriosam ut.', 'New event was set', 78, 1564611840, 'event', NULL, NULL, NULL),
(96, 'Et rem.', 'New home work is added', 87, 1565735040, 'homework', NULL, NULL, NULL),
(97, 'In praesentium.', 'New event was set', 92, 1564698240, 'event', NULL, NULL, NULL),
(98, 'Aut magni.', 'Attenndance for student: Mellie Haag is present', 87, 1566167040, 'attendance', NULL, NULL, NULL),
(99, 'Aut.', 'New event was set', 87, 1565389440, 'event', NULL, NULL, NULL),
(100, 'Et temporibus.', 'New home work is added', 82, 1565562240, 'homework', NULL, NULL, NULL),
(101, 'Alias.', 'New event was set', 91, 1564871040, 'event', NULL, NULL, NULL),
(102, 'Sint.', 'Attenndance for student: Mellie Haag is present', 81, 1565130240, 'attendance', NULL, NULL, NULL),
(103, 'Vero suscipit.', 'New event was set', 88, 1566080640, 'event', NULL, NULL, NULL),
(104, 'Assumenda accusantium.', 'New home work is added', 87, 1564007040, 'homework', NULL, NULL, NULL),
(105, 'Rerum.', 'Attenndance for student: Mellie Haag is present', 84, 1564525440, 'attendance', NULL, NULL, NULL),
(106, 'Ipsa nisi.', 'New event was set', 81, 1566080640, 'event', NULL, NULL, NULL),
(107, 'Ipsam laboriosam.', 'Attenndance for student: Mellie Haag is present', 82, 1564698241, 'attendance', NULL, NULL, NULL),
(108, 'Id.', 'Attenndance for student: Mellie Haag is present', 76, 1565821441, 'attendance', NULL, NULL, NULL),
(109, 'Iure accusantium.', 'Attenndance for student: Mellie Haag is present', 90, 1563747841, 'attendance', NULL, NULL, NULL),
(110, 'Totam dolor harum.', 'New home work is added', 93, 1564698241, 'homework', NULL, NULL, NULL),
(111, 'Necessitatibus.', 'New event was set', 86, 1563747841, 'event', NULL, NULL, NULL),
(112, 'Rerum nemo.', 'New event was set', 96, 1563920641, 'event', NULL, NULL, NULL),
(113, 'Quam sapiente.', 'Attenndance for student: Mellie Haag is present', 82, 1565907841, 'attendance', NULL, NULL, NULL),
(114, 'In omnis voluptas.', 'New home work is added', 85, 1564093441, 'homework', NULL, NULL, NULL),
(115, 'Voluptatem accusantium.', 'Attenndance for student: Mellie Haag is present', 96, 1564439042, 'attendance', NULL, NULL, NULL),
(116, 'Cumque voluptas.', 'Attenndance for student: Mellie Haag is present', 95, 1564179842, 'attendance', NULL, NULL, NULL),
(117, 'Amet.', 'New home work is added', 81, 1564007042, 'homework', NULL, NULL, NULL),
(118, 'Architecto.', 'New home work is added', 81, 1565216642, 'homework', NULL, NULL, NULL),
(119, 'Veniam explicabo.', 'Attenndance for student: Mellie Haag is present', 81, 1564179842, 'attendance', NULL, NULL, NULL),
(120, 'Et magnam voluptas.', 'New home work is added', 83, 1563920642, 'homework', NULL, NULL, NULL),
(121, 'Quia ipsum.', 'New event was set', 79, 1564352642, 'event', NULL, NULL, NULL),
(122, 'Vitae voluptatem.', 'New home work is added', 93, 1564352642, 'homework', NULL, NULL, NULL),
(123, 'Qui molestiae itaque.', 'New home work is added', 79, 1564266242, 'homework', NULL, NULL, NULL),
(124, 'Cupiditate dolorum.', 'New home work is added', 90, 1565475842, 'homework', NULL, NULL, NULL),
(125, 'Corrupti aliquam.', 'New event was set', 94, 1565994242, 'event', NULL, NULL, NULL),
(126, 'Et sed dolor.', 'New home work is added', 83, 1563920642, 'homework', NULL, NULL, NULL),
(127, 'Sapiente hic.', 'New home work is added', 84, 1564093442, 'homework', NULL, NULL, NULL),
(128, 'Delectus.', 'Attenndance for student: Mellie Haag is present', 87, 1564698242, 'attendance', NULL, NULL, NULL),
(129, 'Sapiente ut.', 'New home work is added', 81, 1566253442, 'homework', NULL, NULL, NULL),
(130, 'Voluptatem.', 'New event was set', 87, 1565130242, 'event', NULL, NULL, NULL),
(131, 'Pariatur ipsam.', 'New home work is added', 86, 1565735042, 'homework', NULL, NULL, NULL),
(132, 'Ut totam.', 'New home work is added', 80, 1566167042, 'homework', NULL, NULL, NULL),
(133, 'Perspiciatis iure.', 'Attenndance for student: Mellie Haag is present', 79, 1565735042, 'attendance', NULL, NULL, NULL),
(134, 'Est quisquam eius.', 'New event was set', 94, 1565303042, 'event', NULL, NULL, NULL),
(135, 'Recusandae.', 'New event was set', 87, 1566253442, 'event', NULL, NULL, NULL),
(136, 'Eius saepe et.', 'Attenndance for student: Mellie Haag is present', 94, 1563834242, 'attendance', NULL, NULL, NULL),
(137, 'Deserunt sunt.', 'New event was set', 90, 1565821442, 'event', NULL, NULL, NULL),
(138, 'Nam ullam.', 'Attenndance for student: Mellie Haag is present', 89, 1564871042, 'attendance', NULL, NULL, NULL),
(139, 'Nihil qui.', 'New event was set', 94, 1565994242, 'event', NULL, NULL, NULL),
(140, 'Qui aut id.', 'New home work is added', 76, 1564352642, 'homework', NULL, NULL, NULL),
(141, 'Maxime eius.', 'New home work is added', 79, 1565907842, 'homework', NULL, NULL, NULL),
(142, 'Aut molestias.', 'New event was set', 96, 1565303042, 'event', NULL, NULL, NULL),
(143, 'Est delectus.', 'New event was set', 92, 1564784642, 'event', NULL, NULL, NULL),
(144, 'Quam ipsam.', 'New event was set', 87, 1565216642, 'event', NULL, NULL, NULL),
(145, 'Dolore ut.', 'New home work is added', 94, 1565475842, 'homework', NULL, NULL, NULL),
(146, 'Quam mollitia voluptatem.', 'New event was set', 84, 1564525442, 'event', NULL, NULL, NULL),
(147, 'Aut.', 'New event was set', 88, 1565907842, 'event', NULL, NULL, NULL),
(148, 'Dolor.', 'New event was set', 92, 1564957442, 'event', NULL, NULL, NULL),
(149, 'Sit quidem rerum.', 'New event was set', 89, 1564179842, 'event', NULL, NULL, NULL),
(150, 'Doloribus eos.', 'New event was set', 81, 1566253442, 'event', NULL, NULL, NULL),
(151, 'Voluptatem.', 'New event was set', 87, 1565907842, 'event', NULL, NULL, NULL),
(152, 'Ipsa eum.', 'New event was set', 92, 1564698242, 'event', NULL, NULL, NULL),
(153, 'Quo.', 'New event was set', 94, 1564266242, 'event', NULL, NULL, NULL),
(154, 'Mollitia alias porro.', 'New event was set', 78, 1566253442, 'event', NULL, NULL, NULL),
(155, 'Incidunt quisquam voluptas.', 'Attenndance for student: Mellie Haag is present', 95, 1564352642, 'attendance', NULL, NULL, NULL),
(156, 'Pariatur beatae.', 'New event was set', 84, 1565562242, 'event', NULL, NULL, NULL),
(157, 'Quod.', 'Attenndance for student: Mellie Haag is present', 79, 1564957443, 'attendance', NULL, NULL, NULL),
(158, 'Aut voluptatem.', 'New event was set', 90, 1564352643, 'event', NULL, NULL, NULL),
(159, 'Voluptatem omnis repellat.', 'New event was set', 80, 1564784643, 'event', NULL, NULL, NULL),
(160, 'At.', 'New event was set', 83, 1563920643, 'event', NULL, NULL, NULL),
(161, 'Asperiores eaque.', 'New home work is added', 88, 1565994243, 'homework', NULL, NULL, NULL),
(162, 'Corrupti provident.', 'New event was set', 85, 1565648643, 'event', NULL, NULL, NULL),
(163, 'Odit sint.', 'Attenndance for student: Mellie Haag is present', 79, 1564093443, 'attendance', NULL, NULL, NULL),
(164, 'Quis qui.', 'New event was set', 95, 1565907843, 'event', NULL, NULL, NULL),
(165, 'Iste magni.', 'New home work is added', 90, 1564093443, 'homework', NULL, NULL, NULL),
(166, 'Libero voluptas impedit.', 'New event was set', 82, 1566253443, 'event', NULL, NULL, NULL),
(167, 'Illo et.', 'New home work is added', 89, 1565389443, 'homework', NULL, NULL, NULL),
(168, 'Ipsa illum.', 'Attenndance for student: Mellie Haag is present', 82, 1564093443, 'attendance', NULL, NULL, NULL),
(169, 'Quo.', 'New home work is added', 84, 1564007043, 'homework', NULL, NULL, NULL),
(170, 'Sunt quia.', 'Attenndance for student: Mellie Haag is present', 93, 1565475843, 'attendance', NULL, NULL, NULL),
(171, 'Eaque nemo dolorem.', 'New home work is added', 79, 1565389443, 'homework', NULL, NULL, NULL),
(172, 'In minima quo.', 'New home work is added', 85, 1563747843, 'homework', NULL, NULL, NULL),
(173, 'Aut sed.', 'New event was set', 88, 1564871043, 'event', NULL, NULL, NULL),
(174, 'Impedit sequi.', 'New home work is added', 77, 1565303043, 'homework', NULL, NULL, NULL),
(175, 'Quia aut.', 'Attenndance for student: Mellie Haag is present', 89, 1563920643, 'attendance', NULL, NULL, NULL),
(176, 'Delectus repellendus.', 'New event was set', 80, 1564093443, 'event', NULL, NULL, NULL),
(177, 'Qui consequatur.', 'Attenndance for student: Mellie Haag is present', 78, 1565907843, 'attendance', NULL, NULL, NULL),
(178, 'Explicabo voluptate.', 'New event was set', 93, 1564439043, 'event', NULL, NULL, NULL),
(179, 'Asperiores voluptatem.', 'New home work is added', 82, 1565648643, 'homework', NULL, NULL, NULL),
(180, 'Consequatur.', 'Attenndance for student: Mellie Haag is present', 77, 1565389443, 'attendance', NULL, NULL, NULL),
(181, 'Eius.', 'New event was set', 86, 1566253443, 'event', NULL, NULL, NULL),
(182, 'Repudiandae vitae.', 'Attenndance for student: Mellie Haag is present', 84, 1565648643, 'attendance', NULL, NULL, NULL),
(183, 'Officia.', 'New event was set', 76, 1565735043, 'event', NULL, NULL, NULL),
(184, 'Voluptates.', 'New event was set', 94, 1564352643, 'event', NULL, NULL, NULL),
(185, 'Nemo commodi.', 'New home work is added', 78, 1563834243, 'homework', NULL, NULL, NULL),
(186, 'Sunt.', 'Attenndance for student: Mellie Haag is present', 81, 1564871043, 'attendance', NULL, NULL, NULL),
(187, 'Ab.', 'New event was set', 94, 1564352643, 'event', NULL, NULL, NULL),
(188, 'Officiis.', 'New home work is added', 92, 1564784643, 'homework', NULL, NULL, NULL),
(189, 'Quibusdam sequi sit.', 'New event was set', 78, 1564698243, 'event', NULL, NULL, NULL),
(190, 'Ut mollitia.', 'New home work is added', 76, 1565216643, 'homework', NULL, NULL, NULL),
(191, 'Eos est.', 'New home work is added', 92, 1566339843, 'homework', NULL, NULL, NULL),
(192, 'Aut.', 'New home work is added', 90, 1564093443, 'homework', NULL, NULL, NULL),
(193, 'Quo id.', 'Attenndance for student: Mellie Haag is present', 89, 1566167043, 'attendance', NULL, NULL, NULL),
(194, 'Ea.', 'Attenndance for student: Mellie Haag is present', 86, 1566080643, 'attendance', NULL, NULL, NULL),
(195, 'Molestiae.', 'Attenndance for student: Mellie Haag is present', 86, 1564266243, 'attendance', NULL, NULL, NULL),
(196, 'Similique debitis.', 'Attenndance for student: Mellie Haag is present', 90, 1564007043, 'attendance', NULL, NULL, NULL),
(197, 'Voluptatum perferendis nulla.', 'New home work is added', 83, 1564352643, 'homework', NULL, NULL, NULL),
(198, 'Tempora qui.', 'New event was set', 79, 1564439043, 'event', NULL, NULL, NULL),
(199, 'Dignissimos atque.', 'New home work is added', 87, 1565475843, 'homework', NULL, NULL, NULL),
(200, 'Cupiditate nemo.', 'Attenndance for student: Mellie Haag is present', 84, 1564611843, 'attendance', NULL, NULL, NULL),
(201, 'Sed sit.', 'New event was set', 88, 1565994243, 'event', NULL, NULL, NULL),
(202, 'Beatae enim.', 'Attenndance for student: Mellie Haag is present', 95, 1565994243, 'attendance', NULL, NULL, NULL),
(203, 'Eius dolore qui.', 'New home work is added', 95, 1566253443, 'homework', NULL, NULL, NULL),
(204, 'Est.', 'New event was set', 86, 1565648643, 'event', NULL, NULL, NULL),
(205, 'Unde est.', 'New event was set', 76, 1564784643, 'event', NULL, NULL, NULL),
(206, 'Laborum necessitatibus accusamus.', 'Attenndance for student: Mellie Haag is present', 81, 1566080643, 'attendance', NULL, NULL, NULL),
(207, 'Soluta voluptatem.', 'New home work is added', 96, 1566339843, 'homework', NULL, NULL, NULL),
(208, 'Iure tempore dolorem.', 'New home work is added', 78, 1563834243, 'homework', NULL, NULL, NULL),
(209, 'Et.', 'Attenndance for student: Mellie Haag is present', 89, 1566253443, 'attendance', NULL, NULL, NULL),
(210, 'Saepe voluptatem ut.', 'New event was set', 77, 1566253443, 'event', NULL, NULL, NULL),
(211, 'Libero.', 'New home work is added', 81, 1564957443, 'homework', NULL, NULL, NULL),
(212, 'Delectus veniam.', 'New home work is added', 88, 1565216643, 'homework', NULL, NULL, NULL),
(213, 'Eveniet facere.', 'New event was set', 95, 1564007043, 'event', NULL, NULL, NULL),
(214, 'Accusantium soluta.', 'New event was set', 95, 1566080643, 'event', NULL, NULL, NULL),
(215, 'Quia adipisci rerum.', 'New home work is added', 82, 1564957444, 'homework', NULL, NULL, NULL),
(216, 'Sint occaecati et.', 'Attenndance for student: Mellie Haag is present', 82, 1563834244, 'attendance', NULL, NULL, NULL),
(217, 'Tenetur odio.', 'New home work is added', 92, 1563920644, 'homework', NULL, NULL, NULL),
(218, 'Sed esse.', 'Attenndance for student: Mellie Haag is present', 95, 1563747844, 'attendance', NULL, NULL, NULL),
(219, 'Et fugit.', 'Attenndance for student: Mellie Haag is present', 80, 1564871044, 'attendance', NULL, NULL, NULL),
(220, 'Adipisci.', 'Attenndance for student: Mellie Haag is present', 81, 1564611844, 'attendance', NULL, NULL, NULL),
(221, 'Dolores.', 'New event was set', 79, 1566167044, 'event', NULL, NULL, NULL),
(222, 'Non tempore ut.', 'New event was set', 81, 1566339844, 'event', NULL, NULL, NULL),
(223, 'Asperiores vel.', 'New event was set', 88, 1565735044, 'event', NULL, NULL, NULL),
(224, 'Nesciunt velit tempore.', 'New home work is added', 76, 1564611844, 'homework', NULL, NULL, NULL),
(225, 'Eum ex.', 'New home work is added', 96, 1564784644, 'homework', NULL, NULL, NULL),
(226, 'Voluptas facere.', 'New event was set', 91, 1564266244, 'event', NULL, NULL, NULL),
(227, 'Veritatis.', 'Attenndance for student: Mellie Haag is present', 91, 1565389444, 'attendance', NULL, NULL, NULL),
(228, 'Rerum voluptatem.', 'Attenndance for student: Mellie Haag is present', 89, 1564266244, 'attendance', NULL, NULL, NULL),
(229, 'Dolorem porro.', 'Attenndance for student: Mellie Haag is present', 77, 1564439044, 'attendance', NULL, NULL, NULL),
(230, 'Praesentium.', 'New event was set', 84, 1564439044, 'event', NULL, NULL, NULL),
(231, 'Eos recusandae alias.', 'New event was set', 86, 1564698244, 'event', NULL, NULL, NULL),
(232, 'Iste quia nemo.', 'New home work is added', 91, 1563747844, 'homework', NULL, NULL, NULL),
(233, 'Ipsum aperiam.', 'Attenndance for student: Mellie Haag is present', 94, 1566080644, 'attendance', NULL, NULL, NULL),
(234, 'Alias amet.', 'New event was set', 78, 1566253444, 'event', NULL, NULL, NULL),
(235, 'Voluptatem laborum.', 'New event was set', 76, 1565216644, 'event', NULL, NULL, NULL),
(236, 'Quasi qui.', 'New home work is added', 92, 1563747844, 'homework', NULL, NULL, NULL),
(237, 'Libero rerum.', 'Attenndance for student: Mellie Haag is present', 85, 1565303044, 'attendance', NULL, NULL, NULL),
(238, 'Rem.', 'New event was set', 96, 1564007044, 'event', NULL, NULL, NULL),
(239, 'Earum fuga.', 'Attenndance for student: Mellie Haag is present', 91, 1564266244, 'attendance', NULL, NULL, NULL),
(240, 'Non.', 'New event was set', 88, 1563834244, 'event', NULL, NULL, NULL),
(241, 'Dolore est accusantium.', 'New home work is added', 78, 1564784644, 'homework', NULL, NULL, NULL),
(242, 'Ducimus sequi.', 'New home work is added', 83, 1565562244, 'homework', NULL, NULL, NULL),
(243, 'Aliquam enim.', 'Attenndance for student: Mellie Haag is present', 77, 1564266244, 'attendance', NULL, NULL, NULL),
(244, 'Numquam.', 'New event was set', 92, 1564266244, 'event', NULL, NULL, NULL),
(245, 'Repudiandae sunt.', 'New event was set', 88, 1566339844, 'event', NULL, NULL, NULL),
(246, 'Labore.', 'New home work is added', 77, 1565735044, 'homework', NULL, NULL, NULL),
(247, 'Explicabo sit.', 'Attenndance for student: Mellie Haag is present', 93, 1564179844, 'attendance', NULL, NULL, NULL),
(248, 'Non.', 'Attenndance for student: Mellie Haag is present', 83, 1564439044, 'attendance', NULL, NULL, NULL),
(249, 'Quia maxime.', 'Attenndance for student: Mellie Haag is present', 94, 1564352644, 'attendance', NULL, NULL, NULL),
(250, 'Ut autem.', 'New event was set', 83, 1566339844, 'event', NULL, NULL, NULL),
(251, 'Non inventore dolor.', 'New home work is added', 88, 1565735044, 'homework', NULL, NULL, NULL),
(252, 'Et provident.', 'New home work is added', 87, 1564352644, 'homework', NULL, NULL, NULL),
(253, 'Itaque tempore accusamus.', 'New event was set', 78, 1565994245, 'event', NULL, NULL, NULL),
(254, 'Voluptas nesciunt.', 'New home work is added', 92, 1565475845, 'homework', NULL, NULL, NULL),
(255, 'Enim omnis.', 'New event was set', 93, 1566339845, 'event', NULL, NULL, NULL),
(256, 'Eligendi perferendis.', 'New event was set', 86, 1564352645, 'event', NULL, NULL, NULL),
(257, 'Similique.', 'New event was set', 94, 1566080645, 'event', NULL, NULL, NULL),
(258, 'Debitis aut.', 'Attenndance for student: Mellie Haag is present', 86, 1563920645, 'attendance', NULL, NULL, NULL),
(259, 'Dolores.', 'Attenndance for student: Mellie Haag is present', 90, 1565648645, 'attendance', NULL, NULL, NULL),
(260, 'Vero rem occaecati.', 'New home work is added', 78, 1563834245, 'homework', NULL, NULL, NULL),
(261, 'Vero id.', 'New event was set', 80, 1564179845, 'event', NULL, NULL, NULL),
(262, 'Fugiat omnis.', 'Attenndance for student: Mellie Haag is present', 83, 1564439045, 'attendance', NULL, NULL, NULL),
(263, 'Et et maxime.', 'Attenndance for student: Mellie Haag is present', 78, 1564439045, 'attendance', NULL, NULL, NULL),
(264, 'Ut dolorem.', 'Attenndance for student: Mellie Haag is present', 88, 1564352645, 'attendance', NULL, NULL, NULL),
(265, 'Sed consequatur pariatur.', 'Attenndance for student: Mellie Haag is present', 86, 1566339845, 'attendance', NULL, NULL, NULL),
(266, 'Occaecati quae.', 'New event was set', 84, 1564525445, 'event', NULL, NULL, NULL),
(267, 'Est culpa.', 'New event was set', 93, 1564957445, 'event', NULL, NULL, NULL),
(268, 'Autem qui nihil.', 'Attenndance for student: Mellie Haag is present', 88, 1566080645, 'attendance', NULL, NULL, NULL),
(269, 'Impedit tenetur.', 'New event was set', 77, 1564007045, 'event', NULL, NULL, NULL),
(270, 'Aliquid.', 'New home work is added', 95, 1564093445, 'homework', NULL, NULL, NULL),
(271, 'Necessitatibus.', 'Attenndance for student: Mellie Haag is present', 86, 1564871045, 'attendance', NULL, NULL, NULL),
(272, 'Velit quia autem.', 'New home work is added', 93, 1566167045, 'homework', NULL, NULL, NULL),
(273, 'Tenetur eos sit.', 'New home work is added', 80, 1564957445, 'homework', NULL, NULL, NULL),
(274, 'Sunt corporis.', 'New event was set', 95, 1565216645, 'event', NULL, NULL, NULL),
(275, 'Placeat maxime accusantium.', 'New home work is added', 88, 1565562245, 'homework', NULL, NULL, NULL),
(276, 'Occaecati voluptatem.', 'New home work is added', 87, 1564525445, 'homework', NULL, NULL, NULL),
(277, 'Deserunt eos possimus.', 'New event was set', 88, 1564784645, 'event', NULL, NULL, NULL),
(278, 'Maxime quis.', 'Attenndance for student: Mellie Haag is present', 90, 1564179845, 'attendance', NULL, NULL, NULL),
(279, 'Et qui sint.', 'New home work is added', 96, 1564439045, 'homework', NULL, NULL, NULL),
(280, 'Ipsum.', 'New event was set', 89, 1565907845, 'event', NULL, NULL, NULL),
(281, 'Eius autem.', 'New home work is added', 87, 1565216645, 'homework', NULL, NULL, NULL),
(282, 'Architecto aut officiis.', 'Attenndance for student: Mellie Haag is present', 83, 1565562245, 'attendance', NULL, NULL, NULL),
(283, 'Vel.', 'Attenndance for student: Mellie Haag is present', 80, 1565821445, 'attendance', NULL, NULL, NULL),
(284, 'Necessitatibus ipsam qui.', 'Attenndance for student: Mellie Haag is present', 90, 1566253445, 'attendance', NULL, NULL, NULL),
(285, 'Adipisci.', 'New home work is added', 84, 1566080645, 'homework', NULL, NULL, NULL),
(286, 'Eum ea.', 'New home work is added', 89, 1566253445, 'homework', NULL, NULL, NULL),
(287, 'Exercitationem cum.', 'New home work is added', 79, 1564439045, 'homework', NULL, NULL, NULL),
(288, 'Autem aut.', 'Attenndance for student: Mellie Haag is present', 78, 1565821445, 'attendance', NULL, NULL, NULL),
(289, 'Voluptatem.', 'Attenndance for student: Mellie Haag is present', 79, 1565907846, 'attendance', NULL, NULL, NULL),
(290, 'Eveniet.', 'Attenndance for student: Mellie Haag is present', 90, 1564179846, 'attendance', NULL, NULL, NULL),
(291, 'Reprehenderit labore.', 'New home work is added', 96, 1565303046, 'homework', NULL, NULL, NULL),
(292, 'Numquam rerum.', 'New home work is added', 85, 1566080646, 'homework', NULL, NULL, NULL),
(293, 'Ipsam sit quas.', 'Attenndance for student: Mellie Haag is present', 95, 1563834246, 'attendance', NULL, NULL, NULL),
(294, 'Iusto.', 'New home work is added', 91, 1564957446, 'homework', NULL, NULL, NULL),
(295, 'Mollitia ad.', 'Attenndance for student: Mellie Haag is present', 93, 1565216646, 'attendance', NULL, NULL, NULL),
(296, 'Exercitationem eum consequuntur.', 'Attenndance for student: Mellie Haag is present', 76, 1565735046, 'attendance', NULL, NULL, NULL),
(297, 'Fugit.', 'New event was set', 95, 1564179846, 'event', NULL, NULL, NULL),
(298, 'Et vero.', 'New event was set', 91, 1565475846, 'event', NULL, NULL, NULL),
(299, 'Voluptatem.', 'New home work is added', 96, 1566339846, 'homework', NULL, NULL, NULL),
(300, 'Amet hic.', 'New event was set', 82, 1565216646, 'event', NULL, NULL, NULL),
(301, 'Messages', 'New Message From Ahmed Sayed', 1, 0, 'messages', '10', NULL, NULL),
(302, 'Messages', 'New Message From Ahmed Sayed', 76, 0, 'messages', '10', NULL, NULL),
(303, 'Messages', 'New Message From Ahmed Sayed', 1, 0, 'messages', '10', NULL, NULL),
(304, 'Messages', 'New Message From Ahmed Sayed', 76, 0, 'messages', '10', NULL, NULL),
(305, 'Messages', 'New Message From [Pa] Reta Dicki', 1, 0, 'messages', '9', NULL, NULL),
(306, 'Messages', 'New Message From [Pa] Reta Dicki', 76, 0, 'messages', '9', NULL, NULL),
(307, 'Messages', 'New Message From [Pa] Reta Dicki', 1, 0, 'messages', '9', NULL, NULL),
(308, 'Messages', 'New Message From [Pa] Reta Dicki', 76, 0, 'messages', '9', NULL, NULL),
(309, 'test event', 'test event', 1, 0, 'events', '11', NULL, NULL),
(310, 'test event', 'test event', 2, 0, 'events', '11', NULL, NULL),
(311, 'test event', 'test event', 3, 0, 'events', '11', NULL, NULL),
(312, 'test event', 'test event', 4, 0, 'events', '11', NULL, NULL),
(313, 'test event', 'test event', 5, 0, 'events', '11', NULL, NULL),
(314, 'test event', 'test event', 6, 0, 'events', '11', NULL, NULL),
(315, 'test event', 'test event', 7, 0, 'events', '11', NULL, NULL),
(316, 'test event', 'test event', 8, 0, 'events', '11', NULL, NULL),
(317, 'test event', 'test event', 9, 0, 'events', '11', NULL, NULL),
(318, 'test event', 'test event', 10, 0, 'events', '11', NULL, NULL),
(319, 'test event', 'test event', 11, 0, 'events', '11', NULL, NULL),
(320, 'test event', 'test event', 12, 0, 'events', '11', NULL, NULL),
(321, 'test event', 'test event', 13, 0, 'events', '11', NULL, NULL),
(322, 'test event', 'test event', 14, 0, 'events', '11', NULL, NULL),
(323, 'test event', 'test event', 15, 0, 'events', '11', NULL, NULL),
(324, 'test event', 'test event', 16, 0, 'events', '11', NULL, NULL),
(325, 'test event', 'test event', 17, 0, 'events', '11', NULL, NULL),
(326, 'test event', 'test event', 18, 0, 'events', '11', NULL, NULL),
(327, 'test event', 'test event', 19, 0, 'events', '11', NULL, NULL),
(328, 'test event', 'test event', 20, 0, 'events', '11', NULL, NULL),
(329, 'test event', 'test event', 21, 0, 'events', '11', NULL, NULL),
(330, 'test event', 'test event', 22, 0, 'events', '11', NULL, NULL),
(331, 'test event', 'test event', 23, 0, 'events', '11', NULL, NULL),
(332, 'test event', 'test event', 24, 0, 'events', '11', NULL, NULL),
(333, 'test event', 'test event', 25, 0, 'events', '11', NULL, NULL),
(334, 'test event', 'test event', 26, 0, 'events', '11', NULL, NULL),
(335, 'test event', 'test event', 27, 0, 'events', '11', NULL, NULL),
(336, 'test event', 'test event', 28, 0, 'events', '11', NULL, NULL),
(337, 'test event', 'test event', 29, 0, 'events', '11', NULL, NULL),
(338, 'test event', 'test event', 30, 0, 'events', '11', NULL, NULL),
(339, 'test event', 'test event', 31, 0, 'events', '11', NULL, NULL),
(340, 'test event', 'test event', 32, 0, 'events', '11', NULL, NULL),
(341, 'test event', 'test event', 33, 0, 'events', '11', NULL, NULL),
(342, 'test event', 'test event', 34, 0, 'events', '11', NULL, NULL),
(343, 'test event', 'test event', 35, 0, 'events', '11', NULL, NULL),
(344, 'test event', 'test event', 36, 0, 'events', '11', NULL, NULL),
(345, 'test event', 'test event', 37, 0, 'events', '11', NULL, NULL),
(346, 'test event', 'test event', 38, 0, 'events', '11', NULL, NULL),
(347, 'test event', 'test event', 39, 0, 'events', '11', NULL, NULL),
(348, 'test event', 'test event', 40, 0, 'events', '11', NULL, NULL),
(349, 'test event', 'test event', 41, 0, 'events', '11', NULL, NULL),
(350, 'test event', 'test event', 42, 0, 'events', '11', NULL, NULL),
(351, 'test event', 'test event', 43, 0, 'events', '11', NULL, NULL),
(352, 'test event', 'test event', 44, 0, 'events', '11', NULL, NULL),
(353, 'test event', 'test event', 45, 0, 'events', '11', NULL, NULL),
(354, 'test event', 'test event', 46, 0, 'events', '11', NULL, NULL),
(355, 'test event', 'test event', 47, 0, 'events', '11', NULL, NULL),
(356, 'test event', 'test event', 48, 0, 'events', '11', NULL, NULL),
(357, 'test event', 'test event', 49, 0, 'events', '11', NULL, NULL),
(358, 'test event', 'test event', 50, 0, 'events', '11', NULL, NULL),
(359, 'test event', 'test event', 51, 0, 'events', '11', NULL, NULL),
(360, 'test event', 'test event', 52, 0, 'events', '11', NULL, NULL),
(361, 'test event', 'test event', 53, 0, 'events', '11', NULL, NULL),
(362, 'test event', 'test event', 54, 0, 'events', '11', NULL, NULL),
(363, 'test event', 'test event', 55, 0, 'events', '11', NULL, NULL),
(364, 'test event', 'test event', 56, 0, 'events', '11', NULL, NULL),
(365, 'test event', 'test event', 57, 0, 'events', '11', NULL, NULL),
(366, 'test event', 'test event', 58, 0, 'events', '11', NULL, NULL),
(367, 'test event', 'test event', 59, 0, 'events', '11', NULL, NULL),
(368, 'test event', 'test event', 60, 0, 'events', '11', NULL, NULL),
(369, 'test event', 'test event', 61, 0, 'events', '11', NULL, NULL),
(370, 'test event', 'test event', 62, 0, 'events', '11', NULL, NULL),
(371, 'test event', 'test event', 63, 0, 'events', '11', NULL, NULL),
(372, 'test event', 'test event', 64, 0, 'events', '11', NULL, NULL),
(373, 'test event', 'test event', 65, 0, 'events', '11', NULL, NULL),
(374, 'test event', 'test event', 66, 0, 'events', '11', NULL, NULL),
(375, 'test event', 'test event', 67, 0, 'events', '11', NULL, NULL),
(376, 'test event', 'test event', 68, 0, 'events', '11', NULL, NULL),
(377, 'test event', 'test event', 69, 0, 'events', '11', NULL, NULL),
(378, 'test event', 'test event', 70, 0, 'events', '11', NULL, NULL),
(379, 'test event', 'test event', 71, 0, 'events', '11', NULL, NULL),
(380, 'test event', 'test event', 72, 0, 'events', '11', NULL, NULL),
(381, 'test event', 'test event', 73, 0, 'events', '11', NULL, NULL),
(382, 'test event', 'test event', 74, 0, 'events', '11', NULL, NULL),
(383, 'test event', 'test event', 75, 0, 'events', '11', NULL, NULL),
(384, 'test event', 'test event', 76, 0, 'events', '11', NULL, NULL),
(385, 'test event', 'test event', 77, 0, 'events', '11', NULL, NULL),
(386, 'test event', 'test event', 78, 0, 'events', '11', NULL, NULL),
(387, 'test event', 'test event', 79, 0, 'events', '11', NULL, NULL),
(388, 'test event', 'test event', 80, 0, 'events', '11', NULL, NULL),
(389, 'test event', 'test event', 81, 0, 'events', '11', NULL, NULL),
(390, 'test event', 'test event', 82, 0, 'events', '11', NULL, NULL),
(391, 'test event', 'test event', 83, 0, 'events', '11', NULL, NULL),
(392, 'test event', 'test event', 84, 0, 'events', '11', NULL, NULL),
(393, 'test event', 'test event', 85, 0, 'events', '11', NULL, NULL),
(394, 'test event', 'test event', 86, 0, 'events', '11', NULL, NULL),
(395, 'test event', 'test event', 87, 0, 'events', '11', NULL, NULL),
(396, 'test event', 'test event', 88, 0, 'events', '11', NULL, NULL),
(397, 'test event', 'test event', 89, 0, 'events', '11', NULL, NULL),
(398, 'test event', 'test event', 90, 0, 'events', '11', NULL, NULL),
(399, 'test event', 'test event', 91, 0, 'events', '11', NULL, NULL),
(400, 'test event', 'test event', 92, 0, 'events', '11', NULL, NULL),
(401, 'test event', 'test event', 93, 0, 'events', '11', NULL, NULL),
(402, 'test event', 'test event', 94, 0, 'events', '11', NULL, NULL),
(403, 'test event', 'test event', 95, 0, 'events', '11', NULL, NULL),
(404, 'test event', 'test event', 96, 0, 'events', '11', NULL, NULL);

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
(1, 'sint_943', 'Ea ea architecto et aut veniam nisi ut.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 430, 38, 0, 600, 1, 1564698225, 1565994225, 0, NULL, NULL, 'Online', 1565821425, 1, '0'),
(2, 'quasi_473', 'Consequatur error voluptas facilis quibusdam error minus magnam quasi quis.', 63, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 180, 32, 37, 480, 1, 1564093425, 1564871025, 0, NULL, NULL, 'Cheque', 1565994225, 1, '0'),
(3, 'rem_531', 'Et tenetur perferendis ullam veniam praesentium.', 50, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 640, 0, 35, 1000, 1, 1564611825, 1564957425, 0, NULL, NULL, 'Online', 1565735025, 0, '0'),
(4, 'aut_932', 'Dolorem consectetur eligendi porro odio exercitationem sit.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 400, 0, 0, 680, 1, 1563920625, 1565821425, 0, NULL, NULL, 'Card', 1564525425, 0, '0'),
(5, 'expedita_577', 'Optio qui in quis nihil aut non laborum accusantium dolorum amet.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 470, 0, 17, 210, 1, 1563747825, 1564871025, 0, NULL, NULL, 'Cash', 1565475825, 1, '0'),
(6, 'nesciunt_405', 'Similique alias sunt omnis maiores harum et voluptatibus sed ratione cumque.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 640, 0, 0, 180, 0, 1564439025, 1565216625, 0, NULL, NULL, 'Bank Deposit', 1563834225, 0, '0'),
(7, 'omnis_891', 'Quas et illum illum nemo culpa et delectus.', 61, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 900, 0, 39, 870, 1, 1563747826, 1565562226, 0, NULL, NULL, 'Card', 1563834226, 0, '0'),
(8, 'est_691', 'Hic culpa vel asperiores atque inventore.', 51, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 520, 7, 0, 370, 0, 1564698226, 1564871026, 1, NULL, NULL, 'Cash', 1565994226, 0, '0'),
(9, 'laudantium_975', NULL, 67, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 160, 0, 17, 470, 1, 1563747826, 1565303026, 0, NULL, NULL, 'Online', 1565389426, 1, '0'),
(10, 'magni_879', 'Totam exercitationem nihil sequi quia aliquam recusandae itaque doloremque velit.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 870, 0, 18, 590, 1, 1564611826, 1565994226, 0, NULL, NULL, 'Online', 1565389426, 1, '0'),
(11, 'fugit_243', NULL, 48, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 190, 11, 31, 470, 0, 1564007026, 1565562226, 0, NULL, NULL, 'Bank Deposit', 1565130226, 1, '0'),
(12, 'autem_324', 'Qui exercitationem qui id impedit ut doloribus unde rem inventore itaque.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 160, 0, 0, 730, 0, 1564611826, 1564871026, 1, NULL, NULL, 'Cheque', 1566253426, 0, '0'),
(13, 'sed_142', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 670, 32, 2, 560, 1, 1564179826, 1564784626, 0, NULL, NULL, 'Online', 1564698226, 0, '0'),
(14, 'sint_854', 'Impedit aut temporibus corrupti sed dicta.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 720, 28, 0, 810, 1, 1564439026, 1565562226, 0, NULL, NULL, 'Bank Deposit', 1563920626, 0, '0'),
(15, 'debitis_837', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 660, 38, 0, 350, 0, 1563747826, 1564784626, 1, NULL, NULL, 'Card', 1564352626, 0, '0'),
(16, 'animi_461', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 70, 0, 38, 840, 0, 1564784626, 1564871026, 1, NULL, NULL, 'Cheque', 1564698226, 1, '0'),
(17, 'culpa_983', 'Possimus quidem omnis ipsum voluptatem in molestiae porro.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 700, 37, 2, 160, 1, 1563747826, 1565821426, 0, NULL, NULL, 'Cash', 1565303026, 0, '0'),
(18, 'voluptatem_513', NULL, 60, '[{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 310, 27, 0, 450, 0, 1563747826, 1565130226, 1, NULL, NULL, 'Cheque', 1564611826, 1, '0'),
(19, 'amet_209', NULL, 59, '[{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 850, 39, 0, 910, 0, 1564007026, 1564784626, 1, NULL, NULL, 'Cash', 1565735026, 0, '0'),
(20, 'placeat_576', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 630, 0, 41, 710, 0, 1563834226, 1565735026, 0, NULL, NULL, 'Bank Deposit', 1564352626, 0, '0'),
(21, 'consequatur_603', 'Dignissimos ratione quia eum aut et aliquam sed.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 110, 47, 18, 940, 1, 1564179826, 1564784626, 0, NULL, NULL, 'Cash', 1564525426, 0, '0'),
(22, 'iure_582', 'Sequi sunt deserunt sapiente aperiam.', 49, '[{\"title\":\"Building fee\",\"amount\":\"100\"}]', 530, 25, 0, 990, 0, 1563747826, 1565907826, 0, NULL, NULL, 'Cheque', 1566339826, 1, '0'),
(23, 'eaque_405', NULL, 66, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 790, 28, 0, 80, 1, 1564439026, 1564784626, 0, NULL, NULL, 'Card', 1563747826, 0, '0'),
(24, 'veniam_187', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 100, 4, 19, 980, 1, 1564007026, 1564871026, 0, NULL, NULL, 'Bank Deposit', 1564352626, 0, '0'),
(25, 'nihil_525', 'Sit doloremque in est ut dolor maiores aperiam mollitia aliquam deserunt.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 190, 0, 0, 710, 0, 1564698226, 1564871026, 1, NULL, NULL, 'Cheque', 1564093426, 0, '0'),
(26, 'quae_120', 'Cum omnis sit aut ut optio.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 860, 13, 0, 80, 1, 1563747826, 1566253426, 0, NULL, NULL, 'Card', 1564352626, 0, '0'),
(27, 'dolores_982', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 510, 32, 21, 220, 1, 1564439026, 1565562226, 0, NULL, NULL, 'Card', 1565907826, 0, '0'),
(28, 'sed_167', 'Cupiditate ut libero deleniti reprehenderit laboriosam doloremque vel aperiam.', 48, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 950, 0, 0, 660, 1, 1564179826, 1565821426, 0, NULL, NULL, 'Cheque', 1564266226, 1, '0'),
(29, 'cum_119', 'Nihil et et et ipsam et praesentium.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 990, 35, 19, 540, 0, 1564266226, 1565562226, 0, NULL, NULL, 'Bank Deposit', 1563747826, 1, '0'),
(30, 'molestiae_925', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 70, 5, 20, 950, 1, 1564784626, 1564784626, 0, NULL, NULL, 'Bank Deposit', 1565907826, 0, '0'),
(31, 'id_216', 'Rerum sunt est aut ipsam perspiciatis est ut inventore earum voluptas.', 61, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 280, 7, 21, 560, 1, 1564525426, 1564784626, 0, NULL, NULL, 'Cash', 1564525426, 0, '0'),
(32, 'qui_160', 'Sint dolores commodi id assumenda voluptas pariatur incidunt perspiciatis ut.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 200, 0, 0, 360, 0, 1564611826, 1564871026, 1, NULL, NULL, 'Card', 1564093426, 1, '0'),
(33, 'perferendis_905', 'Ut vel veniam occaecati reprehenderit non sunt alias voluptatem voluptate quaerat voluptatum.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 380, 0, 0, 610, 0, 1564525426, 1564784626, 1, NULL, NULL, 'Card', 1563747826, 1, '0'),
(34, 'dolor_928', 'Autem quod voluptatem pariatur tenetur aspernatur ab ut aliquid.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 630, 0, 38, 260, 0, 1564439026, 1565216626, 0, NULL, NULL, 'Bank Deposit', 1564957426, 0, '0'),
(35, 'id_658', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 720, 0, 28, 280, 0, 1564266226, 1564871026, 1, NULL, NULL, 'Cash', 1565475826, 0, '0'),
(36, 'voluptatibus_827', NULL, 61, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 490, 0, 0, 720, 1, 1564093426, 1565562226, 0, NULL, NULL, 'Online', 1564179826, 1, '0'),
(37, 'voluptas_334', 'Dolores officia architecto beatae vel ut.', 52, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 480, 47, 19, 170, 1, 1564093426, 1566253426, 0, NULL, NULL, 'Cheque', 1564957426, 0, '0'),
(38, 'et_469', 'Voluptatem qui in numquam et odio.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 490, 43, 0, 70, 1, 1564179826, 1564957426, 0, NULL, NULL, 'Cash', 1565475826, 0, '0'),
(39, 'mollitia_936', NULL, 57, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 180, 11, 0, 160, 1, 1564179826, 1565907826, 0, NULL, NULL, 'Bank Deposit', 1565907826, 1, '0'),
(40, 'itaque_772', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 690, 0, 16, 1000, 1, 1564698226, 1564784626, 0, NULL, NULL, 'Cheque', 1566167026, 1, '0'),
(41, 'quisquam_304', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 920, 6, 0, 810, 1, 1563747826, 1564871026, 0, NULL, NULL, 'Cash', 1564611826, 0, '0'),
(42, 'quidem_316', 'Consequatur ipsam omnis nam voluptas omnis impedit illo dolores qui.', 59, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 950, 0, 1, 640, 0, 1564266226, 1564957426, 1, NULL, NULL, 'Cash', 1565994226, 1, '0'),
(43, 'tenetur_461', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 210, 37, 0, 570, 1, 1564784626, 1564957426, 0, NULL, NULL, 'Cash', 1565994226, 1, '0'),
(44, 'id_454', 'Ab ex esse id qui laboriosam nulla eum facilis ut.', 69, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 610, 0, 8, 700, 0, 1563747826, 1565475826, 0, NULL, NULL, 'Bank Deposit', 1565130226, 1, '0'),
(45, 'reprehenderit_191', NULL, 57, '[{\"title\":\"Building fee\",\"amount\":\"200\"}]', 730, 0, 41, 660, 0, 1564784626, 1564871026, 1, NULL, NULL, 'Cash', 1564352626, 1, '0'),
(46, 'quidem_455', NULL, 63, ']', 680, 14, 0, 720, 0, 1564093426, 1564871026, 1, NULL, NULL, 'Cash', 1565562226, 1, '0'),
(47, 'aut_163', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 380, 0, 0, 420, 1, 1564698226, 1565821426, 0, NULL, NULL, 'Cash', 1565907826, 0, '0'),
(48, 'omnis_688', 'Incidunt minus voluptatibus modi et fugiat rerum.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 150, 7, 0, 270, 0, 1564784626, 1565389426, 0, NULL, NULL, 'Online', 1565216626, 1, '0'),
(49, 'non_745', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 280, 24, 18, 100, 1, 1563920626, 1564957426, 0, NULL, NULL, 'Card', 1564007026, 0, '0'),
(50, 'esse_481', NULL, 64, '[{\"title\":\"Building fee\",\"amount\":\"100\"}]', 80, 40, 41, 300, 1, 1564611826, 1564871026, 0, NULL, NULL, 'Cash', 1565648626, 0, '0'),
(51, 'et_750', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 560, 41, 0, 580, 1, 1564784626, 1564871026, 0, NULL, NULL, 'Cheque', 1565562226, 0, '0'),
(52, 'ut_175', 'Et inventore placeat totam iure et rerum culpa et veniam dolorum.', 61, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 90, 0, 41, 650, 1, 1564698226, 1565303026, 0, NULL, NULL, 'Card', 1565216626, 0, '0'),
(53, 'sunt_202', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 960, 0, 24, 750, 1, 1564784626, 1564957426, 0, NULL, NULL, 'Bank Deposit', 1564439026, 0, '0'),
(54, 'omnis_419', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 470, 10, 0, 60, 0, 1564352626, 1564871026, 1, NULL, NULL, 'Bank Deposit', 1566253426, 0, '0'),
(55, 'velit_584', 'Explicabo voluptate autem placeat aliquam hic recusandae est.', 60, '[{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 200, 0, 25, 720, 0, 1564266226, 1564871026, 1, NULL, NULL, 'Cash', 1564439026, 0, '0'),
(56, 'voluptas_669', 'Expedita dolorum voluptatem dolores sunt est.', 61, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 590, 0, 0, 480, 1, 1564007026, 1565735026, 0, NULL, NULL, 'Card', 1565994226, 1, '0'),
(57, 'et_257', 'Praesentium eligendi officia expedita fuga officiis sunt ullam repudiandae.', 48, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 580, 0, 19, 690, 0, 1564784626, 1566339826, 0, NULL, NULL, 'Online', 1564352626, 0, '0'),
(58, 'blanditiis_441', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 480, 0, 0, 590, 0, 1564352626, 1565994226, 0, NULL, NULL, 'Card', 1564007026, 0, '0'),
(59, 'ullam_682', 'Rerum amet et est sequi qui ut tempora.', 57, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 410, 0, 41, 430, 0, 1564007026, 1565389426, 0, NULL, NULL, 'Online', 1563920626, 0, '0'),
(60, 'necessitatibus_260', 'Earum recusandae dolore numquam rerum sit nulla voluptas.', 52, '[{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 650, 4, 0, 840, 0, 1564611826, 1565735026, 0, NULL, NULL, 'Card', 1564611826, 1, '0'),
(61, 'nobis_830', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 580, 33, 36, 320, 1, 1564698226, 1565648626, 0, NULL, NULL, 'Card', 1564525426, 1, '0'),
(62, 'doloribus_635', NULL, 60, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 530, 0, 0, 340, 1, 1564352626, 1564957426, 0, NULL, NULL, 'Cheque', 1564439026, 0, '0'),
(63, 'id_702', 'Illum labore corporis dolorum sed commodi ipsa odit quos modi culpa accusamus.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 800, 10, 28, 500, 0, 1563747826, 1565389426, 0, NULL, NULL, 'Cash', 1565648626, 1, '0'),
(64, 'officia_220', 'Eos harum voluptatem maiores magni laudantium.', 66, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 520, 22, 0, 660, 1, 1564784626, 1564784626, 0, NULL, NULL, 'Bank Deposit', 1565216626, 0, '0'),
(65, 'non_190', 'At at modi dolores quos et.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 320, 25, 0, 980, 0, 1563834226, 1566339826, 0, NULL, NULL, 'Card', 1565475826, 1, '0'),
(66, 'et_510', 'Et nobis excepturi dolores qui.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 470, 0, 0, 610, 0, 1563834226, 1566253426, 0, NULL, NULL, 'Cheque', 1565303026, 1, '0'),
(67, 'consectetur_481', NULL, 61, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 320, 0, 0, 620, 0, 1564352626, 1564784626, 1, NULL, NULL, 'Cheque', 1564007026, 0, '0'),
(68, 'natus_194', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 740, 0, 0, 720, 0, 1564093426, 1564957426, 1, NULL, NULL, 'Card', 1563920626, 1, '0'),
(69, 'necessitatibus_376', 'Velit velit placeat voluptates voluptatem molestiae animi voluptas unde.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 100, 8, 0, 70, 1, 1563834226, 1564957426, 0, NULL, NULL, 'Cash', 1565735026, 1, '0'),
(70, 'ut_787', 'Quos soluta quo illum mollitia placeat magni autem sapiente.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 610, 19, 44, 180, 1, 1563834226, 1565735026, 0, NULL, NULL, 'Online', 1564611826, 1, '0'),
(71, 'vero_881', 'Natus rerum praesentium deleniti vitae quod debitis ut.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 850, 0, 0, 200, 0, 1564179827, 1564957427, 1, NULL, NULL, 'Online', 1564611827, 0, '0'),
(72, 'repudiandae_241', 'Velit facilis odio tenetur rerum at omnis iure.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 990, 31, 2, 990, 0, 1564093427, 1565907827, 0, NULL, NULL, 'Bank Deposit', 1564525427, 0, '0'),
(73, 'veniam_119', NULL, 64, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 920, 6, 0, 370, 0, 1564611827, 1565821427, 0, NULL, NULL, 'Card', 1563747827, 1, '0'),
(74, 'velit_786', NULL, 57, '[{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 1000, 0, 0, 850, 0, 1564352627, 1565648627, 0, NULL, NULL, 'Card', 1564871027, 0, '0'),
(75, 'sed_867', 'Inventore praesentium atque at inventore optio ullam ut est ut asperiores.', 64, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 660, 0, 14, 280, 0, 1564266227, 1564871027, 1, NULL, NULL, 'Cash', 1565389427, 1, '0'),
(76, 'veritatis_214', 'Eum impedit ut alias maxime perspiciatis et quia.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"}]', 580, 0, 13, 780, 1, 1564439027, 1566167027, 0, NULL, NULL, 'Cash', 1564698227, 1, '0'),
(77, 'officiis_457', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 390, 0, 0, 510, 1, 1564525427, 1564784627, 0, NULL, NULL, 'Cheque', 1565735027, 1, '0'),
(78, 'veniam_603', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 150, 0, 23, 200, 1, 1564525427, 1564957427, 0, NULL, NULL, 'Online', 1564179827, 0, '0'),
(79, 'voluptas_752', NULL, 64, '[{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 920, 0, 0, 610, 1, 1564007027, 1564871027, 0, NULL, NULL, 'Cash', 1564784627, 1, '0'),
(80, 'maxime_448', 'Natus ea harum autem distinctio voluptatibus dolore aut consequuntur.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 770, 44, 46, 140, 0, 1564525427, 1565562227, 0, NULL, NULL, 'Card', 1564093427, 1, '0'),
(81, 'et_169', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 190, 28, 31, 70, 0, 1564007027, 1565907827, 0, NULL, NULL, 'Card', 1564871027, 1, '0'),
(82, 'distinctio_716', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 270, 0, 0, 740, 0, 1564007027, 1564957427, 1, NULL, NULL, 'Online', 1564611827, 1, '0'),
(83, 'reiciendis_415', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 270, 3, 9, 520, 0, 1564007027, 1564957427, 1, NULL, NULL, 'Bank Deposit', 1564957427, 1, '0'),
(84, 'ipsum_733', 'Nulla quia eligendi dicta iste et nesciunt deserunt ex animi repellat.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 340, 0, 0, 280, 0, 1563920627, 1565735027, 0, NULL, NULL, 'Card', 1565821427, 1, '0'),
(85, 'vel_870', 'Magni quia deleniti praesentium velit.', 60, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 480, 29, 9, 180, 1, 1563747827, 1565130227, 0, NULL, NULL, 'Online', 1564784627, 1, '0'),
(86, 'incidunt_976', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 130, 39, 47, 270, 0, 1564352627, 1566167027, 0, NULL, NULL, 'Cash', 1565907827, 1, '0'),
(87, 'sint_900', 'Fugiat quos consequatur et amet et soluta quas praesentium suscipit.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 750, 0, 28, 580, 0, 1563834227, 1564957427, 1, NULL, NULL, 'Cash', 1564439027, 0, '0'),
(88, 'maiores_453', 'Architecto occaecati quis possimus dolor rerum nam vitae magni.', 69, '[{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 390, 0, 20, 450, 0, 1564439027, 1565389427, 0, NULL, NULL, 'Cash', 1563834227, 0, '0'),
(89, 'aspernatur_481', 'Quis eos aut rerum alias quo provident aut molestias provident.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 510, 0, 0, 940, 0, 1564179827, 1565303027, 0, NULL, NULL, 'Card', 1563834227, 0, '0'),
(90, 'libero_313', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 760, 45, 0, 290, 1, 1563834227, 1564784627, 0, NULL, NULL, 'Card', 1565562227, 0, '0'),
(91, 'consequatur_264', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 630, 20, 28, 240, 1, 1564266227, 1564784627, 0, NULL, NULL, 'Online', 1564784627, 0, '0'),
(92, 'omnis_816', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 310, 33, 22, 400, 1, 1564179827, 1564784627, 0, NULL, NULL, 'Cash', 1566167027, 0, '0'),
(93, 'ea_570', NULL, 60, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 740, 0, 14, 840, 0, 1564093427, 1565303027, 0, NULL, NULL, 'Cash', 1563747827, 0, '0'),
(94, 'voluptatibus_240', 'Rerum laboriosam et non non quasi corrupti atque quas.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 980, 39, 29, 160, 1, 1563920627, 1565216627, 0, NULL, NULL, 'Online', 1564698227, 0, '0'),
(95, 'numquam_387', NULL, 52, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 820, 23, 0, 850, 0, 1564007027, 1565130227, 1, NULL, NULL, 'Bank Deposit', 1564352627, 0, '0'),
(96, 'accusantium_200', 'Repellendus repellat at eveniet aut culpa laboriosam provident.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 800, 37, 0, 560, 1, 1564179827, 1565821427, 0, NULL, NULL, 'Cash', 1565994227, 0, '0'),
(97, 'iure_131', NULL, 60, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 490, 40, 22, 270, 1, 1564352627, 1564784627, 0, NULL, NULL, 'Cash', 1564871027, 1, '0'),
(98, 'sit_562', 'Officiis neque quibusdam et quibusdam ad expedita.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 560, 0, 50, 880, 1, 1564525427, 1564957427, 0, NULL, NULL, 'Card', 1565562227, 1, '0'),
(99, 'itaque_229', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 240, 35, 0, 980, 0, 1563834227, 1565735027, 0, NULL, NULL, 'Cheque', 1564611827, 1, '0'),
(100, 'occaecati_241', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 960, 0, 36, 440, 0, 1564784627, 1566080627, 0, NULL, NULL, 'Online', 1563920627, 1, '0'),
(101, 'qui_344', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 180, 0, 0, 740, 1, 1564698227, 1565303027, 0, NULL, NULL, 'Card', 1565994227, 0, '0'),
(102, 'voluptatem_181', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 820, 32, 50, 390, 1, 1564007027, 1564957427, 0, NULL, NULL, 'Card', 1565216627, 0, '0'),
(103, 'dolorum_404', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 60, 0, 16, 270, 0, 1564611827, 1564871027, 1, NULL, NULL, 'Card', 1564871027, 1, '0'),
(104, 'beatae_320', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 200, 34, 0, 660, 1, 1564784627, 1564957427, 0, NULL, NULL, 'Cash', 1565648627, 0, '0'),
(105, 'vitae_907', NULL, 60, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 600, 2, 27, 250, 0, 1564007027, 1564784627, 1, NULL, NULL, 'Bank Deposit', 1564871027, 0, '0'),
(106, 'harum_851', 'Officiis debitis quia ab ab saepe quos odio blanditiis.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 330, 0, 0, 280, 0, 1563747827, 1564871027, 1, NULL, NULL, 'Bank Deposit', 1565216627, 1, '0'),
(107, 'sunt_856', 'Rerum distinctio tempore at et ab voluptas esse illo quia.', 57, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 580, 44, 0, 270, 0, 1563920627, 1565735027, 0, NULL, NULL, 'Cash', 1565130227, 1, '0'),
(108, 'est_366', NULL, 66, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 700, 46, 9, 750, 0, 1563747827, 1566339827, 0, NULL, NULL, 'Cash', 1566339827, 1, '0'),
(109, 'fuga_817', 'Nesciunt autem ullam reiciendis repellat autem.', 52, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 770, 19, 18, 370, 1, 1563834227, 1564871027, 0, NULL, NULL, 'Bank Deposit', 1564439027, 0, '0'),
(110, 'et_225', 'Non qui odio quia et et quibusdam perferendis vel.', 46, '[{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 610, 0, 35, 210, 0, 1564698227, 1564784627, 1, NULL, NULL, 'Cash', 1565475827, 1, '0'),
(111, 'voluptatem_548', 'Expedita voluptas sit qui odio eum.', 64, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 860, 29, 0, 60, 1, 1564611827, 1565994227, 0, NULL, NULL, 'Card', 1564525427, 1, '0'),
(112, 'autem_726', 'Ipsam vel deleniti est quod distinctio nostrum quis.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 440, 0, 0, 690, 0, 1564093427, 1565216627, 0, NULL, NULL, 'Card', 1564352627, 0, '0'),
(113, 'sequi_743', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 250, 36, 28, 630, 1, 1564266227, 1564784627, 0, NULL, NULL, 'Card', 1564784627, 1, '0'),
(114, 'vitae_689', 'Quas tenetur in quaerat iusto expedita deleniti iste qui.', 69, '[{\"title\":\"Library fee\",\"amount\":\"300\"}]', 920, 15, 0, 160, 0, 1564525427, 1564957427, 1, NULL, NULL, 'Cheque', 1565475827, 0, '0'),
(115, 'sapiente_224', 'Quia ad quia qui repudiandae asperiores necessitatibus voluptatibus assumenda et consequatur rem.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 990, 32, 48, 490, 0, 1564698227, 1564957427, 1, NULL, NULL, 'Online', 1566253427, 0, '0'),
(116, 'quis_186', 'Eum sit corrupti consequatur architecto quia eos.', 61, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 670, 0, 0, 100, 1, 1564266227, 1565907827, 0, NULL, NULL, 'Cash', 1566167027, 0, '0'),
(117, 'alias_789', 'Expedita occaecati ipsum voluptatibus occaecati inventore vel atque.', 61, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 510, 48, 2, 800, 0, 1564698227, 1566167027, 0, NULL, NULL, 'Online', 1564007027, 1, '0'),
(118, 'minus_344', 'Consequatur voluptas commodi accusamus rerum sit.', 52, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 600, 0, 0, 460, 1, 1564611827, 1565562227, 0, NULL, NULL, 'Cheque', 1564093427, 0, '0'),
(119, 'id_602', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 70, 0, 46, 580, 1, 1564525427, 1565216627, 0, NULL, NULL, 'Cheque', 1566080627, 0, '0'),
(120, 'quis_320', NULL, 61, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 520, 13, 34, 220, 1, 1564093427, 1564784627, 0, NULL, NULL, 'Cash', 1565475827, 0, '0'),
(121, 'vero_984', NULL, 63, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 300, 0, 0, 50, 1, 1563834227, 1565994227, 0, NULL, NULL, 'Cheque', 1566080627, 1, '0'),
(122, 'distinctio_964', 'Molestiae mollitia veniam voluptatem nihil sunt perferendis in rerum earum saepe.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 930, 31, 27, 380, 0, 1564439027, 1565821427, 0, NULL, NULL, 'Online', 1564439027, 0, '0'),
(123, 'maxime_552', 'Ea quo architecto sequi eum ea sed non.', 61, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 540, 43, 43, 550, 0, 1563747827, 1564957427, 1, NULL, NULL, 'Bank Deposit', 1565303027, 1, '0'),
(124, 'fuga_827', NULL, 69, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 200, 0, 0, 980, 1, 1563834227, 1564871027, 0, NULL, NULL, 'Cash', 1563834227, 0, '0'),
(125, 'porro_487', 'Aut placeat dolor ab placeat accusantium.', 59, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 800, 0, 0, 560, 0, 1564698227, 1565303027, 0, NULL, NULL, 'Bank Deposit', 1564957427, 1, '0'),
(126, 'dignissimos_632', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 880, 0, 20, 240, 0, 1564179827, 1565389427, 0, NULL, NULL, 'Online', 1564957427, 0, '0'),
(127, 'vel_350', 'Sed quos laudantium doloremque repudiandae exercitationem laudantium commodi optio exercitationem.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 510, 38, 0, 720, 1, 1564093427, 1564957427, 0, NULL, NULL, 'Online', 1566080627, 1, '0'),
(128, 'nulla_669', 'Vel vel accusamus assumenda et in voluptatem minima.', 61, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 590, 27, 0, 130, 0, 1563747827, 1565994227, 0, NULL, NULL, 'Cheque', 1564611827, 0, '0'),
(129, 'soluta_224', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 810, 4, 35, 490, 0, 1564784627, 1565994227, 0, NULL, NULL, 'Card', 1564871027, 0, '0'),
(130, 'aspernatur_441', 'Sit soluta quis doloremque optio corporis omnis voluptatem.', 69, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 680, 45, 40, 810, 1, 1564698227, 1564784627, 0, NULL, NULL, 'Cheque', 1565389427, 0, '0'),
(131, 'ipsum_888', NULL, 59, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 440, 37, 26, 480, 1, 1564266227, 1564784627, 0, NULL, NULL, 'Cheque', 1564784627, 0, '0'),
(132, 'reprehenderit_134', 'Excepturi omnis blanditiis fuga quibusdam vel consequatur facere.', 48, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 840, 46, 0, 950, 1, 1563834227, 1564784627, 0, NULL, NULL, 'Online', 1565389427, 0, '0'),
(133, 'necessitatibus_693', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 200, 26, 7, 400, 0, 1564525427, 1564957427, 1, NULL, NULL, 'Bank Deposit', 1565389427, 0, '0'),
(134, 'quo_852', NULL, 61, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 940, 36, 1, 1000, 1, 1563747827, 1564784627, 0, NULL, NULL, 'Cash', 1564179827, 0, '0'),
(135, 'at_922', NULL, 64, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 820, 14, 4, 250, 1, 1564698227, 1565475827, 0, NULL, NULL, 'Cash', 1565216627, 0, '0'),
(136, 'sunt_893', 'Quidem vitae voluptas at quis labore voluptatem.', 67, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 270, 0, 4, 70, 0, 1564179827, 1564957427, 1, NULL, NULL, 'Card', 1565475827, 1, '0'),
(137, 'repellat_412', 'Eos nemo voluptatum minima reiciendis provident fuga eveniet labore.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 60, 0, 0, 160, 0, 1564698227, 1565821427, 0, NULL, NULL, 'Card', 1565821427, 0, '0'),
(138, 'provident_936', NULL, 46, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 70, 0, 30, 50, 1, 1564007027, 1566080627, 0, NULL, NULL, 'Cheque', 1566253427, 1, '0'),
(139, 'similique_544', 'Earum commodi et accusamus soluta.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 560, 0, 3, 260, 1, 1564266227, 1564784627, 0, NULL, NULL, 'Card', 1565475827, 1, '0'),
(140, 'voluptas_634', 'Aliquid voluptatibus est et inventore veniam inventore dicta vero qui.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 780, 0, 26, 210, 0, 1564611827, 1564871027, 1, NULL, NULL, 'Online', 1563834227, 1, '0'),
(141, 'non_296', NULL, 67, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 550, 30, 16, 830, 0, 1563920627, 1564871027, 1, NULL, NULL, 'Bank Deposit', 1563834227, 0, '0'),
(142, 'eum_404', 'Iure doloribus minus tempora atque sed sapiente quaerat.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 550, 0, 0, 880, 0, 1564611828, 1564871028, 1, NULL, NULL, 'Card', 1564007028, 0, '0'),
(143, 'ut_803', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 120, 14, 0, 470, 0, 1564439028, 1566339828, 0, NULL, NULL, 'Cash', 1566339828, 0, '0'),
(144, 'placeat_808', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 100, 29, 13, 970, 0, 1563920628, 1565303028, 0, NULL, NULL, 'Card', 1564179828, 1, '0'),
(145, 'pariatur_395', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 740, 0, 49, 90, 1, 1563747828, 1564871028, 0, NULL, NULL, 'Card', 1566167028, 1, '0'),
(146, 'repellat_531', NULL, 61, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 270, 3, 32, 750, 0, 1564784628, 1564784628, 1, NULL, NULL, 'Online', 1565994228, 1, '0'),
(147, 'fugit_158', 'Expedita minima itaque impedit et perferendis aut in saepe quibusdam.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 470, 46, 25, 330, 1, 1564007028, 1565389428, 0, NULL, NULL, 'Bank Deposit', 1565648628, 1, '0'),
(148, 'minus_606', 'Animi in et tempore voluptates adipisci sint.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 860, 34, 2, 540, 1, 1564179828, 1564957428, 0, NULL, NULL, 'Card', 1565562228, 0, '0'),
(149, 'nobis_147', 'Vel nam non voluptatibus et dolor quis ea.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 150, 42, 0, 880, 0, 1564093428, 1564871028, 1, NULL, NULL, 'Card', 1563747828, 1, '0'),
(150, 'maiores_394', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 500, 0, 23, 130, 0, 1564093428, 1565562228, 0, NULL, NULL, 'Online', 1565303028, 0, '0'),
(151, 'dolor_845', 'Exercitationem rem nihil eligendi quas magnam omnis quia.', 66, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 810, 20, 26, 520, 1, 1563747828, 1565821428, 0, NULL, NULL, 'Online', 1564266228, 0, '0'),
(152, 'occaecati_275', NULL, 48, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 1000, 0, 0, 740, 1, 1564525428, 1564784628, 0, NULL, NULL, 'Card', 1566339828, 0, '0'),
(153, 'ratione_436', 'Sunt doloremque tempora et perferendis quia nam.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 740, 0, 40, 910, 0, 1564784628, 1566253428, 0, NULL, NULL, 'Online', 1564179828, 0, '0'),
(154, 'sit_591', 'Similique aliquam ipsum temporibus ea exercitationem et tempore.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 210, 39, 0, 380, 0, 1564007028, 1566253428, 0, NULL, NULL, 'Cheque', 1564093428, 0, '0'),
(155, 'quisquam_995', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 70, 0, 0, 250, 0, 1564439028, 1564871028, 1, NULL, NULL, 'Online', 1565303028, 0, '0'),
(156, 'id_441', 'Iure quasi consectetur repellat similique ullam dolore.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 510, 13, 0, 320, 0, 1564179828, 1566167028, 0, NULL, NULL, 'Online', 1563834228, 1, '0'),
(157, 'maxime_606', 'Fuga dolorum vel qui nihil et deleniti incidunt quod odit quod.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 610, 0, 0, 730, 0, 1564266228, 1564784628, 1, NULL, NULL, 'Card', 1564611828, 0, '0'),
(158, 'quia_476', 'Ut optio et nesciunt non dolore ut provident labore.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 640, 0, 44, 350, 1, 1564439028, 1565216628, 0, NULL, NULL, 'Cash', 1564784628, 1, '0'),
(159, 'sed_966', NULL, 61, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 510, 0, 36, 820, 0, 1564698228, 1565303028, 0, NULL, NULL, 'Card', 1565994228, 1, '0'),
(160, 'maiores_897', 'Molestias quam esse amet et totam.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 590, 28, 0, 630, 0, 1564007028, 1564784628, 1, NULL, NULL, 'Card', 1566080628, 0, '0'),
(161, 'eveniet_262', 'Excepturi fugiat labore mollitia eligendi nemo illum architecto dicta suscipit impedit.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 740, 0, 22, 580, 1, 1564525428, 1565994228, 0, NULL, NULL, 'Cash', 1565389428, 1, '0'),
(162, 'non_319', NULL, 66, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 690, 0, 39, 660, 0, 1564093428, 1565475828, 0, NULL, NULL, 'Cheque', 1564784628, 1, '0'),
(163, 'quia_856', 'A aut magnam dolore tempore rerum sit.', 61, '[{\"title\":\"Building fee\",\"amount\":\"500\"}]', 710, 0, 15, 560, 0, 1563747828, 1565389428, 0, NULL, NULL, 'Bank Deposit', 1565216628, 0, '0'),
(164, 'dolore_752', 'Tempore omnis perferendis fugiat autem laboriosam sed fugiat laborum distinctio.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 960, 0, 26, 390, 0, 1564179828, 1564784628, 1, NULL, NULL, 'Bank Deposit', 1565130228, 0, '0'),
(165, 'sit_373', 'Et autem omnis esse et vel animi.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 970, 0, 0, 530, 0, 1564266228, 1564784628, 1, NULL, NULL, 'Online', 1565735028, 0, '0'),
(166, 'voluptates_319', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 70, 0, 42, 650, 1, 1563834228, 1565648628, 0, NULL, NULL, 'Card', 1565648628, 1, '0'),
(167, 'ullam_461', 'Aut consequatur eligendi dolorum et.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 470, 15, 0, 90, 1, 1563920628, 1565562228, 0, NULL, NULL, 'Card', 1564266228, 1, '0'),
(168, 'dolorem_426', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 160, 34, 0, 900, 1, 1563920628, 1564784628, 0, NULL, NULL, 'Cheque', 1566167028, 1, '0'),
(169, 'dolores_823', 'Nobis qui sunt magnam sunt tenetur consequatur non asperiores quo.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 140, 0, 0, 390, 0, 1564611828, 1566080628, 0, NULL, NULL, 'Cheque', 1564784628, 1, '0'),
(170, 'dicta_207', 'Rem omnis nostrum expedita et deserunt sapiente veritatis in quia ut reiciendis.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 1000, 0, 0, 910, 0, 1564352628, 1565130228, 1, NULL, NULL, 'Card', 1564439028, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(171, 'tempora_658', 'Omnis non saepe repellat ad necessitatibus itaque dolores quam nobis et.', 52, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 880, 47, 0, 650, 1, 1564093428, 1565216628, 0, NULL, NULL, 'Bank Deposit', 1564871028, 0, '0'),
(172, 'voluptate_165', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 320, 0, 0, 820, 0, 1563834228, 1565907828, 0, NULL, NULL, 'Cheque', 1566080628, 0, '0'),
(173, 'dolore_331', NULL, 46, ']', 460, 12, 0, 370, 0, 1564784628, 1564871028, 1, NULL, NULL, 'Cash', 1565475828, 0, '0'),
(174, 'neque_970', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 400, 0, 0, 130, 0, 1563920628, 1565735028, 0, NULL, NULL, 'Cash', 1564179828, 0, '0'),
(175, 'repellendus_344', 'Sunt voluptas quas explicabo ut sint id aut.', 69, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 790, 49, 19, 250, 1, 1564698228, 1565907828, 0, NULL, NULL, 'Card', 1565907828, 1, '0'),
(176, 'soluta_367', 'Sint similique vero ratione qui.', 61, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 680, 0, 22, 500, 0, 1564611828, 1564957428, 1, NULL, NULL, 'Online', 1565994228, 0, '0'),
(177, 'velit_115', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 140, 0, 0, 430, 0, 1564611828, 1564784628, 1, NULL, NULL, 'Cash', 1565303028, 0, '0'),
(178, 'enim_505', 'Placeat necessitatibus veniam facere id asperiores deleniti inventore.', 57, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 560, 0, 0, 880, 0, 1564179828, 1565130228, 1, NULL, NULL, 'Card', 1564439028, 0, '0'),
(179, 'eos_230', 'Id quisquam non officiis aut occaecati id et natus.', 67, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 50, 0, 0, 820, 1, 1564007028, 1564957428, 0, NULL, NULL, 'Cheque', 1565994228, 0, '0'),
(180, 'aliquid_820', NULL, 67, '[{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 880, 0, 35, 270, 1, 1564179828, 1565562228, 0, NULL, NULL, 'Cheque', 1563747828, 1, '0'),
(181, 'quas_800', NULL, 57, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 60, 0, 0, 600, 1, 1563920628, 1564784628, 0, NULL, NULL, 'Bank Deposit', 1564439028, 1, '0'),
(182, 'laborum_909', NULL, 60, '[{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 70, 6, 17, 620, 0, 1564093428, 1565562228, 0, NULL, NULL, 'Cheque', 1564179828, 1, '0'),
(183, 'qui_523', 'Sit vel consequatur corrupti nostrum eligendi sequi ipsum nisi perspiciatis.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 760, 29, 0, 100, 1, 1563920628, 1565475828, 0, NULL, NULL, 'Bank Deposit', 1564439028, 0, '0'),
(184, 'porro_638', 'Aliquid eum corrupti rerum alias aut totam sit libero enim.', 50, '[{\"title\":\"Library fee\",\"amount\":\"300\"}]', 70, 50, 46, 590, 1, 1564784628, 1564871028, 0, NULL, NULL, 'Online', 1564352628, 1, '0'),
(185, 'est_234', 'Non est alias omnis voluptatem qui magnam et ratione.', 67, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 470, 39, 38, 200, 0, 1564784628, 1564871028, 1, NULL, NULL, 'Bank Deposit', 1564266228, 1, '0'),
(186, 'velit_707', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 380, 42, 13, 590, 0, 1564611828, 1564871028, 1, NULL, NULL, 'Card', 1566167028, 0, '0'),
(187, 'accusantium_904', NULL, 66, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 440, 0, 25, 700, 1, 1564007028, 1564784628, 0, NULL, NULL, 'Online', 1565821428, 1, '0'),
(188, 'ea_815', 'Porro tenetur quis quaerat et et nihil repellendus id.', 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 510, 34, 39, 190, 1, 1563920628, 1564784628, 0, NULL, NULL, 'Card', 1565562228, 1, '0'),
(189, 'omnis_991', 'Modi non fugit tempore ad porro quam voluptatibus ipsa.', 46, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 160, 0, 32, 590, 1, 1564784628, 1564784628, 0, NULL, NULL, 'Cheque', 1566339828, 0, '0'),
(190, 'laudantium_665', 'Consequatur non doloremque voluptatem porro assumenda aut optio nihil laboriosam id.', 50, '[{\"title\":\"Library fee\",\"amount\":\"800\"}]', 550, 0, 0, 570, 1, 1564611828, 1565389428, 0, NULL, NULL, 'Online', 1566253428, 1, '0'),
(191, 'id_475', NULL, 66, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 200, 46, 25, 920, 0, 1563834228, 1565994228, 0, NULL, NULL, 'Card', 1564525428, 0, '0'),
(192, 'nihil_800', 'Ut consectetur illo qui at ipsam.', 57, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 650, 45, 0, 760, 0, 1563834228, 1564871028, 1, NULL, NULL, 'Bank Deposit', 1564266228, 0, '0'),
(193, 'eveniet_899', 'Odit autem sapiente nisi ut optio aspernatur aliquid ut.', 59, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 70, 0, 0, 980, 1, 1564352628, 1564871028, 0, NULL, NULL, 'Bank Deposit', 1565130228, 0, '0'),
(194, 'nihil_914', 'Ut veritatis repellendus et assumenda magni reiciendis tenetur.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 580, 0, 24, 400, 0, 1564611828, 1564871028, 1, NULL, NULL, 'Online', 1564266228, 0, '0'),
(195, 'voluptatum_479', 'Voluptates omnis earum dignissimos aut magni iure ut nemo.', 51, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 880, 13, 0, 60, 0, 1564784628, 1565907828, 0, NULL, NULL, 'Online', 1564352628, 0, '0'),
(196, 'repudiandae_709', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 410, 0, 9, 260, 0, 1564007029, 1566253429, 0, NULL, NULL, 'Cheque', 1564698229, 0, '0'),
(197, 'aliquid_577', 'Sint eius ipsa error aperiam esse aut iusto quis.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 610, 31, 6, 820, 0, 1564266229, 1564957429, 1, NULL, NULL, 'Card', 1566253429, 0, '0'),
(198, 'illo_542', 'Nisi est molestiae ratione rem quia.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 320, 13, 0, 790, 1, 1564352629, 1566339829, 0, NULL, NULL, 'Online', 1565389429, 0, '0'),
(199, 'ipsum_431', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 710, 0, 0, 190, 0, 1563920629, 1564957429, 1, NULL, NULL, 'Bank Deposit', 1565303029, 0, '0'),
(200, 'odit_973', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 500, 0, 2, 470, 1, 1564266229, 1564784629, 0, NULL, NULL, 'Cash', 1564093429, 0, '0'),
(201, 'rerum_279', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 850, 12, 15, 680, 1, 1564007029, 1565303029, 0, NULL, NULL, 'Bank Deposit', 1565216629, 1, '0'),
(202, 'dolores_483', NULL, 64, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 700, 50, 37, 240, 0, 1563920629, 1565475829, 0, NULL, NULL, 'Cheque', 1563747829, 1, '0'),
(203, 'magni_556', 'Voluptas eos optio magni unde eos sit consectetur.', 49, '[{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 860, 47, 0, 310, 0, 1564698229, 1564784629, 1, NULL, NULL, 'Bank Deposit', 1564352629, 1, '0'),
(204, 'commodi_116', 'Quidem nisi qui aut enim sed.', 60, '[{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 400, 0, 0, 150, 1, 1564007029, 1564871029, 0, NULL, NULL, 'Cheque', 1566167029, 0, '0'),
(205, 'soluta_420', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 300, 15, 0, 970, 0, 1563834229, 1565475829, 0, NULL, NULL, 'Card', 1564698229, 1, '0'),
(206, 'recusandae_475', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 140, 0, 49, 210, 0, 1564784629, 1564957429, 1, NULL, NULL, 'Cash', 1564093429, 0, '0'),
(207, 'libero_846', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 490, 0, 2, 550, 1, 1564784629, 1564871029, 0, NULL, NULL, 'Card', 1564179829, 0, '0'),
(208, 'quia_119', 'Facere eos ullam qui id quo qui nesciunt amet iure ut.', 61, ']', 340, 0, 0, 820, 1, 1564525429, 1565907829, 0, NULL, NULL, 'Online', 1566339829, 0, '0'),
(209, 'tenetur_249', NULL, 64, ']', 580, 22, 0, 610, 1, 1564179829, 1564957429, 0, NULL, NULL, 'Cash', 1565735029, 0, '0'),
(210, 'et_736', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 260, 0, 40, 320, 1, 1564698229, 1564957429, 0, NULL, NULL, 'Cash', 1564266229, 0, '0'),
(211, 'quam_214', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 880, 0, 0, 410, 0, 1564439029, 1566253429, 0, NULL, NULL, 'Online', 1563834229, 1, '0'),
(212, 'debitis_432', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 760, 0, 42, 470, 0, 1564007029, 1565907829, 0, NULL, NULL, 'Bank Deposit', 1566339829, 0, '0'),
(213, 'quod_433', 'Quia dignissimos natus nisi impedit consequatur deleniti repellendus vel inventore quas nostrum.', 50, '[{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 420, 44, 46, 710, 1, 1564439029, 1565303029, 0, NULL, NULL, 'Online', 1566339829, 0, '0'),
(214, 'non_996', 'Qui molestias perspiciatis voluptas laboriosam perspiciatis.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 490, 0, 18, 990, 0, 1564093429, 1565216629, 0, NULL, NULL, 'Cheque', 1565735029, 1, '0'),
(215, 'non_880', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 340, 0, 0, 240, 1, 1564352629, 1565994229, 0, NULL, NULL, 'Cash', 1564611829, 0, '0'),
(216, 'non_265', 'Consectetur explicabo minus error consequatur distinctio beatae qui.', 64, '[{\"title\":\"Building fee\",\"amount\":\"100\"}]', 990, 0, 0, 790, 0, 1564352629, 1564957429, 1, NULL, NULL, 'Card', 1564093429, 0, '0'),
(217, 'consequatur_850', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 360, 0, 0, 210, 0, 1564698229, 1564784629, 1, NULL, NULL, 'Cash', 1566339829, 1, '0'),
(218, 'sed_225', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 670, 17, 23, 910, 0, 1564007029, 1565303029, 0, NULL, NULL, 'Cash', 1565303029, 0, '0'),
(219, 'magni_294', NULL, 69, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 50, 8, 13, 170, 0, 1563747829, 1564871029, 1, NULL, NULL, 'Bank Deposit', 1565303029, 0, '0'),
(220, 'at_943', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 310, 0, 0, 540, 1, 1563834229, 1565648629, 0, NULL, NULL, 'Online', 1565303029, 1, '0'),
(221, 'occaecati_755', 'A aliquid sit consequuntur tempore earum voluptates sed neque nostrum.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 920, 0, 6, 870, 0, 1564611829, 1564957429, 1, NULL, NULL, 'Card', 1565130229, 1, '0'),
(222, 'velit_415', NULL, 61, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 570, 2, 0, 610, 0, 1564266229, 1564871029, 1, NULL, NULL, 'Card', 1563834229, 0, '0'),
(223, 'sunt_232', 'Quam voluptatem quo soluta quia qui repellendus.', 63, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 670, 39, 0, 510, 0, 1563920629, 1564784629, 1, NULL, NULL, 'Cash', 1565130229, 0, '0'),
(224, 'doloremque_353', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 750, 22, 8, 650, 1, 1563834229, 1565735029, 0, NULL, NULL, 'Bank Deposit', 1565389429, 0, '0'),
(225, 'iste_375', NULL, 57, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 950, 0, 0, 750, 0, 1564007029, 1566167029, 0, NULL, NULL, 'Card', 1564784629, 0, '0'),
(226, 'distinctio_463', 'Possimus cupiditate voluptatem ad vel distinctio amet nostrum voluptas occaecati.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 940, 0, 0, 460, 0, 1563920629, 1564871029, 1, NULL, NULL, 'Cash', 1565562229, 1, '0'),
(227, 'eligendi_358', 'Eos qui nobis delectus occaecati rem vel quaerat ratione soluta perferendis architecto.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 920, 0, 0, 460, 1, 1563834229, 1565475829, 0, NULL, NULL, 'Online', 1565648629, 0, '0'),
(228, 'corporis_916', 'Ut repudiandae rerum voluptatem et laboriosam sint qui.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 530, 2, 0, 180, 0, 1563834229, 1565303029, 0, NULL, NULL, 'Online', 1564179829, 0, '0'),
(229, 'illo_382', NULL, 61, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 960, 0, 0, 520, 0, 1563747829, 1564784629, 1, NULL, NULL, 'Bank Deposit', 1565389429, 1, '0'),
(230, 'eos_206', 'Assumenda quasi omnis optio dolorem eius ut.', 59, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 950, 0, 30, 1000, 0, 1564698229, 1565475829, 0, NULL, NULL, 'Bank Deposit', 1565389429, 0, '0'),
(231, 'a_946', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 270, 4, 3, 970, 0, 1564093429, 1564784629, 1, NULL, NULL, 'Card', 1564784629, 0, '0'),
(232, 'non_911', 'Sit aut facilis repellat eos quisquam autem ut ad alias ut facere.', 50, ']', 590, 50, 7, 1000, 1, 1564698229, 1565389429, 0, NULL, NULL, 'Card', 1563834229, 1, '0'),
(233, 'qui_652', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 920, 48, 0, 800, 0, 1564611829, 1565303029, 0, NULL, NULL, 'Card', 1565303029, 0, '0'),
(234, 'occaecati_759', 'Autem ut natus ipsa architecto et.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 780, 5, 17, 620, 0, 1564179829, 1564957429, 1, NULL, NULL, 'Cash', 1565389429, 0, '0'),
(235, 'rerum_661', 'Placeat veniam minima ea nam soluta nihil.', 69, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 690, 0, 45, 80, 0, 1564611829, 1564784629, 1, NULL, NULL, 'Card', 1565389429, 1, '0'),
(236, 'assumenda_392', 'Dolores sunt id sit quo facere impedit mollitia vel.', 66, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 780, 32, 0, 460, 0, 1564266229, 1565994229, 0, NULL, NULL, 'Cash', 1566167029, 0, '0'),
(237, 'voluptas_689', NULL, 60, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 240, 28, 0, 210, 0, 1564266229, 1564871029, 1, NULL, NULL, 'Bank Deposit', 1564439029, 0, '0'),
(238, 'non_415', NULL, 67, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 50, 7, 10, 210, 1, 1563747829, 1564871029, 0, NULL, NULL, 'Card', 1564525429, 1, '0'),
(239, 'quia_473', 'Delectus beatae hic dolorem labore reprehenderit necessitatibus.', 60, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 560, 47, 0, 110, 1, 1563920629, 1564871029, 0, NULL, NULL, 'Bank Deposit', 1565994229, 1, '0'),
(240, 'temporibus_444', 'Quaerat inventore eius facilis quia repellat.', 46, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 150, 0, 0, 510, 1, 1564266229, 1564957429, 0, NULL, NULL, 'Card', 1563920629, 0, '0'),
(241, 'et_818', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 920, 0, 0, 900, 1, 1564266229, 1566167029, 0, NULL, NULL, 'Card', 1563747829, 1, '0'),
(242, 'exercitationem_872', 'Architecto placeat nihil est dolorem.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 450, 0, 0, 950, 1, 1564698229, 1565130229, 0, NULL, NULL, 'Cheque', 1564352629, 1, '0'),
(243, 'ut_462', 'Ullam tempore assumenda quasi et quaerat deserunt modi.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 60, 10, 0, 670, 0, 1564698229, 1564784629, 1, NULL, NULL, 'Cheque', 1563747829, 0, '0'),
(244, 'qui_854', NULL, 61, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 50, 20, 0, 550, 0, 1563834229, 1565735029, 0, NULL, NULL, 'Cash', 1564266229, 1, '0'),
(245, 'officiis_994', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 880, 3, 0, 890, 0, 1563747829, 1566339829, 0, NULL, NULL, 'Cheque', 1564439029, 1, '0'),
(246, 'vitae_115', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 930, 0, 0, 920, 0, 1563834229, 1565648629, 0, NULL, NULL, 'Card', 1564611829, 0, '0'),
(247, 'voluptatem_491', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 510, 30, 36, 720, 0, 1564698229, 1564957429, 1, NULL, NULL, 'Cheque', 1565303029, 1, '0'),
(248, 'doloribus_435', 'Officiis commodi dolor dolores voluptas harum est et commodi sunt recusandae et.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 160, 32, 8, 710, 1, 1563834230, 1566253430, 0, NULL, NULL, 'Cash', 1564611830, 1, '0'),
(249, 'voluptatem_352', NULL, 57, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 200, 48, 0, 380, 0, 1564439030, 1566167030, 0, NULL, NULL, 'Cash', 1565130230, 1, '0'),
(250, 'natus_334', 'Quas et voluptatibus velit amet suscipit ullam voluptates totam.', 60, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 940, 0, 0, 480, 0, 1564093430, 1564957430, 1, NULL, NULL, 'Online', 1566080630, 0, '0'),
(251, 'et_748', NULL, 64, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 500, 13, 26, 840, 1, 1564007030, 1564957430, 0, NULL, NULL, 'Card', 1564352630, 1, '0'),
(252, 'odit_217', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 760, 50, 0, 990, 0, 1564266230, 1564957430, 1, NULL, NULL, 'Cheque', 1564784630, 0, '0'),
(253, 'nobis_618', 'Occaecati sit eum nihil molestias unde sequi.', 61, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 620, 27, 2, 260, 0, 1564439030, 1564957430, 1, NULL, NULL, 'Bank Deposit', 1564352630, 1, '0'),
(254, 'doloremque_268', 'Incidunt eveniet sequi et aliquam vel voluptas a.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 280, 0, 0, 580, 0, 1564698230, 1565303030, 0, NULL, NULL, 'Online', 1564352630, 0, '0'),
(255, 'libero_425', 'Consectetur repudiandae qui est voluptatem ullam et.', 50, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 980, 0, 0, 680, 0, 1564439030, 1565648630, 0, NULL, NULL, 'Bank Deposit', 1565994230, 0, '0'),
(256, 'temporibus_555', 'Voluptatem non vel voluptatibus et ipsam et iusto quia repellendus sit.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 90, 27, 39, 670, 1, 1564611830, 1566253430, 0, NULL, NULL, 'Bank Deposit', 1563747830, 1, '0'),
(257, 'facere_629', 'Nihil voluptas qui dolores quo perspiciatis dolorem quia minima consectetur id.', 67, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 790, 0, 11, 180, 0, 1564352630, 1564784630, 1, NULL, NULL, 'Online', 1564179830, 0, '0'),
(258, 'iusto_369', 'Beatae dolorum aut repudiandae ea possimus et earum.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 840, 9, 0, 800, 0, 1564439030, 1564871030, 1, NULL, NULL, 'Online', 1564179830, 1, '0'),
(259, 'rerum_225', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 400, 28, 0, 540, 1, 1563747830, 1565648630, 0, NULL, NULL, 'Cash', 1564007030, 1, '0'),
(260, 'aliquid_698', NULL, 51, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 80, 0, 19, 960, 1, 1563747830, 1564871030, 0, NULL, NULL, 'Cash', 1563747830, 1, '0'),
(261, 'animi_733', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 100, 0, 6, 650, 0, 1563834230, 1566080630, 0, NULL, NULL, 'Card', 1565994230, 0, '0'),
(262, 'adipisci_428', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 760, 0, 30, 530, 0, 1564266230, 1564784630, 1, NULL, NULL, 'Bank Deposit', 1565907830, 0, '0'),
(263, 'quis_104', 'Recusandae dolores sit modi suscipit pariatur incidunt.', 64, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 150, 42, 0, 50, 0, 1564611830, 1564784630, 1, NULL, NULL, 'Bank Deposit', 1565648630, 0, '0'),
(264, 'mollitia_593', 'Accusantium provident nihil saepe officiis nam dolore.', 59, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 710, 39, 15, 450, 1, 1564179830, 1564871030, 0, NULL, NULL, 'Online', 1565821430, 1, '0'),
(265, 'facere_498', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 930, 33, 3, 480, 0, 1563834230, 1564871030, 1, NULL, NULL, 'Card', 1565130230, 0, '0'),
(266, 'veniam_500', 'Eos facere quia corrupti dolores expedita adipisci labore voluptatem enim incidunt.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 500, 39, 13, 240, 0, 1564093430, 1564871030, 1, NULL, NULL, 'Bank Deposit', 1565130230, 1, '0'),
(267, 'expedita_157', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 460, 42, 0, 470, 0, 1564784630, 1564957430, 1, NULL, NULL, 'Card', 1565303030, 0, '0'),
(268, 'accusamus_756', 'Accusantium sit fugiat qui inventore saepe.', 61, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 240, 0, 5, 610, 0, 1564611830, 1565475830, 0, NULL, NULL, 'Card', 1564093430, 0, '0'),
(269, 'quas_936', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 970, 33, 0, 410, 0, 1564007030, 1564784630, 1, NULL, NULL, 'Card', 1566080630, 0, '0'),
(270, 'in_144', NULL, 61, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 280, 38, 0, 470, 0, 1564266230, 1564871030, 1, NULL, NULL, 'Bank Deposit', 1565735030, 1, '0'),
(271, 'nihil_783', NULL, 66, '[{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 510, 0, 39, 970, 0, 1563920630, 1566253430, 0, NULL, NULL, 'Cash', 1564525430, 0, '0'),
(272, 'quas_285', 'Accusantium eius in quia accusamus qui et facere et tempora.', 61, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 80, 0, 31, 620, 0, 1564525430, 1564871030, 1, NULL, NULL, 'Card', 1563834230, 1, '0'),
(273, 'incidunt_631', NULL, 66, '[{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 80, 0, 44, 930, 1, 1563747830, 1565475830, 0, NULL, NULL, 'Bank Deposit', 1564611830, 1, '0'),
(274, 'ratione_294', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 600, 0, 0, 80, 1, 1564611830, 1564871030, 0, NULL, NULL, 'Cheque', 1564093430, 1, '0'),
(275, 'enim_979', 'Qui minus est totam ipsam quia tenetur delectus necessitatibus dolor praesentium.', 52, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 810, 0, 5, 70, 0, 1563920630, 1564957430, 1, NULL, NULL, 'Bank Deposit', 1565562230, 1, '0'),
(276, 'ut_880', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 110, 0, 0, 550, 0, 1564266230, 1565216630, 0, NULL, NULL, 'Card', 1564871030, 0, '0'),
(277, 'repudiandae_982', NULL, 51, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 890, 50, 0, 610, 1, 1563834230, 1564871030, 0, NULL, NULL, 'Online', 1565907830, 1, '0'),
(278, 'quisquam_996', NULL, 60, ']', 670, 0, 0, 930, 1, 1564611830, 1566253430, 0, NULL, NULL, 'Cheque', 1565562230, 1, '0'),
(279, 'nulla_148', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 910, 50, 3, 730, 1, 1563747830, 1564957430, 0, NULL, NULL, 'Cheque', 1564179830, 1, '0'),
(280, 'voluptatibus_157', NULL, 63, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 120, 0, 40, 580, 0, 1564698230, 1565130230, 1, NULL, NULL, 'Cash', 1565130230, 0, '0'),
(281, 'enim_485', 'Facere quod consequatur rerum consequuntur maiores sit.', 48, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 560, 0, 0, 510, 0, 1564439030, 1565907830, 0, NULL, NULL, 'Cheque', 1564871030, 0, '0'),
(282, 'est_794', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 130, 0, 8, 830, 1, 1564093430, 1565303030, 0, NULL, NULL, 'Cash', 1564957430, 1, '0'),
(283, 'rerum_786', 'Ratione sed alias quam vel suscipit animi odio fugiat.', 61, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 160, 17, 0, 300, 1, 1564093430, 1565994230, 0, NULL, NULL, 'Cheque', 1563920630, 0, '0'),
(284, 'sed_857', NULL, 46, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 730, 36, 0, 90, 0, 1564093430, 1566253430, 0, NULL, NULL, 'Card', 1563834230, 1, '0'),
(285, 'dignissimos_470', 'Voluptas cumque voluptas est sed magnam eaque tempore vitae.', 59, '[{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 260, 0, 46, 600, 1, 1564439030, 1564957430, 0, NULL, NULL, 'Card', 1563834230, 0, '0'),
(286, 'sunt_868', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 820, 37, 0, 610, 1, 1564784630, 1565475830, 0, NULL, NULL, 'Cash', 1564871030, 0, '0'),
(287, 'distinctio_125', 'Ipsam voluptatibus ipsum ipsum tenetur mollitia praesentium aut nisi deserunt.', 51, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 840, 0, 29, 850, 0, 1564698230, 1564957430, 1, NULL, NULL, 'Cheque', 1566080630, 0, '0'),
(288, 'ipsa_844', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 240, 22, 45, 550, 0, 1564266230, 1566080630, 0, NULL, NULL, 'Online', 1566167030, 0, '0'),
(289, 'mollitia_914', 'Quasi sed voluptate ipsam quibusdam vel.', 61, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 740, 23, 0, 60, 1, 1564698230, 1564784630, 0, NULL, NULL, 'Cheque', 1564179830, 1, '0'),
(290, 'provident_464', NULL, 66, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 210, 2, 0, 230, 0, 1564179830, 1566339830, 0, NULL, NULL, 'Online', 1565735030, 0, '0'),
(291, 'ullam_269', 'A adipisci officia est vitae laboriosam.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 90, 0, 6, 830, 1, 1563747830, 1565303030, 0, NULL, NULL, 'Cheque', 1565994230, 0, '0'),
(292, 'et_607', 'Illum eveniet non eos et iusto quod laboriosam et nesciunt et.', 51, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 80, 0, 0, 990, 1, 1564525430, 1564871030, 0, NULL, NULL, 'Bank Deposit', 1565303030, 1, '0'),
(293, 'amet_197', 'Iure inventore rerum aspernatur nulla ex.', 66, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 840, 0, 15, 260, 0, 1563920630, 1565562230, 0, NULL, NULL, 'Cash', 1563920630, 1, '0'),
(294, 'ullam_473', NULL, 51, '[{\"title\":\"Building fee\",\"amount\":\"200\"}]', 800, 0, 0, 330, 1, 1564352630, 1564784630, 0, NULL, NULL, 'Cash', 1564698230, 0, '0'),
(295, 'aliquam_976', NULL, 66, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 810, 47, 36, 180, 0, 1563920630, 1565216630, 0, NULL, NULL, 'Cash', 1564611830, 0, '0'),
(296, 'corrupti_688', NULL, 67, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 710, 0, 0, 790, 1, 1563920630, 1566339830, 0, NULL, NULL, 'Cash', 1565303030, 1, '0'),
(297, 'rerum_488', 'Quo ab nulla et reprehenderit expedita aliquid.', 63, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 430, 10, 0, 940, 1, 1564007030, 1564871030, 0, NULL, NULL, 'Online', 1566167030, 0, '0'),
(298, 'eaque_405', 'Consequatur laborum sequi enim nulla ut doloribus.', 61, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 80, 33, 41, 380, 0, 1564525430, 1564784630, 1, NULL, NULL, 'Cheque', 1565648630, 0, '0'),
(299, 'qui_815', 'Minima omnis ab quos voluptatem iusto numquam.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 990, 14, 2, 150, 0, 1564179830, 1564957430, 1, NULL, NULL, 'Bank Deposit', 1566253430, 0, '0'),
(300, 'soluta_782', 'Et nulla facere omnis autem expedita ut reiciendis quis officia.', 64, '[{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 970, 29, 0, 860, 0, 1563834231, 1564784631, 1, NULL, NULL, 'Card', 1565389431, 0, '0'),
(301, 'quia_172', NULL, 51, '[{\"title\":\"Library fee\",\"amount\":\"100\"}]', 700, 0, 10, 250, 0, 1563920631, 1565907831, 0, NULL, NULL, 'Cheque', 1565130231, 0, '0'),
(302, 'magni_605', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 200, 0, 0, 500, 1, 1564698231, 1564957431, 0, NULL, NULL, 'Cheque', 1565735031, 0, '0'),
(303, 'temporibus_700', NULL, 63, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 60, 31, 0, 390, 0, 1564266231, 1565735031, 0, NULL, NULL, 'Bank Deposit', 1566080631, 0, '0'),
(304, 'pariatur_638', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 340, 0, 35, 140, 1, 1564352631, 1564784631, 0, NULL, NULL, 'Online', 1565821431, 1, '0'),
(305, 'quo_463', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 400, 0, 38, 400, 1, 1564525431, 1564784631, 0, NULL, NULL, 'Online', 1565648631, 0, '0'),
(306, 'aspernatur_973', NULL, 69, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 370, 0, 0, 590, 0, 1564352631, 1564784631, 1, NULL, NULL, 'Bank Deposit', 1565130231, 1, '0'),
(307, 'necessitatibus_945', 'Sit eaque quis sunt recusandae eligendi ab unde dolorum voluptate inventore.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 520, 45, 0, 490, 0, 1564525431, 1566339831, 0, NULL, NULL, 'Cash', 1563920631, 1, '0'),
(308, 'aliquid_229', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 130, 9, 0, 810, 0, 1563834231, 1564871031, 1, NULL, NULL, 'Cash', 1565907831, 0, '0'),
(309, 'laudantium_569', 'Quas dolore veritatis numquam necessitatibus mollitia veritatis dolorum a voluptas.', 61, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"}]', 230, 0, 43, 210, 0, 1564784631, 1565130231, 1, NULL, NULL, 'Online', 1564871031, 0, '0'),
(310, 'aspernatur_997', 'Deleniti eos consectetur aspernatur sit omnis dolore.', 61, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 360, 41, 48, 630, 0, 1564525431, 1565821431, 0, NULL, NULL, 'Bank Deposit', 1566339831, 0, '0'),
(311, 'quibusdam_707', NULL, 63, '[{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 100, 31, 15, 670, 1, 1564093431, 1566339831, 0, NULL, NULL, 'Online', 1564698231, 0, '0'),
(312, 'molestias_781', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 650, 0, 50, 980, 1, 1563920631, 1565475831, 0, NULL, NULL, 'Bank Deposit', 1566339831, 0, '0'),
(313, 'quia_381', NULL, 52, '[{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 620, 0, 21, 960, 1, 1564007031, 1565389431, 0, NULL, NULL, 'Card', 1564871031, 1, '0'),
(314, 'molestias_816', 'Dicta nihil quia delectus quae sequi et.', 60, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 640, 17, 0, 940, 1, 1564439031, 1564784631, 0, NULL, NULL, 'Cheque', 1564784631, 0, '0'),
(315, 'ut_600', 'Tempora minus repellat eos omnis et excepturi sint velit.', 64, '[{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 510, 36, 0, 760, 0, 1564698231, 1564957431, 1, NULL, NULL, 'Cash', 1565994231, 0, '0'),
(316, 'mollitia_741', 'Sed numquam non officiis ab officia.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 1000, 0, 0, 430, 1, 1563920631, 1565821431, 0, NULL, NULL, 'Card', 1566080631, 1, '0'),
(317, 'qui_556', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 650, 28, 23, 180, 1, 1564093431, 1565907831, 0, NULL, NULL, 'Cheque', 1565216631, 1, '0'),
(318, 'rerum_509', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 640, 47, 27, 190, 1, 1564611831, 1564784631, 0, NULL, NULL, 'Cheque', 1564871031, 1, '0'),
(319, 'fugiat_879', NULL, 67, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 50, 43, 10, 180, 0, 1564784631, 1564784631, 1, NULL, NULL, 'Card', 1565648631, 1, '0'),
(320, 'facere_392', NULL, 49, '[{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 860, 24, 0, 370, 0, 1564698231, 1565303031, 0, NULL, NULL, 'Cheque', 1564784631, 0, '0'),
(321, 'quas_797', NULL, 48, '[{\"title\":\"Library fee\",\"amount\":\"400\"}]', 610, 37, 0, 750, 1, 1564698231, 1565994231, 0, NULL, NULL, 'Cash', 1565216631, 1, '0'),
(322, 'aut_171', 'Quo dolorem est minima molestiae repellendus pariatur voluptatum omnis.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 360, 0, 50, 50, 1, 1564266231, 1564871031, 0, NULL, NULL, 'Cash', 1565475831, 1, '0'),
(323, 'dolorem_585', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 200, 17, 0, 780, 1, 1564093431, 1564784631, 0, NULL, NULL, 'Cash', 1565648631, 1, '0'),
(324, 'nihil_997', NULL, 61, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 560, 16, 27, 100, 1, 1563834231, 1565821431, 0, NULL, NULL, 'Online', 1564093431, 0, '0'),
(325, 'maiores_684', NULL, 60, '[{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 310, 50, 0, 320, 0, 1564007031, 1564957431, 1, NULL, NULL, 'Cheque', 1565389431, 1, '0'),
(326, 'impedit_460', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 580, 0, 7, 340, 1, 1564179831, 1564871031, 0, NULL, NULL, 'Card', 1563920631, 0, '0'),
(327, 'dolores_646', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 220, 0, 0, 200, 1, 1564352631, 1565389431, 0, NULL, NULL, 'Online', 1565130231, 0, '0'),
(328, 'porro_254', 'Nihil placeat exercitationem rerum officia nam dignissimos et.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 860, 0, 0, 330, 1, 1564698231, 1564871031, 0, NULL, NULL, 'Bank Deposit', 1565389431, 0, '0'),
(329, 'dolor_560', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 490, 0, 0, 850, 1, 1563920631, 1565735031, 0, NULL, NULL, 'Card', 1564439031, 0, '0'),
(330, 'soluta_739', 'Non mollitia quia in eos rem beatae ipsam magni veniam earum.', 61, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 810, 0, 19, 610, 1, 1564179831, 1564784631, 0, NULL, NULL, 'Cheque', 1564525431, 0, '0'),
(331, 'voluptatem_257', 'Consequatur et voluptatem aut qui.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 970, 32, 35, 320, 0, 1564007031, 1564784631, 1, NULL, NULL, 'Card', 1565735031, 0, '0'),
(332, 'et_300', 'Quo rerum inventore tempore qui.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 850, 0, 41, 1000, 1, 1564266231, 1566167031, 0, NULL, NULL, 'Bank Deposit', 1565994231, 0, '0'),
(333, 'possimus_276', 'Voluptatibus nobis et modi natus sit.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 520, 0, 0, 330, 0, 1564525431, 1565821431, 0, NULL, NULL, 'Bank Deposit', 1565994231, 0, '0'),
(334, 'natus_656', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 400, 0, 0, 910, 1, 1564525431, 1566167031, 0, NULL, NULL, 'Bank Deposit', 1564871031, 1, '0'),
(335, 'aut_408', NULL, 63, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 370, 50, 11, 760, 0, 1564611831, 1565216631, 0, NULL, NULL, 'Cheque', 1564439031, 1, '0'),
(336, 'dolor_645', 'Adipisci laborum blanditiis voluptatem fugiat eligendi.', 46, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 90, 0, 0, 560, 1, 1563920631, 1565907831, 0, NULL, NULL, 'Cheque', 1565303031, 0, '0'),
(337, 'et_569', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 790, 0, 0, 250, 1, 1564611831, 1564871031, 0, NULL, NULL, 'Bank Deposit', 1564871031, 0, '0'),
(338, 'nulla_665', NULL, 60, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 930, 31, 0, 620, 1, 1564698231, 1564871031, 0, NULL, NULL, 'Online', 1564957431, 0, '0'),
(339, 'sed_404', NULL, 66, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 630, 13, 32, 140, 0, 1563920631, 1565735031, 0, NULL, NULL, 'Cheque', 1564871031, 1, '0'),
(340, 'enim_503', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 780, 32, 40, 410, 0, 1564266231, 1566339831, 0, NULL, NULL, 'Cash', 1564871031, 0, '0'),
(341, 'omnis_979', 'Voluptatem aut et accusantium molestiae doloremque delectus aut non ab non doloremque.', 50, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 340, 0, 31, 820, 0, 1564266231, 1566080631, 0, NULL, NULL, 'Bank Deposit', 1564611831, 1, '0'),
(342, 'illum_185', NULL, 60, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 130, 0, 16, 820, 0, 1563834231, 1565735031, 0, NULL, NULL, 'Online', 1564352631, 1, '0'),
(343, 'et_400', NULL, 48, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 680, 22, 12, 830, 1, 1564093432, 1565735032, 0, NULL, NULL, 'Bank Deposit', 1564352632, 0, '0'),
(344, 'voluptas_392', 'Et nostrum perspiciatis quibusdam enim sit dolorem sunt qui ipsa esse.', 60, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 490, 41, 39, 990, 1, 1563920632, 1564957432, 0, NULL, NULL, 'Online', 1563834232, 1, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(345, 'repudiandae_275', 'Ea adipisci culpa alias at est autem ea.', 57, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 510, 0, 0, 340, 1, 1564352632, 1564871032, 0, NULL, NULL, 'Card', 1564784632, 1, '0'),
(346, 'neque_738', 'Quia sed mollitia reiciendis id dolore aut eaque rerum illo mollitia.', 60, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 810, 10, 37, 280, 1, 1564352632, 1564871032, 0, NULL, NULL, 'Online', 1566167032, 1, '0'),
(347, 'eaque_594', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 270, 7, 0, 260, 0, 1564007032, 1564784632, 1, NULL, NULL, 'Online', 1563747832, 0, '0'),
(348, 'qui_345', 'Ea nostrum minus quae modi iste nesciunt.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 130, 44, 24, 540, 0, 1563747832, 1564784632, 1, NULL, NULL, 'Card', 1565994232, 0, '0'),
(349, 'ut_360', 'Consequatur dolor aut illum non sint.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 670, 0, 0, 230, 1, 1563834232, 1564784632, 0, NULL, NULL, 'Bank Deposit', 1565562232, 1, '0'),
(350, 'et_866', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 840, 49, 20, 200, 0, 1564266232, 1564871032, 1, NULL, NULL, 'Cheque', 1565389432, 1, '0'),
(351, 'magnam_756', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 640, 0, 0, 800, 0, 1564093432, 1566167032, 0, NULL, NULL, 'Card', 1564611832, 0, '0'),
(352, 'commodi_223', 'Sint aliquam architecto ea ducimus aspernatur dolorem accusamus quia.', 57, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 860, 20, 0, 680, 1, 1564266232, 1564957432, 0, NULL, NULL, 'Card', 1563920632, 0, '0'),
(353, 'sunt_621', 'Deserunt numquam et rerum qui rerum facere quis.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 960, 17, 47, 940, 1, 1564352632, 1565821432, 0, NULL, NULL, 'Bank Deposit', 1564007032, 0, '0'),
(354, 'ut_425', NULL, 61, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 540, 0, 24, 770, 1, 1564007032, 1566167032, 0, NULL, NULL, 'Online', 1566253432, 1, '0'),
(355, 'a_935', NULL, 50, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 660, 0, 0, 730, 1, 1563920632, 1564957432, 0, NULL, NULL, 'Bank Deposit', 1565735032, 1, '0'),
(356, 'cupiditate_459', 'Omnis porro est dicta voluptas officia natus perspiciatis.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 500, 17, 29, 960, 0, 1563920632, 1564871032, 1, NULL, NULL, 'Cheque', 1565648632, 1, '0'),
(357, 'blanditiis_698', 'Ipsam incidunt velit distinctio sit quod et quidem alias.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 60, 10, 0, 520, 0, 1564525432, 1564871032, 1, NULL, NULL, 'Cash', 1564266232, 1, '0'),
(358, 'incidunt_751', 'Eligendi vitae eum molestias facere.', 67, ']', 90, 0, 0, 550, 1, 1563834232, 1565562232, 0, NULL, NULL, 'Card', 1564525432, 1, '0'),
(359, 'aspernatur_623', NULL, 52, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 500, 33, 0, 180, 0, 1564611832, 1564784632, 1, NULL, NULL, 'Online', 1565389432, 0, '0'),
(360, 'laborum_645', 'Sint optio deserunt qui laborum culpa non corporis voluptatem dolorem.', 63, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 930, 0, 0, 50, 0, 1563834232, 1565735032, 0, NULL, NULL, 'Online', 1564957432, 1, '0'),
(361, 'consequatur_975', NULL, 57, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 280, 5, 0, 190, 0, 1564525432, 1564957432, 1, NULL, NULL, 'Card', 1564093432, 1, '0'),
(362, 'commodi_828', NULL, 49, ']', 510, 50, 0, 100, 1, 1564439032, 1565907832, 0, NULL, NULL, 'Card', 1563834232, 0, '0'),
(363, 'dolores_926', 'Debitis explicabo beatae nam soluta est voluptas.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 150, 0, 12, 730, 0, 1564266232, 1566339832, 0, NULL, NULL, 'Card', 1564352632, 1, '0'),
(364, 'id_560', NULL, 46, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 120, 0, 7, 370, 0, 1564439032, 1564957432, 1, NULL, NULL, 'Card', 1564698232, 1, '0'),
(365, 'sed_231', 'Incidunt et optio recusandae dolor rerum.', 51, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 990, 0, 1, 440, 0, 1564611832, 1564784632, 1, NULL, NULL, 'Cheque', 1564179832, 1, '0'),
(366, 'assumenda_579', NULL, 49, '[{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 500, 21, 8, 260, 0, 1563834232, 1564957432, 1, NULL, NULL, 'Card', 1565648632, 1, '0'),
(367, 'occaecati_242', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 980, 0, 0, 860, 0, 1564698232, 1564871032, 1, NULL, NULL, 'Bank Deposit', 1565130232, 1, '0'),
(368, 'aut_159', 'Aut animi optio est unde sit rem.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 340, 23, 27, 370, 0, 1564784632, 1564784632, 1, NULL, NULL, 'Cash', 1564439032, 1, '0'),
(369, 'minus_767', 'Ex quisquam doloremque enim distinctio ex.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 50, 0, 0, 240, 1, 1564093432, 1565303032, 0, NULL, NULL, 'Card', 1563834232, 1, '0'),
(370, 'sit_612', 'Omnis sapiente commodi eaque praesentium molestias nihil.', 61, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 520, 5, 40, 400, 1, 1563747832, 1565735032, 0, NULL, NULL, 'Card', 1566339832, 1, '0'),
(371, 'sint_549', 'Deserunt nihil expedita ipsa blanditiis ea velit.', 50, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 110, 27, 15, 570, 1, 1563834232, 1564957432, 0, NULL, NULL, 'Bank Deposit', 1566339832, 0, '0'),
(372, 'quis_142', NULL, 60, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 500, 0, 0, 760, 0, 1564352632, 1565303032, 0, NULL, NULL, 'Cash', 1564007032, 1, '0'),
(373, 'iste_833', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 840, 16, 0, 500, 0, 1564784632, 1566253432, 0, NULL, NULL, 'Online', 1565389432, 0, '0'),
(374, 'molestiae_467', 'Et sunt nam id rem voluptatem aspernatur excepturi.', 52, '[{\"title\":\"Library fee\",\"amount\":\"200\"}]', 760, 17, 0, 740, 1, 1564784632, 1564871032, 0, NULL, NULL, 'Card', 1564698232, 0, '0'),
(375, 'est_186', 'Aliquid optio est autem amet facilis.', 50, '[{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 910, 0, 0, 820, 0, 1564179832, 1564871032, 1, NULL, NULL, 'Cash', 1566339832, 0, '0'),
(376, 'ut_725', 'Et debitis eaque saepe velit dolores at eaque ut officia.', 49, ']', 670, 0, 8, 680, 0, 1564352632, 1564871032, 1, NULL, NULL, 'Online', 1565562232, 1, '0'),
(377, 'voluptas_572', NULL, 69, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 510, 7, 0, 190, 0, 1564784632, 1565389432, 0, NULL, NULL, 'Card', 1564007032, 1, '0'),
(378, 'explicabo_367', NULL, 51, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 430, 0, 39, 690, 1, 1563920632, 1565216632, 0, NULL, NULL, 'Cash', 1565475832, 0, '0'),
(379, 'velit_244', 'Repellendus omnis architecto temporibus est placeat aut omnis sunt natus aut.', 51, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 620, 0, 0, 410, 1, 1564352632, 1565735032, 0, NULL, NULL, 'Cheque', 1566167032, 1, '0'),
(380, 'adipisci_132', NULL, 48, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 300, 0, 0, 390, 0, 1564525432, 1564871032, 1, NULL, NULL, 'Online', 1564179832, 0, '0'),
(381, 'quibusdam_346', 'Eaque quo ut quam aliquam eum id repellendus aut beatae.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 770, 41, 14, 210, 1, 1564352632, 1565303032, 0, NULL, NULL, 'Card', 1565994232, 0, '0'),
(382, 'vel_311', 'Similique maxime mollitia et id odit reprehenderit omnis aut et.', 48, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 180, 0, 0, 530, 1, 1564352632, 1566167032, 0, NULL, NULL, 'Card', 1565216632, 1, '0'),
(383, 'pariatur_259', 'Eum voluptatem id quis dolore enim.', 57, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 520, 0, 0, 530, 0, 1564179832, 1565130232, 1, NULL, NULL, 'Cash', 1564784632, 0, '0'),
(384, 'natus_918', NULL, 66, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 220, 19, 19, 630, 0, 1563747832, 1564957432, 1, NULL, NULL, 'Online', 1565648632, 1, '0'),
(385, 'unde_427', 'Voluptas ut ipsa aut et sit ut et ut molestias.', 46, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 580, 0, 41, 710, 1, 1564698232, 1564957432, 0, NULL, NULL, 'Cheque', 1565130232, 0, '0'),
(386, 'dolorem_601', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 70, 0, 1, 720, 0, 1564266232, 1566253432, 0, NULL, NULL, 'Cash', 1565216632, 0, '0'),
(387, 'debitis_671', NULL, 64, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 320, 0, 43, 550, 1, 1564439032, 1564871032, 0, NULL, NULL, 'Bank Deposit', 1565562232, 1, '0'),
(388, 'asperiores_707', NULL, 46, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 450, 25, 0, 670, 0, 1564698233, 1564784633, 1, NULL, NULL, 'Bank Deposit', 1565994233, 1, '0'),
(389, 'porro_946', NULL, 59, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 90, 0, 0, 580, 1, 1563920633, 1564957433, 0, NULL, NULL, 'Cash', 1566339833, 0, '0'),
(390, 'totam_577', NULL, 46, '[{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 460, 34, 26, 860, 1, 1563747833, 1565735033, 0, NULL, NULL, 'Online', 1564957433, 1, '0'),
(391, 'modi_447', NULL, 50, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 120, 0, 0, 400, 0, 1564352633, 1564957433, 1, NULL, NULL, 'Bank Deposit', 1565216633, 1, '0'),
(392, 'maiores_903', 'Explicabo quam a eligendi debitis velit quo.', 60, '[{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 970, 45, 9, 530, 0, 1563834233, 1564871033, 1, NULL, NULL, 'Cheque', 1564525433, 1, '0'),
(393, 'illum_495', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"}]', 990, 0, 0, 990, 1, 1563747833, 1565648633, 0, NULL, NULL, 'Bank Deposit', 1564611833, 0, '0'),
(394, 'corrupti_970', NULL, 67, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 460, 3, 3, 440, 1, 1564093433, 1565821433, 0, NULL, NULL, 'Card', 1565130233, 1, '0'),
(395, 'maxime_628', 'Inventore et et veritatis eos nulla inventore.', 67, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 510, 14, 14, 600, 1, 1563747833, 1564957433, 0, NULL, NULL, 'Cheque', 1566253433, 1, '0'),
(396, 'molestiae_566', NULL, 57, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 900, 17, 0, 760, 0, 1564093433, 1564871033, 1, NULL, NULL, 'Bank Deposit', 1564698233, 1, '0'),
(397, 'dolor_648', 'Magni quidem laborum repudiandae et ut est molestiae.', 69, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 610, 0, 0, 460, 1, 1564093433, 1564784633, 0, NULL, NULL, 'Bank Deposit', 1564266233, 1, '0'),
(398, 'natus_161', NULL, 50, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 470, 1, 47, 940, 0, 1564611833, 1565475833, 0, NULL, NULL, 'Cash', 1564871033, 1, '0'),
(399, 'qui_151', 'Et aut qui et magnam ipsum inventore magni similique quos.', 49, '[{\"title\":\"Building fee\",\"amount\":\"600\"}]', 150, 47, 48, 820, 0, 1563834233, 1564871033, 1, NULL, NULL, 'Online', 1566080633, 1, '0'),
(400, 'voluptates_840', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 790, 0, 0, 880, 1, 1564007033, 1566080633, 0, NULL, NULL, 'Card', 1566253433, 1, '0'),
(401, 'quasi_841', 'Cupiditate ut est officia magnam et reprehenderit omnis et fugiat et.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 300, 47, 37, 150, 1, 1563834233, 1564957433, 0, NULL, NULL, 'Card', 1565562233, 0, '0'),
(402, 'rerum_203', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 50, 48, 7, 840, 1, 1564439033, 1564957433, 0, NULL, NULL, 'Online', 1564784633, 0, '0'),
(403, 'assumenda_431', 'Alias deleniti animi ipsum nobis iure beatae earum omnis nisi odit.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 990, 7, 29, 460, 1, 1563920633, 1566339833, 0, NULL, NULL, 'Online', 1565735033, 1, '0'),
(404, 'tempora_990', 'Est enim inventore est odit doloremque in.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 200, 10, 0, 220, 1, 1564266233, 1564784633, 0, NULL, NULL, 'Cash', 1563920633, 0, '0'),
(405, 'dolor_265', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 370, 7, 48, 480, 0, 1564007033, 1564784633, 1, NULL, NULL, 'Bank Deposit', 1564957433, 0, '0'),
(406, 'et_534', 'Deleniti voluptatem quia totam beatae consequatur qui quam.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"}]', 1000, 38, 0, 940, 1, 1564179833, 1565562233, 0, NULL, NULL, 'Card', 1564957433, 0, '0'),
(407, 'non_208', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 960, 31, 10, 780, 1, 1564698233, 1565821433, 0, NULL, NULL, 'Card', 1564093433, 1, '0'),
(408, 'quas_725', 'Ipsum minus excepturi aspernatur qui illo illo.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 910, 4, 35, 580, 1, 1564784633, 1565907833, 0, NULL, NULL, 'Bank Deposit', 1566339833, 0, '0'),
(409, 'illum_401', 'Et voluptas quia mollitia veritatis suscipit ullam.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 710, 0, 32, 400, 0, 1563834233, 1564784633, 1, NULL, NULL, 'Cash', 1563920633, 0, '0'),
(410, 'dicta_651', 'Aut ipsam dolor voluptas occaecati velit voluptatibus ducimus quasi.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 320, 0, 28, 860, 0, 1564352633, 1565907833, 0, NULL, NULL, 'Card', 1564266233, 0, '0'),
(411, 'culpa_570', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 350, 20, 49, 150, 0, 1564439033, 1564957433, 1, NULL, NULL, 'Cash', 1564784633, 1, '0'),
(412, 'voluptatum_534', 'Ut quibusdam iusto suscipit quidem maxime cum fugiat doloribus atque qui.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 260, 0, 0, 730, 0, 1564352633, 1564957433, 1, NULL, NULL, 'Bank Deposit', 1564784633, 0, '0'),
(413, 'eveniet_885', 'Et mollitia occaecati tenetur eum architecto dignissimos qui est qui sed.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 80, 0, 0, 740, 1, 1564525433, 1564871033, 0, NULL, NULL, 'Card', 1564093433, 1, '0'),
(414, 'mollitia_157', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 590, 0, 0, 920, 1, 1564093433, 1565475833, 0, NULL, NULL, 'Bank Deposit', 1564698233, 1, '0'),
(415, 'fugiat_378', 'Doloremque odio quis modi quasi totam et.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 210, 39, 0, 930, 0, 1564439033, 1564871033, 1, NULL, NULL, 'Cheque', 1564784633, 1, '0'),
(416, 'saepe_713', 'Rerum perferendis soluta quam maxime cum.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 980, 3, 0, 290, 1, 1564525433, 1566339833, 0, NULL, NULL, 'Card', 1565821433, 0, '0'),
(417, 'sunt_408', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 570, 1, 0, 570, 1, 1564093433, 1564871033, 0, NULL, NULL, 'Cash', 1564784633, 1, '0'),
(418, 'consectetur_789', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 600, 0, 27, 80, 0, 1564611833, 1564871033, 1, NULL, NULL, 'Card', 1565389433, 0, '0'),
(419, 'ducimus_518', 'Doloremque consequatur possimus quo veniam ex consequatur doloribus.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 700, 0, 0, 700, 1, 1564007033, 1564957433, 0, NULL, NULL, 'Card', 1565475833, 0, '0'),
(420, 'nisi_277', 'Doloribus voluptates eos voluptates neque natus harum adipisci facilis totam aliquam ducimus.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 190, 0, 0, 770, 1, 1564007033, 1564957433, 0, NULL, NULL, 'Cash', 1564093433, 0, '0'),
(421, 'dolor_689', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 380, 0, 29, 780, 1, 1564179833, 1564871033, 0, NULL, NULL, 'Online', 1565389433, 1, '0'),
(422, 'non_913', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 890, 2, 0, 300, 0, 1564439033, 1564957433, 1, NULL, NULL, 'Bank Deposit', 1563747833, 0, '0'),
(423, 'aut_874', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 760, 0, 45, 430, 0, 1563747833, 1564784633, 1, NULL, NULL, 'Card', 1564698233, 0, '0'),
(424, 'ut_607', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"}]', 890, 0, 6, 260, 0, 1564352633, 1564784633, 1, NULL, NULL, 'Bank Deposit', 1563920633, 1, '0'),
(425, 'quia_552', 'Qui doloremque odit qui est libero.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 810, 0, 0, 620, 0, 1564266233, 1564871033, 1, NULL, NULL, 'Online', 1565475833, 0, '0'),
(426, 'recusandae_387', 'Molestiae aut quia magni ad illum quos.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 90, 0, 0, 330, 1, 1564698234, 1565303034, 0, NULL, NULL, 'Cheque', 1566167034, 1, '0'),
(427, 'sit_309', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 560, 22, 17, 370, 1, 1563920634, 1564871034, 0, NULL, NULL, 'Bank Deposit', 1564784634, 1, '0'),
(428, 'nulla_287', 'Itaque amet illo quisquam delectus ipsum esse.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 940, 41, 0, 720, 0, 1563920634, 1564784634, 1, NULL, NULL, 'Card', 1566080634, 1, '0'),
(429, 'rerum_582', 'Dolorem at sequi porro qui voluptatem.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 950, 48, 0, 480, 0, 1564439034, 1564871034, 1, NULL, NULL, 'Cheque', 1566080634, 1, '0'),
(430, 'ad_958', 'Vel ullam repudiandae sit repudiandae repudiandae tenetur aperiam.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"100\"}]', 600, 0, 0, 760, 0, 1563747834, 1564957434, 1, NULL, NULL, 'Card', 1564698234, 0, '0'),
(431, 'commodi_954', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 630, 9, 0, 640, 0, 1564093434, 1564784634, 1, NULL, NULL, 'Card', 1565216634, 0, '0'),
(432, 'sed_403', 'Fugit non qui vero eligendi in commodi itaque.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 650, 33, 28, 820, 1, 1564352634, 1566167034, 0, NULL, NULL, 'Bank Deposit', 1566167034, 0, '0'),
(433, 'culpa_402', 'Recusandae magnam voluptas eligendi aliquid est ut debitis temporibus illum est.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 700, 0, 0, 170, 0, 1564093434, 1565821434, 0, NULL, NULL, 'Cash', 1566080634, 1, '0'),
(434, 'consequatur_974', 'Quo saepe voluptates suscipit esse facere et accusantium.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 780, 0, 39, 600, 1, 1564698234, 1565648634, 0, NULL, NULL, 'Bank Deposit', 1564611834, 0, '0'),
(435, 'tempore_825', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 870, 50, 0, 780, 1, 1564352634, 1564871034, 0, NULL, NULL, 'Cheque', 1564871034, 0, '0'),
(436, 'dolorum_691', 'Exercitationem deserunt dolorem fugit nam voluptas et.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"}]', 500, 0, 0, 370, 1, 1563747834, 1565994234, 0, NULL, NULL, 'Cheque', 1565216634, 1, '0'),
(437, 'possimus_477', 'Distinctio animi qui nisi tempora ea vitae neque repellendus.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"}]', 260, 37, 50, 380, 1, 1563920634, 1564784634, 0, NULL, NULL, 'Card', 1564525434, 0, '0'),
(438, 'mollitia_535', 'Iste sed ut unde sequi autem et nam iure possimus dolor.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 800, 45, 0, 500, 0, 1564698234, 1564871034, 1, NULL, NULL, 'Cash', 1565389434, 0, '0'),
(439, 'et_180', 'Aut et commodi pariatur recusandae ratione ea consequatur natus.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 510, 24, 0, 90, 0, 1564007034, 1565994234, 0, NULL, NULL, 'Card', 1565475834, 0, '0'),
(440, 'omnis_472', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 310, 37, 47, 810, 1, 1563834234, 1565562234, 0, NULL, NULL, 'Card', 1564784634, 1, '0'),
(441, 'dolores_408', 'Minus quos molestias nemo eos odit at aut enim adipisci quae.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 930, 10, 0, 250, 0, 1564179834, 1564957434, 1, NULL, NULL, 'Card', 1565648634, 1, '0'),
(442, 'molestias_330', 'Repudiandae commodi mollitia voluptates est veritatis qui doloremque sequi.', 49, '[{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 160, 5, 0, 100, 1, 1564611834, 1564957434, 0, NULL, NULL, 'Cheque', 1563920634, 0, '0'),
(443, 'iure_583', 'Incidunt excepturi aut vel qui.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 230, 0, 33, 670, 1, 1564266234, 1564784634, 0, NULL, NULL, 'Cheque', 1564266234, 0, '0'),
(444, 'assumenda_776', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 350, 1, 37, 290, 0, 1563834234, 1566167034, 0, NULL, NULL, 'Online', 1563747834, 0, '0'),
(445, 'eos_306', 'Non ut animi magni et eius consectetur.', 49, '[{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 320, 23, 6, 460, 0, 1564611834, 1566167034, 0, NULL, NULL, 'Cash', 1565994234, 1, '0'),
(446, 'ex_899', 'Aspernatur nihil atque dolor voluptatem labore saepe temporibus nihil.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"}]', 60, 45, 0, 140, 0, 1564266234, 1564957434, 1, NULL, NULL, 'Online', 1565735034, 1, '0'),
(447, 'quos_212', 'Dignissimos molestiae eligendi voluptatum non iste iure dolorum unde sed eum.', 49, '[{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 890, 0, 14, 170, 0, 1564093434, 1565216634, 0, NULL, NULL, 'Cheque', 1564439034, 1, '0'),
(448, 'eligendi_116', 'Voluptatibus optio provident veritatis dolore et tempora rerum.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 940, 23, 0, 350, 1, 1564698234, 1564871034, 0, NULL, NULL, 'Card', 1563920634, 0, '0'),
(449, 'maiores_530', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 850, 0, 0, 560, 0, 1563834234, 1564871034, 1, NULL, NULL, 'Cash', 1564179834, 1, '0'),
(450, 'nihil_579', 'Explicabo odit ipsam blanditiis in veritatis et nihil occaecati ut.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 410, 11, 7, 710, 0, 1563747834, 1564957434, 1, NULL, NULL, 'Cash', 1565303034, 1, '0'),
(451, 'at_584', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 670, 28, 0, 740, 1, 1564179834, 1564957434, 0, NULL, NULL, 'Cash', 1564784634, 1, '0'),
(452, 'ut_629', 'Enim quibusdam modi consectetur aut consequuntur ad.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 730, 0, 0, 420, 0, 1564698234, 1564871034, 1, NULL, NULL, 'Cash', 1564439034, 0, '0'),
(453, 'ducimus_888', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"}]', 340, 0, 47, 840, 0, 1564525434, 1565907834, 0, NULL, NULL, 'Online', 1564698234, 0, '0'),
(454, 'sed_661', 'Aliquam voluptas et aut nam occaecati autem et excepturi.', 49, ']', 320, 9, 13, 440, 1, 1563747834, 1565562234, 0, NULL, NULL, 'Bank Deposit', 1565216634, 0, '0'),
(455, 'non_275', 'Ut soluta quas at nostrum perferendis voluptates nulla sunt facere.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 370, 0, 0, 120, 1, 1564439034, 1565562234, 0, NULL, NULL, 'Bank Deposit', 1564698234, 1, '0'),
(456, 'doloribus_278', 'Tenetur reiciendis ducimus nisi dicta atque sint suscipit.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 680, 0, 9, 180, 1, 1564179834, 1565303034, 0, NULL, NULL, 'Bank Deposit', 1564698234, 0, '0'),
(457, 'dolores_725', 'Aliquam nemo et enim sapiente dignissimos ipsam et velit eveniet ab.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 230, 49, 49, 400, 1, 1564352634, 1566253434, 0, NULL, NULL, 'Bank Deposit', 1564007034, 0, '0'),
(458, 'quis_317', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 490, 0, 0, 80, 1, 1563834234, 1564871034, 0, NULL, NULL, 'Bank Deposit', 1564007034, 1, '0'),
(459, 'eum_346', 'Nesciunt excepturi quae architecto in odio consequatur aut natus suscipit.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 370, 17, 4, 340, 1, 1564352634, 1565994234, 0, NULL, NULL, 'Cheque', 1565648634, 1, '0'),
(460, 'quia_213', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"500\"}]', 300, 0, 0, 470, 1, 1564698234, 1565303034, 0, NULL, NULL, 'Online', 1564352634, 0, '0'),
(461, 'iste_338', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 870, 46, 7, 190, 0, 1564525434, 1564784634, 1, NULL, NULL, 'Cash', 1564957434, 1, '0'),
(462, 'eius_624', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 510, 0, 7, 670, 0, 1564266234, 1564784634, 1, NULL, NULL, 'Online', 1563834234, 0, '0'),
(463, 'eum_120', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 240, 35, 0, 220, 0, 1564179834, 1564784634, 1, NULL, NULL, 'Cash', 1566253434, 1, '0'),
(464, 'inventore_263', 'Consectetur quaerat praesentium eos consequatur praesentium aliquam quasi laboriosam.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 930, 0, 0, 520, 1, 1564525434, 1565994234, 0, NULL, NULL, 'Bank Deposit', 1565562234, 0, '0'),
(465, 'et_793', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"400\"}]', 480, 29, 11, 760, 1, 1563920634, 1565216634, 0, NULL, NULL, 'Cheque', 1564611834, 1, '0'),
(466, 'eaque_625', 'Minima rerum dolorem fugit non consequuntur deserunt.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 580, 0, 0, 950, 0, 1564439034, 1564957434, 1, NULL, NULL, 'Bank Deposit', 1565994234, 0, '0'),
(467, 'corporis_953', 'Maxime repellat molestiae ut voluptatem et officiis ut soluta.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 50, 0, 0, 400, 0, 1563834235, 1565389435, 0, NULL, NULL, 'Card', 1563747835, 1, '0'),
(468, 'et_323', 'Eius doloremque quia nesciunt voluptatem hic eos.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 960, 0, 0, 400, 0, 1564698235, 1565389435, 0, NULL, NULL, 'Card', 1566167035, 1, '0'),
(469, 'molestiae_630', 'Dolores perspiciatis est vitae animi deserunt quasi ut iure et.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 380, 19, 43, 190, 0, 1564698235, 1565475835, 0, NULL, NULL, 'Cash', 1565475835, 0, '0'),
(470, 'ut_751', 'Voluptate delectus commodi nesciunt harum maxime iste harum consectetur possimus.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 100, 27, 37, 240, 1, 1563747835, 1565994235, 0, NULL, NULL, 'Card', 1565562235, 0, '0'),
(471, 'voluptatibus_376', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 520, 0, 31, 960, 1, 1564525435, 1565562235, 0, NULL, NULL, 'Online', 1565130235, 1, '0'),
(472, 'est_725', 'Voluptatem cupiditate quidem deserunt facere et incidunt modi architecto.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 990, 0, 0, 130, 1, 1563920635, 1564957435, 0, NULL, NULL, 'Bank Deposit', 1564179835, 1, '0'),
(473, 'et_586', 'Non odio nam modi voluptatem voluptatum at architecto sapiente quisquam eaque.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 430, 30, 0, 830, 1, 1564179835, 1564871035, 0, NULL, NULL, 'Card', 1564957435, 1, '0'),
(474, 'quia_138', 'Qui veniam ut iusto sit ipsa eius fuga.', 49, '[{\"title\":\"Building fee\",\"amount\":\"700\"}]', 150, 0, 0, 1000, 1, 1564352635, 1565821435, 0, NULL, NULL, 'Bank Deposit', 1564957435, 1, '0'),
(475, 'sed_242', 'Nam quis iusto odit reprehenderit eaque et in.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 820, 0, 28, 490, 0, 1564179835, 1565994235, 0, NULL, NULL, 'Online', 1564093435, 1, '0'),
(476, 'autem_260', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 370, 16, 0, 720, 1, 1564352635, 1564871035, 0, NULL, NULL, 'Online', 1564698235, 1, '0'),
(477, 'nesciunt_893', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 550, 0, 47, 120, 0, 1564179835, 1564957435, 1, NULL, NULL, 'Cheque', 1565303035, 0, '0'),
(478, 'voluptatem_429', 'Qui voluptatum omnis asperiores ipsum aut sint sequi est.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 900, 0, 0, 370, 0, 1564179835, 1565562235, 0, NULL, NULL, 'Card', 1566253435, 0, '0'),
(479, 'et_283', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 120, 1, 0, 180, 1, 1564611835, 1564871035, 0, NULL, NULL, 'Cheque', 1566339835, 1, '0'),
(480, 'rerum_278', 'Autem exercitationem ab consequatur voluptatem incidunt quo dolor praesentium voluptate velit.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 610, 0, 11, 860, 0, 1564007035, 1564871035, 1, NULL, NULL, 'Card', 1565475835, 1, '0'),
(481, 'aperiam_387', 'Quo nihil est ratione eligendi eaque est ad exercitationem.', 49, '[{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 760, 28, 44, 930, 1, 1564179835, 1564871035, 0, NULL, NULL, 'Cheque', 1564093435, 0, '0'),
(482, 'et_359', 'Iusto dolore ut qui qui odit.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 480, 9, 0, 450, 1, 1564093435, 1566167035, 0, NULL, NULL, 'Bank Deposit', 1565907835, 1, '0'),
(483, 'aut_570', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"}]', 340, 0, 0, 860, 1, 1564698235, 1564871035, 0, NULL, NULL, 'Cheque', 1565389435, 1, '0'),
(484, 'qui_210', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 830, 0, 34, 860, 0, 1564352635, 1566080635, 0, NULL, NULL, 'Cash', 1564007035, 1, '0'),
(485, 'tenetur_496', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 620, 0, 48, 400, 1, 1564266235, 1564784635, 0, NULL, NULL, 'Card', 1565475835, 1, '0'),
(486, 'nobis_351', 'Labore dolorum aspernatur vitae ducimus consequatur dolor dolores doloremque debitis.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 240, 20, 40, 870, 0, 1564698235, 1565735035, 0, NULL, NULL, 'Cash', 1564352635, 0, '0'),
(487, 'totam_509', 'Et optio minus corporis ab quibusdam consequuntur adipisci tempora ab ipsam.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 570, 0, 0, 980, 1, 1564439035, 1564957435, 0, NULL, NULL, 'Cash', 1564957435, 1, '0'),
(488, 'aut_444', 'Laudantium labore in aperiam fugit ab rem autem.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 200, 50, 0, 90, 0, 1564007035, 1564784635, 1, NULL, NULL, 'Online', 1566080635, 1, '0'),
(489, 'sed_195', NULL, 49, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 230, 0, 17, 110, 1, 1564525435, 1566167035, 0, NULL, NULL, 'Online', 1566167035, 0, '0'),
(490, 'minus_808', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 280, 1, 0, 660, 0, 1564093435, 1566080635, 0, NULL, NULL, 'Card', 1565216635, 1, '0'),
(491, 'provident_161', 'Et excepturi fuga perferendis ipsum et assumenda officia minus natus.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 960, 0, 0, 380, 0, 1564698235, 1566167035, 0, NULL, NULL, 'Cheque', 1563747835, 0, '0'),
(492, 'rem_236', 'Voluptatem modi omnis quis occaecati praesentium perferendis aut nihil ullam.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 310, 15, 8, 320, 0, 1564698235, 1564784635, 1, NULL, NULL, 'Bank Deposit', 1564611835, 1, '0'),
(493, 'et_565', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 450, 0, 36, 390, 0, 1563834235, 1564957435, 1, NULL, NULL, 'Bank Deposit', 1564784635, 1, '0'),
(494, 'neque_870', 'Est animi ut voluptatum et et.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 430, 40, 25, 700, 1, 1564611835, 1566167035, 0, NULL, NULL, 'Cash', 1565735035, 0, '0'),
(495, 'iure_451', 'Id reiciendis tempora excepturi tenetur assumenda laborum nostrum.', 49, '[{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 160, 0, 15, 490, 0, 1563747835, 1566080635, 0, NULL, NULL, 'Bank Deposit', 1564957435, 0, '0'),
(496, 'quia_558', 'Iste quaerat reprehenderit illum ut ducimus omnis earum non porro dignissimos.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 450, 0, 0, 850, 1, 1564179835, 1565994235, 0, NULL, NULL, 'Online', 1565130235, 0, '0'),
(497, 'cum_718', 'Repellendus autem sunt omnis et officiis esse debitis voluptas placeat.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 190, 31, 33, 340, 1, 1563747835, 1564957435, 0, NULL, NULL, 'Cash', 1563920635, 0, '0'),
(498, 'officia_460', 'Culpa sapiente in dolorem ab pariatur autem.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"700\"}]', 290, 0, 0, 710, 0, 1564266235, 1564957435, 1, NULL, NULL, 'Cheque', 1565475835, 1, '0'),
(499, 'inventore_298', 'Officia magni pariatur consequatur enim eos praesentium qui perspiciatis.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 160, 0, 37, 140, 0, 1564093435, 1565821435, 0, NULL, NULL, 'Online', 1566167035, 0, '0'),
(500, 'occaecati_440', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 820, 42, 15, 940, 1, 1563747835, 1564871035, 0, NULL, NULL, 'Cheque', 1564266235, 0, '0'),
(501, 'quam_845', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"300\"}]', 250, 29, 0, 880, 1, 1564439035, 1564784635, 0, NULL, NULL, 'Card', 1564525435, 1, '0'),
(502, 'inventore_654', 'Non vitae ea et necessitatibus incidunt modi consequuntur laborum voluptatibus.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 580, 0, 0, 130, 0, 1563834235, 1565216635, 0, NULL, NULL, 'Online', 1564007035, 0, '0'),
(503, 'magni_216', 'Aperiam cumque quisquam ab error numquam quos.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 800, 0, 0, 60, 0, 1564439035, 1565130235, 1, NULL, NULL, 'Online', 1565821435, 0, '0'),
(504, 'fugit_407', 'Beatae reiciendis modi voluptatem non nesciunt ipsa est.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 590, 18, 28, 320, 0, 1564093435, 1565389435, 0, NULL, NULL, 'Cash', 1566080635, 1, '0'),
(505, 'enim_839', 'Ipsam deleniti est vitae dicta ex et aliquam et a amet.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 490, 0, 0, 300, 1, 1564698236, 1564784636, 0, NULL, NULL, 'Cash', 1566339836, 0, '0'),
(506, 'doloremque_844', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"200\"}]', 480, 21, 0, 330, 1, 1564439036, 1564784636, 0, NULL, NULL, 'Cash', 1565303036, 1, '0'),
(507, 'voluptatem_176', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 520, 0, 0, 630, 0, 1564266236, 1564957436, 1, NULL, NULL, 'Cash', 1566167036, 0, '0'),
(508, 'sit_885', 'Placeat asperiores soluta id et consequatur quae quaerat perferendis ut.', 49, '[{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 810, 0, 43, 100, 1, 1564611836, 1564784636, 0, NULL, NULL, 'Online', 1565994236, 1, '0'),
(509, 'mollitia_678', 'Est quia hic sed et blanditiis necessitatibus quam quia rerum.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"700\"}]', 930, 0, 0, 470, 1, 1563834236, 1566339836, 0, NULL, NULL, 'Online', 1563834236, 0, '0'),
(510, 'sequi_482', 'Blanditiis natus occaecati corporis consectetur soluta consequatur.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 900, 0, 0, 990, 1, 1564784636, 1564871036, 0, NULL, NULL, 'Card', 1566339836, 1, '0'),
(511, 'possimus_672', 'Est et rem aperiam veniam quo.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 420, 0, 0, 190, 1, 1564266236, 1564784636, 0, NULL, NULL, 'Cash', 1564611836, 1, '0'),
(512, 'facere_681', 'Iusto omnis quia quia hic odit maiores.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 660, 0, 0, 850, 1, 1564784636, 1564957436, 0, NULL, NULL, 'Card', 1565735036, 0, '0');
INSERT INTO `payments` (`id`, `paymentTitle`, `paymentDescription`, `paymentStudent`, `paymentRows`, `paymentAmount`, `paymentDiscount`, `paymentDiscounted`, `paidAmount`, `paymentStatus`, `paymentDate`, `dueDate`, `dueNotified`, `paymentUniqid`, `paymentSuccessDetails`, `paidMethod`, `paidTime`, `discount_id`, `fine_amount`) VALUES
(513, 'omnis_265', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 990, 0, 44, 860, 0, 1564439036, 1564784636, 1, NULL, NULL, 'Card', 1566167036, 0, '0'),
(514, 'pariatur_330', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"100\"}]', 160, 34, 32, 140, 0, 1564007036, 1565389436, 0, NULL, NULL, 'Cheque', 1564871036, 0, '0'),
(515, 'et_930', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"},{\"title\":\"Lap fee\",\"amount\":\"200\"}]', 410, 0, 28, 410, 0, 1564611836, 1566253436, 0, NULL, NULL, 'Cheque', 1564007036, 1, '0'),
(516, 'adipisci_738', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"}]', 520, 0, 0, 850, 0, 1564439036, 1565562236, 0, NULL, NULL, 'Online', 1564784636, 1, '0'),
(517, 'ut_483', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 920, 25, 24, 170, 1, 1563834236, 1565562236, 0, NULL, NULL, 'Cash', 1565216636, 1, '0'),
(518, 'aut_390', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 770, 0, 0, 200, 0, 1564439036, 1564871036, 1, NULL, NULL, 'Bank Deposit', 1565130236, 0, '0'),
(519, 'ut_510', 'Quia totam maxime sapiente libero alias voluptas.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 620, 0, 0, 240, 1, 1563920636, 1565130236, 0, NULL, NULL, 'Card', 1564007036, 0, '0'),
(520, 'ipsam_108', 'Enim incidunt omnis ab vero sunt voluptatibus.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 910, 33, 0, 390, 0, 1564611836, 1566339836, 0, NULL, NULL, 'Card', 1565475836, 0, '0'),
(521, 'est_399', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 890, 0, 0, 740, 1, 1564611836, 1564784636, 0, NULL, NULL, 'Cheque', 1564352636, 1, '0'),
(522, 'nobis_154', 'Error molestiae consequuntur nihil nam.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 350, 42, 25, 940, 0, 1564439036, 1564957436, 1, NULL, NULL, 'Cheque', 1563747836, 0, '0'),
(523, 'id_814', 'Sit consequatur minus perferendis deserunt magni.', 49, '[{\"title\":\"Building fee\",\"amount\":\"300\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 660, 0, 26, 900, 0, 1564525436, 1564784636, 1, NULL, NULL, 'Bank Deposit', 1565562236, 0, '0'),
(524, 'ipsum_338', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 540, 36, 0, 820, 0, 1564007036, 1565821436, 0, NULL, NULL, 'Cheque', 1566080636, 1, '0'),
(525, 'rem_436', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 520, 19, 0, 410, 1, 1564784636, 1564871036, 0, NULL, NULL, 'Online', 1563920636, 0, '0'),
(526, 'deleniti_738', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Library fee\",\"amount\":\"200\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 190, 40, 3, 640, 1, 1564093436, 1565994236, 0, NULL, NULL, 'Online', 1566167036, 0, '0'),
(527, 'iusto_756', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 190, 48, 0, 770, 1, 1564439036, 1566167036, 0, NULL, NULL, 'Bank Deposit', 1565216636, 1, '0'),
(528, 'recusandae_456', 'Harum saepe ipsam minus quae ipsum aliquam est totam.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"800\"}]', 840, 4, 18, 460, 0, 1564007036, 1564784636, 1, NULL, NULL, 'Bank Deposit', 1563920636, 1, '0'),
(529, 'eius_974', NULL, 49, '[{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"700\"}]', 910, 30, 12, 100, 0, 1564698236, 1564957436, 1, NULL, NULL, 'Online', 1565130236, 1, '0'),
(530, 'corrupti_393', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"100\"},{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"200\"}]', 200, 34, 0, 320, 0, 1564093436, 1564784636, 1, NULL, NULL, 'Bank Deposit', 1565735036, 0, '0'),
(531, 'tenetur_748', NULL, 49, '[{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 480, 0, 36, 560, 1, 1563747836, 1565216636, 0, NULL, NULL, 'Cheque', 1565821436, 0, '0'),
(532, 'similique_447', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"700\"},{\"title\":\"Bus fee\",\"amount\":\"600\"}]', 60, 0, 22, 940, 0, 1564352636, 1564957436, 1, NULL, NULL, 'Online', 1564439036, 1, '0'),
(533, 'qui_442', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"600\"}]', 380, 0, 0, 240, 0, 1564352636, 1564957436, 1, NULL, NULL, 'Card', 1565907836, 1, '0'),
(534, 'minus_660', 'Eum deserunt amet cupiditate et corrupti et impedit velit molestiae ut.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"200\"},{\"title\":\"Building fee\",\"amount\":\"800\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 120, 0, 0, 520, 0, 1564611836, 1564871036, 1, NULL, NULL, 'Card', 1565389436, 1, '0'),
(535, 'consequatur_698', 'Nostrum et ut saepe sint eius soluta tenetur in.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"700\"},{\"title\":\"Library fee\",\"amount\":\"600\"}]', 340, 0, 4, 320, 1, 1564007036, 1564957436, 0, NULL, NULL, 'Card', 1565475836, 0, '0'),
(536, 'neque_313', NULL, 49, ']', 590, 0, 43, 320, 0, 1564093436, 1566339836, 0, NULL, NULL, 'Cheque', 1564093436, 0, '0'),
(537, 'tempore_989', 'Qui consequatur a enim illum eos quo.', 49, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Bus fee\",\"amount\":\"100\"}]', 230, 6, 37, 300, 1, 1564439036, 1565303036, 0, NULL, NULL, 'Cash', 1565648636, 1, '0'),
(538, 'ab_782', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"}]', 620, 3, 0, 600, 0, 1564439036, 1564957436, 1, NULL, NULL, 'Cheque', 1564093436, 1, '0'),
(539, 'molestias_950', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 920, 4, 0, 490, 1, 1564525436, 1564784636, 0, NULL, NULL, 'Bank Deposit', 1565475836, 0, '0'),
(540, 'tempore_579', 'Perspiciatis voluptatum culpa quae eos reprehenderit ut atque enim.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"800\"},{\"title\":\"Building fee\",\"amount\":\"400\"}]', 240, 5, 40, 130, 0, 1564266237, 1564957437, 1, NULL, NULL, 'Cash', 1566253437, 1, '0'),
(541, 'omnis_243', 'Porro odio quidem est odio est iste saepe.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"300\"},{\"title\":\"Tuition fee\",\"amount\":\"100\"},{\"title\":\"Building fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 940, 19, 0, 310, 0, 1564352637, 1566167037, 0, NULL, NULL, 'Cheque', 1563834237, 1, '0'),
(542, 'laboriosam_410', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"200\"},{\"title\":\"Tuition fee\",\"amount\":\"400\"},{\"title\":\"Lap fee\",\"amount\":\"700\"}]', 520, 0, 6, 290, 1, 1563834237, 1564784637, 0, NULL, NULL, 'Card', 1564093437, 0, '0'),
(543, 'ipsum_196', NULL, 49, '[{\"title\":\"Tuition fee\",\"amount\":\"800\"}]', 900, 0, 45, 90, 0, 1564611837, 1564871037, 1, NULL, NULL, 'Cash', 1566080637, 1, '0'),
(544, 'mollitia_360', NULL, 49, '[{\"title\":\"Transport fee\",\"amount\":\"700\"},{\"title\":\"Lap fee\",\"amount\":\"500\"},{\"title\":\"Library fee\",\"amount\":\"600\"},{\"title\":\"Bus fee\",\"amount\":\"500\"}]', 750, 25, 0, 960, 0, 1564179837, 1566080637, 0, NULL, NULL, 'Online', 1563747837, 0, '0'),
(545, 'incidunt_565', 'Ducimus natus ea dolorem quae repellat deleniti natus qui.', 49, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"200\"}]', 350, 0, 0, 70, 1, 1564179837, 1564784637, 0, NULL, NULL, 'Bank Deposit', 1563920637, 1, '0'),
(546, 'odit_748', 'Beatae tempore laborum libero delectus et.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"500\"},{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"800\"}]', 440, 30, 35, 290, 0, 1564698237, 1564784637, 1, NULL, NULL, 'Card', 1564698237, 0, '0'),
(547, 'expedita_680', NULL, 49, '[{\"title\":\"Building fee\",\"amount\":\"400\"},{\"title\":\"Bus fee\",\"amount\":\"400\"}]', 130, 33, 11, 780, 1, 1563834237, 1566339837, 0, NULL, NULL, 'Bank Deposit', 1566253437, 0, '0'),
(548, 'inventore_293', 'Reprehenderit ex odit nostrum qui corrupti consequatur qui amet quas.', 49, '[{\"title\":\"Transport fee\",\"amount\":\"600\"},{\"title\":\"Lap fee\",\"amount\":\"400\"}]', 1000, 0, 0, 620, 0, 1564611837, 1565216637, 0, NULL, NULL, 'Bank Deposit', 1564871037, 0, '0'),
(549, 'accusamus_751', 'Dolorum nobis et totam autem qui est.', 49, '[{\"title\":\"Tuition fee\",\"amount\":\"200\"},{\"title\":\"Lap fee\",\"amount\":\"100\"},{\"title\":\"Library fee\",\"amount\":\"500\"}]', 100, 21, 0, 870, 0, 1563747837, 1564784637, 1, NULL, NULL, 'Bank Deposit', 1564007037, 0, '0'),
(550, 'vero_895', NULL, 49, '[{\"title\":\"Lap fee\",\"amount\":\"300\"},{\"title\":\"Building fee\",\"amount\":\"600\"},{\"title\":\"Library fee\",\"amount\":\"100\"},{\"title\":\"Bus fee\",\"amount\":\"300\"}]', 800, 0, 7, 740, 0, 1563834237, 1564784637, 1, NULL, NULL, 'Online', 1564784637, 0, '0');

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
(1, 'Et minus sed fuga.', '69489', 'bmacejkovic@gmail.com', 'perferendis', 'laborum', '1565043837', 'nemo', '23 minutes', 'Dolor rerum officiis quis magni odit sed est tempora eos.'),
(2, 'Error veritatis est.', '15122', 'lakin.aniya@ferry.com', 'cum', 'aspernatur', '1565043837', 'corporis', '19 minutes', 'Ut architecto necessitatibus atque dolorem.'),
(3, 'Quia omnis laboriosam amet.', '21894', 'lesley40@hotmail.com', 'officiis', 'delectus', '1565043837', 'illum', '29 minutes', 'Enim vitae sequi aut expedita officiis commodi voluptatum porro.'),
(4, 'Autem ab nemo enim.', '75483', 'tara.hudson@yahoo.com', 'cupiditate', 'facilis', '1565043837', 'eligendi', '27 minutes', 'Autem ut adipisci voluptas dolores.'),
(5, 'Quidem vero suscipit vel.', '71958', 'emily56@gmail.com', 'voluptatem', 'earum', '1565043837', 'facere', '9 minutes', 'Doloribus magni et ut perferendis qui labore sunt.'),
(6, 'Repudiandae ut necessitatibus.', '16354', 'carson38@reinger.com', 'reiciendis', 'occaecati', '1565043837', 'ea', '4 minutes', 'Maxime eligendi libero perferendis enim.'),
(7, 'Consequatur quidem cupiditate ut aut.', '32868', 'alvena.bartoletti@rutherford.info', 'consequatur', 'et', '1565043837', 'qui', '22 minutes', 'Ea et quia ipsum molestiae magni rerum perspiciatis impedit est.'),
(8, 'Tempora quos sunt sed.', '67023', 'sincere93@hotmail.com', 'rerum', 'odio', '1565043837', 'id', '2 minutes', 'Iusto ratione et et deserunt.'),
(9, 'In dolor.', '44243', 'alverta.hand@franecki.com', 'hic', 'veritatis', '1565043837', 'aut', '12 minutes', 'Sit et incidunt et cumque voluptatem incidunt.'),
(10, 'Eum quis velit.', '84713', 'javonte73@gmail.com', 'aliquid', 'autem', '1565043837', 'dolores', '4 minutes', 'Quisquam voluptas et dolores et earum consequatur molestiae.'),
(11, 'Deleniti est sunt.', '42495', 'kasandra.dietrich@hermann.com', 'perspiciatis', 'soluta', '1565043837', 'quaerat', '19 minutes', 'Et soluta dicta ut quis praesentium delectus atque.'),
(12, 'Suscipit vero maxime pariatur recusandae.', '18053', 'zkulas@schuster.org', 'consequatur', 'fugiat', '1565043837', 'veniam', '25 minutes', 'Reprehenderit occaecati sed quis ut ab ipsam mollitia provident.'),
(13, 'Ea voluptatem cum quaerat est autem.', '87513', 'barton.alexandrea@yahoo.com', 'repellendus', 'molestias', '1565043837', 'et', '12 minutes', 'Dignissimos recusandae necessitatibus aspernatur nihil maiores blanditiis eos veritatis qui quod vitae.'),
(14, 'Nesciunt sint minus.', '22271', 'rstreich@hotmail.com', 'et', 'ut', '1565043837', 'facere', '29 minutes', 'Eos ea aut quidem.'),
(15, 'Ipsa qui explicabo.', '90185', 'marianna.gibson@gmail.com', 'molestiae', 'sunt', '1565043837', 'repudiandae', '13 minutes', 'Rerum aut harum in consequatur assumenda ab ipsam.'),
(16, 'Velit voluptatibus.', '82821', 'manuela12@senger.com', 'dolor', 'expedita', '1565043837', 'dolorem', '30 minutes', 'In nulla maiores vitae dolores nisi.'),
(17, 'Quia nihil omnis.', '17872', 'jacinto26@yahoo.com', 'nesciunt', 'explicabo', '1565043837', 'maiores', '27 minutes', 'Vero ducimus distinctio ut dolores dolorum saepe sit.'),
(18, 'Non id vitae.', '66850', 'bwhite@watsica.org', 'blanditiis', 'culpa', '1565043837', 'quod', '27 minutes', 'Unde et quia quis harum quis rerum voluptate.'),
(19, 'Commodi vel expedita sunt officia.', '59057', 'tavares.torp@heidenreich.com', 'non', 'ut', '1565043837', 'quia', '3 minutes', 'Laboriosam dolorum quae eum aspernatur est.'),
(20, 'Voluptatem consequatur unde minus quia.', '65985', 'slangworth@senger.com', 'adipisci', 'ipsa', '1565043837', 'ut', '30 minutes', 'Dolores perferendis molestiae earum quod nihil.'),
(21, 'Voluptatum tenetur aut.', '73112', 'earlene.christiansen@hotmail.com', 'fuga', 'quis', '1565043837', 'reprehenderit', '25 minutes', 'Est iure aut iusto praesentium sapiente soluta omnis ut voluptatibus in.'),
(22, 'Et magnam aut.', '95463', 'geoffrey86@hotmail.com', 'explicabo', 'aut', '1565043837', 'atque', '29 minutes', 'Repudiandae nihil magnam et qui voluptas aut corporis provident quia.'),
(23, 'Quia unde sed placeat.', '10760', 'christop.hudson@gmail.com', 'et', 'aspernatur', '1565043837', 'reiciendis', '13 minutes', 'Commodi ut veritatis placeat cumque molestias.'),
(24, 'Voluptatem numquam.', '21401', 'jessie67@kozey.com', 'voluptatibus', 'eligendi', '1565043837', 'tenetur', '30 minutes', 'Eaque voluptatum et eos amet nisi.'),
(25, 'Dolorem aut ad ab.', '79422', 'kiehn.brendan@yahoo.com', 'reiciendis', 'illo', '1565043837', 'quia', '7 minutes', 'Aut cum cum vitae excepturi dolor illo.'),
(26, 'Ut voluptas est sit.', '74313', 'rice.leonor@hotmail.com', 'fuga', 'dolorum', '1565043837', 'necessitatibus', '11 minutes', 'Et similique repellendus dolorem rerum minima praesentium voluptatem quo modi et pariatur iste.'),
(27, 'Nihil pariatur tenetur.', '61799', 'markus.schowalter@yahoo.com', 'dolor', 'eum', '1565043837', 'distinctio', '27 minutes', 'Est recusandae et debitis iusto aut saepe dolores ea nihil quibusdam suscipit libero consectetur.'),
(28, 'Fuga veritatis at cumque possimus deserunt.', '57593', 'bradtke.adrian@hotmail.com', 'exercitationem', 'quaerat', '1565043837', 'necessitatibus', '23 minutes', 'Nesciunt nesciunt ea sint iusto accusamus corporis.'),
(29, 'Eum dolorem veniam explicabo.', '26215', 'kuhic.cleo@grant.net', 'ab', 'reiciendis', '1565043837', 'magnam', '2 minutes', 'Porro ut sint nostrum asperiores in blanditiis ad unde.'),
(30, 'Deserunt non.', '78859', 'malika.carroll@beahan.com', 'beatae', 'sint', '1565043837', 'temporibus', '3 minutes', 'Laboriosam labore quo tempore amet sed et eius voluptatem.'),
(31, 'Et qui qui laudantium et cum.', '65290', 'vziemann@hotmail.com', 'quia', 'voluptas', '1565043837', 'odio', '14 minutes', 'Qui sit cupiditate magni suscipit nostrum.'),
(32, 'Laudantium earum.', '89361', 'bernardo.balistreri@kshlerin.info', 'omnis', 'molestias', '1565043837', 'beatae', '29 minutes', 'Deserunt et voluptatibus quis et maxime molestias praesentium molestiae dolorem ratione nisi dolor.'),
(33, 'Eos quia iure.', '83272', 'xhowe@lakin.com', 'nobis', 'eos', '1565043837', 'similique', '15 minutes', 'Similique id exercitationem dolor nulla dolor perspiciatis est.'),
(34, 'Porro sapiente qui.', '58933', 'quentin.heidenreich@gmail.com', 'odio', 'ex', '1565043837', 'quo', '14 minutes', 'Aliquid magni officiis aut sed.'),
(35, 'Consequatur similique non.', '48251', 'brook.mayer@reynolds.com', 'assumenda', 'sapiente', '1565043837', 'optio', '8 minutes', 'Autem amet totam pariatur enim non explicabo libero.'),
(36, 'Mollitia explicabo.', '32653', 'dickinson.carlotta@spinka.com', 'deleniti', 'accusantium', '1565043837', 'cupiditate', '11 minutes', 'Aut blanditiis ut aut molestiae aut.'),
(37, 'Dolorem quia et.', '37996', 'jfeest@dickens.com', 'alias', 'voluptas', '1565043837', 'ab', '11 minutes', 'Porro blanditiis rerum facere et.'),
(38, 'Sint quam consequuntur.', '75058', 'kluettgen@doyle.com', 'incidunt', 'aut', '1565043837', 'iure', '24 minutes', 'Excepturi ad quasi dolor debitis distinctio nobis distinctio ut non dolorem labore.'),
(39, 'Facilis quo vel et.', '21746', 'nelson.hudson@beahan.info', 'necessitatibus', 'exercitationem', '1565043837', 'magni', '16 minutes', 'Quo molestiae odit ipsam velit ipsa perspiciatis adipisci.'),
(40, 'Tempore accusamus et nisi.', '59954', 'frances.howell@cremin.com', 'cumque', 'aut', '1565043837', 'voluptatem', '3 minutes', 'Temporibus non neque nobis possimus et dolorem consequuntur eum ut.'),
(41, 'Sed doloribus eaque.', '32160', 'rosa56@gmail.com', 'dolores', 'autem', '1565043837', 'et', '25 minutes', 'Aut dolorum nesciunt quae neque dolores quisquam ut quod.'),
(42, 'Quidem voluptatem pariatur.', '97744', 'eloisa.goodwin@hotmail.com', 'corporis', 'nobis', '1565043837', 'id', '11 minutes', 'Aut facilis quam et dolores assumenda doloremque.'),
(43, 'Ut alias vero.', '40148', 'stanley.hyatt@beahan.biz', 'temporibus', 'quis', '1565043837', 'exercitationem', '3 minutes', 'Qui exercitationem ut omnis aperiam dolor voluptas perspiciatis dolor.'),
(44, 'Ut ad rerum iusto ut.', '48572', 'remington.bins@howell.net', 'vero', 'accusantium', '1565043837', 'voluptatibus', '19 minutes', 'Voluptatem incidunt iste impedit sequi quod.'),
(45, 'Voluptatum id pariatur aspernatur.', '75131', 'kertzmann.jose@klein.com', 'autem', 'quo', '1565043837', 'debitis', '15 minutes', 'Quisquam nesciunt quisquam sapiente recusandae itaque consequuntur repellat quidem.'),
(46, 'Nisi ut dolor sint qui.', '98538', 'swaniawski.enos@oconnell.com', 'quos', 'fuga', '1565043837', 'ut', '22 minutes', 'Ut dolor cupiditate ut nihil sint.'),
(47, 'Porro ipsa.', '24849', 'bins.roslyn@gmail.com', 'est', 'quis', '1565043837', 'impedit', '7 minutes', 'Et voluptate et exercitationem at quisquam blanditiis consequatur.'),
(48, 'Natus optio sequi.', '94623', 'dheller@hotmail.com', 'assumenda', 'ex', '1565043837', 'est', '26 minutes', 'Nihil quis sapiente provident itaque.'),
(49, 'Enim illum est voluptate.', '34080', 'frankie.doyle@yost.com', 'nisi', 'reprehenderit', '1565043837', 'labore', '10 minutes', 'Neque officia amet quos quo et velit molestias reiciendis odit voluptatem.'),
(50, 'Dolores laborum aut.', '14963', 'alexandrea.veum@gmail.com', 'necessitatibus', 'ratione', '1565043837', 'temporibus', '27 minutes', 'Nisi dignissimos consequatur ipsum velit beatae nostrum corrupti itaque.');

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
(1, 'quam', '43053', 'Sunt et quo.', 'Nam dolorem.', 'Voluptatem iure cupiditate voluptates.', '1565043838', '', 'Repudiandae ab dignissimos similique.'),
(2, 'et', '73017', 'Sed ut.', 'Quidem ipsa.', 'Commodi recusandae esse.', '1565043838', '', 'Explicabo optio quo sapiente amet.'),
(3, 'animi', '88006', 'Eum dolores.', 'Et.', 'Et est soluta et.', '1565043838', '', 'Debitis autem alias porro.'),
(4, 'deserunt', '23211', 'Necessitatibus voluptatem ex.', 'Blanditiis.', 'Quis pariatur dignissimos qui.', '1565043838', '', 'Dolores maxime occaecati vitae facilis.'),
(5, 'vero', '73044', 'Cum ut laudantium.', 'Et sapiente.', 'Doloribus dolorum nisi.', '1565043838', '', 'Nemo eveniet voluptas quia fugit.'),
(6, 'dolore', '52497', 'Doloremque.', 'Eveniet culpa esse.', 'Et et esse repellat.', '1565043838', '', 'Maxime sit et.'),
(7, 'nisi', '22509', 'Consequatur fugiat est.', 'Est ipsa.', 'Aut occaecati laboriosam aut reprehenderit possimus molestiae.', '1565043838', '', 'Vitae nulla natus aspernatur illum magni est.'),
(8, 'minima', '68714', 'Soluta nihil.', 'Ut est.', 'Rerum ea facilis.', '1565043838', '', 'Molestias aut eum quos.'),
(9, 'sed', '70514', 'Et.', 'Nisi ut.', 'Et voluptatem reprehenderit maiores.', '1565043838', '', 'Quia culpa et.'),
(10, 'nisi', '48042', 'Quaerat est.', 'Officia et.', 'Ipsa corporis.', '1565043838', '', 'Impedit qui recusandae sequi labore.'),
(11, 'aliquam', '33320', 'Ipsum accusantium.', 'At excepturi.', 'At hic unde aperiam sed explicabo.', '1565043838', '', 'Pariatur voluptates sed.'),
(12, 'repellendus', '95883', 'Iste explicabo.', 'In est.', 'Quia et maxime laborum.', '1565043838', '', 'Laboriosam aliquid at et delectus inventore.'),
(13, 'voluptatum', '91120', 'Non.', 'Iure a dicta.', 'Exercitationem non nobis repudiandae.', '1565043838', '', 'Sapiente voluptatem qui praesentium quasi quaerat.'),
(14, 'assumenda', '79846', 'Quo repellendus.', 'Non.', 'Deleniti aut aut.', '1565043838', '', 'Sequi est rerum quis.'),
(15, 'exercitationem', '97583', 'Est non.', 'Nam iste.', 'Laboriosam illo dolor deserunt commodi consequatur veniam eaque officiis.', '1565043838', '', 'Est consequatur nisi neque assumenda facilis sit.'),
(16, 'quam', '29074', 'Assumenda molestias.', 'Temporibus.', 'Placeat ut molestias voluptas.', '1565043838', '', 'Distinctio voluptatem in repellendus repudiandae.'),
(17, 'culpa', '61032', 'Rerum quia.', 'Et.', 'Illo dicta quod ut.', '1565043838', '', 'Labore asperiores.'),
(18, 'ducimus', '87607', 'Est quo veritatis.', 'Iure.', 'Sit molestiae dolorem adipisci molestias.', '1565043838', '', 'Tenetur optio.'),
(19, 'repudiandae', '50670', 'Voluptatem.', 'Sunt a.', 'Similique incidunt molestiae.', '1565043838', '', 'Iusto totam provident architecto.'),
(20, 'tempora', '79905', 'Aut corporis.', 'Blanditiis.', 'Voluptates vitae non magni fugit quis ullam.', '1565043838', '', 'Repudiandae non ipsa ullam fugit aliquam officiis.'),
(21, 'dolor', '45575', 'Veritatis est cumque.', 'Perferendis enim.', 'Libero magni quia est est.', '1565043838', '', 'Fugit autem aliquam hic.'),
(22, 'ut', '55180', 'Nesciunt.', 'At cupiditate architecto.', 'Sed adipisci molestias.', '1565043838', '', 'Dolorem iste.'),
(23, 'eligendi', '69598', 'Ut iure.', 'Est quidem.', 'Consequatur amet iste corporis quae doloribus ea qui.', '1565043838', '', 'Nulla vero natus ad distinctio totam suscipit eos excepturi.'),
(24, 'molestias', '59637', 'Molestiae.', 'Quisquam temporibus.', 'Numquam similique quisquam.', '1565043838', '', 'Id id omnis qui est tempora.'),
(25, 'quia', '71644', 'Itaque velit.', 'Modi enim.', 'Dolores dignissimos minima quis illo quis fugiat.', '1565043838', '', 'Ab eligendi magni suscipit quos quasi necessitatibus nostrum optio.'),
(26, 'et', '78547', 'Dolorum officiis.', 'Et qui.', 'Non ex error et vero.', '1565043838', '', 'Quia provident eum porro aut.'),
(27, 'ex', '61371', 'Molestiae officia.', 'Iusto tenetur.', 'Accusamus quisquam nihil rerum.', '1565043838', '', 'Enim ad eum voluptas enim ducimus ut.'),
(28, 'est', '80652', 'Sit architecto.', 'Est autem.', 'Inventore et sit laboriosam non est.', '1565043838', '', 'Commodi cum nihil eos delectus harum.'),
(29, 'dolorum', '44418', 'Sapiente.', 'Sit qui aliquam.', 'Veritatis quia quia inventore et iure.', '1565043838', '', 'Mollitia assumenda placeat.'),
(30, 'architecto', '23515', 'Laboriosam explicabo sed.', 'Mollitia molestiae dolor.', 'Occaecati voluptatem dignissimos aspernatur.', '1565043838', '', 'Doloremque et nisi qui voluptates hic praesentium iusto.'),
(31, 'quasi', '23727', 'Et.', 'Ducimus voluptatem.', 'Et ut vitae suscipit quia.', '1565043838', '', 'Ad sit natus.'),
(32, 'ducimus', '20274', 'Quod et itaque.', 'Aut officiis.', 'Et at ut iste odit.', '1565043838', '', 'Quo aut aspernatur deserunt.'),
(33, 'quo', '71576', 'Consequatur.', 'At eaque.', 'Quod natus neque et dolorum odit corporis blanditiis.', '1565043838', '', 'Iste velit et facere nulla.'),
(34, 'ratione', '18914', 'Rerum cupiditate.', 'Voluptas eos eligendi.', 'Perspiciatis et sunt.', '1565043838', '', 'Et distinctio velit rerum quos sunt.'),
(35, 'dolores', '31095', 'Cumque debitis.', 'Eum ut.', 'Consectetur rem impedit dolore nostrum.', '1565043838', '', 'Minus nihil et.'),
(36, 'et', '84558', 'Atque.', 'Unde iusto.', 'Nemo et necessitatibus porro.', '1565043838', '', 'Sint quae natus et.'),
(37, 'aut', '52649', 'Ut non qui.', 'Commodi enim tempore.', 'Minima nam vero et eaque.', '1565043838', '', 'Dolores tenetur asperiores qui.'),
(38, 'rem', '99985', 'Natus est eos.', 'Ut.', 'Voluptatem facere in a repudiandae.', '1565043838', '', 'Deserunt ullam provident.'),
(39, 'non', '62253', 'Tempora in doloremque.', 'Voluptatem ipsam.', 'Deserunt nihil dignissimos nemo.', '1565043838', '', 'Occaecati similique non id voluptatem.'),
(40, 'totam', '62651', 'Aliquam qui et.', 'Ut minima.', 'Nam quo alias accusantium voluptate.', '1565043838', '', 'Consequatur iure atque soluta in.'),
(41, 'neque', '53077', 'Et quos.', 'Non rerum.', 'Labore perferendis est saepe libero.', '1565043838', '', 'Et mollitia et neque vel.'),
(42, 'et', '50885', 'Eos necessitatibus.', 'Consectetur ipsum rerum.', 'Quisquam alias ut nam atque ut.', '1565043838', '', 'Quia ut accusantium expedita enim sed est.'),
(43, 'omnis', '81323', 'Esse ut.', 'Tenetur molestiae illo.', 'Voluptas dolorem explicabo enim minus ipsum ipsa.', '1565043838', '', 'Molestiae eaque pariatur.'),
(44, 'qui', '65573', 'Dolores ut.', 'Consequuntur.', 'Recusandae odio est labore iure.', '1565043838', '', 'Nulla expedita molestiae eius hic enim.'),
(45, 'cum', '75280', 'Alias quam sapiente.', 'Praesentium iusto.', 'Quaerat numquam hic.', '1565043838', '', 'Minus non velit quia quia explicabo veritatis.'),
(46, 'ut', '25517', 'Illum porro.', 'Illum vero.', 'Ab et harum.', '1565043838', '', 'Asperiores consequatur voluptas enim sed illo.'),
(47, 'dolores', '50607', 'Asperiores ut.', 'Libero cumque.', 'Vel voluptatum ducimus et.', '1565043838', '', 'Ducimus voluptas voluptas et.'),
(48, 'alias', '79261', 'Blanditiis quis.', 'Debitis sit nostrum.', 'Sint tempore optio corporis quasi aspernatur eius.', '1565043838', '', 'Qui eum accusantium dolore necessitatibus.'),
(49, 'accusantium', '70385', 'Ipsum.', 'Itaque.', 'Labore sunt qui.', '1565043838', '', 'Et libero consequatur voluptas et dolorem quae.'),
(50, 'dolore', '84652', 'Hic magnam.', 'Modi explicabo.', 'Aspernatur consequatur.', '1565043838', '', 'Quae dolorem porro ut autem.');

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
(1, 'vel Sec', 5, '[\"35\",\"44\",\"39\",\"26\",\"30\",\"28\"]'),
(2, 'delectus Sec', 12, '[\"34\",\"37\",\"27\"]'),
(3, 'iste Sec', 7, '[\"34\",\"32\",\"43\"]'),
(4, 'ut Sec', 8, '[\"26\",\"42\",\"36\",\"27\"]'),
(5, 'soluta Sec', 4, '[\"37\",\"43\",\"42\",\"44\",\"26\"]'),
(6, 'similique Sec', 7, '[\"39\",\"43\",\"36\"]'),
(7, 'similique Sec', 6, '[\"32\",\"43\"]'),
(8, 'doloremque Sec', 4, '[\"34\",\"39\",\"25\"]'),
(9, 'eius Sec', 2, '[\"30\",\"43\",\"29\",\"33\",\"39\"]'),
(10, 'tempore Sec', 11, '[\"33\",\"40\",\"31\",\"25\",\"24\",\"29\"]'),
(11, 'quam Sec', 1, '[\"31\",\"40\",\"34\",\"30\"]'),
(12, 'exercitationem Sec', 15, '[\"38\",\"33\",\"31\",\"30\"]'),
(13, 'quibusdam Sec', 3, '[\"40\",\"39\"]'),
(14, 'laudantium Sec', 12, '[\"37\",\"34\",\"27\"]'),
(15, 'consectetur Sec', 13, '[\"24\",\"32\",\"39\"]'),
(16, 'nesciunt Sec', 3, '[\"32\",\"35\"]'),
(17, 'sed Sec', 7, '[\"32\",\"35\",\"37\"]'),
(18, 'eligendi Sec', 2, '[\"34\",\"39\",\"26\",\"31\",\"44\",\"25\",\"32\"]'),
(19, 'maiores Sec', 7, '[\"33\",\"35\",\"36\"]'),
(20, 'sequi Sec', 14, '[\"34\",\"35\",\"40\",\"39\",\"41\"]'),
(21, 'velit Sec', 2, '[\"25\",\"29\",\"32\",\"41\",\"39\",\"34\",\"26\"]'),
(22, 'maiores Sec', 9, '[\"25\",\"34\",\"40\",\"27\",\"33\"]'),
(23, 'porro Sec', 5, '[\"35\",\"44\",\"28\",\"27\",\"24\",\"34\"]'),
(24, 'qui Sec', 5, '[\"26\",\"24\",\"44\",\"30\",\"39\",\"35\"]'),
(25, 'culpa Sec', 11, '[\"39\",\"33\",\"25\",\"40\"]'),
(26, 'praesentium Sec', 7, '[\"33\",\"43\",\"34\",\"36\"]'),
(27, 'incidunt Sec', 2, '[\"44\",\"29\",\"30\",\"33\",\"32\"]'),
(28, 'sit Sec', 3, '[\"35\",\"30\"]'),
(29, 'enim Sec', 3, '[\"39\",\"40\",\"30\",\"26\"]'),
(30, 'aut Sec', 14, '[\"34\",\"27\",\"40\"]'),
(31, 'aut Sec', 14, '[\"40\",\"35\",\"41\",\"37\",\"25\"]'),
(32, 'totam Sec', 15, '[\"33\",\"42\",\"40\",\"34\"]'),
(33, 'aliquam Sec', 3, '[\"40\",\"32\"]'),
(34, 'consectetur Sec', 1, '[\"34\",\"40\",\"28\",\"25\"]'),
(35, 'adipisci Sec', 11, '[\"37\",\"41\",\"40\",\"28\"]'),
(36, 'maxime Sec', 1, '[\"28\",\"25\",\"26\",\"34\"]'),
(37, 'quibusdam Sec', 9, '[\"41\",\"44\",\"33\",\"34\",\"25\"]'),
(38, 'sed Sec', 5, '[\"24\",\"30\",\"41\",\"40\",\"44\",\"27\"]'),
(39, 'aut Sec', 2, '[\"39\",\"44\",\"30\",\"42\",\"26\",\"43\",\"32\"]'),
(40, 'neque Sec', 7, '[\"34\",\"43\",\"35\",\"39\"]'),
(41, 'est Sec', 2, '[\"44\",\"32\",\"33\",\"43\",\"25\"]'),
(42, 'quia Sec', 2, '[\"41\",\"44\",\"34\",\"26\",\"36\"]'),
(43, 'animi Sec', 13, '[\"29\",\"41\",\"24\"]'),
(44, 'doloremque Sec', 9, '[\"40\",\"28\",\"41\",\"27\",\"34\"]'),
(45, 'qui Sec', 12, '[\"24\",\"42\"]'),
(46, 'dicta Sec', 10, '[\"36\",\"43\",\"32\"]'),
(47, 'quam Sec', 11, '[\"39\",\"32\",\"25\",\"28\"]'),
(48, 'eos Sec', 15, '[\"31\",\"38\",\"33\"]'),
(49, 'enim Sec', 6, '[\"32\",\"29\"]'),
(50, 'iure Sec', 15, '[\"33\",\"31\",\"34\"]'),
(51, 'deserunt Sec', 6, '[\"29\",\"32\"]'),
(52, 'iure Sec', 15, '[\"38\",\"31\",\"30\"]'),
(53, 'saepe Sec', 13, '[\"42\",\"24\",\"36\",\"32\"]'),
(54, 'fugiat Sec', 14, '[\"25\",\"41\",\"36\"]'),
(55, 'illum Sec', 13, '[\"32\",\"29\",\"24\",\"36\"]'),
(56, 'dignissimos Sec', 15, '[\"31\",\"42\",\"40\"]'),
(57, 'tempore Sec', 11, '[\"32\",\"29\",\"40\",\"34\"]'),
(58, 'expedita Sec', 12, '[\"34\",\"44\"]'),
(59, 'dolores Sec', 5, '[\"27\",\"44\",\"34\",\"30\"]'),
(60, 'tenetur Sec', 15, '[\"38\",\"42\",\"40\"]');

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
(1, 'Home', 'Sequi aut sint reprehenderit deleniti eos quam eaque earum vel quia et culpa fuga.', 1),
(2, 'About us', 'Modi sit illo expedita ut qui reiciendis corporis eos voluptatem facilis inventore quod omnis saepe et praesentium.', 1),
(3, 'CMS', 'Soluta culpa quo quia enim sed excepturi quod voluptatum natus molestiae tempora qui aut porro.', 1),
(4, 'Sections', 'Ab tempore possimus quia tempora ut dicta dolor ut et adipisci recusandae totam consequatur magni a suscipit sit exercitationem iure est sed maxime sed et.', 1),
(5, 'Subjects', 'Enim modi odit aperiam modi nulla nobis quo qui odit nostrum voluptate dolorum ab ratione id quas dolore porro nobis.', 1);

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
(1, 'Atque.', 'Similique qui molestiae id nostrum aut et atque molestiae quasi nostrum officia sed dolorum rem.'),
(2, 'Libero.', ''),
(3, 'Cumque.', 'Est fugit et pariatur hic neque atque ab earum ratione expedita harum nihil velit consequatur ea quis culpa officiis.'),
(4, 'Dolor qui.', 'Et veniam consequuntur et molestias eius.'),
(5, 'Perspiciatis.', 'Qui qui possimus molestiae in ea voluptatem odit et accusamus.'),
(6, 'Commodi.', 'Expedita omnis placeat accusamus sed asperiores sunt.'),
(7, 'Sit.', ''),
(8, 'Voluptatem.', 'Nemo facere ut voluptas dignissimos voluptatem a aut sit nesciunt voluptatum aut quisquam sint aliquam illo cupiditate.');

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
(1, 'Error qui autem.', '', '', '[\"11\"]', '[\"25\",\"11\",\"32\"]', 4, 32),
(2, 'Consequatur.', '', '', '[\"1\"]', '[\"43\"]', 2, 32),
(3, 'Laborum quod.', '', '', '[\"8\",\"14\",\"5\"]', '[\"35\",\"58\",\"16\"]', 7, 30),
(4, 'Quod.', '', '', '[\"13\",\"11\"]', '[\"59\",\"12\",\"35\"]', 5, 43),
(5, 'Velit laborum.', '', '', '[\"13\",\"8\",\"1\"]', '[\"10\",\"40\",\"4\"]', 7, 33),
(6, 'Nesciunt illo tempora.', '', '', '[\"10\",\"12\",\"1\"]', '[\"32\"]', 10, 30),
(7, 'Nostrum illo.', '', '', '[\"8\"]', '[\"6\",\"36\"]', 6, 29),
(8, 'Odio non.', '', '', '[\"12\",\"9\"]', '[\"37\"]', 10, 26),
(9, 'Asperiores hic.', '', '', '[\"4\"]', '[\"29\",\"19\"]', 1, 37),
(10, 'Et possimus.', '', '', '[\"5\",\"7\",\"4\"]', '[\"17\",\"48\",\"9\"]', 4, 27),
(11, 'Ut eum.', '', '', '[\"2\"]', '[\"33\",\"29\",\"60\"]', 3, 41),
(12, 'Veritatis eligendi.', '', '', '[\"5\",\"9\",\"12\"]', '[\"28\"]', 7, 41),
(13, 'Aliquid voluptatem.', '', '', '[\"14\"]', '[\"28\",\"49\"]', 1, 38),
(14, 'Debitis et.', '', '', '[\"4\"]', '[\"60\"]', 5, 31),
(15, 'Deleniti nemo minus.', '', '', '[\"4\",\"9\",\"13\"]', '[\"10\"]', 6, 38),
(16, 'Test material', 'desc...', NULL, '[\"11\"]', '[\"25\"]', 4, 24);

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
(1, 'Nesciunt.', '10', '70', '[\"24\",\"41\",\"32\",\"29\",\"38\",\"31\",\"40\",\"44\",\"28\",\"26\"]'),
(2, 'Minus.', '40', '70', '[\"31\",\"38\",\"26\",\"44\",\"28\",\"35\",\"43\",\"33\",\"41\",\"36\",\"40\",\"37\",\"29\",\"25\",\"32\"]'),
(3, 'Aut explicabo.', '40', '80', '[\"40\",\"24\",\"28\",\"33\",\"31\",\"36\",\"42\",\"41\",\"44\",\"27\",\"29\",\"38\",\"43\",\"35\",\"39\"]'),
(4, 'Corrupti pariatur.', '20', '100', '[\"27\",\"32\",\"42\",\"28\",\"34\",\"44\",\"38\",\"37\",\"33\",\"43\",\"30\",\"39\",\"29\",\"41\",\"24\"]'),
(5, 'Non ducimus odio.', '10', '80', '[\"24\",\"41\",\"35\",\"43\",\"34\",\"25\",\"33\",\"42\"]'),
(6, 'Aut ut.', '40', '80', '[\"42\",\"34\",\"41\",\"31\",\"35\",\"28\",\"24\",\"40\"]'),
(7, 'Quis provident molestiae.', '40', '80', '[\"34\",\"42\",\"43\",\"36\",\"24\",\"28\",\"25\",\"37\",\"44\",\"39\",\"33\",\"32\"]'),
(8, 'Quia consequatur.', '10', '60', '[\"37\",\"28\",\"44\",\"25\",\"43\",\"36\",\"39\",\"31\",\"32\"]'),
(9, 'Voluptatem.', '10', '90', '[\"42\",\"26\",\"28\",\"40\",\"32\",\"35\",\"30\",\"29\",\"43\",\"39\",\"27\",\"33\"]'),
(10, 'Harum.', '30', '80', '[\"26\",\"44\",\"33\",\"34\",\"36\",\"25\",\"42\",\"29\",\"24\",\"35\",\"41\",\"40\",\"38\"]');

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
(1, 'Molestiae iusto.', 'Atque deserunt incidunt.', '[\"8\",\"9\",\"5\"]', '520'),
(2, 'Est aut.', 'Esse voluptas et reprehenderit.', '[\"2\",\"7\",\"8\"]', '650'),
(3, 'Odit.', '', '[\"10\"]', '750'),
(4, 'Non enim.', 'Accusamus labore explicabo.', '[\"2\",\"1\",\"9\"]', '690'),
(5, 'Accusantium.', '', '[\"7\"]', '790'),
(6, 'Occaecati.', '', '[\"6\",\"8\"]', '840'),
(7, 'Et provident.', '', '[\"10\",\"6\"]', '500'),
(8, 'Ut.', 'Voluptatibus id.', '[\"3\",\"4\",\"8\"]', '630'),
(9, 'Distinctio dolores.', '', '[\"7\",\"2\"]', '890'),
(10, 'Consequatur provident.', '', '[\"2\"]', '860'),
(11, 'Modi inventore.', 'Quasi enim veritatis ut.', '[\"5\",\"10\",\"6\"]', '850'),
(12, 'Id.', 'Ipsa consequatur voluptatibus perspiciatis.', '[\"5\",\"4\",\"6\"]', '810'),
(13, 'Aliquid rerum.', 'Omnis quia suscipit nostrum.', '[\"8\",\"2\"]', '880'),
(14, 'Voluptatum.', 'Eos laudantium harum.', '[\"8\",\"9\",\"2\"]', '550'),
(15, 'Atque culpa.', 'Quas ex.', '[\"10\",\"1\"]', '620');

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
(1, '7537', '', 'ullam', 'Dr. Arnaldo Abernathy', '', '639092456988176', 'Maiores itaque saepe facere.', 'Et sunt fuga veritatis.'),
(2, '1016', '', 'id', 'Jamir Kiehn DVM', '', '142829663239535', 'Quia voluptatem eos architecto.', 'Consequuntur fugiat accusantium eligendi deserunt error.'),
(3, '1794', '', 'delectus', 'Mr. Deondre Torphy DVM', '', '581671255955133', 'Laborum dolore voluptates alias cupiditate.', 'Eius soluta enim nesciunt numquam.'),
(4, '4602', '', 'sed', 'Kasandra Beahan', '', '717142834483435', 'Ab exercitationem dolorem.', 'Sed ut omnis consequatur quaerat.'),
(5, '5803', '', 'aspernatur', 'Dr. Anne Ryan II', '', '142815238441697', 'Quod dolor officiis.', 'Vitae modi culpa sed optio.'),
(6, '8118', '', 'officiis', 'Jacky Batz DVM', '', '200204813798633', 'Consequatur pariatur quaerat magni.', 'Nulla quae dolorum sequi suscipit doloribus.'),
(7, '3987', '', 'odit', 'Eldridge Balistreri', '', '655845654411250', 'Eos consequatur.', 'Est deleniti velit ullam quaerat.'),
(8, '2189', '', 'rerum', 'Prof. Donald Upton DVM', '', '336913886793987', 'Commodi aut.', 'Ipsa alias quo nostrum.'),
(9, '9205', '', 'hic', 'Marilie Lynch DVM', '', '435458059825437', 'Quidem quod exercitationem.', 'Voluptate voluptate odit.'),
(10, '7067', '', 'ab', 'Stephania Kautzer PhD', '', '685237347344508', 'Quidem possimus delectus.', 'Voluptatem excepturi earum rerum aut.');

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
(1, 'ahmedsk', 'mavis.bode@hotmail.com', '$2y$10$3TMM/e.BizFLjexxiHy3leURyPJ9I5MxxrC6I6tWtUPqI944ZB52S', '9jr2frcvUecdtrABiMTj3yNjmif7GH4OrI3ouWkkzgE7eEhheBA7JmsvyhJm', 'Ahmed Sayed', 'admin', 2, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '832002', '+41 1911613', 0, 0, '', NULL, '', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '123456789', '0000-00-00'),
(2, 'virtu', 'nakia99@roob.org', '$2y$10$RqCPMZxHeGrYXwoxcUgMPu/Om5uo5ZF4E1uSpNDqYcxdFyDrDn0Pi', '', 'Virtu', 'admin', 2, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '808206', '+43 2426953', 0, 0, '', NULL, '', '062.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(3, 'employee', 'zgulgowski@mohr.com', '$2y$10$VbOoiX3m3S5KI9WyiSBRyuYlnVq1X08IByLFoYYtlqYQzYRb15AAq', '', '[Em] Estelle Purdy', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '483005', '+82 3004265', 0, 0, '', NULL, '', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(4, 'alfonso.fahey', 'kenna49@hotmail.com', '$2y$10$8lIge8gcFux6v.Xw9kCrPuNC2Pm.VT9QQ5JoQ/G5Wur6Nuc7QVu2K', '', '[Em] Dr. Sandrine Abbott PhD', 'employee', 3, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '329978', '+48 6153274', 0, 0, '', NULL, '', '037.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(5, 'iparker', 'earlene.schultz@oconner.com', '$2y$10$m01Jxd0j7FYAdDm4cWLFtOoZtb5fU2xpb/2uOivdv5OYqtNvK7nrC', '', '[Em] Hoyt Will MD', 'employee', 11, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '396929', '+60 5927209', 0, 0, '', NULL, '', '025.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(6, 'robin93', 'tierra.ledner@hotmail.com', '$2y$10$pElZHWmqFKPXDmS.cWaaEO3fWVKYdlB0A5TJoVvlqXOJMu7X/qsGi', '', '[Em] Tevin Heaney', 'employee', 10, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '955085', '+17 1736801', 0, 0, '', NULL, '', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(7, 'beahan.mellie', 'shaina.frami@runte.com', '$2y$10$SZF6hm1ZhH5kpmBKNg/uaOMNtHhu7KM.RrObcFPLwcbQ8t9rYS976', '', '[Em] Mr. Adam Stoltenberg I', 'employee', 11, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '894762', '+19 7849402', 0, 0, '', NULL, '', '065.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(8, 'jgreenholt', 'ncole@hilpert.com', '$2y$10$XUhXFRQwZkXFx45EZ.S5uOnta5DKFD1nBKwttbfl73YzYwfvKDH2C', '', '[Em] Shanelle Kreiger', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '200712', '+46 2515548', 0, 0, '', NULL, '', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(9, 'ubode', 'jeanie.bartell@gmail.com', '$2y$10$zkPnsnwl/qbcRz4RZndnWuMqr/GrtSdxNZ0yWulL8V7a1bNA5VEeK', '', '[Em] Lorenza Walker', 'employee', 14, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '422852', '+84 2131876', 0, 0, '', NULL, '', '048.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(10, 'hansen.jimmy', 'abigail26@luettgen.com', '$2y$10$4LmKNMs7bsHxPNxz8TUITu.BbVqzGER.InqXdN5VM7dvHeO/k4KVu', '', '[Em] Liam Rutherford', 'employee', 9, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '117151', '+27 9920659', 0, 0, '', NULL, '', '02.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(11, 'spurdy', 'sruecker@gmail.com', '$2y$10$gBxP6VTBF3mWD6T4af3nXuHuFN6CwEYw7Auz4FgcebXZ3gMeXknRq', '', '[Em] Ila Jakubowski', 'employee', 11, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '743063', '+32 9925311', 0, 0, '', NULL, '', '021.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(12, 'rowe.domenic', 'jtrantow@hotmail.com', '$2y$10$dW.KMejzh9NZgzOSAa3NnOL/3mz4gcPu/ETYocsGfDgOZb/Kg5GbO', '', '[Em] Maynard Thiel', 'employee', 10, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '419224', '+51 7579780', 0, 0, '', NULL, '', '023.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(13, 'jesse.mitchell', 'ebuckridge@yahoo.com', '$2y$10$XOCxK1vBlUoCuubE7Y2er.FHGVn8QwcGhPnGJrsXBw5ezsEh7gxXu', '', '[Em] Jennyfer Bergnaum', 'employee', 14, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '954458', '+10 6566772', 0, 0, '', NULL, '', '040.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(14, 'npollich', 'lillian.ortiz@rodriguez.info', '$2y$10$I.pBJ2Y5Sfb2neOoVba90ul2wsajvlqFxhXmLZ0RDFnsEaPHjjjJi', '', '[Em] Garrett Waters', 'employee', 4, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '747448', '+96 8890668', 0, 0, '', NULL, '', '010.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(15, 'yundt.sterling', 'lloyd41@rosenbaum.org', '$2y$10$Nrj/7UvsMT3LODQxz/C0wO5Q5CslVidTTvlKq4oPxxfldM61O5rKK', '', '[Em] Karine Zemlak', 'employee', 4, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '905189', '+80 9520514', 0, 0, '', NULL, '', '020.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(16, 'ondricka.reginald', 'fritsch.unique@koch.info', '$2y$10$A2XG4W9gUJe0nDSvobZRN.WoUzSYUp6I5iM93DQeJZ3522w46BISi', '', '[Em] Arlie Jerde', 'employee', 4, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '379034', '+73 9507671', 0, 0, '', NULL, '', '03.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(17, 'mylene.mann', 'adella30@macejkovic.com', '$2y$10$lcwLNPIVIxhb2ho6hZvyRee7HzKU3uYuMzEWVBmWGVmL7woqSJh/e', '', '[Em] Dr. Josiah Mayer III', 'employee', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '139945', '+70 2516191', 0, 0, '', NULL, '', '010.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(18, 'rosemary92', 'estella.wehner@gmail.com', '$2y$10$KmxfqmVj4431H2cIMwfLYuN6xGr7hp7U6WkNLpszZZ29ulXY8Dy/q', '', '[Em] Eulalia Wilderman', 'employee', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '542987', '+80 3894408', 0, 0, '', NULL, '', '018.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(19, 'labadie.toby', 'amir.weimann@zulauf.com', '$2y$10$9V4tNW/IOLPfrRdhO7HC7eas19HyBQvZfbNLPyfm6WSkBrvjCaYZ2', '', '[Em] Bryce Lind I', 'employee', 13, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '392173', '+26 6532212', 0, 0, '', NULL, '', '097.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(20, 'tboyer', 'trudie76@gmail.com', '$2y$10$.58jx265FFSpX31b1qOSL.ykuwySDjPeR3/z/.63RUp8S06aXZt6y', '', '[Em] Lavon Feest', 'employee', 9, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '791733', '+56 1134097', 0, 0, '', NULL, '', '058.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(21, 'babernathy', 'rozella00@bradtke.info', '$2y$10$yns.S0t58eZXnaoYmaCwheVGDpRvvsYTC8vVy7nGaCxnIyY/IMOiW', '', '[Em] Shanelle Schaden', 'employee', 13, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '509768', '+94 7235680', 0, 0, '', NULL, '', '021.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(22, 'considine.dandre', 'reyna95@gmail.com', '$2y$10$KaU/uAjmiMiKNyrQm6CpGe6HwNLem7Xxwb3wyTDQ.qXYulWmp8s3y', '', '[Em] Alphonso Luettgen', 'employee', 8, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '363466', '+67 1958839', 0, 0, '', NULL, '', '090.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(23, 'nhauck', 'little.vivian@gmail.com', '$2y$10$0ULje1p.MO0GrjxX0UhCJ.rdC8meC5EfQiSW4BBsKFxw3LsFa480C', '', '[Em] Judge Rau', 'employee', 10, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '253572', '+97 1237018', 0, 0, '', NULL, '', '032.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(24, 'teacher', 'cdicki@gmail.com', '$2y$10$nQGxoZncNC2h4FxDVxqnHO1Ls6bwjtRa83Uw/z9qAs.9A8SbGiDfS', '', '[Te] Nelda Hyatt II', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '467390', '+16 6124288', 0, 0, '', NULL, '', '051.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(25, 'francesca.lang', 'kcole@gmail.com', '$2y$10$UOJFuKvHtHjT0XZc85nPcu4.JFKIvAJRv3BciMHJYfqKqnEdaGuju', '', '[Te] Odie Waelchi Sr.', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '803825', '+96 4855629', 0, 0, '', NULL, '', '060.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(26, 'simone51', 'katelyn.kuhlman@sipes.info', '$2y$10$RmRgCGLiNX9/xGuB2FTREOUE5f.EponX8Dng6b.m7kazKWW09USQ2', '', '[Te] Humberto McKenzie', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '382146', '+89 1435971', 0, 0, '', NULL, '', '037.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(27, 'ymayert', 'murphy.may@gerlach.info', '$2y$10$kkYdl4P180cNKu46/sAL/O2er5lvBPHTe3C/uF8KbWT/eM9wnOwoK', '', '[Te] Prof. Stephon Daniel', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '501777', '+15 3241712', 0, 0, '', NULL, '', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(28, 'maryjane39', 'bhomenick@gmail.com', '$2y$10$SvhYHnzCzY27FgSQ/NGva.AmFbzMdUISAi8ZTk1uZAAJBhks0dqaW', '', '[Te] Jayda Nitzsche', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '600919', '+47 1683955', 0, 0, '', NULL, '', '022.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(29, 'name95', 'qwaelchi@pollich.biz', '$2y$10$tdsLjvOPd5rTtBwCAIwaleZQEWj82.zIFwiMrOY9aUpOwnfvBn.hq', '', '[Te] Frederique Kuhn', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '607578', '+85 8764970', 0, 0, '', NULL, '', '047.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(30, 'haag.ralph', 'lwitting@gmail.com', '$2y$10$ynS61diaKFPqxiuWgW.hyuGiSBlPXalA4OxefUBLs61VDd1t3dfjO', '', '[Te] Prof. Alize Effertz MD', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '452770', '+81 3087036', 0, 0, '', NULL, '', '073.png', 'Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(31, 'moore.neva', 'scole@homenick.com', '$2y$10$ZTp5WR93/ksjj0jaBIVq1.6dVT4tZca7JPLh4ArcBfKf7gbPQTyuG', '', '[Te] Dr. Chadd Luettgen Sr.', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '466341', '+16 6981721', 0, 0, '', NULL, '', '043.png', 'Vice Principal', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(32, 'vrath', 'nupton@yahoo.com', '$2y$10$8IG9.9IqJPj4Bw5tBxBqh.H0Zpmh0ZM8NqbXLuX42GaKl243pW.4K', '', '[Te] Harrison Hessel', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '386203', '+81 4336533', 0, 0, '', NULL, '', '048.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(33, 'daugherty.waylon', 'loyal47@yahoo.com', '$2y$10$L.g/vvNcAUel3K.TRGcZJu7BLJvAEVVZXm.nlNgVSeUNrutyYy5Me', '', '[Te] Braulio Hills', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '406418', '+74 2273097', 0, 0, '', NULL, '', '021.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(34, 'kim69', 'lubowitz.griffin@hotmail.com', '$2y$10$dWhwYnOLpDTi74Yo/CrZLuRxqI0DAlEY/Kk2zV7x35/AiDCNVM7DG', '', '[Te] Krista Runolfsdottir Jr.', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '302259', '+42 9741287', 0, 0, '', NULL, '', '09.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(35, 'torp.josiane', 'buckridge.abbigail@mante.net', '$2y$10$EX3gMX3oZkHFoMx.DP973usJ/..8gdpbFS.wMEAcfh7s6gQwSP9um', '', '[Te] Dr. Destiney Witting', 'teacher', 5, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '964185', '+58 3155229', 0, 0, '', NULL, '', '073.png', 'Captain: Yellow House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(36, 'faye.reichert', 'francisco64@goodwin.net', '$2y$10$lhkk7xhZ1JKC8c5YJlvdR.wSuo4CLzCF7q8LJH/5DHYazMK5RhcZG', '', '[Te] Mabel Emard', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '645561', '+28 3786059', 0, 0, '', NULL, '', '010.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(37, 'xnikolaus', 'jimmie.jerde@hotmail.com', '$2y$10$IA2D7V7tPFVRzEDXxbzEBOiqcos0CIMxlhelvY7KtsOrb6Wei1.Bq', '', '[Te] Caterina Stanton II', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '557820', '+69 2104061', 0, 0, '', NULL, '', '072.png', 'Clever', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(38, 'predovic.noe', 'josefina.murazik@hotmail.com', '$2y$10$KYcCoSeHNNJBSnx3d.rwC.Zhj8jSUEvEmcX80y/2Sil2OnvEoaiKu', '', '[Te] Peyton Keeling', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '342032', '+96 3452839', 0, 0, '', NULL, '', '029.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(39, 'morissette.wilfredo', 'eliezer.runolfsson@hotmail.com', '$2y$10$MsZJQq44phgxnK2RHo0pN.hOZrLrm9HrWJQimKTt.sPUbuBcDjqbC', '', '[Te] Jaquan Lakin', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '209073', '+39 9142254', 0, 0, '', NULL, '', '028.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(40, 'curtis.schuster', 'gerlach.rogelio@pagac.com', '$2y$10$3bTFfknLXVTNm69up16izuOUhuWdCghd9cmAOmitkh6F3H4.FisGG', '', '[Te] Emmanuel Stehr', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '444326', '+55 5031604', 0, 0, '', NULL, '', '024.png', 'Advanced one', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(41, 'rhea.senger', 'seichmann@yahoo.com', '$2y$10$nuYwZ6ZJWi5zElo8VZP4V.4NGhqJKl5eh.F5B3X6TVq2TkkoxEbxi', '', '[Te] Dr. Eloy Quigley I', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '905792', '+14 1665400', 0, 0, '', NULL, '', '072.png', 'Pro', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(42, 'schaden.sabina', 'acummings@gmail.com', '$2y$10$IYh5G4owLplkFgszYvIcxu4/HVs6EkuPNjzOaBYkH9glqxOKmxT4C', '', '[Te] Kayleigh Zemlak III', 'teacher', 5, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '479255', '+51 6306559', 0, 0, '', NULL, '', '011.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(43, 'dixie62', 'caroline.kautzer@hotmail.com', '$2y$10$7pjwttNNOlyzq/eQgGh6RuWctQImNk1HxOr67wFo72yujr/ohV/.W', '', '[Te] Rico Morissette DVM', 'teacher', 5, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '524020', '+41 5488471', 0, 0, '', NULL, '', '039.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(44, 'aliyah63', 'mraz.elvera@hotmail.com', '$2y$10$ngyUMU9yCXasdYEphix06OsZ8ApDkSFTByet7L8XMuea/vRyunZ.O', '', '[Te] Torrey Langosh', 'teacher', 5, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '276385', '+10 4323419', 0, 0, '', NULL, '', '050.png', 'Captain: Blue House', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(45, 'student', 'gustave49@hotmail.com', '$2y$10$Tfwdos.7xnBm/bh3iymPn.qYFu9/4z1JOSnY.0JASqP6YcuBY6nXe', '', '[St] Kelton Schroeder PhD', 'student', 6, 4, NULL, 0, 1, '77', '24-406-78', 0, 0, '', 0, NULL, NULL, '4072523235', '3038615', 7, 26, '', NULL, '', '065.png', 'Principal', '', 1, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(46, 'xward', 'eric99@quigley.com', '$2y$10$ibrheN.z8/199ucKWjstK.Xw4QKhRfdNm4xVul29GCDGM8xbP3SjS', '', '[St] Antonio O\'Connell', 'student', 6, 1, NULL, 0, 1, '56', '88-112-22', 0, 0, '', 0, NULL, NULL, '4761491614', '1745199', 9, 22, '', NULL, '', '075.png', '', '', 9, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(47, 'qparker', 'glenda85@ryan.com', '$2y$10$rT.2IZ00/hxQ8jnLfwKIaeLyNlw8YIc2EBDI7E1iF6Q2X4NGkEUk6', '', '[St] Octavia Gulgowski', 'student', 6, 1, NULL, 0, 1, '47', '10-864-74', 0, 0, '', 0, NULL, NULL, '1508927956', '4217804', 7, 19, '', NULL, '', '030.png', '', '', 5, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(48, 'gregory66', 'vfarrell@rowe.com', '$2y$10$x2LgtAhemuDJeFX10d0W/eEMqAAbcBuFwZMhTtcEza//nVdBPpBIu', '', '[St] Mitchel Dickens', 'student', 6, 3, NULL, 0, 1, '72', '73-820-75', 0, 0, '', 0, NULL, NULL, '9357375653', '4865455', 9, 22, '', NULL, '', '086.png', '', '', 5, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(49, 'helena.rau', 'giuseppe88@christiansen.com', '$2y$10$gatAzkgVwri..g6c7HFjzeeuRUQ//5VP2TlslBAx5azIVOwVbB.BO', '', '[St] Prof. Francisco Okuneva MD', 'student', 6, 1, NULL, 0, 1, '58', '49-710-39', 0, 0, '', 0, NULL, NULL, '2650808234', '2940182', 11, 57, '', NULL, '', '046.png', 'Captain: Blue House', '', 9, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(50, 'heidenreich.solon', 'joanne.rutherford@dibbert.info', '$2y$10$4hJTEze7ZtwmQH7NUbhzNO4ClQw2xIizEen4s8SLzLzloYbpcRwZ.', '', '[St] Laurianne Kautzer', 'student', 6, 2, NULL, 0, 1, '29', '95-550-80', 0, 0, '', 0, NULL, NULL, '4838740595', '6768312', 7, 40, '', NULL, '', '028.png', 'Pro', '', 8, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(51, 'nils00', 'julius.lang@spinka.net', '$2y$10$r1JJep4gfHKtioR5evfyfeCjja.BM.HAL0MFnAU3mCeHD8EIKQ/Yq', '', '[St] Dr. Shawn Weissnat Sr.', 'student', 6, 1, NULL, 0, 1, '21', '81-615-21', 0, 0, '', 0, NULL, NULL, '4270055537', '7851244', 14, 20, '', NULL, '', '077.png', 'Advanced one', '', 11, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(52, 'schneider.jane', 'bradtke.alexandra@kiehn.com', '$2y$10$72b7R9Rhv1ONsgM.fJtZbeELqBxQhd63YpPmBq55Fyo9oaxdx1EOK', '', '[St] Neil Schulist II', 'student', 6, 2, NULL, 0, 1, '28', '74-820-89', 0, 0, '', 0, NULL, NULL, '9698529233', '9226070', 14, 54, '', NULL, '', '061.png', 'Captain: Yellow House', '', 2, 8, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(53, 'izabella59', 'skovacek@wintheiser.com', '$2y$10$00QhCO5p8SvfnM.MSZBxU.A2WYfhxTD4Evao/LSXyTVWwftFpBH0e', '', '[St] Dr. Mollie Beier DDS', 'student', 6, 3, NULL, 0, 1, '81', '41-613-24', 0, 0, '', 0, NULL, NULL, '9883365824', '8778369', 14, 20, '', NULL, '', '089.png', 'Captain: Blue House', '', 14, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(54, 'nicolette.gerhold', 'abbott.trinity@hotmail.com', '$2y$10$xBhecl0YC5DxIFjaBcSKAu6KLHDurU62QG/22dgIIL2JI7nSk0AIG', '', '[St] Lera Becker', 'student', 6, 2, NULL, 0, 1, '4', '11-394-69', 0, 0, '', 0, NULL, NULL, '9775708592', '8079550', 11, 25, '', NULL, '', '026.png', 'Pro', '', 4, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(55, 'gadams', 'daniel.annamarie@jacobson.com', '$2y$10$k./Mbl4rwxccRuBXEu2xludVHVYxUFDW/7VGJydYGFqS4srCxanOO', '', '[St] Miss Lia Denesik', 'student', 6, 2, NULL, 0, 1, '68', '63-248-81', 0, 0, '', 0, NULL, NULL, '1011148121', '9643725', 7, 6, '', NULL, '', '061.png', '', '', 10, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(56, 'jarret.rowe', 'lelia41@ernser.com', '$2y$10$kG/r3QceUXdPbOBjAW7BnOFlSa0Yhnnp0ScMbGfw5qM6bd.PQb87K', '', '[St] Vanessa Smith', 'student', 6, 4, NULL, 0, 1, '60', '70-310-65', 0, 0, '', 0, NULL, NULL, '2705616784', '6771821', 6, 7, '', NULL, '', '023.png', 'Vice Principal', '', 9, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(57, 'margarette.hoppe', 'wilton.prosacco@powlowski.biz', '$2y$10$KOcIWNaF7jpB3DSY69fGEeOVTqPAk9WCTfSpNZ6fq2Ri9ceNE77Wa', '', '[St] Karina Gulgowski DDS', 'student', 6, 3, NULL, 0, 1, '21', '16-602-84', 0, 0, '', 0, NULL, NULL, '1089401847', '6631188', 7, 17, '', NULL, '', '031.png', '', '', 9, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(58, 'carissa.stiedemann', 'malinda14@yahoo.com', '$2y$10$ErC6ed7V6S5/puzOh8F8aOoEZv2PqzBgX6TXDvxMgw8ftHTXixM.6', '', '[St] Prof. Reina Marks', 'student', 6, 3, NULL, 0, 1, '44', '26-638-49', 0, 0, '', 0, NULL, NULL, '2441152546', '7234392', 11, 47, '', NULL, '', '038.png', '', '', 4, 1, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(59, 'lisette.schaefer', 'krajcik.gaylord@mueller.com', '$2y$10$KH10NJk7qpASe711nAUSVuZuW939w7EpqsSUHPLvZHSQYOWdbAV9C', '', '[St] Alice Goyette', 'student', 6, 4, NULL, 0, 1, '7', '59-320-56', 0, 0, '', 0, NULL, NULL, '1659607302', '5343259', 14, 20, '', NULL, '', '046.png', '', '', 12, 5, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(60, 'stephan.labadie', 'annie06@ankunding.com', '$2y$10$eqT.vplVRIY4IIvHwuYireEDqvRQFacWLVRl.7I3FGMwVIleVHyy2', '', '[St] Andy Rutherford', 'student', 6, 3, NULL, 0, 1, '98', '37-715-36', 0, 0, '', 0, NULL, NULL, '8320560529', '1666136', 6, 51, '', NULL, '', '08.png', '', '', 5, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(61, 'sawayn.randy', 'shayne11@gmail.com', '$2y$10$wSj307Q0ucQw390x3KMtVOTlFvYx5n6Tfn9HFvxMiQ4FXibWE6zQu', '', '[St] Kathryn Kub', 'student', 6, 4, NULL, 0, 1, '27', '44-810-45', 0, 0, '', 0, NULL, NULL, '2929806762', '5638293', 6, 7, '', NULL, '', '057.png', '', '', 9, 7, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(62, 'kdeckow', 'akshlerin@gibson.net', '$2y$10$f2dvEY.PUuJj6wHcN8WGE.XMvxs7L4SMyFwX/fr5Yo7sN2QZE9gGq', '', '[St] Prof. Jess Lebsack', 'student', 6, 3, NULL, 0, 1, '37', '38-127-20', 0, 0, '', 0, NULL, NULL, '5463300472', '7156052', 7, 40, '', NULL, '', '076.png', 'Pro', '', 1, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(63, 'franecki.newell', 'nelle.paucek@heller.net', '$2y$10$73yRdACKBKqKGPjK/hNS/euXkvYYt6otRapl4uBAzDQREvKpcVmj.', '', '[St] Van Wolf', 'student', 6, 3, NULL, 0, 1, '95', '81-587-55', 0, 0, '', 0, NULL, NULL, '9818154878', '7697726', 7, 3, '', NULL, '', '070.png', '', '', 9, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(64, 'johnson.tyree', 'zelma.abernathy@yahoo.com', '$2y$10$XIDnG6lSj06olEtXsDCix.4ghJzng51z2o4h1OFPIyQbYr8WCrYa6', '', '[St] Hollie Harvey', 'student', 6, 2, NULL, 0, 1, '15', '24-748-89', 0, 0, '', 0, NULL, NULL, '1705314291', '4654305', 7, 40, '', NULL, '', '037.png', '', '', 15, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(65, 'lambert48', 'reilly.vicenta@schmidt.info', '$2y$10$uA/RZNI/56jXg4GhawzsfeciupNPGfe3uvRBCfXFFM4ZEmJLbaVLm', '', '[St] Gilbert Franecki', 'student', 6, 4, NULL, 0, 1, '72', '52-147-33', 0, 0, '', 0, NULL, NULL, '8893627226', '4901181', 11, 35, '', NULL, '', '088.png', 'Pro', '', 11, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(66, 'smitham.bryana', 'marshall.gaylord@hotmail.com', '$2y$10$MWk0kLr8YJayjUt6RczCrOprvTsrA/NIxVnAHdzf.qnGq3Hl/XyMK', '', '[St] Prof. Halie Wolff', 'student', 6, 3, NULL, 0, 1, '43', '32-308-68', 0, 0, '', 0, NULL, NULL, '6711480110', '5049016', 7, 6, '', NULL, '', '094.png', 'Advanced one', '', 6, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(67, 'pfannerstill.chet', 'pollich.antonio@schowalter.biz', '$2y$10$bwhlkVMDIXB7onNN/eiBMuYERBr3pFGGB3TIoReBJsNzOzRo9cfym', '', '[St] Prof. Harmony Kshlerin', 'student', 6, 2, NULL, 0, 1, '38', '20-566-30', 0, 0, '', 0, NULL, NULL, '8507080280', '5690740', 11, 35, '', NULL, '', '054.png', '', '', 2, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(68, 'hester.jones', 'phoebe36@miller.com', '$2y$10$hSlBsbKW1ZF7w7eNIM20VuRSGfIbzDphzis.uF/m/lIQGaL0oCNmq', '', '[St] Rachelle Brown MD', 'student', 6, 3, NULL, 0, 1, '14', '45-137-59', 0, 0, '', 0, NULL, NULL, '2002376700', '1508232', 6, 49, '', NULL, '', '052.png', 'Pro', '', 3, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(69, 'schroeder.lisa', 'sweber@gmail.com', '$2y$10$o2//Jzj.412IGMdQKB./TO7e5u1BO3OTanpFLry56f2izKSqvQOTW', '', '[St] Ms. Jaqueline Rippin', 'student', 6, 2, NULL, 0, 1, '20', '60-448-64', 0, 0, '', 0, NULL, NULL, '1578427757', '5587649', 11, 47, '', NULL, '', '050.png', '', '', 3, 10, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(70, 'evan14', 'spredovic@klocko.info', '$2y$10$a1oUtL62lKXitr81Tlqd9u9ON5OZgCDN2rAN3s00Trwz5Mj4VXQAK', '', '[St] Demetrius Haley', 'student', 6, 1, NULL, 0, 1, '78', '38-635-71', 0, 0, '', 0, NULL, NULL, '5702581675', '1959982', 14, 30, '', NULL, '', '055.png', 'Vice Principal', '', 4, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(71, 'rhodkiewicz', 'fkulas@hotmail.com', '$2y$10$x4cGHNLZ9uFf6XTcdchW5ONQklMwIE8Bjg4I5l7ae9QFIwswtJny6', '', '[St] Haven Corkery', 'student', 6, 1, NULL, 0, 1, '32', '89-344-80', 0, 0, '', 0, NULL, NULL, '3223507103', '7440155', 14, 54, '', NULL, '', '018.png', 'Pro', '', 9, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(72, 'pedro50', 'streich.hardy@hotmail.com', '$2y$10$ceH.dUHVAuU5xsqNJHRqreDGdHlEZSx.M6X2cZFFqf6dOSKkmHmOi', '', '[St] Kylee Larkin', 'student', 6, 3, NULL, 0, 1, '87', '94-487-29', 0, 0, '', 0, NULL, NULL, '3931240421', '3822850', 14, 20, '', NULL, '', '062.png', '', '', 8, 3, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(73, 'hbatz', 'pkulas@eichmann.com', '$2y$10$327D88Xax.OKPnk52RoSd..gcCCSXEKeJUOLhx6BnGyUu5wuxq99i', '', '[St] Kaitlyn Tromp', 'student', 6, 1, NULL, 0, 1, '10', '65-993-67', 0, 0, '', 0, NULL, NULL, '2280957438', '5395686', 7, 26, '', NULL, '', '03.png', '', '', 14, 9, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(74, 'cnolan', 'andreane68@spencer.com', '$2y$10$7fT71FBcN/K65kFtyRZyvOinTywF2EXXbDJdcgIV9UudIgH5p9HNu', '', '[St] Paris Dach Sr.', 'student', 6, 3, NULL, 0, 1, '5', '10-118-98', 0, 0, '', 0, NULL, NULL, '4811382164', '9159393', 6, 51, '', NULL, '', '025.png', 'Captain: Yellow House', '', 2, 2, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(75, 'oconner.cecil', 'hegmann.myrtis@hotmail.com', '$2y$10$JCUA4VuL8NDaj./f5CJxbeF9urNU2vx6uEOaKBqDxhkfDkWhWuDT6', '', '[St] Orlando Homenick', 'student', 6, 3, NULL, 0, 1, '58', '27-917-25', 0, 0, '', 0, NULL, NULL, '4706494461', '1793824', 7, 17, '', NULL, '', '035.png', 'Advanced one', '', 12, 6, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(76, 'parent', 'doyle.kelvin@graham.biz', '$2y$10$WxaUb9h6qLWF5fcMl.4VNuHnXL6Wymcd3Gyl5wG8IUfIzdSfKzb3q', '', '[Pa] Reta Dicki', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '5730303206', '4765382', 15, 5, '', NULL, '[{\"student\":\"[St] Prof. Francisco Okuneva MD\",\"relation\":\"father\",\"id\":49}]', '082.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '123456789', '0000-00-00'),
(77, 'leanne.langworth', 'will.ali@anderson.org', '$2y$10$iGmjJoV/3JhoJnylvTiTzu9Xwytad666xicXt3MITm3jGNx0UAzma', '', '[Pa] Jaquan Auer II', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3985549841', '1117946', 5, 7, '', NULL, '[{\"student\":\"[St] Antonio O\'Connell\",\"relation\":\"father\",\"id\":46}]', '025.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(78, 'alberto90', 'ichristiansen@satterfield.com', '$2y$10$YIV8DrPOFLhQ1j2z5h6CpO7Gv/V6ECiAzK9WlLawE/KWNTLsqErgW', '', '[Pa] Bethel Gerlach', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8208224271', '1400839', 6, 45, '', NULL, '[{\"student\":\"[St] Prof. Francisco Okuneva MD\",\"relation\":\"father\",\"id\":49}]', '019.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(79, 'casimir.kuphal', 'abuckridge@gmail.com', '$2y$10$KP3MRSMsyjXgiR1VLUaVZ.COGrez75GlzYPV6uzWUK4AJ.Nh2XFjq', '', '[Pa] Taylor Shields', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2999643438', '2321229', 4, 25, '', NULL, '[{\"student\":\"[St] Hollie Harvey\",\"relation\":\"father\",\"id\":64}]', '064.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(80, 'efren58', 'madie.hamill@hudson.org', '$2y$10$gGmHREFFSPo0dVM.ieCwh.JTjXi6tUYn7qc01YwUCSv8s0NpGVYmC', '', '[Pa] Danika O\'Hara V', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4932251253', '8244707', 15, 52, '', NULL, '[{\"student\":\"[St] Prof. Harmony Kshlerin\",\"relation\":\"father\",\"id\":67}]', '037.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(81, 'genoveva78', 'verona.dubuque@goldner.com', '$2y$10$hBIvozixkBmR7YHBS8Evdu.kuSJJpjGnbmTziKClhsJYfic3WBpgW', '', '[Pa] Florine Hartmann', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1002931267', '5289970', 11, 53, '', NULL, '[{\"student\":\"[St] Antonio O\'Connell\",\"relation\":\"father\",\"id\":46}]', '024.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(82, 'feeney.stefan', 'pauline.stoltenberg@morissette.com', '$2y$10$/ipTZ8LAJgCPGKUu5AklJe80wJTk3yI4cy0V4594L7JxuihY1DoVy', '', '[Pa] Prof. Kirk Koss DDS', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8281312644', '9724302', 4, 13, '', NULL, '[{\"student\":\"[St] Karina Gulgowski DDS\",\"relation\":\"father\",\"id\":57}]', '031.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(83, 'ebarrows', 'willa68@kreiger.com', '$2y$10$jbK8PXwYHzdZXY1mJrx6Eu1yj5R1GZ3v8b2/St/gT7CEUBSk13Isy', '', '[Pa] Lance Mills MD', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '4122698650', '6752725', 3, 29, '', NULL, '[{\"student\":\"[St] Andy Rutherford\",\"relation\":\"father\",\"id\":60}]', '074.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(84, 'elinore75', 'kevin.kiehn@okon.com', '$2y$10$mB.junT8N9rMn7d6/ySpROhAtUrrN9L1BC.hFUekRQGNSkJyz3LXu', '', '[Pa] Mallie Sawayn I', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7535690122', '8487461', 1, 10, '', NULL, '[{\"student\":\"[St] Laurianne Kautzer\",\"relation\":\"father\",\"id\":50}]', '044.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(85, 'jedidiah.wisoky', 'dorothy17@gmail.com', '$2y$10$RJbSPUNVWSRxqgdwc7r8U.teR3SvUfwdu6rTecPJwp0Rdqqcncs5a', '', '[Pa] Miss Kassandra Green', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9210525256', '6710973', 9, 25, '', NULL, '[{\"student\":\"[St] Alice Goyette\",\"relation\":\"father\",\"id\":59}]', '098.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(86, 'hhuels', 'ila.bosco@williamson.com', '$2y$10$/5mlXZ0iNp.dbQf46PBaZe0nMdahXm6koCkzXoteJvNZ2y4AzYOZu', '', '[Pa] Daren Schneider', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1230949531', '8760158', 10, 57, '', NULL, '[{\"student\":\"[St] Kathryn Kub\",\"relation\":\"father\",\"id\":61}]', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(87, 'heaven85', 'martina03@greenfelder.com', '$2y$10$JUJu1PIxFQ8BZJqB/RmHn.QRhKJ0RdxD5lPf5ZJ/XUkgjf8P2zghe', '', '[Pa] Hilma Lowe', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9824975403', '5698161', 5, 51, '', NULL, '[{\"student\":\"[St] Van Wolf\",\"relation\":\"father\",\"id\":63}]', '061.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(88, 'ecummerata', 'niko35@hotmail.com', '$2y$10$He0Wk8ioM5oey8RTO0U03uKl7sJfrEeWQbgXfy2hKC6RML3KzOrxS', '', '[Pa] Steve Witting', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8766363523', '8936194', 13, 5, '', NULL, '[{\"student\":\"[St] Prof. Halie Wolff\",\"relation\":\"father\",\"id\":66}]', '016.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(89, 'obraun', 'qwilliamson@wunsch.com', '$2y$10$X1kxr5HBdC.1FP8hueNrIONhyzfjmV8Od2v8x0vrlItN69qCyLiYe', '', '[Pa] Prof. Clyde Fisher', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '3156472633', '4322354', 5, 36, '', NULL, '[{\"student\":\"[St] Ms. Jaqueline Rippin\",\"relation\":\"father\",\"id\":69}]', '080.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(90, 'zrenner', 'gideon31@gmail.com', '$2y$10$eM0BZZoeBdisRk/H8ND95ed9nx3cStdPPwiFF8WSeNWnUXoOue0zi', '', '[Pa] Santos Rippin', 'parent', 7, 4, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '8492352667', '4572271', 15, 49, '', NULL, '[{\"student\":\"[St] Neil Schulist II\",\"relation\":\"father\",\"id\":52}]', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(91, 'damon.dicki', 'reilly.dejah@gmail.com', '$2y$10$2Q44Y55FJeqCgvUQVVai1uuF62lAnrxjv4kLld/7d0Zv9RqLoTeS2', '', '[Pa] Prof. Marisa Schinner', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '9987671271', '7708097', 6, 20, '', NULL, '[{\"student\":\"[St] Mitchel Dickens\",\"relation\":\"father\",\"id\":48}]', '078.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(92, 'cheaney', 'khahn@yahoo.com', '$2y$10$qTwcYrH8RvLbx4ggW6QCrOMeqy8/c77dzzuTNw6ycDrVsOlT.QS4y', '', '[Pa] Kaley Marvin', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1358389189', '3638598', 4, 49, '', NULL, '[{\"student\":\"[St] Dr. Shawn Weissnat Sr.\",\"relation\":\"father\",\"id\":51}]', '027.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(93, 'quinton.pouros', 'rolfson.gerald@hotmail.com', '$2y$10$Hj6Rd9fKqFXWe/1ekvjHSu39dkiz98BY4SvDOgIf19uzP8sJX5pnq', '', '[Pa] Prof. Alfonso Mertz Jr.', 'parent', 7, 3, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '7136549288', '6796929', 1, 8, '', NULL, '[{\"student\":\"[St] Laurianne Kautzer\",\"relation\":\"father\",\"id\":50}]', '035.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(94, 'neil09', 'halie00@funk.com', '$2y$10$vPXyaKOHPtCqHFHMp5E0SOuVTu5ZETVzNt7Hn80v4iDhBlofZoRxy', '', '[Pa] Annamae Maggio', 'parent', 7, 2, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2584752184', '2335894', 7, 15, '', NULL, '[{\"student\":\"[St] Karina Gulgowski DDS\",\"relation\":\"father\",\"id\":57}]', '081.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(95, 'deshawn.collins', 'kiley.daniel@hotmail.com', '$2y$10$awQLVJFcRx4/nwuB3jInM.8otpiA0uYnbbY2I1IMqe/AyKWuHYxdO', '', '[Pa] Nia Konopelski', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '1760035145', '8876791', 15, 53, '', NULL, '[{\"student\":\"[St] Kathryn Kub\",\"relation\":\"father\",\"id\":61}]', '00.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00'),
(96, 'macie.conroy', 'murphy.jon@hotmail.com', '$2y$10$VfIkPV3E8ACLRn4cAbouO.FU8Yrd8C4f7.jCAM8RVjnra.5o.bzqe', '', '[Pa] Heaven O\'Conner IV', 'parent', 7, 1, NULL, 0, 1, NULL, '', 0, 0, '', 0, NULL, NULL, '2573652348', '8160817', 9, 31, '', NULL, '[{\"student\":\"[St] Andy Rutherford\",\"relation\":\"father\",\"id\":60}]', '057.png', '', '', 0, 0, 0, '', '', 0, '', '', 0, '[\"mail\",\"sms\",\"phone\"]', '', '', 0, '', 1, NULL, '', '', '0000-00-00');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `exams_list`
--
ALTER TABLE `exams_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `messages_list`
--
ALTER TABLE `messages_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
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
