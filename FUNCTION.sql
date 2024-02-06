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