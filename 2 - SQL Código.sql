CREATE TABLE movies (
  title CHAR(100),
  year INT,
  length INT,
  genre CHAR(10),
  studioName CHAR(30),
  producerC INT
);

INSERT INTO movies (title, year, length, genre, studioName, producerC)
VALUES ("John Wick", 2014, 101, "Action", "Thunder Road Pictures", 10131231);
  
SELECT * FROM movies;

SELECT *
FROM country;

SELECT
  Code,
  Name,
  Continent,
  Region,
  SurfaceArea,
  IndepYear,
  Population,
  LifeExpectancy,
  GNP,
  GNPOld,
  LocalName,
  GovernmentForm,
  HeadOfState,
  Capital,
  Code2
FROM
  country;


SELECT
  Code,
  Name,
  Continent,
  Population,
  LifeExpectancy
FROM
  country;

SELECT Continent FROM country;

SELECT DISTINCT Continent FROM country;

SELECT Name, SurfaceArea, Population, Population/SurfaceArea FROM country;

SELECT Name, SurfaceArea, Population, Population/SurfaceArea AS HabsPorKm2 FROM country;

SELECT Name, Population
FROM city
WHERE CountryCode = 'COL';

SELECT
  Name,
  Continent,
  Population
FROM
  country
WHERE
  Population < 10000;

SELECT
  Name,
  Continent,
  Population
FROM
  country
WHERE
  Population < 1000000000;

SELECT
  Name, Continent, Population
FROM
  country
WHERE
  Population < 10000 AND
  Continent <> 'Oceania' AND
  Continent <> 'Antarctica'	;

SELECT
  Name, Continent, SurfaceArea
FROM
  country
WHERE
  SurfaceArea NOT BETWEEN 15 AND 8000000;

SELECT
  Name, Continent
FROM
  country
WHERE
  Continent IN ('Oceania', 'Antarctica');

SELECT Name
FROM city
WHERE CountryCode = 'COL' AND Name LIKE 'Flor%';

SELECT Name
FROM city
WHERE CountryCode = 'COL' AND Name LIKE 'Flor_____';

SELECT Name
FROM city
WHERE CountryCode = 'COL' AND Name LIKE '%ra';

SELECT Name
FROM city
WHERE CountryCode = 'COL' AND Name LIKE '_____ra';

SELECT *
FROM country
WHERE LifeExpectancy IS NULL;

SELECT *
FROM country
ORDER BY SurfaceArea DESC;

SELECT *
FROM country
ORDER BY Continent, Region, SurfaceArea DESC;

SELECT COUNT(*)
FROM city
WHERE CountryCode = 'COL';

SELECT COUNT(*)
FROM country
WHERE GNP > 122823.882427;

SELECT AVG(GNP)
FROM country;

SELECT COUNT(DISTINCT Continent)
FROM country;

SELECT Count(Name) NumCiudades, Sum(Population) PoblacionTotal
FROM city
WHERE CountryCode = 'COL';

SELECT
  MIN(Population) AS MinPoblacion,
  AVG(Population) AS PromPoblacion,
  MAX(Population) AS MaxPoblacion
FROM city
WHERE CountryCode = 'COL';

SELECT
  District,
  MIN(Population) AS MinPoblacion,
  AVG(Population) AS PromPoblacion,
  MAX(Population) AS MaxPoblacion
FROM city
WHERE CountryCode = 'COL'
GROUP BY District;

SELECT
  DISTINCT city_o.District District,
  ( SELECT MIN(Population)
    FROM city city_i
    WHERE city_i.CountryCode = 'COL' AND
         city_i.District = city_o.District) AS MinPoblacion,
  ( SELECT AVG(Population)
    FROM city city_i
    WHERE city_i.CountryCode = 'COL' AND
         city_i.District = city_o.District) AS PromPoblacion,
  ( SELECT MAX(Population)
    FROM city city_i
    WHERE city_i.CountryCode = 'COL' AND
         city_i.District = city_o.District) AS MaxPoblacion
FROM city city_o
WHERE city_o.CountryCode = 'COL'
GROUP BY city_o.District
ORDER BY city_o.District ASC;

SELECT
       District,
       COUNT(Population) AS CntPoblacion,
       MIN(Population) AS MinPoblacion,
       AVG(Population) AS PromPoblacion,
       MAX(Population) AS MaxPoblacion
FROM city
WHERE CountryCode = 'COL'
GROUP BY District
HAVING COUNT(Population) > 1
ORDER BY District DESC;

SELECT Name, Population - (SELECT AVG(Population) FROM city WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Colombia'))
FROM city
WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Colombia') AND
      Population > (SELECT AVG(Population) FROM city WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Colombia'));


SELECT NAME,
       Population - (SELECT Avg(Population)
                     FROM   city
                     WHERE  countrycode = (SELECT code
                                           FROM   country
                                           WHERE  NAME = 'Colombia'))
FROM   city
WHERE  countrycode = (SELECT code
                      FROM   country
                      WHERE  NAME = 'Colombia')
  AND Population > (SELECT Avg(Population)
                    FROM   city
                    WHERE  countrycode = (SELECT code
                                          FROM   country
                                          WHERE  NAME = 'Colombia'));

SELECT District, Name, Population
FROM city
WHERE CountryCode = 'COL' AND District = 'Antioquia';

SELECT District, Name, Population
FROM city
WHERE CountryCode = 'COL' AND
      Population > SOME (	SELECT Population
                           FROM city
                           WHERE CountryCode = 'COL' AND District = 'Antioquia')
ORDER BY Population DESC;

SELECT District, Name, Population
FROM city
WHERE CountryCode = 'COL' AND
      Population > ALL (	SELECT Population
                           FROM city
                           WHERE CountryCode = 'COL' AND District = 'Antioquia')
ORDER BY Population DESC;

SELECT x.*, y.*
FROM tabla1 x, tabla2 y;

SELECT x.*, y.*
FROM tabla1 x, tabla2 y
WHERE x.id = y.id;

SELECT x.*, y.*
FROM tabla1 x JOIN tabla2 y ON x.id = y.id;

SELECT *
FROM customers cus LEFT OUTER JOIN orders ord ON cus.customer_id = ord.customer_id;

SELECT *
FROM customers cus RIGHT OUTER JOIN orders ord ON cus.customer_id = ord.customer_id;

SELECT *
FROM customers cus FULL OUTER JOIN orders ord ON cus.customer_id = ord.customer_id;

SELECT *
FROM customers cus LEFT OUTER JOIN orders ord ON cus.customer_id = ord.customer_id
UNION
SELECT *
FROM customers cus RIGHT OUTER JOIN orders ord ON cus.customer_id = ord.customer_id;

SELECT *
FROM customers cus LEFT OUTER JOIN orders ord ON cus.customer_id = ord.customer_id
UNION ALL
SELECT *
FROM customers cus RIGHT OUTER JOIN orders ord ON cus.customer_id = ord.customer_id;

SELECT *
FROM customers cus
WHERE EXISTS (SELECT * FROM orders ord WHERE ord.customer_id = cus.customer_id);

INSERT INTO orders
   (order_id,
    order_date,
    amount,
    customer_id)
VALUES
       (34, '03/14/1760', 45.6, 1);


INSERT INTO orders
    (order_id,
     order_date,
     amount,
     customer_id)
VALUES
       (SELECT * FROM orders WHERE order_id = 1);

UPDATE orders
SET amount = amount * 1.10;

UPDATE orders
SET amount = amount * 1.10
WHERE custore_id = 1;

UPDATE orders
SET amount = amount * 1.10, order_date = REPLACE(order_date,'/','-')
WHERE custore_id = 1;
