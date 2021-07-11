SELECT *
FROM genres
WHERE GenreId BETWEEN 3 AND 10;
#Shows all data from genres table with GenreId from 3 to 10

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN date_add(CURRENT_TIMESTAMP, INTERVAL -8 YEAR) AND CURRENT_TIMESTAMP;
#Shows all data from invoices table with InvoiceDate for last 8 years

SELECT *
FROM invoices
WHERE (BillingCountry = 'Germany' AND BillingCity = 'Berlin');
# Shows all data from invoices which has both arguments true.

SELECT *
FROM invoices
WHERE (BillingCountry = 'Germany' AND BillingCity = 'Berlin')
OR (CustomerId>50);
# Shows all data from invices which has both arguments true OR third argument true.

SELECT *
FROM invoices
WHERE (BillingCountry = 'Germany' OR BillingCity = 'London');
# Shows all data which has at least one of the arguments true

SELECT invoices.CustomerId, invoices.BillingCity, customers.LastName
FROM invoices
INNER JOIN customers
ON invoices.CustomerId = customers.CustomerId;
#Shows data from invoices.BillingCity and customers.LastName just for the CustomerID rows that matches in both invoices and customer tables.

SELECT invoices.CustomerId, invoices.BillingCity, customers.LastName
FROM invoices
LEFT JOIN customers
ON invoices.CustomerId = customers.CustomerId;

SELECT invoices.CustomerId, invoices.BillingCity, customers.LastName
FROM invoices
RIGHT JOIN customers
ON invoices.CustomerId = customers.CustomerId;

SELECT ArtistId 
FROM artists
UNION
SELECT ArtistId
FROM albums
# Shows ArtistId data from two tables without duplicating the data.







