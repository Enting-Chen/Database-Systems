create procedure proc_1
as
begin
  select book_name from book where book_id in 
  ( select book_id from record where reader_id in
  ( select reader_id from reader where reader_name = '��º�' ) )
end
go

--����
exec proc_1
go
