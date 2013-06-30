CREATE TABLE `WalletJournal` (
  `transactionID` varchar(50) NOT NULL,
  `transactionDateTime` datetime NOT NULL,
  `typeID` varchar(50) DEFAULT NULL,
  `ownerName1` varchar(50) DEFAULT NULL,
  `ownerID1` varchar(50) DEFAULT NULL,
  `ownerName2` varchar(50) DEFAULT NULL,
  `ownerID2` varchar(50) DEFAULT NULL,
  `argName1` varchar(50) DEFAULT NULL,
  `argID` varchar(50) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `taxReceiverID` varchar(50) DEFAULT NULL,
  `taxAmount` float DEFAULT NULL,
  PRIMARY KEY (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


