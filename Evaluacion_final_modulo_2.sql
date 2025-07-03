USE sakila;

-- EJERCICIOS OBLIGATORIOS
-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT title -- Seleccionamos la columna title de la tabla film evitando duplicados con DISTINCT
FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title, rating -- Seleccionamos las columnas de title y también rating para que se visualice junto al title de la tabla film
FROM film
WHERE rating = 'PG-13'; -- Filtramos solo las películas que tengan 'PG-13'

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT title, description -- Seleccionamos las cols title y description de la tabla film
FROM film
WHERE description LIKE '%amazing%'; -- Filtramos para obtener solo las descripciones que incluyen la palabra 'amazing' en alguna posición del título

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title, length -- Seleccionamos title y length de la tabla film
FROM film
WHERE length > 120; -- Filtramos para obtener solo las películas de más de 120 mins

-- 5. Recupera los nombres de todos los actores.
SELECT first_name, last_name -- Opción 1: seleccionamos tanto el first name como el last name de todos los actores de la tabla actor
FROM actor;

SELECT DISTINCT CONCAT(first_name, ' ', last_name) AS nombre_completo 
-- Opción 2 (y creo que la correcta): seleecionamos lo mismo que en la opción 1 pero con un DISTINCT para evitar duplicados
FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name, last_name -- Seleccionamos nombre completo (first name y last name) de la tabla actor
FROM actor
WHERE last_name LIKE '%Gibson%'; -- Filtramos para obtener solo actores apellidados 'Gibson'

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT actor_id, first_name, last_name -- Seleccionamos estas tres columnas de la tabla actor
FROM actor
WHERE actor_id BETWEEN 10 AND 20; -- Filtramos para obtener los actores cuyo actor_id está entre el 10 y el 20

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title, rating -- Seleccionamos los títulos y ratings de las pelis en la tabla film
FROM film
WHERE rating NOT IN ('R', 'PG-13'); -- Filtramos para obtener títulos que no tengan rating "R" ni "PG-13"

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT rating, COUNT(*) AS total_peliculas 
-- Seleccionamos la col rating de la tabla film y creamos un conteo de películas según su clasificación
FROM film
GROUP BY rating; -- Agrupamos el conteo total de películas según su clasificación

/*
10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, 
su nombre y apellido junto con la cantidad de películas alquiladas.
*/

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name, -- Seleccionamos estas tres columnas de la tabla customer
    COUNT(r.rental_id) AS total_alquiladas -- Hacemos un conteo del total de pelis alquiladas por cada cliente
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id 
-- Unimos cada cliente con sus pelis alquiladas asegurándonos de que aparecen todos los clientes, tengan o no pelis alquiladas
GROUP BY c.customer_id, c.first_name, c.last_name -- Agrupamos por cliente para contar
ORDER BY total_alquiladas DESC; -- Pedimos los resultados ordenados de manera descendente (muestra primero los que más han alquilado)

-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

SELECT 
    cat.name AS categoria, -- Seleccionamos los nombres de las categorías de la tabla category y renombramos la columna de resultados
    COUNT(r.rental_id) AS total_alquiladas -- Hacemos un conteo de los rental_id de la tabla rental y renombramos la columna de resultados
FROM category AS cat
INNER JOIN film_category AS fc ON cat.category_id = fc.category_id 
INNER JOIN film AS f ON fc.film_id = f.film_id -- unimos películas con categorías usando tablas intermedias
INNER JOIN inventory AS i ON f.film_id = i.film_id -- unimos películas con las film_id del inventario (tabla intermedia)
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id 
-- unimos el inventory_id de las tablas inventory y rental para contar los alquileres por cada película
GROUP BY cat.name -- Agrupamos por nombre de cada categoría
ORDER BY total_alquiladas DESC; -- Pedimos los resultados ordenados de manera descendente (veremos primero las categorías más alquiladas)

-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.

SELECT 
    rating, -- Seleccionamos las clasificaciones y de la tabla fil (y creamos columna con el promedio de duración de las películas)
    AVG(length) AS promedio_duracion -- Calculamos el promedio de duración de las películas
FROM film
GROUP BY rating -- Agrupamos por clasificación
ORDER BY promedio_duracion DESC; -- Ordenamos por el promedio de duración de las pelis de forma descendente

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT a.first_name, a.last_name -- Seleccionamos nomble y apellidos de los actores de la tabla actor
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id 
-- Unimos con la tabla film_actor porque actúa como tabla intermedia para vincular actores y películas
INNER JOIN film AS f ON fa.film_id = f.film_id
WHERE f.title = 'Indian Love'; -- De esta manera seleccionamos el título "Indian Love" para obtener solo los actores que actúan en ella

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

SELECT title, description -- Seleccionamos título y descripción de películas de la tabla film
FROM film
WHERE description LIKE '%dog%'
   OR description LIKE '%cat%'; -- Filtramos solo aquellas que contengan "dog" o "cat" en alguna posición de su descripción
   
-- 15. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT title, release_year -- Seleccionamos el título y el años de lanzamiento de las películas de la tabla film
FROM film
WHERE release_year BETWEEN '2005' AND '2010'; -- Filtramos por año de lanzamiento entre 2005 y 2010

-- 16. Encuentra el título de todas las películas que son de la misma categoría que "Family".

SELECT f.title, c.name -- Seleccionamos el título de la peli de la tabla film y el nombre de la categoría en la tabla category
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id -- Unimos los film_id con la category_id de una y otra tabla
WHERE c.name = 'Family'; -- Filtramos por la categoría "Family"

-- 17. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.

SELECT title, length -- Seleccionamos el titulo y la duración de las pelis de la tabla film
FROM film
WHERE rating = 'R'
  AND length > 120; -- Filtramos por las pelis con clasificación 'R' y con una duración mayor que 2 horas
  
-- EJERCICIOS BONUS
-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.

SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS total_peliculas 
-- Seleccionamos el nombre y apellidos de la tabla actor, y pedimos crear una columna con el conteo de películas por actor
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id -- Unimos con el actor_id de la tabla film_actor
GROUP BY a.actor_id, a.first_name, a.last_name -- Agrupamos los datos por actor
HAVING COUNT(fa.film_id) > 10 -- Filtramos solo los actores que aparecen en más de 10 pelis
ORDER BY total_peliculas DESC; 
-- Ordenamos de forma descendente por el total de películas por actor y veremos primero el actor que más películas ha hecho

-- 19. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.

SELECT a.actor_id, a.first_name, a.last_name -- Seleccionamos los actores de la tabla actor
FROM actor AS a
LEFT JOIN film_actor AS fa 
ON a.actor_id = fa.actor_id -- Unimos a la tabla film_actor por el actor_id
WHERE fa.actor_id IS NULL; -- Filtramos para que solo nos dé como resultado los actor_id sin película asociada a ellos

-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.

SELECT 
    c.name AS categoria,
    AVG(f.length) AS promedio_duracion 
-- Seleccionamos el nombre de las categorías y pedimos columna con cálculo del promedio de duración de las pelis en la tabla category
FROM category AS c
INNER JOIN film_category AS fc ON c.category_id = fc.category_id -- Unimos la category_id de la tabla film_category (tabla intermedia)
INNER JOIN film AS f ON fc.film_id = f.film_id -- Unimos el film_id de la tabla film
GROUP BY c.name -- Agrupamos por nombre de categoría
HAVING AVG(f.length) > 120 -- Filtramos por aquellas pelis cuyo promedio de duración es superior a 120 min
ORDER BY promedio_duracion DESC; 
/* Ordenamos de manera descendente, de tal manera que aparecerá primero la categoría con las películas 
que tienen un promedio de duración mayor*/