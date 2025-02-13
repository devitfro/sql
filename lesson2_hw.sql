USE Store;

SELECT *
FROM Product 
ORDER BY date_of_delivery

-- 1. Посчитать возможную выручку за Phones и Tablet (с учётом скидок на эти товары)
SELECT 
	category,
    SUM(ROUND(price - (price * discount/ 100), 2) * quantity ) AS [total price]
FROM Product
WHERE category IN ('Phones', 'Tablet')
GROUP BY category


-- 2. Получить информацию о том, каких товаров вчера и сегодня доставили более 10 штук (getdate, dateadd)
SELECT 
    name,
	quantity,
    CAST(date_of_delivery AS DATE) AS [date_of_delivery]
FROM Product
WHERE CAST(date_of_delivery AS DATE) BETWEEN CAST(DATEADD(DAY, -1, GETDATE()) AS DATE) AND CAST(GETDATE() AS DATE) AND quantity > 10


-- 3. Показать названия и цены товаров, доставленных на протяжении с 05.02 (даты создания БД) до сегодняшнего дня 09.02
SELECT 
	name,
	price,
	CAST(date_of_delivery AS DATE) AS [date_of_delivery]
FROM Product
WHERE CAST(date_of_delivery AS DATE) BETWEEN '2025-02-05' AND CAST(GETDATE() AS DATE)


-- 4. Показать на экран названия и цены товаров с категорией "Gaming", но только не торговой марки "Xbox Series X"
SELECT 
	name,
	price,
	category
FROM Product
WHERE category LIKE 'Gaming' AND name NOT LIKE 'Xbox Series X'


-- 5. Показать на экран все товары, название которых начинается на букву "A", и категория которых содержит букву "C"
SELECT 
	name,
	category,
	price
FROM Product
WHERE name LIKE 'A%' AND category LIKE '%C%' 


-- 6. Показать на экран все товары, названия которых начинаются с "A" и по "l" включительно
SELECT
	name
FROM Product
WHERE name LIKE 'A%' AND name <= 'L'


-- 7. Показать все товары стоимостью меньше 1000 долярів, и датой поставки 2026 год
SELECT 
	name,
	category,
	price,
	expire_date
FROM Product
WHERE price < 1000 AND CAST(expire_date AS DATE) < '2026-12-31' AND CAST(expire_date AS DATE) > '2025-12-31'
--WHERE price < 1000 AND YEAR(expire_date) = 2026


-- 8. Показать все товары категории "Computers", количество которых >= 50
SELECT
	name,
	category,
	price,
	quantity
FROM Product
WHERE category LIKE 'Computers' AND quantity >= 50
ORDER BY quantity 


-- 9. Получить информацию о товарах ценой от 100 до 500 гривен, отсортировать цену по возрастанию
SELECT *
FROM Product
WHERE price BETWEEN 100 AND 500
ORDER BY price


-- 10. Уменьшить цены на все товары на 5%
SELECT 
	name,
	category,
	price AS [price_without_disqount],
	FORMAT(ROUND(price * 0.95, 2), 'N2') AS [price_with_disqount]
FROM Product


-- 11. Проставить сегодняшнюю дату доставки на все товары, в которых такая информация отсутствует
SELECT *
INTO CopyPRODUCT
FROM Product

UPDATE CopyPRODUCT
SET expire_date = GETDATE()
WHERE expire_date IS NULL


-- 12. Удалить все товары, количество которых меньше 30, а цена более 1000
DELETE FROM CopyPRODUCT
WHERE quantity < 50 AND price > 700


-- 13. Удалить все Coputers и Phnes
SELECT *
INTO CopyPRODUCT2
FROM Product

DELETE FROM CopyPRODUCT2
WHERE category IN('Computers', 'Phones')


-- 14. Показать на экран все товары, в названии которых содержится РОВНО 3 буквы "A" (в любых местах названия, не обязательно подряд)
SELECT 
	name,
	category
FROM Product
WHERE LEN(name) - LEN(REPLACE(name, 'A', '')) = 3


-- 15. Удалить все товары, названия которых состоят из 15 букв
SELECT *
INTO CopyPRODUCT4
FROM Product

DELETE FROM CopyPRODUCT4
WHERE LEN(name) = 15;


-- 16. Удалить все товары, expire_date которых будет более 3 лет от текущей даты
SELECT *
INTO CopyPRODUCT5
FROM Product

DELETE FROM CopyPRODUCT5
WHERE YEAR(expire_date) - YEAR(GETDATE()) < 3


-- 17. Показать 5 самых дорогих товаров
SELECT TOP 5
	name,
	category,
	price,
	quantity
FROM Product
ORDER BY price DESC


-- 18. Удалить все товары, информация о производителе которых неизвестна, или же если скидка на эти товары более 10%
SELECT *
INTO CopyPRODUCT6
FROM Product

DELETE FROM CopyPRODUCT6
WHERE producer IS NULL OR discount > 10




	