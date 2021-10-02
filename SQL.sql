
-- ************************************* ÖDEV 1 ********************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT title,description
FROM film

-- SORU 2
SELECT *
FROM film
WHERE length > 60 and length < 75

-- SORU 3
SELECT *
FROM film
WHERE rental_rate = 0.99 and (replacement_cost = 12.99 or replacement_cost = 28.99)

-- SORU 4
SELECT first_name, last_name
FROM customer
WHERE first_name = 'Mary'

-- SORU 5
SELECT * 
FROM film
WHERE length < 50 and (rental_rate != 2.99 and rental_rate != 4.99)

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 2 ********************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT *
FROM film
WHERE replacement_cost BETWEEN 12.99 and 16.98;

-- SORU 2
SELECT first_name, last_name
FROM actor
WHERE first_name IN ('Penelope','Nick','Ed');

-- SORU 3
SELECT *
FROM film
WHERE rental_rate IN (0.99, 2.99, 4.99) AND replacement_cost IN (12.99, 15.99, 28.99);

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 3 ********************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT country
FROM country
WHERE country ilike 'A%a'

-- SORU 2
SELECT country
FROM country
WHERE country ilike '%_____n'

-- SORU 3
SELECT title
FROM film
WHERE title LIKE '%t%t%t%t%';

-- SORU 4
SELECT *
FROM film
WHERE title ilike 'C%' AND length > 90 AND rental_rate = 2.99;

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 4 ********************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost;

-- SORU 2
SELECT COUNT(DISTINCT replacement_cost)
FROM film;

-- SORU 3
SELECT COUNT(*)
FROM film
WHERE title LIKE 'T%' AND rating = 'G';

-- SORU 4
SELECT COUNT(*)
FROM film
WHERE title LIKE 'T%' AND rating = 'G';

-- SORU 5
SELECT COUNT(*)
FROM city
WHERE city LIKE '%r'

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 5 ********************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT title
FROM film
WHERE title LIKE '%n'
ORDER BY length DESC
LIMIT 5;

-- SORU 2
SELECT title
FROM film
WHERE title LIKE '%n'
ORDER BY length
OFFSET 5
LIMIT 5;

-- SORU 3
SELECT last_name
FROM customer
WHERE store_id = 1
ORDER BY last_name DESC
LIMIT 4;

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 6 ********************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT AVG(rental_rate)
FROM film;

-- SORU 2
SELECT MAX(length) AS length
FROM film
WHERE rental_rate >= 0.99;

-- SORU 3
SELECT MAX(length) AS length
FROM film
WHERE rental_rate >= 0.99;

-- SORU 4
SELECT COUNT(DISTINCT replacement_cost)
FROM film
WHERE length > 150;

--------------------------------------------------------------------------------------------

-- ************************************* ÖDEV 7 ********************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT COUNT(title),rating
FROM film
GROUP BY rating;

-- SORU 2
SELECT replacement_cost,COUNT(film) AS film
FROM film
GROUP BY replacement_cost
HAVING COUNT(replacement_cost) > 50

-- SORU 3
--customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir?
SELECT COUNT(customer_id) AS customers,store_id 
FROM customer
GROUP BY store_id;

-- SORU 4
--city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı barındıra country_id bilgisini ve şehir sayısını paylaşınız.
SELECT country_id,COUNT(city_id) AS cities
FROM city
GROUP BY country_id
ORDER BY COUNT(city_id) DESC
LIMIT 1;

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 8 ********************************************
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 9 ********************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT country, city
FROM city ct
JOIN country co ON co.country_id = ct.country_id
ORDER BY country;

-- SORU 2
SELECT pay.payment_id, cus.first_name || ' ' || cus.last_name
FROM customer cus
JOIN payment pay ON pay.customer_id = cus.customer_id;

-- SORU 3
SELECT ren.rental_id, cus.first_name || ' ' || cus.last_name AS Name
FROM customer cus
JOIN rental ren ON ren.customer_id = cus.customer_id;

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 10 *******************************************
--------------------------------------------------------------------------------------------

-- SORU 1
SELECT ct.city AS city, co.country AS country
FROM city ct
LEFT JOIN country co ON co.country_id = ct.country_id
ORDER BY co.country;

-- SORU 2
SELECT payment_id, c.first_name || ' ' || c.last_name
FROM payment p
RIGHT JOIN customer c ON c.customer_id = p.customer_id;

-- SORU 3
SELECT rental_id, c.first_name || ' ' || c.last_name
FROM customer c
FULL JOIN rental r ON r.customer_id = c.customer_id;

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 11 *******************************************
--------------------------------------------------------------------------------------------

-- SORU 1
--actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım.
SELECT first_name
FROM actor
UNION
SELECT first_name
FROM customer;

-- SORU 2
--actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.
SELECT first_name
FROM actor
INTERSECT
SELECT first_name
FROM customer;

-- SORU 3
--actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.
SELECT first_name
FROM actor
EXCEPT
SELECT first_name
FROM customer;

-- SORU 4
--İlk 3 sorguyu tekrar eden veriler için de yapalım.
SELECT first_name
FROM actor
UNION ALL
SELECT first_name
FROM customer;

-- SORU 5
SELECT first_name
FROM actor
INTERSECT ALL
SELECT first_name
FROM customer;

-- SORU 6
SELECT first_name
FROM actor
EXCEPT ALL
SELECT first_name
FROM customer;

--------------------------------------------------------------------------------------------


-- ************************************* ÖDEV 12 *******************************************
--------------------------------------------------------------------------------------------

-- SORU 1
--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(film_id)
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- SORU 2
--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(film_id)
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

-- SORU 3
--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT COUNT(film_id)
FROM film
WHERE rental_rate = (SELECT min(rental_rate) FROM film) and replacement_cost = (SELECT min(replacement_cost) FROM film);

-- SORU 4
--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT cus.first_name || ' ' || cus.last_name AS name, COUNT(payment_id)
FROM payment pay
LEFT JOIN customer cus ON cus.customer_id = pay.customer_id
GROUP BY name
ORDER BY COUNT DESC;

--------------------------------------------------------------------------------------------