# Ejercitación consultas - Bases de datos
# Consultas de base de datos movies subqueries y table reference

# Consultas
# SUBQUERIES Y TABLE REFERENCE

# 1 Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
select series.title as titulo_serie, G.name as nombre_genero from series, genres as G
where G.id = series.genre_id;

# 2 Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
select title as titulo, first_name as nombre,last_name as apellido 
from episodes as e, 
actor_episode as ae,
actors as a
where  e.id = ae.episode_id 
and a.id = ae.actor_id
group by titulo, nombre, apellido;

# 3 Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.
SELECT  A.first_name as nombre, A.last_name as apellido
FROM actors as A
WHERE ( SELECT title as titulo
        FROM movies AS peli 
		WHERE peli.id = A.favorite_movie_id ) like '%La Guerra de las galaxias%';

# 4 Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
select count( peli.id) as cant_peli, G.name as nombre_genero 
from movies as peli, genres as G
where G.id= peli.genre_id
group by nombre_genero;
