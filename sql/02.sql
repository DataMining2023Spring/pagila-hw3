/*
 * Compute the country with the most customers in it. 
 */

SELECT country FROM (SELECT DISTINCT
    country, count(*)
    FROM customer c1
    JOIN address a1 ON c1.address_id = a1.address_id
    JOIN city ON a1.city_id = city.city_id
    JOIN country cy1 ON city.country_id = cy1.country_id
    GROUP BY country
    ORDER BY count(*) DESC
    LIMIT 1
) AS foo
    ;

