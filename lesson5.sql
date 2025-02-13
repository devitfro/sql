USE Storik

SELECT Product.name AS Продукт, 
	   Category.name AS Категория
FROM Product CROSS JOIN Category
-- перекрестное связывание (соединение)
-- результат = декартово произведение



SELECT COUNT(*) FROM Product
SELECT COUNT(*) FROM Category
-- к-во записей



SELECT Product.name AS [product_name],
		Category.name AS [category_name]
FROM Product INNER JOIN Category
ON Product.id_category = Category.id
-- внутреннее соединение таблиц
-- работает только с условием
-- традиционно, условие построено на связи 2 таблиц
-- посредством первичного и внешнего ключа
-- глядя на две таблицы, нужно определить
-- какая из 2 таблиц ГЛАВНАЯ, а какая - дочерняя
-- в главной таблице скорее всего не будет внешнего ключа, однако ситуации бывают разные по сложности (могут быть ВСЕ таблицы с внешними ключами),
-- в непонятной ситуации идём смотреть диаграмму, ищем таблицы, связь между ними, смотрим свойства связи - 
-- обычно, условие связи для внутреннего соединения построено по формуле
-- ON Child.FK = Parent.PK
-- менять местами можно, например,
-- ON Parent.PK = Child.FK
-- и точно также во фроме таблицы могут быть указаны как
-- Child INNER JOIN Parent, а может быть и Parent INNER JOIN Child


SELECT Product.name AS Продукт, 
	   Category.name AS Категория
FROM Product , Category
WHERE Product.id_category = Category.id
-- так делать НЕЛЬЗЯ! НЕАКТУАЛЬНО!



SELECT p.name AS [product_name],
		c.name AS [category_name]
FROM Product p INNER JOIN Category c
ON p.id_category = c.id
-- p/c псевдонимы
-- можно писать JOIN (без INNER) = тоже самое что INNER JOIN



SELECT p.name AS [product_name],
		c.name AS [category_name]
FROM Product p INNER JOIN Category c
ON p.id_category = c.id
WHERE p.name LIKE 'i%'



SELECT p.name, c.name
FROM Product p LEFT OUTER JOIN Category c
ON p.id_category = c.id
-- минус иннер джойна:
-- не показывает категории без продуктов
-- не показывает продукты без категории
-- левая таблица здесь это продукты

SELECT p.name, c.name
FROM Product p RIGHT OUTER JOIN Category c
ON p.id_category = c.id
-- RIGHT

SELECT p.name, c.name
FROM Product p FULL OUTER JOIN Category c
ON p.id_category = c.id
-- FULL (LEFT + RIGHT)



SELECT p.name, c.name
FROM Product p FULL JOIN Category c
ON p.id_category = c.id
-- FULL JOIN == FULL OUTER JOIN
-- LEFT JOIN == LEFT OUTER JOIN
-- RIGHT JOIN == RIGHT OUTER JOIN