CREATE OR ALTER TRIGGER TRG_ATT_Salario
			ON [dbo].[Funcionario]
			AFTER INSERT 
			AS
			/*
			Documenta��o
			Arquivo Fonte......: FRUTAS.sql
			Objetivo...........: Inserir sal�rio na tabela Funcionario ap�s um insert
			Autor..............: SMN - Juan Amaral
			Data...............: 05/02/2024
			Ex.................: TRG_ATT_Salario
			*/
			BEGIN
			--Declarando vari�veis
				DECLARE @IdFuncionarioI INT,
						@IdCargoI INT
			--Selecionando as vari�veis
				SELECT @IdFuncionarioI = ID,
					   @IdCargoI = IDCargo 
				FROM inserted
			--Validando se o ID n�o � nulo
				IF @IdFuncionarioI IS NOT NULL
				BEGIN
					DECLARE @SalarioI money
					
					SELECT @SalarioI = [dbo].FUNC_ValorSalarial(@IdCargoI)
					--Atualizando a tabela com o valor do sal�rio de acordo com o  cargo
					UPDATE Funcionario
					SET Salario = @SalarioI
					WHERE ID = @IdFuncionarioI
				END
			END
	GO
