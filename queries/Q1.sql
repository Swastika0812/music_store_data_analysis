--who is the senior most employee based on the job title

SELECT employee_id,
first_name,last_name,title,
EXTRACT(YEAR FROM age(CURRENT_DATE, birthdate)) AS age
 FROM  employees
 ORDER BY age DESC
 LIMIT 1;


 --which countries have the most invoices

 SELECT c.country,
 COUNT(i.invoice_id) AS total_invoices
 FROM customers c
 JOIN invoices i
 ON c.customer_id = i.customer_id
 GROUP BY c.country
 ORDER BY total_invoices DESC
 LIMIT 3;


 --what are the top 3 values of total invoices

SELECT total
FROM invoices
ORDER BY total DESC
LIMIT 3;

 /*which city has the best customers.we would like to throw a promotional music
 festival in the city where we made most money.write a query that returns one city
has the highest sum of total invoices. return both the city and sum of invoice totals.*/

SELECT billing_city,
    SUM(total) AS total_invoices
FROM invoices
GROUP BY billing_city
ORDER BY total_invoices DESC
LIMIT 1;



/*who is the best customer.the customer who has spent the most money will bedeclared the 
best customer.write a query that returns the person who has spent the most money.*/

SELECT c.first_name,c.last_name,
SUM(i.total) AS total_spent
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;



 

