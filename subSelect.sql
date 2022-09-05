Alunos: Felipe Augusto Stec
        Gustavo Mocelin

        
USE sakila;

SET
    @ID_CARACAS = (
        SELECT
            city_id
        FROM
            city
        WHERE
            city = "Caracas"
    );

SET
    @ID_ADDRESS = (
        SELECT
            address_id
        FROM
            address
        WHERE
            city_id = @ID_CARACAS
    );

SELECT
    customer.customer_id
FROM
    customer
WHERE
    address_id IN(@ID_ADDRESS);

SELECT
    "Os filmes assistidos pelos moradores de Caracas" AS MESSAGE_LOG;

SELECT
    film.title AS Title
    
FROM
    film
WHERE
    film_id IN(
        SELECT
            inventory.film_id
        FROM
            inventory
        WHERE
            inventory_id IN(
                SELECT
                    rental.inventory_id
                FROM
                    rental
                WHERE
                    customer_ID IN(
                        SELECT
                            customer.customer_id
                        FROM
                            customer
                        WHERE
                            address_id IN(@ID_ADDRESS)
                    )
            )
    );