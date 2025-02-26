USE Storik

-- 1. Написать хранимую процедуру, которая показывает общее количество проданных товаров
-- в каждой из категорий и от каждого производителя.
CREATE PROCEDURE PROC_01 AS
SELECT 
	p.name AS product_name, 
	c.name AS category_name,
	SUM(s.quantity) AS total_sales,
	pr.name AS producer_name
FROM Product p
JOIN Category c ON p.id_category = c.id
JOIN Producer pr ON p.id_producer = pr.id
JOIN Sale s ON s.id_product = p.id
GROUP BY p.name, c.name, pr.name;

EXEC PROC_01

-- 2. Написать хранимую процедуру, которая показывает список производителей 
-- и общее количество товаров, произведённых каждым из них.
CREATE PROCEDURE PROC_02 AS
SELECT 
	pr.name AS producer_name,
	COUNT(p.id) AS product_count
FROM Product p
JOIN Producer pr ON p.id_producer = pr.id
GROUP BY pr.name;

EXEC PROC_02

-- 3. Создать хранимую процедуру, которая показывает название продукта,
-- который был продан в максимальном количестве.
CREATE PROCEDURE PROC_03 AS
SELECT TOP 1
	p.name AS product_name,
	SUM(s.quantity) AS total_sales
FROM Product p
JOIN Sale s ON s.id_product = p.id
GROUP BY p.name
ORDER BY total_sales DESC

EXEC PROC_03

-- 1. При продаже товара (добавлении записи в таблицу Sale), 
-- его количество должно уменьшаться (в таблице Product).
CREATE TRIGGER TRG_01
ON Sale AFTER INSERT AS
BEGIN
    UPDATE Product 
    SET Product.quantity = Product.quantity - INSERTED.quantity
    FROM Product
    JOIN INSERTED ON Product.id = inserted.id_product
END

-- 2. При удалении товара из таблицы Product, данные о нём должны копироваться в резервную таблицу ProductArchive.
CREATE TRIGGER TRG_02
ON Product AFTER DELETE AS
BEGIN
    INSERT INTO ProductArchive
    SELECT * FROM deleted;
END

-- 3. Если новый товар добавляется в таблицу Product, он должен быть удалён из таблицы ProductArchive (если такой товар там есть).
CREATE TRIGGER TRG_03
ON Product AFTER INSERT AS
BEGIN
    DELETE FROM ProductArchive
    WHERE product_id IN (SELECT product_id FROM INSERTED)
END





