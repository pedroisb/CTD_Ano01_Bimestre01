INSERT INTO playground.categorias (nome)
VALUES 
('Aluno'), 
('Docente'), 
('Editor'), 
('Administrador');

INSERT INTO playground.curso (titulo, descricao)
VALUES 
('Certified Tech Developer', 'programação, desenvolvimento e produtos digitais'), 
('Carreiras Digitais 2.0', 'Marketing, Programação, Dados e Produto'), 
('Cyber Security', 'Conceitos de Sistemas, Redes e Plano de Segurança de Informação'), 
('Experiência do Usuário (UX)', 'Entenda a Experiência do Usuário, Prototipação e Testes'), 
('Desenvolvimento Mobile IOS', 'App Development e Programação em Swift');

INSERT INTO playground.usuarios (nome, sobrenome, email, categoria)
VALUES 
('Juan', 'Perez', 'jperezes@gmail', 1), 
('Gabriela', 'Cravo e Canela', 'gabicravo@gmail.com', 1), 
('Policarpo', 'Quaresma', 'poliqua@gmail.com', 3), 
('João', 'Romão', 'joromao@gmail.com', 2), 
('Brás', 'Cubas', 'brscbs@gmail.com', 4);

INSERT INTO playground.usuarios_curso (usuario, curso, datadeinscricao)
VALUES 
('Juan', 'Certified Tech Developer', '2021-03-01'), 
('Gabriela', 'Cyber Security', 2021-06-15), 
('Policarpo', '', ''), 
('João', 'Cyber Security', 2021-01-10), 
('Brás', '', '');