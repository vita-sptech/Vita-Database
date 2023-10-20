DROP DATABASE IF EXISTS vita;
CREATE DATABASE IF NOT EXISTS vita;


USE vita ;

CREATE TABLE IF NOT EXISTS Hospital (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  cnpj VARCHAR(255) NOT NULL,
  codHospital VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 200;


CREATE TABLE IF NOT EXISTS Endereco (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fkHospital INT NOT NULL,
  estado VARCHAR(255) NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  cep VARCHAR(255) NOT NULL,
  logradouro VARCHAR(255) NOT NULL,
  numEndereco VARCHAR(255) NOT NULL,
  complemento VARCHAR(255) NULL,
  FOREIGN KEY (fkHospital) REFERENCES Hospital (id)
  )AUTO_INCREMENT = 100;

CREATE TABLE IF NOT EXISTS Funcionario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fkHospital INT NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  funcao VARCHAR(255) NOT NULL,
  FOREIGN KEY (fkHospital) REFERENCES Hospital (id)
)AUTO_INCREMENT = 300;


CREATE TABLE IF NOT EXISTS ParametrosAlerta(
id INT PRIMARY KEY auto_increment,
fkHospital INT NOT NULL,
maxTempProcessador VARCHAR(50),
maxUsoProcessador VARCHAR(50),
maxUsoMemoria VARCHAR(50),
maxUsoDisco VARCHAR(50),
maxTempoDeAtividade VARCHAR(50),
minQtdUsb VARCHAR(50),
processoMaxUsoRam VARCHAR(50),
FOREIGN KEY (fkHospital) references Hospital (id)
);

CREATE TABLE IF NOT EXISTS Maquina (
  uuid VARCHAR(255) PRIMARY KEY  ,
  fkHospital INT NOT NULL,
  apelido VARCHAR(255),
  responsavel VARCHAR(255),
  FOREIGN KEY (fkHospital) REFERENCES Hospital (id)
)AUTO_INCREMENT = 400;

CREATE TABLE IF NOT EXISTS processoRegistro (
id INT primary key NOT NULL auto_increment,
fkMaquina  VARCHAR(255) NOT NULL,
nome VARCHAR (255),
dtRegistro DATETIME,
threads INT,
usoMemoriaRam VARCHAR(255),
FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE IF NOT EXISTS discoRegistro (
id INT primary key auto_increment,
fkMaquina VARCHAR(255) NOT NULL,
modelo VARCHAR(255),		
dtRegistro DATETIME,
armazenamentoTotal VARCHAR(255),
armazenamentoLivre VARCHAR(255),
FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE IF NOT EXISTS cpuRegistro (
id INT primary key auto_increment,
fkMaquina VARCHAR(255) NOT NULL,
dtRegistro DATETIME,
temperatura VARCHAR(50),
usoPorcentagem VARCHAR(50),
FOREIGN KEY (fkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE IF NOT EXISTS memoriaRegistro(
id INT primary key auto_increment,
fkMaquina VARCHAR(255) NOT NULL,
dtRegistro DATETIME,
qtdTotal VARCHAR(45),
usoMemoria VARCHAR(45),
FOREIGN KEY (fkMaquina) references Maquina (uuid)
);

CREATE TABLE IF NOT EXISTS sistemaRegistro(
id INT PRIMARY KEY auto_increment,
fkMaquina VARCHAR(255) NOT NULL,
dtRegistro DATETIME,
tempoDeAtividadeSistema VARCHAR(45),
qtdDispositivosUsb INT,
FOREIGN KEY (fkMaquina) references Maquina (uuid)
);



CREATE TABLE IF NOT EXISTS ocorrencias (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  FkMaquina VARCHAR(255) NOT NULL,
  Componente VARCHAR(255),
  DtOcorrencia DATETIME,
  FOREIGN KEY (FkMaquina) REFERENCES Maquina (uuid)
);

CREATE TABLE IF NOT EXISTS Chamado(
id INT PRIMARY KEY auto_increment,
fkMaquina VARCHAR(255) NOT NULL,
fkResponsavel int NOT NULL,
titulo VARCHAR(100),
descricao VARCHAR(255),
setor VARCHAR(255),
isClosed BOOLEAN,
foreign key (fkMaquina) references Maquina(UUID),
foreign key (fkResponsavel) references Funcionario (id)
);

