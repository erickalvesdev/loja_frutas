-------------
    ERICK
-------------
--TRIGGER PARA ATUALIZAR QUANTIDADE EM ESTOQUE
CREATE OR ALTER TRIGGER TRG_ATUALIZAR_ESTOQUE
ON COMPRA
AFTER INSERT
AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: TRG_ATUALIZAR_ESTOQUE.SQL
OBJETIVO..........: ATUALIZAR QUANTIDADE EM ESTOQUE
AUTOR.............: ERICK ALVES
DATA..............: 05/02/2024
EX................: EXEC [dbo].[TRG_ATUALIZAR_ESTOQUE]
*/
	BEGIN
		DECLARE @Id_Produto int,
				@Quantidade int

		SELECT @Id_Produto = IdProduto, @Quantidade = Quantidade
			FROM inserted

		UPDATE Produto
			SET QuantidadeEmEstoque = [dbo].[FUNC_AtualizarEstoqueAposCompra] (@Id_Produto, @Quantidade)
		WHERE ID = @Id_Produto
	END
GO



-------------
    JUAN
-------------
CREATE OR ALTER TRIGGER TRG_ATT_Salario
            ON [dbo].[Funcionario]
            AFTER INSERT 
            AS
            /*
            Documentação
            Arquivo Fonte......: FRUTAS.sql
            Objetivo...........: Inserir salário na tabela Funcionario após um insert
            Autor..............: SMN - Juan Amaral
            Data...............: 05/02/2024
            Ex.................: TRG_ATT_Salario
            */
            BEGIN
            --Declarando variáveis
                DECLARE @IdFuncionarioI INT,
                        @IdCargoI INT
            --Selecionando as variáveis
                SELECT @IdFuncionarioI = ID,
                       @IdCargoI = IDCargo 
                FROM inserted
            --Validando se o ID não é nulo
                IF @IdFuncionarioI IS NOT NULL
                BEGIN
                    DECLARE @SalarioI money

                    SELECT @SalarioI = [dbo].FUNC_ValorSalarial(@IdCargoI)
                    --Atualizando a tabela com o valor do salário de acordo com o  cargo
                    UPDATE Funcionario
                    SET Salario = @SalarioI
                    WHERE ID = @IdFuncionarioI
                END
            END
    GO


-------------
  ALCYMARIO
-------------
CREATE OR ALTER TRIGGER TRG__AtualizarValorTotal
	ON Compra
	AFTER INSERT, UPDATE
	AS
	/*
       Documentação
       Arquivo Fonte......: SQLQuery4TriggerParaAtualizarValorTotal.SQL
       Objetivo...........: Trigger para inserir o VALOR TOTAL na tabela 
       Autor..............: SMN - ALCYMARIO GABRIEL
       Data...............: 05/02/2024
       Ex.................: EXEC [dbo].[TRG__AtualizarValorTotal]
       Retornos...........:
       */
	BEGIN
		-- Declarando variáveis.
		DECLARE @IdCompraI INT

		-- Obtém o ID da compra afetada.
		SELECT @IdCompraI = ID
		FROM inserted

		-- Verifica se o Id é nulo.
		IF @IdCompraI IS NOT NULL

		-- Atualiza o campo "Valor Total" chamando a função.
		UPDATE Compra
		SET ValorTotal = [dbo].[FNC_CalcularValorTotal] (@IDCompraI)
		WHERE ID = @IdCompraI
	END
