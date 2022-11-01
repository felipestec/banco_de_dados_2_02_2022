/*Procedures*/

DROP DATABASE IF EXISTS learn_procedures;
CREATE DATABASE learn_procedures;
SET NAMES UTF8MB4;

USE learn_procedures;

CREATE TABLE country (
    id_country       INTEGER AUTO_INCREMENT PRIMARY KEY,
    country_name    VARCHAR(255),
    continent       VARCHAR(255)

);

INSERT INTO
    country(country_name,continent)
VALUES
    ('Brasil'        , 'America do Sul'),
    ('Paraguai'      , 'America do Sul'),
    ('Uruguai'       , 'America do Sul'),
    ('Peru'          , 'America do Sul'),
    ('Libano'        , 'Asia'),
    ('Estados Unidos', 'America do Norte')
;

DELIMITER $$
    
CREATE PROCEDURE SelectCountry()
BEGIN
   SELECT * FROM country;
END $$

DELIMITER ;

SHOW PROCEDURE STATUS;

DELIMITER $$

DROP PROCEDURE IF EXISTS SelectCountryArgRecive;  

CREATE PROCEDURE SelectCountryArgRecive(CountryName VARCHAR(255))
BEGIN
   SELECT
         * 
   FROM 
        country
   WHERE 
        country.country_name=CountryName;
END $$

DELIMITER ;

call SelectCountryArgRecive('Brasil');

DELIMITER $$

DROP PROCEDURE IF EXISTS SelectCountryInternArg;  

CREATE PROCEDURE SelectCountryInternArg()
BEGIN
   DECLARE CountryName VARCHAR(255);
   SET CountryName='Brasil';

   SELECT
         * 
   FROM 
        country
   WHERE 
        country.country_name=CountryName;
END $$

DELIMITER ;

call SelectCountryInternArg;

DELIMITER $$

CREATE PROCEDURE SelectCountryUsingIf(InputNumber INTEGER)
BEGIN
   
   DECLARE CountryName VARCHAR(255);

   IF InputNumber = 1 THEN
    SET CountryName = 'Brasil';
   ELSEIF InputNumber = 2 THEN
    SET CountryName = 'Paraguai';
   ELSEIF InputNumber = 3 THEN
    SET CountryName = 'Uruguai';
   ELSEIF InputNumber = 4 THEN
    SET CountryName = 'Peru';
   ELSEIF InputNumber = 5 THEN
    SET CountryName = 'Libano';
   END IF;

   SELECT CountryName AS 'Pais Selecionado';

   SELECT
        *
   FROM 
        country
   WHERE 
        country.country_name=CountryName; /*TABELA.COLUNA=VARIAVEL*/
END $$

DELIMITER ;

call SelectCountryUsingIf(2);

DELIMITER $$

CREATE PROCEDURE SelectCountryCase(InputNumber INTEGER)
BEGIN
   
   DECLARE CountryName VARCHAR(255);

   CASE 
        WHEN InputNumber = 1 THEN
            SET CountryName = 'Brasil';
        WHEN InputNumber = 2 THEN
            SET CountryName = 'Paraguai';
        WHEN InputNumber = 3 THEN
            SET CountryName = 'Uruguai';
        WHEN InputNumber = 4 THEN
            SET CountryName = 'Peru';
        WHEN InputNumber = 5 THEN
            SET CountryName = 'Libano';
   END CASE;   

   SELECT CountryName AS 'Pais Selecionado';

   SELECT
        *
   FROM 
        country
   WHERE 
        country.country_name=CountryName; /*TABELA.COLUNA=VARIAVEL*/
END $$

DELIMITER ;

call SelectCountryCase(3);

/* 
call SelectCountry;
SHOW PROCEDURE STATUS;
*/
