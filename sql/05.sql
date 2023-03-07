/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
*/

SELECT DISTINCT
    title
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.actor_id = fa2.actor_id
    JOIN film_actor fa3 ON fa2.film_id = fa3.film_id
    JOIN film_actor fa4 ON fa3.actor_id = fa4.actor_id
    JOIN film f1 ON fa2.film_id = f1.film_id
    WHERE 
        fa1.film_id = 21 AND
        fa4.film_id =21 AND
        fa2.actor_id != fa3.actor_id
    ;

