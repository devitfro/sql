USE Storik

SELECT name, 'P'
FROM Product
UNION ALL
SELECT CAST(id AS nvarchar), 'Pr' -- ����� ���������� ���� � ��� ������ ��� �����
FROM Producer
UNION
SELECT name, 'C' -- ��������� ����
FROM Category
ORDER BY 2 -- ����������� �� ������ �������
-- UNION ��������� ������ �� ���� ������� � ���� �������
-- (� ���� ��� ������� � ���, �� ����� ������ �� ��� �� ������ �������)
-- UNION ALL - � ��������� (������������ � ��������� �������)

-- ��������, � ������ ������� 3 ����, �� ������ ������� - 1 ����
-- UNION ������� 3 ���� � ������ ������� � ���
-- UNION ALL ������� 3 ���� � ������ ������� � ����������� 1 ���� �� ������

-- ORDER BY - ����� ������ 1 ��� � ����� ���� SELECT 
-- ������ SELECT ������ ����������,��� ������ � ������� ���������� �����, 
-- ��� ��������� ����� �� ������ ����
-- ���� ���� UNION,EXCEPT, INSTINCT �� �� ���� SELECT ������ ��������� �� ����������, ����, ������������������


-- INTERSECT -- ���������� ��� ��� ����� ������ ��� ���� ������� �� ��������� � SELECT
SELECT name, 'P'
FROM Product
INTERSECT -- ��� ���������� ���� '�'
SELECT name, 'Pr'
FROM Producer

-- EXCEPT - �������� ��������� �� ������� ���������
SELECT name, 'P'
FROM Product
EXCEPT 
SELECT name, 'Pr'
FROM Producer

-- COUNT
SELECT COUNT(id_category)
FROM Product
-- ������� ������� ���������� ����������� (�� �������) �������� �� ��������� �������, �� �� �������

SELECT COUNT(*)
FROM Product
-- ��������� - ������, ����� - ���������� ������� - �������� �������� (���������� ������ �� ���� �����)

SELECT COUNT(1) -- ��� ����� �����
FROM Product
-- ��������� - ������, ����� - ���������� ������� - �������� �������

-- SUM (�������� ������ � ��������� ������)
SELECT name, price, quantity, price * quantity
FROM Product
UNION
SELECT 'Total:', NULL, SUM(quantity), SUM(price * quantity)
FROM Product
ORDER BY 2 DESC
-- UNION ������������� ������ ���������� �� 1 ������� (���� ��� ORDER BY)
-- UNION ALL -  �� ������ ����������, �� ������ ��������� ��������� ������� ��� �� ��������

-- AVG
SELECT price
FROM Product

SELECT AVG(price)
FROM Product

-- MIN, MAX
SELECT MIN(price), MAX(price), MIN(name), MAX(name)
FROM Product


-- GROUP BY
-- ���� ��� ������ �������� ������� �� ��������� ��������� �� ���������� ��������
-- �����?
-- ������� ������������� ���� �� ���� ����� ������� ���������� ������ �� ���� ����� �������
SELECT c.name, COUNT(p.name) AS [quantity product in this category]
FROM Category c JOIN Product p
ON c.id = p.id_category
GROUP BY c.name

SELECT c.name, COUNT(p.name) AS [quantity product in this category]
FROM Category c LEFT JOIN Product p
ON c.id = p.id_category
GROUP BY c.name


-- WHERE ... SUM() !!! - ������ ��������� ������� ������������� � WHERE, ������ ��� �� ���������� ������, �������� �� ��������, � SUM ������ ����������
-- HAVING - ��������� ������




