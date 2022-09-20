/*
Crie uma tabela de carros com as seguintes colunas:
    id_carro, nome, modelo, ano
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

/*
Insira
    Chevette, Chevrolet   , 1995
    Gol     , Volksvwagen , 2010
    Onix    , Chevrolet   , 2020
*/

INSERT INTO carros (nome_carro, modelo_carro, ano_carro) VALUES
("Chevette", "Chevrolet"   , 1995),
("Gol"     , "Volksvwagen" , 2010),
("Onix"    , "Chevrolet"   , 2020);
("Civic"   ,    "Honda" ,   2021 );

SELECT * FROM carros;

/*
Crie uma tabela de vendedores com as seguintes coluna:
    id_vendedor,  nome,  sobrenome, cpf
*/

CREATE TABLE vendedores(
    id_vendedor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_vendedor VARCHAR(255) NOT NULL,
    sobrenome_vendedor VARCHAR(255) NOT NULL,
    cpf_vendedor VARCHAR(100)

);

/*
Insira
    Jose, Silva, xxx.xxx.xxx-xx 
    Fabio, Lima, xxx.xxx.xxx-xx
*/

INSERT INTO vendedores (nome_vendedor, sobrenome_vendedor, cpf_vendedor) VALUES
("Jose", "Silva", "xxx.xxx.xxx-xx"),
("Fabio", "Lima", "xxx.xxx.xxx-xx");

SELECT * FROM vendedores;

/*
Crie uma tabela de compradores com as seguintes colunas
id_comprador, nome, sobrenome, cpf,
*/

CREATE TABLE compradores(
    id_comprador INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_compradores VARCHAR(255) NOT NULL,
    sobrenome_compradores VARCHAR(255) NOT NULL,
    cpf_compradores VARCHAR(100),
    status_cpf enum ("positivo","negativo")
);

/*
Insira
Odair, Silveira, xxx.xxx.xxx-xx
*/

INSERT INTO compradores (nome_compradores, sobrenome_compradores, cpf_compradores, status_cpf) VALUES
("Odair", "Silveira", "xxx.xxx.xxx-xx","positivo");
("Jeronimo", "Moacir", "xxx.xxx.xxx-xx","negativo");

SELECT * FROM compradores;

/*
Crie uma tabela que relaciona compradores, vendedores e carros
comp_vend_carro
*/

CREATE TABLE comp_vend_carro(
    id_comp_vend_carro INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_comprador INTEGER,
    id_vendedor INTEGER,
    id_carro INTEGER,
    FOREIGN KEY (id_comprador) REFERENCES compradores(id_comprador),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
    FOREIGN KEY (id_carro) REFERENCES carros(id_carro)
    
);

/*
Insira
id_comp_vend_carro, id_comprador, id_vendedor, id_carro
*/

INSERT INTO comp_vend_carro (id_comprador, id_vendedor, id_carro) VALUES
(
    (SELECT id_comprador FROM compradores WHERE nome_compradores = 'Odair'),
    (SELECT id_vendedor FROM vendedores WHERE nome_vendedor = 'Jose'),
    (SELECT id_carro FROM carros WHERE nome_carro = 'Gol')
);

SELECT * FROM comp_vend_carro;



select 
    carros.nome_carro,
    carros.ano_carro,
    carros.modelo_carro,
    vendedores.nome_vendedor,
    compradores.nome_compradores
from
     carros
INNER JOIN
        comp_vend_carro
                ON
                carros.id_carro = comp_vend_carro.id_carro
INNER JOIN
        vendedores
                ON
                comp_vend_carro.id_vendedor = vendedores.id_vendedor
INNER JOIN
        compradores
                ON
                compradores.id_comprador = comp_vend_carro.id_comprador;


select
    carros.nome_carro,
    carros.ano_carro,
    carros.modelo_carro,
    vendedores.nome_vendedor,
    compradores.nome_compradores
FROM
    comp_vend_carro
INNER JOIN
    compradores
    ON comp_vend_carro.id_comprador = compradores.id_comprador
INNER JOIN
    vendedores
    ON comp_vend_carro.id_vendedor = vendedores.id_vendedor
INNER JOIN
    carros
    ON comp_vend_carro.id_carro = carros.id_carro;



/*Crie uma view que retorna todas as transações. Por linha deve haver:
nome do carro, modelo do carro, ano do carro, nome do vendedor, nome do comprador
*/



SELECT 'creating a view' AS 'long'; /*A view pode ser definida como uma tabela virtual composta
                             por linhas e colunas de dados vindos de tabelas relacionadas 
                             em uma query*/

DROP VIEW IF EXISTS select_all_aula10;

CREATE
    VIEW select_all_aula10 
as(

    select 
    carros.nome_carro,
    carros.ano_carro,
    carros.modelo_carro,
    vendedores.nome_vendedor,
    compradores.nome_compradores
    from
        carros
    INNER JOIN
            comp_vend_carro
                    ON
                    carros.id_carro = comp_vend_carro.id_carro
    INNER JOIN
            vendedores
                    ON
                    comp_vend_carro.id_vendedor = vendedores.id_vendedor
    INNER JOIN
            compradores
                    ON
                    compradores.id_comprador = comp_vend_carro.id_comprador
    
);

SELECT 'using' as 'log';

SELECT * FROM select_all_aula10;





