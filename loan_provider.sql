-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2017 at 09:59 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loan_provider`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `Cust_id` int(10) NOT NULL,
  `FIRST_name` varchar(10) NOT NULL,
  `LAST_name` varchar(10) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Zip_code` varchar(5) DEFAULT NULL,
  `SSN` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`Cust_id`, `FIRST_name`, `LAST_name`, `Address`, `Email`, `Contact`, `Zip_code`, `SSN`) VALUES
(1230, 'vivek', 'Adepu', '430,Barton Creek Dr', 'vadepu@uncc.edu', '7049053818', '28262', '10001234'),
(1231, 'Hani', 'Marothu', '9519B,UTD', 'hmarothu@uncc.edu', '7049053810', '35801', '91235789'),
(1232, 'Puneeth', 'Deva', '9501G,UTD', 'punee@uncc.edu', '749053800', '99501', '12356899'),
(1233, 'Ananda', 'Kantamneni', '9505H,UTD', 'kananda@uncc.edu', '7049053000', '85001', ''),
(1234, 'Anan', 'Allari', '9506E,Ashford', 'allarianan@uncc.edu', '7049050000', '72201', '3589912`'),
(1235, 'Nanda', 'Allu', '844H ashley court', 'allunanda@uncc.edu', '7049053100', '94203', '56899123'),
(1236, 'Hanisha', 'Gatamaneni', '720F,49 North ', 'gantahani@uncc.edu', '7049053200', '33124', '68991235'),
(1237, 'Pune', 'Pyreddy', '600E, Ashwood', 'pyrepune@uncc.edu', '7049053300', '30301', ''),
(1241, 'Lenov', 'Gforce', '700TM,campbell', 'geforce@uncc.edu', '7049053000', '60601', '99123568'),
(1242, 'Dello', 'Volt', '108Hd,Standardwood', 'voldel@uncc.edu', '7049065400', '67201', '');

-- --------------------------------------------------------

--
-- Table structure for table `percentage`
--

CREATE TABLE `percentage` (
  `loanID` int(5) NOT NULL,
  `loan_type` varchar(10) NOT NULL,
  `Rate_of_interest` varchar(5) NOT NULL,
  `Pay-off-time` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `percentage`
--

INSERT INTO `percentage` (`loanID`, `loan_type`, `Rate_of_interest`, `Pay-off-time`) VALUES
(1230, 'Gold', '10', 24),
(1231, 'Home', '10.5', 36),
(1232, 'Car', '11.25', 18),
(1233, 'Business', '12.30', 29),
(1234, 'Personal', '14.45', 30),
(1235, 'Education', '9.20', 32),
(1236, 'Personal', '11.75', 40),
(1237, 'Business', '13.50', 12),
(1241, 'Car', '14.00', 10),
(1242, 'Home', '12.00', 6);

-- --------------------------------------------------------

--
-- Table structure for table `repay`
--

CREATE TABLE `repay` (
  `Cust_id` int(10) NOT NULL,
  `Paid` varchar(10) DEFAULT NULL,
  `Rem_amount` varchar(10) DEFAULT NULL,
  `Rem_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `repay`
--

INSERT INTO `repay` (`Cust_id`, `Paid`, `Rem_amount`, `Rem_number`) VALUES
(1230, '125', '4375', '1'),
(1231, '5666', '1333', '12'),
(1232, '6000', '3000', '12'),
(1233, '800500', '100000', '28'),
(1234, '13000', '500', '29'),
(1235, '5500', '5500', '15'),
(1236, '3500', '6500', '20'),
(1237, '3500', '12200', '7'),
(1241, '10800', '1200', '9'),
(1242, '6600', '6600', '3');

-- --------------------------------------------------------

--
-- Table structure for table `value`
--

CREATE TABLE `value` (
  `Cust_id` int(10) NOT NULL,
  `Val_type` varchar(10) DEFAULT NULL,
  `Est_value` varchar(10) DEFAULT NULL,
  `Value_disp` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `value`
--

INSERT INTO `value` (`Cust_id`, `Val_type`, `Est_value`, `Value_disp`) VALUES
(1230, 'Car', '5000', '4500'),
(1231, 'Car', '17000', '17000'),
(1232, 'Gold', '10000', '9000'),
(1233, 'Home', '1100000', '900500'),
(1234, 'Pay', '14000', '13500'),
(1235, 'Car', '15000', '11000'),
(1236, 'Car', '16500', '10000'),
(1237, 'Gold', '19500', '16700'),
(1241, 'Gold', '12500', '12000'),
(1242, 'Car', '13200', '13200');

-- --------------------------------------------------------

--
-- Table structure for table `zip_code`
--

CREATE TABLE `zip_code` (
  `Zip_code` varchar(5) NOT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zip_code`
--

INSERT INTO `zip_code` (`Zip_code`, `City`, `State`, `Country`) VALUES
('28262', 'Charlotte', 'NC', 'USA'),
('30301', 'Atlanta', 'Georgia', 'USA'),
('33124', 'Miami', 'Florida', 'USA'),
('35801', 'Huntsville', 'Albana', 'USA'),
('60601', 'Chicago', 'Illinois', 'USA'),
('67201', 'Wichita', 'Kentucky', 'USA'),
('72201', 'Littlerock', 'Arkansas', 'USA'),
('85001', 'Pheonix', 'Arizona', 'USA'),
('94203', 'Sacrenento', 'California', 'USA'),
('99501', 'Anchorage', 'Alaska', 'USA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`Cust_id`),
  ADD KEY `Zip_code` (`Zip_code`);

--
-- Indexes for table `percentage`
--
ALTER TABLE `percentage`
  ADD PRIMARY KEY (`loanID`);

--
-- Indexes for table `repay`
--
ALTER TABLE `repay`
  ADD PRIMARY KEY (`Cust_id`);

--
-- Indexes for table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`Cust_id`);

--
-- Indexes for table `zip_code`
--
ALTER TABLE `zip_code`
  ADD PRIMARY KEY (`Zip_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD CONSTRAINT `Zip_code` FOREIGN KEY (`Zip_code`) REFERENCES `zip_code` (`Zip_code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `repay`
--
ALTER TABLE `repay`
  ADD CONSTRAINT `Cust_id` FOREIGN KEY (`Cust_id`) REFERENCES `customer_details` (`Cust_id`);

--
-- Constraints for table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `Fk_Cid` FOREIGN KEY (`Cust_id`) REFERENCES `customer_details` (`Cust_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
