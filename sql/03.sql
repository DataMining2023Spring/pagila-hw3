/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT
    country, sum(amount) AS total_payments
    FROM customer
    INNER JOIN address USING (address_id)
    INNER JOIN city USING (city_id)
    INNER JOIN country USING (country_id)
    INNER JOIN payment USING (customer_id)
    GROUP BY country
    ORDER BY total_payments DESC, country
    ;
