create trigger T4 on reader
after update
as 
begin 
	if (select count(*) from inserted) > 0
		print '已修改reader数据表的数据'
	else
		print '不存在要修改的数据'
end
		