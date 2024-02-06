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
