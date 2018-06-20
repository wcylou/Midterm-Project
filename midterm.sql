-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
  `zip_code` INT NOT NULL,
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
  `description` VARCHAR(2000) NOT NULL DEFAULT 'Under Construction',
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
  `email` VARCHAR(100) NOT NULL,
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
  `about_me` VARCHAR(2000) NULL DEFAULT NULL,
  `location_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `picture_url` VARCHAR(200) NULL DEFAULT NULL,
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

GRANT SELECT ON TABLE `midterm`.* TO 'student';
GRANT SELECT, INSERT, TRIGGER ON TABLE `midterm`.* TO 'student';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `midterm`.* TO 'student';

-- -----------------------------------------------------
-- Data for table `midterm`.`location`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (1, 'Colorado', 'Denver', '123 Party Avenue', NULL, 80111);
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (2, 'Hawaii', 'Volcano', '555 Lava Road', NULL, 72939);
INSERT INTO `midterm`.`location` (`id`, `state`, `city`, `address`, `address2`, `zip_code`) VALUES (3, 'Vermont', 'Montpelier', '1 Cedar ct', 'APT 6', 98238);

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`event`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (1, 'Red Rocks Concert', 1, '2018-07-12', 'It\'s a concert.');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (2, 'Dinner', 2, '2018-06-23', 'FOOD');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (3, 'Football Game', 3, '2018-07-22', 'The kind where they hit eachother.');
INSERT INTO `midterm`.`event` (`id`, `name`, `location_id`, `date`, `description`) VALUES (4, 'Red Rocks Concert', 1, '2018-07-13', 'It\'s another concert.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (1, 'Gaming');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (2, 'Sports');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (3, 'Technology');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (4, 'Music');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (5, 'Movies');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (6, 'Food');

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`membership`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`membership` (`id`, `name`, `price`) VALUES (1, 'Bronze', 0);
INSERT INTO `midterm`.`membership` (`id`, `name`, `price`) VALUES (2, 'Silver', 4.99);
INSERT INTO `midterm`.`membership` (`id`, `name`, `price`) VALUES (3, 'Gold', 9.99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (1, 'admin', 'admin', 0, 3, 1, 'admin@admin.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (2, 'user1', 'user1', 1, 1, 1, 'user@user.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (3, 'inactive', 'inactive', 1, 2, 0, 'inactive@inactive.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`) VALUES (1, 'Wilson', 'Lou', 14, 'Indeterminate', 'Who knows?', 'Does stuff', 2, 2, NULL);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
