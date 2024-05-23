# Ejercitación consultas - Bases de datos
# Consultas de base de datos movies Group By y Having
# Consultas
# Funciones de agregación, GROUP BY y HAVING

# 1 ¿Cuántas películas hay?
SELECT count(*) as cantidad_peliculas FROM movies;
# 2 ¿Cuántas películas tienen entre 3 y 7 premios?
select  count(*) as cant_peliculas, awards as premios from movies
group by awards
having premios between 3 and 7;

# 3 ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
select  count(*) as cantidad_peliculas, awards as premios, rating from movies
where rating > 7
group by id, premios
having premios between 3 and 7;

# 4 Encuentra la cantidad de actores en cada película.
select count(actor_id) cant_actores, movie_id as pelicula from actor_movie
group by pelicula;

# 5 Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por id. de género.
select count(id) as cant_peliculas,genre_id as genero from movies
group by genero;
# 6 De la consulta anterior, listar sólo aquellos géneros que tengan como suma de premios un número mayor a 5.
select count(id) as cant_peliculas, genre_id as genero, awards as premios from movies
group by genero, premios
having sum(premios) > 5;

# 7 Encuentra los géneros que tienen las películas con un promedio de calificación mayor a 6.0.
select genre_id as genero, rating from movies
group by genero, rating
having avg(rating) > 6.0;

# 8 Encuentra los géneros que tienen al menos 3 películas.
select genre_id as genero, id as pelicula from movies
group by pelicula, genero
having pelicula >= 3;