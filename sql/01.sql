/*
 * Compute the number of customers who live outside of the US.
 */

SELECT DISTINCT 
    count(customer_id)
    from customer c1
    JOIN address a1 ON c1.address_id = a1.address_id
    JOIN city city1 ON a1.city_id = city1.city_id
    JOIN country cy1 ON city1.country_id = cy1.country_id
    WHERE 
        cy1.country_id != 103;

