/*find how much amount spent by each customer for artists. write a query
that returns customer name, artist name and total spent.*/


SELECT c.first_name ||' '|| c.last_name AS customer_name,
a.name AS artists_name,
SUM(il.unit_price * il.quantity) AS total_spent
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
JOIN invoice_lines il
ON i.invoice_id = il.invoice_id
JOIN tracks t
ON il.track_id = t.track_id
JOIN albums al
ON t.album_id = al.album_id
JOIN artists a
ON al.artist_id = a.artist_id
GROUP BY c.customer_id, a.artist_id,customer_name,artists_name
ORDER BY total_spent DESC;


/*we want to find out the most popular music genre for each country.we determine
the most popular genre as the genre  with the highest amount of puchases,
write a query that returns each country along with top genre.for countries 
where the maximum number of purchases is shared return all genres.*/

WITH genre_purchases AS (
SELECT g.name AS genre_name,
c.country,
COUNT(il.invoice_line_id) AS purchase_count
FROM customers c JOIN invoices i
ON c.customer_id = i.customer_id
JOIN invoice_lines il
ON i.invoice_id = il.invoice_id
JOIN tracks t
ON il.track_id = t.track_id
JOIN genres g
ON t.genre_id = g.genre_id
GROUP BY c.country,genre_name
),   --this CTE counts how many purchases were made for each genre in each country

ranked_genres AS (
    SELECT country,
    genre_name,
    purchase_count,
    RANK() OVER(PARTITION BY country ORDER BY purchase_count DESC) AS genre_rank
    FROM genre_purchases

) -- this CTE use RANK()  to assign a rank to each genre within each country
   -- the highest purchase count gets rank 1 , the 2nd highest gets rank 2
SELECT country,
     genre_name,
     purchase_count
FROM ranked_genres
WHERE genre_rank=1;  --this query find the most popular genre for each country 



/* Write a query that determines the customer that has spent
 the most on music for each country. Write a query that returns the 
country along with the top customer and how much they spent. For countries 
where the top amount spent is shared, provide all customers who spent this amount.*/


WITH customer_spending AS (
SELECT c.first_name ||' '|| c.last_name AS customer_name,
c.country,
SUM(il.unit_price * il.quantity) AS total_spent
FROM customers c JOIN invoices i
ON c.customer_id = i.customer_id
JOIN invoice_lines il
ON i.invoice_id = il.invoice_id
GROUP BY c.customer_id,c.country,customer_name
ORDER BY total_spent DESC
) -- this CTE calculates the total spent by each customer in each country

SELECT country,
customer_name,
total_spent
FROM (
    SELECT country,
    customer_name,
    total_spent,
    RANK() OVER(PARTITION BY country ORDER BY total_spent DESC) AS spending_rnk
    FROM customer_spending
) AS raked_spending
WHERE spending_rnk = 1; -- this query finds the top customer