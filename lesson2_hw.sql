USE Store;

SELECT *
FROM Product 
ORDER BY date_of_delivery

-- 1. ��������� ��������� ������� �� Phones � Tablet (� ������ ������ �� ��� ������)
SELECT 
	category,
    SUM(ROUND(price - (price * discount/ 100), 2) * quantity ) AS [total price]
FROM Product
WHERE category IN ('Phones', 'Tablet')
GROUP BY category


-- 2. �������� ���������� � ���, ����� ������� ����� � ������� ��������� ����� 10 ���� (getdate, dateadd)
SELECT 
    name,
	quantity,
    CAST(date_of_delivery AS DATE) AS [date_of_delivery]
FROM Product
WHERE CAST(date_of_delivery AS DATE) BETWEEN CAST(DATEADD(DAY, -1, GETDATE()) AS DATE) AND CAST(GETDATE() AS DATE) AND quantity > 10


-- 3. �������� �������� � ���� �������, ������������ �� ���������� � 05.02 (���� �������� ��) �� ������������ ��� 09.02
SELECT 
	name,
	price,
	CAST(date_of_delivery AS DATE) AS [date_of_delivery]
FROM Product
WHERE CAST(date_of_delivery AS DATE) BETWEEN '2025-02-05' AND CAST(GETDATE() AS DATE)


-- 4. �������� �� ����� �������� � ���� ������� � ���������� "Gaming", �� ������ �� �������� ����� "Xbox Series X"
SELECT 
	name,
	price,
	category
FROM Product
WHERE category LIKE 'Gaming' AND name NOT LIKE 'Xbox Series X'


-- 5. �������� �� ����� ��� ������, �������� ������� ���������� �� ����� "A", � ��������� ������� �������� ����� "C"
SELECT 
	name,
	category,
	price
FROM Product
WHERE name LIKE 'A%' AND category LIKE '%C%' 


-- 6. �������� �� ����� ��� ������, �������� ������� ���������� � "A" � �� "l" ������������
SELECT
	name
FROM Product
WHERE name LIKE 'A%' AND name <= 'L'


-- 7. �������� ��� ������ ���������� ������ 1000 ������, � ����� �������� 2026 ���
SELECT 
	name,
	category,
	price,
	expire_date
FROM Product
WHERE price < 1000 AND CAST(expire_date AS DATE) < '2026-12-31' AND CAST(expire_date AS DATE) > '2025-12-31'
--WHERE price < 1000 AND YEAR(expire_date) = 2026


-- 8. �������� ��� ������ ��������� "Computers", ���������� ������� >= 50
SELECT
	name,
	category,
	price,
	quantity
FROM Product
WHERE category LIKE 'Computers' AND quantity >= 50
ORDER BY quantity 


-- 9. �������� ���������� � ������� ����� �� 100 �� 500 ������, ������������� ���� �� �����������
SELECT *
FROM Product
WHERE price BETWEEN 100 AND 500
ORDER BY price


-- 10. ��������� ���� �� ��� ������ �� 5%
SELECT 
	name,
	category,
	price AS [price_without_disqount],
	FORMAT(ROUND(price * 0.95, 2), 'N2') AS [price_with_disqount]
FROM Product


-- 11. ���������� ����������� ���� �������� �� ��� ������, � ������� ����� ���������� �����������
SELECT *
INTO CopyPRODUCT
FROM Product

UPDATE CopyPRODUCT
SET expire_date = GETDATE()
WHERE expire_date IS NULL


-- 12. ������� ��� ������, ���������� ������� ������ 30, � ���� ����� 1000
DELETE FROM CopyPRODUCT
WHERE quantity < 50 AND price > 700


-- 13. ������� ��� Coputers � Phnes
SELECT *
INTO CopyPRODUCT2
FROM Product

DELETE FROM CopyPRODUCT2
WHERE category IN('Computers', 'Phones')


-- 14. �������� �� ����� ��� ������, � �������� ������� ���������� ����� 3 ����� "A" (� ����� ������ ��������, �� ����������� ������)
SELECT 
	name,
	category
FROM Product
WHERE LEN(name) - LEN(REPLACE(name, 'A', '')) = 3


-- 15. ������� ��� ������, �������� ������� ������� �� 15 ����
SELECT *
INTO CopyPRODUCT4
FROM Product

DELETE FROM CopyPRODUCT4
WHERE LEN(name) = 15;


-- 16. ������� ��� ������, expire_date ������� ����� ����� 3 ��� �� ������� ����
SELECT *
INTO CopyPRODUCT5
FROM Product

DELETE FROM CopyPRODUCT5
WHERE YEAR(expire_date) - YEAR(GETDATE()) < 3


-- 17. �������� 5 ����� ������� �������
SELECT TOP 5
	name,
	category,
	price,
	quantity
FROM Product
ORDER BY price DESC


-- 18. ������� ��� ������, ���������� � ������������� ������� ����������, ��� �� ���� ������ �� ��� ������ ����� 10%
SELECT *
INTO CopyPRODUCT6
FROM Product

DELETE FROM CopyPRODUCT6
WHERE producer IS NULL OR discount > 10




	