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
  `gender` ENUM('Man', 'Woman') NULL DEFAULT NULL,
  `sexual_orientation` ENUM('Heterosexual', 'Homosexual', 'Bisexual') NULL DEFAULT NULL,
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
-- Table `midterm`.`user_match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `midterm`.`user_match` ;

CREATE TABLE IF NOT EXISTS `midterm`.`user_match` (
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


-- -----------------------------------------------------
-- Data for table `midterm`.`interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (1, 'Food');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (2, 'Music');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (3, 'Tattoo');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (4, 'America');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (5, 'Children');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (6, 'Health');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (7, 'Sports');
INSERT INTO `midterm`.`interest` (`id`, `name`) VALUES (8, 'Comedy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`event_interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (1, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (2, 7);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (2, 1);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (2, 4);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (3, 1);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (3, 4);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (4, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (5, 3);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (6, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (7, 1);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (7, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (8, 7);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (8, 1);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (8, 4);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (9, 8);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (10, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (11, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (12, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (13, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (14, 1);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (14, 4);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (14, 7);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (15, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (16, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (17, 2);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (18, 8);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (19, 6);
INSERT INTO `midterm`.`event_interest` (`event_id`, `interest_id`) VALUES (20, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`membership`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`membership` (`id`, `name`, `price`) VALUES (1, 'Bronze', 0.00);
INSERT INTO `midterm`.`membership` (`id`, `name`, `price`) VALUES (2, 'Silver', 4.99);
INSERT INTO `midterm`.`membership` (`id`, `name`, `price`) VALUES (3, 'Gold', 9.99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (1, 'user', 'password', 1, 1, 1, 'a@a.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (2, 'notadmin', 'password', 0, 1, 1, 'notadmin@notadmin.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (3, '3', '3', 0, 1, 1, 'a@a.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (4, '4', '4', 0, 1, 1, 'b@b.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (5, '5', '5', 0, 1, 1, 'c@c.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (6, '6', '6', 0, 1, 1, 'd@d.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (7, '7', '7', 0, 1, 1, 'e@e.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (8, '8', '8', 0, 1, 1, 'f@f.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (9, '9', '9', 0, 1, 1, 'g@g.com');
INSERT INTO `midterm`.`user` (`id`, `username`, `password`, `access`, `membership_id`, `active`, `email`) VALUES (10, '10', '10', 0, 1, 1, 'h@h.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (1, 'Wilson', 'Lou', 26, 'Man', 'Heterosexual', 'I do stuff.', 1, 1, 'asdfsdf', 18, 88);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (2, 'Someone', 'asdf', 18, 'Man', 'Bisexual', 'aaa', 2, 2, 'asdf', 40, 45);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (3, 'Another', 'words', 43, 'Man', 'Bisexual', 'a', 3, 3, 'asdf', 18, 100);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (4, 'Better not match this one', 'Person', 12, 'Woman', 'Bisexual', 'a', 4, 4, 'aasdf', 1, 100);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (5, 'Test', 'Test', 25, 'Woman', 'Homosexual', 'a', 5, 5, 'asdf', 18, 80);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (6, 'AnotherTest', 'Asfasfsdll', 30, 'Woman', 'Heterosexual', 'asdf', 6, 6, 'asdf', 18, 80);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (7, 'Freddie', 'Mercury', 45, 'Man', 'Homosexual', 'Stuff', 9, 6, 'http://archive.altweeklies.com/imager/freddie-mercurys-swagger-remains-powerful-20-years-after-his-passing/b/main/6492922/8380/MercuryTEASE.jpg', 25, 50);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (8, 'Dwayne', 'Johnson', 46, 'Man', 'Heterosexual', 'The Rock', 10, 6, 'http://www.gstatic.com/tv/thumb/persons/235135/235135_v9_ba.jpg', 25, 60);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (9, 'Alice', 'Cooper', 67, 'Man', 'Heterosexual', 'asdf', 11, 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Alice_Cooper_2015.jpg/440px-Alice_Cooper_2015.jpg', 45, 80);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (10, 'Angelina', 'Jolie', 50, 'Woman', 'Bisexual', 'asdf', 12, 6, 'https://amp.thisisinsider.com/images/59790f12232dfa2d008b4573-640-480.jpg', 22, 55);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (11, 'Megan', 'Fox', 30, 'Woman', 'Bisexual', 'asdf', 1, 6, 'https://amp.thisisinsider.com/images/5980c63e232dfa2d008b483a-640-480.jpg', 20, 40);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (12, 'Lady', 'Gaga', 35, 'Woman', 'Bisexual', 'asdf', 2, 6, 'https://amp.thisisinsider.com/images/59b017e752c08041008b4bb6-480-360.jpg', 25, 45);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (13, 'Jared', 'Groves', 28, 'Man', 'Heterosexual', 'fdasa', 3, 6, 'https://lh3.googleusercontent.com/A6vpVYAkV0WcSTRYAgixmQ0Jljn624njhdvu3oOvDUZ2b2hPHnzbVwulzDG67lB0wU5TNVoJMbGt=w856-h642-p-rw', 18, 40);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (14, 'Peter', 'Gabriel', 55, 'Man', 'Heterosexual', 'asdf', 4, 6, 'https://cps-static.rovicorp.com/3/JPG_400/MI0003/436/MI0003436833.jpg?partner=allrovi.com', 45, 70);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (15, 'Smorg', 'Borgenson', 40, 'Man', 'Heterosexual', 'asdf', 5, 6, 'asdf', 20, 50);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (16, 'Santa', 'Claus', 75, 'Man', 'Bisexual', 'asdf', 6, 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg/220px-Jonathan_G_Meath_portrays_Santa_Claus.jpg', 18, 150);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (17, 'Inigo', 'Montoya', 35, 'Man', 'Heterosexual', 'asdf', 7, 6, 'https://i.ytimg.com/vi/UCo-_QAGKTg/maxresdefault.jpg', 18, 60);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (18, 'John', 'Yossarian', 30, 'Man', 'Heterosexual', 'asdf', 8, 6, 'http://static.tvtropes.org/pmwiki/pub/images/catch_22_1.jpg', 18, 50);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (19, 'Gogo', 'Yubari', 18, 'Woman', 'Heterosexual', 'asdf', 9, 6, 'https://vignette.wikia.nocookie.net/killbill/images/9/99/Gogo_Slider_2.jpg/revision/latest?cb=20130201053902', 30, 70);
INSERT INTO `midterm`.`profile` (`id`, `first_name`, `last_name`, `age`, `gender`, `sexual_orientation`, `about_me`, `location_id`, `user_id`, `picture_url`, `min_age`, `max_age`) VALUES (20, 'Ned', 'Stark', 58, 'Man', 'Heterosexual', 'asdf', 10, 6, 'https://vignette.wikia.nocookie.net/marvelcrossroads/images/5/5f/Ned-Stark.png/revision/latest?cb=20170306202013', 18, 90);

COMMIT;


-- -----------------------------------------------------
-- Data for table `midterm`.`profile_interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm`;
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (1, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (1, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (1, 4);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (2, 5);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (2, 7);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (2, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (3, 6);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (4, 6);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (5, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (6, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (6, 2);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (6, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (6, 4);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (6, 5);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (6, 6);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (6, 7);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (7, 2);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (7, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (7, 4);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (8, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (8, 7);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (8, 2);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (9, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (9, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (9, 4);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (10, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (10, 2);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (11, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (11, 2);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (11, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (11, 4);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (11, 5);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (12, 6);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (12, 7);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (13, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (13, 2);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (13, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (14, 5);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (15, 7);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (16, 2);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (16, 5);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (16, 6);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (17, 2);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (17, 7);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (18, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (19, 1);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (19, 3);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (19, 5);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (20, 7);
INSERT INTO `midterm`.`profile_interest` (`profile_id`, `interest_id`) VALUES (20, 6);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
