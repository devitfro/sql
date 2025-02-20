USE Storik

-- 1. ѕоказать товары, средн€€ цена продажи которых была больше 500
SELECT p.name, p.price, c.name AS category_name,  AVG(s.price) AS [avg sale price]
FROM Product p 
JOIN Sale s ON p.id = s.id_product
JOIN Category c ON p.id_category = c.id
GROUP BY p.name, p.price, c.name
HAVING AVG(s.price) > 500


-- 2. ¬ывести количество товаров каждой категории, средн€€ цена поставки которых больше 800
SELECT c.name AS category_name, COUNT(p.id) AS product_count, AVG(s.price) AS avg_sale_price
FROM Product p  
JOIN Sale s ON p.id = s.id_product  
JOIN Category c ON p.id_category = c.id  
GROUP BY c.name  
HAVING AVG(s.price) > 800


-- 3. ѕоказать категории "Smartphone" и "TV", принадлежащие им товары, и общую сумму их продажи
SELECT c.name AS category_name, p.name AS product_name, (s.price * s.quantity) AS total
FROM Product p  
JOIN Sale s ON p.id = s.id_product  
JOIN Category c ON p.id_category = c.id  
WHERE c.name IN('Smartphone', 'TV')

-------------------------------------------

SELECT c.name AS category_name, SUM(s.price * s.quantity) AS total
FROM Product p  
JOIN Sale s ON p.id = s.id_product  
JOIN Category c ON p.id_category = c.id  
WHERE c.name IN('Smartphone', 'TV')
GROUP BY c.name


-- 4. ѕоказать информацию о производителе, его полном адресе, и количестве товаров, которые он выпускает.
-- ќбща€ стоимость продаж товаров каждого производител€ при этом должна быть от 30000 до 100000
SELECT pr.name AS producer_name, ci.name AS city, re.name AS region, co.name AS country, COUNT(p.id) AS product_count, SUM(s.price * s.quantity) AS total_sales
FROM Product p
JOIN Producer pr ON p.id_producer = pr.id
JOIN Address a ON pr.id_address = a.id
JOIN City ci ON a.id_city = ci.id
JOIN Region re ON ci.id_region = re.id
JOIN Country co ON re.id_country = co.id
JOIN Sale s ON p.id = s.id_product
GROUP BY pr.name, ci.name, re.name, co.name
HAVING SUM(s.price * s.quantity) BETWEEN 30000 AND 100000


-- 5. ѕоказать категорию, товаров которой в магазине меньше всего
SELECT TOP 1 c.name AS category_name, COUNT(p.id) AS product_count
FROM Product p
JOIN Category c ON p.id_category = c.id
GROUP BY c.name
ORDER BY product_count ASC


-- 6. ѕоказать количество товаров каждой категории, при этом учитыва€ только те товары, стоимость поставки которых
-- превышала 400 гривен. ”словие: выведенна€ информаци€ касаетс€ только трЄх определЄнных поставщиков
SELECT 
    c.name AS category_name, 
    COUNT(p.id) AS product_count
FROM Product p
JOIN Category c ON p.id_category = c.id
JOIN Delivery d ON p.id = d.id_product
JOIN Supplier su ON d.id_supplier = su.id
WHERE d.price > 400 AND su.id IN (1, 2, 3)
GROUP BY c.name





JOIN Producer pr ON d.id_supplier = pr.id
WHERE d.price > 400 
  AND d.id_supplier IN (2, 4, 5)
GROUP BY p.name, pr.name

SELECT 
    c.name AS category_name, 
	pr.name AS supplier_name,
    SUM(d.quantity) AS total_quantity
FROM delivery d
JOIN Product p ON d.id_product = p.id
JOIN category c ON p.id_category = c.id
JOIN Producer pr ON d.id_supplier = pr.id
WHERE d.price > 400
  AND d.id_supplier IN (2, 4, 5) -- замените на нужные ID поставщиков
GROUP BY c.name;










