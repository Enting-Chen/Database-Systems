begin TRY 
    begin TRANSACTION tran1;
        INSERT INTO record(record_id, reader_id, book_id, borrow_date, return_date, notes)
        VALUES('0012', 'r0001', '00000001', '2014-9-1', '2014-11-1', NULL);
        UPDATE book SET interview_times = interview_times + 1 WHERE book_id = 00000001;
    COMMIT TRANSACTION tran1;
end TRY
begin CATCH
    ROLLBACK TRANSACTION tran1;
end CATCH;

SELECT * FROM RECORD;
SELECT * FROM BOOK;