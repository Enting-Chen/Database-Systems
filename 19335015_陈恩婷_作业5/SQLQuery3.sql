create procedure proc_3 @name char(30) 
as
begin
	while @name in (select person from Table_1) 
	begin
		--print @name
		select @name = supervisor from Table_1 
		where person = @name
		print @name
    end
end
go
--�в����ĵ���
exec proc_3 @name='Bob'
