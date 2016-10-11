delimiter $
create trigger tri_seckill after insert 
	on seckill for each row 

	begin
		declare c int;
		set c =();

	end $