-- 1. liste todos os nomes de todos artistas ordenados de formada crescente;

SELECT nome
FROM artistas
ORDER BY nome;


-- 2. Quais são os generos musicais exsitentes? 

SELECT nome		-- poderia ter usado DISTINCT em caso de nomes repetidos
FROM generos;


-- 3. Mostre a todos os compositores que criaram alguma cancao;

SELECT DISTINCT compositor
FROM cancoes
WHERE compositor != ""
ORDER BY compositor
LIMIT 100;


-- 4. Mostre a lista dos empregados que foram contratados a partir de 2005

SELECT nome, sobrenome, data_contratacao
FROM empregados
WHERE YEAR (data_contratacao) >= 2005
ORDER BY data_contratacao;

-- poderia ser também: WHERE data_contratacao >= '2005-01-01'


-- 5. Liste todos os paises que têm faturas com valor superior a 1.000

SELECT DISTINCT pais_cobranca, SUM(valor_total)
FROM faturas
WHERE valor_total > 1.000		-- revisar
GROUP BY pais_cobranca
ORDER BY pais_cobranca;

-- SELECT pais_cobranca, SUM(valor_total) AS soma_faturas 
-- FROM faturas
-- GROUP BY pais_cobranca 
-- HAVING SUM(valor_total)>100;


-- 6. Quantas cancoes foram compostas por AC/DC ?

SELECT COUNT(nome)
FROM cancoes
WHERE compositor LIKE '%AC/DC%';

-- USE O LIKE PARA PEGAR AS PARCERIAS COM AC/DC (NESSA TABELA NÃO HÁ, MAS PODERIA HAVER)


-- 7. Mostre as 10 primeiras cidades que tem faturas com valor superior a 100 reias.

SELECT cidade_cobranca, SUM(valor_total)
FROM faturas
GROUP BY cidade_cobranca
HAVING SUM(valor_total) > 1
ORDER BY SUM(valor_total) DESC
LIMIT 10;

-- SELECT cidade_cobranca, SUM(valor_total) AS soma_faturas FROM faturas GROUP BY pais_cobranca ORDER BY soma_faturas DESC LIMIT 10;
-- Solução Gustavo -> resultado está equivocado. valores estranhos
-- agrupando por país soma o valor de TODAS as cidades do respectivo país




