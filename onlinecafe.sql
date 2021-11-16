-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2021 at 06:48 AM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `Name` varchar(25) NOT NULL,
  `UserName` varchar(15) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Designation` varchar(20) NOT NULL,
  PRIMARY KEY (`UserName`),
  UNIQUE KEY `Password` (`Password`),
  KEY `Designation` (`Designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`Name`, `UserName`, `Password`, `Designation`) VALUES
('Imran Daud', 'MID@89PK', 'Tree456', 'Head Admin');

-- --------------------------------------------------------

--
-- Table structure for table `admin_attendance`
--

DROP TABLE IF EXISTS `admin_attendance`;
CREATE TABLE IF NOT EXISTS `admin_attendance` (
  `Admin` varchar(15) NOT NULL,
  `Date` date NOT NULL,
  `Status` enum('P','A') NOT NULL,
  PRIMARY KEY (`Admin`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_designations`
--

DROP TABLE IF EXISTS `admin_designations`;
CREATE TABLE IF NOT EXISTS `admin_designations` (
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_designations`
--

INSERT INTO `admin_designations` (`Name`) VALUES
('Account Admin'),
('Head Admin');

-- --------------------------------------------------------

--
-- Table structure for table `admin_logins`
--

DROP TABLE IF EXISTS `admin_logins`;
CREATE TABLE IF NOT EXISTS `admin_logins` (
  `Admin` varchar(15) NOT NULL,
  `Date` date NOT NULL,
  `Login_Time` time NOT NULL,
  `LogOut_Time` time NOT NULL,
  PRIMARY KEY (`Admin`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_logins`
--

INSERT INTO `admin_logins` (`Admin`, `Date`, `Login_Time`, `LogOut_Time`) VALUES
('MID@89PK', '2021-10-27', '08:39:34', '18:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `student_accounts`
--

DROP TABLE IF EXISTS `student_accounts`;
CREATE TABLE IF NOT EXISTS `student_accounts` (
  `Name` varchar(25) NOT NULL,
  `Reg_No` varchar(11) NOT NULL,
  `Section` varchar(2) NOT NULL,
  `Pin` int NOT NULL,
  `ImageLoc` varchar(50) NOT NULL,
  `Balance` int NOT NULL,
  `Gender` enum('M','F','O') NOT NULL,
  PRIMARY KEY (`Reg_No`),
  UNIQUE KEY `Pin` (`Pin`),
  UNIQUE KEY `ImageLoc` (`ImageLoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student_accounts`
--

INSERT INTO `student_accounts` (`Name`, `Reg_No`, `Section`, `Pin`, `ImageLoc`, `Balance`, `Gender`) VALUES
('Juniad Abbas', 'F19BCSE136', '5C', 1234, 'E:\\\\Electoral Voting\\\\Voter Images\\\\F19BCSE136.jpe', -2000, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `student_deposits`
--

DROP TABLE IF EXISTS `student_deposits`;
CREATE TABLE IF NOT EXISTS `student_deposits` (
  `Student` varchar(10) NOT NULL,
  `Date` date NOT NULL,
  `Deposit_Time` time NOT NULL,
  `Amount` int NOT NULL,
  `into_bill` enum('Y','N') DEFAULT NULL,
  `Ongoing_Session` varchar(9) NOT NULL,
  PRIMARY KEY (`Student`,`Date`,`Deposit_Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`Designation`) REFERENCES `admin_designations` (`Name`);

--
-- Constraints for table `admin_attendance`
--
ALTER TABLE `admin_attendance`
  ADD CONSTRAINT `admin_attendance_ibfk_1` FOREIGN KEY (`Admin`) REFERENCES `admins` (`UserName`);

--
-- Constraints for table `admin_logins`
--
ALTER TABLE `admin_logins`
  ADD CONSTRAINT `admin_logins_ibfk_1` FOREIGN KEY (`Admin`) REFERENCES `admins` (`UserName`);

--
-- Constraints for table `student_deposits`
--
ALTER TABLE `student_deposits`
  ADD CONSTRAINT `student_deposits_ibfk_1` FOREIGN KEY (`Student`) REFERENCES `student_accounts` (`Reg_No`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
