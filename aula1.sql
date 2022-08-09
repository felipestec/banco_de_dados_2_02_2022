SELECT 
    "Use Mysql database" 
AS 
    "INFO";

USE mysql;

SELECT 
    "Drop database aula1 if exist" 
AS 
    "INFO";

DROP DATABASE IF EXISTS aula1;

SELECT 
    "The criation of database" 
AS 
    "INFO";

CREATE DATABASE aula1;

SELECT
    "Use of database"
AS
    "INFO";

USE aula1;

SELECT
    "Create table students"
AS
    "INFO";

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id_ano              INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name          VARCHAR(255) NOT NULL,
    last_name           VARCHAR(255) NOT NULL,
    gender              ENUM("MA","FE"),
    code_registration   INTEGER UNIQUE,
    status              BOOLEAN DEFAULT true,
    created_at          DATETIME DEFAULT NOW(),
    deleted_at          DATETIME

);

DESCRIBE students;

INSERT INTO students (
    first_name,
    last_name,
    gender,
    code_registration
)
    VALUES
(
    'Brunno',
    'Oliveira',
    'MA',
    1
),
(
    'Douglas',
    'Arving',
    'MA',
    2
),
(
    'Ernani',
    'Paz',
    'MA',
    3
);

SELECT * FROM students;


SELECT
    "Select Specific columns"
AS
    "INFO";

SELECT
    first_name,
    last_name,
    gender
FROM
    students;


SELECT
    "Select Specific columns - Version 2"
AS
    "INFO";

SELECT
    students.first_name,
    students.last_name,
    students.gender
FROM
    students;

SELECT
    "Select Specific columns - Version 3"
AS
    "INFO";

SELECT
    aula1.students.first_name,
    aula1.students.last_name,
    aula1.students.gender
FROM
    aula1.students;

SELECT
    "Select Specific columns - Version 4"
AS
    "INFO";

SELECT
    aula1.students.first_name as primeiro_nome,
    aula1.students.last_name as segundo_nome,
    aula1.students.gender as sexo
FROM
    aula1.students;

SELECT
    "Select with where"
AS
    "INFO";

SELECT
    students.first_name as primeiro_nome,
    students.last_name as segundo_nome,
    students.gender as sexo
FROM
    students
where
    students.first_name =  'Ernani';


