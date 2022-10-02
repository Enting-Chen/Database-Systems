create trigger T2 on reader
after update
as 
begin
	select reader_name from deleted
	select reader_name from inserted
end