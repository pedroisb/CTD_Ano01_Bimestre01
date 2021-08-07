SELECT title AS titulo FROM series;

SELECT title FROM movies
WHERE rating > 3 AND awards > 1 AND '1988-01-01' <= release_date <= '2009-12-31' 
ORDER BY title DESC;

-- ou relase_date 1988-01-01 < 2009-12-13
-- ou BETEWEEN 'x' AND 'y'

SELECT title FROM movies
ORDER BY rating
LIMIT 3
OFFSET 9;

-- ASC é o valor default do ORDER BY

SELECT title, rating FROM episodes
ORDER BY rating
LIMIT 3;

SELECT first_name, last_name, favorite_movie_id AS filme_favorito FROM actors
ORDER BY first_name;

-- SELECT * FROM actors, usa-se o * para designar tudo

SELECT first_name AS nome, last_name AS sobrenome FROM actors;

SELECT title FROM movies 
WHERE title LIKE '%Toy_Story%';