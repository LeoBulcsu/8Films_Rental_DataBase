USE 8FILMS_DB;

-- Who are the top ten clients in the list of late movie returns?
-- Retrieve the client ID, Client's name, which movie they rented and how long it took them to return the movie.

SELECT * 
FROM RENTAL_INVOICE;

SELECT C.customer_id,
	   C.NAME,
       F.TITLE,
       DATEDIFF(return_date, rental_date) AS delay_in_days
FROM rental_invoice AS ri
INNER JOIN clients AS C 
ON ri.customer_id = C.customer_id
INNER JOIN inventory AS I 
ON ri.inventory_id = I.inventory_id
INNER JOIN films AS F 
ON I.film_id = F.film_id
ORDER BY delay_in_days DESC
LIMIT 10;

-- What is the client that has rented most movies ever?
-- Retrieve the id, the name and how many movies has he rented since he signed up:

SELECT RI.CUSTOMER_ID,
	   C.NAME,
       COUNT(RI.RENTAL_ID) AS 'TOTAL RENTS'
FROM RENTAL_INVOICE as ri
INNER JOIN CLIENTS AS c
ON ri.customer_id = c.customer_id
GROUP BY RI.CUSTOMER_ID, C.NAME
ORDER BY `TOTAL RENTS` DESC
LIMIT 1;

-- I wanto to know everything from the rental_id 300. Who is the client, which movie rented, who gave him the movie and where he rented it. 
-- And also I would like to know if it was late and how long.

SELECT  RI.RENTAL_ID,
		F.TITLE AS 'MOVIE TITLE',
        C.NAME AS 'CLIENT NAME',
        CONCAT(S.NAME, ' ', S.SURNAME) AS 'STAFF NAME',
        RENTAL_DATE AS 'RENTED',
        RETURN_DATE AS 'RETURNED',
		DATEDIFF(return_date, rental_date) AS 'LATE'
FROM RENTAL_INVOICE as ri
INNER JOIN INVENTORY AS i
ON ri.inventory_id = i.inventory_id
INNER JOIN FILMS AS f
ON I.FILM_ID = F.FILM_ID
INNER JOIN CLIENTS AS c
ON RI.CUSTOMER_ID = C.CUSTOMER_ID
INNER JOIN STAFF AS S
ON RI.STAFF_ID = S.STAFF_ID
WHERE RENTAL_ID = 300;

-- Hi! I would like to rent an action movie that casts Rock Dukakis. Can you tell me which movies you have? Thanks.

SELECT  f.*
FROM HDDDF AS HD
INNER JOIN ACTORS AS A
ON HD.ACTOR_ID=A.ACTOR_ID
INNER JOIN CATEGORIES AS CA
ON HD.CATEGORY_ID = CA.CATEGORY_ID
INNER JOIN FILMS AS F
ON HD.FILM_ID = F.FILM_ID
WHERE A.LAST_NAME = 'DUKAKIS' AND CA.NAME = 'ACTION';

-- That's great. And how about Goldie Brody?

SELECT  f.*
FROM HDDDF AS HD
INNER JOIN ACTORS AS A
ON HD.ACTOR_ID=A.ACTOR_ID
INNER JOIN CATEGORIES AS CA
ON HD.CATEGORY_ID = CA.CATEGORY_ID
INNER JOIN FILMS AS F
ON HD.FILM_ID = F.FILM_ID
WHERE A.FIRST_NAME = 'GOLDIE' AND A.LAST_NAME = 'Brody';

-- Wow that's better! I want to watch COMANCHEROS ENEMY! Where can I get it?

SELECT S.ADDRESS,
	   COUNT(I.FILM_ID) AS 'AMOUNT OF COPIES'
FROM STORES AS S
INNER JOIN INVENTORY AS I
ON S.STORE_ID = I.STORE_ID
WHERE I.FILM_ID = 168
GROUP BY S.ADDRESS;

-- 

