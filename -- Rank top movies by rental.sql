-- Rank top movies by rental
SELECT
	f.film_id
	,f.title
	,f.rating
	,COUNT(r.rental_id)
	,RANK() OVER (ORDER BY COUNT(r.rental_id) DESC)
FROM 
	rental r 
INNER JOIN inventory i 
	ON r.inventory_id = i.inventory_id 
INNER JOIN film f 
	ON i.film_id = f.film_id
GROUP BY 
	f.film_id 
	,f.title
	,f.rating
ORDER BY 
	COUNT(r.rental_id) DESC

-- find 3rd highest paying customer
SELECT 
	c.customer_id
	,c.first_name
	,c.last_name
	,SUM(p.amount)
FROM 
	customer as c 
INNER JOIN payment as p 
	ON c.customer_id = p.customer_id 
GROUP BY 
	c.customer_id
	,c.first_name
	,c.last_name
ORDER BY 
	SUM(p.amount) DESC 
LIMIT 1 OFFSET 3
