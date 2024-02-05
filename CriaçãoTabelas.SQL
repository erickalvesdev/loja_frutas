USE smningatreinamentogrupo1

-- Criação da tabela Cliente
CREATE TABLE Cliente (
	ID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) NOT NULL,
	DataNascimento DATE NOT NULL,
	CPF BIGINT UNIQUE NOT NULL,
	Email VARCHAR (255) UNIQUE NULL,
	Telefone BIGINT NOT NULL
	)

-- Criação da tabela Produto
CREATE TABLE Produto (
	ID SMALLINT PRIMARY KEY IDENTITY,
	Nome VARCHAR (50) NOT NULL,
	Tipo VARCHAR (50) NOT NULL,
	PrecoUnitario MONEY NOT NULL,
	QuantidadeEmEstoque SMALLINT NOT NULL
	)

-- Criação da tabela Cargo
CREATE TABLE Cargo (
	ID SMALLINT PRIMARY KEY IDENTITY,
	Nome VARCHAR (50) NOT NULL,
	ValorSalarial MONEY NOT NULL
	)

-- Criação da tabela Funcionario
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