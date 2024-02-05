USE smningatreinamentogrupo1


-- Function para calcular o valor total com base na soma do pre�o unit�rio e a quantidade.
CREATE OR ALTER FUNCTION [dbo].[FNC_CalcularValorTotal] (
    @ID INT
	)
	RETURNS MONEY
	AS
	/* 
	   DOCUMENTA��O        
	   ARQUIVO FONTE....: TESTESQL2.SQL
	   OBJETIVO.........: CALCULAR VALOR TOTAL
	   AUTOR............: SMN - ALCYM�RIO GABRIEL
	   DATA.............: 05/02/2024
	   EX...............: SELECT [dbo].[FNC_CalcularValorTotal] (3) AS 'VALOR TOTAL'
	*/ 
	BEGIN
		-- Declara��o de vari�veis locais
		DECLARE @PrecoUnitario MONEY,
				@Quantidade SMALLINT,
				@ValorTotal MONEY

		-- Sele��o das quantidades e pre�o unit�rio da compra 
		SELECT	@Quantidade = C.Quantidade,
				@PrecoUnitario = P.PrecoUnitario
			FROM Compra C
			INNER JOIN Produto P ON C.IdProduto = P.ID
			WHERE C.ID = @ID

		-- C�lculo do valor total da compra
		SET @ValorTotal = @Quantidade * @PrecoUnitario

		-- Retorno do valor total calculado
		RETURN @ValorTotal
	END



