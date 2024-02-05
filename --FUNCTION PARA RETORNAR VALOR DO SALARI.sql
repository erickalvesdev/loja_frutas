--FUNCTION PARA RETORNAR VALOR DO SALARIO
CREATE FUNCTION FUNC_ValorSalarial(
	@ID_Cargo	INT
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