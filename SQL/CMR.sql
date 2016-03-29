drop database CMR;
go
create database CMR;
go
use CMR;
go
CREATE TABLE Role
  ( 
	Role_id INT PRIMARY KEY identity(1,1),
	Role_type nvarchar(30)--admin/CL/DLT
  );
 go
CREATE TABLE CMR_Users
  (
    User_id   INT PRIMARY KEY identity(1,1),
    User_name nvarchar(20),
	uPassword nvarchar(60),
	SessionId varchar(200),
    gender    CHAR CONSTRAINT user_check CHECK (gender IN ('F','M')),
    DOB       nvarchar(10),
    Role_id   INT,
    address   nvarchar(100),
    phone     nvarchar(20),
    mail      nvarchar(100),
    FOREIGN KEY (Role_id) REFERENCES Role(Role_id)
  );
  go
CREATE TABLE Administrators
  (
    Admin_id INT PRIMARY KEY identity(1,1),
    User_id  INT,
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id)
  );
 go
 CREATE TABLE CL
  (
    CL_id       nvarchar(20) primary key,
    User_id     INT,
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id)
  );
  go
  CREATE TABLE CM
  (
    CM_id       nvarchar(20) primary key,
    User_id     INT,
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
  );
  go
CREATE TABLE Course
  (
    Course_id   nvarchar(20) PRIMARY KEY,
    Course_name nvarchar(100),
	Description nvarchar(max),
    start_time  nvarchar(30),
    end_time    nvarchar(30),
	CL_id		nvarchar(20),
	CM_id       nvarchar(20),
	FOREIGN KEY (CL_id) REFERENCES CL(CL_id),
	FOREIGN KEY (CM_id) REFERENCES CM(CM_id)
  );
  go
CREATE TABLE faculty
  (
    faculty_id   nvarchar(20) PRIMARY KEY,
    faculty_name nvarchar(100),
    class_id     nvarchar(20),
    Years   nvarchar(30)
  );
  go
  CREATE TABLE CourseAssignByFac
  (
	id int primary key identity(1,1),
	Course_id nvarchar(20),
	faculty_id nvarchar(20)
  );
  go
CREATE TABLE PVC
  (
    User_id     INT ,
    faculty_id  nvarchar(20),
    CONSTRAINT pk_PVC PRIMARY KEY (User_id, faculty_id),
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
  );
  go
CREATE TABLE DLT
  (
    DLT_id      nvarchar(20),
    User_id     INT,
    faculty_id  nvarchar(20),
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
  );
  go
CREATE TABLE CMR
  (
    CMR_id       INT PRIMARY KEY identity(1,1),
    AcademicSession         nvarchar(100),
    Course_id    nvarchar(20),
	CL_id        nvarchar(20),
    static       nvarchar(20),
	Studentcount nvarchar(50),
	comments text,
	Action text,
	FOREIGN KEY (CL_id) REFERENCES CL(CL_id),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
  );

Create table StatisticalData(
	id INT PRIMARY KEY identity,
	CMR_id INT,
	DataName varchar(10),
	Mean text,
	Median text,
	StandardDeviation text,
	FOREIGN KEY (CMR_id) REFERENCES CMR(CMR_id)
);

create table GradeDistributionData(
	id INT PRIMARY KEY identity,
	CMR_id INT,
	grade float,
	FOREIGN KEY (CMR_id) REFERENCES CMR(CMR_id)
);
drop table assignCourse
create table assignCourse(
	asId int primary key identity,
	Course_id nvarchar(20),
	CL_id nvarchar(20),
	CM_id nvarchar (20),
	start_time nvarchar(30),
	end_time nvarchar(30),
	foreign key (CL_id) references CL(CL_id),
	foreign key (CM_id) references CM(CM_id),
	foreign key (Course_id)references Course(Course_id)
)


  

--INSERT DATABASE HERE
go
insert into Course(Course_id, Course_name, Description, start_time, end_time) values('comp_1640','Enterprise Web Software','description','01-10-2016','04-14-2016');
insert into Course(Course_id, Course_name, Description, start_time, end_time) values('comp_1649','interaction design','description','01-10-2016','04-28-2016');
insert into Course(Course_id, Course_name, Description, start_time, end_time) values('comp_1661','Application Development for Mobile Devices','description','01-10-2016','04-15-2016');

go
insert into faculty values ('fac001', 'Nguyen Thuy Duong', 'B14', '2015-2016');
insert into faculty values ('fac002', 'Jaya', 'B14', '2015-2016');
insert into faculty values ('fac003', 'Ngo Tung Son', 'B14', '2015-2016');

go
insert into Role values
('Admin'), 
('Course Leader'), 
('CM'),
('DLT');

go
insert into CMR_Users (User_name, uPassword, gender, DOB, Role_id, address, phone, mail) values
('Admin', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),--admin
('Pham Thuy Duong', '21232f297a57a5a743894a0e4a801fc3','F','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),--CL
('Jaya', '21232f297a57a5a743894a0e4a801fc3','F','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),--CL
('Ngo Tung Son', '21232f297a57a5a743894a0e4a801fc3','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),--CL
('CM', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',3,'asadsda','0123456789','sdaas@asd.com'),--CM
('DLT', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),--DLT
('Mr.7', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),
('Mr.H', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),
('Mr.I', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),
('Mr.J', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),
('Mr.K', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),
('Mr.L', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),
('Mr.M', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com'),
('Mr.N', '21232f297a57a5a743894a0e4a801fc3', 'M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
 
go
insert into Administrators values (1);
select*from CMR_Users

go
insert into CL values('cl001',2);
insert into CL values('cl002',3);
insert into CL values('cl003',4);

insert into CM values('cm001',5);
insert into CM values('cm002',6);
insert into CM values('cm003',7);

go
insert into PVC values (2, 'fac001');
insert into PVC values (3, 'fac002');
insert into PVC values (4, 'fac003');

go
insert into DLT values('DLT_01', 5, 'fac001');
insert into DLT values('DLT_02', 6, 'fac001');
insert into DLT values('DLT_03', 7, 'fac001');
insert into DLT values('DLT_04', 8, 'fac001');
insert into DLT values('DLT_05', 9, 'fac001');
insert into DLT values('DLT_06', 10, 'fac001');

go
insert into CMR values ('AcademicSession1', 'comp_1640', 'cl001', 'static 1', '25', 'comments 1', 'Action1');
insert into CMR values ('AcademicSession2', 'comp_1649', 'cl002', 'static 2', '23', 'comments 2', 'Action2');
insert into CMR values ('AcademicSession3', 'comp_1661', 'cl003', 'static 3', '22', 'comments 3', 'Action3');

--END INSERT DATABASE
