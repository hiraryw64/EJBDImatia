/*MUY FÁCIL*/
/*Ejercicio 1*/
SELECT *
FROM MOVIES;

/*Ejercicio 2*/
SELECT *
FROM GENRES;

/*Ejercicio 3*/
SELECT *
FROM STUDIOS
WHERE STUDIO_ACTIVE = TRUE;

/*Ejercicio 4*/
SELECT *
FROM MEMBERS
ORDER BY MEMBER_ID DESC
LIMIT 20;

/*FÁCIL*/
/*Ejercicio 5*/
SELECT COUNT(*), MOVIE_DURATION
FROM MOVIES
GROUP BY MOVIE_DURATION
ORDER BY MOVIE_DURATION
LIMIT 20;

/*Ejercicio 6*/
SELECT *
FROM MOVIES
WHERE YEAR(MOVIE_LAUNCH_DATE) > 2000
AND MOVIE_NAME LIKE 'A%';

/*Ejercicio 7*/
SELECT *
FROM ACTORS
WHERE MONTH(ACTOR_BIRTH_DATE) = 7;

/*Ejercicio 8*/
SELECT *
FROM ACTORS
WHERE NOT MONTH(ACTOR_BIRTH_DATE) = 7
AND ACTOR_DEAD_DATE IS NULL;

/*Ejercicio 9*/
SELECT DIRECTOR_NAME, DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURDATE()) AS DIRECTOR_AGE 
FROM DIRECTORS
WHERE DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURDATE()) <= 50
AND DIRECTOR_DEAD_DATE IS NULL;

/*Ejercicio 10*/
SELECT ACTOR_NAME, DATEDIFF(YEAR, ACTOR_BIRTH_DATE, CURDATE()) AS ACTOR_AGE 
FROM ACTORS
WHERE DATEDIFF(YEAR, ACTOR_BIRTH_DATE, CURDATE()) < 50
AND ACTOR_DEAD_DATE IS NOT NULL;

/*Ejercicio 11*/
SELECT DIRECTOR_NAME
FROM DIRECTORS
WHERE DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURDATE()) <= 40
AND DIRECTOR_DEAD_DATE IS NULL;

/*Ejercicio 12*/
SELECT AVG(DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURDATE())) AS EDAD_MEDIA_VIVOS
FROM DIRECTORS
WHERE DIRECTOR_DEAD_DATE IS NULL;

/*Ejercicio 13*/
SELECT AVG(DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURDATE())) AS EDAD_MEDIA_MUERTOS
FROM DIRECTORS
WHERE DIRECTOR_DEAD_DATE IS NOT NULL;

/*MEDIA*/
/*Ejercicio 14*/
SELECT MOVIE_NAME, STUDIO_NAME
FROM MOVIES INNER JOIN STUDIOS ON MOVIES.STUDIO_ID = STUDIOS.STUDIO_ID;

/*Ejercicio 15*/
SELECT DISTINCT MEMBER_NAME
FROM MEMBERS INNER JOIN MEMBERS_MOVIE_RENTAL ON MEMBERS.MEMBER_ID = MEMBERS_MOVIE_RENTAL.MEMBER_ID
WHERE YEAR(MEMBER_RENTAL_DATE) BETWEEN 2010 AND 2015;

/*Ejercicio 16*/
SELECT COUNT(MOVIE_ID) AS CANTIDAD_PELIS, NATIONALITY_NAME
FROM MOVIES INNER JOIN NATIONALITIES ON MOVIES.NATIONALITY_ID = NATIONALITIES.NATIONALITY_ID
GROUP BY NATIONALITY_NAME;

/*Ejercicio 17*/
SELECT *
FROM MOVIES INNER JOIN GENRES ON MOVIES.GENRE_ID = GENRES.GENRE_ID
WHERE GENRE_NAME = 'Documentary';

/*Ejercicio 18*/
SELECT MOVIE_NAME, DIRECTOR_NAME, YEAR(DIRECTOR_BIRTH_DATE) AS YEAR_BIRTH 
FROM DIRECTORS INNER JOIN MOVIES ON DIRECTORS.DIRECTOR_ID = MOVIES.DIRECTOR_ID
WHERE YEAR(DIRECTOR_BIRTH_DATE) >= 1980
AND DIRECTOR_DEAD_DATE IS NULL;

/*Ejercicio 19*/
SELECT DIRECTOR_NAME, MEMBER_NAME, MEMBER_TOWN, DIRECTOR_BIRTH_PLACE
FROM DIRECTORS, MEMBERS
WHERE MEMBER_TOWN = DIRECTOR_BIRTH_PLACE;

/*Ejercicio 20*/
SELECT MOVIE_NAME, MOVIE_LAUNCH_DATE
FROM MOVIES INNER JOIN STUDIOS ON MOVIES.STUDIO_ID = STUDIOS.STUDIO_ID
WHERE STUDIO_ACTIVE = FALSE;

/*Ejercicio 21*/
SELECT MOVIE_NAME, MEMBER_RENTAL_DATE
FROM MOVIES INNER JOIN MEMBERS_MOVIE_RENTAL ON MOVIES.MOVIE_ID = MEMBERS_MOVIE_RENTAL.MOVIE_ID
ORDER BY MEMBER_RENTAL_DATE DESC
LIMIT 10;

/*Ejercicio 22*/
SELECT DIRECTOR_NAME, COUNT(*) AS TOTAL_MOVIES
FROM DIRECTORS INNER JOIN MOVIES ON DIRECTORS.DIRECTOR_ID = MOVIES.DIRECTOR_ID
WHERE MOVIE_LAUNCH_DATE BETWEEN DIRECTOR_BIRTH_DATE AND DATE_ADD(DIRECTOR_BIRTH_DATE, INTERVAL 41 YEAR)
GROUP BY DIRECTOR_ID;

/*Ejercicio 23*/
SELECT DIRECTOR_NAME, AVG(MOVIE_DURATION) AS MEDIA_DURACION
FROM MOVIES INNER JOIN DIRECTORS ON DIRECTORS.DIRECTOR_ID = MOVIES.DIRECTOR_ID
GROUP BY DIRECTOR_NAME;

/*Ejercicio 24*/
SELECT MOVIE_NAME, MOVIE_DURATION
FROM MOVIES INNER JOIN MEMBERS_MOVIE_RENTAL ON MOVIES.MOVIE_ID = MEMBERS_MOVIE_RENTAL.MOVIE_ID
WHERE MEMBER_RENTAL_DATE >= '2017-01-25'
ORDER BY MOVIE_DURATION
LIMIT 1;

/*Ejercicio 25*/
SELECT DIRECTOR_NAME, COUNT(MOVIE_ID)
FROM MOVIES INNER JOIN DIRECTORS ON MOVIES.DIRECTOR_ID = DIRECTORS.DIRECTOR_ID
WHERE MOVIE_NAME LIKE '%The%'
AND YEAR(MOVIE_LAUNCH_DATE) BETWEEN 1960 AND 1989
GROUP BY DIRECTOR_NAME;

/*DIFÍCIL*/
/*Ejercicio 26*/
SELECT MOVIE_NAME, NATIONALITY_NAME, DIRECTOR_NAME
FROM MOVIES INNER JOIN DIRECTORS ON MOVIES.DIRECTOR_ID = DIRECTORS.DIRECTOR_ID
INNER JOIN NATIONALITIES ON MOVIES.NATIONALITY_ID = NATIONALITIES.NATIONALITY_ID;

/*Ejercicio 27*/
SELECT MOVIE_NAME, ACTOR_NAME
FROM MOVIES INNER JOIN MOVIES_ACTORS ON MOVIES.MOVIE_ID = MOVIES_ACTORS.MOVIE_ID
INNER JOIN ACTORS ON MOVIES_ACTORS.ACTOR_ID = ACTORS.ACTOR_ID;

/*Ejercicio 28*/
SELECT DIRECTOR_NAME
FROM DIRECTORS INNER JOIN MOVIES ON DIRECTORS.DIRECTOR_ID = MOVIES.DIRECTOR_ID
INNER JOIN MEMBERS_MOVIE_RENTAL ON MOVIES.MOVIE_ID = MEMBERS_MOVIE_RENTAL.MOVIE_ID
GROUP BY DIRECTOR_ID
ORDER BY COUNT(MEMBER_MOVIE_RENTAL_ID) DESC
LIMIT 1;

/*Ejercicio 29*/
SELECT STUDIO_NAME, SUM(AWARD_WIN) AS TOTAL_AWARDS
FROM STUDIOS INNER JOIN MOVIES ON STUDIOS.STUDIO_ID = MOVIES.STUDIO_ID
INNER JOIN AWARDS ON AWARDS.MOVIE_ID = MOVIES.MOVIE_ID
GROUP BY STUDIO_ID;

/*Ejercicio 30*/
SELECT ACTOR_NAME, SUM(AWARD_NOMINATION) AS NOMINATED
FROM AWARDS INNER JOIN MOVIES ON AWARDS.MOVIE_ID = MOVIES.MOVIE_ID
INNER JOIN MOVIES_ACTORS ON MOVIES_ACTORS.MOVIE_ID = MOVIES.MOVIE_ID
INNER JOIN ACTORS ON ACTORS.ACTOR_ID = MOVIES_ACTORS.ACTOR_ID
GROUP BY ACTOR_NAME;

/*Ejercicio 31*/
SELECT STUDIO_NAME, COUNT(DISTINCT ACTOR_ID) AS TOTAL_ACTORS, COUNT(DISTINCT DIRECTOR_ID) AS TOTAL_DIRECTORS
FROM STUDIOS INNER JOIN MOVIES ON STUDIOS.STUDIO_ID = MOVIES.STUDIO_ID
INNER JOIN DIRECTORS ON DIRECTORS.DIRECTOR_ID = MOVIES.DIRECTOR_ID
INNER JOIN MOVIES_ACTORS ON MOVIES_ACTORS.MOVIE_ID = MOVIES.MOVIE_ID
WHERE STUDIO_ACTIVE = FALSE
GROUP BY STUDIOS.STUDIO_ID;

/*Ejercicio 32*/
SELECT DISTINCT MEMBER_NAME, MEMBER_TOWN, MEMBER_PHONE
FROM MEMBERS INNER JOIN MEMBERS_MOVIE_RENTAL ON MEMBERS.MEMBER_ID = MEMBERS_MOVIE_RENTAL.MEMBER_ID
INNER JOIN MOVIES ON MOVIES.MOVIE_ID = MEMBERS_MOVIE_RENTAL.MOVIE_ID
INNER JOIN AWARDS ON MOVIES.MOVIE_ID = AWARDS.MOVIE_ID
WHERE AWARD_NOMINATION > 150 AND AWARD_WIN < 50;

/*Ejercicio 33*/
SELECT DIRECTOR_NAME, DIRECTOR_BIRTH_DATE, DIRECTOR_DEAD_DATE, MOVIE_NAME, MOVIE_LAUNCH_DATE
FROM DIRECTORS INNER JOIN MOVIES ON DIRECTORS.DIRECTOR_ID = MOVIES.DIRECTOR_ID
WHERE DIRECTOR_BIRTH_DATE > MOVIE_LAUNCH_DATE OR DIRECTOR_DEAD_DATE < MOVIE_LAUNCH_DATE;

/*Ejercicio 34*/
UPDATE DIRECTORS
SET DIRECTOR_DEAD_DATE = DATEADD(YEAR, 1, (SELECT MAX(MOVIE_LAUNCH_DATE)
											FROM MOVIES
											WHERE MOVIES.DIRECTOR_ID = DIRECTORS.DIRECTOR_ID
											AND DIRECTOR_DEAD_DATE < MOVIE_LAUNCH_DATE))
WHERE DIRECTOR_DEAD_DATE < (SELECT MAX(MOVIE_LAUNCH_DATE)
							FROM MOVIES
							WHERE MOVIES.DIRECTOR_ID = DIRECTORS.DIRECTOR_ID
							AND DIRECTOR_DEAD_DATE < MOVIE_LAUNCH_DATE);

/*BERSERK*/
/*Ejercicio 35*/
/*Pendiente de limitar a un resultado por director*/
SELECT DIRECTOR_NAME, GENRE_NAME, COUNT(GENRE_NAME) AS RECUENTO
FROM DIRECTORS INNER JOIN MOVIES ON DIRECTORS.DIRECTOR_ID = MOVIES.DIRECTOR_ID
INNER JOIN GENRES ON MOVIES.GENRE_ID = GENRES.GENRE_ID
GROUP BY DIRECTOR_NAME, GENRE_NAME
ORDER BY DIRECTOR_NAME, COUNT(GENRE_NAME) DESC; 

/*Ejercicio 36*/
/*Pendiente de limitar a un resultado por estudios*/
SELECT STUDIO_NAME, NATIONALITY_NAME, COUNT(NATIONALITY_NAME)
FROM STUDIOS INNER JOIN MOVIES ON STUDIOS.STUDIO_ID = MOVIES.STUDIO_ID
INNER JOIN NATIONALITIES ON NATIONALITIES.NATIONALITY_ID = MOVIES.NATIONALITY_ID
GROUP BY STUDIO_NAME, NATIONALITY_NAME
ORDER BY STUDIO_NAME, COUNT(NATIONALITY_NAME) DESC;

/*Ejercicio 37*/
/*Seguramente haya una forma complicada de resolver este ejercicio, sin embargo, considero que realmente puede simplificarse la consulta y quedarse de esta manera:*/
SELECT MEMBER_NAME, MIN(MEMBER_RENTAL_DATE) AS FIRST_RENTAL
FROM MEMBERS INNER JOIN MEMBERS_MOVIE_RENTAL ON MEMBERS.MEMBER_ID = MEMBERS_MOVIE_RENTAL.MEMBER_ID
WHERE MEMBER_PHONE NOT LIKE '%0'
GROUP BY MEMBER_NAME
ORDER BY MEMBER_NAME;
/*La razón por la que he obviado toda la parte del ID de alguna nacionalidad y he realizado ese where es debido a que hay más de 9 nacionalidades, por lo que todos los números del 1 al 9 quedan cubiertos.
 * Dado que SOLO se pide un único dígito para el número de teléfono, el único número en el que NO puede acabar es 0, ya que no hay un ID 0, pero sí números de teléfono acabados por 0.
 * Y como no se menciona qué hacer en caso de que los números de ID sean de más de una cifra... Aparte, tampoco se pide ningún tipo de orden o agrupación, por lo que técnicamente no sería necesaria esa relación.*/