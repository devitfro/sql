USE Storik

SELECT name, 'P'
FROM Product
UNION ALL
SELECT CAST(id AS nvarchar), 'Pr' -- можно переделать поле в тип данных как везде
FROM Producer
UNION
SELECT name, 'C' -- фиктивное поле
FROM Category
ORDER BY 2 -- сортировать по второй таблице
-- UNION соединить данные из двух выборок в одну таблицу
-- (и если имя совпало в них, то будет только те что из первой таблицы)
-- UNION ALL - с повторами (присоединяет с повторами таблицу)

-- Например, в первой таблице 3 Тест, во второй таблице - 1 Тест
-- UNION выведет 3 Тест с первой таблицы и все
-- UNION ALL выведет 3 Тест с первой таблицы и присоединит 1 Тест со второй

-- ORDER BY - можно только 1 раз в конце всех SELECT 
-- первый SELECT задает количество,тип данных и порядок следования полей, 
-- все остальные такие же должны быть
-- если есть UNION,EXCEPT, INSTINCT то во всех SELECT должны совпадать по количеству, типу, последовательности


-- INTERSECT -- показывает как раз общие записи для двух выборок по критериям в SELECT
SELECT name, 'P'
FROM Product
INTERSECT -- это логическое поле 'И'
SELECT name, 'Pr'
FROM Producer

-- EXCEPT - вычетает множество из другого множества
SELECT name, 'P'
FROM Product
EXCEPT 
SELECT name, 'Pr'
FROM Producer

-- COUNT
SELECT COUNT(id_category)
FROM Product
-- функция считает количество заполненных (не нулевых) значений по укаанному столбцу, не по таблице

SELECT COUNT(*)
FROM Product
-- результат - скаляр, число - количество записей - РАБОТАЕТ МЕДЛЕННО (перебирает ячейки по всем полям)

SELECT COUNT(1) -- или любое число
FROM Product
-- результат - скаляр, число - количество записей - РАБОТАЕТ БЫСТРЕЕ

-- SUM (работает только с числовыми полями)
SELECT name, price, quantity, price * quantity
FROM Product
UNION
SELECT 'Total:', NULL, SUM(quantity), SUM(price * quantity)
FROM Product
ORDER BY 2 DESC
-- UNION автоматически делает сортировку по 1 столбцу (если нет ORDER BY)
-- UNION ALL -  не делает сортировку, он просто склеивает несколько выборок как их написали

-- AVG
SELECT price
FROM Product

SELECT AVG(price)
FROM Product

-- MIN, MAX
SELECT MIN(price), MAX(price), MIN(name), MAX(name)
FROM Product


-- GROUP BY
-- груп бай делает разбивку таблицы на несколько подтаблиц по выбранному критерию
-- зачем?
-- функции агрегирования сами по себе умеют считать статистику ТОЛЬКО ПО ВСЕЙ ЦЕЛОЙ ТАБЛИЦЕ
SELECT c.name, COUNT(p.name) AS [quantity product in this category]
FROM Category c JOIN Product p
ON c.id = p.id_category
GROUP BY c.name

SELECT c.name, COUNT(p.name) AS [quantity product in this category]
FROM Category c LEFT JOIN Product p
ON c.id = p.id_category
GROUP BY c.name


-- WHERE ... SUM() !!! - нельзя применять функции агрегирования в WHERE, потому что он построчный фильтр, работает со строками, а SUM делает подтаблицы
-- HAVING - групповой фильтр




