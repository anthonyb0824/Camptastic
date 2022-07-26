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
-- Table `camptastic`.`merchandise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camptastic`.`merchandise` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camptastic`.`merchandise` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;
SET SQL_MODE = '';
DROP USER IF EXISTS camper@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SHOW WARNINGS;
CREATE USER 'camper'@'localhost' IDENTIFIED BY 'camper';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `camptastic`.* TO 'camper'@'localhost';
SHOW WARNINGS;

-- -----------------------------------------------------
-- Data for table `camptastic`.`merchandise`
-- -----------------------------------------------------
START TRANSACTION;
USE `camptastic`;
INSERT INTO `camptastic`.`merchandise` (`id`, `name`) VALUES (1, 'name');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
