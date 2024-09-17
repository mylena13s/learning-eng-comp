-- CTE para remover duplicatas
WITH CTE_RemoverDuplicatas AS (
  SELECT *, ROW_NUMBER() OVER(PARTITION BY coluna1 ORDER BY coluna2) AS row_num
  FROM sua_tabela
)
DELETE FROM CTE_RemoverDuplicatas WHERE row_num > 1;

-- Lidar com dados ausentes (substitui NULL por 0 em uma coluna numerica)
UPDATE sua_tabela
SET coluna_numerica = COALESCE(coluna_numerica, 0);

-- Corrigi o formato de data (converter string para data)
UPDATE sua_tabela
SET data_nascimento = CAST(data_nascimento AS DATE);

-- Corrigi dados inconsistentes (padroniza valores de uma coluna)
UPDATE sua_tabela
SET cidade = CASE 
  WHEN cidade = 'sao paulo' THEN 'São Paulo'
  WHEN cidade = 'rio de janeiro' THEN 'Rio de Janeiro'
  ELSE cidade
END;

-- Remove caracteres indesejados (remove espaços em branco no início e fim de uma string)
UPDATE sua_tabela
SET nome = TRIM(nome);

-- Extrai e dividi dados (extrai o nome do domínio de um email)
UPDATE sua_tabela
SET dominio_email = SUBSTRING_INDEX(email, '@', -1);

-- Agrupa e agrega para limpeza (encontra o valor máximo de uma coluna por grupo)
SELECT categoria, MAX(valor)
FROM sua_tabela
GROUP BY categoria;
