create trigger T1 on record
after insert, update, delete
as
begin
	update book 
	set interview_times = interview_times + 1
	where book_id in 
	(select book_id from inserted)
	update book
	set interview_times = interview_times - 1
	where book_id in	
	(select book_id from deleted)
end