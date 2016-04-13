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
@studentCount nvarchar(50)
as
begin
	insert into CMR(AcademicSession, Course_id, CL_id, Studentcount) 
	values (@academicSession, @course_id, @cl_id, @studentCount);
end
go
--exec usp_addNewCMR @academicSession='testProc',@course_id='comp_1662', @cl_id='cl001', @studentCount='25'
select* from Course
select* from assignCourse

go
drop procedure usp_addStatisticalData
go
create procedure usp_addStatisticalData
	@cwDataID int,
	@mean text,
	@median text,
	@standardDeviation text
	--CW1 varchar(10),
	--CW2 varchar(10),
	--Exam varchar(10),
	--Overall varchar(10),
as
begin
	Declare @lastIDInCMR int = (SELECT TOP 1 (CMR_id) AS ID FROM CMR ORDER BY CMR_id DESC);
	insert into StatisticalData 
	values (@lastIDInCMR, @cwDataID, @mean, @median, @standardDeviation);
end
go
--exec usp_addStatisticalData @cwDataID = '1', @mean = '56', @median = '80', @standardDeviation = 'jrj';

go
drop procedure usp_addGrDistriData
go
create procedure usp_addGrDistriData	
	@cwDataID int,
	@0_39 float,
	@40_69 float,
	@70_89 float,
	@90plus float
as
begin
	Declare @CMR_id int = (SELECT TOP 1 (CMR_id) AS ID FROM CMR ORDER BY CMR_id DESC);
	insert into GradeDistributionData 
	values (@CMR_id, @cwDataID, @0_39, @40_69, @70_89, @90plus);
end
go
--exec usp_addGrDistriData @cwDataID = '1', @0_39 = '23', @40_69 = '55', @70_89 = '55', @90plus = '66';
go
drop procedure selectAll;
go
create procedure selectAll
as
begin
	select * from CMR;
	select * from StatisticalData;
	select * from GradeDistributionData;
end
go
--exec selectAll;

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
--exec usp_getMail @Course_id='comp_1649'

--end

SELECT top 1 (Course_id) AS ID FROM Course ORDER BY Course_id asc
select * from assignCourse


go
select * from Course
go

select * from CMR where comments is null
update CMR
set comments='',Action=''
where comments='hlloo'