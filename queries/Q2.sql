/*write a query that returns email,first name , last name and genre of
all rock music litseners. return your list ordered alphabetically by
email starting with 'a'.*/

SELECT DISTINCT c.email,c.first_name,c.last_name
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
JOIN invoice_lines il
ON i.invoice_id = il.invoice_id
WHERE track_id IN (
    SELECT track_id
    FROM tracks t
    JOIN genres g
    ON t.genre_id = g.genre_id
WHERE g.name = 'Rock') 
ORDER BY c.email ;


/* lets invite the artists who have written the most rock music in in our dataset.
write a query that returns the artist name and total track count of the top 10 
rock bands.*/

SELECT COUNT(a.artist_id) AS track_count,
a.name
FROM tracks t
JOIN albums al
ON t.album_id = al.album_id
JOIN artists a
ON al.artist_id = a.artist_id
JOIN genres g
ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY a.artist_id
ORDER BY track_count DESC
LIMIT 10;


/*return all the track names that have song length longer than the average song
length.return the name and milliseconds for each track.order by the song length
with the longest song listed first.*/


SELECT name,milliseconds
FROM tracks
WHERE milliseconds > (
    SELECT AVG(milliseconds)
    FROM tracks
)
ORDER BY milliseconds DESC;
