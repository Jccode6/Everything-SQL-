--Ranking of customers with most rentals
SELECT 
	p.customer_id 
	,c.first_name
	,c.last_name
	,COUNT(p.rental_id)
	,ROW_NUMBER() OVER (ORDER BY COUNT(p.rental_id) DESC) AS "rank"
FROM 
	payment p
INNER JOIN customer c
	ON P.customer_id = c.customer_id
GROUP BY 
	p.customer_id
	,c.first_name
	,c.last_name
ORDER BY 
	COUNT(rental_id) DESC
