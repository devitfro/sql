USE Storik

-- 1. �������� ����� ���������� ����� �������� (������ ����� ��� ����������)
SELECT TOP 1
    p.name AS product_name,
    s.quantity AS sale_quantity
FROM Product p
JOIN Sale s ON p.id = s.id_product
ORDER BY s.quantity DESC

------------------------------------

SELECT 
    p.name AS product_name,
    SUM(s.quantity) AS total_sales
FROM Product p
JOIN Sale s ON p.id = s.id_product
GROUP BY p.name
HAVING SUM(s.quantity) = (
    SELECT MAX(total_sales)
    FROM (
        SELECT SUM(s.quantity) AS total_sales
        FROM Sale s
        JOIN Product p ON p.id = s.id_product
        GROUP BY p.id
    ) AS sales_summary
)


-- 2. ���� ����� ���������� ������� ���� ��������� ������� �� 100%, ���������� ���������, ������� ������� ������ ���������
-- (� ���������� ���������) ���� �������
SELECT 
	c.name, 
	COUNT(p.name) AS [product_count], 
	(SELECT COUNT(1) FROM Product) AS total,
	CAST(ROUND(CAST(COUNT(p.name) AS float) * 100 / (SELECT COUNT(1) FROM Product), 2) AS nvarchar) + '%' AS total
FROM Category c
FULL JOIN Product p ON p.id_category = c.id
GROUP BY c.name
ORDER BY 2 DESC


-- 3. �������� �������� �����������, ������� �� ���������� iPhone
SELECT name
FROM Supplier
WHERE id NOT IN (
	SELECT d.id_supplier
	FROM Delivery d
	JOIN Product p ON p.id = d.id_product
	WHERE p.name LIKE '%iPhone%')


-- 5. �������� ���� ��������������, ���������� ������� ������� � �������� ������, ��� ���������� ������������
-- ���� ������� �����  �Apple�
SELECT pr.name AS producer_name, p.quantity AS product_quantity
FROM Producer pr
JOIN Product p ON p.id_producer = pr.id
GROUP BY pr.id, pr.name, p.quantity
HAVING SUM(p.quantity) > (
    SELECT SUM(p.quantity)
    FROM Product p
    JOIN Producer pr ON p.id_producer = pr.id
    WHERE pr.name = 'Apple'
)


-- 6. �������� ����� ���������� ������ �� ������� ���, ������� �� 2025-02-01, � �� ��� ����. ������������� �� �������� ����
SELECT SUM(s.quantity), s.date_of_sale
FROM Sale s
WHERE s.date_of_sale BETWEEN '2025-02-01' AND CAST(GETDATE() AS DATE)
GROUP BY s.date_of_sale
ORDER BY s.date_of_sale DESC









