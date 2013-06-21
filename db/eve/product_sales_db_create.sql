# テーブルのダンプ ProductSales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ProductSales`;



CREATE TABLE `ProductSales` (
  `transactionID` bigint(20) NOT NULL,
  `transactionDateTime` datetime DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `typeID` bigint(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `clientID` bigint(20) DEFAULT NULL,
  `stationID` bigint(20) DEFAULT NULL,
  `journalTransactionID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



