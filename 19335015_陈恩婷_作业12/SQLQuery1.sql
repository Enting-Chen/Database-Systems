set transaction isolation level read uncommitted 
select * from book where book_id = 00000002
if @@ROWCOUNT <> 0
	begin 
	waitfor delay '00:00:20'
	select * from book where book_id = 00000002
	end