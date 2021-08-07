-- Exercícios Síncronos
-- 1)
SELECT generos.nome, COUNT(cancoes.id)
FROM generos
INNER JOIN cancoes
ON generos.id = cancoes.id_genero
GROUP BY generos.nome
ORDER BY COUNT(cancoes.id) DESC;

-- 2)
SELECT generos.nome, COUNT(cancoes.id)
FROM generos
INNER JOIN cancoes
ON generos.id = cancoes.id_genero
GROUP BY generos.nome
HAVING COUNT(cancoes.id) > 10;

-- 3)
SELECT COUNT(DISTINCT clientes.id), clientes.pais, SUM(faturas.valor_total) -- sem DISTINCT ele repetirá clientes e somará pedidos com o mesmo cliente
FROM clientes
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
GROUP BY clientes.pais
ORDER BY COUNT(clientes.id) DESC -- apenas DESC porque está com LIMIT 7
LIMIT 7;
