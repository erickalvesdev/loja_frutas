--TRIGGER PARA ATUALIZAR QUANTIDADE EM ESTOQUE
CREATE TRIGGER TRG_ATUALIZAR_ESTOQUE
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