-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2021 at 05:18 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `absent_reason`
--

CREATE TABLE `absent_reason` (
  `Ab_id` int(11) NOT NULL,
  `S_id` int(11) NOT NULL,
  `A_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `Reason` varchar(30) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absent_reason`
--

INSERT INTO `absent_reason` (`Ab_id`, `S_id`, `A_id`, `c_id`, `sem`, `Reason`, `Date`) VALUES
(6, 1005, 1236, 8, 's6', 'testing', '2021-07-09'),
(7, 1004, 1235, 8, 's6', 'Okkk', '2021-09-09'),
(8, 1003, 1, 8, 's6', 'Okkk', '2021-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `assign_class`
--

CREATE TABLE `assign_class` (
  `As_id` int(11) NOT NULL,
  `C_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assign_class`
--

INSERT INTO `assign_class` (`As_id`, `C_id`, `t_id`, `Date`) VALUES
(1, 123, 1234, '0000-00-00'),
(2, 123, 2345, '0000-00-00'),
(3, 2, 8, '2021-08-04'),
(4, 1, 11, '2021-08-04'),
(5, 7, 9, '2021-08-09'),
(6, 1, 8, '2021-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE `attendence` (
  `A_id` int(11) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `c_id` int(11) NOT NULL,
  `S_id` int(11) NOT NULL,
  `T_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Attendence` varchar(30) NOT NULL,
  `H1` varchar(30) NOT NULL,
  `H2` varchar(30) NOT NULL,
  `H3` varchar(30) NOT NULL,
  `H4` varchar(30) NOT NULL,
  `H5` varchar(30) NOT NULL,
  `Status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendence`
--

INSERT INTO `attendence` (`A_id`, `sem`, `c_id`, `S_id`, `T_id`, `Date`, `Attendence`, `H1`, `H2`, `H3`, `H4`, `H5`, `Status`) VALUES
(1, 's6', 8, 1003, 1, '2021-07-01', 'PRESENT', 'A', 'P', 'P', 'P', 'P', '5'),
(1235, 's6', 8, 1004, 11, '2021-07-01', '2nd Hour  Present', 'A', 'P', 'A', 'P', 'P', '2'),
(1236, 's6', 8, 1005, 11, '2021-07-01', '5th Hour Present', 'A', 'P', 'A', 'P', 'P', '5');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add absent reason', 7, 'add_absentreason'),
(26, 'Can change absent reason', 7, 'change_absentreason'),
(27, 'Can delete absent reason', 7, 'delete_absentreason'),
(28, 'Can view absent reason', 7, 'view_absentreason'),
(29, 'Can add assign class', 8, 'add_assignclass'),
(30, 'Can change assign class', 8, 'change_assignclass'),
(31, 'Can delete assign class', 8, 'delete_assignclass'),
(32, 'Can view assign class', 8, 'view_assignclass'),
(33, 'Can add attendence', 9, 'add_attendence'),
(34, 'Can change attendence', 9, 'change_attendence'),
(35, 'Can delete attendence', 9, 'delete_attendence'),
(36, 'Can view attendence', 9, 'view_attendence'),
(37, 'Can add class', 10, 'add_class'),
(38, 'Can change class', 10, 'change_class'),
(39, 'Can delete class', 10, 'delete_class'),
(40, 'Can view class', 10, 'view_class'),
(41, 'Can add dept info', 11, 'add_deptinfo'),
(42, 'Can change dept info', 11, 'change_deptinfo'),
(43, 'Can delete dept info', 11, 'delete_deptinfo'),
(44, 'Can view dept info', 11, 'view_deptinfo'),
(45, 'Can add hod', 12, 'add_hod'),
(46, 'Can change hod', 12, 'change_hod'),
(47, 'Can delete hod', 12, 'delete_hod'),
(48, 'Can view hod', 12, 'view_hod'),
(49, 'Can add login', 13, 'add_login'),
(50, 'Can change login', 13, 'change_login'),
(51, 'Can delete login', 13, 'delete_login'),
(52, 'Can view login', 13, 'view_login'),
(53, 'Can add student', 14, 'add_student'),
(54, 'Can change student', 14, 'change_student'),
(55, 'Can delete student', 14, 'delete_student'),
(56, 'Can view student', 14, 'view_student'),
(57, 'Can add study materials', 15, 'add_studymaterials'),
(58, 'Can change study materials', 15, 'change_studymaterials'),
(59, 'Can delete study materials', 15, 'delete_studymaterials'),
(60, 'Can view study materials', 15, 'view_studymaterials'),
(61, 'Can add teacher', 16, 'add_teacher'),
(62, 'Can change teacher', 16, 'change_teacher'),
(63, 'Can delete teacher', 16, 'delete_teacher'),
(64, 'Can view teacher', 16, 'view_teacher');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `C_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `Dept` varchar(30) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `Course` varchar(30) NOT NULL,
  `Sem` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`C_id`, `t_id`, `Dept`, `Type`, `Course`, `Sem`) VALUES
(1, 0, 'cs', 'pg', 'mca', 's1'),
(2, 0, 'cs', 'pg', 'msc', 's1'),
(3, 0, 'cs', 'pg', 'msc', 's2'),
(5, 0, 'cs', 'ug', 'bsc cs', 's2'),
(6, 0, 'cs', 'ug', 'bca', 's3'),
(7, 0, 'cs', 'ug', 'bca', 's2'),
(8, 0, 'cs', 'pg', 'mca', 's5'),
(9, 1, 'CS', 'pg', 'MCA', '0'),
(10, 1, 'CS', 'ug', 'BCA', 's1');

-- --------------------------------------------------------

--
-- Table structure for table `dept_info`
--

CREATE TABLE `dept_info` (
  `D_id` int(11) NOT NULL,
  `H_id` int(11) NOT NULL,
  `dep` varchar(30) NOT NULL,
  `Info` varchar(30) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept_info`
--

INSERT INTO `dept_info` (`D_id`, `H_id`, `dep`, `Info`, `Date`) VALUES
(1, 1, 'cs', 'hsxaaaaaaaasss', '0000-00-00'),
(2, 1, 'it', 'hi', '2021-08-05'),
(3, 1, 'nn', 'hi students', '2021-08-03'),
(4, 1, 'cs', 'hi guys', '2021-08-09'),
(5, 1, 'cs', 'hi', '2021-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'absen_reason', 'absentreason'),
(1, 'admin', 'logentry'),
(8, 'assign_class', 'assignclass'),
(9, 'attendance', 'attendence'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'class_reg', 'class'),
(5, 'contenttypes', 'contenttype'),
(11, 'department', 'deptinfo'),
(12, 'hod', 'hod'),
(13, 'login', 'login'),
(6, 'sessions', 'session'),
(14, 'student', 'student'),
(15, 'study_material', 'studymaterials'),
(16, 'teacher', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'absen_reason', '0001_initial', '2021-07-24 06:30:35.308869'),
(2, 'absen_reason', '0002_alter_absentreason_table', '2021-07-24 06:30:35.326388'),
(3, 'contenttypes', '0001_initial', '2021-07-24 06:30:35.373445'),
(4, 'auth', '0001_initial', '2021-07-24 06:30:35.992662'),
(5, 'admin', '0001_initial', '2021-07-24 06:30:36.142874'),
(6, 'admin', '0002_logentry_remove_auto_add', '2021-07-24 06:30:36.153236'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-24 06:30:36.162197'),
(8, 'assign_class', '0001_initial', '2021-07-24 06:30:36.192624'),
(9, 'assign_class', '0002_alter_assignclass_table', '2021-07-24 06:30:36.206986'),
(10, 'attendance', '0001_initial', '2021-07-24 06:30:36.247320'),
(11, 'contenttypes', '0002_remove_content_type_name', '2021-07-24 06:30:36.332350'),
(12, 'auth', '0002_alter_permission_name_max_length', '2021-07-24 06:30:36.396330'),
(13, 'auth', '0003_alter_user_email_max_length', '2021-07-24 06:30:36.423474'),
(14, 'auth', '0004_alter_user_username_opts', '2021-07-24 06:30:36.436699'),
(15, 'auth', '0005_alter_user_last_login_null', '2021-07-24 06:30:36.509619'),
(16, 'auth', '0006_require_contenttypes_0002', '2021-07-24 06:30:36.514857'),
(17, 'auth', '0007_alter_validators_add_error_messages', '2021-07-24 06:30:36.526823'),
(18, 'auth', '0008_alter_user_username_max_length', '2021-07-24 06:30:36.547495'),
(19, 'auth', '0009_alter_user_last_name_max_length', '2021-07-24 06:30:36.570342'),
(20, 'auth', '0010_alter_group_name_max_length', '2021-07-24 06:30:36.593627'),
(21, 'auth', '0011_update_proxy_permissions', '2021-07-24 06:30:36.606478'),
(22, 'auth', '0012_alter_user_first_name_max_length', '2021-07-24 06:30:36.632750'),
(23, 'class_reg', '0001_initial', '2021-07-24 06:30:36.670248'),
(24, 'department', '0001_initial', '2021-07-24 06:30:36.702866'),
(25, 'department', '0002_alter_deptinfo_table', '2021-07-24 06:30:36.719051'),
(26, 'hod', '0001_initial', '2021-07-24 06:30:36.758557'),
(27, 'login', '0001_initial', '2021-07-24 06:30:36.793283'),
(28, 'sessions', '0001_initial', '2021-07-24 06:30:36.839315'),
(29, 'student', '0001_initial', '2021-07-24 06:30:36.846583'),
(30, 'student', '0002_alter_student_options', '2021-07-24 06:30:36.854679'),
(31, 'study_material', '0001_initial', '2021-07-24 06:30:36.904598'),
(32, 'study_material', '0002_alter_studymaterials_table', '2021-07-24 06:30:36.920023'),
(33, 'teacher', '0001_initial', '2021-07-24 06:30:36.957158');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('64yrbtkycf1sz85m1xient9ekzrfsnf5', 'eyJ1aWQiOiIxMSJ9:1mNVIN:IecTBBXYhUaiMxgef3x3L2CaCtViMtcc-klT9JGPdVY', '2021-09-21 07:13:27.067335'),
('71q0b5pdndb9nmnxumv5sw295gv5zm67', 'eyJ1aWQiOiIyIn0:1mQVoi:u1I1N6ctcWFxJY_RjeMfbCdwlobjBlbDCaGquS8XK2E', '2021-09-29 14:23:16.037200'),
('r2jm9htwxjz3cymc3cb8qrjf2s3pwnj8', 'eyJ1aWQiOiIzIn0:1mGESW:h2BlDBECOusMI8FBBnenUnHcXi_1uqY-25pO-73UQs8', '2021-09-01 05:49:52.654242'),
('v79et2zgjjzwpg4xzu7ys7izfmwwqqsu', 'eyJ1aWQiOiIyIiwic2VtIjoiczMiLCJjbyI6IjEifQ:1mQ5dB:woioOvT_AqA-MfFu_Y_TATBx1r-iyCXL48_9ftZ4gw4', '2021-09-28 10:25:37.689630');

-- --------------------------------------------------------

--
-- Table structure for table `hod`
--

CREATE TABLE `hod` (
  `h_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `dept` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hod`
--

INSERT INTO `hod` (`h_id`, `name`, `address`, `dept`, `phone`, `email`, `password`) VALUES
(1, 'ut', 'jjh', 'cs', '9879787', 'ut@gmail.com', 'jjjj'),
(2, 'Name 1', 'calicut', 'cs', '2375872', 'u@gmail.com', 'eeee'),
(3, 'jisha', 'pkara', 'cs', '000000', 'jishakumar458@gmail.com', 'jisha');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `L_id` int(11) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `u_id` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`L_id`, `Type`, `u_id`, `username`, `password`) VALUES
(1, 'hod', '2', 'h', 'h'),
(2, 'teacher', '11', 'j', 'j'),
(3, 'teacher', '12', 'beena7anil7@gmail.com', 'bbbb'),
(6, 'hod', '3', 'jisha@gmail.com', 'jisha'),
(7, 'teacher', '13', 'u@gmail.com', 'jjj'),
(8, 'student', '6', 'ut@gmail.com', 'eeee'),
(9, 'student', '1002', 'u@gmail.com', 'yyyy'),
(10, 'student', '1003', 's', 's'),
(11, 'student', '1004', 'ut@gmail.com', 'iiiii'),
(12, 'student', '1005', 'beena7anil7@gmail.com', 's'),
(13, 'student', '1006', 'jishakumar458@gmail.com', 'j'),
(14, 'teacher', '14', 'u@gmail.com', 'j');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `s_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phn` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`s_id`, `c_id`, `sem`, `name`, `email`, `phn`, `address`) VALUES
(1, 2, 's2', 'hari', 'u@gmail.com', '2375872', 'calicut'),
(2, 2, 's2', 'Shebin k s', 'shebi@gmail.com', '77453466', 'Velangaloor'),
(8, 1, 's2', 'ut', 'ut@gmail.com', '9879787', 'jjh'),
(1001, 6, 's5', 'kfdks', 'ut@gmail.com', '3453464', 'fsdg'),
(1003, 6, 's1', 'lakshmi', 'l@gmail.com', '2423435', 'tsr'),
(1004, 8, 's2', 'akshay', 'ut@gmail.com', '98753567', 'thalikulam'),
(1005, 1, 's3', 'Shebin k s', 'beena7anil7@gmail.com', '87986875', 'thrissur'),
(1006, 2, 's1', 'hkj', 'jishakumar458@gmail.com', '2375872', 'tsr');

-- --------------------------------------------------------

--
-- Table structure for table `study_materials`
--

CREATE TABLE `study_materials` (
  `Sm_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `sem` varchar(30) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `file` varchar(30) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `study_materials`
--

INSERT INTO `study_materials` (`Sm_id`, `t_id`, `sem`, `subject`, `file`, `Date`) VALUES
(1, 10, 's3', 'ds', 'project tables.docx', '0000-00-00'),
(2, 12, 's2', 'coa', 'KKK.pptx', '2021-08-03'),
(3, 9, 's1', 'dm', 'readme.txt', '2021-08-04'),
(4, 11, 's4', 'S', 'JishaResume.pdf', '2021-09-07'),
(5, 11, 's2', 'ds', 'KKK.pptx', '2021-09-06');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `t_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Dept` varchar(30) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`t_id`, `h_id`, `Name`, `Address`, `Dept`, `Phone`, `Email`, `password`) VALUES
(8, 1, 'rahul k', 'thrissur', '', '99887766', 'rahul@gmail.com', 'tttt'),
(9, 1, 'Archa', 'calicut', 'it', '55597697', 'archa@gmail.com', 'asasas'),
(10, 1, 'Abu', 'calicut', 'cs', '32312872', 'abu@gmail.com', 'ewewew'),
(11, 1, 'naiju', 'malapuram', 'cs', '98886655', 'jishakumar458@gmail.com', 'hiii'),
(12, 1, 'beena', 'kodappully', 'english', '989898', 'beena7anil7@gmail.com', 'bbbb'),
(13, 1, 'Name 1wqe', 'calicut', 'cs', '2375872', 'u@gmail.com', 'jjj'),
(14, 1, 'Name 1wqe', 'calicut', 'cs', '2375872', 'u@gmail.com', 'j');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absent_reason`
--
ALTER TABLE `absent_reason`
  ADD PRIMARY KEY (`Ab_id`);

--
-- Indexes for table `assign_class`
--
ALTER TABLE `assign_class`
  ADD PRIMARY KEY (`As_id`);

--
-- Indexes for table `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`A_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`C_id`);

--
-- Indexes for table `dept_info`
--
ALTER TABLE `dept_info`
  ADD PRIMARY KEY (`D_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `hod`
--
ALTER TABLE `hod`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`L_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `study_materials`
--
ALTER TABLE `study_materials`
  ADD PRIMARY KEY (`Sm_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absent_reason`
--
ALTER TABLE `absent_reason`
  MODIFY `Ab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `assign_class`
--
ALTER TABLE `assign_class`
  MODIFY `As_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attendence`
--
ALTER TABLE `attendence`
  MODIFY `A_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1237;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `C_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dept_info`
--
ALTER TABLE `dept_info`
  MODIFY `D_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `hod`
--
ALTER TABLE `hod`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `L_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

--
-- AUTO_INCREMENT for table `study_materials`
--
ALTER TABLE `study_materials`
  MODIFY `Sm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
