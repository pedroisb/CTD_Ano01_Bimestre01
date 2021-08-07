CREATE SCHEMA biblioteca;

USE biblioteca;

CREATE TABLE usuarios(
id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NULL,
email VARCHAR(100),
telefone VARCHAR (50)
);

CREATE TABLE livros(
id_livro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100)
);

CREATE TABLE emprestimos(
id_emprestimo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_emprestimo DATE,
data_devolucao DATE,
id_usuario INT,
id_livro INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
FOREIGN KEY (id_livro) REFERENCES livros (id_livro)
);

INSERT INTO usuarios (nome, email, telefone)
VALUES
('Fe', 'fe@figitalhouse.com', '894156879'),
('Pedro', 'pedro@digitalhouse.com', '851387956'),
('Silas', 'silas@digitalhouse.com', '7988979636321');

INSERT INTO livros (titulo)
VALUES
('Diário de um banana'),
('O Senhor dos Anéis'),
('Verdade Tropical');

INSERT INTO emprestimos (data_emprestimo, data_devolucao, id_usuario, id_livro)
VALUES
('2021-06-18', '2021-06-30', 1, 1),
('2021-05-25', '2021-06-18', 3, 2),
('2021-06-17', '2021-06-30', 2, 3);

SELECT nome, email FROM usuarios;

SELECT * FROM emprestimos;

SELECT nome FROM usuarios
WHERE id_usuario = 1;

SELECT titulo FROM livros
WHERE id_livro = 1;

UPDATE usuarios SET nome = 'Felipe'
WHERE nome = 'Fe';

UPDATE usuarios SET nome = 'Fernando'
WHERE nome = 'Felipe';

SELECT * FROM emprestimos; 

DELETE FROM emprestimos
WHERE id_usuario = 1;

DELETE FROM emprestimos
WHERE id_usuario = 1 AND data_devolucao = '2021-06-09';

DROP DATABASE biblioteca

