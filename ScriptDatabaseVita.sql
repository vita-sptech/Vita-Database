
CREATE DATABASE IF NOT EXISTS `VITA`;

USE `VITA` ;

CREATE TABLE IF NOT EXISTS `VITA`.`Hospital` (
  `Id` INT NOT NULL,
  `Empresa` VARCHAR(45) NOT NULL,
  `Responsável` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `EmailEmpresa` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `CodEmpresa` CHAR(32) NOT NULL,
  PRIMARY KEY (`Id`)
  )AUTO_INCREMENT = 100;


CREATE TABLE IF NOT EXISTS `VITA`.`Funcionário` (
  `id` INT NOT NULL,
  `FkEmpresa` INT NOT NULL,
  `EmailFuncionario` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `Telefone` CHAR(11) NOT NULL,
  `Funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `FkEmpresa`),
  CONSTRAINT `fk_Cadastro-Funcionário_Cadastro-Empresa1`
    FOREIGN KEY (`FkEmpresa`)
    REFERENCES `VITA`.`Hospital` (`Id`)
    )AUTO_INCREMENT = 200;


CREATE TABLE IF NOT EXISTS `VITA`.`Maquina` (
  `Id` INT NOT NULL,
  `FkEmpresa` INT NOT NULL,
  `Apelido` VARCHAR(45) NOT NULL,
  `Responsavel` VARCHAR(45) NOT NULL,
  `JanelasSistema` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fk_Maquinas_Cadastro-Empresa1`
    FOREIGN KEY (`FkEmpresa`)
    REFERENCES `VITA`.`Hospital` (`Id`)
    )AUTO_INCREMENT = 300;


CREATE TABLE IF NOT EXISTS `VITA`.`Hardware` (
  `id` INT NOT NULL,
  `FkMaquina` INT NOT NULL,
  `UsoProcessador` VARCHAR(45) NOT NULL,
  `TempProcessador` VARCHAR(45) NOT NULL,
  `FreqProcessador` VARCHAR(45) NOT NULL,
  `UsoMemoria` VARCHAR(45) NOT NULL,
  `TempMemoria` VARCHAR(45) NOT NULL,
  `FreqMemoria` VARCHAR(45) NOT NULL,
  `TotalDisco` VARCHAR(45) NOT NULL,
  `UsoDiscco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `FkMaquina`),
  CONSTRAINT `fk_Hardware_Maquinas1`
    FOREIGN KEY (`FkMaquina`)
    REFERENCES `VITA`.`Maquina` (`Id`)
    )AUTO_INCREMENT = 400;


CREATE TABLE IF NOT EXISTS `VITA`.`Historico-Incidentes` (
  `id` INT NOT NULL,
  `FkMaquina` INT NOT NULL,
  `Componente` VARCHAR(45) NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`, `FkMaquina`),
  CONSTRAINT `fk_Historico-Incidentes_Maquinas1`
    FOREIGN KEY (`FkMaquina`)
    REFERENCES `VITA`.`Maquina` (`Id`)
    )AUTO_INCREMENT = 500;
