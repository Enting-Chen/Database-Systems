create trigger T3 on reader
after insert 
as
begin
	print 'Insert is not allowed'
	Rollback transaction
end