/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */

SELECT DISTINCT first_name, last_name 
FROM actor 
    JOIN film_actor USING (actor_id) 
    JOIN film USING (film_id) 
    JOIN film_category USING (film_id) 
    JOIN category USING (category_id) 
    WHERE category.name = 'Children' and 
        actor_id NOT IN 
        (SELECT actor_id FROM actor 
            JOIN film_actor USING (actor_id) 
            JOIN film USING (film_id) 
            JOIN film_category USING (film_id) 
            JOIN category USING (category_id) 
            WHERE category.name = 'Horror') 
    ORDER BY last_name, first_name asc;
