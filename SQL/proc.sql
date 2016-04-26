use CMR;

go



--insert new course Giap

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
select*from CMR_Users
drop procedure usp_Login
go
create procedure usp_Login
	@user_name varchar(50),
	@uPassword varchar(50)
as
Begin
	select User_id, User_name, mail, Role_id from CMR_Users where User_name = @user_name and uPassword = @uPassword;
end
go
exec usp_Login @user_name = 'admin', @uPassword = '21232f297a57a5a743894a0e4a801fc3'

--end login

--insert new CMR by CL GIAP
go
drop procedure usp_addNewCMR
go
create procedure usp_addNewCMR
	@academicSession nvarchar(100),
	@course_id    nvarchar(20),
	@cl_id        nvarchar(20),
	@studentCount nvarchar(50),

	@MeanCW1 int,
	@MeanCW2 int,
	@MeanExam int,
	@MeanOverall int,

	@MedianCW1 int,
	@MedianCW2 int,
	@MedianExam int,
	@MedianOverall int,

	@SDCW1 int,
	@SDCW2 int,
	@SDExam int,
	@SDOverall int,

	@0_39CW1 int,
	@0_39CW2 int,
	@0_39Exam int,
	@0_39Overall int,

	@40_69CW1 int,
	@40_69CW2 int,
	@40_69Exam int,
	@40_69Overall int,

	@70_89CW1 int,
	@70_89CW2 int,
	@70_89Exam int,
	@70_89Overall int,

	@90_CW1 int,
	@90_CW2 int,
	@90_Exam int,
	@90_Overall int
as
begin
	insert into 
	CMR
	(
	AcademicSession, 
	Course_id, 
	CL_id, 
	Studentcount, 

	MeanCW1, 
	MeanCW2, 
	MeanExam, 
	MeanOverall, 

	MedianCW1, 
	MedianCW2, 
	MedianExam, 
	MedianOverall,

	SDCW1,
	SDCW2,
	SDExam,
	SDOverall,

	[0-39CW1],
	[0-39CW2],
	[0-39Exam],
	[0-39Overall],

	[40-69CW1],
	[40-69CW2],
	[40-69Exam],
	[40-69Overall],

	[70-89CW1],
	[70-89CW2],
	[70-89Exam],
	[70-89Overall],

	[90+CW1],
	[90+CW2],
	[90+Exam],
	[90+Overall]
	) 
	values 
	(
	@academicSession, 
	@course_id, 
	@cl_id, 
	@studentCount, 

	@MeanCW1, 
	@MeanCW2, 
	@MeanExam, 
	@MeanOverall, 

	@MedianCW1, 
	@MedianCW2, 
	@MedianExam, 
	@MedianOverall,

	@SDCW1,
	@SDCW2,
	@SDExam,
	@SDOverall,

	@0_39CW1,
	@0_39CW2,
	@0_39Exam,
	@0_39Overall,

	@40_69CW1,
	@40_69CW2,
	@40_69Exam,
	@40_69Overall,

	@70_89CW1,
	@70_89CW2,
	@70_89Exam,
	@70_89Overall,

	@90_CW1,
	@90_CW2,
	@90_Exam,
	@90_Overall
	);
end
go
exec usp_addNewCMR 
	@academicSession='testProc',
	@course_id='comp_1661', 
	@cl_id='cl001', 
	@studentCount='25',
	@MeanCW1=1, 
	@MeanCW2=1, 
	@MeanExam=1, 
	@MeanOverall=1, 

	@MedianCW1=1, 
	@MedianCW2=1, 
	@MedianExam=1, 
	@MedianOverall=1,

	@SDCW1=1,
	@SDCW2=1,
	@SDExam=1,
	@SDOverall=1,

	@0_39CW1=1,
	@0_39CW2=1,
	@0_39Exam=1,
	@0_39Overall=1,

	@40_69CW1=1,
	@40_69CW2=1,
	@40_69Exam=1,
	@40_69Overall=1,

	@70_89CW1=1,
	@70_89CW2=1,
	@70_89Exam=1,
	@70_89Overall=1,

	@90_CW1=1,
	@90_CW2=1,
	@90_Exam=1,
	@90_Overall=1

select* from Course
select* from assignCourse

--end insert new CMR by CL


-- ASSIGN COURSE

drop procedure usp_getCourseID
go
create procedure usp_getCourseID

as 
begin 
	SELECT top 1 Course_id FROM Course ORDER BY Course_id DESC
end
go	
select * from Course
go
select * from CL;
select * from CM;



drop procedure usp_assignCourseToCL
go
create procedure usp_assignCourseToCL
@course_id nvarchar(20),
@cl_id nvarchar(20),
@cm_id nvarchar (20),
@fac_id nvarchar (20)
as
begin
	insert into assignCourse values(@course_id, @cl_id, @cm_id, @fac_id);
end
go
--exec usp_assignCourseToCL 'comp_1640', 'cl001', 'cm003';
--go
select * from assignCourse;
select * from Course;
go

-- End ASSIGN COURSE



---CHI Proc abc

select DISTINCT Course.Course_id,Course.COURSE_NAME,Course.START_TIME,Course.END_TIME from Course,CL where CL.CL_ID='cl001'
go
drop procedure usp_getMail
go
create procedure usp_getMail 
@Course_id nvarchar(20)
as
begin
select CMR_Users.mail from assignCourse,DLT,CMR_Users where assignCourse.Course_id=@Course_id and assignCourse.faculty_id=DLT.faculty_id 
and DLT.User_id=CMR_Users.User_id
end
go
--exec usp_getMail @Course_id='comp_1663'

--end

drop procedure getCMR_unApproved
go
create procedure getCMR_unApproved
as
begin
select * from CMR where comments is null
end
go
exec getCMR_unApproved
SELECT top 1 (Course_id) AS ID FROM Course ORDER BY Course_id asc
select * from assignCourse


go
select * from Course
go
drop procedure setApprove
go
create procedure setApprove
@comments text
as 
begin
update CMR
set comments='approved',Action='done'
where comments is null
end
go

drop procedure getCMR_Static
go
create procedure getCMR_Static
as begin
select * from CMR where static is null
end
go
exec getCMR_Static