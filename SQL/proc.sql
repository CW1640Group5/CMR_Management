--insert new course Giap
use CMR;
go

drop procedure usp_addNewCourse
go
create procedure usp_addNewCourse
@c_id nvarchar(20),
@c_name nvarchar(100),
@start_time nvarchar(30),
@end_time nvarchar(30)
as
begin
	insert into Course values(@c_id,@c_name,@start_time,@end_time);
end
go
select * from Course;

--end insert new course Giap

--insert new CMR by CL
go
drop procedure usp_addNewCMR
go
create procedure usp_addNewCMR
@type         nvarchar(100),
@documentcode nvarchar(20),
@name         nvarchar(200),
@link         nvarchar(300),
@CL_id        nvarchar(20),
@course_id    nvarchar(20),
@static       nvarchar(20)
as
begin
	insert into CMR values (@type, @documentcode, @name, @link, @CL_id, @course_id, @static);
end
go
select * from CMR;

--end


---CHI Proc abc
select DISTINCT Course.Course_id,Course.COURSE_NAME,Course.START_TIME,Course.END_TIME from Course,CL where CL.CL_ID='cl001'
--end