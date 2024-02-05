USE smningatreinamentogrupo1


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



