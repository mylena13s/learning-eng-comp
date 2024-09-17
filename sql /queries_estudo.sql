-- Busca o frete mais caro
-- Max e Min valores do frete dentro do intervalo especificado
SELECT 
    MAX(frete) AS maiorFrete,
    MIN(frete) AS menorFrete
FROM sql-basico-423222.sql_basico.olist_itens_pedido
WHERE frete BETWEEN 0.01 AND 10;

-- Contagem de pedidos com frete dentro do intervalo especificado
SELECT 
    COUNT(id_pedido) AS qtPedido
FROM sql-basico-423222.sql_basico.olist_itens_pedido
WHERE frete BETWEEN 0.01 AND 10;

-- Busca o seguimento de negócio mais vendido e menos vendido
-- Busca maior e menor receita quando o seguimento de negócios for utilidades casa
SELECT 
    MAX(receita_mensal_declarada) AS negocioMaisRec,
    MIN(receita_mensal_declarada) AS negocioMenRec,
    seguimento_negocio
FROM sql-basico-423222.sql_basico.olist_negocios_fechados
WHERE seguimento_negocio LIKE '%utilidades_casa'
GROUP BY seguimento_negocio;

-- Busca quantidade de vendedores por cidade
SELECT 
    COUNT(DISTINCT id_vendedor) AS qtdVendedor,
    vendedor_cidade AS cidade
FROM sql-basico-423222.sql_basico.olist_vendedores
GROUP BY vendedor_cidade
ORDER BY qtdVendedor DESC;

-- Busca volume financeiro das vendas dos produtos pet
SELECT 
    SUM(receita_mensal_declarada) AS volumeVendas,
    seguimento_negocio,
    pefil_comportamental
FROM sql-basico-423222.sql_basico.olist_negocios_fechados
WHERE seguimento_negocio = 'pet'
AND pefil_comportamental IS NOT NULL
GROUP BY seguimento_negocio, pefil_comportamental
ORDER BY volumeVendas DESC;

-- Ver qual frete mais se repete
SELECT 
    frete,
    COUNT(*) AS quantidade
FROM sql-basico-423222.sql_basico.olist_itens_pedido
GROUP BY frete
HAVING COUNT(*) > 1;
