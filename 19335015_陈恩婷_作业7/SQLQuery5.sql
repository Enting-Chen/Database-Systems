create trigger T4 on reader
after update
as 
begin 
	if (select count(*) from inserted) > 0
		print '���޸�reader���ݱ������'
	else
		print '������Ҫ�޸ĵ�����'
end
		