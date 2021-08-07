-- Exercício Síncrono - Aula 14

-- Parte 1

-- SELECT distinct `a`.`nome` as `NomeArtista`, count(`b`.`id`) as `Qtd_Albuns`  FROM `artistas` `a` INNER JOIN `albuns` `b` on `a`.`id` = `b`.`id_artista` group by `a`.`nome` order by `Qtd_Albuns` desc LIMIT 10;

SELECT 
    a.nome, COUNT(b.id)
FROM
    artistas a
        INNER JOIN
    albuns b ON a.id = b.id_artista
GROUP BY a.nome
ORDER BY COUNT(b.id) DESC
LIMIT 10;

SHOW INDEX FROM cancoes;

EXPLAIN EXTENDED SELECT nome FROM cancoes		-- em versões mais atuais, basta EXPLAIN
WHERE compositor = 'AC/DC';

CREATE INDEX idx_compositor
ON cancoes(compositor);

EXPLAIN EXTENDED SELECT nome FROM artistas
WHERE nome = 'Gene Krupa';


-- Parte 2

-- Exiba os índices da tabela. (Show Index).
-- Execute um explain select selecionando o campo nome da canção “Hero” e observe -- quantas rows foram percorridas para chegar ao resultado.
-- Crie um índice chamado `I_cancoes_nome` para a tabela pelo campo nome.
-- Execute o explain novamente e veja quantas rows foram percorridas agora.
-- Exclua este índice.

SHOW INDEX FROM cancoes;

EXPLAIN EXTENDED SELECT nome FROM cancoes
WHERE nome = 'Hero';

CREATE INDEX I_cancoes_nome
ON cancoes(nome);

DROP INDEX I_cancoes_nome ON cancoes;


-- Exiba os índices da tabela. 
-- Execute um explain select  selecionando o título do álbum chamado “Na Pista” e -- observe quantas rows foram percorridas para chegar ao resultado.
-- Crie um índice chamado `I_albuns_titulo` para a tabela pelo campo titulo.
-- Execute o explain novamente e veja quantas rows foram percorridas agora.
-- Exclua este índice.

SHOW INDEX FROM albuns;

EXPLAIN EXTENDED SELECT titulo FROM albuns
WHERE titulo = 'Na Pista';

CREATE INDEX I_albuns_titulo
ON albuns(titulo);

DROP INDEX I_albuns_titulo ON albuns;


-- Alternativamente, use ANALYZE
ANALYZE SELECT titulo FROM albuns
WHERE titulo = 'Na Pista';
