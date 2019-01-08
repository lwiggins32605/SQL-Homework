USE sakila;

SELECT first_name, last_name
FROM actor;

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS 'Actor Name'
FROM actor;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = "Joe";

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%GEN%';

SELECT actor_id, last_name, first_name
FROM actor
WHERE last_name LIKE '%LI%';

SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor
	ADD COLUMN description BLOB(50);
    
ALTER TABLE actor
	DROP COLUMN description;
    
    
SELECT last_name, COUNT(*) AS 'Number of Actors'
FROM actor GROUP BY last_name

SELECT last_name, COUNT(*) AS 'Number of Actors'
FROM actor GROUP BY last_name HAVING count(*)  >=2;

UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = "GROUCHO" AND last_name = "WILLIAMS";

UPDATE actor
SET first_name = 'GROUCHO'
WHERE actor_id = 172;

DESCRIBE sakila.address;

SELECT first_name, last_name, address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

SELECT payment.staff_id, staff.first_name, staff.last_name, payment.amount, payment.payment_date
FROM staff INNER JOIN payment ON
staff.staff_id = payment.staff_id AND payment_date LIKE '2005-08%';

SELECT f.title AS 'Film Title', COUNT(fa.actor_id) AS 'Number of Actors'
FROM film_actor fa
INNER JOIN film f 
ON fa.film_id= f.film_id
GROUP BY f.title;

SELECT title, ( SELECT COUNT(*) FROM inventory
WHERE film.film_id = inventory.film_id)
AS 'Number of Copies'
FROM film
WHERE title = "Hunchback Impossible";

SELECT c.first_name, c.last_name, sum(p.amount) AS 'Total Paid'
FROM customer c
JOIN payment p 
ON c.customer_id= p.customer_id
GROUP BY c.last_name;

SELECT title
FROM film WHERE title
LIKE 'K%' OR title LIKE 'Q%'
AND title IN 

( SELECT title
FROM film
WHERE language_id = 1);

SELECT first_name, last_name;
FROM actor
WHERE actor_id IN

 (SELECT actor_id
 FROM film_actor
 WHERE film_id IN)
 
(SELECT film_id
FROM film
WHERE title = 'Alone Trip'
));

 SELECT cus.first_name, cus.last_name, cus.email
 FROM customer cus
 JOIN address a
 ON (cus.address_id = a.address_id)
 JOIN city cty
 ON (cty.city_id = a.city_id)
 JOIN country
 ON (country.country_id = cty.country_id)
 WHERE country.country = 'Canada';
 
SELECT title, description; 
FROM film
WHERE film_id IN 


















