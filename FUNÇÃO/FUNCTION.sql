--------------
	ERICK
--------------
--FUNCTION PARA RETORNAR VALOR DO SALARIO
CREATE FUNCTION FUNC_ValorSalarial(
    @ID_Cargo    INT
)
RETURNS money
AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: FUNC_ValorSalarial.SQL
OBJETIVO..........: FUNCTION PARA RETORNAR VALOR DO SALARIO
AUTOR.............: ERICK ALVES
DATA..............: 05/02/2024
EX................: SELECT [dbo].[FUNC_ValorSalarial] (@Id_Cargo)
*/
    BEGIN
        DECLARE @Salario money

        --VERIFICANDO SE O ID EXISTE
        IF @ID_Cargo IS NOT NULL

        SELECT @Salario = ValorSalarial
        FROM Cargo
        WHERE ID = @ID_Cargo

        RETURN @Salario
    END
GO


--------------
	Juan
--------------
CREATE OR ALTER FUNCTION FNC_ValidarCPF(
			@CPF BIGINT
			)
			RETURNS TINYINT
			AS
			/*
			Documentação
			Arquivo Fonte......: FRUTAS.sql
			Objetivo...........: Validar CPF
			Autor..............: SMN - Juan Amaral
			Data...............: 05/02/2024
			Ex.................: SELECT [dbo].[FNC_ValidarCPF] 
			*/
			BEGIN
				--Declarando variável
				DECLARE @AVISO TINYINT
				--Validação para a quantidade de caracteres do CPF
				IF LEN(@CPF) = 11
					SET @AVISO = 1
				
				ELSE
					SET @AVISO = 0

				RETURN @AVISO
			END
		GO

--------------
  ALCYMARIO
--------------
-- Function para calcular o valor total com base na soma do preço unitário e a quantidade.
CREATE OR ALTER FUNCTION [dbo].[FNC_CalcularValorTotal] (
    @ID INT
	)
	RETURNS MONEY
	AS
	/* 
	   DOCUMENTAÇÃO        
	   ARQUIVO FONTE....: TESTESQL2.SQL
	   OBJETIVO.........: CALCULAR VALOR TOTAL
	   AUTOR............: SMN - ALCYMÁRIO GABRIEL
	   DATA.............: 05/02/2024
	   EX...............: SELECT [dbo].[FNC_CalcularValorTotal] (3) AS 'VALOR TOTAL'
	*/ 
	BEGIN
		-- Declaração de variáveis locais
		DECLARE @PrecoUnitario MONEY,
				@Quantidade SMALLINT,
				@ValorTotal MONEY

		-- Seleção das quantidades e preço unitário da compra 
		SELECT	@Quantidade = C.Quantidade,
				@PrecoUnitario = P.PrecoUnitario
			FROM Compra C
			INNER JOIN Produto P ON C.IdProduto = P.ID
			WHERE C.ID = @ID

		-- Cálculo do valor total da compra
		SET @ValorTotal = @Quantidade * @PrecoUnitario

		-- Retorno do valor total calculado
		RETURN @ValorTotal
	END


--------------
	ERICK
--------------
--FUNCTION PARA ATUALIZAR QUANTIDADE EM ESTOQUE
CREATE FUNCTION FUNC_AtualizarEstoqueAposCompra(
	@ID_Produto INT, 
	@Quantidade INT
)
RETURNS INT
AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: FUNC_AtualizarEstoqueAposCompra.SQL
OBJETIVO..........: ATUALIZAR QUANTIDADE EM ESTOQUE
AUTOR.............: ERICK ALVES
DATA..............: 05/02/2024
EX................: SELECT [dbo].[FUNC_AtualizarEstoqueAposCompra] (@Id_Produto, @Quantidade)
*/
	BEGIN
		DECLARE @QuantidadeTotalEmEstoque INT,
				@QuantidadeEmEstoque int

			-- Obtenha o novo valor de estoque
			SELECT @Quantidade = C.Quantidade, @QuantidadeEmEstoque = P.QuantidadeEmEstoque
			FROM COMPRA C
			INNER JOIN Produto P ON C.IdProduto = P.ID
			WHERE C.IdProduto = @ID_Produto

			SET @QuantidadeTotalEmEstoque = @QuantidadeEmEstoque - @Quantidade

			RETURN @QuantidadeTotalEmEstoque
	END
GO









