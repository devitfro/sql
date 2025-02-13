
-- SELECT name, price, quantity, *
-- FROM Product;


-- SELECT GETDATE() - 30
-- доступна арифметика + - * /
-- есть округление ROUND

-- SELECT name, price, quantity, ROUND(price * quantity, 2)
-- FROM Product


--SELECT name, price, price * 1.5
--FROM Product


--SELECT name AS [Наименование товара],
--	   price AS [Цена сегодня],
--	   ROUND(price * 1.15, 2) AS [Цена товара]
--FROM Product


-- AS создает алиас(псевдоним) для поля в запросе
-- важно для сложных запросов


--SELECT name AS [Наименование товара],
--		CAST(price AS nvarchar) + ' грн.' AS [Цена сегодня в грн],
--		CAST(ROUND(price * 1.5, 2) AS nvarchar) + ' грн.' AS [Цена завтра в грн]
--FROM Product


--SELECT name AS [Наименование товара],
--       FORMAT(price, 'N2') + ' грн.' AS [Цена сегодня в грн],
--       FORMAT(ROUND(price * 1.5, 2), 'N2') + ' грн.' AS [Цена завтра в грн]
--FROM Product;


--SELECT DISTINCT country
--FROM Product
-- DISTINCT удаляет повторы сток и сортирует в алфавитном порядке


--SELECT name, category, country, price
--FROM Product
---- ORDER BY name -- ASC (по дефолту) => A-Z ; DESC => Z - A
--ORDER BY country, category, name -- ASC (по дефолту) => A-Z ; DESC => Z - A


-- SELECT *
-- FROM Product
-- WHERE discount = 0
-- WHERE price IN (100, 200, 800)
-- WHERE price BETWEEN 100 AND 500 AND category = 'Gaming'
-- WHERE name LIKE 'A%' - начинается на А
-- WHERE name LIKE '%A' - заканчивается на А
-- WHERE name LIKE '%A%' - в любом месте текста А
-- WHERE name NOT LIKE '%A%' - в любом месте нет А
-- ORDER BY price ASC / DESC


-- OR ||
-- AND &&
-- BETWEEEN


--INSERT INTO Product(name, price)
--VALUES ('smth', 0)


--UPDATE Product (очень осторожно делать, лучше создать сначала резервную копию)
--SET name = 'smth', price = 100 (поменяет все значения в столбце name на smth, если не уникальное поле)
-- WHERE id = 10 (можно так)
-- WHERE id < 10 (можно так)


--DELETE FROM Product (почистит все записи из таблицы)
--WHERE id < 5 (можно условие)


-- создать копии таблицы
--SELECT *
--INTO CopyProduct1
--FROM Product


--SELECT *
--FROM CopyProduct1
