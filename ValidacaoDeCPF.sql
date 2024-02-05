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