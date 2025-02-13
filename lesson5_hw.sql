USE Storik
-- INNER JOINS:
-- 1. �������� �������� � ��������� �������, ������������ ������� �������� ��� "������" ��� ��� ������ ����
SELECT 
	p.name AS product_name, 
	c.name AS category_name, 
	pr.name AS producer_name
FROM Product p 
JOIN Category c ON p.id_category = c.id
JOIN Producer pr ON pr.id = p.id_producer
WHERE pr.name IN ('Apple', 'Samsung Electronics');

-- 2. ������� ��� ������ � ��������� �� ����������, ��� ������������� ������� �� �������� ���� [���], � ��������� ������� �� "�����"
SELECT 
	p.name AS product_name, 
	c.name AS category_name, 
	pr.name AS producer_name
FROM Product p
JOIN Producer pr ON p.id_producer = pr.id
JOIN Category c ON p.id_category = c.id
WHERE pr.name NOT LIKE '%app%' AND c.name NOT LIKE '%TV%'

-- 3. �������� �������� � ��������� ������� � ��������� ���������� � ������ �������������. 
-- �������: ������ ������������� �� Ukraine, �� China � �� Japan, ���� �������� �� ����� 600, � ���� �������� �� 10.01.2025 � �� ��� ����
SELECT 
	p.name AS product_name, 
	c.name AS category_name, 
	pr.name AS producer_name, 
	co.name AS country, 
	d.price AS delivery_price, 
	CAST(d.date_of_delivery AS DATE) AS date_of_delivery
FROM Product p
JOIN Category c ON p.id_category = c.id
JOIN Producer pr ON p.id_producer = pr.id
JOIN Country co ON pr.id_address = co.id
JOIN Delivery d ON d.id_product = p.id
WHERE co.name NOT IN ('Ukraine', 'China', 'Japan') AND d.price >= 600 AND CAST(d.date_of_delivery AS DATE) BETWEEN '2025-01-10' AND CAST(GETDATE() AS DATE)
--WHERE co.name NOT IN ('Ukraine', 'China', 'Japan') AND d.price >= 600 AND CAST(d.date_of_delivery AS DATE) BETWEEN '2025-01-10' AND GETDATE()

-- 4. �������� ��� Laptop � Tablet, ������� ���� ������� ����� 10. �������� ���������� � ���������� � �������������
SELECT 
	p.name AS product_name, 
	c.name AS category_name,  
	pr.name AS producer_name, 
	s.quantity AS sale_count, 
	su.name AS supplier_name
FROM Product p
JOIN Category c ON p.id_category = c.id
JOIN Producer pr ON p.id_producer = pr.id
JOIN Delivery d ON p.id = d.id_product
JOIN Sale s ON p.id = s.id_product
JOIN Supplier su ON d.id_supplier = su.id
WHERE s.quantity > 10

-- 5. ������� ������ �� ������� ���������� � �������� ������� � ��������� ����: �������� ������ � ��� ����������, ���������,
-- ���� �������� � ����� ��������� ������������ �������. �������: ������ ��� ��������� � ������� �����������.
-- ������������� �������� ������� � ���������� �������
SELECT TOP 3 
	p.name AS product_name, 
	c.name AS category_name, 
	su.name AS supplier_name, 
	d.date_of_delivery AS date_of_delivery, 
	d.price AS price, 
	d.quantity AS quantity, 
	(d.price * d.quantity) AS total_price
FROM Product p
JOIN Category c ON p.id_category = c.id
JOIN Delivery d ON p.id = d.id_product
JOIN Supplier su ON d.id_supplier = su.id
ORDER BY p.name

-- 6. ������� ������ �� ������� � �������� ������� � ��������� ����: �������� ������ � ��� �������������, ������ �����
-- (������, �����, �����) ������������� � ����� ������, ���������, ���� ������� � ����� ��������� �������.
-- �������: ���������� ���������� �� ������ �������� ���� ��������� � ������� ��������������.
-- ������������� ����� ��������� ������ � ������� ��������
SELECT
	p.name AS product_name, 
	c.name AS category_name,
	pr.name AS producer_name,
	CONCAT(a.street, ' street, ', ci.name, ', ', re.name, ', ', co.name) AS address_company,
	sa.date_of_sale AS date_of_sale,
	(sa.price * sa.quantity) AS total_price
FROM Product p
JOIN Category c ON p.id_category = c.id
JOIN Producer pr ON pr.id = p.id_producer
JOIN Address a ON pr.id_address = a.id
JOIN City ci ON a.id_city = ci.id
JOIN Region re ON ci.id_region = re.id
JOIN Country co ON re.id_country = co.id
JOIN Sale sa ON p.id = sa.id_product
WHERE pr.name NOT IN ('Apple', 'Sony Corporation')
ORDER BY total_price DESC

-- OUTER JOINS:
-- 7. �������� �������� ������� � �� ��������������, �� � � ��� ����� ��� ��������������, � ������� ��� �������
SELECT 
	p.name AS product_name, 
	pr.name AS producer_name
FROM Product p FULL JOIN Producer pr ON p.id_producer = pr.id

-- 8. �������� ������ �� ���������, � ������� �� ��������� �� ���� �����
SELECT 
	p.name AS product_name, 
	c.name AS category_name
FROM Product p RIGHT JOIN Category c ON p.id_category = c.id
WHERE p.id_category IS NULL

-- 9. �������� �������� �������, ���� �� �������� � �����������, � ��� ����� ��� �����������, ������� ������ �� ������ ���������
SELECT 
	p.name AS product_name, 
	su.name AS supplier_name,
	d.date_of_delivery AS date_of_delivery
FROM Product p 
FULL JOIN Delivery d ON p.id = d.id_product
FULL JOIN Supplier su ON d.id_supplier = su.id

-- 10. �������� ������� (�������), � ������� ��� �� ������ ������������� (EX����)
SELECT r.name AS region_name
FROM Region r LEFT JOIN Producer pr ON r.id = pr.id_address
WHERE pr.id IS NULL

SELECT name FROM Region
EXCEPT
SELECT r.name
FROM Region r JOIN Producer pr ON r.id = pr.id_address

-- 11. �������� �� �������� ���������, ��� ��� ������� ����� �Apple� (������)
SELECT 
	name
FROM 
	Category
EXCEPT
	SELECT 
		c.name 
	FROM 
		Product p 
	JOIN 
		Category c ON p.id_category = c.id
	JOIN 
		Producer pr ON p.id_producer = pr.id
	WHERE 
		pr.name LIKE '%Apple%'
-- ��� ��� ������ ���������?

SELECT name FROM Category
EXCEPT
SELECT c.name FROM Product p 
JOIN Category c ON p.id_category = c.id
JOIN Producer pr ON p.id_producer = pr.id
WHERE pr.name LIKE '%Apple%'

-- 12. �������� ��������������, ������� �� ��������� �������� ��������� TV (EXC���)
SELECT name FROM Producer
EXCEPT
SELECT pr.name FROM Product p 
JOIN Category c ON p.id_category = c.id
JOIN Producer pr ON p.id_producer = pr.id
WHERE c.name LIKE '%TV%'








	











