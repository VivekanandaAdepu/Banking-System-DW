-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2017 at 05:27 PM
-- Server version: 5.5.54-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Banking System`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE IF NOT EXISTS `Account` (
  `Account_No` int(5) NOT NULL,
  `Branch_No` int(5) NOT NULL,
  `AccountType` char(12) NOT NULL,
  `Balance` char(12) NOT NULL,
  PRIMARY KEY (`Account_No`),
  UNIQUE KEY `Account_No` (`Account_No`),
  KEY `Branch_No` (`Branch_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`Account_No`, `Branch_No`, `AccountType`, `Balance`) VALUES
(2, 9, 'Saving', '146.3'),
(5, 4, 'Saving', '2489'),
(7, 1, 'Checking', '1453'),
(54, 9, 'Saving', '54896'),
(94, 8, 'Checking', '1587');

-- --------------------------------------------------------

--
-- Table structure for table `Bank`
--

CREATE TABLE IF NOT EXISTS `Bank` (
  `Code` int(5) NOT NULL,
  `Name` char(32) NOT NULL,
  `Street` varchar(32) NOT NULL,
  `City` char(32) NOT NULL,
  `State` char(32) NOT NULL,
  `Zip` char(10) NOT NULL,
  `Country` char(32) NOT NULL,
  PRIMARY KEY (`Code`),
  UNIQUE KEY `Code` (`Code`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Bank`
--

INSERT INTO `Bank` (`Code`, `Name`, `Street`, `City`, `State`, `Zip`, `Country`) VALUES
(4, 'BOFA', 'Barton Creek', 'Charlotte', 'NC', '28262', 'USA'),
(8, 'SEFQU', 'Cumberland Mall', 'Atlanta', 'Georgia', '30080', 'USA'),
(9, 'PNB', '101 N Tryon', 'Charlotte', 'NC', '28262', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `Bank_Branch`
--

CREATE TABLE IF NOT EXISTS `Bank_Branch` (
  `Branch_No` int(5) NOT NULL,
  `Address` char(32) NOT NULL,
  `BranchCity` char(32) NOT NULL,
  PRIMARY KEY (`Branch_No`),
  UNIQUE KEY `Branch_No` (`Branch_No`),
  UNIQUE KEY `Address` (`Address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Bank_Branch`
--

INSERT INTO `Bank_Branch` (`Branch_No`, `Address`, `BranchCity`) VALUES
(1, 'Skyland Blvd E', 'Tuscaloosa'),
(4, 'Barton Creek', 'Charlotte'),
(8, 'Cumberland Mall', 'Atlanta'),
(9, '101 N Tryon', 'Charlotte');

-- --------------------------------------------------------

--
-- Table structure for table `cardtypes`
--

CREATE TABLE IF NOT EXISTS `cardtypes` (
  `cardtypecode` varchar(45) NOT NULL,
  `cardtypedescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cardtypecode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cardtypes`
--

INSERT INTO `cardtypes` (`cardtypecode`, `cardtypedescription`) VALUES
('AX ', 'American Express'),
('CA', 'Master Card'),
('DS', 'Discover'),
('VI', 'Visa');

-- --------------------------------------------------------

--
-- Table structure for table `countrycodes`
--

CREATE TABLE IF NOT EXISTS `countrycodes` (
  `countrycode` varchar(45) NOT NULL,
  `countryname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`countrycode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countrycodes`
--

INSERT INTO `countrycodes` (`countrycode`, `countryname`) VALUES
('as', 'america'),
('cn', 'china'),
('in', 'india'),
('mc', 'monaco');

-- --------------------------------------------------------

--
-- Table structure for table `currencycodes`
--

CREATE TABLE IF NOT EXISTS `currencycodes` (
  `currencycode` varchar(45) NOT NULL,
  `currencydescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`currencycode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencycodes`
--

INSERT INTO `currencycodes` (`currencycode`, `currencydescription`) VALUES
('CNY', 'China'),
('EUR', 'Monaco'),
('INR', 'India'),
('USD', 'America');

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE IF NOT EXISTS `Customer` (
  `Customer_ID` int(15) NOT NULL,
  `SSN` int(5) NOT NULL,
  `First_Name` char(30) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `Phone` int(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Street` varchar(32) NOT NULL,
  `City` char(32) NOT NULL,
  `State` char(32) NOT NULL,
  `Zip` char(10) NOT NULL,
  `Country` char(32) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `SSN` (`SSN`),
  UNIQUE KEY `Name` (`First_Name`),
  UNIQUE KEY `Customer_ID` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Customer_ID`, `SSN`, `First_Name`, `Last_Name`, `Phone`, `Email`, `Street`, `City`, `State`, `Zip`, `Country`) VALUES
(128, 754123698, 'Charishma', 'Gurram', 980147856, 'cgurram@uncc.edu', '10005 Graduate Lane', 'Charlotte', 'NC', '28262', 'USA'),
(143, 951753246, 'Charan', 'Pyreddy', 716416114, 'tejacharan75@gmail.com', '1216 Lincoln Trace Circle', 'Atlanta', 'Georgia', '30080', 'USA'),
(169, 70456608, 'Hanisha', 'Marothu', 980636080, 'hanisham22@gmail.com', '9519 University Terrace Dr', 'Charlotte', 'NC', '28262', 'USA'),
(875, 268417938, 'Puneeth', 'Devabaktuni', 714416158, 'puneethd@gmail.com', '9501 University Terrace Dr', 'Charlotte', 'NC', '28262', 'USA'),
(1230, 10001234, 'Vivek', 'Adepu', 709053818, 'vadepu@uncc.edu', '430 Barton Creek', 'Charlotte', 'NC', '28262', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `customercards`
--

CREATE TABLE IF NOT EXISTS `customercards` (
  `cardid` int(11) NOT NULL,
  `cardtypecode` varchar(45) DEFAULT NULL,
  `currencycode` varchar(45) DEFAULT NULL,
  `customerid` varchar(45) DEFAULT NULL,
  `cardnumber` varchar(45) DEFAULT NULL,
  `cardvalidfrom` varchar(45) DEFAULT NULL,
  `cardvalidthrough` varchar(45) DEFAULT NULL,
  `othercardetails` varchar(45) DEFAULT NULL,
  `cardtypes_cardtypecode` varchar(45) NOT NULL,
  `currencycodes_currencycode` varchar(45) NOT NULL,
  `customes_customerid` int(11) NOT NULL,
  PRIMARY KEY (`cardid`),
  KEY `fk_customercards_cardtypes1_idx` (`cardtypes_cardtypecode`),
  KEY `fk_customercards_currencycodes1_idx` (`currencycodes_currencycode`),
  KEY `fk_customercards_customes1_idx` (`customes_customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customercards`
--

INSERT INTO `customercards` (`cardid`, `cardtypecode`, `currencycode`, `customerid`, `cardnumber`, `cardvalidfrom`, `cardvalidthrough`, `othercardetails`, `cardtypes_cardtypecode`, `currencycodes_currencycode`, `customes_customerid`) VALUES
(1, 'AX', 'USD', '1', '1111111111111111', '01/2020', '01/2021', '101', 'AX', 'USD', 1),
(2, 'DS', 'EUR', '3', '2222222222222222', '06/2021', '06/2032', '102', 'DS', 'EUR', 3),
(3, 'VI', 'INR', '2', '3333333333333333', '07/2021', '07/2134', '103', 'VI', 'INR', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customerid` int(11) NOT NULL,
  `countrycode` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `countrycodes_countrycode` varchar(45) NOT NULL,
  PRIMARY KEY (`customerid`),
  KEY `fk_customes_countrycodes_idx` (`countrycodes_countrycode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerid`, `countrycode`, `firstname`, `lastname`, `address`, `phone`, `mail`, `countrycodes_countrycode`) VALUES
(1, 'as', 'puneeth', 'devabhaktuni', 'UT', '3302120534', 'puneeth@gmail.com', 'as'),
(2, 'cn', 'tim', 'cook', 'UTN', '6576787656', 'tim@gmail.com', 'cn'),
(3, 'in', 'Kumar', 'paul', 'CG', '3467898767', 'kpaul@gmail.com', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE IF NOT EXISTS `customer_details` (
  `Cust_id` int(10) NOT NULL,
  `FIRST_name` varchar(10) NOT NULL,
  `LAST_name` varchar(10) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Zip_code` varchar(5) DEFAULT NULL,
  `SSN` varchar(30) NOT NULL,
  PRIMARY KEY (`Cust_id`),
  KEY `Zip_code` (`Zip_code`)
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
-- Table structure for table `Fact_Table`
--

CREATE TABLE IF NOT EXISTS `Fact_Table` (
  `Account_No` int(5) NOT NULL,
  `Code` int(5) NOT NULL,
  `Branch_No` int(5) NOT NULL,
  `cardtypecode` varchar(45) NOT NULL,
  `countrycode` varchar(45) NOT NULL,
  `currencycode` varchar(45) NOT NULL,
  `Customer_ID` int(15) NOT NULL,
  `cardid` int(11) NOT NULL,
  `Cust_ID` int(10) NOT NULL,
  `customerid` int(11) NOT NULL,
  `transactionid` int(11) NOT NULL,
  `Loan_No` int(5) NOT NULL,
  `merchantcategorycode` int(11) NOT NULL,
  `merchantid` int(11) NOT NULL,
  `Zip_code` varchar(5) NOT NULL,
  `idtransactiontypecode` varchar(45) NOT NULL,
  `loanID` int(5) NOT NULL,
  `Value_Cust_id` int(10) NOT NULL,
  `Repay_Cust_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `financialtransactions`
--

CREATE TABLE IF NOT EXISTS `financialtransactions` (
  `transactionid` int(11) NOT NULL,
  `accountid` varchar(45) DEFAULT NULL,
  `cardid` varchar(45) DEFAULT NULL,
  `currencycode` varchar(45) DEFAULT NULL,
  `merchantid` varchar(45) DEFAULT NULL,
  `transactiontypecode` varchar(45) DEFAULT NULL,
  `transactiondate` varchar(45) DEFAULT NULL,
  `transactionammount` varchar(45) DEFAULT NULL,
  `transactiontype_idtransactiontypecode` varchar(45) NOT NULL,
  `customercards_cardid` int(11) NOT NULL,
  `merchants_merchantid` int(11) NOT NULL,
  `currencycodes_currencycode` varchar(45) NOT NULL,
  PRIMARY KEY (`transactionid`),
  KEY `fk_financialtransactions_transactiontype1_idx` (`transactiontype_idtransactiontypecode`),
  KEY `fk_financialtransactions_customercards1_idx` (`customercards_cardid`),
  KEY `fk_financialtransactions_merchants1_idx` (`merchants_merchantid`),
  KEY `fk_financialtransactions_currencycodes1_idx` (`currencycodes_currencycode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financialtransactions`
--

INSERT INTO `financialtransactions` (`transactionid`, `accountid`, `cardid`, `currencycode`, `merchantid`, `transactiontypecode`, `transactiondate`, `transactionammount`, `transactiontype_idtransactiontypecode`, `customercards_cardid`, `merchants_merchantid`, `currencycodes_currencycode`) VALUES
(1, '1210412713', '1', 'USD', '1', 'C', '01/21/2017', '158', 'C', 1, 1, 'USD'),
(2, '1210412714', '2', 'INR', '2', 'C', '02/04/2017', '178', 'C', 2, 2, 'INR'),
(3, '1210412715', '3', 'EUR', '3', 'A', '04/03/2018', '10000', 'A', 3, 3, 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `Loan`
--

CREATE TABLE IF NOT EXISTS `Loan` (
  `Loan_No` int(5) NOT NULL,
  `Branch_No` int(11) NOT NULL,
  `LoanType` varchar(30) NOT NULL,
  `Amount` int(5) NOT NULL,
  PRIMARY KEY (`Loan_No`),
  UNIQUE KEY `Loan_No` (`Loan_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Loan`
--

INSERT INTO `Loan` (`Loan_No`, `Branch_No`, `LoanType`, `Amount`) VALUES
(3, 9, 'Home', 90000),
(4, 8, 'Car', 9000),
(6, 8, 'Personal', 15000),
(7, 4, 'Car', 10000),
(9, 4, 'Education', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `merchantcategory`
--

CREATE TABLE IF NOT EXISTS `merchantcategory` (
  `merchantcategorycode` int(11) NOT NULL,
  `merchantcategorydescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`merchantcategorycode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchantcategory`
--

INSERT INTO `merchantcategory` (`merchantcategorycode`, `merchantcategorydescription`) VALUES
(2456, 'Airlines'),
(3000, 'Hotels'),
(3456, 'Car Rentals');

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE IF NOT EXISTS `merchants` (
  `merchantid` int(11) NOT NULL,
  `countrycode` varchar(45) DEFAULT NULL,
  `merchantcategorycode` varchar(45) DEFAULT NULL,
  `merchantname` varchar(45) DEFAULT NULL,
  `merchantphone` varchar(45) DEFAULT NULL,
  `merchantemail` varchar(45) DEFAULT NULL,
  `merchantcategory_merchantcategorycode` int(11) NOT NULL,
  `countrycodes_countrycode` varchar(45) NOT NULL,
  PRIMARY KEY (`merchantid`),
  KEY `fk_merchants_merchantcategory1_idx` (`merchantcategory_merchantcategorycode`),
  KEY `fk_merchants_countrycodes1_idx` (`countrycodes_countrycode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`merchantid`, `countrycode`, `merchantcategorycode`, `merchantname`, `merchantphone`, `merchantemail`, `merchantcategory_merchantcategorycode`, `countrycodes_countrycode`) VALUES
(1, 'as', '3000', 'United Hotels', '3302178978', 'united@gmail.com', 3000, 'as'),
(2, 'in', '3456', 'enterprize ', '9948554493', 'enter@gmail.com', 3456, 'in'),
(3, 'in', '2456', 'Arab Airlines', '9878989876', 'arab@gmail.com', 2456, 'in');

-- --------------------------------------------------------

--
-- Table structure for table `percentage`
--

CREATE TABLE IF NOT EXISTS `percentage` (
  `loanID` int(5) NOT NULL,
  `loan_type` varchar(10) NOT NULL,
  `Rate_of_interest` varchar(5) NOT NULL,
  `Pay-off-time` int(5) DEFAULT NULL,
  PRIMARY KEY (`loanID`)
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

CREATE TABLE IF NOT EXISTS `repay` (
  `Cust_id` int(10) NOT NULL,
  `Paid` varchar(10) DEFAULT NULL,
  `Rem_amount` varchar(10) DEFAULT NULL,
  `Rem_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cust_id`)
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
-- Table structure for table `transactiontype`
--

CREATE TABLE IF NOT EXISTS `transactiontype` (
  `idtransactiontypecode` varchar(45) NOT NULL,
  `transactiontypedescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtransactiontypecode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactiontype`
--

INSERT INTO `transactiontype` (`idtransactiontypecode`, `transactiontypedescription`) VALUES
('A', 'Authorization'),
('C ', 'Credit'),
('D', 'Delayed Capture'),
('S', 'Sale/debit');

-- --------------------------------------------------------

--
-- Table structure for table `value`
--

CREATE TABLE IF NOT EXISTS `value` (
  `Cust_id` int(10) NOT NULL,
  `Val_type` varchar(10) DEFAULT NULL,
  `Est_value` varchar(10) DEFAULT NULL,
  `Value_disp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cust_id`)
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

CREATE TABLE IF NOT EXISTS `zip_code` (
  `Zip_code` varchar(5) NOT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Zip_code`)
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
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`Branch_No`) REFERENCES `Bank_Branch` (`Branch_No`) ON DELETE CASCADE;

--
-- Constraints for table `customercards`
--
ALTER TABLE `customercards`
  ADD CONSTRAINT `fk_customercards_cardtypes1` FOREIGN KEY (`cardtypes_cardtypecode`) REFERENCES `cardtypes` (`cardtypecode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customercards_currencycodes1` FOREIGN KEY (`currencycodes_currencycode`) REFERENCES `currencycodes` (`currencycode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customercards_customes1` FOREIGN KEY (`customes_customerid`) REFERENCES `customers` (`customerid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customes_countrycodes` FOREIGN KEY (`countrycodes_countrycode`) REFERENCES `countrycodes` (`countrycode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD CONSTRAINT `Zip_code` FOREIGN KEY (`Zip_code`) REFERENCES `zip_code` (`Zip_code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `financialtransactions`
--
ALTER TABLE `financialtransactions`
  ADD CONSTRAINT `fk_financialtransactions_transactiontype1` FOREIGN KEY (`transactiontype_idtransactiontypecode`) REFERENCES `transactiontype` (`idtransactiontypecode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_financialtransactions_customercards1` FOREIGN KEY (`customercards_cardid`) REFERENCES `customercards` (`cardid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_financialtransactions_merchants1` FOREIGN KEY (`merchants_merchantid`) REFERENCES `merchants` (`merchantid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_financialtransactions_currencycodes1` FOREIGN KEY (`currencycodes_currencycode`) REFERENCES `currencycodes` (`currencycode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `merchants`
--
ALTER TABLE `merchants`
  ADD CONSTRAINT `fk_merchants_merchantcategory1` FOREIGN KEY (`merchantcategory_merchantcategorycode`) REFERENCES `merchantcategory` (`merchantcategorycode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_merchants_countrycodes1` FOREIGN KEY (`countrycodes_countrycode`) REFERENCES `countrycodes` (`countrycode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
