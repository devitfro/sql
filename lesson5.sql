USE Storik

SELECT Product.name AS �������, 
	   Category.name AS ���������
FROM Product CROSS JOIN Category
-- ������������ ���������� (����������)
-- ��������� = ��������� ������������



SELECT COUNT(*) FROM Product
SELECT COUNT(*) FROM Category
-- �-�� �������



SELECT Product.name AS [product_name],
		Category.name AS [category_name]
FROM Product INNER JOIN Category
ON Product.id_category = Category.id
-- ���������� ���������� ������
-- �������� ������ � ��������
-- �����������, ������� ��������� �� ����� 2 ������
-- ����������� ���������� � �������� �����
-- ����� �� ��� �������, ����� ����������
-- ����� �� 2 ������ �������, � ����� - ��������
-- � ������� ������� ������ ����� �� ����� �������� �����, ������ �������� ������ ������ �� ��������� (����� ���� ��� ������� � �������� �������),
-- � ���������� �������� ��� �������� ���������, ���� �������, ����� ����� ����, ������� �������� ����� - 
-- ������, ������� ����� ��� ����������� ���������� ��������� �� �������
-- ON Child.FK = Parent.PK
-- ������ ������� �����, ��������,
-- ON Parent.PK = Child.FK
-- � ����� ����� �� ����� ������� ����� ���� ������� ���
-- Child INNER JOIN Parent, � ����� ���� � Parent INNER JOIN Child


SELECT Product.name AS �������, 
	   Category.name AS ���������
FROM Product , Category
WHERE Product.id_category = Category.id
-- ��� ������ ������! �����������!



SELECT p.name AS [product_name],
		c.name AS [category_name]
FROM Product p INNER JOIN Category c
ON p.id_category = c.id
-- p/c ����������
-- ����� ������ JOIN (��� INNER) = ���� ����� ��� INNER JOIN



SELECT p.name AS [product_name],
		c.name AS [category_name]
FROM Product p INNER JOIN Category c
ON p.id_category = c.id
WHERE p.name LIKE 'i%'



SELECT p.name, c.name
FROM Product p LEFT OUTER JOIN Category c
ON p.id_category = c.id
-- ����� ����� ������:
-- �� ���������� ��������� ��� ���������
-- �� ���������� �������� ��� ���������
-- ����� ������� ����� ��� ��������

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