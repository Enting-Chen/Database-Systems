begin tran 
update book set interview_times = interview_times + 1
where book_id = 00000002
waitfor delay '00:00:20'
select * from book where book_id = 00000002
rollback tran