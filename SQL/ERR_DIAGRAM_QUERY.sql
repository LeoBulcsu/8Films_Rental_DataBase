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
  `ID` INT NOT NULL,
  `actor_id` INT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ACT` (`actor_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`category` (
  `ID` INT NOT NULL,
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `CAT` (`category_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`customers` (
  `ID` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `phone` TEXT NULL DEFAULT NULL,
  `email` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `CUST` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`films` (
  `ID` INT NOT NULL,
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language_id` INT NOT NULL,
  `original_language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `category_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FILM` (`film_id` ASC) VISIBLE,
  INDEX `LANG` (`language_id` ASC) VISIBLE,
  INDEX `CAT` (`category_id` ASC) VISIBLE,
  INDEX `ACT` (`actor_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`stores` (
  `ID` INT NOT NULL,
  `Store_ID` INT NOT NULL,
  `Address` TEXT NULL DEFAULT NULL,
  `Phone` INT NULL DEFAULT NULL,
  `email` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `STORE` (`Store_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`staff` (
  `ID` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `surname` TEXT NULL DEFAULT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `phone` TEXT NULL DEFAULT NULL,
  `email` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `STAFF` (`staff_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`rental` (
  `ID` INT NOT NULL,
  `rental_id` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `rental_date` TEXT NULL DEFAULT NULL,
  `rental_time` TEXT NULL DEFAULT NULL,
  `return_date` TEXT NULL DEFAULT NULL,
  `return_time` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `customer_id`, `staff_id`),
  INDEX `RENT` (`rental_id` ASC) VISIBLE,
  INDEX `INVT` (`inventory_id` ASC) VISIBLE,
  INDEX `CUST` (`customer_id` ASC) VISIBLE,
  INDEX `STAFF` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `8Films_db`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `8Films_db`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`inventory` (
  `ID` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `rental_ID` INT NOT NULL,
  `rental_customer_id` INT NOT NULL,
  `rental_staff_id` INT NOT NULL,
  PRIMARY KEY (`ID`, `rental_ID`, `rental_customer_id`, `rental_staff_id`, `inventory_id`, `store_id`, `film_id`),
  INDEX `INVT` (`inventory_id` ASC) VISIBLE,
  INDEX `FILM` (`film_id` ASC) VISIBLE,
  INDEX `STORE` (`store_id` ASC) VISIBLE,
  INDEX `fk_inventory_rental1_idx` (`rental_ID` ASC, `rental_customer_id` ASC, `rental_staff_id` ASC, `inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_stores1`
    FOREIGN KEY (`store_id`)
    REFERENCES `8Films_db`.`stores` (`Store_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `8Films_db`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_rental1`
    FOREIGN KEY (`rental_ID` , `rental_customer_id` , `rental_staff_id` , `inventory_id`)
    REFERENCES `8Films_db`.`rental` (`rental_id` , `customer_id` , `staff_id` , `inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`language` (
  `ID` INT NOT NULL,
  `language_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `LANG` (`language_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`new_hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`new_hdd` (
  `ID` INT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `CAT` (`category_id` ASC) VISIBLE,
  INDEX `ACT` (`actor_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`films_has_actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`films_has_actors` (
  `films_ID` INT NOT NULL,
  `actor_ID` INT NOT NULL,
  PRIMARY KEY (`films_ID`, `actor_ID`),
  INDEX `fk_films_has_actor_actor1_idx` (`actor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_films_has_actor_films`
    FOREIGN KEY (`films_ID` , `actor_ID`)
    REFERENCES `8Films_db`.`films` (`film_id` , `actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_has_actor_actor1`
    FOREIGN KEY (`actor_ID`)
    REFERENCES `8Films_db`.`actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`films_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`films_has_category` (
  `films_ID` INT NOT NULL,
  `category_ID` INT NOT NULL,
  PRIMARY KEY (`films_ID`, `category_ID`),
  INDEX `fk_films_has_category_category1_idx` (`category_ID` ASC) VISIBLE,
  CONSTRAINT `fk_films_has_category_films1`
    FOREIGN KEY (`films_ID` , `category_ID`)
    REFERENCES `8Films_db`.`films` (`film_id` , `category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_has_category_category1`
    FOREIGN KEY (`category_ID`)
    REFERENCES `8Films_db`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`films_has_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`films_has_language` (
  `films_ID` INT NOT NULL,
  `language_ID` INT NOT NULL,
  PRIMARY KEY (`films_ID`, `language_ID`),
  INDEX `fk_films_has_language_language1_idx` (`language_ID` ASC) VISIBLE,
  CONSTRAINT `fk_films_has_language_films1`
    FOREIGN KEY (`films_ID` , `language_ID`)
    REFERENCES `8Films_db`.`films` (`film_id` , `language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_has_language_language1`
    FOREIGN KEY (`language_ID`)
    REFERENCES `8Films_db`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
