--PROCEDURE DE SELECT PARA A TABELA CLIENTE
CREATE OR ALTER PROC Sel_Cliente(
			@ID				INT				=		NULL,
			@Nome			VARCHAR (100)	=		NULL,
			@DataNascimento DATE			=		NULL,
			@CPF			BIGINT			=		NULL,
			@Email			VARCHAR (255)	=		NULL,
			@Telefone		BIGINT			=		NULL
			)
			AS
			/*
			Documentação
			Arquivo Fonte......: FRUTAS.sql
			Objetivo...........: Selecionar dados da tabela Cliente
			Autor..............: SMN - Juan Amaral
			Data...............: 05/02/2024
			Ex.................: EXEC [dbo].[Sel_Cliente]
			*/
			BEGIN
				SELECT ID, Nome, DataNascimento, CPF, Email, Telefone
				FROM Cliente
				WHERE	(@ID	IS NULL OR  ID = @ID) 									AND
						(@Nome	IS NULL OR	Nome = @Nome)								AND
						(@DataNascimento IS NULL OR  DataNascimento = @DataNascimento)	AND
						(@CPF	IS NULL OR  CPF = @CPF)									AND
					    (@Email IS NULL OR  Email = @Email)								AND
						(@Telefone IS NULL OR  Telefone = @Telefone)
			END
		GO

EXEC [dbo].[Sel_Cliente] 

SELECT * FROM Cliente


--PROCEDURE DE SELECT PARA A TABELA FUNCIONÁRIO
CREATE OR ALTER PROC Sel_Funcionario(
			@ID				INT				=	NULL,
			@IdCargo		SMALLINT		=	NULL,
			@Nome			VARCHAR (100)	=	NULL,
			@DataNascimento DATE			=	NULL,
			@CPF			BIGINT			=	NULL,
			@Salario		MONEY			=	NULL
			)
			AS
			/*
			Documentação
			Arquivo Fonte......: FRUTAS.sql
			Objetivo...........: Selecionar dados da tabela Funcionário
			Autor..............: SMN - Juan Amaral
			Data...............: 05/02/2024
			Ex.................: EXEC [dbo].[Sel_Funcionario] 
			*/
			BEGIN
				SELECT	ID, IdCargo, Nome, DataNascimento, CPF, Salario
				FROM	Funcionario
				WHERE	(@ID IS NULL OR ID = @ID )												AND
						(@IdCargo IS NULL OR IdCargo = @IdCargo )								AND
						(@Nome IS NULL OR Nome = @Nome )										AND
						(@DataNascimento IS NULL OR DataNascimento = @DataNascimento )			AND
						(@CPF IS NULL OR CPF = @CPF )											AND
						(@Salario IS NULL OR Salario = @Salario )				
			END
		GO

--PROCEDURE DE SELECT PARA A TABELA COMPRA
CREATE OR ALTER PROC Sel_Compra(
			@ID				INT 			=	NULL,
			@IdFuncionario	INT				=	NULL,
			@IdCliente		INT 			=	NULL,
			@IdProduto		SMALLINT 		=	NULL,
			@DataCompra		DATE			=	NULL,
			@Quantidade		SMALLINT 		=	NULL,
			@ValorTotal		MONEY			=	NULL
			)
			AS
			/*
			Documentação
			Arquivo Fonte......: FRUTAS.sql
			Objetivo...........: Selecionar dados da tabela COMPRA
			Autor..............: SMN - Juan Amaral
			Data...............: 05/02/2024
			Ex.................: EXEC [dbo].[Sel_Compra] 
			*/
			BEGIN
				SELECT	ID, IdFuncionario, IdCliente, IdProduto, DataCompra, Quantidade, ValorTotal
				FROM	Compra
				WHERE	(@ID IS NULL OR ID = @ID )										AND
						(@IdFuncionario IS NULL OR IdFuncionario = @IdFuncionario )		AND
						(@IdCliente IS NULL OR IdCliente = @IdCliente )					AND
						(@IdProduto IS NULL OR IdProduto = @IdProduto )					AND
						(@DataCompra IS NULL OR DataCompra = @DataCompra )				AND
						(@Quantidade IS NULL OR Quantidade = @Quantidade )				AND
						(@ValorTotal IS NULL OR ValorTotal = @ValorTotal )	
			END
		GO