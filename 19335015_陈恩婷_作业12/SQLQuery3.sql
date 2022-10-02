set transaction isolation level repeatable read
begin tran 
select * from book where book_id = 00000002
if @@ROWCOUNT <> 0 
	begin 
	waitfor delay '00:00:20'
	select * from book where book_id = 00000002
	end
rollback tran