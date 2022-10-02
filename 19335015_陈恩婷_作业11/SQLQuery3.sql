--在存储过程中启用事务，用游标的方式实现计算所有图书的总价

DECLARE @TotalPrice MONEY = 0
DECLARE @book_price MONEY
DECLARE my_cursor CURSOR FOR
    SELECT book_price FROM book
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @book_price
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @TotalPrice = @TotalPrice + @book_price
    FETCH NEXT FROM my_cursor INTO @book_price
END

PRINT 'Total price is ' + CONVERT(VARCHAR, @TotalPrice)
CLOSE my_cursor
DEALLOCATE my_cursor