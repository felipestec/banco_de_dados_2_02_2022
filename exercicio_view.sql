/*Faça a criação de uma tabela com o nome país. Essa tabela deve contar id_pais 
(primary key e auto_increment) e nome. Faça uma tabela com o nome cidade. Essa 
tabela deve contar id_cidade (auto_increment primary key), nome (varchar), id_pais 
(forekey id_pais). Registre quatro países diferentes. Registre 3 cidades para cada país. 
Faça uma view que trás todos os países e cidades. */
DROP DATABASE IF EXISTS exercicio_view;
CREATE DATABASE exercicio_view;

use exercicio_view;

DROP TABLE IF EXISTS cidade;
DROP TABLE IF EXISTS pais;


CREATE TABLE pais(
    id_pais INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_pais VARCHAR(255) NOT NULL
    
);

CREATE TABLE cidades (
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_cidade VARCHAR(255) NOT NULL,
    id_pais INTEGER NOT NULL,
    FOREIGN KEY(id_pais) REFERENCES pais(id_pais)    
);

INSERT INTO pais(nome_pais) VALUES
("Brasil"),
("Italia"),
("Portugal"),
("Espanha");

SELECT * FROM pais;

INSERT INTO cidades(nome_cidade, id_pais) VALUES
("Curitiba",1),
("Sao Paulo",1),
("Rio de Janeiro", 1),
("Roma",2),
("Milao",2),
("Veneza",2),
("Lisboa",3),
("Porto",3),
("Coimbra",3),
("Sevilha",4),
("Madri",4),
("Barcelona",4);

SELECT * FROM cidades;

SELECT 'creating a view' AS 'long'; /*A view pode ser definida como uma tabela virtual composta
                             por linhas e colunas de dados vindos de tabelas relacionadas 
                             em uma query*/

DROP VIEW IF EXISTS select_pais_cidades;

CREATE
    VIEW select_pais_cidades 
as(
    select 
    pais.nome_pais,
    cidades.nome_cidade
    
    from
        pais
    INNER JOIN
            cidades
                    ON
                    pais.id_pais = cidades.id_pais
   
);

select * from select_pais_cidades;