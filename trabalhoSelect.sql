CREATE DATABASE table_pets;

USE table_pets;

DROP TABLE IF EXISTS pet;

CREATE TABLE pet (
    id_pet        INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome          VARCHAR(255) NOT NULL,
    tipo          ENUM("CACHORRO","GATO"),
    raca          VARCHAR(255) NOT NULL,
    created_at    DATETIME DEFAULT NOW() 

);

DESCRIBE pet;

/* 1 Faça registro de 10 cachorros e de 10 gatos */

INSERT INTO pet (
    nome,
    tipo,
    raca
)
    VALUES
(
    'kakau',
    'CACHORRO',
    'Dachshund'
    
),
(
    'Zoe',
    'CACHORRO',
    'Dachshund'
    
),
(
    'July',
    'CACHORRO',
    'Pinscher'
    
),
(
    'Maxi',
    'CACHORRO',
    'Labrador'
    
),
(
    'Fiona',
    'CACHORRO',
    'Pastor Alemão'
    
),
(
    'Scubi',
    'CACHORRO',
    'Dog Alemão'
    
),
(
    'Chiara',
    'CACHORRO',
    'Pit bull'
    
),
(
    'Thomas',
    'CACHORRO',
    'Pastor Belga'
    
),
(
    'Atenas',
    'CACHORRO',
    'Rotweiller'
    
),
(
    'Caramelo',
    'CACHORRO',
    'Vira lata'
    
),
(
    'Fifi',
    'GATO',
    'Sphynx'
    
),
(
    'Wody',
    'GATO',
    'Siames'
    
),
(
    'Garfield',
    'GATO',
    'Siames'
    
),
(
    'Peter',
    'GATO',
    'Siames'
    
),
(
    'Sophi',
    'GATO',
    'Persa'
    
),
(
    'Remi',
    'GATO',
    'Persa'
    
),
(
    'Maia',
    'GATO',
    'Persa'
    
),
(
    'Lua',
    'GATO',
    'Vira lata'
    
),
(
    'Areta',
    'GATO',
    'Vira lata'
    
),
(
    'Zara',
    'GATO',
    'Vira lata'
    
);

/*2 Faça um select geral*/

SELECT * FROM pet;

/*Faça um select ordenado pela data de criação do registro 
(created_at) de forma que seja decrescente
*/

SELECT * FROM pet ORDER BY id_pet desc;

/*4 Faça o mesmo select da 3, contudo limitando em 3 registros*/

SELECT * FROM pet ORDER BY id_pet desc limit 3;





