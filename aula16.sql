DROP DATABASE IF EXISTS calendars;
CREATE DATABASE calendars;

USE calendars;

CREATE TABLE calendars (
    id       INTEGER AUTO_INCREMENT,
    fulldate DATE UNIQUE,
    day      TINYINT NOT NULL,
    month    TINYINT NOT NULL,
    quarter  TINYINT NOT NULL,
    year     INT NOT NULL,
    PRIMARY KEY (id)

);

DELIMITER $$

CREATE PROCEDURE InsertCalendar(dt DATE)
BEGIN
    INSERT INTO calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    VALUES(
        dt,
        EXTRACT(day FROM dt),
        EXTRACT(month FROM dt),
        EXTRACT(quarter FROM dt),
        EXTRACT(year FROM dt)

    );
END$$

DELIMITER ;

-- call InsertCalendar("2021-11-22");

DELIMITER $$

CREATE PROCEDURE LoadCalendars(
    startDate DATE,
    day INT
)
BEGIN

    DECLARE counter INT DEFAULT 1;
    DECLARE dt DATE DEFAULT startDate;

    WHILE counter <= day DO
        CALL InsertCalendar(dt);
        SET counter = counter + 1;
        SET dt = DATE_ADD(dt,INTERVAL 1 day);
    END WHILE;

END$$

DELIMITER ;

call LoadCalendars("2022-05-05", 15);

DELIMITER $$

CREATE PROCEDURE RepeatDemo()
BEGIN

    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(100) DEFAULT '';

    REPEAT 
        SET result = CONCAT(result,counter, ',');
        SET counter = counter + 1;
    UNTIL counter >= 10
    END REPEAT;

    SELECT result;
END$$

DELIMITER ;

call RepeatDemo();


