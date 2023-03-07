/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
SELECT
    first_name, last_name
    FROM (  SELECT
        first_name, last_name, name, actor_id
        FROM actor
        INNER JOIN film_actor USING (actor_id)
        INNER JOIN film_category USING (film_id)
        INNER JOIN category USING (category_id)
        WHERE name LIKE 'Children'
    ) AS a
    LEFT JOIN ( SELECT
        actor_id, name AS horror
        FROM actor
        INNER JOIN film_actor USING (actor_id)
        INNER JOIN film_category USING (film_id)
        INNER JOIN category USING (category_id)
        WHERE name LIKE 'Horror'
    ) AS b ON a.actor_id = b.actor_id
    WHERE horror IS NULL
    GROUP BY first_name, last_name
    ORDER BY last_name;
