-- Atualizações

UPDATE faturas SET id_cliente = NULL WHERE id_cliente > 50;

UPDATE cancoes SET cancoes.id_tipo_de_arquivo = NULL WHERE cancoes.id > 850;

-- JOINS

-- 1)

-- a) R: 347
CREATE VIEW artista_album AS
SELECT artistas.nome, albuns.titulo
FROM artistas
INNER JOIN albuns
ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

SELECT COUNT(*) FROM artista_album;

-- b) R: 418
CREATE VIEW artista_album_left AS
SELECT artistas.nome, albuns.titulo
FROM artistas
LEFT JOIN albuns
ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

SELECT COUNT(*) FROM artista_album_left;

-- 2)

-- a) R: 350
CREATE VIEW clientes_faturas AS
SELECT clientes.id, clientes.nome, faturas.valor_total -- nome+sobrenome?
FROM clientes
INNER JOIN faturas
ON clientes.id = faturas.id_cliente;

SELECT COUNT(*) FROM clientes_faturas;

-- b) R: 412
CREATE VIEW clientes_faturas_right AS
SELECT clientes.id, clientes.nome, faturas.valor_total -- nome+sobrenome?
FROM clientes
RIGHT JOIN faturas
ON clientes.id = faturas.id_cliente;

SELECT COUNT(*) FROM clientes_faturas_right;

-- 3)

-- a) R: 850
CREATE VIEW tipos_arquivos_cancoes AS
SELECT tipos_de_arquivo.nome AS tipo_arquivo, cancoes.nome AS cancoes
FROM tipos_de_arquivo
INNER JOIN cancoes
ON tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;

SELECT COUNT(*) FROM tipos_arquivos_cancoes;

-- b) R:853
CREATE VIEW tipos_arquivos_cancoes_left AS
SELECT tipos_de_arquivo.nome AS tipo_arquivo, cancoes.nome AS cancoes
FROM tipos_de_arquivo
LEFT JOIN cancoes
ON tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;

SELECT COUNT(*) FROM tipos_arquivos_cancoes_left;

-- c) R: 3503
CREATE VIEW tipos_arquivos_cancoes_right AS
SELECT tipos_de_arquivo.nome AS tipo_arquivo, cancoes.nome AS cancoes
FROM tipos_de_arquivo
RIGHT JOIN cancoes
ON tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;

SELECT COUNT(*) FROM tipos_arquivos_cancoes_right;



