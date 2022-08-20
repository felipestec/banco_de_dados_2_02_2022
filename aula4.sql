SELECT
    *
FROM
    city
WHERE
    city.CountryCode = (
        SELECT
            code
        FROM
            country
        WHERE
            country.Name = 'Afghanistan'
    );