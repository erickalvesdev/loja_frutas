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