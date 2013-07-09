ALTER TABLE `evedb`.`MaterialPurchase` ADD COLUMN `transactionDateTime` DATETIME NULL  AFTER `stationID` ;
ALTER TABLE `evedb`.`ProductResult` ADD COLUMN `transactionDateTime` DATETIME NULL  AFTER `sumPrice` ;
