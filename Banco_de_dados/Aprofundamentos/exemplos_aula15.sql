SELECT 
    BENCHMARK(100000000,
            (SELECT 
                    nome
                FROM
                    empregados
                WHERE
                    data_contratacao >= '1987-01-01'
                LIMIT 1));

SELECT USER FROM mysql.user;

CREATE USER `pedron`@`localhost`;

SHOW GRANTS FOR `pedron`@`localhost`;	-- USAGE é apenas visualização, o 'USE databaseX'

GRANT SELECT ON musimundos_v2.* TO `pedron`@`localhost`;

GRANT ALL PRIVILEGES ON musimundos_v2.* TO `pedron`@`localhost`;

