-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema camptastic
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `camptastic` ;

-- -----------------------------------------------------
-- Schema camptastic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `camptastic` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `camptastic` ;

-- -----------------------------------------------------
-- Table `camptastic`.`wishlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camptastic`.`wishlist` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camptastic`.`wishlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchandise_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_wishlist_merchandise1`
    FOREIGN KEY (`merchandise_id`)
    REFERENCES `camptastic`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_wishlist_merchandise1_idx` ON `camptastic`.`wishlist` (`merchandise_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `camptastic`.`purchased_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camptastic`.`purchased_items` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camptastic`.`purchased_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `items_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_purchased_items_items1`
    FOREIGN KEY (`items_id`)
    REFERENCES `camptastic`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_purchased_items_items1_idx` ON `camptastic`.`purchased_items` (`items_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `camptastic`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camptastic`.`User` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camptastic`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(125) NOT NULL,
  `password` VARCHAR(150) NOT NULL,
  `rating` VARCHAR(45) NULL,
  `role` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `wishlist_id` INT NULL,
  `purchased_items_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_User_wishlist1`
    FOREIGN KEY (`wishlist_id`)
    REFERENCES `camptastic`.`wishlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_purchased_items1`
    FOREIGN KEY (`purchased_items_id`)
    REFERENCES `camptastic`.`purchased_items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_User_wishlist1_idx` ON `camptastic`.`User` (`wishlist_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_User_purchased_items1_idx` ON `camptastic`.`User` (`purchased_items_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `camptastic`.`item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camptastic`.`item` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camptastic`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `User_id` INT NOT NULL,
  `quantity` VARCHAR(45) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `image` VARCHAR(1200) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_merchandise_User`
    FOREIGN KEY (`User_id`)
    REFERENCES `camptastic`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_merchandise_User_idx` ON `camptastic`.`item` (`User_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `camptastic`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camptastic`.`category` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camptastic`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_category_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `camptastic`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_category_item1_idx` ON `camptastic`.`category` (`item_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `camptastic`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camptastic`.`comments` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camptastic`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(1500) NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comments_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `camptastic`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_comments_item1_idx` ON `camptastic`.`comments` (`item_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `camptastic`.`User_has_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camptastic`.`User_has_comments` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camptastic`.`User_has_comments` (
  `User_id` INT NOT NULL,
  `comments_id` INT NOT NULL,
  PRIMARY KEY (`User_id`, `comments_id`),
  CONSTRAINT `fk_User_has_comments_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `camptastic`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_comments_comments1`
    FOREIGN KEY (`comments_id`)
    REFERENCES `camptastic`.`comments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_User_has_comments_comments1_idx` ON `camptastic`.`User_has_comments` (`comments_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_User_has_comments_User1_idx` ON `camptastic`.`User_has_comments` (`User_id` ASC);

SHOW WARNINGS;
SET SQL_MODE = '';
DROP USER IF EXISTS camper@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SHOW WARNINGS;
CREATE USER 'camper'@'localhost' IDENTIFIED BY 'camper';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `camptastic`.* TO 'camper'@'localhost';
SHOW WARNINGS;

-- -----------------------------------------------------
-- Data for table `camptastic`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `camptastic`;
INSERT INTO `camptastic`.`User` (`id`, `username`, `email`, `password`, `rating`, `role`, `first_name`, `last_name`, `wishlist_id`, `purchased_items_id`) VALUES (1, 'julian_king', 'jk@email.com', 'password', NULL, 'admin', 'julian', 'king', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `camptastic`.`item`
-- -----------------------------------------------------
START TRANSACTION;
USE `camptastic`;
INSERT INTO `camptastic`.`item` (`id`, `name`, `User_id`, `quantity`, `description`, `image`) VALUES (1, 'boots', 1, '1', 'Mens, size 8, keen, lightly used', 'https://images-ext-2.discordapp.net/external/O17w1uriq5yNrFI_EFczRTaEB7OLp0SLnJrtG9YDlwc/%3Fsw%3D700%26sh%3D700%26sm%3Dfit/https/www.keenfootwear.com/dw/image/v2/BBCF_PRD/on/demandware.static/-/Sites-keen_catalog_master/default/dw03e1bb22/product-images/M-LANSING-MID-WP/1022098/1022098_P_PDP.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `camptastic`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `camptastic`;
INSERT INTO `camptastic`.`category` (`id`, `category_name`, `item_id`) VALUES (1, 'hiking', 1);
INSERT INTO `camptastic`.`category` (`id`, `category_name`, `item_id`) VALUES (2, 'apparel', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `camptastic`.`comments`
-- -----------------------------------------------------
START TRANSACTION;
USE `camptastic`;
INSERT INTO `camptastic`.`comments` (`id`, `text`, `item_id`) VALUES (1, 'Nice boots!!', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `camptastic`.`User_has_comments`
-- -----------------------------------------------------
START TRANSACTION;
USE `camptastic`;
INSERT INTO `camptastic`.`User_has_comments` (`User_id`, `comments_id`) VALUES (1, 1);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
