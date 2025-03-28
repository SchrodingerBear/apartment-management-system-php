-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 29, 2025 at 03:28 AM
-- Server version: 10.4.33-MariaDB-log
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ams`
--

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `last_seen_location` text NOT NULL,
  `date` date NOT NULL,
  `grade_level` enum('11','12') NOT NULL,
  `strand` enum('STEM','HUMSS','ABM','HE','ICT','EPAS','SMAW') NOT NULL,
  `section` varchar(100) NOT NULL,
  `item_photo` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Resolved') DEFAULT 'Pending',
  `type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbranch`
--

CREATE TABLE `tblbranch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `b_email` varchar(50) NOT NULL,
  `b_contact_no` int(15) NOT NULL,
  `b_address` varchar(100) NOT NULL,
  `security_guard_mobile` varchar(25) DEFAULT NULL,
  `secrataty_mobile` varchar(25) DEFAULT NULL,
  `moderator_mobile` varchar(25) DEFAULT NULL,
  `building_make_year` varchar(25) DEFAULT NULL,
  `building_image` varchar(250) DEFAULT NULL,
  `b_status` tinyint(4) NOT NULL DEFAULT 1,
  `builder_company_name` varchar(250) DEFAULT NULL,
  `builder_company_phone` varchar(50) DEFAULT NULL,
  `builder_company_address` varchar(1000) DEFAULT NULL,
  `building_rule` text DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblbranch`
--

INSERT INTO `tblbranch` (`branch_id`, `branch_name`, `b_email`, `b_contact_no`, `b_address`, `security_guard_mobile`, `secrataty_mobile`, `moderator_mobile`, `building_make_year`, `building_image`, `b_status`, `builder_company_name`, `builder_company_phone`, `builder_company_address`, `building_rule`, `created_date`) VALUES
(7, 'Main Building', 'mirpur.1@gmail.com', 1717445566, 'F-Block,Mirpur-1,Dhaka-1216', '+880167119889', '+880911909090', '+88090909090', '', 'E9EB1C1F-9D88-0FD8-CE34-92F3421FA31D.jpg', 1, 'Golden Developer Company', '+8850505050', 'Test Address\r\nUK', '<p style=\"text-align:center\"><span style=\"color:#e67e22\"><u><span style=\"font-size:36px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><strong>Love Bird Building Rules</strong></span></span></u></span></p>\r\n\r\n<blockquote>\r\n<p><strong><span style=\"color:#16a085\"><span style=\"font-size:20px\">1) Gate Close 10 PM.</span></span></strong></p>\r\n</blockquote>\r\n\r\n<blockquote>\r\n<p><strong><span style=\"color:#16a085\"><span style=\"font-size:20px\">2) New commer must be intruduce with guard.</span></span></strong></p>\r\n</blockquote>\r\n', '2016-06-22 09:50:30'),
(8, 'Building 2', 'avinash@mail.com', 1212121212, 'Bolgatanga', '+880167119889', '+880911909090', '+88090909090', '9', '6F7882BD-85CD-8D98-EDCA-1FF65F0BFABA.jpg', 1, 'Da-viruz Systems', '+8850505050', 'test address\r\nGhana', '<p style=\"text-align:center\"><span style=\"color:#e67e22\"><u><span style=\"font-size:36px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><strong>Love Bird Building Rules</strong></span></span></u></span></p>\r\n\r\n<blockquote>\r\n<p><strong><span style=\"color:#16a085\"><span style=\"font-size:20px\">1) Gate Close 10 PM.</span></span></strong></p>\r\n</blockquote>\r\n\r\n<blockquote>\r\n<p><strong><span style=\"color:#16a085\"><span style=\"font-size:20px\">2) New commer must be intruduce with guard.</span></span></strong></p>\r\n</blockquote>\r\n', '2016-06-22 10:23:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblsuper_admin`
--

CREATE TABLE `tblsuper_admin` (
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(300) NOT NULL,
  `contact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblsuper_admin`
--

INSERT INTO `tblsuper_admin` (`user_id`, `name`, `email`, `contact`, `password`, `added_date`) VALUES
(1, 'Alexander Pierce', 'superadmin@gmail.com', '+8801679110711', 'c3VwZXJhZG1pbkBnbWFpbC5jb20=', '2015-06-29 06:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_admin`
--

CREATE TABLE `tbl_add_admin` (
  `aid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(250) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_admin`
--

INSERT INTO `tbl_add_admin` (`aid`, `name`, `email`, `contact`, `password`, `image`, `branch_id`, `added_date`) VALUES
(7, 'Tony', 'admin@gmail.com', '+8801679110711', 'YWRtaW5AZ21haWwuY29t', 'B7962E98-0550-407D-01A7-3C088DCCD2EF.jpg', 8, '2019-08-27 04:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_bill`
--

CREATE TABLE `tbl_add_bill` (
  `bill_id` int(11) NOT NULL,
  `bill_type` varchar(200) NOT NULL,
  `bill_date` varchar(200) NOT NULL,
  `bill_month` int(11) NOT NULL,
  `bill_year` int(11) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `deposit_bank_name` varchar(200) NOT NULL,
  `bill_details` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_bill`
--

INSERT INTO `tbl_add_bill` (`bill_id`, `bill_type`, `bill_date`, `bill_month`, `bill_year`, `total_amount`, `deposit_bank_name`, `bill_details`, `branch_id`, `added_date`) VALUES
(14, '4', '27/08/2019', 8, 11, 5000.00, 'DBBL', 'purfect', 8, '2019-08-27 04:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_bill_type`
--

CREATE TABLE `tbl_add_bill_type` (
  `bt_id` int(11) NOT NULL,
  `bill_type` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_bill_type`
--

INSERT INTO `tbl_add_bill_type` (`bt_id`, `bill_type`, `added_date`) VALUES
(1, 'Gas', '2016-05-05 09:49:35'),
(3, 'Water', '2016-05-05 09:50:39'),
(4, 'Electric', '2016-05-05 09:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_builder_info`
--

CREATE TABLE `tbl_add_builder_info` (
  `bldrid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_building_info`
--

CREATE TABLE `tbl_add_building_info` (
  `bldid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `security_guard_mobile` varchar(200) NOT NULL,
  `secrataty_mobile` varchar(200) NOT NULL,
  `moderator_mobile` varchar(200) NOT NULL,
  `building_make_year` varchar(200) NOT NULL,
  `b_name` varchar(200) NOT NULL,
  `b_address` varchar(200) NOT NULL,
  `b_phone` varchar(200) NOT NULL,
  `building_image` varchar(200) NOT NULL,
  `building_rules` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_complain`
--

CREATE TABLE `tbl_add_complain` (
  `complain_id` int(11) NOT NULL,
  `c_title` varchar(200) NOT NULL,
  `c_description` varchar(1000) NOT NULL,
  `c_date` varchar(200) NOT NULL,
  `c_month` varchar(50) NOT NULL,
  `c_year` varchar(50) NOT NULL,
  `c_userid` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `job_status` int(1) NOT NULL DEFAULT 0,
  `assign_employee_id` int(11) DEFAULT 0,
  `solution` varchar(500) NOT NULL,
  `complain_by` varchar(100) DEFAULT NULL,
  `person_name` varchar(250) DEFAULT NULL,
  `person_email` varchar(100) DEFAULT NULL,
  `person_contact` varchar(50) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_complain`
--

INSERT INTO `tbl_add_complain` (`complain_id`, `c_title`, `c_description`, `c_date`, `c_month`, `c_year`, `c_userid`, `branch_id`, `job_status`, `assign_employee_id`, `solution`, `complain_by`, `person_name`, `person_email`, `person_contact`, `added_date`) VALUES
(35, 'Water Problem', 'We need to solve water issue soon.', '27/08/2019', '8', '2019', 0, 8, 0, 12, '', NULL, NULL, NULL, NULL, '2019-08-27 04:38:09'),
(36, 'Flat color issue', 'How flat color condition is really bad kindly solve it.', '28/08/2019', '8', '2019', 20, 8, 0, 0, '', 'tenant', 'Jim Cary', 'jimcary@yahoo.com', '+8801679110711', '2019-08-27 19:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_employee`
--

CREATE TABLE `tbl_add_employee` (
  `eid` int(11) NOT NULL,
  `e_name` varchar(200) NOT NULL,
  `e_email` varchar(200) NOT NULL,
  `e_contact` varchar(200) NOT NULL,
  `e_pre_address` varchar(200) NOT NULL,
  `e_per_address` varchar(200) NOT NULL,
  `e_nid` varchar(200) NOT NULL,
  `e_designation` int(11) NOT NULL,
  `e_date` varchar(200) NOT NULL,
  `ending_date` varchar(200) NOT NULL,
  `e_status` int(1) NOT NULL DEFAULT 0,
  `e_password` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `salary` decimal(15,2) NOT NULL DEFAULT 0.00,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_employee`
--

INSERT INTO `tbl_add_employee` (`eid`, `e_name`, `e_email`, `e_contact`, `e_pre_address`, `e_per_address`, `e_nid`, `e_designation`, `e_date`, `ending_date`, `e_status`, `e_password`, `image`, `branch_id`, `salary`, `added_date`) VALUES
(12, 'John Sina', 'johnsina@gmail.com', '+8801679110711', '799 Princess Drive\r\nNorwood, MA 02062', '799 Princess Drive\r\nNorwood, MA 02062', '343434-909090-1212121', 5, '01/09/2019', '', 1, 'MTIzNDU2', '82F6AE8B-7DF6-E937-6095-101FC0BB66A3.jpg', 8, 8000.00, '2019-08-26 19:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_employee_salary_setup`
--

CREATE TABLE `tbl_add_employee_salary_setup` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(200) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `month_id` int(11) NOT NULL,
  `xyear` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `issue_date` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_employee_salary_setup`
--

INSERT INTO `tbl_add_employee_salary_setup` (`emp_id`, `emp_name`, `designation`, `month_id`, `xyear`, `amount`, `issue_date`, `branch_id`, `added_date`) VALUES
(19, '12', 'Security Gard', 8, 11, 8000.00, '05/09/2019', 8, '2019-08-26 19:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_fair`
--

CREATE TABLE `tbl_add_fair` (
  `f_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `floor_no` varchar(200) NOT NULL,
  `unit_no` varchar(200) NOT NULL,
  `rid` int(11) NOT NULL DEFAULT 0,
  `month_id` int(11) NOT NULL,
  `xyear` varchar(200) NOT NULL,
  `rent` decimal(15,2) NOT NULL DEFAULT 0.00,
  `water_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `electric_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `gas_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `security_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `utility_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `other_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_rent` decimal(15,2) NOT NULL DEFAULT 0.00,
  `issue_date` varchar(200) NOT NULL,
  `paid_date` varchar(25) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `bill_status` tinyint(1) NOT NULL DEFAULT 0,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_fair`
--

INSERT INTO `tbl_add_fair` (`f_id`, `type`, `floor_no`, `unit_no`, `rid`, `month_id`, `xyear`, `rent`, `water_bill`, `electric_bill`, `gas_bill`, `security_bill`, `utility_bill`, `other_bill`, `total_rent`, `issue_date`, `paid_date`, `branch_id`, `bill_status`, `added_date`) VALUES
(43, 'Rented', '12', '30', 20, 8, '2019', 10000.00, 500.00, 1000.00, 975.00, 900.00, 100.00, 0.00, 13475.00, '05/08/2019', '30/08/2019', 8, 1, '2019-08-27 04:29:55'),
(44, 'Rented', '12', '30', 20, 9, '2019', 10000.00, 600.00, 700.00, 800.00, 900.00, 500.00, 0.00, 13500.00, '04/09/2019', '', 8, 0, '2019-08-27 19:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_floor`
--

CREATE TABLE `tbl_add_floor` (
  `fid` int(11) NOT NULL,
  `floor_no` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_floor`
--

INSERT INTO `tbl_add_floor` (`fid`, `floor_no`, `branch_id`, `added_date`) VALUES
(12, 'First Floor', 8, '2019-08-26 18:56:32'),
(13, 'Second Floor', 8, '2019-08-27 04:06:26'),
(14, '1', 7, '2025-03-28 11:08:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_fund`
--

CREATE TABLE `tbl_add_fund` (
  `fund_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `xyear` varchar(200) NOT NULL,
  `f_date` varchar(200) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `purpose` varchar(400) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_fund`
--

INSERT INTO `tbl_add_fund` (`fund_id`, `owner_id`, `month_id`, `xyear`, `f_date`, `total_amount`, `purpose`, `branch_id`, `added_date`) VALUES
(13, 19, 8, '11', '27/08/2019', 200.00, 'Monthly Fund', 8, '2019-08-27 04:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_maintenance_cost`
--

CREATE TABLE `tbl_add_maintenance_cost` (
  `mcid` int(11) NOT NULL,
  `m_title` varchar(200) NOT NULL,
  `m_date` varchar(200) NOT NULL,
  `m_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `m_details` varchar(200) NOT NULL,
  `xmonth` int(11) NOT NULL DEFAULT 0,
  `xyear` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_maintenance_cost`
--

INSERT INTO `tbl_add_maintenance_cost` (`mcid`, `m_title`, `m_date`, `m_amount`, `m_details`, `xmonth`, `xyear`, `branch_id`, `added_date`) VALUES
(7, 'Light', '27/08/2019', 50.00, 'OK', 8, 11, 8, '2019-08-27 04:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_management_committee`
--

CREATE TABLE `tbl_add_management_committee` (
  `mc_id` int(11) NOT NULL,
  `mc_name` varchar(200) NOT NULL,
  `mc_email` varchar(200) NOT NULL,
  `mc_contact` varchar(200) NOT NULL,
  `mc_pre_address` varchar(500) NOT NULL,
  `mc_per_address` varchar(500) NOT NULL,
  `mc_nid` varchar(200) NOT NULL,
  `member_type` varchar(200) NOT NULL,
  `mc_joining_date` varchar(200) NOT NULL,
  `mc_ending_date` varchar(200) NOT NULL,
  `mc_status` int(1) NOT NULL DEFAULT 0,
  `image` varchar(200) NOT NULL,
  `mc_password` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_management_committee`
--

INSERT INTO `tbl_add_management_committee` (`mc_id`, `mc_name`, `mc_email`, `mc_contact`, `mc_pre_address`, `mc_per_address`, `mc_nid`, `member_type`, `mc_joining_date`, `mc_ending_date`, `mc_status`, `image`, `mc_password`, `branch_id`, `added_date`) VALUES
(9, 'Peter Anderson', 'peter@gmail.com', '121212121', '63 Creek St.\r\nEastpointe, MI 48021', '799 Princess Drive\r\nNorwood, MA 02062', '121212-56565-121212-565656', '1', '27/08/2019', '', 1, '4CF8FD9E-9916-0820-1049-6CD5C211B460.jpg', '123456', 8, '2019-08-27 04:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_member_type`
--

CREATE TABLE `tbl_add_member_type` (
  `member_id` int(11) NOT NULL,
  `member_type` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_member_type`
--

INSERT INTO `tbl_add_member_type` (`member_id`, `member_type`, `added_date`) VALUES
(1, 'Moderator', '2016-04-10 11:56:20'),
(2, 'Secretary General', '2016-04-10 11:59:10'),
(3, 'Member', '2016-04-10 11:59:22'),
(4, 'Pion', '2016-04-10 11:59:29'),
(5, 'Security Gard', '2016-04-10 11:59:41'),
(6, 'Caretaker', '2016-04-10 12:00:17'),
(7, 'Maker', '2017-09-16 17:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_month_setup`
--

CREATE TABLE `tbl_add_month_setup` (
  `m_id` int(11) NOT NULL,
  `month_name` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_month_setup`
--

INSERT INTO `tbl_add_month_setup` (`m_id`, `month_name`, `added_date`) VALUES
(1, 'January', '2016-04-11 12:16:15'),
(2, 'February', '2016-04-11 12:16:25'),
(3, 'March', '2016-04-11 12:16:30'),
(4, 'April', '2016-04-11 12:16:36'),
(5, 'May', '2016-04-11 12:16:41'),
(6, 'June', '2016-04-11 12:16:48'),
(7, 'July', '2016-04-11 12:16:53'),
(8, 'August', '2016-04-11 12:16:59'),
(9, 'September', '2016-04-11 12:17:06'),
(10, 'Octobor', '2016-04-11 12:17:14'),
(11, 'November', '2016-04-11 12:17:24'),
(12, 'December', '2016-04-11 12:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_owner`
--

CREATE TABLE `tbl_add_owner` (
  `ownid` int(11) NOT NULL,
  `o_name` varchar(200) NOT NULL,
  `o_email` varchar(200) NOT NULL,
  `o_contact` varchar(200) NOT NULL,
  `o_pre_address` varchar(500) NOT NULL,
  `o_per_address` varchar(500) NOT NULL,
  `o_nid` varchar(200) NOT NULL,
  `o_password` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_owner`
--

INSERT INTO `tbl_add_owner` (`ownid`, `o_name`, `o_email`, `o_contact`, `o_pre_address`, `o_per_address`, `o_nid`, `o_password`, `image`, `branch_id`, `created_date`) VALUES
(19, 'John Peterson', 'john@gmail.com', '+8801679110711', '7790 4th St.\r\nWoodhaven, NY 11421', '8349 Marlborough Dr.\r\nMarlborough, MA 01752', '90909-4343434-1212121', 'MTIzNDU2', 'B616EE89-C1D1-8984-3C2F-2D192CC5699E.png', 8, '2019-08-26 19:02:41'),
(20, 'Owner of Building 2', 'seancvpugosa@gmail.com', '639533180925', 'Address', 'Address', '123', 'c2VhbmN2cHVnb3NhQGdtYWlsLmNvbQ==', '', 7, '2025-03-28 11:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_owner_unit_relation`
--

CREATE TABLE `tbl_add_owner_unit_relation` (
  `owner_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_owner_unit_relation`
--

INSERT INTO `tbl_add_owner_unit_relation` (`owner_id`, `unit_id`) VALUES
(19, 30),
(19, 32),
(20, 34);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_owner_utility`
--

CREATE TABLE `tbl_add_owner_utility` (
  `owner_utility_id` int(11) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `unit_no` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `rent` decimal(15,2) NOT NULL DEFAULT 0.00,
  `water_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `electric_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `gas_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `security_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `utility_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `other_bill` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_rent` decimal(15,2) NOT NULL DEFAULT 0.00,
  `issue_date` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_rent`
--

CREATE TABLE `tbl_add_rent` (
  `rid` int(11) NOT NULL,
  `r_name` varchar(200) NOT NULL,
  `r_email` varchar(200) NOT NULL,
  `r_contact` varchar(200) NOT NULL,
  `r_address` varchar(200) NOT NULL,
  `r_nid` varchar(200) NOT NULL,
  `r_floor_no` varchar(200) NOT NULL,
  `r_unit_no` varchar(200) NOT NULL,
  `r_advance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `r_rent_pm` decimal(15,2) NOT NULL DEFAULT 0.00,
  `r_date` varchar(200) NOT NULL,
  `r_gone_date` varchar(200) DEFAULT NULL,
  `r_password` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `r_status` int(1) NOT NULL DEFAULT 1,
  `r_month` int(11) NOT NULL,
  `r_year` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_rent`
--

INSERT INTO `tbl_add_rent` (`rid`, `r_name`, `r_email`, `r_contact`, `r_address`, `r_nid`, `r_floor_no`, `r_unit_no`, `r_advance`, `r_rent_pm`, `r_date`, `r_gone_date`, `r_password`, `image`, `r_status`, `r_month`, `r_year`, `branch_id`, `added_date`) VALUES
(20, 'Jim Cary', 'jimcary@yahoo.com', '+8801679110711', '63 Creek St.\r\nEastpointe, MI 48021', '232323-565656-212121', '12', '30', 10000.00, 10000.00, '27/08/2019', '', 'MTIzNDU2', 'C7A2F0A4-1DCC-E7F1-8D54-14F507D8CA7E.jpg', 1, 9, 11, 8, '2019-08-26 19:33:04'),
(21, 'Sean', 'seancvpugosa@gmail.com', '639533180925', 'Address', '123', '14', '34', 500.00, 500.00, '28/03/2025', NULL, 'c2VhbmN2cHVnb3NhQGdtYWlsLmNvbQ==', '', 1, 1, 13, 7, '2025-03-28 11:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_unit`
--

CREATE TABLE `tbl_add_unit` (
  `uid` int(11) NOT NULL,
  `floor_no` varchar(200) NOT NULL,
  `unit_no` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_unit`
--

INSERT INTO `tbl_add_unit` (`uid`, `floor_no`, `unit_no`, `branch_id`, `status`, `added_date`) VALUES
(30, '12', 'Flat 1A', 8, 1, '2019-08-26 18:56:56'),
(31, '12', 'Flat 1B', 8, 0, '2019-08-26 18:57:09'),
(32, '13', 'Flat 2A', 8, 0, '2019-08-27 04:07:08'),
(33, '13', 'Flat 2B', 8, 0, '2019-08-27 04:07:35'),
(34, '14', '100', 7, 1, '2025-03-28 11:08:56');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_utility_bill`
--

CREATE TABLE `tbl_add_utility_bill` (
  `utility_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `gas_bill` varchar(200) NOT NULL,
  `security_bill` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_utility_bill`
--

INSERT INTO `tbl_add_utility_bill` (`utility_id`, `branch_id`, `gas_bill`, `security_bill`, `added_date`) VALUES
(5, 7, '850', '800', '2018-05-14 06:31:40'),
(6, 8, '800', '900', '2018-05-19 04:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_year_setup`
--

CREATE TABLE `tbl_add_year_setup` (
  `y_id` int(11) NOT NULL,
  `xyear` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_add_year_setup`
--

INSERT INTO `tbl_add_year_setup` (`y_id`, `xyear`, `added_date`) VALUES
(4, '2012', '2016-04-13 14:02:38'),
(5, '2013', '2016-04-13 14:02:42'),
(6, '2014', '2016-04-13 14:02:47'),
(7, '2015', '2016-04-13 14:02:51'),
(8, '2016', '2016-04-13 14:02:56'),
(9, '2017', '2016-04-13 14:03:04'),
(10, '2018', '2016-04-13 14:03:08'),
(11, '2019', '2016-04-13 14:03:12'),
(12, '2020', '2016-04-13 14:03:17'),
(13, '2021', '2018-04-20 06:12:54'),
(14, '2021', '2018-05-18 14:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currency`
--

CREATE TABLE `tbl_currency` (
  `cid` int(11) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_currency`
--

INSERT INTO `tbl_currency` (`cid`, `symbol`, `name`) VALUES
(1, 'Â£', 'Pound'),
(2, '$', 'Dollar'),
(3, 'â‚¨', 'Rupee'),
(5, 'â‚¦', 'Naira'),
(6, 'â‚¬', 'Euro'),
(7, 'Br', 'Belarussian Ruble'),
(8, 'à§³', 'Taka'),
(9, 'kr', 'Swedish Krona'),
(10, 'â‚±', 'Philippine Peso'),
(11, 'Â¥', 'Yuan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_leave_request`
--

CREATE TABLE `tbl_employee_leave_request` (
  `leave_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `leave_text` varchar(5000) NOT NULL,
  `request_status` varchar(50) NOT NULL DEFAULT 'Pending',
  `request_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_notice`
--

CREATE TABLE `tbl_employee_notice` (
  `notice_id` int(11) NOT NULL,
  `notice_title` varchar(500) NOT NULL,
  `notice_description` text NOT NULL,
  `notice_status` tinyint(4) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_max_power`
--

CREATE TABLE `tbl_max_power` (
  `purchase_code` varchar(150) DEFAULT NULL,
  `website_url` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `installed_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_check_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_max_power`
--

INSERT INTO `tbl_max_power` (`purchase_code`, `website_url`, `email`, `installed_date`, `last_check_date`) VALUES
('0232c2c6-7062-42d2-b2a8-c45b0e744ce6', 'http://mombasahomes.co.ke/', 'carogatuta@gmail.com', '2020-05-23 12:39:11', '2020-05-23 12:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting`
--

CREATE TABLE `tbl_meeting` (
  `meeting_id` int(11) NOT NULL,
  `meeting_title` varchar(300) NOT NULL,
  `meeting_description` text NOT NULL,
  `issue_date` date NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_meeting`
--

INSERT INTO `tbl_meeting` (`meeting_id`, `meeting_title`, `meeting_description`, `issue_date`, `branch_id`) VALUES
(6, 'Water Problem', '<p><strong>We need to solve water problem soon.</strong></p>\r\n', '2019-08-27', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notice_board`
--

CREATE TABLE `tbl_notice_board` (
  `notice_id` int(11) NOT NULL,
  `notice_title` varchar(500) NOT NULL,
  `notice_description` text NOT NULL,
  `notice_status` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_notice_board`
--

INSERT INTO `tbl_notice_board` (`notice_id`, `notice_title`, `notice_description`, `notice_status`, `branch_id`, `created_date`) VALUES
(7, 'Building In and Out', '<p>asasas</p>\r\n', 1, 8, '2019-08-27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification_alert`
--

CREATE TABLE `tbl_notification_alert` (
  `notification_Id` int(11) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` varchar(5000) NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=sms,2=email,3=both',
  `user_details` varchar(5000) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `sent_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_owner_notice_board`
--

CREATE TABLE `tbl_owner_notice_board` (
  `notice_id` int(11) NOT NULL,
  `notice_title` varchar(500) NOT NULL,
  `notice_description` text NOT NULL,
  `notice_status` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `lang_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `currency_seperator` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `currency_position` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `currency_decimal` int(11) NOT NULL DEFAULT 2,
  `mail_protocol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'mail',
  `super_admin_image` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_format` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `smtp_hostname` varchar(250) DEFAULT NULL,
  `smtp_username` varchar(250) DEFAULT NULL,
  `smtp_password` varchar(250) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT NULL,
  `smtp_secure` varchar(10) DEFAULT NULL,
  `cat_username` varchar(50) DEFAULT NULL,
  `cat_password` varchar(100) DEFAULT NULL,
  `cat_apikey` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`lang_code`, `currency`, `currency_seperator`, `currency_position`, `currency_decimal`, `mail_protocol`, `super_admin_image`, `date_format`, `smtp_hostname`, `smtp_username`, `smtp_password`, `smtp_port`, `smtp_secure`, `cat_username`, `cat_password`, `cat_apikey`, `id`) VALUES
('English', 'â‚±', ',', 'left', 2, 'mail', 'CA8D0636-E7DD-542A-8775-7CC2DA9C7739.jpg', NULL, 'smtp.hostinger.com', 'support@tcuregistrarrequest.site', '#228JyiuS', '587', 'tls', 'PhilSMS', 'pass', '870|h05YLghELQ8xSwBYKosPFx3w6svYs4EckHpQvsf9', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visitor`
--

CREATE TABLE `tbl_visitor` (
  `vid` int(11) NOT NULL,
  `issue_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `floor_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `intime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `outtime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xmonth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xyear` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_visitor`
--

INSERT INTO `tbl_visitor` (`vid`, `issue_date`, `name`, `mobile`, `address`, `floor_id`, `unit_id`, `intime`, `outtime`, `xmonth`, `xyear`, `branch_id`, `added_date`) VALUES
(17, '27/08/2019', 'Kalvin Peter', '1212121212', '799 Princess Drive\r\nNorwood, MA 02062', 12, 30, '12:50 PM', '05:50 PM', '8', '2019', 8, '2019-08-27 04:40:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbranch`
--
ALTER TABLE `tblbranch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `tblsuper_admin`
--
ALTER TABLE `tblsuper_admin`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_add_admin`
--
ALTER TABLE `tbl_add_admin`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `tbl_add_bill`
--
ALTER TABLE `tbl_add_bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `tbl_add_bill_type`
--
ALTER TABLE `tbl_add_bill_type`
  ADD PRIMARY KEY (`bt_id`);

--
-- Indexes for table `tbl_add_builder_info`
--
ALTER TABLE `tbl_add_builder_info`
  ADD PRIMARY KEY (`bldrid`);

--
-- Indexes for table `tbl_add_building_info`
--
ALTER TABLE `tbl_add_building_info`
  ADD PRIMARY KEY (`bldid`);

--
-- Indexes for table `tbl_add_complain`
--
ALTER TABLE `tbl_add_complain`
  ADD PRIMARY KEY (`complain_id`);

--
-- Indexes for table `tbl_add_employee`
--
ALTER TABLE `tbl_add_employee`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `tbl_add_employee_salary_setup`
--
ALTER TABLE `tbl_add_employee_salary_setup`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `tbl_add_fair`
--
ALTER TABLE `tbl_add_fair`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `tbl_add_floor`
--
ALTER TABLE `tbl_add_floor`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `tbl_add_fund`
--
ALTER TABLE `tbl_add_fund`
  ADD PRIMARY KEY (`fund_id`);

--
-- Indexes for table `tbl_add_maintenance_cost`
--
ALTER TABLE `tbl_add_maintenance_cost`
  ADD PRIMARY KEY (`mcid`);

--
-- Indexes for table `tbl_add_management_committee`
--
ALTER TABLE `tbl_add_management_committee`
  ADD PRIMARY KEY (`mc_id`);

--
-- Indexes for table `tbl_add_member_type`
--
ALTER TABLE `tbl_add_member_type`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `tbl_add_month_setup`
--
ALTER TABLE `tbl_add_month_setup`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `tbl_add_owner`
--
ALTER TABLE `tbl_add_owner`
  ADD PRIMARY KEY (`ownid`);

--
-- Indexes for table `tbl_add_owner_unit_relation`
--
ALTER TABLE `tbl_add_owner_unit_relation`
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `tbl_add_owner_utility`
--
ALTER TABLE `tbl_add_owner_utility`
  ADD PRIMARY KEY (`owner_utility_id`);

--
-- Indexes for table `tbl_add_rent`
--
ALTER TABLE `tbl_add_rent`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `tbl_add_unit`
--
ALTER TABLE `tbl_add_unit`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `tbl_add_utility_bill`
--
ALTER TABLE `tbl_add_utility_bill`
  ADD PRIMARY KEY (`utility_id`);

--
-- Indexes for table `tbl_add_year_setup`
--
ALTER TABLE `tbl_add_year_setup`
  ADD PRIMARY KEY (`y_id`);

--
-- Indexes for table `tbl_currency`
--
ALTER TABLE `tbl_currency`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_employee_leave_request`
--
ALTER TABLE `tbl_employee_leave_request`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `tbl_employee_notice`
--
ALTER TABLE `tbl_employee_notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `tbl_meeting`
--
ALTER TABLE `tbl_meeting`
  ADD PRIMARY KEY (`meeting_id`);

--
-- Indexes for table `tbl_notice_board`
--
ALTER TABLE `tbl_notice_board`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `tbl_notification_alert`
--
ALTER TABLE `tbl_notification_alert`
  ADD PRIMARY KEY (`notification_Id`);

--
-- Indexes for table `tbl_owner_notice_board`
--
ALTER TABLE `tbl_owner_notice_board`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_visitor`
--
ALTER TABLE `tbl_visitor`
  ADD PRIMARY KEY (`vid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbranch`
--
ALTER TABLE `tblbranch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblsuper_admin`
--
ALTER TABLE `tblsuper_admin`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_add_admin`
--
ALTER TABLE `tbl_add_admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_add_bill`
--
ALTER TABLE `tbl_add_bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_add_bill_type`
--
ALTER TABLE `tbl_add_bill_type`
  MODIFY `bt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_add_builder_info`
--
ALTER TABLE `tbl_add_builder_info`
  MODIFY `bldrid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_add_building_info`
--
ALTER TABLE `tbl_add_building_info`
  MODIFY `bldid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_add_complain`
--
ALTER TABLE `tbl_add_complain`
  MODIFY `complain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_add_employee`
--
ALTER TABLE `tbl_add_employee`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_add_employee_salary_setup`
--
ALTER TABLE `tbl_add_employee_salary_setup`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_add_fair`
--
ALTER TABLE `tbl_add_fair`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_add_floor`
--
ALTER TABLE `tbl_add_floor`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_add_fund`
--
ALTER TABLE `tbl_add_fund`
  MODIFY `fund_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_add_maintenance_cost`
--
ALTER TABLE `tbl_add_maintenance_cost`
  MODIFY `mcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_add_management_committee`
--
ALTER TABLE `tbl_add_management_committee`
  MODIFY `mc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_add_member_type`
--
ALTER TABLE `tbl_add_member_type`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_add_month_setup`
--
ALTER TABLE `tbl_add_month_setup`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_add_owner`
--
ALTER TABLE `tbl_add_owner`
  MODIFY `ownid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_add_owner_utility`
--
ALTER TABLE `tbl_add_owner_utility`
  MODIFY `owner_utility_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_add_rent`
--
ALTER TABLE `tbl_add_rent`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_add_unit`
--
ALTER TABLE `tbl_add_unit`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_add_utility_bill`
--
ALTER TABLE `tbl_add_utility_bill`
  MODIFY `utility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_add_year_setup`
--
ALTER TABLE `tbl_add_year_setup`
  MODIFY `y_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_currency`
--
ALTER TABLE `tbl_currency`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_employee_leave_request`
--
ALTER TABLE `tbl_employee_leave_request`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_employee_notice`
--
ALTER TABLE `tbl_employee_notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_meeting`
--
ALTER TABLE `tbl_meeting`
  MODIFY `meeting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_notice_board`
--
ALTER TABLE `tbl_notice_board`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_notification_alert`
--
ALTER TABLE `tbl_notification_alert`
  MODIFY `notification_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_owner_notice_board`
--
ALTER TABLE `tbl_owner_notice_board`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_visitor`
--
ALTER TABLE `tbl_visitor`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
