-----------------
	ERICK
-----------------

--PROCEDURE DE INSERT PARA TABELA CLIENTE
CREATE OR ALTER PROCEDURE SP_INSERT_CLIENTE(
	@Nome			VARCHAR(100),
	@DataNascimento	Date,
	@CPF			Bigint,
	@Email			varchar(255),
	@Telefone		Bigint
)
As
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: SP_INSERT_CLIENTE.SQL
OBJETIVO..........: INSERIR UM NOVO CLIENTE
AUTOR.............: ERICK ALVES
DATA..............: 05/02/2024
EX................: DECLARE @RESULTADO INT
					EXEC @RESULTADO = [dbo].[SP_INSERT_CLIENTE] @CPF, @Nome, @DataNascimento, @Email, @Telefone
					SELECT @RESULTADO AS RESULTADO
RETORNO...........: 0 - OK
					1 - CLIENTE EXISTENTE
					2 - CPF INVALIDO
*/
	BEGIN
		--VALIDANDO CPF 
		IF EXISTS( SELECT TOP 1 @CPF FROM CLIENTE WHERE CPF = @CPF) RETURN 1

		--VERIFICANDO SE O CPF É VALIDO
		IF (SELECT [dbo].[FNC_ValidarCPF] (@CPF)) = 0 RETURN 2

		--INSERINDO DADOS NA TABELA CLIENTE
		INSERT INTO CLIENTE (CPF, Nome, DataNascimento, Email, Telefone)
			VALUES	(@CPF, @Nome, @DataNascimento, @Email, @Telefone)

		RETURN 0
	END
GO

--PROCEDURE DE INSERT PARA TABELA FUNCIONARIO
CREATE PROCEDURE SP_INSERT_FUNCIONARIO(
	@Id_Cargo		INT,
	@Nome			VARCHAR(50),
	@DataNascimento	Date,
	@CPF			Bigint,
	@Salario		money
)
As
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: SP_INSERT_FUNCIONARIO.SQL
OBJETIVO..........: INSERIR UM NOVO FUNCIONARIO
AUTOR.............: ERICK ALVES
DATA..............: 05/02/2024
EX................: DECLARE @RESULTADO INT
					EXEC @RESULTADO = [dbo].[SP_INSERT_FUNCIONARIO] @ID_Cargo, @Nome, @DataNascimento, @CPF, @Salario
					SELECT @RESULTADO AS RESULTADO
RETORNO...........: 0 - OK
					1 - CARGO INEXISTENTE
					2 - CPF EXISTENTE

*/
	BEGIN
		--VALIDANDO CPF 
		IF NOT EXISTS( SELECT TOP 1 @Id_Cargo FROM FUNCIONARIO WHERE IDCargo = @Id_Cargo) RETURN 1

		--VERIFICAR SE O EMAIL EXISTE
		IF EXISTS( SELECT TOP 1 @CPF FROM FUNCIONARIO WHERE CPF = @CPF) RETURN 2

		--INSERINDO DADOS NA TABELA PRODUTO
		INSERT INTO FUNCIONARIO (IDCargo, Nome, DataNascimento, CPF, Salario)
			VALUES	(@Id_Cargo, @Nome, @DataNascimento, @CPF, @Salario)

		RETURN 0
	END
GO

--PROCEDURE DE INSERT PARA TABELA COMPRA
CREATE PROCEDURE SP_INSERT_COMPRA(
	@Id_Funcionario		INT,
	@Id_Cliente			INT,
	@Id_Produto			INT,
	@DataCompra			date,
	@Quantidade			int,
	@ValorTotal			money
)
As
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: SP_INSERT_COMPRA.SQL
OBJETIVO..........: INSERIR UMA NOVA COMPRA
AUTOR.............: ERICK ALVES
DATA..............: 05/02/2024
EX................: DECLARE @RESULTADO INT
					EXEC @RESULTADO = [dbo].[SP_INSERT_COMPRA] @Id_Funcionario, @Id_Cliente, @Id_Produto, @DataCompra, @Quantidade, @ValorTotal
					SELECT @RESULTADO AS RESULTADO
RETORNO...........: 0 - OK
					1 - FUNCIONARIO INEXISTENTE
					2 - CLIENTE INEXISTENTE
					3 - PRODUTO INEXISTENTE

*/
	BEGIN
		--VERIFICANDO O ID DO CLIENTE
		IF NOT EXISTS( SELECT TOP 1 @Id_Funcionario FROM Compra WHERE IdFuncionario = @Id_Funcionario) RETURN 1

		--VERIFICANDO O ID DO CLIENTE
		IF NOT EXISTS( SELECT TOP 1 @Id_Cliente FROM Compra WHERE IdCliente = @Id_Cliente) RETURN 2

		--VERIFICANDO O ID DO CLIENTE
		IF NOT EXISTS( SELECT TOP 1 @Id_Produto FROM Compra WHERE IdProduto = @Id_Produto) RETURN 3

		--INSERINDO DADOS NA TABELA PRODUTO
		INSERT INTO Compra (IdFuncionario, IdCliente, IdProduto, DataCompra, Quantidade, ValorTotal)
			VALUES	(@Id_Funcionario, @Id_Cliente, @Id_Produto, @DataCompra, @Quantidade, @ValorTotal)

		RETURN 0
	END
GO


------------
    JUAN
------------
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



---------------
  ALCYMARIO
---------------
-- Criação de procedure de delete em Cliente
CREATE OR ALTER PROC SP_DelCliente (
		@ID INT
		)
		AS
		/*
		Documentação
		Arquivo fonte.....: SQLQuery2ProceduresDelete.SQL
		Objetivo..........: DELETAR A TABELA CLIENTE.
		Autor.............: SMN - ALCYMÁRIO GABRIEL
		Data..............: 05/02/2024
		Ex................: DECLARE @RETURN TINYINT 
							EXEC @RETURN = [dbo].[SP_DelCliente] 
							SELECT @RETURN AS RESULTADO
		Retornos..........: 0 - Processamento OK.
							1 - ID inexistente.
							2 - Erro.
		*/ 

		BEGIN
        -- Validando se o ID Cliente existe.
        IF NOT EXISTS (SELECT 1
                            FROM Cliente
                            WHERE ID = @ID) RETURN 1

        -- Deletando registro na tabela Cliente.
        DELETE FROM Cliente
            WHERE ID = @ID
        RETURN 0

        IF @@ERROR <>0 RETURN 2
    END



-- Criação de procedure de delete em Funcionário
CREATE OR ALTER PROC SP_DelFuncionario (
		@ID INT
		)
		AS
		/*
		Documentação
		Arquivo fonte.....: SQLQuery2ProceduresDelete.SQL
		Objetivo..........: DELETAR A TABELA FUNCIONARIO.
		Autor.............: SMN - ALCYMÁRIO GABRIEL
		Data..............: 05/02/2024
		Ex................: DECLARE @RETURN TINYINT 
							EXEC @RETURN = [dbo].[SP_DelFuncionario] 
							SELECT @RETURN AS RESULTADO
		Retornos..........: 0 - Processamento OK.
							1 - ID inexistente.
							2 - Erro.
		*/ 

		BEGIN
        -- Validando se o ID Funcionario existe.
        IF NOT EXISTS (SELECT 1
                            FROM Funcionario
                            WHERE ID = @ID) RETURN 1

        -- Deletando registro na tabela Funcionario.
        DELETE FROM Funcionario
            WHERE ID = @ID
        RETURN 0

        IF @@ERROR <>0 RETURN 2
    END


-- Criação de procedure de delete em Compra
CREATE OR ALTER PROC SP_DelCompra (
		@ID INT
		)
		AS
		/*
		Documentação
		Arquivo fonte.....: SQLQuery2ProceduresDelete.SQL
		Objetivo..........: DELETAR A TABELA COMPRA.
		Autor.............: SMN - ALCYMÁRIO GABRIEL
		Data..............: 05/02/2024
		Ex................: DECLARE @RETURN TINYINT 
							EXEC @RETURN = [dbo].[SP_DelCompra] 
							SELECT @RETURN AS RESULTADO
		Retornos..........: 0 - Processamento OK.
							1 - ID inexistente.
							2 - Erro.
		*/ 

		BEGIN
        -- Validando se o ID Compra existe.
        IF NOT EXISTS (SELECT 1 
                            FROM Compra
                            WHERE ID = @ID) RETURN 1

        -- Deletando registro na tabela Compra.
        DELETE FROM Compra
            WHERE ID = @ID
        RETURN 0

        IF @@ERROR <>0 RETURN 2
    END