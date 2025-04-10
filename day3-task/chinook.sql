SHOW DATABASES;

USE Chinook;
SHOW TABLES;

SELECT * FROM Customer WHERE Country = 'USA';

SELECT FirstName, LastName, Email FROM Customer ORDER BY LastName ASC;

SELECT Country, COUNT(*) AS CustomerCount FROM Customer GROUP BY Country ORDER BY CustomerCount DESC;

SELECT Name, Milliseconds FROM Track WHERE Milliseconds > 300000 ORDER BY Milliseconds DESC;

SELECT Invoice.InvoiceId, Invoice.Total, Customer.FirstName, Customer.LastName
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId;

SELECT Track.Name AS TrackName, Genre.Name AS Genre
FROM Track
LEFT JOIN Genre ON Track.GenreId = Genre.GenreId;

SELECT Album.Title, Artist.Name
FROM Artist
RIGHT JOIN Album ON Artist.ArtistId = Album.ArtistId;

SELECT FirstName, LastName
FROM Customer
WHERE CustomerId IN (
  SELECT CustomerId FROM Invoice WHERE Total > 15
);

SELECT Name, UnitPrice FROM Track
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Track);

SELECT CustomerId, SUM(Total) AS TotalSpent
FROM Invoice
GROUP BY CustomerId
ORDER BY TotalSpent DESC;

SELECT AlbumId, AVG(Milliseconds) AS AvgDuration
FROM Track
GROUP BY AlbumId;

CREATE VIEW TopTracks AS
SELECT TrackId, COUNT(*) AS TimesSold
FROM InvoiceLine
GROUP BY TrackId
ORDER BY TimesSold DESC
LIMIT 10;

CREATE INDEX idx_track_name ON Track(Name);

SELECT * FROM Track WHERE Name LIKE '%love%';

SELECT * 
FROM Customer 
WHERE CustomerId NOT IN (SELECT DISTINCT CustomerId FROM Invoice);

SELECT AlbumId, COUNT(*) AS TrackCount 
FROM Track 
GROUP BY AlbumId 
HAVING COUNT(*) > 10;

SELECT GenreId, Name, UnitPrice 
FROM Track t1 
WHERE UnitPrice = (
  SELECT MAX(UnitPrice) 
  FROM Track t2 
  WHERE t2.GenreId = t1.GenreId
);

SELECT * 
FROM Employee 
WHERE ReportsTo IS NOT NULL;

SELECT BillingCity, COUNT(*) AS InvoiceCount 
FROM Invoice 
GROUP BY BillingCity;


SELECT Artist.Name, COUNT(*) AS Sales
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist.ArtistId
ORDER BY Sales DESC
LIMIT 1;

SELECT Customer.Country, SUM(Invoice.Total) AS Revenue
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.Country
ORDER BY Revenue DESC;


