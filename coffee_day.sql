

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee_day`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddOrder` (IN `orderId` INT(255), IN `itemName` VARCHAR(255), IN `itemId` INT(255), IN `custName` VARCHAR(255), IN `custId` INT(255), IN `quantity` INT(255), IN `price` INT(255), OUT `totalAmount` INT(255), IN `employeeId` INT(255))  BEGIN
SET totalAmount=quantity*price;
 Insert into orders(OrderID,ItemName,ItemID,CustName,CustID,Quantity,Price,TotalAmt,EmpID) 
 values (orderId,itemName,itemId,custName,custId,quantity,price,totalAmount,employeeId);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `autogen`
--

CREATE TABLE `autogen` (
  `CategoryID` int(11) NOT NULL,
  `EmpID` int(255) NOT NULL,
  `CustID` int(11) NOT NULL,
  `ItemID` int(255) NOT NULL,
  `OrderID` int(255) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `BillNo` int(11) NOT NULL,
  `RatingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autogen`
--

INSERT INTO `autogen` (`CategoryID`, `EmpID`, `CustID`, `ItemID`, `OrderID`, `MemberID`, `BillNo`, `RatingID`) VALUES
(103, 113, 1003, 204, 2, 0, 502, 1);

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

CREATE TABLE `billings` (
  `BillNo` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `CustName` varchar(20) NOT NULL,
  `CustID` int(11) NOT NULL,
  `Payment` varchar(20) NOT NULL,
  `OrdDate` varchar(20) NOT NULL,
  `TotalAmt` int(11) NOT NULL,
  `Discounts` int(11) NOT NULL,
  `GrandTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billings`
--

INSERT INTO `billings` (`BillNo`, `OrderID`, `CustName`, `CustID`, `Payment`, `OrdDate`, `TotalAmt`, `Discounts`, `GrandTotal`) VALUES
(501, 1, 'Amegh', 1002, 'Cash', '2018-12-04', 200, 40, 120);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(101, 'Juice'),
(102, 'Coffee'),
(103, 'teaa');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustID` int(255) NOT NULL,
  `CustName` varchar(20) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `PhNo` varchar(11) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `DateOfVisit` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustID`, `CustName`, `Address`, `PhNo`, `Email`, `DateOfVisit`) VALUES
(1001, 'Karthi', 'Mysuru', '9447675022', 'karthi@gmail.com', '2018-12-01'),
(1002, 'Amegh', 'Jayanagar', '9447675022', 'amegh@gmail.com', '2018-12-01');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `New_member_id` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
DECLARE MemberID int(100);
SET MemberID=new.CustID+1000;
INSERT into membership (MemberID,CustID,CustName) values (MemberID,new.CustID,new.CustName);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpID` int(255) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `PhNo` varchar(11) NOT NULL,
  `JobTitle` varchar(20) NOT NULL,
  `JoinDate` date NOT NULL,
  `Salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpID`, `FName`, `Lname`, `DateOfBirth`, `Gender`, `Address`, `PhNo`, `JobTitle`, `JoinDate`, `Salary`) VALUES
(111, 'Amar', 'Sharma', '1985-12-07', 'Male', 'Banglore', '9876543210', 'Cashier', '2018-12-01', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `forgotpassword`
--

CREATE TABLE `forgotpassword` (
  `fpid` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `SecQ` varchar(50) NOT NULL,
  `Answer` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forgotpassword`
--

INSERT INTO `forgotpassword` (`fpid`, `Username`, `Name`, `SecQ`, `Answer`, `Password`) VALUES
(1, 'akhina', 'Akhina babu', 'What is your school name?', 'St annes', '1234'),
(2, 'coffee', 'coffeeday', 'What is your pet name', 'browny', 'coffee123');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(255) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `Price` int(11) NOT NULL,
  `Flavour` varchar(20) NOT NULL,
  `CategoryName` varchar(20) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Picture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemName`, `Price`, `Flavour`, `CategoryName`, `CategoryID`, `Picture`) VALUES
(201, 'Orange juice', 50, 'Orange', 'Juice', 101, '201.jpg'),
(202, 'Cappuccino', 80, 'Chocolate', 'Coffee', 102, '202.jpg'),
(203, 'black coffee', 20, 'coffee', 'Coffee', 102, '203.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `items_ordered`
--

CREATE TABLE `items_ordered` (
  `SlNo` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ItemName` varchar(20) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `CustName` varchar(20) DEFAULT NULL,
  `CustID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `TotalAmt` int(11) DEFAULT NULL,
  `EmpID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Username`, `Password`) VALUES
('coffee', 'coffee123'),
('akhina', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `MemberID` int(20) NOT NULL,
  `CustID` int(11) NOT NULL,
  `CustName` varchar(20) NOT NULL,
  `TypeOfCust` varchar(20) DEFAULT NULL,
  `Points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`MemberID`, `CustID`, `CustName`, `TypeOfCust`, `Points`) VALUES
(2001, 1001, 'Karthi', 'regular', 4),
(2002, 1002, 'Amegh', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(255) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `CustName` varchar(20) NOT NULL,
  `CustID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `TotalAmt` int(11) NOT NULL,
  `EmpID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `ItemName`, `ItemID`, `CustName`, `CustID`, `Quantity`, `Price`, `TotalAmt`, `EmpID`) VALUES
(1, 'Cappuccino', 202, 'Amegh', 1002, 5, 40, 200, 111);

-- --------------------------------------------------------

--
-- Table structure for table `printbill`
--

CREATE TABLE `printbill` (
  `OrderID` int(11) NOT NULL,
  `BillNo` int(11) NOT NULL DEFAULT '-1',
  `CustName` varchar(20) NOT NULL,
  `CustID` int(11) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Payment` varchar(20) NOT NULL DEFAULT '-1',
  `TotalAmt` int(11) NOT NULL,
  `EmpID` int(11) NOT NULL,
  `OrdDate` date DEFAULT NULL,
  `Discounts` int(11) DEFAULT NULL,
  `GrandTotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `printbill`
--

INSERT INTO `printbill` (`OrderID`, `BillNo`, `CustName`, `CustID`, `ItemName`, `ItemID`, `Quantity`, `Price`, `Payment`, `TotalAmt`, `EmpID`, `OrdDate`, `Discounts`, `GrandTotal`) VALUES
(1, 501, 'Amegh', 1002, 'Cappuccino', 202, 5, 40, 'Cash', 200, 111, '2018-12-04', 40, 120);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `RatingID` int(11) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billings`
--
ALTER TABLE `billings`
  ADD PRIMARY KEY (`BillNo`),
  ADD KEY `fkeybill9` (`OrderID`),
  ADD KEY `fkeybill8` (`CustID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indexes for table `forgotpassword`
--
ALTER TABLE `forgotpassword`
  ADD PRIMARY KEY (`fpid`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `fkeyitem` (`CategoryID`);

--
-- Indexes for table `items_ordered`
--
ALTER TABLE `items_ordered`
  ADD PRIMARY KEY (`SlNo`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`MemberID`),
  ADD KEY `fkeymem` (`CustID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fkey` (`ItemID`),
  ADD KEY `fkey1` (`CustID`),
  ADD KEY `fkey2` (`EmpID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RatingID`),
  ADD KEY `fkeyrat` (`ItemID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items_ordered`
--
ALTER TABLE `items_ordered`
  MODIFY `SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billings`
--
ALTER TABLE `billings`
  ADD CONSTRAINT `fkeybill8` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkeybill9` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fkeyitem` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `fkeymem` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fkey` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkey1` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkey2` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fkeyrat` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
