IF EXISTS (SELECT * FROM sys.databases WHERE name = N'vita')
    DROP DATABASE vita;

CREATE DATABASE vita;

CREATE TABLE Hospital (
  id INT PRIMARY KEY IDENTITY(200,1),
  nome NVARCHAR(255) NOT NULL,
  telefone NVARCHAR(255) NOT NULL,
  email NVARCHAR(255) NOT NULL,
  cnpj NVARCHAR(255) NOT NULL,
  codHospital NVARCHAR(255) NOT NULL,
  site NVARCHAR(255) NOT NULL,
  categoria NVARCHAR(10) NOT NULL,
  CONSTRAINT chkCategoria CHECK (categoria IN ('Publico', 'Particular'))
);

CREATE TABLE Endereco (
  id INT PRIMARY KEY IDENTITY(100,1),
  fkHospital INT NOT NULL,
  estado NVARCHAR(255) NOT NULL,
  cidade NVARCHAR(255) NOT NULL,
  cep NVARCHAR(255) NOT NULL,
  logradouro NVARCHAR(255) NOT NULL,
  numEndereco NVARCHAR(255) NOT NULL,
  complemento NVARCHAR(255) NULL,
  FOREIGN KEY (fkHospital) REFERENCES Hospital (id)
);

CREATE TABLE Funcionario (
  id INT PRIMARY KEY IDENTITY(300,1),
  fkHospital INT NOT NULL,
  email NVARCHAR(255) NOT NULL,
  senha NVARCHAR(255) NOT NULL,
  nome NVARCHAR(255) NOT NULL,
  telefone NVARCHAR(255) NOT NULL,
  funcao NVARCHAR(255) NOT NULL,
  FOREIGN KEY (fkHospital) REFERENCES Hospital (id)
);

CREATE TABLE ParametrosAlerta(
  id INT PRIMARY KEY IDENTITY(1,1),
  fkHospital INT NOT NULL,
  maxTempProcessador NVARCHAR(50),
  maxUsoProcessador NVARCHAR(50),
  maxUsoMemoria NVARCHAR(50),
  maxUsoDisco NVARCHAR(50),
  maxTempoDeAtividade NVARCHAR(50),
  minQtdUsb NVARCHAR(50),
  processoMaxUsoRam NVARCHAR(50),
  tempoParaAlertaUsoProcessador NVARCHAR(50),
  tempoParaAlertaUsoMemoria NVARCHAR(50),
  tempoParaAlertaTempProcessador NVARCHAR(50),
  tempoParaAlertaUsoRamProcessos NVARCHAR(50),
  FOREIGN KEY (fkHospital) REFERENCES Hospital (id)
);

CREATE TABLE Maquina (
  uuid NVARCHAR(255) PRIMARY KEY,
  fkHospital INT NOT NULL,
  localidade NVARCHAR(255),
  responsavel NVARCHAR(255),
  FOREIGN KEY (fkHospital) REFERENCES Hospital (id)
);

CREATE TABLE ProcessoRegistro (
  id INT PRIMARY KEY IDENTITY(1,1),
  fkMaquina NVARCHAR(255) NOT NULL,
  nome NVARCHAR(255),
  dtRegistro DATETIME,
  threads INT,
  usoMemoriaRam NVARCHAR(255),
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE DiscoRegistro (
  id INT PRIMARY KEY IDENTITY(1,1),
  fkMaquina NVARCHAR(255) NOT NULL,
  modelo NVARCHAR(255),
  dtRegistro DATETIME,
  armazenamentoTotal NVARCHAR(255),
  armazenamentoLivre NVARCHAR(255),
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE CpuRegistro (
  id INT PRIMARY KEY IDENTITY(1,1),
  fkMaquina NVARCHAR(255) NOT NULL,
  dtRegistro DATETIME,
  temperatura NVARCHAR(50),
  usoPorcentagem NVARCHAR(50),
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE MemoriaRegistro(
  id INT PRIMARY KEY IDENTITY(1,1),
  fkMaquina NVARCHAR(255) NOT NULL,
  dtRegistro DATETIME,
  qtdTotal NVARCHAR(45),
  usoMemoria NVARCHAR(45),
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE SistemaRegistro(
  id INT PRIMARY KEY IDENTITY(1,1),
  fkMaquina NVARCHAR(255) NOT NULL,
  dtRegistro DATETIME,
  tempoDeAtividadeSistema NVARCHAR(45),
  qtdDispositivosUsb INT,
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE Ocorrencias (
  id INT PRIMARY KEY IDENTITY(1,1),
  fkMaquina NVARCHAR(255) NOT NULL,
  componente NVARCHAR(255),
  categoria NVARCHAR(255),
  descricao NVARCHAR(255),
  dtOcorrencia DATETIME,
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE Chamado(
  id INT PRIMARY KEY IDENTITY(1,1),
  fkMaquina NVARCHAR(255) NOT NULL,
  fkResponsavel INT NOT NULL,
  titulo NVARCHAR(100),
  descricao NVARCHAR(255),
  setor NVARCHAR(255),
  isClosed BIT,
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid),
  FOREIGN KEY (fkResponsavel) REFERENCES Funcionario (id)
);

SET IDENTITY_INSERT Hospital ON;

INSERT INTO Hospital (id, nome, telefone, email, cnpj, codHospital, site, categoria)

VALUES

(200, 'Alberto Einstein', '11961707443', 'alberteinstein@hospital.com', '60.765.823/0001-30', '824fd9d8-6134-11ee-8c99-0242ac120002', 'https://www.einstein.br/', 'Particular'),

(201, 'HOSPITAL MUNICIPAL NOSSA SENHORA DA LAPA', '3438131231', 'hospitalapa@hospital.com', '18.278.069/0001-47', '7e6de880-6136-11ee-8c99-0242ac120002', 'https://postosdesaude.com.br/mg/vazante/hospitais-publicos/hospital-municipal-nossa-senhora-da-lapa-1-4951', 'Publico');

SET IDENTITY_INSERT Hospital OFF

SET IDENTITY_INSERT Endereco ON;

INSERT INTO Endereco (id, fkHospital, estado, cidade, cep, logradouro, numEndereco, complemento)

VALUES

(100, 200, 'Sao Paulo', 'Sao Paulo', '01414952', 'Rua do hospital albert eintein', '900', 'Do outro lado da rua é o outro lado da rua do hospital'),

(101, 201, 'Sao Paulo', 'Sao Paulo', '01445652', 'Rua do hospital da lapa', '1452', '');

SET IDENTITY_INSERT Endereco OFF;

SET IDENTITY_INSERT Funcionario ON;

INSERT INTO Funcionario (id, fkHospital, email, senha, nome, telefone, funcao)

VALUES

(300, 200, 'lucassantos@gmail.com', 'senha@123', 'Lucão', '12312312', 'Gerente'),

(301, 200, 'leo@gmail.com', 'senha@123', 'Leo', '12312312', 'Suporte');

SET IDENTITY_INSERT Funcionario OFF;