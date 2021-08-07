-- 1) Na tabela clientes selecione os campos nome e sobrenome e concatene(função concat) eles para que formem o nome completo do cliente. Relacione cada cliente com a cidade de cobrança que consta na tabela faturas. Precisamos apenas uma ocorrência distinta de cada cliente.

SELECT DISTINCT
    CONCAT(c.nome, ' ', c.sobrenome) AS nome_completo,
    cidade_cobranca
FROM
    clientes c
        INNER JOIN
    faturas f ON c.id = f.id_cliente;


-- 2) Na tabela cancoes selecione o nome da canção e relacionado com a tabela tipos_de_arquivos, selecione também o nome do tipo do arquivo. Inclua na sua seleção também as canções que não tem tipo de arquivo. Ordene pelo id da canção de forma decrescente limitado a 4000 registros.

SELECT 
    t.nome AS NomeArq, c.nome AS NomeCancao
FROM
    tipos_de_arquivo t
        RIGHT JOIN
    cancoes c ON t.id = c.id_tipo_de_arquivo
ORDER BY c.id DESC
LIMIT 4000;		-- 4000 de limite é desnecessário, são apenas 3503 retornos


-- 3) Em nosso banco de dados, cada fatura é composta por várias músicas adquiridas pelos clientes. Selecione da tabela faturas o id do cliente e a data da fatura. Usando também a tabela intermediária itens_da_faturas selecione também o nome de cada musica adquirida ou seja, na tabela canções o campo nome. Ordene tudo pelo id do cliente de forma decrescente.

SELECT 
    f.id_cliente, f.data_fatura, c.nome
FROM
    faturas f
        INNER JOIN
    itens_da_faturas i ON f.id = i.id_fatura
        INNER JOIN
    cancoes c ON c.id = i.id_cancao
ORDER BY id_cliente DESC;

-- CRITÉRIO ordem DESC por id._cliente


-- 4) Um artista tem albuns, que por sua vez tem cancões. Selecione o nome do artista da tabela artistas, selecione os nomes dos albuns deste artista (tabela intermediária albuns) e também o nome das canções deste artista contidas nos albuns (tabela cancoes). Ordene os resultados pelo nome do artista de forma decrescente.

SELECT 
    art.nome AS nome_artista, alb.titulo AS titulo_album, c.nome AS nome_cancao
FROM
    artistas art
        INNER JOIN
    albuns alb ON art.id = alb.id_artista
        INNER JOIN
    cancoes c ON alb.id = c.id_album
ORDER BY nome_artista DESC;


-- 5) Selecione o nome dos gêneros(table generos), o nome das canções deste gênero (table cancoes) e o tipo de arquivo de cada canção (tipos_de_arquivo). Selecione inclusive as musicas que o tipo de arquivo é nulo. Ordene tudo isso pelo nome do gênero de forma decrescente.

SELECT 
    g.nome AS nome_genero, c.nome AS nome_cancao, t_arq.nome AS tipo_de_arquivo
FROM
    generos g
        INNER JOIN
    cancoes c ON g.id = c.id_genero
        LEFT JOIN
    tipos_de_arquivo t_arq ON t_arq.id = c.id_tipo_de_arquivo
ORDER BY g.nome DESC;


