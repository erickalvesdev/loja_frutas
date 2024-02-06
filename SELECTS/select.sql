---------------
    Erick
---------------

-- Use PATINDEX para encontrar produtos que contenham a palavra "fruta" na descrição
SELECT ID_Produto, Nome
    FROM Produto
WHERE PATINDEX('%fruta%', Nome) > 0

-- Use PATINDEX para encontrar produtos que contenham a palavra "fruta" no nome e SUBSTRING para extrair parte do nome
SELECT 
    ID_Produto, Nome
    SUBSTRING(Nome, PATINDEX('%fruta%', nome), LEN('fruta')) AS ParteNome
    FROM Produto
WHERE PATINDEX('%fruta%', nome) > 0

-- Use REPLACE para substituir a palavra "nome" por "nome2" na descrição
SELECT 
    ID_Produto, Nome 
    REPLACE(Nome, 'Abacaxi', 'Abacate') AS NovaoNome
FROM Produto

-- Use REVERSE para inverter a descrição dos produtos
SELECT 
    ID_Produto, Nome
    REVERSE(Nome) AS NomeInvertido
FROM Produto

---------------
   ALCYMARIO
---------------
-- Mostre a data de nascimento dos clientes no formato "AAAA-MM-DD" usando FORMAT.
SELECT FORMAT(DataNascimento, 'dd/MM/yyyy') AS 'Data Nascimento Formatada'
	FROM Cliente

-- Crie uma consulta que exiba os primeiros 4 caracteres do campo Nome na tabela Cliente Utilizando LEFT
SELECT LEFT(Nome, 4) AS 'Parte Esquerda Nome'
	FROM Cliente

-- Mostre os últimos 3 caracteres do campo Email na tabela Cliente Utilizando RIGHT
SELECT  RIGHT(Email, 3) AS 'Parte Direita Email'
	FROM Cliente

-- Concatene os primeiros 3 caracteres do campo Nome com os últimos 2 caracteres do campo Nome na tabela Cliente Utilizando LEFT + RIGHT
SELECT  LEFT(Nome, 3) + RIGHT(Nome, 2) AS 'Parte Combinada Nome'
	FROM Cliente

-- Crie uma string preenchida com espaços à esquerda para que a string tenha um comprimento total de 5 caracteres Utilizando SPACE
SELECT  SPACE(5) + Nome AS 'Nome Com Espacos'
	FROM Cliente

-- Substitua os caracteres da posição 8 até a posição 11 do CPF com STUFF
SELECT  STUFF(CPF, 8, 4, '****') AS 'CPF Modificado'
	FROM Cliente

--  Use Translate para substituir a letra do Nome que tiver 'aeiou' por '*****'

SELECT TRANSLATE(Nome, 'aeiou', '*****') AS 'Nome Traduzido'
FROM Cliente

---------------
     Juan
---------------

-----------------------------------------------------------------------
--Selecionar a quantidade de caracteres do nome dos clientes
SELECT Nome, LEN(Nome) FROM Cliente AS Quantidade_Caracteres


-----------------------------------------------------------------------
--Selecionar o nome dos produtos com todos caracteres maiúsculo
SELECT UPPER(Nome)
FROM Produto

-----------------------------------------------------------------------
--Selecionar o nome do cargo com todos caracteres minúsculos
SELECT LOWER(Nome)
FROM Cargo

-----------------------------------------------------------------------
--Selecionar a primeira letra do nome dos clientes maiúsculas e o resto minúsculo
SELECT CONCAT(UPPER(SUBSTRING(Nome, 1, 1)), LOWER(SUBSTRING(Nome, 2, LEN(Nome)-1))) AS NOME
FROM Cliente

-----------------------------------------------------------------------
--Selecionar o preço unitário dos produtos sem a casa decimal 
SELECT CONVERT(DECIMAL(10,0), PrecoUnitario)  AS VALOR_PRODUTO
FROM Produto 

-----------------------------------------------------------------------
--Selecionar a soma do valor salarial de todos os cargos 
SELECT SUM(ValorSalarial)   AS SOMA_SALARIAL
FROM Cargo 

-----------------------------------------------------------------------
--Selecionar a media do valor total de compra do cliente com ID = 1
SELECT AVG(ValorTotal) AS MEDIA_GASTA
FROM Compra
WHERE IdCliente = 1