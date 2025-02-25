-- 1. Показать среднее арифметическое трёх вещественных чисел, хранящихся в переменных
DECLARE @x float = 10.5, @y float = 8.7, @z float = 1.1
DECLARE @avg float = (@x + @y + @z) / 3
PRINT @avg

-- 2. Показать горизонтальную линию из звёздочек длиной @L
DECLARE @L int = 10;
DECLARE @symb char = '-'

DECLARE @start int = 1
DECLARE @temp int = @start
DECLARE @res nvarchar(50) = ''

WHILE @temp <= @L
BEGIN
	SET @res += @symb
	SET @temp += 1
END

PRINT @res

-- 3. Скрипт проверяет, какое сейчас время суток на сервере, 
-- и выдаёт приветствие "добрый вечер!" или "добрый день!"
DECLARE @date DATETIME = GETDATE()
DECLARE @time TIME = CONVERT(TIME, @date)

PRINT @date
PRINT @time

DECLARE @morning nvarchar(10) = '06:00:00'
DECLARE @day nvarchar(10) = '12:00:00'
DECLARE @evening nvarchar(10) = '18:00:00'
DECLARE @night nvarchar(10) = '23:59:59'

IF @time >= @morning and @time < @day
BEGIN
	PRINT 'GOOD MORNING!'
END
ELSE IF @time >= @day AND @time < @evening 
BEGIN
	PRINT 'GOOD DAY!'
END
ELSE IF @time >= @evening and @time <= @night
BEGIN
	PRINT 'GOOD EVENING!'
END
ELSE
BEGIN
	PRINT 'GOOD NIGHT!'
END

-- 4. Скрипт генерирует случайный сложный пароль длиной от @M до @N
DECLARE @M int = 4
DECLARE @N int = 10
DECLARE @password nvarchar(100) = ''

DECLARE @passwordLength int = FLOOR(RAND() * (@N - @M + 1)) + @M 
DECLARE @temp int = 1

WHILE @temp <= @passwordLength
BEGIN
	SET @password += CHAR(RAND() * 255)
	SET @temp += 1
END

PRINT @password

-- 5. Показать факториалы всех чисел от 0 до 25
DECLARE @num1 int = 0
DECLARE @num2 int = 25
DECLARE @factorial DECIMAL(38, 0) = 1

WHILE @num1 <= @num2
BEGIN
    IF @num1 > 0
    BEGIN
        SET @factorial *= @num1
    END
    
    PRINT 'Factorial ' + CAST(@num1 AS NVARCHAR) + ' = ' + CAST(@factorial AS NVARCHAR)
    SET @num1 += 1
END

-- 6. Показать количество цифр числа, хранящегося в переменной
DECLARE @num int = 12345678
DECLARE @count int = 0

WHILE @num != 0
BEGIN
	SET @num /= 10
	SET @count += 1
END

PRINT @count

-- 7. Определить, является ли строка палиндромом. Примеры палиндромов:
-- Нажал кабан на баклажан.
-- Я так нежен, Катя.
DECLARE @str nvarchar(100) = 'Нажал кабан на баклажан.'
DECLARE @tempStr nvarchar(100)
DECLARE @reverseStr nvarchar(100)

SET @tempStr = REPLACE(REPLACE(REPLACE(@str, ' ', ''), '.', ''), ',', '')
SET @tempStr = LOWER(@tempStr) -- нажалкабаннабакла

SET @reverseStr = REVERSE(@tempStr)

PRINT @str
PRINT @reverseStr

IF @tempStr = @reverseStr
    PRINT 'Is palindrome'
ELSE
    PRINT 'Not palindrome'

-- 8. Подсчитать количество слов во введённом предложении.
DECLARE @str nvarchar(100) = 'Нажал кабан на баклажан.'
DECLARE @countWord int = 0
DECLARE @x int = 1
DECLARE @inWord bit = 0

DECLARE @strLen int = LEN(@str)
PRINT @strLen

WHILE @x <= @strLen
BEGIN
    IF SUBSTRING(@str, @x, 1) NOT IN (' ', '.', ',', '!', '?', ';', ':')
    BEGIN
        IF @inWord = 0
        BEGIN
            SET @countWord += 1
            SET @inWord = 1
        END
    END
    ELSE
    BEGIN
        SET @inWord = 0
    END

    SET @x += 1
END

PRINT @countWord









	






