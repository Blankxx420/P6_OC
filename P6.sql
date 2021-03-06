-- MySQL Script generated by MySQL Workbench
-- Fri Dec 11 17:04:46 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema P6DB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `P6DB` ;

-- -----------------------------------------------------
-- Schema P6DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `P6DB` ;
USE `P6DB` ;

-- -----------------------------------------------------
-- Table `P6DB`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Adress` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `floor` VARCHAR(45) NULL,
  `road` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postalcode` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `Role_id` INT NOT NULL,
  `Adress_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_Role_idx` (`Role_id` ASC) VISIBLE,
  INDEX `fk_User_Adress1_idx` (`Adress_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role`
    FOREIGN KEY (`Role_id`)
    REFERENCES `P6DB`.`Role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Adress1`
    FOREIGN KEY (`Adress_id`)
    REFERENCES `P6DB`.`Adress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`User_Adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`User_Adress` (
  `User_id` INT NOT NULL,
  `Adress_id` INT NOT NULL,
  PRIMARY KEY (`User_id`, `Adress_id`),
  INDEX `fk_User_has_Adress_Adress1_idx` (`Adress_id` ASC) VISIBLE,
  INDEX `fk_User_has_Adress_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Adress_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `P6DB`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Adress_Adress1`
    FOREIGN KEY (`Adress_id`)
    REFERENCES `P6DB`.`Adress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `Adress_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Restaurant_Adress1_idx` (`Adress_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurant_Adress1`
    FOREIGN KEY (`Adress_id`)
    REFERENCES `P6DB`.`Adress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Right`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Right` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Role_has_Right`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Role_has_Right` (
  `Role_id` INT NOT NULL,
  `Right_id` INT NOT NULL,
  PRIMARY KEY (`Role_id`, `Right_id`),
  INDEX `fk_Role_has_Right_Right1_idx` (`Right_id` ASC) VISIBLE,
  INDEX `fk_Role_has_Right_Role1_idx` (`Role_id` ASC) VISIBLE,
  CONSTRAINT `fk_Role_has_Right_Role1`
    FOREIGN KEY (`Role_id`)
    REFERENCES `P6DB`.`Role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Role_has_Right_Right1`
    FOREIGN KEY (`Right_id`)
    REFERENCES `P6DB`.`Right` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`payment_mode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`payment_mode` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Delevery_mode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Delevery_mode` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Command`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Command` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_creation` DATETIME NULL,
  `Status_id` INT NOT NULL,
  `payment_mode_id` INT NOT NULL,
  `Delevery_mode_id` INT NOT NULL,
  `Adress_id` INT NOT NULL,
  `Restaurant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Command_Status1_idx` (`Status_id` ASC) VISIBLE,
  INDEX `fk_Command_payment_mode1_idx` (`payment_mode_id` ASC) VISIBLE,
  INDEX `fk_Command_Delevery_mode1_idx` (`Delevery_mode_id` ASC) VISIBLE,
  INDEX `fk_Command_Adress1_idx` (`Adress_id` ASC) VISIBLE,
  INDEX `fk_Command_Restaurant1_idx` (`Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Command_Status1`
    FOREIGN KEY (`Status_id`)
    REFERENCES `P6DB`.`Status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Command_payment_mode1`
    FOREIGN KEY (`payment_mode_id`)
    REFERENCES `P6DB`.`payment_mode` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Command_Delevery_mode1`
    FOREIGN KEY (`Delevery_mode_id`)
    REFERENCES `P6DB`.`Delevery_mode` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Command_Adress1`
    FOREIGN KEY (`Adress_id`)
    REFERENCES `P6DB`.`Adress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Command_Restaurant1`
    FOREIGN KEY (`Restaurant_id`)
    REFERENCES `P6DB`.`Restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `unit-mesure` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Stock` (
  `Restaurant_id` INT NOT NULL,
  `Product_id` INT NOT NULL,
  `quantity` VARCHAR(45) NULL,
  `unit-mesure` VARCHAR(45) NULL,
  PRIMARY KEY (`Restaurant_id`, `Product_id`),
  INDEX `fk_Restaurant_has_Product_Product1_idx` (`Product_id` ASC) VISIBLE,
  INDEX `fk_Restaurant_has_Product_Restaurant1_idx` (`Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurant_has_Product_Restaurant1`
    FOREIGN KEY (`Restaurant_id`)
    REFERENCES `P6DB`.`Restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurant_has_Product_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `P6DB`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Menu` (
  `Product_id` INT NOT NULL,
  `Restaurant_id` INT NOT NULL,
  `prix/u-ht` DECIMAL(10,2) NULL,
  `prix/u-ttc` DECIMAL(10,2) NULL,
  PRIMARY KEY (`Product_id`, `Restaurant_id`),
  INDEX `fk_Product_has_Restaurant_Restaurant1_idx` (`Restaurant_id` ASC) VISIBLE,
  INDEX `fk_Product_has_Restaurant_Product1_idx` (`Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_has_Restaurant_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `P6DB`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Restaurant_Restaurant1`
    FOREIGN KEY (`Restaurant_id`)
    REFERENCES `P6DB`.`Restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `P6DB`.`Recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Recipe` (
  `Product_id` INT NOT NULL,
  `Product_id1` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `quantity` VARCHAR(45) NULL,
  `unit-mesure` VARCHAR(45) NULL,
  PRIMARY KEY (`Product_id`, `Product_id1`),
  INDEX `fk_Product_has_Product_Product2_idx` (`Product_id1` ASC) VISIBLE,
  INDEX `fk_Product_has_Product_Product1_idx` (`Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_has_Product_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `P6DB`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Product_Product2`
    FOREIGN KEY (`Product_id1`)
    REFERENCES `P6DB`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Basket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Basket` (
  `Command_id` INT NOT NULL,
  `Product_id` INT NOT NULL,
  `quantity` VARCHAR(45) NULL,
  `price_ttc` DECIMAL(10,2) NULL,
  `price/u-ttc` DECIMAL(10,2) NULL,
  PRIMARY KEY (`Command_id`, `Product_id`),
  INDEX `fk_Command_has_Product_Product1_idx` (`Product_id` ASC) VISIBLE,
  INDEX `fk_Command_has_Product_Command1_idx` (`Command_id` ASC) VISIBLE,
  CONSTRAINT `fk_Command_has_Product_Command1`
    FOREIGN KEY (`Command_id`)
    REFERENCES `P6DB`.`Command` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Command_has_Product_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `P6DB`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Facture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Facture` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `Command_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Facture_Command1_idx` (`Command_id` ASC) VISIBLE,
  CONSTRAINT `fk_Facture_Command1`
    FOREIGN KEY (`Command_id`)
    REFERENCES `P6DB`.`Command` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`User_has_Command`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`User_has_Command` (
  `User_id` INT NOT NULL,
  `Command_id` INT NOT NULL,
  PRIMARY KEY (`User_id`, `Command_id`),
  INDEX `fk_User_has_Command1_Command1_idx` (`Command_id` ASC) VISIBLE,
  INDEX `fk_User_has_Command1_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Command1_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `P6DB`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Command1_Command1`
    FOREIGN KEY (`Command_id`)
    REFERENCES `P6DB`.`Command` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Product_has_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Product_has_Product` (
  `Product_id` INT NOT NULL,
  `Product_id1` INT NOT NULL,
  PRIMARY KEY (`Product_id`, `Product_id1`),
  INDEX `fk_Product_has_Product_Product4_idx` (`Product_id1` ASC) VISIBLE,
  INDEX `fk_Product_has_Product_Product3_idx` (`Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_has_Product_Product3`
    FOREIGN KEY (`Product_id`)
    REFERENCES `P6DB`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Product_Product4`
    FOREIGN KEY (`Product_id1`)
    REFERENCES `P6DB`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `P6DB`.`Product_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `P6DB`.`Product_has_category` (
  `Product_id` INT NOT NULL,
  `category_category_id` INT NOT NULL,
  PRIMARY KEY (`Product_id`, `category_category_id`),
  INDEX `fk_Product_has_category_category1_idx` (`category_category_id` ASC) VISIBLE,
  INDEX `fk_Product_has_category_Product1_idx` (`Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_has_category_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `P6DB`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_category_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `P6DB`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
