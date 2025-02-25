-- CLASSWORK
-- SET, SELECT - ДЛЯ СМЕНЫ ЗНАЧЕНИЙ
-- SET - ТОЛЬКО 1 ПЕРЕМЕННУЮ ЗА РАЗ МОЖНО ПОМЕНЯТЬ
-- SELECT - МОЖНО НЕСКОЛЬКО ПЕРЕМЕННЫХ ПОМЕНЯТЬ В ПРЕДЕЛАХ ОДНОГО ВЫРАЖЕНИЯ

-- НЕТ инкрементов, декрементов

-- ПОКАЗАТЬ ПЕРЕМЕННУ:
-- PRINT - показывает и переходит на след строчку, только одну переменную за раз, 
-- но можно через конкатенацию
DECLARE @name nvarchar(50) = 'Alina'
DECLARE @age int = 29
PRINT @name
PRINT @age
PRINT @name + ', ' + CAST(@age AS nvarchar)
-- SELECT @name, @age

-- raiserror -  для генерации ошибки на этапе выполнения скрипта, 
-- можно перенести это сообщение в отдельный log файл
raiserror('привет! меня зовут %s, мне %02d лет', 0, 1, @name, @age)

DECLARE @text nvarchar(10) = '1984'
DECLARE @number int = convert(int, @text)


-- тернарный оператор IIF
USE Storik
DECLARE @x int
SELECT @x = COUNT(1) FROM Product
PRINT @x

SELECT *
FROM Product
WHERE price > IIF(@x > 5, 1000, 200)


-- CASE
-- rand() 0.00000 - 0.99999
DECLARE @result nvarchar(50)
DECLARE @num int = rand() * 3
PRINT @num
SET @result = CASE @num
	WHEN 0 THEN 'ZERO'
	WHEN 1 THEN 'ONE'
	WHEN 2 THEN 'TWO'
	ELSE 'OOPS!'
END
PRINT @result


---- CYCLE 
-- выводит в столбик с новой строки каждое значение
DECLARE @start1 int = 0
DECLARE @end1 int = 10
DECLARE @current1 int = @start1

WHILE @current1 <= @end1
BEGIN
	PRINT @current1
	SET @current1 += 1
END

-- или если надо выводить в строку
DECLARE @start2 int = 0
DECLARE @end2 int = 10
DECLARE @current2 int = @start2
DECLARE @res2 nvarchar(100) = ''

WHILE @current2 <= @end2
BEGIN
	SET @res2 += CAST(@current2 AS nvarchar) + ' '
	SET @current2 += 1
END
PRINT @res2

-- сохранить результаты в таблицу (например, если не хватает диапазона char/text)
CREATE TABLE Results2(
	id int PRIMARY KEY identity(1, 1),
	value int)

DECLARE @start3 int = 0
DECLARE @end3 int = 10000
DECLARE @current3 int = @start3
DECLARE @step3 int = 5

WHILE @current3 <= @end3
BEGIN
	INSERT INTO Results2(value) VALUES (@current3)
	SET @current3 += @step3
END

SELECT * FROM Results2


