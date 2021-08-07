-- Aula 15 - Aprofundamentos: Exercícios


-- 1) Revisão índices

-- a) Na tabela canções liste todos os índices criados.

SHOW INDEX FROM cancoes;

-- b) Caso exista um índice criado na coluna nome, exclua-o.

DROP INDEX I_cancoes_nome ON cancoes;

-- c) Agora, crie um índice para a coluna nome.

CREATE INDEX nome_idx ON cancoes (nome);


-- 2) Explain

-- a) Use o comando Explain para fazer uma pesquisa (select) na tabela canções que retorne o tamanho da música chamada “Be Yourself”. E verifique o número de rows percorridas (deve ser 1);

EXPLAIN SELECT duracao_milisegundos FROM cancoes WHERE nome = 'Be Yourself';


-- 3) Priority

-- a) Selecione todos os campos da tabela canções com alta prioridade.

SELECT HIGH_PRIORITY * FROM cancoes;

-- b) Atualize o nome da canção “Crazy” para “I am Crazy” com baixa prioridade.

UPDATE LOW_PRIORITY cancoes 
SET 
    nome = 'I am Crazy'
WHERE
    nome = 'Crazy';
    
    
-- 4) Benchmark

-- a) Faça o benchmark de uma consulta que retorne o compositor da canção “I am Crazy” limitado a 1 registro realizada 100 milhões de vezes.

SELECT 
    BENCHMARK(100000000,
            (SELECT 
                    compositor
                FROM
                    cancoes
                WHERE
                    nome = 'I am Crazy'));


-- 5)

-- a)

SELECT USER FROM mysql.user;

-- b)

CREATE USER stefany@localhost;
CREATE USER marcelo@localhost;
CREATE USER jaiana@localhost;

-- possível criar os 3 com um único comando: CREATE USER fulano@host, cicrano@host, @beltrano@host;
-- usuário com meu nome já havia sido criado durante exemplo em aula

-- c)

SELECT USER FROM mysql.user;

-- d)

GRANT ALL PRIVILEGES ON *.* TO pedron@localhost;

-- e)

GRANT INSERT ON *.* TO jaiana@localhost;

-- f)

GRANT SELECT ON musimundos_v2.cancoes TO marcelo@localhost;

-- g)

SHOW GRANTS FOR `pedron`@`localhost`;

-- h)

REVOKE UPDATE ON *.* FROM `pedron`@`localhost`;

-- i)

SHOW GRANTS FOR `pedron`@`localhost`;

-- j)

DROP USER `pedron`@`localhost`;

DROP USER jaiana@localhost, marcelo@localhost, stefany@localhost;

-- possível fazer sem crase e dropar múltiplos usuários ao mesmo tempo.
