-- 1)
SELECT artistas.id, artistas.nome, albuns.titulo 
FROM artistas
INNER JOIN albuns
ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

-- 2)
SELECT clientes.nome, clientes.sobrenome, faturas.valor_total
FROM clientes
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
HAVING valor_total > 5
ORDER BY valor_total DESC;

-- 3)
SELECT cancoes.nome, tipos_de_arquivo.nome
FROM tipos_de_arquivo
INNER JOIN cancoes
ON tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo
ORDER BY cancoes.id;
