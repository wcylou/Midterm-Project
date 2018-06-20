-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema midterm
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `midterm` ;

-- -----------------------------------------------------
-- Schema midterm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `midterm` DEFAULT CHARACTER SET utf8 ;
USE `midterm` ;

-- -----------------------------------------------------
-- Table `midterm`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`location` ;

CREATE TABLE IF NOT EXISTS `midterm`.`location` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `state` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `address2` VARCHAR(45) NULL DEFAULT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `midterm`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`event` ;

CREATE TABLE IF NOT EXISTS `midterm`.`event` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `location_id` INT(11) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_location_idx` (`location_id` ASC),
  CONSTRAINT `fk_event_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `midterm`.`location` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `midterm`.`interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`interest` ;

CREATE TABLE IF NOT EXISTS `midterm`.`interest` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `midterm`.`event_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`event_interest` ;

CREATE TABLE IF NOT EXISTS `midterm`.`event_interest` (
  `event_id` INT(11) NOT NULL,
  `interest_id` INT(11) NOT NULL,
  PRIMARY KEY (`event_id`, `interest_id`),
  INDEX `fk_event_interest_interest_idx` (`interest_id` ASC),
  CONSTRAINT `fk_event_interest_interest`
    FOREIGN KEY (`interest_id`)
    REFERENCES `midterm`.`interest` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_event_interest_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `midterm`.`event` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `midterm`.`membership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`membership` ;

CREATE TABLE IF NOT EXISTS `midterm`.`membership` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(4,0) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `midterm`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`user` ;

CREATE TABLE IF NOT EXISTS `midterm`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `access` INT(11) NOT NULL DEFAULT '1',
  `membership_id` INT(11) NOT NULL DEFAULT '1',
  `active` INT(11) NOT NULL DEFAULT '1',
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `membership_id_idx` (`membership_id` ASC),
  CONSTRAINT `fk_user_membership`
    FOREIGN KEY (`membership_id`)
    REFERENCES `midterm`.`membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `midterm`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`profile` ;

CREATE TABLE IF NOT EXISTS `midterm`.`profile` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `sexual_orientation` VARCHAR(45) NULL DEFAULT NULL,
  `about_me` VARCHAR(45) NULL DEFAULT NULL,
  `location_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `picture_url` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_profile_idx` (`user_id` ASC),
  INDEX `fk_profile_location_idx` (`location_id` ASC),
  CONSTRAINT `fk_profile_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `midterm`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `midterm`.`location` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `midterm`.`match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`match` ;

CREATE TABLE IF NOT EXISTS `midterm`.`match` (
  `profile_id` INT(11) NOT NULL,
  `match_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`profile_id`),
  INDEX `fk_match_match_idx` (`match_id` ASC),
  INDEX `fk_match_event_idx` (`event_id` ASC),
  CONSTRAINT `fk_match_profile`
    FOREIGN KEY (`profile_id`)
    REFERENCES `midterm`.`profile` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_match`
    FOREIGN KEY (`match_id`)
    REFERENCES `midterm`.`profile` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `midterm`.`event` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `midterm`.`profile_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`profile_interest` ;

CREATE TABLE IF NOT EXISTS `midterm`.`profile_interest` (
  `profile_id` INT(11) NOT NULL,
  `interest_id` INT(11) NOT NULL,
  PRIMARY KEY (`profile_id`, `interest_id`),
  INDEX `fk_profile_interest_interest_idx` (`interest_id` ASC),
  CONSTRAINT `fk_profile_interest_profile`
    FOREIGN KEY (`profile_id`)
    REFERENCES `midterm`.`profile` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_profile_interest_interest`
    FOREIGN KEY (`interest_id`)
    REFERENCES `midterm`.`interest` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
