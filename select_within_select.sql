SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name
FROM world 
WHERE continent = 'Europe' AND gdp/population > 39605.7232

SELECT name, continent 
FROM world 
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name;

SELECT name, population 
FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland');

SELECT name, concat(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100), '%' FROM world where continent = 'Europe'

SELECT name 
FROM world 
WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe');

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent = x.continent
          AND area > 0)

SELECT continent, name 
FROM world x 
WHERE name <= ALL(SELECT name FROM world y WHERE x.continent = y.continent);

SELECT y.name, y.continent, y.population
FROM world AS y
JOIN
(SELECT continent,max(population)
FROM world
GROUP BY continent
HAVING max(population) <= 25000000) AS x
ON y.continent = x.continent

SELECT name, continent FROM world x
  WHERE population > ALL(SELECT 3*population FROM world y WHERE x.continent = y.continent AND x.name <> y.name)

