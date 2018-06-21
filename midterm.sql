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
  `zip_code` VARCHAR(5) NOT NULL,
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
  `description` LONGTEXT NOT NULL,
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
  `access` TINYINT(1) NOT NULL DEFAULT '1',
  `membership_id` INT(11) NOT NULL DEFAULT '1',
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `email` VARCHAR(1000) NOT NULL,
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
  `age` INT(3) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `sexual_orientation` VARCHAR(45) NULL DEFAULT NULL,
  `about_me` LONGTEXT NULL DEFAULT NULL,
  `location_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `picture_url` VARCHAR(2000) NULL DEFAULT NULL,
  `min_age` INT NULL,
  `max_age` INT NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `profile_id` INT(11) NOT NULL,
  `partner_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  INDEX `fk_match_match_idx` (`partner_id` ASC),
  INDEX `fk_match_event_idx` (`event_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_match_profile`
    FOREIGN KEY (`profile_id`)
    REFERENCES `midterm`.`profile` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_match`
    FOREIGN KEY (`partner_id`)
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

SET SQL_MODE = '';
GRANT USAGE ON *.* TO student;
 DROP USER student;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'student' IDENTIFIED BY 'student';

GRANT SELECT ON TABLE `mydb`.* TO 'student';
GRANT SELECT ON TABLE `midterm`.* TO 'student';
GRANT SELECT, INSERT, TRIGGER ON TABLE `mydb`.* TO 'student';
GRANT SELECT, INSERT, TRIGGER ON TABLE `midterm`.* TO 'student';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `mydb`.* TO 'student';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `midterm`.* TO 'student';

-- -----------------------------------------------------
-- Data for table `midterm`.`location`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (1, 'Colorado', 'Denver', '4335 W. 44th Ave.', NULL, '80212');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (2, 'Colorado', 'Denver', '2001 Blake St.', NULL, '80205');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (3, 'Colorado', 'Arvada', '17680 West 84th Place', NULL, '80007');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (4, 'Colorado', 'Englewood', '3295 S. Broadway', NULL, '80113');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (5, 'Wyoming', 'Cheyenne', '1 Depot Square Capitol & W 15th St', NULL, '82001');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (6, 'Colorado', 'Denver', '2721 Larimer St.', NULL, '80205');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (7, 'Colorado', 'Denver', '2637 Welton St.', NULL, '80205');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (8, 'Colorado', 'Denver', '1624 Market St.', NULL, '80202');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (9, 'Colorado', 'Denver', '4483 Logan St.', NULL, '80216');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (10, 'Colorado', 'Denver', '3602 E. Colfax Ave.', NULL, '80206');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (11, 'Colorado', 'Denver', '7 S. Broadway', NULL, '80209');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (12, 'Colorado', 'Denver', '608 E. 13th Ave.', NULL, '80203');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (13, 'Colorado', 'Denver', '314 E 13th Ave.', NULL, '80203');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (14, 'Colorado', 'Centennial', '8150 S University Blvd', 'Suite #120', '80122');
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (15, 'Colorado', 'Loveland', '150 East 29th Street', NULL, '80538');

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`event`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (1, 'The Faceless Concert', 1, '2018-07-01 20:00:00', 'Concert at The Oriental Theater');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (2, 'Rockies Game', 2, '2018-07-04 18:10:00', 'Colorado Rockies vs San Fransico Giants');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (3, 'Pie Baking Contest', 3, '2018-07-04 10:00:00', 'Leyden Rock\'s Annual 4th of July Bash');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (4, 'Younger Than Neil', 4, '2018-07-06 20:00:00', 'Concert at Moe\'s Original BBQ');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (5, '4-Ever West Tattoo Festival', 5, '2018-07-06 17:30:00', 'Tattoo Festival');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (6, 'Pile of Priests', 6, '2018-07-06 20:00:00', 'A concert... hopefully');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (7, 'Ballyhoo!', 7, '2018-07-10 20:00:00', 'with Bumpin Uglies, Tropidelic and more\nwith Bumpin Uglies, Tropidelic and more\nwith Bumpin Uglies, Tropidelic and more');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (8, 'Rockies Game', 2, '2018-07-10 18:40:00', 'Colorado Rockies vs. Arizona Diamondbacks');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (9, 'Black Buzzard Open Mic Comedy', 8, '2018-07-10 21:30:00', 'Hosted by Janae Burris');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (10, 'The Get Up Kids', 1, '2018-06-30 21:00:00', 'Concert At Oriental Theater');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (11, 'Greyhounds', 9, '2018-06-30 21:30:00', 'Concert At Globe Hall');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (12, 'Electric Six', 10, '2018-06-30 21:30:00', 'They wanna take you to a gay bar');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (13, 'Canyon of the Skull', 11, '2018-06-30 20:30:00', 'They sound like a nice band.');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (14, 'Rockies Game', 2, '2018-07-02 18:40:00', 'Colorado Rockies vs San Fransisco Giants');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (15, 'SmileEatingJesus', 12, '2018-07-02 21:00:00', 'Concert at Your Mom\'s House');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (16, 'Reggae Tuesdays', 7, '2018-07-17 19:15:00', 'At Cervantes\' Other Side');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (17, 'Slug Wife Takeover', 13, '2018-07-17 21:00:00', 'At The Black Box LLC');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (18, 'The Lituation', 11, '2018-07-17 21:00:00', 'At the hi-dive');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (19, 'BASIC CPR / AED Certification', 14, '2018-07-17 18:00:00', 'Have a productive date');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (20, 'Yes! You Can Adopt', 15, '2018-07-17 17:00:00', 'In case you\'re ready to move REALLY fast.');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
