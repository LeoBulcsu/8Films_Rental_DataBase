-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema 8Films_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 8Films_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `8Films_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `8Films_db` ;

-- -----------------------------------------------------
-- Table `8Films_db`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`actors` (
  `_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `actor_id` (`actor_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`categories` (
  `_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `category_id` (`category_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`clients` (
  `_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `phone` TEXT NULL DEFAULT NULL,
  `email` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `cusotmer_id` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`films` (
  `_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `original_language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `film_id` (`film_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`language` (
  `_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `language_id` (`language_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`hdddf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`hdddf` (
  `_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `category_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  `lang_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  INDEX `actor_id_idx` (`actor_id` ASC) VISIBLE,
  INDEX `categories_idx` (`category_id` ASC) VISIBLE,
  INDEX `languages_idx` (`lang_id` ASC) VISIBLE,
  CONSTRAINT `film_id`
    FOREIGN KEY (`film_id`)
    REFERENCES `8Films_db`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `actor_id`
    FOREIGN KEY (`actor_id`)
    REFERENCES `8Films_db`.`actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `8Films_db`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `languages`
    FOREIGN KEY (`lang_id`)
    REFERENCES `8Films_db`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`stores` (
  `_id` INT NOT NULL,
  `Store_ID` INT NOT NULL,
  `Address` TEXT NULL DEFAULT NULL,
  `Phone` INT NULL DEFAULT NULL,
  `email` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `store_id` (`Store_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`inventory` (
  `_id` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `inventory_id` (`inventory_id` ASC) VISIBLE,
  INDEX `store_id_idx` (`store_id` ASC) VISIBLE,
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `store_id`
    FOREIGN KEY (`store_id`)
    REFERENCES `8Films_db`.`stores` (`Store_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `film_id_fk`
    FOREIGN KEY (`film_id`)
    REFERENCES `8Films_db`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`staff` (
  `_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `surname` TEXT NULL DEFAULT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `phone` TEXT NULL DEFAULT NULL,
  `email` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `staff_id` (`staff_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`rental_invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`rental_invoice` (
  `_id` INT NOT NULL,
  `rental_id` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `rental_date` TEXT NULL DEFAULT NULL,
  `rental_time` TEXT NULL DEFAULT NULL,
  `return_date` TEXT NULL DEFAULT NULL,
  `return_time` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `staff_id_idx` (`staff_id` ASC) VISIBLE,
  INDEX `inventory_id_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `8Films_db`.`clients` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff_id`
    FOREIGN KEY (`staff_id`)
    REFERENCES `8Films_db`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `inventory_id`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `8Films_db`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
