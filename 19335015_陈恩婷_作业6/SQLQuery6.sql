ALTER TABLE record
ADD CONSTRAINT FK_book_id
FOREIGN KEY(book_id) 
REFERENCES book(book_id)

ALTER TABLE record
ADD CONSTRAINT FK_reader_id
FOREIGN KEY(reader_id) 
REFERENCES reader(reader_id)

