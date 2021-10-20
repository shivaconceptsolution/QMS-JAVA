-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2021 at 01:59 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qmspro`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `userid` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`userid`, `password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `email` varchar(50) NOT NULL,
  `password` char(12) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `mobile` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`email`, `password`, `fullname`, `mobile`) VALUES
('cust@gmail.com', '12345', 'Customer1', '9981867875'),
('ram@gmail.com', '12345', 'ram kumar', '9812312345');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedid` int(11) NOT NULL,
  `deptname` varchar(50) NOT NULL,
  `feeddesc` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedid`, `deptname`, `feeddesc`, `email`) VALUES
(1, 'Finance', 'Enter feedback description\r\nafdfdfdsfdsfd', 'cust@gmail.com'),
(2, 'Finance', 'Enddsfdsfgdsf', 'cust@gmail.com'),
(3, 'SALES', 'Nice work by sales team\r\n', 'ram@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `replyid` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `feedid` int(11) NOT NULL,
  `repydate` timestamp NOT NULL DEFAULT current_timestamp(),
  `replyby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reply`
--

INSERT INTO `reply` (`replyid`, `message`, `feedid`, `repydate`, `replyby`) VALUES
(1, 'I have not replied by anyone plz sove my issue', 1, '2021-10-13 12:43:58', 'manager'),
(2, 'i kjf dsh fiuds hiudsh ifuh dsih fdhdgiuhfuhfu\r\n', 1, '2021-10-16 12:23:44', 'manager'),
(3, 'Enter reply message desdstrfrfdytredyttycription\r\n', 2, '2021-10-16 12:24:10', 'manager'),
(4, 'Thanks to provide feed\r\n', 3, '2021-10-16 12:26:24', 'manager'),
(5, 'customer reply dzfdsgdsg sdgsd  gsfdg', 1, '2021-10-16 12:41:29', 'customer'),
(6, 'dsfgsfghf fg  hfdhdgh dghj fyj fy jytu \r\n', 1, '2021-10-19 12:03:23', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffid` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffid`, `password`, `dept`, `fullname`) VALUES
('Emp1001', '123', 'Finance', 'Manish Kumar'),
('Emp1002', '123', 'Sales', 'Kamal Kumar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `fk_cust_email` (`email`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`replyid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `replyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_cust_email` FOREIGN KEY (`email`) REFERENCES `customer` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
