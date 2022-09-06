DROP DATABASE IF EXISTS aprendendoleft;
CREATE DATABASE aprendendoleft;
USE aprendendoleft;


DROP TABLE IF EXISTS classe;
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS professores;

CREATE TABLE classe(
    id_classe INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_classe VARCHAR(100) NOT NULL,
    descricao TEXT,
    ano VARCHAR(5) NOT NULL
);

CREATE TABLE alunos (
    id_aluno INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    id_classe INTEGER,
    FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE professores (
    id_professor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    id_classe INTEGER,
    FOREIGN KEY (id_classe) REFERENCES classe(id_classe)

);

INSERT INTO classe (nome_classe, descricao, ano) VALUES
('A','Turma que entrou no início do ano','2021'),
('B','Turma que entrou no meio do ano','2021');

INSERT INTO alunos (nome, sobrenome, documento, id_classe) VALUES
('Brunno', 'Sobrenome do Brunno ', 'xx.xxx.xxx.x', 1 ),
('Bryan', 'Sobrenome do Bryan ', 'xx.xxx.xxx.x', 1 ),
('Leandro', 'Sobrenome do Leandro ', 'xx.xxx.xxx.x', 1 ),
('Luan', 'Sobrenome do Luan ', 'xx.xxx.xxx.x', 1 ),
('Lucas', 'Sobrenome do Lucas ', 'xx.xxx.xxx.x', 2 ),
('Aryon', 'Sobrenome do Aryon ', 'xx.xxx.xxx.x', 2 ),
('Raphael', 'Sobrenome do Raphael ', 'xx.xxx.xxx.x', 2 ),
('Leticia', 'Sobrenome do Leticia ', 'xx.xxx.xxx.x', 2 ),
('Pedro', 'Sobrenome do Pedro ', 'xx.xxx.xxx.x', 2 ),
('Guilherme', 'Sobrenome do Guilherme ', 'xx.xxx.xxx.x', 2 );

INSERT INTO alunos (nome, sobrenome, documento) VALUES
('Ernani', 'Sobrenome do Ernani ', 'xx.xxx.xxx.x');

SELECT 'ALUNOS - INNER JOIN ' AS 'LOG';

SELECT 
    alunos.nome
FROM
    alunos
INNER JOIN
    classe
        ON alunos.id_classe = classe.id_classe;

SELECT 'ALUNOS - LEFT JOIN ' AS 'LOG';

SELECT 
    alunos.nome
FROM
    alunos
LEFT JOIN
    classe
        ON alunos.id_classe = classe.id_classe;

SELECT 'ALUNOS - RIGHT JOIN ' AS 'LOG';

SELECT 
    alunos.nome
FROM
    alunos
RIGHT JOIN
    classe
        ON alunos.id_classe = classe.id_classe;

INSERT INTO professores (nome, sobrenome, documento, id_classe) VALUES
('Professor A', 'Sobrenome Professor A ', 'XX.XXX.XXX-XX', 1),
('Professor B', 'Sobrenome Professor B ', 'XX.XXX.XXX-XX', 1),
('Professor C', 'Sobrenome Professor C ', 'XX.XXX.XXX-XX', 2),
('Professor D', 'Sobrenome Professor D ', 'XX.XXX.XXX-XX', 2);

INSERT INTO professores (nome, sobrenome, documento) VALUES
('Professor E', 'Sobrenome Professor E ', 'XX.XXX.XXX-XX');

SELECT * FROM professores;

SELECT 'PROFESSORES - INNER JOIN ' AS 'LOG';

SELECT 
    professores.nome
FROM
    professores
INNER JOIN
    classe
        ON professores.id_classe = classe.id_classe;

SELECT 'PROFESSORES - LEFT JOIN ' AS 'LOG';

SELECT 
    professores.nome
FROM
    professores
LEFT JOIN
    classe
        ON professores.id_classe = classe.id_classe;

SELECT 'PROFESSORES - RIGHT JOIN ' AS 'LOG';

SELECT 
    professores.nome
FROM
    professores
RIGHT JOIN
    classe
        ON professores.id_classe = classe.id_classe;






