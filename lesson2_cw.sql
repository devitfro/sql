
-- SELECT name, price, quantity, *
-- FROM Product;


-- SELECT GETDATE() - 30
-- �������� ���������� + - * /
-- ���� ���������� ROUND

-- SELECT name, price, quantity, ROUND(price * quantity, 2)
-- FROM Product


--SELECT name, price, price * 1.5
--FROM Product


--SELECT name AS [������������ ������],
--	   price AS [���� �������],
--	   ROUND(price * 1.15, 2) AS [���� ������]
--FROM Product


-- AS ������� �����(���������) ��� ���� � �������
-- ����� ��� ������� ��������


--SELECT name AS [������������ ������],
--		CAST(price AS nvarchar) + ' ���.' AS [���� ������� � ���],
--		CAST(ROUND(price * 1.5, 2) AS nvarchar) + ' ���.' AS [���� ������ � ���]
--FROM Product


--SELECT name AS [������������ ������],
--       FORMAT(price, 'N2') + ' ���.' AS [���� ������� � ���],
--       FORMAT(ROUND(price * 1.5, 2), 'N2') + ' ���.' AS [���� ������ � ���]
--FROM Product;


--SELECT DISTINCT country
--FROM Product
-- DISTINCT ������� ������� ���� � ��������� � ���������� �������


--SELECT name, category, country, price
--FROM Product
---- ORDER BY name -- ASC (�� �������) => A-Z ; DESC => Z - A
--ORDER BY country, category, name -- ASC (�� �������) => A-Z ; DESC => Z - A


-- SELECT *
-- FROM Product
-- WHERE discount = 0
-- WHERE price IN (100, 200, 800)
-- WHERE price BETWEEN 100 AND 500 AND category = 'Gaming'
-- WHERE name LIKE 'A%' - ���������� �� �
-- WHERE name LIKE '%A' - ������������� �� �
-- WHERE name LIKE '%A%' - � ����� ����� ������ �
-- WHERE name NOT LIKE '%A%' - � ����� ����� ��� �
-- ORDER BY price ASC / DESC


-- OR ||
-- AND &&
-- BETWEEEN


--INSERT INTO Product(name, price)
--VALUES ('smth', 0)


--UPDATE Product (����� ��������� ������, ����� ������� ������� ��������� �����)
--SET name = 'smth', price = 100 (�������� ��� �������� � ������� name �� smth, ���� �� ���������� ����)
-- WHERE id = 10 (����� ���)
-- WHERE id < 10 (����� ���)


--DELETE FROM Product (�������� ��� ������ �� �������)
--WHERE id < 5 (����� �������)


-- ������� ����� �������
--SELECT *
--INTO CopyProduct1
--FROM Product


--SELECT *
--FROM CopyProduct1
