/*use sakila;

select * from actor;

/*1 Verifique os índices da tabela ator*/

show index from actor;

/*2 Faça um select na tabela actor pelo Tom Miranda (com where no first e no last name);*/

select 
    first_name, last_name 
from
    actor
where
    first_name = 'Tom' and last_name = 'Miranda';

/*3 Faça um explain no tom miranda e verifique quantas linhas são necessárias percorrer para chegar ali.*/

EXPLAIN SELECT * FROM actor WHERE first_name = 'Tom' and last_name = 'Miranda';

/*4 Faça um select na tabela actor pelo Tom Miranda (com where apenas no first);*/

CREATE INDEX idx_actor ON actor(first_name);
show index from actor;
EXPLAIN SELECT * FROM actor WHERE first_name = 'Tom';

/*5 O que você pode entender desse resultado?

6 Para melhorar a performance do 5, o que você pode fazer?

7 Monte um join entre endereço, cidade e país buscando pelo Brasil.

8 Apresente uma análise de performance da query do exercício 7

9 Ha performance dessa query está otimizada no máximo possível ou há algo que pode ser feito para melhorar a performance dela?

10 Para query 7 acrescente where na cidade de Socoraba

11 repita anállise feita em 9*/
