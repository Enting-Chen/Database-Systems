set tran isolation level repeatable read
update book set interview_times = interview_times + 1
where book_id = 00000002