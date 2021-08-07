-- Exercícios - Stored Procedures

-- DELIMITER $$
-- CREATE PROCEDURE -- nome(parametro)
-- BEGIN
-- ROTINA;
-- END $$
-- DELIMITER ;

-- Parte 1

-- 1) Crie uma procedure que selecione o valor da fatura com o valor mais baixo.

DELIMITER $$
CREATE PROCEDURE faturasValorMin()
BEGIN
	SELECT valor_total
	FROM faturas
	ORDER BY valor_total
    LIMIT 1;
END $$
DELIMITER ;

CALL faturasValorMin();


-- 2) Crie uma procedure que retorna a quantidade de faturas que tem o país de cobrança como “Canada”.

DELIMITER $$
CREATE PROCEDURE countFaturasCanada()
BEGIN
	SELECT COUNT(id)
    FROM faturas
    WHERE pais_cobranca = 'Canada';
END $$
DELIMITER ;

CALL countFaturasCanada();


-- 3) Uma procedure que retorna o valor somado de todas as faturas.

DELIMITER $$
CREATE PROCEDURE sumValorFaturas()
BEGIN
	SELECT SUM(valor_total)
    FROM faturas;
END $$
DELIMITER ;

CALL sumValorFaturas();


-- 4) Uma procedure que retorna o valor médio de todas as faturas.

DELIMITER $$
CREATE PROCEDURE faturasValorAvg()
BEGIN
	SELECT AVG(valor_total)
    FROM faturas;
END $$
DELIMITER ;

CALL faturasValorAvg();


-- Parte 2

-- 1) Crie uma procedure que retorna o tamanho em bytes e a duração de uma canção pelo seu id.

DELIMITER $$
CREATE PROCEDURE cancaoTamanhoDuracao(IN id_cancao SMALLINT)
BEGIN
	SELECT bytes, duracao_milisegundos
    FROM cancoes
    WHERE id_cancao = id;
END $$
DELIMITER ;

CALL cancaoTamanhoDuracao(1);
CALL cancaoTamanhoDuracao(9);
CALL cancaoTamanhoDuracao(62);


-- 2) Crie uma procedure que retorna o preço unitário de uma canção pelo seu id.

DELIMITER $$
CREATE PROCEDURE cancaoPreco(IN id_cancao SMALLINT)
BEGIN
	SELECT preco_unitario
    FROM cancoes
    WHERE id_cancao = id;
END $$
DELIMITER ;

CALL cancaoPreco(32);
CALL cancaoPreco(5);
CALL cancaoPreco(2819);


-- 3) Crie uma procedure que retorna o id da canção, o nome da canção e o tipo de arquivo(table tipos_de_arquivo) desta canção a partir de um id da canção informado.

DELIMITER $$
CREATE PROCEDURE cIdNomeTipo(IN id_cancao SMALLINT)
BEGIN
	SELECT c.id, c.nome AS NomeCancao, t.nome AS TipoArquivo
    FROM cancoes c
    INNER JOIN tipos_de_arquivo t
    ON t.id = c.id_tipo_de_arquivo
    WHERE id_cancao = c.id;
END $$
DELIMITER ;

CALL cIdNomeTipo(37);
CALL cIdNomeTipo(2);
CALL cIdNomeTipo(208);


-- Parte 3

-- 1) Crie uma procedure que retorna o nome e sobrenome concatenados e também o email de todos os clientes.

DELIMITER $$
CREATE PROCEDURE clientesNomeEmail()
BEGIN
	SELECT CONCAT(nome,' ', sobrenome) AS NomeCompleto, email
    FROM clientes;
END $$
DELIMITER ;

CALL clientesNomeEmail();


-- 2) Crie uma procedure que retorna o nome completo (nome e sobrenome concatenados) e também o endereço completo (endereço, cidade, estado e país) de um cliente pelo id informado.

DELIMITER $$
CREATE PROCEDURE clienteNomeEnderecoCompletos(IN id_cliente SMALLINT)
BEGIN
	SELECT CONCAT(nome, ' ', sobrenome) AS NomeCompleto, CONCAT(endereco, ', ', cidade, '-', estado, ', ', pais) AS EnderecoCompleto
    FROM clientes
    WHERE id_cliente = id;
END $$
DELIMITER ;

CALL clienteNomeEnderecoCompletos(12);
CALL clienteNomeEnderecoCompletos(36);
CALL clienteNomeEnderecoCompletos(41);


-- 3) Crie uma procedure que retorna o nome do cliente e o valor total de cada uma das suas faturas pelo id do cliente informado.

DELIMITER $$
CREATE PROCEDURE clienteNomeFaturas(IN id_cliente SMALLINT)
BEGIN
	SELECT c.nome, f.valor_total
    FROM clientes c
    INNER JOIN faturas f
    ON c.id = f.id_cliente
    WHERE id_cliente = c.id;
END $$
DELIMITER ;

CALL clienteNomeFaturas(35);
CALL clienteNomeFaturas(2);
CALL clienteNomeFaturas(17);