CREATE TABLE book
(
    book_id CHAR(8) NOT NULL UNIQUE,
    book_name NVARCHAR(50) NOT NULL,
    book_isbn CHAR(17) NOT NULL,
    book_author NVARCHAR(10) NOT NULL,
    book_publisher NVARCHAR(50) NOT NULL,
    book_price MONEY NOT NULL,
    interview_times SMALLINT NOT NULL,
    PRIMARY KEY(book_id)
)

CREATE TABLE reader
(
    reader_id CHAR(8) NOT NULL UNIQUE,
    reader_name NVARCHAR(50) NOT NULL,
    reader_sex CHAR(2) NOT NULL,
    reader_department NVARCHAR(60) NOT NULL,
    PRIMARY KEY(reader_id)
)

CREATE TABLE record
(
    reader_id CHAR(8) NOT NULL,
    book_id CHAR(8) NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE NOT NULL,
    notes NVARCHAR(50) NOT NULL,

    PRIMARY KEY(reader_id, book_id),
    FOREIGN KEY(book_id) REFERENCES book,
    FOREIGN KEY(reader_id) REFERENCES reader
)