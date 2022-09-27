/*DROP DATABASE IF EXISTS aula11;
CREATE DATABASE aula11;

USE aula11;

CREATE TABLE IF NOT EXISTS editora(
        editora_id INTEGER PRIMARY KEY AUTO_INCREMENT,
        nome       VARCHAR(20) NOT NULL,
        ENDERECO   VARCHAR(255) NOT NULL
);

INSERT INTO
        editora(nome, endereco)
VALUES
        ('Abril', 'Rua Abcd 111'),
        ('Madras', 'Rua Dcb 222'),
        ('Globo', 'Rua Xsg 333');

SELECT * FROM editora;
show index from editora;

/*Comando Explain
EXPLAIN SELECT * FROM editora WHERE nome = 'Globo';

/*Inserindo Index na Tabela
CREATE INDEX idx_editora ON editora(nome);
show index from editora;
EXPLAIN SELECT * FROM editora WHERE nome = 'Globo';

/*TABELA CRIADA SEM INDEX
DROP TABLE editora; 

CREATE TABLE IF NOT EXISTS editora(
        editora_id INTEGER,
        nome       VARCHAR(20) NOT NULL,
        ENDERECO   VARCHAR(255) NOT NULL
);

INSERT INTO
        editora(nome, endereco)
VALUES
        ('Abril', 'Rua Abcd 111'),
        ('Madras', 'Rua Dcb 222'),
        ('Globo', 'Rua Xsg 333');
        
SELECT * FROM editora;
show index from editora;
*/

use sakila;
/*
SET @ID_CUSTOMER_SELECTED = (SELECT
    customer.customer_id
FROM
    customer
WHERE
    customer.email = 'JENNIFER.DAVIS@sakilacustomer.org');
SELECT @ID_CUSTOMER_SELECTED AS 'ID_CUSTOMER_SELECTED';

EXPLAIN SELECT
    film.title,
    film.description
FROM
    film
WHERE
    film_id IN (
        SELECT
            inventory.film_id 
        FROM
            inventory
        WHERE
            inventory.inventory_id IN (
                (
                    SELECT 
                        rental.inventory_id
                    FROM
                        rental
                    WHERE
                        rental.customer_id = (
                            SELECT 
                                customer.customer_id
                            FROM
                                customer
                            WHERE
                                customer.email = 'JENNIFER.DAVIS@sakilacustomer.org'                           
                        )
                )
        )
);
*/

EXPLAIN SELECT 
    film.title
FROM
    customer
    INNER JOIN rental ON
        customer.customer_id = rental.customer_id
    INNER JOIN inventory ON
        inventory.inventory_id = rental.inventory_id
    INNER JOIN film ON
        film.film_id = inventory.film_id
    WHERE
        customer.email = 'JENNIFER.DAVIS@sakilacustomer.org';


    /*SHOW INDEX FROM customer;
    SHOW INDEX FROM inventory;
    SHOW INDEX FROM film;
    SHOW INDEX FROM rental;*/

    DROP INDEX IF EXISTS idx_customer;
    CREATE INDEX idx_customer ON customer(email);
   
    EXPLAIN SELECT 
                film.title
            FROM
                customer
            INNER JOIN rental ON
                customer.customer_id = rental.customer_id
            INNER JOIN inventory ON
                inventory.inventory_id = rental.inventory_id
            INNER JOIN film ON
                film.film_id = inventory.film_id
            WHERE
                customer.email = 'JENNIFER.DAVIS@sakilacustomer.org';

    DROP INDEX IF EXISTS idx_film_title;
    CREATE INDEX idx_film_title ON film(title);

    EXPLAIN SELECT 
                film.title
            FROM
                customer
            INNER JOIN rental ON
                customer.customer_id = rental.customer_id
            INNER JOIN inventory ON
                inventory.inventory_id = rental.inventory_id
            INNER JOIN film ON
                film.film_id = inventory.film_id
            WHERE
                customer.email = 'JENNIFER.DAVIS@sakilacustomer.org';

    SHOW INDEX FROM film;
