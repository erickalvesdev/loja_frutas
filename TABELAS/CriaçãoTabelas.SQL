USE smningatreinamentogrupo1

-- Cria��o da tabela Cliente
CREATE TABLE Cliente (
	ID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) NOT NULL,
	DataNascimento DATE NOT NULL,
	CPF BIGINT UNIQUE NOT NULL,
	Email VARCHAR (255) UNIQUE NULL,
	Telefone BIGINT NOT NULL
	)

-- Cria��o da tabela Produto
CREATE TABLE Produto (
	ID SMALLINT PRIMARY KEY IDENTITY,
	Nome VARCHAR (50) NOT NULL,
	Tipo VARCHAR (50) NOT NULL,
	PrecoUnitario MONEY NOT NULL,
	QuantidadeEmEstoque SMALLINT NOT NULL
	)

-- Cria��o da tabela Cargo
CREATE TABLE Cargo (
	ID SMALLINT PRIMARY KEY IDENTITY,
	Nome VARCHAR (50) NOT NULL,
	ValorSalarial MONEY NOT NULL
	)

-- Cria��o da tabela Funcionario
CREATE TABLE Funcionario (
	ID INT PRIMARY KEY IDENTITY,
	IdCargo SMALLINT NOT NULL,
	Nome VARCHAR (100) NOT NULL,
	DataNascimento DATE NOT NULL,
	CPF BIGINT UNIQUE NOT NULL,
	Salario MONEY,
	FOREIGN KEY (IdCargo) REFERENCES Cargo (ID)
	)

-- Cria��o da tabela Compra
CREATE TABLE Compra (
	ID INT PRIMARY KEY IDENTITY,
	IdFuncionario INT NOT NULL,
	IdCliente INT NOT NULL,
	IdProduto SMALLINT NOT NULL,
	DataCompra DATE NOT NULL,
	Quantidade SMALLINT NOT NULL,
	ValorTotal MONEY,
	FOREIGN KEY (IdFuncionario) REFERENCES Funcionario (ID),
	FOREIGN KEY (IdCliente) REFERENCES Cliente (ID),
	FOREIGN KEY (IdProduto) REFERENCES Produto (ID)
	)

------------
   INSERT 
------------

--Inser��o de dados na tabela Cliente
INSERT INTO Cliente(Nome, DataNascimento, CPF, Email, Telefone)
	VALUES	('Alcymaria Gabriela', '28-02-2003', 12345678910, 'alcymaria@gmail.com', 83993134567),
			('Henrique Sntss', '24-04-2005', 14334565421, 'henrysntts@gmail.com', 83993434576)


--Inser��o de dados na tabela Produto
INSERT INTO Produto(Nome, Tipo, PrecoUnitario, QuantidadeEmEstoque)
	VALUES	('Ma�a', 'Fruta', 10.00, 50),
			('Cenoura', 'Verdura', 12.00, 30)

--Inser��o de dados na tabela Cargo
INSERT INTO Cargo(Nome, ValorSalarial)
	VALUES	('Vendedor', 2500),
			('Atendente', 2000)


--Inser��o de dados na tabela Funcion�rio
INSERT INTO Funcionario(IdCargo, Nome, DataNascimento, CPF)
	VALUES	(1, 'Erick', '17-05-1989', 12745687312),
			(2, 'Juan', '20-09-2003', 14236712440)


--Inser��o de dados na tabela Compra
INSERT INTO Compra(IdFuncionario, IdCliente, IdProduto, DataCompra, Quantidade)
VALUES(1, 1, 1, '20-01-2024' ,15),
(2, 2, 2, '01-02-2024' ,20)	