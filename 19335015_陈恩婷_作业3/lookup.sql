--1
SELECT *
FROM BOOK

--2
SELECT reader_name, reader_department
FROM READER

--3
SELECT reader_name AS '姓名', reader_department AS '院系'
FROM READER

--4
SELECT TOP 5
    *
FROM BOOK

--5
SELECT DISTINCT book_publisher
FROM BOOK

--6
SELECT SUM(interview_times) AS '总借阅次数'
FROM BOOK

--7
SELECT COUNT(reader_id)
FROM READER

--8
SELECT *
FROM READER
WHERE reader_id LIKE '王%'

--9
SELECT *
FROM RECORD
WHERE notes IS NULL

--10
SELECT *
FROM BOOK
ORDER BY interview_times DESC

--11
SELECT book_publisher, COUNT(book_id)
FROM BOOK
GROUP BY book_publisher

--12
SELECT book_publisher
FROM
    (SELECT book_publisher, COUNT(book_id) AS book_num, SUM(interview_times) AS interview_times
    FROM BOOK
    GROUP BY book_publisher) AS T
WHERE (book_num > 1 AND interview_times > 20)

--13
SELECT reader_name
FROM READER
WHERE (reader_id NOT IN (SELECT reader_id
FROM RECORD
WHERE book_id = 'b0005'))

--14
SELECT reader_name
FROM READER
WHERE reader_id IN
(SELECT reader_id
FROM RECORD
GROUP BY reader_id
HAVING COUNT(book_id) >= 2 )

--15
SELECT book_id as book_id_max
FROM BOOK
WHERE interview_times IN (SELECT MAX(interview_times)
FROM BOOK)

SELECT book_id as book_id_min
FROM BOOK
WHERE interview_times IN (SELECT MIN(interview_times)
FROM BOOK) 

--16
SELECT reader_name, reader_id
FROM READER
WHERE reader_id IN (SELECT reader_id
FROM RECORD
WHERE book_id = 'b0002' )

--17
SELECT reader_name, reader_department, book_name
FROM READER JOIN RECORD ON READER.reader_id = RECORD.reader_id
    JOIN BOOK ON RECORD.book_id = BOOK.book_id
WHERE READER.reader_id = 'r0007'

