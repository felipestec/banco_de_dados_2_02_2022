USE sakila;

/*Responda (mostrando a evidência em um .sql) a seguinte pergunta: 
Quais foram os filmes assistidos pelos moradAores de Caracas?*/

SELECT
    film.title AS Filmes,
    city.city AS Cidades
FROM
    city
    INNER JOIN address ON
        city.city_id = address.city_id
    INNER JOIN customer ON
        address.address_id = customer.address_id
    INNER JOIN rental ON
        customer.customer_id = rental.customer_id
    INNER JOIN inventory ON
        inventory.inventory_id = rental.inventory_id
    INNER JOIN film ON
        film.film_id = inventory.film_id 
WHERE 
    city.city = 'Caracas';



