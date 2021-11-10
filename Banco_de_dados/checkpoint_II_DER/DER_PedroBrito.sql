-- Pedro Ivo S Brito
-- Checkpoint II


-- Criação e seleção da base de dados/esquema

CREATE SCHEMA rpg_online DEFAULT CHARACTER SET utf8;
USE rpg_online;

-- Criação das entidades/tabelas

CREATE TABLE servidores (
    id_servidor INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    regiao VARCHAR(30) NOT NULL,
    pvp TINYINT(1),		-- na prática, booleano
    comercio_entre_personagens TINYINT(1),	-- na prática, booleano
    alianca_entre_personagens TINYINT(1)	-- na prática, booleano
);

CREATE TABLE usuarios (
    id_usuario INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_real VARCHAR(50) NOT NULL,
    nome_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,	-- escolhido VARCHAR em razão de registros antigos de CPF ainda possuírem letras
    senha CHAR(12) NOT NULL
);

CREATE TABLE talentos (
	id_talento TINYINT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE itens (
	id_item INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    dano SMALLINT(6),
    protecao SMALLINT(6),
    saude_recuperada SMALLINT(6),
    mana_recuperada SMALLINT(6),
    frequencia DECIMAL(4,4) NOT NULL
);

CREATE TABLE classes (
	id_classe TINYINT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE habilidades (
	id_habilidade TINYINT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL,
    modalidade VARCHAR(30) NOT NULL,
    id_classe TINYINT(2) NOT NULL,
    dano SMALLINT(6),
    protecao SMALLINT(6),
    mana_consumida SMALLINT(6),
    efeito_extra VARCHAR(30)
);

CREATE TABLE niveis_dificuldade (
	id_nivel_dificuldade TINYINT(1) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    normal_completado TINYINT(1) NOT NULL,	-- booleano, na prática
    dificil_completado TINYINT(1) NOT NULL,	-- booleano, na prática
    muito_dificil_completado TINYINT(1) NOT NULL,	-- booleano, na prática
    penalidade_experiencia DECIMAL(3,2) DEFAULT 0.00,
    inimigos_bonus_saude DECIMAL(3,2) DEFAULT 0.00,
    inimigos_bonus_dano DECIMAL(3,2) DEFAULT 0.00,
    inimigos_especiais_frequencia DECIMAL(4,3) DEFAULT(0.001)
);

CREATE TABLE personagens (
	id_personagem INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    experiencia INT(10) NOT NULL,
    nivel TINYINT(2) NOT NULL,
    saude_max SMALLINT(6) NOT NULL,
    mana_max SMALLINT(6) NOT NULL,
    id_classe TINYINT(2) NOT NULL,
    id_servidor INT(11) NOT NULL,
    id_usuario INT(11) NOT NULL,
    FOREIGN KEY (id_classe)
        REFERENCES classes (id_classe),
    FOREIGN KEY (id_servidor)
        REFERENCES servidores (id_servidor),
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario)
);

CREATE TABLE personagem_talentos (
    id_personagem_talentos INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_talento TINYINT(2) NOT NULL,
    id_personagem INT(11) NOT NULL,
    pontos TINYINT(2) NOT NULL,
    FOREIGN KEY (id_talento)
        REFERENCES talentos (id_talento),
    FOREIGN KEY (id_personagem)
        REFERENCES personagens (id_personagem)
);

CREATE TABLE personagem_itens (
    id_personagem_item INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_personagem INT(11) NOT NULL,
    id_item INT(11) NOT NULL,
    quantidade TINYINT(2) NOT NULL,
    FOREIGN KEY (id_personagem)
        REFERENCES personagens (id_personagem),
    FOREIGN KEY (id_item)
        REFERENCES itens (id_item)
);

CREATE TABLE personagem_habilidades (
	id_personagem_habilidades INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_personagem INT(11) NOT NULL,
    id_habilidade TINYINT(3) NOT NULL,
    pontos TINYINT(2) NOT NULL,
	FOREIGN KEY (id_personagem)
		REFERENCES personagens (id_personagem),
	FOREIGN KEY (id_habilidade)
		REFERENCES habilidades (id_habilidade)
);

CREATE TABLE personagem_nivel_dificuldade (
	id_personagem_dificuldade INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_personagem INT(11) NOT NULL,
    id_nivel_dificuldade TINYINT(1) NOT NULL,
    FOREIGN KEY (id_personagem)
		REFERENCES personagens (id_personagem),
	FOREIGN KEY (id_nivel_dificuldade)
		REFERENCES niveis_dificuldade (id_nivel_dificuldade)
);


-- Inserção de dados nos atributos das entidades criadas

INSERT INTO servidores (nome, regiao, pvp, comercio_entre_personagens, alianca_entre_personagens) 
VALUES
	('Erebus', 'Europa - Oeste', 1, 0, 0),
	('Limbo', 'EUA - Costa Leste', 1, 1, 0),
	('Malleboge', 'Asia - Sudeste', 0, 1, 1);

INSERT INTO usuarios (nome_real, nome_usuario, email, cpf, senha)
VALUES
	('José Fernandes', 'Jfrn97', 'jfernandes@email.com', '61298423495', 'A4a63*&'),
    ('Mário Alberto Campos', 'Marac', 'macampos@email.com', '45231689756', '432156789'),
    ('Carla Silva', 'Xena123', 'silva.c@email.com', '18016822235', 'Koamkz89*1'),
    ('Rubens Sales Gomes', 'Conan', 'g.sales@email.com', '19863265487', 'Fido'),
    ('Fernanda Silveira', 'Htinha', 'silveirananda@email.com', '18646756123', 'N4nd4s1L');

INSERT INTO talentos (nome, descricao)
VALUES
	('Força', 'Vigor físico de seu personagem - influencia o dano causado com armas'),
    ('Agilidade', 'Destreza e precisão de seu personagem - se relaciona com sua capacidade de manipular objetos com precisão e tempo de reação'),
    ('Constituição', 'Resistência e vitalidade de seu personagem - influencia sua saúde máxima e resistência a danos físicos'),
    ('Força de vontade', 'Resiliência mental de seu personagem - influencia a sua mana máxima e resistência a danos mágicos');

INSERT INTO itens (nome, categoria, tipo, dano, protecao, saude_recuperada, mana_recuperada, frequencia)
VALUES
	('Poção de vitalidade pequena', 'utilitário', 'poção', NULL, NULL, 100, NULL, 0.05),
    ('Poção de mana grande', 'utilitário', 'poção', NULL, NULL, NULL, 300, 0.005),
    ('Poção mista média', 'utilitário', 'poção', NULL, NULL, 150, 150, 0.01),
    ('Adaga comum', 'arma', 'arma curta', 10, NULL, NULL, NULL, 0.05),
    ('Lança mágica', 'arma', 'arma longa', 120, NULL, NULL, NULL, .0002),
    ('Elmo comum', 'armadura', 'elmo', NULL, 16, NULL, NULL, 0.01),
    ('Botas de alta qualidade', 'armadura', 'bota', NULL, 45, NULL, NULL, 0.08),
    ('Armadura de BanaarTael', 'armadura', 'tronco', NULL, 280, NULL, NULL, .0001);

INSERT INTO classes (nome, descricao)
VALUES
	('Guerreiro', 'O Guerreiro é uma classe especializada em combate corpo-a-corpo, com foco em causar e resistir a dano físico'),
    ('Ladino', 'O Ladino é uma classe especializada em manobras furtivas, em surpreender os inimigos pelas costas e abrir portas e baús trancados'),
    ('Mago', 'O Mago é uma classe voltada para o uso de feitiços e magias, com foco em dano mágico com grande área de efeito'),
    ('Clérigo', 'O Clérigo é um conjurador divino, possuindo diversas magias e preces voltadas à proteção e cura de seus aliados'),
    ('Ranger', 'O Ranger é proficiente no uso de arco-e-flecha, especializado em causar dano físico à distância');

INSERT INTO habilidades (nome, descricao, modalidade, id_classe, dano, protecao, mana_consumida, efeito_extra)
VALUES
    ('Bola de fogo', 'O Mago lança uma bola de fogo sobre seus inimigos', 'magia de fogo', 3, 500, NULL, 20, 'dano persistente'),
    ('Desarme', 'O Guerreiro desarma seu adversário', 'esgrima', 1, NULL, NULL, 15, NULL),
    ('Flecha atravessadora', 'O Ranger lança uma flecha que atinge todos os inimigos em sua trajetória', 'arqueria', 5, 18, NULL, 12, NULL),
    ('Armadura espiritual', 'O Clérigo abençoa seus aliados com uma magia protetora', 'proteção', 4, NULL, 50, 28, NULL),
    ('Ressurreição', 'O Clérigo ressuscita um aliado', 'preces', 4, 100, NULL, 55, NULL);
    
INSERT INTO niveis_dificuldade (nome, normal_completado, dificil_completado, muito_dificil_completado, penalidade_experiencia, inimigos_bonus_saude, inimigos_bonus_dano, inimigos_especiais_frequencia)
VALUES
	('Passeio', 0, 0, 0, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
    ('Suor', 1, 0, 0, 0.01, 0.15, 0.10, 0.010),
    ('Sangue', 1, 1, 0, 0.05, 0.30, 0.33, 0.025),
    ('Lágrimas', 1, 1, 1, 0.10, 0.60, 0.50, 0.100);

INSERT INTO personagens (nome, experiencia, nivel, saude_max, mana_max, id_classe, id_servidor, id_usuario)
VALUE
	('Aquiles', 914136, 12, 500, 400, 1, 2, 4),
    ('Bob', 653198763, 87, 12500, 16000, 4, 2, 4),
    ('Arlequina', 065212, 33, 3500, 2400, 2, 3, 2),
    ('Siegfried', 6321884, 48, 5000, 12000, 3, 2, 1),
    ('Barbarella', 0, 1, 100, 0, 1, 1, 3),
    ('Diana', 19651325, 64, 8000, 4000, 5, 2, 3);
    
INSERT INTO personagem_talentos (id_talento, id_personagem, pontos)
VALUES
	(1, 1, 22),
    (2, 1, 16),
    (3, 1, 18),
    (4, 1, 12),
    (1, 2, 62),
    (2, 2, 96),
    (3, 2, 45),
    (4, 2, 30),
    (1, 3, 26),
    (2, 3, 34),
    (3, 3, 15),
    (4, 3, 23),
    (1, 4, 20),
    (2, 4, 36),
    (3, 4, 36),
    (4, 4, 60),
    (1, 5, 10),
    (2, 5, 10),
    (3, 5, 10),
    (4, 5, 10),
    (1, 6, 54),
    (2, 6, 36),
    (3, 6, 42),
    (4, 6, 26);

INSERT INTO	personagem_itens (id_personagem, id_item, quantidade)
VALUES
	(1, 1, 4),
    (1, 5, 1),
    (1, 6, 1),
    (2, 3, 2),
    (2, 5, 1),
    (2, 6, 1),
    (3, 3, 6),
    (4, 1, 1),
    (4, 2, 1),
    (4, 3, 1),
    (4, 4, 1),
    (6, 8, 1);
    
INSERT INTO personagem_habilidades (id_personagem, id_habilidade, pontos)
VALUES
	(1, 2, 10),
	(2, 4, 1),
    (2, 5, 4),
	(4, 3, 5),
	(6, 1, 8);

INSERT INTO personagem_nivel_dificuldade (id_personagem, id_nivel_dificuldade)
VALUES
	(1, 1),
    (2, 4),
    (3, 2),
    (4, 3),
    (5, 1),
    (6, 4);


-- Apagando dados (DELETE)

	-- Personagem 'Barbarella' permaneceu inativa por mais de 30 dias. Pelas regras do nosso jogo, personagens inativos por mais de 30 dias devem ser removidos.
	-- A seguir, removeremos a personagem em questão e todos os registros associados a ela.

DELETE FROM personagem_habilidades 
WHERE
    id_personagem = 5;

DELETE FROM personagem_itens 
WHERE
    id_personagem = 5;

DELETE FROM personagem_nivel_dificuldade  
WHERE id_personagem = 5;

DELETE FROM personagem_talentos 
WHERE
    id_personagem = 5;

DELETE FROM personagens 
WHERE
    id_personagem = 5;


-- Atualizando dados (UPDATE)

	-- Personagem 'Siegfried' acumulou os pontos necessários de experiência para passar de nível.
	-- Atualizaremos o seu registro para que seu nível atual corresponda à realidade.
    
UPDATE personagens 
SET 
    nivel = 49
WHERE
    id_personagem = 4;


-- Selecionando dados (SELECT)

	-- Devido ao imenso sucesso de nosso jogo, estamos recebendo mais jogadores e considerando criar mais servidores para acomodá-los.
	-- Diante disso, vamos realizar uma pesquisa para saber quais regiões recebem mais personagens e, assim, identificar onde deveremos alocar os novos servidores.

SELECT 
    servidores.regiao,
    COUNT(personagens.id_personagem) AS numero_personagens
FROM
    servidores
        INNER JOIN
    personagens ON servidores.id_servidor = personagens.id_servidor
GROUP BY servidores.regiao
ORDER BY numero_personagens DESC;