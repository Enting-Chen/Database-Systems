create procedure proc_1
as
begin
  select book_name from book where book_id in 
  ( select book_id from record where reader_id in
  ( select reader_id from reader where reader_name = '李德海' ) )
end
go

--调用
exec proc_1
go
