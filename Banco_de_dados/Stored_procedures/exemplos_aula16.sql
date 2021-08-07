DELIMITER $$
CREATE PROCEDURE todosClientes()
BEGIN
SELECT * FROM clientes;
END $$
DELIMITER ;

CALL todosClientes();

DROP PROCEDURE todosClientes;

-- -----------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE nomeUsuario(IN id_usuario INT)
BEGIN
SELECT nome FROM clientes WHERE id = id_usuario;
END $$
DELIMITER ;

CALL nomeUsuario(5);

DROP PROCEDURE nomeUsuario;