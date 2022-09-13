/*
EXERCICIO:

MONTE O SELECT
*/

DROP DATABASE IF EXISTS exercicio;
CREATE DATABASE exercicio;
USE exercicio;

DROP TABLE IF EXISTS B;
DROP TABLE IF EXISTS A;

/*Crie uma tabela chamada b
A Tabela b tem as seguintes colunas:
    id_b
    name_b*/

CREATE TABLE B(
    id_b INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_b VARCHAR(100) NOT NULL
);

/*Crie uma tabela chamada a
A Tabela b tem as seguintes colunas:
    id_b
    name_b*/

CREATE TABLE A(
    id_a INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_a VARCHAR(100) NOT NULL,
    id_b INTEGER,
    FOREIGN KEY (id_b) REFERENCES B(id_b)
);

/*Segue os registros de b:
    'q','w','e','r','t','y','u'*/

INSERT INTO B (name_b) VALUES
('q'),
('w'),
('e'),
('r'),
('t'),
('y'),
('u');

SELECT * FROM B;

/*Segue os registros de a:
    'a','s','d','f','g','h','j','k','l' tal que:
    'q' -> 'a', 's' -> 'r','f' -> 't','k' -> 'u'*/

INSERT INTO A (name_a, id_b) VALUES
('a', (SELECT id_b FROM B WHERE name_b ='q')),
('s', (SELECT id_b FROM B WHERE name_b ='r')),
('d', null),
('f', (SELECT id_b FROM B WHERE name_b ='t')),
('g', null),
('h', null),
('j', null),
('k', (SELECT id_b FROM B WHERE name_b ='u')),
('l', null);

SELECT * FROM A;

/*Selecione todos os elementos que pertencem a B, 
não pertencem a A e não esta relacionada com A. */

SELECT * FROM B
WHERE b.id_b NOT IN(
    SELECT a.id_b FROM B
    INNER JOIN A ON B.id_b = A.id_b
);







