DROP DATABASE IF EXISTS TrabalhoQuartoSemestre;
CREATE DATABASE TrabalhoQuartoSemestre;

USE TrabalhoQuartoSemestre;

DROP TABLE IF EXISTS Stec;
DROP TABLE IF EXISTS Felipe;

CREATE TABLE Felipe(
    id_felipe INTEGER PRIMARY KEY AUTO_INCREMENT,
    rg_felipe VARCHAR(255)
);

CREATE TABLE Stec(
    id_stec     INTEGER PRIMARY KEY AUTO_INCREMENT,
    cpf_stec    VARCHAR(255),
    id_felipe   INTEGER,
    FOREIGN KEY (id_felipe) references Felipe(id_felipe)
);


INSERT INTO Felipe(rg_felipe) VALUES
    ('10.096.776-6'),
    ('11.222.333-4'),
    ('22.333.444-5'),
    ('33.444.555-6');

INSERT INTO Stec(cpf_stec,id_felipe) VALUES
    ('065.948.189-88',1),
    ('111.222.333-44',2),
    ('222.333.444-55',3),
    ('333.444.555-66',4);

/*Faça a remoção de um registro da segunda tabela por meio de transaction.F 
Crie uma trigger nas seguintes situações: 1 - Gatilho: Insert na primeira tabela 2 - 
Execução: Insere na segunda tabela o seguinte: '088.000.999-99' como cpf e 1 como id_(nome da segunda tabela)*/

SELECT * FROM Stec;

SET autocommit=0;

START TRANSACTION;
    DELETE FROM Stec WHERE cpf_stec = '222.333.444-55';

SELECT * FROM Stec;

SET autocommit=1;

DELIMITER $$
    CREATE TRIGGER tgr_insert_felipe AFTER INSERT ON Felipe 
        FOR EACH ROW
            BEGIN
                UPDATE
                    Stec
                SET
                    cpf_stec = "088.000.999-99"
                WHERE
                    stec.id_stec = 1;
            END $$
DELIMITER ;

INSERT INTO Felipe(rg_felipe) VALUES
('66.777.888-9');


SELECT * FROM Stec;

