USE Storik

SELECT name, price
FROM Product
WHERE id_category IN (
			SELECT id
			FROM Category
			WHERE name IN('TV', 'Smartphone'))


--
SELECT 
	pr.name, 
	COUNT(p.name) AS [product_count], 
	(SELECT COUNT(1) FROM Product) AS total,
	--COUNT(p.name) * 100 / (SELECT COUNT(1) FROM Product)
	--CAST(COUNT(p.name) AS float) / (SELECT COUNT(1) FROM Product)
	  CAST(ROUND(CAST(COUNT(p.name) AS float) * 100 / (SELECT COUNT(1) FROM Product), 2) AS nvarchar) + '%' AS total
FROM Producer pr
FULL JOIN Product p ON p.id_producer = pr.id
GROUP BY pr.name
ORDER BY 2 DESC


-- EXISTS - возвращает true/false


