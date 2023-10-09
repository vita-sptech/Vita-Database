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
  cpf CHAR(255) NOT NULL,
  telefone CHAR(255) NOT NULL,
  funcao VARCHAR(255) NOT NULL,
  FOREIGN KEY (fkHospital) REFERENCES Hospital (id)
)AUTO_INCREMENT = 300;


CREATE TABLE IF NOT EXISTS Maquina (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fkEmpresa INT NOT NULL,
  apelido VARCHAR(255),
  responsavel VARCHAR(255),
  FOREIGN KEY (fkEmpresa) REFERENCES Hospital (id)
)AUTO_INCREMENT = 400;

CREATE TABLE IF NOT EXISTS processoRegistro (
id INT primary key NOT NULL auto_increment,
fkMaquina INT NOT NULL,
nome VARCHAR (255),
dtRegistro DATETIME,
threads INT,
usoMemoriaRam VARCHAR(255),
FOREIGN KEY (fkMaquina) REFERENCES Maquina (id)
);

CREATE TABLE IF NOT EXISTS discoRegistro (
id INT primary key auto_increment,
fkMaquina INT NOT NULL,
modelo VARCHAR(255),
dtRegistro DATETIME,
armazenamentoTotal VARCHAR(255),
armazenamentoLivre VARCHAR(255),
FOREIGN KEY (fkMaquina) REFERENCES Maquina (id)
);

CREATE TABLE IF NOT EXISTS cpuRegistro (
id INT primary key auto_increment,
fkMaquina INT NOT NULL,
dtRegistro DATETIME,
temperatura DECIMAL(10,2),
usoPorcentagem DECIMAL(10,2),
FOREIGN KEY (fkMaquina) REFERENCES Maquina (id)
);

CREATE TABLE IF NOT EXISTS memoriaRegistro(
id INT primary key auto_increment,
fkMaquina int,
dtRegistro DATETIME,
quantidadeoTotal VARCHAR(45),
usoMemoria VARCHAR(45),
FOREIGN KEY (fkMaquina) references Maquina (id)
);

CREATE TABLE IF NOT EXISTS sistemaRegistro(
id INT PRIMARY KEY auto_increment,
fkMaquina int,
dtRegistro DATETIME,
tempoDeAtividadeSistema VARCHAR(45),
qtdDispositivosUsb INT,
FOREIGN KEY (fkMaquina) references Maquina (id)
);



CREATE TABLE IF NOT EXISTS HistoricoIncidentes (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  FkMaquina INT NOT NULL,
  Componente VARCHAR(255),
  DtIncidente DATETIME,
  FOREIGN KEY (FkMaquina) REFERENCES Maquina (Id)
);

-- DESC HOSPITAL;
INSERT INTO HOSPITAL VALUES 
(NULL,"Alberto Einstein", "11961707443","alberteinstein@hospital.com","60.765.823/0001-30","824fd9d8-6134-11ee-8c99-0242ac120002"),
(NULL,"HOSPITAL MUNICIPAL NOSSA SENHORA DA LAPA", "3438131231","hospitalapa@hospital.com","18.278.069/0001-47","7e6de880-6136-11ee-8c99-0242ac120002");
SELECT * FROM HOSPITAL;

-- DESC ENDERECO;
INSERT INTO ENDERECO VALUES
(NULL,200,"Sao Paulo","Sao Paulo","01414952","Rua do hospital albert eintein","900","Do outro lado da rua é o outro lado da rua do hospital"),
(NULL,201,"Sao Paulo","Sao Paulo","01445652","Rua do hospital da lapa","1452","");
SELECT * FROM ENDERECO;

-- DESC FUNCIONARIO;
INSERT INTO FUNCIONARIO VALUES
(null,200,"lucassantos@gmail.com","senha@123","Lucão","12312312","123123123","Gerente");

-- DESC MAQUINA;
INSERT INTO MAQUINA VALUES (null,200,"Maquina 1 Atendimento","David");
-- select * from MAQUINA;

-- select * from disco



