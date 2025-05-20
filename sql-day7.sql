
-- joins ===

use sakila;
select * from actor;
select * from film_actor;
select * from film;

select film_id , actor_id from film_actor as f ;
select f.film_id , f.actor_id from film_actor join actor as a 
;

-- combine filmactor and film table to 
-- find out the actor_id , film_id , and the movie name doen by each actor 
select fa.actor_id , fa.film_id , f.title from film_actor as fa join film as f where fa.film_id = f.film_id;

-- find out the actor_id , movie_name , only for those movies which has a length of more than 100 
select fa.actor_id , f.title , f.length from film_actor as fa join film as f where f.length>100; 

-- get the actor_id and the number of movies he has done in his carrier 
SELECT actor_id, COUNT(film_id) AS movie_count FROM film_actor GROUP BY actor_id ORDER BY movie_count DESC;

-- get the title and the film_id , for the movies whose rating is 'nc-17' and sort all these movies based on descending  film_id 
select film_id , title , rating from film where rating ='NC-17' order by film_id desc;


