-- MySQL Script generated by MySQL Workbench
-- Mon Oct 19 13:00:07 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_easychool
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_easychool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_easychool` DEFAULT CHARACTER SET utf8mb4 ;
USE `bd_easychool` ;

-- -----------------------------------------------------
-- Table `bd_easychool`.`tbPeriodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbPeriodo` (
  `idPeriodo` INT NOT NULL AUTO_INCREMENT,
  `periodo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeriodo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbNivelEducacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbNivelEducacao` (
  `idNivelEducacao` INT NOT NULL AUTO_INCREMENT,
  `nivel` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idNivelEducacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbEscola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbEscola` (
  `idEscola` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cep` CHAR(9) NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT(6) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `imgPerfil` VARCHAR(100) NULL,
  `cnpj` CHAR(18) NOT NULL,
  PRIMARY KEY (`idEscola`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbTurma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbTurma` (
  `idTurma` INT NOT NULL AUTO_INCREMENT,
  `serie` VARCHAR(45) NOT NULL,
  `totalVagas` INT(10) NOT NULL,
  `vagasOcupadas` INT(10) NOT NULL,
  `tbPeriodo_idPeriodo` INT NOT NULL,
  `tbNivelEducacao_idNivelEducacao` INT NOT NULL,
  `tbEscola_idEscola` INT NOT NULL,
  PRIMARY KEY (`idTurma`),
  INDEX `fk_tbTurma_tbPeriodo1_idx` (`tbPeriodo_idPeriodo` ASC) VISIBLE,
  INDEX `fk_tbTurma_tbNivelEducacao1_idx` (`tbNivelEducacao_idNivelEducacao` ASC) VISIBLE,
  INDEX `fk_tbTurma_tbEscola1_idx` (`tbEscola_idEscola` ASC) VISIBLE,
  CONSTRAINT `fk_tbTurma_tbPeriodo1`
    FOREIGN KEY (`tbPeriodo_idPeriodo`)
    REFERENCES `bd_easychool`.`tbPeriodo` (`idPeriodo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbTurma_tbNivelEducacao1`
    FOREIGN KEY (`tbNivelEducacao_idNivelEducacao`)
    REFERENCES `bd_easychool`.`tbNivelEducacao` (`idNivelEducacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbTurma_tbEscola1`
    FOREIGN KEY (`tbEscola_idEscola`)
    REFERENCES `bd_easychool`.`tbEscola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbFuncionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbFuncionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` CHAR(14) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  `adm` CHAR(1) NOT NULL,
  `tbEscola_idEscola` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  INDEX `fk_tbFuncionario_tbEscola1_idx` (`tbEscola_idEscola` ASC) VISIBLE,
  CONSTRAINT `fk_tbFuncionario_tbEscola1`
    FOREIGN KEY (`tbEscola_idEscola`)
    REFERENCES `bd_easychool`.`tbEscola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbTipoTelefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbTipoTelefone` (
  `idTipoTelefone` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoTelefone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbTelefoneEscola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbTelefoneEscola` (
  `idTelefoneEscola` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(16) NOT NULL,
  `tbEscola_idEscola` INT NOT NULL,
  `tbTipoTelefone_idTipoTelefone` INT NOT NULL,
  PRIMARY KEY (`idTelefoneEscola`),
  INDEX `fk_tbTelefoneEscola_tbEscola1_idx` (`tbEscola_idEscola` ASC) VISIBLE,
  INDEX `fk_tbTelefoneEscola_tbTipoTelefone1_idx` (`tbTipoTelefone_idTipoTelefone` ASC) VISIBLE,
  CONSTRAINT `fk_tbTelefoneEscola_tbEscola1`
    FOREIGN KEY (`tbEscola_idEscola`)
    REFERENCES `bd_easychool`.`tbEscola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbTelefoneEscola_tbTipoTelefone1`
    FOREIGN KEY (`tbTipoTelefone_idTipoTelefone`)
    REFERENCES `bd_easychool`.`tbTipoTelefone` (`idTipoTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbResponsavelAluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbResponsavelAluno` (
  `idResponsavelAluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `rg` CHAR(11) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idResponsavelAluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbTelefoneResponsavelAluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbTelefoneResponsavelAluno` (
  `idTelefoneResponsavelAluno` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(16) NOT NULL,
  `tbTipoTelefone_idTipoTelefone` INT NOT NULL,
  `tbResponsavelAluno_idResponsavelAluno` INT NOT NULL,
  PRIMARY KEY (`idTelefoneResponsavelAluno`),
  INDEX `fk_tbTelefoneResponsavelAluno_tbTipoTelefone1_idx` (`tbTipoTelefone_idTipoTelefone` ASC) VISIBLE,
  INDEX `fk_tbTelefoneResponsavelAluno_tbResponsavelAluno1_idx` (`tbResponsavelAluno_idResponsavelAluno` ASC) VISIBLE,
  CONSTRAINT `fk_tbTelefoneResponsavelAluno_tbTipoTelefone1`
    FOREIGN KEY (`tbTipoTelefone_idTipoTelefone`)
    REFERENCES `bd_easychool`.`tbTipoTelefone` (`idTipoTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbTelefoneResponsavelAluno_tbResponsavelAluno1`
    FOREIGN KEY (`tbResponsavelAluno_idResponsavelAluno`)
    REFERENCES `bd_easychool`.`tbResponsavelAluno` (`idResponsavelAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbStatus` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_easychool`.`tbFilaEspera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_easychool`.`tbFilaEspera` (
  `idFilaEspera` INT NOT NULL AUTO_INCREMENT,
  `posicao` INT(10) NOT NULL,
  `tbTurma_idTurma` INT NOT NULL,
  `tbEscola_idEscola` INT NOT NULL,
  `tbResponsavelAluno_idResponsavelAluno` INT NOT NULL,
  `tbStatus_idStatus` INT NOT NULL,
  PRIMARY KEY (`idFilaEspera`),
  INDEX `fk_tbFilaEspera_tbTurma1_idx` (`tbTurma_idTurma` ASC) VISIBLE,
  INDEX `fk_tbFilaEspera_tbEscola1_idx` (`tbEscola_idEscola` ASC) VISIBLE,
  INDEX `fk_tbFilaEspera_tbResponsavelAluno1_idx` (`tbResponsavelAluno_idResponsavelAluno` ASC) VISIBLE,
  INDEX `fk_tbFilaEspera_tbStatus1_idx` (`tbStatus_idStatus` ASC) VISIBLE,
  CONSTRAINT `fk_tbFilaEspera_tbTurma1`
    FOREIGN KEY (`tbTurma_idTurma`)
    REFERENCES `bd_easychool`.`tbTurma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbFilaEspera_tbEscola1`
    FOREIGN KEY (`tbEscola_idEscola`)
    REFERENCES `bd_easychool`.`tbEscola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbFilaEspera_tbResponsavelAluno1`
    FOREIGN KEY (`tbResponsavelAluno_idResponsavelAluno`)
    REFERENCES `bd_easychool`.`tbResponsavelAluno` (`idResponsavelAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbFilaEspera_tbStatus1`
    FOREIGN KEY (`tbStatus_idStatus`)
    REFERENCES `bd_easychool`.`tbStatus` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
