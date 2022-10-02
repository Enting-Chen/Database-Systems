CREATE VIEW V2 AS
SELECT reader_name, book_name 
FROM READER
JOIN RECORD ON READER.reader_id = RECORD.reader_id
    JOIN BOOK ON RECORD.book_id = BOOK.book_id

    