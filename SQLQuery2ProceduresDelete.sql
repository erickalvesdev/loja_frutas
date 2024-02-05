USE smningatreinamentogrupo1

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