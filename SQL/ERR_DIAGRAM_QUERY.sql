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
  INDEX `actor` (`actor_id` ASC) VISIBLE)
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
  INDEX `category` (`category_id` ASC) VISIBLE)
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
  INDEX `CUSTOMER` (`customer_id` ASC) VISIBLE)
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
  INDEX `film_id` (`film_id` ASC) VISIBLE,
  INDEX `language_id` (`language_id` ASC) VISIBLE,
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  INDEX `actor_id` (`actor_id` ASC) VISIBLE)
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
-- Table `8Films_db`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`inventory` (
  `ID` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `store_id`, `inventory_id`, `film_id`),
  INDEX `STORE_idx` (`store_id` ASC) VISIBLE,
  INDEX `INVENTORY` (`inventory_id` ASC) VISIBLE,
  INDEX `FILMS` (`film_id` ASC) VISIBLE,
  CONSTRAINT `STORE`
    FOREIGN KEY (`store_id`)
    REFERENCES `8Films_db`.`stores` (`Store_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FILM_ID`
    FOREIGN KEY (`film_id`)
    REFERENCES `8Films_db`.`films` (`film_id`)
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
  INDEX `LANGUAGE` (`language_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`new_hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`new_hdd` (
  `ID` INT NOT NULL,
  `first_name` TEXT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`ID`))
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
  PRIMARY KEY (`ID`, `staff_id`, `customer_id`, `inventory_id`),
  INDEX `RENTAL` (`rental_id` ASC) VISIBLE,
  INDEX `INVENTORY` (`inventory_id` ASC) VISIBLE,
  INDEX `CUSTOMER` (`customer_id` ASC) VISIBLE,
  INDEX `STAFF` (`staff_id` ASC) VISIBLE,
  INDEX `STAFF_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `CUSTOMER`
    FOREIGN KEY (`customer_id`)
    REFERENCES `8Films_db`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `STAFF`
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


-- -----------------------------------------------------
-- Table `8Films_db`.`actors_has_films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`actors_has_films` (
  `actors_ID` INT NOT NULL,
  `films_ID` INT NOT NULL,
  PRIMARY KEY (`actors_ID`, `films_ID`),
  INDEX `fk_actors_has_films_films1_idx` (`films_ID` ASC) VISIBLE,
  CONSTRAINT `fk_actors_has_films_actors1`
    FOREIGN KEY (`actors_ID`)
    REFERENCES `8Films_db`.`actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actors_has_films_films1`
    FOREIGN KEY (`films_ID`)
    REFERENCES `8Films_db`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`language_has_films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`language_has_films` (
  `language_ID` INT NOT NULL,
  `films_ID` INT NOT NULL,
  PRIMARY KEY (`language_ID`, `films_ID`),
  INDEX `fk_language_has_films_films1_idx` (`films_ID` ASC) VISIBLE,
  CONSTRAINT `fk_language_has_films_language1`
    FOREIGN KEY (`language_ID`)
    REFERENCES `8Films_db`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_language_has_films_films1`
    FOREIGN KEY (`films_ID`)
    REFERENCES `8Films_db`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `8Films_db`.`category_has_films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8Films_db`.`category_has_films` (
  `category_ID` INT NOT NULL,
  `films_ID` INT NOT NULL,
  PRIMARY KEY (`category_ID`, `films_ID`),
  INDEX `fk_category_has_films_films1_idx` (`films_ID` ASC) VISIBLE,
  CONSTRAINT `fk_category_has_films_category1`
    FOREIGN KEY (`category_ID`)
    REFERENCES `8Films_db`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_films_films1`
    FOREIGN KEY (`films_ID`)
    REFERENCES `8Films_db`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
