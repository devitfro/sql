USE Storik

-- 1. �������� ��� �������, ��� ���� �������� �� ������ "Smartphone".
CREATE VIEW PhoneSales AS
	SELECT p.name AS product_name, c.name AS category_name, s.quantity AS sale_quantity
	FROM Product p
	JOIN Category c ON p.id_category = c.id
	JOIN Sale s ON s.id_product = p.id
	WHERE c.name LIKE '%Smartphone%'

SELECT * FROM PhoneSales


-- 2. �������� ��� �������� �� ��������� "Smartphone", � ������� ���������� �� ������ ������ 150 ������.
CREATE VIEW PhonesLess50 AS
SELECT p.name AS product_name, p.quantity AS product_quantity, c.name AS category_name
FROM Product p
	JOIN Category c ON p.id_category = c.id
	WHERE c.name LIKE '%Smartphone%' AND p.quantity < 150

SELECT * FROM PhonesLess50


-- 3. �������� �������� ����������� ������ �� ������ "Smartphone" �� ��������� 3 ������.
CREATE VIEW TopSalesPhone AS
SELECT TOP 1 p.name AS product_name, c.name AS category_name, SUM(s.quantity) AS total_sales, s.date_of_sale AS sale_date
FROM Product p
JOIN Category c ON p.id_category = c.id
JOIN Sale s ON s.id_product = p.id
-- WHERE c.name LIKE '%Smartphone%' AND s.date_of_sale BETWEEN '2024-11-01' AND CAST(GETDATE() AS DATE)
WHERE c.name LIKE '%Smartphone%' AND s.date_of_sale BETWEEN DATEADD(MONTH, -3, GETDATE()) AND GETDATE()
GROUP BY p.name, c.name, s.date_of_sale
ORDER BY total_sales DESC

SELECT * FROM TopSalesPhone