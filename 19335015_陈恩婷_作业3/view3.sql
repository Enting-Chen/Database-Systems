CREATE VIEW V3
AS
    SELECT book_name, interview_times
    FROM BOOK
    WHERE interview_times > 30
