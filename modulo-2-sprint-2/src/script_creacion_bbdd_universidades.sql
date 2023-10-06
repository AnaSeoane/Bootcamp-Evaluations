-- -----------------------------------------------------
-- Schema universidades
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `universidades` DEFAULT CHARACTER SET utf8 ;
USE `universidades` ;

-- -----------------------------------------------------
-- Table `universidades`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidades`.`paises` (
  `idestado` INT NOT NULL AUTO_INCREMENT,
  `nombre_pais` VARCHAR(45) NULL,
  `nombre_provincia` VARCHAR(45) NULL,
  `latitud` DECIMAL(10, 7) NULL,
  `longitud` DECIMAL(11, 7) NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `universidades`.`universidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidades`.`universidades` (
  `iduniversidades` INT NOT NULL AUTO_INCREMENT,
  `nombre_universidad` VARCHAR(100) NULL,
  `pagina_web` VARCHAR(100) NULL,
  `paises_idestado` INT NOT NULL,
  PRIMARY KEY (`iduniversidades`),
  CONSTRAINT `fk_universidades_paises`
    FOREIGN KEY (`paises_idestado`)
    REFERENCES `universidades`.`paises` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
