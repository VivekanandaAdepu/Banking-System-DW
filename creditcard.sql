
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE TABLE IF NOT EXISTS `Banking System`.`countrycodes` (
  `countrycode` VARCHAR(45) NOT NULL,
  `countryname` VARCHAR(45) NULL,
  PRIMARY KEY (`countrycode`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Banking System`.`customes` (
  `customerid` INT NOT NULL,
  `countrycode` VARCHAR(45) NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `mail` VARCHAR(45) NULL,
  `countrycodes_countrycode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerid`),
  INDEX `fk_customes_countrycodes_idx` (`countrycodes_countrycode` ASC),
  CONSTRAINT `fk_customes_countrycodes`
    FOREIGN KEY (`countrycodes_countrycode`)
    REFERENCES `Banking System`.`countrycodes` (`countrycode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Banking System`.`cardtypes` (
  `cardtypecode` VARCHAR(45) NOT NULL,
  `cardtypedescription` VARCHAR(45) NULL,
  PRIMARY KEY (`cardtypecode`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Banking System`.`currencycodes` (
  `currencycode` VARCHAR(45) NOT NULL,
  `currencydescription` VARCHAR(45) NULL,
  PRIMARY KEY (`currencycode`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Banking System`.`customercards` (
  `cardid` INT NOT NULL,
  `cardtypecode` VARCHAR(45) NULL,
  `currencycode` VARCHAR(45) NULL,
  `customerid` VARCHAR(45) NULL,
  `cardnumber` VARCHAR(45) NULL,
  `cardvalidfrom` VARCHAR(45) NULL,
  `cardvalidthrough` VARCHAR(45) NULL,
  `othercardetails` VARCHAR(45) NULL,
  `cardtypes_cardtypecode` VARCHAR(45) NOT NULL,
  `currencycodes_currencycode` VARCHAR(45) NOT NULL,
  `customes_customerid` INT NOT NULL,
  PRIMARY KEY (`cardid`),
  INDEX `fk_customercards_cardtypes1_idx` (`cardtypes_cardtypecode` ASC),
  INDEX `fk_customercards_currencycodes1_idx` (`currencycodes_currencycode` ASC),
  INDEX `fk_customercards_customes1_idx` (`customes_customerid` ASC),
  CONSTRAINT `fk_customercards_cardtypes1`
    FOREIGN KEY (`cardtypes_cardtypecode`)
    REFERENCES `Banking System`.`cardtypes` (`cardtypecode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customercards_currencycodes1`
    FOREIGN KEY (`currencycodes_currencycode`)
    REFERENCES `Banking System`.`currencycodes` (`currencycode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customercards_customes1`
    FOREIGN KEY (`customes_customerid`)
    REFERENCES `Banking System`.`customes` (`customerid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Banking System`.`transactiontype` (
  `idtransactiontypecode` VARCHAR(45) NOT NULL,
  `transactiontypedescription` VARCHAR(45) NULL,
  PRIMARY KEY (`idtransactiontypecode`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Banking System`.`merchantcategory` (
  `merchantcategorycode` INT NOT NULL,
  `merchantcategorydescription` VARCHAR(45) NULL,
  PRIMARY KEY (`merchantcategorycode`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Banking System`.`merchants` (
  `merchantid` INT NOT NULL,
  `countrycode` VARCHAR(45) NULL,
  `merchantcategorycode` VARCHAR(45) NULL,
  `merchantname` VARCHAR(45) NULL,
  `merchantphone` VARCHAR(45) NULL,
  `merchantemail` VARCHAR(45) NULL,
  `merchantcategory_merchantcategorycode` INT NOT NULL,
  `countrycodes_countrycode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`merchantid`),
  INDEX `fk_merchants_merchantcategory1_idx` (`merchantcategory_merchantcategorycode` ASC),
  INDEX `fk_merchants_countrycodes1_idx` (`countrycodes_countrycode` ASC),
  CONSTRAINT `fk_merchants_merchantcategory1`
    FOREIGN KEY (`merchantcategory_merchantcategorycode`)
    REFERENCES `Banking System`.`merchantcategory` (`merchantcategorycode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchants_countrycodes1`
    FOREIGN KEY (`countrycodes_countrycode`)
    REFERENCES `Banking System`.`countrycodes` (`countrycode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Banking System`.`financialtransactions` (
  `transactionid` INT NOT NULL,
  `accountid` VARCHAR(45) NULL,
  `cardid` VARCHAR(45) NULL,
  `currencycode` VARCHAR(45) NULL,
  `merchantid` VARCHAR(45) NULL,
  `transactiontypecode` VARCHAR(45) NULL,
  `transactiondate` VARCHAR(45) NULL,
  `transactionammount` VARCHAR(45) NULL,
  `transactiontype_idtransactiontypecode` VARCHAR(45) NOT NULL,
  `customercards_cardid` INT NOT NULL,
  `merchants_merchantid` INT NOT NULL,
  `currencycodes_currencycode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transactionid`),
  INDEX `fk_financialtransactions_transactiontype1_idx` (`transactiontype_idtransactiontypecode` ASC),
  INDEX `fk_financialtransactions_customercards1_idx` (`customercards_cardid` ASC),
  INDEX `fk_financialtransactions_merchants1_idx` (`merchants_merchantid` ASC),
  INDEX `fk_financialtransactions_currencycodes1_idx` (`currencycodes_currencycode` ASC),
  CONSTRAINT `fk_financialtransactions_transactiontype1`
    FOREIGN KEY (`transactiontype_idtransactiontypecode`)
    REFERENCES `Banking System`.`transactiontype` (`idtransactiontypecode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financialtransactions_customercards1`
    FOREIGN KEY (`customercards_cardid`)
    REFERENCES `Banking System`.`customercards` (`cardid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financialtransactions_merchants1`
    FOREIGN KEY (`merchants_merchantid`)
    REFERENCES `Banking System`.`merchants` (`merchantid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financialtransactions_currencycodes1`
    FOREIGN KEY (`currencycodes_currencycode`)
    REFERENCES `Banking System`.`currencycodes` (`currencycode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `transactiontype` (`idtransactiontypecode`,`transactiontypedescription`) VALUES ('A','Authorization');
INSERT INTO `transactiontype` (`idtransactiontypecode`,`transactiontypedescription`) VALUES ('C ','Credit');
INSERT INTO `transactiontype` (`idtransactiontypecode`,`transactiontypedescription`) VALUES ('D','Delayed Capture');
INSERT INTO `transactiontype` (`idtransactiontypecode`,`transactiontypedescription`) VALUES ('S','Sale/debit');

INSERT INTO `merchants` (`merchantid`,`countrycode`,`merchantcategorycode`,`merchantname`,`merchantphone`,`merchantemail`,`merchantcategory_merchantcategorycode`,`countrycodes_countrycode`) VALUES (1,'as','3000','United Hotels','3302178978','united@gmail.com',3000,'as');
INSERT INTO `merchants` (`merchantid`,`countrycode`,`merchantcategorycode`,`merchantname`,`merchantphone`,`merchantemail`,`merchantcategory_merchantcategorycode`,`countrycodes_countrycode`) VALUES (2,'in','3456','enterprize ','9948554493','enter@gmail.com',3456,'in');
INSERT INTO `merchants` (`merchantid`,`countrycode`,`merchantcategorycode`,`merchantname`,`merchantphone`,`merchantemail`,`merchantcategory_merchantcategorycode`,`countrycodes_countrycode`) VALUES (3,'in','2456','Arab Airlines','9878989876','arab@gmail.com',2456,'in');

INSERT INTO `merchantcategory` (`merchantcategorycode`,`merchantcategorydescription`) VALUES (2456,'Airlines');
INSERT INTO `merchantcategory` (`merchantcategorycode`,`merchantcategorydescription`) VALUES (3000,'Hotels');
INSERT INTO `merchantcategory` (`merchantcategorycode`,`merchantcategorydescription`) VALUES (3456,'Car Rentals');

INSERT INTO `financialtransactions` (`transactionid`,`accountid`,`cardid`,`currencycode`,`merchantid`,`transactiontypecode`,`transactiondate`,`transactionammount`,`transactiontype_idtransactiontypecode`,`customercards_cardid`,`merchants_merchantid`,`currencycodes_currencycode`) VALUES (1,'1210412713','1','USD','1','C','01/21/2017','158','C',1,1,'USD');
INSERT INTO `financialtransactions` (`transactionid`,`accountid`,`cardid`,`currencycode`,`merchantid`,`transactiontypecode`,`transactiondate`,`transactionammount`,`transactiontype_idtransactiontypecode`,`customercards_cardid`,`merchants_merchantid`,`currencycodes_currencycode`) VALUES (2,'1210412714','2','INR','2','C','02/04/2017','178','C',2,2,'INR');
INSERT INTO `financialtransactions` (`transactionid`,`accountid`,`cardid`,`currencycode`,`merchantid`,`transactiontypecode`,`transactiondate`,`transactionammount`,`transactiontype_idtransactiontypecode`,`customercards_cardid`,`merchants_merchantid`,`currencycodes_currencycode`) VALUES (3,'1210412715','3','EUR','3','A','04/03/2018','10000','A',3,3,'EUR');

INSERT INTO `customes` (`customerid`,`countrycode`,`firstname`,`lastname`,`address`,`phone`,`mail`,`countrycodes_countrycode`) VALUES (1,'as','puneeth','devabhaktuni','UT','3302120534','puneeth@gmail.com','as');
INSERT INTO `customes` (`customerid`,`countrycode`,`firstname`,`lastname`,`address`,`phone`,`mail`,`countrycodes_countrycode`) VALUES (2,'cn','tim','cook','UTN','6576787656','tim@gmail.com','cn');
INSERT INTO `customes` (`customerid`,`countrycode`,`firstname`,`lastname`,`address`,`phone`,`mail`,`countrycodes_countrycode`) VALUES (3,'in','Kumar','paul','CG','3467898767','kpaul@gmail.com','in');

INSERT INTO `customercards` (`cardid`,`cardtypecode`,`currencycode`,`customerid`,`cardnumber`,`cardvalidfrom`,`cardvalidthrough`,`othercardetails`,`cardtypes_cardtypecode`,`currencycodes_currencycode`,`customes_customerid`) VALUES (1,'AX','USD','1','1111111111111111','01/2020','01/2021','101','AX','USD',1);
INSERT INTO `customercards` (`cardid`,`cardtypecode`,`currencycode`,`customerid`,`cardnumber`,`cardvalidfrom`,`cardvalidthrough`,`othercardetails`,`cardtypes_cardtypecode`,`currencycodes_currencycode`,`customes_customerid`) VALUES (2,'DS','EUR','3','2222222222222222','06/2021','06/2032','102','DS','EUR',3);
INSERT INTO `customercards` (`cardid`,`cardtypecode`,`currencycode`,`customerid`,`cardnumber`,`cardvalidfrom`,`cardvalidthrough`,`othercardetails`,`cardtypes_cardtypecode`,`currencycodes_currencycode`,`customes_customerid`) VALUES (3,'VI','INR','2','3333333333333333','07/2021','07/2134','103','VI','INR',2);

INSERT INTO `currencycodes` (`currencycode`,`currencydescription`) VALUES ('CNY','China');
INSERT INTO `currencycodes` (`currencycode`,`currencydescription`) VALUES ('EUR','Monaco');
INSERT INTO `currencycodes` (`currencycode`,`currencydescription`) VALUES ('INR','India');
INSERT INTO `currencycodes` (`currencycode`,`currencydescription`) VALUES ('USD','America');

INSERT INTO `countrycodes` (`countrycode`,`countryname`) VALUES ('as','america');
INSERT INTO `countrycodes` (`countrycode`,`countryname`) VALUES ('cn','china');
INSERT INTO `countrycodes` (`countrycode`,`countryname`) VALUES ('in','india');
INSERT INTO `countrycodes` (`countrycode`,`countryname`) VALUES ('mc','monaco');

INSERT INTO `cardtypes` (`cardtypecode`,`cardtypedescription`) VALUES ('AX ','American Express');
INSERT INTO `cardtypes` (`cardtypecode`,`cardtypedescription`) VALUES ('CA','Master Card');
INSERT INTO `cardtypes` (`cardtypecode`,`cardtypedescription`) VALUES ('DS','Discover');
INSERT INTO `cardtypes` (`cardtypecode`,`cardtypedescription`) VALUES ('VI','Visa');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
