# テーブルのダンプ MarketOrder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MarketOrder`;

CREATE TABLE `MarketOrder` (
  `orderID` bigint(20) NOT NULL,
  `charID` bigint(20) DEFAULT NULL,
  `stationID` bigint(20) DEFAULT NULL,
  `volEntered` bigint(20) DEFAULT NULL,
  `volRemaining` bigint(20) DEFAULT NULL,
  `minVolume` bigint(20) DEFAULT NULL,
  `orderState` bigint(20) DEFAULT NULL,
  `typeID` bigint(20) DEFAULT NULL,
  `range` bigint(20) DEFAULT NULL,
  `accountKey` bigint(20) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `escrow` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `bid` tinyint(4) DEFAULT NULL,
  `issued` datetime DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$




