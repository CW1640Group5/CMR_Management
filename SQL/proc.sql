use CMR;

--get course name
go
drop procedure usp_getCourseName
go
create procedure usp_getCourseName
as
begin
	select Course_name from Course;
end
--end usp_getCourseName

--insert new course Giap

go
drop procedure usp_addNewCourse
go
create procedure usp_addNewCourse
@c_id nvarchar(20),
@c_name nvarchar(100),
@description nvarchar(max),
@start_time nvarchar(30),
@end_time nvarchar(30)
as
begin
	insert into Course(Course_id, Course_name, Description, start_time, end_time) values(@c_id,@c_name,@description,@start_time,@end_time);
end
go
select * from Course;

--end insert new course Giap

--login proc

drop procedure usp_Login
go
create procedure usp_Login
	@user_name varchar(50),
	@uPassword varchar(50)
as
Begin
	select User_id, User_name, mail, Role_id from CMR_Users where User_name = @user_name and uPassword = @uPassword
end

exec usp_Login @user_name = 'admin', @uPassword = '21232f297a57a5a743894a0e4a801fc3';

--end login

--insert new CMR by CL
go
drop procedure usp_addNewCMR
go
create procedure usp_addNewCMR
@academicSession nvarchar(100),
@course_id    nvarchar(20),
@cl_id        nvarchar(20),
@studentCount nvarchar(50)
as
begin
	insert into CMR(AcademicSession, Course_id, CL_id, Studentcount) 
	values (@academicSession, @course_id, @cl_id, @studentCount);
end
go
exec usp_addNewCMR @academicSession='testProc',@course_id='comp_1661', @cl_id='cl001', @studentCount='25'
go
select * from CMR;

--end insert new CMR by CL
drop procedure usp_assignCourse
go
create procedure usp_assignCourse
@Course_id nvarchar(20),
@CL_id nvarchar(20),
@CM_id nvarchar (20)
as 
begin 
insert into assignCourse values(@Course_id,@CL_id,@CM_id)
end
go

select * from assignCourse

exec usp_assignCourse @Course_id='comp_1649',@CL_id='cl002', @CM_id='cm001'

---CHI Proc abc
select DISTINCT Course.Course_id,Course.COURSE_NAME,Course.START_TIME,Course.END_TIME from Course,CL where CL.CL_ID='cl001'

drop procedure usp_getMail
go
create procedure usp_getMail 
@Course_id nvarchar(20)
as
begin
select CMR_Users.mail from CourseAssignByFac,DLT,CMR_Users where CourseAssignByFac.Course_id=@Course_id and CourseAssignByFac.faculty_id=DLT.faculty_id 
and DLT.User_id=CMR_Users.User_id
end

exec usp_getMail @Course_id='comp_1649'
--end