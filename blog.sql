-- MySQL Script generated by MySQL Workbench
-- Tue Sep  6 10:20:40 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`article` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(70) NULL,
  `contenu` LONGTEXT NULL,
  `court` LONGTEXT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`categories` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`article_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`article_categories` (
  `article_ID` INT NOT NULL,
  `categories_ID` INT NOT NULL,
  PRIMARY KEY (`article_ID`, `categories_ID`),
  INDEX `fk_article_has_categories_categories1_idx` (`categories_ID` ASC) VISIBLE,
  INDEX `fk_article_has_categories_article_idx` (`article_ID` ASC) VISIBLE,
  CONSTRAINT `fk_article_has_categories_article`
    FOREIGN KEY (`article_ID`)
    REFERENCES `blog`.`article` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_has_categories_categories1`
    FOREIGN KEY (`categories_ID`)
    REFERENCES `blog`.`categories` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`tags` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `mot` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`tags_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`tags_article` (
  `tags_ID` INT NOT NULL,
  `article_ID` INT NOT NULL,
  PRIMARY KEY (`tags_ID`, `article_ID`),
  INDEX `fk_tags_has_article_article1_idx` (`article_ID` ASC) VISIBLE,
  INDEX `fk_tags_has_article_tags1_idx` (`tags_ID` ASC) VISIBLE,
  CONSTRAINT `fk_tags_has_article_tags1`
    FOREIGN KEY (`tags_ID`)
    REFERENCES `blog`.`tags` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_has_article_article1`
    FOREIGN KEY (`article_ID`)
    REFERENCES `blog`.`article` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`commentaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`commentaires` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `pseudo` VARCHAR(45) NULL,
  `site` VARCHAR(255) NULL,
  `mail` VARCHAR(255) NULL,
  `contenu` LONGTEXT NULL,
  `article_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_commentaires_article1_idx` (`article_ID` ASC) VISIBLE,
  CONSTRAINT `fk_commentaires_article1`
    FOREIGN KEY (`article_ID`)
    REFERENCES `blog`.`article` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`user` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NULL,
  `pass` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;