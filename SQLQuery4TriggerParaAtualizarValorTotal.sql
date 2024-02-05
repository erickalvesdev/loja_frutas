USE smningatreinamentogrupo1

CREATE OR ALTER TRIGGER TRG__AtualizarValorTotal
	ON Compra
	AFTER INSERT, UPDATE
	AS
	/*
       Documenta��o
       Arquivo Fonte......: SQLQuery4TriggerParaAtualizarValorTotal.SQL
       Objetivo...........: Trigger para inserir o VALOR TOTAL na tabela 
       Autor..............: SMN - ALCYMARIO GABRIEL
       Data...............: 05/02/2024
       Ex.................: EXEC [dbo].[TRG__AtualizarValorTotal]
       Retornos...........:
       */
	BEGIN
		-- Declarando vari�veis.
		DECLARE @IdCompraI INT

		-- Obt�m o ID da compra afetada.
		SELECT @IdCompraI = ID
		FROM inserted

		-- Verifica se o Id � nulo.
		IF @IdCompraI IS NOT NULL

		-- Atualiza o campo "Valor Total" chamando a fun��o.
		UPDATE Compra
		SET ValorTotal = [dbo].[FNC_CalcularValorTotal] (@IDCompraI)
		WHERE ID = @IdCompraI
	END

