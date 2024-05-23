# mostrar todos los registros de la tabla de movies
select *from movies;
# mostrar el nombre, apellido, raiting de todos los actores
select first_name, last_name, rating from actors;
# mostrar el título de todas las series
select title  from series;
# mostrar título, rating y duración de la tabla movies
select title, rating, length from movies;
# mostrar nombre y apellido de los actores cuyo rating sea mayor a 7.5 
select first_name, last_name from actors 
where rating > 7.5;
# mostrar el título de las películas, el rating y los premios de las películas con un rating mayor a 7.5 y con mas de dos premios
select title, rating, awards from movies
where rating > 7.5 and awards > 2;
# 7 mostrar el título de las películas y el rating ordenadas por rating en forma ascendente 
select title, rating from movies
order by rating asc;
# 8 mostrar actores cuyo rating se encuentre entre 4.0 y 10.0
select first_name, last_name, rating from actors
where rating between 4.0 and 10.0;
# 9 mostrar los títulos y las fechas de lanzamiento de las películas cuya duración sea más de 150 minutos
select title, release_date from movies
where length > 150;
# 10 mostrar el título y rating de todas las películas cuyo título incluya Toy Story
select title, rating from movies
where title like '%Toy Story%';
# 11 mostrar todos los actores cuyo nombre empiece con Sam
select first_name, last_name from actors
where first_name like 'sam%';
# 12 mostrar los nombres y apellidos de los actores ordenados por su rating de forma descendente
select first_name, last_name from actors
order by rating desc;
# 13 mostrar la fecha de lanzamiento de las películas ordenadas por su rating de forma descendente
select release_date from movies
order by rating desc;
# 14 mostrar nombre y apellido de los actores cuyo nombre contiene la letra a
select first_name, last_name from actors
where first_name like '%a%';
# 15 mostrar el título de las películas que salieron entre 2004-01-01 y 2008-12-31
select title from movies
where release_date between 2004-01-01 and 2008-12-31;

  



