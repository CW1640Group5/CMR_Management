--insert new course Giap

drop procedure usp_addNewCourse
go
create procedure usp_addNewCourse
@c_id nvarchar(20),
@c_name nvarchar(100),
@start_time datetime,
@end_time datetime
as
begin
	insert into Course values('@c_id','@c_name','@start_time','@end_time');
end
select * from Course;

  --end insert new course Giap