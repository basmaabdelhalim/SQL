/*1 Query.... query that used for first insight*/

select C.Country ,
       COUNT(I.INVOICEID) AS TIMES_PURCHASED

FROM Customer C
JOIN Invoice I
     ON C.CustomerId = I.CustomerId
GROUP BY I.BillingCountry
ORDER BY TIMES_PURCHASED DESC ;

/*2 Query..... the query used for the second insight*/

SELECT C.Email ,
       G.Name , 
       C.LastName , 
       C.FirstName , 
       COUNT(I.INVOICEID) AS TIMES_PURCHASED

FROM Customer C
JOIN Invoice I
USING(CustomerId)
JOIN InvoiceLine IL
USING (InvoiceId)
JOIN TRACK	T
USING(TrackId)
JOIN Genre G
USING(GenreId)
WHERE G.NAME = "Rock"
GROUP BY C.Email,G.Name, C.LastName,C.FirstName 
ORDER BY TIMES_PURCHASED DESC ;

/*3 Query.... the query userd for  third insight*/

ELECT G.Name ,  
       ROUND(SUM(IL.UnitPrice*IL.Quantity)) AS TOTAL_PURCASED
FROM Genre G
JOIN Track T 
ON G.GenreId = T.GenreId
JOIN InvoiceLine IL
ON T.TrackId = IL.TrackId
JOIN Invoice I
ON IL.InvoiceId = I.InvoiceId
GROUP BY G.Name 
ORDER BY I.InvoiceId DESC ; 


/*4th query .... that used for fourth unsight*/
 
SELECT T.NAME,
       AVG(T.Milliseconds) AS AVG_TIME,
	   AL.Title
FROM TRACK T
JOIN Album AL
ON T.AlbumId = AL.AlbumId
GROUP BY T.Name 
HAVING AVG(T.Milliseconds)>(SELECT AVG(T.Milliseconds) AS AVG_NAME   
                            FROM TRACK T) 
ORDER BY T.Milliseconds DESC;