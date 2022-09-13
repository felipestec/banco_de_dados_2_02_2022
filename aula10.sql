/*
Crie uma tabela de carros com as seguintes colunas:
    id_carro, nome, modelo, ano

    Insira
    Chevette, Chevrolet   , 1995
    Gol     , Volksvwagen , 2010
    Onix    , Chevrolet   , 2020

Crie uma tabela de vendedores com as seguintes coluna:
    id_vendedor,  nome,  sobrenome, cpf

    Insira
    Jose, Silva, xxx.xxx.xxx-xx 
    Fabio, Lima, xxx.xxx.xxx-xx

Crie uma tabela de compradores com as seguintes colunas
    id_comprador, nome, sobrenome, cpf,
    Odair, Silveira, xxx.xxx.xxx-xx

Crie uma tabela que relaciona compradores, vendedores e carros
    comp_vend_carro
    id_comp_vend_carro, id_comprador, id_vendedor, id_carro

Crie uma view que retorna todas as transações. Por linha deve haver:
    nome do carro, modelo do carro, ano do carro, nome do vendedor, nome do comprador 

*/

DROP DATABASE IF EXISTS aula10;
CREATE DATABASE aula10;
USE aula10;


CREATE TABLE carros(
    id_carro INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_carro VARCHAR(255) NOT NULL,
    modelo_carro VARCHAR(255) NOT NULL,
    ano_carro INTEGER
);

INSERT INTO carros (nome_carro, modelo_carro, ano_carro) VALUES
("Chevette", "Chevrolet"   , 1995),
("Gol"     , "Volksvwagen" , 2010),
("Onix"    , "Chevrolet"   , 2020);

SELECT * FROM carros;

CREATE TABLE vendedores(
    id_vendedor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_vendedor VARCHAR(255) NOT NULL,
    sobrenome_vendedor VARCHAR(255) NOT NULL,
    cpf_vendedor VARCHAR(100)
);

INSERT INTO vendedores (nome_vendedor, mosobrenome_vendedor, cpf_vendedor) VALUES
("Jose", "Silva", "xxx.xxx.xxx-xx"),
("Fabio", "Lima", "xxx.xxx.xxx-xx");

SELECT * FROM vendedores;

CREATE TABLE compradores(
    id_comprador INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_compradores VARCHAR(255) NOT NULL,
    sobrenome_compradores VARCHAR(255) NOT NULL,
    cpf_compradores VARCHAR(100)
);

INSERT INTO compradores (nome_vendedor, mosobrenome_vendedor, cpf_vendedor) VALUES
("Odair", "Silveira", "xxx.xxx.xxx-xx");

SELECT * FROM compradores;


CREATE TABLE comp_vend_carro(
    id_comp_vend_carro
    id_comprador
    id_vendedor
    id_carro


)



