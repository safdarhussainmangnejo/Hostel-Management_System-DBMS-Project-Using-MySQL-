-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 24, 2020 at 11:02 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel_msdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
CREATE TABLE IF NOT EXISTS `bed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beds_Available` int(7) DEFAULT NULL,
  `beds_reserved` int(7) DEFAULT NULL,
  `hostel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bed` (`hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`id`, `beds_Available`, `beds_reserved`, `hostel_id`) VALUES
(1, 10, 40, 1),
(2, 5, 35, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

DROP TABLE IF EXISTS `hostel`;
CREATE TABLE IF NOT EXISTS `hostel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Hname` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`id`, `Hname`, `address`) VALUES
(1, 'Hostel1', 'Sukkur IBA'),
(2, 'Physical Hostel', 'Near Sindhri Hotel');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `st_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `usertype`, `st_id`) VALUES
(1, 'shujat', '12345', 'admin', '222'),
(2, 'shan', '121', 'user', '115'),
(3, 'Adil', 'adil123', 'user', '120'),
(4, 'Muneeb', 'muneeb111', 'user', '121'),
(5, 'Rehan', 'rehan333', 'user', '122');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `amount` int(8) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `date`, `amount`, `student_id`) VALUES
(1, '11-7-2020', 1500, 1),
(2, '10-7-2020', 1500, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `hostel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rooms` (`hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_no`, `capacity`, `hostel_id`) VALUES
(1, '200', 3, 1),
(2, '201', 3, 1),
(3, '202', 3, 1),
(4, '203', 3, 1),
(5, '204', 3, 1),
(6, '205', 3, 1),
(7, '206', 3, 1),
(8, '207', 3, 1),
(9, '208', 3, 1),
(10, '209', 3, 1),
(11, '210', 3, 1),
(12, '300', 4, 2),
(13, '301', 4, 2),
(14, '302', 4, 2),
(15, '303', 4, 2),
(16, '304', 4, 2),
(17, '305', 4, 2),
(18, '306', 4, 2),
(19, '307', 4, 2),
(20, '308', 4, 2),
(21, '309', 4, 2),
(22, '310', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sname` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `st_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_student` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `Sname`, `fname`, `email`, `mobile`, `city`, `room_id`, `st_id`) VALUES
(1, 'Adil', 'Najeeb', 'adil@gmail.com', '03432345671', 'Karachi', 1, '120'),
(2, 'Muneeb', 'Waqar Ali', 'muneeb@gmail.com', '03312345678', 'Lahore', 12, '1234'),
(3, 'Rehan', 'Munwar', 'rehan@gmail.com', '03352284321', 'larkana', 16, '122'),
(4, 'shan', 'Zafar', 'shan@gmail.com', '03478656541', 'Larkana', 16, '115');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bed`
--
ALTER TABLE `bed`
  ADD CONSTRAINT `FK_bed` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_payment` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `FK_rooms` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_student` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
