-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 24, 2024 at 07:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `approve`
--

CREATE TABLE `approve` (
  `id` int(11) NOT NULL,
  `leave_status` varchar(15) NOT NULL,
  `days_approved` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approve`
--

INSERT INTO `approve` (`id`, `leave_status`, `days_approved`, `created_at`, `updated_at`) VALUES
(1, 'Not Approved', 5, '2024-04-19 07:16:40', '2024-04-23 14:04:07'),
(2, 'Approved', 3, '2024-04-19 07:16:40', '2024-04-19 07:16:40'),
(3, 'Approved', 7, '2024-04-19 07:16:40', '2024-04-19 07:16:40'),
(4, 'Not Approved', 2, '2024-04-19 07:16:40', '2024-04-23 14:05:02'),
(5, 'Approved', 4, '2024-04-19 07:16:40', '2024-04-19 07:16:40'),
(6, 'Not Approved', 10, '2024-04-19 07:16:40', '2024-04-23 14:05:12'),
(7, 'Approved', 6, '2024-04-19 07:16:40', '2024-04-19 07:16:40'),
(8, 'Pending', 8, '2024-04-19 07:16:40', '2024-04-23 14:05:27'),
(9, 'Approved', 1, '2024-04-19 07:16:40', '2024-04-19 07:16:40'),
(10, 'Pending', 9, '2024-04-19 07:16:40', '2024-04-23 14:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `disapprove`
--

CREATE TABLE `disapprove` (
  `id` int(11) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `leave_status` varchar(25) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disapprove`
--

INSERT INTO `disapprove` (`id`, `emp_id`, `leave_status`, `comment`, `created_on`, `updated_on`) VALUES
(1, 101, 'Rejected', 'Insufficient leave balance.', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(2, 102, 'Rejected', 'Leave dates conflict with project deadline.', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(3, 103, 'Rejected', 'Leave request not submitted within required timefr', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(4, 104, 'Rejected', 'Leave duration exceeds maximum allowed.', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(5, 105, 'Rejected', 'Critical project in progress during leave period.', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(6, 106, 'Rejected', 'Medical certificate required for sick leave.', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(7, 107, 'Rejected', 'Leave request not approved by department head.', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(8, 108, 'Rejected', 'Leave application incomplete.', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(9, 109, 'Rejected', 'Leave duration exceeds maximum allowed.', '2024-04-19 08:16:40', '2024-04-19 08:16:40'),
(10, 110, 'Rejected', 'Leave request not submitted within required timefr', '2024-04-19 08:16:40', '2024-04-19 08:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept` varchar(25) NOT NULL,
  `cadre` varchar(25) NOT NULL,
  `emp_date` date NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `emp_id`, `name`, `dept`, `cadre`, `emp_date`, `dob`, `email`, `created_on`, `updated_on`, `salary`) VALUES
(1, '001', 'John Doe', 'HR', 'Manager', '2020-01-15', '1985-05-10', 'john.doe@example.com', '2024-04-19 08:11:51', '2024-04-22 08:42:21', NULL),
(2, '002', 'Jane Smith', 'IT', 'Developer', '2019-07-20', '1990-09-18', 'jane.smith@example.com', '2024-04-19 08:11:51', '2024-04-22 08:42:30', NULL),
(3, '003', 'Alice Johnson', 'Marketing', 'Coordinator', '2021-03-05', '1988-11-25', 'alice.johnson@example.com', '2024-04-19 08:11:51', '2024-04-22 08:42:39', NULL),
(4, '004', 'Bob Brown', 'Finance', 'Accountant', '2018-11-12', '1980-07-15', 'bob.brown@example.com', '2024-04-19 08:11:51', '2024-04-22 08:42:51', NULL),
(5, '005', 'Emily Davis', 'Operations', 'Supervisor', '2020-05-28', '1995-03-03', 'emily.davis@example.com', '2024-04-19 08:11:51', '2024-04-22 08:43:00', NULL),
(6, '006', 'Michael Wilson', 'Sales', 'Executive', '2017-09-10', '1983-12-20', 'michael.wilson@example.com', '2024-04-19 08:11:51', '2024-04-22 08:43:09', NULL),
(7, '007', 'Emma Martinez', 'Customer Service', 'Representative', '2019-02-17', '1992-06-08', 'emma.martinez@example.com', '2024-04-19 08:11:51', '2024-04-22 08:43:18', NULL),
(8, '008', 'William Jones', 'Engineering', 'Engineer', '2022-06-30', '1987-04-12', 'william.jones@example.com', '2024-04-19 08:11:51', '2024-04-22 08:43:29', NULL),
(9, '009', 'Olivia Taylor', 'Research', 'Analyst', '2020-10-05', '1993-08-30', 'olivia.taylor@example.com', '2024-04-19 08:11:51', '2024-04-22 08:43:38', NULL),
(10, '010', 'Daniel Anderson', 'Administration', 'Assistant', '2016-04-22', '1982-01-28', 'daniel.anderson@example.com', '2024-04-19 08:11:51', '2024-04-22 08:43:50', NULL),
(11, '011', 'Muhammed Dauda', 'Marketing', 'Engineer', '2022-12-11', '2000-02-06', 'muhammeddauda@gmail.com', '2024-04-22 09:49:49', '2024-04-22 09:49:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
  `id` int(11) NOT NULL,
  `leave_start_date` date NOT NULL,
  `leave_end_date` date NOT NULL,
  `emp_id` int(10) NOT NULL,
  `emp_name` varchar(25) NOT NULL,
  `no_of_days` int(10) NOT NULL,
  `leave_type` varchar(40) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_application`
--

INSERT INTO `leave_application` (`id`, `leave_start_date`, `leave_end_date`, `emp_id`, `emp_name`, `no_of_days`, `leave_type`, `created_on`, `updated_on`) VALUES
(1, '2024-04-20', '2024-04-25', 101, 'John Doe', 6, 'Vacation', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(2, '2024-04-21', '2024-04-23', 102, 'Jane Smith', 3, 'Sick Leave', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(3, '2024-04-22', '2024-04-24', 103, 'Alice Johnson', 3, 'Personal', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(4, '2024-04-23', '2024-04-26', 104, 'Bob Brown', 4, 'Vacation', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(5, '2024-04-24', '2024-04-28', 105, 'Emily Davis', 5, 'Maternity', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(6, '2024-04-25', '2024-04-26', 106, 'Michael Wilson', 2, 'Sick Leave', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(7, '2024-04-26', '2024-04-27', 107, 'Emma Martinez', 2, 'Personal', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(8, '2024-04-27', '2024-04-30', 108, 'William Jones', 4, 'Vacation', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(9, '2024-04-28', '2024-05-02', 109, 'Olivia Taylor', 5, 'Maternity', '2024-04-19 08:00:07', '2024-04-19 08:00:07'),
(10, '2024-04-29', '2024-04-30', 110, 'Daniel Anderson', 2, 'Sick Leave', '2024-04-19 08:00:07', '2024-04-19 08:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `leave_history`
--

CREATE TABLE `leave_history` (
  `id` int(11) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `emp_name` varchar(25) NOT NULL,
  `leave_taken` int(10) NOT NULL,
  `leave_balance` int(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_history`
--

INSERT INTO `leave_history` (`id`, `emp_id`, `emp_name`, `leave_taken`, `leave_balance`, `date`) VALUES
(1, 101, 'John Doe', 5, 20, '2024-04-19'),
(2, 102, 'Jane Smith', 4, 25, '2024-04-18'),
(3, 103, 'Alice Johnson', 6, 18, '2024-04-17'),
(4, 104, 'Bob Brown', 3, 22, '2024-04-16'),
(5, 105, 'Emily Davis', 7, 15, '2024-04-15'),
(6, 106, 'Michael Wilson', 2, 28, '2024-04-14'),
(7, 107, 'Emma Martinez', 8, 12, '2024-04-13'),
(8, 108, 'William Jones', 1, 30, '2024-04-12'),
(9, 109, 'Olivia Taylor', 9, 10, '2024-04-11'),
(10, 110, 'Daniel Anderson', 0, 30, '2024-04-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approve`
--
ALTER TABLE `approve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disapprove`
--
ALTER TABLE `disapprove`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_history`
--
ALTER TABLE `leave_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approve`
--
ALTER TABLE `approve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `disapprove`
--
ALTER TABLE `disapprove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `leave_history`
--
ALTER TABLE `leave_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
