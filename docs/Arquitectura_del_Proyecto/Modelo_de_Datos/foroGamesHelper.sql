-- MySQL Script generated by MySQL Workbench
-- Sat Oct 29 12:22:13 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ForoGamesHelper
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ForoGamesHelper` ;

-- -----------------------------------------------------
-- Schema ForoGamesHelper
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ForoGamesHelper` DEFAULT CHARACTER SET utf8 ;
USE `ForoGamesHelper` ;

-- -----------------------------------------------------
-- Table `ForoGamesHelper`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ForoGamesHelper`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `ForoGamesHelper`.`usuarios` (
  `id` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `activo` TINYINT NULL DEFAULT 1,
  `fecha_registro` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ForoGamesHelper`.`juegos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ForoGamesHelper`.`juegos` ;

CREATE TABLE IF NOT EXISTS `ForoGamesHelper`.`juegos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `compania` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  `coop` VARCHAR(45) NULL,
  `anio_salida` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ForoGamesHelper`.`posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ForoGamesHelper`.`posts` ;

CREATE TABLE IF NOT EXISTS `ForoGamesHelper`.`posts` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `contenido` LONGTEXT NULL,
  `fecha_creacion` DATE NULL,
  `usuarios_id` INT NOT NULL,
  `juegos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_usuarios1_idx` (`usuarios_id` ASC),
  INDEX `fk_posts_juegos1_idx` (`juegos_id` ASC),
  CONSTRAINT `fk_posts_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `ForoGamesHelper`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_juegos1`
    FOREIGN KEY (`juegos_id`)
    REFERENCES `ForoGamesHelper`.`juegos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ForoGamesHelper`.`comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ForoGamesHelper`.`comentarios` ;

CREATE TABLE IF NOT EXISTS `ForoGamesHelper`.`comentarios` (
  `id` INT NOT NULL,
  `comentario` VARCHAR(300) NULL,
  `usuarios_id` INT NOT NULL,
  `posts_id` INT NULL,
  `juegos_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comentarios_usuarios_idx` (`usuarios_id` ASC),
  INDEX `fk_comentarios_posts1_idx` (`posts_id` ASC),
  INDEX `fk_comentarios_juegos1_idx` (`juegos_id` ASC),
  CONSTRAINT `fk_comentarios_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `ForoGamesHelper`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `ForoGamesHelper`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_juegos1`
    FOREIGN KEY (`juegos_id`)
    REFERENCES `ForoGamesHelper`.`juegos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;