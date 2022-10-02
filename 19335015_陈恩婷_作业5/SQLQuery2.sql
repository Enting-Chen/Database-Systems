create procedure proc_2 @discount float
as
begin
	update book
	set book_price = book_price * (1+@discount)
	where book_price < 30
	update book
	set book_price = book_price * (1-@discount)
	where book_price > 60
end
go
--有参数的调用
exec proc_2 @discount = 0.1
select * from book