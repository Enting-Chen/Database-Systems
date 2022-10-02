--Ìí¼ÓÖ÷¼üÔ¼Êø
alter table book
add constraint PK_Book primary key(book_id)

alter table reader
add constraint PK_Reader primary key(reader_id)

alter table record
add constraint PK_Record primary key(record_id)