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
