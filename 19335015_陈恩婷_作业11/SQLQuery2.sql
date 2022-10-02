-- SELECT * FROM book;
-- BEGIN TRY
--     BEGIN TRANSACTION
--         UPDATE book SET book_price = book_price + 8 WHERE book_price <= 20;
--         UPDATE book SET book_price = book_price + 4 WHERE book_price > 20 AND book_price <= 30;
--         UPDATE book SET book_price = book_price - 4 WHERE book_price > 30;
--     COMMIT TRANSACTION
-- END TRY
-- BEGIN CATCH
--     ROLLBACK TRANSACTION
-- END CATCH

-- SELECT * FROM book;

-- 上面被注释的代码为没有使用游标的错误代码

SELECT * FROM book;
DECLARE @book_id CHAR(8), @book_price MONEY
DECLARE my_cursor CURSOR FOR
    SELECT book_id, book_price FROM book
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @book_id, @book_price
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @book_price
    IF @book_price <= 20
    BEGIN
        UPDATE book SET book_price = book_price + 8 WHERE book_id = @book_id
    END
    ELSE IF @book_price > 20 AND @book_price <= 30
    BEGIN
        UPDATE book SET book_price = book_price + 4 WHERE book_id = @book_id
    END
    ELSE
    BEGIN
        UPDATE book SET book_price = book_price - 4 WHERE book_id = @book_id
    END
    FETCH NEXT FROM my_cursor INTO @book_id, @book_price
    PRINT @book_price
END

CLOSE my_cursor
DEALLOCATE my_cursor

SELECT * FROM book;