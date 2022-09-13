use sakila;

SELECT 'creating a view' AS 'long'; /*A view pode ser definida como uma tabela virtual composta
                             por linhas e colunas de dados vindos de tabelas relacionadas 
                             em uma query*/

DROP VIEW IF EXISTS select_all_actors;

CREATE
    VIEW select_all_actors 
as(
    SELECT 
        actor.first_name,
        actor.last_name,
        actor.last_update
     FROM 
        actor
    WHERE
        actor.first_name LIKE "C%"
);

SELECT 'using' as 'log';

SELECT * FROM select_all_actors;